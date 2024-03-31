use std::collections::BTreeMap;
use std::fs::File;
use std::io::{BufRead, BufReader};

const SKIP: f64 = 1.0;

const THRESHOLD: f64 = 1.2;

#[derive(Default)]
pub struct SpiceRead {
    pub quantum: f64,
    sample_point: f64,
    stability_check: bool,

    num_vars: usize,
    num_points: usize,
    pub vars: BTreeMap<String, usize>,
    index: Vec<usize>,
    other: Vec<usize>,
    raw_values: Vec<f64>,
}

impl SpiceRead {
    pub fn new(quantum: f64, sample_point: f64,
               stability_check: bool) -> SpiceRead {
        SpiceRead {
            quantum, sample_point, stability_check,
            .. SpiceRead::default()
        }
    }

    pub fn from_path(path: &String, quantum: f64) -> SpiceRead {
        let mut spice = SpiceRead::new(quantum, quantum * 0.7, true);
        spice.spice_read(&mut BufReader::new(File::open(path).unwrap()), false);
        spice
    }

    pub fn num_samples(&self) -> usize {
        self.index.len()
    }

    pub fn spice_read(&mut self, f: &mut impl BufRead, clock_recover: bool) {
        let mut line = String::new();
        loop {
            getline(&mut line, f);

            if line.starts_with("Title: ") || line.starts_with("Date: ")
                || line.starts_with("Plotname:") || line.starts_with("Flags:") {
            }
            else if let Some(num) = line.strip_prefix("No. Variables: ") {
                self.num_vars = num.trim().parse().expect("Bogus num vars");
            }
            else if let Some(num) = line.strip_prefix("No. Points: ") {
                self.num_points = num.trim().parse().expect("Bogus num points");
            }
            else if line.starts_with("Variables:") {
                self.read_var_list(f)
            }
            else if line.starts_with("Binary:") {
                break;
            }
            else {
                panic!("Unexpected line {line}");
            }
        }

        let total = self.num_points * self.num_vars;
        self.raw_values.resize(total, 0.0);
        {
            let mut slice = unsafe {
                std::slice::from_raw_parts_mut(
                    self.raw_values.as_mut_ptr() as *mut u8,
                    total * std::mem::size_of::<f64>())
            };
            f.read_exact(&mut slice).unwrap();
        }
    
        // Validate the timestamps.
        let mut last = 0.0;
        for t in self.iterate_column("time") {
            assert!(t - last <= 0.21 * self.quantum,
                    "Timestep too large {last} {t}");
            assert!(t > last, "Time goes backwards {last} {t}");
            last = t;
        }

        if clock_recover {
            self.index = self.clock_recover("phi1##_m");
            self.other = self.clock_recover("phi1");
        }
        else {
            self.clock_index();
        }
    }

    fn clock_index(&mut self) {
        // Select the indices to use for sampling.
        let mut last_i = -1;
        let mut index = Vec::new();
        for (row, t) in self.iterate_column("time").enumerate() {
            let i = ((t - self.sample_point) / self.quantum).floor() as isize;
            if i <= last_i {
                continue;
            }
            assert_eq!(i, last_i + 1);
            assert_eq!(i as usize, index.len());
            last_i = i;
            index.push(row * self.num_vars);
        }
        self.index = index;
    }

    fn clock_recover(&mut self, name: &str) -> Vec<usize> {
        let mut prev_clock = true;
        let mut prev_time = 0.0;
        let mut index = Vec::new();

        for (row, (value, time)) in self.iterate_column(name)
            .zip(self.iterate_column("time"))
            .enumerate() {
            if time < self.sample_point {
                continue;
            }
            let clock = value > THRESHOLD;
            if !prev_clock && clock {
                if index.len() > 0 {
                    assert!((time - prev_time - self.quantum).abs() < 1e-7,
                            "Time {} delta {}", time, time - prev_time);
                }
                index.push(row * self.num_vars);
                prev_time = time;
            }
            prev_clock = clock;
        }
        index
    }

    fn read_var_list(&mut self, f: &mut impl BufRead) {
        let mut line = String::new();
        for i in 0..self.num_vars {
            getline(&mut line, f);
            let mut parts = line.trim_end().split('\t');
            assert!(parts.next().is_some_and(|x| x == ""),
                    "Corrupt var line '{line}'");

            let index: usize = parts.next().expect("Truncated var line").parse()
                .expect("Corrupt index");
            assert_eq!(index, i);
            let mut name  = parts.next().expect("Truncated var line");
            let _type = parts.next().expect("Truncated var line");
            parts.next().ok_or(()).expect_err("Trailing junk");

            if let Some(n) = name.strip_prefix("v(") {
                if let Some(n) = n.strip_suffix(")") {
                    name = n;
                }
            }
            self.vars.insert(name.into(), index);
        }
    }

    pub fn iterate_column(&self, name: &str) -> impl '_ + Iterator<Item=f64> {
        let column = self.vars[name];
        self.raw_values[column..].iter().step_by(self.num_vars).copied()
    }

    pub fn extract_sample(&self, name: &str) -> Vec<f64> {
        let column = self.vars[name];
        self.index.iter().map(move |i| self.raw_values[i + column]).collect()
    }

    pub fn extract_signal(&self, name: &str) -> Vec<bool> {
        let column = self.vars[name];
        if self.stability_check {
            self.stability_check(name, column);
        }
        self.index.iter().map(|i| self.raw_values[i + column] > THRESHOLD)
            .collect()
    }

    pub fn extract_byte(&self, pos: &str, neg: &str) -> Vec<u8> {
        self.indexed_byte(pos, neg, "", &self.index)
    }

    pub fn extract_byte_diff(&self, pos: &str) -> Vec<u8> {
        self.indexed_byte(pos, pos, "#", &self.index)
    }

    pub fn extract_byte_other(&self, pos: &str, neg: &str) -> Vec<u8> {
        self.indexed_byte(pos, neg, "", &self.other)
    }

    pub fn extract_byte_single(&self, name: &str) -> Vec<u8> {
        self.indexed_byte_single(name, &self.index)
    }

    pub fn indexed_byte(&self, pos: &str, neg: &str, negs: &str,
                        index: &[usize]) -> Vec<u8> {
        let ps: [String; 8] = std::array::from_fn(|i| format!("{pos}{i}"));
        let ns: [String; 8] = std::array::from_fn(|i| format!("{neg}{i}{negs}"));
        let columns: [_; 8] = std::array::from_fn(
            |i| (self.vars[&ps[i]], self.vars[&ns[i]]));
        let bit = |i, p, n| self.raw_values[i+p] > self.raw_values[i+n];
        let mut res = Vec::new();
        for i in index {
            res.push(columns.iter().enumerate()
                     .map(|(b, (p, n))| bit(i, p, n) as (u8) << b)
                     .sum());
        }
        res
    }

    pub fn indexed_byte_single(&self, name: &str, index: &[usize]) -> Vec<u8> {
        let names: [String; 8] = std::array::from_fn(|i| format!("{name}{i}"));
        let columns: [_; 8] = std::array::from_fn(|i| self.vars[&names[i]]);
        let mut res = Vec::new();
        for i in index {
            res.push(columns.iter().enumerate()
                     .map(|(b, c)| (self.raw_values[i+c] > THRESHOLD) as (u8)
                                    << b)
                     .sum());
        }
        res
    }

    pub fn extract_positive<const N: usize>(&self, names: &[&str; N]) -> Vec<[bool; N]> {
        let columns: Vec<_> = names.iter().map(|n| self.vars[*n]).collect();
        let mut r = Vec::new();
        for i in self.index.iter() {
            let values = std::array::from_fn::<bool, N, _>(
                |j| {
                    let c = columns[j];
                    let val = self.raw_values[i+c] > THRESHOLD;
                    val ^ names[j].ends_with("#")
                }
            );
            r.push(values);
        }
        r
    }

    fn stability_check(&self, name: &str, column: usize) {
        let tc = self.vars["time"];
        for row in self.raw_values.chunks_exact(self.num_vars) {
            let q = row[tc] / self.quantum;
            let part = q.fract();
            if part < 0.5 || part > 0.9 || q < SKIP {
                continue;
            }
            let val = row[column];
            assert!(val < 0.5 || val > 2.0,
                    "Indeterminate {name} @{} val {val}", row[tc]);
        }
    }
}

fn getline(line: &mut String, f: &mut impl BufRead) {
    line.clear();
    if f.read_line(line).unwrap() == 0 {
        panic!("Unexpected EOF");
    }
}
