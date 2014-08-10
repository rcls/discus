v 20130925 2
C 38700 42500 1 0 0 sramcell.sym
{
T 40050 42950 5 10 1 1 0 6 1
refdes=L0
T 39000 43150 5 10 1 1 0 0 1
source=sramcell.sch
}
C 40800 42500 1 0 0 sramcell.sym
{
T 42150 42950 5 10 1 1 0 6 1
refdes=L1
T 41100 43150 5 10 1 1 0 0 1
source=sramcell.sch
}
C 42900 42500 1 0 0 sramcell.sym
{
T 44250 42950 5 10 1 1 0 6 1
refdes=L2
T 43200 43150 5 10 1 1 0 0 1
source=sramcell.sch
}
C 45000 42500 1 0 0 sramcell.sym
{
T 46350 42950 5 10 1 1 0 6 1
refdes=L3
T 45300 43150 5 10 1 1 0 0 1
source=sramcell.sch
}
N 39500 42500 45800 42500 4
N 39500 43900 45800 43900 4
C 38100 42900 1 0 0 in-1.sym
{
T 38100 43400 5 10 0 0 0 0 1
footprint=anchor
T 38100 43200 5 10 0 0 0 0 1
device=INPUT
T 38450 43150 5 10 1 1 180 0 1
refdes=S0
}
C 40200 42900 1 0 0 in-1.sym
{
T 40200 43400 5 10 0 0 0 0 1
footprint=anchor
T 40200 43200 5 10 0 0 0 0 1
device=INPUT
T 40550 43150 5 10 1 1 180 0 1
refdes=S1
}
C 42300 42900 1 0 0 in-1.sym
{
T 42300 43400 5 10 0 0 0 0 1
footprint=anchor
T 42300 43200 5 10 0 0 0 0 1
device=INPUT
T 42650 43150 5 10 1 1 180 0 1
refdes=S2
}
C 44400 42900 1 0 0 in-1.sym
{
T 44400 43400 5 10 0 0 0 0 1
footprint=anchor
T 44400 43200 5 10 0 0 0 0 1
device=INPUT
T 44750 43150 5 10 1 1 180 0 1
refdes=S3
}
C 42500 42200 1 0 0 gnd-1.sym
N 40300 43400 40300 44100 4
N 40300 44100 46600 44100 4
N 46600 44100 46600 43400 4
N 38700 43400 38700 44000 4
N 38700 44000 45000 44000 4
N 45000 44000 45000 43400 4
N 44500 43400 44500 44100 4
N 42900 43400 42900 44000 4
N 42400 43400 42400 44100 4
N 40800 43400 40800 44000 4
N 39500 43900 39500 44100 4
C 42600 46000 1 0 1 pdtc124.sym
{
T 42425 46100 5 10 1 1 0 0 1
refdes=Q3
T 41900 46500 5 10 0 1 0 6 1
footprint=sot323-bjt
T 42500 46700 5 10 0 1 0 6 1
value=PDTC124TU
}
C 42600 46600 1 0 1 2n7002.sym
{
T 42375 46900 5 10 1 1 0 7 1
refdes=M5
T 42500 47400 5 10 0 1 0 6 1
value=2N7002P
T 42100 47200 5 10 0 1 0 6 1
footprint=sot23-nmos
T 41100 47200 5 10 0 1 0 6 1
device=NMOS
}
C 41200 45700 1 0 0 gnd-1.sym
N 42200 46700 42200 46500 4
C 39900 46600 1 0 0 2n7002.sym
{
T 40100 46900 5 10 1 1 0 1 1
refdes=M1
T 40000 47400 5 10 0 1 0 0 1
value=2N7002P
T 40400 47200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 41400 47200 5 10 0 1 0 0 1
device=NMOS
}
C 39900 46000 1 0 0 2n7002.sym
{
T 40100 46300 5 10 1 1 0 1 1
refdes=M2
T 40000 46800 5 10 0 1 0 0 1
value=2N7002P
T 40400 46600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 41400 46600 5 10 0 1 0 0 1
device=NMOS
}
N 40300 46500 40300 46700 4
C 43200 46800 1 0 1 in-1.sym
{
T 43200 47300 5 10 0 0 0 6 1
footprint=anchor
T 43200 47100 5 10 0 0 0 6 1
device=INPUT
T 43200 46900 5 10 1 1 180 7 1
refdes=Ret
}
C 39300 46200 1 0 0 in-1.sym
{
T 39300 46700 5 10 0 0 0 0 1
footprint=anchor
T 39300 46500 5 10 0 0 0 0 1
device=INPUT
T 39650 46450 5 10 1 1 180 0 1
refdes=Inc
}
N 40300 46000 42200 46000 4
N 40300 47200 43700 47200 4
N 39100 46900 39900 46900 4
N 42600 46300 42900 46300 4
N 42900 46300 42900 44100 4
N 39100 46900 39100 45300 4
N 39100 45300 39700 45300 4
C 39700 45000 1 0 0 not.sym
{
T 39950 45250 5 10 1 1 0 0 1
refdes=I1
}
C 41300 45000 1 0 0 not.sym
{
T 41550 45250 5 10 1 1 0 0 1
refdes=I2
}
N 40500 45300 41300 45300 4
N 40100 45600 41700 45600 4
C 39500 45500 1 0 0 in-1.sym
{
T 39500 46000 5 10 0 0 0 0 1
footprint=anchor
T 39500 45800 5 10 0 0 0 0 1
device=INPUT
T 40100 45800 5 10 1 1 180 0 1
refdes=Vpush
}
C 40000 44700 1 0 0 gnd-1.sym
C 41600 44700 1 0 0 gnd-1.sym
C 40200 44900 1 270 0 pdtc124.sym
{
T 40800 44800 5 10 1 1 270 0 1
refdes=Q1
T 40700 44200 5 10 0 1 270 0 1
footprint=sot323-bjt
T 40900 44800 5 10 0 1 270 0 1
value=PDTC124TU
}
C 41800 44900 1 270 0 pdtc124.sym
{
T 42400 44800 5 10 1 1 270 0 1
refdes=Q2
T 42300 44200 5 10 0 1 270 0 1
footprint=sot323-bjt
T 42500 44800 5 10 0 1 270 0 1
value=PDTC124TU
}
N 40500 45300 40500 44900 4
C 40200 44200 1 0 0 gnd-1.sym
C 41800 44200 1 0 0 gnd-1.sym
N 42300 44500 42300 44100 4
C 41500 46600 1 0 0 2n7002.sym
{
T 41600 47400 5 10 0 1 0 0 1
value=2N7002P
T 42000 47200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 43000 47200 5 10 0 1 0 0 1
device=NMOS
T 41700 46900 5 10 1 1 0 1 1
refdes=M3
}
C 41500 46000 1 0 0 2n7002.sym
{
T 41600 46800 5 10 0 1 0 0 1
value=2N7002P
T 42000 46600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 43000 46600 5 10 0 1 0 0 1
device=NMOS
T 41700 46300 5 10 1 1 0 1 1
refdes=M4
}
N 41900 46500 41900 46700 4
N 40300 46000 40300 46100 4
N 41900 46100 41900 46000 4
N 42200 46000 42200 46100 4
N 40300 47100 40300 47200 4
N 41900 47200 41900 47100 4
N 42200 47100 42200 47200 4
C 40900 46200 1 0 0 in-1.sym
{
T 40900 46700 5 10 0 0 0 0 1
footprint=anchor
T 40900 46500 5 10 0 0 0 0 1
device=INPUT
T 40850 46350 5 10 1 1 180 0 1
refdes=Jmp
}
C 40900 46800 1 0 0 in-1.sym
{
T 40900 47300 5 10 0 0 0 0 1
footprint=anchor
T 40900 47100 5 10 0 0 0 0 1
device=INPUT
T 40850 46950 5 10 1 1 180 0 1
refdes=V
}
C 44400 45800 1 0 0 gnd-1.sym
C 43100 46500 1 0 0 in-1.sym
{
T 43100 47000 5 10 0 0 0 0 1
footprint=anchor
T 43100 46800 5 10 0 0 0 0 1
device=INPUT
T 43100 46600 5 10 1 1 0 7 1
refdes=ϕ1
}
C 38500 46800 1 0 0 in-1.sym
{
T 38500 47300 5 10 0 0 0 0 1
footprint=anchor
T 38500 47100 5 10 0 0 0 0 1
device=INPUT
T 38450 46950 5 10 1 1 180 0 1
refdes=A
}
N 40700 44500 40700 44000 4
N 42100 44900 42100 45300 4
C 43900 47500 1 0 0 in-1.sym
{
T 43900 48000 5 10 0 0 0 0 1
footprint=anchor
T 43900 47800 5 10 0 0 0 0 1
device=INPUT
T 44350 47750 5 10 1 1 180 0 1
refdes=Vdd
}
C 43700 46100 1 0 0 vdflipflop.sym
{
T 43975 46725 5 10 1 1 0 0 1
source=vdflipflop.sch
T 44750 46500 5 10 1 1 0 0 1
refdes=F
}
C 39300 44100 1 0 0 vdd-1.sym
C 44300 47600 1 0 0 vdd-1.sym
C 41400 47200 1 90 0 resistor-load.sym
{
T 41000 47500 5 10 0 0 90 0 1
device=RESISTOR
T 41200 47600 5 10 1 1 90 0 1
refdes=R
T 41300 47600 5 10 0 1 90 0 1
footprint=0603-boxed
T 41300 47600 5 10 0 1 90 0 1
value=3.3k
}
C 41100 48100 1 0 0 vdd-1.sym
N 45300 46200 45300 47000 4
C 45300 46900 1 0 0 cnot.sym
{
T 45525 47200 5 10 1 1 0 1 1
refdes=I3
}
C 45300 45900 1 0 0 cnot.sym
{
T 45525 46200 5 10 1 1 0 1 1
refdes=I4
}
C 45600 46600 1 0 0 gnd-1.sym
C 45600 45600 1 0 0 gnd-1.sym
C 45500 47500 1 0 0 vdd-1.sym
C 45500 46500 1 0 0 vdd-1.sym
C 46100 47100 1 0 0 out-1.sym
{
T 46100 47600 5 10 0 0 0 0 1
footprint=anchor
T 46100 47400 5 10 0 0 0 0 1
device=OUTPUT
T 46375 47225 5 10 1 1 0 0 1
refdes=P
}
C 46100 46100 1 0 0 out-1.sym
{
T 46100 46600 5 10 0 0 0 0 1
footprint=anchor
T 46100 46400 5 10 0 0 0 0 1
device=OUTPUT
T 46375 46225 5 10 1 1 0 0 1
refdes=P#
}
C 43900 46000 1 0 0 in-1.sym
{
T 43900 46500 5 10 0 0 0 0 1
footprint=anchor
T 43900 46300 5 10 0 0 0 0 1
device=INPUT
T 44200 46100 5 10 1 1 0 5 1
refdes=GND
}
C 45400 47200 1 90 0 out-1.sym
{
T 44900 47200 5 10 0 0 90 0 1
footprint=anchor
T 45100 47200 5 10 0 0 90 0 1
device=OUTPUT
T 45300 47800 5 10 1 1 0 3 1
refdes=Q#
}
C 45200 46200 1 270 0 out-1.sym
{
T 45700 46200 5 10 0 0 270 0 1
footprint=anchor
T 45500 46200 5 10 0 0 270 0 1
device=OUTPUT
T 45300 45600 5 10 1 1 0 5 1
refdes=Q
}
