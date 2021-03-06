#!/usr/bin/python3

import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('src', help='Input file')
parser.add_argument('dst', help='Output .cir file')
parser.add_argument('-w', help='Output spice trace')
parser.add_argument('-t', help='Spice simulation time', default=3000, type=int)
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

dst.write(f'* {args.dst}\n')

for X in src:
    X = X.rstrip().split(' ')
    if len(X) >= 4 and X[3] == '{INFINITY}':
        if not X[0] in lines:
            continue
        X[3] = '1'
    dst.write(' '.join(X) + '\n')

dst.write('.control\n')

#dst.write('save zo_c co_c phi')
#for X in 'p', 'i', 'a', 'r_xb', 'r_yb', 'r_ub', 'r_kb':
#    for D in '01234567':
#        dst.write(f' {X}{D}')
#dst.write('\n')

if 'executed' in params:
    ns = args.t * (int(params['executed']) + 3) + 1000
    dst.write(f'tran 50n {ns}n uic\n')

if args.w is not None:
    dst.write('write\n')
    dst.write('quit\n')
dst.write('.endc\n')
