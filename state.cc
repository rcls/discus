#include <stdio.h>

#include "state.h"

bool state_t::wanted(condition_t c) const
{
    switch (c) {
    case C:
        return flag_C;
    case Z:
        return flag_Z;
    case NC:
        return !flag_C;
    case NZ:
        return !flag_Z;
    case ALWAYS:
        return true;
    default:
        return false;
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
