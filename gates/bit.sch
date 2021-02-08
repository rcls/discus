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
C 51600 48200 1 0 0 in-1.sym
{
T 51600 48700 5 10 0 0 0 0 1
footprint=anchor
T 51600 48500 5 10 0 0 0 0 1
device=INPUT
T 51600 48300 5 10 1 1 0 7 1
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
N 47600 40200 51000 40200 4
N 51000 40200 51000 42100 4
C 51000 41800 1 0 0 pdtc124.sym
{
T 51200 42100 5 10 1 1 0 1 1
refdes=Q4
T 51700 42300 5 10 0 1 0 0 1
footprint=sot323-bjt
T 51100 42500 5 10 0 1 0 0 1
value=PDTC124TU
}
C 51500 41600 1 0 1 gnd-1.sym
C 54100 42800 1 0 1 gnd-1.sym
C 54200 44600 1 0 1 vdd-1.sym
C 51900 46100 1 0 1 gnd-1.sym
C 51600 47000 1 0 0 vdd-1.sym
C 52100 46700 1 0 0 out-1.sym
{
T 52100 47200 5 10 0 0 0 0 1
footprint=anchor
T 52100 47000 5 10 0 0 0 0 1
device=OUTPUT
T 52700 46800 5 10 1 1 0 1 1
refdes=B
}
C 52100 46500 1 0 0 out-1.sym
{
T 52100 47000 5 10 0 0 0 0 1
footprint=anchor
T 52100 46800 5 10 0 0 0 0 1
device=OUTPUT
T 52700 46600 5 10 1 1 0 1 1
refdes=B#
}
C 52700 43000 1 0 1 gnd-1.sym
C 52100 43500 1 0 1 gnd-1.sym
C 51400 46400 1 0 0 noverlap.sym
{
T 51700 46700 5 10 1 1 0 4 1
refdes=B2
}
N 52400 48100 51400 48100 4
N 51400 48100 51400 42300 4
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
C 46000 46500 1 0 0 in-1.sym
{
T 46000 47000 5 10 0 0 0 0 1
footprint=anchor
T 46000 46800 5 10 0 0 180 8 1
device=INPUT
T 46000 46600 5 10 1 1 0 7 1
refdes=ϕ0
}
N 55400 48700 55600 48700 4
N 55600 48700 55600 42500 4
C 51800 48700 1 0 0 not.sym
{
T 52150 49000 5 10 1 1 0 4 1
refdes=I3
}
C 52400 47700 1 0 0 xnor.sym
{
T 52600 48300 5 10 1 1 0 0 1
refdes=B1
}
N 52200 48300 52400 48300 4
C 52800 47400 1 0 1 gnd-1.sym
C 52500 48700 1 0 0 vdd-1.sym
N 53200 48200 53200 48600 4
N 53200 48600 53900 48600 4
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
T 50400 46800 5 10 1 1 0 1 1
netname=VX
}
N 50200 44800 50400 44800 4
{
T 50400 44800 5 10 1 1 0 1 1
netname=VY
}
N 50200 42800 50400 42800 4
{
T 50400 42800 5 10 1 1 0 1 1
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
C 42900 47800 1 0 1 pdtc124.sym
{
T 42725 47900 5 10 1 1 0 0 1
refdes=Q3
T 42200 48300 5 10 0 1 0 6 1
footprint=sot323-bjt
T 42800 48500 5 10 0 1 0 6 1
value=PDTC124TU
}
C 42900 48400 1 0 1 2n7002.sym
{
T 42675 48700 5 10 1 1 0 7 1
refdes=M5
T 42800 49200 5 10 0 1 0 6 1
value=2N7002P
T 42400 49000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 41400 49000 5 10 0 1 0 6 1
device=NMOS
}
C 41500 47500 1 0 0 gnd-1.sym
N 42500 48500 42500 48300 4
C 40200 48400 1 0 0 2n7002.sym
{
T 40400 48700 5 10 1 1 0 1 1
refdes=M1
T 40300 49200 5 10 0 1 0 0 1
value=2N7002P
T 40700 49000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 41700 49000 5 10 0 1 0 0 1
device=NMOS
}
C 40200 47800 1 0 0 2n7002.sym
{
T 40400 48100 5 10 1 1 0 1 1
refdes=M2
T 40300 48600 5 10 0 1 0 0 1
value=2N7002P
T 40700 48400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 41700 48400 5 10 0 1 0 0 1
device=NMOS
}
N 40600 48300 40600 48500 4
C 43500 48600 1 0 1 in-1.sym
{
T 43500 49100 5 10 0 0 0 6 1
footprint=anchor
T 43500 48900 5 10 0 0 0 6 1
device=INPUT
T 43500 48700 5 10 1 1 180 7 1
refdes=Ret
}
C 39600 48000 1 0 0 in-1.sym
{
T 39600 48500 5 10 0 0 0 0 1
footprint=anchor
T 39600 48300 5 10 0 0 0 0 1
device=INPUT
T 39950 48250 5 10 1 1 180 0 1
refdes=Inc
}
N 40600 47800 42500 47800 4
N 40600 49000 44000 49000 4
N 39400 48700 40200 48700 4
N 42900 48100 43200 48100 4
N 43200 48100 43200 45800 4
N 39500 48700 39500 47100 4
N 39500 47100 40000 47100 4
C 40000 46800 1 0 0 not.sym
{
T 40250 47050 5 10 1 1 0 0 1
refdes=I1
}
C 41600 46800 1 0 0 not.sym
{
T 41850 47050 5 10 1 1 0 0 1
refdes=I2
}
N 40800 47100 41600 47100 4
N 40400 47400 42000 47400 4
C 39800 47300 1 0 0 in-1.sym
{
T 39800 47800 5 10 0 0 0 0 1
footprint=anchor
T 39800 47600 5 10 0 0 0 0 1
device=INPUT
T 40400 47600 5 10 1 1 180 0 1
refdes=Push
}
C 40300 46500 1 0 0 gnd-1.sym
C 41900 46500 1 0 0 gnd-1.sym
C 40500 46700 1 270 0 pdtc124.sym
{
T 41100 46600 5 10 1 1 270 0 1
refdes=Q1
T 41000 46000 5 10 0 1 270 0 1
footprint=sot323-bjt
T 41200 46600 5 10 0 1 270 0 1
value=PDTC124TU
}
C 42100 46700 1 270 0 pdtc124.sym
{
T 42700 46600 5 10 1 1 270 0 1
refdes=Q2
T 42600 46000 5 10 0 1 270 0 1
footprint=sot323-bjt
T 42800 46600 5 10 0 1 270 0 1
value=PDTC124TU
}
N 40800 47100 40800 46700 4
C 40500 46000 1 0 0 gnd-1.sym
C 42100 46000 1 0 0 gnd-1.sym
N 42600 46300 42600 45900 4
C 41800 48400 1 0 0 2n7002.sym
{
T 41900 49200 5 10 0 1 0 0 1
value=2N7002P
T 42300 49000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 43300 49000 5 10 0 1 0 0 1
device=NMOS
T 42000 48700 5 10 1 1 0 1 1
refdes=M3
}
C 41800 47800 1 0 0 2n7002.sym
{
T 41900 48600 5 10 0 1 0 0 1
value=2N7002P
T 42300 48400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 43300 48400 5 10 0 1 0 0 1
device=NMOS
T 42000 48100 5 10 1 1 0 1 1
refdes=M4
}
N 42200 48300 42200 48500 4
N 40600 47800 40600 47900 4
N 42200 47900 42200 47800 4
N 42500 47800 42500 47900 4
N 40600 48900 40600 49000 4
N 42200 49000 42200 48900 4
N 42500 48900 42500 49000 4
C 41200 48000 1 0 0 in-1.sym
{
T 41200 48500 5 10 0 0 0 0 1
footprint=anchor
T 41200 48300 5 10 0 0 0 0 1
device=INPUT
T 41150 48150 5 10 1 1 180 0 1
refdes=Jmp
}
C 44700 47600 1 0 0 gnd-1.sym
N 41000 46300 41000 45800 4
N 42400 46700 42400 47100 4
C 44000 47900 1 0 0 dflipflop.sym
{
T 44275 48525 5 10 1 1 0 0 1
source=dflipflops.sch
T 45050 48300 5 10 1 1 0 0 1
refdes=F
}
C 39600 45600 1 0 0 vdd-1.sym
C 44600 49400 1 0 0 vdd-1.sym
C 41700 49000 1 90 0 resistor-load.sym
{
T 41300 49300 5 10 0 0 90 0 1
device=RESISTOR
T 41500 49400 5 10 1 1 90 0 1
refdes=R1
T 41600 49400 5 10 0 1 90 0 1
footprint=0603-boxed
T 41600 49400 5 10 0 1 90 0 1
value=3.3k
}
C 41400 49900 1 0 0 vdd-1.sym
C 46000 48900 1 180 1 out-1.sym
{
T 46000 48400 5 10 0 0 180 6 1
footprint=anchor
T 46000 48600 5 10 0 0 180 6 1
device=OUTPUT
T 46275 48775 5 10 1 1 180 6 1
refdes=P
}
C 46000 48900 1 0 0 out-1.sym
{
T 46000 49400 5 10 0 0 0 0 1
footprint=anchor
T 46000 49200 5 10 0 0 0 0 1
device=OUTPUT
T 46275 49025 5 10 1 1 0 0 1
refdes=P#
}
C 46500 46600 1 0 0 gnd-1.sym
C 46000 46800 1 0 0 in-1.sym
{
T 46000 47300 5 10 0 0 0 0 1
footprint=anchor
T 46000 47100 5 10 0 0 0 0 1
device=INPUT
T 46300 46900 5 10 1 1 0 5 1
refdes=GND
}
C 46000 47100 1 0 0 in-1.sym
{
T 46000 47600 5 10 0 0 0 0 1
footprint=anchor
T 46000 47400 5 10 0 0 0 0 1
device=INPUT
T 46450 47350 5 10 1 1 180 0 1
refdes=Vdd
}
C 46400 47200 1 0 0 vdd-1.sym
C 38400 47600 1 270 0 out-1.sym
{
T 38700 47600 5 10 0 0 270 0 1
device=OUTPUT
T 38500 47000 5 10 1 1 0 5 1
refdes=PCo
T 38900 47600 5 10 0 0 270 0 1
footprint=anchor
}
N 46000 49000 45600 49000 4
{
T 45800 49050 5 10 1 1 0 3 1
netname=P#
}
N 46000 48800 45600 48800 4
{
T 45800 48750 5 10 1 1 0 5 1
netname=P
}
C 39700 43900 1 0 0 gnd-1.sym
C 46000 43900 1 0 0 gnd-1.sym
C 43900 43900 1 0 0 gnd-1.sym
C 41700 45600 1 0 0 vdd-1.sym
C 45900 45600 1 0 0 vdd-1.sym
C 43800 45600 1 0 0 vdd-1.sym
C 38800 47900 1 0 0 gnd-1.sym
C 38700 49200 1 0 0 vdd-1.sym
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
C 46900 46500 1 0 1 phi0.sym
C 42450 42050 1 0 0 vdd-1.sym
C 42550 40250 1 0 0 gnd-1.sym
C 41550 40950 1 0 0 phi0.sym
C 43700 48300 1 0 0 phi0.sym
C 55100 43500 1 0 1 phi0.sym
C 56200 46700 1 0 1 in-1.sym
{
T 56200 47200 5 10 0 0 0 6 1
footprint=anchor
T 56200 47000 5 10 0 0 0 6 1
device=INPUT
T 55900 46750 5 10 1 1 0 5 1
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
T 50400 40800 5 10 1 1 0 1 1
netname=VK
}
N 50200 41700 50300 41700 4
N 55600 44200 54800 44200 4
C 54800 42000 1 0 0 nandod.sym
{
T 55200 42500 5 10 1 1 0 4 1
refdes=S5
}
C 55200 41700 1 0 1 gnd-1.sym
C 54200 42500 1 0 0 in-1.sym
{
T 54200 43000 5 10 0 0 0 0 1
footprint=anchor
T 54200 42800 5 10 0 0 180 8 1
device=INPUT
T 54200 42600 5 10 1 1 0 7 1
refdes=K#
}
C 54200 42300 1 0 0 in-1.sym
{
T 54200 42800 5 10 0 0 0 0 1
footprint=anchor
T 54200 42600 5 10 0 0 180 8 1
device=INPUT
T 54200 42400 5 10 1 1 0 7 1
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
C 41200 48600 1 0 0 in-1.sym
{
T 41200 49100 5 10 0 0 0 0 1
footprint=anchor
T 41200 48900 5 10 0 0 180 8 1
device=INPUT
T 41200 48700 5 10 1 1 0 7 1
refdes=J
}
C 55900 45100 1 0 0 gnd-1.sym
C 56000 45700 1 0 0 out-1.sym
{
T 56000 46200 5 10 0 0 0 0 1
footprint=anchor
T 56000 46000 5 10 0 0 0 0 1
device=OUTPUT
T 56300 45825 5 10 1 1 0 0 1
refdes=Z
}
C 55600 45300 1 0 0 2n7002.sym
{
T 55825 45600 5 10 1 1 0 1 1
refdes=M6
T 55700 46100 5 10 0 1 0 0 1
value=2N7002P
T 56100 45900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 57100 45900 5 10 0 1 0 0 1
device=NMOS
}
N 55700 48900 55400 48900 4
C 38500 48000 1 90 0 in-1.sym
{
T 38200 48000 5 10 0 0 90 0 1
device=INPUT
T 38400 48000 5 10 1 1 180 3 1
refdes=PCi
T 38000 48000 5 10 0 0 90 0 1
footprint=anchor
}
C 39300 47300 1 0 1 not.sym
{
T 38950 47600 5 10 1 1 0 4 1
refdes=I?
}
C 39100 47900 1 0 1 vdd-1.sym
C 38800 47000 1 0 0 gnd-1.sym
C 38600 48200 1 0 0 xor.sym
{
T 38800 48800 5 10 1 1 0 0 1
refdes=S?
}
N 39300 47600 39300 48500 4
N 39300 48500 39200 48500 4
N 38600 48800 38400 48800 4
{
T 38350 48800 5 10 1 1 0 7 1
netname=P
}
N 38400 48600 38600 48600 4
N 50200 47000 50400 47000 4
{
T 50400 47000 5 10 1 1 0 1 1
netname=VX#
}
N 50200 45000 50400 45000 4
{
T 50400 45000 5 10 1 1 0 1 1
netname=VY#
}
N 50200 43000 50400 43000 4
{
T 50400 43000 5 10 1 1 0 1 1
netname=VU#
}
N 50200 41000 50400 41000 4
{
T 50400 41000 5 10 1 1 0 1 1
netname=VK#
}
