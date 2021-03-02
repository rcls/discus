v 20201216 2
C 41100 53600 1 90 0 resistor-load.sym
{
T 40700 53900 5 10 0 0 90 0 1
device=RESISTOR
T 41300 54100 5 10 1 1 90 0 1
refdes=R
T 41000 54000 5 10 0 1 90 0 1
footprint=0603-boxed
T 41000 54000 5 10 0 1 90 0 1
value=3k3
}
C 41400 52900 1 0 1 nmos-switch.sym
{
T 41150 53200 5 10 1 1 0 7 1
refdes=M1
T 41300 53700 5 10 0 1 0 6 1
value=NMOS_switch
T 40900 53500 5 10 0 1 0 6 1
footprint=sot23-nmos
T 39900 53500 5 10 0 1 0 6 1
device=NMOS
}
C 39700 53900 1 0 0 nmos-switch.sym
{
T 39950 54200 5 10 1 1 0 1 1
refdes=M2
T 39800 54700 5 10 0 1 0 0 1
value=NMOS_switch
T 40200 54500 5 10 0 1 0 0 1
footprint=sot23-nmos
T 41200 54500 5 10 0 1 0 0 1
device=NMOS
}
C 39700 53300 1 0 0 nmos-switch.sym
{
T 39950 53600 5 10 1 1 0 1 1
refdes=M3
T 39800 54100 5 10 0 1 0 0 1
value=NMOS_switch
T 40200 53900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 41200 53900 5 10 0 1 0 0 1
device=NMOS
}
C 39700 52700 1 0 0 nmos-switch.sym
{
T 39950 53000 5 10 1 1 0 1 1
refdes=M4
T 39800 53500 5 10 0 1 0 0 1
value=NMOS_switch
T 40200 53300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 41200 53300 5 10 0 1 0 0 1
device=NMOS
}
C 39100 53500 1 0 0 in-1.sym
{
T 39100 54000 5 10 0 0 0 0 1
footprint=anchor
T 39100 53800 5 10 0 0 0 0 1
device=INPUT
T 39300 53700 5 10 1 1 0 0 1
refdes=C
}
C 42000 53100 1 0 1 in-1.sym
{
T 42000 53600 5 10 0 0 0 6 1
footprint=anchor
T 42000 53400 5 10 0 0 0 6 1
device=INPUT
T 41800 53250 5 10 1 1 0 6 1
refdes=A
}
C 39100 52900 1 0 0 in-1.sym
{
T 39100 53400 5 10 0 0 0 0 1
footprint=anchor
T 39100 53200 5 10 0 0 0 0 1
device=INPUT
T 39300 53100 5 10 1 1 0 0 1
refdes=D
}
C 39100 54100 1 0 0 in-1.sym
{
T 39100 54600 5 10 0 0 0 0 1
footprint=anchor
T 39100 54400 5 10 0 0 0 0 1
device=INPUT
T 39300 54300 5 10 1 1 0 0 1
refdes=B
}
C 41600 54400 1 0 1 in-1.sym
{
T 41600 54900 5 10 0 0 0 6 1
footprint=anchor
T 41600 54700 5 10 0 0 0 6 1
device=INPUT
T 41500 54300 5 10 1 1 0 6 1
refdes=Vdd
}
C 42000 52700 1 0 1 in-1.sym
{
T 42000 53200 5 10 0 0 0 6 1
footprint=anchor
T 42000 53000 5 10 0 0 0 6 1
device=INPUT
T 41900 52850 5 10 1 1 0 6 1
refdes=GND
}
C 41400 53500 1 0 0 out-1.sym
{
T 41400 54000 5 10 0 0 0 0 1
footprint=anchor
T 41400 53800 5 10 0 0 0 0 1
device=OUTPUT
T 41600 53700 5 10 1 1 0 0 1
refdes=Q
}
N 40100 53200 40100 53400 4
N 40100 54400 40500 54400 4
N 40100 54000 40100 53800 4
N 40500 54400 40500 53600 4
N 40500 53600 41400 53600 4
N 41400 52800 40100 52800 4
N 41000 53000 41000 52800 4
N 41000 53600 41000 53400 4
