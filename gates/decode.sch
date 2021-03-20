v 20201216 2
C 2900 5900 1 0 0 in-1.sym
{
T 2900 6400 5 10 0 0 0 0 1
footprint=anchor
T 2900 6200 5 10 0 0 0 0 1
device=INPUT
T 2900 6000 5 10 1 1 0 7 1
refdes=O5
}
C 900 5900 1 0 0 in-1.sym
{
T 900 6400 5 10 0 0 0 0 1
footprint=anchor
T 900 6200 5 10 0 0 0 0 1
device=INPUT
T 900 6000 5 10 1 1 0 7 1
refdes=O2
}
C 900 5700 1 0 0 in-1.sym
{
T 900 6200 5 10 0 0 0 0 1
footprint=anchor
T 900 6000 5 10 0 0 0 0 1
device=INPUT
T 900 5800 5 10 1 1 0 7 1
refdes=O3
}
C 900 5500 1 0 0 in-1.sym
{
T 900 6000 5 10 0 0 0 0 1
footprint=anchor
T 900 5800 5 10 0 0 0 0 1
device=INPUT
T 900 5600 5 10 1 1 0 7 1
refdes=O4
}
C 2900 5700 1 0 0 in-1.sym
{
T 2900 6200 5 10 0 0 0 0 1
footprint=anchor
T 2900 6000 5 10 0 0 0 0 1
device=INPUT
T 2900 5800 5 10 1 1 0 7 1
refdes=O6
}
C 2900 5500 1 0 0 in-1.sym
{
T 2900 6000 5 10 0 0 0 0 1
footprint=anchor
T 2900 5800 5 10 0 0 0 0 1
device=INPUT
T 2900 5600 5 10 1 1 0 7 1
refdes=O7
}
N 1500 5800 1700 5800 4
{
T 1750 5800 5 10 1 1 0 1 1
netname=O3
}
N 4100 8500 4300 8500 4
{
T 4050 8500 5 10 1 1 0 7 1
netname=O6#
}
N 1700 5600 1500 5600 4
{
T 1750 5600 5 10 1 1 0 1 1
netname=O4
}
N 2200 8200 2700 8200 4
{
T 2450 8250 5 10 1 1 0 3 1
netname=Flag
}
N 3500 8100 4300 8100 4
{
T 3650 8100 5 10 1 1 0 2 1
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
N 4300 7100 4300 8100 4
C 4300 6500 1 0 0 nor.sym
{
T 4700 7000 5 10 1 1 0 4 1
refdes=S4
}
C 5900 6900 1 0 0 out-1.sym
{
T 5900 7400 5 10 0 0 0 0 1
footprint=anchor
T 5900 7200 5 10 0 0 0 0 1
device=OUTPUT
T 5950 7050 5 10 1 1 0 0 1
refdes=Jump
}
C 7100 5800 1 0 0 out-1.sym
{
T 7100 6300 5 10 0 0 0 0 1
footprint=anchor
T 7100 6100 5 10 0 0 0 0 1
device=OUTPUT
T 7150 5950 5 10 1 1 0 0 1
refdes=VPush
}
C 5100 7200 1 0 0 nor.sym
{
T 5500 7700 5 10 1 1 0 4 1
refdes=S5
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
C 4500 6200 1 0 0 gnd-1.sym
C 5300 6900 1 0 0 gnd-1.sym
C 4500 7600 1 0 0 gnd-1.sym
C 1600 8500 1 0 0 vdd-1.sym
C 2800 8600 1 0 0 vdd-1.sym
C 5800 8800 1 0 0 vdd-1.sym
C 5200 8200 1 0 0 vdd-1.sym
C 4400 7500 1 0 0 vdd-1.sym
C 5300 6200 1 0 0 vdd-1.sym
N 5500 5600 5100 5600 4
{
T 5050 5600 5 10 1 1 0 7 1
netname=O5#
}
N 2700 8000 2700 7700 4
{
T 2700 7650 5 10 1 1 0 5 1
netname=O2
}
N 5900 7000 5100 7000 4
N 4100 8300 4300 8300 4
{
T 4050 8300 5 10 1 1 0 7 1
netname=O7
}
N 5900 8400 5100 8400 4
{
T 5400 8400 5 10 1 1 0 0 1
netname=Ret
}
C 6600 5300 1 0 0 gnd-1.sym
C 900 5000 1 0 0 in-1.sym
{
T 900 5500 5 10 0 0 0 0 1
footprint=anchor
T 900 5300 5 10 0 0 0 0 1
device=INPUT
T 900 5100 5 10 1 1 0 7 1
refdes=Vdd
}
C 900 4800 1 0 0 in-1.sym
{
T 900 5300 5 10 0 0 0 0 1
footprint=anchor
T 900 5100 5 10 0 0 0 0 1
device=INPUT
T 900 4900 5 10 1 1 0 7 1
refdes=GND
}
C 1300 5100 1 0 0 vdd-1.sym
C 1400 4600 1 0 0 gnd-1.sym
N 4100 8700 4300 8700 4
{
T 4050 8700 5 10 1 1 0 7 1
netname=O5#
}
N 1500 6000 1700 6000 4
{
T 1750 6000 5 10 1 1 0 1 1
netname=O2
}
N 3500 6000 3700 6000 4
{
T 3750 6000 5 10 1 1 0 1 1
netname=O5
}
N 3500 5800 3700 5800 4
{
T 3750 5800 5 10 1 1 0 1 1
netname=O6
}
N 3500 5600 3700 5600 4
{
T 3750 5600 5 10 1 1 0 1 1
netname=O7
}
C 1600 6000 1 0 0 gnd-1.sym
T 5400 6800 9 10 1 0 0 0 1
(includes call)
C 900 3800 1 0 0 in-1.sym
{
T 900 4100 5 10 0 0 0 0 1
device=INPUT
T 900 4300 5 10 0 0 0 0 1
footprint=anchor
T 900 3900 5 10 1 1 0 7 1
refdes=I3#
}
C 900 4000 1 0 0 in-1.sym
{
T 900 4300 5 10 0 0 0 0 1
device=INPUT
T 900 4500 5 10 0 0 0 0 1
footprint=anchor
T 900 4100 5 10 1 1 0 7 1
refdes=I3
}
C 900 3400 1 0 0 in-1.sym
{
T 900 3700 5 10 0 0 0 0 1
device=INPUT
T 900 3500 5 10 1 1 0 7 1
refdes=I4#
T 900 3900 5 10 0 0 0 0 1
footprint=anchor
}
C 900 3600 1 0 0 in-1.sym
{
T 900 3900 5 10 0 0 0 0 1
device=INPUT
T 900 3700 5 10 1 1 0 7 1
refdes=I4
T 900 4100 5 10 0 0 0 0 1
footprint=anchor
}
C 900 3200 1 0 0 in-1.sym
{
T 900 3500 5 10 0 0 0 0 1
device=INPUT
T 900 3700 5 10 0 0 0 0 1
footprint=anchor
T 900 3300 5 10 1 1 0 7 1
refdes=I5
}
C 900 3000 1 0 0 in-1.sym
{
T 900 3300 5 10 0 0 0 0 1
device=INPUT
T 900 3500 5 10 0 0 0 0 1
footprint=anchor
T 900 3100 5 10 1 1 0 7 1
refdes=I5#
}
C 900 2800 1 0 0 in-1.sym
{
T 900 3100 5 10 0 0 0 0 1
device=INPUT
T 900 2900 5 10 1 1 0 7 1
refdes=I6
T 900 3300 5 10 0 0 0 0 1
footprint=anchor
}
C 900 2600 1 0 0 in-1.sym
{
T 900 2900 5 10 0 0 0 0 1
device=INPUT
T 900 2700 5 10 1 1 0 7 1
refdes=I6#
T 900 3100 5 10 0 0 0 0 1
footprint=anchor
}
C 900 2400 1 0 0 in-1.sym
{
T 900 2700 5 10 0 0 0 0 1
device=INPUT
T 900 2900 5 10 0 0 0 0 1
footprint=anchor
T 900 2500 5 10 1 1 0 7 1
refdes=I7
}
C 900 2200 1 0 0 in-1.sym
{
T 900 2500 5 10 0 0 0 0 1
device=INPUT
T 900 2700 5 10 0 0 0 0 1
footprint=anchor
T 900 2300 5 10 1 1 0 7 1
refdes=I7#
}
N 1500 3900 1700 3900 4
{
T 1750 3900 5 10 1 1 0 1 1
netname=I3#
}
N 1500 4100 1700 4100 4
{
T 1750 4100 5 10 1 1 0 1 1
netname=I3
}
N 1500 3500 1700 3500 4
{
T 1750 3500 5 10 1 1 0 1 1
netname=I4#
}
N 1500 3700 1700 3700 4
{
T 1750 3700 5 10 1 1 0 1 1
netname=I4
}
N 1500 3300 1700 3300 4
{
T 1750 3300 5 10 1 1 0 1 1
netname=I5
}
N 1500 3100 1700 3100 4
{
T 1750 3100 5 10 1 1 0 1 1
netname=I5#
}
N 1500 2900 1700 2900 4
{
T 1750 2900 5 10 1 1 0 1 1
netname=I6
}
N 1500 2700 1700 2700 4
{
T 1750 2700 5 10 1 1 0 1 1
netname=I6#
}
N 1500 2500 1700 2500 4
{
T 1750 2500 5 10 1 1 0 1 1
netname=I7
}
N 1500 2300 1700 2300 4
{
T 1750 2300 5 10 1 1 0 1 1
netname=I7#
}
C 11200 7400 1 0 0 out-1.sym
{
T 11200 7700 5 10 0 0 0 0 1
device=OUTPUT
T 11800 7500 5 10 1 1 0 1 1
refdes=AND
T 11200 7900 5 10 0 0 0 0 1
footprint=anchor
}
C 12600 -100 1 0 0 gnd-1.sym
C 12700 2300 1 0 0 vdd-1.sym
C 14000 6300 1 0 0 out-1.sym
{
T 14000 6600 5 10 0 0 0 0 1
device=OUTPUT
T 14000 6800 5 10 0 0 0 0 1
footprint=anchor
T 14600 6400 5 10 1 1 0 1 1
refdes=AS
}
N 13000 6500 13200 6500 4
{
T 12950 6500 5 10 1 1 0 7 1
netname=I2#
}
N 13200 6300 13000 6300 4
{
T 12950 6300 5 10 1 1 0 7 1
netname=I67#
}
C 13400 5600 1 0 0 gnd-1.sym
C 13300 6900 1 0 0 vdd-1.sym
C 14900 7800 1 0 0 out-1.sym
{
T 14900 8100 5 10 0 0 0 0 1
device=OUTPUT
T 14900 8300 5 10 0 0 0 0 1
footprint=anchor
T 15500 7900 5 10 1 1 0 1 1
refdes=AR#
}
C 14000 5000 1 0 0 out-1.sym
{
T 14000 5300 5 10 0 0 0 0 1
device=OUTPUT
T 14000 5500 5 10 0 0 0 0 1
footprint=anchor
T 14600 5100 5 10 1 1 0 1 1
refdes=N#
}
C 15100 5500 1 0 1 vdd-1.sym
N 13200 5200 13000 5200 4
{
T 12950 5200 5 10 1 1 0 7 1
netname=I67#
}
N 13200 5000 13000 5000 4
{
T 12950 5000 5 10 1 1 0 7 1
netname=I3#
}
N 10400 8100 10400 7500 4
C 10700 7500 1 0 0 gnd-1.sym
C 10600 8400 1 0 0 vdd-1.sym
C 11200 8000 1 0 0 out-1.sym
{
T 11200 8300 5 10 0 0 0 0 1
device=OUTPUT
T 11800 8100 5 10 1 1 0 1 1
refdes=CS#
T 11200 8500 5 10 0 0 0 0 1
footprint=anchor
}
C 14100 7600 1 0 0 cnot.sym
{
T 14425 7900 5 10 1 1 0 4 1
refdes=N1
}
C 14400 7300 1 0 0 gnd-1.sym
C 14300 8200 1 0 0 vdd-1.sym
N 11200 7500 10400 7500 4
C 900 4200 1 0 0 in-1.sym
{
T 900 4500 5 10 0 0 0 0 1
device=INPUT
T 900 4700 5 10 0 0 0 0 1
footprint=anchor
T 900 4300 5 10 1 1 0 7 1
refdes=I2#
}
C 900 4400 1 0 0 in-1.sym
{
T 900 4700 5 10 0 0 0 0 1
device=INPUT
T 900 4900 5 10 0 0 0 0 1
footprint=anchor
T 900 4500 5 10 1 1 0 7 1
refdes=I2
}
N 1500 4300 1700 4300 4
{
T 1750 4300 5 10 1 1 0 1 1
netname=I2#
}
N 1500 4500 1700 4500 4
{
T 1750 4500 5 10 1 1 0 1 1
netname=I2
}
C 10400 7800 1 0 0 cnot.sym
{
T 10725 8100 5 10 1 1 0 4 1
refdes=N2
}
N 10700 4400 10900 4400 4
{
T 10950 4400 5 10 1 1 0 1 1
netname=I67#
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
N 13200 7800 13000 7800 4
{
T 12950 7800 5 10 1 1 0 7 1
netname=I67#
}
N 13200 8000 13000 8000 4
{
T 12950 8000 5 10 1 1 0 7 1
netname=I2
}
C 13300 8400 1 0 0 vdd-1.sym
C 13400 7100 1 0 0 gnd-1.sym
C 7600 8200 1 0 0 not.sym
{
T 7950 8500 5 10 1 1 0 4 1
refdes=N3
}
C 7800 8800 1 0 0 vdd-1.sym
C 8100 7900 1 0 1 gnd-1.sym
C 7600 7300 1 0 0 not.sym
{
T 7950 7600 5 10 1 1 0 4 1
refdes=N5
}
C 7800 7900 1 0 0 vdd-1.sym
C 8100 7000 1 0 1 gnd-1.sym
C 7600 6400 1 0 0 not.sym
{
T 7950 6700 5 10 1 1 0 4 1
refdes=N6
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
N 9600 7600 9400 7600 4
{
T 9350 7600 5 10 1 1 0 7 1
netname=I2#
}
N 9600 7400 9400 7400 4
{
T 9350 7400 5 10 1 1 0 7 1
netname=I3#
}
C 10000 6700 1 0 1 gnd-1.sym
C 13200 3200 1 0 0 nor.sym
{
T 13600 3700 5 10 1 1 0 4 1
refdes=A4
}
N 13200 3800 13000 3800 4
{
T 12950 3800 5 10 1 1 0 7 1
netname=I2
}
N 13200 3600 13000 3600 4
{
T 12950 3600 5 10 1 1 0 7 1
netname=I3#
}
C 13300 4200 1 0 0 vdd-1.sym
C 13600 2900 1 0 1 gnd-1.sym
C 14000 3600 1 0 0 out-1.sym
{
T 14000 3900 5 10 0 0 0 0 1
device=OUTPUT
T 14000 4100 5 10 0 0 0 0 1
footprint=anchor
T 14600 3700 5 10 1 1 0 1 1
refdes=CR
}
C 10100 4700 1 0 0 vdd-1.sym
N 10300 4100 10300 3900 4
{
T 10300 3850 5 10 1 1 0 5 1
netname=I6#
}
N 9900 4400 9700 4400 4
{
T 9650 4400 5 10 1 1 0 7 1
netname=I7
}
C 13200 7400 1 0 0 nor.sym
{
T 13600 7900 5 10 1 1 0 4 1
refdes=A1
}
C 13200 5900 1 0 0 nor.sym
{
T 13600 6400 5 10 1 1 0 4 1
refdes=A2
}
C 7800 800 1 0 0 nmos-switch.sym
{
T 8025 1100 5 8 1 1 0 1 1
refdes=M11
T 7900 1600 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 1400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 1400 5 10 0 1 0 0 1
device=NMOS
}
C 9200 200 1 0 1 nmos-switch.sym
{
T 8975 500 5 8 1 1 0 7 1
refdes=M14
T 9100 1000 5 10 0 1 0 6 1
value=NMOS_switch
T 8700 800 5 10 0 1 0 6 1
footprint=sot23-nmos
T 7700 800 5 10 0 1 0 6 1
device=NMOS
}
N 7800 1100 7600 1100 4
{
T 7550 1100 5 10 1 1 0 7 1
netname=I4
}
N 9200 500 9400 500 4
{
T 9450 500 5 10 1 1 0 1 1
netname=I6#
}
C 10500 -100 1 0 1 gnd-1.sym
N 7800 500 7600 500 4
{
T 7550 500 5 10 1 1 0 7 1
netname=I2#
}
C 10800 1400 1 0 1 nmos-switch.sym
{
T 10700 2200 5 10 0 1 0 6 1
value=NMOS_switch
T 10300 2000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 2000 5 10 0 1 0 6 1
device=NMOS
T 10575 1700 5 8 1 1 0 7 1
refdes=M15
}
C 9200 800 1 0 1 nmos-switch.sym
{
T 9100 1600 5 10 0 1 0 6 1
value=NMOS_switch
T 8700 1400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 7700 1400 5 10 0 1 0 6 1
device=NMOS
T 8975 1100 5 8 1 1 0 7 1
refdes=M13
}
C 10800 200 1 0 1 nmos-switch.sym
{
T 10700 1000 5 10 0 1 0 6 1
value=NMOS_switch
T 10300 800 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 800 5 10 0 1 0 6 1
device=NMOS
T 10575 500 5 8 1 1 0 7 1
refdes=M17
}
C 10800 800 1 0 1 nmos-switch.sym
{
T 10700 1600 5 10 0 1 0 6 1
value=NMOS_switch
T 10300 1400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 1400 5 10 0 1 0 6 1
device=NMOS
T 10575 1100 5 8 1 1 0 7 1
refdes=M16
}
N 11000 500 10800 500 4
{
T 11050 500 5 10 1 1 0 1 1
netname=I67#
}
N 9400 1100 9200 1100 4
{
T 9450 1100 5 10 1 1 0 1 1
netname=I6
}
N 10800 1700 11000 1700 4
{
T 11050 1700 5 10 1 1 0 1 1
netname=I2
}
N 10800 1100 11000 1100 4
{
T 11050 1100 5 10 1 1 0 1 1
netname=I4#
}
N 10400 2100 9600 2100 4
N 10400 900 10400 700 4
C 7800 200 1 0 0 nmos-switch.sym
{
T 7900 1000 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 800 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 800 5 10 0 1 0 0 1
device=NMOS
T 8025 500 5 8 1 1 0 1 1
refdes=M12
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
N 10400 1300 10400 1500 4
N 9600 3100 8200 3100 4
N 8200 900 8200 700 4
C 12300 800 1 0 0 nmos-switch.sym
{
T 12525 1100 5 8 1 1 0 1 1
refdes=M1
T 12400 1600 5 8 0 1 0 0 1
value=NMOS_switch
T 12800 1400 5 8 0 1 0 0 1
footprint=sot23-nmos
T 13800 1400 5 8 0 1 0 0 1
device=NMOS
}
C 13200 800 1 0 0 nmos-switch.sym
{
T 13425 1100 5 8 1 1 0 1 1
refdes=M3
T 13300 1600 5 8 0 1 0 0 1
value=NMOS_switch
T 13700 1400 5 8 0 1 0 0 1
footprint=sot23-nmos
T 14700 1400 5 8 0 1 0 0 1
device=NMOS
}
C 12300 200 1 0 0 nmos-switch.sym
{
T 12525 500 5 8 1 1 0 1 1
refdes=M2
T 12400 1000 5 8 0 1 0 0 1
value=NMOS_switch
T 12800 800 5 8 0 1 0 0 1
footprint=sot23-nmos
T 13800 800 5 8 0 1 0 0 1
device=NMOS
}
C 13200 200 1 0 0 nmos-switch.sym
{
T 13425 500 5 8 1 1 0 1 1
refdes=M4
T 13300 1000 5 8 0 1 0 0 1
value=NMOS_switch
T 13700 800 5 8 0 1 0 0 1
footprint=sot23-nmos
T 14700 800 5 8 0 1 0 0 1
device=NMOS
}
C 14400 200 1 0 1 nmos-switch.sym
{
T 14175 500 5 8 1 1 0 7 1
refdes=M5
T 14300 1000 5 8 0 1 0 6 1
value=NMOS_switch
T 13900 800 5 8 0 1 0 6 1
footprint=sot23-nmos
T 12900 800 5 8 0 1 0 6 1
device=NMOS
}
C 15100 200 1 0 1 nmos-switch.sym
{
T 14875 500 5 8 1 1 0 7 1
refdes=M6
T 15000 1000 5 8 0 1 0 6 1
value=NMOS_switch
T 14600 800 5 8 0 1 0 6 1
footprint=sot23-nmos
T 13600 800 5 8 0 1 0 6 1
device=NMOS
}
C 15800 200 1 0 1 nmos-switch.sym
{
T 15575 500 5 8 1 1 0 7 1
refdes=M7
T 15700 1000 5 8 0 1 0 6 1
value=NMOS_switch
T 15300 800 5 8 0 1 0 6 1
footprint=sot23-nmos
T 14300 800 5 8 0 1 0 6 1
device=NMOS
}
C 13000 1400 1 90 0 resistor-load.sym
{
T 12600 1700 5 10 0 0 90 0 1
device=RESISTOR
T 12850 2050 5 10 1 1 90 0 1
refdes=R1
T 12900 1800 5 10 0 1 90 0 1
footprint=0603-boxed
T 12900 1800 5 10 0 1 90 0 1
value=rload
}
N 12700 700 12700 900 4
N 12700 800 15400 800 4
{
T 15200 900 5 10 1 1 0 0 1
netname=_cw
}
N 15400 800 15400 700 4
N 14700 700 14700 800 4
N 14000 700 14000 800 4
N 13600 700 13600 800 4
N 13600 800 13600 900 4
N 12700 1300 12700 1400 4
N 12700 1400 13600 1400 4
{
T 13000 1425 5 10 1 1 0 0 1
netname=CW
}
N 13600 1300 13600 1400 4
N 12100 1100 12300 1100 4
{
T 12050 1100 5 10 1 1 0 7 1
netname=I7#
}
N 13000 1100 13200 1100 4
{
T 13200 1000 5 10 1 1 0 7 1
netname=I6
}
N 14400 500 14400 300 4
{
T 14400 250 5 10 1 1 180 3 1
netname=I5#
}
N 12100 500 12300 500 4
{
T 12050 500 5 10 1 1 0 7 1
netname=I7
}
N 13000 500 13200 500 4
{
T 13200 400 5 10 1 1 0 7 1
netname=I6#
}
N 15100 500 15100 300 4
{
T 15100 250 5 10 1 1 180 3 1
netname=I4
}
N 15800 500 15800 300 4
{
T 15800 250 5 10 1 1 180 3 1
netname=I2#
}
C 13500 -100 1 0 0 gnd-1.sym
C 13900 -100 1 0 0 gnd-1.sym
C 14600 -100 1 0 0 gnd-1.sym
C 15300 -100 1 0 0 gnd-1.sym
N 1300 6600 1100 6600 4
{
T 1050 6600 5 10 1 1 0 7 1
netname=O3
}
N 1400 7400 1200 7400 4
{
T 1150 7400 5 10 1 1 0 7 1
netname=O3#
}
N 1400 8200 1200 8200 4
{
T 1150 8200 5 10 1 1 0 7 1
netname=O4
}
N 13500 4600 13000 4600 4
{
T 12950 4600 5 10 1 1 0 7 1
netname=I2#
}
B 6900 0 4800 3300 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
B 11700 0 4300 2600 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 2700 7600 1 0 0 xnor.sym
{
T 2900 8225 5 10 1 1 0 0 1
refdes=S2
}
C 900 1800 1 0 0 in-1.sym
{
T 900 1900 5 10 1 1 0 7 1
refdes=ϕ1
T 900 2300 5 10 0 0 0 0 1
footprint=anchor
T 900 2100 5 10 0 0 0 0 1
device=INPUT
}
C 1800 1800 1 0 1 phi1.sym
C 3900 2800 1 0 0 out-1.sym
{
T 3900 3100 5 10 0 0 0 0 1
device=OUTPUT
T 3900 3300 5 10 0 0 0 0 1
footprint=anchor
T 4500 2900 5 10 1 1 0 1 1
refdes=MW
}
C 7400 4300 1 0 0 out-1.sym
{
T 7400 4600 5 10 0 0 0 0 1
device=OUTPUT
T 7400 4800 5 10 0 0 0 0 1
footprint=anchor
T 8000 4400 5 10 1 1 0 1 1
refdes=MR#
}
C 13600 1300 1 0 0 out-1.sym
{
T 14200 1400 5 14 1 1 0 1 1
refdes=CW
T 13600 1800 5 10 0 0 0 0 1
footprint=anchor
T 13600 1600 5 10 0 0 0 0 1
device=OUTPUT
}
C 11200 6300 1 0 0 out-1.sym
{
T 11200 6600 5 10 0 0 0 0 1
device=OUTPUT
T 11200 6800 5 10 0 0 0 0 1
footprint=anchor
T 11800 6400 5 10 1 1 0 1 1
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
C 3700 6800 1 0 0 in-1.sym
{
T 3700 7300 5 10 0 0 0 0 1
footprint=anchor
T 3700 7100 5 10 0 0 0 0 1
device=INPUT
T 3700 6900 5 10 1 1 0 7 1
refdes=OJump#
}
C 900 1400 1 0 0 in-1.sym
{
T 900 1700 5 10 0 0 0 0 1
device=INPUT
T 900 1900 5 10 0 0 0 0 1
footprint=anchor
T 900 1500 5 10 1 1 0 7 1
refdes=Co
}
N 8800 700 8800 900 4
N 8800 1300 8800 2000 4
C 7800 1400 1 0 0 nmos-switch.sym
{
T 8025 1700 5 8 1 1 0 1 1
refdes=M10
T 7900 2200 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 2000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 2000 5 10 0 1 0 0 1
device=NMOS
}
C 7800 2000 1 0 0 nmos-switch.sym
{
T 7900 2800 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 2600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 2600 5 10 0 1 0 0 1
device=NMOS
T 8025 2300 5 8 1 1 0 1 1
refdes=M9
}
C 7800 2600 1 0 0 nmos-switch.sym
{
T 7900 3400 5 10 0 1 0 0 1
value=NMOS_switch
T 8300 3200 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 3200 5 10 0 1 0 0 1
device=NMOS
T 8025 2900 5 8 1 1 0 1 1
refdes=M8
}
N 7600 2900 7800 2900 4
{
T 7550 2900 5 10 1 1 0 7 1
netname=I3#
}
N 7600 2300 7800 2300 4
{
T 7550 2300 5 10 1 1 0 7 1
netname=I7
}
N 8200 2700 8200 2500 4
N 8800 2000 8200 2000 4
{
T 8500 2050 5 6 1 1 0 3 1
netname=_co1
}
C 8100 -100 1 0 0 gnd-1.sym
C 8700 -100 1 0 0 gnd-1.sym
N 8200 1900 8200 2100 4
N 8200 1300 8200 1500 4
C 10400 2000 1 0 0 out-1.sym
{
T 11000 2100 5 14 1 1 0 1 1
refdes=CoE#
T 10400 2500 5 10 0 0 0 0 1
footprint=anchor
T 10400 2300 5 10 0 0 0 0 1
device=OUTPUT
}
N 9600 2100 9600 3100 4
C 10100 2100 1 90 0 resistor-load.sym
{
T 9700 2400 5 10 0 0 90 0 1
device=RESISTOR
T 10000 2500 5 10 0 1 90 0 1
footprint=0603-boxed
T 10000 2500 5 10 0 1 90 0 1
value=rload
T 9950 2750 5 10 1 1 90 0 1
refdes=R3
}
C 9800 3000 1 0 0 vdd-1.sym
N 10400 1900 10400 2100 4
N 8200 800 8800 800 4
{
T 8500 850 5 6 1 1 0 3 1
netname=_co6
}
B 400 5400 8500 3600 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 8800 5500 9 12 1 0 0 6 1
Branch Control
T 11800 8800 9 12 1 0 0 0 1
Arithmetic Control
L 8900 3300 8900 5400 5 0 1 0 -1 -1
T 8800 5200 9 12 1 0 0 6 1
Misc. Logic
C 9600 5100 1 0 0 gnd-1.sym
C 9500 6400 1 0 0 vdd-1.sym
C 9400 5400 1 0 0 nand.sym
{
T 9800 5900 5 10 1 1 0 4 1
refdes=A8
}
N 9400 6000 9200 6000 4
{
T 9150 6000 5 10 1 1 0 7 1
netname=I6
}
N 9400 5800 9200 5800 4
{
T 9150 5800 5 10 1 1 0 7 1
netname=I7
}
N 11200 6400 10200 6400 4
C 6800 6500 1 90 1 phi1.sym
C 6300 5600 1 0 0 notp.sym
{
T 6650 5900 5 10 1 1 0 4 1
refdes=N8
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
B 400 0 15600 9000 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
N 3300 7900 3500 7900 4
C 9900 4100 1 0 0 not.sym
{
T 10250 4400 5 10 1 1 0 4 1
refdes=N7
}
C 3100 3900 1 0 0 nor.sym
{
T 3500 4400 5 10 1 1 0 4 1
refdes=L7
}
C 3300 3600 1 0 0 gnd-1.sym
C 3500 5200 1 90 1 phi1.sym
C 7500 4800 1 0 0 vdd-1.sym
N 6600 4400 7400 4400 4
{
T 7100 4425 5 10 1 1 0 3 1
netname=MR#
}
N 11000 6100 11200 6100 4
{
T 11250 6100 5 10 1 1 0 1 1
netname=I2
}
N 11000 5900 11200 5900 4
{
T 11250 5900 5 10 1 1 0 1 1
netname=I3#
}
N 11000 5700 11200 5700 4
{
T 11250 5700 5 10 1 1 0 1 1
netname=I4
}
C 11000 5400 1 0 1 nor3od.sym
{
T 10600 5900 5 10 1 1 0 4 1
refdes=A9
}
C 10600 5100 1 0 0 gnd-1.sym
N 10200 6400 10200 5900 4
C 5100 5600 1 0 0 not.sym
{
T 5450 5900 5 10 1 1 0 4 1
refdes=S6
}
N 14100 7900 14000 7900 4
{
T 14050 7925 5 8 1 1 0 3 1
netname=AR
}
N 1700 6300 1700 6400 4
C 13200 4600 1 0 0 nandod.sym
{
T 13600 5100 5 10 1 1 0 4 1
refdes=A3
}
C 14900 5400 1 0 1 resistor-strong.sym
{
T 14600 5800 5 10 0 0 0 6 1
device=RESISTOR
T 14250 5550 5 10 1 1 0 6 1
refdes=R2
T 13900 5300 5 10 0 1 0 6 1
footprint=0603-boxed
T 14800 5100 5 10 0 1 0 6 1
value=rstrong
}
N 14000 5500 14000 5100 4
C 4300 7900 1 0 0 nor4od.sym
{
T 4700 8400 5 10 1 1 0 4 1
refdes=S3
}
C 6000 8600 1 0 1 resistor-strong.sym
{
T 5700 9000 5 10 0 0 0 6 1
device=RESISTOR
T 5350 8750 5 10 1 1 0 6 1
refdes=R4
T 5000 8500 5 10 0 1 0 6 1
footprint=0603-boxed
T 5900 8300 5 10 0 1 0 6 1
value=rstrong
}
N 6000 8800 6000 8700 4
C 9600 7000 1 0 0 nor.sym
{
T 10000 7500 5 10 1 1 0 4 1
refdes=A5
}
C 9700 8000 1 0 0 vdd-1.sym
N 12700 200 12700 300 4
N 13600 200 13600 300 4
N 14000 200 14000 300 4
N 14700 200 14700 300 4
N 15400 200 15400 300 4
N 10400 200 10400 300 4
N 8200 200 8200 300 4
N 8800 200 8800 300 4
C 7700 4700 1 0 1 resistor-strong.sym
{
T 7400 5100 5 10 0 0 0 6 1
device=RESISTOR
T 7050 4850 5 10 1 1 0 6 1
refdes=R5
T 6700 4600 5 10 0 1 0 6 1
footprint=0603-boxed
T 7600 4400 5 10 0 1 0 6 1
value=rstrong
}
N 6800 4400 6800 4800 4
C 5800 2900 1 0 0 norod.sym
{
T 6200 3400 5 10 1 1 0 4 1
refdes=L1
}
C 6000 2600 1 0 0 gnd-1.sym
N 5600 4200 5800 4200 4
{
T 5550 4200 5 10 1 1 0 7 1
netname=I6
}
N 5600 4400 5800 4400 4
{
T 5550 4400 5 10 1 1 0 7 1
netname=I3
}
N 5600 4600 5800 4600 4
{
T 5550 4600 5 10 1 1 0 7 1
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
refdes=L3
}
C 3000 1300 1 0 0 not.sym
{
T 3350 1600 5 10 1 1 0 4 1
refdes=L5
}
N 2800 1600 3000 1600 4
{
T 2750 1600 5 10 1 1 0 7 1
netname=I4#
}
C 3200 1900 1 0 0 vdd-1.sym
C 5700 1900 1 0 0 out-1.sym
{
T 5700 2200 5 10 0 0 0 0 1
device=OUTPUT
T 5700 2400 5 10 0 0 0 0 1
footprint=anchor
T 6300 2000 5 10 1 1 0 1 1
refdes=IN#
}
N 4700 2000 4900 2000 4
{
T 4650 2000 5 10 1 1 0 7 1
netname=I4
}
N 4700 1100 4900 1100 4
{
T 4650 1100 5 10 1 1 0 7 1
netname=I3#
}
C 5100 1400 1 0 0 vdd-1.sym
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
C 3100 2400 1 0 0 nor.sym
{
T 3500 2900 5 10 1 1 0 4 1
refdes=L6
}
C 3300 2100 1 0 0 gnd-1.sym
N 2900 2800 3100 2800 4
{
T 2850 2800 5 10 1 1 0 7 1
netname=SO#
}
N 2900 3000 3100 3000 4
{
T 2850 3000 5 10 1 1 0 7 1
netname=I3#
}
C 3200 3400 1 0 0 vdd-1.sym
C 5800 3900 1 0 0 nand3od.sym
{
T 6200 4400 5 10 1 1 0 4 1
refdes=L2
}
N 6100 3900 6600 3900 4
N 6600 3900 6600 3400 4
C 4900 800 1 0 0 not.sym
{
T 5250 1100 5 10 1 1 0 4 1
refdes=L4
}
C 4900 1700 1 0 0 not.sym
{
T 5250 2000 5 10 1 1 0 4 1
refdes=L8
}
C 5100 2300 1 0 0 vdd-1.sym
N 5300 1700 5700 1700 4
N 5700 1700 5700 1100 4
C 5700 1000 1 0 0 out-1.sym
{
T 5700 1300 5 10 0 0 0 0 1
device=OUTPUT
T 5700 1500 5 10 0 0 0 0 1
footprint=anchor
T 6300 1100 5 10 1 1 0 1 1
refdes=MPre#
}
N 1500 1500 1700 1500 4
{
T 1750 1500 5 10 1 1 0 1 1
netname=Co
}
N 7600 1700 7800 1700 4
{
T 7550 1700 5 10 1 1 0 7 1
netname=Co
}
C 1400 7900 1 0 0 not.sym
{
T 1750 8200 5 10 1 1 0 4 1
refdes=N4
}
C 1400 7000 1 0 0 norod.sym
{
T 1800 7500 5 10 1 1 0 4 1
refdes=S1
}
C 1300 6300 1 0 0 nmos-switch.sym
{
T 1525 6600 5 8 1 1 0 1 1
refdes=M18
T 1400 7100 5 10 0 1 0 0 1
value=NMOS_switch
T 1800 6900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2800 6900 5 10 0 1 0 0 1
device=NMOS
}
N 1700 6800 1700 7000 4
N 1800 7900 2200 7900 4
{
T 2000 7875 5 6 1 1 0 5 1
netname=CZ
}
N 2200 7900 2200 7500 4
N 1500 7000 1700 7000 4
C 800 7500 1 0 0 in-1.sym
{
T 800 7800 5 10 0 0 0 0 1
device=INPUT
T 800 8000 5 10 0 0 0 0 1
footprint=anchor
T 800 7600 5 10 1 1 0 7 1
refdes=Co#
}
