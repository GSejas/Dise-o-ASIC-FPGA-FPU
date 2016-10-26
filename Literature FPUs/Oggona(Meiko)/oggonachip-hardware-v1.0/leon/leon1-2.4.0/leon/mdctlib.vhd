LIBRARY ieee;
use IEEE.std_logic_1164.all;
use work.iface.all;
use work.amba.all;
use work.mdctrom256.all;

package mdctlib is

constant TRIGBITS: integer := 14;
--constant rom_lenght: integer:=14;
constant cPI3_8 :std_logic_vector (31 downto 0) := "00000000000000000001100001111110";
constant cPI2_8 :std_logic_vector (31 downto 0) := "00000000000000000010110101000001";
constant cPI1_8 :std_logic_vector (31 downto 0) := "00000000000000000011101100100001";
constant zero32 : std_logic_vector (31 downto 0):= "00000000000000000000000000000000";

type btf8_data is array(0 to 7) of std_logic_vector (31 downto 0);
type btf16_data is array(0 to 1) of btf8_data;
type btf32_data is array(0 to 1) of btf16_data;
type block4_data is array(0 to 3) of std_logic_vector (31 downto 0);
type block8_data is array(0 to 7) of std_logic_vector (31 downto 0);
type block16_data is array(0 to 15) of std_logic_vector (31 downto 0);
type block32_data is array(0 to 31) of std_logic_vector (31 downto 0);
--type rom_table is array (0 to rom_lenght-1) of std_logic_vector (31 downto 0);


type in_multadd is record
                     op1_m1: std_logic_vector (31 downto 0);
                     op2_m1: std_logic_vector (31 downto 0);
                     op1_m2: std_logic_vector (31 downto 0);
                     op2_m2: std_logic_vector (31 downto 0);
                     add_fun: std_logic;
end record;

type out_multadd is record
                      r_m1: std_logic_vector (31 downto 0);
                      r_m2: std_logic_vector (31 downto 0);
                      r_mult: std_logic_vector (31 downto 0);
end record;
                      
type in_addbank is record
                     op1_a1 : std_logic_vector(31 downto 0);
                     op2_a1 : std_logic_vector(31 downto 0);
                     op1_a2 : std_logic_vector(31 downto 0);
                     op2_a2 : std_logic_vector(31 downto 0);
                     op1_a3 : std_logic_vector(31 downto 0);
                     op2_a3 : std_logic_vector(31 downto 0);
                     op1_s1 : std_logic_vector(31 downto 0);
                     op2_s1 : std_logic_vector(31 downto 0);
                     op1_s2 : std_logic_vector(31 downto 0);
                     op2_s2 : std_logic_vector(31 downto 0);
                     op1_s3 : std_logic_vector(31 downto 0);
                     op2_s3 : std_logic_vector(31 downto 0);
end record;

type out_addbank is record
                      r_a1: std_logic_vector(31 downto 0);
                      r_a2: std_logic_vector(31 downto 0);
                      r_a3: std_logic_vector(31 downto 0);
                      r_s1: std_logic_vector(31 downto 0);
                      r_s2: std_logic_vector(31 downto 0);
                      r_s3: std_logic_vector(31 downto 0);
end record;


type ctrlregs is record
-- registers and signals used to communicate mdctctrl with amba wrapper

  ntoprocess  : std_logic_vector(5 downto 0);  -- number of resting elements to be processed
  memwr   : std_logic;             -- '1' for write, '0' for read 
  startadr: std_logic_vector(31 downto 0);  -- start address of current block
  incr    : std_logic;             -- Bytes increment for blocks ('0'=>4 '1'=>8)
  pos     : std_logic_vector(1 downto 0);
                                   -- Pointer to read/store from buffer
                                   -- (00,01,10,11)=>(0,4,8,12)
  finish  : std_logic;             -- '1' if whole mdct is finished

end record;


type mdctregs is record
  -- ***********************
  -- memory mapped registers

  -- Control register
  -- bit 0 of 0x80000300
  mdctenreq   : std_logic;             -- mdct function enabled 
  -- bit 1 of 0x80000300
  irqen        : std_logic;             -- enable interrupt
  -- bit 2 of 0x80000300
  irq          : std_logic;             -- irq request
  
  -- 10 bit at 0x80000304
  size        : std_logic;              -- number of points of mdct '0'=>256 '1'=>2048

  -- 32 bit at 0x80000308
  rdstartaddr : std_logic_vector(31 downto 0);  -- read dma transfer start address

  -- 32 bit at 0x800030c
  wrstartaddr : std_logic_vector(31 downto 0);  -- write dma transfer start address

  -- Status register
  -- bit 0 of 0x80000310
  ready   				: std_logic;             -- '1' if function done, '0' if busy / read only
  -- bit 1 of 0x80000310
  memwr       : std_logic;             -- '1' if writting, '0' if reading data from memory /read only
 
  -- 32 bit at 0x80000314
  memoryadr : std_logic_vector(31 downto 0);  -- actual dma address /read only



  -- memory mapped registers end
  -- ***************************
  
  -- internal registers
  mdcten      : std_logic;
  dmatransfreq : std_logic;
  ntoprocess  : std_logic_vector(5 downto 0);  -- number of resting elements to be processed
  inputdata   : block32_data;  -- original data from memory
  result      : block32_data;  -- result after mdct to store in memory


  -- amba status registers
  busact : std_logic;
  busown : std_logic;
  busgrant : std_logic;
  busown2cyc : std_logic;
  
end record;




component mdct 
  port (
    rst   : in  std_logic;  
    clk   : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
		irq    : out std_logic
);
end component;

component butterfly_8 
		port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in  btf8_data;
			dataout  : out btf8_data;
		 	enabled : in std_logic
			);
end component;

component butterfly_16 
		port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in btf16_data;
			dataout  : out btf16_data;
		 	enabled : in std_logic
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


function MULT_NORM(w :std_logic_vector (63 downto 0))
      return std_logic_vector;

function HALVE(w :std_logic_vector (31 downto 0))
      return std_logic_vector;

function BT32_to_BLOCK32(bt: btf32_data )
      return block32_data;

function BLOCK32_to_BT32(b: block32_data )
      return btf32_data;

function BLOCK8_to_BLOCK16(b1: block8_data; b2: block8_data)
      return block16_data;

function BLOCK16_to_BLOCK8(b: block16_data; x: integer range 0 to 1)
      return block8_data;

function BLOCK32_to_BLOCK4(b: block32_data)
      return block4_data;

function BLOCK4_to_BLOCK32(b: block4_data)
      return block32_data;
 
function ROM_to_BLOCK4(t: rom_table; start:integer)
      return block4_data;end; 


package body mdctlib is
 

function MULT_NORM(w :std_logic_vector (63 downto 0))
  return std_logic_vector  is
  variable result: std_logic_vector (31 downto 0);
  variable rshift: bit_vector (63 downto 0);

 
begin
  rshift := TO_BITVECTOR (w);    -- convert to bitvector in order to prepare shift
  rshift := rshift sra TRIGBITS;         -- shift arithmetic right
  result := TO_STDLOGICVECTOR(rshift(31 downto 0));-- convert to std_logic_vector again     
  return result;

end MULT_NORM;

function HALVE(w :std_logic_vector (31 downto 0))
  return std_logic_vector  is
  variable result: std_logic_vector (31 downto 0);
  variable rshift: bit_vector (31 downto 0);

 
begin
  rshift := TO_BITVECTOR (w);    -- convert to bitvector in order to prepare shift
  rshift := rshift sra 1;         -- shift arithmetic right
  result := TO_STDLOGICVECTOR(rshift);-- convert to std_logic_vector again     
  return result;

end HALVE;

function BT32_to_BLOCK32(bt: btf32_data )
  return block32_data is
  variable result: block32_data;
  
begin
  for i in 0 to 1 loop
    for j in 0 to 1 loop
      for k in 0 to 7 loop
        result (8*i + 8*(j+i) + k) := bt (i)(j)(k);
      end loop;
    end loop;
  end loop;


  return result;

end BT32_to_BLOCK32;

function BLOCK32_to_BT32(b: block32_data )
  return btf32_data is
  variable result: btf32_data;

begin
  for i in 0 to 1 loop
    for j in 0 to 1 loop
      for k in 0 to 7 loop
        result (i)(j)(k) := b (8*i + 8*(j+i) + k) ;
      end loop;
    end loop;
  end loop;
  
  
  return result;
  
end BLOCK32_to_BT32;

function BLOCK8_to_BLOCK16(b1: block8_data; b2: block8_data)
  return block16_data is
  variable result: block16_data;

begin
  for i in 0 to 7 loop
    result(i) := b1(i);
  end loop;
  for i in 8 to 15 loop
    result(i) := b2(i-8);
  end loop;
  
  return result;
  
end BLOCK8_to_BLOCK16;

function BLOCK16_to_BLOCK8(b: block16_data; x: integer range 0 to 1)
  return block8_data is
  variable result: block8_data;

begin
  for i in 0 to 7 loop
    result(i) := b(i + x*8);
  end loop;
  
  return result;

end BLOCK16_to_BLOCK8;

function BLOCK32_to_BLOCK4(b: block32_data)
  return block4_data is
  variable result: block4_data;

begin
  for i in 0 to 3 loop
    result(i) := b(i);
  end loop;
  
  return result;

end BLOCK32_to_BLOCK4;

function BLOCK4_to_BLOCK32(b: block4_data)
  return block32_data is
  variable result: block32_data;

begin
  for i in 0 to 3 loop
    result(i) := b(i);
  end loop;
  
  return result;

end BLOCK4_to_BLOCK32;

function ROM_to_BLOCK4(t: rom_table; start:integer)
  return block4_data is
  variable result: block4_data;

begin
  for i in 0 to 3 loop
    result(i) := t(i+start);
  end loop;
  
  return result;

end ROM_to_BLOCK4;

end;                                    -- end mdct lib






















