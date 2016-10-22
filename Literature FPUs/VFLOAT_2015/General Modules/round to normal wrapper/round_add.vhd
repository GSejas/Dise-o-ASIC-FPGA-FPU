--======================================================--
--                                                      --
--  NORTHEASTERN UNIVERSITY                             --
--  DEPARTMENT OF ELECTRICAL AND COMPUTER ENGINEERING   --
--  RAPID PROTOTYPING LABORATORY                        --
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
--	REVISED BY	 | Xin Fang						    	--
--  --------------------------------------------------  --
--  DATE	     | Nov. 2014							--
--======================================================--

--**********************************************************************************--
--                                                                                  --
--	Copyright (C) 2014		                                            			--
--                                                                                  --
--	This program is free software; you can redistribute it and/or              		--
--	modify it under the terms of the GNU General Public License                 	--
--	as published by the Free Software Foundation; either version 3              	--
--	of the License, or (at your option) any later version.                      	--
--                                                                                  --
--	This program is distributed in the hope that it will be useful,             	--
--	but WITHOUT ANY WARRANTY; without even the implied warranty of              	--
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               	--
--	GNU General Public License for more details.                                	--
--                                                                                  --
--	You should have received a copy of the GNU General Public License           	--
--	along with this program.  If not, see<http://www.gnu.org/licenses/>.        	--
--                                                                           	    --
--**********************************************************************************--

--======================================================--
--                      LIBRARIES                       --
--======================================================--

-- IEEE Libraries --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- float
library fp_lib;
use fp_lib.float_pkg.all;

----------------------------------------------------------
--                 Rounding addition                    --
----------------------------------------------------------
entity round_add is
	generic
	(
		exp_bits			:	integer	:= 0;
		man_bits_in		:	integer	:=	0;
		man_bits_out	:	integer	:=	0
	);
	port
	(
		--inputs
		CLK				:	in		std_logic;
		RESET				:	in		std_logic;
		STALL				:	in		std_logic;
		SIGN_IN			:	in		std_logic;
		EXP_IN			:	in		std_logic_vector(exp_bits-1 downto 0);
		MAN_IN			:	in		std_logic_vector(man_bits_in-1 downto 0);
		READY				:	in		std_logic;
		ENABLE			:	in		std_logic;
		EXCEPTION_IN	:	in		std_logic;
		--outputs
		DONE				:	out	std_logic;
		SIGN_OUT			:	out	std_logic;
		EXP_OUT			:	out	std_logic_vector(exp_bits-1 downto 0);
		MAN_OUT			:	out	std_logic_vector(man_bits_out-1 downto 0);
		EXCEPTION_OUT	:	out	std_logic
	);
end round_add;

----------------------------------------------------------
--                 Rounding addition                    --
----------------------------------------------------------
architecture round_add_arch of round_add is
	--SIGNALS
	signal	exponent	:	std_logic_vector(exp_bits-1 downto 0)			:= (others=>'0');
	signal	slice		:	std_logic_vector(man_bits_out downto 0)		:=	(others=>'0');
	signal	exp_int	:	std_logic_vector(exp_bits-1 downto 0)			:= (others=>'0');
	signal	man_int	:	std_logic_vector(man_bits_out downto 0)		:=	(others=>'0');
	signal	man_carry:	std_logic :=	'0';
	signal	exc_int	:	std_logic :=	'0';
	signal	exc_pa	:	std_logic :=	'0';
	signal	zeros		:	std_logic_vector(man_bits_out downto 0)		:=	(others=>'0');
	signal	zeros_exp:	std_logic_vector(exp_bits-1 downto 0)			:= (others=>'0');
	
	signal	int		:	integer;
	signal	ifzero	:	std_logic_vector(man_bits_in-man_bits_out-3 downto 0) := (others => '0');
	
	
begin
	--ASYNCHRONOUS
	--component instantiation
	pa	: parameterized_adder
		generic map
		(
			bits		=>	man_bits_out+1
		)
		port map
		(
			A			=>	slice,
			B			=>	zeros,
			CIN		=>	ENABLE,
			S			=>	man_int,
			--COUT		=>	exc_pa
			COUT		=> man_carry
		);
		
	pe	: parameterized_adder
		generic map
		(
			bits		=>	exp_bits
		)
		port map
		(
			A			=>	exponent,
			B			=>	zeros_exp,
			CIN		=>	man_carry,
			S			=>	exp_int,
			COUT		=>	exc_pa
		);
	
	--signal connections
	exponent	<= EXP_IN;
	slice		<=	MAN_IN(man_bits_in-2 downto man_bits_in-man_bits_out-2);
	exc_int	<=	exc_pa OR EXCEPTION_IN;
	
	ifzero	<= MAN_IN(man_bits_in-man_bits_out-3 downto 0);
	int		<= conv_integer(ifzero);
	
	--SYNCHRONOUS
	main: process (CLK,RESET,STALL) is
	begin
		if (RESET = '1') then
			SIGN_OUT			<= '0';
			EXP_OUT			<= (others=>'0');
			MAN_OUT			<=	(others=>'0');
			EXCEPTION_OUT	<=	'0';
			DONE				<=	'0';			
		elsif(rising_edge(CLK) and STALL = '0') then
			if(int = 0 and MAN_IN(man_bits_in-man_bits_out-2) = '1' and ENABLE = '1') then
			SIGN_OUT			<= SIGN_IN;
			EXP_OUT			<= exp_int;
			MAN_OUT			<=	man_int(man_bits_out downto 2)&'0';
			EXCEPTION_OUT	<=	exc_int;
			DONE				<=	READY;
			else
			SIGN_OUT			<= SIGN_IN;
			EXP_OUT			<= exp_int;
			MAN_OUT			<=	man_int(man_bits_out downto 1);
			EXCEPTION_OUT	<=	exc_int;
			DONE				<=	READY;
			end if;
		end if; --CLK
	end process; --main
end round_add_arch; -- end of architecture
