v 20130925 2
C 58900 46000 1 0 0 2n7002.sym
{
T 58800 46400 5 10 1 1 0 0 1
refdes=M1
T 59000 46800 5 10 0 1 0 0 1
value=2N7002P
T 59400 46600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 60400 46600 5 10 0 1 0 0 1
device=NMOS
}
C 60500 46000 1 0 1 2n7002.sym
{
T 60600 46100 5 10 1 1 0 6 1
refdes=M3
T 60400 46800 5 10 0 1 0 6 1
value=2N7002P
T 60000 46600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 59000 46600 5 10 0 1 0 6 1
device=NMOS
}
C 60200 47000 1 90 0 resistor-load.sym
{
T 60100 47400 5 10 0 1 90 0 1
footprint=0603-boxed
T 59800 47300 5 10 0 0 90 0 1
device=RESISTOR
T 59900 47400 5 10 1 1 90 0 1
refdes=R
T 60100 47400 5 10 0 1 0 0 1
value=3k3
}
C 61700 46700 1 0 1 in-1.sym
{
T 61700 47200 5 10 0 0 0 6 1
footprint=anchor
T 61700 47000 5 10 0 0 0 6 1
device=INPUT
T 61400 47000 5 10 1 1 180 6 1
refdes=C
}
C 58300 46200 1 0 0 in-1.sym
{
T 58300 46700 5 10 0 0 0 0 1
footprint=anchor
T 58300 46500 5 10 0 0 0 0 1
device=INPUT
T 58600 46500 5 10 1 1 180 0 1
refdes=A
}
C 60000 48500 1 270 0 in-1.sym
{
T 60500 48500 5 10 0 0 270 0 1
footprint=anchor
T 60300 48500 5 10 0 0 270 0 1
device=INPUT
T 60200 48300 5 10 1 1 270 0 1
refdes=Vdd
}
C 60100 46900 1 0 0 out-1.sym
{
T 60100 47400 5 10 0 0 0 0 1
footprint=anchor
T 60100 47200 5 10 0 0 0 0 1
device=OUTPUT
T 60300 47100 5 10 1 1 0 0 1
refdes=Q
}
N 60100 46500 60100 47000 4
C 59400 46000 1 0 0 2n7002.sym
{
T 59700 46300 5 10 1 1 0 0 1
refdes=M2
T 59500 46800 5 10 0 1 0 0 1
value=2N7002P
T 59900 46600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 60900 46600 5 10 0 1 0 0 1
device=NMOS
}
N 60100 45900 60100 46100 4
N 59300 46100 59300 45900 4
N 58900 45900 60700 45900 4
N 59800 46100 59800 45900 4
C 58300 46000 1 180 1 in-1.sym
{
T 58300 45500 5 10 0 0 180 6 1
footprint=anchor
T 58300 45700 5 10 0 0 0 2 1
device=INPUT
T 58400 46100 5 10 1 1 0 2 1
refdes=GND
}
N 59300 46500 59300 46700 4
N 59300 46700 60100 46700 4
N 59800 46500 59800 46700 4
N 59400 46300 59400 46800 4
N 59400 46800 58900 46800 4
C 58300 46700 1 0 0 in-1.sym
{
T 58300 47200 5 10 0 0 0 0 1
footprint=anchor
T 58300 47000 5 10 0 0 0 0 1
device=INPUT
T 58600 47000 5 10 1 1 180 0 1
refdes=B
}
N 60500 46800 60500 46300 4
C 61100 46000 1 0 1 2n7002.sym
{
T 61200 46100 5 10 1 1 0 6 1
refdes=M4
T 61000 46800 5 10 0 1 0 6 1
value=2N7002P
T 60600 46600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 59600 46600 5 10 0 1 0 6 1
device=NMOS
}
N 60700 45900 60700 46100 4
N 60700 46500 60700 46700 4
N 60700 46700 60100 46700 4
C 61700 46200 1 0 1 in-1.sym
{
T 61700 46700 5 10 0 0 0 6 1
footprint=anchor
T 61700 46500 5 10 0 0 0 6 1
device=INPUT
T 61400 46500 5 10 1 1 180 6 1
refdes=D
}
N 60500 46800 61100 46800 4
