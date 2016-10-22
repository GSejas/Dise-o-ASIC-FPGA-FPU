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
--                Parameterized adder                   --
----------------------------------------------------------
entity parameterized_adder is
	generic
	(
		bits			:	integer		:=	0
	);
	port
	(
		--inputs
		A			:	in	std_logic_vector(bits-1 downto 0);
		B			:	in	std_logic_vector(bits-1 downto 0);
		CIN			:	in	std_logic;
		--outputs
		S			:	out	std_logic_vector(bits-1 downto 0)	:=	(others=>'0');
		COUT			:	out	std_logic	:=	'0'
	);
end parameterized_adder;

----------------------------------------------------------
--           Haiqian's parameterized_adder              --
--           Using operators                            --
----------------------------------------------------------
architecture parameterized_adder_arch of parameterized_adder is
--	--SIGNALS
	signal	carry	:	std_logic_vector(bits downto 0)	:=	(others=>'0');
	signal	A_ext	:	std_logic_vector(bits downto 0);
	signal	B_ext	:	std_logic_vector(bits downto 0);
begin
	A_ext(bits)	<=	'0';
	b_ext(bits)	<=	'0';
	A_ext(bits-1 downto 0)	<=	A;
	b_ext(bits-1 downto 0)	<=	B;
	carry			<=	A_ext	+	B_ext	+	CIN;
	S			<=	carry(bits-1 downto 0);
	COUT			<=	carry(bits);
end parameterized_adder_arch; -- end of architecture
