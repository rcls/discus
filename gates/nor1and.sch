v 20130925 2
C 38400 60300 1 0 0 2n7002.sym
{
T 38300 60700 5 10 1 1 0 0 1
refdes=M1
T 38500 61100 5 10 0 1 0 0 1
value=2N7002P
T 38900 60900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 39900 60900 5 10 0 1 0 0 1
device=NMOS
}
C 38400 59600 1 0 0 2n7002.sym
{
T 38300 60000 5 10 1 1 0 0 1
refdes=M3
T 38500 60400 5 10 0 1 0 0 1
value=2N7002P
T 38900 60200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 39900 60200 5 10 0 1 0 0 1
device=NMOS
}
C 39400 60000 1 0 1 2n7002.sym
{
T 39500 60400 5 10 1 1 0 6 1
refdes=M2
T 39300 60800 5 10 0 1 0 6 1
value=2N7002P
T 38900 60600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 37900 60600 5 10 0 1 0 6 1
device=NMOS
}
C 37800 60500 1 0 0 in-1.sym
{
T 37800 60800 5 10 0 0 0 0 1
device=INPUT
T 37650 60550 5 10 1 1 0 0 1
refdes=A
}
C 37800 59800 1 0 0 in-1.sym
{
T 37800 60100 5 10 0 0 0 0 1
device=INPUT
T 37650 59850 5 10 1 1 0 0 1
refdes=B
}
C 40000 60200 1 0 1 in-1.sym
{
T 40000 60500 5 10 0 0 0 6 1
device=INPUT
T 40200 60250 5 10 1 1 0 6 1
refdes=C
}
C 38900 62600 1 270 0 in-1.sym
{
T 39200 62600 5 10 0 0 270 0 1
device=INPUT
T 39100 62300 5 10 1 1 0 0 1
refdes=Vdd
}
C 39100 59100 1 90 0 in-1.sym
{
T 38800 59100 5 10 0 0 90 0 1
device=INPUT
T 38900 59400 5 10 1 1 180 0 1
refdes=GND
}
C 39000 61000 1 0 0 out-1.sym
{
T 39000 61300 5 10 0 0 0 0 1
device=OUTPUT
T 39600 61000 5 10 1 1 0 0 1
refdes=Q
}
C 39100 61100 1 90 0 resistor-load.sym
{
T 39000 61500 5 10 0 1 90 0 1
footprint=0603-boxed
T 38700 61400 5 10 0 0 90 0 1
device=RESISTOR
T 38850 61400 5 10 1 1 90 0 1
refdes=R
T 36800 63300 5 10 0 1 0 0 1
value=3k3
}
N 38800 60800 39000 60800 4
N 39000 60100 39000 59700 4
N 38800 60100 38800 60400 4
N 38800 59700 39000 59700 4
N 39000 61100 39000 60500 4
