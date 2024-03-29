#include <err.h>
#include <stdio.h>

#include "state.h"
#include "spice_load.h"


struct byte_emitter_t : emitter_t
{
    byte_emitter_t(uint8_t c[256]) :
        code(c) { }
    void emit_byte(int address, int byte) {
        code[address] = byte;
    }
    uint8_t * const code;
};


void state_t::assemble(emitter_t && emit)
{
    emitter = &emit;
    executed = 0;
    straight_through = true;
    jump_take_number = -1;
    go();
}


bool state_t::wanted(condition_t c, int K) const
{
    switch (c) {
    case C:
        return flag_C;
    case Z:
        return K == 0;
    case NC:
        return !flag_C;
    case NZ:
        return K != 0;
    case ALWAYS:
    case ALWAYS2:
        return true;
    default:
        return false;
    }
}


void state_t::extract_branches()
{
    emitter = NULL;
    straight_through = true;
    jump_take_number = -1;
    //write_limit = 256;
    go();
    int program_length = executed;
    fprintf(stderr, "Program length = %i\n", program_length);

    for (int i = 0;; ++i) {
        jump_take_number = i;
        go();
        if (jump_take_number >= 0)
            break;
        int target = jump_source + program_length - executed;
        jump_targets[jump_target_name] = target;
        fprintf(stderr, "Jump %i : %i -> %s %i\n", i, jump_source,
                jump_target_name, target);
    }
}


void state_t::account(int opcode, const operand_t & B)
{
    if (B.is_mem && B.reg < 0) {
        if (emitter)
            emitter->emit_three(executed,
                                B.value & 63,
                                0x5c + (B.value >> 6 & 3),
                                opcode);
        executed += 3;
    }
    else if (B.is_mem) {
        if (emitter)
            emitter->emit_two(executed, 0x5c + B.reg, opcode);
        executed += 2;
    }
    else if (B.reg < 0) {
        if (emitter)
            emitter->emit_two(executed, B.value & 63,
                              opcode + (B.value >> 6 & 3));
        executed += 2;
    }
    else {
        if (emitter)
            emitter->emit_byte(executed, opcode + B.reg);
        ++executed;
    }
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
        return wanted(cond, regK);      // This doesn't get hazards right!
    if (jump_take_number-- != 0)
        return false;
    jump_source = executed;
    jump_target_name = name;
    return true;
}


void state_t::step(int opcode)
{
    ++pc;

    if (prev_was_const)
        regK = regK + (opcode & 3) * 64;

    bool cond_flag = wanted(condition_t(opcode >> 2 & 7), prevK);
    prevK = regK;

    if (!prev_was_const && opcode < 0x40) {
        regK = opcode;
        prev_was_const = true;
        prev_prefix = true;
        return;
    }

    int B;
    if (prev_prefix)
        B = regK;
    else
        B = reg[opcode & 3];

    // prev_prefix has been processed (setting B above).  If we have an
    // const/jump insn, it must be a jump, so we don't need prev_was_const.
    prev_was_const = false;
    prev_prefix = false;

    // Mask off the low two bits, we've done them.
    opcode &= 0xfc;

    switch (opcode & 0xe0) {
    case 0x00:                          // Const or jump.
        fprintf(stderr, "opcode %02x is jump, taken %i\n", opcode, cond_flag);
        if (cond_flag)
            pc = B;
        break;
    case 0x20:                         // Const or call.
        //fprintf(stderr, "opcode %02x is call to %02x\n", opcode, B);
        if (cond_flag) {
            push((void *) (intptr_t) pc);
            pc = B;
        }
        break;
    case 0x40:                          // MISC
        switch (opcode & 0xf8) {
        case 0x40:                      // OUT.
            out_latch = A;
            break;
        case 0x48:                      // STA.
            // STA...
            assert(opcode & 4);
            mem[B] = reg[A];
            break;
        case 0x50:                      // IN
            // FIXME - IN not done.
            abort();
            prev_prefix = true;
            break;
        case 0x58:                      // MEM
            // MEM...
            regK = mem[B];
            prev_prefix = true;
            break;
        }
        break;
    case 0x60:                          // Returns, also CMP/TST.
        //fprintf(stderr, "opcode %02x is return/CMP\n", opcode);
        if (cond_flag)
            pc = (intptr_t) pop();

        if (opcode == 0x64) {           // CMP
            int q = reg[A] + 256 - B;
            flag_C = !!(q & 256);
            regK = q & 255;
        }
        if (opcode == 0x6c) {           // TST
            flag_C = true;
            regK = reg[A] & B;
        }
        break;
    case 0x80:                          // ALU.
        switch (opcode) {
        case 0x80:                      // ADD
        case 0x84:                      // SUB
        case 0x90:                      // ADC
        case 0x94: {                    // SBC
            int flip = (opcode & 4) ? 255 : 0;
            int c = flag_C;
            if ((opcode & 0x1c) == 0)
                c = false;
            else if ((opcode & 0x1c) == 4)
                c = true;
            int q = reg[A] + (flip ^ B) + c;
            reg[A] = q;
            flag_C = !!(q & 256);
            break;
        }
        case 0x88:                      // OR
            reg[A] |= B;
            flag_C = 0;
            break;
        case 0x8c:                      // AND
        case 0x9c:
            reg[A] &= B;
            flag_C = 1;
            break;
        case 0x98:                      // XOR
            reg[A] ^= B;
            flag_C = 0;
            break;
        }
        regK = reg[A];
        break;
    case 0xa0:               // Unused
        abort();
        break;
    case 0xc0:                          // INC / DEC / MOV / LOAD
    case 0xe0: {
        int dd = (opcode >> 4) & 3;
        if (opcode & 8) {               // MOV / LOAD
            if (opcode & 4)
                reg[dd] = mem[B];
            else
                reg[dd] = B;
        }
        else {                          // INC / DEC.
            if (opcode & 4)
                reg[dd] = B - 1;
            else
                reg[dd] = B + 1;
        }
        regK = reg[dd];
        break;
    }
    }
}


void state_t::run(const uint8_t program[256])
{
    while (pc > 0)
        step(program[pc]);
}


void state_t::zero_init()
{
    memset(reg, 0, sizeof reg);
    regK = 0;
    flag_C = false;
    prev_prefix = false;
    prev_was_const = false;
    executed = 0;
    pc = 0;
}


template<typename T>
bool state_t::verify(T & expected, T actual, const char * name)
{
    if (expected == actual)
        return true;

    fprintf(stderr, "Verify mismatch @%#02x %s = %#02x expected %#02x\n",
            pc, name, actual, expected);
    expected = actual;
    return false;
}


void state_t::verify_spice(const char * path, double quantum)
{
    FILE * f = fopen(path, "r");
    if (!f)
        err(1, "fopen %s", path);
    spice_load spice(f, quantum, quantum, false);

    auto AA = spice.extract_byte("a");
    auto XX = spice.extract_byte("r_x_b");
    auto YY = spice.extract_byte("r_y_b");
    auto UU = spice.extract_byte("r_u_b");
    // auto KK = spice.extract_byte("r_kb");
    auto PP = spice.extract_byte("p");
    const auto FC = spice.extract_signal("co_c");
    auto II = spice.extract_byte("i");

    uint8_t code[256];
    assemble(byte_emitter_t(code));
    bool success = true;

    // Load the main state.  The first instruction to check is at sample 4,
    // pc=0.
    pc = 0;
    prev_was_const = false;
    prev_prefix = false;
    reg[A] = AA[3];
    reg[X] = XX[3];
    reg[Y] = YY[3];
    reg[U] = UU[3];
    // regK   = KK[3];
    flag_C = FC[3];
    for (int i = 4; i < spice.num_samples; ++i) {
        printf("Timestamp %g\n", spice.timestamps[spice.indexes[i]]);
        step(code[pc]);
        success &= verify(reg[A], AA[i], "A");
        success &= verify(reg[X], XX[i], "X");
        success &= verify(reg[Y], YY[i], "Y");
        success &= verify(reg[U], UU[i], "U");
        //verify(regK  , KK[i], "K");
        success &= verify(flag_C, FC[i], "C");
        // fprintf(stderr, "%i %i %i %i %i\n", i, pc, PP[i-1], reg[A], AA[i]);
        if (!verify(pc, (int) PP[i-1], "PC"))
            abort();                    // No point in carrying on.
    }
    // Sanity check that we've run the correct number of instructions.  The
    // stack should be empty and the current instruction should be an
    // unconditional return (0x60).
    assert(stack[0] == NULL);
    assert(code[pc] == 0x60);
    assert(success);
}


void state_t::check_fail(const char * what)
{
    fprintf(stderr, "Check failed: %s after %i\n", what, executed);
}


void emitter_t::emit_two(int address, int b1, int b2)
{
    emit_byte(address, b1);
    emit_byte(address + 1, b2);
}


void emitter_t::emit_three(int address, int b1, int b2, int b3)
{
    emit_byte(address, b1);
    emit_byte(address + 1, b2);
    emit_byte(address + 2, b3);
}


void print_emitter_t::emit_byte(int address, int byte)
{
    fprintf(file, "%02x: %02x\n", address, byte);
}

void print_emitter_t::emit_two(int address, int b1, int b2)
{
    fprintf(file, "%02x: %02x %02x\n", address, b1, b2);
}

void print_emitter_t::emit_three(int address, int b1, int b2, int b3)
{
    fprintf(file, "%02x: %02x %02x %02x\n", address, b1, b2, b3);
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
    char board = select_bits(address, 0xc0) + 'R';
    char rom16 = select_bits(address, 0x30) + 'A';
    char rom4  = select_bits(address, 0x0c) + 'A';
    char row   = select_bits(address, 0x03) + 'A';
    for (int i = 0; i != 8; ++i) {
        if (byte & (1 << i))
            printf("R%u%c%c%c%c\n", i, row, rom4, rom16, board);
    }
}


step_check_t::step_check_t(state_t * o) :
    orig(o)
{
    byte_emitter_t emit(code);
    assemble(byte_emitter_t(code));
}


void step_check_t::verify(int o, int f, const char * name)
{
    if (o != f)
        errx(1, "%s mismatch src 0x%02x, bin 0x%02x at step %i pc 0x%02x\n",
             name, o, f, orig->executed, pc);
}


void step_check_t::verify()
{
    verify(orig->reg[A], reg[A], "A");
    verify(orig->reg[X], reg[X], "X");
    verify(orig->reg[Y], reg[Y], "Y");
    verify(orig->reg[U], reg[U], "U");
    // verify(orig->regK  , regK  , "K");
    // verify(orig->flag_Z, flag_Z, "Z");
    verify(orig->flag_C, flag_C, "C");
    if (memcmp(orig->mem, mem, 256) != 0)
        for (int i = 0; i != 256; ++i) {
            char name[12];
            snprintf(name, sizeof name, "mem[0x%02x]", i);
            verify(orig->mem[i], mem[i], name);
        }
}


void step_check_t::run_check()
{
    orig->assemble(byte_emitter_t(code));
    zero_init();
    orig->zero_init();
    memset(orig->mem, 0, 256);
    memcpy(mem, orig->mem, 256);
    orig->emitter = this;
    orig->straight_through = false;
    orig->go();
    verify();
    orig->emitter = NULL;
}


void step_check_t::emit_byte(int address, int byte)
{
    verify();
    printf("%02x: %02x\n", address, byte);
    assert(byte == code[pc]);
    step(code[pc]);
}

void step_check_t::emit_two(int address, int b1, int b2)
{
    verify();
    printf("%02x: %02x %02x\n", address, b1, b2);
    assert(b1 == code[pc]);
    assert(b2 == code[pc+1]);
    step(code[pc]);
    step(code[pc]);
}

void step_check_t::emit_three(int address, int b1, int b2, int b3)
{
    verify();
    printf("%02x: %02x %02x %02x\n", address, b1, b2, b3);
    assert(b1 == code[pc]);
    assert(b2 == code[pc+1]);
    assert(b3 == code[pc+2]);
    step(code[pc]);
    step(code[pc]);
    step(code[pc]);
}
