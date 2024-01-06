
use ArithOp::*;
use Condition::*;
use Instruction::*;
use Register::*;
use Value::*;
use XferOp::*;

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

pub enum ArithOp { Add = 0x80, Sub = 0x84, Or  = 0x88, And = 0x8c,
                   Adc = 0x90, Sbc = 0x94, Xor = 0x98, And2 = 0x9c }

pub enum XferOp {Inc = 0xc0, Dec = 0xc4, Mov = 0xc8, MovM = 0xcc}

pub enum Condition {
    Always = 0, Never = 4, Always2 = 8, Never2 = 12,
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

impl From<u8> for Value { fn from(v: u8) -> Value { Number(v) } }

impl From<Register> for Value { fn from(r: Register) -> Value { Reg(r) } }

impl From<[u8; 1]> for Value { fn from([n]: [u8; 1]) -> Value { MemNumber(n) } }

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

impl Target {
    fn resolve(&self, labels: &Labels) -> u8 {
        match self {
            Target::Addr(a) => *a,
            Target::Label(l) => labels[l]
        }
    }
}

impl Instructions {
    pub fn assemble(&self) -> Vec<u8> {
        let mut r = Vec::default();
        let mut address: u8 = 0;
        for insn in &self.insns {
            match insn {
                Address(target) => {
                    let a = target.resolve(&self.labels);
                    r.push(a & 0x3f);
                    address = a >> 6;
                }
                Byte(b) => {
                    r.push(b + address);
                    address = 0;
                }
            }
        }
        r
    }
}

impl AbstractAsm for &mut Instructions {
    fn insn(self, insn: Instruction) -> Self {
        self.insns.push(insn);
        self
    }
    fn label(self, l: impl Into<String>) -> Self {
        self.labels.insert(l.into(), self.insns.len().try_into().unwrap());
        self
    }
}

pub trait AbstractAsm : Sized {
    fn insn(self, insn: Instruction) -> Self;
    fn label(self, l: impl Into<String>) -> Self;

    fn byte(self, b: u8) -> Self { self.insn(Byte(b)) }
    fn code(self, b: u8, v: impl Into<Value>) -> Self {
        match v.into() {
            Reg(r) => self.byte(b + r as u8),
            Number(n) => self.byte(n & 0x3f).byte(b + (n >> 6)),
            MemReg(r) => self.byte(MEM + r as u8).byte(b),
            MemNumber(n) => self.byte(n & 0x3f)
                .insn(Byte(MEM + (n >> 6))).byte(b),
        }
    }

    fn mem(self, v: impl Into<Value>) -> Self { self.code(MEM, v) }
    fn add(self, v: impl Into<Value>) -> Self { self.code(Add as u8, v) }
    fn add(self, v: impl Into<Value>) -> Self { self.code(Add as u8, v) }
    fn sub(self, v: impl Into<Value>) -> Self { self.code(Sub as u8, v) }
    fn and(self, v: impl Into<Value>) -> Self { self.code(And as u8, v) }
    fn or (self, v: impl Into<Value>) -> Self { self.code(Or  as u8, v) }
    fn adc(self, v: impl Into<Value>) -> Self { self.code(Adc as u8, v) }
    fn sbc(self, v: impl Into<Value>) -> Self { self.code(Sbc as u8, v) }
    fn cmp(self, v: impl Into<Value>) -> Self { self.code(CMP, v) }
    fn tst(self, v: impl Into<Value>) -> Self { self.code(TST, v) }

    fn jp(self, cc: Condition, t: impl Into<Target>) -> Self {
        self.insn(Address(t.into())).byte(JUMP + cc as u8)
    }
    fn jump(self, t: impl Into<Target>) -> Self { self.jp(Always, t) }

    fn cl(self, cc: Condition, t: impl Into<Target>) -> Self {
        self.insn(Address(t.into())).byte(CALL + cc as u8)
    }
    fn call(self, t: impl Into<Target>) -> Self { self.cl(Always, t) }

    fn rt(self, cc: Condition) -> Self { self.byte(RET + cc as u8) }
    fn ret(self) -> Self { self.rt(Always) }

    fn sta(self, v: impl Into<Value>) -> Self { self.code(STA, v) }

    fn inc(self, r: Register) -> Self { self.incv(r, r) }
    fn dec(self, r: Register) -> Self { self.decv(r, r) }

    fn incv(self, r: Register, v: impl Into<Value>) -> Self {
        self.code(Inc as u8 + r as u8 * 16, v)
    }
    fn decv(self, r: Register, v: impl Into<Value>) -> Self {
        self.code(Dec as u8 + r as u8 * 16, v)
    }

    fn mov(self, d: Register, v: impl Into<Value>) -> Self {
        match v.into() {
            Reg(r) => self.code(Mov as u8 + d as u8 * 16, r),
            Number(n) => self.code(Mov as u8 + d as u8 * 16, n),
            MemReg(r) => self.code(MovM as u8 + d as u8 * 16, r),
            MemNumber(n) => self.code(MovM as u8 + d as u8 * 16, n),
        }
    }
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
