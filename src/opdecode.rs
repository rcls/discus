use crate::spice_load::SpiceRead;

pub mod state;
pub mod spice_load;

fn main() {
    let s = SpiceRead::from_args(5e-6);

    let i2   = s.extract_signal("i2");
    let i3   = s.extract_signal("i3");
    let i4   = s.extract_signal("i4");
    let i5   = s.extract_signal("i5");
    let i6   = s.extract_signal("i6");
    let i7   = s.extract_signal("i7");
    let co   = s.extract_signal("co");

    let cr   = s.extract_signal("cr");
    let cs   = s.extract_invert("cs#");
    let coe  = s.extract_invert("coe#");
    let ar   = s.extract_invert("ar#");
    let as_  = s.extract_signal("as");
    let and_ = s.extract_signal("and");
    let or   = s.extract_signal("or");
    let n    = s.extract_invert("n#");

    let in_  = s.extract_invert("in#");
    let out  = s.extract_signal("out");
    let mw   = s.extract_signal("mw");
    let mr   = s.extract_invert("mr#");
    let cw   = s.extract_invert("cw#");

    for i in 0..s.num_samples() {
        let opcode = i2[i] as u8 * 4 + i3[i] as u8 * 8 + i4[i] as u8 * 16
            + i5[i] as u8 * 32 + i6[i] as u8 * 64 + i7[i] as u8 * 128;

        let (mut ex_cr, mut ex_cs, mut ex_ar, mut ex_as, mut ex_and, mut ex_or)
            = Default::default();
        let (mut ex_n, mut ex_in, mut ex_out, mut ex_mr, mut ex_mw, mut ex_cw)
            = Default::default();

        // Arithmetic & xfer ops (except loadm).
        let mut check_alu = opcode >= 0x80;

        // Instructions that write the C flag.  ALU ops + CMP/TST.
        if opcode & 0xc0 == 0x80 || opcode & 0xf4 == 0x64 {
            ex_cw = true;
        }

        let mut ex_coe = false;
        if opcode < 0xc0 {
            match opcode & 0x1c {
                0x00|0x08|0x18 => ex_coe = false,  // Add, Or, Xor.
                0x04|0x0c      => ex_coe = true,   // Sub.
                _              => ex_coe = co[i],  // Adc, Sbc.
            }
            match opcode & 0x1c {
                0x00 => (),                                 // Add
                0x04 => ex_n = true,                        // Sub
                0x08 => (ex_cr, ex_or) = (true, true),      // Or
                0x0c => (ex_cs, ex_and) = (true, true),     // And
                0x10 => (),                                 // Adc
                0x14 => ex_n = true,                        // Sbc
                0x18 => ex_cr = true,                       // Xor
                0x1c => check_alu = false,                  // DNC
                _    => unreachable!(), 
            } 
        }

        // Flip inc and dec?
        match opcode & 0xcc { // Inc/Dec/Load/Loadm
            0xc0 => (ex_coe, ex_ar) = (true, true),         // Inc
            0xc4 => (ex_coe, ex_as) = (false, true),        // Dec
            // Load.  We don't care about CR and OR for this, either ADD or OR
            // will work.
            0xc8 => (ex_coe, ex_ar, ex_cr, ex_or) = (false, true, cr[i], or[i]),
            // Loadm, ALU is actually don't care.
            0xcc => (check_alu, ex_mr) = (false, true),
            _    => (),
        }

        match opcode {
            0x40 | 0x44 => ex_out = true,                   // Out
            0x48        => (ex_mr, ex_mw) = (mr[i], mw[i]), // STA alias.
            0x4c        => (ex_mr, ex_mw) = (true, true),   // Sta
            0x50 | 0x54 => ex_in = true,                    // In
            0x58        => ex_mr = mr[i],                   // MEM alias.
            0x5c        => ex_mr = true,                    // Mem
            _           => (),
        }

        // Test for undesirable combos.
        assert!(!cs[i] || !cr[i], "CS and CR on {:#04x} at {}", opcode, i);
        assert!(!as_[i] || !ar[i], "AS and AR on {:#04x} at {}", opcode, i);

        check(&cw , ex_cw , "CW" , opcode, i);
        check(&mw , ex_mw , "MW" , opcode, i);
        check(&mr , ex_mr , "MR" , opcode, i);
        check(&in_, ex_in , "IN" , opcode, i);
        check(&out, ex_out, "OUT", opcode, i);

        if !check_alu {
            continue;
        }

        check(&as_ , ex_as , "CW" , opcode, i);
        check(&ar  , ex_ar , "CR" , opcode, i);
        check(&cs  , ex_cs , "CS" , opcode, i);
        check(&cr  , ex_cr , "CR" , opcode, i);
        check(&coe , ex_coe, "CoE", opcode, i);
        check(&and_, ex_and, "AND", opcode, i);
        check(&or  , ex_or , "OR" , opcode, i);
        check(&n   , ex_n  , "N"  , opcode, i);
    }
    println!("Tested {}", s.num_samples());
}

fn check(got: &Vec<bool>, ex: bool, tag: &str, opcode: u8, i: usize) {
    assert_eq!(got[i], ex, "for {} on {:#04x} at {}", tag, opcode, i);
}
