v 20201216 2
C 42600 45500 1 0 0 nmos-switch.sym
{
T 42825 45800 5 8 1 1 0 1 1
refdes=M1
T 42700 46300 5 8 0 1 0 0 1
value=NMOS_switch
T 43100 46100 5 8 0 1 0 0 1
footprint=sot23-nmos
T 44100 46100 5 8 0 1 0 0 1
device=NMOS
}
C 44700 45500 1 0 1 nmos-switch.sym
{
T 44475 45800 5 8 1 1 0 7 1
refdes=M2
T 44600 46300 5 8 0 1 0 6 1
value=NMOS_switch
T 44200 46100 5 8 0 1 0 6 1
footprint=sot23-nmos
T 43200 46100 5 8 0 1 0 6 1
device=NMOS
}
C 44700 46500 1 0 1 pmos-switch.sym
{
T 44475 46800 5 8 1 1 0 7 1
refdes=M3
T 44600 47300 5 10 0 1 0 6 1
value=PMOS_switch
T 44200 47100 5 10 0 1 0 6 1
footprint=sot23-pmos
T 43200 47100 5 10 0 1 0 6 1
device=PMOS
}
C 45400 46000 1 90 0 pdtc124.sym
{
T 45100 46250 5 8 1 1 0 3 1
refdes=Q2
T 44900 46700 5 8 0 1 90 0 1
footprint=sot323-bjt
T 44700 46100 5 8 0 1 90 0 1
value=PDTC124TU
}
C 41900 45900 1 270 1 pdtc124.sym
{
T 42200 46150 5 8 1 1 0 3 1
refdes=Q1
T 42400 46600 5 8 0 1 270 6 1
footprint=sot323-bjt
T 42600 46000 5 8 0 1 270 6 1
value=PDTC124TU
}
N 43000 46400 43000 46000 4
N 44300 46600 44300 46000 4
N 44700 45800 44700 46800 4
N 42600 45800 42600 46300 4
N 42600 46200 43400 46200 4
N 43000 46400 44700 46400 4
C 43400 46700 1 90 0 out-1.sym
{
T 43100 46700 5 10 0 0 90 0 1
device=OUTPUT
T 43300 47350 5 10 1 1 0 3 1
refdes=Q#
T 42900 46700 5 10 0 0 90 0 1
footprint=anchor
}
C 44100 46700 1 90 0 out-1.sym
{
T 43800 46700 5 10 0 0 90 0 1
device=OUTPUT
T 44000 47350 5 10 1 1 0 3 1
refdes=Q
T 43600 46700 5 10 0 0 90 0 1
footprint=anchor
}
N 44000 46600 44000 46700 4
N 42400 46300 42600 46300 4
{
T 42500 46350 5 10 1 1 0 3 1
netname=g
}
C 41900 46200 1 0 1 out-1.sym
{
T 41900 46500 5 10 0 0 0 6 1
device=OUTPUT
T 41300 46300 5 8 1 1 180 1 1
refdes=S
T 41900 46700 5 10 0 0 0 6 1
footprint=anchor
}
N 43300 46700 43300 46400 4
N 44700 46400 44900 46400 4
C 45400 46300 1 0 0 out-1.sym
{
T 45400 46600 5 10 0 0 0 0 1
device=OUTPUT
T 46000 46400 5 10 1 1 0 1 1
refdes=R
T 45400 46800 5 10 0 0 0 0 1
footprint=anchor
}
C 41300 45800 1 0 0 in-1.sym
{
T 41300 46300 5 10 0 0 0 0 1
footprint=anchor
T 41300 46100 5 10 0 0 0 0 1
device=INPUT
T 41300 45900 5 10 1 1 0 7 1
refdes=E
}
C 41300 47200 1 0 0 in-1.sym
{
T 41300 47700 5 10 0 0 0 0 1
footprint=anchor
T 41300 47500 5 10 0 0 0 0 1
device=INPUT
T 41300 47325 5 10 1 1 0 7 1
refdes=Vdd
}
C 41300 45400 1 0 0 in-1.sym
{
T 41300 45900 5 10 0 0 0 0 1
footprint=anchor
T 41300 45700 5 10 0 0 0 0 1
device=INPUT
T 41300 45500 5 10 1 1 0 7 1
refdes=GND
}
N 42200 45900 42200 45200 4
N 42200 45200 45100 45200 4
N 45100 45200 45100 46000 4
N 44300 47000 44300 47100 4
N 43000 45500 43000 45600 4
N 44300 45500 44300 45600 4
N 42000 46300 41900 46300 4
C 41700 47300 1 0 0 vdd-1.sym
C 41800 45200 1 0 0 gnd-1.sym
C 42900 45200 1 0 0 gnd-1.sym
C 44200 45200 1 0 0 gnd-1.sym
C 42800 47300 1 0 0 vdd-1.sym
C 44100 47100 1 0 0 vdd-1.sym
N 45400 46400 45300 46400 4
N 41900 45900 42200 45900 4
C 43100 46400 1 90 0 resistor-load.sym
{
T 42700 46700 5 10 0 0 90 0 1
device=RESISTOR
T 42950 47050 5 10 1 1 90 0 1
refdes=R1
T 43000 46800 5 10 0 1 90 0 1
footprint=0603-boxed
T 43000 46800 5 10 0 1 90 0 1
value=rload
}
C 43400 46100 1 0 0 resistor-load.sym
{
T 43700 46500 5 10 0 0 0 0 1
device=RESISTOR
T 43650 46175 5 10 1 1 0 8 1
refdes=R2
T 43800 46200 5 10 0 1 0 0 1
footprint=0603-boxed
T 43800 46200 5 10 0 1 0 0 1
value=rload
}
N 44000 46600 44300 46600 4
