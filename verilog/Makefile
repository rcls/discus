XIL=/home/Xilinx/14.7/ISE_DS/ISE/bin/lin64

XST=$(XIL)/xst
NGDBUILD=$(XIL)/ngdbuild
MAP=$(XIL)/map
PAR=$(XIL)/par
TRCE=$(XIL)/trce

COST_TABLE=64

MAP_OPTS=-w -logic_opt on -xe n -global_opt speed -mt off -detail -ir off -ignore_keep_hierarchy -pr b -t $(COST_TABLE) -p xc6slx9-tqg144-3

.PHONY: all
all: work/discus.twr

work/discus.ngc: discus.v discus.ucf
	cd work ; $(XST) -intstyle ise -ifn discus.xst -ofn discus.syr

%.ngd: %.ngc ../%.ucf
	$(NGDBUILD) -intstyle ise -dd _ngo -nt timestamp -uc $(word 2,$^) -p xc6slx9-tqg144-3 "$<" "$@"

%_map.ncd %.pcf: %.ngd
	$(MAP) "$<" $(MAP_OPTS) -o $*_map.ncd $*.pcf

%.ncd: %_map.ncd %.pcf
	$(PAR) $< -ol high -xe n -mt off -w "$@" $(word 2, $^)

%.twr %.twx: %.ncd %.pcf
	$(TRCE) $< $(word 2,$^) -xml $*.twx -v 1 -n 10 -fastpaths -o $*.twr

explore/%/trial.ngd: work/discus.ngd
	mkdir -p $(@D)
	cp "$<" "$@"

explore/%/trial_map.ncd explore/%/trial.pcf: COST_TABLE="$(patsubst explore/%,%,${@D})"
#explore/%/trial_map.ncd: COST_TABLE=23
#explore/%/trial.pcf: COST_TABLE=23

vpath %.ngd work

.SECONDARY:

