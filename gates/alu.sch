v 20220529 2
C 1900 3500 1 0 0 vdd-1.sym
C 2000 2200 1 0 0 gnd-1.sym
C 3000 2300 1 0 0 gnd-1.sym
N 1300 3200 1500 3200 4
{
T 1400 3225 5 10 1 1 0 3 1
netname=B
}
C 700 3300 1 0 0 in-1.sym
{
T 700 3800 5 10 0 0 0 0 1
footprint=anchor
T 700 3600 5 10 0 0 0 0 1
device=INPUT
T 700 3400 5 10 1 1 0 7 1
refdes=A
}
C 2700 3800 1 270 0 in-1.sym
{
T 3200 3800 5 10 0 0 270 0 1
footprint=anchor
T 3000 3800 5 10 0 0 270 0 1
device=INPUT
T 2650 3600 5 10 1 1 0 3 1
refdes=Ci#
}
C 5050 3250 1 0 0 in-1.sym
{
T 5050 3750 5 10 0 0 0 0 1
footprint=anchor
T 5050 3550 5 10 0 0 0 0 1
device=INPUT
T 5050 3350 5 10 1 1 0 7 1
refdes=GND
}
C 3600 3000 1 0 0 out-1.sym
{
T 3600 3500 5 10 0 0 0 0 1
footprint=anchor
T 3600 3300 5 10 0 0 0 0 1
device=OUTPUT
T 4200 3100 5 10 1 1 0 1 1
refdes=Q
}
C 5200 1000 1 0 0 out-1.sym
{
T 5200 1500 5 10 0 0 0 0 1
footprint=anchor
T 5200 1300 5 10 0 0 0 0 1
device=OUTPUT
T 5800 1100 5 10 1 1 0 1 1
refdes=Co#
}
N 1300 3400 1500 3400 4
{
T 1400 3425 5 10 1 1 0 3 1
netname=A
}
C 700 3100 1 0 0 in-1.sym
{
T 700 3600 5 10 0 0 0 0 1
footprint=anchor
T 700 3400 5 10 0 0 0 0 1
device=INPUT
T 700 3200 5 10 1 1 0 7 1
refdes=B
}
C 5550 3050 1 0 0 gnd-1.sym
C 700 2900 1 0 0 in-1.sym
{
T 700 3400 5 10 0 0 0 0 1
footprint=anchor
T 700 3200 5 10 0 0 0 0 1
device=INPUT
T 700 3000 5 10 1 1 0 7 1
refdes=AND
}
C 700 500 1 0 0 in-1.sym
{
T 700 1000 5 10 0 0 0 0 1
footprint=anchor
T 700 800 5 10 0 0 0 0 1
device=INPUT
T 700 600 5 10 1 1 0 7 1
refdes=OR
}
N 1300 3000 1500 3000 4
C 4900 2000 1 90 1 in-1.sym
{
T 4400 2000 5 10 0 0 90 2 1
footprint=anchor
T 4600 2000 5 10 0 0 90 2 1
device=INPUT
T 4850 1800 5 10 1 1 0 2 1
refdes=CS#
}
C 4900 200 1 90 0 in-1.sym
{
T 4400 200 5 10 0 0 90 0 1
footprint=anchor
T 4600 200 5 10 0 0 90 0 1
device=INPUT
T 4850 500 5 10 1 1 0 2 1
refdes=CR
}
C 1500 2500 1 0 0 nand1or3.sym
{
T 2250 3000 5 10 1 1 0 4 1
refdes=X
}
N 2000 1100 2000 2800 4
C 2900 3600 1 0 0 vdd-1.sym
C 2200 2100 1 180 1 in-1.sym
{
T 2200 1600 5 10 0 0 180 6 1
footprint=anchor
T 2200 1800 5 10 0 0 180 6 1
device=INPUT
T 2600 1900 5 10 1 1 180 1 1
refdes=QE
}
C 2800 2600 1 0 0 xor2g.sym
{
T 3000 3200 5 10 1 1 0 0 1
refdes=E
}
C 2800 1700 1 0 0 nmos-switch.sym
{
T 3025 2000 5 10 1 1 0 1 1
refdes=M
T 2900 2500 5 10 0 1 0 0 1
value=NMOS_switch
T 3300 2300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 4300 2300 5 10 0 1 0 0 1
device=NMOS
}
N 3200 2600 3200 2200 4
{
T 3225 2400 5 6 1 1 0 1 1
netname=qg
}
C 3100 1400 1 0 0 gnd-1.sym
N 1000 1000 1200 1000 4
{
T 950 1000 5 10 1 1 0 7 1
netname=A
}
N 1000 1200 1200 1200 4
{
T 950 1200 5 10 1 1 0 7 1
netname=B
}
N 2600 3000 2800 3000 4
{
T 2700 3025 5 10 1 1 0 5 1
netname=H
}
C 1200 600 1 0 0 nand.sym
{
T 1600 1100 5 10 1 1 0 4 1
refdes=D
}
N 1300 600 1500 600 4
C 3500 800 1 0 0 nots.sym
{
T 3850 1100 5 10 1 1 0 4 1
refdes=I
}
N 3400 2900 3600 2900 4
{
T 3650 2900 5 10 1 1 0 1 1
netname=C2
}
N 2000 1100 3500 1100 4
{
T 2600 1100 5 8 1 1 0 5 1
netname=C1#
}
C 3700 1400 1 0 0 vdd-1.sym
C 4400 800 1 0 0 nots.sym
{
T 4750 1100 5 10 1 1 0 4 1
refdes=P
}
N 3900 800 3900 600 4
{
T 3900 550 5 10 1 1 0 5 1
netname=C2
}
C 5050 3450 1 0 0 in-1.sym
{
T 5050 3950 5 10 0 0 0 0 1
footprint=anchor
T 5050 3750 5 10 0 0 0 0 1
device=INPUT
T 5050 3550 5 10 1 1 0 7 1
refdes=Vdd
}
C 5450 3550 1 0 0 vdd-1.sym
C 1300 1600 1 0 0 vdd-1.sym
N 3200 1700 3200 1800 4
N 4400 1100 4300 1100 4
{
T 4350 1150 5 8 1 1 0 3 1
netname=C3
}
