-------------------------------------------------------------------------
-- This file is part of Oggonachip project
---------------------------------------------------------------------------
-- Entities: butterfly_8
-- File:   mdctcomp.vhd
-- Author: Luis L. Azuara
-- Description:	Components requiered to perform the mdct.
-- Creation date: 27.03.02
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.std_logic_arith.all;
-- use IEEE.std_logic_unsigned."+";
-- use IEEE.std_logic_unsigned."-";
use work.mdctlib.all;
use IEEE.std_logic_signed.all;

entity butterfly_8 is
		port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in btf8_data;
			dataout  : out btf8_data;
		 	enabled : in std_logic
			);

end butterfly_8; 

architecture rtl of butterfly_8 is

type btf8_regs is array (0 to 3) of std_logic_vector (31 downto 0);
signal procdata : btf8_data;


begin

	btf8 : process (rst,datain,procdata)

		variable r: btf8_regs;
		variable x: btf8_data;


		begin

		x := datain;


  	 r(0) := x(6) + x(2);
		r(1) := x(6) - x(2);
		r(2) := x(4) + x(0);
		r(3) := x(4) - x(0);	
		
		x(6) := r(0) + r(2);
		x(4) := r(0) - r(2);

		r(0) := x(5) - x(1);
		r(2) := x(7) - x(3);
		x(0) := r(1) + r(0);
		x(2) := r(1) - r(0);

		r(0) := x(5) + x(1);
		r(1) := x(7) + x(3);
		x(3) := r(2) + r(3);
		x(1) := r(2) - r(3);
		x(7) := r(1) + r(0);
	  x(5) := r(1) - r(0);


    procdata <= x;
    dataout <= procdata;
 
		if rst ='0' then 
			dataout <=  (others => "00000000000000000000000000000000");
    end if;


	end process;


end;
--------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;


entity butterfly_16 is
		port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in btf16_data;
			dataout  : out btf16_data;
		 	enabled : in std_logic
			);
end butterfly_16;

architecture rtl of butterfly_16 is


type btf16_regs is array (0 to 1) of std_logic_vector (31 downto 0);

signal procdata,bt16result : btf16_data;

component butterfly_8 
  port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in btf8_data;
			dataout  : out btf8_data;
		 	enabled : in std_logic
			);
end component;



begin

	btf16 : process (rst,datain,bt16result)

		variable r: btf16_regs;
		variable x: btf16_data;


		begin

       x := datain;

-- process butterfly 16
			r(0):= x(0)(1) - x(1)(1);
			r(1):= x(0)(0) - x(1)(0);


       x(1)(0):= x(1)(0) + x(0)(0);
       x(1)(1):= x(1)(1) + x(0)(1);


       x(0)(0) := MULT_NORM((r(0) + r(1)) * cPI2_8);
		   x(0)(1) := MULT_NORM((r(0) - r(1)) * cPI2_8);

       r(0):= x(0)(3) - x(1)(3);
       r(1):= x(1)(2) - x(0)(2);

       x(1)(2):= x(1)(2) + x(0)(2);
       x(1)(3):= x(1)(3) + x(0)(3);
       x(0)(2):= r(0);
       x(0)(3):= r(1);

       r(0):= x(1)(4) - x(0)(4);
       r(1):= x(1)(5) - x(0)(5);

       x(1)(4) := x(1)(4) + x(0)(4);
       x(1)(5) := x(1)(5) + x(0)(5);


       x(0)(4) := MULT_NORM((r(0) - r (1)) * cPI2_8);
       x(0)(5) := MULT_NORM((r(0) + r (1)) * cPI2_8);

       r(0) := x(1)(6) - x(0)(6);
       r(1) := x(1)(7) - x(0)(7);

       x(1)(6) := x(1)(6) + x(0)(6);
       x(1)(7) := x(1)(7) + x(0)(7);

       x(0)(6) := r(0);
       x(0)(7) := r(1);


-- end prcess butterfly 16


		if rst ='0' then 
			dataout(0) <=  (others => "00000000000000000000000000000000");
			dataout(1) <=  (others => "00000000000000000000000000000000");
			procdata(0)<=  (others => "00000000000000000000000000000000");
			procdata(1) <=  (others => "00000000000000000000000000000000");
    end if; 
                  

       procdata <= x;    -- update processed data

       dataout <= bt16result;
     end process;



b8_0: butterfly_8 
  port map (
       rst => rst,
			 clk => clk,
       datain  => procdata(0),
			 dataout => bt16result(0),
			 enabled => enabled
       );


b8_1: butterfly_8 
  port map (
       rst => rst,
			 clk => clk,
       datain => procdata(1),
	     dataout => bt16result(1),
			 enabled => enabled
       );


end;


--------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;


entity butterfly_32 is
		port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in btf32_data;
			dataout  : out btf32_data;
		 	enabled : in std_logic;
		 	ready : out std_logic
			);
end butterfly_32;

architecture rtl of butterfly_32 is



type btf32_regs is array (0 to 1) of std_logic_vector (31 downto 0);
type btf32 is record
    state: std_logic_vector (2 downto 0);
    active: bit;
end record;



signal procdata,bt32result : btf32_data ;
signal rin: btf32;

component butterfly_16 
  port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in btf16_data;
			dataout  : out btf16_data;
		 	enabled : in std_logic
			);
end component;



begin

	bf32 : process (rst,bt32result,enabled,rin,clk,datain,procdata)

		variable r: btf32_regs := (others => "00000000000000000000000000000000");

	  variable x: block32_data:= (others => "00000000000000000000000000000000");

    variable active: bit:='0';
    variable bt32ready: std_logic:='1';
    variable state: std_logic_vector (2 downto 0):="000";


		begin

		state:= rin.state;
    active:=rin.active;


if  rising_edge(clk)  then

       x := BT32_to_BLOCK32(procdata);  -- loads data in register x to process


-- process butterfly 32

    case state is
    	when "000" =>

      if enabled='1' then 
          active:='1';
          x := BT32_to_BLOCK32(datain);  -- loads data in register x to process
       dataout <= bt32result;
      end if;  

		 r(0) := x(30) - x(14);
		 r(1) := x(31) - x(15);

		 x(30) := x(30) + x(14);
		 x(31) := x(31) + x(15);
		 x(14) := r(0);
		 x(15) := r(1);
         
    when "001" =>
		 r(0) := x(28) - x(12);
		 r(1) := x(29) - x(13);
		 x(28) := x(28) + x(12);
		 x(29) := x(29) + x(13);
     x(12)  := MULT_NORM( (r(0) * cPI1_8)  -  (r(1) * cPI3_8) );-- Normalization   
	   x(13)  := MULT_NORM( (r(0) * cPI3_8)  +  (r(1) * cPI1_8 ));    

		when "010" =>
     r(0) := x(26) - x(10);
		 r(1) := x(27) - x(11);
		 x(26) := x(26) + x(10);
		 x(27) := x(27) + x(11);
	   x(10)  := MULT_NORM(( r(0)  - r(1) ) * cPI2_8);
	   x(11)  := MULT_NORM(( r(0)  + r(1) ) * cPI2_8);
 
	  when "011" =>
	
     r(0) := x(24) - x(8);
		 r(1) := x(25) - x(9);
		 x(24) := x(24) + x(8);
		 x(25) := x(25) + x(9);
	   x(8)   := MULT_NORM( (r(0) * cPI3_8)  -  (r(1) * cPI1_8) );
	   x(9)   := MULT_NORM( (r(1) * cPI3_8)  +  (r(0) * cPI1_8) );

    when "100" =>

		r(0) := x(22) - x(6);
		r(1) := x(7) - x(23);
		x(22) := x(22) + x(6);
		x(23) := x(23) + x(7);
		x(6) := r(1);
		x(7) := r(0);

    when "101" =>

		r(0) := x(4) - x(20);
		r(1) := x(5) - x(21);
		x(20) := x(20) + x(4);
		x(21) := x(21) + x(5);
	  x(4)   := MULT_NORM( (r(1) * cPI1_8)  +  (r(0) * cPI3_8) );
	  x(5)   := MULT_NORM( (r(1) * cPI3_8)  -  (r(0) * cPI1_8) );

    when "110" =>

		r(0) := x(2) - x(18);
		r(1) := x(3) - x(19);
		x(18) := x(18) + x(2);
		x(19) := x(19) + x(3);
	  x(2)   := MULT_NORM(( r(1)  + r(0) ) * cPI2_8);
	  x(3)   := MULT_NORM(( r(1)  - r(0) ) * cPI2_8);

    when "111" =>

     if rin.active='1' then
		    r(0) := x(0) - x(16);
		    r(1) := x(1) - x(17);
		    x(16) := x(16) + x(0);
		    x(17) := x(17) + x(1);
	      x(0)   := MULT_NORM( (r(1) * cPI3_8)  +  r(0) * cPI1_8 );
	      x(1)   := MULT_NORM( (r(1) * cPI1_8)  -  r(0) * cPI3_8 );
      end if;
      active:='0';
      state:="000";
     when others => 
       state:="000";
     end case;


-- end prcess butterfly 32
       if  active='1' then  
          state:=state +1;

       end if;
       rin.state <= state;


    end if;

   if bt32ready='0' then 
      procdata <= BLOCK32_to_BT32(x);    -- update processed data  
   else
      dataout <= bt32result;             -- give out result
   end if;

     if rst='0' then


     dataout(0) <=  ((others => "00000000000000000000000000000000"),(others => "00000000000000000000000000000000"));
     dataout(1) <=  ((others => "00000000000000000000000000000000"),(others => "00000000000000000000000000000000"));
     procdata(0)<=  ((others => "00000000000000000000000000000000"),(others => "00000000000000000000000000000000"));
     procdata(1) <=  ((others => "00000000000000000000000000000000"),(others => "00000000000000000000000000000000"));
     r :=  (others => "00000000000000000000000000000000");
			x :=  (others => "00000000000000000000000000000000");
      state := "000";
      active := '0';
      bt32ready := '1';
    end if;

     rin.active <= active;     
     ready <= bt32ready;

     if bt32result'event and active='0' then
        bt32ready:='1';
     end if;

    if rising_edge(enabled) then
          ready <= '0';
          bt32ready:='0';
    end if;
           

     end process;


--mult_gen: for i in 0 to MAXMULT generate

--	m : wbm GENERIC MAP (n=>32, m=>32)  
--  port map (
--       mps(i).op1, 
--       mps(i).op2,
--       mps_res(i)
--       );
--end generate;


b16_0: butterfly_16 
  port map (
       rst => rst,
			 clk => clk,
       datain  => procdata(0),
			 dataout => bt32result(0),
			 enabled => enabled
       );


b16_1: butterfly_16
  port map (
       rst => rst,
			 clk => clk,
       datain => procdata(1),
	     dataout => bt32result(1),
			 enabled => enabled
       );


end;


---------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;
use work.mdctrom256.all;

entity butterfly_1_stage is
		port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in block16_data;
			dataout  : out block16_data;
			points : in std_logic_vector(9 downto 0);
		 	enabled : in std_logic
			);

end butterfly_1_stage; 

architecture rtl of butterfly_1_stage is

type btf_1_regs is array (0 to 1) of std_logic_vector (31 downto 0);



begin

	btf_1 : process (rst,datain)

		variable r: btf_1_regs;
		variable x1,x2: block8_data;


		begin

		x1 := BLOCK16_to_BLOCK8(datain,0);
    x2 := BLOCK16_to_BLOCK8(datain,1);

--  Multiplication process


         r(0)      := x1(6)      -  x2(6);
	       r(1)      := x1(7)      -  x2(7);
	       x1(6)     := x1(6)  +  x2(6);
	       x1(7)     := x1(7)  +  x2(7);
	       x2(6)   := MULT_NORM(r(1) * T(1)  +  r(0) * T(0));
	       x2(7)   := MULT_NORM(r(1) * T(0)  -  r(0) * T(1));

	       r(0)      := x1(4)      -  x2(4);
	       r(1)      := x1(5)      -  x2(5);
	       x1(4)     := x1(4)  +  x2(4);
	       x1(5)     := x1(5)  +  x2(5);
	       x2(4)   := MULT_NORM(r(1) * T(5)  +  r(0) * T(4));
	       x2(5)   := MULT_NORM(r(1) * T(4)  -  r(0) * T(5));

	       r(0)      := x1(2)      -  x2(2);
	       r(1)      := x1(3)      -  x2(3);
	       x1(2)   := x1(2)  +  x2(2);
	       x1(3)   := x1(3)  +  x2(3);
	       x2(2)   := MULT_NORM(r(1) * T(9)  +  r(0) * T(8));
	       x2(3)   := MULT_NORM(r(1) * T(8)  -  r(0) * T(9));

	       r(0)      := x1(0)      -  x2(0);
	       r(1)      := x1(1)      -  x2(1);
	       x1(0)   := x1(0)  +  x2(0);
	       x1(1)   := x1(1)  +  x2(1);
	       x2(0)   := MULT_NORM(r(1) * T(13) +  r(0) * T(12));
	       x2(1)   := MULT_NORM(r(1) * T(12) -  r(0) * T(13));



-- End Multiplication process

    dataout <= BLOCK8_to_BLOCK16(x1,x2);
 
		if rst ='0' then 
			dataout <=  (others => "00000000000000000000000000000000");
    end if;


	end process;


end;
--------------------------------------------------------------------------------------------------
---------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;
use work.mdctrom256.all;

entity butterfly_generic is
		port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in block16_data;
			dataout  : out block16_data;
			points : in std_logic_vector(9 downto 0);
			trigint : in std_logic_vector(2 downto 0);
		 	enabled : in std_logic
			);

end butterfly_generic; 

architecture rtl of butterfly_generic is

type btf_genregs is array (0 to 1) of std_logic_vector (31 downto 0);



begin

	btf_1 : process (rst,datain)

		variable r: btf_genregs;
		variable x1,x2: block8_data;


		begin

		x1 := BLOCK16_to_BLOCK8(datain,0);
    x2 := BLOCK16_to_BLOCK8(datain,1);

--  butterfly_generic process

         r(0)      := x1(6)      -  x2(6);
	       r(1)      := x1(7)      -  x2(7);
	       x1(6)   := x1(6)  +   x2(6);
	       x1(7)   := x1(7)  +   x2(7);
	       x2(6)   := MULT_NORM(r(1) * T(1)  +  r(0) * T(0));
	       x2(7)   := MULT_NORM(r(1) * T(0)  -  r(0) * T(1));

--	       T+:=trigint;

	       r(0)      := x1(4)      -  x2(4);
	       r(1)      := x1(5)      -  x2(5);
	       x1(4)   := x1(4)  +   x2(4);
	       x1(5)   := x1(5)  +   x2(5);
	       x2(4)   := MULT_NORM(r(1) * T(1)  +  r(0) * T(0));
	       x2(5)   := MULT_NORM(r(1) * T(0)  -  r(0) * T(1));

--	       T+:=trigint;

	       r(0)      := x1(2)      -  x2(2);
	       r(1)      := x1(3)      -  x2(3);
	       x1(2)   := x1(2)  +   x2(2);
	       x1(3)   := x1(3)  +   x2(3);
	       x2(2)   := MULT_NORM(r(1) * T(1)  +  r(0) * T(0));
	       x2(3)   := MULT_NORM(r(1) * T(0)  -  r(0) * T(1));

--	       T+:=trigint;

	       r(0)      := x1(0)      -  x2(0);
	       r(1)      := x1(1)      -  x2(1);
	       x1(0)   := x1(0)  +   x2(0);
	       x1(1)   := x1(1)  +   x2(1);
	       x2(0)   := MULT_NORM(r(1) * T(1)  +  r(0) * T(0));
	       x2(1)   := MULT_NORM(r(1) * T(0)  -  r(0) * T(1));

--	       T+:=trigint;

-- End butterfly_generic process

    dataout <= BLOCK8_to_BLOCK16(x1,x2);
 
		if rst ='0' then 
			dataout <=  (others => "00000000000000000000000000000000");
    end if;


	end process;


end;
--------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;
use work.mdctrom256.all;

entity bit_reverse is
		port (
    		rst   : in  std_logic;
    		clk   : in  std_logic;
			datain  : in block16_data;
			dataout  : out block16_data;
			points : in std_logic_vector(9 downto 0);
			trigint : in std_logic_vector(2 downto 0);
		 	enabled : in std_logic;
       ready  : out std_logic
			);

end bit_reverse; 

architecture rtl of bit_reverse is

type bitrev_regs is array (0 to 3) of std_logic_vector (31 downto 0);


begin

	btf_1 : process (rst,datain)

		variable r: bitrev_regs;
		variable x0,x1: block8_data;
    variable w0,w1: bitrev_regs;

		begin

		x0 := BLOCK16_to_BLOCK8(datain,0);
    x1 := BLOCK16_to_BLOCK8(datain,1);

--  bit_reverse process

--    DATA_TYPE *x0    := x+bit(0);
--    DATA_TYPE *x1    := x+bit(1);

--    REG_TYPE  r0     := x0(1)  - x1(1);
--    REG_TYPE  r1     := x0(0)  + x1(0);
--    REG_TYPE  r2     := MULT_NORM(r(1)     * T(0)   + r(0) * T(1));
--    REG_TYPE  r3     := MULT_NORM(r(1)     * T(1)   - r(0) * T(0));

--	      w1    -:= 4;

              r(0)     := HALVE(x0(1) + x1(1));
              r(1)     := HALVE(x0(0) - x1(0));

	      w0(0)  := r(0)     + r(2);
	      w1(2)  := r(0)     - r(2);
	      w0(1)  := r(1)     + r(3);
	      w1(3)  := r(3)     - r(1);

--              x0     := x+bit(2);
--              x1     := x+bit(3);

              r(0)     := x0(1)  - x1(1);
              r(1)     := x0(0)  + x1(0);
              r(2)     := MULT_NORM(r(1)     * T(2)   + r(0) * T(3));
              r(3)     := MULT_NORM(r(1)     * T(3)   - r(0) * T(2));

              r(0)     := HALVE(x0(1) + x1(1));
              r(1)     := HALVE(x0(0) - x1(0));

	      w0(2)  := r(0)     + r(2);
	      w1(0)  := r(0)     - r(2);
	      w0(3)  := r(1)     + r(3);
	      w1(1)  := r(3)     - r(1);

--	      T     +:= 4;
--	      bit   +:= 4;
--	      w0    +:= 4;


-- End bit_reverse process

    dataout <= BLOCK8_to_BLOCK16(x0,x1);
 
		if rst ='0' then 
			dataout <=  (others => "00000000000000000000000000000000");
    end if;


	end process;


end;
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;
--use work.mdctrom256.all;

entity pre_process is
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    datain  : in block4_data;
    dataout  : out block4_data;
    lut : in block4_data;
    funct : in std_logic;
    enabled : in std_logic;
    ready : out std_logic
    );

end pre_process; 

architecture rtl of pre_process is
  constant s0 : std_logic:='0';  
  constant s1 : std_logic:='1';
  type inctrl is record
        state : std_logic;
        procdata : block4_data;
        active : std_logic;
  end record;
  signal r,rin : inctrl;
  
begin

  premult : process (rst,r,datain,enabled,lut)
  variable iX,oX,T: block4_data;
  variable tmp: inctrl;

  begin
    tmp := r;

    if enabled ='1' then
      case r.state is
        when s0 =>
          tmp.active:='1';
          ix := datain;                 -- read data
          T:=lut;
          ready <= '0';                 -- processing
          oX(0):= MULT_NORM(-iX(1) * T(3) - iX(0)  * T(2));
          oX(1):= MULT_NORM (iX(0) * T(3) - iX(1)  * T(2));
 
          tmp.state:=s1;

        when s1 =>
          oX(2):= MULT_NORM(-iX(3) * T(1) - iX(2)  * T(0));
          oX(3):= MULT_NORM (iX(2) * T(1) - iX(3)  * T(0));
          tmp.state:=s0;
          tmp.active:='0';
        when others => null;
      end case;
     tmp.procdata:=oX;
    else
      tmp.active:='0';
    end if;

    if r.active'event and r.active='0' then  -- when deactivated
      dataout <= r.procdata;
      ready <= '1';
    end if;
 
    if rst ='0' then 
      dataout <=  (others => "00000000000000000000000000000000");
      ready <= '1';
      tmp.state:=s0;
      tmp.procdata:=(others => "00000000000000000000000000000000");
      tmp.active:='0';
    end if;

    rin <= tmp;

  end process;

  clkup: process (clk)

  begin  -- process clk

    if rising_edge(clk)   then
      r <= rin;
    end if;

  end process;


end;
--------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;

entity multadd is
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    datain  : in in_multadd;
    dataout  : out out_multadd
    );

end multadd; 

architecture rtl of multadd is
  begin
    -- purpose: 2 multiplications  with an 64-bits adder
    --          return 32 bits result after multipliers and adder
    --          r_mult=MULT_NORM(op1_m1*op2_m1+/-op1_m2*op2_m2)
    -- type   : combinational
    -- inputs : clk,rst,datain
    -- outputs: dataout
    mult: process (clk,rst,datain)
    variable r1_64,r2_64: std_logic_vector (63 downto 0) := (others => '0');  
                                        -- result registers for multiplication
    variable ra_32 : std_logic_vector (31 downto 0) := (others => '0');  
                                        -- result register after addition
    begin  -- process mult

      r1_64 := datain.op1_m1 * datain.op2_m1;
      r2_64 := datain.op1_m2 * datain.op2_m2;
      
      if datain.add_fun='1'  then
        ra_32 := MULT_NORM(r1_64 + r2_64);
      elsif datain.add_fun='0' then
        ra_32 := MULT_NORM(r1_64 - r2_64);
      end if;

      if rst='0'  then
        dataout.r_m1 <= (others => '0');
        dataout.r_m2 <= (others => '0');
        dataout.r_mult <= (others => '0');
      elsif rst='1' then
        dataout.r_m1 <= MULT_NORM(r1_64);
        dataout.r_m2 <= MULT_NORM(r2_64);
        dataout.r_mult <= ra_32;
      end if;
    end process mult;

  end;
    
--------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;

entity addbank is
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    datain  : in in_addbank;
    dataout  : out out_addbank
    );

end addbank;

architecture rtl of addbank is

begin  -- rtl

  -- purpose: 3 preconf adders and 3 substractions
  -- type   : combinational
  -- inputs : clk,rst,datain
  -- outputs: dataout
  add: process (clk,rst,datain)
  begin  -- process add
    if rst ='0' then
      dataout.r_a1 <= (others => '0');
      dataout.r_a2 <= (others => '0');    
      dataout.r_a3 <= (others => '0');
      dataout.r_s1 <= (others => '0');
      dataout.r_s2 <= (others => '0');
      dataout.r_s3 <= (others => '0');
    elsif rst='1' then
      dataout.r_a1 <= datain.op1_a1 + datain.op2_a1;
      dataout.r_a2 <= datain.op1_a2 + datain.op2_a2;    
      dataout.r_a3 <= datain.op1_a3 + datain.op2_a3;
      dataout.r_s1 <= datain.op1_s1 - datain.op2_s1;
      dataout.r_s2 <= datain.op1_s2 - datain.op2_s2;
      dataout.r_s3 <= datain.op1_s3 - datain.op2_s3;
    end if;
    
  end process add;
    

end rtl;















