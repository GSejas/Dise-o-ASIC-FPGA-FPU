#Script for simulate plataform including external cores
# Following files cointain interface of new cores to leon plataform:
# target32.vhd
# iface32.vhd
# ambacomp32.vhd
# mcore32.vhd
# leon_sim32.vhd --This file is only simulable. for synthesis use leon_32.vhd
# for original files supress 32 at end.

vlib leon/work
vcom  leon/amba.vhd 
vcom  leon/target-ooac.vhd 
vcom  leon/device.vhd 
vcom  leon/config.vhd 
vcom  leon/sparcv8.vhd 
vcom  leon/iface-ooac.vhd
vcom  leon/macro.vhd
vcom  leon/debug.vhd 
vcom  leon/ambacomp-ooac.vhd 
vcom  leon/multlib.vhd
vcom  leon/tech_generic.vhd 
vcom  leon/tech_atc35.vhd 
vcom  leon/tech_atc25.vhd 
vcom  leon/tech_umc18.vhd
vcom  leon/tech_fs90.vhd 
vcom  leon/bprom.vhd 
vcom  leon/tech_virtex.vhd 
vcom  leon/tech_map.vhd
#vcom  leon/fpulib.vhd
#vlog  leon/meiko_refined.v 
vcom  leon/meiko.vhd 
#vcom  leon/fpu_lth.vhd 
#vcom  leon/fpu_core.vhd 
#vcom  leon/fp1eu.vhd 
vcom  leon/mul.vhd
vcom  leon/div.vhd 
vcom  leon/clkgen.vhd 
vcom  leon/rstgen.vhd 
vcom  leon/iu.vhd 
vcom  leon/icache.vhd 
vcom  leon/dcache.vhd
vcom  leon/cachemem.vhd 
vcom  leon/acache.vhd 
vcom  leon/cache.vhd 
vcom  leon/mdctrom256.vhd
vcom  leon/mdctlib.vhd
vcom  leon/mdctcomp.vhd
vcom  leon/ddmlib.vhd
vcom  leon/ddm16.vhd
vcom  leon/mdct.vhd
vcom  leon/proc.vhd 
vcom  leon/irqctrl2.vhd
vcom  leon/apbmst.vhd 
vcom  leon/ahbarb.vhd 
vcom  leon/lconf.vhd 
vcom  leon/wprot.vhd 
vcom  leon/ahbtest.vhd 
vcom  leon/ahbstat.vhd
vcom  leon/timers.vhd 
vcom  leon/irqctrl.vhd 
vcom  leon/uart.vhd 
vcom  leon/ioport.vhd 
vcom  leon/mctrl.vhd
vcom  leon/ahbmst.vhd 
vcom  leon/dcom_uartvcom  leon/dcom.vhd 
vcom  leon/dma.vhd 
vcom  leon/dsu.vhd 
vcom  leon/dsu_mem.vhd
vcom  leon/pci_arb.vhd 
vcom  leon/pci_is.vhd 
vcom  leon/pci_esa.vhd
vcom  leon/pci.vhd 
vcom  leon/mcore.ooac.vhd
vcom  leon/leon_pci.vhd 
vcom  leon/leon-ooac.vhd

vcom  tbench32/leonlib.vhd 
vcom  tbench32/iram.vhd 
vcom  tbench32/testmod.vhd 
vcom  tbench32/mspram.vhd 
vcom  tbench32/bprom.vhd
vcom  tbench32/tbgen.vhd 
vcom  tbench32/tblib.vhd 
vcom  tbench32/tbdef.vhd 
vcom  tbench32/tbleon.vhd 
vcom  tbench32/tb_msp.vhd










