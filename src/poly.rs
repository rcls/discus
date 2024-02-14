#[derive(Clone, Copy, Debug)]
pub struct Poly{p: u32}

impl Poly {
    pub fn double(self, x: u32) -> u32 {
        (x * 2).min(x * 2 ^ self.p)
    }

    fn reduce(self, mut x: u32) -> u32 {
        for b in (0..=15).into_iter().rev() {
            x = x.min(x ^ self.p << b);
        }
        x
    }

    fn mult(self, x: u32, y: u32) -> u32 {
        let mut r = 0;
        for i in 0..16 {
            if x & 1 << i != 0 {
                r ^= y << i;
            }
        }
        self.reduce(r)
    }

    pub fn power(self, x: u32, mut n: u32) -> u32 {
        let mut s = x;
        let mut r = 1;
        while n != 0 {
            if n & 1 != 0 {
                r = self.mult(r, s);
            }
            s = self.mult(s, s);
            n >>= 1;
        }
        r
    }

    // 65535 = 3 * 5 * 17 * 257,
    // cofactors are 257, 0xf0f, 0x3333, 0x5555
    pub fn is_gen(self, x: u32) -> bool {
        if self.power(x, 65535) != 1 {
            return false;
        }
        for cof in [0xff, 0xf0f, 0x3333, 0x5555] {
            if self.power(x, cof) == 1 {
                return false;
            }
        }
        true
    }
}


fn main() {
    for p in (0x10001..=0x1ffff).step_by(2) {
        let p = Poly{p};
        if p.is_gen(2) {
            let c = p.power(2, 256);
            println!("{:#x} {:#06x}", p.p, c)
        }
    }
}