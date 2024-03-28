v 20220529 2
C 200 800 1 0 0 nmos-switch.sym
{
T 425 1100 5 8 1 1 0 1 1
refdes=M1
T 300 1600 5 10 0 1 0 0 1
value=NMOS_switch
T 700 1400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 1700 1400 5 10 0 1 0 0 1
device=NMOS
}
C 200 200 1 0 0 nmos-switch.sym
{
T 425 500 5 8 1 1 0 1 1
refdes=M2
T 300 1000 5 10 0 1 0 0 1
value=NMOS_switch
T 700 800 5 10 0 1 0 0 1
footprint=sot23-nmos
T 1700 800 5 10 0 1 0 0 1
device=NMOS
}
C 700 1400 1 90 0 resistor-strong.sym
{
T 300 1700 5 10 0 0 90 0 1
device=RESISTOR
T 550 2050 5 10 1 1 0 6 1
refdes=R1
T 800 2400 5 10 0 1 90 0 1
footprint=0603-strong
T 1000 1500 5 10 0 1 90 0 1
value=rstrong
}
N 600 1400 600 1300 4
N 600 700 600 900 4
{
T 650 800 5 8 1 1 0 1 1
netname=X
}
C 500 -100 1 0 0 gnd-1.sym
N 600 200 600 300 4
N 200 1100 0 1100 4
{
T 100 1150 5 10 1 1 0 6 1
netname=A
}
N 200 500 0 500 4
{
T 100 550 5 10 1 1 0 6 1
netname=B
}
C 1900 300 1 0 0 nmos-switch.sym
{
T 2125 600 5 8 1 1 0 1 1
refdes=M4
T 2000 1100 5 10 0 1 0 0 1
value=NMOS_switch
T 2400 900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 3400 900 5 10 0 1 0 0 1
device=NMOS
}
C 3100 300 1 0 1 nmos-switch.sym
{
T 2875 600 5 8 1 1 0 7 1
refdes=M5
T 3000 1100 5 10 0 1 0 6 1
value=NMOS_switch
T 2600 900 5 10 0 1 0 6 1
footprint=sot23-nmos
T 1600 900 5 10 0 1 0 6 1
device=NMOS
}
C 2100 1100 1 0 0 nmos-switch.sym
{
T 2325 1400 5 8 1 1 0 1 1
refdes=M3
T 2200 1900 5 10 0 1 0 0 1
value=NMOS_switch
T 2600 1700 5 10 0 1 0 0 1
footprint=sot23-nmos
T 3600 1700 5 10 0 1 0 0 1
device=NMOS
}
C 2600 1700 1 90 0 resistor-strong.sym
{
T 2200 2000 5 10 0 0 90 0 1
device=RESISTOR
T 2450 2350 5 10 1 1 0 6 1
refdes=R2
T 2700 2700 5 10 0 1 90 0 1
footprint=0603-strong
T 2900 1800 5 10 0 1 90 0 1
value=rstrong
}
C 1900 2500 1 0 0 in-1.sym
{
T 1900 3000 5 10 0 0 0 0 1
footprint=anchor
T 1900 2800 5 10 0 0 0 0 1
device=INPUT
T 1900 2600 5 10 1 1 0 7 1
refdes=Vdd
}
C 2300 2600 1 0 0 vdd-1.sym
C 1700 100 1 0 0 in-1.sym
{
T 1700 600 5 10 0 0 0 0 1
footprint=anchor
T 1700 400 5 10 0 0 0 0 1
device=INPUT
T 1700 150 5 10 1 1 0 6 1
refdes=GND
}
N 2500 1600 2500 1700 4
N 2300 800 2300 1000 4
N 2300 1000 2700 1000 4
N 2700 1000 2700 800 4
N 2500 1200 2500 1000 4
{
T 2550 1100 5 8 1 1 0 1 1
netname=Z
}
N 2300 400 2300 200 4
N 2300 200 2700 200 4
N 2700 400 2700 200 4
C 2400 -100 1 0 0 gnd-1.sym
N 1900 600 1700 600 4
{
T 1800 650 5 10 1 1 0 6 1
netname=A
}
C 1100 500 1 0 0 in-1.sym
{
T 1100 1000 5 10 0 0 0 0 1
footprint=anchor
T 1100 800 5 10 0 0 0 0 1
device=INPUT
T 1000 550 5 10 1 1 0 0 1
refdes=A
}
N 3300 600 3100 600 4
{
T 3200 650 5 10 1 1 0 0 1
netname=B
}
C 3900 500 1 0 1 in-1.sym
{
T 3900 1000 5 10 0 0 0 6 1
footprint=anchor
T 3900 800 5 10 0 0 0 6 1
device=INPUT
T 4000 550 5 10 1 1 0 6 1
refdes=B
}
N 600 1400 2100 1400 4
{
T 1400 1450 5 8 1 1 0 3 1
netname=Y
}
C 400 2300 1 0 0 vdd-1.sym
C 2500 1500 1 0 0 out-1.sym
{
T 2500 2000 5 10 0 0 0 0 1
footprint=anchor
T 2500 1800 5 10 0 0 0 0 1
device=OUTPUT
T 3100 1550 5 10 1 1 0 0 1
refdes=Q
}
