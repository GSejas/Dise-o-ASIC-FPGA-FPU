 
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
--              LSB bits: mdctenreq,irqen,irq
--	   Vector size         0x80000304
--	   Read Start address  0x80000308
--	   Write Start address 0x8000030c
-- Outputs:Status register     0x80000310
--              LSB bits: ready-busy,writting-reading
--	   Current Memory address 0x80000314	
-- --------------------------------------------------------------------------
-- Version
-- --------------------------------------------------------------------------
-- 0.1	   Dummy version. Only AMBA communication activated. Only one address
--	   06.03.02
-- 0.2     Process an array of n elemnts. 
--         12.03.02
-- 0.3     New addresses and bugs with hready fixed 
--         26.03.02
-- 0.4     Function is now a 8 points butterfly
--	   27.03.02
-- 0.6     Multiplicators added. Function is 16 points Butterfly
--         14.04.02
-- 0.7     Using butterfly 32 as test module. "Always enabled " Bug by starting up fixed.
-- 0.8     Control unit added
--         25.04.02
-- 0.9     added premult 1,premult 2, butterfly first satage & butterfly generic 
--         1.05.02
-- 1.0     bit reverse, and post multiplication added. Control signals added.
--         5.05.02
-- 1.1     all functions tested individually. Simulation using Leon2
--         13.05.02
-- 1.2     Test functions together using only in data addresses. State s1 reformated.
-- 1.3     First complete system tested, with real values. Still some errors in
--         first and last cycles of bit reverse and rotate.
-- 1.4     Butterfly 32 component eliminated.
-- 1.5     Test for 256 passed. First candidate to synthesize
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
use IEEE.std_logic_unsigned."+";
use IEEE.std_logic_unsigned."-";
use IEEE.std_logic_unsigned.CONV_INTEGER;
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
        ctrl: out ctrlregs;
        dataready : in std_logic;
        dataout : out block32_data               
         );
end component;


signal r,rin : mdctregs;                -- status signals to control unit 
signal ctrlcon : ctrlregs;              -- control signals comming from control unit
signal dataready :  std_logic;          -- active when a data block is read
signal dmaoutdata : block32_data;       -- output buffer

begin
  
  mdcttop : process(rst,r,apbi, ahbi,ctrlcon,dmaoutdata)
  variable rdata : std_logic_vector(31 downto 0);
  variable tmp: mdctregs;

 
  -- amba ahb variables
  variable haddr   : std_logic_vector(31 downto 0);   -- address bus
  variable htrans  : std_logic_vector(1 downto 0);    -- transfer type 
  variable hwrite  : std_logic;  		      -- read/write
  variable hsize   : std_logic_vector(2 downto 0);    -- transfer size
  variable hburst  : std_logic_vector(2 downto 0);    -- burst type
  variable hwdata  : std_logic_vector(31 downto 0);   -- write data
  variable hbusreq : std_logic;      -- bus request
  variable bindex,offset : integer; -- index of the current buffer block
                                    -- place to store/read on buffers


  begin

  -- init
  tmp:=r;

  htrans := HTRANS_IDLE; -- do nothing if granted without request
  hbusreq := '0';
  -- read/write memory mapped registers witch amba apb bus

  rdata := (others => '0');             -- init
  case apbi.paddr(4 downto 2) is
    when "000" =>
      rdata(0) := r.mdcten or r.mdctenreq;
      rdata(1) := r.irqen;
      rdata(2) := r.irq;
    when "001" =>
      rdata(0):= r.size;
    when "010" =>
      rdata    := r.rdstartaddr;
    when "011" =>
      rdata    := r.wrstartaddr;
    when "100" =>
      rdata(0) := r.ready;
      rdata(1) := r.memwr;    
    when "101" =>
      rdata    := r.memoryadr;
    when others => null;
  end case;
  if (apbi.psel and apbi.penable and apbi.pwrite) = '1' then
    case apbi.paddr(4 downto 2) is
      when "000" =>
        tmp.mdctenreq := apbi.pwdata(0);
        tmp.irqen    := apbi.pwdata(1);
        if apbi.pwdata(2)='0' then      -- allow only interrupt reset
          tmp.irq    := '0';
        end if;
        if tmp.mdctenreq='1' and r.mdctenreq='0' and r.ready = '1' then -- init mdct transaction if enabled and ready

          tmp.mdcten := '1'; -- enable mdct
          tmp.memoryadr := ctrlcon.startadr; -- initialize value for actual read address	       
          tmp.memwr := '0';          -- start read cycle
          tmp.ready := '0';          -- mdct core is working now
          tmp.dmatransfreq := '1';				-- start dma read transfer
        end if;
      when "001" =>

        tmp.size := apbi.pwdata(0);
      when "010" =>
        tmp.rdstartaddr := apbi.pwdata;
      when "011" =>
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
  else
    tmp.busact := '0';                  -- bus granted but not requested
  end if;

  if (tmp.busact = '1') and (ahbi.hready= '1') then -- bus active 
    tmp.busown:='1';                     -- bus owner at next clock
    tmp.dmatransfreq := '0';
  end if;


  -- control and address cycle of ahb transfer
  
  if r.busown='1' then

    hsize := HSIZE_WORD;
--    hburst := HBURST_SINGLE;
    hburst := HBURST_INCR;
   
--  htrans := HTRANS_NONSEQ;
    htrans := HTRANS_SEQ;
    if r.memwr = '1'then
      hwrite := '1';
    else
      hwrite := '0';
    end if;
    haddr := r.memoryadr; -- set next  address
    if ahbi.hready='1' then  -- check for data cycle
      tmp.busown:='0';
      tmp.busown2cyc:='1';
    end if;
  end if;

  -- data cycle of ahb transfer
  bindex:= CONV_INTEGER (tmp.ntoprocess);
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
if r.busown2cyc='1' and r.mdcten = '1' then

  if ahbi.hready='1' then
    tmp.busown:='0';
    tmp.busown2cyc:='0';

    if r.memwr ='0'  then 
      if bindex >0 then
        tmp.inputdata(CONV_INTEGER(ctrlcon.ntoprocess)-bindex+offset) := ahbi.hrdata;     -- loads data from bus
      end if;

    end if;
 
    if r.memwr = '1' then  
       if bindex>0 then 
         hwdata:=dmaoutdata(CONV_INTEGER(ctrlcon.ntoprocess)-bindex+offset) ;				-- throw result to bus
       end if;   
    end if;
    tmp.ntoprocess := r.ntoprocess-1;   -- one element was already read
    if ctrlcon.incr='0' then
      tmp.memoryadr:=r.memoryadr+4; -- adjust next read address (one word)
    elsif ctrlcon.incr='1' then                              
      tmp.memoryadr:=r.memoryadr+8; -- adjust next read address (two words)       
    end if;

   end if;

  end if;



  -- check for mdct action end

  if r.ntoprocess = "000000" then  -- all elements in array were processed
     dataready <= '1';             -- says to the control unit the data are there
     tmp.dmatransfreq := '0';         -- no request for the bus
  else
     dataready <= '0';     
     tmp.dmatransfreq := '1';         -- request for the bus

  end if;
 
-- mdct action ended
  if rising_edge(ctrlcon.finish) then
    tmp.ready:='1';
    tmp.mdcten:='0';
    tmp.mdctenreq := '0';
    tmp.irq := r.irqen;           -- request interruption if it is enabled
    tmp.dmatransfreq := '0';
  end if;

-- reset operation of mdct-module

  if rst = '0' then
    tmp.inputdata := (others => zero32);
    tmp.rdstartaddr := (others => '0');
    tmp.size := '0';
    tmp.ntoprocess := (others => '0');
    tmp.wrstartaddr := (others => '0');
    tmp.memoryadr := (others => '0');
    tmp.mdcten := '0';
    tmp.mdctenreq := '0';
    tmp.dmatransfreq := '0';
    tmp.ready :='1';
    tmp.memwr := '0';
    tmp.irqen := '0';
    tmp.irq := '0';
    tmp.busown := '0';
    tmp.busown2cyc := '0';
    tmp.busact := '0';
    hwrite := '0';
    bindex:=0;
  end if;

 -- use control register to manage next action


  if dataready='1' and r.mdcten='1' then
     tmp.ntoprocess := ctrlcon.ntoprocess;
     tmp.memoryadr := ctrlcon.startadr;

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
  ahbo.hwrite <= hwrite;
  ahbo.hsize <= hsize;
  ahbo.hburst <= hburst;
  ahbo.hprot <= (others => '0');


  end process;

  -- updating data with clock signals

	update : process (clk)
	begin
		if rising_edge(clk) then
			r<=rin;
		end if;
	end process;

   

cu: mdctctrl
  port map (
       rst => rst,
       clk => clk,
       regs => r,
       ctrl => ctrlcon,
       dataready => dataready,
       dataout => dmaoutdata
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
use IEEE.std_logic_unsigned."+";
use IEEE.std_logic_unsigned."-";
use IEEE.std_logic_signed.CONV_INTEGER;
use IEEE.std_logic_arith.all;
-- pragma translate_off
use std.textio.all;
-- pragma translate_on
use work.mdctlib.all;
use work.mdctrom256.all;

entity mdctctrl is
   port (
        rst : in std_logic;
        clk : in std_logic;
        regs: in mdctregs;
        ctrl: out ctrlregs;
        dataready : in std_logic;
        dataout : out block32_data
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



constant s0: std_logic_vector (4 downto 0) := "00000";
constant s1: std_logic_vector (4 downto 0) := "00001";
constant s2: std_logic_vector (4 downto 0) := "00011";
constant s3: std_logic_vector (4 downto 0) := "00010";
constant s4: std_logic_vector (4 downto 0) := "00110";
constant s5: std_logic_vector (4 downto 0) := "10110";
constant s6: std_logic_vector (4 downto 0) := "11110";
constant s7: std_logic_vector (4 downto 0) := "11100";
constant s8: std_logic_vector (4 downto 0) := "10100";
constant s9: std_logic_vector (4 downto 0) := "10000";

type state_signals is array (0 to 9) of std_logic;
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

type fsm is record
  state : std_logic_vector(4 downto 0);
  substate : std_logic_vector (4 downto 0);
  start: state_signals;
end record;

signal smctrl,in_ctrl : fsm;          
signal ma0,ma1 : ma_ports;
signal ad : ad_ports;
signal r0,r1,r2,r3 : std_logic_vector(31 downto 0):=zero32;  -- auxiliar registers

begin

    clkupdate: process (clk)

    begin
-- reset for control unit
     if clk'event and clk = '1' then
       smctrl <= in_ctrl;  -- udate synchronously the machine
     end if;


    end process; --rstclk

    ctrl_p: process(rst,regs,dataready,smctrl,ad,r0,r1,r2,r3)
      
--    variable act : ctrlregs;
    variable tmp : fsm;

    variable xaddr,irfaddr,orfaddr,w0,w1: std_logic_vector(31 downto 0);  
                                        -- input and output reference addresses
    variable loops,trig,trigint,i,j,stages,bitrf : integer := 0;      -- cycle loops

    variable split,btfgen : std_logic := '0';  -- phase split signal between blocks
                                               -- btfgen distinguish between
                                               -- butterfly first stage and
                                               -- butterfly generic
-- pragma translate_off
    file mdctresult : text is out "./mdctresult.txt";
    variable text_line : line;
-- pragma translate_on
    
    begin
--*************************
--finite state machine
--*************************
  tmp := smctrl;               -- actual value of internal control registers in variable tmp

  case smctrl.state is
 
    when s0 =>
-- waiting state for start signal
 

      if regs.mdctenreq ='1' then  -- first action by request
        if regs.size='0' then
          irfaddr := regs.rdstartaddr+484;  -- initialization for 256 points ix=in+n2-7
          orfaddr := regs.wrstartaddr+752;  -- ox=out+n2+n4-32=768-4*4
          trig := 64;                   -- trig is not in bytes but in words !!
          loops := 15;                  -- 16 cycles
          stages:=1;
        else
          irfaddr := regs.rdstartaddr+4068;  -- initialization for 256 points ix=in+n2-7
          orfaddr := regs.wrstartaddr+6128;  -- ox=out+n2+n4-16
          trig := 512;
          loops := 127;                 -- 128 cycles
          stages:= 4;
        end if;
        tmp.state:= s1;                 -- start preprocess
        
        tmp.substate:=s0;               -- initialize sub-stage
        btfgen:='0';                    -- set butterfly to first stage
        ctrl.pos <= "00";               -- initialize oofset to read/store in buffer
        ctrl.finish <= '0';             -- mdct working !
      end if;

    when s1 =>
--****************************
--begin state 1 premult 1
--***************************
      
-- starting process

-- read process
      if falling_edge(regs.memwr) or regs.mdctenreq='1'  then
        ctrl.ntoprocess <= "000100";    -- read first four elements
        ctrl.incr <='1';                -- space between data eq. 8 bytes for read
        ctrl.startadr <= irfaddr;        -- set ix 
      end if;
    
      case smctrl.substate is
        when s0 =>      
          if falling_edge(regs.ntoprocess(1)) then
            tmp.substate := s1;             -- next sub cycle        
          end if;
          
          ma0.i.add_fun <= '0';
          ma0.i.op1_m1 <= zero32 - regs.inputdata(1);
          ma0.i.op2_m1 <= T(trig+3);
          ma0.i.op1_m2 <= regs.inputdata(0);
          ma0.i.op2_m2 <= T(trig+2);

          ma1.i.add_fun <= '0';
          ma1.i.op1_m1 <= regs.inputdata(0);
          ma1.i.op2_m1 <= T(trig+3);
          ma1.i.op1_m2 <= regs.inputdata(1);
          ma1.i.op2_m2 <= T(trig+2);

          dataout(0)<= ma0.o.r_mult;
          dataout(1)<= ma1.o.r_mult;
         
        when s1 =>
          if rising_edge(dataready) and regs.memwr='0'  then 
        -- initialize write cycle
            ctrl.memwr <='1';                  -- start write cycle
            ctrl.startadr <= orfaddr;          --regs.
            ctrl.incr <='0';                -- space between data eq. 4 bytes for write           
          end if;

          if rising_edge(dataready) and regs.memwr='1' then
            if loops=0 then
       -- initialize next state
              if regs.size='0' then
                irfaddr := regs.rdstartaddr+480;  -- initialization for 256 points ix=in+n2-8
                orfaddr := regs.wrstartaddr+768;  -- ox=out+n2+n4-32=768
                trig := 60;                   -- trig is not in bytes but in words !!
                loops := 15;                  -- 16 cycles
              else
                irfaddr := regs.rdstartaddr+4064;  -- initialization for 256 points ix=in+n2-7
                orfaddr := regs.wrstartaddr+6144;  -- ox=out+n2+n4
                trig := 508;
                loops := 127;                 -- 128 cycles
              end if;
              tmp.state:= s2;                 -- start next state
              tmp.substate:=s0;               -- initialize sub-stage
              ctrl.memwr <='0';                -- starting reading cycle for next state
              ctrl.startadr <= irfaddr;        -- set ix
            else
              orfaddr := orfaddr - 16;
              irfaddr := irfaddr - 32;
              trig := trig + 4;                -- Trig is not in bytes but in words !!!
              ctrl.memwr <= '0';                -- next read
              loops := loops - 1;
              ctrl.startadr <= irfaddr;        -- update next read address       
              tmp.substate := s0;              -- starting first multiplication
            end if;
          end if;
          ma0.i.add_fun <= '0';
          ma0.i.op1_m1 <= zero32 - regs.inputdata(3);
          ma0.i.op2_m1 <= T(trig+1);
          ma0.i.op1_m2 <= regs.inputdata(2);
          ma0.i.op2_m2 <= T(trig);

          ma1.i.add_fun <= '0';
          ma1.i.op1_m1 <= regs.inputdata(2);
          ma1.i.op2_m1 <= T(trig+1);
          ma1.i.op1_m2 <= regs.inputdata(3);
          ma1.i.op2_m2 <= T(trig);

          dataout(2)<= ma0.o.r_mult;      -- writing result
          dataout(3)<= ma1.o.r_mult;

        when others => null;
      end case;

--*****************************
--end state 1
--*****************************
    when s2 =>
--****************************
--begin state 2 premult 2
--***************************
      
-- starting process

-- read process
      if falling_edge(regs.memwr) or rising_edge(smctrl.state(1))  then
        ctrl.ntoprocess <= "000100";    -- read first four elements
        ctrl.incr <='1';                -- space between data eq. 8 bytes
        ctrl.startadr <= irfaddr;        -- set ix 
      end if;

      case smctrl.substate is                   
        when s0 =>
          if falling_edge(regs.ntoprocess(1)) then
            tmp.substate := s1;             -- next sub cycle        
          end if;
      
        ma0.i.add_fun <= '1';           -- addition
        ma0.i.op1_m1 <= regs.inputdata(0);
        ma0.i.op2_m1 <= T(trig+1);
        ma0.i.op1_m2 <= regs.inputdata(1);
        ma0.i.op2_m2 <= T(trig);

        ma1.i.add_fun <= '0';           -- substraction
        ma1.i.op1_m1 <= regs.inputdata(0);
        ma1.i.op2_m1 <= T(trig);
        ma1.i.op1_m2 <= regs.inputdata(1);
        ma1.i.op2_m2 <= T(trig+1);

        dataout(2)<= ma0.o.r_mult;      -- writing result
        dataout(3)<= ma1.o.r_mult;

        when s1 =>
          if rising_edge(dataready) and regs.memwr='0'  then 
        -- initialize write cycle
            ctrl.memwr <='1';                  -- start write cycle
            ctrl.startadr <= orfaddr;          --regs.
            ctrl.incr <='0';                -- space between data eq. 4 bytes for write              
          end if;
          if rising_edge(dataready) and regs.memwr='1' then
            if loops=0 then
              ctrl.ntoprocess <= "000000";       -- process no data
              ctrl.memwr <= '0';

              -- initialize and call next state

              if regs.size='0' then
                loops:=7;                       -- initialize for 256 points
                irfaddr:=regs.wrstartaddr+992;  -- x1=out+(256/2+256/2-8)*4
                orfaddr:=regs.wrstartaddr+736;  -- x2=out+(256/2+256/4-8)*4

                trig:=0;
              else
                loops:=63;                       -- initialize for 256 points
                irfaddr:=regs.wrstartaddr+8160;  -- x1=out+(2048/2+2048/2-8)*4
                orfaddr:=regs.wrstartaddr+6112;  -- x2=out+(2048/2+2048/4-8)*4         
              end if;
              trig:=0;
              ctrl.startadr <= irfaddr;       -- set x1
              tmp.state:= s3;                 -- calling s3
              tmp.substate:=s0;               -- initialize substate for next state
            else
              orfaddr := orfaddr + 16;
              irfaddr := irfaddr - 32;
              trig := trig - 4;                -- Trig is not in bytes but in words !!!
              ctrl.memwr <= '0';                -- next read
              loops := loops - 1;
              ctrl.startadr <= irfaddr;        -- update next read address       
              tmp.substate := s0;              -- starting first multiplication
            end if;
  
          end if;
          ma0.i.add_fun <= '1';           -- addition
          ma0.i.op1_m1 <= regs.inputdata(2);
          ma0.i.op2_m1 <= T(trig+3);
          ma0.i.op1_m2 <= regs.inputdata(3);
          ma0.i.op2_m2 <= T(trig+2);

          ma1.i.add_fun <= '0';           -- substraction
          ma1.i.op1_m1 <= regs.inputdata(2);
          ma1.i.op2_m1 <= T(trig+2);
          ma1.i.op1_m2 <= regs.inputdata(3);
          ma1.i.op2_m2 <= T(trig+3);

          dataout(0)<= ma0.o.r_mult;
          dataout(1)<= ma1.o.r_mult;
      
        when others => null;
      end case;
                                       
-- end action

--*****************************
--end state 2
--*****************************
    when s3 =>
--****************************
--begin state 3 butterfly_first and butterfly generic
--***************************

-- read process
      if falling_edge(smctrl.state(0)) or falling_edge(smctrl.substate(1)) then

        ctrl.ntoprocess <= "000100";    -- read first four elements
        ctrl.incr <='0';                -- space between data eq. 4 bytes

        ctrl.pos <="00";                -- set offset of the block
        split := '0';
 
      end if;
    
    case smctrl.substate is

      when s0 =>

        if rising_edge(dataready) and split ='0'  then 

          ctrl.ntoprocess <= "000100";    -- read second block of four
                                          -- elements X2
          ctrl.incr <='0';                -- space between data eq. 4 bytes
          ctrl.startadr <= orfaddr;       -- set x2
          ctrl.memwr <='0';               -- read cycle
          ctrl.pos <="01";                -- set write at 4th position in buffer
          split := '1';                   -- mark second part of read cycle 
       
        end if;
          
        if falling_edge(regs.ntoprocess(1)) and split ='1' then
          tmp.substate := s1;             -- next sub cycle
          if btfgen='1' then
            trig:=trig - trigint;
          end if;
        end if;

        ad.i.op1_s1 <= regs.inputdata(0);  -- r0 = x1(0)-x2(0)
        ad.i.op2_s1 <= regs.inputdata(4);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(1);  -- r1 = x1(1)-x2(1)
        ad.i.op2_s2 <= regs.inputdata(5);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(0);  -- x1(0) = x1(0)+x2(0)
        ad.i.op2_a1 <= regs.inputdata(4);

          
        ad.i.op1_a2 <= regs.inputdata(1);  -- x1(1) = x1(1)+x2(1)
        ad.i.op2_a2 <= regs.inputdata(5);


        ma0.i.add_fun <= '1';           -- addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op1_m2 <= r0;

        ma1.i.add_fun <= '0';           -- substraction
        ma1.i.op1_m1 <= r1;
        ma1.i.op1_m2 <= r0;

        if btfgen='0' then              -- adapte value according butterfly function
          ma0.i.op2_m1 <= T(trig+13);
          ma0.i.op2_m2 <= T(trig+12);         
          ma1.i.op2_m1 <= T(trig+12);
          ma1.i.op2_m2 <= T(trig+13);
        else
          ma0.i.op2_m1 <= T(trig+1);
          ma0.i.op2_m2 <= T(trig);         
          ma1.i.op2_m1 <= T(trig);
          ma1.i.op2_m2 <= T(trig+1);          
        end if;
        
        dataout(0) <= ad.o.r_a1;        -- addition result
        dataout(1) <= ad.o.r_a2;                          
        dataout(4)<= ma0.o.r_mult;      -- writing result
        dataout(5)<= ma1.o.r_mult;
          
      when s1 =>


        if dataready='1' and regs.memwr='0'  then
          tmp.start(3) := '1';           -- signalize  write cycle for first block
          ctrl.startadr <= irfaddr;      -- address of x1 to write;
          ctrl.memwr <='1';              -- write cycle
          split:='0';                    -- disable distinguish signal
        end if;


        
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(4) ='0' then
          tmp.start(4) := '1';           -- signalize  write cycle for second block
          ctrl.startadr <= orfaddr;      -- address of x2 to write
        end if;
        
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(4) ='1' then
          tmp.substate := s2;           -- state completed
          tmp.start(4):= '0';
          tmp.start(3):='0';
          --initialize next state
          ctrl.ntoprocess <= "000100";    -- read third block four elements
          ctrl.incr <='0';                -- space between data eq. 4 bytes
          ctrl.memwr <= '0';
          ctrl.startadr <= irfaddr+16;    -- set  next 4 elements of x1
          ctrl.pos <="00";                -- set offset of the block
          split := '0';
          if btfgen='1' then
            trig:= trig - trigint;
          end if;
        end if;
        
-- waiting for first block result and start write cycle
      if rising_edge(smctrl.start(3))  then
        ctrl.memwr <='1';                  -- start write cycle
        ctrl.ntoprocess <= "000100";       -- write first 4 elements x1
        ctrl.incr <='0';                   -- space between data eq. 4 bytes
        ctrl.pos <="00";
      end if;
        
-- waiting for second block result and start write cycle
      if rising_edge(smctrl.start(4))  then
        ctrl.memwr <='1';                  -- start write cycle
        ctrl.ntoprocess <= "000100";       -- write first 4 elements x2
        ctrl.incr <='0';                   -- space between data eq. 4 bytes
        ctrl.pos <="01";                   -- read buffer from position 4
      end if;

        
        ad.i.op1_s1 <= regs.inputdata(2);  -- r0 = x1(2)-x2(2)
        ad.i.op2_s1 <= regs.inputdata(6);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(3);  -- r1 = x1(3)-x2(3)
        ad.i.op2_s2 <= regs.inputdata(7);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(2);  -- x1(2) = x1(2)+x2(2)
        ad.i.op2_a1 <= regs.inputdata(6);

          
        ad.i.op1_a2 <= regs.inputdata(3);  -- x1(3) = x1(3)+x2(3)
        ad.i.op2_a2 <= regs.inputdata(7);


        ma0.i.add_fun <= '1';           -- mul/addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op1_m2 <= r0;
         

        ma1.i.add_fun <= '0';           -- mul/substraction
        ma1.i.op1_m1 <= r1;
        ma1.i.op1_m2 <= r0;


        if btfgen='0' then              -- adapte value according butterfly function
          ma0.i.op2_m1 <= T(trig+9);
          ma0.i.op2_m2 <= T(trig+8);         
          ma1.i.op2_m1 <= T(trig+8);
          ma1.i.op2_m2 <= T(trig+9);
        else
          ma0.i.op2_m1 <= T(trig+1);
          ma0.i.op2_m2 <= T(trig);         
          ma1.i.op2_m1 <= T(trig);
          ma1.i.op2_m2 <= T(trig+1);          
        end if;
        
        dataout(2) <= ad.o.r_a1;        -- addition result
        dataout(3) <= ad.o.r_a2;                          
        dataout(6)<= ma0.o.r_mult;      -- writing result
        dataout(7)<= ma1.o.r_mult;
          
      when s2 =>
        
        if rising_edge(dataready) and split ='0'  then 

          ctrl.ntoprocess <= "000100";    -- read fourth block of four
                                          -- elements X2
          ctrl.incr <='0';                -- space between data eq. 4 bytes
          ctrl.startadr <= orfaddr+16;    -- set x2
          ctrl.memwr <='0';               -- read cycle
          ctrl.pos <="01";                -- set write at 4th position in buffer
          split := '1';                   -- mark second part of read cycle 
       
        end if;
          
        if falling_edge(regs.ntoprocess(1)) and split ='1' then
          tmp.substate := s3;             -- next sub cycle
          if btfgen='1' then
            trig:= trig - trigint;
          end if;          
        end if;

        
        ad.i.op1_s1 <= regs.inputdata(0);  -- r0 = x1(4)-x2(4)
        ad.i.op2_s1 <= regs.inputdata(4);
        r0 <= ad.o.r_s1;
        
        ad.i.op1_s2 <= regs.inputdata(1);  -- r1 = x1(5)-x2(5)
        ad.i.op2_s2 <= regs.inputdata(5);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(0);  -- x1(4) = x1(4)+x2(4)
        ad.i.op2_a1 <= regs.inputdata(4);

          
        ad.i.op1_a2 <= regs.inputdata(1);  -- x1(5) = x1(5)+x2(5)
        ad.i.op2_a2 <= regs.inputdata(5);


        ma0.i.add_fun <= '1';           -- addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op1_m2 <= r0;
          

        ma1.i.add_fun <= '0';           -- substraction
        ma1.i.op1_m1 <= r1;
        ma1.i.op1_m2 <= r0;


        if btfgen='0' then              -- adapte value according butterfly function
          ma0.i.op2_m1 <= T(trig+5);
          ma0.i.op2_m2 <= T(trig+4);         
          ma1.i.op2_m1 <= T(trig+4);
          ma1.i.op2_m2 <= T(trig+5);
        else
          ma0.i.op2_m1 <= T(trig+1);
          ma0.i.op2_m2 <= T(trig);         
          ma1.i.op2_m1 <= T(trig);
          ma1.i.op2_m2 <= T(trig+1);          
        end if;
        
        dataout(0) <= ad.o.r_a1;        -- addition result
        dataout(1) <= ad.o.r_a2;                          
        dataout(4)<= ma0.o.r_mult;      -- writing result
        dataout(5)<= ma1.o.r_mult;
          
      when s3 =>

        if dataready='1' and regs.memwr='0'  then
          tmp.start(3) := '1';           -- signalize  write cycle for first block
          ctrl.startadr <= irfaddr+16;      -- address of x1 to write
          split:='0';                    -- disable distinguish signal
          ctrl.memwr <='1';              -- write cycle          
        end if;
        
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(4)='0' then
          tmp.start(4) := '1';           -- signalize  write cycle for second block
          ctrl.startadr <= orfaddr+16;      -- address of x2 to write
        end if;
        
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(4)='1' then

          -- end action

          if loops=0 and btfgen='1' then
            if j=1 then

              -- initializing butterfly 32 for 256 points
              xaddr := regs.wrstartaddr + 512;  -- x + n2
              ctrl.startadr <= xaddr;  -- x + n2
              loops:=3;
              ctrl.ntoprocess <= "100000";  -- 32
              ctrl.pos <="00";                -- set offset of the block
              ctrl.memwr <= '0' ;             -- next read               
              tmp.state:= s4;                 -- calling butterfly 32
              tmp.start(3):='0';
              tmp.start(4):='0';
              tmp.substate:=s0;         -- start butterfly 32
            else
-- !!!!!!!!!!!!!!!!!
              loops:=3;                       -- initialize for first loop 256 points
              irfaddr:=regs.wrstartaddr+992;  -- x1=out+(128+128-8*4)
              orfaddr:=regs.wrstartaddr+864;  -- x2=out+(128+64-8)*4

 -- only for testing !! 
--        irfaddr:=regs.rdstartaddr+480;  -- x1
--        orfaddr:=regs.rdstartaddr+352;  -- x2
-- testing !!!
            j:=j+1;
            trigint:=8;
            trig:=3*trigint;
            tmp.substate:=s0;               -- start butterfly generic
            split := '0';
            tmp.start(3):='0';              -- reset start signals
            tmp.start(4):='0';            
          --initialize next state
            ctrl.ntoprocess <= "000000";    -- read first block four elements
              -- stop until restart
            ctrl.incr <='0';                -- space between data eq. 4 bytes
            ctrl.startadr <= irfaddr;       -- set x1
            ctrl.pos <="00";                -- set offset of the block
            ctrl.memwr <= '0' ;             -- next read
            end if;
-- initialization only for 256 points
-- !!!!!!!!!!!!!!!!!
          elsif loops=0 and btfgen='0' then
            btfgen:='1';
       -- initialize and call butterfly generic
            j:=0;
            if regs.size='0' then
              loops:=3;                       -- initialize for first loop 256 points
              irfaddr:=regs.wrstartaddr+736;  -- x1=out+(128+128-8)*4
              orfaddr:=regs.wrstartaddr+608;  -- x2=out+(128+64-8)*4
            else
              loops:=63;                       -- initialize for 2048 points
              irfaddr:=regs.wrstartaddr+8160;  -- x1=out+
              orfaddr:=regs.wrstartaddr+6112;  -- x2=out+         
            end if;

            trigint:=8;
            trig:=3*trigint;
            tmp.substate:=s0;               -- start butterfly generic
            split := '0';
            tmp.start(3):='0';              -- reset start signals
            tmp.start(4):='0';            
          --initialize next state
            ctrl.ntoprocess <= "000100";    -- read first block four elements
            ctrl.incr <='0';                -- space between data eq. 4 bytes
            ctrl.startadr <= irfaddr;       -- set x1
            ctrl.pos <="00";                -- set offset of the block
            ctrl.memwr <= '0' ;             -- next read

          else

            orfaddr := orfaddr - 32;
            irfaddr := irfaddr - 32;
            if btfgen='1' then
              trig := trig + 7*trigint;
            else
              trig := trig + 16;              -- Trig is not in bytes but in words !!!
            end if;
            loops := loops - 1;
            split := '0';
            tmp.substate := s0;             -- starting again state 3
            tmp.start(3):='0';              -- reset start signals
            tmp.start(4):='0';            
          --initialize next state
            ctrl.ntoprocess <= "000100";    -- read first block four elements
            ctrl.incr <='0';                -- space between data eq. 4 bytes
            ctrl.startadr <= irfaddr;       -- set x1
            ctrl.pos <="00";                -- set offset of the block
            ctrl.memwr <= '0' ;             -- next read

          end if;

        end if;
        
-- waiting for first block result and start write cycle
      if rising_edge(smctrl.start(3))  then
        ctrl.memwr <='1';                  -- start write cycle
        ctrl.ntoprocess <= "000100";       -- write first 4 elements x1
        ctrl.incr <='0';                   -- space between data eq. 4 bytes
        ctrl.pos <="00";
      end if;
        
-- waiting for second block result and start write cycle
      if rising_edge(smctrl.start(4))  then
        ctrl.memwr <='1';                  -- start write cycle
        ctrl.ntoprocess <= "000100";       -- write first 4 elements x1
        ctrl.incr <='0';                   -- space between data eq. 4 bytes
        ctrl.pos <="01";                   -- read buffer from position 4

      end if;
        
        ad.i.op1_s1 <= regs.inputdata(2);  -- r0 = x1(6)-x2(6)
        ad.i.op2_s1 <= regs.inputdata(6);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(3);  -- r1 = x1(7)-x2(7)
        ad.i.op2_s2 <= regs.inputdata(7);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(2);  -- x1(6) = x1(6)+x2(6)
        ad.i.op2_a1 <= regs.inputdata(6);

          
        ad.i.op1_a2 <= regs.inputdata(3);  -- x1(7) = x1(7)+x2(7)
        ad.i.op2_a2 <= regs.inputdata(7);
        

        ma0.i.add_fun <= '1';           -- mul/addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op2_m1 <= T(trig+1);
        ma0.i.op1_m2 <= r0;
        ma0.i.op2_m2 <= T(trig);          

        ma1.i.add_fun <= '0';           -- mul/substraction
        ma1.i.op1_m1 <= r1;
        ma1.i.op2_m1 <= T(trig);
        ma1.i.op1_m2 <= r0;
        ma1.i.op2_m2 <= T(trig+1);

        
        dataout(2) <= ad.o.r_a1;        -- addition result
        dataout(3) <= ad.o.r_a2;                          
        dataout(6)<= ma0.o.r_mult;      -- writing result
        dataout(7)<= ma1.o.r_mult;
          
      when others => null;
    end case;

--*****************************
--end state 3
--*****************************
  when s4 =>
--*****************************
--begin state 4  butterfly32
--*****************************


    if rising_edge(dataready) and regs.memwr='1'  then
      if loops=0 then

       ctrl.ntoprocess <= "000000";       -- process no data
       ctrl.memwr <='0';                -- read cycle for next state
       split:='0';                      -- initialize for next cycle
       ctrl.rcopy <= '0';               -- reset copy signal
       tmp.state:= s6;                     -- start bit reverse
       tmp.substate:=s0;                -- starting substate for next state

--       
       -- initialize next state
       -- testing bit reverse and rotate
       -- this part should be in the state before bit reverse!!
        loops:=15;
        trig:=256;

        xaddr:=regs.wrstartaddr;        -- write address
       
        w0:= xaddr;
        w1:= w0 + 512;                  -- w0 + 128*4
        xaddr:=w1;
        w1 := w1 - 16;
        -- initialize x0,x1 for the first loop
        irfaddr := xaddr + bitrev(bitrf);    -- x(0)=x+bit(0)
        orfaddr := xaddr + bitrev(bitrf+1);  -- x(1)=x+bit(1)
        ctrl.startadr <= irfaddr;       -- set x0
       -- end test       
       else
         xaddr:=xaddr + 128;
         loops:=loops-1;
         ctrl.startadr <= xaddr;        -- update next block of 32
         ctrl.memwr <= '0';             -- read again
         ctrl.ntoprocess <= "100000";   -- process the next block
         ctrl.rcopy <= '0';             -- disable result copy
         split:='0';
         tmp.substate:=s0;
       end if;
       split:='0';
      end if;

-- Operation selector
      if regs.ntoprocess(4)='0'and regs.memwr='0' then
        case regs.ntoprocess(3 downto 0) is
          when "1101" =>
            tmp.substate:=s1;
          when "1011" =>
            tmp.substate:=s2;
          when "1001" =>
            tmp.substate:=s3;
          when "0111" =>
            tmp.substate:=s4;
          when "0101" =>
            tmp.substate:=s5;
          when "0011" =>
            tmp.substate:=s6;
          when "0001" =>
            tmp.substate:=s7;        
          when others => null;
        end case;
      end if;
   
    ---------------------------------------------------------------------------
    --state machine for butterflies
    ---------------------------------------------------------------------------

    case smctrl.substate is
      when s0 =>

        ad.i.op1_s1 <= regs.inputdata(0);  -- r0 = x(0)-x(16)
        ad.i.op2_s1 <= regs.inputdata(16);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(1);  -- r1 = x(1)-x(17)
        ad.i.op2_s2 <= regs.inputdata(17);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(16);  -- x(16) = x(16)+x(0)
        ad.i.op2_a1 <= regs.inputdata(0);
        dataout(16) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(17);  -- x(17) = x(17)+x(1)
        ad.i.op2_a2 <= regs.inputdata(1);
        dataout(17) <= ad.o.r_a2;          

        ma0.i.add_fun <= '1';           -- mul/addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op2_m1 <= cPI3_8;
        ma0.i.op1_m2 <= r0;
        ma0.i.op2_m2 <= cPI1_8;          
        dataout(0)<= ma0.o.r_mult;      -- writing result
        
        ma1.i.add_fun <= '0';           -- mul/substraction
        ma1.i.op1_m1 <= r1;
        ma1.i.op2_m1 <= cPI1_8;
        ma1.i.op1_m2 <= r0;
        ma1.i.op2_m2 <= cPI3_8;
        dataout(1)<= ma1.o.r_mult;
        
       when s1 =>
        ad.i.op1_s1 <= regs.inputdata(2);  -- r0 = x(2)-x(18)
        ad.i.op2_s1 <= regs.inputdata(18);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(3);  -- r1 = x(3)-x(19)
        ad.i.op2_s2 <= regs.inputdata(19);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(18);  -- x(18) = x(18)+x(2)
        ad.i.op2_a1 <= regs.inputdata(2);
        dataout(18) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(19);  -- x(19) = x(19)+x(3)
        ad.i.op2_a2 <= regs.inputdata(3);
        dataout(19) <= ad.o.r_a2;          

        ad.i.op1_a3 <= r1;                  -- r1 + r0
        ad.i.op2_a3 <= r0;       

        ad.i.op1_s3 <= r1;                  --  r1 - r0
        ad.i.op2_s3 <= r0;
        
        ma0.i.op1_m1 <= ad.o.r_a3;          -- multiplication
        ma0.i.op2_m1 <= cPI2_8;
        ma0.i.op1_m2 <= ad.o.r_s3;
        ma0.i.op2_m2 <= cPI2_8;          
        dataout(2)<= ma0.o.r_m1;            -- writing result
        dataout(3)<= ma0.o.r_m2;
        
       when s2 =>
        ad.i.op1_s1 <= regs.inputdata(4);  -- r0 = x(4)-x(20)
        ad.i.op2_s1 <= regs.inputdata(20);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(5);  -- r1 = x(5)-x(21)
        ad.i.op2_s2 <= regs.inputdata(21);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(20);  -- x(20) = x(20)+x(4)
        ad.i.op2_a1 <= regs.inputdata(4);
        dataout(20) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(21);  -- x(21) = x(21)+x(4)
        ad.i.op2_a2 <= regs.inputdata(5);
        dataout(21) <= ad.o.r_a2;          

        ma0.i.add_fun <= '1';           -- mul/addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op2_m1 <= cPI1_8;
        ma0.i.op1_m2 <= r0;
        ma0.i.op2_m2 <= cPI3_8;          
        dataout(4)<= ma0.o.r_mult;      -- writing result
        
        ma1.i.add_fun <= '0';           -- mul/substraction
        ma1.i.op1_m1 <= r1;
        ma1.i.op2_m1 <= cPI3_8;
        ma1.i.op1_m2 <= r0;
        ma1.i.op2_m2 <= cPI1_8;
        dataout(5)<= ma1.o.r_mult;

       when s3 =>
        ad.i.op1_s1 <= regs.inputdata(22);  -- r0 = x(22)-x(6)
        ad.i.op2_s1 <= regs.inputdata(6);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(7);  -- r1 = x(7)-x(23)
        ad.i.op2_s2 <= regs.inputdata(23);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(22);  -- x(22) = x(22)+x(6)
        ad.i.op2_a1 <= regs.inputdata(6);
        dataout(22) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(23);  -- x(23) = x(23)+x(7)
        ad.i.op2_a2 <= regs.inputdata(7);
        dataout(23) <= ad.o.r_a2;          

        dataout(6) <= r1;
        dataout(7) <= r0;
        
       when s4 =>
        ad.i.op1_s1 <= regs.inputdata(24);  -- r0 = x(24)-x(8)
        ad.i.op2_s1 <= regs.inputdata(8);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(25);  -- r1 = x(25)-x(9)
        ad.i.op2_s2 <= regs.inputdata(9);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(24);  -- x(24) = x(24)+x(8)
        ad.i.op2_a1 <= regs.inputdata(8);
        dataout(24) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(25);  -- x(25) = x(25)+x(9)
        ad.i.op2_a2 <= regs.inputdata(9);
        dataout(25) <= ad.o.r_a2;          

        ma0.i.add_fun <= '0';           -- mul/substraction
        ma0.i.op1_m1 <= r0;
        ma0.i.op2_m1 <= cPI3_8;
        ma0.i.op1_m2 <= r1;
        ma0.i.op2_m2 <= cPI1_8;          
        dataout(8)<= ma0.o.r_mult;      -- writing result
        
        ma1.i.add_fun <= '1';           -- mul/addition
        ma1.i.op1_m1 <= r1;
        ma1.i.op2_m1 <= cPI3_8;
        ma1.i.op1_m2 <= r0;
        ma1.i.op2_m2 <= cPI1_8;
        dataout(9)<= ma1.o.r_mult;
        
       when s5 =>
        ad.i.op1_s1 <= regs.inputdata(26);  -- r0 = x(26)-x(10)
        ad.i.op2_s1 <= regs.inputdata(10);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(27);  -- r1 = x(27)-x(11)
        ad.i.op2_s2 <= regs.inputdata(11);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(26);  -- x(26) = x(26)+x(10)
        ad.i.op2_a1 <= regs.inputdata(10);
        dataout(26) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(27);  -- x(27) = x(27)+x(11)
        ad.i.op2_a2 <= regs.inputdata(11);
        dataout(27) <= ad.o.r_a2;          

        ad.i.op1_a3 <= r0;                  -- r0 + r1
        ad.i.op2_a3 <= r1;       

        ad.i.op1_s3 <= r0;                  --  r0 - r1
        ad.i.op2_s3 <= r1;
        
        ma0.i.op1_m1 <= ad.o.r_a3;          -- multiplication
        ma0.i.op2_m1 <= cPI2_8;
        ma0.i.op1_m2 <= ad.o.r_s3;
        ma0.i.op2_m2 <= cPI2_8;          
        dataout(11)<= ma0.o.r_m1;            -- writing result
        dataout(10)<= ma0.o.r_m2;

       when s6 =>
        ad.i.op1_s1 <= regs.inputdata(28);  -- r0 = x(28)-x(12)
        ad.i.op2_s1 <= regs.inputdata(12);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(29);  -- r1 = x(29)-x(13)
        ad.i.op2_s2 <= regs.inputdata(13);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(28);  -- x(28) = x(28)+x(12)
        ad.i.op2_a1 <= regs.inputdata(12);
        dataout(28) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(29);  -- x(29) = x(29)+x(13)
        ad.i.op2_a2 <= regs.inputdata(13);
        dataout(29) <= ad.o.r_a2;          

        ma0.i.add_fun <= '0';           -- mul/substraction
        ma0.i.op1_m1 <= r0;
        ma0.i.op2_m1 <= cPI1_8;
        ma0.i.op1_m2 <= r1;
        ma0.i.op2_m2 <= cPI3_8;          
        dataout(12)<= ma0.o.r_mult;      -- writing result
        
        ma1.i.add_fun <= '1';           -- mul/addition
        ma1.i.op1_m1 <= r0;
        ma1.i.op2_m1 <= cPI3_8;
        ma1.i.op1_m2 <= r1;
        ma1.i.op2_m2 <= cPI1_8;
        dataout(13)<= ma1.o.r_mult;

       when s7 =>

        -- calling butterfly 16 & 8
        if dataready='1'and regs.memwr='0' then        

          tmp.state:=s5;
          tmp.substate:=s0;
          j:=0;                            -- initialize offset variable
          i:=0;
          split:='0';
          ctrl.rcopy <= '1';               -- copy result into input buffer
          ctrl.ntoprocess <="000000";
        end if;        
        ad.i.op1_s1 <= regs.inputdata(30);  -- r0 = x(30)-x(14)
        ad.i.op2_s1 <= regs.inputdata(14);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(31);  -- r1 = x(31)-x(15)
        ad.i.op2_s2 <= regs.inputdata(15);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(30);  -- x(30) = x(30)+x(14)
        ad.i.op2_a1 <= regs.inputdata(14);
        dataout(30) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(31);  -- x(31) = x(31)+x(15)
        ad.i.op2_a2 <= regs.inputdata(15);
        dataout(31) <= ad.o.r_a2;          

        dataout(14) <= r0;
        dataout(15) <= r1;
        

        
      when s9 =>

       -- if write was completed
       if dataready='1' then
         ctrl.memwr <='0';
       end if;
       
      when others => null;
    end case;
------------------------------------------------------------------
--*****************************
--end state 4  butterfly32
--*****************************
  when s5 =>

--*****************************
--begin state 5 butterfly 16 & 8
--*****************************
    if rising_edge(smctrl.substate(2)) then
      ctrl.rcopy <= '0';              -- transition from
                                      -- subtate s3 to s4
      if j=0 then
        j:=16;
      else
        j:=0;
      end if;
    end if;

    if falling_edge(smctrl.substate(3)) and smctrl.substate=s8 then
      ctrl.rcopy <= '0';              --  transition from
                                      -- subtate s7 to s8
      case i is
        when 0 => i:=8;
        when 8 => i:=16;
        when 16 => i:=24;
        when 24 => i:=25;                 
        when others => null;
      end case;
   
    end if; 
    
    case smctrl.substate is
      when s0 =>
         ctrl.rcopy <= '0';              -- disable copy
        ad.i.op1_s1 <= regs.inputdata(1+j);  -- r0 = x(1)-x(9)
        ad.i.op2_s1 <= regs.inputdata(9+j);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(0+j);  -- r1 = x(8)-x(8)
        ad.i.op2_s2 <= regs.inputdata(8+j);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(8+j);  -- x(8) = x(8)+x(0)
        ad.i.op2_a1 <= regs.inputdata(j);
        dataout(8+j) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(9+j);  -- x(9) = x(9)+x(1)
        ad.i.op2_a2 <= regs.inputdata(1+j);
        dataout(9+j) <= ad.o.r_a2;          

        ad.i.op1_a3 <= r0;                  -- r0 + r1
        ad.i.op2_a3 <= r1;       

        ad.i.op1_s3 <= r0;                  --  r0 - r1
        ad.i.op2_s3 <= r1;
        
        ma0.i.op1_m1 <= ad.o.r_a3;          -- multiplication
        ma0.i.op2_m1 <= cPI2_8;
        ma0.i.op1_m2 <= ad.o.r_s3;
        ma0.i.op2_m2 <= cPI2_8;          

        tmp.substate:=s1;
        
       when s1 =>
        dataout(j)<= ma0.o.r_m1;            -- writing results from previous state
        dataout(1+j)<= ma0.o.r_m2;
        
        ad.i.op1_s1 <= regs.inputdata(3+j);  -- r0 = x(3)-x(11)
        ad.i.op2_s1 <= regs.inputdata(11+j);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(10+j);  -- r1 = x(10)-x(2)
        ad.i.op2_s2 <= regs.inputdata(2+j);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(10+j);  -- x(10) = x(10)+x(2)
        ad.i.op2_a1 <= regs.inputdata(2+j);
        dataout(10+j) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(11+j);  -- x(11) = x(11)+x(3)
        ad.i.op2_a2 <= regs.inputdata(3+j);
        dataout(11+j) <= ad.o.r_a2;          

        dataout(2+j) <= r0;
        dataout(3+j) <= r1;
        tmp.substate:=s2;
        
      when s2 =>
        ad.i.op1_s1 <= regs.inputdata(12+j);  -- r0 = x(12)-x(4)
        ad.i.op2_s1 <= regs.inputdata(4+j);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(13+j);  -- r1 = x(13)-x(5)
        ad.i.op2_s2 <= regs.inputdata(5+j);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(12+j);  -- x(12) = x(12)+x(4)
        ad.i.op2_a1 <= regs.inputdata(4+j);
        dataout(12+j) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(13+j);  -- x(13) = x(13)+x(5)
        ad.i.op2_a2 <= regs.inputdata(5+j);
        dataout(13+j) <= ad.o.r_a2;          

        ad.i.op1_a3 <= r0;                  -- r0 + r1
        ad.i.op2_a3 <= r1;       

        ad.i.op1_s3 <= r0;                  --  r0 - r1
        ad.i.op2_s3 <= r1;
        
        ma0.i.op1_m1 <= ad.o.r_a3;          -- multiplication
        ma0.i.op2_m1 <= cPI2_8;
        ma0.i.op1_m2 <= ad.o.r_s3;
        ma0.i.op2_m2 <= cPI2_8;          

        tmp.substate:=s3; 
        
       when s3 =>
        dataout(5+j)<= ma0.o.r_m1;            -- writing result from previous state
        dataout(4+j)<= ma0.o.r_m2;
                
        ad.i.op1_s1 <= regs.inputdata(14+j);  -- r0 = x(14)-x(6)
        ad.i.op2_s1 <= regs.inputdata(6+j);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(15+j);  -- r1 = x(15)-x(7)
        ad.i.op2_s2 <= regs.inputdata(7+j);
        r1 <= ad.o.r_s2;

        ad.i.op1_a1 <= regs.inputdata(14+j);  -- x(14) = x(14)+x(6)
        ad.i.op2_a1 <= regs.inputdata(6+j);
        dataout(14+j) <= ad.o.r_a1;            -- addition result
          
        ad.i.op1_a2 <= regs.inputdata(15+j);  -- x(15) = x(15)+x(7)
        ad.i.op2_a2 <= regs.inputdata(7+j);
        dataout(15+j) <= ad.o.r_a2;          

        dataout(6+j) <= r0;
        dataout(7+j) <= r1;

        tmp.substate:=s4;

      when s4 =>
        if j=16 then
          tmp.substate:=s0;
        else
          tmp.substate:=s5;
          ctrl.rcopy <= '1';              -- copy result in input buffer for btf
        end if;
        
-------------------------------------------------------------------------------
     --   Butterfly 8
-------------------------------------------------------------------------------
      when s5 =>
        ctrl.rcopy <= '0';              -- disable copy
        ad.i.op1_a1 <= regs.inputdata(6+i);  -- r0 = x(6)+x(2)
        ad.i.op2_a1 <= regs.inputdata(2+i);
        r0 <= ad.o.r_a1;

        ad.i.op1_s1 <= regs.inputdata(6+i);  -- r1 = x(6)-x(2)
        ad.i.op2_s1 <= regs.inputdata(2+i);
        r1 <= ad.o.r_s1;        

        ad.i.op1_a2 <= regs.inputdata(4+i);  -- r2 = x(4)+x(0)
        ad.i.op2_a2 <= regs.inputdata(i);
        r2 <= ad.o.r_a2;

        ad.i.op1_s2 <= regs.inputdata(4+i);  -- r3 = x(4)-x(0)
        ad.i.op2_s2 <= regs.inputdata(i);
        r3 <= ad.o.r_s2;
        
        ad.i.op1_a3 <= r0;                   -- x(6) = r0+r2
        ad.i.op2_a3 <= r2;
        dataout(6+i) <= ad.o.r_a3;

        ad.i.op1_s3 <= r0;                   -- x(4) = r0-r2
        ad.i.op2_s3 <= r2;
        dataout(4+i) <= ad.o.r_s3;
        tmp.substate:=s6;
        
      when s6 =>
        ad.i.op1_s1 <= regs.inputdata(5+i);  -- r0 = x(5)-x(1)
        ad.i.op2_s1 <= regs.inputdata(1+i);
        r0 <= ad.o.r_s1;

        ad.i.op1_s2 <= regs.inputdata(7+i);  -- r2 = x(7)-x(3)
        ad.i.op2_s2 <= regs.inputdata(3+i);
        r2 <= ad.o.r_s2;
        
        ad.i.op1_a1 <= r1;                   -- x(0) = r1+r0
        ad.i.op2_a1 <= r0;
        dataout(i) <= ad.o.r_a1;

        ad.i.op1_s3 <= r1;                   -- x(2) = r1-r0
        ad.i.op2_s3 <= r0;
        dataout(2+i) <= ad.o.r_s3;
        split:='0';                     -- initialize flag signal
        tmp.substate:=s7;

        if i=0 then
          ctrl.memwr <= '1';                -- start write cycle
          ctrl.ntoprocess <= "100000";
        end if;

      when s7 =>

        ad.i.op1_a1 <= regs.inputdata(5+i);  -- r0 = x(5)+x(1)
        ad.i.op2_a1 <= regs.inputdata(1+i);
        r0 <= ad.o.r_a1;

        ad.i.op1_a2 <= regs.inputdata(7+i);  -- r2 = x(7)+x(3)
        ad.i.op2_a2 <= regs.inputdata(3+i);
        r1 <= ad.o.r_a2;
        
        ad.i.op1_a3 <= r2;                   -- x(3) = r2+r3
        ad.i.op2_a3 <= r3;
        dataout(3+i) <= ad.o.r_a3;

        ad.i.op1_s1 <= r2;                   -- x(1) = r2-r3
        ad.i.op2_s1 <= r3;
        dataout(1+i) <= ad.o.r_s1;

        ad.i.op1_s2 <= r1;                   -- x(7) = r1+r0
        ad.i.op2_s2 <= zero32-r0;
        dataout(7+i) <= ad.o.r_s2;

        ad.i.op1_s3 <= r1;                   -- x(5) = r1-r0
        ad.i.op2_s3 <= r0;
        dataout(5+i) <= ad.o.r_s3;
        tmp.substate:=s8;
        
      when s8 =>
        if i=25 then
          tmp.state:=s4;             -- butterfly 8 completed. Return to btf32
          tmp.substate:=s9;
        else
          tmp.substate:=s5;             -- process next btf 8
        end if;
        
      when others => null;
                     
    end case;
--*****************************
--end state 5
--*****************************
  when s6 =>
    -- prepare bit reverse
 
      tmp.state:=s7;
  when s7 =>
--*****************************
--begin state 7 bit reverse
--*****************************

    if falling_edge(smctrl.state(1)) then  -- from s6
      ctrl.ntoprocess <= "000010";    -- read first two elements
      ctrl.incr <='0';                -- space between data eq. 4 bytes
      ctrl.startadr <= irfaddr;       -- set x0
      ctrl.pos <="00";                -- stores in position 0
      ctrl.memwr <= '0';
      split := '0';
    end if; 
    case smctrl.substate is

      when s0 =>
        if rising_edge(dataready) and smctrl.start(3)='0' then
            ctrl.ntoprocess <="000000";  -- stops read
            ctrl.startadr <= orfaddr;     -- set x1 for second block
            ctrl.pos <= "01";           -- stores in position 4
            btfgen := '0';              -- use flag to distinguish first-in-
                                        -- block dataready signal
            tmp.start(3):='1';
--            split:='1';
        end if;
        if rising_edge(dataready) and smctrl.start(3)='1'  then
            ctrl.ntoprocess <="000000";  -- stops read
          -- calculating address to read
            irfaddr:=xaddr + bitrev(bitrf+2);
            orfaddr:=xaddr + bitrev(bitrf+3);
            ctrl.startadr <= irfaddr;       -- set x0 for third block
            ctrl.pos <="10";              -- stores in position 8
          -- next substate
            tmp.start(3):='0';
            tmp.start(6):='1';
--            split:='0';
        end if;
        if falling_edge(dataready) and smctrl.start(3)='1' then
          split:='1';
        end if;
        if dataready='1' then
          if btfgen ='0' then
            if smctrl.start(3)='0' then
              tmp.start(3):='1';
             elsif smctrl.start(3)='1' and split='1' then
              tmp.start(6):='1'; 
            end if;            
          end if;

          if rising_edge(smctrl.start(6)) or rising_edge(smctrl.start(3)) then
            ctrl.ntoprocess <= "000010";

            if smctrl.start(6)='1'  then
              tmp.substate:=s1;
              tmp.start(6):='0';
              split:='0';
            end if;

          end if;
        end if;
        
        ad.i.op1_s1 <= regs.inputdata(1);  -- r0 = x0(1)-x1(1)
        ad.i.op2_s1 <= regs.inputdata(5);
        r0 <= ad.o.r_s1;

        ad.i.op1_a1 <= regs.inputdata(0);  -- r1 = x0(0)+x1(0)
        ad.i.op2_a1 <= regs.inputdata(4);
        r1 <= ad.o.r_a1;
                  
        ma0.i.add_fun <= '1';           -- addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op2_m1 <= T(trig);
        ma0.i.op1_m2 <= r0;
        ma0.i.op2_m2 <= T(trig+1);          
        r2 <= ma0.o.r_mult;             
        
        ma1.i.add_fun <= '0';           -- substraction
        ma1.i.op1_m1 <=  r1;
        ma1.i.op2_m1 <= T(trig+1);
        ma1.i.op1_m2 <=  r0;
        ma1.i.op2_m2 <= T(trig);
        r3 <= ma1.o.r_mult;

        -- no write cycle in this state !!

      when s1=>
        if rising_edge(smctrl.substate(0)) then  -- if s0 was executed

        r2 <= ma0.o.r_mult;
        r3 <= ma1.o.r_mult; 

        end if;

        if rising_edge(dataready) then
          ctrl.ntoprocess <= "000010";    -- read fourth block x1(0),x1(1)
          ctrl.incr <='0';                -- space between data eq. 4 bytes
          ctrl.startadr <= orfaddr;       -- set x1
          ctrl.memwr <='0';               -- start read cycle
          ctrl.pos <="11";                -- stores in  position 12
          tmp.start(3):='0';
          tmp.substate:=s2;
        end if;
        
        ad.i.op1_a1 <= regs.inputdata(1);  -- r0 = HALVE(x0(1)+x1(1))
        ad.i.op2_a1 <= regs.inputdata(5);
        r0 <= HALVE(ad.o.r_a1);

        ad.i.op1_s1 <= regs.inputdata(0);  -- r1 = HALVE(x0(0)-x1(0))
        ad.i.op2_s1 <= regs.inputdata(4);
        r1 <= HALVE(ad.o.r_s1);

        ad.i.op1_a2 <= r0;                 -- w0(0) = r0 + r2
        ad.i.op2_a2 <= r2;
        dataout(0) <= ad.o.r_a2;

        ad.i.op1_s2 <= r0;                 -- w1(2) = r0 - r2
        ad.i.op2_s2 <= r2;
        dataout(6) <= ad.o.r_s2;

        ad.i.op1_a3 <= r1;                 -- w0(1) = r1 + r3
        ad.i.op2_a3 <= r3;
        dataout(1) <= ad.o.r_a3;

        ad.i.op1_s3 <= r3;                 -- w1(3) = r3 - r1
        ad.i.op2_s3 <= r1;
        dataout(7) <= ad.o.r_s3;

      when s2 =>
--        if rising_edge(dataready)  then
        if falling_edge(regs.ntoprocess(0))  then
          ctrl.ntoprocess <= "000100";    -- write first block
          ctrl.incr <='0';                -- space between data eq. 4 bytes
          ctrl.startadr <= w0     ;       -- set w0
          ctrl.pos <="00";                -- reads from position 0
          ctrl.memwr <= '1';
          tmp.substate:=s3;                -- next substate
        end if;
      
        
        ad.i.op1_s1 <= regs.inputdata(9);  -- r0 = x0(1)-x1(1)
        ad.i.op2_s1 <= regs.inputdata(13);
        r0 <= ad.o.r_s1;

        ad.i.op1_a1 <= regs.inputdata(8);  -- r1 = x0(0)+x1(0)
        ad.i.op2_a1 <= regs.inputdata(12);
        r1 <= ad.o.r_a1;
                  
        ma0.i.add_fun <= '1';           -- addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op2_m1 <= T(trig+2);
        ma0.i.op1_m2 <= r0;
        ma0.i.op2_m2 <= T(trig+3);          
        r2 <= ma0.o.r_mult;             
        
        ma1.i.add_fun <= '0';           -- substraction
        ma1.i.op1_m1 <= r1;
        ma1.i.op2_m1 <= T(trig+3);
        ma1.i.op1_m2 <= r0;
        ma1.i.op2_m2 <= T(trig+2);
        r3 <= ma1.o.r_mult;

-- no write cycle on this state !

      when s3 =>

        if falling_edge(smctrl.substate(0)) then  -- if s2 was executed
          ctrl.startadr <= w1;            -- set w1 
          r2 <= ma0.o.r_mult;             -- read results from previous state
          r3 <= ma1.o.r_mult;
        end if;
        if rising_edge(dataready) and smctrl.start(3)='0' then
          ctrl.ntoprocess <= "000100";    -- write next four elements
          ctrl.incr <='0';                -- space between data eq. 4 bytes
          ctrl.memwr <='1';               -- start write cycle
          ctrl.pos <="01";                -- read from position 4 in buffer
          tmp.start(3):='1';
        end if;

        if rising_edge(dataready) and smctrl.start(3)='1' then
          if loops=0 then
            ctrl.ntoprocess <= "000000";
            ctrl.pos <="00";                -- set offset of the block
            ctrl.memwr <= '0';            

            -- initialize and call next state
            
            xaddr:=regs.wrstartaddr;                -- iX = out

            ctrl.startadr <= xaddr;             -- set satrt address of the
                                                -- block to read
            
            tmp.state:=s8;
          else
          -- write cycle completed, initialize next state
            trig := trig +4 ;
            bitrf := bitrf +4;
            w0 := w0 + 16;
            w1 := w1 -16;
            loops:=loops-1;
            irfaddr := xaddr + bitrev(bitrf);    -- x(0)=x+bit(0)
            orfaddr := xaddr + bitrev(bitrf+1);  -- x(1)=x+bit(1)          
            tmp.start(3):='0';            -- reset signal
            tmp.substate:=s0;             -- call next substate
            ctrl.memwr <= '0';            -- initializing read cycle
            ctrl.ntoprocess <= "000010";    -- read first two elements
            ctrl.incr <='0';                -- space between data eq. 4 bytes
            ctrl.startadr <= irfaddr;       -- set x0
            ctrl.pos <="00";                -- set offset of the block
            ctrl.memwr <= '0';
          end if;
        end if;        
        ad.i.op1_a1 <= regs.inputdata(9);  -- r0 = HALVE(x0(1)+x1(1))
        ad.i.op2_a1 <= regs.inputdata(13);
        r0 <= HALVE(ad.o.r_a1);

        ad.i.op1_s1 <= regs.inputdata(8);  -- r1 = HALVE(x0(0)-x1(0))
        ad.i.op2_s1 <= regs.inputdata(12);
        r1 <= HALVE(ad.o.r_s1);
        
        ad.i.op1_a2 <= r0;                 -- w0(2) = r0 + r2
        ad.i.op2_a2 <= r2;
        dataout(2) <= ad.o.r_a2;

        ad.i.op1_s2 <= r0;                 -- w1(0) = r0 - r2
        ad.i.op2_s2 <= r2;
        dataout(4) <= ad.o.r_s2;

        ad.i.op1_a3 <= r1;                 -- w0(3) = r1 + r3
        ad.i.op2_a3 <= r3;
        dataout(3) <= ad.o.r_a3;

        ad.i.op1_s3 <= r3;                 -- w1(1) = r3 - r1
        ad.i.op2_s3 <= r1;
        dataout(5) <= ad.o.r_s3;

      when others => null;
    end case;

    
--*****************************
--end state 7
--*****************************

    when s8 =>
--*****************************
--begin state 8 rotate window
--*****************************

    if falling_edge(smctrl.State(3)) then

        case regs.size is
          when '0' =>                           -- 256 points
           orfaddr:= regs.wrstartaddr + 768;    -- oX2=out+n2+n4
                                                -- 768= (128 + 64)*4
           irfaddr:= regs.wrstartaddr + 752;    -- 752 = 768 - 4*4
           trig:=128;                           -- oX1=out+n2+n4-4
           loops:=15;
          when '1' =>                           -- 2048 points
           orfaddr:= regs.wrstartaddr + 6144;   -- oX2=out+n2+n4
                                                -- 6144= (1024 + 512)*4
           irfaddr:= regs.wrstartaddr + 6128;   -- 6128 = 6144 - 4*4
           trig:= 1024;                         -- oX1=out+n2+n4-4
           loops:=127;
          when others => null;
        end case;
        ctrl.pos <= "00";
        ctrl.incr <= '0';
        ctrl.memwr <= '0';                      -- read phase
        ctrl.ntoprocess <= "001000";            -- read 8 elements
        tmp.substate := s0;                     -- satrt substate s0
    end if;
    case smctrl.substate  is
      when s0  =>
        if regs.ntoprocess(2 downto 0)="110" then
                                               -- if two elements were read go
                                               -- to next substate
          tmp.substate:=s1;
        end if;
        ma0.i.add_fun <= '0';           -- mul/substraction
        ma0.i.op1_m1 <= regs.inputdata(0);
        ma0.i.op2_m1 <= T(trig+1);
        ma0.i.op1_m2 <= regs.inputdata(1);
        ma0.i.op2_m2 <= T(trig);

        ma1.i.add_fun <= '1';           -- mul/addition
        ma1.i.op1_m1 <= regs.inputdata(0);
        ma1.i.op2_m1 <= T(trig);
        ma1.i.op1_m2 <= regs.inputdata(1);
        ma1.i.op2_m2 <= T(trig+1);

        dataout(3)<= ma0.o.r_mult;
        dataout(4)<= zero32 - ma1.o.r_mult;

      when s1  =>
        if rising_edge(smctrl.substate(0)) then
        dataout(3)<= ma0.o.r_mult;
        dataout(4)<= zero32 - ma1.o.r_mult;         
        end if;
        
        if regs.ntoprocess(2 downto 0)="100" then
                                               -- if four elements were read go
                                               -- to next substate
          tmp.substate:=s2;
        end if;
        ma0.i.add_fun <= '0';           -- mul/substraction
        ma0.i.op1_m1 <= regs.inputdata(2);
        ma0.i.op2_m1 <= T(trig+3);
        ma0.i.op1_m2 <= regs.inputdata(3);
        ma0.i.op2_m2 <= T(trig+2);

        ma1.i.add_fun <= '1';           -- mul/addition
        ma1.i.op1_m1 <= regs.inputdata(2);
        ma1.i.op2_m1 <= T(trig+2);
        ma1.i.op1_m2 <= regs.inputdata(3);
        ma1.i.op2_m2 <= T(trig+3);

        dataout(2)<= ma0.o.r_mult;
        dataout(5)<= zero32 - ma1.o.r_mult;

      when s2  =>
        if rising_edge(smctrl.substate(1)) then
        dataout(2)<= ma0.o.r_mult;
        dataout(5)<= zero32 - ma1.o.r_mult;         
        end if;
        
        if regs.ntoprocess(2 downto 0)="010" then
                                               -- if six elements were read go
                                               -- to next substate
          tmp.substate:=s3;
        end if;      
        ma0.i.add_fun <= '0';           -- mul/substraction
        ma0.i.op1_m1 <= regs.inputdata(4);
        ma0.i.op2_m1 <= T(trig+5);
        ma0.i.op1_m2 <= regs.inputdata(5);
        ma0.i.op2_m2 <= T(trig+4);

        ma1.i.add_fun <= '1';           -- mul/addition
        ma1.i.op1_m1 <= regs.inputdata(4);
        ma1.i.op2_m1 <= T(trig+4);
        ma1.i.op1_m2 <= regs.inputdata(5);
        ma1.i.op2_m2 <= T(trig+5);

        dataout(1)<= ma0.o.r_mult;
        dataout(6)<= zero32 - ma1.o.r_mult;

      when s3  =>
        if falling_edge(smctrl.substate(0)) then
          dataout(1)<= ma0.o.r_mult;
          dataout(6)<= zero32 - ma1.o.r_mult;         
        end if;        
        if rising_edge(dataready) and regs.memwr='0' then
          -- end read phase and preparing to write
          ctrl.startadr <= irfaddr;         -- wite oX1
          ctrl.pos <= "00";                 -- read from position 0
          ctrl.incr <= '0';
          ctrl.memwr <= '1';
          ctrl.ntoprocess <= "000100";      -- write 4 elements
          split := '0';                     -- no split signal
          tmp.start(2):='0';
        end if;
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(2)='0' then
          -- second write block
          ctrl.startadr <= orfaddr;         -- wite oX2
          ctrl.pos <= "01";                 -- read from position 4
          ctrl.incr <= '0';
          ctrl.memwr <= '1';
          ctrl.ntoprocess <= "000100";      -- write 4 elements
--          split := '1';                     -- enable split signal
          tmp.start(2):='1';
        end if;
       if rising_edge(dataready) and regs.memwr='1' and smctrl.start(2)='1' then
         -- cycle ended
         split :='0';
         tmp.start(2):='0';
         if loops=0 then
           tmp.state:=s9;                   -- process next state
           ctrl.ntoprocess <= "000000";     -- no access to memory next cycle
           -- initialize and call next cycle
           case regs.size is
             when '0' =>                           -- 256 points
               irfaddr:= regs.wrstartaddr + 240;    -- oX1=out+n4-4 
               orfaddr:= regs.wrstartaddr + 256;    -- oX2=out+n4
               xaddr:= regs.wrstartaddr + 752;      -- iX=out+n2+n4-4                          
               loops:=15;
             when '1' =>                           -- 2048 points
               irfaddr:= regs.wrstartaddr + 2032;    -- oX1=out+n4-4             
               orfaddr:= regs.wrstartaddr + 2048;   -- oX2=out+n4
               xaddr:= regs.wrstartaddr + 6128;     -- iX=out+n2+n4-4
               loops:=127;
             when others => null;
           end case;
           ctrl.startadr <= xaddr;           
           ctrl.memwr <= '0';                      -- read phase
           tmp.state:=s9;
         else
           -- calculate addresses
           orfaddr := orfaddr + 16;     -- ox2 += 4
           xaddr := xaddr + 32 ;        -- ix += 8
           trig := trig + 8;            -- T += 8
           irfaddr := irfaddr -16;      -- ox1 -= 4
           loops := loops -1;
           -- starting next loop
           ctrl.pos <= "00";
           ctrl.incr <= '0';
           ctrl.memwr <= '0';                      -- read phase
           ctrl.startadr <= xaddr;                 -- read iX 
           ctrl.ntoprocess <= "001000";            -- read 8 elements
           tmp.substate := s0;                     -- satrt substate
         end if;
       end if;
        ma0.i.add_fun <= '0';           -- mul/substraction
        ma0.i.op1_m1 <= regs.inputdata(6);
        ma0.i.op2_m1 <= T(trig+7);
        ma0.i.op1_m2 <= regs.inputdata(7);
        ma0.i.op2_m2 <= T(trig+6);

        ma1.i.add_fun <= '1';           -- mul/addition
        ma1.i.op1_m1 <= regs.inputdata(6);
        ma1.i.op2_m1 <= T(trig+6);
        ma1.i.op1_m2 <= regs.inputdata(7);
        ma1.i.op2_m2 <= T(trig+7);

        dataout(0)<= ma0.o.r_mult;
        dataout(7)<= zero32 - ma1.o.r_mult;
        
      when others => null;
--*****************************
-- end state 8 rotate window
--*****************************                    
    end case;
   when s9 =>
--*****************************
--begin state 9 move
--*****************************
    if falling_edge(smctrl.state(2)) then
        -- read input block


        ctrl.pos <= "00";
        ctrl.incr <= '0';
        ctrl.memwr <= '0';                      -- read phase
        ctrl.ntoprocess <= "000100";            -- read 4 elements
        tmp.substate := s0;                     -- satrt substate s0
        split:='0';
    end if;
    case smctrl.substate is
      when s0 =>
        if rising_edge(dataready) and regs.memwr='0' then
          -- start write cycle
          -- first block oX1
          ctrl.startadr <= irfaddr;
          ctrl.pos <= "00";                       -- read from position 0 
          ctrl.incr <= '0';
          ctrl.memwr <= '1';                      -- write phase
          ctrl.ntoprocess <= "000100";            -- write 4 elements
          tmp.start(3):='0';
        end if;
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(3)='0'  then
          -- start write cycle
          -- second block oX2
          ctrl.startadr <= orfaddr;
          ctrl.pos <= "01";                       -- read from position 4 
          ctrl.incr <= '0';
          ctrl.memwr <= '1';                      -- write phase
          ctrl.ntoprocess <= "000100";            -- write 4 elements
          tmp.start(3):='1';
          
        end if;

        
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(3)='1'  then
          -- testing if end reached or loop again
          split:='0';                             -- resetting signal
          if loops=0 then

            -- prepare next substate
            case regs.size is
              when '0' =>               -- 256 points
                loops := 15;
                xaddr := regs.wrstartaddr + 768;  -- ix=out+n2+n4
                irfaddr := regs.wrstartaddr + 752;  -- oX1=out+n2+n4-4
              when '1' =>               -- 2048 points
                loops := 127;
                xaddr := regs.wrstartaddr + 6144;  -- ix=out+n2+n4
                irfaddr := regs.wrstartaddr + 6128;  -- oX1=out+n2+n4-4                           
              when others => null;
            end case;
            -- start read for next substate
            ctrl.startadr <= xaddr;
            ctrl.pos <= "00";                       -- write on position 0 
            ctrl.incr <= '0';
            ctrl.memwr <= '0';                      -- read phase
            ctrl.ntoprocess <= "000100";            -- stop           
            tmp.substate:=s1;                     -- next substate
          else
            -- calculate addresses for next loop
            orfaddr:=orfaddr + 16;      -- oX2 += 4
            irfaddr:=irfaddr - 16;      -- ox1 -= 4
            xaddr:=xaddr - 16;          -- ix -= 4
            loops:=loops -1;
            -- starting read process
            ctrl.startadr <= xaddr;
            ctrl.pos <= "00";                       -- write on position 0 
            ctrl.incr <= '0';
            ctrl.memwr <= '0';                      -- read phase
            ctrl.ntoprocess <= "000100";            -- read 4 elements
          end if;
        end if;        
        dataout(3) <= regs.inputdata(3);
        dataout(2) <= regs.inputdata(2);
        dataout(1) <= regs.inputdata(1);
        dataout(0) <= regs.inputdata(0);
        dataout(4) <= zero32 - regs.inputdata(3);
        dataout(5) <= zero32 - regs.inputdata(2);
        dataout(6) <= zero32 - regs.inputdata(1);
        dataout(7) <= zero32 - regs.inputdata(0);
      when s1 =>
        if rising_edge(smctrl.substate(0)) then
           ctrl.ntoprocess <= "000100";            -- start 
        end if;
        if rising_edge(dataready) and regs.memwr='0' then
          -- starting write cycle
          ctrl.startadr <= irfaddr;
          ctrl.pos <= "00";                       -- read from position 0 
          ctrl.incr <= '0';
          ctrl.memwr <= '1';                      -- write phase
          ctrl.ntoprocess <= "000100";            -- write 4 elements                
        end if;
        if rising_edge(dataready) and regs.memwr='1' then
          -- check if function was completed
          if loops=0 then
            -- end of mdct
            ctrl.finish <= '1';         -- mdct completed !
            ctrl.memwr <='0';
            ctrl.ntoprocess <= "000000";
            tmp.state := s0;            -- waiting state
--pragma translate_off
            tmp.state := s9;
            tmp.substate:=s9;           -- go to print ram content
            ctrl.ntoprocess <= "100000";
            xaddr :=  regs.wrstartaddr;
            ctrl.startadr <=  xaddr;
            loops:=8;
--pragma translate_on
          else
            -- calculate addresses for new loop
            xaddr := xaddr + 16;        -- ix += 4
            irfaddr := irfaddr -16;     -- ox1 -= 4
            loops:=loops-1;
            -- reading next block
            ctrl.startadr <= xaddr;
            ctrl.pos <= "00";                       -- write on position 0 
            ctrl.incr <= '0';
            ctrl.memwr <= '0';                      -- read phase
            ctrl.ntoprocess <= "000100";            -- read 4 elements             
          end if;
        end if;
        dataout(0) <= regs.inputdata(3);
        dataout(1) <= regs.inputdata(2);
        dataout(2) <= regs.inputdata(1);
        dataout(3) <= regs.inputdata(0);
--pragma translate_off
      when s9 =>
        if rising_edge(dataready) then
          write(text_line,CONV_INTEGER(regs.inputdata(0)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(1)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(2)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(3)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(4)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(5)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(6)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(7)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(8)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(9)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(10)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(11)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(12)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(13)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(14)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(15)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(16)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(17)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(18)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(19)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(20)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(21)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(22)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(23)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(24)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(25)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(26)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(27)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(28)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(29)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(30)));
          writeline(mdctresult,text_line);
          write(text_line,CONV_INTEGER(regs.inputdata(31)));
          writeline(mdctresult,text_line);

          
          xaddr:=xaddr+128;
          ctrl.startadr <= xaddr;
          loops:=loops -1;
          
        end if;
        if loops=0 then
          tmp.state:=s0;
          ctrl.ntoprocess <= "000000";          
        end if;
--pragma translate_on
      when others => null;

    end case;
--*****************************
--end state 9 move
--*****************************
    when others => -- null; 

     ctrl.memwr <= '0';
     ctrl.finish <= '1';

  end case; --state machine


   if rst = '0' then
     dataout <= (others => zero32 );
     ctrl.ntoprocess <= "000000";
     ctrl.memwr <= '0';
     ctrl.startadr <= zero32;
     ctrl.incr <= '0';
     ctrl.pos <="00";
     ctrl.finish <= '1';
     ctrl.rcopy <= '0';
     btfgen:='0';
     tmp.state := s0;
     tmp.start := (others => '0');
     tmp.substate := s0;
     irfaddr := zero32;
     orfaddr := zero32;
     ma0.i.add_fun <= '0';
     ma0.i.op1_m1 <= zero32;
     ma0.i.op2_m1 <= zero32;
     ma0.i.op1_m2 <= zero32;
     ma0.i.op2_m2 <= zero32;
     ma1.i.add_fun <= '0';
     ma1.i.op1_m1 <= zero32;
     ma1.i.op2_m1 <= zero32;
     ma1.i.op1_m2 <= zero32;
     ma1.i.op2_m2 <= zero32;
     ad.i.op1_a1 <= zero32;
     ad.i.op2_a1 <= zero32;
     ad.i.op1_a2 <= zero32;
     ad.i.op2_a2 <= zero32;
     ad.i.op1_a3 <= zero32;
     ad.i.op2_a3 <= zero32;
     ad.i.op1_s1 <= zero32;
     ad.i.op2_s1 <= zero32;
     ad.i.op1_s2 <= zero32;
     ad.i.op2_s2 <= zero32;
     ad.i.op1_s3 <= zero32;
     ad.i.op2_s3 <= zero32;  
   end if;

    in_ctrl <= tmp;                     -- update in-signal

  end process;

ma_0: multadd
  port map (
       rst => rst,
       clk => clk,
       datain => ma0.i,      
       dataout => ma0.o                   
       );
    
ma_1: multadd
  port map (
       rst => rst,
       clk => clk,
       datain => ma1.i,      
       dataout => ma1.o                   
       );

ad_0: addbank
  port map (
       rst => rst,
       clk => clk,
       datain => ad.i,      
       dataout => ad.o                   
       );   
end;

