use instructions::{Instructions, constants::*};

pub mod disassemble;
pub mod emitter;
pub mod instructions;
pub mod spice_check;
pub mod spice_load;
pub mod state;
pub mod resistors;

fn add() -> Instructions {
    let mut i = instructions::Instructions::default();
    i
        .xor  (A)
        .check(|s| !s.c && s.a == 0)
        .jp   (NZ, "crap")
        .adc  (0x83)
        .load (Y, A)
        .check(|s| !s.c)
        .jp   (C, "crap")
        .add  (Y)
        .check(|s| s.c)
        .adc  (Y)
        .adc  (Y)
        .check(|s| s.c)
        .add  (Y)
    .label("crap")
        .ret  ();
    i
}

fn main() {
    spice_check::spice_check_args(|_| add())
}
