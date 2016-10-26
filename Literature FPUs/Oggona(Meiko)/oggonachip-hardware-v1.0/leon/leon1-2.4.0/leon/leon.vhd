
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
-- Entity: 	leon
-- File:	leon.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	Complete processor
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.target.all;
use work.config.all;
use work.iface.all;
use work.tech_map.all;
-- pragma translate_off
use work.debug.all;
-- pragma translate_on

entity leon is
  port (
    resetn   : in    std_logic; 			-- system signals
    clk      : in    std_logic;

    errorn   : out   std_logic;
    address  : out   std_logic_vector(27 downto 0); 	-- memory bus

    data     : inout std_logic_vector(31 downto 0);

    ramsn    : out   std_logic_vector(3 downto 0);
    ramoen   : out   std_logic_vector(3 downto 0);
    rwen     : inout std_logic_vector(3 downto 0);
    romsn    : out   std_logic_vector(1 downto 0);
    iosn     : out   std_logic;
    oen      : out   std_logic;
    read     : out   std_logic;
    writen   : inout std_logic;

    brdyn    : in    std_logic;
    bexcn    : in    std_logic;

    pio      : inout std_logic_vector(15 downto 0); 	-- I/O port

    wdogn    : out   std_logic;				-- watchdog output

    test     : in    std_logic
  );
end; 

architecture rtl of leon is

component mcore
  port (
    resetn   : in  std_logic;
    clk      : in  std_logic;
    memi     : in  memory_in_type;
    memo     : out memory_out_type;
    ioi      : in  io_in_type;
    ioo      : out io_out_type;
    pcii     : in  pci_in_type;
    pcio     : out pci_out_type;

    test     : in    std_logic
);
end component; 

signal gnd, clko, resetno : std_logic;
signal memi     : memory_in_type;
signal memo     : memory_out_type;
signal ioi      : io_in_type;
signal ioo      : io_out_type;
signal pcii     : pci_in_type;
signal pcio     : pci_out_type;

begin

  gnd <= '0';

-- main processor core

  mcore0  : mcore  
  port map ( 
    resetn => resetno, clk => clko, 
    memi => memi, memo => memo, ioi => ioi, ioo => ioo,
    pcii => pcii, pcio => pcio, test => test

  );

-- pads

--  clk_pad   : inpad port map (clk, clko);	-- clock
  clko <= clk;					-- avoid buffering during synthesis
  reset_pad   : smpad port map (resetn, resetno);	-- reset
  brdyn_pad   : inpad port map (brdyn, memi.brdyn);	-- bus ready
  bexcn_pad   : inpad port map (bexcn, memi.bexcn);	-- bus exception


    error_pad   : odpad generic map (2) port map (ioo.errorn, errorn);	-- cpu error mode

    d_pads: for i in 0 to 31 generate			-- data bus
      d_pad : iopad generic map (3) port map (memo.data(i), memo.bdrive((31-i)/8), memi.data(i), data(i));
    end generate;


    pio_pads : for i in 0 to 15 generate		-- parallel I/O port
      pio_pad : smiopad generic map (2) port map (ioo.piol(i), ioo.piodir(i), ioi.piol(i), pio(i));
    end generate;

    rwen_pads : for i in 0 to 3 generate			-- ram write strobe
      rwen_pad : iopad generic map (2) port map (memo.wrn(i), gnd, memi.wrn(i), rwen(i));
    end generate;

     							-- I/O write strobe
    writen_pad : iopad generic map (2) port map (memo.writen, gnd, memi.writen, writen);

    a_pads: for i in 0 to 27 generate			-- memory address
      a_pad : outpad generic map (3) port map (memo.address(i), address(i));
    end generate;

    ramsn_pads : for i in 0 to 3 generate		-- ram oen/rasn
      ramsn_pad : outpad generic map (2) port map (memo.ramsn(i), ramsn(i));
    end generate;

    ramoen_pads : for i in 0 to 3 generate		-- ram chip select
      eamoen_pad : outpad generic map (2) port map (memo.ramoen(i), ramoen(i));
    end generate;

    romsn_pads : for i in 0 to 1 generate			-- rom chip select
      romsn_pad : outpad generic map (2) port map (memo.romsn(i), romsn(i));
    end generate;

    read_pad : outpad generic map (2) port map (memo.read, read);	-- memory read
    oen_pad  : outpad generic map (2) port map (memo.oen, oen);	-- memory oen
    iosn_pad : outpad generic map (2) port map (memo.iosn, iosn);	-- I/O select

    wd : if WDOGEN generate
      wdogn_pad : odpad generic map (2) port map (ioo.wdog, wdogn);	-- watchdog output
    end generate;




end ;

