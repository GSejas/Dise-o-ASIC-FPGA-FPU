
VLIB = vlib
VCOM = vcom -quiet -O5
VLOG = vlog -quiet -O5
LIBS = tags work
SOURCES =  config.vhd iface.vhd dcache.vhd icache.vhd ioport.vhd iu.vhd \
	mctrl.vhd irqctrl.vhd clkgen.vhd \
	timers.vhd uart.vhd cachemem.vhd mcore.vhd proc.vhd \
	leon.vhd macro.vhd sparcv8.vhd tech_map.vhd cache.vhd \
	target.vhd device.vhd rstgen.vhd fpulib.vhd \
	debug.vhd leon_pci.vhd fp1eu.vhd meiko.vhd \
	wprot.vhd lconf.vhd ahbstat.vhd irqctrl2.vhd tech_umc18.vhd \
	tech_generic.vhd tech_atc35.vhd mul.vhd div.vhd multlib.vhd \
	tech_virtex.vhd tech_fs90.vhd tech_atc25.vhd pci_arb.vhd pci.vhd\
	pci_is.vhd ahbtest.vhd acache.vhd ahbarb.vhd apbmst.vhd ambacomp.vhd \
	dma.vhd dsu.vhd dsu_mem.vhd dcom_uart.vhd dcom.vhd ahbmst.vhd \
	fpu_core.vhd

tags/%.tag : %.vhd
	$(VCOM) $<
	@touch $@

tags/%.tag : %.v
	$(VLOG) $<
	@touch $@

all: $(LIBS) leon leon_pci 

tags/amba.tag : amba.vhd
amba : tags/amba.tag 
tags/bprom.tag : bprom.vhd
bprom : tags/bprom.tag 
tags/dma.tag : tags/amba.tag tags/iface.tag tags/ambacomp.tag tags/ahbmst.tag dma.vhd
dma : tags/dma.tag 
tags/ahbmst.tag : tags/amba.tag tags/iface.tag tags/ambacomp.tag ahbmst.vhd
ahbmst : tags/ahbmst.tag 
tags/dsu.tag : tags/iface.tag tags/debug.tag dsu.vhd
dsu : tags/dsu.tag 
tags/dsu_mem.tag : tags/iface.tag tags/tech_map.tag dsu_mem.vhd
dsu_mem : tags/dsu_mem.tag 
tags/dcom_uart.tag : tags/amba.tag tags/macro.tag dcom_uart.vhd
dcom_uart : tags/dcom_uart.tag
tags/dcom.tag : tags/amba.tag tags/iface.tag tags/ambacomp.tag tags/ahbmst.tag \
	tags/dcom_uart.tag  dcom.vhd
dcom : tags/dcom.tag 
tags/tech_virtex.tag : tags/config.tag tags/tech_generic.tag tech_virtex.vhd
tech_virtex : tags/tech_virtex.tag 
tags/tech_generic.tag : tags/config.tag tags/iface.tag tech_generic.vhd
tech_generic : tags/tech_generic.tag 
tags/tech_umc18.tag : tags/iface.tag tags/tech_generic.tag tech_umc18.vhd
tech_umc18 : tags/tech_umc18.tag 
tags/tech_fs90.tag : tags/iface.tag tags/tech_generic.tag tech_fs90.vhd
tech_fs90 : tags/tech_fs90.tag 
tags/tech_atc25.tag : tags/iface.tag tags/tech_generic.tag tech_atc25.vhd
tech_atc25 : tags/tech_atc25.tag 
tags/tech_atc35.tag : tags/config.tag tags/tech_generic.tag tech_atc35.vhd
tech_atc35 : tags/tech_atc35.tag 
tags/macro.tag : tags/iface.tag macro.vhd
macro : tags/macro.tag
tags/debug.tag : tags/iface.tag debug.vhd
debug : tags/debug.tag 
tags/multlib.tag : multlib.vhd
multlib : tags/multlib.tag 
tags/div.tag : tags/iface.tag div.vhd
div : tags/div.tag 
tags/mul.tag : tags/iface.tag tags/tech_map.tag mul.vhd
mul : tags/mul.tag 
tags/ambacomp.tag : tags/amba.tag tags/iface.tag ambacomp.vhd
ambacomp : tags/ambacomp.tag 
tags/ahbtest.tag : tags/amba.tag tags/iface.tag tags/dma.tag ahbtest.vhd
ahbtest : tags/ahbtest.tag 
tags/pci_is.tag : tags/amba.tag tags/iface.tag pci_is.vhd
pci_is : tags/pci_is.tag 
tags/pci_test.tag : tags/amba.tag tags/iface.tag pci_test.vhd
pci_test : tags/pci_test.tag 
tags/ahbarb.tag : tags/amba.tag tags/iface.tag ahbarb.vhd
ahbarb : tags/ahbarb.tag 
tags/ahbstat.tag : tags/amba.tag tags/iface.tag ahbstat.vhd
ahbstat : tags/ahbstat.tag 
tags/wprot.tag : tags/amba.tag tags/iface.tag wprot.vhd
wprot : tags/wprot.tag 
tags/lconf.tag : tags/amba.tag tags/iface.tag lconf.vhd
lconf : tags/lconf.tag 
tags/acache.tag : tags/amba.tag tags/macro.tag acache.vhd
acache : tags/acache.tag 
tags/apbmst.tag : tags/amba.tag tags/iface.tag apbmst.vhd
apbmst : tags/apbmst.tag 
tags/target.tag : target.vhd
target : tags/target.tag
tags/device.tag : tags/target.tag device.vhd
device : tags/device.tag
tags/config.tag : tags/target.tag tags/device.tag config.vhd
config : tags/config.tag
tags/sparcv8.tag : tags/config.tag sparcv8.vhd
sparcv8 : tags/sparcv8.tag
tags/iface.tag : tags/sparcv8.tag tags/target.tag iface.vhd
iface : tags/iface.tag
tags/rstgen.tag : tags/config.tag tags/iface.tag rstgen.vhd
rstgen : tags/rstgen.tag
tags/mpciif.tag : tags/config.tag tags/iface.tag mpciif.vhd
mpciif : tags/mpciif.tag
tags/meiko.tag : tags/config.tag tags/iface.tag meiko.vhd
meiko : tags/meiko.tag
tags/fpu_lth.tag : tags/config.tag tags/iface.tag fpu_lth.vhd
fpu_lth : tags/fpu_lth.tag
tags/fpulib.tag : tags/iface.tag tags/meiko.tag tags/fpu_lth.tag fpulib.vhd
fpulib : tags/fpulib.tag
tags/fpu_core.tag : tags/fpulib.tag fpu_core.vhd
fpu_core : tags/fpu_core.tag
tags/fp1eu.tag : tags/fpu_core.tag tags/iface.tag tags/macro.tag tags/debug.tag tags/tech_map.tag fp1eu.vhd
fp1eu : tags/fp1eu.tag
#tags/fp.tag : tags/fpulib.tag tags/meiko.tag tags/iface.tag tags/macro.tag tags/debug.tag fp.vhd
#fp : tags/fp.tag
#tags/cp.tag : tags/iface.tag tags/macro.tag cp.vhd
#cp : tags/cp.tag
tags/iu.tag : tags/macro.tag tags/mul.tag tags/div.tag iu.vhd
iu : tags/iu.tag
tags/tech_map.tag : tags/iface.tag tags/tech_generic.tag tags/tech_atc35.tag \
	tags/tech_atc25.tag tags/tech_virtex.tag tags/tech_fs90.tag \
	tags/tech_umc18.tag tags/bprom.tag tags/multlib.tag tech_map.vhd
tech_map : tags/tech_map.tag
tags/dcache.tag : tags/macro.tag dcache.vhd
dcache : tags/dcache.tag
tags/icache.tag : tags/macro.tag icache.vhd
icache : tags/icache.tag
tags/cachemem.tag : tags/tech_map.tag tags/macro.tag cachemem.vhd
cachemem : tags/cachemem.tag
tags/cache.tag : tags/amba.tag tags/icache.tag tags/dcache.tag tags/acache.tag cache.vhd
cache : tags/cache.tag
tags/clkgen.tag : tags/iface.tag clkgen.vhd
clkgen : tags/clkgen.tag
tags/proc.tag : tags/iu.tag tags/clkgen.tag tags/cache.tag tags/fpu_core.tag \
	tags/fp1eu.tag tags/tech_map.tag tags/cachemem.tag proc.vhd
proc : tags/proc.tag
tags/irqctrl.tag : tags/amba.tag tags/macro.tag irqctrl.vhd
irqctrl : tags/irqctrl.tag
tags/irqctrl2.tag : tags/amba.tag tags/macro.tag irqctrl2.vhd
irqctrl2 : tags/irqctrl2.tag
tags/ioport.tag : tags/amba.tag tags/macro.tag ioport.vhd
ioport : tags/ioport.tag
tags/timers.tag : tags/amba.tag tags/macro.tag timers.vhd
timers : tags/timers.tag
tags/pci_arb.tag : tags/iface.tag tags/amba.tag pci_arb.vhd
pci_arb : tags/pci_arb.tag
tags/pci.tag : tags/iface.tag tags/amba.tag tags/pci_is.tag pci.vhd
pci : tags/pci.tag
tags/uart.tag : tags/amba.tag tags/macro.tag uart.vhd
uart : tags/uart.tag
tags/mctrl.tag : tags/config.tag tags/amba.tag tags/macro.tag tags/tech_map.tag mctrl.vhd
mctrl : tags/mctrl.tag
tags/mcore.tag : tags/rstgen.tag tags/ambacomp.tag tags/proc.tag tags/mctrl.tag tags/pci_arb.tag \
	tags/uart.tag tags/timers.tag tags/ioport.tag tags/ahbarb.tag tags/apbmst.tag \
	tags/wprot.tag tags/ahbstat.tag tags/ahbtest.tag \
	tags/lconf.tag tags/irqctrl.tag tags/pci.tag tags/irqctrl2.tag \
	tags/dcom.tag tags/dsu.tag tags/dsu_mem.tag mcore.vhd
mcore : tags/mcore.tag

tags/leon.tag : tags/tech_map.tag tags/mcore.tag tags/debug.tag leon.vhd
leon : tags/leon.tag

tags/leon_pci.tag : tags/leon.tag leon_pci.vhd
leon_pci : tags/leon_pci.tag
tags : 
	mkdir tags
work : 
	$(VLIB) work

clean:
	-rm -rf tags work *.tags vcx* trnscr* core vsim.wav
