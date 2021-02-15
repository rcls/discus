#include <assert.h>
#include <err.h>
#include <stdio.h>

#include "spice_load.h"

enum alu_ops_t {
    op_add = 0,
    op_sub = 4,
    op_or  = 8,
    op_and = 12,
    op_adc = 16,
    op_sbc = 20,
    op_xor = 24,
    op_dnc = 28,
    op_alu_mask = 28
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

int main(int argc, char * argv[])
{
    spice_load S(argc, argv, 5e-6);

    const auto I2 = S.extract_signal("i2");
    const auto I3 = S.extract_signal("i3");
    const auto I4 = S.extract_signal("i4");
    const auto I5 = S.extract_signal("i5");
    const auto I6 = S.extract_signal("i6");
    const auto I7 = S.extract_signal("i7");
    const auto CO = S.extract_signal("co");

    const auto CR = S.extract_signal("cr");
    const auto CSi = S.extract_signal("cs#");
    const auto CoEi = S.extract_signal("coe#");
    const auto ARi = S.extract_signal("ar#");
    const auto AS = S.extract_signal("as");
    const auto AND = S.extract_signal("and");
    const auto OR = S.extract_signal("or");
    const auto Ni = S.extract_signal("n#");

    const auto QE = S.extract_signal("qe");
    const auto IN = S.extract_signal("in");
    const auto OUT = S.extract_signal("out");
    const auto MW = S.extract_signal("mw");
    const auto MRi = S.extract_signal("mr#");

    const auto CW = S.extract_signal("cw");
    const auto ZW = S.extract_signal("zw");

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
        bool Or = OR[i];
        bool n = !Ni[i];

        bool in = IN[i];
        bool out = OUT[i];
        bool mw = MW[i];
        bool mr = !MRi[i];
        bool qe = QE[i];
        bool cw = CW[i];
        bool zw = ZW[i];

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
        bool ex_qe = false;
        bool ex_zw = false;
        bool ex_cw = false;

        // Instructions that use ALU output value; ALU ops + INC/DEC/MV
        if ((opcode >= 0x80 && opcode <= 0x9f)
            || (opcode & 0xcc) == 0xc0
            || (opcode & 0xcc) == 0xc4
            || (opcode & 0xcc) == 0xc8)
            ex_qe = true;

        // Instructions that write the C flag: ALU ops plus CMP.
        if ((opcode >= 0x80 && opcode <= 0x9f)
            || (opcode & 0xf4) == 0x64)
            ex_cw = true;

        // Instructions that write Z : Same as C + INC/DEC.
        ex_zw = ex_cw;
        if ((opcode & 0xc8) == 0xc0)
            ex_zw = true;

        if (opcode < 0xc0) {
            switch (opcode & op_alu_mask) {
            case op_add:
                ex_coe = false;
                break;
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
            case op_dnc:
                ex_coe = coe;
                ex_cs = cs;
                ex_and = And;
                break;
            }
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
            ex_or = Or;
            break;
        case op_load:
            ex_mr = true;
            break;
        }

        if ((opcode & 0xf0) == 0x50)
            ex_mw = true;               // STA.
        if ((opcode & 0xec) == 0xac)
            ex_mr = true;               // MEM
        if ((opcode & 0xe8) == 0xa0)
            ex_in = true;               // IN
        if ((opcode & 0xf0) == 0x40)    // OUT
            ex_out = true;

        // We assert MR whenever MW is asserted.
        ex_mr |= ex_mw;

        // Test for undesirable combos.
        if (cs && cr)
            errx(1, "CS and CR on %s %#02x at %i\n", tag, opcode, i);

        // Test for undesirable combos.
        if (as && ar)
            errx(1, "AS and AR on %s %#02x at %i\n", tag, opcode, i);

        // Various flags we test on every cycle.
        if (qe != ex_qe)
            errx(1, "QE %i exp %i on %s %#02x at %i\n",
                 qe, ex_qe, tag, opcode, i);

        if (cw != ex_cw)
            errx(1, "CW %i exp %i on %s %#02x at %i\n",
                 cw, ex_cw, tag, opcode, i);

        if (zw != ex_zw)
            errx(1, "ZW %i exp %i on %s %#02x at %i\n",
                 zw, ex_zw, tag, opcode, i);

        if (mw != ex_mw)
            errx(1, "MW %i exp %i on %s %#02x at %i\n",
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
        if (qe || zw || cw) {
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
