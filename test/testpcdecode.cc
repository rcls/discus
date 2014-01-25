#include <assert.h>
#include <err.h>
#include <stdio.h>

#include "spice_load.h"

int main()
{
    spice_load S(stdin, 10e-6);

    const auto O2I = S.extract_signal("o2#");
    const auto O3I = S.extract_signal("o3#");
    const auto O4I = S.extract_signal("o4#");
    const auto O5I = S.extract_signal("o5#");
    const auto O6I = S.extract_signal("o6#");
    const auto O7I = S.extract_signal("o7#");
    const auto PO = S.extract_signal("po");
    const auto FZ = S.extract_signal("fz");
    const auto FC = S.extract_signal("fc");
    const auto JUMP = S.extract_signal("jump");
    const auto RET = S.extract_signal("ret");
    const auto PUSH = S.extract_signal("push");
    const auto INC = S.extract_signal("inc");
    const auto FLAG = S.extract_signal("flag_p");
    const auto CONDI = S.extract_signal("cond#_p");

    for (int i = 0; i != S.num_samples; ++i) {
        int opcode = !O7I[i] * 128 + !O6I[i] * 64 + !O5I[i] * 32
            +        !O4I[i] * 16  + !O3I[i] * 8  + !O2I[i] * 4;
        bool po = PO[i];
        bool fz = FZ[i];
        bool fc = FC[i];

        bool jump = JUMP[i];
        bool ret = RET[i];
        bool push = PUSH[i];
        bool inc = INC[i];

        bool jump_or_call_ins = po && (opcode & 0xc0) == 0;
        bool ret_ins = (opcode & 0xe0) == 0xe0;

        bool flag;
        bool taken;
        switch (opcode & 0x1c) {
        case 0x00:
            flag = true;
            taken = true;
            break;
        case 0x10:
            flag = !fc;
            taken = !fc;
            break;
        case 0x14:
            flag = !fc;
            taken = fc;
            break;
        case 0x18:
            flag = !fz;
            taken = !fz;
            break;
        case 0x1c:
            flag = !fz;
            taken = fz;
            break;
        default:
            flag = !!(opcode & 4);
            taken = false;
        }

        assert(taken == (flag ^ !!(opcode & 4)));

        if (flag != FLAG[i])
            errx(1, "Flag %i/flag %i mismatch at %i (%02x C%i Z%i)",
                 flag, FLAG[i], i, opcode, fc, fz);

        if (taken == CONDI[i])
            errx(1, "Taken %i/cond# %i mismatch at %i (%02x C%i Z%i)",
                 taken, CONDI[i], i, opcode, fc, fz);

        if (!taken || (!jump_or_call_ins && !ret_ins)) {
            if (!inc)
                errx(1, "Nothing but !inc at %i (%02x)", i, opcode);
            if (jump)
                errx(1, "Nothing but jump at %i", i);
            if (push)
                errx(1, "Nothing but push at %i", i);
            if (ret)
                errx(1, "Nothing but ret at %i", i);
            continue;
        }

        assert(!jump_or_call_ins || !ret_ins);

        if (ret_ins) {
            if (inc)
                errx(1, "Return but inc at %i", i);
            if (jump)
                errx(1, "Return but jump at %i", i);
            if (push)
                errx(1, "Return but push at %i", i);
            if (!ret)
                errx(1, "Return but !ret at %i", i);
            continue;
        }

        if (inc)
            errx(1, "Jump but inc at %i", i);
        if (!jump)
            errx(1, "Jump but !jump at %i", i);
        if ((opcode & 0x20) && push)
            errx(1, "Call but !push at %i", i);
        if (!(opcode & 0x20) && !push)
            errx(1, "Non call but push at %i", i);
        if (ret)
            errx(1, "Jump but ret at %i\n", i);
    }
    fprintf(stderr, "Tested: %zi\n", S.num_samples);
    return 0;
}