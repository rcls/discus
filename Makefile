
GNETLIST=/home/geda/bin/gnetlist


TESTCC = alu pcdecode opdecode sp
SCRIPTS= testadd testsub testcall testinc testmem hazard logic rmsim
TESTPROGS=$(TESTCC:%=test/test%)
SCRIPTPROG=$(SCRIPTS:%=test/%)
PROGS=pattern monitor blink

all:

verify: $(TESTPROGS:%=%.verify)

%.rcr: %.sch
	$(GNETLIST) -Lsubckt -g spice-sdb -o $@ $+

%.cir: %.rcr
	./substrate.py $< > $@

%.fake-cir: %.cir
	perl test/fake.pl $< > $@

DEPS=-MMD -MP -MF.$(subst /,:,$@).d
CXXFLAGS=-O2 -fbounds-check -Wall -Werror -ggdb -std=c++11 -I. $(DEPS)

-include .*.d

%: %.cc
CC=g++

$(TESTPROGS) $(SCRIPTPROG): test/spice_load.o
$(SCRIPTPROG): test/state.o test/script.o

$(TESTPROGS:%=%.verify): %.raw %
	./$* < $*.raw

$(SCRIPTPROG:%=%.cir): %.cir: % board/univlight.cir
	./$< -C
	./$< -T -R | test/rommunge.py -w $@ board/univlight.cir $*.cir

$(SCRIPTPROG:%=%.verify): %.verify: %.raw %
	./$* -V $<

.PRECIOUS: %.raw
%.raw: %.cir
	ngspice -r $@ -b $<

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
