v 20220529 2
C 200 3200 1 0 0 in-1.sym
{
T 200 3700 5 10 0 0 0 0 1
footprint=anchor
T 200 3500 5 10 0 0 0 0 1
device=INPUT
T 200 3300 5 10 1 1 0 7 1
refdes=B
}
C 200 3900 1 0 0 in-1.sym
{
T 200 4400 5 10 0 0 0 0 1
footprint=anchor
T 200 4200 5 10 0 0 0 0 1
device=INPUT
T 200 4000 5 10 1 1 0 7 1
refdes=W
}
C 4500 3200 1 0 1 in-1.sym
{
T 4500 3700 5 10 0 0 0 6 1
footprint=anchor
T 4500 3500 5 10 0 0 0 6 1
device=INPUT
T 4500 3300 5 10 1 1 0 1 1
refdes=Vdd
}
N 1200 2900 3100 2900 4
{
T 2100 2900 5 10 1 1 0 5 1
netname=B#
}
C 1100 1700 1 0 0 gnd-1.sym
C 1000 4400 1 0 0 vdd-1.sym
C 4500 2100 1 0 1 in-1.sym
{
T 4500 2600 5 10 0 0 0 6 1
footprint=anchor
T 4500 2400 5 10 0 0 0 6 1
device=INPUT
T 4500 2200 5 10 1 1 0 1 1
refdes=ϕ1#
}
C 1800 1900 1 0 1 in-1.sym
{
T 1800 2400 5 10 0 0 0 6 1
footprint=anchor
T 1800 2200 5 10 0 0 0 6 1
device=INPUT
T 1800 2000 5 10 1 1 0 1 1
refdes=GND
}
C 2400 3200 1 0 1 in-1.sym
{
T 2400 3700 5 10 0 0 0 6 1
footprint=anchor
T 2400 3500 5 10 0 0 0 6 1
device=INPUT
T 2400 3300 5 10 1 1 0 1 1
refdes=WE#
}
C 800 3000 1 0 0 pmos-switch.sym
{
T 1025 3300 5 8 1 1 0 1 1
refdes=M3
T 900 3800 5 10 0 1 0 0 1
value=PMOS_switch
T 1300 3600 5 10 0 1 0 0 1
footprint=sot23-pmos
T 2300 3600 5 10 0 1 0 0 1
device=PMOS
}
C 800 3700 1 0 0 pmos-switch.sym
{
T 1025 4000 5 8 1 1 0 1 1
refdes=M1
T 900 4500 5 10 0 1 0 0 1
value=PMOS_switch
T 1300 4300 5 10 0 1 0 0 1
footprint=sot23-pmos
T 2300 4300 5 10 0 1 0 0 1
device=PMOS
}
C 1800 3000 1 0 1 pmos-switch.sym
{
T 1575 3300 5 8 1 1 0 7 1
refdes=M4
T 1700 3800 5 10 0 1 0 6 1
value=PMOS_switch
T 1300 3600 5 10 0 1 0 6 1
footprint=sot23-pmos
T 300 3600 5 10 0 1 0 6 1
device=PMOS
}
N 1400 3500 1400 3800 4
N 1200 4400 1400 4400 4
N 1200 3800 1200 3500 4
N 1200 3100 1200 2900 4
N 1400 2900 1400 3100 4
N 1400 4400 1400 4200 4
C 4500 400 1 0 1 in-1.sym
{
T 4500 900 5 10 0 0 0 6 1
footprint=anchor
T 4500 700 5 10 0 0 0 6 1
device=INPUT
T 4500 500 5 10 1 1 0 1 1
refdes=ϕ1##
}
C 3600 800 1 90 0 resistor-strong.sym
{
T 3200 1100 5 10 0 0 90 0 1
device=RESISTOR
T 3600 1300 5 10 1 1 0 0 1
refdes=R2
T 3700 1800 5 10 0 1 90 0 1
footprint=0603-strong
}
C 3300 3300 1 0 0 vdd-1.sym
C 1100 2900 1 270 0 resistor-load.sym
{
T 1500 2600 5 10 0 0 270 0 1
device=RESISTOR
T 1300 2400 5 10 1 1 0 0 1
refdes=R1
T 1000 1900 5 10 0 1 270 0 1
footprint=0603-load
T 800 2700 5 10 0 1 270 0 1
value=rload
}
C 4400 3800 1 0 0 in-1.sym
{
T 4400 4300 5 10 0 0 0 0 1
footprint=anchor
T 4400 4100 5 10 0 0 0 0 1
device=INPUT
T 4400 3900 5 10 1 1 0 7 1
refdes=OE
}
C 5000 3500 1 0 0 nandod.sym
{
T 5400 4000 5 10 1 1 0 4 1
refdes=O
}
N 3000 4100 5000 4100 4
C 5200 3200 1 0 0 gnd-1.sym
C 5800 3900 1 0 0 out-1.sym
{
T 5800 4200 5 10 0 0 0 0 1
device=OUTPUT
T 6425 4000 5 10 1 1 0 1 1
refdes=Q
T 5800 4400 5 10 0 0 0 0 1
footprint=anchor
}
N 3500 1700 800 1700 4
N 3500 100 3500 300 4
C 3100 2600 1 0 0 pmos-switch.sym
{
T 3325 2900 5 8 1 1 0 1 1
refdes=M5
T 3200 3400 5 10 0 1 0 0 1
value=PMOS_switch
T 3600 3200 5 10 0 1 0 0 1
footprint=sot23-pmos
T 4600 3200 5 10 0 1 0 0 1
device=PMOS
}
N 3500 2700 3500 2400 4
N 3500 3100 3500 3300 4
C 3900 200 1 0 1 nmos-switch.sym
{
T 3675 500 5 8 1 1 0 7 1
refdes=M7
T 3800 1000 5 10 0 1 0 6 1
value=NMOS_switch
T 3400 800 5 10 0 1 0 6 1
footprint=sot23-nmos
T 2400 800 5 10 0 1 0 6 1
device=NMOS
}
C 3400 -200 1 0 0 gnd-1.sym
C 3900 1900 1 0 1 pmos-switch.sym
{
T 3675 2200 5 8 1 1 0 7 1
refdes=M6
T 3800 2700 5 10 0 1 0 6 1
value=PMOS_switch
T 3400 2500 5 10 0 1 0 6 1
footprint=sot23-pmos
T 2400 2500 5 10 0 1 0 6 1
device=PMOS
}
N 3500 1700 3500 2000 4
N 3500 700 3500 800 4
C 1800 3700 1 0 1 pmos-switch.sym
{
T 1575 4000 5 8 1 1 0 7 1
refdes=M2
T 1700 4500 5 10 0 1 0 6 1
value=PMOS_switch
T 1300 4300 5 10 0 1 0 6 1
footprint=sot23-pmos
T 300 4300 5 10 0 1 0 6 1
device=PMOS
}
N 1200 4200 1200 4400 4
C 2400 3900 1 0 1 in-1.sym
{
T 2400 4400 5 10 0 0 0 6 1
footprint=anchor
T 2400 4200 5 10 0 0 0 6 1
device=INPUT
T 2400 4000 5 10 1 1 0 1 1
refdes=WE
}
N 1200 3650 1400 3650 4
C 2900 2900 1 270 0 resistor-load.sym
{
T 3300 2600 5 10 0 0 90 8 1
device=RESISTOR
T 2900 2550 5 10 1 1 0 7 1
refdes=Rb
T 3700 2700 5 10 0 1 90 8 1
footprint=0603-load
T 2900 2300 5 10 1 1 0 7 1
value=2490
}
N 3000 2000 3000 800 4
N 3000 800 3500 800 4
N 800 1700 800 3300 4
N 3900 3300 3500 3300 4
N 3000 4100 3000 2900 4
