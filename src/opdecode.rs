use crate::spice_read::SpiceRead;

pub fn opdecode(path: &String) {
    let s = SpiceRead::from_path(path, 5e-6);
    let mut count = 0;
    let mut seen = std::collections::HashSet::new();

    for [i2, i3, i4, i5, i6, i7, ij, ii2, ii3, ii4, ii5, ii6, ii7, iij, co,
         qe, cr, cs, coe, ar, as_, and, or, n, mpre,
         in_, out, mw, mr, cw] in s.extract_positive(&[
            "i2", "i3", "i4", "i5", "i6", "i7", "ij",
            "i2#", "i3#", "i4#", "i5#", "i6#", "i7#", "ij#", "co",
            "qe", "cr", "cs#", "coe#", "ar#", "as", "and", "or", "n#", "mpre#",
            "in#", "out#", "mw", "mr#", "cw#"]) {
        assert_eq!((i2, i3, i4, i5, i6, i7), (ii2, ii3, ii4, ii5, ii6, ii7));
        assert_eq!(ij, iij);

        let opcode = i2 as u8 * 4 + i3 as u8 * 8 + i4 as u8 * 16
            + i5 as u8 * 32 + i6 as u8 * 64 + i7 as u8 * 128;
        seen.insert(opcode + co as u8);

        // Test for undesirable combos.
        assert!(!cs || !cr, "CS and CR on {opcode:#04x}");
        // AR overrides AS.
        let as_ = as_ & !ar;

        let [mut ex_cr, mut ex_cs, mut ex_ar, mut ex_as] = [false; 4];
        let [mut ex_and, mut ex_or, mut ex_n, mut ex_in] = [false; 4];
        let [mut ex_out, mut ex_mr, mut ex_mw, mut ex_cw] = [false; 4];
        let mut ex_mpre = false;

        // Arithmetic & xfer ops (except loadm).
        let mut check_alu = opcode >= 0x80;

        // Instructions that write the C flag.  ALU ops (including tests).
        if opcode & 0xc0 == 0x80 {
            ex_cw = true;
        }

        // All arithemic and xfer instructions, except loadm.
        let mut ex_qe = opcode >= 0x80 && opcode & 0xcc != 0xcc;

        let mut ex_coe = false;
        if opcode < 0xc0 {
            match opcode & 0x1c {
                0x00|0x08|0x18 => ex_coe = false,           // Add, Or, Xor.
                0x04|0x0c      => ex_coe = true,            // Sub, And.
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

        // 0x68 : Asserts MW without MR, the refresh cycle will STA?
        // 0x78 : Asserts MPRE with no other strobes, sets K=-1?
        match opcode {
            0x60 | 0x64 => ex_out = true,                   // Out
            0x68        => (ex_mr, ex_mw) = (mr, mw),       // Not assigned.
            0x6c        => (ex_mr, ex_mw) = (true, true),   // Sta
            0x70 | 0x74 => (ex_in, ex_mpre) = (true, true), // In
            0x78        => (ex_mr, ex_mpre) = (mr, mpre),   // Not assigned.
            0x7c        => (ex_mr, ex_mpre) = (true, true), // Mem
            _           => (),
        }

        // IJ overrides everything...
        if ij {
            if opcode >= 0x40 {
                continue;              // Impossible combo.
            }
            check_alu = true;
            ex_qe = true;
            ex_cw = false;
            ex_mw = false;
            ex_mr = false;
            ex_in = false;
            ex_out = false;
            ex_mpre = false;
            ex_as = false;
            ex_ar = true;
            ex_cs = false;
            ex_cr = false;
            ex_coe = true;
            ex_and = false;
            ex_or = false;
            ex_n = false;
        }
        seen.insert(opcode + co as u8 + ij as u8 * 2);

        check(qe  , ex_qe  , "QE"  , opcode, ij);
        check(cw  , ex_cw  , "CW"  , opcode, ij);
        check(mw  , ex_mw  , "MW"  , opcode, ij);
        check(mr  , ex_mr  , "MR"  , opcode, ij);
        check(in_ , ex_in  , "IN"  , opcode, ij);
        check(out , ex_out , "OUT" , opcode, ij);
        check(mpre, ex_mpre, "MPRE", opcode, ij);

        if !check_alu {
            continue;
        }

        check(as_, ex_as , "CW" , opcode, ij);
        check(ar , ex_ar , "CR" , opcode, ij);
        check(cs , ex_cs , "CS" , opcode, ij);
        check(cr , ex_cr , "CR" , opcode, ij);
        check(coe, ex_coe, "CoE", opcode, ij);
        check(and, ex_and, "AND", opcode, ij);
        check(or , ex_or , "OR" , opcode, ij);
        check(n  , ex_n  , "N"  , opcode, ij);

        count += 1;
    }
    println!("Tested {count} of {}", s.num_samples());
    assert_eq!(seen.len(), 128 + 32);
}

fn check(got: bool, ex: bool, tag: &str, opcode: u8, ij: bool) {
    assert_eq!(got, ex,
               "got {got} expect {ex} for {tag} on {opcode:#04x} {ij}");
}
