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
    emitter = NULL;
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
        if (emitter)
            emitter->emit_two(executed, v.value & 63, opcode + (v.value >> 6));
        ++executed;
    }
    else if (emitter)
        emitter->emit_byte(executed, opcode + v.reg);
    ++executed;
}

void state_t::account(int opcode) {
    if (emitter)
        emitter->emit_byte(executed, opcode);
    ++executed;
}


bool state_t::jump(condition_t cond, const char * name, int opcode) {
    if (emitter)
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


void emitter_t::emit_two(int address, int b1, int b2)
{
    emit_byte(address, b1);
    emit_byte(address + 1, b2);
}


void print_emitter_t::emit_byte(int address, int byte)
{
    fprintf(file, "%02x: %02x\n", address, byte);
}

void print_emitter_t::emit_two(int address, int b1, int b2)
{
    fprintf(file, "%02x: %02x %02x\n", address, b1, b2);
}

static int select_bits(int n, int mask)
{
    int out = 0;
    for (int maskbit = 31; maskbit >= 0; --maskbit)
        if (mask & (1 << maskbit)) {
            out *= 2;
            if (n & (1 << maskbit))
                ++out;
        }
    return out;
}


void munge_emitter_t::emit_byte(int address, int byte)
{
    char board = select_bits(address, 0x80) + 'S';
    char quad8 = select_bits(address, 0x30) + 'A';
    char quad = select_bits(address, 0xd) + 'A';
    char column = select_bits(address, 0x42) + 'A';
    for (int i = 0; i != 7; ++i) {
        if ((byte & (1<<i)) == 0)
            continue;
        printf("R%c%u%c%c%c 1", column, i, quad, quad8, board);
    }
}
