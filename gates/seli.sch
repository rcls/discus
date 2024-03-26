v 20220529 2
N 1700 900 1700 1400 4
{
T 1725 1100 5 8 1 1 0 1 1
netname=x
}
N 900 900 900 1700 4
N 900 1700 1400 1700 4
N 1400 1900 900 1900 4
C 300 1800 1 0 0 in-1.sym
{
T 300 2300 5 10 0 0 0 0 1
footprint=anchor
T 300 2100 5 10 0 0 0 0 1
device=INPUT
T 300 1900 5 10 1 1 0 7 1
refdes=A0
}
C 300 500 1 0 0 in-1.sym
{
T 300 1000 5 10 0 0 0 0 1
footprint=anchor
T 300 800 5 10 0 0 0 0 1
device=INPUT
T 300 600 5 10 1 1 0 7 1
refdes=A1
}
C 3000 1000 1 0 1 in-1.sym
{
T 3000 1500 5 10 0 0 0 6 1
footprint=anchor
T 3000 1300 5 10 0 0 0 6 1
device=INPUT
T 2900 1050 5 10 1 1 0 8 1
refdes=GND
}
C 3000 2000 1 0 1 in-1.sym
{
T 3000 2500 5 10 0 0 0 6 1
footprint=anchor
T 3000 2300 5 10 0 0 0 6 1
device=INPUT
T 2600 2150 5 10 1 1 0 0 1
refdes=Vdd
}
C 2400 1500 1 0 0 out-1.sym
{
T 2400 2000 5 10 0 0 0 0 1
footprint=anchor
T 2400 1800 5 10 0 0 0 0 1
device=OUTPUT
T 3000 1550 5 10 1 1 0 0 1
refdes=Q
}
N 2400 2100 2000 2100 4
C 1800 2100 1 0 0 vdd-1.sym
C 1100 1200 1 0 0 vdd-1.sym
N 2400 1100 2000 1100 4
C 1900 800 1 0 0 gnd-1.sym
C 300 1200 1 0 0 in-1.sym
{
T 300 1700 5 10 0 0 0 7 1
footprint=anchor
T 300 1500 5 10 0 0 0 7 1
device=INPUT
T 300 1300 5 10 1 1 0 7 1
refdes=S
}
C 1400 1100 1 0 0 nand1or.sym
{
T 2050 1600 5 10 1 1 0 4 1
refdes=O
}
C 900 600 1 0 0 not.sym
{
T 1250 900 5 10 1 1 0 4 1
refdes=N
}
N 900 600 1300 600 4
