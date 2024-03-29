v 20220529 2
C 14100 6200 1 0 0 alu.sym
{
T 14850 7250 5 10 1 1 0 4 1
source=alu.sch
T 14850 7600 5 10 1 1 0 4 1
refdes=E
}
C 8800 2100 1 0 0 sramcell2.sym
{
T 9600 2800 5 8 1 1 0 4 1
source=sramcell2.sch
T 10150 2300 5 10 1 1 0 6 1
refdes=U
}
C 8800 3900 1 0 0 sramcell2.sym
{
T 9600 4600 5 8 1 1 0 4 1
source=sramcell2.sch
T 10150 4100 5 10 1 1 0 6 1
refdes=Y
}
C 8800 5700 1 0 0 sramcell2.sym
{
T 9600 6400 5 8 1 1 0 4 1
source=sramcell2.sch
T 10150 5900 5 10 1 1 0 6 1
refdes=X
}
C 8800 7500 1 0 0 sramcell2s.sym
{
T 9600 8200 5 8 1 1 0 4 1
source=sramcell2s.sch
T 9600 7700 5 10 1 1 0 3 1
refdes=A
}
N 13000 8000 14100 8000 4
{
T 13450 8050 5 10 1 1 0 0 1
netname=EA
}
C 9500 1800 1 0 0 gnd-1.sym
C 9500 3600 1 0 0 gnd-1.sym
C 9500 5400 1 0 0 gnd-1.sym
C 9500 7200 1 0 0 gnd-1.sym
C 9400 3500 1 0 0 vdd-1.sym
C 9400 5300 1 0 0 vdd-1.sym
C 9400 7100 1 0 0 vdd-1.sym
C 9400 8900 1 0 0 vdd-1.sym
C 12600 6000 1 90 0 in-1.sym
{
T 12100 6000 5 10 0 0 90 0 1
footprint=anchor
T 12300 6000 5 10 0 0 90 0 1
device=INPUT
T 12500 6000 5 10 1 1 90 7 1
refdes=N#
}
C 13500 6800 1 0 0 in-1.sym
{
T 13500 7300 5 10 0 0 0 0 1
footprint=anchor
T 13500 7100 5 10 0 0 0 0 1
device=INPUT
T 13600 6950 5 10 1 1 0 0 1
refdes=AND
}
C 13500 6600 1 0 0 in-1.sym
{
T 13500 7100 5 10 0 0 0 0 1
footprint=anchor
T 13500 6900 5 10 0 0 0 0 1
device=INPUT
T 13600 6650 5 10 1 1 0 2 1
refdes=OR
}
C 16500 6900 1 0 1 in-1.sym
{
T 16500 7400 5 10 0 0 0 6 1
footprint=anchor
T 16500 7200 5 10 0 0 0 6 1
device=INPUT
T 16200 7050 5 10 1 1 0 3 1
refdes=CS#
}
C 16500 6700 1 0 1 in-1.sym
{
T 16500 7200 5 10 0 0 0 6 1
footprint=anchor
T 16500 7000 5 10 0 0 0 6 1
device=INPUT
T 16200 6800 5 10 1 1 0 5 1
refdes=CR
}
C 15300 5600 1 90 0 in-1.sym
{
T 14800 5600 5 10 0 0 90 0 1
footprint=anchor
T 15000 5600 5 10 0 0 90 0 1
device=INPUT
T 15200 5600 5 10 1 1 0 5 1
refdes=Ci#
}
C 15900 8500 1 0 0 out-1.sym
{
T 15900 9000 5 10 0 0 0 0 1
footprint=anchor
T 15900 8800 5 10 0 0 0 0 1
device=OUTPUT
T 16200 8650 5 10 1 1 0 3 1
refdes=Co#
}
C 8200 8300 1 0 0 in-1.sym
{
T 8200 8800 5 10 0 0 0 0 1
footprint=anchor
T 8200 8600 5 10 0 0 0 0 1
device=INPUT
T 8200 8400 5 10 1 1 0 7 1
refdes=WA
}
C 8200 7900 1 0 0 in-1.sym
{
T 8200 8400 5 10 0 0 0 0 1
footprint=anchor
T 8200 8200 5 10 0 0 0 0 1
device=INPUT
T 8200 8000 5 10 1 1 0 7 1
refdes=RA
}
C 8200 6500 1 0 0 in-1.sym
{
T 8200 7000 5 10 0 0 0 0 1
footprint=anchor
T 8200 6800 5 10 0 0 0 0 1
device=INPUT
T 8200 6600 5 10 1 1 0 7 1
refdes=WX
}
C 8200 6100 1 0 0 in-1.sym
{
T 8200 6600 5 10 0 0 0 0 1
footprint=anchor
T 8200 6400 5 10 0 0 0 0 1
device=INPUT
T 8200 6200 5 10 1 1 0 7 1
refdes=RX
}
C 8200 4700 1 0 0 in-1.sym
{
T 8200 5200 5 10 0 0 0 0 1
footprint=anchor
T 8200 5000 5 10 0 0 0 0 1
device=INPUT
T 8200 4800 5 10 1 1 0 7 1
refdes=WY
}
C 8200 4300 1 0 0 in-1.sym
{
T 8200 4800 5 10 0 0 0 0 1
footprint=anchor
T 8200 4600 5 10 0 0 0 0 1
device=INPUT
T 8200 4400 5 10 1 1 0 7 1
refdes=RY
}
C 8200 2900 1 0 0 in-1.sym
{
T 8200 3400 5 10 0 0 0 0 1
footprint=anchor
T 8200 3200 5 10 0 0 0 0 1
device=INPUT
T 8200 3000 5 10 1 1 0 7 1
refdes=WU
}
C 8200 2500 1 0 0 in-1.sym
{
T 8200 3000 5 10 0 0 0 0 1
footprint=anchor
T 8200 2800 5 10 0 0 0 0 1
device=INPUT
T 8200 2600 5 10 1 1 0 7 1
refdes=RU
}
C 14700 5900 1 0 0 gnd-1.sym
C 14600 8600 1 0 0 vdd-1.sym
C 12000 7500 1 0 0 in-1.sym
{
T 12000 8000 5 10 0 0 0 0 1
footprint=anchor
T 12000 7800 5 10 0 0 0 0 1
device=INPUT
T 12000 7600 5 10 1 1 0 7 1
refdes=AS
}
C 12500 9000 1 270 0 in-1.sym
{
T 13000 9000 5 10 0 0 270 0 1
footprint=anchor
T 12800 9000 5 10 0 0 270 0 1
device=INPUT
T 12600 9000 5 10 1 1 0 3 1
refdes=AR#
}
C 11800 5500 1 0 1 gnd-1.sym
C 15000 1100 1 0 1 gnd-1.sym
C 15100 2900 1 0 1 vdd-1.sym
C 13700 1900 1 0 1 gnd-1.sym
C 13700 1100 1 0 1 gnd-1.sym
N 12500 6800 12100 6800 4
N 12100 6800 12100 5000 4
{
T 12050 6700 5 10 1 1 90 6 1
netname=Bi
}
C 14000 1400 1 0 1 nmos-switch.sym
{
T 13775 1700 5 8 1 1 0 7 1
refdes=M3
T 13900 2200 5 8 0 1 0 6 1
value=NMOS_switch
T 13500 2000 5 8 0 1 0 6 1
footprint=sot23-nmos
T 12500 2000 5 8 0 1 0 6 1
device=NMOS
}
C 14000 2200 1 0 1 nmos-switch.sym
{
T 13775 2500 5 8 1 1 0 7 1
refdes=M2
T 13900 3000 5 8 0 1 0 6 1
value=NMOS_switch
T 13500 2800 5 8 0 1 0 6 1
footprint=sot23-nmos
T 12500 2800 5 8 0 1 0 6 1
device=NMOS
}
N 13400 1900 13600 1900 4
{
T 13350 1900 5 10 1 1 0 7 1
netname=W
}
C 14600 500 1 0 1 in-1.sym
{
T 14600 1000 5 10 0 0 0 6 1
footprint=anchor
T 14600 800 5 10 0 0 180 2 1
device=INPUT
T 14600 600 5 10 1 1 0 1 1
refdes=ϕ
}
N 15600 7700 15700 7700 4
N 15700 7700 15700 2500 4
C 12200 7700 1 0 0 not.sym
{
T 12550 8000 5 10 1 1 0 4 1
refdes=I5
}
C 12900 5900 1 0 1 gnd-1.sym
C 12600 7200 1 0 0 vdd-1.sym
N 13300 6700 13300 7600 4
N 13300 7600 14100 7600 4
{
T 13500 7650 5 10 1 1 0 0 1
netname=EB
}
N 15900 7000 15600 7000 4
N 15900 6800 15600 6800 4
C 11500 8000 1 90 0 out-1.sym
{
T 11000 8000 5 10 0 0 90 0 1
footprint=anchor
T 11200 8000 5 10 0 0 90 0 1
device=OUTPUT
T 11400 8600 5 10 1 1 180 5 1
refdes=Ao#
}
C 11300 7800 1 270 0 out-1.sym
{
T 11800 7800 5 10 0 0 270 0 1
footprint=anchor
T 11600 7800 5 10 0 0 270 0 1
device=OUTPUT
T 11400 7200 5 10 1 1 180 3 1
refdes=Ao
}
N 11400 7800 10400 7800 4
N 10400 8000 12200 8000 4
{
T 10950 8050 5 10 1 1 0 3 1
netname=Ao#
}
C 600 6900 1 0 0 sramcell.sym
{
T 1950 7150 5 10 1 1 0 6 1
refdes=L0
T 1400 7625 5 8 1 1 0 4 1
source=sramcell.sch
}
C 2400 6900 1 0 0 sramcell.sym
{
T 3750 7150 5 10 1 1 0 6 1
refdes=L1
T 3200 7625 5 8 1 1 0 4 1
source=sramcell.sch
}
C 4200 6900 1 0 0 sramcell.sym
{
T 5550 7150 5 10 1 1 0 6 1
refdes=L2
T 5000 7625 5 8 1 1 0 4 1
source=sramcell.sch
}
C 6000 6900 1 0 0 sramcell.sym
{
T 7350 7150 5 10 1 1 0 6 1
refdes=L3
T 6800 7625 5 8 1 1 0 4 1
source=sramcell.sch
}
C 700 6800 1 90 0 in-1.sym
{
T 200 6800 5 10 0 0 90 0 1
footprint=anchor
T 400 6800 5 10 0 0 90 0 1
device=INPUT
T 600 6800 5 10 1 1 0 5 1
refdes=S0
}
C 2500 6800 1 90 0 in-1.sym
{
T 2000 6800 5 10 0 0 90 0 1
footprint=anchor
T 2200 6800 5 10 0 0 90 0 1
device=INPUT
T 2400 6800 5 10 1 1 0 5 1
refdes=S1
}
C 4300 6800 1 90 0 in-1.sym
{
T 3800 6800 5 10 0 0 90 0 1
footprint=anchor
T 4000 6800 5 10 0 0 90 0 1
device=INPUT
T 4200 6800 5 10 1 1 0 5 1
refdes=S2
}
C 6100 6800 1 90 0 in-1.sym
{
T 5600 6800 5 10 0 0 90 0 1
footprint=anchor
T 5800 6800 5 10 0 0 90 0 1
device=INPUT
T 6000 6800 5 10 1 1 0 5 1
refdes=S3
}
C 3100 6600 1 0 0 gnd-1.sym
N 2200 7800 2200 8600 4
N 2200 8600 7600 8600 4
{
T 7100 8650 5 10 1 1 0 0 1
netname=SB#
}
N 7600 8600 7600 7800 4
N 600 7800 600 8500 4
N 600 8500 6000 8500 4
{
T 1100 8550 5 10 1 1 0 0 1
netname=SB
}
N 6000 7800 6000 8500 4
N 5800 7800 5800 8600 4
N 4200 7800 4200 8500 4
N 4000 7800 4000 8600 4
N 2400 7800 2400 8500 4
C 4400 3700 1 0 1 nmos-switch.sym
{
T 4175 4000 5 8 1 1 0 7 1
refdes=M1
T 4300 4500 5 10 0 1 0 6 1
value=NMOS_switch
T 3900 4300 5 10 0 1 0 6 1
footprint=sot23-nmos
T 2900 4300 5 10 0 1 0 6 1
device=NMOS
}
C 3900 2300 1 0 0 gnd-1.sym
N 4000 3800 4000 3100 4
{
T 3975 3600 5 6 1 1 90 3 1
netname=_sb#
}
C 5000 4100 1 180 0 in-1.sym
{
T 5000 3600 5 10 0 0 180 0 1
footprint=anchor
T 5000 3800 5 10 0 0 180 0 1
device=INPUT
T 5000 4000 5 10 1 1 0 1 1
refdes=Ret
}
C 2900 5000 1 270 0 in-1.sym
{
T 3400 5000 5 10 0 0 270 0 1
footprint=anchor
T 3200 5000 5 10 0 0 270 0 1
device=INPUT
T 3150 4650 5 10 1 1 90 0 1
refdes=Inc
}
N 3800 4300 4700 4300 4
{
T 4300 4350 5 10 1 1 0 3 1
netname=Pn#
}
N 2700 4200 3000 4200 4
N 4000 2600 4000 2700 4
N 4000 4200 4000 4300 4
C 2400 2900 1 0 0 in-1.sym
{
T 2400 3400 5 10 0 0 0 0 1
footprint=anchor
T 2400 3200 5 10 0 0 0 0 1
device=INPUT
T 2500 2950 5 10 1 1 180 6 1
refdes=Jump
}
C 5800 4100 1 0 0 gnd-1.sym
C 5100 4400 1 0 0 dpflipflops.sym
{
T 5900 5075 5 8 1 1 0 4 1
source=dpflipflops.sch
T 6450 4650 5 10 1 1 0 6 1
refdes=F
}
C 1200 8300 1 0 0 vdd-1.sym
C 5700 5900 1 0 0 vdd-1.sym
C 6900 5400 1 180 1 out-1.sym
{
T 6900 4900 5 10 0 0 180 6 1
footprint=anchor
T 6900 5100 5 10 0 0 180 6 1
device=OUTPUT
T 7175 5275 5 10 1 1 180 6 1
refdes=P
}
C 6900 5400 1 0 0 out-1.sym
{
T 6900 5900 5 10 0 0 0 0 1
footprint=anchor
T 6900 5700 5 10 0 0 0 0 1
device=OUTPUT
T 7175 5525 5 10 1 1 0 0 1
refdes=P#
}
C 14100 0 1 0 1 gnd-1.sym
C 14600 200 1 0 1 in-1.sym
{
T 14600 700 5 10 0 0 0 6 1
footprint=anchor
T 14600 500 5 10 0 0 0 6 1
device=INPUT
T 14600 300 5 10 1 1 0 1 1
refdes=GND
}
C 14600 800 1 0 1 in-1.sym
{
T 14600 1300 5 10 0 0 0 3 1
footprint=anchor
T 14600 1100 5 10 0 0 0 3 1
device=INPUT
T 14600 900 5 10 1 1 0 1 1
refdes=Vdd
}
C 14200 900 1 0 1 vdd-1.sym
N 6900 5500 6700 5500 4
{
T 6800 5550 5 10 1 1 0 3 1
netname=P#
}
N 6900 5300 6700 5300 4
{
T 6800 5250 5 10 1 1 0 5 1
netname=P
}
C 1300 6600 1 0 0 gnd-1.sym
C 6700 6600 1 0 0 gnd-1.sym
C 4900 6600 1 0 0 gnd-1.sym
C 3000 8300 1 0 0 vdd-1.sym
C 6600 8300 1 0 0 vdd-1.sym
C 4800 8300 1 0 0 vdd-1.sym
C 800 300 1 0 0 dflipflops.sym
{
T 2150 550 5 10 1 1 0 6 1
refdes=G
T 1600 950 5 8 1 1 0 4 1
source=dflipflops.sch
}
C 600 2000 1 270 0 in-1.sym
{
T 1100 2000 5 10 0 0 270 0 1
footprint=anchor
T 900 2000 5 10 0 0 270 0 1
device=INPUT
T 700 2000 5 10 1 1 0 3 1
refdes=O
}
C 2600 1400 1 90 0 out-1.sym
{
T 2300 1400 5 10 0 0 90 0 1
device=OUTPUT
T 2500 2000 5 10 1 1 0 3 1
refdes=I
T 2100 1400 5 10 0 0 90 0 1
footprint=anchor
}
C 2400 1200 1 270 0 out-1.sym
{
T 2700 1200 5 10 0 0 270 0 1
device=OUTPUT
T 2500 600 5 10 1 1 0 5 1
refdes=I#
T 2900 1200 5 10 0 0 270 0 1
footprint=anchor
}
C 13800 500 1 0 0 phi.sym
C 1400 1800 1 0 0 vdd-1.sym
C 1500 0 1 0 0 gnd-1.sym
C 600 700 1 0 0 phi.sym
C 4900 4800 1 0 0 phi.sym
C 16300 5700 1 0 1 in-1.sym
{
T 16300 6200 5 10 0 0 0 6 1
footprint=anchor
T 16300 6000 5 10 0 0 0 6 1
device=INPUT
T 16000 5800 5 10 1 1 0 5 1
refdes=Q
}
C 8800 300 1 0 0 sramcell2t.sym
{
T 9600 1000 5 8 1 1 0 4 1
source=sramcell2t.sch
T 10150 500 5 10 1 1 0 6 1
refdes=K
}
C 9500 0 1 0 0 gnd-1.sym
C 9400 1700 1 0 0 vdd-1.sym
C 8200 700 1 0 0 in-1.sym
{
T 8200 1200 5 10 0 0 0 0 1
footprint=anchor
T 8200 1000 5 10 0 0 0 0 1
device=INPUT
T 8200 800 5 10 1 1 0 7 1
refdes=RK
}
C 14900 3500 1 0 0 nandod.sym
{
T 15300 4000 5 10 1 1 0 4 1
refdes=S8
}
C 15300 3200 1 0 1 gnd-1.sym
C 14300 4000 1 0 0 in-1.sym
{
T 14300 4500 5 10 0 0 0 0 1
footprint=anchor
T 14300 4300 5 10 0 0 180 8 1
device=INPUT
T 14300 4100 5 10 1 1 0 7 1
refdes=K#
}
C 14300 3800 1 0 0 in-1.sym
{
T 14300 4300 5 10 0 0 0 0 1
footprint=anchor
T 14300 4100 5 10 0 0 180 8 1
device=INPUT
T 14300 3900 5 10 1 1 0 7 1
refdes=CON
}
C 16500 7800 1 0 1 in-1.sym
{
T 16500 8300 5 10 0 0 0 6 1
footprint=anchor
T 16500 8100 5 10 0 0 180 2 1
device=INPUT
T 16250 7950 5 10 1 1 0 3 1
refdes=QE
}
C 2400 3100 1 0 0 in-1.sym
{
T 2400 3600 5 10 0 0 0 0 1
footprint=anchor
T 2400 3400 5 10 0 0 180 8 1
device=INPUT
T 2400 3200 5 10 1 1 0 7 1
refdes=J
}
C 11000 200 1 0 0 gnd-1.sym
C 11200 1100 1 90 0 out-1.sym
{
T 10700 1100 5 10 0 0 90 0 1
footprint=anchor
T 10900 1100 5 10 0 0 90 0 1
device=OUTPUT
T 11100 1725 5 10 1 1 0 3 1
refdes=Z
}
C 10700 500 1 0 0 nmos-switch.sym
{
T 10925 800 5 8 1 1 0 1 1
refdes=M4
T 10800 1300 5 10 0 1 0 0 1
value=NMOS_switch
T 11200 1100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 12200 1100 5 10 0 1 0 0 1
device=NMOS
}
N 15900 7900 15600 7900 4
C 11300 5800 1 0 0 notb.sym
{
T 11625 6100 5 10 1 1 0 4 1
refdes=I4
}
C 11900 6400 1 0 1 vdd-1.sym
C 1000 3200 1 90 0 in-1.sym
{
T 700 3200 5 10 0 0 90 0 1
device=INPUT
T 500 3200 5 10 0 0 90 0 1
footprint=anchor
T 900 3175 5 10 1 1 180 3 1
refdes=PCi
}
N 13400 2700 13600 2700 4
{
T 13350 2700 5 10 1 1 0 7 1
netname=W#
}
N 8600 1400 8800 1400 4
{
T 8550 1400 5 10 1 1 0 7 1
netname=W#
}
N 8600 3200 8800 3200 4
{
T 8550 3200 5 10 1 1 0 7 1
netname=W#
}
N 8600 5000 8800 5000 4
{
T 8550 5000 5 10 1 1 0 7 1
netname=W#
}
N 8600 6800 8800 6800 4
{
T 8550 6800 5 10 1 1 0 7 1
netname=W#
}
N 8600 8600 8800 8600 4
{
T 8550 8600 5 10 1 1 0 7 1
netname=W#
}
N 10600 1400 10400 1400 4
{
T 10650 1400 5 10 1 1 0 1 1
netname=W
}
N 10600 3200 10400 3200 4
{
T 10650 3200 5 10 1 1 0 1 1
netname=W
}
N 10600 5000 10400 5000 4
{
T 10650 5000 5 10 1 1 0 1 1
netname=W
}
N 10600 6800 10400 6800 4
{
T 10650 6800 5 10 1 1 0 1 1
netname=W
}
N 10600 8600 10400 8600 4
{
T 10650 8600 5 10 1 1 0 1 1
netname=W
}
N 8600 600 8800 600 4
{
T 8550 600 5 10 1 1 0 7 1
netname=Bi#
}
N 8600 2400 8800 2400 4
{
T 8550 2400 5 10 1 1 0 7 1
netname=Bi#
}
N 8600 4200 8800 4200 4
{
T 8550 4200 5 10 1 1 0 7 1
netname=Bi#
}
N 8600 6000 8800 6000 4
{
T 8550 6000 5 10 1 1 0 7 1
netname=Bi#
}
N 8600 7800 8800 7800 4
{
T 8550 7800 5 10 1 1 0 7 1
netname=Bi#
}
N 11100 6100 11300 6100 4
{
T 11050 6100 5 10 1 1 0 7 1
netname=Bi#
}
C 8600 1100 1 0 0 phi.sym
C 1900 3900 1 0 0 not.sym
{
T 2250 4200 5 10 1 1 0 4 1
refdes=I3
}
C 1800 3800 1 270 0 out-1.sym
{
T 2100 3800 5 10 0 0 270 0 1
device=OUTPUT
T 2300 3800 5 10 0 0 270 0 1
footprint=anchor
T 1900 3175 5 10 1 1 0 5 1
refdes=PCo
}
N 1900 5600 1900 4200 4
{
T 1900 4900 5 10 1 1 90 2 1
netname=Pp#
}
C 1300 3100 1 0 0 gnd-1.sym
C 2200 3600 1 0 0 gnd-1.sym
C 1200 4600 1 0 0 vdd-1.sym
C 2100 4500 1 0 0 vdd-1.sym
N 700 4200 900 4200 4
{
T 650 4200 5 10 1 1 0 7 1
netname=P
}
C 3000 3800 1 0 0 nand.sym
{
T 3400 4300 5 10 1 1 0 4 1
refdes=S6
}
C 3100 4800 1 0 0 vdd-1.sym
C 3000 2600 1 0 0 nandod.sym
{
T 3400 3100 5 10 1 1 0 4 1
refdes=S7
}
C 3200 2300 1 0 0 gnd-1.sym
C 3200 3500 1 0 0 gnd-1.sym
N 3800 3100 3800 4300 4
N 2700 5600 2700 4200 4
{
T 2650 4900 5 10 1 1 90 0 1
netname=Pp
}
N 5300 2900 5500 2900 4
{
T 5550 2900 5 10 1 1 0 1 1
netname=SB
}
B 300 0 16300 9200 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
L 7800 9200 7800 0 5 0 1 0 -1 -1
T 16550 9200 9 12 1 0 0 8 1
Register file and arithmetic unit
L 7800 6500 300 6500 5 0 1 0 -1 -1
T 7750 9200 9 12 1 0 0 8 1
Stack memory
T 7750 6500 9 12 1 0 0 8 1
Program counter and branch
L 300 2300 7800 2300 5 0 1 0 -1 -1
T 1600 2325 9 12 1 0 0 5 1
Instruction Bit
C 1700 6000 1 0 0 in-1.sym
{
T 1700 6500 5 10 0 0 0 3 1
footprint=anchor
T 1700 6300 5 10 0 0 0 3 1
device=INPUT
T 2100 6150 5 10 1 1 0 3 1
refdes=VPush
}
C 3500 5300 1 0 0 pdtc124.sym
{
T 4200 5800 5 10 0 1 0 0 1
footprint=sot323-bjt
T 3600 6000 5 10 0 1 0 0 1
value=PDTC124TU
T 3700 5600 5 8 1 1 0 1 1
refdes=Q2
}
C 1100 5300 1 0 1 pdtc124.sym
{
T 400 5800 5 10 0 1 0 6 1
footprint=sot323-bjt
T 1000 6000 5 10 0 1 0 6 1
value=PDTC124TU
T 900 5600 5 8 1 1 0 7 1
refdes=Q1
}
C 1400 5000 1 0 0 gnd-1.sym
C 3000 5000 1 0 0 gnd-1.sym
N 3900 5300 3900 5400 4
N 700 5400 700 5300 4
N 3900 5800 3900 6000 4
{
T 3900 6050 5 10 1 1 0 3 1
netname=SB
}
N 700 5800 700 6000 4
{
T 700 6050 5 10 1 1 0 3 1
netname=SB#
}
C 1900 5300 1 0 1 not.sym
{
T 1550 5600 5 10 1 1 0 4 1
refdes=I1
}
C 2700 5300 1 0 0 not.sym
{
T 3050 5600 5 10 1 1 0 4 1
refdes=I2
}
C 600 5000 1 0 0 gnd-1.sym
C 3800 5000 1 0 0 gnd-1.sym
N 1500 5900 3100 5900 4
N 2300 6100 2300 5900 4
T 7750 2300 9 12 1 0 0 8 1
Refresh Address
C 13000 4400 1 0 1 gnd-1.sym
C 12700 5300 1 0 0 vdd-1.sym
C 14200 5000 1 90 0 out-1.sym
{
T 13700 5000 5 10 0 0 90 0 1
footprint=anchor
T 13900 5000 5 10 0 0 90 0 1
device=OUTPUT
T 14100 5600 5 10 1 1 90 1 1
refdes=B
}
C 13400 5000 1 90 0 out-1.sym
{
T 12900 5000 5 10 0 0 90 0 1
footprint=anchor
T 13100 5000 5 10 0 0 90 0 1
device=OUTPUT
T 13300 5600 5 10 1 1 90 1 1
refdes=B#
}
C 12500 4700 1 0 0 cnot.sym
{
T 12825 5000 5 10 1 1 0 4 1
refdes=B2
}
C 13300 4700 1 0 0 cnot.sym
{
T 13625 5000 5 10 1 1 0 4 1
refdes=B3
}
C 13800 4400 1 0 1 gnd-1.sym
C 13500 5300 1 0 0 vdd-1.sym
C 12500 6200 1 0 0 xnor.sym
{
T 12700 6800 5 10 1 1 0 0 1
refdes=N
}
N 15900 8600 15200 8600 4
C 900 3400 1 0 0 halfadd.sym
{
T 1400 3700 5 10 1 1 0 4 1
refdes=S4
}
N 700 4000 900 4000 4
{
T 650 4000 5 10 1 1 0 7 1
netname=P#
}
C 13400 8000 1 90 0 schottky.sym
{
T 12200 8300 5 10 0 1 90 0 1
footprint=SOD523
T 12703 8297 5 10 0 0 90 0 1
device=DIODE
T 13300 8400 5 10 1 1 0 0 1
refdes=D1
T 12350 8300 5 10 0 1 90 0 1
value=RB751S40
}
N 12600 8400 12600 8300 4
N 13200 8400 12600 8400 4
N 12600 7600 12600 7700 4
L 3700 2300 3700 0 5 0 1 0 -1 -1
N 14100 1700 14100 2300 4
N 13600 1400 13600 1500 4
N 13600 2200 13600 2300 4
C 15700 1400 1 0 1 diplatch.sym
{
T 14350 1900 5 10 1 1 0 1 1
refdes=L
T 14900 2075 5 8 1 1 0 4 1
source=diplatch.sch
}
C 15900 1800 1 0 1 phi.sym
N 14000 2500 14100 2500 4
{
T 14050 2525 5 6 1 1 0 3 1
netname=Wg
}
N 14100 1700 14000 1700 4
{
T 14050 1675 5 6 1 1 0 5 1
netname=Wg#
}
C 11800 1100 1 270 0 led-green.sym
{
T 11850 950 5 10 1 1 0 6 1
refdes=D2
T 12400 1100 5 10 0 0 270 0 1
device=LED
T 12100 700 5 10 0 1 270 0 1
value=ledgreen
T 11900 800 5 10 0 1 0 0 1
footprint=0805-diode
}
C 12000 1200 1 90 0 resistor-1.sym
{
T 11600 1500 5 10 0 0 90 0 1
device=RESISTOR
T 11850 1900 5 10 1 1 0 6 1
refdes=R4
T 11800 1600 5 10 1 1 0 6 1
value=1k5
T 11900 1700 5 10 0 1 0 0 1
footprint=0603
}
C 12000 2700 1 270 0 in-1.sym
{
T 12500 2700 5 10 0 0 270 3 1
footprint=anchor
T 12300 2700 5 10 0 0 270 3 1
device=INPUT
T 12100 2700 5 10 1 1 0 3 1
refdes=Bling
}
C 12200 2100 1 270 0 led-red.sym
{
T 12350 1950 5 10 1 1 0 0 1
refdes=D3
T 12800 2100 5 10 0 0 270 0 1
device=LED
T 12500 1700 5 10 0 1 270 0 1
value=ledred
T 12400 1800 5 10 0 1 0 0 1
footprint=0805-diode
}
C 12400 600 1 90 0 resistor-1.sym
{
T 12000 900 5 10 0 0 90 0 1
device=RESISTOR
T 12350 800 5 10 1 1 0 2 1
refdes=R5
T 12400 1000 5 10 1 1 0 0 1
value=1k5
T 12400 1100 5 10 0 1 0 0 1
footprint=0603
}
N 12300 400 12300 600 4
{
T 12300 350 5 10 1 1 0 5 1
netname=P#
}
N 11900 400 11900 600 4
{
T 11900 350 5 10 1 1 0 5 1
netname=Ao#
}
N 11900 2100 12300 2100 4
N 11100 1100 11100 1000 4
N 10700 800 10400 800 4
{
T 10550 825 5 10 1 1 0 3 1
netname=K
}
N 11100 500 11100 600 4
C 4400 2600 1 0 1 npn.sym
{
T 4175 2900 5 8 1 1 0 7 1
refdes=Q3
T 3700 3100 5 10 0 1 0 6 1
footprint=sot323-hbt
T 4300 3300 5 10 0 1 0 6 1
value=BC847BW
}
C 4400 2800 1 0 0 resistor-load.sym
{
T 4700 3200 5 10 0 0 0 0 1
device=RESISTOR
T 5050 2950 5 10 1 1 0 0 1
refdes=R6
T 4600 3600 5 10 0 1 0 0 1
footprint=0603-load
T 4600 3800 5 10 0 1 0 0 1
value=rload
}
N 4700 4300 4700 5500 4
N 4700 5500 5100 5500 4
N 700 1400 800 1400 4
N 2500 1400 2400 1400 4
N 2500 1200 2400 1200 4
C 11500 5600 1 180 1 schottky.sym
{
T 11800 4400 5 10 0 1 180 6 1
footprint=SOD523
T 11797 4903 5 10 0 0 180 6 1
device=DIODE
T 11550 5450 5 10 1 1 0 6 1
refdes=D4
T 11800 4550 5 10 0 1 180 6 1
value=RB751S40
}
N 11900 5400 12100 5400 4
N 11300 6100 11300 5400 4
N 11300 5400 11500 5400 4
C 4400 3600 1 180 0 schottky.sym
{
T 4100 2400 5 10 0 1 180 0 1
footprint=SOD523
T 4103 2903 5 10 0 0 180 0 1
device=DIODE
T 4350 3450 5 10 1 1 0 0 1
refdes=D5
T 4100 2550 5 10 0 1 180 0 1
value=RB751S40
}
N 4400 3400 4400 2900 4
{
T 4425 3200 5 6 1 1 0 1 1
netname=_sb
}
C 11400 4500 1 90 0 resistor-pull.sym
{
T 11000 4800 5 10 0 0 90 0 1
device=RESISTOR
T 11250 5150 5 10 1 1 0 6 1
refdes=R1
T 10600 4700 5 10 0 1 90 0 1
footprint=0603-pull
T 10400 4700 5 10 0 1 90 0 1
value=rpull
}
C 11400 4200 1 0 1 gnd-1.sym
N 11900 1200 11900 1100 4
{
T 11850 1200 5 6 1 1 0 7 1
netname=_d2
}
N 12300 1600 12300 1500 4
{
T 12350 1500 5 6 1 1 0 1 1
netname=_d3
}
C 5200 400 1 0 0 sramcell2.sym
{
T 6000 1100 5 8 1 1 0 4 1
source=sramcell2.sch
T 6550 600 5 10 1 1 0 6 1
refdes=R
}
C 5900 100 1 0 0 gnd-1.sym
C 5800 1800 1 0 0 vdd-1.sym
C 4600 1200 1 0 0 in-1.sym
{
T 4600 1700 5 10 0 0 0 0 1
footprint=anchor
T 4600 1500 5 10 0 0 0 0 1
device=INPUT
T 4600 1300 5 10 1 1 0 7 1
refdes=WR
}
C 4600 800 1 0 0 in-1.sym
{
T 4600 1300 5 10 0 0 0 0 1
footprint=anchor
T 4600 1100 5 10 0 0 0 0 1
device=INPUT
T 4600 900 5 10 1 1 0 7 1
refdes=RR
}
N 5000 1500 5200 1500 4
{
T 4950 1500 5 10 1 1 0 7 1
netname=W#
}
N 7000 1500 6800 1500 4
{
T 7050 1500 5 10 1 1 0 1 1
netname=W
}
N 5000 700 5200 700 4
{
T 4950 700 5 10 1 1 0 7 1
netname=Bi#
}
N 12100 5000 12500 5000 4
C 1900 8700 1 0 0 resistor-pull.sym
{
T 2200 9100 5 10 0 0 0 0 1
device=RESISTOR
T 2550 8850 5 10 1 1 0 0 1
refdes=R2
T 2100 9500 5 10 0 1 0 0 1
footprint=0603-pull
T 2000 8900 5 10 1 1 0 6 1
value=47k
}
N 1900 8800 1900 8500 4
C 2600 8800 1 0 0 vdd-1.sym
