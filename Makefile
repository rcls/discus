all: testacc.sp testacc-check

%.spr: %.sch
	gnetlist -Lsubckt -g spice-sdb -o $@ $+

%.sp: %.spr
	perl substrate.pl $< > $@

testacc.spr: accumulate.sch

CXXFLAGS=-O2 -Wall -Werror -ggdb -std=c++11

%.o: %.cc
	g++ $(CXXFLAGS) -o $@ -c $<

%: %.o
	g++ $(CXXFLAGS) -o $@ $+
