#include "script.h"
#include "state.h"

#include <getopt.h>

static int comp_num;

[[noreturn]] static void usage(const char * argv0, FILE * f, int r)
{
    fprintf(f, "Usage: %s [-n <component>] [-H] [-F] [-M] [-R] [-X] [-V <spice>] [-C]\n",
            argv0);
    fprintf(f, "\t-H : Assemble to hex\n");
    fprintf(f, "\t-F : Assemble to fpga upload\n");
    fprintf(f, "\t-X : Assemble to verilog hex\n");
    fprintf(f, "\t-X : Assemble to board resistors\n");
    fprintf(f, "\t-V <spice> : Verify against spice run\n");
    fprintf(f, "\t-T : Print run timing\n");
    fprintf(f, "\t-C : Consistency check\n");
    exit(r);
}

struct verilog_print_emitter_t : emitter_t {
    verilog_print_emitter_t(FILE * f) : file(f) { }
    void emit_byte(int address, int byte) {
        fprintf(file, "8'h%02x,\n", byte);
    }

    void emit_two(int address, int b1, int b2) {
        fprintf(file, "8'h%02x, 8'h%02x,\n", b1, b2);
    }

    FILE * file;
};


struct fpga_print_emitter_t : emitter_t {
    fpga_print_emitter_t(FILE * f, char op) : file(f), oper(op) { }
    ~fpga_print_emitter_t() {
        if (next >= 0)
            fprintf(file, "\n\377");
    }

    void emit_byte(int address, int byte) {
        if (address % 16 == 0 || address != next) {
            if (next >= 0)
                fprintf(file, "\n\377");
            fprintf(file, "%02x=", address);
        }
        fprintf(file, "%02x%c", byte, oper);
        next = address + 1;
    }

    FILE * file;
    int next = -1;
    char oper;
};


struct memfile_emitter_t : emitter_t {
    void emit_byte(int address, int byte) {
        printf("%02x\n", byte);
    }
};


void sim_main(state_t && program, int argc, char * argv[])
{
    while (1)
        switch (getopt(argc, argv, "n:HFMRXV:CTh")) {
        case 'n':
            comp_num = strtoul(optarg, NULL, 0);
            break;
        case 'H':
            program.extract_branches();
            program.assemble(print_emitter_t(stdout));
            break;
        case 'F': {
            program.extract_branches();
            program.assemble(fpga_print_emitter_t(stdout, ';'));
            fpga_print_emitter_t mem(stdout, '!');
            for (int i = 0; i < 256; ++i)
                if (program.mem[i])
                    mem.emit_byte(i, program.mem[i]);

            break;
        }
        case 'X':
            program.extract_branches();
            program.assemble(verilog_print_emitter_t(stdout));
            break;
        case 'R':
            program.extract_branches();
            program.assemble(munge_emitter_t(stdout, ""));
            break;
        case 'M':
            program.extract_branches();
            program.assemble(memfile_emitter_t());
            break;
        case 'V':
            program.extract_branches();
            program.verify_spice(optarg);
            break;
        case 'T':
            program.extract_branches();
            program.executed = 0;
            program.straight_through = false;
            program.go();
            printf("executed %i\n", program.executed);
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
