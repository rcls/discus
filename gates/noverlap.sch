v 20201216 2
C 56900 40300 1 0 0 vdd-1.sym
C 57000 39400 1 0 0 gnd-1.sym
C 56300 39200 1 0 0 resistor-load.sym
{
T 56400 39400 5 10 1 1 0 0 1
refdes=R1
}
N 55000 40000 55100 40000 4
C 56900 38700 1 0 0 vdd-1.sym
C 57000 37800 1 0 0 gnd-1.sym
C 56300 38900 1 0 0 resistor-load.sym
{
T 56400 39100 5 10 1 1 0 0 1
refdes=R2
}
C 55100 39700 1 0 0 not.sym
{
T 55450 40000 5 10 1 1 0 4 1
refdes=I
}
C 55400 39400 1 0 0 gnd-1.sym
C 55300 40300 1 0 0 vdd-1.sym
N 57500 39300 57200 39000 4
N 57500 39000 57200 39300 4
C 54400 39900 1 0 0 in-1.sym
{
T 54400 40400 5 10 0 0 0 0 1
footprint=anchor
T 54400 40200 5 10 0 0 0 0 1
device=INPUT
T 54600 40025 5 10 1 1 0 0 1
refdes=D
}
C 54400 40200 1 0 0 in-1.sym
{
T 54400 40700 5 10 0 0 0 0 1
footprint=anchor
T 54400 40500 5 10 0 0 0 0 1
device=INPUT
T 54500 40325 5 10 1 1 0 0 1
refdes=Vdd
}
C 54400 39600 1 0 0 in-1.sym
{
T 54400 40100 5 10 0 0 0 0 1
footprint=anchor
T 54400 39900 5 10 0 0 0 0 1
device=INPUT
T 54500 39725 5 10 1 1 0 0 1
refdes=GND
}
C 57500 39900 1 0 0 out-1.sym
{
T 57500 40400 5 10 0 0 0 0 1
footprint=anchor
T 57500 40200 5 10 0 0 0 0 1
device=OUTPUT
T 57600 40050 5 10 1 1 0 0 1
refdes=Q#
}
C 57500 38300 1 0 0 out-1.sym
{
T 57500 38800 5 10 0 0 0 0 1
footprint=anchor
T 57500 38600 5 10 0 0 0 0 1
device=OUTPUT
T 57700 38450 5 10 1 1 0 0 1
refdes=Q
}
N 55000 40300 55500 40300 4
N 55000 39700 55500 39700 4
C 56700 39700 1 0 0 cnot.sym
{
T 57025 40000 5 10 1 1 0 4 1
refdes=N
}
C 56700 38100 1 0 0 cnot.sym
{
T 57025 38400 5 10 1 1 0 4 1
refdes=P
}
N 56300 39300 56300 39800 4
C 56100 40300 1 0 0 vdd-1.sym
N 56300 39000 56300 38200 4
C 55900 38600 1 0 0 vdd-1.sym
N 56300 38400 56700 38400 4
N 56300 38200 56100 38200 4
N 55100 40000 55100 38400 4
N 55100 38400 55700 38400 4
C 55900 39700 1 0 0 BSS84.sym
{
T 56125 40000 5 10 1 1 0 1 1
refdes=M1
T 56000 40500 5 10 0 1 0 0 1
value=BSS84
T 56400 40300 5 10 0 1 0 0 1
footprint=sot23-pmos
T 57400 40300 5 10 0 1 0 0 1
device=PMOS
}
C 55700 38100 1 0 0 BSS84.sym
{
T 55925 38400 5 10 1 1 0 1 1
refdes=M2
T 55800 38900 5 10 0 1 0 0 1
value=BSS84
T 56200 38700 5 10 0 1 0 0 1
footprint=sot23-pmos
T 57200 38700 5 10 0 1 0 0 1
device=PMOS
}
N 56300 39800 56700 39800 4
N 56700 39800 56700 40000 4
N 57500 39300 57500 40000 4
N 57500 39000 57500 38400 4
C 56100 38900 1 90 0 capacitor.sym
{
T 55400 39100 5 10 0 0 90 0 1
device=CAPACITOR
T 55925 39225 5 10 1 1 0 0 1
refdes=C
T 55200 39100 5 10 0 0 90 0 1
symversion=0.1
T 55875 39075 5 10 1 1 0 8 1
value=100p
T 55900 39200 5 10 0 1 0 0 1
footprint=0402w
}
N 55900 38900 56300 38900 4
N 56300 39400 55900 39400 4
N 56300 40300 56300 40200 4
