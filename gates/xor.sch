v 20201216 2
C 38400 45800 1 0 0 nor.sym
{
T 38700 46250 5 10 1 1 0 0 1
refdes=N
}
C 39000 46700 1 0 0 nor1and.sym
{
T 39550 47150 5 10 1 1 0 0 1
refdes=O
}
N 39200 46300 39200 47000 4
N 38400 46400 38400 47300 4
N 38200 47300 39000 47300 4
N 39000 47500 38200 47500 4
N 38400 46200 38300 46200 4
N 38300 46200 38300 47500 4
C 37600 47400 1 0 0 in-1.sym
{
T 37600 47900 5 10 0 0 0 0 1
footprint=anchor
T 37600 47700 5 10 0 0 0 0 1
device=INPUT
T 37500 47450 5 10 1 1 0 0 1
refdes=A
}
C 37600 47200 1 0 0 in-1.sym
{
T 37600 47700 5 10 0 0 0 0 1
footprint=anchor
T 37600 47500 5 10 0 0 0 0 1
device=INPUT
T 37500 47250 5 10 1 1 0 0 1
refdes=B
}
C 38100 45700 1 0 0 in-1.sym
{
T 38100 46200 5 10 0 0 0 0 1
footprint=anchor
T 38100 46000 5 10 0 0 0 0 1
device=INPUT
T 38100 45750 5 10 1 1 0 6 1
refdes=GC
}
C 37600 46700 1 0 0 in-1.sym
{
T 37600 47200 5 10 0 0 0 0 1
footprint=anchor
T 37600 47000 5 10 0 0 0 0 1
device=INPUT
T 38000 46850 5 10 1 1 0 6 1
refdes=Vdd
}
C 40000 47100 1 0 0 out-1.sym
{
T 40000 47600 5 10 0 0 0 0 1
footprint=anchor
T 40000 47400 5 10 0 0 0 0 1
device=OUTPUT
T 40600 47150 5 10 1 1 0 0 1
refdes=Q
}
C 39200 46200 1 0 0 out-1.sym
{
T 39200 46700 5 10 0 0 0 0 1
footprint=anchor
T 39200 46500 5 10 0 0 0 0 1
device=OUTPUT
T 39800 46250 5 10 1 1 0 0 1
refdes=C
}
N 38200 46800 38700 46800 4
C 39400 47700 1 0 0 vdd-1.sym
C 38500 46800 1 0 0 vdd-1.sym
C 39600 46600 1 0 0 out-1.sym
{
T 39600 47100 5 10 0 0 0 0 1
footprint=anchor
T 39600 46900 5 10 0 0 0 0 1
device=OUTPUT
T 40200 46650 5 10 1 1 0 0 1
refdes=GQ
}
