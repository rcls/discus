v 20201216 2
C 9100 7600 1 0 0 dflipflop.sym
{
T 10450 8000 5 10 1 1 0 7 1
refdes=R
T 9900 8250 5 10 1 1 0 4 1
source=dflipflop.sch
}
C 7200 8200 1 0 0 in-1.sym
{
T 7200 8700 5 10 0 0 0 0 1
footprint=anchor
T 7200 8500 5 10 0 0 0 0 1
device=INPUT
T 7200 8300 5 10 1 1 0 7 1
refdes=PK
}
N 10700 8500 10900 8500 4
N 10900 8500 10900 7400 4
N 10900 7400 7800 7400 4
N 7800 7400 7800 8100 4
C 11900 8600 1 0 0 out-1.sym
{
T 11900 8900 5 10 0 0 0 0 1
device=OUTPUT
T 12250 8725 5 10 1 1 0 3 1
refdes=PE
T 11900 9100 5 10 0 0 0 0 1
footprint=anchor
}
C 7800 7700 1 0 0 norod.sym
{
T 8200 8200 5 10 1 1 0 4 1
refdes=F
}
C 8300 8200 1 0 0 nand.sym
{
T 8700 8700 5 10 1 1 0 4 1
refdes=S
}
C 7200 8500 1 0 0 in-1.sym
{
T 7200 9000 5 10 0 0 0 0 1
footprint=anchor
T 7200 8800 5 10 0 0 0 0 1
device=INPUT
T 7200 8600 5 10 1 1 0 7 1
refdes=RST#
}
N 7800 8600 8300 8600 4
C 8300 9700 1 0 1 not.sym
{
T 7950 10000 5 10 1 1 0 4 1
refdes=I
}
C 7500 8800 1 0 0 not.sym
{
T 7850 9100 5 10 1 1 0 4 1
refdes=J
}
C 8000 9400 1 0 1 gnd-1.sym
C 7800 8500 1 0 0 gnd-1.sym
C 8000 7400 1 0 0 gnd-1.sym
C 9800 7300 1 0 0 gnd-1.sym
C 9700 9100 1 0 0 vdd-1.sym
C 8400 9200 1 0 0 vdd-1.sym
C 7700 9400 1 0 0 vdd-1.sym
C 8100 10300 1 0 1 vdd-1.sym
N 8300 8800 8300 10000 4
C 8200 10600 1 270 0 in-1.sym
{
T 8500 10600 5 10 0 0 270 0 1
device=INPUT
T 8300 10600 5 10 1 1 0 3 1
refdes=RS#
T 8700 10600 5 10 0 0 270 0 1
footprint=anchor
}
C 7400 10600 1 270 0 in-1.sym
{
T 7700 10600 5 10 0 0 270 0 1
device=INPUT
T 7500 10600 5 10 1 1 0 3 1
refdes=RR#
T 7900 10600 5 10 0 0 270 0 1
footprint=anchor
}
C 11100 8400 1 0 0 cnot.sym
{
T 11425 8700 5 10 1 1 0 4 1
refdes=O
}
N 11100 8700 10700 8700 4
C 11400 8100 1 0 0 gnd-1.sym
C 11300 9000 1 0 0 vdd-1.sym
C 8800 8000 1 0 0 phi1.sym
C 11400 7600 1 0 0 in-1.sym
{
T 11400 8100 5 10 0 0 0 0 1
footprint=anchor
T 11400 7900 5 10 0 0 0 0 1
device=INPUT
T 11400 7700 5 10 1 1 0 7 1
refdes=ϕ1
}
C 12300 7600 1 0 1 phi1.sym
C 10400 9900 1 0 0 vdd-1.sym
C 10000 9800 1 0 0 in-1.sym
{
T 10000 10300 5 10 0 0 0 0 1
footprint=anchor
T 10000 10100 5 10 0 0 0 0 1
device=INPUT
T 10000 9900 5 10 1 1 0 7 1
refdes=Vdd
}
C 10500 9400 1 0 0 gnd-1.sym
C 10000 9600 1 0 0 in-1.sym
{
T 10000 10100 5 10 0 0 0 0 1
footprint=anchor
T 10000 9900 5 10 0 0 0 0 1
device=INPUT
T 10000 9700 5 10 1 1 0 7 1
refdes=GND
}
N 7500 9100 7500 10000 4
