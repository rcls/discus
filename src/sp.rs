pub fn sp(path: &String) {
    let s = crate::spice_load::SpiceRead::from_path(path, 10e-6);
    let mut count = 0;

    let mut prev = None;
    let mut prev_push = None;

    for (n, &[push, pop, s0, s1, s2, s3]) in s.extract_positive(&[
        "push#", "pop", "s0", "s1", "s2", "s3"]).iter().enumerate().skip(1)
    {
        let now = s0 as u8 + s1 as u8 * 2 + s2 as u8 * 4 + s3 as u8 * 8;
        assert_eq!(now.count_ones(), 1,
                   "None or multiple set {:#x} at {}", now, n);

        if let Some(prev) = prev {
            let mut expect = prev;
            if prev_push == Some(true) {
                expect <<= 1;
            }
            if pop {
                expect <<= 3;
            }
            expect %= 15;

            assert_eq!(expect, now,
                       "Expect {:#x} got {:#x} at {}", expect, now, n);
            count += 1;
        }

        prev = Some(now);
        prev_push = Some(push);
    }
    println!("Tested {} of {} samples", count, s.num_samples());
}
