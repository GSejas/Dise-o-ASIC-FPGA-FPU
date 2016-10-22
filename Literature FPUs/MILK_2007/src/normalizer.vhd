-----------------------------------------------------------------------------------------------------------
--
--				                   DENORMALS HANDLER
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

entity normalizer is
    port( denormal_operand    : in  std_logic_vector(word_width-2 downto 0);
          normalized_mantissa : out std_logic_vector(23 downto 0);
          normalized_exponent : out std_logic_vector(8 downto 0)
        ); 
end normalizer;

-------------------------------------------------------------------------------
architecture rtl of normalizer is
    
    signal operand              : std_logic_vector(word_width-2 downto 0);
    signal mantissa             : std_logic_vector(23 downto 0);
    signal exponent             : std_logic_vector(8 downto 0);
    signal operand_exp          : std_logic_vector(7 downto 0);

    begin

        operand_exp <= operand(30 downto 23);
        operand     <= denormal_operand;

        normalized_mantissa <= mantissa;
        normalized_exponent <= exponent;
        
-------------------------------------------------------------------------------
-- operand prenormalization
-------------------------------------------------------------------------------

        process(operand, operand_exp) 
                
        begin
            if ( (operand_exp = "00000000") and (operand(22 downto 0) /= Conv_std_logic_vector(0,23)) ) then
                    -- DENORMALIZED operand_a
                    if ( operand(22)='1' ) then
                                mantissa<= (operand(22 downto 0) & '0');            
                                exponent<= conv_std_logic_vector( 128,9 );  -- newly biased adjusted exponent 
                    elsif ( (operand(22)='0') and (operand(21)='1') ) then
                                mantissa<= (operand(21 downto 0) & "00");            
                                exponent<= conv_std_logic_vector( 127,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 21)="00") and (operand(20)='1') ) then
                                mantissa<= (operand(20 downto 0) & "000");            
                                exponent<= conv_std_logic_vector( 126,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 20)="000") and (operand(19)='1') ) then
                                mantissa<= (operand(19 downto 0) & "0000");            
                                exponent<= conv_std_logic_vector( 125,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 19)="0000") and (operand(18)='1') ) then
                                mantissa<= (operand(18 downto 0) & "00000");            
                                exponent<= conv_std_logic_vector( 124,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 18)="00000") and (operand(17)='1') ) then
                                mantissa<= (operand(17 downto 0) & "000000");            
                                exponent<= conv_std_logic_vector( 123,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 17)="000000") and (operand(16)='1') ) then
                                mantissa<= (operand(16 downto 0) & "0000000");            
                                exponent<= conv_std_logic_vector( 122,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 16)="0000000") and (operand(15)='1') ) then
                                mantissa<= (operand(15 downto 0) & "00000000");            
                                exponent<= conv_std_logic_vector( 121,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 15)="00000000") and (operand(14)='1') ) then
                                mantissa<= (operand(14 downto 0) & "000000000");            
                                exponent<= conv_std_logic_vector( 120,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 14)="000000000") and (operand(13)='1') ) then
                                mantissa<= (operand(13 downto 0) & "0000000000");            
                                exponent<= conv_std_logic_vector( 119,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 13)="0000000000") and (operand(12)='1') ) then
                                mantissa<= (operand(12 downto 0) & "00000000000");            
                                exponent<= conv_std_logic_vector( 118,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 12)="00000000000") and (operand(11)='1') ) then
                                mantissa<= (operand(11 downto 0) & "000000000000");            
                                exponent<= conv_std_logic_vector( 117,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 11)="000000000000") and (operand(10)='1') ) then
                                mantissa<= (operand(10 downto 0) & "0000000000000");            
                                exponent<= conv_std_logic_vector( 116,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 10)="0000000000000") and (operand(9)='1') ) then
                                mantissa<= (operand(9 downto 0) & "00000000000000");            
                                exponent<= conv_std_logic_vector( 115,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 9)="00000000000000") and (operand(8)='1') ) then
                                mantissa<= (operand(8 downto 0) & "000000000000000");            
                                exponent<= conv_std_logic_vector( 114,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 8)="000000000000000") and (operand(7)='1') ) then
                                mantissa<= (operand(7 downto 0) & "0000000000000000");            
                                exponent<= conv_std_logic_vector( 113,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 7)="0000000000000000") and (operand(6)='1') ) then
                                mantissa<= (operand(6 downto 0) & "00000000000000000");            
                                exponent<= conv_std_logic_vector( 112,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 6)="00000000000000000") and (operand(5)='1') ) then
                                mantissa<= (operand(5 downto 0) & "000000000000000000");            
                                exponent<= conv_std_logic_vector( 111,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 5)="000000000000000000") and (operand(4)='1') ) then
                                mantissa<= (operand(4 downto 0) & "0000000000000000000");            
                                exponent<= conv_std_logic_vector( 110,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 4)="0000000000000000000") and (operand(3)='1') ) then
                                mantissa<= (operand(3 downto 0) & "00000000000000000000");            
                                exponent<= conv_std_logic_vector( 109,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 3)="00000000000000000000") and (operand(2)='1') ) then
                                mantissa<= (operand(2 downto 0) & "000000000000000000000");            
                                exponent<= conv_std_logic_vector( 108,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 2)="000000000000000000000") and (operand(1)='1') ) then
                                mantissa<= (operand(1 downto 0) & "0000000000000000000000");            
                                exponent<= conv_std_logic_vector( 107,9 );  -- newly biased adjusted exponent
                    elsif ( (operand(22 downto 1)="0000000000000000000000") and (operand(0)='1') ) then
                                mantissa<= (operand(0) & "00000000000000000000000");            
                                exponent<= conv_std_logic_vector( 106,9 );  -- newly biased adjusted exponent
                    else
                                mantissa<= conv_std_logic_vector(0,24);      
                                exponent<= conv_std_logic_vector(0,9);  -- zero
                    end if;
            else
                    -- normalized operand_a
                    mantissa <= ('1' & operand(22 downto 0) );
                    -- exponent <= ( unsigned(extended_operand_exp) + unsigned(biasing_value) );  -- newly biased exponent; biasing_value = 128
                    exponent(8) <= operand_exp(7);
                    exponent(7) <= not (operand_exp(7));
                    exponent(6) <= operand_exp(6);
                    exponent(5) <= operand_exp(5);
                    exponent(4) <= operand_exp(4);
                    exponent(3) <= operand_exp(3);
                    exponent(2) <= operand_exp(2);
                    exponent(1) <= operand_exp(1);
                    exponent(0) <= operand_exp(0);
            end if;

        end process;

    end rtl;
