v 20201216 2
C 14200 6200 1 0 0 alu.sym
{
T 14950 7250 5 10 1 1 0 4 1
source=alu.sch
T 14950 7600 5 10 1 1 0 4 1
refdes=E
}
C 8900 2100 1 0 0 sramcell2.sym
{
T 9700 2800 5 8 1 1 0 4 1
source=sramcell2.sch
T 10250 2300 5 10 1 1 0 6 1
refdes=U
}
C 8900 3900 1 0 0 sramcell2.sym
{
T 9700 4600 5 8 1 1 0 4 1
source=sramcell2.sch
T 10250 4100 5 10 1 1 0 6 1
refdes=Y
}
C 8900 5700 1 0 0 sramcell2.sym
{
T 9700 6400 5 8 1 1 0 4 1
source=sramcell2.sch
T 10250 5900 5 10 1 1 0 6 1
refdes=X
}
C 8900 7500 1 0 0 sramcell2s.sym
{
T 9700 8200 5 8 1 1 0 4 1
source=sramcell2s.sch
T 9700 7700 5 10 1 1 0 3 1
refdes=A
}
N 13100 8000 14200 8000 4
{
T 13550 8050 5 10 1 1 0 0 1
netname=EA
}
C 9600 1800 1 0 0 gnd-1.sym
C 9600 3600 1 0 0 gnd-1.sym
C 9600 5400 1 0 0 gnd-1.sym
C 9600 7200 1 0 0 gnd-1.sym
C 9500 3500 1 0 0 vdd-1.sym
C 9500 5300 1 0 0 vdd-1.sym
C 9500 7100 1 0 0 vdd-1.sym
C 9500 8900 1 0 0 vdd-1.sym
C 12700 6000 1 90 0 in-1.sym
{
T 12200 6000 5 10 0 0 90 0 1
footprint=anchor
T 12400 6000 5 10 0 0 90 0 1
device=INPUT
T 12600 6000 5 10 1 1 90 7 1
refdes=N#
}
C 13600 6800 1 0 0 in-1.sym
{
T 13600 7300 5 10 0 0 0 0 1
footprint=anchor
T 13600 7100 5 10 0 0 0 0 1
device=INPUT
T 13700 6950 5 10 1 1 0 0 1
refdes=AND
}
C 13600 6600 1 0 0 in-1.sym
{
T 13600 7100 5 10 0 0 0 0 1
footprint=anchor
T 13600 6900 5 10 0 0 0 0 1
device=INPUT
T 13700 6650 5 10 1 1 0 2 1
refdes=OR
}
C 16600 6900 1 0 1 in-1.sym
{
T 16600 7400 5 10 0 0 0 6 1
footprint=anchor
T 16600 7200 5 10 0 0 0 6 1
device=INPUT
T 16300 7050 5 10 1 1 0 3 1
refdes=CS#
}
C 16600 6700 1 0 1 in-1.sym
{
T 16600 7200 5 10 0 0 0 6 1
footprint=anchor
T 16600 7000 5 10 0 0 0 6 1
device=INPUT
T 16300 6750 5 10 1 1 0 5 1
refdes=CR
}
C 15400 5600 1 90 0 in-1.sym
{
T 14900 5600 5 10 0 0 90 0 1
footprint=anchor
T 15100 5600 5 10 0 0 90 0 1
device=INPUT
T 15300 5600 5 10 1 1 0 5 1
refdes=Ci#
}
C 16000 8500 1 0 0 out-1.sym
{
T 16000 9000 5 10 0 0 0 0 1
footprint=anchor
T 16000 8800 5 10 0 0 0 0 1
device=OUTPUT
T 16300 8650 5 10 1 1 0 3 1
refdes=Co#
}
C 8300 8300 1 0 0 in-1.sym
{
T 8300 8800 5 10 0 0 0 0 1
footprint=anchor
T 8300 8600 5 10 0 0 0 0 1
device=INPUT
T 8300 8400 5 10 1 1 0 7 1
refdes=WA
}
C 8300 7900 1 0 0 in-1.sym
{
T 8300 8400 5 10 0 0 0 0 1
footprint=anchor
T 8300 8200 5 10 0 0 0 0 1
device=INPUT
T 8300 8000 5 10 1 1 0 7 1
refdes=RA
}
C 8300 6500 1 0 0 in-1.sym
{
T 8300 7000 5 10 0 0 0 0 1
footprint=anchor
T 8300 6800 5 10 0 0 0 0 1
device=INPUT
T 8300 6600 5 10 1 1 0 7 1
refdes=WX
}
C 8300 6100 1 0 0 in-1.sym
{
T 8300 6600 5 10 0 0 0 0 1
footprint=anchor
T 8300 6400 5 10 0 0 0 0 1
device=INPUT
T 8300 6200 5 10 1 1 0 7 1
refdes=RX
}
C 8300 4700 1 0 0 in-1.sym
{
T 8300 5200 5 10 0 0 0 0 1
footprint=anchor
T 8300 5000 5 10 0 0 0 0 1
device=INPUT
T 8300 4800 5 10 1 1 0 7 1
refdes=WY
}
C 8300 4300 1 0 0 in-1.sym
{
T 8300 4800 5 10 0 0 0 0 1
footprint=anchor
T 8300 4600 5 10 0 0 0 0 1
device=INPUT
T 8300 4400 5 10 1 1 0 7 1
refdes=RY
}
C 8300 2900 1 0 0 in-1.sym
{
T 8300 3400 5 10 0 0 0 0 1
footprint=anchor
T 8300 3200 5 10 0 0 0 0 1
device=INPUT
T 8300 3000 5 10 1 1 0 7 1
refdes=WU
}
C 8300 2500 1 0 0 in-1.sym
{
T 8300 3000 5 10 0 0 0 0 1
footprint=anchor
T 8300 2800 5 10 0 0 0 0 1
device=INPUT
T 8300 2600 5 10 1 1 0 7 1
refdes=RU
}
C 14800 5900 1 0 0 gnd-1.sym
C 14700 8600 1 0 0 vdd-1.sym
C 12100 7500 1 0 0 in-1.sym
{
T 12100 8000 5 10 0 0 0 0 1
footprint=anchor
T 12100 7800 5 10 0 0 0 0 1
device=INPUT
T 12100 7600 5 10 1 1 0 7 1
refdes=AS
}
C 12600 9000 1 270 0 in-1.sym
{
T 13100 9000 5 10 0 0 270 0 1
footprint=anchor
T 12900 9000 5 10 0 0 270 0 1
device=INPUT
T 12700 9000 5 10 1 1 0 3 1
refdes=AR#
}
C 11900 5300 1 0 1 gnd-1.sym
C 15100 1100 1 0 1 gnd-1.sym
C 15200 2900 1 0 1 vdd-1.sym
C 13900 1900 1 0 1 gnd-1.sym
C 13900 1100 1 0 1 gnd-1.sym
N 12600 6800 12200 6800 4
N 12200 6800 12200 5100 4
{
T 12150 6700 5 10 1 1 90 6 1
netname=Bi
}
C 14200 1400 1 0 1 nmos-switch.sym
{
T 13975 1700 5 8 1 1 0 7 1
refdes=M3
T 14100 2200 5 8 0 1 0 6 1
value=NMOS_switch
T 13700 2000 5 8 0 1 0 6 1
footprint=sot23-nmos
T 12700 2000 5 8 0 1 0 6 1
device=NMOS
}
C 14200 2200 1 0 1 nmos-switch.sym
{
T 13975 2500 5 8 1 1 0 7 1
refdes=M2
T 14100 3000 5 8 0 1 0 6 1
value=NMOS_switch
T 13700 2800 5 8 0 1 0 6 1
footprint=sot23-nmos
T 12700 2800 5 8 0 1 0 6 1
device=NMOS
}
N 13600 1900 13800 1900 4
{
T 13550 1900 5 10 1 1 0 7 1
netname=W
}
C 11900 1000 1 0 0 in-1.sym
{
T 11900 1500 5 10 0 0 0 0 1
footprint=anchor
T 11900 1300 5 10 0 0 180 8 1
device=INPUT
T 11900 1100 5 10 1 1 0 7 1
refdes=ϕ
}
N 15700 7700 15800 7700 4
N 15800 7700 15800 2500 4
C 12300 7700 1 0 0 not.sym
{
T 12650 8000 5 10 1 1 0 4 1
refdes=I5
}
C 13000 5900 1 0 1 gnd-1.sym
C 12700 7200 1 0 0 vdd-1.sym
N 13400 6700 13400 7600 4
N 13400 7600 14200 7600 4
{
T 13600 7650 5 10 1 1 0 0 1
netname=EB
}
N 16000 7000 15700 7000 4
N 16000 6800 15700 6800 4
C 11600 8000 1 90 0 out-1.sym
{
T 11100 8000 5 10 0 0 90 0 1
footprint=anchor
T 11300 8000 5 10 0 0 90 0 1
device=OUTPUT
T 11500 8600 5 10 1 1 180 5 1
refdes=Ao#
}
C 11400 7800 1 270 0 out-1.sym
{
T 11900 7800 5 10 0 0 270 0 1
footprint=anchor
T 11700 7800 5 10 0 0 270 0 1
device=OUTPUT
T 11500 7200 5 10 1 1 180 3 1
refdes=Ao
}
N 11500 7800 10500 7800 4
N 10500 8000 12300 8000 4
C 300 6900 1 0 0 sramcell.sym
{
T 1650 7150 5 10 1 1 0 6 1
refdes=L0
T 1100 7625 5 10 1 1 0 4 1
source=sramcell.sch
}
C 2100 6900 1 0 0 sramcell.sym
{
T 3450 7150 5 10 1 1 0 6 1
refdes=L1
T 2400 7550 5 10 1 1 0 0 1
source=sramcell.sch
}
C 3900 6900 1 0 0 sramcell.sym
{
T 5250 7150 5 10 1 1 0 6 1
refdes=L2
T 4200 7550 5 10 1 1 0 0 1
source=sramcell.sch
}
C 5700 6900 1 0 0 sramcell.sym
{
T 7050 7150 5 10 1 1 0 6 1
refdes=L3
T 6000 7550 5 10 1 1 0 0 1
source=sramcell.sch
}
C 400 6800 1 90 0 in-1.sym
{
T -100 6800 5 10 0 0 90 0 1
footprint=anchor
T 100 6800 5 10 0 0 90 0 1
device=INPUT
T 300 6800 5 10 1 1 0 5 1
refdes=S0
}
C 2200 6800 1 90 0 in-1.sym
{
T 1700 6800 5 10 0 0 90 0 1
footprint=anchor
T 1900 6800 5 10 0 0 90 0 1
device=INPUT
T 2100 6800 5 10 1 1 0 5 1
refdes=S1
}
C 4000 6800 1 90 0 in-1.sym
{
T 3500 6800 5 10 0 0 90 0 1
footprint=anchor
T 3700 6800 5 10 0 0 90 0 1
device=INPUT
T 3900 6800 5 10 1 1 0 5 1
refdes=S2
}
C 5800 6800 1 90 0 in-1.sym
{
T 5300 6800 5 10 0 0 90 0 1
footprint=anchor
T 5500 6800 5 10 0 0 90 0 1
device=INPUT
T 5700 6800 5 10 1 1 0 5 1
refdes=S3
}
C 2800 6600 1 0 0 gnd-1.sym
N 1900 7800 1900 8600 4
N 1900 8600 7300 8600 4
{
T 6800 8650 5 10 1 1 0 0 1
netname=SB#
}
N 7300 8600 7300 7800 4
N 300 7800 300 8900 4
N 300 8500 5700 8500 4
{
T 800 8550 5 10 1 1 0 0 1
netname=SB
}
N 5700 7800 5700 8500 4
N 5500 7800 5500 8600 4
N 3900 7800 3900 8500 4
N 3700 7800 3700 8600 4
N 2100 7800 2100 8500 4
C 4300 3100 1 0 1 pdtc124.sym
{
T 4075 3400 5 8 1 1 0 7 1
refdes=Q3
T 3600 3600 5 10 0 1 0 6 1
footprint=sot323-bjt
T 4200 3800 5 10 0 1 0 6 1
value=PDTC124TU
}
C 4300 3700 1 0 1 nmos-switch.sym
{
T 4075 4000 5 8 1 1 0 7 1
refdes=M1
T 4200 4500 5 10 0 1 0 6 1
value=NMOS_switch
T 3800 4300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 2800 4300 5 10 0 1 0 6 1
device=NMOS
}
C 3800 2800 1 0 0 gnd-1.sym
N 3900 3800 3900 3600 4
C 4900 4100 1 180 0 in-1.sym
{
T 4900 3600 5 10 0 0 180 0 1
footprint=anchor
T 4900 3800 5 10 0 0 180 0 1
device=INPUT
T 4900 4000 5 10 1 1 0 1 1
refdes=Ret
}
C 2800 5000 1 270 0 in-1.sym
{
T 3300 5000 5 10 0 0 270 0 1
footprint=anchor
T 3100 5000 5 10 0 0 270 0 1
device=INPUT
T 3050 4650 5 10 1 1 90 0 1
refdes=Inc
}
N 3700 4300 5200 4300 4
{
T 4000 4350 5 10 1 1 0 3 1
netname=Pn#
}
N 2600 4200 2900 4200 4
N 3900 3100 3900 3200 4
N 3900 4200 3900 4300 4
C 2300 2900 1 0 0 in-1.sym
{
T 2300 3400 5 10 0 0 0 0 1
footprint=anchor
T 2300 3200 5 10 0 0 0 0 1
device=INPUT
T 2400 2950 5 10 1 1 180 6 1
refdes=Jump
}
C 5900 2900 1 0 0 gnd-1.sym
C 5200 3200 1 0 0 dflipflop.sym
{
T 6000 3875 5 8 1 1 0 4 1
source=dflipflops.sch
T 6550 3450 5 10 1 1 0 6 1
refdes=F
}
C 900 8300 1 0 0 vdd-1.sym
C 5800 4700 1 0 0 vdd-1.sym
C 7000 4200 1 180 1 out-1.sym
{
T 7000 3700 5 10 0 0 180 6 1
footprint=anchor
T 7000 3900 5 10 0 0 180 6 1
device=OUTPUT
T 7275 4075 5 10 1 1 180 6 1
refdes=P
}
C 7000 4200 1 0 0 out-1.sym
{
T 7000 4700 5 10 0 0 0 0 1
footprint=anchor
T 7000 4500 5 10 0 0 0 0 1
device=OUTPUT
T 7275 4325 5 10 1 1 0 0 1
refdes=P#
}
C 12400 200 1 0 0 gnd-1.sym
C 11900 400 1 0 0 in-1.sym
{
T 11900 900 5 10 0 0 0 0 1
footprint=anchor
T 11900 700 5 10 0 0 0 0 1
device=INPUT
T 11900 500 5 10 1 1 0 7 1
refdes=GND
}
C 11900 1300 1 0 0 in-1.sym
{
T 11900 1800 5 10 0 0 0 3 1
footprint=anchor
T 11900 1600 5 10 0 0 0 3 1
device=INPUT
T 11900 1400 5 10 1 1 0 7 1
refdes=Vdd
}
C 12300 1400 1 0 0 vdd-1.sym
N 7000 4300 6800 4300 4
{
T 6900 4350 5 10 1 1 0 3 1
netname=P#
}
N 7000 4100 6800 4100 4
{
T 6900 4050 5 10 1 1 0 5 1
netname=P
}
C 1000 6600 1 0 0 gnd-1.sym
C 6400 6600 1 0 0 gnd-1.sym
C 4600 6600 1 0 0 gnd-1.sym
C 2700 8300 1 0 0 vdd-1.sym
C 6300 8300 1 0 0 vdd-1.sym
C 4500 8300 1 0 0 vdd-1.sym
C 700 300 1 0 0 dflipflop.sym
{
T 2050 550 5 10 1 1 0 6 1
refdes=G
T 1500 950 5 8 1 1 0 4 1
source=dflipflop.sch
}
C 600 2000 1 270 0 in-1.sym
{
T 1100 2000 5 10 0 0 270 0 1
footprint=anchor
T 900 2000 5 10 0 0 270 0 1
device=INPUT
T 700 2000 5 10 1 1 270 7 1
refdes=O
}
C 2400 1400 1 90 0 out-1.sym
{
T 2100 1400 5 10 0 0 90 0 1
device=OUTPUT
T 2300 2000 5 10 1 1 0 3 1
refdes=I
T 1900 1400 5 10 0 0 90 0 1
footprint=anchor
}
C 2200 1200 1 270 0 out-1.sym
{
T 2500 1200 5 10 0 0 270 0 1
device=OUTPUT
T 2300 600 5 10 1 1 0 5 1
refdes=I#
T 2700 1200 5 10 0 0 270 0 1
footprint=anchor
}
C 12700 1000 1 0 1 phi.sym
C 1300 1800 1 0 0 vdd-1.sym
C 1400 0 1 0 0 gnd-1.sym
C 500 800 1 0 0 phi.sym
C 5000 3700 1 0 0 phi.sym
C 16400 5700 1 0 1 in-1.sym
{
T 16400 6200 5 10 0 0 0 6 1
footprint=anchor
T 16400 6000 5 10 0 0 0 6 1
device=INPUT
T 16100 5750 5 10 1 1 0 5 1
refdes=Q
}
C 8900 300 1 0 0 sramcell2.sym
{
T 9700 1000 5 8 1 1 0 4 1
source=sramcell2.sch
T 10250 500 5 10 1 1 0 6 1
refdes=K
}
C 9600 0 1 0 0 gnd-1.sym
C 9500 1700 1 0 0 vdd-1.sym
C 8300 700 1 0 0 in-1.sym
{
T 8300 1200 5 10 0 0 0 0 1
footprint=anchor
T 8300 1000 5 10 0 0 0 0 1
device=INPUT
T 8300 800 5 10 1 1 0 7 1
refdes=RK
}
C 15000 3500 1 0 0 nandod.sym
{
T 15400 4000 5 10 1 1 0 4 1
refdes=S8
}
C 15400 3200 1 0 1 gnd-1.sym
C 14400 4000 1 0 0 in-1.sym
{
T 14400 4500 5 10 0 0 0 0 1
footprint=anchor
T 14400 4300 5 10 0 0 180 8 1
device=INPUT
T 14400 4100 5 10 1 1 0 7 1
refdes=K#
}
C 14400 3800 1 0 0 in-1.sym
{
T 14400 4300 5 10 0 0 0 0 1
footprint=anchor
T 14400 4100 5 10 0 0 180 8 1
device=INPUT
T 14400 3900 5 10 1 1 0 7 1
refdes=QK
}
C 16600 7800 1 0 1 in-1.sym
{
T 16600 8300 5 10 0 0 0 6 1
footprint=anchor
T 16600 8100 5 10 0 0 180 2 1
device=INPUT
T 16350 7950 5 10 1 1 0 3 1
refdes=QE
}
C 2300 3100 1 0 0 in-1.sym
{
T 2300 3600 5 10 0 0 0 0 1
footprint=anchor
T 2300 3400 5 10 0 0 180 8 1
device=INPUT
T 2300 3200 5 10 1 1 0 7 1
refdes=J
}
C 16100 3700 1 0 0 gnd-1.sym
C 16300 4400 1 90 0 out-1.sym
{
T 15800 4400 5 10 0 0 90 0 1
footprint=anchor
T 16000 4400 5 10 0 0 90 0 1
device=OUTPUT
T 16200 5025 5 10 1 1 0 3 1
refdes=Z
}
C 15800 3900 1 0 0 nmos-switch.sym
{
T 16025 4200 5 8 1 1 0 1 1
refdes=M6
T 15900 4700 5 10 0 1 0 0 1
value=NMOS_switch
T 16300 4500 5 10 0 1 0 0 1
footprint=sot23-nmos
T 17300 4500 5 10 0 1 0 0 1
device=NMOS
}
N 16000 7900 15700 7900 4
C 11400 5600 1 0 0 notb.sym
{
T 11825 5900 5 10 1 1 0 4 1
refdes=I4
}
C 12000 6200 1 0 1 vdd-1.sym
C 1600 8800 1 0 0 resistor-1.sym
{
T 1900 9200 5 10 0 0 0 0 1
device=RESISTOR
T 2300 8950 5 10 1 1 0 0 1
refdes=R2
T 1800 9000 5 10 1 1 0 0 1
value=22k
}
C 1200 8800 1 0 1 resistor-1.sym
{
T 900 9200 5 10 0 0 0 6 1
device=RESISTOR
T 500 8950 5 10 1 1 0 6 1
refdes=R1
T 1000 9000 5 10 1 1 0 6 1
value=22k
}
C 1400 8900 1 0 1 vdd-1.sym
C 1400 8900 1 0 0 vdd-1.sym
C 900 3200 1 90 0 in-1.sym
{
T 600 3200 5 10 0 0 90 0 1
device=INPUT
T 400 3200 5 10 0 0 90 0 1
footprint=anchor
T 800 3175 5 10 1 1 180 3 1
refdes=PCi
}
N 13600 2700 13800 2700 4
{
T 13550 2700 5 10 1 1 0 7 1
netname=W#
}
N 8700 1400 8900 1400 4
{
T 8650 1400 5 10 1 1 0 7 1
netname=W#
}
N 8700 3200 8900 3200 4
{
T 8650 3200 5 10 1 1 0 7 1
netname=W#
}
N 8700 5000 8900 5000 4
{
T 8650 5000 5 10 1 1 0 7 1
netname=W#
}
N 8700 6800 8900 6800 4
{
T 8650 6800 5 10 1 1 0 7 1
netname=W#
}
N 8700 8600 8900 8600 4
{
T 8650 8600 5 10 1 1 0 7 1
netname=W#
}
N 10700 1400 10500 1400 4
{
T 10750 1400 5 10 1 1 0 1 1
netname=W
}
N 10700 3200 10500 3200 4
{
T 10750 3200 5 10 1 1 0 1 1
netname=W
}
N 10700 5000 10500 5000 4
{
T 10750 5000 5 10 1 1 0 1 1
netname=W
}
N 10700 6800 10500 6800 4
{
T 10750 6800 5 10 1 1 0 1 1
netname=W
}
N 10700 8600 10500 8600 4
{
T 10750 8600 5 10 1 1 0 1 1
netname=W
}
N 8700 600 8900 600 4
{
T 8650 600 5 10 1 1 0 7 1
netname=Bi#
}
N 8700 2400 8900 2400 4
{
T 8650 2400 5 10 1 1 0 7 1
netname=Bi#
}
N 8700 4200 8900 4200 4
{
T 8650 4200 5 10 1 1 0 7 1
netname=Bi#
}
N 8700 6000 8900 6000 4
{
T 8650 6000 5 10 1 1 0 7 1
netname=Bi#
}
N 8700 7800 8900 7800 4
{
T 8650 7800 5 10 1 1 0 7 1
netname=Bi#
}
N 11200 5900 11400 5900 4
{
T 11150 5900 5 10 1 1 0 7 1
netname=Bi#
}
C 8700 1100 1 0 0 phi.sym
C 1800 3900 1 0 0 not.sym
{
T 2150 4200 5 10 1 1 0 4 1
refdes=I3
}
C 1700 3800 1 270 0 out-1.sym
{
T 2000 3800 5 10 0 0 270 0 1
device=OUTPUT
T 2200 3800 5 10 0 0 270 0 1
footprint=anchor
T 1800 3175 5 10 1 1 0 5 1
refdes=PCo
}
N 1800 5600 1800 4200 4
{
T 1850 4900 5 10 1 1 90 2 1
netname=Pp#
}
C 1200 3100 1 0 0 gnd-1.sym
C 2100 3600 1 0 0 gnd-1.sym
C 1100 4600 1 0 0 vdd-1.sym
C 2000 4500 1 0 0 vdd-1.sym
N 600 4200 800 4200 4
{
T 550 4200 5 10 1 1 0 7 1
netname=P
}
C 2900 3800 1 0 0 nand.sym
{
T 3300 4300 5 10 1 1 0 4 1
refdes=S6
}
C 3000 4800 1 0 0 vdd-1.sym
C 2900 2600 1 0 0 nandod.sym
{
T 3300 3100 5 10 1 1 0 4 1
refdes=S7
}
C 3100 2300 1 0 0 gnd-1.sym
C 3100 3500 1 0 0 gnd-1.sym
N 3700 3100 3700 4300 4
N 2600 5600 2600 4200 4
{
T 2550 4900 5 10 1 1 90 0 1
netname=Pp
}
N 4300 3400 4500 3400 4
{
T 4550 3400 5 10 1 1 0 1 1
netname=SB
}
B 0 0 16700 9200 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
L 7800 9200 7800 0 5 0 1 0 -1 -1
T 16500 9100 9 12 1 0 0 8 1
Register file and arithmetic unit
L 7800 6500 0 6500 5 0 1 0 -1 -1
T 4300 9100 9 12 1 0 0 2 1
Stack memory
T 4300 6400 9 12 1 0 0 2 1
Program counter and branch
L 0 2200 7800 2200 5 0 1 0 -1 -1
T 2550 475 9 12 1 0 0 8 2
Instruction
Bit
N 2500 8900 2500 8600 4
C 1600 6000 1 0 0 in-1.sym
{
T 1600 6500 5 10 0 0 0 3 1
footprint=anchor
T 1600 6300 5 10 0 0 0 3 1
device=INPUT
T 2000 6150 5 10 1 1 0 3 1
refdes=VPush
}
C 3400 5300 1 0 0 pdtc124.sym
{
T 4100 5800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 3500 6000 5 10 0 1 0 0 1
value=PDTC124TU
T 3600 5600 5 8 1 1 0 1 1
refdes=Q2
}
C 1000 5300 1 0 1 pdtc124.sym
{
T 300 5800 5 10 0 1 0 6 1
footprint=sot323-bjt
T 900 6000 5 10 0 1 0 6 1
value=PDTC124TU
T 800 5600 5 8 1 1 0 7 1
refdes=Q1
}
C 1300 5000 1 0 0 gnd-1.sym
C 2900 5000 1 0 0 gnd-1.sym
N 3800 5300 3800 5400 4
N 600 5400 600 5300 4
N 3800 5800 3800 6000 4
{
T 3800 6050 5 10 1 1 0 3 1
netname=SB
}
N 600 5800 600 6000 4
{
T 600 6050 5 10 1 1 0 3 1
netname=SB#
}
C 1800 5300 1 0 1 not.sym
{
T 1450 5600 5 10 1 1 0 4 1
refdes=I1
}
C 2600 5300 1 0 0 not.sym
{
T 2950 5600 5 10 1 1 0 4 1
refdes=I2
}
C 500 5000 1 0 0 gnd-1.sym
C 3700 5000 1 0 0 gnd-1.sym
N 1400 5900 3000 5900 4
N 2200 6100 2200 5900 4
C 4400 1000 1 270 0 out-1.sym
{
T 4700 1000 5 10 0 0 270 0 1
device=OUTPUT
T 4900 1000 5 10 0 0 270 0 1
footprint=anchor
T 4500 375 5 10 1 1 0 5 1
refdes=RCo
}
C 3900 300 1 0 0 gnd-1.sym
C 3800 1800 1 0 0 vdd-1.sym
C 3600 400 1 90 0 in-1.sym
{
T 3300 400 5 10 0 0 90 0 1
device=INPUT
T 3100 400 5 10 0 0 90 0 1
footprint=anchor
T 3500 375 5 10 1 1 180 3 1
refdes=RCi
}
C 5200 300 1 0 0 dflipflop.sym
{
T 6550 550 5 10 1 1 0 6 1
refdes=R
T 6000 950 5 8 1 1 0 4 1
source=dflipflop.sch
}
N 4500 1400 5200 1400 4
{
T 4900 1425 5 10 1 1 0 3 1
netname=Rn#
}
C 5000 800 1 0 0 phi.sym
N 7000 1400 6800 1400 4
{
T 7050 1400 5 10 1 1 0 1 1
netname=R#
}
N 7000 1200 6800 1200 4
{
T 7050 1200 5 10 1 1 0 1 1
netname=R
}
T 4300 2100 9 12 1 0 0 2 1
DRAM Refresh
C 5900 0 1 0 0 gnd-1.sym
C 5800 1800 1 0 0 vdd-1.sym
C 12200 4600 1 0 0 seli.sym
{
T 12425 5000 5 10 1 1 0 1 1
refdes=B1
}
C 13500 4400 1 0 1 gnd-1.sym
C 13200 5300 1 0 0 vdd-1.sym
C 14700 5000 1 90 0 out-1.sym
{
T 14200 5000 5 10 0 0 90 0 1
footprint=anchor
T 14400 5000 5 10 0 0 90 0 1
device=OUTPUT
T 14600 5600 5 10 1 1 90 1 1
refdes=B#
}
C 13900 5000 1 90 0 out-1.sym
{
T 13400 5000 5 10 0 0 90 0 1
footprint=anchor
T 13600 5000 5 10 0 0 90 0 1
device=OUTPUT
T 13800 5600 5 10 1 1 90 1 1
refdes=B
}
C 13000 4700 1 0 0 cnot.sym
{
T 13325 5000 5 10 1 1 0 4 1
refdes=B2
}
C 13800 4700 1 0 0 cnot.sym
{
T 14125 5000 5 10 1 1 0 4 1
refdes=B3
}
C 14300 4400 1 0 1 gnd-1.sym
C 14000 5300 1 0 0 vdd-1.sym
N 12000 4900 12200 4900 4
{
T 11950 4900 5 10 1 1 0 7 1
netname=R
}
C 12600 6200 1 0 0 xnor.sym
{
T 12800 6800 5 10 1 1 0 0 1
refdes=N
}
C 12400 5400 1 0 0 vdd-1.sym
C 12700 4300 1 0 1 gnd-1.sym
C 11800 4500 1 0 0 in-1.sym
{
T 11800 5000 5 10 0 0 0 0 1
footprint=anchor
T 11800 4800 5 10 0 0 0 0 1
device=INPUT
T 11800 4600 5 10 1 1 0 7 1
refdes=MR#
}
N 16000 8600 15300 8600 4
N 13200 6500 13400 6500 4
C 800 3400 1 0 0 halfadd.sym
{
T 1300 3700 5 10 1 1 0 4 1
refdes=S4
}
N 600 4000 800 4000 4
{
T 550 4000 5 10 1 1 0 7 1
netname=P#
}
C 3500 600 1 0 0 halfadd.sym
{
T 4000 900 5 10 1 1 0 4 1
refdes=S5
}
N 3300 1400 3500 1400 4
{
T 3250 1400 5 10 1 1 0 7 1
netname=R
}
N 3300 1200 3500 1200 4
{
T 3250 1200 5 10 1 1 0 7 1
netname=R#
}
C 13500 8000 1 90 0 schottky.sym
{
T 12803 8297 5 10 0 0 90 0 1
device=DIODE
T 13400 8400 5 10 1 1 0 0 1
refdes=D1
T 12450 8300 5 10 0 1 90 0 1
value=BAS40
}
N 12700 8400 12700 8300 4
N 13300 8400 12700 8400 4
N 12700 7600 12700 7700 4
L 2800 2200 2800 0 5 0 1 0 -1 -1
C 11900 700 1 0 0 in-1.sym
{
T 11900 1200 5 10 0 0 0 0 1
footprint=anchor
T 11900 1000 5 10 0 0 180 8 1
device=INPUT
T 11900 800 5 10 1 1 0 7 1
refdes=ϕ#
}
C 12800 700 1 0 1 phin.sym
C 4900 600 1 0 0 phin.sym
C 4900 3500 1 0 0 phin.sym
C 400 600 1 0 0 phin.sym
C 15800 1400 1 0 1 dlatch.sym
{
T 14450 1850 5 10 1 1 0 0 1
refdes=L
T 15000 2125 5 10 1 1 0 4 1
source=dlatch.sch
}
C 16100 1800 1 0 1 phin.sym
N 14200 1700 14200 2300 4
N 13800 1400 13800 1500 4
N 13800 2200 13800 2300 4
N 13000 5000 12900 5000 4
{
T 12900 5050 5 6 1 1 0 0 1
netname=_b
}
