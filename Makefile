
GNETLIST=/home/geda/bin/gnetlist


ADHOC_TEST = alu pcdecode opdecode sp
PROG_TEST=testadd testsub testcall testinc testmem testmemi testmemw \
	testcmp hazard logic
TESTS=$(ADHOC_TEST:%=test/test%) $(PROG_TEST:%=test/%)
PROG=rmsim pattern monitor blink
ALL_PROG=$(TESTS) $(PROG:%=test/%)

all:

verify: $(TESTS:%=%.verify)
programs: $(ALL_PROG)

%.rcr: %.sch gates/*.sch board/*.sch sym/*.sym
	$(GNETLIST) -Lsubckt -p spice-sdb -o $@ $<

%.cir: %.rcr ./substrate.py
	./substrate.py $< > $@

DEPS=-MMD -MP -MF.$(subst /,:,$@).d
CXXFLAGS=-O2 -fbounds-check -Wall -Werror -ggdb -std=c++11 -I. $(DEPS)

-include .*.d

%: %.cc
CC=g++

$(ALL_PROG): test/state.o test/script.o test/spice_load.o

$(PROG_TEST:%=test/%.cir): %.cir: % board/univlight.cir test/rommunge.py
	./$< -C
	./$< -T -R | test/rommunge.py -w $@ board/univlight.cir $*.cir

%.verify: %.raw %
	./$* -V $<

.PRECIOUS: %.rcr %.raw
%.raw: %.cir
	ngspice -r $@ -b $<

count: gates/bit.rcr gates/control.rcr board/dram64byte.rcr board/rom64byte.rcr
	grep -E -c -v -e '^$$' -e '^[^MQ]' -e 'unknown' -e 'No valid' $+

SYMS=$(wildcard sym/*.sym)
GATES=$(wildcard gates/*.sch)
BOARD=$(wildcard board/*.sch)
ALL_SYM=$(SYMS:sym/%.sym=%)
ALL_SCH=$(GATES:gates/%.sch=%) $(BOARD:board/%.sch=%)

.PHONY: png md web
web: png md
png: $(ALL_SYM:%=docs/%-sym.png) $(ALL_SCH:%=docs/%.png)
md: $(ALL_SCH:%=docs/%.md)

vpath %.sch gates board
vpath %.sym sym

docs/%-sym.png: %.sym
	/home/geda/bin/gaf export -m 1 -k 1 -d 300 -c -o "$@" "$<"

docs/%.png: %.sch
	/home/geda/bin/gaf export -m 1 -k 1 -d 600 -c -o "$@" "$<"

docs/%.md: %.sch make-md.py
	./make-md.py $< $@

docs/universe.png:
	touch "$@"

RENAME=mv $*-gerber/$*.$1 $*-gerber/$($1_ext)
DELETE=rm $*-gerber/$*.$1

accumulate-gerbers: top.gbr_ext=TopSide.gbr
accumulate-gerbers: topmask.gbr_ext=TopSolderMask.gbr
accumulate-gerbers: topsilk.gbr_ext=TopSilkscreen.gbr
accumulate-gerbers: bottom.gbr_ext=BotSide.gbr
accumulate-gerbers: bottommask.gbr_ext=BotSoldermask.gbr
accumulate-gerbers: bottomsilk.gbr_ext=BotSilkscreen.gbr
accumulate-gerbers: outline.gbr_ext=BoardOutline.gbr
accumulate-gerbers: plated-drill.cnc_ext=Drill.cnc
accumulate-gerbers: unplated-drill.cnc_ext=UnplatedDrill.cnc

.PHONY: %-gerbers
%-gerbers:
	mkdir -p $*-gerber
	cp $*.pcb $*-gerber/
	cd $*-gerber && pcb -x gerber --metric $*.pcb
	$(call RENAME,top.gbr)
	$(call RENAME,topmask.gbr)
	$(call DELETE,toppaste.gbr)
	$(call RENAME,topsilk.gbr)
	$(call RENAME,bottom.gbr)
	$(call RENAME,bottommask.gbr)
	$(call DELETE,bottompaste.gbr)
	$(call RENAME,bottomsilk.gbr)
	$(call RENAME,outline.gbr)
	$(call DELETE,fab.gbr)
	$(call RENAME,plated-drill.cnc)
	$(call RENAME,unplated-drill.cnc)
	rm $*-gerber/$*.pcb


%.zip: %-gerbers
	-rm $*.zip
	cd $*-gerber && zip ../$*.zip *.{txt,gbr,cnc}

.PHONY: clean
clean:
	rm -f *- */*- *~ */*~ *.o */*.o *.cir */*.cir *.rcr */*.rcr
	rm -f */*.fake-cir PCB.*.backup PCB.*.save
	rm -f rmsim $(TESTPROGS)
