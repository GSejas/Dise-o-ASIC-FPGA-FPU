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
entity swap is
	generic
	(
		exp_bits			: integer	:=	8;
		man_bits			: integer	:=	23
	);
	port
	(
		--inputs
		CLK				: in	std_logic;
		RESET				: in	std_logic;
		STALL				: in	std_logic;
		READY				: in	std_logic;
		IN1				: in	std_logic_vector(exp_bits+man_bits downto 0);
		IN2				: in	std_logic_vector(exp_bits+man_bits downto 0);
		--outputs
		EXP_DIFF			: out	std_logic_vector(exp_bits-1 downto 0);
		OUT1				: out	std_logic_vector(exp_bits+man_bits+2 downto 0);
		OUT2				: out	std_logic_vector(exp_bits+man_bits+2 downto 0);
		DONE				: out	std_logic
	);
end swap;

architecture swap_arch of swap is
	--SIGNALS
	signal sign1		: std_logic;
	signal sign2		: std_logic;
	signal sign_large	: std_logic;
	signal sign_small	: std_logic;
	
	signal exp1			: std_logic_vector(exp_bits downto 0);
	signal exp2			: std_logic_vector(exp_bits downto 0);
	signal difference	: std_logic_vector(exp_bits downto 0);
	signal difference_cor : std_logic_vector(exp_bits downto 0);
	signal exp			: std_logic_vector(exp_bits-1 downto 0);
	
	signal man1			: std_logic_vector(man_bits+1 downto 0);
	signal man2			: std_logic_vector(man_bits+1 downto 0);
	signal man_large	: std_logic_vector(man_bits+1 downto 0);
	signal man_small	: std_logic_vector(man_bits+1 downto 0);
		
	signal large		: std_logic_vector(exp_bits+man_bits+2 downto 0);
	signal small		: std_logic_vector(exp_bits+man_bits+2 downto 0);
	
	signal mux_ctrl	: std_logic;
	signal two_s_comp	: std_logic;
begin
	--concurrent
	--connect signals
	sign1			<= IN1(exp_bits+man_bits);
	sign2			<= IN2(exp_bits+man_bits);
	
	exp1			<=	'0' & IN1(exp_bits+man_bits-1 downto man_bits);
	exp2			<=	'0' & IN2(exp_bits+man_bits-1 downto man_bits);

	man1			<=	IN1(man_bits-1 downto 0) & "00";
	man2			<=	IN2(man_bits-1 downto 0) & "00";
	
	--instantiate the components
	exp_subtractor : parameterized_subtractor
	generic map
	(
		bits				=>	exp_bits + 1
	)
	port map
	(
		--inputs
		A					=>	exp1,
		B					=>	exp2,
		--outputs
		O					=> difference
	);
	
	diff_cor: difference_cor <= ((not difference) + '1') when (difference(exp_bits) = '1') else difference;
	
	control : mux_ctrl <= difference(exp_bits);
	
	exp_out_mux : parameterized_mux
	generic map
	(
		bits				=>	exp_bits
	)
	port map
	(
		--inputs
		A					=>	exp2(exp_bits-1 downto 0),
		B					=>	exp1(exp_bits-1 downto 0),
		S					=>	mux_ctrl,
		--outputs
		O					=>	exp
	);

	sign_out_mux1 : sign_large <= sign2 when (mux_ctrl = '1') else sign1;
	man_out_mux1  : parameterized_mux
	generic map
	(
		bits				=>	man_bits + 2
	)
	port map
	(
		--inputs
		A					=>	man2,
		B					=>	man1,
		S					=>	mux_ctrl,
		--outputs
		O					=>	man_large
	);

	sign_out_mux2 : sign_small <= sign1 when (mux_ctrl = '1') else sign2;
	man_out_mux2  : parameterized_mux
	generic map
	(
		bits				=>	man_bits + 2
	)
	port map
	(
		--inputs
		A					=>	man1,
		B					=>	man2,
		S					=>	mux_ctrl,
		--outputs
		O					=>	man_small
	);
		
	large <= sign_large & exp & man_large;
	small <= sign_small & exp & man_small;
	
	--sequential
	main	:	process(CLK,RESET,STALL) is
	begin
		if (RESET = '1') then
			DONE		<= '0';
			EXP_DIFF	<= (others => '0');
			OUT1		<= (others=>'0');
			OUT2		<= (others=>'0');
		elsif(rising_edge(CLK) and STALL = '0') then
			DONE		<=	READY;
			EXP_DIFF	<= difference_cor(exp_bits-1 downto 0);
			OUT1		<=	large;
			OUT2		<=	small;
		end if;--CLK
	end process MAIN; --main
	
end swap_arch; --end of architecture


