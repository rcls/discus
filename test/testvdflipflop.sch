v 20130925 2
C 52900 64100 1 0 1 3.3V-plus-1.sym
C 48000 62400 1 270 0 vpulse-1.sym
{
T 48900 62150 5 10 1 1 0 0 1
refdes=Vc
T 48850 61700 5 10 0 0 270 0 1
device=vpulse
T 49050 61700 5 10 0 0 270 0 1
footprint=none
T 47200 61550 5 10 1 1 0 0 1
value=pulse 0 3.3 8u 10n 10n 8u 16u
}
C 48900 64000 1 270 0 vpulse-1.sym
{
T 49800 63350 5 10 1 1 0 0 1
refdes=Vd
T 49750 63300 5 10 0 0 270 0 1
device=vpulse
T 49950 63300 5 10 0 0 270 0 1
footprint=none
T 47800 64150 5 10 1 1 0 0 1
value=pulse 0 3.3 2u 10n 10n 12u 24u
}
C 47700 62100 1 0 0 vdc-1.sym
{
T 48400 62750 5 10 1 1 0 0 1
refdes=V
T 48400 62950 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 48400 63150 5 10 0 0 0 0 1
footprint=none
T 48200 62950 5 10 1 1 0 0 1
value=DC 3.3V
}
C 47800 63300 1 0 0 3.3V-plus-1.sym
C 47900 61800 1 0 0 gnd-1.sym
C 48800 63400 1 0 0 gnd-1.sym
N 53500 63700 53800 63700 4
{
T 53850 63650 5 10 1 1 0 0 1
netname=Q
}
N 53500 63500 53800 63500 4
{
T 53850 63450 5 10 1 1 0 0 1
netname=Q#
}
C 51900 62600 1 0 0 vdflipflop.sym
{
T 52950 63000 5 10 1 1 0 0 1
refdes=S
T 52175 63225 5 10 1 1 0 0 1
source=vdflipflop.sch
}
C 50300 63400 1 0 0 not.sym
{
T 50550 63650 5 10 1 1 0 0 1
refdes=I
}
N 50700 63400 51500 63400 4
N 51100 64000 50700 64000 4
C 51300 64000 1 0 1 3.3V-plus-1.sym
C 51000 63100 1 0 0 gnd-1.sym
C 52600 62300 1 0 0 gnd-1.sym
N 50100 63700 50300 63700 4
{
T 50100 63800 5 10 1 1 0 0 1
netname=D
}
C 50000 61800 1 0 0 not.sym
{
T 50250 62050 5 10 1 1 0 0 1
refdes=L
}
C 50800 61500 1 0 0 2n7002.sym
{
T 51000 61750 5 10 1 1 0 0 1
refdes=M1
T 50900 62300 5 10 0 1 0 0 1
value=2N7002P
T 51300 62100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 52300 62100 5 10 0 1 0 0 1
device=NMOS
}
C 50800 62100 1 0 0 BSS84.sym
{
T 51000 62350 5 10 1 1 0 0 1
refdes=M2
T 50900 62900 5 10 0 1 0 0 1
value=BSS84
T 51300 62700 5 10 0 1 0 0 1
footprint=sot23-pmos
T 52300 62700 5 10 0 1 0 0 1
device=PMOS
}
C 51400 62600 1 0 1 3.3V-plus-1.sym
C 51100 61300 1 0 0 gnd-1.sym
N 51200 62000 51200 62200 4
N 51900 63100 51600 63100 4
N 51600 63100 51600 62100 4
{
T 51600 62500 5 10 1 1 0 0 1
netname=C
}
N 51600 62100 51200 62100 4
N 50800 61800 50800 62400 4
C 49900 61500 1 0 0 gnd-1.sym
C 50200 62400 1 0 1 3.3V-plus-1.sym
C 49200 61800 1 0 0 not.sym
{
T 49450 62050 5 10 1 1 0 0 1
refdes=K
}
N 49600 62400 50400 62400 4
N 49600 61800 50400 61800 4
C 49000 64600 1 0 0 spice-directive-1.sym
{
T 49100 64700 5 10 0 1 0 0 1
file=unknown
T 49100 64900 5 10 0 1 0 0 1
device=directive
T 49100 65000 5 10 1 1 0 0 1
refdes=A
T 49100 64700 5 10 1 1 0 0 1
value=.save c d q q#
}
C 51100 63400 1 0 0 2n7002.sym
{
T 51300 63650 5 10 1 1 0 0 1
refdes=M3
T 51200 64200 5 10 0 1 0 0 1
value=2N7002P
T 51600 64000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 52600 64000 5 10 0 1 0 0 1
device=NMOS
}
N 51500 63400 51500 63500 4
N 51500 63900 51900 63900 4
N 51900 63900 51900 63700 4
