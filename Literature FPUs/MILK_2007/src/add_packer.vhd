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

entity add_packer is
    port( internal_exponent      : in std_logic_vector(8 downto 0);
          internal_mantissa      : in std_logic_vector(47 downto 0);
          packed_exponent        : out std_logic_vector(7 downto 0);
          packed_fractional_part : out std_logic_vector(22 downto 0);
          exc_overflow           : out std_logic;
          exc_underflow          : out std_logic;
          exc_inexact            : out std_logic
        ); 
end add_packer;

-------------------------------------------------------------------------------
architecture rtl of add_packer is
    
    signal internal_e            : std_logic_vector(8 downto 0);
    signal internal_m            : std_logic_vector(47 downto 0);
    signal exp                   : std_logic_vector(8 downto 0);
    signal m                     : std_logic_vector(23 downto 0);
    signal rounded_add           : std_logic_vector(24 downto 0);
    signal x                     : std_logic_vector(7 downto 0);
    signal f                     : std_logic_vector(22 downto 0);
    signal sgl_exc_overflow     : std_logic;
    signal sgl_exc_underflow     : std_logic;
    signal result_inexact        : std_logic;
    signal rounding_inexact      : std_logic;
    signal sgl_inexact_addiction : std_logic; 

    begin

            internal_e <= internal_exponent;
            internal_m <= internal_mantissa;
            packed_exponent        <= x;
            packed_fractional_part <= f;
            exc_overflow  <= sgl_exc_overflow;
            exc_underflow <= sgl_exc_underflow;
            exc_inexact   <= sgl_inexact_addiction;
            

-- special result detection and result packing into single precision floating-point format:

    SUM_RESULT_GEN: process(internal_e, internal_m, rounded_add, exp, m)
    variable c : integer RANGE 0 to 16777215;
    variable d : integer RANGE 0 to 8388607;
    begin

----------------------------------------------------------------------------

-- special cases:

        if ( conv_integer(unsigned(internal_e)) > 127 + 255) then  
                -- overflow                     
                x <= (others => '1');  -- Infinity 
                f <= (others => '0');
                sgl_exc_overflow <= '1'; sgl_exc_underflow <= '0'; result_inexact   <= '1'; rounding_inexact <= '0'; 
                rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( (conv_integer(unsigned(internal_e)) = 127 + 255) and ( internal_m(47 downto 23) = "1111111111111111111111111") ) then
                -- normalized --> overflow limit zone
                        x <= (others => '1');  -- Infinity 
                        f <= (others => '0');
                        sgl_exc_overflow <= '1'; sgl_exc_underflow <= '0'; result_inexact   <= '1'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');
             
        elsif ( conv_integer(unsigned(internal_e)) = -127 + 255) then  
                -- normalized/denormalized limit zone
                if ( internal_m(47 downto 24) = "111111111111111111111111" ) then
                        -- round to min normalized number: 2^(-126) 
                        x <= "00000001";
                        f <= conv_std_logic_vector(0,23);
                        result_inexact <= '1';
                else 
                        -- trunc to denormalized number (exp = -126)
                        d := conv_integer(unsigned(internal_m(47 downto 25)));
                        x <= (others => '0');
                        if ( internal_m(24 downto 0) = conv_std_logic_vector(0,25) ) then
                                f <= conv_std_logic_vector(d,23);
                                result_inexact <= '0';
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(24)='0') or ((internal_m(25)='0') and (internal_m(24)='1') and (internal_m(23 downto 0)=conv_std_logic_vector(0,24))) ) then 
                                f <= conv_std_logic_vector(d,23);
                                result_inexact <= '1';
                        else 
                                f <= conv_std_logic_vector(d+1,23);
                                result_inexact <= '1';
                        end if;
                end if;
                sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');
                
        elsif ( (conv_integer(unsigned(internal_e)) = -150 + 255 ) ) then    
                -- denormalized --> underflow limit zone
                x <= (others => '0');
                if ( internal_m(46 downto 0)=conv_std_logic_vector(0,47) )then
                        -- underflow
                        f <= (others => '0');  -- ZERO
                        sgl_exc_underflow <= '1'; result_inexact   <= '1';
                else
                        -- round to min denormalized
                        f <= "00000000000000000000001";
                        sgl_exc_underflow <= '0'; result_inexact   <= '1';
                end if;
                sgl_exc_overflow <= '0'; rounding_inexact <= '0';
                rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

        elsif ( Conv_integer(unsigned(internal_e)) < -150 + 255 ) then  
                -- underflow
                x <= (others => '0');
                f <= (others => '0');  -- ZERO
                sgl_exc_overflow <= '0'; sgl_exc_underflow <= '1'; result_inexact   <= '1'; rounding_inexact <= '0';
                rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');
                

----------------------------------------------------------------------------

-- result is  always converted into a single precision denormalized number:

            elsif ( (Conv_integer(unsigned(internal_e))= -128 + 255) )then
                        d := Conv_integer( unsigned(internal_m(47 downto 26)) );
                        x <= (others => '0');
                        if ( internal_m(25 downto 0) = conv_std_logic_vector(0,26) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(25)='0') or ((internal_m(26)='0') and (internal_m(25)='1') and (internal_m(24 downto 0)=conv_std_logic_vector(0,25))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -129 + 255) )then
                        d := Conv_integer(  unsigned(internal_m(47 downto 27)) );
                        x <= (others => '0');
                        if ( internal_m(26 downto 0) = conv_std_logic_vector(0,27) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(26)='0') or ((internal_m(27)='0') and (internal_m(26)='1') and (internal_m(25 downto 0)=conv_std_logic_vector(0,26))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -130 + 255) )then
                        d := Conv_integer(  unsigned(internal_m(47 downto 28)) );
                        x <= (others => '0');
                        if ( internal_m(27 downto 0) = conv_std_logic_vector(0,28) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(27)='0') or ((internal_m(28)='0') and (internal_m(27)='1') and (internal_m(26 downto 0)=conv_std_logic_vector(0,27))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');
                 
            elsif ( (Conv_integer(unsigned(internal_e))= -131 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 29)) );
                        x <= (others => '0');
                        if ( internal_m(28 downto 0) = conv_std_logic_vector(0,29) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(28)='0') or ((internal_m(29)='0') and (internal_m(28)='1') and (internal_m(27 downto 0)=conv_std_logic_vector(0,28))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -132 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 30)) );
                        x <= (others => '0');
                        if ( internal_m(29 downto 0) = conv_std_logic_vector(0,30) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(29)='0') or ((internal_m(30)='0') and (internal_m(29)='1') and (internal_m(28 downto 0)=conv_std_logic_vector(0,29))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -133 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 31)) );
                        x <= (others => '0');
                        if ( internal_m(30 downto 0) = conv_std_logic_vector(0,31) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(30)='0') or ((internal_m(31)='0') and (internal_m(30)='1') and (internal_m(29 downto 0)=conv_std_logic_vector(0,30))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -134 + 255) ) then
                       d := Conv_integer(  unsigned(internal_m(47 downto 32)) );
                        x <= (others => '0');
                        if ( internal_m(31 downto 0) = conv_std_logic_vector(0,32) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(31)='0') or ((internal_m(32)='0') and (internal_m(31)='1') and (internal_m(30 downto 0)=conv_std_logic_vector(0,31))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

                
            elsif ( (Conv_integer(unsigned(internal_e))= -135 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 33)) );
                        x <= (others => '0');
                        if ( internal_m(32 downto 0) = conv_std_logic_vector(0,33) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(32)='0') or ((internal_m(33)='0') and (internal_m(32)='1') and (internal_m(31 downto 0)=conv_std_logic_vector(0,32))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -136 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 34)) );
                        x <= (others => '0');
                        if ( internal_m(33 downto 0) = conv_std_logic_vector(0,34) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(33)='0') or ((internal_m(34)='0') and (internal_m(33)='1') and (internal_m(32 downto 0)=conv_std_logic_vector(0,33))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -137 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 35)) );
                        x <= (others => '0');
                        if ( internal_m(34 downto 0) = conv_std_logic_vector(0,35) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(34)='0') or ((internal_m(35)='0') and (internal_m(34)='1') and (internal_m(33 downto 0)=conv_std_logic_vector(0,34))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');


            elsif ( (Conv_integer(unsigned(internal_e))= -138 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 36)) );
                        x <= (others => '0');
                        if ( internal_m(35 downto 0) = conv_std_logic_vector(0,36) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(35)='0') or ((internal_m(36)='0') and (internal_m(35)='1') and (internal_m(34 downto 0)=conv_std_logic_vector(0,35))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -139 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 37)) );
                        x <= (others => '0');
                        if ( internal_m(36 downto 0) = conv_std_logic_vector(0,37) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(36)='0') or ((internal_m(37)='0') and (internal_m(36)='1') and (internal_m(35 downto 0)=conv_std_logic_vector(0,36))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -140 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 38)) );
                        x <= (others => '0');
                        if ( internal_m(37 downto 0) = conv_std_logic_vector(0,38) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(37)='0') or ((internal_m(38)='0') and (internal_m(37)='1') and (internal_m(36 downto 0)=conv_std_logic_vector(0,37))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -141 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 39)) );
                        x <= (others => '0');
                        if ( internal_m(38 downto 0) = conv_std_logic_vector(0,39) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(38)='0') or ((internal_m(39)='0') and (internal_m(38)='1') and (internal_m(37 downto 0)=conv_std_logic_vector(0,38))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -142 + 255) ) then
                        d := Conv_integer(  unsigned(internal_m(47 downto 40)) );
                        x <= (others => '0');
                        if ( internal_m(39 downto 0) = conv_std_logic_vector(0,40) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(39)='0') or ((internal_m(40)='0') and (internal_m(39)='1') and (internal_m(38 downto 0)=conv_std_logic_vector(0,39))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -143 + 255) ) then
                        d := Conv_integer( unsigned(internal_m(47 downto 41)) );
                        x <= (others => '0');
                        if ( internal_m(40 downto 0) = conv_std_logic_vector(0,41) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(40)='0') or ((internal_m(41)='0') and (internal_m(40)='1') and (internal_m(39 downto 0)=conv_std_logic_vector(0,40))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -144 + 255) ) then
                        d := Conv_integer( unsigned(internal_m(47 downto 42)) );
                        x <= (others => '0');
                        if ( internal_m(41 downto 0) = conv_std_logic_vector(0,42) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(41)='0') or ((internal_m(42)='0') and (internal_m(41)='1') and (internal_m(40 downto 0)=conv_std_logic_vector(0,41))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -145 + 255) ) then
                        d := Conv_integer( unsigned(internal_m(47 downto 43)) );
                        x <= (others => '0');
                        if ( internal_m(42 downto 0) = conv_std_logic_vector(0,43) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(42)='0') or ((internal_m(43)='0') and (internal_m(42)='1') and (internal_m(41 downto 0)=conv_std_logic_vector(0,42))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -146 + 255) ) then
                        d := Conv_integer( unsigned(internal_m(47 downto 44)) );
                        x <= (others => '0');
                        if ( internal_m(43 downto 0) = conv_std_logic_vector(0,44) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(43)='0') or ((internal_m(44)='0') and (internal_m(43)='1') and (internal_m(42 downto 0)=conv_std_logic_vector(0,43))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -147 + 255) ) then
                        d := Conv_integer( unsigned(internal_m(47 downto 45)) );
                        x <= (others => '0');
                        if ( internal_m(44 downto 0) = conv_std_logic_vector(0,45) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(44)='0') or ((internal_m(45)='0') and (internal_m(44)='1') and (internal_m(43 downto 0)=conv_std_logic_vector(0,44))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -148 + 255) ) then
                        d := Conv_integer( unsigned(internal_m(47 downto 46)) );
                        x <= (others => '0');
                        if ( internal_m(45 downto 0) = conv_std_logic_vector(0,46) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( (internal_m(45)='0') or ((internal_m(46)='0') and (internal_m(45)='1') and (internal_m(44 downto 0)=conv_std_logic_vector(0,45))) ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

            elsif ( (Conv_integer(unsigned(internal_e))= -149 + 255) ) then
                        d := Conv_integer(internal_m(47));
                        x <= (others => '0');
                        if ( internal_m(46 downto 0) = conv_std_logic_vector(0,47) ) then
                                f <= Conv_std_logic_vector(d,23);
                                result_inexact   <= '0'; 
                        ----------------------------------------------------------
                        -- ROUND TO NEAREST
                        elsif ( internal_m(46)='0' ) then  
                                f <= Conv_std_logic_vector(d,23); 
                                result_inexact   <= '1';
                        else 
                                f <= Conv_std_logic_vector(d+1,23);
                                result_inexact   <= '1';
                        end if;
                        sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; rounding_inexact <= '0';
                        rounded_add <= (others => '0'); exp <= (others => '0'); m <= (others => '0');

----------------------------------------------------------------------------

-- result is  always converted into a single precision normalized numbers:
                    
-- rounding 

            elsif ( (conv_integer(unsigned(internal_e)) < 128 + 255) and (conv_integer(unsigned(internal_e)) > -127 + 255) ) then
                    c := Conv_integer(  unsigned(internal_m(47 downto 24))  );                                           
                    if internal_m(23 downto 0) = Conv_std_logic_vector(0,24) then
                            -- only one exact case!
                            rounded_add <= Conv_std_logic_vector(c,25);
                            rounding_inexact <= '0';
                    elsif ( (internal_m(23) = '0') or ( internal_m(24) = '0' and internal_m(23) = '1' and internal_m(22 downto 0) = Conv_std_logic_vector(0,23) ) ) then
		                rounded_add <= Conv_std_logic_vector(c,25);
                            rounding_inexact <= '1';
                    else 									                   
                            rounded_add <= Conv_std_logic_vector(c+1,25);
                            rounding_inexact <= '1';
                       
                    end if;
                            
                    ----------------------------------------------------------

-- If the rounding makes the mantissa to overflow, then result has to be re-adjusted

                    if rounded_add(24) = '1' then
                            -- overflow => SHR(rounded_add), exp <- (exp + 1)
                            m <= rounded_add(24 downto 1);   -- note: LSB is lost, but there's no information loss in doing this, since the lost bit is zero                                 
                            exp <= ( unsigned(internal_e) + 1 );
                    else
                            -- no overflow
                            m <= rounded_add(23 downto 0);
                            exp <= internal_e;
                    end if;

                    ----------------------------------------------------------

-- normalized result packing

                    x <= conv_std_logic_vector( unsigned(exp) -255 + 127, 8 );
                    f <= m(22 downto 0);                                             
                    sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; result_inexact   <= '0';
 
                    ----------------------------------------------------------

            else

-- invalid operand; NaN is generated

                    rounded_add <= (others => '0');
                    exp <= (others => '0');
                    m <= (others => '0');
                    x <= "11111111";
                    f <= "00000000000000000000001";
                    sgl_exc_overflow <= '0'; sgl_exc_underflow <= '0'; result_inexact <= '0'; rounding_inexact <= '0';

            end if;

        end process;   


-- All "inexact result warning" internal signals are put in logical OR:

        sgl_inexact_addiction <= ( result_inexact or rounding_inexact);


    end rtl;
