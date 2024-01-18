
use crate::emitter::{Emitter, Result, emit};

pub fn resistors(o: &mut impl std::io::Write, code: &[u8]) -> Result {
    emit(&mut Resistors(o), code)
}

pub struct Resistors<'a, T>(pub &'a mut T);

impl<T: std::io::Write> Emitter for Resistors<'_, T> {
    fn emit_bytes(&mut self, a: u8, ops: &[u8]) -> Result {
        for (i, op) in ops.iter().enumerate() {
            let a = a + i as u8;
            let board = (a >> 6 & 3) + b'R';
            let rom16 = (a >> 4 & 3) + b'A';
            let rom4  = (a >> 2 & 3) + b'A';
            let row   = (a & 3)      + b'A';
            for bit in 0..8 {
                if op & 1 << bit != 0 {
                    writeln!(self.0, "R{}{}{}{}{}", bit,
                             row as char, rom4 as char, rom16 as char,
                             board as char)?
                }
            }
        }
        Ok(())
    }
}
