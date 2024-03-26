v 20220529 2
C 2900 5800 1 0 0 in-1.sym
{
T 2900 6300 5 10 0 0 0 0 1
footprint=anchor
T 2900 6100 5 10 0 0 0 0 1
device=INPUT
T 2900 5900 5 10 1 1 0 7 1
refdes=O5
}
C 900 5800 1 0 0 in-1.sym
{
T 900 6300 5 10 0 0 0 0 1
footprint=anchor
T 900 6100 5 10 0 0 0 0 1
device=INPUT
T 900 5900 5 10 1 1 0 7 1
refdes=O2
}
C 900 5600 1 0 0 in-1.sym
{
T 900 6100 5 10 0 0 0 0 1
footprint=anchor
T 900 5900 5 10 0 0 0 0 1
device=INPUT
T 900 5700 5 10 1 1 0 7 1
refdes=O3
}
C 900 5400 1 0 0 in-1.sym
{
T 900 5900 5 10 0 0 0 0 1
footprint=anchor
T 900 5700 5 10 0 0 0 0 1
device=INPUT
T 900 5500 5 10 1 1 0 7 1
refdes=O4
}
C 2900 5600 1 0 0 in-1.sym
{
T 2900 6100 5 10 0 0 0 0 1
footprint=anchor
T 2900 5900 5 10 0 0 0 0 1
device=INPUT
T 2900 5700 5 10 1 1 0 7 1
refdes=O6
}
C 2900 5400 1 0 0 in-1.sym
{
T 2900 5900 5 10 0 0 0 0 1
footprint=anchor
T 2900 5700 5 10 0 0 0 0 1
device=INPUT
T 2900 5500 5 10 1 1 0 7 1
refdes=O7
}
N 1500 5700 1700 5700 4
{
T 1750 5700 5 10 1 1 0 1 1
netname=O3
}
N 4100 8500 4300 8500 4
{
T 4050 8500 5 10 1 1 0 7 1
netname=O6#
}
N 1700 5500 1500 5500 4
{
T 1750 5500 5 10 1 1 0 1 1
netname=O4
}
N 2300 8200 2700 8200 4
{
T 2500 8250 5 10 1 1 0 3 1
netname=Flag
}
N 3500 8100 4300 8100 4
{
T 3650 8075 5 10 1 1 0 2 1
netname=Cond#
}
C 5900 8300 1 0 0 out-1.sym
{
T 5900 8800 5 10 0 0 0 0 1
footprint=anchor
T 5900 8600 5 10 0 0 0 0 1
device=OUTPUT
T 6050 8450 5 10 1 1 0 0 1
refdes=Ret
}
N 4300 7000 4300 8100 4
C 4300 6400 1 0 0 nor.sym
{
T 4700 6900 5 10 1 1 0 4 1
refdes=S5
}
C 5900 6800 1 0 0 out-1.sym
{
T 5900 7300 5 10 0 0 0 0 1
footprint=anchor
T 5900 7100 5 10 0 0 0 0 1
device=OUTPUT
T 5950 6950 5 10 1 1 0 0 1
refdes=Jump
}
C 7100 5800 1 0 0 out-1.sym
{
T 7100 6300 5 10 0 0 0 0 1
footprint=anchor
T 7100 6100 5 10 0 0 0 0 1
device=OUTPUT
T 7700 5900 5 10 1 1 0 1 1
refdes=VPush
}
C 5100 7200 1 0 0 nor.sym
{
T 5500 7700 5 10 1 1 0 4 1
refdes=S6
}
N 5100 8700 5100 7800 4
N 5100 5900 5100 7600 4
C 5900 7600 1 0 0 out-1.sym
{
T 5900 8100 5 10 0 0 0 0 1
footprint=anchor
T 5900 7900 5 10 0 0 0 0 1
device=OUTPUT
T 6050 7750 5 10 1 1 0 0 1
refdes=Inc
}
C 2900 7300 1 0 0 gnd-1.sym
C 4500 6100 1 0 0 gnd-1.sym
C 5300 6900 1 0 0 gnd-1.sym
C 4500 7600 1 0 0 gnd-1.sym
C 1700 8500 1 0 0 vdd-1.sym
C 2800 8600 1 0 0 vdd-1.sym
C 5800 8800 1 0 0 vdd-1.sym
C 5200 8200 1 0 0 vdd-1.sym
C 4400 7400 1 0 0 vdd-1.sym
C 5300 6200 1 0 0 vdd-1.sym
N 5500 5500 5100 5500 4
{
T 5050 5500 5 10 1 1 0 7 1
netname=O5#
}
N 2700 8000 2700 7700 4
{
T 2700 7650 5 10 1 1 0 5 1
netname=O2
}
N 5900 6900 5100 6900 4
N 4100 8300 4300 8300 4
{
T 4050 8300 5 10 1 1 0 7 1
netname=O7
}
N 5900 8400 5100 8400 4
C 6600 5300 1 0 0 gnd-1.sym
C 900 4900 1 0 0 in-1.sym
{
T 900 5400 5 10 0 0 0 0 1
footprint=anchor
T 900 5200 5 10 0 0 0 0 1
device=INPUT
T 900 5000 5 10 1 1 0 7 1
refdes=Vdd
}
C 900 4700 1 0 0 in-1.sym
{
T 900 5200 5 10 0 0 0 0 1
footprint=anchor
T 900 5000 5 10 0 0 0 0 1
device=INPUT
T 900 4800 5 10 1 1 0 7 1
refdes=GND
}
C 1300 5000 1 0 0 vdd-1.sym
C 1400 4500 1 0 0 gnd-1.sym
N 4100 8700 4300 8700 4
{
T 4050 8700 5 10 1 1 0 7 1
netname=O5#
}
N 1500 5900 1700 5900 4
{
T 1750 5900 5 10 1 1 0 1 1
netname=O2
}
N 3500 5900 3700 5900 4
{
T 3750 5900 5 10 1 1 0 1 1
netname=O5
}
N 3500 5700 3700 5700 4
{
T 3750 5700 5 10 1 1 0 1 1
netname=O6
}
N 3500 5500 3700 5500 4
{
T 3750 5500 5 10 1 1 0 1 1
netname=O7
}
C 1700 6000 1 0 0 gnd-1.sym
T 5400 6700 9 10 1 0 0 0 1
(includes call)
C 900 3700 1 0 0 in-1.sym
{
T 900 4000 5 10 0 0 0 0 1
device=INPUT
T 900 4200 5 10 0 0 0 0 1
footprint=anchor
T 900 3800 5 10 1 1 0 7 1
refdes=I3#
}
C 900 3900 1 0 0 in-1.sym
{
T 900 4200 5 10 0 0 0 0 1
device=INPUT
T 900 4400 5 10 0 0 0 0 1
footprint=anchor
T 900 4000 5 10 1 1 0 7 1
refdes=I3
}
C 900 3300 1 0 0 in-1.sym
{
T 900 3600 5 10 0 0 0 0 1
device=INPUT
T 900 3400 5 10 1 1 0 7 1
refdes=I4#
T 900 3800 5 10 0 0 0 0 1
footprint=anchor
}
C 900 3500 1 0 0 in-1.sym
{
T 900 3800 5 10 0 0 0 0 1
device=INPUT
T 900 3600 5 10 1 1 0 7 1
refdes=I4
T 900 4000 5 10 0 0 0 0 1
footprint=anchor
}
C 900 3100 1 0 0 in-1.sym
{
T 900 3400 5 10 0 0 0 0 1
device=INPUT
T 900 3600 5 10 0 0 0 0 1
footprint=anchor
T 900 3200 5 10 1 1 0 7 1
refdes=I5
}
C 900 2900 1 0 0 in-1.sym
{
T 900 3200 5 10 0 0 0 0 1
device=INPUT
T 900 3400 5 10 0 0 0 0 1
footprint=anchor
T 900 3000 5 10 1 1 0 7 1
refdes=I5#
}
C 900 2700 1 0 0 in-1.sym
{
T 900 3000 5 10 0 0 0 0 1
device=INPUT
T 900 2800 5 10 1 1 0 7 1
refdes=I6
T 900 3200 5 10 0 0 0 0 1
footprint=anchor
}
C 900 2500 1 0 0 in-1.sym
{
T 900 2800 5 10 0 0 0 0 1
device=INPUT
T 900 2600 5 10 1 1 0 7 1
refdes=I6#
T 900 3000 5 10 0 0 0 0 1
footprint=anchor
}
C 900 2300 1 0 0 in-1.sym
{
T 900 2600 5 10 0 0 0 0 1
device=INPUT
T 900 2800 5 10 0 0 0 0 1
footprint=anchor
T 900 2400 5 10 1 1 0 7 1
refdes=I7
}
C 900 2100 1 0 0 in-1.sym
{
T 900 2400 5 10 0 0 0 0 1
device=INPUT
T 900 2600 5 10 0 0 0 0 1
footprint=anchor
T 900 2200 5 10 1 1 0 7 1
refdes=I7#
}
N 1500 3800 1700 3800 4
{
T 1750 3800 5 10 1 1 0 1 1
netname=I3#
}
N 1500 4000 1700 4000 4
{
T 1750 4000 5 10 1 1 0 1 1
netname=I3
}
N 1500 3400 1700 3400 4
{
T 1750 3400 5 10 1 1 0 1 1
netname=I4#
}
N 1500 3600 1700 3600 4
{
T 1750 3600 5 10 1 1 0 1 1
netname=I4
}
N 1500 3200 1700 3200 4
{
T 1750 3200 5 10 1 1 0 1 1
netname=I5
}
N 1500 3000 1700 3000 4
{
T 1750 3000 5 10 1 1 0 1 1
netname=I5#
}
N 1500 2800 1700 2800 4
{
T 1750 2800 5 10 1 1 0 1 1
netname=I6
}
N 1500 2600 1700 2600 4
{
T 1750 2600 5 10 1 1 0 1 1
netname=I6#
}
N 1500 2400 1700 2400 4
{
T 1750 2400 5 10 1 1 0 1 1
netname=I7
}
N 1500 2200 1700 2200 4
{
T 1750 2200 5 10 1 1 0 1 1
netname=I7#
}
C 11400 4400 1 0 0 out-1.sym
{
T 11400 4700 5 10 0 0 0 0 1
device=OUTPUT
T 12000 4500 5 10 1 1 0 1 1
refdes=AND
T 11400 4900 5 10 0 0 0 0 1
footprint=anchor
}
C 14200 7900 1 0 0 out-1.sym
{
T 14200 8200 5 10 0 0 0 0 1
device=OUTPUT
T 14200 8400 5 10 0 0 0 0 1
footprint=anchor
T 14800 8000 5 10 1 1 0 1 1
refdes=AS
}
N 13200 8100 13400 8100 4
{
T 13150 8100 5 10 1 1 0 7 1
netname=I2#
}
N 13400 7900 13200 7900 4
{
T 13150 7900 5 10 1 1 0 7 1
netname=I6#
}
C 13600 7200 1 0 0 gnd-1.sym
C 13500 8500 1 0 0 vdd-1.sym
C 11400 7900 1 0 0 out-1.sym
{
T 11400 8200 5 10 0 0 0 0 1
device=OUTPUT
T 11400 8400 5 10 0 0 0 0 1
footprint=anchor
T 12000 8000 5 10 1 1 0 1 1
refdes=AR#
}
C 14000 2200 1 0 0 out-1.sym
{
T 14000 2500 5 10 0 0 0 0 1
device=OUTPUT
T 14000 2700 5 10 0 0 0 0 1
footprint=anchor
T 14600 2300 5 10 1 1 0 1 1
refdes=N#
}
C 15100 2600 1 0 1 vdd-1.sym
N 13200 2400 13000 2400 4
{
T 12950 2400 5 10 1 1 0 7 1
netname=I2
}
N 13200 2200 13000 2200 4
{
T 12950 2200 5 10 1 1 0 7 1
netname=I3#
}
N 10600 5100 10600 4500 4
C 10900 4500 1 0 0 gnd-1.sym
C 10800 5400 1 0 0 vdd-1.sym
C 11400 5000 1 0 0 out-1.sym
{
T 11400 5300 5 10 0 0 0 0 1
device=OUTPUT
T 12000 5100 5 10 1 1 0 1 1
refdes=CS#
T 11400 5500 5 10 0 0 0 0 1
footprint=anchor
}
C 10600 7700 1 0 0 cnot.sym
{
T 10925 8000 5 10 1 1 0 4 1
refdes=N4
}
C 10900 7400 1 0 0 gnd-1.sym
C 10800 8300 1 0 0 vdd-1.sym
N 11400 4500 10600 4500 4
C 900 4100 1 0 0 in-1.sym
{
T 900 4400 5 10 0 0 0 0 1
device=INPUT
T 900 4600 5 10 0 0 0 0 1
footprint=anchor
T 900 4200 5 10 1 1 0 7 1
refdes=I2#
}
C 900 4300 1 0 0 in-1.sym
{
T 900 4600 5 10 0 0 0 0 1
device=INPUT
T 900 4800 5 10 0 0 0 0 1
footprint=anchor
T 900 4400 5 10 1 1 0 7 1
refdes=I2
}
N 1500 4200 1700 4200 4
{
T 1750 4200 5 10 1 1 0 1 1
netname=I2#
}
N 1500 4400 1700 4400 4
{
T 1750 4400 5 10 1 1 0 1 1
netname=I2
}
C 10600 4800 1 0 0 cnot.sym
{
T 10925 5100 5 10 1 1 0 4 1
refdes=N7
}
C 3900 4500 1 180 1 out-1.sym
{
T 3900 4200 5 10 0 0 0 2 1
device=OUTPUT
T 3900 4000 5 10 0 0 0 2 1
footprint=anchor
T 4500 4400 5 10 1 1 0 1 1
refdes=OUT
}
N 9700 7900 9500 7900 4
{
T 9450 7900 5 10 1 1 0 7 1
netname=I6#
}
N 9700 8100 9500 8100 4
{
T 9450 8100 5 10 1 1 0 7 1
netname=I2
}
C 9800 8500 1 0 0 vdd-1.sym
C 9900 7200 1 0 0 gnd-1.sym
C 7600 8200 1 0 0 not.sym
{
T 7950 8500 5 10 1 1 0 4 1
refdes=N1
}
C 7800 8800 1 0 0 vdd-1.sym
C 8100 7900 1 0 1 gnd-1.sym
C 7600 7300 1 0 0 not.sym
{
T 7950 7600 5 10 1 1 0 4 1
refdes=N2
}
C 7800 7900 1 0 0 vdd-1.sym
C 8100 7000 1 0 1 gnd-1.sym
C 7600 6400 1 0 0 not.sym
{
T 7950 6700 5 10 1 1 0 4 1
refdes=N3
}
C 7800 7000 1 0 0 vdd-1.sym
C 8100 6100 1 0 1 gnd-1.sym
N 8400 8500 8600 8500 4
{
T 8400 8550 5 10 1 1 0 0 1
netname=O3#
}
N 8600 7600 8400 7600 4
{
T 8400 7650 5 10 1 1 0 0 1
netname=O5#
}
N 8400 6700 8600 6700 4
{
T 8400 6750 5 10 1 1 0 0 1
netname=O6#
}
N 9800 4600 9600 4600 4
{
T 9550 4600 5 10 1 1 0 7 1
netname=I2#
}
N 9800 4400 9600 4400 4
{
T 9550 4400 5 10 1 1 0 7 1
netname=I3#
}
C 10200 3700 1 0 1 gnd-1.sym
N 13300 3600 13100 3600 4
{
T 13050 3600 5 10 1 1 0 7 1
netname=I2oi3
}
C 13500 3900 1 0 0 vdd-1.sym
C 13800 3000 1 0 1 gnd-1.sym
C 14200 3500 1 0 0 out-1.sym
{
T 14200 3800 5 10 0 0 0 0 1
device=OUTPUT
T 14200 4000 5 10 0 0 0 0 1
footprint=anchor
T 14800 3600 5 10 1 1 0 1 1
refdes=CR
}
C 9700 7500 1 0 0 nor.sym
{
T 10100 8000 5 10 1 1 0 4 1
refdes=A1
}
C 13400 7500 1 0 0 nor.sym
{
T 13800 8000 5 10 1 1 0 4 1
refdes=A3
}
C 7800 1000 1 0 0 nmos-switch.sym
{
T 8025 1300 5 8 1 1 0 1 1
refdes=M4
T 7900 1800 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 1600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 1600 5 10 0 1 0 0 1
device=NMOS
}
C 9200 400 1 0 1 nmos-switch.sym
{
T 8975 700 5 8 1 1 0 7 1
refdes=M7
T 9100 1200 5 10 0 1 0 6 1
value=NMOS_switch
T 8700 1000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 7700 1000 5 10 0 1 0 6 1
device=NMOS
}
N 7800 1300 7600 1300 4
{
T 7550 1300 5 10 1 1 0 7 1
netname=I4
}
N 9200 700 9400 700 4
{
T 9450 700 5 10 1 1 0 1 1
netname=I6#
}
C 10500 100 1 0 1 gnd-1.sym
N 7800 700 7600 700 4
{
T 7550 700 5 10 1 1 0 7 1
netname=I2#
}
C 10800 1600 1 0 1 nmos-switch.sym
{
T 10700 2400 5 10 0 1 0 6 1
value=NMOS_switch
T 10300 2200 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 2200 5 10 0 1 0 6 1
device=NMOS
T 10575 1900 5 8 1 1 0 7 1
refdes=M8
}
C 9200 1000 1 0 1 nmos-switch.sym
{
T 9100 1800 5 10 0 1 0 6 1
value=NMOS_switch
T 8700 1600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 7700 1600 5 10 0 1 0 6 1
device=NMOS
T 8975 1300 5 8 1 1 0 7 1
refdes=M6
}
C 10800 400 1 0 1 nmos-switch.sym
{
T 10700 1200 5 10 0 1 0 6 1
value=NMOS_switch
T 10300 1000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 1000 5 10 0 1 0 6 1
device=NMOS
T 10575 700 5 8 1 1 0 7 1
refdes=M10
}
C 10800 1000 1 0 1 nmos-switch.sym
{
T 10700 1800 5 10 0 1 0 6 1
value=NMOS_switch
T 10300 1600 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 1600 5 10 0 1 0 6 1
device=NMOS
T 10575 1300 5 8 1 1 0 7 1
refdes=M9
}
N 11000 700 10800 700 4
{
T 11050 700 5 10 1 1 0 1 1
netname=I6#
}
N 9400 1300 9200 1300 4
{
T 9450 1300 5 10 1 1 0 1 1
netname=I6
}
N 10800 1900 11000 1900 4
{
T 11050 1900 5 10 1 1 0 1 1
netname=I2
}
N 10800 1300 11000 1300 4
{
T 11050 1300 5 10 1 1 0 1 1
netname=I4#
}
N 10400 2300 9600 2300 4
N 10400 1100 10400 900 4
{
T 10350 1000 5 6 1 1 0 7 1
netname=_co2
}
C 7800 400 1 0 0 nmos-switch.sym
{
T 7900 1200 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 1000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 1000 5 10 0 1 0 0 1
device=NMOS
T 8025 700 5 8 1 1 0 1 1
refdes=M5
}
N 7600 8500 7400 8500 4
{
T 7350 8500 5 10 1 1 0 7 1
netname=O3
}
N 7600 7600 7400 7600 4
{
T 7350 7600 5 10 1 1 0 7 1
netname=O5
}
N 7600 6700 7400 6700 4
{
T 7350 6700 5 10 1 1 0 7 1
netname=O6
}
N 10400 1500 10400 1700 4
{
T 10350 1600 5 6 1 1 0 7 1
netname=_co3
}
N 9600 2700 8200 2700 4
N 8200 1100 8200 900 4
N 1400 6600 1200 6600 4
{
T 1150 6600 5 10 1 1 0 7 1
netname=O3
}
N 1500 7400 1400 7400 4
{
T 1350 7400 5 10 1 1 0 7 1
netname=O3#
}
N 1500 8200 1300 8200 4
{
T 1250 8200 5 10 1 1 0 7 1
netname=O4
}
N 13500 1800 13000 1800 4
{
T 12950 1800 5 10 1 1 0 7 1
netname=I6
}
B 7100 100 4700 3400 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 2700 7600 1 0 0 xnor.sym
{
T 2900 8225 5 10 1 1 0 0 1
refdes=S3
}
C 900 1700 1 0 0 in-1.sym
{
T 900 1800 5 10 1 1 0 7 1
refdes=ϕ1
T 900 2200 5 10 0 0 0 0 1
footprint=anchor
T 900 2000 5 10 0 0 0 0 1
device=INPUT
}
C 1800 1700 1 0 1 phi1.sym
C 3900 2800 1 0 0 out-1.sym
{
T 3900 3100 5 10 0 0 0 0 1
device=OUTPUT
T 3900 3300 5 10 0 0 0 0 1
footprint=anchor
T 4500 2900 5 10 1 1 0 1 1
refdes=MW
}
C 7200 4300 1 0 0 out-1.sym
{
T 7200 4600 5 10 0 0 0 0 1
device=OUTPUT
T 7200 4800 5 10 0 0 0 0 1
footprint=anchor
T 7800 4400 5 10 1 1 0 1 1
refdes=MR#
}
C 14200 6500 1 180 1 out-1.sym
{
T 14200 6200 5 10 0 0 180 6 1
device=OUTPUT
T 14200 6000 5 10 0 0 180 6 1
footprint=anchor
T 14800 6400 5 10 1 1 180 7 1
refdes=OR
}
C 900 6900 1 0 0 in-1.sym
{
T 900 7200 5 10 0 0 0 0 1
device=INPUT
T 900 7400 5 10 0 0 0 0 1
footprint=anchor
T 900 7000 5 10 1 1 0 7 1
refdes=Z
}
C 3700 6700 1 0 0 in-1.sym
{
T 3700 7200 5 10 0 0 0 0 1
footprint=anchor
T 3700 7000 5 10 0 0 0 0 1
device=INPUT
T 3700 6800 5 10 1 1 0 7 1
refdes=OJump#
}
C 900 1300 1 0 0 in-1.sym
{
T 900 1600 5 10 0 0 0 0 1
device=INPUT
T 900 1800 5 10 0 0 0 0 1
footprint=anchor
T 900 1400 5 10 1 1 0 7 1
refdes=Co
}
N 8800 900 8800 1100 4
N 8800 1500 8800 2200 4
C 7800 1600 1 0 0 nmos-switch.sym
{
T 8025 1900 5 8 1 1 0 1 1
refdes=M3
T 7900 2400 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 2200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 2200 5 10 0 1 0 0 1
device=NMOS
}
C 7800 2200 1 0 0 nmos-switch.sym
{
T 7900 3000 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 2800 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 2800 5 10 0 1 0 0 1
device=NMOS
T 8025 2500 5 8 1 1 0 1 1
refdes=M2
}
N 7600 2500 7800 2500 4
{
T 7550 2500 5 10 1 1 0 7 1
netname=I3#
}
N 8200 2100 8200 2300 4
N 8800 2200 8200 2200 4
{
T 8500 2250 5 6 1 1 0 3 1
netname=_co1
}
C 8100 100 1 0 0 gnd-1.sym
C 8700 100 1 0 0 gnd-1.sym
N 8200 1500 8200 1700 4
{
T 8225 1600 5 6 1 1 0 1 1
netname=_co4
}
C 10400 2200 1 0 0 out-1.sym
{
T 11000 2300 5 14 1 1 0 1 1
refdes=CoE#
T 10400 2700 5 10 0 0 0 0 1
footprint=anchor
T 10400 2500 5 10 0 0 0 0 1
device=OUTPUT
}
N 9600 2300 9600 2700 4
C 10100 2300 1 90 0 resistor-load.sym
{
T 9700 2600 5 10 0 0 90 0 1
device=RESISTOR
T 10000 2700 5 10 0 1 90 0 1
footprint=0603-load
T 10000 2700 5 10 0 1 90 0 1
value=rload
T 9950 2950 5 10 1 1 90 0 1
refdes=R3
}
C 9800 3200 1 0 0 vdd-1.sym
N 10400 2100 10400 2300 4
N 8200 1000 8800 1000 4
{
T 8500 1050 5 6 1 1 0 3 1
netname=_co6
}
B 400 5300 8500 3700 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 8800 5400 9 12 1 0 0 6 1
Branch Control
T 13100 8900 9 12 1 0 0 8 1
Arithmetic Control
L 8900 3500 8900 5400 5 0 1 0 -1 -1
T 8800 5200 9 12 1 0 0 8 1
Misc. Decode
C 6800 6500 1 90 1 phi1.sym
C 6300 5600 1 0 0 notp.sym
{
T 6650 5900 5 10 1 1 0 4 1
refdes=S8
}
N 6300 5900 5900 5900 4
C 6200 5900 1 90 0 out-1.sym
{
T 5700 5900 5 10 0 0 90 0 1
footprint=anchor
T 5900 5900 5 10 0 0 90 0 1
device=OUTPUT
T 6050 5950 5 10 1 1 90 0 1
refdes=Push#
}
B 400 100 15200 8900 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 3100 3900 1 0 0 nor.sym
{
T 3500 4400 5 10 1 1 0 4 1
refdes=L1
}
C 3300 3600 1 0 0 gnd-1.sym
C 3500 5200 1 90 1 phi1.sym
C 5900 5000 1 0 1 vdd-1.sym
N 6600 4400 7200 4400 4
{
T 6900 4425 5 10 1 1 0 3 1
netname=MR#
}
N 13400 6500 13200 6500 4
{
T 13150 6500 5 10 1 1 0 7 1
netname=I2oi3
}
N 13400 6300 13200 6300 4
{
T 13150 6300 5 10 1 1 0 7 1
netname=I4
}
C 13800 5600 1 0 1 gnd-1.sym
C 5100 5600 1 0 0 nots.sym
{
T 5450 5900 5 10 1 1 0 4 1
refdes=S7
}
N 10600 8000 10500 8000 4
{
T 10550 8025 5 8 1 1 0 3 1
netname=AR
}
N 1800 6300 1800 6400 4
C 13200 1800 1 0 0 nandod.sym
{
T 13600 2300 5 10 1 1 0 4 1
refdes=A5
}
C 14900 2500 1 0 1 resistor-strong.sym
{
T 13900 2400 5 10 0 1 0 6 1
footprint=0603-strong
T 14600 2900 5 10 0 0 0 6 1
device=RESISTOR
T 14250 2650 5 10 1 1 0 6 1
refdes=R4
T 14800 2200 5 10 0 1 0 6 1
value=rstrong
}
N 14000 2600 14000 2300 4
C 4300 7900 1 0 0 nor4od.sym
{
T 4700 8400 5 10 1 1 0 4 1
refdes=S4
}
C 6000 8600 1 0 1 resistor-strong.sym
{
T 5000 8500 5 10 0 1 0 6 1
footprint=0603-strong
T 5700 9000 5 10 0 0 0 6 1
device=RESISTOR
T 5350 8750 5 10 1 1 0 6 1
refdes=R1
T 5900 8300 5 10 0 1 0 6 1
value=rstrong
}
N 6000 8800 6000 8700 4
C 9800 4000 1 0 0 nor.sym
{
T 10200 4500 5 10 1 1 0 4 1
refdes=A2
}
C 9900 5000 1 0 0 vdd-1.sym
N 10400 400 10400 500 4
N 8200 400 8200 500 4
N 8800 400 8800 500 4
C 5700 4900 1 0 0 resistor-strong.sym
{
T 6700 4800 5 10 0 1 0 0 1
footprint=0603-strong
T 6000 5300 5 10 0 0 0 0 1
device=RESISTOR
T 6350 5050 5 10 1 1 0 0 1
refdes=R2
T 5800 4600 5 10 0 1 0 0 1
value=rstrong
}
N 6600 4400 6600 5000 4
C 5800 2900 1 0 0 norod.sym
{
T 6200 3400 5 10 1 1 0 4 1
refdes=L6
}
N 5600 2900 6100 2900 4
{
T 5550 2900 5 10 1 1 0 7 1
netname=I6#
}
N 5600 4300 5800 4300 4
{
T 5550 4300 5 10 1 1 0 7 1
netname=I3
}
N 5600 4500 5800 4500 4
{
T 5550 4500 5 10 1 1 0 7 1
netname=I2
}
N 5600 3300 5800 3300 4
{
T 5550 3300 5 10 1 1 0 7 1
netname=I7
}
N 5600 3500 5800 3500 4
{
T 5550 3500 5 10 1 1 0 7 1
netname=I5#
}
N 2400 300 2900 300 4
{
T 2350 300 5 10 1 1 0 7 1
netname=I7
}
N 2400 700 2600 700 4
{
T 2350 700 5 10 1 1 0 7 1
netname=I6
}
N 2400 900 2600 900 4
{
T 2350 900 5 10 1 1 0 7 1
netname=I5#
}
N 3400 800 5300 800 4
{
T 4300 825 5 8 1 1 0 3 1
netname=Misc#
}
N 3400 1300 3400 800 4
C 2600 300 1 0 0 nandod.sym
{
T 3000 800 5 10 1 1 0 4 1
refdes=L5
}
N 2800 1600 3000 1600 4
{
T 2750 1600 5 10 1 1 0 7 1
netname=I4#
}
C 3200 1900 1 0 0 vdd-1.sym
C 5700 2000 1 0 0 out-1.sym
{
T 5700 2300 5 10 0 0 0 0 1
device=OUTPUT
T 5700 2500 5 10 0 0 0 0 1
footprint=anchor
T 6300 2100 5 10 1 1 0 1 1
refdes=IN#
}
N 4700 2100 4900 2100 4
{
T 4650 2100 5 10 1 1 0 7 1
netname=I3#
}
N 4700 1200 4900 1200 4
{
T 4650 1200 5 10 1 1 0 7 1
netname=I4
}
C 5100 1500 1 0 0 vdd-1.sym
N 3800 1600 4000 1600 4
{
T 4050 1600 5 10 1 1 0 1 1
netname=SO#
}
N 2900 4300 3100 4300 4
{
T 2850 4300 5 10 1 1 0 7 1
netname=SO#
}
N 2900 4500 3100 4500 4
{
T 2850 4500 5 10 1 1 0 7 1
netname=I3
}
C 3400 2300 1 0 0 gnd-1.sym
N 2900 2900 3100 2900 4
{
T 2850 2900 5 10 1 1 0 7 1
netname=SO#
}
N 2900 3200 3500 3200 4
{
T 2850 3200 5 10 1 1 0 7 1
netname=I3
}
N 6100 3900 6600 3900 4
N 6600 3900 6600 3400 4
{
T 6650 3650 5 8 1 1 270 3 1
netname=_msc
}
C 4900 900 1 0 0 not.sym
{
T 5250 1200 5 10 1 1 0 4 1
refdes=L8
}
C 4900 1800 1 0 0 not.sym
{
T 5250 2100 5 10 1 1 0 4 1
refdes=L7
}
C 5100 2400 1 0 0 vdd-1.sym
N 5300 1800 5700 1800 4
N 5700 1800 5700 1200 4
C 5700 1100 1 0 0 out-1.sym
{
T 5700 1400 5 10 0 0 0 0 1
device=OUTPUT
T 5700 1600 5 10 0 0 0 0 1
footprint=anchor
T 6300 1200 5 10 1 1 0 1 1
refdes=MPre#
}
N 1500 1400 1700 1400 4
{
T 1750 1400 5 10 1 1 0 1 1
netname=Co
}
N 7600 1900 7800 1900 4
{
T 7550 1900 5 10 1 1 0 7 1
netname=Co
}
C 1500 7900 1 0 0 nots.sym
{
T 1850 8200 5 10 1 1 0 4 1
refdes=S1
}
C 1500 7000 1 0 0 norod.sym
{
T 1900 7500 5 10 1 1 0 4 1
refdes=S2
}
C 1400 6300 1 0 0 nmos-switch.sym
{
T 1625 6600 5 8 1 1 0 1 1
refdes=M1
T 1500 7100 5 10 0 1 0 0 1
value=NMOS_switch
T 1900 6900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2900 6900 5 10 0 1 0 0 1
device=NMOS
}
N 1800 6800 1800 7000 4
N 1900 7900 2300 7900 4
{
T 2200 7875 5 6 1 1 0 5 1
netname=CZ
}
N 2300 7900 2300 7500 4
N 1500 7000 1800 7000 4
C 900 7500 1 0 0 in-1.sym
{
T 900 7800 5 10 0 0 0 0 1
device=INPUT
T 900 8000 5 10 0 0 0 0 1
footprint=anchor
T 900 7600 5 10 1 1 0 7 1
refdes=Co#
}
N 13100 1000 13300 1000 4
{
T 13050 1000 5 10 1 1 0 7 1
netname=I6#
}
C 14100 900 1 0 0 out-1.sym
{
T 14700 1000 5 10 1 1 0 1 1
refdes=CW#
T 14100 1400 5 10 0 0 0 0 1
footprint=anchor
T 14100 1200 5 10 0 0 0 0 1
device=OUTPUT
}
C 5800 3900 1 0 0 nandod.sym
{
T 6200 4400 5 10 1 1 0 4 1
refdes=L4
}
C 13300 700 1 0 0 not.sym
{
T 13650 1000 5 10 1 1 0 4 1
refdes=C
}
C 13900 1300 1 0 1 vdd-1.sym
N 13500 4900 13300 4900 4
{
T 13250 4900 5 10 1 1 0 7 1
netname=I2#
}
N 13900 4500 13300 4500 4
{
T 13250 4500 5 10 1 1 0 7 1
netname=I3#
}
N 14300 4900 14500 4900 4
{
T 14550 4900 5 10 1 1 0 1 1
netname=I2oi3
}
C 13500 4600 1 0 0 not.sym
{
T 13850 4900 5 10 1 1 0 4 1
refdes=N8
}
C 13700 5200 1 0 0 vdd-1.sym
C 13300 3300 1 0 0 not.sym
{
T 13650 3600 5 10 1 1 0 4 1
refdes=N9
}
N 14200 3600 14100 3600 4
C 3000 1300 1 0 0 nots.sym
{
T 3350 1600 5 10 1 1 0 4 1
refdes=L3
}
C 13400 5900 1 0 0 nor.sym
{
T 13800 6400 5 10 1 1 0 4 1
refdes=A4
}
C 13500 6900 1 0 0 vdd-1.sym
N 13700 700 13700 600 4
N 13700 600 13100 600 4
{
T 13050 600 5 10 1 1 0 7 1
netname=I7#
}
N 13900 4500 13900 4600 4
C 9800 6100 1 0 0 not.sym
{
T 10150 6400 5 10 1 1 0 4 1
refdes=N5
}
C 10000 6700 1 0 0 vdd-1.sym
N 10200 6000 9600 6000 4
{
T 9450 6000 5 10 1 1 0 7 1
netname=I7#
}
N 9600 6400 9800 6400 4
{
T 9550 6400 5 10 1 1 0 7 1
netname=MR#
}
C 11500 6300 1 0 0 out-1.sym
{
T 11500 6600 5 10 0 0 0 0 1
device=OUTPUT
T 11500 6800 5 10 0 0 0 0 1
footprint=anchor
T 12100 6400 5 10 1 1 0 1 1
refdes=QE
}
C 10700 6100 1 0 0 not.sym
{
T 11050 6400 5 10 1 1 0 4 1
refdes=N6
}
C 10900 6700 1 0 0 vdd-1.sym
C 11000 5800 1 0 0 gnd-1.sym
N 10200 6000 10200 6100 4
N 5500 5500 5500 5600 4
N 5300 800 5300 900 4
C 3100 2600 1 0 0 notp.sym
{
T 3450 2900 5 10 1 1 0 4 1
refdes=L2
}
N 10700 6400 10600 6400 4
{
T 10600 6450 5 7 1 1 0 0 1
netname=QE#
}
