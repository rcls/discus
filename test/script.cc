#include "spice_load.h"
#include "state.h"

#include <getopt.h>

static bool output_hex;
static bool output_rom;
static bool check_flag;
static int comp_num;
static const char * verify_path;

struct Script1 : public state_t {
    void go();
};


void Script1::go()
{
    stack[0] = NULL;
    executed = 0;

    XOR(A);
start:
    ADD(2);
    INC(A);
    JP(NZ,start);
    RET();
}


[[ noreturn ]] static void usage(const char * argv0, FILE * f, int r)
{
    fprintf(f, "Usage: %s [-n <component>] [-H] [-R] [-V <spice>] [-C]\n",
            argv0);
    exit(r);
}

static void process_opts(int argc, char * const argv[])
{
    while (1)
        switch (getopt(argc, argv, "n:HRV:C")) {
        case 'n':
            comp_num = strtoul(optarg, NULL, 0);
            break;
        case 'H':
            output_hex = true;
            break;
        case 'R':
            output_rom = true;
            break;
        case 'V':
            verify_path = optarg;
            break;
        case 'C':
            check_flag = true;
            break;
        case 'h':
            usage(argv[0], stdout, EXIT_SUCCESS);
        case '?':
            usage(argv[0], stderr, EXIT_FAILURE);
        case -1:
            return;
        default:
            abort();
        }
}


int main(int argc, char * argv[])
{
    process_opts(argc, argv);

    Script1 script;
    script.extract_branches();

    if (output_hex)
        script.assemble(print_emitter_t(stdout));

    if (output_rom)
        script.assemble(munge_emitter_t(stdout, ""));

    if (check_flag)
        step_check_t(&script).run_check();

    if (verify_path)
        script.verify_spice(verify_path);

    return 0;
}
