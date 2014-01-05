v 20130925 2
C 38400 45800 1 0 0 nor.sym
{
T 38700 46250 5 10 1 1 0 0 1
refdes=N
}
C 38600 45500 1 0 0 gnd-1.sym
C 39100 46600 1 0 0 gnd-1.sym
N 38400 46400 38400 47100 4
N 38200 47100 38600 47100 4
N 38600 47700 38200 47700 4
N 38400 46200 38300 46200 4
N 38300 46200 38300 47700 4
C 37600 47600 1 0 0 in-1.sym
{
T 37600 47900 5 10 0 0 0 0 1
device=INPUT
T 37500 47650 5 10 1 1 0 0 1
refdes=A
}
C 37600 47000 1 0 0 in-1.sym
{
T 37600 47300 5 10 0 0 0 0 1
device=INPUT
T 37500 47050 5 10 1 1 0 0 1
refdes=B
}
C 38100 45700 1 0 0 in-1.sym
{
T 38100 46000 5 10 0 0 0 0 1
device=INPUT
T 38100 45750 5 10 1 1 0 6 1
refdes=GND
}
C 37600 46700 1 0 0 in-1.sym
{
T 37600 47000 5 10 0 0 0 0 1
device=INPUT
T 38000 46850 5 10 1 1 0 6 1
refdes=Vc
}
C 39200 47800 1 0 0 out-1.sym
{
T 39200 48100 5 10 0 0 0 0 1
device=OUTPUT
T 39800 47850 5 10 1 1 0 0 1
refdes=Q
}
C 39600 46200 1 0 0 out-1.sym
{
T 39600 46500 5 10 0 0 0 0 1
device=OUTPUT
T 40200 46250 5 10 1 1 0 0 1
refdes=C
}
N 38200 46800 38700 46800 4
C 38600 47400 1 0 0 2n7002.sym
{
T 38700 48200 5 10 0 1 0 0 1
value=2N7002P
T 39100 48000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 40100 48000 5 10 0 1 0 0 1
device=NMOS
T 38500 47800 5 10 1 1 0 0 1
refdes=M1
}
C 38600 46800 1 0 0 2n7002.sym
{
T 38700 47600 5 10 0 1 0 0 1
value=2N7002P
T 39100 47400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 40100 47400 5 10 0 1 0 0 1
device=NMOS
T 38500 47200 5 10 1 1 0 0 1
refdes=M3
}
C 39600 47100 1 0 1 2n7002.sym
{
T 39500 47900 5 10 0 1 0 6 1
value=2N7002P
T 39100 47700 5 10 0 1 0 6 1
footprint=sot23-nmos
T 38100 47700 5 10 0 1 0 6 1
device=NMOS
T 39700 47500 5 10 1 1 0 6 1
refdes=M2
}
N 39000 47900 39200 47900 4
N 39200 47200 39200 46900 4
N 39000 47300 39000 47500 4
N 39200 47900 39200 47600 4
N 39200 46900 39000 46900 4
N 39600 46300 39200 46300 4
N 39600 46300 39600 47400 4
