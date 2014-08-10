v 20130925 2
C 52100 48600 1 0 0 alu.sym
{
T 52850 49650 5 10 1 1 0 4 1
source=alu.sch
T 52850 50000 5 10 1 1 0 4 1
refdes=E
}
C 46800 44000 1 0 0 sramcell2.sym
{
T 47600 44850 5 8 1 1 0 4 1
source=sramcell2.sch
T 47950 45050 5 10 1 1 0 0 1
refdes=U
}
C 46800 46000 1 0 0 sramcell2.sym
{
T 47600 46850 5 8 1 1 0 4 1
source=sramcell2.sch
T 47950 47050 5 10 1 1 0 0 1
refdes=Y
}
C 46800 48000 1 0 0 sramcell2.sym
{
T 47600 48850 5 8 1 1 0 4 1
source=sramcell2.sch
T 47950 49050 5 10 1 1 0 0 1
refdes=X
}
C 46800 50000 1 0 0 sramcell2.sym
{
T 47600 50850 5 8 1 1 0 4 1
source=sramcell2.sch
T 47950 51050 5 10 1 1 0 0 1
refdes=A
}
N 48400 50400 50000 50400 4
N 52000 46300 52000 47000 4
N 50800 50400 52100 50400 4
N 45700 51300 45700 43600 4
N 48500 51300 48500 45300 4
N 45700 51300 46800 51300 4
N 46800 49300 45700 49300 4
N 46800 47300 45700 47300 4
N 46800 45300 45700 45300 4
N 48400 45300 48500 45300 4
N 48400 47300 48500 47300 4
N 48400 49300 48500 49300 4
N 48400 51300 48500 51300 4
C 47500 43700 1 0 0 gnd-1.sym
C 47500 45700 1 0 0 gnd-1.sym
C 47500 47700 1 0 0 gnd-1.sym
C 47500 49700 1 0 0 gnd-1.sym
C 47400 45700 1 0 0 vdd-1.sym
C 47400 47700 1 0 0 vdd-1.sym
C 47400 49700 1 0 0 vdd-1.sym
C 47400 51700 1 0 0 vdd-1.sym
N 45700 43600 51400 43600 4
N 51400 43600 51400 46500 4
C 49800 49400 1 0 0 in-1.sym
{
T 49800 49900 5 10 0 0 0 0 1
footprint=anchor
T 49800 49700 5 10 0 0 0 0 1
device=INPUT
T 49800 49500 5 10 1 1 0 7 1
refdes=N
}
C 51500 49200 1 0 0 in-1.sym
{
T 51500 49700 5 10 0 0 0 0 1
footprint=anchor
T 51500 49500 5 10 0 0 0 0 1
device=INPUT
T 52000 49500 5 10 1 1 180 0 1
refdes=AND
}
C 51500 49000 1 0 0 in-1.sym
{
T 51500 49500 5 10 0 0 0 0 1
footprint=anchor
T 51500 49300 5 10 0 0 0 0 1
device=INPUT
T 51600 48900 5 10 1 1 0 0 1
refdes=OR#
}
C 54800 49300 1 0 1 in-1.sym
{
T 54800 49800 5 10 0 0 0 6 1
footprint=anchor
T 54800 49600 5 10 0 0 0 6 1
device=INPUT
T 54500 49450 5 10 1 1 0 3 1
refdes=CS#
}
C 54800 49100 1 0 1 in-1.sym
{
T 54800 49600 5 10 0 0 0 6 1
footprint=anchor
T 54800 49400 5 10 0 0 0 6 1
device=INPUT
T 54500 49150 5 10 1 1 0 5 1
refdes=CR
}
C 53300 48000 1 90 0 in-1.sym
{
T 52800 48000 5 10 0 0 90 0 1
footprint=anchor
T 53000 48000 5 10 0 0 90 0 1
device=INPUT
T 53200 48000 5 10 1 1 0 5 1
refdes=C#
}
C 53300 51000 1 90 0 out-1.sym
{
T 52800 51000 5 10 0 0 90 0 1
footprint=anchor
T 53000 51000 5 10 0 0 90 0 1
device=OUTPUT
T 53200 51300 5 10 1 1 0 0 1
refdes=Co#
}
C 46200 51000 1 0 0 in-1.sym
{
T 46200 51500 5 10 0 0 0 0 1
footprint=anchor
T 46200 51300 5 10 0 0 0 0 1
device=INPUT
T 46200 51100 5 10 1 1 0 7 1
refdes=WA
}
C 46200 50500 1 0 0 in-1.sym
{
T 46200 51000 5 10 0 0 0 0 1
footprint=anchor
T 46200 50800 5 10 0 0 0 0 1
device=INPUT
T 46200 50600 5 10 1 1 0 7 1
refdes=RA
}
C 46200 49000 1 0 0 in-1.sym
{
T 46200 49500 5 10 0 0 0 0 1
footprint=anchor
T 46200 49300 5 10 0 0 0 0 1
device=INPUT
T 46200 49100 5 10 1 1 0 7 1
refdes=WX
}
C 46200 48500 1 0 0 in-1.sym
{
T 46200 49000 5 10 0 0 0 0 1
footprint=anchor
T 46200 48800 5 10 0 0 0 0 1
device=INPUT
T 46200 48600 5 10 1 1 0 7 1
refdes=RX
}
C 46200 47000 1 0 0 in-1.sym
{
T 46200 47500 5 10 0 0 0 0 1
footprint=anchor
T 46200 47300 5 10 0 0 0 0 1
device=INPUT
T 46200 47100 5 10 1 1 0 7 1
refdes=WY
}
C 46200 46500 1 0 0 in-1.sym
{
T 46200 47000 5 10 0 0 0 0 1
footprint=anchor
T 46200 46800 5 10 0 0 0 0 1
device=INPUT
T 46200 46600 5 10 1 1 0 7 1
refdes=RY
}
C 46200 45000 1 0 0 in-1.sym
{
T 46200 45500 5 10 0 0 0 0 1
footprint=anchor
T 46200 45300 5 10 0 0 0 0 1
device=INPUT
T 46200 45100 5 10 1 1 0 7 1
refdes=WU
}
C 46200 44500 1 0 0 in-1.sym
{
T 46200 45000 5 10 0 0 0 0 1
footprint=anchor
T 46200 44800 5 10 0 0 0 0 1
device=INPUT
T 46200 44600 5 10 1 1 0 7 1
refdes=RU
}
C 52700 48300 1 0 0 gnd-1.sym
C 52600 51000 1 0 0 vdd-1.sym
N 46800 50400 45800 50400 4
N 45800 43700 45800 50400 4
N 46800 48400 45800 48400 4
N 46800 46400 45800 46400 4
N 45800 44400 46800 44400 4
C 49800 50000 1 0 0 in-1.sym
{
T 49800 50500 5 10 0 0 0 0 1
footprint=anchor
T 49800 50300 5 10 0 0 0 0 1
device=INPUT
T 49800 50100 5 10 1 1 0 7 1
refdes=AS
}
C 50300 51300 1 270 0 in-1.sym
{
T 50800 51300 5 10 0 0 270 0 1
footprint=anchor
T 50600 51300 5 10 0 0 270 0 1
device=INPUT
T 50400 51300 5 10 1 1 0 3 1
refdes=AR#
}
N 45800 43700 48600 43700 4
N 48600 43700 48600 44300 4
C 48600 44000 1 0 0 pdtc124.sym
{
T 48800 44300 5 10 1 1 0 1 1
refdes=Q
T 49300 44500 5 10 0 1 0 0 1
footprint=sot323-bjt
T 48700 44700 5 10 0 1 0 0 1
value=PDTC124TU
}
C 49100 43800 1 0 1 gnd-1.sym
C 50100 47900 1 0 1 gnd-1.sym
C 50600 48100 1 90 0 in-1.sym
{
T 50100 48100 5 10 0 0 90 0 1
footprint=anchor
T 50300 48100 5 10 0 0 90 0 1
device=INPUT
T 50500 48100 5 10 1 1 0 5 1
refdes=B#
}
C 52200 50900 1 0 0 in-1.sym
{
T 52200 51400 5 10 0 0 0 0 1
footprint=anchor
T 52200 51200 5 10 0 0 0 0 1
device=INPUT
T 52200 51000 5 10 1 1 0 7 1
refdes=Vdd
}
C 52200 48500 1 0 0 in-1.sym
{
T 52200 49000 5 10 0 0 0 0 1
footprint=anchor
T 52200 48800 5 10 0 0 0 0 1
device=INPUT
T 52200 48600 5 10 1 1 0 7 1
refdes=GND
}
C 49100 48500 1 0 0 in-1.sym
{
T 49100 49000 5 10 0 0 0 0 1
footprint=anchor
T 49100 48800 5 10 0 0 0 0 1
device=INPUT
T 49200 48400 5 10 1 1 0 0 1
refdes=BV
}
C 49800 49200 1 0 0 vdd-1.sym
C 53100 45600 1 0 1 gnd-1.sym
C 53200 47400 1 0 1 vdd-1.sym
C 49300 46700 1 0 0 vdd-1.sym
C 49400 45400 1 0 0 gnd-1.sym
C 50400 46000 1 0 1 in-1.sym
{
T 50400 46500 5 10 0 0 0 6 1
footprint=anchor
T 50400 46300 5 10 0 0 0 6 1
device=INPUT
T 50400 46100 5 10 1 1 0 1 1
refdes=VK
}
C 50400 46200 1 0 1 in-1.sym
{
T 50400 46700 5 10 0 0 0 6 1
footprint=anchor
T 50400 46500 5 10 0 0 0 6 1
device=INPUT
T 50400 46300 5 10 1 1 0 1 1
refdes=K#
}
C 49700 48200 1 0 0 nand.sym
{
T 50100 48700 5 10 1 1 0 4 1
refdes=B2
}
N 50500 48700 50500 49700 4
C 49500 44300 1 0 1 gnd-1.sym
C 49200 45200 1 0 0 vdd-1.sym
C 49700 44900 1 0 0 out-1.sym
{
T 49700 45400 5 10 0 0 0 0 1
footprint=anchor
T 49700 45200 5 10 0 0 0 0 1
device=OUTPUT
T 50300 45000 5 10 1 1 0 1 1
refdes=V
}
C 49700 44700 1 0 0 out-1.sym
{
T 49700 45200 5 10 0 0 0 0 1
footprint=anchor
T 49700 45000 5 10 0 0 0 0 1
device=OUTPUT
T 50300 44800 5 10 1 1 0 1 1
refdes=V#
}
C 51700 45800 1 0 1 gnd-1.sym
C 51100 46300 1 0 1 gnd-1.sym
C 49000 44600 1 0 0 noverlap.sym
{
T 49300 44900 5 10 1 1 0 4 1
refdes=V2
}
N 49700 48800 49000 48800 4
N 49000 48800 49000 44500 4
C 51400 46500 1 0 1 2n7002.sym
{
T 51175 46800 5 10 1 1 0 7 1
refdes=M2
T 51300 47300 5 10 0 1 0 6 1
value=2N7002P
T 50900 47100 5 10 0 1 0 6 1
footprint=sot23-nmos
T 49900 47100 5 10 0 1 0 6 1
device=NMOS
}
C 52000 46000 1 0 1 2n7002.sym
{
T 51775 46300 5 10 1 1 0 7 1
refdes=M3
T 51900 46800 5 10 0 1 0 6 1
value=2N7002P
T 51500 46600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 50500 46600 5 10 0 1 0 6 1
device=NMOS
}
N 51000 47000 48500 47000 4
N 51600 46500 51400 46500 4
C 53800 45900 1 0 1 vdilatch.sym
{
T 52450 46300 5 10 1 1 0 0 1
refdes=L
T 53000 46600 5 10 1 1 0 4 1
source=vdilatch.sch
}
C 54400 46300 1 0 1 in-1.sym
{
T 54400 46800 5 10 0 0 0 6 1
footprint=anchor
T 54400 46600 5 10 0 0 180 2 1
device=INPUT
T 54400 46400 5 10 1 1 0 1 1
refdes=ϕ0
}
N 53600 50100 53800 50100 4
N 53800 50100 53800 47000 4
C 50000 50100 1 0 0 not.sym
{
T 50350 50400 5 10 1 1 0 4 1
refdes=I
}
C 50600 49100 1 0 0 xnor.sym
{
T 50800 49700 5 10 1 1 0 0 1
refdes=B1
}
N 50400 49500 50600 49500 4
N 50500 49700 50600 49700 4
C 51000 48800 1 0 1 gnd-1.sym
C 50700 50100 1 0 0 vdd-1.sym
N 51400 49600 51400 50000 4
N 51400 50000 52100 50000 4
C 53800 49800 1 0 0 2n7002.sym
{
T 54025 50100 5 10 1 1 0 1 1
refdes=M1
T 53900 50600 5 10 0 1 0 0 1
value=2N7002P
T 54300 50400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 55300 50400 5 10 0 1 0 0 1
device=NMOS
}
C 54100 49600 1 0 0 gnd-1.sym
C 54200 50200 1 0 0 out-1.sym
{
T 54200 50700 5 10 0 0 0 0 1
footprint=anchor
T 54200 50500 5 10 0 0 0 0 1
device=OUTPUT
T 54500 50325 5 10 1 1 0 0 1
refdes=Z
}
C 49800 45700 1 0 1 nand.sym
{
T 49400 46200 5 10 1 1 0 4 1
refdes=V1
}
N 54200 49400 53600 49400 4
N 54200 49200 53600 49200 4
N 48400 50600 48600 50600 4
C 49300 49900 1 270 0 out-1.sym
{
T 49800 49900 5 10 0 0 270 0 1
footprint=anchor
T 49600 49900 5 10 0 0 270 0 1
device=OUTPUT
T 49400 49300 5 10 1 1 0 5 1
refdes=Ao#
}
C 49500 51000 1 90 0 out-1.sym
{
T 49000 51000 5 10 0 0 90 0 1
footprint=anchor
T 49200 51000 5 10 0 0 90 0 1
device=OUTPUT
T 49400 51600 5 10 1 1 0 3 1
refdes=Ao
}
N 51400 46800 52200 46800 4
N 52000 47000 52200 47000 4
C 48600 50700 1 0 0 cnot.sym
{
T 48925 51000 5 10 1 1 0 4 1
refdes=J
}
C 48600 49600 1 0 0 cnot.sym
{
T 48925 49900 5 10 1 1 0 4 1
refdes=K
}
C 48800 51300 1 0 0 vdd-1.sym
C 48800 50200 1 0 0 vdd-1.sym
C 49100 50400 1 0 1 gnd-1.sym
C 49100 49300 1 0 1 gnd-1.sym
N 48600 50600 48600 51000 4
N 48600 49900 48600 50400 4
