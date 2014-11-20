#include "script.h"
#include "state.h"

#include <getopt.h>

static int comp_num;

[[ noreturn ]] static void usage(const char * argv0, FILE * f, int r)
{
    fprintf(f, "Usage: %s [-n <component>] [-H] [-R] [-V <spice>] [-C]\n",
            argv0);
    exit(r);
}


void sim_main(state_t && program, int argc, char * argv[])
{
    while (1)
        switch (getopt(argc, argv, "n:HRV:C")) {
        case 'n':
            comp_num = strtoul(optarg, NULL, 0);
            break;
        case 'H':
            program.extract_branches();
            program.assemble(print_emitter_t(stdout));
            break;
        case 'R':
            program.extract_branches();
            program.assemble(munge_emitter_t(stdout, ""));
            break;
        case 'V':
            program.extract_branches();
            program.verify_spice(optarg);
            break;
        case 'C':
            program.extract_branches();
            step_check_t(&program).run_check();
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
