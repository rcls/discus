use std::io::Write;

use crate::emitter::{Emitter, Register, Result, Value, Value::*, emit};

pub struct Disassemble<T>(pub T);

pub struct HexDump<T>(pub T);

pub fn disassemble(o: impl Write, program: &[u8]) -> Result {
    let mut b = Disassemble(std::io::BufWriter::new(o));
    emit(&mut b, program)?;
    b.0.flush()
}

pub fn hex_dump(o: impl Write, program: &[u8]) -> Result {
    let mut b = HexDump(std::io::BufWriter::new(o));
    emit(&mut b, program)?;
    b.0.flush()
}

fn write_code(o: &mut impl Write,
              a: u8, op: &[u8], align: bool) -> Result {
    write!(o, "{:02x}:", a)?;
    for &b in op {
        write!(o, " {:02x}", b)?;
    }
    if align {
        write!(o, "{}", &"           "[std::cmp::min(op.len(), 3) * 3 ..])?;
    }
    Ok(())
}

impl<T> Emitter for HexDump<T> where T: Write {
    fn emit_bytes(&mut self, a: u8, op: &[u8]) -> Result {
        write_code(&mut self.0, a, op, false)?;
        writeln!(self.0)
    }
}

impl<T> Emitter for Disassemble<T> where T: Write {
    fn emit_bytes(&mut self, a: u8, op: &[u8]) -> Result {
        write_code(&mut self.0, a, op, false)?;
        writeln!(self.0)
    }
    fn emit_basic(&mut self, a: u8, op: &[u8], opcode: &str) -> Result {
        write_code(&mut self.0, a, op, true)?;
        writeln!(&mut self.0, "{}", opcode)
    }
    fn emit_jump(&mut self, a: u8, op: &[u8],
                 opcode: &str, cc: &str, target: u8) -> Result {
        write_code(&mut self.0, a, op, true)?;
        if cc.len() == 0 {
            writeln!(&mut self.0, "{:4} {:#04x}", opcode, target)
        }
        else {
            writeln!(&mut self.0, "{:4} {},{:#04x}", opcode, cc, target)
        }
    }
    fn emit_ret(&mut self, a: u8, op: &[u8], cc: &str) -> Result {
        write_code(&mut self.0, a, op, true)?;
        if cc.len() == 0 {
            writeln!(&mut self.0, "ret")
        }
        else {
            writeln!(&mut self.0, "ret  {}", cc)
        }
    }
    fn emit_operand(&mut self, a: u8, op: &[u8],
                    opcode: &str, v: Value) -> Result {
        write_code(&mut self.0, a, op, true)?;
        writeln!(&mut self.0, "{:4} {}", opcode, v)
    }
    fn emit_xfer(&mut self, a: u8, op: &[u8],
                 opcode: &str, d: Register, v: Value) -> Result {
        write_code(&mut self.0, a, op, true)?;
        if v == Reg(d) {
            writeln!(&mut self.0, "{:4} {}", opcode, d)
        }
        else {
            writeln!(&mut self.0, "{:4} {},{}", opcode, d, v)
        }
    }
}
