v 20201216 2
C 48300 49200 1 90 0 resistor-load.sym
{
T 48200 49600 5 10 0 1 90 0 1
footprint=0603-boxed
T 48200 49600 5 10 0 1 90 0 1
value=3k3
T 47900 49500 5 10 0 0 90 0 1
device=RESISTOR
T 48250 49750 5 10 1 1 0 0 1
refdes=R2
}
N 48200 48300 48200 48400 4
N 48200 48800 48200 49200 4
C 47800 48300 1 0 0 2n7002.sym
{
T 49300 48900 5 10 0 1 0 0 1
device=NMOS
T 48000 48600 5 8 1 1 0 1 1
refdes=M2
T 47900 49100 5 10 0 1 0 0 1
value=2N7002P
T 48300 48900 5 10 0 1 0 0 1
footprint=sot23-nmos
}
N 47800 48600 47200 49200 4
C 46900 49200 1 90 0 resistor-load.sym
{
T 46800 49600 5 10 0 1 90 0 1
footprint=0603-boxed
T 46800 49600 5 10 0 1 90 0 1
value=3k3
T 46500 49500 5 10 0 0 90 0 1
device=RESISTOR
T 46800 49900 5 10 1 1 0 6 1
refdes=R1
}
C 47200 48300 1 0 1 2n7002.sym
{
T 45700 48900 5 10 0 1 0 6 1
device=NMOS
T 47000 48600 5 8 1 1 0 7 1
refdes=M1
T 47100 49100 5 10 0 1 0 6 1
value=2N7002P
T 46700 48900 5 10 0 1 0 6 1
footprint=sot23-nmos
}
N 46800 49200 46800 48800 4
N 47200 48600 47800 49200 4
N 47800 49200 48700 49200 4
{
T 47900 49250 5 10 1 1 0 0 1
netname=R
}
N 46200 49200 47200 49200 4
{
T 46950 49250 5 10 1 1 0 0 1
netname=L
}
C 49200 49600 1 90 1 pdtc124.sym
{
T 48900 49375 5 8 1 1 0 5 1
refdes=Q2
T 48700 48900 5 10 0 1 90 6 1
footprint=sot323-bjt
T 48500 49500 5 10 0 1 90 6 1
value=PDTC124TU
}
C 45700 49600 1 270 0 pdtc124.sym
{
T 46000 49375 5 8 1 1 0 5 1
refdes=Q1
T 46200 48900 5 10 0 1 270 0 1
footprint=sot323-bjt
T 46400 49500 5 10 0 1 270 0 1
value=PDTC124TU
}
N 46000 49600 46000 50300 4
N 46000 50300 48900 50300 4
N 48900 50300 48900 49600 4
C 49300 49100 1 0 0 out-1.sym
{
T 49300 49600 5 10 0 0 0 0 1
footprint=anchor
T 49300 49400 5 10 0 0 0 0 1
device=OUTPUT
T 49700 49225 5 10 1 1 0 3 1
refdes=WR
}
C 45200 49100 1 0 1 out-1.sym
{
T 45200 49600 5 10 0 0 0 6 1
footprint=anchor
T 45200 49400 5 10 0 0 0 6 1
device=OUTPUT
T 44850 49225 5 10 1 1 0 3 1
refdes=WL
}
C 49950 49900 1 0 1 in-1.sym
{
T 49950 50400 5 10 0 0 0 6 1
footprint=anchor
T 49950 50200 5 10 0 0 0 6 1
device=INPUT
T 49850 50050 5 10 1 1 0 6 1
refdes=WSTROBE
}
C 49900 48500 1 0 1 in-1.sym
{
T 49900 49000 5 10 0 0 0 6 1
footprint=anchor
T 49900 48800 5 10 0 0 0 6 1
device=INPUT
T 49500 48625 5 10 1 1 0 0 1
refdes=Vdd
}
C 46700 48500 1 90 0 pdtc124.sym
{
T 46400 48750 5 8 1 1 0 3 1
refdes=Q3
T 46200 49200 5 10 0 1 90 0 1
footprint=sot323-bjt
T 46000 48600 5 10 0 1 90 0 1
value=PDTC124TU
}
N 46600 48900 46800 48900 4
C 45200 48800 1 0 1 out-1.sym
{
T 45200 49300 5 10 0 0 0 6 1
footprint=anchor
T 45200 49100 5 10 0 0 0 6 1
device=OUTPUT
T 44825 48875 5 10 1 1 0 5 1
refdes=RL
}
C 45500 48400 1 0 0 in-1.sym
{
T 45500 48900 5 10 0 0 0 0 1
footprint=anchor
T 45500 48700 5 10 0 0 0 0 1
device=INPUT
T 46000 48450 5 10 1 1 0 5 1
refdes=RSTROBE
}
C 49900 48200 1 0 1 in-1.sym
{
T 49900 48700 5 10 0 0 0 6 1
footprint=anchor
T 49900 48500 5 10 0 0 0 6 1
device=INPUT
T 49600 48275 5 10 1 1 0 5 1
refdes=GND
}
C 48100 48000 1 0 0 gnd-1.sym
C 46700 48000 1 0 0 gnd-1.sym
N 46800 48300 46800 48400 4
C 49200 48000 1 0 0 gnd-1.sym
C 49100 48600 1 0 0 vdd-1.sym
C 48000 50100 1 0 0 vdd-1.sym
C 46600 50100 1 0 0 vdd-1.sym
N 49300 49200 49100 49200 4
N 45200 49200 45800 49200 4
N 46100 48500 46400 48500 4
C 45200 48800 1 0 0 resistor-load.sym
{
T 45500 49200 5 10 0 0 0 0 1
device=RESISTOR
T 45450 48850 5 10 1 1 0 8 1
refdes=R3
T 45600 48900 5 10 0 1 0 0 1
footprint=0603-boxed
T 45600 48900 5 10 0 1 0 0 1
value=3.3k
}
N 49350 50000 48900 50000 4
N 46100 48900 46200 48900 4
