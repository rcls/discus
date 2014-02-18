v 20130925 2
C 48200 21200 1 0 1 vdflipflop.sym
{
T 46850 21600 5 10 1 1 0 1 1
refdes=L
T 47400 21850 5 10 1 1 0 4 1
source=vdflipflop.sch
}
C 50800 21200 1 0 1 vdflipflop.sym
{
T 49450 21600 5 10 1 1 0 1 1
refdes=H
T 50000 21850 5 10 1 1 0 4 1
source=vdflipflop.sch
}
N 47200 23500 49200 23500 4
N 46600 22300 46600 23600 4
C 46000 23700 1 0 0 in-1.sym
{
T 46000 24200 5 10 0 0 0 0 1
footprint=anchor
T 46000 23750 5 10 1 1 0 6 1
refdes=Pop
T 46000 24000 5 10 0 0 0 0 1
device=INPUT
}
N 47400 23700 47400 24600 4
{
T 47400 24300 5 10 1 1 0 6 1
netname=Q0
}
C 46800 24700 1 0 0 in-1.sym
{
T 46800 25200 5 10 0 0 0 0 1
footprint=anchor
T 46800 24750 5 10 1 1 0 6 1
refdes=Push
T 46800 25000 5 10 0 0 0 0 1
device=INPUT
}
N 49200 23300 49200 22300 4
N 48000 24500 50000 24500 4
N 50000 23400 50000 24300 4
{
T 50000 24000 5 10 1 1 0 6 1
netname=Q1
}
N 48200 24700 48200 22300 4
N 50800 24400 50800 22300 4
C 47400 23600 1 0 0 out-1.sym
{
T 47400 24100 5 10 0 0 0 0 1
footprint=anchor
T 47400 23900 5 10 0 0 0 0 1
device=OUTPUT
T 47650 23750 5 10 1 1 0 0 1
refdes=Q0
}
C 50000 23300 1 0 0 out-1.sym
{
T 50000 23800 5 10 0 0 0 0 1
footprint=anchor
T 50000 23600 5 10 0 0 0 0 1
device=OUTPUT
T 50250 23450 5 10 1 1 0 0 1
refdes=Q1
}
C 46800 22900 1 0 0 gnd-1.sym
C 49400 22600 1 0 0 gnd-1.sym
C 50200 23600 1 0 0 gnd-1.sym
C 47600 23900 1 0 0 gnd-1.sym
C 47300 20900 1 0 0 gnd-1.sym
C 49900 20900 1 0 0 gnd-1.sym
C 49800 22700 1 0 0 vdd-1.sym
C 47200 22700 1 0 0 vdd-1.sym
C 46700 24200 1 0 0 vdd-1.sym
C 49300 23900 1 0 0 vdd-1.sym
N 48200 21700 48300 21700 4
N 48300 21700 48300 21000 4
N 48300 21000 50900 21000 4
N 50900 21000 50900 21700 4
N 50900 21700 50800 21700 4
C 47500 25200 1 0 0 vdd-1.sym
C 50100 24900 1 0 0 vdd-1.sym
C 48900 21200 1 0 1 in-1.sym
{
T 48900 21700 5 10 0 0 0 6 1
footprint=anchor
T 48900 21500 5 10 0 0 0 6 1
device=INPUT
T 48900 21300 5 10 1 1 0 1 1
refdes=ϕ1
}
C 47100 25100 1 0 0 in-1.sym
{
T 47100 25600 5 10 0 0 0 0 1
footprint=anchor
T 47100 25400 5 10 0 0 0 0 1
device=INPUT
T 47100 25100 5 10 1 1 0 6 1
refdes=Vdd
}
C 46800 21100 1 0 0 in-1.sym
{
T 46800 21600 5 10 0 0 0 0 1
footprint=anchor
T 46800 21400 5 10 0 0 0 0 1
device=INPUT
T 46800 21100 5 10 1 1 0 6 1
refdes=GND
}
C 46600 23200 1 0 0 xor.sym
{
T 46800 23800 5 10 1 1 0 0 1
refdes=C
}
C 47400 24200 1 0 0 xor.sym
{
T 47600 24800 5 10 1 1 0 0 1
refdes=A
}
C 49200 22900 1 0 0 xor.sym
{
T 49400 23500 5 10 1 1 0 0 1
refdes=D
}
C 50000 23900 1 0 0 xor.sym
{
T 50200 24500 5 10 1 1 0 0 1
refdes=B
}
C 51500 23600 1 0 0 not.sym
{
T 51850 23900 5 10 1 1 0 4 1
refdes=I
}
C 51500 21700 1 0 0 not.sym
{
T 51850 22000 5 10 1 1 0 4 1
refdes=J
}
N 51300 23900 51500 23900 4
{
T 51300 23900 5 10 1 1 0 7 1
netname=Q0
}
N 51300 22000 51500 22000 4
{
T 51300 22000 5 10 1 1 0 7 1
netname=Q1
}
C 51700 24200 1 0 0 vdd-1.sym
C 51800 23300 1 0 0 gnd-1.sym
C 51800 21400 1 0 0 gnd-1.sym
C 51700 22300 1 0 0 vdd-1.sym
C 52300 21900 1 0 0 out-1.sym
{
T 52300 22400 5 10 0 0 0 0 1
footprint=anchor
T 52300 22200 5 10 0 0 0 0 1
device=OUTPUT
T 52550 22050 5 10 1 1 0 3 1
refdes=Q1#
}
C 52300 23800 1 0 0 out-1.sym
{
T 52300 24300 5 10 0 0 0 0 1
footprint=anchor
T 52300 24100 5 10 0 0 0 0 1
device=OUTPUT
T 52550 23950 5 10 1 1 0 3 1
refdes=Q0#
}
