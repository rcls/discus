#!/usr/bin/python3

import argparse
import bisect
import re
import sys

parser = argparse.ArgumentParser()
parser.add_argument('pinlist', help='Pin listing file')
parser.add_argument('input', help='Input .sch file')
parser.add_argument('-b', '--bank', help='Bank number')
parser.add_argument('-u', '--useless', help='Useless name components',
                    nargs='*', default=[])
args = parser.parse_args()

bank = args.bank
useless = [ re.compile(X) for X in args.useless ]

def bank_munge(name):
    # If the name ends with the bank, delete it.
    if name[-1] == bank:
        del name[-1]
    # If the name has a byte group, delete it.
    lnum = len(name) > 2 and re.match('L(\d+)[NP]$', name[1])
    tnum = len(name) > 2 and re.match('T(\d+)$', name[2])
    if lnum and tnum:
        assert int(tnum.group(1)) == (int(lnum.group(1)) - 1) // 6
        del name[2]
    # Remove 'IO'
    if name[0] == 'IO':
        del name[0]
    elif name[0].startswith('MGT'):
        name[0] = name[0][3:]
    name = [ X for X in name if not any(R.match(X) for R in useless) ]
    return name


PIN_NAMES={}
NAME_PINS={}
NAMES=[]

for L in open(args.pinlist):
    LL = L.strip().split()
    if len(LL) < 2:
        continue
    if not re.match('[A-Z]*\d+$', LL[0]):
        continue
    if bank and (len(LL) <= 3 or LL[3] != bank):
        continue
    pin = LL[0]
    name = LL[1]
    if bank:
        name = '_'.join(bank_munge(name.split('_')))
    PIN_NAMES[pin] = name
    NAME_PINS.setdefault(name,[]).append(pin)
    NAMES.append(name)

NAMES.sort()

def update_pin(pin,name):
    # If we have a pin number, just look it up.
    if pin != '0':
        if PIN_NAMES[pin].startswith(name) or name == 'unknown':
            return pin,PIN_NAMES[pin]
        else:
            return None, None
    # The pin should have a prefix in NAMES...
    i = bisect.bisect_left(NAMES, name)
    if i == len(NAMES):
        return None,None
    nn = NAMES[i]
    if nn.startswith(name) and NAME_PINS[nn]:
        return NAME_PINS[nn].pop(0), nn
    else:
        return None, None

def update_one_pin(F,H):
    LL = [H, next(F)]
    assert LL[1] == '{'
    ITEMS = {}
    for L in F:
        LL.append(L)
        if L == '}':
            break
        EQ = L.split('=', 1)
        if len(EQ) == 2:
            ITEMS[EQ[0]] = EQ[1]
    pin,name = update_pin(ITEMS['pinnumber'],ITEMS['pinlabel'])
    if pin is None:
        if ITEMS.get('comment', '') == 'optional':
            return
        raise RuntimeError(
            'Not found: ' + ITEMS['pinnumber'] + ' ' + ITEMS['pinlabel'])
    ITEMS['pinnumber'] = pin
    ITEMS['pinlabel'] = name
    for L in LL:
        EQ = L.split('=', 1)
        if len(EQ) == 2:
            yield EQ[0] + '=' + ITEMS[EQ[0]]
        else:
            yield L

def update_file(F):
    for L in F:
        if L.startswith('P '):
            yield from update_one_pin(F,L)
        elif L.startswith('comment='):
            yield L.replace('BANK',bank)
        else:
            yield L

for L in update_file(X.rstrip() for X in open(args.input)):
    print(L)
