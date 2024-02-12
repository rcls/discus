#!/usr/bin/python3

# Simple cacher:
# cached-py -o outputfile -i inputfiles -- command

import argparse
import hashlib
import platformdirs
import os
import struct
import subprocess
import sys

parser = argparse.ArgumentParser()

parser.add_argument('-i', help='Input file', nargs='+')
parser.add_argument('-o', help='Output file')
parser.add_argument('command', help='Command', nargs='+')
args = parser.parse_args()

def opensearch(p):
    for prefix in '', 'gates/', 'sym/', 'schem/', 'board/':
        try:
            pp = prefix + p
            return pp, open(prefix + p)
        except FileNotFoundError:
            pass
    return (None, None)

extra_files = list()
seen = set(args.i)
pending = []
for p in args.i:
    if p.endswith('.sch') or p.endswith('.sym'):
        pending.append(open(p))

def filename(p):
    if p in seen:
        return
    seen.add(p)
    pp, f = opensearch(p)
    if pp is not None:
        extra_files.append(pp)
        if p.endswith('.sch') or p.endswith('.sym'):
            pending.append(f)
        else:
            f.close()

while pending:
    for L in pending.pop():
        L = L.strip()
        if L.startswith('C '):
            s = L.split()
            assert len(s) == 7
            filename(s[-1])
        s = L.split('=', 1)
        if len(s) == 2 and s[0] in ('file', 'source'):
            filename(s[-1])

all_files = args.i + sorted(extra_files)
#print(all_files)

def slurppath(P):
    return open(P, 'rb').read()

def dumppath(P, b):
    with open(P, 'wb') as F:
        F.write(b)

def hash_blob(hash, blob):
    hash.update(struct.pack('<L', len(blob)))
    hash.update(blob)

hash = hashlib.sha256()

for p in all_files:
    hash_blob(hash, bytes(p, 'utf8'))
    hash_blob(hash, slurppath(p))

hashed_path = platformdirs.user_cache_path('discus') / (
    os.path.basename(args.o) + '.' + hash.hexdigest())

try:
    dumppath(args.o, slurppath(hashed_path))
    print('REUSE', hashed_path)
    # Lazy...
    subprocess.run(['touch', '--', hashed_path]).check_returncode()
    sys.exit(0)
except FileNotFoundError:
    pass

subprocess.run(args.command).check_returncode()

dumppath(hashed_path, slurppath(args.o))
