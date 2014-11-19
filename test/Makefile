
TESTCC = alu pcdecode opdecode sp
TESTPROGS=$(test%)

GNETLIST=/home/archive/bin/gnetlist

all: rmsim script $(TESTPROGS)

%.rcr: %.sch
	$(GNETLIST) -L../subckt -g spice-sdb -o $@ $+

%.cir: %.rcr
	perl substrate.pl $< > $@

%.fake-cir: %.cir
	perl test/fake.pl $< > $@

CXXFLAGS=-O2 -Wall -Werror -ggdb -std=c++11 -I.

%.o: %.cc
	g++ $(CXXFLAGS) -o $@ -c $<

%: %.o
	g++ $(CXXFLAGS) -o $@ $+

rmsim: state.o spice_load.o
script: state.o spice_load.o

$(TESTPROGS): spice_load.o

script.o state.o rmsim.o: state.h
$(TESTS:%=test%.o): test/spice_load.h

.PHONY: clean
clean:
	rm -f *- *~  *.o *.cir *.rcr
	rm -f *.fake-cir PCB.*.backup PCB.*.save
	rm -f rmsim state $(TESTPROGS)
