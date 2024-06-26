#![deny(warnings)]

use clap::{Parser, ValueEnum};
use std::fs::File;
use std::io::BufReader;

use spice_check::SpiceCheck;
use spice_read::SpiceRead;

mod alu;
mod disassemble;
mod emitter;
mod instructions;
mod memcheck;
mod memdecode;
mod miller_rabin;
mod opdecode;
mod pcdecode;
mod programs;
mod sp;
mod spice_check;
mod spice_read;
mod state;
mod resistors;

#[derive(Copy, Clone, ValueEnum)]
enum Program {
    Add, Call, Cmp, Hazard, Hazard2, Inc, Logic, Memf, Memp, Memw, Sub, Ret,
    Alu, Opdecode, Pcdecode, Ramdecode, Romdecode, Sp, MemCheck, MillerRabin,
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
    #[arg(short='t', long, default_value="2000")]
    quantum: f64,
    #[arg(short='R', long)]
    resistors: bool,
    #[arg(short='H', long)]
    hex: bool,
    #[arg(short='D', long)]
    disassemble: bool,
    #[arg(short='X', long)]
    verilog: bool,
    #[arg(short='s', long)]
    strobes: Option<String>
}

fn main() {
    use Program::*;
    use programs::*;
    let args = Args::parse();
    let insns = match args.program {
        MillerRabin => miller_rabin::miller_rabin(args.num),
        MemCheck => memcheck::memcheck(),
        Add     => add(),
        Call    => call(),
        Cmp     => cmp(),
        Inc     => inc(),
        Hazard  => hazard(),
        Hazard2 => hazard2(),
        Logic   => logic(),
        Memf    => memf(),
        Memp    => memp(),
        Memw    => memw(),
        Sub     => sub(),
        Ret     => ret(),

        Alu       => return alu::alu            (&args.verify.unwrap()),
        Opdecode  => return opdecode::opdecode  (&args.verify.unwrap()),
        Pcdecode  => return pcdecode::pcdecode  (&args.verify.unwrap()),
        Sp        => return sp::sp              (&args.verify.unwrap()),
        Ramdecode => return memdecode::memdecode(&args.verify.unwrap(),
                                                 "m", 32),
        Romdecode => return memdecode::memdecode(&args.verify.unwrap(),
                                                 "r", 64),
    };

    verify_insns(&args, &insns);
}

fn verify_insns(args: &Args, insns: &instructions::Instructions) {
    let code = insns.assemble();
    let stdout = std::io::stdout();

    if args.disassemble {
        disassemble::disassemble(stdout.lock(), &code).unwrap();
    }
    if args.hex {
        disassemble::hex_dump(stdout.lock(), &code).unwrap();
    }
    if args.verilog {
        disassemble::verilog(stdout.lock(), &code).unwrap();
    }
    if args.resistors {
        crate::resistors::resistors(stdout.lock(), &code).unwrap();
    }
    if args.time {
        let mut state = crate::state::State::default();
        let mut count = 0;
        while state.sp >= 0 {
            state.check(&insns);
            state.step(&code);
            count += 1;
        }
        println!("executed {count}");
    }
    if args.log {
        let mut state = crate::state::State::default();
        loop {
            println!(
                "{:02x}: A={:02x} X={:02x} Y={:02x} U={:02x} K={:02x} C={} SP={}",
                state.pc, state.a, state.x, state.y, state.u,
                state.k(), state.c as u8, state.sp);
            if state.sp < 0 {
                break;
            }
            state.check(&insns);
            state.step(&code);
        }
    }
    if let Some(s) = &args.verify {
        let quantum = args.quantum * 1e-9;
        let mut r = SpiceRead::new(quantum, 1e-6, false);
        r.spice_read(&mut BufReader::new(File::open(s).unwrap()), true);
        SpiceCheck::new(&code, &r).spice_check();
    }
    if let Some(s) = &args.strobes {
        let quantum = args.quantum * 1e-9;
        let mut r = SpiceRead::new(quantum, 1e-6, false);
        r.spice_read(&mut BufReader::new(File::open(s).unwrap()), true);
        print_strobes(&mut r);
    }
}

fn print_strobes(r: &SpiceRead) {
    // Look for all lines in the form S_._._._M.
    let mut strobes: Vec<(&String, Vec<f64>)> = std::vec::Vec::new();
    for s in r.vars.keys() {
        let b = s.as_bytes();
        if b.len() == 9 && b[0] == b's' && b[8] == b'm'
            && b[1] == b'_' && b[3] == b'_' && b[5] == b'_' && b[7] == b'_' {
            strobes.push((s, r.iterate_column(s).collect()));
        }
    }
    let mut last: String = "".into();
    for (i, t) in r.iterate_column("time").enumerate() {
        if t < r.quantum {
            continue;
        }
        let mut current = String::new();
        for (s, v) in &strobes {
            if v[i] > -2.0 {
                current += " ";
                current += s;
            }
        }
        if current != last {
            println!("{}µs {current}", t * 1e6);
            last = current;
        }
    }
}
