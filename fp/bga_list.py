#!/usr/bin/python

import sys

headings = sys.stdin.readline().strip().split(',')

assert not headings[0]

for L in sys.stdin:
    cols = L.strip().split(',')
    for I in range(1,len(cols)):
        print cols[0] + headings[I] + ' ' + cols[I]
