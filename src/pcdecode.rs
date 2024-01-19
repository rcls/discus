
pub fn pcdecode(path: &String) {
    let s = crate::spice_load::SpiceRead::from_path(path, 5e-6);
    let mut count = 0;

    for [o2, o3, o4, o5, o6, o7, ojump, co, z, jump, ret, push, inc] in
        s.extract_positive(
            &["o2", "o3", "o4", "o5", "o6", "o7", "ojump#", "co", "z#",
              "jump", "ret", "push#", "inc"])
    {
        let opcode = o7 as u8 * 128 + o6 as u8 * 64 + o5 as u8 * 32
           + o4 as u8 * 16 + o3 as u8 * 8 + o2 as u8 * 4;

        if opcode >= 0x40 && ojump {
            continue;  // Impossible combination.
        }

        let condition = match opcode & 0x1c {
            0 |  8 => true,
            4 | 12 => false,
            16 => z,
            20 => !z,
            24 => co,
            28 => !co,
            _ => unreachable!(),
        };

        let is_ret = opcode & 0xe0 == 0x60;
        // Only jump instructions and returns are possible branchs.
        let condition = condition && (is_ret || ojump);

        let ex_inc = !condition;

        let ex_jump = condition && opcode & 0xc0 == 0x00;
        let ex_push = condition && opcode & 0xe0 == 0x20;
        let ex_ret  = condition && opcode & 0xe0 == 0x60;

        count += 1;
        assert_eq!(jump, ex_jump, "Jump on {:#04x} {}", opcode, condition);
        assert_eq!(push, ex_push, "Push on {:#04x} {}", opcode, condition);
        assert_eq!(ret , ex_ret , "Ret  on {:#04x} {}", opcode, condition);
        assert_eq!(inc , ex_inc , "Inc  on {:#04x} {}", opcode, condition);
    }

    println!("Tested {} of {}", count, s.num_samples());
}
