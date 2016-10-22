--------------------------------------------------------------------------------------------
--
--                                        CONTROL LOGIC
--
-- Control logic for the Milk Coprocessor
--
-- Created by Claudio Brunelli, 2004
--
--------------------------------------------------------------------------------------------

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

entity ctrl_logic is
    port( clk,reset,enable,cr_we  : in std_logic;
          coffee_data             : in std_logic_vector(word_width-1 downto 0);
          lock_micro              : in std_logic; 
          rs1,rs2,rd              : out rf_addr;
          opcd                    : out cop_opcode;
          cvt_s_we,trunc_w_we,
          mul_s_we,div_s_we,
          add_s_we,sub_s_we,
          sqrt_s_we,compare_s_we  : out std_logic;
          wb_reg_1                : out rf_addr;
          wb_en_1                 : out std_logic;
          wb_reg_2                : out rf_addr;
          wb_en_2                 : out std_logic;
          wb_reg_3                : out rf_addr;
          wb_en_3                 : out std_logic;
          wb_reg_4                : out rf_addr;
          wb_en_4                 : out std_logic;
          wb_reg_5                : out rf_addr;
          wb_en_5                 : out std_logic;
          wb_reg_6                : out rf_addr;
          wb_en_6                 : out std_logic;
          wb_reg_7                : out rf_addr;
          wb_en_7                 : out std_logic;
          wb_reg_8                : out rf_addr;
          wb_en_8                 : out std_logic;
          wb_reg_9                : out rf_addr;
          wb_en_9                 : out std_logic;          
          wb_en_10                : out std_logic;
          exc_unknown_instruction : out std_logic
        );
end ctrl_logic;

--------------------------------------------------------------------------
architecture rtl of ctrl_logic is

    signal f_instr,d_instr        : std_logic_vector(word_width-1 downto 0);
    signal x_copop                : cop_opcode;
    signal x_rd                      : std_logic_vector(2 downto 0);
	signal ctrl_reg_we,
           cvt_s_we_sgl,
           cvt_s_we_delayed_sgl,
           trunc_w_we_sgl,
           trunc_w_we_delayed_sgl,
           mul_s_we_sgl,
           mul_s_we_delayed_sgl,
           div_s_we_sgl,
           div_s_we_delayed_sgl,
           add_s_we_sgl,
           add_s_we_delayed_sgl,
           sub_s_we_sgl,
           sub_s_we_delayed_sgl,
           sqrt_s_we_sgl,
           sqrt_s_we_delayed_sgl,
           compare_s_We_sgl,
           addsub_sgl,
           mov_s_we_sgl,
           neg_s_we_sgl,
           abs_s_we_sgl           : std_logic;
    signal wrbck_sgls             : std_logic_vector(2 downto 0);
    signal wrbck_delay_bus        : bus_mxn;
    signal wb_sel                    : std_logic_vector(3 downto 0); 
    signal fixed_enable           : std_logic;
    
    begin
      
----------------------------------------------------
-- COPROCESSOR PIPELINE:   Stage 1,   Milk FETCH                        
----------------------------------------------------

        ctrl_reg_we <= ( cr_we and enable and lock_micro );

        process(coffee_data,ctrl_reg_we)
        begin
            if (ctrl_reg_we = '1') then
                    f_instr <= coffee_data;
            else
                    -- if the control has not to be written with a new ctrl-word then a 
                    -- NOP value has to be loaded, otherwise multiple execution of the
                    -- same instruction are performed until this register is written again
                    f_instr <= conv_std_logic_vector(unsigned(nop),32);
            end if;
        end process;

        CONTROL_REGISTER : nop_register 
            generic map (reg_width => word_width )
           port map ( clk => clk, reset => reset, data_in => f_instr, data_out => d_instr );


----------------------------------------------------
-- COPROCESSOR PIPELINE:   Stage 2,   Milk DECODE                       
----------------------------------------------------
-- In this stage are generated the control signals
-- for TRIGGERING the Milk instruction

        fixed_enable <= '1';

        wrbck_sgls(2 downto 0) <= x_rd;

        addsub_sgl <= (add_s_we_delayed_sgl or sub_s_we_delayed_sgl);
        
        REGISTER_PIPELINE : register_chain
                            generic map (length => m, width => n)
                            port map ( clk => clk, reset => reset, enable => fixed_enable, reg_chain_in => wrbck_sgls, reg_chain_out => wrbck_delay_bus);
        

        wb_reg_1  <= wrbck_delay_bus(1);
        wb_reg_2  <= wrbck_delay_bus(1);
        wb_reg_3  <= wrbck_delay_bus(2);
        wb_reg_4  <= wrbck_delay_bus(11);
        wb_reg_5  <= wrbck_delay_bus(4);
        wb_reg_6  <= wrbck_delay_bus(7);
        wb_reg_7  <= wrbck_sgls;
        wb_reg_8  <= wrbck_sgls;
        wb_reg_9  <= wrbck_sgls;

        wb_en_1  <= cvt_s_we_delayed_sgl;
        wb_en_2  <= trunc_w_we_delayed_sgl;
        wb_en_3  <= mul_s_we_delayed_sgl;
        wb_en_4  <= div_s_we_delayed_sgl;
        wb_en_5  <= addsub_sgl;
        wb_en_6  <= sqrt_s_we_delayed_sgl;
        wb_en_7  <= abs_s_we_sgl;
        wb_en_8  <= mov_s_we_sgl;
        wb_en_9  <= neg_s_we_sgl;
        wb_en_10 <= compare_s_we_sgl;
        
        ----------------------------------------------------------------------

        x_copop  <= d_instr(5 downto 0);
        x_rd     <= d_instr(8 downto 6); 
        rs1      <= d_instr(13 downto 11);
        rs2      <= d_instr(18 downto 16);

        WE_GEN_DECODER: process(x_copop)
        begin
            if x_copop = nop then
      	            cvt_s_we_sgl     <= '0';
      		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_cvt_s then
      	            cvt_s_we_sgl     <= '1';
      		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
      	    elsif ( (x_copop = cop_cvt_w) or (x_copop = cop_trunc_w) ) then
      	            cvt_s_we_sgl     <= '0';
      		    trunc_w_we_sgl   <= '1';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_mul_s then
		    cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '1';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_div_s then
	            cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '1';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_add_s then
		    cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '1';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_sub_s then
	            cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '1';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_sqrt_s then
	            cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '1';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';

                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_mov_s then
	            cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '1';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_neg_s then
	            cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '1';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop = cop_abs_s then
	            cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '1';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '0';
            elsif x_copop(cop_opcode_width-1 downto cop_opcode_width-2) = "11" then  -- COMPARISON instruction opcode
		    cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '1';
                    exc_unknown_instruction <= '0';
            else 
                    -- coprocessor's instruction set doesn't support currently delivered opcode
		    cvt_s_we_sgl     <= '0';
		    trunc_w_we_sgl   <= '0';
                    mul_s_we_sgl     <= '0';
                    div_s_we_sgl     <= '0';
                    add_s_we_sgl     <= '0';
                    sub_s_we_sgl     <= '0';
                    sqrt_s_we_sgl    <= '0';
                    mov_s_we_sgl     <= '0';
                    neg_s_we_sgl     <= '0';
                    abs_s_we_sgl     <= '0';
                    compare_s_we_sgl <= '0';
                    exc_unknown_instruction <= '1';
	    end if;
        end process;

--  each of the "FUname_we_sgl" id delayed in a proper way in order to select the right control signals at the right time

        CONV_FF_PIPELINE: ff_chain
                          generic map (length => conv_clk_cycles-1)
                          port map ( clk => clk, reset => reset, enable => fixed_enable, ff_chain_in => cvt_s_we_sgl, ff_chain_out => cvt_s_we_delayed_sgl);

        TRUNC_FF_PIPELINE: ff_chain
                         generic map (length => trunc_clk_cycles-1)
                         port map ( clk => clk, reset => reset, enable => fixed_enable, ff_chain_in => trunc_w_we_sgl, ff_chain_out => trunc_w_we_delayed_sgl);

        MUL_FF_PIPELINE: ff_chain
                         generic map (length => mul_clk_cycles-1)
                         port map ( clk => clk, reset => reset, enable => fixed_enable, ff_chain_in => mul_s_we_sgl, ff_chain_out => mul_s_we_delayed_sgl); 

        DIV_FF_PIPELINE: ff_chain
                         generic map (length => div_clk_cycles-1)
                         port map ( clk => clk, reset => reset, enable => fixed_enable, ff_chain_in => div_s_we_sgl, ff_chain_out => div_s_we_delayed_sgl); 

        ADD_FF_PIPELINE: ff_chain
                         generic map (length => add_clk_cycles-1)
                         port map ( clk => clk, reset => reset, enable => fixed_enable, ff_chain_in => add_s_we_sgl, ff_chain_out => add_s_we_delayed_sgl); 

        SUB_FF_PIPELINE: ff_chain
                         generic map (length => add_clk_cycles-1)
                         port map ( clk => clk, reset => reset, enable => fixed_enable, ff_chain_in => sub_s_we_sgl, ff_chain_out => sub_s_we_delayed_sgl);

        SQRT_FF_PIPELINE: ff_chain
                          generic map (length => sqrt_clk_cycles-1)
                          port map ( clk => clk, reset => reset, enable => fixed_enable, ff_chain_in => sqrt_s_we_sgl, ff_chain_out => sqrt_s_we_delayed_sgl);

-- FU's latching logic write enable

        cvt_s_we     <= cvt_s_we_sgl;
        trunc_w_we   <= trunc_w_we_sgl;
        mul_s_we     <= mul_s_we_sgl;
        div_s_we     <= div_s_we_sgl;
        add_s_we     <= add_s_we_sgl;
        sub_s_we     <= sub_s_we_sgl;
        sqrt_s_we    <= sqrt_s_we_sgl;
        compare_s_we <= compare_s_we_sgl;

-- opcode field extracion
 
        opcd <= d_instr(cop_opcode_width-1 downto 0);

--------------------------------------------------------------------------
		rd <= d_instr(8 downto 6);

end rtl;
