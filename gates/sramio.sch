v 20130925 2
C 6500 5300 1 0 1 pdtc124.sym
{
T 6300 5600 5 10 1 1 0 7 1
refdes=Q1
T 5800 5800 5 10 0 1 0 6 1
footprint=sot323-bjt
T 6400 6000 5 10 0 1 0 6 1
value=PDTC124TU
}
C 6700 5300 1 0 0 pdtc124.sym
{
T 6900 5600 5 10 1 1 0 1 1
refdes=Q2
T 7400 5800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 6800 6000 5 10 0 1 0 0 1
value=PDTC124TU
}
C 5700 4700 1 0 0 2n7002.sym
{
T 5925 5000 5 10 1 1 0 1 1
refdes=M1
T 5800 5500 5 10 0 1 0 0 1
value=2N7002P
T 6200 5300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 7200 5300 5 10 0 1 0 0 1
device=NMOS
}
C 7500 4700 1 0 1 2n7002.sym
{
T 7275 5000 5 10 1 1 0 7 1
refdes=M2
T 7400 5500 5 10 0 1 0 6 1
value=2N7002P
T 7000 5300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 6000 5300 5 10 0 1 0 6 1
device=NMOS
}
N 6100 5400 6100 5200 4
N 7100 5400 7100 5200 4
N 6100 4800 7100 4800 4
C 6500 4500 1 0 0 gnd-1.sym
N 6500 5600 6700 5600 4
C 9400 5600 1 0 0 out-1.sym
{
T 9400 6100 5 10 0 0 0 0 1
footprint=anchor
T 9400 5900 5 10 0 0 0 0 1
device=OUTPUT
T 10000 5700 5 10 1 1 0 1 1
refdes=Q
}
N 7100 5800 7400 5800 4
C 6000 6400 1 270 0 in-1.sym
{
T 6500 6400 5 10 0 0 270 0 1
footprint=anchor
T 6300 6400 5 10 0 0 270 0 1
device=INPUT
T 6100 6400 5 10 1 1 0 3 1
refdes=L
}
C 7000 6400 1 270 0 in-1.sym
{
T 7500 6400 5 10 0 0 270 0 1
footprint=anchor
T 7300 6400 5 10 0 0 270 0 1
device=INPUT
T 7100 6400 5 10 1 1 0 3 1
refdes=R
}
C 6500 6400 1 270 0 in-1.sym
{
T 7000 6400 5 10 0 0 270 0 1
footprint=anchor
T 6800 6400 5 10 0 0 270 0 1
device=INPUT
T 6600 6400 5 10 1 1 0 3 1
refdes=W
}
C 8100 4900 1 0 1 in-1.sym
{
T 8100 5400 5 10 0 0 0 6 1
footprint=anchor
T 8100 5200 5 10 0 0 0 6 1
device=INPUT
T 7800 5000 5 10 1 1 0 3 1
refdes=D#
}
C 5100 4900 1 0 0 in-1.sym
{
T 5100 5400 5 10 0 0 0 0 1
footprint=anchor
T 5100 5200 5 10 0 0 0 0 1
device=INPUT
T 5100 5000 5 10 1 1 0 7 1
refdes=D
}
N 6600 5800 6600 5600 4
C 8800 4900 1 0 0 gnd-1.sym
C 9500 5100 1 0 1 in-1.sym
{
T 9500 5600 5 10 0 0 0 6 1
footprint=anchor
T 9500 5400 5 10 0 0 0 6 1
device=INPUT
T 9500 5200 5 10 1 1 0 1 1
refdes=GND
}
C 8700 5000 1 90 0 in-1.sym
{
T 8200 5000 5 10 0 0 90 0 1
footprint=anchor
T 8400 5000 5 10 0 0 90 0 1
device=INPUT
T 8600 5000 5 10 1 1 0 5 1
refdes=RD
}
C 8400 6000 1 0 1 in-1.sym
{
T 8400 6500 5 10 0 0 0 6 1
footprint=anchor
T 8400 6300 5 10 0 0 0 6 1
device=INPUT
T 8400 6100 5 10 1 1 0 1 1
refdes=Vdd
}
C 7400 5500 1 0 0 notb.sym
{
T 7825 5800 5 10 1 1 0 4 1
refdes=N
}
C 8600 5200 1 0 0 nandod.sym
{
T 9000 5700 5 10 1 1 0 4 1
refdes=M
}
C 7700 5200 1 0 0 gnd-1.sym
N 8200 5800 8600 5800 4
