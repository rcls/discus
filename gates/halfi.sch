v 20130925 2
C 16200 49400 1 0 0 vdd-1.sym
C 16300 48100 1 0 0 gnd-1.sym
N 17000 47900 18000 47900 4
C 18400 49500 1 0 0 vdd-1.sym
C 18500 48200 1 0 0 gnd-1.sym
N 18000 49100 18000 47900 4
N 18000 49300 18000 49800 4
N 17000 49800 17000 48900 4
N 16800 48900 17000 48900 4
N 17000 49800 18000 49800 4
C 15800 48400 1 0 0 andnand.sym
{
T 16350 48850 5 10 1 1 0 0 1
refdes=X
}
C 18000 48500 1 0 0 nor1and.sym
{
T 18550 48950 5 10 1 1 0 0 1
refdes=O
}
C 17000 48300 1 0 0 nor.sym
{
T 17300 48750 5 10 1 1 0 0 1
refdes=D
}
N 17800 48800 18200 48800 4
N 17000 48700 17000 47900 4
C 17100 49300 1 0 0 vdd-1.sym
C 17200 48000 1 0 0 gnd-1.sym
C 15200 48900 1 0 0 in-1.sym
{
T 15200 49400 5 10 0 0 0 0 1
footprint=anchor
T 15200 49200 5 10 0 0 0 0 1
device=INPUT
T 15000 48950 5 10 1 1 0 0 1
refdes=A
}
C 15200 48700 1 0 0 in-1.sym
{
T 15200 49200 5 10 0 0 0 0 1
footprint=anchor
T 15200 49000 5 10 0 0 0 0 1
device=INPUT
T 15000 48750 5 10 1 1 0 0 1
refdes=A#
}
C 15200 48500 1 0 0 in-1.sym
{
T 15200 49000 5 10 0 0 0 0 1
footprint=anchor
T 15200 48800 5 10 0 0 0 0 1
device=INPUT
T 15000 48550 5 10 1 1 0 0 1
refdes=B
}
C 15200 49100 1 0 0 in-1.sym
{
T 15200 49600 5 10 0 0 0 0 1
footprint=anchor
T 15200 49400 5 10 0 0 0 0 1
device=INPUT
T 15000 49150 5 10 1 1 0 0 1
refdes=B#
}
C 16400 47800 1 0 0 in-1.sym
{
T 16400 48300 5 10 0 0 0 0 1
footprint=anchor
T 16400 48100 5 10 0 0 0 0 1
device=INPUT
T 16200 47800 5 10 1 1 0 0 1
refdes=C#
}
C 15200 48300 1 0 0 in-1.sym
{
T 15200 48800 5 10 0 0 0 0 1
footprint=anchor
T 15200 48600 5 10 0 0 0 0 1
device=INPUT
T 15400 48200 5 10 1 1 0 0 1
refdes=GND
}
C 15200 49300 1 0 0 in-1.sym
{
T 15200 49800 5 10 0 0 0 0 1
footprint=anchor
T 15200 49600 5 10 0 0 0 0 1
device=INPUT
T 15400 49450 5 10 1 1 0 0 1
refdes=Vdd
}
C 19100 49000 1 90 0 out-1.sym
{
T 18600 49000 5 10 0 0 90 0 1
footprint=anchor
T 18800 49000 5 10 0 0 90 0 1
device=OUTPUT
T 19050 49600 5 10 1 1 90 0 1
refdes=Q
}
N 15800 48400 16400 48400 4
N 15800 49400 16400 49400 4
C 19000 48700 1 0 0 not.sym
{
T 19250 48950 5 10 1 1 0 0 1
refdes=I
}
C 19300 48400 1 0 0 gnd-1.sym
C 19200 49300 1 0 0 vdd-1.sym
C 19900 49000 1 90 0 out-1.sym
{
T 19400 49000 5 10 0 0 90 0 1
footprint=anchor
T 19600 49000 5 10 0 0 90 0 1
device=OUTPUT
T 19850 49600 5 10 1 1 90 0 1
refdes=Q#
}
