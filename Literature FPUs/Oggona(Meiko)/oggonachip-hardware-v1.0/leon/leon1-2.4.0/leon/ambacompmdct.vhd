
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
-- Entity: 	ambacomp
-- File:	ambacomp.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	Component declarations of AMBA cores
------------------------------------------------------------------------------

-- 29.01.02 DDM connected. LA


library IEEE;
use IEEE.std_logic_1164.all;
use work.amba.all;
use work.target.all;
use work.config.all;
use work.iface.all;

package ambacomp is

-- processor core

component proc
  port (
    rst    : in  std_logic;
    clki   : out clkgen_in_type;
    clko   : in  clkgen_out_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    iui    : in  iu_in_type;
    iuo    : out iu_out_type
  );
end component;

-- AMBA/PCI interface for InSilicon (was Phoenix) PCI core
component pci_is 
   port (
      rst_n           : in  std_logic;
      app_clk         : in  clk_type;
      pci_clk         : in  clk_type;          -- switched clock for PCI config regs
      pbi             : in  APB_Slv_In_Type;   -- peripheral bus in
      pbo             : out APB_Slv_Out_Type;  -- peripheral bus out
      irq             : out std_logic;         -- interrupt request
      TargetMasterOut : out ahb_mst_out_type;  -- PCI target DMA
      TargetMasterIn  : in  ahb_mst_in_type;
      pci_in          : in  pci_in_type;       -- PCI pad inputs
      pci_out         : out pci_out_type;      -- PCI pad outputs
      InitSlaveOut  : out ahb_slv_out_type;  	-- Direct PCI master access
      InitSlaveIn   : in  ahb_slv_in_type;
      InitMasterOut : out ahb_mst_out_type;  	-- PCI Master DMA
      InitMasterIn  : in  ahb_mst_in_type    
      );
end component;

-- ESA PCI interface
component pci_esa
  port (
      resetn          : in  std_logic;         -- Amba reset signal
      app_clk         : in  clk_type;          -- Application clock
      pci_in          : in  pci_in_type;       -- PCI pad inputs
      pci_out         : out pci_out_type;      -- PCI pad outputs
      ahbmasterin     : in  ahb_mst_in_type;   -- AHB Master inputs
      ahbmasterout    : out ahb_mst_out_type;  -- AHB Master outputs
      ahbslavein      : in  ahb_slv_in_type;   -- AHB Slave inputs
      ahbslaveout     : out ahb_slv_out_type;  -- AHB Slave outputs
      apbslavein      : in  apb_Slv_In_Type;   -- peripheral bus in
      apbslaveout     : out apb_Slv_Out_Type;  -- peripheral bus out
      irq             : out std_logic          -- interrupt request
   );
end component;

-- Non-functional PCI module for testing
component pci_test
  port (
    rst    : in  rst_type;
    clk    : in  clk_type;
    ahbmi  : in  ahb_mst_in_type;
    ahbmo  : out ahb_mst_out_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type
  );
end component;

-- PCI arbiter

component pci_arb
 port (
    clk     : in  std_logic ;                              -- clock
    rst_n   : in  std_logic;                           -- async reset active low
    req_n   : in  std_logic_vector(0 to NB_AGENTS-1);  -- bus request
    frame_n : in  std_logic;
    gnt_n   : out std_logic_vector(0 to NB_AGENTS-1);  -- bus grant
    pclk    : in  clk_type;                            -- APB clock
    prst_n  : in  std_logic;                           -- APB reset
    pbi     : in  APB_Slv_In_Type;                     -- APB inputs
    pbo     : out APB_Slv_Out_Type     
  );
end component;


-- APB/AHB bridge

component apbmst 
  port (
    rst     : in  std_logic;
    clk     : in  clk_type;
    ahbi    : in  ahb_slv_in_type;
    ahbo    : out ahb_slv_out_type;
    apbi    : out apb_slv_in_vector(0 to APB_SLV_MAX-1);
    apbo    : in  apb_slv_out_vector(0 to APB_SLV_MAX-1)
  );
end component;

-- AHB arbiter

component ahbarb 
  generic (
    masters : integer := 2;		-- number of masters
    defmast : integer := 1 		-- default master
  );
  port (
    rst     : in  std_logic;
    clk     : in  clk_type;
    msti    : out ahb_mst_in_vector(0 to masters-1);
    msto    : in  ahb_mst_out_vector(0 to masters-1);
    slvi    : out ahb_slv_in_vector(0 to AHB_SLV_MAX-1);
    slvo    : in  ahb_slv_out_vector(0 to AHB_SLV_MAX-1)
  );
end component;

-- PROM/SRAM controller

component mctrl
  port (
    rst    : in  rst_type;
    clk    : in  clk_type;
    memi   : in  memory_in_type;
    memo   : out memory_out_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    pioo   : in  pio_out_type;
    wpo    : in  wprot_out_type;
    mctrlo : out mctrl_out_type
  );
end component; 

-- AHB test module

component ahbtest
   port (
      rst  : in  std_logic;
      clk  : in  clk_type;
      ahbi : in  ahb_slv_in_type;
      ahbo : out ahb_slv_out_type
      );
end component;      

-- AHB write-protection module

component wprot
  port (
    rst    : in  rst_type;
    clk    : in  clk_type;
    wpo    : out wprot_out_type;
    ahbsi  : in  ahb_slv_in_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type
  );
end component;

-- AHB status register

component ahbstat
  port (
    rst    : in  rst_type;
    clk    : in  clk_type;
    ahbmi  : in  ahb_mst_in_type;
    ahbsi  : in  ahb_slv_in_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbsto : out ahbstat_out_type

  );
end component;

-- LEON configuration register

component lconf
  port (
    rst    : in  rst_type;
    apbo   : out apb_slv_out_type
  );
end component; 

-- interrupt controller

component irqctrl
  port (
    rst    : in  std_logic;
    clk    : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    irqi   : in  irq_in_type;
    irqo   : out irq_out_type
  );
end component;

-- secondary interrupt controller

component irqctrl2
  port (
    rst    : in  std_logic;
    clk    : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    irqi   : in  irq2_in_type;
    irqo   : out irq2_out_type
  );
end component;

-- timers module

component timers 
  port (
    rst    : in  std_logic;
    clk    : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    timo   : out timers_out_type
  );
end component;

-- UART

component uart
  port (
    rst    : in  std_logic;
    clk    : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    uarti  : in  uart_in_type;
    uarto  : out uart_out_type
  );
end component; 

-- I/O port

component ioport
  port (
    rst    : in  rst_type;
    clk    : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    uart1o : in  uart_out_type;
    uart2o : in  uart_out_type;
    mctrlo : in  mctrl_out_type;
    ioi    : in  io_in_type;
    pioo   : out pio_out_type
  );
end component;

------------------------------------
-- ddm				     -- LA

component ddm
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

-- mdct				     -- LA

component mdct
  port (
    rst   : in  std_logic;
    clk   : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    irq   : out std_logic
    );
end component;
---------------------------------------
end;


