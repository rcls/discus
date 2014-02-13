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
    case ALWAYS_R:
        return true;
    default:
        return false;
    }
};


void state_t::extract_branches(int start)
{
    emit_instructions = false;
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
        int target = jump_source + program_length - executed;
        jump_targets[jump_target_name] = target;
        printf("Jump %i : %i -> %s %i\n", i, jump_source,
               jump_target_name, target);
    }
}


void state_t::account(int opcode, const operand_t & v) {
    if (v.is_mem)
        opcode += 4;
    if (v.reg < 0) {
        if (emit_instructions)
            printf("%02x: %02x %02x\n",
                   executed, v.value & 63, opcode + (v.value >> 6));
        ++executed;
    }
    else if (emit_instructions)
        printf("%02x: %02x\n", executed, opcode + v.reg);
    ++executed;
}

void state_t::account(int opcode) {
    if (emit_instructions)
        printf("%02x: %02x\n", executed, opcode);
    ++executed;
}


bool state_t::jump(condition_t cond, const char * name, int opcode) {
    if (emit_instructions)
        account(opcode + cond * 4, operand_t(jump_targets[name]));
    else
        account(opcode + cond * 4, operand_t(0));
    if (!straight_through)
        return wanted(cond);
    if (jump_take_number-- != 0)
        return false;
    jump_source = executed;
    jump_target_name = name;
    return true;
}
