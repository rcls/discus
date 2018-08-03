
TESTCC = alu pcdecode opdecode sp
TESTPROGS=$(TESTCC:%=test%)

SCRIPTS=testadd testsub testcall testinc testmem hazard logic pattern rmsim \
	monitor blink

all: rmsim $(TESTPROGS) $(SCRIPTS)

raw: $(SCRIPTS:%=%.raw)
verify: $(SCRIPTS:%=%.verify)

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
%.verify: %.raw %
	./$* -V $<

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
