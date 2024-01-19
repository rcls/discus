use instructions::constants::*;

pub mod disassemble;
pub mod emitter;
pub mod instructions;
pub mod spice_check;
pub mod spice_load;
pub mod state;
pub mod resistors;

fn main() {
    let mut sub = instructions::Instructions::default();
    sub .sub(A)
        .check(|s| s.c && s.a == 0)
        .jp(C, "carry_on")
    .label("zero_on")
        .sub(X)
        .check(|s| !s.c)
        .sbc(X)
        .sub(X)
        .ret()
    .label("carry_on")
        .sbc(0x7d)
        .load(X, A)
        .check(|s| !s.c)
        .sub(X)
        .check(|s| s.c && s.k == Some(0))
        .jp(Z, "zero_on")
        .check(|_| false);

    spice_check::spice_check_args(|_| sub)
}