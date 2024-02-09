#!/usr/bin/python3

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
    replace_line('subckt/PDTC124TU.prm', 'R 20 2', f'R 20 2 {b}k\n')

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

def scan(LO, HI, ORIG, MUNGE, NAME, TARGET='verify', FACTOR=1, SPEED=None,
         WANTED=None, BIAS_POT=None):
    if WANTED is None:
        WANTED = wanted(NAME)
    if not WANTED:
        print('Ignore', NAME)
        return
    print('=== START', NAME, '===', flush=True)
    if SPEED is not None:
        change_speed(SPEED)
    if BIAS_POT is not None:
        bias_pot(BIAS_POT)
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
    print('=== RESULT', NAME, '===')
    results.sort()
    for _, L in results:
        print(L)
    print('===')
    change_speed(Q)
    if BIAS_POT is not None:
        bias_pot(2)

def dram_cap_scan(LOW, HIGH, SPEED=4000, **kwargs):
    scan(LOW, HIGH, 680, lambda v: replace_caps(['gates/drambyte.sch'], v),
         SPEED=SPEED, **kwargs)

def wanted(NAME):
    return False
    #return True

# 1912 fails memp, 1913 pass.
scan(1911, 1914, 2000, change_speed, NAME='speed')

# 853 passes, 852 fails hazard2.
scan(851, 854, Q / 2 - 10, lambda v: change_speed(Q, Q - v - 20),
     NAME='speed_duty1')
# Passes 944, fails 943 (memp) @ 2µ
scan(942, 945, Q / 2 - 10, lambda v: change_speed(Q, v),
     NAME='speed_duty0')

# 2.741 passes, 2.742 fails memf.
scan(2743, 2740, 2, bias_pot, FACTOR=1e-3, NAME='bias_pot_hi')

# 1.892 passes, 1.891 fails memp.
scan(1890, 1893, 2, bias_pot, FACTOR=1e-3, NAME='bias_pot_lo')

# 275 passes, 274 fails memp
scan(273, 276, 820, rbias, SPEED=4000, NAME='bias_r_lo')
# 1552 passes, ???? fails.  (@2.5v pot, 3299passes?)  FIXME
scan(1615, 1551, 820, rbias, SPEED=4000, NAME='bias_r_hi', WANTED=True)

# @2.5v pot, ???
# @2v pot, 104 passes, 103 fails hazard2.
dram_cap_scan(102, 105, SPEED=4000, NAME='dram_cap_lo')
# @3µs, ??? passes, 2465 fails memf
dram_cap_scan(244, 247, FACTOR=10, SPEED=3000, NAME='dram_cap_hi', WANTED=True)
# 987 fails hazard2 @ 2µs.
dram_cap_scan(988, 980, SPEED=2000, NAME='dram cap_hi_fast', WANTED=True)
# FIXME - dram cap lo full speed.

# FIXME - npn beta.

# Pass at 1.03, 1.02 fails call.  FIXME
# 1.19 fails call & inc.
scan(118, 150, 20.09, npn22_beta_reverse, FACTOR=0.01, SPEED=4000,
     NAME='rnpn_br', WANTED=True)
# 10001 passes.
scan(10001, 9999, 20.09, npn22_beta_reverse, SPEED=4000, NAME='rnpn_br_hi')

scan(1, 220, 22, npn22_r, FACTOR=0.1, SPEED=4000, NAME='rnpn_r_lo', WANTED=True)
scan(2000, 220, 22, npn22_r, FACTOR=0.1, SPEED=4000, NAME='rnpn_r_hi', WANTED=True)

# 23 passes, 22 fails (memw)
scan(21, 24, 291, npn22_beta, SPEED=4000, NAME='rnpn_beta_lo')

scan(10001, 9999, 291, npn22_beta, SPEED=4000, NAME='rnpn_beta_hi')

# 21 passes.  FIXME
scan(1, 22, 273.94, hbt_beta, SPEED=4000, NAME='hbt_beta', WANTED=True)

# 10000 passes.
scan(10001, 9999, 273.94, hbt_beta, SPEED=4000, NAME='hbt_beta_hi')

# 9 passes, 8 fails memw.
scan(7, 10, 123.13, hbt_beta_reverse, SPEED=4000, NAME='hbt_br_lo')

# 10000 passes.
scan(10001, 9999, 123.13, hbt_beta_reverse, SPEED=4000, NAME='hbt_br_hi')

# @22k pull resistor, 108 fails hazard2, 107 passes hazard2.
# Setting the pull resistor to 10k gets: Failing mem at 94, passes mem 93.
scan(95, 92, 10, hbt_cap_scale, SPEED=4000, NAME='hbt_cap')

# Reset timing on testadd: 3595n minimum (what cycle?)
#scan(0, 3 * Q, 2 * Q, lambda v: change_speed(tr=v),
#     TARGET='test/testadd.verify', NAME='Reset')

# 78 fails FIXME
scan(77, 85, 820, lambda v: resistors(rstrong=v), NAME='rstrong_lo')
# 3954 passes FIXME
scan(457, 393, 820, lambda v: resistors(rstrong=v), FACTOR=10, SPEED=4000,
     NAME='rstrong_hi', WANTED=True)

# @ 4µs, 7355 passes.
scan(742, 734, 2490, lambda v: resistors(rload=v), SPEED=4000, FACTOR=10,
     NAME='rload_hi', WANTED=True)
# @ 2µ passes 2690 FIXME.
scan(2705, 2689, 2490, lambda v: resistors(rload=v), NAME='rload_hi_fast', WANTED=True)
# 577 fails mem.  FIXME.
scan(576, 592, 2490, lambda v: resistors(rload=v), NAME='rload_lo', WANTED=True)

# 452 fails (call, inc).
scan(451, 459, 0.9, nmos_vto, FACTOR=1e-3, SPEED=4000, NAME='nmos_vto_LO', WANTED=True)
# 1.018 passes FIXME
scan(1033, 1017, 0.9, nmos_vto, FACTOR=1e-3, SPEED=4000, NAME='nmos_vto_hi')
# With 2.5V bias pot... 1.242 passes, 1.243 fails on hazard2.
#scan(1244, 1241, 0.9, nmos_vto, FACTOR=1e-3, SPEED=4000, NAME='NMOS VTO HI')
# 3V bias pot, passes 1.452, fails 1.453 (hazard2).
#scan(1454, 1451, 0.9, nmos_vto, FACTOR=1e-3, SPEED=4000, NAME='NMOS VTO HI')

# Passes 1.769 (memp). FIXME
scan(1782, 1768, 0.9, pmos_vto, FACTOR=1e-3, SPEED=4000, NAME='pmos_vto_hi', WANTED=True)
# Passes 0.149, . FIXME.
scan(150, 142, 0.9, pmos_vto, FACTOR=1e-3, SPEED=4000, NAME='pmos_vto_lo')
