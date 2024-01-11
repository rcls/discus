#![deny(warnings)]

pub mod disassemble;
pub mod emitter;
pub mod instructions;
pub mod miller_rabin;
pub mod state;
pub mod resistors;

fn main() {
    let mr = miller_rabin::full();
    let code = mr.assemble();

    let stdio = std::io::stdout();
    {
        let mut dis = disassemble::Disassemble(stdio.lock());
        emitter::emit(&mut dis, &code).unwrap();
    }
    emitter::emit(&mut resistors::Resistors(&mut stdio.lock()), &code)
        .unwrap();
}
