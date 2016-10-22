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
--          Rounding/Normalization Module               --
----------------------------------------------------------
entity rnd_norm is
	generic
	(
		exp_bits			:	integer	:=	0;
		man_bits_in		:	integer	:=	0;
		man_bits_out	:	integer	:=	0
	);
	port
	(
		--inputs
		CLK				:	in		std_logic;
		RESET				:	in		std_logic;
		STALL				:	in		std_logic;
		IN1				:	in		std_logic_vector((exp_bits+man_bits_in) downto 0);
		READY				:	in		std_logic;
		ROUND				:	in		std_logic;
		EXCEPTION_IN	:	in		std_logic;
		--outputs
		OUT1				:	out	std_logic_vector((exp_bits+man_bits_out) downto 0);
		DONE				:	out	std_logic;
		EXCEPTION_OUT	:	out	std_logic
	);
end rnd_norm;

----------------------------------------------------------
--          Rounding/Normalization Module               --
----------------------------------------------------------
architecture rnd_norm_arch of rnd_norm is
	--sign bit signals
	signal	s_in			:	std_logic	:=	'0';
	signal	s_int			:	std_logic	:=	'0';
	signal	s_out			:	std_logic	:=	'0';
	--exponent signals
	signal	e_in			:	std_logic_vector(exp_bits-1 downto 0)	:=	(others => '0');
	signal	e_int			:	std_logic_vector(exp_bits-1 downto 0)	:=	(others => '0');
	signal	e_out			:	std_logic_vector(exp_bits-1 downto 0)	:=	(others => '0');
	--mantissa signals
	signal	f_in			:	std_logic_vector(man_bits_in-1 downto 0)	:=	(others => '0');
	signal	f_int			:	std_logic_vector(man_bits_in-1 downto 0)	:=	(others => '0');
	signal	f_out			:	std_logic_vector(man_bits_out-1 downto 0)	:=	(others => '0');
	--exception signals
	signal	exc_int		:	std_logic :=	'0';
	--ready/done signals
	signal	rd_int		:	std_logic :=	'0';
	--round signal
	signal	round_int	:	std_logic :=	'0';
	
	signal	temp_out		:	std_logic_vector((exp_bits+man_bits_out) downto 0);
	signal	temp_done	:	std_logic;
	signal	temp_exc		:	std_logic;
begin
	--ASYNCHRONOUS
	--connect input signals
	s_in		<=	IN1(exp_bits+man_bits_in);
	e_in		<=	IN1(exp_bits+man_bits_in-1 downto man_bits_in);
	f_in		<=	IN1(man_bits_in-1 downto 0);

	--connect output signals
	temp_out(exp_bits+man_bits_out)								<=	s_out;
	temp_out(exp_bits+man_bits_out-1 downto man_bits_out)	<=	e_out;
	temp_out(man_bits_out-1 downto 0)							<=	f_out;

	--instatiate components
	--normalizer
	norm: normalizer
		generic map
		(
			exp_bits			=>	exp_bits,
			man_bits			=>	man_bits_in
		)
		port map
		(
			--inputs
			CLK				=>	CLK,
			RESET				=> RESET,
			STALL				=> STALL,
			SIGN_IN			=> s_in,
			EXP_IN			=>	e_in,
			MAN_IN			=>	f_in,
			READY				=>	READY,
			EXCEPTION_IN	=>	EXCEPTION_IN,
			--outputs
			SIGN_OUT			=> s_int,
			EXP_OUT			=>	e_int,
			MAN_OUT			=>	f_int,
			EXCEPTION_OUT	=>	exc_int,
			DONE				=>	rd_int
		);
	--round_add
	rnd_add: round_add
		generic map
		(
			exp_bits			=> exp_bits,
			man_bits_in		=>	man_bits_in,
			man_bits_out	=>	man_bits_out
		)
		port map
		(
			--inputs
			CLK				=>	CLK,
			RESET				=> RESET,
			STALL				=> STALL,
			SIGN_IN			=> s_int,
			EXP_IN			=> e_int,
			MAN_IN			=>	f_int,
			READY				=>	rd_int,
			ENABLE			=>	round_int,
			EXCEPTION_IN	=>	exc_int,
			--outputs
			SIGN_OUT			=> s_out,
			EXP_OUT			=> e_out,
			MAN_OUT			=>	f_out,
			EXCEPTION_OUT	=>	temp_exc,
			DONE				=>	temp_done
		);

	--SYNCHRONOUS
	main: process (CLK,RESET,STALL) is
	begin
		if(RESET = '1') then
			--pipelining rounding
			round_int	<=	'0';		
		elsif(rising_edge(CLK) and STALL = '0') then
			--pipelining rounding
			round_int	<=	ROUND;
		end if;--CLK
	end process;--main
	
	DONE				<= temp_done;
	OUT1	 			<= temp_out;
	EXCEPTION_OUT 	<= temp_exc and temp_done;
		
end rnd_norm_arch;--end of architecture
