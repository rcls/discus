v 20220529 2
C 4500 2300 1 0 0 out-1.sym
{
T 4500 2800 5 10 0 0 0 0 1
footprint=anchor
T 4500 2600 5 10 0 0 0 0 1
device=OUTPUT
T 5100 2400 5 10 1 1 0 1 1
refdes=Q
}
C 500 1600 1 0 0 in-1.sym
{
T 500 2100 5 10 0 0 0 0 1
footprint=anchor
T 500 1900 5 10 0 0 0 0 1
device=INPUT
T 500 1700 5 10 1 1 0 7 1
refdes=B
}
C 500 800 1 0 0 in-1.sym
{
T 500 1300 5 10 0 0 0 0 1
footprint=anchor
T 500 1100 5 10 0 0 0 0 1
device=INPUT
T 500 900 5 10 1 1 0 7 1
refdes=WE#
}
C 500 2500 1 0 0 in-1.sym
{
T 500 3000 5 10 0 0 0 0 1
footprint=anchor
T 500 2800 5 10 0 0 0 0 1
device=INPUT
T 500 2600 5 10 1 1 0 7 1
refdes=W
}
C 500 600 1 0 0 in-1.sym
{
T 500 1100 5 10 0 0 0 0 1
footprint=anchor
T 500 900 5 10 0 0 0 0 1
device=INPUT
T 500 700 5 10 1 1 0 7 1
refdes=W#
}
C 500 200 1 0 0 in-1.sym
{
T 500 700 5 10 0 0 0 0 1
footprint=anchor
T 500 500 5 10 0 0 0 0 1
device=INPUT
T 500 300 5 10 1 1 0 7 1
refdes=GND
}
C 500 2900 1 0 0 in-1.sym
{
T 500 3400 5 10 0 0 0 0 1
footprint=anchor
T 500 3200 5 10 0 0 0 0 1
device=INPUT
T 500 3000 5 10 1 1 0 7 1
refdes=Vdd
}
C 3900 1600 1 0 0 gnd-1.sym
C 3100 2200 1 0 0 in-1.sym
{
T 3100 2700 5 10 0 0 0 0 1
footprint=anchor
T 3100 2500 5 10 0 0 0 0 1
device=INPUT
T 3100 2300 5 10 1 1 0 7 1
refdes=OE
}
C 3700 1000 1 0 1 in-1.sym
{
T 3700 1500 5 10 0 0 0 6 1
footprint=anchor
T 3700 1300 5 10 0 0 0 6 1
device=INPUT
T 3700 1100 5 10 1 1 0 1 1
refdes=Pre
}
C 3700 1900 1 0 0 nandod.sym
{
T 4100 2400 5 10 1 1 0 4 1
refdes=O
}
N 1100 900 1300 900 4
{
T 1200 950 5 8 1 1 0 3 1
netname=WE#
}
N 1100 700 1300 700 4
N 2500 2500 2500 1100 4
N 1100 2800 1300 2800 4
{
T 1050 2800 5 10 1 1 0 7 1
netname=WE#
}
C 1700 3000 1 0 0 vdd-1.sym
N 2300 2500 3700 2500 4
{
T 2500 2550 5 10 1 1 0 0 1
netname=B#
}
C 1300 2000 1 0 0 nand1or.sym
{
T 1950 2500 5 10 1 1 0 4 1
refdes=N
}
N 1100 3000 1900 3000 4
C 1800 1700 1 0 0 gnd-1.sym
N 1600 2300 1600 1700 4
N 1100 1700 2100 1700 4
N 2100 1700 2100 1300 4
N 1100 2600 1300 2600 4
C 1500 0 1 0 0 gnd-1.sym
C 2600 500 1 0 0 gnd-1.sym
C 3100 800 1 0 1 nmos-switch.sym
{
T 2875 1100 5 8 1 1 0 7 1
refdes=M2
T 3000 1600 5 10 0 1 0 6 1
value=NMOS_switch
T 2600 1400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 1600 1400 5 10 0 1 0 6 1
device=NMOS
}
N 2700 1300 2500 1300 4
N 2700 800 2700 900 4
C 500 1300 1 0 0 in-1.sym
{
T 500 1800 5 10 0 0 0 0 1
footprint=anchor
T 500 1600 5 10 0 0 0 0 1
device=INPUT
T 500 1400 5 10 1 1 0 7 1
refdes=Bias
}
C 1300 300 1 0 0 norod.sym
{
T 1700 800 5 10 1 1 0 4 1
refdes=P
}
C 2500 800 1 0 1 nmos-switch.sym
{
T 2275 1100 5 8 1 1 0 7 1
refdes=M1
T 2400 1600 5 10 0 1 0 6 1
value=NMOS_switch
T 2000 1400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 1000 1400 5 10 0 1 0 6 1
device=NMOS
}
N 2100 900 2100 800 4
{
T 2075 850 5 6 1 1 0 6 1
netname=X
}
N 1200 1400 1100 1400 4
N 1100 300 1600 300 4
C 1200 1300 1 0 0 resistor-strong.sym
{
T 2200 1200 5 10 0 1 0 0 1
footprint=0603-strong
T 1850 1450 5 10 1 1 0 0 1
refdes=R
T 1500 1700 5 10 0 0 0 0 1
device=RESISTOR
T 1450 1425 5 10 1 1 0 8 1
value=820
}
