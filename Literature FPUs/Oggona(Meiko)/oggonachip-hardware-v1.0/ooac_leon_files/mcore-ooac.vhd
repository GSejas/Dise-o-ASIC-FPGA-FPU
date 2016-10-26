
----------------------------------------------------------------------------
--  This file is a part of the LEON VHDL model
--  Copyright (C) 1999  European Space Agency (ESA)
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2 of the License, or (at your option) any later version.
--
--  See the file COPYING.LGPL for the full details of the license.


-----------------------------------------------------------------------------
-- Entity: 	mcore
-- File:	mcore.vhd
-- Author:	Jiri Gaisler - Gaisler Reserch
-- Description:	Module containing the processor, caches, memory controller
--	        and standard peripherals
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.target.all;
use work.config.all;
use work.iface.all;
use work.amba.all;
use work.ambacomp.all;
-- pragma translate_off
use work.debug.all;
use work.ddmlib.all;
use work.mdctlib.all;
-- pragma translate_on


entity mcore is
  port (
    resetn   : in  std_logic;
    clk      : in  std_logic;
    memi     : in  memory_in_type;
    memo     : out memory_out_type;
    ioi      : in  io_in_type;
    ioo      : out io_out_type;
    pcii     : in  pci_in_type;
    pcio     : out pci_out_type;
    ddmi     : in  ddm_in_type;	     --LA
    ddmo     : out ddm_out_type;     --LA
    dsi      : in  dsuif_in_type;
    dso      : out dsuif_out_type;

    test     : in    std_logic
  );
end; 

architecture rtl of mcore is

component clkgen 
port (
    clk    : in  std_logic;
    pciclk : in  std_logic;
    clki   : in  clkgen_in_type;
    clko   : out clkgen_out_type
);
end component;

component rstgen 
port (
    resetn : in  std_logic;
    pcirst : in  std_logic;
    clk    : in  clk_type;
    rst    : out rst_type
);
end component;

component dsu_mem
  generic (cfgindex : integer := def_cfgindex);
  port (
    clk    : in  clk_type;
    dmi    : in  dsumem_in_type;
    dmo    : out dsumem_out_type
  );
end component; 

component ddm is
  port (
    rst   : in  std_logic;
    clk   : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    ddmi  : in  ddm_in_type;
    ddmo  : out ddm_out_type;
    irq   : out std_logic
  );
end component;

component mdct
  port (
    rst   : in  std_logic;
    clk   : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    irq   : out std_logic;
    audioirq: in std_logic
    );
end component;


signal rst   : rst_type;
signal clko  : clkgen_out_type;
signal clki  : clkgen_in_type;
signal iui   : iu_in_type;
signal iuo   : iu_out_type;
signal ahbsto: ahbstat_out_type;
signal mctrlo: mctrl_out_type;
signal wpo   : wprot_out_type;
signal apbi  : apb_slv_in_vector(0 to APB_SLV_MAX-1);
signal apbo  : apb_slv_out_vector(0 to APB_SLV_MAX-1);
signal ahbmi : ahb_mst_in_vector(0 to AHB_MST_MAX-1);
signal ahbmo : ahb_mst_out_vector(0 to AHB_MST_MAX-1);
signal ahbsi : ahb_slv_in_vector(0 to AHB_SLV_MAX-1);
signal ahbso : ahb_slv_out_vector(0 to AHB_SLV_MAX-1);
signal pciresetn, pciirq, lclk, pci_clk_out : std_logic;
signal dsuo  : dsu_out_type;
signal dcomo  : dcom_out_type;

signal irqi   : irq_in_type;
signal irqo   : irq_out_type;
signal irq2i  : irq2_in_type;
signal irq2o  : irq2_out_type;
signal timo   : timers_out_type;
signal pioo   : pio_out_type;
signal uart1i, uart2i  : uart_in_type;
signal uart1o, uart2o  : uart_out_type;
signal dmi    : dsumem_in_type;
signal dmo    : dsumem_out_type;
signal ddmirq : std_logic;
signal mdctirq : std_logic;

begin

-- reset generator

  reset0 : rstgen port map (resetn, pciresetn, clko.clk, rst);

-- clock generator

  clkgen0 : clkgen port map (lclk, pcii.pci_clk_in, clki, clko);


----------------------------------------------------------------------
-- AHB bus                                                          --
----------------------------------------------------------------------

-- AHB arbiter/decoder

  ahb0 : ahbarb 
	 generic map (masters => AHB_MASTERS, defmast => AHB_DEFMST)
	 port map (rst.syncrst, clko.clk, ahbmi(0 to AHB_MASTERS-1), 
	      ahbmo(0 to AHB_MASTERS-1), ahbsi, ahbso);

-- AHB/APB bridge

  apb0 : apbmst
	 port map (rst.syncrst, clko.clk, ahbsi(1), ahbso(1), apbi, apbo);

-- processor and cache sub-system

  proc0 : proc port map (
	rst.syncrst, clki, clko, apbi(2), apbo(2), ahbmi(0), ahbmo(0), 
	ahbsi(0), iui, iuo);

-- debug support unit
  dsugen : if DEBUG_UNIT generate
    dsu0 : dsu generic map (DEF_CFGINDEX)
	   port map ( rst.syncrst, clko.clk, ahbmi(0), ahbsi(2), ahbso(2),
	              dsi.dsui, dsuo, iuo.debug, iui.debug, irqo, dmi, dmo);
    dso.dsuo <= dsuo;
    dsum0 : dsu_mem generic map (DEF_CFGINDEX) port map ( clko.clk, dmi, dmo);
  end generate;
  dcomgen : if DEBUG_UNIT generate
    dcom0 : dcom 
            port map ( rst.syncrst, clko.clk, dsi.dcomi, dcomo, dsuo, apbi(11),
	    apbo(11), ahbmi(AHB_MASTERS-1), ahbmo(AHB_MASTERS-1) );
    dso.dcomo <= dcomo;
  end generate;

-- memory controller

  mctrl0 : mctrl port map (

	rst => rst, clk=> clko.clk, memi => memi, memo => memo,

	ahbsi => ahbsi(0), ahbso => ahbso(0), apbi => apbi(0), apbo => apbo(0), 
	pioo => pioo, wpo => wpo, mctrlo => mctrlo);


-- AHB write protection

  wp0 : if WPROTEN generate
    wpm :  wprot port map ( 
	rst => rst, clk => clko.clk, wpo => wpo,  ahbsi => ahbsi(0), 
	apbi => apbi(3), apbo => apbo(3));
  end generate;
  wp1 : if not WPROTEN generate apbo(3).prdata <= (others => '0'); end generate;

-- AHB status register

  as0 : if AHBSTATEN generate
    asm :  ahbstat port map ( 
	rst => rst, clk => clko.clk, ahbmi => ahbmi(0), ahbsi => ahbsi(0), 

	apbi => apbi(1), apbo => apbo(1), ahbsto => ahbsto);

  end generate;
  as1 : if not AHBSTATEN generate 
    apbo(1).prdata <= (others => '0'); ahbsto.ahberr <= '0';
  end generate;

-- AHB test module

  ahbt : if AHBTST generate
    a0 : ahbtest port map ( rst => rst.syncrst, clk => clko.clk, 
	ahbi => ahbsi(4), ahbo => ahbso(4)
    );
    dma0 : dma 
      port map (
      rst => rst.syncrst, clk => clko.clk, dirq  => pciirq, apbi => apbi(12),
      apbo => apbo(12), ahbi  => ahbmi(1), ahbo => ahbmo(1) );
    pciresetn <= '1';
  end generate;

-- Optional PCI core

  pci0 : if PCIEN generate

    pci0 : pci
      port map (
      resetn => rst.syncrst, clk => clko.clk,
      pcii => pcii, pcio => pcio,
      ahbmi1 => ahbmi(1), ahbmo1 => ahbmo(1),
      ahbmi2 => ahbmi(2), ahbmo2 => ahbmo(2),
      ahbsi => ahbsi(3), ahbso => ahbso(3),
      apbi => apbi(11), apbo => apbo(11), irq => pciirq

      , clk_out => pci_clk_out

      );
    pciresetn <= pcii.pci_rst_in_n;
  end generate;

  lclk <= pci_clk_out when (PCICORE = actel) else clk;
  pr0 : if not PCIEN generate pciirq <= '0'; pciresetn <= '0'; end generate;

-- drive unused part of the AHB bus to stop some stupid synthesis tools
-- from inserting tri-state buffers (!)

  ahbdrv : for i in 0 to AHB_SLV_MAX-1 generate
    u0 : if not AHB_SLVTABLE(i).enable and (AHB_SLVTABLE(i).index /= 0) generate
      ahbso(AHB_SLVTABLE(i).index).hready <= '0'; ahbso(i).hresp  <= "--";
      ahbso(AHB_SLVTABLE(i).index).hrdata <= (others => '-'); ahbso(i).hsplit <= (others => '-');
    end generate;
  end generate;

----------------------------------------------------------------------
-- APB bus                                                          --
----------------------------------------------------------------------

  pci_arb0 : if PCIARBEN generate
    pciarb : pci_arb
       port map (
         clk => pcii.pci_clk_in, rst_n => rst.syncrst,
         req_n => ioi.pci_arb_req_n, frame_n => pcii.pci_frame_in_n,
         gnt_n => ioo.pci_arb_gnt_n, pclk => clko.clk, 
         prst_n => pcii.pci_rst_in_n, pbi => apbi(13), pbo => apbo(13)
       );
  end generate;

-- LEON configuration register

  lc0 : if CFGREG generate
    lcm : lconf port map (rst => rst, apbo => apbo(4));
  end generate;

-- timers (and watchdog)

  timers0 : timers 
  port map (rst => rst.syncrst, clk => clko.clk, apbi => apbi(5), 
	    apbo => apbo(5), timo => timo, dsuo => dsuo);

-- UARTS
-- This stupidity exists because synopsys DC is not capable of
-- handling record elements in port maps. Sad really ...

  uart1i.rxd     <= pioo.rxd(0); uart1i.ctsn    <= pioo.ctsn(0);
  uart2i.rxd     <= pioo.rxd(1); uart2i.ctsn    <= pioo.ctsn(1);
  uart1i.scaler  <= pioo.io8lsb; uart2i.scaler  <= pioo.io8lsb;

  uart1 : uart port map ( 
    rst => rst.syncrst, clk => clko.clk, apbi => apbi(6), apbo => apbo(6), 
    uarti => uart1i, uarto => uart1o);
      
  uart2 : uart port map ( 
    rst => rst.syncrst, clk => clko.clk, apbi => apbi(7), apbo => apbo(7), 
    uarti => uart2i, uarto => uart2o);
      
-- interrupt controller

  irqctrl0 : irqctrl 
  port map (rst  => rst.syncrst, clk  => clko.clk, apbi => apbi(8), 
	    apbo => apbo(8), irqi => irqi, irqo => irqo);
  irqi.intack <= iuo.intack; irqi.irl <= iuo.irqvec; iui.irl <= irqo.irl;    

-- optional secondary interrupt controller

  i2 : if IRQ2EN generate
    irqctrl1 : irqctrl2
    port map (rst  => rst.syncrst, clk  => clko.clk, apbi => apbi(10), 
 	      apbo => apbo(10), irqi => irq2i, irqo => irq2o);
  end generate;

-- parallel I/O port

  ioport0 : ioport 
  port map (rst => rst, clk  => clko.clk, apbi => apbi(9), apbo => apbo(9),
            uart1o => uart1o, uart2o => uart2o, mctrlo => mctrlo,
	    ioi => ioi, pioo => pioo);

-- drive unused part of the APB bus to stop some stupid synthesis tools
-- from inserting tri-state buffers (!)

  apbdrv : for i in 0 to APB_SLV_MAX-1 generate
    u0 : if not APB_TABLE(i).enable and (APB_TABLE(i).index /= 0) generate
	apbo( APB_TABLE(i).index).prdata <= (others => '-');
    end generate;
  end generate;  

-- ddm
ddm0 : ddm
    port map (rst => rst.syncrst, clk => clk, apbi => apbi(12), apbo => apbo(12),ahbi => ahbmi(2), ahbo => ahbmo(2), ddmo => ddmo, ddmi => ddmi,irq => ddmirq );	    -- LA

-- mdct
  mdct0 : mdct
    port map (rst => rst.syncrst, clk => clk, apbi => apbi(13), apbo => apbo(13),ahbi => ahbmi(1), ahbo => ahbmo(1),irq => mdctirq, audioirq => ddmirq );	    -- LA	

-- IRQ assignments, add you mapping below

  irqi.irq(15) <= '0';             -- unmaskable irq
  irqi.irq(14) <= pciirq;
  irqi.irq(13) <= ddmirq;		   -- ddm irq
  irqi.irq(12) <= mdctirq;		   -- mdct irq  
--  irqi.irq(12 downto 12) <= (others => '0'); -- unassigned irqs
  irqi.irq(11) <= dsuo.ntrace when DEBUG_UNIT else '0';
  irqi.irq(10) <= irq2o.irq when IRQ2EN else '0';
  irqi.irq(9) <=  timo.irq(1);		     -- timer 2
  irqi.irq(8) <=  timo.irq(0);		     -- timer 1
  irqi.irq(7 downto 4) <= pioo.irq;	     -- I/O port interrupts
  irqi.irq(3) <= uart1o.irq;		     -- UART 1
  irqi.irq(2) <= uart2o.irq;		     -- UART 2
  irqi.irq(1) <= ahbsto.ahberr;		     -- AHB error

  -- additional 32 interrupts for secondary interrupt controller
  irq2i.irq <= (others => '0');

-- drive outputs

  ioo.piol      <= pioo.piol(15 downto 0);
  ioo.piodir    <= pioo.piodir(15 downto 0);
  ioo.wdog      <= timo.wdog;
  ioo.errorn    <= iuo.error;




-- disassambler

-- pragma translate_off
  trace0 : trace(iuo.debug, (test = '1'));
-- pragma translate_on


end ;

