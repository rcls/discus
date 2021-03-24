#include <err.h>
#include <stdio.h>

#include "spice_load.h"

int main(int argc, char * const argv[])
{
    spice_load S(argc, argv, 10e-6);

    const auto A = S.extract_signal("a");
    const auto B = S.extract_signal("b");
    const auto CIi = S.extract_signal("ci#");
    const auto CSi = S.extract_signal("cs#");
    const auto CR = S.extract_signal("cr");
    const auto AND = S.extract_signal("and");
    const auto OR = S.extract_signal("or");
    const auto Q = S.extract_signal("q");
    const auto COi = S.extract_signal("co#");

    for (int i = 0; i != S.num_samples; ++i) {
        bool a   = A[i];
        bool b   = B[i];
        bool ci  = !CIi[i];
        bool cs  = !CSi[i];
        bool cr  = CR[i];
        bool And = AND[i];
        bool Or  = OR[i];
        bool q   = Q[i];
        bool co  = !COi[i];
        // printf("%i %i %i %i %i %i %i %i %i\n",
        //        a, b, ci, cs, cr, And, Or, q, co);

        // DNC conditions.
        if (And && Or)
            continue;

        if (cs && cr)
            continue;

        if (And && (!cs || !ci))
            continue;

        if (Or && (!cr || ci))
            continue;

        bool is_xor = !And && !Or && cr;
        if (is_xor && ci)
            continue;

        if (!And && !Or && cs)
            continue;

        const char * op;
        bool ex_c;
        bool ex_q;

        if (is_xor) {
            op = "Xor";
            ex_q = a ^ b;
            ex_c = 0;
        }
        else if (And) {
            op = "And";
            ex_q = a && b;
            ex_c = 1;
        }
        else if (Or) {
            op = "Or";
            ex_q = a || b;
            ex_c = 0;
        }
        else {
            op = "Add";
            ex_q = (a + b + ci) & 1;
            ex_c = (a + b + ci) >= 2;
        }

        printf("%s %i %i %i -> %i %i\n", op, a, b, ci, q, co);

        if (ex_q != q)
            errx(1, "Q not expected %i\n", ex_q);

        if (ex_c != co)
            errx(1, "C not expected %i\n", ex_c);
    }
    return 0;
}
