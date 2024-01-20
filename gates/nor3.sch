v 20220529 2
C 800 400 1 0 0 nmos-switch.sym
{
T 700 800 5 10 1 1 0 0 1
refdes=M1
T 900 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 1300 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2300 1000 5 10 0 1 0 0 1
device=NMOS
}
C 2400 400 1 0 1 nmos-switch.sym
{
T 2500 500 5 10 1 1 0 6 1
refdes=M3
T 2300 1200 5 10 0 1 0 6 1
value=NMOS_switch
T 1900 1000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 900 1000 5 10 0 1 0 6 1
device=NMOS
}
C 2100 1100 1 90 0 resistor-load.sym
{
T 2000 1500 5 10 0 1 90 0 1
footprint=0603-load
T 1700 1400 5 10 0 0 90 0 1
device=RESISTOR
T 1800 1500 5 10 1 1 90 0 1
refdes=R
T 2000 1500 5 10 0 1 0 0 1
value=rload
}
C 3000 600 1 0 1 in-1.sym
{
T 3000 1100 5 10 0 0 0 6 1
footprint=anchor
T 3000 900 5 10 0 0 0 6 1
device=INPUT
T 2700 900 5 10 1 1 180 6 1
refdes=C
}
C 200 600 1 0 0 in-1.sym
{
T 200 1100 5 10 0 0 0 0 1
footprint=anchor
T 200 900 5 10 0 0 0 0 1
device=INPUT
T 500 900 5 10 1 1 180 0 1
refdes=A
}
C 1900 2600 1 270 0 in-1.sym
{
T 2400 2600 5 10 0 0 270 0 1
footprint=anchor
T 2200 2600 5 10 0 0 270 0 1
device=INPUT
T 2100 2400 5 10 1 1 270 0 1
refdes=Vdd
}
C 2000 1000 1 0 0 out-1.sym
{
T 2000 1500 5 10 0 0 0 0 1
footprint=anchor
T 2000 1300 5 10 0 0 0 0 1
device=OUTPUT
T 2200 1200 5 10 1 1 0 0 1
refdes=Q
}
N 2000 900 2000 1100 4
C 1300 400 1 0 0 nmos-switch.sym
{
T 1600 700 5 10 1 1 0 0 1
refdes=M2
T 1400 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 1800 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2800 1000 5 10 0 1 0 0 1
device=NMOS
}
N 2000 300 2000 500 4
N 1200 500 1200 300 4
N 800 300 2000 300 4
N 1700 500 1700 300 4
C 200 400 1 180 1 in-1.sym
{
T 200 -100 5 10 0 0 180 6 1
footprint=anchor
T 200 100 5 10 0 0 0 2 1
device=INPUT
T 300 500 5 10 1 1 0 2 1
refdes=GND
}
N 1200 900 1200 1100 4
N 1200 1100 2000 1100 4
N 1700 900 1700 1100 4
N 1300 700 1300 1200 4
N 1300 1200 800 1200 4
C 200 1100 1 0 0 in-1.sym
{
T 200 1600 5 10 0 0 0 0 1
footprint=anchor
T 200 1400 5 10 0 0 0 0 1
device=INPUT
T 500 1400 5 10 1 1 180 0 1
refdes=B
}
