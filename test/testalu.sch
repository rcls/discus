v 20130925 2
C 49100 58300 1 0 0 alu.sym
{
T 49700 59600 5 10 1 1 0 0 1
refdes=S1
T 49600 59300 5 10 1 1 0 0 1
source=alu.sch
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
value=pulse 0 3.3 10u 1n 1n 10u 20u
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
value=pulse 0 3.3 20u 1n 1n 20u 40u
}
C 43000 60300 1 270 0 vpulse-1.sym
{
T 43900 60050 5 10 1 1 0 0 1
refdes=VN
T 43850 59600 5 10 0 0 270 0 1
device=vpulse
T 44050 59600 5 10 0 0 270 0 1
footprint=none
T 43000 60050 5 10 1 1 0 7 1
value=pulse 0 3.3 40u 1n 1n 40u 80u
}
C 43000 58700 1 270 0 vpulse-1.sym
{
T 43900 58450 5 10 1 1 0 0 1
refdes=VCR
T 43850 58000 5 10 0 0 270 0 1
device=vpulse
T 44050 58000 5 10 0 0 270 0 1
footprint=none
T 43000 58450 5 10 1 1 0 7 1
value=pulse 0 3.3 160u 1n 1n 160u 320u
}
C 43000 57900 1 270 0 vpulse-1.sym
{
T 43900 57650 5 10 1 1 0 0 1
refdes=VCS
T 43850 57200 5 10 0 0 270 0 1
device=vpulse
T 44050 57200 5 10 0 0 270 0 1
footprint=none
T 43000 57650 5 10 1 1 0 7 1
value=pulse 0 3.3 320u 1n 1n 320u 640u
}
N 43000 55900 43000 61600 4
C 42900 55600 1 0 0 gnd-1.sym
C 45800 61300 1 0 0 not.sym
{
T 46050 61550 5 10 1 1 0 0 1
refdes=IA
}
C 45800 60500 1 0 0 not.sym
{
T 46050 60750 5 10 1 1 0 0 1
refdes=IB
}
C 45800 59700 1 0 0 not.sym
{
T 46050 59950 5 10 1 1 0 0 1
refdes=IN
}
C 45800 58100 1 0 0 not.sym
{
T 46050 58350 5 10 1 1 0 0 1
refdes=ICR
}
C 45800 57300 1 0 0 not.sym
{
T 46050 57550 5 10 1 1 0 0 1
refdes=ICS
}
N 44200 61600 45800 61600 4
{
T 45200 61600 5 10 1 1 0 0 1
netname=A
}
N 45800 60800 44200 60800 4
{
T 45200 60800 5 10 1 1 0 0 1
netname=B
}
N 44200 60000 45800 60000 4
{
T 45200 60000 5 10 1 1 0 0 1
netname=N
}
N 45800 58400 44200 58400 4
{
T 45200 58400 5 10 1 1 0 0 1
netname=CR
}
N 44200 57600 45800 57600 4
{
T 45200 57600 5 10 1 1 0 0 1
netname=CS
}
N 45400 61600 45400 63000 4
N 45400 63000 53000 63000 4
N 46600 61600 46600 62900 4
N 46600 62900 53000 62900 4
N 45500 60800 45500 62700 4
N 45500 62700 53000 62700 4
N 46600 60800 46700 60800 4
N 46700 60800 46700 62600 4
N 46700 62600 53000 62600 4
N 45600 60000 45600 62400 4
N 45600 62400 53000 62400 4
N 46600 60000 46800 60000 4
N 46800 60000 46800 62300 4
N 46800 62300 53000 62300 4
C 43000 57100 1 270 0 vpulse-1.sym
{
T 43900 56850 5 10 1 1 0 0 1
refdes=VAND
T 43850 56400 5 10 0 0 270 0 1
device=vpulse
T 44050 56400 5 10 0 0 270 0 1
footprint=none
T 43000 56850 5 10 1 1 0 7 1
value=pulse 0 3.3 640u 1n 1n 640u 1280u
}
C 43000 56300 1 270 0 vpulse-1.sym
{
T 43900 56050 5 10 1 1 0 0 1
refdes=VOR
T 43850 55600 5 10 0 0 270 0 1
device=vpulse
T 44050 55600 5 10 0 0 270 0 1
footprint=none
T 39900 55950 5 10 1 1 0 0 1
value=pulse 0 3.3 1280u 1n 1n 1280u 2560u
}
N 44800 57600 44800 54800 4
N 44800 54800 53100 54800 4
N 46900 57600 46900 54700 4
N 46900 54700 53100 54700 4
N 44900 58400 44900 55100 4
N 44900 55100 53100 55100 4
N 46600 58400 47000 58400 4
N 47000 58400 47000 55000 4
N 47000 55000 53100 55000 4
C 43000 59500 1 270 0 vpulse-1.sym
{
T 43900 59250 5 10 1 1 0 0 1
refdes=VC
T 43850 58800 5 10 0 0 270 0 1
device=vpulse
T 44050 58800 5 10 0 0 270 0 1
footprint=none
T 43000 59250 5 10 1 1 0 7 1
value=pulse 0 3.3 80u 1n 1n 80u 160u
}
C 45800 58900 1 0 0 not.sym
{
T 46050 59150 5 10 1 1 0 0 1
refdes=IC
}
N 44200 59200 45800 59200 4
{
T 45200 59200 5 10 1 1 0 0 1
netname=C
}
N 45000 59200 45000 55400 4
N 45000 55400 53100 55400 4
N 46600 59200 47100 59200 4
N 47100 59200 47100 55300 4
N 47100 55300 53100 55300 4
C 46100 57000 1 0 0 gnd-1.sym
C 46100 57800 1 0 0 gnd-1.sym
C 46100 58600 1 0 0 gnd-1.sym
C 46100 59400 1 0 0 gnd-1.sym
C 46100 60200 1 0 0 gnd-1.sym
C 46100 61000 1 0 0 gnd-1.sym
N 46200 57100 47200 57100 4
N 47200 56300 47200 61900 4
N 47200 61900 46200 61900 4
N 46200 61100 47200 61100 4
N 47200 59500 46200 59500 4
N 47200 58700 46200 58700 4
C 49700 58000 1 0 0 gnd-1.sym
N 50600 59800 52100 59800 4
{
T 51700 59900 5 10 1 1 0 0 1
netname=Q
}
N 46200 60300 47200 60300 4
N 52100 60700 51500 60700 4
{
T 51700 60700 5 10 1 1 0 0 1
netname=Co
}
N 50200 55300 50200 58300 4
N 48800 59000 48800 54500 4
N 49000 58800 49000 54100 4
N 49100 60100 49000 60100 4
N 49000 60100 49000 63000 4
N 49100 59700 48800 59700 4
N 48800 59700 48800 62700 4
N 49100 59500 48600 59500 4
N 48600 59500 48600 62400 4
N 50700 58900 50700 55000 4
N 50600 59100 50900 59100 4
N 50900 59100 50900 54800 4
C 51300 56700 1 0 0 vdc-1.sym
{
T 52000 57350 5 10 1 1 0 0 1
refdes=V3v3
T 52000 57550 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 52000 57750 5 10 0 0 0 0 1
footprint=none
T 52000 57150 5 10 1 1 0 0 1
value=DC 3.3V
}
C 51500 56400 1 0 0 gnd-1.sym
C 42000 62200 1 0 0 spice-directive-1.sym
{
T 42100 62500 5 10 0 1 0 0 1
device=directive
T 42100 62600 5 10 1 1 0 0 1
refdes=A1
T 42100 62300 5 10 1 1 0 0 1
value=.save a b n c cr cs andl orl q q# co
}
N 46600 57600 46900 57600 4
C 45800 56500 1 0 0 not.sym
{
T 46050 56750 5 10 1 1 0 0 1
refdes=IAND
}
N 44200 56800 45800 56800 4
{
T 45200 56800 5 10 1 1 0 0 1
netname=ANDL
}
C 46100 56200 1 0 0 gnd-1.sym
N 46200 57900 47200 57900 4
N 48800 59000 49100 59000 4
C 50700 60400 1 0 0 not.sym
{
T 50950 60650 5 10 1 1 0 0 1
refdes=ICo
}
C 51000 60100 1 0 0 gnd-1.sym
N 44700 56800 44700 54500 4
N 44700 54500 53100 54500 4
C 51400 57900 1 0 0 vdd-1.sym
C 46000 61900 1 0 0 vdd-1.sym
N 46800 56800 46800 54400 4
N 46800 54400 53100 54400 4
N 46800 56800 46600 56800 4
N 44200 56000 45800 56000 4
{
T 45200 56000 5 10 1 1 0 0 1
netname=ORL
}
C 45800 55700 1 0 0 not.sym
{
T 46150 56000 5 10 1 1 0 4 1
refdes=IOR
}
N 47200 56300 46200 56300 4
C 46100 55400 1 0 0 gnd-1.sym
N 44600 56000 44600 54200 4
N 44600 54200 53100 54200 4
N 46700 56000 46700 54100 4
N 46700 54100 53100 54100 4
N 46700 56000 46600 56000 4
N 50200 60700 50700 60700 4
N 49000 58800 49100 58800 4
N 50700 58900 50600 58900 4
C 49600 60700 1 0 0 vdd-1.sym
C 50900 61000 1 0 0 vdd-1.sym
