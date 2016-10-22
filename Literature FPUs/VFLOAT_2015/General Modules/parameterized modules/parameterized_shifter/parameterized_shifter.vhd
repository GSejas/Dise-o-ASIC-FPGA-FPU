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
--           Parameterized variable shifter             --
----------------------------------------------------------
entity parameterized_shifter is
	generic
	(
		bits			:	integer		:=	12;
		shift_bits		:	integer		:=	8;
		direction		:	std_logic	:=	'0' --0=right,1=left
	);
	port
	(
		--inputs
		I			:	in	std_logic_vector(bits-1 downto 0);
		S			:	in	std_logic_vector(shift_bits-1 downto 0);
		FILL		:	in std_logic;
		--outputs
		O			:	out	std_logic_vector(bits-1 downto 0)
	);
end parameterized_shifter;

----------------------------------------------------------
--           Parameterized variable shifter             --
----------------------------------------------------------
architecture parameterized_shifter_arch of parameterized_shifter is
	--CONSTANTS
	constant	rows	:	integer	:=	ceil_log2(bits);
	
	--TYPE
	type pipe is	array (0 to rows) of std_logic_vector(bits-1 downto 0);
	
	--SIGNALS
	signal	zeros		:	std_logic_vector(bits-1 downto 0)	:=	(others	=>	'0');
	signal	truncate	:	std_logic_vector(rows-1 downto 0)	:=	(others	=>	'0');
	signal	shift		:	integer	:= 0;
	signal	tmp		:	integer	:= bits;
	signal	im		:	pipe; --intermediate signals
begin
	shift 			<= conv_integer(S);
--	need_shift: if(shift < tmp) generate
	truncate		<=	conv_std_logic_vector(shift, rows);
	im(0)			<=	I;
		over_rows	:	for x in 0 to rows-1 generate --iterate over rows
			row	:	parameterized_variable_shifter_row
				generic map
				(
					bits			=>	bits,
					row_number		=>	x,
					direction		=>	direction
				)
				port map
				(
					--inputs
					I			=>	im(x),
					S			=>	truncate(x),
					FILL		=> fill,
					--outputs
					O			=>	im(x+1)
				);
		end generate;--rows
--		O	<=	im(rows);
--	end generate;
	
	O	<=	(others => '0') when (shift >= tmp) else im(rows);
--	all_zeros: if(shift >= tmp) generate
--		O(bits-1 downto 0)	<=	(others	=>	'0');
--	end generate;
	
end parameterized_shifter_arch; -- end of architecture

