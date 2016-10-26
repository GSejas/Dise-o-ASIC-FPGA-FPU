
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
-- Entity:      apbmst
-- File:        apbmst.vhd
-- Author:      Jiri Gaisler - ESA/ESTEC
-- Description: AMBA AHB/APB bridge
------------------------------------------------------------------------------ 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.target.all;
use work.config.all;
use work.iface.all;
use work.amba.all;


entity apbmst is
  port (
    rst     : in  std_logic;
    clk     : in  clk_type;
    ahbi    : in  ahb_slv_in_type;
    ahbo    : out ahb_slv_out_type;
    apbi    : out apb_slv_in_vector(0 to APB_SLV_MAX-1);
    apbo    : in  apb_slv_out_vector(0 to APB_SLV_MAX-1)
  );
end;

architecture rtl of apbmst is

-- registers
type reg_type is record
  haddr   : std_logic_vector(APB_SLV_ADDR_BITS -1 downto 2);   -- address bus
  hsel    : std_logic;
  hwrite  : std_logic;  		     -- read/write
  hready  : std_logic;  		     -- ready
  hready2 : std_logic;  		     -- ready
  penable : std_logic;
end record;

signal r, rin : reg_type;

constant apbmax : integer := APB_SLV_ADDR_BITS -1;
begin
  comb : process(ahbi, apbo, r, rst)
  variable v : reg_type;
  variable psel   : std_logic_vector(0 to APB_SLV_MAX-1);   
  variable prdata : std_logic_vector(31 downto 0);
  variable pwdata : std_logic_vector(31 downto 0);
  variable apbaddr : std_logic_vector(apbmax downto 2);
  variable apbaddr2 : std_logic_vector(31 downto 0);
  begin

    v := r; v.hready2 := '1';

    -- detect start of cycle
    if (ahbi.hready = '1') then
      if ((ahbi.htrans = HTRANS_NONSEQ) or (ahbi.htrans = HTRANS_SEQ)) and
	  (ahbi.hsel = '1')
      then
        v.hready := '0'; v.hwrite := ahbi.hwrite; v.hsel := '1';
	v.hwrite := ahbi.hwrite; v.hready2 := not ahbi.hwrite;
	v.haddr(apbmax downto 2)  := ahbi.haddr(apbmax downto 2); 
      else v.hsel := '0'; end if;
    end if;

    -- generate hready and penable
    if (r.hsel and r.hready2 and (not r.hready)) = '1' then 
      v.penable := '1'; v.hready := '1';
    else v.penable := '0'; end if;

    -- generate psel and select APB read data
    psel := (others => '0'); prdata := (others => '-');
    apbaddr := r.haddr(apbmax downto 2);
    for i in APB_TABLE'range loop	--'
      if  APB_TABLE(i).enable and
	 (apbaddr >= APB_TABLE(i).firstaddr(apbmax downto 2)) and
         (apbaddr <= APB_TABLE(i).lastaddr(apbmax downto 2)) 
      then 
	prdata := apbo(APB_TABLE(i).index).prdata; 
	psel(APB_TABLE(i).index) := '1';
      end if;
    end loop;

    -- AHB respons
    ahbo.hresp  <= HRESP_OKAY;
    ahbo.hready <= r.hready;
    ahbo.hrdata <= prdata;
    ahbo.hsplit <= (others => '0');

    if rst = '0' then
      v.penable := '0'; v.hready := '1'; v.hsel := '0';
-- pragma translate_off
      v.haddr := (others => '0');
-- pragma translate_on
    end if;

    rin <= v;

    -- tie write data to zero if not used to save power (not testable)
    if r.hsel = '1' then pwdata := ahbi.hwdata; 
    else pwdata := (others => '0'); end if;

    -- drive APB bus
    apbaddr2 := (others => '0');
    apbaddr2(apbmax downto 2)    := r.haddr(apbmax downto 2);
    for i in 0 to APB_SLV_MAX-1 loop
      apbi(i).paddr   <= apbaddr2;
      apbi(i).pwdata  <= pwdata;
      apbi(i).pwrite  <= r.hwrite;
      apbi(i).penable <= r.penable;
      apbi(i).psel    <= psel(i) and r.hsel and r.hready2;
    end loop;

  end process;


  reg : process(clk)
  begin if rising_edge(clk) then r <= rin; end if; end process;


end;

