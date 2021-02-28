v 20201216 2
C 800 600 1 0 0 2n7002.sym
{
T 1000 900 5 10 1 1 0 1 1
refdes=M1
T 900 1400 5 10 0 1 0 1 1
value=2N7002P
T 1300 1200 5 10 0 1 0 1 1
footprint=sot23-nmos
T 2300 1200 5 10 0 1 0 1 1
device=NMOS
}
C 1300 100 1 90 0 in-1.sym
{
T 800 100 5 10 0 0 90 0 1
footprint=anchor
T 1000 100 5 10 0 0 90 0 1
device=INPUT
T 1250 400 5 10 1 1 90 5 1
refdes=GND
}
C 200 1100 1 0 0 in-1.sym
{
T 200 1600 5 10 0 0 0 0 1
footprint=anchor
T 200 1400 5 10 0 0 0 0 1
device=INPUT
T 200 1200 5 10 1 1 0 7 1
refdes=A
}
C 1100 2300 1 270 0 in-1.sym
{
T 1600 2300 5 10 0 0 270 0 1
footprint=anchor
T 1400 2300 5 10 0 0 270 0 1
device=INPUT
T 1250 2250 5 10 1 1 270 0 1
refdes=Vdd
}
C 1200 1100 1 0 0 out-1.sym
{
T 1200 1600 5 10 0 0 0 0 1
footprint=anchor
T 1200 1400 5 10 0 0 0 0 1
device=OUTPUT
T 1800 1200 5 10 1 1 0 1 1
refdes=Q
}
C 800 1200 1 0 0 BSS84.sym
{
T 1000 1500 5 10 1 1 0 1 1
refdes=M2
T 900 2000 5 10 0 1 0 0 1
value=BSS84
T 1300 1800 5 10 0 1 0 0 1
footprint=sot23-pmos
T 2300 1800 5 10 0 1 0 0 1
device=PMOS
}
N 1200 1100 1200 1300 4
N 800 900 800 1500 4
