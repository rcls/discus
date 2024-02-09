#!/usr/bin/python3

import argparse
import re
import subprocess
import sys
# import types

parser = argparse.ArgumentParser()
parser.add_argument('-r', '--recheck', action='store_true',
                    help='recheck settled tests')
parser.add_argument('-c', '--critical', action='store_true',
                    help='use critical target if known')
parser.add_argument('-n', '--dry-run', action='store_true', help='run none')
parser.add_argument('wanted', nargs='*', help='tests to run')
args = parser.parse_args()

Q=2000
currentQ = 2000
LOGIC = 'add call cmp inc logic sub'
MEMORY = 'hazard hazard2 mem memi memf memp memw'

BIAS_POT=2

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

def wanted(NAME, NORMAL):
    if len(args.wanted) == 0 and NORMAL is not False:
        return True
    for P in args.wanted:
        if NAME == P or NAME.startswith(P + '_'):
            return True
    if len(args.wanted) > 0:
        return False
    #return NORMAL is not False
    return NORMAL

def slurppath(P):
    with open(P) as F:
        return list(F)

def writepath(P, lines):
    with open(P, 'w') as F:
        F.writelines(lines)

def dram_cap(pf):
    P = 'gates/drambyte.sch'
    if pf is None:
        pf = 680
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

def bias_pot(volts):
    if volts == None:
        volts = BIAS_POT
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

def rbias(ohms):
    if ohms is None:
        ohms = 680
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

def npn22_beta_reverse(br):
    replace_line('subckt/PDTC124TU.prm', '+ BR = ', f'+ BR = {br}\n')

def npn22_beta(b):
    replace_line('subckt/PDTC124TU.prm', '+ BF = ', f'+ BF = {b}\n')

def npn22_r(r):
    replace_line('subckt/PDTC124TU.prm', 'R 20 2', f'R 20 2 {r}k\n')

def hbt_beta(b):
    replace_line('subckt/2SC4774.prm', '+ BF=', f'+ BF={b}\n')

def hbt_beta_reverse(b):
    replace_line('subckt/2SC4774.prm', '+ BR=', f'+ BR={b}\n')

def hbt_cap_scale(f):
    if f == 10:
        CJE = '2.4548E-12'
        CJC = '1.3066E-12'
    else:
        CJE = 2.4548E-12 * f / 10
        CJC = 1.3066E-12 * f / 10
    replace_line('subckt/2SC4774.prm', '+ CJE=', f'+ CJE={CJE}\n')
    replace_line('subckt/2SC4774.prm', '+ CJC=', f'+ CJC={CJC}\n')


def nmos_vto(VTO):
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

def pmos_vto(VTO):
    # Original line is:
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
         SPEED=None, NORMAL=None, BIAS_POT=None, RBIAS=None, CRIT=None):
    assert type(NAME) == str
    if BAD < GOOD:
        BAD -= 1
        GOOD += 1
    else:
        BAD += 1
        GOOD -= 1
    print('RANGE', NAME, BAD, GOOD)
    if not wanted(NAME, NORMAL):
        print('Ignore', NAME)
        return
    if NORMAL is not True and not args.recheck and abs(GOOD - BAD) <= 3:
        print('=== SETTLED', NAME)
        return
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
        bias_pot(BIAS_POT)
        MUNGE(V)
        status = subprocess.call(['make', '-j8', '-k', f'QUANTUM={currentQ}']
                                 + TARGET)
        res = f'=== Value {V:g} gives status {status}'
        results.append((V, res))
        print(res, flush=True)
        if status == 0:
            GOOD = MID
        else:
            BAD = MID
    MUNGE(ORIG)
    print('=== RESULT', NAME, '===')
    results.sort()
    for _, L in results:
        print(L)
    print('===')
    speed()
    if BIAS_POT is not None:
        bias_pot(None)
    if RBIAS is not None:
        rbias(None)

##################### SPEED ########################
# 1912 fails memp, 1913 pass.
scan('speed', 1912, 1913, 2000, speed, CRIT=MEMORY)

# 853 passes, 852 fails hazard2.
scan('speed_duty1', 852, 853, Q / 2 - 10, lambda v: speed(Q, Q - v - 20))
# Passes 944, fails 943 (memp) @ 2µ
scan('speed_duty0', 943, 944, Q / 2 - 10, lambda v: speed(Q, v))

##################### DRAM BIAS AND CAP ######################

# 2.741 passes, 2.742 fails memf.
scan('bias_pot_hi', 2742, 2741, None, bias_pot, FACTOR=1e-3, TARGET=MEMORY)

# 1.892 passes, 1.891 fails memp.
scan('bias_pot_lo', 1891, 1892, None, bias_pot, FACTOR=1e-3, TARGET=MEMORY)

# 275 passes, 274 fails memp
slow('bias_r_lo', 274, 275, 820, rbias, TARGET=MEMORY)
# Done at fast, wide margin at slow!
# 1220 passes, 1230 fails memp.
fast('bias_r_hi', 123, 122, 820, rbias, FACTOR=10, TARGET=MEMORY)

# @2v pot, 104 passes, 103 fails hazard2.
slow('dram_cap_lo', 103, 104, None, dram_cap, TARGET=MEMORY)
# @3µs, 1600 passes, 2360 fails memf
# FIXME - change to 4000µs.
# Passes 1820, fails 1830 (memf)
scan('dram_cap_hi', 183, 182, None, dram_cap, FACTOR=10, SPEED=3000,
     TARGET=MEMORY)
# 861 passes, 862 fails hazard2 @ 2µs.
fast('dram_cap_hi_fast', 862, 861, None, dram_cap, TARGET=MEMORY)
# FIXME - dram cap lo full speed.

####################### PRE-BIAS NPN ##############################
# FIXME - npn beta.

# 2.3k passes, 2.2k fails inc.
slow('rnpn_r_lo', 22, 23, 22, npn22_r, FACTOR=0.1, TARGET=LOGIC)
# 86.6k fails call, 86.2k passes.
slow('rnpn_r_hi', 87, 86, 22, npn22_r, TARGET=LOGIC)

# 23 passes, 22 fails (memw)
slow('rnpn_beta_lo', 22, 23, 291, npn22_beta, TARGET=LOGIC)

slow('rnpn_beta_hi', 10000, 10000, 291, npn22_beta, TARGET=LOGIC)

# 1.29 passes, 1.28 fails call.
slow('rnpn_br', 128, 129, 20.09, npn22_beta_reverse, FACTOR=0.01)
# 10000 passes.
slow('rnpn_br_hi', 10000, 10000, 20.09, npn22_beta_reverse)

########################## HBT ###########################

# FIXME - can we flip this transistor!

# 4 passes, 3 fails memf, hazard2, memp.
slow('hbt_beta', 3, 4, 273.94, hbt_beta, TARGET=MEMORY)

# 10000 passes.
slow('hbt_beta_hi', 10000, 10000, 273.94, hbt_beta, TARGET=MEMORY)

# 9 passes, 8 fails memw.
slow('hbt_br_lo', 8, 9, 123.13, hbt_beta_reverse, TARGET=MEMORY)

# 10000 passes.
slow('hbt_br_hi', 10000, 10000, 123.13, hbt_beta_reverse, TARGET=MEMORY)

# @22k pull resistor, 108 fails hazard2, 107 passes hazard2.
# Setting the pull resistor to 10k gets: Failing mem at 94, passes mem 93.
# FIXME RECHECK.
slow('hbt_cap', 108, 107, 10, hbt_cap_scale, TARGET=MEMORY)


##################### RESISTORS ##########################

# 113 fails mem. 114 passes.
fast('rstrong_lo', 113, 114, 820, lambda v: resistors(rstrong=v), CRIT=MEMORY)
# 3954 passes.
slow('rstrong_hi', 456, 394, 820, lambda v: resistors(rstrong=v), FACTOR=10)

# @ 4µs, 7355 passes.
slow('rload_hi', 741, 735, 2490, lambda v: resistors(rload=v))
# @ 2µ passes 2690.
fast('rload_hi_fast', 2704, 2690, 2490, lambda v: resistors(rload=v))
# 577 fails mem.
FAST('rload_lo', 577, 591, 2490, lambda v: resistors(rload=v), CRIT=MEMORY)

fast('rpull_lo', 1, 22, 22, lambda v: resistors(rpull=v))
slow('rpull_hi', 400, 22, 22, lambda v: resistors(rpull=v))

######################### MOSFETS #################################

# 452 fails (call, inc).
slow('nmos_vto_lo', 452, 458, 0.9, nmos_vto, FACTOR=1e-3)
# 1.018 passes
slow('nmos_vto_hi', 1032, 1018, 0.9, nmos_vto, FACTOR=1e-3)
# With 2.5V bias pot... 1.242 passes, 1.243 fails on hazard2.
#slow(1244, 1241, 0.9, nmos_vto, FACTOR=1e-3, NAME='NMOS VTO HI')
# 3V bias pot, passes 1.452, fails 1.453 (hazard2).
#slow(1454, 1451, 0.9, nmos_vto, FACTOR=1e-3, NAME='NMOS VTO HI')

# Passes 1.769 (memp). FIXME
slow('pmos_vto_hi', 1781, 1769, 0.9, pmos_vto, FACTOR=1e-3)
# Passes 0.149, . FIXME.
slow('pmos_vto_lo', 149, 143, 0.9, pmos_vto, FACTOR=1e-3)

# FIXME - nmos cap scaling.

################################# EXTRAS #######################
# Reset timing on testadd: 3595n minimum (what cycle?)
#scan(0, 3 * Q, 2 * Q, lambda v: speed(tr=v),
#     TARGET='test/testadd.verify', NAME='Reset')

################# LOGIC SPEED #################
scan('speedl_logic', 1000, 2000, 2000, speed, TARGET=LOGIC)

# FIXME
scan('speedl_duty1', 1, 854, Q / 2 - 10, lambda v: speed(Q, Q - v - 20),
     TARGET=LOGIC, NORMAL=False)
# FIXME
scan('speedl_duty0', 1, 945, Q / 2 - 10, lambda v: speed(Q, v), TARGET=LOGIC,
     NORMAL=False)

################# OPTIMAL DRAM BIAS ==================
scan('midpot_bias_r_hi', 300, 121, None, rbias, FACTOR=10, SPEED=2000,
     TARGET=MEMORY, NORMAL=False, BIAS_POT=2.3)
