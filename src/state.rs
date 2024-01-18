use crate::instructions::Instructions;

#[derive(Clone, Copy, Debug)]
pub struct Memory(pub [u8; 256]);

impl Default for Memory {
    fn default() -> Memory { Memory([0; 256]) }
}

#[derive(Clone, Default)]
pub struct State {
    pub a: u8,
    pub x: u8,
    pub y: u8,
    pub u: u8,

    pub k: Option<u8>,                  // We don't fully model k.
    pub prefixed: bool,
    pub prev_const: bool,
    pub c: bool,
    pub pc: u8,
    pub sp: i8,

    pub prev_z: bool,
    pub prev_c: bool,

    pub stack: [u8; 4],
    pub memory: Memory,
}

impl State {
    pub fn step(&mut self, program: &[u8]) {
        self.update(program[self.pc as usize]);
    }

    pub fn step_n(&mut self, program: &[u8], n: usize) {
        for _ in 0..n {
            self.update(program[self.pc as usize]);
        }
    }

    pub fn check(&self, insns: &Instructions) {
        if let Some(c) = insns.checks.get(&self.pc) {
            assert!(c(self))
        }
    }

    pub fn update(&mut self, opcode: u8) {
        let prev_const = self.prev_const;
        let prefixed = self.prefixed;
        let k = self.k.unwrap_or(0) + if prev_const { opcode << 6 } else { 0 };
        let operand = if prefixed { k } else { self.op_reg(opcode) };

        // Default behavior...
        self.k = None;
        self.prefixed = false;
        self.prev_const = false;
        self.pc += 1;
        let c = self.c;
        let z = k == 0;

        match opcode {
            0x00..=0x3f => if prev_const {
                self.jump(opcode, k);   // JUMP and CALL.
            }
            else {
                self.k = Some(opcode);  // CONST.
                self.prev_const = true;
                self.prefixed = true;
            }

            0x40..=0x47 => self.out(),
            0x48..=0x4b => unreachable!(), // Unallocated, NOP?
            0x4c..=0x4f => self.memory.0[operand as usize] = self.a,
            0x50..=0x57 => self.inp(),
            0x58..=0x5b => unreachable!(), // Unallocated (preserve K prefix?).
            0x5c..=0x5f => {            // MEM prefix.
                self.k = Some(self.memory.0[operand as usize]);
                self.prefixed = true;
            }
            0x64..=0x67 => { self.arith(opcode, operand); } // CMP, RET never.
            0x6c..=0x6f => { self.arith(opcode, operand); } // TST, RET never.
            0x60..=0x7f => self.ret(opcode),
            0x80..=0x9f => self.a = self.arith(opcode, operand),
            0xa0..=0xbf => self.y = self.arith(opcode, operand),
            0xc0..=0xff => self.xfer(opcode, operand),
        }

        self.prev_c = c;
        self.prev_z = z;
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
        let a = self.a as u16;
        let v = operand as u16;
        let c = if self.c { 1 } else { 0 };
        let r = match opcode & 0x1c {
            0x00 => a + v,              // ADD
            0x04 => a + (v ^ 0xff) + 1, // SUB
            0x08 => a | v,              // OR
            0x0c => a & v | 0x100,      // AND
            0x10 => a + v + c,          // ADC
            0x14 => a + (v ^ 0xff) + c, // SBC
            0x18 => a ^ v,              // XOR
            0x1c => a & v | 0x100,      // AND alias.
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

    fn out(&self) { todo!() }
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
            2 => true,
            3 => false,
            4 => self.prev_z,
            5 => !self.prev_z,
            6 => self.prev_c,
            7 => !self.prev_c,
            _ => unreachable!()
        }
    }
}
