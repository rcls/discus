v 20201216 2
C 57100 40300 1 0 0 vdd-1.sym
C 57200 39400 1 0 0 gnd-1.sym
C 56300 39300 1 0 0 resistor-load.sym
{
T 56400 39500 5 10 1 1 0 0 1
refdes=R1
}
N 54900 40000 55000 40000 4
C 57100 38600 1 0 0 vdd-1.sym
C 57200 37700 1 0 0 gnd-1.sym
C 56300 38800 1 0 0 resistor-load.sym
{
T 56400 39000 5 10 1 1 0 0 1
refdes=R2
}
C 55000 39700 1 0 0 not.sym
{
T 55350 40000 5 10 1 1 0 4 1
refdes=I
}
C 55300 39400 1 0 0 gnd-1.sym
C 55200 40300 1 0 0 vdd-1.sym
N 57700 39400 57200 38900 4
N 57700 38900 57200 39400 4
C 54300 39900 1 0 0 in-1.sym
{
T 54300 40400 5 10 0 0 0 0 1
footprint=anchor
T 54300 40200 5 10 0 0 0 0 1
device=INPUT
T 54500 40025 5 10 1 1 0 0 1
refdes=D
}
C 54300 40200 1 0 0 in-1.sym
{
T 54300 40700 5 10 0 0 0 0 1
footprint=anchor
T 54300 40500 5 10 0 0 0 0 1
device=INPUT
T 54400 40325 5 10 1 1 0 0 1
refdes=Vdd
}
C 54300 39600 1 0 0 in-1.sym
{
T 54300 40100 5 10 0 0 0 0 1
footprint=anchor
T 54300 39900 5 10 0 0 0 0 1
device=INPUT
T 54400 39725 5 10 1 1 0 0 1
refdes=GND
}
C 57700 39900 1 0 0 out-1.sym
{
T 57700 40400 5 10 0 0 0 0 1
footprint=anchor
T 57700 40200 5 10 0 0 0 0 1
device=OUTPUT
T 57800 40050 5 10 1 1 0 0 1
refdes=Q#
}
C 57700 38200 1 0 0 out-1.sym
{
T 57700 38700 5 10 0 0 0 0 1
footprint=anchor
T 57700 38500 5 10 0 0 0 0 1
device=OUTPUT
T 57900 38350 5 10 1 1 0 0 1
refdes=Q
}
N 54900 40300 55400 40300 4
N 54900 39700 55400 39700 4
C 56900 39700 1 0 0 cnot.sym
{
T 57225 40000 5 10 1 1 0 4 1
refdes=N
}
C 56900 38000 1 0 0 cnot.sym
{
T 57225 38300 5 10 1 1 0 4 1
refdes=P
}
N 56300 39400 56300 39800 4
C 56100 40300 1 0 0 vdd-1.sym
N 56300 38900 56300 38100 4
C 55900 38500 1 0 0 vdd-1.sym
N 56300 38300 56900 38300 4
{
T 56600 38325 5 8 1 1 0 3 1
netname=S#
}
N 56300 38100 56100 38100 4
N 55000 40000 55000 38300 4
N 55000 38300 55700 38300 4
C 55900 39700 1 0 0 BSS84.sym
{
T 56125 40000 5 8 1 1 0 1 1
refdes=M1
T 56000 40500 5 10 0 1 0 0 1
value=BSS84
T 56400 40300 5 10 0 1 0 0 1
footprint=sot23-pmos
T 57400 40300 5 10 0 1 0 0 1
device=PMOS
}
C 55700 38000 1 0 0 BSS84.sym
{
T 55925 38300 5 8 1 1 0 1 1
refdes=M2
T 55800 38800 5 10 0 1 0 0 1
value=BSS84
T 56200 38600 5 10 0 1 0 0 1
footprint=sot23-pmos
T 57200 38600 5 10 0 1 0 0 1
device=PMOS
}
N 56300 39800 56900 39800 4
{
T 56600 39825 5 8 1 1 0 3 1
netname=S
}
N 56900 39800 56900 40000 4
N 57700 39400 57700 40000 4
N 57700 38900 57700 38300 4
C 56100 38900 1 90 0 capacitor.sym
{
T 55400 39100 5 10 0 0 90 0 1
device=CAPACITOR
T 55925 39225 5 10 1 1 0 0 1
refdes=C
T 55200 39100 5 10 0 0 90 0 1
symversion=0.1
T 55875 39075 5 10 1 1 0 8 1
value=1p
T 55900 39200 5 10 0 1 0 0 1
footprint=0402w
}
N 55900 38900 56300 38900 4
N 56300 39400 55900 39400 4
N 56300 40300 56300 40200 4
N 55800 40000 55900 40000 4
{
T 55850 40025 5 8 1 1 0 3 1
netname=D#
}
