pub fn memdecode(path: &String, tag: &str) {
    let s = crate::spice_read::SpiceRead::from_path(path, 5e-6);

    let p = s.extract_byte("p");

    let sel_names: Vec<String> = (0..64)
        .map(|i| format!("s_{}_{}_{}_{}",
                         a_char(i), a_char(i / 4), a_char(i / 16), tag))
        .collect();

    let selects: Vec<Vec<bool>> = sel_names.iter()
        .map(|n| s.extract_signal(&*n)).collect();

    let mut seen: Vec<bool> = sel_names.iter().map(|_| false).collect();

    for (i, address) in p.iter().enumerate() {
        let mut sel = None;
        for j in (0..64).filter(|&j| selects[j][i]) {
            if let Some(sel) = sel {
                panic!("At {i} P={address:#04x} bit {} and {} set",
                       sel_names[sel], sel_names[j]);
            }
            sel = Some(j);
            seen[j] = true;
        }
        assert_ne!(sel, None, "At {i} P={address:#04x} none set");
    }

    if let Some(m) = seen.iter().position(|&m| !m) {
        panic!("Did not see {}", sel_names[m]);
    }

    println!("{} samples", s.num_samples());
}

fn a_char(n: u32) -> char {
    char::from_u32('a' as u32 + n % 4).unwrap()
}
