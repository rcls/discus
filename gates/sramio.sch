v 20201216 2
C 6600 5300 1 0 1 pdtc124.sym
{
T 6400 5600 5 10 1 1 0 7 1
refdes=Q1
T 5900 5800 5 10 0 1 0 6 1
footprint=sot323-bjt
T 6500 6000 5 10 0 1 0 6 1
value=PDTC124TU
}
C 6800 5300 1 0 0 pdtc124.sym
{
T 7000 5600 5 10 1 1 0 1 1
refdes=Q2
T 7500 5800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 6900 6000 5 10 0 1 0 0 1
value=PDTC124TU
}
C 5800 4700 1 0 0 2n7002.sym
{
T 6025 5000 5 10 1 1 0 1 1
refdes=M1
T 5900 5500 5 10 0 1 0 0 1
value=2N7002P
T 6300 5300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 7300 5300 5 10 0 1 0 0 1
device=NMOS
}
C 7600 4700 1 0 1 2n7002.sym
{
T 7375 5000 5 10 1 1 0 7 1
refdes=M2
T 7500 5500 5 10 0 1 0 6 1
value=2N7002P
T 7100 5300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 6100 5300 5 10 0 1 0 6 1
device=NMOS
}
N 6200 5400 6200 5200 4
N 7200 5400 7200 5200 4
C 6100 4500 1 0 0 gnd-1.sym
N 6600 5600 6800 5600 4
C 9200 5800 1 0 0 out-1.sym
{
T 9200 6300 5 10 0 0 0 0 1
footprint=anchor
T 9200 6100 5 10 0 0 0 0 1
device=OUTPUT
T 9800 5900 5 10 1 1 0 1 1
refdes=Q
}
N 7200 5800 7600 5800 4
C 6100 6700 1 270 0 in-1.sym
{
T 6600 6700 5 10 0 0 270 0 1
footprint=anchor
T 6400 6700 5 10 0 0 270 0 1
device=INPUT
T 6200 6700 5 10 1 1 0 3 1
refdes=L
}
C 7100 6700 1 270 0 in-1.sym
{
T 7600 6700 5 10 0 0 270 0 1
footprint=anchor
T 7400 6700 5 10 0 0 270 0 1
device=INPUT
T 7200 6700 5 10 1 1 0 3 1
refdes=R
}
C 6600 6700 1 270 0 in-1.sym
{
T 7100 6700 5 10 0 0 270 0 1
footprint=anchor
T 6900 6700 5 10 0 0 270 0 1
device=INPUT
T 6700 6700 5 10 1 1 0 3 1
refdes=W
}
C 8200 4900 1 0 1 in-1.sym
{
T 8200 5400 5 10 0 0 0 6 1
footprint=anchor
T 8200 5200 5 10 0 0 0 6 1
device=INPUT
T 8200 5000 5 10 1 1 0 1 1
refdes=D#
}
C 5200 4900 1 0 0 in-1.sym
{
T 5200 5400 5 10 0 0 0 0 1
footprint=anchor
T 5200 5200 5 10 0 0 0 0 1
device=INPUT
T 5200 5000 5 10 1 1 0 7 1
refdes=D
}
N 6700 6100 6700 5600 4
C 9800 5300 1 0 1 in-1.sym
{
T 9800 5800 5 10 0 0 0 6 1
footprint=anchor
T 9800 5600 5 10 0 0 0 6 1
device=INPUT
T 9525 5375 5 10 1 1 0 5 1
refdes=GND
}
C 8300 6700 1 270 0 in-1.sym
{
T 8800 6700 5 10 0 0 270 0 1
footprint=anchor
T 8600 6700 5 10 0 0 270 0 1
device=INPUT
T 8400 6700 5 10 1 1 180 5 1
refdes=RD
}
C 9800 6300 1 0 1 in-1.sym
{
T 9800 6800 5 10 0 0 0 6 1
footprint=anchor
T 9800 6600 5 10 0 0 0 6 1
device=INPUT
T 9550 6425 5 10 1 1 0 3 1
refdes=Vdd
}
C 9100 5100 1 0 0 gnd-1.sym
C 9000 6400 1 0 0 vdd-1.sym
N 7200 5800 7200 6100 4
T 5300 4300 9 12 1 0 0 0 1
FIXME - Do a real diff. amp?
C 7100 4500 1 0 0 gnd-1.sym
N 6200 6100 6200 5800 4
C 5700 6700 1 0 0 vdd-1.sym
C 7600 5500 1 0 0 notb.sym
{
T 8025 5800 5 10 1 1 0 4 1
refdes=I
}
C 7900 5200 1 0 0 gnd-1.sym
C 7800 6100 1 0 0 vdd-1.sym
C 8400 5400 1 0 0 nand.sym
{
T 8800 5900 5 10 1 1 0 4 1
refdes=N
}
N 8400 6100 8400 6000 4
C 8500 6400 1 0 0 vdd-1.sym
C 8600 5100 1 0 0 gnd-1.sym
C 6000 5800 1 90 0 resistor-load.sym
{
T 5600 6100 5 10 0 0 90 0 1
device=RESISTOR
T 5850 6450 5 10 1 1 90 0 1
refdes=R1
T 5900 6200 5 10 0 1 90 0 1
footprint=0603-boxed
T 5900 6200 5 10 0 1 90 0 1
value=3.3k
}
N 5900 5800 6200 5800 4
C 7300 6700 1 0 0 vdd-1.sym
C 7600 5800 1 90 0 resistor-load.sym
{
T 7200 6100 5 10 0 0 90 0 1
device=RESISTOR
T 7650 6550 5 10 1 1 90 0 1
refdes=R2
T 7500 6200 5 10 0 1 90 0 1
footprint=0603-boxed
T 7500 6200 5 10 0 1 90 0 1
value=3.3k
}
