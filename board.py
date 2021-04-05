#!/usr/bin/python3

import argparse
from more_itertools import peekable

parser = argparse.ArgumentParser()
parser.add_argument('src', help='Input schmatic')
parser.add_argument('dst', help='Output schematic')
parser.add_argument('-s', '--sym', help='Symbol file')
parser.add_argument('-c', '--conn', help='Connector', default='pci-edge-3v')
args = parser.parse_args()

def parseCP(IN, L):
    if IN.peek('') != '{':
        return L

    next(IN)

    # Only support T attrs in the braces...
    attrs = {}
    for T in IN:
        if T == '}':
            break
        assert T.startswith('T ')
        attr = next(IN)
        assert '=' in attr
        key, value = attr.split('=', 1)
        assert not key in attrs # We don't cope!
        attrs[key] = (T, value)
    return L, attrs

def parse(IN):
    lines = peekable(L.removesuffix('\n') for L in IN)
    for L in lines:
        if L.startswith('C ') or L.startswith('P '):
            yield parseCP(lines, L)
        else:
            yield L

def flatten(S):
    for L in S:
        if type(L) == str:
            yield L + '\n'
            continue
        C, attrs = L
        yield C + '\n'
        yield '{\n'
        for K, (T, V) in attrs.items():
            yield T + '\n'
            yield K + '=' + V + '\n'
        yield '}\n'

def build_pinmap(PATH):
    pins = {}
    pinnumbers = set()
    pinseqs = set()
    for I in parse(open(PATH)):
        if type(I) == str:
            continue
        L, attrs = I
        if not L.startswith('P '):
            continue
        _, pinlabel  = attrs['pinlabel']
        _, pinnumber = attrs['pinnumber']
        _, pinseq    = attrs['pinseq']
        #assert pinnumber == pinseq # We probably want to break this.
        assert not pinlabel in pins
        assert not pinnumber in pinnumbers, pinnumber
        assert not pinseq in pinseqs
        slot = pinnumber
        if slot.startswith('A'):
            slot = str(100 + int(pinnumber[1:]))
        elif slot.startswith('B'):
            slot = str(200 + int(pinnumber[1:]))
        else:
            print('Unassigned', pinlabel, pinnumber)
        pins[pinlabel] = slot, pinnumber
        pinnumbers.add(pinnumber)
        pinseqs.add(pinseq)
    return pins

# e.g., invisible: T 14600 300 5 10 0 1 0 1 1
#       visible:   T 14600 300 5 10 1 1 0 1 1
def invisible(L):
    W = L.split(' ')
    W[5] = '0'
    return ' '.join(W)

name_map = { 'ϕ': 'phi' }

def replace_in_out(pinmap, I):
    if type(I) == str:
        return I
    L, attrs = I
    if not L.startswith('C '):
        return L
    if L.endswith(' in-1.sym'):
        L = L.removesuffix(' in-1.sym') + ' connpin.sym'
    elif L.endswith(' out-1.sym'):
        L = L.removesuffix(' out-1.sym') + ' connpout.sym'
    else:
        return I
    footT, footprint = attrs['footprint']
    devT , device    = attrs['device']
    refT , refdes    = attrs['refdes']
    slot , pinname   = pinmap[refdes]
    net = name_map.get(refdes, refdes)
    return [L, {
        'footprint': [footT, args.conn],
        'slot'     : [devT , slot],
        'net'      : [refT, f'{net}:{pinname}'],
        'refdes'   : [invisible(refT), 'CMAIN']}]
#        'comment'  : [refT , net]}]


pinmap = build_pinmap(args.sym)
#print(pinmap)

IN = open(args.src)
OUT = open(args.dst, 'w')

parsed = parse(IN)

OUT.writelines(flatten(replace_in_out(pinmap, I) for I in parsed))

try:
    EXTRA = open(args.src.removesuffix('.sch') + '-extra.sch')
    next(EXTRA)
    OUT.writelines(EXTRA)
except FileNotFoundError:
    pass
