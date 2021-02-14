v 20201216 2
C 53900 47200 1 0 0 alu.sym
{
T 54650 48250 5 10 1 1 0 4 1
source=alu.sch
T 54650 48600 5 10 1 1 0 4 1
refdes=E
}
C 48600 42400 1 0 0 sramcell2.sym
{
T 49400 43250 5 8 1 1 0 4 1
source=sramcell2.sch
T 49750 43450 5 10 1 1 0 0 1
refdes=U
}
C 48600 44400 1 0 0 sramcell2.sym
{
T 49400 45250 5 8 1 1 0 4 1
source=sramcell2.sch
T 49750 45450 5 10 1 1 0 0 1
refdes=Y
}
C 48600 46400 1 0 0 sramcell2.sym
{
T 49400 47250 5 8 1 1 0 4 1
source=sramcell2.sch
T 49750 47450 5 10 1 1 0 0 1
refdes=X
}
C 48600 48400 1 0 0 sramcell2.sym
{
T 49400 49250 5 8 1 1 0 4 1
source=sramcell2s.sch
T 49750 49450 5 10 1 1 0 0 1
refdes=A
}
N 53000 43500 53000 44200 4
N 52600 49000 53900 49000 4
{
T 53000 49100 5 10 1 1 0 0 1
netname=EA
}
N 47500 49700 47500 40100 4
N 50300 49700 50300 41700 4
N 47500 49700 48600 49700 4
N 48600 47700 47500 47700 4
N 48600 45700 47500 45700 4
N 48600 43700 47500 43700 4
N 50200 43700 50300 43700 4
N 50200 45700 50300 45700 4
N 50200 47700 50300 47700 4
N 50200 49700 50300 49700 4
C 49300 42100 1 0 0 gnd-1.sym
C 49300 44100 1 0 0 gnd-1.sym
C 49300 46100 1 0 0 gnd-1.sym
C 49300 48100 1 0 0 gnd-1.sym
C 49200 44100 1 0 0 vdd-1.sym
C 49200 46100 1 0 0 vdd-1.sym
C 49200 48100 1 0 0 vdd-1.sym
C 49200 50100 1 0 0 vdd-1.sym
N 47500 40100 52400 40100 4
N 52400 40100 52400 43700 4
C 52700 47200 1 90 0 in-1.sym
{
T 52200 47200 5 10 0 0 90 0 1
footprint=anchor
T 52400 47200 5 10 0 0 90 0 1
device=INPUT
T 52600 47200 5 10 1 1 90 7 1
refdes=N#
}
C 53300 47800 1 0 0 in-1.sym
{
T 53300 48300 5 10 0 0 0 0 1
footprint=anchor
T 53300 48100 5 10 0 0 0 0 1
device=INPUT
T 53800 48100 5 10 1 1 180 0 1
refdes=AND
}
C 53300 47600 1 0 0 in-1.sym
{
T 53300 48100 5 10 0 0 0 0 1
footprint=anchor
T 53300 47900 5 10 0 0 0 0 1
device=INPUT
T 53400 47500 5 10 1 1 0 0 1
refdes=OR
}
C 56300 47900 1 0 1 in-1.sym
{
T 56300 48400 5 10 0 0 0 6 1
footprint=anchor
T 56300 48200 5 10 0 0 0 6 1
device=INPUT
T 56000 48050 5 10 1 1 0 3 1
refdes=CS#
}
C 56300 47700 1 0 1 in-1.sym
{
T 56300 48200 5 10 0 0 0 6 1
footprint=anchor
T 56300 48000 5 10 0 0 0 6 1
device=INPUT
T 56000 47750 5 10 1 1 0 5 1
refdes=CR
}
C 55100 46600 1 90 0 in-1.sym
{
T 54600 46600 5 10 0 0 90 0 1
footprint=anchor
T 54800 46600 5 10 0 0 90 0 1
device=INPUT
T 55000 46600 5 10 1 1 0 5 1
refdes=Ci#
}
C 55100 49600 1 90 0 out-1.sym
{
T 54600 49600 5 10 0 0 90 0 1
footprint=anchor
T 54800 49600 5 10 0 0 90 0 1
device=OUTPUT
T 55000 49900 5 10 1 1 0 0 1
refdes=Co#
}
C 48000 49400 1 0 0 in-1.sym
{
T 48000 49900 5 10 0 0 0 0 1
footprint=anchor
T 48000 49700 5 10 0 0 0 0 1
device=INPUT
T 48000 49500 5 10 1 1 0 7 1
refdes=WA
}
C 48000 48900 1 0 0 in-1.sym
{
T 48000 49400 5 10 0 0 0 0 1
footprint=anchor
T 48000 49200 5 10 0 0 0 0 1
device=INPUT
T 48000 49000 5 10 1 1 0 7 1
refdes=RA
}
C 48000 47400 1 0 0 in-1.sym
{
T 48000 47900 5 10 0 0 0 0 1
footprint=anchor
T 48000 47700 5 10 0 0 0 0 1
device=INPUT
T 48000 47500 5 10 1 1 0 7 1
refdes=WX
}
C 48000 46900 1 0 0 in-1.sym
{
T 48000 47400 5 10 0 0 0 0 1
footprint=anchor
T 48000 47200 5 10 0 0 0 0 1
device=INPUT
T 48000 47000 5 10 1 1 0 7 1
refdes=RX
}
C 48000 45400 1 0 0 in-1.sym
{
T 48000 45900 5 10 0 0 0 0 1
footprint=anchor
T 48000 45700 5 10 0 0 0 0 1
device=INPUT
T 48000 45500 5 10 1 1 0 7 1
refdes=WY
}
C 48000 44900 1 0 0 in-1.sym
{
T 48000 45400 5 10 0 0 0 0 1
footprint=anchor
T 48000 45200 5 10 0 0 0 0 1
device=INPUT
T 48000 45000 5 10 1 1 0 7 1
refdes=RY
}
C 48000 43400 1 0 0 in-1.sym
{
T 48000 43900 5 10 0 0 0 0 1
footprint=anchor
T 48000 43700 5 10 0 0 0 0 1
device=INPUT
T 48000 43500 5 10 1 1 0 7 1
refdes=WU
}
C 48000 42900 1 0 0 in-1.sym
{
T 48000 43400 5 10 0 0 0 0 1
footprint=anchor
T 48000 43200 5 10 0 0 0 0 1
device=INPUT
T 48000 43000 5 10 1 1 0 7 1
refdes=RU
}
C 54500 46900 1 0 0 gnd-1.sym
C 54400 49600 1 0 0 vdd-1.sym
N 48600 48800 47600 48800 4
N 47600 40200 47600 48800 4
N 48600 46800 47600 46800 4
N 48600 44800 47600 44800 4
N 47600 42800 48600 42800 4
C 51600 48600 1 0 0 in-1.sym
{
T 51600 49100 5 10 0 0 0 0 1
footprint=anchor
T 51600 48900 5 10 0 0 0 0 1
device=INPUT
T 51600 48700 5 10 1 1 0 7 1
refdes=AS
}
C 52100 49900 1 270 0 in-1.sym
{
T 52600 49900 5 10 0 0 270 0 1
footprint=anchor
T 52400 49900 5 10 0 0 270 0 1
device=INPUT
T 52200 49900 5 10 1 1 0 3 1
refdes=AR#
}
N 47600 40200 50800 40200 4
{
T 48100 40200 5 10 1 1 0 0 1
netname=Bi#
}
N 50800 40200 50800 40600 4
C 51300 40000 1 0 1 gnd-1.sym
C 54100 42800 1 0 1 gnd-1.sym
C 54200 44600 1 0 1 vdd-1.sym
C 52100 45200 1 0 1 gnd-1.sym
C 51800 46100 1 0 0 vdd-1.sym
C 53100 45800 1 270 0 out-1.sym
{
T 53600 45800 5 10 0 0 270 0 1
footprint=anchor
T 53400 45800 5 10 0 0 270 0 1
device=OUTPUT
T 53200 45200 5 10 1 1 270 1 1
refdes=B
}
C 52300 45800 1 270 0 out-1.sym
{
T 52800 45800 5 10 0 0 270 0 1
footprint=anchor
T 52600 45800 5 10 0 0 270 0 1
device=OUTPUT
T 52400 45200 5 10 1 1 270 1 1
refdes=B#
}
C 52700 43000 1 0 1 gnd-1.sym
C 52100 43500 1 0 1 gnd-1.sym
N 52400 48300 51600 48300 4
N 51600 48300 51600 40600 4
{
T 51550 44900 5 10 1 1 90 6 1
netname=Bi
}
C 52400 43700 1 0 1 2n7002.sym
{
T 52175 44000 5 10 1 1 0 7 1
refdes=M7
T 52300 44500 5 10 0 1 0 6 1
value=2N7002P
T 51900 44300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 50900 44300 5 10 0 1 0 6 1
device=NMOS
}
C 53000 43200 1 0 1 2n7002.sym
{
T 52775 43500 5 10 1 1 0 7 1
refdes=M8
T 52900 44000 5 10 0 1 0 6 1
value=2N7002P
T 52500 43800 5 10 0 1 0 6 1
footprint=sot23-nmos
T 51500 43800 5 10 0 1 0 6 1
device=NMOS
}
N 50300 44200 52000 44200 4
N 52600 43700 52400 43700 4
C 54800 43100 1 0 1 dilatch.sym
{
T 53450 43500 5 10 1 1 0 0 1
refdes=L
T 54000 43800 5 10 1 1 0 4 1
source=dilatch.sch
}
C 39500 41100 1 0 0 in-1.sym
{
T 39500 41600 5 10 0 0 0 0 1
footprint=anchor
T 39500 41400 5 10 0 0 180 8 1
device=INPUT
T 39500 41200 5 10 1 1 0 7 1
refdes=ϕ0
}
N 55400 48700 55500 48700 4
N 55500 48700 55500 42500 4
C 51800 48700 1 0 0 not.sym
{
T 52150 49000 5 10 1 1 0 4 1
refdes=I4
}
C 52900 47500 1 0 1 gnd-1.sym
C 52600 48600 1 0 0 vdd-1.sym
N 53100 48200 53100 48600 4
N 53100 48600 53900 48600 4
{
T 53300 48400 5 10 1 1 0 0 1
netname=EB
}
N 55700 48000 55400 48000 4
N 55700 47800 55400 47800 4
C 50700 49000 1 90 0 out-1.sym
{
T 50200 49000 5 10 0 0 90 0 1
footprint=anchor
T 50400 49000 5 10 0 0 90 0 1
device=OUTPUT
T 50600 49600 5 10 1 1 180 5 1
refdes=Ao#
}
C 50500 48800 1 270 0 out-1.sym
{
T 51000 48800 5 10 0 0 270 0 1
footprint=anchor
T 50800 48800 5 10 0 0 270 0 1
device=OUTPUT
T 50600 48200 5 10 1 1 180 3 1
refdes=Ao
}
N 52400 44000 53200 44000 4
N 53000 44200 53200 44200 4
N 50600 48800 50200 48800 4
N 50200 46800 50400 46800 4
{
T 50450 46800 5 10 1 1 0 1 1
netname=VX
}
N 50200 44800 50400 44800 4
{
T 50450 44800 5 10 1 1 0 1 1
netname=VY
}
N 50200 42800 50400 42800 4
{
T 50450 42800 5 10 1 1 0 1 1
netname=VU
}
N 50200 49000 51800 49000 4
C 39000 44200 1 0 0 sramcell.sym
{
T 40350 44650 5 10 1 1 0 6 1
refdes=L0
T 39800 44925 5 10 1 1 0 4 1
source=sramcell.sch
}
C 41100 44200 1 0 0 sramcell.sym
{
T 42450 44650 5 10 1 1 0 6 1
refdes=L1
T 41400 44850 5 10 1 1 0 0 1
source=sramcell.sch
}
C 43200 44200 1 0 0 sramcell.sym
{
T 44550 44650 5 10 1 1 0 6 1
refdes=L2
T 43500 44850 5 10 1 1 0 0 1
source=sramcell.sch
}
C 45300 44200 1 0 0 sramcell.sym
{
T 46650 44650 5 10 1 1 0 6 1
refdes=L3
T 45600 44850 5 10 1 1 0 0 1
source=sramcell.sch
}
C 38400 44600 1 0 0 in-1.sym
{
T 38400 45100 5 10 0 0 0 0 1
footprint=anchor
T 38400 44900 5 10 0 0 0 0 1
device=INPUT
T 38750 44850 5 10 1 1 180 0 1
refdes=S0
}
C 40500 44600 1 0 0 in-1.sym
{
T 40500 45100 5 10 0 0 0 0 1
footprint=anchor
T 40500 44900 5 10 0 0 0 0 1
device=INPUT
T 40850 44850 5 10 1 1 180 0 1
refdes=S1
}
C 42600 44600 1 0 0 in-1.sym
{
T 42600 45100 5 10 0 0 0 0 1
footprint=anchor
T 42600 44900 5 10 0 0 0 0 1
device=INPUT
T 42950 44850 5 10 1 1 180 0 1
refdes=S2
}
C 44700 44600 1 0 0 in-1.sym
{
T 44700 45100 5 10 0 0 0 0 1
footprint=anchor
T 44700 44900 5 10 0 0 0 0 1
device=INPUT
T 45050 44850 5 10 1 1 180 0 1
refdes=S3
}
C 41800 43900 1 0 0 gnd-1.sym
N 40600 45100 40600 45900 4
N 40600 45900 46900 45900 4
N 46900 45900 46900 45100 4
{
T 46900 45200 5 10 1 1 0 0 1
netname=R
}
N 39000 45100 39000 45800 4
{
T 39000 45200 5 10 1 1 0 6 1
netname=L
}
N 39000 45800 45300 45800 4
N 45300 45800 45300 45100 4
N 44800 45100 44800 45900 4
N 43200 45100 43200 45800 4
N 42700 45100 42700 45900 4
N 41100 45100 41100 45800 4
C 43400 47800 1 0 1 pdtc124.sym
{
T 43225 47900 5 10 1 1 0 0 1
refdes=Q3
T 42700 48300 5 10 0 1 0 6 1
footprint=sot323-bjt
T 43300 48500 5 10 0 1 0 6 1
value=PDTC124TU
}
C 43400 48400 1 0 1 2n7002.sym
{
T 43175 48700 5 10 1 1 0 7 1
refdes=M5
T 43300 49200 5 10 0 1 0 6 1
value=2N7002P
T 42900 49000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 41900 49000 5 10 0 1 0 6 1
device=NMOS
}
C 42000 47500 1 0 0 gnd-1.sym
N 43000 48500 43000 48300 4
C 40700 48400 1 0 0 2n7002.sym
{
T 40900 48700 5 10 1 1 0 1 1
refdes=M1
T 40800 49200 5 10 0 1 0 0 1
value=2N7002P
T 41200 49000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 42200 49000 5 10 0 1 0 0 1
device=NMOS
}
C 40700 47800 1 0 0 2n7002.sym
{
T 40900 48100 5 10 1 1 0 1 1
refdes=M2
T 40800 48600 5 10 0 1 0 0 1
value=2N7002P
T 41200 48400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 42200 48400 5 10 0 1 0 0 1
device=NMOS
}
N 41100 48300 41100 48500 4
C 44000 48600 1 0 1 in-1.sym
{
T 44000 49100 5 10 0 0 0 6 1
footprint=anchor
T 44000 48900 5 10 0 0 0 6 1
device=INPUT
T 44000 48700 5 10 1 1 180 7 1
refdes=Ret
}
C 40100 48000 1 0 0 in-1.sym
{
T 40100 48500 5 10 0 0 0 0 1
footprint=anchor
T 40100 48300 5 10 0 0 0 0 1
device=INPUT
T 40450 48250 5 10 1 1 180 0 1
refdes=Inc
}
N 41100 47800 43000 47800 4
N 41100 49000 44500 49000 4
N 39900 48700 40700 48700 4
N 43400 48100 43700 48100 4
N 43700 48100 43700 45800 4
N 40000 48700 40000 47100 4
N 40000 47100 40500 47100 4
C 40500 46800 1 0 0 not.sym
{
T 40750 47050 5 10 1 1 0 0 1
refdes=I1
}
C 42100 46800 1 0 0 not.sym
{
T 42350 47050 5 10 1 1 0 0 1
refdes=I2
}
N 41300 47100 42100 47100 4
N 40900 47400 42500 47400 4
C 40300 47300 1 0 0 in-1.sym
{
T 40300 47800 5 10 0 0 0 0 1
footprint=anchor
T 40300 47600 5 10 0 0 0 0 1
device=INPUT
T 40900 47600 5 10 1 1 180 0 1
refdes=VPush
}
C 40800 46500 1 0 0 gnd-1.sym
C 42400 46500 1 0 0 gnd-1.sym
C 41000 46700 1 270 0 pdtc124.sym
{
T 41600 46600 5 10 1 1 270 0 1
refdes=Q1
T 41500 46000 5 10 0 1 270 0 1
footprint=sot323-bjt
T 41700 46600 5 10 0 1 270 0 1
value=PDTC124TU
}
C 42600 46700 1 270 0 pdtc124.sym
{
T 43200 46600 5 10 1 1 270 0 1
refdes=Q2
T 43100 46000 5 10 0 1 270 0 1
footprint=sot323-bjt
T 43300 46600 5 10 0 1 270 0 1
value=PDTC124TU
}
N 41300 47100 41300 46700 4
C 41000 46000 1 0 0 gnd-1.sym
C 42600 46000 1 0 0 gnd-1.sym
N 43100 46300 43100 45900 4
C 42300 48400 1 0 0 2n7002.sym
{
T 42400 49200 5 10 0 1 0 0 1
value=2N7002P
T 42800 49000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 43800 49000 5 10 0 1 0 0 1
device=NMOS
T 42500 48700 5 10 1 1 0 1 1
refdes=M3
}
C 42300 47800 1 0 0 2n7002.sym
{
T 42400 48600 5 10 0 1 0 0 1
value=2N7002P
T 42800 48400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 43800 48400 5 10 0 1 0 0 1
device=NMOS
T 42500 48100 5 10 1 1 0 1 1
refdes=M4
}
N 42700 48300 42700 48500 4
N 41100 47800 41100 47900 4
N 42700 47900 42700 47800 4
N 43000 47800 43000 47900 4
N 41100 48900 41100 49000 4
N 42700 49000 42700 48900 4
N 43000 48900 43000 49000 4
C 41700 48000 1 0 0 in-1.sym
{
T 41700 48500 5 10 0 0 0 0 1
footprint=anchor
T 41700 48300 5 10 0 0 0 0 1
device=INPUT
T 41650 48150 5 10 1 1 180 0 1
refdes=Jump
}
C 45200 47600 1 0 0 gnd-1.sym
N 41500 46300 41500 45800 4
N 42900 46700 42900 47100 4
C 44500 47900 1 0 0 dflipflop.sym
{
T 44775 48525 5 10 1 1 0 0 1
source=dflipflops.sch
T 45550 48300 5 10 1 1 0 0 1
refdes=F
}
C 39600 45600 1 0 0 vdd-1.sym
C 45100 49400 1 0 0 vdd-1.sym
C 42200 49000 1 90 0 resistor-load.sym
{
T 41800 49300 5 10 0 0 90 0 1
device=RESISTOR
T 42000 49400 5 10 1 1 90 0 1
refdes=R1
T 42100 49400 5 10 0 1 90 0 1
footprint=0603-boxed
T 42100 49400 5 10 0 1 90 0 1
value=3.3k
}
C 41900 49900 1 0 0 vdd-1.sym
C 46500 48900 1 180 1 out-1.sym
{
T 46500 48400 5 10 0 0 180 6 1
footprint=anchor
T 46500 48600 5 10 0 0 180 6 1
device=OUTPUT
T 46775 48775 5 10 1 1 180 6 1
refdes=P
}
C 46500 48900 1 0 0 out-1.sym
{
T 46500 49400 5 10 0 0 0 0 1
footprint=anchor
T 46500 49200 5 10 0 0 0 0 1
device=OUTPUT
T 46775 49025 5 10 1 1 0 0 1
refdes=P#
}
C 40000 41200 1 0 0 gnd-1.sym
C 39500 41400 1 0 0 in-1.sym
{
T 39500 41900 5 10 0 0 0 0 1
footprint=anchor
T 39500 41700 5 10 0 0 0 0 1
device=INPUT
T 39800 41500 5 10 1 1 0 5 1
refdes=GND
}
C 39500 41700 1 0 0 in-1.sym
{
T 39500 42200 5 10 0 0 0 0 1
footprint=anchor
T 39500 42000 5 10 0 0 0 0 1
device=INPUT
T 39950 41950 5 10 1 1 180 0 1
refdes=Vdd
}
C 39900 41800 1 0 0 vdd-1.sym
C 39700 48200 1 270 0 out-1.sym
{
T 40000 48200 5 10 0 0 270 0 1
device=OUTPUT
T 39800 47600 5 10 1 1 0 5 1
refdes=PCo
T 40200 48200 5 10 0 0 270 0 1
footprint=anchor
}
N 46500 49000 46100 49000 4
{
T 46300 49050 5 10 1 1 0 3 1
netname=P#
}
N 46500 48800 46100 48800 4
{
T 46300 48750 5 10 1 1 0 5 1
netname=P
}
C 39700 43900 1 0 0 gnd-1.sym
C 46000 43900 1 0 0 gnd-1.sym
C 43900 43900 1 0 0 gnd-1.sym
C 41700 45600 1 0 0 vdd-1.sym
C 45900 45600 1 0 0 vdd-1.sym
C 43800 45600 1 0 0 vdd-1.sym
C 39300 47900 1 0 0 gnd-1.sym
C 39200 49200 1 0 0 vdd-1.sym
C 41850 40550 1 0 0 dflipflop.sym
{
T 43200 40950 5 10 1 1 0 7 1
refdes=G
T 42650 41200 5 10 1 1 0 4 1
source=dflipflop.sch
}
C 41250 41550 1 0 0 in-1.sym
{
T 41250 42050 5 10 0 0 0 0 1
footprint=anchor
T 41250 41850 5 10 0 0 0 0 1
device=INPUT
T 41500 41700 5 10 1 1 0 3 1
refdes=O
}
C 43450 41550 1 0 0 out-1.sym
{
T 43450 41850 5 10 0 0 0 0 1
device=OUTPUT
T 43750 41750 5 10 1 1 0 3 1
refdes=I
T 43450 42050 5 10 0 0 0 0 1
footprint=anchor
}
C 43450 41350 1 0 0 out-1.sym
{
T 43450 41650 5 10 0 0 0 0 1
device=OUTPUT
T 43650 41350 5 10 1 1 0 5 1
refdes=I#
T 43450 41850 5 10 0 0 0 0 1
footprint=anchor
}
C 40400 41100 1 0 1 phi0.sym
C 42450 42050 1 0 0 vdd-1.sym
C 42550 40250 1 0 0 gnd-1.sym
C 41550 40950 1 0 0 phi0.sym
C 44200 48300 1 0 0 phi0.sym
C 55100 43500 1 0 1 phi0.sym
C 56100 46700 1 0 1 in-1.sym
{
T 56100 47200 5 10 0 0 0 6 1
footprint=anchor
T 56100 47000 5 10 0 0 0 6 1
device=INPUT
T 55800 46750 5 10 1 1 0 5 1
refdes=Q
}
C 48600 40400 1 0 0 sramcell2.sym
{
T 49400 41250 5 8 1 1 0 4 1
source=sramcell2.sch
T 49750 41450 5 10 1 1 0 0 1
refdes=K
}
N 48600 41700 47500 41700 4
C 49300 40100 1 0 0 gnd-1.sym
C 49200 42100 1 0 0 vdd-1.sym
C 48000 41400 1 0 0 in-1.sym
{
T 48000 41900 5 10 0 0 0 0 1
footprint=anchor
T 48000 41700 5 10 0 0 0 0 1
device=INPUT
T 48000 41500 5 10 1 1 0 7 1
refdes=WK
}
C 48000 40900 1 0 0 in-1.sym
{
T 48000 41400 5 10 0 0 0 0 1
footprint=anchor
T 48000 41200 5 10 0 0 0 0 1
device=INPUT
T 48000 41000 5 10 1 1 0 7 1
refdes=RK
}
N 48600 40800 47600 40800 4
N 50200 40800 50400 40800 4
{
T 50450 40800 5 10 1 1 0 1 1
netname=VK
}
N 50200 41700 50300 41700 4
N 55500 44200 54800 44200 4
C 54700 42000 1 0 0 nandod.sym
{
T 55100 42500 5 10 1 1 0 4 1
refdes=S5
}
C 55100 41700 1 0 1 gnd-1.sym
C 54100 42500 1 0 0 in-1.sym
{
T 54100 43000 5 10 0 0 0 0 1
footprint=anchor
T 54100 42800 5 10 0 0 180 8 1
device=INPUT
T 54100 42600 5 10 1 1 0 7 1
refdes=K#
}
C 54100 42300 1 0 0 in-1.sym
{
T 54100 42800 5 10 0 0 0 0 1
footprint=anchor
T 54100 42600 5 10 0 0 180 8 1
device=INPUT
T 54100 42400 5 10 1 1 0 7 1
refdes=QK
}
C 56300 48800 1 0 1 in-1.sym
{
T 56300 49300 5 10 0 0 0 6 1
footprint=anchor
T 56300 49100 5 10 0 0 180 2 1
device=INPUT
T 56000 49000 5 10 1 1 0 3 1
refdes=QE
}
C 41700 48600 1 0 0 in-1.sym
{
T 41700 49100 5 10 0 0 0 0 1
footprint=anchor
T 41700 48900 5 10 0 0 180 8 1
device=INPUT
T 41700 48700 5 10 1 1 0 7 1
refdes=J
}
C 55800 45100 1 0 0 gnd-1.sym
C 55900 45700 1 0 0 out-1.sym
{
T 55900 46200 5 10 0 0 0 0 1
footprint=anchor
T 55900 46000 5 10 0 0 0 0 1
device=OUTPUT
T 56200 45825 5 10 1 1 0 0 1
refdes=Z
}
C 55500 45300 1 0 0 2n7002.sym
{
T 55725 45600 5 10 1 1 0 1 1
refdes=M6
T 55600 46100 5 10 0 1 0 0 1
value=2N7002P
T 56000 45900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 57000 45900 5 10 0 1 0 0 1
device=NMOS
}
N 55700 48900 55400 48900 4
C 38400 47700 1 90 0 in-1.sym
{
T 38100 47700 5 10 0 0 90 0 1
device=INPUT
T 38300 47700 5 10 1 1 180 3 1
refdes=PCi
T 37900 47700 5 10 0 0 90 0 1
footprint=anchor
}
C 39100 48200 1 0 0 xor.sym
{
T 39300 48800 5 10 1 1 0 0 1
refdes=S4
}
N 39800 48200 39800 48500 4
N 39800 48500 39700 48500 4
N 39100 48800 39100 49000 4
{
T 39100 49050 5 10 1 1 0 3 1
netname=P#
}
N 50200 47000 50400 47000 4
{
T 50450 47000 5 10 1 1 0 1 1
netname=VX#
}
N 50200 45000 50400 45000 4
{
T 50450 45000 5 10 1 1 0 1 1
netname=VY#
}
N 50200 43000 50400 43000 4
{
T 50450 43000 5 10 1 1 0 1 1
netname=VU#
}
N 50200 41000 50400 41000 4
{
T 50450 41000 5 10 1 1 0 1 1
netname=VK#
}
C 38300 48300 1 0 0 not.sym
{
T 38650 48600 5 10 1 1 0 4 1
refdes=I3
}
C 38500 48900 1 0 0 vdd-1.sym
C 38800 48000 1 0 1 gnd-1.sym
N 38300 48300 38300 48600 4
C 50800 40300 1 0 0 notb.sym
{
T 51225 40600 5 10 1 1 0 4 1
refdes=I5
}
C 51400 40900 1 0 1 vdd-1.sym
C 51600 45500 1 0 0 cnot.sym
{
T 51925 45800 5 10 1 1 0 4 1
refdes=B2
}
C 52400 45500 1 0 0 cnot.sym
{
T 52725 45800 5 10 1 1 0 4 1
refdes=B3
}
C 52900 45200 1 0 1 gnd-1.sym
C 52600 46100 1 0 0 vdd-1.sym
C 52400 47800 1 0 0 seli.sym
{
T 52625 48200 5 10 1 1 0 1 1
refdes=B1
}
N 52400 48100 52400 45800 4
