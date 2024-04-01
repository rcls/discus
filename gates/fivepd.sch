v 20220529 2
C 43500 66500 1 0 0 in-1.sym
{
T 43500 67000 5 10 0 0 0 0 1
footprint=anchor
T 43500 66800 5 10 0 0 0 0 1
device=INPUT
T 43500 66600 5 10 1 1 0 7 1
refdes=A1
}
C 48400 66500 1 0 1 in-1.sym
{
T 48400 67000 5 10 0 0 0 6 1
footprint=anchor
T 48400 66800 5 10 0 0 0 6 1
device=INPUT
T 48400 66600 5 10 1 1 0 1 1
refdes=A1#
}
C 43500 66100 1 0 0 in-1.sym
{
T 43500 66600 5 10 0 0 0 0 1
footprint=anchor
T 43500 66400 5 10 0 0 0 0 1
device=INPUT
T 43300 66200 5 10 1 1 0 1 1
refdes=A0
}
C 48400 66100 1 0 1 in-1.sym
{
T 48400 66600 5 10 0 0 0 6 1
footprint=anchor
T 48400 66400 5 10 0 0 0 6 1
device=INPUT
T 48400 66200 5 10 1 1 0 1 1
refdes=A0#
}
C 43500 63700 1 0 0 in-1.sym
{
T 43500 64200 5 10 0 0 0 0 1
footprint=anchor
T 43500 64000 5 10 0 0 0 0 1
device=INPUT
T 43500 63800 5 10 1 1 0 7 1
refdes=GND
}
C 44200 63800 1 90 0 resistor-load.sym
{
T 43800 64100 5 10 0 0 90 0 1
device=RESISTOR
T 44075 64475 5 10 1 1 0 6 1
refdes=R0
T 44100 64200 5 10 0 1 90 0 1
footprint=0603-load
T 44100 64200 5 10 0 1 90 0 1
value=rload
}
C 45600 63800 1 270 1 resistor-load.sym
{
T 46000 64100 5 10 0 0 90 2 1
device=RESISTOR
T 45700 64200 5 10 0 1 90 2 1
footprint=0603-load
T 45700 64200 5 10 0 1 90 2 1
value=rload
T 45725 64475 5 10 1 1 0 0 1
refdes=R1
}
C 46400 63800 1 90 0 resistor-load.sym
{
T 46000 64100 5 10 0 0 90 6 1
device=RESISTOR
T 46300 64200 5 10 0 1 90 6 1
footprint=0603-load
T 46300 64200 5 10 0 1 90 6 1
value=rload
T 46275 64475 5 10 1 1 0 6 1
refdes=R2
}
C 47800 63800 1 270 1 resistor-load.sym
{
T 48200 64100 5 10 0 0 90 2 1
device=RESISTOR
T 47900 64200 5 10 0 1 90 2 1
footprint=0603-load
T 47900 64200 5 10 0 1 90 2 1
value=rload
T 47925 64475 5 10 1 1 0 0 1
refdes=R3
}
C 44700 64500 1 90 1 out-1.sym
{
T 44200 64500 5 10 0 0 270 2 1
footprint=anchor
T 44400 64500 5 10 0 0 270 2 1
device=OUTPUT
T 44600 63900 5 10 1 1 180 3 1
refdes=A
}
C 45100 64500 1 270 0 out-1.sym
{
T 45600 64500 5 10 0 0 270 0 1
footprint=anchor
T 45400 64500 5 10 0 0 270 0 1
device=OUTPUT
T 45200 63900 5 10 1 1 180 3 1
refdes=X
}
C 46900 64500 1 90 1 out-1.sym
{
T 46400 64500 5 10 0 0 270 2 1
footprint=anchor
T 46600 64500 5 10 0 0 270 2 1
device=OUTPUT
T 46800 63900 5 10 1 1 180 3 1
refdes=Y
}
C 47300 64500 1 270 0 out-1.sym
{
T 47800 64500 5 10 0 0 270 0 1
footprint=anchor
T 47600 64500 5 10 0 0 270 0 1
device=OUTPUT
T 47400 63900 5 10 1 1 180 3 1
refdes=U
}
C 43500 67600 1 0 0 in-1.sym
{
T 43500 68100 5 10 0 0 0 0 1
footprint=anchor
T 43500 67900 5 10 0 0 0 0 1
device=INPUT
T 43500 67700 5 10 1 1 0 7 1
refdes=Vdd
}
C 44500 66300 1 0 0 pmos-switch.sym
{
T 44725 66600 5 10 1 1 0 1 1
refdes=M4
T 44600 67100 5 10 0 1 0 0 1
value=PMOS_switch
T 45000 66900 5 10 0 1 0 0 1
footprint=sot23-pmos
T 46000 66900 5 10 0 1 0 0 1
device=PMOS
}
C 47500 66300 1 0 1 pmos-switch.sym
{
T 47275 66600 5 10 1 1 0 7 1
refdes=M5
T 47400 67100 5 10 0 1 0 6 1
value=PMOS_switch
T 47000 66900 5 10 0 1 0 6 1
footprint=sot23-pmos
T 46000 66900 5 10 0 1 0 6 1
device=PMOS
}
C 44200 65500 1 0 0 pmos-switch.sym
{
T 44425 65800 5 10 1 1 0 1 1
refdes=M0
T 44300 66300 5 10 0 1 0 0 1
value=PMOS_switch
T 44700 66100 5 10 0 1 0 0 1
footprint=sot23-pmos
T 45700 66100 5 10 0 1 0 0 1
device=PMOS
}
C 45600 65500 1 0 1 pmos-switch.sym
{
T 45375 65800 5 10 1 1 0 7 1
refdes=M1
T 45500 66300 5 10 0 1 0 6 1
value=PMOS_switch
T 45100 66100 5 10 0 1 0 6 1
footprint=sot23-pmos
T 44100 66100 5 10 0 1 0 6 1
device=PMOS
}
C 46400 65500 1 0 0 pmos-switch.sym
{
T 46625 65800 5 10 1 1 0 1 1
refdes=M2
T 46500 66300 5 10 0 1 0 0 1
value=PMOS_switch
T 46900 66100 5 10 0 1 0 0 1
footprint=sot23-pmos
T 47900 66100 5 10 0 1 0 0 1
device=PMOS
}
C 47800 65500 1 0 1 pmos-switch.sym
{
T 47575 65800 5 10 1 1 0 7 1
refdes=M3
T 47700 66300 5 10 0 1 0 6 1
value=PMOS_switch
T 47300 66100 5 10 0 1 0 6 1
footprint=sot23-pmos
T 46300 66100 5 10 0 1 0 6 1
device=PMOS
}
N 44900 66800 44900 67100 4
N 44100 67700 49600 67700 4
N 47100 67000 47100 66800 4
N 44600 64500 44600 65600 4
N 45200 64500 45200 65600 4
N 46800 64500 46800 65600 4
N 47400 64500 47400 65600 4
N 44600 64700 44100 64700 4
N 45200 64700 45700 64700 4
N 46800 64700 46300 64700 4
N 47400 64700 47900 64700 4
N 44200 65800 44200 66200 4
N 44100 66200 45800 66200 4
{
T 45400 66250 5 10 1 1 0 0 1
netname=A0
}
N 45800 66200 46200 65800 4
N 47800 66200 47800 65800 4
N 45800 65800 46200 66200 4
N 46200 66200 47800 66200 4
N 44600 66100 45200 66100 4
{
T 44900 66075 5 6 1 1 0 5 1
netname=t
}
N 46800 66100 47400 66100 4
{
T 47100 66075 5 6 1 1 0 5 1
netname=v
}
N 47100 66400 47100 66100 4
N 44900 66400 44900 66100 4
C 44000 63500 1 0 0 gnd-1.sym
C 45600 63500 1 0 0 gnd-1.sym
C 47800 63500 1 0 0 gnd-1.sym
C 46200 63500 1 0 0 gnd-1.sym
N 47800 66600 47500 66600 4
N 44100 66600 44500 66600 4
N 46200 65800 46400 65800 4
N 45800 65800 45600 65800 4
C 44600 64900 1 0 1 schottky.sym
{
T 44300 66100 5 10 0 1 0 6 1
footprint=SOD523
T 44303 65597 5 10 0 0 0 6 1
device=DIODE
T 44275 65150 5 10 1 1 0 6 1
refdes=D0
T 44300 65950 5 10 0 1 0 6 1
value=RB751S40
}
C 45200 64900 1 0 0 schottky.sym
{
T 45500 66100 5 10 0 1 0 0 1
footprint=SOD523
T 45497 65597 5 10 0 0 0 0 1
device=DIODE
T 45525 65150 5 10 1 1 0 0 1
refdes=D1
T 45500 65950 5 10 0 1 0 0 1
value=RB751S40
}
C 46800 64900 1 0 1 schottky.sym
{
T 46500 66100 5 10 0 1 0 6 1
footprint=SOD523
T 46503 65597 5 10 0 0 0 6 1
device=DIODE
T 46475 65150 5 10 1 1 0 6 1
refdes=D2
T 46500 65950 5 10 0 1 0 6 1
value=RB751S40
}
C 47400 64900 1 0 0 schottky.sym
{
T 47700 66100 5 10 0 1 0 0 1
footprint=SOD523
T 47697 65597 5 10 0 0 0 0 1
device=DIODE
T 47725 65150 5 10 1 1 0 0 1
refdes=D3
T 47700 65950 5 10 0 1 0 0 1
value=RB751S40
}
N 45600 65100 46400 65100 4
{
T 46000 65075 5 10 1 1 0 5 1
netname=Dr
}
N 44200 65100 44000 65100 4
{
T 43950 65100 5 10 1 1 0 7 1
netname=Dr
}
N 47800 65100 48000 65100 4
{
T 48050 65100 5 10 1 1 0 1 1
netname=Dr
}
C 47800 67300 1 180 1 out-1.sym
{
T 47800 66800 5 10 0 0 0 2 1
footprint=anchor
T 47800 67000 5 10 0 0 0 2 1
device=OUTPUT
T 48400 67200 5 10 1 1 0 1 1
refdes=Dr
}
N 47800 67200 47600 67200 4
{
T 47550 67200 5 10 1 1 0 7 1
netname=Dr
}
N 44600 66100 44600 66000 4
N 45200 66100 45200 66000 4
N 46800 66100 46800 66000 4
N 47400 66100 47400 66000 4
N 44900 67000 47100 67000 4
{
T 45800 67050 5 6 1 1 0 0 1
netname=w
}
C 44500 67000 1 0 0 pmos-switch.sym
{
T 44725 67300 5 10 1 1 0 1 1
refdes=M6
T 44600 67800 5 10 0 1 0 0 1
value=PMOS_switch
T 45000 67600 5 10 0 1 0 0 1
footprint=sot23-pmos
T 46000 67600 5 10 0 1 0 0 1
device=PMOS
}
N 44100 67300 44500 67300 4
C 43500 67200 1 0 0 in-1.sym
{
T 43500 67700 5 10 0 0 0 0 1
footprint=anchor
T 43500 67500 5 10 0 0 0 0 1
device=INPUT
T 43500 67300 5 10 1 1 0 7 1
refdes=A2
}
N 44900 67500 44900 67700 4
N 49600 67700 49600 67500 4
C 50000 67000 1 0 1 pmos-switch.sym
{
T 49900 67800 5 10 0 1 0 6 1
value=PMOS_switch
T 49500 67600 5 10 0 1 0 6 1
footprint=sot23-pmos
T 48500 67600 5 10 0 1 0 6 1
device=PMOS
T 49775 67300 5 10 1 1 0 7 1
refdes=M7
}
N 50400 67300 50000 67300 4
C 51000 67200 1 0 1 in-1.sym
{
T 51000 67700 5 10 0 0 0 6 1
footprint=anchor
T 51000 67500 5 10 0 0 0 6 1
device=INPUT
T 51000 67300 5 10 1 1 0 1 1
refdes=A2#
}
C 50000 65500 1 0 1 pmos-switch.sym
{
T 49900 66300 5 10 0 1 0 6 1
value=PMOS_switch
T 49500 66100 5 10 0 1 0 6 1
footprint=sot23-pmos
T 48500 66100 5 10 0 1 0 6 1
device=PMOS
T 49775 65800 5 10 1 1 0 7 1
refdes=M8
}
C 50000 63800 1 270 1 resistor-load.sym
{
T 50400 64100 5 10 0 0 90 2 1
device=RESISTOR
T 50100 64200 5 10 0 1 90 2 1
footprint=0603-load
T 50100 64200 5 10 0 1 90 2 1
value=rload
T 50125 64475 5 10 1 1 0 0 1
refdes=R4
}
C 49500 64500 1 270 0 out-1.sym
{
T 50000 64500 5 10 0 0 270 0 1
footprint=anchor
T 49800 64500 5 10 0 0 270 0 1
device=OUTPUT
T 49600 63900 5 10 1 1 180 3 1
refdes=R
}
N 49600 64700 50100 64700 4
C 50000 63500 1 0 0 gnd-1.sym
C 49600 64900 1 0 0 schottky.sym
{
T 49900 66100 5 10 0 1 0 0 1
footprint=SOD523
T 49897 65597 5 10 0 0 0 0 1
device=DIODE
T 49900 65950 5 10 0 1 0 0 1
value=RB751S40
T 49925 65150 5 10 1 1 0 0 1
refdes=D4
}
N 50000 65100 50200 65100 4
{
T 50250 65100 5 10 1 1 0 1 1
netname=Dr
}
N 49600 64500 49600 65600 4
N 49600 67100 49600 66000 4
{
T 49650 66600 5 6 1 1 0 1 1
netname=z
}
N 50000 65800 50200 65800 4
{
T 50100 65850 5 10 1 1 0 0 1
netname=A0
}