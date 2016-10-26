
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
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	package to select current device configuration
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.target.all;

package device is

----------------------------------------------------------------------
-- This is the current device configuration
----------------------------------------------------------------------
  constant conf : config_type := fpga_2k2k;
--  constant conf : config_type := fpga_2k2k_v8;
--  constant conf : config_type := fpga_2k2k_irq2;
--  constant conf : config_type := fpga_2k2k_softprom;
--  constant conf : config_type := fpga_2k2k_v8_softprom;
--  constant conf : config_type := fpga_4k4k_v8_fpu;
--  constant conf : config_type := fpga_4k4k_v8_fpu_softprom;
--  constant conf : config_type := fpga_2k2k_v8_mac_softprom;
--  constant conf : config_type := virtex_2k2k_blockprom;
--  constant conf : config_type := virtex_2k1k_rdbmon;
--  constant conf : config_type := virtex_2k2k_v8_blockprom;
--  constant conf : config_type := gen_atc25;
--  constant conf : config_type := gen_atc25_meiko;
--  constant conf : config_type := gen_atc25_fpc;
--  constant conf : config_type := gen_atc25_insilicon_pci;
--  constant conf : config_type := gen_atc35;
--  constant conf : config_type := systel_fpga;
--  constant conf : config_type := systel_asic;
--  constant conf : config_type := gen_fs90;
--  constant conf : config_type := gen_umc18;


end;
