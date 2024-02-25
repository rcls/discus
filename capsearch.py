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

def hbt_beta(b=273.94):
    replace_line('subckt/2SC4774.prm', '+ BF=', f'+ BF={b}\n')

def hbt_beta_reverse(b=123.13):
    replace_line('subckt/2SC4774.prm', '+ BR=', f'+ BR={b}\n')

def hbt_cap_c(c='1.3066E-12'):
    replace_line('subckt/2SC4774.prm', '+ CJC=', f'+ CJC={c}\n')

def hbt_cap_e(c='2.4548E-12'):
    replace_line('subckt/2SC4774.prm', '+ CJE=', f'+ CJE={c}\n')

def hbt_cap_scale(f=1):
    if f == 1:
        CJE = '2.4548E-12'
        CJC = '1.3066E-12'
    else:
        CJE = 2.4548E-12 * f
        CJC = 1.3066E-12 * f
    replace_line('subckt/2SC4774.prm', '+ CJE=', f'+ CJE={CJE}\n')
    replace_line('subckt/2SC4774.prm', '+ CJC=', f'+ CJC={CJC}\n')


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

def scan(NAME, BAD, GOOD, MUNGE, TARGET='verify', FACTOR=1,
         SPEED=None, WANTED=None, BIAS_POT=None, RBIAS=None, CRIT=None):
    assert MUNGE is not None
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

scan('speed_basic', 1893, 1894, speed, TARGET=MEMORY,
     CRIT='hazard2 memi memp')

scan('speed_duty1', 58, 59,
     lambda v=None: speed() if v is None else speed(Q, Q - v - 20),
     TARGET=MEMORY, FACTOR=10, CRIT='memp hazard2')

scan('speed_duty0', 935, 936,
     lambda v=None: speed() if v is None else speed(Q, v),
     TARGET=MEMORY, CRIT='memp hazard2')

scan('speedl_logic', 1759, 1760, speed, TARGET=LOGIC, CRIT='cmp inc')

scan('speedl_duty1', 59, 60,
     lambda v=None: speed() if v is None else speed(Q, Q - v - 20),
     TARGET=LOGIC, CRIT='call cmp inc', FACTOR=10)

scan('speedl_duty0', 67, 68,
     lambda v=None: speed() if v is None else speed(Q, v), TARGET=LOGIC,
     CRIT='call inc', FACTOR=10)

##################### DRAM CAP ######################

fast('bias_pot_hi', None, 300, bias_pot, FACTOR=10e-3, TARGET=MEMORY,
     CRIT='memp hazard hazard2')

# FIXME - change to 4000µs.
scan('dram_cap_hi_slow', 181, 180, dram_cap, FACTOR=10, SPEED=3000,
     TARGET=MEMORY, CRIT='mem memi')

fast('dram_cap_hi_fast', 118, 117, dram_cap, TARGET=MEMORY, FACTOR=10,
     CRIT='mem memf')

####################### JFET ##########################

# We can take this with a grain of salt, changing VTO without modifying β
# means we are dropping the Idss by a significant factor.
fast('jfet_vto_lo', 33, 34, jfet_vto, TARGET=MEMORY, FACTOR=0.01,
     CRIT='memf memw')

fast('jfet_vto_hi', 22, 21, jfet_vto, TARGET=MEMORY, FACTOR=0.1,
     CRIT='memp hazard2')

slow('bias_r_lo', 152, 153, rbias, TARGET=MEMORY, CRIT='memp hazard2')
# Done at fast, wide margin at slow!
fast('bias_r_hi', 197, 196, rbias, FACTOR=10, TARGET=MEMORY, CRIT='memp')

slow('dram_cap_lo', 165, 166, dram_cap, TARGET=MEMORY, CRIT='mem hazard2')

# FIXME - change to 4000µs.
scan('dram_cap_hi_slow', 332, 331, dram_cap, FACTOR=10, SPEED=3000,
     TARGET=MEMORY, CRIT='hazard2 mem')

fast('dram_cap_hi_fast', 165, 164, dram_cap, TARGET=MEMORY, FACTOR=10,
     CRIT='hazard2 memf')
# FIXME - dram cap lo full speed.

######################### NPN #################################

slow('npn_beta', 3, 4, npn_beta, CRIT='call inc')

# Capacitance scaling?

####################### PRE-BIAS NPN ##############################

slow('rnpn_r_lo', 22, 23, npn22_r, FACTOR=0.1, TARGET=LOGIC, CRIT='inc')

slow('rnpn_r_hi', 119, 118, npn22_r, TARGET=LOGIC, CRIT='call')

slow('rnpn_beta_lo', 22, 23, npn22_beta, CRIT='memw')

slow('rnpn_beta_hi', None, 10000, npn22_beta, TARGET=LOGIC, CRIT='call inc')

slow('rnpn_br_lo', 11, 12, npn22_beta_reverse, FACTOR=0.1,
     TARGET=LOGIC, CRIT='call')

slow('rnpn_br_hi', None, 10000, npn22_beta_reverse, TARGET=LOGIC,
     CRIT='call inc')

########################## HBT ###########################

slow('hbt_beta_lo', 29, 30, hbt_beta, TARGET=MEMORY, FACTOR=0.1,
     CRIT='memf hazard2')

slow('hbt_beta_hi', None, 10000, hbt_beta, TARGET=MEMORY, CRIT='memp hazard2')

slow('hbt_br_lo', 35, 36, hbt_beta_reverse, TARGET=MEMORY, FACTOR=0.1,
     CRIT='memw')

slow('hbt_br_hi', None, 10000, hbt_beta_reverse, TARGET=MEMORY,
     CRIT='memp hazard2')

# 1.3pF nominal.
slow('hbt_cap_c', 32, 31, hbt_cap_c, TARGET=MEMORY, FACTOR=1e-12,
     CRIT='mem memi')
# 2.5pF nominal.
slow('hbt_cap_e', 86, 85, hbt_cap_e, TARGET=MEMORY, FACTOR=1e-12,
     CRIT='mem hazard2')

##################### RESISTORS ##########################

fast('rstrong_lo', 100, 101, rstrong, CRIT='mem')

slow('rstrong_hi', 45, 44, rstrong, FACTOR=100, CRIT='mem')

slow('rload_hi_slow', 86, 85, rload, FACTOR=100, CRIT='mem hazard2 call')

fast('rload_hi_fast', 2795, 2794, rload, CRIT='memp hazard2')

fast('rload_lo', 65, 66, rload, CRIT='mem memp', FACTOR=10)

#fast('rpull_lo', 47, 48, rpull, FACTOR=100, TARGET=LOGIC, CRIT='call inc')
#fast('rpull_hi', None, 100e6, rpull, TARGET=LOGIC, CRIT='call inc')

fast('rmem_lo', 298, 299, rmem, TARGET=MEMORY, CRIT='hazard2 mem')

slow('rmem_hi', 60, 59, rmem, FACTOR=1000, TARGET=MEMORY,
     CRIT='memw memf')

######################### MOSFETS #################################
slow('nmos_vto_lo', 395, 396, nmos_vto, FACTOR=1e-3,
     CRIT='call inc', BIAS_POT=DEFAULT_BIAS_POT-0.2)

slow('nmos_vto_hi', 158, 157, nmos_vto, FACTOR=10e-3,
     BIAS_POT=DEFAULT_BIAS_POT+0.3, CRIT='memp hazard2')

slow('pmos_vto_hi', 229, 228, pmos_vto, FACTOR=10e-3,
     CRIT='memp hazard2 inc')

slow('pmos_vto_lo', 107, 108, pmos_vto, FACTOR=1e-3,
     CRIT='call inc romdecode ramdecode')

# FIXME - nmos cap scaling.

################################# EXTRAS #######################
# Reset timing on testadd: 3595n minimum (what cycle?)
#scan(0, 3 * Q, 2 * Q, lambda v: speed(tr=v),
#     TARGET='test/add.verify', NAME='Reset')
