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
parser.add_argument('-c', '--critical', action='store_true',
                    help='use critical target if known')
parser.add_argument('-n', '--dry-run', action='store_true', help='run none')
parser.add_argument('wanted', nargs='*', help='tests to run')
args = parser.parse_args()

if args.good_check or args.bad_check:
    args.recheck = True

Q=2000
currentQ = 2000
LOGIC = 'call inc sub add logic cmp'
MEMORY = 'memp mem memi memw hazard2 hazard memf'
DEFAULT_BIAS_POT=2

def target_list(t):
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
Rout 1 set 1k
Rload 1 vdd 1k
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

def scan(NAME, BAD, GOOD, ORIG, MUNGE, TARGET='verify', FACTOR=1,
         SPEED=None, WANTED=None, BIAS_POT=None, RBIAS=None, CRIT=None):
    assert type(NAME) == str
    if not wanted(NAME, WANTED):
        print('Ignore', NAME)
        return
    if WANTED is not True and not args.recheck and abs(GOOD - BAD) <= 1:
        print('=== SETTLED', NAME)
        return

    if args.good_check:
        BAD = GOOD
    if args.bad_check:
        GOOD = BAD
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
    if args.critical and CRIT != None:
        TARGET = CRIT
    TARGET = target_list(TARGET)
    while abs(GOOD - BAD) > 1:
        MID = (BAD + GOOD) // 2
        V = MID * FACTOR
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
        results.append((V, res))
        print(res, flush=True)
        if status == 0:
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

# WTF? Has regressed, 1913->1982.
scan('speed_basic', 1981, 1982, 2000, speed, CRIT='hazard2 memi memp')

scan('speed_duty1', 851, 852, Q / 2 - 10, lambda v: speed(Q, Q - v - 20),
     CRIT='memp hazard2')

# FIXME regressed.
scan('speed_duty0', 979, 980, Q / 2 - 10, lambda v: speed(Q, v),
     CRIT='memp hazard2')

##################### DRAM BIAS AND CAP ######################

fast('bias_pot_hi', 2793, 2792, None, bias_pot, FACTOR=1e-3, TARGET=MEMORY,
     CRIT='memf')

fast('bias_pot_lo', 1965, 1966, None, bias_pot, FACTOR=1e-3, TARGET=MEMORY,
     CRIT='memp hazard2')

slow('bias_r_lo', 278, 279, None, rbias, TARGET=MEMORY, CRIT='memp hazard2')
# Done at fast, wide margin at slow!
fast('bias_r_hi', 123, 122, None, rbias, FACTOR=10, TARGET=MEMORY, CRIT='memp')

slow('dram_cap_lo', 98, 99, None, dram_cap, TARGET=MEMORY, CRIT='mem hazard2')

# FIXME - change to 4000µs.
scan('dram_cap_hi', 183, 182, None, dram_cap, FACTOR=10, SPEED=3000,
     TARGET=MEMORY, CRIT='memf')

fast('dram_cap_hi_fast', 862, 861, None, dram_cap, TARGET=MEMORY,
     CRIT='hazard2')
# FIXME - dram cap lo full speed.

######################### NPN #################################

slow('npn_beta', 19, 20, None, npn_beta, CRIT='call inc')

# Capacitance scaling?

####################### PRE-BIAS NPN ##############################

slow('rnpn_r_lo', 22, 23, None, npn22_r, FACTOR=0.1, TARGET=LOGIC, CRIT='inc')
# 86.6k fails call, 86.2k passes.
slow('rnpn_r_hi', 87, 86, None, npn22_r, TARGET=LOGIC, CRIT='call')

slow('rnpn_beta_lo', 22, 23, None, npn22_beta, CRIT='memw')

slow('rnpn_beta_hi', 10000, 10000, None, npn22_beta, TARGET=LOGIC,
     CRIT='call inc')

slow('rnpn_br', 128, 129, None, npn22_beta_reverse, FACTOR=0.01,
     TARGET=LOGIC, CRIT='call')

slow('rnpn_br_hi', 10000, 10000, None, npn22_beta_reverse, TARGET=LOGIC,
     CRIT='call inc')

########################## HBT ###########################

# FIXME - can we flip this transistor!

slow('hbt_beta', 3, 4, 273.94, hbt_beta, TARGET=MEMORY,
     CRIT='memf hazard2 memp')

slow('hbt_beta_hi', 10000, 10000, 273.94, hbt_beta, TARGET=MEMORY,
     CRIT='memp hazard2')

slow('hbt_br_lo', 8, 9, 123.13, hbt_beta_reverse, TARGET=MEMORY, CRIT='memw')

slow('hbt_br_hi', 10000, 10000, 123.13, hbt_beta_reverse, TARGET=MEMORY,
     CRIT='memp hazard2')

slow('hbt_cap', 104, 103, 1, hbt_cap_scale, TARGET=MEMORY, FACTOR=0.1,
     CRIT='hazard2 mem')

##################### RESISTORS ##########################

fast('rstrong_lo', 113, 114, 820, lambda v: resistors(rstrong=v), CRIT='mem')
slow('rstrong_hi', 444, 443, 820, lambda v: resistors(rstrong=v), FACTOR=10,
     CRIT='mem')

slow('rload_hi', 731, 730, 2490, lambda v: resistors(rload=v), FACTOR=10,
     CRIT='mem')

fast('rload_hi_fast', 2534, 2533, 2490, lambda v: resistors(rload=v),
     CRIT='memp hazard2')

fast('rload_lo', 651, 652, 2490, lambda v: resistors(rload=v), CRIT='mem memp')

fast('rpull_lo', 530, 531, 22e3, lambda v: resistors(rpull=v), FACTOR=10,
     CRIT='call')

# [Logic is passing at quite high]
slow('rpull_hi', 65, 64, 22e3, lambda v: resistors(rpull=v), FACTOR=1000,
     CRIT='memw memf')

######################### MOSFETS #################################

slow('nmos_vto_lo', 520, 521, 0.9, nmos_vto, FACTOR=1e-3, CRIT='call inc')

# +0.2 : 1112,3
slow('nmos_vto_hi', 1287, 1286, 0.9, nmos_vto, FACTOR=1e-3,
     BIAS_POT=DEFAULT_BIAS_POT+0.6, CRIT='memp hazard2')

slow('pmos_vto_hi', 1772, 1771, 0.9, pmos_vto, FACTOR=1e-3,
     CRIT='memp hazard2')

slow('pmos_vto_lo', 107, 108, 0.9, pmos_vto, FACTOR=1e-3,
     CRIT='call inc romdecode ramdecode')

# FIXME - nmos cap scaling.

################################# EXTRAS #######################
# Reset timing on testadd: 3595n minimum (what cycle?)
#scan(0, 3 * Q, 2 * Q, lambda v: speed(tr=v),
#     TARGET='test/add.verify', NAME='Reset')

################# LOGIC SPEED #################
scan('speedl_logic', 1753, 1754, 2000, speed, TARGET=LOGIC, CRIT='cmp')

scan('speedl_duty1', 709, 710, Q / 2 - 10, lambda v: speed(Q, Q - v - 20),
     TARGET=LOGIC, CRIT='call')

scan('speedl_duty0', 665, 666, Q / 2 - 10, lambda v: speed(Q, v), TARGET=LOGIC,
     CRIT='inc')

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
