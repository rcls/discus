#!/usr/bin/python3

import argparse
import re
import subprocess
import sys
# import types

parser = argparse.ArgumentParser()
parser.add_argument('-g', '--good-check', action='store_true',
                    help='recheck good limit')
parser.add_argument('-b', '--bad-check', action='store_true',
                    help='recheck bad limit')
parser.add_argument('-x', '--extend', action='store_true',
                    help='extend range as needed')
parser.add_argument('-a', '--all', action='store_true',
                    help='use all targets not just critical')
parser.add_argument('-j', '--jobs', default='4',
                    help='number of jobs to run at once')
parser.add_argument('-r', '--reverse', action='store_true',
                    help='reverse sequence')
parser.add_argument('-z', '--zoom', default=1, type=int,
                    help='inspect in more detail')
parser.add_argument('-t', '--target', nargs='+', help='override target')
parser.add_argument('-v', '--value', type=int, help='test one value')
parser.add_argument('-n', '--dry-run', action='store_true', help='run none')
parser.add_argument('wanted', nargs='*', help='tests to run')
args = parser.parse_args()

if args.value is not None:
    args.good_check = True
    args.bad_check = True

Q=2000
currentQ = 2000
LOGIC = 'call cmp inc sub add logic'
MEMORY = 'memp mem memi memw hazard2 hazard memf'
HI_DELAY_RES = 1680

CHANGED=0
SCANS=[]

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

def dram_cap(pf=470):
    replace_line('gates/drambyte.sch', 'value=', f'value={pf}p\n',
                 after='refdes=C')

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
                l = f'value=pulse 0 2.5v {tr}n 10n 10n 9 10\n'
            F.write(l)
    currentQ = vt

def rload(v=2490):
    # Keep rpull ratiometric.
    rl = v * 1e-3
    rp = v * 10 / 2490
    replace_line('subckt/resistor-load.prm', '.MODEL rload R',
                 f'.MODEL rload R (R={rl:g}k)\n')
    replace_line('subckt/resistor-load.prm', '.MODEL rpull R',
                 f'.MODEL rpull R (R={rp:g}k)\n')

def rstrong(v=820):
    replace_line('subckt/resistor-load.prm', '.MODEL rstrong R',
                 f'.MODEL rstrong R (R={v:g})\n')

def rpull(v=10000):
    rp = v * 1e-3
    replace_line('subckt/resistor-load.prm', '.MODEL rpull R',
                 f'.MODEL rpull R (R={rp:g}k)\n')

def replace_line(path, start, replace, after=None):
    lines = slurppath(path)
    armed = False
    with open(path, 'w') as F:
        for l in lines:
            if after is None or l.startswith(after):
                armed = True
            if armed and l.startswith(start):
                l = replace
                armed = False
            F.write(l)

def npn_beta(b=272):
    replace_line('subckt/BC847BW.prm', '+ BF = ', f'+ BF = {b}\n')

def npn22_beta_reverse(br=20.09):
    replace_line('subckt/PDTC124TU.prm', '+ BR = ', f'+ BR = {br}\n')

def npn22_beta(b=291):
    replace_line('subckt/PDTC124TU.prm', '+ BF = ', f'+ BF = {b}\n')

def npn22_r(r=22):
    replace_line('subckt/PDTC124TU.prm', 'R 20 2', f'R 20 2 {r}k\n')

def jfet_vto(VTO=2.65):
    replace_line('subckt/J309.prm', '+ VTO=', f'+ VTO=-{VTO}\n')

def jfet_beta(BETA=0.00272):
    replace_line('subckt/J309.prm', '+ BETA=', f'+ BETA={BETA*1e3}m\n')

def delay_res(res=840):
    replace_line('board/dram32byte.sch', 'value=', f'value={res}\n',
                 after='refdes=Rd')

def bias_res(res=2490):
    replace_line('gates/dramio.sch', 'value=', f'value={res}\n',
                 after='refdes=Rb')

def schottky_is(v=None):
    if v is None:
        v = '8.361E-09'
    else:
        v = f'{v}n'
    replace_line('subckt/RB751S40.prm', '+ IS =', f'+ IS = {v}\n')

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

def slow(*args, EXTRA=[], **kwargs):
    scan(*args, **kwargs, EXTRA = EXTRA + [(speed, 4000)])

def fast(*args, EXTRA=[], **kwargs):
    scan(*args, **kwargs, EXTRA = EXTRA + [(speed, 2000)])

def scan(NAME, BAD, GOOD, MUNGE, **kwargs):
    bg = BadGood(NAME, BAD, GOOD, MUNGE, **kwargs)
    if wanted(NAME, bg.WANTED):
        SCANS.append(bg)

class BadGood:
    def __init__(self, NAME, BAD, GOOD, MUNGE, FACTOR=1, TARGET='verify',
                 CRIT=None, EXTRA=[], WANTED=None):
        self.NAME = NAME
        self.BAD = BAD if BAD is None else BAD * args.zoom
        self.GOOD = GOOD if GOOD is None else GOOD * args.zoom
        self.I_BAD = self.BAD
        self.MUNGE = MUNGE
        self.EXTRA = EXTRA
        self.known = {}
        self.I_GOOD = self.GOOD
        self.FACTOR = FACTOR if args.zoom == 1 else FACTOR / args.zoom
        self.WANTED = WANTED
        self.results = []

        if args.value is not None:
            self.GOOD = args.value
            self.BAD = args.value

        if not args.all and CRIT != None:
            TARGET = CRIT
        self.TARGET = target_list(TARGET)

    def try_one(self, NUM):
        if NUM in self.known:
            return self.known[NUM]
        V = NUM * self.FACTOR
        print(f'=== Try  {V:g} [{NUM}]', flush=True)
        for f, v in self.EXTRA:
            f(v)
        self.MUNGE(V)
        status = subprocess.call(['make', '-j' + args.jobs, '-k',
                                  f'QUANTUM={currentQ}'] + self.TARGET)
        if status == 0:
            self.log(V, f'=== PASS {V:g} [{NUM}]')
            self.GOOD = NUM
        else:
            self.log(V, f'=== FAIL {V:g} [{NUM}] status {status}')
            self.BAD = NUM
        self.known[NUM] = (status == 0)
        return status == 0

    def log(self, V, text):
        self.results.append((V, text))
        print(text, flush=True)

    def gap(self):
        if self.BAD is None or self.GOOD is None:
            return 0
        return abs(self.BAD - self.GOOD)

    def scan(self):
        if not args.good_check and not args.bad_check and not args.extend \
            and self.gap() <= 1:
            print('=== SETTLED', self.NAME)
            return

        print(f'=== START {self.NAME} [{self.BAD} {self.GOOD}] ===', flush=True)
        if args.dry_run:
            return

        if args.bad_check and not args.good_check and self.BAD is not None:
            self.try_one(self.BAD)
        if (args.good_check or args.extend) and self.GOOD is not None:
            self.try_one(self.GOOD)
        if (args.bad_check or args.extend) and self.BAD is not None:
            self.try_one(self.BAD)

        if args.extend and self.I_BAD is not None and self.I_GOOD is not None \
            and self.I_BAD != self.I_GOOD:
            iters = 0
            if self.try_one((self.BAD + self.GOOD) // 2):
                while iters < 7 and self.try_one(self.BAD):
                    self.BAD += self.BAD - self.I_GOOD
                    iters += 1
            else:
                while iters < 7 and not self.try_one(self.GOOD):
                    self.GOOD += self.GOOD - self.I_BAD
                    iters += 1
            if iters >= 10:
                print('=== Failed to extend', flush=True)
                return

        if (not args.bad_check and not args.good_check) or args.extend:
            while self.gap() > 1:
                self.try_one((self.BAD + self.GOOD) // 2)

    def finish(self):
        self.MUNGE()
        for f, _ in self.EXTRA:
            f()

        if self.BAD != self.I_BAD or self.GOOD != self.I_GOOD:
            print(f'=== CHANGES! {self.NAME} [{self.BAD} {self.GOOD}]',
                  f'was [{self.I_BAD} {self.I_GOOD}] ===')
            global CHANGED
            CHANGED += 1
        else:
            print(f'=== CONFIRM {self.NAME} [{self.BAD} {self.GOOD}] ===')
        self.results.sort()
        for _, L in self.results:
            print(L)
        print('===')

##################### SPEED ########################

scan('speed_basic', 147, 148, speed, FACTOR=10, TARGET=MEMORY,
     CRIT='memp memi')

scan('speed_duty1', 51, 52,
     lambda v=None: speed() if v is None else speed(Q, Q - v - 20),
     TARGET=MEMORY, FACTOR=10, CRIT='memp memf')

scan('speed_duty0', 68, 69, lambda v=None: speed(t0=v), TARGET=MEMORY,
     FACTOR=10, CRIT='memp memw')

scan('speedl_logic', 165, 166, speed, FACTOR=10, TARGET=LOGIC, CRIT='cmp inc')

scan('speedl_duty1', 60, 61,
     lambda v=None: speed() if v is None else speed(Q, Q - v - 20),
     TARGET=LOGIC, CRIT='cmp inc', FACTOR=10)

scan('speedl_duty0', 63, 64, lambda v=None: speed(t0 = v), TARGET=LOGIC,
     CRIT='call inc', FACTOR=10)

##################### DRAM CAP ######################

fast('dram_cap_lo', 10, 11, dram_cap, TARGET=MEMORY, CRIT='hazard2 mem')

#scan('dram_cap_hi_slow', 32, 31, dram_cap, FACTOR=100,
#     TARGET=MEMORY, CRIT='mem memi', EXTRA=[(speed, 3000)])

fast('dram_cap_hi_fast', 196, 195, dram_cap, TARGET=MEMORY, FACTOR=10,
     CRIT='memi hazard2')

####################### JFET ##########################

# We can take this with a grain of salt, changing VTO without modifying β
# means we are dropping the Idss by a significant factor.
#
# Also, it's very sensitive to the clock delay, so move that out of the way.
fast('jfet_vto_lo', 54, 55, jfet_vto, TARGET=MEMORY, FACTOR=0.01,
     EXTRA=[(delay_res, HI_DELAY_RES)], CRIT='memw memf')

fast('jfet_vto_hi', 67, 66, jfet_vto, TARGET=MEMORY, FACTOR=0.1,
     CRIT='hazard2 mem')

fast('jfet_beta_lo', 1, 2, jfet_beta, TARGET=MEMORY, FACTOR=1e-4,
     CRIT='memp memi')

######################### NPN #################################

fast('npn_beta_lo', 2, 3, npn_beta, CRIT='call inc')

fast('npn_beta_hi', None, 10000, npn_beta, CRIT='call inc')

####################### PRE-BIAS NPN ##############################

fast('rnpn_r_lo', 47, 48, npn22_r, FACTOR=0.1, TARGET=LOGIC, CRIT='inc')

fast('rnpn_r_hi_fast', 54, 53, npn22_r, TARGET=LOGIC, CRIT='cmp inc')
slow('rnpn_r_hi_slow', 16, 15, npn22_r, FACTOR=10, TARGET=LOGIC, CRIT='call')

fast('rnpn_beta_lo', 20, 21, npn22_beta, CRIT='call memw')

fast('rnpn_beta_hi', None, 10000, npn22_beta, TARGET=LOGIC, CRIT='call inc')

fast('rnpn_br_lo', None, 1, npn22_beta_reverse, FACTOR=0.1, TARGET=LOGIC,
     CRIT='call inc')

fast('rnpn_br_hi', None, 10000, npn22_beta_reverse, TARGET=LOGIC,
     CRIT='call inc')

##################### RESISTORS ##########################

fast('rstrong_lo', 103, 104, rstrong, CRIT='call inc')

slow('rstrong_hi_slow', 33, 32, rstrong, FACTOR=100, CRIT='mem memp')

fast('rstrong_hi_fast', 143, 142, rstrong, FACTOR=10, CRIT='memi hazard')

slow('rload_hi_slow', 77, 76, rload, FACTOR=100, CRIT='call inc')

#fast('rload_hi_fast', 34, 35, rload, FACTOR=100, CRIT='call inc')

fast('rload_lo', 1, 2, rload, CRIT='call add', FACTOR=100)

fast('rpull_lo', 13, 14, rpull, FACTOR=100, CRIT='cmp hazard')
fast('rpull_hi', None, 1e5, rpull, CRIT='hazard memp')

fast('rbias_lo', None, 100, bias_res, TARGET=MEMORY, CRIT='hazard2 memf')
fast('rbias_hi', 6, 5, bias_res, FACTOR=1e4, TARGET=MEMORY,
     CRIT='hazard2 memf')

######################### MOSFETS #################################
# The clock delay in the DRAM is sensitive to the VTO.  We'll make that
# adjustable anyway, so raise it for this test.
fast('nmos_vto_lo', 452, 453, nmos_vto, FACTOR=1e-3, CRIT='cmp logic',
     EXTRA=[(delay_res, HI_DELAY_RES)])

slow('nmos_vto_hi_slow', 163, 162, nmos_vto, FACTOR=10e-3, CRIT='call inc')
fast('nmos_vto_hi_fast', 115, 114, nmos_vto, FACTOR=10e-3, CRIT='call inc')

fast('pmos_vto_hi_fast', 177, 176, pmos_vto, FACTOR=10e-3, CRIT='mem hazard2')

# The clock delay in the DRAM is sensitive to the VTO.  We'll make that
# adjustable anyway, so raise it for this test.
fast('pmos_vto_lo', 10, 11, pmos_vto, FACTOR=10e-3,
     EXTRA=[(delay_res, HI_DELAY_RES)], CRIT='memp romdecode')

################################# EXTRAS #######################

scan('reset_delay', 5058, 5057, lambda v=None: speed(tr=v), TARGET='hazard',
     WANTED=False)

scan('reset_advance', 3060, 3061, lambda v=None: speed(tr=v), TARGET='hazard',
     WANTED=False)

fast('rbiascap_lo', 12, 13, bias_res, FACTOR=100, TARGET=MEMORY,
     CRIT='mem memp', EXTRA=[(dram_cap, 16)], WANTED=False)

fast('rbiascap_hi', 34, 33, bias_res, FACTOR=100, TARGET=MEMORY,
     CRIT='mem memp', EXTRA=[(dram_cap, 16)], WANTED=False)

# Doesn't look like these buy us anything...
fast('schottky_is_lo', None, 1, schottky_is, CRIT='call inc', WANTED=False)
fast('schottky_is_hi', None, 1e4, schottky_is, CRIT='call inc', WANTED=False)

# cap=6.4, bias=1700, delay=840 passes. [9.5 passes bias 230 2390]
# cap=14.8, bias=3100,3200, delay=420 passes.

########################### RUN THE CHECKS ###########################
if args.reverse:
    SCANS.reverse()

for bg in SCANS:
    bg.scan()
    bg.finish()

if CHANGED != 0:
    print(f'=== Change count {CHANGED}', flush=True)
