v 20201216 2
C 1300 3000 1 270 0 in-1.sym
{
T 1600 3000 5 10 0 0 270 0 1
device=INPUT
T 1400 3000 5 10 1 1 0 3 1
refdes=H
}
C 3200 2400 1 0 0 linko.sym
{
T 3500 2800 5 10 0 0 0 0 1
device=RESISTOR
T 3600 2500 5 10 0 1 0 0 1
footprint=jumper2
T 3600 2500 5 10 0 1 0 0 1
value=INFINITY
T 3350 2525 5 8 1 1 0 6 1
refdes=R0
}
C 3200 2200 1 0 0 linko.sym
{
T 3500 2600 5 10 0 0 0 0 1
device=RESISTOR
T 3600 2300 5 10 0 1 0 0 1
footprint=jumper2
T 3600 2300 5 10 0 1 0 0 1
value=INFINITY
T 3350 2275 5 8 1 1 0 8 1
refdes=R1
}
C 3800 2000 1 0 0 baw56d.sym
{
T 4350 2625 5 10 1 1 0 3 1
refdes=X0
}
C 5500 2200 1 0 1 linko.sym
{
T 5200 2600 5 10 0 0 0 6 1
device=RESISTOR
T 5100 2300 5 10 0 1 0 6 1
footprint=jumper2
T 5100 2300 5 10 0 1 0 6 1
value=INFINITY
T 5350 2325 5 8 1 1 0 0 1
refdes=R2
}
C 5500 2000 1 0 1 linko.sym
{
T 5200 2400 5 10 0 0 0 6 1
device=RESISTOR
T 5100 2100 5 10 0 1 0 6 1
footprint=jumper2
T 5100 2100 5 10 0 1 0 6 1
value=INFINITY
T 5350 2075 5 8 1 1 0 2 1
refdes=R3
}
N 3800 2100 2900 2100 4
{
T 2850 2100 5 10 1 1 0 7 1
netname=S
}
N 4900 2500 5800 2500 4
{
T 5850 2500 5 10 1 1 0 1 1
netname=S
}
C 3200 1100 1 0 0 linko.sym
{
T 3500 1500 5 10 0 0 0 0 1
device=RESISTOR
T 3600 1200 5 10 0 1 0 0 1
footprint=jumper2
T 3600 1200 5 10 0 1 0 0 1
value=INFINITY
T 3350 1225 5 8 1 1 0 6 1
refdes=R4
}
C 3200 900 1 0 0 linko.sym
{
T 3500 1300 5 10 0 0 0 0 1
device=RESISTOR
T 3600 1000 5 10 0 1 0 0 1
footprint=jumper2
T 3600 1000 5 10 0 1 0 0 1
value=INFINITY
T 3350 975 5 8 1 1 0 8 1
refdes=R5
}
C 3800 700 1 0 0 baw56d.sym
{
T 4350 1325 5 10 1 1 0 3 1
refdes=X1
}
C 5500 900 1 0 1 linko.sym
{
T 5200 1300 5 10 0 0 0 6 1
device=RESISTOR
T 5100 1000 5 10 0 1 0 6 1
footprint=jumper2
T 5100 1000 5 10 0 1 0 6 1
value=INFINITY
T 5350 1025 5 8 1 1 0 0 1
refdes=R6
}
C 5500 700 1 0 1 linko.sym
{
T 5200 1100 5 10 0 0 0 6 1
device=RESISTOR
T 5100 800 5 10 0 1 0 6 1
footprint=jumper2
T 5100 800 5 10 0 1 0 6 1
value=INFINITY
T 5350 775 5 8 1 1 0 2 1
refdes=R7
}
N 4900 1200 5800 1200 4
{
T 5850 1200 5 10 1 1 0 1 1
netname=S
}
N 3800 800 2900 800 4
{
T 2850 800 5 10 1 1 0 7 1
netname=S
}
C 3200 2400 1 0 1 out-1.sym
{
T 3200 2700 5 10 0 0 0 6 1
device=OUTPUT
T 2600 2500 5 10 1 1 0 7 1
refdes=B0
}
C 3200 2200 1 0 1 out-1.sym
{
T 3200 2500 5 10 0 0 0 6 1
device=OUTPUT
T 2600 2300 5 10 1 1 0 7 1
refdes=B1
}
C 5500 2200 1 0 0 out-1.sym
{
T 5500 2500 5 10 0 0 0 0 1
device=OUTPUT
T 6100 2300 5 10 1 1 0 1 1
refdes=B2
}
C 5500 2000 1 0 0 out-1.sym
{
T 5500 2300 5 10 0 0 0 0 1
device=OUTPUT
T 6100 2100 5 10 1 1 0 1 1
refdes=B3
}
C 3200 1100 1 0 1 out-1.sym
{
T 3200 1400 5 10 0 0 0 6 1
device=OUTPUT
T 2600 1200 5 10 1 1 0 7 1
refdes=B4
}
C 3200 900 1 0 1 out-1.sym
{
T 3200 1200 5 10 0 0 0 6 1
device=OUTPUT
T 2600 1000 5 10 1 1 0 7 1
refdes=B5
}
C 5500 900 1 0 0 out-1.sym
{
T 5500 1200 5 10 0 0 0 0 1
device=OUTPUT
T 6100 1000 5 10 1 1 0 1 1
refdes=B6
}
C 5500 700 1 0 0 out-1.sym
{
T 5500 1000 5 10 0 0 0 0 1
device=OUTPUT
T 6100 800 5 10 1 1 0 1 1
refdes=B7
}
N 1400 2000 1600 2000 4
{
T 1650 2000 5 10 1 1 0 1 1
netname=S
}
C 400 2100 1 0 0 in-1.sym
{
T 400 2400 5 10 0 0 0 0 1
device=INPUT
T 400 2200 5 10 1 1 0 7 1
refdes=L#
T 400 2600 5 10 0 0 0 0 1
footprint=anchor
}
C 1500 500 1 90 0 in-1.sym
{
T 1200 500 5 10 0 0 90 0 1
device=INPUT
T 1400 500 5 10 1 1 0 5 1
refdes=GND
T 1000 500 5 10 0 0 90 0 1
footprint=anchor
}
C 1500 1100 1 90 0 resistor-load.sym
{
T 1100 1400 5 10 0 0 90 0 1
device=RESISTOR
T 1450 1300 5 10 1 1 0 2 1
refdes=R
T 1400 1500 5 10 0 1 90 0 1
footprint=0603-boxed
T 1400 1500 5 10 0 1 90 0 1
value=3.3k
}
C 1000 1900 1 0 0 pmos-switch.sym
{
T 1225 2200 5 10 1 1 0 1 1
refdes=M
T 1100 2700 5 10 0 1 0 0 1
value=PMOS_switch
T 1500 2500 5 10 0 1 0 0 1
footprint=sot23-pmos
T 2500 2500 5 10 0 1 0 0 1
device=PMOS
}
