
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
-- Entity: 	clkgen
-- File:	clkgen.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	This unit implemets the clock generation for the processor
--		and all peripherals. Four clocks are generated: a common
--		uninterrupted clock (clko.clk), a processor clock (clko.iuclk),
--		a clock to latch a missed instruction (clko.iclk) and a clock
--		to latch missed data (clk0.dclk). Clock generation depends on 
--              the constant GATEDCLK defined in config.vhd. If it is NOT set,
--		all clocks will run uninterrupted and muxes will be used
--		to halt the processor during cache misses.
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.config.all;
use work.iface.all;

entity clkgen is
port (
    clk     : in  std_logic;
    pciclk  : in  std_logic;
    clki    : in  clkgen_in_type;
    clko    : out clkgen_out_type
);
end;

architecture rtl of clkgen is
signal dclkholdn, iclkholdn, iuclkholdn, fpuholdn : std_logic;
signal dclkholdni, iclkholdni, iuclkholdni, fpuholdni : std_logic;


begin


  gtclk1 : if GATEDCLK generate
    reg3 : process (clk)
    begin
      if falling_edge(clk) then
        dclkholdn <= (clki.iholdn and clki.dholdn and clki.fpuholdn) or not clki.dmdsn;
        iclkholdn <= (clki.iholdn and clki.dholdn and clki.fpuholdn) or not clki.imdsn;
        iuclkholdn <= clki.iholdn and clki.dholdn and clki.fpuholdn;
      end if;
    end process;
  end generate;

  clko.dclk   <= clk and dclkholdn when GATEDCLK else clk;
  clko.iclk   <= clk and iclkholdn when GATEDCLK else clk;
  clko.iuclk  <= clk and iuclkholdn when GATEDCLK else clk;
  clko.clkn   <= not (clk and iuclkholdn) when GATEDCLK else not clk;
  clko.pciclk <= pciclk;
  clko.clk    <= clk;

  clko.holdn  <= clki.iholdn and clki.dholdn and clki.fpuholdn;

end;

