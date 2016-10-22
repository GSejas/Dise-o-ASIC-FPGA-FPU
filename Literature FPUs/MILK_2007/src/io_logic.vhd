---------------------------------------------------------------------------------------------
--
--						     I/O LOGIC
--
-- It's a block which rules INPUT/OUTPUT operations between the core and the coprocessor
-- providing an interface between the bi-directional data bus (dedicated to communications  
-- between the core and (up to) 4 coprocessors) and coprocessor internal data buses
--
-- Created by Claudio Brunelli, 2004
--
---------------------------------------------------------------------------------------------

--Copyright (c) 2004, Tampere University of Technology.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification,
--are permitted provided that the following conditions are met:
--*	Redistributions of source code must retain the above copyright notice,
--	this list of conditions and the following disclaimer.
--*	Redistributions in binary form must reproduce the above copyright notice,
--	this list of conditions and the following disclaimer in the documentation
--	and/or other materials provided with the distribution.
--*	Neither the name of Tampere University of Technology nor the names of its
--	contributors may be used to endorse or promote products derived from this
--	software without specific prior written permission.

--THIS HARDWARE DESCRIPTION OR SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
--CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
--LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND NONINFRINGEMENT AND
--FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
--OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
--EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
--PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
--BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
--CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
--ARISING IN ANY WAY OUT OF THE USE OF THIS HARDWARE DESCRIPTION OR SOFTWARE, EVEN
--IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.cop_definitions.all;
use work.cop_components.all;

entity IO_logic is
    port( rd, enable, wr           : in std_logic;
          regtype_sel              : in std_logic_vector(2 downto 0);
          compare_out              : in std_logic_vector(3 downto 0);
          data_out                 : in std_logic_vector(word_width-1 downto 0);
          sreg_out                 : in std_logic_vector(sreg_width-1 downto 0);
	  gated_write, gated_read,
          creg_we, sreg_we         : out std_logic;
	  data_in                  : out std_logic_vector(word_width-1 downto 0);
          
          incoming_data            : in std_logic_vector(word_width-1 downto 0);
	  outgoing_data            : out std_logic_vector(word_width-1 downto 0));
end IO_logic;

---------------------------------------------------------------------------------
architecture rtl of IO_logic is

    signal wr_enabled, rd_enabled, 
           ctrl_reg, status_reg , compare_reg   : std_logic;

    begin
 
------------------------------------------------------------
-- MUX with output enable command used for
-- result/status selection

        process(rd_enabled,status_reg,data_out,sreg_out,compare_out,compare_reg)
        begin
            if (rd_enabled='0') then
                    outgoing_data <= (others => 'Z');
            else
                    if    (compare_reg ='1') then
                            outgoing_data <= EXT('0' & compare_out,word_width);
                    elsif (status_reg='1')   then
                            outgoing_data <= EXT('0' & compare_out & sreg_out(sreg_width-1 downto 0),word_width);
                    else 
                            outgoing_data <= data_out;
                    end if;
            end if;
        end process;

------------------------------------------------------------

        ctrl_reg    <= ( (regtype_sel(2)) and (not(regtype_sel(1))) and (not(regtype_sel(0)))    );  -- control register is being indexed
        status_reg  <= ( (regtype_sel(2)) and (not(regtype_sel(1))) and     (regtype_sel(0))     );  -- status register is being indexed
        compare_reg <= ( (regtype_sel(2)) and     (regtype_sel(1))  and (not(regtype_sel(0)))    );  -- compare flag is being indexed 

        rd_enabled <= (rd and enable);  -- Coffee is reading from this cop
        wr_enabled <= (wr and enable);  -- Coffee is writing to this cop

        creg_we    <= (wr_enabled and ctrl_reg);    -- Coffee is writing to this cop's control register
        sreg_we    <= (wr_enabled and status_reg);  -- Coffee is writing to this cop's status register (FLAGS field)

		gated_write <= wr_enabled;
		gated_read  <= rd_enabled;

        data_in <= incoming_data;
 
---------------------------------------------------------------------------------       
end rtl;






