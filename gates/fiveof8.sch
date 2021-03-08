v 20201216 2
C 49000 65700 1 0 1 in-1.sym
{
T 49000 66200 5 10 0 0 0 6 1
footprint=anchor
T 49000 66000 5 10 0 0 0 6 1
device=INPUT
T 49000 65800 5 10 1 1 0 1 1
refdes=A1
}
C 43300 65700 1 0 0 in-1.sym
{
T 43300 66200 5 10 0 0 0 0 1
footprint=anchor
T 43300 66000 5 10 0 0 0 0 1
device=INPUT
T 43300 65800 5 10 1 1 0 7 1
refdes=A1#
}
C 43300 66400 1 0 0 in-1.sym
{
T 43300 66900 5 10 0 0 0 0 1
footprint=anchor
T 43300 66700 5 10 0 0 0 0 1
device=INPUT
T 43300 66500 5 10 1 1 0 7 1
refdes=A0#
}
C 49000 66400 1 0 1 in-1.sym
{
T 49000 66900 5 10 0 0 0 6 1
footprint=anchor
T 49000 66700 5 10 0 0 0 6 1
device=INPUT
T 49000 66500 5 10 1 1 0 1 1
refdes=A0
}
C 43300 67200 1 0 0 in-1.sym
{
T 43300 67700 5 10 0 0 0 0 1
footprint=anchor
T 43300 67500 5 10 0 0 0 0 1
device=INPUT
T 43300 67300 5 10 1 1 0 7 1
refdes=GND
}
C 44000 67000 1 0 1 gnd-1.sym
C 45900 68700 1 180 1 out-1.sym
{
T 45900 68200 5 10 0 0 0 2 1
footprint=anchor
T 45900 68400 5 10 0 0 0 2 1
device=OUTPUT
T 46500 68600 5 10 1 1 0 1 1
refdes=Q0
}
C 45900 67500 1 0 0 out-1.sym
{
T 45900 68000 5 10 0 0 0 0 1
footprint=anchor
T 45900 67800 5 10 0 0 0 0 1
device=OUTPUT
T 46500 67600 5 10 1 1 0 1 1
refdes=Q1
}
C 48200 68700 1 180 1 out-1.sym
{
T 48200 68200 5 10 0 0 0 2 1
footprint=anchor
T 48200 68400 5 10 0 0 0 2 1
device=OUTPUT
T 48800 68600 5 10 1 1 0 1 1
refdes=Q2
}
C 48200 67500 1 0 0 out-1.sym
{
T 48200 68000 5 10 0 0 0 0 1
footprint=anchor
T 48200 67800 5 10 0 0 0 0 1
device=OUTPUT
T 48800 67600 5 10 1 1 0 1 1
refdes=Q3
}
C 43300 68800 1 0 0 in-1.sym
{
T 43300 69300 5 10 0 0 0 0 1
footprint=anchor
T 43300 69100 5 10 0 0 0 0 1
device=INPUT
T 43300 68900 5 10 1 1 0 7 1
refdes=Vdd
}
C 48200 69500 1 0 0 out-1.sym
{
T 48200 70000 5 10 0 0 0 0 1
footprint=anchor
T 48200 69800 5 10 0 0 0 0 1
device=OUTPUT
T 48800 69600 5 10 1 1 0 1 1
refdes=Q4
}
C 43300 65300 1 0 0 in-1.sym
{
T 43300 65800 5 10 0 0 0 0 1
footprint=anchor
T 43300 65600 5 10 0 0 0 0 1
device=INPUT
T 43300 65400 5 10 1 1 0 7 1
refdes=A2
}
C 46800 69500 1 0 0 in-1.sym
{
T 46800 70000 5 10 0 0 0 0 1
footprint=anchor
T 46800 69800 5 10 0 0 0 0 1
device=INPUT
T 46800 69600 5 10 1 1 0 7 1
refdes=A2#
}
C 44600 65500 1 0 0 nmos-switch.sym
{
T 44825 65800 5 8 1 1 0 1 1
refdes=M1
T 44700 66300 5 10 0 1 0 0 1
value=NMOS_switch
T 45100 66100 5 10 0 1 0 0 1
footprint=sot23-nmos
T 46100 66100 5 10 0 1 0 0 1
device=NMOS
}
C 47700 65500 1 0 1 nmos-switch.sym
{
T 47475 65800 5 8 1 1 0 7 1
refdes=M2
T 47600 66300 5 10 0 1 0 6 1
value=NMOS_switch
T 47200 66100 5 10 0 1 0 6 1
footprint=sot23-nmos
T 46200 66100 5 10 0 1 0 6 1
device=NMOS
}
N 45000 65400 45000 65600 4
N 43900 65400 47300 65400 4
N 47300 65400 47300 65600 4
N 43900 65800 44600 65800 4
N 48400 65800 47700 65800 4
C 44100 66200 1 0 0 not.sym
{
T 44450 66500 5 10 1 1 0 4 1
refdes=I
}
C 45900 66200 1 0 1 not.sym
{
T 45550 66500 5 10 1 1 0 4 1
refdes=J
}
C 46400 66200 1 0 0 not.sym
{
T 46750 66500 5 10 1 1 0 4 1
refdes=K
}
C 48200 66200 1 0 1 not.sym
{
T 47850 66500 5 10 1 1 0 4 1
refdes=L
}
N 48200 66500 48400 66500 4
N 44100 66500 43900 66500 4
C 43700 68900 1 0 0 vdd-1.sym
C 44300 66800 1 0 0 vdd-1.sym
C 47600 66800 1 0 0 vdd-1.sym
C 45300 66800 1 0 0 vdd-1.sym
C 46600 66800 1 0 0 vdd-1.sym
N 44500 66200 45500 66200 4
N 46800 66200 47800 66200 4
N 44100 66500 44100 67000 4
N 44100 67000 45900 67000 4
N 45900 67000 46400 66500 4
N 45900 66500 46400 67000 4
N 46400 67000 48200 67000 4
N 48200 67000 48200 66500 4
N 44900 66500 44900 68600 4
N 44900 68600 45100 68600 4
C 45100 68300 1 0 0 notp.sym
{
T 45450 68600 5 10 1 1 0 4 1
refdes=A
}
N 45100 66500 45100 67600 4
C 45100 67300 1 0 0 notp.sym
{
T 45450 67600 5 10 1 1 0 4 1
refdes=B
}
C 45600 67000 1 0 1 gnd-1.sym
C 45600 68000 1 0 1 gnd-1.sym
N 47200 66500 47200 68600 4
N 47200 68600 47400 68600 4
N 47400 66500 47400 67600 4
C 47400 68300 1 0 0 notp.sym
{
T 47750 68600 5 10 1 1 0 4 1
refdes=C
}
C 47400 67300 1 0 0 notp.sym
{
T 47750 67600 5 10 1 1 0 4 1
refdes=D
}
C 47900 67000 1 0 1 gnd-1.sym
C 47900 68000 1 0 1 gnd-1.sym
C 45300 68900 1 0 0 vdd-1.sym
C 45300 67900 1 0 0 vdd-1.sym
C 47600 68900 1 0 0 vdd-1.sym
C 47600 67900 1 0 0 vdd-1.sym
N 45000 66000 45000 66200 4
N 47300 66000 47300 66200 4
C 47400 69300 1 0 0 notp.sym
{
T 47750 69600 5 10 1 1 0 4 1
refdes=E
}
C 47600 69900 1 0 0 vdd-1.sym
C 47900 69000 1 0 1 gnd-1.sym
