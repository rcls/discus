v 20220529 2
C 60200 46200 1 90 0 resistor-strong.sym
{
T 60100 46600 5 10 0 1 90 0 1
footprint=0603-strong
T 60100 46600 5 10 0 1 90 0 1
value=rstrong
T 59800 46500 5 10 0 0 90 0 1
device=RESISTOR
T 60150 46300 5 10 1 1 90 2 1
refdes=R
}
C 60200 45600 1 90 0 in-1.sym
{
T 59700 45600 5 10 0 0 90 0 1
footprint=anchor
T 59900 45600 5 10 0 0 90 0 1
device=INPUT
T 60150 45750 5 10 1 1 90 2 1
refdes=GND
}
C 59100 47300 1 0 0 in-1.sym
{
T 59100 47800 5 10 0 0 0 0 1
footprint=anchor
T 59100 47600 5 10 0 0 0 0 1
device=INPUT
T 59100 47400 5 10 1 1 0 7 1
refdes=A
}
C 60000 48300 1 270 0 in-1.sym
{
T 60500 48300 5 10 0 0 270 0 1
footprint=anchor
T 60300 48300 5 10 0 0 270 0 1
device=INPUT
T 60150 48250 5 10 1 1 270 0 1
refdes=Vdd
}
C 60100 47000 1 0 0 out-1.sym
{
T 60100 47500 5 10 0 0 0 0 1
footprint=anchor
T 60100 47300 5 10 0 0 0 0 1
device=OUTPUT
T 60700 47100 5 10 1 1 0 1 1
refdes=Q
}
C 59700 47100 1 0 0 pmos-switch.sym
{
T 59925 47400 5 10 1 1 0 1 1
refdes=M
T 59800 47900 5 10 0 1 0 0 1
value=PMOS_switch
T 60200 47700 5 10 0 1 0 0 1
footprint=sot23-pmos
T 61200 47700 5 10 0 1 0 0 1
device=PMOS
}
N 60100 47700 60100 47600 4
N 60100 47100 60100 47200 4
{
T 60150 47150 5 10 1 1 0 0 1
netname=Q
}