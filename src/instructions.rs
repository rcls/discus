
use Condition::*;
use Instruction::*;
use Register::*;
use Value::*;
use XferOp::*;

// Convenience for "use instructions.constants.*;" without undue pollution.
pub mod constants {
    pub use super::Register::*;
    pub use super::Condition::*;
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Register {A, X, Y, U}

#[derive(Clone, Copy, Debug)]
pub enum Value {
    Reg(Register),
    Number(u8),
    MemReg(Register),
    MemNumber(u8),
}

#[derive(Clone, Debug, PartialEq)]
pub enum Target {
    Label(String),
    Addr(u8),
}

type Labels = std::collections::HashMap<String, u8>;

const ADD: u8 = 0x80;
const SUB: u8 = 0x84;
const OR : u8 = 0x88;
const AND: u8 = 0x8c;                   // Also 0x9c is an alias.
const ADC: u8 = 0x90;
const SBC: u8 = 0x94;
const XOR: u8 = 0x98;

pub enum XferOp {Inc = 0xc0, Dec = 0xc4, Mov = 0xc8, MovM = 0xcc}

pub enum Condition {
    Always = 0, Never = 4,              // Also 8 and 12 as aliases.
    Z = 16, NZ = 20, C = 24, NC = 28
}

const MEM: u8 = 0x5c;
const CMP: u8 = 0x44;
const TST: u8 = 0x6c;
const STA: u8 = 0x4c;
const RET: u8 = 0x60;
const JUMP: u8 = 0;
const CALL: u8 = 32;

#[derive(Clone, Debug, PartialEq)]
pub enum Instruction {
    Byte(u8),
    Address(Target),
}

#[derive(Clone, Debug, Default)]
pub struct Instructions {
    pub insns: Vec<Instruction>,
    pub labels: Labels,
}

impl From<u8> for Value { fn from(v: u8) -> Value {Number(v)} }

impl From<Register> for Value { fn from(r: Register) -> Value {Reg(r)} }

impl From<[u8; 1]> for Value { fn from([n]: [u8; 1]) -> Value {MemNumber(n)} }

impl From<[Register; 1]> for Value {
    fn from([r]: [Register; 1]) -> Value { MemReg(r) }
}

impl From<u8> for Target { fn from(a: u8) -> Target { Target::Addr(a) } }

impl From<String> for Target {
    fn from(l: String) -> Target { Target::Label(l) }
}

impl From<&str> for Target {
    fn from(l: &str) -> Target { Target::Label(l.to_string()) }
}

impl Instructions {
    pub fn assemble(&self) -> Vec<u8> {
        let mut r = Vec::default();
        let mut address: u8 = 0;
        for insn in &self.insns {
            let (b, a) = match insn {
                Address(Target::Addr(a)) => (a & 0x3f, a >> 6),
                Address(Target::Label(l)) => {
                    let a = self.labels[l];
                    (a & 0x3f, a >> 6)
                }
                Byte(b) => (b + address, 0),
            };
            address = a;
            r.push(b);
        }
        r
    }

    fn insn(&mut self, insn: Instruction) -> &mut Self {
        self.insns.push(insn);
        self
    }
    pub fn label(&mut self, l: impl Into<String>) -> &mut Self {
        assert_eq!(std::cmp::max(self.insns.len(), 256), 256);
        self.labels.insert(l.into(), self.insns.len().try_into().unwrap());
        self
    }

    fn byte(&mut self, b: u8) -> &mut Self { self.insn(Byte(b)) }
    fn code(&mut self, b: u8, v: impl Into<Value>) -> &mut Self {
        match v.into() {
            Reg(r) => self.byte(b + r as u8),
            Number(n) => self.byte(n & 0x3f).byte(b + (n >> 6)),
            MemReg(r) => self.byte(MEM + r as u8).byte(b),
            MemNumber(n) => self.byte(n & 0x3f).byte(MEM + (n >> 6)).byte(b),
        }
    }

    pub fn mem(&mut self, v: impl Into<Value>) -> &mut Self {self.code(MEM, v)}
    pub fn add(&mut self, v: impl Into<Value>) -> &mut Self {self.code(ADD, v)}
    pub fn sub(&mut self, v: impl Into<Value>) -> &mut Self {self.code(SUB, v)}
    pub fn or (&mut self, v: impl Into<Value>) -> &mut Self {self.code(OR , v)}
    pub fn and(&mut self, v: impl Into<Value>) -> &mut Self {self.code(AND, v)}
    pub fn adc(&mut self, v: impl Into<Value>) -> &mut Self {self.code(ADC, v)}
    pub fn sbc(&mut self, v: impl Into<Value>) -> &mut Self {self.code(SBC, v)}
    pub fn xor(&mut self, v: impl Into<Value>) -> &mut Self {self.code(XOR, v)}
    pub fn cmp(&mut self, v: impl Into<Value>) -> &mut Self {self.code(CMP, v)}
    pub fn tst(&mut self, v: impl Into<Value>) -> &mut Self {self.code(TST, v)}

    pub fn jp(&mut self, cc: Condition, t: impl Into<Target>) -> &mut Self {
        self.insn(Address(t.into())).byte(JUMP + cc as u8)
    }
    pub fn jump(&mut self, t: impl Into<Target>) -> &mut Self {
        self.jp(Always, t)
    }

    pub fn cl(&mut self, cc: Condition, t: impl Into<Target>) -> &mut Self {
        self.insn(Address(t.into())).byte(CALL + cc as u8)
    }
    pub fn call(&mut self, t: impl Into<Target>) -> &mut Self {
        self.cl(Always, t)
    }

    pub fn rt(&mut self, cc: Condition) -> &mut Self {self.byte(RET + cc as u8)}
    pub fn ret(&mut self) -> &mut Self { self.rt(Always) }

    pub fn sta(&mut self, v: impl Into<Value>) -> &mut Self {self.code(STA, v)}

    pub fn inc(&mut self, r: Register) -> &mut Self { self.incv(r, r) }
    pub fn dec(&mut self, r: Register) -> &mut Self { self.decv(r, r) }

    pub fn incv(&mut self, r: Register, v: impl Into<Value>) -> &mut Self {
        self.code(Inc as u8 + r as u8 * 16, v)
    }
    pub fn decv(&mut self, r: Register, v: impl Into<Value>) -> &mut Self {
        self.code(Dec as u8 + r as u8 * 16, v)
    }

    pub fn mov(&mut self, d: Register, v: impl Into<Value>) -> &mut Self {
        match v.into() {
            Reg(r) => self.code(Mov as u8 + d as u8 * 16, r),
            Number(n) => self.code(Mov as u8 + d as u8 * 16, n),
            MemReg(r) => self.code(MovM as u8 + d as u8 * 16, r),
            MemNumber(n) => self.code(MovM as u8 + d as u8 * 16, n),
        }
    }

    pub fn out(&mut self) -> &mut Self {self.byte(0x40)}
    pub fn inp(&mut self) -> &mut Self {self.byte(0x50)}

    /// Set carry.
    pub fn setc(&mut self) -> &mut Self {self.and(A)}
    // Clear carry.
    pub fn clrc(&mut self) -> &mut Self {self.or(A)}
}

#[test]
fn test_basic() {
    let mut i = Instructions::default();
    i.add(24).sub(Y).adc([0x9b]).sbc([U]);
    println!("{:?}", i);
    assert_eq!(i.insns.len(), 8);

    let c = i.assemble();
    assert_eq!(c.len(), 8);
    assert_eq!(c[0], 24);
    assert_eq!(c[1], 0x80);
    assert_eq!(c[2], 0x86);
    assert_eq!(c[3], 0x1b);
    assert_eq!(c[4], 0x5e);
    assert_eq!(c[5], 0x90);
    assert_eq!(c[6], 0x5f);
    assert_eq!(c[7], 0x94);
}

#[test]
fn test_parse_jump() {
    let mut i = Instructions::default();
    i   .call("foo")
        .label("foo")
        .ret();
    assert_eq!(i.insns.len(), 3);
    assert_eq!(i.labels.len(), 1);
    assert_eq!(i.labels["foo"], 2);
    assert_eq!(i.insns[0], Address(Target::Label("foo".into())));

    let c = i.assemble();
    assert_eq!(c.len(), 3);
    assert_eq!(c[0], 2);
    assert_eq!(c[1], 0x20);
    assert_eq!(c[2], 0x60);
}
