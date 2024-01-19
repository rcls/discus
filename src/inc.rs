use instructions::constants::*;

pub mod disassemble;
pub mod emitter;
pub mod instructions;
pub mod resistors;
pub mod spice_check;
pub mod spice_load;
pub mod state;

fn main() {
    let mut inc = instructions::Instructions::default();

    inc
        .sub  (A)
        .check(|s| s.c && s.a == 0)
        .decv (X, A)
        .load (Y, X)
        .incv (U, Y)
        .cl   (Z, "ret")
        .check(|s| s.u == 0)
        .add  (U)
        .check(|s| !s.c && s.a == 0)
        .decv (X, A)
        .inc  (X)
        .inc  (X)
        .inc  (X)
    .label("ret")
        .ret();

    spice_check::spice_check_args(|_| inc)
}
