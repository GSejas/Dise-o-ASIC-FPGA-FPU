
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

-- modified for ddm 8.02.02 LA

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

---
    datain   : in    std_logic_vector(31 downto 0);	    -- 32 bits conversion LA
    dataout  : out   std_logic_vector(31 downto 0);
    datasel  : out   std_logic_vector(3 downto 0);
---
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

---
    pioo     : out std_logic_vector(15 downto 0); 	-- I/O port  32 bits LA
    pioi     : in  std_logic_vector(15 downto 0);
    piod     : out std_logic_vector(15 downto 0);

    buttons  : in std_logic_vector(3 downto 0);  	-- ddm ports
    
    audioin  : in std_logic;

    digit0    : out std_logic_vector(6 downto 0);
    digit1    : out std_logic_vector(6 downto 0);
    audioout  : out std_logic;
    lr_out    : out std_logic;
    shift_clk  : out std_logic;
    mclk     : out   std_logic;
    dispen   : out   std_logic;

---
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
--
    ddmi     : in  ddm_in_type;			     -- DDM signals LA
    ddmo     : out ddm_out_type; 
--
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
--
signal ddmi     : ddm_in_type;	     -- DDM signals LA
signal ddmo     : ddm_out_type;
--
begin

  gnd <= '0';

-- main processor core

  mcore0  : mcore  
  port map ( 
    resetn => resetno, clk => clko, 
    memi => memi, memo => memo, ioi => ioi, ioo => ioo,
--    pcii => pcii, pcio => pcio, test => test
    pcii => pcii, pcio => pcio, ddmi => ddmi, ddmo => ddmo, test => test	-- DDM LA
  );

-- pads

--  clk_pad   : inpad port map (clk, clko);	-- clock
  clko <= clk;					-- avoid buffering during synthesis

--original lines 
  reset_pad   : smpad port map (resetn, resetno);	-- reset
  brdyn_pad   : inpad port map (brdyn, memi.brdyn);	-- bus ready
  bexcn_pad   : inpad port map (bexcn, memi.bexcn);	-- bus exception


    error_pad   : odpad generic map (2) port map (ioo.errorn, errorn);	-- cpu error mode

--DDM lines


  inpad4   : inpad port map (audioin, ddmi.audioin);
  inpad5   : inpad port map (buttons(0),ddmi.button0);
  inpad6   : inpad port map (buttons(1),ddmi.button1);
  inpad7   : inpad port map (buttons(2),ddmi.button2);
  inpad8   : inpad port map (buttons(3),ddmi.button3);  

--  	d_pads: for i in 0 to 31 generate			-- data bus
--      d_pad : iopad generic map (3) port map (memo.data(i), memo.bdrive((31-i)/8), memi.data(i), data(i));
--    end generate;

  dataout <= memo.data;						    -- databus DDM LA
  memi.data <= datain;
  datasel <= memo.bdrive;

--    pio_pads : for i in 0 to 15 generate		-- parallel I/O port
--      pio_pad : smiopad generic map (2) port map (ioo.piol(i), ioo.piodir(i), ioi.piol(i), pio(i));
--    end generate;

  pioo <= ioo.piol;							    -- parallel I/O port DDM
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


--    rwen_pads : for i in 0 to 3 generate			-- ram write strobe
--      rwen_pad : iopad generic map (2) port map (memo.wrn(i), gnd, memi.wrn(i), rwen(i));
--    end generate;

     							-- I/O write strobe
--    writen_pad : iopad generic map (2) port map (memo.writen, gnd, memi.writen, writen);

	writen <= memo.writen;		  -- DDM LA
    memi.writen <= memo.writen;
--
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

--
 	outpadb7: outpad port map (ddmo.shift_clk, shift_clk);	    -- DDM
  	outpadb8: outpad port map (ddmo.lr_out, lr_out);
  	outpadb9: outpad port map (ddmo.audioout, audioout);
  	outpadb10: for i in 0 to 6 generate
    outpad101: outpad port map(ddmo.digit0(i), digit0(i));
  	end generate;
  	outpadb11: for i in 0 to 6 generate
    outpad111: outpad port map(ddmo.digit1(i), digit1(i));
  	end generate;
  	outpadb12: outpad port map (ddmo.mclk, mclk);

  
  	dispen <= ddmo.dispen;
 --

    wd : if WDOGEN generate
      wdogn_pad : odpad generic map (2) port map (ioo.wdog, wdogn);	-- watchdog output
    end generate;




end ;

