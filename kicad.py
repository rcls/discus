#!/usr/bin/python3

import argparse
import sys
import uuid

parser = argparse.ArgumentParser()
parser.add_argument('objs', help='Input BOM list')
parser.add_argument('nets', help='Input net list')
parser.add_argument('-p', '--pins', help='Connector pin list')

args = parser.parse_args()

value_map = {
    'rload' : '2k49',
    'rstrong': '820',
    'rpull': '10k',
    'NMOS_switch': 'FDV301N',
    'PMOS_switch': 'NX3008PBK',
    }

footprint_map = {}

UUID_BASE = uuid.UUID('26a52716-8731-44f9-8efc-615c84b378de')

def read_pins(f: file) -> dict[str, str]:
    result = {}
    for L in f:
        pin, net = L.strip().split(',')
        assert not pin in result, f'{pin}'
        result[pin] = net
    return result

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

def emit_net_node(refdes: str, pin: str) -> list:
    return ['node', ['ref', refdes],
            ['pin', pin],
            ['pinfunction', pin_function(refdes, pin)],
            ['pintype', 'passive']]

def emit_net(name: str, nodes: list[(str, str)], code: int) -> list:
    return ['net', ['code', code], ['name', name], ['class', 'Default']] \
        + [emit_net_node(refdes, pin) for refdes, pin in nodes]

def emit_nets(n: dict[str, list[(str, str)]]) -> list:
    return ['nets'] \
        + [emit_net(name, nodes, code)
           for code, (name, nodes) in enumerate(n.items(), 1)]

def emit_comp(refdes: str, value: str, footprint: str) -> list:
    if not ':' in footprint:
        footprint = 'Parts:' + footprint
    return [
        'comp',
        ['ref', refdes], ['value', value], ['footprint', footprint],
        ['fields'], # ?
        # Properties?
        ['sheetpath', ['names', '/'], ['tstamps', '/']],
        ['tstamps', uuid.uuid5(UUID_BASE, refdes)],
    ]

def emit_components(objs: list[(str, str, str)]) -> list:
    return ['components'] + \
        [emit_comp(refdes, value, footprint) for refdes, value, footprint in objs]

def emit_model(o: list[(str, str, str)], n: dict[str, list[(str, str)]]) -> list:
    return ['export', ['version', 'E'],
            emit_components(o),
            ['libparts'],
            ['libraries'],
            emit_nets(n)]

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

objs = read_objs(open(args.objs))
nets = read_nets(open(args.nets))
conn = read_pins(open(args.pins))

seen_nets = set()
for net, pins in nets.items():
    for ref, pin in pins:
        if ref == 'JMAIN':
            assert net == conn[pin], f'{net} {pin}'
            seen_nets.add(net)

for pin, net in conn.items():
    assert net in seen_nets, f'{net}'
    net_list = nets[net]
    if not ('JMAIN', pin) in net_list:
        net_list.append(('JMAIN', pin))

output(emit_model(objs, nets))
