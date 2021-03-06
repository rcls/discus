#!/usr/bin/python3

import sys

FILE = open(sys.argv[1])

TRANS = None

for L in FILE:
    L = L.strip()
    words = L.split()
    if len(words) == 5 and words[0].startswith('M') and words[4] == 'MMOS_switch':
        words[4] = 'FDV301N'
    if len(words) == 5 and words[0].startswith('M') and words[4] == 'PMOS_switch':
        words[4] = 'NX3008'

    if words and words[0] == 'tran':
        TRANS = L
        continue
    print(' '.join(words))

if TRANS:
    print('.control')
    print(TRANS)
    print('write')
    print('quit')
    print('.endc')
