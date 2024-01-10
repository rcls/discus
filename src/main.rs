#![deny(warnings)]

pub mod emitter;
pub mod instructions;
pub mod state;
pub mod miller_rabin;

fn main() {
    let mr = miller_rabin::full();
    let code = mr.assemble();

    let stdio = std::io::stdout();
    let mut dis = emitter::Disassemble(stdio.lock());
    emitter::emit(&mut dis, &code).unwrap();
}
