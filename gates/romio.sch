v 20220529 2
C 2600 700 1 90 0 in-1.sym
{
T 2300 700 5 10 0 0 90 0 1
device=INPUT
T 2500 675 5 10 1 1 0 5 1
refdes=OE
T 2100 700 5 10 0 0 90 0 1
footprint=anchor
}
C 3300 1300 1 0 0 out-1.sym
{
T 3300 1600 5 10 0 0 0 0 1
device=OUTPUT
T 3900 1400 5 10 1 1 0 1 1
refdes=O
T 3300 1800 5 10 0 0 0 0 1
footprint=anchor
}
C 200 1100 1 0 0 in-1.sym
{
T 200 1400 5 10 0 0 0 7 1
device=INPUT
T 200 1200 5 10 1 1 0 7 1
refdes=B
T 200 1600 5 10 0 0 0 7 1
footprint=anchor
}
C 700 0 1 0 0 gnd-1.sym
C 1500 2500 1 0 0 in-1.sym
{
T 1500 2800 5 10 0 0 0 7 1
device=INPUT
T 1500 3000 5 10 0 0 0 7 1
footprint=anchor
T 1500 2600 5 10 1 1 0 7 1
refdes=Vdd
}
C 2500 900 1 0 0 nandod.sym
{
T 2900 1400 5 10 1 1 0 4 1
refdes=S
}
C 2700 600 1 0 0 gnd-1.sym
C 200 200 1 0 0 in-1.sym
{
T 200 500 5 10 0 0 0 7 1
device=INPUT
T 200 700 5 10 0 0 0 7 1
footprint=anchor
T 200 300 5 10 1 1 0 7 1
refdes=GND
}
C 2000 600 1 0 0 gnd-1.sym
C 1700 1300 1 180 0 resistor-load.sym
{
T 1400 900 5 10 0 0 180 0 1
device=RESISTOR
T 950 1250 5 10 1 1 0 6 1
refdes=R1
T 1300 1200 5 10 0 1 180 0 1
footprint=0603-load
T 1300 1200 5 10 0 1 180 0 1
value=rload
}
C 700 1200 1 270 0 resistor-load.sym
{
T 1100 900 5 10 0 0 270 0 1
device=RESISTOR
T 850 550 5 10 1 1 0 2 1
refdes=R2
T 1500 1000 5 10 0 1 270 0 1
footprint=0603-load
T 1700 1000 5 10 0 1 270 0 1
value=rload
}
N 2100 900 2100 1000 4
C 2000 2600 1 270 0 resistor-strong.sym
{
T 1900 1600 5 10 0 1 270 0 1
footprint=0603-strong
T 2400 2300 5 10 0 0 270 0 1
device=RESISTOR
T 2150 1950 5 10 1 1 270 0 1
refdes=R3
T 1700 2500 5 10 0 1 270 0 1
value=rstrong
}
N 2100 1700 2100 1400 4
{
T 2125 1550 5 8 1 1 0 0 1
netname=_c
}
N 2500 1500 2100 1500 4
C 1700 900 1 0 0 npn.sym
{
T 1925 1200 5 8 1 1 0 1 1
refdes=Q
T 2400 1400 5 10 0 1 0 0 1
footprint=sot323-hbt
T 1800 1600 5 10 0 1 0 0 1
value=BC847BW
}
C 1700 1500 1 0 0 schottky.sym
{
T 1997 2197 5 10 0 0 0 0 1
device=DIODE
T 1750 1750 5 10 1 1 0 6 1
refdes=D
T 2000 2550 5 10 0 1 0 0 1
value=RB751S40
T 2000 2700 5 10 0 1 0 0 1
footprint=SOD523
}
N 1700 1700 1700 1200 4
{
T 1675 1500 5 8 1 1 0 6 1
netname=_b
}
