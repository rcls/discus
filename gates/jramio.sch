v 20220529 2
C 4300 2400 1 0 0 out-1.sym
{
T 4300 2900 5 10 0 0 0 0 1
footprint=anchor
T 4300 2700 5 10 0 0 0 0 1
device=OUTPUT
T 4900 2500 5 10 1 1 0 1 1
refdes=Q
}
C -1600 1200 1 0 0 in-1.sym
{
T -1600 1700 5 10 0 0 0 0 1
footprint=anchor
T -1600 1500 5 10 0 0 0 0 1
device=INPUT
T -1600 1300 5 10 1 1 0 7 1
refdes=B
}
C 1000 600 1 0 1 in-1.sym
{
T 1000 1100 5 10 0 0 0 6 1
footprint=anchor
T 1000 900 5 10 0 0 0 6 1
device=INPUT
T 1000 700 5 10 1 1 0 1 1
refdes=W
}
C -800 2400 1 0 0 in-1.sym
{
T -800 2900 5 10 0 0 0 0 1
footprint=anchor
T -800 2700 5 10 0 0 0 0 1
device=INPUT
T -800 2500 5 10 1 1 0 7 1
refdes=Vdd
}
C 3700 1700 1 0 0 gnd-1.sym
C 2900 2300 1 0 0 in-1.sym
{
T 2900 2800 5 10 0 0 0 0 1
footprint=anchor
T 2900 2600 5 10 0 0 0 0 1
device=INPUT
T 2900 2400 5 10 1 1 0 7 1
refdes=OE
}
C 3500 2000 1 0 0 nandod.sym
{
T 3900 2500 5 10 1 1 0 4 1
refdes=O
}
N -1300 700 -800 700 4
{
T -1350 700 5 10 1 1 0 7 1
netname=WE#
}
N -200 1500 1800 1500 4
{
T 0 1550 5 10 1 1 0 0 1
netname=B#
}
C 1600 1800 1 0 0 in-1.sym
{
T 1600 2300 5 10 0 0 0 0 1
footprint=anchor
T 1600 2100 5 10 0 0 0 0 1
device=INPUT
T 1600 1900 5 10 1 1 0 7 1
refdes=ϕ#
}
C -600 1000 1 0 0 nmos-switch.sym
{
T -375 1300 5 8 1 1 0 1 1
refdes=M1
T -500 1800 5 10 0 1 0 0 1
value=NMOS_switch
T -100 1600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 900 1600 5 10 0 1 0 0 1
device=NMOS
}
C -100 1600 1 90 0 resistor-load.sym
{
T -500 1900 5 10 0 0 90 0 1
device=RESISTOR
T -250 2250 5 10 1 1 90 0 1
refdes=R1
T 0 2600 5 10 0 1 90 0 1
footprint=0603-load
T 200 1800 5 10 0 1 90 0 1
value=rload
}
N -200 1600 -200 1500 4
C -300 0 1 0 0 gnd-1.sym
C -800 400 1 0 0 nmos-switch.sym
{
T -575 700 5 8 1 1 0 1 1
refdes=M2
T -700 1200 5 10 0 1 0 0 1
value=NMOS_switch
T -300 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 700 1000 5 10 0 1 0 0 1
device=NMOS
}
C 400 400 1 0 1 nmos-switch.sym
{
T 175 700 5 8 1 1 0 7 1
refdes=M3
T 300 1200 5 10 0 1 0 6 1
value=NMOS_switch
T -100 1000 5 10 0 1 0 6 1
footprint=sot23-nmos
T -1100 1000 5 10 0 1 0 6 1
device=NMOS
}
N -400 900 0 900 4
N -400 500 0 500 4
N -200 300 -200 500 4
C 1800 1200 1 0 0 pmos-switch.sym
{
T 2025 1500 5 8 1 1 0 1 1
refdes=M4
T 1900 2000 5 10 0 1 0 0 1
value=PMOS_switch
T 2300 1800 5 10 0 1 0 0 1
footprint=sot23-pmos
T 3300 1800 5 10 0 1 0 0 1
device=PMOS
}
C 2300 -800 1 90 0 resistor-load.sym
{
T 1900 -500 5 10 0 0 90 0 1
device=RESISTOR
T 2150 -150 5 10 1 1 90 0 1
refdes=R2
T 2400 200 5 10 0 1 90 0 1
footprint=0603-load
T 2600 -600 5 10 1 1 90 0 1
value=820
}
N 2200 100 2200 1300 4
C -400 2500 1 0 0 vdd-1.sym
N -1000 1300 -600 1300 4
N 2200 100 -1000 100 4
N -1000 100 -1000 1300 4
N 2200 1900 2200 1700 4
C 2600 -1500 1 0 1 nmos-switch.sym
{
T 2375 -1200 5 8 1 1 0 7 1
refdes=M7
T 2500 -700 5 10 0 1 0 6 1
value=NMOS_switch
T 2100 -900 5 10 0 1 0 6 1
footprint=sot23-nmos
T 1100 -900 5 10 0 1 0 6 1
device=NMOS
}
C 3200 -1300 1 0 1 in-1.sym
{
T 3200 -800 5 10 0 0 0 6 1
footprint=anchor
T 3200 -1000 5 10 0 0 0 6 1
device=INPUT
T 3200 -1200 5 10 1 1 0 1 1
refdes=ϕ1
}
C 4400 700 1 0 1 in-1.sym
{
T 4400 1200 5 10 0 0 0 6 1
footprint=anchor
T 4400 1000 5 10 0 0 0 6 1
device=INPUT
T 4400 800 5 10 1 1 0 1 1
refdes=W#
}
N 4300 1500 3800 1500 4
{
T 4050 1550 5 10 1 1 0 3 1
netname=WE#
}
C 2100 -1900 1 0 0 gnd-1.sym
N 2200 -1600 2200 -1400 4
N 2200 -800 2200 -1000 4
N -200 1100 -200 900 4
C 2400 1300 1 270 1 schottky.sym
{
T 3097 1597 5 10 0 0 90 2 1
device=DIODE
T 2800 1400 5 10 1 1 90 2 1
refdes=D1
T 3450 1600 5 10 0 1 90 2 1
value=BAS40
T 3600 1600 5 10 0 1 90 2 1
footprint=SOD523
}
N 2200 1700 3400 1700 4
N 3400 600 2200 600 4
N 1000 1500 1000 2600 4
N 1000 2600 3500 2600 4
C 1600 -1700 1 0 0 in-1.sym
{
T 1600 -1200 5 10 0 0 0 0 1
footprint=anchor
T 1600 -1400 5 10 0 0 0 0 1
device=INPUT
T 1600 -1600 5 10 1 1 0 7 1
refdes=GND
}
C 4900 1400 1 0 1 in-1.sym
{
T 4900 1900 5 10 0 0 0 6 1
footprint=anchor
T 4900 1700 5 10 0 0 0 6 1
device=INPUT
T 4900 1500 5 10 1 1 0 1 1
refdes=WE#
}
C 3800 1200 1 0 1 pmos-switch.sym
{
T 3575 1500 5 8 1 1 0 7 1
refdes=M5
T 3700 2000 5 10 0 1 0 6 1
value=PMOS_switch
T 3300 1800 5 10 0 1 0 6 1
footprint=sot23-pmos
T 2300 1800 5 10 0 1 0 6 1
device=PMOS
}
C 3800 500 1 0 1 pmos-switch.sym
{
T 3575 800 5 8 1 1 0 7 1
refdes=M6
T 3700 1300 5 10 0 1 0 6 1
value=PMOS_switch
T 3300 1100 5 10 0 1 0 6 1
footprint=sot23-pmos
T 2300 1100 5 10 0 1 0 6 1
device=PMOS
}
N 3400 1300 3400 1000 4
N 2600 1300 2200 1300 4
