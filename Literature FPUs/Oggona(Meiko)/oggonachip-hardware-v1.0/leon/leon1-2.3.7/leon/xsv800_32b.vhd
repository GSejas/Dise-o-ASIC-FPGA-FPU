-- Last changes 29.01.02 LA

library IEEE;
use IEEE.std_logic_1164.all;
entity geniopad1 is   -- name changed. original name geniopad. LA
  port ( d, en : in std_logic; q : out std_logic; pad : inout std_logic);
end; 
architecture rtl of geniopad1 is
begin pad <= to_x01(d) when en = '0' else 'Z'; q <= to_x01(pad); end;

library IEEE;
use IEEE.std_logic_1164.all;
entity geninpad1 is -- name changed. original name geninpad. LA 
	port (pad : in std_logic; q : out std_logic); end; 
architecture rtl of geninpad1 is begin q <= to_x01(pad); end;

library IEEE;
use IEEE.std_logic_1164.all;
entity genoutpad1 is -- name changed. original name genoutpad. LA
	port (d : in  std_logic; pad : out  std_logic); end; 
architecture rtl of genoutpad1 is begin pad <= to_x01(d); end;

library IEEE;
use IEEE.std_logic_1164.all;
entity selector is
  port ( sel : in std_logic;
         ramd : inout std_logic_vector(7 downto 0);
         romd : in std_logic_vector(7 downto 0);
         datao : out std_logic_vector(7 downto 0);
         datai : in std_logic_vector(7 downto 0); 
         romsn : in std_logic;
         ramsn : in std_logic
         );
end; 
architecture rtl of selector is
begin
selpro : process(romsn,ramsn,romd,ramd,datai,sel)
begin
  if romsn='0' and ramsn='1' then
    datao<=to_x01(romd);
    ramd<="ZZZZZZZZ";
  else
    if ramsn='0' and sel='0' then
      ramd<= to_x01(datai);
    else
      ramd<="ZZZZZZZZ";
    end if;
    datao<=to_x01(ramd);
  end if;
end process;
end;

library IEEE;
use IEEE.std_logic_1164.all;
entity selector2 is
  port ( sel : in std_logic;
         ramd : inout std_logic_vector(7 downto 0);
         romd : inout std_logic_vector(7 downto 0);
         datao : out std_logic_vector(7 downto 0);
         datai : in std_logic_vector(7 downto 0); 
         romsn : in std_logic;
         ramsn : in std_logic;
         dispen : in std_logic;
         digit : in std_logic_vector(6 downto 0);
         digitextra : in std_logic
         );
end; 
architecture rtl of selector2 is

  signal romdata : std_logic_vector(7 downto 0);

begin
selpro : process(romsn,ramsn,romd,ramd,datai,sel,dispen,digit,digitextra)
begin
  if dispen='1' then
    romd<=to_x01(romdata);
  else
    romd<="ZZZZZZZZ";
  end if;
  romdata<=to_x01(romd);
  
  if romsn='0' and ramsn='1' and dispen='0' then
    datao<=romdata;
    ramd<="ZZZZZZZZ";
  else
    romdata<=digitextra&digit;
    if ramsn='0' and sel='0' then
      ramd<= to_x01(datai);
    else
      ramd<="ZZZZZZZZ";
    end if;
    datao<=to_x01(ramd);
  end if;
end process;
end;


library IEEE;
use IEEE.std_logic_1164.all;

entity xsv800 is
  port (
    resetn    : in  std_logic; 		
    clk       : in  std_logic;

    ram_address0 : out std_logic_vector(18 downto 0); 
    ram_address1 : out std_logic_vector(18 downto 0);
    ram_data     : inout std_logic_vector(31 downto 0);

    rom_address  : out std_logic_vector(20 downto 0);
    rom_data     : inout std_logic_vector(7 downto 0);
    rom_ce       : out std_logic;
    rom_oe       : out std_logic;
    rom_we       : out std_logic;
    
    ram_ce0    : out std_logic;
    ram_ce1    : out std_logic;
    ram_oe0    : out std_logic;
    ram_oe1    : out std_logic;
    ram_we0    : out std_logic;
    ram_we1    : out std_logic;
    
    sw         : in std_logic_vector(1 downto 0);

    mclk      : out std_logic;
    shift_clk  : out std_logic;
    lr_out     : out std_logic;
    audioout   : out std_logic;
    audioin    : in std_logic;

    
    RXD	      : in std_logic;
    TXD	      : out std_logic;
    
    CTS       : in std_logic;
    RTS       : out std_logic;
    
    error     : out std_logic
  );
end;


architecture xsv800_arch of xsv800 is

component leon 
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
  
      pioo      : out std_logic_vector(15 downto 0);     -- I/O port
      pioi     : in std_logic_vector(15 downto 0);
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

      wdogn    : out   std_logic;                         -- watchdog output

      test     : in    std_logic

      
    );

end component; 


component geniopad1
  port (
    d : in  std_logic; 
    en: in  std_logic;
    q : out std_logic;
    pad : inout std_logic
    );
end component;

component selector
  port ( sel : in std_logic;
         ramd : inout std_logic_vector(7 downto 0);
         romd : in std_logic_vector(7 downto 0);
         datao : out std_logic_vector(7 downto 0);
         datai : in std_logic_vector(7 downto 0);
         romsn : in std_logic;
         ramsn : in std_logic
         );
end component;

component selector2
  port ( sel : in std_logic;
         ramd : inout std_logic_vector(7 downto 0);
         romd : inout std_logic_vector(7 downto 0);
         datao : out std_logic_vector(7 downto 0);
         datai : in std_logic_vector(7 downto 0);
         romsn : in std_logic;
         ramsn : in std_logic;
         dispen : in std_logic;
         digit : in std_logic_vector(6 downto 0);
         digitextra : in std_logic
         );
end component;     

component genoutpad1 port (
  d : in  std_logic;
  pad : out  std_logic
  );
end component; 

component geninpad1 port (
  pad : in std_logic;
  q : out std_logic
  );
end component; 

    
------------
signal errorn	: std_logic;

signal address  : std_logic_vector(27 downto 0); 	

signal datain   : std_logic_vector(31 downto 0);
signal dataout  : std_logic_vector(31 downto 0);
signal datasel  : std_logic_vector(3 downto 0);

signal romdatain  : std_logic_vector(31 downto 0);
signal romdataout  : std_logic_vector(31 downto 0);
signal ramdatain  : std_logic_vector(31 downto 0);
signal ramdataout  : std_logic_vector(31 downto 0);

signal pio	: std_logic_vector(15 downto 0);
signal pioo     : std_logic_vector(15 downto 0);
signal pioi     : std_logic_vector(15 downto 0);
signal piod     : std_logic_vector(15 downto 0);
signal ramsn    : std_logic_vector(3 downto 0);
signal ramoen   : std_logic_vector(3 downto 0);
signal rwen     : std_logic_vector(3 downto 0);
signal romsn    : std_logic_vector(1 downto 0);
signal oen      : std_logic;
signal iosn     : std_logic;
signal read     : std_logic;

signal brdyn    : std_logic;
signal bexcn    : std_logic;

signal wdogn    : std_logic;			
signal test     : std_logic;
signal writen   : std_logic;
signal buttons  : std_logic_vector(3 downto 0);
signal zeros    : std_logic_vector(7 downto 0);
signal digit0    : std_logic_vector(6 downto 0);
signal digit1    : std_logic_vector(6 downto 0);
signal dispen   : std_logic;

begin


leon0 : leon
   port map(
      resetn,
      clk,	
      errorn,
      
      address,
      datain,
      dataout,
      datasel,
      ramsn,
      ramoen,
      rwen,
      
      romsn,
      iosn,
      oen,
      read,
      writen,
      
      brdyn,
      bexcn,
      
      pioo,
      pioi,
      piod,
      
      buttons,
      audioin,
      digit0,
      digit1,
      audioout,
      lr_out,
      shift_clk,
      mclk,
      dispen,
      wdogn,
      test
      );


ram_address0(18 downto 0) <= address(20 downto 2);
ram_address1(18 downto 0) <= address(20 downto 2);

rom_address(19 downto 0) <= address(19 downto 0) when dispen = '0' else "00000000000000"&digit1(6 downto 1);
rom_address(20) <= '1';

zeros <= (others => '0');
dataout0: selector2 port map (datasel(0), ram_data(31 downto 24), rom_data, datain(31 downto 24), dataout(31 downto 24), romsn(0), ramsn(0),dispen,digit0,digit1(0));
dataout1: selector port map (datasel(1), ram_data(23 downto 16), zeros, datain(23 downto 16), dataout(23 downto 16), romsn(0), ramsn(0));
dataout2: selector port map (datasel(2), ram_data(15 downto 8), zeros, datain(15 downto 8), dataout(15 downto 8), romsn(0), ramsn(0));
dataout3: selector port map (datasel(3), ram_data(7 downto 0), zeros, datain(7 downto 0), dataout(7 downto 0), romsn(0), ramsn(0));

ram_ce0 <= ramsn(0);
ram_oe0 <= ramoen(0);
ram_we0 <= rwen(0);
ram_ce1 <= ramsn(0);
ram_oe1 <= ramoen(0);
ram_we1 <= rwen(0);

rom_ce <= romsn(0) when dispen='0' else '1';
rom_oe <= oen when dispen='0' else '1';         
rom_we <= '1';

buttons <= (not(CTS)&(not(sw))&'0') when dispen='1' else "0000";


pioi(0)<='0';                           -- set ROM width to 8 bit
pioi(1)<='0';

outpad01: genoutpad1 port map (pioo(13),RTS);
outpad02: genoutpad1 port map (pioo(15),TXD);         
inpad01: geninpad1 port map (CTS,pioi(12));
inpad02: geninpad1 port map (RXD,pioi(14));

brdyn <='1';
bexcn <='1';

error <= errorn;  --errorn is open drain output

end xsv800_arch;


