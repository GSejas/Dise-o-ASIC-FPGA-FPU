
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
-- Entity: 	config
-- File:	config.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	LEON configuration package. Do NOT edit, all constants are
--		set from the target/device packages.
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.target.all;
use work.device.all;
--pragma translate_off
use std.textio.all;
--pragma translate_on

package config is
----------------------------------------------------------------------------
-- IU, FPU and CP implementation and version numbers
----------------------------------------------------------------------------

constant IMPL   : unsigned(3 downto 0) := conv_unsigned(conf.iu.impl,4);
constant VER    : unsigned(3 downto 0) := conv_unsigned(conf.iu.version,4);
constant FPUVER	: unsigned(2 downto 0) := conv_unsigned(conf.fpu.version,3);
constant CPVER	: unsigned(2 downto 0) := conv_unsigned(conf.cp.version,3);
--pragma translate_off
constant LEON_VERSION : string := "2.4.0";
--pragma translate_on

----------------------------------------------------------------------------
-- debugging
----------------------------------------------------------------------------

constant DEBUGPORT : boolean := conf.debug.enable; -- enable iu debug port
constant DEBUGUART : boolean := conf.debug.uart;   -- enable UART output to console
constant DEBUGIURF : boolean := conf.debug.iureg;  -- write IU results to console
constant DEBUGFPU  : boolean := conf.debug.fpureg; -- write FPU results to console

constant NOHALT    : boolean := conf.debug.nohalt; -- dont halt on error

type log2arr is array(1 to 33) of integer;
constant log2  : log2arr := (0,1,2,2,3,3,3,3,4,4,4,4,4,4,4,4,
				5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6);
constant log2x : log2arr := (1,1,2,2,3,3,3,3,4,4,4,4,4,4,4,4,
				5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6);

constant PCLOW 	   : integer := conf.debug.pclow;
constant GATEDCLK  : boolean := conf.synthesis.gatedclk;
constant RFIMPTYPE : integer := conf.synthesis.rftype;

constant TARGET_TECH: targettechs := conf.synthesis.targettech;
constant INFER_RAM  : boolean  := conf.synthesis.infer_ram;
constant INFER_REGF : boolean  := conf.synthesis.infer_regf;
constant INFER_ROM  : boolean  := conf.synthesis.infer_rom;
constant INFER_PADS : boolean  := conf.synthesis.infer_pads;
constant INFER_MULT : boolean  := conf.synthesis.infer_mult;
constant NWINDOWS   : integer range 2 to 32 := conf.iu.nwindows;
constant NWINLOG2   : integer range 1 to 5 := log2(NWINDOWS);
constant RABITS     : integer := log2(NWINDOWS+1) + 4; -- # regfile address bits

constant RDBITS   : integer := 32;	-- data width

constant MULTIPLIER : multypes := conf.iu.multiplier;
constant DIVIDER    : divtypes := conf.iu.divider;
constant MACEN      : boolean  := conf.iu.mac and (MULTIPLIER = m16x16);

constant FPEN  : boolean := (conf.fpu.fpu /= none);
constant FPTYPE  : fputype := conf.fpu.fpu;
constant FPREG : integer := conf.fpu.fregs;
constant CPEN  : boolean := conf.cp.cp /= none;
constant CWPOPT : boolean := (NWINDOWS = (2**NWINLOG2));
constant IREGNUM : integer := NWINDOWS * 16 + FPREG + 8;-- number of registers in regfile

constant ILINE_SIZE   : integer range 2 to 8 := conf.cache.ilinesize;
constant ILINE_BITS   : integer := log2(ILINE_SIZE);
constant IOFFSET_BITS : integer := 8 +log2(conf.cache.icachesize) - ILINE_BITS;
constant ITAG_HIGH    : integer := 31;
constant ITAG_BITS    : integer := ITAG_HIGH - IOFFSET_BITS - ILINE_BITS - 2 +
				   ILINE_SIZE + 1;

constant DLINE_SIZE   : integer range 2 to 8 := conf.cache.dlinesize;
constant DLINE_BITS   : integer := log2(conf.cache.dlinesize);
constant DOFFSET_BITS : integer := 8 +log2(conf.cache.dcachesize) - DLINE_BITS;
constant DTAG_HIGH    : integer := 31;
constant DTAG_BITS    : integer := DTAG_HIGH - DOFFSET_BITS - DLINE_BITS - 2 +
				   DLINE_SIZE + 1;

constant BUS8EN    : boolean  := conf.mctrl.bus8en;
constant BUS16EN   : boolean  := conf.mctrl.bus16en;
constant RAWADDR   : boolean  := conf.mctrl.rawaddr;
constant BOOTOPT   : boottype := conf.boot.boot;
constant ITPRESC   : integer  := conf.boot.sysclk/1000000 -1;
constant TPRESC    : unsigned(15 downto 0) := conv_unsigned(ITPRESC, 16);
constant IUPRESC   : integer  := ((conf.boot.sysclk*10)/(conf.boot.baud*8)-5)/10;
constant UPRESC    : unsigned(15 downto 0) := conv_unsigned(IUPRESC, 16);
constant BRAMRWS   : unsigned(3 downto 0) := conv_unsigned(conf.boot.ramrws, 4);
constant BRAMWWS   : unsigned(3 downto 0) := conv_unsigned(conf.boot.ramwws, 4);
constant EXTBAUD   : boolean := conf.boot.extbaud;
constant PABITS    : integer  := conf.boot.pabits;

constant PCIEN       : boolean := (conf.pci.pcicore /= none);
constant PCICORE     : pcitype := conf.pci.pcicore;
constant PCIPMEEN    : boolean := conf.pci.pmepads;
constant PCI66PADEN  : boolean := conf.pci.p66pad;

constant WPROTEN     : boolean := conf.peri.wprot;
constant AHBSTATEN   : boolean := conf.peri.ahbstat;
constant CFGREG      : boolean := conf.peri.cfgreg;
constant WDOGEN      : boolean := conf.peri.wdog;
constant IRQ2EN      : boolean := conf.peri.irq2cfg.enable;
constant IRQ2CHAN    : integer range 1 to 32 := conf.peri.irq2cfg.channels;
constant IRQ2TBL     : irq_filter_vec := conf.peri.irq2cfg.filter;

constant FASTJUMP    : boolean := conf.iu.fastjump;
constant ICC_HOLD    : boolean := conf.iu.icchold;
constant LDDELAY     : integer range 1 to 2 := conf.iu.lddelay;
constant FASTDECODE  : boolean := conf.iu.fastdecode;
constant WATCHPOINTS : integer range 0 to 4 := conf.iu.watchpoints;

constant AHB_MASTERS : integer := conf.ahb.masters;
constant APB_TABLE   : apb_slv_config_vector(0 to APB_SLV_MAX-1) := conf.apb.table;
constant AHB_SLVTABLE: ahb_slv_config_vector(0 to AHB_SLV_MAX-1) := conf.ahb.slvtable;
constant AHB_SPLIT   : boolean := conf.ahb.split;
constant AHB_DEFMST  : integer := conf.ahb.defmst;
constant AHB_CACHETABLE   : ahb_cache_config_vector(0 to AHB_CACHE_MAX-1) := 
  conf.ahb.cachetable(0 to AHB_CACHE_MAX-1);

constant PCIARBEN    : boolean := conf.pci.arbiter;
constant NB_AGENTS   : natural range 3 to 32 := conf.pci.pcimasters;
constant ARB_LEVELS  : positive range 1 to 4 := conf.pci.prilevels;
constant APB_PRIOS   : boolean := not conf.pci.fixpri;
constant ARB_SIZE    : natural range 2 to 5 := log2(NB_AGENTS);  


end;
