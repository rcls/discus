
%.spnetr: %.sch
	gnetlist -g spice-sdb -o $@ $<

%.spnet: %.spnetr
	perl substrate.pl $< > $@
