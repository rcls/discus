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
DEFAULT_BIAS_POT=1.8

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

def bias_pot(volts=DEFAULT_BIAS_POT):
    with open('subckt/bias-pot.prm', 'w') as F:
        F.write(f'''.subckt bias_pot gnd vdd set
Vbias 1 gnd DC {volts:g}
Rout 1 set 100
.ends
''')

def resistors(rload=2490, rstrong=820, rpull=22e3):
    rload = rload * 1e-3
    rpull = rpull * 1e-3
    with open('subckt/resistor-load.prm', 'w') as F:
        F.write(f'.MODEL rload R (R={rload:g}k)\n')
        F.write(f'.MODEL rstrong R (R={rstrong:g})\n')
        F.write(f'.MODEL rpull R (R={rpull:g}k)\n')

def rbias(ohms=820):
    path = 'gates/dramio.sch'
    content = slurppath(path)
    refdes = ''
    with open(path, 'w') as F:
        for l in content:
            if l.startswith('refdes='):
                refdes = l.removeprefix('refdes=').strip()
            if l.startswith('value=') and refdes == 'R':
                l = f'value={ohms}\n'
            F.write(l)

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

def hbt_beta(b=273.94):
    replace_line('subckt/2SC4774.prm', '+ BF=', f'+ BF={b}\n')

def hbt_beta_reverse(b=123.13):
    replace_line('subckt/2SC4774.prm', '+ BR=', f'+ BR={b}\n')

def hbt_cap_scale(f=1):
    if f == 1:
        CJE = '2.4548E-12'
        CJC = '1.3066E-12'
    else:
        CJE = 2.4548E-12 * f
        CJC = 1.3066E-12 * f
    replace_line('subckt/2SC4774.prm', '+ CJE=', f'+ CJE={CJE}\n')
    replace_line('subckt/2SC4774.prm', '+ CJC=', f'+ CJC={CJC}\n')


def nmos_vto(VTO = 0.9):
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

def try_one(MUNGE, V, TARGET, RESULTS, SPEED=None, RBIAS=None, BIAS_POT=None):
    print(f'=== Try {V:g} ===', flush=True)
    if SPEED is not None:
        speed(SPEED)
    if RBIAS is not None:
        rbias(RBIAS)
    if BIAS_POT is not None:
        bias_pot(BIAS_POT)
    MUNGE(V)
    status = subprocess.call(['make', '-j4', '-k', f'QUANTUM={currentQ}']
                             + TARGET)
    res = f'=== Value {V:g} gives status {status}'
    RESULTS.append((V, res))
    print(res, flush=True)
    return status == 0

def scan(NAME, BAD, GOOD, ORIG, MUNGE, TARGET='verify', FACTOR=1,
         SPEED=None, WANTED=None, BIAS_POT=None, RBIAS=None, CRIT=None):
    assert type(NAME) == str
    if not wanted(NAME, WANTED):
        return

    if args.good_check:
        BAD = GOOD
    if args.bad_check:
        GOOD = BAD
    if BAD is None or GOOD is None:
        return
    if WANTED is not True and not args.recheck and abs(GOOD - BAD) <= 1:
        print('=== SETTLED', NAME)
        return
    if BAD < GOOD:
        BAD -= 1
        GOOD += 1
    else:
        BAD += 1
        GOOD -= 1

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
        if try_one(MUNGE, V, TARGET, results, SPEED, RBIAS, BIAS_POT):
            GOOD = MID
        else:
            BAD = MID
    if ORIG is not None:
        MUNGE(ORIG)
    else:
        MUNGE()
    print('=== RESULT', NAME, '===')
    results.sort()
    for _, L in results:
        print(L)
    print('===')
    speed()
    bias_pot()
    rbias()

##################### SPEED ########################

scan('speed_basic', 1900, 1901, 2000, speed, CRIT='hazard2 memi memp')

scan('speed_duty1', 615, 616, Q / 2 - 10, lambda v: speed(Q, Q - v - 20),
     CRIT='memp hazard2')

scan('speed_duty0', 936, 937, Q / 2 - 10, lambda v: speed(Q, v),
     CRIT='memp hazard2')

##################### DRAM BIAS AND CAP ######################

fast('bias_pot_hi', 275, 274, None, bias_pot, FACTOR=10e-3, TARGET=MEMORY,
     CRIT='memf memw')

fast('bias_pot_lo', 1947, 1948, None, bias_pot, FACTOR=1e-3, TARGET=MEMORY,
     CRIT='memp hazard2')

slow('bias_r_lo', 147, 148, None, rbias, TARGET=MEMORY, CRIT='memp hazard2')
# Done at fast, wide margin at slow!
fast('bias_r_hi', 202, 201, None, rbias, FACTOR=10, TARGET=MEMORY, CRIT='memp')

slow('dram_cap_lo', 162, 163, None, dram_cap, TARGET=MEMORY, CRIT='mem hazard2')

# FIXME - change to 4000µs.
scan('dram_cap_hi_slow', 167, 166, None, dram_cap, FACTOR=10, SPEED=3000,
     TARGET=MEMORY, CRIT='memf')

fast('dram_cap_hi_fast', 96, 95, None, dram_cap, TARGET=MEMORY, FACTOR=10,
     CRIT='hazard2 memf')
# FIXME - dram cap lo full speed.

######################### NPN #################################

slow('npn_beta', 3, 4, None, npn_beta, CRIT='call inc')

# Capacitance scaling?

####################### PRE-BIAS NPN ##############################

slow('rnpn_r_lo', 22, 23, None, npn22_r, FACTOR=0.1, TARGET=LOGIC, CRIT='inc')

slow('rnpn_r_hi', 119, 118, None, npn22_r, TARGET=LOGIC, CRIT='call')

slow('rnpn_beta_lo', 22, 23, None, npn22_beta, CRIT='memw')

slow('rnpn_beta_hi', None, 10000, None, npn22_beta, TARGET=LOGIC,
     CRIT='call inc')

slow('rnpn_br_lo', 11, 12, None, npn22_beta_reverse, FACTOR=0.1,
     TARGET=LOGIC, CRIT='call')

slow('rnpn_br_hi', None, 10000, None, npn22_beta_reverse, TARGET=LOGIC,
     CRIT='call inc')

########################## HBT ###########################

slow('hbt_beta_lo', 7, 8, 273.94, hbt_beta, TARGET=MEMORY,
     CRIT='memf hazard2')

slow('hbt_beta_hi', None, 10000, 273.94, hbt_beta, TARGET=MEMORY,
     CRIT='memp hazard2')

slow('hbt_br_lo', 9, 10, 123.13, hbt_beta_reverse, TARGET=MEMORY, CRIT='memw')

slow('hbt_br_hi', None, 10000, 123.13, hbt_beta_reverse, TARGET=MEMORY,
     CRIT='memp hazard2')

slow('hbt_cap', 73, 72, 1, hbt_cap_scale, TARGET=MEMORY, FACTOR=0.1,
     CRIT='hazard2 mem')

##################### RESISTORS ##########################

fast('rstrong_lo', 103, 104, 820, lambda v: resistors(rstrong=v), CRIT='mem')

slow('rstrong_hi', 45, 44, 820, lambda v: resistors(rstrong=v), FACTOR=100,
     CRIT='mem')

slow('rload_hi_slow', 80, 79, 2490, lambda v: resistors(rload=v), FACTOR=100,
     CRIT='mem hazard2')

fast('rload_hi_fast', 2702, 2701, 2490, lambda v: resistors(rload=v),
     CRIT='memp hazard2')

fast('rload_lo', 651, 652, 2490, lambda v: resistors(rload=v), CRIT='mem memp')

fast('rpull_lo', 47, 48, 22e3, lambda v: resistors(rpull=v), FACTOR=100,
     CRIT='call')

# [Logic is passing at quite high]
slow('rpull_hi', 59, 58, 22e3, lambda v: resistors(rpull=v), FACTOR=1000,
     CRIT='memw memf')

######################### MOSFETS #################################
slow('nmos_vto_lo', 395, 396, 0.9, nmos_vto, FACTOR=1e-3,
     CRIT='call inc', BIAS_POT=DEFAULT_BIAS_POT-0.4)

# +0.2 : 1112,3
slow('nmos_vto_hi', 1378, 1377, 0.9, nmos_vto, FACTOR=1e-3,
     BIAS_POT=DEFAULT_BIAS_POT+0.6, CRIT='memp hazard2')

slow('pmos_vto_hi', 229, 228, 0.9, pmos_vto, FACTOR=10e-3,
     CRIT='memp hazard2 inc')

slow('pmos_vto_lo', 107, 108, 0.9, pmos_vto, FACTOR=1e-3,
     CRIT='call inc romdecode ramdecode')

# FIXME - nmos cap scaling.

################################# EXTRAS #######################
# Reset timing on testadd: 3595n minimum (what cycle?)
#scan(0, 3 * Q, 2 * Q, lambda v: speed(tr=v),
#     TARGET='test/add.verify', NAME='Reset')

################# LOGIC SPEED #################
scan('speedl_logic', 1759, 1760, 2000, speed, TARGET=LOGIC, CRIT='cmp inc')

scan('speedl_duty1', 58, 59, Q / 2 - 10, lambda v: speed(Q, Q - v - 20),
     TARGET=LOGIC, CRIT='call cmp inc', FACTOR=10)

scan('speedl_duty0', 67, 68, Q / 2 - 10, lambda v: speed(Q, v), TARGET=LOGIC,
     CRIT='call inc', FACTOR=10)

################# OPTIMAL DRAM BIAS ==================
#fast('midpot_bias_r_hi', 246, 245, None, rbias, FACTOR=10,
#     TARGET=MEMORY, WANTED=False, BIAS_POT=2.4, CRIT='memp hazard2')
#fast('midpot_bias_r_lo', 299, 300, None, rbias, TARGET=MEMORY,
#     CRIT='memw memf', BIAS_POT=2.4)

scan('midpot_mem_speed', 1820, 1821, None, speed, TARGET=MEMORY, BIAS_POT=2.6,
     CRIT='hazard2 memp', WANTED=False)

scan('fast_bias_pot_hi', 2641, 2640, None, bias_pot, FACTOR=1e-3, TARGET=MEMORY,
     CRIT='memf', SPEED=1821, WANTED=False)

scan('fast_bias_pot_lo', 2598, 2599, None, bias_pot, FACTOR=1e-3, TARGET=MEMORY,
     CRIT='memp hazard2', SPEED=1821, WANTED=False)
