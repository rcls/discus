v 20201216 2
C 1000 1600 1 0 0 nmos-switch.sym
{
T 1225 1900 5 10 1 1 0 1 1
refdes=M1
T 1100 2400 5 10 0 1 0 0 1
value=NMOS_switch
T 1500 2200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2500 2200 5 10 0 1 0 0 1
device=NMOS
}
C 1000 900 1 0 0 nmos-switch.sym
{
T 1225 1200 5 10 1 1 0 1 1
refdes=M2
T 1100 1700 5 10 0 1 0 0 1
value=NMOS_switch
T 1500 1500 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2500 1500 5 10 0 1 0 0 1
device=NMOS
}
C 1500 2200 1 90 0 resistor-load.sym
{
T 1400 2600 5 10 0 1 90 0 1
footprint=0603-boxed
T 1100 2500 5 10 0 0 90 0 1
device=RESISTOR
T 1350 2850 5 10 1 1 90 0 1
refdes=R
T 1400 2600 5 10 0 1 0 0 1
value=rload
}
C 1500 300 1 90 0 in-1.sym
{
T 1000 300 5 10 0 0 90 0 1
footprint=anchor
T 1200 300 5 10 0 0 90 0 1
device=INPUT
T 1450 400 5 10 1 1 90 2 1
refdes=GND
}
C 400 1100 1 0 0 in-1.sym
{
T 400 1600 5 10 0 0 0 0 1
footprint=anchor
T 400 1400 5 10 0 0 0 0 1
device=INPUT
T 400 1200 5 10 1 1 0 7 1
refdes=B
}
C 400 1800 1 0 0 in-1.sym
{
T 400 2300 5 10 0 0 0 0 1
footprint=anchor
T 400 2100 5 10 0 0 0 0 1
device=INPUT
T 400 1900 5 10 1 1 0 7 1
refdes=A
}
C 1300 3700 1 270 0 in-1.sym
{
T 1800 3700 5 10 0 0 270 0 1
footprint=anchor
T 1600 3700 5 10 0 0 270 0 1
device=INPUT
T 1450 3600 5 10 1 1 270 0 1
refdes=Vdd
}
C 1400 2100 1 0 0 out-1.sym
{
T 1400 2600 5 10 0 0 0 0 1
footprint=anchor
T 1400 2400 5 10 0 0 0 0 1
device=OUTPUT
T 2000 2200 5 10 1 1 0 1 1
refdes=Q
}
N 1400 1400 1400 1700 4
N 1400 2100 1400 2200 4
N 1400 900 1400 1000 4
