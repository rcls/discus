v 20121123 2
C 45400 47000 1 0 0 in-1.sym
{
T 45400 47300 5 10 0 0 0 0 1
device=INPUT
T 45600 47200 5 10 1 1 0 0 1
refdes=L
}
C 45400 46600 1 0 0 in-1.sym
{
T 45400 46900 5 10 0 0 0 0 1
device=INPUT
T 45600 46500 5 10 1 1 0 0 1
refdes=R
}
C 45200 44700 1 0 0 in-1.sym
{
T 45200 45000 5 10 0 0 0 0 1
device=INPUT
T 45400 44900 5 10 1 1 0 0 1
refdes=D
}
C 46700 45700 1 90 0 in-1.sym
{
T 46400 45700 5 10 0 0 90 0 1
device=INPUT
T 46600 45900 5 10 1 1 90 0 1
refdes=C#
}
C 47600 47800 1 0 0 in-1.sym
{
T 47600 48100 5 10 0 0 0 0 1
device=INPUT
T 47600 48100 5 10 1 1 0 0 1
refdes=pinlabel
}
C 49600 47000 1 0 0 out-1.sym
{
T 49600 47300 5 10 0 0 0 0 1
device=OUTPUT
T 49700 47200 5 10 1 1 0 0 1
refdes=Q
}
C 49600 46800 1 0 0 out-1.sym
{
T 49600 47100 5 10 0 0 0 0 1
device=OUTPUT
T 49700 46700 5 10 1 1 0 0 1
refdes=Q#
}
N 47000 47100 46000 47100 4
N 46000 46700 47500 46700 4
C 45800 44500 1 0 0 not.sym
{
T 46050 44750 5 10 1 1 0 0 1
refdes=S2
}
C 45800 45300 1 0 0 2n7002.sym
{
T 46100 45500 5 10 1 1 0 0 1
refdes=M4
T 45900 46100 5 10 0 1 0 0 1
value=2N7002P
T 46300 45900 5 10 0 1 0 0 1
footprint=SOT23
T 47300 45900 5 10 0 1 0 0 1
device=NMOS
}
C 46600 45300 1 0 0 2n7002.sym
{
T 46900 45600 5 10 1 1 0 0 1
refdes=M3
T 46700 46100 5 10 0 1 0 0 1
value=2N7002P
T 47100 45900 5 10 0 1 0 0 1
footprint=SOT23
T 48100 45900 5 10 0 1 0 0 1
device=NMOS
}
N 45800 44800 45800 45600 4
N 46600 45600 46600 44800 4
C 46600 46000 1 0 0 2n7002.sym
{
T 46900 46300 5 10 1 1 0 0 1
refdes=M2
T 46700 46800 5 10 0 1 0 0 1
value=2N7002P
T 47100 46600 5 10 0 1 0 0 1
footprint=SOT23
T 48100 46600 5 10 0 1 0 0 1
device=NMOS
}
C 46600 46000 1 0 1 2n7002.sym
{
T 46300 46300 5 10 1 1 0 6 1
refdes=M1
T 46500 46800 5 10 0 1 0 6 1
value=2N7002P
T 46100 46600 5 10 0 1 0 6 1
footprint=SOT23
T 45100 46600 5 10 0 1 0 6 1
device=NMOS
}
N 46200 45800 46200 46100 4
N 46200 46500 46200 46700 4
N 47000 45800 47000 46100 4
N 47000 46500 47000 47100 4
C 48100 45900 1 90 0 in-1.sym
{
T 47800 45900 5 10 0 0 90 0 1
device=INPUT
T 48000 46100 5 10 1 1 90 0 1
refdes=C
}
C 47500 46400 1 0 0 pdtc114.sym
{
T 47600 47000 5 10 1 1 0 0 1
refdes=Q2
T 48200 46900 5 10 0 1 0 0 1
footprint=SC70
T 47600 47100 5 10 0 1 0 0 1
value=PDTC114TU
}
C 47000 46800 1 0 0 pdtc114.sym
{
T 47100 47400 5 10 1 1 0 0 1
refdes=Q1
T 47700 47300 5 10 0 1 0 0 1
footprint=SC70
T 47100 47500 5 10 0 1 0 0 1
value=PDTC114TU
}
N 47900 46900 48000 46900 4
N 47400 47300 48000 47300 4
N 48000 47300 48000 47100 4
N 47400 44500 47400 46900 4
N 47400 46400 47900 46400 4
N 47900 46400 47900 46500 4
N 46200 44500 47400 44500 4
N 48800 46000 48800 45800 4
N 48800 45800 47400 45800 4
N 46200 45400 46200 45200 4
N 46200 45200 47400 45200 4
N 47000 45400 47000 45200 4
C 48000 46000 1 0 0 latch.sym
{
T 49100 46500 5 10 1 1 0 0 1
refdes=S1
T 48400 46700 5 10 1 1 0 0 1
source=latch.sch
}
C 48000 45100 1 0 1 in-1.sym
{
T 48000 45400 5 10 0 0 0 6 1
device=INPUT
T 47500 45400 5 10 1 1 180 6 1
refdes=GND
}
