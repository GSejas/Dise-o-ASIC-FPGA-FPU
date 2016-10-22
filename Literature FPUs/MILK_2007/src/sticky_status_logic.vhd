-----------------------------------------------------------------------------------------------------------
--
--						    STICKY STATUS LOGIC
--
-- Once some exceptions occur, corresponding bits are set in the status register. This logic keeps set the
-- status register's flag-field bits until they are modified by user.
--
-- Created by Claudio Brunelli, 2004
--
-----------------------------------------------------------------------------------------------------------

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


entity sticky_status_logic is
    port( restore        : in std_logic;
	  exc_in, status : in std_logic_vector(flags_amount-1 downto 0);
  	  sticky_status  : out std_logic_vector(flags_amount-1 downto 0)  );
end sticky_status_logic ;


-- hds interface_end
architecture rtl of sticky_status_logic is

    signal sreg_in, selection : std_logic_vector(flags_amount-1 downto 0);

    begin
        
	  process (status, restore)
	      begin
		    for i in 0 to (flags_amount-1) loop
		        selection(i) <= ( status(i) and (not restore) );
                end loop;
  	  end process;

        DOUBLEWR_MUX    : SIMPLE_MUX_2 port map (in_a => exc_in(0), in_b => status(0), sel => selection(0),
								output => sreg_in(0));
	    
        OVERFLOW_MUX    : SIMPLE_MUX_2 port map (in_a => exc_in(1), in_b => status(1), sel => selection(1),
								output => sreg_in(1));

        UNDERFLOW_MUX   : SIMPLE_MUX_2 port map (in_a => exc_in(2), in_b => status(2), sel => selection(2),
								output => sreg_in(2));

        INEXACT_MUX     : SIMPLE_MUX_2 port map (in_a => exc_in(3), in_b => status(3), sel => selection(3),
								output => sreg_in(3));

        INVALID_MUX     : SIMPLE_MUX_2 port map (in_a => exc_in(4), in_b => status(4), sel => selection(4),
							      output => sreg_in(4));        
   
        DIV_BY_ZERO_MUX : SIMPLE_MUX_2 port map (in_a => exc_in(5), in_b => status(5), sel => selection(5),
							      output => sreg_in(5));        

        UNKN_INSTR_MUX  : SIMPLE_MUX_2 port map (in_a => exc_in(6), in_b => status(6), sel => selection(6),
							      output => sreg_in(6));        

        sticky_status <= sreg_in;

end rtl;			
