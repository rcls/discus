v 20121203 2
C 58600 71000 1 0 0 ese31.sym
{
T 59100 71800 5 10 1 1 0 0 1
refdes=SW5
T 59550 72250 5 10 1 1 0 0 1
footprint=ESE31L
}
C 54600 70400 1 0 0 tps62160.sym
{
T 55500 71200 5 10 1 1 0 0 1
refdes=U1
T 55200 70800 5 10 1 1 0 0 1
value=tps62160
T 55500 70700 5 10 0 1 0 0 1
footprint=msop8
}
C 54400 70700 1 90 0 capacitor.sym
{
T 53700 70900 5 10 0 0 90 0 1
device=CAPACITOR
T 54150 70850 5 10 1 1 180 0 1
refdes=C1
T 53500 70900 5 10 0 0 90 0 1
symversion=0.1
T 53800 71100 5 10 1 1 0 0 1
value=10u
T 54400 70700 5 10 0 1 0 0 1
footprint=1206
}
C 58100 70700 1 90 0 capacitor.sym
{
T 57400 70900 5 10 0 0 90 0 1
device=CAPACITOR
T 58100 70600 5 10 1 1 90 0 1
refdes=C2
T 57200 70900 5 10 0 0 90 0 1
symversion=0.1
T 58000 71100 5 10 1 1 0 0 1
value=22u
T 58100 70700 5 10 0 1 0 0 1
footprint=0805
}
C 57300 71900 1 0 0 3.3V-plus-1.sym
C 56600 71100 1 0 0 inductor-1.sym
{
T 56800 71600 5 10 0 0 0 0 1
device=INDUCTOR
T 56750 71000 5 10 1 1 0 0 1
refdes=L1
T 56800 71800 5 10 0 0 0 0 1
symversion=0.1
T 57000 71000 5 10 1 1 0 0 1
value=2u2
T 57000 71200 5 10 0 1 0 0 1
footprint=inductor-3mm
}
C 57600 69400 1 90 0 resistor-1.sym
{
T 57200 69700 5 10 0 0 90 0 1
device=RESISTOR
T 57300 69600 5 10 1 1 90 0 1
refdes=RB
T 57500 69700 5 10 0 1 0 0 1
footprint=0603
}
C 57600 70300 1 90 0 resistor-1.sym
{
T 57200 70600 5 10 0 0 90 0 1
device=RESISTOR
T 57300 70500 5 10 1 1 90 0 1
refdes=RT
T 57500 70700 5 10 0 1 0 0 1
footprint=0603
}
N 56600 70900 57200 70900 4
N 57200 70900 57500 71200 4
N 56600 70300 57500 70300 4
N 57500 71200 57900 71200 4
N 57900 70700 57900 69400 4
N 57900 69400 57500 69400 4
N 56600 70600 56600 70300 4
N 54600 71200 54600 70900 4
N 53300 70600 54600 70600 4
N 54500 70600 54500 71500 4
N 54500 71500 54600 71500 4
N 54600 71200 54200 71200 4
N 54200 70600 54200 70700 4
C 54100 70300 1 0 0 gnd-1.sym
C 57600 69100 1 0 0 gnd-1.sym
C 53500 74100 1 0 0 gnd-1.sym
C 54900 74100 1 0 0 gnd-1.sym
N 58600 72000 58600 71000 4
N 58600 71000 59000 71000 4
C 58900 70700 1 0 0 gnd-1.sym
C 60300 71700 1 0 0 gnd-1.sym
N 56000 74000 56000 73700 4
{
T 55550 73700 5 10 1 1 0 0 1
netname=ClkIn
}
N 57400 74000 57400 73700 4
{
T 57450 73700 5 10 1 1 0 0 1
netname=ClkIn#
}
N 53600 74000 53600 73700 4
{
T 53050 73700 5 10 1 1 0 0 1
netname=Count
}
N 55000 74000 55000 73700 4
{
T 55050 73700 5 10 1 1 0 0 1
netname=W
}
N 60000 71000 60000 70700 4
{
T 60000 70700 5 10 1 1 0 0 1
netname=CI
}
C 55900 74100 1 0 0 gnd-1.sym
C 57300 74100 1 0 0 gnd-1.sym
C 57500 71300 1 0 0 header4.sym
{
T 58500 71950 5 10 0 0 0 0 1
device=HEADER3
T 57700 73000 5 10 1 1 0 0 1
refdes=J1
T 58000 72300 5 10 0 1 0 0 1
footprint=sip4
}
C 57400 72400 1 0 0 gnd-1.sym
N 54200 71200 54200 72300 4
N 54200 72300 57500 72300 4
C 52500 70400 1 0 0 conn5.sym
{
T 54300 71300 5 10 0 0 0 0 1
device=CONNECTOR_4
T 52500 72100 5 10 1 1 0 0 1
refdes=CONN1
T 52500 70200 5 10 1 1 0 0 1
footprint=miniusbb
}
C 53300 71700 1 0 0 fuse-2.sym
{
T 53500 72250 5 10 0 0 0 0 1
device=FERRITE
T 53500 72000 5 10 1 1 0 0 1
refdes=FB1
T 53500 72450 5 10 0 0 0 0 1
symversion=0.1
T 53700 71800 5 10 0 1 0 0 1
footprint=1206
}
N 57500 71200 57500 71500 4
C 53600 73600 1 0 0 ese23.sym
{
T 53900 74100 5 10 1 1 0 0 1
refdes=SW1
T 54000 73600 5 10 1 1 0 0 1
footprint=ESE23
}
C 56000 73600 1 0 0 ese23.sym
{
T 56300 74100 5 10 1 1 0 0 1
refdes=SW2
T 56400 73600 5 10 1 1 0 0 1
footprint=ESE23
}
