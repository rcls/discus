#ifndef STATE_H_                        // -*- C++ -*-
#define STATE_H_

#include <assert.h>
#include <map>
#include <stdint.h>
#include <string.h>
#include <string>

enum register_name_t { A, X, Y, U };

struct emitter_t {
    virtual void emit_byte(int address, int byte) = 0;
    virtual void emit_two(int address, int b1, int b2);
    virtual void emit_three(int address, int b1, int b2, int b3);
};


struct operand_t {
    operand_t(uint8_t n) :
        reg(-1), is_mem(false), value(n) { }
    operand_t(register_name_t r) :
        reg(r), is_mem(false), value(r) { }
    operand_t(const operand_t & other, bool m) :
        reg(other.reg), is_mem(m), value(other.value) { }
    int reg;
    bool is_mem;
    uint8_t value;
    operand_t mem() const { return operand_t(*this, true); }
};

enum condition_t {
    ALWAYS, NEVER, ALWAYS2, NEVER2, Z, NZ, C, NC
};

struct state_t {
    uint8_t reg[4];
    uint8_t regK;
    uint8_t prevK;
    bool flag_C;
    bool prev_prefix;
    bool prev_was_const;
    uint8_t out_latch;
    void * stack[4];
    uint8_t mem[256];
    bool straight_through;              // Ignore branches.
    int executed;                       // Instruction count.
    int write_limit;
    emitter_t * emitter;

    state_t() : write_limit(256) { }

    // Only used for binary interpreter...
    int pc;                             // -1 for stop.

    void set64(int address, unsigned long v) {
        for (int i = 0; i != 8; ++i)
            mem[address - i] = v >> (i * 8);
    }
    unsigned long get64(int address) const {
        unsigned long result = 0;
        for (int i = 0; i != 8; ++i)
            result += (unsigned long) mem[address - i] << (i * 8);
        return result;
    }

    void step(int opcode);              // Binary interpreter.
    void run(const uint8_t program[256]);

    void zero_init();

    void account(int opcode, const operand_t & v);

    void account(int opcode);

    bool wanted(condition_t, int K) const;

    uint8_t get(const operand_t & val) const {
        uint8_t v = val.reg < 0 ? val.value : reg[val.reg];
        return val.is_mem ? mem[v] : v;
    }
    uint8_t & get(register_name_t r) {
        return reg[r];
    }

    virtual void go() = 0;

    void assemble(emitter_t && emit);

    void verify_spice(const char * path, double quantum);

    template<typename T>
    bool verify(T & expected, T actual, const char * name);

    int jump_take_number;
    int jump_source;
    const char * jump_target_name;
    std::map<std::string, int> jump_targets;

    void ADD(const operand_t & val)  { ADD(0x80, val); }
    void ADDM(const operand_t & val) { ADD(val.mem()); }
    void ADC(const operand_t & val)  { ADD(0x90, val, flag_C); }
    void ADCM(const operand_t & val) { ADC(val.mem()); }

    void SUB(const operand_t & val)  { ADD(0x84, val, true,   255); }
    void SBC(const operand_t & val)  { ADD(0x94, val, flag_C, 255); }
    void SUBM(const operand_t & val) { SUB(val.mem()); }
    void SBCM(const operand_t & val) { SBC(val.mem()); }

    void AND(const operand_t & val) {
        account(0x8c, val);
        reg[A] &= get(val);
        regK = reg[A];
        flag_C = true;
    }

    void ANDM(const operand_t & val) { AND(val.mem()); }

    void OR(const operand_t & val) {
        account(0x88, val);
        reg[A] |= get(val);
        regK = reg[A];
        flag_C = false;
    }

    void ORM(const operand_t & val) { OR(val.mem()); }

    void XOR(const operand_t & val) {
        account(0x98, val);
        reg[A] ^= get(val);
        regK = reg[A];
        flag_C = false;
    }

    void XORM(const operand_t & val) { XOR(val.mem()); }

    void CMP(const operand_t & val)  {
        account(0x64, val);
        unsigned v = get(val);
        unsigned r = reg[A] + (256 - v);
        flag_C = !!(r & 256);
        regK = r;
    }
    void CMPM(const operand_t & val) { CMP(val.mem()); }

    void TST(const operand_t & val)  {
        account(0x6c, val);
        unsigned v = get(val);
        regK = reg[A] & v;
        flag_C = true;
    }
    void TSTM(const operand_t & val) { TST(val.mem()); }

    void INC(register_name_t w, const operand_t & val) {
        account(0xc0 + w * 16, val);
        reg[w] = get(val) + 1;
        regK = reg[w];
    }

    void DEC(register_name_t w, const operand_t & val) {
        account(0xc4 + w * 16, val);
        reg[w] = get(val) - 1;
        regK = reg[w];
    }

    void INC(register_name_t r) { INC(r, r); }
    void DEC(register_name_t r) { DEC(r, r); }

    void INCM(register_name_t r, const operand_t & val) { INC(r, val.mem()); }
    void DECM(register_name_t r, const operand_t & val) { DEC(r, val.mem()); }

    void CLRC() {
        OR(A);
    }

    void SETC() {
        AND(A);
    }

    void LOAD(register_name_t ww, const operand_t & val) {
        assert(!val.is_mem);
        account(0xc8 + ww * 16, val);
        reg[ww] = get(val);
        regK = reg[ww];
    }
    void LOADM(register_name_t ww, const operand_t & val) {
        assert(!val.is_mem);
        account(0xcc + ww * 16, val);
        reg[ww] = mem[get(val)];
        regK = reg[ww];
    }

    void STA(const operand_t & val) {
        account(0x4c, val);
        if (!straight_through) {
            assert(get(val) < write_limit);
            mem[get(val)] = reg[A];
        }
    }
    void STAM(const operand_t & val) { STA(val.mem()); }

    void IN() {
        account(0x50);
        // FIXME.
    }

    void OUT(const operand_t & val) {
        account(0x40, val);
        out_latch = get(val);
    }

    void push(void * x) {
        memmove(stack + 1, stack, 3 * sizeof stack[0]);
        stack[0] = x;
    }

    void * pop() {
        void * r = stack[0];
        memmove(stack, stack + 1, 3 * sizeof stack[0]);
        return r;
    }

    bool jump(condition_t cond, const char * name, int opcode = 0);

    bool retrn(condition_t cond) {
        account(0x60 + cond * 4);
        return !straight_through && wanted(cond, regK); // FIXME hazard
    }

    void check_fail(const char * what);

    void extract_branches();
private:
    void ADD(int opcode, const operand_t & val,
             bool cin = false, uint8_t flip = 0) {
        account(opcode, val);
        unsigned r = reg[A] + (get(val) ^ flip) + cin;
        flag_C = !!(r & 256);
        reg[A] = r;
        regK = reg[A];
    }
};


#define JP(cond,label) do if (jump(cond, #label, 0)) goto label; while (0)
#define JMP(label) JP(ALWAYS,label)

#define JOIN2(x,y) x##y
#define JOIN(x,y) JOIN2(x,y)
#define RET_LABEL JOIN(return_label_,__LINE__)
#define call(label) do { push(&&RET_LABEL); goto label; RET_LABEL: ; } while (0)

#define CL(cond,label) do if (jump(cond, #label, 32)) call(label); while (0)
#define CALL(label) CL(ALWAYS,label)

#define do_ret() do if (stack[0] == NULL) return; else goto *pop(); while (0)

#define RT(cond) do if (retrn(cond)) do_ret(); while (0)

#define RET() RT(ALWAYS)

#define CHECK(T) do if (!straight_through) { if (T); else check_fail(#T); } while (0)

struct print_emitter_t : emitter_t {
    print_emitter_t(FILE * f) : file(f) { }
    void emit_byte(int address, int byte);
    void emit_two(int address, int b1, int b2);
    void emit_three(int address, int b1, int b2, int b3);

    FILE * file;
};

struct munge_emitter_t : emitter_t {
    munge_emitter_t(FILE * f, const char * p) :
        file(f), suffix(p) { }
    void emit_byte(int address, int byte);
    FILE * file;
    const char * suffix;
};


struct step_check_t : state_t, emitter_t {
    step_check_t(state_t * o);
    void verify(int o, int f, const char * name);
    void verify();
    void emit_byte(int address, int byte);
    void emit_two(int address, int b1, int b2);
    void emit_three(int address, int b1, int b2, int b3);
    state_t * const orig;
    uint8_t code[256];

    void run_check();

    void go() {}
};


#endif
