v 20201216 2
C 43200 63600 1 0 0 in-1.sym
{
T 43200 64100 5 10 0 0 0 0 1
footprint=anchor
T 43200 63900 5 10 0 0 0 0 1
device=INPUT
T 43200 63700 5 10 1 1 0 7 1
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
C 43200 62500 1 0 0 in-1.sym
{
T 43200 63000 5 10 0 0 0 0 1
footprint=anchor
T 43200 62800 5 10 0 0 0 0 1
device=INPUT
T 43200 62600 5 10 1 1 0 7 1
refdes=GND
}
C 43200 63000 1 0 0 in-1.sym
{
T 43200 63500 5 10 0 0 0 7 1
footprint=anchor
T 43200 63300 5 10 0 0 0 7 1
device=INPUT
T 43200 63100 5 10 1 1 0 7 1
refdes=C
}
C 44000 62600 1 0 0 dilatch.sym
{
T 44800 63300 5 10 1 1 0 4 1
source=dilatch.sch
T 45150 63050 5 10 1 1 0 0 1
refdes=A
}
C 45600 62600 1 0 0 rslatch.sym
{
T 46350 63300 5 10 1 1 0 4 1
source=rslatchs.sch
T 46750 63050 5 10 1 1 0 0 1
refdes=B
}
C 43200 64000 1 0 0 in-1.sym
{
T 43200 64500 5 10 0 0 0 0 1
footprint=anchor
T 43200 64300 5 10 0 0 0 0 1
device=INPUT
T 43200 64100 5 10 1 1 0 7 1
refdes=Vdd
}
N 45600 63100 45600 62400 4
N 45600 62400 44000 62400 4
N 44000 62400 44000 63100 4
C 46200 64100 1 0 0 vdd-1.sym
C 44600 64100 1 0 0 vdd-1.sym
C 43600 64100 1 0 0 vdd-1.sym
N 43800 63700 44000 63700 4
N 43800 63100 44000 63100 4
C 43700 62300 1 0 0 gnd-1.sym
C 44700 62300 1 0 0 gnd-1.sym
C 46300 62300 1 0 0 gnd-1.sym
