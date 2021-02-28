v 20201216 2
C 42700 45600 1 0 0 2n7002.sym
{
T 42925 45900 5 8 1 1 0 1 1
refdes=M2
T 42800 46400 5 8 0 1 0 0 1
value=2N7002P
T 43200 46200 5 8 0 1 0 0 1
footprint=sot23-nmos
T 44200 46200 5 8 0 1 0 0 1
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
C 42700 46600 1 0 0 BSS84.sym
{
T 42925 46900 5 8 1 1 0 1 1
refdes=M1
T 42800 47400 5 10 0 1 0 0 1
value=BSS84
T 43200 47200 5 10 0 1 0 0 1
footprint=sot23-pmos
T 44200 47200 5 10 0 1 0 0 1
device=PMOS
}
C 43400 46100 1 0 0 resistor-load.sym
{
T 43700 46500 5 8 0 0 0 0 1
device=RESISTOR
T 44050 46250 5 8 1 1 0 0 1
refdes=R2
T 43800 46200 5 8 0 1 0 0 1
footprint=0603-boxed
T 43800 46200 5 8 0 1 0 0 1
value=3.3k
}
C 42800 47800 1 90 1 pdtc124.sym
{
T 42500 47550 5 8 1 1 0 5 1
refdes=Q1
T 42300 47100 5 8 0 1 270 2 1
footprint=sot323-bjt
T 42100 47700 5 8 0 1 270 2 1
value=PDTC124TU
}
C 45500 46000 1 90 0 pdtc124.sym
{
T 45200 46250 5 8 1 1 0 3 1
refdes=Q3
T 45000 46700 5 8 0 1 90 0 1
footprint=sot323-bjt
T 44800 46100 5 8 0 1 90 0 1
value=PDTC124TU
}
C 41600 46000 1 270 1 pdtc124.sym
{
T 41900 46250 5 8 1 1 0 3 1
refdes=Q2
T 42100 46700 5 8 0 1 270 6 1
footprint=sot323-bjt
T 42300 46100 5 8 0 1 270 6 1
value=PDTC124TU
}
N 43100 46700 43100 46100 4
N 44500 46700 44500 46100 4
N 44900 45900 44900 46900 4
{
T 44925 46700 5 10 1 1 0 0 1
netname=gl
}
N 42700 46900 42700 45900 4
C 43300 46500 1 0 0 resistor-load.sym
{
T 43600 46900 5 8 0 0 0 0 1
device=RESISTOR
T 43950 46650 5 8 1 1 0 0 1
refdes=R1
T 43700 46600 5 8 0 1 0 0 1
footprint=0603-boxed
T 43700 46600 5 8 0 1 0 0 1
value=3.3k
}
N 42700 46200 43400 46200 4
N 44300 46200 44500 46200 4
N 44900 46600 44200 46600 4
N 43300 46600 43100 46600 4
C 43400 47400 1 90 0 out-1.sym
{
T 43100 47400 5 10 0 0 90 0 1
device=OUTPUT
T 43300 48050 5 10 1 1 0 3 1
refdes=QL
T 42900 47400 5 10 0 0 90 0 1
footprint=anchor
}
C 44400 47400 1 90 0 out-1.sym
{
T 44100 47400 5 10 0 0 90 0 1
device=OUTPUT
T 44300 48050 5 10 1 1 0 3 1
refdes=QR
T 43900 47400 5 10 0 0 90 0 1
footprint=anchor
}
N 44300 47400 44300 46200 4
N 42100 46400 42700 46400 4
{
T 42400 46450 5 10 1 1 0 3 1
netname=gr
}
C 41300 46300 1 0 1 out-1.sym
{
T 41300 46600 5 10 0 0 0 6 1
device=OUTPUT
T 40700 46400 5 8 1 1 180 1 1
refdes=WR
T 41300 46800 5 10 0 0 0 6 1
footprint=anchor
}
N 43300 47400 43300 46600 4
N 44900 46400 45000 46400 4
C 45500 46300 1 0 0 out-1.sym
{
T 45500 46600 5 10 0 0 0 0 1
device=OUTPUT
T 46100 46400 5 10 1 1 0 1 1
refdes=WL
T 45500 46800 5 10 0 0 0 0 1
footprint=anchor
}
C 41300 47300 1 0 1 out-1.sym
{
T 41300 47600 5 10 0 0 0 6 1
device=OUTPUT
T 40700 47400 5 10 1 1 0 7 1
refdes=RL
T 41300 47800 5 10 0 0 0 6 1
footprint=anchor
}
N 42700 47400 43300 47400 4
C 40700 47700 1 0 0 in-1.sym
{
T 40700 48200 5 10 0 0 0 0 1
footprint=anchor
T 40700 48000 5 10 0 0 0 0 1
device=INPUT
T 40700 47800 5 10 1 1 0 7 1
refdes=RE
}
C 40700 45900 1 0 0 in-1.sym
{
T 40700 46400 5 10 0 0 0 0 1
footprint=anchor
T 40700 46200 5 10 0 0 0 0 1
device=INPUT
T 40700 46000 5 10 1 1 0 7 1
refdes=WE
}
C 46100 47100 1 0 1 in-1.sym
{
T 46100 47600 5 10 0 0 0 6 1
footprint=anchor
T 46100 47400 5 10 0 0 0 6 1
device=INPUT
T 46100 47225 5 10 1 1 0 1 1
refdes=Vdd
}
C 46100 45500 1 0 1 in-1.sym
{
T 46100 46000 5 10 0 0 0 6 1
footprint=anchor
T 46100 45800 5 10 0 0 0 6 1
device=INPUT
T 46100 45600 5 10 1 1 0 1 1
refdes=GND
}
N 41900 46000 41900 45400 4
N 41900 45400 45200 45400 4
N 45200 45400 45200 46000 4
C 41300 47300 1 0 0 resistor-load.sym
{
T 41600 47700 5 10 0 0 0 0 1
device=RESISTOR
T 41550 47350 5 8 1 1 0 8 1
refdes=R3
T 41700 47400 5 10 0 1 0 0 1
footprint=0603-boxed
T 41700 47400 5 10 0 1 0 0 1
value=3.3k
}
N 43100 47100 43100 47200 4
N 44500 47100 44500 47200 4
N 43100 45600 43100 45700 4
N 44500 45600 44500 45700 4
N 41700 46400 41300 46400 4
C 45700 47200 1 0 1 vdd-1.sym
C 45600 45300 1 0 1 gnd-1.sym
C 43000 45300 1 0 0 gnd-1.sym
C 44400 45300 1 0 0 gnd-1.sym
C 42900 47200 1 0 0 vdd-1.sym
C 44300 47200 1 0 0 vdd-1.sym
N 41300 47800 42500 47800 4
N 42200 47400 42300 47400 4
N 45500 46400 45400 46400 4
N 41300 46000 41900 46000 4
