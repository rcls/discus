v 20130925 2
C 59700 46000 1 0 0 pdtc124.sym
{
T 60400 46500 5 10 0 1 0 0 1
footprint=sot323-bjt
T 59800 46700 5 10 0 1 0 0 1
value=PDTC124TU
T 59875 46400 5 10 1 1 0 6 1
refdes=Q
}
C 60500 46000 1 0 1 2n7002.sym
{
T 60400 46800 5 10 0 1 0 6 1
value=2N7002P
T 60000 46600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 59000 46600 5 10 0 1 0 6 1
device=NMOS
T 60325 46350 5 10 1 1 0 0 1
refdes=M
}
C 60200 46700 1 90 0 resistor-load.sym
{
T 60100 47100 5 10 0 1 90 0 1
footprint=0603-boxed
T 59800 47000 5 10 0 0 90 0 1
device=RESISTOR
T 60050 47350 5 10 1 1 0 6 1
refdes=R
T 60100 47100 5 10 0 1 0 0 1
value=3k3
}
C 60000 45500 1 270 1 in-1.sym
{
T 60500 45500 5 10 0 0 270 6 1
footprint=anchor
T 60300 45500 5 10 0 0 90 2 1
device=INPUT
T 60050 45900 5 8 1 1 90 6 1
refdes=GND
}
C 61100 46200 1 0 1 in-1.sym
{
T 61100 46700 5 10 0 0 0 6 1
footprint=anchor
T 61100 46500 5 10 0 0 0 6 1
device=INPUT
T 61100 46300 5 10 1 1 0 1 1
refdes=B
}
C 59100 46200 1 0 0 in-1.sym
{
T 59100 46700 5 10 0 0 0 0 1
footprint=anchor
T 59100 46500 5 10 0 0 0 0 1
device=INPUT
T 59100 46300 5 10 1 1 0 7 1
refdes=A
}
C 60000 48200 1 270 0 in-1.sym
{
T 60500 48200 5 10 0 0 270 0 1
footprint=anchor
T 60300 48200 5 10 0 0 270 0 1
device=INPUT
T 60150 48100 5 8 1 1 270 0 1
refdes=Vdd
}
C 60100 46600 1 0 0 out-1.sym
{
T 60100 47100 5 10 0 0 0 0 1
footprint=anchor
T 60100 46900 5 10 0 0 0 0 1
device=OUTPUT
T 60700 46700 5 10 1 1 0 1 1
refdes=O
}
N 60100 46500 60100 46700 4
