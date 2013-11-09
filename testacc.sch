v 20121123 2
N 44300 46700 44800 46700 4
{
T 44850 46650 5 10 1 1 0 0 1
netname=ClkIn
}
N 48400 45500 48900 45500 4
{
T 48950 45450 5 10 1 1 0 0 1
netname=W
}
N 48400 44000 48900 44000 4
{
T 48950 43950 5 10 1 1 0 0 1
netname=COUNT
}
C 46700 44500 1 0 0 spice-vc-switch-1.sym
{
T 48300 45200 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47600 45700 5 12 1 1 0 0 1
refdes=SW
T 47400 44650 5 8 1 1 0 0 1
model-name=swmod
T 47400 44500 5 10 1 1 0 0 1
model=VT=0.5
}
C 46700 43000 1 0 0 spice-vc-switch-1.sym
{
T 48300 43700 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47600 44200 5 12 1 1 0 0 1
refdes=SCOUNT
T 47400 43150 5 8 1 1 0 0 1
model-name=swmod
}
C 46800 44600 1 0 0 gnd-1.sym
C 46800 43100 1 0 0 gnd-1.sym
C 48300 43100 1 0 0 gnd-1.sym
C 48300 44600 1 0 0 gnd-1.sym
N 48400 42400 48900 42400 4
{
T 48950 42350 5 10 1 1 0 0 1
netname=CI
}
C 43800 43500 1 0 0 dbridge3.sym
{
T 44000 43900 5 10 1 1 0 0 1
net-format=[~a ~a ~a ] [~a ~a ~a] 
T 44500 44700 5 10 1 1 0 0 1
model-name=dbridge3
T 44700 44200 5 10 1 1 0 0 1
refdes=A2
T 44000 43600 5 10 1 1 0 0 1
model=out_low=0 out_high=1
}
C 41100 43800 1 0 0 dsource3.sym
{
T 41850 43900 5 10 1 1 0 0 1
model=input_file="source.txt"
T 41600 44100 5 10 1 1 0 0 1
net-format=[~a ~a ~a] 
T 41100 43900 5 10 1 1 0 0 1
type=d_source
T 41700 44800 5 10 1 1 0 0 1
model-name=dsource3
T 41400 44500 5 10 1 1 0 0 1
refdes=A1
}
N 45800 44200 45800 42400 4
N 45800 44400 46300 44400 4
N 46300 44400 46300 44000 4
N 46300 44000 46900 44000 4
N 45800 44600 46300 44600 4
N 46300 44600 46300 45500 4
N 46300 45500 46900 45500 4
C 43100 47000 1 270 0 vpulse-1.sym
{
T 44000 46750 5 10 1 1 0 0 1
refdes=VClkIn
T 43950 46300 5 10 0 0 270 0 1
device=vpulse
T 44150 46300 5 10 0 0 270 0 1
footprint=none
T 41000 46750 5 10 1 1 0 0 1
value=pulse 0 3.3 4u 1u 1u 1u 10u
}
C 43100 46200 1 270 0 vpulse-1.sym
{
T 44000 45950 5 10 1 1 0 0 1
refdes=VClkIn#
T 43950 45500 5 10 0 0 270 0 1
device=vpulse
T 44150 45500 5 10 0 0 270 0 1
footprint=none
T 40900 45950 5 10 1 1 0 0 1
value=pulse 0 3.3 9u 1u 1u 1u 10u
}
N 44300 45900 44800 45900 4
{
T 44800 45900 5 10 1 1 0 0 1
netname=ClkIn#
}
C 43000 46400 1 0 0 gnd-1.sym
C 43000 45600 1 0 0 gnd-1.sym
C 45700 46800 1 0 0 3.3V-plus-1.sym
C 45600 45600 1 0 0 vdc-1.sym
{
T 46300 46250 5 10 1 1 0 0 1
refdes=V3.3
T 46300 46450 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 46300 46650 5 10 0 0 0 0 1
footprint=none
T 46300 46050 5 10 1 1 0 0 1
value=DC 3.3
}
C 45800 45300 1 0 0 gnd-1.sym
C 46700 41400 1 0 0 spice-vc-switch-1.sym
{
T 48300 42100 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47600 42600 5 12 1 1 0 0 1
refdes=SCI
T 47400 41550 5 8 1 1 0 0 1
model-name=swmod
}
C 46800 41500 1 0 0 gnd-1.sym
C 48300 41500 1 0 0 gnd-1.sym
N 45800 42400 46900 42400 4
C 48800 42400 1 90 0 resistor-1.sym
{
T 48400 42700 5 10 0 0 90 0 1
device=RESISTOR
T 49000 42600 5 10 1 1 90 0 1
refdes=R1
T 48700 42700 5 10 0 1 90 0 1
value=3k3
}
C 48500 43300 1 0 0 3.3V-plus-1.sym
C 40900 41200 1 0 0 spice-directive-1.sym
{
T 41000 41500 5 10 0 1 0 0 1
device=directive
T 41000 41600 5 10 1 1 0 0 1
refdes=A3
T 40900 41300 5 10 1 1 0 0 1
value=.save c c# w count ci we r0 r1 r2 r3 a0 a1 a2 a3 a0# a1# a2# a3# b0 b1 b2 b3 q0 q1 q2 q3
}
