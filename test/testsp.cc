#include <assert.h>
#include <err.h>
#include <stdio.h>

#include "spice_load.h"

int main()
{
    spice_load S(stdin, 10e-6);

    const auto C = S.extract_signal("c");
    const auto PUSH = S.extract_signal("push");
    const auto POP = S.extract_signal("pop");
    const auto Q0 = S.extract_signal("q0");
    const auto Q1 = S.extract_signal("q1");

    int errors = 0;
    for (int i = 2; i != S.num_samples; ++i) {
        unsigned pre = Q0[i-1] + 2 * Q1[i-1];
        unsigned now = Q0[i] + 2 * Q1[i];

        unsigned add = 0;
        if (PUSH[i-1])
            add += 1;
        if (POP[i])
            add += 3;
        unsigned exp = (pre + add) & 3;

        if (now != exp) {
            printf("%3i %c %c %c %c %c %i %i\n", i,
                   C[i] ? '*' : ' ',
                   PUSH[i] ? '*' : ' ',
                   POP[i] ? '*' : ' ',
                   Q0[i] ? '*' : ' ',
                   Q1[i] ? '*' : ' ',
                   now, exp);
            ++errors;
        }
    }

    if (errors) {
        printf("%li rows, %i errors.\n", S.num_samples, errors);
        return EXIT_FAILURE;
    }
    else {
        printf("%li rows, no errors.\n", S.num_samples);
        return EXIT_SUCCESS;
    }
}
