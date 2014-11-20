
TESTCC = alu pcdecode opdecode sp
TESTPROGS=$(TESTCC:%=test%)

SCRIPTS=test1

GNETLIST=/home/archive/bin/gnetlist

all: rmsim $(TESTPROGS)

verify: $(SCRIPTS:%=%.verify)

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

.PRECIOUS: %.raw
%.raw: % ../board/univlight.cir
	./$< -C
	./$< -T -R | ./rommunge.py -w $@ ../board/univlight.cir $*.cir
	ngspice -b $*.cir

.PHONY: %.verify
%.verify: %.raw
	./$* -V $<

rmsim: state.o spice_load.o

$(TESTPROGS): spice_load.o

$(SCRIPTS): state.o spice_load.o script.o

script.o state.o rmsim.o: state.h
$(TESTCC:%=test%.o): spice_load.h
$(SCRIPTS:%=%.o): state.h script.h

.PHONY: clean
clean:
	rm -f *- *~  *.o *.cir *.rcr
	rm -f *.fake-cir PCB.*.backup PCB.*.save
	rm -f rmsim state $(TESTPROGS)
