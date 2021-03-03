v 20201216 2
C 700 1500 1 0 0 in-1.sym
{
T 700 2000 5 10 0 0 0 7 1
footprint=anchor
T 700 1800 5 10 0 0 0 7 1
device=INPUT
T 700 1600 5 10 1 1 0 7 1
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
C 700 400 1 0 0 in-1.sym
{
T 700 900 5 10 0 0 0 0 1
footprint=anchor
T 700 700 5 10 0 0 0 0 1
device=INPUT
T 700 500 5 10 1 1 0 7 1
refdes=GND
}
C 3100 400 1 90 0 in-1.sym
{
T 2600 400 5 10 0 0 90 0 1
footprint=anchor
T 2800 400 5 10 0 0 90 0 1
device=INPUT
T 3000 400 5 10 1 1 0 5 1
refdes=C
}
C 3000 500 1 0 0 sramcells.sym
{
T 3800 1200 5 10 1 1 0 4 1
source=sramcells.sch
T 4350 950 5 10 1 1 0 7 1
refdes=B
}
C 700 1900 1 0 0 in-1.sym
{
T 700 2400 5 10 0 0 0 0 1
footprint=anchor
T 700 2200 5 10 0 0 0 0 1
device=INPUT
T 700 2000 5 10 1 1 0 7 1
refdes=Vdd
}
C 1100 2000 1 0 0 vdd-1.sym
C 1900 2000 1 0 0 vdd-1.sym
C 3600 2000 1 0 0 vdd-1.sym
C 1200 200 1 0 0 gnd-1.sym
C 2000 200 1 0 0 gnd-1.sym
C 3700 200 1 0 0 gnd-1.sym
N 3000 1600 2900 1600 4
{
T 2950 1625 5 10 1 1 0 3 1
netname=S
}
N 3000 1400 2900 1400 4
{
T 2950 1375 5 10 1 1 0 5 1
netname=R
}
C 700 900 1 0 0 in-1.sym
{
T 700 1400 5 10 0 0 0 0 1
footprint=anchor
T 700 1200 5 10 0 0 0 0 1
device=INPUT
T 700 1000 5 10 1 1 0 7 1
refdes=C#
}
C 1300 500 1 0 0 dlatch.sym
{
T 2650 950 5 10 1 1 0 7 1
refdes=A
T 2100 1200 5 10 1 1 0 4 1
source=dlatch.sch
}
