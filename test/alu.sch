v 20220529 2
C 46200 59300 1 0 0 alu.sym
{
T 46950 60350 5 10 1 1 0 4 1
source=alu.sch
T 46950 60700 5 10 1 1 0 4 1
refdes=S
}
C 43000 61900 1 270 0 vpulse-1.sym
{
T 43900 61650 5 10 1 1 0 0 1
refdes=VA
T 43850 61200 5 10 0 0 270 0 1
device=vpulse
T 44050 61200 5 10 0 0 270 0 1
footprint=none
T 43000 61650 5 10 1 1 0 7 1
value=pulse 0 2.5 10u 1n 1n 10u 20u
}
C 43000 61100 1 270 0 vpulse-1.sym
{
T 43900 60850 5 10 1 1 0 0 1
refdes=VB
T 43850 60400 5 10 0 0 270 0 1
device=vpulse
T 44050 60400 5 10 0 0 270 0 1
footprint=none
T 43000 60850 5 10 1 1 0 7 1
value=pulse 0 2.5 20u 1n 1n 20u 40u
}
C 43000 59500 1 270 0 vpulse-1.sym
{
T 43900 59250 5 10 1 1 0 0 1
refdes=VCR
T 43850 58800 5 10 0 0 270 0 1
device=vpulse
T 44050 58800 5 10 0 0 270 0 1
footprint=none
T 43000 59250 5 10 1 1 0 7 1
value=pulse 0 2.5 80u 1n 1n 80u 160u
}
C 43000 58700 1 270 0 vpulse-1.sym
{
T 43900 58450 5 10 1 1 0 0 1
refdes=VCS
T 43850 58000 5 10 0 0 270 0 1
device=vpulse
T 44050 58000 5 10 0 0 270 0 1
footprint=none
T 43000 58450 5 10 1 1 0 7 1
value=pulse 0 2.5 160u 1n 1n 160u 320u
}
N 43000 56700 43000 61600 4
C 42900 56400 1 0 0 gnd-1.sym
N 44200 61600 44500 61600 4
{
T 44550 61600 5 10 1 1 0 1 1
netname=A
}
N 44500 60800 44200 60800 4
{
T 44550 60800 5 10 1 1 0 1 1
netname=B
}
N 44500 59200 44200 59200 4
{
T 44550 59200 5 10 1 1 0 1 1
netname=CR
}
N 44200 58400 44500 58400 4
{
T 44550 58400 5 10 1 1 0 1 1
netname=CS#
}
C 43000 57900 1 270 0 vpulse-1.sym
{
T 43900 57650 5 10 1 1 0 0 1
refdes=VAND
T 43850 57200 5 10 0 0 270 0 1
device=vpulse
T 44050 57200 5 10 0 0 270 0 1
footprint=none
T 43000 57650 5 10 1 1 0 7 1
value=pulse 0 2.5 320u 1n 1n 320u 640u
}
C 43000 57100 1 270 0 vpulse-1.sym
{
T 43900 56850 5 10 1 1 0 0 1
refdes=VOR
T 43850 56400 5 10 0 0 270 0 1
device=vpulse
T 44050 56400 5 10 0 0 270 0 1
footprint=none
T 43000 56850 5 10 1 1 0 7 1
value=pulse 0 2.5 640u 1n 1n 640u 1280u
}
C 43000 60300 1 270 0 vpulse-1.sym
{
T 43900 60050 5 10 1 1 0 0 1
refdes=VC
T 43850 59600 5 10 0 0 270 0 1
device=vpulse
T 44050 59600 5 10 0 0 270 0 1
footprint=none
T 43000 60050 5 10 1 1 0 7 1
value=pulse 0 2.5 40u 1n 1n 40u 80u
}
N 44200 60000 44500 60000 4
{
T 44550 60000 5 10 1 1 0 1 1
netname=Ci#
}
C 46800 59000 1 0 0 gnd-1.sym
N 47700 60800 47900 60800 4
{
T 47950 60800 5 10 1 1 0 1 1
netname=Q
}
N 47300 61700 47900 61700 4
{
T 47950 61700 5 10 1 1 0 1 1
netname=Co#
}
N 47700 60100 47900 60100 4
{
T 47950 60100 5 10 1 1 0 1 1
netname=CS#
}
C 46700 56300 1 0 0 vdc-1.sym
{
T 47400 56950 5 10 1 1 0 0 1
refdes=V2v5
T 47400 57150 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 47400 57350 5 10 0 0 0 0 1
footprint=none
T 47400 56750 5 10 1 1 0 0 1
value=DC 2.5V
}
C 46900 56000 1 0 0 gnd-1.sym
N 44200 57600 44500 57600 4
{
T 44550 57600 5 10 1 1 0 1 1
netname=AND
}
C 46800 57500 1 0 0 vdd-1.sym
N 44200 56800 44500 56800 4
{
T 44550 56800 5 10 1 1 0 1 1
netname=OR
}
N 47900 59900 47700 59900 4
{
T 47950 59900 5 10 1 1 0 1 1
netname=CR
}
C 46700 61700 1 0 0 vdd-1.sym
N 46000 60000 46200 60000 4
{
T 45950 60000 5 10 1 1 0 7 1
netname=AND
}
N 46200 59800 46000 59800 4
{
T 45950 59800 5 10 1 1 0 7 1
netname=OR
}
N 46000 61100 46200 61100 4
{
T 45950 61100 5 10 1 1 0 7 1
netname=A
}
N 46200 60700 46000 60700 4
{
T 45950 60700 5 10 1 1 0 7 1
netname=B
}
N 47300 59300 47900 59300 4
{
T 47950 59300 5 10 1 1 0 1 1
netname=Ci#
}
C 47500 61000 1 0 0 vdd-1.sym
C 46100 58000 1 0 0 spice-directive-1.sym
{
T 46200 58300 5 10 0 1 0 0 1
device=directive
T 46200 58400 5 10 1 1 0 0 1
refdes=A1
T 46200 58100 5 10 1 1 0 0 1
value=tran 1u 2000u uic
}
