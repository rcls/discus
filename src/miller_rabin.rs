use crate::instructions::{Instructions, constants::*};
use crate::state::State;

const MR_BASES: [u64; 7] = [2, 325, 9375, 28178, 450775, 9780504, 1795265022];

// Word length.
const LEN: u8 = 8;
// Addresses.  8 byte entries point to last byte.
const RESULT  : u8 = LEN;
const TEMP    : u8 = LEN * 2;
const MODULUS : u8 = LEN * 3;
const PRODUCT : u8 = LEN * 4;
const FACTOR  : u8 = LEN * 5;
const EXPONENT: u8 = LEN * 6;
const BASE    : u8 = LEN * 7;

const ZERO: u8 = 0xbf;
const ONE: u8 = 0xc7;
const BASE_START: u8 = 0xcf;

const OUTER_LOOP_COUNT: u8 = 0;
const MULT_LOOP_COUNT: u8 = 63;
const BASE_INDEX: u8 = 62;
const EXP_TWOS: u8 = 61;

pub fn miller_rabin(n: usize) -> Instructions {
    match n {
        0 => full(),
        1 => single(),
        2 => math(),
        _ => panic!("Unknown variant number {}", n),
    }
}

pub fn full() -> Instructions {
    let mut i = Instructions::default();
    input(&mut i);
    work(&mut i);
    arithmetic(&mut i);
    i
}

pub fn single() -> Instructions {
    let mut i = Instructions::default();
    work(&mut i);
    arithmetic(&mut i);
    i.label("restart")
        .inc(A)
        .ret();
    i
}

pub fn math() -> Instructions {
    let mut i = Instructions::default();
    power_body(&mut i).ret();
    arithmetic(&mut i);
    i
}

fn input(i: &mut Instructions) -> &mut Instructions {
    i.label("restart")
        .inc (A)
        .out ()

    // The input consists of 64bits BE...
    .label("read1")
        // We sample bit 6 on the rising edge of bit 7...
        .inp ()
        .add (A)
        .jp  (NC, "read1")
        .add (A)
        .load(X, MODULUS)
        .call("leftrot")

        // Wait for bit 7 to fall.  If bit 6 stays up we are done.
    .label("read0")
        .inp ()
        .add (A)
        .jp  (C, "read0")
        .add (A)
        .jp  (NC, "read1")
        .sub (A)
        .out ()
}

fn work(i: &mut Instructions) -> &mut Instructions {
    i.label("single")
        .load(Y, MODULUS)
        .load(X, EXPONENT)
        .call("copy")
        .load(Y, LEN * 8 - 1)

    .label("expgen1")  // Find the position of the lowest 1 bit in (modulus-1).
        .call("leftrot_exponent")
        .jp  (NC, "expgen2")
        .load(A, Y)
        .sta (EXP_TWOS)

    .label("expgen2")
        .dec (Y)
        .jp  (NZ, "expgen1")

        .load(A, BASE_START)           // Loop over the bases.
    .label("main_loop")
        .sta (BASE_INDEX)
        .load(Y, ONE)
        .call("copy_to_product")
        .load(Y, [BASE_INDEX])
        .call("mult")
        .call("classify")
        .load(A,A)
        .jp  (Z, "main_loop_next");

    // Now do the exponentiation....
    assert_eq!(PRODUCT, MODULUS + LEN);
    assert_eq!(BASE, EXPONENT + LEN);
    i   .load(Y, PRODUCT)
        .load(X, BASE)
        .call("copy")
        // Y = MODULUS,
        // X = EXPONENT.
        .call("copy");

        // Fall into power...  At this point we should have
        // result==product==base.
    power_body(i)
        .call("classifyp1")
        .and (0xfd)
        .jp  (Z, "main_loop_next")      // Got 1 or -1, passes this check.

        .load(Y, [EXP_TWOS])
    .label("square_loop")
        .decv(A, Y)
        .jp  (Z, "restart")             // Didn't get to -1, not prime.
        .call("square")
        .call("classifyp1")
        .load(Y,[OUTER_LOOP_COUNT])
        .load(A, A)
        .jp  (NZ, "square_loop")        // Not -1 yet.

    .label("main_loop_next")            // We've passed this check, on to next.
        .load(A, [BASE_INDEX])
        .add (8)
        .jp  (NC, "main_loop")
        .jump("restart")                // Passed all checks.

    .label("classifyp1")                // Classify result+1
        .load(X, ONE)
        .call("add64m")

        // If result is multi-byte, return A = -1, C = 1.
        // Else return result in A and C = 0.
    .label("classify")
        .load(X, RESULT - 1)
        .sub (A)
    .label("classify1")
        // A=0 at this point, so SUBM(X) sets C=!Z and Z reflects M(X).
        .sub ([X])
        // Sets A=0 or -1 (C-1), preserves C, sets Z=!C (which we already had).
        .sbc (A)
        // The Z flag works here with or without a hazard.
        .rt  (NZ)
        .dec (X)
        .jp  (NZ, "classify1")
        .add ([RESULT])                 // A=[result] but sets flags.
        .ret ()
}


fn power_body(i: &mut Instructions) -> &mut Instructions {
    i.label("power")
        .load(A, LEN * 8)
        .sub ([EXP_TWOS])

        // First left shift until we find a set bit...
        .load(Y,A)

    .label("power_y")
        .call("leftrot_exponent")
        .dec (Y)
        .jp  (NC, "power_y")            // Note that exponent==0 never happens.
        .load(A, Y)
        .jp  (Z, "power_x")

    .label("power_1")
        .call("square")                 // Starts with sta(OUTER_LOOP_COUNT).
        .call("leftrot_exponent")
        .load(Y, BASE)
        .cl  (C, "mult")
        .decv(A, [OUTER_LOOP_COUNT])
        .jp  (NZ, "power_1")

    .label("power_x")
}


fn arithmetic(i: &mut Instructions) -> &mut Instructions {
    i.label("square")
        .sta (OUTER_LOOP_COUNT)
        .load(Y, PRODUCT)

    .label("mult")
        .load(X, FACTOR)
        .call("copy")
        .load(Y, ZERO)
        .load(X, RESULT)
        .call("copy")
        .load(A, LEN * 8)
    .label("mult1")
        .sta (MULT_LOOP_COUNT)
        .load(X, RESULT)
        .call("add64m");                  // result * 2 -> result
    assert!(FACTOR == PRODUCT + LEN); // Leaves x==product below.
    i   .load(X, FACTOR)
        .call("leftrot")
        // mov(X, PRODUCT)
        .cl  (C, "add64m")
        .decv(A, [MULT_LOOP_COUNT])
        .jp  (NZ, "mult1")
        .load(Y, RESULT)

    .label("copy_to_product")
        .load(X, PRODUCT)
        .jump("copy");

    i.label("leftrot_exponent")
        .load(X, EXPONENT)
    .label("leftrot")
        .load(U, LEN)
    .label("leftrot1")
        .load(A, [X])
        .adc (A)
        .sta (X)
        .dec (X)
        .dec (U)
        .jp  (NZ, "leftrot1")
        .ret ();

    i.label("add64m")                 // result + mem(X) -> result (mod modulus)
        .clrc()
        .load(Y, RESULT)
    .label("add64m1")
        .load(A, [Y])
        .adc ([X])
        .sta (Y)
        .dec (X)
        .dec (Y)
        .jp  (NZ, "add64m1");

    // Do a trial subtract result - modulus -> temp
    assert!(TEMP == RESULT + LEN);        // necessary to leave X==result below.
    assert!(MODULUS == TEMP + LEN);       // And Y==temp.
    i   .load(U, RESULT)
        .load(Y, MODULUS)
        .load(X, TEMP)
        .jp  (NC, "add64m2")
        .load(X, U)      // Write subtract into result; will leave NC & no copy.
    .label("add64m2")
        .setc()
    .label("add64m3")
        .load(A, [U])
        .sbc ([Y])
        .sta (X)
        .dec (Y)
        .dec (X)
        .dec (U)
        .jp  (NZ, "add64m3")
        .rt  (NC)

    .label("copy")
        .load(U, LEN)
    .label("copy1")
        .load(A, [Y])
        .sta (X)
        .dec (X)
        .dec (Y)
        .dec (U)
        .jp  (NZ, "copy1")
        .ret ()
}

fn poke64top(s: &mut State, a: u8, v: u64) {
    let a = a as usize;
    s.memory.0[a-7..=a].copy_from_slice(&v.to_be_bytes());
}

#[cfg(test)]
fn peek64top(s: &State, a: u8) -> u64 {
    let a = a as usize;
    u64::from_be_bytes(s.memory.0[a-7..=a].try_into().unwrap())
}

pub fn initial() -> State {
    let mut s = State::default();
    for (i, &base) in MR_BASES.iter().enumerate() {
        poke64top(&mut s, BASE_START + i as u8 * LEN, base);
    }
    poke64top(&mut s, ONE, 1);
    s
}

#[cfg(test)]
fn run(state: &mut State, program: &Instructions, l: &str) {
    let code = program.assemble();
    let initial_sp = state.sp;
    let initial_pc = state.pc;
    state.pc = program.labels[l];

    while state.sp >= initial_sp {
        state.step(&code);
    }
    state.sp += 1;                      // Undo the final ret.
    state.pc = initial_pc;
}

#[cfg(test)]
fn mult(x: u64, y: u64, modulus: u64) -> u64 {
    (x as u128 * y as u128 % modulus as u128) as u64
}

#[cfg(test)]
fn power(mut base: u64, mut exp: u64, modulus: u64) -> u64 {
    let mut result = 1;
    while exp != 0 {
        if exp & 1 != 0 {
            result = mult(result, base, modulus);
        }
        base = mult(base, base, modulus);
        exp >>= 1;
    }
    result
}

#[cfg(test)]
fn test_power_one(base: u64, exp: u64, modulus: u64) {
    let mut state = State::default();
    poke64top(&mut state, MODULUS, modulus);
    poke64top(&mut state, BASE, base % modulus);
    poke64top(&mut state, PRODUCT, base % modulus);
    poke64top(&mut state, EXPONENT, exp);

    state.memory.0[EXP_TWOS as usize] = 0;

    run(&mut state, &math(), "power");

    let got = peek64top(&state, PRODUCT);
    let expect = power(base, exp, modulus);
    assert_eq!(got, expect);
}

#[test]
fn test_power() {
    test_power_one(2, 10, 100000);
    test_power_one(2, 6700416, 6700417);
    test_power_one(5555, 9223372036854775782, 9223372036854775783);
    test_power_one(1234, (1 << 63) - 2, (1 << 63) - 1);

    test_power_one(325, 0x100000000, 0x100000001);
    test_power_one(2, 18446744073709551556, 18446744073709551557);
}

#[test]
fn test_mult() {
    // product * mem(Y) -> product (mod modulus), product should be reduced.
    let mut state = State::default();
    poke64top(&mut state, PRODUCT, 12345);
    poke64top(&mut state, BASE, 54321);
    poke64top(&mut state, MODULUS, 28178);
    state.y = BASE;

    run(&mut state, &math(), "mult");

    let r = peek64top(&state, PRODUCT);
    assert_eq!(r, 12345 * 54321 % 28178);
}

#[test]
fn test_leftrot() {
    let math = math();
    let mut state = State::default();

    let value = 0x123456789abcdef0;
    poke64top(&mut state, PRODUCT, value);

    for i in 0..64 {
        state.c = false;
        state.x = PRODUCT;
        let hi = peek64top(&state, PRODUCT) >> 63 != 0;

        run(&mut state, &math, "leftrot");

        assert_eq!(peek64top(&state, PRODUCT),
                   value.wrapping_shl(i).wrapping_shl(1), "{}", i);
        assert_eq!(state.c, hi, "{}", i);
    }
}

#[test]
fn test_copy() {
    let mut state = State::default();
    poke64top(&mut state, PRODUCT, 0x123456789abcdef0);
    state.y = PRODUCT;
    state.x = TEMP;

    run(&mut state, &math(), "copy");

    let r = peek64top(&state, TEMP);
    assert_eq!(r, 0x123456789abcdef0);
}

#[test]
fn assemble_full() {
    let full = full();
    let code = full.assemble();
    println!("Full has {:#x} bytes", code.len());
    for (k, v) in full.labels {
        println!("{} {}", k, v);
    }
}

#[cfg(test)]
fn is_prime(n: u64) -> bool {
    let tz = (n - 1).trailing_zeros();
    let exp = (n - 1) >> tz;
    'check: for base in MR_BASES {
        if base % n == 0 {
            continue;
        }
        let mut pw = power(base, exp, n);
        if pw == 1 {
            continue;
        }
        for _ in 0 .. tz {
            if pw + 1 == n {
                continue 'check;
            }
            pw = mult(pw, pw, n);
        }
        return false;
    }
    true
}

#[cfg(test)]
fn test_single_one(n: u64) {
    let mut state = initial();
    poke64top(&mut state, MODULUS, n);
    run(&mut state, &single(), "single");
    let result = state.a;
    let expect = if is_prime(n) { LEN } else { 1 };
    assert_eq!(result, expect, "{} {} {} {}", n, is_prime(n), result, expect);
}

#[test]
fn test_single() {
    let singles = [
        5, 15,
        9223372036854775783,           // Largest prime < 2**63
        9219669366496075201,           // Carmichael, < 2**63
        18446312605943409265,          // Largest 64 bit carmichael.
        18446744066047760377,          // Largest 64 bit 2-SPP.
        18446744073709551557,          // Largest 64 bit prime.
        0x100000001, 65537,

        // Fail all but one:
        1411807385341, 443538368977861, 4341937413061, 5517315475561,
        3933464309633, 107528788110061
    ];
    for s in singles {
        test_single_one(s);
    }
}

#[test]
fn count_check() {
    let full = full().assemble();
    let mut ca = 0;
    crate::emitter::emit(&mut ca, &full).unwrap();
    assert_eq!(ca, full.len());
}
