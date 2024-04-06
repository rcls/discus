v 20220529 2
C 2600 1800 1 90 0 resistor-load.sym
{
T 2200 2100 5 10 0 0 90 0 1
device=RESISTOR
T 2625 2225 5 10 1 1 0 1 1
refdes=R
T 2500 2200 5 10 0 1 90 0 1
footprint=0603-load
T 2500 2200 5 10 0 1 90 0 1
value=rload
}
C 2100 1200 1 0 0 nmos-switch.sym
{
T 2300 1500 5 8 1 1 0 1 1
refdes=M1
T 2200 2000 5 10 0 1 0 0 1
value=NMOS_switch
T 2600 1800 5 10 0 1 0 0 1
footprint=sot23-nmos
T 3600 1800 5 10 0 1 0 0 1
device=NMOS
}
C 800 400 1 0 0 nmos-switch.sym
{
T 1000 700 5 8 1 1 0 1 1
refdes=M2
T 900 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 1300 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2300 1000 5 10 0 1 0 0 1
device=NMOS
}
C 2100 400 1 0 0 nmos-switch.sym
{
T 2300 700 5 8 1 1 0 1 1
refdes=M3
T 2200 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 2600 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 3600 1000 5 10 0 1 0 0 1
device=NMOS
}
C 3400 400 1 0 0 nmos-switch.sym
{
T 3600 700 5 8 1 1 0 1 1
refdes=M4
T 3500 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 3900 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 4900 1000 5 10 0 1 0 0 1
device=NMOS
}
C 1500 600 1 0 0 in-1.sym
{
T 1500 1100 5 10 0 0 0 0 1
footprint=anchor
T 1500 900 5 10 0 0 0 0 1
device=INPUT
T 1500 700 5 10 1 1 0 7 1
refdes=C
}
C 1500 1400 1 0 0 in-1.sym
{
T 1500 1900 5 10 0 0 0 0 1
footprint=anchor
T 1500 1700 5 10 0 0 0 0 1
device=INPUT
T 1500 1500 5 10 1 1 0 7 1
refdes=A
}
C 2800 600 1 0 0 in-1.sym
{
T 2800 1100 5 10 0 0 0 0 1
footprint=anchor
T 2800 900 5 10 0 0 0 0 1
device=INPUT
T 2800 700 5 10 1 1 0 7 1
refdes=D
}
C 200 600 1 0 0 in-1.sym
{
T 200 1100 5 10 0 0 0 0 1
footprint=anchor
T 200 900 5 10 0 0 0 0 1
device=INPUT
T 200 700 5 10 1 1 0 7 1
refdes=B
}
C 1900 2600 1 0 0 in-1.sym
{
T 1900 3100 5 10 0 0 0 0 1
footprint=anchor
T 1900 2900 5 10 0 0 0 0 1
device=INPUT
T 2000 2500 5 10 1 1 0 0 1
refdes=Vdd
}
C 200 100 1 0 0 in-1.sym
{
T 200 600 5 10 0 0 0 0 1
footprint=anchor
T 200 400 5 10 0 0 0 0 1
device=INPUT
T 300 300 5 10 1 1 0 0 1
refdes=GND
}
C 2500 1600 1 0 0 out-1.sym
{
T 2500 2100 5 10 0 0 0 0 1
footprint=anchor
T 2500 1900 5 10 0 0 0 0 1
device=OUTPUT
T 3100 1700 5 10 1 1 0 1 1
refdes=Q
}
N 1200 1100 3800 1100 4
{
T 2800 1150 5 6 1 1 0 0 1
netname=r
}
N 3800 900 3800 1100 4
N 2500 900 2500 1100 4
N 2500 1100 2500 1300 4
N 3800 500 3800 200 4
N 3800 200 800 200 4
N 1200 200 1200 500 4
N 2500 500 2500 200 4
N 1200 900 1200 1100 4
N 2500 1700 2500 1800 4
{
T 2550 1750 5 10 1 1 0 0 1
netname=Q
}
