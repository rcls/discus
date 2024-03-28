
pub fn pcdecode(path: &String) {
    let s = crate::spice_read::SpiceRead::from_path(path, 5e-6);
    let mut count = 0;
    let mut seen = std::collections::HashSet::new();

    for [o2, o3, o4, o5, o6, o7, ojump, co, z, jump, ret, push, inc] in
        s.extract_positive(
            &["o2", "o3", "o4", "o5", "o6", "o7", "ojump#", "co", "z#",
              "jump", "ret", "push#", "inc"])
    {
        let opcode = o7 as u8 * 128 + o6 as u8 * 64 + o5 as u8 * 32
           + o4 as u8 * 16 + o3 as u8 * 8 + o2 as u8 * 4;

        seen.insert((opcode, ojump, co, z));

        if opcode >= 0x40 && ojump {
            continue;  // Impossible combination.
        }

        let condition = match opcode & 0x1c {
            0 => true,
            4 => false,
            8 => z,
            12 => !z,
            16 => co,
            20 => !co,
            24 => z & co,
            28 => !z | !co,
            _ => unreachable!(),
        };

        let is_ret = opcode & 0xe0 == 0x40;
        // Only jump instructions and returns are possible branchs.
        let condition = condition && (is_ret || ojump);

        let ex_inc = !condition;

        let ex_jump = condition && opcode & 0xc0 == 0x00;
        let ex_push = condition && opcode & 0xe0 == 0x20;
        let ex_ret  = condition && is_ret;

        count += 1;
        assert_eq!(jump, ex_jump, "Jump on {opcode:#04x} {condition}");
        assert_eq!(push, ex_push, "Push on {opcode:#04x} {condition}");
        assert_eq!(ret , ex_ret , "Ret  on {opcode:#04x} {condition}");
        assert_eq!(inc , ex_inc , "Inc  on {opcode:#04x} {condition}");
    }
    assert_eq!(seen.len(), 512);

    println!("Tested {count} of {}", s.num_samples());
}
