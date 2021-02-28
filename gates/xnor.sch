v 20201216 2
C 1200 400 1 0 0 nand.sym
{
T 1600 900 5 10 1 1 0 4 1
refdes=N
}
C 1700 1300 1 0 0 nand1or.sym
{
T 2350 1800 5 10 1 1 0 4 1
refdes=O
}
C 1400 100 1 0 0 gnd-1.sym
C 2200 1000 1 0 0 gnd-1.sym
N 2000 900 2000 1600 4
N 1200 1000 1200 1900 4
N 1000 1900 1700 1900 4
N 1700 2100 1000 2100 4
N 1200 800 1100 800 4
N 1100 800 1100 2100 4
C 400 2000 1 0 0 in-1.sym
{
T 400 2500 5 10 0 0 0 0 1
footprint=anchor
T 400 2300 5 10 0 0 0 0 1
device=INPUT
T 300 2050 5 10 1 1 0 0 1
refdes=A
}
C 400 1800 1 0 0 in-1.sym
{
T 400 2300 5 10 0 0 0 0 1
footprint=anchor
T 400 2100 5 10 0 0 0 0 1
device=INPUT
T 300 1850 5 10 1 1 0 0 1
refdes=B
}
C 900 300 1 0 0 in-1.sym
{
T 900 800 5 10 0 0 0 0 1
footprint=anchor
T 900 600 5 10 0 0 0 0 1
device=INPUT
T 900 350 5 10 1 1 0 6 1
refdes=GND
}
C 1700 2200 1 0 0 in-1.sym
{
T 1700 2700 5 10 0 0 0 0 1
footprint=anchor
T 1700 2500 5 10 0 0 0 0 1
device=INPUT
T 1700 2300 5 10 1 1 0 7 1
refdes=Vdd
}
C 2700 1700 1 0 0 out-1.sym
{
T 2700 2200 5 10 0 0 0 0 1
footprint=anchor
T 2700 2000 5 10 0 0 0 0 1
device=OUTPUT
T 3300 1750 5 10 1 1 0 0 1
refdes=Q
}
C 2000 800 1 0 0 out-1.sym
{
T 2000 1300 5 10 0 0 0 0 1
footprint=anchor
T 2000 1100 5 10 0 0 0 0 1
device=OUTPUT
T 2600 850 5 10 1 1 0 0 1
refdes=C
}
C 2100 2300 1 0 0 vdd-1.sym
C 1300 1400 1 0 0 vdd-1.sym
