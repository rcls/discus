v 20201216 2
C 2700 1100 1 90 0 resistor-load.sym
{
T 2600 1500 5 10 0 1 90 0 1
footprint=0603-boxed
T 2600 1500 5 10 0 1 90 0 1
value=3k3
T 2300 1400 5 10 0 0 90 0 1
device=RESISTOR
T 2575 1775 5 10 1 1 0 6 1
refdes=R2
}
N 2600 900 2600 1100 4
C 2200 400 1 0 0 nmos-switch.sym
{
T 3700 1000 5 10 0 1 0 0 1
device=NMOS
T 2425 700 5 10 1 1 0 1 1
refdes=M2
T 2300 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 2700 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
}
N 2200 700 1800 1100 4
C 1500 1100 1 90 0 resistor-load.sym
{
T 1400 1500 5 10 0 1 90 0 1
footprint=0603-boxed
T 1400 1500 5 10 0 1 90 0 1
value=3k3
T 1100 1400 5 10 0 0 90 0 1
device=RESISTOR
T 1400 1775 5 10 1 1 0 6 1
refdes=R1
}
C 1800 400 1 0 1 nmos-switch.sym
{
T 300 1000 5 10 0 1 0 6 1
device=NMOS
T 1575 700 5 10 1 1 0 7 1
refdes=M1
T 1700 1200 5 10 0 1 0 6 1
value=NMOS_switch
T 1300 1000 5 10 0 1 0 6 1
footprint=sot23-nmos
}
N 1400 1100 1400 900 4
N 1800 700 2200 1100 4
N 2200 1100 2800 1100 4
{
T 2300 1125 5 10 1 1 0 6 1
netname=R
}
N 1400 500 1400 300 4
N 1200 1100 1800 1100 4
{
T 1700 1125 5 10 1 1 0 0 1
netname=L
}
C 3300 1500 1 90 1 pdtc124.sym
{
T 3000 1250 5 10 1 1 0 5 1
refdes=Q2
T 2800 800 5 10 0 1 90 6 1
footprint=sot323-bjt
T 2600 1400 5 10 0 1 90 6 1
value=PDTC124TU
}
C 700 1500 1 270 0 pdtc124.sym
{
T 1000 1250 5 10 1 1 0 5 1
refdes=Q1
T 1200 800 5 10 0 1 270 0 1
footprint=sot323-bjt
T 1400 1400 5 10 0 1 270 0 1
value=PDTC124TU
}
N 1000 1500 1000 2200 4
N 1000 2200 3000 2200 4
N 3000 2200 3000 1500 4
C 3200 1000 1 0 0 out-1.sym
{
T 3200 1500 5 10 0 0 0 0 1
footprint=anchor
T 3200 1300 5 10 0 0 0 0 1
device=OUTPUT
T 3500 1075 5 10 1 1 0 5 1
refdes=R
}
C 800 1000 1 0 1 out-1.sym
{
T 800 1500 5 10 0 0 0 6 1
footprint=anchor
T 800 1300 5 10 0 0 0 6 1
device=OUTPUT
T 500 1125 5 10 1 1 0 3 1
refdes=L
}
C 3600 1800 1 0 1 in-1.sym
{
T 3600 2300 5 10 0 0 0 6 1
footprint=anchor
T 3600 2100 5 10 0 0 0 6 1
device=INPUT
T 3750 2050 5 10 1 1 0 6 1
refdes=STROBE
}
C 200 1900 1 0 0 in-1.sym
{
T 200 2400 5 10 0 0 0 0 1
footprint=anchor
T 200 2200 5 10 0 0 0 0 1
device=INPUT
T 600 2100 5 10 1 1 0 7 1
refdes=Vdd
}
C 200 200 1 0 0 in-1.sym
{
T 200 700 5 10 0 0 0 0 1
footprint=anchor
T 200 500 5 10 0 0 0 0 1
device=INPUT
T 500 275 5 10 1 1 0 5 1
refdes=GND
}
C 1300 0 1 0 0 gnd-1.sym
C 2500 0 1 0 0 gnd-1.sym
N 2600 500 2600 300 4
C 900 0 1 0 1 gnd-1.sym
C 1000 2000 1 0 1 vdd-1.sym
C 2400 2000 1 0 0 vdd-1.sym
C 1200 2000 1 0 0 vdd-1.sym
