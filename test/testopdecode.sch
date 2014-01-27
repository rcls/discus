v 20130925 2
C 7800 13900 1 270 0 vpulse-1.sym
{
T 7900 13750 5 10 1 1 0 0 1
refdes=V3
T 8650 13200 5 10 0 0 270 0 1
device=vpulse
T 8850 13200 5 10 0 0 270 0 1
footprint=none
T 7700 13550 5 10 1 1 0 7 1
value=pulse 0 3.3 10u 1n 1n 10u 20u
}
C 11100 8800 1 0 0 vdc-1.sym
{
T 11800 9450 5 10 1 1 0 0 1
refdes=V
T 11800 9650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 11800 9850 5 10 0 0 0 0 1
footprint=none
T 11800 9250 5 10 1 1 0 0 1
value=DC 3.3V
}
C 7800 12900 1 270 0 vpulse-1.sym
{
T 7900 12750 5 10 1 1 0 0 1
refdes=V4
T 8650 12200 5 10 0 0 270 0 1
device=vpulse
T 8850 12200 5 10 0 0 270 0 1
footprint=none
T 7700 12550 5 10 1 1 0 7 1
value=pulse 0 3.3 20u 1n 1n 20u 40u
}
C 7800 11900 1 270 0 vpulse-1.sym
{
T 7900 11750 5 10 1 1 0 0 1
refdes=V5
T 8650 11200 5 10 0 0 270 0 1
device=vpulse
T 8850 11200 5 10 0 0 270 0 1
footprint=none
T 7700 11550 5 10 1 1 0 7 1
value=pulse 0 3.3 40u 1n 1n 40u 80u
}
C 7800 10900 1 270 0 vpulse-1.sym
{
T 7900 10750 5 10 1 1 0 0 1
refdes=V6
T 8650 10200 5 10 0 0 270 0 1
device=vpulse
T 8850 10200 5 10 0 0 270 0 1
footprint=none
T 7700 10550 5 10 1 1 0 7 1
value=pulse 0 3.3 80u 1n 1n 80u 160u
}
C 7800 9900 1 270 0 vpulse-1.sym
{
T 7900 9750 5 10 1 1 0 0 1
refdes=V7
T 8650 9200 5 10 0 0 270 0 1
device=vpulse
T 8850 9200 5 10 0 0 270 0 1
footprint=none
T 7700 9550 5 10 1 1 0 7 1
value=pulse 0 3.3 160u 1n 1n 160u 320u
}
C 9300 12800 1 0 0 not.sym
{
T 9650 13100 5 10 1 1 0 4 1
refdes=I3
}
C 9600 12500 1 0 0 gnd-1.sym
C 9500 13400 1 0 0 vdd-1.sym
C 9300 11800 1 0 0 not.sym
{
T 9650 12100 5 10 1 1 0 4 1
refdes=I4
}
C 9600 11500 1 0 0 gnd-1.sym
C 9500 12400 1 0 0 vdd-1.sym
C 9300 10800 1 0 0 not.sym
{
T 9650 11100 5 10 1 1 0 4 1
refdes=I5
}
C 9600 10500 1 0 0 gnd-1.sym
C 9500 11400 1 0 0 vdd-1.sym
C 9300 9800 1 0 0 not.sym
{
T 9650 10100 5 10 1 1 0 4 1
refdes=I6
}
C 9600 9500 1 0 0 gnd-1.sym
C 9500 10400 1 0 0 vdd-1.sym
C 9300 8800 1 0 0 not.sym
{
T 9650 9100 5 10 1 1 0 4 1
refdes=I7
}
C 9600 8500 1 0 0 gnd-1.sym
C 9500 9400 1 0 0 vdd-1.sym
N 9000 13600 10700 13600 4
{
T 9100 13650 5 10 1 1 0 0 1
netname=I3
}
N 9000 12600 10300 12600 4
{
T 9100 12650 5 10 1 1 0 0 1
netname=I4
}
N 9000 11600 10400 11600 4
{
T 9100 11650 5 10 1 1 0 0 1
netname=I5
}
N 9000 10600 10600 10600 4
{
T 9100 10650 5 10 1 1 0 0 1
netname=I6
}
N 9000 9600 10800 9600 4
{
T 9100 9650 5 10 1 1 0 0 1
netname=I7
}
N 9300 13100 9300 13600 4
N 9300 12100 9300 12600 4
N 9300 11600 9300 11100 4
N 9300 10600 9300 10100 4
N 9300 9600 9300 9100 4
N 10500 11100 10500 11800 4
N 10500 11800 11100 11800 4
N 10600 10600 10600 11600 4
N 10600 11600 11100 11600 4
N 10800 9600 10800 11200 4
N 10800 11200 11100 11200 4
N 10300 12100 10300 12200 4
N 10300 12200 11100 12200 4
N 10300 12600 10300 12400 4
N 10300 12400 11100 12400 4
N 10100 13100 10500 13100 4
N 10500 13100 10500 12600 4
N 10500 12600 11100 12600 4
N 10700 13600 10700 12800 4
N 10700 12800 11100 12800 4
N 10100 10100 10700 10100 4
N 10700 10100 10700 11400 4
N 10700 11400 11100 11400 4
N 10100 9100 10900 9100 4
N 10900 9100 10900 11000 4
N 10900 11000 11100 11000 4
C 11100 10100 1 0 0 opdecode.sym
{
T 11900 10800 5 10 1 1 0 4 1
refdes=S
T 11900 10400 5 10 1 1 0 4 1
source=opdecode.sch
}
N 7800 13600 7800 9600 4
C 7700 9300 1 0 0 gnd-1.sym
C 11300 8500 1 0 0 gnd-1.sym
C 11800 9800 1 0 0 gnd-1.sym
C 11700 13100 1 0 0 vdd-1.sym
C 11200 10000 1 0 0 vdd-1.sym
N 12700 12800 13300 12800 4
{
T 12750 12825 5 10 1 1 0 0 1
netname=CR
}
N 12700 12600 13300 12600 4
{
T 12750 12625 5 10 1 1 0 0 1
netname=CS#
}
N 12700 12400 13300 12400 4
{
T 12750 12425 5 10 1 1 0 0 1
netname=CinR
}
N 12700 12200 13300 12200 4
{
T 12750 12225 5 10 1 1 0 0 1
netname=CinS#
}
N 12700 12000 13300 12000 4
{
T 12750 12025 5 10 1 1 0 0 1
netname=AR#
}
N 12700 11800 13300 11800 4
{
T 12750 11825 5 10 1 1 0 0 1
netname=AS
}
N 12700 11600 13300 11600 4
{
T 12750 11625 5 10 1 1 0 0 1
netname=AND
}
N 12700 11400 13300 11400 4
{
T 12750 11425 5 10 1 1 0 0 1
netname=OR
}
N 12700 11200 13300 11200 4
{
T 12750 11225 5 10 1 1 0 0 1
netname=N
}
N 10400 11600 10400 12000 4
N 10400 12000 11100 12000 4
N 10500 11100 10100 11100 4
N 10300 12100 10100 12100 4
