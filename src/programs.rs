use crate::instructions::{Instructions, constants::*};

pub fn add() -> Instructions {
    let mut add = Instructions::default();
    add
        .xor  (A)
        .check(|s| !s.c && s.a == 0)
        .jp   (NZ, "crap")
        .adc  (0x83)
        .load (Y, A)
        .check(|s| !s.c && s.y == 0x83)
        .cl   (C, "crap")
        .add  (Y)
        .check(|s| s.c && s.a == 0x06)
        .adc  (Y)
        .check(|s| s.a == 0x8a)
        .adc  (Y)
        .check(|s| s.c && s.a == 0x0d)
        .add  (Y)
    .label("crap")
        .check(|s| !s.c && s.a == 0x90)
        .ret  ();
    add
}

pub fn call() -> Instructions {
    let mut call = Instructions::default();
    call.call ("sub1")
    .label("loop")
        .jp   (Never, "loop")
        .jp   (Always, "sub3")
    .label("sub1")
        .call ("sub2")
        .ret  ()
    .label("sub2")
        .call ("sub3")
        .ret  ()
    .label("sub3")
        .ret  ();

    call
}

pub fn cmp() -> Instructions {
    let mut cmp = Instructions::default();
    cmp
        .load (A, 33)
        .load (X, 66)
        .check(|s| !s.c)
        .cmp  (X)
        .check(|s| !s.c && s.k != 0)
        .cmp  (A)
        .check(|s| s.c && s.k == 0)
        .rt   (C)
        .rt   (NZ)
        .cmp  (12)
        .check(|s| s.c && s.k != 0)
        .tst  (A)
        .tst  (X)
        .rt   (Z)
        .ret();
    cmp
}

pub fn hazard() -> Instructions {
    let mut hazard = Instructions::default();

    hazard
        .xor  (A)
        .sta  (A)
        .load (X, A)
        .incv (Y, X)
        .sbc  (A)
        .check(|s| s.a == 255)
        .sta  (Y)
        .load (A, [X])
        .load (A, [Y])
        .load (A, [X])
        .load (A, [Y])

        .ret();

    hazard
}

pub fn hazard2() -> Instructions {
    let mut hazard = Instructions::default();
    hazard
        .xor  (A)
        .load (X, A)
        .inc  (A)
        .load (Y, A)
        .sta  (X)
        .load (A, 254)
        .sta  (Y)
        .load (A, [X])
        .load (A, [Y])
        .load (A, [X])
        .load (A, [Y])
        .ret  ();

    hazard
}

pub fn inc() -> Instructions {
    let mut inc = Instructions::default();

    inc
        .sub  (A)
        .check(|s| s.c && s.a == 0)
        .sta  (A)  // Sets up bad case for dec having to flip strobes!
        .decv (X, A)
        .load (Y, X)
        .incv (U, Y)
        .cl   (Z, "retc")
        .check(|s| s.u == 0)
        .add  (U)
        .check(|s| !s.c && s.a == 0)
        .decv (X, A)
        .inc  (X)
        .inc  (X)
        .inc  (X)
        .ret()
    .label("retc")
        .rt   (C);

    inc
}

pub fn logic() -> Instructions {
    let mut logic = Instructions::default();
    logic
        .load (U, 0x36)
        .load (A, U)
        .add  (A)
        .check(|s| !s.c && s.a == 0x6c)
    .label("n1")
        .cl   (C, "n1")
        .load (Y, A)
        .xor  (U)
        .check(|s| s.a == 0x5a)
        .or   (Y)
        .check(|s| s.a == 0x7e)
        .and  (U)
        .check(|s| s.a == 0x36)
        .and  (Y)
        .check(|s| s.a == 0x24)

        .ret  ();

    logic
}

pub fn mem() -> Instructions {
    let mut mem = Instructions::default();
    mem
        .xor  (A)
        .check(|s| !s.c)
        .sta  (0x15)
        .sbc  (A)
        .check(|s| s.a == 255)
        .sta  (0x08)
        .dec  (A)
        .sta  (0x01)
        .load (X, [0x01])
        .load (Y, [0x08])
        .load (U, [0x15])
        .ret  ();
    mem
}

pub fn memf() -> Instructions {
    let mut memf = Instructions::default();
    memf
        .load (A, 0x17)
        .load (X, A)
        .sta  (X)
        .add  (A)
        .sta  (X)
        .load (Y, [X])
        .load (Y, [X])
        .add  (A)
        .sta  (X)
        .load (Y, [X])
        .ret  ();
    memf
}

pub fn memi() -> Instructions {
    let mut memi = Instructions::default();
    memi
        .load (X, 0x01)
        .load (Y, 0x08)
        .load (U, 0x15)
        .xor  (A)
        .check(|s| !s.c && s.a == 0)
        .sta  (U)
        .sbc  (A)
        .check(|s| s.a == 255)
        .sta  (Y)
        .dec  (A)
        .sta  (X)
        .load (A, [X])
        .load (A, [Y])
        .load (A, [U])
        .ret  ();
    memi
}

pub fn memp() -> Instructions {
    let mut memp = Instructions::default();
    memp
        .load (X, 0x01)
        .incv (Y, X)
        .incv (U, Y)
        .load (A, Y)
        .sta  (X)
        .load (A, U)
        .sta  (Y)
        .load (A, X)
        .sta  (U)
        .add  ([X])
        .add  ([Y])
        .mem  (U).add(A)  // Long form of add([U])
        .ret  ();
    memp
}

pub fn memw() -> Instructions {
    let mut memw = Instructions::default();
    memw
        .xor  (A)
        .load (X, A)
        .sta  (X)
        .load (Y, [X])
        .dec  (A)
        .sta  (X)
        .load (Y, [X])
        .inc  (A)
        .sta  (A)
        .load (Y, [X])
        .dec  (A)
        .sta  (X)
        .load (Y, [X])
        .ret  ();
    memw
}

pub fn ret() -> Instructions {
    // This is laid out to produce glitches on the rom bit lines.
    let mut ret = Instructions::default();
    ret .call ("retz")
        .call ("retnz")
        .ret  ()
        .byte(0x18).byte(0x18).byte(0x18).byte(0x18)
        .byte(0x18).byte(0x18).byte(0x18).byte(0x18)
        .byte(0x18)
    .label("retz")
        .xor  (A)
        .check(|s| s.k == 0)
        .check(|s| !s.c)
        .rt   (C)
        .rt   (Z)
        .byte(0x18).byte(0x18).byte(0x18).byte(0x18)
    .label("retnz")
        .sub  (A)
        .inc  (A)
        .check(|s| s.k == 1)
        .check(|s| s.c)
        .rt   (NC)
        .rt   (NZ)
        .byte(0x18).byte(0x18).byte(0x18).byte(0x18)
        .byte(0x18).byte(0x18).byte(0x18);
    ret
}

pub fn sub() -> Instructions {
    let mut sub = Instructions::default();
    sub .sub  (A)
        .check(|s| s.c && s.a == 0)
        .jp   (C, "carry_on")
    .label("zero_on")
        .sub  (X)
        .check(|s| !s.c)
        .sbc  (X)
        .sub  (X)
        .ret  ()
    .label("carry_on")
        .sbc  (0x7d)
        .load (X, A)
        .check(|s| !s.c)
        .sub  (X)
        .check(|s| s.c && s.k == 0)
        .jp   (Z, "zero_on")
        .check(|_| false);

    sub
}
