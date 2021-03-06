v 20201216 2
C 3100 3600 1 270 0 in-1.sym
{
T 3600 3600 5 10 0 0 270 0 1
footprint=anchor
T 3400 3600 5 10 0 0 270 0 1
device=INPUT
T 3200 3600 5 10 1 1 0 3 1
refdes=Vdd
}
C 1800 2400 1 0 0 pmos-switch.sym
{
T 2000 2700 5 8 1 1 0 1 1
refdes=M8
T 1900 3200 5 10 0 1 0 0 1
value=PMOS_switch
T 2300 3000 5 10 0 1 0 0 1
footprint=sot23-pmos
T 3300 3000 5 10 0 1 0 0 1
device=PMOS
}
C 4600 2400 1 0 1 pmos-switch.sym
{
T 4400 2700 5 8 1 1 0 7 1
refdes=M9
T 4500 3200 5 10 0 1 0 6 1
value=PMOS_switch
T 4100 3000 5 10 0 1 0 6 1
footprint=sot23-pmos
T 3100 3000 5 10 0 1 0 6 1
device=PMOS
}
N 2200 2900 2200 3000 4
N 2200 3000 4200 3000 4
N 4200 3000 4200 2900 4
N 2200 2200 2200 2500 4
N 4200 2200 4200 2500 4
C 600 1700 1 0 0 pmos-switch.sym
{
T 700 2500 5 10 0 1 0 0 1
value=PMOS_switch
T 1100 2300 5 10 0 1 0 0 1
footprint=sot23-pmos
T 2100 2300 5 10 0 1 0 0 1
device=PMOS
T 800 2000 5 8 1 1 0 1 1
refdes=M10
}
N 1000 1800 1000 1500 4
C 2600 1700 1 0 1 pmos-switch.sym
{
T 2500 2500 5 10 0 1 0 6 1
value=PMOS_switch
T 2100 2300 5 10 0 1 0 6 1
footprint=sot23-pmos
T 1100 2300 5 10 0 1 0 6 1
device=PMOS
T 2400 2000 5 8 1 1 0 7 1
refdes=M11
}
N 2200 1800 2200 1500 4
N 2200 2300 1000 2300 4
{
T 1600 2250 5 6 1 1 0 5 1
netname=f0
}
N 1000 2300 1000 2200 4
C 3800 1700 1 0 0 pmos-switch.sym
{
T 3900 2500 5 10 0 1 0 0 1
value=PMOS_switch
T 4300 2300 5 10 0 1 0 0 1
footprint=sot23-pmos
T 5300 2300 5 10 0 1 0 0 1
device=PMOS
T 4000 2000 5 8 1 1 0 1 1
refdes=M12
}
N 4200 1800 4200 1500 4
C 5800 1700 1 0 1 pmos-switch.sym
{
T 5700 2500 5 10 0 1 0 6 1
value=PMOS_switch
T 5300 2300 5 10 0 1 0 6 1
footprint=sot23-pmos
T 4300 2300 5 10 0 1 0 6 1
device=PMOS
T 5600 2000 5 8 1 1 0 7 1
refdes=M13
}
N 5400 1800 5400 1500 4
N 5400 2300 4200 2300 4
{
T 4800 2250 5 6 1 1 0 5 1
netname=f1
}
N 5400 2300 5400 2200 4
C 200 1000 1 0 0 pmos-switch.sym
{
T 300 1800 5 10 0 1 0 0 1
value=PMOS_switch
T 700 1600 5 10 0 1 0 0 1
footprint=sot23-pmos
T 1700 1600 5 10 0 1 0 0 1
device=PMOS
T 400 1300 5 8 1 1 0 1 1
refdes=M0
}
N 200 1100 200 1300 4
{
T 200 1050 5 10 1 1 180 3 1
netname=A0
}
C 1400 1000 1 0 1 pmos-switch.sym
{
T 1300 1800 5 10 0 1 0 6 1
value=PMOS_switch
T 900 1600 5 10 0 1 0 6 1
footprint=sot23-pmos
T -100 1600 5 10 0 1 0 6 1
device=PMOS
T 1200 1300 5 8 1 1 0 7 1
refdes=M1
}
N 1000 1600 600 1600 4
{
T 800 1550 5 6 1 1 0 5 1
netname=g0
}
N 600 1600 600 1500 4
N 1400 1100 1400 1300 4
{
T 1400 1050 5 10 1 1 180 3 1
netname=A0#
}
C 1800 1000 1 0 0 pmos-switch.sym
{
T 1900 1800 5 10 0 1 0 0 1
value=PMOS_switch
T 2300 1600 5 10 0 1 0 0 1
footprint=sot23-pmos
T 3300 1600 5 10 0 1 0 0 1
device=PMOS
T 2000 1300 5 8 1 1 0 1 1
refdes=M2
}
N 1800 1100 1800 1300 4
{
T 1800 1050 5 10 1 1 180 3 1
netname=A0
}
C 3000 1000 1 0 1 pmos-switch.sym
{
T 2900 1800 5 10 0 1 0 6 1
value=PMOS_switch
T 2500 1600 5 10 0 1 0 6 1
footprint=sot23-pmos
T 1500 1600 5 10 0 1 0 6 1
device=PMOS
T 2800 1300 5 8 1 1 0 7 1
refdes=M3
}
N 2600 1600 2200 1600 4
{
T 2400 1550 5 6 1 1 0 5 1
netname=g1
}
N 3000 1100 3000 1300 4
{
T 3000 1050 5 10 1 1 180 3 1
netname=A0#
}
N 2600 1600 2600 1500 4
C 3400 1000 1 0 0 pmos-switch.sym
{
T 3500 1800 5 10 0 1 0 0 1
value=PMOS_switch
T 3900 1600 5 10 0 1 0 0 1
footprint=sot23-pmos
T 4900 1600 5 10 0 1 0 0 1
device=PMOS
T 3600 1300 5 8 1 1 0 1 1
refdes=M4
}
N 3400 1100 3400 1300 4
{
T 3400 1050 5 10 1 1 180 3 1
netname=A1
}
C 4600 1000 1 0 1 pmos-switch.sym
{
T 4500 1800 5 10 0 1 0 6 1
value=PMOS_switch
T 4100 1600 5 10 0 1 0 6 1
footprint=sot23-pmos
T 3100 1600 5 10 0 1 0 6 1
device=PMOS
T 4400 1300 5 8 1 1 0 7 1
refdes=M6
}
N 4200 1600 3800 1600 4
{
T 4000 1550 5 6 1 1 0 5 1
netname=g2
}
N 3800 1600 3800 1500 4
N 4600 1100 4600 1300 4
{
T 4600 1050 5 10 1 1 180 3 1
netname=A1#
}
C 5000 1000 1 0 0 pmos-switch.sym
{
T 5100 1800 5 10 0 1 0 0 1
value=PMOS_switch
T 5500 1600 5 10 0 1 0 0 1
footprint=sot23-pmos
T 6500 1600 5 10 0 1 0 0 1
device=PMOS
T 5200 1300 5 8 1 1 0 1 1
refdes=M5
}
N 5000 1100 5000 1300 4
{
T 5000 1050 5 10 1 1 180 3 1
netname=A1
}
C 6200 1000 1 0 1 pmos-switch.sym
{
T 6100 1800 5 10 0 1 0 6 1
value=PMOS_switch
T 5700 1600 5 10 0 1 0 6 1
footprint=sot23-pmos
T 4700 1600 5 10 0 1 0 6 1
device=PMOS
T 6000 1300 5 8 1 1 0 7 1
refdes=M7
}
N 5800 1600 5400 1600 4
{
T 5600 1550 5 6 1 1 0 5 1
netname=g3
}
N 6200 1100 6200 1300 4
{
T 6200 1050 5 10 1 1 180 3 1
netname=A1#
}
N 5800 1600 5800 1500 4
N 400 2000 600 2000 4
{
T 350 2000 5 10 1 1 0 7 1
netname=A1
}
N 2800 2000 2600 2000 4
{
T 2850 2000 5 10 1 1 0 1 1
netname=A1#
}
N 3600 2000 3800 2000 4
{
T 3550 2000 5 10 1 1 0 7 1
netname=A0
}
N 6000 2000 5800 2000 4
{
T 6050 2000 5 10 1 1 0 1 1
netname=A0#
}
N 1000 900 1000 1100 4
N 2200 900 2200 1100 4
N 2600 900 2600 1100 4
N 3800 900 3800 1100 4
N 4200 900 4200 1100 4
N 5400 900 5400 1100 4
N 5800 900 5800 1100 4
C 500 900 1 270 0 out-1.sym
{
T 1000 900 5 10 0 0 270 0 1
footprint=anchor
T 800 900 5 10 0 0 270 0 1
device=OUTPUT
T 600 300 5 10 1 1 180 3 1
refdes=H0
}
C 900 900 1 270 0 out-1.sym
{
T 1400 900 5 10 0 0 270 0 1
footprint=anchor
T 1200 900 5 10 0 0 270 0 1
device=OUTPUT
T 1000 300 5 10 1 1 180 3 1
refdes=H1
}
C 2100 900 1 270 0 out-1.sym
{
T 2600 900 5 10 0 0 270 0 1
footprint=anchor
T 2400 900 5 10 0 0 270 0 1
device=OUTPUT
T 2200 300 5 10 1 1 180 3 1
refdes=H2
}
C 2500 900 1 270 0 out-1.sym
{
T 3000 900 5 10 0 0 270 0 1
footprint=anchor
T 2800 900 5 10 0 0 270 0 1
device=OUTPUT
T 2600 300 5 10 1 1 180 3 1
refdes=H3
}
C 3700 900 1 270 0 out-1.sym
{
T 4200 900 5 10 0 0 270 0 1
footprint=anchor
T 4000 900 5 10 0 0 270 0 1
device=OUTPUT
T 3800 300 5 10 1 1 180 3 1
refdes=H4
}
C 4100 900 1 270 0 out-1.sym
{
T 4600 900 5 10 0 0 270 0 1
footprint=anchor
T 4400 900 5 10 0 0 270 0 1
device=OUTPUT
T 4200 300 5 10 1 1 180 3 1
refdes=H6
}
C 5300 900 1 270 0 out-1.sym
{
T 5800 900 5 10 0 0 270 0 1
footprint=anchor
T 5600 900 5 10 0 0 270 0 1
device=OUTPUT
T 5400 300 5 10 1 1 180 3 1
refdes=H5
}
C 5700 900 1 270 0 out-1.sym
{
T 6200 900 5 10 0 0 270 0 1
footprint=anchor
T 6000 900 5 10 0 0 270 0 1
device=OUTPUT
T 5800 300 5 10 1 1 180 3 1
refdes=H7
}
N 600 900 600 1100 4
C 1200 2600 1 0 0 in-1.sym
{
T 1200 3100 5 10 0 0 0 0 1
footprint=anchor
T 1200 2900 5 10 0 0 0 0 1
device=INPUT
T 1200 2700 5 10 1 1 0 7 1
refdes=A2
}
C 5200 2600 1 0 1 in-1.sym
{
T 5200 3100 5 10 0 0 0 6 1
footprint=anchor
T 5200 2900 5 10 0 0 0 6 1
device=INPUT
T 5200 2700 5 10 1 1 0 1 1
refdes=A2#
}
C 700 3400 1 0 0 in-1.sym
{
T 700 3900 5 10 0 0 0 0 1
footprint=anchor
T 700 3700 5 10 0 0 0 0 1
device=INPUT
T 700 3500 5 10 1 1 0 7 1
refdes=A0
}
C 5700 3400 1 0 1 in-1.sym
{
T 5700 3900 5 10 0 0 0 6 1
footprint=anchor
T 5700 3700 5 10 0 0 0 6 1
device=INPUT
T 5700 3500 5 10 1 1 0 1 1
refdes=A1
}
C 700 3200 1 0 0 in-1.sym
{
T 700 3700 5 10 0 0 0 0 1
footprint=anchor
T 700 3500 5 10 0 0 0 0 1
device=INPUT
T 700 3300 5 10 1 1 0 7 1
refdes=A0#
}
C 5700 3200 1 0 1 in-1.sym
{
T 5700 3700 5 10 0 0 0 6 1
footprint=anchor
T 5700 3500 5 10 0 0 0 6 1
device=INPUT
T 5700 3300 5 10 1 1 0 1 1
refdes=A1#
}
N 4900 3500 5100 3500 4
{
T 4850 3500 5 10 1 1 0 7 1
netname=A1
}
N 1500 3500 1300 3500 4
{
T 1550 3500 5 10 1 1 0 1 1
netname=A0
}
N 4900 3300 5100 3300 4
{
T 4850 3300 5 10 1 1 0 7 1
netname=A1#
}
N 1500 3300 1300 3300 4
{
T 1550 3300 5 10 1 1 0 1 1
netname=A0#
}
