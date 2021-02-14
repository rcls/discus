#include <assert.h>
#include <err.h>
#include <stdio.h>

#include "spice_load.h"

int main(int argc, char * const argv[])
{
    spice_load S(argc, argv, 5e-6);

    const auto O2 = S.extract_signal("o2");
    const auto O3 = S.extract_signal("o3");
    const auto O4 = S.extract_signal("o4");
    const auto O5 = S.extract_signal("o5");
    const auto O6 = S.extract_signal("o6");
    const auto O7 = S.extract_signal("o7");
    const auto OJumpi = S.extract_signal("ojump#");
    const auto CO = S.extract_signal("co");
    const auto ZOi = S.extract_signal("zo#");

    const auto JUMP = S.extract_signal("jump");
    const auto RET = S.extract_signal("ret");
    const auto PUSHi = S.extract_signal("push#");
    const auto INC = S.extract_signal("inc");

    for (int i = 0; i != S.num_samples; ++i) {
        int opcode = O7[i] * 128 + O6[i] * 64 + O5[i] * 32
            +        O4[i] * 16  + O3[i] * 8  + O2[i] * 4;
        bool ojump = !OJumpi[i];
        bool co = CO[i];
        bool zo = !ZOi[i];

        // printf("Opcode %02x OJ %i Co %i Zo %i\n", opcode, ojump, co, zo);
        if (opcode >= 0x40 && ojump)
            continue;                   // Impossible combination.

        bool jump = JUMP[i];
        bool ret  = RET[i];
        bool push = !PUSHi[i];
        bool inc  = INC[i];

        bool condition = false;
        switch (opcode & 0x18) {
        case 0x00:
        case 0x08:
            condition = true;
            break;
        case 0x10:
            condition = zo;
            break;
        case 0x18:
            condition = co;
            break;
        }
        if (opcode & 0x04)
            condition = !condition;

        bool is_ret = (opcode & 0xe0) == 0x60;

        if (!is_ret && !ojump)
            condition = false;          // Not jump or not taken.

        // Check that the ret-never instructions have condition==false.
        if ((opcode & 0xf4) == 0x64)
            assert(!condition);

        bool ex_ret = false;
        bool ex_push = false;
        bool ex_jump = false;
        bool ex_inc = false;

        if (!condition)
            ex_inc = true;
        else if ((opcode & 0xe0) == 0x00)
            ex_jump = true;
        else if ((opcode & 0xe0) == 0x20) {
            ex_jump = true;
            ex_push = true;
        }
        else if ((opcode & 0xe0) == 0x60) {
            ex_ret = true;
        }
        if (ret != ex_ret)
            errx(1, "Ret ex %i got %i on %#02x", ex_ret, ret, opcode);
        if (jump != ex_jump)
            errx(1, "Jump ex %i got %i on %#02x", ex_jump, jump, opcode);
        if (push != ex_push)
            errx(1, "Push ex %i got %i on %#02x", ex_push, push, opcode);
        if (inc != ex_inc)
            errx(1, "Inc ex %i got %i on %#02x", ex_inc, inc, opcode);
    }
    fprintf(stderr, "Tested: %zi\n", S.num_samples);
    return 0;
}
