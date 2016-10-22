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
--              Parameterized OR gate                   --
----------------------------------------------------------
entity parameterized_or_gate is
	generic
	(
		bits			:	integer						:=	9
	);
	port
	(
		--inputs
		A			:	in	std_logic_vector(bits-1 downto 0);
		--outputs
		O			:	out	std_logic	:=	'0'
	);
end parameterized_or_gate;

----------------------------------------------------------
--              Parameterized OR gate                   --
----------------------------------------------------------
architecture parameterized_or_gate_arch of parameterized_or_gate is
	--SIGNALS
	signal	im	:	std_logic_vector(2*ceil2(bits)-2 downto 0)	:=	(others=>'0');
begin
	--connect inputs
	connect_input	:	for j in 0 to bits-1 generate
		im(j)	<=	A(j);
	end generate;--inputs
	blank_inputs	:	if(ceil2(bits)/=bits) generate
		connect_low	:	for k in bits to ceil2(bits)-1 generate
			im(k)	<=	'0';
		end generate;--connect low state
	end generate;--zeros on input
	--generate tree of gates
	or_gates:for g in 0 to ceil2(bits)-2 generate
		im(g+ceil2(bits))	<=	im(g*2)	OR	im(g*2+1);
	end generate; --g
	--connect output
	O	<=	im(im'high);
end parameterized_or_gate_arch; -- end of architecture
