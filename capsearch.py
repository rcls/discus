#!/usr/bin/python3

import inspect
import re
import subprocess
import types

Q=2000
currentQ = 2000

def slurppath(P):
    with open(P) as F:
        return list(F)

def writepath(P, lines):
    with open(P, 'w') as F:
        F.writelines(lines)

def replace_cap(L, pf):
    if L.startswith('value=') and L.strip().endswith('p'):
        return f'value={pf}p\n'
    else:
        return L

def replace_caps(paths, pf):
    for P in paths:
        writepath(P, (replace_cap(L, pf) for L in slurppath(P)))

def change_speed(vt=Q, t0=None, tr=None):
    global currentQ
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
    with open('subckt/bias-pot.prm', 'w') as F:
        F.write(f'''.subckt bias_pot gnd vdd set
                Vbias 1 gnd DC {volts:g}
                Rout 1 set 1k
                Rload 1 vdd 1k
                .ends''')

def resistors(rload=2490, rstrong=820, rpull=22e3):
    rload = rload * 1e-3
    rpull = rpull * 1e-3
    with open('subckt/resistor-load.prm', 'w') as F:
        F.write(f'.MODEL rload R (R={rload:g}k)\n')
        F.write(f'.MODEL rstrong R (R={rstrong:g})\n')
        F.write(f'.MODEL rpull R (R={rpull:g}k)\n')

def rbias(ohms):
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

def scan(LO, HI, ORIG, MUNGE, TARGET='verify', FACTOR=1, SPEED=None, NAME=None,
         WANTED=None):
    if NAME is None:
        NAME = inspect.stack()[1].function
    if WANTED is None:
        WANTED = wanted(NAME)
    if not WANTED:
        print('Ignore', NAME)
        return
    print('=== Value Scan Start', NAME, '===', flush=True)
    if SPEED is not None:
        change_speed(SPEED)
    # Allow good < bad ordering.
    if LO > HI:
        LO = -LO
        HI = -HI
        FACTOR = -FACTOR
    results = []
    while LO + 1 < HI:
        MID = LO + (HI - LO) // 2
        V = MID * FACTOR
        print(f'=== Try {V:g} ===', flush=True)
        MUNGE(V)
        status = subprocess.call(['make', '-j8', '-k', f'QUANTUM={currentQ}']
                                 + TARGET.split())
        res = f'=== Value {V:g} gives status {status}'
        results.append((V, res))
        print(res, flush=True)
        if status == 0:
            HI = MID
        else:
            LO = MID
    MUNGE(ORIG)
    print('=== Scan Result', NAME, '===')
    results.sort()
    for _, L in results:
        print(L)
    change_speed(Q)

def dram_cap_scan(LOW, HIGH, SPEED=4000, **kwargs):
    scan(LOW, HIGH, 680, lambda v: replace_caps(['gates/drambyte.sch'], v),
         SPEED=SPEED, **kwargs)

def wanted(NAME):
    return False

# Currently at 1912 fail memp, 1913 pass.
scan(1911, 1914, 2000, change_speed, NAME='Speed')

# Currently 855 passes, 854 fails hazard2.
# 852 pass, 851 fails hazard2.
scan(850, 853, Q / 2 - 10, lambda v: change_speed(Q, Q - v - 20), NAME='Duty1')
# Passes 944, fails 943 (memp) @ 2µ
scan(942, 945, Q / 2 - 10, lambda v: change_speed(Q, v), NAME='Duty0' TARGET='test/memp.verify')

# 2.757 passes, 2.758 fails.
scan(2759, 2756, 2, bias_pot, FACTOR=1e-3, NAME='Bias pot hi')

# 1.893 fails, 1894 passes [memp]
scan(1892, 1895, 2, bias_pot, FACTOR=1e-3, NAME='Bias pot lo')

# 275 passes, 274 fails memp.
scan(271, 275, 820, rbias, SPEED=4000, NAME='rbias')
# 1522 passes, 1523 fails.  (@2.5v pot, 3299passes?)
scan(1524, 1521, 820, rbias, SPEED=4000, NAME='rbias')

# @2.5v pot, ???
# @2v pot, 103 fails, 104 passes, hazard2 is critical.
dram_cap_scan(102, 105, SPEED=4000, NAME='dram cap lo')
# @3µs, 2465 passes, 2466 fails hazard2
dram_cap_scan(2467, 2464, SPEED=3000, NAME='dram cap hi')
# 989 fails hazard2, 988 passes @ 2µs.
dram_cap_scan(991, 986, SPEED=2000, NAME='dram cap hi full speed')
# FIXME - dram cap lo full speed.

# Pass at 1.03, 1.02 fails call.
scan(100, 120, 20.09, npn22_beta_reverse, FACTOR=0.01, SPEED=4000, NAME='NPNR BR')
# 10001 passes.
scan(10001, 9999, 20.09, npn22_beta_reverse, SPEED=4000, NAME='NPNR BR HI')

# 23 passes, 22 fails (memw)
scan(21, 24, 291, npn22_beta, SPEED=4000, NAME='NPNR BF')

scan(10001, 9999, 291, npn22_beta, SPEED=4000, NAME='NPNR BF HI')

# 22 passes, 21 fails call.
scan(20, 24, 273.94, hbt_beta, SPEED=4000, NAME='HBT BETA')

# 10000 passes.
scan(10001, 9999, 273.94, hbt_beta, SPEED=4000, NAME='HBT BETA HI')

# 9 passes, 8 fails memw.
scan(7, 10, 123.13, hbt_beta_reverse, SPEED=4000, NAME='HBT BR')

# 10000 passes.
scan(10001, 9999, 123.13, hbt_beta_reverse, SPEED=4000, NAME='HBT BR HI')

# @22k pull resistor, 108 fails hazard2, 107 passes hazard2.
# Setting the pull resistor to 10k gets: Failing mem at 94, passes mem 93.
scan(95, 92, 10, hbt_cap_scale, SPEED=4000, NAME='HBT CAP')

# Reset timing on testadd: 3595n minimum (what cycle?)
#scan(0, 3 * Q, 2 * Q, lambda v: change_speed(tr=v),
#     TARGET='test/testadd.verify', NAME='Reset')

# 78 passes @ 2µ, 77 fails hazard2
scan(76, 79, 820, lambda v: resistors(rstrong=v), NAME='rstrong')
# 3953 fail (memp) @4µs, 3952 pass.
scan(3955, 3946, 820, lambda v: resistors(rstrong=v), SPEED=4000,
     NAME='rstrong hi')

# Fails at 7355, 4µs (inc), 7354 passes.
scan(7356, 7353, 2490, lambda v: resistors(rload=v), SPEED=4000)
# @ 2µs fails 2690 (hazard2) passes 2689.
scan(2691, 2688, 2490, lambda v: resistors(rload=v), NAME='rload')
# 577 passes, 576 fails memp.
scan(575, 578, 2490, lambda v: resistors(rload=v), NAME='rload')

# 451 fails (hazard2), 452 passes.
scan(450, 453, 0.9, nmos_vto, FACTOR=1e-3, SPEED=4000, NAME='NMOS VTO LO')
# 1.018 fails memw, 1.017 passes
scan(1019, 1016, 0.9, nmos_vto, FACTOR=1e-3, SPEED=4000, NAME='NMOS VTO HI')
# With 2.5V bias pot... 1.242 passes, 1.243 fails on hazard2.
#scan(1244, 1241, 0.9, nmos_vto, FACTOR=1e-3, SPEED=4000, NAME='NMOS VTO HI')
# 3V bias pot, passes 1.452, fails 1.453 (hazard2).
#scan(1454, 1451, 0.9, nmos_vto, FACTOR=1e-3, SPEED=4000, NAME='NMOS VTO HI')

# Passes 1.768, fails 1.769 (memp).
scan(1770, 1767, 0.9, pmos_vto, FACTOR=1e-3, SPEED=4000, NAME='PMOS VTO HI')
# Passes 0.15 fails 0.149 (romdecode).
scan(148, 151, 0.9, pmos_vto, FACTOR=1e-3, SPEED=4000, NAME='PMOS VTO LO')
