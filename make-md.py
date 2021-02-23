#!/usr/bin/python3

# Create a .md file for a .sch file.  Include the image and link to the
# subcircuits.

import sys
import os.path

sch_path = sys.argv[1]
md_path = sys.argv[2]

sch_name = sch_path.rsplit('/', 1)[-1]
sch_png_name = sch_name.removesuffix('.sch') + '.png'

linked = {}

for L in open(sch_path):
    W = L.split()
    if not W:
        continue
    if W[0] == 'C' and W[-1].endswith('.sym'):
        sym = W[-1].removeprefix('sym/').removesuffix('.sym')
        linked[sym] = 1

MD = open(md_path, 'w')

MD.write(f'# {sch_name} schematic\n')
MD.write(f'![{sch_name}]({sch_png_name})\n')

heading =f'# Gates in {sch_name}\n'

for S in linked:
    if not os.path.exists(f'gates/{S}.sch') and \
       not os.path.exists(f'board/{S}.sch'):
        continue

    if not os.path.exists(f'sym/{S}.sym'):
        continue

    if heading:
        MD.write(heading)
        heading = None

    MD.write(f'[ ![{S}]({S}-sym.png) ]({S}.html)\n')
