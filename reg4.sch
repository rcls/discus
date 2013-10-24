v 20121123 2
C 57400 63400 1 0 0 sramcell2.sym
{
T 58550 63750 5 10 1 1 0 0 1
refdes=S0
T 57650 64200 5 10 1 1 0 0 1
source=sramcell2.sch
}
C 59700 63400 1 0 0 sramcell2.sym
{
T 60850 63750 5 10 1 1 0 0 1
refdes=S1
T 59950 64200 5 10 1 1 0 0 1
source=sramcell2.sch
}
C 62000 63400 1 0 0 sramcell2.sym
{
T 63150 63750 5 10 1 1 0 0 1
refdes=S2
T 62250 64200 5 10 1 1 0 0 1
source=sramcell2.sch
}
C 64300 63400 1 0 0 sramcell2.sym
{
T 65450 63750 5 10 1 1 0 0 1
refdes=S3
T 64550 64200 5 10 1 1 0 0 1
source=sramcell2.sch
}
C 58200 65700 1 0 1 out-1.sym
{
T 58200 66000 5 10 0 0 0 6 1
device=OUTPUT
T 58150 65850 5 10 1 1 0 6 1
refdes=Vdd
}
C 66800 63300 1 0 0 out-1.sym
{
T 66800 63600 5 10 0 0 0 0 1
device=OUTPUT
T 66900 63500 5 10 1 1 0 0 1
refdes=GND
}
C 56800 64400 1 0 0 in-1.sym
{
T 56800 64700 5 10 0 0 0 0 1
device=INPUT
T 57000 64550 5 10 1 1 0 0 1
refdes=S0
}
C 59100 64400 1 0 0 in-1.sym
{
T 59100 64700 5 10 0 0 0 0 1
device=INPUT
T 59300 64550 5 10 1 1 0 0 1
refdes=S1
}
C 63700 64400 1 0 0 in-1.sym
{
T 63700 64700 5 10 0 0 0 0 1
device=INPUT
T 63900 64550 5 10 1 1 0 0 1
refdes=S3
}
C 61400 64400 1 0 0 in-1.sym
{
T 61400 64700 5 10 0 0 0 0 1
device=INPUT
T 61600 64550 5 10 1 1 0 0 1
refdes=S2
}
C 56800 63900 1 0 0 in-1.sym
{
T 56800 64200 5 10 0 0 0 0 1
device=INPUT
T 56950 64050 5 10 1 1 0 0 1
refdes=SB0
}
C 63700 63900 1 0 0 in-1.sym
{
T 63700 64200 5 10 0 0 0 0 1
device=INPUT
T 63850 64050 5 10 1 1 0 0 1
refdes=S3B
}
C 59100 63900 1 0 0 in-1.sym
{
T 59100 64200 5 10 0 0 0 0 1
device=INPUT
T 59250 64050 5 10 1 1 0 0 1
refdes=S1B
}
C 61400 63900 1 0 0 in-1.sym
{
T 61400 64200 5 10 0 0 0 0 1
device=INPUT
T 61550 64050 5 10 1 1 0 0 1
refdes=S2B
}
N 58200 65800 66800 65800 4
N 58200 63400 66800 63400 4
N 57400 64700 57400 65400 4
N 57400 65400 66200 65400 4
N 64300 65400 64300 64700 4
N 59000 64700 59000 65200 4
N 59000 65200 66200 65200 4
N 65900 65200 65900 64700 4
N 61300 64700 61300 65200 4
N 63600 64700 63600 65200 4
N 59700 64700 59650 64700 4
N 59650 64700 59650 65400 4
N 62000 64700 62000 65400 4
C 66200 64300 1 0 0 regio.sym
{
T 66450 65000 5 10 1 1 0 0 1
source=regio.sch
T 66700 64800 5 10 1 1 0 0 1
refdes=S4
}
N 66800 63400 66800 64300 4
N 58200 65100 58200 65800 4
N 60500 65100 60500 65800 4
N 62800 65100 62800 65800 4
N 65100 65100 65100 65800 4
N 57400 63800 57400 63200 4
N 57400 63200 64300 63200 4
N 64300 63200 64300 63800 4
N 59700 63200 59700 63800 4
N 62000 63200 62000 63800 4
N 66200 64800 66000 64800 4
N 66000 64800 66000 64600 4
C 66100 64000 1 90 0 in-1.sym
{
T 65800 64000 5 10 0 0 90 0 1
device=INPUT
T 65900 63800 5 10 1 1 0 0 1
refdes=C
}
C 66300 64000 1 90 0 in-1.sym
{
T 66000 64000 5 10 0 0 90 0 1
device=INPUT
T 66100 63800 5 10 1 1 0 0 1
refdes=C#
}
C 67400 65300 1 0 0 out-1.sym
{
T 67400 65600 5 10 0 0 0 0 1
device=OUTPUT
T 68050 65350 5 10 1 1 0 0 1
refdes=Q
}
C 67400 65100 1 0 0 out-1.sym
{
T 67400 65400 5 10 0 0 0 0 1
device=OUTPUT
T 68050 65150 5 10 1 1 0 0 1
refdes=Q#
}
C 68000 64700 1 0 1 in-1.sym
{
T 68000 65000 5 10 0 0 0 6 1
device=INPUT
T 68200 64750 5 10 1 1 0 6 1
refdes=D
}
C 68000 64500 1 0 1 in-1.sym
{
T 68000 64800 5 10 0 0 0 6 1
device=INPUT
T 68300 64550 5 10 1 1 0 6 1
refdes=WE
}
C 63500 62100 1 90 0 resistor-1.sym
{
T 63100 62400 5 10 0 0 90 0 1
device=RESISTOR
T 63800 62600 5 10 1 1 180 0 1
refdes=R3
T 63500 62100 5 10 0 1 0 0 1
value=3k3
}
C 63000 61600 1 0 0 pdtc114.sym
{
T 63400 61800 5 10 1 1 0 0 1
refdes=Q1
T 63700 62100 5 10 0 1 0 0 1
footprint=SC70
T 63100 62300 5 10 0 1 0 0 1
value=PDTC114TU
}
C 63400 62000 1 0 0 out-1.sym
{
T 63400 62300 5 10 0 0 0 0 1
device=OUTPUT
T 64050 62050 5 10 1 1 0 0 1
refdes=QB
}
N 63000 61900 63000 63200 4
C 63400 62900 1 0 0 out-1.sym
{
T 63400 63200 5 10 0 0 0 0 1
device=OUTPUT
T 64050 62950 5 10 1 1 0 0 1
refdes=Vdd
}
C 63400 61600 1 0 0 out-1.sym
{
T 63400 61900 5 10 0 0 0 0 1
device=OUTPUT
T 64100 61600 5 10 1 1 0 0 1
refdes=GND
}
