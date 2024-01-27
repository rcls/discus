pub fn alu(path: &String) {
    let s = crate::spice_read::SpiceRead::from_path(path, 10e-6);

    for [a, b, ci, cs, cr, and, or, q, co] in s.extract_positive(
        &["a", "b", "ci#", "cs#", "cr", "and", "or", "q", "co#"]) {
        // Some input combinations are DNC because we don't use them.
        if and && or {
            continue;
        }
        if cs && cr {
            continue;
        }
        if and && (!cs || !ci) {
            continue;
        }
        if or && (!cr || ci) {
            continue;
        }

        let xor = !and && !or && cr;
        if xor && ci {
            continue;
        }

        if !and && !or && cs {
            continue;
        }

        let (op, ex_q, ex_c) =
            if xor {
                ("Xor", a ^ b, false)
            }
            else if and {
                ("And", a && b, true)
            }
            else if or {
                ("Or ", a || b, false)
            }
            else {
                let sum = a as u32 + b as u32 + ci as u32;
                ("Add", sum & 1 != 0, sum >= 2)
            };

        println!("{op} {} {} {} -> {} {}",
                 a as u8, b as u8, ci as u8, q as u8, co as u8);

        assert_eq!(ex_q, q , "Q not expected {ex_q}");
        assert_eq!(ex_c, co, "C not expected {ex_c}");
    }
}
