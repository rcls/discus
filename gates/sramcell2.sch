v 20220529 2
N 47900 48600 47300 49200 4
N 47300 48600 47900 49200 4
N 47900 49200 48900 49200 4
{
T 48150 49250 5 10 1 1 0 3 1
netname=R
}
N 46300 49200 47300 49200 4
{
T 47050 49250 5 10 1 1 0 3 1
netname=L
}
C 49400 49600 1 90 1 pdtc124.sym
{
T 49100 49375 5 8 1 1 0 5 1
refdes=Q2
T 48900 48900 5 10 0 1 90 6 1
footprint=sot323-bjt
T 48700 49500 5 10 0 1 90 6 1
value=PDTC124TU
}
C 45800 49600 1 270 0 pdtc124.sym
{
T 46100 49375 5 8 1 1 0 5 1
refdes=Q1
T 46300 48900 5 10 0 1 270 0 1
footprint=sot323-bjt
T 46500 49500 5 10 0 1 270 0 1
value=PDTC124TU
}
N 46100 49600 46100 49800 4
N 46100 49800 49500 49800 4
N 49100 49800 49100 49600 4
C 49500 49100 1 0 0 out-1.sym
{
T 49500 49600 5 10 0 0 0 0 1
footprint=anchor
T 49500 49400 5 10 0 0 0 0 1
device=OUTPUT
T 50100 49200 5 10 1 1 0 1 1
refdes=WR
}
C 45700 49100 1 0 1 out-1.sym
{
T 45700 49600 5 10 0 0 0 6 1
footprint=anchor
T 45700 49400 5 10 0 0 0 6 1
device=OUTPUT
T 45100 49200 5 10 1 1 0 7 1
refdes=WL
}
C 50100 49700 1 0 1 in-1.sym
{
T 50100 50200 5 10 0 0 0 1 1
footprint=anchor
T 50100 50000 5 10 0 0 0 1 1
device=INPUT
T 50100 49800 5 10 1 1 0 1 1
refdes=WE
}
C 50100 48800 1 0 1 in-1.sym
{
T 50100 49300 5 10 0 0 0 6 1
footprint=anchor
T 50100 49100 5 10 0 0 0 6 1
device=INPUT
T 50100 48900 5 10 1 1 0 1 1
refdes=Vdd
}
C 45100 48800 1 0 1 out-1.sym
{
T 45100 49300 5 10 0 0 0 6 1
footprint=anchor
T 45100 49100 5 10 0 0 0 6 1
device=OUTPUT
T 44800 48900 5 10 1 1 0 5 1
refdes=RL
}
C 44500 48000 1 0 0 in-1.sym
{
T 44500 48500 5 10 0 0 0 0 1
footprint=anchor
T 44500 48300 5 10 0 0 0 0 1
device=INPUT
T 44800 48100 5 10 1 1 0 5 1
refdes=RE
}
C 50100 48200 1 0 1 in-1.sym
{
T 50100 48700 5 10 0 0 0 6 1
footprint=anchor
T 50100 48500 5 10 0 0 0 6 1
device=INPUT
T 50100 48300 5 10 1 1 0 1 1
refdes=GND
}
C 48200 48000 1 0 0 gnd-1.sym
C 46800 48000 1 0 0 gnd-1.sym
C 49400 48000 1 0 0 gnd-1.sym
C 49300 48900 1 0 0 vdd-1.sym
C 48100 48900 1 0 0 vdd-1.sym
C 46700 48900 1 0 0 vdd-1.sym
N 49500 49200 49300 49200 4
N 45700 49200 45900 49200 4
N 46500 48600 46500 49200 4
N 46200 48900 46500 48900 4
N 48700 48600 48700 49200 4
C 47900 48300 1 0 0 not.sym
{
T 48250 48600 5 10 1 1 0 4 1
refdes=J
}
C 47300 48300 1 0 1 not.sym
{
T 46950 48600 5 10 1 1 0 4 1
refdes=I
}
N 45100 48900 45800 48900 4
C 46400 48900 1 180 0 baw56.sym
{
T 46050 48300 5 10 1 1 0 2 1
refdes=D
T 45750 48100 5 10 0 1 180 0 1
model-name=baw56
T 45750 47700 5 10 0 1 180 0 1
footprint=sot323-baw56
}
C 45100 48000 1 0 0 resistor-load.sym
{
T 45400 48400 5 10 0 0 0 0 1
device=RESISTOR
T 45350 48100 5 10 1 1 0 8 1
refdes=R1
T 45300 48800 5 10 0 1 0 0 1
footprint=0603-load
T 45300 49000 5 10 0 1 0 0 1
value=rload
}
