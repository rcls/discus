v 20121123 2
N 45200 48100 45500 48100 4
{
T 45300 47900 5 10 1 1 0 0 1
netname=ClkIn
}
N 48400 48300 48900 48300 4
{
T 48950 48250 5 10 1 1 0 0 1
netname=W
}
N 48400 45500 48900 45500 4
{
T 48950 45450 5 10 1 1 0 0 1
netname=COUNT
}
C 46700 46000 1 0 0 spice-vc-switch-1.sym
{
T 48300 46700 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47500 47150 5 12 1 1 0 0 1
refdes=SW
T 47400 46150 5 8 1 1 0 0 1
model-name=swmod
T 47400 46000 5 10 1 1 0 0 1
model=VT=0.5
}
C 46700 43000 1 0 0 spice-vc-switch-1.sym
{
T 48300 43700 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47250 44150 5 12 1 1 0 0 1
refdes=SCOUNT
T 47400 43150 5 8 1 1 0 0 1
model-name=swmodi
T 46300 43000 5 10 1 1 0 0 1
model=VT=0.5 RON=1meg ROFF=1
}
C 46800 46100 1 0 0 gnd-1.sym
C 46800 43100 1 0 0 gnd-1.sym
C 48300 43100 1 0 0 gnd-1.sym
C 48300 46100 1 0 0 gnd-1.sym
N 48400 42400 48900 42400 4
{
T 48950 42350 5 10 1 1 0 0 1
netname=CI
}
C 41500 48400 1 270 0 vpulse-1.sym
{
T 42400 48150 5 10 1 1 0 0 1
refdes=VClkIn
T 42350 47700 5 10 0 0 270 0 1
device=vpulse
T 42550 47700 5 10 0 0 270 0 1
footprint=none
T 41400 48450 5 10 1 1 0 0 1
value=pulse 0 1 4u 1u 1u 1u 10u
}
C 41500 47200 1 270 0 vpulse-1.sym
{
T 42400 46950 5 10 1 1 0 0 1
refdes=VClkIn#
T 42350 46500 5 10 0 0 270 0 1
device=vpulse
T 42550 46500 5 10 0 0 270 0 1
footprint=none
T 41400 47250 5 10 1 1 0 0 1
value=pulse 0 1 9u 1u 1u 1u 10u
}
N 45200 46900 45500 46900 4
{
T 45300 46700 5 10 1 1 0 0 1
netname=ClkIn#
}
C 41400 47800 1 0 0 gnd-1.sym
C 41400 46600 1 0 0 gnd-1.sym
C 41500 44600 1 0 0 3.3V-plus-1.sym
C 41400 43400 1 0 0 vdc-1.sym
{
T 42100 44050 5 10 1 1 0 0 1
refdes=V3.3
T 42100 44250 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 42100 44450 5 10 0 0 0 0 1
footprint=none
T 42100 43850 5 10 1 1 0 0 1
value=DC 3.3
}
C 41600 43100 1 0 0 gnd-1.sym
C 46700 41400 1 0 0 spice-vc-switch-1.sym
{
T 48300 42100 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47500 42550 5 12 1 1 0 0 1
refdes=SCI
T 47400 41550 5 8 1 1 0 0 1
model-name=swmod
}
C 46800 41500 1 0 0 gnd-1.sym
C 48300 41500 1 0 0 gnd-1.sym
N 46000 42400 46900 42400 4
C 40900 41200 1 0 0 spice-directive-1.sym
{
T 41000 41500 5 10 0 1 0 0 1
device=directive
T 41000 41600 5 10 1 1 0 0 1
refdes=A3
T 40900 41300 5 10 1 1 0 0 1
value=.save c c# w count ci we r0 r1 r2 r3 a0 a1 a2 a3 a0# a1# a2# a3# b0 b1 b2 b3 q0 q1 q2 q3
}
C 44700 42100 1 0 0 gnd-1.sym
C 44800 44300 1 270 0 vdc-1.sym
{
T 45700 43650 5 10 1 1 0 0 1
refdes=Vrandom
T 45650 43600 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45850 43600 5 10 0 0 270 0 1
footprint=none
T 43900 44350 5 10 1 1 0 0 1
value=DC 0 trrandom(1 10u 0 0.5 0.5)
}
C 44700 43700 1 0 0 gnd-1.sym
N 46000 44000 46900 44000 4
C 46700 44500 1 0 0 spice-vc-switch-1.sym
{
T 48300 45200 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47150 45650 5 12 1 1 0 0 1
refdes=SCOUNTE
T 47400 44650 5 8 1 1 0 0 1
model-name=swmod
}
C 46700 47300 1 0 0 spice-vc-switch-1.sym
{
T 48300 48000 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47400 48450 5 12 1 1 0 0 1
refdes=SWE
T 47400 47450 5 8 1 1 0 0 1
model-name=swmod
}
N 48400 47000 48400 47700 4
N 48400 44000 48400 44900 4
C 46800 44600 1 0 0 gnd-1.sym
C 46800 47400 1 0 0 gnd-1.sym
N 46700 44000 46700 47000 4
N 46700 47000 46900 47000 4
N 46000 45500 46900 45500 4
C 44800 45800 1 270 0 vpulse-1.sym
{
T 45650 45100 5 10 0 0 270 0 1
device=vpulse
T 45850 45100 5 10 0 0 270 0 1
footprint=none
T 45700 45550 5 10 1 1 0 0 1
refdes=VEnable
T 44300 44950 5 10 1 1 0 0 1
value=pulse 0 1 0u 1u 1u 1u 10u
}
C 44700 45200 1 0 0 gnd-1.sym
N 46500 45500 46500 48300 4
N 46500 48300 46900 48300 4
C 44800 42700 1 270 0 vdc-1.sym
{
T 45700 42050 5 10 1 1 0 0 1
refdes=VCI
T 45650 42000 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 45850 42000 5 10 0 0 270 0 1
footprint=none
T 43900 42750 5 10 1 1 0 0 1
value=DC 0 trrandom(1 10u 0 0.5 0.5)
}
C 43500 47100 1 0 0 spice-vc-switch-1.sym
{
T 45100 47800 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 44200 48250 5 12 1 1 0 0 1
refdes=SClk
T 44200 47250 5 8 1 1 0 0 1
model-name=swmod
}
N 42700 48100 43700 48100 4
C 43600 47200 1 0 0 gnd-1.sym
C 45100 47200 1 0 0 gnd-1.sym
C 43500 45900 1 0 0 spice-vc-switch-1.sym
{
T 45100 46600 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 44200 47050 5 12 1 1 0 0 1
refdes=SClk#
T 44200 46050 5 8 1 1 0 0 1
model-name=swmod
}
C 43600 46000 1 0 0 gnd-1.sym
C 45100 46000 1 0 0 gnd-1.sym
N 42700 46900 43700 46900 4
