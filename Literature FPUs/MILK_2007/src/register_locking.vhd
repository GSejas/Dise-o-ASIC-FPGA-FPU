------------------------------------------------------------------------
--
-- STALL MILK COPROCESSOR
--
-- Created by D.Rossi, modified by C.Brunelli, 2004
--
------------------------------------------------------------------------
-- FSM used to detect program flow unconsistencies due to
-- long instructions performed by MILK coprocessor:
-- MILK instructions can have up to two writeback channels. Of course,
-- processor instructions following the Milkop can not use these writeback
-- registers as sources until the Milkop completes.
-- In case a Processor instructions needs them, the processor must be
-- stalled until the writeback is actually performed.

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
  use work.cop_components.all;
  use work.cop_definitions.all;



entity Register_locking is
  
  port ( clk,reset                : in Std_logic;
         enable                   : in Std_logic;
         cop_we                   : in Std_logic;  -- active high
         cop_rd_addr              : in rf_addr;  -- destination register (while in pipeline decode stage)
         cop_rd_enable            : in Std_logic;  -- read enable "rcop" active high
         r_index                  : in Std_logic_vector(3 downto 0);  --source register of instruction "rcop"
         cop_rs1_addr             : in rf_addr;  -- source register 1 of coprocessor instructions
         cop_rs2_addr             : in rf_addr;  -- source register 2 of coprocessor instructions
         
         cop_wb_enable_1          : in Std_logic;  -- write back enable (active high)
         cop_wb_addr_1            : in rf_addr;  -- destination register  (while in pipeline decode writeback)
         cop_wb_enable_2          : in Std_logic;  
         cop_wb_addr_2            : in rf_addr;
         cop_wb_enable_3          : in Std_logic;  
         cop_wb_addr_3            : in rf_addr;
         cop_wb_enable_4          : in Std_logic;  
         cop_wb_addr_4            : in rf_addr;
         cop_wb_enable_5          : in Std_logic;  
         cop_wb_addr_5            : in rf_addr;
         cop_wb_enable_6          : in Std_logic;  
         cop_wb_addr_6            : in rf_addr;
         cop_wb_enable_7          : in Std_logic;  
         cop_wb_addr_7            : in rf_addr;
         cop_wb_enable_8          : in Std_logic;  
         cop_wb_addr_8            : in rf_addr;
         cop_wb_enable_9          : in Std_logic;  
         cop_wb_addr_9            : in rf_addr;
         
         lock_micro               : out Std_logic; -- active low
		 creg_rd				  : in rf_addr;
		 creg_opcode              : in Std_logic_vector(cop_opcode_width-1 downto 0);
         next_lock_vector_p       : out Std_logic_vector(RF_width-1 downto 0) );

end Register_locking;

architecture STRUCTURAL of Register_locking is

signal lock_vector,next_lock_vector      : Std_logic_vector(RF_width-1 downto 0);  
signal inst_we                           : Std_logic;
signal cop_rs_addr                       : rf_addr;
signal lo                                : Std_logic;


begin  -- STRUCTURAL

  next_lock_vector_p <= next_lock_vector;
  cop_rs_addr <= r_index(2 downto 0);

  LOCK_REGISTER : data_register
    generic map ( reg_width => RF_width )
    port map (clk => clk, reset => reset, data_in => next_lock_vector, data_out => lock_vector);

  WE_LOGIC:
    process(cop_we,r_index)
      begin
        if r_index(3)='1' then
          inst_we <= cop_we;
        else
          inst_we <='0';
        end if;
    end process;
        
-------------------------------------------------------------------------------
-- Lock Vector Generation
-------------------------------------------------------------------------------

  LOCK_CONTROL:
    process(lock_vector, enable,creg_rd,creg_opcode)
    begin
       for i in 0 to 7 loop
         
          if (enable = '1') then

              if (i=Conv_integer( unsigned(creg_rd) ) and (creg_opcode /= nop) and (creg_opcode(cop_opcode_width-1 downto cop_opcode_width-2) /= "11") )  then
                   next_lock_vector(i) <= '1';  
              elsif (i=Conv_integer( unsigned(cop_wb_addr_1) ) and (cop_wb_enable_1='1') ) then
                   next_lock_vector(i) <= '0';
              elsif (i=Conv_integer( unsigned(cop_wb_addr_2) ) and (cop_wb_enable_2='1') ) then
                   next_lock_vector(i) <= '0';
              elsif (i=Conv_integer( unsigned(cop_wb_addr_3) ) and (cop_wb_enable_3='1') ) then
                   next_lock_vector(i) <= '0';
              elsif (i=Conv_integer( unsigned(cop_wb_addr_4) ) and (cop_wb_enable_4='1') ) then
                   next_lock_vector(i) <= '0';
              elsif (i=Conv_integer( unsigned(cop_wb_addr_5) ) and (cop_wb_enable_5='1') ) then
                   next_lock_vector(i) <= '0';
              elsif (i=Conv_integer( unsigned(cop_wb_addr_6) ) and (cop_wb_enable_6='1') ) then
                   next_lock_vector(i) <= '0';
              elsif (i=Conv_integer( unsigned(cop_wb_addr_7) ) and (cop_wb_enable_7='1') ) then
                   next_lock_vector(i) <= '0';
              elsif (i=Conv_integer( unsigned(cop_wb_addr_8) ) and (cop_wb_enable_8='1') ) then
                   next_lock_vector(i) <= '0';
              elsif (i=Conv_integer( unsigned(cop_wb_addr_9) ) and (cop_wb_enable_9='1') ) then
                   next_lock_vector(i) <= '0';
              else
                   next_lock_vector(i) <= lock_vector(i);
              end if;

          else

              next_lock_vector(i) <= '0';

          end if;

       end loop; 
    end process; 

-------------------------------------------------------------------------------
-- Stall Detection Unit
-------------------------------------------------------------------------------
  Micro_Stall:
  process(cop_rs1_addr,cop_rs2_addr,cop_rs_addr,next_lock_vector,inst_we,cop_rd_enable,
          cop_wb_addr_1,cop_wb_enable_1,cop_wb_addr_2,cop_wb_enable_2,
          cop_wb_addr_3,cop_wb_enable_3,cop_wb_addr_4,cop_wb_enable_4,
          cop_wb_addr_5,cop_wb_enable_5,cop_wb_addr_6,cop_wb_enable_6,
          cop_wb_addr_7,cop_wb_enable_7,cop_wb_addr_8,cop_wb_enable_8,
          cop_wb_addr_9,cop_wb_enable_9)

  begin

    if ( (next_lock_vector(Conv_integer(unsigned(cop_rs1_addr)))='1') and (inst_we='1') ) or
       ( (next_lock_vector(Conv_integer(unsigned(cop_rs2_addr)))='1') and (inst_we='1') ) or
       ( (next_lock_vector(Conv_integer(unsigned(cop_rs_addr)))='1') and (cop_rd_enable='1') ) then

            lock_micro <= '0';
    else
            lock_micro <= '1';
    end if;

  end process;
  
end STRUCTURAL;


