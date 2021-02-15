v 20201216 2
C 500 6200 1 0 0 in-1.sym
{
T 500 6700 5 10 0 0 0 0 1
footprint=anchor
T 500 6500 5 10 0 0 0 0 1
device=INPUT
T 500 6300 5 10 1 1 0 7 1
refdes=O5
}
C 500 6800 1 0 0 in-1.sym
{
T 500 7300 5 10 0 0 0 0 1
footprint=anchor
T 500 7100 5 10 0 0 0 0 1
device=INPUT
T 500 6900 5 10 1 1 0 7 1
refdes=O2
}
C 500 6600 1 0 0 in-1.sym
{
T 500 7100 5 10 0 0 0 0 1
footprint=anchor
T 500 6900 5 10 0 0 0 0 1
device=INPUT
T 500 6700 5 10 1 1 0 7 1
refdes=O3
}
C 500 6400 1 0 0 in-1.sym
{
T 500 6900 5 10 0 0 0 0 1
footprint=anchor
T 500 6700 5 10 0 0 0 0 1
device=INPUT
T 500 6500 5 10 1 1 0 7 1
refdes=O4
}
C 500 6000 1 0 0 in-1.sym
{
T 500 6500 5 10 0 0 0 0 1
footprint=anchor
T 500 6300 5 10 0 0 0 0 1
device=INPUT
T 500 6100 5 10 1 1 0 7 1
refdes=O6
}
C 500 5800 1 0 0 in-1.sym
{
T 500 6300 5 10 0 0 0 0 1
footprint=anchor
T 500 6100 5 10 0 0 0 0 1
device=INPUT
T 500 5900 5 10 1 1 0 7 1
refdes=O7
}
N 1100 6700 1300 6700 4
{
T 1350 6700 5 10 1 1 0 1 1
netname=O3
}
N 4100 9100 4300 9100 4
{
T 4050 9100 5 10 1 1 0 7 1
netname=O6#
}
N 1300 6500 1100 6500 4
{
T 1350 6500 5 10 1 1 0 1 1
netname=O4
}
N 2000 8800 2700 8800 4
{
T 2250 8850 5 10 1 1 0 0 1
netname=Flag
}
N 3500 8700 4300 8700 4
{
T 3650 8700 5 10 1 1 0 2 1
netname=Cond#
}
C 5900 8900 1 0 0 out-1.sym
{
T 5900 9400 5 10 0 0 0 0 1
footprint=anchor
T 5900 9200 5 10 0 0 0 0 1
device=OUTPUT
T 6050 9050 5 10 1 1 0 0 1
refdes=Ret
}
N 4300 7700 4300 8700 4
C 4300 7100 1 0 0 nor.sym
{
T 4700 7600 5 10 1 1 0 4 1
refdes=S4
}
C 5900 7500 1 0 0 out-1.sym
{
T 5900 8000 5 10 0 0 0 0 1
footprint=anchor
T 5900 7800 5 10 0 0 0 0 1
device=OUTPUT
T 5950 7650 5 10 1 1 0 0 1
refdes=Jump
}
C 7100 6400 1 0 0 out-1.sym
{
T 7100 6900 5 10 0 0 0 0 1
footprint=anchor
T 7100 6700 5 10 0 0 0 0 1
device=OUTPUT
T 7150 6550 5 10 1 1 0 0 1
refdes=VPush
}
C 5100 7800 1 0 0 nor.sym
{
T 5500 8300 5 10 1 1 0 4 1
refdes=S5
}
N 5100 9000 5100 8400 4
N 5100 6600 5100 8200 4
C 5900 8200 1 0 0 out-1.sym
{
T 5900 8700 5 10 0 0 0 0 1
footprint=anchor
T 5900 8500 5 10 0 0 0 0 1
device=OUTPUT
T 6050 8350 5 10 1 1 0 0 1
refdes=Inc
}
C 2900 7900 1 0 0 gnd-1.sym
C 5300 5700 1 0 0 gnd-1.sym
C 4500 6800 1 0 0 gnd-1.sym
C 5300 7500 1 0 0 gnd-1.sym
C 4500 8200 1 0 0 gnd-1.sym
C 1400 9300 1 0 0 vdd-1.sym
C 2800 9200 1 0 0 vdd-1.sym
C 4400 9500 1 0 0 vdd-1.sym
C 5200 8800 1 0 0 vdd-1.sym
C 4400 8100 1 0 0 vdd-1.sym
C 5200 7000 1 0 0 vdd-1.sym
N 5100 6400 4900 6400 4
{
T 4850 6400 5 10 1 1 0 7 1
netname=O5
}
N 2700 8600 2300 8600 4
{
T 2500 8600 5 10 1 1 0 5 1
netname=O2
}
C 4300 8500 1 0 0 nor4.sym
{
T 4700 9000 5 10 1 1 0 4 1
refdes=S3
}
N 5900 7600 5100 7600 4
N 4100 8900 4300 8900 4
{
T 4050 8900 5 10 1 1 0 7 1
netname=O7
}
N 5900 9000 5100 9000 4
{
T 5400 9000 5 10 1 1 0 0 1
netname=Ret
}
C 5100 6000 1 0 0 nand.sym
{
T 5500 6500 5 10 1 1 0 4 1
refdes=S6
}
C 6600 5900 1 0 0 gnd-1.sym
C 500 5200 1 0 0 in-1.sym
{
T 500 5700 5 10 0 0 0 0 1
footprint=anchor
T 500 5500 5 10 0 0 0 0 1
device=INPUT
T 500 5300 5 10 1 1 0 7 1
refdes=Vdd
}
C 500 5000 1 0 0 in-1.sym
{
T 500 5500 5 10 0 0 0 0 1
footprint=anchor
T 500 5300 5 10 0 0 0 0 1
device=INPUT
T 500 5100 5 10 1 1 0 7 1
refdes=GND
}
C 900 5300 1 0 0 vdd-1.sym
C 1000 4800 1 0 0 gnd-1.sym
N 4100 9300 4300 9300 4
{
T 4050 9300 5 10 1 1 0 7 1
netname=O5#
}
N 1100 6900 1300 6900 4
{
T 1350 6900 5 10 1 1 0 1 1
netname=O2
}
N 1100 6300 1300 6300 4
{
T 1350 6300 5 10 1 1 0 1 1
netname=O5
}
N 1100 6100 1300 6100 4
{
T 1350 6100 5 10 1 1 0 1 1
netname=O6
}
N 1100 5900 1300 5900 4
{
T 1350 5900 5 10 1 1 0 1 1
netname=O7
}
C 1500 7600 1 0 0 gnd-1.sym
C 1000 8300 1 0 0 nandor.sym
{
T 1650 8800 5 10 1 1 0 4 1
refdes=S1
}
T 5400 7400 9 10 1 0 0 0 1
(includes call)
C 500 4000 1 0 0 in-1.sym
{
T 500 4300 5 10 0 0 0 0 1
device=INPUT
T 500 4500 5 10 0 0 0 0 1
footprint=anchor
T 500 4100 5 10 1 1 0 7 1
refdes=I3#
}
C 500 4200 1 0 0 in-1.sym
{
T 500 4500 5 10 0 0 0 0 1
device=INPUT
T 500 4700 5 10 0 0 0 0 1
footprint=anchor
T 500 4300 5 10 1 1 0 7 1
refdes=I3
}
C 500 3600 1 0 0 in-1.sym
{
T 500 3900 5 10 0 0 0 0 1
device=INPUT
T 500 3700 5 10 1 1 0 7 1
refdes=I4#
T 500 4100 5 10 0 0 0 0 1
footprint=anchor
}
C 500 3800 1 0 0 in-1.sym
{
T 500 4100 5 10 0 0 0 0 1
device=INPUT
T 500 3900 5 10 1 1 0 7 1
refdes=I4
T 500 4300 5 10 0 0 0 0 1
footprint=anchor
}
C 500 3400 1 0 0 in-1.sym
{
T 500 3700 5 10 0 0 0 0 1
device=INPUT
T 500 3900 5 10 0 0 0 0 1
footprint=anchor
T 500 3500 5 10 1 1 0 7 1
refdes=I5
}
C 500 3200 1 0 0 in-1.sym
{
T 500 3500 5 10 0 0 0 0 1
device=INPUT
T 500 3700 5 10 0 0 0 0 1
footprint=anchor
T 500 3300 5 10 1 1 0 7 1
refdes=I5#
}
C 500 3000 1 0 0 in-1.sym
{
T 500 3300 5 10 0 0 0 0 1
device=INPUT
T 500 3100 5 10 1 1 0 7 1
refdes=I6
T 500 3500 5 10 0 0 0 0 1
footprint=anchor
}
C 500 2800 1 0 0 in-1.sym
{
T 500 3100 5 10 0 0 0 0 1
device=INPUT
T 500 2900 5 10 1 1 0 7 1
refdes=I6#
T 500 3300 5 10 0 0 0 0 1
footprint=anchor
}
C 500 2600 1 0 0 in-1.sym
{
T 500 2900 5 10 0 0 0 0 1
device=INPUT
T 500 3100 5 10 0 0 0 0 1
footprint=anchor
T 500 2700 5 10 1 1 0 7 1
refdes=I7
}
C 500 2400 1 0 0 in-1.sym
{
T 500 2700 5 10 0 0 0 0 1
device=INPUT
T 500 2900 5 10 0 0 0 0 1
footprint=anchor
T 500 2500 5 10 1 1 0 7 1
refdes=I7#
}
N 1100 4100 1300 4100 4
{
T 1350 4100 5 10 1 1 0 1 1
netname=I3#
}
N 1100 4300 1300 4300 4
{
T 1350 4300 5 10 1 1 0 1 1
netname=I3
}
N 1100 3700 1300 3700 4
{
T 1350 3700 5 10 1 1 0 1 1
netname=I4#
}
N 1100 3900 1300 3900 4
{
T 1350 3900 5 10 1 1 0 1 1
netname=I4
}
N 1100 3500 1300 3500 4
{
T 1350 3500 5 10 1 1 0 1 1
netname=I5
}
N 1100 3300 1300 3300 4
{
T 1350 3300 5 10 1 1 0 1 1
netname=I5#
}
N 1100 3100 1300 3100 4
{
T 1350 3100 5 10 1 1 0 1 1
netname=I6
}
N 1100 2900 1300 2900 4
{
T 1350 2900 5 10 1 1 0 1 1
netname=I6#
}
N 1100 2700 1300 2700 4
{
T 1350 2700 5 10 1 1 0 1 1
netname=I7
}
N 1100 2500 1300 2500 4
{
T 1350 2500 5 10 1 1 0 1 1
netname=I7#
}
C 14900 8200 1 0 0 out-1.sym
{
T 14900 8500 5 10 0 0 0 0 1
device=OUTPUT
T 15500 8300 5 10 1 1 0 1 1
refdes=AND
T 14900 8700 5 10 0 0 0 0 1
footprint=anchor
}
C 12600 3100 1 0 0 gnd-1.sym
C 12700 5300 1 0 0 vdd-1.sym
C 10600 7600 1 0 0 out-1.sym
{
T 10600 7900 5 10 0 0 0 0 1
device=OUTPUT
T 10600 8100 5 10 0 0 0 0 1
footprint=anchor
T 11200 7700 5 10 1 1 0 1 1
refdes=AS
}
N 9600 7800 9800 7800 4
{
T 9550 7800 5 10 1 1 0 7 1
netname=I2#
}
N 9800 7600 9600 7600 4
{
T 9550 7600 5 10 1 1 0 7 1
netname=I67#
}
C 10000 6900 1 0 0 gnd-1.sym
C 9900 8200 1 0 0 vdd-1.sym
C 11400 8900 1 0 0 out-1.sym
{
T 11400 9200 5 10 0 0 0 0 1
device=OUTPUT
T 11400 9400 5 10 0 0 0 0 1
footprint=anchor
T 12000 9000 5 10 1 1 0 1 1
refdes=AR#
}
C 10600 6300 1 0 0 out-1.sym
{
T 10600 6600 5 10 0 0 0 0 1
device=OUTPUT
T 10600 6800 5 10 0 0 0 0 1
footprint=anchor
T 11200 6400 5 10 1 1 0 1 1
refdes=N#
}
C 9900 6900 1 0 0 vdd-1.sym
N 9800 6500 9600 6500 4
{
T 9550 6500 5 10 1 1 0 7 1
netname=I67#
}
N 9800 6300 9600 6300 4
{
T 9550 6300 5 10 1 1 0 7 1
netname=I3#
}
N 14100 8900 14100 8300 4
C 14400 8300 1 0 0 gnd-1.sym
C 14300 9200 1 0 0 vdd-1.sym
C 14900 8800 1 0 0 out-1.sym
{
T 14900 9100 5 10 0 0 0 0 1
device=OUTPUT
T 15500 8900 5 10 1 1 0 1 1
refdes=CS#
T 14900 9300 5 10 0 0 0 0 1
footprint=anchor
}
C 10600 8700 1 0 0 cnot.sym
{
T 10925 9000 5 10 1 1 0 4 1
refdes=A2
}
C 10900 8400 1 0 0 gnd-1.sym
C 10800 9300 1 0 0 vdd-1.sym
N 14900 8300 14100 8300 4
C 500 4400 1 0 0 in-1.sym
{
T 500 4700 5 10 0 0 0 0 1
device=INPUT
T 500 4900 5 10 0 0 0 0 1
footprint=anchor
T 500 4500 5 10 1 1 0 7 1
refdes=I2#
}
C 500 4600 1 0 0 in-1.sym
{
T 500 4900 5 10 0 0 0 0 1
device=INPUT
T 500 5100 5 10 0 0 0 0 1
footprint=anchor
T 500 4700 5 10 1 1 0 7 1
refdes=I2
}
N 1100 4500 1300 4500 4
{
T 1350 4500 5 10 1 1 0 1 1
netname=I2#
}
N 1100 4700 1300 4700 4
{
T 1350 4700 5 10 1 1 0 1 1
netname=I2
}
C 14100 8600 1 0 0 cnot.sym
{
T 14425 8900 5 10 1 1 0 4 1
refdes=A8
}
N 8200 4000 8400 4000 4
{
T 8450 4000 5 10 1 1 0 1 1
netname=I67#
}
C 5600 1000 1 180 1 out-1.sym
{
T 5600 700 5 10 0 0 0 2 1
device=OUTPUT
T 5600 500 5 10 0 0 0 2 1
footprint=anchor
T 6250 900 5 10 1 1 0 1 1
refdes=OUT
}
N 9800 8900 9600 8900 4
{
T 9550 8900 5 10 1 1 0 7 1
netname=I67#
}
N 9800 9100 9600 9100 4
{
T 9550 9100 5 10 1 1 0 7 1
netname=I2
}
C 9900 9500 1 0 0 vdd-1.sym
C 10000 8200 1 0 0 gnd-1.sym
C 7600 8900 1 0 0 not.sym
{
T 7950 9200 5 10 1 1 0 4 1
refdes=N3
}
C 7800 9500 1 0 0 vdd-1.sym
C 8100 8600 1 0 1 gnd-1.sym
C 7600 8000 1 0 0 not.sym
{
T 7950 8300 5 10 1 1 0 4 1
refdes=N5
}
C 7800 8600 1 0 0 vdd-1.sym
C 8100 7700 1 0 1 gnd-1.sym
C 7600 7100 1 0 0 not.sym
{
T 7950 7400 5 10 1 1 0 4 1
refdes=N6
}
C 7800 7700 1 0 0 vdd-1.sym
C 8100 6800 1 0 1 gnd-1.sym
N 8400 9200 8600 9200 4
{
T 8400 9200 5 10 1 1 0 0 1
netname=O3#
}
N 8600 8300 8400 8300 4
{
T 8400 8300 5 10 1 1 0 0 1
netname=O5#
}
N 8400 7400 8600 7400 4
{
T 8400 7400 5 10 1 1 0 0 1
netname=O6#
}
C 1200 7800 1 0 0 2n7002.sym
{
T 1425 8100 5 10 1 1 0 1 1
refdes=M28
T 1300 8600 5 10 0 1 0 0 1
value=2N7002P
T 1700 8400 5 10 0 1 0 0 1
footprint=sot23-nmos
T 2700 8400 5 10 0 1 0 0 1
device=NMOS
}
C 13300 7800 1 0 0 nor.sym
{
T 13700 8300 5 10 1 1 0 4 1
refdes=A7
}
N 13300 8400 13100 8400 4
{
T 13050 8400 5 10 1 1 0 7 1
netname=I2#
}
N 13300 8200 13100 8200 4
{
T 13050 8200 5 10 1 1 0 7 1
netname=I3#
}
C 13400 8800 1 0 0 vdd-1.sym
C 13700 7500 1 0 1 gnd-1.sym
C 9800 4600 1 0 0 nor.sym
{
T 10200 5100 5 10 1 1 0 4 1
refdes=A5
}
N 9800 5200 9600 5200 4
{
T 9550 5200 5 10 1 1 0 7 1
netname=I2
}
N 9800 5000 9600 5000 4
{
T 9550 5000 5 10 1 1 0 7 1
netname=I3#
}
C 9900 5600 1 0 0 vdd-1.sym
C 10200 4300 1 0 1 gnd-1.sym
C 10600 5000 1 0 0 out-1.sym
{
T 10600 5300 5 10 0 0 0 0 1
device=OUTPUT
T 10600 5500 5 10 0 0 0 0 1
footprint=anchor
T 11200 5100 5 10 1 1 0 1 1
refdes=CR
}
C 7600 4300 1 0 0 vdd-1.sym
N 7800 3700 7200 3700 4
{
T 7150 3700 5 10 1 1 0 7 1
netname=I6#
}
N 7400 4000 7200 4000 4
{
T 7150 4000 5 10 1 1 0 7 1
netname=I7
}
C 9800 8500 1 0 0 nor.sym
{
T 10200 9000 5 10 1 1 0 4 1
refdes=A1
}
C 9800 7200 1 0 0 nor.sym
{
T 10200 7700 5 10 1 1 0 4 1
refdes=A3
}
C 7800 700 1 0 0 2n7002.sym
{
T 8025 1000 5 10 1 1 0 1 1
refdes=M21
T 7900 1500 5 10 0 1 0 0 1
value=2N7002P
T 8300 1300 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 1300 5 10 0 1 0 0 1
device=NMOS
}
C 9200 100 1 0 1 2n7002.sym
{
T 8975 400 5 10 1 1 0 7 1
refdes=M24
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
T 10575 1600 5 10 1 1 0 7 1
refdes=M25
}
C 9200 700 1 0 1 2n7002.sym
{
T 9100 1500 5 10 0 1 0 6 1
value=2N7002P
T 8700 1300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 7700 1300 5 10 0 1 0 6 1
device=NMOS
T 8975 1000 5 10 1 1 0 7 1
refdes=M23
}
C 10800 100 1 0 1 2n7002.sym
{
T 10700 900 5 10 0 1 0 6 1
value=2N7002P
T 10300 700 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 700 5 10 0 1 0 6 1
device=NMOS
T 10575 400 5 10 1 1 0 7 1
refdes=M27
}
C 10800 700 1 0 1 2n7002.sym
{
T 10700 1500 5 10 0 1 0 6 1
value=2N7002P
T 10300 1300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 9300 1300 5 10 0 1 0 6 1
device=NMOS
T 10575 1000 5 10 1 1 0 7 1
refdes=M26
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
T 8025 400 5 10 1 1 0 1 1
refdes=M22
}
N 7600 9200 7400 9200 4
{
T 7350 9200 5 10 1 1 0 7 1
netname=O3
}
N 7600 8300 7400 8300 4
{
T 7350 8300 5 10 1 1 0 7 1
netname=O5
}
N 7600 7400 7400 7400 4
{
T 7350 7400 5 10 1 1 0 7 1
netname=O6
}
N 10400 1200 10400 1400 4
N 9600 3000 8200 3000 4
N 8200 800 8200 600 4
C 12300 3900 1 0 0 2n7002.sym
{
T 12525 4200 5 10 1 1 0 1 1
refdes=M1
T 12400 4700 5 10 0 1 0 0 1
value=2N7002P
T 12800 4500 5 10 0 1 0 0 1
footprint=sot23-nmos
T 13800 4500 5 10 0 1 0 0 1
device=NMOS
}
C 13200 3900 1 0 0 2n7002.sym
{
T 13425 4200 5 10 1 1 0 1 1
refdes=M2
T 13300 4700 5 10 0 1 0 0 1
value=2N7002P
T 13700 4500 5 10 0 1 0 0 1
footprint=sot23-nmos
T 14700 4500 5 10 0 1 0 0 1
device=NMOS
}
C 14400 3900 1 0 1 2n7002.sym
{
T 14175 4200 5 10 1 1 0 7 1
refdes=M3
T 14300 4700 5 10 0 1 0 6 1
value=2N7002P
T 13900 4500 5 10 0 1 0 6 1
footprint=sot23-nmos
T 12900 4500 5 10 0 1 0 6 1
device=NMOS
}
C 12300 3300 1 0 0 2n7002.sym
{
T 12525 3600 5 10 1 1 0 1 1
refdes=M4
T 12400 4100 5 10 0 1 0 0 1
value=2N7002P
T 12800 3900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 13800 3900 5 10 0 1 0 0 1
device=NMOS
}
C 13200 3300 1 0 0 2n7002.sym
{
T 13425 3600 5 10 1 1 0 1 1
refdes=M5
T 13300 4100 5 10 0 1 0 0 1
value=2N7002P
T 13700 3900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 14700 3900 5 10 0 1 0 0 1
device=NMOS
}
C 14400 3300 1 0 1 2n7002.sym
{
T 14175 3600 5 10 1 1 0 7 1
refdes=M6
T 14300 4100 5 10 0 1 0 6 1
value=2N7002P
T 13900 3900 5 10 0 1 0 6 1
footprint=sot23-nmos
T 12900 3900 5 10 0 1 0 6 1
device=NMOS
}
C 15100 3300 1 0 1 2n7002.sym
{
T 14875 3600 5 10 1 1 0 7 1
refdes=M7
T 15000 4100 5 10 0 1 0 6 1
value=2N7002P
T 14600 3900 5 10 0 1 0 6 1
footprint=sot23-nmos
T 13600 3900 5 10 0 1 0 6 1
device=NMOS
}
C 15800 3300 1 0 1 2n7002.sym
{
T 15575 3600 5 10 1 1 0 7 1
refdes=M8
T 15700 4100 5 10 0 1 0 6 1
value=2N7002P
T 15300 3900 5 10 0 1 0 6 1
footprint=sot23-nmos
T 14300 3900 5 10 0 1 0 6 1
device=NMOS
}
C 13000 4500 1 90 0 resistor-load.sym
{
T 12600 4800 5 10 0 0 90 0 1
device=RESISTOR
T 12850 5150 5 10 1 1 90 0 1
refdes=R1
T 12900 4900 5 10 0 1 90 0 1
footprint=0603-boxed
T 12900 4900 5 10 0 1 90 0 1
value=3.3k
}
N 12700 3800 12700 4000 4
N 12700 3900 15400 3900 4
N 15400 3900 15400 3800 4
N 14700 3800 14700 3900 4
N 14000 3800 14000 3900 4
N 14000 4000 14000 3900 4
N 13600 3800 13600 3900 4
N 13600 3900 13600 4000 4
N 12700 4400 12700 4500 4
N 12700 4500 14000 4500 4
{
T 13000 4500 5 10 1 1 0 0 1
netname=CW
}
N 14000 4500 14000 4400 4
N 13600 4400 13600 4500 4
N 12100 4200 12300 4200 4
{
T 12100 4200 5 10 1 1 0 7 1
netname=I7#
}
N 13000 4200 13200 4200 4
{
T 13200 4100 5 10 1 1 0 7 1
netname=I6
}
N 14400 4200 14400 4400 4
{
T 14400 4450 5 10 1 1 0 3 1
netname=I5
}
N 14400 3600 14400 3400 4
{
T 14400 3350 5 10 1 1 180 3 1
netname=I5#
}
N 12100 3600 12300 3600 4
{
T 12100 3600 5 10 1 1 0 7 1
netname=I7
}
N 13000 3600 13200 3600 4
{
T 13200 3500 5 10 1 1 0 7 1
netname=I6#
}
N 15100 3600 15100 3400 4
{
T 15100 3350 5 10 1 1 180 3 1
netname=I4
}
N 15800 3600 15800 3400 4
{
T 15800 3350 5 10 1 1 180 3 1
netname=I2#
}
C 13500 3100 1 0 0 gnd-1.sym
C 13900 3100 1 0 0 gnd-1.sym
C 14600 3100 1 0 0 gnd-1.sym
C 15300 3100 1 0 0 gnd-1.sym
N 1000 8900 800 8900 4
{
T 750 8900 5 10 1 1 0 7 1
netname=O3
}
N 1000 8500 800 8500 4
{
T 750 8500 5 10 1 1 0 7 1
netname=O3#
}
N 1200 8100 1000 8100 4
{
T 950 8100 5 10 1 1 0 7 1
netname=O4
}
N 10100 5900 9600 5900 4
{
T 9550 5900 5 10 1 1 0 7 1
netname=I2#
}
B 6900 0 4900 3100 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
B 11800 3100 4200 2500 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 2700 8200 1 0 0 xnor.sym
{
T 2900 8800 5 10 1 1 0 0 1
refdes=S2
}
N 3100 1100 3300 1100 4
{
T 3050 1100 5 10 1 1 0 7 1
netname=I5#
}
N 3100 900 3300 900 4
{
T 3050 900 5 10 1 1 0 7 1
netname=I6
}
N 3100 500 3600 500 4
{
T 3050 500 5 10 1 1 0 7 1
netname=I7
}
C 4000 2100 1 0 0 not.sym
{
T 4350 2400 5 10 1 1 0 4 1
refdes=L3
}
N 3800 2400 4000 2400 4
{
T 3750 2400 5 10 1 1 0 7 1
netname=I4
}
C 4200 2700 1 0 0 vdd-1.sym
C 500 1800 1 0 0 in-1.sym
{
T 500 1900 5 10 1 1 0 7 1
refdes=ϕ1
T 500 2300 5 10 0 0 0 0 1
footprint=anchor
T 500 2100 5 10 0 0 0 0 1
device=INPUT
}
C 1400 1800 1 0 1 phi1.sym
C 5300 3000 1 90 1 phi1.sym
C 5100 1800 1 0 0 gnd-1.sym
C 5600 2300 1 0 0 out-1.sym
{
T 5600 2600 5 10 0 0 0 0 1
device=OUTPUT
T 5600 2800 5 10 0 0 0 0 1
footprint=anchor
T 6200 2400 5 10 1 1 0 1 1
refdes=MW
}
C 800 300 1 0 0 nor4.sym
{
T 1200 800 5 10 1 1 0 4 1
refdes=L8
}
C 1600 700 1 0 0 out-1.sym
{
T 1600 1000 5 10 0 0 0 0 1
device=OUTPUT
T 1600 1200 5 10 0 0 0 0 1
footprint=anchor
T 2200 800 5 10 1 1 0 1 1
refdes=IN
}
N 600 500 800 500 4
{
T 550 500 5 10 1 1 0 7 1
netname=I7#
}
N 600 700 800 700 4
{
T 550 700 5 10 1 1 0 7 1
netname=I6
}
N 600 900 800 900 4
{
T 550 900 5 10 1 1 0 7 1
netname=I5#
}
N 600 1100 800 1100 4
{
T 550 1100 5 10 1 1 0 7 1
netname=I3
}
C 900 1300 1 0 0 vdd-1.sym
C 1200 0 1 0 1 gnd-1.sym
C 9900 4300 1 0 0 vdd-1.sym
N 10100 3300 9600 3300 4
{
T 9550 3300 5 10 1 1 0 7 1
netname=CW
}
N 9800 3800 9600 3800 4
{
T 9550 3800 5 10 1 1 0 7 1
netname=I6#
}
N 9800 4000 9600 4000 4
{
T 9550 4000 5 10 1 1 0 7 1
netname=I3
}
C 5600 4300 1 0 0 out-1.sym
{
T 5600 4600 5 10 0 0 0 0 1
device=OUTPUT
T 5600 4800 5 10 0 0 0 0 1
footprint=anchor
T 6200 4400 5 10 1 1 0 1 1
refdes=MR#
}
C 13600 4900 1 0 0 out-1.sym
{
T 14200 5000 5 14 1 1 0 1 1
refdes=CW
T 13600 5400 5 10 0 0 0 0 1
footprint=anchor
T 13600 5200 5 10 0 0 0 0 1
device=OUTPUT
}
N 13600 4500 13600 5000 4
C 14900 6400 1 0 0 out-1.sym
{
T 14900 6700 5 10 0 0 0 0 1
device=OUTPUT
T 14900 6900 5 10 0 0 0 0 1
footprint=anchor
T 15500 6500 5 14 1 1 0 1 1
refdes=OR
}
N 13900 6100 13900 5900 4
{
T 13900 5850 5 10 1 1 180 3 1
netname=I2
}
N 14600 6100 14600 5900 4
{
T 14600 5850 5 10 1 1 0 5 1
netname=I3#
}
N 15300 6100 15300 5900 4
{
T 15300 5850 5 10 1 1 0 5 1
netname=I4
}
C 4800 2100 1 0 0 notp.sym
{
T 5150 2400 5 10 1 1 0 4 1
refdes=L4
}
C 400 9000 1 0 0 in-1.sym
{
T 400 9300 5 10 0 0 0 0 1
device=INPUT
T 400 9500 5 10 0 0 0 0 1
footprint=anchor
T 400 9100 5 10 1 1 0 7 1
refdes=Zo#
}
C 400 8600 1 0 0 in-1.sym
{
T 400 8900 5 10 0 0 0 0 1
device=INPUT
T 400 9100 5 10 0 0 0 0 1
footprint=anchor
T 400 8700 5 10 1 1 0 7 1
refdes=Co#
}
C 3700 7400 1 0 0 in-1.sym
{
T 3700 7900 5 10 0 0 0 0 1
footprint=anchor
T 3700 7700 5 10 0 0 0 0 1
device=INPUT
T 3700 7500 5 10 1 1 0 7 1
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
C 10600 3700 1 0 0 out-1.sym
{
T 11200 3800 5 10 1 1 0 1 1
refdes=ZW
T 10600 4200 5 10 0 0 0 0 1
footprint=anchor
T 10600 4000 5 10 0 0 0 0 1
device=OUTPUT
}
N 9800 3600 9600 3600 4
{
T 9550 3600 5 10 1 1 0 7 1
netname=I7#
}
C 7800 1300 1 0 0 2n7002.sym
{
T 8025 1600 5 10 1 1 0 1 1
refdes=M20
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
T 8025 2200 5 10 1 1 0 1 1
refdes=M19
}
C 7800 2500 1 0 0 2n7002.sym
{
T 7900 3300 5 10 0 1 0 0 1
value=2N7002P
T 8300 3100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 9300 3100 5 10 0 1 0 0 1
device=NMOS
T 8025 2800 5 10 1 1 0 1 1
refdes=M18
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
B 11800 0 4200 3100 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
B 0 5700 8900 4000 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 8800 5800 9 12 1 0 0 6 1
Branch Control
T 11800 9500 9 12 1 0 0 0 1
Arithmetic Control
L 8900 3100 8900 5700 5 0 1 0 -1 -1
T 7700 5500 9 12 1 0 0 0 1
Misc. Logic
C 12700 5700 1 0 0 gnd-1.sym
C 12600 7000 1 0 0 vdd-1.sym
C 12500 6000 1 0 0 nand.sym
{
T 12900 6500 5 10 1 1 0 4 1
refdes=A9
}
N 12500 6600 12300 6600 4
{
T 12250 6600 5 10 1 1 0 7 1
netname=I6
}
N 12500 6400 12300 6400 4
{
T 12250 6400 5 10 1 1 0 7 1
netname=I7
}
N 14900 6500 13300 6500 4
C 13900 5800 1 0 1 2n7002.sym
{
T 13675 6100 5 10 1 1 0 7 1
refdes=M11
T 13800 6600 5 10 0 1 0 6 1
value=2N7002P
T 13400 6400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 12400 6400 5 10 0 1 0 6 1
device=NMOS
}
C 14600 5800 1 0 1 2n7002.sym
{
T 14375 6100 5 10 1 1 0 7 1
refdes=M10
T 14500 6600 5 10 0 1 0 6 1
value=2N7002P
T 14100 6400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 13100 6400 5 10 0 1 0 6 1
device=NMOS
}
C 15300 5800 1 0 1 2n7002.sym
{
T 15075 6100 5 10 1 1 0 7 1
refdes=M9
T 15200 6600 5 10 0 1 0 6 1
value=2N7002P
T 14800 6400 5 10 0 1 0 6 1
footprint=sot23-nmos
T 13800 6400 5 10 0 1 0 6 1
device=NMOS
}
B 11800 5600 4200 1700 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 13600 5600 1 0 1 gnd-1.sym
C 14300 5600 1 0 1 gnd-1.sym
C 14800 5600 1 0 0 gnd-1.sym
N 13500 6300 13500 6500 4
N 14200 6300 14200 6500 4
N 14900 6300 14900 6500 4
C 14800 1800 1 0 0 out-1.sym
{
T 14800 2100 5 10 0 0 0 0 1
device=OUTPUT
T 14800 2300 5 10 0 0 0 0 1
footprint=anchor
T 15400 1900 5 14 1 1 0 1 1
refdes=QE
}
N 13200 1300 13400 1300 4
{
T 13450 1400 5 10 1 1 0 7 1
netname=I6#
}
N 14800 1000 15000 1000 4
{
T 15050 1000 5 10 1 1 0 1 1
netname=I3
}
N 15000 400 14800 400 4
{
T 15050 400 5 10 1 1 0 1 1
netname=I5
}
N 12200 1600 12400 1600 4
{
T 12450 1700 5 10 1 1 0 7 1
netname=I7#
}
C 13600 2800 1 0 0 vdd-1.sym
N 14800 1600 15000 1600 4
{
T 15050 1600 5 10 1 1 0 1 1
netname=I2
}
C 14800 1300 1 0 1 2n7002.sym
{
T 14700 2100 5 10 0 1 0 6 1
value=2N7002P
T 14300 1900 5 10 0 1 0 6 1
footprint=sot23-nmos
T 13300 1900 5 10 0 1 0 6 1
device=NMOS
T 14575 1600 5 10 1 1 0 7 1
refdes=M15
}
C 14800 700 1 0 1 2n7002.sym
{
T 14700 1500 5 10 0 1 0 6 1
value=2N7002P
T 14300 1300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 13300 1300 5 10 0 1 0 6 1
device=NMOS
T 14575 1000 5 10 1 1 0 7 1
refdes=M16
}
C 13400 1000 1 0 0 2n7002.sym
{
T 13500 1800 5 10 0 1 0 0 1
value=2N7002P
T 13900 1600 5 10 0 1 0 0 1
footprint=sot23-nmos
T 14900 1600 5 10 0 1 0 0 1
device=NMOS
T 13625 1300 5 10 1 1 0 1 1
refdes=M13
}
C 12400 1300 1 0 0 2n7002.sym
{
T 12500 2100 5 10 0 1 0 0 1
value=2N7002P
T 12900 1900 5 10 0 1 0 0 1
footprint=sot23-nmos
T 13900 1900 5 10 0 1 0 0 1
device=NMOS
T 12625 1600 5 10 1 1 0 1 1
refdes=M12
}
C 14800 100 1 0 1 2n7002.sym
{
T 14700 900 5 10 0 1 0 6 1
value=2N7002P
T 14300 700 5 10 0 1 0 6 1
footprint=sot23-nmos
T 13300 700 5 10 0 1 0 6 1
device=NMOS
T 14575 400 5 10 1 1 0 7 1
refdes=M17
}
N 12800 1800 12800 1900 4
N 14400 600 14400 800 4
C 13900 1900 1 90 0 resistor-load.sym
{
T 13500 2200 5 10 0 0 90 0 1
device=RESISTOR
T 13800 2300 5 10 0 1 90 0 1
footprint=0603-boxed
T 13800 2300 5 10 0 1 90 0 1
value=3.3k
T 13750 2550 5 10 1 1 90 0 1
refdes=R2
}
C 13400 100 1 0 0 2n7002.sym
{
T 13500 900 5 10 0 1 0 0 1
value=2N7002P
T 13900 700 5 10 0 1 0 0 1
footprint=sot23-nmos
T 14900 700 5 10 0 1 0 0 1
device=NMOS
T 13625 400 5 10 1 1 0 1 1
refdes=M14
}
N 13200 400 13400 400 4
{
T 13150 400 5 10 1 1 0 7 1
netname=I6
}
N 13800 600 13800 1100 4
C 12900 1100 1 0 1 gnd-1.sym
C 13900 -100 1 0 1 gnd-1.sym
C 14300 -100 1 0 0 gnd-1.sym
N 13800 700 14400 700 4
N 14400 1400 14400 1200 4
N 14400 1900 14400 1800 4
N 12800 1900 14800 1900 4
N 13800 1900 13800 1500 4
C 6800 7100 1 90 1 phi1.sym
C 6300 6200 1 0 0 notp.sym
{
T 6650 6500 5 10 1 1 0 4 1
refdes=N9
}
N 6300 6500 5900 6500 4
C 6000 6500 1 270 0 out-1.sym
{
T 6500 6500 5 10 0 0 270 0 1
footprint=anchor
T 6300 6500 5 10 0 0 270 0 1
device=OUTPUT
T 6150 6450 5 10 1 1 270 0 1
refdes=Push#
}
B 0 0 16000 9700 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C 500 2000 1 0 0 in-1.sym
{
T 500 2100 5 10 1 1 0 7 1
refdes=ϕ0
T 500 2500 5 10 0 0 0 0 1
footprint=anchor
T 500 2300 5 10 0 0 0 0 1
device=INPUT
}
C 1400 2000 1 0 1 phi0.sym
C 5000 3600 1 270 1 phi0.sym
C 4900 4900 1 0 0 vdd-1.sym
N 3900 4500 4800 4500 4
{
T 4100 4550 5 10 1 1 0 0 1
netname=MRead
}
C 4800 3900 1 0 0 nor.sym
{
T 5200 4400 5 10 1 1 0 4 1
refdes=L7
}
N 5600 3300 4800 3300 4
N 3300 8500 3500 8500 4
C 9800 3300 1 0 0 nor3.sym
{
T 10200 3800 5 10 1 1 0 4 1
refdes=A6
}
C 7400 3700 1 0 0 not.sym
{
T 7750 4000 5 10 1 1 0 4 1
refdes=L9
}
C 9800 5900 1 0 0 nand.sym
{
T 10200 6400 5 10 1 1 0 4 1
refdes=A4
}
N 12900 5300 12900 5400 4
C 4800 400 1 0 0 nor.sym
{
T 5200 900 5 10 1 1 0 4 1
refdes=L2
}
N 4600 800 4800 800 4
{
T 4550 800 5 10 1 1 0 7 1
netname=I4
}
N 4100 1000 4800 1000 4
C 5000 100 1 0 0 gnd-1.sym
C 5200 1700 1 90 1 phi1.sym
N 4400 2100 4400 1000 4
C 3400 1500 1 0 0 vdd-1.sym
C 3300 500 1 0 0 nand.sym
{
T 3700 1000 5 10 1 1 0 4 1
refdes=L1
}
N 4800 4300 4800 3300 4
N 5600 3300 5600 2400 4
{
T 5600 2800 5 10 1 1 180 8 1
netname=MW
}
N 2900 4600 3100 4600 4
{
T 2850 4600 5 10 1 1 0 7 1
netname=I6#
}
N 2900 4400 3100 4400 4
{
T 2850 4400 5 10 1 1 0 7 1
netname=I5#
}
N 2900 3500 3100 3500 4
{
T 2850 3500 5 10 1 1 0 7 1
netname=I7#
}
N 2900 3300 3100 3300 4
{
T 2850 3300 5 10 1 1 0 7 1
netname=I3#
}
N 2900 3100 3100 3100 4
{
T 2850 3100 5 10 1 1 0 7 1
netname=I2#
}
C 3200 5000 1 0 0 vdd-1.sym
C 3100 2800 1 0 0 nor3od.sym
{
T 3500 3300 5 10 1 1 0 4 1
refdes=L5
}
C 3100 4000 1 0 0 nand.sym
{
T 3500 4500 5 10 1 1 0 4 1
refdes=L6
}
C 3300 2500 1 0 0 gnd-1.sym
C 3300 3700 1 0 0 gnd-1.sym
N 3900 4500 3900 3300 4
