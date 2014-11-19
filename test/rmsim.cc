
#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "state.h"

struct miller_rabin_state : state_t {

    // Word length for this run...
    static const int len = 8;

    // Big endian, points point at last, so we can use the result pointer as a
    // counter.
    static const int result = len;
    static const int temp = len * 2;    // Any function can clobber.
    static const int modulus = len * 3;
    static const int product = len * 4;
    static const int factor = len * 5;

    static const int exponent = len * 6;
    static const int base = len * 7;

    static const int zero = 0xbf;
    static const int one = 0xc7;
    static const int base_start = 0xcf;

    static const int outer_loop_count = 0;
    static const int mult_loop_count = 63;
    static const int base_index = 62;
    static const int exp_twos = 61;

    enum test_entry_t {
        te_full,
        te_single,
        te_add,
        te_mult,
        te_power
    };

    test_entry_t start_point;
    void go(test_entry_t start) { start_point = start; go(); }
    void go();

    void test_power(unsigned long mod, unsigned long n, unsigned long exp);
    void test_single(unsigned long mod);

    void run_tests();
};


void miller_rabin_state::go()
{
    stack[0] = NULL;
    executed = 0;

    switch (start_point) {
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
    if (start_point == te_single)
        RET();
    // The input consists of 64bits BE...
read1:
    // Pulse bit 7 for 1, pulse bit 6 for 0.
    IN();
    AND(0xc0);
    JP(Z,read1);
    ADD(A);
    LOAD(X,modulus);
    CALL(leftrot);
    // Long pulse on bit 7 is start...
    IN();
    ADD(A);
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

    // We should now have result==product==base
power:                                  // Entry-point for test only...
    LOAD(A,len * 8);
    SUBM(exp_twos);                 // The exponent is MSB aligned in the field.
    // First left shift until we find a set bit...
    LOAD(Y,A);
power_y:
    CALL(leftrot_exponent);
    DEC(Y);
    JP(NC,power_y);                     // Note that exponent==0 never happens.
    LOAD(A,Y);
    JP(Z,power_x);
power1:
    CALL(square);
    CALL(leftrot_exponent);
    LOAD(Y,base);
    CL(C,mult);
    DECM(A,outer_loop_count);
    JP(NZ,power1);
power_x:

    if (start_point == te_power)
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
    STA(outer_loop_count);              // All callers want this.
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
    DECM(A,mult_loop_count);
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
    JP(NC,add64m2);
    LOAD(X,U);           // Write subtract into result; will leave NC & no copy.
add64m2:
    SETC();
add64m3:
    LOADM(A,U);
    SBCM(Y);
    STA(X);
    DEC(Y);
    DEC(X);
    DEC(U);
    JP(NZ,add64m3);
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


void miller_rabin_state::test_power(unsigned long mod,
                                    unsigned long n, unsigned long exp)
{
    set64(modulus, mod);
    n %= mod;
    mem[exp_twos] = 0;
    set64(base, n);
    set64(product, n);
    set64(exponent, exp);
    go(te_power);
    unsigned long got = get64(product);
    unsigned long expect = power(n, exp, mod);
    printf("%lu ** %lu (mod %lu) -> %lu expected %lu in %u\n",
           n, exp, mod, got, expect, executed);
}


// 1411807385341 needs 325, 443538368977861 needs 9375, 4341937413061 needs
// 28178, 5517315475561 needs 450775 3933464309633 needs 9780504,
// 107528788110061 needs 1795265022.
static unsigned mr_bases[7] = {
    2, 325, 9375, 28178, 450775, 9780504, 1795265022 };

static bool is_prime(unsigned long n)
{
    int tz = __builtin_ctzl(n - 1);
    unsigned long exp = (n - 1) >> tz;

    for (int i = 0; i != sizeof mr_bases / sizeof mr_bases[0]; ++i) {
        if (mr_bases[i] % n == 0)
            continue;
        unsigned long pw = power(mr_bases[i], exp, n);
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


void miller_rabin_state::test_single(unsigned long mod)
{
    set64(modulus, mod);
    go(te_single);
    unsigned exp = is_prime(mod) ? len : 1;
    printf("mr %lu -> %u exp %u in %u\n", mod, out_latch, exp, executed);
    assert(exp == out_latch);
}


void miller_rabin_state::run_tests()
{
    start_point = te_full;
    extract_branches();

    print_emitter_t emit(stdout);
    emitter = &emit;
    straight_through = true;
    jump_take_number = -1;
    go();                               // Assemble

    emitter = NULL;
    straight_through = false;
    write_limit = 64;

    set64(one, 1);
    set64(zero, 0);

    for (int i = 0; i != 7; ++i)
        set64(base_start + 8 * i, mr_bases[i]);

    test_power(100000, 2, 10);
    test_power(6700417, 2, 6700416);
    test_power(9223372036854775783, 5555, 9223372036854775782);
    test_power((1ul << 63) - 1, 1234, (1ul << 63) - 2);

    test_power(0x100000001, 325, 0x100000000);
    test_power(18446744073709551557u, 2, 18446744073709551556u);

    static unsigned long singles[] = {
        5, 15,
        9223372036854775783, // Largest prime < 2**63
        9219669366496075201, // Carmichael, < 2**63
        18446312605943409265u, // Largest 64 bit SPP carmichael.
        18446744066047760377u, // Largest 64 bit SPP.
        18446744073709551557u, // Largest 64 bit prime.
        0x100000001, 65537,

        // Fail all but one:
        1411807385341, 443538368977861, 4341937413061, 5517315475561,
        3933464309633, 107528788110061 };

    for (int i = 0; i != sizeof singles / sizeof singles[0]; ++i)
        test_single(singles[i]);
}


int main()
{
    miller_rabin_state().run_tests();
    return 0;
}
