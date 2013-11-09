v 20121123 2
C 46900 59200 1 0 1 2n7002.sym
{
T 47000 59300 5 10 1 1 0 6 1
refdes=M7
T 46800 60000 5 10 0 1 0 6 1
value=2N7002P
T 46400 59800 5 10 0 1 0 6 1
footprint=SOT23
T 45400 59800 5 10 0 1 0 6 1
device=NMOS
}
C 47300 59200 1 0 0 2n7002.sym
{
T 47200 59300 5 10 1 1 0 0 1
refdes=M8
T 47400 60000 5 10 0 1 0 0 1
value=2N7002P
T 47800 59800 5 10 0 1 0 0 1
footprint=SOT23
T 48800 59800 5 10 0 1 0 0 1
device=NMOS
}
C 46600 59900 1 90 0 resistor-1.sym
{
T 46200 60200 5 10 0 0 90 0 1
device=RESISTOR
T 46400 60200 5 10 1 1 90 0 1
refdes=R3
T 46600 59900 5 10 0 1 0 0 1
value=3k3
}
C 47800 59900 1 90 0 resistor-1.sym
{
T 47400 60200 5 10 0 0 90 0 1
device=RESISTOR
T 47600 60100 5 10 1 1 90 0 1
refdes=R4
T 47800 59900 5 10 0 1 0 0 1
value=3k3
}
N 46500 59000 47700 59000 4
N 47700 59000 47700 59300 4
N 46500 59300 46500 59000 4
C 45600 60900 1 0 0 in-1.sym
{
T 45600 61200 5 10 0 0 0 0 1
device=INPUT
T 45700 61100 5 10 1 1 0 0 1
refdes=STROBE
}
C 48300 59100 1 90 0 in-1.sym
{
T 48000 59100 5 10 0 0 90 0 1
device=INPUT
T 48400 59200 5 10 1 1 90 0 1
refdes=S#
}
C 46100 59100 1 90 0 in-1.sym
{
T 45800 59100 5 10 0 0 90 0 1
device=INPUT
T 46200 59300 5 10 1 1 90 0 1
refdes=R#
}
C 45500 60700 1 0 0 in-1.sym
{
T 45500 61000 5 10 0 0 0 0 1
device=INPUT
T 46000 61000 5 10 1 1 180 0 1
refdes=Vdd
}
C 47200 58400 1 90 0 in-1.sym
{
T 46900 58400 5 10 0 0 90 0 1
device=INPUT
T 47600 58600 5 10 1 1 180 0 1
refdes=GND
}
C 47000 59900 1 90 0 out-1.sym
{
T 46700 59900 5 10 0 0 90 0 1
device=OUTPUT
T 47000 60500 5 10 1 1 90 0 1
refdes=Q
}
C 47400 59900 1 90 0 out-1.sym
{
T 47100 59900 5 10 0 0 90 0 1
device=OUTPUT
T 47400 60500 5 10 1 1 90 0 1
refdes=Q#
}
N 47300 59500 46900 59900 4
N 46900 59900 46500 59900 4
N 46900 59500 47300 59900 4
N 47300 59900 47700 59900 4
N 47700 59700 47700 59900 4
N 46100 60800 47700 60800 4
N 46400 59700 46500 59700 4
N 46500 59700 46500 59900 4
N 47700 59700 47800 59700 4
N 46200 60100 46200 61000 4
N 46200 61000 48000 61000 4
N 48000 61000 48000 60100 4
C 45900 60100 1 270 0 2n7002.sym
{
T 45900 60000 5 10 1 1 0 0 1
refdes=M6
T 46700 60000 5 10 0 1 270 0 1
value=2N7002P
T 46500 59600 5 10 0 1 270 0 1
footprint=SOT23
T 46500 58600 5 10 0 1 270 0 1
device=NMOS
}
C 48300 60100 1 90 1 2n7002.sym
{
T 48200 60200 5 10 1 1 270 2 1
refdes=M9
T 47500 60000 5 10 0 1 270 2 1
value=2N7002P
T 47700 59600 5 10 0 1 270 2 1
footprint=SOT23
T 47700 58600 5 10 0 1 270 2 1
device=NMOS
}
