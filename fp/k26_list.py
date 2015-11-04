#!/usr/bin/python3

import re
import sys

def debug(*args, **kwargs):
    if False:
        print(*args, file=sys.stderr, **kwargs)

def verbose(*args, **kwargs):
    if True:
        print(*args, file=sys.stderr, **kwargs)

def remove_page(F):
    '''Remove page breaks'''
    for L in F:
        if 'K26 Sub-Family Reference Manual' in L:
            continue
        if re.match(r'\d+\s+Freescale', L):
            continue
        if re.match(r'Freescale.*\s+\d+$', L):
            continue
        if L.startswith('\f'):
            continue
        yield L.rstrip()

#
def pinout_section(F):
    IT = F
    for L in IT:
        if L.startswith('11.3.1 MK26'):
            break
    for L in IT:
        if L.startswith(' 169   169 144 144'):
            #yield L
            break
    for L in IT:
        if L.startswith(' 169   169 144 144') or L == ' CSP   BGA LQFP BGA':
            continue
        if L.startswith('11.3.2 MK26'):
            break
        if L:
            yield L

def word_cols(L):
    ''' Break the line into words.  Return a map of column->words.'''
    words = {}
    for I in re.finditer(r"\S+", L):
        words[I.start()] = I.group(0)
    return words

def combine(S,T):
    W = word_cols(S)
    for L in T:
        for c, w in word_cols(L).items():
            for offset in (0, -1, 1, 2):
                if c + offset in W:
                    c += offset
                    break
            W[c] += w
    return W

def combine_continuation(F):
    S = F.__next__()
    #print("Start::", S)
    T = []
    for L in F:
        if L.startswith('   '):
            #print("Append:", L)
            T.append(L)
        else:
            #print("Init:::", L)
            yield combine(S,T)
            S = L
            T = []
    yield combine(S,T)

def bga_only(F):
    for W in F:
        K = sorted(W.keys())
        if len(K) < 4 or W[K[3]] == '--':
            continue                    # Not BGA
        #if K[1] < 12:
        #    del(K[1])
        C = [ W[I] for I in K ]
        # ball, name, dflt fncs...
        yield C[3], C[4], C[5], C[6:]

IT = sys.stdin
IT = remove_page(IT)
IT = pinout_section(IT)
IT = combine_continuation(IT)
IT = bga_only(IT)

pin_funcs = {}
func_pins = {}

for ball, name, dflt, fncs in IT:
    pf = pin_funcs.setdefault(ball, set())
    for F in fncs:
        pf.add(F)
        func_pins.setdefault(F, set()).add(ball)

#want_all = set(F for F in func_pins.keys() if F.startswith('V'))

# Check for want_all pins with options....
#for F in want_all:
#    balls = func_pins[F]
#    for B in balls:
#        if len(pin_funcs[B]) != 1:
#               print(F, B, pin_funcs[B], file=sys.stderr)

def check_double_dict(PF, FP):
    for P, FF in PF.items():
        for F in FF:
            assert P in FP[F]

check_double_dict(pin_funcs, func_pins)
check_double_dict(func_pins, pin_funcs)

unassigned_pin_funcs = dict(pin_funcs)
unassigned_func_pins = dict(func_pins)
assigned_pin_funcs = {}
wanted = set()

def assign(P, F):
    debug('Assign', P, F)
    wanted.discard(F)
    assert not P in assigned_pin_funcs
    assigned_pin_funcs[P] = F
    for PP in unassigned_func_pins[F]:
        unassigned_pin_funcs[PP].remove(F)
    for FF in unassigned_pin_funcs[P]:
        unassigned_func_pins[FF].remove(P)
    del unassigned_pin_funcs[P]
    del unassigned_func_pins[F]

# Discard unassignables...
def discard(C):
    discard = list(X for X in C if not C[X])
    for X in discard:
        debug("Discard", X)
        del C[X]

def integrity_check():
    discard(unassigned_pin_funcs)
    discard(unassigned_func_pins)
    check_double_dict(unassigned_func_pins, unassigned_pin_funcs)
    check_double_dict(unassigned_pin_funcs, unassigned_func_pins)

# Assign fixed purpose pins.  If all the pins assigned to a function have only
# that function, then assign them all.
def assign_fixed_pins():
    for F, PP in sorted(func_pins.items()):
        if not PP:
            continue
        if not all(len(pin_funcs[P]) == 1 for P in PP):
            continue
        # Assign the function to all those pins...
        for P in sorted(PP):
            debug('Assign fixed', P, F)
            assigned_pin_funcs[P] = F
            del unassigned_pin_funcs[P]
        wanted.discard(F)
        del unassigned_func_pins[F]

#wanted.add('EZP_CS_b')
#wanted.add('CLKOUT')

# Nix USB_CLKIN and have UART4 flow control?

wanted_prefixes=('FB_', 'JTAG', 'EZP_CS', 'USB1', 'XTAL0', 'EXTAL0',
                 'UART4', 'SPI[02]', 'I2C[012]', 'CLKOUT')
wanted_prefixes=tuple(re.compile(M) for M in wanted_prefixes)
wanted_skip=('FB_A[0-9]', 'FB_TA_b$', 'USBx0_SOF', 'SPI0_PCS[^0]', 'SPI2_PCS0',
             'JTAG_TRST')
wanted_skip=tuple(re.compile(M) for M in wanted_skip)

def prefix_check(L):
    if any(re.match(M,L) for M in wanted_skip):
        debug("Skip", L)
        return False
    if any(P.match(L) for P in wanted_prefixes):
        debug("Want", L)
        return True
    debug("Defer", L)
    return False

for F in sorted(unassigned_func_pins):
    if prefix_check(F):
        wanted.add(F)

integrity_check()

debug("**** Fixed pin assignments ****")
assign_fixed_pins()

integrity_check()

# Assign unique pins.  If a pin<->func assignment is unique both ways, do it.
def assign_unique_pins():
    debug("**** Unique pin assignment ****")
    unique = []
    for P, FF in unassigned_pin_funcs.items():
        if len(FF) == 1:
            func = next(iter(FF))
            if len(unassigned_func_pins[func]) == 1:
                unique.append((P, func))
    for P, F in unique:
        assign(P, F)

def first(S):
    return iter(S).__next__()

def assign_wanted():
    debug("**** Wanted pin assignment ****")
    for F in sorted(wanted):
        if len(unassigned_func_pins[F]) == 1:
            assign(first(unassigned_func_pins[F]), F)

assign('A11', 'CLKOUT')
#assign('F2', 'UART5_RX')
#assign('F3', 'UART5_TX')
#assign('G4', 'UART5_RTS_b')
assign('G11', 'I2C0_SDA')
assign('G12', 'I2C0_SCL')
assign('L9', 'I2C2_SDA')

assign_wanted()
integrity_check()
assign_unique_pins()
integrity_check()
assign_wanted()
integrity_check()

for F, PP in unassigned_func_pins.items():
    if not F.startswith('PT'):
        continue
    if not any(FF in wanted for P in PP for FF in unassigned_pin_funcs[P]):
        wanted.add(F)

assign_wanted()
integrity_check()
assign_unique_pins()
integrity_check()

verbose("Unassigned pins", len(unassigned_pin_funcs))
verbose("Unassigned funcs", len(unassigned_func_pins))
verbose("Unassigned wanted", len(wanted))
for F in wanted:
    verbose("Pins for", F, ':', unassigned_func_pins[F])

letters = list(set(re.match(r'([A-Z]+)(\d+)$', P).group(1)
                   for P in assigned_pin_funcs))
letters.sort()
numbers = list(set(int(re.match(r'([A-Z]+)(\d+)$', P).group(2))
                   for P in assigned_pin_funcs))
numbers.sort()

html_classes={
    'FB'     : '{ background: #CFC }',
    'CLKOUT' : '{ background: #CFC }',
    'USB'  : '{ background: #FCF }',
    'V'    : '{ background: #FBB }',
    'VSS'  : '{ background: #CCC }',
    'XTAL' : '{ background: #CDF }',
    'ADC'  : '{ background: #CDF }',
    'DAC'  : '{ background: #CDF }',
    'SDHC' : '{ background: #FFC }',
    'SPI'  : '{ background: #DCF }',
    'UART' : '{ background: #DCF }',
    'I2C'  : '{ background: #DCF }',
    'JTAG' : '{ background: #FEC }',
    'RESET': '{ background: #FEC }',
    'EZP'  : '{ background: #FEC }'}

def gen_html():
    yield '<html>'
    yield '<head><title>Pinout Table</title></head>'
    yield "<style type='text/css'>"
    for K in html_classes:
        yield '.{0} {1}'.format(K, html_classes[K])
    yield '</style>'
    yield '<body>'
    yield '<table>'
    yield '<tr>'
    yield '<th />'
    for N in numbers:
        yield '<th>{0}</th>'.format(N)
    yield '</tr>'
    for L in letters:
        yield '<tr><th>{0}</th>'.format(L)
        for N in numbers:
            P = L + str(N)
            if not P in assigned_pin_funcs:
                yield '<td />'
                continue
            F = assigned_pin_funcs[P].split('/', 1)[0]
            best = 10000
            klass = 'NONE'
            for K in html_classes:
                p = F.find(K)
                if p >= 0 and (p < best or p == best and len(K) > len(klass)):
                    best = p
                    klass = K
            F = '<br />'.join(F.split('_', 1))
            yield "<td class='{0}'>{1}</td>".format(klass, F)
        yield '</tr>'
    yield '</table>'
    yield '</body></html>'

for H in gen_html():
    print(H)

#print(want_all)
#
#for F in sorted(funcs.keys()):
#    print(F,sorted(funcs[F]))