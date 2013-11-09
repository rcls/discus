v 20121123 2
C 60500 61800 1 0 1 gnd-1.sym
C 58000 61800 1 0 1 gnd-1.sym
C 55500 61800 1 0 1 gnd-1.sym
C 53100 61800 1 0 1 gnd-1.sym
C 53200 63600 1 0 1 3.3V-plus-1.sym
C 55600 63600 1 0 1 3.3V-plus-1.sym
C 58100 63600 1 0 1 3.3V-plus-1.sym
C 60600 63600 1 0 1 3.3V-plus-1.sym
N 52200 62400 52200 61500 4
N 52100 61500 59600 61500 4
N 59600 61500 59600 62400 4
N 57100 62400 57100 61500 4
N 54600 62400 54600 61500 4
N 59600 62600 59500 62600 4
N 59500 62600 59500 61700 4
N 52100 61700 59500 61700 4
N 52200 62600 52100 62600 4
N 52100 62600 52100 61700 4
N 54600 62600 54500 62600 4
N 54500 62600 54500 61700 4
N 57100 62600 57000 62600 4
N 57000 62600 57000 61700 4
C 54000 64000 1 0 0 gnd-1.sym
C 56500 64300 1 0 0 gnd-1.sym
C 59000 64300 1 0 0 gnd-1.sym
C 54900 64300 1 0 0 3.3V-plus-1.sym
C 53900 65600 1 0 0 3.3V-plus-1.sym
C 56400 65600 1 0 0 3.3V-plus-1.sym
C 58900 65600 1 0 0 3.3V-plus-1.sym
N 52200 65200 53800 65200 4
N 52200 63000 52200 65200 4
C 52200 62100 1 0 0 jkflipflop.sym
{
T 53300 62600 5 10 1 1 0 0 1
refdes=S3
T 52500 62800 5 10 1 1 0 0 1
source=jkflipflop.sch
}
C 54600 62100 1 0 0 jkflipflop.sym
{
T 55700 62600 5 10 1 1 0 0 1
refdes=S5
T 54900 62800 5 10 1 1 0 0 1
source=jkflipflop.sch
}
C 57100 62100 1 0 0 jkflipflop.sym
{
T 58200 62600 5 10 1 1 0 0 1
refdes=S7
T 57400 62800 5 10 1 1 0 0 1
source=jkflipflop.sch
}
C 59600 62100 1 0 0 jkflipflop.sym
{
T 60700 62600 5 10 1 1 0 0 1
refdes=S8
T 59900 62800 5 10 1 1 0 0 1
source=jkflipflop.sch
}
N 54600 63000 54600 63900 4
C 53800 64600 1 0 0 nand.sym
{
T 54100 65050 5 10 1 1 0 0 1
refdes=S1
}
C 56300 64600 1 0 0 nor.sym
{
T 56600 65050 5 10 1 1 0 0 1
refdes=S4
}
C 54300 64700 1 270 0 not.sym
{
T 54550 64450 5 10 1 1 270 0 1
refdes=S2
}
N 53800 63200 53800 65000 4
N 54600 64700 54600 65200 4
N 54600 65200 56300 65200 4
N 57100 63000 57100 65100 4
N 54100 64300 54300 64300 4
N 54100 64300 54100 64600 4
N 55100 64300 54900 64300 4
N 59600 63000 59600 65100 4
N 56200 63000 56300 63000 4
N 56300 63000 56300 65000 4
N 58800 63000 58800 64900 4
C 58800 64600 1 0 0 nor3.sym
{
T 59100 65050 5 10 1 1 0 0 1
refdes=S6
}
N 56300 65200 56300 66000 4
N 56300 66000 58800 66000 4
N 58800 66000 58800 65300 4
N 58700 65100 58800 65100 4
N 56300 64100 58700 64100 4
N 58700 64100 58700 65100 4
N 58800 63000 58700 63000 4
C 51500 61600 1 0 0 in-1.sym
{
T 51500 61900 5 10 0 0 0 0 1
device=INPUT
T 51300 61600 5 10 1 1 0 0 1
refdes=C
}
C 51500 61400 1 0 0 in-1.sym
{
T 51500 61700 5 10 0 0 0 0 1
device=INPUT
T 51200 61400 5 10 1 1 0 0 1
refdes=C#
}
C 51600 65100 1 0 0 in-1.sym
{
T 51600 65400 5 10 0 0 0 0 1
device=INPUT
T 51800 65300 5 10 1 1 0 0 1
refdes=CE
}
C 53500 65500 1 0 0 in-1.sym
{
T 53500 65800 5 10 0 0 0 0 1
device=INPUT
T 53600 65400 5 10 1 1 0 0 1
refdes=Vdd
}
C 52400 62000 1 0 0 in-1.sym
{
T 52400 62300 5 10 0 0 0 0 1
device=INPUT
T 52500 61900 5 10 1 1 0 0 1
refdes=GND
}
C 53800 63100 1 0 0 out-1.sym
{
T 53800 63400 5 10 0 0 0 0 1
device=OUTPUT
T 53900 63300 5 10 1 1 0 0 1
refdes=Q0
}
C 53800 62900 1 0 0 out-1.sym
{
T 53800 63200 5 10 0 0 0 0 1
device=OUTPUT
T 53900 62800 5 10 1 1 0 0 1
refdes=Q0#
}
C 56200 63100 1 0 0 out-1.sym
{
T 56200 63400 5 10 0 0 0 0 1
device=OUTPUT
T 56400 63300 5 10 1 1 0 0 1
refdes=Q1
}
C 56200 62900 1 0 0 out-1.sym
{
T 56200 63200 5 10 0 0 0 0 1
device=OUTPUT
T 56300 62800 5 10 1 1 0 0 1
refdes=Q1#
}
C 58700 63100 1 0 0 out-1.sym
{
T 58700 63400 5 10 0 0 0 0 1
device=OUTPUT
T 58900 63300 5 10 1 1 0 0 1
refdes=Q2
}
C 58700 62900 1 0 0 out-1.sym
{
T 58700 63200 5 10 0 0 0 0 1
device=OUTPUT
T 58800 62800 5 10 1 1 0 0 1
refdes=Q2#
}
C 61200 63100 1 0 0 out-1.sym
{
T 61200 63400 5 10 0 0 0 0 1
device=OUTPUT
T 61300 63300 5 10 1 1 0 0 1
refdes=Q3
}
C 61200 62900 1 0 0 out-1.sym
{
T 61200 63200 5 10 0 0 0 0 1
device=OUTPUT
T 61300 62800 5 10 1 1 0 0 1
refdes=Q3#
}
