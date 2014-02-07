#ifndef STATE_H_                        // -*- C++ -*-
#define STATE_H_

#include <assert.h>
#include <string.h>
#include <map>

enum register_name_t { A, X, Y, U };

struct operand_t {
    operand_t(unsigned char n) :
        reg(-1), is_mem(false), value(n) { }
    operand_t(register_name_t r) :
        reg(r), is_mem(false), value(r) { }
    operand_t(const operand_t & other, bool m) :
        reg(other.reg), is_mem(m), value(other.value) { }
    int reg;
    bool is_mem;
    unsigned char value;
    operand_t mem() const { return operand_t(*this, true); }
};

enum condition_t {
    ALWAYS, NEVER, ALWAYS_R, NEVER_R, NZ, Z, NC, C
};

struct state_t {
    unsigned char reg[4];
    bool flag_C;
    bool flag_Z;
    unsigned char out_latch;
    void * stack[4];
    unsigned char mem[256];
    bool straight_through;              // Ignore branches.
    int executed;                       // Instruction count.
    int write_limit;
    bool emit_instructions;

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

    void account(int opcode, const operand_t & v);

    void account(int opcode);

    bool wanted(condition_t) const;

    unsigned char get(const operand_t & val) const {
        unsigned char v = val.reg < 0 ? val.value : reg[val.reg];
        return val.is_mem ? mem[v] : v;
    }
    unsigned char & get(register_name_t r) {
        return reg[r];
    }

    virtual void go(int start) = 0;

    int jump_take_number;
    int jump_source;
    const char * jump_target_name;
    std::map<std::string, int> jump_targets;

    void ADD(int opcode, const operand_t & val,
             bool cin = false, unsigned char flip = 0) {
        account(opcode, val);
        unsigned r = reg[A] + (get(val) ^ flip) + cin;
        flag_C = !!(r & 256);
        reg[A] = r;
        flag_Z = !(r & 255);
    }

    void ADD(const operand_t & val)  { ADD(0x40, val); }
    void ADDM(const operand_t & val) { ADD(val.mem()); }
    void ADC(const operand_t & val)  { ADD(0x48, val, flag_C); }
    void ADCM(const operand_t & val) { ADC(val.mem()); }

    void SUB(const operand_t & val)  { ADD(0x50, val, true,   255); }
    void SBC(const operand_t & val)  { ADD(0x58, val, flag_C, 255); }
    void SUBM(const operand_t & val) { SUB(val.mem()); }
    void SBCM(const operand_t & val) { SBC(val.mem()); }

    void AND(const operand_t & val) {
        account(0x70, val);
        reg[A] &= get(val);
        flag_Z = (reg[A] == 0);
        flag_C = true;
    }

    void ANDM(const operand_t & val) { AND(val.mem()); }

    void OR(const operand_t & val) {
        account(0x60, val);
        reg[A] |= get(val);
        flag_Z = (reg[A] == 0);
        flag_C = false;
    }

    void ORM(const operand_t & val) { OR(val.mem()); }

    void XOR(const operand_t & val) {
        account(0x68, val);
        reg[A] ^= get(val);
        flag_Z = (reg[A] == 0);
        flag_C = false;
    }

    void XORM(const operand_t & val) { XOR(val.mem()); }

    // FIXME: CMP

    void INC(register_name_t w, const operand_t & val) {
        account(0xe0 + w * 8, val);
        reg[w] = get(val) + 1;
        flag_Z = (reg[w] == 0);
    }

    void DEC(register_name_t w, const operand_t & val) {
        account(0xc0 + w * 8, val);
        reg[w] = get(val) - 1;
        flag_Z = (reg[w] == 0);
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
        account(0x80, val);
        reg[ww] = get(val);
    }

    void LOADM(register_name_t ww, const operand_t & val) {
        LOAD(ww, val.mem());
    }

    void STA(const operand_t & val) {
        account(0xa4, val);
        assert(get(val) < write_limit);
        mem[get(val)] = reg[A];
    }

    void IN() {
        account(0xa0);
        // FIXME;
    }

    void OUT(const operand_t & val) {
        account(0xac, val);
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

    bool jump(condition_t cond, const char * name, int opcode = 0) {
        account(opcode + cond * 4, operand_t(jump_targets[name]));
        if (!straight_through)
            return wanted(cond);
        if (jump_take_number-- != 0)
            return false;
        jump_source = executed;
        jump_target_name = name;
        return true;
    }

    bool retrn(condition_t cond) {
        account(0xa0 + cond * 4);
        return !straight_through && wanted(cond);
    }

    void extract_branches(int start);
};


#define JP(cond,label) do { if (jump(cond, #label, 32)) goto label; } while (0)
#define JMP(label) JP(ALWAYS,label)

#define JOIN2(x,y) x##y
#define JOIN(x,y) JOIN2(x,y)
#define RET_LABEL JOIN(return_label_,__LINE__)
#define call(label) do { push(&&RET_LABEL); goto label; RET_LABEL: ; } while (0)

#define CL(cond,label) do { if (jump(cond, #label)) call(label); } while (0)
#define CALL(label) CL(ALWAYS,label)

#define do_ret() do if (stack[0] == NULL) return; else goto *pop(); while (0)

#define RT(cond) do { if (retrn(cond)) do_ret(); } while (0)

#define RET() RT(ALWAYS_R)

#endif
