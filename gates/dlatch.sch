v 20201216 2
C 6000 2200 1 90 1 pdtc124.sym
{
T 5700 1950 5 8 1 1 180 3 1
refdes=Q2
T 5500 1500 5 8 0 1 270 2 1
footprint=sot323-bjt
T 5300 2100 5 8 0 1 270 2 1
value=PDTC124TU
}
C 2100 2200 1 270 0 pdtc124.sym
{
T 2400 1950 5 8 1 1 180 3 1
refdes=Q1
T 2600 1500 5 8 0 1 90 8 1
footprint=sot323-bjt
T 2800 2100 5 8 0 1 90 8 1
value=PDTC124TU
}
N 2800 1100 2800 2300 4
C 4300 1100 1 270 0 out-1.sym
{
T 4600 1100 5 10 0 0 270 0 1
device=OUTPUT
T 4400 450 5 10 1 1 180 3 1
refdes=Q
T 4800 1100 5 10 0 0 270 0 1
footprint=anchor
}
C 3600 1100 1 270 0 out-1.sym
{
T 3900 1100 5 10 0 0 270 0 1
device=OUTPUT
T 3700 450 5 10 1 1 180 3 1
refdes=Q#
T 4100 1100 5 10 0 0 270 0 1
footprint=anchor
}
N 2600 1800 2800 1800 4
{
T 2650 1775 5 10 1 1 0 5 1
netname=G#
}
C 1400 2500 1 0 0 in-1.sym
{
T 1400 3000 5 10 0 0 0 0 1
footprint=anchor
T 1400 2800 5 10 0 0 0 0 1
device=INPUT
T 1400 2600 5 10 1 1 0 7 1
refdes=E
}
C 1000 2000 1 0 0 in-1.sym
{
T 1000 2500 5 10 0 0 0 0 1
footprint=anchor
T 1000 2300 5 10 0 0 0 0 1
device=INPUT
T 1000 2100 5 10 1 1 0 7 1
refdes=Vdd
}
C 1000 1400 1 0 0 in-1.sym
{
T 1000 1900 5 10 0 0 0 0 1
footprint=anchor
T 1000 1700 5 10 0 0 0 0 1
device=INPUT
T 1000 1500 5 10 1 1 0 7 1
refdes=GND
}
N 2400 2200 2400 2600 4
N 2000 2600 5700 2600 4
N 5700 2600 5700 2200 4
N 2000 1800 2200 1800 4
{
T 2100 1775 5 10 1 1 0 5 1
netname=D#
}
C 1400 2100 1 0 0 vdd-1.sym
C 1500 1200 1 0 0 gnd-1.sym
C 3100 1200 1 0 0 gnd-1.sym
C 4800 1200 1 0 0 gnd-1.sym
C 3000 2100 1 0 0 vdd-1.sym
C 4700 2100 1 0 0 vdd-1.sym
N 6100 1800 5900 1800 4
{
T 6000 1750 5 10 1 1 0 5 1
netname=D
}
C 2800 1500 1 0 0 not.sym
{
T 3150 1800 5 10 1 1 0 4 1
refdes=I
}
C 5300 1500 1 0 1 not.sym
{
T 4950 1800 5 10 1 1 0 4 1
refdes=J
}
N 5300 1800 5500 1800 4
{
T 5400 1775 5 10 1 1 0 5 1
netname=G
}
N 5300 1100 5300 2300 4
N 3700 1800 4400 1100 4
N 4400 1800 3700 1100 4
N 3700 1800 3600 1800 4
N 4400 1800 4500 1800 4
C 6700 1700 1 0 1 in-1.sym
{
T 6700 2200 5 10 0 0 0 6 1
footprint=anchor
T 6700 2000 5 10 0 0 0 6 1
device=INPUT
T 6700 1800 5 10 1 1 0 1 1
refdes=D
}
C 1200 1500 1 0 0 not.sym
{
T 1550 1800 5 10 1 1 0 4 1
refdes=N
}
N 1200 1800 1000 1800 4
{
T 950 1800 5 10 1 1 0 7 1
netname=D
}
C 2800 1000 1 0 0 resistor-pull.sym
{
T 3100 1400 5 10 0 0 0 0 1
device=RESISTOR
T 3450 1150 5 10 1 1 0 0 1
refdes=R1
T 3200 1100 5 10 0 1 0 0 1
footprint=0603-boxed
T 3200 1100 5 10 0 1 0 0 1
value=10k
}
C 4400 1000 1 0 0 resistor-pull.sym
{
T 4700 1400 5 10 0 0 0 0 1
device=RESISTOR
T 5050 1150 5 10 1 1 0 0 1
refdes=R2
T 4800 1100 5 10 0 1 0 0 1
footprint=0603-boxed
T 4800 1100 5 10 0 1 0 0 1
value=10k
}
C 4300 2500 1 180 0 capacitor.sym
{
T 4100 1800 5 10 0 0 180 0 1
device=CAPACITOR
T 3950 2350 5 10 1 1 0 6 1
refdes=C
T 4100 1600 5 10 0 0 180 0 1
symversion=0.1
T 4150 2350 5 10 1 1 0 0 1
value=33p
}
N 5300 2300 4300 2300 4
N 2800 2300 3800 2300 4
