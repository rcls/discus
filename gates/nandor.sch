v 20201216 2
C 900 1500 1 0 0 nmos-switch.sym
{
T 800 1900 5 10 1 1 0 0 1
refdes=M1
T 1000 2300 5 10 0 1 0 0 1
value=NMOS_switch
T 1400 2100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2400 2100 5 10 0 1 0 0 1
device=NMOS
}
C 900 800 1 0 0 nmos-switch.sym
{
T 800 1200 5 10 1 1 0 0 1
refdes=M3
T 1000 1600 5 10 0 1 0 0 1
value=NMOS_switch
T 1400 1400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2400 1400 5 10 0 1 0 0 1
device=NMOS
}
C 2100 1500 1 0 1 nmos-switch.sym
{
T 2200 1900 5 10 1 1 0 6 1
refdes=M2
T 2000 2300 5 10 0 1 0 6 1
value=NMOS_switch
T 1600 2100 5 10 0 1 0 6 1
footprint=sot23-nmos
T 600 2100 5 10 0 1 0 6 1
device=NMOS
}
C 2100 800 1 0 1 nmos-switch.sym
{
T 2200 1200 5 10 1 1 0 6 1
refdes=M4
T 2000 1600 5 10 0 1 0 6 1
value=NMOS_switch
T 1600 1400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 600 1400 5 10 0 1 0 6 1
device=NMOS
}
C 300 1700 1 0 0 in-1.sym
{
T 300 2200 5 10 0 0 0 0 1
footprint=anchor
T 300 2000 5 10 0 0 0 0 1
device=INPUT
T 300 1800 5 10 1 1 0 7 1
refdes=A
}
C 300 1000 1 0 0 in-1.sym
{
T 300 1500 5 10 0 0 0 0 1
footprint=anchor
T 300 1300 5 10 0 0 0 0 1
device=INPUT
T 300 1100 5 10 1 1 0 7 1
refdes=C
}
C 2700 1700 1 0 1 in-1.sym
{
T 2700 2200 5 10 0 0 0 6 1
footprint=anchor
T 2700 2000 5 10 0 0 0 6 1
device=INPUT
T 2700 1800 5 10 1 1 0 1 1
refdes=B
}
C 2700 1000 1 0 1 in-1.sym
{
T 2700 1500 5 10 0 0 0 6 1
footprint=anchor
T 2700 1300 5 10 0 0 0 6 1
device=INPUT
T 2700 1100 5 10 1 1 0 1 1
refdes=D
}
C 1400 3800 1 270 0 in-1.sym
{
T 1900 3800 5 10 0 0 270 0 1
footprint=anchor
T 1700 3800 5 10 0 0 270 0 1
device=INPUT
T 1600 3500 5 10 1 1 0 0 1
refdes=Vdd
}
C 1600 200 1 90 0 in-1.sym
{
T 1100 200 5 10 0 0 90 0 1
footprint=anchor
T 1300 200 5 10 0 0 90 0 1
device=INPUT
T 1400 500 5 10 1 1 180 0 1
refdes=GND
}
C 1500 2200 1 0 0 out-1.sym
{
T 1500 2700 5 10 0 0 0 0 1
footprint=anchor
T 1500 2500 5 10 0 0 0 0 1
device=OUTPUT
T 2100 2300 5 10 1 1 0 1 1
refdes=Q
}
C 1600 2300 1 90 0 resistor-load.sym
{
T 1500 2700 5 10 0 1 90 0 1
footprint=0603-load
T 1200 2600 5 10 0 0 90 0 1
device=RESISTOR
T 1450 3000 5 10 1 1 90 0 1
refdes=R
T -700 4500 5 10 0 1 0 0 1
value=rload
}
N 1300 2100 1700 2100 4
N 1700 1600 1700 1300 4
N 1300 1300 1300 1600 4
N 1300 800 1700 800 4
N 1500 2300 1500 2100 4
N 1300 1450 1700 1450 4
{
T 1500 1500 5 8 1 1 0 3 1
netname=x
}
N 1700 2100 1700 2000 4
N 1300 2100 1300 2000 4
N 1300 800 1300 900 4
N 1700 800 1700 900 4
