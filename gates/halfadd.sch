v 20220529 2
C 1200 600 1 0 0 not.sym
{
T 1550 900 5 10 1 1 0 4 1
refdes=I
}
C 2600 1600 1 0 0 nor.sym
{
T 3000 2100 5 10 1 1 0 4 1
refdes=N
}
C 600 800 1 0 0 in-1.sym
{
T 600 1100 5 10 0 0 0 0 1
device=INPUT
T 600 900 5 10 1 1 0 7 1
refdes=B
T 600 1300 5 10 0 0 0 0 1
footprint=anchor
}
C 2000 2100 1 0 0 in-1.sym
{
T 2000 2400 5 10 0 0 0 0 1
device=INPUT
T 2000 2200 5 10 1 1 0 7 1
refdes=A
T 2000 2600 5 10 0 0 0 0 1
footprint=anchor
}
C 600 500 1 0 0 in-1.sym
{
T 600 800 5 10 0 0 0 0 1
device=INPUT
T 600 600 5 10 1 1 0 7 1
refdes=A#
T 600 1000 5 10 0 0 0 0 1
footprint=anchor
}
C 4000 2500 1 0 1 in-1.sym
{
T 4000 2800 5 10 0 0 0 6 1
device=INPUT
T 4000 2600 5 10 1 1 0 1 1
refdes=Vdd
T 4000 3000 5 10 0 0 0 6 1
footprint=anchor
}
C 4000 500 1 0 1 in-1.sym
{
T 4000 800 5 10 0 0 0 6 1
device=INPUT
T 4000 600 5 10 1 1 0 1 1
refdes=GND
T 4000 1000 5 10 0 0 0 6 1
footprint=anchor
}
C 3400 2000 1 0 0 out-1.sym
{
T 3400 2300 5 10 0 0 0 0 1
device=OUTPUT
T 4000 2100 5 10 1 1 0 1 1
refdes=Q#
T 3400 2500 5 10 0 0 0 0 1
footprint=anchor
}
C 3400 800 1 0 0 out-1.sym
{
T 3400 1100 5 10 0 0 0 0 1
device=OUTPUT
T 4000 900 5 10 1 1 0 1 1
refdes=C
T 3400 1300 5 10 0 0 0 0 1
footprint=anchor
}
C 2700 2600 1 0 0 vdd-1.sym
C 2700 1200 1 0 0 vdd-1.sym
C 1400 1200 1 0 0 vdd-1.sym
C 2800 300 1 0 0 gnd-1.sym
N 2000 900 2500 900 4
{
T 2250 925 5 8 1 1 0 3 1
netname=x
}
N 1200 900 1200 2000 4
N 1200 2000 2600 2000 4
N 2900 1600 3300 1600 4
N 3300 1600 3300 900 4
N 1200 600 1600 600 4
C 2500 600 1 0 0 not.sym
{
T 2850 900 5 10 1 1 0 4 1
refdes=P
}
N 3400 900 3300 900 4
N 3400 2600 2900 2600 4
N 3400 600 2900 600 4
