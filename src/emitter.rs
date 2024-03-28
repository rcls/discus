pub use crate::instructions::{Register, Value, Value::*};

pub type Result = std::io::Result<()>;

impl std::fmt::Display for Register {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        use std::fmt::Write;
        f.write_char(['A', 'X', 'Y', 'U'][*self as usize])
    }
}

impl std::fmt::Display for Value {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match *self {
            Reg   (r) => write!(f, "{r}"),
            Num   (n) => write!(f, "{n:#04x}"),
            MemReg(r) => write!(f, "[{r}]"),
            MemNum(n) => write!(f, "[{n:#04x}]"),
            Input     => write!(f, "IN"),
        }
    }
}

fn reg(r: u8) -> Register {
    use Register::*;
    [A, X, Y, U][r as usize & 3]
}

pub trait Emitter {
    // When called from emit(), ops.len() will be in 1..=3.  3 only occurs if
    // one of the below is not implemented.  (1 and 2 may occur on illegal byte
    // sequences, even if all the below are implemented).
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

    fn emit_operand(&mut self, a: u8, op: &[u8], _opcode: &str, _value: Value)
                    -> Result {
        self.emit_bytes(a, op)
    }

    fn emit_xfer(&mut self, a: u8, op: &[u8],
                 _opcode: &str, _d: Register, _value: Value) -> Result {
        self.emit_bytes(a, op)
    }
}

impl Emitter for usize {
    fn emit_bytes(&mut self, a: u8, op: &[u8]) -> Result {
        assert_eq!(*self, a as usize);
        *self += op.len();
        Ok(())
    }
}

static CONDITIONS: [&str; 8] = [
    "", "Never", "Z", "NZ", "C", "NC", "CZ", "NCZ"
];

static ARITH: [&str; 16] = [
    "add", "sub", "or", "and", "adc", "sbc", "xor", "dnc",
    "tadd", "cmp", "tor", "test", "tadc", "tsbc", "txor", "tdnc",
];

static XFER: [&str; 4] = ["inc", "dec", "load", "load"];

fn steal(con: u8, op: u8) -> u8 { con + (op << 6) }

enum Prefix {
    NoPrefix,
    Constant(u8),
    Memory(u8),
    MemConst(u8, u8),
    Inp(u8),
}
use Prefix::*;

impl Prefix {
    fn steals(&self) -> bool {
        matches!(self, Constant(_))
    }
    fn memory(&self) -> bool {
        matches!(self, Memory(_)) || matches!(self, MemConst(_, _))
    }
}

struct Emission<T> {
    prefix: Prefix,
    e: T,
}

impl<T: Emitter> Emission<&'_ mut T> {
    fn eject(&mut self, a: u8) -> Result {
        match std::mem::replace(&mut self.prefix, NoPrefix) {
            NoPrefix => Ok(()),
            Constant(con) => self.e.emit_operand(
                a - 1, &[con], "pre", Num(con)),
            Memory(mem) => self.e.emit_operand(
                a - 1, &[mem], "pre", MemReg(reg(mem))),
            MemConst(con, mem) => self.e.emit_operand(
                a - 2, &[con, mem], "pre", MemNum(steal(con, mem))),
            Inp(inp) => self.e.emit_operand(a - 1, &[inp], "pre", Input),
        }
    }

    fn get_ops<'a, 'b>(&'a mut self, a: u8, op: u8, b: &'b mut [u8; 3])
                       -> (u8, &'b [u8], Value) {
        match std::mem::replace(&mut self.prefix, NoPrefix) {
            NoPrefix
                => { *b = [op, 0, 0]; (a, &b[..1], Reg(reg(op))) }
            Constant(con)
                => { *b = [con, op, 0]; (a - 1, &b[..2], Num(steal(con, op))) }
            Memory(mem)
                => { *b = [mem, op, 0]; (a - 1, &b[..2], MemReg(reg(mem))) }
            MemConst(con, mem) => {
                *b = [con, mem, op];
                (a - 2, b, MemNum(steal(con, mem)))
            }
            Inp(input) => {
                *b = [input, op, 0];
                (a - 1, &b[..2], Input)
            }
        }
    }

    fn emit_operand(&mut self, a: u8, op: u8, opcode: &str) -> Result {
        let mut buffer = [0; 3];
        let (a, ops, v) = self.get_ops(a, op, &mut buffer);
        self.e.emit_operand(a, ops, opcode, v)
    }

    fn emit_xfer(&mut self, a: u8, op: u8) -> Result {
        // Eject a LOAD(M) with memory prefix, and eject LOADM with INP.
        if (self.prefix.memory() && op & 0xc8 == 0xc8)
            || (matches!(self.prefix, Inp(_)) && op & 0xcc == 0xcc) {
            self.eject(a)?;
        }
        let opcode = XFER[op as usize >> 2 & 3];
        let mut buffer = [0, 0, 0];
        let (a, ops, mut operand) = self.get_ops(a, op, &mut buffer);
        if op & 0xcc == 0xcc {          // Special case the LOAD [*] operand.
            operand = match operand {
                Num(n) => MemNum(n),
                Reg(r) => MemReg(r),
                _ => unreachable!(),
            }
        }
        self.e.emit_xfer(a, ops, opcode, reg(op >> 4), operand)
    }

    fn emit(&mut self, a: u8, op: u8) -> Result {
        // If we have a non-stealing prefix and non-zero register bits, then
        // eject.
        if !self.prefix.steals() && op & 3 != 0 {
            self.eject(a)?;
        }
        match op {
            0x00..=0x3f => {
                match &self.prefix {
                    Constant(con) => {
                        let cc = op as usize >> 2 & 7;
                        let opcode = if op & 0x20 == 0 {"jump"} else {"call"};
                        self.e.emit_jump(a - 1, &[*con, op],
                                         opcode, CONDITIONS[cc],
                                         steal(*con, op))?;
                        self.prefix = NoPrefix;
                    }
                    _ => {
                        self.eject(a)?;
                        self.prefix = Constant(op);
                    }
                }
            }
            0x40        => self.e.emit_basic(a, &[op], "out")?,
            0x4c..=0x4f => self.emit_operand(a, op, "sta")?,
            0x50        => {
                self.eject(a)?;
                self.prefix = Inp(op);
            }
            0x5c..=0x5f => {            // MEM prefix.
                match &self.prefix {
                    Constant(con) => self.prefix = MemConst(*con, op),
                    _ => {
                        self.eject(a)?;
                        self.prefix = Memory(op);
                    }
                }
            }
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

pub fn emit(e: &mut impl Emitter, program: &[u8]) -> Result
{
    let mut prefixes = Emission{prefix: NoPrefix, e};
    for (a, op) in program.iter().enumerate() {
        prefixes.emit(a as u8, *op)?;
    }
    prefixes.eject(program.len() as u8)
}
