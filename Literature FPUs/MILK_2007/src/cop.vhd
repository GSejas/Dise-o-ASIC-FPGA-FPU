-----------------------------------------------------------------------------------------------------------
--
--
--				                    MILK COPROCESSOR
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
use IEEE.numeric_std.all;
use work.cop_definitions.all;
use work.cop_components.all;
use work.milk_regfile.all;

entity cop is
    generic(COP_INDEX    : integer range 0 to 3 := 1;
             conv_flag    : integer := conv_flag_value;
             trunc_flag   : integer := trunc_flag_value;
             mul_flag     : integer := mul_flag_value;
             div_flag     : integer := div_flag_value;
             add_flag     : integer := add_flag_value;
             sqrt_flag    : integer := sqrt_flag_value;
             compare_flag : integer := compare_flag_value );
    port( clk,reset,enable : in std_logic;        
          rd_cop, wr_cop   : in std_logic;
	  c_index          : in std_logic_vector(1 downto 0);
	  r_index          : in std_logic_vector(3 downto 0);
	  cop_in           : in  std_logic_vector(word_width-1 downto 0);
	  cop_out          : out std_logic_vector(word_width-1 downto 0);
	  read_hit         : out std_logic;
	  write_hit        : out std_logic; 
	  cop_exc          : out std_logic;
          cop_stall        : out std_logic);
end cop;

-----------------------------------------------------------------------------------
architecture milk of cop is

    component ctrl_logic
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
              exc_unknown_instruction : out std_logic );
    end component;

    component IO_logic
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
    end component;

    component intr_sgls_generator
        port( clk, reset : in std_logic;
	      exc_bus    : in std_logic_vector(flags_amount-1 downto 0);
              exception  : out std_logic );
    end component;
		  
    component sticky_status_logic
        port( restore        : in std_logic;
	      exc_in, status : in std_logic_vector(flags_amount-1 downto 0);
  	      sticky_status  : out std_logic_vector(flags_amount-1 downto 0)  );
    end component;

    component int_to_single_conv
        port( clk,reset,enable : in std_logic;
              cvt_s_in         : in std_logic_vector(word_width-1 downto 0);
              cvt_s_out        : out std_logic_vector(word_width-1 downto 0);
              exc_inexact_conv : out std_logic  );
    end component;    

    component single_to_int_trunc
        port( clk,reset,enable            : in std_logic;
              cvt_w_in                    : in std_logic_vector(word_width-1 downto 0);
	      cvt_w_out                   : out std_logic_vector(word_width-1 downto 0);
              exc_inexact_trunc           : out std_logic;
	      exc_overflow_trunc          : out std_logic;
              exc_invalid_operation_trunc : out std_logic );
    end component;

    component sp_fmultiplier 
        port( clk,reset,enable           : in  std_logic;
              multiplicand,multiplicator : in  std_logic_vector(word_width-1 downto 0);
              mul_result                 : out std_logic_vector(word_width-1 downto 0);
              exc_overflow_mul           : out std_logic;  
              exc_underflow_mul          : out std_logic;  
              exc_inexact_mul            : out std_logic;
              exc_invalid_operation_mul  : out std_logic  );
    end component;

    component sp_fdivider
        port( clk,reset,enable          : in  std_logic;
              dividend,divisor          : in  std_logic_vector(word_width-1 downto 0);
              div_result                : out std_logic_vector(word_width-1 downto 0);
              exc_overflow_div          : out std_logic;  
              exc_underflow_div         : out std_logic;  
              exc_inexact_div           : out std_logic;
              exc_invalid_operation_div : out std_logic;
              exc_division_by_zero      : out std_logic );
    end component;

    component sp_fadder
        port( clk,reset,enable          : in  std_logic;
              sub_sel                   : in  std_logic;
              operand_a,operand_b       : in  std_logic_vector(word_width-1 downto 0);
              add_result                : out std_logic_vector(word_width-1 downto 0);
              exc_overflow_add          : out std_logic;  
              exc_underflow_add         : out std_logic;  
              exc_inexact_add           : out std_logic;
              exc_invalid_operation_add : out std_logic ); 
    end component;

    component sp_fsqrt
        port( clk,reset,enable           : in  std_logic;
              radicand                   : in std_logic_vector(word_width-1 downto 0);
              sqrt_result                : out std_logic_vector(word_width-1 downto 0);
              exc_inexact_sqrt           : out std_logic;
              exc_invalid_operation_sqrt : out std_logic );
    end component;

    component sp_fcomparator
        port( clk,reset,enable              : in  std_logic;
              unordered_query,equal_query,
              less_query,invalid_enable     : in std_logic;
              opa,opb                       : in  std_logic_vector(word_width-1 downto 0);
              comparison_result             : out std_logic_vector(word_width-1 downto 0);
              exc_invalid_operation_compare : out std_logic );    
    end component;
    
    component Register_locking is
        port ( clk,reset                : in Std_logic;
               enable                   : in Std_logic;
               cop_we                   : in Std_logic; 
               cop_rd_addr              : in rf_addr; 
               cop_rd_enable            : in Std_logic; 
               r_index                  : in Std_logic_vector(3 downto 0); 
               cop_rs1_addr             : in rf_addr; 
               cop_rs2_addr             : in rf_addr;
               
               cop_wb_enable_1          : in Std_logic; 
               cop_wb_addr_1            : in rf_addr; 
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
               
               lock_micro               : out Std_logic;
		       creg_rd	                : in rf_addr;
               creg_opcode              : in Std_logic_vector(cop_opcode_width-1 downto 0);
               next_lock_vector_p       : out Std_logic_vector(RF_width-1 downto 0) );
    end component; 
------------------------------------------------------------------------------

    signal cs,write_hit_s,read_hit_s,
           rcoffee_we,
           coffee_sreg_write : std_logic;
    signal cr_we, sr_we      : std_logic;       
    signal high_value        : std_logic; 
    signal regtype_sgl       : std_logic_vector(2 downto 0);
       
------------------------------------------------------------------------------
-- DATA PATH SIGNALS 
-- control    

    signal trunc_w_we,
           cvt_s_we,
           mul_s_we,
           div_s_we,
           add_s_we,
           sub_s_we,
           addsub_s_we, 
           sqrt_s_we,
           compare_s_we : std_logic;
    signal wb_en_1,wb_en_2,wb_en_3,
           wb_en_4,wb_en_5,wb_en_6,
           wb_en_7,wb_en_8,wb_en_9,
           wb_en_10     : std_logic;
    signal wb_reg_1,wb_reg_2,wb_reg_3,
           wb_reg_4,wb_reg_5,wb_reg_6,
           wb_reg_7, wb_reg_8, wb_reg_9 : rf_addr;
    signal rs1,rs2      : rf_addr;
 
-- data

    signal exception_bus                 : std_logic_vector(exceptions_amount-1 downto 0);
    signal flags_in,flags_out,
           sticky_status_input           : std_logic_vector(flags_amount-1 downto 0);
    signal coffee_data_in,ext_data_out,  
	   op1,op2,cvt_s_out,
           trunc_w_out,mul_out,div_out,
           add_out,sqrt_out,compare_out,
           mov_out,abs_out,
           neg_out                       : std_logic_vector(word_width-1 downto 0);
    signal status_reg_in, status_reg_out : std_logic_vector(sreg_width-1 downto 0);

    signal exc_abs_invalid, 
           exc_neg_invalid               : std_logic;
    signal sticky_exc_bus                    : std_logic_vector(flags_amount-1 downto 0);
    signal incoming_data,outgoing_data       : std_logic_vector(word_width-1 downto 0);
    signal lock_micro                        : Std_logic;  -- active low
    signal rd_addr,rs1_addr,rs2_addr         : rf_addr;
    signal compare_flag_in, compare_flag_out : std_logic_vector(3 downto 0);
    signal creg_rd_s                         : rf_addr;
	signal creg_opcode_s                     : cop_opcode;
	signal next_lock_vector_s                : Std_logic_vector(RF_width-1 downto 0);
-----------------------------------------------------------------------------------------------------------

    begin
        incoming_data <= cop_in;
        cop_out <= outgoing_data;
        rd_addr <= cop_in(8 downto 6);
        rs1_addr <= cop_in(13 downto 11);
        rs2_addr <= cop_in(18 downto 16);
        cop_stall <= lock_micro;
        high_value  <= '1';
        sr_we       <= '1';
        regtype_sgl <= ( r_index(3) & r_index(1) & r_index(0) );
        addsub_s_we <= ( add_s_we or sub_s_we );

------------------------------------------------------------------------------

        CS_VERIFICATION : process(c_index,rd_cop,wr_cop)
        begin
            if (c_index = std_logic_vector(to_unsigned(COP_INDEX,2)) and
	       (rd_cop = '1' or wr_cop = '1')) then
                    -- this coprocessor is indexed
	            cs <= '1';
            else
                    -- not this coprocessor active
                cs <= '0';
            end if;
        end process; 

        COFFEE_REG_WE:process(write_hit_s,r_index)
        begin
            if (write_hit_s='1' and r_index(3)='0') then
                    -- Coffee is writing on the Register file
                    rcoffee_we <= '1';
            else 
                    -- Coffee is writing (if gwrite='1') on a special purpose register 
                    rcoffee_we <= '0';
            end if;
        end process;

------------------------------------------------------------------------------
-- Special Registers of the architecture 

        STATUS_REGISTER : WE_register 
        -- made up of 2 fields:         
        --      
        -- FLAGnS: 7 bits, each related to a whole set of exceptions (DOUBLEWRITE, OVERFLOW, UNDERFLOW,
        --        INEXACT RESULT, INVALID OPERAND, DIVISION BY ZERO and UNKNOWN INSTRUCTION). They are
        --        "sticky" meaning that once they are asserted, they can only be explicitly cleared by
        --        the user.
        --        They can only be read and written all at once.
        --
        -- CURRENT STATUS: this field also contains 7 bits having the same meaning as those in the flags
        --                 field, but they refer to the status of the last executed instruction.

        generic map (reg_width => sreg_width)
        port map (clk => clk, reset => reset, we => sr_we, data_in => status_reg_in,
	          data_out => status_reg_out);

------------------------------------------------------------------------------
-- main components instantiation

        REG_FILE: Milk_RFile
	          port map ( clk => clk, reset => reset, enable => high_value, 
                             exc_doublewrite => exception_bus(0), 
                             rcoffee_we => rcoffee_we,
                             coffee_out => ext_data_out,
                             rs1 => rs1, rs1_out => op1,
                             rs2 => rs2, rs2_out => op2,
                             rcoffee_in => r_index(2 downto 0), coffee_in => coffee_data_in,
                             rd_we_1  => wb_en_1,  rd_1  => wb_reg_1,  d1_in  => cvt_s_out,
                             rd_we_2  => wb_en_2,  rd_2  => wb_reg_2,  d2_in  => trunc_w_out,
                             rd_we_3  => wb_en_3,  rd_3  => wb_reg_3,  d3_in  => mul_out,
                             rd_we_4  => wb_en_4,  rd_4  => wb_reg_4,  d4_in  => div_out,
                             rd_we_5  => wb_en_5,  rd_5  => wb_reg_5,  d5_in  => add_out,
                             rd_we_6  => wb_en_6,  rd_6  => wb_reg_6,  d6_in  => sqrt_out,
                             rd_we_7  => wb_en_7,  rd_7  => wb_reg_7,  d7_in  => abs_out,
                             rd_we_8  => wb_en_8,  rd_8  => wb_reg_8,  d8_in  => mov_out,
                             rd_we_9  => wb_en_9,  rd_9  => wb_reg_9,  d9_in  => neg_out,
							 next_lock_vector => next_lock_vector_s);
        
        REG_LOCK: Register_locking
              port map (clk => clk, reset=> reset, enable => enable,
                        cop_we => wr_cop, cop_rd_addr => rd_addr, cop_rd_enable => rd_cop,
                        r_index => r_index,  cop_rs1_addr => rs1_addr, cop_rs2_addr => rs2_addr,
                        cop_wb_enable_1 => wb_en_1, cop_wb_addr_1 => wb_reg_1,               
                        cop_wb_enable_2 => wb_en_2, cop_wb_addr_2 => wb_reg_2,
                        cop_wb_enable_3 => wb_en_3, cop_wb_addr_3 => wb_reg_3,
                        cop_wb_enable_4 => wb_en_4, cop_wb_addr_4 => wb_reg_4,
                        cop_wb_enable_5 => wb_en_5, cop_wb_addr_5 => wb_reg_5,
                        cop_wb_enable_6 => wb_en_6, cop_wb_addr_6 => wb_reg_6,
                        cop_wb_enable_7 => wb_en_7, cop_wb_addr_7 => wb_reg_7,
                        cop_wb_enable_8 => wb_en_8, cop_wb_addr_8 => wb_reg_8,
                        cop_wb_enable_9 => wb_en_9, cop_wb_addr_9 => wb_reg_9,
                        lock_micro=> lock_micro, creg_rd => creg_rd_s, creg_opcode => creg_opcode_s,
                        next_lock_vector_p => next_lock_vector_s);
                          
        IO: IO_logic 
              port map (incoming_data => incoming_data, 
                        outgoing_data => outgoing_data, 
                        rd => rd_cop, 
                        wr => wr_cop, 
                        enable => cs, 
                        gated_write => write_hit_s, 
                        gated_read => read_hit_s, 
                        data_in => coffee_data_in, 
                        creg_we => cr_we, 
                        sreg_we => coffee_sreg_write, 
                        regtype_sel => regtype_sgl, 
                        compare_out => compare_flag_in,
                        sreg_out => status_reg_out, 
                        data_out => ext_data_out );	
    
    
        CTRL: ctrl_logic 
              port map (clk => clk,reset => reset,enable => enable,cr_we => cr_we,
                        coffee_data => coffee_data_in, lock_micro => lock_micro,
                        rs1 => rs1, rs2 => rs2, rd => creg_rd_s, opcd => creg_opcode_s,
                        cvt_s_we => cvt_s_we,trunc_w_we => trunc_w_we, mul_s_we => mul_s_we,
                        div_s_we => div_s_we, add_s_we => add_s_we, sub_s_we => sub_s_we,
                        sqrt_s_we => sqrt_s_we, compare_s_we => compare_s_we,
                        wb_reg_1  => wb_reg_1,  wb_en_1  => wb_en_1,
                        wb_reg_2  => wb_reg_2,  wb_en_2  => wb_en_2,
                        wb_reg_3  => wb_reg_3,  wb_en_3  => wb_en_3,
                        wb_reg_4  => wb_reg_4,  wb_en_4  => wb_en_4,
                        wb_reg_5  => wb_reg_5,  wb_en_5  => wb_en_5,
                        wb_reg_6  => wb_reg_6,  wb_en_6  => wb_en_6,
                        wb_reg_7  => wb_reg_7,  wb_en_7  => wb_en_7,
                        wb_reg_8  => wb_reg_8,  wb_en_8  => wb_en_8,
                        wb_reg_9  => wb_reg_9,  wb_en_9  => wb_en_9,
                        wb_en_10 => wb_en_10,
                        exc_unknown_instruction => exception_bus(exceptions_amount-1));

        INTR_SIGNALS_GEN: intr_sgls_generator 
                          port map (clk => clk, reset => reset, 
                                    exc_bus => status_reg_in(flags_amount-1 downto 0),
	                            exception => cop_exc );

        STICKY_STATUS: sticky_status_logic 
                       port map (restore => coffee_sreg_write,
                                 exc_in => sticky_status_input,
                                 status => flags_out,
                                 sticky_status => flags_in );

------------------------------------------------------------------------------							
-- FUNCTIONAL UNITS SUPPORTED BY THE COPROCESSOR						    

        conv_generation: if conv_flag = 1 generate
                CVT_S_LOGIC: int_to_single_conv 
                             port map (clk => clk, reset => reset, enable => cvt_s_we,
                                       cvt_s_in => op1, cvt_s_out => cvt_s_out, exc_inexact_conv => exception_bus(1) );
        end generate conv_generation;

        no_conv_generation: if conv_flag = 0 generate
                cvt_s_out <= (others => '0');
                exception_bus(1) <= '0';
        end generate no_conv_generation;


        -----------------------------------------------------


        trunc_generation: if trunc_flag = 1 generate
                TRUNC_W_LOGIC: single_to_int_trunc 
                               port map (clk => clk, reset => reset, enable => trunc_w_we,
                                         cvt_w_in => op1, cvt_w_out => trunc_w_out, 
	                                 exc_overflow_trunc => exception_bus(2), exc_inexact_trunc => exception_bus(3),
                                         exc_invalid_operation_trunc => exception_bus(4) );
        end generate trunc_generation;

        no_trunc_generation: if trunc_flag = 0 generate
	        trunc_w_out <= (others => '0');
                exception_bus(2) <= '0';
                exception_bus(3) <= '0';
                exception_bus(4) <= '0';
        end generate no_trunc_generation;


        -----------------------------------------------------


        mul_generation: if mul_flag = 1 generate
                MUL_S_LOGIC: sp_fmultiplier 
                             port map (clk => clk, reset => reset, enable => mul_s_we,
                                       multiplicand => op1, multiplicator => op2,
                                       exc_overflow_mul => exception_bus(5), exc_underflow_mul => exception_bus(6), 
                                       exc_inexact_mul => exception_bus(7), exc_invalid_operation_mul => exception_bus(8),
                                       mul_result => mul_out );
        end generate mul_generation;

        no_mul_generation: if mul_flag = 0 generate
                mul_out <= (others => '0');
                exception_bus(5) <= '0';
                exception_bus(6) <= '0';
                exception_bus(7) <= '0';
                exception_bus(8) <= '0';
        end generate no_mul_generation;


        -----------------------------------------------------


        div_generation: if div_flag = 1 generate
                DIV_S_LOGIC: sp_fdivider
                             port map (clk => clk, reset => reset ,enable => div_s_we,
                                       dividend => op1, divisor => op2, exc_overflow_div => exception_bus(9),
                                       exc_underflow_div => exception_bus(10), exc_inexact_div => exception_bus(11),
                                       exc_invalid_operation_div => exception_bus(12), exc_division_by_zero => exception_bus(13),
                                       div_result => div_out);
        end generate div_generation;

        no_div_generation: if div_flag = 0 generate
                div_out <= (others => '0');
                exception_bus(9) <= '0';
                exception_bus(10) <= '0';
                exception_bus(11) <= '0';
                exception_bus(12) <= '0';
                exception_bus(13) <= '0';
        end generate no_div_generation;


        -----------------------------------------------------


        add_generation: if add_flag = 1 generate
                ADD_S_LOGIC: sp_fadder
                             port map (clk => clk, reset => reset, enable => addsub_s_we,
                                       operand_a => op1, operand_b => op2, sub_sel => sub_s_we, exc_overflow_add => exception_bus(14),          
                                       exc_underflow_add => exception_bus(15), exc_inexact_add => exception_bus(16),
                                       exc_invalid_operation_add => exception_bus(17), add_result => add_out); 
        end generate add_generation;    


        no_add_generation: if add_flag = 0 generate
                add_out <= (others => '0');
                exception_bus(14) <= '0';
                exception_bus(15) <= '0';
                exception_bus(16) <= '0';
                exception_bus(17) <= '0';
        end generate no_add_generation;


        -----------------------------------------------------


        sqrt_generation: if sqrt_flag = 1 generate
                SQRT_S_LOGIC: sp_fsqrt
                              port map (clk => clk, reset => reset, enable => sqrt_s_we, radicand => op1, sqrt_result => sqrt_out, 
                                        exc_inexact_sqrt => exception_bus(18), exc_invalid_operation_sqrt => exception_bus(19));
        end generate sqrt_generation;

        no_sqrt_generation: if sqrt_flag = 0 generate
                sqrt_out <= (others => '0');
                exception_bus(18) <= '0';
                exception_bus(19) <= '0';
        end generate no_sqrt_generation;


        -----------------------------------------------------


        comparator_generation: if compare_flag = 1 generate
                COMP_S_LOGIC: sp_fcomparator
                              port map (clk => clk, reset => reset, enable => compare_s_we, opa => op1, opb => op2,
                                        unordered_query => creg_opcode_s(0), equal_query => creg_opcode_s(1), less_query => creg_opcode_s(2),
                                        invalid_enable => creg_opcode_s(3), exc_invalid_operation_compare => exception_bus(20),
                                        comparison_result => compare_out);
        end generate comparator_generation;

        no_comparator_generation: if compare_flag = 0 generate
                compare_out <= (others => '0');
                exception_bus(20) <= '0';
        end generate no_comparator_generation;


        ------------------------------------------------------------------

            ABS_LOGIC : process(op1)
            begin
                     --abs
                        if ( (op1(30 downto 23)="11111111") and (op1(22 downto 0) /= conv_std_logic_vector(0,23)) ) then
                                -- operand is a NaN
                                abs_out <= op1;
                                exc_abs_invalid <= '1';
                        elsif (op1(word_width-1)='1') then
		                abs_out <= ( not(op1(word_width-1)) & op1(word_width-2 downto 0) );
                                exc_abs_invalid <= '0';
                        else
                                abs_out <= op1;
                                exc_abs_invalid <= '0';
                        end if;
            end process;

        -----------------------------------------------------------------------
        
            NEG_LOGIC : process(op1)
            begin
                        if ( (op1(30 downto 23)="11111111") and (op1(22 downto 0)/=conv_std_logic_vector(0,23)) ) then
                                -- operand is a NaN
                                neg_out <= op1;
                                exc_neg_invalid <= '1';
                        else  
		                neg_out <= ( not(op1(word_width-1)) & op1(word_width-2 downto 0) );
                                exc_neg_invalid <= '0';
                        end if;
 
            end process;

            mov_out <= op1;
-------------------------------------------------------------------------------
-- compare flag flip flop

        COMPARE_FLAG_FF3: data_ff
          port map (clk => clk, reset=>reset, d=>compare_flag_in(3), q=>compare_flag_out(3) );
        COMPARE_FLAG_FF2: data_ff
          port map (clk => clk, reset=>reset, d=>compare_flag_in(2), q=>compare_flag_out(2) );
        COMPARE_FLAG_FF1: data_ff
          port map (clk => clk, reset=>reset, d=>compare_flag_in(1), q=>compare_flag_out(1) );
        COMPARE_FLAG_FF0: data_ff
          port map (clk => clk, reset=>reset, d=>compare_flag_in(0), q=>compare_flag_out(0) );
    
-------------------------------------------------------------------------------
-- Compare flag selection logic

        COMPARE_FLAG_SELECTION_LOGIC: process(compare_out,wb_en_10,compare_flag_out)
        begin
          if (wb_en_10 = '1') then
            compare_flag_in <= compare_out(word_width-1 downto word_width-4);
          else
            compare_flag_in <= compare_flag_out;
          end if;
        end process;
        
-------------------------------------------------------------------------------
-- status register input specification; "flags field":
   
        status_reg_in(sreg_width-1 downto flags_amount) <= flags_in;

        ----------------------------------------------------------

-- status register input specification; "current status" field:

        flags_out <= status_reg_out(sreg_width-1 downto flags_amount);
                                                                        
-------------------------------------------------------------------------------
-- exceptions assignement
        sticky_exc_bus(0) <= exception_bus(0);
        sticky_exc_bus(1) <= (exception_bus(2) and wb_en_2) or (exception_bus(5)  and wb_en_3) or (exception_bus(9)  and wb_en_4) or (exception_bus(14) and wb_en_5);
        sticky_exc_bus(2) <= (exception_bus(6) and wb_en_3) or (exception_bus(10) and wb_en_4) or (exception_bus(15) and wb_en_5);
        sticky_exc_bus(3) <= (exception_bus(1) and wb_en_1) or (exception_bus(3)  and wb_en_2) or (exception_bus(7)  and wb_en_3) or (exception_bus(11) and wb_en_4) or (exception_bus(16) and wb_en_5) or (exception_bus(18) and wb_en_6);
        sticky_exc_bus(4) <= (exception_bus(4) and wb_en_2) or (exception_bus(8)  and wb_en_3) or (exception_bus(12) and wb_en_4) or (exception_bus(17) and wb_en_5) or (exc_abs_invalid   and wb_en_7) or (exc_neg_invalid and wb_en_9) or (exception_bus(19) and wb_en_6); 
        sticky_exc_bus(5) <= (exception_bus(13) and wb_en_4);
        sticky_exc_bus(6) <= exception_bus(21);
-------------------------------------------------------------------------------
		status_reg_in(flags_amount-1 downto 0) <= sticky_exc_bus;
------------------------------------------------------------------------------
    	 
-- "sticky_status_logic" input assignement

        process(coffee_sreg_write,sticky_exc_bus,coffee_data_in)
        begin
            if (coffee_sreg_write = '0') then
                    sticky_status_input <= sticky_exc_bus(flags_amount-1 downto 0);
            else
                    sticky_status_input <= coffee_data_in(6 downto 0);
            end if; 
        end process;

-----------------------------------------------------------------------------------------------------------
	read_hit  <= read_hit_s;
	write_hit <= write_hit_s;

end milk;




