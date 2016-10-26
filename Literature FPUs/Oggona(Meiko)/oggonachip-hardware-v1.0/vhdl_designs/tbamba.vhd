-- Test Bench for cores using AMBA Bus signals
-- LA 6.03.02
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned."+";
use IEEE.std_logic_unsigned."-";
use work.iface.all;
use work.amba.all;



entity tbamba is
  
  generic (
    doit : std_logic :='1'
    );
end tbamba;


architecture behav of tbamba is

--component ddm
--  port (
--    rst   : in  std_logic;
--    clk   : in  std_logic;
--    apbi   : in  apb_slv_in_type;
--    apbo   : out apb_slv_out_type;
--    ahbi   : in  ahb_mst_in_type;
--    ahbo   : out ahb_mst_out_type;
--    ddmi  : in  ddm_in_type;
--    ddmo  : out ddm_out_type;
--    irq   : out std_logic  );
--end component;

component mdct
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    irq   : out std_logic  );
end component;

signal clk : std_logic := '0';
signal rst    : std_logic := '0';			-- Reset
constant ct : integer := 40/2;

signal audioout  : std_logic;
signal lr_out    : std_logic;
signal shift_clk : std_logic;
signal mclk  : std_logic;
signal apbi   : APB_Slv_In_Type;
signal apbo   : apb_slv_out_type;
signal ahbi   : ahb_mst_in_type;
signal ahbo   : ahb_mst_out_type;
signal ddmi  : ddm_in_type;
signal ddmo  : ddm_out_type;
signal irq   : std_logic;

begin

-- clock and reset

  clk <= not clk after ct * 1 ns;
-- rst <= '0', '1' after 40*10 * 1 ns;
  rst <= '0', '1' after 250 ns;
-- **********************************************
-- APB control registers
-- **********************************************
-- conditions for writing memory mapped registers. Signals from APB master allowing write
	apbi.psel<='1' after 350 ns; 
	apbi.penable<='1' after 350 ns; 
	apbi.pwrite<='1' after 350 ns;
 
-- Data Bus activity

--	apbi.pwdata<="00000000000000001111100000000110" after 500 ns; -- disable mdct after process all elements
--	"00000000000000001111100000000001" after 460 ns; -- enable mdct
-- Address bus activity
	apbi.paddr(31 downto 5)<="000000000000000000000000000" after 440 ns;
	apbi.paddr(4 downto 0)<="01000" after 440 ns, --- address of size data array
	"00100" after 480 ns, -- address of start read address register
	"01100" after 520 ns, -- address of start write address register
	"00000" after 680 ns; -- address of mdct control register

-- set dma  start address

-- set dma  stop address
--	apbi.pwdata<="00000000000000001111111100000011" after 460 ns;


 


-- **********************************************
-- AHB transfers
-- **********************************************
-- AHB bus is granted and ready after requesting. Action by arbitrer.
	ahbi.hgrant<='1' after 600 ns;
	ahbi.hready<='1' after 620 ns;

--APB dat bus activity for memory mapped registers
	apbi.pwdata<="00000000000000001111100000000110" after 300 ns, -- set number of elements in array elements
	"00000000000000001111100000011000" after 460 ns, -- start read address
	"00000000000000001111100000110000" after 500 ns, -- start write address
	"00000000000000001111100000000001" after 660 ns; -- enable mdct
--"00000000000000001111100000000110" after 1450 ns; -- disable mdct



-- Data from memory on the bus
	ahbi.hrdata<="11001100110010101011000000000000" after 740 ns,
	"11001100110010101011000000000001" after 790 ns,
	"11001100110010101011000000000010" after 840 ns,
	"11001100110010101011000000000011" after 890 ns,
	"11001100110010101011000000010011" after 940 ns,
	ahbo.hwdata after 990 ns, -- in the last two values the result is the input
	ahbo.hwdata after 1040 ns;





--  amba0 : ddm -- core using amba
--       port map (rst,clk,apbi,apbo,ahbi,ahbo,ddmi,ddmo,irq);
  amba1 : mdct
       port map (rst,clk,apbi,apbo,ahbi,ahbo,irq);
end;
















