
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
-- Entity: 	pci_esa
-- File:	pci_esa.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	Dummy module to test the ESA PCI core interface
-------------------------------------------------------------------------------
-- THIS IS JUST A DUMMY VERSION TO TEST THE LEON/AHB INTERFACE
-------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;

use work.amba.all;
use work.iface.all;

entity pci_esa is
   port (
      resetn          : in  std_logic;         -- Amba reset signal
      app_clk         : in  clk_type;          -- Application clock
      pci_in          : in  pci_in_type;       -- PCI pad inputs
      pci_out         : out pci_out_type;      -- PCI pad outputs
      ahbmasterin     : in  ahb_mst_in_type;   -- AHB Master inputs
      ahbmasterout    : out ahb_mst_out_type;  -- AHB Master outputs
      ahbslavein      : in  ahb_slv_in_type;   -- AHB Slave inputs
      ahbslaveout     : out ahb_slv_out_type;  -- AHB Slave outputs
      apbslavein      : in  APB_Slv_In_Type;   -- peripheral bus in
      apbslaveout     : out APB_Slv_Out_Type;  -- peripheral bus out
      irq             : out std_logic          -- interrupt request
      );
end pci_esa;

architecture struct of pci_esa is
begin

    ahbmasterout.haddr   <= (others => '0') ;
    ahbmasterout.htrans  <= HTRANS_IDLE;
    ahbmasterout.hbusreq <= '0';
    ahbmasterout.hwdata  <= (others => '0');
    ahbmasterout.hlock   <= '0';
    ahbmasterout.hwrite  <= '0';
    ahbmasterout.hsize   <= HSIZE_WORD;
    ahbmasterout.hburst  <= HBURST_SINGLE;
    ahbmasterout.hprot   <= (others => '0');      

    ahbslaveout.hrdata <= (others => '0');
    ahbslaveout.hready <= '1';
    ahbslaveout.hresp  <= HRESP_OKAY;         

    irq <= '0';
end;
