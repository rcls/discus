v 20130925 2
C 18100 24400 1 0 0 in-1.sym
{
T 18100 24700 5 10 0 0 0 0 1
device=INPUT
T 18100 24500 5 10 1 1 0 7 1
refdes=O0#
}
C 18100 24000 1 0 0 in-1.sym
{
T 18100 24300 5 10 0 0 0 0 1
device=INPUT
T 18100 24100 5 10 1 1 0 7 1
refdes=O1#
}
C 18100 23600 1 0 0 in-1.sym
{
T 18100 23900 5 10 0 0 0 0 1
device=INPUT
T 18100 23700 5 10 1 1 0 7 1
refdes=O2#
}
C 18100 23200 1 0 0 in-1.sym
{
T 18100 23500 5 10 0 0 0 0 1
device=INPUT
T 18100 23300 5 10 1 1 0 7 1
refdes=O3#
}
C 18100 22800 1 0 0 in-1.sym
{
T 18100 23100 5 10 0 0 0 0 1
device=INPUT
T 18100 22900 5 10 1 1 0 7 1
refdes=O4#
}
C 18100 22400 1 0 0 in-1.sym
{
T 18100 22700 5 10 0 0 0 0 1
device=INPUT
T 18100 22500 5 10 1 1 0 7 1
refdes=O5#
}
C 18100 20700 1 0 0 in-1.sym
{
T 18100 21000 5 10 0 0 0 0 1
device=INPUT
T 18100 20800 5 10 1 1 0 7 1
refdes=O6#
}
C 18100 18600 1 0 0 in-1.sym
{
T 18100 18900 5 10 0 0 0 0 1
device=INPUT
T 18100 18700 5 10 1 1 0 7 1
refdes=O7#
}
C 18700 21600 1 0 0 dlatch6.sym
{
T 19500 24050 5 10 1 1 0 4 1
refdes=S?
T 19625 22100 5 10 1 1 0 4 1
source=dlatch6.sch
}
C 21000 21600 1 0 0 dlatch6.sym
{
T 21800 24050 5 10 1 1 0 4 1
refdes=S?
T 21925 22100 5 10 1 1 0 4 1
source=dlatch6.sch
}
N 21000 24500 20300 24500 4
N 21000 24100 20300 24100 4
N 21000 23700 20300 23700 4
N 21000 23300 20300 23300 4
N 21000 22900 20300 22900 4
N 21000 22500 20300 22500 4
C 23400 21600 1 0 0 dlatch6.sym
{
T 24200 24050 5 10 1 1 0 4 1
refdes=S?
T 24325 22100 5 10 1 1 0 4 1
source=dlatch6.sch
}
N 23400 24500 22600 24500 4
N 23400 24100 22600 24100 4
N 23400 23700 22600 23700 4
N 23400 23300 22600 23300 4
N 23400 22900 22600 22900 4
N 23400 22500 22600 22500 4
C 18700 19700 1 0 0 dlatch.sym
{
T 19850 20150 5 10 1 1 0 0 1
refdes=S?
T 19500 20425 5 10 1 1 0 4 1
source=dlatch.sch
}
C 18700 17600 1 0 0 dlatch.sym
{
T 19850 18050 5 10 1 1 0 0 1
refdes=S?
T 19500 18325 5 10 1 1 0 4 1
source=dlatch.sch
}
N 20300 20800 20800 20800 4
N 20800 20800 20800 18900 4
N 20300 18700 21000 18700 4
C 21000 18400 1 0 0 nor3.sym
{
T 21275 18900 5 10 1 1 0 1 1
refdes=S?
}
N 20800 18900 21000 18900 4
C 21800 17800 1 0 0 dlatch.sym
{
T 22950 18250 5 10 1 1 0 0 1
refdes=S?
T 22600 18525 5 10 1 1 0 4 1
source=dlatch.sch
}
T 19800 25000 9 10 1 0 0 0 1
FIXME - don't use dlatch where RS would do
T 21600 19600 9 10 1 0 0 0 1
FIXME - use vdlatch
N 25800 18900 25800 20000 4
N 25800 20000 21000 20000 4
N 21000 20000 21000 19100 4
C 24200 17800 1 0 0 dlatch.sym
{
T 25350 18250 5 10 1 1 0 0 1
refdes=S?
T 25000 18525 5 10 1 1 0 4 1
source=dlatch.sch
}
N 23400 18900 24200 18900 4