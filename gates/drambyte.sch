v 20220529 2
C 300 2950 1 0 0 in-1.sym
{
T 300 3450 5 10 0 0 0 0 1
footprint=anchor
T 300 3250 5 10 0 0 0 0 1
device=INPUT
T 300 3050 5 10 1 1 180 1 1
refdes=H
}
C 300 2550 1 0 0 in-1.sym
{
T 300 3050 5 10 0 0 0 0 1
footprint=anchor
T 300 2850 5 10 0 0 0 0 1
device=INPUT
T 300 2644 5 10 1 1 0 7 1
refdes=L#
}
C 2700 1700 1 90 0 in-1.sym
{
T 2200 1700 5 10 0 0 90 0 1
footprint=anchor
T 2400 1700 5 10 0 0 90 0 1
device=INPUT
T 2600 1700 5 10 1 1 180 3 1
refdes=B0
}
N 2200 1200 8500 1200 4
{
T 2800 1250 5 10 1 1 0 0 1
netname=S
}
C 300 3300 1 0 0 in-1.sym
{
T 300 3800 5 10 0 0 0 0 1
footprint=anchor
T 300 3600 5 10 0 0 0 0 1
device=INPUT
T 300 3400 5 10 1 1 0 7 1
refdes=Vdd
}
C 300 1350 1 0 0 in-1.sym
{
T 300 1850 5 10 0 0 0 0 1
footprint=anchor
T 300 1650 5 10 0 0 0 0 1
device=INPUT
T 300 1450 5 10 1 1 0 7 1
refdes=Vss
}
C 700 3400 1 0 0 vdd-1.sym
C 2800 2300 1 90 0 capacitor.sym
{
T 2100 2500 5 10 0 0 90 0 1
device=CAPACITOR
T 2625 2475 5 8 1 1 0 2 1
refdes=C0
T 1900 2500 5 10 0 0 90 0 1
symversion=0.1
T 2625 2625 5 8 1 1 0 0 1
value=680p
T 2600 2500 5 10 0 1 0 0 1
footprint=0603-cap
}
N 2600 3000 2600 2800 4
{
T 2600 2850 5 8 1 1 0 0 1
netname=V0
}
C 3600 1700 1 90 0 in-1.sym
{
T 3100 1700 5 10 0 0 90 0 1
footprint=anchor
T 3300 1700 5 10 0 0 90 0 1
device=INPUT
T 3500 1700 5 10 1 1 180 3 1
refdes=B1
}
C 3700 2300 1 90 0 capacitor.sym
{
T 3000 2500 5 10 0 0 90 0 1
device=CAPACITOR
T 2800 2500 5 10 0 0 90 0 1
symversion=0.1
T 3525 2475 5 8 1 1 0 2 1
refdes=C1
T 3525 2625 5 8 1 1 0 0 1
value=680p
T 3500 2500 5 10 0 1 0 0 1
footprint=0603-cap
}
N 3500 3400 3500 3200 4
C 4500 1700 1 90 0 in-1.sym
{
T 4000 1700 5 10 0 0 90 0 1
footprint=anchor
T 4200 1700 5 10 0 0 90 0 1
device=INPUT
T 4400 1700 5 10 1 1 180 3 1
refdes=B2
}
C 4600 2300 1 90 0 capacitor.sym
{
T 3900 2500 5 10 0 0 90 0 1
device=CAPACITOR
T 3700 2500 5 10 0 0 90 0 1
symversion=0.1
T 4425 2475 5 8 1 1 0 2 1
refdes=C2
T 4425 2625 5 8 1 1 0 0 1
value=680p
T 4400 2500 5 10 0 1 0 0 1
footprint=0603-cap
}
N 4400 3400 4400 3200 4
C 5400 1700 1 90 0 in-1.sym
{
T 4900 1700 5 10 0 0 90 0 1
footprint=anchor
T 5100 1700 5 10 0 0 90 0 1
device=INPUT
T 5300 1700 5 10 1 1 180 3 1
refdes=B3
}
C 5500 2300 1 90 0 capacitor.sym
{
T 4800 2500 5 10 0 0 90 0 1
device=CAPACITOR
T 4600 2500 5 10 0 0 90 0 1
symversion=0.1
T 5325 2475 5 8 1 1 0 2 1
refdes=C3
T 5325 2625 5 8 1 1 0 0 1
value=680p
T 5300 2500 5 10 0 1 0 0 1
footprint=0603-cap
}
N 5300 3400 5300 3200 4
C 6300 1700 1 90 0 in-1.sym
{
T 5800 1700 5 10 0 0 90 0 1
footprint=anchor
T 6000 1700 5 10 0 0 90 0 1
device=INPUT
T 6200 1700 5 10 1 1 180 3 1
refdes=B4
}
C 6400 2300 1 90 0 capacitor.sym
{
T 5700 2500 5 10 0 0 90 0 1
device=CAPACITOR
T 5500 2500 5 10 0 0 90 0 1
symversion=0.1
T 6225 2475 5 8 1 1 0 2 1
refdes=C4
T 6225 2625 5 8 1 1 0 0 1
value=680p
T 6200 2500 5 10 0 1 0 0 1
footprint=0603-cap
}
N 6200 3400 6200 3200 4
C 7200 1700 1 90 0 in-1.sym
{
T 6700 1700 5 10 0 0 90 0 1
footprint=anchor
T 6900 1700 5 10 0 0 90 0 1
device=INPUT
T 7100 1700 5 10 1 1 180 3 1
refdes=B5
}
C 7300 2300 1 90 0 capacitor.sym
{
T 6600 2500 5 10 0 0 90 0 1
device=CAPACITOR
T 6400 2500 5 10 0 0 90 0 1
symversion=0.1
T 7125 2475 5 8 1 1 0 2 1
refdes=C5
T 7125 2625 5 8 1 1 0 0 1
value=680p
T 7100 2500 5 10 0 1 0 0 1
footprint=0603-cap
}
N 7100 3400 7100 3200 4
C 8100 1700 1 90 0 in-1.sym
{
T 7600 1700 5 10 0 0 90 0 1
footprint=anchor
T 7800 1700 5 10 0 0 90 0 1
device=INPUT
T 8000 1700 5 10 1 1 180 3 1
refdes=B6
}
C 8200 2300 1 90 0 capacitor.sym
{
T 7500 2500 5 10 0 0 90 0 1
device=CAPACITOR
T 7300 2500 5 10 0 0 90 0 1
symversion=0.1
T 8025 2475 5 8 1 1 0 2 1
refdes=C6
T 8025 2625 5 8 1 1 0 0 1
value=680p
T 8000 2500 5 10 0 1 0 0 1
footprint=0603-cap
}
N 8000 3400 8000 3200 4
C 9000 1700 1 90 0 in-1.sym
{
T 8500 1700 5 10 0 0 90 0 1
footprint=anchor
T 8700 1700 5 10 0 0 90 0 1
device=INPUT
T 8900 1700 5 10 1 1 180 3 1
refdes=B7
}
C 9100 2300 1 90 0 capacitor.sym
{
T 8400 2500 5 10 0 0 90 0 1
device=CAPACITOR
T 8200 2500 5 10 0 0 90 0 1
symversion=0.1
T 8925 2475 5 8 1 1 0 2 1
refdes=C7
T 8925 2625 5 8 1 1 0 0 1
value=680p
T 8900 2500 5 10 0 1 0 0 1
footprint=0603-cap
}
N 8900 3400 8900 3200 4
N 900 3050 1300 3050 4
N 1300 3050 1300 2850 4
C 1400 1450 1 90 0 resistor-load.sym
{
T 1000 1750 5 10 0 0 90 0 1
device=RESISTOR
T 1250 2100 5 10 1 1 90 0 1
refdes=R1
T 1300 1850 5 10 0 1 90 0 1
footprint=0603-load
T 1300 1850 5 10 0 1 90 0 1
value=rload
}
N 1300 2350 1300 2450 4
N 3500 3000 3500 2800 4
{
T 3500 2850 5 8 1 1 0 0 1
netname=V1
}
N 4400 3000 4400 2800 4
{
T 4400 2850 5 8 1 1 0 0 1
netname=V2
}
N 5300 3000 5300 2800 4
{
T 5300 2850 5 8 1 1 0 0 1
netname=V3
}
N 6200 3000 6200 2800 4
{
T 6200 2850 5 8 1 1 0 0 1
netname=V4
}
N 7100 3000 7100 2800 4
{
T 7100 2850 5 8 1 1 0 0 1
netname=V5
}
N 8000 3000 8000 2800 4
{
T 8000 2850 5 8 1 1 0 0 1
netname=V6
}
N 8900 3000 8900 2800 4
{
T 8900 2850 5 8 1 1 0 0 1
netname=V7
}
N 2600 3200 2600 3400 4
C 900 2350 1 0 0 pmos-switch.sym
{
T 1125 2650 5 8 1 1 0 1 1
refdes=M
T 1000 3150 5 10 0 1 0 0 1
value=PMOS_switch
T 1400 2950 5 10 0 1 0 0 1
footprint=sot23-pmos
T 2400 2950 5 10 0 1 0 0 1
device=PMOS
}
N 2200 1200 2200 3100 4
N 3100 1200 3100 3100 4
N 4000 1200 4000 3100 4
N 4900 1200 4900 3100 4
N 5800 1200 5800 3100 4
N 6700 1200 6700 3100 4
N 7600 1200 7600 3100 4
N 8500 1200 8500 3100 4
C 2000 2700 1 0 0 jfet.sym
{
T 2400 3650 5 10 0 0 0 0 1
device=NFET_Transistor
T 2650 3100 5 10 1 1 0 0 1
refdes=J0
T 2400 4050 5 10 0 0 0 0 1
footprint=SOT23
}
C 2900 2700 1 0 0 jfet.sym
{
T 3300 3650 5 10 0 0 0 0 1
device=NFET_Transistor
T 3550 3100 5 10 1 1 0 0 1
refdes=J1
T 3300 4050 5 10 0 0 0 0 1
footprint=SOT23
}
C 3800 2700 1 0 0 jfet.sym
{
T 4200 3650 5 10 0 0 0 0 1
device=NFET_Transistor
T 4450 3100 5 10 1 1 0 0 1
refdes=J2
T 4200 4050 5 10 0 0 0 0 1
footprint=SOT23
}
C 4700 2700 1 0 0 jfet.sym
{
T 5100 3650 5 10 0 0 0 0 1
device=NFET_Transistor
T 5350 3100 5 10 1 1 0 0 1
refdes=J3
T 5100 4050 5 10 0 0 0 0 1
footprint=SOT23
}
C 5600 2700 1 0 0 jfet.sym
{
T 6000 3650 5 10 0 0 0 0 1
device=NFET_Transistor
T 6250 3100 5 10 1 1 0 0 1
refdes=J4
T 6000 4050 5 10 0 0 0 0 1
footprint=SOT23
}
C 6500 2700 1 0 0 jfet.sym
{
T 6900 3650 5 10 0 0 0 0 1
device=NFET_Transistor
T 7150 3100 5 10 1 1 0 0 1
refdes=J5
T 6900 4050 5 10 0 0 0 0 1
footprint=SOT23
}
C 7400 2700 1 0 0 jfet.sym
{
T 7800 3650 5 10 0 0 0 0 1
device=NFET_Transistor
T 8050 3100 5 10 1 1 0 0 1
refdes=J6
T 7800 4050 5 10 0 0 0 0 1
footprint=SOT23
}
C 8300 2700 1 0 0 jfet.sym
{
T 8700 3650 5 10 0 0 0 0 1
device=NFET_Transistor
T 8950 3100 5 10 1 1 0 0 1
refdes=J7
T 8700 4050 5 10 0 0 0 0 1
footprint=SOT23
}
C 2400 3400 1 0 0 vdd-1.sym
C 3300 3400 1 0 0 vdd-1.sym
C 4200 3400 1 0 0 vdd-1.sym
C 5100 3400 1 0 0 vdd-1.sym
C 6000 3400 1 0 0 vdd-1.sym
C 6900 3400 1 0 0 vdd-1.sym
C 7800 3400 1 0 0 vdd-1.sym
C 8700 3400 1 0 0 vdd-1.sym
N 900 1450 1300 1450 4
C 1300 2250 1 0 0 resistor-strong.sym
{
T 1600 2650 5 10 0 0 0 0 1
device=RESISTOR
T 1950 2400 5 10 1 1 0 0 1
refdes=R2
T 2300 2150 5 10 0 1 0 0 1
footprint=0603-strong
T 1750 2500 5 10 1 1 0 3 1
value=100
}
