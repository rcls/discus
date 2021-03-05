v 20201216 2
N 2800 2500 2800 1800 4
C 4500 2500 1 90 0 out-1.sym
{
T 4200 2500 5 10 0 0 90 0 1
device=OUTPUT
T 4400 3150 5 10 1 1 0 3 1
refdes=Q#
T 4000 2500 5 10 0 0 90 0 1
footprint=anchor
}
C 3800 2500 1 90 0 out-1.sym
{
T 3500 2500 5 10 0 0 90 0 1
device=OUTPUT
T 3700 3150 5 10 1 1 0 3 1
refdes=Q
T 3300 2500 5 10 0 0 90 0 1
footprint=anchor
}
C 2100 500 1 0 0 in-1.sym
{
T 2100 1000 5 10 0 0 0 0 1
footprint=anchor
T 2100 800 5 10 0 0 0 0 1
device=INPUT
T 2100 600 5 10 1 1 0 7 1
refdes=E#
}
C 2100 1100 1 0 0 in-1.sym
{
T 2100 1600 5 10 0 0 0 0 1
footprint=anchor
T 2100 1400 5 10 0 0 0 0 1
device=INPUT
T 2100 1200 5 10 1 1 0 7 1
refdes=Vdd
}
C 2100 100 1 0 0 in-1.sym
{
T 2100 600 5 10 0 0 0 0 1
footprint=anchor
T 2100 400 5 10 0 0 0 0 1
device=INPUT
T 2100 200 5 10 1 1 0 7 1
refdes=GND
}
C 2500 1200 1 0 0 vdd-1.sym
C 2600 -100 1 0 0 gnd-1.sym
C 3100 -100 1 0 0 gnd-1.sym
C 3000 2100 1 0 0 vdd-1.sym
C 4700 2100 1 0 0 vdd-1.sym
C 2800 1500 1 0 0 not.sym
{
T 3150 1800 5 10 1 1 0 4 1
refdes=I
}
N 5300 2500 5300 1800 4
N 3700 1800 4400 2500 4
N 4400 1800 3700 2500 4
N 3700 1800 3600 1800 4
N 4400 1800 4500 1800 4
C 2100 700 1 0 0 in-1.sym
{
T 2100 1200 5 10 0 0 0 0 1
footprint=anchor
T 2100 1000 5 10 0 0 0 0 1
device=INPUT
T 2100 800 5 10 1 1 0 7 1
refdes=D
}
N 2800 2500 3700 2500 4
N 5300 2500 4400 2500 4
C 2900 200 1 0 0 nor.sym
{
T 3300 700 5 10 1 1 0 4 1
refdes=M
}
C 3000 1200 1 0 0 vdd-1.sym
N 3200 1500 3700 1500 4
N 3700 700 3700 1500 4
N 2700 600 2900 600 4
{
T 2800 575 5 10 1 1 0 5 1
netname=E#
}
N 2700 800 2900 800 4
C 4600 200 1 0 0 norod.sym
{
T 5000 700 5 10 1 1 0 4 1
refdes=N
}
C 5300 1500 1 0 1 not.sym
{
T 4950 1800 5 10 1 1 0 4 1
refdes=J
}
C 4800 -100 1 0 0 gnd-1.sym
N 5400 700 5400 1300 4
N 5400 1300 4900 1300 4
{
T 5200 1325 5 8 1 1 0 3 1
netname=X
}
N 3700 800 4600 800 4
{
T 4100 825 5 10 1 1 0 3 1
netname=D#
}
N 4400 600 4600 600 4
{
T 4500 575 5 10 1 1 0 5 1
netname=E#
}
N 4900 1500 4900 1300 4