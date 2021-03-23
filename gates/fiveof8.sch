v 20201216 2
C 1100 600 1 0 0 in-1.sym
{
T 1100 1100 5 10 0 0 0 0 1
footprint=anchor
T 1100 900 5 10 0 0 0 0 1
device=INPUT
T 1100 700 5 10 1 1 0 7 1
refdes=GND
}
C 1800 400 1 0 1 gnd-1.sym
C 1100 900 1 0 0 in-1.sym
{
T 1100 1400 5 10 0 0 0 0 1
footprint=anchor
T 1100 1200 5 10 0 0 0 0 1
device=INPUT
T 1100 1000 5 10 1 1 0 7 1
refdes=Vdd
}
C 2100 3600 1 0 0 out-1.sym
{
T 2100 4100 5 10 0 0 0 0 1
footprint=anchor
T 2100 3900 5 10 0 0 0 0 1
device=OUTPUT
T 2700 3700 5 10 1 1 0 1 1
refdes=Q4
}
C 1500 3600 1 0 0 in-1.sym
{
T 1500 4100 5 10 0 0 0 0 1
footprint=anchor
T 1500 3900 5 10 0 0 0 0 1
device=INPUT
T 1500 3700 5 10 1 1 0 7 1
refdes=A2
}
C 1500 3300 1 0 0 in-1.sym
{
T 1500 3800 5 10 0 0 0 0 1
footprint=anchor
T 1500 3600 5 10 0 0 0 0 1
device=INPUT
T 1500 3400 5 10 1 1 0 7 1
refdes=A2#
}
C 1500 1000 1 0 0 vdd-1.sym
C 2300 700 1 90 0 resistor-strong.sym
{
T 1900 1000 5 10 0 0 90 0 1
device=RESISTOR
T 2150 1350 5 10 1 1 90 0 1
refdes=R0
T 2400 1700 5 10 0 1 90 0 1
footprint=0603-boxed
T 2600 800 5 10 0 1 90 0 1
value=rstrong
}
C 3700 700 1 90 0 resistor-strong.sym
{
T 3300 1000 5 10 0 0 90 0 1
device=RESISTOR
T 3550 1350 5 10 1 1 90 0 1
refdes=R1
T 3800 1700 5 10 0 1 90 0 1
footprint=0603-boxed
T 4000 800 5 10 0 1 90 0 1
value=rstrong
}
C 4400 700 1 90 0 resistor-strong.sym
{
T 4000 1000 5 10 0 0 90 0 1
device=RESISTOR
T 4250 1350 5 10 1 1 90 0 1
refdes=R2
T 4500 1700 5 10 0 1 90 0 1
footprint=0603-boxed
T 4700 800 5 10 0 1 90 0 1
value=rstrong
}
C 5800 700 1 90 0 resistor-strong.sym
{
T 5400 1000 5 10 0 0 90 0 1
device=RESISTOR
T 5650 1350 5 10 1 1 90 0 1
refdes=R3
T 5900 1700 5 10 0 1 90 0 1
footprint=0603-boxed
T 6100 800 5 10 0 1 90 0 1
value=rstrong
}
C 1500 2900 1 0 0 in-1.sym
{
T 1500 3400 5 10 0 0 0 0 1
footprint=anchor
T 1500 3200 5 10 0 0 0 0 1
device=INPUT
T 1500 3000 5 10 1 1 0 7 1
refdes=A1
}
C 6300 2900 1 0 1 in-1.sym
{
T 6300 3400 5 10 0 0 0 6 1
footprint=anchor
T 6300 3200 5 10 0 0 0 6 1
device=INPUT
T 6300 3000 5 10 1 1 0 1 1
refdes=A1#
}
C 1500 2400 1 0 0 in-1.sym
{
T 1500 2900 5 10 0 0 0 0 1
footprint=anchor
T 1500 2700 5 10 0 0 0 0 1
device=INPUT
T 1300 2500 5 10 1 1 0 1 1
refdes=A0
}
C 6300 2400 1 0 1 in-1.sym
{
T 6300 2900 5 10 0 0 0 6 1
footprint=anchor
T 6300 2700 5 10 0 0 0 6 1
device=INPUT
T 6300 2500 5 10 1 1 0 1 1
refdes=A0#
}
C 2700 1600 1 90 1 out-1.sym
{
T 2200 1600 5 10 0 0 270 2 1
footprint=anchor
T 2400 1600 5 10 0 0 270 2 1
device=OUTPUT
T 2600 1000 5 10 1 1 180 3 1
refdes=Q0
}
C 3100 1600 1 270 0 out-1.sym
{
T 3600 1600 5 10 0 0 270 0 1
footprint=anchor
T 3400 1600 5 10 0 0 270 0 1
device=OUTPUT
T 3200 1000 5 10 1 1 180 3 1
refdes=Q1
}
C 4800 1600 1 90 1 out-1.sym
{
T 4300 1600 5 10 0 0 270 2 1
footprint=anchor
T 4500 1600 5 10 0 0 270 2 1
device=OUTPUT
T 4700 1000 5 10 1 1 180 3 1
refdes=Q2
}
C 5200 1600 1 270 0 out-1.sym
{
T 5700 1600 5 10 0 0 270 0 1
footprint=anchor
T 5500 1600 5 10 0 0 270 0 1
device=OUTPUT
T 5300 1000 5 10 1 1 180 3 1
refdes=Q3
}
C 2500 2700 1 0 0 pmos-switch.sym
{
T 2600 3500 5 10 0 1 0 0 1
value=PMOS_switch
T 3000 3300 5 10 0 1 0 0 1
footprint=sot23-pmos
T 4000 3300 5 10 0 1 0 0 1
device=PMOS
T 2725 3000 5 10 1 1 0 1 1
refdes=M4
}
C 5400 2700 1 0 1 pmos-switch.sym
{
T 5300 3500 5 10 0 1 0 6 1
value=PMOS_switch
T 4900 3300 5 10 0 1 0 6 1
footprint=sot23-pmos
T 3900 3300 5 10 0 1 0 6 1
device=PMOS
T 5175 3000 5 10 1 1 0 7 1
refdes=M5
}
C 2200 1700 1 0 0 pmos-switch.sym
{
T 2300 2500 5 10 0 1 0 0 1
value=PMOS_switch
T 2700 2300 5 10 0 1 0 0 1
footprint=sot23-pmos
T 3700 2300 5 10 0 1 0 0 1
device=PMOS
T 2425 2000 5 10 1 1 0 1 1
refdes=M0
}
C 3600 1700 1 0 1 pmos-switch.sym
{
T 3500 2500 5 10 0 1 0 6 1
value=PMOS_switch
T 3100 2300 5 10 0 1 0 6 1
footprint=sot23-pmos
T 2100 2300 5 10 0 1 0 6 1
device=PMOS
T 3375 2000 5 10 1 1 0 7 1
refdes=M1
}
C 4300 1700 1 0 0 pmos-switch.sym
{
T 4400 2500 5 10 0 1 0 0 1
value=PMOS_switch
T 4800 2300 5 10 0 1 0 0 1
footprint=sot23-pmos
T 5800 2300 5 10 0 1 0 0 1
device=PMOS
T 4525 2000 5 10 1 1 0 1 1
refdes=M2
}
C 5700 1700 1 0 1 pmos-switch.sym
{
T 5600 2500 5 10 0 1 0 6 1
value=PMOS_switch
T 5200 2300 5 10 0 1 0 6 1
footprint=sot23-pmos
T 4200 2300 5 10 0 1 0 6 1
device=PMOS
T 5475 2000 5 10 1 1 0 7 1
refdes=M3
}
N 2900 3200 2900 3400 4
N 2100 3400 5000 3400 4
N 5000 3400 5000 3200 4
N 2600 1600 2600 1800 4
N 3200 1600 3200 1800 4
N 4700 1600 4700 1800 4
N 5300 1600 5300 1800 4
N 2200 2000 2200 2500 4
N 2100 2500 3700 2500 4
N 3700 2500 4200 2000 4
N 5700 2500 5700 2000 4
N 3700 2000 4200 2500 4
N 4200 2500 5700 2500 4
N 2600 2300 3200 2300 4
{
T 2900 2275 5 6 1 1 0 5 1
netname=x
}
N 4700 2300 5300 2300 4
{
T 5000 2275 5 6 1 1 0 5 1
netname=y
}
N 5000 2800 5000 2300 4
N 2900 2800 2900 2300 4
N 5700 3000 5400 3000 4
N 2100 3000 2500 3000 4
N 4200 2000 4300 2000 4
N 3700 2000 3600 2000 4
N 2200 1600 2600 1600 4
N 3600 1600 3200 1600 4
N 4300 1600 4700 1600 4
N 5300 1600 5700 1600 4
C 2300 400 1 0 1 gnd-1.sym
C 3700 400 1 0 1 gnd-1.sym
C 4400 400 1 0 1 gnd-1.sym
C 5800 400 1 0 1 gnd-1.sym
N 2600 2300 2600 2200 4
N 3200 2300 3200 2200 4
N 4700 2300 4700 2200 4
N 5300 2300 5300 2200 4
