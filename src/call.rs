pub mod emitter;
pub mod instructions;
pub mod disassemble;
pub mod resistors;
pub mod spice_load;
pub mod spice_check;
pub mod state;

fn main() {
    let mut call = instructions::Instructions::default();
    call.call("sub1")
        .ret()
    .label("sub1")
        .call("sub2")
        .ret()
    .label("sub2")
        .call("sub3")
        .ret()
    .label("sub3")
        .ret();

    spice_check::spice_check_args(|_| call);
}