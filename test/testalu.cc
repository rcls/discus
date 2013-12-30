#include <err.h>
#include <stdio.h>

#include "spice_load.h"

int main()
{
    spice_load S(stdin, 10e-6);

    const auto A = S.extract_signal("a");
    const auto B = S.extract_signal("b");
    const auto N = S.extract_signal("n");
    const auto C = S.extract_signal("c");
    const auto CS = S.extract_signal("cs");
    const auto CR = S.extract_signal("cr");
    const auto AND = S.extract_signal("andl");
    const auto OR = S.extract_signal("orl");
    const auto Q = S.extract_signal("q#");
    const auto Q_hash = S.extract_signal("q");
    const auto Co = S.extract_signal("co");

    int tested_q = 0;
    int tested_c = 0;

    for (int i = 0; i != S.num_samples; ++i) {
        if (Q[i] == Q_hash[i])
            errx(1, "Q, Q# not complementary at %i", i);

        if (AND[i] && OR[i])
            continue;                   // Don't test...

        bool b = B[i] ^ N[i];

        bool iv;
        if (AND[i])
            iv = A[i] && b;
        else if (OR[i])
            iv = !(A[i] || b);
        else
            iv = !A[i] ^ b;

        bool qe = iv ^ C[i];

        ++tested_q;
        if (Q[i] != qe)
            errx(1, "Q not expected value at %i", i);

        if (!CR[i] && CS[i] && !Co[i])
            errx(1, "CS not applied at %i", i);

        if (CR[i] && Co[i])
            errx(1, "CR not applied at %i", i);

        if (AND[i] || OR[i] || CS[i] || CR[i])
            continue;                   // Carry out not interesting.

        bool ce = A[i] + b + C[i] >= 2;
        ++tested_c;
        if (ce != Co[i])
            errx(1, "Carry out not expected at %i", i);
    }
    fprintf(stderr, "Tested: Q %i, C %i\n", tested_q, tested_c);
    return 0;
}
