v 20201216 2
C 1000 800 1 0 0 nmos-switch.sym
{
T 1225 1100 5 10 1 1 0 1 1
refdes=M
T 1100 1600 5 10 0 1 0 1 1
value=NMOS_switch
T 1500 1400 5 10 0 1 0 1 1
footprint=sot23-nmos
T 2500 1400 5 10 0 1 0 1 1
device=NMOS
}
C 1500 1400 1 90 0 resistor-load.sym
{
T 1400 1800 5 10 0 1 90 0 1
footprint=0603-boxed
T 1400 1800 5 10 0 1 90 0 1
value=3k3
T 1100 1700 5 10 0 0 90 0 1
device=RESISTOR
T 1350 2100 5 10 1 1 0 6 1
refdes=R
}
C 1500 200 1 90 0 in-1.sym
{
T 1000 200 5 10 0 0 90 0 1
footprint=anchor
T 1200 200 5 10 0 0 90 0 1
device=INPUT
T 1450 300 5 10 1 1 90 2 1
refdes=GND
}
C 400 1000 1 0 0 in-1.sym
{
T 400 1500 5 10 0 0 0 0 1
footprint=anchor
T 400 1300 5 10 0 0 0 0 1
device=INPUT
T 400 1100 5 10 1 1 0 7 1
refdes=A
}
C 1300 2900 1 270 0 in-1.sym
{
T 1800 2900 5 10 0 0 270 0 1
footprint=anchor
T 1600 2900 5 10 0 0 270 0 1
device=INPUT
T 1450 2850 5 10 1 1 270 0 1
refdes=Vdd
}
C 1400 1300 1 0 0 out-1.sym
{
T 1400 1800 5 10 0 0 0 0 1
footprint=anchor
T 1400 1600 5 10 0 0 0 0 1
device=OUTPUT
T 2000 1400 5 10 1 1 0 1 1
refdes=Q
}
N 1400 800 1400 900 4
N 1400 1400 1400 1300 4
