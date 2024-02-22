v 20220529 2
C 3800 2400 1 0 0 out-1.sym
{
T 3800 2900 5 10 0 0 0 0 1
footprint=anchor
T 3800 2700 5 10 0 0 0 0 1
device=OUTPUT
T 4400 2500 5 10 1 1 0 1 1
refdes=Q
}
C -500 1200 1 0 0 in-1.sym
{
T -500 1700 5 10 0 0 0 0 1
footprint=anchor
T -500 1500 5 10 0 0 0 0 1
device=INPUT
T -500 1300 5 10 1 1 0 7 1
refdes=B
}
C -500 1700 1 0 0 in-1.sym
{
T -500 2200 5 10 0 0 0 0 1
footprint=anchor
T -500 2000 5 10 0 0 0 0 1
device=INPUT
T -500 1800 5 10 1 1 0 7 1
refdes=W
}
C 100 1900 1 0 0 in-1.sym
{
T 100 2400 5 10 0 0 0 0 1
footprint=anchor
T 100 2200 5 10 0 0 0 0 1
device=INPUT
T 100 2000 5 10 1 1 0 7 1
refdes=Vdd
}
C 3200 1700 1 0 0 gnd-1.sym
C 2400 2300 1 0 0 in-1.sym
{
T 2400 2800 5 10 0 0 0 0 1
footprint=anchor
T 2400 2600 5 10 0 0 0 0 1
device=INPUT
T 2400 2400 5 10 1 1 0 7 1
refdes=OE
}
C 3000 2000 1 0 0 nandod.sym
{
T 3400 2500 5 10 1 1 0 4 1
refdes=O
}
N -400 1600 100 1600 4
{
T -450 1600 5 10 1 1 0 7 1
netname=WE#
}
N 1100 1500 1800 1500 4
{
T 1500 1550 5 10 1 1 0 3 1
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
C 600 700 1 0 0 gnd-1.sym
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
C 2300 -300 1 90 0 resistor-strong.sym
{
T 1900 0 5 10 0 0 90 0 1
device=RESISTOR
T 2350 200 5 10 1 1 0 0 1
refdes=R
T 2400 700 5 10 0 1 90 0 1
footprint=0603-strong
T 2350 0 5 10 1 1 0 0 1
value=820
}
N 2200 600 2200 1300 4
C 500 2000 1 0 0 vdd-1.sym
N 100 1300 400 1300 4
N 100 600 3400 600 4
N 100 600 100 1300 4
N 2200 1900 2200 1700 4
C 2600 -900 1 0 1 nmos-switch.sym
{
T 2375 -600 5 8 1 1 0 7 1
refdes=M7
T 2500 -100 5 10 0 1 0 6 1
value=NMOS_switch
T 2100 -300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 1100 -300 5 10 0 1 0 6 1
device=NMOS
}
C 3200 -700 1 0 1 in-1.sym
{
T 3200 -200 5 10 0 0 0 6 1
footprint=anchor
T 3200 -400 5 10 0 0 0 6 1
device=INPUT
T 3200 -600 5 10 1 1 0 1 1
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
C 2100 -1200 1 0 0 gnd-1.sym
N 2200 -900 2200 -800 4
N 2200 -300 2200 -400 4
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
N 1100 1500 1100 2600 4
N 1100 2600 3000 2600 4
C 1600 -1000 1 0 0 in-1.sym
{
T 1600 -500 5 10 0 0 0 0 1
footprint=anchor
T 1600 -700 5 10 0 0 0 0 1
device=INPUT
T 1600 -900 5 10 1 1 0 7 1
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
C 100 1000 1 0 0 nand1or.sym
{
T 750 1500 5 10 1 1 0 4 1
refdes=S
}
