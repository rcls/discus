v 20121123 2
C 49300 67500 1 0 0 flipflop.sym
{
T 49700 68200 5 10 1 1 0 0 1
source=flipflop.sch
T 50400 68000 5 10 1 1 0 0 1
refdes=S1
}
C 48100 67900 1 0 0 2n7002.sym
{
T 48400 68200 5 10 1 1 0 0 1
refdes=M3
T 48200 68700 5 10 0 1 0 0 1
value=2N7002P
T 48600 68500 5 10 0 1 0 0 1
footprint=SOT23
T 49600 68500 5 10 0 1 0 0 1
device=NMOS
}
C 48700 67900 1 0 0 in-1.sym
{
T 48700 68200 5 10 0 0 0 0 1
device=INPUT
T 48800 68100 5 10 1 1 0 0 1
refdes=C
}
C 48700 67700 1 0 0 in-1.sym
{
T 48700 68000 5 10 0 0 0 0 1
device=INPUT
T 48800 67600 5 10 1 1 0 0 1
refdes=C#
}
C 50200 66900 1 90 0 in-1.sym
{
T 49900 66900 5 10 0 0 90 0 1
device=INPUT
T 50300 67100 5 10 1 1 90 0 1
refdes=GND
}
C 50000 69600 1 270 0 in-1.sym
{
T 50300 69600 5 10 0 0 270 0 1
device=INPUT
T 50200 69400 5 10 1 1 270 0 1
refdes=Vdd
}
C 46200 68100 1 0 0 in-1.sym
{
T 46200 68400 5 10 0 0 0 0 1
device=INPUT
T 46600 68300 5 10 1 1 0 0 1
refdes=D
}
C 50900 68500 1 0 0 out-1.sym
{
T 50900 68800 5 10 0 0 0 0 1
device=OUTPUT
T 51000 68700 5 10 1 1 0 0 1
refdes=Q
}
C 50900 68300 1 0 0 out-1.sym
{
T 50900 68600 5 10 0 0 0 0 1
device=OUTPUT
T 51000 68200 5 10 1 1 0 0 1
refdes=Q#
}
N 47200 67500 50100 67500 4
N 48500 68000 48500 67500 4
N 48500 68400 49300 68400 4
N 47200 68600 49300 68600 4
C 46800 67900 1 0 0 2n7002.sym
{
T 46900 68600 5 10 1 1 0 0 1
refdes=M1
T 46900 68700 5 10 0 1 0 0 1
value=2N7002P
T 47300 68500 5 10 0 1 0 0 1
footprint=SOT23
T 48300 68500 5 10 0 1 0 0 1
device=NMOS
}
N 47200 68000 47200 67500 4
N 47700 67900 47700 67500 4
N 47700 69000 50100 69000 4
N 46800 67800 46800 68200 4
C 47300 67900 1 0 0 not.sym
{
T 47550 68150 5 10 1 1 0 0 1
refdes=S2
}
N 47200 68600 47200 68400 4
N 46800 67800 47300 67800 4
N 47300 67800 47300 68200 4
N 47700 68500 47700 69000 4