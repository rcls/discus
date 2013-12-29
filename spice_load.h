#ifndef SPICE_LOAD_H_
#define SPICE_LOAD_H_

#include <map>
#include <string>
#include <vector>

static const double QUANTUM = 5e-6;
static const int SKIP = 2;

struct spice_load {

    long num_vars = 0;
    long num_points = 0;
    long num_samples;

    std::map<std::string, int> variables;
    std::vector<double> raw_values;

    std::vector<double> timestamps;
    std::vector<unsigned> indexes;

    spice_load();
    spice_load(FILE * f);

    std::vector<double> extract_raw_column(const char * name);
    std::vector<bool> extract_signal(const char * name);
    std::vector<unsigned char> extract_number4(
        const char * n0, const char * n1, const char * n2, const char * n3);

private:
    void read_var_list(FILE * f);
};

#endif
