#![deny(warnings)]

use clap::{Parser, ValueEnum};

use spice_check::SpiceCheck;
use spice_load::SpiceRead;

mod alu;
mod disassemble;
mod emitter;
mod instructions;
mod miller_rabin;
mod opdecode;
mod pcdecode;
mod programs;
mod memdecode;
mod sp;
mod spice_check;
mod spice_load;
mod state;
mod resistors;

#[derive(Copy, Clone, ValueEnum)]
enum Program {
    Add, Call, Cmp, Hazard, Hazard2, Inc, Logic, Mem, Memi, Memw, MillerRabin,
    Sub,
    Alu, Opdecode, Pcdecode, Ramdecode, Romdecode, Sp,
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
}

fn main() {
    use Program::*;
    use programs::*;
    let args = Args::parse();
    let insns = match args.program {
        MillerRabin => miller_rabin::miller_rabin(args.num),
        Add     => add(),
        Call    => call(),
        Cmp     => cmp(),
        Inc     => inc(),
        Hazard  => hazard(),
        Hazard2 => hazard2(),
        Logic   => logic(),
        Mem     => mem(),
        Memi    => memi(),
        Memw    => memw(),
        Sub     => sub(),

        Alu       => return alu::alu            (&args.verify.unwrap()),
        Opdecode  => return opdecode::opdecode  (&args.verify.unwrap()),
        Pcdecode  => return pcdecode::pcdecode  (&args.verify.unwrap()),
        Ramdecode => return memdecode::memdecode(&args.verify.unwrap(), "m"),
        Romdecode => return memdecode::memdecode(&args.verify.unwrap(), "r"),
        Sp        => return sp::sp              (&args.verify.unwrap()),
        //_ => todo!(),
    };

    verify_insns(&args, &insns);
}

fn verify_insns(args: &Args, insns: &instructions::Instructions) {
    let code = insns.assemble();
    let stdout = std::io::stdout();

    if args.disassemble {
        disassemble::disassemble(stdout.lock(), &code)
           .unwrap();
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
        println!("executed {}", count);
    }
    if args.log {
        let mut state = crate::state::State::default();
        while state.sp >= 0 {
            state.check(&insns);
            state.step(&code);
            println!(
                "{:02x}: A={:02x} X={:02x} Y={:02x} U={:02x} K={:02x} C={} SP={}",
                state.pc, state.a, state.x, state.y, state.u,
                state.k.unwrap_or(0), state.c as u8, state.sp);
        }
    }
    if let Some(s) = &args.verify {
        use std::fs::File;
        use std::io::BufReader;
        let quantum = args.quantum * 1e-9;
        let mut r = SpiceRead::new(quantum, quantum * 0.7, false);
        r.spice_read(&mut BufReader::new(File::open(s).unwrap()));
        SpiceCheck::new(&code, &r).spice_check();
    }
}
