#![deny(warnings)]

pub mod disassemble;
pub mod emitter;
pub mod instructions;
pub mod miller_rabin;
pub mod resistors;
pub mod state;
pub mod spice_load;
pub mod spice_check;

fn main() {
    let mr = miller_rabin::full();
    let code = mr.assemble();

    let stdio = std::io::stdout();

    disassemble::disassemble(std::io::BufWriter::new(stdio.lock()), &code)
        .unwrap();
    //emitter::emit(&mut resistors::Resistors(&mut stdio.lock()), &code)
    //.unwrap();
}
