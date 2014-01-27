v 20130925 2
C 9300 14900 1 90 1 in-1.sym
{
T 9000 14900 5 10 0 0 270 2 1
device=INPUT
T 8800 14900 5 10 0 0 270 2 1
footprint=anchor
T 9200 14900 5 10 1 1 270 7 1
refdes=I3#
}
C 9100 14900 1 90 1 in-1.sym
{
T 8800 14900 5 10 0 0 270 2 1
device=INPUT
T 8600 14900 5 10 0 0 270 2 1
footprint=anchor
T 9000 14900 5 10 1 1 270 7 1
refdes=I3
}
C 9700 14900 1 90 1 in-1.sym
{
T 9400 14900 5 10 0 0 270 2 1
device=INPUT
T 9600 14900 5 10 1 1 270 7 1
refdes=I4#
T 9200 14900 5 10 0 0 270 2 1
footprint=anchor
}
C 9500 14900 1 90 1 in-1.sym
{
T 9200 14900 5 10 0 0 270 2 1
device=INPUT
T 9400 14900 5 10 1 1 270 7 1
refdes=I4
T 9000 14900 5 10 0 0 270 2 1
footprint=anchor
}
C 9900 14900 1 90 1 in-1.sym
{
T 9600 14900 5 10 0 0 270 2 1
device=INPUT
T 9400 14900 5 10 0 0 270 2 1
footprint=anchor
T 9800 14900 5 10 1 1 270 7 1
refdes=I5
}
C 10100 14900 1 90 1 in-1.sym
{
T 9800 14900 5 10 0 0 270 2 1
device=INPUT
T 9600 14900 5 10 0 0 270 2 1
footprint=anchor
T 10000 14900 5 10 1 1 270 7 1
refdes=I5#
}
C 10300 14900 1 90 1 in-1.sym
{
T 10000 14900 5 10 0 0 270 2 1
device=INPUT
T 10200 14900 5 10 1 1 270 7 1
refdes=I6
T 9800 14900 5 10 0 0 270 2 1
footprint=anchor
}
C 10500 14900 1 90 1 in-1.sym
{
T 10200 14900 5 10 0 0 270 2 1
device=INPUT
T 10400 14900 5 10 1 1 270 7 1
refdes=I6#
T 10000 14900 5 10 0 0 270 2 1
footprint=anchor
}
C 10700 14900 1 90 1 in-1.sym
{
T 10400 14900 5 10 0 0 270 2 1
device=INPUT
T 10200 14900 5 10 0 0 270 2 1
footprint=anchor
T 10600 14900 5 10 1 1 270 7 1
refdes=I7
}
C 10900 14900 1 90 1 in-1.sym
{
T 10600 14900 5 10 0 0 270 2 1
device=INPUT
T 10400 14900 5 10 0 0 270 2 1
footprint=anchor
T 10800 14900 5 10 1 1 270 7 1
refdes=I7#
}
N 9200 14300 9200 7700 4
N 9000 14300 9000 7700 4
N 9600 14300 9600 7700 4
N 9400 14300 9400 7700 4
N 9800 14300 9800 7700 4
N 10000 14300 10000 7700 4
N 10200 14300 10200 7700 4
N 10400 14300 10400 7700 4
N 10600 14300 10600 7700 4
N 10800 14300 10800 7700 4
N 10600 14100 8600 14100 4
N 10000 13900 8600 13900 4
N 9400 13700 8600 13700 4
N 9000 13500 8600 13500 4
C 8600 13300 1 0 1 nor4.sym
{
T 8200 13800 5 10 1 1 0 4 1
refdes=S3
}
C 7800 13700 1 0 1 out-1.sym
{
T 7800 14000 5 10 0 0 0 6 1
device=OUTPUT
T 7200 13800 5 10 1 1 0 7 1
refdes=AND
T 7800 14200 5 10 0 0 0 6 1
footprint=anchor
}
N 10600 14100 11200 14100 4
N 10000 13900 11200 13900 4
N 9600 13700 11200 13700 4
N 9000 13500 11200 13500 4
C 11200 13300 1 0 0 nor4.sym
{
T 11600 13800 5 10 1 1 0 4 1
refdes=S1
}
C 12000 13700 1 0 0 out-1.sym
{
T 12000 14000 5 10 0 0 0 0 1
device=OUTPUT
T 12000 14200 5 10 0 0 0 0 1
footprint=anchor
T 12600 13800 5 10 1 1 0 1 1
refdes=OR
}
C 8400 13000 1 0 1 gnd-1.sym
C 11400 13000 1 0 0 gnd-1.sym
C 11300 14300 1 0 0 vdd-1.sym
C 8500 14300 1 0 1 vdd-1.sym
C 12000 12100 1 0 0 out-1.sym
{
T 12000 12400 5 10 0 0 0 0 1
device=OUTPUT
T 12000 12600 5 10 0 0 0 0 1
footprint=anchor
T 12600 12200 5 10 1 1 0 1 1
refdes=AS
}
N 10800 12400 11200 12400 4
N 11200 12200 10400 12200 4
N 11200 13000 10800 13000 4
C 11400 11400 1 0 0 gnd-1.sym
C 11300 12700 1 0 0 vdd-1.sym
C 11200 12900 1 0 0 out-1.sym
{
T 11200 13200 5 10 0 0 0 0 1
device=OUTPUT
T 11200 13400 5 10 0 0 0 0 1
footprint=anchor
T 11800 13000 5 10 1 1 0 1 1
refdes=AR#
}
C 12000 14100 1 0 0 not.sym
{
T 12350 14400 5 10 1 1 0 4 1
refdes=I1
}
N 12000 13800 12000 14400 4
C 12800 14300 1 0 0 out-1.sym
{
T 12800 14600 5 10 0 0 0 0 1
device=OUTPUT
T 13400 14400 5 10 1 1 0 1 1
refdes=CS#
T 12800 14800 5 10 0 0 0 0 1
footprint=anchor
}
C 12300 13800 1 0 0 gnd-1.sym
C 12200 14700 1 0 0 vdd-1.sym
C 8200 9500 1 0 1 vdd-1.sym
C 7600 8900 1 0 1 out-1.sym
{
T 7600 9200 5 10 0 0 0 6 1
device=OUTPUT
T 7600 9400 5 10 0 0 0 6 1
footprint=anchor
T 7000 9000 5 10 1 1 0 7 1
refdes=CR
}
C 6800 11000 1 0 0 2n7002.sym
{
T 7025 11300 5 10 0 1 0 1 1
refdes=M2
T 6900 11800 5 10 0 1 0 0 1
value=2N7002P
T 7300 11600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 8300 11600 5 10 0 1 0 0 1
device=NMOS
}
C 7800 12000 1 0 1 2n7002.sym
{
T 7575 12300 5 10 0 1 0 7 1
refdes=M1
T 7700 12800 5 10 0 1 0 6 1
value=2N7002P
T 7300 12600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 6300 12600 5 10 0 1 0 6 1
device=NMOS
}
C 7800 11300 1 0 1 2n7002.sym
{
T 7575 11600 5 10 0 1 0 7 1
refdes=M3
T 7700 12100 5 10 0 1 0 6 1
value=2N7002P
T 7300 11900 5 10 0 1 0 6 1
footprint=sot23-nmos
T 6300 11900 5 10 0 1 0 6 1
device=NMOS
}
C 7800 10700 1 0 1 2n7002.sym
{
T 7575 11000 5 10 0 1 0 7 1
refdes=M4
T 7700 11500 5 10 0 1 0 6 1
value=2N7002P
T 7300 11300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 6300 11300 5 10 0 1 0 6 1
device=NMOS
}
C 7300 9900 1 0 0 gnd-1.sym
C 7100 12500 1 0 1 out-1.sym
{
T 7100 12800 5 10 0 0 0 6 1
device=OUTPUT
T 7100 13000 5 10 0 0 0 6 1
footprint=anchor
T 6500 12600 5 10 1 1 0 7 1
refdes=CinS#
}
N 8600 12100 10800 12100 4
N 9000 12500 8600 12500 4
N 10000 12300 8600 12300 4
C 8200 11500 1 0 0 gnd-1.sym
C 7700 12300 1 270 1 out-1.sym
{
T 8000 12300 5 10 0 0 270 6 1
device=OUTPUT
T 8200 12300 5 10 0 0 270 6 1
footprint=anchor
T 7800 12900 5 10 1 1 0 3 1
refdes=CinR
}
C 12100 8100 1 0 0 2n7002.sym
{
T 12325 8400 5 10 0 1 0 1 1
refdes=M10
T 12200 8900 5 10 0 1 0 0 1
value=2N7002P
T 12600 8700 5 10 0 1 0 0 1
footprint=sot23-nmos
T 13600 8700 5 10 0 1 0 0 1
device=NMOS
}
C 13100 8100 1 0 1 2n7002.sym
{
T 13000 8900 5 10 0 1 0 6 1
value=2N7002P
T 12600 8700 5 10 0 1 0 6 1
footprint=sot23-nmos
T 11600 8700 5 10 0 1 0 6 1
device=NMOS
T 12875 8400 5 10 0 1 0 7 1
refdes=M11
}
C 11400 7900 1 0 0 gnd-1.sym
C 12700 8600 1 0 0 out-1.sym
{
T 12700 8900 5 10 0 0 0 0 1
device=OUTPUT
T 12700 9100 5 10 0 0 0 0 1
footprint=anchor
T 13300 8700 5 10 1 1 0 1 1
refdes=N
}
C 7400 12700 1 0 1 resistor-load.sym
{
T 7100 13100 5 10 0 0 0 6 1
device=RESISTOR
T 7200 12900 5 10 1 1 0 6 1
refdes=R1
T 7000 12800 5 10 0 1 0 6 1
footprint=0603-boxed
T 7000 12800 5 10 0 1 0 6 1
value=3.3k
}
C 11300 9200 1 0 0 vdd-1.sym
C 6700 12800 1 0 1 vdd-1.sym
C 8100 12800 1 0 0 vdd-1.sym
N 7400 12600 7100 12600 4
C 12900 13000 1 0 0 in-1.sym
{
T 12900 13300 5 10 0 0 0 0 1
device=INPUT
T 12900 13100 5 10 1 1 0 7 1
refdes=Vdd
T 12900 13500 5 10 0 0 0 0 1
footprint=anchor
}
C 12900 12800 1 0 0 in-1.sym
{
T 12900 13100 5 10 0 0 0 0 1
device=INPUT
T 12900 12900 5 10 1 1 0 7 1
refdes=GND
T 12900 13300 5 10 0 0 0 0 1
footprint=anchor
}
C 13300 13100 1 0 0 vdd-1.sym
C 13400 12600 1 0 0 gnd-1.sym
C 8600 11800 1 0 1 nand3.sym
{
T 8200 12300 5 10 1 1 0 4 1
refdes=S2
}
C 6800 10100 1 0 0 2n7002.sym
{
T 7025 10400 5 10 0 1 0 1 1
refdes=M5
T 6900 10900 5 10 0 1 0 0 1
value=2N7002P
T 7300 10700 5 10 0 1 0 0 1
footprint=sot23-nmos
T 8300 10700 5 10 0 1 0 0 1
device=NMOS
}
C 7800 10100 1 0 1 2n7002.sym
{
T 7575 10400 5 10 0 1 0 7 1
refdes=M6
T 7700 10900 5 10 0 1 0 6 1
value=2N7002P
T 7300 10700 5 10 0 1 0 6 1
footprint=sot23-nmos
T 6300 10700 5 10 0 1 0 6 1
device=NMOS
}
N 7400 12500 7400 12800 4
C 7200 8400 1 0 0 2n7002.sym
{
T 7425 8700 5 10 0 1 0 1 1
refdes=M7
T 7300 9200 5 10 0 1 0 0 1
value=2N7002P
T 7700 9000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 8700 9000 5 10 0 1 0 0 1
device=NMOS
}
C 8100 8200 1 0 1 gnd-1.sym
N 7200 8300 10000 8300 4
N 8600 8700 9400 8700 4
N 8600 8900 10600 8900 4
N 8600 9100 10200 9100 4
N 7200 8300 7200 8700 4
C 11200 11700 1 0 0 nor3.sym
{
T 11600 12200 5 10 1 1 0 4 1
refdes=S5
}
N 11200 12000 9800 12000 4
N 8600 9300 10800 9300 4
C 8600 8500 1 0 1 nandor.sym
{
T 7950 9000 5 10 1 1 0 4 1
refdes=S4
}
N 8000 8500 7600 8500 4
N 7600 8900 7600 9000 4
C 7300 9900 1 0 1 gnd-1.sym
N 6800 10000 10600 10000 4
N 7800 11000 10200 11000 4
N 7800 11600 9800 11600 4
N 7400 10600 7400 10800 4
N 7400 11200 7400 11400 4
N 7400 11800 7400 12100 4
N 6800 10000 6800 10400 4
N 7200 10600 7200 11100 4
N 7200 11500 7200 11800 4
N 7200 10700 7400 10700 4
N 6700 9900 10800 9900 4
N 7200 11800 7400 11800 4
N 6700 9900 6700 11300 4
N 6700 11300 6800 11300 4
N 7800 10400 9400 10400 4
C 11200 8200 1 0 0 nand.sym
{
T 11600 8700 5 10 1 1 0 4 1
refdes=S6
}
N 12000 8700 12700 8700 4
N 12600 8700 12600 8600 4
N 12500 8600 12700 8600 4
N 12700 8200 12500 8200 4
C 12500 7900 1 0 0 gnd-1.sym
N 10600 8000 12100 8000 4
N 9600 7900 13100 7900 4
N 12100 8000 12100 8400 4
N 13100 8400 13100 7900 4
N 11200 8600 9200 8600 4
N 11200 8800 9800 8800 4
C 11400 9500 1 0 0 2n7002.sym
{
T 11625 9800 5 10 0 1 0 1 1
refdes=M8
T 11500 10300 5 10 0 1 0 0 1
value=2N7002P
T 11900 10100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 12900 10100 5 10 0 1 0 0 1
device=NMOS
}
C 12400 9500 1 0 1 2n7002.sym
{
T 12175 9800 5 10 0 1 0 7 1
refdes=M9
T 12300 10300 5 10 0 1 0 6 1
value=2N7002P
T 11900 10100 5 10 0 1 0 6 1
footprint=sot23-nmos
T 10900 10100 5 10 0 1 0 6 1
device=NMOS
}
N 11800 10100 11800 10000 4
N 12000 10000 12000 10100 4
N 11600 10100 13500 10100 4
N 11800 9600 12000 9600 4
C 13100 10100 1 0 0 not.sym
{
T 13450 10400 5 10 1 1 0 4 1
refdes=I5
}
C 11200 10100 1 0 0 not.sym
{
T 11550 10400 5 10 1 1 0 4 1
refdes=I4
}
C 11800 9300 1 0 0 gnd-1.sym
C 11400 10700 1 0 0 vdd-1.sym
C 13300 10700 1 0 0 vdd-1.sym
C 12000 10300 1 0 0 out-1.sym
{
T 12000 10600 5 10 0 0 0 0 1
device=OUTPUT
T 12000 10800 5 10 0 0 0 0 1
footprint=anchor
T 12600 10400 5 10 1 1 0 1 1
refdes=E4#
}
C 13900 10300 1 0 0 out-1.sym
{
T 13900 10600 5 10 0 0 0 0 1
device=OUTPUT
T 13900 10800 5 10 0 0 0 0 1
footprint=anchor
T 14500 10400 5 10 1 1 0 1 1
refdes=E5#
}
N 11400 9800 10600 9800 4
N 12400 9800 12400 9400 4
N 12400 9400 10400 9400 4
N 13100 10400 13100 10900 4
N 13100 10900 9800 10900 4
N 11200 10400 9400 10400 4
