
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
-- Entity: 	leon_pci
-- File:	leon_pci.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	Complete processor with PCI pads
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

entity leon_pci is
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

    test     : in    std_logic;

    pci_rst_in_n   : in std_logic;		-- PCI bus
    pci_clk_in 	   : in std_logic;
    pci_gnt_in_n   : in std_logic;
    pci_idsel_in   : in std_logic;  -- ignored in host bridge core
    pci_lock_n     : inout std_logic;  -- Phoenix core: input only
    pci_ad 	   : inout std_logic_vector(31 downto 0);
    pci_cbe_n 	   : inout std_logic_vector(3 downto 0);
    pci_frame_n    : inout std_logic;
    pci_irdy_n 	   : inout std_logic;
    pci_trdy_n 	   : inout std_logic;
    pci_devsel_n   : inout std_logic;
    pci_stop_n 	   : inout std_logic;
    pci_perr_n 	   : inout std_logic;
    pci_par 	   : inout std_logic;    
    pci_req_n 	   : inout std_logic;  -- tristate pad but never read
    pci_serr_n     : inout std_logic;  -- open drain output
    pci_host   	   : in std_logic;
    pci_66	   : in std_logic;

    pci_arb_req_n  : in  std_logic_vector(0 to 3);
    pci_arb_gnt_n  : out std_logic_vector(0 to 3);

    power_state    : out std_logic_vector(1 downto 0);
    pme_enable     : out std_logic;
    pme_clear      : out std_logic;
    pme_status     : in  std_logic

  );
end; 

architecture rtl of leon_pci is

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

signal pci_aden         : std_logic_vector(31 downto 0);
signal pci_cbeen        : std_logic_vector(3 downto 0);
signal pci_frame_en     : std_logic;
signal pci_irdy_en      : std_logic;
signal pci_ctrl_en      : std_logic;
signal pci_perr_en      : std_logic;
signal pci_par_en       : std_logic;
signal pci_req_en       : std_logic;
signal pci_serr_en      : std_logic;
signal pci_lock_en      : std_logic;
signal pci_lock_out     : std_logic;
signal pci_req_in_dummy : std_logic;
signal pmaster  	: std_logic;
signal pmasterv         : std_logic_vector(31 downto 0);


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

    a_pads : for i in 0 to 27 generate			-- memory address
      a_pads : outpad generic map (3) port map (memo.address(i), address(i));
    end generate;

    ramsn_pads : for i in 0 to 3 generate		-- ram oen/rasn
      ramsn_pad : outpad generic map (2) port map (memo.ramsn(i), ramsn(i));
    end generate;

    ramoen_pads : for i in 0 to 3 generate		-- ram chip select
      ramoen_pad : outpad generic map (2) port map (memo.ramoen(i), ramoen(i));
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


  pmaster  <= '0';
  pmasterv <= (others => '0');


    -- Phoenix core delivers active low!
      pcictrl0 : if PCICORE = insilicon generate
        pci_aden     <= pmasterv or (pcio.pci_aden_n);
        pci_cbeen(0) <= pmaster or (pcio.pci_cbe0_en_n);
        pci_cbeen(1) <= pmaster or (pcio.pci_cbe1_en_n);
        pci_cbeen(2) <= pmaster or (pcio.pci_cbe2_en_n);
        pci_cbeen(3) <= pmaster or (pcio.pci_cbe3_en_n);
        pci_frame_en <= pmaster or (pcio.pci_frame_en_n);
        pci_irdy_en  <= pmaster or (pcio.pci_irdy_en_n);
        pci_ctrl_en  <= pmaster or (pcio.pci_ctrl_en_n);
        pci_perr_en  <= pmaster or (pcio.pci_perr_en_n);
        pci_par_en   <= pmaster or (pcio.pci_par_en_n);
        pci_req_en   <= pmaster or (pcio.pci_req_en_n);
        pci_serr_en  <= pmaster or (pcio.pci_serr_out_n);  -- open drain pad!
        pci_lock_en  <= '1'; -- is-core has no lock output -> deactivate
        pci_lock_out <= '0';            -- dont care this output
      end generate;

      -- ESA core delivers enables active high
      pcictrl1 : if PCICORE /= insilicon generate
        pci_aden     <= pmasterv or not (pcio.pci_aden_n);
        pci_cbeen(0) <= pmaster or not (pcio.pci_cbe0_en_n);
        pci_cbeen(1) <= pmaster or not (pcio.pci_cbe1_en_n);
        pci_cbeen(2) <= pmaster or not (pcio.pci_cbe2_en_n);
        pci_cbeen(3) <= pmaster or not (pcio.pci_cbe3_en_n);
        pci_frame_en <= pmaster or not (pcio.pci_frame_en_n);
        pci_irdy_en  <= pmaster or not (pcio.pci_irdy_en_n);
        pci_ctrl_en  <= pmaster or not (pcio.pci_ctrl_en_n);
        pci_perr_en  <= pmaster or not (pcio.pci_perr_en_n);
        pci_par_en   <= pmaster or not (pcio.pci_par_en_n);
        -- pci_req must be tri-stated during reset!
        pci_req_en   <= pmaster or not (pcii.pci_rst_in_n);
        pci_serr_en  <= pmaster or not (pcio.pci_serr_en_n);  -- open drain pad!
        pci_lock_en  <= pmaster or not (pcio.pci_lock_en_n);
        pci_lock_out <= pcio.pci_lock_out_n;
      end generate;

    
      pci_rst_in_n_pad : inpad port map(pci_rst_in_n, pcii.pci_rst_in_n);
      pci_clk_in_pad : inpad port map(pci_clk_in, pcii.pci_clk_in);
      pci_gnt_in_n_pad : inpad port map(pci_gnt_in_n, pcii.pci_gnt_in_n);
      pci_idsel_in_pad : inpad port map(pci_idsel_in, pcii.pci_idsel_in);  -- ignored in host bridge core
--      pci_lock_in_n_pad : inpad port map(pci_lock_in_n, pcii.pci_lock_in_n);  -- Phoenix core: input only
      pci_lock_n_pad : pciiopad port map(pci_lock_out, pci_lock_en, pcii.pci_lock_in_n, pci_lock_n);



      pci_ad_pads : for i in 0 to 31 generate
	pci_adio_pad : pciiopad
	    port map(pcio.pci_adout(i), pci_aden(i), pcii.pci_adin(i), pci_ad(i));  
      end generate pci_ad_pads;

      pci_cbe_n_pads : for i in 0 to 3 generate
	pci_cbeio_n_pad : pciiopad
	    port map(pcio.pci_cbeout_n(i), pci_cbeen(i), pcii.pci_cbein_n(i), pci_cbe_n(i));
      end generate pci_cbe_n_pads;

      pci_frame_io_n_pad : pciiopad port map
	(pcio.pci_frame_out_n, pci_frame_en, pcii.pci_frame_in_n, pci_frame_n);

      pci_irdy_io_n_pad : pciiopad port map
	(pcio.pci_irdy_out_n, pci_irdy_en, pcii.pci_irdy_in_n, pci_irdy_n);

    -- the following 3 pads have common enable pci_ctrl_en_n
      pci_trdy_io_n_pad : pciiopad port map
	(pcio.pci_trdy_out_n, pci_ctrl_en, pcii.pci_trdy_in_n, pci_trdy_n);
      pci_devsel_io_n_pad : pciiopad port map
	(pcio.pci_devsel_out_n, pci_ctrl_en, pcii.pci_devsel_in_n, pci_devsel_n);
      pci_stop_io_n_pad : pciiopad port map
	(pcio.pci_stop_out_n, pci_ctrl_en, pcii.pci_stop_in_n, pci_stop_n);
    
      pci_perr_io_n_pad : pciiopad port map
	(pcio.pci_perr_out_n, pci_perr_en, pcii.pci_perr_in_n, pci_perr_n);

      pci_par_io_pad : pciiopad port map
	(pcio.pci_par_out, pci_par_en, pcii.pci_par_in, pci_par);    

      pci_req_io_n_pad : pciiopad port map  	-- tristate pad but never read
	(pcio.pci_req_out_n, pci_req_en, pci_req_in_dummy, pci_req_n);

    -- open drain bidir
      pci_serr_n_pad   : pciiodpad port map (pci_serr_en, pcii.pci_serr_in_n, pci_serr_n);

    -- PCI host select
      pci_host_pad : inpad port map (pci_host, pcii.pci_host);	

    -- Optional PCI arbiter

      parb1 : if PCIARBEN generate
        pgnt : for i in 0 to 3 generate
          pcignt : pcioutpad port map (ioo.pci_arb_gnt_n(i), pci_arb_gnt_n(i));
        end generate;
      end generate;

      parb2 : if PCIARBEN generate
        preq : for i in 0 to 3 generate
          pcireq : inpad port map (pci_arb_req_n(i), ioi.pci_arb_req_n(i));
        end generate;
      end generate;
    -- Optional 66 MHz pad
      p66  : if PCI66PADEN generate
        pci_66_pad : inpad port map(pci_66, pcii.pci_66);
      end generate;
      np66  : if not PCI66PADEN generate
        pcii.pci_66 <= '0';
      end generate;

    -- Optional power control pads

      pme  : if PCIPMEEN generate
        pmes : for i in 1 downto 0 generate
          power_state_pad : pcioutpad port map (pcio.power_state(i), power_state(i));
	end generate;
        pme_enable_pad : pcioutpad port map (pcio.pme_enable, pme_enable);
        pme_clear_pad  : pcioutpad port map (pcio.pme_clear, pme_clear);
        pme_status_pad : inpad port map(pme_status, pcii.pme_status);
      end generate;
      npme  : if not PCIPMEEN generate
        pcii.pme_status <= '0';
      end generate;

end ;

