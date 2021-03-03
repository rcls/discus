v 20201216 2
C 500 1500 1 0 0 in-1.sym
{
T 500 2000 5 10 0 0 0 7 1
footprint=anchor
T 500 1800 5 10 0 0 0 7 1
device=INPUT
T 500 1600 5 10 1 1 0 7 1
refdes=D
}
C 4700 1300 1 0 0 out-1.sym
{
T 4700 1800 5 10 0 0 0 0 1
footprint=anchor
T 4700 1600 5 10 0 0 0 0 1
device=OUTPUT
T 4900 1375 5 10 1 1 0 2 1
refdes=Q#
}
C 4700 1700 1 180 1 out-1.sym
{
T 4700 1200 5 10 0 0 180 6 1
footprint=anchor
T 4700 1400 5 10 0 0 180 6 1
device=OUTPUT
T 5100 1625 5 10 1 1 0 6 1
refdes=Q
}
C 500 400 1 0 0 in-1.sym
{
T 500 900 5 10 0 0 0 0 1
footprint=anchor
T 500 700 5 10 0 0 0 0 1
device=INPUT
T 500 500 5 10 1 1 0 7 1
refdes=GND
}
C 500 900 1 0 0 in-1.sym
{
T 500 1400 5 10 0 0 0 0 1
footprint=anchor
T 500 1200 5 10 0 0 0 0 1
device=INPUT
T 500 1000 5 10 1 1 0 7 1
refdes=C
}
C 3100 500 1 0 0 sramcells.sym
{
T 3900 1200 5 10 1 1 0 4 1
source=sramcells.sch
T 4450 950 5 10 1 1 0 7 1
refdes=B
}
C 500 1900 1 0 0 in-1.sym
{
T 500 2400 5 10 0 0 0 0 1
footprint=anchor
T 500 2200 5 10 0 0 0 0 1
device=INPUT
T 500 2000 5 10 1 1 0 7 1
refdes=Vdd
}
C 900 2000 1 0 0 vdd-1.sym
C 1900 2000 1 0 0 vdd-1.sym
C 3700 2000 1 0 0 vdd-1.sym
C 1000 200 1 0 0 gnd-1.sym
C 2000 200 1 0 0 gnd-1.sym
C 3800 200 1 0 0 gnd-1.sym
N 3100 1600 2900 1600 4
{
T 3000 1625 5 10 1 1 0 3 1
netname=S
}
N 3100 1400 2900 1400 4
{
T 3000 1375 5 10 1 1 0 5 1
netname=R
}
C 1300 500 1 0 0 diplatch.sym
{
T 2650 1000 5 10 1 1 0 7 1
refdes=A
T 2100 1225 5 10 1 1 0 4 1
source=diplatch.sch
}
N 1100 1600 1300 1600 4
N 1100 1000 1300 1000 4
{
T 1200 1025 5 10 1 1 0 3 1
netname=C
}
N 2900 1000 3100 1000 4
{
T 3000 1025 5 10 1 1 0 3 1
netname=C
}
