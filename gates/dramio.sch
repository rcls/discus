v 20201216 2
C 4700 2300 1 0 0 out-1.sym
{
T 4700 2800 5 10 0 0 0 0 1
footprint=anchor
T 4700 2600 5 10 0 0 0 0 1
device=OUTPUT
T 5300 2400 5 10 1 1 0 1 1
refdes=Q
}
C 500 1600 1 0 0 in-1.sym
{
T 500 2100 5 10 0 0 0 0 1
footprint=anchor
T 500 1900 5 10 0 0 0 0 1
device=INPUT
T 500 1700 5 10 1 1 0 7 1
refdes=B
}
C 500 1100 1 0 0 in-1.sym
{
T 500 1600 5 10 0 0 0 0 1
footprint=anchor
T 500 1400 5 10 0 0 0 0 1
device=INPUT
T 500 1200 5 10 1 1 0 7 1
refdes=WE#
}
C 500 2500 1 0 0 in-1.sym
{
T 500 3000 5 10 0 0 0 0 1
footprint=anchor
T 500 2800 5 10 0 0 0 0 1
device=INPUT
T 500 2600 5 10 1 1 0 7 1
refdes=D
}
C 500 900 1 0 0 in-1.sym
{
T 500 1400 5 10 0 0 0 0 1
footprint=anchor
T 500 1200 5 10 0 0 0 0 1
device=INPUT
T 500 1000 5 10 1 1 0 7 1
refdes=D#
}
C 3300 1800 1 0 0 in-1.sym
{
T 3300 2300 5 10 0 0 0 0 1
footprint=anchor
T 3300 2100 5 10 0 0 0 0 1
device=INPUT
T 3575 1875 5 10 1 1 0 5 1
refdes=GND
}
C 500 2900 1 0 0 in-1.sym
{
T 500 3400 5 10 0 0 0 0 1
footprint=anchor
T 500 3200 5 10 0 0 0 0 1
device=INPUT
T 850 3025 5 10 1 1 0 3 1
refdes=Vdd
}
C 4100 1600 1 0 0 gnd-1.sym
C 3300 2200 1 0 0 in-1.sym
{
T 3300 2700 5 10 0 0 0 0 1
footprint=anchor
T 3300 2500 5 10 0 0 0 0 1
device=INPUT
T 3300 2300 5 10 1 1 0 7 1
refdes=OE
}
C 4000 1100 1 0 1 in-1.sym
{
T 4000 1600 5 10 0 0 0 6 1
footprint=anchor
T 4000 1400 5 10 0 0 0 6 1
device=INPUT
T 4000 1200 5 10 1 1 0 1 1
refdes=ϕ
}
C 3900 1900 1 0 0 nandod.sym
{
T 4300 2400 5 10 1 1 0 4 1
refdes=O
}
N 1100 1200 1300 1200 4
{
T 1200 1250 5 10 1 1 0 3 1
netname=WE#
}
N 1100 1000 1300 1000 4
N 2800 2500 2800 200 4
N 2800 200 1600 200 4
N 1600 200 1600 700 4
N 1100 2800 1300 2800 4
{
T 1050 2800 5 10 1 1 0 7 1
netname=WE#
}
C 1700 1400 1 0 0 vdd-1.sym
C 1700 3000 1 0 0 vdd-1.sym
N 2300 2500 3900 2500 4
{
T 2500 2550 5 10 1 1 0 0 1
netname=B#
}
C 1300 2000 1 0 0 nand1or.sym
{
T 1950 2500 5 10 1 1 0 4 1
refdes=N
}
C 1300 400 1 0 0 nand1or.sym
{
T 1950 900 5 10 1 1 0 4 1
refdes=P
}
N 1100 3000 1900 3000 4
C 1800 1700 1 0 0 gnd-1.sym
N 1600 2300 1600 1700 4
N 1100 1700 2300 1700 4
N 2300 1700 2300 900 4
N 1100 2600 1300 2600 4
N 3900 1900 4200 1900 4
C 1800 100 1 0 0 gnd-1.sym
C 2900 600 1 0 0 gnd-1.sym
C 3400 900 1 0 1 2n7002.sym
{
T 3175 1200 5 8 1 1 0 7 1
refdes=M
T 3300 1700 5 10 0 1 0 6 1
value=2N7002P
T 2900 1500 5 10 0 1 0 6 1
footprint=sot23-nmos
T 1900 1500 5 10 0 1 0 6 1
device=NMOS
}
N 3000 1400 2800 1400 4
N 3000 900 3000 1000 4
