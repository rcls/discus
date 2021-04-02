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
        yield L
        return

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
    yield L, attrs

def parse(IN):
    lines = peekable(L.removesuffix('\n') for L in IN)
    for L in lines:
        if L.startswith('C ') or L.startswith('P '):
            yield from parseCP(lines, L)
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
    for I in parse(open(PATH)):
        if type(I) == str:
            continue
        L, attrs = I
        if not L.startswith('P '):
            continue
        _, pinlabel  = attrs['pinlabel']
        _, pinnumber = attrs['pinnumber']
        _, pinseq    = attrs['pinseq']
        assert pinnumber == pinseq # We probably want to break this.
        pins[pinlabel] = pinnumber
    return pins

# e.g., invisible: T 14600 300 5 10 0 1 0 1 1
#       visible:   T 14600 300 5 10 1 1 0 1 1
def invisible(L):
    W = L.split(' ')
    W[5] = '0'
    return ' '.join(W)

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
    return [L, {
        'footprint': [footT, args.conn],
        'slot'     : [devT , str(pinmap[refdes])],
        'refdes'   : [invisible(refT), 'CMAIN'],
        'device'   : [refT , refdes]}]


pinmap = build_pinmap(args.sym)
#print(pinmap)

IN = open(args.src)
OUT = open(args.dst, 'w')

parsed = parse(IN)

OUT.writelines(flatten(replace_in_out(pinmap, I) for I in parsed))
