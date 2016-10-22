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

library fp_lib;
use fp_lib.float_pkg.all;
----------------------------------------------------------
--           Parameterized priority encoder             --
----------------------------------------------------------
entity parameterized_priority_encoder is
	generic
	(
		man_bits				: integer := 23;
		shift_bits			: integer := 5
	);
	port
	(
		--inputs
		MAN_IN				: in	std_logic_vector(man_bits-1 downto 0);
		--outputs
		SHIFT					: out	std_logic_vector(shift_bits-1 downto 0) := (others=>'0');
		EXCEPTION_OUT		: out	std_logic := '0'
	);
end parameterized_priority_encoder;

----------------------------------------------------------
--           Parameterized priority encoder             --
----------------------------------------------------------
architecture parameterized_priority_encoder_arch of parameterized_priority_encoder is
	
	constant shift_const	: std_logic_vector(shift_bits-1 downto 0):= CONV_STD_LOGIC_VECTOR(man_bits-1,shift_bits);
	
	signal bit_detect		: std_logic_vector(shift_bits-1 downto 0);
	signal n_bit_detect	: std_logic_vector(shift_bits-1 downto 0);
	signal all_zero		: std_logic;
	signal shift_value	: std_logic_vector(shift_bits-1 downto 0);
begin
	
	SHIFT_NUMBER_PROCESS : process (MAN_IN) is
	begin
		bit_detect <= CONV_STD_LOGIC_VECTOR(0,shift_bits);
		for i in man_bits-1 downto 0 loop
			if (MAN_IN(i) = '1') then
				bit_detect <= CONV_STD_LOGIC_VECTOR(i,shift_bits);
				exit;
			end if;
		end loop;
	end process SHIFT_NUMBER_PROCESS;
	
	n_bit_detect <= not bit_detect;
	
	ZERO_DETECT_OR : parameterized_or_gate generic map (shift_bits) port map (bit_detect,all_zero);
	
	SHIFT_VALUE_ADDER : parameterized_adder generic map (shift_bits) port map (shift_const,n_bit_detect,'1',shift_value,open);
	
	SHIFT			  <= shift_value when (all_zero = '1') else (others=>'0');
	EXCEPTION_OUT <= (not all_zero);
	
end parameterized_priority_encoder_arch; -- end of architecture
