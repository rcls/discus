
%.spr: %.sch
	gnetlist -Lsubckt -g spice-sdb -o $@ $<

%.sp: %.spr
	perl substrate.pl $< > $@
