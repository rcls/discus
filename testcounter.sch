v 20121123 2
C 60400 61800 1 0 1 gnd-1.sym
C 58000 61800 1 0 1 gnd-1.sym
C 55500 61800 1 0 1 gnd-1.sym
C 53100 61800 1 0 1 gnd-1.sym
C 53200 63600 1 0 1 3.3V-plus-1.sym
C 55600 63600 1 0 1 3.3V-plus-1.sym
C 58100 63600 1 0 1 3.3V-plus-1.sym
C 60500 63600 1 0 1 3.3V-plus-1.sym
C 49400 64200 1 0 0 clockdrive.sym
{
T 49700 64800 5 10 1 1 0 0 1
source=clockdrive.sch
T 50600 64600 5 10 1 1 0 0 1
refdes=S1
}
C 49400 61900 1 0 0 clockdrive.sym
{
T 49700 62500 5 10 1 1 0 0 1
source=clockdrive.sch
T 50600 62300 5 10 1 1 0 0 1
refdes=S2
}
N 52200 62400 52200 61500 4
N 49300 61500 59500 61500 4
N 59500 61500 59500 62400 4
N 57100 62400 57100 61500 4
N 54600 62400 54600 61500 4
N 59500 62600 59400 62600 4
N 59400 62600 59400 61700 4
N 51100 61700 59400 61700 4
N 52200 62600 52100 62600 4
N 52100 62600 52100 61700 4
N 54600 62600 54500 62600 4
N 54500 62600 54500 61700 4
N 57100 62600 57000 62600 4
N 57000 62600 57000 61700 4
C 54000 64000 1 0 0 gnd-1.sym
C 56500 64300 1 0 0 gnd-1.sym
C 58900 64000 1 0 0 gnd-1.sym
C 54900 64300 1 0 0 3.3V-plus-1.sym
C 53900 65600 1 0 0 3.3V-plus-1.sym
C 56400 65600 1 0 0 3.3V-plus-1.sym
C 58800 65600 1 0 0 3.3V-plus-1.sym
N 51100 61700 51100 63800 4
{
T 50900 63400 5 10 1 1 0 0 1
netname=C
}
N 51100 65100 51300 65100 4
{
T 51200 65200 5 10 1 1 0 0 1
netname=C#
}
N 51300 65100 51300 61500 4
N 49300 61500 49300 62300 4
N 49300 62300 49400 62300 4
N 49400 64600 49400 63800 4
N 49400 63800 51100 63800 4
C 50400 63300 1 0 1 3.3V-plus-1.sym
C 50000 65600 1 0 0 3.3V-plus-1.sym
C 50100 63900 1 0 0 gnd-1.sym
C 50100 61600 1 0 0 gnd-1.sym
N 53100 65200 53800 65200 4
N 52200 63000 52200 64400 4
{
T 52500 63800 5 10 1 1 180 0 1
netname=T0
}
C 48000 63100 1 270 0 vpulse-1.sym
{
T 48900 62450 5 10 1 1 0 0 1
refdes=V2
T 48850 62400 5 10 0 0 270 0 1
device=vpulse
T 49050 62400 5 10 0 0 270 0 1
footprint=none
T 47200 62050 5 10 1 1 0 0 1
value=pulse 0 3.3 0u 1u 1u 1n 10u
}
C 48000 65400 1 270 0 vpulse-1.sym
{
T 48650 64700 5 10 1 1 270 0 1
refdes=V3
T 48850 64700 5 10 0 0 270 0 1
device=vpulse
T 49050 64700 5 10 0 0 270 0 1
footprint=none
T 47400 65550 5 10 1 1 0 0 1
value=pulse 0 3.3 5u 1u 1u 1n 10u
}
C 47700 62800 1 0 0 vdc-1.sym
{
T 48400 63450 5 10 1 1 0 0 1
refdes=V1
T 48400 63650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 48400 63850 5 10 0 0 0 0 1
footprint=none
T 48400 63250 5 10 1 1 0 0 1
value=DC 3.3V
}
C 47800 64000 1 0 0 3.3V-plus-1.sym
C 47900 62500 1 0 0 gnd-1.sym
C 47900 64800 1 0 0 gnd-1.sym
N 49200 65100 49400 65100 4
{
T 49200 65200 5 10 1 1 0 0 1
netname=P
}
N 49200 62800 49400 62800 4
{
T 49000 62900 5 10 1 1 0 0 1
netname=P#
}
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
refdes=S6
T 54900 62800 5 10 1 1 0 0 1
source=jkflipflop.sch
}
C 57100 62100 1 0 0 jkflipflop.sym
{
T 58200 62600 5 10 1 1 0 0 1
refdes=S8
T 57400 62800 5 10 1 1 0 0 1
source=jkflipflop.sch
}
C 59500 62100 1 0 0 jkflipflop.sym
{
T 60600 62600 5 10 1 1 0 0 1
refdes=S11
T 59800 62800 5 10 1 1 0 0 1
source=jkflipflop.sch
}
N 54600 63000 54600 63900 4
{
T 54900 63800 5 10 1 1 180 0 1
netname=T1
}
C 53800 64600 1 0 0 nand.sym
{
T 54100 65050 5 10 1 1 0 0 1
refdes=S4
}
C 58700 64600 1 0 0 nand.sym
{
T 59000 65050 5 10 1 1 0 0 1
refdes=S9
}
C 56300 64600 1 0 0 nor.sym
{
T 56600 65050 5 10 1 1 0 0 1
refdes=S7
}
C 54300 64700 1 270 0 not.sym
{
T 54550 64450 5 10 1 1 270 0 1
refdes=S5
}
C 59200 64700 1 270 0 not.sym
{
T 59450 64450 5 10 1 1 270 0 1
refdes=S10
}
N 53800 63200 53800 65000 4
{
T 53800 63800 5 10 1 1 0 0 1
netname=Q0
}
N 54600 64700 54600 65200 4
N 54600 65200 56300 65200 4
N 57100 63000 57100 65200 4
{
T 57400 63800 5 10 1 1 180 0 1
netname=T2
}
N 57100 65200 58700 65200 4
N 54100 64300 54300 64300 4
N 54100 64300 54100 64600 4
N 55100 64300 54900 64300 4
N 59500 65100 59500 64700 4
N 59000 64300 59000 64600 4
N 59000 64300 59200 64300 4
C 59800 64300 1 0 0 3.3V-plus-1.sym
N 60000 64300 59800 64300 4
N 56200 63000 56300 63000 4
N 56300 63000 56300 65000 4
N 58700 63200 58700 65000 4
{
T 58700 63600 5 10 1 1 0 0 1
netname=Q2
}
N 59500 63900 59500 63000 4
{
T 59800 63800 5 10 1 1 180 0 1
netname=T3
}
N 56200 63200 56200 63900 4
{
T 56000 63600 5 10 1 1 0 0 1
netname=Q1
}
N 61100 63200 61100 64100 4
{
T 60800 63800 5 10 1 1 0 0 1
netname=Q3
}
C 51900 65500 1 270 0 vpulse-1.sym
{
T 52550 64800 5 10 1 1 270 0 1
refdes=V4
T 52750 64800 5 10 0 0 270 0 1
device=vpulse
T 52950 64800 5 10 0 0 270 0 1
footprint=none
T 51400 65650 5 10 1 1 0 0 1
value=pulse 3.3 0 30u 1u 1u 9u 40u
}
C 51800 64900 1 0 0 gnd-1.sym
N 52200 64400 53100 64400 4
N 53100 64400 53100 65200 4
