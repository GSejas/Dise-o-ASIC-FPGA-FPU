LIBRARY ieee;
use IEEE.std_logic_1164.all;
--use work.iface.all;
use work.amba.all;
--use work.mdctrom256.all;

package mdctlib is
        constant MDCT_wsize : integer  := 32;
                                        -- size of data words
        constant MDCT_csize : integer := 32;  
                                        -- size of the word of look-up tables
	constant TRIGBITS: integer := 14;
                                        -- number of bits to shift right after
                                        -- multiplication
--constant rom_lenght: integer:=14;
	constant cPI3_8 :std_logic_vector ( MDCT_csize-1 downto 0) := "00000000000000000001100001111110";
	constant cPI2_8 :std_logic_vector (MDCT_csize-1 downto 0) := "00000000000000000010110101000001";
	constant cPI1_8 :std_logic_vector (MDCT_csize-1 downto 0) := "00000000000000000011101100100001";
	constant zero32 : std_logic_vector (MDCT_csize-1 downto 0):= "00000000000000000000000000000000";

        type block_data  is array (natural range <>) of std_logic_vector (MDCT_wsize-1 downto 0);
        subtype block32_data is block_data (0 to 31);
        subtype block8_data  is block_data (0 to 7);        
        subtype block4_data  is block_data (0 to 3);


        
	type in_multadd is record
                     op1_m1: std_logic_vector (MDCT_wsize-1 downto 0);
                     op2_m1: std_logic_vector (MDCT_csize-1 downto 0);
                     op1_m2: std_logic_vector (MDCT_wsize-1 downto 0);
                     op2_m2: std_logic_vector (MDCT_csize-1 downto 0);
                     add_fun: std_logic;
	end record;

	type out_multadd is record
                      r_m1: std_logic_vector (MDCT_wsize-1 downto 0);
                      r_m2: std_logic_vector (MDCT_wsize-1 downto 0);
                      r_mult: std_logic_vector (MDCT_wsize-1 downto 0);
	end record;
                      
	type in_addbank is record
                     op1_a1 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op2_a1 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op1_a2 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op2_a2 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op1_a3 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op2_a3 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op1_s1 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op2_s1 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op1_s2 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op2_s2 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op1_s3 : std_logic_vector(MDCT_wsize-1 downto 0);
                     op2_s3 : std_logic_vector(MDCT_wsize-1 downto 0);
                     act_trig: integer;
	end record;

	type out_addbank is record
                      r_a1: std_logic_vector(MDCT_wsize-1 downto 0);
                      r_a2: std_logic_vector(MDCT_wsize-1 downto 0);
                      r_a3: std_logic_vector(MDCT_wsize-1 downto 0);
                      r_s1: std_logic_vector(MDCT_wsize-1 downto 0);
                      r_s2: std_logic_vector(MDCT_wsize-1 downto 0);
                      r_s3: std_logic_vector(MDCT_wsize-1 downto 0);
                      next_trig: integer;
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
          trigpos:  std_logic;          -- Signalize store at 16 position in
                                        -- input buffer, when reading a trig or
                                        -- bitreverse tables.
	  finish  : std_logic;             -- '1' if whole mdct is finished
	  rcopy   : std_logic;             -- Copy out buffer into in buffer

	end record;


	type mdctregs is record
  	-- ***********************
  	-- memory mapped registers

	  -- Control register
	  -- bit 0 of 0x80000300
	  mdctenreq   : std_logic;             -- mdct function enabled 
	  -- bit 1 at 0x80000300
	  size        : std_logic;              -- number of points of mdct '0'=>256 '1'=>2048

	  -- bit 2 of 0x80000300
	  irqen        : std_logic;             -- enable interrupt
	  -- bit 3 of 0x80000300
	  irq          : std_logic;             -- irq request
  
	  -- 32 bit at 0x80000304
	  bitrevaddr : std_logic_vector(31 downto 0);  -- read dma transfer start address

	  -- 32 bit at 0x80000308
	  trigaddr : std_logic_vector(31 downto 0);  -- read dma transfer start address

	  -- 32 bit at 0x8000030C
	  rdstartaddr : std_logic_vector(31 downto 0);  -- read dma transfer start address

	  -- 32 bit at 0x8000310
	  wrstartaddr : std_logic_vector(31 downto 0);  -- write dma transfer start address

	  -- Status register
	  -- bit 0 of 0x80000314
	  ready   				: std_logic;             -- '1' if function done, '0' if busy / read only
	  -- bit 1 of 0x80000314
	  memwr       : std_logic;             -- '1' if writting, '0' if reading data from memory /read only
 
	  -- 32 bit at 0x80000318
	  memoryadr : std_logic_vector(31 downto 0);  -- actual dma address /read only



	  -- memory mapped registers end
	  -- ***************************
  
	  -- internal registers
	  mdcten      : std_logic;
	  dmatransfreq : std_logic;
	  ntoprocess  : std_logic_vector(5 downto 0);  -- number of resting elements to be processed
          trigpos : std_logic;          -- signalize if trig or beitreverse
                                        -- tables are read
	  inputdata   : block32_data;  -- original data from memory



	  -- amba status registers
          skipblk: std_logic;
	  busact : std_logic;
	  busown : std_logic;
	  busgrant : std_logic;
	  busown2cyc : std_logic;
  
	end record;

	function MULT_NORM(w :std_logic_vector (MDCT_csize+MDCT_wsize-1 downto 0))
      return std_logic_vector;

	function HALVE(w :std_logic_vector (MDCT_wsize-1 downto 0))
      return std_logic_vector;

end;

package body mdctlib is
 

function MULT_NORM(w :std_logic_vector (MDCT_csize+MDCT_wsize-1 downto 0))
  return std_logic_vector  is
  variable result: std_logic_vector (MDCT_wsize-1 downto 0);
  variable rshift: bit_vector (MDCT_csize+MDCT_wsize-1 downto 0);

 
begin
  rshift := TO_BITVECTOR (w);    -- convert to bitvector in order to prepare shift
  rshift := rshift sra TRIGBITS;         -- shift arithmetic right
  result := TO_STDLOGICVECTOR(rshift(MDCT_wsize-1 downto 0));-- convert to std_logic_vector again     
  return result;

end MULT_NORM;

function HALVE(w :std_logic_vector (MDCT_wsize-1 downto 0))
  return std_logic_vector  is
  variable result: std_logic_vector (MDCT_wsize-1 downto 0);
  variable rshift: bit_vector (MDCT_wsize-1 downto 0);

 
begin
  rshift := TO_BITVECTOR (w);    -- convert to bitvector in order to prepare shift
  rshift := rshift sra 1;         -- shift arithmetic right
  result := TO_STDLOGICVECTOR(rshift);-- convert to std_logic_vector again     
  return result;

end HALVE;


end;                                    -- end mdct lib






















