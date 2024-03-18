
LEPTON=/home/lepton
export LD_LIBRARY_PATH=$(LEPTON)/lib:
NETLIST=$(LEPTON)/bin/lepton-netlist
EXPORT=$(LEPTON)/bin/lepton-export
PCB=$(LEPTON)/bin/pcb

ADHOC_TEST = alu pcdecode opdecode ramdecode romdecode sp
PROG_TEST = memp mem memi memw call cmp hazard2 inc sub add logic memf hazard
TESTS=$(PROG_TEST:%=test/%) $(ADHOC_TEST:%=test/%)

BOARDS=bit control dram32byte rom64byte

RUST_DISCUS=target/debug/discus

# Note that this needs to be sync'd with the schematic in a few places.
QUANTUM=2000

all: $(RUST_DISCUS) boards

$(RUST_DISCUS): src/*.rs
	cargo build

verify: $(TESTS:%=%.verify)
verify-adhoc: $(ADHOC_TEST:%=test/%.verify)

%.rcr: %.sch gates/*.sch board/*.sch sym/*.sym subckt/*.prm
	time ./cached.py -o $@ -i $< -- $(NETLIST) -L subckt -g spice-sdb -o $@ $<

%.cir: %.rcr ./substrate.py
	./substrate.py $< > $@

$(PROG_TEST:%=test/%.cir): %.cir: board/univlight.cir test/rommunge.py $(RUST_DISCUS)
	$(RUST_DISCUS) $(*F) -T -R | test/rommunge.py -t $(QUANTUM) -w $@ board/univlight.cir $*.cir

%.verify: %.raw $(RUST_DISCUS)
	$(RUST_DISCUS) $(*F) -t $(QUANTUM) -V $<

.PRECIOUS: %.rcr %.raw %.cir
%.raw: %.cir
	time ./cached.py -o $@ -i $< -- ngspice -r $@ -b $<

count: board/bit.rcr board/control.rcr board/rom64byte.rcr \
    board/dram64byte.rcr board/dram32byte.rcr
	grep -Ec -e '^M.*\b[PN]MOS_switch' -e '^Q.*\b(PDTC124TU|BC847)' \
	    -e '^J.*(2SK3557|J309)' $+

SYMS=$(wildcard sym/*.sym)
GATES=$(wildcard gates/*.sch)
BOARD=$(wildcard board/*.sch)
ALL_SYM=$(SYMS:sym/%.sym=%)
ALL_SCH=$(GATES:gates/%.sch=%) $(BOARD:board/%.sch=%)

.PHONY: png md web
web: png md html
png: $(ALL_SYM:%=docs/%-sym.png) $(ALL_SCH:%=docs/%.png) \
	docs/bit-top.png docs/control-top.png
md: $(ALL_SCH:%=docs/%.md)
html: $(ALL_SCH:%=docs/%.html) docs/README.html

boards: ${BOARDS:%=board/%-board.sch}

board/%-board.sch: board/%.sch board.py sym/*.sym gates/*.sch
	./board.py -s "sym/$*.sym" "$<" "$@"

vpath %.sch gates board
vpath %.sym sym

docs/%-sym.png: %.sym
	$(EXPORT) -m 1 -k 1 -d 300 -c -o "$@" "$<"

docs/%.png: %.sch
	$(EXPORT) -m 1 -k 1 -d 600 -c -o "$@" "$<"

docs/%.md: %.sch make-md.py
	./make-md.py $< $@

%.html: %.md
	$(HOME)/.local/bin/grip $< --export $@

docs/%-top.png: board/%-board.pcb
	$(PCB) -x png --photo-mode --photo-plating gold --outfile $@.tmp --xy-max 4000 $<
	convert -extract 4000x2000+0+0 -scale 1000 $@.tmp $@
	rm $@.tmp


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
	rm -f */*.raw
	rm -f PCB.*.backup PCB.*.save
	rm -rf target
