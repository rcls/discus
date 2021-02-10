v 20201216 2
C 7800 8800 1 0 0 sramcell.sym
{
T 8600 9525 5 10 1 1 0 4 1
source=sramcell.sch
T 8950 9250 5 10 1 1 0 0 1
refdes=S0
}
C 9800 8800 1 0 0 sramcell.sym
{
T 10600 9525 5 10 1 1 0 4 1
source=sramcell.sch
T 10950 9250 5 10 1 1 0 0 1
refdes=S1
}
C 11800 8800 1 0 0 sramcell.sym
{
T 12600 9525 5 10 1 1 0 4 1
source=sramcell.sch
T 12950 9250 5 10 1 1 0 0 1
refdes=S2
}
C 13800 8800 1 0 0 sramcell.sym
{
T 14600 9525 5 10 1 1 0 4 1
source=sramcell.sch
T 14950 9250 5 10 1 1 0 0 1
refdes=S3
}
C 7800 6300 1 0 0 sramcell.sym
{
T 8600 7025 5 10 1 1 0 4 1
source=sramcell.sch
T 8950 6750 5 10 1 1 0 0 1
refdes=S4
}
C 9800 6300 1 0 0 sramcell.sym
{
T 10600 7025 5 10 1 1 0 4 1
source=sramcell.sch
T 10950 6750 5 10 1 1 0 0 1
refdes=S5
}
C 11800 6300 1 0 0 sramcell.sym
{
T 12600 7025 5 10 1 1 0 4 1
source=sramcell.sch
T 12950 6750 5 10 1 1 0 0 1
refdes=S6
}
C 13800 6300 1 0 0 sramcell.sym
{
T 14600 7025 5 10 1 1 0 4 1
source=sramcell.sch
T 14950 6750 5 10 1 1 0 0 1
refdes=S7
}
C 8400 10200 1 0 0 vdd-1.sym
C 10400 10200 1 0 0 vdd-1.sym
C 12400 10200 1 0 0 vdd-1.sym
C 14400 10200 1 0 0 vdd-1.sym
C 8400 7700 1 0 0 vdd-1.sym
C 10400 7700 1 0 0 vdd-1.sym
C 12400 7700 1 0 0 vdd-1.sym
C 14400 7700 1 0 0 vdd-1.sym
C 8500 8500 1 0 0 gnd-1.sym
C 10500 8500 1 0 0 gnd-1.sym
C 12500 8500 1 0 0 gnd-1.sym
C 14500 8500 1 0 0 gnd-1.sym
C 7500 7500 1 90 0 resistor-load.sym
{
T 7100 7800 5 10 0 0 90 0 1
device=RESISTOR
T 7200 7900 5 10 1 1 90 0 1
refdes=R
T 7400 7900 5 10 0 1 90 0 1
footprint=0603-boxed
T 7400 7900 5 10 0 1 90 0 1
value=3.3k
}
C 7300 9600 1 270 0 in-1.sym
{
T 7800 9600 5 10 0 0 270 0 1
footprint=anchor
T 7600 9600 5 10 0 0 270 0 1
device=INPUT
T 7400 9600 5 10 1 1 0 3 1
refdes=SEL
}
C 6400 8600 1 0 0 in-1.sym
{
T 6400 9100 5 10 0 0 0 0 1
footprint=anchor
T 6400 8900 5 10 0 0 0 0 1
device=INPUT
T 6725 8675 5 10 1 1 0 5 1
refdes=SEL#
}
C 7300 7200 1 0 0 gnd-1.sym
C 7700 10300 1 270 0 in-1.sym
{
T 8200 10300 5 10 0 0 270 0 1
footprint=anchor
T 8000 10300 5 10 0 0 270 0 1
device=INPUT
T 7800 10300 5 10 1 1 0 3 1
refdes=L0
}
C 9300 10300 1 270 0 in-1.sym
{
T 9800 10300 5 10 0 0 270 0 1
footprint=anchor
T 9600 10300 5 10 0 0 270 0 1
device=INPUT
T 9400 10300 5 10 1 1 0 3 1
refdes=R0
}
C 9700 10300 1 270 0 in-1.sym
{
T 10200 10300 5 10 0 0 270 0 1
footprint=anchor
T 10000 10300 5 10 0 0 270 0 1
device=INPUT
T 9800 10300 5 10 1 1 0 3 1
refdes=L1
}
C 11300 10300 1 270 0 in-1.sym
{
T 11800 10300 5 10 0 0 270 0 1
footprint=anchor
T 11600 10300 5 10 0 0 270 0 1
device=INPUT
T 11400 10300 5 10 1 1 0 3 1
refdes=R1
}
C 11700 10300 1 270 0 in-1.sym
{
T 12200 10300 5 10 0 0 270 0 1
footprint=anchor
T 12000 10300 5 10 0 0 270 0 1
device=INPUT
T 11800 10300 5 10 1 1 0 3 1
refdes=L2
}
C 13300 10300 1 270 0 in-1.sym
{
T 13800 10300 5 10 0 0 270 0 1
footprint=anchor
T 13600 10300 5 10 0 0 270 0 1
device=INPUT
T 13400 10300 5 10 1 1 0 3 1
refdes=R2
}
C 13700 10300 1 270 0 in-1.sym
{
T 14200 10300 5 10 0 0 270 0 1
footprint=anchor
T 14000 10300 5 10 0 0 270 0 1
device=INPUT
T 13800 10300 5 10 1 1 0 3 1
refdes=L3
}
C 15300 10300 1 270 0 in-1.sym
{
T 15800 10300 5 10 0 0 270 0 1
footprint=anchor
T 15600 10300 5 10 0 0 270 0 1
device=INPUT
T 15400 10300 5 10 1 1 0 3 1
refdes=R3
}
C 7700 7800 1 270 0 in-1.sym
{
T 8200 7800 5 10 0 0 270 0 1
footprint=anchor
T 8000 7800 5 10 0 0 270 0 1
device=INPUT
T 7800 7800 5 10 1 1 0 3 1
refdes=L4
}
C 9300 7800 1 270 0 in-1.sym
{
T 9800 7800 5 10 0 0 270 0 1
footprint=anchor
T 9600 7800 5 10 0 0 270 0 1
device=INPUT
T 9400 7800 5 10 1 1 0 3 1
refdes=R4
}
C 9700 7800 1 270 0 in-1.sym
{
T 10200 7800 5 10 0 0 270 0 1
footprint=anchor
T 10000 7800 5 10 0 0 270 0 1
device=INPUT
T 9800 7800 5 10 1 1 0 3 1
refdes=L5
}
C 11300 7800 1 270 0 in-1.sym
{
T 11800 7800 5 10 0 0 270 0 1
footprint=anchor
T 11600 7800 5 10 0 0 270 0 1
device=INPUT
T 11400 7800 5 10 1 1 0 3 1
refdes=R5
}
C 11700 7800 1 270 0 in-1.sym
{
T 12200 7800 5 10 0 0 270 0 1
footprint=anchor
T 12000 7800 5 10 0 0 270 0 1
device=INPUT
T 11800 7800 5 10 1 1 0 3 1
refdes=L6
}
C 13300 7800 1 270 0 in-1.sym
{
T 13800 7800 5 10 0 0 270 0 1
footprint=anchor
T 13600 7800 5 10 0 0 270 0 1
device=INPUT
T 13400 7800 5 10 1 1 0 3 1
refdes=R6
}
C 13700 7800 1 270 0 in-1.sym
{
T 14200 7800 5 10 0 0 270 0 1
footprint=anchor
T 14000 7800 5 10 0 0 270 0 1
device=INPUT
T 13800 7800 5 10 1 1 0 3 1
refdes=L7
}
C 15300 7800 1 270 0 in-1.sym
{
T 15800 7800 5 10 0 0 270 0 1
footprint=anchor
T 15600 7800 5 10 0 0 270 0 1
device=INPUT
T 15400 7800 5 10 1 1 0 3 1
refdes=R7
}
N 7800 9300 7800 8400 4
N 7400 8400 13800 8400 4
{
T 8000 8400 5 10 1 1 0 0 1
netname=S
}
N 13800 8400 13800 9300 4
C 8500 6000 1 0 0 gnd-1.sym
C 10500 6000 1 0 0 gnd-1.sym
C 12500 6000 1 0 0 gnd-1.sym
C 14500 6000 1 0 0 gnd-1.sym
N 9800 9300 9800 8400 4
N 11800 9300 11800 8400 4
N 11800 6800 11800 5900 4
N 7800 5900 13800 5900 4
N 9800 6800 9800 5900 4
N 13800 5900 13800 6800 4
N 7800 6800 7800 5900 4
N 7800 6800 7600 6800 4
N 7600 6800 7600 8400 4
C 8000 10100 1 0 0 in-1.sym
{
T 8000 10600 5 10 0 0 0 0 1
footprint=anchor
T 8000 10400 5 10 0 0 0 0 1
device=INPUT
T 8100 10200 5 10 1 1 0 0 1
refdes=Vdd
}
C 8000 6200 1 0 0 in-1.sym
{
T 8000 6700 5 10 0 0 0 0 1
footprint=anchor
T 8000 6500 5 10 0 0 0 0 1
device=INPUT
T 8300 6300 5 10 1 1 0 5 1
refdes=GND
}
N 7400 8500 7400 8400 4
N 7400 9000 7400 8900 4
C 7000 8400 1 0 0 dta124.sym
{
T 7200 8700 5 10 1 1 0 1 1
refdes=Q
T 7700 8900 5 10 0 1 0 0 1
footprint=sot323-bjt
T 7100 9100 5 10 0 1 0 0 1
value=DTA124T
}
