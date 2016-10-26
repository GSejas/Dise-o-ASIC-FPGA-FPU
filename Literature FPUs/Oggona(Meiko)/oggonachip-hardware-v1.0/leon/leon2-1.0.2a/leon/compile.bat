vlib work
vcom -quiet amba.vhd 
vcom -quiet target.vhd device.vhd config.vhd sparcv8.vhd iface.vhd
vcom -quiet macro.vhd debug.vhd ambacomp.vhd multlib.vhd
vcom -quiet tech_generic.vhd tech_atc35.vhd tech_atc25.vhd tech_umc18.vhd
vcom -quiet tech_fs90.vhd bprom.vhd tech_virtex.vhd tech_map.vhd
vcom -quiet fpulib.vhd meiko.vhd fpu_lth.vhd fpu_core.vhd fp1eu.vhd mul.vhd
vcom -quiet div.vhd clkgen.vhd rstgen.vhd iu.vhd icache.vhd dcache.vhd
vcom -quiet cachemem.vhd acache.vhd cache.vhd proc.vhd irqctrl2.vhd
vcom -quiet apbmst.vhd ahbarb.vhd lconf.vhd wprot.vhd ahbtest.vhd ahbstat.vhd
vcom -quiet timers.vhd irqctrl.vhd uart.vhd ioport.vhd mctrl.vhd
vcom -quiet ahbmst.vhd dcom_uart.vhd dcom.vhd dma.vhd dsu.vhd dsu_mem.vhd
vcom -quiet pci_arb.vhd pci_is.vhd pci.vhd mcore.vhd
vcom -quiet leon_pci.vhd leon.vhd

