#include <err.h>
#include <stdio.h>
#include <string.h>

#include <assert.h>
#include <map>
#include <stdlib.h>
#include <string>
#include <vector>

static long num_vars = 0;
static long num_points = 0;
static long num_samples;

static std::map<std::string, int> variables;
static std::vector<double> raw_values;

static const double QUANTUM = 5e-6;
static const int SKIP = 2;

static std::vector<double> timestamps;
static std::vector<unsigned> indexes;

static std::vector<double> extract_raw_column(const char * name)
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


static std::vector<bool> extract_signal(const char * name)
{
    const auto raw = extract_raw_column(name);
    std::vector<bool> sig(num_samples);
    for (int i = 0; i != num_samples; ++i)
        sig[i] = raw[indexes[i]] > 1.65;
    // Now check that the signal levels are stable between 0.5 QUANTUM and 0.9
    // QUANTUM...
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


static std::vector<unsigned char> extract_number4(
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


static void read_var_list(FILE * f)
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
        variables.insert(std::make_pair(name, num));
        free(name);
        free(type);
    }
    free(line);
}

int main(int argc, const char ** argv)
{
    char * line = NULL;
    size_t linesize = 0;
    while (true) {
        size_t len = getline(&line, &linesize, stdin);
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
            read_var_list(stdin);
        else if (strncmp(line, "Binary:", 7) == 0)
            break;
    }
    free(line);

    raw_values.resize(num_vars * num_points);
    if (fread(&raw_values[0], num_vars * num_points * sizeof(double),
              1, stdin) != 1)
        errx(1, "Failed to read data block");

    timestamps = extract_raw_column("time");

    // Validate the timestamps.  Firstly, they should start at < FINE_STEP
    // and go up by at most FINE_STEP.
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
    if (last - num_samples * QUANTUM >= 0.7 * QUANTUM)
        ++num_samples;
    //printf("last = %e, num_samples = %li\n", last, num_samples);

    double last_remainder = 0;
    indexes.resize(num_samples);
    for (int i = 0; i != num_points; ++i) {
        int this_item = timestamps[i] / QUANTUM;
        double remainder = timestamps[i] - this_item * QUANTUM;
        if (last_remainder < 0.7 * QUANTUM && remainder >= 0.7 * QUANTUM) {
            //printf("%e %i\n", timestamps[i], this_item);
            assert(this_item < num_samples);
            indexes[this_item] = i;
        }
        last_remainder = remainder;
    }

    // Now extract each individual digital variable.
    const auto c      = extract_signal("c");
    const auto c_hash = extract_signal("c#");
    const auto count  = extract_signal("count");
    const auto ci     = extract_signal("ci");
    const auto w      = extract_signal("w");
    const auto we     = extract_signal("we");

    const auto r = extract_number4("r0", "r1", "r2", "r3");
    const auto a = extract_number4("a0", "a1", "a2", "a3");
    const auto a_hash = extract_number4("a0#", "a1#", "a2#", "a3#");
    const auto b = extract_number4("b0", "b1", "b2", "b3");
    const auto q = extract_number4("q0", "q1", "q2", "q3");

    // Check that clocks alternate.
    for (int i = SKIP; i != num_samples; ++i)
        if (c[i] == c_hash[i])
            errx(1, "Clocks not complementary at %i", i);

    for (int i = SKIP; i != num_samples; ++i)
        if (c[i] == c[i-1])
            errx(1, "Clocks not flipping at %i", i);

    // Basic arithmetic.
    for (int i = SKIP; i != num_samples; ++i) {
        if (a[i] + a_hash[i] != 15)
            errx(1, "a# not complement at %i", i);
        if (q[i] != (a[i] + b[i] + ci[i]) % 16)
            errx(1, "q not sum at %i", i);
        printf("%2i+%2i+%i = %i\n", a[i], b[i], ci[i], q[i]);
        if (w[i] == count[i])
            errx(1, "w and count not complementary at %i", i);
        if (we[i] != (c_hash[i] & w[i]))
            errx(1, "we not expected at %i", i);
    }

    // Count and w do not change on falling edge.
    for (int i = SKIP; i != num_samples; ++i)
        if (c_hash[i] && count[i] != count[i-1])
            errx(1, "count changes on rising edge %i", i);

    // Counter.
    for (int i = SKIP + 1; i != num_samples; ++i) {
        bool cnt = c[i] && count[i-1];
        if (r[i] != (r[i-1] + cnt) % 16)
            errx(1, "r not correct at %i", i);
    }

    // Now check the memory behaviour.
    int memory[4];
    for (int i = 0; i != 4; ++i)
        memory[i] = -1;

    for (int i = SKIP; i != num_samples; ++i) {
        int index_a = r[i] & 3;
        int index_b = r[i] >> 2;
        if (we[i]) {
            printf("Write memory[%i] = %i at %i\n", index_a, q[i-1], i);
            //assert(r[i] == r[i-1]);
            memory[index_a] = q[i-1];
        }
        //printf("Index a %i b %i\n", index_a, index_b);
        if (memory[index_a] >= 0 && memory[index_a] != a[i])
            errx(1, "a is %i not expected %i at %i", a[i], memory[index_a], i);
        if (memory[index_b] >= 0 && memory[index_b] != b[i])
            errx(1, "b is %i not expected %i at %i", b[i], memory[index_b], i);
        if (memory[index_a] < 0) {
            printf("Infer memory[%i] = %i at %i\n", index_a, a[i], i);
            memory[index_a] = a[i];
        }
        if (memory[index_b] < 0) {
            printf("Infer memory[%i] = %i at %i\n", index_b, b[i], i);
            memory[index_b] = b[i];
        }
    }

    return 0;
}
