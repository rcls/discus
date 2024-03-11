v 20220529 2
C 400 1500 1 0 0 in-1.sym
{
T 400 2000 5 10 0 0 0 7 1
footprint=anchor
T 400 1800 5 10 0 0 0 7 1
device=INPUT
T 400 1600 5 10 1 1 0 7 1
refdes=D
}
C 4600 1300 1 0 0 out-1.sym
{
T 4600 1800 5 10 0 0 0 0 1
footprint=anchor
T 4600 1600 5 10 0 0 0 0 1
device=OUTPUT
T 4800 1375 5 10 1 1 0 2 1
refdes=Q#
}
C 4600 1700 1 180 1 out-1.sym
{
T 4600 1200 5 10 0 0 180 6 1
footprint=anchor
T 4600 1400 5 10 0 0 180 6 1
device=OUTPUT
T 5000 1625 5 10 1 1 0 6 1
refdes=Q
}
C 400 400 1 0 0 in-1.sym
{
T 400 900 5 10 0 0 0 0 1
footprint=anchor
T 400 700 5 10 0 0 0 0 1
device=INPUT
T 400 500 5 10 1 1 0 7 1
refdes=GND
}
C 400 1000 1 0 0 in-1.sym
{
T 400 1500 5 10 0 0 0 0 1
footprint=anchor
T 400 1300 5 10 0 0 0 0 1
device=INPUT
T 400 1100 5 10 1 1 0 7 1
refdes=C
}
C 3000 500 1 0 0 sramcellw.sym
{
T 3800 1200 5 10 1 1 0 4 1
source=sramcellw.sch
T 4350 950 5 10 1 1 0 7 1
refdes=B
}
C 400 1900 1 0 0 in-1.sym
{
T 400 2400 5 10 0 0 0 0 1
footprint=anchor
T 400 2200 5 10 0 0 0 0 1
device=INPUT
T 400 2000 5 10 1 1 0 7 1
refdes=Vdd
}
C 800 2000 1 0 0 vdd-1.sym
C 1800 2000 1 0 0 vdd-1.sym
C 3600 2000 1 0 0 vdd-1.sym
C 900 200 1 0 0 gnd-1.sym
C 1900 200 1 0 0 gnd-1.sym
C 3700 200 1 0 0 gnd-1.sym
N 3000 1600 2800 1600 4
{
T 2900 1625 5 10 1 1 0 3 1
netname=S
}
N 3000 1400 2800 1400 4
{
T 2900 1425 5 10 1 1 0 5 1
netname=R
}
N 2800 1000 3000 1000 4
{
T 2900 1025 5 10 1 1 0 3 1
netname=C
}
N 1000 1100 1200 1100 4
{
T 1100 1125 5 10 1 1 0 3 1
netname=C
}
C 1200 500 1 0 0 dielatch.sym
{
T 1450 1325 5 8 1 1 0 1 1
source=dielatch.sch
T 2550 950 5 10 1 1 0 7 1
refdes=A
}
N 1000 1600 1200 1600 4
C 400 800 1 0 0 in-1.sym
{
T 400 1300 5 10 0 0 0 0 1
footprint=anchor
T 400 1100 5 10 0 0 0 0 1
device=INPUT
T 400 900 5 10 1 1 0 7 1
refdes=E#
}
N 1000 900 1200 900 4
