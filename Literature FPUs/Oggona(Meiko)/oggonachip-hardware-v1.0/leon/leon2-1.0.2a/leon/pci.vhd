
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
-- Entity: 	pci
-- File:	pci.vhd
-- Author:	Jiri Gaisler - Gaisler Reserch
-- Description:	Module containing all possible PCI cores
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.target.all;
use work.config.all;
use work.iface.all;
use work.amba.all;
use work.ambacomp.all;

entity pci is
  port (
    resetn : in  std_logic;
    clk    : in  clk_type;
    pcii   : in  pci_in_type;
    pcio   : out pci_out_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbmi1 : in  ahb_mst_in_type;
    ahbmo1 : out ahb_mst_out_type;
    ahbmi2 : in  ahb_mst_in_type;
    ahbmo2 : out ahb_mst_out_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    irq    : out std_logic

    ;clk_out: out std_logic

  );
end; 

architecture rtl of pci is

signal gnd4 : std_logic_vector(3 downto 0);

begin

-- InSilicon PCI core

  pci_is0 : if PCICORE = insilicon generate
    pci0 : pci_is 
      port map (
      rst_n =>resetn, app_clk => clk, pci_clk  => pcii.pci_clk_in,
      pbi => apbi, pbo => apbo, irq => irq,
      TargetMasterOut => ahbmo1, TargetMasterIn  => ahbmi1,
      pci_in => pcii, pci_out => pcio,
      InitSlaveOut => ahbso, InitSlaveIn  => ahbsi,
      InitMasterOut => ahbmo2, InitMasterIn => ahbmi2
      );
  end generate;



  pci_actel0 : if PCICORE = actel generate

--    pci0 : pci_actel
--      generic map (
--	USER_DEVICE_ID => PCI_DEVICE_ID, USER_VENDOR_ID => PCI_VENDOR_ID,
--	USER_REVISION_ID => PCI_REVISION_ID, USER_SUBSYSTEM_ID => PCI_SUBSYS_ID,
--	USER_BASE_CLASS => PCI_CLASS_CODE)
--      port map (
--      rst => resetn, clk => pcii.pci_clk_in, clk_out => clk_out, pcii => pcii, pcio => pcio,
--      ahbmi => ahbmi1, ahbmo => ahbmo1, ahbsi => ahbsi, ahbso => ahbso
--      );
--
--    ahbmo2.hbusreq <= '0';
--    ahbmo2.hlock <= '0';
--    ahbmo2.htrans <= HTRANS_IDLE;
--    ahbmo2.haddr <= (others => '0');
--    ahbmo2.hwrite <= '0';
--    ahbmo2.hburst <= HBURST_SINGLE;
--    ahbmo2.hprot <= (others => '0');
--    ahbmo2.hwdata <= (others => '0');
--    irq <= '0';
  end generate;


-- Optional ESA PCI core
--  pci_esa0 : if PCICORE = esa generate
--    pci0 : pci_esa
--      port map (
--      resetn => rst.syncrst, app_clk => clko.clk,
--      pci_in => pcii, pci_out => pcio,
--      ahbmasterin => ahbmi(1), ahbmasterout => ahbmo(1),
--      ahbslavein =>  ahbsi(2), ahbslaveout => ahbso(2),
--      apbslavein => apbi(10), apbslaveout => apbo(10), irq => pciirq
--      );
--    pciresetn <= pcii.pci_rst_in_n;
--  end generate;

end ;

