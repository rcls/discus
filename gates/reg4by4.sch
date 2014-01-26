v 20130925 2
C 42500 43400 1 0 0 reg4.sym
{
T 43300 44500 5 10 1 1 0 0 1
refdes=U0
T 43000 44750 5 10 1 1 0 0 1
source=reg4.sch
}
C 45100 43400 1 0 0 reg4.sym
{
T 45900 44500 5 10 1 1 0 0 1
refdes=U1
T 45600 44750 5 10 1 1 0 0 1
source=reg4.sch
}
C 47700 43400 1 0 0 reg4.sym
{
T 48500 44500 5 10 1 1 0 0 1
refdes=U2
T 48200 44750 5 10 1 1 0 0 1
source=reg4.sch
}
C 50300 43400 1 0 0 reg4.sym
{
T 51100 44500 5 10 1 1 0 0 1
refdes=U3
T 50800 44750 5 10 1 1 0 0 1
source=reg4.sch
}
C 51700 43500 1 180 0 in-1.sym
{
T 51700 43000 5 10 0 0 180 0 1
footprint=anchor
T 51700 43200 5 10 0 0 180 0 1
device=INPUT
T 51600 43300 5 10 1 1 180 0 1
refdes=GND
}
N 43300 43400 51100 43400 4
N 43300 46000 51100 46000 4
N 42500 45600 42500 46500 4
{
T 41800 45900 5 10 1 1 0 0 1
netname=SA0
}
N 41300 46500 50300 46500 4
N 50300 45600 50300 46500 4
N 47700 45600 47700 46500 4
N 45100 45600 45100 46500 4
N 42500 45400 42400 45400 4
N 42400 45400 42400 46400 4
{
T 41800 45600 5 10 1 1 0 0 1
netname=SA1
}
N 41400 46400 50200 46400 4
N 50200 46400 50200 45400 4
N 50200 45400 50300 45400 4
N 42500 45200 42300 45200 4
N 42300 45200 42300 46300 4
{
T 41800 45300 5 10 1 1 0 0 1
netname=SA2
}
N 41500 46300 50100 46300 4
N 50100 46300 50100 45200 4
N 50100 45200 50300 45200 4
N 42500 45000 42200 45000 4
N 42200 45000 42200 46200 4
{
T 41800 45000 5 10 1 1 0 0 1
netname=SA3
}
N 41600 46200 50000 46200 4
N 50000 46200 50000 45000 4
N 50000 45000 50300 45000 4
N 42200 44600 42500 44600 4
N 42500 44000 42500 42900 4
{
T 41800 43500 5 10 1 1 0 0 1
netname=SB3
}
N 41300 42900 50300 42900 4
N 50300 42900 50300 44000 4
N 50300 44200 50200 44200 4
N 50200 44200 50200 43000 4
N 41400 43000 50200 43000 4
N 42400 43000 42400 44200 4
{
T 41800 43800 5 10 1 1 0 0 1
netname=SB2
}
N 42400 44200 42500 44200 4
N 42500 44400 42300 44400 4
N 42300 43100 42300 44400 4
{
T 41800 44100 5 10 1 1 0 0 1
netname=SB1
}
N 41500 43100 50100 43100 4
N 50100 43100 50100 44400 4
N 50100 44400 50300 44400 4
N 50300 44600 50000 44600 4
N 50000 44600 50000 43200 4
N 41600 43200 50000 43200 4
N 42200 43200 42200 44600 4
{
T 41800 44400 5 10 1 1 0 0 1
netname=SB0
}
N 47700 44000 47700 42900 4
N 45100 44000 45100 42900 4
N 45100 44200 45000 44200 4
N 45000 44200 45000 43000 4
N 45100 44400 44900 44400 4
N 44900 44400 44900 43100 4
N 45100 44600 44800 44600 4
N 44800 44600 44800 43200 4
N 47700 44200 47600 44200 4
N 47600 44200 47600 43000 4
N 47700 44400 47500 44400 4
N 47500 44400 47500 43100 4
N 47700 44600 47400 44600 4
N 47400 44600 47400 43200 4
N 45100 45400 45000 45400 4
N 45000 45400 45000 46400 4
N 45100 45200 44900 45200 4
N 44900 45200 44900 46300 4
N 45100 45000 44800 45000 4
N 44800 45000 44800 46200 4
N 47700 45400 47600 45400 4
N 47600 45400 47600 46400 4
N 47700 45200 47500 45200 4
N 47500 45200 47500 46300 4
N 47700 45000 47400 45000 4
N 47400 45000 47400 46200 4
C 44100 45500 1 0 0 out-1.sym
{
T 44100 46000 5 10 0 0 0 0 1
footprint=anchor
T 44100 45800 5 10 0 0 0 0 1
device=OUTPUT
T 44200 45700 5 10 1 1 0 0 1
refdes=Q0
}
C 44100 45300 1 0 0 out-1.sym
{
T 44100 45800 5 10 0 0 0 0 1
footprint=anchor
T 44100 45600 5 10 0 0 0 0 1
device=OUTPUT
T 44200 45200 5 10 1 1 0 0 1
refdes=Q0#
}
C 46700 45500 1 0 0 out-1.sym
{
T 46700 46000 5 10 0 0 0 0 1
footprint=anchor
T 46700 45800 5 10 0 0 0 0 1
device=OUTPUT
T 46800 45700 5 10 1 1 0 0 1
refdes=Q1
}
C 46700 45300 1 0 0 out-1.sym
{
T 46700 45800 5 10 0 0 0 0 1
footprint=anchor
T 46700 45600 5 10 0 0 0 0 1
device=OUTPUT
T 46800 45200 5 10 1 1 0 0 1
refdes=Q1#
}
C 49300 45500 1 0 0 out-1.sym
{
T 49300 46000 5 10 0 0 0 0 1
footprint=anchor
T 49300 45800 5 10 0 0 0 0 1
device=OUTPUT
T 49400 45700 5 10 1 1 0 0 1
refdes=Q2
}
C 49300 45300 1 0 0 out-1.sym
{
T 49300 45800 5 10 0 0 0 0 1
footprint=anchor
T 49300 45600 5 10 0 0 0 0 1
device=OUTPUT
T 49400 45200 5 10 1 1 0 0 1
refdes=Q2#
}
C 51900 45500 1 0 0 out-1.sym
{
T 51900 46000 5 10 0 0 0 0 1
footprint=anchor
T 51900 45800 5 10 0 0 0 0 1
device=OUTPUT
T 52000 45700 5 10 1 1 0 0 1
refdes=Q3
}
C 51900 45300 1 0 0 out-1.sym
{
T 51900 45800 5 10 0 0 0 0 1
footprint=anchor
T 51900 45600 5 10 0 0 0 0 1
device=OUTPUT
T 52000 45200 5 10 1 1 0 0 1
refdes=Q3#
}
C 44100 44900 1 0 0 out-1.sym
{
T 44100 45400 5 10 0 0 0 0 1
footprint=anchor
T 44100 45200 5 10 0 0 0 0 1
device=OUTPUT
T 44150 44850 5 10 1 1 0 0 1
refdes=QB0
}
C 46700 44900 1 0 0 out-1.sym
{
T 46700 45400 5 10 0 0 0 0 1
footprint=anchor
T 46700 45200 5 10 0 0 0 0 1
device=OUTPUT
T 46750 44850 5 10 1 1 0 0 1
refdes=QB1
}
C 49300 44900 1 0 0 out-1.sym
{
T 49300 45400 5 10 0 0 0 0 1
footprint=anchor
T 49300 45200 5 10 0 0 0 0 1
device=OUTPUT
T 49350 44850 5 10 1 1 0 0 1
refdes=QB2
}
C 51900 44900 1 0 0 out-1.sym
{
T 51900 45400 5 10 0 0 0 0 1
footprint=anchor
T 51900 45200 5 10 0 0 0 0 1
device=OUTPUT
T 51950 44850 5 10 1 1 0 0 1
refdes=QB3
}
N 44100 43800 44200 43800 4
N 44200 43800 44200 42500 4
N 44200 42500 52000 42500 4
N 49400 42500 49400 43800 4
N 49400 43800 49300 43800 4
C 44700 44500 1 0 1 in-1.sym
{
T 44700 45000 5 10 0 0 0 6 1
footprint=anchor
T 44700 44800 5 10 0 0 0 6 1
device=INPUT
T 44650 44450 5 10 1 1 0 6 1
refdes=S0
}
C 47300 44500 1 0 1 in-1.sym
{
T 47300 45000 5 10 0 0 0 6 1
footprint=anchor
T 47300 44800 5 10 0 0 0 6 1
device=INPUT
T 47250 44450 5 10 1 1 0 6 1
refdes=S1
}
C 49900 44500 1 0 1 in-1.sym
{
T 49900 45000 5 10 0 0 0 6 1
footprint=anchor
T 49900 44800 5 10 0 0 0 6 1
device=INPUT
T 49850 44450 5 10 1 1 0 6 1
refdes=S2
}
C 52500 44500 1 0 1 in-1.sym
{
T 52500 45000 5 10 0 0 0 6 1
footprint=anchor
T 52500 44800 5 10 0 0 0 6 1
device=INPUT
T 52450 44450 5 10 1 1 0 6 1
refdes=S3
}
N 44100 44200 44300 44200 4
N 44300 44200 44300 42700 4
N 44300 42700 52100 42700 4
N 49500 42700 49500 44200 4
N 49500 44200 49300 44200 4
N 52000 42500 52000 43800 4
N 52000 43800 51900 43800 4
N 52100 42700 52100 44200 4
N 52100 44200 51900 44200 4
N 46700 43800 46800 43800 4
N 46800 43800 46800 42500 4
N 46700 44200 46900 44200 4
N 46900 44200 46900 42700 4
C 51700 46100 1 180 0 in-1.sym
{
T 51700 45600 5 10 0 0 180 0 1
footprint=anchor
T 51700 45800 5 10 0 0 180 0 1
device=INPUT
T 51550 46150 5 10 1 1 180 0 1
refdes=Vdd
}
C 52700 43200 1 0 1 in-1.sym
{
T 52700 43700 5 10 0 0 0 6 1
footprint=anchor
T 52700 43500 5 10 0 0 0 6 1
device=INPUT
T 52650 43350 5 10 1 1 0 6 1
refdes=WE
}
C 52600 42400 1 0 1 in-1.sym
{
T 52600 42900 5 10 0 0 0 6 1
footprint=anchor
T 52600 42700 5 10 0 0 0 6 1
device=INPUT
T 52500 42550 5 10 1 1 0 6 1
refdes=STR
}
C 50900 46000 1 0 0 vdd-1.sym
C 51000 43100 1 0 0 gnd-1.sym
C 44700 44300 1 0 1 in-1.sym
{
T 44700 44800 5 10 0 0 0 6 1
footprint=anchor
T 44700 44600 5 10 0 0 0 6 1
device=INPUT
T 44650 44250 5 10 1 1 0 6 1
refdes=R0
}
C 47300 44300 1 0 1 in-1.sym
{
T 47300 44800 5 10 0 0 0 6 1
footprint=anchor
T 47300 44600 5 10 0 0 0 6 1
device=INPUT
T 47250 44250 5 10 1 1 0 6 1
refdes=R1
}
C 49900 44300 1 0 1 in-1.sym
{
T 49900 44800 5 10 0 0 0 6 1
footprint=anchor
T 49900 44600 5 10 0 0 0 6 1
device=INPUT
T 49850 44250 5 10 1 1 0 6 1
refdes=R2
}
C 52500 44300 1 0 1 in-1.sym
{
T 52500 44800 5 10 0 0 0 6 1
footprint=anchor
T 52500 44600 5 10 0 0 0 6 1
device=INPUT
T 52450 44250 5 10 1 1 0 6 1
refdes=R3
}
C 39300 45600 1 0 0 decode2.sym
{
T 40300 46400 5 10 1 1 0 4 1
refdef=S?
T 40200 46300 5 10 1 1 0 0 1
refdes=A
T 39800 46000 5 10 1 1 0 0 1
source=decode2.sch
}
C 39300 42600 1 0 0 decode2.sym
{
T 40300 43400 5 10 1 1 0 4 1
refdef=S?
T 40200 43300 5 10 1 1 0 0 1
refdes=B
T 39800 43000 5 10 1 1 0 0 1
source=decode2.sch
}
N 41600 46200 41600 45900 4
N 41600 45900 41300 45900 4
N 41500 46300 41500 46100 4
N 41500 46100 41300 46100 4
N 41400 46400 41400 46300 4
N 41400 46300 41300 46300 4
N 41400 43000 41400 43100 4
N 41400 43100 41300 43100 4
N 41500 43100 41500 43300 4
N 41500 43300 41300 43300 4
N 41600 43200 41600 43500 4
N 41600 43500 41300 43500 4
C 40100 46900 1 0 0 vdd-1.sym
C 40100 43900 1 0 0 vdd-1.sym
C 40200 45300 1 0 0 gnd-1.sym
C 40200 42300 1 0 0 gnd-1.sym
C 38700 46400 1 0 0 in-1.sym
{
T 38700 46900 5 10 0 0 0 0 1
footprint=anchor
T 38700 46700 5 10 0 0 0 0 1
device=INPUT
T 38350 46450 5 10 1 1 0 0 1
refdes=A0
}
C 38700 46200 1 0 0 in-1.sym
{
T 38700 46700 5 10 0 0 0 0 1
footprint=anchor
T 38700 46500 5 10 0 0 0 0 1
device=INPUT
T 38350 46250 5 10 1 1 0 0 1
refdes=A0#
}
C 38700 46000 1 0 0 in-1.sym
{
T 38700 46500 5 10 0 0 0 0 1
footprint=anchor
T 38700 46300 5 10 0 0 0 0 1
device=INPUT
T 38350 46050 5 10 1 1 0 0 1
refdes=A1
}
C 38700 45800 1 0 0 in-1.sym
{
T 38700 46300 5 10 0 0 0 0 1
footprint=anchor
T 38700 46100 5 10 0 0 0 0 1
device=INPUT
T 38350 45850 5 10 1 1 0 0 1
refdes=A1#
}
C 38700 43400 1 0 0 in-1.sym
{
T 38700 43900 5 10 0 0 0 0 1
footprint=anchor
T 38700 43700 5 10 0 0 0 0 1
device=INPUT
T 38350 43450 5 10 1 1 0 0 1
refdes=B0
}
C 38700 43200 1 0 0 in-1.sym
{
T 38700 43700 5 10 0 0 0 0 1
footprint=anchor
T 38700 43500 5 10 0 0 0 0 1
device=INPUT
T 38350 43250 5 10 1 1 0 0 1
refdes=B0#
}
C 38700 43000 1 0 0 in-1.sym
{
T 38700 43500 5 10 0 0 0 0 1
footprint=anchor
T 38700 43300 5 10 0 0 0 0 1
device=INPUT
T 38350 43050 5 10 1 1 0 0 1
refdes=B1
}
C 38700 42800 1 0 0 in-1.sym
{
T 38700 43300 5 10 0 0 0 0 1
footprint=anchor
T 38700 43100 5 10 0 0 0 0 1
device=INPUT
T 38350 42850 5 10 1 1 0 0 1
refdes=B1#
}
