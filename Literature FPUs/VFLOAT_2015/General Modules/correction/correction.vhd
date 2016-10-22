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

-- float
library fp_lib;
use fp_lib.float_pkg.all;

----------------------------------------------------------
--                  Correction Module                   --
----------------------------------------------------------
entity correction is
	generic
	(
		exp_bits			:	integer	:=	0;
		man_bits			:	integer	:=	0
	);
	port
	(
		--inputs
		CLK				:	in		std_logic;
		RESET				:	in		std_logic;
		STALL				:	in		std_logic;
		F					:	in		std_logic_vector(man_bits+1 downto 0);
		E					:	in		std_logic_vector(exp_bits-1 downto 0);
		S					:	in		std_logic;
		READY				:	in		std_logic;
		CLEAR				:	in		std_logic;
		ENABLE			:	in		std_logic;
		EXCEPTION_IN	:	in		std_logic;
		--outputs
		RESULT			:	out	std_logic_vector(man_bits+exp_bits+2 downto 0);
		EXCEPTION_OUT	:	out	std_logic;
		DONE				:	out	std_logic
	);
end correction;

----------------------------------------------------------
--                  Correction Module                   --
----------------------------------------------------------
architecture correction_arch of correction is
	--SIGNALS
	signal	corrected_exponent	:	std_logic_vector(exp_bits-1 downto 0);
	signal	corrected_mantissa	:	std_logic_vector(man_bits+1 downto 0);
	signal	one						:	std_logic_vector(exp_bits-1 downto 0);
	signal	cout						:	std_logic;
	signal	clear_int				:	std_logic;
	signal	exc_int					:	std_logic;
	signal	zero						:	std_logic_vector(man_bits+exp_bits+2 downto 0);
	signal	result_int				:	std_logic_vector(man_bits+exp_bits+2 downto 0);
	signal	result_out				:	std_logic_vector(man_bits+exp_bits+2 downto 0);
begin
	--ASYNCHRONOUS
	--component instantiation
	pa	:	parameterized_adder
		generic map
		(
			bits		=>	exp_bits
		)
		port map
		(
			A			=>	E,
			B			=>	one,
			CIN		=>	'0',
			S			=>	corrected_exponent,
			COUT		=>	cout
		);
		
	exp_mux	:	parameterized_mux
		generic map
		(
			bits		=>	exp_bits
		)
		port map
		(
			A			=>	corrected_exponent,
			B			=>	E,
			S			=>	ENABLE,
			O			=>	result_int(man_bits+exp_bits+1 downto man_bits+2)
		);
		
	man_mux	:	parameterized_mux
		generic map
		(
			bits		=>	man_bits+2
		)
		port map
		(
			A			=>	corrected_mantissa,
			B			=>	F,
			S			=>	ENABLE,
			O			=>	result_int(man_bits+1 downto 0)
		);
		
	out_mux	:	parameterized_mux
		generic map
		(
			bits		=>	exp_bits+man_bits+3
		)
		port map
		(
			A			=>	zero,
			B			=>	result_int,
			S			=>	clear_int,
			O			=>	result_out
		);
		
	--signal connections
	clear_int										<=	CLEAR OR exc_int;
	exc_int											<=	EXCEPTION_IN OR cout;
	zero												<=	(others=>'0');
	one(exp_bits-1 downto 1)					<=	(others=>'0');
	one(0)											<=	'1';
	corrected_mantissa(man_bits downto 0)	<=	F(man_bits+1 downto 1);
	corrected_mantissa(man_bits+1)			<=	'1';
	result_int(man_bits+exp_bits+2)			<=	S;

	--SYNCHRONOUS
	main	:	process(CLK,RESET,STALL) is
	begin
		if(RESET = '1') then
			DONE				<= '0';
			RESULT			<= (others=>'0');
			EXCEPTION_OUT	<= '0';
		elsif(rising_edge(CLK) and STALL = '0') then
			DONE				<=	READY;
			RESULT			<=	result_out;
			EXCEPTION_OUT	<=	exc_int;
		end if;--CLK
	end process;--main
end correction_arch; --end of architecture
