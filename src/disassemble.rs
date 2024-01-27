use std::io::Write;

use crate::emitter::{Emitter, Register, Result, Value, Value::*, emit};

struct Disassemble<T>(T);

struct HexDump<T>(T);

struct Verilog<T>(T);

pub fn disassemble(o: impl Write, program: &[u8]) -> Result {
    let mut b = Disassemble(o);
    emit(&mut b, program)?;
    b.0.flush()
}

pub fn hex_dump(o: impl Write, program: &[u8]) -> Result {
    let mut b = HexDump(o);
    emit(&mut b, program)?;
    b.0.flush()
}

pub fn verilog(o: impl Write, program: &[u8]) -> Result {
    let mut b = Verilog(o);
    emit(&mut b, program)?;
    b.0.flush()
}

fn write_code(o: &mut impl Write, a: u8, op: &[u8], align: bool) -> Result {
    write!(o, "{a:02x}:")?;
    for b in op {
        write!(o, " {b:02x}")?;
    }
    if align {
        write!(o, "{}", &"           "[op.len().min(3) * 3 ..])?;
    }
    Ok(())
}

impl<T: Write> Emitter for HexDump<T> {
    fn emit_bytes(&mut self, a: u8, op: &[u8]) -> Result {
        write_code(&mut self.0, a, op, false)?;
        writeln!(self.0)
    }
}

impl<T: Write> Emitter for Disassemble<T> {
    fn emit_bytes(&mut self, a: u8, op: &[u8]) -> Result {
        write_code(&mut self.0, a, op, false)?;
        writeln!(self.0)
    }
    fn emit_basic(&mut self, a: u8, op: &[u8], opcode: &str) -> Result {
        write_code(&mut self.0, a, op, true)?;
        writeln!(&mut self.0, "{opcode}")
    }
    fn emit_jump(&mut self, a: u8, op: &[u8],
                 opcode: &str, cc: &str, target: u8) -> Result {
        write_code(&mut self.0, a, op, true)?;
        if cc.len() == 0 {
            writeln!(&mut self.0, "{opcode:4} {target:#04x}")
        }
        else {
            writeln!(&mut self.0, "{opcode:4} {cc},{target:#04x}")
        }
    }
    fn emit_ret(&mut self, a: u8, op: &[u8], cc: &str) -> Result {
        write_code(&mut self.0, a, op, true)?;
        if cc.len() == 0 {
            writeln!(&mut self.0, "ret")
        }
        else {
            writeln!(&mut self.0, "ret  {cc}")
        }
    }
    fn emit_operand(&mut self, a: u8, op: &[u8],
                    opcode: &str, v: Value) -> Result {
        write_code(&mut self.0, a, op, true)?;
        writeln!(&mut self.0, "{opcode:4} {v}")
    }
    fn emit_xfer(&mut self, a: u8, op: &[u8],
                 opcode: &str, d: Register, v: Value) -> Result {
        write_code(&mut self.0, a, op, true)?;
        if v == Reg(d) {
            writeln!(&mut self.0, "{opcode:4} {d}")
        }
        else {
            writeln!(&mut self.0, "{opcode:4} {d},{v}")
        }
    }
}

impl<T: Write> Emitter for Verilog<T> {
    fn emit_bytes(&mut self, _a: u8, bb: &[u8]) -> Result {
        let mut bb = bb.iter();
        if let Some(b) = bb.next() {
            write!(self.0, "8'h{b:02x},")?;
        }
        for b in bb {
            write!(self.0, " 8'h{b:02x},")?;
        }
        writeln!(self.0)
    }
}
