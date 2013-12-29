v 20130925 2
C 49100 58300 1 0 0 alu.sym
{
T 49700 59600 5 10 1 1 0 0 1
refdes=S1
T 49500 59100 5 10 1 1 0 0 1
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
T 42900 61950 5 10 1 1 0 0 1
value=pulse 0 3.3 10u 1n 1n 10u 20u
}
C 43000 60900 1 270 0 vpulse-1.sym
{
T 43900 60650 5 10 1 1 0 0 1
refdes=VB
T 43850 60200 5 10 0 0 270 0 1
device=vpulse
T 44050 60200 5 10 0 0 270 0 1
footprint=none
T 43000 60950 5 10 1 1 0 0 1
value=pulse 0 3.3 20u 1n 1n 20u 40u
}
C 43000 59900 1 270 0 vpulse-1.sym
{
T 43900 59650 5 10 1 1 0 0 1
refdes=VN
T 43850 59200 5 10 0 0 270 0 1
device=vpulse
T 44050 59200 5 10 0 0 270 0 1
footprint=none
T 43000 59950 5 10 1 1 0 0 1
value=pulse 0 3.3 40u 1n 1n 40u 80u
}
C 43000 57900 1 270 0 vpulse-1.sym
{
T 43900 57650 5 10 1 1 0 0 1
refdes=VCR
T 43850 57200 5 10 0 0 270 0 1
device=vpulse
T 44050 57200 5 10 0 0 270 0 1
footprint=none
T 43000 57950 5 10 1 1 0 0 1
value=pulse 0 3.3 160u 1n 1n 160u 320u
}
C 43000 56900 1 270 0 vpulse-1.sym
{
T 43900 56650 5 10 1 1 0 0 1
refdes=VCS
T 43850 56200 5 10 0 0 270 0 1
device=vpulse
T 44050 56200 5 10 0 0 270 0 1
footprint=none
T 43000 56950 5 10 1 1 0 0 1
value=pulse 0 3.3 320u 1n 1n 320u 640u
}
N 43000 54600 43000 61600 4
C 42900 54300 1 0 0 gnd-1.sym
C 45800 61300 1 0 0 not.sym
{
T 46050 61550 5 10 1 1 0 0 1
refdes=IA
}
C 45800 60300 1 0 0 not.sym
{
T 46050 60550 5 10 1 1 0 0 1
refdes=IB
}
C 45800 59300 1 0 0 not.sym
{
T 46050 59550 5 10 1 1 0 0 1
refdes=IN
}
C 45800 57300 1 0 0 not.sym
{
T 46050 57550 5 10 1 1 0 0 1
refdes=ICR
}
C 45800 56300 1 0 0 not.sym
{
T 46050 56550 5 10 1 1 0 0 1
refdes=ICS
}
N 44200 61600 45800 61600 4
{
T 45200 61600 5 10 1 1 0 0 1
netname=A
}
N 45800 60600 44200 60600 4
{
T 45200 60600 5 10 1 1 0 0 1
netname=B
}
N 44200 59600 45800 59600 4
{
T 45200 59600 5 10 1 1 0 0 1
netname=N
}
N 45800 57600 44200 57600 4
{
T 45200 57600 5 10 1 1 0 0 1
netname=CR
}
N 44200 56600 45800 56600 4
{
T 45200 56600 5 10 1 1 0 0 1
netname=CS
}
N 45400 61600 45400 63000 4
N 45400 63000 52100 63000 4
N 46600 61600 46600 62900 4
N 46600 62900 52000 62900 4
N 45500 60600 45500 62700 4
N 45500 62700 51900 62700 4
N 46600 60600 46700 60600 4
N 46700 60600 46700 62600 4
N 46700 62600 51800 62600 4
N 45600 59600 45600 62400 4
N 45600 62400 51700 62400 4
N 46600 59600 46800 59600 4
N 46800 59600 46800 62300 4
N 46800 62300 51600 62300 4
C 43000 55900 1 270 0 vpulse-1.sym
{
T 43900 55650 5 10 1 1 0 0 1
refdes=VAND
T 43850 55200 5 10 0 0 270 0 1
device=vpulse
T 44050 55200 5 10 0 0 270 0 1
footprint=none
T 43000 55950 5 10 1 1 0 0 1
value=pulse 0 3.3 640u 1n 1n 640u 1280u
}
C 43000 54900 1 270 0 vpulse-1.sym
{
T 43900 54650 5 10 1 1 0 0 1
refdes=VOR
T 43850 54200 5 10 0 0 270 0 1
device=vpulse
T 44050 54200 5 10 0 0 270 0 1
footprint=none
T 43000 54950 5 10 1 1 0 0 1
value=pulse 0 3.3 1280u 1n 1n 1280u 2560u
}
N 44200 54600 53500 54600 4
{
T 45300 54550 5 10 1 1 0 0 1
netname=ORL
}
N 44200 55600 44200 54800 4
N 44200 54800 53500 54800 4
{
T 45300 54750 5 10 1 1 0 0 1
netname=ANDL
}
N 44400 56600 44400 55000 4
N 44400 55000 53600 55000 4
N 46600 56600 46600 55100 4
N 46600 55100 53700 55100 4
N 44500 57600 44500 55300 4
N 44500 55300 53600 55300 4
N 46600 57600 46700 57600 4
N 46700 57600 46700 55400 4
N 46700 55400 53500 55400 4
C 43000 58900 1 270 0 vpulse-1.sym
{
T 43900 58650 5 10 1 1 0 0 1
refdes=VC
T 43850 58200 5 10 0 0 270 0 1
device=vpulse
T 44050 58200 5 10 0 0 270 0 1
footprint=none
T 43000 58950 5 10 1 1 0 0 1
value=pulse 0 3.3 80u 1n 1n 80u 160u
}
C 45800 58300 1 0 0 not.sym
{
T 46050 58550 5 10 1 1 0 0 1
refdes=IC
}
N 44200 58600 45800 58600 4
{
T 45200 58600 5 10 1 1 0 0 1
netname=C
}
N 44600 58600 44600 55600 4
N 44600 55600 53500 55600 4
N 46600 58600 46800 58600 4
N 46800 58600 46800 55700 4
N 46800 55700 53400 55700 4
C 46100 56000 1 0 0 gnd-1.sym
C 46100 57000 1 0 0 gnd-1.sym
C 46100 58000 1 0 0 gnd-1.sym
C 46100 59000 1 0 0 gnd-1.sym
C 46100 60000 1 0 0 gnd-1.sym
C 46100 61000 1 0 0 gnd-1.sym
N 46200 56900 47200 56900 4
N 47200 56900 47200 61900 4
N 47200 61900 46200 61900 4
N 46200 60900 47200 60900 4
N 47200 58900 46200 58900 4
N 47200 57900 46200 57900 4
C 47000 61900 1 0 0 3.3V-plus-1.sym
C 49600 60700 1 0 0 3.3V-plus-1.sym
C 49700 58000 1 0 0 gnd-1.sym
N 50600 60000 51100 60000 4
{
T 50700 60100 5 10 1 1 0 0 1
netname=Q
}
N 50200 60700 50200 61100 4
N 46200 59900 47200 59900 4
C 50200 60800 1 0 0 not.sym
{
T 50450 61050 5 10 1 1 0 0 1
refdes=ICo
}
C 50400 61400 1 0 0 3.3V-plus-1.sym
C 50500 60500 1 0 0 gnd-1.sym
N 51000 61100 51300 61100 4
{
T 51000 61100 5 10 1 1 0 0 1
netname=Co
}
N 50200 55600 50200 58300 4
N 49100 58700 49100 54800 4
N 49100 58900 49000 58900 4
N 49000 58900 49000 54600 4
N 49100 60300 49100 63000 4
N 49100 60100 49000 60100 4
N 49000 60100 49000 62900 4
N 49100 59900 48900 59900 4
N 48900 59900 48900 62700 4
N 49100 59700 48800 59700 4
N 48800 59700 48800 62600 4
N 49100 59500 48700 59500 4
N 48700 59500 48700 62400 4
N 49100 59300 48600 59300 4
N 48600 59300 48600 62300 4
N 50600 58900 50600 55400 4
N 50600 59100 50700 59100 4
N 50700 59100 50700 55000 4
C 47500 56500 1 0 0 vdc-1.sym
{
T 48200 57150 5 10 1 1 0 0 1
refdes=V3v3
T 48200 57350 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 48200 57550 5 10 0 0 0 0 1
footprint=none
T 48200 56950 5 10 1 1 0 0 1
value=DC 3.3V
}
C 47700 56200 1 0 0 gnd-1.sym
C 47600 57700 1 0 0 3.3V-plus-1.sym
C 41600 62200 1 0 0 spice-directive-1.sym
{
T 41700 62500 5 10 0 1 0 0 1
device=directive
T 41700 62600 5 10 1 1 0 0 1
refdes=A1
T 41700 62300 5 10 1 1 0 0 1
value=.save a b n c cr cs andl orl q q# co q2 q2# co2
}
N 50600 59800 51100 59800 4
{
T 50700 59600 5 10 1 1 0 0 1
netname=Q#
}
C 52100 58300 1 0 0 alui.sym
{
T 52700 59300 5 10 1 1 0 0 1
source=alui.sch
T 52700 59600 5 10 1 1 0 0 1
refdes=S2
}
C 52700 58000 1 0 0 gnd-1.sym
C 52600 60700 1 0 0 3.3V-plus-1.sym
N 53200 58300 53200 55700 4
N 52100 60300 52100 63000 4
N 52100 60100 52000 60100 4
N 52000 60100 52000 62900 4
N 52100 59900 51900 59900 4
N 51900 59900 51900 62700 4
N 52100 59700 51800 59700 4
N 51800 59700 51800 62600 4
N 52100 59500 51700 59500 4
N 51700 59500 51700 62400 4
N 52100 59300 51600 59300 4
N 51600 59300 51600 62300 4
N 52100 58700 52100 54800 4
N 52100 58900 52000 58900 4
N 52000 58900 52000 54600 4
N 53600 58900 53600 55300 4
N 53600 59100 53700 59100 4
N 53700 59100 53700 55100 4
N 53200 60700 53800 60700 4
{
T 53400 60700 5 10 1 1 0 0 1
netname=Co2
}
N 53600 60000 54100 60000 4
{
T 53700 60100 5 10 1 1 0 0 1
netname=Q2
}
N 53600 59800 54100 59800 4
{
T 53700 59600 5 10 1 1 0 0 1
netname=Q2#
}
