v 20130925 2
C 38500 45800 1 0 0 nand.sym
{
T 38800 46250 5 10 1 1 0 0 1
refdes=N
}
C 39000 46700 1 0 0 nand1or.sym
{
T 39550 47150 5 10 1 1 0 0 1
refdes=O
}
C 38700 45500 1 0 0 gnd-1.sym
C 39500 46400 1 0 0 gnd-1.sym
N 39300 46300 39300 47000 4
N 38500 46400 38500 47300 4
N 38300 47300 39000 47300 4
N 39000 47500 38300 47500 4
N 38500 46200 38400 46200 4
N 38400 46200 38400 47500 4
C 37700 47400 1 0 0 in-1.sym
{
T 37700 47700 5 10 0 0 0 0 1
device=INPUT
T 37600 47450 5 10 1 1 0 0 1
refdes=A
}
C 37700 47200 1 0 0 in-1.sym
{
T 37700 47500 5 10 0 0 0 0 1
device=INPUT
T 37600 47250 5 10 1 1 0 0 1
refdes=B
}
C 38200 45700 1 0 0 in-1.sym
{
T 38200 46000 5 10 0 0 0 0 1
device=INPUT
T 38200 45750 5 10 1 1 0 6 1
refdes=GND
}
C 39000 47600 1 0 0 in-1.sym
{
T 39000 47900 5 10 0 0 0 0 1
device=INPUT
T 39000 47650 5 10 1 1 0 6 1
refdes=Vq
}
C 40000 47100 1 0 0 out-1.sym
{
T 40000 47400 5 10 0 0 0 0 1
device=OUTPUT
T 40600 47150 5 10 1 1 0 0 1
refdes=Q
}
C 39300 46200 1 0 0 out-1.sym
{
T 39300 46500 5 10 0 0 0 0 1
device=OUTPUT
T 39900 46250 5 10 1 1 0 0 1
refdes=C
}
C 37700 46700 1 0 0 in-1.sym
{
T 37700 47000 5 10 0 0 0 0 1
device=INPUT
T 38100 46850 5 10 1 1 0 6 1
refdes=Vc
}
N 38300 46800 38800 46800 4
