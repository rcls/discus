v 20201216 2
C 1900 2100 1 270 0 in-1.sym
{
T 2200 2100 5 10 0 0 270 0 1
device=INPUT
T 2000 2125 5 10 1 1 0 3 1
refdes=OE
T 2400 2100 5 10 0 0 270 0 1
footprint=anchor
}
C 2800 1200 1 0 0 out-1.sym
{
T 2800 1500 5 10 0 0 0 0 1
device=OUTPUT
T 3400 1300 5 10 1 1 0 1 1
refdes=O
T 2800 1700 5 10 0 0 0 0 1
footprint=anchor
}
C 600 1100 1 0 0 in-1.sym
{
T 600 1400 5 10 0 0 0 7 1
device=INPUT
T 600 1200 5 10 1 1 0 7 1
refdes=B
T 600 1600 5 10 0 0 0 7 1
footprint=anchor
}
C 1100 0 1 0 0 gnd-1.sym
C 600 1400 1 0 0 in-1.sym
{
T 600 1700 5 10 0 0 0 7 1
device=INPUT
T 600 1900 5 10 0 0 0 7 1
footprint=anchor
T 600 1500 5 10 1 1 0 7 1
refdes=Vdd
}
C 1200 900 1 0 0 notb.sym
{
T 1625 1200 5 10 1 1 0 4 1
refdes=I
}
C 2000 800 1 0 0 nandod.sym
{
T 2400 1300 5 10 1 1 0 4 1
refdes=S
}
C 2200 500 1 0 0 gnd-1.sym
N 2000 1500 2000 1400 4
C 600 200 1 0 0 in-1.sym
{
T 600 500 5 10 0 0 0 7 1
device=INPUT
T 600 700 5 10 0 0 0 7 1
footprint=anchor
T 600 300 5 10 1 1 0 7 1
refdes=GND
}
C 1500 600 1 0 0 gnd-1.sym
N 1200 1500 1600 1500 4
C 1300 300 1 90 0 resistor-load.sym
{
T 900 600 5 10 0 0 90 0 1
device=RESISTOR
T 1150 950 5 10 1 1 0 6 1
refdes=R
T 1200 700 5 10 0 1 90 0 1
footprint=0603-boxed
T 1200 700 5 10 0 1 90 0 1
value=3.3k
}
