use crate::instructions::{Instructions, constants::*};

const POLY: u32 = 0x16bab;

pub fn memcheck() -> Instructions {
    let p = Poly{p: POLY};
    assert!(p.is_gen(2));
    assert_eq!(p.power(2, 256), 3);

    let start: u8 = 0;
    let stop: u8 = start + 32;

    let mut mc = Instructions::default();

    mc  .xor  (A)
        .out  ()
        .incv (X, A)
        .incv (Y, A)

        .load (U, start)
    .label("init")
        .call ("a256")
        .load (A, U)
        .cmp  (stop)
        .jp   (NZ, "init")

    .label("recycle")
        .load (U, start)
    .label("cycle")
        .load (A, [U])
        .xor  (Y)
        .check(|s| s.c == false)
        .jp   (Z, "good")
        .sbc  (A)
        .check(|_| false)
        .out  ()
    .label("good")
        .call ("a256")
        .load (A, U)
        .cmp  (stop)
        .jp   (NZ, "cycle")
        .jump ("recycle")

    .label("a256")
        .load (A, X)
        .add  (A)
        .load (A, Y)
        .adc  (A)
        .jp   (NC, "a256c")
        .xor  ((POLY >> 8) as u8)
    .label("a256c")
        .xor  (Y)
        .sta  (U)
        .inc  (U)
        .call ("stir4")
    .label("stir4")
        .call ("stir2")
    .label("stir2")
        .call ("stir1")
    .label("stir1")
        .load (A, X)
        .add  (A)
        .load (X, A)
        .load (A, Y)
        .adc  (A)
        .load (Y, A)
        .rt   (NC)
        .xor  ((POLY >> 8) as u8)
        .load (Y, A)
        .load (A, X)
        .xor  (POLY as u8)
        .load (X, A)
        .ret  ();

    mc
}

#[derive(Clone, Copy, Debug)]
pub struct Poly{p: u32}

impl Poly {
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

#[cfg(test)]
fn list_n(n: u32) {
    for p in (0x10001..=0x1ffff).step_by(2) {
        let p = Poly{p};
        if p.is_gen(2) {
            let c = p.power(2, n);
            println!("{:#x} {:#06x} {} {:#06x}", p.p, c, c.count_ones(),
                     p.power(2, 65535 - n));
        }
    }
}


#[test]
fn list_256() {
    list_n(256);
}

#[test]
fn list_512() {
    list_n(512);
}
