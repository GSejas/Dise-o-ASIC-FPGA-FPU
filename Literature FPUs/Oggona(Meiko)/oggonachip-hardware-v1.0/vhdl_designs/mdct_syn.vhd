--------------------------------------------------------------------------
-- This file is part of Oggonachip project
-- http://oggonachip.sourceforge.net
---------------------------------------------------------------------------
-- Entities:    mdct, mdctctrl
-- File:        mdct.vhd
-- Author:      Luis L. Azuara
-- Email:       azuara@gmx.de
-- Description:	Inverse MDCT function with AMBA bus to be used in an audio
-- decoder as system-on-a-chip. Reads memory values stored in memory, 
-- calculates the inverse mdct for 256 and 2048 points, and returns the result
-- to RAM, according the algorithm
-- used by Ogg Vorbis decoder, and described in "The use of multirate filter
-- banks for coding of high quality digital audio" by Th. Sporer, Kh
-- Brandenburg and B. Edler, collection of the &th European Signal Processing
-- Conference (EUSIPCO), Amsterdam, June 1992.
-- The structure of this core, is mainly based on this algorithm, and please refer to it.
-- The instructions at rtl level are
-- commented with the equivalent lines in mdct.c file when possible.
-- The target technology used so far is Virtex XCV800 speed grade 4
-- 
-- Creation date: 6.03.02
----------------------------------------------------------------------------
-- Inputs: Control register    0x80000300 	
--              bit 0: MDCT- core, 0 = off, 1= on
--              bit 1: not used
--              bit 2: irqen, 0=irq disabled, 1=irq enabled
--              bit 3: irq,
--	   Block size          0x80000304
--              bit 0: array size, 0=256, 1=2048
--         Trig address        0x80000308
--	   Read Start address  0x8000030C
--	   Write Start address 0x80000310
-- Outputs:Status register     0x80000314
--              LSB bits: ready-busy,writting-reading
--	   Current Memory address 0x80000318	
-- --------------------------------------------------------------------------
-- Version
-- --------------------------------------------------------------------------
-- 0.01	   Dummy version. Only AMBA communication activated. Only one address
--	   06.03.02
-- 0.02    Process an array of n elemnts. 
--         12.03.02
-- 0.03    New addresses and bugs with hready fixed 
--         26.03.02
-- 0.04    Function is now a 8 points butterfly
--	   27.03.02
-- 0.06    Multiplicators added. Function is 16 points Butterfly
--         14.04.02
-- 0.07    Using butterfly 32 as test module. "Always enabled " Bug by starting up fixed.
-- 0.08    Control unit added
--         25.04.02
-- 0.09    added premult 1,premult 2, butterfly first satage & butterfly generic 
--         1.05.02
-- 0.10    bit reverse, and post multiplication added. Control signals added.
--         5.05.02
-- 0.11    all functions tested individually. Simulation using Leon2
--         13.05.02
-- 0.12    Test functions together using only in data addresses. State s1 reformated.
-- 0.13    First complete system tested, with real values. Still some errors in
--         first and last cycles of bit reverse and rotate.
-- 0.14    Butterfly 32 component eliminated.
-- 0.15    Test for 256 passed. First candidate to synthesize
-- 0.16    First synthesis attempt using only premult 1 and 2
-- 0.17    New register interface and using DMA to access Bitreverse and trig.
-- 0.18    First synthesizable version of premult 1 and 2.
-- 0.19    Amba wrapping burst used.
-- 0.20    Function completed and synthesized until butterfly generic for 2048
--         and 256 points. Tested as ogg-on-a-chip system.
-- 0.21    DMA Burst optimized and sound bugs corrected
-- --------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- AMBA AHB-Master
-------------------------------------------------------------------------------
-- This component is the interface between mdct control unit and RAM, using dma.
-- It has one read buffer and one write buffer, each of 32 words.
-- When a value greater than 0 is received in ntoprocess register, a data
-- transfer starts, and the action (read or write) depends on value of memwr signal.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_arith.all;

use work.iface.all;
use work.amba.all;
use work.mdctlib.all;

entity mdct is
  port (
    rst   : in  std_logic;
    clk   : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    irq   : out std_logic
  );
end;

architecture rtl of mdct is

component mdctctrl is
   port (
        rst   : in  std_logic;
        clk   : in  clk_type;
        regs: in mdctregs;
        r_ctrl: out ctrlregs;
        dataready : in std_logic;
        result : out block32_data               
         );
end component;


signal r,rin : mdctregs;                -- status signals to control unit 
signal ctrlcon : ctrlregs;              -- control signals comming from control unit
signal dataready :  std_logic;          -- active when a data block
                                                   -- has been processed
signal dmaoutdata : block32_data;       -- output buffer

begin
  
  mdcttop : process(r,apbi, ahbi,ctrlcon,dmaoutdata,dataready)
  variable rdata : std_logic_vector(31 downto 0):=zero32;
  variable tmp: mdctregs;

 
  -- amba ahb variables
  variable haddr   : std_logic_vector(31 downto 0):=zero32;   -- address bus
  variable htrans  : std_logic_vector(1 downto 0):="00";    -- transfer type 
  variable hwrite  : std_logic:='0';  		      -- read/write
  variable hsize   : std_logic_vector(2 downto 0):="000";    -- transfer size
  variable hburst  : std_logic_vector(2 downto 0):="000";    -- burst type
  variable hwdata  : std_logic_vector(31 downto 0):=zero32;   -- write data
  variable hbusreq,blkskip : std_logic:='0';      -- bus request and flag to
                                                  -- skip first block
  variable bindex,offset : integer:=0; -- index of the current buffer block
                                    -- place to store/read on buffers


  begin

  -- init
  tmp:=r;

  -- read/write memory mapped registers witch amba apb bus

  rdata := (others => '0');             -- init
  case apbi.paddr(4 downto 2) is
    when "000" =>
      rdata(0) := r.mdcten or r.mdctenreq;    
      rdata(2) := r.irqen;
      rdata(3) := r.irq;
    when "001" =>
      rdata(0) := r.size;      
    when "010" =>
      rdata    := r.trigaddr;
    when "011" =>
      rdata    := r.rdstartaddr;
    when "100" =>
      rdata    := r.wrstartaddr;      
    when "101" =>
      rdata(0) := r.ready;
      rdata(1) := r.memwr;    
    when "110" =>
      rdata    := r.memoryadr;
    when others => null;
  end case;
  if (apbi.psel and apbi.penable and apbi.pwrite) = '1' then
    case apbi.paddr(4 downto 2) is
      when "000" =>
        tmp.mdctenreq := apbi.pwdata(0);        
        tmp.irqen    := apbi.pwdata(2);
        if apbi.pwdata(3)='0' then      -- allow only interrupt reset
          tmp.irq    := '0';
        end if;
        if tmp.mdctenreq='1' and r.mdctenreq='0' and r.ready = '1' then
        -- init mdct transaction if enabled and ready

          tmp.mdcten := '1'; -- enable mdct
          tmp.memoryadr := ctrlcon.startadr; -- initialize value for actual read address	       
          tmp.memwr := '0';          -- start read cycle
        end if;
      when "001" =>
        tmp.size := apbi.pwdata(0);        
      when "010" =>
        tmp.trigaddr := apbi.pwdata;        
      when "011" =>
        tmp.rdstartaddr := apbi.pwdata;
      when "100" =>
        tmp.wrstartaddr := apbi.pwdata;
      when others => null;
    end case;
  end if;
 
  
  -- dma/amba ahb activity (master)

  -- start ahb action 
  if r.dmatransfreq = '1' then  -- request bus for action 
    hbusreq := '1';
  end if; 

  -- check for bus ownership
  tmp.busgrant := ahbi.hgrant;
  if tmp.busgrant = '1' and r.dmatransfreq = '1' then
    tmp.busact := '1';                  -- bus granted and requested
  elsif tmp.busgrant='1' and r.busgrant='0' and r.dmatransfreq='0' then
    
    tmp.busact := '0';                  -- bus granted but not requested
    htrans := HTRANS_IDLE; -- do nothing if granted without request
    hbusreq := '0';    
  end if;
  



  -- control and address cycle of ahb transfer
  
  haddr := r.memoryadr; -- set next  address
  hsize := HSIZE_WORD;
  
  if rising_edge(ahbi.hready) then
    if ctrlcon.incr='0' then
      hburst := HBURST_INCR4;
    else                               
      hburst := HBURST_INCR8;                             -- 
    end if;  
  end if;
  -- data cycle of ahb transfer
  bindex:= CONV_INTEGER (unsigned(tmp.ntoprocess));
  case ctrlcon.trigpos is
    when '0' => 
      case ctrlcon.pos is
        when "00" => 
          offset:=0;
        when "01" =>
          offset:=4;
        when "10" =>
          offset:=8;
        when "11" =>
          offset:=12;
        when others => null;
      end case;
    when '1' => 
      case ctrlcon.pos is
        when "00" => 
          offset:=16;
        when "01" =>
          offset:=20;
        when "10" =>
          offset:=24;
        when "11" =>
          offset:=28;
        when others => null;
      end case;      
    when others => null;
  end case;


  if r.busact = '1' and ahbi.hready='1'  and dataready='0' then
    tmp.skipblk:='0';                   -- skip first busown after granted
    if   r.skipblk='0' then             -- bus active 
      tmp.busown:='1';                     -- bus owner at next clock
      
       if bindex>0 and ctrlcon.memwr = '1' then
         htrans := HTRANS_SEQ;         
         hwdata:=dmaoutdata(CONV_INTEGER(unsigned(ctrlcon.ntoprocess))-bindex+offset) ;	--throw result to bus
       end if;
              
    end if; 
  end if;  


  if ahbi.hgrant='0' then
    tmp.skipblk:='1';
  end if;
 
  if r.busown='1' then
      tmp.busown:='0';
      
      if ctrlcon.incr='0' then
        tmp.memoryadr:=r.memoryadr+4; -- adjust next read address (one word)      
      else                          
        tmp.memoryadr:=r.memoryadr+8; -- adjust next read address (two words)
      end if;
        
    if  dataready='0' and ctrlcon.memwr='0' then  
      tmp.busown2cyc:='1';              -- second cycle only for reading
    else
      tmp.ntoprocess := r.ntoprocess-1;   -- one element was already processed       
    end if;
  end if;

  if r.busown2cyc='1' and r.mdcten = '1'  then
    htrans := HTRANS_SEQ;

    -- read data from bus
    if ctrlcon.memwr ='0'and dataready='0'  then
      if bindex >0 then
        tmp.inputdata(CONV_INTEGER(unsigned(ctrlcon.ntoprocess))-bindex+offset) := ahbi.hrdata;
        -- loads data from bus
      end if;
    end if;
    tmp.ntoprocess := r.ntoprocess-1;   -- one element was already read    
    tmp.busown2cyc:='0';
  end if;

  -- check for mdct action end

    if CONV_INTEGER(r.ntoprocess) = 0 then
    -- all elements in array were processed
     dataready <= '1';             -- says to the control unit the data are there

     if r.mdcten='1' then
       htrans := HTRANS_NONSEQ;
       hwrite := '0';
     else
       htrans := HTRANS_IDLE;
       hbusreq:='0';
       tmp.dmatransfreq := '0';         -- no request for the bus

     end if;   
    else
     dataready <= '0';     
     tmp.dmatransfreq := '1';         -- request for the bus
     hwrite:=ctrlcon.memwr;
    end if;

 
-- mdct action ended
 if ctrlcon.finish='1'and r.ready='0' then
    tmp.ready:='1';
    tmp.mdcten:='0';
    tmp.mdctenreq := '0';
    tmp.irq := r.irqen;           -- request interruption if it is enabled
    tmp.dmatransfreq := '0';
    tmp.busown2cyc := '0';
    
  end if;

 -- use control register to manage next action


  if dataready='1' and r.mdcten='1' then
     tmp.ntoprocess := ctrlcon.ntoprocess;
     tmp.memoryadr := ctrlcon.startadr;
     tmp.trigpos := ctrlcon.trigpos;
  end if;
  tmp.memwr := ctrlcon.memwr;
  tmp.ready := ctrlcon.finish;
--  tmp.result := dmaoutdata;
  if ctrlcon.rcopy='1' then
    tmp.inputdata := dmaoutdata;
  end if;
  
  -- update registers

  rin <= tmp;

  -- output from mdct to ambabus 
  
  irq <= r.irq;
  apbo.prdata <= rdata;
  ahbo.haddr <= haddr;
  ahbo.htrans <= htrans;
  ahbo.hbusreq <= hbusreq;
  ahbo.hwdata <= hwdata;
  ahbo.hlock <= '0';
  ahbo.hwrite <= hwrite and not (r.skipblk);
  ahbo.hsize <= hsize;
  ahbo.hburst <= hburst;
  ahbo.hprot <= (others => '0');


  end process;

  -- updating data with clock signals

  update : process (clk,rst)
  begin
-- reset operation of mdct-module    
    if rst='0' then
      r.inputdata <= (others => zero32);
      r.rdstartaddr <= (others => '0');
      r.trigaddr <= (others => '0');
      r.bitrevaddr <= (others => '0');    
      r.size <= '0';
      r.ntoprocess <= (others => '0');
      r.wrstartaddr <= (others => '0');
      r.memoryadr <= (others => '0');
      r.mdcten <= '0';
      r.mdctenreq <= '0';
      r.dmatransfreq <= '0';
      r.trigpos<='0';
      r.ready <='1';
      r.memwr <= '0';
      r.irqen <= '0';
      r.irq <= '0';
      r.skipblk <= '1';
      r.busown <= '0';
      r.busgrant <= '0';
      r.busown2cyc <= '0';
      r.busact <= '0';
     
    elsif rising_edge(clk) then
      r<=rin;

    end if;
  end process;

   

cu: mdctctrl
  port map (
       rst => rst,
       clk => clk,
       regs => r,
       r_ctrl => ctrlcon,
       dataready => dataready,
       result => dmaoutdata
       );

end;

-------------------------------------------------------------------------------
-- MDCT unit control
-------------------------------------------------------------------------------
-- In order to perform data process, there are 4 multipliers and 8 adders
-- available.The multipliers are divided in two banks, each one with two of them
-- and an adder. The adder bank has 6 adders.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_arith.all;
-- pragma translate_off
use std.textio.all;
-- pragma translate_on
use work.mdctlib.all;


entity mdctctrl is
   port (
        rst : in std_logic;
        clk : in std_logic;
        regs: in mdctregs;
        r_ctrl: out ctrlregs;
        dataready : in std_logic;
        result : out block32_data
         );
end mdctctrl;

architecture rtl of mdctctrl is

component multadd is
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    datain  : in in_multadd;
    dataout  : out out_multadd
    );

end component;

component addbank is
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    datain  : in in_addbank;
    dataout  : out out_addbank
    );

end component;


type mdct_state is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,sT);


type ma_ports is record              
                                        -- signal connections with arithmetic units
                      i  : in_multadd;
                      o  : out_multadd;
end record;

type ad_ports is record              
                                        -- signal connections with arithmetic units
                      i  : in_addbank;
                      o  : out_addbank;
end record;

type arith_inputs is record
                           ma0 : in_multadd;
                           ma1 : in_multadd;
                           ad  : in_addbank;
end record;

type arith_outputs is record
                           ma0 : out_multadd;
                           ma1 : out_multadd;
                           ad  : out_addbank;
end record;

subtype natural  is integer range 0 to integer'high;
subtype nat2 is natural range 0 to 3;
subtype nat3 is natural range 0 to 7;
subtype nat4 is natural range 0 to 15;
subtype nat8 is natural range 0 to 256;
subtype nat11 is natural range 0 to 2047;
  
type fsm is record
  state : mdct_state;
  start: std_logic_vector(5 downto 0);
  retstate: mdct_state;
  trig,irfaddr,orfaddr,xaddr : std_logic_vector(31 downto 0);
  loops,trigint,j:nat8;
  trignext:nat11;
  i:nat3;
  btfgen:std_logic;
end record;

signal smctrl: fsm;
signal stateclk: std_logic := '0';
signal bufout : block32_data;
signal ao_in,ao_bufin : arith_inputs;
signal ao_out : arith_outputs; 

signal r0,r1: std_logic_vector(MDCT_wsize-1 downto 0):=zero32;  -- auxiliar registers
signal r64_1,r64_2,r64_3,r64_4 : std_logic_vector(MDCT_wsize+MDCT_csize-1 downto 0):= ( others =>  '0');

                                        -- result of multipliers
signal rin_ctrl : ctrlregs;
alias T : block8_data is regs.inputdata(16 to 23);

begin

    clkupdate: process (clk,rst)

    begin
-- reset for arithmetic and result signals
      if rst = '0' then

        ao_in.ma0.add_fun <= '0';
        ao_in.ma1.add_fun <= '0';
        ao_in.ma0.op1_m1 <= zero32;
        ao_in.ma0.op2_m1 <= zero32;
        ao_in.ma0.op1_m2 <= zero32;
        ao_in.ma0.op2_m2 <= zero32;
        ao_in.ma1.add_fun <= '0';
        ao_in.ma1.op1_m1 <= zero32;
        ao_in.ma1.op2_m1 <= zero32;
        ao_in.ma1.op1_m2 <= zero32;
        ao_in.ma1.op2_m2 <= zero32;
        ao_in.ad.op1_a1 <= zero32;
        ao_in.ad.op2_a1 <= zero32;
        ao_in.ad.op1_a2 <= zero32;
        ao_in.ad.op2_a2 <= zero32;
        ao_in.ad.op1_a3 <= zero32;
        ao_in.ad.op2_a3 <= zero32;
        ao_in.ad.op1_s1 <= zero32;
        ao_in.ad.op2_s1 <= zero32;
        ao_in.ad.op1_s2 <= zero32;
        ao_in.ad.op2_s2 <= zero32;
        ao_in.ad.op1_s3 <= zero32;
        ao_in.ad.op2_s3 <= zero32;

        result <= (others =>  zero32);

      elsif rising_edge(clk) then

        result <= bufout;
        ao_in <= ao_bufin;

      end if;


    end process; --rstclk

    arithmetic: process(regs,smctrl,ao_in,ao_out,r0,r1)
      
    variable ao  : arith_inputs;

-- pragma translate_off
    file mdctresult : text is out "./mdctresult.txt";
    variable text_line : line;
-- pragma translate_on
    
    begin
--*************************
--Arithmetic process
--*************************

  ao := ao_in;

  case smctrl.state is

    when s0 =>

      bufout <= (others => zero32 );      
      ao.ma0.add_fun := '0';
      ao.ma1.add_fun := '0';
      ao.ma0.op1_m1 := zero32;
      ao.ma0.op2_m1 := zero32;
      ao.ma0.op1_m2 := zero32;
      ao.ma0.op2_m2 := zero32;
      ao.ma1.add_fun := '0';
      ao.ma1.op1_m1 := zero32;
      ao.ma1.op2_m1 := zero32;
      ao.ma1.op1_m2 := zero32;
      ao.ma1.op2_m2 := zero32;
      ao.ad.op1_s1 := zero32;
      ao.ad.op2_s1 := zero32;
      ao.ad.op1_s2 := zero32;
      ao.ad.op2_s2 := zero32;
      ao.ad.op1_s3 := zero32;
      ao.ad.op2_s3 := zero32;
      -- initializing addresses for first call
      
      ao.ad.op1_a1 := regs.trigaddr;
      ao.ad.op1_a2 := regs.rdstartaddr;
      ao.ad.op1_a3 := regs.wrstartaddr;
      
      if regs.size='0' then
        -- for 256 points
        ao.ad.op2_a1 := conv_std_logic_vector(256,32);         -- trig incr
        ao.ad.op2_a2 := conv_std_logic_vector(484,32);         -- irfaddr incr
        ao.ad.op2_a3 := conv_std_logic_vector(752,32);         -- orfaddr incr
      else
        -- for 2048 points
        ao.ad.op2_a1 := conv_std_logic_vector(2048,32);         -- trig incr
        ao.ad.op2_a2 := conv_std_logic_vector(4068,32);         -- irfaddr incr
        ao.ad.op2_a3 := conv_std_logic_vector(6128,32);         -- orfaddr incr
      end if;
      
    when s1 =>
------------------------------------------------------------
--begin  arithmetic  premult 1
--------------------------------------------------------------

      ao.ma0.add_fun := '0';
      ao.ma0.op1_m1 :=  - regs.inputdata(1);
      ao.ma0.op2_m1 := T(3);
      ao.ma0.op1_m2 := regs.inputdata(0);
      ao.ma0.op2_m2 := T(2);

      ao.ma1.add_fun := '0';
      ao.ma1.op1_m1 := regs.inputdata(0);
      ao.ma1.op2_m1 := T(3);
      ao.ma1.op1_m2 := regs.inputdata(1);
      ao.ma1.op2_m2 := T(2);

      
      bufout(0)<= ao_out.ma0.r_mult;
      bufout(1)<= ao_out.ma1.r_mult;

      
    when s2 =>
      
      ao.ma0.add_fun := '0';
      ao.ma0.op1_m1 :=  - regs.inputdata(3);
      ao.ma0.op2_m1 := T(1);
      ao.ma0.op1_m2 := regs.inputdata(2);
      ao.ma0.op2_m2 := T(0);
      
      ao.ma1.add_fun := '0';
      ao.ma1.op1_m1 := regs.inputdata(2);
      ao.ma1.op2_m1 := T(1);
      ao.ma1.op1_m2 := regs.inputdata(3);
      ao.ma1.op2_m2 := T(0);


      bufout(2)<= ao_out.ma0.r_mult;      -- writing result
      bufout(3)<= ao_out.ma1.r_mult;

      -- Address calculation

      if smctrl.loops =0 then
        ao.ad.op1_a1 := regs.trigaddr;
        ao.ad.op1_a2 := regs.rdstartaddr;
        ao.ad.op1_a3 := regs.wrstartaddr;
      
        if regs.size='0' then
        -- for 256 points
          ao.ad.op2_a1 := conv_std_logic_vector(240,32);         -- trig incr
          ao.ad.op2_a2 := conv_std_logic_vector(480,32);         -- irfaddr incr
          ao.ad.op2_a3 := conv_std_logic_vector(768,32);         -- orfaddr incr
        else
        -- for 2048 points
          ao.ad.op2_a1 := conv_std_logic_vector(2032,32);         -- trig incr
          ao.ad.op2_a2 := conv_std_logic_vector(4064,32);         -- irfaddr incr
          ao.ad.op2_a3 := conv_std_logic_vector(6144,32);         -- orfaddr incr
        end if;
      else
        ao.ad.op1_a1 := smctrl.trig;
        ao.ad.op2_a1 := conv_std_logic_vector(16,32);        
        ao.ad.op1_a2 := smctrl.irfaddr;
        ao.ad.op2_a2 := conv_std_logic_vector(-32,32);         
        ao.ad.op1_a3 := smctrl.orfaddr;
        ao.ad.op2_a3 := conv_std_logic_vector(-16,32);         
      end if;

    when s3 =>
------------------------------------------------------------
--begin  arithmetic  premult 1
--------------------------------------------------------------      
      ao.ma0.add_fun := '1';           -- addition
      ao.ma0.op1_m1 := regs.inputdata(0);
      ao.ma0.op2_m1 := T(1);
      ao.ma0.op1_m2 := regs.inputdata(1);
      ao.ma0.op2_m2 := T(0);

      ao.ma1.add_fun := '0';           -- substraction
      ao.ma1.op1_m1 := regs.inputdata(0);
      ao.ma1.op2_m1 := T(0);
      ao.ma1.op1_m2 := regs.inputdata(1);
      ao.ma1.op2_m2 := T(1);
      

      bufout(2)<= ao_out.ma0.r_mult;      -- writing result
      bufout(3)<= ao_out.ma1.r_mult;

      
    when s4 =>

      ao.ma0.add_fun := '1';           -- addition
      ao.ma0.op1_m1 := regs.inputdata(2);
      ao.ma0.op2_m1 := T(3);
      ao.ma0.op1_m2 := regs.inputdata(3);
      ao.ma0.op2_m2 := T(2);
      
      ao.ma1.add_fun := '0';           -- substraction
      ao.ma1.op1_m1 := regs.inputdata(2);
      ao.ma1.op2_m1 := T(2);
      ao.ma1.op1_m2 := regs.inputdata(3);
      ao.ma1.op2_m2 := T(3);
      
    
      bufout(0)<= ao_out.ma0.r_mult;
      bufout(1)<= ao_out.ma1.r_mult;

      
      -- Address calculation
      -- x1=out+(2048/2+2048/2-8)*4
      -- x2=out+(2048/2+2048/4-8)*4      

      if smctrl.loops =0 then
        ao.ad.op1_a1 := regs.trigaddr;
        ao.ad.op1_a2 := regs.wrstartaddr;
        ao.ad.op1_a3 := regs.wrstartaddr;
      -- addresses for next state
        if regs.size='0' then
        -- for 256 points

          ao.ad.op2_a2 := conv_std_logic_vector(992,32);         -- irfaddr,
          -- initialisation for first stage
                                                                 -- bottom butterfly
                                                                 -- out+n-8
          ao.ad.op2_a3 := conv_std_logic_vector(736,32);         -- orfaddr
                                                                 -- top butterfly
                                                                 -- out+n/2+n/4-8                                                                                                
        else
        -- for 2048 points
--          ao.ad.op2_a1 := conv_std_logic_vector(2032,32);         -- trig incr
          ao.ad.op2_a2 := conv_std_logic_vector(8160,32);         -- irfaddr incr
          ao.ad.op2_a3 := conv_std_logic_vector(6112,32);         -- orfaddr incr
        end if;
        ao.ad.op2_a1 := conv_std_logic_vector(48,32);         -- trig incr 12*4
                                                              -- 
      else
        -- addresses for loop
        ao.ad.op1_a1 := smctrl.trig;
        ao.ad.op2_a1 := conv_std_logic_vector(-16,32);        
        ao.ad.op1_a2 := smctrl.irfaddr;
        ao.ad.op2_a2 := conv_std_logic_vector(-32,32);         
        ao.ad.op1_a3 := smctrl.orfaddr;
        ao.ad.op2_a3 := conv_std_logic_vector(+16,32);         
      end if;

    when s5 =>
------------------------------------------------------------
--begin arithmetic  Butterfly first stage and butterfly generic.
--------------------------------------------------------------       
        bufout <= (others => zero32);
       -- calculate next trig Depends on btf generic function

                                        -- calculate final increment at s12
        ao.ad.act_trig := 4*smctrl.trigint;
                                        -- initialize increment for trig after
                                        -- looping equals to 4*trigint. It increses by trigint at
                                        -- each call of sT, because trig is decreased.    
        ao.ad.op1_a1 := smctrl.trig;
        ao.ad.op2_a1 := conv_std_logic_vector(-smctrl.trigint,32);


    when s6 =>
        ao.ad.op1_s1 := regs.inputdata(0);  -- r0 = x1(0)-x2(0)
        ao.ad.op2_s1 := regs.inputdata(4);
        r0 <= ao_out.ad.r_s1;

        ao.ad.op1_s2 := regs.inputdata(1);  -- r1 = x1(1)-x2(1)
        ao.ad.op2_s2 := regs.inputdata(5);
        r1 <= ao_out.ad.r_s2;

        ao.ad.op1_a1 := regs.inputdata(0);  -- x1(0) = x1(0)+x2(0)
        ao.ad.op2_a1 := regs.inputdata(4);

          
        ao.ad.op1_a2 := regs.inputdata(1);  -- x1(1) = x1(1)+x2(1)
        ao.ad.op2_a2 := regs.inputdata(5);


        ao.ma0.add_fun := '1';           -- addition
        ao.ma0.op1_m1 := r1;
        ao.ma0.op1_m2 := r0;

        ao.ma1.add_fun := '0';           -- substraction
        ao.ma1.op1_m1 := r1;
        ao.ma1.op1_m2 := r0;

       -- adapte value according butterfly function
        ao.ma0.op2_m1 := T(1);
        ao.ma0.op2_m2 := T(0);         
        ao.ma1.op2_m1 := T(0);
        ao.ma1.op2_m2 := T(1);
       
        -- orig. 0,1,4,5
          bufout(4) <= ao_out.ad.r_a1;        -- addition result
          bufout(5) <= ao_out.ad.r_a2;                          
          bufout(8) <= ao_out.ma0.r_mult;      -- writing result
          bufout(9) <= ao_out.ma1.r_mult;


    when s7 =>
        ao.ad.op1_s1 := regs.inputdata(2);  -- r0 = x1(2)-x2(2)
        ao.ad.op2_s1 := regs.inputdata(6);
        r0 <= ao_out.ad.r_s1;

        ao.ad.op1_s2 := regs.inputdata(3);  -- r1 = x1(3)-x2(3)
        ao.ad.op2_s2 := regs.inputdata(7);
        r1 <= ao_out.ad.r_s2;

        ao.ad.op1_a1 := regs.inputdata(2);  -- x1(2) = x1(2)+x2(2)
        ao.ad.op2_a1 := regs.inputdata(6);

          
        ao.ad.op1_a2 := regs.inputdata(3);  -- x1(3) = x1(3)+x2(3)
        ao.ad.op2_a2 := regs.inputdata(7);


        ao.ma0.add_fun := '1';           -- mul/addition
        ao.ma0.op1_m1 := r1;
        ao.ma0.op1_m2 := r0;
         

        ao.ma1.add_fun := '0';           -- mul/substraction
        ao.ma1.op1_m1 := r1;
        ao.ma1.op1_m2 := r0;

       -- adapte value according butterfly function
        ao.ma0.op2_m1 := T(5);
        ao.ma0.op2_m2 := T(4);         
        ao.ma1.op2_m1 := T(4);
        ao.ma1.op2_m2 := T(5);

        -- orig. 2,3,6,7
           bufout(6) <= ao_out.ad.r_a1;        -- addition result
           bufout(7) <= ao_out.ad.r_a2;                          
           bufout(10)<= ao_out.ma0.r_mult;      -- writing result
           bufout(11)<= ao_out.ma1.r_mult;

        
    when s8 =>      
       -- calculate next trig Depends on btf generic function
        ao.ad.act_trig := smctrl.trignext;               -- position of actual trig, in order to
                                        -- calculate final increment at s12      
        ao.ad.op1_a1 := smctrl.trig;
        ao.ad.op2_a1 := conv_std_logic_vector(-smctrl.trigint,32);
       ------------------------------------------------------------------------
    when s9 =>    
       -- calculate next trig Depends on btf generic function
        ao.ad.act_trig := smctrl.trignext;               -- position of actual trig, in order to
                                        -- calculate final increment at s12      
        ao.ad.op1_a1 := smctrl.trig;
        ao.ad.op2_a1 := conv_std_logic_vector(-smctrl.trigint,32);
       ------------------------------------------------------------------------
    when s10 =>
        ao.ad.op1_s1 := regs.inputdata(0);  -- r0 = x1(4)-x2(4)
        ao.ad.op2_s1 := regs.inputdata(4);
        r0 <= ao_out.ad.r_s1;
        
        ao.ad.op1_s2 := regs.inputdata(1);  -- r1 = x1(5)-x2(5)
        ao.ad.op2_s2 := regs.inputdata(5);
        r1 <= ao_out.ad.r_s2;

        ao.ad.op1_a1 := regs.inputdata(0);  -- x1(4) = x1(4)+x2(4)
        ao.ad.op2_a1 := regs.inputdata(4);

          
        ao.ad.op1_a2 := regs.inputdata(1);  -- x1(5) = x1(5)+x2(5)
        ao.ad.op2_a2 := regs.inputdata(5);


        ao.ma0.add_fun := '1';           -- addition
        ao.ma0.op1_m1 := r1;
        ao.ma0.op1_m2 := r0;
          

        ao.ma1.add_fun := '0';           -- substraction
        ao.ma1.op1_m1 := r1;
        ao.ma1.op1_m2 := r0;

       -- adapte value according butterfly function
        ao.ma0.op2_m1 := T(1);
        ao.ma0.op2_m2 := T(0);         
        ao.ma1.op2_m1 := T(0);
        ao.ma1.op2_m2 := T(1);

        -- orig. 0,1,4,5
          bufout(4) <= ao_out.ad.r_a1;        -- addition result
          bufout(5) <= ao_out.ad.r_a2;                          
          bufout(8)<= ao_out.ma0.r_mult;      -- writing result
          bufout(9)<= ao_out.ma1.r_mult;

        
    when s11 =>
        ao.ad.op1_s1 := regs.inputdata(2);  -- r0 = x1(6)-x2(6)
        ao.ad.op2_s1 := regs.inputdata(6);
        r0 <= ao_out.ad.r_s1;

        ao.ad.op1_s2 := regs.inputdata(3);  -- r1 = x1(7)-x2(7)
        ao.ad.op2_s2 := regs.inputdata(7);
        r1 <= ao_out.ad.r_s2;

        ao.ad.op1_a1 := regs.inputdata(2);  -- x1(6) = x1(6)+x2(6)
        ao.ad.op2_a1 := regs.inputdata(6);

          
        ao.ad.op1_a2 := regs.inputdata(3);  -- x1(7) = x1(7)+x2(7)
        ao.ad.op2_a2 := regs.inputdata(7);
        

        ao.ma0.add_fun := '1';           -- mul/addition
        ao.ma0.op1_m1 := r1;
        ao.ma0.op1_m2 := r0;
                        
        ao.ma1.add_fun := '0';           -- mul/substraction
        ao.ma1.op1_m1 := r1;
        ao.ma1.op1_m2 := r0;

        -- adapte value according butterfly function
        ao.ma0.op2_m1 := T(5);
        ao.ma0.op2_m2 := T(4);         
        ao.ma1.op2_m1 := T(4);
        ao.ma1.op2_m2 := T(5);

       -- orig. 2,3,6,7
          bufout(6) <= ao_out.ad.r_a1;        -- addition result
          bufout(7) <= ao_out.ad.r_a2;                          
          bufout(10)<= ao_out.ma0.r_mult;      -- writing result
          bufout(11)<= ao_out.ma1.r_mult;
 
        
    when s12 =>
    -- address calculation
      if smctrl.loops =0 then
        ao.ad.op1_a1 := regs.trigaddr;
        ao.ad.op1_a2 := regs.wrstartaddr;
--        ao.ad.op1_a2 := smctrl.xaddr;        
        ao.ad.op1_a3 := regs.wrstartaddr;
--        ao.ad.op1_a3 := smctrl.xaddr; 
        
      -- addresses for calling butterfly first stage
        if smctrl.btfgen='0' then
          

          if regs.size='0' then
        -- for 256 points

           ao.ad.op2_a2 := conv_std_logic_vector(736,32);         -- irfaddr incr
           ao.ad.op2_a3 := conv_std_logic_vector(608,32);         -- orfaddr incr
          -- ao.ad.op2_a3 := conv_std_logic_vector(128,32);         -- xaddr incr                                                        -- 
          else
        -- for 2048 points

            ao.ad.op2_a2 := conv_std_logic_vector(6112,32);         -- irfaddr incr
            ao.ad.op2_a3 := conv_std_logic_vector(5088,32);         -- orfaddr incr
          end if;

          ao.ad.op2_a1 := conv_std_logic_vector(96,32);         -- trig incr=32*3=trigint*3           
        else
          -- check for butterfly generic end
          -- addresses for btfgen='1'
          if regs.size='0' then
            -- initialisation for 256 points
            ao.ad.op2_a1 := conv_std_logic_vector(96,32);          -- trig inc
            if smctrl.j=1 then
            -- loop butterfly generic 256
              ao.ad.op2_a2 := conv_std_logic_vector(992,32);         -- incr irfaddr
            -- x1 = out + incr irfaddr
            -- incr = (128 + 128 - 8)*4                                                                  
              ao.ad.op2_a3 := conv_std_logic_vector(864,32);         -- incr orfaddr
            -- x2 = out + incr orfaddr
            -- incr = ((128 + 64)+32 -8)*4
            else
              --initialise butterfly 32
              ao.ad.op1_a1 := regs.wrstartaddr;
              ao.ad.op2_a1 := conv_std_logic_vector(512,32);
              -- x + n/2
            end if;
           
         else
            -- initialisation for 2048
            case smctrl.i is 
              when 1 =>
                ao.ad.op2_a1 := conv_std_logic_vector(96,32);                
                case smctrl.j is
                  when 0 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(6112,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(5088,32);         -- incr orfaddr
                  when 1 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(8160,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(7136,32);         -- incr orfaddr                                         
                  when others => null;
                end case;
              when 2 =>
                ao.ad.op2_a1 := conv_std_logic_vector(192,32);              -- trig inc  
                case smctrl.j is
                  when 0 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(5088,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(4576,32);         -- incr orfaddr
                  when 1 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(6112,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(5600,32);       -- incr orfaddr
                  when 2 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(7136,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(6624,32);         -- incr orfaddr
                  when 3 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(8160,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(7648,32);         -- incr orfaddr                                                                             -- 
                  when others => null;
                end case;
              when 3 =>
                ao.ad.op2_a1 := conv_std_logic_vector(384,32);              -- trig inc  
                case smctrl.j is
                  when 0 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(4576,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(4320,32);         -- incr orfaddr
                  when 1 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(5088,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(4832,32);       -- incr orfaddr
                  when 2 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(5600,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(5344,32);         -- incr orfaddr
                  when 3 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(6112,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(5856,32);         -- incr orfaddr
                  when 4 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(6624,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(6368,32);         -- incr orfaddr
                  when 5 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(7136,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(6880,32);       -- incr orfaddr
                  when 6 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(7648,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(7392,32);         -- incr orfaddr
                  when 7 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(8160,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(7904,32);         -- incr orfaddr                                      -- 
                  when others => null;
                end case;
              when 4 =>
                ao.ad.op2_a1 := conv_std_logic_vector(768,32);              -- trig incr
               case smctrl.j is     
                  when 0 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(4320,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(4192,32);         -- incr orfaddr
                  when 1 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(4576,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(4448,32);       -- incr orfaddr
                  when 2 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(4832,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(4704,32);         -- incr orfaddr
                  when 3 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(5088,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(4960,32);         -- incr orfaddr
                  when 4 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(5344,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(5216,32);         -- incr orfaddr
                  when 5 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(5600,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(5472,32);       -- incr orfaddr
                  when 6 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(5856,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(5728,32);         -- incr orfaddr
                  when 7 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(6112,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(5984,32);         -- incr orfaddr
                  when 8 => 
                    ao.ad.op2_a2 := conv_std_logic_vector(6368,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(6240,32);         -- incr orfaddr
                  when 9=>
                    ao.ad.op2_a2 := conv_std_logic_vector(6624,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(6496,32);       -- incr orfaddr
                  when 10=> 
                    ao.ad.op2_a2 := conv_std_logic_vector(6880,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(6752,32);         -- incr orfaddr
                  when 11=>
                    ao.ad.op2_a2 := conv_std_logic_vector(7136,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(7008,32);         -- incr orfaddr
                  when 12=> 
                    ao.ad.op2_a2 := conv_std_logic_vector(7392,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(7264,32);         -- incr orfaddr
                  when 13=>
                    ao.ad.op2_a2 := conv_std_logic_vector(7648,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(7520,32);       -- incr orfaddr
                  when 14=> 
                    ao.ad.op2_a2 := conv_std_logic_vector(7904,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(7776,32);         -- incr orfaddr
                  when 15 =>
                    ao.ad.op2_a2 := conv_std_logic_vector(8160,32);         -- incr irfaddr
                    ao.ad.op2_a3 := conv_std_logic_vector(8032,32);         -- incr orfaddr                                       
                                                                          -- 
                  when others => null;
                end case;                
-- 
              when 5 =>

                
                --initialise butterfly 32                
                ao.ad.op1_a1 := regs.wrstartaddr;
                ao.ad.op2_a1 := conv_std_logic_vector(4096,32);
              -- x + n/2                
              when others => null;
            end case;
          end if;          
        end if;                                                      -- 
      else
        -- addresses for loop btf first stage
        ao.ad.op1_a1 := smctrl.trig;
        ao.ad.op2_a1 := conv_std_logic_vector(ao_out.ad.next_trig,32);  -- incr=7*trigint
        ao.ad.op1_a2 := smctrl.irfaddr;
        ao.ad.op2_a2 := conv_std_logic_vector(-48,32);  -- decrement is 16 * 3
        ao.ad.op1_a3 := smctrl.orfaddr;
        ao.ad.op2_a3 := conv_std_logic_vector(-48,32);         
      end if;

    when others =>  null; 


  end case; -- arithmetic process

  ao_bufin <= ao;
  end process;

 -- purpose: schedules sequence of states
 -- type   : combinational
 -- inputs : dataready, smctrl
 -- outputs: smctrl, rctrl
 schedule: process (stateclk,rst)
   
   variable tmp : fsm;

--   variable split : std_logic := '0';  -- phase split signal between blocks
                                               -- btfgen distinguish between
                                               -- butterfly first stage and
                                               -- butterfly generic
   variable ctrl : ctrlregs;
 begin  -- process schedule
   if rst='0' then
     -- Internal registers reset
     smctrl.state <= s0;
     smctrl.start <= "000000";
     smctrl.trig <=  zero32;
     smctrl.irfaddr <= zero32;
     smctrl.orfaddr <= zero32;
     smctrl.loops <= 0;
     smctrl.i <= 1;
     smctrl.j <= 0;
     smctrl.btfgen <= '0';    
     smctrl.trigint <= 0;
     smctrl.trignext <= 0;
     smctrl.retstate <=  s0;

     r_ctrl.ntoprocess <= "000000";
     r_ctrl.trigpos <='0';
     r_ctrl.finish <= '1';
     r_ctrl.memwr <= '0';
     r_ctrl.incr <= '0';
     r_ctrl.pos <="00";
     r_ctrl.rcopy <= '0';
     r_ctrl.startadr <= zero32;        
     tmp.start := (others => '0');
 
   else
     tmp := smctrl;                        -- actual value of internal control registers in variable tmp

     if rising_edge(stateclk) then

       case smctrl.state is
         when s0 =>

           -- initializing addresses
           tmp.trig := ao_out.ad.r_a1;     -- initial values are given in
                                             -- arithmetic process
           tmp.irfaddr := ao_out.ad.r_a2;
           tmp.orfaddr := ao_out.ad.r_a3;
             
           if regs.size='0' then
             tmp.loops := 15;                  -- 16 cycles
           else
             tmp.loops := 127;                 -- 128 cycles
           end if;
           
           -- trig call
           ctrl.startadr := ao_out.ad.r_a1; -- tmp.trig;           
           ctrl.ntoprocess := "000100";
           tmp.start := "000100";
           ctrl.trigpos:='1';              -- Setting 16 as store position in Buffer                      
           ctrl.memwr:='0';
           -- end trig call
             
           --btfgen:='0';                    -- set butterfly to first stage
           ctrl.pos := "00";               -- initialize oofset to read/store in buffer
           ctrl.incr := '0';
           ctrl.finish := '0';             -- mdct working !
           ctrl.rcopy :='0';
           
           tmp.state:= sT;                 -- Read trig table
           tmp.retstate:=s1;               -- Return to state 1
                                       -- after returning the next block from
                                       -- irfaddr will be read !!
         when sT =>

           -- Preparing state to return

           if smctrl.retstate=s1 or smctrl.retstate=s3 then
             ctrl.incr :='1';                -- space between data eq. 8 bytes for read
           else
             ctrl.incr :='0';
           end if;
           ctrl.finish:='0';
           ctrl.trigpos:='0';
           ctrl.memwr :='0';
           ctrl.ntoprocess:=smctrl.start;
           -- Return to next state
           if smctrl.retstate=s6 or smctrl.retstate=s10  then
             ctrl.startadr := smctrl.orfaddr;
           else
             ctrl.startadr := smctrl.irfaddr;
           end if;
           tmp.state:=smctrl.retstate;           


         when s1 =>
------------------------------------------------------------
--begin  schedule premult 1
--------------------------------------------------------------
      
           -- Setting control signals for next cycle
           -- initialize write cycle
           ctrl.memwr :='1';                            -- start write cycle
           ctrl.startadr := smctrl.orfaddr;             -- write address
           ctrl.incr :='0';                             -- space between data eq. 4 bytes for write

           -- Next state
           tmp.state:=s2;
           
         when s2 =>

      -- calculate next state depending of internal registers

           if smctrl.loops=0 then
             -- initialize next state
             if regs.size='0' then
               tmp.loops:=15;
             else
               tmp.loops:=127;
             end if;
             tmp.retstate:=s3;                  -- next cycle after read trig
           else
             tmp.loops:=smctrl.loops-1;
             tmp.retstate:=s1;                  -- next cycle after read trig
           end if;
           
           tmp.trig := ao_out.ad.r_a1;          -- get new addresses from adders
           tmp.irfaddr := ao_out.ad.r_a2;
           tmp.orfaddr := ao_out.ad.r_a3;
           
           -- Preparing and calling st
           ctrl.startadr := ao_out.ad.r_a1;      -- tmp.trig;
           ctrl.trigpos :='1';
           ctrl.memwr :='0';
           
           tmp.state:= sT;                 -- Read trig table in next cycle 
                                       
         when s3 =>
------------------------------------------------------------
--begin schedule premult 2
--------------------------------------------------------------
      
           -- Setting control signals
           -- initialize write cycle
           ctrl.memwr :='1';                  -- start write cycle
           ctrl.startadr := smctrl.orfaddr;          -- write address
           ctrl.incr :='0';                   -- space between data eq. 4 bytes for write

           -- Next state
           tmp.state:=s4;

         when s4 =>
           ctrl.incr:='0';

           if smctrl.loops=0 then
        -- initialize next state
             if regs.size='0' then
          -- initialize for 256 points
               tmp.loops:=7;
             else
          -- initialize for 2048 points
               tmp.loops:=63;
             end if;

             ctrl.ntoprocess := "000010";  -- read two elements of the trig table
             tmp.retstate:=s5;
 
           else

             tmp.loops:=smctrl.loops-1;

             tmp.retstate:=s3;               -- return to s3 after read trig table
           end if;
           
           tmp.trig := ao_out.ad.r_a1;          -- get new addresses from adders
           tmp.xaddr := ao_out.ad.r_a3;  -- Base address for sucesive irf and
                                          -- orf values
           tmp.irfaddr := ao_out.ad.r_a2;
           tmp.orfaddr := ao_out.ad.r_a3;
 
           -- Preparing and calling st
           ctrl.startadr := tmp.trig;
           ctrl.trigpos :='1';
           ctrl.memwr :='0';
           tmp.trigint:=16;           
           tmp.start:="000100";         -- read four elements after returning
           tmp.state:= sT;                 -- Read trig table in next cycle
         when s5 =>
------------------------------------------------------------
--begin schedule Butterfly first stage and butterfly generic.
--------------------------------------------------------------           

           tmp.trignext:=ao_out.ad.next_trig;
           tmp.trig := ao_out.ad.r_a1;
          
           ctrl.startadr:=ao_out.ad.r_a1;
           ctrl.pos:="01";
           ctrl.trigpos :='1';           
           ctrl.ntoprocess := "000010";  -- read two elements of the trig table           
           tmp.start:="000100";         -- read four elements after returning           
           tmp.retstate:=s6;           
           tmp.state:=sT;
         when s6 =>
           ctrl.memwr:='1';           
           tmp.state:=s7;          
           ctrl.pos:="01";              -- 00
           ctrl.startadr := smctrl.irfaddr;  -- write first block
         when s7 =>
           ctrl.startadr := smctrl.orfaddr;  -- write second block
           tmp.state:=s8;
           ctrl.pos:="10";              -- 01
           tmp.irfaddr:=regs.memoryadr;  -- stores current address for the
                                         -- second block of x1
         when s8 =>

           tmp.trignext:=ao_out.ad.next_trig;
                                        -- calculate final increment at s12           
           ctrl.memwr:='0';
           tmp.trig := ao_out.ad.r_a1;
           ctrl.startadr:=ao_out.ad.r_a1;
           tmp.retstate:=s9;
           tmp.state:=sT;
           ctrl.trigpos :='1';           
           ctrl.ntoprocess := "000010";  -- read two elements of the trig table           
           tmp.start:="000100";         -- read four elements after returning
           tmp.orfaddr:=regs.memoryadr;  -- stores current address for the
                                         -- second block of x2
           ctrl.pos:="00";
           
         when s9 =>

           tmp.trignext:=ao_out.ad.next_trig;           
           tmp.trig := ao_out.ad.r_a1;
           ctrl.startadr:=ao_out.ad.r_a1;
           ctrl.pos:="01";
           ctrl.trigpos :='1';           
           ctrl.ntoprocess := "000010";  -- read two elements of the trig table           
           tmp.start:="000100";         -- read four elements after returning           
           tmp.retstate:=s10;           
           tmp.state:=sT;           
         when s10 =>
           ctrl.memwr:='1';           
           tmp.state:=s11;          
           ctrl.pos:="01";              -- 00
           ctrl.startadr := smctrl.irfaddr;           

         when s11 =>
           ctrl.startadr := smctrl.orfaddr;
           tmp.state:=s12;
           ctrl.pos:="10";              -- 01
         when s12 =>
           ctrl.memwr:='0';
           tmp.trig := ao_out.ad.r_a1;
           tmp.irfaddr := ao_out.ad.r_a2;  -- irf=xaddr+points
--           tmp.orfaddr := smctrl.xaddr;           
           tmp.orfaddr := ao_out.ad.r_a3;
           tmp.retstate:=s5;           

           if smctrl.loops=0 and smctrl.btfgen='1'then
            
             if (smctrl.j=2 and regs.size='0') or (smctrl.i=5  and regs.size='1') then
               -- butterfly first and butterfly generic completed
               tmp.state:=s0;           -- end function
               tmp.btfgen:='0';
               ctrl.startadr:= ao_out.ad.r_a1;
               ctrl.memwr:='0';
               ctrl.finish:='1';
               ctrl.ntoprocess := "000000";               
               tmp.i:=1;
               if regs.size='0' then
                 tmp.loops:=3;
               else
                 tmp.loops:=31;
               end if;
             else
               -- continue butterfly generic
               if regs.size='0' then
               -- calculate trig and loops for 256 pomits
                 tmp.j:=2;
                 tmp.loops:=3;
                 tmp.trigint:=32;
               else
               -- trig and loops for 2048
               tmp.j:=smctrl.j+1;                 
                 case smctrl.i  is
                   when 1 =>
                       tmp.trigint:=32;  --8*4
                       tmp.loops:=31;
                       tmp.i:=2;        -- next value of i
                       tmp.j:=0;
                   when 2 =>
                       
                       tmp.trigint:=64;
                       tmp.loops:=15;
                       if smctrl.j=3 then
                         tmp.i:=3;
                         tmp.j:=0;
                       end if;                       
                   when 3 =>

                       tmp.trigint:=128;
                       tmp.loops:=7;
                       if smctrl.j=7 then
                         tmp.i:=4;
                         tmp.j:=0;
                       end if;
                   when 4 =>

                       tmp.trigint:=256;
                       tmp.loops:=3;
                       if smctrl.j=15 then
                         tmp.i:=5;
                         tmp.j:=0;
                       end if;
                   when others => null;
                 end case;

               end if;
               ctrl.startadr := tmp.trig;
               ctrl.trigpos :='1';
               tmp.start:="000100";         -- read four elements after returning
               ctrl.ntoprocess := "000010";  -- read two elements of the trig table                                         
               tmp.state:= sT;                 -- Read trig table in next cycle               
             end if;
           elsif smctrl.loops=0 and smctrl.btfgen='0' then
             -- initialize and calling butterfly generic
             if regs.size='0' then
              tmp.loops:=3;             
             else
              tmp.loops:=31;
              tmp.i:=1;
             end if;
             tmp.btfgen:='1';
             tmp.j:=1;
             tmp.trigint:=32;
             ctrl.startadr := tmp.trig;
             ctrl.trigpos :='1';
             tmp.start:="000100";         -- read four elements after returning
             ctrl.ntoprocess := "000010";  -- read two elements of the trig table                                         
             tmp.state:= sT;                 -- Read trig table in next cycle            
           else
             -- loop for buttefly first stage
             tmp.loops:=smctrl.loops-1;
          
           
           -- Preparing and calling st
             ctrl.startadr := tmp.trig;
             ctrl.trigpos :='1';

             tmp.start:="000100";         -- read four elements after returning
             ctrl.ntoprocess := "000010";  -- read two elements of the trig table                                         
             tmp.state:= sT;                 -- Read trig table in next cycle
           end if;
           ctrl.memwr :='0';
           ctrl.pos:="00";           

         when others => null;
       end case;
       
       smctrl <= tmp;                   -- update internal and exernal control
                                        -- signals with positiv flank of
                                        -- stateclk signal                            
       r_ctrl <= ctrl;
       
     end if;                            -- rising edge of stateclk
   end if;                           -- reset
  
 end process schedule;

  
-- Concurrent process
m1:r64_1 <= ao_in.ma0.op1_m1 * ao_in.ma0.op2_m1;
m2:r64_2 <= ao_in.ma0.op1_m2 * ao_in.ma0.op2_m2;
m3:r64_3 <= ao_in.ma1.op1_m1 * ao_in.ma1.op2_m1;
m4:r64_4 <= ao_in.ma1.op1_m2 * ao_in.ma1.op2_m2;

ao_out.ma0.r_m1 <= MULT_NORM(r64_1);
ao_out.ma0.r_m2 <= MULT_NORM(r64_2);
ao_out.ma1.r_m1 <= MULT_NORM(r64_3);
ao_out.ma1.r_m2 <= MULT_NORM(r64_4);  

with ao_in.ma0.add_fun select
  ao_out.ma0.r_mult <= MULT_NORM(r64_1 + r64_2) when '1',
                       MULT_NORM(r64_1 - r64_2) when '0',
                       zero32 when others;
  
with ao_in.ma1.add_fun select  
  ao_out.ma1.r_mult <= MULT_NORM(r64_3 + r64_4) when '1',
                       MULT_NORM(r64_3 - r64_4) when '0',
                       zero32 when others;

-- state clock generator
with regs.ready select
  stateclk <=
  regs.mdctenreq when '1', 
  dataready      when others;

  
add1: ao_out.ad.r_a1 <= ao_in.ad.op1_a1 + ao_in.ad.op2_a1;
add2: ao_out.ad.r_a2 <= ao_in.ad.op1_a2 + ao_in.ad.op2_a2;
add3: ao_out.ad.r_a3 <= ao_in.ad.op1_a3 + ao_in.ad.op2_a3;
sub1: ao_out.ad.r_s1 <= ao_in.ad.op1_s1 - ao_in.ad.op2_s1;  
sub2: ao_out.ad.r_s2 <= ao_in.ad.op1_s2 - ao_in.ad.op2_s2;
sub3: ao_out.ad.r_s3 <= ao_in.ad.op1_s3 - ao_in.ad.op2_s3;
trig_calc: ao_out.ad.next_trig <=  ao_in.ad.act_trig + smctrl.trigint;
end;

