v 20130925 2
C 12300 9200 1 0 0 clockdrive.sym
{
T 13150 9800 5 10 1 1 0 4 1
source=clockdrive.sch
T 13100 10050 5 10 1 1 0 4 1
refdes=P0
}
C 12300 7100 1 0 0 clockdrive.sym
{
T 13150 7700 5 10 1 1 0 4 1
source=clockdrive.sch
T 13100 7950 5 10 1 1 0 4 1
refdes=P1
}
C 13600 8700 1 0 0 2n7002.sym
{
T 13825 9000 5 10 1 1 0 1 1
refdes=M0
T 13700 9500 5 10 0 1 0 0 1
value=2N7002P
T 14100 9300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 15100 9300 5 10 0 1 0 0 1
device=NMOS
}
C 13600 6600 1 0 0 2n7002.sym
{
T 13825 6900 5 10 1 1 0 1 1
refdes=M1
T 13700 7400 5 10 0 1 0 0 1
value=2N7002P
T 14100 7200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 15100 7200 5 10 0 1 0 0 1
device=NMOS
}
C 13000 6800 1 0 0 gnd-1.sym
C 13000 8900 1 0 0 gnd-1.sym
C 12900 8500 1 0 0 vdd-1.sym
C 12900 10600 1 0 0 vdd-1.sym
C 13900 8500 1 0 0 gnd-1.sym
C 13900 6400 1 0 0 gnd-1.sym
N 14000 7100 14000 7500 4
{
T 14000 7200 5 10 1 1 0 0 1
netname=Raw1
}
N 14000 9200 14000 9600 4
{
T 14000 9300 5 10 1 1 0 0 1
netname=Raw0
}
N 11900 6900 13600 6900 4
N 13600 9000 11900 9000 4
C 14100 10400 1 90 1 phi0.sym
C 14100 8300 1 90 1 phi1.sym
C 12000 9500 1 0 0 phi1.sym
C 12000 7400 1 0 0 phi0.sym
C 11300 8900 1 0 0 in-1.sym
{
T 11300 9200 5 10 0 0 0 0 1
device=INPUT
T 11300 9000 5 10 1 1 0 7 1
refdes=C1
T 11300 9400 5 10 0 0 0 0 1
footprint=anchor
}
C 14000 10000 1 0 0 out-1.sym
{
T 14000 10300 5 10 0 0 0 0 1
device=OUTPUT
T 14600 10100 5 10 1 1 0 1 1
refdes=ϕ0
T 14000 10500 5 10 0 0 0 0 1
footprint=anchor
}
C 11300 6800 1 0 0 in-1.sym
{
T 11300 7100 5 10 0 0 0 0 1
device=INPUT
T 11300 6900 5 10 1 1 0 7 1
refdes=C0
T 11300 7300 5 10 0 0 0 0 1
footprint=anchor
}
C 12500 10500 1 0 0 in-1.sym
{
T 12500 10800 5 10 0 0 0 0 1
device=INPUT
T 12500 10600 5 10 1 1 0 7 1
refdes=Vdd
T 12500 11000 5 10 0 0 0 0 1
footprint=anchor
}
C 12500 7000 1 0 0 in-1.sym
{
T 12500 7300 5 10 0 0 0 0 1
device=INPUT
T 12500 7100 5 10 1 1 0 7 1
refdes=GND
T 12500 7500 5 10 0 0 0 0 1
footprint=anchor
}
C 14000 7900 1 0 0 out-1.sym
{
T 14000 8200 5 10 0 0 0 0 1
device=OUTPUT
T 14600 8000 5 10 1 1 0 1 1
refdes=ϕ1
T 14000 8400 5 10 0 0 0 0 1
footprint=anchor
}
C 15300 8500 1 0 0 in-1.sym
{
T 15300 8800 5 10 0 0 0 0 1
device=INPUT
T 15300 9000 5 10 0 0 0 0 1
footprint=anchor
T 15300 8600 5 10 1 1 0 7 1
refdes=STA#
}
C 15500 8600 1 0 0 not.sym
{
T 15850 8900 5 10 1 1 0 4 1
refdes=I
}
C 16300 8600 1 0 0 cnot.sym
{
T 16625 8900 5 10 1 1 0 4 1
refdes=J
}
C 17100 8800 1 0 0 out-1.sym
{
T 17100 9100 5 10 0 0 0 0 1
device=OUTPUT
T 17100 9300 5 10 0 0 0 0 1
footprint=anchor
T 17700 8900 5 10 1 1 0 1 1
refdes=MW
}
C 16600 8300 1 0 0 gnd-1.sym
C 16500 9200 1 0 0 vdd-1.sym
C 15700 9200 1 0 0 vdd-1.sym
N 15500 8900 15300 8900 4
{
T 15300 8900 5 10 1 1 0 7 1
netname=Raw1
}
C 17100 9100 1 0 0 pdtc124.sym
{
T 17800 9600 5 10 0 1 0 0 1
footprint=sot323-bjt
T 17200 9800 5 10 0 1 0 0 1
value=PDTC124TU
T 17300 9400 5 10 1 1 0 1 1
refdes=Q
}
N 17100 9400 17100 8900 4
C 17400 8900 1 0 0 gnd-1.sym
N 17500 9600 17700 9600 4
{
T 17700 9600 5 10 1 1 0 1 1
netname=Raw0
}