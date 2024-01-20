use crate::spice_load::SpiceRead;

pub fn opdecode(path: &String) {
    let s = SpiceRead::from_path(path, 5e-6);
    let mut count = 0;

    for [i2, i3, i4, i5, i6, i7, ii2, ii3, ii4, ii5, ii6, ii7, co,
         cr, cs, coe, ar, as_, and, or, n, mpre,
         in_, out, mw, mr, cw] in s.extract_positive(&[
            "i2", "i3", "i4", "i5", "i6", "i7",
            "i2#", "i3#", "i4#", "i5#", "i6#", "i7#","co",
            "cr", "cs#", "coe#", "ar#", "as", "and", "or", "n#", "mpre#",
            "in#", "out", "mw", "mr#", "cw#"]) {
        assert_eq!((i2, i3, i4, i5, i6, i7), (ii2, ii3, ii4, ii5, ii6, ii7));

        let opcode = i2 as u8 * 4 + i3 as u8 * 8 + i4 as u8 * 16
            + i5 as u8 * 32 + i6 as u8 * 64 + i7 as u8 * 128;

        let (mut ex_cr, mut ex_cs, mut ex_ar, mut ex_as, mut ex_and, mut ex_or)
            = Default::default();
        let (mut ex_n, mut ex_in, mut ex_out, mut ex_mr, mut ex_mw, mut ex_cw)
            = Default::default();
        let mut ex_mpre = false;

        // Arithmetic & xfer ops (except loadm).
        let mut check_alu = opcode >= 0x80;

        // Instructions that write the C flag.  ALU ops (including tests).
        if opcode & 0xc0 == 0x80 {
            ex_cw = true;
        }

        let mut ex_coe = false;
        if opcode < 0xc0 {
            match opcode & 0x1c {
                0x00|0x08|0x18 => ex_coe = false,           // Add, Or, Xor.
                0x04|0x0c      => ex_coe = true,            // Sub.
                _              => ex_coe = co,              // Adc, Sbc.
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
            0xc8 => (ex_coe, ex_ar, ex_cr, ex_or) = (false, true, cr, or),
            // Loadm, ALU is actually don't care.
            0xcc => (check_alu, ex_mr) = (false, true),
            _    => (),
        }

        match opcode {
            0x40 | 0x44 => ex_out = true,                   // Out
            0x48        => (ex_mr, ex_mw) = (mr, mw),       // Not assigned.
            0x4c        => (ex_mr, ex_mw) = (true, true),   // Sta
            0x50 | 0x54 => (ex_in, ex_mpre) = (true, true), // In
            0x58        => (ex_mr, ex_mpre) = (mr, mpre),   // Not assigned.
            0x5c        => (ex_mr, ex_mpre) = (true, true), // Mem
            _           => (),
        }

        // Test for undesirable combos.
        assert!(!cs || !cr, "CS and CR on {:#04x}", opcode);
        assert!(!as_ || !ar, "AS and AR on {:#04x}", opcode);

        check(cw  , ex_cw  , "CW"  , opcode);
        check(mw  , ex_mw  , "MW"  , opcode);
        check(mr  , ex_mr  , "MR"  , opcode);
        check(in_ , ex_in  , "IN"  , opcode);
        check(out , ex_out , "OUT" , opcode);
        check(mpre, ex_mpre, "MPRE", opcode);

        if !check_alu {
            continue;
        }

        check(as_, ex_as , "CW" , opcode);
        check(ar , ex_ar , "CR" , opcode);
        check(cs , ex_cs , "CS" , opcode);
        check(cr , ex_cr , "CR" , opcode);
        check(coe, ex_coe, "CoE", opcode);
        check(and, ex_and, "AND", opcode);
        check(or , ex_or , "OR" , opcode);
        check(n  , ex_n  , "N"  , opcode);

        count += 1;
    }
    println!("Tested {} of {}", count, s.num_samples());
}

fn check(got: bool, ex: bool, tag: &str, opcode: u8) {
    assert_eq!(got, ex, "got {} expect {} for {} on {:#04x}",
               got, ex, tag, opcode);
}
