#include "spice_load.h"
#include "state.h"

#include <err.h>
#include <getopt.h>

static bool output_hex;
static bool output_rom;
static bool check_flag;
static int comp_num;
static const char * verify_path;

struct Script1 : public state_t {
    void go();

    void verify_spice(const char * path);

    template<typename T>
    bool verify(T & expected, T actual, const char * name);
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


struct byte_emitter_t : emitter_t
{
    byte_emitter_t(unsigned char c[256]) :
        code(c) { }
    void emit_byte(int address, int byte) {
        code[address] = byte;
    }
    unsigned char * const code;
};


struct step_check_t : state_t, emitter_t {
    step_check_t(state_t * o) : orig(o) {
        byte_emitter_t emit(code);
        assemble(byte_emitter_t(code));
    }
    void verify(int o, int f, const char * name);
    void verify();
    void emit_byte(int address, int byte);
    void emit_two(int address, int b1, int b2);
    state_t * const orig;
    unsigned char code[256];

    void run_check();

    void go(int n) {}
};


void step_check_t::verify(int o, int f, const char * name)
{
    if (o != f)
        errx(1, "%s mismatch src 0x%02x, bin 0x%02x at step %i pc 0x%02x\n",
             name, o, f, orig->executed, pc);
}


void step_check_t::verify()
{
    verify(orig->reg[A], reg[A], "A");
    verify(orig->reg[X], reg[X], "X");
    verify(orig->reg[Y], reg[Y], "Y");
    verify(orig->reg[U], reg[U], "U");
    verify(orig->flag_Z, flag_Z, "Z");
    verify(orig->flag_C, flag_C, "C");
    if (memcmp(orig->mem, mem, 256) != 0)
        for (int i = 0; i != 256; ++i) {
            char name[8];
            snprintf(name, sizeof name, "mem[0x%02x]", i);
            verify(orig->mem[i], mem[i], name);
        }
}


void step_check_t::run_check()
{
    orig->assemble(0, byte_emitter_t(code));
    zero_init();
    orig->zero_init();
    orig->emitter = this;
    orig->straight_through = false;
    orig->go(0);
    verify();
}


void step_check_t::emit_byte(int address, int byte)
{
    verify();
    step(code[pc]);
}

void step_check_t::emit_two(int address, int b1, int b2)
{
    verify();
    step(code[pc]);
    step(code[pc]);
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


template<typename T>
bool Script1::verify(T & expected, T actual, const char * name)
{
    if (expected == actual)
        return true;

    fprintf(stderr, "Verify mismatch @%#02x %s = %#02x expected %#02x\n",
            pc, name, actual, expected);
    return false;
}


void Script1::verify_spice(const char * path)
{
    FILE * f = fopen(verify_path, "r");
    if (!f)
        err(1, "fopen %s", verify_path);
    spice_load spice(f, 10e-6, 4e-6, false);
    //auto Ohash = spice.extract_byte("o", "#");
    auto AA = spice.extract_byte("a");
    auto XX = spice.extract_byte("vx_s", "c");
    auto YY = spice.extract_byte("vy_s", "c");
    auto UU = spice.extract_byte("vu_s", "c");
    auto PP = spice.extract_byte("p");
    const auto FC = spice.extract_signal("fc");
    const auto FZ = spice.extract_signal("fz");
    auto II = spice.extract_byte("i", "_c");

    unsigned char code[256];
    assemble(byte_emitter_t(code));

    // Load the main state.  The first instruction to check is at sample 2,
    // pc=0.
    reg[A] = AA[2];
    reg[X] = XX[2];
    reg[Y] = YY[2];
    reg[U] = UU[2];
    flag_C = FC[2];
    flag_Z = FZ[2];
    kreg = -1;
    pc = 0;
    for (int i = 3; i < spice.num_samples; ++i) {
        step(code[pc]);
        verify(reg[A], AA[i], "A");
        verify(reg[X], XX[i], "X");
        verify(reg[Y], YY[i], "Y");
        verify(reg[U], UU[i], "U");
        verify(flag_C, FC[i], "C");
        verify(flag_Z, FZ[i], "Z");
        if (!verify(pc, (int) PP[i], "PC"))
            abort();                    // No point in carrying on.
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
