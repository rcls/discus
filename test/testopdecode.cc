#include <assert.h>
#include <err.h>
#include <stdio.h>

#include "spice_load.h"

enum alu_ops_t {
    op_add = 128 + 0,
    op_sub = 128 + 4,
    op_or  = 128 + 8,
    op_and = 128 + 12,
    op_adc = 128 + 16,
    op_sbc = 128 + 20,
    op_xor = 128 + 24,
    op_dnc = 128 + 28,
};

enum regreg_t {
    op_inc  = 192 + 0,
    op_dec  = 192 + 4,
    op_move = 192 + 8,
    op_load = 192 + 12,
    regreg_mask = 0xcc,
};

static const char * const alu_ops[] = {
    "ADD", "SUB", "OR", "AND", "ADC", "SBC", "XOR", "DNC" };

int main()
{
    spice_load S(stdin, 10e-6);

    const auto I2 = S.extract_signal("i2");
    const auto I3 = S.extract_signal("i3");
    const auto I4 = S.extract_signal("i4");
    const auto I5 = S.extract_signal("i5");
    const auto I6 = S.extract_signal("i6");
    const auto I7 = S.extract_signal("i7");
    const auto CO = S.extract_signal("co");

    const auto CR = S.extract_signal("cr");
    const auto CSi = S.extract_signal("cs#");
    const auto CoEi = S.extract_signal("CoE#");
    const auto ARi = S.extract_signal("ar#");
    const auto AS = S.extract_signal("as");
    const auto AND = S.extract_signal("and");
    const auto ORi = S.extract_signal("or#");
    const auto Ni = S.extract_signal("n#");

    // const auto QK = S.extract_signal("Qk");
    const auto IN = S.extract_signal("IN");
    const auto OUTi = S.extract_signal("OUT#");
    const auto MW = S.extract_signal("MW");
    const auto MR = S.extract_signal("MR");

    for (int i = 0; i != S.num_samples; ++i) {
        int opcode = I7[i] * 128 + I6[i] * 64 + I5[i] * 32
            +        I4[i] * 16  + I3[i] * 8 + I2[i] * 4;
        bool co = CO[i];

        bool cr = CR[i];
        bool cs = !CSi[i];
        bool coe = !CoEi[i];

        bool ar = !ARi[i];
        bool as = AS[i];

        bool And = AND[i];
        bool Or = !ORi[i];
        bool n = !n[i];

        // bool qk = QK[i];
        bool in = IN[i];
        bool out = OUTi[i];
        bool mw = MW[i];
        bool mr = MR[i];

        const char * tag = "";
        bool ex_coe = co;
        bool ex_cr = false;
        bool ex_cs = false;
        bool ex_ar = false;
        bool ex_as = false;
        bool ex_and = false;
        bool ex_or = false;
        bool ex_n = false;
        bool ex_in = false;
        bool ex_out = false;
        bool ex_mr = false;
        bool ex_mw = false;
        // FIXME ZW, CW.
        // bool ex_qk = false;
        // Also ALU OE....

        switch (opcode) {
        case op_add:
            ex_coe = false;
            break;
        case op_sub & 127:
        case op_sub:
            ex_coe = true;
            ex_n = true;
            break;
        case op_adc:
            break;
        case op_sbc:
            ex_n = true;
            break;
        case op_or:
            ex_coe = false;
            ex_cr = true;
            ex_or = true;
            break;
        case op_xor:
            ex_coe = false;
            ex_cr = true;
            break;
        case op_and:
            ex_coe = true;
            ex_cs = true;
            ex_and = true;
            break;
        }
        switch (opcode & regreg_mask) {
        case op_inc:
            ex_coe = true;
            ex_ar = true;
            break;
        case op_dec:
            ex_coe = false;
            ex_as = true;
            break;
        case op_move:
            ex_ar = true;
            ex_coe = false;
            ex_cr = true;
            ex_or = true;
            break;
        case op_load:
            ex_mr = true;
            break;
        }

        // if (opcode < 0x40)
        //     ex_qk = true;

        if (opcode == 0x50)
            ex_mw = true;               // STA.
        if (opcode == 0xac)
            ex_mr = true;               // MEM
        if (opcode == 0xa0)
            ex_in = true;               // IN
        if (opcode == 0x40)
            ex_out = true;

        // Various flags we test on every cycle.
        if (mw != ex_mw)
            errx(1, "MW %i exp %i on %s %02x at %i\n",
                 mw, ex_mw, tag, opcode, i);

        if (mr != ex_mr)
            errx(1, "MR %i exp %i on %s %02x at %i\n",
                 mr, ex_mr, tag, opcode, i);

        if (in != ex_in)
            errx(1, "IN %i exp %i on %s %02x at %i\n",
                 in, ex_in, tag, opcode, i);

        if (out != ex_out)
            errx(1, "OUT %i exp %i on %s %02x at %i\n",
                 out, ex_out, tag, opcode, i);

        // Only check arithmetic flags on things that use the ALU.
        // FIXME - should be on the QA flag! & CMP.
        if ((opcode >= 0x80 && opcode <= 0x9f)
            || (opcode >= 0xc0 && opcode < 0xec)) {
            if (as != ex_as)
                errx(1, "AS %i exp %i on %s %02x at %i\n",
                     as, ex_as, tag, opcode, i);

            if (ar != ex_ar)
                errx(1, "AR %i exp %i on %s %02x at %i\n",
                     ar, ex_ar, tag, opcode, i);

            if (cs != ex_cs)
                errx(1, "CS %i exp %i on %s %02x at %i\n",
                     cs, ex_cs, tag, opcode, i);

            if (cr != ex_cr)
                errx(1, "CR %i exp %i on %s %02x at %i\n",
                     cr, ex_cr, tag, opcode, i);

            if (coe != ex_coe)
                errx(1, "CoE %i exp %i on %s %02x at %i\n",
                     coe, ex_coe, tag, opcode, i);

            if (And != ex_and)
                errx(1, "AND %i exp %i on %s %02x at %i\n",
                     And, ex_and, tag, opcode, i);

            if (Or != ex_or)
                errx(1, "OR %i exp %i on %s %02x at %i\n",
                     Or, ex_or, tag, opcode, i);

            if (n != ex_n)
                errx(1, "N %i exp %i on %s %02x at %i\n",
                     n, ex_n, tag, opcode, i);
        }

    }
    fprintf(stderr, "Tested: %zi\n", S.num_samples);
    return 0;
}
