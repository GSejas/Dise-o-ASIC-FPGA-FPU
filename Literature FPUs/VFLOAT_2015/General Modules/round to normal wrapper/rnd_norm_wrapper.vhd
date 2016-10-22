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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library fp_lib;
use fp_lib.float_pkg.all;

entity rnd_norm_wrapper is
	Generic
	(
		exp_bits					: integer := 8;
		man_bits_in				: integer := 57;
		man_bits_out			: integer := 32
	);
	Port
	(
		CLK						: in std_logic;
		RESET						: in std_logic;
		STALL						: in std_logic;
		ROUND						: in std_logic;
		READY						: in std_logic;
		OP							: in std_logic_vector(exp_bits+man_bits_in downto 0);
		EXCEPTION_IN			: in std_logic;
		DONE						: out std_logic;
		RESULT					: out std_logic_vector(exp_bits+man_bits_out downto 0);
		EXCEPTION_OUT  		: out std_logic
	);
end rnd_norm_wrapper;

architecture Behavioral of rnd_norm_wrapper is
	
	-- Signal definitions
	signal operand				: std_logic_vector(exp_bits+man_bits_in+1 downto 0);
	
	signal rnd_done			: std_logic;
	signal rnd_result			: std_logic_vector(exp_bits+man_bits_out downto 0);
	signal rnd_exception		: std_logic;
begin
	
	operand <= OP & '0';
	
	IF_RND_NORM_INST: if (man_bits_in = man_bits_out) generate
		RND_NORM_IF_INST:rnd_norm
		generic map
		(
			exp_bits				=> exp_bits,
			man_bits_in			=> man_bits_in+1,
			man_bits_out		=> man_bits_out
		)
		port map
		(
			CLK					=> CLK,
			RESET					=> RESET,
			STALL					=> STALL,
			IN1					=> operand,
			READY					=> READY,
			ROUND					=> ROUND,
			EXCEPTION_IN		=> EXCEPTION_IN,
			OUT1					=> rnd_result,
			DONE					=> rnd_done,
			EXCEPTION_OUT  	=> rnd_exception
		);
	end generate;
		
	ELSE_RND_NORM_INST: if (man_bits_in /= man_bits_out) generate
		RND_NORM_ELSE_INST:rnd_norm
		generic map
		(
			exp_bits				=> exp_bits,
			man_bits_in			=> man_bits_in,
			man_bits_out		=> man_bits_out
		)
		port map
		(
			CLK					=> CLK,
			RESET					=> RESET,
			STALL					=> STALL,
			IN1					=> operand(exp_bits+man_bits_in+1 downto 1),
			READY					=> READY,
			ROUND					=> ROUND,
			EXCEPTION_IN		=> EXCEPTION_IN,
			OUT1					=> rnd_result,
			DONE					=> rnd_done,
			EXCEPTION_OUT  	=> rnd_exception
		);
	end generate;
	
	DONE 							<= rnd_done;
	RESULT						<= rnd_result;
	EXCEPTION_OUT				<= rnd_exception;
	
end Behavioral;

