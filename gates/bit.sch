v 20201216 2
C 53900 47200 1 0 0 alu.sym
{
T 54650 48250 5 10 1 1 0 4 1
source=alu.sch
T 54650 48600 5 10 1 1 0 4 1
refdes=E
}
C 48600 43100 1 0 0 sramcell2.sym
{
T 49400 43800 5 8 1 1 0 4 1
source=sramcell2.sch
T 49400 43300 5 10 1 1 0 3 1
refdes=U
}
C 48600 44900 1 0 0 sramcell2.sym
{
T 49400 45600 5 8 1 1 0 4 1
source=sramcell2.sch
T 49400 45100 5 10 1 1 0 3 1
refdes=Y
}
C 48600 46700 1 0 0 sramcell2.sym
{
T 49400 47400 5 8 1 1 0 4 1
source=sramcell2.sch
T 49400 46900 5 10 1 1 0 3 1
refdes=X
}
C 48600 48500 1 0 0 sramcell2s.sym
{
T 49400 49200 5 8 1 1 0 4 1
source=sramcell2s.sch
T 49400 48700 5 10 1 1 0 3 1
refdes=A
}
N 53900 44100 53900 43500 4
N 52800 49000 53900 49000 4
{
T 53250 49050 5 10 1 1 0 0 1
netname=EA
}
C 49300 42800 1 0 0 gnd-1.sym
C 49300 44600 1 0 0 gnd-1.sym
C 49300 46400 1 0 0 gnd-1.sym
C 49300 48200 1 0 0 gnd-1.sym
C 49200 44500 1 0 0 vdd-1.sym
C 49200 46300 1 0 0 vdd-1.sym
C 49200 48100 1 0 0 vdd-1.sym
C 49200 49900 1 0 0 vdd-1.sym
C 52400 47000 1 90 0 in-1.sym
{
T 51900 47000 5 10 0 0 90 0 1
footprint=anchor
T 52100 47000 5 10 0 0 90 0 1
device=INPUT
T 52300 47000 5 10 1 1 90 7 1
refdes=N#
}
C 53300 47800 1 0 0 in-1.sym
{
T 53300 48300 5 10 0 0 0 0 1
footprint=anchor
T 53300 48100 5 10 0 0 0 0 1
device=INPUT
T 53400 47950 5 10 1 1 0 0 1
refdes=AND
}
C 53300 47600 1 0 0 in-1.sym
{
T 53300 48100 5 10 0 0 0 0 1
footprint=anchor
T 53300 47900 5 10 0 0 0 0 1
device=INPUT
T 53400 47650 5 10 1 1 0 2 1
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
C 55700 49500 1 0 0 out-1.sym
{
T 55700 50000 5 10 0 0 0 0 1
footprint=anchor
T 55700 49800 5 10 0 0 0 0 1
device=OUTPUT
T 56000 49650 5 10 1 1 0 3 1
refdes=Co#
}
C 48000 49300 1 0 0 in-1.sym
{
T 48000 49800 5 10 0 0 0 0 1
footprint=anchor
T 48000 49600 5 10 0 0 0 0 1
device=INPUT
T 48000 49400 5 10 1 1 0 7 1
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
C 48000 47500 1 0 0 in-1.sym
{
T 48000 48000 5 10 0 0 0 0 1
footprint=anchor
T 48000 47800 5 10 0 0 0 0 1
device=INPUT
T 48000 47600 5 10 1 1 0 7 1
refdes=WX
}
C 48000 47100 1 0 0 in-1.sym
{
T 48000 47600 5 10 0 0 0 0 1
footprint=anchor
T 48000 47400 5 10 0 0 0 0 1
device=INPUT
T 48000 47200 5 10 1 1 0 7 1
refdes=RX
}
C 48000 45700 1 0 0 in-1.sym
{
T 48000 46200 5 10 0 0 0 0 1
footprint=anchor
T 48000 46000 5 10 0 0 0 0 1
device=INPUT
T 48000 45800 5 10 1 1 0 7 1
refdes=WY
}
C 48000 45300 1 0 0 in-1.sym
{
T 48000 45800 5 10 0 0 0 0 1
footprint=anchor
T 48000 45600 5 10 0 0 0 0 1
device=INPUT
T 48000 45400 5 10 1 1 0 7 1
refdes=RY
}
C 48000 43900 1 0 0 in-1.sym
{
T 48000 44400 5 10 0 0 0 0 1
footprint=anchor
T 48000 44200 5 10 0 0 0 0 1
device=INPUT
T 48000 44000 5 10 1 1 0 7 1
refdes=WU
}
C 48000 43500 1 0 0 in-1.sym
{
T 48000 44000 5 10 0 0 0 0 1
footprint=anchor
T 48000 43800 5 10 0 0 0 0 1
device=INPUT
T 48000 43600 5 10 1 1 0 7 1
refdes=RU
}
C 54500 46900 1 0 0 gnd-1.sym
C 54400 49600 1 0 0 vdd-1.sym
C 51800 48600 1 0 0 in-1.sym
{
T 51800 49100 5 10 0 0 0 0 1
footprint=anchor
T 51800 48900 5 10 0 0 0 0 1
device=INPUT
T 51800 48700 5 10 1 1 0 7 1
refdes=AS
}
C 52300 49900 1 270 0 in-1.sym
{
T 52800 49900 5 10 0 0 270 0 1
footprint=anchor
T 52600 49900 5 10 0 0 270 0 1
device=INPUT
T 52400 49900 5 10 1 1 0 3 1
refdes=AR#
}
C 51600 46300 1 0 1 gnd-1.sym
C 54800 42100 1 0 1 gnd-1.sym
C 54900 43900 1 0 1 vdd-1.sym
C 53600 43600 1 0 1 gnd-1.sym
C 53600 42800 1 0 1 gnd-1.sym
N 52300 47800 51900 47800 4
N 51900 47800 51900 46100 4
{
T 51850 47700 5 10 1 1 90 6 1
netname=Bi
}
C 53900 43000 1 0 1 2n7002.sym
{
T 53675 43300 5 8 1 1 0 7 1
refdes=M3
T 53800 43800 5 8 0 1 0 6 1
value=2N7002P
T 53400 43600 5 8 0 1 0 6 1
footprint=sot23-nmos
T 52400 43600 5 8 0 1 0 6 1
device=NMOS
}
C 53900 43800 1 0 1 2n7002.sym
{
T 53675 44100 5 8 1 1 0 7 1
refdes=M2
T 53800 44600 5 8 0 1 0 6 1
value=2N7002P
T 53400 44400 5 8 0 1 0 6 1
footprint=sot23-nmos
T 52400 44400 5 8 0 1 0 6 1
device=NMOS
}
N 53300 43500 53500 43500 4
{
T 53250 43500 5 10 1 1 0 7 1
netname=W
}
C 55500 42400 1 0 1 dilatch.sym
{
T 54150 42800 5 10 1 1 0 0 1
refdes=L
T 54700 43100 5 10 1 1 0 4 1
source=dilatch.sch
}
C 40400 42200 1 0 0 in-1.sym
{
T 40400 42700 5 10 0 0 0 0 1
footprint=anchor
T 40400 42500 5 10 0 0 180 8 1
device=INPUT
T 40400 42300 5 10 1 1 0 7 1
refdes=ϕ0
}
N 55400 48700 55500 48700 4
N 55500 48700 55500 43500 4
C 52000 48700 1 0 0 not.sym
{
T 52350 49000 5 10 1 1 0 4 1
refdes=I5
}
C 52700 46900 1 0 1 gnd-1.sym
C 52400 48200 1 0 0 vdd-1.sym
N 53100 47700 53100 48600 4
N 53100 48600 53900 48600 4
{
T 53300 48650 5 10 1 1 0 0 1
netname=EB
}
N 55700 48000 55400 48000 4
N 55700 47800 55400 47800 4
C 51300 49000 1 90 0 out-1.sym
{
T 50800 49000 5 10 0 0 90 0 1
footprint=anchor
T 51000 49000 5 10 0 0 90 0 1
device=OUTPUT
T 51200 49600 5 10 1 1 180 5 1
refdes=Ao#
}
C 51100 48800 1 270 0 out-1.sym
{
T 51600 48800 5 10 0 0 270 0 1
footprint=anchor
T 51400 48800 5 10 0 0 270 0 1
device=OUTPUT
T 51200 48200 5 10 1 1 180 3 1
refdes=Ao
}
N 51200 48800 50200 48800 4
N 50200 49000 52000 49000 4
C 40000 47900 1 0 0 sramcell.sym
{
T 41350 48350 5 10 1 1 0 6 1
refdes=L0
T 40800 48625 5 10 1 1 0 4 1
source=sramcell.sch
}
C 41800 47900 1 0 0 sramcell.sym
{
T 43150 48350 5 10 1 1 0 6 1
refdes=L1
T 42100 48550 5 10 1 1 0 0 1
source=sramcell.sch
}
C 43600 47900 1 0 0 sramcell.sym
{
T 44950 48350 5 10 1 1 0 6 1
refdes=L2
T 43900 48550 5 10 1 1 0 0 1
source=sramcell.sch
}
C 45400 47900 1 0 0 sramcell.sym
{
T 46750 48350 5 10 1 1 0 6 1
refdes=L3
T 45700 48550 5 10 1 1 0 0 1
source=sramcell.sch
}
C 40100 47800 1 90 0 in-1.sym
{
T 39600 47800 5 10 0 0 90 0 1
footprint=anchor
T 39800 47800 5 10 0 0 90 0 1
device=INPUT
T 40000 47800 5 10 1 1 0 5 1
refdes=S0
}
C 41900 47800 1 90 0 in-1.sym
{
T 41400 47800 5 10 0 0 90 0 1
footprint=anchor
T 41600 47800 5 10 0 0 90 0 1
device=INPUT
T 41800 47800 5 10 1 1 0 5 1
refdes=S1
}
C 43700 47800 1 90 0 in-1.sym
{
T 43200 47800 5 10 0 0 90 0 1
footprint=anchor
T 43400 47800 5 10 0 0 90 0 1
device=INPUT
T 43600 47800 5 10 1 1 0 5 1
refdes=S2
}
C 45500 47800 1 90 0 in-1.sym
{
T 45000 47800 5 10 0 0 90 0 1
footprint=anchor
T 45200 47800 5 10 0 0 90 0 1
device=INPUT
T 45400 47800 5 10 1 1 0 5 1
refdes=S3
}
C 42500 47600 1 0 0 gnd-1.sym
N 41600 48800 41600 49600 4
N 41600 49600 47000 49600 4
{
T 46500 49650 5 10 1 1 0 0 1
netname=SB#
}
N 47000 49600 47000 48800 4
N 40000 48800 40000 49900 4
N 40000 49500 45400 49500 4
{
T 40500 49550 5 10 1 1 0 0 1
netname=SB
}
N 45400 48800 45400 49500 4
N 45200 48800 45200 49600 4
N 43600 48800 43600 49500 4
N 43400 48800 43400 49600 4
N 41800 48800 41800 49500 4
C 44000 44100 1 0 1 pdtc124.sym
{
T 43775 44400 5 8 1 1 0 7 1
refdes=Q3
T 43300 44600 5 10 0 1 0 6 1
footprint=sot323-bjt
T 43900 44800 5 10 0 1 0 6 1
value=PDTC124TU
}
C 44000 44700 1 0 1 2n7002.sym
{
T 43775 45000 5 8 1 1 0 7 1
refdes=M1
T 43900 45500 5 10 0 1 0 6 1
value=2N7002P
T 43500 45300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 42500 45300 5 10 0 1 0 6 1
device=NMOS
}
C 43500 43800 1 0 0 gnd-1.sym
N 43600 44800 43600 44600 4
C 44600 45100 1 180 0 in-1.sym
{
T 44600 44600 5 10 0 0 180 0 1
footprint=anchor
T 44600 44800 5 10 0 0 180 0 1
device=INPUT
T 44600 45000 5 10 1 1 0 1 1
refdes=Ret
}
C 42500 46000 1 270 0 in-1.sym
{
T 43000 46000 5 10 0 0 270 0 1
footprint=anchor
T 42800 46000 5 10 0 0 270 0 1
device=INPUT
T 42750 45650 5 10 1 1 90 0 1
refdes=Inc
}
N 43400 45300 44900 45300 4
{
T 43700 45350 5 10 1 1 0 3 1
netname=Pn#
}
N 42300 45200 42600 45200 4
N 43600 44100 43600 44200 4
N 43600 45200 43600 45300 4
C 42000 43900 1 0 0 in-1.sym
{
T 42000 44400 5 10 0 0 0 0 1
footprint=anchor
T 42000 44200 5 10 0 0 0 0 1
device=INPUT
T 42100 43950 5 10 1 1 180 6 1
refdes=Jump
}
C 45600 43900 1 0 0 gnd-1.sym
C 44900 44200 1 0 0 dflipflop.sym
{
T 45175 44825 5 10 1 1 0 0 1
source=dflipflops.sch
T 45950 44600 5 10 1 1 0 0 1
refdes=F
}
C 40600 49300 1 0 0 vdd-1.sym
C 45500 45700 1 0 0 vdd-1.sym
C 46700 45200 1 180 1 out-1.sym
{
T 46700 44700 5 10 0 0 180 6 1
footprint=anchor
T 46700 44900 5 10 0 0 180 6 1
device=OUTPUT
T 46975 45075 5 10 1 1 180 6 1
refdes=P
}
C 46700 45200 1 0 0 out-1.sym
{
T 46700 45700 5 10 0 0 0 0 1
footprint=anchor
T 46700 45500 5 10 0 0 0 0 1
device=OUTPUT
T 46975 45325 5 10 1 1 0 0 1
refdes=P#
}
C 40900 41700 1 0 0 gnd-1.sym
C 40400 41900 1 0 0 in-1.sym
{
T 40400 42400 5 10 0 0 0 0 1
footprint=anchor
T 40400 42200 5 10 0 0 0 0 1
device=INPUT
T 40700 41950 5 10 1 1 0 5 1
refdes=GND
}
C 40400 42500 1 0 0 in-1.sym
{
T 40400 43000 5 10 0 0 0 3 1
footprint=anchor
T 40400 42800 5 10 0 0 0 3 1
device=INPUT
T 40650 42650 5 10 1 1 0 3 1
refdes=Vdd
}
C 40800 42600 1 0 0 vdd-1.sym
N 46700 45300 46500 45300 4
{
T 46600 45350 5 10 1 1 0 3 1
netname=P#
}
N 46700 45100 46500 45100 4
{
T 46600 45050 5 10 1 1 0 5 1
netname=P
}
C 40700 47600 1 0 0 gnd-1.sym
C 46100 47600 1 0 0 gnd-1.sym
C 44300 47600 1 0 0 gnd-1.sym
C 42400 49300 1 0 0 vdd-1.sym
C 46000 49300 1 0 0 vdd-1.sym
C 44200 49300 1 0 0 vdd-1.sym
C 51300 41300 1 0 0 dflipflop.sym
{
T 52650 41700 5 10 1 1 0 7 1
refdes=G
T 52100 41950 5 10 1 1 0 4 1
source=dflipflop.sch
}
C 51200 43000 1 270 0 in-1.sym
{
T 51700 43000 5 10 0 0 270 0 1
footprint=anchor
T 51500 43000 5 10 0 0 270 0 1
device=INPUT
T 51300 43000 5 10 1 1 270 7 1
refdes=O
}
C 52900 42300 1 0 0 out-1.sym
{
T 52900 42600 5 10 0 0 0 0 1
device=OUTPUT
T 53500 42400 5 10 1 1 0 1 1
refdes=I
T 52900 42800 5 10 0 0 0 0 1
footprint=anchor
}
C 52900 42100 1 0 0 out-1.sym
{
T 52900 42400 5 10 0 0 0 0 1
device=OUTPUT
T 53500 42200 5 10 1 1 0 1 1
refdes=I#
T 52900 42600 5 10 0 0 0 0 1
footprint=anchor
}
C 41300 42200 1 0 1 phi0.sym
C 51900 42800 1 0 0 vdd-1.sym
C 52000 41000 1 0 0 gnd-1.sym
C 51000 41700 1 0 0 phi0.sym
C 44600 44600 1 0 0 phi0.sym
C 55800 42800 1 0 1 phi0.sym
C 56100 46700 1 0 1 in-1.sym
{
T 56100 47200 5 10 0 0 0 6 1
footprint=anchor
T 56100 47000 5 10 0 0 0 6 1
device=INPUT
T 55800 46750 5 10 1 1 0 5 1
refdes=Q
}
C 48600 41300 1 0 0 sramcell2.sym
{
T 49400 42000 5 8 1 1 0 4 1
source=sramcell2.sch
T 49400 41500 5 10 1 1 0 3 1
refdes=K
}
C 49300 41000 1 0 0 gnd-1.sym
C 49200 42700 1 0 0 vdd-1.sym
C 48000 41700 1 0 0 in-1.sym
{
T 48000 42200 5 10 0 0 0 0 1
footprint=anchor
T 48000 42000 5 10 0 0 0 0 1
device=INPUT
T 48000 41800 5 10 1 1 0 7 1
refdes=RK
}
C 54700 44500 1 0 0 nandod.sym
{
T 55100 45000 5 10 1 1 0 4 1
refdes=S10
}
C 55100 44200 1 0 1 gnd-1.sym
C 54100 45000 1 0 0 in-1.sym
{
T 54100 45500 5 10 0 0 0 0 1
footprint=anchor
T 54100 45300 5 10 0 0 180 8 1
device=INPUT
T 54100 45100 5 10 1 1 0 7 1
refdes=K#
}
C 54100 44800 1 0 0 in-1.sym
{
T 54100 45300 5 10 0 0 0 0 1
footprint=anchor
T 54100 45100 5 10 0 0 180 8 1
device=INPUT
T 54100 44900 5 10 1 1 0 7 1
refdes=QK
}
C 56300 48800 1 0 1 in-1.sym
{
T 56300 49300 5 10 0 0 0 6 1
footprint=anchor
T 56300 49100 5 10 0 0 180 2 1
device=INPUT
T 56050 48950 5 10 1 1 0 3 1
refdes=QE
}
C 42000 44100 1 0 0 in-1.sym
{
T 42000 44600 5 10 0 0 0 0 1
footprint=anchor
T 42000 44400 5 10 0 0 180 8 1
device=INPUT
T 42000 44200 5 10 1 1 0 7 1
refdes=J
}
C 55800 44700 1 0 0 gnd-1.sym
C 56000 45400 1 90 0 out-1.sym
{
T 55500 45400 5 10 0 0 90 0 1
footprint=anchor
T 55700 45400 5 10 0 0 90 0 1
device=OUTPUT
T 55900 46025 5 10 1 1 0 3 1
refdes=Z
}
C 55500 44900 1 0 0 2n7002.sym
{
T 55725 45200 5 8 1 1 0 1 1
refdes=M6
T 55600 45700 5 10 0 1 0 0 1
value=2N7002P
T 56000 45500 5 10 0 1 0 0 1
footprint=sot23-nmos
T 57000 45500 5 10 0 1 0 0 1
device=NMOS
}
N 55700 48900 55400 48900 4
C 51100 46600 1 0 0 notb.sym
{
T 51525 46900 5 10 1 1 0 4 1
refdes=I6
}
C 51700 47200 1 0 1 vdd-1.sym
C 41300 49800 1 0 0 resistor-1.sym
{
T 41600 50200 5 10 0 0 0 0 1
device=RESISTOR
T 42000 49950 5 10 1 1 0 0 1
refdes=R2
T 41500 50000 5 10 1 1 0 0 1
value=22k
}
C 40900 49800 1 0 1 resistor-1.sym
{
T 40600 50200 5 10 0 0 0 6 1
device=RESISTOR
T 40200 49950 5 10 1 1 0 6 1
refdes=R1
T 40700 50000 5 10 1 1 0 6 1
value=22k
}
C 41100 49900 1 0 1 vdd-1.sym
C 41100 49900 1 0 0 vdd-1.sym
C 40600 44200 1 90 0 in-1.sym
{
T 40300 44200 5 10 0 0 90 0 1
device=INPUT
T 40100 44200 5 10 0 0 90 0 1
footprint=anchor
T 40500 44175 5 10 1 1 180 3 1
refdes=PCi
}
N 53300 44300 53500 44300 4
{
T 53250 44300 5 10 1 1 0 7 1
netname=W#
}
N 48400 42400 48600 42400 4
{
T 48350 42400 5 10 1 1 0 7 1
netname=W#
}
N 48400 44200 48600 44200 4
{
T 48350 44200 5 10 1 1 0 7 1
netname=W#
}
N 48400 46000 48600 46000 4
{
T 48350 46000 5 10 1 1 0 7 1
netname=W#
}
N 48400 47800 48600 47800 4
{
T 48350 47800 5 10 1 1 0 7 1
netname=W#
}
N 48400 49600 48600 49600 4
{
T 48350 49600 5 10 1 1 0 7 1
netname=W#
}
N 50400 42400 50200 42400 4
{
T 50450 42400 5 10 1 1 0 1 1
netname=W
}
N 50400 44200 50200 44200 4
{
T 50450 44200 5 10 1 1 0 1 1
netname=W
}
N 50400 46000 50200 46000 4
{
T 50450 46000 5 10 1 1 0 1 1
netname=W
}
N 50400 47800 50200 47800 4
{
T 50450 47800 5 10 1 1 0 1 1
netname=W
}
N 50400 49600 50200 49600 4
{
T 50450 49600 5 10 1 1 0 1 1
netname=W
}
N 48400 41600 48600 41600 4
{
T 48350 41600 5 10 1 1 0 7 1
netname=Bi#
}
N 48400 43400 48600 43400 4
{
T 48350 43400 5 10 1 1 0 7 1
netname=Bi#
}
N 48400 45200 48600 45200 4
{
T 48350 45200 5 10 1 1 0 7 1
netname=Bi#
}
N 48400 47000 48600 47000 4
{
T 48350 47000 5 10 1 1 0 7 1
netname=Bi#
}
N 48400 48800 48600 48800 4
{
T 48350 48800 5 10 1 1 0 7 1
netname=Bi#
}
N 50900 46900 51100 46900 4
{
T 50850 46900 5 10 1 1 0 7 1
netname=Bi#
}
C 48300 42100 1 0 0 phi0.sym
C 41500 44900 1 0 0 not.sym
{
T 41850 45200 5 10 1 1 0 4 1
refdes=I3
}
C 41400 44800 1 270 0 out-1.sym
{
T 41700 44800 5 10 0 0 270 0 1
device=OUTPUT
T 41900 44800 5 10 0 0 270 0 1
footprint=anchor
T 41500 44175 5 10 1 1 0 5 1
refdes=PCo
}
N 41500 46600 41500 45200 4
{
T 41550 45900 5 10 1 1 90 2 1
netname=Pp#
}
C 40900 44100 1 0 0 gnd-1.sym
C 41800 44600 1 0 0 gnd-1.sym
C 40800 45600 1 0 0 vdd-1.sym
C 41700 45500 1 0 0 vdd-1.sym
N 40300 45200 40500 45200 4
{
T 40250 45200 5 10 1 1 0 7 1
netname=P
}
C 42600 44800 1 0 0 nand.sym
{
T 43000 45300 5 10 1 1 0 4 1
refdes=S6
}
C 42700 45800 1 0 0 vdd-1.sym
C 42600 43600 1 0 0 nandod.sym
{
T 43000 44100 5 10 1 1 0 4 1
refdes=S7
}
C 42800 43300 1 0 0 gnd-1.sym
C 42800 44500 1 0 0 gnd-1.sym
N 43400 44100 43400 45300 4
N 42300 46600 42300 45200 4
{
T 42250 45900 5 10 1 1 90 0 1
netname=Pp
}
N 44000 44400 44200 44400 4
{
T 44250 44400 5 10 1 1 0 1 1
netname=SB
}
B 39700 41000 16700 9200 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
L 47500 50200 47500 41000 5 0 1 0 -1 -1
T 53200 49900 9 12 1 0 0 0 1
Register file and arithmetic unit
L 47500 47500 39700 47500 5 0 1 0 -1 -1
T 44000 50000 9 12 1 0 0 0 1
Stack memory
T 44000 47200 9 12 1 0 0 0 1
Program counter and branch
L 39700 43200 47500 43200 5 0 1 0 -1 -1
T 52100 42800 9 12 1 0 0 2 1
Instruction Bit
N 42200 49900 42200 49600 4
C 41300 47000 1 0 0 in-1.sym
{
T 41300 47500 5 10 0 0 0 3 1
footprint=anchor
T 41300 47300 5 10 0 0 0 3 1
device=INPUT
T 41700 47150 5 10 1 1 0 3 1
refdes=VPush
}
C 43100 46300 1 0 0 pdtc124.sym
{
T 43800 46800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 43200 47000 5 10 0 1 0 0 1
value=PDTC124TU
T 43300 46600 5 8 1 1 0 1 1
refdes=Q2
}
C 40700 46300 1 0 1 pdtc124.sym
{
T 40000 46800 5 10 0 1 0 6 1
footprint=sot323-bjt
T 40600 47000 5 10 0 1 0 6 1
value=PDTC124TU
T 40500 46600 5 8 1 1 0 7 1
refdes=Q1
}
C 41000 46000 1 0 0 gnd-1.sym
C 42600 46000 1 0 0 gnd-1.sym
N 43500 46300 43500 46400 4
N 40300 46400 40300 46300 4
N 43500 46800 43500 47000 4
{
T 43500 47050 5 10 1 1 0 3 1
netname=SB
}
N 40300 46800 40300 47000 4
{
T 40300 47050 5 10 1 1 0 3 1
netname=SB#
}
C 41500 46300 1 0 1 not.sym
{
T 41150 46600 5 10 1 1 0 4 1
refdes=I1
}
C 42300 46300 1 0 0 not.sym
{
T 42650 46600 5 10 1 1 0 4 1
refdes=I2
}
C 40200 46000 1 0 0 gnd-1.sym
C 43400 46000 1 0 0 gnd-1.sym
N 41100 46900 42700 46900 4
N 41900 47100 41900 46900 4
C 43900 42000 1 270 0 out-1.sym
{
T 44200 42000 5 10 0 0 270 0 1
device=OUTPUT
T 44400 42000 5 10 0 0 270 0 1
footprint=anchor
T 44000 41375 5 10 1 1 0 5 1
refdes=RCo
}
C 43400 41300 1 0 0 gnd-1.sym
C 43300 42800 1 0 0 vdd-1.sym
C 43100 41400 1 90 0 in-1.sym
{
T 42800 41400 5 10 0 0 90 0 1
device=INPUT
T 42600 41400 5 10 0 0 90 0 1
footprint=anchor
T 43000 41375 5 10 1 1 180 3 1
refdes=RCi
}
C 44900 41300 1 0 0 dflipflop.sym
{
T 46250 41700 5 10 1 1 0 7 1
refdes=R
T 45700 41950 5 10 1 1 0 4 1
source=dflipflop.sch
}
N 44000 42400 44900 42400 4
C 44600 41700 1 0 0 phi0.sym
N 46700 42400 46500 42400 4
{
T 46750 42400 5 10 1 1 0 1 1
netname=R#
}
N 46700 42200 46500 42200 4
{
T 46750 42200 5 10 1 1 0 1 1
netname=R
}
T 44000 42900 9 12 1 0 0 0 1
DRAM Refresh
C 45600 41000 1 0 0 gnd-1.sym
C 45500 42800 1 0 0 vdd-1.sym
C 51900 45600 1 0 0 seli.sym
{
T 52125 46000 5 10 1 1 0 1 1
refdes=B1
}
C 53100 45400 1 0 1 gnd-1.sym
C 52800 46300 1 0 0 vdd-1.sym
C 54300 46000 1 90 0 out-1.sym
{
T 53800 46000 5 10 0 0 90 0 1
footprint=anchor
T 54000 46000 5 10 0 0 90 0 1
device=OUTPUT
T 54200 46600 5 10 1 1 90 1 1
refdes=B#
}
C 53500 46000 1 90 0 out-1.sym
{
T 53000 46000 5 10 0 0 90 0 1
footprint=anchor
T 53200 46000 5 10 0 0 90 0 1
device=OUTPUT
T 53400 46600 5 10 1 1 90 1 1
refdes=B
}
C 52600 45700 1 0 0 cnot.sym
{
T 52925 46000 5 10 1 1 0 4 1
refdes=B2
}
C 53400 45700 1 0 0 cnot.sym
{
T 53725 46000 5 10 1 1 0 4 1
refdes=B3
}
C 53900 45400 1 0 1 gnd-1.sym
C 53600 46300 1 0 0 vdd-1.sym
N 51700 45900 51900 45900 4
{
T 51650 45900 5 10 1 1 0 7 1
netname=R
}
C 52300 47200 1 0 0 xnor.sym
{
T 52500 47800 5 10 1 1 0 0 1
refdes=N
}
C 52100 46400 1 0 0 vdd-1.sym
C 52400 45300 1 0 1 gnd-1.sym
C 51500 45500 1 0 0 in-1.sym
{
T 51500 46000 5 10 0 0 0 0 1
footprint=anchor
T 51500 45800 5 10 0 0 0 0 1
device=INPUT
T 51500 45600 5 10 1 1 0 7 1
refdes=MR#
}
N 55700 49600 55000 49600 4
N 52900 47500 53100 47500 4
C 40500 44400 1 0 0 halfadd.sym
{
T 41000 44700 5 10 1 1 0 4 1
refdes=S4
}
N 40300 45000 40500 45000 4
{
T 40250 45000 5 10 1 1 0 7 1
netname=P#
}
C 43000 41600 1 0 0 halfadd.sym
{
T 43500 41900 5 10 1 1 0 4 1
refdes=S5
}
N 42800 42400 43000 42400 4
{
T 42750 42400 5 10 1 1 0 7 1
netname=R
}
N 42800 42200 43000 42200 4
{
T 42750 42200 5 10 1 1 0 7 1
netname=R#
}
