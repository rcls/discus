#include <assert.h>
#include <err.h>
#include <stdio.h>

#include "spice_load.h"

int main(int argc, char * const argv[])
{
    spice_load S(argc, argv, 5e-6);

    std::vector<uint8_t> P = S.extract_byte("p");
    std::vector<bool> Sel[64];

    char net[64][20];
    for (int i = 0; i < 64; ++i) {
        snprintf(net[i], sizeof net[i], "s_%c%c%cm",
                 i % 4 + 'a', i / 4 % 4 + 'a', i / 16 % 4 + 'a');
        Sel[i] = S.extract_signal(net[i]);
    }

    bool seen[64] = { false };
    for (int i = 0; i != S.num_samples; ++i) {
        int address = P[i];
        int sel = -1;
        for (int j = 0; j < 64; ++j) {
            if (!Sel[j][i])
                continue;

            if (sel >= 0)
                errx(1, "At %i P=%#02x both %s and %s set\n",
                     i, address, net[sel], net[j]);

            sel = j;
            seen[j] = true;
        }

        if (sel < 0)
            errx(1, "At %i P=%#02x did not get anything\n", i, address);
    }

    for (int i = 0; i < 64; ++i)
        if (!seen[i])
            errx(1, "Did not see %s\n", net[i]);

    printf("%li samples\n", S.num_samples);
    return 0;
}
