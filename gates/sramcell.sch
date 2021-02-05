v 20201216 2
C 48100 49000 1 90 0 resistor-load.sym
{
T 48000 49400 5 10 0 1 90 0 1
footprint=0603-boxed
T 48000 49400 5 10 0 1 90 0 1
value=3k3
T 47700 49300 5 10 0 0 90 0 1
device=RESISTOR
T 47975 49675 5 10 1 1 0 6 1
refdes=R2
}
N 48000 48200 48000 48400 4
N 46800 48200 48000 48200 4
N 46800 49900 48000 49900 4
N 48000 48800 48000 49000 4
C 47600 48300 1 0 0 2n7002.sym
{
T 49100 48900 5 10 0 1 0 0 1
device=NMOS
T 47825 48600 5 10 1 1 0 1 1
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
T 46800 49675 5 10 1 1 0 6 1
refdes=R1
}
C 47200 48300 1 0 1 2n7002.sym
{
T 45700 48900 5 10 0 1 0 6 1
device=NMOS
T 46975 48600 5 10 1 1 0 7 1
refdes=M1
T 47100 49100 5 10 0 1 0 6 1
value=2N7002P
T 46700 48900 5 10 0 1 0 6 1
footprint=sot23-nmos
}
N 46800 49000 46800 48800 4
N 47200 48600 47600 49000 4
N 47600 49000 48200 49000 4
{
T 47700 49025 5 10 1 1 0 6 1
netname=R
}
N 46800 48400 46800 48200 4
N 46600 49000 47200 49000 4
{
T 47100 49025 5 10 1 1 0 0 1
netname=L
}
C 48700 49400 1 90 1 pdtc124.sym
{
T 48400 49150 5 10 1 1 0 5 1
refdes=Q2
T 48200 48700 5 10 0 1 90 6 1
footprint=sot323-bjt
T 48000 49300 5 10 0 1 90 6 1
value=PDTC124TU
}
C 46100 49400 1 270 0 pdtc124.sym
{
T 46400 49150 5 10 1 1 0 5 1
refdes=Q1
T 46600 48700 5 10 0 1 270 0 1
footprint=sot323-bjt
T 46800 49300 5 10 0 1 270 0 1
value=PDTC124TU
}
N 46400 49400 46400 50000 4
N 46400 50000 48400 50000 4
N 48400 50000 48400 49400 4
C 48600 48900 1 0 0 out-1.sym
{
T 48600 49400 5 10 0 0 0 0 1
footprint=anchor
T 48600 49200 5 10 0 0 0 0 1
device=OUTPUT
T 48900 48975 5 10 1 1 0 5 1
refdes=R
}
C 46200 48900 1 0 1 out-1.sym
{
T 46200 49400 5 10 0 0 0 6 1
footprint=anchor
T 46200 49200 5 10 0 0 0 6 1
device=OUTPUT
T 45900 49025 5 10 1 1 0 3 1
refdes=L
}
C 49000 49700 1 0 1 in-1.sym
{
T 49000 50200 5 10 0 0 0 6 1
footprint=anchor
T 49000 50000 5 10 0 0 0 6 1
device=INPUT
T 49300 49500 5 10 1 1 0 6 1
refdes=STROBE
}
C 46200 49800 1 0 0 in-1.sym
{
T 46200 50300 5 10 0 0 0 0 1
footprint=anchor
T 46200 50100 5 10 0 0 0 0 1
device=INPUT
T 46200 49900 5 10 1 1 0 7 1
refdes=Vdd
}
C 48600 48100 1 0 1 in-1.sym
{
T 48600 48600 5 10 0 0 0 6 1
footprint=anchor
T 48600 48400 5 10 0 0 0 6 1
device=INPUT
T 48300 48175 5 10 1 1 0 5 1
refdes=GND
}
