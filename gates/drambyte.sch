v 20201216 2
C 8100 8500 1 0 0 gnd-1.sym
C 6400 9000 1 0 0 in-1.sym
{
T 6400 9500 5 10 0 0 0 0 1
footprint=anchor
T 6400 9300 5 10 0 0 0 0 1
device=INPUT
T 6400 9100 5 10 1 1 180 1 1
refdes=SEL
}
C 6400 8700 1 0 0 in-1.sym
{
T 6400 9200 5 10 0 0 0 0 1
footprint=anchor
T 6400 9000 5 10 0 0 0 0 1
device=INPUT
T 6400 8794 5 10 1 1 0 7 1
refdes=SEL#
}
C 8100 10500 1 270 0 in-1.sym
{
T 8600 10500 5 10 0 0 270 0 1
footprint=anchor
T 8400 10500 5 10 0 0 270 0 1
device=INPUT
T 8200 10500 5 10 1 1 0 3 1
refdes=L0
}
N 7800 9600 7800 8500 4
N 7400 8500 14100 8500 4
{
T 7500 8550 5 10 1 1 0 0 1
netname=S
}
C 6400 9900 1 0 0 in-1.sym
{
T 6400 10400 5 10 0 0 0 0 1
footprint=anchor
T 6400 10200 5 10 0 0 0 0 1
device=INPUT
T 6400 10000 5 10 1 1 0 7 1
refdes=Vdd
}
C 6400 7500 1 0 0 in-1.sym
{
T 6400 8000 5 10 0 0 0 0 1
footprint=anchor
T 6400 7800 5 10 0 0 0 0 1
device=INPUT
T 6400 7600 5 10 1 1 0 7 1
refdes=GND
}
C 6800 10000 1 0 0 vdd-1.sym
C 7300 7300 1 0 0 gnd-1.sym
C 8400 8800 1 90 0 capacitor.sym
{
T 7700 9000 5 10 0 0 90 0 1
device=CAPACITOR
T 8250 8950 5 8 1 1 0 2 1
refdes=C0
T 7500 9000 5 10 0 0 90 0 1
symversion=0.1
T 8250 9150 5 8 1 1 0 0 1
value=220p
}
C 7800 9300 1 0 0 pdtc124.sym
{
T 8000 9600 5 8 1 1 0 1 1
refdes=Q0
T 8500 9800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 7900 10000 5 10 0 1 0 0 1
value=PDTC124TU
}
N 8200 9400 8200 9300 4
{
T 8200 9350 5 8 1 1 0 0 1
netname=V0
}
C 9000 8500 1 0 0 gnd-1.sym
C 9000 10500 1 270 0 in-1.sym
{
T 9500 10500 5 10 0 0 270 0 1
footprint=anchor
T 9300 10500 5 10 0 0 270 0 1
device=INPUT
T 9100 10500 5 10 1 1 0 3 1
refdes=L1
}
N 8700 9600 8700 8500 4
C 9300 8800 1 90 0 capacitor.sym
{
T 8600 9000 5 10 0 0 90 0 1
device=CAPACITOR
T 8400 9000 5 10 0 0 90 0 1
symversion=0.1
T 9150 8950 5 8 1 1 0 2 1
refdes=C1
T 9150 9150 5 8 1 1 0 0 1
value=220p
}
C 8700 9300 1 0 0 pdtc124.sym
{
T 9400 9800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 8800 10000 5 10 0 1 0 0 1
value=PDTC124TU
T 8900 9600 5 8 1 1 0 1 1
refdes=Q1
}
N 9100 9900 9100 9800 4
C 9900 8500 1 0 0 gnd-1.sym
C 9900 10500 1 270 0 in-1.sym
{
T 10400 10500 5 10 0 0 270 0 1
footprint=anchor
T 10200 10500 5 10 0 0 270 0 1
device=INPUT
T 10000 10500 5 10 1 1 0 3 1
refdes=L2
}
N 9600 9600 9600 8500 4
C 10200 8800 1 90 0 capacitor.sym
{
T 9500 9000 5 10 0 0 90 0 1
device=CAPACITOR
T 9300 9000 5 10 0 0 90 0 1
symversion=0.1
T 10050 8950 5 8 1 1 0 2 1
refdes=C2
T 10050 9150 5 8 1 1 0 0 1
value=220p
}
C 9600 9300 1 0 0 pdtc124.sym
{
T 10300 9800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 9700 10000 5 10 0 1 0 0 1
value=PDTC124TU
T 9800 9600 5 8 1 1 0 1 1
refdes=Q2
}
N 10000 9900 10000 9800 4
C 10800 8500 1 0 0 gnd-1.sym
C 10800 10500 1 270 0 in-1.sym
{
T 11300 10500 5 10 0 0 270 0 1
footprint=anchor
T 11100 10500 5 10 0 0 270 0 1
device=INPUT
T 10900 10500 5 10 1 1 0 3 1
refdes=L3
}
N 10500 9600 10500 8500 4
C 11100 8800 1 90 0 capacitor.sym
{
T 10400 9000 5 10 0 0 90 0 1
device=CAPACITOR
T 10200 9000 5 10 0 0 90 0 1
symversion=0.1
T 10950 8950 5 8 1 1 0 2 1
refdes=C3
T 10950 9150 5 8 1 1 0 0 1
value=220p
}
C 10500 9300 1 0 0 pdtc124.sym
{
T 11200 9800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 10600 10000 5 10 0 1 0 0 1
value=PDTC124TU
T 10700 9600 5 8 1 1 0 1 1
refdes=Q3
}
N 10900 9900 10900 9800 4
C 11700 8500 1 0 0 gnd-1.sym
C 11700 10500 1 270 0 in-1.sym
{
T 12200 10500 5 10 0 0 270 0 1
footprint=anchor
T 12000 10500 5 10 0 0 270 0 1
device=INPUT
T 11800 10500 5 10 1 1 0 3 1
refdes=L4
}
N 11400 9600 11400 8500 4
C 12000 8800 1 90 0 capacitor.sym
{
T 11300 9000 5 10 0 0 90 0 1
device=CAPACITOR
T 11100 9000 5 10 0 0 90 0 1
symversion=0.1
T 11850 8950 5 8 1 1 0 2 1
refdes=C4
T 11850 9150 5 8 1 1 0 0 1
value=220p
}
C 11400 9300 1 0 0 pdtc124.sym
{
T 12100 9800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 11500 10000 5 10 0 1 0 0 1
value=PDTC124TU
T 11600 9600 5 8 1 1 0 1 1
refdes=Q4
}
N 11800 9900 11800 9800 4
C 12600 8500 1 0 0 gnd-1.sym
C 12600 10500 1 270 0 in-1.sym
{
T 13100 10500 5 10 0 0 270 0 1
footprint=anchor
T 12900 10500 5 10 0 0 270 0 1
device=INPUT
T 12700 10500 5 10 1 1 0 3 1
refdes=L5
}
N 12300 9600 12300 8500 4
C 12900 8800 1 90 0 capacitor.sym
{
T 12200 9000 5 10 0 0 90 0 1
device=CAPACITOR
T 12000 9000 5 10 0 0 90 0 1
symversion=0.1
T 12750 8950 5 8 1 1 0 2 1
refdes=C5
T 12750 9150 5 8 1 1 0 0 1
value=220p
}
C 12300 9300 1 0 0 pdtc124.sym
{
T 13000 9800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 12400 10000 5 10 0 1 0 0 1
value=PDTC124TU
T 12500 9600 5 8 1 1 0 1 1
refdes=Q5
}
N 12700 9900 12700 9800 4
C 13500 8500 1 0 0 gnd-1.sym
C 13500 10500 1 270 0 in-1.sym
{
T 14000 10500 5 10 0 0 270 0 1
footprint=anchor
T 13800 10500 5 10 0 0 270 0 1
device=INPUT
T 13600 10500 5 10 1 1 0 3 1
refdes=L6
}
N 13200 9600 13200 8500 4
C 13800 8800 1 90 0 capacitor.sym
{
T 13100 9000 5 10 0 0 90 0 1
device=CAPACITOR
T 12900 9000 5 10 0 0 90 0 1
symversion=0.1
T 13650 8950 5 8 1 1 0 2 1
refdes=C6
T 13650 9150 5 8 1 1 0 0 1
value=220p
}
C 13200 9300 1 0 0 pdtc124.sym
{
T 13900 9800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 13300 10000 5 10 0 1 0 0 1
value=PDTC124TU
T 13400 9600 5 8 1 1 0 1 1
refdes=Q6
}
N 13600 9900 13600 9800 4
C 14400 8500 1 0 0 gnd-1.sym
C 14400 10500 1 270 0 in-1.sym
{
T 14900 10500 5 10 0 0 270 0 1
footprint=anchor
T 14700 10500 5 10 0 0 270 0 1
device=INPUT
T 14500 10500 5 10 1 1 0 3 1
refdes=L7
}
N 14100 9600 14100 8500 4
C 14700 8800 1 90 0 capacitor.sym
{
T 14000 9000 5 10 0 0 90 0 1
device=CAPACITOR
T 13800 9000 5 10 0 0 90 0 1
symversion=0.1
T 14550 8950 5 8 1 1 0 2 1
refdes=C7
T 14550 9150 5 8 1 1 0 0 1
value=220p
}
C 14100 9300 1 0 0 pdtc124.sym
{
T 14800 9800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 14200 10000 5 10 0 1 0 0 1
value=PDTC124TU
T 14300 9600 5 8 1 1 0 1 1
refdes=Q7
}
N 14500 9900 14500 9800 4
C 7000 8500 1 0 0 BSS84.sym
{
T 7200 8800 5 8 1 1 0 1 1
refdes=M
T 7100 9300 5 10 0 1 0 0 1
value=BSS84
T 7500 9100 5 10 0 1 0 0 1
footprint=sot23-pmos
T 8500 9100 5 10 0 1 0 0 1
device=PMOS
}
N 7000 9100 7400 9100 4
N 7400 9100 7400 9000 4
C 7500 7600 1 90 0 resistor-load.sym
{
T 7100 7900 5 10 0 0 90 0 1
device=RESISTOR
T 7350 8250 5 10 1 1 90 0 1
refdes=R
T 7400 8000 5 10 0 1 90 0 1
footprint=0603-boxed
T 7400 8000 5 10 0 1 90 0 1
value=3.3k
}
N 7400 8500 7400 8600 4
N 7400 7600 7000 7600 4
N 9100 9400 9100 9300 4
{
T 9100 9350 5 8 1 1 0 0 1
netname=V1
}
N 10000 9400 10000 9300 4
{
T 10000 9350 5 8 1 1 0 0 1
netname=V2
}
N 10900 9400 10900 9300 4
{
T 10900 9350 5 8 1 1 0 0 1
netname=V3
}
N 11800 9400 11800 9300 4
{
T 11800 9350 5 8 1 1 0 0 1
netname=V4
}
N 12700 9400 12700 9300 4
{
T 12700 9350 5 8 1 1 0 0 1
netname=V5
}
N 13600 9400 13600 9300 4
{
T 13600 9350 5 8 1 1 0 0 1
netname=V6
}
N 14500 9400 14500 9300 4
{
T 14500 9350 5 8 1 1 0 0 1
netname=V7
}
N 8200 9800 8200 9900 4
