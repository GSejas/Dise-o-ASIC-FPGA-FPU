
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
-- Entity:      ahbarb
-- File:        ahbarb.vhd
-- Author:      Jiri Gaisler - Gaisler Research
-- Description: AMBA AHB arbiter and decoder
------------------------------------------------------------------------------ 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.target.all;
use work.config.all;
use work.iface.all;
use work.amba.all;
-- use work.debug.all; 


entity ahbarb is
  generic (
    masters : integer := 2;		-- number of masters	
    defmast : integer := 1 		-- default master
  );
  port (
    rst     : in  std_logic;
    clk     : in  clk_type;
    msti    : out ahb_mst_in_vector(0 to masters-1);
    msto    : in  ahb_mst_out_vector(0 to masters-1);
    slvi    : out ahb_slv_in_vector(0 to AHB_SLV_MAX-1);
    slvo    : in  ahb_slv_out_vector(0 to AHB_SLV_MAX-1)
  );
end;

architecture rtl of ahbarb is

constant MIMAX : integer := log2x(masters) - 1;
constant SIMAX : integer := log2(AHB_SLV_MAX+1) - 1;
type reg_type is record
  hmaster   : std_logic_vector(MIMAX downto 0);
  hmasterd  : std_logic_vector(MIMAX downto 0);
  hslave    : std_logic_vector(SIMAX downto 0);
  hready    : std_logic;	-- needed for two-cycle error response
  hmasterlock : std_logic;
  hmasterlock2 : std_logic;
  htrans  : std_logic_vector(1 downto 0);    -- transfer type 
  hcache    : std_logic;	-- cacheable access
end record;

constant ahbmin : integer := AHB_SLV_ADDR_MSB-1;
type nmstarr is array ( 1 to 5) of integer range 0 to masters-1;
type nvalarr is array ( 1 to 5) of boolean;

signal r, rin : reg_type;
signal rsplit, rsplitin : std_logic_vector(masters-1 downto 0);

begin

  comb : process(rst, msto, slvo, r, rsplit)
  variable rv : reg_type;
  variable rhmaster, rhmasterd : integer range 0 to masters -1;
  variable rhslave : integer range 0 to AHB_SLV_MAX;
  variable nhmaster, hmaster : integer range 0 to masters -1;
  variable haddr   : std_logic_vector(31 downto 0);   -- address bus
  variable hrdata  : std_logic_vector(31 downto 0);   -- read data bus
  variable htrans  : std_logic_vector(1 downto 0);    -- transfer type 
  variable hresp   : std_logic_vector(1 downto 0);    -- respons type 
  variable hwrite  : std_logic;  		     -- read/write
  variable hsize   : std_logic_vector(2 downto 0);    -- transfer size
  variable hprot   : std_logic_vector(2 downto 0);    -- protection info
  variable hburst  : std_logic_vector(2 downto 0);    -- burst type
  variable hwdata  : std_logic_vector(31 downto 0);   -- write data
  variable hgrant  : std_logic_vector(0 to masters-1);   -- bus grant
  variable hsel    : std_logic_vector(0 to AHB_SLV_MAX);   -- slave select
  variable hready  : std_logic;  		     -- ready
  variable hmastlock  : std_logic;  		
  variable nslave : natural range 0 to AHB_SLV_MAX;
  variable ahbaddr : std_logic_vector(ahbmin downto 0);
  variable vsplit  : std_logic_vector(masters-1 downto 0);
  variable nmst    : nmstarr;
  variable nvalid  : nvalarr;
  variable hcache  : std_logic;  		
  variable htmp    : std_logic_vector(3 downto 0); 
  begin

    rv := r; rv.hready := '0';

    -- bus multiplexers

-- pragma translate_off
    if not is_x(r.hmaster) then
-- pragma translate_on
      rhmaster  := conv_integer(unsigned(r.hmaster));
-- pragma translate_off
    end if;
    if not is_x(r.hmasterd) then
-- pragma translate_on
      rhmasterd := conv_integer(unsigned(r.hmasterd));
-- pragma translate_off
    end if;
    if not is_x(r.hslave) then
-- pragma translate_on
      rhslave   := conv_integer(unsigned(r.hslave));
-- pragma translate_off
    end if;
-- pragma translate_on
    haddr     := msto(rhmaster).haddr;
    htrans    := msto(rhmaster).htrans;
    hwrite    := msto(rhmaster).hwrite;
    hsize     := msto(rhmaster).hsize;
    hburst    := msto(rhmaster).hburst;
    hmastlock := msto(rhmaster).hlock;
    hwdata    := msto(rhmasterd).hwdata;
    if rhslave /= AHB_SLV_MAX then
      hready := slvo(rhslave).hready;
      hrdata := slvo(rhslave).hrdata;
      hresp  := slvo(rhslave).hresp ;
    else
      -- default slave
      hrdata := (others => '-');
      if (r.htrans = HTRANS_IDLE) or (r.htrans = HTRANS_BUSY) then
        hresp := HRESP_OKAY; hready := '1';
      else
	-- return two-cycle error in case of unimplemented slave access
        hresp := HRESP_ERROR; hready := r.hready; rv.hready := not r.hready;
      end if;
    end if;


    -- find next master
    -- re-arbitrate on non-sequential accesses or when BUSY is seen
    -- with the following priority:
--	1. busreq and (htrans /= idle) and (htrans /= busy) and (split = 0)
--	2. busreq and (htrans /= idle) and (split = 0)
--	3. busreq and (split = 0)
--	4. default master

    nvalid(1 to 4) := (others => false); nvalid(5) := true;
    nmst(1 to 4) := (others => 0); nmst(5) := defmast; nhmaster := rhmaster; 

    if ((msto(rhmaster).htrans = HTRANS_IDLE) or 
	(msto(rhmaster).htrans = HTRANS_BUSY) or
        (msto(rhmaster).hburst = HBURST_SINGLE)) 
	and ((r.hmasterlock or r.hmasterlock2) = '0')
    then
      for i in 0 to (masters -1) loop
	if ((rsplit(i) = '0') or not AHB_SPLIT) then
          if (msto(i).hbusreq = '1') then
            if (msto(i).htrans /= HTRANS_IDLE) then 
              if (msto(i).htrans /= HTRANS_BUSY) then 
	        nmst(1) := i; nvalid(1) := true;
	      end if;
	      nmst(2) := i; nvalid(2) := true;
	    end if;
	    nmst(3) := i; nvalid(3) := true;
	  end if;
	  if not ((nmst(4) = defmast) and nvalid(4)) then 
	    nmst(4) := i; nvalid(4) := true; 
	  end if;
	end if;
      end loop;
      for i in 1 to 5 loop
        if nvalid(i) then nhmaster := nmst(i); exit; end if;
      end loop;
    end if;


    hgrant := (others => '0'); hgrant(nhmaster) := '1';

    -- select slave
    nslave := AHB_SLV_MAX;
    ahbaddr := haddr(31 downto (31 - ahbmin));
    for i in AHB_SLVTABLE'range loop	--'
      if AHB_SLVTABLE(i).enable and
	 (ahbaddr >= AHB_SLVTABLE(i).firstaddr(ahbmin downto 0)) and
         (ahbaddr <= AHB_SLVTABLE(i).lastaddr(ahbmin downto 0)) 
      then nslave :=  AHB_SLVTABLE(i).index; end if;
    end loop;

    if htrans = HTRANS_IDLE then nslave := AHB_SLV_MAX; end if;

    hsel := (others => '0'); hsel(nslave) := '1'; 

    -- latch active master and slave
    if hready = '1' then 
      rv.hmaster := std_logic_vector(conv_unsigned(nhmaster, MIMAX + 1));
      rv.hmasterd := r.hmaster; 
      rv.hslave := std_logic_vector(conv_unsigned(nslave, SIMAX + 1));
      rv.htrans := htrans; rv.hmasterlock := msto(nhmaster).hlock;
      rv.hmasterlock2 := r.hmasterlock;
    end if;

    -- split support
    
    vsplit := (others => '0');
    if AHB_SPLIT then
      vsplit := rsplit;
      if hresp = HRESP_SPLIT then vsplit(rhmasterd) := '1'; end if;
      for i in AHB_SLVTABLE'range loop --'
	if AHB_SLVTABLE(i).split then
	  vsplit := vsplit and not slvo(AHB_SLVTABLE(i).index).hsplit(masters-1 downto 0);
	end if;
      end loop;
    end if;

    -- decode cacheability

    hcache := '0';
    for i in AHB_CACHETABLE'range loop	--'
      if (haddr(31 downto 32-AHB_CACHE_ADDR_MSB) >= AHB_CACHETABLE(i).firstaddr) and
         (haddr(31 downto 32-AHB_CACHE_ADDR_MSB) <= AHB_CACHETABLE(i).lastaddr) 
      then hcache := '1';  end if;
    end loop;

    if hready = '1' then rv.hcache := hcache; end if;

    -- reset operation
    if (rst = '0') then
      rv.hmaster := (others => '0'); rv.hmasterlock := '0'; 
      rv.hslave := std_logic_vector(conv_unsigned(AHB_SLV_MAX, SIMAX+1));
      hsel := (others => '0'); rv.htrans := HTRANS_IDLE;
      hready := '1'; vsplit := (others => '0'); rv.hcache := '0';
    end if;
    
    -- drive master inputs
    for i in 0 to (masters -1) loop
      msti(i).hgrant  <= hgrant(i);
      msti(i).hready  <= hready;
      msti(i).hrdata  <= hrdata;
      msti(i).hresp   <= hresp;
      msti(i).hcache  <= r.hcache;
    end loop;

    -- drive slave inputs
    for i in 0 to (AHB_SLV_MAX -1) loop
      slvi(i).haddr   <= haddr;
      slvi(i).htrans  <= htrans;
      slvi(i).hwrite  <= hwrite;
      slvi(i).hsize   <= hsize;
      slvi(i).hburst  <= hburst;
      slvi(i).hready  <= hready;
      slvi(i).hwdata  <= hwdata;
      slvi(i).hsel    <= hsel(i);
      htmp := "0000"; htmp(MIMAX downto 0) := r.hmaster;
      slvi(i).hmaster <= htmp;
      slvi(i).hmastlock <= hmastlock;
    end loop;

    -- assign register inputs
    
    rin <= rv;
    rsplitin <= vsplit;

  end process;


  reg0 : process(clk)
  begin if rising_edge(clk) then r <= rin; end if; end process;

  splitreg : if AHB_SPLIT generate
    reg1 : process(clk)
    begin if rising_edge(clk) then rsplit <= rsplitin; end if; end process;
  end generate;


end;





