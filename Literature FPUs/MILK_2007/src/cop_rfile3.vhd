-----------------------------------------------------------------------------------------------------------
--
--                                              REGISTER FILE  
-- 
-- The register file is a read/write memory, made up of 8 32-bit general purpose registers.
-- It can be addressed by different resources in a concurrent enviroment.
-- This model is a 3-read and 11-write ports                               
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
use work.cop_definitions.all;
  
package milk_regfile is
    component Milk_RFile
    port( clk         : in  Std_logic;
          reset       : in  Std_logic;
          enable      : in  Std_logic;
	  coffee_out  : out std_logic_vector(word_width-1 downto 0);
	  rs1         : in  rf_addr;
	  rs1_out     : out std_logic_vector(word_width-1 downto 0);
          rs2         : in  rf_addr;
	  rs2_out     : out std_logic_vector(word_width-1 downto 0);
          rcoffee_we  : in  std_logic;
          rcoffee_in  : in  rf_addr;
	  coffee_in   : in  std_logic_vector(word_width-1 downto 0);
          rd_we_1     : in  std_logic;
          rd_1        : in  rf_addr;
	  d1_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_2     : in  std_logic;
          rd_2        : in  rf_addr;
	  d2_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_3     : in  std_logic;
          rd_3        : in  rf_addr;
	  d3_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_4     : in  std_logic;
          rd_4        : in  rf_addr;
	  d4_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_5     : in  std_logic;
          rd_5        : in  rf_addr;
	  d5_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_6     : in  std_logic;
          rd_6        : in  rf_addr;
	  d6_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_7     : in  std_logic;
          rd_7        : in  rf_addr;
	  d7_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_8     : in  std_logic;
          rd_8        : in  rf_addr;
	  d8_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_9     : in  std_logic;
          rd_9        : in  rf_addr;
	  d9_in       : in  std_logic_vector(word_width-1 downto 0);
      next_lock_vector : in Std_logic_vector(RF_width-1 downto 0);

          exc_doublewrite : out std_logic);
    end component;
end milk_regfile;

package body milk_regfile is
end milk_regfile;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.cop_definitions.all;
use work.cop_components.all;
use work.milk_regfile.all;

entity Milk_Rfile is
    port( clk         : in  Std_logic;
          reset       : in  Std_logic;
          enable      : in  Std_logic;
	  coffee_out  : out std_logic_vector(word_width-1 downto 0);
          rs1         : in  rf_addr;
	  rs1_out     : out std_logic_vector(word_width-1 downto 0);
          rs2         : in  rf_addr;
	  rs2_out     : out std_logic_vector(word_width-1 downto 0);
          rcoffee_we  : in  std_logic;
          rcoffee_in  : in  rf_addr;
	  coffee_in   : in  std_logic_vector(word_width-1 downto 0);
          rd_we_1     : in  std_logic;
          rd_1        : in  rf_addr;
	  d1_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_2     : in  std_logic;
          rd_2        : in  rf_addr;
	  d2_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_3     : in  std_logic;
          rd_3        : in  rf_addr;
	  d3_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_4     : in  std_logic;
          rd_4        : in  rf_addr;
	  d4_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_5     : in  std_logic;
          rd_5        : in  rf_addr;
	  d5_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_6     : in  std_logic;
          rd_6        : in  rf_addr;
	  d6_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_7     : in  std_logic;
          rd_7        : in  rf_addr;
	  d7_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_8     : in  std_logic;
          rd_8        : in  rf_addr;
	  d8_in       : in  std_logic_vector(word_width-1 downto 0);
          rd_we_9     : in  std_logic;
          rd_9        : in  rf_addr;
	  d9_in       : in  std_logic_vector(word_width-1 downto 0);
      next_lock_vector : in Std_logic_vector(RF_width-1 downto 0);
          
          exc_doublewrite : out std_logic );
end Milk_Rfile;

-----------------------------------------------------------------------------------
architecture rtl of Milk_Rfile is

    type bus32x8 is array (7 downto 0) of Std_logic_vector(31 downto 0);  

    signal reg_in,reg_out                                                      : bus32x8;
    signal coffeeout3,rs1out3,rs2out3                                          : std_logic_vector(word_width-1 downto 0);
    signal wrbck_enabled_1,wrbck_enabled_2,wrbck_enabled_3,wrbck_enabled_4,
           wrbck_enabled_5,wrbck_enabled_6,wrbck_enabled_7,wrbck_enabled_8,
           wrbck_enabled_9,coffee_wr_enabled,
           rd_8_1,rd_8_2,rd_8_3,rd_8_4,rd_8_5,rd_8_6,rd_8_7,rd_8_8,rd_8_9,rcoffee_in_8,
           reg_we,wr_enable                                                    : std_logic_vector(RF_width-1 downto 0);
  
    begin

----------------------------------------------------------

        REGISTERS:for i in 0 to 7 generate   
            rx : we_register  port map (clk => clk,reset => reset,we => wr_enable(i),
                                        data_in => reg_in(i),data_out => reg_out(i) );                            
        end generate Registers;

----------------------------------------------------------
-- Reg_file Reads from 3state busses
    
        coffee_out <= coffeeout3;           
        rs1_out    <= rs1out3;           
        rs2_out    <= rs2out3;           

----------------------------------------------------------
-- 3state bus handling:

        COFFEEOUT_3STATEBUS:  for i in 0 to 7 generate
            process(rcoffee_in,reg_out,reg_in,reg_we,next_lock_vector)
            begin
                if ((i = Conv_integer(unsigned(rcoffee_in))) and (next_lock_vector(i) = '0'))  then
					if (reg_we(i) = '1') then
						coffeeout3 <= reg_in(i);
					else
                        coffeeout3 <= reg_out(i);
					end if;
                else 
                        coffeeout3 <= (others => 'Z');
                end if;
            end process;
        end generate COFFEEOUT_3STATEBUS;

        RS1_3STATEBUS:  for i in 0 to 7 generate
            process(rs1,reg_out)
            begin
                if i = Conv_integer(unsigned(rs1)) then
                        rs1out3 <= reg_out(i);
                else 
                        rs1out3 <= (others => 'Z');
                end if;
            end process;
        end generate RS1_3STATEBUS;

        RS2_3STATEBUS:  for i in 0 to 7 generate
            process(rs2,reg_out)
            begin
                if i = Conv_integer(unsigned(rs2)) then
                        rs2out3 <= reg_out(i);
                else 
                        rs2out3 <= (others => 'Z');
                end if;
            end process;
        end generate RS2_3STATEBUS;

----------------------------------------------------------
-- Reg_file writes. One is coming from the milk datapath
-- and one from Coffee

        WRBCK_DATA_DEC_1:  decoder3_8 port map(dec_addr => rd_1,dec_out => rd_8_1);
        WRBCK_DATA_DEC_2:  decoder3_8 port map(dec_addr => rd_2,dec_out => rd_8_2);
        WRBCK_DATA_DEC_3:  decoder3_8 port map(dec_addr => rd_3,dec_out => rd_8_3);
        WRBCK_DATA_DEC_4:  decoder3_8 port map(dec_addr => rd_4,dec_out => rd_8_4);
        WRBCK_DATA_DEC_5:  decoder3_8 port map(dec_addr => rd_5,dec_out => rd_8_5);
        WRBCK_DATA_DEC_6:  decoder3_8 port map(dec_addr => rd_6,dec_out => rd_8_6);
        WRBCK_DATA_DEC_7:  decoder3_8 port map(dec_addr => rd_7,dec_out => rd_8_7);
        WRBCK_DATA_DEC_8:  decoder3_8 port map(dec_addr => rd_8,dec_out => rd_8_8);
        WRBCK_DATA_DEC_9:  decoder3_8 port map(dec_addr => rd_9,dec_out => rd_8_9);

        COFFEE_IN_DEC   :  decoder3_8 port map(dec_addr => rcoffee_in,dec_out => rcoffee_in_8);

        REGFILE_WRITE : process(rd_8_1,rd_8_2,rd_8_3,rd_8_4,rd_8_5,rd_8_6,rd_8_7,rd_8_8,rd_8_9,rcoffee_in_8,
                                d1_in,d2_in,d3_in,d4_in,d5_in,d6_in,d7_in,d8_in,d9_in,coffee_in,
                                rd_we_1,rd_we_2,rd_we_3,rd_we_4,rd_we_5,rd_we_6,rd_we_7,rd_we_8,rd_we_9,rcoffee_we,
                                wrbck_enabled_1,wrbck_enabled_2,wrbck_enabled_3,wrbck_enabled_4,wrbck_enabled_5,wrbck_enabled_6,
                                wrbck_enabled_7,wrbck_enabled_8,wrbck_enabled_9,coffee_wr_enabled,
                                reg_we,enable)
        begin
            for i in 0 to 7 loop
 
                wrbck_enabled_1(i)   <= (rd_8_1(i) and rd_we_1);
                wrbck_enabled_2(i)   <= (rd_8_2(i) and rd_we_2);
                wrbck_enabled_3(i)   <= (rd_8_3(i) and rd_we_3);
                wrbck_enabled_4(i)   <= (rd_8_4(i) and rd_we_4);
                wrbck_enabled_5(i)   <= (rd_8_5(i) and rd_we_5);
                wrbck_enabled_6(i)   <= (rd_8_6(i) and rd_we_6);
                wrbck_enabled_7(i)   <= (rd_8_7(i) and rd_we_7);
                wrbck_enabled_8(i)   <= (rd_8_8(i) and rd_we_8);
                wrbck_enabled_9(i)   <= (rd_8_9(i) and rd_we_9);

                coffee_wr_enabled(i) <= (rcoffee_in_8(i) and rcoffee_we);
                
                reg_we(i)            <= ( coffee_wr_enabled(i) or wrbck_enabled_1(i) or wrbck_enabled_2(i) or wrbck_enabled_3(i) or
                                          wrbck_enabled_4(i) or wrbck_enabled_5(i) or wrbck_enabled_6(i) or wrbck_enabled_7(i)
                                          or wrbck_enabled_8(i) or wrbck_enabled_9(i));
                
                wr_enable(i)         <= ( enable and reg_we(i) );
                
                if    ( wrbck_enabled_1(i) = '1' ) then
                        reg_in(i) <= d1_in;
                        
                elsif ( wrbck_enabled_2(i) = '1' ) then
                        reg_in(i) <= d2_in;
                        
                elsif ( wrbck_enabled_3(i) = '1' ) then
                        reg_in(i) <= d3_in;
                        
                elsif ( wrbck_enabled_4(i) = '1' ) then
                        reg_in(i) <= d4_in;
                        
                elsif ( wrbck_enabled_5(i) = '1' ) then
                        reg_in(i) <= d5_in;
                        
                elsif ( wrbck_enabled_6(i) = '1' ) then
                        reg_in(i) <= d6_in;
                        
                elsif ( wrbck_enabled_7(i) = '1' ) then
                        reg_in(i) <= d7_in;

                elsif ( wrbck_enabled_8(i) = '1' ) then
                        reg_in(i) <= d8_in;

                elsif ( wrbck_enabled_9(i) = '1' ) then
                        reg_in(i) <= d9_in;
                        
                else
                        reg_in(i) <= coffee_in;
                        
                end if;
            end loop;
        end process;

  exc_doublewrite <= '0';


end rtl;

