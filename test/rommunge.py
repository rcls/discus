#!/usr/bin/python3

import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('src', help='Input file')
parser.add_argument('dst', help='Output .cir file')
parser.add_argument('-w', help='Output spice trace')
parser.add_argument('-t', help='Spice simulation time')
args = parser.parse_args()

params = { }

lines = set()
for X in sys.stdin:
    X = X.rstrip()
    lines.add(X)
    L = X.split(' ')
    if len(L) == 2:
        params[L[0]] = L[1]

src = open(args.src)
dst = open(args.dst, 'w')

for X in src:
    X = X.rstrip().split(' ')
    if len(X) >= 4 and X[3] == 'INFINITY':
        if not X[0] in lines:
            continue
        X[3] = '1'
    dst.write(' '.join(X) + '\n')

dst.write('.control\n')
dst.write('save fz fc phi0 phi1 vk_c')

for X in 'p.', 'i._c', 'a.', 'vx_s.c', 'vy_s.c', 'vu_s.c':
    for D in '01234567':
        dst.write(' ' + X.replace('.',D))

dst.write('\n')

if 'executed' in params:
    dst.write('tran 1u ' + str(int(params['executed']) * 10 + 20) + 'u uic\n')

if args.w is not None:
    dst.write('write ' + args.w + '\n')
    dst.write('quit\n')
dst.write('.endc\n')
