library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned."+";
use IEEE.std_logic_unsigned."-";
use work.iface.all;
use work.amba.all;

entity ddm is
  port (
    rst   : in  std_logic;
    clk   : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    ddmi  : in  ddm_in_type;
    ddmo  : out ddm_out_type;
    irq   : out std_logic
  );
end;


architecture rtl of ddm is

type ddmregs is record
  -- ***********************
  -- memory mapped registers

  -- bit 0 of 0x80000200
  audioenreq   : std_logic;             -- audio function enabled active
  -- bit 1 of 0x80000200
  recorden     : std_logic;             -- audio record '1' or playback '1'
  -- bit 2 of 0x80000200
  loopen       : std_logic;             -- enable loop mode;
  -- bit 3 of 0x80000200
  irqen        : std_logic;             -- enable interrupt
  -- bit 4 of 0x80000200
  irq          : std_logic;             -- irq request
  
  -- 32 bit at 0x80000204
  startaddr : std_logic_vector(31 downto 0);  -- dma transfer start address
  -- 32 bit at 0x80000208
  stopaddr  : std_logic_vector(31 downto 0);  -- dma transfer stop address
  -- 14 bit at 0x8000020c
  scalerup  : std_logic_vector(13 downto 0);  -- scaler update register value
                                              -- masterclock / (sampling frequenz * 20*2)
  -- lowest 8 bit of 0x80000210
  display   : std_logic_vector(7 downto 0);  -- value to be displayed on the 2
                                             -- digit display
  -- bit 9 of 0x80000210
  dispen    : std_logic;                -- enable display on board

  -- bit 0-4 of 0x80000214 
  button0   : std_logic;                -- status of the buttons 
  button1   : std_logic;
  button2   : std_logic;
  button3   : std_logic;
  
  -- 0x80000218
  memoryadr : std_logic_vector(31 downto 0);  -- actual dma address /read only

  -- memory mapped registers end
  -- ***************************
  
  -- internal registers
  audioen      : std_logic;
  dmatransfreq : std_logic;
  audiobuffer  : std_logic_vector(31 downto 0);  -- audio data buffer for
                                                 -- memory transfers
  shiftcounter : std_logic_vector(4 downto 0);  -- counter for 20 bit shiftregister
  audioshifter : std_logic_vector(19 downto 0);  -- serial shift register for
                                                 -- audio a/d and d/a converter
  shifttick   : std_logic;             -- tick from serial 5 bit (from 20 bit shift
                                        -- register) counter

  readaudio_clk: std_logic;
  shiftstop : std_logic;               -- set for the 12 bit not shifted
  
  lrsel       : std_logic;              -- left/right output selector
  masterclk   : std_logic;
  sclk        : std_logic;
  
  audioout     : std_logic;             -- 1 bit audio output to d/a converter
  
  digit0 : std_logic_vector(6 downto 0);
  digit1 : std_logic_vector(6 downto 0);


  -- amba status registers
  busact : std_logic;
  busown : std_logic;
  busgrant : std_logic;
  busown2cyc : std_logic;
  
end record;

type timer is record
  scaler : std_logic_vector(13 downto 0);
  masterclk : std_logic;
  sclkscaler  : std_logic_vector(1 downto 0);  -- shiftclk generator
  sclk        : std_logic;                     -- shiftclk output 
  sclk_old    : std_logic;              --  old status of shiftclk for signal
                                        --  change recognition
end record;

signal r,rin : ddmregs;
signal timerout,timerin : timer;
begin
  
  ddmtop : process(rst,r, apbi, ahbi, ddmi, timerout)
  variable rdata : std_logic_vector(31 downto 0);
  variable tmp: ddmregs;
  variable regaddr : std_logic_vector(4 downto 0):="10000";
 
  -- amba ahb variables
  variable haddr   : std_logic_vector(31 downto 0);   -- address bus
  variable htrans  : std_logic_vector(1 downto 0);    -- transfer type 
  variable hwrite  : std_logic;  		      -- read/write
  variable hsize   : std_logic_vector(2 downto 0);    -- transfer size
  variable hburst  : std_logic_vector(2 downto 0);    -- burst type
  variable hwdata  : std_logic_vector(31 downto 0);   -- write data
  variable hbusreq : std_logic;      -- bus request

  begin

  -- init
  tmp:=r;

  htrans := HTRANS_IDLE; -- do nothing if granted without request
  hbusreq := '0';
  -- read/write memory mapped registers witch amba apb bus

  rdata := (others => '0');             -- init
  case apbi.paddr(4 downto 2) is
    when "000" =>
      rdata(0) := r.audioen or r.audioenreq;
      rdata(1) := r.recorden;
      rdata(2) := r.loopen;
      rdata(3) := r.irqen;
      rdata(4) := r.irq;
    when "001" =>
      rdata    := r.startaddr;
    when "010" =>
      rdata    := r.stopaddr;
    when "011" =>
      rdata(13 downto 0) := r.scalerup;
    when "100" =>
      rdata(7 downto 0)  := r.display;
      rdata(8) := r.dispen;
    when "101" =>
      rdata(0) := r.button0;
      rdata(1) := r.button1;
      rdata(2) := r.button2;
      rdata(3) := r.button3;
    when "110" =>
      rdata    := r.memoryadr;
    when others => null;
  end case;
  if (apbi.psel and apbi.penable and apbi.pwrite) = '1' then
    case apbi.paddr(4 downto 2) is
      when "000" =>
        tmp.audioenreq := apbi.pwdata(0);
        tmp.recorden := apbi.pwdata(1);
        tmp.loopen   := apbi.pwdata(2);
        tmp.irqen    := apbi.pwdata(3);
        if apbi.pwdata(4)='0' then      -- allow only interrupt reset
          tmp.irq    := '0';
        end if;
        if tmp.audioenreq = '1' and r.audioenreq = '0' then       -- init audio transaction
          tmp.memoryadr := r.startaddr;
          if tmp.recorden = '0' then    -- load first audio data when play back
            tmp.dmatransfreq := '1';
          end if;
        end if;
      when "001" =>
        tmp.startaddr := apbi.pwdata;
      when "010" =>
        tmp.stopaddr := apbi.pwdata;
      when "011" =>
        tmp.scalerup := apbi.pwdata(13 downto 0);
      when "100" =>
        tmp.display  := apbi.pwdata(7 downto 0);
        tmp.dispen   := apbi.pwdata(8);
      when others => null;
    end case;
  end if;
  
  -- update buttonreg

  tmp.button0 := ddmi.button0;
  tmp.button1 := ddmi.button1;
  tmp.button2 := ddmi.button2;
  tmp.button3 := ddmi.button3;

  -- decode display input to digits

  case r.display(3 downto 0) is
  when "0000" =>
    tmp.digit0 := "1110111";
  when "0001" =>
    tmp.digit0 := "0100100";
  when "0010" =>
    tmp.digit0 := "1011101";
  when "0011" =>
    tmp.digit0 := "1101101";
  when "0100" =>
    tmp.digit0 := "0101110";
  when "0101" =>
    tmp.digit0 := "1101011";
  when "0110" =>
    tmp.digit0 := "1111011";
  when "0111" =>
    tmp.digit0 := "0100111";
  when "1000" =>
    tmp.digit0 := "1111111";
  when "1001" =>
    tmp.digit0 := "1101111";
  when "1010" =>
    tmp.digit0 := "0111111";
  when "1011" =>
    tmp.digit0 := "1111010";
  when "1100" =>
    tmp.digit0 := "1010011";
  when "1101" =>
    tmp.digit0 := "1111100";
  when "1110" =>
    tmp.digit0 := "1011011";
  when "1111" =>
    tmp.digit0 := "0011011";
  when others => null;
  end case;
  case r.display(7 downto 4) is
  when "0000" =>
    tmp.digit1 := "1110111";
  when "0001" =>
    tmp.digit1 := "0100100";
  when "0010" =>
    tmp.digit1 := "1011101";
  when "0011" =>
    tmp.digit1 := "1101101";
  when "0100" =>
    tmp.digit1 := "0101110";
  when "0101" =>
    tmp.digit1 := "1101011";
  when "0110" =>
    tmp.digit1 := "1111011";
  when "0111" =>
    tmp.digit1 := "0100111";
  when "1000" =>
    tmp.digit1 := "1111111";
  when "1001" =>
    tmp.digit1 := "1101111";
  when "1010" =>
    tmp.digit1 := "0111111";
  when "1011" =>
    tmp.digit1 := "1111010";
  when "1100" =>
    tmp.digit1 := "1010011";
  when "1101" =>
    tmp.digit1 := "1111100";
  when "1110" =>
    tmp.digit1 := "1011011";
  when "1111" =>
    tmp.digit1 := "0011011";
  when others => null;
  end case;
  
  -- audio in/out 

  tmp.masterclk:=timerout.masterclk;
  tmp.sclk    :=timerout.sclk;
  
  
  -- audio shifter out/in
  if (timerout.sclk='1') and (timerout.sclk_old='0')  then
    tmp.shiftcounter := tmp.shiftcounter+1; 
    tmp.shifttick := r.shiftcounter(4) and not tmp.shiftcounter(4);
    if tmp.shiftcounter="10100" then    -- stop shifting after 20 bit
      tmp.shiftstop :='1';        
    end if;

    -- audio shifregister to buffer update and vice versa
    if (tmp.shifttick ='1') and (r.shifttick= '0') then  -- all 32 data bits
      tmp.lrsel:=not r.lrsel;   -- change left/right channel
      if tmp.lrsel = '1' then -- only transmit data to or from memory when audio is on for one phase
        if r.audioen='1' then
          if r.recorden = '1' then          -- if record shiftreg to buffer
            tmp.audiobuffer(19 downto 0) := tmp.audioshifter;  -- save record
                                                               -- data from
                                                               -- shiftregister
                                                               -- in buffer
            tmp.dmatransfreq := '1';          -- start dma transfer action for
                                              -- recording 
          else
            tmp.audioshifter := r.audiobuffer(19 downto 0);  -- else load new audio data
          end if;
        end if;
        tmp.audioen:=tmp.audioenreq;    -- enable audio if requested
        if tmp.audioen='1' and tmp.recorden='0' then
          tmp.dmatransfreq:='1';         -- load data for playback from memory
        end if;
      else
        tmp.shiftstop:='0';             -- start shifting
      end if;
    end if;

    if r.audioen ='1' then
      if r.recorden = '1' then
        if tmp.shiftstop='0' then
          tmp.readaudio_clk:='1';
        else  
          tmp.audioout := '0';
        end if;
      else
        if tmp.shiftstop='0' then
          tmp.audioout := tmp.audioshifter(19);
          tmp.audioshifter := tmp.audioshifter(18 downto 0) & '0';
        else
          tmp.audioout:='0';
        end if;
      end if;
    else
      tmp.audioout:='0';
      tmp.audioshifter := (others => '0');
    end if;
  end if;     

  -- audio data must be read one clk later as mclk is generated
  if r.readaudio_clk='1' then
    tmp.readaudio_clk:='0';
    tmp.audioshifter := tmp.audioshifter(18 downto 0) & ddmi.audioin;
    tmp.audioout:=ddmi.audioin;
  end if;
  
  -- audio shifregister to buffer update and vice versa

  
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
    haddr := r.memoryadr;
    hsize := HSIZE_WORD;
    hburst := HBURST_SINGLE;
    htrans := HTRANS_NONSEQ;
    if r.recorden = '1'then
      hwrite := '1';
    else
      hwrite := '0';
    end if;
    if ahbi.hready='1' then  -- check for data cycle
      tmp.busown:='0';
      tmp.busown2cyc:='1';
    end if;
  end if;

  -- data cycle of ahb transfer
  if r.busown2cyc='1' then
    if r.recorden = '1'then
      hwdata:=r.audiobuffer;
    end if;
    if ahbi.hready='1' then
      tmp.busown:='0';
      tmp.busown2cyc:='0';
      tmp.memoryadr := r.memoryadr+4;   -- next memory address
      if r.recorden='0' then
        tmp.audiobuffer := ahbi.hrdata;
      end if;
    end if;
  end if;

  -- check for audio action end
  if tmp.memoryadr = r.stopaddr then  -- stop address reached ?
    if r.loopen = '1' then              -- if loopmode activated
      tmp.memoryadr := r.startaddr;    -- loop mode; begin again at start
    else
      tmp.audioen := '0';             -- audio task finished , in output
                                        -- mode last sample gets lost
      tmp.audioenreq := '0';
      tmp.audiobuffer:= (others => '0');
    end if;
    tmp.irq := r.irqen;             -- request interrupt when enabled
  end if;

-- reset operation of ddm-module

  if rst = '0' then
    tmp.audiobuffer := (others => '0');
    tmp.audioshifter := (others => '0');
    tmp.startaddr := (others => '0');
    tmp.stopaddr := (others => '0');
    tmp.memoryadr := (others => '0');
    tmp.scalerup := "00000000000001";
    tmp.shiftcounter := (others => '0');
    tmp.shiftstop := '0';
    tmp.audioen := '0';
    tmp.recorden := '0';
    tmp.irqen := '0';
    tmp.irq := '0';
    tmp.display := (others => '0');
    tmp.dmatransfreq := '0';
    tmp.lrsel := '0';
    tmp.dispen := '0';
    tmp.busown := '0';
    tmp.busown2cyc := '0';
    tmp.busact := '0';
    tmp.readaudio_clk:='0';
  end if;

  -- update registers
  
  rin <= tmp;

  -- output from ddm to ambabus and outworld
  
  ddmo.digit0 <= r.digit0;
  ddmo.digit1 <= r.digit1;
  ddmo.audioout <= r.audioout;
  ddmo.lr_out <= r.lrsel;
  ddmo.shift_clk <= not r.sclk;
  ddmo.dispen <= r.dispen;
  ddmo.mclk <= r.masterclk;
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

  regs : process(clk)
  begin
    if rising_edge(clk) then
      r <= rin;
      timerout <= timerin;
    end if;
  end process;
    
  timerpr : process(timerout, rst)
  variable scaler : std_logic_vector(13 downto 0);
  variable masterclk : std_logic;
  variable tick : std_logic;
  variable rscaler : std_logic_vector(1 downto 0);
  variable sclk: std_logic;
  -- scaler  update
  begin
    if rst = '1' then
      sclk:= timerout.sclk;
      scaler := timerout.scaler-1;
      masterclk := timerout.masterclk;
      tick := scaler(13) and not timerout.scaler(13);
      rscaler := timerout.sclkscaler;
      if tick = '1' then
        scaler := r.scalerup;
        masterclk := not timerout.masterclk;
        rscaler := rscaler+1;  -- generating shiftclk
        if ((not rscaler(0)) and (not rscaler(1)))='1' then
          sclk := not sclk;
        end if;
      end if;
      -- audio shiftclk generation
      timerin.sclkscaler <= rscaler;
      timerin.sclk_old <= timerout.sclk; 
      timerin.scaler <= scaler; 
      timerin.masterclk <= masterclk;
      timerin.sclk <= sclk;
    else
      timerin.sclkscaler <= "00";       --reset
      timerin.sclk_old <= '0';
      timerin.sclk <= '0';
      timerin.scaler <= "00000000000001";
      timerin.masterclk <= '0';
    end if;
  end process;
end; 


