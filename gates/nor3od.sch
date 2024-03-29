v 20220529 2
C 1300 400 1 0 0 nmos-switch.sym
{
T 1525 700 5 10 1 1 0 1 1
refdes=M1
T 1400 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 1800 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2800 1000 5 10 0 1 0 0 1
device=NMOS
}
C 3000 400 1 0 1 nmos-switch.sym
{
T 2775 700 5 10 1 1 0 7 1
refdes=M3
T 2900 1200 5 10 0 1 0 6 1
value=NMOS_switch
T 2500 1000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 1500 1000 5 10 0 1 0 6 1
device=NMOS
}
C 3600 600 1 0 1 in-1.sym
{
T 3600 1100 5 10 0 0 0 6 1
footprint=anchor
T 3600 900 5 10 0 0 0 6 1
device=INPUT
T 3600 700 5 10 1 1 0 1 1
refdes=C
}
C 700 600 1 0 0 in-1.sym
{
T 700 1100 5 10 0 0 0 0 1
footprint=anchor
T 700 900 5 10 0 0 0 0 1
device=INPUT
T 700 700 5 10 1 1 0 7 1
refdes=A
}
C 2600 1000 1 0 0 out-1.sym
{
T 2600 1500 5 10 0 0 0 0 1
footprint=anchor
T 2600 1300 5 10 0 0 0 0 1
device=OUTPUT
T 3200 1100 5 10 1 1 0 1 1
refdes=Q
}
N 2600 900 2600 1100 4
C 1900 400 1 0 0 nmos-switch.sym
{
T 2125 700 5 10 1 1 0 1 1
refdes=M2
T 2000 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 2400 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 3400 1000 5 10 0 1 0 0 1
device=NMOS
}
N 2600 300 2600 500 4
N 1700 500 1700 300 4
N 1300 300 2600 300 4
N 2300 500 2300 300 4
C 700 400 1 180 1 in-1.sym
{
T 700 -100 5 10 0 0 180 6 1
footprint=anchor
T 700 100 5 10 0 0 0 2 1
device=INPUT
T 700 300 5 10 1 1 0 7 1
refdes=GND
}
N 1700 900 1700 1100 4
N 1700 1100 2600 1100 4
N 2300 900 2300 1100 4
N 1900 700 1900 1200 4
N 1900 1200 1300 1200 4
C 700 1100 1 0 0 in-1.sym
{
T 700 1600 5 10 0 0 0 0 1
footprint=anchor
T 700 1400 5 10 0 0 0 0 1
device=INPUT
T 700 1200 5 10 1 1 0 7 1
refdes=B
}
