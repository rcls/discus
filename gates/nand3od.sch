v 20201216 2
C 59200 46200 1 0 0 nmos-switch.sym
{
T 59425 46500 5 10 1 1 0 1 1
refdes=M1
T 59300 47000 5 10 0 1 0 0 1
value=NMOS_switch
T 59700 46800 5 10 0 1 0 0 1
footprint=sot23-nmos
T 60700 46800 5 10 0 1 0 0 1
device=NMOS
}
C 59200 44800 1 0 0 nmos-switch.sym
{
T 59425 45100 5 10 1 1 0 1 1
refdes=M3
T 59300 45600 5 10 0 1 0 0 1
value=NMOS_switch
T 59700 45400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 60700 45400 5 10 0 1 0 0 1
device=NMOS
}
C 58600 45000 1 0 0 in-1.sym
{
T 58600 45500 5 10 0 0 0 0 1
footprint=anchor
T 58600 45300 5 10 0 0 0 0 1
device=INPUT
T 58600 45100 5 10 1 1 0 7 1
refdes=C
}
C 58600 46400 1 0 0 in-1.sym
{
T 58600 46900 5 10 0 0 0 0 1
footprint=anchor
T 58600 46700 5 10 0 0 0 0 1
device=INPUT
T 58600 46500 5 10 1 1 0 7 1
refdes=A
}
C 59600 46700 1 0 0 out-1.sym
{
T 59600 47200 5 10 0 0 0 0 1
footprint=anchor
T 59600 47000 5 10 0 0 0 0 1
device=OUTPUT
T 60200 46800 5 10 1 1 0 1 1
refdes=Q
}
C 59200 45500 1 0 0 nmos-switch.sym
{
T 59425 45800 5 10 1 1 0 1 1
refdes=M2
T 59300 46300 5 10 0 1 0 0 1
value=NMOS_switch
T 59700 46100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 60700 46100 5 10 0 1 0 0 1
device=NMOS
}
N 59600 46300 59600 46000 4
C 60200 44900 1 180 0 in-1.sym
{
T 60200 44400 5 10 0 0 180 0 1
footprint=anchor
T 60200 44600 5 10 0 0 0 8 1
device=INPUT
T 60200 44800 5 10 1 1 0 1 1
refdes=GND
}
C 58600 45700 1 0 0 in-1.sym
{
T 58600 46200 5 10 0 0 0 0 1
footprint=anchor
T 58600 46000 5 10 0 0 0 0 1
device=INPUT
T 58600 45800 5 10 1 1 0 7 1
refdes=B
}
N 59600 45600 59600 45300 4
N 59600 46800 59600 46700 4
N 59600 44800 59600 44900 4
