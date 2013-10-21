v 20121123 2
C 26200 29200 1 0 0 2n7002.sym
{
T 26500 29500 5 10 1 1 0 0 1
refdes=M3
T 26300 30000 5 10 0 1 0 0 1
value=2N7002P
T 26700 29800 5 10 0 1 0 0 1
footprint=SOT23
T 27700 29800 5 10 0 1 0 0 1
device=NMOS
}
C 26200 30200 1 0 0 BSS84.sym
{
T 26500 30400 5 10 1 1 0 0 1
refdes=M4
T 26300 31000 5 10 0 1 0 0 1
value=BSS84
T 26700 30800 5 10 0 1 0 0 1
footprint=SOT23
T 27700 30800 5 10 0 1 0 0 1
device=PMOS
}
C 24000 29300 1 0 0 2n7002.sym
{
T 23900 29400 5 10 1 1 0 0 1
refdes=M1
T 24100 30100 5 10 0 1 0 0 1
value=2N7002P
T 24500 29900 5 10 0 1 0 0 1
footprint=SOT23
T 25500 29900 5 10 0 1 0 0 1
device=NMOS
}
N 26600 30300 26600 29700 4
C 26600 29900 1 0 0 out-1.sym
{
T 26600 30200 5 10 0 0 0 0 1
device=OUTPUT
T 26800 29700 5 10 1 1 0 0 1
refdes=OUT
}
C 24800 29300 1 0 1 pdtc114.sym
{
T 24900 29400 5 10 1 1 0 6 1
refdes=Q1
T 24100 29800 5 10 0 1 0 6 1
footprint=SC70
T 24700 30000 5 10 0 1 0 6 1
value=PDTC114TU
}
C 26000 30100 1 90 0 resistor-1.sym
{
T 25600 30400 5 10 0 0 90 0 1
device=RESISTOR
T 25800 30800 5 10 1 1 180 0 1
refdes=R2
T 26000 30100 5 10 0 1 0 0 1
value=3k3
}
C 24500 30100 1 90 0 resistor-1.sym
{
T 24100 30400 5 10 0 0 90 0 1
device=RESISTOR
T 24800 30800 5 10 1 1 180 0 1
refdes=R1
T 24500 30100 5 10 0 1 0 0 1
value=3k3
}
N 24400 29800 24400 30100 4
N 24400 29900 25500 29900 4
N 24400 31000 26600 31000 4
N 26600 31000 26600 30700 4
N 24400 29000 26600 29000 4
N 26600 29000 26600 29300 4
N 24400 29000 24400 29400 4
C 23800 30900 1 0 0 in-1.sym
{
T 23800 31200 5 10 0 0 0 0 1
device=INPUT
T 23900 30800 5 10 1 1 0 0 1
refdes=Vss
}
C 23800 28900 1 0 0 in-1.sym
{
T 23800 29200 5 10 0 0 0 0 1
device=INPUT
T 23900 29100 5 10 1 1 0 0 1
refdes=GND
}
C 23400 29500 1 0 0 in-1.sym
{
T 23400 29800 5 10 0 0 0 0 1
device=INPUT
T 23600 29700 5 10 1 1 0 0 1
refdes=IN#
}
C 25400 29500 1 0 1 in-1.sym
{
T 25400 29800 5 10 0 0 0 6 1
device=INPUT
T 25300 29700 5 10 1 1 0 6 1
refdes=FB#
}
N 26200 29500 26200 30500 4
C 25500 29600 1 0 0 2n7002.sym
{
T 25700 29900 5 10 1 1 0 0 1
refdes=M2
T 25600 30400 5 10 0 1 0 0 1
value=2N7002P
T 26000 30200 5 10 0 1 0 0 1
footprint=SOT23
T 27000 30200 5 10 0 1 0 0 1
device=NMOS
}
N 26200 30100 25900 30100 4
N 25900 29700 25900 29000 4
