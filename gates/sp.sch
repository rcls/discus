v 20220529 2
C 1300 400 1 0 0 dpflipflop.sym
{
T 2650 800 5 10 1 1 0 7 1
refdes=F0
T 2100 1050 5 8 1 1 0 4 1
source=dpflipflop.sch
}
C 4400 400 1 0 0 dpflipflop.sym
{
T 5750 800 5 10 1 1 0 7 1
refdes=F1
T 5200 1050 5 8 1 1 0 4 1
source=dpflipflop.sch
}
C 700 2300 1 0 0 in-1.sym
{
T 700 2800 5 10 0 0 0 0 1
footprint=anchor
T 700 2350 5 10 1 1 0 6 1
refdes=Pop
T 700 2600 5 10 0 0 0 0 1
device=INPUT
}
N 2400 3000 2600 3000 4
{
T 2500 3050 5 10 1 1 0 3 1
netname=Q0
}
C 700 3800 1 0 0 in-1.sym
{
T 700 4300 5 10 0 0 0 0 1
footprint=anchor
T 700 3850 5 10 1 1 0 6 1
refdes=Push#
T 700 4100 5 10 0 0 0 0 1
device=INPUT
}
N 5500 3000 5700 3000 4
{
T 5600 3050 5 10 1 1 0 3 1
netname=Q1
}
C 2000 2300 1 0 0 gnd-1.sym
C 2000 3800 1 0 0 gnd-1.sym
C 5100 3800 1 0 0 gnd-1.sym
C 2200 100 1 0 1 gnd-1.sym
C 5300 100 1 0 1 gnd-1.sym
C 5400 1900 1 0 1 vdd-1.sym
C 2300 1900 1 0 1 vdd-1.sym
C 1900 3400 1 0 0 vdd-1.sym
C 5000 3400 1 0 0 vdd-1.sym
C 1900 4900 1 0 0 vdd-1.sym
C 5000 4900 1 0 0 vdd-1.sym
C 700 800 1 0 0 in-1.sym
{
T 700 1300 5 10 0 0 0 0 1
footprint=anchor
T 700 1100 5 10 0 0 0 0 1
device=INPUT
T 700 900 5 10 1 1 0 7 1
refdes=ϕ
}
C 9000 2300 1 0 0 out-1.sym
{
T 9000 2600 5 10 0 0 0 0 1
device=OUTPUT
T 9150 2450 5 10 1 1 0 0 1
refdes=S0
T 9000 2800 5 10 0 0 0 0 1
footprint=anchor
}
C 9000 2100 1 0 0 out-1.sym
{
T 9000 2400 5 10 0 0 0 0 1
device=OUTPUT
T 9150 2250 5 10 1 1 0 0 1
refdes=S1
T 9000 2600 5 10 0 0 0 0 1
footprint=anchor
}
C 9000 1700 1 0 0 out-1.sym
{
T 9000 2000 5 10 0 0 0 0 1
device=OUTPUT
T 9150 1850 5 10 1 1 0 0 1
refdes=S2
T 9000 2200 5 10 0 0 0 0 1
footprint=anchor
}
C 9000 1900 1 0 0 out-1.sym
{
T 9000 2200 5 10 0 0 0 0 1
device=OUTPUT
T 9150 2050 5 10 1 1 0 0 1
refdes=S3
T 9000 2400 5 10 0 0 0 0 1
footprint=anchor
}
N 2900 1300 3100 1300 4
{
T 3150 1300 5 10 1 1 0 1 1
netname=P0#
}
N 2900 1500 3100 1500 4
{
T 3150 1500 5 10 1 1 0 1 1
netname=P0
}
N 6000 1300 6200 1300 4
{
T 6250 1300 5 10 1 1 0 1 1
netname=P1#
}
N 6000 1500 6200 1500 4
{
T 6250 1500 5 10 1 1 0 1 1
netname=P1
}
C 4800 2600 1 0 0 selis.sym
{
T 5025 3000 5 10 1 1 0 1 1
refdes=L1
}
N 1300 2400 5000 2400 4
N 5000 2400 5000 2600 4
N 1900 2600 1900 2400 4
N 1300 3900 5000 3900 4
N 5000 3900 5000 4100 4
N 1900 4100 1900 3900 4
C 5100 2300 1 0 0 gnd-1.sym
N 2400 4500 2600 4500 4
{
T 2650 4500 5 10 1 1 0 1 1
netname=R0
}
N 5500 4500 5700 4500 4
{
T 5750 4500 5 10 1 1 0 1 1
netname=R1
}
N 1700 3100 1500 3100 4
{
T 1450 3100 5 10 1 1 0 7 1
netname=P0#
}
N 4800 2900 4600 2900 4
{
T 4550 2900 5 10 1 1 0 7 1
netname=P0
}
N 4800 3100 4600 3100 4
{
T 4550 3100 5 10 1 1 0 7 1
netname=P1#
}
N 1700 2900 1500 2900 4
{
T 1450 2900 5 10 1 1 0 7 1
netname=P1#
}
N 1700 4400 1500 4400 4
{
T 1450 4400 5 10 1 1 0 7 1
netname=Q0#
}
N 4800 4600 4600 4600 4
{
T 4550 4600 5 10 1 1 0 7 1
netname=Q0#
}
N 4800 4400 4600 4400 4
{
T 4550 4400 5 10 1 1 0 7 1
netname=Q1#
}
N 1700 4600 1500 4600 4
{
T 1450 4600 5 10 1 1 0 7 1
netname=Q1
}
C 4800 4100 1 0 0 seli.sym
{
T 5025 4500 5 10 1 1 0 1 1
refdes=U1
}
C 1700 4100 1 0 0 seli.sym
{
T 1925 4500 5 10 1 1 0 1 1
refdes=U0
}
C 1700 2600 1 0 0 selis.sym
{
T 1925 3000 5 10 1 1 0 1 1
refdes=L0
}
N 1300 1500 1100 1500 4
{
T 1050 1500 5 10 1 1 0 7 1
netname=R0
}
N 4400 1500 4200 1500 4
{
T 4150 1500 5 10 1 1 0 7 1
netname=R1
}
C 2800 3300 1 0 0 vdd-1.sym
C 2900 2400 1 0 0 gnd-1.sym
C 5900 3300 1 0 0 vdd-1.sym
C 6000 2400 1 0 0 gnd-1.sym
C 2600 2700 1 0 0 nots.sym
{
T 2950 3000 5 10 1 1 0 4 1
refdes=N0
}
C 5700 2700 1 0 0 nots.sym
{
T 6050 3000 5 10 1 1 0 4 1
refdes=N1
}
N 3600 3000 3400 3000 4
{
T 3500 3050 5 10 1 1 0 3 1
netname=Q0#
}
N 6700 3000 6500 3000 4
{
T 6600 3050 5 10 1 1 0 3 1
netname=Q1#
}
C 1200 1100 1 270 0 phi.sym
C 4200 800 1 0 0 phi.sym
C 700 1800 1 0 0 in-1.sym
{
T 700 2300 5 10 0 0 0 0 1
footprint=anchor
T 700 2100 5 10 0 0 0 0 1
device=INPUT
T 700 1900 5 10 1 1 0 7 1
refdes=Vdd
}
N 1300 1900 2100 1900 4
C 700 300 1 0 0 in-1.sym
{
T 700 800 5 10 0 0 0 0 1
footprint=anchor
T 700 600 5 10 0 0 0 0 1
device=INPUT
T 700 400 5 10 1 1 0 7 1
refdes=GND
}
N 1300 400 2100 400 4
C 7600 1300 1 0 0 fourpd.sym
{
T 8300 1600 5 8 1 1 0 4 1
source=fourpd.sch
T 8300 2300 5 10 1 1 0 4 1
refdes=D
}
C 8200 1000 1 0 0 gnd-1.sym
N 7400 2400 7600 2400 4
{
T 7350 2400 5 10 1 1 0 7 1
netname=Q0
}
N 7400 2000 7600 2000 4
{
T 7350 2000 5 10 1 1 0 7 1
netname=Q1
}
N 7400 2200 7600 2200 4
{
T 7350 2200 5 10 1 1 0 7 1
netname=Q0#
}
N 7400 1800 7600 1800 4
{
T 7350 1800 5 10 1 1 0 7 1
netname=Q1#
}
N 8300 2800 8500 2800 4
C 8300 3400 1 270 0 in-1.sym
{
T 8800 3400 5 10 0 0 270 0 1
footprint=anchor
T 8600 3400 5 10 0 0 270 0 1
device=INPUT
T 8400 3400 5 10 1 1 0 3 1
refdes=ϕ#
}
