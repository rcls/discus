v 20220529 2
C 1300 3000 1 270 0 in-1.sym
{
T 1600 3000 5 10 0 0 270 0 1
device=INPUT
T 1400 3000 5 10 1 1 0 3 1
refdes=H
}
C 3100 2400 1 0 0 linko.sym
{
T 3400 2800 5 10 0 0 0 0 1
device=RESISTOR
T 3500 2500 5 10 0 1 0 0 1
footprint=jumper2
T 3500 2500 5 10 0 1 0 0 1
value={INFINITY}
T 3250 2525 5 8 1 1 0 6 1
refdes=R0
}
C 3100 2200 1 0 0 linko.sym
{
T 3400 2600 5 10 0 0 0 0 1
device=RESISTOR
T 3500 2300 5 10 0 1 0 0 1
footprint=jumper2
T 3500 2300 5 10 0 1 0 0 1
value={INFINITY}
T 3350 2325 5 8 1 1 0 8 1
refdes=R1
}
C 3800 2000 1 0 0 baw56d.sym
{
T 4700 2600 5 10 0 1 0 0 1
model-name=baw56d
T 4700 3000 5 10 0 1 0 0 1
footprint=sot23-baw56d
T 4350 2625 5 10 1 1 0 3 1
refdes=X0
}
C 5600 2200 1 0 1 linko.sym
{
T 5300 2600 5 10 0 0 0 6 1
device=RESISTOR
T 5200 2300 5 10 0 1 0 6 1
footprint=jumper2
T 5200 2300 5 10 0 1 0 6 1
value={INFINITY}
T 5450 2325 5 8 1 1 0 0 1
refdes=R2
}
C 5600 2000 1 0 1 linko.sym
{
T 5300 2400 5 10 0 0 0 6 1
device=RESISTOR
T 5200 2100 5 10 0 1 0 6 1
footprint=jumper2
T 5200 2100 5 10 0 1 0 6 1
value={INFINITY}
T 5450 2125 5 8 1 1 0 2 1
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
C 3100 1100 1 0 0 linko.sym
{
T 3400 1500 5 10 0 0 0 0 1
device=RESISTOR
T 3500 1200 5 10 0 1 0 0 1
footprint=jumper2
T 3500 1200 5 10 0 1 0 0 1
value={INFINITY}
T 3250 1225 5 8 1 1 0 6 1
refdes=R4
}
C 3100 900 1 0 0 linko.sym
{
T 3400 1300 5 10 0 0 0 0 1
device=RESISTOR
T 3500 1000 5 10 0 1 0 0 1
footprint=jumper2
T 3500 1000 5 10 0 1 0 0 1
value={INFINITY}
T 3350 1025 5 8 1 1 0 8 1
refdes=R5
}
C 3800 700 1 0 0 baw56d.sym
{
T 4700 1300 5 10 0 1 0 0 1
model-name=baw56d
T 4700 1700 5 10 0 1 0 0 1
footprint=sot23-baw56d
T 4350 1325 5 10 1 1 0 3 1
refdes=X1
}
C 5600 900 1 0 1 linko.sym
{
T 5300 1300 5 10 0 0 0 6 1
device=RESISTOR
T 5200 1000 5 10 0 1 0 6 1
footprint=jumper2
T 5200 1000 5 10 0 1 0 6 1
value={INFINITY}
T 5350 1025 5 8 1 1 0 0 1
refdes=R6
}
C 5600 700 1 0 1 linko.sym
{
T 5300 1100 5 10 0 0 0 6 1
device=RESISTOR
T 5200 800 5 10 0 1 0 6 1
footprint=jumper2
T 5200 800 5 10 0 1 0 6 1
value={INFINITY}
T 5450 825 5 8 1 1 0 2 1
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
C 3100 2400 1 0 1 out-1.sym
{
T 3100 2700 5 10 0 0 0 6 1
device=OUTPUT
T 2500 2500 5 10 1 1 0 7 1
refdes=B0
}
C 3100 2200 1 0 1 out-1.sym
{
T 3100 2500 5 10 0 0 0 6 1
device=OUTPUT
T 2500 2300 5 10 1 1 0 7 1
refdes=B1
}
C 5600 2200 1 0 0 out-1.sym
{
T 5600 2500 5 10 0 0 0 0 1
device=OUTPUT
T 6200 2300 5 10 1 1 0 1 1
refdes=B2
}
C 5600 2000 1 0 0 out-1.sym
{
T 5600 2300 5 10 0 0 0 0 1
device=OUTPUT
T 6200 2100 5 10 1 1 0 1 1
refdes=B3
}
C 3100 1100 1 0 1 out-1.sym
{
T 3100 1400 5 10 0 0 0 6 1
device=OUTPUT
T 2500 1200 5 10 1 1 0 7 1
refdes=B4
}
C 3100 900 1 0 1 out-1.sym
{
T 3100 1200 5 10 0 0 0 6 1
device=OUTPUT
T 2500 1000 5 10 1 1 0 7 1
refdes=B5
}
C 5600 900 1 0 0 out-1.sym
{
T 5600 1200 5 10 0 0 0 0 1
device=OUTPUT
T 6200 1000 5 10 1 1 0 1 1
refdes=B6
}
C 5600 700 1 0 0 out-1.sym
{
T 5600 1000 5 10 0 0 0 0 1
device=OUTPUT
T 6200 800 5 10 1 1 0 1 1
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
footprint=0603-load
T 1400 1500 5 10 0 1 90 0 1
value=rload
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
N 3700 2500 3800 2500 4
{
T 3750 2550 5 6 1 1 0 3 1
netname=y0
}
N 3700 2300 3800 2300 4
{
T 3750 2350 5 6 1 1 0 3 1
netname=y1
}
N 3700 1200 3800 1200 4
{
T 3750 1250 5 6 1 1 0 3 1
netname=y4
}
N 3700 1000 3800 1000 4
{
T 3750 1050 5 6 1 1 0 3 1
netname=y5
}
N 5000 2300 4900 2300 4
{
T 4950 2350 5 6 1 1 0 3 1
netname=y2
}
N 5000 2100 4900 2100 4
{
T 4950 2150 5 6 1 1 0 3 1
netname=y3
}
N 5000 1000 4900 1000 4
{
T 4950 1050 5 6 1 1 0 3 1
netname=y6
}
N 5000 800 4900 800 4
{
T 4950 850 5 6 1 1 0 3 1
netname=y7
}
