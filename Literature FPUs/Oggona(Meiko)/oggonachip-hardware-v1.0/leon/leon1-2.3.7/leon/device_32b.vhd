
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
-- Entity: 	device
-- File:	device.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	package to select current device configuration
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.target.all;

package device is

----------------------------------------------------------------------
-- This is the current device configuration
----------------------------------------------------------------------
--  constant conf : config_type := sim_std;
--  constant conf : config_type := sim_insilicon_pci;
--  constant conf : config_type := sim_ahb_test;
--  constant conf : config_type := synplify_2k2;
--  constant conf : config_type := synplify_2k2k_softprom;
--  constant conf : config_type := synplify_2k2k_virtexprom;
--  constant conf : config_type := leonardo_2k2;
--  constant conf : config_type := leonardo_2k2k_softprom;
-- 	constant conf : config_type := gen_virtex_2k2k;
--  constant conf : config_type := gen_virtex_2k2k_xess16;
--  constant conf : config_type := gen_virtex_2k2k_bprom;
--  constant conf : config_type := gen_virtex_2k2k_bprom_xess16;  
--  constant conf : config_type := gen_virtex_2k2k_vprom;
--  constant conf : config_type := gen_atc35;
--	constant conf : config_type := virtex_2k2k_blockprom;
--	constant conf : config_type := virtex_2k2k_v8_blockprom;
constant conf: config_type := fpga_2k2k;
end;
