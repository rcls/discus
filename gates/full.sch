v 20130925 2
C 16200 49300 1 0 0 3.3V-plus-1.sym
C 16300 48000 1 0 0 gnd-1.sym
N 15800 48500 15400 48500 4
N 15400 47700 19500 47700 4
N 15400 45900 20500 45900 4
N 15600 45900 15600 49100 4
N 15700 47700 15700 48700 4
C 18000 49400 1 0 0 3.3V-plus-1.sym
C 18100 48100 1 0 0 gnd-1.sym
N 17600 49000 17600 48100 4
C 20500 47400 1 0 1 2n7002.sym
{
T 20400 48200 5 10 0 1 0 6 1
value=2N7002P
T 20000 48000 5 10 0 1 0 6 1
footprint=sot23-nmos
T 19000 48000 5 10 0 1 0 6 1
device=NMOS
T 20600 47800 5 10 1 1 0 6 1
refdes=M2
}
C 19500 47400 1 0 0 2n7002.sym
{
T 19600 48200 5 10 0 1 0 0 1
value=2N7002P
T 20000 48000 5 10 0 1 0 0 1
footprint=sot23-nmos
T 21000 48000 5 10 0 1 0 0 1
device=NMOS
T 19400 47800 5 10 1 1 0 0 1
refdes=M1
}
N 19900 47900 20100 47900 4
C 20100 47900 1 90 0 resistor-load.sym
{
T 20000 48300 5 10 0 1 90 0 1
footprint=0603-boxed
T 19700 48200 5 10 0 0 90 0 1
device=RESISTOR
T 19800 48600 5 10 1 1 180 0 1
refdes=R
T 20100 48700 5 10 1 1 0 0 1
value=3.3k
}
C 19800 48800 1 0 0 3.3V-plus-1.sym
N 20000 47900 20300 48200 4
N 17000 49200 17000 46900 4
N 16800 48800 17000 48800 4
N 17000 49200 17600 49200 4
N 19900 47500 20100 47500 4
N 20500 47700 20500 45900 4
C 15800 48300 1 0 0 andnand.sym
{
T 16350 48750 5 10 1 1 0 0 1
refdes=S1
}
N 15600 49100 15800 49100 4
C 17600 48400 1 0 0 nor1and.sym
{
T 18150 48850 5 10 1 1 0 0 1
refdes=S3
}
C 17000 46300 1 0 0 nor.sym
{
T 17300 46750 5 10 1 1 0 0 1
refdes=S2
}
C 17100 47300 1 0 0 3.3V-plus-1.sym
C 17200 46000 1 0 0 gnd-1.sym
N 20000 46800 20000 47500 4
C 14800 48800 1 0 0 in-1.sym
{
T 14800 49100 5 10 0 0 0 0 1
device=INPUT
T 14600 48850 5 10 1 1 0 0 1
refdes=A#
}
C 14800 47600 1 0 0 in-1.sym
{
T 14800 47900 5 10 0 0 0 0 1
device=INPUT
T 14600 47650 5 10 1 1 0 0 1
refdes=A
}
C 14800 48400 1 0 0 in-1.sym
{
T 14800 48700 5 10 0 0 0 0 1
device=INPUT
T 14600 48450 5 10 1 1 0 0 1
refdes=B#
}
C 14800 45800 1 0 0 in-1.sym
{
T 14800 46100 5 10 0 0 0 0 1
device=INPUT
T 14600 45850 5 10 1 1 0 0 1
refdes=B
}
C 16200 46600 1 0 0 in-1.sym
{
T 16200 46900 5 10 0 0 0 0 1
device=INPUT
T 16000 46600 5 10 1 1 0 0 1
refdes=C
}
C 16700 46200 1 0 0 in-1.sym
{
T 16700 46500 5 10 0 0 0 0 1
device=INPUT
T 16800 46100 5 10 1 1 0 0 1
refdes=GND
}
C 15800 49200 1 0 0 in-1.sym
{
T 15800 49500 5 10 0 0 0 0 1
device=INPUT
T 15800 49400 5 10 1 1 0 0 1
refdes=Vdd
}
C 18700 48900 1 90 0 out-1.sym
{
T 18400 48900 5 10 0 0 90 0 1
device=OUTPUT
T 18650 49500 5 10 1 1 90 0 1
refdes=Q#
}
C 20300 48100 1 0 0 out-1.sym
{
T 20300 48400 5 10 0 0 0 0 1
device=OUTPUT
T 20700 48400 5 10 1 1 180 0 1
refdes=Co#
}
N 15400 48900 15800 48900 4
N 17800 48700 17800 46800 4
N 17800 46800 20000 46800 4
N 16800 46700 16800 48100 4
N 16800 48100 17600 48100 4
N 16800 46700 17000 46700 4
C 18600 48600 1 0 0 not.sym
{
T 18850 48850 5 10 1 1 0 0 1
refdes=I
}
C 18900 48300 1 0 0 gnd-1.sym
C 18800 49200 1 0 0 3.3V-plus-1.sym
C 19500 48900 1 90 0 out-1.sym
{
T 19200 48900 5 10 0 0 90 0 1
device=OUTPUT
T 19450 49500 5 10 1 1 90 0 1
refdes=Q
}
N 15700 48700 15800 48700 4
