v 20130925 2
C 66300 49800 1 0 0 rslatch.sym
{
T 67450 50250 5 10 1 1 0 0 1
refdes=S3
T 66600 50450 5 10 1 1 0 0 1
source=rslatch.sch
}
C 63900 51300 1 0 0 nand1or.sym
{
T 64450 51750 5 10 1 1 0 0 1
refdes=S1
}
C 63900 49300 1 0 0 nand1or.sym
{
T 64450 49750 5 10 1 1 0 0 1
refdes=S2
}
C 66900 51300 1 0 0 3.3V-plus-1.sym
C 64300 52300 1 0 0 3.3V-plus-1.sym
C 64300 50300 1 0 0 3.3V-plus-1.sym
C 67000 49500 1 0 0 gnd-1.sym
C 64400 49000 1 0 0 gnd-1.sym
C 64400 51000 1 0 0 gnd-1.sym
N 64900 49800 64900 50700 4
N 64200 50700 66300 50700 4
{
T 65300 50500 5 10 1 1 0 0 1
netname=A#
}
N 64900 51800 64900 50900 4
N 63600 50900 66300 50900 4
{
T 65300 51000 5 10 1 1 0 0 1
netname=A
}
N 64200 50700 64200 51600 4
N 63600 50900 63600 49600 4
N 63600 49600 64200 49600 4
N 63900 50100 63900 51900 4
N 63900 50100 63100 50100 4
{
T 63300 50100 5 10 1 1 0 0 1
netname=C
}
N 63100 50100 63100 48800 4
N 63100 48800 66300 48800 4
N 66300 48800 66300 50300 4
N 67900 50900 67900 52900 4
{
T 67900 51800 5 10 1 1 0 0 1
netname=Q
}
N 67900 52900 63900 52900 4
N 63900 52900 63900 52100 4
N 63900 49900 63900 48600 4
N 63900 48600 67900 48600 4
N 67900 48600 67900 50700 4
{
T 68000 49200 5 10 1 1 0 0 1
netname=Q#
}
C 60800 51000 1 0 0 vdc-1.sym
{
T 61500 51650 5 10 1 1 0 0 1
refdes=V1
T 61500 51850 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 61500 52050 5 10 0 0 0 0 1
footprint=none
T 61500 51450 5 10 1 1 0 0 1
value=DC 3.3V
}
C 59500 50400 1 270 0 vpulse-1.sym
{
T 59500 50150 5 10 1 1 0 0 1
refdes=VC
T 60350 49700 5 10 0 0 270 0 1
device=vpulse
T 60550 49700 5 10 0 0 270 0 1
footprint=none
T 59100 49550 5 10 1 1 0 0 1
value=pulse 0 3.3 1u 1n 1n 0.269u 0.54u
}
C 62300 49800 1 0 0 cnot.sym
{
T 62525 50100 5 10 1 1 0 1 1
refdes=I3
}
C 61500 49800 1 0 0 not.sym
{
T 61850 50100 5 10 1 1 0 4 1
refdes=I2
}
C 60700 49800 1 0 0 not.sym
{
T 61050 50100 5 10 1 1 0 4 1
refdes=I1
}
N 61100 49800 62700 49800 4
N 62700 50400 61100 50400 4
C 61800 49500 1 0 0 gnd-1.sym
C 61700 50400 1 0 0 3.3V-plus-1.sym
C 59400 49800 1 0 0 gnd-1.sym
C 61000 50700 1 0 0 gnd-1.sym
C 60900 52200 1 0 0 3.3V-plus-1.sym