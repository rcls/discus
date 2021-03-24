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

    spice_load(int argc, char * const argv[], double q) :
        spice_load(parse_args(argc, argv), q) {}
    spice_load(FILE * f, double q) : spice_load(f, q, q * 0.7, true) { }
    spice_load(FILE * f, double q, double sp, bool st);

    std::vector<double> extract_raw_column(const char * name);
    std::vector<bool> extract_signal(const char * name);
    std::vector<uint8_t> extract_byte(const char * n, const char * s = "");

private:
    void read_var_list(FILE * f);
    static FILE * parse_args(int argc, char * const argv[]);
};

#endif
