XIL=/home/Xilinx/14.7/ISE_DS/ISE/bin/lin64

XST=$(XIL)/xst
NGDBUILD=$(XIL)/ngdbuild
MAP=$(XIL)/map
PAR=$(XIL)/par
TRCE=$(XIL)/trce

COST_TABLE=64

MAP_OPTS=-p xc6slx9-tqg144-3 -w -logic_opt on -ol high -t $(COST_TABLE) -global_opt speed -ir off -pr b

.PHONY: all
all: work/swinterface.twr

work/discus.ngc: discus.v discus.ucf
	cd work ; $(XST) -intstyle ise -ifn discus.xst -ofn discus.syr

work/swinterface.ngc: swinterface.v swinterface.ucf
	cd work ; $(XST) -intstyle ise -ifn swinterface.xst -ofn swinterface.syr

%.ngd: %.ngc ../%.ucf
	$(NGDBUILD) -intstyle ise -dd _ngo -nt timestamp -uc $(word 2,$^) -p xc6slx9-tqg144-3 "$<" "$@"

%_map.ncd %.pcf: %.ngd
	$(MAP) "$<" $(MAP_OPTS) -o $*_map.ncd $*.pcf

%.ncd: %_map.ncd %.pcf
	$(PAR) $< -ol high -mt off -w "$@" $(word 2, $^)

%.twr %.twx: %.ncd %.pcf
	$(TRCE) $< $(word 2,$^) -xml $*.twx -v 1 -n 10 -fastpaths -o $*.twr

explore/%/discus.ngd: work/discus.ngd
	mkdir -p $(@D)
	cp "$<" "$@"

explore/%/discus_map.ncd explore/%/discus.pcf: COST_TABLE="$(patsubst explore/%,%,${@D})"

explore/%/swinterface.ngd: work/swinterface.ngd
	mkdir -p $(@D)
	cp "$<" "$@"

explore/%/swinterface_map.ncd explore/%/swinterface.pcf: COST_TABLE="$(patsubst explore/%,%,${@D})"

vpath %.ngd work

.SECONDARY:

