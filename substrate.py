#!/usr/bin/python3

import sys

FILE = open(sys.argv[1])

TRANS = None

print('*', sys.argv[1])

for L in FILE:
    L = L.strip()
    words = L.split()
    if len(words) == 5 and words[0].startswith('M') and words[4] == 'NMOS_switch':
        words[4] = 'FDV301N'
    if len(words) == 5 and words[0].startswith('M') and words[4] == 'PMOS_switch':
        words[4] = 'NX3008'
    if len(words) == 5 and words[0].startswith('Q') \
       and words[4] in ('PDTC124TU', 'BC847BW'):
        words[0] = 'X' + words[0]

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
