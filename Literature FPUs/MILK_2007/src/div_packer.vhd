-----------------------------------------------------------------------------------------------------------
--
--				         INTERNAL RESULTS PACKING (AND ROUNDING) LOGIC
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

entity div_packer is
    port( internal_exponent      : in std_logic_vector(9 downto 0);
          internal_mantissa      : in std_logic_vector(quotient_width-1 downto 0);
          internal_remainder     : in std_logic_vector(division_rem_width downto 0);
          packed_exponent        : out std_logic_vector(7 downto 0);
          packed_fractional_part : out std_logic_vector(22 downto 0);
          exc_overflow           : out std_logic;
          exc_underflow          : out std_logic;
          exc_inexact            : out std_logic
        ); 
end div_packer;

-------------------------------------------------------------------------------
architecture rtl of div_packer is
    
    signal internal_e            : std_logic_vector(9 downto 0);
    signal internal_m            : std_logic_vector(quotient_width-1 downto 0);
    signal internal_r            : std_logic_vector(division_rem_width downto 0);
    signal exp                   : std_logic_vector(9 downto 0);
    signal m                     : std_logic_vector(23 downto 0);
    signal rounded_m             : std_logic_vector(24 downto 0);
    signal x                     : std_logic_vector(7 downto 0);
    signal f                     : std_logic_vector(22 downto 0);
    signal sgl_exc_overflow      : std_logic;
    signal sgl_exc_underflow     : std_logic;
    signal result_inexact        : std_logic;
    signal rounding_inexact      : std_logic;
    signal sgl_inexact_operation : std_logic; 

    begin

            internal_e <= internal_exponent;
            internal_m <= internal_mantissa;
            internal_r <= internal_remainder;
            packed_exponent        <= x;
            packed_fractional_part <= f;
            exc_overflow  <= sgl_exc_overflow;
            exc_underflow <= sgl_exc_underflow;
            exc_inexact   <= sgl_inexact_operation;
            

-- special result detection and result packing

    DIV_RESULT_GEN: process(internal_e, internal_m, internal_r, rounded_m, exp, m)
    variable d : integer;
    begin

----------------------------------------------------------------------------
-- special cases

        if ( conv_integer(unsigned(internal_e)) > 127 + 511) then   
                -- overflow                     
                x <= (others => '1');  -- Infinity 
                f <= (others => '0');
                sgl_exc_overflow <= '1'; sgl_exc_underflow <= '0'; result_inexact   <= '1'; rounding_inexact <= '0'; 
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (conv_integer(unsigned(internal_e)) = 127 + 511) and (internal_m(24 downto 0) = "1111111111111111111111111") ) then
                -- normalized --> overflow limit zone
                        x <= (others => '1');  -- Infinity 
                        f <= (others => '0');
                        sgl_exc_overflow <= '1'; sgl_exc_underflow <= '0'; result_inexact   <= '1'; rounding_inexact <= '0';
                        rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( conv_integer(unsigned(internal_e)) = -127 + 511) then  
                -- normalized/denormalized limit zone
                if ( internal_m(24 downto 1) = "111111111111111111111111" ) then
                        -- round to min normalized number: 2^(-126) 
                        x <= "00000001";
                        f <= conv_std_logic_vector(0,23);
                        result_inexact <= '1';
                else 
                        -- trunc to denormalized number (exp = -126)
                        d := conv_integer(unsigned(internal_m(24 downto 2)));
                        x <= (others => '0');
                        if ( (internal_m(1 downto 0) = "00") and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                                f <= conv_std_logic_vector(d,23);
                                result_inexact <= '0';
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(1)='0') or ((internal_m(2)='0') and (internal_m(1)='1') and (internal_m(0)='0') and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then 
                                f <= conv_std_logic_vector(d,23);
                                result_inexact <= '1';
                        else 
                                f <= conv_std_logic_vector(d+1,23);
                                result_inexact <= '1';
                        end if;
                end if;
                sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( conv_integer(unsigned(internal_e)) = -150 + 511) then  
                -- denormalized --> underflow limit zone
                x <= (others => '0'); 
                if  ( (internal_m(23 downto 0) = conv_std_logic_vector(0,24)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        -- underflow
                        f <= (others => '0');  -- ZERO
                        sgl_exc_underflow <= '1'; result_inexact   <= '1';
                else
                        -- rounding to min denormal number: 2^(-149)
                        f <= "00000000000000000000001";
                        sgl_exc_underflow <= '0'; result_inexact   <= '1'; 
                end if;
                sgl_exc_overflow <= '0'; rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');
 
        elsif ( Conv_integer(unsigned(internal_e)) < -150 + 511) then  
                -- underflow
                x <= (others => '0');
                f <= (others => '0');  -- ZERO
                sgl_exc_overflow <= '0'; sgl_exc_underflow <= '1'; result_inexact   <= '1'; rounding_inexact <= '0'; 
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

----------------------------------------------------------------------------

-- result is  always converted into a single precision denormalized number

        elsif ( (Conv_integer(unsigned(internal_e))= -128 + 511) )then
                d := Conv_integer(  unsigned(internal_m(24 downto 3)) );
                x <= (others => '0');
                if ( (internal_m(2 downto 0) = conv_std_logic_vector(0,3)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '0'; 
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(2)='0') or ((internal_m(3)='0') and (internal_m(2)='1') and (internal_m(1 downto 0)=conv_std_logic_vector(0,2)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -129 + 511) )then
                d := Conv_integer(  unsigned(internal_m(24 downto 4)) );
                x <= (others => '0');
                        if (internal_m(3 downto 0) = conv_std_logic_vector(0,4) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(3)='0') or ((internal_m(4)='0') and (internal_m(3)='1') and (internal_m(2 downto 0)=conv_std_logic_vector(0,3)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -130 + 511) )then
                d := Conv_integer(  unsigned(internal_m(24 downto 5)) );
                x <= (others => '0');
                if ( (internal_m(4 downto 0) = conv_std_logic_vector(0,5)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(4)='0') or ((internal_m(5)='0') and (internal_m(4)='1') and (internal_m(3 downto 0)=conv_std_logic_vector(0,4)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
               end if;
               sgl_exc_overflow <= '0';
               rounding_inexact <= '0';
               rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');
                 
        elsif ( (Conv_integer(unsigned(internal_e))= -131 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 6)) );
                x <= (others => '0');
                if ( (internal_m(5 downto 0) = conv_std_logic_vector(0,6)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0'; 
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(5)='0') or ((internal_m(6)='0') and (internal_m(5)='1') and (internal_m(4 downto 0)=conv_std_logic_vector(0,5)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -132 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 7)) );
                x <= (others => '0');
                if ( (internal_m(6 downto 0) = conv_std_logic_vector(0,7)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                 ----------------------------------------------------------
                 -- ROUND TO NEAREST
                 elsif ( (internal_m(6)='0') or ((internal_m(7)='0') and (internal_m(6)='1') and (internal_m(5 downto 0)=conv_std_logic_vector(0,6)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                 else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                 end if;  
                 sgl_exc_overflow <= '0';
                 rounding_inexact <= '0';
                 rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -133 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 8)) );
                x <= (others => '0');
                if ( (internal_m(7 downto 0) = conv_std_logic_vector(0,8)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(7)='0') or ((internal_m(8)='0') and (internal_m(7)='1') and (internal_m(6 downto 0)=conv_std_logic_vector(0,7)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -134 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 9)) );
                x <= (others => '0');
                if ( (internal_m(8 downto 0) = conv_std_logic_vector(0,9)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(8)='0') or ((internal_m(9)='0') and (internal_m(8)='1') and (internal_m(7 downto 0)=conv_std_logic_vector(0,8)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');
                
        elsif ( (Conv_integer(unsigned(internal_e))= -135 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 10)) );
                x <= (others => '0');
                if ( (internal_m(9 downto 0) = conv_std_logic_vector(0,10)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(9)='0') or ((internal_m(10)='0') and (internal_m(9)='1') and (internal_m(8 downto 0)=conv_std_logic_vector(0,9)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -136 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 11)) );
                x <= (others => '0');
                if ( (internal_m(10 downto 0) = conv_std_logic_vector(0,11)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(10)='0') or ((internal_m(11)='0') and (internal_m(10)='1') and (internal_m(9 downto 0)=conv_std_logic_vector(0,10)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');
 
        elsif ( (Conv_integer(unsigned(internal_e))= -137 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 12)) );
                x <= (others => '0');
                if ( (internal_m(11 downto 0) = conv_std_logic_vector(0,12)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(11)='0') or ((internal_m(12)='0') and (internal_m(11)='1') and (internal_m(10 downto 0)=conv_std_logic_vector(0,11)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -138 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 13)) );
                x <= (others => '0');
                if ( (internal_m(12 downto 0) = conv_std_logic_vector(0,13)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(12)='0') or ((internal_m(13)='0') and (internal_m(12)='1') and (internal_m(11 downto 0)=conv_std_logic_vector(0,12)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -139 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 12)) );
                x <= (others => '0');
                if ( (internal_m(13 downto 0) = conv_std_logic_vector(0,14)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(13)='0') or ((internal_m(14)='0') and (internal_m(13)='1') and (internal_m(12 downto 0)=conv_std_logic_vector(0,13)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1'; 
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -140 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 13)) );
                x <= (others => '0');
                if ( (internal_m(14 downto 0) = conv_std_logic_vector(0,15)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(14)='0') or ((internal_m(15)='0') and (internal_m(14)='1') and (internal_m(13 downto 0)=conv_std_logic_vector(0,14)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -141 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 16)) );
                x <= (others => '0');
                if ( (internal_m(15 downto 0) = conv_std_logic_vector(0,16)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(15)='0') or ((internal_m(16)='0') and (internal_m(15)='1') and (internal_m(14 downto 0)=conv_std_logic_vector(0,15)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -142 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 17)) );
                x <= (others => '0');
                if ( (internal_m(16 downto 0) = conv_std_logic_vector(0,17)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(16)='0') or ((internal_m(17)='0') and (internal_m(16)='1') and (internal_m(15 downto 0)=conv_std_logic_vector(0,16)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -143 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 18)) );
                x <= (others => '0');
                if ( (internal_m(17 downto 0) = conv_std_logic_vector(0,18)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(17)='0') or ((internal_m(18)='0') and (internal_m(17)='1') and (internal_m(16 downto 0)=conv_std_logic_vector(0,17)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -144 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 19)) );
                x <= (others => '0');
                if ( (internal_m(18 downto 0) = conv_std_logic_vector(0,19)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(18)='0') or ((internal_m(19)='0') and (internal_m(18)='1') and (internal_m(17 downto 0)=conv_std_logic_vector(0,18)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23); 
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -145 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 20)) );
                x <= (others => '0');
                if ( (internal_m(19 downto 0) = conv_std_logic_vector(0,20)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(19)='0') or ((internal_m(20)='0') and (internal_m(19)='1') and (internal_m(18 downto 0)=conv_std_logic_vector(0,19)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1'; 
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -146 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 21)) );
                x <= (others => '0');
                if ( (internal_m(20 downto 0) = conv_std_logic_vector(0,21)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(20)='0') or ((internal_m(21)='0') and (internal_m(20)='1') and (internal_m(19 downto 0)=conv_std_logic_vector(0,20)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0'; 
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -147 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 22)) );
                x <= (others => '0');
                        if ( (internal_m(21 downto 0) = conv_std_logic_vector(0,22)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '0';
                                sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(21)='0') or ((internal_m(22)='0') and (internal_m(21)='1') and (internal_m(20 downto 0)=conv_std_logic_vector(0,21)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -148 + 511) ) then
                d := Conv_integer(  unsigned(internal_m(24 downto 23)) );
                x <= (others => '0');
                if ( (internal_m(22 downto 0) = conv_std_logic_vector(0,23)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif ( (internal_m(22)='0') or ((internal_m(23)='0') and (internal_m(22)='1') and (internal_m(21 downto 0)=conv_std_logic_vector(0,22)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1))) ) then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                end if;  
                sgl_exc_overflow <= '0';
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (Conv_integer(unsigned(internal_e))= -149 + 511) ) then
                d := Conv_integer( internal_m(24) );
                x <= (others => '0');
                if ( (internal_m(23 downto 0) = conv_std_logic_vector(0,24)) and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        f <= Conv_std_logic_vector(d,23); 
                        result_inexact   <= '0';
                        sgl_exc_underflow <= '0';
                ----------------------------------------------------------
                -- ROUND TO NEAREST
                elsif (internal_m(23)='0') then  
                        f <= Conv_std_logic_vector(d,23);
                        result_inexact   <= '1';
                        sgl_exc_underflow <= '0';
                else 
                        f <= Conv_std_logic_vector(d+1,23);
                        result_inexact   <= '1';                      
                        sgl_exc_underflow <= '0';
                end if;
                sgl_exc_overflow <= '0';     
                rounding_inexact <= '0';
                rounded_m <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

----------------------------------------------------------------------------

-- result is  always converted into a single precision normalized number

-- rounding

        elsif ( (conv_integer(unsigned(internal_e)) < 128 + 511) and (conv_integer(unsigned(internal_e)) > -127 + 511) ) then

                if ( (internal_m(0) = '0') and (internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
                        -- only one exact case!
                        rounded_m <= ( '0' & internal_m(24 downto 1));
                        rounding_inexact <= '0';
                elsif ( (internal_m(0) = '0') or (internal_m(1) = '0' and internal_m(0) = '1' and internal_r=conv_std_logic_vector(0,division_rem_width+1)) ) then
	                  rounded_m <= ( '0' & internal_m(24 downto 1));
                        rounding_inexact <= '1';
                else 									                   
                        rounded_m<= unsigned( ('0' & internal_m(24 downto 1)) ) + conv_unsigned(1,25);
                        rounding_inexact <= '1';
                end if;
 
                ----------------------------------------------------------

-- If the rounding makes the mantissa to overflow, then it has to be re-adjusted

                if rounded_m(24) = '1' then
                        -- overflow => SHR(rounded_m), exp <- (exp + 1)
                        m <= rounded_m(24 downto 1);
                        exp <= ( unsigned(internal_e) + 1 );
                else
                        -- no overflow
                        m <= rounded_m(23 downto 0);
                        exp <= internal_e;
                end if;

                ----------------------------------------------------------
                   
-- normalized result packing 

                x <= conv_std_logic_vector( signed(exp) - 511 + 127, 8 );  -- single precision bias restoring;
                f <= m(22 downto 0);
                sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; result_inexact <= '0';        

                ----------------------------------------------------------

        else

-- invalid operand; NaN is generated

                rounded_m <= (others => '0');
                exp <= (others => '0');
                m <= (others => '0');
                x <= "11111111";
                f <= "00000000000000000000001";
                sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; result_inexact <= '0'; rounding_inexact <= '0';

        end if;

    end process;   


-- All "inexact result warning" internal signals are put in logical OR:

        sgl_inexact_operation <= ( result_inexact or rounding_inexact );


end rtl;
