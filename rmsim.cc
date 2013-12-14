
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

void OUT(const operand_t & val)
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
#define temp 16                         // Any function can clobber.
#define product 24
#define factor 32
#define base 40
#define exponent 48
#define modulus 56

#define zero 0xff
#define one 0xf7
#define base_start 0xef
#define base_last 0xc0

#define reduce_loop_count 0
#define power_loop_count 0
#define mult_loop_count 63
#define base_index 62
#define reduce_output 61
#define exp_twos 60
#define square_count 59


// Call/ret save/restore A? - probably not worth it.
// Arithmetic always operates on memory? - probably get regs for free.
// Non carry add/sub not used much...
// OUT takes operand.  (Can probably avoid).

// Dirty trick: Flag low 3 bits zero?

void go(void)
{
composite:
    OUT(1);
prime:
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
    OUT(Y);
    // Now generate the exponent...
    LOAD(Y,modulus);
    LOAD(X,exponent);
    CALL(copy);
    LOAD(Y,63);
expgen1:                // Find the position of the lowest 1 bit in (modulus-1).
    CALL(leftrot_exponent);
    JP(NC,expgen2);
    LOAD(A,Y);
    STA(exp_twos);
expgen2:
    DEC(Y);
    JP(NZ,expgen1);

    // Loop over the bases.
    LOAD(A,base_start);
    STA(base_index);
main_loop:
    CALL(set_product_one);
    LOADM(X,base_index);
    CALL(mult);                         // product is now the base (reduced).
    CALL(classify);
    OR(A);
    JP(Z,main_loop_next);               // base==0, next.

    // Now do the exponentiation...
    LOAD(Y,modulus);
    LOAD(X,exponent);
    CALL(copy);
    LOAD(Y,product);
    LOAD(X,base);
    CALL(copy);

    CALL(set_product_one);
    LOAD(A,64);
    SUBM(exp_twos);                 // The exponent is MSB aligned in the field.
power1:
    STA(power_loop_count);
    CALL(square);
    CALL(leftrot_exponent);
    LOAD(Y,base);
    CL(C,mult);
    LOAD(A,power_loop_count);
    DEC(A);
    JP(NZ,power1);

    CALL(classifyp1);                    // Add 1 and test...
    // 0, 2 -> useless.
    AND(0xfd);
    JP(Z,main_loop_next);

    LOADM(A,exp_twos);
square_loop:
    STA(square_count);
    CALL(square);
    CALL(classifyp1);                   // 0->useless, 2->composite.
    OR(A);
    JP(Z,main_loop_next);
    SUB(2);
    JP(Z,composite);
    LOADM(A,square_count);
    DEC(A);
    JP(Z,square_loop);
    // If we get here, base**(modulus-1) is -1 not +1.... composite.
main_loop_next:
    LOADM(A,base_index);
    SUB(8);
    STA(base_index);
    SUB(base_last);
    JP(NC,main_loop);
    // Passed all checks.
    OUT(2);
    JMP(prime);

classifyp1:                             // Classify result+1.
    LOAD(X,one);
    CALL(add64m);
classify:                               // min(result,255) -> A
    LOAD(X,result);
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

square:                                 // product * product -> product
    LOAD(Y, product);
mult:             // Leaves product in result also.
    // product * mem(Y) -> product (mod modulus).
    // product should be reduced, mem(Y) does not need to be.
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
    LOAD(X,factor);
    CALL(leftrot);
    LOAD(X,product);
    CL(C,add64m);
    LOADM(A,mult_loop_count);
    DEC(A);
    JP(NZ,mult1);
    LOAD(Y,result);
    JMP(copy_to_product);

leftrot_exponent:
    LOAD(X,exponent);
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

add64m:                               // result + mem(X) -> result (mod modulus)
    CLRC();
    LOAD(Y,result);                     // Is 8, is loop counter.
add64m1:
    LOADM(A,Y);
    ADCM(X);
    STA(Y);
    DEC(X);
    DEC(Y);
    JP(NZ,add64m1);
    // Do a trial subtract result - modulus -> temp
    LOAD(Y,result);
    LOAD(X,modulus);
    LOAD(U,temp);
    SETC();
add64m2:
    LOADM(A,Y);
    SBCM(X);
    STA(U);
    DEC(U);
    DEC(X);
    DEC(Y);
    JP(NZ,add64m2);
    RT(NC);
    LOAD(Y,temp);                     // Commit.
    LOADM(X,result);
    JMP(copy);

set_product_one:
    LOAD(Y,one);
copy_to_product:
    LOAD(X,product);
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
}

int main(void)
{
    S.executed = 0;
    S.straight_through = true;
    go();
    printf("Did %i\n", S.executed);
    return 0;
}
