
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
-- Entity: 	tech_synplify
-- File:	tech_synplify.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	Contains pads and ram generators for inference by Synplify
------------------------------------------------------------------------------

LIBRARY ieee;
use IEEE.std_logic_1164.all;

package tech_synplify is

-- sync ram

component synplify_syncram
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    address  : in std_logic_vector((abits -1) downto 0);
    clk      : in std_logic;
    datain   : in std_logic_vector((dbits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    enable   : in std_logic;
    write    : in std_logic
   ); 
end component;

-- regfile generators

component synplify_regfile_ss 	-- sync read, sync write
  generic ( 
    abits : integer := 8; dbits : integer := 32; words : integer := 128
  );
  port (
    clk      : in std_logic;
    datain   : in std_logic_vector (dbits -1 downto 0);
    raddr1   : in std_logic_vector (abits -1 downto 0);
    raddr2   : in std_logic_vector (abits -1 downto 0);
    waddr    : in std_logic_vector (abits -1 downto 0);
    enable   : in std_logic;
    write    : in std_logic;
    dataout1 : out std_logic_vector (dbits -1 downto 0);
    dataout2 : out std_logic_vector (dbits -1 downto 0));
  end component;

component synplify_regfile_as 	-- async read, sync write
  generic ( 
    abits : integer := 8; dbits : integer := 32; words : integer := 128
  );
  port (
    clk      : in std_logic;
    datain   : in std_logic_vector (dbits -1 downto 0);
    raddr1   : in std_logic_vector (abits -1 downto 0);
    raddr2   : in std_logic_vector (abits -1 downto 0);
    waddr    : in std_logic_vector (abits -1 downto 0);
    enable   : in std_logic;
    write    : in std_logic;
    dataout1 : out std_logic_vector (dbits -1 downto 0);
    dataout2 : out std_logic_vector (dbits -1 downto 0));
  end component;

-- boot-prom

component synplify_bprom
  port (
    clk : in std_logic;
    csn : in std_logic;
    addr : in std_logic_vector (29 downto 0);
    data : out std_logic_vector (31 downto 0));
end component;

end;

library IEEE;
use IEEE.std_logic_1164.all;

-- synchronous ram for direct interference in synplify

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_arith.all;

entity synplify_syncram is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    address  : in std_logic_vector((abits -1) downto 0);
    clk      : in std_logic;
    datain   : in std_logic_vector((dbits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    enable   : in std_logic;
    write    : in std_logic
  ); 
end;     

architecture behavioral of synplify_syncram is

  type mem is array(0 to (2**abits -1)) 
	of std_logic_vector((dbits -1) downto 0);
  signal memarr : mem;
  signal ra  : std_logic_vector((abits -1) downto 0);
  attribute syn_ramstyle : string;
  attribute syn_ramstyle of memarr: signal is "block_ram";
-- pragma translate_off
  signal rw : std_logic;
-- pragma translate_on

begin

  main : process(clk, memarr, ra)
  begin
    if rising_edge(clk) then
      if write = '1' then
-- pragma translate_off
        if not is_x(address) then
-- pragma translate_on
          memarr(conv_integer(unsigned(address))) <= datain;
-- pragma translate_off
        end if;
-- pragma translate_on
      end if;
      ra <= address;
-- pragma translate_off
      rw <= write;
-- pragma translate_on
    end if;
  end process;

-- pragma translate_off
  readport : process(memarr, ra, rw)
  begin
    if not (is_x(ra) or (rw = '1')) then
-- pragma translate_on
      dataout <= memarr(conv_integer(unsigned(ra)));
-- pragma translate_off
    else
      dataout <= (others => 'X');
    end if;
  end process;
-- pragma translate_on
end;


-- synchronous dpram for direct instantiation in synplify

LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity synplify_dpram_ss is
  generic (
    abits : integer := 8;
    dbits : integer := 32;
    words : integer := 256
  );
  port (
    clk : in std_logic;
    rdaddress: in std_logic_vector (abits -1 downto 0);
    wraddress: in std_logic_vector (abits -1 downto 0);
    data: in std_logic_vector (dbits -1 downto 0);
    wren : in std_logic;
    q: out std_logic_vector (dbits -1 downto 0)
  );
end;

architecture behav of synplify_dpram_ss is
  type dregtype is array (0 to words - 1) 
	of std_logic_vector(dbits -1 downto 0);
  signal rfd : dregtype;
  signal wa, ra : std_logic_vector (abits -1 downto 0);
  attribute syn_ramstyle : string;
  attribute syn_ramstyle of rfd: signal is "block_ram";
-- pragma translate_off
  signal drivex : boolean;
-- pragma translate_on
begin

  rp : process(clk)
  begin
    if rising_edge(clk) then
      if wren = '1' then
-- pragma translate_off
	if not ( is_x(wraddress) or 
	    (conv_integer(unsigned(wraddress)) >= words))
	then
-- pragma translate_on
   	  rfd(conv_integer(unsigned(wraddress))) <= data; 
-- pragma translate_off
        end if;
-- pragma translate_on
      end if;
-- pragma translate_off
      drivex <= (wren = '1') and (wraddress = rdaddress);
-- pragma translate_on
      ra <= rdaddress;
    end if;
  end process;

-- pragma translate_off
  readport : process(rfd, ra, drivex)
  begin
    if not (is_x(ra) or (conv_integer(unsigned(ra)) >= words) or drivex) 
    then
-- pragma translate_on
      q <= rfd(conv_integer(unsigned(ra)));
-- pragma translate_off
    else
      q <= (others => 'X');
    end if;
  end process;
-- pragma translate_on
end;

-- async dpram for direct instantiation in synplify

LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity synplify_dpram_as is
  generic (
    abits : integer := 8;
    dbits : integer := 32;
    words : integer := 256
  );
  port (
    clk : in std_logic;
    rdaddress: in std_logic_vector (abits -1 downto 0);
    wraddress: in std_logic_vector (abits -1 downto 0);
    data: in std_logic_vector (dbits -1 downto 0);
    wren : in std_logic;
    q: out std_logic_vector (dbits -1 downto 0)
  );
end;

architecture behav of synplify_dpram_as is
  type dregtype is array (0 to words - 1) 
       of std_logic_vector(dbits -1 downto 0);
  signal rfd : dregtype;
  signal wa : std_logic_vector (abits -1 downto 0);
  attribute syn_ramstyle : string;
  attribute syn_ramstyle of rfd: signal is "block_ram";
begin

  rp : process(clk)
  begin
    if rising_edge(clk) then
      if wren = '1' then
-- pragma translate_off
	if not ( is_x(wraddress) or 
	    (conv_integer(unsigned(wraddress)) >= words))
	then
-- pragma translate_on
   	  rfd(conv_integer(unsigned(wraddress))) <= data; 
-- pragma translate_off
        end if;
-- pragma translate_on
      end if;
--     wa <= wraddress;
    end if;
  end process;
-- pragma translate_off

  comb : process(rdaddress, rfd)
  begin
    if not (is_x(rdaddress) or (conv_integer(unsigned(rdaddress)) >= words))
    then
-- pragma translate_on
      q <= rfd(conv_integer(unsigned(rdaddress)));
-- pragma translate_off
    else
      q <= (others => 'X');
    end if;
  end process;
-- pragma translate_on

end;

--------------------------------------------------------------------
-- regfile generators
--------------------------------------------------------------------

LIBRARY ieee;
use IEEE.std_logic_1164.all;
entity synplify_regfile_ss is
  generic ( 
    abits : integer := 8; dbits : integer := 32; words : integer := 128
  );
  port (
    clk      : in std_logic;
    datain   : in std_logic_vector (dbits -1 downto 0);
    raddr1   : in std_logic_vector (abits -1 downto 0);
    raddr2   : in std_logic_vector (abits -1 downto 0);
    waddr    : in std_logic_vector (abits -1 downto 0);
    enable   : in std_logic;
    write    : in std_logic;
    dataout1 : out std_logic_vector (dbits -1 downto 0);
    dataout2 : out std_logic_vector (dbits -1 downto 0));
end;

architecture rtl of synplify_regfile_ss is
  component synplify_dpram_ss
  generic (
    abits : integer := 8;
    dbits : integer := 32;
    words : integer := 256
  );
  port (
    clk : in std_logic;
    rdaddress: in std_logic_vector (abits -1 downto 0);
    wraddress: in std_logic_vector (abits -1 downto 0);
    data: in std_logic_vector (dbits -1 downto 0);
    wren : in std_logic;
    q: out std_logic_vector (dbits -1 downto 0)
  );
  end component;

begin

  u0 : synplify_dpram_ss 
       generic map (abits => abits, dbits => dbits, words => words)
       port map (clk => clk, rdaddress => raddr1, wraddress => waddr,
	         data => datain, wren => write, q => dataout1);

  u1 : synplify_dpram_ss 
       generic map (abits => abits, dbits => dbits, words => words)
       port map (clk => clk, rdaddress => raddr2, wraddress => waddr,
	         data => datain, wren => write, q => dataout2);

end;

LIBRARY ieee;
use IEEE.std_logic_1164.all;
entity synplify_regfile_as is
  generic ( 
    abits : integer := 8; dbits : integer := 32; words : integer := 128
  );
  port (
    clk      : in std_logic;
    datain   : in std_logic_vector (dbits -1 downto 0);
    raddr1   : in std_logic_vector (abits -1 downto 0);
    raddr2   : in std_logic_vector (abits -1 downto 0);
    waddr    : in std_logic_vector (abits -1 downto 0);
    enable   : in std_logic;
    write    : in std_logic;
    dataout1 : out std_logic_vector (dbits -1 downto 0);
    dataout2 : out std_logic_vector (dbits -1 downto 0));
end;

architecture rtl of synplify_regfile_as is
  component synplify_dpram_as
  generic (
    abits : integer := 8;
    dbits : integer := 32;
    words : integer := 256
  );
  port (
    clk : in std_logic;
    rdaddress: in std_logic_vector (abits -1 downto 0);
    wraddress: in std_logic_vector (abits -1 downto 0);
    data: in std_logic_vector (dbits -1 downto 0);
    wren : in std_logic;
    q: out std_logic_vector (dbits -1 downto 0)
  );
  end component;

begin

  u0 : synplify_dpram_as 
       generic map (abits => abits, dbits => dbits, words => words)
       port map (clk => clk, rdaddress => raddr1, wraddress => waddr,
	         data => datain, wren => write, q => dataout1);

  u1 : synplify_dpram_as 
       generic map (abits => abits, dbits => dbits, words => words)
       port map (clk => clk, rdaddress => raddr2, wraddress => waddr,
	         data => datain, wren => write, q => dataout2);

end;
