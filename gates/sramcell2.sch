v 20201216 2
C 48100 49000 1 90 0 resistor-load.sym
{
T 48000 49400 5 10 0 1 90 0 1
footprint=0603-boxed
T 48000 49400 5 10 0 1 90 0 1
value=3k3
T 47700 49300 5 10 0 0 90 0 1
device=RESISTOR
T 48050 49550 5 10 1 1 0 0 1
refdes=R2
}
N 48000 48200 48000 48400 4
N 48000 48800 48000 49000 4
C 47600 48300 1 0 0 2n7002.sym
{
T 49100 48900 5 10 0 1 0 0 1
device=NMOS
T 47800 48600 5 10 1 1 0 1 1
refdes=M2
T 47700 49100 5 10 0 1 0 0 1
value=2N7002P
T 48100 48900 5 10 0 1 0 0 1
footprint=sot23-nmos
}
N 47600 48600 47200 49000 4
C 46900 49000 1 90 0 resistor-load.sym
{
T 46800 49400 5 10 0 1 90 0 1
footprint=0603-boxed
T 46800 49400 5 10 0 1 90 0 1
value=3k3
T 46500 49300 5 10 0 0 90 0 1
device=RESISTOR
T 46800 49700 5 10 1 1 0 6 1
refdes=R1
}
C 47200 48300 1 0 1 2n7002.sym
{
T 45700 48900 5 10 0 1 0 6 1
device=NMOS
T 47000 48575 5 10 1 1 0 2 1
refdes=M1
T 47100 49100 5 10 0 1 0 6 1
value=2N7002P
T 46700 48900 5 10 0 1 0 6 1
footprint=sot23-nmos
}
N 46800 49000 46800 48800 4
N 47200 48600 47600 49000 4
N 47600 49000 48500 49000 4
{
T 47700 49050 5 10 1 1 0 0 1
netname=R
}
N 46200 49000 47200 49000 4
{
T 46950 49050 5 10 1 1 0 0 1
netname=L
}
C 49000 49400 1 90 1 pdtc124.sym
{
T 48700 49100 5 10 1 1 0 5 1
refdes=Q2
T 48500 48700 5 10 0 1 90 6 1
footprint=sot323-bjt
T 48300 49300 5 10 0 1 90 6 1
value=PDTC124TU
}
C 45700 49400 1 270 0 pdtc124.sym
{
T 45925 49250 5 10 1 1 0 6 1
refdes=Q1
T 46200 48700 5 10 0 1 270 0 1
footprint=sot323-bjt
T 46400 49300 5 10 0 1 270 0 1
value=PDTC124TU
}
N 46000 49400 46000 50100 4
N 46000 50100 48700 50100 4
N 48700 50100 48700 49400 4
C 49100 48900 1 0 0 out-1.sym
{
T 49100 49400 5 10 0 0 0 0 1
footprint=anchor
T 49100 49200 5 10 0 0 0 0 1
device=OUTPUT
T 49500 49025 5 10 1 1 0 3 1
refdes=RR
}
C 45300 48900 1 0 1 out-1.sym
{
T 45300 49400 5 10 0 0 0 6 1
footprint=anchor
T 45300 49200 5 10 0 0 0 6 1
device=OUTPUT
T 44950 49025 5 10 1 1 0 6 1
refdes=L
}
C 49600 49700 1 0 1 in-1.sym
{
T 49600 50200 5 10 0 0 0 6 1
footprint=anchor
T 49600 50000 5 10 0 0 0 6 1
device=INPUT
T 49500 49850 5 10 1 1 0 6 1
refdes=STROBE
}
C 49700 48400 1 0 1 in-1.sym
{
T 49700 48900 5 10 0 0 0 6 1
footprint=anchor
T 49700 48700 5 10 0 0 0 6 1
device=INPUT
T 49300 48525 5 10 1 1 0 0 1
refdes=Vdd
}
C 46700 48400 1 90 0 pdtc124.sym
{
T 46475 48575 5 10 1 1 0 2 1
refdes=Q3
T 46200 49100 5 10 0 1 90 0 1
footprint=sot323-bjt
T 46000 48500 5 10 0 1 90 0 1
value=PDTC124TU
}
N 46600 48800 46800 48800 4
C 45300 48700 1 0 1 out-1.sym
{
T 45300 49200 5 10 0 0 0 6 1
footprint=anchor
T 45300 49000 5 10 0 0 0 6 1
device=OUTPUT
T 44925 48775 5 10 1 1 0 5 1
refdes=LB
}
C 45500 48300 1 0 0 in-1.sym
{
T 45500 48800 5 10 0 0 0 0 1
footprint=anchor
T 45500 48600 5 10 0 0 0 0 1
device=INPUT
T 46000 48350 5 10 1 1 0 5 1
refdes=STROBEB
}
C 49700 48100 1 0 1 in-1.sym
{
T 49700 48600 5 10 0 0 0 6 1
footprint=anchor
T 49700 48400 5 10 0 0 0 6 1
device=INPUT
T 49400 48175 5 10 1 1 0 5 1
refdes=GND
}
C 47700 49000 1 90 0 out-1.sym
{
T 47200 49000 5 10 0 0 90 0 1
footprint=anchor
T 47400 49000 5 10 0 0 90 0 1
device=OUTPUT
T 47700 49750 5 10 1 1 180 0 1
refdes=QR
}
C 47300 49000 1 90 0 out-1.sym
{
T 46800 49000 5 10 0 0 90 0 1
footprint=anchor
T 47000 49000 5 10 0 0 90 0 1
device=OUTPUT
T 47300 49750 5 10 1 1 180 0 1
refdes=QL
}
C 47900 47900 1 0 0 gnd-1.sym
C 46700 47900 1 0 0 gnd-1.sym
N 46800 48200 46800 48400 4
C 49000 47900 1 0 0 gnd-1.sym
C 48900 48500 1 0 0 vdd-1.sym
C 47800 49900 1 0 0 vdd-1.sym
C 46600 49900 1 0 0 vdd-1.sym
N 49100 49000 48900 49000 4
N 45300 49000 45800 49000 4
N 46100 48400 46400 48400 4
C 45300 48700 1 0 0 resistor-load.sym
{
T 45600 49100 5 10 0 0 0 0 1
device=RESISTOR
T 45550 48750 5 10 1 1 0 8 1
refdes=R3
T 45700 48800 5 10 0 1 0 0 1
footprint=0603-boxed
T 45700 48800 5 10 0 1 0 0 1
value=3.3k
}
N 49000 49800 48700 49800 4
