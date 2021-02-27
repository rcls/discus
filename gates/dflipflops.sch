v 20201216 2
C 43400 63600 1 0 0 in-1.sym
{
T 43400 64100 5 10 0 0 0 7 1
footprint=anchor
T 43400 63900 5 10 0 0 0 7 1
device=INPUT
T 43400 63700 5 10 1 1 0 7 1
refdes=D
}
C 47300 63400 1 0 0 out-1.sym
{
T 47300 63900 5 10 0 0 0 0 1
footprint=anchor
T 47300 63700 5 10 0 0 0 0 1
device=OUTPUT
T 47500 63475 5 10 1 1 0 2 1
refdes=Q#
}
C 47300 63800 1 180 1 out-1.sym
{
T 47300 63300 5 10 0 0 180 6 1
footprint=anchor
T 47300 63500 5 10 0 0 180 6 1
device=OUTPUT
T 47700 63725 5 10 1 1 0 6 1
refdes=Q
}
C 43400 62500 1 0 0 in-1.sym
{
T 43400 63000 5 10 0 0 0 0 1
footprint=anchor
T 43400 62800 5 10 0 0 0 0 1
device=INPUT
T 43400 62600 5 10 1 1 0 7 1
refdes=GND
}
C 45800 62500 1 90 0 in-1.sym
{
T 45300 62500 5 10 0 0 90 0 1
footprint=anchor
T 45500 62500 5 10 0 0 90 0 1
device=INPUT
T 45700 62500 5 10 1 1 0 5 1
refdes=C
}
C 45700 62600 1 0 0 sramcells.sym
{
T 46500 63300 5 10 1 1 0 4 1
source=sramcells.sch
T 46850 63050 5 10 1 1 0 0 1
refdes=B
}
C 43400 64000 1 0 0 in-1.sym
{
T 43400 64500 5 10 0 0 0 0 1
footprint=anchor
T 43400 64300 5 10 0 0 0 0 1
device=INPUT
T 43400 64100 5 10 1 1 0 7 1
refdes=Vdd
}
C 43800 64100 1 0 0 vdd-1.sym
C 44600 64100 1 0 0 vdd-1.sym
C 46300 64100 1 0 0 vdd-1.sym
C 43900 62300 1 0 0 gnd-1.sym
C 44700 62300 1 0 0 gnd-1.sym
C 46400 62300 1 0 0 gnd-1.sym
N 45700 63700 45600 63700 4
{
T 45650 63725 5 10 1 1 0 3 1
netname=S
}
N 45700 63500 45600 63500 4
{
T 45650 63475 5 10 1 1 0 5 1
netname=R
}
C 43400 63000 1 0 0 in-1.sym
{
T 43400 63500 5 10 0 0 0 0 1
footprint=anchor
T 43400 63300 5 10 0 0 0 0 1
device=INPUT
T 43400 63100 5 10 1 1 0 7 1
refdes=C#
}
C 44000 62600 1 0 0 dlatch.sym
{
T 45150 63050 5 10 1 1 0 0 1
refdes=A
T 44800 63325 5 10 1 1 0 4 1
source=dlatch.sch
}
