#!/usr/bin/python3

import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('src', help='Input file')
parser.add_argument('dst', help='Output .cir file')
parser.add_argument('-w', help='Output spice trace')
parser.add_argument('-t', default=2000, type=float,
                    help='Spice simulation time')
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

if 'executed' in params:
    ns = args.t * (int(params['executed']) + 3) + 1000
    if ns == int(ns):
        ns = int(ns)
    dst.write(f'tran 50n {ns}n uic\n')

if args.w is not None:
    dst.write('write\n')
    dst.write('quit\n')
dst.write('.endc\n')
