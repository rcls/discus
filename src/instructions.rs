
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

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum ArithOp { Add, Sub, Or, And, Adc, Sbc, Xor, And2 }

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum XferOp { Inc, Dec, Mov, MovM }

#[derive(Clone, Debug, PartialEq)]
pub enum Instruction {
    Address(Target),
    // A 'Jump' must be preceded by 'Address'
    Jump{call: bool, cc: Condition, target: Target},
    Ret(Condition),
    Const(u8),
    Mem(Register),
    Arith(ArithOp, Register),
    ArithY(ArithOp, Register),          // Obscure!
    Xfer(XferOp, Register, Register),
    Sta(Register),
    Cmp(Register),
    Tst(Register),
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

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Condition {
    Always, Never, Always2, Never2, Z, NZ, C, NC
}

fn registrate(n: u8) -> Register {
    match n {
        0x00..=0x3f => A,
        0x40..=0x7f => X,
        0x80..=0xbf => Y,
        0xc0..=0xff => U,
    }
}

impl Target {
    fn resolve(&self, labels: &Labels) -> u8 {
        match self {
            Target::Addr(a) => *a,
            Target::Label(l) => labels[l]
        }
    }
}

impl Instruction {
    pub fn opcode(&self, labels: &Labels) -> u8 {
        match self {
            Address(target) => target.resolve(labels) & 0x3f,
            Jump{call, cc, target} =>
                *cc as u8 * 4 + (target.resolve(labels) >> 6)
                + if *call { 0x40 } else { 0 },
            &Arith (op, r) => 0x80 + op as u8 * 4 + r as u8,
            &ArithY(op, r) => 0xa0 + op as u8 * 4 + r as u8,
            &Xfer(op, d, r) => 0xc0 + op as u8 * 4 + d as u8 * 16 + r as u8,
            Const(c) => c & 0x3f,
            Mem(r) => 0x5c + *r as u8,
            &Ret(cc) => 0x60 + cc as u8 * 4,
            Sta(r) => 0x4c + *r as u8,
            Cmp(r) => 0x44 + *r as u8,
            Tst(r) => 0x6c + *r as u8,
        }
    }
}

impl Instructions {
    pub fn program(&self) -> [u8; 256] {
        let mut r = [0; 256];
        for (insn, b) in self.assemble().zip(r.iter_mut()) {
            *b = insn;
        }
        r
    }
    pub fn assemble(&self) -> impl Iterator<Item=u8> + '_ {
        self.insns.iter().map(|insn| insn.opcode(&self.labels))
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

    fn insn_value(self,
                  i: impl FnOnce(Register) -> Instruction,
                  v: impl Into<Value>) -> Self {
        match v.into() {
            Reg(r) => self.insn(i(r)),
            Number(n) => self.insn(Const(n & 0x3f)).insn(i(registrate(n))),
            MemReg(r) => self.insn(Mem(r)).insn(i(A)),
            MemNumber(n) => self.insn(Const(n & 0x3f))
                .insn(Mem(registrate(n))).insn(i(A)),
        }
    }
    fn insn_arith(self, op: ArithOp, v: impl Into<Value>) -> Self {
        self.insn_value(|r| Arith(op, r), v)
    }
    fn insn_xfer(self, op: XferOp, d: Register, v: impl Into<Value>) -> Self {
        self.insn_value(|r| Xfer(op, d, r), v)
    }
    fn insn_jump(self, call: bool, cc: Condition, target: Target) -> Self {
        self.insn(Address(target.clone())).insn(Jump{call, cc, target})
    }

    fn mem(self, v: impl Into<Value>) -> Self { self.insn_value(Mem, v) }
    fn add(self, v: impl Into<Value>) -> Self { self.insn_arith(Add, v) }
    fn sub(self, v: impl Into<Value>) -> Self { self.insn_arith(Sub, v) }
    fn and(self, v: impl Into<Value>) -> Self { self.insn_arith(And, v) }
    fn or (self, v: impl Into<Value>) -> Self { self.insn_arith(Or , v) }
    fn adc(self, v: impl Into<Value>) -> Self { self.insn_arith(Adc, v) }
    fn sbc(self, v: impl Into<Value>) -> Self { self.insn_arith(Sbc, v) }
    fn cmp(self, v: impl Into<Value>) -> Self { self.insn_value(Cmp, v) }
    fn tst(self, v: impl Into<Value>) -> Self { self.insn_value(Tst, v) }

    fn jp(self, cc: Condition, t: impl Into<Target>) -> Self {
        self.insn_jump(false, cc, t.into())
    }
    fn jump(self, t: impl Into<Target>) -> Self { self.jp(Always, t) }

    fn cl(self, cc: Condition, t: impl Into<Target>) -> Self {
        self.insn_jump(true, cc, t.into())
    }
    fn call(self, t: impl Into<Target>) -> Self { self.cl(Always, t) }

    fn rt(self, cc: Condition) -> Self { self.insn(Ret(cc)) }
    fn ret(self) -> Self { self.rt(Always) }

    fn sta(self, v: impl Into<Value>) -> Self { self.insn_value(Sta, v) }

    fn inc(self, r: Register) -> Self { self.insn_xfer(Inc, r, r) }
    fn dec(self, r: Register) -> Self { self.insn_xfer(Dec, r, r) }

    fn inc2(self, r: Register, v: impl Into<Value>) -> Self {
        self.insn_xfer(Inc, r, v)
    }
    fn dec2(self, r: Register, v: impl Into<Value>) -> Self {
        self.insn_xfer(Dec, r, v)
    }

    fn mov(self, d: Register, v: impl Into<Value>) -> Self {
        match v.into() {
            Reg(r) => self.insn_xfer(Mov, d, r),
            Number(n) => self.insn_xfer(Mov, d, n),
            MemReg(r) => self.insn_xfer(MovM, d, r),
            MemNumber(n) => self.insn_xfer(MovM, d, n),
        }
    }
}

#[test]
fn test_basic() {
    let mut i = Instructions::default();
    i.add(24).sub(Y).adc([0x9b]).sbc([U]);
    println!("{:?}", i);
    assert_eq!(i.insns.len(), 8);
    assert_eq!(i.insns[0], Const(24));
    assert_eq!(i.insns[1], Arith(Add,A));
    assert_eq!(i.insns[2], Arith(Sub,Y));
    assert_eq!(i.insns[3], Const(0x1b));
    assert_eq!(i.insns[4], Mem(Y));
    assert_eq!(i.insns[5], Arith(Adc,A));
    assert_eq!(i.insns[6], Mem(U));
    assert_eq!(i.insns[7], Arith(Sbc,A));

    let c: Vec<u8> = i.assemble().collect();
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
    assert_eq!(i.insns[1], Jump{call: true, cc: Always,
                                target: Target::Label("foo".into())});
    assert_eq!(i.insns[2], Ret(Always));

    let c: Vec<u8> = i.assemble().collect();
    assert_eq!(c.len(), 3);
    assert_eq!(c[0], 2);
    assert_eq!(c[1], 0x40);
    assert_eq!(c[2], 0x60);
}
