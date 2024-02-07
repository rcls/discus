v 20220529 2
N 1600 1700 1600 900 4
N 1600 900 2000 900 4
N 2000 700 1500 700 4
C 900 600 1 0 0 in-1.sym
{
T 900 1100 5 10 0 0 0 0 1
footprint=anchor
T 900 900 5 10 0 0 0 0 1
device=INPUT
T 900 700 5 10 1 1 0 7 1
refdes=A0
}
C 900 1200 1 0 0 in-1.sym
{
T 900 1700 5 10 0 0 0 0 1
footprint=anchor
T 900 1500 5 10 0 0 0 0 1
device=INPUT
T 900 1300 5 10 1 1 0 7 1
refdes=A1
}
C 3800 200 1 0 1 in-1.sym
{
T 3800 700 5 10 0 0 0 6 1
footprint=anchor
T 3800 500 5 10 0 0 0 6 1
device=INPUT
T 3800 300 5 10 1 1 0 1 1
refdes=GND
}
C 3800 2800 1 0 1 in-1.sym
{
T 3800 3300 5 10 0 0 0 6 1
footprint=anchor
T 3800 3100 5 10 0 0 0 6 1
device=INPUT
T 3800 2900 5 10 1 1 0 1 1
refdes=Vdd
}
C 3200 1900 1 0 0 out-1.sym
{
T 3200 2400 5 10 0 0 0 0 1
footprint=anchor
T 3200 2200 5 10 0 0 0 0 1
device=OUTPUT
T 3800 1950 5 10 1 1 0 0 1
refdes=Q
}
N 3200 2900 2800 2900 4
C 2600 2900 1 0 0 vdd-1.sym
C 1800 2000 1 0 0 vdd-1.sym
N 3200 300 2300 300 4
C 900 900 1 0 0 in-1.sym
{
T 900 1400 5 10 0 0 0 7 1
footprint=anchor
T 900 1200 5 10 0 0 0 7 1
device=INPUT
T 900 1000 5 10 1 1 0 7 1
refdes=S
}
C 1600 1400 1 0 0 not.sym
{
T 1925 1700 5 10 1 1 0 4 1
refdes=N
}
N 1500 1300 2000 1300 4
C 2000 300 1 0 0 norod.sym
{
T 2350 800 5 10 1 1 0 4 1
refdes=O
}
C 2400 1400 1 0 0 nmos-switch.sym
{
T 2625 1700 5 8 1 1 0 1 1
refdes=M
T 2500 2200 5 10 0 1 0 0 1
value=NMOS_switch
T 2900 2000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 3900 2000 5 10 0 1 0 0 1
device=NMOS
}
C 2900 2000 1 90 0 resistor-strong.sym
{
T 3000 3000 5 10 0 1 90 0 1
footprint=0603-strong
T 2500 2300 5 10 0 0 90 0 1
device=RESISTOR
T 2750 2650 5 10 1 1 90 0 1
refdes=R
T 3200 2100 5 10 0 1 90 0 1
value=rstrong
}
N 1500 1000 1600 1000 4
N 2800 800 2800 1500 4
{
T 2825 1150 5 8 1 1 0 1 1
netname=x
}
N 3200 2000 2800 2000 4
N 2000 1300 2000 1400 4
N 2800 1900 2800 2000 4
