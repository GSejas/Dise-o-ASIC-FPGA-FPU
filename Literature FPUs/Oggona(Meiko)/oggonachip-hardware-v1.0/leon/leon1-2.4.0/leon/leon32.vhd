
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
use work.config.all;
use work.iface.all;
use work.padlib.all;
-- pragma translate_off
use work.debug.all;
-- pragma translate_on

entity leon is
  port (
    resetn   : in    std_logic; 			-- system signals
    clk      : in    std_logic;

    errorn   : out   std_logic;
    address  : out   std_logic_vector(27 downto 0); 	-- memory bus

    datain   : in    std_logic_vector(31 downto 0);
    dataout  : out   std_logic_vector(31 downto 0);
    datasel  : out   std_logic_vector(3 downto 0);
    
    ramsn    : out   std_logic_vector(3 downto 0);
    ramoen   : out   std_logic_vector(3 downto 0);
    rwen     : out   std_logic_vector(3 downto 0);
    romsn    : out   std_logic_vector(1 downto 0);
    iosn     : out   std_logic;
    oen      : out   std_logic;
    read     : out   std_logic;
    writen   : out   std_logic;

    brdyn    : in    std_logic;
    bexcn    : in    std_logic;

    pioo     : out std_logic_vector(15 downto 0); 	-- I/O port
    pioi     : in  std_logic_vector(15 downto 0);
    piod     : out std_logic_vector(15 downto 0);

    buttons  : in std_logic_vector(3 downto 0);  -- ddm ports
    
    audioin  : in std_logic;

    digit0    : out std_logic_vector(6 downto 0);
    digit1    : out std_logic_vector(6 downto 0);
    audioout  : out std_logic;
    lr_out    : out std_logic;
    shift_clk  : out std_logic;
    mclk     : out   std_logic;
    dispen   : out   std_logic;

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

    ddmi     : in  ddm_in_type;
    ddmo     : out ddm_out_type; 

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
signal ddmi     : ddm_in_type;
signal ddmo     : ddm_out_type;


begin

  gnd <= '0';

-- main processor core

  mcore0  : mcore  
  port map ( 
    resetn => resetno, clk => clko, 
    memi => memi, memo => memo, ioi => ioi, ioo => ioo,
    pcii => pcii, pcio => pcio, ddmi => ddmi, ddmo => ddmo, test => test

  );

-- pads

--  inpad0   : inpad port map (clk, clko);	-- clock
  clko <= clk;					-- avoid buffering during synthesis
  smpad0   : smpad port map (resetn, resetno);	-- reset

  inpad2   : inpad port map (brdyn, memi.brdyn);	-- bus ready
  inpad3   : inpad port map (bexcn, memi.bexcn);	-- bus exception

  inpad4   : inpad port map (audioin, ddmi.audioin);
  inpad5   : inpad port map (buttons(0),ddmi.button0);
  inpad6   : inpad port map (buttons(1),ddmi.button1);
  inpad7   : inpad port map (buttons(2),ddmi.button2);
  inpad8   : inpad port map (buttons(3),ddmi.button3);  

  

    outpad0   : odpad port map (ioo.errorn, errorn);	-- cpu error mode

--     iopadb0: for i in 24 to 31 generate			-- data bus
--       iopadb01: iopad3 port map (memo.data(i), memo.bdrive(0), memi.data(i), data(i));
--     end generate;

--     iopadb1: for i in 16 to 23 generate
--       iopadb11: iopad3 port map (memo.data(i), memo.bdrive(1), memi.data(i), data(i));
--     end generate;

--     iopadb2: for i in 8 to 15 generate
--       iopadb21: iopad3 port map (memo.data(i), memo.bdrive(2), memi.data(i), data(i));
--     end generate;

--     iopadb3: for i in 0 to 7 generate
--       iopadb31: iopad3 port map (memo.data(i), memo.bdrive(3), memi.data(i), data(i));
--     end generate;
  dataout <= memo.data;
  memi.data <= datain;
  datasel <= memo.bdrive;

--   iopadb5: for i in 0 to 15 generate		-- parallel I/O port
--     iopadb51: smiopad port map (ioo.piol(i), ioo.piodir(i), ioi.piol(i), pio(i));
--   end generate;

  pioo <= ioo.piol;
  ioi.piol <= pioi;
  piod <= ioo.piodir;

  rwen(0) <= memo.wrn(0);
  memi.wrn(0) <= memo.wrn(0);
  rwen(1) <= memo.wrn(1);
  memi.wrn(1) <= memo.wrn(1);
  rwen(2) <= memo.wrn(2);
  memi.wrn(2) <= memo.wrn(2);
  rwen(3) <= memo.wrn(3);
  memi.wrn(3) <= memo.wrn(3);

  
    -- iopadb7: for i in 0 to 3 generate			-- ram write strobe  
      --iopadb71: iopad2 port map (memo.wrn(i), gnd, memi.wrn(i), rwen(i));
    -- end generate;

  
     							-- I/O write strobe
    -- iopadb8: iopad2 port map (memo.writen, gnd, memi.writen, writen);
    writen <= memo.writen;
    memi.writen <= memo.writen;
  
    outpadb0: for i in 0 to 27 generate			-- memory address
      outpadb01: outpad3 port map (memo.address(i), address(i));
    end generate;

    outpadb1: for i in 0 to 3 generate			-- ram oen/rasn
      outpadb11: outpad2 port map (memo.ramsn(i), ramsn(i));
    end generate;

    outpadb2: for i in 0 to 3 generate			-- ram chip select
      outpadb21: outpad2 port map (memo.ramoen(i), ramoen(i));
    end generate;

    outpadb3: for i in 0 to 1 generate			-- rom chip select
      outpadb31: outpad2 port map (memo.romsn(i), romsn(i));
    end generate;

    outpadb4: outpad2 port map (memo.read, read);	-- memory read
    outpadb5: outpad2 port map (memo.oen, oen);	-- memory oen
    outpadb6: outpad2 port map (memo.iosn, iosn);	-- I/O select

  outpadb7: outpad2 port map (ddmo.shift_clk, shift_clk);
  outpadb8: outpad2 port map (ddmo.lr_out, lr_out);
  outpadb9: outpad2 port map (ddmo.audioout, audioout);
  outpadb10: for i in 0 to 6 generate
    outpad101: outpad2 port map(ddmo.digit0(i), digit0(i));
  end generate;
  outpadb11: for i in 0 to 6 generate
    outpad111: outpad2 port map(ddmo.digit1(i), digit1(i));
  end generate;
  outpadb12: outpad2 port map (ddmo.mclk, mclk);

  
  dispen <= ddmo.dispen;

  wd : if WDOGEN generate
      outpadb7: odpad port map (ioo.wdog, wdogn);	-- watchdog output
    end generate;





end ;

