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
--                Shift/Adjust Module                   --
----------------------------------------------------------
entity shift_adjust is
	generic
	(
		exp_bits			:	integer	:=	8;
		man_bits			:	integer	:=	23
	);
	port
	(
		--inputs
		CLK				:	in		std_logic;
		RESET				:	in		std_logic;
		STALL				:	in		std_logic;
		READY				:	in		std_logic;
		FILL				:	in		std_logic;
		EXP_DIFF			:	in		std_logic_vector(exp_bits-1 downto 0);
		F_IN				:	in		std_logic_vector(man_bits+1 downto 0);
		--outputs
		F_OUT				:	out	std_logic_vector(man_bits+1 downto 0);
		DONE				:	out	std_logic
	);
end shift_adjust;

architecture shift_adjust_arch of shift_adjust is
	--SIGNALS
	signal	man_in	:	std_logic_vector(man_bits+1 downto 0);
	signal	man_out	:	std_logic_vector(man_bits+1 downto 0);
begin

	man_in <= ((not F_IN) + '1') when (fill = '1') else F_IN;
	
	pars	:	parameterized_shifter
		generic map
		(
			bits			=>	man_bits+2,
			shift_bits	=>	exp_bits,
			direction	=>	'0'
		)
		port map
		(
			I				=>	man_in,
			S				=>	exp_diff,
			FILL			=> fill,
			O				=>	man_out
		);	
	
	--SYNCHRONOUS
	main: process (CLK,RESET,STALL) is
	begin
		if (RESET = '1') then
			DONE	<= '0';
			F_OUT	<= (others=>'0');
		elsif(rising_edge(CLK) and STALL = '0') then
			DONE	<=	READY;
			F_OUT	<=	man_out;
		end if;--CLK
	end process main;--main
end shift_adjust_arch; --end of architecture


