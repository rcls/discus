#!/usr/bin/python3

import sys
import time

N = int(sys.argv[1])

def go(S):
    sys.stdout.write(S)
    sys.stdout.flush()

#go('1r0r')

for P in reversed(range(0,64)):
    B = N & (1 << P)
    if B == 0:
        go('40=80!')
    else:
        go('40=c0!')
    if P == 0:
        go('40=40!')
    else:
        go('40=00!')

#time.sleep(1)
#sys.stdout.buffer.write(b'40=@\377\377\n')
