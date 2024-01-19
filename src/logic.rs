use instructions::constants::*;

pub mod disassemble;
pub mod emitter;
pub mod instructions;
pub mod spice_check;
pub mod spice_load;
pub mod state;
pub mod resistors;

fn main() {
    let mut logic = instructions::Instructions::default();
    logic
        .load (U, 0x36)
        .load (A, U)
        .add  (A)
        .check(|s| s.a == 0x6c)
    .label("n1")
        .jp   (C, "n1")
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

    spice_check::spice_check_args(|_| logic)
}
