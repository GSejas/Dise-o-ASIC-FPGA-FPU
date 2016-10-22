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
entity parameterized_variable_shifter is
	generic
	(
		bits				:	integer		:=	12;
		select_bits			:	integer		:=	4;
		direction			:	std_logic	:=	'0' --0=right,1=left
	);
	port
	(
		--inputs
		I				:	in		std_logic_vector(bits-1 downto 0);
		S				:	in		std_logic_vector(select_bits-1 downto 0);
		CLEAR				:	in		std_logic;
		--outputs
		O				:	out		std_logic_vector(bits-1 downto 0)
	);
end parameterized_variable_shifter;

----------------------------------------------------------
--           Parameterized variable shifter             --
----------------------------------------------------------
architecture parameterized_variable_shifter_arch of parameterized_variable_shifter is
	--CONSTANTS
	constant	rows	:	integer	:=	ceil_log2(bits);
	
	--TYPES
	type pipe is
		array (0 to rows) of
			std_logic_vector(bits-1 downto 0);
	
	--SIGNALS
	signal	im		:	pipe; --intermediate signals
	signal	zeros		:	std_logic_vector(bits-1 downto 0)	:=	(others=>'0');
begin
	--connect input
	im(0)	<=	I;

	--defective module
	defective	:	if(rows/=select_bits) generate
		O	<=	(others=>'0'); --output zero if instantiated wrongly
	end generate;--defective unit

	--correctly instantiated
	correct	:	if(rows=select_bits) generate
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
					S			=>	S(x),
					FILL		=> '0',
					--outputs
					O			=>	im(x+1)
				);
		end generate;--rows
		output_mux	:	parameterized_mux
			generic map
			(
				bits				=>	bits
			)
			port map
			(
				--inputs
				A				=>	zeros,
				B				=>	im(rows),
				S				=>	CLEAR,
				--outputs
				O				=>	O
			);
	end generate;--correctly instantiated
end parameterized_variable_shifter_arch; -- end of architecture

