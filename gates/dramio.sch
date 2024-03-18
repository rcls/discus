v 20220529 2
C 1700 3200 1 0 0 in-1.sym
{
T 1700 3700 5 10 0 0 0 0 1
footprint=anchor
T 1700 3500 5 10 0 0 0 0 1
device=INPUT
T 1700 3300 5 10 1 1 0 7 1
refdes=B
}
C 4000 3400 1 0 0 in-1.sym
{
T 4000 3900 5 10 0 0 0 0 1
footprint=anchor
T 4000 3700 5 10 0 0 0 0 1
device=INPUT
T 4000 3500 5 10 1 1 0 7 1
refdes=W#
}
C 6300 3800 1 0 1 in-1.sym
{
T 6300 4300 5 10 0 0 0 6 1
footprint=anchor
T 6300 4100 5 10 0 0 0 6 1
device=INPUT
T 6300 3900 5 10 1 1 0 1 1
refdes=Vdd
}
N 2700 2900 4600 2900 4
{
T 4300 2900 5 10 1 1 0 5 1
netname=B#
}
C 2600 1700 1 0 0 gnd-1.sym
C 2500 3700 1 0 0 vdd-1.sym
C 6300 2100 1 0 1 in-1.sym
{
T 6300 2600 5 10 0 0 0 6 1
footprint=anchor
T 6300 2400 5 10 0 0 0 6 1
device=INPUT
T 6300 2200 5 10 1 1 0 1 1
refdes=ϕ1#
}
C 6300 0 1 0 1 in-1.sym
{
T 6300 500 5 10 0 0 0 6 1
footprint=anchor
T 6300 300 5 10 0 0 0 6 1
device=INPUT
T 6300 100 5 10 1 1 0 1 1
refdes=GND
}
C 6300 2800 1 0 1 in-1.sym
{
T 6300 3300 5 10 0 0 0 6 1
footprint=anchor
T 6300 3100 5 10 0 0 0 6 1
device=INPUT
T 6300 2900 5 10 1 1 0 1 1
refdes=WE#
}
C 2300 3000 1 0 0 pmos-switch.sym
{
T 2525 3300 5 8 1 1 0 1 1
refdes=M1
T 2400 3800 5 10 0 1 0 0 1
value=PMOS_switch
T 2800 3600 5 10 0 1 0 0 1
footprint=sot23-pmos
T 3800 3600 5 10 0 1 0 0 1
device=PMOS
}
C 4600 3200 1 0 0 pmos-switch.sym
{
T 4825 3500 5 8 1 1 0 1 1
refdes=M2
T 4700 4000 5 10 0 1 0 0 1
value=PMOS_switch
T 5100 3800 5 10 0 1 0 0 1
footprint=sot23-pmos
T 6100 3800 5 10 0 1 0 0 1
device=PMOS
}
C 5700 2600 1 0 1 pmos-switch.sym
{
T 5475 2900 5 8 1 1 0 7 1
refdes=M5
T 5600 3400 5 10 0 1 0 6 1
value=PMOS_switch
T 5200 3200 5 10 0 1 0 6 1
footprint=sot23-pmos
T 4200 3200 5 10 0 1 0 6 1
device=PMOS
}
N 2700 3700 2700 3500 4
N 2700 3100 2700 2900 4
C 6300 400 1 0 1 in-1.sym
{
T 6300 900 5 10 0 0 0 6 1
footprint=anchor
T 6300 700 5 10 0 0 0 6 1
device=INPUT
T 6300 500 5 10 1 1 0 1 1
refdes=ϕ1##
}
C 5100 800 1 90 0 resistor-strong.sym
{
T 4700 1100 5 10 0 0 90 0 1
device=RESISTOR
T 5100 1300 5 10 1 1 0 0 1
refdes=R2
T 5200 1800 5 10 0 1 90 0 1
footprint=0603-strong
}
C 4800 3900 1 0 0 vdd-1.sym
C 2600 2900 1 270 0 resistor-load.sym
{
T 3000 2600 5 10 0 0 270 0 1
device=RESISTOR
T 2800 2400 5 10 1 1 0 0 1
refdes=R1
T 2500 1900 5 10 0 1 270 0 1
footprint=0603-load
T 2300 2700 5 10 0 1 270 0 1
value=rload
}
C 4300 4700 1 0 0 in-1.sym
{
T 4300 5200 5 10 0 0 0 0 1
footprint=anchor
T 4300 5000 5 10 0 0 0 0 1
device=INPUT
T 4300 4800 5 10 1 1 0 7 1
refdes=OE
}
C 4900 4400 1 0 0 nandod.sym
{
T 5300 4900 5 10 1 1 0 4 1
refdes=O
}
N 3600 5000 4900 5000 4
C 5100 4100 1 0 0 gnd-1.sym
C 5700 4800 1 0 0 out-1.sym
{
T 5700 5100 5 10 0 0 0 0 1
device=OUTPUT
T 6325 4900 5 10 1 1 0 1 1
refdes=Q
T 5700 5300 5 10 0 0 0 0 1
footprint=anchor
}
N 5000 1700 2300 1700 4
N 5000 100 5000 300 4
C 4600 2600 1 0 0 pmos-switch.sym
{
T 4825 2900 5 8 1 1 0 1 1
refdes=M3
T 4700 3400 5 10 0 1 0 0 1
value=PMOS_switch
T 5100 3200 5 10 0 1 0 0 1
footprint=sot23-pmos
T 6100 3200 5 10 0 1 0 0 1
device=PMOS
}
N 5000 2700 5000 2400 4
N 5000 3100 5000 3300 4
C 5400 200 1 0 1 nmos-switch.sym
{
T 5175 500 5 8 1 1 0 7 1
refdes=M7
T 5300 1000 5 10 0 1 0 6 1
value=NMOS_switch
T 4900 800 5 10 0 1 0 6 1
footprint=sot23-nmos
T 3900 800 5 10 0 1 0 6 1
device=NMOS
}
C 4900 -200 1 0 0 gnd-1.sym
C 5400 1900 1 0 1 pmos-switch.sym
{
T 5175 2200 5 8 1 1 0 7 1
refdes=M6
T 5300 2700 5 10 0 1 0 6 1
value=PMOS_switch
T 4900 2500 5 10 0 1 0 6 1
footprint=sot23-pmos
T 3900 2500 5 10 0 1 0 6 1
device=PMOS
}
N 5000 1700 5000 2000 4
N 5000 700 5000 800 4
C 5700 3200 1 0 1 pmos-switch.sym
{
T 5475 3500 5 8 1 1 0 7 1
refdes=M4
T 5600 4000 5 10 0 1 0 6 1
value=PMOS_switch
T 5200 3800 5 10 0 1 0 6 1
footprint=sot23-pmos
T 4200 3800 5 10 0 1 0 6 1
device=PMOS
}
C 6300 3400 1 0 1 in-1.sym
{
T 6300 3900 5 10 0 0 0 6 1
footprint=anchor
T 6300 3700 5 10 0 0 0 6 1
device=INPUT
T 6300 3500 5 10 1 1 0 1 1
refdes=WE
}
C 3700 2900 1 90 1 resistor-load.sym
{
T 3300 2600 5 10 0 0 90 6 1
device=RESISTOR
T 3700 2550 5 10 1 1 0 1 1
refdes=Rb
T 2900 2700 5 10 0 1 90 6 1
footprint=0603-load
T 3700 2300 5 10 1 1 0 1 1
value=2490
}
N 3600 2000 3600 800 4
N 3600 800 5000 800 4
N 2300 1700 2300 3300 4
N 5000 3900 5700 3900 4
N 3600 5000 3600 2900 4
N 5700 2200 5400 2200 4
N 5700 500 5400 500 4
N 5300 2700 5300 2600 4
N 5300 2600 5000 2600 4
N 5000 3200 5300 3200 4
N 5300 3100 5300 3300 4
N 5000 3700 5000 3900 4
N 5300 3700 5300 3900 4
N 5700 100 5000 100 4
