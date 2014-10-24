
IOBANK=12 13 14 15 16 32 33 34
IOBANK.sym=$(IOBANK:%=fpga-%.sym)

MGT=115 116
MGT.sym=$(MGT:%=fpga-%.sym)

FPGA=../doc/xc7k160tffg676pkg.txt

all: $(IOBANK.sym) $(MGT.sym)

$(IOBANK.sym): fpga-%.sym: munge-pins.py  $(FPGA) bank-template.sym
	./munge-pins.py --bank=$* $(ARGS) $(FPGA) bank-template.sym > $@.tmp
	mv $@.tmp $@

$(MGT.sym): fpga-%.sym: munge-pins.py  $(FPGA) mgt-template.sym
	./munge-pins.py --bank=$* $(ARGS) $(FPGA) mgt-template.sym > $@.tmp
	mv $@.tmp $@

fpga-14.sym: ARGS=--useless DQS DOUT EMCCLK '[AD]\d\d' --
fpga-15.sym: ARGS=--useless 'AD\d+[PN]' 'A\d\d' FOE FWE --
