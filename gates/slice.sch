v 20130925 2
C 52500 48300 1 0 0 alu.sym
{
T 53100 49300 5 10 1 1 0 0 1
source=alu.sch
T 53100 49600 5 10 1 1 0 0 1
refdes=Z
}
C 46800 44000 1 0 0 sramcell2.sym
{
T 47050 44800 5 10 1 1 0 0 1
source=sramcell2.sch
T 47950 45050 5 10 1 1 0 0 1
refdes=U
}
C 46800 46000 1 0 0 sramcell2.sym
{
T 47050 46800 5 10 1 1 0 0 1
source=sramcell2.sch
T 47950 47050 5 10 1 1 0 0 1
refdes=Y
}
C 46800 48000 1 0 0 sramcell2.sym
{
T 47050 48800 5 10 1 1 0 0 1
source=sramcell2.sch
T 47950 49050 5 10 1 1 0 0 1
refdes=X
}
C 46800 50000 1 0 0 sramcell2.sym
{
T 47050 50800 5 10 1 1 0 0 1
source=sramcell2.sch
T 47950 51050 5 10 1 1 0 0 1
refdes=A
}
N 48400 50400 49600 50400 4
N 53100 45300 53100 46800 4
N 53100 47000 53100 47400 4
N 50600 50100 52500 50100 4
N 45700 51300 45700 43600 4
N 48600 51300 48600 45300 4
N 45700 51300 46800 51300 4
N 46800 49300 45700 49300 4
N 46800 47300 45700 47300 4
N 46800 45300 45700 45300 4
N 48400 45300 48600 45300 4
N 48400 47300 48600 47300 4
N 48400 49300 48600 49300 4
N 48400 51300 48600 51300 4
C 47500 43700 1 0 0 gnd-1.sym
C 47500 45700 1 0 0 gnd-1.sym
C 47500 47700 1 0 0 gnd-1.sym
C 47500 49700 1 0 0 gnd-1.sym
C 47400 45700 1 0 0 vdd-1.sym
C 47400 47700 1 0 0 vdd-1.sym
C 47400 49700 1 0 0 vdd-1.sym
C 47400 51700 1 0 0 vdd-1.sym
N 45700 43600 52500 43600 4
N 52500 43600 52500 45500 4
C 51900 49400 1 0 0 in-1.sym
{
T 51900 49900 5 10 0 0 0 0 1
footprint=anchor
T 51900 49700 5 10 0 0 0 0 1
device=INPUT
T 51700 49400 5 10 1 1 0 0 1
refdes=N
}
C 51900 48900 1 0 0 in-1.sym
{
T 51900 49400 5 10 0 0 0 0 1
footprint=anchor
T 51900 49200 5 10 0 0 0 0 1
device=INPUT
T 52500 49200 5 10 1 1 180 0 1
refdes=AND#
}
C 51900 48700 1 0 0 in-1.sym
{
T 51900 49200 5 10 0 0 0 0 1
footprint=anchor
T 51900 49000 5 10 0 0 0 0 1
device=INPUT
T 52000 48600 5 10 1 1 0 0 1
refdes=OR
}
C 54600 49000 1 0 1 in-1.sym
{
T 54600 49500 5 10 0 0 0 6 1
footprint=anchor
T 54600 49300 5 10 0 0 0 6 1
device=INPUT
T 54100 49300 5 10 1 1 180 6 1
refdes=CS#
}
C 54600 48800 1 0 1 in-1.sym
{
T 54600 49300 5 10 0 0 0 6 1
footprint=anchor
T 54600 49100 5 10 0 0 0 6 1
device=INPUT
T 54400 48700 5 10 1 1 0 6 1
refdes=CR
}
C 53700 47700 1 90 0 in-1.sym
{
T 53200 47700 5 10 0 0 90 0 1
footprint=anchor
T 53400 47700 5 10 0 0 90 0 1
device=INPUT
T 53800 47900 5 10 1 1 90 0 1
refdes=C
}
C 53700 50700 1 90 0 out-1.sym
{
T 53200 50700 5 10 0 0 90 0 1
footprint=anchor
T 53400 50700 5 10 0 0 90 0 1
device=OUTPUT
T 53800 50900 5 10 1 1 90 0 1
refdes=Co
}
C 46200 51000 1 0 0 in-1.sym
{
T 46200 51500 5 10 0 0 0 0 1
footprint=anchor
T 46200 51300 5 10 0 0 0 0 1
device=INPUT
T 45900 51000 5 10 1 1 0 0 1
refdes=WA
}
C 46200 50500 1 0 0 in-1.sym
{
T 46200 51000 5 10 0 0 0 0 1
footprint=anchor
T 46200 50800 5 10 0 0 0 0 1
device=INPUT
T 45900 50500 5 10 1 1 0 0 1
refdes=RA
}
C 46200 49000 1 0 0 in-1.sym
{
T 46200 49500 5 10 0 0 0 0 1
footprint=anchor
T 46200 49300 5 10 0 0 0 0 1
device=INPUT
T 45900 49000 5 10 1 1 0 0 1
refdes=WX
}
C 46200 48500 1 0 0 in-1.sym
{
T 46200 49000 5 10 0 0 0 0 1
footprint=anchor
T 46200 48800 5 10 0 0 0 0 1
device=INPUT
T 45900 48500 5 10 1 1 0 0 1
refdes=RX
}
C 46200 47000 1 0 0 in-1.sym
{
T 46200 47500 5 10 0 0 0 0 1
footprint=anchor
T 46200 47300 5 10 0 0 0 0 1
device=INPUT
T 45900 47000 5 10 1 1 0 0 1
refdes=WY
}
C 46200 46500 1 0 0 in-1.sym
{
T 46200 47000 5 10 0 0 0 0 1
footprint=anchor
T 46200 46800 5 10 0 0 0 0 1
device=INPUT
T 45900 46500 5 10 1 1 0 0 1
refdes=RY
}
C 46200 45000 1 0 0 in-1.sym
{
T 46200 45500 5 10 0 0 0 0 1
footprint=anchor
T 46200 45300 5 10 0 0 0 0 1
device=INPUT
T 45900 45000 5 10 1 1 0 0 1
refdes=WU
}
C 46200 44500 1 0 0 in-1.sym
{
T 46200 45000 5 10 0 0 0 0 1
footprint=anchor
T 46200 44800 5 10 0 0 0 0 1
device=INPUT
T 45900 44500 5 10 1 1 0 0 1
refdes=RU
}
C 53100 48000 1 0 0 gnd-1.sym
C 53000 50700 1 0 0 vdd-1.sym
N 46800 50400 45800 50400 4
N 45800 43700 45800 50400 4
N 46800 48400 45800 48400 4
N 46800 46400 45800 46400 4
N 45800 44400 46800 44400 4
C 49000 49800 1 0 0 in-1.sym
{
T 49000 50300 5 10 0 0 0 0 1
footprint=anchor
T 49000 50100 5 10 0 0 0 0 1
device=INPUT
T 48700 49800 5 10 1 1 0 0 1
refdes=AR#
}
N 49600 49900 49900 49900 4
C 49000 50100 1 0 0 in-1.sym
{
T 49000 50600 5 10 0 0 0 0 1
footprint=anchor
T 49000 50400 5 10 0 0 0 0 1
device=INPUT
T 48700 50100 5 10 1 1 0 0 1
refdes=AS
}
N 45800 43700 48600 43700 4
N 48600 43700 48600 44700 4
C 48600 44400 1 0 0 pdtc124.sym
{
T 48800 44700 5 10 1 1 0 1 1
refdes=Q
T 49300 44900 5 10 0 1 0 0 1
footprint=sot323-bjt
T 48700 45100 5 10 0 1 0 0 1
value=PDTC124TU
}
C 49100 44200 1 0 1 gnd-1.sym
N 49000 45000 50400 45000 4
C 50900 48400 1 0 1 gnd-1.sym
N 51300 49700 52500 49700 4
C 51400 48600 1 90 0 in-1.sym
{
T 50900 48600 5 10 0 0 90 0 1
footprint=anchor
T 51100 48600 5 10 0 0 90 0 1
device=INPUT
T 51400 48400 5 10 1 1 90 0 1
refdes=B#
}
C 52600 50600 1 0 0 in-1.sym
{
T 52600 51100 5 10 0 0 0 0 1
footprint=anchor
T 52600 50900 5 10 0 0 0 0 1
device=INPUT
T 52600 50600 5 10 1 1 0 6 1
refdes=Vdd
}
C 52600 48200 1 0 0 in-1.sym
{
T 52600 48700 5 10 0 0 0 0 1
footprint=anchor
T 52600 48500 5 10 0 0 0 0 1
device=INPUT
T 52600 48200 5 10 1 1 0 6 1
refdes=GND
}
C 49900 49000 1 0 0 in-1.sym
{
T 49900 49500 5 10 0 0 0 0 1
footprint=anchor
T 49900 49300 5 10 0 0 0 0 1
device=INPUT
T 50000 48900 5 10 1 1 0 0 1
refdes=BV
}
C 50100 49300 1 0 0 gnd-1.sym
C 50000 50600 1 0 0 vdd-1.sym
C 50600 49700 1 0 0 vdd-1.sym
C 54000 45600 1 0 1 gnd-1.sym
C 54100 47400 1 0 1 vdd-1.sym
C 49300 45000 1 90 0 resistor-load.sym
{
T 48900 45300 5 10 0 0 90 0 1
device=RESISTOR
T 49000 45700 5 10 1 1 0 0 1
refdes=R
T 49200 45400 5 10 0 1 90 0 1
footprint=0603-boxed
T 49200 45400 5 10 0 1 90 0 1
value=3k3
}
C 49000 45900 1 0 0 vdd-1.sym
C 49600 43800 1 0 1 2n7002.sym
{
T 49375 44100 5 10 1 1 0 7 1
refdes=M?
T 49500 44600 5 10 0 1 0 6 1
value=2N7002P
T 49100 44400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 48100 44400 5 10 0 1 0 6 1
device=NMOS
}
C 49600 44400 1 0 1 2n7002.sym
{
T 49375 44700 5 10 1 1 0 7 1
refdes=M?
T 49500 45200 5 10 0 1 0 6 1
value=2N7002P
T 49100 45000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 48100 45000 5 10 0 1 0 6 1
device=NMOS
}
N 49200 44900 49200 45000 4
N 49200 44500 49200 44300 4
C 49100 43600 1 0 0 gnd-1.sym
C 50200 44000 1 0 1 in-1.sym
{
T 50200 44500 5 10 0 0 0 6 1
footprint=anchor
T 50200 44300 5 10 0 0 0 6 1
device=INPUT
T 50100 43900 5 10 1 1 0 6 1
refdes=VK
}
C 50200 44600 1 0 1 in-1.sym
{
T 50200 45100 5 10 0 0 0 6 1
footprint=anchor
T 50200 44900 5 10 0 0 0 6 1
device=INPUT
T 50100 44500 5 10 1 1 0 6 1
refdes=K#
}
N 49000 44900 49000 45000 4
C 50500 48700 1 0 0 nand.sym
{
T 50900 49200 5 10 1 1 0 4 1
refdes=S?
}
N 51300 49200 51300 49700 4
C 50900 44400 1 0 1 gnd-1.sym
C 50600 45300 1 0 0 vdd-1.sym
C 51100 45000 1 0 0 out-1.sym
{
T 51100 45500 5 10 0 0 0 0 1
footprint=anchor
T 51100 45300 5 10 0 0 0 0 1
device=OUTPUT
T 51300 45100 5 10 1 1 0 0 1
refdes=V
}
C 51100 44800 1 0 0 out-1.sym
{
T 51100 45300 5 10 0 0 0 0 1
footprint=anchor
T 51100 45100 5 10 0 0 0 0 1
device=OUTPUT
T 51300 44700 5 10 1 1 0 0 1
refdes=V#
}
C 52800 44800 1 0 1 gnd-1.sym
C 52800 46900 1 0 1 gnd-1.sym
C 50400 44700 1 0 0 noverlap.sym
{
T 50700 45000 5 10 1 1 0 3 1
refdes=I
}
N 50500 49300 49400 49300 4
N 49400 49300 49400 45000 4
C 53100 47100 1 0 1 2n7002.sym
{
T 52875 47400 5 10 1 1 0 7 1
refdes=M?
T 53000 47900 5 10 0 1 0 6 1
value=2N7002P
T 52600 47700 5 10 0 1 0 6 1
footprint=sot23-nmos
T 51600 47700 5 10 0 1 0 6 1
device=NMOS
}
C 53100 45000 1 0 1 2n7002.sym
{
T 52875 45300 5 10 1 1 0 7 1
refdes=M?
T 53000 45800 5 10 0 1 0 6 1
value=2N7002P
T 52600 45600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 51600 45600 5 10 0 1 0 6 1
device=NMOS
}
N 52700 47600 48600 47600 4
N 52700 45500 52500 45500 4
C 54700 45900 1 0 1 vdilatch.sym
{
T 53350 46300 5 10 1 1 0 0 1
refdes=L
T 53900 46600 5 10 1 1 0 4 1
source=vdilatch.sch
}
C 54600 45800 1 270 1 in-1.sym
{
T 55100 45800 5 10 0 0 270 6 1
footprint=anchor
T 54900 45800 5 10 0 0 90 2 1
device=INPUT
T 54700 45800 5 10 1 1 0 5 1
refdes=Phi
}
N 54000 49800 54700 49800 4
N 54700 49800 54700 47000 4
C 49600 49600 1 0 0 nand1or.sym
{
T 50150 50050 5 10 1 1 0 0 1
refdes=S?
}
