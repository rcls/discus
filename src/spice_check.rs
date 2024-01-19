use std::fmt::Display;

use crate::{
    disassemble, instructions::Instructions, state::State,
    spice_load::SpiceRead
};

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
        self.state.k = Some(k[3]);
        assert_eq!(pc[3], 0);
        println!("{:?}", &pc[0..10]);

        for i in 4 .. self.spice.num_samples() {
            println!("Timestamp {}µs {} clocks",
                     timestamps[i] * 1e6, timestamps[i] / self.spice.quantum);
            self.verify(self.state.a, a[i], "A");
            self.verify(self.state.x, x[i], "X");
            self.verify(self.state.y, y[i], "Y");
            self.verify(self.state.u, u[i], "U");
            if let Some(kk) = self.state.get_k(self.program) {
                self.verify(kk, k[i], "K");
            }
            self.verify(self.state.c, c[i], "C");

            self.state.step(self.program);

            // The electronics has the instruction unit one cycle ahead of the
            // execute unit, so check the PC after stepping the state.
            self.verify(self.state.pc, pc[i], "PC");
            if self.state.pc != pc[i] {
                panic!();
            }
        }
        // Sanity check that we've run the correct number of instructions.  The
        // stack should be empty and the current instruction should be an
        // unconditional return (0x60).
        assert_eq!(self.state.sp, 0);
        assert_eq!(self.program[self.state.pc as usize], 0x60);
    }

    fn verify<T>(&mut self, sim: T, spice: T, what: &str)
                 where T: PartialEq<T> + Display {
        if sim != spice {
            println!("Missmatch @{:#04x} sim {} v. spice {} on {}",
                     self.state.pc, sim, spice, what);
            self.success = false;
        }
    }
}

pub fn spice_check(program: &[u8], spice: &SpiceRead) {
    let mut check = SpiceCheck {
        success: true, program, spice, state: State::default()
    };
    check.spice_check();
    if !check.success {
        panic!();
    }
}

pub fn spice_check_args(gen: impl FnOnce(usize) -> Instructions) {
    use clap::Parser;
    #[derive(Parser)]
    #[command(arg_required_else_help(true))]
    struct Args {
        #[arg(short='V', long)]
        verify: Option<String>,
        #[arg(short='L')]
        log: bool,
        #[arg(short, long, default_value="0")]
        num: usize,
        #[arg(short='T', long)]
        time: bool,
        #[arg(short='t', long, default_value="2e-6")]
        quantum: f64,
        #[arg(short='R', long)]
        resistors: bool,
        #[arg(short='H', long)]
        hex: bool,
        #[arg(short='D', long)]
        disassemble: bool,
    }
    let args = Args::parse();
    let insns = gen(args.num);
    let code = insns.assemble();
    let stdout = std::io::stdout();
    if args.disassemble {
        disassemble::disassemble(stdout.lock(), &code)
           .unwrap();
    }
    if args.hex {
        disassemble::hex_dump(stdout.lock(), &code)
           .unwrap();
    }
    if args.time {
        let mut state = crate::state::State::default();
        let mut count = 0;
        while state.sp >= 0 {
            state.check(&insns);
            state.step(&code);
            count += 1;
        }
        println!("executed {}", count);
    }
    if args.resistors {
         crate::resistors::resistors(stdout.lock(), &code).unwrap();
    }
    if args.log {
        let mut state = State::default();
        while state.sp >= 0 {
            state.step(&code);
            println!(
                "{:02x}: A={:02x} X={:02x} Y={:02x} U={:02x} K={:02x} C={} SP={}",
                state.pc, state.a, state.x, state.y, state.u,
                state.get_k(&code).unwrap_or(0), state.c as u8, state.sp);
        }
    }
    if let Some(s) = args.verify {
        use std::fs::File;
        use std::io::BufReader;
        let mut r = SpiceRead::new(args.quantum, args.quantum * 0.7, false);
        r.spice_read(&mut BufReader::new(File::open(s).unwrap()));
        SpiceCheck::new(&code, &r).spice_check();
    }
}
