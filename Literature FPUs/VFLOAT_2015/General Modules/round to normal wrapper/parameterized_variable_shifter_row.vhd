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
--  DATE		 | 25 Oct. 2012							--
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
--       Parameterized variable shifter row             --
----------------------------------------------------------
entity parameterized_variable_shifter_row is
	generic
	(
		bits				:	integer		:=	0;
		row_number			:	integer		:=	0;
		direction			:	std_logic	:=	'0' --0=right,1=left
	);
	port
	(
		--inputs
		I				:	in	std_logic_vector(bits-1 downto 0);
		S				:	in	std_logic;
		FILL			:	in	std_logic;
		--outputs
		O				:	out	std_logic_vector(bits-1 downto 0)
	);
end parameterized_variable_shifter_row;

----------------------------------------------------------
--       Parameterized variable shifter row             --
----------------------------------------------------------
--architecture parameterized_variable_shifter_row_arch of parameterized_variable_shifter_row is
--	--CONSTANTS
--	constant	shift	:	integer	:=	2**row_number;
--begin
--	right	:	if(direction='0') generate --right shift logic
--		shift_right	:	for x in 0 to bits-shift-1 generate
--			sr	:	mux2
--				port map
--				(
--					--inputs
--					A			=>	I(x+shift),
--					B			=>	I(x),	
--					S			=>	S,	
--					--outputs
--					O			=>	O(x)
--				);
--		end generate;--x
--		zero_fill	:	for y in bits-shift to bits-1 generate
--			zf	:	mux2
--				port map
--				(
--					--inputs
--					A			=>	'0',
--					B			=>	I(y),	
--					S			=>	S,	
--					--outputs
--					O			=>	O(y)
--				);
--		end generate;--y
--	end generate;--right
--	left	:	if(direction='1') generate --left shift logic
--		shift_left	:	for x in shift to bits-1 generate
--			sl	:	mux2
--				port map
--				(
--					--inputs
--					A			=>	I(x-shift),
--					B			=>	I(x),	
--					S			=>	S,	
--					--outputs
--					O			=>	O(x)
--				);
--		end generate;--x
--		zero_fill	:	for y in 0 to shift-1 generate
--			zf	:	mux2
--				port map
--				(
--					--inputs
--					A			=>	'0',
--					B			=>	I(y),	
--					S			=>	S,	
--					--outputs
--					O			=>	O(y)
--				);
--		end generate;--y
--	end generate;--left
--end parameterized_variable_shifter_row_arch; -- end of architecture

----------------------------------------------------------
--					Haiqian's shifter, change the mux2 part 	 	--
----------------------------------------------------------

architecture parameterized_variable_shifter_row_arch of parameterized_variable_shifter_row is
	--CONSTANTS
	constant	shift	:	integer	:=	2**row_number;
begin
	right	:	if(direction='0') generate --right shift logic

		shift_right	:	for x in 0 to bits-shift-1 generate
			O(x) <= I(x+shift) when (S='1') else I(x);
		end generate;--x

		zero_fill	:	for y in bits-shift to bits-1 generate
--			O(y) <= '0' when (S = '1') else I(y);
			O(y) <= FILL when (S = '1') else I(y);
		end generate;--y

	end generate;--right
	
	left	:	if(direction='1') generate --left shift logic

		shift_left	:	for x in shift to bits-1 generate
			O(x) <= I(x-shift) when (S = '1') else I(x);
		end generate;--x

		zero_fill	:	for y in 0 to shift-1 generate
--			O(y) <= '0' when (S = '1') else I(y);
			O(y) <= FILL when (S = '1') else I(y);
		end generate;--y

	end generate;--left
end parameterized_variable_shifter_row_arch; -- end of architecture

