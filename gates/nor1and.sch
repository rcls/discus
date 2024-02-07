v 20220529 2
C 1000 1300 1 0 0 nmos-switch.sym
{
T 900 1700 5 10 1 1 0 0 1
refdes=M1
T 1100 2100 5 10 0 1 0 0 1
value=NMOS_switch
T 1500 1900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2500 1900 5 10 0 1 0 0 1
device=NMOS
}
C 1000 600 1 0 0 nmos-switch.sym
{
T 900 1000 5 10 1 1 0 0 1
refdes=M3
T 1100 1400 5 10 0 1 0 0 1
value=NMOS_switch
T 1500 1200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2500 1200 5 10 0 1 0 0 1
device=NMOS
}
C 2000 1000 1 0 1 nmos-switch.sym
{
T 2100 1400 5 10 1 1 0 6 1
refdes=M2
T 1900 1800 5 10 0 1 0 6 1
value=NMOS_switch
T 1500 1600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 500 1600 5 10 0 1 0 6 1
device=NMOS
}
C 400 1500 1 0 0 in-1.sym
{
T 400 2000 5 10 0 0 0 0 1
footprint=anchor
T 400 1800 5 10 0 0 0 0 1
device=INPUT
T 250 1550 5 10 1 1 0 0 1
refdes=A
}
C 400 800 1 0 0 in-1.sym
{
T 400 1300 5 10 0 0 0 0 1
footprint=anchor
T 400 1100 5 10 0 0 0 0 1
device=INPUT
T 250 850 5 10 1 1 0 0 1
refdes=B
}
C 2600 1200 1 0 1 in-1.sym
{
T 2600 1700 5 10 0 0 0 6 1
footprint=anchor
T 2600 1500 5 10 0 0 0 6 1
device=INPUT
T 2800 1250 5 10 1 1 0 6 1
refdes=C
}
C 1500 3600 1 270 0 in-1.sym
{
T 2000 3600 5 10 0 0 270 0 1
footprint=anchor
T 1800 3600 5 10 0 0 270 0 1
device=INPUT
T 1700 3300 5 10 1 1 0 0 1
refdes=Vdd
}
C 1700 100 1 90 0 in-1.sym
{
T 1200 100 5 10 0 0 90 0 1
footprint=anchor
T 1400 100 5 10 0 0 90 0 1
device=INPUT
T 1500 400 5 10 1 1 180 0 1
refdes=GND
}
C 1600 2000 1 0 0 out-1.sym
{
T 1600 2500 5 10 0 0 0 0 1
footprint=anchor
T 1600 2300 5 10 0 0 0 0 1
device=OUTPUT
T 2200 2000 5 10 1 1 0 0 1
refdes=Q
}
C 1700 2100 1 90 0 resistor-load.sym
{
T 1600 2500 5 10 0 1 90 0 1
footprint=0603-load
T 1300 2400 5 10 0 0 90 0 1
device=RESISTOR
T 1450 2400 5 10 1 1 90 0 1
refdes=R
T -600 4300 5 10 0 1 0 0 1
value=rload
}
N 1400 1800 1600 1800 4
N 1600 1100 1600 700 4
N 1400 1100 1400 1400 4
N 1400 700 1600 700 4
N 1600 2100 1600 1500 4
