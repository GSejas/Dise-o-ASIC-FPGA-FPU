--======================================================--
--                                                      --
--  NORTHEASTERN UNIVERSITY                             --
--  DEPARTMENT OF ELECTRICAL AND COMPUTER ENGINEERING   --
--  Reconfigurable & GPU Computing Laboratory           --
--                                                      --
--  AUTHOR   | Xin Fang                            	  --
--  --------------------------------------------------  --
--  DATE	     | 25 Oct. 2012					       		  --
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

----------------------------------------------------------
--                Parameterized multiplier                   --
----------------------------------------------------------
entity parameterized_multiplier_2 is
	generic
	(
		bits		:	integer := 0
	);
	port
	(
		--inputs
		CLK		:	in std_logic;
		RESET		:	in	std_logic;
		STALL		:  in std_logic;
		A			:	in	std_logic_vector(bits-1 downto 0);
		B			:	in	std_logic_vector(bits+3 downto 0);
		--outputs
		S			:	out	std_logic_vector((2*bits)+3 downto 0)	:=	(others=>'0')
	);
end parameterized_multiplier_2;

----------------------------------------------------------
--                Parameterized adder                   --
----------------------------------------------------------
architecture parameterized_multiplier_arch_2 of parameterized_multiplier_2 is
	-- COMPONENT declaration
	component mul_man_multiplier_2 is
	port 
	(
		clk							: IN std_logic;
		a								: IN std_logic_VECTOR(bits-1 downto 0);
		b								: IN std_logic_VECTOR(bits+3 downto 0);
		ce								: IN std_logic;
		sclr							: IN std_logic;
		p								: OUT std_logic_VECTOR(2*bits+3 downto 0)
	);
	end component;
	
	-- SIGNALS
	signal enable					: std_logic;
begin
	enable <= not STALL;

	MAN_MUL : mul_man_multiplier_2
	port map
	(
		clk						=> CLK,
		ce							=> enable,
		sclr						=> RESET,
		a							=> A,
		b							=> B,
		p							=> S
	);
end parameterized_multiplier_arch_2; -- end of architecture

