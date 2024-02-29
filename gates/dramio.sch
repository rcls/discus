v 20220529 2
C -3800 1300 1 0 0 in-1.sym
{
T -3800 1800 5 10 0 0 0 0 1
footprint=anchor
T -3800 1600 5 10 0 0 0 0 1
device=INPUT
T -3800 1400 5 10 1 1 0 7 1
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
C 500 1200 1 0 1 in-1.sym
{
T 500 1700 5 10 0 0 0 6 1
footprint=anchor
T 500 1500 5 10 0 0 0 6 1
device=INPUT
T 500 1300 5 10 1 1 0 1 1
refdes=Vdd
}
N -2800 900 -900 900 4
{
T -1900 900 5 10 1 1 0 5 1
netname=B#
}
C -2900 -300 1 0 0 gnd-1.sym
C -3000 2500 1 0 0 vdd-1.sym
C 500 100 1 0 1 in-1.sym
{
T 500 600 5 10 0 0 0 6 1
footprint=anchor
T 500 400 5 10 0 0 0 6 1
device=INPUT
T 500 200 5 10 1 1 0 1 1
refdes=ϕ1#
}
C -2200 -100 1 0 1 in-1.sym
{
T -2200 400 5 10 0 0 0 6 1
footprint=anchor
T -2200 200 5 10 0 0 0 6 1
device=INPUT
T -2200 0 5 10 1 1 0 1 1
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
C 500 -1700 1 0 1 in-1.sym
{
T 500 -1200 5 10 0 0 0 6 1
footprint=anchor
T 500 -1400 5 10 0 0 0 6 1
device=INPUT
T 500 -1600 5 10 1 1 0 1 1
refdes=ϕ1##
}
C -400 -1200 1 90 0 resistor-strong.sym
{
T -800 -900 5 10 0 0 90 0 1
device=RESISTOR
T -350 -700 5 10 1 1 0 0 1
refdes=R3
T -300 -200 5 10 0 1 90 0 1
footprint=0603-strong
}
C -700 1300 1 0 0 vdd-1.sym
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
C 400 1800 1 0 0 in-1.sym
{
T 400 2300 5 10 0 0 0 0 1
footprint=anchor
T 400 2100 5 10 0 0 0 0 1
device=INPUT
T 400 1900 5 10 1 1 0 7 1
refdes=OE
}
C 1000 1500 1 0 0 nandod.sym
{
T 1400 2000 5 10 1 1 0 4 1
refdes=O
}
N -1000 2100 1000 2100 4
C 1200 1200 1 0 0 gnd-1.sym
C 1800 1900 1 0 0 out-1.sym
{
T 1800 2200 5 10 0 0 0 0 1
device=OUTPUT
T 2425 2000 5 10 1 1 0 1 1
refdes=Q
T 1800 2400 5 10 0 0 0 0 1
footprint=anchor
}
N -500 -300 -3200 -300 4
N -500 -2000 -500 -1800 4
C -900 600 1 0 0 pmos-switch.sym
{
T -675 900 5 8 1 1 0 1 1
refdes=M5
T -800 1400 5 10 0 1 0 0 1
value=PMOS_switch
T -400 1200 5 10 0 1 0 0 1
footprint=sot23-pmos
T 600 1200 5 10 0 1 0 0 1
device=PMOS
}
N -500 700 -500 400 4
N -500 1100 -500 1300 4
C -100 -1900 1 0 1 nmos-switch.sym
{
T -325 -1600 5 8 1 1 0 7 1
refdes=M7
T -200 -1100 5 10 0 1 0 6 1
value=NMOS_switch
T -600 -1300 5 10 0 1 0 6 1
footprint=sot23-nmos
T -1600 -1300 5 10 0 1 0 6 1
device=NMOS
}
C -600 -2300 1 0 0 gnd-1.sym
C -100 -100 1 0 1 pmos-switch.sym
{
T -325 200 5 8 1 1 0 7 1
refdes=M6
T -200 700 5 10 0 1 0 6 1
value=PMOS_switch
T -600 500 5 10 0 1 0 6 1
footprint=sot23-pmos
T -1600 500 5 10 0 1 0 6 1
device=PMOS
}
N -500 -300 -500 0 4
N -500 -1400 -500 -1200 4
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
C -1100 900 1 270 0 resistor-pull.sym
{
T -700 600 5 10 0 0 90 8 1
device=RESISTOR
T -1150 550 5 10 1 1 0 7 1
refdes=R2
T -300 700 5 10 0 1 90 8 1
footprint=0603-pull
}
N -1000 0 -1000 -1200 4
N -1000 -1200 -500 -1200 4
N -3200 -300 -3200 1400 4
N -100 1300 -500 1300 4
N -1000 2100 -1000 900 4
