#!/usr/bin/python3

import sys
import uuid

OBJS_PATH = sys.argv[1]
NETS_PATH = sys.argv[2]

value_map = {
    'rload' : '2k49',
    'rstrong': '820',
    'rpull': '10k',
    'NMOS_switch': 'FDV301N',
    'PMOS_switch': 'NX3008PBK',
    }

footprint_map = {}

UUID_BASE = uuid.UUID('26a52716-8731-44f9-8efc-615c84b378de')

def read_nets(f: file) -> dict[str, list[(str, str)]]:
    ''' 'netname' -> [('refdes', 'pin')] '''
    result = {}
    current = None
    for L in f:
        L = L.strip()
        next_more = L.endswith('\\')
        L = L.removesuffix('\\').strip()
        if current is None:
            name, items = L.split('\t', 1)
            current = []
            result[name] = current
        else:
            items = L
        for ref_pin in items.split():
            ref, pin = ref_pin.rsplit('-', 1)
            current.append((ref, pin))
        if not next_more:
            current = None
    return result

def read_objs(f: file) -> list[(str, str, str)]:
    ''' [('refdes', 'value', 'footprint')] '''
    L = next(f).strip()
    assert L == 'refdes\tvalue\tfootprint'
    result = []
    for L in f:
        L = L.strip()
        refdes, value, footprint = L.split('\t')
        value = value_map.get(value, value)
        footprint = footprint_map.get(footprint, footprint)
        result.append((refdes, value, footprint))
    return result

def pin_function(refdes: str, pin: str) -> str:
    if refdes[0] == 'M':
        return 'GSD'[int(pin) - 1]
    return pin

def net_node(refdes: str, pin: str) -> list:
    return ['node', ['ref', refdes],
            ['pin', pin],
            ['pinfunction', pin_function(refdes, pin)],
            ['pintype', 'passive']]

def net(name: str, nodes: list[(str, str)], code: int) -> list:
    return ['net', ['code', code], ['name', name], ['class', 'Default']] \
        + [net_node(refdes, pin) for refdes, pin in nodes]

def nets(n: dict[str, list[(str, str)]]) -> list:
    return ['nets'] \
        + [net(name, nodes, code)
           for code, (name, nodes) in enumerate(n.items(), 1)]

def comp(refdes: str, value: str, footprint: str) -> list:
    return [
        'comp',
        ['ref', refdes], ['value', value], ['footprint', 'Parts:' + footprint],
        ['fields'], # ?
        # Properties?
        ['sheetpath', ['names', '/'], ['tstamps', '/']],
        ['tstamps', uuid.uuid5(UUID_BASE, refdes)],
    ]

def components(objs: list[(str, str, str)]) -> list:
    return ['components'] + \
        [comp(refdes, value, footprint) for refdes, value, footprint in objs]

def model(o: list[(str, str, str)], n: dict[str, list[(str, str)]]) -> list:
    return ['export', ['version', 'E'],
            components(o),
            ['libparts'],
            ['libraries'],
            nets(n)]

def output(l):
    if not isinstance(l, list):
        print('"' + str(l) + '"', end='')
        return
    print(f'({l[0]}', end='')
    for n in l[1:]:
        print(' ', end='')
        output(n)
    print(')')

'''
model = [
    'export',
    ['version', 'E'],
    ['components', ['comp' ....]],
    ['libparts', ...],
    ['libraries', ...],
    ['nets', ['net' ....]],
]

comp = [
    'comp',
    ['ref', ref],
    ['value', value],
    ['footprint', footprint],
    ['fields', # Stock / Footprint / Datasheet / Description
     ['field', ['name', name], 'value']
     ...
     ],
    ['libsource' ...],
    # Stock / SHeetname / Sheetfile / exclude_from_bom, ki_keyword, ki_fp_filters
    ['property', ['name', name], ['value', value]] ...
    ['sheetpath', ['names', '/'], [tstamps, '/']],
    ['tstamps', uuid],
]

['nets' net ...]

['net', ['code', 'number'], ['name', 'netname'], ['class', 'Default'],
   node ...]

['node', ['ref', "refdes"], ['pin', "number"], [pintype, "passive"]]

'''

o = read_objs(open(OBJS_PATH))
n = read_nets(open(NETS_PATH))

output(model(o, n))
