--======================================================--
--                                                      --
--  NORTHEASTERN UNIVERSITY                             --
--  DEPARTMENT OF ELECTRICAL AND COMPUTER ENGINEERING   --
--  Reconfigurable & GPU Computing Laboratory           --
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
--  DATE		 | 25 Oct. 2012						    --
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
use IEEE.std_logic_unsigned.all;

-- float
library fp_lib;
use fp_lib.float_pkg.all;

----------------------------------------------------------
--                  Add/Sub Module                      --
----------------------------------------------------------
entity add_sub is
	generic
	(
		man_bits			:	integer	:=	0
	);
	port
	(
		--inputs
		CLK				:	in		std_logic;
		RESET				:	in		std_logic;
		STALL				:	in		std_logic;
		READY				:	in		std_logic;
		OP					:	in		std_logic;
		F1					:	in		std_logic_vector(man_bits+1 downto 0);
		F2					:	in		std_logic_vector(man_bits+1 downto 0);
		--outputs
		F_OUT				:	out	std_logic_vector(man_bits+1 downto 0);
		OVERFLOW			:	out	std_logic;
		DONE				:	out	std_logic
	);
end add_sub;

----------------------------------------------------------
--                  Add/Sub Module                      --
----------------------------------------------------------
architecture add_sub_arch of add_sub is
	--SIGNALS
	signal	nop		:	std_logic;
	signal	cout		:	std_logic;
	signal	nf2		:	std_logic_vector(man_bits+1 downto 0);
	signal	op2		:	std_logic_vector(man_bits+1 downto 0);
	signal	ov			:	std_logic;
	signal	result	:	std_logic_vector(man_bits+1 downto 0);
begin
	--ASYNCHRONOUS
	--signal connections
	nop		<=	NOT(OP);
	nf2		<=	NOT(F2);
	ov		<=	cout AND OP;
	--component instantiations
	pm	:	parameterized_mux
		generic map
		(
			bits	=>	man_bits+2
		)
		port map
		(
			A			=>	F2,
			B			=>	nf2,
			S			=>	OP,
			O			=>	op2
		);
	pa	:	parameterized_adder
		generic map
		(
			bits	=>	man_bits+2
		)
		port map
		(
			A			=>	F1,
			B			=>	F2,--op2, --Subtraction rounding problem updated Jainik
			CIN		=>	'0',--nop,--Subtraction rounding problem updated Jainik
			S			=>	result,
			COUT		=>	cout
		);
	--SYNCHRONOUS
	main: process (CLK,RESET,STALL)is
	begin
		if(RESET = '1') then
			DONE		<= '0';
			OVERFLOW <= '0';
			F_OUT		<= (others=>'0');
		elsif(rising_edge(CLK) and STALL = '0') then
			DONE		<=	READY;
			OVERFLOW	<=	ov;
			F_OUT		<=	result;
		end if;--CLK
	end process;--main
	
end add_sub_arch; --end of architecture

