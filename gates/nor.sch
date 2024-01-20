v 20220529 2
C 800 800 1 0 0 nmos-switch.sym
{
T 1000 1100 5 8 1 1 0 1 1
refdes=M1
T 900 1600 5 10 0 1 0 0 1
value=NMOS_switch
T 1300 1400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2300 1400 5 10 0 1 0 0 1
device=NMOS
}
C 1800 800 1 0 1 nmos-switch.sym
{
T 1600 1100 5 8 1 1 0 7 1
refdes=M2
T 1700 1600 5 10 0 1 0 6 1
value=NMOS_switch
T 1300 1400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 300 1400 5 10 0 1 0 6 1
device=NMOS
}
C 1500 1500 1 90 0 resistor-load.sym
{
T 1400 1900 5 10 0 1 90 0 1
footprint=0603-load
T 1100 1800 5 10 0 0 90 0 1
device=RESISTOR
T 1200 1900 5 10 1 1 90 0 1
refdes=R
T 1400 1900 5 10 0 1 0 0 1
value=rload
}
C 1200 200 1 270 1 in-1.sym
{
T 1700 200 5 10 0 0 270 6 1
footprint=anchor
T 1500 200 5 10 0 0 90 2 1
device=INPUT
T 1100 200 5 10 1 1 90 2 1
refdes=GND
}
C 2400 1000 1 0 1 in-1.sym
{
T 2400 1500 5 10 0 0 0 6 1
footprint=anchor
T 2400 1300 5 10 0 0 0 6 1
device=INPUT
T 2100 1200 5 10 1 1 0 6 1
refdes=B
}
C 200 1000 1 0 0 in-1.sym
{
T 200 1500 5 10 0 0 0 0 1
footprint=anchor
T 200 1300 5 10 0 0 0 0 1
device=INPUT
T 500 1200 5 10 1 1 0 0 1
refdes=A
}
C 1300 3000 1 270 0 in-1.sym
{
T 1800 3000 5 10 0 0 270 0 1
footprint=anchor
T 1600 3000 5 10 0 0 270 0 1
device=INPUT
T 1500 2800 5 10 1 1 270 0 1
refdes=Vdd
}
C 1400 1400 1 0 0 out-1.sym
{
T 1400 1900 5 10 0 0 0 0 1
footprint=anchor
T 1400 1700 5 10 0 0 0 0 1
device=OUTPUT
T 1600 1600 5 10 1 1 0 0 1
refdes=Q
}
N 1400 1300 1400 1500 4
N 1400 1400 1200 1400 4
N 1200 800 1400 800 4
N 1200 1400 1200 1300 4
N 1400 800 1400 900 4
N 1200 800 1200 900 4
