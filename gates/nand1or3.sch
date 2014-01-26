v 20130925 2
C 41500 54000 1 90 0 resistor-load.sym
{
T 41100 54300 5 10 0 0 90 0 1
device=RESISTOR
T 41700 54500 5 10 1 1 90 0 1
refdes=R
T 41400 54400 5 10 0 1 90 0 1
footprint=0603-boxed
T 41400 54400 5 10 0 1 90 0 1
value=3k3
}
C 41000 53500 1 0 0 2n7002.sym
{
T 41300 53800 5 10 1 1 0 0 1
refdes=M1
T 41100 54300 5 10 0 1 0 0 1
value=2N7002P
T 41500 54100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 42500 54100 5 10 0 1 0 0 1
device=NMOS
}
C 39700 52700 1 0 0 2n7002.sym
{
T 40000 53000 5 10 1 1 0 0 1
refdes=M2
T 39800 53500 5 10 0 1 0 0 1
value=2N7002P
T 40200 53300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 41200 53300 5 10 0 1 0 0 1
device=NMOS
}
C 41000 52700 1 0 0 2n7002.sym
{
T 41300 53000 5 10 1 1 0 0 1
refdes=M3
T 41100 53500 5 10 0 1 0 0 1
value=2N7002P
T 41500 53300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 42500 53300 5 10 0 1 0 0 1
device=NMOS
}
C 42300 52700 1 0 0 2n7002.sym
{
T 42600 53000 5 10 1 1 0 0 1
refdes=M4
T 42400 53500 5 10 0 1 0 0 1
value=2N7002P
T 42800 53300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 43800 53300 5 10 0 1 0 0 1
device=NMOS
}
C 40400 52900 1 0 0 in-1.sym
{
T 40400 53400 5 10 0 0 0 0 1
footprint=anchor
T 40400 53200 5 10 0 0 0 0 1
device=INPUT
T 40600 53100 5 10 1 1 0 0 1
refdes=C
}
C 40400 53700 1 0 0 in-1.sym
{
T 40400 54200 5 10 0 0 0 0 1
footprint=anchor
T 40400 54000 5 10 0 0 0 0 1
device=INPUT
T 40600 53900 5 10 1 1 0 0 1
refdes=A
}
C 41700 52900 1 0 0 in-1.sym
{
T 41700 53400 5 10 0 0 0 0 1
footprint=anchor
T 41700 53200 5 10 0 0 0 0 1
device=INPUT
T 41900 53100 5 10 1 1 0 0 1
refdes=D
}
C 39100 52900 1 0 0 in-1.sym
{
T 39100 53400 5 10 0 0 0 0 1
footprint=anchor
T 39100 53200 5 10 0 0 0 0 1
device=INPUT
T 39300 53100 5 10 1 1 0 0 1
refdes=B
}
C 40800 54800 1 0 0 in-1.sym
{
T 40800 55300 5 10 0 0 0 0 1
footprint=anchor
T 40800 55100 5 10 0 0 0 0 1
device=INPUT
T 40900 54700 5 10 1 1 0 0 1
refdes=Vdd
}
C 39100 52400 1 0 0 in-1.sym
{
T 39100 52900 5 10 0 0 0 0 1
footprint=anchor
T 39100 52700 5 10 0 0 0 0 1
device=INPUT
T 39200 52600 5 10 1 1 0 0 1
refdes=GND
}
C 41400 53900 1 0 0 out-1.sym
{
T 41400 54400 5 10 0 0 0 0 1
footprint=anchor
T 41400 54200 5 10 0 0 0 0 1
device=OUTPUT
T 41600 54100 5 10 1 1 0 0 1
refdes=Q
}
N 40100 53400 42700 53400 4
N 42700 53200 42700 53400 4
N 41400 53200 41400 53400 4
N 41400 53400 41400 53600 4
N 42700 52800 42700 52500 4
N 42700 52500 39700 52500 4
N 40100 52500 40100 52800 4
N 41400 52800 41400 52500 4
N 40100 53200 40100 53400 4
