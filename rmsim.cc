
#include <stdio.h>
#include <string.h>

#define JOIN2(x,y) x##y
#define JOIN(x,y) JOIN2(x,y)
#define RET_LABEL JOIN(return_label_,__LINE__)

struct state_t {
    unsigned char regs[4];
    bool flag_C;
    bool flag_Z;
    bool flag_O;
    void * stack[4];
    unsigned char mem[256];
    bool straight_through;              // Ignore branches.
    int executed;                       // Instruction count.
};

static state_t S;

struct register_name_t {
    int r;
    explicit register_name_t(int rr) : r(rr) { }

    unsigned char operator= (unsigned char v) const { return S.regs[r] = v; }
    unsigned char get() const { return S.regs[r]; }
};

static const register_name_t A(0);
static const register_name_t X(1);
static const register_name_t Y(2);
static const register_name_t U(3);

struct condition_t {
    int c;
    condition_t(int cc) : c(cc) { }

    operator bool() const {
        if (S.straight_through)
            return false;

        bool want = (c & 4) == 0;
        switch (c & 3) {
        case 0:
            return want == S.flag_C;
        case 1:
            return want == S.flag_Z;
        case 2:
            return want == S.flag_O;
        default:
            return want;
        };
    }
};


struct operand_t {
    operand_t(unsigned char n) :
        is_val(true), value(n) { ++S.executed; }
    operand_t(const register_name_t & r) :
        is_val(false), value(r.r) { }
    bool is_val;
    unsigned char value;
    operator unsigned char() const { return is_val ? value : S.regs[value]; }
};

static const condition_t C = 0;
static const condition_t NC = 4;
static const condition_t Z = 1;
static const condition_t NZ = 5;
static const condition_t O = 2;
static const condition_t NO = 6;
static const condition_t ALWAYS = 3;
static const condition_t NEVER = 7;

void ADD(const operand_t & val)
{
    ++S.executed;
    unsigned r = A.get() + val;
    S.flag_C = !!(r & 256);
    A = r;
}

void ADDM(const operand_t & val)
{
    ADD(S.mem[val]);
}

void ADC(const operand_t & val)
{
    ++S.executed;
    unsigned r = A.get() + val + S.flag_C;
    S.flag_C = !!(r & 256);
    A = r;
    S.flag_Z = (A.get() == 0);
}

void ADCM(const operand_t & val)
{
    ADC(S.mem[val]);
}

void SUB(const operand_t & val)
{
    ADD(256 - val);
}

void SBC(const operand_t & val)
{
    ADC(~val);
}

void SUBM(const operand_t & val)
{
    SUB(S.mem[val]);
}

void SBCM(const operand_t & val)
{
    SBC(S.mem[val]);
}

void AND(const operand_t & val)
{
    ++S.executed;
    A = A.get() & val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void ANDM(const operand_t & val)
{
    AND(S.mem[val]);
}

void OR(const operand_t & val)
{
    ++S.executed;
    A = A.get() | val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void ORM(const operand_t & val)
{
    OR(S.mem[val]);
}

void XOR(const operand_t & val)
{
    ++S.executed;
    A = A.get() ^ val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void XORM(const operand_t & val)
{
    AND(S.mem[val]);
}

void CMP(const operand_t & val)
{
    ++S.executed;
    int r = A.get() + 256 - val;
    S.flag_C = (r & 256) != 0;
    S.flag_Z = (r & 255) == 0;
}

void INC(const register_name_t & reg)
{
    ++S.executed;
    reg = reg.get() + 1;
    S.flag_Z = (reg.get() == 0);
    S.flag_O = (reg.get() == 0);
}

void DEC(const register_name_t & reg)
{
    ++S.executed;
    reg = reg.get() - 1;
    S.flag_Z = (reg.get() == 0);
    S.flag_O = (reg.get() != 255);
}

void CLRC()
{
    ++S.executed;
    S.flag_C = false;
}


void SETC()
{
    ++S.executed;
    S.flag_C = false;
}


void LOAD(const register_name_t & ww, const operand_t & val)
{
    ++S.executed;
    ww = val;
}

void LOADM(const register_name_t & ww, const operand_t & val)
{
    ++S.executed;
    ww = S.mem[val];
}

void STA(const operand_t & val)
{
    ++S.executed;
    S.mem[A.get()] = val;
}

void IN()
{
    ++S.executed;
    // FIXME;
}

void OUT()
{
    ++S.executed;
    // FIXME;
}


void push(void * x)
{
    memmove(S.stack, S.stack + 1, sizeof S.stack - sizeof S.stack[0]);
}


void * pop()
{
    void * r = S.stack[0];
    memmove(S.stack, S.stack + 1, sizeof S.stack - sizeof S.stack[0]);
    return r;
}

#define JP(cond,label) do { S.executed += 2; if (cond) goto label; } while (0)
#define JMP(label) JP(ALWAYS,label)

#define call(label) do { push(&&RET_LABEL); goto label; RET_LABEL: ; } while (0)

#define CL(cond,label) do { S.executed += 2; if (cond) call(label); } while (0)
#define CALL(label) CL(ALWAYS,label)

#define do_ret() do if (S.stack[0] == NULL) return; else goto *pop(); while (0)

#define RT(cond) do { S.executed++; if (cond) do_ret(); } while (0)

#define RET() RT(ALWAYS)

// Big endian, we can use the result pointer as a counter.
#define result 8
#define overflow 16
#define product 24
#define factor 32
#define base 40
#define exponent 48
#define modulus 56

#define zero 0xc8
#define one 0xd0
#define minusone 0xd8

#define base_start 0 // FIXME.

#define reduce_loop_count 0
#define power_loop_count 0
#define mult_loop_count 63
#define base_index 62
#define reduce_output 61


// Either INCM/DECM or store arb. register - either way we need to open up
// the write path.  Nope - use A for outer loop counters?
// 2 entry stack is definitely not enough.
// Call/ret save/restore A? - probably not worth it.
// Arithmetic always operates on memory? - probably get regs for free.
// Non carry add/sub not used...

// U reads as zero except for INC/DEC? - no the subtraction loop needs it.
// Dirty trick: Flag low 3 bits zero?

void go(void)
{
    CALL(start);
    CALL(power);
    CALL(main_loop);
start:
    // The input consists of 64bits BE...
    LOAD(Y,64);                         // leftrot does not use Y...
read1:
    IN();                               // FIXME - or test a bit?
    AND(1);                             // FIXME - or ROR... or non.dest.test.
    JP(Z,read1);
    IN();
    ADC(A);
    LOAD(X,modulus);
    CALL(leftrot);
read2:
    IN();                              // Or just use short pulses...
    AND(1);
    JP(NZ,read2);
    DEC(Y);
    JP(NZ,read1);
    // Now generate the overflow constant.
    LOAD(Y,minusone);
    LOAD(X,product);
    CALL(copy);
    LOAD(X,overflow);
    CALL(reduce);
    // Loop over the bases.
    LOAD(Y,base_start);
main_loop:
    LOAD(X,product);
    CALL(copy);
    LOAD(A,Y);
    STA(base_index);
    LOAD(X,exponent);                   // FIXME
    CALL(reduce);
    CALL(classify);
    OR(A);
    //JP(NC,main_loop_go);                // Uninteresting.
    //JP(Z,main_loop_skip);               // base = 0 (mod modulus).

classify:                               // Test reduce_output for 0,1,2...
    LOADM(X,reduce_output);
    LOAD(U,8);
classify1:
    LOADM(A,X);
    DEC(X);
    DEC(U);
    RT(Z);
    OR(A);
    JP(Z,classify1);
    OR(0xff);
    RET();

reduce:                        // product mod modulus -> mem(X), clobber factor.
    LOAD(A,X);
    STA(reduce_output);
    LOAD(Y,zero);
    CALL(copy);
    LOAD(A,64);
reduce1:
    STA(reduce_loop_count);
    LOAD(X,product);
    CALL(leftrot);
    LOADM(X,reduce_output);
    CALL(leftrot);
    // Do the trial subtract. base - modulus -> factor.
    LOADM(X,reduce_output);
    LOAD(Y,modulus);
    LOAD(U,factor);
    SETC();
reduce2:
    LOADM(A,X);
    SBCM(Y);
    STA(U);
    DEC(U);
    DEC(Y);
    DEC(X);
    JP(NZ,reduce2);
    JP(NC,reduce3);
    LOAD(Y,factor);                     // Commit.
    LOADM(X,reduce_output);
    CALL(copy);
reduce3:
    LOAD(A,reduce_loop_count);
    DEC(A);
    JP(NZ,reduce1);
    RET();

power:                                  // base ** exponent -> product
    LOAD(Y,one);
    LOAD(X,product);
    CALL(copy);
    LOAD(A,64);
power1:
    STA(power_loop_count);
    CALL(square);
    LOAD(X,exponent);
    CALL(leftrot);
    LOAD(Y,base);
    CL(C,mult);
    LOAD(A,power_loop_count);
    DEC(A);
    JP(NZ,power1);
    RET();

square:                                 // product * product -> product
    LOAD(Y, product);
mult:                                   // product * mem(Y) -> product
    LOAD(X,factor);
    CALL(copy);
//mult_f:                                 // product * factor -> product
    LOAD(Y,zero);
    LOAD(X,result);
    CALL(copy);
    LOAD(A,64);
mult1:
    STA(mult_loop_count);
    LOAD(X,result);
    CALL(add64m);                       // result * 2 -> result
    LOAD(X,product);
    CALL(leftrot);
    LOAD(X,factor);                     // Hack - put factor2 after factor1?
    CL(C,add64m);
    LOADM(A,mult_loop_count);
    DEC(A);
    JP(NZ,mult1);
    LOAD(Y,result);
    LOAD(X,product);
    JMP(copy);

#if 0
get:
    LOAD(X,result);
    JMP(copy);
put:
    LOAD(Y,result);
#endif
copy:
    LOAD(U,8);
copy1:
    LOADM(A,Y);
    STA(X);
    DEC(X);
    DEC(Y);
    DEC(U);
    JP(NZ,copy1);
    RET();

leftrot:
    LOAD(U,8);
leftrot1:
    LOADM(A,X);
    ADC(A);
    STA(X);
    DEC(X);
    DEC(U);
    JP(NZ,leftrot1);
    RET();

add64m:                                 // result + mem(X) -> result
    CLRC();
add64m1:
    LOAD(Y,result);                     // Is 8, is loop counter.
add64m2:
    LOADM(A,Y);
    ADCM(X);
    STA(Y);
    DEC(X);
    DEC(Y);
    JP(NZ,add64m2);
    RT(NC);
    LOAD(X,overflow);
    JMP(add64m1);                        // Or add64m+1?
}

int main(void)
{
    S.executed = 0;
    S.straight_through = true;
    go();
    printf("Did %i\n", S.executed);
    return 0;
}
