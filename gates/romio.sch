v 20201216 2
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
C 1600 0 1 0 0 gnd-1.sym
C 1500 2300 1 0 0 in-1.sym
{
T 1500 2600 5 10 0 0 0 7 1
device=INPUT
T 1500 2800 5 10 0 0 0 7 1
footprint=anchor
T 1500 2400 5 10 1 1 0 7 1
refdes=Vdd
}
C 2500 900 1 0 0 nandod.sym
{
T 2900 1400 5 10 1 1 0 4 1
refdes=S
}
C 2700 600 1 0 0 gnd-1.sym
C 1100 200 1 0 0 in-1.sym
{
T 1100 500 5 10 0 0 0 7 1
device=INPUT
T 1100 700 5 10 0 0 0 7 1
footprint=anchor
T 1100 300 5 10 1 1 0 7 1
refdes=GND
}
C 2000 600 1 0 0 gnd-1.sym
C 1700 1300 1 180 0 resistor-load.sym
{
T 1400 900 5 10 0 0 180 0 1
device=RESISTOR
T 1050 1150 5 10 1 1 0 8 1
refdes=R1
T 1300 1200 5 10 0 1 180 0 1
footprint=0603-load
T 1300 1200 5 10 0 1 180 0 1
value=rload
}
C 1600 1200 1 270 0 resistor-pull.sym
{
T 2000 900 5 10 0 0 270 0 1
device=RESISTOR
T 1750 550 5 10 1 1 0 2 1
refdes=R2
T 2400 1000 5 10 0 1 270 0 1
footprint=0603-pull
T 2600 1000 5 10 0 1 270 0 1
value=rpull
}
C 1700 900 1 0 0 2sc4774.sym
{
T 1925 1200 5 8 1 1 0 1 1
refdes=Q1
T 2400 1400 5 10 0 1 0 0 1
footprint=sot323-hbt
T 1800 1600 5 10 0 1 0 0 1
value=Q2SC4774
}
N 2100 900 2100 1000 4
C 2000 2400 1 270 0 resistor-strong.sym
{
T 1900 1400 5 10 0 1 270 0 1
footprint=0603-strong
T 2400 2100 5 10 0 0 270 0 1
device=RESISTOR
T 2150 1750 5 10 1 1 270 0 1
refdes=R3
T 1700 2300 5 10 0 1 270 0 1
value=rstrong
}
N 2100 1500 2100 1400 4
N 2500 1500 2100 1500 4
