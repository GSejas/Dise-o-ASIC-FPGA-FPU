--======================================================--
--                                                      --
--  NORTHEASTERN UNIVERSITY                             --
--  DEPARTMENT OF ELECTRICAL AND COMPUTER ENGINEERING   --
--  RAPID PROTOTYPING LABORATORY                        --
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
--  DATE		 | 29 Sep. 2013						    --
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
--            Parameterized Absolute Value              --
----------------------------------------------------------
entity parameterized_absolute_value is
	generic
	(
		bits			: integer:=	0
	);
	port
	(
		--inputs
		IN1			: in	std_logic_vector(bits-1 downto 0);
		--outputs
		EXC			: out	std_logic:=	'0';
		OUT1			: out	std_logic_vector(bits-1 downto 0):=	(others=>'0')
	);
end parameterized_absolute_value;

----------------------------------------------------------
--            Parameterized Absolute Value              --
----------------------------------------------------------
architecture parameterized_absolute_value_arch of parameterized_absolute_value is
	signal	not_in1		: std_logic_vector(bits-1 downto 0)	:=	(others=>'0');
	signal	sum			: std_logic_vector(bits-1 downto 0)	:=	(others=>'0');
	signal	one			: std_logic_vector(bits-1 downto 0)	:=	(others=>'0');
	signal	cout			: std_logic	:=	'0';
begin
	--set up signals
	one(0)					<=	'1';
	one(bits-1 downto 1)	<=	(others=>'0');
	not_in1					<=	NOT(IN1);

	--adder
	adder	:	parameterized_adder
	generic map
	(
		bits	=>	bits
	)
	port map
	(
		A			=>	not_in1,
		B			=>	one,
		CIN		=>	'0',
		S			=>	sum,
		COUT		=>	cout
	);

	--AND
	EXC	<=	IN1(bits-1) AND sum(bits-1);
	
	--output mux
	mux	:	parameterized_mux
		generic map
		(
			bits	=>	bits
		)
		port map
		(
			A			=>	sum,
			B			=>	IN1,
			S			=>	IN1(bits-1),
			O			=>	OUT1
		);
end parameterized_absolute_value_arch; -- end of architecture
