use self::Operand::*;

use std::mem::take;

type Result = std::io::Result<()>;

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Operand {
    Reg(char),
    Const(u8),
    MemReg(char),
    MemConst(u8),
}

impl std::fmt::Display for Operand {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match *self {
            Reg     (c) => write!(f, "{}"       , c),
            Const   (c) => write!(f, "{:#04x}"  , c),
            MemReg  (c) => write!(f, "[{}]"     , c),
            MemConst(c) => write!(f, "[{:#04x}]", c),
        }
    }
}

pub struct Hexdump<T>(pub T);

fn write_code(o: &mut impl std::io::Write,
              a: u8, op: &[u8], align: bool) -> Result {
    write!(o, "{:02x}:", a)?;
    for &b in op {
        write!(o, " {:02x}", b)?;
    }
    if align {
        match op.len() {
            0 => write!(o, "           ")?,
            1 => write!(o, "        ")?,
            2 => write!(o, "     ")?,
            _ => write!(o, "  ")?,
        }
    }
    Ok(())
}

impl<T> Emitter for Hexdump<T> where T: std::io::Write {
    fn emit_bytes(&mut self, a: u8, op: &[u8]) -> Result {
        write_code(&mut self.0, a, op, false)?;
        writeln!(self.0)
    }
}

pub struct Disassemble<T>(pub T);

impl<T> Emitter for Disassemble<T> where T: std::io::Write {
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
                    opcode: &str, v: Operand) -> Result {
        write_code(&mut self.0, a, op, true)?;
        writeln!(&mut self.0, "{:4} {}", opcode, v)
    }
    fn emit_xfer(&mut self, a: u8, op: &[u8],
                 opcode: &str, d: char, v: Operand) -> Result {
        write_code(&mut self.0, a, op, true)?;
        if v == Reg(d) {
            writeln!(&mut self.0, "{:4} {}", opcode, d)
        }
        else {
            writeln!(&mut self.0, "{:4} {},{}", opcode, d, v)
        }
    }
}

pub trait Emitter {
    // ops.len() will be in 1..=3.  3 only occurs if one of the below is not
    // implemented.  (1 and 2 may occur on illegal byte sequences).
    fn emit_bytes(&mut self, a: u8, op: &[u8]) -> Result;

    fn emit_jump(&mut self, a: u8, op: &[u8],
                 _opcode: &str, _cond: &str, _address: u8) -> Result {
        self.emit_bytes(a, op)
    }

    fn emit_ret(&mut self, a: u8, op: &[u8], _cond: &str) -> Result {
        self.emit_bytes(a, op)
    }

    fn emit_basic(&mut self, a: u8, op: &[u8], _opcode: &str) -> Result {
        self.emit_bytes(a, op)
    }

    fn emit_operand(&mut self, a: u8, op: &[u8],
                    _opcode: &str, _value: Operand) -> Result {
        self.emit_bytes(a, op)
    }

    fn emit_xfer(&mut self, a: u8, op: &[u8],
                 _opcode: &str, _d: char, _v: Operand) -> Result {
        self.emit_bytes(a, op)
    }
}



impl Emitter for usize {
    fn emit_bytes(&mut self, _a: u8, op: &[u8]) -> Result {
        *self += op.len();
        Ok(())
    }
}

static CONDITIONS: [&str; 8] = [
    "", "never", "always2", "never2", "z", "nz", "c", "nc"
];
static REGISTERS: [char; 4] = ['A', 'X', 'Y', 'U'];

static ARITH: [&str; 16] = [
    "add", "sub", "or", "and", "adc", "sbc", "xor", "and2",
    "addy", "suby", "ory", "andy", "adcy", "sbcy", "xory", "an2y",
];

static XFER: [&str; 4] = ["inc", "dec", "load", "load"];

fn steal(con: u8, op: u8) -> u8 { con + (op << 6) }

struct Prefixes<T> {
    constant: Option<u8>,
    memory: Option<u8>,
    e: T,
}

impl<T: Emitter> Prefixes<&'_ mut T> {
    fn eject(&mut self, a: u8) -> Result {
        match (take(&mut self.constant), take(&mut self.memory)) {
            (None, None) => Ok(()),
            (Some(con), None) => self.e.emit_operand(
                a - 1, &[con], "pre", Const(con)),
            (None, Some(mem)) => self.e.emit_operand(
                a - 1, &[mem], "pre", MemReg(REGISTERS[mem as usize & 3])),
            (Some(con), Some(mem)) => self.e.emit_operand(
                a - 2, &[con, mem], "pre", MemConst(steal(con, mem))),
        }
    }

    fn get_ops<'a, 'b>(&'a mut self, a: u8, op: u8, b: &'b mut [u8; 3])
                       -> (u8, &'b [u8], Operand)
    {
        let reg = |x| REGISTERS[x as usize & 3];
        match (take(&mut self.constant), take(&mut self.memory)) {
            (None, None) => { *b = [op, 0, 0]; (a, &b[0..1], Reg(reg(op))) }
            (Some(con), None) => {
                *b = [con, op, 0];
                (a - 1, &b[0..2], Const(steal(con, op)))
            }
            (None, Some(mem))
                => { *b = [mem, op, 0]; (a - 1, &b[0..2], MemReg(reg(mem))) }
            (Some(con), Some(mem)) => {
                *b = [con, mem, op];
                (a - 2, &b[..], MemConst(steal(con, mem)))
            }
        }
    }

    fn emit_operand(&mut self, a: u8, op: u8, opcode: &str) -> Result {
        // A memory prefix with non-zero register bits gets ejected.
        if self.memory.is_some() && (op & 3 != 0 || op & 0xcc == 0xcc) {
            self.eject(a)?;
        }
        let mut buffer = [0, 0, 0];
        let (a, ops, v) = self.get_ops(a, op, &mut buffer);
        self.e.emit_operand(a, ops, opcode, v)
    }

    fn emit_xfer(&mut self, a: u8, op: u8) -> Result {
        // A memory prefix with non-zero register bits gets ejected,
        // as does a LOAD with a memory prefix.
        if self.memory.is_some() && (op & 3 != 0 || op & 0xc8 == 0xc8) {
            self.eject(a)?;
        }
        let opcode = XFER[op as usize >> 2 & 3];
        let mut buffer = [0, 0, 0];
        let (a, ops, mut operand) = self.get_ops(a, op, &mut buffer);
        if op & 0xcc == 0xcc {          // Special case the LOAD [*] operand.
            if let Some(con) = self.constant {
                operand = MemConst(steal(con, op))
            }
            else {
                operand = MemReg(REGISTERS[op as usize & 3])
            }
        }
        self.e.emit_xfer(a, ops, opcode,
                         REGISTERS[op as usize >> 4 & 3], operand)
    }

    fn emit(&mut self, a: u8, op: u8) -> Result {
        match op {
            0x00..=0x3f => {
                if self.memory.is_some() {
                    self.eject(a)?;
                }
                if let Some(con) = take(&mut self.constant) {
                    let cc = op as usize >> 2 & 7;
                    let opcode = if op & 0x20 == 0 {"jump"} else {"call"};
                    self.e.emit_jump(a - 1, &[con, op],
                                     opcode, CONDITIONS[cc], steal(con, op))?;
                }
                else {
                    self.constant = Some(op);
                }
            }
            0x40        => self.e.emit_basic(a, &[op], "out")?,
            0x4c..=0x4f => self.emit_operand(a, op, "sta")?,
            0x50        => self.e.emit_basic(a, &[op], "inp")?,
            0x5c..=0x5f => {            // MEM prefix.
                if self.memory.is_some() {
                    self.eject(a)?;
                }
                self.memory = Some(op);
            }
            0x64..=0x67 => self.emit_operand(a, op, "cmp")?,
            0x6c..=0x6f => self.emit_operand(a, op, "tst")?,
            0x60..=0x7f => {            // Returns.
                self.eject(a)?;
                let cc = op as usize >> 2 & 7;
                if op & 3 == 0 {
                    self.e.emit_ret(a, &[op], CONDITIONS[cc])?;
                }
                else {
                    self.e.emit_bytes(a, &[op])?;
                }
            }

            0x80..=0xbf => self.emit_operand(
                a, op, ARITH[op as usize >> 2 & 15])?,
            0xc0..=0xff => self.emit_xfer(a, op)?,

            _ => {
                self.eject(a)?;
                self.e.emit_bytes(a, &[op])?;
            }
        }
        Ok(())
    }
}

pub fn emit(e: &mut impl Emitter, program: &[u8]) -> Result {
    let mut prefixes = Prefixes{constant: None, memory: None, e};
    for (a, op) in program.iter().enumerate() {
        prefixes.emit(a as u8, *op)?;
    }
    prefixes.eject(program.len() as u8)?;
    Ok(())
}

#[test]
fn count_check() {
    let full = crate::miller_rabin::full().assemble();
    struct CheckAddress(usize);
    impl Emitter for CheckAddress {
        fn emit_bytes(&mut self, a: u8, ops: &[u8]) -> Result {
            assert_eq!(a as usize, self.0);
            self.0 += ops.len();
            Ok(())
        }
    }
    let mut ca = CheckAddress(0);
    emit(&mut ca, &full).unwrap();
    assert_eq!(ca.0, full.len());
}
