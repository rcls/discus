
%.spnetr: %.sch
	gnetlist -Lsubckt -g spice-sdb -o $@ $<

%.spnet: %.spnetr
	perl substrate.pl $< > $@
