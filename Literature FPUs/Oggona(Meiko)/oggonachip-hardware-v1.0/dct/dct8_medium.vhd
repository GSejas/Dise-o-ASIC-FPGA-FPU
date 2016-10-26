-- DO NOT use WORD WRAP to view properly
-- IDCT-M is a medium speed 1D IDCT core
-- it can accept a continous stream of 12-bit input words at a rate of
-- 1 bit/ck cycle, operating at 50MHz speed, it can process MP@ML MPEG video
-- the core is 100% synthesizable
-- 
-- Designed by Sherif Taher Eid, sherif_taher@ieee.org
-- 
-- Top entity is DCT8_final
-- 
-- ENTITY DCT8_final IS
--    PORT( 
--       bit_in_even : IN     std_logic  ;
--       bit_in_odd  : IN     std_logic  ;
--       clk         : IN     std_ulogic  ;
--       reset_int   : IN     std_ulogic  ;
--       indicate    : OUT    std_logic_vector (3 DOWNTO 0) ;
--       minus_out   : OUT    unsigned (11 DOWNTO 0) ;
--       plus_out    : OUT    unsigned (11 DOWNTO 0)
--    );
-- 
-- The core is used for IDCT calculation
-- input words are assumed to be of 12 bits length
-- for a certain input vector
-- 
-- I = [I0 I1 I2 I3 I4 I5 I6 I7]
-- 
-- an output vector is created which is the 1D IDCT of I
-- 
-- x = [x0 x1 x2 x3 x4 x5 x6 x7]
-- 
-- there are two single bit inputs "bit_in_even" and "bit_in_odd"
-- 
-- knowing that every input word is composed of 12 bits 
-- 
-- e.g. I1[11 downto 0], I1[0] is the LSB
-- 
-- when inputing a certain word to the core start with the LSB
-- 
-- time (ck cycles): 0     1     2     3  ............. 12 ........
-- 
-- input           :       I1[0] I1[1] I1[2] .......... I1[11] .... 
-- 
-- input to the core is as follows
-- 
-- time (ck cycles):   0     12    24    36    48    60    72    84
-- 
-- bit_in_even     :   I0... I2... I4... I6... input the next 4 even words
-- 
-- bit_in_odd      :   I1... I3....I5... I7... input the next 4 odd words
-- 
-- assert the intial LSB bits at the first rising edge after asserting 
-- "reset" to '0'. "reset" is active '1'
-- 
-- output comes out in the form of parallel 12-bit words, the "indicate"
-- 
-- vector is a 4-bit output showing proper instances and orders of the output words as follows
-- 
-- 
-- indicate (stable value at ck rising_edge)  :     0001     0010     0100     1000
-- 
-- plus_out                                   :      x0       x1       x2       x3
-- 
-- minus_out                                  :      x7       x6       x5       x4
-- 
-- any further inquiries please contact sherif_taher@ieee.org


LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY add12signed IS
   PORT( 
      a      : IN     unsigned (11 DOWNTO 0) ;
      b      : IN     unsigned (11 DOWNTO 0) ;
      output : OUT    unsigned (12 DOWNTO 0)
   );

-- Declarations

END add12signed ;

ARCHITECTURE beh OF add12signed IS

signal outtemp : signed(12 downto 0);

BEGIN

outtemp <= signed(a(11)&a) + signed(b(11)&b);
output <= unsigned(outtemp);

END beh;

LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY add14signed IS
   PORT( 
      ain    : IN     unsigned (13 DOWNTO 0) ;
      bin    : IN     unsigned (13 DOWNTO 0) ;
      output : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END add14signed ;
--
--
ARCHITECTURE beh OF add14signed IS

signal outtemp : signed(13 downto 0);

BEGIN

outtemp <= signed(ain) + signed(bin);
output <= unsigned(outtemp);

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY controller IS
   PORT( 
      clk     : IN     std_ulogic  ;
      reset   : IN     std_ulogic  ;
      clk1    : OUT    std_ulogic  ;
      clk2    : OUT    std_ulogic  ;
      compl   : OUT    std_ulogic  ;
      enable0 : OUT    std_ulogic  ;
      enable1 : OUT    std_ulogic  ;
      address : BUFFER unsigned (1 DOWNTO 0)
   );

-- Declarations

END controller ;
--
--
ARCHITECTURE beh OF controller IS


BEGIN

main : process(clk)

variable count : integer := 0;
variable state : integer range 1 to 20 := 19;

begin

if rising_edge(clk) then
	if (reset = '1')then
		clk1 <= '0';
		clk2 <= '0';
		enable0 <= '0';
		enable1 <= '0';
		compl <= '0';
		address <= "00";
		count := 0;
		state := 1;	

	else
		case state is 
			
			when 1 =>
				enable0 <= '1';
				enable1 <= '1';
				state := 2;
			when 2 =>
				state := 3;
			when 3 =>
				state := 4;
			when 4 =>
				state := 5;
			when 5 =>
				state := 6;
			when 6 =>
				state := 7;
			when 7 =>
				state := 8;
			when 8 =>
				state := 9;
			when 9 =>
				state := 10;
			when 10 =>
				state := 11;
			when 11 =>
				state := 12;
			when 12 =>
				compl <= '1';
				state := 13;
			when 13 =>
				compl <= '0';
				state := 14;
			when 14 =>
				state := 20;
			when 20 =>
				clk1 <= '1';
				enable0 <= '0';
				address <= address + "01";
				count := count + 1;
				state := 15;
			when 15 =>
				clk1 <= '0';
				enable0 <= '1';
				state := 16;
			when 16 =>
				if count = 4 then
					clk2 <= '1';
					state := 19;
				else
					state := 17;
				end if;
			when 17 =>
				state := 18;
			when 18 =>
				state := 2;
				enable0 <= '1';
				enable1 <= '1';
			when 19 =>
				clk1 <= '0';
				clk2 <= '0';
				enable0 <= '0';
				enable1 <= '0';
				compl <= '0';
				address <= "00";
				count := 0;
				state := 1;	
		end case;
	end if;
end if;
end process main;

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY delay_e IS
   PORT( 
      clk            : IN     std_ulogic  ;
      d_in           : IN     unsigned (6 DOWNTO 0) ;
      enable_rom     : IN     std_ulogic  ;
      reset          : IN     std_ulogic  ;
      address_out    : OUT    unsigned (1 DOWNTO 0) ;
      clk1out        : OUT    std_ulogic  ;
      clk2out        : OUT    std_ulogic  ;
      compl_out      : OUT    std_ulogic  ;
      d_out          : OUT    unsigned (6 DOWNTO 0) ;
      enable_1_out   : OUT    std_ulogic  ;
      enable_out     : OUT    std_ulogic  ;
      enable_rom_out : OUT    std_ulogic  ;
      reset_out      : OUT    std_ulogic 
   );

-- Declarations

END delay_e ;
--
--
ARCHITECTURE beha OF delay_e IS

signal d_int : unsigned(6 downto 0);
signal enable_rom_int : std_ulogic;

BEGIN

reset_out <= reset;

process(clk,reset)
begin
	if reset = '0' then
			d_int <= "0000000";
			enable_rom_int <= '0';
			
			d_out <= "0000000";
			address_out <= "00";
			clk1out <= '0';
			clk2out <= '0';
			compl_out <= '0';
			enable_out <= '0';
			enable_1_out <= '0';
			enable_rom_out <= '0';
	else
		if rising_edge(clk) then
			d_int <= d_in;
			enable_rom_int <= enable_rom;

			d_out <= d_int;
			address_out <= d_int(6 downto 5);
			clk1out <= d_int(4);
			clk2out <= d_int(3);
			compl_out <= d_int(2);
			enable_out <= d_int(1);
			enable_1_out <= d_int(0);
			enable_rom_out <= enable_rom_int;
		end if;
	end if;
end process;


END beha;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY div2 IS
   PORT( 
      Sin  : IN     unsigned (12 downto 0) ;
      Sout : OUT    unsigned (11 downto 0)
   );

-- Declarations

END div2 ;
--
--
ARCHITECTURE arch OF div2 IS
BEGIN

Sout <= Sin(12 downto 1);


END arch;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mux_adder IS
   PORT( 
      clk       : IN     std_ulogic  ;
      dbus00    : IN     unsigned (13 DOWNTO 0) ;
      dbus01    : IN     unsigned (13 DOWNTO 0) ;
      dbus02    : IN     unsigned (13 DOWNTO 0) ;
      dbus03    : IN     unsigned (13 DOWNTO 0) ;
      dbuse0    : IN     unsigned (13 DOWNTO 0) ;
      dbuse1    : IN     unsigned (13 DOWNTO 0) ;
      dbuse2    : IN     unsigned (13 DOWNTO 0) ;
      dbuse3    : IN     unsigned (13 DOWNTO 0) ;
      reset_int : IN     std_ulogic  ;
      sig00     : IN     std_ulogic  ;
      sig01     : IN     std_ulogic  ;
      sig02     : IN     std_ulogic  ;
      sig03     : IN     std_ulogic  ;
      indicate  : OUT    std_logic_vector (3 DOWNTO 0) ;
      minus     : OUT    unsigned (12 DOWNTO 0) ;
      plus      : OUT    unsigned (12 DOWNTO 0)
   );

-- Declarations

END mux_adder ;
--
--
ARCHITECTURE behavioral OF mux_adder IS

signal x00,x01,x02,x03,xe0,xe1,xe2,xe3 : unsigned(12 downto 0);
signal plustmp,minustmp : unsigned(12 downto 0);
--signal sig00_d,sig01_d,sig02_d,sig03_d : std_ulogic;

BEGIN

-- concurrent signal assignments

x00 <= dbus00(13)&dbus00(13 downto 2);
x01 <= dbus01(13)&dbus01(13 downto 2);
x02 <= dbus02(13)&dbus02(13 downto 2);
x03 <= dbus03(13)&dbus03(13 downto 2);
xe0 <= dbuse0(13)&dbuse0(13 downto 2);
xe1 <= dbuse1(13)&dbuse1(13 downto 2);
xe2 <= dbuse2(13)&dbuse2(13 downto 2);
xe3 <= dbuse3(13)&dbuse3(13 downto 2);

--plus <= unsigned(plustmp);
--minus <= unsigned(minustmp);
plus <= plustmp;
minus <= minustmp;


process(reset_int,clk)
begin

if reset_int = '1' then
	plustmp <= "0000000000000";
	minustmp <= "0000000000000";
	indicate <= "0000";
else
	if rising_edge(clk) then
		if sig00 = '1' then
			plustmp <= x00 + xe0;
			minustmp <= x00 - xe0;
			indicate <= "0001";
		elsif sig01 = '1' then
			plustmp <= x01 + xe1;
			minustmp <= x01 - xe1;
			indicate <= "0010";
		elsif sig02 = '1' then
			plustmp <= x02 + xe2;
			minustmp <= x02 - xe2;
			indicate <= "0100";
		elsif sig03 = '1' then
			plustmp <= x03 + xe3;
			minustmp <= x03 - xe3;
			indicate <= "1000";
		else
			indicate <= "0000";
		end if;
	end if;
end if;			

end process;

END behavioral;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY reg12b IS
   PORT( 
      ain    : IN     unsigned (11 DOWNTO 0) ;
      clk    : IN     std_ulogic  ;
      enable : IN     std_ulogic  ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END reg12b ;
--
--
ARCHITECTURE beh OF reg12b IS
BEGIN

process(clk,enable)
begin
	if enable = '0' then
		aout <= "000000000000";
	else
		if rising_edge(clk) then
			aout <= ain;
		end if;
	end if;
end process;


END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY reg13b IS
   PORT( 
      ain    : IN     unsigned (12 DOWNTO 0) ;
      clk    : IN     std_ulogic  ;
      enable : IN     std_ulogic  ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );

-- Declarations

END reg13b ;
--
--
ARCHITECTURE beh OF reg13b IS
BEGIN

process(clk,enable)
begin
	if enable = '0' then
		aout <= "0000000000000";
	else
		if rising_edge(clk) then
			aout <= ain;
		end if;
	end if;
end process;

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY reg14b IS
   PORT( 
      ain    : IN     unsigned (13 DOWNTO 0) ;
      clk    : IN     std_ulogic  ;
      enable : IN     std_ulogic  ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END reg14b ;
--
--
ARCHITECTURE beh OF reg14b IS
BEGIN

process(clk,enable)
begin
	if enable = '0' then
		aout <= "00000000000000";
	else
		if rising_edge(clk) then
			aout <= ain;
		end if;
	end if;
end process;

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROM1C IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      compl      : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      coeff_out  : OUT    unsigned (11 downto 0)
   );

-- Declarations

END ROM1C ;
--
-- ROM coefficients for calculating X00

ARCHITECTURE behave_rom OF ROM1C IS

type ROM_array is array (7 downto 0) of unsigned(11 downto 0);
signal coeff: ROM_array;
signal addr : integer range 0 to 7;
--signal comptemp : unsigned(1 downto 0);

BEGIN

coeff(0) <= "010110101000";    --     A
coeff(1) <= "011101100100";    --     B
coeff(2) <= "010110101000";    --     A
coeff(3) <= "001100010000";    --     C

-- Complementary values
coeff(4) <= "101001011000";    --     -A
coeff(5) <= "100010011100";    --     -B
coeff(6) <= "101001011000";    --     -A
coeff(7) <= "110011110000";    --     -C


--comptemp <= CONV_UNSIGNED(compl,2);
--addr <= CONV_INTEGER(comptemp&addr2);
addr <= CONV_INTEGER(compl&addr2);

--with enable_rom select
--	coeff_out <= "000000000000" when '0',
--	             coeff(addr) when '1',
--		     "000000000000" when others;
	
coeff_out <= coeff(addr) when enable_rom = '1' else "000000000000";
	

END behave_rom;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROMC_01 IS
   PORT( 
      addr2      : IN     unsigned (1 downto 0) ;
      compl      : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END ROMC_01 ;
--
--
ARCHITECTURE beh OF ROMC_01 IS

type ROM_array is array (7 downto 0) of unsigned(11 downto 0);
signal coeff: ROM_array;
signal addr : integer range 0 to 7;
--signal comptemp : unsigned(1 downto 0);

signal ap : unsigned(11 downto 0) := "010110101000";
signal bp : unsigned(11 downto 0) := "011101100100";
signal cp : unsigned(11 downto 0) := "001100010000";
signal dp : unsigned(11 downto 0) := "011111011001";
signal ep : unsigned(11 downto 0) := "011010100111";
signal fp : unsigned(11 downto 0) := "010001110010";
signal gp : unsigned(11 downto 0) := "000110010000";

signal am : unsigned(11 downto 0) := "101001011000";
signal bm : unsigned(11 downto 0) := "100010011100";
signal cm : unsigned(11 downto 0) := "110011110000";
signal dm : unsigned(11 downto 0) := "100000100111";
-- signal em : unsigned(11 downto 0) := "100101011001"; -- NOT used
signal fm : unsigned(11 downto 0) := "101110001110";
signal gm : unsigned(11 downto 0) := "111001110000";

BEGIN

coeff(0) <= ap;    --     A
coeff(1) <= cp;    --     C
coeff(2) <= am;    --     -A
coeff(3) <= bm;    --     -B

-- Complementary values
coeff(4) <= am;    --     -A
coeff(5) <= cm;    --     -C
coeff(6) <= ap;    --     A
coeff(7) <= bp;    --     B


--comptemp <= CONV_UNSIGNED(compl,2);
--addr <= CONV_INTEGER(comptemp&addr2);
addr <= CONV_INTEGER(compl&addr2);

--with enable_rom select
--	coeff_out <= "000000000000" when '0',
--	             coeff(addr) when '1',
--		     "000000000000" when others;
	
with enable_rom select
coeff_out <= coeff(addr) when '1',
			     "000000000000" when others;
	

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROMC_02 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      compl      : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END ROMC_02 ;
--
--
ARCHITECTURE beh OF ROMC_02 IS

type ROM_array is array (7 downto 0) of unsigned(11 downto 0);
signal coeff: ROM_array;
signal addr : integer range 0 to 7;
--signal comptemp : unsigned(1 downto 0);

signal ap : unsigned(11 downto 0) := "010110101000";
signal bp : unsigned(11 downto 0) := "011101100100";
signal cp : unsigned(11 downto 0) := "001100010000";
signal dp : unsigned(11 downto 0) := "011111011001";
signal ep : unsigned(11 downto 0) := "011010100111";
signal fp : unsigned(11 downto 0) := "010001110010";
signal gp : unsigned(11 downto 0) := "000110010000";

signal am : unsigned(11 downto 0) := "101001011000";
signal bm : unsigned(11 downto 0) := "100010011100";
signal cm : unsigned(11 downto 0) := "110011110000";
signal dm : unsigned(11 downto 0) := "100000100111";
-- signal em : unsigned(11 downto 0) := "100101011001"; -- NOT used
signal fm : unsigned(11 downto 0) := "101110001110";
signal gm : unsigned(11 downto 0) := "111001110000";

BEGIN

coeff(0) <= ap;    --     A
coeff(1) <= cm;    --     -C
coeff(2) <= am;    --     -A
coeff(3) <= bp;    --     B

-- Complementary values
coeff(4) <= am;    --     -A
coeff(5) <= cp;    --     C
coeff(6) <= ap;    --     A
coeff(7) <= bm;    --     -B


--comptemp <= CONV_UNSIGNED(compl,2);
--addr <= CONV_INTEGER(comptemp&addr2);
addr <= CONV_INTEGER(compl&addr2);

--with enable_rom select
--	coeff_out <= "000000000000" when '0',
--	             coeff(addr) when '1',
--		     "000000000000" when others;
	
with enable_rom select
coeff_out <= coeff(addr) when '1',
			     "000000000000" when others;
	

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROMC_03 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      compl      : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END ROMC_03 ;
--
--
ARCHITECTURE beh OF ROMC_03 IS
type ROM_array is array (7 downto 0) of unsigned(11 downto 0);
signal coeff: ROM_array;
signal addr : integer range 0 to 7;
--signal comptemp : unsigned(1 downto 0);

signal ap : unsigned(11 downto 0) := "010110101000";
signal bp : unsigned(11 downto 0) := "011101100100";
signal cp : unsigned(11 downto 0) := "001100010000";
signal dp : unsigned(11 downto 0) := "011111011001";
signal ep : unsigned(11 downto 0) := "011010100111";
signal fp : unsigned(11 downto 0) := "010001110010";
signal gp : unsigned(11 downto 0) := "000110010000";

signal am : unsigned(11 downto 0) := "101001011000";
signal bm : unsigned(11 downto 0) := "100010011100";
signal cm : unsigned(11 downto 0) := "110011110000";
signal dm : unsigned(11 downto 0) := "100000100111";
-- signal em : unsigned(11 downto 0) := "100101011001"; -- NOT used
signal fm : unsigned(11 downto 0) := "101110001110";
signal gm : unsigned(11 downto 0) := "111001110000";

BEGIN

coeff(0) <= ap;    --     A
coeff(1) <= bm;    --     -B
coeff(2) <= ap;    --     A
coeff(3) <= cm;    --     -C

-- Complementary values
coeff(4) <= am;    --     -A
coeff(5) <= bp;    --     B
coeff(6) <= am;    --     -A
coeff(7) <= cp;    --     C


--comptemp <= CONV_UNSIGNED(compl,2);
--addr <= CONV_INTEGER(comptemp&addr2);
addr <= CONV_INTEGER(compl&addr2);


--with enable_rom select
--	coeff_out <= "000000000000" when '0',
--	             coeff(addr) when '1',
--		     "000000000000" when others;
	
with enable_rom select
coeff_out <= coeff(addr) when '1',
			     "000000000000" when others;
	

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROMC_e0 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      compl      : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END ROMC_e0 ;
--
--
ARCHITECTURE beh OF ROMC_e0 IS
type ROM_array is array (7 downto 0) of unsigned(11 downto 0);
signal coeff: ROM_array;
signal addr : integer range 0 to 7;
--signal comptemp : unsigned(1 downto 0);

signal ap : unsigned(11 downto 0) := "010110101000";
signal bp : unsigned(11 downto 0) := "011101100100";
signal cp : unsigned(11 downto 0) := "001100010000";
signal dp : unsigned(11 downto 0) := "011111011001";
signal ep : unsigned(11 downto 0) := "011010100111";
signal fp : unsigned(11 downto 0) := "010001110010";
signal gp : unsigned(11 downto 0) := "000110010000";

signal am : unsigned(11 downto 0) := "101001011000";
signal bm : unsigned(11 downto 0) := "100010011100";
signal cm : unsigned(11 downto 0) := "110011110000";
signal dm : unsigned(11 downto 0) := "100000100111";
signal em : unsigned(11 downto 0) := "100101011001"; -- NOT used
signal fm : unsigned(11 downto 0) := "101110001110";
signal gm : unsigned(11 downto 0) := "111001110000";

BEGIN

coeff(0) <= dp;    --     D
coeff(1) <= ep;    --     E
coeff(2) <= fp;    --     F
coeff(3) <= gp;    --     G

-- Complementary values
coeff(4) <= dm;    --     -D
coeff(5) <= em;    --     -E
coeff(6) <= fm;    --     -F
coeff(7) <= gm;    --     -G


--comptemp <= CONV_UNSIGNED(compl,2);
--addr <= CONV_INTEGER(comptemp&addr2);
addr <= CONV_INTEGER(compl&addr2);


--with enable_rom select
--	coeff_out <= "000000000000" when '0',
--	             coeff(addr) when '1',
--		     "000000000000" when others;
	
with enable_rom select
coeff_out <= coeff(addr) when '1',
			     "000000000000" when others;
	
END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROMC_e1 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      compl      : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END ROMC_e1 ;
--
--
ARCHITECTURE beh OF ROMC_e1 IS
type ROM_array is array (7 downto 0) of unsigned(11 downto 0);
signal coeff: ROM_array;
signal addr : integer range 0 to 7;
--signal comptemp : unsigned(1 downto 0);

signal ap : unsigned(11 downto 0) := "010110101000";
signal bp : unsigned(11 downto 0) := "011101100100";
signal cp : unsigned(11 downto 0) := "001100010000";
signal dp : unsigned(11 downto 0) := "011111011001";
signal ep : unsigned(11 downto 0) := "011010100111";
signal fp : unsigned(11 downto 0) := "010001110010";
signal gp : unsigned(11 downto 0) := "000110010000";

signal am : unsigned(11 downto 0) := "101001011000";
signal bm : unsigned(11 downto 0) := "100010011100";
signal cm : unsigned(11 downto 0) := "110011110000";
signal dm : unsigned(11 downto 0) := "100000100111";
signal em : unsigned(11 downto 0) := "100101011001"; -- NOT used
signal fm : unsigned(11 downto 0) := "101110001110";
signal gm : unsigned(11 downto 0) := "111001110000";

BEGIN

coeff(0) <= ep;    --     E
coeff(1) <= gm;    --     -G
coeff(2) <= dm;    --     -D
coeff(3) <= fm;    --     -F

-- Complementary values
coeff(4) <= em;    --     -E
coeff(5) <= gp;    --     G
coeff(6) <= dp;    --     D
coeff(7) <= fp;    --     F


--comptemp <= CONV_UNSIGNED(compl,2);
--addr <= CONV_INTEGER(comptemp&addr2);
addr <= CONV_INTEGER(compl&addr2);


--with enable_rom select
--	coeff_out <= "000000000000" when '0',
--	             coeff(addr) when '1',
--		     "000000000000" when others;
	
with enable_rom select
coeff_out <= coeff(addr) when '1',
			     "000000000000" when others;
	

END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROMC_e2 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      compl      : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END ROMC_e2 ;
--
--
ARCHITECTURE beh OF ROMC_e2 IS
type ROM_array is array (7 downto 0) of unsigned(11 downto 0);
signal coeff: ROM_array;
signal addr : integer range 0 to 7;
--signal comptemp : unsigned(1 downto 0);

signal ap : unsigned(11 downto 0) := "010110101000";
signal bp : unsigned(11 downto 0) := "011101100100";
signal cp : unsigned(11 downto 0) := "001100010000";
signal dp : unsigned(11 downto 0) := "011111011001";
signal ep : unsigned(11 downto 0) := "011010100111";
signal fp : unsigned(11 downto 0) := "010001110010";
signal gp : unsigned(11 downto 0) := "000110010000";

signal am : unsigned(11 downto 0) := "101001011000";
signal bm : unsigned(11 downto 0) := "100010011100";
signal cm : unsigned(11 downto 0) := "110011110000";
signal dm : unsigned(11 downto 0) := "100000100111";
signal em : unsigned(11 downto 0) := "100101011001"; -- NOT used
signal fm : unsigned(11 downto 0) := "101110001110";
signal gm : unsigned(11 downto 0) := "111001110000";

BEGIN

coeff(0) <= fp;    --     F
coeff(1) <= dm;    --     -D
coeff(2) <= gp;    --     G
coeff(3) <= ep;    --     E

-- Complementary values
coeff(4) <= fm;    --     -F
coeff(5) <= dp;    --     D
coeff(6) <= gm;    --     -G
coeff(7) <= em;    --     -E


--comptemp <= CONV_UNSIGNED(compl,2);
--addr <= CONV_INTEGER(comptemp&addr2);
addr <= CONV_INTEGER(compl&addr2);


--with enable_rom select
--	coeff_out <= "000000000000" when '0',
--	             coeff(addr) when '1',
--		     "000000000000" when others;
	
with enable_rom select
coeff_out <= coeff(addr) when '1',
			     "000000000000" when others;
	END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROMC_e3 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      compl      : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END ROMC_e3 ;
--
--
ARCHITECTURE beh OF ROMC_e3 IS
type ROM_array is array (7 downto 0) of unsigned(11 downto 0);
signal coeff: ROM_array;
signal addr : integer range 0 to 7;
--signal comptemp : unsigned(1 downto 0);

signal ap : unsigned(11 downto 0) := "010110101000";
signal bp : unsigned(11 downto 0) := "011101100100";
signal cp : unsigned(11 downto 0) := "001100010000";
signal dp : unsigned(11 downto 0) := "011111011001";
signal ep : unsigned(11 downto 0) := "011010100111";
signal fp : unsigned(11 downto 0) := "010001110010";
signal gp : unsigned(11 downto 0) := "000110010000";

signal am : unsigned(11 downto 0) := "101001011000";
signal bm : unsigned(11 downto 0) := "100010011100";
signal cm : unsigned(11 downto 0) := "110011110000";
signal dm : unsigned(11 downto 0) := "100000100111";
signal em : unsigned(11 downto 0) := "100101011001"; -- NOT used
signal fm : unsigned(11 downto 0) := "101110001110";
signal gm : unsigned(11 downto 0) := "111001110000";

BEGIN

coeff(0) <= gp;    --     G
coeff(1) <= fm;    --     -F
coeff(2) <= ep;    --     E
coeff(3) <= dm;    --     -D

-- Complementary values
coeff(4) <= gm;    --     -G
coeff(5) <= fp;    --     F
coeff(6) <= em;    --     -E
coeff(7) <= dp;    --     D


--comptemp <= CONV_UNSIGNED(compl,2);
--addr <= CONV_INTEGER(comptemp&addr2);
addr <= CONV_INTEGER(compl&addr2);


--with enable_rom select
--	coeff_out <= "000000000000" when '0',
--	             coeff(addr) when '1',
--		     "000000000000" when others;
	
with enable_rom select
coeff_out <= coeff(addr) when '1',
			     "000000000000" when others;
	
END beh;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MACX00 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      clk        : IN     std_ulogic  ;
      clk_1      : IN     std_ulogic  ;
      clk_2      : IN     std_ulogic  ;
      compl      : IN     std_ulogic  ;
      enable     : IN     std_ulogic  ;
      enable_1   : IN     std_ulogic  ;
      enable_2   : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END MACX00 ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF MACX00 IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL Sout      : unsigned(11 DOWNTO 0);
SIGNAL aout      : unsigned(11 DOWNTO 0);
SIGNAL aout_1    : unsigned(12 DOWNTO 0);
SIGNAL aout_2    : unsigned(13 DOWNTO 0);
SIGNAL bin       : unsigned(13 DOWNTO 0);
SIGNAL coeff_out : unsigned(11 downto 0);
SIGNAL output    : unsigned(12 DOWNTO 0);
SIGNAL output_1  : unsigned(13 DOWNTO 0);

-- Component Declarations
COMPONENT ROM1C
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      compl      : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      coeff_out  : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT add12signed
   PORT (
      a      : IN     unsigned (11 DOWNTO 0);
      b      : IN     unsigned (11 DOWNTO 0);
      output : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add14signed
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      bin    : IN     unsigned (13 DOWNTO 0);
      output : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT div2
   PORT (
      Sin  : IN     unsigned (12 downto 0);
      Sout : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12b
   PORT (
      ain    : IN     unsigned (11 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg13b
   PORT (
      ain    : IN     unsigned (12 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg14b
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROM1C USE ENTITY work.ROM1C;
FOR ALL : add12signed USE ENTITY work.add12signed;
FOR ALL : add14signed USE ENTITY work.add14signed;
FOR ALL : div2 USE ENTITY work.div2;
FOR ALL : reg12b USE ENTITY work.reg12b;
FOR ALL : reg13b USE ENTITY work.reg13b;
FOR ALL : reg14b USE ENTITY work.reg14b;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 1 eb1
bin <= aout_1(12)&aout_1;


   -- Instance port mappings.
   I0 : ROM1C
      PORT MAP (
         addr2      => addr2,
         compl      => compl,
         enable_rom => enable_rom,
         coeff_out  => coeff_out
      );
   I2 : add12signed
      PORT MAP (
         a      => Sout,
         b      => aout,
         output => output
      );
   I5 : add14signed
      PORT MAP (
         ain    => aout_2,
         bin    => bin,
         output => output_1
      );
   I4 : div2
      PORT MAP (
         Sin  => aout_1,
         Sout => Sout
      );
   I1 : reg12b
      PORT MAP (
         ain    => coeff_out,
         clk    => clk,
         enable => enable,
         aout   => aout
      );
   I3 : reg13b
      PORT MAP (
         ain    => output,
         clk    => clk,
         enable => enable,
         aout   => aout_1
      );
   I6 : reg14b
      PORT MAP (
         ain    => output_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => aout_2
      );
   I7 : reg14b
      PORT MAP (
         ain    => aout_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => aout_3
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MACX01 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      clk        : IN     std_ulogic  ;
      clk_1      : IN     std_ulogic  ;
      clk_2      : IN     std_ulogic  ;
      compl      : IN     std_ulogic  ;
      enable     : IN     std_ulogic  ;
      enable_1   : IN     std_ulogic  ;
      enable_2   : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END MACX01 ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF MACX01 IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL Sout      : unsigned(11 DOWNTO 0);
SIGNAL aout      : unsigned(11 DOWNTO 0);
SIGNAL aout_1    : unsigned(12 DOWNTO 0);
SIGNAL aout_2    : unsigned(13 DOWNTO 0);
SIGNAL bin       : unsigned(13 DOWNTO 0);
SIGNAL coeff_out : unsigned(11 downto 0);
SIGNAL output    : unsigned(12 DOWNTO 0);
SIGNAL output_1  : unsigned(13 DOWNTO 0);

-- Component Declarations
COMPONENT ROMC_01
   PORT (
      addr2      : IN     unsigned (1 downto 0);
      compl      : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add12signed
   PORT (
      a      : IN     unsigned (11 DOWNTO 0);
      b      : IN     unsigned (11 DOWNTO 0);
      output : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add14signed
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      bin    : IN     unsigned (13 DOWNTO 0);
      output : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT div2
   PORT (
      Sin  : IN     unsigned (12 downto 0);
      Sout : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12b
   PORT (
      ain    : IN     unsigned (11 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg13b
   PORT (
      ain    : IN     unsigned (12 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg14b
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROMC_01 USE ENTITY work.ROMC_01;
FOR ALL : add12signed USE ENTITY work.add12signed;
FOR ALL : add14signed USE ENTITY work.add14signed;
FOR ALL : div2 USE ENTITY work.div2;
FOR ALL : reg12b USE ENTITY work.reg12b;
FOR ALL : reg13b USE ENTITY work.reg13b;
FOR ALL : reg14b USE ENTITY work.reg14b;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 2 eb2
bin <= aout_1(12)&aout_1;


   -- Instance port mappings.
   I0 : ROMC_01
      PORT MAP (
         addr2      => addr2,
         compl      => compl,
         enable_rom => enable_rom,
         coeff_out  => coeff_out
      );
   I3 : add12signed
      PORT MAP (
         a      => Sout,
         b      => aout,
         output => output
      );
   I6 : add14signed
      PORT MAP (
         ain    => aout_2,
         bin    => bin,
         output => output_1
      );
   I5 : div2
      PORT MAP (
         Sin  => aout_1,
         Sout => Sout
      );
   I2 : reg12b
      PORT MAP (

         ain    => coeff_out,
         clk    => clk,
         enable => enable,
         aout   => aout
      );
   I4 : reg13b
      PORT MAP (
         ain    => output,
         clk    => clk,
         enable => enable,
         aout   => aout_1
      );
   I7 : reg14b
      PORT MAP (
         ain    => output_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => aout_2
      );
   I8 : reg14b
      PORT MAP (
         ain    => aout_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => aout_3
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MACX02 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      clk        : IN     std_ulogic  ;
      clk_1      : IN     std_ulogic  ;
      clk_2      : IN     std_ulogic  ;
      compl      : IN     std_ulogic  ;
      enable     : IN     std_ulogic  ;
      enable_1   : IN     std_ulogic  ;
      enable_2   : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END MACX02 ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF MACX02 IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL Sout      : unsigned(11 DOWNTO 0);
SIGNAL aout      : unsigned(11 DOWNTO 0);
SIGNAL aout_1    : unsigned(12 DOWNTO 0);
SIGNAL aout_2    : unsigned(13 DOWNTO 0);
SIGNAL bin       : unsigned(13 DOWNTO 0);
SIGNAL coeff_out : unsigned(11 downto 0);
SIGNAL output    : unsigned(12 DOWNTO 0);
SIGNAL output_1  : unsigned(13 DOWNTO 0);

-- Component Declarations
COMPONENT ROMC_02
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      compl      : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add12signed
   PORT (
      a      : IN     unsigned (11 DOWNTO 0);
      b      : IN     unsigned (11 DOWNTO 0);
      output : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add14signed
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      bin    : IN     unsigned (13 DOWNTO 0);
      output : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT div2
   PORT (
      Sin  : IN     unsigned (12 downto 0);
      Sout : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12b
   PORT (
      ain    : IN     unsigned (11 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg13b
   PORT (
      ain    : IN     unsigned (12 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg14b
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROMC_02 USE ENTITY work.ROMC_02;
FOR ALL : add12signed USE ENTITY work.add12signed;
FOR ALL : add14signed USE ENTITY work.add14signed;
FOR ALL : div2 USE ENTITY work.div2;
FOR ALL : reg12b USE ENTITY work.reg12b;
FOR ALL : reg13b USE ENTITY work.reg13b;
FOR ALL : reg14b USE ENTITY work.reg14b;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 2 eb2
bin <= aout_1(12)&aout_1;


   -- Instance port mappings.
   I0 : ROMC_02
      PORT MAP (
         addr2      => addr2,
         compl      => compl,
         enable_rom => enable_rom,
         coeff_out  => coeff_out
      );
   I3 : add12signed
      PORT MAP (
         a      => Sout,
         b      => aout,
         output => output
      );
   I6 : add14signed
      PORT MAP (
         ain    => aout_2,
         bin    => bin,
         output => output_1
      );
   I5 : div2
      PORT MAP (
         Sin  => aout_1,
         Sout => Sout
      );
   I2 : reg12b
      PORT MAP (

         ain    => coeff_out,
         clk    => clk,
         enable => enable,
         aout   => aout
      );
   I4 : reg13b
      PORT MAP (
         ain    => output,
         clk    => clk,
         enable => enable,
         aout   => aout_1
      );
   I7 : reg14b
      PORT MAP (
         ain    => output_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => aout_2
      );
   I8 : reg14b
      PORT MAP (
         ain    => aout_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => aout_3
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MACX03 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      clk        : IN     std_ulogic  ;
      clk_1      : IN     std_ulogic  ;
      clk_2      : IN     std_ulogic  ;
      compl      : IN     std_ulogic  ;
      enable     : IN     std_ulogic  ;
      enable_1   : IN     std_ulogic  ;
      enable_2   : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END MACX03 ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF MACX03 IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL Sout      : unsigned(11 DOWNTO 0);
SIGNAL aout      : unsigned(11 DOWNTO 0);
SIGNAL aout_1    : unsigned(12 DOWNTO 0);
SIGNAL aout_2    : unsigned(13 DOWNTO 0);
SIGNAL bin       : unsigned(13 DOWNTO 0);
SIGNAL coeff_out : unsigned(11 downto 0);
SIGNAL output    : unsigned(12 DOWNTO 0);
SIGNAL output_1  : unsigned(13 DOWNTO 0);

-- Component Declarations
COMPONENT ROMC_03
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      compl      : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add12signed
   PORT (
      a      : IN     unsigned (11 DOWNTO 0);
      b      : IN     unsigned (11 DOWNTO 0);
      output : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add14signed
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      bin    : IN     unsigned (13 DOWNTO 0);
      output : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT div2
   PORT (
      Sin  : IN     unsigned (12 downto 0);
      Sout : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12b
   PORT (
      ain    : IN     unsigned (11 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg13b
   PORT (
      ain    : IN     unsigned (12 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg14b
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROMC_03 USE ENTITY work.ROMC_03;
FOR ALL : add12signed USE ENTITY work.add12signed;
FOR ALL : add14signed USE ENTITY work.add14signed;
FOR ALL : div2 USE ENTITY work.div2;
FOR ALL : reg12b USE ENTITY work.reg12b;
FOR ALL : reg13b USE ENTITY work.reg13b;
FOR ALL : reg14b USE ENTITY work.reg14b;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 2 eb2
bin <= aout_1(12)&aout_1;


   -- Instance port mappings.
   I0 : ROMC_03
      PORT MAP (
         addr2      => addr2,
         compl      => compl,
         enable_rom => enable_rom,
         coeff_out  => coeff_out
      );
   I3 : add12signed
      PORT MAP (
         a      => Sout,
         b      => aout,
         output => output
      );
   I6 : add14signed
      PORT MAP (
         ain    => aout_2,
         bin    => bin,
         output => output_1
      );
   I5 : div2
      PORT MAP (
         Sin  => aout_1,
         Sout => Sout
      );
   I2 : reg12b
      PORT MAP (

         ain    => coeff_out,
         clk    => clk,
         enable => enable,
         aout   => aout
      );
   I4 : reg13b
      PORT MAP (
         ain    => output,
         clk    => clk,
         enable => enable,
         aout   => aout_1
      );
   I7 : reg14b
      PORT MAP (
         ain    => output_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => aout_2
      );
   I8 : reg14b
      PORT MAP (
         ain    => aout_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => aout_3
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MACXe0 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      clk        : IN     std_ulogic  ;
      clk_1      : IN     std_ulogic  ;
      clk_2      : IN     std_ulogic  ;
      compl      : IN     std_ulogic  ;
      enable     : IN     std_ulogic  ;
      enable_1   : IN     std_ulogic  ;
      enable_2   : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END MACXe0 ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF MACXe0 IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL Sout      : unsigned(11 DOWNTO 0);
SIGNAL aout      : unsigned(11 DOWNTO 0);
SIGNAL aout_1    : unsigned(12 DOWNTO 0);
SIGNAL aout_2    : unsigned(13 DOWNTO 0);
SIGNAL bin       : unsigned(13 DOWNTO 0);
SIGNAL coeff_out : unsigned(11 downto 0);
SIGNAL output    : unsigned(12 DOWNTO 0);
SIGNAL output_1  : unsigned(13 DOWNTO 0);

-- Component Declarations
COMPONENT ROMC_e0
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      compl      : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add12signed
   PORT (
      a      : IN     unsigned (11 DOWNTO 0);
      b      : IN     unsigned (11 DOWNTO 0);
      output : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add14signed
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      bin    : IN     unsigned (13 DOWNTO 0);
      output : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT div2
   PORT (
      Sin  : IN     unsigned (12 downto 0);
      Sout : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12b
   PORT (
      ain    : IN     unsigned (11 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg13b
   PORT (
      ain    : IN     unsigned (12 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg14b
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROMC_e0 USE ENTITY work.ROMC_e0;
FOR ALL : add12signed USE ENTITY work.add12signed;
FOR ALL : add14signed USE ENTITY work.add14signed;
FOR ALL : div2 USE ENTITY work.div2;
FOR ALL : reg12b USE ENTITY work.reg12b;
FOR ALL : reg13b USE ENTITY work.reg13b;
FOR ALL : reg14b USE ENTITY work.reg14b;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 2 eb2
bin <= aout_1(12)&aout_1;


   -- Instance port mappings.
   I0 : ROMC_e0
      PORT MAP (
         addr2      => addr2,
         compl      => compl,
         enable_rom => enable_rom,
         coeff_out  => coeff_out
      );
   I3 : add12signed
      PORT MAP (
         a      => Sout,
         b      => aout,
         output => output
      );
   I6 : add14signed
      PORT MAP (
         ain    => aout_2,
         bin    => bin,
         output => output_1
      );
   I5 : div2
      PORT MAP (
         Sin  => aout_1,
         Sout => Sout
      );
   I2 : reg12b
      PORT MAP (

         ain    => coeff_out,
         clk    => clk,
         enable => enable,
         aout   => aout
      );
   I4 : reg13b
      PORT MAP (
         ain    => output,
         clk    => clk,
         enable => enable,
         aout   => aout_1
      );
   I7 : reg14b
      PORT MAP (
         ain    => output_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => aout_2
      );
   I8 : reg14b
      PORT MAP (
         ain    => aout_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => aout_3
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MACXe1 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      clk        : IN     std_ulogic  ;
      clk_1      : IN     std_ulogic  ;
      clk_2      : IN     std_ulogic  ;
      compl      : IN     std_ulogic  ;
      enable     : IN     std_ulogic  ;
      enable_1   : IN     std_ulogic  ;
      enable_2   : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END MACXe1 ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF MACXe1 IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL Sout      : unsigned(11 DOWNTO 0);
SIGNAL aout      : unsigned(11 DOWNTO 0);
SIGNAL aout_1    : unsigned(12 DOWNTO 0);
SIGNAL aout_2    : unsigned(13 DOWNTO 0);
SIGNAL bin       : unsigned(13 DOWNTO 0);
SIGNAL coeff_out : unsigned(11 downto 0);
SIGNAL output    : unsigned(12 DOWNTO 0);
SIGNAL output_1  : unsigned(13 DOWNTO 0);

-- Component Declarations
COMPONENT ROMC_e1
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      compl      : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add12signed
   PORT (
      a      : IN     unsigned (11 DOWNTO 0);
      b      : IN     unsigned (11 DOWNTO 0);
      output : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add14signed
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      bin    : IN     unsigned (13 DOWNTO 0);
      output : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT div2
   PORT (
      Sin  : IN     unsigned (12 downto 0);
      Sout : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12b
   PORT (
      ain    : IN     unsigned (11 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg13b
   PORT (
      ain    : IN     unsigned (12 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg14b
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROMC_e1 USE ENTITY work.ROMC_e1;
FOR ALL : add12signed USE ENTITY work.add12signed;
FOR ALL : add14signed USE ENTITY work.add14signed;
FOR ALL : div2 USE ENTITY work.div2;
FOR ALL : reg12b USE ENTITY work.reg12b;
FOR ALL : reg13b USE ENTITY work.reg13b;
FOR ALL : reg14b USE ENTITY work.reg14b;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 2 eb2
bin <= aout_1(12)&aout_1;


   -- Instance port mappings.
   I0 : ROMC_e1
      PORT MAP (
         addr2      => addr2,
         compl      => compl,
         enable_rom => enable_rom,
         coeff_out  => coeff_out
      );
   I3 : add12signed
      PORT MAP (
         a      => Sout,
         b      => aout,
         output => output
      );
   I6 : add14signed
      PORT MAP (
         ain    => aout_2,
         bin    => bin,
         output => output_1
      );
   I5 : div2
      PORT MAP (
         Sin  => aout_1,
         Sout => Sout
      );
   I2 : reg12b
      PORT MAP (

         ain    => coeff_out,
         clk    => clk,
         enable => enable,
         aout   => aout
      );
   I4 : reg13b
      PORT MAP (
         ain    => output,
         clk    => clk,
         enable => enable,
         aout   => aout_1
      );
   I7 : reg14b
      PORT MAP (
         ain    => output_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => aout_2
      );
   I8 : reg14b
      PORT MAP (
         ain    => aout_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => aout_3
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MACXe2 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      clk        : IN     std_ulogic  ;
      clk_1      : IN     std_ulogic  ;
      clk_2      : IN     std_ulogic  ;
      compl      : IN     std_ulogic  ;
      enable     : IN     std_ulogic  ;
      enable_1   : IN     std_ulogic  ;
      enable_2   : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END MACXe2 ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF MACXe2 IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL Sout      : unsigned(11 DOWNTO 0);
SIGNAL aout      : unsigned(11 DOWNTO 0);
SIGNAL aout_1    : unsigned(12 DOWNTO 0);
SIGNAL aout_2    : unsigned(13 DOWNTO 0);
SIGNAL bin       : unsigned(13 DOWNTO 0);
SIGNAL coeff_out : unsigned(11 downto 0);
SIGNAL output    : unsigned(12 DOWNTO 0);
SIGNAL output_1  : unsigned(13 DOWNTO 0);

-- Component Declarations
COMPONENT ROMC_e2
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      compl      : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add12signed
   PORT (
      a      : IN     unsigned (11 DOWNTO 0);
      b      : IN     unsigned (11 DOWNTO 0);
      output : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add14signed
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      bin    : IN     unsigned (13 DOWNTO 0);
      output : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT div2
   PORT (
      Sin  : IN     unsigned (12 downto 0);
      Sout : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12b
   PORT (
      ain    : IN     unsigned (11 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg13b
   PORT (
      ain    : IN     unsigned (12 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg14b
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROMC_e2 USE ENTITY work.ROMC_e2;
FOR ALL : add12signed USE ENTITY work.add12signed;
FOR ALL : add14signed USE ENTITY work.add14signed;
FOR ALL : div2 USE ENTITY work.div2;
FOR ALL : reg12b USE ENTITY work.reg12b;
FOR ALL : reg13b USE ENTITY work.reg13b;
FOR ALL : reg14b USE ENTITY work.reg14b;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 2 eb2
bin <= aout_1(12)&aout_1;


   -- Instance port mappings.
   I0 : ROMC_e2
      PORT MAP (
         addr2      => addr2,
         compl      => compl,
         enable_rom => enable_rom,
         coeff_out  => coeff_out
      );
   I3 : add12signed
      PORT MAP (
         a      => Sout,
         b      => aout,
         output => output
      );
   I6 : add14signed
      PORT MAP (
         ain    => aout_2,
         bin    => bin,
         output => output_1
      );
   I5 : div2
      PORT MAP (
         Sin  => aout_1,
         Sout => Sout
      );
   I2 : reg12b
      PORT MAP (

         ain    => coeff_out,
         clk    => clk,
         enable => enable,
         aout   => aout
      );
   I4 : reg13b
      PORT MAP (
         ain    => output,
         clk    => clk,
         enable => enable,
         aout   => aout_1
      );
   I7 : reg14b
      PORT MAP (
         ain    => output_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => aout_2
      );
   I8 : reg14b
      PORT MAP (
         ain    => aout_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => aout_3
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MACXe3 IS
   PORT( 
      addr2      : IN     unsigned (1 DOWNTO 0) ;
      clk        : IN     std_ulogic  ;
      clk_1      : IN     std_ulogic  ;
      clk_2      : IN     std_ulogic  ;
      compl      : IN     std_ulogic  ;
      enable     : IN     std_ulogic  ;
      enable_1   : IN     std_ulogic  ;
      enable_2   : IN     std_ulogic  ;
      enable_rom : IN     std_ulogic  ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );

-- Declarations

END MACXe3 ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF MACXe3 IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL Sout      : unsigned(11 DOWNTO 0);
SIGNAL aout      : unsigned(11 DOWNTO 0);
SIGNAL aout_1    : unsigned(12 DOWNTO 0);
SIGNAL aout_2    : unsigned(13 DOWNTO 0);
SIGNAL bin       : unsigned(13 DOWNTO 0);
SIGNAL coeff_out : unsigned(11 downto 0);
SIGNAL output    : unsigned(12 DOWNTO 0);
SIGNAL output_1  : unsigned(13 DOWNTO 0);

-- Component Declarations
COMPONENT ROMC_e3
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      compl      : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      coeff_out  : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add12signed
   PORT (
      a      : IN     unsigned (11 DOWNTO 0);
      b      : IN     unsigned (11 DOWNTO 0);
      output : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT add14signed
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      bin    : IN     unsigned (13 DOWNTO 0);
      output : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT div2
   PORT (
      Sin  : IN     unsigned (12 downto 0);
      Sout : OUT    unsigned (11 downto 0)
   );
END COMPONENT;
COMPONENT reg12b
   PORT (
      ain    : IN     unsigned (11 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (11 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg13b
   PORT (
      ain    : IN     unsigned (12 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;
COMPONENT reg14b
   PORT (
      ain    : IN     unsigned (13 DOWNTO 0);
      clk    : IN     std_ulogic ;
      enable : IN     std_ulogic ;
      aout   : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : ROMC_e3 USE ENTITY work.ROMC_e3;
FOR ALL : add12signed USE ENTITY work.add12signed;
FOR ALL : add14signed USE ENTITY work.add14signed;
FOR ALL : div2 USE ENTITY work.div2;
FOR ALL : reg12b USE ENTITY work.reg12b;
FOR ALL : reg13b USE ENTITY work.reg13b;
FOR ALL : reg14b USE ENTITY work.reg14b;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 2 eb2
bin <= aout_1(12)&aout_1;


   -- Instance port mappings.
   I0 : ROMC_e3
      PORT MAP (
         addr2      => addr2,
         compl      => compl,
         enable_rom => enable_rom,
         coeff_out  => coeff_out
      );
   I3 : add12signed
      PORT MAP (
         a      => Sout,
         b      => aout,
         output => output
      );
   I6 : add14signed
      PORT MAP (
         ain    => aout_2,
         bin    => bin,
         output => output_1
      );
   I5 : div2
      PORT MAP (
         Sin  => aout_1,
         Sout => Sout
      );
   I2 : reg12b
      PORT MAP (

         ain    => coeff_out,
         clk    => clk,
         enable => enable,
         aout   => aout
      );
   I4 : reg13b
      PORT MAP (
         ain    => output,
         clk    => clk,
         enable => enable,
         aout   => aout_1
      );
   I7 : reg14b
      PORT MAP (
         ain    => output_1,
         clk    => clk_1,
         enable => enable_1,
         aout   => aout_2
      );
   I8 : reg14b
      PORT MAP (
         ain    => aout_2,
         clk    => clk_2,
         enable => enable_2,
         aout   => aout_3
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY DCT8_core IS
   PORT( 
      bit_in   : IN     std_ulogic  ;
      bit_in_2 : IN     std_logic  ;
      clk      : IN     std_ulogic  ;
      reset    : IN     std_ulogic  ;
      dbus00   : OUT    unsigned (13 DOWNTO 0) ;
      dbus01   : OUT    unsigned (13 DOWNTO 0) ;
      dbus02   : OUT    unsigned (13 DOWNTO 0) ;
      dbus03   : OUT    unsigned (13 DOWNTO 0) ;
      dbuse0   : OUT    unsigned (13 DOWNTO 0) ;
      dbuse1   : OUT    unsigned (13 DOWNTO 0) ;
      dbuse2   : OUT    unsigned (13 DOWNTO 0) ;
      dbuse3   : OUT    unsigned (13 DOWNTO 0) ;
      sig00    : OUT    std_ulogic  ;
      sig01    : OUT    std_ulogic  ;
      sig02    : OUT    std_ulogic  ;
      sig03    : OUT    std_ulogic 
   );

-- Declarations

END DCT8_core ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF DCT8_core IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL address          : unsigned(1 DOWNTO 0);
SIGNAL address_out      : unsigned(1 DOWNTO 0);
SIGNAL address_out_1    : unsigned(1 DOWNTO 0);
SIGNAL address_out_2    : unsigned(1 DOWNTO 0);
SIGNAL address_out_3    : unsigned(1 DOWNTO 0);
SIGNAL address_out_4    : unsigned(1 DOWNTO 0);
SIGNAL address_out_5    : unsigned(1 DOWNTO 0);
SIGNAL aout_10          : unsigned(13 DOWNTO 0);
SIGNAL aout_3           : unsigned(13 DOWNTO 0);
SIGNAL aout_4           : unsigned(13 DOWNTO 0);
SIGNAL aout_5           : unsigned(13 DOWNTO 0);
SIGNAL aout_6           : unsigned(13 DOWNTO 0);
SIGNAL aout_7           : unsigned(13 DOWNTO 0);
SIGNAL aout_8           : unsigned(13 DOWNTO 0);
SIGNAL aout_9           : unsigned(13 DOWNTO 0);
SIGNAL clk1             : std_ulogic;
SIGNAL clk1out          : std_ulogic;
SIGNAL clk1out_1        : std_ulogic;
SIGNAL clk1out_2        : std_ulogic;
SIGNAL clk1out_3        : std_ulogic;
SIGNAL clk1out_4        : std_ulogic;
SIGNAL clk1out_5        : std_ulogic;
SIGNAL clk2             : std_ulogic;
SIGNAL clk2out          : std_ulogic;
SIGNAL clk2out_1        : std_ulogic;
SIGNAL clk2out_2        : std_ulogic;
SIGNAL clk2out_3        : std_ulogic;
SIGNAL clk2out_4        : std_ulogic;
SIGNAL clk_2            : std_ulogic;
SIGNAL compl            : std_ulogic;
SIGNAL compl_1          : std_ulogic;
SIGNAL compl_out        : std_ulogic;
SIGNAL compl_out_1      : std_ulogic;
SIGNAL compl_out_2      : std_ulogic;
SIGNAL compl_out_3      : std_ulogic;
SIGNAL compl_out_4      : std_ulogic;
SIGNAL d_in             : unsigned(6 DOWNTO 0);
SIGNAL d_in_1           : unsigned(6 DOWNTO 0);
SIGNAL d_out            : unsigned(6 DOWNTO 0);
SIGNAL d_out_1          : unsigned(6 DOWNTO 0);
SIGNAL d_out_2          : unsigned(6 DOWNTO 0);
SIGNAL d_out_3          : unsigned(6 DOWNTO 0);
SIGNAL d_out_4          : unsigned(6 DOWNTO 0);
SIGNAL d_out_5          : unsigned(6 DOWNTO 0);
SIGNAL enable           : std_ulogic;
SIGNAL enable0          : std_ulogic;
SIGNAL enable1          : std_ulogic;
SIGNAL enable_1         : std_ulogic;
SIGNAL enable_1_out     : std_ulogic;
SIGNAL enable_1_out_1   : std_ulogic;
SIGNAL enable_1_out_2   : std_ulogic;
SIGNAL enable_1_out_3   : std_ulogic;
SIGNAL enable_1_out_4   : std_ulogic;
SIGNAL enable_2         : std_ulogic;
SIGNAL enable_out       : std_ulogic;
SIGNAL enable_out_1     : std_ulogic;
SIGNAL enable_out_2     : std_ulogic;
SIGNAL enable_out_3     : std_ulogic;
SIGNAL enable_out_4     : std_ulogic;
SIGNAL enable_rom       : std_ulogic;
SIGNAL enable_rom_1     : std_ulogic;
SIGNAL enable_rom_2     : std_ulogic;
SIGNAL enable_rom_out   : std_ulogic;
SIGNAL enable_rom_out_1 : std_ulogic;
SIGNAL enable_rom_out_2 : std_ulogic;
SIGNAL enable_rom_out_3 : std_ulogic;
SIGNAL enable_rom_out_4 : std_ulogic;
SIGNAL reset0           : std_ulogic;
SIGNAL reset_out        : std_ulogic;
SIGNAL reset_out_1      : std_ulogic;
SIGNAL reset_out_2      : std_ulogic;
SIGNAL reset_out_3      : std_ulogic;
SIGNAL reset_out_4      : std_ulogic;
SIGNAL temp             : unsigned(27 DOWNTO 0);
SIGNAL temp1            : unsigned(41 DOWNTO 0);
SIGNAL temp2            : unsigned(55 DOWNTO 0);

-- Component Declarations
COMPONENT MACX00
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      clk        : IN     std_ulogic ;
      clk_1      : IN     std_ulogic ;
      clk_2      : IN     std_ulogic ;
      compl      : IN     std_ulogic ;
      enable     : IN     std_ulogic ;
      enable_1   : IN     std_ulogic ;
      enable_2   : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT MACX01
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      clk        : IN     std_ulogic ;
      clk_1      : IN     std_ulogic ;
      clk_2      : IN     std_ulogic ;
      compl      : IN     std_ulogic ;
      enable     : IN     std_ulogic ;
      enable_1   : IN     std_ulogic ;
      enable_2   : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT MACX02
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      clk        : IN     std_ulogic ;
      clk_1      : IN     std_ulogic ;
      clk_2      : IN     std_ulogic ;
      compl      : IN     std_ulogic ;
      enable     : IN     std_ulogic ;
      enable_1   : IN     std_ulogic ;
      enable_2   : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT MACX03
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      clk        : IN     std_ulogic ;
      clk_1      : IN     std_ulogic ;
      clk_2      : IN     std_ulogic ;
      compl      : IN     std_ulogic ;
      enable     : IN     std_ulogic ;
      enable_1   : IN     std_ulogic ;
      enable_2   : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT MACXe0
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      clk        : IN     std_ulogic ;
      clk_1      : IN     std_ulogic ;
      clk_2      : IN     std_ulogic ;
      compl      : IN     std_ulogic ;
      enable     : IN     std_ulogic ;
      enable_1   : IN     std_ulogic ;
      enable_2   : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT MACXe1
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      clk        : IN     std_ulogic ;
      clk_1      : IN     std_ulogic ;
      clk_2      : IN     std_ulogic ;
      compl      : IN     std_ulogic ;
      enable     : IN     std_ulogic ;
      enable_1   : IN     std_ulogic ;
      enable_2   : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT MACXe2
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      clk        : IN     std_ulogic ;
      clk_1      : IN     std_ulogic ;
      clk_2      : IN     std_ulogic ;
      compl      : IN     std_ulogic ;
      enable     : IN     std_ulogic ;
      enable_1   : IN     std_ulogic ;
      enable_2   : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT MACXe3
   PORT (
      addr2      : IN     unsigned (1 DOWNTO 0);
      clk        : IN     std_ulogic ;
      clk_1      : IN     std_ulogic ;
      clk_2      : IN     std_ulogic ;
      compl      : IN     std_ulogic ;
      enable     : IN     std_ulogic ;
      enable_1   : IN     std_ulogic ;
      enable_2   : IN     std_ulogic ;
      enable_rom : IN     std_ulogic ;
      aout_3     : OUT    unsigned (13 DOWNTO 0)
   );
END COMPONENT;
COMPONENT controller
   PORT (
      clk     : IN     std_ulogic ;
      reset   : IN     std_ulogic ;
      clk1    : OUT    std_ulogic ;
      clk2    : OUT    std_ulogic ;
      compl   : OUT    std_ulogic ;
      enable0 : OUT    std_ulogic ;
      enable1 : OUT    std_ulogic ;
      address : BUFFER unsigned (1 DOWNTO 0)
   );
END COMPONENT;
COMPONENT delay_e
   PORT (
      clk            : IN     std_ulogic ;
      d_in           : IN     unsigned (6 DOWNTO 0);
      enable_rom     : IN     std_ulogic ;
      reset          : IN     std_ulogic ;
      address_out    : OUT    unsigned (1 DOWNTO 0);
      clk1out        : OUT    std_ulogic ;
      clk2out        : OUT    std_ulogic ;
      compl_out      : OUT    std_ulogic ;
      d_out          : OUT    unsigned (6 DOWNTO 0);
      enable_1_out   : OUT    std_ulogic ;
      enable_out     : OUT    std_ulogic ;
      enable_rom_out : OUT    std_ulogic ;
      reset_out      : OUT    std_ulogic 
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : MACX00 USE ENTITY work.MACX00;
FOR ALL : MACX01 USE ENTITY work.MACX01;
FOR ALL : MACX02 USE ENTITY work.MACX02;
FOR ALL : MACX03 USE ENTITY work.MACX03;
FOR ALL : MACXe0 USE ENTITY work.MACXe0;
FOR ALL : MACXe1 USE ENTITY work.MACXe1;
FOR ALL : MACXe2 USE ENTITY work.MACXe2;
FOR ALL : MACXe3 USE ENTITY work.MACXe3;
FOR ALL : controller USE ENTITY work.controller;
FOR ALL : delay_e USE ENTITY work.delay_e;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 2 eb2
d_in(6 downto 5) <= address;
d_in(4) <= clk1;
d_in(3) <= clk2;
d_in(2) <= compl;
d_in(1) <= enable0;
d_in(0) <= enable1;


-- HDL Embedded Text Block 3 eb3
enable_rom <= bit_in;
enable_rom_2 <= bit_in_2;


-- HDL Embedded Text Block 4 eb4
d_in_1(6 downto 5) <= address;
d_in_1(4) <= clk1;
d_in_1(3) <= clk2;
d_in_1(2) <= compl;
d_in_1(1) <= enable0;
d_in_1(0) <= enable1;


-- HDL Embedded Text Block 5 eb5
sig00 <= clk2;
dbuse0 <= aout_3;


-- HDL Embedded Text Block 6 eb6
dbuse1 <= aout_5;
sig01 <= clk2out;


-- HDL Embedded Text Block 7 eb7
dbuse2 <= aout_6;
sig02 <= clk_2;


-- HDL Embedded Text Block 8 eb8
sig03 <= clk2out_1;
dbuse3 <= aout_7;


-- HDL Embedded Text Block 9 eb9
temp2 <= aout_8&temp1;


-- HDL Embedded Text Block 10 eb10
temp1 <= aout_9&temp;


-- HDL Embedded Text Block 11 eb11
temp <= aout_10&aout_4;


-- HDL Embedded Text Block 12 eb12
dbus00 <= temp2(13 downto 0);
dbus01 <= temp2(27 downto 14);
dbus02 <= temp2(41 downto 28);
dbus03 <= temp2(55 downto 42);


-- HDL Embedded Text Block 13 eb13
reset0 <= not(reset);


   -- Instance port mappings.
   I1 : MACX00
      PORT MAP (
         addr2      => address,
         clk        => clk,
         clk_1      => clk1,
         clk_2      => clk2,
         compl      => compl,
         enable     => enable0,
         enable_1   => enable1,
         enable_2   => reset0,
         enable_rom => enable_rom_2,
         aout_3     => aout_4
      );
   I4 : MACX01
      PORT MAP (
         addr2      => address_out_3,
         clk        => clk,
         clk_1      => clk1out_3,
         clk_2      => clk2out_2,
         compl      => compl_out_2,
         enable     => enable_out_2,
         enable_1   => enable_1_out_2,
         enable_2   => reset_out_2,
         enable_rom => enable_rom_out_2,
         aout_3     => aout_10
      );
   I6 : MACX02
      PORT MAP (
         addr2      => address_out_4,
         clk        => clk,
         clk_1      => clk1out_4,
         clk_2      => clk2out_3,
         compl      => compl_out_3,
         enable     => enable_out_3,
         enable_1   => enable_1_out_3,
         enable_2   => reset_out_3,
         enable_rom => enable_rom_out_3,
         aout_3     => aout_9
      );
   I7 : MACX03
      PORT MAP (
         addr2      => address_out_5,
         clk        => clk,
         clk_1      => clk1out_5,
         clk_2      => clk2out_4,
         compl      => compl_out_4,
         enable     => enable_out_4,
         enable_1   => enable_1_out_4,
         enable_2   => reset_out_4,
         enable_rom => enable_rom_out_4,
         aout_3     => aout_8
      );
   I3 : MACXe0
      PORT MAP (
         addr2      => address,
         clk        => clk,
         clk_1      => clk1,
         clk_2      => clk2,
         compl      => compl,
         enable     => enable0,
         enable_1   => enable1,
         enable_2   => reset0,
         enable_rom => enable_rom,
         aout_3     => aout_3
      );
   I5 : MACXe1
      PORT MAP (
         addr2      => address_out,
         clk        => clk,
         clk_1      => clk1out,
         clk_2      => clk2out,
         compl      => compl_out,
         enable     => enable_out,
         enable_1   => enable_1_out,
         enable_2   => reset_out,
         enable_rom => enable_rom_out,
         aout_3     => aout_5
      );
   I8 : MACXe2
      PORT MAP (
         addr2      => address_out_1,
         clk        => clk,
         clk_1      => clk1out_1,
         clk_2      => clk_2,
         compl      => compl_out_1,
         enable     => enable,
         enable_1   => enable_1_out_1,
         enable_2   => enable_2,
         enable_rom => enable_rom_out_1,
         aout_3     => aout_6
      );
   I9 : MACXe3
      PORT MAP (
         addr2      => address_out_2,
         clk        => clk,
         clk_1      => clk1out_2,
         clk_2      => clk2out_1,
         compl      => compl_1,
         enable     => enable_out_1,
         enable_1   => enable_1,
         enable_2   => reset_out_1,
         enable_rom => enable_rom_1,
         aout_3     => aout_7
      );
   I2 : controller
      PORT MAP (
         clk     => clk,
         reset   => reset,
         clk1    => clk1,
         clk2    => clk2,
         compl   => compl,
         enable0 => enable0,
         enable1 => enable1,
         address => address
      );
   I10 : delay_e
      PORT MAP (
         clk            => clk,
         d_in           => d_in,
         enable_rom     => enable_rom,
         reset          => reset0,
         address_out    => address_out,
         clk1out        => clk1out,
         clk2out        => clk2out,
         compl_out      => compl_out,
         d_out          => d_out,
         enable_1_out   => enable_1_out,
         enable_out     => enable_out,
         enable_rom_out => enable_rom_out,
         reset_out      => reset_out
      );
   I11 : delay_e
      PORT MAP (
         clk            => clk,
         d_in           => d_out,
         enable_rom     => enable_rom_out,
         reset          => reset0,
         address_out    => address_out_1,
         clk1out        => clk1out_1,
         clk2out        => clk_2,
         compl_out      => compl_out_1,
         d_out          => d_out_5,
         enable_1_out   => enable_1_out_1,
         enable_out     => enable,
         enable_rom_out => enable_rom_out_1,
         reset_out      => enable_2
      );
   I12 : delay_e
      PORT MAP (
         clk            => clk,
         d_in           => d_out_5,
         enable_rom     => enable_rom_out_1,
         reset          => reset0,
         address_out    => address_out_2,
         clk1out        => clk1out_2,
         clk2out        => clk2out_1,
         compl_out      => compl_1,
         d_out          => d_out_4,
         enable_1_out   => enable_1,
         enable_out     => enable_out_1,
         enable_rom_out => enable_rom_1,
         reset_out      => reset_out_1
      );
   I13 : delay_e
      PORT MAP (
         clk            => clk,
         d_in           => d_in_1,
         enable_rom     => enable_rom_2,
         reset          => reset0,
         address_out    => address_out_3,
         clk1out        => clk1out_3,
         clk2out        => clk2out_2,
         compl_out      => compl_out_2,
         d_out          => d_out_1,
         enable_1_out   => enable_1_out_2,
         enable_out     => enable_out_2,
         enable_rom_out => enable_rom_out_2,
         reset_out      => reset_out_2
      );
   I14 : delay_e
      PORT MAP (
         clk            => clk,
         d_in           => d_out_1,
         enable_rom     => enable_rom_out_2,
         reset          => reset0,
         address_out    => address_out_4,
         clk1out        => clk1out_4,
         clk2out        => clk2out_3,
         compl_out      => compl_out_3,
         d_out          => d_out_2,
         enable_1_out   => enable_1_out_3,
         enable_out     => enable_out_3,
         enable_rom_out => enable_rom_out_3,
         reset_out      => reset_out_3
      );
   I15 : delay_e
      PORT MAP (
         clk            => clk,
         d_in           => d_out_2,
         enable_rom     => enable_rom_out_3,
         reset          => reset0,
         address_out    => address_out_5,
         clk1out        => clk1out_5,
         clk2out        => clk2out_4,
         compl_out      => compl_out_4,
         d_out          => d_out_3,
         enable_1_out   => enable_1_out_4,
         enable_out     => enable_out_4,
         enable_rom_out => enable_rom_out_4,
         reset_out      => reset_out_4
      );

END struct;

--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY DCT8_final IS
   PORT( 
      bit_in_even : IN     std_logic  ;
      bit_in_odd  : IN     std_logic  ;
      clk         : IN     std_ulogic  ;
      reset_int   : IN     std_ulogic  ;
      indicate    : OUT    std_logic_vector (3 DOWNTO 0) ;
      minus_out   : OUT    unsigned (11 DOWNTO 0) ;
      plus_out    : OUT    unsigned (11 DOWNTO 0)
   );

-- Declarations

END DCT8_final ;
--
--
LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY work;

ARCHITECTURE struct OF DCT8_final IS

-- Architecture declarations

-- Internal signal declarations
SIGNAL dbus00 : unsigned(13 DOWNTO 0);
SIGNAL dbus01 : unsigned(13 DOWNTO 0);
SIGNAL dbus02 : unsigned(13 DOWNTO 0);
SIGNAL dbus03 : unsigned(13 DOWNTO 0);
SIGNAL dbuse0 : unsigned(13 DOWNTO 0);
SIGNAL dbuse1 : unsigned(13 DOWNTO 0);
SIGNAL dbuse2 : unsigned(13 DOWNTO 0);
SIGNAL dbuse3 : unsigned(13 DOWNTO 0);
SIGNAL minus  : unsigned(12 DOWNTO 0);
SIGNAL plus   : unsigned(12 DOWNTO 0);
SIGNAL sig00  : std_ulogic;
SIGNAL sig01  : std_ulogic;
SIGNAL sig02  : std_ulogic;
SIGNAL sig03  : std_ulogic;

-- Component Declarations
COMPONENT DCT8_core
   PORT (
      bit_in   : IN     std_ulogic ;
      bit_in_2 : IN     std_logic ;
      clk      : IN     std_ulogic ;
      reset    : IN     std_ulogic ;
      dbus00   : OUT    unsigned (13 DOWNTO 0);
      dbus01   : OUT    unsigned (13 DOWNTO 0);
      dbus02   : OUT    unsigned (13 DOWNTO 0);
      dbus03   : OUT    unsigned (13 DOWNTO 0);
      dbuse0   : OUT    unsigned (13 DOWNTO 0);
      dbuse1   : OUT    unsigned (13 DOWNTO 0);
      dbuse2   : OUT    unsigned (13 DOWNTO 0);
      dbuse3   : OUT    unsigned (13 DOWNTO 0);
      sig00    : OUT    std_ulogic ;
      sig01    : OUT    std_ulogic ;
      sig02    : OUT    std_ulogic ;
      sig03    : OUT    std_ulogic 
   );
END COMPONENT;
COMPONENT mux_adder
   PORT (
      clk       : IN     std_ulogic ;
      dbus00    : IN     unsigned (13 DOWNTO 0);
      dbus01    : IN     unsigned (13 DOWNTO 0);
      dbus02    : IN     unsigned (13 DOWNTO 0);
      dbus03    : IN     unsigned (13 DOWNTO 0);
      dbuse0    : IN     unsigned (13 DOWNTO 0);
      dbuse1    : IN     unsigned (13 DOWNTO 0);
      dbuse2    : IN     unsigned (13 DOWNTO 0);
      dbuse3    : IN     unsigned (13 DOWNTO 0);
      reset_int : IN     std_ulogic ;
      sig00     : IN     std_ulogic ;
      sig01     : IN     std_ulogic ;
      sig02     : IN     std_ulogic ;
      sig03     : IN     std_ulogic ;
      indicate  : OUT    std_logic_vector (3 DOWNTO 0);
      minus     : OUT    unsigned (12 DOWNTO 0);
      plus      : OUT    unsigned (12 DOWNTO 0)
   );
END COMPONENT;

-- Optional embedded configurations
--synopsys translate_off
FOR ALL : DCT8_core USE ENTITY work.DCT8_core;
FOR ALL : mux_adder USE ENTITY work.mux_adder;
--synopsys translate_on

BEGIN
-- Architecture concurrent statements
-- HDL Embedded Text Block 1 eb1
plus_out <= plus(12 downto 1);
minus_out <= minus(12 downto 1);


   -- Instance port mappings.
   I0 : DCT8_core
      PORT MAP (
         bit_in   => bit_in_odd,
         bit_in_2 => bit_in_even,
         clk      => clk,
         reset    => reset_int,
         dbus00   => dbus00,
         dbus01   => dbus01,
         dbus02   => dbus02,
         dbus03   => dbus03,
         dbuse0   => dbuse0,
         dbuse1   => dbuse1,
         dbuse2   => dbuse2,
         dbuse3   => dbuse3,
         sig00    => sig00,
         sig01    => sig01,
         sig02    => sig02,
         sig03    => sig03
      );
   I1 : mux_adder
      PORT MAP (
         clk       => clk,
         dbus00    => dbus00,
         dbus01    => dbus01,
         dbus02    => dbus02,
         dbus03    => dbus03,
         dbuse0    => dbuse0,
         dbuse1    => dbuse1,
         dbuse2    => dbuse2,
         dbuse3    => dbuse3,
         reset_int => reset_int,
         sig00     => sig00,
         sig01     => sig01,
         sig02     => sig02,
         sig03     => sig03,
         indicate  => indicate,
         minus     => minus,
         plus      => plus
      );

END struct;