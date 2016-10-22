--======================================================--
--                                                      --
--  NORTHEASTERN UNIVERSITY                             --
--  DEPARTMENT OF ELECTRICAL AND COMPUTER ENGINEERING   --
--  Reconfigurable and GPU Computing Laboratory                        --
--                                                      --
--  AUTHOR       | Pavle Belanovic                      --
--  -------------+------------------------------------  --
--  DATE         | 20 June 2002                         --
--  -------------+------------------------------------  --
--  REVISED BY   | Haiqian Yu                           --
--  -------------+------------------------------------  --
--  DATE         | 18 Jan. 2003                         --
--  -------------+------------------------------------  --
--  REVISED BY   | Jainik Kathiara                      --
--  -------------+------------------------------------  --
--  DATE         | 21 Sept. 2010                        --
--  --------------------------------------------------  --
--  REVISED BY   | Xin Fang                             --
--  --------------------------------------------------  --
--  DATE		 | 29 Sep. 2013					        --
--======================================================--

--******************************************************************************--
--                                                                              --
--	Copyright (C) 2014		                                                    --
--                                                                              --
--	This program is free software; you can redistribute it and/or				--
--	modify it under the terms of the GNU General Public License                 --
--	as published by the Free Software Foundation; either version 3              --
--	of the License, or (at your option) any later version.                      --
--                                                                              --
--	This program is distributed in the hope that it will be useful,             --
--	but WITHOUT ANY WARRANTY; without even the implied warranty of              --
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               --
--	GNU General Public License for more details.                                --
--                                                                              --
--	You should have received a copy of the GNU General Public License           --
--	along with this program.  If not, see<http://www.gnu.org/licenses/>.        --
--                                                                           	--
--******************************************************************************--

--======================================================--
--                      LIBRARIES                       --
--======================================================--

-- IEEE Libraries --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

--======================================================--
--                       PACKAGE                        --
--======================================================--

package float_pkg is

----------------------------------------------------------
--                   CONSTANTS	                       --
----------------------------------------------------------
-- pipeline delay
constant ADD_PIPELINE				: integer := 4;
constant SUB_PIPELINE				: integer := 4;

constant MUL_MANTISSA_DELAY		: integer := 3;
constant MUL_PIPELINE				: integer := MUL_MANTISSA_DELAY + 2;

--constant	DIV_MULTIPLIER_1_DELAY	: integer := 4;
--constant DIV_MULTIPLIER_2_DELAY	: integer := 5;
--constant DIV_PIPELINE				: integer := DIV_MULTIPLIER_1_DELAY + DIV_MULTIPLIER_2_DELAY + 2;

constant	DIV_MULTIPLIER_YR_DELAY: integer := 1; -- 2 to 1
constant DIV_MULTIPLIER_S_DELAY : integer := 1;
constant DIV_MULTIPLIER_M_DELAY : integer := 1;
constant	DIV_MULTIPLIER_L_DELAY : integer := 1; -- 3 to 1
constant MANTISSA_MULTIPLIER_DELAY:integer:=1;
constant DIV_PIPELINE				: integer := DIV_MULTIPLIER_YR_DELAY+ 2*DIV_MULTIPLIER_S_DELAY + DIV_MULTIPLIER_M_DELAY + DIV_MULTIPLIER_L_DELAY + MANTISSA_MULTIPLIER_DELAY + 2;


constant	SQRT_MULTIPLIER_YR_DELAY: integer := 1; -- 2 to 1
constant SQRT_MULTIPLIER_S_DELAY : integer := 1;
constant SQRT_MULTIPLIER_M_DELAY : integer := 1;
constant	SQRT_MULTIPLIER_L_DELAY : integer := 1; -- 3 to 1
constant SQRT_PIPELINE				: integer := SQRT_MULTIPLIER_YR_DELAY+ 2*SQRT_MULTIPLIER_S_DELAY + SQRT_MULTIPLIER_M_DELAY + SQRT_MULTIPLIER_L_DELAY +2;


constant	RECIP_MULTIPLIER_YR_DELAY: integer := 1; -- 2 to 1
constant RECIP_MULTIPLIER_S_DELAY : integer := 1;
constant RECIP_MULTIPLIER_M_DELAY : integer := 1;
constant	RECIP_MULTIPLIER_L_DELAY : integer := 1; -- 3 to 1
constant RECIP_PIPELINE				: integer := RECIP_MULTIPLIER_YR_DELAY+ 2*RECIP_MULTIPLIER_S_DELAY + RECIP_MULTIPLIER_M_DELAY + RECIP_MULTIPLIER_L_DELAY + 2;


constant	COMP_PIPELINE				: integer := 2;
constant FIX2FLOAT_PIPELINE		: integer := 5;
constant FLOAT2FIX_PIPELINE		: integer := 5;

----------------------------------------------------------
--                    Type		                          --
----------------------------------------------------------
	
----------------------------------------------------------
--							Functions								  --	
----------------------------------------------------------
function ceil2		 (input: integer) return integer;
function ceil_log2 (input: integer) return integer;
function max_width (input1: integer; input2: integer) return integer;

----------------------------------------------------------
--                    Components                        --
----------------------------------------------------------
--parameterized delay block
component delay_block is
generic
(
	delay									: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	A										: in std_logic;
	--outputs
	A_DELAYED							: out std_logic
);
end component;

--parameterized bus delay block
component bus_delay_block is
generic
(
	bits									: integer;
	delay									: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	A										: in std_logic_vector(bits-1 downto 0);
	--outputs
	A_DELAYED							: out	std_logic_vector(bits-1 downto 0)
);
end component;

--Parameterized AND gate
component parameterized_and_gate is
generic
(
	bits									: integer
);
port
(
	--inputs
	A										: in std_logic_vector(bits-1 downto 0);
	--outputs
	O										: out std_logic
);
end component;

--Parameterized OR gate
component parameterized_or_gate is
generic
(
	bits									: integer
);
port
(
	--inputs
	A										: in std_logic_vector(bits-1 downto 0);
	--outputs
	O										: out std_logic
);
end component;

--Parameterized priority encoder
component parameterized_priority_encoder is
generic
(
	man_bits								: integer;
	shift_bits							: integer
);
port
(
	--inputs
	MAN_IN								: in std_logic_vector(man_bits-1 downto 0);
	--outputs	
	SHIFT									: out	std_logic_vector(shift_bits-1 downto 0);
	EXCEPTION_OUT						: out	std_logic
);
end component;

--Parameterized comparator
component parameterized_comparator is
generic
(
	bits									: integer
);
port
(
	--inputs
	A										: in std_logic_vector(bits-1 downto 0);
	B										: in std_logic_vector(bits-1 downto 0);
	--outputs
	A_GT_B								: out	std_logic;
	A_EQ_B								: out	std_logic;
	A_LT_B								: out	std_logic
);
end component;

--Parameterized multiplexer
component parameterized_mux is
generic
(
	bits									: integer
);
port
(
	--inputs
	A										: in std_logic_vector(bits-1 downto 0);
	B										: in std_logic_vector(bits-1 downto 0);
	S										: in std_logic;
	--outputs
	O										: out	std_logic_vector(bits-1 downto 0)
);
end component;

--Parameterized shifter
component parameterized_shifter	is
generic
(
	bits									: integer;
	shift_bits							: integer;
	direction							: std_logic	-- 0=right, 1=left
);
port
(
	--inputs
	I										: in std_logic_vector(bits-1 downto 0);
	S										: in std_logic_vector(shift_bits-1 downto 0);
	FILL									: in std_logic;
	--outputs
	O										: out	std_logic_vector(bits-1 downto 0)
);
end component;

--Parameterized variable shifter	
component parameterized_variable_shifter is
generic
(
	bits									: integer;
	select_bits							: integer;
	direction							: std_logic --0=right,1=left
);
port
(
	--inputs
	I										: in	std_logic_vector(bits-1 downto 0);
	S										: in	std_logic_vector(select_bits-1 downto 0);
	CLEAR									: in	std_logic;
	--outputs
	O										: out	std_logic_vector(bits-1 downto 0)
);
end component;

--Parameterized variable shifter row
component parameterized_variable_shifter_row is
generic
(
	bits									: integer;
	row_number							: integer;
	direction							: std_logic --0=right,1=left
);
port
(
	--inputs
	I										: in std_logic_vector(bits-1 downto 0);
	S										: in std_logic;
	FILL									: in std_logic;
	--outputs
	O										: out	std_logic_vector(bits-1 downto 0)
);
end component;


--Parameterized adder
component parameterized_adder is
generic
(
	bits									: integer
);
port
(
	--inputs
	A										: in	std_logic_vector(bits-1 downto 0);
	B										: in	std_logic_vector(bits-1 downto 0);
	CIN									: in	std_logic;
	--outputs
	S										: out std_logic_vector(bits-1 downto 0);
	COUT									: out std_logic
);
end component;

--Parameterized subtractor	
component parameterized_subtractor is
generic
(
	bits									: integer
);
port
(
	--inputs
	A										: in std_logic_vector(bits-1 downto 0);
	B										: in std_logic_vector(bits-1 downto 0);
	--outputs
	O										: out	std_logic_vector(bits-1 downto 0)
);
end component;

component parameterized_multiplier is
generic
(
	bits									:	integer	:=	0
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	A										: in std_logic_vector(bits-1 downto 0);
	B										: in std_logic_vector(bits-1 downto 0);
	--outputs
	S										: out	std_logic_vector((2*bits)-1 downto 0)
);
end component;

--parameterized absolute value
component parameterized_absolute_value is
generic
(
	bits									: integer
);
port
(
	--inputs
	IN1									: in	std_logic_vector(bits-1 downto 0);
	--outputs
	EXC									: out	std_logic;
	OUT1									: out	std_logic_vector(bits-1 downto 0)
);
end component;

--Denormalize	
component denorm is
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	IN1									: in	std_logic_vector(exp_bits+man_bits downto 0);
	READY									: in	std_logic;
	EXCEPTION_IN						: in	std_logic;
	--outputs
	OUT1									: out	std_logic_vector(exp_bits+man_bits+1 downto 0);
	DONE									: out	std_logic;
	EXCEPTION_OUT						: out	std_logic
);
end component;

--Normalizer
component normalizer is
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	SIGN_IN								: in std_logic;
	EXP_IN								: in std_logic_vector(exp_bits-1 downto 0);
	MAN_IN								: in std_logic_vector(man_bits-1 downto 0);
	READY									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	SIGN_OUT								: out	std_logic;
	EXP_OUT								: out	std_logic_vector(exp_bits-1 downto 0);
	MAN_OUT								: out	std_logic_vector(man_bits-1 downto 0);
	EXCEPTION_OUT						: out	std_logic;
	DONE									: out	std_logic
);
end component;

--Round-normalize module
component rnd_norm is
generic
(
	exp_bits								: integer;
	man_bits_in							: integer;
	man_bits_out						: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	IN1									: in std_logic_vector((exp_bits+man_bits_in) downto 0);
	READY									: in std_logic;
	ROUND									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	OUT1									: out	std_logic_vector((exp_bits+man_bits_out) downto 0);
	DONE									: out	std_logic;
	EXCEPTION_OUT						: out	std_logic
);
end component;

component rnd_norm_wrapper is
generic
(
	exp_bits								: integer;
	man_bits_in							: integer;
	man_bits_out						: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	OP										: in std_logic_vector((exp_bits+man_bits_in) downto 0);
	READY									: in std_logic;
	ROUND									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	DONE									: out	std_logic;
	RESULT								: out	std_logic_vector((exp_bits+man_bits_out) downto 0);
	EXCEPTION_OUT						: out	std_logic
);
end component;

--Rounding addition module
component round_add is
generic
(
	exp_bits								: integer;
	man_bits_in							: integer;
	man_bits_out						: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	SIGN_IN								: in std_logic;
	EXP_IN								: in std_logic_vector(exp_bits-1 downto 0);
	MAN_IN								: in std_logic_vector(man_bits_in-1 downto 0);
	READY									: in std_logic;
	ENABLE								: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	SIGN_OUT								: out	std_logic;
	EXP_OUT								: out	std_logic_vector(exp_bits-1 downto 0);
	MAN_OUT								: out	std_logic_vector(man_bits_out-1 downto 0);
	EXCEPTION_OUT						: out	std_logic;
	DONE									: out	std_logic
);
end component;

--Correction module
component correction is
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	F										: in std_logic_vector(man_bits+1 downto 0);
	E										: in std_logic_vector(exp_bits-1 downto 0);
	S										: in std_logic;
	READY									: in std_logic;
	CLEAR									: in std_logic;
	ENABLE								: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	RESULT								: out	std_logic_vector(man_bits+exp_bits+2 downto 0);
	EXCEPTION_OUT						: out	std_logic;
	DONE									: out	std_logic
);
end component;

--Shift/adjust module
component shift_adjust is
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	READY									: in std_logic;
	FILL									: in std_logic;
	EXP_DIFF								: in std_logic_vector(exp_bits-1 downto 0);
	F_IN									: in std_logic_vector(man_bits+1 downto 0);
	--outputs
	F_OUT									: out	std_logic_vector(man_bits+1 downto 0);
	DONE									: out	std_logic
);
end component;

--Swap module
component swap is
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	READY									: in std_logic;
	IN1									: in std_logic_vector(exp_bits+man_bits downto 0);
	IN2									: in std_logic_vector(exp_bits+man_bits downto 0);
	--outputs
	EXP_DIFF								: out	std_logic_vector(exp_bits-1 downto 0);
	OUT1									: out	std_logic_vector(exp_bits+man_bits+2 downto 0);
	OUT2									: out	std_logic_vector(exp_bits+man_bits+2 downto 0);
	DONE									: out	std_logic
);
end component;

--Add/subtract module
component add_sub is
generic
(
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	READY									: in std_logic;
	OP										: in std_logic;
	F1										: in std_logic_vector(man_bits+1 downto 0);
	F2										: in std_logic_vector(man_bits+1 downto 0);
	--outputs
	F_OUT									: out	std_logic_vector(man_bits+1 downto 0);
	OVERFLOW								: out	std_logic;
	DONE									: out	std_logic
);
end component;

--Divider module
component divider is
generic
(
	bits									: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	X										: in std_logic_vector(2*bits-1 downto 0);
	Y										: in std_logic_vector(2*bits-1 downto 0);
	--outputs
	RESULT								: out	std_logic_vector(4*bits+7 downto 0)
);	
end component;

-- Square Root module
component sq is
generic
(
	bits									: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	odd_in								: in std_logic;
	Y_in									: in std_logic_vector(4*bits-1 downto 0); 
	--outputs
	res									: out	std_logic_vector(4*bits-1 downto 0) 
);	
end component;

-- Floating point compare
component fp_compare is
Generic
(
	exp_bits								: integer;
	man_bits								: integer
);
Port 
( 
	-- input value
	CLK									: in	STD_LOGIC;
	RESET 								: in	STD_LOGIC;
	READY 								: in	STD_LOGIC;
	STALL									: in	STD_LOGIC;
	EXCEPTION_IN						: in	STD_LOGIC;
	OP1 									: in	STD_LOGIC_VECTOR(exp_bits+man_bits downto 0);
	OP2									: in	STD_LOGIC_VECTOR(exp_bits+man_bits downto 0);
	-- output value
	COMPARE_DONE 						: out	STD_LOGIC;
	COMPARE_VALUE						: out	STD_LOGIC_VECTOR(3 downto 0);
	EXCEPTION_OUT						: out STD_LOGIC
);
end component;

--Floating point adder
component fp_add is
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	READY									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	OP1									: in std_logic_vector(man_bits+exp_bits downto 0);
	OP2									: in std_logic_vector(man_bits+exp_bits downto 0);
	--outputs
	RESULT								: out	std_logic_vector(man_bits+exp_bits+2 downto 0);
	EXCEPTION_OUT						: out	std_logic;
	DONE									: out	std_logic
);
end component;

--Floating point multiplier
component fp_mul is
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	OP1									: in std_logic_vector(exp_bits+man_bits downto 0);
	OP2									: in std_logic_vector(exp_bits+man_bits downto 0);
	READY									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	RESULT								: out	std_logic_vector(exp_bits+(2*man_bits) downto 0);
	EXCEPTION_OUT						: out	std_logic;
	DONE									: out	std_logic
);
end component;

--Floating point divider
component fp_div is
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	OP1									: in std_logic_vector(exp_bits+man_bits downto 0);
	OP2									: in std_logic_vector(exp_bits+man_bits downto 0);
	READY									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	DONE									: out	std_logic;
	RESULT								: out	std_logic_vector(exp_bits+(2*((man_bits+1)/2))+3 downto 0);
	EXCEPTION_OUT						: out	std_logic
);
end component;

--Floating point square root
component fp_sqrt is	
generic
(
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL									: in std_logic;
	OP										: in std_logic_vector(exp_bits+man_bits downto 0);
	READY									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	RESULT								: out	std_logic_vector(exp_bits+((((man_bits+2)/4)+1)*4)+1 downto 0) := (others => '0');
	EXCEPTION_OUT						: out	std_logic := '0';
	DONE									: out	std_logic := '0'
);
end component;

component fp_acc is
generic  
(	
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	CLK									: in std_logic;
	RESET									: in std_logic;
	STALL_IN								: in std_logic;
	READY									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	OP										: in std_logic_vector(exp_bits+man_bits downto 0);
	--outputs
	DONE									: out	std_logic;
	RESULT								: out	std_logic_vector(exp_bits+man_bits+2 downto 0);
	EXCEPTION_OUT						: out	std_logic;
	STALL_OUT							: out	std_logic
);
end component;

component fp_mac is
generic 
(
	exponent             			: integer;
	mantissa             			: integer;
	mult_in_parallel     			: integer
);
port 
(
	clk                  			: in std_logic;
	ready                			: in std_logic;
	exception_in         			: in std_logic;
	op1                  			: in std_logic_vector(mult_in_parallel*(exponent+mantissa+1)-1 downto 0);
	op2                 			 	: in std_logic_vector(mult_in_parallel*(exponent+mantissa+1)-1 downto 0);
	result               			: out std_logic_vector(exponent+mantissa downto 0);
	done                 			: out std_logic;	 
	exception_out        			: out std_logic
);
end component;

--fixed point to floating point conversion
component fix2float_signed is
generic
(
	fix_bits								: integer;
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	READY									: in std_logic;
	STALL									: in std_logic;
	FIXED									: in std_logic_vector(fix_bits-1 downto 0);
	ROUND									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	FLOAT									: out	std_logic_vector(exp_bits+man_bits downto 0);
	EXCEPTION_OUT						: out	std_logic;
	DONE									: out	std_logic
);
end component;

--floating point to fixed point conversion
component float2fix_signed is
generic
(
	fix_bits								: integer;
	exp_bits								: integer;
	man_bits								: integer
);
port
(
	--inputs
	CLK									: in std_logic;
	RESET									: in std_logic;
	READY									: in std_logic;
	STALL									: in std_logic;
	FLOAT									: in std_logic_vector(exp_bits+man_bits downto 0);
	ROUND									: in std_logic;
	EXCEPTION_IN						: in std_logic;
	--outputs
	FIXED									: out	std_logic_vector(fix_bits-1 downto 0);
	EXCEPTION_OUT						: out	std_logic;
	DONE									: out	std_logic
);
end component;

end float_pkg;

package body float_pkg is

-- Function to calculate 2^n >= given number
function ceil2 (input: integer) return integer is
	variable max		:	integer :=1; -- start at max=2^0=1
begin
	log_loop: while max < input loop
		max	:=	max*2;	-- max = 2^n
	end loop log_loop;
	return max; -- max >= input and max = 2^n
end ceil2;

-- Function to calculate ceil(log2(n))
function ceil_log2 (input: integer) return integer is
	variable max	:	integer :=1; -- exp=0 => max=2^0=1
	variable exp	:	integer :=0;
begin
	log_loop: while max < input loop
		exp	:=	exp+1;	-- increment exponent
		max	:=	max*2;	-- max = 2^exp
	end loop log_loop;
	return exp; -- exponent that gives (2^exp) >= input
end ceil_log2;

-- Function to calculate max number between 2 numbers
function max_width (input1: integer; input2: integer) return integer is
begin
	if (input1 < input2) then
		return input2;
	else
		return input1;
	end if;
end max_width;

end float_pkg;
