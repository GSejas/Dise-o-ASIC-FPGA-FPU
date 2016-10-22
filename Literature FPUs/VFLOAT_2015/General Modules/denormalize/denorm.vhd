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
--  DATE		 | 25 Oct. 2012					        --
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
--               Denormalization Module                 --
----------------------------------------------------------
entity denorm is
	generic
	(
		exp_bits		:	integer	:=	8;
		man_bits		:	integer	:=	47
	);
	port
	(
		--inputs
		IN1			:	in		std_logic_vector(exp_bits+man_bits downto 0);
		READY			:	in		std_logic;
		EXCEPTION_IN		:	in		std_logic;
		--outputs
		OUT1			:	out		std_logic_vector(exp_bits+man_bits+1 downto 0)	:=	(others=>'0');
		DONE			:	out		std_logic	:=	'0';
		EXCEPTION_OUT		:	out		std_logic	:=	'0'
	);
end denorm;

----------------------------------------------------------
--               Denormalization Module                 --
----------------------------------------------------------
architecture denorm_arch of denorm is
	signal	s_old		:		std_logic	:=	'0';
	signal	s_new		:		std_logic	:=	'0';
	signal	e_old		:		std_logic_vector(exp_bits-1 downto 0)	:=	(others=>'0');
	signal	e_new		:		std_logic_vector(exp_bits-1 downto 0)	:=	(others=>'0');
	signal	f_old		:		std_logic_vector(man_bits-1 downto 0)	:=	(others=>'0');
	signal	f_new		:		std_logic_vector(man_bits downto 0)		:=	(others=>'0');
	signal	exp_or		:		std_logic	:=	'0';

begin
	--connect input signals
	s_old		<=	IN1(man_bits+exp_bits);
	e_old		<=	IN1(man_bits+exp_bits-1 downto man_bits);
	f_old		<=	IN1(man_bits-1 downto 0);
	
	--look for all zeros
	gate	:	parameterized_or_gate
		generic map
		(
			bits	=>	exp_bits
		)
		port map
		(
			A	=>	e_old,
			O	=>	exp_or
		);

	--internal connections
	s_new				<=	s_old;
	e_new				<=	e_old;
	f_new(man_bits-1 downto 0)	<=	f_old;
	f_new(man_bits)			<=	exp_or;    -- insert 1 b/w mantissa and exponent

	--connect output signals
	OUT1((exp_bits+man_bits)+1)			<=	s_new;
	OUT1(exp_bits+man_bits downto man_bits+1)	<=	e_new;
	OUT1(man_bits downto 0)				<=	f_new;

	--done signal
	DONE	<=	READY;
	--exception signal
	EXCEPTION_OUT	<=	EXCEPTION_IN;

end denorm_arch; -- end of architecture

