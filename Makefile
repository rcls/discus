
%.spr: %.sch
	gnetlist -Lsubckt -g spice-sdb -o $@ $+

%.sp: %.spr
	perl substrate.pl $< > $@

testacc.spr: accumulate.sch

CXXFLAGS=-O2 -Wall -Werror -ggdb

%.o: %.cc
	g++ $(CXXFLAGS) -o $@ -c $<

%: %.o
	g++ $(CXXFLAGS) -o $@ $+
