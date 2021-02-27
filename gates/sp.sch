v 20201216 2
C 46600 21000 1 0 0 dflipflop.sym
{
T 47950 21400 5 10 1 1 0 7 1
refdes=F0
T 47400 21650 5 10 1 1 0 4 1
source=dflipflop.sch
}
C 49700 21000 1 0 0 dflipflop.sym
{
T 51050 21400 5 10 1 1 0 7 1
refdes=F1
T 50500 21650 5 10 1 1 0 4 1
source=dflipflop.sch
}
C 46000 22900 1 0 0 in-1.sym
{
T 46000 23400 5 10 0 0 0 0 1
footprint=anchor
T 46000 22950 5 10 1 1 0 6 1
refdes=Pop
T 46000 23200 5 10 0 0 0 0 1
device=INPUT
}
N 47700 23600 47900 23600 4
{
T 47800 23650 5 10 1 1 0 3 1
netname=Q0
}
C 46000 24400 1 0 0 in-1.sym
{
T 46000 24900 5 10 0 0 0 0 1
footprint=anchor
T 46000 24450 5 10 1 1 0 6 1
refdes=Push#
T 46000 24700 5 10 0 0 0 0 1
device=INPUT
}
N 50800 23600 51000 23600 4
{
T 50900 23650 5 10 1 1 0 3 1
netname=Q1
}
C 47300 22900 1 0 0 gnd-1.sym
C 47300 24400 1 0 0 gnd-1.sym
C 50400 24400 1 0 0 gnd-1.sym
C 47500 20700 1 0 1 gnd-1.sym
C 50600 20700 1 0 1 gnd-1.sym
C 50700 22500 1 0 1 vdd-1.sym
C 47600 22500 1 0 1 vdd-1.sym
C 47200 24000 1 0 0 vdd-1.sym
C 50300 24000 1 0 0 vdd-1.sym
C 47200 25500 1 0 0 vdd-1.sym
C 50300 25500 1 0 0 vdd-1.sym
C 46000 21400 1 0 0 in-1.sym
{
T 46000 21900 5 10 0 0 0 0 1
footprint=anchor
T 46000 21700 5 10 0 0 0 0 1
device=INPUT
T 46000 21500 5 10 1 1 0 7 1
refdes=ϕ0
}
C 54300 22900 1 0 0 out-1.sym
{
T 54300 23200 5 10 0 0 0 0 1
device=OUTPUT
T 54450 23050 5 10 1 1 0 0 1
refdes=S0
T 54300 23400 5 10 0 0 0 0 1
footprint=anchor
}
C 54300 22700 1 0 0 out-1.sym
{
T 54300 23000 5 10 0 0 0 0 1
device=OUTPUT
T 54450 22850 5 10 1 1 0 0 1
refdes=S1
T 54300 23200 5 10 0 0 0 0 1
footprint=anchor
}
C 54300 22300 1 0 0 out-1.sym
{
T 54300 22600 5 10 0 0 0 0 1
device=OUTPUT
T 54450 22450 5 10 1 1 0 0 1
refdes=S2
T 54300 22800 5 10 0 0 0 0 1
footprint=anchor
}
C 54300 22500 1 0 0 out-1.sym
{
T 54300 22800 5 10 0 0 0 0 1
device=OUTPUT
T 54450 22650 5 10 1 1 0 0 1
refdes=S3
T 54300 23000 5 10 0 0 0 0 1
footprint=anchor
}
N 48200 21900 48400 21900 4
{
T 48450 21900 5 10 1 1 0 1 1
netname=P0#
}
N 48200 22100 48400 22100 4
{
T 48450 22100 5 10 1 1 0 1 1
netname=P0
}
N 51300 21900 51500 21900 4
{
T 51550 21900 5 10 1 1 0 1 1
netname=P1#
}
N 51300 22100 51500 22100 4
{
T 51550 22100 5 10 1 1 0 1 1
netname=P1
}
C 50100 23200 1 0 0 seli.sym
{
T 50325 23600 5 10 1 1 0 1 1
refdes=L1
}
N 46600 23000 50300 23000 4
N 50300 23000 50300 23200 4
N 47200 23200 47200 23000 4
N 46600 24500 50300 24500 4
N 50300 24500 50300 24700 4
N 47200 24700 47200 24500 4
C 50400 22900 1 0 0 gnd-1.sym
N 47700 25100 47900 25100 4
{
T 47950 25100 5 10 1 1 0 1 1
netname=R0
}
N 50800 25100 51000 25100 4
{
T 51050 25100 5 10 1 1 0 1 1
netname=R1
}
N 47000 23700 46800 23700 4
{
T 46750 23700 5 10 1 1 0 7 1
netname=P0#
}
N 50100 23500 49900 23500 4
{
T 49850 23500 5 10 1 1 0 7 1
netname=P0
}
N 50100 23700 49900 23700 4
{
T 49850 23700 5 10 1 1 0 7 1
netname=P1#
}
N 47000 23500 46800 23500 4
{
T 46750 23500 5 10 1 1 0 7 1
netname=P1#
}
N 47000 25000 46800 25000 4
{
T 46750 25000 5 10 1 1 0 7 1
netname=Q0#
}
N 50100 25200 49900 25200 4
{
T 49850 25200 5 10 1 1 0 7 1
netname=Q0#
}
N 50100 25000 49900 25000 4
{
T 49850 25000 5 10 1 1 0 7 1
netname=Q1#
}
N 47000 25200 46800 25200 4
{
T 46750 25200 5 10 1 1 0 7 1
netname=Q1
}
C 50100 24700 1 0 0 seli.sym
{
T 50325 25100 5 10 1 1 0 1 1
refdes=U1
}
C 47000 24700 1 0 0 seli.sym
{
T 47225 25100 5 10 1 1 0 1 1
refdes=U0
}
C 47000 23200 1 0 0 seli.sym
{
T 47225 23600 5 10 1 1 0 1 1
refdes=L0
}
N 46600 22100 46400 22100 4
{
T 46350 22100 5 10 1 1 0 7 1
netname=R0
}
N 49700 22100 49500 22100 4
{
T 49450 22100 5 10 1 1 0 7 1
netname=R1
}
C 48100 23900 1 0 0 vdd-1.sym
C 48200 23000 1 0 0 gnd-1.sym
C 51200 23900 1 0 0 vdd-1.sym
C 51300 23000 1 0 0 gnd-1.sym
C 47900 23300 1 0 0 not.sym
{
T 48250 23600 5 10 1 1 0 4 1
refdes=N0
}
C 51000 23300 1 0 0 not.sym
{
T 51350 23600 5 10 1 1 0 4 1
refdes=N1
}
N 48900 23600 48700 23600 4
{
T 48800 23650 5 10 1 1 0 3 1
netname=Q0#
}
N 52000 23600 51800 23600 4
{
T 51900 23650 5 10 1 1 0 3 1
netname=Q1#
}
C 46500 21800 1 270 0 phi0.sym
C 49400 21400 1 0 0 phi0.sym
C 46000 22400 1 0 0 in-1.sym
{
T 46000 22900 5 10 0 0 0 0 1
footprint=anchor
T 46000 22700 5 10 0 0 0 0 1
device=INPUT
T 46000 22500 5 10 1 1 0 7 1
refdes=Vdd
}
N 46600 22500 47400 22500 4
C 46000 20900 1 0 0 in-1.sym
{
T 46000 21400 5 10 0 0 0 0 1
footprint=anchor
T 46000 21200 5 10 0 0 0 0 1
device=INPUT
T 46000 21000 5 10 1 1 0 7 1
refdes=GND
}
N 46600 21000 47400 21000 4
C 52900 21900 1 0 0 fourpd.sym
{
T 53600 22200 5 8 1 1 0 4 1
source=fourpd.sch
T 53600 22900 5 10 1 1 0 4 1
refdes=D
}
C 53000 24300 1 0 0 vdd-1.sym
C 53500 21600 1 0 0 gnd-1.sym
N 52700 23000 52900 23000 4
{
T 52650 23000 5 10 1 1 0 7 1
netname=Q0
}
N 52700 22600 52900 22600 4
{
T 52650 22600 5 10 1 1 0 7 1
netname=Q1
}
N 52700 22800 52900 22800 4
{
T 52650 22800 5 10 1 1 0 7 1
netname=Q0#
}
N 52700 22400 52900 22400 4
{
T 52650 22400 5 10 1 1 0 7 1
netname=Q1#
}
C 52500 23900 1 0 0 phi0.sym
N 53600 24000 53600 23400 4
C 52800 23700 1 0 0 cnot.sym
{
T 53125 24000 5 10 1 1 0 4 1
refdes=I
}
C 53100 23400 1 0 0 gnd-1.sym
N 53600 23400 53800 23400 4
