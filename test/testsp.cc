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
    const auto S0 = S.extract_signal("s0");
    const auto S1 = S.extract_signal("s1");
    const auto S2 = S.extract_signal("s2");
    const auto S3 = S.extract_signal("s3");

    for (int i = 2; i != S.num_samples; ++i) {
        unsigned now = S0[i] + S1[i] * 2 + S2[i] * 4 + S3[i] * 8;
        if (!now)
            errx(1, "Nothing set at %i\n", i);
        if (now & (now - 1))
            errx(1, "Multiple set %#x at %i\n", now, i);

        unsigned prev = S0[i-1] + S1[i-1] * 2 + S2[i-1] * 4 + S3[i-1] * 8;
        unsigned expect = prev;
        if (PUSH[i-1])
            expect <<= 1;
        if (POP[i])
            expect <<= 3;
        expect %= 15;             // Close enough.

        if (expect != now)
            errx(1, "Expect %#x got %#x at %i\n", expect, now, prev);
    }
    printf("%li samples\n", S.num_samples);
    return 0;
}
