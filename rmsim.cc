
#include <assert.h>
#include <stdio.h>
#include <string.h>

#define JOIN2(x,y) x##y
#define JOIN(x,y) JOIN2(x,y)

struct operand_t;

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
    void account(const operand_t & v);
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
        is_val(true), is_mem(false), value(n) { }
    operand_t(const register_name_t & r) :
        is_val(false), is_mem(false), value(r.r) { }
    operand_t(const operand_t & other, bool m) :
        is_val(other.is_val), is_mem(m), value(other.value) { }
    bool is_val;
    bool is_mem;
    unsigned char value;
    operand_t mem() const { return operand_t(*this, true); }
    operator unsigned char() const {
        unsigned char v = is_val ? value : S.regs[value];
        return is_mem ? S.mem[v] : v;
    }
};

static const condition_t C = 0;
static const condition_t NC = 4;
static const condition_t Z = 1;
static const condition_t NZ = 5;
static const condition_t O = 2;
static const condition_t NO = 6;
static const condition_t ALWAYS = 3;
static const condition_t NEVER = 7;

void state_t::account(const operand_t & v)
{
    executed += 1 + v.is_val;
}

void ADD(const operand_t & val, bool cin = false, unsigned char flip = 0)
{
    S.account(val);
    unsigned r = A.get() + (val ^ flip) + cin;
    S.flag_C = !!(r & 256);
    A = r;
    S.flag_Z = !(r & 255);
}

void ADDM(const operand_t & val) { ADD(val.mem()); }
void ADC(const operand_t & val)  { ADD(val, S.flag_C); }
void ADCM(const operand_t & val) { ADD(val.mem(), S.flag_C); }

void SUB(const operand_t & val)  { ADD(val,       true,     255); }
void SBC(const operand_t & val)  { ADD(val,       S.flag_C, 255); }
void SUBM(const operand_t & val) { ADD(val.mem(), true,     255); }
void SBCM(const operand_t & val) { ADD(val.mem(), S.flag_C, 255); }

void AND(const operand_t & val)
{
    S.account(val);
    A = A.get() & val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void ANDM(const operand_t & val) { AND(val.mem()); }

void OR(const operand_t & val)
{
    S.account(val);
    A = A.get() | val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void ORM(const operand_t & val) { OR(val.mem()); }

void XOR(const operand_t & val)
{
    S.account(val);
    A = A.get() ^ val;
    S.flag_Z = (A.get() == 0);
    S.flag_C = false;
}

void XORM(const operand_t & val) { XOR(val.mem()); }

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
    S.account(val);
    ww = val;
}

void LOADM(const register_name_t & ww, const operand_t & val)
{
    S.account(val);
    ww = S.mem[val];
}

void STA(const operand_t & val)
{
    S.account(val);
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
    S.account(val);
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

static const int zero = 0xbf;
static const int one = 0xc7;
static const int base_start = 0xcf;

static const int outer_loop_count = 0;
static const int mult_loop_count = 63;
static const int base_index = 62;
static const int exp_twos = 61;

// Arithmetic always operates on memory? - probably get regs for free.
// Non carry add/sub not used much...
// RT() only has two bytes essential use.
// XOR is not used.  OR is not used.

// Unmapped memory read-as-zero would be nice...
// Or make 32bit x 16rom board...

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
restart:
    INC(A);
    OUT(A);
    if (start == te_single)
        RET();
    // The input consists of 64bits BE...
read1:
    // Pulse bit 7 for 1, pulse bit 6 for 0.
    IN();
    AND(0xc0);
    JP(Z,read1);
    ADC(A);
    LOAD(X,modulus);
    CALL(leftrot);
    // Long pulse on bit 7 is start...
    IN();
    ADC(A);
    JP(NC,read1);
    SUB(A);
    OUT(A);
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
main_loop:
    STA(base_index);
    LOAD(Y,one);
    CALL(copy_to_product);
    LOADM(Y,base_index);
    CALL(mult);                         // product is now the base (reduced).
    CALL(classify);
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
    LOAD(Y,one);
    CALL(copy_to_product);
    LOAD(A,len * 8);
    SUBM(exp_twos);                 // The exponent is MSB aligned in the field.
power1:
    CALL(square);
    CALL(leftrot_exponent);
    LOAD(Y,base);
    CL(C,mult);
    LOADM(A,outer_loop_count);
    DEC(A);
    JP(NZ,power1);

    if (start == te_power)
        RET();

    CALL(classifyp1);                    // -1, 1 -> useless.
    AND(0xfd);
    JP(Z,main_loop_next);

    LOADM(A,exp_twos);
square_loop:
    DEC(A);
    JP(Z,restart);                      // Didn't get -1 : composite
    CALL(square);
    CALL(classifyp1);                   // -1 -> useless
    LOADM(A,outer_loop_count);
    JP(NZ,square_loop);

main_loop_next:
    LOADM(A,base_index);
    ADD(8);
    JP(NC,main_loop);
    // Passed all checks.
    JMP(restart);

classifyp1:                             // Classify result+1.
    LOAD(X,one);
    CALL(add64m);
classify:                               // min(result,255) -> A
    LOAD(X,result - 1);
    SUB(A);
classify1:
    SUBM(X);
    SBC(A);
    RT(NZ);
    DEC(X);
    JP(NZ,classify1);
    ADDM(result);
    RET();

square:                                 // product * product -> product
    STA(outer_loop_count);
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

copy_to_product:
    LOAD(X,product);
    JMP(copy);

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


static bool is_prime(unsigned long n)
{
    int tz = __builtin_ctzl(n - 1);
    unsigned long exp = (n - 1) >> tz;

    unsigned bases[7] = { 2, 325, 9375, 28178, 450775, 9780504, 1795265022 };
    for (int i = 0; i != 7; ++i) {
        if (bases[i] % n == 0)
            continue;
        unsigned long pw = power(bases[i], exp, n);
        if (pw == 1)
            continue;
        for (int i = 0; i < tz; ++i) {
            if (pw + 1 == n)
                goto next;
            pw = mult(pw, pw, n);
        }
        return false;
    next: ;
    }
    return true;
}


static void test_single(unsigned long mod)
{
    S.set64(modulus, mod);
    go(te_single);
    unsigned exp = is_prime(mod) ? 8 : 1;
    printf("mr %lu -> %u exp %u in %u\n", mod, S.out_latch, exp, S.executed);
    assert(exp == S.out_latch);
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
    S.set64(base_start + 8, 325);
    S.set64(base_start + 16, 9375);
    S.set64(base_start + 24, 28178);
    S.set64(base_start + 32, 450775);
    S.set64(base_start + 40, 9780504);
    S.set64(base_start + 48, 1795265022);

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
    test_single(9223372036854775783);   // Largest prime < 2**63
    test_single(9219669366496075201);   // Carmichael, < 2**63
    test_single(0x100000001);
    test_single(65537);
    return 0;
}
