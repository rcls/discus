#!/usr/bin/python3

import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('src', help='Input file')
parser.add_argument('dst', help='Output .cir file')
parser.add_argument('-w', help='Output spice trace')
parser.add_argument('-t', help='Spice simulation time', default='100u')
args = parser.parse_args()

lines = set()
for X in sys.stdin:
    lines.add(X.rstrip())

src = open(args.src)
dst = open(args.dst, 'w')

for X in src:
    X = X.rstrip().split(' ')
    if len(X) >= 4 and X[0] in lines and X[3] == '1e9':
        X[3] = '1'
    dst.write(' '.join(X) + '\n')

dst.write('.control\n')
dst.write('save fz fc phi0 phi1 vk_c')

for X in 'p.', 'i._c', 'a.', 'vx_s.c', 'vy_s.c', 'vu_s.c':
    for D in '01234567':
        dst.write(' ' + X.replace('.',D))

dst.write('\n')

if args.t is not None:
    dst.write('tran 1u 100u uic\n')
if args.w is not None:
    dst.write('write ' + args.w + '\n')
    dst.write('quit\n')
dst.write('.endc\n')
