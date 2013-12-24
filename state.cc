#include <stdio.h>

#include "state.h"

bool state_t::wanted(condition_t c) const
{
    bool want = (c & 4) == 0;
    switch (c & 3) {
    case 0:
        return want == flag_C;
    case 1:
        return want == flag_Z;
    case 2:
        return want == flag_O;
    default:
        return want;
    }
};


void state_t::extract_branches(int start)
{
    straight_through = true;
    jump_take_number = -1;
    write_limit = 256;
    go(start);
    int program_length = executed;
    printf("Program length = %i\n", program_length);

    for (int i = 0;; ++i) {
        jump_take_number = i;
        go(start);
        if (jump_take_number >= 0)
            break;
        printf("Jump %i : %i -> %s %i\n", i, jump_source,
               jump_target_name, jump_source + program_length - executed);
    }
}
