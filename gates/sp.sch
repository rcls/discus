v 20130925 2
C 48200 21200 1 0 1 dflipflop.sym
{
T 47900 21850 5 10 1 1 0 6 1
source=vdflipflop.sch
T 47100 21600 5 10 1 1 0 6 1
refdes=B0
}
C 51400 21200 1 0 1 dflipflop.sym
{
T 51100 21850 5 10 1 1 0 6 1
source=vdflipflop.sch
T 50300 21600 5 10 1 1 0 6 1
refdes=B1
}
N 47200 23800 49800 23800 4
N 46600 22300 46600 23900 4
C 46000 24000 1 0 0 in-1.sym
{
T 46000 24050 5 10 1 1 0 6 1
refdes=Pop
T 46000 24300 5 10 0 0 0 0 1
device=INPUT
}
N 47400 24000 47400 25200 4
C 46800 25300 1 0 0 in-1.sym
{
T 46800 25350 5 10 1 1 0 6 1
refdes=Push
T 46800 25600 5 10 0 0 0 0 1
device=INPUT
}
N 49800 24000 49700 24000 4
N 49700 24000 49700 22300 4
N 48000 25100 50700 25100 4
N 50600 23900 50600 25300 4
N 50600 25300 50700 25300 4
N 48200 25300 48200 22300 4
N 51500 25200 51500 22300 4
N 51500 22300 51400 22300 4
C 47400 23900 1 0 0 out-1.sym
{
T 47400 24200 5 10 0 0 0 0 1
device=OUTPUT
T 47650 24050 5 10 1 1 0 0 1
refdes=Q0
}
C 50600 23800 1 0 0 out-1.sym
{
T 50600 24100 5 10 0 0 0 0 1
device=OUTPUT
T 50850 23950 5 10 1 1 0 0 1
refdes=Q1
}
C 46800 23200 1 0 0 gnd-1.sym
C 50000 23100 1 0 0 gnd-1.sym
C 50900 24400 1 0 0 gnd-1.sym
C 47600 24500 1 0 0 gnd-1.sym
C 47300 20900 1 0 0 gnd-1.sym
C 50500 20900 1 0 0 gnd-1.sym
C 50400 22700 1 0 0 vdd-1.sym
C 47200 22700 1 0 0 vdd-1.sym
C 46700 24500 1 0 0 vdd-1.sym
C 49900 24400 1 0 0 vdd-1.sym
N 48200 21500 48200 20800 4
N 48200 20800 51400 20800 4
N 51400 20800 51400 21500 4
N 48200 21700 48300 21700 4
N 48300 21700 48300 20700 4
N 48300 20700 51500 20700 4
N 51500 20700 51500 21700 4
N 51500 21700 51400 21700 4
C 47500 25800 1 0 0 vdd-1.sym
C 50800 25700 1 0 0 vdd-1.sym
C 48900 21200 1 0 1 in-1.sym
{
T 48900 21500 5 10 0 0 0 6 1
device=INPUT
T 49000 21250 5 10 1 1 0 6 1
refdes=C
}
C 47600 20700 1 0 0 in-1.sym
{
T 47600 21000 5 10 0 0 0 0 1
device=INPUT
T 47650 20750 5 10 1 1 0 6 1
refdes=C#
}
C 47100 25700 1 0 0 in-1.sym
{
T 47100 26000 5 10 0 0 0 0 1
device=INPUT
T 47100 25700 5 10 1 1 0 6 1
refdes=Vdd
}
C 46800 21100 1 0 0 in-1.sym
{
T 46800 21400 5 10 0 0 0 0 1
device=INPUT
T 46800 21100 5 10 1 1 0 6 1
refdes=GND
}
N 49700 22300 49800 22300 4
C 46600 23500 1 0 0 xor.sym
{
T 46800 24100 5 10 1 1 0 0 1
refdes=S1
}
C 47400 24800 1 0 0 xor.sym
{
T 47600 25400 5 10 1 1 0 0 1
refdes=S2
}
C 49800 23400 1 0 0 xor.sym
{
T 50000 24000 5 10 1 1 0 0 1
refdes=S3
}
C 50700 24700 1 0 0 xor.sym
{
T 50900 25300 5 10 1 1 0 0 1
refdes=S4
}
N 46900 24500 47000 24500 4
N 50200 24400 50100 24400 4
N 47800 25800 48400 25800 4
C 48200 25800 1 0 0 generic-power.sym
{
T 48400 26050 5 10 1 1 0 3 1
net=Vc#:1
}
N 51100 25700 51600 25700 4
C 51400 25700 1 0 0 generic-power.sym
{
T 51600 25950 5 10 1 1 0 3 1
net=Vc#:1
}
C 49300 20800 1 0 0 generic-power.sym
{
T 49500 21050 5 10 1 1 0 3 1
net=Vc#:1
}
