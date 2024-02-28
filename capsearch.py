#!/usr/bin/python3

import argparse
import re
import subprocess
import sys
# import types

parser = argparse.ArgumentParser()
parser.add_argument('-r', '--recheck', action='store_true',
                    help='recheck settled tests')
parser.add_argument('-g', '--good-check', action='store_true',
                    help='recheck good limit')
parser.add_argument('-b', '--bad-check', action='store_true',
                    help='recheck bad limit')
parser.add_argument('-a', '--all', action='store_true',
                    help='use all targets not just critical')
parser.add_argument('-t', '--target', nargs='+', help='override target')
parser.add_argument('-n', '--dry-run', action='store_true', help='run none')
parser.add_argument('wanted', nargs='*', help='tests to run')
args = parser.parse_args()

if args.good_check or args.bad_check:
    args.recheck = True

Q=2000
currentQ = 2000
LOGIC = 'call cmp inc sub add logic'
MEMORY = 'memp mem memi memw hazard2 hazard memf'

def target_list(t):
    if args.target:
        return args.target
    if type(t) != str:
        return list(t)
    targets = []
    for s in t.split():
        if 'verify' in s:
            targets.append(s)
        else:
            targets.append(f'test/{s}.verify')
    return targets

def wanted(NAME, WANTED):
    if len(args.wanted) == 0 and WANTED is not False:
        return True
    for P in args.wanted:
        if NAME == P or NAME.startswith(P + '_'):
            return True
    if len(args.wanted) > 0:
        return False
    #return WANTED is not False
    return WANTED

def slurppath(P):
    with open(P) as F:
        return list(F)

def writepath(P, lines):
    with open(P, 'w') as F:
        F.writelines(lines)

def dram_cap(pf=680):
    P = 'gates/drambyte.sch'
    content = slurppath(P)
    with open(P, 'w') as F:
        for L in content:
            if L.startswith('value=') and L.strip().endswith('p'):
                L = f'value={pf}p\n'
            F.write(L)

def speed(vt=None, t0=None, tr=None):
    global currentQ
    if vt == None:
        vt = Q
    if t0 is None:
        t0 = vt / 2 - 10
    if tr is None:
        tr = 2 * vt
    path = 'board/univlight.sch'
    univ = slurppath(path)
    refdes = ''
    with open(path, 'w') as F:
        for l in univ:
            if l.startswith('refdes='):
                refdes = l.removeprefix('refdes=').strip()
            if l.startswith('value=pulse') and refdes == 'Vc0':
                l = f'value=pulse 0 2.5v 1u 10n 10n {t0:g}n {vt}n\n'
            if l.startswith('value=pulse') and refdes == 'Vrst':
                l = f'value=pulse 0 2.5v {tr:g}n 10n 10n 9 10\n'
            F.write(l)
    currentQ = vt

def resistors(rload=2490, rstrong=820, rpull=10e3):
    rload = rload * 1e-3
    rpull = rpull * 1e-3
    with open('subckt/resistor-load.prm', 'w') as F:
        F.write(f'.MODEL rload R (R={rload:g}k)\n')
        F.write(f'.MODEL rstrong R (R={rstrong:g})\n')
        F.write(f'.MODEL rpull R (R={rpull:g}k)\n')

def rload(v=2490):
    resistors(rload=v)

def rstrong(v=820):
    resistors(rstrong=v)

def rpull(v=10e3):
    resistors(rpull=v)

def replace_line(path, start, replace):
    lines = slurppath(path)
    with open(path, 'w') as F:
        for l in lines:
            if l.startswith(start):
                l = replace
            F.write(l)

def npn_beta(b=272):
    replace_line('subckt/BC847BW.prm', '+ BF = ', f'+ BF = {b}\n')

def npn22_beta_reverse(br=20.09):
    replace_line('subckt/PDTC124TU.prm', '+ BR = ', f'+ BR = {br}\n')

def npn22_beta(b=291):
    replace_line('subckt/PDTC124TU.prm', '+ BF = ', f'+ BF = {b}\n')

def npn22_r(r=22):
    replace_line('subckt/PDTC124TU.prm', 'R 20 2', f'R 20 2 {r}k\n')

def jfet_vto(VTO=1.04):
    replace_line('subckt/2SK3557-7.prm', '+ VTO=', f'+ VTO=-{VTO}\n')

def jfet_beta(BETA=0.026):
    replace_line('subckt/2SK3557-7.prm', '+ BETA=', f'+ BETA={BETA}\n')

def nmos_vto(VTO=0.9):
    # FIXME - this is confused between 0.82 and 0.9.
    # Original line is:
    '.MODEL DMOS NMOS(VTO=0.82 KP=4.12E-1'
    path = 'subckt/FDV301N.prm'
    nmos = slurppath(path)
    munged = []
    for L in nmos:
        if L.startswith('.model FDV301N VDMOS'):
            L = re.sub(r'\bvto=[^ ]* ', f'vto={VTO} ', L)
        munged.append(L)
    writepath(path, munged)

def pmos_vto(VTO=0.9):
    path = 'subckt/NX3008PBK.prm'
    pmos = slurppath(path)
    munged = []
    for L in pmos:
        if L.startswith('.model NX3008 VDMOS'):
            L = re.sub(r'\bvto=[^ ]* ', f'vto=-{VTO} ', L)
        munged.append(L)
    writepath(path, munged)

def slow(*args, **kwargs):
    scan(*args, **kwargs, SPEED=4000)

def fast(*args, **kwargs):
    scan(*args, **kwargs, SPEED=2000)

def try_one(MUNGE, V, TARGET, RESULTS, SPEED=None, EXTRA=[]):
    print(f'=== Try {V:g} ===', flush=True)
    if SPEED is not None:
        speed(SPEED)
    for f, v in EXTRA:
        f(v)
    MUNGE(V)
    status = subprocess.call(['make', '-j4', '-k', f'QUANTUM={currentQ}']
                             + TARGET)
    res = f'=== Value {V:g} gives status {status}'
    RESULTS.append((V, res))
    print(res, flush=True)
    return status == 0

def scan(NAME, BAD, GOOD, MUNGE, TARGET='verify', FACTOR=1,
         SPEED=None, WANTED=None, CRIT=None, EXTRA=[]):
    assert MUNGE is not None
    if not wanted(NAME, WANTED):
        return

    if args.good_check and GOOD is not None:
        BAD, GOOD = GOOD - 1, GOOD + 1
    elif args.bad_check and BAD is not None:
        BAD, GOOD = BAD - 1, BAD + 1
    if BAD is None or GOOD is None:
        return
    if WANTED is not True and not args.recheck and abs(GOOD - BAD) <= 1:
        print('=== SETTLED', NAME)
        return

    print('=== START', NAME, '===', flush=True)
    if args.dry_run:
        return
    results = []
    if not args.all and CRIT != None:
        TARGET = CRIT
    TARGET = target_list(TARGET)
    while abs(GOOD - BAD) > 1:
        MID = (BAD + GOOD) // 2
        V = MID * FACTOR
        if try_one(MUNGE, V, TARGET, results, SPEED, EXTRA):
            GOOD = MID
        else:
            BAD = MID
    MUNGE()
    print('=== RESULT', NAME, '===')
    results.sort()
    for _, L in results:
        print(L)
    print('===')
    for f, _ in EXTRA:
        f()
    speed()

##################### SPEED ########################

scan('speed_basic', 1750, 1751, speed, TARGET=MEMORY, CRIT='memi hazard2')

scan('speed_duty1', 67, 68,
     lambda v=None: speed() if v is None else speed(Q, Q - v - 20),
     TARGET=MEMORY, FACTOR=10, CRIT='memp')

scan('speed_duty0', 80, 81,
     lambda v=None: speed() if v is None else speed(Q, v),
     TARGET=MEMORY, FACTOR=10, CRIT='memp hazard2')

scan('speedl_logic', 1779, 1780, speed, TARGET=LOGIC, CRIT='cmp inc')

scan('speedl_duty1', 60, 61,
     lambda v=None: speed() if v is None else speed(Q, Q - v - 20),
     TARGET=LOGIC, CRIT='cmp inc', FACTOR=10)

scan('speedl_duty0', 54, 55,
     lambda v=None: speed() if v is None else speed(Q, v), TARGET=LOGIC,
     CRIT='call inc', FACTOR=10)

##################### DRAM CAP ######################

fast('dram_cap_lo', 13, 14, dram_cap, FACTOR=10, TARGET=MEMORY,
     CRIT='memp  mem')

# FIXME - change to 4000µs.
scan('dram_cap_hi_slow', 28, 27, dram_cap, FACTOR=100, SPEED=3000,
     TARGET=MEMORY, CRIT='mem memi')

fast('dram_cap_hi_fast', 154, 153, dram_cap, TARGET=MEMORY, FACTOR=10,
     CRIT='hazard2  hazard')

####################### JFET ##########################

# We can take this with a grain of salt, changing VTO without modifying β
# means we are dropping the Idss by a significant factor.
fast('jfet_vto_lo', 35, 36, jfet_vto, TARGET=MEMORY, FACTOR=0.01,
     CRIT='hazard  hazard2')

fast('jfet_vto_hi', 63, 62, jfet_vto, TARGET=MEMORY, FACTOR=0.1,
     CRIT='memp hazard2')

fast('jfet_beta_lo', 2, 3, jfet_beta, TARGET=MEMORY, FACTOR=1e-3,
     CRIT='hazard2')

# TODO - bias R and JFET properties.

######################### NPN #################################

fast('npn_beta_lo', 7, 8, npn_beta, CRIT='call inc')

fast('npn_beta_hi', None, 10000, npn_beta, CRIT='call inc')

# Capacitance scaling?

####################### PRE-BIAS NPN ##############################

fast('rnpn_r_lo', 49, 50, npn22_r, FACTOR=0.1, TARGET=LOGIC, CRIT='inc')

fast('rnpn_r_hi_fast', 40, 39, npn22_r, TARGET=LOGIC, CRIT='cmp inc')
slow('rnpn_r_hi_slow', 16, 15, npn22_r, FACTOR=10, TARGET=LOGIC, CRIT='call')

fast('rnpn_beta_lo', 25, 26, npn22_beta, CRIT='memw')

fast('rnpn_beta_hi', None, 10000, npn22_beta, TARGET=LOGIC, CRIT='call inc')

fast('rnpn_br_lo', None, 1, npn22_beta_reverse, FACTOR=0.1,
     TARGET=LOGIC, CRIT='call')

fast('rnpn_br_hi', None, 10000, npn22_beta_reverse, TARGET=LOGIC,
     CRIT='call inc')

##################### RESISTORS ##########################

fast('rstrong_lo', 134, 135, rstrong, CRIT='mem')

slow('rstrong_hi_slow', 30, 29, rstrong, FACTOR=100, CRIT='mem memp')

fast('rstrong_hi_fast', 127, 126, rstrong, FACTOR=10, CRIT='memi hazard2')

#fast('rbias_lo', 125, 126, rbias, TARGET=MEMORY, CRIT='mem memp hazard2')
#slow('rbias_hi', 44, 43, rbias, TARGET=MEMORY, FACTOR=100, CRIT='mem')

slow('rload_hi_slow', 77, 76, rload, FACTOR=100, CRIT='call inc')

fast('rload_hi_fast', 306, 305, rload, FACTOR=10, CRIT='inc  memi')

fast('rload_lo', 65, 66, rload, CRIT='memp  mem', FACTOR=10)

fast('rpull_lo', None, 100, rpull, TARGET=MEMORY, CRIT='hazard2 memf')
fast('rpull_hi', None, 200e3, rpull, TARGET=MEMORY, CRIT='hazard2 memf')

fast('rpullcap_lo', 5, 6, rpull, FACTOR=100, TARGET=MEMORY, CRIT='mem memp',
     EXTRA=[(dram_cap, 140)])
fast('rpullcap_hi', 102, 101, rpull, FACTOR=100, TARGET=MEMORY, CRIT='mem',
     EXTRA=[(dram_cap, 140)])

######################### MOSFETS #################################
fast('nmos_vto_lo', 452, 453, nmos_vto, FACTOR=1e-3, CRIT='inc logic')

slow('nmos_vto_hi_slow', 167, 166, nmos_vto, FACTOR=10e-3, CRIT='call  inc')
fast('nmos_vto_hi_fast', 109, 108, nmos_vto, FACTOR=10e-3, CRIT='call  inc')

slow('pmos_vto_hi_slow', 183, 182, pmos_vto, FACTOR=10e-3, CRIT='mem  hazard')
fast('pmos_vto_hi_fast', 135, 134, pmos_vto, FACTOR=10e-3, CRIT='hazard memp')

fast('pmos_vto_lo', 315, 316, pmos_vto, FACTOR=1e-3, CRIT='inc memp')

# FIXME - nmos cap scaling.

################################# EXTRAS #######################
# Reset timing on testadd: 3595n minimum (what cycle?)
#scan(0, 3 * Q, 2 * Q, lambda v: speed(tr=v),
#     TARGET='test/add.verify', NAME='Reset')
