use crate::instructions::Instructions;

#[derive(Clone, Copy, Debug)]
pub struct Memory(pub [u8; 256]);

impl Default for Memory {
    fn default() -> Memory { Memory([0; 256]) }
}

#[derive(Copy, Clone, Eq, PartialEq)]
pub enum Prefix {Value, Const}

#[derive(Clone, Default)]
pub struct State {
    pub a: u8,
    pub x: u8,
    pub y: u8,
    pub u: u8,

    pub k: Option<u8>,                  // We don't fully model k.
    pub prefix: Option<Prefix>,
    pub c: bool,
    pub pc: u8,
    pub sp: i8,

    pub prev_z: bool,
    pub prev_c: bool,

    pub r: u8,                         // Refresh counter.
    pub b: u8,                         // Address bus.

    pub last_out: u8,
    pub took_call: bool,

    pub stack: [u8; 4],
    pub memory: Memory,
}

impl State {
    pub fn step(&mut self, program: &[u8]) {
        let opcode = program[self.pc as usize];
        let prefix = self.prefix.take();
        let k = self.k();
        let mut operand = if prefix != None { k } else { self.op_reg(opcode) };

        // Default behavior...
        self.k = None;
        self.pc += 1;
        self.took_call = false;
        let c = self.c;
        let z = k == 0;

        match opcode {
            0x00..=0x3f => if prefix == Some(Prefix::Const) {
                self.jump(opcode, k);   // JUMP and CALL.
                operand = self.r;       // We do a refresh...
                self.r = operand.wrapping_add(1);
                self.k = Some(self.r);
            }
            else {
                let next = program[self.pc as usize] & 3;
                self.k = Some(opcode | next << 6);  // CONST.
                self.prefix = Some(Prefix::Const);
            }

            0x40..=0x5f => self.ret(opcode),

            0x60..=0x67 => self.last_out = self.a,
            0x68..=0x6b => unreachable!(), // Unallocated, NOP?
            0x6c..=0x6f => {
                self.memory.0[operand as usize] = self.a;
            }
            0x70..=0x77 => self.inp(),
            0x78..=0x7b => unreachable!(), // Unallocated.
            0x7c..=0x7f => {            // MEM prefix.
                self.k = Some(self.memory.0[operand as usize]);
                self.prefix = Some(Prefix::Value);
            }

            0x80..=0x9f => self.a = self.arith(opcode, operand),
            0xa0..=0xbf => { self.arith(opcode, operand); } // Ignore result.
            0xc0..=0xff => self.xfer(opcode, operand),
        }

        self.prev_c = c;
        self.prev_z = z;
        self.b = operand;
    }

    pub fn check(&self, insns: &Instructions) {
        if let Some(c) = insns.checks.get(&self.pc) {
            assert!(c(self))
        }
    }

    pub fn k(&self) -> u8 {
        self.k.unwrap_or(0xff)
    }

    fn op_reg(&self, op: u8) -> u8 {
        match op & 3 {
            0 => self.a,
            1 => self.x,
            2 => self.y,
            3 => self.u,
            _ => unreachable!()
        }
    }

    fn arith(&mut self, opcode: u8, operand: u8) -> u8 {
        let a = self.a as u32;
        let v = operand as u32;
        let c = if self.c { 1 } else { 0 };
        let r = match opcode & 0x1c {
            0x00 => a + v,              // ADD
            0x04 => a + (v ^ 0xff) + 1, // SUB
            0x08 => a | v,              // OR
            0x0c => a & v | 0x100,      // AND
            0x10 => a + v + c,          // ADC
            0x14 => a + (v ^ 0xff) + c, // SBC
            0x18 => a ^ v,              // XOR
            0x1c => unreachable!(),     // DNC (Actual effect is (a&b)^1)
            _ => unreachable!()
        };
        self.c = r >= 0x100;
        let r = (r & 0xff) as u8;
        self.k = Some(r);
        r
    }

    fn jump(&mut self, opcode: u8, addr: u8) {
        if self.condition(opcode) {
            if opcode & 32 != 0 {
                self.took_call = true;
                self.stack[self.sp as usize & 3] = self.pc;
                self.sp += 1;
            }
            self.pc = addr;
        }
    }

    fn ret(&mut self, opcode: u8) {
        if self.condition(opcode) {
            self.sp -= 1;
            self.pc = self.stack[self.sp as usize & 3];
        }
    }

    fn inp(&self) { todo!() }

    fn xfer(&mut self, opcode: u8, operand: u8) {
        let r = match opcode >> 2 & 3 {
            0 => operand.wrapping_add(1),
            1 => operand.wrapping_sub(1),
            2 => operand,
            3 => self.memory.0[operand as usize],
            _ => unreachable!()
        };
        self.k = Some(r);
        match opcode >> 4 & 3 {
            0 => self.a = r,
            1 => self.x = r,
            2 => self.y = r,
            3 => self.u = r,
            _ => unreachable!()
        }
    }

    fn condition(&self, opcode: u8) -> bool {
        match (opcode >> 2) & 7 {
            0 => true,
            1 => false,
            2 => self.prev_z,
            3 => !self.prev_z,
            4 => self.prev_c,
            5 => !self.prev_c,
            6 => self.prev_z & self.prev_c,
            7 => !self.prev_z | !self.prev_c,
            _ => unreachable!()
        }
    }
}
