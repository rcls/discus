#include "spice_load.h"

#include <assert.h>
#include <err.h>
#include <sstream>
#include <string.h>

spice_load::spice_load(double q, double sp, bool st) :
    QUANTUM(q),
    SAMPLE_POINT(sp),
    STABILITY_CHECK(st),
    num_vars(0),
    num_points(0)
{
}

std::vector<double> spice_load::extract_raw_column(const char * name)
{
    auto p = variables.find(name);
    if (p == variables.end())
        errx(1, "Did not find '%s'", name);
    int col = p->second;
    std::vector<double> r(num_points);
    for (int i = 0; i != num_points; ++i)
        r[i] = raw_values[i * num_vars + col];
    return r;
}


std::vector<bool> spice_load::extract_signal(const char * name)
{
    const auto raw = extract_raw_column(name);
    std::vector<bool> sig(num_samples);
    for (int i = 0; i != num_samples; ++i)
        sig[i] = raw[indexes[i]] > 1.65;
    // Now check that the signal levels are stable between 0.5 QUANTUM and 0.9
    // QUANTUM...
    if (!STABILITY_CHECK)
        return sig;

    for (int i = 0; i != num_points; ++i) {
        int q = timestamps[i] / QUANTUM;
        double remainder = timestamps[i] - q * QUANTUM;
        if (remainder < 0.5 || remainder > 0.9 || q < SKIP)
            continue;

        if (sig[q] && raw[i] < 3)
            errx(1, "At quantum %i, high signal droop %e", q + 1, raw[i]);
        if (!sig[q] && raw[i] > 0.3)
            errx(1, "At quantum %i, low signal bounce %e", q + 1, raw[i]);
    }
    return sig;
}


std::vector<unsigned char> spice_load::extract_number4(
    const char * n0, const char * n1, const char * n2, const char * n3)
{
    const auto v0 = extract_signal(n0);
    const auto v1 = extract_signal(n1);
    const auto v2 = extract_signal(n2);
    const auto v3 = extract_signal(n3);
    std::vector<unsigned char> r(num_samples);
    for (int i = 0; i != num_samples; ++i)
        r[i] = v0[i] + v1[i] * 2 + v2[i] * 4 + v3[i] * 8;
    return r;
}


std::vector<unsigned char> spice_load::extract_byte(const char * p,
                                                    const char * s)
{
    std::vector<unsigned char> r(num_samples);
    for (int i = 0; i != 8; ++i) {
        int bit = 1 << i;
        std::ostringstream name;
        name << p << i << s;
        const auto v = extract_signal(name.str().c_str());
        for (int j = 0; j < num_samples; ++j)
            if (v[j])
                r[j] |= bit;
    }
    return r;
}


void spice_load::read_var_list(FILE * f)
{
    char * line = NULL;
    size_t linesize = 0;
    for (long i = 0; i < num_vars; ++i) {
        ssize_t len = getline(&line, &linesize, f);
        if (len < 0)
            errx(1, "Failed to read variables");
        int num;
        char * name;
        char * type;
        if (sscanf(line, "%u%ms%ms", &num, &name, &type) != 3)
            errx(1, "Dodgy variable line: %s", line);
        if (num != i)
            errx(1, "Out of sequence variable line: %s", line);
        // Rewrite v(x) to x.
        int l = strlen(name);
        std::string n = name;
        if (name[0] == 'v' && name[1] == '(' && name[l-1] == ')')
            n = std::string(name + 2, l - 3);
        variables.emplace(n, num);
        free(name);
        free(type);
    }
    free(line);
}


spice_load::spice_load(FILE * f, double q, double sp, bool st) :
    spice_load(q, sp, st)
{
    char * line = NULL;
    size_t linesize = 0;
    while (true) {
        size_t len = getline(&line, &linesize, f);
        if (len <= 0)
            errx(1, "Unexpected eof");
        if (!len || strlen(line) != len || line[len-1] != '\n'
            || strchr(line, ':') == NULL)
            errx(1, "Dodgy line: %s", line);
        if (strncmp(line, "Title: ", 7) == 0)
            ;
        else if (strncmp(line, "Date: ", 6) == 0)
            ;
        else if (strncmp(line, "No. Variables: ", 15) == 0)
            num_vars = strtoul(line + 15, NULL, 0);
        else if (strncmp(line, "No. Points: ", 12) == 0)
            num_points = strtoul(line + 12, NULL, 0);
        else if (strncmp(line, "Variables:", 10) == 0)
            read_var_list(f);
        else if (strncmp(line, "Binary:", 7) == 0)
            break;
    }
    free(line);

    raw_values.resize(num_vars * num_points);
    if (fread(&raw_values[0], num_vars * num_points * sizeof(double),
              1, f) != 1)
        errx(1, "Failed to read data block");

    timestamps = extract_raw_column("time");

    // Validate the timestamps.
    double last = 0;
    for (int i = 0; i != num_points; ++i) {
        if (timestamps[i] - last > 0.21 * QUANTUM)
            errx(1, "Timestep #%i is too large: %e %e\n",
                 i, last, timestamps[i]);
        if (timestamps[i] < last)
            errx(1, "Time goes backwards at %i: %e %e\n",
                 i, last, timestamps[i]);
        last = timestamps[i];
    }

    // Now select the indexes to use for sampling; the sample is taken every
    // time we cross 0.7*QUANTUM.  We will ignore the first two samples.
    num_samples = last / QUANTUM;
    if (last - num_samples * QUANTUM >= SAMPLE_POINT)
        ++num_samples;
    //printf("last = %e, num_samples = %li\n", last, num_samples);

    double last_remainder = 0;
    indexes.resize(num_samples);
    for (int i = 0; i != num_points; ++i) {
        int this_item = timestamps[i] / QUANTUM;
        double remainder = timestamps[i] - this_item * QUANTUM;
        if (last_remainder < SAMPLE_POINT && remainder >= SAMPLE_POINT) {
            // printf("%e %i\n", timestamps[i], this_item);
            assert(this_item < num_samples);
            indexes[this_item] = i;
        }
        last_remainder = remainder;
    }
}
