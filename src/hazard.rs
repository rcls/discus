use instructions::constants::*;

pub mod disassemble;
pub mod emitter;
pub mod instructions;
pub mod resistors;
pub mod spice_check;
pub mod spice_load;
pub mod state;

fn main() {
    let mut hazard = instructions::Instructions::default();

    hazard
        .xor  (A)
        .sta  (A)
        .load (X, A)
        .incv (Y, X)
        .dec  (A)
        .sta  (Y)
        .load (A, [X])
        .load (A, [Y])
        .load (A, [X])
        .load (A, [Y])

        .ret();

    spice_check::spice_check_args(|_| hazard)
}