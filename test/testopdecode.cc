#include <assert.h>
#include <err.h>
#include <stdio.h>

#include "spice_load.h"

int main()
{
    spice_load S(stdin, 10e-6);

    const auto I3 = S.extract_signal("i3");
    const auto I4 = S.extract_signal("i4");
    const auto I5 = S.extract_signal("i5");
    const auto I6 = S.extract_signal("i6");
    const auto I7 = S.extract_signal("i7");
    const auto CR = S.extract_signal("cr");
    const auto CSi = S.extract_signal("cs#");
    const auto CINRi = S.extract_signal("cinr#");
    const auto CINS = S.extract_signal("cins");
    const auto ARi = S.extract_signal("ar#");
    const auto AS = S.extract_signal("as");
    const auto AND = S.extract_signal("and");
    const auto ORi = S.extract_signal("or#");
    const auto N = S.extract_signal("n");

    for (int i = 0; i != S.num_samples; ++i) {
        int opcode = I7[i] * 128 + I6[i] * 64 + I5[i] * 32
            +        I4[i] * 16  + I3[i] * 8;
        bool cr = CR[i];
        bool cs = !CSi[i];

        bool cinr = !CINRi[i];
        bool cins = CINS[i];

        bool ar = !ARi[i];
        bool as = AS[i];

        bool And = AND[i];
        bool Or = !ORi[i];
        bool n = N[i];

        // Dominances...
        //ar &= !as;
        //cr &= !cs;
        cinr &= !cins;

        const char * tag = NULL;
        bool ex_cr = false;
        bool ex_cs = false;
        bool ex_cinr = false;
        bool ex_cins = false;
        bool ex_ar = false;
        bool ex_as = false;
        bool ex_and = false;
        bool ex_or = false;
        bool ex_n = false;

        switch (opcode & 0xf8) {
        case 0x40:                      // ADD
            ex_cinr = true;
        case 0x48:                      // ADC
            break;
        case 0x78:                      // CMP
        case 0x50:                      // SUB
            ex_cins = true;
        case 0x58:                      // SBC
            ex_n = true;
            break;
        case 0x60:                      // OR
            ex_or = true;
        case 0x68:                      // XOR
            ex_cinr = true;
            ex_cr = true;
            break;
        case 0x70:                      // AND
            ex_cins = true;
            ex_cs = true;
            ex_and = true;
            break;
        }

        switch (opcode & 0xe0) {
        case 0x80:                      // MV
            tag = "MV";
            ex_ar = true;
            ex_cinr = true;
            //ex_cr = true; - don't care.
            break;
        case 0xc0:                      // DEC
            tag = "DEC";
            ex_as = true;
            ex_cinr = true;
            break;
        case 0xe0:                      // INC
            tag = "INC";
            ex_ar = true;
            ex_cins = true;
            break;
        }

        if ((opcode & 0xf0) == 0xa0) {  // Special
            tag = "special";
            ex_ar = true;
            ex_cinr = true;
            ex_cr = true;
        }

        if (opcode >= 0x40 && opcode <= 0x7f) {
            static const char tags[8*4] =
                "ADD\0ADC\0SUB\0SBC\0OR\0\0XOR\0AND\0CMP";
            tag = tags + 4 * ((opcode & 0x38) >> 3);
        }

        if (!tag)
            continue;

        // Check dominant flags first...
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

        if (cinr != ex_cinr)
            errx(1, "CinR %i exp %i on %s %02x at %i\n",
                 cinr, ex_cinr, tag, opcode, i);

        if (cins != ex_cins)
            errx(1, "CinS %i exp %i on %s %02x at %i\n",
                 cins, ex_cins, tag, opcode, i);

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
    fprintf(stderr, "Tested: %zi\n", S.num_samples);
    return 0;
}
