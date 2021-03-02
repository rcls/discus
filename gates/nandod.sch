v 20201216 2
C 59700 46200 1 0 0 nmos-switch.sym
{
T 59925 46500 5 10 1 1 0 1 1
refdes=M1
T 59800 47000 5 10 0 1 0 1 1
value=NMOS_switch
T 60200 46800 5 10 0 1 0 1 1
footprint=sot23-nmos
T 61200 46800 5 10 0 1 0 1 1
device=NMOS
}
C 59700 45500 1 0 0 nmos-switch.sym
{
T 59925 45800 5 10 1 1 0 1 1
refdes=M2
T 59800 46300 5 10 0 1 0 0 1
value=NMOS_switch
T 60200 46100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 61200 46100 5 10 0 1 0 0 1
device=NMOS
}
C 60200 45000 1 90 0 in-1.sym
{
T 59700 45000 5 10 0 0 90 0 1
footprint=anchor
T 59900 45000 5 10 0 0 90 0 1
device=INPUT
T 60125 45100 5 10 1 1 90 2 1
refdes=GND
}
C 59100 45700 1 0 0 in-1.sym
{
T 59100 46200 5 10 0 0 0 0 1
footprint=anchor
T 59100 46000 5 10 0 0 0 0 1
device=INPUT
T 59100 45800 5 10 1 1 0 7 1
refdes=B
}
C 59100 46400 1 0 0 in-1.sym
{
T 59100 46900 5 10 0 0 0 0 1
footprint=anchor
T 59100 46700 5 10 0 0 0 0 1
device=INPUT
T 59100 46500 5 10 1 1 0 7 1
refdes=A
}
C 60100 46600 1 0 0 out-1.sym
{
T 60100 47100 5 10 0 0 0 0 1
footprint=anchor
T 60100 46900 5 10 0 0 0 0 1
device=OUTPUT
T 60300 46800 5 10 1 1 0 0 1
refdes=Q
}
N 60100 46000 60100 46300 4
