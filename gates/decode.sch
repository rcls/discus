v 20201216 2
C 900 5900 1 0 0 in-1.sym
{
T 900 6400 5 10 0 0 0 0 1
footprint=anchor
T 900 6200 5 10 0 0 0 0 1
device=INPUT
T 900 6000 5 10 1 1 0 7 1
refdes=O5
}
C 900 6500 1 0 0 in-1.sym
{
T 900 7000 5 10 0 0 0 0 1
footprint=anchor
T 900 6800 5 10 0 0 0 0 1
device=INPUT
T 900 6600 5 10 1 1 0 7 1
refdes=O2
}
C 900 6300 1 0 0 in-1.sym
{
T 900 6800 5 10 0 0 0 0 1
footprint=anchor
T 900 6600 5 10 0 0 0 0 1
device=INPUT
T 900 6400 5 10 1 1 0 7 1
refdes=O3
}
C 900 6100 1 0 0 in-1.sym
{
T 900 6600 5 10 0 0 0 0 1
footprint=anchor
T 900 6400 5 10 0 0 0 0 1
device=INPUT
T 900 6200 5 10 1 1 0 7 1
refdes=O4
}
C 900 5700 1 0 0 in-1.sym
{
T 900 6200 5 10 0 0 0 0 1
footprint=anchor
T 900 6000 5 10 0 0 0 0 1
device=INPUT
T 900 5800 5 10 1 1 0 7 1
refdes=O6
}
C 900 5500 1 0 0 in-1.sym
{
T 900 6000 5 10 0 0 0 0 1
footprint=anchor
T 900 5800 5 10 0 0 0 0 1
device=INPUT
T 900 5600 5 10 1 1 0 7 1
refdes=O7
}
N 1500 6400 1700 6400 4
{
T 1750 6400 5 10 1 1 0 1 1
netname=O3
}
N 4100 8500 4300 8500 4
{
T 4050 8500 5 10 1 1 0 7 1
netname=O6#
}
N 1700 6200 1500 6200 4
{
T 1750 6200 5 10 1 1 0 1 1
netname=O4
}
N 2500 8200 2700 8200 4
{
T 2450 8250 5 10 1 1 0 0 1
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
N 5100 8400 5100 7800 4
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
C 1900 8700 1 0 0 vdd-1.sym
C 2800 8600 1 0 0 vdd-1.sym
C 4400 8900 1 0 0 vdd-1.sym
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
C 4300 7900 1 0 0 nor4.sym
{
T 4700 8400 5 10 1 1 0 4 1
refdes=S3
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
C 900 5100 1 0 0 in-1.sym
{
T 900 5600 5 10 0 0 0 0 1
footprint=anchor
T 900 5400 5 10 0 0 0 0 1
device=INPUT
T 900 5200 5 10 1 1 0 7 1
refdes=Vdd
}
C 900 4900 1 0 0 in-1.sym
{
T 900 5400 5 10 0 0 0 0 1
footprint=anchor
T 900 5200 5 10 0 0 0 0 1
device=INPUT
T 900 5000 5 10 1 1 0 7 1
refdes=GND
}
C 1300 5200 1 0 0 vdd-1.sym
C 1400 4700 1 0 0 gnd-1.sym
N 4100 8700 4300 8700 4
{
T 4050 8700 5 10 1 1 0 7 1
netname=O5#
}
N 1500 6600 1700 6600 4
{
T 1750 6600 5 10 1 1 0 1 1
netname=O2
}
N 1500 6000 1700 6000 4
{
T 1750 6000 5 10 1 1 0 1 1
netname=O5
}
N 1500 5800 1700 5800 4
{
T 1750 5800 5 10 1 1 0 1 1
netname=O6
}
N 1500 5600 1700 5600 4
{
T 1750 5600 5 10 1 1 0 1 1
netname=O7
}
C 2000 7000 1 0 0 gnd-1.sym
C 1500 7700 1 0 0 nandor.sym
{
T 2150 8200 5 10 1 1 0 4 1
refdes=S1
}
T 5400 6800 9 10 1 0 0 0 1
(includes call)
C 900 3900 1 0 0 in-1.sym
{
T 900 4200 5 10 0 0 0 0 1
device=INPUT
T 900 4400 5 10 0 0 0 0 1
footprint=anchor
T 900 4000 5 10 1 1 0 7 1
refdes=I3#
}
C 900 4100 1 0 0 in-1.sym
{
T 900 4400 5 10 0 0 0 0 1
device=INPUT
T 900 4600 5 10 0 0 0 0 1
footprint=anchor
T 900 4200 5 10 1 1 0 7 1
refdes=I3
}
C 900 3500 1 0 0 in-1.sym
{
T 900 3800 5 10 0 0 0 0 1
device=INPUT
T 900 3600 5 10 1 1 0 7 1
refdes=I4#
T 900 4000 5 10 0 0 0 0 1
footprint=anchor
}
C 900 3700 1 0 0 in-1.sym
{
T 900 4000 5 10 0 0 0 0 1
device=INPUT
T 900 3800 5 10 1 1 0 7 1
refdes=I4
T 900 4200 5 10 0 0 0 0 1
footprint=anchor
}
C 900 3300 1 0 0 in-1.sym
{
T 900 3600 5 10 0 0 0 0 1
device=INPUT
T 900 3800 5 10 0 0 0 0 1
footprint=anchor
T 900 3400 5 10 1 1 0 7 1
refdes=I5
}
C 900 3100 1 0 0 in-1.sym
{
T 900 3400 5 10 0 0 0 0 1
device=INPUT
T 900 3600 5 10 0 0 0 0 1
footprint=anchor
T 900 3200 5 10 1 1 0 7 1
refdes=I5#
}
C 900 2900 1 0 0 in-1.sym
{
T 900 3200 5 10 0 0 0 0 1
device=INPUT
T 900 3000 5 10 1 1 0 7 1
refdes=I6
T 900 3400 5 10 0 0 0 0 1
footprint=anchor
}
C 900 2700 1 0 0 in-1.sym
{
T 900 3000 5 10 0 0 0 0 1
device=INPUT
T 900 2800 5 10 1 1 0 7 1
refdes=I6#
T 900 3200 5 10 0 0 0 0 1
footprint=anchor
}
C 900 2500 1 0 0 in-1.sym
{
T 900 2800 5 10 0 0 0 0 1
device=INPUT
T 900 3000 5 10 0 0 0 0 1
footprint=anchor
T 900 2600 5 10 1 1 0 7 1
refdes=I7
}
C 900 2300 1 0 0 in-1.sym
{
T 900 2600 5 10 0 0 0 0 1
device=INPUT
T 900 2800 5 10 0 0 0 0 1
footprint=anchor
T 900 2400 5 10 1 1 0 7 1
refdes=I7#
}
N 1500 4000 1700 4000 4
{
T 1750 4000 5 10 1 1 0 1 1
netname=I3#
}
N 1500 4200 1700 4200 4
{
T 1750 4200 5 10 1 1 0 1 1
netname=I3
}
N 1500 3600 1700 3600 4
{
T 1750 3600 5 10 1 1 0 1 1
netname=I4#
}
N 1500 3800 1700 3800 4
{
T 1750 3800 5 10 1 1 0 1 1
netname=I4
}
N 1500 3400 1700 3400 4
{
T 1750 3400 5 10 1 1 0 1 1
netname=I5
}
N 1500 3200 1700 3200 4
{
T 1750 3200 5 10 1 1 0 1 1
netname=I5#
}
N 1500 3000 1700 3000 4
{
T 1750 3000 5 10 1 1 0 1 1
netname=I6
}
N 1500 2800 1700 2800 4
{
T 1750 2800 5 10 1 1 0 1 1
netname=I6#
}
N 1500 2600 1700 2600 4
{
T 1750 2600 5 10 1 1 0 1 1
netname=I7
}
N 1500 2400 1700 2400 4
{
T 1750 2400 5 10 1 1 0 1 1
netname=I7#
}
C 14900 7900 1 0 0 out-1.sym
{
T 14900 8200 5 10 0 0 0 0 1
device=OUTPUT
T 15500 8000 5 10 1 1 0 1 1
refdes=AND
T 14900 8400 5 10 0 0 0 0 1
footprint=anchor
}
C 12600 0 1 0 0 gnd-1.sym
C 12700 2300 1 0 0 vdd-1.sym
C 10600 6900 1 0 0 out-1.sym
{
T 10600 7200 5 10 0 0 0 0 1
device=OUTPUT
T 10600 7400 5 10 0 0 0 0 1
footprint=anchor
T 11200 7000 5 10 1 1 0 1 1
refdes=AS
}
N 9600 7100 9800 7100 4
{
T 9550 7100 5 10 1 1 0 7 1
netname=I2#
}
N 9800 6900 9600 6900 4
{
T 9550 6900 5 10 1 1 0 7 1
netname=I67#
}
C 10000 6200 1 0 0 gnd-1.sym
C 9900 7500 1 0 0 vdd-1.sym
C 11400 8300 1 0 0 out-1.sym
{
T 11400 8600 5 10 0 0 0 0 1
device=OUTPUT
T 11400 8800 5 10 0 0 0 0 1
footprint=anchor
T 12000 8400 5 10 1 1 0 1 1
refdes=AR#
}
C 10600 5500 1 0 0 out-1.sym
{
T 10600 5800 5 10 0 0 0 0 1
device=OUTPUT
T 10600 6000 5 10 0 0 0 0 1
footprint=anchor
T 11200 5600 5 10 1 1 0 1 1
refdes=N#
}
C 9900 6100 1 0 0 vdd-1.sym
N 9800 5700 9600 5700 4
{
T 9550 5700 5 10 1 1 0 7 1
netname=I67#
}
N 9800 5500 9600 5500 4
{
T 9550 5500 5 10 1 1 0 7 1
netname=I3#
}
N 14100 8600 14100 8000 4
C 14400 8000 1 0 0 gnd-1.sym
C 14300 8900 1 0 0 vdd-1.sym
C 14900 8500 1 0 0 out-1.sym
{
T 14900 8800 5 10 0 0 0 0 1
device=OUTPUT
T 15500 8600 5 10 1 1 0 1 1
refdes=CS#
T 14900 9000 5 10 0 0 0 0 1
footprint=anchor
}
C 10600 8100 1 0 0 cnot.sym
{
T 10925 8400 5 10 1 1 0 4 1
refdes=N1
}
C 10900 7800 1 0 0 gnd-1.sym
C 10800 8700 1 0 0 vdd-1.sym
N 14900 8000 14100 8000 4
{
T 14200 8000 5 10 1 1 0 2 1
netname=I23
}
C 900 4300 1 0 0 in-1.sym
{
T 900 4600 5 10 0 0 0 0 1
device=INPUT
T 900 4800 5 10 0 0 0 0 1
footprint=anchor
T 900 4400 5 10 1 1 0 7 1
refdes=I2#
}
C 900 4500 1 0 0 in-1.sym
{
T 900 4800 5 10 0 0 0 0 1
device=INPUT
T 900 5000 5 10 0 0 0 0 1
footprint=anchor
T 900 4600 5 10 1 1 0 7 1
refdes=I2
}
N 1500 4400 1700 4400 4
{
T 1750 4400 5 10 1 1 0 1 1
netname=I2#
}
N 1500 4600 1700 4600 4
{
T 1750 4600 5 10 1 1 0 1 1
netname=I2
}
C 14100 8300 1 0 0 cnot.sym
{
T 14425 8600 5 10 1 1 0 4 1
refdes=N2
}
N 12500 3600 12700 3600 4
{
T 12750 3600 5 10 1 1 0 1 1
netname=I67#
}
C 5500 800 1 180 1 out-1.sym
{
T 5500 500 5 10 0 0 0 2 1
device=OUTPUT
T 5500 300 5 10 0 0 0 2 1
footprint=anchor
T 6100 700 5 10 1 1 0 1 1
refdes=OUT
}
N 9800 8300 9600 8300 4
{
T 9550 8300 5 10 1 1 0 7 1
netname=I67#
}
N 9800 8500 9600 8500 4
{
T 9550 8500 5 10 1 1 0 7 1
netname=I2
}
C 9900 8900 1 0 0 vdd-1.sym
C 10000 7600 1 0 0 gnd-1.sym
C 7600 8300 1 0 0 not.sym
{
T 7950 8600 5 10 1 1 0 4 1
refdes=N3
}
C 7800 8900 1 0 0 vdd-1.sym
C 8100 8000 1 0 1 gnd-1.sym
C 7600 7400 1 0 0 not.sym
{
T 7950 7700 5 10 1 1 0 4 1
refdes=N5
}
C 7800 8000 1 0 0 vdd-1.sym
C 8100 7100 1 0 1 gnd-1.sym
C 7600 6500 1 0 0 not.sym
{
T 7950 6800 5 10 1 1 0 4 1
refdes=N6
}
C 7800 7100 1 0 0 vdd-1.sym
C 8100 6200 1 0 1 gnd-1.sym
N 8400 8600 8600 8600 4
{
T 8400 8600 5 10 1 1 0 0 1
netname=O3#
}
N 8600 7700 8400 7700 4
{
T 8400 7700 5 10 1 1 0 0 1
netname=O5#
}
N 8400 6800 8600 6800 4
{
T 8400 6800 5 10 1 1 0 0 1
netname=O6#
}
C 1700 7200 1 0 0 2n7002.sym
{
T 1925 7500 5 10 1 1 0 1 1
refdes=M19
T 1800 8000 5 10 0 1 0 0 1
value=2N7002P
T 2200 7800 5 10 0 1 0 0 1
footprint=sot23-nmos
T 3200 7800 5 10 0 1 0 0 1
device=NMOS
}
C 13300 7500 1 0 0 nor.sym
{
T 13700 8000 5 10 1 1 0 4 1
refdes=A5
}
N 13300 8100 13100 8100 4
{
T 13050 8100 5 10 1 1 0 7 1
netname=I2#
}
N 13300 7900 13100 7900 4
{
T 13050 7900 5 10 1 1 0 7 1
netname=I3#
}
C 13400 8500 1 0 0 vdd-1.sym
C 13700 7200 1 0 1 gnd-1.sym
C 9800 3700 1 0 0 nor.sym
{
T 10200 4200 5 10 1 1 0 4 1
refdes=A4
}
N 9800 4300 9600 4300 4
{
T 9550 4300 5 10 1 1 0 7 1
netname=I2
}
N 9800 4100 9600 4100 4
{
T 9550 4100 5 10 1 1 0 7 1
netname=I3#
}
C 9900 4700 1 0 0 vdd-1.sym
C 10200 3400 1 0 1 gnd-1.sym
C 10600 4100 1 0 0 out-1.sym
{
T 10600 4400 5 10 0 0 0 0 1
device=OUTPUT
T 10600 4600 5 10 0 0 0 0 1
footprint=anchor
T 11200 4200 5 10 1 1 0 1 1
refdes=CR
}
C 11900 3900 1 0 0 vdd-1.sym
N 12100 3300 12100 3100 4
{
T 12100 3050 5 10 1 1 0 5 1
netname=I6#
}
N 11700 3600 11500 3600 4
{
T 11450 3600 5 10 1 1 0 7 1
netname=I7
}
C 9800 7900 1 0 0 nor.sym
{
T 10200 8400 5 10 1 1 0 4 1
refdes=A1
}
C 9800 6500 1 0 0 nor.sym
{
T 10200 7000 5 10 1 1 0 4 1
refdes=A2
}
C 7800 700 1 0 0 2n7002.sym
{
T 8025 1000 5 8 1 1 0 1 1
refdes=M12
T 7900 1500 5 10 0 1 0 0 1
value=2N7002P
T 8300 1300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 1300 5 10 0 1 0 0 1
device=NMOS
}
C 9200 100 1 0 1 2n7002.sym
{
T 8975 400 5 8 1 1 0 7 1
refdes=M15
T 9100 900 5 10 0 1 0 6 1
value=2N7002P
T 8700 700 5 10 0 1 0 6 1
footprint=sot23-nmos
T 7700 700 5 10 0 1 0 6 1
device=NMOS
}
N 7800 1000 7600 1000 4
{
T 7550 1000 5 10 1 1 0 7 1
netname=I4
}
N 9200 400 9400 400 4
{
T 9450 400 5 10 1 1 0 1 1
netname=I6#
}
C 10500 -100 1 0 1 gnd-1.sym
N 7800 400 7600 400 4
{
T 7550 400 5 10 1 1 0 7 1
netname=I2#
}
C 10800 1300 1 0 1 2n7002.sym
{
T 10700 2100 5 10 0 1 0 6 1
value=2N7002P
T 10300 1900 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 1900 5 10 0 1 0 6 1
device=NMOS
T 10575 1600 5 8 1 1 0 7 1
refdes=M16
}
C 9200 700 1 0 1 2n7002.sym
{
T 9100 1500 5 10 0 1 0 6 1
value=2N7002P
T 8700 1300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 7700 1300 5 10 0 1 0 6 1
device=NMOS
T 8975 1000 5 8 1 1 0 7 1
refdes=M14
}
C 10800 100 1 0 1 2n7002.sym
{
T 10700 900 5 10 0 1 0 6 1
value=2N7002P
T 10300 700 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 700 5 10 0 1 0 6 1
device=NMOS
T 10575 400 5 8 1 1 0 7 1
refdes=M18
}
C 10800 700 1 0 1 2n7002.sym
{
T 10700 1500 5 10 0 1 0 6 1
value=2N7002P
T 10300 1300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 1300 5 10 0 1 0 6 1
device=NMOS
T 10575 1000 5 8 1 1 0 7 1
refdes=M17
}
N 11000 400 10800 400 4
{
T 11050 400 5 10 1 1 0 1 1
netname=I67#
}
N 9400 1000 9200 1000 4
{
T 9450 1000 5 10 1 1 0 1 1
netname=I6
}
N 10800 1600 11000 1600 4
{
T 11050 1600 5 10 1 1 0 1 1
netname=I2
}
N 10800 1000 11000 1000 4
{
T 11050 1000 5 10 1 1 0 1 1
netname=I4#
}
N 10400 1900 9600 1900 4
N 10400 800 10400 600 4
C 7800 100 1 0 0 2n7002.sym
{
T 7900 900 5 10 0 1 0 0 1
value=2N7002P
T 8300 700 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 700 5 10 0 1 0 0 1
device=NMOS
T 8025 400 5 8 1 1 0 1 1
refdes=M13
}
N 7600 8600 7400 8600 4
{
T 7350 8600 5 10 1 1 0 7 1
netname=O3
}
N 7600 7700 7400 7700 4
{
T 7350 7700 5 10 1 1 0 7 1
netname=O5
}
N 7600 6800 7400 6800 4
{
T 7350 6800 5 10 1 1 0 7 1
netname=O6
}
N 10400 1200 10400 1400 4
N 9600 3000 8200 3000 4
N 8200 800 8200 600 4
C 12300 800 1 0 0 2n7002.sym
{
T 12525 1100 5 8 1 1 0 1 1
refdes=M1
T 12400 1600 5 8 0 1 0 0 1
value=2N7002P
T 12800 1400 5 8 0 1 0 0 1
footprint=sot23-nmos
T 13800 1400 5 8 0 1 0 0 1
device=NMOS
}
C 13200 800 1 0 0 2n7002.sym
{
T 13425 1100 5 8 1 1 0 1 1
refdes=M2
T 13300 1600 5 8 0 1 0 0 1
value=2N7002P
T 13700 1400 5 8 0 1 0 0 1
footprint=sot23-nmos
T 14700 1400 5 8 0 1 0 0 1
device=NMOS
}
C 14400 800 1 0 1 2n7002.sym
{
T 14175 1100 5 8 1 1 0 7 1
refdes=M3
T 14300 1600 5 8 0 1 0 6 1
value=2N7002P
T 13900 1400 5 8 0 1 0 6 1
footprint=sot23-nmos
T 12900 1400 5 8 0 1 0 6 1
device=NMOS
}
C 12300 200 1 0 0 2n7002.sym
{
T 12525 500 5 8 1 1 0 1 1
refdes=M4
T 12400 1000 5 8 0 1 0 0 1
value=2N7002P
T 12800 800 5 8 0 1 0 0 1
footprint=sot23-nmos
T 13800 800 5 8 0 1 0 0 1
device=NMOS
}
C 13200 200 1 0 0 2n7002.sym
{
T 13425 500 5 8 1 1 0 1 1
refdes=M5
T 13300 1000 5 8 0 1 0 0 1
value=2N7002P
T 13700 800 5 8 0 1 0 0 1
footprint=sot23-nmos
T 14700 800 5 8 0 1 0 0 1
device=NMOS
}
C 14400 200 1 0 1 2n7002.sym
{
T 14175 500 5 8 1 1 0 7 1
refdes=M6
T 14300 1000 5 8 0 1 0 6 1
value=2N7002P
T 13900 800 5 8 0 1 0 6 1
footprint=sot23-nmos
T 12900 800 5 8 0 1 0 6 1
device=NMOS
}
C 15100 200 1 0 1 2n7002.sym
{
T 14875 500 5 8 1 1 0 7 1
refdes=M7
T 15000 1000 5 8 0 1 0 6 1
value=2N7002P
T 14600 800 5 8 0 1 0 6 1
footprint=sot23-nmos
T 13600 800 5 8 0 1 0 6 1
device=NMOS
}
C 15800 200 1 0 1 2n7002.sym
{
T 15575 500 5 8 1 1 0 7 1
refdes=M8
T 15700 1000 5 8 0 1 0 6 1
value=2N7002P
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
value=3.3k
}
N 12700 700 12700 900 4
N 12700 800 15400 800 4
N 15400 800 15400 700 4
N 14700 700 14700 800 4
N 14000 700 14000 800 4
N 14000 900 14000 800 4
N 13600 700 13600 800 4
N 13600 800 13600 900 4
N 12700 1300 12700 1400 4
N 12700 1400 14000 1400 4
{
T 13000 1400 5 10 1 1 0 0 1
netname=CW
}
N 14000 1400 14000 1300 4
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
N 14400 1100 14400 1300 4
{
T 14400 1350 5 10 1 1 0 3 1
netname=I5
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
C 13500 0 1 0 0 gnd-1.sym
C 13900 0 1 0 0 gnd-1.sym
C 14600 0 1 0 0 gnd-1.sym
C 15300 0 1 0 0 gnd-1.sym
N 1500 8300 1300 8300 4
{
T 1250 8300 5 10 1 1 0 7 1
netname=O3
}
N 1500 7900 1300 7900 4
{
T 1250 7900 5 10 1 1 0 7 1
netname=O3#
}
N 1700 7500 1500 7500 4
{
T 1450 7500 5 10 1 1 0 7 1
netname=O4
}
N 10100 5100 9600 5100 4
{
T 9550 5100 5 10 1 1 0 7 1
netname=I2#
}
B 6900 0 4800 3100 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
B 11700 0 4300 2600 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 2700 7600 1 0 0 xnor.sym
{
T 2900 8200 5 10 1 1 0 0 1
refdes=S2
}
N 3300 900 3500 900 4
{
T 3250 900 5 10 1 1 0 7 1
netname=I5#
}
N 3300 700 3500 700 4
{
T 3250 700 5 10 1 1 0 7 1
netname=I6
}
N 3300 300 3800 300 4
{
T 3250 300 5 10 1 1 0 7 1
netname=I7
}
N 4100 2300 4300 2300 4
{
T 4050 2300 5 10 1 1 0 7 1
netname=I4#
}
C 4400 2700 1 0 0 vdd-1.sym
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
C 5500 2100 1 0 0 out-1.sym
{
T 5500 2400 5 10 0 0 0 0 1
device=OUTPUT
T 5500 2600 5 10 0 0 0 0 1
footprint=anchor
T 6100 2200 5 10 1 1 0 1 1
refdes=MW
}
C 7200 3600 1 0 0 nor4.sym
{
T 7600 4100 5 10 1 1 0 4 1
refdes=L8
}
C 8000 4000 1 0 0 out-1.sym
{
T 8000 4300 5 10 0 0 0 0 1
device=OUTPUT
T 8000 4500 5 10 0 0 0 0 1
footprint=anchor
T 8600 4100 5 10 1 1 0 1 1
refdes=IN
}
N 7000 3800 7200 3800 4
{
T 6950 3800 5 10 1 1 0 7 1
netname=I7#
}
N 7000 4000 7200 4000 4
{
T 6950 4000 5 10 1 1 0 7 1
netname=I6
}
N 7000 4200 7200 4200 4
{
T 6950 4200 5 10 1 1 0 7 1
netname=I5#
}
N 7000 4400 7200 4400 4
{
T 6950 4400 5 10 1 1 0 7 1
netname=I3
}
C 7300 4600 1 0 0 vdd-1.sym
C 7600 3300 1 0 1 gnd-1.sym
C 14200 4300 1 0 0 vdd-1.sym
N 14400 3300 13900 3300 4
{
T 13850 3300 5 10 1 1 0 7 1
netname=CW
}
N 14100 3700 13900 3700 4
{
T 13850 3700 5 10 1 1 0 7 1
netname=I67#
}
N 14100 3900 13900 3900 4
{
T 13850 3900 5 10 1 1 0 7 1
netname=I3
}
C 5500 4600 1 0 0 out-1.sym
{
T 5500 4900 5 10 0 0 0 0 1
device=OUTPUT
T 5500 5100 5 10 0 0 0 0 1
footprint=anchor
T 6100 4700 5 10 1 1 0 1 1
refdes=MR#
}
C 13600 1800 1 0 0 out-1.sym
{
T 14200 1900 5 14 1 1 0 1 1
refdes=CW
T 13600 2300 5 10 0 0 0 0 1
footprint=anchor
T 13600 2100 5 10 0 0 0 0 1
device=OUTPUT
}
N 13600 1400 13600 1900 4
C 14900 6800 1 0 0 out-1.sym
{
T 14900 7100 5 10 0 0 0 0 1
device=OUTPUT
T 14900 7300 5 10 0 0 0 0 1
footprint=anchor
T 15500 6900 5 10 1 1 0 1 1
refdes=OR
}
C 900 8400 1 0 0 in-1.sym
{
T 900 8700 5 10 0 0 0 0 1
device=INPUT
T 900 8900 5 10 0 0 0 0 1
footprint=anchor
T 900 8500 5 10 1 1 0 7 1
refdes=Zo#
}
C 900 8000 1 0 0 in-1.sym
{
T 900 8300 5 10 0 0 0 0 1
device=INPUT
T 900 8500 5 10 0 0 0 0 1
footprint=anchor
T 900 8100 5 10 1 1 0 7 1
refdes=Co#
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
C 7200 1500 1 0 0 in-1.sym
{
T 7200 1800 5 10 0 0 0 0 1
device=INPUT
T 7200 2000 5 10 0 0 0 0 1
footprint=anchor
T 7200 1600 5 10 1 1 0 7 1
refdes=Co
}
N 8800 600 8800 800 4
N 8800 1200 8800 1900 4
C 14900 3700 1 0 0 out-1.sym
{
T 15500 3800 5 10 1 1 0 1 1
refdes=ZW
T 14900 4200 5 10 0 0 0 0 1
footprint=anchor
T 14900 4000 5 10 0 0 0 0 1
device=OUTPUT
}
C 7800 1300 1 0 0 2n7002.sym
{
T 8025 1600 5 8 1 1 0 1 1
refdes=M11
T 7900 2100 5 10 0 1 0 0 1
value=2N7002P
T 8300 1900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 1900 5 10 0 1 0 0 1
device=NMOS
}
C 7800 1900 1 0 0 2n7002.sym
{
T 7900 2700 5 10 0 1 0 0 1
value=2N7002P
T 8300 2500 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 2500 5 10 0 1 0 0 1
device=NMOS
T 8025 2200 5 8 1 1 0 1 1
refdes=M10
}
C 7800 2500 1 0 0 2n7002.sym
{
T 7900 3300 5 10 0 1 0 0 1
value=2N7002P
T 8300 3100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 3100 5 10 0 1 0 0 1
device=NMOS
T 8025 2800 5 8 1 1 0 1 1
refdes=M9
}
N 7600 2800 7800 2800 4
{
T 7550 2800 5 10 1 1 0 7 1
netname=I3#
}
N 7600 2200 7800 2200 4
{
T 7550 2200 5 10 1 1 0 7 1
netname=I7
}
N 8200 2600 8200 2400 4
N 8800 1900 8200 1900 4
C 8100 -100 1 0 0 gnd-1.sym
C 8700 -100 1 0 0 gnd-1.sym
N 8200 1800 8200 2000 4
N 8200 1200 8200 1400 4
C 10400 1800 1 0 0 out-1.sym
{
T 11000 1900 5 14 1 1 0 1 1
refdes=CoE#
T 10400 2300 5 10 0 0 0 0 1
footprint=anchor
T 10400 2100 5 10 0 0 0 0 1
device=OUTPUT
}
N 9600 1900 9600 3000 4
C 10100 1900 1 90 0 resistor-load.sym
{
T 9700 2200 5 10 0 0 90 0 1
device=RESISTOR
T 10000 2300 5 10 0 1 90 0 1
footprint=0603-boxed
T 10000 2300 5 10 0 1 90 0 1
value=3.3k
T 9950 2550 5 10 1 1 90 0 1
refdes=R3
}
C 9800 2800 1 0 0 vdd-1.sym
N 10400 1800 10400 1900 4
N 8200 700 8800 700 4
B 400 5400 8500 3700 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 8800 5500 9 12 1 0 0 6 1
Branch Control
T 11800 8900 9 12 1 0 0 0 1
Arithmetic Control
L 8900 3100 8900 5400 5 0 1 0 -1 -1
T 7700 5200 9 12 1 0 0 0 1
Misc. Logic
C 13300 5600 1 0 0 gnd-1.sym
C 13200 6900 1 0 0 vdd-1.sym
C 13100 5900 1 0 0 nand.sym
{
T 13500 6400 5 10 1 1 0 4 1
refdes=A8
}
N 13100 6500 12900 6500 4
{
T 12850 6500 5 10 1 1 0 7 1
netname=I6
}
N 13100 6300 12900 6300 4
{
T 12850 6300 5 10 1 1 0 7 1
netname=I7
}
N 14900 6900 13900 6900 4
C 14900 5000 1 0 0 out-1.sym
{
T 14900 5300 5 10 0 0 0 0 1
device=OUTPUT
T 14900 5500 5 10 0 0 0 0 1
footprint=anchor
T 15500 5100 5 10 1 1 0 1 1
refdes=QE
}
C 14300 5400 1 0 0 vdd-1.sym
C 6800 6500 1 90 1 phi1.sym
C 6300 5600 1 0 0 notp.sym
{
T 6650 5900 5 10 1 1 0 4 1
refdes=N4
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
B 400 0 15600 9100 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 900 1900 1 0 0 in-1.sym
{
T 900 2000 5 10 1 1 0 7 1
refdes=ϕ0
T 900 2400 5 10 0 0 0 0 1
footprint=anchor
T 900 2200 5 10 0 0 0 0 1
device=INPUT
}
C 1800 1900 1 0 1 phi0.sym
N 3300 7900 3500 7900 4
C 11700 3300 1 0 0 not.sym
{
T 12050 3600 5 10 1 1 0 4 1
refdes=N7
}
C 9800 5100 1 0 0 nand.sym
{
T 10200 5600 5 10 1 1 0 4 1
refdes=A3
}
C 4700 200 1 0 0 nor.sym
{
T 5100 700 5 10 1 1 0 4 1
refdes=L1
}
N 4500 600 4700 600 4
{
T 4450 600 5 10 1 1 0 7 1
netname=I4
}
N 4300 800 4700 800 4
C 4900 -100 1 0 0 gnd-1.sym
C 5100 1500 1 90 1 phi1.sym
N 4300 2100 4300 800 4
C 3600 1300 1 0 0 vdd-1.sym
C 3500 300 1 0 0 nand.sym
{
T 3900 800 5 10 1 1 0 4 1
refdes=L2
}
N 5300 3500 5300 2200 4
{
T 5300 2600 5 10 1 1 180 8 1
netname=MW
}
C 4000 5200 1 0 0 vdd-1.sym
N 3700 3800 3900 3800 4
{
T 3650 3800 5 10 1 1 0 7 1
netname=I6
}
N 3700 3600 3900 3600 4
{
T 3650 3600 5 10 1 1 0 7 1
netname=I5
}
N 3700 4800 3900 4800 4
{
T 3650 4800 5 10 1 1 0 7 1
netname=I7
}
N 3700 4600 3900 4600 4
{
T 3650 4600 5 10 1 1 0 7 1
netname=I23
}
C 3900 3200 1 0 0 norod.sym
{
T 4300 3700 5 10 1 1 0 4 1
refdes=L4
}
N 4200 4200 4700 4200 4
N 4700 4200 4700 3700 4
N 4900 3300 4900 3200 4
C 5300 3200 1 0 1 2n7002.sym
{
T 5075 3500 5 8 1 1 0 7 1
refdes=M20
T 5200 4000 5 10 0 1 0 6 1
value=2N7002P
T 4800 3800 5 10 0 1 0 6 1
footprint=sot23-nmos
T 3800 3800 5 10 0 1 0 6 1
device=NMOS
}
N 4700 4700 5500 4700 4
N 4900 4700 4900 3700 4
N 14900 3800 14900 4600 4
N 14900 4600 14500 4600 4
N 13900 5100 14100 5100 4
{
T 13850 5100 5 10 1 1 0 7 1
netname=AR#
}
C 14100 3300 1 0 0 nor.sym
{
T 14500 3800 5 10 1 1 0 4 1
refdes=A7
}
N 11400 8400 11400 8100 4
{
T 11400 8100 5 10 1 1 180 6 1
netname=AR#
}
C 14100 4800 1 0 0 not.sym
{
T 14450 5100 5 10 1 1 0 4 1
refdes=A6
}
N 14500 4600 14500 4800 4
N 14700 6600 14900 6600 4
{
T 14950 6600 5 10 1 1 0 1 1
netname=I2
}
N 14700 6400 14900 6400 4
{
T 14950 6400 5 10 1 1 0 1 1
netname=I3#
}
N 14700 6200 14900 6200 4
{
T 14950 6200 5 10 1 1 0 1 1
netname=I4
}
C 14700 5900 1 0 1 nor3od.sym
{
T 14300 6400 5 10 1 1 0 4 1
refdes=A9
}
C 14300 5600 1 0 0 gnd-1.sym
N 13900 6900 13900 6400 4
C 5100 5600 1 0 0 not.sym
{
T 5450 5900 5 10 1 1 0 4 1
refdes=S6
}
C 3900 4200 1 0 0 nand.sym
{
T 4300 4700 5 10 1 1 0 4 1
refdes=L5
}
C 4100 2900 1 0 0 gnd-1.sym
C 4300 1700 1 0 0 nor.sym
{
T 4700 2200 5 10 1 1 0 4 1
refdes=L3
}
N 5100 2200 5500 2200 4
C 4500 1400 1 0 0 gnd-1.sym
C 4800 2900 1 0 0 gnd-1.sym
