#![deny(warnings)]

use clap::{Parser, ValueEnum};

use spice_check::SpiceCheck;
use spice_load::SpiceRead;

pub mod disassemble;
pub mod emitter;
pub mod instructions;
pub mod miller_rabin;
mod programs;
pub mod spice_check;
pub mod spice_load;
pub mod state;
pub mod resistors;

#[derive(Copy, Clone, ValueEnum)]
enum Program {
    Add, Call, Hazard, Hazard2, Inc, Logic, MillerRabin,
    Mem, Memi, Sub,
}

#[derive(Parser)]
#[command(arg_required_else_help(true))]
struct Args {
    #[arg()]
    program: Program,
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

fn get_program(program: Program, n: usize) -> instructions::Instructions {
    use Program::*;
    use programs::*;
    match program {
        MillerRabin => miller_rabin::miller_rabin(n),
        Add         => add(),
        Call        => call(),
        Inc         => inc(),
        Hazard      => hazard(),
        Hazard2     => hazard2(),
        Logic       => logic(),
        Sub         => sub(),
        _ => todo!(),
    }
}

fn main() {
    let args = Args::parse();
    let insns = get_program(args.program, args.num);

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
        let mut state = crate::state::State::default();
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
