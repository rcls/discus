v 20130925 2
C 43400 63600 1 0 0 in-1.sym
{
T 43400 64100 5 10 0 0 0 0 1
footprint=anchor
T 43400 63900 5 10 0 0 0 0 1
device=INPUT
T 43625 63675 5 10 1 1 0 5 1
refdes=D
}
C 47200 63400 1 0 0 out-1.sym
{
T 47200 63900 5 10 0 0 0 0 1
footprint=anchor
T 47200 63700 5 10 0 0 0 0 1
device=OUTPUT
T 47400 63475 5 10 1 1 0 2 1
refdes=Q#
}
C 47200 63800 1 180 1 out-1.sym
{
T 47200 63300 5 10 0 0 180 6 1
footprint=anchor
T 47200 63500 5 10 0 0 180 6 1
device=OUTPUT
T 47600 63725 5 10 1 1 0 6 1
refdes=Q
}
C 46100 62000 1 90 0 in-1.sym
{
T 45600 62000 5 10 0 0 90 0 1
footprint=anchor
T 45800 62000 5 10 0 0 90 0 1
device=INPUT
T 46400 62300 5 10 1 1 180 0 1
refdes=GND
}
C 43400 63000 1 0 0 in-1.sym
{
T 43400 63500 5 10 0 0 0 0 1
footprint=anchor
T 43400 63300 5 10 0 0 0 0 1
device=INPUT
T 43625 63075 5 10 1 1 0 5 1
refdes=C
}
C 44000 62600 1 0 0 vdilatch.sym
{
T 45150 63050 5 10 1 1 0 0 1
refdes=A
T 44300 63250 5 10 1 1 0 0 1
source=vdilatch.sch
}
C 45600 62600 1 0 0 rslatch.sym
{
T 46750 63050 5 10 1 1 0 0 1
refdes=B
T 45900 63250 5 10 1 1 0 0 1
source=rslatch.sch
}
N 44800 64100 46400 64100 4
N 44800 62600 46400 62600 4
C 45500 64700 1 270 0 in-1.sym
{
T 46000 64700 5 10 0 0 270 0 1
footprint=anchor
T 45800 64700 5 10 0 0 270 0 1
device=INPUT
T 45600 64400 5 10 1 1 0 0 1
refdes=Vdd
}
N 45600 63100 45600 62500 4
N 45600 62500 44000 62500 4
N 44000 62500 44000 63100 4
