v 20130925 2
C 26300 44700 1 0 0 nand.sym
{
T 26700 45200 5 10 1 1 0 4 1
refdes=P
}
C 28500 44700 1 0 1 nand1or.sym
{
T 27850 45200 5 10 1 1 0 4 1
refdes=N
}
C 25500 45000 1 0 0 not.sym
{
T 25850 45300 5 10 1 1 0 4 1
refdes=I
}
C 26500 44400 1 0 0 gnd-1.sym
C 27800 44400 1 0 0 gnd-1.sym
C 25700 45600 1 0 0 vdd-1.sym
C 26400 45700 1 0 0 vdd-1.sym
C 27700 45700 1 0 0 vdd-1.sym
C 27200 45200 1 90 0 out-1.sym
{
T 26900 45200 5 10 0 0 90 0 1
device=OUTPUT
T 27100 45800 5 10 1 1 0 3 1
refdes=Q
T 26700 45200 5 10 0 0 90 0 1
footprint=anchor
}
C 24700 45200 1 0 0 in-1.sym
{
T 24700 45500 5 10 0 0 0 0 1
device=INPUT
T 24700 45300 5 10 1 1 0 7 1
refdes=D
T 24700 45700 5 10 0 0 0 0 1
footprint=anchor
}
N 25300 45300 25500 45300 4
{
T 25400 45300 5 10 1 1 0 3 1
netname=D
}
N 28500 45500 28700 45500 4
{
T 28700 45500 5 10 1 1 0 1 1
netname=D
}
C 24700 44900 1 0 0 in-1.sym
{
T 24700 45200 5 10 0 0 0 0 1
device=INPUT
T 24700 45000 5 10 1 1 0 7 1
refdes=E#
T 24700 45400 5 10 0 0 0 0 1
footprint=anchor
}
N 25300 45000 25900 45000 4
{
T 25400 45000 5 10 1 1 0 5 1
netname=E#
}
N 26300 45100 26300 44500 4
N 26300 44500 26900 44500 4
N 26900 44500 27500 45200 4
N 27100 45200 27700 44500 4
N 27700 44500 28200 44500 4
N 28200 44500 28200 45000 4
N 28500 45300 28700 45300 4
{
T 28700 45300 5 10 1 1 0 1 1
netname=E#
}
C 27600 45200 1 90 0 out-1.sym
{
T 27300 45200 5 10 0 0 90 0 1
device=OUTPUT
T 27500 45800 5 10 1 1 0 3 1
refdes=Q#
T 27100 45200 5 10 0 0 90 0 1
footprint=anchor
}
C 24900 45500 1 0 0 in-1.sym
{
T 24900 45800 5 10 0 0 0 0 1
device=INPUT
T 24900 45600 5 10 1 1 0 7 1
refdes=Vdd
T 24900 46000 5 10 0 0 0 0 1
footprint=anchor
}
N 25500 45600 25900 45600 4
C 25800 44400 1 0 0 gnd-1.sym
C 24900 44600 1 0 0 in-1.sym
{
T 24900 44900 5 10 0 0 0 0 1
device=INPUT
T 24900 44700 5 10 1 1 0 7 1
refdes=GND
T 24900 45100 5 10 0 0 0 0 1
footprint=anchor
}
N 25500 44700 25900 44700 4