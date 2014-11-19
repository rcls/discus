#ifndef SPICE_LOAD_H_
#define SPICE_LOAD_H_

#include <map>
#include <string>
#include <vector>

static const int SKIP = 2;

struct spice_load {

    const double QUANTUM;
    const double SAMPLE_POINT;
    const bool STABILITY_CHECK;

    long num_vars = 0;
    long num_points = 0;
    long num_samples;

    std::map<std::string, int> variables;
    std::vector<double> raw_values;

    std::vector<double> timestamps;
    std::vector<unsigned> indexes;

    spice_load(double q) : spice_load(q, q * 0.7, true) { }
    spice_load(double q, double sp, bool st);
    spice_load(FILE * f, double q) : spice_load(f, q, q * 0.7, true) { }
    spice_load(FILE * f, double q, double sp, bool st);

    std::vector<double> extract_raw_column(const char * name);
    std::vector<bool> extract_signal(const char * name);
    std::vector<unsigned char> extract_number4(
        const char * n0, const char * n1, const char * n2, const char * n3);

private:
    void read_var_list(FILE * f);
};

#endif
