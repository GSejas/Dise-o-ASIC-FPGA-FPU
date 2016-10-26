
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
-- Entity: 	regfile
-- File:	regfile.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	IU register file with optional write-bypass.
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.target.all;
use work.config.all;
use work.iface.all;
use work.ramlib.all;


entity regfile is
  port (
    clk  : in  clk_type;			-- Clock
    holdn: in  std_logic;
    rfi  : in  rf_in_type;
    rfo  : out rf_out_type
  );
end;

architecture behav of regfile is

type wbypass_type is record
  wraddr  : std_logic_vector(RABITS-1 downto 0);
  wrdata  : std_logic_vector(RDBITS-1 downto 0);
  wren    : std_logic;
end record;

signal wbpr : wbypass_type;
signal wren, vcc : std_logic;
signal rfout1, rfout2, wrdata : std_logic_vector(RDBITS-1 downto 0);
signal wrdata1,wrdata2 : std_logic_vector(RDBITS-1 downto 0);

begin

  vcc <= '1';

  wrdata(RDBITS-1 downto 0) <= rfi.wrdata(RDBITS-1 downto 0);
  wrdata1(RDBITS-1 downto 0) <= rfi.wrdata(RDBITS-1 downto 0);
  wrdata2(RDBITS-1 downto 0) <= rfi.wrdata(RDBITS-1 downto 0);

  wren <= rfi.wren when GATEDCLK else holdn and rfi.wren;


  srd : if RF_SYNCRD and RF_SYNCWR generate 
    u0 : regfile_ss generic map (RABITS, RDBITS, IREGNUM)
	 port map (clk, wrdata1, rfi.rd1addr, rfi.rd2addr, rfi.wraddr, vcc, 
		   wren, rfout1, rfout2);
  end generate;

  ard : if (not RF_SYNCRD) and RF_SYNCWR generate 
    u0 : regfile_as generic map (RABITS, RDBITS, IREGNUM)
	 port map (clk, wrdata1, rfi.rd1addr, rfi.rd2addr, rfi.wraddr, vcc, 
		   wren, rfout1, rfout2);
  end generate;

-- Optional write-bypass. Bypass written data to read port if write enabled
-- and read and write address are equal.

  wb_reg : if RF_WBYPASS generate
    
    wbp_comb1 : process(rfout1, rfout2, wbpr, rfi)
    begin
      if (wbpr.wren = '1') and (wbpr.wraddr = rfi.rd1addr)   then
 	rfo.data1 <= wbpr.wrdata;
      else rfo.data1 <= rfout1; end if;
      if (wbpr.wren = '1') and (wbpr.wraddr = rfi.rd2addr) then
 	rfo.data2 <= wbpr.wrdata;
      else rfo.data2 <= rfout2; end if;
    end process;

    wbp_reg : process(clk)
    begin
      if rising_edge(clk) then 
	wbpr.wraddr <= rfi.wraddr; 
	wbpr.wrdata <= rfi.wrdata; 
	wbpr.wren <= wren; 
      end if;
    end process;

  end generate;

  no_write_bypass : if not RF_WBYPASS generate
    rfo.data1 <= rfout1; rfo.data2 <= rfout2;
  end generate;

end;

