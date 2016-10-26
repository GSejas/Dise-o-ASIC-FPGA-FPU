-------------------------------------------------------------------------
-- This file is part of Oggonachip project
---------------------------------------------------------------------------
-- Entities: multadd, addbank
-- File:   mdctcomp.vhd
-- Author: Luis L. Azuara
-- Description:	Components requiered to perform the mdct.
-- Creation date: 27.03.02
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;

entity multadd is
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    datain  : in in_multadd;
    dataout  : out out_multadd
    );

end multadd; 

architecture rtl of multadd is
  begin
    -- purpose: 2 multiplications  with an 64-bits adder
    --          return 32 bits result after multipliers and adder
    --          r_mult=MULT_NORM(op1_m1*op2_m1+/-op1_m2*op2_m2)
    -- type   : combinational
    -- inputs : clk,rst,datain
    -- outputs: dataout
    mult: process (clk,rst,datain)
    variable r1_64,r2_64: std_logic_vector (63 downto 0) := (others => '0');  
                                        -- result registers for multiplication
    variable ra_32 : std_logic_vector (31 downto 0) := (others => '0');  
                                        -- result register after addition
    begin  -- process mult

      r1_64 := datain.op1_m1 * datain.op2_m1;
      r2_64 := datain.op1_m2 * datain.op2_m2;
      
      if datain.add_fun='1'  then
        ra_32 := MULT_NORM(r1_64 + r2_64);
      elsif datain.add_fun='0' then
        ra_32 := MULT_NORM(r1_64 - r2_64);
      end if;

      if rst='0'  then
        dataout.r_m1 <= (others => '0');
        dataout.r_m2 <= (others => '0');
        dataout.r_mult <= (others => '0');
      elsif rst='1' then
        dataout.r_m1 <= MULT_NORM(r1_64);
        dataout.r_m2 <= MULT_NORM(r2_64);
        dataout.r_mult <= ra_32;
      end if;
    end process mult;

  end;
    
--------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.mdctlib.all;
use IEEE.std_logic_signed.all;

entity addbank is
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    datain  : in in_addbank;
    dataout  : out out_addbank
    );

end addbank;

architecture rtl of addbank is

begin  -- rtl

  -- purpose: 3 preconf adders and 3 substractions
  -- type   : combinational
  -- inputs : clk,rst,datain
  -- outputs: dataout
  add: process (clk,rst,datain)
  begin  -- process add
    if rst ='0' then
      dataout.r_a1 <= (others => '0');
      dataout.r_a2 <= (others => '0');    
      dataout.r_a3 <= (others => '0');
      dataout.r_s1 <= (others => '0');
      dataout.r_s2 <= (others => '0');
      dataout.r_s3 <= (others => '0');
    elsif rst='1' then
      dataout.r_a1 <= datain.op1_a1 + datain.op2_a1;
      dataout.r_a2 <= datain.op1_a2 + datain.op2_a2;    
      dataout.r_a3 <= datain.op1_a3 + datain.op2_a3;
      dataout.r_s1 <= datain.op1_s1 - datain.op2_s1;
      dataout.r_s2 <= datain.op1_s2 - datain.op2_s2;
      dataout.r_s3 <= datain.op1_s3 - datain.op2_s3;
    end if;
    
  end process add;
    

end rtl;
















