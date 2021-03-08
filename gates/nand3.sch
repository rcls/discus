v 20201216 2
C 59200 46200 1 0 0 nmos-switch.sym
{
T 59100 46600 5 10 1 1 0 0 1
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
T 59100 45200 5 10 1 1 0 0 1
refdes=M3
T 59300 45600 5 10 0 1 0 0 1
value=NMOS_switch
T 59700 45400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 60700 45400 5 10 0 1 0 0 1
device=NMOS
}
C 59700 46700 1 90 0 resistor-load.sym
{
T 59600 47100 5 10 0 1 90 0 1
footprint=0603-boxed
T 59300 47000 5 10 0 0 90 0 1
device=RESISTOR
T 59900 47100 5 10 1 1 90 0 1
refdes=R
T 59600 47100 5 10 0 1 0 0 1
value=rload
}
C 58600 45000 1 0 0 in-1.sym
{
T 58600 45500 5 10 0 0 0 0 1
footprint=anchor
T 58600 45300 5 10 0 0 0 0 1
device=INPUT
T 58900 45300 5 10 1 1 180 0 1
refdes=C
}
C 58600 46400 1 0 0 in-1.sym
{
T 58600 46900 5 10 0 0 0 0 1
footprint=anchor
T 58600 46700 5 10 0 0 0 0 1
device=INPUT
T 58900 46700 5 10 1 1 180 0 1
refdes=A
}
C 59000 47500 1 0 0 in-1.sym
{
T 59000 48000 5 10 0 0 0 0 1
footprint=anchor
T 59000 47800 5 10 0 0 0 0 1
device=INPUT
T 59200 47700 5 10 1 1 0 0 1
refdes=Vdd
}
C 59600 46600 1 0 0 out-1.sym
{
T 59600 47100 5 10 0 0 0 0 1
footprint=anchor
T 59600 46900 5 10 0 0 0 0 1
device=OUTPUT
T 59800 46800 5 10 1 1 0 0 1
refdes=Q
}
C 59200 45500 1 0 0 nmos-switch.sym
{
T 59500 45800 5 10 1 1 0 0 1
refdes=M2
T 59300 46300 5 10 0 1 0 0 1
value=NMOS_switch
T 59700 46100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 60700 46100 5 10 0 1 0 0 1
device=NMOS
}
N 59600 46300 59600 46000 4
C 60200 45000 1 180 0 in-1.sym
{
T 60200 44500 5 10 0 0 180 0 1
footprint=anchor
T 60200 44700 5 10 0 0 0 8 1
device=INPUT
T 60000 45100 5 10 1 1 0 8 1
refdes=GND
}
C 58600 45700 1 0 0 in-1.sym
{
T 58600 46200 5 10 0 0 0 0 1
footprint=anchor
T 58600 46000 5 10 0 0 0 0 1
device=INPUT
T 58900 46000 5 10 1 1 180 0 1
refdes=B
}
N 59600 45600 59600 45300 4
