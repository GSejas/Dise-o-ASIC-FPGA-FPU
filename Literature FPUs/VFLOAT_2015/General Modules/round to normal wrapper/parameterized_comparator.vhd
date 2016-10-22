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
--  DATE	     | 25 Oct. 2012					        --
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
--            Parameterized comparator                  --
----------------------------------------------------------
entity parameterized_comparator is
	generic
	(
		bits			:	integer		:=	0
	);
	port
	(
		--inputs
		A			:	in	std_logic_vector(bits-1 downto 0);
		B			:	in	std_logic_vector(bits-1 downto 0);
		--outputs
		A_GT_B			:	out	std_logic	:=	'0';
		A_EQ_B			:	out	std_logic	:=	'0';
		A_LT_B			:	out	std_logic	:=	'0'
	);
end parameterized_comparator;

----------------------------------------------------------
--            Parameterized comparator                  --
----------------------------------------------------------
--architecture parameterized_comparator_arch of parameterized_comparator is
--	signal	im		:		std_logic_vector(bits*3+2 downto 0)	:=	(others=>'0');
--begin
--	single_bits:for i in 0 to bits-1 generate
--		obc	:	one_bit_comparator
--		port map
--		(
--			--inputs
--			A				=>	A(i),
--			B				=>	B(i),
--			GT			=>	im(i*3),
--			EQ			=>	im(i*3+1),
--			LT			=>	im(i*3+2),
--			--outputs
--			A_GT_B	=>	im(i*3+3),
--			A_EQ_B	=>	im(i*3+4),
--			A_LT_B	=>	im(i*3+5)
--		);
--	end generate; --i
--	--tie up/down some inputs
--	im(0)	<=	'0'; --gt
--	im(1)	<=	'1'; --eq
--	im(2)	<=	'0'; --lt
--	--wire out outputs
--	A_GT_B	<=	im(bits*3);
--	A_EQ_B	<=	im(bits*3+1);
--	A_LT_B	<=	im(bits*3+2);
--end parameterized_comparator_arch; -- end of architecture


----------------------------------------------------------
--					Haiqian's comparator, using operator				--
--            Parameterized comparator                  --
----------------------------------------------------------
architecture parameterized_comparator_arch of parameterized_comparator is
begin
	A_GT_B	<=	'1' when A > B else '0';
	A_EQ_B	<=	'1' when A = B else '0';
	A_LT_B	<=	'1' when A < B else '0';
end parameterized_comparator_arch; -- end of architecture


