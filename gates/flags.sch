v 20130925 2
C 7700 9200 1 0 0 vdflipflop.sym
{
T 9050 9600 5 10 1 1 0 7 1
refdes=C
T 8500 9850 5 10 1 1 0 4 1
source=vdflipflop.sch
}
C 8300 10700 1 0 0 vdd-1.sym
C 8400 8900 1 0 0 gnd-1.sym
C 7100 9500 1 0 0 gnd-1.sym
C 7400 9600 1 0 0 phi0.sym
C 5200 10600 1 0 0 in-1.sym
{
T 5200 10700 5 10 1 1 0 7 1
refdes=Ci#
T 5200 11100 5 10 0 0 0 0 1
footprint=anchor
T 5200 10900 5 10 0 0 0 0 1
device=INPUT
}
C 6400 10100 1 0 0 vdd-1.sym
N 7000 10100 7000 9600 4
C 6500 8800 1 0 0 gnd-1.sym
N 5800 10500 6600 10500 4
N 5800 10700 6600 10700 4
N 9300 10300 9500 10300 4
N 9400 10300 9400 8900 4
N 6300 8900 9500 8900 4
N 6300 8900 6300 9400 4
C 5200 10400 1 0 0 in-1.sym
{
T 5200 10500 5 10 1 1 0 7 1
refdes=Cw1#
T 5200 10900 5 10 0 0 0 0 1
footprint=anchor
T 5200 10700 5 10 0 0 0 0 1
device=INPUT
}
C 9500 10200 1 0 0 out-1.sym
{
T 10100 10300 5 10 1 1 0 1 1
refdes=Co
T 9500 10700 5 10 0 0 0 0 1
footprint=anchor
T 9500 10500 5 10 0 0 0 0 1
device=OUTPUT
}
C 9500 10000 1 0 0 out-1.sym
{
T 10100 10100 5 10 1 1 0 1 1
refdes=Co#
T 9500 10500 5 10 0 0 0 0 1
footprint=anchor
T 9500 10300 5 10 0 0 0 0 1
device=OUTPUT
}
N 9500 10100 9300 10100 4
C 6700 7300 1 0 0 nor1and.sym
{
T 7350 7800 5 10 1 1 0 4 1
refdes=S4
}
C 8300 8200 1 0 0 vdd-1.sym
C 8400 6400 1 0 0 gnd-1.sym
C 7200 7000 1 0 0 gnd-1.sym
C 7400 7100 1 0 0 phi0.sym
C 5500 8000 1 0 0 in-1.sym
{
T 5500 8100 5 10 1 1 0 7 1
refdes=Zi
T 5500 8500 5 10 0 0 0 0 1
footprint=anchor
T 5500 8300 5 10 0 0 0 0 1
device=INPUT
}
C 6100 6700 1 0 0 nor.sym
{
T 6375 7200 5 10 1 1 0 1 1
refdes=S5
}
C 6200 7700 1 0 0 vdd-1.sym
N 6900 7600 6900 7200 4
C 6300 6400 1 0 0 gnd-1.sym
N 6100 7300 6100 7900 4
N 6100 7900 6700 7900 4
N 6100 8100 6700 8100 4
N 9300 7800 9500 7800 4
N 9400 7800 9400 6500 4
N 9400 6500 6100 6500 4
N 6100 6500 6100 7100 4
C 5500 7800 1 0 0 in-1.sym
{
T 5500 7900 5 10 1 1 0 7 1
refdes=Zw
T 5500 8300 5 10 0 0 0 0 1
footprint=anchor
T 5500 8100 5 10 0 0 0 0 1
device=INPUT
}
C 9500 7700 1 0 0 out-1.sym
{
T 10100 7800 5 10 1 1 0 1 1
refdes=Zo#
T 9500 8200 5 10 0 0 0 0 1
footprint=anchor
T 9500 8000 5 10 0 0 0 0 1
device=OUTPUT
}
C 9500 7500 1 0 0 out-1.sym
{
T 10100 7600 5 10 1 1 0 1 1
refdes=Zo
T 9500 8000 5 10 0 0 0 0 1
footprint=anchor
T 9500 7800 5 10 0 0 0 0 1
device=OUTPUT
}
N 9500 7600 9300 7600 4
C 9100 10600 1 0 1 in-1.sym
{
T 9100 10700 5 10 1 1 0 1 1
refdes=Vdd
T 9100 11100 5 10 0 0 0 6 1
footprint=anchor
T 9100 10900 5 10 0 0 0 6 1
device=INPUT
}
C 7900 9100 1 0 0 in-1.sym
{
T 7900 9200 5 10 1 1 0 7 1
refdes=GND
T 7900 9600 5 10 0 0 0 0 1
footprint=anchor
T 7900 9400 5 10 0 0 0 0 1
device=INPUT
}
C 6600 9800 1 0 0 nand1or3.sym
{
T 7350 10300 5 10 1 1 0 4 1
refdes=S1
}
N 5800 10300 6600 10300 4
C 5200 10200 1 0 0 in-1.sym
{
T 5200 10300 5 10 1 1 0 7 1
refdes=Cw2#
T 5200 10700 5 10 0 0 0 0 1
footprint=anchor
T 5200 10500 5 10 0 0 0 0 1
device=INPUT
}
N 6000 9900 6000 10500 4
N 6000 9700 5900 9700 4
N 5900 9700 5900 10300 4
N 7000 10100 7100 10100 4
C 6000 9100 1 0 0 nand1or.sym
{
T 6550 9550 5 10 1 1 0 0 1
refdes=S2
}
C 7700 6700 1 0 0 vdilatch.sym
{
T 9050 7100 5 10 1 1 0 6 1
refdes=Z
T 8500 7400 5 10 1 1 0 4 1
source=vdilatch.sch
}
C 7100 8400 1 0 0 vdd-1.sym
C 7000 10800 1 0 0 vdd-1.sym
C 10700 9300 1 0 1 in-1.sym
{
T 10700 9400 5 10 1 1 0 1 1
refdes=CinS#
T 10700 9800 5 10 0 0 0 6 1
footprint=anchor
T 10700 9600 5 10 0 0 0 6 1
device=INPUT
}
C 10700 8600 1 0 1 in-1.sym
{
T 10700 8700 5 10 1 1 0 1 1
refdes=CinR
T 10700 9100 5 10 0 0 0 6 1
footprint=anchor
T 10700 8900 5 10 0 0 0 6 1
device=INPUT
}
C 10100 9000 1 0 0 out-1.sym
{
T 10700 9100 5 10 1 1 0 1 1
refdes=Ce#
T 10100 9500 5 10 0 0 0 0 1
footprint=anchor
T 10100 9300 5 10 0 0 0 0 1
device=OUTPUT
}
C 5200 8400 1 0 0 in-1.sym
{
T 5200 8500 5 10 1 1 0 7 1
refdes=ϕ0
T 5200 8900 5 10 0 0 0 0 1
footprint=anchor
T 5200 8700 5 10 0 0 0 0 1
device=INPUT
}
C 6100 8400 1 0 1 phi0.sym
C 6400 8300 1 0 0 resistor-load.sym
{
T 6700 8700 5 10 0 0 0 0 1
device=RESISTOR
T 6550 8450 5 10 1 1 0 6 1
refdes=R
T 6800 8400 5 10 0 1 0 0 1
footprint=0603-boxed
T 6800 8400 5 10 0 1 0 0 1
value=3.3k
}
N 7300 8400 7300 8300 4
N 6400 8400 6400 8100 4
C 9500 8600 1 0 0 2n7002.sym
{
T 9725 8900 5 10 1 1 0 1 1
refdes=M
T 9600 9400 5 10 0 1 0 0 1
value=2N7002P
T 10000 9200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 11000 9200 5 10 0 1 0 0 1
device=NMOS
}
N 10100 8700 9900 8700 4
N 10100 9100 9900 9100 4
N 10100 9400 10100 9100 4
