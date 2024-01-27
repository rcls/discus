use std::fmt::Display;

use crate::{state::State, spice_read::SpiceRead};

pub struct SpiceCheck<'a> {
    success: bool,
    program: &'a [u8],
    spice: &'a SpiceRead,
    state: State,
}

impl SpiceCheck<'_> {
    pub fn new<'a>(program: &'a [u8], spice: &'a SpiceRead) -> SpiceCheck<'a> {
        SpiceCheck{success: true, program, spice, state: State::default()}
    }

    pub fn spice_check(&mut self) {
        let a  = self.spice.extract_byte("a");
        let x  = self.spice.extract_byte("r_x_b");
        let y  = self.spice.extract_byte("r_y_b");
        let u  = self.spice.extract_byte("r_u_b");
        let k  = self.spice.extract_byte("k_b");
        let pc = self.spice.extract_byte("p");
        let c  = self.spice.extract_signal("co_c");

        let timestamps: Vec<_> = self.spice.extract_sample("time");

        // Load the state from index 3.
        self.state.a = a[3];
        self.state.x = x[3];
        self.state.y = y[3];
        self.state.u = u[3];
        self.state.c = c[3];
        self.state.k = None;
        assert_eq!(pc[2], 0);
        assert_eq!(pc[3], 1);

        for i in 4 .. self.spice.num_samples() {
            self.state.step(self.program);

            println!("Timestamp {}µs {} clocks",
                     timestamps[i] * 1e6, timestamps[i] / self.spice.quantum);
            self.verify(self.state.a, a[i], "A");
            self.verify(self.state.x, x[i], "X");
            self.verify(self.state.y, y[i], "Y");
            self.verify(self.state.u, u[i], "U");
            if let Some(kk) = self.state.k {
                self.verify(kk, k[i], "K");
            }
            self.verify(self.state.c, c[i], "C");

            // The electronics has the instruction unit one cycle ahead of the
            // execute unit, so the PC we want to check is the previous one.
            self.verify(self.state.pc, pc[i - 1], "PC");
            if self.state.pc != pc[i - 1] {
                panic!();
            }
        }
        // Sanity check that we've run the correct number of instructions.  The
        // stack should be empty and the current instruction should be an
        // unconditional return (0x60).
        assert_eq!(self.state.sp, 0);
        assert_eq!(self.program[self.state.pc as usize], 0x60);
        assert!(self.success);
    }

    fn verify<T>(&mut self, sim: T, spice: T, what: &str)
                 where T: PartialEq<T> + Display {
        if sim != spice {
            println!("Mismatch @{:#04x} sim {sim} v. spice {spice} on {what}",
                     self.state.pc);
            self.success = false;
        }
    }
}
