v 20201216 2
C 42600 45600 1 0 0 2n7002.sym
{
T 42825 45900 5 8 1 1 0 1 1
refdes=M2
T 42700 46400 5 8 0 1 0 0 1
value=2N7002P
T 43100 46200 5 8 0 1 0 0 1
footprint=sot23-nmos
T 44100 46200 5 8 0 1 0 0 1
device=NMOS
}
C 44900 45600 1 0 1 2n7002.sym
{
T 44675 45900 5 8 1 1 0 7 1
refdes=M4
T 44800 46400 5 8 0 1 0 6 1
value=2N7002P
T 44400 46200 5 8 0 1 0 6 1
footprint=sot23-nmos
T 43400 46200 5 8 0 1 0 6 1
device=NMOS
}
C 44900 46600 1 0 1 BSS84.sym
{
T 44675 46900 5 8 1 1 0 7 1
refdes=M3
T 44800 47400 5 10 0 1 0 6 1
value=BSS84
T 44400 47200 5 10 0 1 0 6 1
footprint=sot23-pmos
T 43400 47200 5 10 0 1 0 6 1
device=PMOS
}
C 42600 46600 1 0 0 BSS84.sym
{
T 42825 46900 5 8 1 1 0 1 1
refdes=M1
T 42700 47400 5 10 0 1 0 0 1
value=BSS84
T 43100 47200 5 10 0 1 0 0 1
footprint=sot23-pmos
T 44100 47200 5 10 0 1 0 0 1
device=PMOS
}
C 45700 46000 1 90 0 pdtc124.sym
{
T 45400 46250 5 8 1 1 0 3 1
refdes=Q3
T 45200 46700 5 8 0 1 90 0 1
footprint=sot323-bjt
T 45000 46100 5 8 0 1 90 0 1
value=PDTC124TU
}
C 41800 46000 1 270 1 pdtc124.sym
{
T 42100 46250 5 8 1 1 0 3 1
refdes=Q2
T 42300 46700 5 8 0 1 270 6 1
footprint=sot323-bjt
T 42500 46100 5 8 0 1 270 6 1
value=PDTC124TU
}
N 43000 46700 43000 46100 4
N 44500 46700 44500 46100 4
N 44900 45900 44900 46900 4
N 42600 46900 42600 45900 4
N 42600 46200 43300 46200 4
N 44200 46200 44500 46200 4
N 44900 46600 44200 46600 4
N 43300 46600 43000 46600 4
C 43300 47400 1 90 0 out-1.sym
{
T 43000 47400 5 10 0 0 90 0 1
device=OUTPUT
T 43200 48050 5 10 1 1 0 3 1
refdes=Q
T 42800 47400 5 10 0 0 90 0 1
footprint=anchor
}
C 44400 47400 1 90 0 out-1.sym
{
T 44100 47400 5 10 0 0 90 0 1
device=OUTPUT
T 44300 48050 5 10 1 1 0 3 1
refdes=Q#
T 43900 47400 5 10 0 0 90 0 1
footprint=anchor
}
N 44300 47400 44300 46700 4
N 42300 46400 42600 46400 4
{
T 42400 46450 5 10 1 1 0 3 1
netname=g#
}
C 41500 46300 1 0 1 out-1.sym
{
T 41500 46600 5 10 0 0 0 6 1
device=OUTPUT
T 40900 46400 5 8 1 1 180 1 1
refdes=R
T 41500 46800 5 10 0 0 0 6 1
footprint=anchor
}
N 43200 47400 43200 46600 4
N 44900 46400 45200 46400 4
{
T 45050 46450 5 10 1 1 0 3 1
netname=g
}
C 45700 46300 1 0 0 out-1.sym
{
T 45700 46600 5 10 0 0 0 0 1
device=OUTPUT
T 46300 46400 5 10 1 1 0 1 1
refdes=S
T 45700 46800 5 10 0 0 0 0 1
footprint=anchor
}
C 40900 45900 1 0 0 in-1.sym
{
T 40900 46400 5 10 0 0 0 0 1
footprint=anchor
T 40900 46200 5 10 0 0 0 0 1
device=INPUT
T 40900 46000 5 10 1 1 0 7 1
refdes=C
}
C 40900 47100 1 0 0 in-1.sym
{
T 40900 47600 5 10 0 0 0 0 1
footprint=anchor
T 40900 47400 5 10 0 0 0 0 1
device=INPUT
T 40900 47225 5 10 1 1 0 7 1
refdes=Vdd
}
C 40900 45500 1 0 0 in-1.sym
{
T 40900 46000 5 10 0 0 0 0 1
footprint=anchor
T 40900 45800 5 10 0 0 0 0 1
device=INPUT
T 40900 45600 5 10 1 1 0 7 1
refdes=GND
}
N 42100 46000 42100 45400 4
N 42100 45400 45400 45400 4
N 45400 45400 45400 46000 4
N 43000 47100 43000 47200 4
N 44500 47100 44500 47200 4
N 43000 45600 43000 45700 4
N 44500 45600 44500 45700 4
N 41900 46400 41500 46400 4
C 41300 47200 1 0 0 vdd-1.sym
C 41400 45300 1 0 0 gnd-1.sym
C 42900 45300 1 0 0 gnd-1.sym
C 44400 45300 1 0 0 gnd-1.sym
C 42800 47200 1 0 0 vdd-1.sym
C 44300 47200 1 0 0 vdd-1.sym
N 45700 46400 45600 46400 4
N 41500 46000 42100 46000 4
N 44300 46700 44500 46700 4
C 43300 46500 1 0 0 resistor-pull.sym
{
T 43600 46900 5 10 0 0 0 0 1
device=RESISTOR
T 43950 46650 5 10 1 1 0 0 1
refdes=R1
T 43700 46600 5 10 0 1 0 0 1
footprint=0603-boxed
T 43700 46600 5 10 0 1 0 0 1
value=22k
}
C 43300 46100 1 0 0 resistor-pull.sym
{
T 43600 46500 5 10 0 0 0 0 1
device=RESISTOR
T 43950 46250 5 10 1 1 0 0 1
refdes=R2
T 43700 46200 5 10 0 1 0 0 1
footprint=0603-boxed
T 43700 46200 5 10 0 1 0 0 1
value=22k
}
