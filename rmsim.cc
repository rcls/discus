
#include <assert.h>
#include <stdio.h>
#include <string.h>

#define JOIN2(x,y) x##y
#define JOIN(x,y) JOIN2(x,y)

struct state_t {
    unsigned char regs[4];
    bool flag_C;
    bool flag_Z;
    bool flag_O;
    unsigned char out_latch;
    void * stack[4];
    unsigned char mem[256];
    bool straight_through;              // Ignore branches.
    int executed;                       // Instruction count.
    int write_limit;

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

void do_ADD(unsigned char val, bool cin = false)
{
    ++S.executed;
    unsigned r = A.get() + val + cin;
    S.flag_C = !!(r & 256);
    A = r;
    S.flag_Z = !(r & 255);
}

void ADD(const operand_t & val)  { do_ADD(val); }
void ADDM(const operand_t & val) { do_ADD(S.mem[val]); }
void ADC(const operand_t & val)  { do_ADD(val,         S.flag_C); }
void ADCM(const operand_t & val) { do_ADD(S.mem[val],  S.flag_C); }

void SUB(const operand_t & val)  { do_ADD(~val,        true); }
void SBC(const operand_t & val)  { do_ADD(~val,        S.flag_C); }
void SUBM(const operand_t & val) { do_ADD(~S.mem[val], true); }
void SBCM(const operand_t & val) { do_ADD(~S.mem[val], S.flag_C); }

void do_AND(unsigned char val)
{
    ++S.executed;
    A = A.get() & val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void AND(const operand_t & val)  { do_AND(val); }
void ANDM(const operand_t & val) { do_AND(S.mem[val]); }

void do_OR(const operand_t & val)
{
    ++S.executed;
    A = A.get() | val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void OR(const operand_t & val) { do_OR(val); }
void ORM(const operand_t & val) { do_OR(S.mem[val]); }

void do_XOR(const operand_t & val)
{
    ++S.executed;
    A = A.get() ^ val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void XOR(const operand_t & val) { do_XOR(val); }
void XORM(const operand_t & val) { do_XOR(S.mem[val]); }

/*
void CMP(const operand_t & val)
{
    ++S.executed;
    int r = A.get() + 256 - val;
    S.flag_C = (r & 256) != 0;
    S.flag_Z = (r & 255) == 0;
}
*/

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
    S.flag_C = true;
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
    assert(val < S.write_limit);
    S.mem[val] = A.get();
}

void IN()
{
    ++S.executed;
    // FIXME;
}

void OUT(const operand_t & val)
{
    ++S.executed;
    S.out_latch = val;
}


void push(void * x)
{
    memmove(S.stack + 1, S.stack, 3 * sizeof S.stack[0]);
    S.stack[0] = x;
}


void * pop()
{
    void * r = S.stack[0];
    memmove(S.stack, S.stack + 1, 3 * sizeof S.stack[0]);
    return r;
}

#define JP(cond,label) do { S.executed += 2; if (cond) goto label; } while (0)
#define JMP(label) JP(ALWAYS,label)

#define RET_LABEL JOIN(return_label_,__LINE__)
#define call(label) do { push(&&RET_LABEL); goto label; RET_LABEL: ; } while (0)

#define CL(cond,label) do { S.executed += 2; if (cond) call(label); } while (0)
#define CALL(label) CL(ALWAYS,label)

#define do_ret() do if (S.stack[0] == NULL) return; else goto *pop(); while (0)

#define RT(cond) do { S.executed++; if (cond) do_ret(); } while (0)

#define RET() RT(ALWAYS)

// Word length for this run...
static const int len = 8;

// Big endian, points point at last, so we can use the result pointer as a
// counter.
static const int result = len;
static const int temp = 16;             // Any function can clobber.
static const int modulus = 24;
static const int product = 32;
static const int factor = 40;

static const int exponent = 48;
static const int base = 56;

static const int zero = 0xff;
static const int one = 0xf7;
static const int base_start = 0xef;
static const int base_last = 0xc0;

static const int power_loop_count = 0;
static const int mult_loop_count = 63;
static const int base_index = 62;
static const int exp_twos = 61;
static const int square_count = 60;

// Arithmetic always operates on memory? - probably get regs for free.
// Non carry add/sub not used much...
// OUT takes operand.  (Can probably avoid).
// Could have LDA instead of LOADM...
// LOAD needs to preserve flags.

// Dirty trick: Flag low 3 bits zero?

enum test_entry_t {
    te_full,
    te_single,
    te_add,
    te_mult,
    te_power
};

void go(test_entry_t start)
{
    S.stack[0] = NULL;
    S.executed = 0;

    switch (start) {
    case te_add:
        goto add64m;
    case te_mult:
        goto mult;
    case te_power:
        goto power;
    case te_single:
        goto single;
    case te_full: ;
    }
composite:
    OUT(1);
prime:
    if (start == te_single)
        RET();
    // The input consists of 64bits BE...
    LOAD(Y,len*8);                      // leftrot does not use Y...
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
single:                                 // Test entry point
    // Now generate the exponent...
    LOAD(Y,modulus);
    LOAD(X,exponent);
    CALL(copy);
    LOAD(Y,len * 8 - 1);
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
    assert(product == modulus + len);   // Leaves Y==modulus below.
    assert(base == exponent + len);     // Leaves X==exponent below.
    LOAD(Y,product);
    LOAD(X,base);
    CALL(copy);
    // LOAD(Y,modulus);
    // LOAD(X,exponent);
    CALL(copy);

power:                                  // Entry-point for test only...
    CALL(set_product_one);
    LOAD(A,len * 8);
    SUBM(exp_twos);                 // The exponent is MSB aligned in the field.
power1:
    STA(power_loop_count);
    CALL(square);
    CALL(leftrot_exponent);
    LOAD(Y,base);
    CL(C,mult);
    LOADM(A,power_loop_count);
    DEC(A);
    JP(NZ,power1);

    if (start == te_power)
        RET();

    CALL(classifyp1);                    // Add 1 and test...
    // 0, 2 -> useless.
    AND(0xfd);
    JP(Z,main_loop_next);

    LOADM(A,exp_twos);
square_loop:
    STA(square_count);
    CALL(square);
    // FIXME - on the last iteration, 0 is composite not useless.
    CALL(classifyp1);                   // 0->useless, 2->composite.
    OR(A);
    JP(Z,main_loop_next);
    SUB(2);
    JP(Z,composite);
    LOADM(A,square_count);
    DEC(A);
    JP(Z,square_loop);
    // If we get here, base**(modulus-1) is not -1 or +1... composite.
    JMP(composite);
main_loop_next:
    LOADM(A,base_index);
    SUB(8);
    STA(base_index);
    SUB(base_last);
    JP(C,main_loop);
    // Passed all checks.
    OUT(2);
    JMP(prime);

classifyp1:                             // Classify result+1.
    LOAD(X,one);
    CALL(add64m);
classify:                               // min(result,255) -> A
    LOAD(X,result - 1);
classify1:
    LOADM(A,X);
    OR(A);
    LOAD(A,0xff);
    RT(NZ);
    DEC(X);
    JP(NZ,classify1);
    LOADM(A,result);
    RET();

square:                                 // product * product -> product
    LOAD(Y, product);
mult:             // Leaves product in result also.
    // product * mem(Y) -> product (mod modulus).
    // product should be reduced, mem(Y) does not need to be.
    LOAD(X,factor);
    CALL(copy);
    LOAD(Y,zero);
    LOAD(X,result);
    CALL(copy);
    LOAD(A,64);
mult1:
    STA(mult_loop_count);
    LOAD(X,result);
    CALL(add64m);                       // result * 2 -> result
    assert(factor == product + len);    // Leaves X==product below.
    LOAD(X,factor);
    CALL(leftrot);
    //LOAD(X,product);
    CL(C,add64m);
    LOADM(A,mult_loop_count);
    DEC(A);
    JP(NZ,mult1);
    LOAD(Y,result);
    JMP(copy_to_product);

leftrot_exponent:
    LOAD(X,exponent);
leftrot:
    LOAD(U,len);
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
    assert(temp == 2 * result);         // Necessary to leave X==result below.
    assert(modulus == temp + result);   // And for Y==temp.
    LOAD(U,result);
    LOAD(Y,modulus);
    LOAD(X,temp);
    SETC();
add64m2:
    LOADM(A,U);
    SBCM(Y);
    STA(X);
    DEC(Y);
    DEC(X);
    DEC(U);
    JP(NZ,add64m2);
    RT(NC);
    //LOAD(Y,temp);                     // Commit.
    //LOAD(X,result);
    JMP(copy);

set_product_one:
    LOAD(Y,one);
copy_to_product:
    LOAD(X,product);
copy:
    LOAD(U,len);
copy1:
    LOADM(A,Y);
    STA(X);
    DEC(X);
    DEC(Y);
    DEC(U);
    JP(NZ,copy1);
    RET();
}

/* Modular multiplication.  */
static unsigned long mult (unsigned long x, unsigned long y, unsigned long mod)
{
    return x * (__uint128_t) y % mod;
}


/* Modular exponentiation.  */
static unsigned long power (unsigned long base, unsigned long exp,
                            unsigned long mod)
{
    unsigned long result = 1;
    for (; exp; exp >>= 1) {
        if (exp & 1)
            result = mult(result, base, mod);
        base = mult(base, base, mod);
    }
    return result;
}


void test_add(unsigned long mod, unsigned long acc,
              unsigned long addend, int address)
{
    S.set64(modulus, mod);
    S.set64(result, acc);
    S.set64(address, addend);
    X = address;

    go(te_add);

    unsigned long res = S.get64(result);
    printf("%lu + %lu (mod %lu) -> %lu expected %lu in %u\n",
           acc, addend, mod, res, (acc + addend) % mod, S.executed);
    assert(res == (acc + addend) % mod);
}


static void test_mult(unsigned long mod, unsigned long prod,
                      unsigned long fact, int address)
{
    S.set64(modulus, mod);
    prod %= mod;
    S.set64(product, prod);
    S.set64(address, fact);
    Y = address;
    go(te_mult);
    unsigned long exp = mult(prod, fact, mod);
    unsigned long got = S.get64(product);
    unsigned long res = S.get64(result);
    printf("%lu * %lu (mod %lu) -> %lu,%lu expected %lu in %u\n",
           prod, fact, mod, res, got, exp, S.executed);
    assert(got == res);
    assert(got == exp);
}


static void test_mult_steps(unsigned long mod,
                            unsigned long prod, unsigned long fact)
{
    unsigned long res = 0;
    prod %= mod;
    for (int i = 0; i != 64; ++i) {
        test_add(mod, res, res, result);
        res = res * 2 % mod;
        if (fact & ((1ull << 63) >> i)) {
            test_add(mod, res, prod, product);
            res = (res + prod) % mod;
        }
    }
}


static void test_power(unsigned long mod, unsigned long n, unsigned long exp)
{
    S.set64(modulus, mod);
    n %= mod;
    S.mem[exp_twos] = 0;
    S.set64(base, n);
    S.set64(exponent, exp);
    go(te_power);
    unsigned long got = S.get64(product);
    unsigned long expect = power(n, exp, mod);
    printf("%lu ** %lu (mod %lu) -> %lu expected %lu in %u\n",
           n, exp, mod, got, expect, S.executed);
}


static void test_power_steps(unsigned long mod, unsigned long n, unsigned long exp)
{
    unsigned long prod = 1;
    for (int i = 0; i != 64; ++i) {
        test_mult(mod, prod, prod, factor);
        prod = mult(prod, prod, mod);
        //printf("%016lx %016lx\n", exp, ((1ul << 63) >> i));
        if (exp & ((1ul << 63) >> i)) {
            test_mult(mod, prod, n, factor);
            prod = mult(prod, n, mod);
        }
    }
}


static void test_single(unsigned long mod)
{
    S.set64(modulus, mod);
    go(te_single);
    printf("mr %lu -> %u in %u\n", mod, S.out_latch, S.executed);
}


int main(void)
{
    S.straight_through = true;
    S.write_limit = 256;
    go(te_full);
    printf("Program length = %i\n", S.executed);

    S.straight_through = false;
    S.write_limit = 64;

    S.set64(one, 1);
    S.set64(zero, 0);

    S.set64(base_start, 2);
    S.set64(base_start - 8, 325);
    S.set64(base_start - 16, 9375);
    S.set64(base_start - 24, 28178);
    S.set64(base_start - 32, 9780504);
    S.set64(base_start - 40, 1795265022);

    test_add(6700417, 6000000, 5000000, factor);
    test_add(100000000, 6000000, 5000000, product);
    test_add((1ul << 63) - 1, 1879080904, 1879080904, factor);

    test_mult(6700417, 6000000, 5000000, factor);
    test_mult(33, 1, 1000, temp);
    if (0)
        test_mult_steps((1ul << 63) - 1, 1879080904, 1879080904);
    test_mult((1ul << 63) - 1, 1879080904, 1879080904, factor);
    test_power(100000, 2, 10);
    test_power(6700417, 2, 6700416);
    test_power(9223372036854775783, 5555, 9223372036854775782);
    test_power((1ul << 63) - 1, 1234, (1ul << 63) - 2);
    if (0)
        test_power_steps((1ul << 63) - 1, 1234, (1ul << 63) - 2);

    test_power(0x100000001, 325, 0x100000000);

    test_single(5);
    test_single(15);
    test_single(9223372036854775783);
    test_single(0x100000001);

    return 0;
}
