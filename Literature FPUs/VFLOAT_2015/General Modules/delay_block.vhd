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
use IEEE.std_logic_signed.all;

-- float
library fp_lib;
use fp_lib.float_pkg.all;

----------------------------------------------------------
--            Parameterized delay block                 --
----------------------------------------------------------
entity delay_block is
	generic
	(
		delay			:	integer	:=	1
	);
	port
	(
		--inputs
		CLK			:	in	std_logic;
		RESET			:	in	std_logic;
		STALL			:	in	std_logic;
		A				:	in	std_logic;
		--outputs
		A_DELAYED	:	out std_logic
	);
end delay_block;

----------------------------------------------------------
--            Parameterized delay block                 --
----------------------------------------------------------
architecture delay_block_arch of delay_block is

	type intermediate is array (delay-1 downto 0) of std_logic;

	signal int	:	intermediate;

begin
	synchronous: process (CLK,RESET,STALL)
	begin
		if(RESET = '1') then
			for i in 0 to delay-1 loop
				int(i) <= '0';
			end loop;
		elsif(rising_edge(CLK) and STALL = '0') then
			--feed input into delay pipeline
			int(0) <= A;
			--for loop over delayed intermediates
			for i in 1 to delay-1 loop
				int(i) <= int(i-1);
			end loop;
		end if;--CLK
	end process;--synchronous

	--output is last delayed intermediate
	A_DELAYED	<=	int(delay-1);
	
end delay_block_arch; -- end of architecture
