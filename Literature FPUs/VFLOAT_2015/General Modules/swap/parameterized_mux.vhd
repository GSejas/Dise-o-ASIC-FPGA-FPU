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
--  DATE	     | 25 Oct. 2012						    --
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
--              Parameterized multiplexer               --
----------------------------------------------------------
entity parameterized_mux is
	generic
	(
		bits			:	integer		:=	0
	);
	port
	(
		--inputs
		A			:	in	std_logic_vector(bits-1 downto 0);
		B			:	in	std_logic_vector(bits-1 downto 0);
		S			:	in	std_logic;
		--outputs
		O			:	out	std_logic_vector(bits-1 downto 0)	:= (others=>'0')
	);
end parameterized_mux;

----------------------------------------------------------
--              Parameterized multiplexer               --
----------------------------------------------------------
architecture parameterized_mux_arch of parameterized_mux is
begin
--	single_bits:for i in 0 to bits-1 generate
--		single_bit	:	mux2
--		port map
--		(
--			--inputs
--			A			=>	A(i),
--			B			=>	B(i),
--			S			=>	S,
--			--outputs
--			O			=>	O(i)
--		);
--	end generate; --i
	O <= A when (S = '1') else B;
end parameterized_mux_arch; -- end of architecture

