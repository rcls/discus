v 20201216 2
C 600 1500 1 0 0 in-1.sym
{
T 600 2000 5 10 0 0 0 7 1
footprint=anchor
T 600 1800 5 10 0 0 0 7 1
device=INPUT
T 600 1600 5 10 1 1 0 7 1
refdes=D
}
C 4500 1300 1 0 0 out-1.sym
{
T 4500 1800 5 10 0 0 0 0 1
footprint=anchor
T 4500 1600 5 10 0 0 0 0 1
device=OUTPUT
T 4700 1375 5 10 1 1 0 2 1
refdes=Q#
}
C 4500 1700 1 180 1 out-1.sym
{
T 4500 1200 5 10 0 0 180 6 1
footprint=anchor
T 4500 1400 5 10 0 0 180 6 1
device=OUTPUT
T 4900 1625 5 10 1 1 0 6 1
refdes=Q
}
C 600 400 1 0 0 in-1.sym
{
T 600 900 5 10 0 0 0 0 1
footprint=anchor
T 600 700 5 10 0 0 0 0 1
device=INPUT
T 600 500 5 10 1 1 0 7 1
refdes=GND
}
C 3000 400 1 90 0 in-1.sym
{
T 2500 400 5 10 0 0 90 0 1
footprint=anchor
T 2700 400 5 10 0 0 90 0 1
device=INPUT
T 2900 400 5 10 1 1 0 5 1
refdes=C
}
C 2900 500 1 0 0 sramcellw.sym
{
T 3700 1200 5 10 1 1 0 4 1
source=sramcellw.sch
T 4050 950 5 10 1 1 0 0 1
refdes=B
}
C 600 1900 1 0 0 in-1.sym
{
T 600 2400 5 10 0 0 0 0 1
footprint=anchor
T 600 2200 5 10 0 0 0 0 1
device=INPUT
T 600 2000 5 10 1 1 0 7 1
refdes=Vdd
}
C 1000 2000 1 0 0 vdd-1.sym
C 1800 2000 1 0 0 vdd-1.sym
C 3500 2000 1 0 0 vdd-1.sym
C 1100 200 1 0 0 gnd-1.sym
C 1900 200 1 0 0 gnd-1.sym
C 3600 200 1 0 0 gnd-1.sym
N 2900 1600 2800 1600 4
{
T 2850 1625 5 10 1 1 0 3 1
netname=S
}
N 2900 1400 2800 1400 4
{
T 2850 1375 5 10 1 1 0 5 1
netname=R
}
C 600 900 1 0 0 in-1.sym
{
T 600 1400 5 10 0 0 0 0 1
footprint=anchor
T 600 1200 5 10 0 0 0 0 1
device=INPUT
T 600 1000 5 10 1 1 0 7 1
refdes=C#
}
C 1200 500 1 0 0 dlatch.sym
{
T 2350 950 5 10 1 1 0 0 1
refdes=A
T 2000 1225 5 10 1 1 0 4 1
source=dlatch.sch
}
