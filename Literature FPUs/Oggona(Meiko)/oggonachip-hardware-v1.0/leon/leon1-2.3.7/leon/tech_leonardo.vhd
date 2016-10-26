
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
-- Package: 	tech_leonardo
-- File:	tech_leonardo.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	Library of ram generators for inference by Leonardo
--
------------------------------------------------------------------------------

LIBRARY ieee;
use IEEE.std_logic_1164.all;

package tech_leonardo is

-- sync ram

component leonardo_syncram
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

component leonardo_regfile_ss 	-- sync read, sync write
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

component leonardo_regfile_as 	-- async read, sync write
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

end tech_leonardo;

-- async dpram for leonardo

LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity leonardo_dpram_as is
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

architecture behav of leonardo_dpram_as is
  subtype dword is std_logic_vector(dbits -1 downto 0);
  type dregtype is array (0 to words - 1) of DWord;
  signal rfd : dregtype;
begin

  rp : process(clk, rdaddress, rfd)
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
    end if;
-- pragma translate_off
    if not ( is_x(rdaddress) or 
	    (conv_integer(unsigned(rdaddress)) >= words))
    then
-- pragma translate_on
      q <= rfd(conv_integer(unsigned(rdaddress)));
-- pragma translate_off
    else
      q <= (others => 'X');
    end if;
-- pragma translate_on
  end process;
end;

-- sync dpram for leonardo
LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity leonardo_dpram_ss is
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

architecture behav of leonardo_dpram_ss is
  subtype dword is std_logic_vector(dbits -1 downto 0);
  type dregtype is array (0 to words - 1) of DWord;
  signal rfd : dregtype;
begin

  rp : process(clk, rdaddress, rfd)
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
      if not ( is_x(rdaddress) or 
	    (conv_integer(unsigned(rdaddress)) >= words) or 
            ((wren = '1') and (wraddress = rdaddress)))
      then
-- pragma translate_on
        q <= rfd(conv_integer(unsigned(rdaddress)));
-- pragma translate_off
      else
        q <= (others => 'X');
      end if;
-- pragma translate_on
    end if;
  end process;
end;

-- synchronous ram for leonardo

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_arith.all;

entity leonardo_syncram is
  generic (
    abits : integer := 10;
    dbits : integer := 8 
  );
  port (
    address  : in std_logic_vector((abits -1) downto 0);
    clk      : in std_logic;
    datain   : in std_logic_vector((dbits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    enable   : in std_logic;
    write    : in std_logic
  ); 
end;     

architecture behavioral of leonardo_syncram is

  subtype word is std_logic_vector((dbits -1) downto 0);
  type mem is array(0 to (2**abits -1)) of word;
  signal memarr : mem;
  signal ra  : std_logic_vector((abits -1) downto 0);

begin

  main : process(clk, memarr, ra)
  begin
    if rising_edge(clk) then
      ra <= address;
      if write = '1' then
-- pragma translate_off
	if not is_x(address) then
-- pragma translate_on
          memarr(conv_integer(unsigned(address))) <= datain;
-- pragma translate_off
	end if;
-- pragma translate_on
      end if;
    end if;
-- pragma translate_off
    if not is_x(ra) then
-- pragma translate_on
      dataout <= memarr(conv_integer(unsigned(ra)));
-- pragma translate_off
    end if;
-- pragma translate_on
  end process;
end;

--------------------------------------------------------------------
-- regfile generators
--------------------------------------------------------------------

LIBRARY ieee;
use IEEE.std_logic_1164.all;
entity leonardo_regfile_ss is
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

architecture rtl of leonardo_regfile_ss is
  component leonardo_dpram_ss
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

  u0 : leonardo_dpram_ss 
       generic map (abits => abits, dbits => dbits, words => words)
       port map (clk => clk, rdaddress => raddr1, wraddress => waddr,
	         data => datain, wren => write, q => dataout1);

  u1 : leonardo_dpram_ss 
       generic map (abits => abits, dbits => dbits, words => words)
       port map (clk => clk, rdaddress => raddr2, wraddress => waddr,
	         data => datain, wren => write, q => dataout2);

end;

LIBRARY ieee;
use IEEE.std_logic_1164.all;
entity leonardo_regfile_as is
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

architecture rtl of leonardo_regfile_as is
  component leonardo_dpram_as
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

  u0 : leonardo_dpram_as 
       generic map (abits => abits, dbits => dbits, words => words)
       port map (clk => clk, rdaddress => raddr1, wraddress => waddr,
	         data => datain, wren => write, q => dataout1);

  u1 : leonardo_dpram_as 
       generic map (abits => abits, dbits => dbits, words => words)
       port map (clk => clk, rdaddress => raddr2, wraddress => waddr,
	         data => datain, wren => write, q => dataout2);

end;

