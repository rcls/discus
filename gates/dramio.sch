v 20220529 2
C -4000 1300 1 0 0 in-1.sym
{
T -4000 1800 5 10 0 0 0 0 1
footprint=anchor
T -4000 1600 5 10 0 0 0 0 1
device=INPUT
T -4000 1400 5 10 1 1 0 7 1
refdes=B
}
C -3800 2000 1 0 0 in-1.sym
{
T -3800 2500 5 10 0 0 0 0 1
footprint=anchor
T -3800 2300 5 10 0 0 0 0 1
device=INPUT
T -3800 2100 5 10 1 1 0 7 1
refdes=W
}
C 700 1200 1 0 1 in-1.sym
{
T 700 1700 5 10 0 0 0 6 1
footprint=anchor
T 700 1500 5 10 0 0 0 6 1
device=INPUT
T 700 1300 5 10 1 1 0 1 1
refdes=Vdd
}
N -2800 900 -700 900 4
{
T -1900 900 5 10 1 1 0 5 1
netname=B#
}
C -2900 -300 1 0 0 gnd-1.sym
C -3000 2500 1 0 0 vdd-1.sym
C -1300 100 1 0 0 in-1.sym
{
T -1300 600 5 10 0 0 0 0 1
footprint=anchor
T -1300 400 5 10 0 0 0 0 1
device=INPUT
T -1300 200 5 10 1 1 0 7 1
refdes=ϕ1#
}
C -3400 -100 1 0 0 in-1.sym
{
T -3400 400 5 10 0 0 0 0 1
footprint=anchor
T -3400 200 5 10 0 0 0 0 1
device=INPUT
T -3400 0 5 10 1 1 0 7 1
refdes=GND
}
C -1600 1300 1 0 1 in-1.sym
{
T -1600 1800 5 10 0 0 0 6 1
footprint=anchor
T -1600 1600 5 10 0 0 0 6 1
device=INPUT
T -1600 1400 5 10 1 1 0 1 1
refdes=WE#
}
C -3200 1100 1 0 0 pmos-switch.sym
{
T -2975 1400 5 8 1 1 0 1 1
refdes=M3
T -3100 1900 5 10 0 1 0 0 1
value=PMOS_switch
T -2700 1700 5 10 0 1 0 0 1
footprint=sot23-pmos
T -1700 1700 5 10 0 1 0 0 1
device=PMOS
}
C -3200 1800 1 0 0 pmos-switch.sym
{
T -2975 2100 5 8 1 1 0 1 1
refdes=M1
T -3100 2600 5 10 0 1 0 0 1
value=PMOS_switch
T -2700 2400 5 10 0 1 0 0 1
footprint=sot23-pmos
T -1700 2400 5 10 0 1 0 0 1
device=PMOS
}
C -2200 1100 1 0 1 pmos-switch.sym
{
T -2425 1400 5 8 1 1 0 7 1
refdes=M4
T -2300 1900 5 10 0 1 0 6 1
value=PMOS_switch
T -2700 1700 5 10 0 1 0 6 1
footprint=sot23-pmos
T -3700 1700 5 10 0 1 0 6 1
device=PMOS
}
N -2600 1600 -2600 1900 4
N -2800 2500 -2600 2500 4
N -2800 1900 -2800 1600 4
N -2800 1200 -2800 900 4
N -2600 900 -2600 1200 4
N -2600 2500 -2600 2300 4
C -1300 -1600 1 0 0 in-1.sym
{
T -1300 -1100 5 10 0 0 0 0 1
footprint=anchor
T -1300 -1300 5 10 0 0 0 0 1
device=INPUT
T -1300 -1500 5 10 1 1 0 7 1
refdes=ϕ1##
}
C -200 -1100 1 90 0 resistor-strong.sym
{
T -600 -800 5 10 0 0 90 0 1
device=RESISTOR
T -150 -600 5 10 1 1 0 0 1
refdes=R3
T -100 -100 5 10 0 1 90 0 1
footprint=0603-strong
}
C -500 1300 1 0 0 vdd-1.sym
C -2900 900 1 270 0 resistor-load.sym
{
T -2500 600 5 10 0 0 270 0 1
device=RESISTOR
T -2650 450 5 10 1 1 0 0 1
refdes=R1
T -3000 -100 5 10 0 1 270 0 1
footprint=0603-load
T -3200 700 5 10 0 1 270 0 1
value=rload
}
C -3700 -1000 1 0 0 in-1.sym
{
T -3700 -500 5 10 0 0 0 0 1
footprint=anchor
T -3700 -700 5 10 0 0 0 0 1
device=INPUT
T -3700 -900 5 10 1 1 0 7 1
refdes=OE
}
C -3100 -1300 1 0 0 nandod.sym
{
T -2700 -800 5 10 1 1 0 4 1
refdes=O
}
N -3600 -700 -3100 -700 4
{
T -3350 -650 5 10 1 1 0 3 1
netname=B#
}
C -2900 -1600 1 0 0 gnd-1.sym
C -2300 -900 1 0 0 out-1.sym
{
T -2300 -600 5 10 0 0 0 0 1
device=OUTPUT
T -1675 -800 5 10 1 1 0 1 1
refdes=Q
T -2300 -400 5 10 0 0 0 0 1
footprint=anchor
}
N -3400 1400 -3200 1400 4
{
T -3300 1400 5 10 1 1 0 5 1
netname=B
}
N -300 -200 400 -200 4
{
T 450 -200 5 10 1 1 0 1 1
netname=B
}
N -300 -1900 -300 -1700 4
C -700 600 1 0 0 pmos-switch.sym
{
T -475 900 5 8 1 1 0 1 1
refdes=M5
T -600 1400 5 10 0 1 0 0 1
value=PMOS_switch
T -200 1200 5 10 0 1 0 0 1
footprint=sot23-pmos
T 800 1200 5 10 0 1 0 0 1
device=PMOS
}
N -300 700 -300 400 4
N -300 1100 -300 1300 4
C -700 -1800 1 0 0 nmos-switch.sym
{
T -475 -1500 5 8 1 1 0 1 1
refdes=M7
T -600 -1000 5 10 0 1 0 0 1
value=NMOS_switch
T -200 -1200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 800 -1200 5 10 0 1 0 0 1
device=NMOS
}
C -400 -2200 1 0 0 gnd-1.sym
C -700 -100 1 0 0 pmos-switch.sym
{
T -475 200 5 8 1 1 0 1 1
refdes=M6
T -600 700 5 10 0 1 0 0 1
value=PMOS_switch
T -200 500 5 10 0 1 0 0 1
footprint=sot23-pmos
T 800 500 5 10 0 1 0 0 1
device=PMOS
}
N -300 -200 -300 0 4
N -300 -1300 -300 -1100 4
C -2200 1800 1 0 1 pmos-switch.sym
{
T -2425 2100 5 8 1 1 0 7 1
refdes=M2
T -2300 2600 5 10 0 1 0 6 1
value=PMOS_switch
T -2700 2400 5 10 0 1 0 6 1
footprint=sot23-pmos
T -3700 2400 5 10 0 1 0 6 1
device=PMOS
}
N -2800 2300 -2800 2500 4
C -1600 2000 1 0 1 in-1.sym
{
T -1600 2500 5 10 0 0 0 6 1
footprint=anchor
T -1600 2300 5 10 0 0 0 6 1
device=INPUT
T -1600 2100 5 10 1 1 0 1 1
refdes=WE
}
N -2800 1750 -2600 1750 4
C 200 1000 1 90 1 resistor-pull.sym
{
T -200 700 5 10 0 0 90 6 1
device=RESISTOR
T 250 650 5 10 1 1 0 1 1
refdes=R2
T -600 800 5 10 0 1 90 6 1
footprint=0603-pull
}
N 100 1300 -300 1300 4
N 100 1000 100 1300 4
N 100 100 100 -200 4
