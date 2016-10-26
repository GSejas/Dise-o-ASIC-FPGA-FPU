
--------------------------------------------------------------------------
-- This file is part of Oggonachip project
---------------------------------------------------------------------------
-- Entity: mdct
-- File:   mdct.vhd
-- Author: Luis L. Azuara
-- Description:	Interface of MDCT core with AMBA bus.Reads memory values stored in memory, 
-- calculates the mdct, and
--	stores the result in specified addresses. Memory mapped registers use
-- APB. DMA is carried out using AHB.
-- Creation date: 6.03.02
----------------------------------------------------------------------------
-- Inputs: Control register    0x80000300 	
--	    LSB bits: mdctenreq,irqen,irq
--	        Vector size         0x80000304
--	        Read Start address  0x80000308
--	        Write Start address 0x8000030c
-- Outputs:Status register     0x80000310
--	    LSB bits: ready-busy,writting-reading
--	        Current Memory address 0x80000314	
-- --------------------------------------------------------------------------
-- Version
-- --------------------------------------------------------------------------
-- 0.1	    Dummy version. Only AMBA communication activated. Only one address
--	        06.03.02
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
-- 0.9     added premult 1
--         1.05.02
-- --------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned."+";
use IEEE.std_logic_unsigned."-";
use IEEE.std_logic_unsigned.CONV_INTEGER;
use IEEE.std_logic_arith.all;

use work.iface.all;
use work.amba.all;
use work.mdctlib.all;


-- pragma translate_off
--use work.mdctcomp.all; -- not required for simulation
-- pragma translate_on


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




signal r,rin : mdctregs;
signal ctrlcon : ctrlregs;  -- configuration signals comming from control unit
signal dataready :  std_logic;
signal dmaoutdata : block32_data;

begin
  
  mdcttop : process(rst,r,apbi, ahbi,ctrlcon,dmaoutdata)
  variable rdata : std_logic_vector(31 downto 0);
  variable tmp: mdctregs;
--variable regaddr : std_logic_vector(4 downto 0):="10000";
 
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
--  variable modul_en :  std_logic;  -- enables main function modul

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
      rdata(0)		:= r.ready;
      rdata(1)		:= r.memwr;    
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
if r.busown2cyc='1' and r.mdcten = '1' then

  if ahbi.hready='1' then
    tmp.busown:='0';
    tmp.busown2cyc:='0';

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

    if r.memwr ='0'  then 
      if bindex >0 then
        tmp.inputdata(CONV_INTEGER(ctrlcon.ntoprocess)-bindex+offset) := ahbi.hrdata;     -- loads data from bus
      end if;

    end if;
 
    if r.memwr = '1' then  
       if bindex>0 then 
         hwdata:=r.result(CONV_INTEGER(ctrlcon.ntoprocess)-bindex+offset) ;				-- throw result to bus
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
    tmp.inputdata := (others => "00000000000000000000000000000000");
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
--     tmp.wraddr := ctrlcon.startadr;
  end if;
  tmp.memwr := ctrlcon.memwr;
  tmp.ready := ctrlcon.finish;
  tmp.result := dmaoutdata;

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

-----------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned."+";
use IEEE.std_logic_unsigned."-";
use IEEE.std_logic_unsigned.CONV_INTEGER;
use IEEE.std_logic_arith.all;
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

component butterfly_32 
  port (
      rst   : in  std_logic;
      clk   : in  std_logic;
      datain  : in btf32_data;
      dataout  : out btf32_data;
      enabled : in std_logic;
      ready : out std_logic
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

type ports_s1 is record

  input : block4_data;
  output: block4_data;
  lut   : block4_data;
  funct  : std_logic;
end record;

type ports_s5 is record
  input : btf32_data;
  output: btf32_data;
end record;

type state_ports is record
  p_s1 : ports_s1;
  p_s5 : ports_s5;
end record; 


signal smctrl,in_ctrl : fsm;
signal ports : state_ports;
signal ready : state_signals;           
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

    

    ctrl_p: process(rst,regs,dataready,smctrl)
--    variable act : ctrlregs;
    variable tmp : fsm;
--    variable trig : std_logic_vector(7 downto 0) := "00000000";
    variable xaddr,irfaddr,orfaddr : std_logic_vector(31 downto 0);  
                                        -- input and output reference addresses
    variable loops,trig,trigint : integer := 0;      -- cycle loops

    variable split,btfgen : std_logic := '0';  -- phase split signal between blocks
                                               -- btfgen distinguish between
                                               -- butterfly first stage and
                                               -- butterfly generic

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
        else
          irfaddr := regs.rdstartaddr+4068;  -- initialization for 256 points ix=in+n2-7
          orfaddr := regs.wrstartaddr+6128;  -- ox=out+n2+n4-16
          trig := 512;
          loops := 127;                 -- 128 cycles
        end if;
        tmp.state:= s1;                 -- start preprocess

-- test segment 
--        tmp.state:= s2;                 -- testing s3
--        loops:=7;                       -- only for testing !! should be 15
--        irfaddr:=regs.rdstartaddr+480;  -- x1
--        orfaddr:=regs.rdstartaddr+224;  -- x2
--        trig:=0;
-- end test segment
        
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
        ctrl.incr <='1';                -- space between data eq. 8 bytes
        ctrl.startadr <= irfaddr;        -- set ix
 
      end if;
    
  if regs.memwr='0' then

      if rising_edge(dataready)   then 

        ctrl.ntoprocess <= "000000";    -- no access to memory next cycle
        tmp.start(1) := '1';            -- enable preprocess and wait ready signal        
      end if;
      
      if falling_edge(regs.ntoprocess(1)) then
        tmp.substate := s1;             -- next sub cycle        
      end if;
      

      case smctrl.substate is
        when s0 => 
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



-- waiting for result and start write cycle
      if rising_edge(smctrl.start(1))  then
        ctrl.memwr <='1';                  -- start write cycle
        ctrl.ntoprocess <= "000100";       -- process the next block
        ctrl.incr <='0';                   -- space between data eq. 4 bytes
        ctrl.startadr <= orfaddr;          --regs.wrstartaddr;      
        tmp.start(1) := '0';               -- disaable preproces
      end if;
  end if;                                  -- memwr=0
                                         
-- end action
    if rising_edge(dataready) and regs.memwr='1' then
      if loops=0 then
--       ctrl.finish <= '1';                -- inform amba wrapper that the function finished
       ctrl.ntoprocess <= "000000";       -- process no data
--       tmp.state:= s0;                     -- Stat end. Setting waiting state
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
--*****************************
--end state 1
--*****************************
    when s2 =>
--****************************
--begin state 2 premult 2
--***************************
      
-- starting process
-- tmp.state := s3;
-- read process
      if falling_edge(regs.memwr) or rising_edge(smctrl.state(1))  then

        ctrl.ntoprocess <= "000100";    -- read first four elements
        ctrl.incr <='1';                -- space between data eq. 8 bytes
        ctrl.startadr <= irfaddr;        -- set ix
 
      end if;
    
  if regs.memwr='0' then

      if rising_edge(dataready)   then 

        ctrl.ntoprocess <= "000000";    -- no access to memory next cycle
        tmp.start(2) := '1';            -- enable preprocess and wait ready signal        
      end if;
      
      if falling_edge(regs.ntoprocess(1)) then
        tmp.substate := s1;             -- next sub cycle        
      end if;
      

      case smctrl.substate is

                   
        when s0 => 
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

-- waiting for result and start write cycle
      if rising_edge(smctrl.start(2))  then
        ctrl.memwr <='1';                  -- start write cycle
        ctrl.ntoprocess <= "000100";       -- process the next block
        ctrl.incr <='0';                   -- space between data eq. 4 bytes
        ctrl.startadr <= orfaddr;          -- regs.wrstartaddr;      
        tmp.start(2) := '0';               -- disaable preproces
      end if;
  end if;                                  -- memwr=0
                                         
-- end action
    if rising_edge(dataready) and regs.memwr='1' then
      if loops=0 then
       ctrl.ntoprocess <= "000000";       -- process no data
       ctrl.memwr <= '0';

       -- initialize and call next state

       if regs.size='0' then
         loops:=7;                       -- initialize for 256 points
         irfaddr:=regs.wrstartaddr+992;  -- x1=out+(256/2+256/2-8)*4
         orfaddr:=regs.wrstartaddr+736;  -- x2=out+(256/2+256/4-8)*4
       else
         loops:=63;                       -- initialize for 256 points
         irfaddr:=regs.wrstartaddr+8160;  -- x1=out+(2048/2+2048/2-8)*4
         orfaddr:=regs.wrstartaddr+6112;  -- x2=out+(2048/2+2048/4-8)*4         
       end if;
       trig:=0;
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
--*****************************
--end state 2
--*****************************
    when s3 =>
--****************************
--begin state 3 butterfly_first
--***************************
      


-- read process
      if falling_edge(smctrl.state(0))  then

        ctrl.ntoprocess <= "000100";    -- read first four elements
        ctrl.incr <='0';                -- space between data eq. 4 bytes
        ctrl.startadr <= irfaddr;       -- set x1
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


        if rising_edge(dataready) and regs.memwr='0'  then
          tmp.start(3) := '1';           -- signalize  write cycle for first block
          ctrl.startadr <= irfaddr;      -- address of x1 to write;
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


        ma0.i.add_fun <= '1';           -- addition
        ma0.i.op1_m1 <= r1;
--        ma0.i.op2_m1 <= T(trig+9);
        ma0.i.op1_m2 <= r0;
--        ma0.i.op2_m2 <= T(trig+8);          

        ma1.i.add_fun <= '0';           -- substraction
        ma1.i.op1_m1 <= r1;
--        ma1.i.op2_m1 <= T(trig+8);
        ma1.i.op1_m2 <= r0;
--        ma1.i.op2_m2 <= T(trig+9);

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
--        ma0.i.op2_m1 <= T(trig+5);
        ma0.i.op1_m2 <= r0;
--        ma0.i.op2_m2 <= T(trig+4);          

        ma1.i.add_fun <= '0';           -- substraction
        ma1.i.op1_m1 <= r1;
--        ma1.i.op2_m1 <= T(trig+4);
        ma1.i.op1_m2 <= r0;
--        ma1.i.op2_m2 <= T(trig+5);

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

        if rising_edge(dataready) and regs.memwr='0'  then
          tmp.start(3) := '1';           -- signalize  write cycle for first block
          ctrl.startadr <= irfaddr+16;      -- address of x1 to write
          split:='0';                    -- disable distinguish signal
        end if;
        
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(4)='0' then
          tmp.start(4) := '1';           -- signalize  write cycle for second block
          ctrl.startadr <= orfaddr+16;      -- address of x2 to write
        end if;
        
        if rising_edge(dataready) and regs.memwr='1' and smctrl.start(4)='1' then

          -- end action

          if loops=0 then
            ctrl.finish <= '1';             -- function finished
            ctrl.ntoprocess <= "000000";    -- process no data
            tmp.state:= s0;                 -- Stat end. Setting waiting state
          else
            tmp.start(3):='0';              -- reset start signals
            tmp.start(4):='0';
            orfaddr := orfaddr - 32;
            irfaddr := irfaddr - 32;
            trig := trig + 16;              -- Trig is not in bytes but in words !!!
            loops := loops - 1;
            split := '0';
            tmp.substate := s0;             -- starting again state 3
            
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
        

        ma0.i.add_fun <= '1';           -- addition
        ma0.i.op1_m1 <= r1;
        ma0.i.op2_m1 <= T(trig+1);
        ma0.i.op1_m2 <= r0;
        ma0.i.op2_m2 <= T(trig);          

        ma1.i.add_fun <= '0';           -- substraction
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
  when s5 =>
--*****************************
--begin function butterfly32
--*****************************


-- start butterfly32
   if rising_edge(dataready) and regs.memwr='0' then
      ports.p_s5.input <= BLOCK32_to_BT32(regs.inputdata);      -- input for butterfly is the data in buffer      
      ctrl.ntoprocess <= "000000";                       -- process no data
      tmp.start(5) := '1';              -- enables butterfly 32 modul
   end if;

-- wait for result and write data to memory
   if rising_edge(ready(5)) then
       dataout <= BT32_to_BLOCK32(ports.p_s5.output);  -- gives output of butterfly as final result to  write
       ctrl.memwr <='1';                  -- start write cycle
       ctrl.ntoprocess <= "100000";       -- process the next block
       ctrl.startadr <= regs.wrstartaddr;      
       tmp.start(5) := '0';              -- disables butterfly 32 modul
       ctrl.finish <= '0';               -- mdct working !
   end if;

-- end action
    if rising_edge(dataready) and regs.memwr='1' then
       ctrl.finish <= '1';                -- inform amba wrapper that the function finished
       ctrl.ntoprocess <= "000000";       -- process no data
       tmp.state:= s0;                     -- waiting state
    end if;
--*****************************
--end function butterfly32
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


 comp: butterfly_32 
  port map (
       rst => rst,
       clk => clk,
       datain => ports.p_s5.input,      --mdctinput,
       dataout => ports.p_s5.output,    --mdctresult,
       enabled => smctrl.start(5),
       ready => ready(5)                -- mdctready
       );

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











