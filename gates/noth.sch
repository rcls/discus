v 20201216 2
C 1300 1500 1 90 0 resistor-load.sym
{
T 1200 1900 5 10 0 1 90 0 1
footprint=0603-boxed
T 1200 1900 5 10 0 1 90 0 1
value=rload
T 900 1800 5 10 0 0 90 0 1
device=RESISTOR
T 1000 1900 5 10 1 1 90 0 1
refdes=R
}
C 1300 200 1 90 0 in-1.sym
{
T 800 200 5 10 0 0 90 0 1
footprint=anchor
T 1000 200 5 10 0 0 90 0 1
device=INPUT
T 1250 350 5 10 1 1 90 2 1
refdes=GND
}
C 200 1000 1 0 0 in-1.sym
{
T 200 1500 5 10 0 0 0 0 1
footprint=anchor
T 200 1300 5 10 0 0 0 0 1
device=INPUT
T 200 1100 5 10 1 1 0 7 1
refdes=A
}
C 1100 2850 1 270 0 in-1.sym
{
T 1600 2850 5 10 0 0 270 0 1
footprint=anchor
T 1400 2850 5 10 0 0 270 0 1
device=INPUT
T 1250 2750 5 10 1 1 270 0 1
refdes=Vdd
}
C 1200 1300 1 0 0 out-1.sym
{
T 1200 1800 5 10 0 0 0 1 1
footprint=anchor
T 1200 1600 5 10 0 0 0 1 1
device=OUTPUT
T 1800 1400 5 10 1 1 0 1 1
refdes=O
}
N 1200 2400 1200 2200 4
N 1200 1300 1200 1500 4
N 1200 800 1200 900 4
C 800 800 1 0 0 2sc4774.sym
{
T 1025 1100 5 8 1 1 0 1 1
refdes=Q
T 1500 1300 5 10 0 1 0 0 1
footprint=sot323-bjt
T 900 1500 5 10 0 1 0 0 1
value=Q2SC4774
}
