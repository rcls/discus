#include <err.h>
#include <stdio.h>

#include "spice_load.h"

int main(int argc, const char ** argv)
{
    spice_load S(stdin);

    // Now extract each individual digital variable.
    const auto c      = S.extract_signal("c");
    const auto c_hash = S.extract_signal("c#");
    const auto count  = S.extract_signal("count");
    const auto ci     = S.extract_signal("ci");
    const auto w      = S.extract_signal("w");
    const auto we     = S.extract_signal("we");

    const auto r = S.extract_number4("r0", "r1", "r2", "r3");
    const auto a = S.extract_number4("a0", "a1", "a2", "a3");
    const auto a_hash = S.extract_number4("a0#", "a1#", "a2#", "a3#");
    const auto b = S.extract_number4("b0", "b1", "b2", "b3");
    const auto q = S.extract_number4("q0", "q1", "q2", "q3");

    // Check that clocks alternate.
    for (int i = SKIP; i != S.num_samples; ++i)
        if (c[i] == c_hash[i])
            errx(1, "Clocks not complementary at %i", i);

    for (int i = SKIP; i != S.num_samples; ++i)
        if (c[i] == c[i-1])
            errx(1, "Clocks not flipping at %i", i);

    // Basic arithmetic.
    for (int i = SKIP; i != S.num_samples; ++i) {
        if (a[i] + a_hash[i] != 15)
            errx(1, "a# not complement at %i", i);
        if (q[i] != (a[i] + b[i] + ci[i]) % 16)
            errx(1, "q not sum at %i", i);
        printf("%2i+%2i+%i = %i\n", a[i], b[i], ci[i], q[i]);
        if (w[i] == count[i])
            errx(1, "w and count not complementary at %i", i);
        if (we[i] != (c_hash[i] & w[i]))
            errx(1, "we not expected at %i", i);
    }

    // Count and w do not change on falling edge.
    for (int i = SKIP; i != S.num_samples; ++i)
        if (c_hash[i] && count[i] != count[i-1])
            errx(1, "count changes on rising edge %i", i);

    // Counter.
    for (int i = SKIP + 1; i != S.num_samples; ++i) {
        bool cnt = c[i] && count[i-1];
        if (r[i] != (r[i-1] + cnt) % 16)
            errx(1, "r not correct at %i", i);
    }

    // Now check the memory behaviour.
    int memory[4];
    for (int i = 0; i != 4; ++i)
        memory[i] = -1;

    for (int i = SKIP; i != S.num_samples; ++i) {
        int index_a = r[i] & 3;
        int index_b = r[i] >> 2;
        if (we[i]) {
            printf("Write memory[%i] = %i at %i\n", index_a, q[i-1], i);
            //assert(r[i] == r[i-1]);
            memory[index_a] = q[i-1];
        }
        //printf("Index a %i b %i\n", index_a, index_b);
        if (memory[index_a] >= 0 && memory[index_a] != a[i])
            errx(1, "a is %i not expected %i at %i", a[i], memory[index_a], i);
        if (memory[index_b] >= 0 && memory[index_b] != b[i])
            errx(1, "b is %i not expected %i at %i", b[i], memory[index_b], i);
        if (memory[index_a] < 0) {
            printf("Infer memory[%i] = %i at %i\n", index_a, a[i], i);
            memory[index_a] = a[i];
        }
        if (memory[index_b] < 0) {
            printf("Infer memory[%i] = %i at %i\n", index_b, b[i], i);
            memory[index_b] = b[i];
        }
    }

    return 0;
}
