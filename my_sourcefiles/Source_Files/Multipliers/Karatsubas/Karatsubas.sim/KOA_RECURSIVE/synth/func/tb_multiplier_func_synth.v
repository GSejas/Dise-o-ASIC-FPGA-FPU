// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Tue Oct 25 02:16:12 2016
// Host        : jorge-pc running 64-bit Ubuntu 16.04.1 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.sim/KOA_RECURSIVE/synth/func/tb_multiplier_func_synth.v
// Design      : Recursive_KOA
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* SW = "24" *) (* half = "12" *) 
(* NotValidForBitStream *)
module Recursive_KOA
   (Data_A_i,
    Data_B_i,
    sgf_result_o);
  input [23:0]Data_A_i;
  input [23:0]Data_B_i;
  output [47:0]sgf_result_o;

  wire [23:0]Data_A_i;
  wire [23:0]Data_A_i_IBUF;
  wire [23:0]Data_B_i;
  wire [23:0]Data_B_i_IBUF;
  wire \EVEN1.left_high_n_0 ;
  wire \EVEN1.left_high_n_1 ;
  wire \EVEN1.left_high_n_10 ;
  wire \EVEN1.left_high_n_11 ;
  wire \EVEN1.left_high_n_12 ;
  wire \EVEN1.left_high_n_13 ;
  wire \EVEN1.left_high_n_14 ;
  wire \EVEN1.left_high_n_15 ;
  wire \EVEN1.left_high_n_16 ;
  wire \EVEN1.left_high_n_17 ;
  wire \EVEN1.left_high_n_18 ;
  wire \EVEN1.left_high_n_19 ;
  wire \EVEN1.left_high_n_2 ;
  wire \EVEN1.left_high_n_20 ;
  wire \EVEN1.left_high_n_21 ;
  wire \EVEN1.left_high_n_22 ;
  wire \EVEN1.left_high_n_23 ;
  wire \EVEN1.left_high_n_24 ;
  wire \EVEN1.left_high_n_25 ;
  wire \EVEN1.left_high_n_26 ;
  wire \EVEN1.left_high_n_27 ;
  wire \EVEN1.left_high_n_3 ;
  wire \EVEN1.left_high_n_4 ;
  wire \EVEN1.left_high_n_5 ;
  wire \EVEN1.left_high_n_6 ;
  wire \EVEN1.left_high_n_7 ;
  wire \EVEN1.left_high_n_8 ;
  wire \EVEN1.left_high_n_9 ;
  wire \EVEN1.middle_n_0 ;
  wire \EVEN1.middle_n_11 ;
  wire \EVEN1.middle_n_12 ;
  wire \EVEN1.middle_n_13 ;
  wire \EVEN1.middle_n_3 ;
  wire \EVEN1.middle_n_33 ;
  wire \EVEN1.middle_n_4 ;
  wire \EVEN1.middle_n_5 ;
  wire \EVEN1.middle_n_6 ;
  wire \EVEN1.middle_n_7 ;
  wire \EVEN1.middle_n_8 ;
  wire \EVEN1.middle_n_9 ;
  wire \EVEN1.right_lower_n_10 ;
  wire \EVEN1.right_lower_n_11 ;
  wire \EVEN1.right_lower_n_12 ;
  wire \EVEN1.right_lower_n_13 ;
  wire \EVEN1.right_lower_n_14 ;
  wire \EVEN1.right_lower_n_15 ;
  wire \EVEN1.right_lower_n_16 ;
  wire \EVEN1.right_lower_n_17 ;
  wire \EVEN1.right_lower_n_18 ;
  wire \EVEN1.right_lower_n_19 ;
  wire \EVEN1.right_lower_n_20 ;
  wire \EVEN1.right_lower_n_21 ;
  wire \EVEN1.right_lower_n_22 ;
  wire \EVEN1.right_lower_n_23 ;
  wire \EVEN1.right_lower_n_24 ;
  wire \EVEN1.right_lower_n_25 ;
  wire \EVEN1.right_lower_n_26 ;
  wire \EVEN1.right_lower_n_27 ;
  wire [24:6]Q_middle_temp__6;
  wire S_B0__30_carry__1_i_11__0_n_0;
  wire S_B0__30_carry__1_i_11_n_0;
  wire [2:0]p_0_in0_in;
  wire [47:0]sgf_result_o;
  wire sgf_result_o1__35_carry_i_10_n_0;
  wire sgf_result_o1__35_carry_i_12_n_0;
  wire [47:0]sgf_result_o_OBUF;
  wire \sgf_result_o_OBUF[22]_inst_i_11_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_7_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_10_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_11_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_12_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_13_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_14_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_7_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_8_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_9_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_10_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_11_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_12_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_13_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_14_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_7_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_8_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_9_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_10_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_11_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_12_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_13_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_14_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_7_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_8_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_9_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_10_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_11_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_12_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_13_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_14_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_15_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_16_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_17_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_18_n_0 ;

  IBUF \Data_A_i_IBUF[0]_inst 
       (.I(Data_A_i[0]),
        .O(Data_A_i_IBUF[0]));
  IBUF \Data_A_i_IBUF[10]_inst 
       (.I(Data_A_i[10]),
        .O(Data_A_i_IBUF[10]));
  IBUF \Data_A_i_IBUF[11]_inst 
       (.I(Data_A_i[11]),
        .O(Data_A_i_IBUF[11]));
  IBUF \Data_A_i_IBUF[12]_inst 
       (.I(Data_A_i[12]),
        .O(Data_A_i_IBUF[12]));
  IBUF \Data_A_i_IBUF[13]_inst 
       (.I(Data_A_i[13]),
        .O(Data_A_i_IBUF[13]));
  IBUF \Data_A_i_IBUF[14]_inst 
       (.I(Data_A_i[14]),
        .O(Data_A_i_IBUF[14]));
  IBUF \Data_A_i_IBUF[15]_inst 
       (.I(Data_A_i[15]),
        .O(Data_A_i_IBUF[15]));
  IBUF \Data_A_i_IBUF[16]_inst 
       (.I(Data_A_i[16]),
        .O(Data_A_i_IBUF[16]));
  IBUF \Data_A_i_IBUF[17]_inst 
       (.I(Data_A_i[17]),
        .O(Data_A_i_IBUF[17]));
  IBUF \Data_A_i_IBUF[18]_inst 
       (.I(Data_A_i[18]),
        .O(Data_A_i_IBUF[18]));
  IBUF \Data_A_i_IBUF[19]_inst 
       (.I(Data_A_i[19]),
        .O(Data_A_i_IBUF[19]));
  IBUF \Data_A_i_IBUF[1]_inst 
       (.I(Data_A_i[1]),
        .O(Data_A_i_IBUF[1]));
  IBUF \Data_A_i_IBUF[20]_inst 
       (.I(Data_A_i[20]),
        .O(Data_A_i_IBUF[20]));
  IBUF \Data_A_i_IBUF[21]_inst 
       (.I(Data_A_i[21]),
        .O(Data_A_i_IBUF[21]));
  IBUF \Data_A_i_IBUF[22]_inst 
       (.I(Data_A_i[22]),
        .O(Data_A_i_IBUF[22]));
  IBUF \Data_A_i_IBUF[23]_inst 
       (.I(Data_A_i[23]),
        .O(Data_A_i_IBUF[23]));
  IBUF \Data_A_i_IBUF[2]_inst 
       (.I(Data_A_i[2]),
        .O(Data_A_i_IBUF[2]));
  IBUF \Data_A_i_IBUF[3]_inst 
       (.I(Data_A_i[3]),
        .O(Data_A_i_IBUF[3]));
  IBUF \Data_A_i_IBUF[4]_inst 
       (.I(Data_A_i[4]),
        .O(Data_A_i_IBUF[4]));
  IBUF \Data_A_i_IBUF[5]_inst 
       (.I(Data_A_i[5]),
        .O(Data_A_i_IBUF[5]));
  IBUF \Data_A_i_IBUF[6]_inst 
       (.I(Data_A_i[6]),
        .O(Data_A_i_IBUF[6]));
  IBUF \Data_A_i_IBUF[7]_inst 
       (.I(Data_A_i[7]),
        .O(Data_A_i_IBUF[7]));
  IBUF \Data_A_i_IBUF[8]_inst 
       (.I(Data_A_i[8]),
        .O(Data_A_i_IBUF[8]));
  IBUF \Data_A_i_IBUF[9]_inst 
       (.I(Data_A_i[9]),
        .O(Data_A_i_IBUF[9]));
  IBUF \Data_B_i_IBUF[0]_inst 
       (.I(Data_B_i[0]),
        .O(Data_B_i_IBUF[0]));
  IBUF \Data_B_i_IBUF[10]_inst 
       (.I(Data_B_i[10]),
        .O(Data_B_i_IBUF[10]));
  IBUF \Data_B_i_IBUF[11]_inst 
       (.I(Data_B_i[11]),
        .O(Data_B_i_IBUF[11]));
  IBUF \Data_B_i_IBUF[12]_inst 
       (.I(Data_B_i[12]),
        .O(Data_B_i_IBUF[12]));
  IBUF \Data_B_i_IBUF[13]_inst 
       (.I(Data_B_i[13]),
        .O(Data_B_i_IBUF[13]));
  IBUF \Data_B_i_IBUF[14]_inst 
       (.I(Data_B_i[14]),
        .O(Data_B_i_IBUF[14]));
  IBUF \Data_B_i_IBUF[15]_inst 
       (.I(Data_B_i[15]),
        .O(Data_B_i_IBUF[15]));
  IBUF \Data_B_i_IBUF[16]_inst 
       (.I(Data_B_i[16]),
        .O(Data_B_i_IBUF[16]));
  IBUF \Data_B_i_IBUF[17]_inst 
       (.I(Data_B_i[17]),
        .O(Data_B_i_IBUF[17]));
  IBUF \Data_B_i_IBUF[18]_inst 
       (.I(Data_B_i[18]),
        .O(Data_B_i_IBUF[18]));
  IBUF \Data_B_i_IBUF[19]_inst 
       (.I(Data_B_i[19]),
        .O(Data_B_i_IBUF[19]));
  IBUF \Data_B_i_IBUF[1]_inst 
       (.I(Data_B_i[1]),
        .O(Data_B_i_IBUF[1]));
  IBUF \Data_B_i_IBUF[20]_inst 
       (.I(Data_B_i[20]),
        .O(Data_B_i_IBUF[20]));
  IBUF \Data_B_i_IBUF[21]_inst 
       (.I(Data_B_i[21]),
        .O(Data_B_i_IBUF[21]));
  IBUF \Data_B_i_IBUF[22]_inst 
       (.I(Data_B_i[22]),
        .O(Data_B_i_IBUF[22]));
  IBUF \Data_B_i_IBUF[23]_inst 
       (.I(Data_B_i[23]),
        .O(Data_B_i_IBUF[23]));
  IBUF \Data_B_i_IBUF[2]_inst 
       (.I(Data_B_i[2]),
        .O(Data_B_i_IBUF[2]));
  IBUF \Data_B_i_IBUF[3]_inst 
       (.I(Data_B_i[3]),
        .O(Data_B_i_IBUF[3]));
  IBUF \Data_B_i_IBUF[4]_inst 
       (.I(Data_B_i[4]),
        .O(Data_B_i_IBUF[4]));
  IBUF \Data_B_i_IBUF[5]_inst 
       (.I(Data_B_i[5]),
        .O(Data_B_i_IBUF[5]));
  IBUF \Data_B_i_IBUF[6]_inst 
       (.I(Data_B_i[6]),
        .O(Data_B_i_IBUF[6]));
  IBUF \Data_B_i_IBUF[7]_inst 
       (.I(Data_B_i[7]),
        .O(Data_B_i_IBUF[7]));
  IBUF \Data_B_i_IBUF[8]_inst 
       (.I(Data_B_i[8]),
        .O(Data_B_i_IBUF[8]));
  IBUF \Data_B_i_IBUF[9]_inst 
       (.I(Data_B_i[9]),
        .O(Data_B_i_IBUF[9]));
  Recursive_KOA__parameterized0 \EVEN1.left_high 
       (.\Data_A_i[17] (\EVEN1.left_high_n_3 ),
        .\Data_A_i[20] ({\EVEN1.left_high_n_1 ,\EVEN1.left_high_n_2 ,\EVEN1.left_high_n_7 }),
        .\Data_A_i[23] (\EVEN1.left_high_n_8 ),
        .Data_A_i_IBUF(Data_A_i_IBUF[23:12]),
        .Data_B_i_IBUF(Data_B_i_IBUF[23:12]),
        .O({\EVEN1.left_high_n_1 ,\EVEN1.left_high_n_2 }),
        .S(S_B0__30_carry__1_i_11__0_n_0),
        .\sgf_result_o[23] ({\EVEN1.left_high_n_7 ,\EVEN1.left_high_n_8 }),
        .\sgf_result_o[39] ({\EVEN1.left_high_n_21 ,\EVEN1.left_high_n_22 ,\EVEN1.left_high_n_23 ,\EVEN1.left_high_n_24 }),
        .\sgf_result_o[43] ({\EVEN1.left_high_n_25 ,\EVEN1.left_high_n_26 ,\EVEN1.left_high_n_27 }),
        .\sgf_result_o[47] (\EVEN1.left_high_n_0 ),
        .\sgf_result_o[47]_0 ({\EVEN1.left_high_n_3 ,\EVEN1.left_high_n_4 ,\EVEN1.left_high_n_5 ,\EVEN1.left_high_n_6 }),
        .\sgf_result_o[47]_1 ({\EVEN1.left_high_n_9 ,\EVEN1.left_high_n_10 ,\EVEN1.left_high_n_11 ,\EVEN1.left_high_n_12 }),
        .\sgf_result_o[47]_2 ({\EVEN1.left_high_n_13 ,\EVEN1.left_high_n_14 ,\EVEN1.left_high_n_15 ,\EVEN1.left_high_n_16 }),
        .\sgf_result_o[47]_3 ({\EVEN1.left_high_n_17 ,\EVEN1.left_high_n_18 ,\EVEN1.left_high_n_19 ,\EVEN1.left_high_n_20 }));
  Recursive_KOA__parameterized32 \EVEN1.middle 
       (.CO(p_0_in0_in[2]),
        .DI(\sgf_result_o_OBUF[22]_inst_i_7_n_0 ),
        .\Data_A_i[11] (\EVEN1.right_lower_n_16 ),
        .\Data_A_i[11]_0 (\EVEN1.right_lower_n_15 ),
        .\Data_A_i[12] (sgf_result_o1__35_carry_i_10_n_0),
        .\Data_A_i[12]_0 ({\EVEN1.middle_n_12 ,\EVEN1.middle_n_13 ,\EVEN1.middle_n_33 }),
        .\Data_A_i[13] ({\sgf_result_o_OBUF[30]_inst_i_7_n_0 ,\sgf_result_o_OBUF[30]_inst_i_8_n_0 ,\sgf_result_o_OBUF[30]_inst_i_9_n_0 ,\sgf_result_o_OBUF[30]_inst_i_10_n_0 }),
        .\Data_A_i[13]_0 ({\sgf_result_o_OBUF[30]_inst_i_11_n_0 ,\sgf_result_o_OBUF[30]_inst_i_12_n_0 ,\sgf_result_o_OBUF[30]_inst_i_13_n_0 ,\sgf_result_o_OBUF[30]_inst_i_14_n_0 }),
        .\Data_A_i[13]_1 ({\sgf_result_o_OBUF[34]_inst_i_7_n_0 ,\sgf_result_o_OBUF[34]_inst_i_8_n_0 ,\sgf_result_o_OBUF[34]_inst_i_9_n_0 ,\sgf_result_o_OBUF[34]_inst_i_10_n_0 }),
        .\Data_A_i[13]_2 ({\sgf_result_o_OBUF[34]_inst_i_11_n_0 ,\sgf_result_o_OBUF[34]_inst_i_12_n_0 ,\sgf_result_o_OBUF[34]_inst_i_13_n_0 ,\sgf_result_o_OBUF[34]_inst_i_14_n_0 }),
        .\Data_A_i[13]_3 ({\sgf_result_o_OBUF[38]_inst_i_11_n_0 ,\sgf_result_o_OBUF[38]_inst_i_12_n_0 ,\sgf_result_o_OBUF[38]_inst_i_13_n_0 ,\sgf_result_o_OBUF[38]_inst_i_14_n_0 }),
        .\Data_A_i[13]_4 ({\sgf_result_o_OBUF[38]_inst_i_15_n_0 ,\sgf_result_o_OBUF[38]_inst_i_16_n_0 ,\sgf_result_o_OBUF[38]_inst_i_17_n_0 ,\sgf_result_o_OBUF[38]_inst_i_18_n_0 }),
        .\Data_A_i[14] ({\sgf_result_o_OBUF[26]_inst_i_7_n_0 ,\sgf_result_o_OBUF[26]_inst_i_8_n_0 ,\sgf_result_o_OBUF[26]_inst_i_9_n_0 ,\sgf_result_o_OBUF[26]_inst_i_10_n_0 }),
        .\Data_A_i[14]_0 ({\sgf_result_o_OBUF[26]_inst_i_11_n_0 ,\sgf_result_o_OBUF[26]_inst_i_12_n_0 ,\sgf_result_o_OBUF[26]_inst_i_13_n_0 ,\sgf_result_o_OBUF[26]_inst_i_14_n_0 }),
        .\Data_A_i[14]_1 (\sgf_result_o_OBUF[38]_inst_i_10_n_0 ),
        .\Data_A_i[14]_2 (\EVEN1.left_high_n_19 ),
        .\Data_A_i[14]_3 ({\EVEN1.left_high_n_23 ,\EVEN1.left_high_n_24 ,\EVEN1.left_high_n_17 ,\EVEN1.left_high_n_18 }),
        .\Data_A_i[14]_4 ({\EVEN1.left_high_n_26 ,\EVEN1.left_high_n_27 ,\EVEN1.left_high_n_21 ,\EVEN1.left_high_n_22 }),
        .\Data_A_i[14]_5 (\EVEN1.left_high_n_25 ),
        .\Data_A_i[14]_6 (\EVEN1.left_high_n_20 ),
        .\Data_A_i[17] ({\EVEN1.left_high_n_4 ,\EVEN1.left_high_n_5 ,\EVEN1.left_high_n_6 }),
        .\Data_A_i[23] ({\EVEN1.left_high_n_9 ,\EVEN1.left_high_n_10 ,\EVEN1.left_high_n_11 ,\EVEN1.left_high_n_12 }),
        .\Data_A_i[23]_0 ({\EVEN1.left_high_n_13 ,\EVEN1.left_high_n_14 ,\EVEN1.left_high_n_15 ,\EVEN1.left_high_n_16 }),
        .\Data_A_i[2] ({\EVEN1.right_lower_n_17 ,\EVEN1.right_lower_n_18 ,\EVEN1.right_lower_n_19 ,\EVEN1.right_lower_n_20 }),
        .\Data_A_i[2]_0 ({\EVEN1.right_lower_n_21 ,\EVEN1.right_lower_n_22 ,\EVEN1.right_lower_n_23 ,\EVEN1.right_lower_n_24 }),
        .\Data_A_i[2]_1 ({\EVEN1.right_lower_n_25 ,\EVEN1.right_lower_n_26 ,\EVEN1.right_lower_n_27 }),
        .Data_A_i_IBUF(Data_A_i_IBUF),
        .\Data_B_i[12] (\EVEN1.left_high_n_0 ),
        .\Data_B_i[17] (\sgf_result_o_OBUF[22]_inst_i_11_n_0 ),
        .Data_B_i_IBUF(Data_B_i_IBUF),
        .O(\EVEN1.middle_n_0 ),
        .S(sgf_result_o1__35_carry_i_12_n_0),
        .\sgf_result_o[15] ({p_0_in0_in[1:0],\EVEN1.middle_n_3 ,\EVEN1.middle_n_4 }),
        .\sgf_result_o[15]_0 ({\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 ,\EVEN1.middle_n_8 ,\EVEN1.middle_n_9 }),
        .\sgf_result_o[15]_1 (\EVEN1.middle_n_11 ),
        .\sgf_result_o[47] (\EVEN1.middle_n_5 ),
        .\sgf_result_o[47]_0 ({\EVEN1.middle_n_12 ,\EVEN1.middle_n_13 }),
        .\sgf_result_o[47]_1 (Q_middle_temp__6),
        .\sgf_result_o[47]_2 (\EVEN1.middle_n_33 ),
        .\sgf_result_o[47]_3 (sgf_result_o_OBUF[47:11]),
        .sgf_result_o_OBUF(sgf_result_o_OBUF[6:1]));
  Recursive_KOA__parameterized16 \EVEN1.right_lower 
       (.\Data_A_i[11] (\EVEN1.right_lower_n_14 ),
        .\Data_A_i[5] (\EVEN1.right_lower_n_12 ),
        .\Data_A_i[8] ({\EVEN1.right_lower_n_10 ,\EVEN1.right_lower_n_11 ,\EVEN1.right_lower_n_13 }),
        .Data_A_i_IBUF(Data_A_i_IBUF[11:0]),
        .Data_B_i_IBUF(Data_B_i_IBUF[11:0]),
        .O({\EVEN1.right_lower_n_10 ,\EVEN1.right_lower_n_11 }),
        .S(S_B0__30_carry__1_i_11_n_0),
        .\sgf_result_o[47] (\EVEN1.right_lower_n_12 ),
        .\sgf_result_o[47]_0 ({\EVEN1.right_lower_n_13 ,\EVEN1.right_lower_n_14 }),
        .\sgf_result_o[47]_1 ({\EVEN1.right_lower_n_15 ,\EVEN1.right_lower_n_16 }),
        .\sgf_result_o[47]_2 ({\EVEN1.right_lower_n_17 ,\EVEN1.right_lower_n_18 ,\EVEN1.right_lower_n_19 ,\EVEN1.right_lower_n_20 }),
        .\sgf_result_o[47]_3 ({\EVEN1.right_lower_n_21 ,\EVEN1.right_lower_n_22 ,\EVEN1.right_lower_n_23 ,\EVEN1.right_lower_n_24 }),
        .\sgf_result_o[47]_4 ({\EVEN1.right_lower_n_25 ,\EVEN1.right_lower_n_26 ,\EVEN1.right_lower_n_27 }),
        .sgf_result_o_OBUF(sgf_result_o_OBUF[10:1]));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__30_carry__1_i_11
       (.I0(Data_A_i_IBUF[11]),
        .I1(Data_B_i_IBUF[9]),
        .I2(Data_A_i_IBUF[9]),
        .I3(Data_B_i_IBUF[11]),
        .I4(Data_A_i_IBUF[10]),
        .I5(Data_B_i_IBUF[10]),
        .O(S_B0__30_carry__1_i_11_n_0));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__30_carry__1_i_11__0
       (.I0(Data_A_i_IBUF[23]),
        .I1(Data_B_i_IBUF[21]),
        .I2(Data_A_i_IBUF[21]),
        .I3(Data_B_i_IBUF[23]),
        .I4(Data_A_i_IBUF[22]),
        .I5(Data_B_i_IBUF[22]),
        .O(S_B0__30_carry__1_i_11__0_n_0));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    sgf_result_o1__35_carry_i_10
       (.I0(p_0_in0_in[2]),
        .I1(\EVEN1.middle_n_7 ),
        .I2(p_0_in0_in[0]),
        .I3(\EVEN1.middle_n_11 ),
        .I4(p_0_in0_in[1]),
        .I5(\EVEN1.middle_n_6 ),
        .O(sgf_result_o1__35_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    sgf_result_o1__35_carry_i_12
       (.I0(\EVEN1.middle_n_9 ),
        .I1(\EVEN1.middle_n_4 ),
        .I2(\EVEN1.middle_n_8 ),
        .I3(\EVEN1.middle_n_0 ),
        .I4(\EVEN1.middle_n_5 ),
        .I5(\EVEN1.middle_n_3 ),
        .O(sgf_result_o1__35_carry_i_12_n_0));
  OBUF \sgf_result_o_OBUF[0]_inst 
       (.I(sgf_result_o_OBUF[0]),
        .O(sgf_result_o[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \sgf_result_o_OBUF[0]_inst_i_1 
       (.I0(Data_B_i_IBUF[0]),
        .I1(Data_A_i_IBUF[0]),
        .O(sgf_result_o_OBUF[0]));
  OBUF \sgf_result_o_OBUF[10]_inst 
       (.I(sgf_result_o_OBUF[10]),
        .O(sgf_result_o[10]));
  OBUF \sgf_result_o_OBUF[11]_inst 
       (.I(sgf_result_o_OBUF[11]),
        .O(sgf_result_o[11]));
  OBUF \sgf_result_o_OBUF[12]_inst 
       (.I(sgf_result_o_OBUF[12]),
        .O(sgf_result_o[12]));
  OBUF \sgf_result_o_OBUF[13]_inst 
       (.I(sgf_result_o_OBUF[13]),
        .O(sgf_result_o[13]));
  OBUF \sgf_result_o_OBUF[14]_inst 
       (.I(sgf_result_o_OBUF[14]),
        .O(sgf_result_o[14]));
  OBUF \sgf_result_o_OBUF[15]_inst 
       (.I(sgf_result_o_OBUF[15]),
        .O(sgf_result_o[15]));
  OBUF \sgf_result_o_OBUF[16]_inst 
       (.I(sgf_result_o_OBUF[16]),
        .O(sgf_result_o[16]));
  OBUF \sgf_result_o_OBUF[17]_inst 
       (.I(sgf_result_o_OBUF[17]),
        .O(sgf_result_o[17]));
  OBUF \sgf_result_o_OBUF[18]_inst 
       (.I(sgf_result_o_OBUF[18]),
        .O(sgf_result_o[18]));
  OBUF \sgf_result_o_OBUF[19]_inst 
       (.I(sgf_result_o_OBUF[19]),
        .O(sgf_result_o[19]));
  OBUF \sgf_result_o_OBUF[1]_inst 
       (.I(sgf_result_o_OBUF[1]),
        .O(sgf_result_o[1]));
  OBUF \sgf_result_o_OBUF[20]_inst 
       (.I(sgf_result_o_OBUF[20]),
        .O(sgf_result_o[20]));
  OBUF \sgf_result_o_OBUF[21]_inst 
       (.I(sgf_result_o_OBUF[21]),
        .O(sgf_result_o[21]));
  OBUF \sgf_result_o_OBUF[22]_inst 
       (.I(sgf_result_o_OBUF[22]),
        .O(sgf_result_o[22]));
  (* HLUTNM = "lutpair65" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[22]_inst_i_11 
       (.I0(Q_middle_temp__6[7]),
        .I1(\EVEN1.left_high_n_10 ),
        .I2(sgf_result_o_OBUF[7]),
        .I3(\sgf_result_o_OBUF[22]_inst_i_7_n_0 ),
        .O(\sgf_result_o_OBUF[22]_inst_i_11_n_0 ));
  (* HLUTNM = "lutpair64" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[22]_inst_i_7 
       (.I0(Q_middle_temp__6[6]),
        .I1(\EVEN1.left_high_n_11 ),
        .I2(sgf_result_o_OBUF[6]),
        .O(\sgf_result_o_OBUF[22]_inst_i_7_n_0 ));
  OBUF \sgf_result_o_OBUF[23]_inst 
       (.I(sgf_result_o_OBUF[23]),
        .O(sgf_result_o[23]));
  OBUF \sgf_result_o_OBUF[24]_inst 
       (.I(sgf_result_o_OBUF[24]),
        .O(sgf_result_o[24]));
  OBUF \sgf_result_o_OBUF[25]_inst 
       (.I(sgf_result_o_OBUF[25]),
        .O(sgf_result_o[25]));
  OBUF \sgf_result_o_OBUF[26]_inst 
       (.I(sgf_result_o_OBUF[26]),
        .O(sgf_result_o[26]));
  (* HLUTNM = "lutpair65" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[26]_inst_i_10 
       (.I0(Q_middle_temp__6[7]),
        .I1(\EVEN1.left_high_n_10 ),
        .I2(sgf_result_o_OBUF[7]),
        .O(\sgf_result_o_OBUF[26]_inst_i_10_n_0 ));
  (* HLUTNM = "lutpair69" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[26]_inst_i_11 
       (.I0(Q_middle_temp__6[11]),
        .I1(\EVEN1.left_high_n_14 ),
        .I2(\EVEN1.right_lower_n_16 ),
        .I3(\sgf_result_o_OBUF[26]_inst_i_7_n_0 ),
        .O(\sgf_result_o_OBUF[26]_inst_i_11_n_0 ));
  (* HLUTNM = "lutpair68" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[26]_inst_i_12 
       (.I0(Q_middle_temp__6[10]),
        .I1(\EVEN1.left_high_n_15 ),
        .I2(sgf_result_o_OBUF[10]),
        .I3(\sgf_result_o_OBUF[26]_inst_i_8_n_0 ),
        .O(\sgf_result_o_OBUF[26]_inst_i_12_n_0 ));
  (* HLUTNM = "lutpair67" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[26]_inst_i_13 
       (.I0(Q_middle_temp__6[9]),
        .I1(\EVEN1.left_high_n_16 ),
        .I2(sgf_result_o_OBUF[9]),
        .I3(\sgf_result_o_OBUF[26]_inst_i_9_n_0 ),
        .O(\sgf_result_o_OBUF[26]_inst_i_13_n_0 ));
  (* HLUTNM = "lutpair66" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[26]_inst_i_14 
       (.I0(Q_middle_temp__6[8]),
        .I1(\EVEN1.left_high_n_9 ),
        .I2(sgf_result_o_OBUF[8]),
        .I3(\sgf_result_o_OBUF[26]_inst_i_10_n_0 ),
        .O(\sgf_result_o_OBUF[26]_inst_i_14_n_0 ));
  (* HLUTNM = "lutpair68" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[26]_inst_i_7 
       (.I0(Q_middle_temp__6[10]),
        .I1(\EVEN1.left_high_n_15 ),
        .I2(sgf_result_o_OBUF[10]),
        .O(\sgf_result_o_OBUF[26]_inst_i_7_n_0 ));
  (* HLUTNM = "lutpair67" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[26]_inst_i_8 
       (.I0(Q_middle_temp__6[9]),
        .I1(\EVEN1.left_high_n_16 ),
        .I2(sgf_result_o_OBUF[9]),
        .O(\sgf_result_o_OBUF[26]_inst_i_8_n_0 ));
  (* HLUTNM = "lutpair66" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[26]_inst_i_9 
       (.I0(Q_middle_temp__6[8]),
        .I1(\EVEN1.left_high_n_9 ),
        .I2(sgf_result_o_OBUF[8]),
        .O(\sgf_result_o_OBUF[26]_inst_i_9_n_0 ));
  OBUF \sgf_result_o_OBUF[27]_inst 
       (.I(sgf_result_o_OBUF[27]),
        .O(sgf_result_o[27]));
  OBUF \sgf_result_o_OBUF[28]_inst 
       (.I(sgf_result_o_OBUF[28]),
        .O(sgf_result_o[28]));
  OBUF \sgf_result_o_OBUF[29]_inst 
       (.I(sgf_result_o_OBUF[29]),
        .O(sgf_result_o[29]));
  OBUF \sgf_result_o_OBUF[2]_inst 
       (.I(sgf_result_o_OBUF[2]),
        .O(sgf_result_o[2]));
  OBUF \sgf_result_o_OBUF[30]_inst 
       (.I(sgf_result_o_OBUF[30]),
        .O(sgf_result_o[30]));
  (* HLUTNM = "lutpair69" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[30]_inst_i_10 
       (.I0(Q_middle_temp__6[11]),
        .I1(\EVEN1.left_high_n_14 ),
        .I2(\EVEN1.right_lower_n_16 ),
        .O(\sgf_result_o_OBUF[30]_inst_i_10_n_0 ));
  (* HLUTNM = "lutpair73" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[30]_inst_i_11 
       (.I0(Q_middle_temp__6[15]),
        .I1(\EVEN1.left_high_n_18 ),
        .I2(\EVEN1.right_lower_n_18 ),
        .I3(\sgf_result_o_OBUF[30]_inst_i_7_n_0 ),
        .O(\sgf_result_o_OBUF[30]_inst_i_11_n_0 ));
  (* HLUTNM = "lutpair72" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[30]_inst_i_12 
       (.I0(Q_middle_temp__6[14]),
        .I1(\EVEN1.left_high_n_19 ),
        .I2(\EVEN1.right_lower_n_19 ),
        .I3(\sgf_result_o_OBUF[30]_inst_i_8_n_0 ),
        .O(\sgf_result_o_OBUF[30]_inst_i_12_n_0 ));
  (* HLUTNM = "lutpair71" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[30]_inst_i_13 
       (.I0(Q_middle_temp__6[13]),
        .I1(\EVEN1.left_high_n_20 ),
        .I2(\EVEN1.right_lower_n_20 ),
        .I3(\sgf_result_o_OBUF[30]_inst_i_9_n_0 ),
        .O(\sgf_result_o_OBUF[30]_inst_i_13_n_0 ));
  (* HLUTNM = "lutpair70" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[30]_inst_i_14 
       (.I0(Q_middle_temp__6[12]),
        .I1(\EVEN1.left_high_n_13 ),
        .I2(\EVEN1.right_lower_n_15 ),
        .I3(\sgf_result_o_OBUF[30]_inst_i_10_n_0 ),
        .O(\sgf_result_o_OBUF[30]_inst_i_14_n_0 ));
  (* HLUTNM = "lutpair72" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[30]_inst_i_7 
       (.I0(Q_middle_temp__6[14]),
        .I1(\EVEN1.left_high_n_19 ),
        .I2(\EVEN1.right_lower_n_19 ),
        .O(\sgf_result_o_OBUF[30]_inst_i_7_n_0 ));
  (* HLUTNM = "lutpair71" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[30]_inst_i_8 
       (.I0(Q_middle_temp__6[13]),
        .I1(\EVEN1.left_high_n_20 ),
        .I2(\EVEN1.right_lower_n_20 ),
        .O(\sgf_result_o_OBUF[30]_inst_i_8_n_0 ));
  (* HLUTNM = "lutpair70" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[30]_inst_i_9 
       (.I0(Q_middle_temp__6[12]),
        .I1(\EVEN1.left_high_n_13 ),
        .I2(\EVEN1.right_lower_n_15 ),
        .O(\sgf_result_o_OBUF[30]_inst_i_9_n_0 ));
  OBUF \sgf_result_o_OBUF[31]_inst 
       (.I(sgf_result_o_OBUF[31]),
        .O(sgf_result_o[31]));
  OBUF \sgf_result_o_OBUF[32]_inst 
       (.I(sgf_result_o_OBUF[32]),
        .O(sgf_result_o[32]));
  OBUF \sgf_result_o_OBUF[33]_inst 
       (.I(sgf_result_o_OBUF[33]),
        .O(sgf_result_o[33]));
  OBUF \sgf_result_o_OBUF[34]_inst 
       (.I(sgf_result_o_OBUF[34]),
        .O(sgf_result_o[34]));
  (* HLUTNM = "lutpair73" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[34]_inst_i_10 
       (.I0(Q_middle_temp__6[15]),
        .I1(\EVEN1.left_high_n_18 ),
        .I2(\EVEN1.right_lower_n_18 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_10_n_0 ));
  (* HLUTNM = "lutpair77" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[34]_inst_i_11 
       (.I0(Q_middle_temp__6[19]),
        .I1(\EVEN1.left_high_n_22 ),
        .I2(\EVEN1.right_lower_n_22 ),
        .I3(\sgf_result_o_OBUF[34]_inst_i_7_n_0 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_11_n_0 ));
  (* HLUTNM = "lutpair76" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[34]_inst_i_12 
       (.I0(Q_middle_temp__6[18]),
        .I1(\EVEN1.left_high_n_23 ),
        .I2(\EVEN1.right_lower_n_23 ),
        .I3(\sgf_result_o_OBUF[34]_inst_i_8_n_0 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_12_n_0 ));
  (* HLUTNM = "lutpair75" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[34]_inst_i_13 
       (.I0(Q_middle_temp__6[17]),
        .I1(\EVEN1.left_high_n_24 ),
        .I2(\EVEN1.right_lower_n_24 ),
        .I3(\sgf_result_o_OBUF[34]_inst_i_9_n_0 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_13_n_0 ));
  (* HLUTNM = "lutpair74" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[34]_inst_i_14 
       (.I0(Q_middle_temp__6[16]),
        .I1(\EVEN1.left_high_n_17 ),
        .I2(\EVEN1.right_lower_n_17 ),
        .I3(\sgf_result_o_OBUF[34]_inst_i_10_n_0 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_14_n_0 ));
  (* HLUTNM = "lutpair76" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[34]_inst_i_7 
       (.I0(Q_middle_temp__6[18]),
        .I1(\EVEN1.left_high_n_23 ),
        .I2(\EVEN1.right_lower_n_23 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_7_n_0 ));
  (* HLUTNM = "lutpair75" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[34]_inst_i_8 
       (.I0(Q_middle_temp__6[17]),
        .I1(\EVEN1.left_high_n_24 ),
        .I2(\EVEN1.right_lower_n_24 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_8_n_0 ));
  (* HLUTNM = "lutpair74" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[34]_inst_i_9 
       (.I0(Q_middle_temp__6[16]),
        .I1(\EVEN1.left_high_n_17 ),
        .I2(\EVEN1.right_lower_n_17 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_9_n_0 ));
  OBUF \sgf_result_o_OBUF[35]_inst 
       (.I(sgf_result_o_OBUF[35]),
        .O(sgf_result_o[35]));
  OBUF \sgf_result_o_OBUF[36]_inst 
       (.I(sgf_result_o_OBUF[36]),
        .O(sgf_result_o[36]));
  OBUF \sgf_result_o_OBUF[37]_inst 
       (.I(sgf_result_o_OBUF[37]),
        .O(sgf_result_o[37]));
  OBUF \sgf_result_o_OBUF[38]_inst 
       (.I(sgf_result_o_OBUF[38]),
        .O(sgf_result_o[38]));
  LUT4 #(
    .INIT(16'h8E71)) 
    \sgf_result_o_OBUF[38]_inst_i_10 
       (.I0(\EVEN1.right_lower_n_25 ),
        .I1(\EVEN1.left_high_n_25 ),
        .I2(Q_middle_temp__6[23]),
        .I3(Q_middle_temp__6[24]),
        .O(\sgf_result_o_OBUF[38]_inst_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[38]_inst_i_11 
       (.I0(Q_middle_temp__6[22]),
        .I1(\EVEN1.left_high_n_26 ),
        .I2(\EVEN1.right_lower_n_26 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[38]_inst_i_12 
       (.I0(Q_middle_temp__6[21]),
        .I1(\EVEN1.left_high_n_27 ),
        .I2(\EVEN1.right_lower_n_27 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[38]_inst_i_13 
       (.I0(Q_middle_temp__6[20]),
        .I1(\EVEN1.left_high_n_21 ),
        .I2(\EVEN1.right_lower_n_21 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_13_n_0 ));
  (* HLUTNM = "lutpair77" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[38]_inst_i_14 
       (.I0(Q_middle_temp__6[19]),
        .I1(\EVEN1.left_high_n_22 ),
        .I2(\EVEN1.right_lower_n_22 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[38]_inst_i_15 
       (.I0(\sgf_result_o_OBUF[38]_inst_i_11_n_0 ),
        .I1(Q_middle_temp__6[23]),
        .I2(\EVEN1.left_high_n_25 ),
        .I3(\EVEN1.right_lower_n_25 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[38]_inst_i_16 
       (.I0(Q_middle_temp__6[22]),
        .I1(\EVEN1.left_high_n_26 ),
        .I2(\EVEN1.right_lower_n_26 ),
        .I3(\sgf_result_o_OBUF[38]_inst_i_12_n_0 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[38]_inst_i_17 
       (.I0(Q_middle_temp__6[21]),
        .I1(\EVEN1.left_high_n_27 ),
        .I2(\EVEN1.right_lower_n_27 ),
        .I3(\sgf_result_o_OBUF[38]_inst_i_13_n_0 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[38]_inst_i_18 
       (.I0(Q_middle_temp__6[20]),
        .I1(\EVEN1.left_high_n_21 ),
        .I2(\EVEN1.right_lower_n_21 ),
        .I3(\sgf_result_o_OBUF[38]_inst_i_14_n_0 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_18_n_0 ));
  OBUF \sgf_result_o_OBUF[39]_inst 
       (.I(sgf_result_o_OBUF[39]),
        .O(sgf_result_o[39]));
  OBUF \sgf_result_o_OBUF[3]_inst 
       (.I(sgf_result_o_OBUF[3]),
        .O(sgf_result_o[3]));
  OBUF \sgf_result_o_OBUF[40]_inst 
       (.I(sgf_result_o_OBUF[40]),
        .O(sgf_result_o[40]));
  OBUF \sgf_result_o_OBUF[41]_inst 
       (.I(sgf_result_o_OBUF[41]),
        .O(sgf_result_o[41]));
  OBUF \sgf_result_o_OBUF[42]_inst 
       (.I(sgf_result_o_OBUF[42]),
        .O(sgf_result_o[42]));
  OBUF \sgf_result_o_OBUF[43]_inst 
       (.I(sgf_result_o_OBUF[43]),
        .O(sgf_result_o[43]));
  OBUF \sgf_result_o_OBUF[44]_inst 
       (.I(sgf_result_o_OBUF[44]),
        .O(sgf_result_o[44]));
  OBUF \sgf_result_o_OBUF[45]_inst 
       (.I(sgf_result_o_OBUF[45]),
        .O(sgf_result_o[45]));
  OBUF \sgf_result_o_OBUF[46]_inst 
       (.I(sgf_result_o_OBUF[46]),
        .O(sgf_result_o[46]));
  OBUF \sgf_result_o_OBUF[47]_inst 
       (.I(sgf_result_o_OBUF[47]),
        .O(sgf_result_o[47]));
  OBUF \sgf_result_o_OBUF[4]_inst 
       (.I(sgf_result_o_OBUF[4]),
        .O(sgf_result_o[4]));
  OBUF \sgf_result_o_OBUF[5]_inst 
       (.I(sgf_result_o_OBUF[5]),
        .O(sgf_result_o[5]));
  OBUF \sgf_result_o_OBUF[6]_inst 
       (.I(sgf_result_o_OBUF[6]),
        .O(sgf_result_o[6]));
  OBUF \sgf_result_o_OBUF[7]_inst 
       (.I(sgf_result_o_OBUF[7]),
        .O(sgf_result_o[7]));
  OBUF \sgf_result_o_OBUF[8]_inst 
       (.I(sgf_result_o_OBUF[8]),
        .O(sgf_result_o[8]));
  OBUF \sgf_result_o_OBUF[9]_inst 
       (.I(sgf_result_o_OBUF[9]),
        .O(sgf_result_o[9]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized0
   (\sgf_result_o[47] ,
    O,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[23] ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[39] ,
    \sgf_result_o[43] ,
    Data_A_i_IBUF,
    Data_B_i_IBUF,
    S,
    \Data_A_i[17] ,
    \Data_A_i[23] ,
    \Data_A_i[20] );
  output \sgf_result_o[47] ;
  output [1:0]O;
  output [3:0]\sgf_result_o[47]_0 ;
  output [1:0]\sgf_result_o[23] ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [3:0]\sgf_result_o[39] ;
  output [2:0]\sgf_result_o[43] ;
  input [11:0]Data_A_i_IBUF;
  input [11:0]Data_B_i_IBUF;
  input [0:0]S;
  input [0:0]\Data_A_i[17] ;
  input [0:0]\Data_A_i[23] ;
  input [2:0]\Data_A_i[20] ;

  wire [0:0]\Data_A_i[17] ;
  wire [2:0]\Data_A_i[20] ;
  wire [0:0]\Data_A_i[23] ;
  wire [11:0]Data_A_i_IBUF;
  wire [11:0]Data_B_i_IBUF;
  wire \EVEN1.left_high_n_11 ;
  wire \EVEN1.left_high_n_12 ;
  wire \EVEN1.left_high_n_13 ;
  wire \EVEN1.left_high_n_14 ;
  wire \EVEN1.left_high_n_15 ;
  wire \EVEN1.left_high_n_16 ;
  wire \EVEN1.left_high_n_17 ;
  wire \EVEN1.left_high_n_18 ;
  wire \EVEN1.left_high_n_19 ;
  wire \EVEN1.left_high_n_20 ;
  wire \EVEN1.left_high_n_21 ;
  wire \EVEN1.left_high_n_22 ;
  wire \EVEN1.left_high_n_23 ;
  wire \EVEN1.left_high_n_24 ;
  wire \EVEN1.left_high_n_25 ;
  wire \EVEN1.left_high_n_26 ;
  wire \EVEN1.left_high_n_27 ;
  wire \EVEN1.left_high_n_28 ;
  wire \EVEN1.left_high_n_29 ;
  wire \EVEN1.left_high_n_32 ;
  wire \EVEN1.left_high_n_33 ;
  wire \EVEN1.left_high_n_36 ;
  wire \EVEN1.left_high_n_37 ;
  wire \EVEN1.left_high_n_38 ;
  wire \EVEN1.left_high_n_39 ;
  wire \EVEN1.left_high_n_40 ;
  wire \EVEN1.left_high_n_41 ;
  wire \EVEN1.left_high_n_42 ;
  wire \EVEN1.left_high_n_43 ;
  wire \EVEN1.left_high_n_44 ;
  wire \EVEN1.left_high_n_45 ;
  wire \EVEN1.left_high_n_46 ;
  wire \EVEN1.left_high_n_47 ;
  wire \EVEN1.left_high_n_48 ;
  wire \EVEN1.left_high_n_49 ;
  wire \EVEN1.middle_n_0 ;
  wire \EVEN1.middle_n_1 ;
  wire \EVEN1.middle_n_10 ;
  wire \EVEN1.middle_n_11 ;
  wire \EVEN1.middle_n_12 ;
  wire \EVEN1.middle_n_13 ;
  wire \EVEN1.middle_n_14 ;
  wire \EVEN1.middle_n_15 ;
  wire \EVEN1.middle_n_16 ;
  wire \EVEN1.middle_n_17 ;
  wire \EVEN1.middle_n_18 ;
  wire \EVEN1.middle_n_19 ;
  wire \EVEN1.middle_n_2 ;
  wire \EVEN1.middle_n_20 ;
  wire \EVEN1.middle_n_21 ;
  wire \EVEN1.middle_n_22 ;
  wire \EVEN1.middle_n_23 ;
  wire \EVEN1.middle_n_24 ;
  wire \EVEN1.middle_n_25 ;
  wire \EVEN1.middle_n_26 ;
  wire \EVEN1.middle_n_27 ;
  wire \EVEN1.middle_n_28 ;
  wire \EVEN1.middle_n_29 ;
  wire \EVEN1.middle_n_3 ;
  wire \EVEN1.middle_n_30 ;
  wire \EVEN1.middle_n_4 ;
  wire \EVEN1.middle_n_5 ;
  wire \EVEN1.middle_n_6 ;
  wire \EVEN1.middle_n_7 ;
  wire \EVEN1.middle_n_8 ;
  wire \EVEN1.middle_n_9 ;
  wire \EVEN1.right_lower_n_4 ;
  wire \EVEN1.right_lower_n_5 ;
  wire \EVEN1.right_lower_n_6 ;
  wire \EVEN1.right_lower_n_7 ;
  wire \EVEN1.right_lower_n_8 ;
  wire \EVEN1.right_lower_n_9 ;
  wire [1:0]O;
  wire [13:3]Q_middle_temp__2;
  wire [0:0]S;
  wire S_B0__0_carry__0_i_10__1_n_0;
  wire S_B0__0_carry__0_i_7__1_n_0;
  wire S_B0__0_carry__0_i_8__1_n_0;
  wire S_B0__0_carry__0_i_9__1_n_0;
  wire S_B0__0_carry_i_11__1_n_0;
  wire S_B0__0_carry_i_12__1_n_0;
  wire S_B0__0_carry_i_13__0_n_0;
  wire S_B0__0_carry_i_8__1_n_0;
  wire S_B0__0_carry_i_9__1_n_0;
  wire S_B0__30_carry__0_i_1__0_n_0;
  wire S_B0__30_carry__0_i_2__0_n_0;
  wire S_B0__30_carry__0_i_3__0_n_0;
  wire S_B0__30_carry__0_i_4__0_n_0;
  wire S_B0__30_carry__0_i_5__0_n_0;
  wire S_B0__30_carry__0_i_6__0_n_0;
  wire S_B0__30_carry__0_i_7__0_n_0;
  wire S_B0__30_carry__0_i_8__0_n_0;
  wire S_B0__30_carry__1_i_13__0_n_0;
  wire S_B0__30_carry__1_i_1__0_n_0;
  wire S_B0__30_carry__1_i_2__0_n_0;
  wire S_B0__30_carry__1_i_3__0_n_0;
  wire S_B0__30_carry__1_i_4__0_n_0;
  wire S_B0__30_carry__1_i_5__0_n_0;
  wire S_B0__30_carry__1_i_6__0_n_0;
  wire S_B0__30_carry__1_i_7__0_n_0;
  wire S_B0__30_carry__1_i_8__0_n_0;
  wire S_B0__30_carry__2_i_1__0_n_0;
  wire S_B0__30_carry__2_i_2__0_n_0;
  wire S_B0__30_carry_i_13_n_0;
  wire S_B0__30_carry_i_17_n_0;
  wire S_B0_carry__0_i_5__0_n_0;
  wire [2:0]p_0_in;
  wire sgf_result_o0__1_carry__0_i_1__5_n_0;
  wire sgf_result_o0__1_carry__0_i_2__4_n_0;
  wire sgf_result_o0__1_carry__0_i_3__6_n_0;
  wire sgf_result_o0__1_carry__0_i_4__5_n_0;
  wire sgf_result_o0__1_carry__0_i_5__7_n_0;
  wire sgf_result_o0__1_carry__0_i_6__5_n_0;
  wire sgf_result_o0__1_carry__0_i_7__2_n_0;
  wire sgf_result_o0__1_carry__0_i_8__4_n_0;
  wire sgf_result_o0__1_carry__0_i_9__2_n_0;
  wire sgf_result_o0__1_carry_i_10__1_n_0;
  wire sgf_result_o0__1_carry_i_11__5_n_0;
  wire sgf_result_o0__1_carry_i_12_n_0;
  wire sgf_result_o0__1_carry_i_13_n_0;
  wire sgf_result_o0__1_carry_i_14_n_0;
  wire sgf_result_o0__1_carry_i_15_n_0;
  wire sgf_result_o0__1_carry_i_16_n_0;
  wire sgf_result_o0__1_carry_i_17_n_0;
  wire sgf_result_o0__1_carry_i_18_n_0;
  wire sgf_result_o0__1_carry_i_19_n_0;
  wire sgf_result_o0__1_carry_i_1__5_n_0;
  wire sgf_result_o0__1_carry_i_2__5_n_0;
  wire sgf_result_o0__1_carry_i_3__5_n_0;
  wire sgf_result_o0__1_carry_i_4__5_n_0;
  wire sgf_result_o0__1_carry_i_5__5_n_0;
  wire sgf_result_o0__1_carry_i_6__4_n_0;
  wire sgf_result_o0__1_carry_i_7__5_n_0;
  wire sgf_result_o0__1_carry_i_8__9_n_0;
  wire sgf_result_o0__1_carry_i_8__9_n_1;
  wire sgf_result_o0__1_carry_i_8__9_n_2;
  wire sgf_result_o0__1_carry_i_8__9_n_3;
  wire sgf_result_o0__1_carry_i_8__9_n_4;
  wire sgf_result_o0__1_carry_i_8__9_n_5;
  wire sgf_result_o0__1_carry_i_8__9_n_6;
  wire sgf_result_o0__1_carry_i_8__9_n_7;
  wire sgf_result_o0__1_carry_i_9__4_n_0;
  wire sgf_result_o0__1_carry_i_9__4_n_1;
  wire sgf_result_o0__1_carry_i_9__4_n_2;
  wire sgf_result_o0__1_carry_i_9__4_n_3;
  wire sgf_result_o0__1_carry_i_9__4_n_4;
  wire sgf_result_o0__1_carry_i_9__4_n_5;
  wire sgf_result_o0__1_carry_i_9__4_n_6;
  wire sgf_result_o0__1_carry_i_9__4_n_7;
  wire sgf_result_o1__0_carry_i_13__1_n_1;
  wire sgf_result_o1__0_carry_i_13__1_n_3;
  wire sgf_result_o1__0_carry_i_13__1_n_6;
  wire sgf_result_o1__0_carry_i_13__1_n_7;
  wire sgf_result_o1__0_carry_i_18__0_n_3;
  wire sgf_result_o1__0_carry_i_20_n_0;
  wire sgf_result_o1__0_carry_i_21_n_0;
  wire sgf_result_o1__0_carry_i_22_n_0;
  wire sgf_result_o1__0_carry_i_23_n_0;
  wire sgf_result_o1__21_carry__0_i_10__0_n_0;
  wire sgf_result_o1__21_carry__0_i_9__0_n_0;
  wire sgf_result_o1__21_carry_i_10__0_n_0;
  wire sgf_result_o1__21_carry_i_8__0_n_0;
  wire sgf_result_o1__21_carry_i_9__0_n_0;
  wire sgf_result_o1_carry_i_4__0_n_0;
  wire [1:0]\sgf_result_o[23] ;
  wire [3:0]\sgf_result_o[39] ;
  wire [2:0]\sgf_result_o[43] ;
  wire \sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:1]NLW_sgf_result_o1__0_carry_i_13__1_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o1__0_carry_i_13__1_O_UNCONNECTED;
  wire [3:1]NLW_sgf_result_o1__0_carry_i_18__0_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o1__0_carry_i_18__0_O_UNCONNECTED;

  Recursive_KOA__parameterized1 \EVEN1.left_high 
       (.DI({\EVEN1.middle_n_9 ,\EVEN1.middle_n_10 ,\EVEN1.middle_n_11 }),
        .\Data_A_i[14] ({S_B0__30_carry__0_i_5__0_n_0,S_B0__30_carry__0_i_6__0_n_0,S_B0__30_carry__0_i_7__0_n_0,S_B0__30_carry__0_i_8__0_n_0}),
        .\Data_A_i[14]_0 ({S_B0__30_carry__1_i_5__0_n_0,S_B0__30_carry__1_i_6__0_n_0,S_B0__30_carry__1_i_7__0_n_0,S_B0__30_carry__1_i_8__0_n_0}),
        .\Data_A_i[14]_1 ({\EVEN1.right_lower_n_8 ,\EVEN1.right_lower_n_9 }),
        .\Data_A_i[17] ({S_B0__30_carry__0_i_1__0_n_0,S_B0__30_carry__0_i_2__0_n_0,S_B0__30_carry__0_i_3__0_n_0,S_B0__30_carry__0_i_4__0_n_0}),
        .\Data_A_i[17]_0 ({\EVEN1.right_lower_n_4 ,\EVEN1.right_lower_n_5 ,\EVEN1.right_lower_n_6 ,\EVEN1.right_lower_n_7 }),
        .\Data_A_i[18] ({\EVEN1.middle_n_4 ,\EVEN1.middle_n_5 ,\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 }),
        .\Data_A_i[18]_0 (\EVEN1.middle_n_8 ),
        .\Data_A_i[18]_1 ({S_B0__30_carry__2_i_1__0_n_0,S_B0__30_carry__2_i_2__0_n_0}),
        .\Data_A_i[20] ({S_B0__30_carry__1_i_1__0_n_0,S_B0__30_carry__1_i_2__0_n_0,S_B0__30_carry__1_i_3__0_n_0,S_B0__30_carry__1_i_4__0_n_0}),
        .\Data_A_i[20]_0 (S_B0__30_carry_i_13_n_0),
        .\Data_A_i[23] ({\EVEN1.middle_n_27 ,\EVEN1.middle_n_28 ,\EVEN1.middle_n_29 ,\EVEN1.middle_n_30 }),
        .Data_A_i_IBUF(Data_A_i_IBUF[11:6]),
        .\Data_B_i[18] ({\EVEN1.middle_n_23 ,\EVEN1.middle_n_24 ,\EVEN1.middle_n_25 ,\EVEN1.middle_n_26 }),
        .\Data_B_i[18]_0 ({\EVEN1.middle_n_16 ,\EVEN1.middle_n_17 ,\EVEN1.middle_n_18 }),
        .\Data_B_i[22] (S),
        .Data_B_i_IBUF(Data_B_i_IBUF[11:6]),
        .O({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 ,\EVEN1.middle_n_3 }),
        .Q_middle_temp__2(Q_middle_temp__2),
        .S({\EVEN1.middle_n_19 ,\EVEN1.middle_n_20 ,\EVEN1.middle_n_21 ,\EVEN1.middle_n_22 }),
        .\sgf_result_o[19] ({\EVEN1.left_high_n_26 ,\EVEN1.left_high_n_27 ,\EVEN1.left_high_n_28 ,\EVEN1.left_high_n_29 }),
        .\sgf_result_o[23] ({\sgf_result_o[23] ,\EVEN1.left_high_n_32 ,\EVEN1.left_high_n_33 }),
        .\sgf_result_o[23]_0 (O),
        .\sgf_result_o[27] ({\EVEN1.left_high_n_19 ,\EVEN1.left_high_n_20 ,\EVEN1.left_high_n_21 ,\EVEN1.left_high_n_22 }),
        .\sgf_result_o[27]_0 ({\EVEN1.left_high_n_23 ,\EVEN1.left_high_n_24 }),
        .\sgf_result_o[27]_1 ({\EVEN1.left_high_n_47 ,\EVEN1.left_high_n_48 ,\EVEN1.left_high_n_49 }),
        .\sgf_result_o[43] (\EVEN1.left_high_n_25 ),
        .\sgf_result_o[47] ({\EVEN1.left_high_n_11 ,\EVEN1.left_high_n_12 ,\EVEN1.left_high_n_13 ,\EVEN1.left_high_n_14 }),
        .\sgf_result_o[47]_0 ({\EVEN1.left_high_n_15 ,\EVEN1.left_high_n_16 ,\EVEN1.left_high_n_17 ,\EVEN1.left_high_n_18 }),
        .\sgf_result_o[47]_1 ({\EVEN1.left_high_n_36 ,\EVEN1.left_high_n_37 ,\EVEN1.left_high_n_38 }),
        .\sgf_result_o[47]_2 ({\EVEN1.left_high_n_39 ,\EVEN1.left_high_n_40 ,\EVEN1.left_high_n_41 ,\EVEN1.left_high_n_42 }),
        .\sgf_result_o[47]_3 ({\EVEN1.left_high_n_43 ,\EVEN1.left_high_n_44 ,\EVEN1.left_high_n_45 ,\EVEN1.left_high_n_46 }));
  Recursive_KOA__parameterized9 \EVEN1.middle 
       (.CO(sgf_result_o1__0_carry_i_13__1_n_1),
        .DI({sgf_result_o0__1_carry_i_1__5_n_0,sgf_result_o0__1_carry_i_2__5_n_0,sgf_result_o0__1_carry_i_3__5_n_0}),
        .\Data_A_i[14] ({\EVEN1.left_high_n_19 ,\EVEN1.left_high_n_20 ,\EVEN1.left_high_n_21 ,\EVEN1.left_high_n_22 }),
        .\Data_A_i[14]_0 ({\EVEN1.left_high_n_43 ,\EVEN1.left_high_n_44 ,\EVEN1.left_high_n_45 ,\EVEN1.left_high_n_46 }),
        .\Data_A_i[14]_1 ({\EVEN1.left_high_n_23 ,\EVEN1.left_high_n_24 }),
        .\Data_A_i[17] (\sgf_result_o[47]_0 [1:0]),
        .\Data_A_i[17]_0 ({\EVEN1.left_high_n_11 ,\EVEN1.left_high_n_12 ,\EVEN1.left_high_n_13 ,\EVEN1.left_high_n_14 }),
        .\Data_A_i[17]_1 ({\EVEN1.left_high_n_15 ,\EVEN1.left_high_n_16 ,\EVEN1.left_high_n_17 ,\EVEN1.left_high_n_18 }),
        .\Data_A_i[17]_2 ({\EVEN1.left_high_n_39 ,\EVEN1.left_high_n_40 ,\EVEN1.left_high_n_41 ,\EVEN1.left_high_n_42 }),
        .\Data_A_i[18] ({sgf_result_o0__1_carry__0_i_4__5_n_0,sgf_result_o0__1_carry__0_i_5__7_n_0,sgf_result_o0__1_carry__0_i_6__5_n_0}),
        .\Data_A_i[18]_0 ({sgf_result_o0__1_carry_i_9__4_n_4,sgf_result_o0__1_carry_i_9__4_n_5,sgf_result_o0__1_carry_i_9__4_n_6,sgf_result_o0__1_carry_i_9__4_n_7}),
        .\Data_A_i[18]_1 (sgf_result_o1__21_carry_i_10__0_n_0),
        .\Data_A_i[18]_2 (sgf_result_o1__21_carry__0_i_10__0_n_0),
        .\Data_A_i[18]_3 (sgf_result_o1__21_carry_i_8__0_n_0),
        .\Data_A_i[18]_4 (sgf_result_o1__21_carry_i_9__0_n_0),
        .\Data_A_i[20] (\Data_A_i[20] ),
        .\Data_A_i[22] (sgf_result_o1_carry_i_4__0_n_0),
        .\Data_A_i[23] ({\EVEN1.left_high_n_28 ,\EVEN1.left_high_n_29 }),
        .\Data_A_i[23]_0 ({\EVEN1.left_high_n_36 ,\EVEN1.left_high_n_37 ,\EVEN1.left_high_n_38 ,\Data_A_i[17] }),
        .\Data_A_i[23]_1 ({\Data_A_i[23] ,\EVEN1.left_high_n_47 ,\EVEN1.left_high_n_48 ,\EVEN1.left_high_n_49 }),
        .Data_A_i_IBUF({Data_A_i_IBUF[7:6],Data_A_i_IBUF[0]}),
        .\Data_B_i[12] (\sgf_result_o[47] ),
        .\Data_B_i[18] ({sgf_result_o0__1_carry__0_i_1__5_n_0,sgf_result_o0__1_carry__0_i_2__4_n_0,sgf_result_o0__1_carry__0_i_3__6_n_0}),
        .\Data_B_i[18]_0 ({sgf_result_o0__1_carry_i_8__9_n_4,sgf_result_o0__1_carry_i_8__9_n_5,sgf_result_o0__1_carry_i_8__9_n_6,sgf_result_o0__1_carry_i_8__9_n_7}),
        .\Data_B_i[18]_1 ({sgf_result_o1__0_carry_i_13__1_n_6,sgf_result_o1__0_carry_i_13__1_n_7}),
        .\Data_B_i[18]_2 (sgf_result_o1__21_carry__0_i_9__0_n_0),
        .\Data_B_i[18]_3 (S_B0_carry__0_i_5__0_n_0),
        .\Data_B_i[18]_4 (\EVEN1.left_high_n_25 ),
        .Data_B_i_IBUF({Data_B_i_IBUF[7:6],Data_B_i_IBUF[0]}),
        .O({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 ,\EVEN1.middle_n_3 }),
        .Q_middle_temp__2(Q_middle_temp__2[3]),
        .S({sgf_result_o0__1_carry_i_4__5_n_0,sgf_result_o0__1_carry_i_5__5_n_0,sgf_result_o0__1_carry_i_6__4_n_0,sgf_result_o0__1_carry_i_7__5_n_0}),
        .p_0_in(p_0_in),
        .\sgf_result_o[15] (\EVEN1.middle_n_12 ),
        .\sgf_result_o[15]_0 (\EVEN1.middle_n_13 ),
        .\sgf_result_o[15]_1 (\EVEN1.middle_n_14 ),
        .\sgf_result_o[15]_2 (\EVEN1.middle_n_15 ),
        .\sgf_result_o[19] ({\EVEN1.middle_n_23 ,\EVEN1.middle_n_24 ,\EVEN1.middle_n_25 ,\EVEN1.middle_n_26 }),
        .\sgf_result_o[23] ({\EVEN1.middle_n_4 ,\EVEN1.middle_n_5 ,\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 }),
        .\sgf_result_o[23]_0 (\EVEN1.middle_n_8 ),
        .\sgf_result_o[23]_1 ({\EVEN1.middle_n_16 ,\EVEN1.middle_n_17 ,\EVEN1.middle_n_18 }),
        .\sgf_result_o[39] (\sgf_result_o[39] ),
        .\sgf_result_o[43] (\sgf_result_o[43] ),
        .\sgf_result_o[47] ({\EVEN1.middle_n_9 ,\EVEN1.middle_n_10 ,\EVEN1.middle_n_11 }),
        .\sgf_result_o[47]_0 ({\EVEN1.middle_n_19 ,\EVEN1.middle_n_20 ,\EVEN1.middle_n_21 ,\EVEN1.middle_n_22 }),
        .\sgf_result_o[47]_1 ({\EVEN1.middle_n_27 ,\EVEN1.middle_n_28 ,\EVEN1.middle_n_29 ,\EVEN1.middle_n_30 }),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_4 (\sgf_result_o[47]_3 ));
  Recursive_KOA__parameterized5 \EVEN1.right_lower 
       (.\Data_A_i[14] (S_B0__0_carry_i_8__1_n_0),
        .\Data_A_i[14]_0 (S_B0__0_carry_i_12__1_n_0),
        .\Data_A_i[14]_1 (S_B0__0_carry__0_i_7__1_n_0),
        .\Data_A_i[17] (S_B0__0_carry_i_9__1_n_0),
        .\Data_A_i[17]_0 (S_B0__0_carry_i_11__1_n_0),
        .\Data_A_i[17]_1 (S_B0__0_carry__0_i_8__1_n_0),
        .Data_A_i_IBUF(Data_A_i_IBUF[5:0]),
        .\Data_B_i[12] (\sgf_result_o[47] ),
        .\Data_B_i[13] (S_B0__0_carry__0_i_9__1_n_0),
        .\Data_B_i[15] (S_B0__0_carry_i_13__0_n_0),
        .\Data_B_i[16] (S_B0__0_carry__0_i_10__1_n_0),
        .\Data_B_i[16]_0 (S_B0__30_carry__1_i_13__0_n_0),
        .Data_B_i_IBUF(Data_B_i_IBUF[5:0]),
        .S(S_B0__30_carry_i_17_n_0),
        .\sgf_result_o[47] (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_0 ({\EVEN1.right_lower_n_4 ,\EVEN1.right_lower_n_5 ,\EVEN1.right_lower_n_6 ,\EVEN1.right_lower_n_7 }),
        .\sgf_result_o[47]_1 ({\EVEN1.right_lower_n_8 ,\EVEN1.right_lower_n_9 }));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__0_carry__0_i_10__1
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_B_i_IBUF[5]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_B_i_IBUF[4]),
        .O(S_B0__0_carry__0_i_10__1_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_7__1
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry__0_i_7__1_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_8__1
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry__0_i_8__1_n_0));
  LUT6 #(
    .INIT(64'h55FF7FFF7FFFFFFF)) 
    S_B0__0_carry__0_i_9__1
       (.I0(Data_A_i_IBUF[2]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_B_i_IBUF[2]),
        .I4(Data_A_i_IBUF[1]),
        .I5(Data_B_i_IBUF[1]),
        .O(S_B0__0_carry__0_i_9__1_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_10__0
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[0]),
        .O(\sgf_result_o[47] ));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_11__1
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry_i_11__1_n_0));
  LUT6 #(
    .INIT(64'h12E2EA6A48C040C0)) 
    S_B0__0_carry_i_12__1
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry_i_12__1_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_13__0
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_B_i_IBUF[3]),
        .O(S_B0__0_carry_i_13__0_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_8__1
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry_i_8__1_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_9__1
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry_i_9__1_n_0));
  (* HLUTNM = "lutpair35" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__0_i_1__0
       (.I0(Q_middle_temp__2[6]),
        .I1(\EVEN1.left_high_n_33 ),
        .I2(\EVEN1.right_lower_n_7 ),
        .O(S_B0__30_carry__0_i_1__0_n_0));
  (* HLUTNM = "lutpair34" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__0_i_2__0
       (.I0(Q_middle_temp__2[5]),
        .I1(\EVEN1.left_high_n_26 ),
        .I2(\sgf_result_o[47]_0 [3]),
        .O(S_B0__30_carry__0_i_2__0_n_0));
  (* HLUTNM = "lutpair33" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__0_i_3__0
       (.I0(Q_middle_temp__2[4]),
        .I1(\EVEN1.left_high_n_27 ),
        .I2(\sgf_result_o[47]_0 [2]),
        .O(S_B0__30_carry__0_i_3__0_n_0));
  (* HLUTNM = "lutpair32" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__0_i_4__0
       (.I0(Q_middle_temp__2[3]),
        .I1(\EVEN1.left_high_n_28 ),
        .I2(\sgf_result_o[47]_0 [1]),
        .O(S_B0__30_carry__0_i_4__0_n_0));
  (* HLUTNM = "lutpair36" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__0_i_5__0
       (.I0(Q_middle_temp__2[7]),
        .I1(\EVEN1.left_high_n_32 ),
        .I2(\EVEN1.right_lower_n_6 ),
        .I3(S_B0__30_carry__0_i_1__0_n_0),
        .O(S_B0__30_carry__0_i_5__0_n_0));
  (* HLUTNM = "lutpair35" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__0_i_6__0
       (.I0(Q_middle_temp__2[6]),
        .I1(\EVEN1.left_high_n_33 ),
        .I2(\EVEN1.right_lower_n_7 ),
        .I3(S_B0__30_carry__0_i_2__0_n_0),
        .O(S_B0__30_carry__0_i_6__0_n_0));
  (* HLUTNM = "lutpair34" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__0_i_7__0
       (.I0(Q_middle_temp__2[5]),
        .I1(\EVEN1.left_high_n_26 ),
        .I2(\sgf_result_o[47]_0 [3]),
        .I3(S_B0__30_carry__0_i_3__0_n_0),
        .O(S_B0__30_carry__0_i_7__0_n_0));
  (* HLUTNM = "lutpair33" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__0_i_8__0
       (.I0(Q_middle_temp__2[4]),
        .I1(\EVEN1.left_high_n_27 ),
        .I2(\sgf_result_o[47]_0 [2]),
        .I3(S_B0__30_carry__0_i_4__0_n_0),
        .O(S_B0__30_carry__0_i_8__0_n_0));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__30_carry__1_i_13__0
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_B_i_IBUF[5]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_B_i_IBUF[4]),
        .O(S_B0__30_carry__1_i_13__0_n_0));
  (* HLUTNM = "lutpair39" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__1_i_1__0
       (.I0(Q_middle_temp__2[10]),
        .I1(O[0]),
        .I2(\EVEN1.right_lower_n_9 ),
        .O(S_B0__30_carry__1_i_1__0_n_0));
  (* HLUTNM = "lutpair38" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__1_i_2__0
       (.I0(Q_middle_temp__2[9]),
        .I1(\sgf_result_o[23] [1]),
        .I2(\EVEN1.right_lower_n_4 ),
        .O(S_B0__30_carry__1_i_2__0_n_0));
  (* HLUTNM = "lutpair37" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__1_i_3__0
       (.I0(Q_middle_temp__2[8]),
        .I1(\sgf_result_o[23] [0]),
        .I2(\EVEN1.right_lower_n_5 ),
        .O(S_B0__30_carry__1_i_3__0_n_0));
  (* HLUTNM = "lutpair36" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__1_i_4__0
       (.I0(Q_middle_temp__2[7]),
        .I1(\EVEN1.left_high_n_32 ),
        .I2(\EVEN1.right_lower_n_6 ),
        .O(S_B0__30_carry__1_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__1_i_5__0
       (.I0(S_B0__30_carry__1_i_1__0_n_0),
        .I1(Q_middle_temp__2[11]),
        .I2(O[1]),
        .I3(\EVEN1.right_lower_n_8 ),
        .O(S_B0__30_carry__1_i_5__0_n_0));
  (* HLUTNM = "lutpair39" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__1_i_6__0
       (.I0(Q_middle_temp__2[10]),
        .I1(O[0]),
        .I2(\EVEN1.right_lower_n_9 ),
        .I3(S_B0__30_carry__1_i_2__0_n_0),
        .O(S_B0__30_carry__1_i_6__0_n_0));
  (* HLUTNM = "lutpair38" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__1_i_7__0
       (.I0(Q_middle_temp__2[9]),
        .I1(\sgf_result_o[23] [1]),
        .I2(\EVEN1.right_lower_n_4 ),
        .I3(S_B0__30_carry__1_i_3__0_n_0),
        .O(S_B0__30_carry__1_i_7__0_n_0));
  (* HLUTNM = "lutpair37" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__1_i_8__0
       (.I0(Q_middle_temp__2[8]),
        .I1(\sgf_result_o[23] [0]),
        .I2(\EVEN1.right_lower_n_5 ),
        .I3(S_B0__30_carry__1_i_4__0_n_0),
        .O(S_B0__30_carry__1_i_8__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    S_B0__30_carry__2_i_1__0
       (.I0(Q_middle_temp__2[13]),
        .O(S_B0__30_carry__2_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h8E71)) 
    S_B0__30_carry__2_i_2__0
       (.I0(\EVEN1.right_lower_n_8 ),
        .I1(O[1]),
        .I2(Q_middle_temp__2[11]),
        .I3(Q_middle_temp__2[12]),
        .O(S_B0__30_carry__2_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__30_carry_i_13
       (.I0(Data_B_i_IBUF[7]),
        .I1(Data_A_i_IBUF[7]),
        .I2(Data_B_i_IBUF[8]),
        .I3(Data_A_i_IBUF[6]),
        .I4(Data_B_i_IBUF[6]),
        .I5(Data_A_i_IBUF[8]),
        .O(S_B0__30_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__30_carry_i_17
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__30_carry_i_17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    S_B0_carry__0_i_5__0
       (.I0(p_0_in[1]),
        .I1(sgf_result_o1__0_carry_i_13__1_n_6),
        .O(S_B0_carry__0_i_5__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_1__5
       (.I0(sgf_result_o0__1_carry_i_9__4_n_4),
        .I1(sgf_result_o0__1_carry_i_8__9_n_4),
        .O(sgf_result_o0__1_carry__0_i_1__5_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    sgf_result_o0__1_carry__0_i_2__4
       (.I0(sgf_result_o0__1_carry_i_10__1_n_0),
        .I1(sgf_result_o0__1_carry_i_8__9_n_6),
        .I2(sgf_result_o0__1_carry_i_9__4_n_7),
        .I3(sgf_result_o0__1_carry_i_8__9_n_7),
        .I4(sgf_result_o0__1_carry_i_9__4_n_4),
        .I5(sgf_result_o0__1_carry__0_i_7__2_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__4_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    sgf_result_o0__1_carry__0_i_3__6
       (.I0(sgf_result_o0__1_carry_i_10__1_n_0),
        .I1(sgf_result_o0__1_carry_i_8__9_n_6),
        .I2(sgf_result_o0__1_carry_i_9__4_n_7),
        .I3(sgf_result_o0__1_carry_i_8__9_n_7),
        .I4(sgf_result_o0__1_carry_i_9__4_n_4),
        .I5(sgf_result_o0__1_carry__0_i_7__2_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__6_n_0));
  LUT6 #(
    .INIT(64'h173F8080C0000000)) 
    sgf_result_o0__1_carry__0_i_4__5
       (.I0(sgf_result_o0__1_carry_i_8__9_n_6),
        .I1(sgf_result_o0__1_carry_i_9__4_n_5),
        .I2(sgf_result_o0__1_carry_i_8__9_n_5),
        .I3(sgf_result_o0__1_carry_i_9__4_n_6),
        .I4(sgf_result_o0__1_carry_i_8__9_n_4),
        .I5(sgf_result_o0__1_carry_i_9__4_n_4),
        .O(sgf_result_o0__1_carry__0_i_4__5_n_0));
  LUT6 #(
    .INIT(64'h9666699969996999)) 
    sgf_result_o0__1_carry__0_i_5__7
       (.I0(sgf_result_o0__1_carry__0_i_2__4_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__4_n_0),
        .I2(sgf_result_o0__1_carry_i_9__4_n_4),
        .I3(sgf_result_o0__1_carry_i_8__9_n_5),
        .I4(sgf_result_o0__1_carry_i_9__4_n_5),
        .I5(sgf_result_o0__1_carry_i_8__9_n_4),
        .O(sgf_result_o0__1_carry__0_i_5__7_n_0));
  LUT6 #(
    .INIT(64'h56666AAA6AAA6AAA)) 
    sgf_result_o0__1_carry__0_i_6__5
       (.I0(sgf_result_o0__1_carry__0_i_3__6_n_0),
        .I1(sgf_result_o0__1_carry__0_i_9__2_n_0),
        .I2(sgf_result_o0__1_carry_i_9__4_n_6),
        .I3(sgf_result_o0__1_carry_i_8__9_n_5),
        .I4(sgf_result_o0__1_carry_i_9__4_n_7),
        .I5(sgf_result_o0__1_carry_i_8__9_n_4),
        .O(sgf_result_o0__1_carry__0_i_6__5_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry__0_i_7__2
       (.I0(sgf_result_o0__1_carry_i_8__9_n_6),
        .I1(sgf_result_o0__1_carry_i_9__4_n_4),
        .I2(sgf_result_o0__1_carry_i_9__4_n_5),
        .I3(sgf_result_o0__1_carry_i_8__9_n_5),
        .I4(sgf_result_o0__1_carry_i_9__4_n_6),
        .I5(sgf_result_o0__1_carry_i_8__9_n_4),
        .O(sgf_result_o0__1_carry__0_i_7__2_n_0));
  LUT6 #(
    .INIT(64'h07777FFF7FFF7FFF)) 
    sgf_result_o0__1_carry__0_i_8__4
       (.I0(sgf_result_o0__1_carry_i_8__9_n_4),
        .I1(sgf_result_o0__1_carry_i_9__4_n_6),
        .I2(sgf_result_o0__1_carry_i_8__9_n_5),
        .I3(sgf_result_o0__1_carry_i_9__4_n_5),
        .I4(sgf_result_o0__1_carry_i_9__4_n_4),
        .I5(sgf_result_o0__1_carry_i_8__9_n_6),
        .O(sgf_result_o0__1_carry__0_i_8__4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_9__2
       (.I0(sgf_result_o0__1_carry_i_9__4_n_5),
        .I1(sgf_result_o0__1_carry_i_8__9_n_6),
        .O(sgf_result_o0__1_carry__0_i_9__2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_10__1
       (.I0(sgf_result_o0__1_carry_i_9__4_n_6),
        .I1(sgf_result_o0__1_carry_i_8__9_n_5),
        .O(sgf_result_o0__1_carry_i_10__1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_11__5
       (.I0(sgf_result_o0__1_carry_i_8__9_n_7),
        .I1(sgf_result_o0__1_carry_i_9__4_n_4),
        .O(sgf_result_o0__1_carry_i_11__5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_12
       (.I0(Data_B_i_IBUF[3]),
        .I1(Data_B_i_IBUF[9]),
        .O(sgf_result_o0__1_carry_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_13
       (.I0(Data_B_i_IBUF[2]),
        .I1(Data_B_i_IBUF[8]),
        .O(sgf_result_o0__1_carry_i_13_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_14
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[7]),
        .O(sgf_result_o0__1_carry_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_15
       (.I0(Data_B_i_IBUF[0]),
        .I1(Data_B_i_IBUF[6]),
        .O(sgf_result_o0__1_carry_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_16
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[9]),
        .O(sgf_result_o0__1_carry_i_16_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_17
       (.I0(Data_A_i_IBUF[2]),
        .I1(Data_A_i_IBUF[8]),
        .O(sgf_result_o0__1_carry_i_17_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_18
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[7]),
        .O(sgf_result_o0__1_carry_i_18_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_19
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_A_i_IBUF[6]),
        .O(sgf_result_o0__1_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_1__5
       (.I0(sgf_result_o0__1_carry_i_8__9_n_6),
        .I1(sgf_result_o0__1_carry_i_9__4_n_5),
        .I2(sgf_result_o0__1_carry_i_9__4_n_6),
        .I3(sgf_result_o0__1_carry_i_8__9_n_5),
        .I4(sgf_result_o0__1_carry_i_9__4_n_7),
        .I5(sgf_result_o0__1_carry_i_8__9_n_4),
        .O(sgf_result_o0__1_carry_i_1__5_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_2__5
       (.I0(sgf_result_o0__1_carry_i_8__9_n_6),
        .I1(sgf_result_o0__1_carry_i_9__4_n_6),
        .I2(sgf_result_o0__1_carry_i_8__9_n_5),
        .I3(sgf_result_o0__1_carry_i_9__4_n_7),
        .O(sgf_result_o0__1_carry_i_2__5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_3__5
       (.I0(sgf_result_o0__1_carry_i_9__4_n_7),
        .I1(sgf_result_o0__1_carry_i_8__9_n_6),
        .O(sgf_result_o0__1_carry_i_3__5_n_0));
  LUT6 #(
    .INIT(64'h99A5C30F665A3CF0)) 
    sgf_result_o0__1_carry_i_4__5
       (.I0(sgf_result_o0__1_carry_i_8__9_n_4),
        .I1(sgf_result_o0__1_carry_i_9__4_n_5),
        .I2(sgf_result_o0__1_carry_i_10__1_n_0),
        .I3(sgf_result_o0__1_carry_i_8__9_n_6),
        .I4(sgf_result_o0__1_carry_i_9__4_n_7),
        .I5(sgf_result_o0__1_carry_i_11__5_n_0),
        .O(sgf_result_o0__1_carry_i_4__5_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_5__5
       (.I0(sgf_result_o0__1_carry_i_9__4_n_7),
        .I1(sgf_result_o0__1_carry_i_8__9_n_5),
        .I2(sgf_result_o0__1_carry_i_9__4_n_6),
        .I3(sgf_result_o0__1_carry_i_8__9_n_6),
        .I4(sgf_result_o0__1_carry_i_9__4_n_5),
        .I5(sgf_result_o0__1_carry_i_8__9_n_7),
        .O(sgf_result_o0__1_carry_i_5__5_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_6__4
       (.I0(sgf_result_o0__1_carry_i_9__4_n_6),
        .I1(sgf_result_o0__1_carry_i_8__9_n_7),
        .I2(sgf_result_o0__1_carry_i_8__9_n_6),
        .I3(sgf_result_o0__1_carry_i_9__4_n_7),
        .O(sgf_result_o0__1_carry_i_6__4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_7__5
       (.I0(sgf_result_o0__1_carry_i_8__9_n_7),
        .I1(sgf_result_o0__1_carry_i_9__4_n_7),
        .O(sgf_result_o0__1_carry_i_7__5_n_0));
  CARRY4 sgf_result_o0__1_carry_i_8__9
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_i_8__9_n_0,sgf_result_o0__1_carry_i_8__9_n_1,sgf_result_o0__1_carry_i_8__9_n_2,sgf_result_o0__1_carry_i_8__9_n_3}),
        .CYINIT(1'b0),
        .DI(Data_B_i_IBUF[3:0]),
        .O({sgf_result_o0__1_carry_i_8__9_n_4,sgf_result_o0__1_carry_i_8__9_n_5,sgf_result_o0__1_carry_i_8__9_n_6,sgf_result_o0__1_carry_i_8__9_n_7}),
        .S({sgf_result_o0__1_carry_i_12_n_0,sgf_result_o0__1_carry_i_13_n_0,sgf_result_o0__1_carry_i_14_n_0,sgf_result_o0__1_carry_i_15_n_0}));
  CARRY4 sgf_result_o0__1_carry_i_9__4
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_i_9__4_n_0,sgf_result_o0__1_carry_i_9__4_n_1,sgf_result_o0__1_carry_i_9__4_n_2,sgf_result_o0__1_carry_i_9__4_n_3}),
        .CYINIT(1'b0),
        .DI(Data_A_i_IBUF[3:0]),
        .O({sgf_result_o0__1_carry_i_9__4_n_4,sgf_result_o0__1_carry_i_9__4_n_5,sgf_result_o0__1_carry_i_9__4_n_6,sgf_result_o0__1_carry_i_9__4_n_7}),
        .S({sgf_result_o0__1_carry_i_16_n_0,sgf_result_o0__1_carry_i_17_n_0,sgf_result_o0__1_carry_i_18_n_0,sgf_result_o0__1_carry_i_19_n_0}));
  CARRY4 sgf_result_o1__0_carry_i_13__1
       (.CI(sgf_result_o0__1_carry_i_8__9_n_0),
        .CO({NLW_sgf_result_o1__0_carry_i_13__1_CO_UNCONNECTED[3],sgf_result_o1__0_carry_i_13__1_n_1,NLW_sgf_result_o1__0_carry_i_13__1_CO_UNCONNECTED[1],sgf_result_o1__0_carry_i_13__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Data_B_i_IBUF[5:4]}),
        .O({NLW_sgf_result_o1__0_carry_i_13__1_O_UNCONNECTED[3:2],sgf_result_o1__0_carry_i_13__1_n_6,sgf_result_o1__0_carry_i_13__1_n_7}),
        .S({1'b0,1'b1,sgf_result_o1__0_carry_i_20_n_0,sgf_result_o1__0_carry_i_21_n_0}));
  CARRY4 sgf_result_o1__0_carry_i_18__0
       (.CI(sgf_result_o0__1_carry_i_9__4_n_0),
        .CO({NLW_sgf_result_o1__0_carry_i_18__0_CO_UNCONNECTED[3],p_0_in[2],NLW_sgf_result_o1__0_carry_i_18__0_CO_UNCONNECTED[1],sgf_result_o1__0_carry_i_18__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Data_A_i_IBUF[5:4]}),
        .O({NLW_sgf_result_o1__0_carry_i_18__0_O_UNCONNECTED[3:2],p_0_in[1:0]}),
        .S({1'b0,1'b1,sgf_result_o1__0_carry_i_22_n_0,sgf_result_o1__0_carry_i_23_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_20
       (.I0(Data_B_i_IBUF[5]),
        .I1(Data_B_i_IBUF[11]),
        .O(sgf_result_o1__0_carry_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_21
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_B_i_IBUF[10]),
        .O(sgf_result_o1__0_carry_i_21_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_22
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_A_i_IBUF[11]),
        .O(sgf_result_o1__0_carry_i_22_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_23
       (.I0(Data_A_i_IBUF[4]),
        .I1(Data_A_i_IBUF[10]),
        .O(sgf_result_o1__0_carry_i_23_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    sgf_result_o1__21_carry__0_i_10__0
       (.I0(sgf_result_o1__0_carry_i_13__1_n_6),
        .I1(p_0_in[1]),
        .I2(sgf_result_o1__0_carry_i_13__1_n_1),
        .I3(p_0_in[0]),
        .I4(sgf_result_o1__0_carry_i_13__1_n_7),
        .I5(p_0_in[2]),
        .O(sgf_result_o1__21_carry__0_i_10__0_n_0));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    sgf_result_o1__21_carry__0_i_9__0
       (.I0(p_0_in[2]),
        .I1(sgf_result_o1__0_carry_i_13__1_n_7),
        .I2(p_0_in[0]),
        .I3(sgf_result_o1__0_carry_i_13__1_n_1),
        .I4(p_0_in[1]),
        .I5(sgf_result_o1__0_carry_i_13__1_n_6),
        .O(sgf_result_o1__21_carry__0_i_9__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o1__21_carry_i_10__0
       (.I0(sgf_result_o1__0_carry_i_13__1_n_6),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(sgf_result_o1__0_carry_i_13__1_n_7),
        .O(sgf_result_o1__21_carry_i_10__0_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    sgf_result_o1__21_carry_i_8__0
       (.I0(sgf_result_o1__0_carry_i_13__1_n_6),
        .I1(p_0_in[1]),
        .I2(sgf_result_o1__0_carry_i_13__1_n_1),
        .I3(p_0_in[0]),
        .I4(sgf_result_o1__0_carry_i_13__1_n_7),
        .I5(p_0_in[2]),
        .O(sgf_result_o1__21_carry_i_8__0_n_0));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    sgf_result_o1__21_carry_i_9__0
       (.I0(sgf_result_o1__0_carry_i_13__1_n_6),
        .I1(p_0_in[1]),
        .I2(sgf_result_o1__0_carry_i_13__1_n_1),
        .I3(p_0_in[0]),
        .I4(sgf_result_o1__0_carry_i_13__1_n_7),
        .I5(p_0_in[2]),
        .O(sgf_result_o1__21_carry_i_9__0_n_0));
  LUT6 #(
    .INIT(64'h9A9A3AC53AC59A9A)) 
    sgf_result_o1_carry_i_4__0
       (.I0(\EVEN1.middle_n_15 ),
        .I1(\EVEN1.middle_n_12 ),
        .I2(\EVEN1.middle_n_14 ),
        .I3(\EVEN1.middle_n_13 ),
        .I4(sgf_result_o1__0_carry_i_13__1_n_7),
        .I5(sgf_result_o0__1_carry_i_8__9_n_7),
        .O(sgf_result_o1_carry_i_4__0_n_0));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized1
   (Q_middle_temp__2,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[27] ,
    \sgf_result_o[27]_0 ,
    \sgf_result_o[43] ,
    \sgf_result_o[19] ,
    \sgf_result_o[23] ,
    \sgf_result_o[23]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[27]_1 ,
    O,
    S,
    \Data_A_i[18] ,
    \Data_B_i[18] ,
    \Data_A_i[18]_0 ,
    \Data_B_i[18]_0 ,
    DI,
    \Data_A_i[23] ,
    \Data_A_i[17] ,
    \Data_A_i[14] ,
    \Data_A_i[20] ,
    \Data_A_i[14]_0 ,
    \Data_A_i[18]_1 ,
    Data_A_i_IBUF,
    Data_B_i_IBUF,
    \Data_A_i[20]_0 ,
    \Data_B_i[22] ,
    \Data_A_i[17]_0 ,
    \Data_A_i[14]_1 );
  output [10:0]Q_middle_temp__2;
  output [3:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[27] ;
  output [1:0]\sgf_result_o[27]_0 ;
  output \sgf_result_o[43] ;
  output [3:0]\sgf_result_o[19] ;
  output [3:0]\sgf_result_o[23] ;
  output [1:0]\sgf_result_o[23]_0 ;
  output [2:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [2:0]\sgf_result_o[27]_1 ;
  input [3:0]O;
  input [3:0]S;
  input [3:0]\Data_A_i[18] ;
  input [3:0]\Data_B_i[18] ;
  input [0:0]\Data_A_i[18]_0 ;
  input [2:0]\Data_B_i[18]_0 ;
  input [2:0]DI;
  input [3:0]\Data_A_i[23] ;
  input [3:0]\Data_A_i[17] ;
  input [3:0]\Data_A_i[14] ;
  input [3:0]\Data_A_i[20] ;
  input [3:0]\Data_A_i[14]_0 ;
  input [1:0]\Data_A_i[18]_1 ;
  input [5:0]Data_A_i_IBUF;
  input [5:0]Data_B_i_IBUF;
  input [0:0]\Data_A_i[20]_0 ;
  input [0:0]\Data_B_i[22] ;
  input [3:0]\Data_A_i[17]_0 ;
  input [1:0]\Data_A_i[14]_1 ;

  wire [2:0]DI;
  wire [3:0]\Data_A_i[14] ;
  wire [3:0]\Data_A_i[14]_0 ;
  wire [1:0]\Data_A_i[14]_1 ;
  wire [3:0]\Data_A_i[17] ;
  wire [3:0]\Data_A_i[17]_0 ;
  wire [3:0]\Data_A_i[18] ;
  wire [0:0]\Data_A_i[18]_0 ;
  wire [1:0]\Data_A_i[18]_1 ;
  wire [3:0]\Data_A_i[20] ;
  wire [0:0]\Data_A_i[20]_0 ;
  wire [3:0]\Data_A_i[23] ;
  wire [5:0]Data_A_i_IBUF;
  wire [3:0]\Data_B_i[18] ;
  wire [2:0]\Data_B_i[18]_0 ;
  wire [0:0]\Data_B_i[22] ;
  wire [5:0]Data_B_i_IBUF;
  wire \EVEN1.middle_n_0 ;
  wire \EVEN1.middle_n_1 ;
  wire \EVEN1.middle_n_2 ;
  wire \EVEN1.middle_n_28 ;
  wire \EVEN1.middle_n_29 ;
  wire \EVEN1.middle_n_30 ;
  wire \EVEN1.middle_n_31 ;
  wire \EVEN1.middle_n_32 ;
  wire \EVEN1.middle_n_33 ;
  wire \EVEN1.middle_n_34 ;
  wire \EVEN1.middle_n_35 ;
  wire \EVEN1.middle_n_36 ;
  wire \EVEN1.middle_n_37 ;
  wire \EVEN1.middle_n_38 ;
  wire [3:0]O;
  wire [10:0]Q_middle_temp__2;
  wire [3:0]S;
  wire S_B0__0_carry__0_i_10__2_n_0;
  wire S_B0__0_carry__0_i_7__2_n_0;
  wire S_B0__0_carry__0_i_8__2_n_0;
  wire S_B0__0_carry__0_i_9__2_n_0;
  wire S_B0__0_carry__0_n_1;
  wire S_B0__0_carry__0_n_2;
  wire S_B0__0_carry__0_n_3;
  wire S_B0__0_carry__0_n_4;
  wire S_B0__0_carry__0_n_5;
  wire S_B0__0_carry__0_n_6;
  wire S_B0__0_carry__0_n_7;
  wire S_B0__0_carry_i_11__2_n_0;
  wire S_B0__0_carry_i_12__2_n_0;
  wire S_B0__0_carry_i_13__1_n_0;
  wire S_B0__0_carry_i_8__2_n_0;
  wire S_B0__0_carry_i_9__2_n_0;
  wire S_B0__0_carry_n_0;
  wire S_B0__0_carry_n_1;
  wire S_B0__0_carry_n_2;
  wire S_B0__0_carry_n_3;
  wire S_B0__0_carry_n_4;
  wire S_B0__0_carry_n_5;
  wire S_B0__0_carry_n_6;
  wire S_B0__0_carry_n_7;
  wire S_B0__30_carry__0_i_11__0_n_0;
  wire S_B0__30_carry__0_i_12_n_0;
  wire S_B0__30_carry__0_i_13_n_0;
  wire S_B0__30_carry__0_i_14_n_0;
  wire S_B0__30_carry__1_i_12_n_0;
  wire S_B0__30_carry_i_10_n_0;
  wire S_B0__30_carry_i_11_n_0;
  wire S_B0__30_carry_i_12__0_n_0;
  wire sgf_result_o0__1_carry__0_i_1__4_n_0;
  wire sgf_result_o0__1_carry__0_i_2__3_n_0;
  wire sgf_result_o0__1_carry__0_i_3__5_n_0;
  wire sgf_result_o0__1_carry__0_i_4__4_n_0;
  wire sgf_result_o0__1_carry__0_i_5__6_n_0;
  wire sgf_result_o0__1_carry__0_i_6__4_n_0;
  wire sgf_result_o0__1_carry__0_i_7__1_n_0;
  wire sgf_result_o0__1_carry__0_i_8__3_n_0;
  wire sgf_result_o0__1_carry__0_i_9__7_n_0;
  wire sgf_result_o0__1_carry_i_10__9_n_0;
  wire sgf_result_o0__1_carry_i_11__4_n_0;
  wire sgf_result_o0__1_carry_i_12__4_n_0;
  wire sgf_result_o0__1_carry_i_13__3_n_0;
  wire sgf_result_o0__1_carry_i_14__6_n_0;
  wire sgf_result_o0__1_carry_i_1__4_n_0;
  wire sgf_result_o0__1_carry_i_2__4_n_0;
  wire sgf_result_o0__1_carry_i_3__4_n_0;
  wire sgf_result_o0__1_carry_i_4__4_n_0;
  wire sgf_result_o0__1_carry_i_5__4_n_0;
  wire sgf_result_o0__1_carry_i_6__3_n_0;
  wire sgf_result_o0__1_carry_i_7__4_n_0;
  wire sgf_result_o0__1_carry_i_8__3_n_0;
  wire sgf_result_o0__1_carry_i_9__11_n_0;
  wire [3:0]\sgf_result_o[19] ;
  wire [3:0]\sgf_result_o[23] ;
  wire [1:0]\sgf_result_o[23]_0 ;
  wire [3:0]\sgf_result_o[27] ;
  wire [1:0]\sgf_result_o[27]_0 ;
  wire [2:0]\sgf_result_o[27]_1 ;
  wire \sgf_result_o[43] ;
  wire [3:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [2:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:3]NLW_S_B0__0_carry__0_CO_UNCONNECTED;

  Recursive_KOA__parameterized4 \EVEN1.middle 
       (.DI({sgf_result_o0__1_carry_i_1__4_n_0,sgf_result_o0__1_carry_i_2__4_n_0,sgf_result_o0__1_carry_i_3__4_n_0}),
        .\Data_A_i[14] (\Data_A_i[14] ),
        .\Data_A_i[14]_0 (\Data_A_i[14]_0 ),
        .\Data_A_i[14]_1 (\Data_A_i[14]_1 ),
        .\Data_A_i[17] (DI),
        .\Data_A_i[17]_0 (\Data_A_i[17] ),
        .\Data_A_i[17]_1 (\Data_A_i[17]_0 ),
        .\Data_A_i[18] (S),
        .\Data_A_i[18]_0 (\Data_A_i[18] ),
        .\Data_A_i[18]_1 (\Data_A_i[18]_0 ),
        .\Data_A_i[18]_2 (\Data_A_i[18]_1 ),
        .\Data_A_i[19] ({sgf_result_o0__1_carry__0_i_4__4_n_0,sgf_result_o0__1_carry__0_i_5__6_n_0,sgf_result_o0__1_carry__0_i_6__4_n_0}),
        .\Data_A_i[20] (\Data_A_i[20] ),
        .\Data_A_i[20]_0 (S_B0__0_carry_i_8__2_n_0),
        .\Data_A_i[20]_1 (S_B0__0_carry_i_11__2_n_0),
        .\Data_A_i[20]_2 (S_B0__0_carry__0_i_7__2_n_0),
        .\Data_A_i[20]_3 ({S_B0__30_carry__0_i_11__0_n_0,S_B0__30_carry__0_i_12_n_0,S_B0__30_carry__0_i_13_n_0,S_B0__30_carry__0_i_14_n_0}),
        .\Data_A_i[23] ({sgf_result_o0__1_carry__0_i_1__4_n_0,sgf_result_o0__1_carry__0_i_2__3_n_0,sgf_result_o0__1_carry__0_i_3__5_n_0}),
        .\Data_A_i[23]_0 (\Data_A_i[23] ),
        .\Data_A_i[23]_1 (S_B0__0_carry_i_9__2_n_0),
        .\Data_A_i[23]_2 (S_B0__0_carry_i_12__2_n_0),
        .\Data_A_i[23]_3 (S_B0__0_carry__0_i_8__2_n_0),
        .\Data_A_i[23]_4 ({S_B0__0_carry_n_4,S_B0__0_carry_n_5,S_B0__0_carry_n_6,S_B0__0_carry_n_7}),
        .\Data_A_i[23]_5 ({S_B0__30_carry_i_10_n_0,S_B0__30_carry_i_11_n_0,S_B0__30_carry_i_12__0_n_0,\Data_A_i[20]_0 }),
        .\Data_A_i[23]_6 ({S_B0__0_carry__0_n_4,S_B0__0_carry__0_n_5,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .Data_A_i_IBUF({Data_A_i_IBUF[4:3],Data_A_i_IBUF[1:0]}),
        .\Data_B_i[18] (\Data_B_i[18] ),
        .\Data_B_i[18]_0 (\Data_B_i[18]_0 ),
        .\Data_B_i[18]_1 (\sgf_result_o[43] ),
        .\Data_B_i[19] (S_B0__0_carry__0_i_9__2_n_0),
        .\Data_B_i[21] (S_B0__0_carry_i_13__1_n_0),
        .\Data_B_i[22] (S_B0__0_carry__0_i_10__2_n_0),
        .\Data_B_i[22]_0 ({\Data_B_i[22] ,S_B0__30_carry__1_i_12_n_0}),
        .Data_B_i_IBUF({Data_B_i_IBUF[4:3],Data_B_i_IBUF[1:0]}),
        .O(O),
        .Q_middle_temp__2(Q_middle_temp__2),
        .S({sgf_result_o0__1_carry_i_4__4_n_0,sgf_result_o0__1_carry_i_5__4_n_0,sgf_result_o0__1_carry_i_6__3_n_0,sgf_result_o0__1_carry_i_7__4_n_0}),
        .\sgf_result_o[15] ({\EVEN1.middle_n_28 ,\EVEN1.middle_n_29 ,\EVEN1.middle_n_30 }),
        .\sgf_result_o[15]_0 ({\EVEN1.middle_n_31 ,\EVEN1.middle_n_32 ,\EVEN1.middle_n_33 ,\EVEN1.middle_n_34 }),
        .\sgf_result_o[19] ({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 }),
        .\sgf_result_o[19]_0 ({\EVEN1.middle_n_35 ,\EVEN1.middle_n_36 ,\EVEN1.middle_n_37 ,\EVEN1.middle_n_38 }),
        .\sgf_result_o[19]_1 (\sgf_result_o[19] ),
        .\sgf_result_o[23] (\sgf_result_o[23] ),
        .\sgf_result_o[23]_0 (\sgf_result_o[23]_0 ),
        .\sgf_result_o[27] (\sgf_result_o[27] ),
        .\sgf_result_o[27]_0 (\sgf_result_o[27]_0 ),
        .\sgf_result_o[27]_1 (\sgf_result_o[27]_1 ),
        .\sgf_result_o[47] (\sgf_result_o[47] ),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_1 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_3 ));
  CARRY4 S_B0__0_carry
       (.CI(1'b0),
        .CO({S_B0__0_carry_n_0,S_B0__0_carry_n_1,S_B0__0_carry_n_2,S_B0__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\EVEN1.middle_n_28 ,\EVEN1.middle_n_29 ,\EVEN1.middle_n_30 ,1'b1}),
        .O({S_B0__0_carry_n_4,S_B0__0_carry_n_5,S_B0__0_carry_n_6,S_B0__0_carry_n_7}),
        .S({\EVEN1.middle_n_31 ,\EVEN1.middle_n_32 ,\EVEN1.middle_n_33 ,\EVEN1.middle_n_34 }));
  CARRY4 S_B0__0_carry__0
       (.CI(S_B0__0_carry_n_0),
        .CO({NLW_S_B0__0_carry__0_CO_UNCONNECTED[3],S_B0__0_carry__0_n_1,S_B0__0_carry__0_n_2,S_B0__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 }),
        .O({S_B0__0_carry__0_n_4,S_B0__0_carry__0_n_5,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .S({\EVEN1.middle_n_35 ,\EVEN1.middle_n_36 ,\EVEN1.middle_n_37 ,\EVEN1.middle_n_38 }));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__0_carry__0_i_10__2
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_B_i_IBUF[5]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_B_i_IBUF[4]),
        .O(S_B0__0_carry__0_i_10__2_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_7__2
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry__0_i_7__2_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_8__2
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry__0_i_8__2_n_0));
  LUT6 #(
    .INIT(64'h55FF7FFF7FFFFFFF)) 
    S_B0__0_carry__0_i_9__2
       (.I0(Data_A_i_IBUF[2]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_B_i_IBUF[2]),
        .I4(Data_A_i_IBUF[1]),
        .I5(Data_B_i_IBUF[1]),
        .O(S_B0__0_carry__0_i_9__2_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_10__1
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[0]),
        .O(\sgf_result_o[43] ));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_11__2
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry_i_11__2_n_0));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_12__2
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry_i_12__2_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_13__1
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_B_i_IBUF[3]),
        .O(S_B0__0_carry_i_13__1_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_8__2
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry_i_8__2_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_9__2
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry_i_9__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry__0_i_11__0
       (.I0(S_B0__0_carry__0_n_5),
        .I1(S_B0__0_carry_i_12__2_n_0),
        .O(S_B0__30_carry__0_i_11__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry__0_i_12
       (.I0(S_B0__0_carry__0_n_6),
        .I1(S_B0__0_carry_i_9__2_n_0),
        .O(S_B0__30_carry__0_i_12_n_0));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    S_B0__30_carry__0_i_13
       (.I0(S_B0__0_carry__0_n_7),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[4]),
        .O(S_B0__30_carry__0_i_13_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    S_B0__30_carry__0_i_14
       (.I0(S_B0__0_carry_n_4),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_B_i_IBUF[3]),
        .O(S_B0__30_carry__0_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry__1_i_12
       (.I0(S_B0__0_carry__0_n_4),
        .I1(S_B0__0_carry__0_i_8__2_n_0),
        .O(S_B0__30_carry__1_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry_i_10
       (.I0(S_B0__0_carry_n_5),
        .I1(S_B0__0_carry__0_i_9__2_n_0),
        .O(S_B0__30_carry_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry_i_11
       (.I0(S_B0__0_carry_n_6),
        .I1(S_B0__0_carry__0_i_7__2_n_0),
        .O(S_B0__30_carry_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry_i_12__0
       (.I0(S_B0__0_carry_n_7),
        .I1(S_B0__0_carry_i_11__2_n_0),
        .O(S_B0__30_carry_i_12__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_1__4
       (.I0(sgf_result_o0__1_carry_i_11__4_n_0),
        .I1(sgf_result_o0__1_carry_i_13__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_1__4_n_0));
  LUT5 #(
    .INIT(32'h14000000)) 
    sgf_result_o0__1_carry__0_i_2__3
       (.I0(sgf_result_o0__1_carry_i_13__3_n_0),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(sgf_result_o0__1_carry_i_3__4_n_0),
        .I4(sgf_result_o0__1_carry_i_10__9_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__3_n_0));
  LUT6 #(
    .INIT(64'h56A956A956A9A956)) 
    sgf_result_o0__1_carry__0_i_3__5
       (.I0(sgf_result_o0__1_carry__0_i_2__3_n_0),
        .I1(sgf_result_o0__1_carry_i_11__4_n_0),
        .I2(sgf_result_o0__1_carry_i_14__6_n_0),
        .I3(sgf_result_o0__1_carry__0_i_7__1_n_0),
        .I4(sgf_result_o0__1_carry_i_9__11_n_0),
        .I5(sgf_result_o0__1_carry_i_13__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__5_n_0));
  LUT6 #(
    .INIT(64'h000001010003FCE8)) 
    sgf_result_o0__1_carry__0_i_4__4
       (.I0(sgf_result_o0__1_carry_i_9__11_n_0),
        .I1(sgf_result_o0__1_carry_i_12__4_n_0),
        .I2(sgf_result_o0__1_carry_i_8__3_n_0),
        .I3(sgf_result_o0__1_carry_i_14__6_n_0),
        .I4(sgf_result_o0__1_carry_i_13__3_n_0),
        .I5(sgf_result_o0__1_carry_i_11__4_n_0),
        .O(sgf_result_o0__1_carry__0_i_4__4_n_0));
  LUT6 #(
    .INIT(64'h9996999699966669)) 
    sgf_result_o0__1_carry__0_i_5__6
       (.I0(sgf_result_o0__1_carry__0_i_2__3_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__3_n_0),
        .I2(sgf_result_o0__1_carry_i_12__4_n_0),
        .I3(sgf_result_o0__1_carry_i_13__3_n_0),
        .I4(sgf_result_o0__1_carry_i_8__3_n_0),
        .I5(sgf_result_o0__1_carry_i_11__4_n_0),
        .O(sgf_result_o0__1_carry__0_i_5__6_n_0));
  LUT6 #(
    .INIT(64'h66666556AAAAA66A)) 
    sgf_result_o0__1_carry__0_i_6__4
       (.I0(sgf_result_o0__1_carry__0_i_3__5_n_0),
        .I1(sgf_result_o0__1_carry__0_i_9__7_n_0),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_A_i_IBUF[0]),
        .I4(sgf_result_o0__1_carry_i_11__4_n_0),
        .I5(sgf_result_o0__1_carry_i_10__9_n_0),
        .O(sgf_result_o0__1_carry__0_i_6__4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_7__1
       (.I0(sgf_result_o0__1_carry_i_12__4_n_0),
        .I1(sgf_result_o0__1_carry_i_8__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_7__1_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFEEEE0)) 
    sgf_result_o0__1_carry__0_i_8__3
       (.I0(sgf_result_o0__1_carry_i_11__4_n_0),
        .I1(sgf_result_o0__1_carry_i_14__6_n_0),
        .I2(sgf_result_o0__1_carry_i_8__3_n_0),
        .I3(sgf_result_o0__1_carry_i_12__4_n_0),
        .I4(sgf_result_o0__1_carry_i_9__11_n_0),
        .I5(sgf_result_o0__1_carry_i_13__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_8__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry__0_i_9__7
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[4]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_8__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_9__7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry_i_10__9
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_12__4_n_0),
        .O(sgf_result_o0__1_carry_i_10__9_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_11__4
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[4]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .I4(Data_B_i_IBUF[2]),
        .I5(Data_B_i_IBUF[5]),
        .O(sgf_result_o0__1_carry_i_11__4_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_12__4
       (.I0(Data_B_i_IBUF[5]),
        .I1(Data_B_i_IBUF[2]),
        .I2(Data_B_i_IBUF[3]),
        .I3(Data_B_i_IBUF[0]),
        .I4(Data_B_i_IBUF[4]),
        .I5(Data_B_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_12__4_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_13__3
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_A_i_IBUF[2]),
        .I5(Data_A_i_IBUF[5]),
        .O(sgf_result_o0__1_carry_i_13__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_14__6
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_14__6_n_0));
  LUT6 #(
    .INIT(64'hE1E1E1E1E11E1EE1)) 
    sgf_result_o0__1_carry_i_1__4
       (.I0(sgf_result_o0__1_carry_i_8__3_n_0),
        .I1(sgf_result_o0__1_carry_i_9__11_n_0),
        .I2(sgf_result_o0__1_carry_i_10__9_n_0),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_A_i_IBUF[0]),
        .I5(sgf_result_o0__1_carry_i_11__4_n_0),
        .O(sgf_result_o0__1_carry_i_1__4_n_0));
  LUT6 #(
    .INIT(64'h0906060609F9F906)) 
    sgf_result_o0__1_carry_i_2__4
       (.I0(Data_A_i_IBUF[4]),
        .I1(Data_A_i_IBUF[1]),
        .I2(sgf_result_o0__1_carry_i_9__11_n_0),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_A_i_IBUF[3]),
        .I5(sgf_result_o0__1_carry_i_12__4_n_0),
        .O(sgf_result_o0__1_carry_i_2__4_n_0));
  LUT6 #(
    .INIT(64'h6006066006600660)) 
    sgf_result_o0__1_carry_i_3__4
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[1]),
        .I3(Data_B_i_IBUF[4]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_B_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_3__4_n_0));
  LUT6 #(
    .INIT(64'h6A6A6A6A6A95956A)) 
    sgf_result_o0__1_carry_i_4__4
       (.I0(sgf_result_o0__1_carry_i_1__4_n_0),
        .I1(sgf_result_o0__1_carry_i_10__9_n_0),
        .I2(sgf_result_o0__1_carry_i_3__4_n_0),
        .I3(Data_B_i_IBUF[3]),
        .I4(Data_B_i_IBUF[0]),
        .I5(sgf_result_o0__1_carry_i_13__3_n_0),
        .O(sgf_result_o0__1_carry_i_4__4_n_0));
  LUT4 #(
    .INIT(16'hA99A)) 
    sgf_result_o0__1_carry_i_5__4
       (.I0(sgf_result_o0__1_carry_i_2__4_n_0),
        .I1(sgf_result_o0__1_carry_i_8__3_n_0),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_5__4_n_0));
  LUT6 #(
    .INIT(64'h141414EB14EB1414)) 
    sgf_result_o0__1_carry_i_6__3
       (.I0(sgf_result_o0__1_carry_i_14__6_n_0),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(sgf_result_o0__1_carry_i_9__11_n_0),
        .I4(Data_A_i_IBUF[0]),
        .I5(Data_A_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_6__3_n_0));
  LUT4 #(
    .INIT(16'h0660)) 
    sgf_result_o0__1_carry_i_7__4
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(Data_B_i_IBUF[0]),
        .O(sgf_result_o0__1_carry_i_7__4_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_8__3
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_A_i_IBUF[2]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_A_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_8__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_9__11
       (.I0(Data_B_i_IBUF[3]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[4]),
        .I3(Data_B_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_9__11_n_0));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized11
   (\sgf_result_o[19] ,
    \sgf_result_o[47] ,
    \sgf_result_o[15] ,
    \sgf_result_o[19]_0 ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[19]_1 ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[19]_2 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[39] ,
    \sgf_result_o[43] ,
    DI,
    S,
    \Data_B_i[18] ,
    \Data_A_i[18] ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[12] ,
    \Data_B_i[22] ,
    \Data_B_i[18]_0 ,
    p_0_in,
    Q_middle_temp__1,
    \Data_B_i[18]_1 ,
    \Data_A_i[18]_0 ,
    O,
    \Data_B_i[18]_2 ,
    \Data_A_i[18]_1 ,
    \Data_A_i[18]_2 ,
    \Data_A_i[18]_3 ,
    \Data_A_i[23] ,
    \Data_A_i[17] ,
    Q_middle_temp__2,
    \Data_A_i[17]_0 ,
    \Data_A_i[23]_0 ,
    \Data_A_i[17]_1 ,
    \Data_A_i[17]_2 ,
    \Data_A_i[14] ,
    \Data_A_i[14]_0 ,
    \Data_A_i[14]_1 ,
    \Data_A_i[23]_1 ,
    \Data_A_i[20] ,
    \Data_B_i[18]_3 ,
    \Data_A_i[18]_4 );
  output [0:0]\sgf_result_o[19] ;
  output [2:0]\sgf_result_o[47] ;
  output [2:0]\sgf_result_o[15] ;
  output [3:0]\sgf_result_o[19]_0 ;
  output [3:0]\sgf_result_o[15]_0 ;
  output [3:0]\sgf_result_o[19]_1 ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [0:0]\sgf_result_o[19]_2 ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [3:0]\sgf_result_o[47]_4 ;
  output [3:0]\sgf_result_o[39] ;
  output [2:0]\sgf_result_o[43] ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_B_i[18] ;
  input [2:0]\Data_A_i[18] ;
  input [2:0]Data_B_i_IBUF;
  input [2:0]Data_A_i_IBUF;
  input \Data_B_i[12] ;
  input \Data_B_i[22] ;
  input [1:0]\Data_B_i[18]_0 ;
  input [1:0]p_0_in;
  input [5:0]Q_middle_temp__1;
  input \Data_B_i[18]_1 ;
  input \Data_A_i[18]_0 ;
  input [3:0]O;
  input \Data_B_i[18]_2 ;
  input \Data_A_i[18]_1 ;
  input \Data_A_i[18]_2 ;
  input \Data_A_i[18]_3 ;
  input [1:0]\Data_A_i[23] ;
  input [1:0]\Data_A_i[17] ;
  input [0:0]Q_middle_temp__2;
  input [3:0]\Data_A_i[17]_0 ;
  input [3:0]\Data_A_i[23]_0 ;
  input [3:0]\Data_A_i[17]_1 ;
  input [3:0]\Data_A_i[17]_2 ;
  input [3:0]\Data_A_i[14] ;
  input [3:0]\Data_A_i[14]_0 ;
  input [1:0]\Data_A_i[14]_1 ;
  input [3:0]\Data_A_i[23]_1 ;
  input [2:0]\Data_A_i[20] ;
  input [0:0]\Data_B_i[18]_3 ;
  input [0:0]\Data_A_i[18]_4 ;

  wire [2:0]DI;
  wire [3:0]\Data_A_i[14] ;
  wire [3:0]\Data_A_i[14]_0 ;
  wire [1:0]\Data_A_i[14]_1 ;
  wire [1:0]\Data_A_i[17] ;
  wire [3:0]\Data_A_i[17]_0 ;
  wire [3:0]\Data_A_i[17]_1 ;
  wire [3:0]\Data_A_i[17]_2 ;
  wire [2:0]\Data_A_i[18] ;
  wire \Data_A_i[18]_0 ;
  wire \Data_A_i[18]_1 ;
  wire \Data_A_i[18]_2 ;
  wire \Data_A_i[18]_3 ;
  wire [0:0]\Data_A_i[18]_4 ;
  wire [2:0]\Data_A_i[20] ;
  wire [1:0]\Data_A_i[23] ;
  wire [3:0]\Data_A_i[23]_0 ;
  wire [3:0]\Data_A_i[23]_1 ;
  wire [2:0]Data_A_i_IBUF;
  wire \Data_B_i[12] ;
  wire [2:0]\Data_B_i[18] ;
  wire [1:0]\Data_B_i[18]_0 ;
  wire \Data_B_i[18]_1 ;
  wire \Data_B_i[18]_2 ;
  wire [0:0]\Data_B_i[18]_3 ;
  wire \Data_B_i[22] ;
  wire [2:0]Data_B_i_IBUF;
  wire [3:0]O;
  wire [5:0]Q_middle_temp__1;
  wire [0:0]Q_middle_temp__2;
  wire [3:0]S;
  wire [1:0]p_0_in;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire [2:0]\sgf_result_o[15] ;
  wire [3:0]\sgf_result_o[15]_0 ;
  wire [0:0]\sgf_result_o[19] ;
  wire [3:0]\sgf_result_o[19]_0 ;
  wire [3:0]\sgf_result_o[19]_1 ;
  wire [0:0]\sgf_result_o[19]_2 ;
  wire [3:0]\sgf_result_o[39] ;
  wire [2:0]\sgf_result_o[43] ;
  wire [2:0]\sgf_result_o[47] ;
  wire [3:0]\^sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:0]\sgf_result_o[47]_4 ;
  wire \sgf_result_o_OBUF[34]_inst_i_15_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_15_n_1 ;
  wire \sgf_result_o_OBUF[34]_inst_i_15_n_2 ;
  wire \sgf_result_o_OBUF[34]_inst_i_15_n_3 ;
  wire \sgf_result_o_OBUF[38]_inst_i_19_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_19_n_1 ;
  wire \sgf_result_o_OBUF[38]_inst_i_19_n_2 ;
  wire \sgf_result_o_OBUF[38]_inst_i_19_n_3 ;
  wire \sgf_result_o_OBUF[42]_inst_i_6_n_0 ;
  wire \sgf_result_o_OBUF[42]_inst_i_6_n_1 ;
  wire \sgf_result_o_OBUF[42]_inst_i_6_n_2 ;
  wire \sgf_result_o_OBUF[42]_inst_i_6_n_3 ;
  wire \sgf_result_o_OBUF[46]_inst_i_6_n_0 ;
  wire \sgf_result_o_OBUF[46]_inst_i_6_n_1 ;
  wire \sgf_result_o_OBUF[46]_inst_i_6_n_2 ;
  wire \sgf_result_o_OBUF[46]_inst_i_6_n_3 ;
  wire \sgf_result_o_OBUF[47]_inst_i_3_n_2 ;
  wire \sgf_result_o_OBUF[47]_inst_i_3_n_3 ;
  wire [2:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;
  wire [3:2]\NLW_sgf_result_o_OBUF[47]_inst_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_sgf_result_o_OBUF[47]_inst_i_3_O_UNCONNECTED ;

  assign \sgf_result_o[47]_0 [3:1] = \^sgf_result_o[47]_0 [3:1];
  assign \sgf_result_o[47]_0 [0] = sgf_result_o0__1_carry_n_4;
  (* HLUTNM = "lutpair31" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry_i_1__0
       (.I0(sgf_result_o0__1_carry_n_5),
        .I1(\Data_A_i[23] [0]),
        .I2(\Data_A_i[17] [0]),
        .O(\sgf_result_o[47] [2]));
  LUT6 #(
    .INIT(64'h87770000FFFF8777)) 
    S_B0__30_carry_i_2__0
       (.I0(Data_B_i_IBUF[2]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_A_i_IBUF[2]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_6),
        .I5(\Data_B_i[12] ),
        .O(\sgf_result_o[47] [1]));
  (* HLUTNM = "lutpair85" *) 
  LUT5 #(
    .INIT(32'h7FFF0777)) 
    S_B0__30_carry_i_3__0
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_7),
        .O(\sgf_result_o[47] [0]));
  (* HLUTNM = "lutpair32" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry_i_4__0
       (.I0(Q_middle_temp__2),
        .I1(\Data_A_i[23] [1]),
        .I2(\Data_A_i[17] [1]),
        .I3(\sgf_result_o[47] [2]),
        .O(\sgf_result_o[47]_1 [3]));
  (* HLUTNM = "lutpair31" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry_i_5__0
       (.I0(sgf_result_o0__1_carry_n_5),
        .I1(\Data_A_i[23] [0]),
        .I2(\Data_A_i[17] [0]),
        .I3(\sgf_result_o[47] [1]),
        .O(\sgf_result_o[47]_1 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry_i_6__0
       (.I0(\sgf_result_o[47] [0]),
        .I1(\Data_B_i[12] ),
        .I2(\Data_B_i[18]_2 ),
        .I3(sgf_result_o0__1_carry_n_6),
        .O(\sgf_result_o[47]_1 [1]));
  (* HLUTNM = "lutpair85" *) 
  LUT5 #(
    .INIT(32'h78888777)) 
    S_B0__30_carry_i_7__0
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_7),
        .O(\sgf_result_o[47]_1 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry__0_i_4__0
       (.I0(O[3]),
        .I1(\sgf_result_o[19] ),
        .O(\sgf_result_o[19]_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry_i_1__0
       (.I0(O[2]),
        .I1(sgf_result_o0__1_carry__0_n_5),
        .O(\^sgf_result_o[47]_0 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry_i_2__0
       (.I0(O[1]),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .O(\^sgf_result_o[47]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry_i_3__0
       (.I0(O[0]),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .O(\^sgf_result_o[47]_0 [1]));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({\sgf_result_o[19] ,NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_B_i[18] }),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[18] }));
  LUT2 #(
    .INIT(4'hB)) 
    sgf_result_o1__21_carry__0_i_1__0
       (.I0(Q_middle_temp__1[4]),
        .I1(sgf_result_o0__1_carry__0_n_5),
        .O(\sgf_result_o[19]_0 [3]));
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__21_carry__0_i_2__0
       (.I0(Q_middle_temp__1[3]),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .I2(\Data_B_i[18]_1 ),
        .O(\sgf_result_o[19]_0 [2]));
  (* HLUTNM = "lutpair30" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__21_carry__0_i_3__0
       (.I0(Q_middle_temp__1[2]),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[18]_3 ),
        .O(\sgf_result_o[19]_0 [1]));
  (* HLUTNM = "lutpair29" *) 
  LUT3 #(
    .INIT(8'hD4)) 
    sgf_result_o1__21_carry__0_i_4__0
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_A_i[18]_2 ),
        .I2(Q_middle_temp__1[1]),
        .O(\sgf_result_o[19]_0 [0]));
  LUT4 #(
    .INIT(16'hD22D)) 
    sgf_result_o1__21_carry__0_i_5__0
       (.I0(sgf_result_o0__1_carry__0_n_5),
        .I1(Q_middle_temp__1[4]),
        .I2(\sgf_result_o[19] ),
        .I3(Q_middle_temp__1[5]),
        .O(\sgf_result_o[19]_1 [3]));
  LUT5 #(
    .INIT(32'h718E8E71)) 
    sgf_result_o1__21_carry__0_i_6__0
       (.I0(\Data_B_i[18]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .I2(Q_middle_temp__1[3]),
        .I3(sgf_result_o0__1_carry__0_n_5),
        .I4(Q_middle_temp__1[4]),
        .O(\sgf_result_o[19]_1 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry__0_i_7__0
       (.I0(\sgf_result_o[19]_0 [1]),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .I2(\Data_B_i[18]_1 ),
        .I3(Q_middle_temp__1[3]),
        .O(\sgf_result_o[19]_1 [1]));
  (* HLUTNM = "lutpair30" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry__0_i_8__0
       (.I0(Q_middle_temp__1[2]),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[18]_3 ),
        .I3(\sgf_result_o[19]_0 [0]),
        .O(\sgf_result_o[19]_1 [0]));
  (* HLUTNM = "lutpair28" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__21_carry_i_1__0
       (.I0(Q_middle_temp__1[0]),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[18]_1 ),
        .O(\sgf_result_o[15] [2]));
  LUT6 #(
    .INIT(64'hB2222BBB2BBB2BBB)) 
    sgf_result_o1__21_carry_i_2__0
       (.I0(\Data_B_i[22] ),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_B_i[18]_0 [0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[0]),
        .I5(\Data_B_i[18]_0 [1]),
        .O(\sgf_result_o[15] [1]));
  (* HLUTNM = "lutpair84" *) 
  LUT5 #(
    .INIT(32'h1747270F)) 
    sgf_result_o1__21_carry_i_3__0
       (.I0(p_0_in[0]),
        .I1(\Data_B_i[18]_0 [0]),
        .I2(sgf_result_o0__1_carry_n_7),
        .I3(\Data_B_i[18]_3 ),
        .I4(\Data_A_i[18]_4 ),
        .O(\sgf_result_o[15] [0]));
  (* HLUTNM = "lutpair29" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    sgf_result_o1__21_carry_i_4__0
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_A_i[18]_2 ),
        .I2(Q_middle_temp__1[1]),
        .I3(\sgf_result_o[15] [2]),
        .O(\sgf_result_o[15]_0 [3]));
  (* HLUTNM = "lutpair28" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry_i_5__0
       (.I0(Q_middle_temp__1[0]),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[18]_1 ),
        .I3(\sgf_result_o[15] [1]),
        .O(\sgf_result_o[15]_0 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry_i_6__0
       (.I0(\sgf_result_o[15] [0]),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_A_i[18]_0 ),
        .I3(\Data_B_i[22] ),
        .O(\sgf_result_o[15]_0 [1]));
  (* HLUTNM = "lutpair84" *) 
  LUT5 #(
    .INIT(32'h96C3A50F)) 
    sgf_result_o1__21_carry_i_7__0
       (.I0(p_0_in[0]),
        .I1(\Data_B_i[18]_0 [0]),
        .I2(sgf_result_o0__1_carry_n_7),
        .I3(\Data_B_i[18]_3 ),
        .I4(\Data_A_i[18]_4 ),
        .O(\sgf_result_o[15]_0 [0]));
  CARRY4 \sgf_result_o_OBUF[34]_inst_i_15 
       (.CI(1'b0),
        .CO({\sgf_result_o_OBUF[34]_inst_i_15_n_0 ,\sgf_result_o_OBUF[34]_inst_i_15_n_1 ,\sgf_result_o_OBUF[34]_inst_i_15_n_2 ,\sgf_result_o_OBUF[34]_inst_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI({\Data_A_i[17]_0 [2:0],1'b0}),
        .O(\sgf_result_o[47]_2 ),
        .S(\Data_A_i[23]_0 ));
  CARRY4 \sgf_result_o_OBUF[38]_inst_i_19 
       (.CI(\sgf_result_o_OBUF[34]_inst_i_15_n_0 ),
        .CO({\sgf_result_o_OBUF[38]_inst_i_19_n_0 ,\sgf_result_o_OBUF[38]_inst_i_19_n_1 ,\sgf_result_o_OBUF[38]_inst_i_19_n_2 ,\sgf_result_o_OBUF[38]_inst_i_19_n_3 }),
        .CYINIT(1'b0),
        .DI({\Data_A_i[17]_1 [2:0],\Data_A_i[17]_0 [3]}),
        .O(\sgf_result_o[47]_3 ),
        .S(\Data_A_i[17]_2 ));
  CARRY4 \sgf_result_o_OBUF[42]_inst_i_6 
       (.CI(\sgf_result_o_OBUF[38]_inst_i_19_n_0 ),
        .CO({\sgf_result_o_OBUF[42]_inst_i_6_n_0 ,\sgf_result_o_OBUF[42]_inst_i_6_n_1 ,\sgf_result_o_OBUF[42]_inst_i_6_n_2 ,\sgf_result_o_OBUF[42]_inst_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({\Data_A_i[14] [2:0],\Data_A_i[17]_1 [3]}),
        .O(\sgf_result_o[47]_4 ),
        .S(\Data_A_i[14]_0 ));
  CARRY4 \sgf_result_o_OBUF[46]_inst_i_6 
       (.CI(\sgf_result_o_OBUF[42]_inst_i_6_n_0 ),
        .CO({\sgf_result_o_OBUF[46]_inst_i_6_n_0 ,\sgf_result_o_OBUF[46]_inst_i_6_n_1 ,\sgf_result_o_OBUF[46]_inst_i_6_n_2 ,\sgf_result_o_OBUF[46]_inst_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_A_i[14]_1 ,\Data_A_i[14] [3]}),
        .O(\sgf_result_o[39] ),
        .S(\Data_A_i[23]_1 ));
  CARRY4 \sgf_result_o_OBUF[47]_inst_i_3 
       (.CI(\sgf_result_o_OBUF[46]_inst_i_6_n_0 ),
        .CO({\NLW_sgf_result_o_OBUF[47]_inst_i_3_CO_UNCONNECTED [3:2],\sgf_result_o_OBUF[47]_inst_i_3_n_2 ,\sgf_result_o_OBUF[47]_inst_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_sgf_result_o_OBUF[47]_inst_i_3_O_UNCONNECTED [3],\sgf_result_o[43] }),
        .S({1'b0,\Data_A_i[20] }));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized12
   (O,
    \sgf_result_o[19] ,
    \sgf_result_o[15] ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[15]_1 ,
    \sgf_result_o[15]_2 ,
    \sgf_result_o[15]_3 ,
    \sgf_result_o[15]_4 ,
    \sgf_result_o[15]_5 ,
    \sgf_result_o[15]_6 ,
    \sgf_result_o[15]_7 ,
    S,
    \sgf_result_o[19]_0 ,
    \sgf_result_o[23] ,
    \Data_A_i[18] ,
    p_0_in,
    \Data_B_i[18] ,
    \Data_B_i[18]_0 ,
    \Data_A_i[22] ,
    \Data_B_i[22] ,
    \Data_A_i[22]_0 ,
    \Data_B_i[18]_1 ,
    \Data_A_i[22]_1 ,
    \Data_A_i[22]_2 ,
    CO,
    \Data_A_i[22]_3 ,
    \Data_A_i[22]_4 ,
    \Data_B_i[18]_2 ,
    \Data_A_i[18]_0 ,
    \Data_B_i[22]_0 ,
    \Data_B_i[18]_3 );
  output [3:0]O;
  output [1:0]\sgf_result_o[19] ;
  output \sgf_result_o[15] ;
  output \sgf_result_o[15]_0 ;
  output \sgf_result_o[15]_1 ;
  output \sgf_result_o[15]_2 ;
  output \sgf_result_o[15]_3 ;
  output \sgf_result_o[15]_4 ;
  output \sgf_result_o[15]_5 ;
  output \sgf_result_o[15]_6 ;
  output \sgf_result_o[15]_7 ;
  output [2:0]S;
  output [3:0]\sgf_result_o[19]_0 ;
  output [0:0]\sgf_result_o[23] ;
  input [3:0]\Data_A_i[18] ;
  input [2:0]p_0_in;
  input [3:0]\Data_B_i[18] ;
  input [1:0]\Data_B_i[18]_0 ;
  input \Data_A_i[22] ;
  input \Data_B_i[22] ;
  input \Data_A_i[22]_0 ;
  input \Data_B_i[18]_1 ;
  input \Data_A_i[22]_1 ;
  input \Data_A_i[22]_2 ;
  input [0:0]CO;
  input \Data_A_i[22]_3 ;
  input \Data_A_i[22]_4 ;
  input [0:0]\Data_B_i[18]_2 ;
  input [1:0]\Data_A_i[18]_0 ;
  input \Data_B_i[22]_0 ;
  input \Data_B_i[18]_3 ;

  wire [0:0]CO;
  wire [3:0]\Data_A_i[18] ;
  wire [1:0]\Data_A_i[18]_0 ;
  wire \Data_A_i[22] ;
  wire \Data_A_i[22]_0 ;
  wire \Data_A_i[22]_1 ;
  wire \Data_A_i[22]_2 ;
  wire \Data_A_i[22]_3 ;
  wire \Data_A_i[22]_4 ;
  wire [3:0]\Data_B_i[18] ;
  wire [1:0]\Data_B_i[18]_0 ;
  wire \Data_B_i[18]_1 ;
  wire [0:0]\Data_B_i[18]_2 ;
  wire \Data_B_i[18]_3 ;
  wire \Data_B_i[22] ;
  wire \Data_B_i[22]_0 ;
  wire [3:0]O;
  wire \ODD1.middle_n_10 ;
  wire \ODD1.middle_n_11 ;
  wire \ODD1.middle_n_12 ;
  wire \ODD1.middle_n_13 ;
  wire \ODD1.middle_n_14 ;
  wire \ODD1.middle_n_17 ;
  wire \ODD1.middle_n_18 ;
  wire \ODD1.middle_n_19 ;
  wire \ODD1.middle_n_20 ;
  wire \ODD1.middle_n_7 ;
  wire \ODD1.middle_n_8 ;
  wire \ODD1.middle_n_9 ;
  wire [2:0]S;
  wire [2:0]p_0_in;
  wire sgf_result_o1__0_carry__0_n_2;
  wire sgf_result_o1__0_carry__0_n_3;
  wire sgf_result_o1__0_carry__0_n_5;
  wire sgf_result_o1__0_carry_n_0;
  wire sgf_result_o1__0_carry_n_1;
  wire sgf_result_o1__0_carry_n_2;
  wire sgf_result_o1__0_carry_n_3;
  wire \sgf_result_o[15] ;
  wire \sgf_result_o[15]_0 ;
  wire \sgf_result_o[15]_1 ;
  wire \sgf_result_o[15]_2 ;
  wire \sgf_result_o[15]_3 ;
  wire \sgf_result_o[15]_4 ;
  wire \sgf_result_o[15]_5 ;
  wire \sgf_result_o[15]_6 ;
  wire \sgf_result_o[15]_7 ;
  wire [1:0]\sgf_result_o[19] ;
  wire [3:0]\^sgf_result_o[19]_0 ;
  wire [0:0]\sgf_result_o[23] ;
  wire [3:2]NLW_sgf_result_o1__0_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o1__0_carry__0_O_UNCONNECTED;

  assign \sgf_result_o[19]_0 [3] = sgf_result_o1__0_carry__0_n_5;
  assign \sgf_result_o[19]_0 [2:0] = \^sgf_result_o[19]_0 [2:0];
  Recursive_KOA__parameterized15 \ODD1.middle 
       (.CO(CO),
        .DI({\ODD1.middle_n_7 ,\ODD1.middle_n_8 ,\ODD1.middle_n_9 }),
        .\Data_A_i[18] (\Data_A_i[18] ),
        .\Data_A_i[22] (\Data_A_i[22] ),
        .\Data_A_i[22]_0 (\Data_A_i[22]_0 ),
        .\Data_A_i[22]_1 (\Data_A_i[22]_1 ),
        .\Data_A_i[22]_2 (\Data_A_i[22]_2 ),
        .\Data_A_i[22]_3 (\Data_A_i[22]_4 ),
        .\Data_A_i[22]_4 (\Data_A_i[22]_3 ),
        .\Data_B_i[18] (\Data_B_i[18] ),
        .\Data_B_i[18]_0 (\Data_B_i[18]_0 ),
        .\Data_B_i[18]_1 (\Data_B_i[18]_1 ),
        .\Data_B_i[18]_2 (\Data_B_i[18]_3 ),
        .\Data_B_i[22] (\Data_B_i[22] ),
        .\Data_B_i[22]_0 (\Data_B_i[22]_0 ),
        .S({\ODD1.middle_n_10 ,\ODD1.middle_n_11 ,\ODD1.middle_n_12 }),
        .p_0_in(p_0_in),
        .\sgf_result_o[15] (\sgf_result_o[15] ),
        .\sgf_result_o[15]_0 (\sgf_result_o[15]_0 ),
        .\sgf_result_o[15]_1 (\sgf_result_o[15]_1 ),
        .\sgf_result_o[15]_2 (\sgf_result_o[15]_2 ),
        .\sgf_result_o[15]_3 (\sgf_result_o[15]_3 ),
        .\sgf_result_o[15]_4 (\sgf_result_o[15]_4 ),
        .\sgf_result_o[15]_5 (\sgf_result_o[15]_5 ),
        .\sgf_result_o[15]_6 (\sgf_result_o[15]_6 ),
        .\sgf_result_o[15]_7 (\sgf_result_o[15]_7 ),
        .\sgf_result_o[15]_8 ({\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 }),
        .\sgf_result_o[19] ({\ODD1.middle_n_13 ,\ODD1.middle_n_14 }));
  CARRY4 sgf_result_o1__0_carry
       (.CI(1'b0),
        .CO({sgf_result_o1__0_carry_n_0,sgf_result_o1__0_carry_n_1,sgf_result_o1__0_carry_n_2,sgf_result_o1__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\ODD1.middle_n_7 ,\ODD1.middle_n_8 ,\ODD1.middle_n_9 ,1'b1}),
        .O(O),
        .S({\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 }));
  CARRY4 sgf_result_o1__0_carry__0
       (.CI(sgf_result_o1__0_carry_n_0),
        .CO({NLW_sgf_result_o1__0_carry__0_CO_UNCONNECTED[3:2],sgf_result_o1__0_carry__0_n_2,sgf_result_o1__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\ODD1.middle_n_13 ,\ODD1.middle_n_14 }),
        .O({NLW_sgf_result_o1__0_carry__0_O_UNCONNECTED[3],sgf_result_o1__0_carry__0_n_5,\sgf_result_o[19] }),
        .S({1'b0,\ODD1.middle_n_10 ,\ODD1.middle_n_11 ,\ODD1.middle_n_12 }));
  LUT3 #(
    .INIT(8'h2D)) 
    sgf_result_o1__21_carry__1_i_2__0
       (.I0(\Data_B_i[18]_2 ),
        .I1(\Data_A_i[18]_0 [0]),
        .I2(\Data_A_i[18]_0 [1]),
        .O(\sgf_result_o[23] ));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_2__0
       (.I0(\sgf_result_o[19] [1]),
        .I1(\Data_A_i[22]_2 ),
        .O(\^sgf_result_o[19]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_3__0
       (.I0(\sgf_result_o[19] [0]),
        .I1(\Data_A_i[22]_4 ),
        .O(\^sgf_result_o[19]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_4__0
       (.I0(O[3]),
        .I1(\Data_A_i[22]_3 ),
        .O(\^sgf_result_o[19]_0 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_1__0
       (.I0(O[2]),
        .I1(\Data_A_i[22]_0 ),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_2__0
       (.I0(O[1]),
        .I1(\Data_B_i[18]_1 ),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    sgf_result_o1_carry_i_3__1
       (.I0(O[0]),
        .I1(\Data_B_i[18]_3 ),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized15
   (\sgf_result_o[15] ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[15]_1 ,
    \sgf_result_o[15]_2 ,
    \sgf_result_o[15]_3 ,
    \sgf_result_o[15]_4 ,
    \sgf_result_o[15]_5 ,
    DI,
    S,
    \sgf_result_o[19] ,
    \sgf_result_o[15]_6 ,
    \sgf_result_o[15]_7 ,
    \sgf_result_o[15]_8 ,
    \Data_A_i[18] ,
    p_0_in,
    \Data_B_i[18] ,
    \Data_B_i[18]_0 ,
    \Data_A_i[22] ,
    \Data_B_i[22] ,
    \Data_A_i[22]_0 ,
    \Data_B_i[18]_1 ,
    \Data_A_i[22]_1 ,
    \Data_A_i[22]_2 ,
    CO,
    \Data_B_i[22]_0 ,
    \Data_A_i[22]_3 ,
    \Data_B_i[18]_2 ,
    \Data_A_i[22]_4 );
  output \sgf_result_o[15] ;
  output \sgf_result_o[15]_0 ;
  output \sgf_result_o[15]_1 ;
  output \sgf_result_o[15]_2 ;
  output \sgf_result_o[15]_3 ;
  output \sgf_result_o[15]_4 ;
  output \sgf_result_o[15]_5 ;
  output [2:0]DI;
  output [2:0]S;
  output [1:0]\sgf_result_o[19] ;
  output \sgf_result_o[15]_6 ;
  output \sgf_result_o[15]_7 ;
  output [3:0]\sgf_result_o[15]_8 ;
  input [3:0]\Data_A_i[18] ;
  input [2:0]p_0_in;
  input [3:0]\Data_B_i[18] ;
  input [1:0]\Data_B_i[18]_0 ;
  input \Data_A_i[22] ;
  input \Data_B_i[22] ;
  input \Data_A_i[22]_0 ;
  input \Data_B_i[18]_1 ;
  input \Data_A_i[22]_1 ;
  input \Data_A_i[22]_2 ;
  input [0:0]CO;
  input \Data_B_i[22]_0 ;
  input \Data_A_i[22]_3 ;
  input \Data_B_i[18]_2 ;
  input \Data_A_i[22]_4 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [3:0]\Data_A_i[18] ;
  wire \Data_A_i[22] ;
  wire \Data_A_i[22]_0 ;
  wire \Data_A_i[22]_1 ;
  wire \Data_A_i[22]_2 ;
  wire \Data_A_i[22]_3 ;
  wire \Data_A_i[22]_4 ;
  wire [3:0]\Data_B_i[18] ;
  wire [1:0]\Data_B_i[18]_0 ;
  wire \Data_B_i[18]_1 ;
  wire \Data_B_i[18]_2 ;
  wire \Data_B_i[22] ;
  wire \Data_B_i[22]_0 ;
  wire [2:0]S;
  wire [2:0]p_0_in;
  wire sgf_result_o0__1_carry__0_i_1__6_n_0;
  wire sgf_result_o0__1_carry__0_i_2__5_n_0;
  wire sgf_result_o0__1_carry__0_i_3__0_n_0;
  wire sgf_result_o0__1_carry__0_i_4__6_n_0;
  wire sgf_result_o0__1_carry__0_i_7__10_n_0;
  wire sgf_result_o0__1_carry__0_i_8__5_n_0;
  wire sgf_result_o0__1_carry__0_i_9__8_n_0;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_i_10__10_n_0;
  wire sgf_result_o0__1_carry_i_11__6_n_0;
  wire sgf_result_o0__1_carry_i_13__4_n_0;
  wire sgf_result_o0__1_carry_i_14__7_n_0;
  wire sgf_result_o0__1_carry_i_15__1_n_0;
  wire sgf_result_o0__1_carry_i_16__2_n_0;
  wire sgf_result_o0__1_carry_i_17__1_n_0;
  wire sgf_result_o0__1_carry_i_1__6_n_0;
  wire sgf_result_o0__1_carry_i_21__1_n_0;
  wire sgf_result_o0__1_carry_i_22_n_0;
  wire sgf_result_o0__1_carry_i_2__6_n_0;
  wire sgf_result_o0__1_carry_i_3__6_n_0;
  wire sgf_result_o0__1_carry_i_4__6_n_0;
  wire sgf_result_o0__1_carry_i_5__6_n_0;
  wire sgf_result_o0__1_carry_i_6__11_n_0;
  wire sgf_result_o0__1_carry_i_7__6_n_0;
  wire sgf_result_o0__1_carry_i_8__4_n_0;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire \sgf_result_o[15] ;
  wire \sgf_result_o[15]_0 ;
  wire \sgf_result_o[15]_1 ;
  wire \sgf_result_o[15]_2 ;
  wire \sgf_result_o[15]_3 ;
  wire \sgf_result_o[15]_4 ;
  wire \sgf_result_o[15]_5 ;
  wire \sgf_result_o[15]_6 ;
  wire \sgf_result_o[15]_7 ;
  wire [3:0]\sgf_result_o[15]_8 ;
  wire [1:0]\sgf_result_o[19] ;
  wire [3:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;

  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sgf_result_o0__1_carry_i_1__6_n_0,sgf_result_o0__1_carry_i_2__6_n_0,sgf_result_o0__1_carry_i_3__6_n_0,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S({sgf_result_o0__1_carry_i_4__6_n_0,sgf_result_o0__1_carry_i_5__6_n_0,sgf_result_o0__1_carry_i_6__11_n_0,sgf_result_o0__1_carry_i_7__6_n_0}));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3:2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,sgf_result_o0__1_carry__0_i_1__6_n_0}),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b0,sgf_result_o0__1_carry__0_i_2__5_n_0,sgf_result_o0__1_carry__0_i_3__0_n_0,sgf_result_o0__1_carry__0_i_4__6_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry__0_i_10
       (.I0(\Data_B_i[18] [0]),
        .I1(\Data_B_i[18]_0 [0]),
        .O(\sgf_result_o[15]_6 ));
  LUT6 #(
    .INIT(64'h00651075107565C3)) 
    sgf_result_o0__1_carry__0_i_1__6
       (.I0(\sgf_result_o[15] ),
        .I1(sgf_result_o0__1_carry_i_13__4_n_0),
        .I2(\sgf_result_o[15]_0 ),
        .I3(\sgf_result_o[15]_1 ),
        .I4(\sgf_result_o[15]_2 ),
        .I5(sgf_result_o0__1_carry__0_i_7__10_n_0),
        .O(sgf_result_o0__1_carry__0_i_1__6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    sgf_result_o0__1_carry__0_i_2__5
       (.I0(sgf_result_o0__1_carry__0_i_8__5_n_0),
        .I1(sgf_result_o0__1_carry_i_17__1_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__5_n_0));
  LUT4 #(
    .INIT(16'h0335)) 
    sgf_result_o0__1_carry__0_i_3__0
       (.I0(sgf_result_o0__1_carry_i_11__6_n_0),
        .I1(sgf_result_o0__1_carry_i_17__1_n_0),
        .I2(sgf_result_o0__1_carry__0_i_9__8_n_0),
        .I3(\sgf_result_o[15] ),
        .O(sgf_result_o0__1_carry__0_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h040404490B4646B9)) 
    sgf_result_o0__1_carry__0_i_4__6
       (.I0(sgf_result_o0__1_carry_i_13__4_n_0),
        .I1(\sgf_result_o[15]_0 ),
        .I2(\sgf_result_o[15]_1 ),
        .I3(\sgf_result_o[15]_2 ),
        .I4(sgf_result_o0__1_carry__0_i_7__10_n_0),
        .I5(\sgf_result_o[15] ),
        .O(sgf_result_o0__1_carry__0_i_4__6_n_0));
  LUT6 #(
    .INIT(64'h077FF880F880077F)) 
    sgf_result_o0__1_carry__0_i_5__0
       (.I0(\Data_A_i[18] [0]),
        .I1(p_0_in[0]),
        .I2(\Data_A_i[18] [1]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(\Data_A_i[18] [2]),
        .O(\sgf_result_o[15]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry__0_i_6__11
       (.I0(p_0_in[0]),
        .I1(\Data_A_i[18] [0]),
        .I2(p_0_in[1]),
        .I3(\Data_A_i[18] [1]),
        .O(\sgf_result_o[15]_2 ));
  LUT6 #(
    .INIT(64'h0909099F099F9F9F)) 
    sgf_result_o0__1_carry__0_i_7__10
       (.I0(\Data_A_i[18] [0]),
        .I1(p_0_in[0]),
        .I2(\Data_A_i[18] [3]),
        .I3(\Data_A_i[18] [2]),
        .I4(\sgf_result_o[15]_5 ),
        .I5(p_0_in[2]),
        .O(sgf_result_o0__1_carry__0_i_7__10_n_0));
  LUT6 #(
    .INIT(64'hE000008000808000)) 
    sgf_result_o0__1_carry__0_i_8__5
       (.I0(\Data_B_i[18] [3]),
        .I1(\sgf_result_o[15]_6 ),
        .I2(\sgf_result_o[15]_0 ),
        .I3(\Data_B_i[18] [2]),
        .I4(CO),
        .I5(\sgf_result_o[15]_7 ),
        .O(sgf_result_o0__1_carry__0_i_8__5_n_0));
  LUT6 #(
    .INIT(64'h7FF7F11FF11FF77F)) 
    sgf_result_o0__1_carry__0_i_9__8
       (.I0(sgf_result_o0__1_carry_i_22_n_0),
        .I1(\Data_B_i[18] [3]),
        .I2(\Data_B_i[18] [1]),
        .I3(\Data_B_i[18]_0 [1]),
        .I4(\Data_B_i[18] [0]),
        .I5(\Data_B_i[18]_0 [0]),
        .O(sgf_result_o0__1_carry__0_i_9__8_n_0));
  LUT6 #(
    .INIT(64'hE81717E817E8E817)) 
    sgf_result_o0__1_carry_i_10__10
       (.I0(p_0_in[2]),
        .I1(\sgf_result_o[15]_5 ),
        .I2(\Data_A_i[18] [2]),
        .I3(\Data_A_i[18] [3]),
        .I4(p_0_in[0]),
        .I5(\Data_A_i[18] [0]),
        .O(sgf_result_o0__1_carry_i_10__10_n_0));
  LUT6 #(
    .INIT(64'h0EF1F108F10808F7)) 
    sgf_result_o0__1_carry_i_11__6
       (.I0(\sgf_result_o[15]_4 ),
        .I1(\Data_A_i[18] [3]),
        .I2(\sgf_result_o[15]_2 ),
        .I3(\Data_A_i[18] [2]),
        .I4(p_0_in[2]),
        .I5(\sgf_result_o[15]_5 ),
        .O(sgf_result_o0__1_carry_i_11__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    sgf_result_o0__1_carry_i_12__5
       (.I0(\Data_B_i[18]_0 [0]),
        .I1(\Data_B_i[18] [0]),
        .I2(\Data_B_i[18]_0 [1]),
        .I3(\Data_B_i[18] [1]),
        .O(\sgf_result_o[15]_0 ));
  LUT6 #(
    .INIT(64'h0909099F099F9F9F)) 
    sgf_result_o0__1_carry_i_13__4
       (.I0(\Data_B_i[18] [0]),
        .I1(\Data_B_i[18]_0 [0]),
        .I2(\Data_B_i[18] [3]),
        .I3(\Data_B_i[18] [2]),
        .I4(\sgf_result_o[15]_7 ),
        .I5(CO),
        .O(sgf_result_o0__1_carry_i_13__4_n_0));
  LUT6 #(
    .INIT(64'hE81717E817E8E817)) 
    sgf_result_o0__1_carry_i_14__7
       (.I0(CO),
        .I1(\sgf_result_o[15]_7 ),
        .I2(\Data_B_i[18] [2]),
        .I3(\Data_B_i[18] [3]),
        .I4(\Data_B_i[18]_0 [0]),
        .I5(\Data_B_i[18] [0]),
        .O(sgf_result_o0__1_carry_i_14__7_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    sgf_result_o0__1_carry_i_15__1
       (.I0(sgf_result_o0__1_carry_i_8__4_n_0),
        .I1(sgf_result_o0__1_carry_i_21__1_n_0),
        .O(sgf_result_o0__1_carry_i_15__1_n_0));
  LUT6 #(
    .INIT(64'h6999999699969666)) 
    sgf_result_o0__1_carry_i_16__2
       (.I0(\Data_B_i[18] [1]),
        .I1(\Data_B_i[18]_0 [1]),
        .I2(sgf_result_o0__1_carry_i_22_n_0),
        .I3(\Data_B_i[18] [3]),
        .I4(\Data_B_i[18]_0 [0]),
        .I5(\Data_B_i[18] [0]),
        .O(sgf_result_o0__1_carry_i_16__2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF1FF7F77F)) 
    sgf_result_o0__1_carry_i_17__1
       (.I0(\sgf_result_o[15]_4 ),
        .I1(\Data_A_i[18] [3]),
        .I2(\Data_A_i[18] [2]),
        .I3(\sgf_result_o[15]_5 ),
        .I4(p_0_in[2]),
        .I5(\sgf_result_o[15]_2 ),
        .O(sgf_result_o0__1_carry_i_17__1_n_0));
  LUT6 #(
    .INIT(64'hFEEAEAEAA8808080)) 
    sgf_result_o0__1_carry_i_18__2
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(\Data_A_i[18] [1]),
        .I3(p_0_in[0]),
        .I4(\Data_A_i[18] [0]),
        .I5(\Data_A_i[18] [2]),
        .O(\sgf_result_o[15]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    sgf_result_o0__1_carry_i_19__2
       (.I0(p_0_in[1]),
        .I1(\Data_A_i[18] [1]),
        .I2(p_0_in[0]),
        .I3(\Data_A_i[18] [0]),
        .O(\sgf_result_o[15]_5 ));
  LUT6 #(
    .INIT(64'h22DD22228B8B22DD)) 
    sgf_result_o0__1_carry_i_1__6
       (.I0(sgf_result_o0__1_carry_i_8__4_n_0),
        .I1(\sgf_result_o[15] ),
        .I2(sgf_result_o0__1_carry_i_10__10_n_0),
        .I3(sgf_result_o0__1_carry_i_11__6_n_0),
        .I4(\sgf_result_o[15]_0 ),
        .I5(sgf_result_o0__1_carry_i_13__4_n_0),
        .O(sgf_result_o0__1_carry_i_1__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    sgf_result_o0__1_carry_i_20__1
       (.I0(\Data_B_i[18]_0 [1]),
        .I1(\Data_B_i[18] [1]),
        .I2(\Data_B_i[18]_0 [0]),
        .I3(\Data_B_i[18] [0]),
        .O(\sgf_result_o[15]_7 ));
  LUT6 #(
    .INIT(64'hE01F1F801F80807F)) 
    sgf_result_o0__1_carry_i_21__1
       (.I0(\Data_B_i[18] [3]),
        .I1(\sgf_result_o[15]_6 ),
        .I2(\sgf_result_o[15]_0 ),
        .I3(\Data_B_i[18] [2]),
        .I4(CO),
        .I5(\sgf_result_o[15]_7 ),
        .O(sgf_result_o0__1_carry_i_21__1_n_0));
  LUT6 #(
    .INIT(64'hFEEAEAEAA8808080)) 
    sgf_result_o0__1_carry_i_22
       (.I0(CO),
        .I1(\Data_B_i[18]_0 [1]),
        .I2(\Data_B_i[18] [1]),
        .I3(\Data_B_i[18]_0 [0]),
        .I4(\Data_B_i[18] [0]),
        .I5(\Data_B_i[18] [2]),
        .O(sgf_result_o0__1_carry_i_22_n_0));
  LUT5 #(
    .INIT(32'hA30A9039)) 
    sgf_result_o0__1_carry_i_2__6
       (.I0(sgf_result_o0__1_carry_i_8__4_n_0),
        .I1(sgf_result_o0__1_carry_i_10__10_n_0),
        .I2(sgf_result_o0__1_carry_i_13__4_n_0),
        .I3(\sgf_result_o[15]_0 ),
        .I4(\sgf_result_o[15] ),
        .O(sgf_result_o0__1_carry_i_2__6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    sgf_result_o0__1_carry_i_3__6
       (.I0(sgf_result_o0__1_carry_i_8__4_n_0),
        .I1(sgf_result_o0__1_carry_i_14__7_n_0),
        .O(sgf_result_o0__1_carry_i_3__6_n_0));
  LUT6 #(
    .INIT(64'hAA6AAA6AAA6A5555)) 
    sgf_result_o0__1_carry_i_4__6
       (.I0(sgf_result_o0__1_carry_i_1__6_n_0),
        .I1(sgf_result_o0__1_carry_i_15__1_n_0),
        .I2(sgf_result_o0__1_carry_i_16__2_n_0),
        .I3(sgf_result_o0__1_carry_i_10__10_n_0),
        .I4(sgf_result_o0__1_carry_i_17__1_n_0),
        .I5(sgf_result_o0__1_carry_i_14__7_n_0),
        .O(sgf_result_o0__1_carry_i_4__6_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    sgf_result_o0__1_carry_i_5__6
       (.I0(sgf_result_o0__1_carry_i_2__6_n_0),
        .I1(sgf_result_o0__1_carry_i_14__7_n_0),
        .I2(sgf_result_o0__1_carry_i_11__6_n_0),
        .O(sgf_result_o0__1_carry_i_5__6_n_0));
  LUT4 #(
    .INIT(16'h44B4)) 
    sgf_result_o0__1_carry_i_6__11
       (.I0(sgf_result_o0__1_carry_i_14__7_n_0),
        .I1(sgf_result_o0__1_carry_i_8__4_n_0),
        .I2(sgf_result_o0__1_carry_i_16__2_n_0),
        .I3(sgf_result_o0__1_carry_i_10__10_n_0),
        .O(sgf_result_o0__1_carry_i_6__11_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry_i_7__6
       (.I0(sgf_result_o0__1_carry_i_10__10_n_0),
        .I1(sgf_result_o0__1_carry_i_14__7_n_0),
        .O(sgf_result_o0__1_carry_i_7__6_n_0));
  LUT6 #(
    .INIT(64'h6999999699969666)) 
    sgf_result_o0__1_carry_i_8__4
       (.I0(\Data_A_i[18] [1]),
        .I1(p_0_in[1]),
        .I2(\sgf_result_o[15]_3 ),
        .I3(\Data_A_i[18] [3]),
        .I4(p_0_in[0]),
        .I5(\Data_A_i[18] [0]),
        .O(sgf_result_o0__1_carry_i_8__4_n_0));
  LUT6 #(
    .INIT(64'h077FF880F880077F)) 
    sgf_result_o0__1_carry_i_9__0
       (.I0(\Data_B_i[18] [0]),
        .I1(\Data_B_i[18]_0 [0]),
        .I2(\Data_B_i[18] [1]),
        .I3(\Data_B_i[18]_0 [1]),
        .I4(CO),
        .I5(\Data_B_i[18] [2]),
        .O(\sgf_result_o[15] ));
  LUT2 #(
    .INIT(4'hB)) 
    sgf_result_o1__0_carry__0_i_1__0
       (.I0(sgf_result_o0__1_carry__0_n_7),
        .I1(\Data_B_i[18]_1 ),
        .O(\sgf_result_o[19] [1]));
  (* HLUTNM = "lutpair27" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sgf_result_o1__0_carry__0_i_2__0
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_B_i[18]_2 ),
        .O(\sgf_result_o[19] [0]));
  LUT3 #(
    .INIT(8'h59)) 
    sgf_result_o1__0_carry__0_i_3__0
       (.I0(sgf_result_o0__1_carry__0_n_5),
        .I1(\Data_A_i[22]_0 ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .O(S[2]));
  LUT4 #(
    .INIT(16'hD22D)) 
    sgf_result_o1__0_carry__0_i_4__0
       (.I0(\Data_B_i[18]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[22]_0 ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h96)) 
    sgf_result_o1__0_carry__0_i_5__0
       (.I0(\sgf_result_o[19] [0]),
        .I1(\Data_B_i[18]_1 ),
        .I2(sgf_result_o0__1_carry__0_n_7),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_12__0
       (.I0(\Data_A_i[18] [0]),
        .I1(p_0_in[0]),
        .O(\sgf_result_o[15]_4 ));
  LUT3 #(
    .INIT(8'h71)) 
    sgf_result_o1__0_carry_i_1__0
       (.I0(\Data_A_i[22]_1 ),
        .I1(\Data_A_i[22]_2 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .O(DI[2]));
  (* HLUTNM = "lutpair26" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__0_carry_i_2__0
       (.I0(sgf_result_o0__1_carry_n_6),
        .I1(\Data_B_i[22]_0 ),
        .I2(\Data_A_i[22]_3 ),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'hA22AFBBFFBBFFBBF)) 
    sgf_result_o1__0_carry_i_3__0
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\sgf_result_o[15]_4 ),
        .I2(\Data_B_i[18] [0]),
        .I3(\Data_B_i[18]_0 [0]),
        .I4(\Data_A_i[22] ),
        .I5(\Data_B_i[22] ),
        .O(DI[0]));
  (* HLUTNM = "lutpair27" *) 
  LUT5 #(
    .INIT(32'h99696966)) 
    sgf_result_o1__0_carry_i_4__0
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_B_i[18]_2 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .I3(\Data_A_i[22]_2 ),
        .I4(\Data_A_i[22]_1 ),
        .O(\sgf_result_o[15]_8 [3]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__0_carry_i_5__0
       (.I0(DI[1]),
        .I1(\Data_A_i[22]_1 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .I3(\Data_A_i[22]_2 ),
        .O(\sgf_result_o[15]_8 [2]));
  (* HLUTNM = "lutpair26" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__0_carry_i_6__0
       (.I0(sgf_result_o0__1_carry_n_6),
        .I1(\Data_B_i[22]_0 ),
        .I2(\Data_A_i[22]_3 ),
        .I3(DI[0]),
        .O(\sgf_result_o[15]_8 [1]));
  LUT6 #(
    .INIT(64'h9999966996699999)) 
    sgf_result_o1__0_carry_i_7__0
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\Data_A_i[22]_4 ),
        .I2(\Data_B_i[18]_0 [0]),
        .I3(\Data_B_i[18] [0]),
        .I4(p_0_in[0]),
        .I5(\Data_A_i[18] [0]),
        .O(\sgf_result_o[15]_8 [0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized16
   (sgf_result_o_OBUF,
    O,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    Data_A_i_IBUF,
    Data_B_i_IBUF,
    S,
    \Data_A_i[5] ,
    \Data_A_i[11] ,
    \Data_A_i[8] );
  output [9:0]sgf_result_o_OBUF;
  output [1:0]O;
  output [0:0]\sgf_result_o[47] ;
  output [1:0]\sgf_result_o[47]_0 ;
  output [1:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [2:0]\sgf_result_o[47]_4 ;
  input [11:0]Data_A_i_IBUF;
  input [11:0]Data_B_i_IBUF;
  input [0:0]S;
  input [0:0]\Data_A_i[5] ;
  input [0:0]\Data_A_i[11] ;
  input [2:0]\Data_A_i[8] ;

  wire [0:0]\Data_A_i[11] ;
  wire [0:0]\Data_A_i[5] ;
  wire [2:0]\Data_A_i[8] ;
  wire [11:0]Data_A_i_IBUF;
  wire [11:0]Data_B_i_IBUF;
  wire \EVEN1.left_high_n_0 ;
  wire \EVEN1.left_high_n_1 ;
  wire \EVEN1.left_high_n_2 ;
  wire \EVEN1.left_high_n_3 ;
  wire \EVEN1.left_high_n_4 ;
  wire \EVEN1.left_high_n_7 ;
  wire \EVEN1.left_high_n_8 ;
  wire \EVEN1.middle_n_0 ;
  wire \EVEN1.middle_n_1 ;
  wire \EVEN1.middle_n_10 ;
  wire \EVEN1.middle_n_11 ;
  wire \EVEN1.middle_n_12 ;
  wire \EVEN1.middle_n_13 ;
  wire \EVEN1.middle_n_14 ;
  wire \EVEN1.middle_n_15 ;
  wire \EVEN1.middle_n_16 ;
  wire \EVEN1.middle_n_17 ;
  wire \EVEN1.middle_n_18 ;
  wire \EVEN1.middle_n_19 ;
  wire \EVEN1.middle_n_2 ;
  wire \EVEN1.middle_n_20 ;
  wire \EVEN1.middle_n_21 ;
  wire \EVEN1.middle_n_22 ;
  wire \EVEN1.middle_n_23 ;
  wire \EVEN1.middle_n_24 ;
  wire \EVEN1.middle_n_25 ;
  wire \EVEN1.middle_n_26 ;
  wire \EVEN1.middle_n_27 ;
  wire \EVEN1.middle_n_28 ;
  wire \EVEN1.middle_n_29 ;
  wire \EVEN1.middle_n_3 ;
  wire \EVEN1.middle_n_30 ;
  wire \EVEN1.middle_n_4 ;
  wire \EVEN1.middle_n_5 ;
  wire \EVEN1.middle_n_6 ;
  wire \EVEN1.middle_n_7 ;
  wire \EVEN1.middle_n_8 ;
  wire \EVEN1.middle_n_9 ;
  wire \EVEN1.right_lower_n_11 ;
  wire \EVEN1.right_lower_n_12 ;
  wire \EVEN1.right_lower_n_13 ;
  wire \EVEN1.right_lower_n_14 ;
  wire \EVEN1.right_lower_n_15 ;
  wire \EVEN1.right_lower_n_16 ;
  wire \EVEN1.right_lower_n_17 ;
  wire \EVEN1.right_lower_n_18 ;
  wire \EVEN1.right_lower_n_19 ;
  wire \EVEN1.right_lower_n_20 ;
  wire \EVEN1.right_lower_n_21 ;
  wire \EVEN1.right_lower_n_22 ;
  wire \EVEN1.right_lower_n_23 ;
  wire \EVEN1.right_lower_n_24 ;
  wire \EVEN1.right_lower_n_29 ;
  wire \EVEN1.right_lower_n_30 ;
  wire \EVEN1.right_lower_n_31 ;
  wire \EVEN1.right_lower_n_32 ;
  wire \EVEN1.right_lower_n_33 ;
  wire \EVEN1.right_lower_n_34 ;
  wire \EVEN1.right_lower_n_35 ;
  wire \EVEN1.right_lower_n_36 ;
  wire \EVEN1.right_lower_n_37 ;
  wire \EVEN1.right_lower_n_38 ;
  wire \EVEN1.right_lower_n_39 ;
  wire \EVEN1.right_lower_n_40 ;
  wire \EVEN1.right_lower_n_41 ;
  wire \EVEN1.right_lower_n_42 ;
  wire \EVEN1.right_lower_n_43 ;
  wire \EVEN1.right_lower_n_44 ;
  wire \EVEN1.right_lower_n_45 ;
  wire \EVEN1.right_lower_n_46 ;
  wire \EVEN1.right_lower_n_47 ;
  wire \EVEN1.right_lower_n_48 ;
  wire [1:0]O;
  wire [13:3]Q_middle_temp__0;
  wire [0:0]S;
  wire S_B0__0_carry__0_i_10_n_0;
  wire S_B0__0_carry__0_i_7_n_0;
  wire S_B0__0_carry__0_i_8_n_0;
  wire S_B0__0_carry__0_i_9_n_0;
  wire S_B0__0_carry_i_10__3_n_0;
  wire S_B0__0_carry_i_11_n_0;
  wire S_B0__0_carry_i_12_n_0;
  wire S_B0__0_carry_i_8_n_0;
  wire S_B0__0_carry_i_9_n_0;
  wire S_B0__30_carry__0_i_1_n_0;
  wire S_B0__30_carry__0_i_2_n_0;
  wire S_B0__30_carry__0_i_3_n_0;
  wire S_B0__30_carry__0_i_4_n_0;
  wire S_B0__30_carry__0_i_5_n_0;
  wire S_B0__30_carry__0_i_6_n_0;
  wire S_B0__30_carry__0_i_7_n_0;
  wire S_B0__30_carry__0_i_8_n_0;
  wire S_B0__30_carry__1_i_13_n_0;
  wire S_B0__30_carry__1_i_1_n_0;
  wire S_B0__30_carry__1_i_2_n_0;
  wire S_B0__30_carry__1_i_3_n_0;
  wire S_B0__30_carry__1_i_4_n_0;
  wire S_B0__30_carry__1_i_5_n_0;
  wire S_B0__30_carry__1_i_6_n_0;
  wire S_B0__30_carry__1_i_7_n_0;
  wire S_B0__30_carry__1_i_8_n_0;
  wire S_B0__30_carry__2_i_1_n_0;
  wire S_B0__30_carry__2_i_2_n_0;
  wire S_B0__30_carry_i_12_n_0;
  wire S_B0_carry__0_i_5_n_0;
  wire sgf_result_o0__1_carry__0_i_1__1_n_0;
  wire sgf_result_o0__1_carry__0_i_2__1_n_0;
  wire sgf_result_o0__1_carry__0_i_3__4_n_0;
  wire sgf_result_o0__1_carry__0_i_4__1_n_0;
  wire sgf_result_o0__1_carry__0_i_5__4_n_0;
  wire sgf_result_o0__1_carry__0_i_6__2_n_0;
  wire sgf_result_o0__1_carry__0_i_7__0_n_0;
  wire sgf_result_o0__1_carry__0_i_8__1_n_0;
  wire sgf_result_o0__1_carry__0_i_9__0_n_0;
  wire sgf_result_o0__1_carry_i_10_n_0;
  wire sgf_result_o0__1_carry_i_11__1_n_0;
  wire sgf_result_o0__1_carry_i_12_n_0;
  wire sgf_result_o0__1_carry_i_13_n_0;
  wire sgf_result_o0__1_carry_i_14_n_0;
  wire sgf_result_o0__1_carry_i_15_n_0;
  wire sgf_result_o0__1_carry_i_16_n_0;
  wire sgf_result_o0__1_carry_i_17_n_0;
  wire sgf_result_o0__1_carry_i_18_n_0;
  wire sgf_result_o0__1_carry_i_19_n_0;
  wire sgf_result_o0__1_carry_i_1__1_n_0;
  wire sgf_result_o0__1_carry_i_2__1_n_0;
  wire sgf_result_o0__1_carry_i_3__1_n_0;
  wire sgf_result_o0__1_carry_i_4__1_n_0;
  wire sgf_result_o0__1_carry_i_5__1_n_0;
  wire sgf_result_o0__1_carry_i_6__1_n_0;
  wire sgf_result_o0__1_carry_i_7__1_n_0;
  wire sgf_result_o0__1_carry_i_8__8_n_0;
  wire sgf_result_o0__1_carry_i_8__8_n_1;
  wire sgf_result_o0__1_carry_i_8__8_n_2;
  wire sgf_result_o0__1_carry_i_8__8_n_3;
  wire sgf_result_o0__1_carry_i_8__8_n_4;
  wire sgf_result_o0__1_carry_i_8__8_n_5;
  wire sgf_result_o0__1_carry_i_8__8_n_6;
  wire sgf_result_o0__1_carry_i_8__8_n_7;
  wire sgf_result_o0__1_carry_i_9__3_n_0;
  wire sgf_result_o0__1_carry_i_9__3_n_1;
  wire sgf_result_o0__1_carry_i_9__3_n_2;
  wire sgf_result_o0__1_carry_i_9__3_n_3;
  wire sgf_result_o0__1_carry_i_9__3_n_4;
  wire sgf_result_o0__1_carry_i_9__3_n_5;
  wire sgf_result_o0__1_carry_i_9__3_n_6;
  wire sgf_result_o0__1_carry_i_9__3_n_7;
  wire sgf_result_o1__0_carry_i_13__0_n_1;
  wire sgf_result_o1__0_carry_i_13__0_n_3;
  wire sgf_result_o1__0_carry_i_13__0_n_6;
  wire sgf_result_o1__0_carry_i_13__0_n_7;
  wire sgf_result_o1__0_carry_i_18_n_1;
  wire sgf_result_o1__0_carry_i_18_n_3;
  wire sgf_result_o1__0_carry_i_18_n_6;
  wire sgf_result_o1__0_carry_i_18_n_7;
  wire sgf_result_o1__0_carry_i_20_n_0;
  wire sgf_result_o1__0_carry_i_21_n_0;
  wire sgf_result_o1__0_carry_i_23_n_0;
  wire sgf_result_o1__0_carry_i_24_n_0;
  wire sgf_result_o1__21_carry__0_i_10_n_0;
  wire sgf_result_o1__21_carry__0_i_9_n_0;
  wire sgf_result_o1__21_carry_i_10_n_0;
  wire sgf_result_o1__21_carry_i_8_n_0;
  wire sgf_result_o1__21_carry_i_9_n_0;
  wire sgf_result_o1_carry_i_4_n_0;
  wire [0:0]\sgf_result_o[47] ;
  wire [1:0]\sgf_result_o[47]_0 ;
  wire [1:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [2:0]\sgf_result_o[47]_4 ;
  wire [9:0]sgf_result_o_OBUF;
  wire \sgf_result_o_OBUF[4]_inst_i_5_n_0 ;
  wire [3:1]NLW_sgf_result_o1__0_carry_i_13__0_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o1__0_carry_i_13__0_O_UNCONNECTED;
  wire [3:1]NLW_sgf_result_o1__0_carry_i_18_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o1__0_carry_i_18_O_UNCONNECTED;

  Recursive_KOA__parameterized17 \EVEN1.left_high 
       (.Data_A_i_IBUF(Data_A_i_IBUF[11:6]),
        .\Data_B_i[10] (S),
        .Data_B_i_IBUF(Data_B_i_IBUF[11:6]),
        .O({\EVEN1.left_high_n_1 ,\EVEN1.left_high_n_2 ,\EVEN1.left_high_n_3 ,\EVEN1.left_high_n_4 }),
        .S(S_B0__30_carry_i_12_n_0),
        .\sgf_result_o[47] (\EVEN1.left_high_n_0 ),
        .\sgf_result_o[47]_0 ({\sgf_result_o[47]_0 ,\EVEN1.left_high_n_7 ,\EVEN1.left_high_n_8 }),
        .\sgf_result_o[47]_1 (O));
  Recursive_KOA__parameterized25 \EVEN1.middle 
       (.CO(sgf_result_o1__0_carry_i_18_n_1),
        .DI({sgf_result_o0__1_carry_i_1__1_n_0,sgf_result_o0__1_carry_i_2__1_n_0,sgf_result_o0__1_carry_i_3__1_n_0}),
        .\Data_A_i[10] (sgf_result_o1_carry_i_4_n_0),
        .\Data_A_i[11] ({\EVEN1.left_high_n_3 ,\EVEN1.left_high_n_4 }),
        .\Data_A_i[11]_0 ({\EVEN1.right_lower_n_35 ,\EVEN1.right_lower_n_36 ,\EVEN1.right_lower_n_37 ,\Data_A_i[5] }),
        .\Data_A_i[11]_1 ({\Data_A_i[11] ,\EVEN1.right_lower_n_46 ,\EVEN1.right_lower_n_47 ,\EVEN1.right_lower_n_48 }),
        .\Data_A_i[2] ({\EVEN1.right_lower_n_19 ,\EVEN1.right_lower_n_20 ,\EVEN1.right_lower_n_21 ,\EVEN1.right_lower_n_22 }),
        .\Data_A_i[2]_0 ({\EVEN1.right_lower_n_42 ,\EVEN1.right_lower_n_43 ,\EVEN1.right_lower_n_44 ,\EVEN1.right_lower_n_45 }),
        .\Data_A_i[2]_1 ({\EVEN1.right_lower_n_23 ,\EVEN1.right_lower_n_24 }),
        .\Data_A_i[5] ({\EVEN1.right_lower_n_11 ,\EVEN1.right_lower_n_12 ,\EVEN1.right_lower_n_13 ,\EVEN1.right_lower_n_14 }),
        .\Data_A_i[5]_0 ({\EVEN1.right_lower_n_15 ,\EVEN1.right_lower_n_16 ,\EVEN1.right_lower_n_17 ,\EVEN1.right_lower_n_18 }),
        .\Data_A_i[5]_1 ({\EVEN1.right_lower_n_38 ,\EVEN1.right_lower_n_39 ,\EVEN1.right_lower_n_40 ,\EVEN1.right_lower_n_41 }),
        .\Data_A_i[6] ({sgf_result_o0__1_carry__0_i_4__1_n_0,sgf_result_o0__1_carry__0_i_5__4_n_0,sgf_result_o0__1_carry__0_i_6__2_n_0}),
        .\Data_A_i[6]_0 ({sgf_result_o0__1_carry_i_9__3_n_4,sgf_result_o0__1_carry_i_9__3_n_5,sgf_result_o0__1_carry_i_9__3_n_6,sgf_result_o0__1_carry_i_9__3_n_7}),
        .\Data_A_i[6]_1 ({sgf_result_o1__0_carry_i_18_n_6,sgf_result_o1__0_carry_i_18_n_7}),
        .\Data_A_i[6]_2 (sgf_result_o1__21_carry_i_10_n_0),
        .\Data_A_i[6]_3 (sgf_result_o1__21_carry_i_8_n_0),
        .\Data_A_i[6]_4 (sgf_result_o1__21_carry_i_9_n_0),
        .\Data_A_i[6]_5 (sgf_result_o1__21_carry__0_i_10_n_0),
        .\Data_A_i[6]_6 (Q_middle_temp__0[3]),
        .\Data_A_i[8] (\Data_A_i[8] ),
        .Data_A_i_IBUF({Data_A_i_IBUF[7:6],Data_A_i_IBUF[0]}),
        .\Data_B_i[0] (sgf_result_o_OBUF[0]),
        .\Data_B_i[6] ({sgf_result_o0__1_carry__0_i_1__1_n_0,sgf_result_o0__1_carry__0_i_2__1_n_0,sgf_result_o0__1_carry__0_i_3__4_n_0}),
        .\Data_B_i[6]_0 ({sgf_result_o0__1_carry_i_8__8_n_4,sgf_result_o0__1_carry_i_8__8_n_5,sgf_result_o0__1_carry_i_8__8_n_6,sgf_result_o0__1_carry_i_8__8_n_7}),
        .\Data_B_i[6]_1 ({sgf_result_o1__0_carry_i_13__0_n_6,sgf_result_o1__0_carry_i_13__0_n_7}),
        .\Data_B_i[6]_2 (sgf_result_o1__0_carry_i_13__0_n_1),
        .\Data_B_i[6]_3 (sgf_result_o1__21_carry__0_i_9_n_0),
        .\Data_B_i[6]_4 (S_B0_carry__0_i_5_n_0),
        .\Data_B_i[6]_5 (\EVEN1.left_high_n_0 ),
        .Data_B_i_IBUF({Data_B_i_IBUF[7:6],Data_B_i_IBUF[0]}),
        .O({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 ,\EVEN1.middle_n_3 }),
        .S({sgf_result_o0__1_carry_i_4__1_n_0,sgf_result_o0__1_carry_i_5__1_n_0,sgf_result_o0__1_carry_i_6__1_n_0,sgf_result_o0__1_carry_i_7__1_n_0}),
        .\sgf_result_o[47] ({\EVEN1.middle_n_4 ,\EVEN1.middle_n_5 ,\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 }),
        .\sgf_result_o[47]_0 (\EVEN1.middle_n_8 ),
        .\sgf_result_o[47]_1 ({\EVEN1.middle_n_9 ,\EVEN1.middle_n_10 ,\EVEN1.middle_n_11 }),
        .\sgf_result_o[47]_10 (sgf_result_o_OBUF[9:4]),
        .\sgf_result_o[47]_11 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_12 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_13 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_14 (\sgf_result_o[47]_4 ),
        .\sgf_result_o[47]_2 (\EVEN1.middle_n_12 ),
        .\sgf_result_o[47]_3 (\EVEN1.middle_n_13 ),
        .\sgf_result_o[47]_4 (\EVEN1.middle_n_14 ),
        .\sgf_result_o[47]_5 (\EVEN1.middle_n_15 ),
        .\sgf_result_o[47]_6 ({\EVEN1.middle_n_16 ,\EVEN1.middle_n_17 ,\EVEN1.middle_n_18 }),
        .\sgf_result_o[47]_7 ({\EVEN1.middle_n_19 ,\EVEN1.middle_n_20 ,\EVEN1.middle_n_21 ,\EVEN1.middle_n_22 }),
        .\sgf_result_o[47]_8 ({\EVEN1.middle_n_23 ,\EVEN1.middle_n_24 ,\EVEN1.middle_n_25 ,\EVEN1.middle_n_26 }),
        .\sgf_result_o[47]_9 ({\EVEN1.middle_n_27 ,\EVEN1.middle_n_28 ,\EVEN1.middle_n_29 ,\EVEN1.middle_n_30 }),
        .sgf_result_o_OBUF(sgf_result_o_OBUF[2:1]));
  Recursive_KOA__parameterized21 \EVEN1.right_lower 
       (.DI({S_B0__30_carry__0_i_1_n_0,S_B0__30_carry__0_i_2_n_0,S_B0__30_carry__0_i_3_n_0,S_B0__30_carry__0_i_4_n_0}),
        .\Data_A_i[11] ({\EVEN1.middle_n_27 ,\EVEN1.middle_n_28 ,\EVEN1.middle_n_29 ,\EVEN1.middle_n_30 }),
        .\Data_A_i[11]_0 ({\EVEN1.left_high_n_1 ,\EVEN1.left_high_n_2 ,\EVEN1.left_high_n_3 ,\EVEN1.left_high_n_4 }),
        .\Data_A_i[11]_1 ({\EVEN1.left_high_n_7 ,\EVEN1.left_high_n_8 }),
        .\Data_A_i[2] ({S_B0__30_carry__1_i_5_n_0,S_B0__30_carry__1_i_6_n_0,S_B0__30_carry__1_i_7_n_0,S_B0__30_carry__1_i_8_n_0}),
        .\Data_A_i[2]_0 (S_B0__0_carry_i_8_n_0),
        .\Data_A_i[2]_1 (S_B0__0_carry_i_10__3_n_0),
        .\Data_A_i[2]_2 (S_B0__0_carry__0_i_8_n_0),
        .\Data_A_i[2]_3 (\sgf_result_o_OBUF[4]_inst_i_5_n_0 ),
        .\Data_A_i[5] ({\EVEN1.middle_n_9 ,\EVEN1.middle_n_10 ,\EVEN1.middle_n_11 }),
        .\Data_A_i[5]_0 (S_B0__0_carry_i_9_n_0),
        .\Data_A_i[5]_1 (S_B0__0_carry_i_11_n_0),
        .\Data_A_i[5]_2 (S_B0__0_carry__0_i_7_n_0),
        .\Data_A_i[6] ({\EVEN1.middle_n_19 ,\EVEN1.middle_n_20 ,\EVEN1.middle_n_21 ,\EVEN1.middle_n_22 }),
        .\Data_A_i[6]_0 ({\EVEN1.middle_n_4 ,\EVEN1.middle_n_5 ,\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 }),
        .\Data_A_i[6]_1 (\EVEN1.middle_n_8 ),
        .\Data_A_i[6]_2 ({S_B0__30_carry__2_i_1_n_0,S_B0__30_carry__2_i_2_n_0}),
        .\Data_A_i[8] ({S_B0__30_carry__1_i_1_n_0,S_B0__30_carry__1_i_2_n_0,S_B0__30_carry__1_i_3_n_0,S_B0__30_carry__1_i_4_n_0}),
        .Data_A_i_IBUF(Data_A_i_IBUF[7:0]),
        .\Data_B_i[0] (sgf_result_o_OBUF[0]),
        .\Data_B_i[1] (S_B0__0_carry__0_i_9_n_0),
        .\Data_B_i[3] (S_B0__0_carry_i_12_n_0),
        .\Data_B_i[4] (S_B0__0_carry__0_i_10_n_0),
        .\Data_B_i[4]_0 (S_B0__30_carry__1_i_13_n_0),
        .\Data_B_i[6] ({\EVEN1.middle_n_23 ,\EVEN1.middle_n_24 ,\EVEN1.middle_n_25 ,\EVEN1.middle_n_26 }),
        .\Data_B_i[6]_0 ({\EVEN1.middle_n_16 ,\EVEN1.middle_n_17 ,\EVEN1.middle_n_18 }),
        .Data_B_i_IBUF(Data_B_i_IBUF[7:0]),
        .O({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 ,\EVEN1.middle_n_3 }),
        .Q_middle_temp__0(Q_middle_temp__0),
        .S({S_B0__30_carry__0_i_5_n_0,S_B0__30_carry__0_i_6_n_0,S_B0__30_carry__0_i_7_n_0,S_B0__30_carry__0_i_8_n_0}),
        .\sgf_result_o[47] ({\EVEN1.right_lower_n_11 ,\EVEN1.right_lower_n_12 ,\EVEN1.right_lower_n_13 ,\EVEN1.right_lower_n_14 }),
        .\sgf_result_o[47]_0 ({\EVEN1.right_lower_n_15 ,\EVEN1.right_lower_n_16 ,\EVEN1.right_lower_n_17 ,\EVEN1.right_lower_n_18 }),
        .\sgf_result_o[47]_1 ({\EVEN1.right_lower_n_19 ,\EVEN1.right_lower_n_20 ,\EVEN1.right_lower_n_21 ,\EVEN1.right_lower_n_22 }),
        .\sgf_result_o[47]_2 ({\EVEN1.right_lower_n_23 ,\EVEN1.right_lower_n_24 }),
        .\sgf_result_o[47]_3 ({\sgf_result_o[47] ,sgf_result_o_OBUF[3:1]}),
        .\sgf_result_o[47]_4 ({\EVEN1.right_lower_n_29 ,\EVEN1.right_lower_n_30 ,\EVEN1.right_lower_n_31 ,\EVEN1.right_lower_n_32 }),
        .\sgf_result_o[47]_5 ({\EVEN1.right_lower_n_33 ,\EVEN1.right_lower_n_34 }),
        .\sgf_result_o[47]_6 ({\EVEN1.right_lower_n_35 ,\EVEN1.right_lower_n_36 ,\EVEN1.right_lower_n_37 }),
        .\sgf_result_o[47]_7 ({\EVEN1.right_lower_n_38 ,\EVEN1.right_lower_n_39 ,\EVEN1.right_lower_n_40 ,\EVEN1.right_lower_n_41 }),
        .\sgf_result_o[47]_8 ({\EVEN1.right_lower_n_42 ,\EVEN1.right_lower_n_43 ,\EVEN1.right_lower_n_44 ,\EVEN1.right_lower_n_45 }),
        .\sgf_result_o[47]_9 ({\EVEN1.right_lower_n_46 ,\EVEN1.right_lower_n_47 ,\EVEN1.right_lower_n_48 }));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__0_carry__0_i_10
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_B_i_IBUF[5]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_B_i_IBUF[4]),
        .O(S_B0__0_carry__0_i_10_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_7
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_8
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry__0_i_8_n_0));
  LUT6 #(
    .INIT(64'h55FF7FFF7FFFFFFF)) 
    S_B0__0_carry__0_i_9
       (.I0(Data_A_i_IBUF[2]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_B_i_IBUF[2]),
        .I4(Data_A_i_IBUF[1]),
        .I5(Data_B_i_IBUF[1]),
        .O(S_B0__0_carry__0_i_9_n_0));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_10__3
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry_i_10__3_n_0));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_11
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_12
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_B_i_IBUF[3]),
        .O(S_B0__0_carry_i_12_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_8
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_9
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry_i_9_n_0));
  (* HLUTNM = "lutpair15" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__0_i_1
       (.I0(Q_middle_temp__0[6]),
        .I1(\EVEN1.left_high_n_8 ),
        .I2(\EVEN1.right_lower_n_32 ),
        .O(S_B0__30_carry__0_i_1_n_0));
  (* HLUTNM = "lutpair14" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__0_i_2
       (.I0(Q_middle_temp__0[5]),
        .I1(\EVEN1.left_high_n_1 ),
        .I2(\sgf_result_o[47] ),
        .O(S_B0__30_carry__0_i_2_n_0));
  (* HLUTNM = "lutpair13" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__0_i_3
       (.I0(Q_middle_temp__0[4]),
        .I1(\EVEN1.left_high_n_2 ),
        .I2(sgf_result_o_OBUF[3]),
        .O(S_B0__30_carry__0_i_3_n_0));
  (* HLUTNM = "lutpair12" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__0_i_4
       (.I0(Q_middle_temp__0[3]),
        .I1(\EVEN1.left_high_n_3 ),
        .I2(sgf_result_o_OBUF[2]),
        .O(S_B0__30_carry__0_i_4_n_0));
  (* HLUTNM = "lutpair16" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__0_i_5
       (.I0(Q_middle_temp__0[7]),
        .I1(\EVEN1.left_high_n_7 ),
        .I2(\EVEN1.right_lower_n_31 ),
        .I3(S_B0__30_carry__0_i_1_n_0),
        .O(S_B0__30_carry__0_i_5_n_0));
  (* HLUTNM = "lutpair15" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__0_i_6
       (.I0(Q_middle_temp__0[6]),
        .I1(\EVEN1.left_high_n_8 ),
        .I2(\EVEN1.right_lower_n_32 ),
        .I3(S_B0__30_carry__0_i_2_n_0),
        .O(S_B0__30_carry__0_i_6_n_0));
  (* HLUTNM = "lutpair14" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__0_i_7
       (.I0(Q_middle_temp__0[5]),
        .I1(\EVEN1.left_high_n_1 ),
        .I2(\sgf_result_o[47] ),
        .I3(S_B0__30_carry__0_i_3_n_0),
        .O(S_B0__30_carry__0_i_7_n_0));
  (* HLUTNM = "lutpair13" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__0_i_8
       (.I0(Q_middle_temp__0[4]),
        .I1(\EVEN1.left_high_n_2 ),
        .I2(sgf_result_o_OBUF[3]),
        .I3(S_B0__30_carry__0_i_4_n_0),
        .O(S_B0__30_carry__0_i_8_n_0));
  (* HLUTNM = "lutpair19" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__1_i_1
       (.I0(Q_middle_temp__0[10]),
        .I1(O[0]),
        .I2(\EVEN1.right_lower_n_34 ),
        .O(S_B0__30_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__30_carry__1_i_13
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_B_i_IBUF[5]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_B_i_IBUF[4]),
        .O(S_B0__30_carry__1_i_13_n_0));
  (* HLUTNM = "lutpair18" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__1_i_2
       (.I0(Q_middle_temp__0[9]),
        .I1(\sgf_result_o[47]_0 [1]),
        .I2(\EVEN1.right_lower_n_29 ),
        .O(S_B0__30_carry__1_i_2_n_0));
  (* HLUTNM = "lutpair17" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__1_i_3
       (.I0(Q_middle_temp__0[8]),
        .I1(\sgf_result_o[47]_0 [0]),
        .I2(\EVEN1.right_lower_n_30 ),
        .O(S_B0__30_carry__1_i_3_n_0));
  (* HLUTNM = "lutpair16" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry__1_i_4
       (.I0(Q_middle_temp__0[7]),
        .I1(\EVEN1.left_high_n_7 ),
        .I2(\EVEN1.right_lower_n_31 ),
        .O(S_B0__30_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__1_i_5
       (.I0(S_B0__30_carry__1_i_1_n_0),
        .I1(Q_middle_temp__0[11]),
        .I2(O[1]),
        .I3(\EVEN1.right_lower_n_33 ),
        .O(S_B0__30_carry__1_i_5_n_0));
  (* HLUTNM = "lutpair19" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__1_i_6
       (.I0(Q_middle_temp__0[10]),
        .I1(O[0]),
        .I2(\EVEN1.right_lower_n_34 ),
        .I3(S_B0__30_carry__1_i_2_n_0),
        .O(S_B0__30_carry__1_i_6_n_0));
  (* HLUTNM = "lutpair18" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__1_i_7
       (.I0(Q_middle_temp__0[9]),
        .I1(\sgf_result_o[47]_0 [1]),
        .I2(\EVEN1.right_lower_n_29 ),
        .I3(S_B0__30_carry__1_i_3_n_0),
        .O(S_B0__30_carry__1_i_7_n_0));
  (* HLUTNM = "lutpair17" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry__1_i_8
       (.I0(Q_middle_temp__0[8]),
        .I1(\sgf_result_o[47]_0 [0]),
        .I2(\EVEN1.right_lower_n_30 ),
        .I3(S_B0__30_carry__1_i_4_n_0),
        .O(S_B0__30_carry__1_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    S_B0__30_carry__2_i_1
       (.I0(Q_middle_temp__0[13]),
        .O(S_B0__30_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h8E71)) 
    S_B0__30_carry__2_i_2
       (.I0(\EVEN1.right_lower_n_33 ),
        .I1(O[1]),
        .I2(Q_middle_temp__0[11]),
        .I3(Q_middle_temp__0[12]),
        .O(S_B0__30_carry__2_i_2_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__30_carry_i_12
       (.I0(Data_B_i_IBUF[7]),
        .I1(Data_A_i_IBUF[7]),
        .I2(Data_B_i_IBUF[8]),
        .I3(Data_A_i_IBUF[6]),
        .I4(Data_B_i_IBUF[6]),
        .I5(Data_A_i_IBUF[8]),
        .O(S_B0__30_carry_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    S_B0_carry__0_i_5
       (.I0(sgf_result_o1__0_carry_i_18_n_6),
        .I1(sgf_result_o1__0_carry_i_13__0_n_6),
        .O(S_B0_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_1__1
       (.I0(sgf_result_o0__1_carry_i_9__3_n_4),
        .I1(sgf_result_o0__1_carry_i_8__8_n_4),
        .O(sgf_result_o0__1_carry__0_i_1__1_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    sgf_result_o0__1_carry__0_i_2__1
       (.I0(sgf_result_o0__1_carry_i_10_n_0),
        .I1(sgf_result_o0__1_carry_i_8__8_n_6),
        .I2(sgf_result_o0__1_carry_i_9__3_n_7),
        .I3(sgf_result_o0__1_carry_i_8__8_n_7),
        .I4(sgf_result_o0__1_carry_i_9__3_n_4),
        .I5(sgf_result_o0__1_carry__0_i_7__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__1_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    sgf_result_o0__1_carry__0_i_3__4
       (.I0(sgf_result_o0__1_carry_i_10_n_0),
        .I1(sgf_result_o0__1_carry_i_8__8_n_6),
        .I2(sgf_result_o0__1_carry_i_9__3_n_7),
        .I3(sgf_result_o0__1_carry_i_8__8_n_7),
        .I4(sgf_result_o0__1_carry_i_9__3_n_4),
        .I5(sgf_result_o0__1_carry__0_i_7__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__4_n_0));
  LUT6 #(
    .INIT(64'h173F8080C0000000)) 
    sgf_result_o0__1_carry__0_i_4__1
       (.I0(sgf_result_o0__1_carry_i_8__8_n_6),
        .I1(sgf_result_o0__1_carry_i_9__3_n_5),
        .I2(sgf_result_o0__1_carry_i_8__8_n_5),
        .I3(sgf_result_o0__1_carry_i_9__3_n_6),
        .I4(sgf_result_o0__1_carry_i_8__8_n_4),
        .I5(sgf_result_o0__1_carry_i_9__3_n_4),
        .O(sgf_result_o0__1_carry__0_i_4__1_n_0));
  LUT6 #(
    .INIT(64'h9666699969996999)) 
    sgf_result_o0__1_carry__0_i_5__4
       (.I0(sgf_result_o0__1_carry__0_i_2__1_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__1_n_0),
        .I2(sgf_result_o0__1_carry_i_9__3_n_4),
        .I3(sgf_result_o0__1_carry_i_8__8_n_5),
        .I4(sgf_result_o0__1_carry_i_9__3_n_5),
        .I5(sgf_result_o0__1_carry_i_8__8_n_4),
        .O(sgf_result_o0__1_carry__0_i_5__4_n_0));
  LUT6 #(
    .INIT(64'h56666AAA6AAA6AAA)) 
    sgf_result_o0__1_carry__0_i_6__2
       (.I0(sgf_result_o0__1_carry__0_i_3__4_n_0),
        .I1(sgf_result_o0__1_carry__0_i_9__0_n_0),
        .I2(sgf_result_o0__1_carry_i_9__3_n_6),
        .I3(sgf_result_o0__1_carry_i_8__8_n_5),
        .I4(sgf_result_o0__1_carry_i_9__3_n_7),
        .I5(sgf_result_o0__1_carry_i_8__8_n_4),
        .O(sgf_result_o0__1_carry__0_i_6__2_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry__0_i_7__0
       (.I0(sgf_result_o0__1_carry_i_8__8_n_6),
        .I1(sgf_result_o0__1_carry_i_9__3_n_4),
        .I2(sgf_result_o0__1_carry_i_9__3_n_5),
        .I3(sgf_result_o0__1_carry_i_8__8_n_5),
        .I4(sgf_result_o0__1_carry_i_9__3_n_6),
        .I5(sgf_result_o0__1_carry_i_8__8_n_4),
        .O(sgf_result_o0__1_carry__0_i_7__0_n_0));
  LUT6 #(
    .INIT(64'h07777FFF7FFF7FFF)) 
    sgf_result_o0__1_carry__0_i_8__1
       (.I0(sgf_result_o0__1_carry_i_8__8_n_4),
        .I1(sgf_result_o0__1_carry_i_9__3_n_6),
        .I2(sgf_result_o0__1_carry_i_8__8_n_5),
        .I3(sgf_result_o0__1_carry_i_9__3_n_5),
        .I4(sgf_result_o0__1_carry_i_9__3_n_4),
        .I5(sgf_result_o0__1_carry_i_8__8_n_6),
        .O(sgf_result_o0__1_carry__0_i_8__1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_9__0
       (.I0(sgf_result_o0__1_carry_i_9__3_n_5),
        .I1(sgf_result_o0__1_carry_i_8__8_n_6),
        .O(sgf_result_o0__1_carry__0_i_9__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_10
       (.I0(sgf_result_o0__1_carry_i_9__3_n_6),
        .I1(sgf_result_o0__1_carry_i_8__8_n_5),
        .O(sgf_result_o0__1_carry_i_10_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_11__1
       (.I0(sgf_result_o0__1_carry_i_8__8_n_7),
        .I1(sgf_result_o0__1_carry_i_9__3_n_4),
        .O(sgf_result_o0__1_carry_i_11__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_12
       (.I0(Data_B_i_IBUF[3]),
        .I1(Data_B_i_IBUF[9]),
        .O(sgf_result_o0__1_carry_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_13
       (.I0(Data_B_i_IBUF[2]),
        .I1(Data_B_i_IBUF[8]),
        .O(sgf_result_o0__1_carry_i_13_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_14
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[7]),
        .O(sgf_result_o0__1_carry_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_15
       (.I0(Data_B_i_IBUF[0]),
        .I1(Data_B_i_IBUF[6]),
        .O(sgf_result_o0__1_carry_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_16
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[9]),
        .O(sgf_result_o0__1_carry_i_16_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_17
       (.I0(Data_A_i_IBUF[2]),
        .I1(Data_A_i_IBUF[8]),
        .O(sgf_result_o0__1_carry_i_17_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_18
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[7]),
        .O(sgf_result_o0__1_carry_i_18_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_19
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_A_i_IBUF[6]),
        .O(sgf_result_o0__1_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_1__1
       (.I0(sgf_result_o0__1_carry_i_8__8_n_6),
        .I1(sgf_result_o0__1_carry_i_9__3_n_5),
        .I2(sgf_result_o0__1_carry_i_9__3_n_6),
        .I3(sgf_result_o0__1_carry_i_8__8_n_5),
        .I4(sgf_result_o0__1_carry_i_9__3_n_7),
        .I5(sgf_result_o0__1_carry_i_8__8_n_4),
        .O(sgf_result_o0__1_carry_i_1__1_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_2__1
       (.I0(sgf_result_o0__1_carry_i_8__8_n_6),
        .I1(sgf_result_o0__1_carry_i_9__3_n_6),
        .I2(sgf_result_o0__1_carry_i_8__8_n_5),
        .I3(sgf_result_o0__1_carry_i_9__3_n_7),
        .O(sgf_result_o0__1_carry_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_3__1
       (.I0(sgf_result_o0__1_carry_i_9__3_n_7),
        .I1(sgf_result_o0__1_carry_i_8__8_n_6),
        .O(sgf_result_o0__1_carry_i_3__1_n_0));
  LUT6 #(
    .INIT(64'h99A5C30F665A3CF0)) 
    sgf_result_o0__1_carry_i_4__1
       (.I0(sgf_result_o0__1_carry_i_8__8_n_4),
        .I1(sgf_result_o0__1_carry_i_9__3_n_5),
        .I2(sgf_result_o0__1_carry_i_10_n_0),
        .I3(sgf_result_o0__1_carry_i_8__8_n_6),
        .I4(sgf_result_o0__1_carry_i_9__3_n_7),
        .I5(sgf_result_o0__1_carry_i_11__1_n_0),
        .O(sgf_result_o0__1_carry_i_4__1_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_5__1
       (.I0(sgf_result_o0__1_carry_i_9__3_n_7),
        .I1(sgf_result_o0__1_carry_i_8__8_n_5),
        .I2(sgf_result_o0__1_carry_i_9__3_n_6),
        .I3(sgf_result_o0__1_carry_i_8__8_n_6),
        .I4(sgf_result_o0__1_carry_i_9__3_n_5),
        .I5(sgf_result_o0__1_carry_i_8__8_n_7),
        .O(sgf_result_o0__1_carry_i_5__1_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_6__1
       (.I0(sgf_result_o0__1_carry_i_9__3_n_6),
        .I1(sgf_result_o0__1_carry_i_8__8_n_7),
        .I2(sgf_result_o0__1_carry_i_8__8_n_6),
        .I3(sgf_result_o0__1_carry_i_9__3_n_7),
        .O(sgf_result_o0__1_carry_i_6__1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_7__1
       (.I0(sgf_result_o0__1_carry_i_8__8_n_7),
        .I1(sgf_result_o0__1_carry_i_9__3_n_7),
        .O(sgf_result_o0__1_carry_i_7__1_n_0));
  CARRY4 sgf_result_o0__1_carry_i_8__8
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_i_8__8_n_0,sgf_result_o0__1_carry_i_8__8_n_1,sgf_result_o0__1_carry_i_8__8_n_2,sgf_result_o0__1_carry_i_8__8_n_3}),
        .CYINIT(1'b0),
        .DI(Data_B_i_IBUF[3:0]),
        .O({sgf_result_o0__1_carry_i_8__8_n_4,sgf_result_o0__1_carry_i_8__8_n_5,sgf_result_o0__1_carry_i_8__8_n_6,sgf_result_o0__1_carry_i_8__8_n_7}),
        .S({sgf_result_o0__1_carry_i_12_n_0,sgf_result_o0__1_carry_i_13_n_0,sgf_result_o0__1_carry_i_14_n_0,sgf_result_o0__1_carry_i_15_n_0}));
  CARRY4 sgf_result_o0__1_carry_i_9__3
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_i_9__3_n_0,sgf_result_o0__1_carry_i_9__3_n_1,sgf_result_o0__1_carry_i_9__3_n_2,sgf_result_o0__1_carry_i_9__3_n_3}),
        .CYINIT(1'b0),
        .DI(Data_A_i_IBUF[3:0]),
        .O({sgf_result_o0__1_carry_i_9__3_n_4,sgf_result_o0__1_carry_i_9__3_n_5,sgf_result_o0__1_carry_i_9__3_n_6,sgf_result_o0__1_carry_i_9__3_n_7}),
        .S({sgf_result_o0__1_carry_i_16_n_0,sgf_result_o0__1_carry_i_17_n_0,sgf_result_o0__1_carry_i_18_n_0,sgf_result_o0__1_carry_i_19_n_0}));
  CARRY4 sgf_result_o1__0_carry_i_13__0
       (.CI(sgf_result_o0__1_carry_i_8__8_n_0),
        .CO({NLW_sgf_result_o1__0_carry_i_13__0_CO_UNCONNECTED[3],sgf_result_o1__0_carry_i_13__0_n_1,NLW_sgf_result_o1__0_carry_i_13__0_CO_UNCONNECTED[1],sgf_result_o1__0_carry_i_13__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Data_B_i_IBUF[5:4]}),
        .O({NLW_sgf_result_o1__0_carry_i_13__0_O_UNCONNECTED[3:2],sgf_result_o1__0_carry_i_13__0_n_6,sgf_result_o1__0_carry_i_13__0_n_7}),
        .S({1'b0,1'b1,sgf_result_o1__0_carry_i_20_n_0,sgf_result_o1__0_carry_i_21_n_0}));
  CARRY4 sgf_result_o1__0_carry_i_18
       (.CI(sgf_result_o0__1_carry_i_9__3_n_0),
        .CO({NLW_sgf_result_o1__0_carry_i_18_CO_UNCONNECTED[3],sgf_result_o1__0_carry_i_18_n_1,NLW_sgf_result_o1__0_carry_i_18_CO_UNCONNECTED[1],sgf_result_o1__0_carry_i_18_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Data_A_i_IBUF[5:4]}),
        .O({NLW_sgf_result_o1__0_carry_i_18_O_UNCONNECTED[3:2],sgf_result_o1__0_carry_i_18_n_6,sgf_result_o1__0_carry_i_18_n_7}),
        .S({1'b0,1'b1,sgf_result_o1__0_carry_i_23_n_0,sgf_result_o1__0_carry_i_24_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_20
       (.I0(Data_B_i_IBUF[5]),
        .I1(Data_B_i_IBUF[11]),
        .O(sgf_result_o1__0_carry_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_21
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_B_i_IBUF[10]),
        .O(sgf_result_o1__0_carry_i_21_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_23
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_A_i_IBUF[11]),
        .O(sgf_result_o1__0_carry_i_23_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_24
       (.I0(Data_A_i_IBUF[4]),
        .I1(Data_A_i_IBUF[10]),
        .O(sgf_result_o1__0_carry_i_24_n_0));
  LUT6 #(
    .INIT(64'h67878F8F7FFF7FFF)) 
    sgf_result_o1__21_carry__0_i_10
       (.I0(sgf_result_o1__0_carry_i_13__0_n_6),
        .I1(sgf_result_o1__0_carry_i_18_n_6),
        .I2(sgf_result_o1__0_carry_i_13__0_n_1),
        .I3(sgf_result_o1__0_carry_i_18_n_7),
        .I4(sgf_result_o1__0_carry_i_13__0_n_7),
        .I5(sgf_result_o1__0_carry_i_18_n_1),
        .O(sgf_result_o1__21_carry__0_i_10_n_0));
  LUT6 #(
    .INIT(64'hE080808000000000)) 
    sgf_result_o1__21_carry__0_i_9
       (.I0(sgf_result_o1__0_carry_i_18_n_6),
        .I1(sgf_result_o1__0_carry_i_13__0_n_6),
        .I2(sgf_result_o1__0_carry_i_18_n_1),
        .I3(sgf_result_o1__0_carry_i_13__0_n_7),
        .I4(sgf_result_o1__0_carry_i_18_n_7),
        .I5(sgf_result_o1__0_carry_i_13__0_n_1),
        .O(sgf_result_o1__21_carry__0_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o1__21_carry_i_10
       (.I0(sgf_result_o1__0_carry_i_13__0_n_6),
        .I1(sgf_result_o1__0_carry_i_18_n_7),
        .I2(sgf_result_o1__0_carry_i_18_n_6),
        .I3(sgf_result_o1__0_carry_i_13__0_n_7),
        .O(sgf_result_o1__21_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    sgf_result_o1__21_carry_i_8
       (.I0(sgf_result_o1__0_carry_i_13__0_n_6),
        .I1(sgf_result_o1__0_carry_i_18_n_6),
        .I2(sgf_result_o1__0_carry_i_13__0_n_1),
        .I3(sgf_result_o1__0_carry_i_18_n_7),
        .I4(sgf_result_o1__0_carry_i_13__0_n_7),
        .I5(sgf_result_o1__0_carry_i_18_n_1),
        .O(sgf_result_o1__21_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    sgf_result_o1__21_carry_i_9
       (.I0(sgf_result_o1__0_carry_i_13__0_n_6),
        .I1(sgf_result_o1__0_carry_i_18_n_6),
        .I2(sgf_result_o1__0_carry_i_13__0_n_1),
        .I3(sgf_result_o1__0_carry_i_18_n_7),
        .I4(sgf_result_o1__0_carry_i_13__0_n_7),
        .I5(sgf_result_o1__0_carry_i_18_n_1),
        .O(sgf_result_o1__21_carry_i_9_n_0));
  LUT6 #(
    .INIT(64'h9A9A3AC53AC59A9A)) 
    sgf_result_o1_carry_i_4
       (.I0(\EVEN1.middle_n_15 ),
        .I1(\EVEN1.middle_n_12 ),
        .I2(\EVEN1.middle_n_14 ),
        .I3(\EVEN1.middle_n_13 ),
        .I4(sgf_result_o1__0_carry_i_13__0_n_7),
        .I5(sgf_result_o0__1_carry_i_8__8_n_7),
        .O(sgf_result_o1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    \sgf_result_o_OBUF[1]_inst_i_1 
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[0]),
        .O(sgf_result_o_OBUF[0]));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    \sgf_result_o_OBUF[4]_inst_i_5 
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(\sgf_result_o_OBUF[4]_inst_i_5_n_0 ));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized17
   (\sgf_result_o[47] ,
    O,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    Data_A_i_IBUF,
    Data_B_i_IBUF,
    S,
    \Data_B_i[10] );
  output \sgf_result_o[47] ;
  output [3:0]O;
  output [3:0]\sgf_result_o[47]_0 ;
  output [1:0]\sgf_result_o[47]_1 ;
  input [5:0]Data_A_i_IBUF;
  input [5:0]Data_B_i_IBUF;
  input [0:0]S;
  input [0:0]\Data_B_i[10] ;

  wire [5:0]Data_A_i_IBUF;
  wire [0:0]\Data_B_i[10] ;
  wire [5:0]Data_B_i_IBUF;
  wire \EVEN1.middle_n_0 ;
  wire \EVEN1.middle_n_1 ;
  wire \EVEN1.middle_n_10 ;
  wire \EVEN1.middle_n_11 ;
  wire \EVEN1.middle_n_12 ;
  wire \EVEN1.middle_n_13 ;
  wire \EVEN1.middle_n_2 ;
  wire \EVEN1.middle_n_3 ;
  wire \EVEN1.middle_n_4 ;
  wire \EVEN1.middle_n_5 ;
  wire \EVEN1.middle_n_6 ;
  wire \EVEN1.middle_n_7 ;
  wire \EVEN1.middle_n_8 ;
  wire \EVEN1.middle_n_9 ;
  wire [3:0]O;
  wire [0:0]S;
  wire S_B0__0_carry__0_i_10__0_n_0;
  wire S_B0__0_carry__0_i_7__0_n_0;
  wire S_B0__0_carry__0_i_8__0_n_0;
  wire S_B0__0_carry__0_i_9__0_n_0;
  wire S_B0__0_carry__0_n_1;
  wire S_B0__0_carry__0_n_2;
  wire S_B0__0_carry__0_n_3;
  wire S_B0__0_carry__0_n_4;
  wire S_B0__0_carry__0_n_5;
  wire S_B0__0_carry__0_n_6;
  wire S_B0__0_carry__0_n_7;
  wire S_B0__0_carry_i_11__0_n_0;
  wire S_B0__0_carry_i_12__0_n_0;
  wire S_B0__0_carry_i_13_n_0;
  wire S_B0__0_carry_i_8__0_n_0;
  wire S_B0__0_carry_i_9__0_n_0;
  wire S_B0__0_carry_n_0;
  wire S_B0__0_carry_n_1;
  wire S_B0__0_carry_n_2;
  wire S_B0__0_carry_n_3;
  wire S_B0__0_carry_n_4;
  wire S_B0__0_carry_n_5;
  wire S_B0__0_carry_n_6;
  wire S_B0__0_carry_n_7;
  wire S_B0__30_carry__0_i_11_n_0;
  wire S_B0__30_carry__0_i_12_n_0;
  wire S_B0__30_carry__0_i_13_n_0;
  wire S_B0__30_carry__0_i_14_n_0;
  wire S_B0__30_carry__1_i_12_n_0;
  wire S_B0__30_carry_i_10_n_0;
  wire S_B0__30_carry_i_11_n_0;
  wire S_B0__30_carry_i_9__0_n_0;
  wire sgf_result_o0__1_carry__0_i_10__1_n_0;
  wire sgf_result_o0__1_carry__0_i_1__0_n_0;
  wire sgf_result_o0__1_carry__0_i_2__0_n_0;
  wire sgf_result_o0__1_carry__0_i_3__11_n_0;
  wire sgf_result_o0__1_carry__0_i_4__0_n_0;
  wire sgf_result_o0__1_carry__0_i_5__3_n_0;
  wire sgf_result_o0__1_carry__0_i_6__1_n_0;
  wire sgf_result_o0__1_carry__0_i_7__7_n_0;
  wire sgf_result_o0__1_carry__0_i_8__0_n_0;
  wire sgf_result_o0__1_carry__0_i_9_n_0;
  wire sgf_result_o0__1_carry_i_10__7_n_0;
  wire sgf_result_o0__1_carry_i_11__0_n_0;
  wire sgf_result_o0__1_carry_i_12__1_n_0;
  wire sgf_result_o0__1_carry_i_13__1_n_0;
  wire sgf_result_o0__1_carry_i_14__3_n_0;
  wire sgf_result_o0__1_carry_i_1__0_n_0;
  wire sgf_result_o0__1_carry_i_2__0_n_0;
  wire sgf_result_o0__1_carry_i_3__0_n_0;
  wire sgf_result_o0__1_carry_i_4__0_n_0;
  wire sgf_result_o0__1_carry_i_5__0_n_0;
  wire sgf_result_o0__1_carry_i_6__0_n_0;
  wire sgf_result_o0__1_carry_i_7__0_n_0;
  wire sgf_result_o0__1_carry_i_8__0_n_0;
  wire sgf_result_o0__1_carry_i_9__9_n_0;
  wire \sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [1:0]\sgf_result_o[47]_1 ;
  wire [3:3]NLW_S_B0__0_carry__0_CO_UNCONNECTED;

  Recursive_KOA__parameterized20 \EVEN1.middle 
       (.DI({sgf_result_o0__1_carry_i_1__0_n_0,sgf_result_o0__1_carry_i_2__0_n_0,sgf_result_o0__1_carry_i_3__0_n_0}),
        .\Data_A_i[11] ({sgf_result_o0__1_carry__0_i_1__0_n_0,sgf_result_o0__1_carry__0_i_2__0_n_0,sgf_result_o0__1_carry__0_i_3__11_n_0}),
        .\Data_A_i[11]_0 (S_B0__0_carry_i_9__0_n_0),
        .\Data_A_i[11]_1 (S_B0__0_carry_i_12__0_n_0),
        .\Data_A_i[11]_2 (S_B0__0_carry__0_i_8__0_n_0),
        .\Data_A_i[11]_3 ({S_B0__0_carry_n_4,S_B0__0_carry_n_5,S_B0__0_carry_n_6,S_B0__0_carry_n_7}),
        .\Data_A_i[11]_4 ({S_B0__30_carry_i_9__0_n_0,S_B0__30_carry_i_10_n_0,S_B0__30_carry_i_11_n_0,S}),
        .\Data_A_i[11]_5 ({S_B0__0_carry__0_n_4,S_B0__0_carry__0_n_5,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .\Data_A_i[7] ({sgf_result_o0__1_carry__0_i_4__0_n_0,sgf_result_o0__1_carry__0_i_5__3_n_0,sgf_result_o0__1_carry__0_i_6__1_n_0}),
        .\Data_A_i[8] (S_B0__0_carry_i_8__0_n_0),
        .\Data_A_i[8]_0 (S_B0__0_carry_i_11__0_n_0),
        .\Data_A_i[8]_1 (S_B0__0_carry__0_i_7__0_n_0),
        .\Data_A_i[8]_2 ({S_B0__30_carry__0_i_11_n_0,S_B0__30_carry__0_i_12_n_0,S_B0__30_carry__0_i_13_n_0,S_B0__30_carry__0_i_14_n_0}),
        .Data_A_i_IBUF({Data_A_i_IBUF[4:3],Data_A_i_IBUF[0]}),
        .\Data_B_i[10] (S_B0__0_carry__0_i_10__0_n_0),
        .\Data_B_i[10]_0 ({\Data_B_i[10] ,S_B0__30_carry__1_i_12_n_0}),
        .\Data_B_i[6] (\sgf_result_o[47] ),
        .\Data_B_i[7] (S_B0__0_carry__0_i_9__0_n_0),
        .\Data_B_i[9] (S_B0__0_carry_i_13_n_0),
        .Data_B_i_IBUF({Data_B_i_IBUF[4:3],Data_B_i_IBUF[0]}),
        .O(O),
        .S({sgf_result_o0__1_carry_i_4__0_n_0,sgf_result_o0__1_carry_i_5__0_n_0,sgf_result_o0__1_carry_i_6__0_n_0,sgf_result_o0__1_carry_i_7__0_n_0}),
        .\sgf_result_o[47] ({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 }),
        .\sgf_result_o[47]_0 ({\EVEN1.middle_n_3 ,\EVEN1.middle_n_4 ,\EVEN1.middle_n_5 }),
        .\sgf_result_o[47]_1 ({\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 ,\EVEN1.middle_n_8 ,\EVEN1.middle_n_9 }),
        .\sgf_result_o[47]_2 ({\EVEN1.middle_n_10 ,\EVEN1.middle_n_11 ,\EVEN1.middle_n_12 ,\EVEN1.middle_n_13 }),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_4 (\sgf_result_o[47]_1 ));
  CARRY4 S_B0__0_carry
       (.CI(1'b0),
        .CO({S_B0__0_carry_n_0,S_B0__0_carry_n_1,S_B0__0_carry_n_2,S_B0__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\EVEN1.middle_n_3 ,\EVEN1.middle_n_4 ,\EVEN1.middle_n_5 ,1'b1}),
        .O({S_B0__0_carry_n_4,S_B0__0_carry_n_5,S_B0__0_carry_n_6,S_B0__0_carry_n_7}),
        .S({\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 ,\EVEN1.middle_n_8 ,\EVEN1.middle_n_9 }));
  CARRY4 S_B0__0_carry__0
       (.CI(S_B0__0_carry_n_0),
        .CO({NLW_S_B0__0_carry__0_CO_UNCONNECTED[3],S_B0__0_carry__0_n_1,S_B0__0_carry__0_n_2,S_B0__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 }),
        .O({S_B0__0_carry__0_n_4,S_B0__0_carry__0_n_5,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .S({\EVEN1.middle_n_10 ,\EVEN1.middle_n_11 ,\EVEN1.middle_n_12 ,\EVEN1.middle_n_13 }));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__0_carry__0_i_10__0
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_B_i_IBUF[5]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_B_i_IBUF[4]),
        .O(S_B0__0_carry__0_i_10__0_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_7__0
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry__0_i_7__0_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_8__0
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry__0_i_8__0_n_0));
  LUT6 #(
    .INIT(64'h55FF7FFF7FFFFFFF)) 
    S_B0__0_carry__0_i_9__0
       (.I0(Data_A_i_IBUF[2]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_B_i_IBUF[2]),
        .I4(Data_A_i_IBUF[1]),
        .I5(Data_B_i_IBUF[1]),
        .O(S_B0__0_carry__0_i_9__0_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_10
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[0]),
        .O(\sgf_result_o[47] ));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_11__0
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry_i_11__0_n_0));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_12__0
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry_i_12__0_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_13
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_B_i_IBUF[3]),
        .O(S_B0__0_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_8__0
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_B_i_IBUF[2]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_A_i_IBUF[2]),
        .O(S_B0__0_carry_i_8__0_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_9__0
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_B_i_IBUF[5]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[3]),
        .I5(Data_A_i_IBUF[5]),
        .O(S_B0__0_carry_i_9__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry__0_i_11
       (.I0(S_B0__0_carry__0_n_5),
        .I1(S_B0__0_carry_i_12__0_n_0),
        .O(S_B0__30_carry__0_i_11_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry__0_i_12
       (.I0(S_B0__0_carry__0_n_6),
        .I1(S_B0__0_carry_i_9__0_n_0),
        .O(S_B0__30_carry__0_i_12_n_0));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    S_B0__30_carry__0_i_13
       (.I0(S_B0__0_carry__0_n_7),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[4]),
        .O(S_B0__30_carry__0_i_13_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    S_B0__30_carry__0_i_14
       (.I0(S_B0__0_carry_n_4),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_B_i_IBUF[3]),
        .O(S_B0__30_carry__0_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry__1_i_12
       (.I0(S_B0__0_carry__0_n_4),
        .I1(S_B0__0_carry__0_i_8__0_n_0),
        .O(S_B0__30_carry__1_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry_i_10
       (.I0(S_B0__0_carry_n_6),
        .I1(S_B0__0_carry__0_i_7__0_n_0),
        .O(S_B0__30_carry_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry_i_11
       (.I0(S_B0__0_carry_n_7),
        .I1(S_B0__0_carry_i_11__0_n_0),
        .O(S_B0__30_carry_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry_i_9__0
       (.I0(S_B0__0_carry_n_5),
        .I1(S_B0__0_carry__0_i_9__0_n_0),
        .O(S_B0__30_carry_i_9__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry__0_i_10__1
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[4]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_8__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_10__1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_1__0
       (.I0(sgf_result_o0__1_carry_i_11__0_n_0),
        .I1(sgf_result_o0__1_carry_i_13__1_n_0),
        .O(sgf_result_o0__1_carry__0_i_1__0_n_0));
  LUT5 #(
    .INIT(32'h14000000)) 
    sgf_result_o0__1_carry__0_i_2__0
       (.I0(sgf_result_o0__1_carry_i_13__1_n_0),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(sgf_result_o0__1_carry_i_3__0_n_0),
        .I4(sgf_result_o0__1_carry_i_10__7_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h1EE11EE11EE1E11E)) 
    sgf_result_o0__1_carry__0_i_3__11
       (.I0(sgf_result_o0__1_carry_i_12__1_n_0),
        .I1(sgf_result_o0__1_carry_i_8__0_n_0),
        .I2(sgf_result_o0__1_carry__0_i_2__0_n_0),
        .I3(sgf_result_o0__1_carry__0_i_7__7_n_0),
        .I4(sgf_result_o0__1_carry_i_9__9_n_0),
        .I5(sgf_result_o0__1_carry_i_13__1_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__11_n_0));
  LUT6 #(
    .INIT(64'h000001010003FCE8)) 
    sgf_result_o0__1_carry__0_i_4__0
       (.I0(sgf_result_o0__1_carry_i_9__9_n_0),
        .I1(sgf_result_o0__1_carry_i_12__1_n_0),
        .I2(sgf_result_o0__1_carry_i_8__0_n_0),
        .I3(sgf_result_o0__1_carry_i_14__3_n_0),
        .I4(sgf_result_o0__1_carry_i_13__1_n_0),
        .I5(sgf_result_o0__1_carry_i_11__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_4__0_n_0));
  LUT6 #(
    .INIT(64'h9996999699966669)) 
    sgf_result_o0__1_carry__0_i_5__3
       (.I0(sgf_result_o0__1_carry__0_i_2__0_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__0_n_0),
        .I2(sgf_result_o0__1_carry_i_12__1_n_0),
        .I3(sgf_result_o0__1_carry_i_13__1_n_0),
        .I4(sgf_result_o0__1_carry_i_8__0_n_0),
        .I5(sgf_result_o0__1_carry_i_11__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_5__3_n_0));
  LUT6 #(
    .INIT(64'hA595AA99AAA9AAAA)) 
    sgf_result_o0__1_carry__0_i_6__1
       (.I0(sgf_result_o0__1_carry__0_i_3__11_n_0),
        .I1(sgf_result_o0__1_carry_i_14__3_n_0),
        .I2(sgf_result_o0__1_carry_i_11__0_n_0),
        .I3(sgf_result_o0__1_carry_i_12__1_n_0),
        .I4(sgf_result_o0__1_carry__0_i_9_n_0),
        .I5(sgf_result_o0__1_carry__0_i_10__1_n_0),
        .O(sgf_result_o0__1_carry__0_i_6__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry__0_i_7__7
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_11__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_7__7_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFEEEE0)) 
    sgf_result_o0__1_carry__0_i_8__0
       (.I0(sgf_result_o0__1_carry_i_11__0_n_0),
        .I1(sgf_result_o0__1_carry_i_14__3_n_0),
        .I2(sgf_result_o0__1_carry_i_8__0_n_0),
        .I3(sgf_result_o0__1_carry_i_12__1_n_0),
        .I4(sgf_result_o0__1_carry_i_9__9_n_0),
        .I5(sgf_result_o0__1_carry_i_13__1_n_0),
        .O(sgf_result_o0__1_carry__0_i_8__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry__0_i_9
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_A_i_IBUF[3]),
        .O(sgf_result_o0__1_carry__0_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry_i_10__7
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_12__1_n_0),
        .O(sgf_result_o0__1_carry_i_10__7_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_11__0
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[4]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .I4(Data_B_i_IBUF[2]),
        .I5(Data_B_i_IBUF[5]),
        .O(sgf_result_o0__1_carry_i_11__0_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_12__1
       (.I0(Data_B_i_IBUF[5]),
        .I1(Data_B_i_IBUF[2]),
        .I2(Data_B_i_IBUF[3]),
        .I3(Data_B_i_IBUF[0]),
        .I4(Data_B_i_IBUF[4]),
        .I5(Data_B_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_12__1_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_13__1
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_A_i_IBUF[2]),
        .I5(Data_A_i_IBUF[5]),
        .O(sgf_result_o0__1_carry_i_13__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_14__3
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_14__3_n_0));
  LUT6 #(
    .INIT(64'hE1E1E1E1E11E1EE1)) 
    sgf_result_o0__1_carry_i_1__0
       (.I0(sgf_result_o0__1_carry_i_8__0_n_0),
        .I1(sgf_result_o0__1_carry_i_9__9_n_0),
        .I2(sgf_result_o0__1_carry_i_10__7_n_0),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_A_i_IBUF[0]),
        .I5(sgf_result_o0__1_carry_i_11__0_n_0),
        .O(sgf_result_o0__1_carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0906060609F9F906)) 
    sgf_result_o0__1_carry_i_2__0
       (.I0(Data_A_i_IBUF[4]),
        .I1(Data_A_i_IBUF[1]),
        .I2(sgf_result_o0__1_carry_i_9__9_n_0),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_A_i_IBUF[3]),
        .I5(sgf_result_o0__1_carry_i_12__1_n_0),
        .O(sgf_result_o0__1_carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h6006066006600660)) 
    sgf_result_o0__1_carry_i_3__0
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[1]),
        .I3(Data_B_i_IBUF[4]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_B_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h6A6A6A6A6A95956A)) 
    sgf_result_o0__1_carry_i_4__0
       (.I0(sgf_result_o0__1_carry_i_1__0_n_0),
        .I1(sgf_result_o0__1_carry_i_10__7_n_0),
        .I2(sgf_result_o0__1_carry_i_3__0_n_0),
        .I3(Data_B_i_IBUF[3]),
        .I4(Data_B_i_IBUF[0]),
        .I5(sgf_result_o0__1_carry_i_13__1_n_0),
        .O(sgf_result_o0__1_carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'hA99A)) 
    sgf_result_o0__1_carry_i_5__0
       (.I0(sgf_result_o0__1_carry_i_2__0_n_0),
        .I1(sgf_result_o0__1_carry_i_8__0_n_0),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_5__0_n_0));
  LUT6 #(
    .INIT(64'h141414EB14EB1414)) 
    sgf_result_o0__1_carry_i_6__0
       (.I0(sgf_result_o0__1_carry_i_14__3_n_0),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(sgf_result_o0__1_carry_i_9__9_n_0),
        .I4(Data_A_i_IBUF[0]),
        .I5(Data_A_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h0660)) 
    sgf_result_o0__1_carry_i_7__0
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(Data_B_i_IBUF[0]),
        .O(sgf_result_o0__1_carry_i_7__0_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_8__0
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_A_i_IBUF[2]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_A_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_8__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_9__9
       (.I0(Data_B_i_IBUF[3]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[4]),
        .I3(Data_B_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_9__9_n_0));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized20
   (\sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    O,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    DI,
    S,
    \Data_A_i[11] ,
    \Data_A_i[7] ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[6] ,
    \Data_B_i[9] ,
    \Data_B_i[7] ,
    \Data_B_i[10] ,
    \Data_A_i[8] ,
    \Data_A_i[11]_0 ,
    \Data_A_i[8]_0 ,
    \Data_A_i[11]_1 ,
    \Data_A_i[8]_1 ,
    \Data_A_i[11]_2 ,
    \Data_A_i[11]_3 ,
    \Data_A_i[11]_4 ,
    \Data_A_i[11]_5 ,
    \Data_A_i[8]_2 ,
    \Data_B_i[10]_0 );
  output [2:0]\sgf_result_o[47] ;
  output [2:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]O;
  output [3:0]\sgf_result_o[47]_3 ;
  output [1:0]\sgf_result_o[47]_4 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_A_i[11] ;
  input [2:0]\Data_A_i[7] ;
  input [2:0]Data_B_i_IBUF;
  input [2:0]Data_A_i_IBUF;
  input \Data_B_i[6] ;
  input \Data_B_i[9] ;
  input \Data_B_i[7] ;
  input \Data_B_i[10] ;
  input \Data_A_i[8] ;
  input \Data_A_i[11]_0 ;
  input \Data_A_i[8]_0 ;
  input \Data_A_i[11]_1 ;
  input \Data_A_i[8]_1 ;
  input \Data_A_i[11]_2 ;
  input [3:0]\Data_A_i[11]_3 ;
  input [3:0]\Data_A_i[11]_4 ;
  input [3:0]\Data_A_i[11]_5 ;
  input [3:0]\Data_A_i[8]_2 ;
  input [1:0]\Data_B_i[10]_0 ;

  wire [2:0]DI;
  wire [2:0]\Data_A_i[11] ;
  wire \Data_A_i[11]_0 ;
  wire \Data_A_i[11]_1 ;
  wire \Data_A_i[11]_2 ;
  wire [3:0]\Data_A_i[11]_3 ;
  wire [3:0]\Data_A_i[11]_4 ;
  wire [3:0]\Data_A_i[11]_5 ;
  wire [2:0]\Data_A_i[7] ;
  wire \Data_A_i[8] ;
  wire \Data_A_i[8]_0 ;
  wire \Data_A_i[8]_1 ;
  wire [3:0]\Data_A_i[8]_2 ;
  wire [2:0]Data_A_i_IBUF;
  wire \Data_B_i[10] ;
  wire [1:0]\Data_B_i[10]_0 ;
  wire \Data_B_i[6] ;
  wire \Data_B_i[7] ;
  wire \Data_B_i[9] ;
  wire [2:0]Data_B_i_IBUF;
  wire [3:0]O;
  wire [3:0]S;
  wire S_B0__30_carry__0_i_9_n_0;
  wire S_B0__30_carry__0_i_9_n_1;
  wire S_B0__30_carry__0_i_9_n_2;
  wire S_B0__30_carry__0_i_9_n_3;
  wire S_B0__30_carry__1_i_9_n_3;
  wire S_B0__30_carry_i_8_n_0;
  wire S_B0__30_carry_i_8_n_1;
  wire S_B0__30_carry_i_8_n_2;
  wire S_B0__30_carry_i_8_n_3;
  wire sgf_result_o0__1_carry__0_n_1;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_4;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire [2:0]\sgf_result_o[47] ;
  wire [2:0]\sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [3:0]\^sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [1:0]\sgf_result_o[47]_4 ;
  wire [3:1]NLW_S_B0__30_carry__1_i_9_CO_UNCONNECTED;
  wire [3:2]NLW_S_B0__30_carry__1_i_9_O_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;

  assign \sgf_result_o[47]_2 [3] = sgf_result_o0__1_carry__0_n_4;
  assign \sgf_result_o[47]_2 [2:0] = \^sgf_result_o[47]_2 [2:0];
  (* HLUTNM = "lutpair5" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    S_B0__0_carry__0_i_1__0
       (.I0(\Data_A_i[8]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[11]_2 ),
        .O(\sgf_result_o[47] [1]));
  (* HLUTNM = "lutpair4" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    S_B0__0_carry__0_i_2__0
       (.I0(\Data_A_i[8]_0 ),
        .I1(\Data_A_i[11]_1 ),
        .I2(sgf_result_o0__1_carry_n_4),
        .O(\sgf_result_o[47] [0]));
  LUT4 #(
    .INIT(16'h4DB2)) 
    S_B0__0_carry__0_i_4__0
       (.I0(\Data_B_i[7] ),
        .I1(\Data_B_i[10] ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .I3(\sgf_result_o[47] [2]),
        .O(\^sgf_result_o[47]_2 [2]));
  LUT4 #(
    .INIT(16'h9669)) 
    S_B0__0_carry__0_i_5__0
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_B_i[7] ),
        .I2(\Data_B_i[10] ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(\^sgf_result_o[47]_2 [1]));
  (* HLUTNM = "lutpair5" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry__0_i_6__0
       (.I0(\Data_A_i[8]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[11]_2 ),
        .I3(\sgf_result_o[47] [0]),
        .O(\^sgf_result_o[47]_2 [0]));
  (* HLUTNM = "lutpair3" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    S_B0__0_carry_i_1__0
       (.I0(\Data_A_i[8] ),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[11]_0 ),
        .O(\sgf_result_o[47]_0 [2]));
  LUT6 #(
    .INIT(64'h87770000FFFF8777)) 
    S_B0__0_carry_i_2__0
       (.I0(Data_B_i_IBUF[2]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_A_i_IBUF[2]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_6),
        .I5(\Data_B_i[6] ),
        .O(\sgf_result_o[47]_0 [1]));
  (* HLUTNM = "lutpair79" *) 
  LUT5 #(
    .INIT(32'h2ABFBFBF)) 
    S_B0__0_carry_i_3__0
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_A_i_IBUF[1]),
        .I4(Data_B_i_IBUF[1]),
        .O(\sgf_result_o[47]_0 [0]));
  (* HLUTNM = "lutpair4" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_4__0
       (.I0(\Data_A_i[8]_0 ),
        .I1(\Data_A_i[11]_1 ),
        .I2(sgf_result_o0__1_carry_n_4),
        .I3(\sgf_result_o[47]_0 [2]),
        .O(\sgf_result_o[47]_1 [3]));
  (* HLUTNM = "lutpair3" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_5__0
       (.I0(\Data_A_i[8] ),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[11]_0 ),
        .I3(\sgf_result_o[47]_0 [1]),
        .O(\sgf_result_o[47]_1 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_6__0
       (.I0(\sgf_result_o[47]_0 [0]),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_B_i[6] ),
        .I3(\Data_B_i[9] ),
        .O(\sgf_result_o[47]_1 [1]));
  (* HLUTNM = "lutpair79" *) 
  LUT5 #(
    .INIT(32'h6A959595)) 
    S_B0__0_carry_i_7__0
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_A_i_IBUF[1]),
        .I4(Data_B_i_IBUF[1]),
        .O(\sgf_result_o[47]_1 [0]));
  CARRY4 S_B0__30_carry__0_i_9
       (.CI(S_B0__30_carry_i_8_n_0),
        .CO({S_B0__30_carry__0_i_9_n_0,S_B0__30_carry__0_i_9_n_1,S_B0__30_carry__0_i_9_n_2,S_B0__30_carry__0_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[11]_5 [2:0],\Data_A_i[11]_3 [3]}),
        .O(\sgf_result_o[47]_3 ),
        .S(\Data_A_i[8]_2 ));
  CARRY4 S_B0__30_carry__1_i_9
       (.CI(S_B0__30_carry__0_i_9_n_0),
        .CO({NLW_S_B0__30_carry__1_i_9_CO_UNCONNECTED[3:1],S_B0__30_carry__1_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\Data_A_i[11]_5 [3]}),
        .O({NLW_S_B0__30_carry__1_i_9_O_UNCONNECTED[3:2],\sgf_result_o[47]_4 }),
        .S({1'b0,1'b0,\Data_B_i[10]_0 }));
  CARRY4 S_B0__30_carry_i_8
       (.CI(1'b0),
        .CO({S_B0__30_carry_i_8_n_0,S_B0__30_carry_i_8_n_1,S_B0__30_carry_i_8_n_2,S_B0__30_carry_i_8_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[11]_3 [2:0],1'b0}),
        .O(O),
        .S(\Data_A_i[11]_4 ));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_1,sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_A_i[11] }),
        .O({sgf_result_o0__1_carry__0_n_4,\sgf_result_o[47] [2],sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[7] }));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized21
   (Q_middle_temp__0,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[47]_9 ,
    O,
    \Data_A_i[6] ,
    \Data_A_i[6]_0 ,
    \Data_B_i[6] ,
    \Data_A_i[6]_1 ,
    \Data_B_i[6]_0 ,
    \Data_A_i[5] ,
    \Data_A_i[11] ,
    DI,
    S,
    \Data_A_i[8] ,
    \Data_A_i[2] ,
    \Data_A_i[6]_2 ,
    Data_A_i_IBUF,
    Data_B_i_IBUF,
    \Data_B_i[0] ,
    \Data_B_i[3] ,
    \Data_B_i[1] ,
    \Data_B_i[4] ,
    \Data_A_i[2]_0 ,
    \Data_A_i[5]_0 ,
    \Data_A_i[2]_1 ,
    \Data_A_i[5]_1 ,
    \Data_A_i[5]_2 ,
    \Data_A_i[2]_2 ,
    \Data_A_i[2]_3 ,
    \Data_B_i[4]_0 ,
    \Data_A_i[11]_0 ,
    \Data_A_i[11]_1 );
  output [10:0]Q_middle_temp__0;
  output [3:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [1:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [3:0]\sgf_result_o[47]_4 ;
  output [1:0]\sgf_result_o[47]_5 ;
  output [2:0]\sgf_result_o[47]_6 ;
  output [3:0]\sgf_result_o[47]_7 ;
  output [3:0]\sgf_result_o[47]_8 ;
  output [2:0]\sgf_result_o[47]_9 ;
  input [3:0]O;
  input [3:0]\Data_A_i[6] ;
  input [3:0]\Data_A_i[6]_0 ;
  input [3:0]\Data_B_i[6] ;
  input [0:0]\Data_A_i[6]_1 ;
  input [2:0]\Data_B_i[6]_0 ;
  input [2:0]\Data_A_i[5] ;
  input [3:0]\Data_A_i[11] ;
  input [3:0]DI;
  input [3:0]S;
  input [3:0]\Data_A_i[8] ;
  input [3:0]\Data_A_i[2] ;
  input [1:0]\Data_A_i[6]_2 ;
  input [7:0]Data_A_i_IBUF;
  input [7:0]Data_B_i_IBUF;
  input \Data_B_i[0] ;
  input \Data_B_i[3] ;
  input \Data_B_i[1] ;
  input \Data_B_i[4] ;
  input \Data_A_i[2]_0 ;
  input \Data_A_i[5]_0 ;
  input \Data_A_i[2]_1 ;
  input \Data_A_i[5]_1 ;
  input \Data_A_i[5]_2 ;
  input \Data_A_i[2]_2 ;
  input [0:0]\Data_A_i[2]_3 ;
  input [0:0]\Data_B_i[4]_0 ;
  input [3:0]\Data_A_i[11]_0 ;
  input [1:0]\Data_A_i[11]_1 ;

  wire [3:0]DI;
  wire [3:0]\Data_A_i[11] ;
  wire [3:0]\Data_A_i[11]_0 ;
  wire [1:0]\Data_A_i[11]_1 ;
  wire [3:0]\Data_A_i[2] ;
  wire \Data_A_i[2]_0 ;
  wire \Data_A_i[2]_1 ;
  wire \Data_A_i[2]_2 ;
  wire [0:0]\Data_A_i[2]_3 ;
  wire [2:0]\Data_A_i[5] ;
  wire \Data_A_i[5]_0 ;
  wire \Data_A_i[5]_1 ;
  wire \Data_A_i[5]_2 ;
  wire [3:0]\Data_A_i[6] ;
  wire [3:0]\Data_A_i[6]_0 ;
  wire [0:0]\Data_A_i[6]_1 ;
  wire [1:0]\Data_A_i[6]_2 ;
  wire [3:0]\Data_A_i[8] ;
  wire [7:0]Data_A_i_IBUF;
  wire \Data_B_i[0] ;
  wire \Data_B_i[1] ;
  wire \Data_B_i[3] ;
  wire \Data_B_i[4] ;
  wire [0:0]\Data_B_i[4]_0 ;
  wire [3:0]\Data_B_i[6] ;
  wire [2:0]\Data_B_i[6]_0 ;
  wire [7:0]Data_B_i_IBUF;
  wire \EVEN1.middle_n_0 ;
  wire \EVEN1.middle_n_1 ;
  wire \EVEN1.middle_n_2 ;
  wire \EVEN1.middle_n_28 ;
  wire \EVEN1.middle_n_29 ;
  wire \EVEN1.middle_n_30 ;
  wire \EVEN1.middle_n_31 ;
  wire \EVEN1.middle_n_32 ;
  wire \EVEN1.middle_n_33 ;
  wire \EVEN1.middle_n_34 ;
  wire \EVEN1.middle_n_35 ;
  wire \EVEN1.middle_n_36 ;
  wire \EVEN1.middle_n_37 ;
  wire \EVEN1.middle_n_38 ;
  wire [3:0]O;
  wire [10:0]Q_middle_temp__0;
  wire [3:0]S;
  wire S_B0__0_carry__0_n_1;
  wire S_B0__0_carry__0_n_2;
  wire S_B0__0_carry__0_n_3;
  wire S_B0__0_carry__0_n_4;
  wire S_B0__0_carry__0_n_5;
  wire S_B0__0_carry__0_n_6;
  wire S_B0__0_carry__0_n_7;
  wire S_B0__0_carry_n_0;
  wire S_B0__0_carry_n_1;
  wire S_B0__0_carry_n_2;
  wire S_B0__0_carry_n_3;
  wire S_B0__0_carry_n_4;
  wire S_B0__0_carry_n_5;
  wire S_B0__0_carry_n_6;
  wire S_B0__0_carry_n_7;
  wire S_B0__30_carry__0_i_15_n_0;
  wire S_B0__30_carry__0_i_16_n_0;
  wire S_B0__30_carry__0_i_17_n_0;
  wire S_B0__30_carry__0_i_18_n_0;
  wire S_B0__30_carry__1_i_14_n_0;
  wire sgf_result_o0__1_carry__0_i_1_n_0;
  wire sgf_result_o0__1_carry__0_i_2_n_0;
  wire sgf_result_o0__1_carry__0_i_3__3_n_0;
  wire sgf_result_o0__1_carry__0_i_4_n_0;
  wire sgf_result_o0__1_carry__0_i_5__2_n_0;
  wire sgf_result_o0__1_carry__0_i_6__0_n_0;
  wire sgf_result_o0__1_carry__0_i_7_n_0;
  wire sgf_result_o0__1_carry__0_i_8_n_0;
  wire sgf_result_o0__1_carry__0_i_9__6_n_0;
  wire sgf_result_o0__1_carry_i_10__6_n_0;
  wire sgf_result_o0__1_carry_i_11_n_0;
  wire sgf_result_o0__1_carry_i_12__0_n_0;
  wire sgf_result_o0__1_carry_i_13__0_n_0;
  wire sgf_result_o0__1_carry_i_14__2_n_0;
  wire sgf_result_o0__1_carry_i_1_n_0;
  wire sgf_result_o0__1_carry_i_2_n_0;
  wire sgf_result_o0__1_carry_i_3_n_0;
  wire sgf_result_o0__1_carry_i_4_n_0;
  wire sgf_result_o0__1_carry_i_5_n_0;
  wire sgf_result_o0__1_carry_i_6_n_0;
  wire sgf_result_o0__1_carry_i_7_n_0;
  wire sgf_result_o0__1_carry_i_8_n_0;
  wire sgf_result_o0__1_carry_i_9__8_n_0;
  wire [3:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [1:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:0]\sgf_result_o[47]_4 ;
  wire [1:0]\sgf_result_o[47]_5 ;
  wire [2:0]\sgf_result_o[47]_6 ;
  wire [3:0]\sgf_result_o[47]_7 ;
  wire [3:0]\sgf_result_o[47]_8 ;
  wire [2:0]\sgf_result_o[47]_9 ;
  wire \sgf_result_o_OBUF[4]_inst_i_2_n_0 ;
  wire \sgf_result_o_OBUF[4]_inst_i_3_n_0 ;
  wire \sgf_result_o_OBUF[4]_inst_i_4_n_0 ;
  wire [3:3]NLW_S_B0__0_carry__0_CO_UNCONNECTED;

  Recursive_KOA__parameterized24 \EVEN1.middle 
       (.DI({sgf_result_o0__1_carry_i_1_n_0,sgf_result_o0__1_carry_i_2_n_0,sgf_result_o0__1_carry_i_3_n_0}),
        .\Data_A_i[11] (\Data_A_i[11] ),
        .\Data_A_i[11]_0 (\Data_A_i[11]_0 ),
        .\Data_A_i[11]_1 (\Data_A_i[11]_1 ),
        .\Data_A_i[1] ({sgf_result_o0__1_carry__0_i_4_n_0,sgf_result_o0__1_carry__0_i_5__2_n_0,sgf_result_o0__1_carry__0_i_6__0_n_0}),
        .\Data_A_i[2] (S),
        .\Data_A_i[2]_0 (\Data_A_i[2] ),
        .\Data_A_i[2]_1 (\Data_A_i[2]_0 ),
        .\Data_A_i[2]_2 (\Data_A_i[2]_1 ),
        .\Data_A_i[2]_3 (\Data_A_i[2]_2 ),
        .\Data_A_i[2]_4 ({S_B0__0_carry__0_n_4,S_B0__0_carry__0_n_5,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .\Data_A_i[2]_5 ({S_B0__30_carry__0_i_15_n_0,S_B0__30_carry__0_i_16_n_0,S_B0__30_carry__0_i_17_n_0,S_B0__30_carry__0_i_18_n_0}),
        .\Data_A_i[5] ({sgf_result_o0__1_carry__0_i_1_n_0,sgf_result_o0__1_carry__0_i_2_n_0,sgf_result_o0__1_carry__0_i_3__3_n_0}),
        .\Data_A_i[5]_0 (\Data_A_i[5] ),
        .\Data_A_i[5]_1 (DI),
        .\Data_A_i[5]_2 (\Data_A_i[5]_0 ),
        .\Data_A_i[5]_3 (\Data_A_i[5]_1 ),
        .\Data_A_i[5]_4 (\Data_A_i[5]_2 ),
        .\Data_A_i[5]_5 ({S_B0__0_carry_n_4,S_B0__0_carry_n_5,S_B0__0_carry_n_6,S_B0__0_carry_n_7}),
        .\Data_A_i[5]_6 ({\sgf_result_o_OBUF[4]_inst_i_2_n_0 ,\sgf_result_o_OBUF[4]_inst_i_3_n_0 ,\sgf_result_o_OBUF[4]_inst_i_4_n_0 ,\Data_A_i[2]_3 }),
        .\Data_A_i[6] (\Data_A_i[6] ),
        .\Data_A_i[6]_0 (\Data_A_i[6]_0 ),
        .\Data_A_i[6]_1 (\Data_A_i[6]_1 ),
        .\Data_A_i[6]_2 (\Data_A_i[6]_2 ),
        .\Data_A_i[8] (\Data_A_i[8] ),
        .Data_A_i_IBUF({Data_A_i_IBUF[7:6],Data_A_i_IBUF[4:3],Data_A_i_IBUF[0]}),
        .\Data_B_i[0] (\Data_B_i[0] ),
        .\Data_B_i[1] (\Data_B_i[1] ),
        .\Data_B_i[3] (\Data_B_i[3] ),
        .\Data_B_i[4] (\Data_B_i[4] ),
        .\Data_B_i[4]_0 ({\Data_B_i[4]_0 ,S_B0__30_carry__1_i_14_n_0}),
        .\Data_B_i[6] (\Data_B_i[6] ),
        .\Data_B_i[6]_0 (\Data_B_i[6]_0 ),
        .Data_B_i_IBUF({Data_B_i_IBUF[7:6],Data_B_i_IBUF[4:3],Data_B_i_IBUF[0]}),
        .O(O),
        .Q_middle_temp__0(Q_middle_temp__0),
        .S({sgf_result_o0__1_carry_i_4_n_0,sgf_result_o0__1_carry_i_5_n_0,sgf_result_o0__1_carry_i_6_n_0,sgf_result_o0__1_carry_i_7_n_0}),
        .\sgf_result_o[47] ({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 }),
        .\sgf_result_o[47]_0 (\sgf_result_o[47] ),
        .\sgf_result_o[47]_1 (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_10 (\sgf_result_o[47]_6 ),
        .\sgf_result_o[47]_11 (\sgf_result_o[47]_7 ),
        .\sgf_result_o[47]_12 (\sgf_result_o[47]_8 ),
        .\sgf_result_o[47]_13 (\sgf_result_o[47]_9 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_4 ({\EVEN1.middle_n_28 ,\EVEN1.middle_n_29 ,\EVEN1.middle_n_30 }),
        .\sgf_result_o[47]_5 ({\EVEN1.middle_n_31 ,\EVEN1.middle_n_32 ,\EVEN1.middle_n_33 ,\EVEN1.middle_n_34 }),
        .\sgf_result_o[47]_6 ({\EVEN1.middle_n_35 ,\EVEN1.middle_n_36 ,\EVEN1.middle_n_37 ,\EVEN1.middle_n_38 }),
        .\sgf_result_o[47]_7 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_8 (\sgf_result_o[47]_4 ),
        .\sgf_result_o[47]_9 (\sgf_result_o[47]_5 ));
  CARRY4 S_B0__0_carry
       (.CI(1'b0),
        .CO({S_B0__0_carry_n_0,S_B0__0_carry_n_1,S_B0__0_carry_n_2,S_B0__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\EVEN1.middle_n_28 ,\EVEN1.middle_n_29 ,\EVEN1.middle_n_30 ,1'b1}),
        .O({S_B0__0_carry_n_4,S_B0__0_carry_n_5,S_B0__0_carry_n_6,S_B0__0_carry_n_7}),
        .S({\EVEN1.middle_n_31 ,\EVEN1.middle_n_32 ,\EVEN1.middle_n_33 ,\EVEN1.middle_n_34 }));
  CARRY4 S_B0__0_carry__0
       (.CI(S_B0__0_carry_n_0),
        .CO({NLW_S_B0__0_carry__0_CO_UNCONNECTED[3],S_B0__0_carry__0_n_1,S_B0__0_carry__0_n_2,S_B0__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 }),
        .O({S_B0__0_carry__0_n_4,S_B0__0_carry__0_n_5,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .S({\EVEN1.middle_n_35 ,\EVEN1.middle_n_36 ,\EVEN1.middle_n_37 ,\EVEN1.middle_n_38 }));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry__0_i_15
       (.I0(S_B0__0_carry__0_n_5),
        .I1(\Data_A_i[5]_1 ),
        .O(S_B0__30_carry__0_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry__0_i_16
       (.I0(S_B0__0_carry__0_n_6),
        .I1(\Data_A_i[5]_0 ),
        .O(S_B0__30_carry__0_i_16_n_0));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    S_B0__30_carry__0_i_17
       (.I0(S_B0__0_carry__0_n_7),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[4]),
        .O(S_B0__30_carry__0_i_17_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    S_B0__30_carry__0_i_18
       (.I0(S_B0__0_carry_n_4),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_B_i_IBUF[3]),
        .O(S_B0__30_carry__0_i_18_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry__1_i_14
       (.I0(S_B0__0_carry__0_n_4),
        .I1(\Data_A_i[5]_2 ),
        .O(S_B0__30_carry__1_i_14_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_1
       (.I0(sgf_result_o0__1_carry_i_11_n_0),
        .I1(sgf_result_o0__1_carry_i_13__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_1_n_0));
  LUT5 #(
    .INIT(32'h14000000)) 
    sgf_result_o0__1_carry__0_i_2
       (.I0(sgf_result_o0__1_carry_i_13__0_n_0),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(sgf_result_o0__1_carry_i_3_n_0),
        .I4(sgf_result_o0__1_carry_i_10__6_n_0),
        .O(sgf_result_o0__1_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h56A956A956A9A956)) 
    sgf_result_o0__1_carry__0_i_3__3
       (.I0(sgf_result_o0__1_carry__0_i_2_n_0),
        .I1(sgf_result_o0__1_carry_i_11_n_0),
        .I2(sgf_result_o0__1_carry_i_14__2_n_0),
        .I3(sgf_result_o0__1_carry__0_i_7_n_0),
        .I4(sgf_result_o0__1_carry_i_9__8_n_0),
        .I5(sgf_result_o0__1_carry_i_13__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__3_n_0));
  LUT6 #(
    .INIT(64'h000001010003FCE8)) 
    sgf_result_o0__1_carry__0_i_4
       (.I0(sgf_result_o0__1_carry_i_9__8_n_0),
        .I1(sgf_result_o0__1_carry_i_12__0_n_0),
        .I2(sgf_result_o0__1_carry_i_8_n_0),
        .I3(sgf_result_o0__1_carry_i_14__2_n_0),
        .I4(sgf_result_o0__1_carry_i_13__0_n_0),
        .I5(sgf_result_o0__1_carry_i_11_n_0),
        .O(sgf_result_o0__1_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h9996999699966669)) 
    sgf_result_o0__1_carry__0_i_5__2
       (.I0(sgf_result_o0__1_carry__0_i_2_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8_n_0),
        .I2(sgf_result_o0__1_carry_i_12__0_n_0),
        .I3(sgf_result_o0__1_carry_i_13__0_n_0),
        .I4(sgf_result_o0__1_carry_i_8_n_0),
        .I5(sgf_result_o0__1_carry_i_11_n_0),
        .O(sgf_result_o0__1_carry__0_i_5__2_n_0));
  LUT6 #(
    .INIT(64'h66666556AAAAA66A)) 
    sgf_result_o0__1_carry__0_i_6__0
       (.I0(sgf_result_o0__1_carry__0_i_3__3_n_0),
        .I1(sgf_result_o0__1_carry__0_i_9__6_n_0),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_A_i_IBUF[0]),
        .I4(sgf_result_o0__1_carry_i_11_n_0),
        .I5(sgf_result_o0__1_carry_i_10__6_n_0),
        .O(sgf_result_o0__1_carry__0_i_6__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_7
       (.I0(sgf_result_o0__1_carry_i_12__0_n_0),
        .I1(sgf_result_o0__1_carry_i_8_n_0),
        .O(sgf_result_o0__1_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFEEEE0)) 
    sgf_result_o0__1_carry__0_i_8
       (.I0(sgf_result_o0__1_carry_i_11_n_0),
        .I1(sgf_result_o0__1_carry_i_14__2_n_0),
        .I2(sgf_result_o0__1_carry_i_8_n_0),
        .I3(sgf_result_o0__1_carry_i_12__0_n_0),
        .I4(sgf_result_o0__1_carry_i_9__8_n_0),
        .I5(sgf_result_o0__1_carry_i_13__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry__0_i_9__6
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[4]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_8_n_0),
        .O(sgf_result_o0__1_carry__0_i_9__6_n_0));
  LUT6 #(
    .INIT(64'hE1E1E1E1E11E1EE1)) 
    sgf_result_o0__1_carry_i_1
       (.I0(sgf_result_o0__1_carry_i_8_n_0),
        .I1(sgf_result_o0__1_carry_i_9__8_n_0),
        .I2(sgf_result_o0__1_carry_i_10__6_n_0),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_A_i_IBUF[0]),
        .I5(sgf_result_o0__1_carry_i_11_n_0),
        .O(sgf_result_o0__1_carry_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry_i_10__6
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_12__0_n_0),
        .O(sgf_result_o0__1_carry_i_10__6_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_11
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[4]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .I4(Data_B_i_IBUF[2]),
        .I5(Data_B_i_IBUF[5]),
        .O(sgf_result_o0__1_carry_i_11_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_12__0
       (.I0(Data_B_i_IBUF[5]),
        .I1(Data_B_i_IBUF[2]),
        .I2(Data_B_i_IBUF[3]),
        .I3(Data_B_i_IBUF[0]),
        .I4(Data_B_i_IBUF[4]),
        .I5(Data_B_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_12__0_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_13__0
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_A_i_IBUF[2]),
        .I5(Data_A_i_IBUF[5]),
        .O(sgf_result_o0__1_carry_i_13__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_14__2
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_14__2_n_0));
  LUT6 #(
    .INIT(64'h0906060609F9F906)) 
    sgf_result_o0__1_carry_i_2
       (.I0(Data_A_i_IBUF[4]),
        .I1(Data_A_i_IBUF[1]),
        .I2(sgf_result_o0__1_carry_i_9__8_n_0),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_A_i_IBUF[3]),
        .I5(sgf_result_o0__1_carry_i_12__0_n_0),
        .O(sgf_result_o0__1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h6006066006600660)) 
    sgf_result_o0__1_carry_i_3
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[1]),
        .I3(Data_B_i_IBUF[4]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_B_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h6A6A6A6A6A95956A)) 
    sgf_result_o0__1_carry_i_4
       (.I0(sgf_result_o0__1_carry_i_1_n_0),
        .I1(sgf_result_o0__1_carry_i_10__6_n_0),
        .I2(sgf_result_o0__1_carry_i_3_n_0),
        .I3(Data_B_i_IBUF[3]),
        .I4(Data_B_i_IBUF[0]),
        .I5(sgf_result_o0__1_carry_i_13__0_n_0),
        .O(sgf_result_o0__1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'hA99A)) 
    sgf_result_o0__1_carry_i_5
       (.I0(sgf_result_o0__1_carry_i_2_n_0),
        .I1(sgf_result_o0__1_carry_i_8_n_0),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h141414EB14EB1414)) 
    sgf_result_o0__1_carry_i_6
       (.I0(sgf_result_o0__1_carry_i_14__2_n_0),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(sgf_result_o0__1_carry_i_9__8_n_0),
        .I4(Data_A_i_IBUF[0]),
        .I5(Data_A_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h0660)) 
    sgf_result_o0__1_carry_i_7
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(Data_B_i_IBUF[0]),
        .O(sgf_result_o0__1_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_8
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_A_i_IBUF[2]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_A_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_9__8
       (.I0(Data_B_i_IBUF[3]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[4]),
        .I3(Data_B_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_9__8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    \sgf_result_o_OBUF[4]_inst_i_2 
       (.I0(S_B0__0_carry_n_5),
        .I1(\Data_B_i[1] ),
        .O(\sgf_result_o_OBUF[4]_inst_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[4]_inst_i_3 
       (.I0(S_B0__0_carry_n_6),
        .I1(\Data_A_i[2]_2 ),
        .O(\sgf_result_o_OBUF[4]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \sgf_result_o_OBUF[4]_inst_i_4 
       (.I0(S_B0__0_carry_n_7),
        .I1(\Data_A_i[2]_1 ),
        .O(\sgf_result_o_OBUF[4]_inst_i_4_n_0 ));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized24
   (\sgf_result_o[47] ,
    Q_middle_temp__0,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[47]_9 ,
    \sgf_result_o[47]_10 ,
    \sgf_result_o[47]_11 ,
    \sgf_result_o[47]_12 ,
    \sgf_result_o[47]_13 ,
    DI,
    S,
    \Data_A_i[5] ,
    \Data_A_i[1] ,
    O,
    \Data_A_i[6] ,
    \Data_A_i[6]_0 ,
    \Data_B_i[6] ,
    \Data_A_i[6]_1 ,
    \Data_B_i[6]_0 ,
    \Data_A_i[5]_0 ,
    \Data_A_i[11] ,
    \Data_A_i[5]_1 ,
    \Data_A_i[2] ,
    \Data_A_i[8] ,
    \Data_A_i[2]_0 ,
    \Data_A_i[6]_2 ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[0] ,
    \Data_B_i[3] ,
    \Data_B_i[1] ,
    \Data_B_i[4] ,
    \Data_A_i[2]_1 ,
    \Data_A_i[5]_2 ,
    \Data_A_i[2]_2 ,
    \Data_A_i[5]_3 ,
    \Data_A_i[5]_4 ,
    \Data_A_i[2]_3 ,
    \Data_A_i[5]_5 ,
    \Data_A_i[5]_6 ,
    \Data_A_i[2]_4 ,
    \Data_A_i[2]_5 ,
    \Data_B_i[4]_0 ,
    \Data_A_i[11]_0 ,
    \Data_A_i[11]_1 );
  output [2:0]\sgf_result_o[47] ;
  output [10:0]Q_middle_temp__0;
  output [3:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [1:0]\sgf_result_o[47]_3 ;
  output [2:0]\sgf_result_o[47]_4 ;
  output [3:0]\sgf_result_o[47]_5 ;
  output [3:0]\sgf_result_o[47]_6 ;
  output [3:0]\sgf_result_o[47]_7 ;
  output [3:0]\sgf_result_o[47]_8 ;
  output [1:0]\sgf_result_o[47]_9 ;
  output [2:0]\sgf_result_o[47]_10 ;
  output [3:0]\sgf_result_o[47]_11 ;
  output [3:0]\sgf_result_o[47]_12 ;
  output [2:0]\sgf_result_o[47]_13 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_A_i[5] ;
  input [2:0]\Data_A_i[1] ;
  input [3:0]O;
  input [3:0]\Data_A_i[6] ;
  input [3:0]\Data_A_i[6]_0 ;
  input [3:0]\Data_B_i[6] ;
  input [0:0]\Data_A_i[6]_1 ;
  input [2:0]\Data_B_i[6]_0 ;
  input [2:0]\Data_A_i[5]_0 ;
  input [3:0]\Data_A_i[11] ;
  input [3:0]\Data_A_i[5]_1 ;
  input [3:0]\Data_A_i[2] ;
  input [3:0]\Data_A_i[8] ;
  input [3:0]\Data_A_i[2]_0 ;
  input [1:0]\Data_A_i[6]_2 ;
  input [4:0]Data_B_i_IBUF;
  input [4:0]Data_A_i_IBUF;
  input \Data_B_i[0] ;
  input \Data_B_i[3] ;
  input \Data_B_i[1] ;
  input \Data_B_i[4] ;
  input \Data_A_i[2]_1 ;
  input \Data_A_i[5]_2 ;
  input \Data_A_i[2]_2 ;
  input \Data_A_i[5]_3 ;
  input \Data_A_i[5]_4 ;
  input \Data_A_i[2]_3 ;
  input [3:0]\Data_A_i[5]_5 ;
  input [3:0]\Data_A_i[5]_6 ;
  input [3:0]\Data_A_i[2]_4 ;
  input [3:0]\Data_A_i[2]_5 ;
  input [1:0]\Data_B_i[4]_0 ;
  input [3:0]\Data_A_i[11]_0 ;
  input [1:0]\Data_A_i[11]_1 ;

  wire [2:0]DI;
  wire [3:0]\Data_A_i[11] ;
  wire [3:0]\Data_A_i[11]_0 ;
  wire [1:0]\Data_A_i[11]_1 ;
  wire [2:0]\Data_A_i[1] ;
  wire [3:0]\Data_A_i[2] ;
  wire [3:0]\Data_A_i[2]_0 ;
  wire \Data_A_i[2]_1 ;
  wire \Data_A_i[2]_2 ;
  wire \Data_A_i[2]_3 ;
  wire [3:0]\Data_A_i[2]_4 ;
  wire [3:0]\Data_A_i[2]_5 ;
  wire [2:0]\Data_A_i[5] ;
  wire [2:0]\Data_A_i[5]_0 ;
  wire [3:0]\Data_A_i[5]_1 ;
  wire \Data_A_i[5]_2 ;
  wire \Data_A_i[5]_3 ;
  wire \Data_A_i[5]_4 ;
  wire [3:0]\Data_A_i[5]_5 ;
  wire [3:0]\Data_A_i[5]_6 ;
  wire [3:0]\Data_A_i[6] ;
  wire [3:0]\Data_A_i[6]_0 ;
  wire [0:0]\Data_A_i[6]_1 ;
  wire [1:0]\Data_A_i[6]_2 ;
  wire [3:0]\Data_A_i[8] ;
  wire [4:0]Data_A_i_IBUF;
  wire \Data_B_i[0] ;
  wire \Data_B_i[1] ;
  wire \Data_B_i[3] ;
  wire \Data_B_i[4] ;
  wire [1:0]\Data_B_i[4]_0 ;
  wire [3:0]\Data_B_i[6] ;
  wire [2:0]\Data_B_i[6]_0 ;
  wire [4:0]Data_B_i_IBUF;
  wire [3:0]O;
  wire [10:0]Q_middle_temp__0;
  wire [3:0]S;
  wire S_B0__30_carry__0_i_10_n_0;
  wire S_B0__30_carry__0_i_10_n_1;
  wire S_B0__30_carry__0_i_10_n_2;
  wire S_B0__30_carry__0_i_10_n_3;
  wire S_B0__30_carry__0_n_0;
  wire S_B0__30_carry__0_n_1;
  wire S_B0__30_carry__0_n_2;
  wire S_B0__30_carry__0_n_3;
  wire S_B0__30_carry__1_i_10_n_3;
  wire S_B0__30_carry__1_n_0;
  wire S_B0__30_carry__1_n_1;
  wire S_B0__30_carry__1_n_2;
  wire S_B0__30_carry__1_n_3;
  wire S_B0__30_carry__2_n_3;
  wire S_B0__30_carry_n_0;
  wire S_B0__30_carry_n_1;
  wire S_B0__30_carry_n_2;
  wire S_B0__30_carry_n_3;
  wire S_B0_carry__0_n_0;
  wire S_B0_carry__0_n_1;
  wire S_B0_carry__0_n_2;
  wire S_B0_carry__0_n_3;
  wire S_B0_carry__1_n_2;
  wire S_B0_carry__1_n_3;
  wire S_B0_carry_n_0;
  wire S_B0_carry_n_1;
  wire S_B0_carry_n_2;
  wire S_B0_carry_n_3;
  wire sgf_result_o0__1_carry__0_n_1;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_4;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire [2:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [2:0]\sgf_result_o[47]_10 ;
  wire [3:0]\sgf_result_o[47]_11 ;
  wire [3:0]\sgf_result_o[47]_12 ;
  wire [2:0]\sgf_result_o[47]_13 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [1:0]\sgf_result_o[47]_3 ;
  wire [2:0]\sgf_result_o[47]_4 ;
  wire [3:0]\sgf_result_o[47]_5 ;
  wire [3:0]\^sgf_result_o[47]_6 ;
  wire [3:0]\sgf_result_o[47]_7 ;
  wire [3:0]\sgf_result_o[47]_8 ;
  wire [1:0]\sgf_result_o[47]_9 ;
  wire \sgf_result_o_OBUF[4]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[4]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[4]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[4]_inst_i_1_n_3 ;
  wire [3:1]NLW_S_B0__30_carry__1_i_10_CO_UNCONNECTED;
  wire [3:2]NLW_S_B0__30_carry__1_i_10_O_UNCONNECTED;
  wire [3:1]NLW_S_B0__30_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_S_B0__30_carry__2_O_UNCONNECTED;
  wire [3:2]NLW_S_B0_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_S_B0_carry__1_O_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;

  assign \sgf_result_o[47]_6 [3] = sgf_result_o0__1_carry__0_n_4;
  assign \sgf_result_o[47]_6 [2:0] = \^sgf_result_o[47]_6 [2:0];
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__0_carry__0_i_1
       (.I0(sgf_result_o0__1_carry__0_n_7),
        .I1(\Data_A_i[5]_4 ),
        .I2(\Data_A_i[2]_3 ),
        .O(\sgf_result_o[47] [1]));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    S_B0__0_carry__0_i_2
       (.I0(\Data_A_i[2]_2 ),
        .I1(\Data_A_i[5]_3 ),
        .I2(sgf_result_o0__1_carry_n_4),
        .O(\sgf_result_o[47] [0]));
  LUT4 #(
    .INIT(16'h4DB2)) 
    S_B0__0_carry__0_i_4
       (.I0(\Data_B_i[1] ),
        .I1(\Data_B_i[4] ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .I3(\sgf_result_o[47] [2]),
        .O(\^sgf_result_o[47]_6 [2]));
  LUT4 #(
    .INIT(16'h9669)) 
    S_B0__0_carry__0_i_5
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_B_i[1] ),
        .I2(\Data_B_i[4] ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(\^sgf_result_o[47]_6 [1]));
  (* HLUTNM = "lutpair2" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry__0_i_6
       (.I0(sgf_result_o0__1_carry__0_n_7),
        .I1(\Data_A_i[5]_4 ),
        .I2(\Data_A_i[2]_3 ),
        .I3(\sgf_result_o[47] [0]),
        .O(\^sgf_result_o[47]_6 [0]));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    S_B0__0_carry_i_1
       (.I0(\Data_A_i[2]_1 ),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[5]_2 ),
        .O(\sgf_result_o[47]_4 [2]));
  LUT6 #(
    .INIT(64'h87770000FFFF8777)) 
    S_B0__0_carry_i_2
       (.I0(Data_B_i_IBUF[2]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_A_i_IBUF[2]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_6),
        .I5(\Data_B_i[0] ),
        .O(\sgf_result_o[47]_4 [1]));
  (* HLUTNM = "lutpair78" *) 
  LUT5 #(
    .INIT(32'h2ABFBFBF)) 
    S_B0__0_carry_i_3
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_A_i_IBUF[1]),
        .I4(Data_B_i_IBUF[1]),
        .O(\sgf_result_o[47]_4 [0]));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_4
       (.I0(\Data_A_i[2]_2 ),
        .I1(\Data_A_i[5]_3 ),
        .I2(sgf_result_o0__1_carry_n_4),
        .I3(\sgf_result_o[47]_4 [2]),
        .O(\sgf_result_o[47]_5 [3]));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_5
       (.I0(\Data_A_i[2]_1 ),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[5]_2 ),
        .I3(\sgf_result_o[47]_4 [1]),
        .O(\sgf_result_o[47]_5 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_6
       (.I0(\sgf_result_o[47]_4 [0]),
        .I1(\Data_B_i[3] ),
        .I2(\Data_B_i[0] ),
        .I3(sgf_result_o0__1_carry_n_6),
        .O(\sgf_result_o[47]_5 [1]));
  (* HLUTNM = "lutpair78" *) 
  LUT5 #(
    .INIT(32'h6A959595)) 
    S_B0__0_carry_i_7
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_A_i_IBUF[1]),
        .I4(Data_B_i_IBUF[1]),
        .O(\sgf_result_o[47]_5 [0]));
  CARRY4 S_B0__30_carry
       (.CI(1'b0),
        .CO({S_B0__30_carry_n_0,S_B0__30_carry_n_1,S_B0__30_carry_n_2,S_B0__30_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\Data_A_i[5]_0 ,1'b1}),
        .O(\sgf_result_o[47]_0 ),
        .S(\Data_A_i[11] ));
  CARRY4 S_B0__30_carry__0
       (.CI(S_B0__30_carry_n_0),
        .CO({S_B0__30_carry__0_n_0,S_B0__30_carry__0_n_1,S_B0__30_carry__0_n_2,S_B0__30_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\Data_A_i[5]_1 ),
        .O(\sgf_result_o[47]_1 ),
        .S(\Data_A_i[2] ));
  CARRY4 S_B0__30_carry__0_i_10
       (.CI(\sgf_result_o_OBUF[4]_inst_i_1_n_0 ),
        .CO({S_B0__30_carry__0_i_10_n_0,S_B0__30_carry__0_i_10_n_1,S_B0__30_carry__0_i_10_n_2,S_B0__30_carry__0_i_10_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[2]_4 [2:0],\Data_A_i[5]_5 [3]}),
        .O(\sgf_result_o[47]_8 ),
        .S(\Data_A_i[2]_5 ));
  CARRY4 S_B0__30_carry__1
       (.CI(S_B0__30_carry__0_n_0),
        .CO({S_B0__30_carry__1_n_0,S_B0__30_carry__1_n_1,S_B0__30_carry__1_n_2,S_B0__30_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(\Data_A_i[8] ),
        .O(\sgf_result_o[47]_2 ),
        .S(\Data_A_i[2]_0 ));
  CARRY4 S_B0__30_carry__1_i_10
       (.CI(S_B0__30_carry__0_i_10_n_0),
        .CO({NLW_S_B0__30_carry__1_i_10_CO_UNCONNECTED[3:1],S_B0__30_carry__1_i_10_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\Data_A_i[2]_4 [3]}),
        .O({NLW_S_B0__30_carry__1_i_10_O_UNCONNECTED[3:2],\sgf_result_o[47]_9 }),
        .S({1'b0,1'b0,\Data_B_i[4]_0 }));
  CARRY4 S_B0__30_carry__2
       (.CI(S_B0__30_carry__1_n_0),
        .CO({NLW_S_B0__30_carry__2_CO_UNCONNECTED[3:1],S_B0__30_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Q_middle_temp__0[9]}),
        .O({NLW_S_B0__30_carry__2_O_UNCONNECTED[3:2],\sgf_result_o[47]_3 }),
        .S({1'b0,1'b0,\Data_A_i[6]_2 }));
  CARRY4 S_B0_carry
       (.CI(1'b0),
        .CO({S_B0_carry_n_0,S_B0_carry_n_1,S_B0_carry_n_2,S_B0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({O[2:0],1'b0}),
        .O(Q_middle_temp__0[3:0]),
        .S(\Data_A_i[6] ));
  CARRY4 S_B0_carry__0
       (.CI(S_B0_carry_n_0),
        .CO({S_B0_carry__0_n_0,S_B0_carry__0_n_1,S_B0_carry__0_n_2,S_B0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[6]_0 [2:0],O[3]}),
        .O(Q_middle_temp__0[7:4]),
        .S(\Data_B_i[6] ));
  CARRY4 S_B0_carry__1
       (.CI(S_B0_carry__0_n_0),
        .CO({NLW_S_B0_carry__1_CO_UNCONNECTED[3:2],S_B0_carry__1_n_2,S_B0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\Data_A_i[6]_1 ,\Data_A_i[6]_0 [3]}),
        .O({NLW_S_B0_carry__1_O_UNCONNECTED[3],Q_middle_temp__0[10:8]}),
        .S({1'b0,\Data_B_i[6]_0 }));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_1,sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_A_i[5] }),
        .O({sgf_result_o0__1_carry__0_n_4,\sgf_result_o[47] [2],sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[1] }));
  LUT3 #(
    .INIT(8'h6A)) 
    \sgf_result_o_OBUF[10]_inst_i_2 
       (.I0(\sgf_result_o[47]_1 [2]),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_B_i_IBUF[3]),
        .O(\sgf_result_o[47]_11 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[10]_inst_i_3 
       (.I0(\sgf_result_o[47]_1 [1]),
        .I1(\sgf_result_o[47]_9 [1]),
        .O(\sgf_result_o[47]_11 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[10]_inst_i_4 
       (.I0(\sgf_result_o[47]_1 [0]),
        .I1(\sgf_result_o[47]_9 [0]),
        .O(\sgf_result_o[47]_11 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[10]_inst_i_5 
       (.I0(\sgf_result_o[47]_0 [3]),
        .I1(\sgf_result_o[47]_8 [3]),
        .O(\sgf_result_o[47]_11 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[18]_inst_i_15 
       (.I0(\sgf_result_o[47]_2 [2]),
        .I1(\Data_A_i[11]_0 [2]),
        .O(\sgf_result_o[47]_12 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[18]_inst_i_16 
       (.I0(\sgf_result_o[47]_2 [1]),
        .I1(\Data_A_i[11]_0 [1]),
        .O(\sgf_result_o[47]_12 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[18]_inst_i_17 
       (.I0(\sgf_result_o[47]_2 [0]),
        .I1(\Data_A_i[11]_0 [0]),
        .O(\sgf_result_o[47]_12 [1]));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    \sgf_result_o_OBUF[18]_inst_i_18 
       (.I0(\sgf_result_o[47]_1 [3]),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[4]),
        .O(\sgf_result_o[47]_12 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[22]_inst_i_17 
       (.I0(\sgf_result_o[47]_3 [1]),
        .I1(\Data_A_i[11]_1 [1]),
        .O(\sgf_result_o[47]_13 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[22]_inst_i_18 
       (.I0(\sgf_result_o[47]_3 [0]),
        .I1(\Data_A_i[11]_1 [0]),
        .O(\sgf_result_o[47]_13 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[22]_inst_i_19 
       (.I0(\sgf_result_o[47]_2 [3]),
        .I1(\Data_A_i[11]_0 [3]),
        .O(\sgf_result_o[47]_13 [0]));
  CARRY4 \sgf_result_o_OBUF[4]_inst_i_1 
       (.CI(1'b0),
        .CO({\sgf_result_o_OBUF[4]_inst_i_1_n_0 ,\sgf_result_o_OBUF[4]_inst_i_1_n_1 ,\sgf_result_o_OBUF[4]_inst_i_1_n_2 ,\sgf_result_o_OBUF[4]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\Data_A_i[5]_5 [2:0],1'b0}),
        .O(\sgf_result_o[47]_7 ),
        .S(\Data_A_i[5]_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[8]_inst_i_2 
       (.I0(\sgf_result_o[47]_0 [2]),
        .I1(\sgf_result_o[47]_8 [2]),
        .O(\sgf_result_o[47]_10 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[8]_inst_i_3 
       (.I0(\sgf_result_o[47]_0 [1]),
        .I1(\sgf_result_o[47]_8 [1]),
        .O(\sgf_result_o[47]_10 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[8]_inst_i_4 
       (.I0(\sgf_result_o[47]_0 [0]),
        .I1(\sgf_result_o[47]_8 [0]),
        .O(\sgf_result_o[47]_10 [0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized25
   (O,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[47]_9 ,
    \sgf_result_o[47]_10 ,
    \sgf_result_o[47]_11 ,
    \sgf_result_o[47]_12 ,
    \sgf_result_o[47]_13 ,
    \sgf_result_o[47]_14 ,
    DI,
    S,
    \Data_B_i[6] ,
    \Data_A_i[6] ,
    \Data_A_i[10] ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[0] ,
    \Data_A_i[6]_0 ,
    \Data_A_i[6]_1 ,
    CO,
    \Data_B_i[6]_0 ,
    \Data_B_i[6]_1 ,
    \Data_B_i[6]_2 ,
    \Data_B_i[6]_3 ,
    \Data_A_i[6]_2 ,
    \Data_B_i[6]_4 ,
    \Data_B_i[6]_5 ,
    \Data_A_i[6]_3 ,
    \Data_A_i[6]_4 ,
    \Data_A_i[6]_5 ,
    \Data_A_i[11] ,
    sgf_result_o_OBUF,
    \Data_A_i[6]_6 ,
    \Data_A_i[5] ,
    \Data_A_i[11]_0 ,
    \Data_A_i[5]_0 ,
    \Data_A_i[5]_1 ,
    \Data_A_i[2] ,
    \Data_A_i[2]_0 ,
    \Data_A_i[2]_1 ,
    \Data_A_i[11]_1 ,
    \Data_A_i[8] );
  output [3:0]O;
  output [3:0]\sgf_result_o[47] ;
  output [0:0]\sgf_result_o[47]_0 ;
  output [2:0]\sgf_result_o[47]_1 ;
  output \sgf_result_o[47]_2 ;
  output \sgf_result_o[47]_3 ;
  output \sgf_result_o[47]_4 ;
  output \sgf_result_o[47]_5 ;
  output [2:0]\sgf_result_o[47]_6 ;
  output [3:0]\sgf_result_o[47]_7 ;
  output [3:0]\sgf_result_o[47]_8 ;
  output [3:0]\sgf_result_o[47]_9 ;
  output [5:0]\sgf_result_o[47]_10 ;
  output [1:0]\sgf_result_o[47]_11 ;
  output [3:0]\sgf_result_o[47]_12 ;
  output [3:0]\sgf_result_o[47]_13 ;
  output [2:0]\sgf_result_o[47]_14 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_B_i[6] ;
  input [2:0]\Data_A_i[6] ;
  input [0:0]\Data_A_i[10] ;
  input [2:0]Data_B_i_IBUF;
  input [2:0]Data_A_i_IBUF;
  input \Data_B_i[0] ;
  input [3:0]\Data_A_i[6]_0 ;
  input [1:0]\Data_A_i[6]_1 ;
  input [0:0]CO;
  input [3:0]\Data_B_i[6]_0 ;
  input [1:0]\Data_B_i[6]_1 ;
  input [0:0]\Data_B_i[6]_2 ;
  input \Data_B_i[6]_3 ;
  input \Data_A_i[6]_2 ;
  input \Data_B_i[6]_4 ;
  input \Data_B_i[6]_5 ;
  input \Data_A_i[6]_3 ;
  input \Data_A_i[6]_4 ;
  input \Data_A_i[6]_5 ;
  input [1:0]\Data_A_i[11] ;
  input [1:0]sgf_result_o_OBUF;
  input [0:0]\Data_A_i[6]_6 ;
  input [3:0]\Data_A_i[5] ;
  input [3:0]\Data_A_i[11]_0 ;
  input [3:0]\Data_A_i[5]_0 ;
  input [3:0]\Data_A_i[5]_1 ;
  input [3:0]\Data_A_i[2] ;
  input [3:0]\Data_A_i[2]_0 ;
  input [1:0]\Data_A_i[2]_1 ;
  input [3:0]\Data_A_i[11]_1 ;
  input [2:0]\Data_A_i[8] ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [0:0]\Data_A_i[10] ;
  wire [1:0]\Data_A_i[11] ;
  wire [3:0]\Data_A_i[11]_0 ;
  wire [3:0]\Data_A_i[11]_1 ;
  wire [3:0]\Data_A_i[2] ;
  wire [3:0]\Data_A_i[2]_0 ;
  wire [1:0]\Data_A_i[2]_1 ;
  wire [3:0]\Data_A_i[5] ;
  wire [3:0]\Data_A_i[5]_0 ;
  wire [3:0]\Data_A_i[5]_1 ;
  wire [2:0]\Data_A_i[6] ;
  wire [3:0]\Data_A_i[6]_0 ;
  wire [1:0]\Data_A_i[6]_1 ;
  wire \Data_A_i[6]_2 ;
  wire \Data_A_i[6]_3 ;
  wire \Data_A_i[6]_4 ;
  wire \Data_A_i[6]_5 ;
  wire [0:0]\Data_A_i[6]_6 ;
  wire [2:0]\Data_A_i[8] ;
  wire [2:0]Data_A_i_IBUF;
  wire \Data_B_i[0] ;
  wire [2:0]\Data_B_i[6] ;
  wire [3:0]\Data_B_i[6]_0 ;
  wire [1:0]\Data_B_i[6]_1 ;
  wire [0:0]\Data_B_i[6]_2 ;
  wire \Data_B_i[6]_3 ;
  wire \Data_B_i[6]_4 ;
  wire \Data_B_i[6]_5 ;
  wire [2:0]Data_B_i_IBUF;
  wire [3:0]O;
  wire \ODD1.middle_n_0 ;
  wire \ODD1.middle_n_1 ;
  wire \ODD1.middle_n_10 ;
  wire \ODD1.middle_n_12 ;
  wire \ODD1.middle_n_13 ;
  wire \ODD1.middle_n_14 ;
  wire \ODD1.middle_n_15 ;
  wire \ODD1.middle_n_16 ;
  wire \ODD1.middle_n_17 ;
  wire \ODD1.middle_n_18 ;
  wire \ODD1.middle_n_19 ;
  wire \ODD1.middle_n_2 ;
  wire \ODD1.middle_n_20 ;
  wire \ODD1.middle_n_21 ;
  wire \ODD1.middle_n_3 ;
  wire \ODD1.middle_n_4 ;
  wire \ODD1.middle_n_5 ;
  wire \ODD1.middle_n_7 ;
  wire \ODD1.middle_n_9 ;
  wire \ODD1.right_lower_n_0 ;
  wire \ODD1.right_lower_n_10 ;
  wire \ODD1.right_lower_n_11 ;
  wire \ODD1.right_lower_n_12 ;
  wire \ODD1.right_lower_n_13 ;
  wire \ODD1.right_lower_n_14 ;
  wire \ODD1.right_lower_n_15 ;
  wire \ODD1.right_lower_n_16 ;
  wire \ODD1.right_lower_n_17 ;
  wire \ODD1.right_lower_n_18 ;
  wire \ODD1.right_lower_n_4 ;
  wire \ODD1.right_lower_n_5 ;
  wire \ODD1.right_lower_n_6 ;
  wire \ODD1.right_lower_n_7 ;
  wire \ODD1.right_lower_n_8 ;
  wire \ODD1.right_lower_n_9 ;
  wire [9:2]Q_middle_temp;
  wire [3:0]S;
  wire sgf_result_o1__0_carry__0_i_6_n_0;
  wire sgf_result_o1__0_carry__0_i_7_n_0;
  wire sgf_result_o1__0_carry_i_10_n_0;
  wire sgf_result_o1__0_carry_i_11_n_0;
  wire sgf_result_o1__0_carry_i_14_n_0;
  wire sgf_result_o1__0_carry_i_15_n_0;
  wire sgf_result_o1__0_carry_i_16_n_0;
  wire sgf_result_o1__0_carry_i_17_n_0;
  wire sgf_result_o1__0_carry_i_19_n_0;
  wire sgf_result_o1__0_carry_i_22__0_n_0;
  wire sgf_result_o1__0_carry_i_8_n_0;
  wire sgf_result_o1__0_carry_i_9_n_0;
  wire sgf_result_o1__21_carry__0_n_0;
  wire sgf_result_o1__21_carry__0_n_1;
  wire sgf_result_o1__21_carry__0_n_2;
  wire sgf_result_o1__21_carry__0_n_3;
  wire sgf_result_o1__21_carry__1_i_1_n_0;
  wire sgf_result_o1__21_carry__1_n_3;
  wire sgf_result_o1__21_carry__1_n_6;
  wire sgf_result_o1__21_carry_n_0;
  wire sgf_result_o1__21_carry_n_1;
  wire sgf_result_o1__21_carry_n_2;
  wire sgf_result_o1__21_carry_n_3;
  wire sgf_result_o1_carry__0_n_1;
  wire sgf_result_o1_carry__0_n_2;
  wire sgf_result_o1_carry__0_n_3;
  wire sgf_result_o1_carry_n_0;
  wire sgf_result_o1_carry_n_1;
  wire sgf_result_o1_carry_n_2;
  wire sgf_result_o1_carry_n_3;
  wire [3:0]\sgf_result_o[47] ;
  wire [0:0]\sgf_result_o[47]_0 ;
  wire [2:0]\sgf_result_o[47]_1 ;
  wire [5:0]\sgf_result_o[47]_10 ;
  wire [1:0]\sgf_result_o[47]_11 ;
  wire [3:0]\sgf_result_o[47]_12 ;
  wire [3:0]\sgf_result_o[47]_13 ;
  wire [2:0]\sgf_result_o[47]_14 ;
  wire \sgf_result_o[47]_2 ;
  wire \sgf_result_o[47]_3 ;
  wire \sgf_result_o[47]_4 ;
  wire \sgf_result_o[47]_5 ;
  wire [2:0]\sgf_result_o[47]_6 ;
  wire [3:0]\sgf_result_o[47]_7 ;
  wire [3:0]\sgf_result_o[47]_8 ;
  wire [3:0]\sgf_result_o[47]_9 ;
  wire [1:0]sgf_result_o_OBUF;
  wire [3:1]NLW_sgf_result_o1__21_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o1__21_carry__1_O_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o1_carry__0_CO_UNCONNECTED;

  Recursive_KOA__parameterized28 \ODD1.middle 
       (.CO(CO),
        .\Data_A_i[10] (sgf_result_o1__0_carry_i_14_n_0),
        .\Data_A_i[10]_0 (sgf_result_o1__0_carry__0_i_7_n_0),
        .\Data_A_i[10]_1 (sgf_result_o1__0_carry_i_8_n_0),
        .\Data_A_i[10]_2 (sgf_result_o1__0_carry_i_9_n_0),
        .\Data_A_i[10]_3 (sgf_result_o1__0_carry_i_17_n_0),
        .\Data_A_i[10]_4 (sgf_result_o1__0_carry_i_10_n_0),
        .\Data_A_i[6] (\Data_A_i[6]_0 ),
        .\Data_A_i[6]_0 (\Data_A_i[6]_1 ),
        .\Data_A_i[6]_1 (Q_middle_temp[8:7]),
        .\Data_B_i[10] (sgf_result_o1__0_carry_i_15_n_0),
        .\Data_B_i[10]_0 (sgf_result_o1__0_carry_i_11_n_0),
        .\Data_B_i[6] (\Data_B_i[6]_0 ),
        .\Data_B_i[6]_0 (\Data_B_i[6]_1 ),
        .\Data_B_i[6]_1 (sgf_result_o1__0_carry__0_i_6_n_0),
        .\Data_B_i[6]_2 (\Data_B_i[6]_2 ),
        .\Data_B_i[6]_3 (\ODD1.right_lower_n_0 ),
        .\Data_B_i[6]_4 (sgf_result_o1__0_carry_i_16_n_0),
        .O({\ODD1.middle_n_0 ,\ODD1.middle_n_1 ,\ODD1.middle_n_2 ,\ODD1.middle_n_3 }),
        .S({\ODD1.middle_n_14 ,\ODD1.middle_n_15 ,\ODD1.middle_n_16 }),
        .\sgf_result_o[47] ({\ODD1.middle_n_4 ,\ODD1.middle_n_5 }),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_1 (\ODD1.middle_n_7 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_3 (\ODD1.middle_n_9 ),
        .\sgf_result_o[47]_4 (\ODD1.middle_n_10 ),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_4 ),
        .\sgf_result_o[47]_6 (\ODD1.middle_n_12 ),
        .\sgf_result_o[47]_7 (\ODD1.middle_n_13 ),
        .\sgf_result_o[47]_8 ({\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 }),
        .\sgf_result_o[47]_9 (\ODD1.middle_n_21 ));
  Recursive_KOA__parameterized27 \ODD1.right_lower 
       (.DI(DI),
        .\Data_A_i[11] (\Data_A_i[11] ),
        .\Data_A_i[11]_0 (\Data_A_i[11]_0 ),
        .\Data_A_i[11]_1 (\Data_A_i[11]_1 ),
        .\Data_A_i[2] (\Data_A_i[2] ),
        .\Data_A_i[2]_0 (\Data_A_i[2]_0 ),
        .\Data_A_i[2]_1 (\Data_A_i[2]_1 ),
        .\Data_A_i[5] (\Data_A_i[5] ),
        .\Data_A_i[5]_0 (\Data_A_i[5]_0 ),
        .\Data_A_i[5]_1 (\Data_A_i[5]_1 ),
        .\Data_A_i[6] (\Data_A_i[6] ),
        .\Data_A_i[6]_0 (\Data_A_i[6]_1 ),
        .\Data_A_i[6]_1 (\Data_A_i[6]_2 ),
        .\Data_A_i[6]_2 (\Data_A_i[6]_3 ),
        .\Data_A_i[6]_3 (\Data_A_i[6]_4 ),
        .\Data_A_i[6]_4 (\Data_A_i[6]_5 ),
        .\Data_A_i[6]_5 (\Data_A_i[6]_6 ),
        .\Data_A_i[6]_6 (\Data_A_i[6]_0 [0]),
        .\Data_A_i[8] (\Data_A_i[8] ),
        .Data_A_i_IBUF(Data_A_i_IBUF),
        .\Data_B_i[0] (\Data_B_i[0] ),
        .\Data_B_i[10] (sgf_result_o1__0_carry_i_11_n_0),
        .\Data_B_i[6] (\Data_B_i[6] ),
        .\Data_B_i[6]_0 (\Data_B_i[6]_1 ),
        .\Data_B_i[6]_1 (\Data_B_i[6]_3 ),
        .\Data_B_i[6]_2 (\Data_B_i[6]_5 ),
        .\Data_B_i[6]_3 (\Data_B_i[6]_0 [0]),
        .Data_B_i_IBUF(Data_B_i_IBUF),
        .O(O),
        .Q_middle_temp(Q_middle_temp[7:2]),
        .S(S),
        .\sgf_result_o[47] (\ODD1.right_lower_n_0 ),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_1 ({\ODD1.right_lower_n_4 ,\ODD1.right_lower_n_5 ,\ODD1.right_lower_n_6 }),
        .\sgf_result_o[47]_10 (\sgf_result_o[47]_12 ),
        .\sgf_result_o[47]_11 (\sgf_result_o[47]_13 ),
        .\sgf_result_o[47]_12 (\sgf_result_o[47]_14 ),
        .\sgf_result_o[47]_2 ({\ODD1.right_lower_n_7 ,\ODD1.right_lower_n_8 ,\ODD1.right_lower_n_9 ,\ODD1.right_lower_n_10 }),
        .\sgf_result_o[47]_3 ({\ODD1.right_lower_n_11 ,\ODD1.right_lower_n_12 ,\ODD1.right_lower_n_13 ,\ODD1.right_lower_n_14 }),
        .\sgf_result_o[47]_4 ({\ODD1.right_lower_n_15 ,\ODD1.right_lower_n_16 ,\ODD1.right_lower_n_17 ,\ODD1.right_lower_n_18 }),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_7 ),
        .\sgf_result_o[47]_6 (\sgf_result_o[47]_8 [0]),
        .\sgf_result_o[47]_7 (\sgf_result_o[47]_9 ),
        .\sgf_result_o[47]_8 (\sgf_result_o[47]_10 ),
        .\sgf_result_o[47]_9 (\sgf_result_o[47]_11 ),
        .sgf_result_o_OBUF(sgf_result_o_OBUF));
  LUT6 #(
    .INIT(64'h9A956595956A6A6A)) 
    S_B0_carry__0_i_1__0
       (.I0(\sgf_result_o[47] [2]),
        .I1(CO),
        .I2(\Data_B_i[6]_1 [0]),
        .I3(\Data_A_i[6]_1 [0]),
        .I4(\Data_B_i[6]_2 ),
        .I5(\Data_B_i[6]_4 ),
        .O(\sgf_result_o[47]_8 [3]));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    S_B0_carry__0_i_2
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_B_i[6]_1 [0]),
        .I2(\Data_A_i[6]_1 [1]),
        .I3(\Data_A_i[6]_1 [0]),
        .I4(\Data_B_i[6]_1 [1]),
        .O(\sgf_result_o[47]_8 [2]));
  LUT3 #(
    .INIT(8'h6A)) 
    S_B0_carry__0_i_3
       (.I0(\sgf_result_o[47] [0]),
        .I1(\Data_A_i[6]_1 [0]),
        .I2(\Data_B_i[6]_1 [0]),
        .O(\sgf_result_o[47]_8 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry__1_i_1
       (.I0(sgf_result_o1__21_carry__1_n_6),
        .I1(\Data_B_i[6]_3 ),
        .O(\sgf_result_o[47]_6 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0_carry__1_i_2__0
       (.I0(\sgf_result_o[47]_0 ),
        .I1(\Data_A_i[6]_5 ),
        .O(\sgf_result_o[47]_6 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0_carry__1_i_3
       (.I0(\sgf_result_o[47] [3]),
        .I1(\Data_A_i[6]_4 ),
        .O(\sgf_result_o[47]_6 [0]));
  LUT6 #(
    .INIT(64'h0400464B04000B0B)) 
    sgf_result_o1__0_carry__0_i_6
       (.I0(\ODD1.middle_n_9 ),
        .I1(\ODD1.middle_n_7 ),
        .I2(\sgf_result_o[47]_2 ),
        .I3(\sgf_result_o[47]_4 ),
        .I4(\sgf_result_o[47]_3 ),
        .I5(sgf_result_o1__0_carry_i_22__0_n_0),
        .O(sgf_result_o1__0_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'h0020000000330020)) 
    sgf_result_o1__0_carry__0_i_7
       (.I0(sgf_result_o1__0_carry_i_22__0_n_0),
        .I1(\sgf_result_o[47]_3 ),
        .I2(\sgf_result_o[47]_4 ),
        .I3(\sgf_result_o[47]_2 ),
        .I4(\ODD1.middle_n_7 ),
        .I5(\ODD1.middle_n_9 ),
        .O(sgf_result_o1__0_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'h6868688068808080)) 
    sgf_result_o1__0_carry_i_10
       (.I0(\Data_A_i[6]_0 [3]),
        .I1(\ODD1.middle_n_10 ),
        .I2(\Data_B_i[6]_0 [3]),
        .I3(\Data_B_i[6]_0 [2]),
        .I4(\ODD1.middle_n_13 ),
        .I5(\Data_B_i[6]_2 ),
        .O(sgf_result_o1__0_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'h6060609F609F6060)) 
    sgf_result_o1__0_carry_i_11
       (.I0(\Data_A_i[6]_0 [0]),
        .I1(\Data_A_i[6]_1 [0]),
        .I2(\ODD1.middle_n_7 ),
        .I3(\ODD1.middle_n_9 ),
        .I4(\Data_B_i[6]_0 [0]),
        .I5(\Data_B_i[6]_1 [0]),
        .O(sgf_result_o1__0_carry_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h566A)) 
    sgf_result_o1__0_carry_i_14
       (.I0(\Data_A_i[6]_0 [3]),
        .I1(\Data_A_i[6]_0 [2]),
        .I2(\ODD1.middle_n_12 ),
        .I3(CO),
        .O(sgf_result_o1__0_carry_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h566A)) 
    sgf_result_o1__0_carry_i_15
       (.I0(\Data_B_i[6]_0 [3]),
        .I1(\Data_B_i[6]_0 [2]),
        .I2(\ODD1.middle_n_13 ),
        .I3(\Data_B_i[6]_2 ),
        .O(sgf_result_o1__0_carry_i_15_n_0));
  LUT6 #(
    .INIT(64'hBEFA7D72FEFA3236)) 
    sgf_result_o1__0_carry_i_16
       (.I0(\ODD1.middle_n_9 ),
        .I1(\ODD1.middle_n_7 ),
        .I2(\sgf_result_o[47]_2 ),
        .I3(\sgf_result_o[47]_4 ),
        .I4(\sgf_result_o[47]_3 ),
        .I5(sgf_result_o1__0_carry_i_22__0_n_0),
        .O(sgf_result_o1__0_carry_i_16_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o1__0_carry_i_17
       (.I0(sgf_result_o1__0_carry_i_15_n_0),
        .I1(sgf_result_o1__0_carry_i_14_n_0),
        .O(sgf_result_o1__0_carry_i_17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hA880)) 
    sgf_result_o1__0_carry_i_19
       (.I0(\Data_A_i[6]_0 [3]),
        .I1(\Data_A_i[6]_0 [2]),
        .I2(\ODD1.middle_n_12 ),
        .I3(CO),
        .O(sgf_result_o1__0_carry_i_19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_22__0
       (.I0(\Data_B_i[6]_0 [0]),
        .I1(\Data_B_i[6]_1 [0]),
        .O(sgf_result_o1__0_carry_i_22__0_n_0));
  LUT6 #(
    .INIT(64'h9A9A3AC53AC59A9A)) 
    sgf_result_o1__0_carry_i_8
       (.I0(\sgf_result_o[47]_5 ),
        .I1(\sgf_result_o[47]_2 ),
        .I2(\sgf_result_o[47]_4 ),
        .I3(\sgf_result_o[47]_3 ),
        .I4(\Data_B_i[6]_1 [0]),
        .I5(\Data_B_i[6]_0 [0]),
        .O(sgf_result_o1__0_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'hE8000000)) 
    sgf_result_o1__0_carry_i_9
       (.I0(\Data_B_i[6]_2 ),
        .I1(\ODD1.middle_n_13 ),
        .I2(\Data_B_i[6]_0 [2]),
        .I3(\Data_B_i[6]_0 [3]),
        .I4(sgf_result_o1__0_carry_i_19_n_0),
        .O(sgf_result_o1__0_carry_i_9_n_0));
  CARRY4 sgf_result_o1__21_carry
       (.CI(1'b0),
        .CO({sgf_result_o1__21_carry_n_0,sgf_result_o1__21_carry_n_1,sgf_result_o1__21_carry_n_2,sgf_result_o1__21_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\ODD1.right_lower_n_4 ,\ODD1.right_lower_n_5 ,\ODD1.right_lower_n_6 ,1'b1}),
        .O(O),
        .S({\ODD1.right_lower_n_11 ,\ODD1.right_lower_n_12 ,\ODD1.right_lower_n_13 ,\ODD1.right_lower_n_14 }));
  CARRY4 sgf_result_o1__21_carry__0
       (.CI(sgf_result_o1__21_carry_n_0),
        .CO({sgf_result_o1__21_carry__0_n_0,sgf_result_o1__21_carry__0_n_1,sgf_result_o1__21_carry__0_n_2,sgf_result_o1__21_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.right_lower_n_7 ,\ODD1.right_lower_n_8 ,\ODD1.right_lower_n_9 ,\ODD1.right_lower_n_10 }),
        .O(\sgf_result_o[47] ),
        .S({\ODD1.right_lower_n_15 ,\ODD1.right_lower_n_16 ,\ODD1.right_lower_n_17 ,\ODD1.right_lower_n_18 }));
  CARRY4 sgf_result_o1__21_carry__1
       (.CI(sgf_result_o1__21_carry__0_n_0),
        .CO({NLW_sgf_result_o1__21_carry__1_CO_UNCONNECTED[3:1],sgf_result_o1__21_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Q_middle_temp[8]}),
        .O({NLW_sgf_result_o1__21_carry__1_O_UNCONNECTED[3:2],sgf_result_o1__21_carry__1_n_6,\sgf_result_o[47]_0 }),
        .S({1'b0,1'b0,sgf_result_o1__21_carry__1_i_1_n_0,\ODD1.middle_n_21 }));
  LUT1 #(
    .INIT(2'h1)) 
    sgf_result_o1__21_carry__1_i_1
       (.I0(Q_middle_temp[9]),
        .O(sgf_result_o1__21_carry__1_i_1_n_0));
  CARRY4 sgf_result_o1_carry
       (.CI(1'b0),
        .CO({sgf_result_o1_carry_n_0,sgf_result_o1_carry_n_1,sgf_result_o1_carry_n_2,sgf_result_o1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.middle_n_1 ,\ODD1.middle_n_2 ,\ODD1.middle_n_3 ,1'b0}),
        .O(Q_middle_temp[5:2]),
        .S({\ODD1.middle_n_14 ,\ODD1.middle_n_15 ,\ODD1.middle_n_16 ,\Data_A_i[10] }));
  CARRY4 sgf_result_o1_carry__0
       (.CI(sgf_result_o1_carry_n_0),
        .CO({NLW_sgf_result_o1_carry__0_CO_UNCONNECTED[3],sgf_result_o1_carry__0_n_1,sgf_result_o1_carry__0_n_2,sgf_result_o1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\ODD1.middle_n_4 ,\ODD1.middle_n_5 ,\ODD1.middle_n_0 }),
        .O(Q_middle_temp[9:6]),
        .S({\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 }));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o1_carry_i_5
       (.I0(\Data_B_i[6]_0 [1]),
        .I1(\Data_B_i[6]_1 [1]),
        .I2(\Data_B_i[6]_0 [0]),
        .I3(\Data_B_i[6]_1 [0]),
        .I4(\ODD1.middle_n_9 ),
        .O(\sgf_result_o[47]_5 ));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized27
   (\sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[47]_9 ,
    \sgf_result_o[47]_10 ,
    \sgf_result_o[47]_11 ,
    \sgf_result_o[47]_12 ,
    DI,
    S,
    \Data_B_i[6] ,
    \Data_A_i[6] ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[0] ,
    \Data_B_i[10] ,
    \Data_B_i[6]_0 ,
    \Data_A_i[6]_0 ,
    \Data_B_i[6]_1 ,
    Q_middle_temp,
    \Data_A_i[6]_1 ,
    O,
    \Data_B_i[6]_2 ,
    \Data_A_i[6]_2 ,
    \Data_A_i[6]_3 ,
    \Data_A_i[6]_4 ,
    \Data_A_i[11] ,
    sgf_result_o_OBUF,
    \Data_A_i[6]_5 ,
    \Data_A_i[5] ,
    \Data_A_i[11]_0 ,
    \Data_A_i[5]_0 ,
    \Data_A_i[5]_1 ,
    \Data_A_i[2] ,
    \Data_A_i[2]_0 ,
    \Data_A_i[2]_1 ,
    \Data_A_i[11]_1 ,
    \Data_A_i[8] ,
    \Data_B_i[6]_3 ,
    \Data_A_i[6]_6 );
  output [0:0]\sgf_result_o[47] ;
  output [2:0]\sgf_result_o[47]_0 ;
  output [2:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [3:0]\sgf_result_o[47]_4 ;
  output [3:0]\sgf_result_o[47]_5 ;
  output [0:0]\sgf_result_o[47]_6 ;
  output [3:0]\sgf_result_o[47]_7 ;
  output [5:0]\sgf_result_o[47]_8 ;
  output [1:0]\sgf_result_o[47]_9 ;
  output [3:0]\sgf_result_o[47]_10 ;
  output [3:0]\sgf_result_o[47]_11 ;
  output [2:0]\sgf_result_o[47]_12 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_B_i[6] ;
  input [2:0]\Data_A_i[6] ;
  input [2:0]Data_B_i_IBUF;
  input [2:0]Data_A_i_IBUF;
  input \Data_B_i[0] ;
  input \Data_B_i[10] ;
  input [1:0]\Data_B_i[6]_0 ;
  input [1:0]\Data_A_i[6]_0 ;
  input \Data_B_i[6]_1 ;
  input [5:0]Q_middle_temp;
  input \Data_A_i[6]_1 ;
  input [3:0]O;
  input \Data_B_i[6]_2 ;
  input \Data_A_i[6]_2 ;
  input \Data_A_i[6]_3 ;
  input \Data_A_i[6]_4 ;
  input [1:0]\Data_A_i[11] ;
  input [1:0]sgf_result_o_OBUF;
  input [0:0]\Data_A_i[6]_5 ;
  input [3:0]\Data_A_i[5] ;
  input [3:0]\Data_A_i[11]_0 ;
  input [3:0]\Data_A_i[5]_0 ;
  input [3:0]\Data_A_i[5]_1 ;
  input [3:0]\Data_A_i[2] ;
  input [3:0]\Data_A_i[2]_0 ;
  input [1:0]\Data_A_i[2]_1 ;
  input [3:0]\Data_A_i[11]_1 ;
  input [2:0]\Data_A_i[8] ;
  input [0:0]\Data_B_i[6]_3 ;
  input [0:0]\Data_A_i[6]_6 ;

  wire [2:0]DI;
  wire [1:0]\Data_A_i[11] ;
  wire [3:0]\Data_A_i[11]_0 ;
  wire [3:0]\Data_A_i[11]_1 ;
  wire [3:0]\Data_A_i[2] ;
  wire [3:0]\Data_A_i[2]_0 ;
  wire [1:0]\Data_A_i[2]_1 ;
  wire [3:0]\Data_A_i[5] ;
  wire [3:0]\Data_A_i[5]_0 ;
  wire [3:0]\Data_A_i[5]_1 ;
  wire [2:0]\Data_A_i[6] ;
  wire [1:0]\Data_A_i[6]_0 ;
  wire \Data_A_i[6]_1 ;
  wire \Data_A_i[6]_2 ;
  wire \Data_A_i[6]_3 ;
  wire \Data_A_i[6]_4 ;
  wire [0:0]\Data_A_i[6]_5 ;
  wire [0:0]\Data_A_i[6]_6 ;
  wire [2:0]\Data_A_i[8] ;
  wire [2:0]Data_A_i_IBUF;
  wire \Data_B_i[0] ;
  wire \Data_B_i[10] ;
  wire [2:0]\Data_B_i[6] ;
  wire [1:0]\Data_B_i[6]_0 ;
  wire \Data_B_i[6]_1 ;
  wire \Data_B_i[6]_2 ;
  wire [0:0]\Data_B_i[6]_3 ;
  wire [2:0]Data_B_i_IBUF;
  wire [3:0]O;
  wire [5:0]Q_middle_temp;
  wire [3:0]S;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire [0:0]\sgf_result_o[47] ;
  wire [2:0]\sgf_result_o[47]_0 ;
  wire [2:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_10 ;
  wire [3:0]\sgf_result_o[47]_11 ;
  wire [2:0]\sgf_result_o[47]_12 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:0]\sgf_result_o[47]_4 ;
  wire [3:0]\^sgf_result_o[47]_5 ;
  wire [0:0]\sgf_result_o[47]_6 ;
  wire [3:0]\sgf_result_o[47]_7 ;
  wire [5:0]\sgf_result_o[47]_8 ;
  wire [1:0]\sgf_result_o[47]_9 ;
  wire [1:0]sgf_result_o_OBUF;
  wire \sgf_result_o_OBUF[10]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[10]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[10]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[10]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[18]_inst_i_14_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_14_n_1 ;
  wire \sgf_result_o_OBUF[18]_inst_i_14_n_2 ;
  wire \sgf_result_o_OBUF[18]_inst_i_14_n_3 ;
  wire \sgf_result_o_OBUF[22]_inst_i_15_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_15_n_1 ;
  wire \sgf_result_o_OBUF[22]_inst_i_15_n_2 ;
  wire \sgf_result_o_OBUF[22]_inst_i_15_n_3 ;
  wire \sgf_result_o_OBUF[26]_inst_i_15_n_2 ;
  wire \sgf_result_o_OBUF[26]_inst_i_15_n_3 ;
  wire \sgf_result_o_OBUF[8]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[8]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[8]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[8]_inst_i_1_n_3 ;
  wire [2:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;
  wire [3:2]\NLW_sgf_result_o_OBUF[26]_inst_i_15_CO_UNCONNECTED ;
  wire [3:3]\NLW_sgf_result_o_OBUF[26]_inst_i_15_O_UNCONNECTED ;

  assign \sgf_result_o[47]_5 [3:1] = \^sgf_result_o[47]_5 [3:1];
  assign \sgf_result_o[47]_5 [0] = sgf_result_o0__1_carry_n_4;
  (* HLUTNM = "lutpair11" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__30_carry_i_1
       (.I0(sgf_result_o0__1_carry_n_5),
        .I1(\Data_A_i[11] [0]),
        .I2(sgf_result_o_OBUF[0]),
        .O(\sgf_result_o[47]_0 [2]));
  LUT6 #(
    .INIT(64'h87770000FFFF8777)) 
    S_B0__30_carry_i_2
       (.I0(Data_B_i_IBUF[2]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_A_i_IBUF[2]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_6),
        .I5(\Data_B_i[0] ),
        .O(\sgf_result_o[47]_0 [1]));
  (* HLUTNM = "lutpair81" *) 
  LUT5 #(
    .INIT(32'h7FFF0777)) 
    S_B0__30_carry_i_3
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_7),
        .O(\sgf_result_o[47]_0 [0]));
  (* HLUTNM = "lutpair12" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry_i_4
       (.I0(\Data_A_i[6]_5 ),
        .I1(\Data_A_i[11] [1]),
        .I2(sgf_result_o_OBUF[1]),
        .I3(\sgf_result_o[47]_0 [2]),
        .O(\sgf_result_o[47]_7 [3]));
  (* HLUTNM = "lutpair11" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry_i_5
       (.I0(sgf_result_o0__1_carry_n_5),
        .I1(\Data_A_i[11] [0]),
        .I2(sgf_result_o_OBUF[0]),
        .I3(\sgf_result_o[47]_0 [1]),
        .O(\sgf_result_o[47]_7 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__30_carry_i_6
       (.I0(\sgf_result_o[47]_0 [0]),
        .I1(\Data_B_i[0] ),
        .I2(\Data_B_i[6]_2 ),
        .I3(sgf_result_o0__1_carry_n_6),
        .O(\sgf_result_o[47]_7 [1]));
  (* HLUTNM = "lutpair81" *) 
  LUT5 #(
    .INIT(32'h78888777)) 
    S_B0__30_carry_i_7
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_7),
        .O(\sgf_result_o[47]_7 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry__0_i_4
       (.I0(O[3]),
        .I1(\sgf_result_o[47] ),
        .O(\sgf_result_o[47]_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry_i_1
       (.I0(O[2]),
        .I1(sgf_result_o0__1_carry__0_n_5),
        .O(\^sgf_result_o[47]_5 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry_i_2
       (.I0(O[1]),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .O(\^sgf_result_o[47]_5 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry_i_3
       (.I0(O[0]),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .O(\^sgf_result_o[47]_5 [1]));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({\sgf_result_o[47] ,NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_B_i[6] }),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[6] }));
  LUT2 #(
    .INIT(4'hB)) 
    sgf_result_o1__21_carry__0_i_1
       (.I0(Q_middle_temp[4]),
        .I1(sgf_result_o0__1_carry__0_n_5),
        .O(\sgf_result_o[47]_2 [3]));
  LUT3 #(
    .INIT(8'h4D)) 
    sgf_result_o1__21_carry__0_i_2
       (.I0(\Data_B_i[6]_1 ),
        .I1(Q_middle_temp[3]),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .O(\sgf_result_o[47]_2 [2]));
  (* HLUTNM = "lutpair10" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    sgf_result_o1__21_carry__0_i_3
       (.I0(\Data_A_i[6]_4 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(Q_middle_temp[2]),
        .O(\sgf_result_o[47]_2 [1]));
  (* HLUTNM = "lutpair9" *) 
  LUT3 #(
    .INIT(8'hD4)) 
    sgf_result_o1__21_carry__0_i_4
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_A_i[6]_3 ),
        .I2(Q_middle_temp[1]),
        .O(\sgf_result_o[47]_2 [0]));
  LUT4 #(
    .INIT(16'hD22D)) 
    sgf_result_o1__21_carry__0_i_5
       (.I0(sgf_result_o0__1_carry__0_n_5),
        .I1(Q_middle_temp[4]),
        .I2(\sgf_result_o[47] ),
        .I3(Q_middle_temp[5]),
        .O(\sgf_result_o[47]_4 [3]));
  LUT5 #(
    .INIT(32'h4DB2B24D)) 
    sgf_result_o1__21_carry__0_i_6
       (.I0(sgf_result_o0__1_carry__0_n_6),
        .I1(Q_middle_temp[3]),
        .I2(\Data_B_i[6]_1 ),
        .I3(sgf_result_o0__1_carry__0_n_5),
        .I4(Q_middle_temp[4]),
        .O(\sgf_result_o[47]_4 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry__0_i_7
       (.I0(\sgf_result_o[47]_2 [1]),
        .I1(Q_middle_temp[3]),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .I3(\Data_B_i[6]_1 ),
        .O(\sgf_result_o[47]_4 [1]));
  (* HLUTNM = "lutpair10" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    sgf_result_o1__21_carry__0_i_8
       (.I0(\Data_A_i[6]_4 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(Q_middle_temp[2]),
        .I3(\sgf_result_o[47]_2 [0]),
        .O(\sgf_result_o[47]_4 [0]));
  (* HLUTNM = "lutpair8" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__21_carry_i_1
       (.I0(Q_middle_temp[0]),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[6]_2 ),
        .O(\sgf_result_o[47]_1 [2]));
  LUT6 #(
    .INIT(64'hB2222BBB2BBB2BBB)) 
    sgf_result_o1__21_carry_i_2
       (.I0(\Data_B_i[10] ),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_B_i[6]_0 [0]),
        .I3(\Data_A_i[6]_0 [1]),
        .I4(\Data_A_i[6]_0 [0]),
        .I5(\Data_B_i[6]_0 [1]),
        .O(\sgf_result_o[47]_1 [1]));
  (* HLUTNM = "lutpair80" *) 
  LUT5 #(
    .INIT(32'h1747270F)) 
    sgf_result_o1__21_carry_i_3
       (.I0(\Data_A_i[6]_0 [0]),
        .I1(\Data_B_i[6]_0 [0]),
        .I2(sgf_result_o0__1_carry_n_7),
        .I3(\Data_B_i[6]_3 ),
        .I4(\Data_A_i[6]_6 ),
        .O(\sgf_result_o[47]_1 [0]));
  (* HLUTNM = "lutpair9" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    sgf_result_o1__21_carry_i_4
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_A_i[6]_3 ),
        .I2(Q_middle_temp[1]),
        .I3(\sgf_result_o[47]_1 [2]),
        .O(\sgf_result_o[47]_3 [3]));
  (* HLUTNM = "lutpair8" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry_i_5
       (.I0(Q_middle_temp[0]),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[6]_2 ),
        .I3(\sgf_result_o[47]_1 [1]),
        .O(\sgf_result_o[47]_3 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry_i_6
       (.I0(\sgf_result_o[47]_1 [0]),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_A_i[6]_1 ),
        .I3(\Data_B_i[10] ),
        .O(\sgf_result_o[47]_3 [1]));
  (* HLUTNM = "lutpair80" *) 
  LUT5 #(
    .INIT(32'h96C3A50F)) 
    sgf_result_o1__21_carry_i_7
       (.I0(\Data_A_i[6]_0 [0]),
        .I1(\Data_B_i[6]_0 [0]),
        .I2(sgf_result_o0__1_carry_n_7),
        .I3(\Data_B_i[6]_3 ),
        .I4(\Data_A_i[6]_6 ),
        .O(\sgf_result_o[47]_3 [0]));
  CARRY4 \sgf_result_o_OBUF[10]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[8]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[10]_inst_i_1_n_0 ,\sgf_result_o_OBUF[10]_inst_i_1_n_1 ,\sgf_result_o_OBUF[10]_inst_i_1_n_2 ,\sgf_result_o_OBUF[10]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\Data_A_i[5]_0 [2:0],\Data_A_i[5] [3]}),
        .O({\sgf_result_o[47]_9 ,\sgf_result_o[47]_8 [5:4]}),
        .S(\Data_A_i[5]_1 ));
  CARRY4 \sgf_result_o_OBUF[18]_inst_i_14 
       (.CI(\sgf_result_o_OBUF[10]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[18]_inst_i_14_n_0 ,\sgf_result_o_OBUF[18]_inst_i_14_n_1 ,\sgf_result_o_OBUF[18]_inst_i_14_n_2 ,\sgf_result_o_OBUF[18]_inst_i_14_n_3 }),
        .CYINIT(1'b0),
        .DI({\Data_A_i[2] [2:0],\Data_A_i[5]_0 [3]}),
        .O(\sgf_result_o[47]_10 ),
        .S(\Data_A_i[2]_0 ));
  CARRY4 \sgf_result_o_OBUF[22]_inst_i_15 
       (.CI(\sgf_result_o_OBUF[18]_inst_i_14_n_0 ),
        .CO({\sgf_result_o_OBUF[22]_inst_i_15_n_0 ,\sgf_result_o_OBUF[22]_inst_i_15_n_1 ,\sgf_result_o_OBUF[22]_inst_i_15_n_2 ,\sgf_result_o_OBUF[22]_inst_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_A_i[2]_1 ,\Data_A_i[2] [3]}),
        .O(\sgf_result_o[47]_11 ),
        .S(\Data_A_i[11]_1 ));
  CARRY4 \sgf_result_o_OBUF[26]_inst_i_15 
       (.CI(\sgf_result_o_OBUF[22]_inst_i_15_n_0 ),
        .CO({\NLW_sgf_result_o_OBUF[26]_inst_i_15_CO_UNCONNECTED [3:2],\sgf_result_o_OBUF[26]_inst_i_15_n_2 ,\sgf_result_o_OBUF[26]_inst_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_sgf_result_o_OBUF[26]_inst_i_15_O_UNCONNECTED [3],\sgf_result_o[47]_12 }),
        .S({1'b0,\Data_A_i[8] }));
  CARRY4 \sgf_result_o_OBUF[8]_inst_i_1 
       (.CI(1'b0),
        .CO({\sgf_result_o_OBUF[8]_inst_i_1_n_0 ,\sgf_result_o_OBUF[8]_inst_i_1_n_1 ,\sgf_result_o_OBUF[8]_inst_i_1_n_2 ,\sgf_result_o_OBUF[8]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\Data_A_i[5] [2:0],1'b0}),
        .O(\sgf_result_o[47]_8 [3:0]),
        .S(\Data_A_i[11]_0 ));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized28
   (O,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    S,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[47]_9 ,
    \Data_A_i[6] ,
    \Data_A_i[6]_0 ,
    CO,
    \Data_B_i[6] ,
    \Data_B_i[6]_0 ,
    \Data_A_i[10] ,
    \Data_B_i[10] ,
    \Data_A_i[10]_0 ,
    \Data_B_i[6]_1 ,
    \Data_A_i[10]_1 ,
    \Data_A_i[10]_2 ,
    \Data_B_i[6]_2 ,
    \Data_A_i[10]_3 ,
    \Data_A_i[10]_4 ,
    \Data_B_i[6]_3 ,
    \Data_A_i[6]_1 ,
    \Data_B_i[10]_0 ,
    \Data_B_i[6]_4 );
  output [3:0]O;
  output [1:0]\sgf_result_o[47] ;
  output \sgf_result_o[47]_0 ;
  output \sgf_result_o[47]_1 ;
  output \sgf_result_o[47]_2 ;
  output \sgf_result_o[47]_3 ;
  output \sgf_result_o[47]_4 ;
  output \sgf_result_o[47]_5 ;
  output \sgf_result_o[47]_6 ;
  output \sgf_result_o[47]_7 ;
  output [2:0]S;
  output [3:0]\sgf_result_o[47]_8 ;
  output [0:0]\sgf_result_o[47]_9 ;
  input [3:0]\Data_A_i[6] ;
  input [1:0]\Data_A_i[6]_0 ;
  input [0:0]CO;
  input [3:0]\Data_B_i[6] ;
  input [1:0]\Data_B_i[6]_0 ;
  input \Data_A_i[10] ;
  input \Data_B_i[10] ;
  input \Data_A_i[10]_0 ;
  input \Data_B_i[6]_1 ;
  input \Data_A_i[10]_1 ;
  input \Data_A_i[10]_2 ;
  input [0:0]\Data_B_i[6]_2 ;
  input \Data_A_i[10]_3 ;
  input \Data_A_i[10]_4 ;
  input [0:0]\Data_B_i[6]_3 ;
  input [1:0]\Data_A_i[6]_1 ;
  input \Data_B_i[10]_0 ;
  input \Data_B_i[6]_4 ;

  wire [0:0]CO;
  wire \Data_A_i[10] ;
  wire \Data_A_i[10]_0 ;
  wire \Data_A_i[10]_1 ;
  wire \Data_A_i[10]_2 ;
  wire \Data_A_i[10]_3 ;
  wire \Data_A_i[10]_4 ;
  wire [3:0]\Data_A_i[6] ;
  wire [1:0]\Data_A_i[6]_0 ;
  wire [1:0]\Data_A_i[6]_1 ;
  wire \Data_B_i[10] ;
  wire \Data_B_i[10]_0 ;
  wire [3:0]\Data_B_i[6] ;
  wire [1:0]\Data_B_i[6]_0 ;
  wire \Data_B_i[6]_1 ;
  wire [0:0]\Data_B_i[6]_2 ;
  wire [0:0]\Data_B_i[6]_3 ;
  wire \Data_B_i[6]_4 ;
  wire [3:0]O;
  wire \ODD1.middle_n_10 ;
  wire \ODD1.middle_n_11 ;
  wire \ODD1.middle_n_12 ;
  wire \ODD1.middle_n_13 ;
  wire \ODD1.middle_n_14 ;
  wire \ODD1.middle_n_16 ;
  wire \ODD1.middle_n_17 ;
  wire \ODD1.middle_n_18 ;
  wire \ODD1.middle_n_19 ;
  wire \ODD1.middle_n_7 ;
  wire \ODD1.middle_n_8 ;
  wire \ODD1.middle_n_9 ;
  wire [2:0]S;
  wire sgf_result_o1__0_carry__0_n_2;
  wire sgf_result_o1__0_carry__0_n_3;
  wire sgf_result_o1__0_carry__0_n_5;
  wire sgf_result_o1__0_carry_n_0;
  wire sgf_result_o1__0_carry_n_1;
  wire sgf_result_o1__0_carry_n_2;
  wire sgf_result_o1__0_carry_n_3;
  wire [1:0]\sgf_result_o[47] ;
  wire \sgf_result_o[47]_0 ;
  wire \sgf_result_o[47]_1 ;
  wire \sgf_result_o[47]_2 ;
  wire \sgf_result_o[47]_3 ;
  wire \sgf_result_o[47]_4 ;
  wire \sgf_result_o[47]_5 ;
  wire \sgf_result_o[47]_6 ;
  wire \sgf_result_o[47]_7 ;
  wire [3:0]\^sgf_result_o[47]_8 ;
  wire [0:0]\sgf_result_o[47]_9 ;
  wire [3:2]NLW_sgf_result_o1__0_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o1__0_carry__0_O_UNCONNECTED;

  assign \sgf_result_o[47]_8 [3] = sgf_result_o1__0_carry__0_n_5;
  assign \sgf_result_o[47]_8 [2:0] = \^sgf_result_o[47]_8 [2:0];
  Recursive_KOA__parameterized31 \ODD1.middle 
       (.CO(CO),
        .DI({\ODD1.middle_n_7 ,\ODD1.middle_n_8 ,\ODD1.middle_n_9 }),
        .\Data_A_i[10] (\Data_A_i[10] ),
        .\Data_A_i[10]_0 (\Data_A_i[10]_0 ),
        .\Data_A_i[10]_1 (\Data_A_i[10]_1 ),
        .\Data_A_i[10]_2 (\Data_A_i[10]_2 ),
        .\Data_A_i[10]_3 (\Data_A_i[10]_4 ),
        .\Data_A_i[10]_4 (\Data_A_i[10]_3 ),
        .\Data_A_i[6] (\Data_A_i[6] ),
        .\Data_A_i[6]_0 (\Data_A_i[6]_0 ),
        .\Data_B_i[10] (\Data_B_i[10] ),
        .\Data_B_i[10]_0 (\Data_B_i[10]_0 ),
        .\Data_B_i[6] (\Data_B_i[6] ),
        .\Data_B_i[6]_0 (\Data_B_i[6]_0 ),
        .\Data_B_i[6]_1 (\Data_B_i[6]_1 ),
        .\Data_B_i[6]_2 (\Data_B_i[6]_2 ),
        .\Data_B_i[6]_3 (\Data_B_i[6]_4 ),
        .S({\ODD1.middle_n_10 ,\ODD1.middle_n_11 ,\ODD1.middle_n_12 }),
        .\sgf_result_o[47] (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_1 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_4 ),
        .\sgf_result_o[47]_4 (\sgf_result_o[47]_5 ),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_6 ),
        .\sgf_result_o[47]_6 ({\ODD1.middle_n_13 ,\ODD1.middle_n_14 }),
        .\sgf_result_o[47]_7 (\sgf_result_o[47]_7 ),
        .\sgf_result_o[47]_8 ({\ODD1.middle_n_16 ,\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 }));
  CARRY4 sgf_result_o1__0_carry
       (.CI(1'b0),
        .CO({sgf_result_o1__0_carry_n_0,sgf_result_o1__0_carry_n_1,sgf_result_o1__0_carry_n_2,sgf_result_o1__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\ODD1.middle_n_7 ,\ODD1.middle_n_8 ,\ODD1.middle_n_9 ,1'b1}),
        .O(O),
        .S({\ODD1.middle_n_16 ,\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 }));
  CARRY4 sgf_result_o1__0_carry__0
       (.CI(sgf_result_o1__0_carry_n_0),
        .CO({NLW_sgf_result_o1__0_carry__0_CO_UNCONNECTED[3:2],sgf_result_o1__0_carry__0_n_2,sgf_result_o1__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\ODD1.middle_n_13 ,\ODD1.middle_n_14 }),
        .O({NLW_sgf_result_o1__0_carry__0_O_UNCONNECTED[3],sgf_result_o1__0_carry__0_n_5,\sgf_result_o[47] }),
        .S({1'b0,\ODD1.middle_n_10 ,\ODD1.middle_n_11 ,\ODD1.middle_n_12 }));
  LUT3 #(
    .INIT(8'h2D)) 
    sgf_result_o1__21_carry__1_i_2
       (.I0(\Data_B_i[6]_3 ),
        .I1(\Data_A_i[6]_1 [0]),
        .I2(\Data_A_i[6]_1 [1]),
        .O(\sgf_result_o[47]_9 ));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_2
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_A_i[10]_2 ),
        .O(\^sgf_result_o[47]_8 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_3
       (.I0(\sgf_result_o[47] [0]),
        .I1(\Data_A_i[10]_4 ),
        .O(\^sgf_result_o[47]_8 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_4
       (.I0(O[3]),
        .I1(\Data_A_i[10]_3 ),
        .O(\^sgf_result_o[47]_8 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_1
       (.I0(O[2]),
        .I1(\Data_A_i[10]_0 ),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_2
       (.I0(O[1]),
        .I1(\Data_B_i[6]_1 ),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    sgf_result_o1_carry_i_3__0
       (.I0(O[0]),
        .I1(\Data_B_i[6]_4 ),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized31
   (\sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    DI,
    S,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    \Data_A_i[6] ,
    \Data_A_i[6]_0 ,
    CO,
    \Data_B_i[6] ,
    \Data_B_i[6]_0 ,
    \Data_A_i[10] ,
    \Data_B_i[10] ,
    \Data_A_i[10]_0 ,
    \Data_B_i[6]_1 ,
    \Data_A_i[10]_1 ,
    \Data_A_i[10]_2 ,
    \Data_B_i[6]_2 ,
    \Data_A_i[10]_3 ,
    \Data_B_i[10]_0 ,
    \Data_B_i[6]_3 ,
    \Data_A_i[10]_4 );
  output \sgf_result_o[47] ;
  output \sgf_result_o[47]_0 ;
  output \sgf_result_o[47]_1 ;
  output \sgf_result_o[47]_2 ;
  output \sgf_result_o[47]_3 ;
  output \sgf_result_o[47]_4 ;
  output \sgf_result_o[47]_5 ;
  output [2:0]DI;
  output [2:0]S;
  output [1:0]\sgf_result_o[47]_6 ;
  output \sgf_result_o[47]_7 ;
  output [3:0]\sgf_result_o[47]_8 ;
  input [3:0]\Data_A_i[6] ;
  input [1:0]\Data_A_i[6]_0 ;
  input [0:0]CO;
  input [3:0]\Data_B_i[6] ;
  input [1:0]\Data_B_i[6]_0 ;
  input \Data_A_i[10] ;
  input \Data_B_i[10] ;
  input \Data_A_i[10]_0 ;
  input \Data_B_i[6]_1 ;
  input \Data_A_i[10]_1 ;
  input \Data_A_i[10]_2 ;
  input [0:0]\Data_B_i[6]_2 ;
  input \Data_A_i[10]_3 ;
  input \Data_B_i[10]_0 ;
  input \Data_B_i[6]_3 ;
  input \Data_A_i[10]_4 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire \Data_A_i[10] ;
  wire \Data_A_i[10]_0 ;
  wire \Data_A_i[10]_1 ;
  wire \Data_A_i[10]_2 ;
  wire \Data_A_i[10]_3 ;
  wire \Data_A_i[10]_4 ;
  wire [3:0]\Data_A_i[6] ;
  wire [1:0]\Data_A_i[6]_0 ;
  wire \Data_B_i[10] ;
  wire \Data_B_i[10]_0 ;
  wire [3:0]\Data_B_i[6] ;
  wire [1:0]\Data_B_i[6]_0 ;
  wire \Data_B_i[6]_1 ;
  wire [0:0]\Data_B_i[6]_2 ;
  wire \Data_B_i[6]_3 ;
  wire [2:0]S;
  wire sgf_result_o0__1_carry__0_i_1__2_n_0;
  wire sgf_result_o0__1_carry__0_i_2__11_n_0;
  wire sgf_result_o0__1_carry__0_i_3_n_0;
  wire sgf_result_o0__1_carry__0_i_4__2_n_0;
  wire sgf_result_o0__1_carry__0_i_7__8_n_0;
  wire sgf_result_o0__1_carry__0_i_8__11_n_0;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_i_12__2_n_0;
  wire sgf_result_o0__1_carry_i_13__8_n_0;
  wire sgf_result_o0__1_carry_i_14__4_n_0;
  wire sgf_result_o0__1_carry_i_15__0_n_0;
  wire sgf_result_o0__1_carry_i_16__0_n_0;
  wire sgf_result_o0__1_carry_i_17__0_n_0;
  wire sgf_result_o0__1_carry_i_1__2_n_0;
  wire sgf_result_o0__1_carry_i_21__0_n_0;
  wire sgf_result_o0__1_carry_i_2__2_n_0;
  wire sgf_result_o0__1_carry_i_3__2_n_0;
  wire sgf_result_o0__1_carry_i_4__2_n_0;
  wire sgf_result_o0__1_carry_i_5__2_n_0;
  wire sgf_result_o0__1_carry_i_6__10_n_0;
  wire sgf_result_o0__1_carry_i_7__2_n_0;
  wire sgf_result_o0__1_carry_i_8__1_n_0;
  wire sgf_result_o0__1_carry_i_9_n_0;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire \sgf_result_o[47] ;
  wire \sgf_result_o[47]_0 ;
  wire \sgf_result_o[47]_1 ;
  wire \sgf_result_o[47]_2 ;
  wire \sgf_result_o[47]_3 ;
  wire \sgf_result_o[47]_4 ;
  wire \sgf_result_o[47]_5 ;
  wire [1:0]\sgf_result_o[47]_6 ;
  wire \sgf_result_o[47]_7 ;
  wire [3:0]\sgf_result_o[47]_8 ;
  wire [3:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;

  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sgf_result_o0__1_carry_i_1__2_n_0,sgf_result_o0__1_carry_i_2__2_n_0,sgf_result_o0__1_carry_i_3__2_n_0,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S({sgf_result_o0__1_carry_i_4__2_n_0,sgf_result_o0__1_carry_i_5__2_n_0,sgf_result_o0__1_carry_i_6__10_n_0,sgf_result_o0__1_carry_i_7__2_n_0}));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3:2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,sgf_result_o0__1_carry__0_i_1__2_n_0}),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b0,sgf_result_o0__1_carry__0_i_2__11_n_0,sgf_result_o0__1_carry__0_i_3_n_0,sgf_result_o0__1_carry__0_i_4__2_n_0}));
  LUT6 #(
    .INIT(64'h00651075107565C3)) 
    sgf_result_o0__1_carry__0_i_1__2
       (.I0(\sgf_result_o[47] ),
        .I1(sgf_result_o0__1_carry_i_12__2_n_0),
        .I2(\sgf_result_o[47]_0 ),
        .I3(\sgf_result_o[47]_1 ),
        .I4(\sgf_result_o[47]_2 ),
        .I5(sgf_result_o0__1_carry__0_i_7__8_n_0),
        .O(sgf_result_o0__1_carry__0_i_1__2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    sgf_result_o0__1_carry__0_i_2__11
       (.I0(sgf_result_o0__1_carry__0_i_8__11_n_0),
        .I1(\sgf_result_o[47] ),
        .I2(sgf_result_o0__1_carry_i_17__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__11_n_0));
  LUT4 #(
    .INIT(16'h0553)) 
    sgf_result_o0__1_carry__0_i_3
       (.I0(sgf_result_o0__1_carry_i_17__0_n_0),
        .I1(sgf_result_o0__1_carry_i_8__1_n_0),
        .I2(sgf_result_o0__1_carry__0_i_8__11_n_0),
        .I3(\sgf_result_o[47] ),
        .O(sgf_result_o0__1_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h040404490B4646B9)) 
    sgf_result_o0__1_carry__0_i_4__2
       (.I0(sgf_result_o0__1_carry_i_12__2_n_0),
        .I1(\sgf_result_o[47]_0 ),
        .I2(\sgf_result_o[47]_1 ),
        .I3(\sgf_result_o[47]_2 ),
        .I4(sgf_result_o0__1_carry__0_i_7__8_n_0),
        .I5(\sgf_result_o[47] ),
        .O(sgf_result_o0__1_carry__0_i_4__2_n_0));
  LUT6 #(
    .INIT(64'h077FF880F880077F)) 
    sgf_result_o0__1_carry__0_i_5
       (.I0(\Data_A_i[6] [0]),
        .I1(\Data_A_i[6]_0 [0]),
        .I2(\Data_A_i[6] [1]),
        .I3(\Data_A_i[6]_0 [1]),
        .I4(CO),
        .I5(\Data_A_i[6] [2]),
        .O(\sgf_result_o[47]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry__0_i_6__10
       (.I0(\Data_A_i[6]_0 [0]),
        .I1(\Data_A_i[6] [0]),
        .I2(\Data_A_i[6]_0 [1]),
        .I3(\Data_A_i[6] [1]),
        .O(\sgf_result_o[47]_2 ));
  LUT6 #(
    .INIT(64'h0909099F099F9F9F)) 
    sgf_result_o0__1_carry__0_i_7__8
       (.I0(\Data_A_i[6] [0]),
        .I1(\Data_A_i[6]_0 [0]),
        .I2(\Data_A_i[6] [3]),
        .I3(\Data_A_i[6] [2]),
        .I4(\sgf_result_o[47]_5 ),
        .I5(CO),
        .O(sgf_result_o0__1_carry__0_i_7__8_n_0));
  LUT6 #(
    .INIT(64'h7FF7F11FF11FF77F)) 
    sgf_result_o0__1_carry__0_i_8__11
       (.I0(sgf_result_o0__1_carry_i_21__0_n_0),
        .I1(\Data_B_i[6] [3]),
        .I2(\Data_B_i[6] [1]),
        .I3(\Data_B_i[6]_0 [1]),
        .I4(\Data_B_i[6] [0]),
        .I5(\Data_B_i[6]_0 [0]),
        .O(sgf_result_o0__1_carry__0_i_8__11_n_0));
  LUT6 #(
    .INIT(64'h077FF880F880077F)) 
    sgf_result_o0__1_carry_i_10__0
       (.I0(\Data_B_i[6] [0]),
        .I1(\Data_B_i[6]_0 [0]),
        .I2(\Data_B_i[6] [1]),
        .I3(\Data_B_i[6]_0 [1]),
        .I4(\Data_B_i[6]_2 ),
        .I5(\Data_B_i[6] [2]),
        .O(\sgf_result_o[47] ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    sgf_result_o0__1_carry_i_11__2
       (.I0(\Data_B_i[6]_0 [0]),
        .I1(\Data_B_i[6] [0]),
        .I2(\Data_B_i[6]_0 [1]),
        .I3(\Data_B_i[6] [1]),
        .O(\sgf_result_o[47]_0 ));
  LUT6 #(
    .INIT(64'h0909099F099F9F9F)) 
    sgf_result_o0__1_carry_i_12__2
       (.I0(\Data_B_i[6] [0]),
        .I1(\Data_B_i[6]_0 [0]),
        .I2(\Data_B_i[6] [3]),
        .I3(\Data_B_i[6] [2]),
        .I4(\sgf_result_o[47]_7 ),
        .I5(\Data_B_i[6]_2 ),
        .O(sgf_result_o0__1_carry_i_12__2_n_0));
  LUT6 #(
    .INIT(64'hE81717E817E8E817)) 
    sgf_result_o0__1_carry_i_13__8
       (.I0(CO),
        .I1(\sgf_result_o[47]_5 ),
        .I2(\Data_A_i[6] [2]),
        .I3(\Data_A_i[6] [3]),
        .I4(\Data_A_i[6]_0 [0]),
        .I5(\Data_A_i[6] [0]),
        .O(sgf_result_o0__1_carry_i_13__8_n_0));
  LUT6 #(
    .INIT(64'hE81717E817E8E817)) 
    sgf_result_o0__1_carry_i_14__4
       (.I0(\Data_B_i[6]_2 ),
        .I1(\sgf_result_o[47]_7 ),
        .I2(\Data_B_i[6] [2]),
        .I3(\Data_B_i[6] [3]),
        .I4(\Data_B_i[6]_0 [0]),
        .I5(\Data_B_i[6] [0]),
        .O(sgf_result_o0__1_carry_i_14__4_n_0));
  LUT3 #(
    .INIT(8'h28)) 
    sgf_result_o0__1_carry_i_15__0
       (.I0(sgf_result_o0__1_carry_i_9_n_0),
        .I1(\sgf_result_o[47] ),
        .I2(sgf_result_o0__1_carry__0_i_8__11_n_0),
        .O(sgf_result_o0__1_carry_i_15__0_n_0));
  LUT6 #(
    .INIT(64'h9666666966696999)) 
    sgf_result_o0__1_carry_i_16__0
       (.I0(\Data_B_i[6] [1]),
        .I1(\Data_B_i[6]_0 [1]),
        .I2(sgf_result_o0__1_carry_i_21__0_n_0),
        .I3(\Data_B_i[6] [3]),
        .I4(\Data_B_i[6]_0 [0]),
        .I5(\Data_B_i[6] [0]),
        .O(sgf_result_o0__1_carry_i_16__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF1FF7F77F)) 
    sgf_result_o0__1_carry_i_17__0
       (.I0(\sgf_result_o[47]_4 ),
        .I1(\Data_A_i[6] [3]),
        .I2(\Data_A_i[6] [2]),
        .I3(\sgf_result_o[47]_5 ),
        .I4(CO),
        .I5(\sgf_result_o[47]_2 ),
        .O(sgf_result_o0__1_carry_i_17__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    sgf_result_o0__1_carry_i_18__1
       (.I0(\Data_A_i[6]_0 [1]),
        .I1(\Data_A_i[6] [1]),
        .I2(\Data_A_i[6]_0 [0]),
        .I3(\Data_A_i[6] [0]),
        .O(\sgf_result_o[47]_5 ));
  LUT6 #(
    .INIT(64'hFEEAEAEAA8808080)) 
    sgf_result_o0__1_carry_i_19__1
       (.I0(CO),
        .I1(\Data_A_i[6]_0 [1]),
        .I2(\Data_A_i[6] [1]),
        .I3(\Data_A_i[6]_0 [0]),
        .I4(\Data_A_i[6] [0]),
        .I5(\Data_A_i[6] [2]),
        .O(\sgf_result_o[47]_3 ));
  LUT6 #(
    .INIT(64'h590CC059590CCF59)) 
    sgf_result_o0__1_carry_i_1__2
       (.I0(sgf_result_o0__1_carry_i_8__1_n_0),
        .I1(sgf_result_o0__1_carry_i_9_n_0),
        .I2(\sgf_result_o[47] ),
        .I3(\sgf_result_o[47]_0 ),
        .I4(sgf_result_o0__1_carry_i_12__2_n_0),
        .I5(sgf_result_o0__1_carry_i_13__8_n_0),
        .O(sgf_result_o0__1_carry_i_1__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    sgf_result_o0__1_carry_i_20__0
       (.I0(\Data_B_i[6]_0 [1]),
        .I1(\Data_B_i[6] [1]),
        .I2(\Data_B_i[6]_0 [0]),
        .I3(\Data_B_i[6] [0]),
        .O(\sgf_result_o[47]_7 ));
  LUT6 #(
    .INIT(64'hFEEAEAEAA8808080)) 
    sgf_result_o0__1_carry_i_21__0
       (.I0(\Data_B_i[6]_2 ),
        .I1(\Data_B_i[6]_0 [1]),
        .I2(\Data_B_i[6] [1]),
        .I3(\Data_B_i[6]_0 [0]),
        .I4(\Data_B_i[6] [0]),
        .I5(\Data_B_i[6] [2]),
        .O(sgf_result_o0__1_carry_i_21__0_n_0));
  LUT5 #(
    .INIT(32'hA30A9039)) 
    sgf_result_o0__1_carry_i_2__2
       (.I0(sgf_result_o0__1_carry_i_9_n_0),
        .I1(sgf_result_o0__1_carry_i_13__8_n_0),
        .I2(sgf_result_o0__1_carry_i_12__2_n_0),
        .I3(\sgf_result_o[47]_0 ),
        .I4(\sgf_result_o[47] ),
        .O(sgf_result_o0__1_carry_i_2__2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    sgf_result_o0__1_carry_i_3__2
       (.I0(sgf_result_o0__1_carry_i_9_n_0),
        .I1(sgf_result_o0__1_carry_i_14__4_n_0),
        .O(sgf_result_o0__1_carry_i_3__2_n_0));
  LUT6 #(
    .INIT(64'hAAA6AAA6AAA65555)) 
    sgf_result_o0__1_carry_i_4__2
       (.I0(sgf_result_o0__1_carry_i_1__2_n_0),
        .I1(sgf_result_o0__1_carry_i_15__0_n_0),
        .I2(sgf_result_o0__1_carry_i_13__8_n_0),
        .I3(sgf_result_o0__1_carry_i_16__0_n_0),
        .I4(sgf_result_o0__1_carry_i_17__0_n_0),
        .I5(sgf_result_o0__1_carry_i_14__4_n_0),
        .O(sgf_result_o0__1_carry_i_4__2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    sgf_result_o0__1_carry_i_5__2
       (.I0(sgf_result_o0__1_carry_i_2__2_n_0),
        .I1(sgf_result_o0__1_carry_i_14__4_n_0),
        .I2(sgf_result_o0__1_carry_i_8__1_n_0),
        .O(sgf_result_o0__1_carry_i_5__2_n_0));
  LUT4 #(
    .INIT(16'h444B)) 
    sgf_result_o0__1_carry_i_6__10
       (.I0(sgf_result_o0__1_carry_i_14__4_n_0),
        .I1(sgf_result_o0__1_carry_i_9_n_0),
        .I2(sgf_result_o0__1_carry_i_13__8_n_0),
        .I3(sgf_result_o0__1_carry_i_16__0_n_0),
        .O(sgf_result_o0__1_carry_i_6__10_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry_i_7__2
       (.I0(sgf_result_o0__1_carry_i_13__8_n_0),
        .I1(sgf_result_o0__1_carry_i_14__4_n_0),
        .O(sgf_result_o0__1_carry_i_7__2_n_0));
  LUT6 #(
    .INIT(64'h0EF1F108F10808F7)) 
    sgf_result_o0__1_carry_i_8__1
       (.I0(\sgf_result_o[47]_4 ),
        .I1(\Data_A_i[6] [3]),
        .I2(\sgf_result_o[47]_2 ),
        .I3(\Data_A_i[6] [2]),
        .I4(CO),
        .I5(\sgf_result_o[47]_5 ),
        .O(sgf_result_o0__1_carry_i_8__1_n_0));
  LUT6 #(
    .INIT(64'h6999999699969666)) 
    sgf_result_o0__1_carry_i_9
       (.I0(\Data_A_i[6] [1]),
        .I1(\Data_A_i[6]_0 [1]),
        .I2(\sgf_result_o[47]_3 ),
        .I3(\Data_A_i[6] [3]),
        .I4(\Data_A_i[6]_0 [0]),
        .I5(\Data_A_i[6] [0]),
        .O(sgf_result_o0__1_carry_i_9_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    sgf_result_o1__0_carry__0_i_1
       (.I0(sgf_result_o0__1_carry__0_n_7),
        .I1(\Data_B_i[6]_1 ),
        .O(\sgf_result_o[47]_6 [1]));
  (* HLUTNM = "lutpair7" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sgf_result_o1__0_carry__0_i_2
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_B_i[6]_3 ),
        .O(\sgf_result_o[47]_6 [0]));
  LUT3 #(
    .INIT(8'h59)) 
    sgf_result_o1__0_carry__0_i_3
       (.I0(sgf_result_o0__1_carry__0_n_5),
        .I1(\Data_A_i[10]_0 ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .O(S[2]));
  LUT4 #(
    .INIT(16'hD22D)) 
    sgf_result_o1__0_carry__0_i_4
       (.I0(\Data_B_i[6]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[10]_0 ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h96)) 
    sgf_result_o1__0_carry__0_i_5
       (.I0(\sgf_result_o[47]_6 [0]),
        .I1(\Data_B_i[6]_1 ),
        .I2(sgf_result_o0__1_carry__0_n_7),
        .O(S[0]));
  LUT3 #(
    .INIT(8'h71)) 
    sgf_result_o1__0_carry_i_1
       (.I0(\Data_A_i[10]_1 ),
        .I1(\Data_A_i[10]_2 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .O(DI[2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_12
       (.I0(\Data_A_i[6] [0]),
        .I1(\Data_A_i[6]_0 [0]),
        .O(\sgf_result_o[47]_4 ));
  (* HLUTNM = "lutpair6" *) 
  LUT3 #(
    .INIT(8'h71)) 
    sgf_result_o1__0_carry_i_2
       (.I0(\Data_A_i[10]_3 ),
        .I1(\Data_B_i[10]_0 ),
        .I2(sgf_result_o0__1_carry_n_6),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'hA22AFBBFFBBFFBBF)) 
    sgf_result_o1__0_carry_i_3
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\sgf_result_o[47]_4 ),
        .I2(\Data_B_i[6] [0]),
        .I3(\Data_B_i[6]_0 [0]),
        .I4(\Data_A_i[10] ),
        .I5(\Data_B_i[10] ),
        .O(DI[0]));
  (* HLUTNM = "lutpair7" *) 
  LUT5 #(
    .INIT(32'h99696966)) 
    sgf_result_o1__0_carry_i_4
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_B_i[6]_3 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .I3(\Data_A_i[10]_2 ),
        .I4(\Data_A_i[10]_1 ),
        .O(\sgf_result_o[47]_8 [3]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__0_carry_i_5
       (.I0(DI[1]),
        .I1(\Data_A_i[10]_1 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .I3(\Data_A_i[10]_2 ),
        .O(\sgf_result_o[47]_8 [2]));
  (* HLUTNM = "lutpair6" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__0_carry_i_6
       (.I0(\Data_A_i[10]_3 ),
        .I1(\Data_B_i[10]_0 ),
        .I2(sgf_result_o0__1_carry_n_6),
        .I3(DI[0]),
        .O(\sgf_result_o[47]_8 [1]));
  LUT6 #(
    .INIT(64'h9999966996699999)) 
    sgf_result_o1__0_carry_i_7
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\Data_A_i[10]_4 ),
        .I2(\Data_B_i[6]_0 [0]),
        .I3(\Data_B_i[6] [0]),
        .I4(\Data_A_i[6]_0 [0]),
        .I5(\Data_A_i[6] [0]),
        .O(\sgf_result_o[47]_8 [0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized32
   (O,
    \sgf_result_o[15] ,
    \sgf_result_o[47] ,
    \sgf_result_o[15]_0 ,
    CO,
    \sgf_result_o[15]_1 ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[12] ,
    sgf_result_o_OBUF,
    \Data_A_i[17] ,
    \Data_A_i[23] ,
    S,
    \Data_A_i[12] ,
    \Data_A_i[12]_0 ,
    DI,
    \Data_B_i[17] ,
    \Data_A_i[14] ,
    \Data_A_i[14]_0 ,
    \Data_A_i[13] ,
    \Data_A_i[13]_0 ,
    \Data_A_i[13]_1 ,
    \Data_A_i[13]_2 ,
    \Data_A_i[13]_3 ,
    \Data_A_i[13]_4 ,
    \Data_A_i[14]_1 ,
    \Data_A_i[11] ,
    \Data_A_i[14]_2 ,
    \Data_A_i[14]_3 ,
    \Data_A_i[14]_4 ,
    \Data_A_i[14]_5 ,
    \Data_A_i[11]_0 ,
    \Data_A_i[2] ,
    \Data_A_i[2]_0 ,
    \Data_A_i[2]_1 ,
    \Data_A_i[23]_0 ,
    \Data_A_i[14]_6 );
  output [0:0]O;
  output [3:0]\sgf_result_o[15] ;
  output [0:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[15]_0 ;
  output [0:0]CO;
  output [0:0]\sgf_result_o[15]_1 ;
  output [1:0]\sgf_result_o[47]_0 ;
  output [18:0]\sgf_result_o[47]_1 ;
  output [0:0]\sgf_result_o[47]_2 ;
  output [36:0]\sgf_result_o[47]_3 ;
  input [23:0]Data_B_i_IBUF;
  input [23:0]Data_A_i_IBUF;
  input \Data_B_i[12] ;
  input [5:0]sgf_result_o_OBUF;
  input [2:0]\Data_A_i[17] ;
  input [3:0]\Data_A_i[23] ;
  input [0:0]S;
  input [0:0]\Data_A_i[12] ;
  input [2:0]\Data_A_i[12]_0 ;
  input [0:0]DI;
  input [0:0]\Data_B_i[17] ;
  input [3:0]\Data_A_i[14] ;
  input [3:0]\Data_A_i[14]_0 ;
  input [3:0]\Data_A_i[13] ;
  input [3:0]\Data_A_i[13]_0 ;
  input [3:0]\Data_A_i[13]_1 ;
  input [3:0]\Data_A_i[13]_2 ;
  input [3:0]\Data_A_i[13]_3 ;
  input [3:0]\Data_A_i[13]_4 ;
  input [0:0]\Data_A_i[14]_1 ;
  input [0:0]\Data_A_i[11] ;
  input [0:0]\Data_A_i[14]_2 ;
  input [3:0]\Data_A_i[14]_3 ;
  input [3:0]\Data_A_i[14]_4 ;
  input [0:0]\Data_A_i[14]_5 ;
  input [0:0]\Data_A_i[11]_0 ;
  input [3:0]\Data_A_i[2] ;
  input [3:0]\Data_A_i[2]_0 ;
  input [2:0]\Data_A_i[2]_1 ;
  input [3:0]\Data_A_i[23]_0 ;
  input [0:0]\Data_A_i[14]_6 ;

  wire [0:0]CO;
  wire [0:0]DI;
  wire [0:0]\Data_A_i[11] ;
  wire [0:0]\Data_A_i[11]_0 ;
  wire [0:0]\Data_A_i[12] ;
  wire [2:0]\Data_A_i[12]_0 ;
  wire [3:0]\Data_A_i[13] ;
  wire [3:0]\Data_A_i[13]_0 ;
  wire [3:0]\Data_A_i[13]_1 ;
  wire [3:0]\Data_A_i[13]_2 ;
  wire [3:0]\Data_A_i[13]_3 ;
  wire [3:0]\Data_A_i[13]_4 ;
  wire [3:0]\Data_A_i[14] ;
  wire [3:0]\Data_A_i[14]_0 ;
  wire [0:0]\Data_A_i[14]_1 ;
  wire [0:0]\Data_A_i[14]_2 ;
  wire [3:0]\Data_A_i[14]_3 ;
  wire [3:0]\Data_A_i[14]_4 ;
  wire [0:0]\Data_A_i[14]_5 ;
  wire [0:0]\Data_A_i[14]_6 ;
  wire [2:0]\Data_A_i[17] ;
  wire [3:0]\Data_A_i[23] ;
  wire [3:0]\Data_A_i[23]_0 ;
  wire [3:0]\Data_A_i[2] ;
  wire [3:0]\Data_A_i[2]_0 ;
  wire [2:0]\Data_A_i[2]_1 ;
  wire [23:0]Data_A_i_IBUF;
  wire \Data_B_i[12] ;
  wire [0:0]\Data_B_i[17] ;
  wire [23:0]Data_B_i_IBUF;
  wire [0:0]O;
  wire \ODD1.left_high_n_1 ;
  wire \ODD1.left_high_n_10 ;
  wire \ODD1.left_high_n_11 ;
  wire \ODD1.left_high_n_16 ;
  wire \ODD1.left_high_n_17 ;
  wire \ODD1.left_high_n_18 ;
  wire \ODD1.left_high_n_19 ;
  wire \ODD1.left_high_n_2 ;
  wire \ODD1.left_high_n_20 ;
  wire \ODD1.left_high_n_21 ;
  wire \ODD1.left_high_n_22 ;
  wire \ODD1.left_high_n_23 ;
  wire \ODD1.left_high_n_24 ;
  wire \ODD1.left_high_n_25 ;
  wire \ODD1.left_high_n_26 ;
  wire \ODD1.left_high_n_27 ;
  wire \ODD1.left_high_n_28 ;
  wire \ODD1.left_high_n_29 ;
  wire \ODD1.left_high_n_3 ;
  wire \ODD1.left_high_n_30 ;
  wire \ODD1.left_high_n_32 ;
  wire \ODD1.left_high_n_33 ;
  wire \ODD1.left_high_n_34 ;
  wire \ODD1.left_high_n_9 ;
  wire \ODD1.middle_n_0 ;
  wire \ODD1.middle_n_1 ;
  wire \ODD1.middle_n_10 ;
  wire \ODD1.middle_n_11 ;
  wire \ODD1.middle_n_12 ;
  wire \ODD1.middle_n_13 ;
  wire \ODD1.middle_n_14 ;
  wire \ODD1.middle_n_15 ;
  wire \ODD1.middle_n_16 ;
  wire \ODD1.middle_n_17 ;
  wire \ODD1.middle_n_18 ;
  wire \ODD1.middle_n_19 ;
  wire \ODD1.middle_n_2 ;
  wire \ODD1.middle_n_20 ;
  wire \ODD1.middle_n_21 ;
  wire \ODD1.middle_n_22 ;
  wire \ODD1.middle_n_23 ;
  wire \ODD1.middle_n_24 ;
  wire \ODD1.middle_n_25 ;
  wire \ODD1.middle_n_26 ;
  wire \ODD1.middle_n_27 ;
  wire \ODD1.middle_n_28 ;
  wire \ODD1.middle_n_29 ;
  wire \ODD1.middle_n_3 ;
  wire \ODD1.middle_n_30 ;
  wire \ODD1.middle_n_31 ;
  wire \ODD1.middle_n_32 ;
  wire \ODD1.middle_n_33 ;
  wire \ODD1.middle_n_34 ;
  wire \ODD1.middle_n_35 ;
  wire \ODD1.middle_n_36 ;
  wire \ODD1.middle_n_37 ;
  wire \ODD1.middle_n_38 ;
  wire \ODD1.middle_n_39 ;
  wire \ODD1.middle_n_4 ;
  wire \ODD1.middle_n_40 ;
  wire \ODD1.middle_n_41 ;
  wire \ODD1.middle_n_42 ;
  wire \ODD1.middle_n_43 ;
  wire \ODD1.middle_n_44 ;
  wire \ODD1.middle_n_5 ;
  wire \ODD1.middle_n_6 ;
  wire \ODD1.middle_n_7 ;
  wire \ODD1.middle_n_8 ;
  wire \ODD1.middle_n_9 ;
  wire \ODD1.right_lower_n_0 ;
  wire \ODD1.right_lower_n_1 ;
  wire \ODD1.right_lower_n_10 ;
  wire \ODD1.right_lower_n_11 ;
  wire \ODD1.right_lower_n_12 ;
  wire \ODD1.right_lower_n_13 ;
  wire \ODD1.right_lower_n_14 ;
  wire \ODD1.right_lower_n_15 ;
  wire \ODD1.right_lower_n_16 ;
  wire \ODD1.right_lower_n_17 ;
  wire \ODD1.right_lower_n_18 ;
  wire \ODD1.right_lower_n_19 ;
  wire \ODD1.right_lower_n_2 ;
  wire \ODD1.right_lower_n_20 ;
  wire \ODD1.right_lower_n_21 ;
  wire \ODD1.right_lower_n_22 ;
  wire \ODD1.right_lower_n_23 ;
  wire \ODD1.right_lower_n_24 ;
  wire \ODD1.right_lower_n_3 ;
  wire \ODD1.right_lower_n_4 ;
  wire \ODD1.right_lower_n_5 ;
  wire \ODD1.right_lower_n_6 ;
  wire \ODD1.right_lower_n_7 ;
  wire \ODD1.right_lower_n_8 ;
  wire \ODD1.right_lower_n_9 ;
  wire [15:3]Q_middle_temp__5;
  wire [0:0]S;
  wire sgf_result_o0__1_carry__0_i_1__10_n_0;
  wire sgf_result_o0__1_carry__0_i_1__11_n_0;
  wire sgf_result_o0__1_carry__0_i_2__8_n_0;
  wire sgf_result_o0__1_carry__0_i_2__9_n_0;
  wire sgf_result_o0__1_carry__0_i_3__10_n_0;
  wire sgf_result_o0__1_carry__0_i_3__9_n_0;
  wire sgf_result_o0__1_carry__0_i_4__10_n_0;
  wire sgf_result_o0__1_carry__0_i_4__11_n_0;
  wire sgf_result_o0__1_carry__0_i_5__10_n_0;
  wire sgf_result_o0__1_carry__0_i_5__11_n_0;
  wire sgf_result_o0__1_carry__0_i_6__8_n_0;
  wire sgf_result_o0__1_carry__0_i_6__9_n_0;
  wire sgf_result_o0__1_carry__0_i_7__5_n_0;
  wire sgf_result_o0__1_carry__0_i_7__6_n_0;
  wire sgf_result_o0__1_carry__0_i_8__10_n_0;
  wire sgf_result_o0__1_carry__0_i_8__9_n_0;
  wire sgf_result_o0__1_carry__0_i_9__4_n_0;
  wire sgf_result_o0__1_carry__0_i_9__5_n_0;
  wire sgf_result_o0__1_carry_i_10__3_n_0;
  wire sgf_result_o0__1_carry_i_10__4_n_0;
  wire sgf_result_o0__1_carry_i_11__10_n_0;
  wire sgf_result_o0__1_carry_i_11__9_n_0;
  wire sgf_result_o0__1_carry_i_12_n_0;
  wire sgf_result_o0__1_carry_i_13__0_n_0;
  wire sgf_result_o0__1_carry_i_13_n_0;
  wire sgf_result_o0__1_carry_i_14__0__0_n_0;
  wire sgf_result_o0__1_carry_i_14_n_0;
  wire sgf_result_o0__1_carry_i_15_n_0;
  wire sgf_result_o0__1_carry_i_16__0_n_0;
  wire sgf_result_o0__1_carry_i_16_n_0;
  wire sgf_result_o0__1_carry_i_17__0_n_0;
  wire sgf_result_o0__1_carry_i_17_n_0;
  wire sgf_result_o0__1_carry_i_18_n_0;
  wire sgf_result_o0__1_carry_i_19_n_0;
  wire sgf_result_o0__1_carry_i_1__10_n_0;
  wire sgf_result_o0__1_carry_i_1__11_n_0;
  wire sgf_result_o0__1_carry_i_2__10_n_0;
  wire sgf_result_o0__1_carry_i_2__11_n_0;
  wire sgf_result_o0__1_carry_i_3__10_n_0;
  wire sgf_result_o0__1_carry_i_3__11_n_0;
  wire sgf_result_o0__1_carry_i_4__10_n_0;
  wire sgf_result_o0__1_carry_i_4__11_n_0;
  wire sgf_result_o0__1_carry_i_5__10_n_0;
  wire sgf_result_o0__1_carry_i_5__11_n_0;
  wire sgf_result_o0__1_carry_i_6__7_n_0;
  wire sgf_result_o0__1_carry_i_6__8_n_0;
  wire sgf_result_o0__1_carry_i_7__10_n_0;
  wire sgf_result_o0__1_carry_i_7__11_n_0;
  wire [15:0]sgf_result_o1;
  wire sgf_result_o1__35_carry__0_n_0;
  wire sgf_result_o1__35_carry__0_n_1;
  wire sgf_result_o1__35_carry__0_n_2;
  wire sgf_result_o1__35_carry__0_n_3;
  wire sgf_result_o1__35_carry__1_n_0;
  wire sgf_result_o1__35_carry__1_n_1;
  wire sgf_result_o1__35_carry__1_n_2;
  wire sgf_result_o1__35_carry__1_n_3;
  wire sgf_result_o1__35_carry__2_n_1;
  wire sgf_result_o1__35_carry__2_n_2;
  wire sgf_result_o1__35_carry__2_n_3;
  wire sgf_result_o1__35_carry_i_3_n_0;
  wire sgf_result_o1__35_carry_n_0;
  wire sgf_result_o1__35_carry_n_1;
  wire sgf_result_o1__35_carry_n_2;
  wire sgf_result_o1__35_carry_n_3;
  wire sgf_result_o1_carry__0_n_0;
  wire sgf_result_o1_carry__0_n_1;
  wire sgf_result_o1_carry__0_n_2;
  wire sgf_result_o1_carry__0_n_3;
  wire sgf_result_o1_carry__1_n_0;
  wire sgf_result_o1_carry__1_n_1;
  wire sgf_result_o1_carry__1_n_2;
  wire sgf_result_o1_carry__1_n_3;
  wire sgf_result_o1_carry_n_0;
  wire sgf_result_o1_carry_n_1;
  wire sgf_result_o1_carry_n_2;
  wire sgf_result_o1_carry_n_3;
  wire [3:0]\sgf_result_o[15] ;
  wire [3:0]\sgf_result_o[15]_0 ;
  wire [0:0]\sgf_result_o[15]_1 ;
  wire [0:0]\sgf_result_o[47] ;
  wire [1:0]\sgf_result_o[47]_0 ;
  wire [18:0]\sgf_result_o[47]_1 ;
  wire [0:0]\sgf_result_o[47]_2 ;
  wire [36:0]\sgf_result_o[47]_3 ;
  wire [5:0]sgf_result_o_OBUF;
  wire \sgf_result_o_OBUF[34]_inst_i_21_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_22_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_23_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_24_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_24_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_29_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_30_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_31_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_32_n_0 ;
  wire [3:1]NLW_sgf_result_o0__1_carry_i_17__4_CO_UNCONNECTED;
  wire [3:0]NLW_sgf_result_o0__1_carry_i_17__4_O_UNCONNECTED;
  wire [3:1]NLW_sgf_result_o0__1_carry_i_22__1_CO_UNCONNECTED;
  wire [3:0]NLW_sgf_result_o0__1_carry_i_22__1_O_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o1__35_carry__2_CO_UNCONNECTED;
  wire [3:0]NLW_sgf_result_o1_carry__2_CO_UNCONNECTED;
  wire [3:1]NLW_sgf_result_o1_carry__2_O_UNCONNECTED;

  Recursive_KOA__parameterized33 \ODD1.left_high 
       (.CO(CO),
        .\Data_A_i[12] (\Data_A_i[12] ),
        .Data_A_i_IBUF(Data_A_i_IBUF),
        .\Data_B_i[12] (\sgf_result_o[15]_1 ),
        .Data_B_i_IBUF(Data_B_i_IBUF),
        .O({O,\ODD1.left_high_n_1 ,\ODD1.left_high_n_2 ,\ODD1.left_high_n_3 }),
        .S(S),
        .\sgf_result_o[15] (\sgf_result_o[15] ),
        .\sgf_result_o[15]_0 (\sgf_result_o[15]_0 ),
        .\sgf_result_o[15]_1 (\ODD1.left_high_n_21 ),
        .\sgf_result_o[15]_2 (\ODD1.left_high_n_26 ),
        .\sgf_result_o[47] ({\sgf_result_o[47] ,\ODD1.left_high_n_9 ,\ODD1.left_high_n_10 ,\ODD1.left_high_n_11 }),
        .\sgf_result_o[47]_0 (\ODD1.left_high_n_16 ),
        .\sgf_result_o[47]_1 ({\ODD1.left_high_n_17 ,\ODD1.left_high_n_18 ,\ODD1.left_high_n_19 ,\ODD1.left_high_n_20 }),
        .\sgf_result_o[47]_2 ({\ODD1.left_high_n_22 ,\ODD1.left_high_n_23 ,\ODD1.left_high_n_24 ,\ODD1.left_high_n_25 }),
        .\sgf_result_o[47]_3 ({\ODD1.left_high_n_27 ,\ODD1.left_high_n_28 ,\ODD1.left_high_n_29 ,\ODD1.left_high_n_30 }),
        .\sgf_result_o[47]_4 ({\sgf_result_o[47]_2 ,\ODD1.left_high_n_32 ,\ODD1.left_high_n_33 ,\ODD1.left_high_n_34 }),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_0 ));
  Recursive_KOA__parameterized44 \ODD1.middle 
       (.CO(\ODD1.middle_n_0 ),
        .DI({sgf_result_o0__1_carry_i_1__10_n_0,sgf_result_o0__1_carry_i_2__10_n_0,sgf_result_o0__1_carry_i_3__10_n_0}),
        .\Data_A_i[12] ({\ODD1.right_lower_n_0 ,\ODD1.right_lower_n_1 ,\ODD1.right_lower_n_2 }),
        .\Data_A_i[12]_0 ({O,\ODD1.left_high_n_1 ,\ODD1.left_high_n_2 ,\ODD1.left_high_n_3 }),
        .\Data_A_i[12]_1 (\sgf_result_o[15] [0]),
        .\Data_A_i[12]_2 ({\ODD1.left_high_n_22 ,\ODD1.left_high_n_23 ,\ODD1.left_high_n_24 ,\ODD1.left_high_n_25 }),
        .\Data_A_i[16] ({sgf_result_o0__1_carry__0_i_4__10_n_0,sgf_result_o0__1_carry__0_i_5__10_n_0,sgf_result_o0__1_carry__0_i_6__8_n_0}),
        .\Data_A_i[16]_0 ({sgf_result_o0__1_carry_i_16_n_0,sgf_result_o0__1_carry_i_17_n_0,sgf_result_o0__1_carry_i_18_n_0,sgf_result_o0__1_carry_i_19_n_0}),
        .\Data_A_i[20] ({sgf_result_o0__1_carry_i_1__11_n_0,sgf_result_o0__1_carry_i_2__11_n_0,sgf_result_o0__1_carry_i_3__11_n_0}),
        .\Data_A_i[20]_0 ({sgf_result_o0__1_carry_i_4__11_n_0,sgf_result_o0__1_carry_i_5__11_n_0,sgf_result_o0__1_carry_i_6__8_n_0,sgf_result_o0__1_carry_i_7__11_n_0}),
        .\Data_A_i[20]_1 ({sgf_result_o0__1_carry__0_i_4__11_n_0,sgf_result_o0__1_carry__0_i_5__11_n_0,sgf_result_o0__1_carry__0_i_6__9_n_0}),
        .\Data_A_i[20]_2 ({sgf_result_o0__1_carry_i_16__0_n_0,sgf_result_o0__1_carry_i_17__0_n_0}),
        .\Data_B_i[12] (\sgf_result_o[15]_0 [0]),
        .\Data_B_i[12]_0 ({\sgf_result_o[47] ,\ODD1.left_high_n_9 ,\ODD1.left_high_n_10 ,\ODD1.left_high_n_11 }),
        .\Data_B_i[12]_1 (\ODD1.left_high_n_16 ),
        .\Data_B_i[12]_2 (\ODD1.left_high_n_30 ),
        .\Data_B_i[12]_3 ({\ODD1.left_high_n_17 ,\ODD1.left_high_n_18 ,\ODD1.left_high_n_19 ,\ODD1.left_high_n_20 }),
        .\Data_B_i[16] ({sgf_result_o0__1_carry__0_i_1__10_n_0,sgf_result_o0__1_carry__0_i_2__8_n_0,sgf_result_o0__1_carry__0_i_3__9_n_0}),
        .\Data_B_i[16]_0 ({sgf_result_o0__1_carry_i_12_n_0,sgf_result_o0__1_carry_i_13_n_0,sgf_result_o0__1_carry_i_14_n_0,sgf_result_o0__1_carry_i_15_n_0}),
        .\Data_B_i[20] ({sgf_result_o0__1_carry__0_i_1__11_n_0,sgf_result_o0__1_carry__0_i_2__9_n_0,sgf_result_o0__1_carry__0_i_3__10_n_0}),
        .\Data_B_i[20]_0 ({sgf_result_o0__1_carry_i_13__0_n_0,sgf_result_o0__1_carry_i_14__0__0_n_0}),
        .O({\ODD1.middle_n_1 ,\ODD1.middle_n_2 ,\ODD1.middle_n_3 ,\ODD1.middle_n_4 }),
        .S({sgf_result_o0__1_carry_i_4__10_n_0,sgf_result_o0__1_carry_i_5__10_n_0,sgf_result_o0__1_carry_i_6__7_n_0,sgf_result_o0__1_carry_i_7__10_n_0}),
        .\sgf_result_o[15] (\ODD1.middle_n_21 ),
        .\sgf_result_o[15]_0 (\ODD1.middle_n_29 ),
        .\sgf_result_o[47] ({\ODD1.middle_n_5 ,\ODD1.middle_n_6 ,\ODD1.middle_n_7 ,\ODD1.middle_n_8 }),
        .\sgf_result_o[47]_0 ({\ODD1.middle_n_9 ,\ODD1.middle_n_10 }),
        .\sgf_result_o[47]_1 ({\ODD1.middle_n_11 ,\ODD1.middle_n_12 ,\ODD1.middle_n_13 }),
        .\sgf_result_o[47]_2 ({\ODD1.middle_n_14 ,\ODD1.middle_n_15 ,\ODD1.middle_n_16 ,\ODD1.middle_n_17 }),
        .\sgf_result_o[47]_3 ({\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 }),
        .\sgf_result_o[47]_4 ({\ODD1.middle_n_22 ,\ODD1.middle_n_23 ,\ODD1.middle_n_24 ,\ODD1.middle_n_25 }),
        .\sgf_result_o[47]_5 ({\ODD1.middle_n_26 ,\ODD1.middle_n_27 ,\ODD1.middle_n_28 }),
        .\sgf_result_o[47]_6 ({\ODD1.middle_n_30 ,\ODD1.middle_n_31 ,\ODD1.middle_n_32 ,\ODD1.middle_n_33 }),
        .\sgf_result_o[47]_7 ({\ODD1.middle_n_34 ,\ODD1.middle_n_35 ,\ODD1.middle_n_36 ,\ODD1.middle_n_37 }),
        .\sgf_result_o[47]_8 ({\ODD1.middle_n_38 ,\ODD1.middle_n_39 ,\ODD1.middle_n_40 ,\ODD1.middle_n_41 }),
        .\sgf_result_o[47]_9 ({\ODD1.middle_n_42 ,\ODD1.middle_n_43 ,\ODD1.middle_n_44 }));
  Recursive_KOA__parameterized37 \ODD1.right_lower 
       (.DI({\ODD1.right_lower_n_3 ,\ODD1.right_lower_n_4 }),
        .\Data_A_i[11] (\Data_A_i[11] ),
        .\Data_A_i[11]_0 (\Data_A_i[11]_0 ),
        .\Data_A_i[12] ({\ODD1.left_high_n_22 ,\ODD1.left_high_n_23 ,\ODD1.left_high_n_24 ,\ODD1.left_high_n_25 }),
        .\Data_A_i[12]_0 (\sgf_result_o[47]_0 ),
        .\Data_A_i[12]_1 (\ODD1.middle_n_11 ),
        .\Data_A_i[12]_2 ({\Data_A_i[12]_0 ,\sgf_result_o_OBUF[38]_inst_i_24_n_0 }),
        .\Data_A_i[13] (\Data_A_i[13] ),
        .\Data_A_i[13]_0 (\Data_A_i[13]_0 ),
        .\Data_A_i[13]_1 (\Data_A_i[13]_1 ),
        .\Data_A_i[13]_2 (\Data_A_i[13]_2 ),
        .\Data_A_i[13]_3 (\Data_A_i[13]_3 ),
        .\Data_A_i[13]_4 (\Data_A_i[13]_4 ),
        .\Data_A_i[14] (\Data_A_i[14] ),
        .\Data_A_i[14]_0 (\Data_A_i[14]_0 ),
        .\Data_A_i[14]_1 (\Data_A_i[14]_1 ),
        .\Data_A_i[14]_2 (\Data_A_i[14]_2 ),
        .\Data_A_i[14]_3 (\Data_A_i[14]_3 ),
        .\Data_A_i[14]_4 (\Data_A_i[14]_4 ),
        .\Data_A_i[14]_5 (\Data_A_i[14]_5 ),
        .\Data_A_i[14]_6 (\Data_A_i[14]_6 ),
        .\Data_A_i[17] (\Data_A_i[17] ),
        .\Data_A_i[23] (\Data_A_i[23] ),
        .\Data_A_i[23]_0 (\Data_A_i[23]_0 ),
        .\Data_A_i[2] (\Data_A_i[2] ),
        .\Data_A_i[2]_0 (\Data_A_i[2]_0 ),
        .\Data_A_i[2]_1 (\Data_A_i[2]_1 ),
        .Data_A_i_IBUF({Data_A_i_IBUF[13:12],Data_A_i_IBUF[1:0]}),
        .\Data_B_i[12] (\Data_B_i[12] ),
        .\Data_B_i[12]_0 ({\ODD1.left_high_n_17 ,\ODD1.left_high_n_18 ,\ODD1.left_high_n_19 ,\ODD1.left_high_n_20 }),
        .\Data_B_i[12]_1 ({\ODD1.left_high_n_9 ,\ODD1.left_high_n_10 ,\ODD1.left_high_n_11 }),
        .\Data_B_i[12]_2 ({\ODD1.left_high_n_27 ,\ODD1.left_high_n_28 ,\ODD1.left_high_n_29 }),
        .\Data_B_i[12]_3 ({\sgf_result_o[47]_2 ,\ODD1.left_high_n_32 ,\ODD1.left_high_n_33 ,\ODD1.left_high_n_34 }),
        .\Data_B_i[12]_4 ({\sgf_result_o_OBUF[34]_inst_i_21_n_0 ,\sgf_result_o_OBUF[34]_inst_i_22_n_0 ,\sgf_result_o_OBUF[34]_inst_i_23_n_0 ,\sgf_result_o_OBUF[34]_inst_i_24_n_0 }),
        .\Data_B_i[12]_5 ({\sgf_result_o_OBUF[38]_inst_i_29_n_0 ,\sgf_result_o_OBUF[38]_inst_i_30_n_0 ,\sgf_result_o_OBUF[38]_inst_i_31_n_0 ,\sgf_result_o_OBUF[38]_inst_i_32_n_0 }),
        .\Data_B_i[17] (DI),
        .\Data_B_i[17]_0 (\Data_B_i[17] ),
        .Data_B_i_IBUF({Data_B_i_IBUF[13:12],Data_B_i_IBUF[1:0]}),
        .O({\ODD1.left_high_n_1 ,\ODD1.left_high_n_2 ,\ODD1.left_high_n_3 }),
        .Q_middle_temp__5(Q_middle_temp__5[14:3]),
        .S({\ODD1.right_lower_n_5 ,\ODD1.right_lower_n_6 ,\ODD1.right_lower_n_7 ,\ODD1.right_lower_n_8 }),
        .sgf_result_o1(sgf_result_o1),
        .\sgf_result_o[47] ({\ODD1.right_lower_n_0 ,\ODD1.right_lower_n_1 ,\ODD1.right_lower_n_2 }),
        .\sgf_result_o[47]_0 ({\ODD1.right_lower_n_9 ,\ODD1.right_lower_n_10 ,\ODD1.right_lower_n_11 ,\ODD1.right_lower_n_12 }),
        .\sgf_result_o[47]_1 ({\ODD1.right_lower_n_13 ,\ODD1.right_lower_n_14 ,\ODD1.right_lower_n_15 }),
        .\sgf_result_o[47]_2 ({\ODD1.right_lower_n_16 ,\ODD1.right_lower_n_17 ,\ODD1.right_lower_n_18 ,\ODD1.right_lower_n_19 }),
        .\sgf_result_o[47]_3 (\ODD1.right_lower_n_20 ),
        .\sgf_result_o[47]_4 ({\ODD1.right_lower_n_21 ,\ODD1.right_lower_n_22 ,\ODD1.right_lower_n_23 ,\ODD1.right_lower_n_24 }),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_6 (\sgf_result_o[47]_3 ),
        .sgf_result_o_OBUF(sgf_result_o_OBUF));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_1__10
       (.I0(\ODD1.middle_n_14 ),
        .I1(\ODD1.middle_n_22 ),
        .O(sgf_result_o0__1_carry__0_i_1__10_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_1__11
       (.I0(\ODD1.middle_n_21 ),
        .I1(\ODD1.middle_n_29 ),
        .O(sgf_result_o0__1_carry__0_i_1__11_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    sgf_result_o0__1_carry__0_i_2__8
       (.I0(sgf_result_o0__1_carry_i_10__3_n_0),
        .I1(\ODD1.middle_n_24 ),
        .I2(\ODD1.middle_n_17 ),
        .I3(\ODD1.middle_n_25 ),
        .I4(\ODD1.middle_n_14 ),
        .I5(sgf_result_o0__1_carry__0_i_7__5_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__8_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    sgf_result_o0__1_carry__0_i_2__9
       (.I0(sgf_result_o0__1_carry_i_10__4_n_0),
        .I1(\ODD1.middle_n_27 ),
        .I2(\ODD1.middle_n_20 ),
        .I3(\ODD1.middle_n_28 ),
        .I4(\ODD1.middle_n_21 ),
        .I5(sgf_result_o0__1_carry__0_i_7__6_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__9_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    sgf_result_o0__1_carry__0_i_3__10
       (.I0(sgf_result_o0__1_carry_i_10__4_n_0),
        .I1(\ODD1.middle_n_27 ),
        .I2(\ODD1.middle_n_20 ),
        .I3(\ODD1.middle_n_28 ),
        .I4(\ODD1.middle_n_21 ),
        .I5(sgf_result_o0__1_carry__0_i_7__6_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__10_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    sgf_result_o0__1_carry__0_i_3__9
       (.I0(sgf_result_o0__1_carry_i_10__3_n_0),
        .I1(\ODD1.middle_n_24 ),
        .I2(\ODD1.middle_n_17 ),
        .I3(\ODD1.middle_n_25 ),
        .I4(\ODD1.middle_n_14 ),
        .I5(sgf_result_o0__1_carry__0_i_7__5_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__9_n_0));
  LUT6 #(
    .INIT(64'h173F8080C0000000)) 
    sgf_result_o0__1_carry__0_i_4__10
       (.I0(\ODD1.middle_n_24 ),
        .I1(\ODD1.middle_n_15 ),
        .I2(\ODD1.middle_n_23 ),
        .I3(\ODD1.middle_n_16 ),
        .I4(\ODD1.middle_n_22 ),
        .I5(\ODD1.middle_n_14 ),
        .O(sgf_result_o0__1_carry__0_i_4__10_n_0));
  LUT6 #(
    .INIT(64'h173F8080C0000000)) 
    sgf_result_o0__1_carry__0_i_4__11
       (.I0(\ODD1.middle_n_27 ),
        .I1(\ODD1.middle_n_18 ),
        .I2(\ODD1.middle_n_26 ),
        .I3(\ODD1.middle_n_19 ),
        .I4(\ODD1.middle_n_29 ),
        .I5(\ODD1.middle_n_21 ),
        .O(sgf_result_o0__1_carry__0_i_4__11_n_0));
  LUT6 #(
    .INIT(64'h9666699969996999)) 
    sgf_result_o0__1_carry__0_i_5__10
       (.I0(sgf_result_o0__1_carry__0_i_2__8_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__9_n_0),
        .I2(\ODD1.middle_n_14 ),
        .I3(\ODD1.middle_n_23 ),
        .I4(\ODD1.middle_n_15 ),
        .I5(\ODD1.middle_n_22 ),
        .O(sgf_result_o0__1_carry__0_i_5__10_n_0));
  LUT6 #(
    .INIT(64'h9666699969996999)) 
    sgf_result_o0__1_carry__0_i_5__11
       (.I0(sgf_result_o0__1_carry__0_i_2__9_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__10_n_0),
        .I2(\ODD1.middle_n_21 ),
        .I3(\ODD1.middle_n_26 ),
        .I4(\ODD1.middle_n_18 ),
        .I5(\ODD1.middle_n_29 ),
        .O(sgf_result_o0__1_carry__0_i_5__11_n_0));
  LUT6 #(
    .INIT(64'h56666AAA6AAA6AAA)) 
    sgf_result_o0__1_carry__0_i_6__8
       (.I0(sgf_result_o0__1_carry__0_i_3__9_n_0),
        .I1(sgf_result_o0__1_carry__0_i_9__4_n_0),
        .I2(\ODD1.middle_n_16 ),
        .I3(\ODD1.middle_n_23 ),
        .I4(\ODD1.middle_n_17 ),
        .I5(\ODD1.middle_n_22 ),
        .O(sgf_result_o0__1_carry__0_i_6__8_n_0));
  LUT6 #(
    .INIT(64'h56666AAA6AAA6AAA)) 
    sgf_result_o0__1_carry__0_i_6__9
       (.I0(sgf_result_o0__1_carry__0_i_3__10_n_0),
        .I1(sgf_result_o0__1_carry__0_i_9__5_n_0),
        .I2(\ODD1.middle_n_19 ),
        .I3(\ODD1.middle_n_26 ),
        .I4(\ODD1.middle_n_20 ),
        .I5(\ODD1.middle_n_29 ),
        .O(sgf_result_o0__1_carry__0_i_6__9_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry__0_i_7__5
       (.I0(\ODD1.middle_n_24 ),
        .I1(\ODD1.middle_n_14 ),
        .I2(\ODD1.middle_n_15 ),
        .I3(\ODD1.middle_n_23 ),
        .I4(\ODD1.middle_n_16 ),
        .I5(\ODD1.middle_n_22 ),
        .O(sgf_result_o0__1_carry__0_i_7__5_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry__0_i_7__6
       (.I0(\ODD1.middle_n_27 ),
        .I1(\ODD1.middle_n_21 ),
        .I2(\ODD1.middle_n_18 ),
        .I3(\ODD1.middle_n_26 ),
        .I4(\ODD1.middle_n_19 ),
        .I5(\ODD1.middle_n_29 ),
        .O(sgf_result_o0__1_carry__0_i_7__6_n_0));
  LUT6 #(
    .INIT(64'h07777FFF7FFF7FFF)) 
    sgf_result_o0__1_carry__0_i_8__10
       (.I0(\ODD1.middle_n_29 ),
        .I1(\ODD1.middle_n_19 ),
        .I2(\ODD1.middle_n_26 ),
        .I3(\ODD1.middle_n_18 ),
        .I4(\ODD1.middle_n_21 ),
        .I5(\ODD1.middle_n_27 ),
        .O(sgf_result_o0__1_carry__0_i_8__10_n_0));
  LUT6 #(
    .INIT(64'h07777FFF7FFF7FFF)) 
    sgf_result_o0__1_carry__0_i_8__9
       (.I0(\ODD1.middle_n_22 ),
        .I1(\ODD1.middle_n_16 ),
        .I2(\ODD1.middle_n_23 ),
        .I3(\ODD1.middle_n_15 ),
        .I4(\ODD1.middle_n_14 ),
        .I5(\ODD1.middle_n_24 ),
        .O(sgf_result_o0__1_carry__0_i_8__9_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_9__4
       (.I0(\ODD1.middle_n_15 ),
        .I1(\ODD1.middle_n_24 ),
        .O(sgf_result_o0__1_carry__0_i_9__4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_9__5
       (.I0(\ODD1.middle_n_18 ),
        .I1(\ODD1.middle_n_27 ),
        .O(sgf_result_o0__1_carry__0_i_9__5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_10__3
       (.I0(\ODD1.middle_n_16 ),
        .I1(\ODD1.middle_n_23 ),
        .O(sgf_result_o0__1_carry_i_10__3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_10__4
       (.I0(\ODD1.middle_n_19 ),
        .I1(\ODD1.middle_n_26 ),
        .O(sgf_result_o0__1_carry_i_10__4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_11__10
       (.I0(\ODD1.middle_n_28 ),
        .I1(\ODD1.middle_n_21 ),
        .O(sgf_result_o0__1_carry_i_11__10_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_11__9
       (.I0(\ODD1.middle_n_25 ),
        .I1(\ODD1.middle_n_14 ),
        .O(sgf_result_o0__1_carry_i_11__9_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_12
       (.I0(\ODD1.left_high_n_17 ),
        .I1(\sgf_result_o[15]_0 [2]),
        .O(sgf_result_o0__1_carry_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_13
       (.I0(\ODD1.left_high_n_18 ),
        .I1(\sgf_result_o[15]_0 [1]),
        .O(sgf_result_o0__1_carry_i_13_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_13__0
       (.I0(\ODD1.left_high_n_10 ),
        .I1(\sgf_result_o[15]_1 ),
        .O(sgf_result_o0__1_carry_i_13__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_14
       (.I0(\ODD1.left_high_n_19 ),
        .I1(\sgf_result_o[15]_0 [0]),
        .O(sgf_result_o0__1_carry_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_14__0__0
       (.I0(\ODD1.left_high_n_11 ),
        .I1(\sgf_result_o[15]_0 [3]),
        .O(sgf_result_o0__1_carry_i_14__0__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_15
       (.I0(\ODD1.left_high_n_20 ),
        .I1(\sgf_result_o[47] ),
        .O(sgf_result_o0__1_carry_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_16
       (.I0(\ODD1.left_high_n_22 ),
        .I1(\sgf_result_o[15] [2]),
        .O(sgf_result_o0__1_carry_i_16_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_16__0
       (.I0(\ODD1.left_high_n_2 ),
        .I1(CO),
        .O(sgf_result_o0__1_carry_i_16__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_17
       (.I0(\ODD1.left_high_n_23 ),
        .I1(\sgf_result_o[15] [1]),
        .O(sgf_result_o0__1_carry_i_17_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_17__0
       (.I0(\ODD1.left_high_n_3 ),
        .I1(\sgf_result_o[15] [3]),
        .O(sgf_result_o0__1_carry_i_17__0_n_0));
  CARRY4 sgf_result_o0__1_carry_i_17__4
       (.CI(\ODD1.left_high_n_26 ),
        .CO({NLW_sgf_result_o0__1_carry_i_17__4_CO_UNCONNECTED[3:1],CO}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_sgf_result_o0__1_carry_i_17__4_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_18
       (.I0(\ODD1.left_high_n_24 ),
        .I1(\sgf_result_o[15] [0]),
        .O(sgf_result_o0__1_carry_i_18_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_19
       (.I0(\ODD1.left_high_n_25 ),
        .I1(O),
        .O(sgf_result_o0__1_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_1__10
       (.I0(\ODD1.middle_n_24 ),
        .I1(\ODD1.middle_n_15 ),
        .I2(\ODD1.middle_n_16 ),
        .I3(\ODD1.middle_n_23 ),
        .I4(\ODD1.middle_n_17 ),
        .I5(\ODD1.middle_n_22 ),
        .O(sgf_result_o0__1_carry_i_1__10_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_1__11
       (.I0(\ODD1.middle_n_27 ),
        .I1(\ODD1.middle_n_18 ),
        .I2(\ODD1.middle_n_19 ),
        .I3(\ODD1.middle_n_26 ),
        .I4(\ODD1.middle_n_20 ),
        .I5(\ODD1.middle_n_29 ),
        .O(sgf_result_o0__1_carry_i_1__11_n_0));
  CARRY4 sgf_result_o0__1_carry_i_22__1
       (.CI(\ODD1.left_high_n_21 ),
        .CO({NLW_sgf_result_o0__1_carry_i_22__1_CO_UNCONNECTED[3:1],\sgf_result_o[15]_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_sgf_result_o0__1_carry_i_22__1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_2__10
       (.I0(\ODD1.middle_n_24 ),
        .I1(\ODD1.middle_n_16 ),
        .I2(\ODD1.middle_n_23 ),
        .I3(\ODD1.middle_n_17 ),
        .O(sgf_result_o0__1_carry_i_2__10_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_2__11
       (.I0(\ODD1.middle_n_27 ),
        .I1(\ODD1.middle_n_19 ),
        .I2(\ODD1.middle_n_26 ),
        .I3(\ODD1.middle_n_20 ),
        .O(sgf_result_o0__1_carry_i_2__11_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_3__10
       (.I0(\ODD1.middle_n_17 ),
        .I1(\ODD1.middle_n_24 ),
        .O(sgf_result_o0__1_carry_i_3__10_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_3__11
       (.I0(\ODD1.middle_n_20 ),
        .I1(\ODD1.middle_n_27 ),
        .O(sgf_result_o0__1_carry_i_3__11_n_0));
  LUT6 #(
    .INIT(64'h99A5C30F665A3CF0)) 
    sgf_result_o0__1_carry_i_4__10
       (.I0(\ODD1.middle_n_22 ),
        .I1(\ODD1.middle_n_15 ),
        .I2(sgf_result_o0__1_carry_i_10__3_n_0),
        .I3(\ODD1.middle_n_24 ),
        .I4(\ODD1.middle_n_17 ),
        .I5(sgf_result_o0__1_carry_i_11__9_n_0),
        .O(sgf_result_o0__1_carry_i_4__10_n_0));
  LUT6 #(
    .INIT(64'h99A5C30F665A3CF0)) 
    sgf_result_o0__1_carry_i_4__11
       (.I0(\ODD1.middle_n_29 ),
        .I1(\ODD1.middle_n_18 ),
        .I2(sgf_result_o0__1_carry_i_10__4_n_0),
        .I3(\ODD1.middle_n_27 ),
        .I4(\ODD1.middle_n_20 ),
        .I5(sgf_result_o0__1_carry_i_11__10_n_0),
        .O(sgf_result_o0__1_carry_i_4__11_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_5__10
       (.I0(\ODD1.middle_n_17 ),
        .I1(\ODD1.middle_n_23 ),
        .I2(\ODD1.middle_n_16 ),
        .I3(\ODD1.middle_n_24 ),
        .I4(\ODD1.middle_n_15 ),
        .I5(\ODD1.middle_n_25 ),
        .O(sgf_result_o0__1_carry_i_5__10_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_5__11
       (.I0(\ODD1.middle_n_20 ),
        .I1(\ODD1.middle_n_26 ),
        .I2(\ODD1.middle_n_19 ),
        .I3(\ODD1.middle_n_27 ),
        .I4(\ODD1.middle_n_18 ),
        .I5(\ODD1.middle_n_28 ),
        .O(sgf_result_o0__1_carry_i_5__11_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_6__7
       (.I0(\ODD1.middle_n_16 ),
        .I1(\ODD1.middle_n_25 ),
        .I2(\ODD1.middle_n_24 ),
        .I3(\ODD1.middle_n_17 ),
        .O(sgf_result_o0__1_carry_i_6__7_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_6__8
       (.I0(\ODD1.middle_n_19 ),
        .I1(\ODD1.middle_n_28 ),
        .I2(\ODD1.middle_n_27 ),
        .I3(\ODD1.middle_n_20 ),
        .O(sgf_result_o0__1_carry_i_6__8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_7__10
       (.I0(\ODD1.middle_n_25 ),
        .I1(\ODD1.middle_n_17 ),
        .O(sgf_result_o0__1_carry_i_7__10_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_7__11
       (.I0(\ODD1.middle_n_28 ),
        .I1(\ODD1.middle_n_20 ),
        .O(sgf_result_o0__1_carry_i_7__11_n_0));
  CARRY4 sgf_result_o1__35_carry
       (.CI(1'b0),
        .CO({sgf_result_o1__35_carry_n_0,sgf_result_o1__35_carry_n_1,sgf_result_o1__35_carry_n_2,sgf_result_o1__35_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\ODD1.middle_n_11 ,\ODD1.middle_n_12 ,\ODD1.middle_n_13 ,1'b1}),
        .O(sgf_result_o1[3:0]),
        .S({\ODD1.right_lower_n_20 ,\ODD1.middle_n_42 ,\ODD1.middle_n_43 ,\ODD1.middle_n_44 }));
  CARRY4 sgf_result_o1__35_carry__0
       (.CI(sgf_result_o1__35_carry_n_0),
        .CO({sgf_result_o1__35_carry__0_n_0,sgf_result_o1__35_carry__0_n_1,sgf_result_o1__35_carry__0_n_2,sgf_result_o1__35_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.right_lower_n_16 ,\ODD1.right_lower_n_17 ,\ODD1.right_lower_n_18 ,\ODD1.right_lower_n_19 }),
        .O(sgf_result_o1[7:4]),
        .S({\ODD1.right_lower_n_21 ,\ODD1.right_lower_n_22 ,\ODD1.right_lower_n_23 ,\ODD1.right_lower_n_24 }));
  CARRY4 sgf_result_o1__35_carry__1
       (.CI(sgf_result_o1__35_carry__0_n_0),
        .CO({sgf_result_o1__35_carry__1_n_0,sgf_result_o1__35_carry__1_n_1,sgf_result_o1__35_carry__1_n_2,sgf_result_o1__35_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.right_lower_n_9 ,\ODD1.right_lower_n_10 ,\ODD1.right_lower_n_11 ,\ODD1.right_lower_n_12 }),
        .O(sgf_result_o1[11:8]),
        .S({\ODD1.right_lower_n_5 ,\ODD1.right_lower_n_6 ,\ODD1.right_lower_n_7 ,\ODD1.right_lower_n_8 }));
  CARRY4 sgf_result_o1__35_carry__2
       (.CI(sgf_result_o1__35_carry__1_n_0),
        .CO({NLW_sgf_result_o1__35_carry__2_CO_UNCONNECTED[3],sgf_result_o1__35_carry__2_n_1,sgf_result_o1__35_carry__2_n_2,sgf_result_o1__35_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,Q_middle_temp__5[14],\ODD1.right_lower_n_3 ,\ODD1.right_lower_n_4 }),
        .O(sgf_result_o1[15:12]),
        .S({sgf_result_o1__35_carry_i_3_n_0,\ODD1.right_lower_n_13 ,\ODD1.right_lower_n_14 ,\ODD1.right_lower_n_15 }));
  LUT1 #(
    .INIT(2'h1)) 
    sgf_result_o1__35_carry_i_3
       (.I0(Q_middle_temp__5[15]),
        .O(sgf_result_o1__35_carry_i_3_n_0));
  CARRY4 sgf_result_o1_carry
       (.CI(1'b0),
        .CO({sgf_result_o1_carry_n_0,sgf_result_o1_carry_n_1,sgf_result_o1_carry_n_2,sgf_result_o1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.middle_n_2 ,\ODD1.middle_n_3 ,\ODD1.middle_n_4 ,1'b0}),
        .O(Q_middle_temp__5[6:3]),
        .S({\ODD1.middle_n_30 ,\ODD1.middle_n_31 ,\ODD1.middle_n_32 ,\ODD1.middle_n_33 }));
  CARRY4 sgf_result_o1_carry__0
       (.CI(sgf_result_o1_carry_n_0),
        .CO({sgf_result_o1_carry__0_n_0,sgf_result_o1_carry__0_n_1,sgf_result_o1_carry__0_n_2,sgf_result_o1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.middle_n_6 ,\ODD1.middle_n_7 ,\ODD1.middle_n_8 ,\ODD1.middle_n_1 }),
        .O(Q_middle_temp__5[10:7]),
        .S({\ODD1.middle_n_34 ,\ODD1.middle_n_35 ,\ODD1.middle_n_36 ,\ODD1.middle_n_37 }));
  CARRY4 sgf_result_o1_carry__1
       (.CI(sgf_result_o1_carry__0_n_0),
        .CO({sgf_result_o1_carry__1_n_0,sgf_result_o1_carry__1_n_1,sgf_result_o1_carry__1_n_2,sgf_result_o1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\ODD1.middle_n_9 ,\ODD1.middle_n_10 ,\ODD1.middle_n_5 }),
        .O(Q_middle_temp__5[14:11]),
        .S({\ODD1.middle_n_38 ,\ODD1.middle_n_39 ,\ODD1.middle_n_40 ,\ODD1.middle_n_41 }));
  CARRY4 sgf_result_o1_carry__2
       (.CI(sgf_result_o1_carry__1_n_0),
        .CO(NLW_sgf_result_o1_carry__2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_sgf_result_o1_carry__2_O_UNCONNECTED[3:1],Q_middle_temp__5[15]}),
        .S({1'b0,1'b0,1'b0,\ODD1.middle_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_21 
       (.I0(sgf_result_o1[10]),
        .I1(\ODD1.left_high_n_29 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_22 
       (.I0(sgf_result_o1[9]),
        .I1(\ODD1.left_high_n_30 ),
        .O(\sgf_result_o_OBUF[34]_inst_i_22_n_0 ));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    \sgf_result_o_OBUF[34]_inst_i_23 
       (.I0(sgf_result_o1[8]),
        .I1(\sgf_result_o[47] ),
        .I2(\sgf_result_o[15] [0]),
        .I3(O),
        .I4(\sgf_result_o[15]_0 [0]),
        .O(\sgf_result_o_OBUF[34]_inst_i_23_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \sgf_result_o_OBUF[34]_inst_i_24 
       (.I0(sgf_result_o1[7]),
        .I1(O),
        .I2(\sgf_result_o[47] ),
        .O(\sgf_result_o_OBUF[34]_inst_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_24 
       (.I0(sgf_result_o1[15]),
        .I1(\ODD1.left_high_n_32 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_29 
       (.I0(sgf_result_o1[14]),
        .I1(\ODD1.left_high_n_33 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_29_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_30 
       (.I0(sgf_result_o1[13]),
        .I1(\ODD1.left_high_n_34 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_30_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_31 
       (.I0(sgf_result_o1[12]),
        .I1(\ODD1.left_high_n_27 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_31_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_32 
       (.I0(sgf_result_o1[11]),
        .I1(\ODD1.left_high_n_28 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_32_n_0 ));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized33
   (O,
    \sgf_result_o[15] ,
    \sgf_result_o[47] ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[15]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[15]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    CO,
    \Data_B_i[12] ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    S,
    \Data_A_i[12] );
  output [3:0]O;
  output [3:0]\sgf_result_o[15] ;
  output [3:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[15]_0 ;
  output \sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [0:0]\sgf_result_o[15]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [0:0]\sgf_result_o[15]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [3:0]\sgf_result_o[47]_4 ;
  output [1:0]\sgf_result_o[47]_5 ;
  input [0:0]CO;
  input [0:0]\Data_B_i[12] ;
  input [23:0]Data_B_i_IBUF;
  input [23:0]Data_A_i_IBUF;
  input [0:0]S;
  input [0:0]\Data_A_i[12] ;

  wire [0:0]CO;
  wire [0:0]\Data_A_i[12] ;
  wire [23:0]Data_A_i_IBUF;
  wire [0:0]\Data_B_i[12] ;
  wire [23:0]Data_B_i_IBUF;
  wire \EVEN1.middle_n_0 ;
  wire \EVEN1.middle_n_1 ;
  wire \EVEN1.middle_n_2 ;
  wire [3:0]O;
  wire [0:0]S;
  wire S_B0__0_carry__0_i_10__3_n_0;
  wire S_B0__0_carry__0_i_7__3_n_0;
  wire S_B0__0_carry__0_i_8__3_n_0;
  wire S_B0__0_carry__0_i_9__3_n_0;
  wire S_B0__0_carry_i_11__3_n_0;
  wire S_B0__0_carry_i_12__3_n_0;
  wire S_B0__0_carry_i_13__2_n_0;
  wire S_B0__0_carry_i_8__3_n_0;
  wire S_B0__0_carry_i_9__3_n_0;
  wire sgf_result_o0__1_carry__0_i_10__0_n_0;
  wire sgf_result_o0__1_carry__0_i_1__9_n_0;
  wire sgf_result_o0__1_carry__0_i_2__7_n_0;
  wire sgf_result_o0__1_carry__0_i_3__8_n_0;
  wire sgf_result_o0__1_carry__0_i_4__9_n_0;
  wire sgf_result_o0__1_carry__0_i_5__9_n_0;
  wire sgf_result_o0__1_carry__0_i_6__7_n_0;
  wire sgf_result_o0__1_carry__0_i_7__4_n_0;
  wire sgf_result_o0__1_carry__0_i_8__8_n_0;
  wire sgf_result_o0__1_carry__0_i_9__9_n_0;
  wire sgf_result_o0__1_carry_i_10__12_n_0;
  wire sgf_result_o0__1_carry_i_11__12_n_1;
  wire sgf_result_o0__1_carry_i_11__12_n_2;
  wire sgf_result_o0__1_carry_i_11__12_n_3;
  wire sgf_result_o0__1_carry_i_12__0_n_0;
  wire sgf_result_o0__1_carry_i_12__7_n_0;
  wire sgf_result_o0__1_carry_i_13__1_n_0;
  wire sgf_result_o0__1_carry_i_13__6_n_0;
  wire sgf_result_o0__1_carry_i_14__1_n_1;
  wire sgf_result_o0__1_carry_i_14__1_n_2;
  wire sgf_result_o0__1_carry_i_14__1_n_3;
  wire sgf_result_o0__1_carry_i_14__2_n_0;
  wire sgf_result_o0__1_carry_i_15__0_n_0;
  wire sgf_result_o0__1_carry_i_15__3_n_0;
  wire sgf_result_o0__1_carry_i_16__2_n_0;
  wire sgf_result_o0__1_carry_i_16__4_n_0;
  wire sgf_result_o0__1_carry_i_17__1_n_0;
  wire sgf_result_o0__1_carry_i_18__0__0_n_0;
  wire sgf_result_o0__1_carry_i_18__0_n_0;
  wire sgf_result_o0__1_carry_i_19__0__0_n_0;
  wire sgf_result_o0__1_carry_i_19__0_n_0;
  wire sgf_result_o0__1_carry_i_1__9_n_0;
  wire sgf_result_o0__1_carry_i_20_n_0;
  wire sgf_result_o0__1_carry_i_21_n_0;
  wire sgf_result_o0__1_carry_i_23_n_0;
  wire sgf_result_o0__1_carry_i_24_n_0;
  wire sgf_result_o0__1_carry_i_25_n_0;
  wire sgf_result_o0__1_carry_i_26_n_0;
  wire sgf_result_o0__1_carry_i_2__9_n_0;
  wire sgf_result_o0__1_carry_i_3__9_n_0;
  wire sgf_result_o0__1_carry_i_4__9_n_0;
  wire sgf_result_o0__1_carry_i_5__9_n_0;
  wire sgf_result_o0__1_carry_i_6__6_n_0;
  wire sgf_result_o0__1_carry_i_7__9_n_0;
  wire sgf_result_o0__1_carry_i_8__10_n_0;
  wire sgf_result_o0__1_carry_i_8__10_n_1;
  wire sgf_result_o0__1_carry_i_8__10_n_2;
  wire sgf_result_o0__1_carry_i_8__10_n_3;
  wire sgf_result_o0__1_carry_i_8__6_n_0;
  wire sgf_result_o0__1_carry_i_9__12_n_0;
  wire sgf_result_o0__1_carry_i_9__5_n_0;
  wire sgf_result_o0__1_carry_i_9__5_n_1;
  wire sgf_result_o0__1_carry_i_9__5_n_2;
  wire sgf_result_o0__1_carry_i_9__5_n_3;
  wire sgf_result_o1__0_carry_i_13__2_n_0;
  wire sgf_result_o1__0_carry_i_13__2_n_1;
  wire sgf_result_o1__0_carry_i_13__2_n_2;
  wire sgf_result_o1__0_carry_i_13__2_n_3;
  wire sgf_result_o1__0_carry_i_18__1_n_0;
  wire sgf_result_o1__0_carry_i_18__1_n_1;
  wire sgf_result_o1__0_carry_i_18__1_n_2;
  wire sgf_result_o1__0_carry_i_18__1_n_3;
  wire sgf_result_o1__0_carry_i_20_n_0;
  wire sgf_result_o1__0_carry_i_21_n_0;
  wire sgf_result_o1__0_carry_i_22_n_0;
  wire sgf_result_o1__0_carry_i_23_n_0;
  wire sgf_result_o1__0_carry_i_25_n_0;
  wire sgf_result_o1__0_carry_i_26_n_0;
  wire sgf_result_o1__0_carry_i_27_n_0;
  wire sgf_result_o1__0_carry_i_28_n_0;
  wire sgf_result_o1__35_carry_i_10__0_n_0;
  wire sgf_result_o1__35_carry_i_11_n_0;
  wire sgf_result_o1__35_carry_i_9__1_n_0;
  wire [3:0]\sgf_result_o[15] ;
  wire [3:0]\sgf_result_o[15]_0 ;
  wire [0:0]\sgf_result_o[15]_1 ;
  wire [0:0]\sgf_result_o[15]_2 ;
  wire [3:0]\sgf_result_o[47] ;
  wire \sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:0]\sgf_result_o[47]_4 ;
  wire [1:0]\sgf_result_o[47]_5 ;

  Recursive_KOA__parameterized36 \EVEN1.middle 
       (.DI({sgf_result_o0__1_carry_i_1__9_n_0,sgf_result_o0__1_carry_i_2__9_n_0,sgf_result_o0__1_carry_i_3__9_n_0}),
        .\Data_A_i[12] ({sgf_result_o0__1_carry__0_i_1__9_n_0,sgf_result_o0__1_carry__0_i_2__7_n_0,sgf_result_o0__1_carry__0_i_3__8_n_0}),
        .\Data_A_i[12]_0 ({sgf_result_o0__1_carry__0_i_4__9_n_0,sgf_result_o0__1_carry__0_i_5__9_n_0,sgf_result_o0__1_carry__0_i_6__7_n_0}),
        .\Data_A_i[12]_1 (\sgf_result_o[15] [3:2]),
        .\Data_A_i[12]_10 (\Data_A_i[12] ),
        .\Data_A_i[12]_11 (O[3]),
        .\Data_A_i[12]_2 (S_B0__0_carry_i_13__2_n_0),
        .\Data_A_i[12]_3 (S_B0__0_carry__0_i_9__3_n_0),
        .\Data_A_i[12]_4 (S_B0__0_carry__0_i_10__3_n_0),
        .\Data_A_i[12]_5 (S_B0__0_carry_i_9__3_n_0),
        .\Data_A_i[12]_6 (S_B0__0_carry_i_12__3_n_0),
        .\Data_A_i[12]_7 (S_B0__0_carry__0_i_8__3_n_0),
        .\Data_A_i[12]_8 ({sgf_result_o1__35_carry_i_9__1_n_0,sgf_result_o1__35_carry_i_11_n_0,S}),
        .\Data_A_i[12]_9 (sgf_result_o1__35_carry_i_10__0_n_0),
        .\Data_B_i[12] (\sgf_result_o[15]_0 [3:2]),
        .\Data_B_i[12]_0 (\sgf_result_o[47]_0 ),
        .\Data_B_i[12]_1 (S_B0__0_carry_i_8__3_n_0),
        .\Data_B_i[12]_2 (S_B0__0_carry_i_11__3_n_0),
        .\Data_B_i[12]_3 (S_B0__0_carry__0_i_7__3_n_0),
        .\Data_B_i[12]_4 (\sgf_result_o[47] [3]),
        .O({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 }),
        .S({sgf_result_o0__1_carry_i_4__9_n_0,sgf_result_o0__1_carry_i_5__9_n_0,sgf_result_o0__1_carry_i_6__6_n_0,sgf_result_o0__1_carry_i_7__9_n_0}),
        .\sgf_result_o[47] (\EVEN1.middle_n_2 ),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_1 (\sgf_result_o[47]_4 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_5 ));
  LUT6 #(
    .INIT(64'hAA00800080000000)) 
    S_B0__0_carry__0_i_10__3
       (.I0(CO),
        .I1(\sgf_result_o[15]_0 [2]),
        .I2(\sgf_result_o[15] [2]),
        .I3(\Data_B_i[12] ),
        .I4(\sgf_result_o[15] [3]),
        .I5(\sgf_result_o[15]_0 [3]),
        .O(S_B0__0_carry__0_i_10__3_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_7__3
       (.I0(\sgf_result_o[15]_0 [0]),
        .I1(\sgf_result_o[15] [0]),
        .I2(\sgf_result_o[15]_0 [1]),
        .I3(O[3]),
        .I4(\sgf_result_o[47] [3]),
        .I5(\sgf_result_o[15] [1]),
        .O(S_B0__0_carry__0_i_7__3_n_0));
  LUT6 #(
    .INIT(64'h9878707080008000)) 
    S_B0__0_carry__0_i_8__3
       (.I0(\sgf_result_o[15]_0 [3]),
        .I1(\sgf_result_o[15] [3]),
        .I2(\Data_B_i[12] ),
        .I3(\sgf_result_o[15] [2]),
        .I4(\sgf_result_o[15]_0 [2]),
        .I5(CO),
        .O(S_B0__0_carry__0_i_8__3_n_0));
  LUT6 #(
    .INIT(64'h55FF7FFF7FFFFFFF)) 
    S_B0__0_carry__0_i_9__3
       (.I0(\sgf_result_o[15] [1]),
        .I1(\sgf_result_o[47] [3]),
        .I2(O[3]),
        .I3(\sgf_result_o[15]_0 [1]),
        .I4(\sgf_result_o[15] [0]),
        .I5(\sgf_result_o[15]_0 [0]),
        .O(S_B0__0_carry__0_i_9__3_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_10__2
       (.I0(\sgf_result_o[15]_0 [0]),
        .I1(O[3]),
        .I2(\sgf_result_o[15] [0]),
        .I3(\sgf_result_o[47] [3]),
        .O(\sgf_result_o[47]_0 ));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_11__3
       (.I0(\sgf_result_o[15]_0 [0]),
        .I1(\sgf_result_o[15] [0]),
        .I2(\sgf_result_o[15]_0 [1]),
        .I3(O[3]),
        .I4(\sgf_result_o[47] [3]),
        .I5(\sgf_result_o[15] [1]),
        .O(S_B0__0_carry_i_11__3_n_0));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    S_B0__0_carry_i_12__3
       (.I0(\sgf_result_o[15]_0 [3]),
        .I1(\sgf_result_o[15] [3]),
        .I2(\Data_B_i[12] ),
        .I3(\sgf_result_o[15] [2]),
        .I4(\sgf_result_o[15]_0 [2]),
        .I5(CO),
        .O(S_B0__0_carry_i_12__3_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    S_B0__0_carry_i_13__2
       (.I0(\sgf_result_o[15]_0 [3]),
        .I1(\sgf_result_o[15] [2]),
        .I2(\sgf_result_o[15] [3]),
        .I3(\sgf_result_o[15]_0 [2]),
        .O(S_B0__0_carry_i_13__2_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_8__3
       (.I0(\sgf_result_o[15]_0 [0]),
        .I1(\sgf_result_o[15] [0]),
        .I2(\sgf_result_o[15]_0 [1]),
        .I3(O[3]),
        .I4(\sgf_result_o[47] [3]),
        .I5(\sgf_result_o[15] [1]),
        .O(S_B0__0_carry_i_8__3_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    S_B0__0_carry_i_9__3
       (.I0(\sgf_result_o[15]_0 [3]),
        .I1(\sgf_result_o[15] [3]),
        .I2(\Data_B_i[12] ),
        .I3(\sgf_result_o[15] [2]),
        .I4(\sgf_result_o[15]_0 [2]),
        .I5(CO),
        .O(S_B0__0_carry_i_9__3_n_0));
  LUT6 #(
    .INIT(64'h022002200220ABBA)) 
    sgf_result_o0__1_carry__0_i_10__0
       (.I0(sgf_result_o0__1_carry_i_10__12_n_0),
        .I1(sgf_result_o0__1_carry_i_12__7_n_0),
        .I2(O[3]),
        .I3(\sgf_result_o[15] [2]),
        .I4(sgf_result_o0__1_carry_i_9__12_n_0),
        .I5(sgf_result_o0__1_carry_i_8__6_n_0),
        .O(sgf_result_o0__1_carry__0_i_10__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_1__9
       (.I0(sgf_result_o0__1_carry_i_12__7_n_0),
        .I1(sgf_result_o0__1_carry_i_15__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_1__9_n_0));
  LUT5 #(
    .INIT(32'h14000000)) 
    sgf_result_o0__1_carry__0_i_2__7
       (.I0(sgf_result_o0__1_carry_i_15__3_n_0),
        .I1(\sgf_result_o[47] [3]),
        .I2(\sgf_result_o[15]_0 [2]),
        .I3(sgf_result_o0__1_carry_i_3__9_n_0),
        .I4(sgf_result_o0__1_carry_i_10__12_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__7_n_0));
  LUT6 #(
    .INIT(64'h56A956A956A9A956)) 
    sgf_result_o0__1_carry__0_i_3__8
       (.I0(sgf_result_o0__1_carry__0_i_2__7_n_0),
        .I1(sgf_result_o0__1_carry_i_12__7_n_0),
        .I2(sgf_result_o0__1_carry_i_16__4_n_0),
        .I3(sgf_result_o0__1_carry__0_i_7__4_n_0),
        .I4(sgf_result_o0__1_carry_i_9__12_n_0),
        .I5(sgf_result_o0__1_carry_i_15__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__8_n_0));
  LUT6 #(
    .INIT(64'h000001010003FCE8)) 
    sgf_result_o0__1_carry__0_i_4__9
       (.I0(sgf_result_o0__1_carry_i_9__12_n_0),
        .I1(sgf_result_o0__1_carry_i_13__6_n_0),
        .I2(sgf_result_o0__1_carry_i_8__6_n_0),
        .I3(sgf_result_o0__1_carry_i_16__4_n_0),
        .I4(sgf_result_o0__1_carry_i_15__3_n_0),
        .I5(sgf_result_o0__1_carry_i_12__7_n_0),
        .O(sgf_result_o0__1_carry__0_i_4__9_n_0));
  LUT6 #(
    .INIT(64'h9996999699966669)) 
    sgf_result_o0__1_carry__0_i_5__9
       (.I0(sgf_result_o0__1_carry__0_i_2__7_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__8_n_0),
        .I2(sgf_result_o0__1_carry_i_13__6_n_0),
        .I3(sgf_result_o0__1_carry_i_15__3_n_0),
        .I4(sgf_result_o0__1_carry_i_8__6_n_0),
        .I5(sgf_result_o0__1_carry_i_12__7_n_0),
        .O(sgf_result_o0__1_carry__0_i_5__9_n_0));
  LUT6 #(
    .INIT(64'h1EE1E11EE11E1EE1)) 
    sgf_result_o0__1_carry__0_i_6__7
       (.I0(sgf_result_o0__1_carry_i_15__3_n_0),
        .I1(sgf_result_o0__1_carry_i_9__12_n_0),
        .I2(sgf_result_o0__1_carry__0_i_7__4_n_0),
        .I3(sgf_result_o0__1_carry__0_i_9__9_n_0),
        .I4(sgf_result_o0__1_carry__0_i_2__7_n_0),
        .I5(sgf_result_o0__1_carry__0_i_10__0_n_0),
        .O(sgf_result_o0__1_carry__0_i_6__7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_7__4
       (.I0(sgf_result_o0__1_carry_i_13__6_n_0),
        .I1(sgf_result_o0__1_carry_i_8__6_n_0),
        .O(sgf_result_o0__1_carry__0_i_7__4_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFEEEE0)) 
    sgf_result_o0__1_carry__0_i_8__8
       (.I0(sgf_result_o0__1_carry_i_12__7_n_0),
        .I1(sgf_result_o0__1_carry_i_16__4_n_0),
        .I2(sgf_result_o0__1_carry_i_8__6_n_0),
        .I3(sgf_result_o0__1_carry_i_13__6_n_0),
        .I4(sgf_result_o0__1_carry_i_9__12_n_0),
        .I5(sgf_result_o0__1_carry_i_15__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_8__8_n_0));
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry__0_i_9__9
       (.I0(\sgf_result_o[15] [0]),
        .I1(\sgf_result_o[15] [3]),
        .I2(O[3]),
        .I3(\sgf_result_o[15] [2]),
        .I4(sgf_result_o0__1_carry_i_12__7_n_0),
        .O(sgf_result_o0__1_carry__0_i_9__9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry_i_10__12
       (.I0(\sgf_result_o[15] [0]),
        .I1(\sgf_result_o[15] [3]),
        .I2(O[3]),
        .I3(\sgf_result_o[15] [2]),
        .I4(sgf_result_o0__1_carry_i_13__6_n_0),
        .O(sgf_result_o0__1_carry_i_10__12_n_0));
  CARRY4 sgf_result_o0__1_carry_i_11__12
       (.CI(sgf_result_o1__0_carry_i_18__1_n_0),
        .CO({\sgf_result_o[15]_2 ,sgf_result_o0__1_carry_i_11__12_n_1,sgf_result_o0__1_carry_i_11__12_n_2,sgf_result_o0__1_carry_i_11__12_n_3}),
        .CYINIT(1'b0),
        .DI(Data_A_i_IBUF[11:8]),
        .O(\sgf_result_o[15] ),
        .S({sgf_result_o0__1_carry_i_18__0__0_n_0,sgf_result_o0__1_carry_i_19__0__0_n_0,sgf_result_o0__1_carry_i_20_n_0,sgf_result_o0__1_carry_i_21_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_12__0
       (.I0(Data_B_i_IBUF[3]),
        .I1(Data_B_i_IBUF[15]),
        .O(sgf_result_o0__1_carry_i_12__0_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_12__7
       (.I0(\sgf_result_o[15]_0 [0]),
        .I1(\sgf_result_o[15]_0 [3]),
        .I2(\sgf_result_o[47] [3]),
        .I3(\sgf_result_o[15]_0 [2]),
        .I4(\sgf_result_o[15]_0 [1]),
        .I5(\Data_B_i[12] ),
        .O(sgf_result_o0__1_carry_i_12__7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_13__1
       (.I0(Data_B_i_IBUF[2]),
        .I1(Data_B_i_IBUF[14]),
        .O(sgf_result_o0__1_carry_i_13__1_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_13__6
       (.I0(\Data_B_i[12] ),
        .I1(\sgf_result_o[15]_0 [1]),
        .I2(\sgf_result_o[15]_0 [2]),
        .I3(\sgf_result_o[47] [3]),
        .I4(\sgf_result_o[15]_0 [3]),
        .I5(\sgf_result_o[15]_0 [0]),
        .O(sgf_result_o0__1_carry_i_13__6_n_0));
  CARRY4 sgf_result_o0__1_carry_i_14__1
       (.CI(sgf_result_o1__0_carry_i_13__2_n_0),
        .CO({\sgf_result_o[15]_1 ,sgf_result_o0__1_carry_i_14__1_n_1,sgf_result_o0__1_carry_i_14__1_n_2,sgf_result_o0__1_carry_i_14__1_n_3}),
        .CYINIT(1'b0),
        .DI(Data_B_i_IBUF[11:8]),
        .O(\sgf_result_o[15]_0 ),
        .S({sgf_result_o0__1_carry_i_23_n_0,sgf_result_o0__1_carry_i_24_n_0,sgf_result_o0__1_carry_i_25_n_0,sgf_result_o0__1_carry_i_26_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_14__2
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[13]),
        .O(sgf_result_o0__1_carry_i_14__2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_15__0
       (.I0(Data_B_i_IBUF[0]),
        .I1(Data_B_i_IBUF[12]),
        .O(sgf_result_o0__1_carry_i_15__0_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_15__3
       (.I0(\sgf_result_o[15] [0]),
        .I1(\sgf_result_o[15] [3]),
        .I2(O[3]),
        .I3(\sgf_result_o[15] [2]),
        .I4(\sgf_result_o[15] [1]),
        .I5(CO),
        .O(sgf_result_o0__1_carry_i_15__3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_16__2
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[15]),
        .O(sgf_result_o0__1_carry_i_16__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_16__4
       (.I0(\sgf_result_o[15] [2]),
        .I1(O[3]),
        .I2(\sgf_result_o[15] [3]),
        .I3(\sgf_result_o[15] [0]),
        .O(sgf_result_o0__1_carry_i_16__4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_17__1
       (.I0(Data_A_i_IBUF[2]),
        .I1(Data_A_i_IBUF[14]),
        .O(sgf_result_o0__1_carry_i_17__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_18__0
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[13]),
        .O(sgf_result_o0__1_carry_i_18__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_18__0__0
       (.I0(Data_A_i_IBUF[11]),
        .I1(Data_A_i_IBUF[23]),
        .O(sgf_result_o0__1_carry_i_18__0__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_19__0
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_A_i_IBUF[12]),
        .O(sgf_result_o0__1_carry_i_19__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_19__0__0
       (.I0(Data_A_i_IBUF[10]),
        .I1(Data_A_i_IBUF[22]),
        .O(sgf_result_o0__1_carry_i_19__0__0_n_0));
  LUT6 #(
    .INIT(64'hE1E1E1E1E11E1EE1)) 
    sgf_result_o0__1_carry_i_1__9
       (.I0(sgf_result_o0__1_carry_i_8__6_n_0),
        .I1(sgf_result_o0__1_carry_i_9__12_n_0),
        .I2(sgf_result_o0__1_carry_i_10__12_n_0),
        .I3(\sgf_result_o[15] [2]),
        .I4(O[3]),
        .I5(sgf_result_o0__1_carry_i_12__7_n_0),
        .O(sgf_result_o0__1_carry_i_1__9_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_20
       (.I0(Data_A_i_IBUF[9]),
        .I1(Data_A_i_IBUF[21]),
        .O(sgf_result_o0__1_carry_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_21
       (.I0(Data_A_i_IBUF[8]),
        .I1(Data_A_i_IBUF[20]),
        .O(sgf_result_o0__1_carry_i_21_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_23
       (.I0(Data_B_i_IBUF[11]),
        .I1(Data_B_i_IBUF[23]),
        .O(sgf_result_o0__1_carry_i_23_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_24
       (.I0(Data_B_i_IBUF[10]),
        .I1(Data_B_i_IBUF[22]),
        .O(sgf_result_o0__1_carry_i_24_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_25
       (.I0(Data_B_i_IBUF[9]),
        .I1(Data_B_i_IBUF[21]),
        .O(sgf_result_o0__1_carry_i_25_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_26
       (.I0(Data_B_i_IBUF[8]),
        .I1(Data_B_i_IBUF[20]),
        .O(sgf_result_o0__1_carry_i_26_n_0));
  LUT6 #(
    .INIT(64'h0906060609F9F906)) 
    sgf_result_o0__1_carry_i_2__9
       (.I0(\sgf_result_o[15] [3]),
        .I1(\sgf_result_o[15] [0]),
        .I2(sgf_result_o0__1_carry_i_9__12_n_0),
        .I3(O[3]),
        .I4(\sgf_result_o[15] [2]),
        .I5(sgf_result_o0__1_carry_i_13__6_n_0),
        .O(sgf_result_o0__1_carry_i_2__9_n_0));
  LUT6 #(
    .INIT(64'h6006066006600660)) 
    sgf_result_o0__1_carry_i_3__9
       (.I0(\sgf_result_o[15] [2]),
        .I1(O[3]),
        .I2(\sgf_result_o[15]_0 [0]),
        .I3(\sgf_result_o[15]_0 [3]),
        .I4(\sgf_result_o[47] [3]),
        .I5(\sgf_result_o[15]_0 [2]),
        .O(sgf_result_o0__1_carry_i_3__9_n_0));
  LUT6 #(
    .INIT(64'h6A6A6A6A6A95956A)) 
    sgf_result_o0__1_carry_i_4__9
       (.I0(sgf_result_o0__1_carry_i_1__9_n_0),
        .I1(sgf_result_o0__1_carry_i_10__12_n_0),
        .I2(sgf_result_o0__1_carry_i_3__9_n_0),
        .I3(\sgf_result_o[15]_0 [2]),
        .I4(\sgf_result_o[47] [3]),
        .I5(sgf_result_o0__1_carry_i_15__3_n_0),
        .O(sgf_result_o0__1_carry_i_4__9_n_0));
  LUT4 #(
    .INIT(16'hA99A)) 
    sgf_result_o0__1_carry_i_5__9
       (.I0(sgf_result_o0__1_carry_i_2__9_n_0),
        .I1(sgf_result_o0__1_carry_i_8__6_n_0),
        .I2(\sgf_result_o[47] [3]),
        .I3(\sgf_result_o[15]_0 [2]),
        .O(sgf_result_o0__1_carry_i_5__9_n_0));
  LUT6 #(
    .INIT(64'h141414EB14EB1414)) 
    sgf_result_o0__1_carry_i_6__6
       (.I0(sgf_result_o0__1_carry_i_16__4_n_0),
        .I1(\sgf_result_o[47] [3]),
        .I2(\sgf_result_o[15]_0 [2]),
        .I3(sgf_result_o0__1_carry_i_9__12_n_0),
        .I4(O[3]),
        .I5(\sgf_result_o[15] [2]),
        .O(sgf_result_o0__1_carry_i_6__6_n_0));
  LUT4 #(
    .INIT(16'h0660)) 
    sgf_result_o0__1_carry_i_7__9
       (.I0(\sgf_result_o[15] [2]),
        .I1(O[3]),
        .I2(\sgf_result_o[15]_0 [2]),
        .I3(\sgf_result_o[47] [3]),
        .O(sgf_result_o0__1_carry_i_7__9_n_0));
  CARRY4 sgf_result_o0__1_carry_i_8__10
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_i_8__10_n_0,sgf_result_o0__1_carry_i_8__10_n_1,sgf_result_o0__1_carry_i_8__10_n_2,sgf_result_o0__1_carry_i_8__10_n_3}),
        .CYINIT(1'b0),
        .DI(Data_B_i_IBUF[3:0]),
        .O(\sgf_result_o[47]_1 ),
        .S({sgf_result_o0__1_carry_i_12__0_n_0,sgf_result_o0__1_carry_i_13__1_n_0,sgf_result_o0__1_carry_i_14__2_n_0,sgf_result_o0__1_carry_i_15__0_n_0}));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_8__6
       (.I0(CO),
        .I1(\sgf_result_o[15] [1]),
        .I2(\sgf_result_o[15] [2]),
        .I3(O[3]),
        .I4(\sgf_result_o[15] [3]),
        .I5(\sgf_result_o[15] [0]),
        .O(sgf_result_o0__1_carry_i_8__6_n_0));
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_9__12
       (.I0(\sgf_result_o[15]_0 [2]),
        .I1(\sgf_result_o[47] [3]),
        .I2(\sgf_result_o[15]_0 [3]),
        .I3(\sgf_result_o[15]_0 [0]),
        .O(sgf_result_o0__1_carry_i_9__12_n_0));
  CARRY4 sgf_result_o0__1_carry_i_9__5
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_i_9__5_n_0,sgf_result_o0__1_carry_i_9__5_n_1,sgf_result_o0__1_carry_i_9__5_n_2,sgf_result_o0__1_carry_i_9__5_n_3}),
        .CYINIT(1'b0),
        .DI(Data_A_i_IBUF[3:0]),
        .O(\sgf_result_o[47]_2 ),
        .S({sgf_result_o0__1_carry_i_16__2_n_0,sgf_result_o0__1_carry_i_17__1_n_0,sgf_result_o0__1_carry_i_18__0_n_0,sgf_result_o0__1_carry_i_19__0_n_0}));
  CARRY4 sgf_result_o1__0_carry_i_13__2
       (.CI(sgf_result_o0__1_carry_i_8__10_n_0),
        .CO({sgf_result_o1__0_carry_i_13__2_n_0,sgf_result_o1__0_carry_i_13__2_n_1,sgf_result_o1__0_carry_i_13__2_n_2,sgf_result_o1__0_carry_i_13__2_n_3}),
        .CYINIT(1'b0),
        .DI(Data_B_i_IBUF[7:4]),
        .O(\sgf_result_o[47] ),
        .S({sgf_result_o1__0_carry_i_20_n_0,sgf_result_o1__0_carry_i_21_n_0,sgf_result_o1__0_carry_i_22_n_0,sgf_result_o1__0_carry_i_23_n_0}));
  CARRY4 sgf_result_o1__0_carry_i_18__1
       (.CI(sgf_result_o0__1_carry_i_9__5_n_0),
        .CO({sgf_result_o1__0_carry_i_18__1_n_0,sgf_result_o1__0_carry_i_18__1_n_1,sgf_result_o1__0_carry_i_18__1_n_2,sgf_result_o1__0_carry_i_18__1_n_3}),
        .CYINIT(1'b0),
        .DI(Data_A_i_IBUF[7:4]),
        .O(O),
        .S({sgf_result_o1__0_carry_i_25_n_0,sgf_result_o1__0_carry_i_26_n_0,sgf_result_o1__0_carry_i_27_n_0,sgf_result_o1__0_carry_i_28_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_20
       (.I0(Data_B_i_IBUF[7]),
        .I1(Data_B_i_IBUF[19]),
        .O(sgf_result_o1__0_carry_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_21
       (.I0(Data_B_i_IBUF[6]),
        .I1(Data_B_i_IBUF[18]),
        .O(sgf_result_o1__0_carry_i_21_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_22
       (.I0(Data_B_i_IBUF[5]),
        .I1(Data_B_i_IBUF[17]),
        .O(sgf_result_o1__0_carry_i_22_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_23
       (.I0(Data_B_i_IBUF[4]),
        .I1(Data_B_i_IBUF[16]),
        .O(sgf_result_o1__0_carry_i_23_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_25
       (.I0(Data_A_i_IBUF[7]),
        .I1(Data_A_i_IBUF[19]),
        .O(sgf_result_o1__0_carry_i_25_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_26
       (.I0(Data_A_i_IBUF[6]),
        .I1(Data_A_i_IBUF[18]),
        .O(sgf_result_o1__0_carry_i_26_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_27
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_A_i_IBUF[17]),
        .O(sgf_result_o1__0_carry_i_27_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_28
       (.I0(Data_A_i_IBUF[4]),
        .I1(Data_A_i_IBUF[16]),
        .O(sgf_result_o1__0_carry_i_28_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sgf_result_o1__35_carry_i_10__0
       (.I0(\EVEN1.middle_n_2 ),
        .I1(S_B0__0_carry_i_12__3_n_0),
        .O(sgf_result_o1__35_carry_i_10__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sgf_result_o1__35_carry_i_11
       (.I0(\EVEN1.middle_n_1 ),
        .I1(S_B0__0_carry_i_11__3_n_0),
        .O(sgf_result_o1__35_carry_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sgf_result_o1__35_carry_i_9__1
       (.I0(\EVEN1.middle_n_0 ),
        .I1(S_B0__0_carry__0_i_9__3_n_0),
        .O(sgf_result_o1__35_carry_i_9__1_n_0));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized36
   (O,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    DI,
    S,
    \Data_A_i[12] ,
    \Data_A_i[12]_0 ,
    \Data_B_i[12] ,
    \Data_A_i[12]_1 ,
    \Data_B_i[12]_0 ,
    \Data_A_i[12]_2 ,
    \Data_A_i[12]_3 ,
    \Data_A_i[12]_4 ,
    \Data_B_i[12]_1 ,
    \Data_A_i[12]_5 ,
    \Data_B_i[12]_2 ,
    \Data_A_i[12]_6 ,
    \Data_B_i[12]_3 ,
    \Data_A_i[12]_7 ,
    \Data_A_i[12]_8 ,
    \Data_A_i[12]_9 ,
    \Data_A_i[12]_10 ,
    \Data_A_i[12]_11 ,
    \Data_B_i[12]_4 );
  output [1:0]O;
  output [0:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [1:0]\sgf_result_o[47]_2 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_A_i[12] ;
  input [2:0]\Data_A_i[12]_0 ;
  input [1:0]\Data_B_i[12] ;
  input [1:0]\Data_A_i[12]_1 ;
  input \Data_B_i[12]_0 ;
  input \Data_A_i[12]_2 ;
  input \Data_A_i[12]_3 ;
  input \Data_A_i[12]_4 ;
  input \Data_B_i[12]_1 ;
  input \Data_A_i[12]_5 ;
  input \Data_B_i[12]_2 ;
  input \Data_A_i[12]_6 ;
  input \Data_B_i[12]_3 ;
  input \Data_A_i[12]_7 ;
  input [2:0]\Data_A_i[12]_8 ;
  input [0:0]\Data_A_i[12]_9 ;
  input [0:0]\Data_A_i[12]_10 ;
  input [0:0]\Data_A_i[12]_11 ;
  input [0:0]\Data_B_i[12]_4 ;

  wire [2:0]DI;
  wire [2:0]\Data_A_i[12] ;
  wire [2:0]\Data_A_i[12]_0 ;
  wire [1:0]\Data_A_i[12]_1 ;
  wire [0:0]\Data_A_i[12]_10 ;
  wire [0:0]\Data_A_i[12]_11 ;
  wire \Data_A_i[12]_2 ;
  wire \Data_A_i[12]_3 ;
  wire \Data_A_i[12]_4 ;
  wire \Data_A_i[12]_5 ;
  wire \Data_A_i[12]_6 ;
  wire \Data_A_i[12]_7 ;
  wire [2:0]\Data_A_i[12]_8 ;
  wire [0:0]\Data_A_i[12]_9 ;
  wire [1:0]\Data_B_i[12] ;
  wire \Data_B_i[12]_0 ;
  wire \Data_B_i[12]_1 ;
  wire \Data_B_i[12]_2 ;
  wire \Data_B_i[12]_3 ;
  wire [0:0]\Data_B_i[12]_4 ;
  wire [1:0]O;
  wire [3:0]S;
  wire S_B0__0_carry__0_i_1__3_n_0;
  wire S_B0__0_carry__0_i_2__3_n_0;
  wire S_B0__0_carry__0_i_4__3_n_0;
  wire S_B0__0_carry__0_i_5__3_n_0;
  wire S_B0__0_carry__0_i_6__3_n_0;
  wire S_B0__0_carry__0_n_1;
  wire S_B0__0_carry__0_n_2;
  wire S_B0__0_carry__0_n_3;
  wire S_B0__0_carry__0_n_4;
  wire S_B0__0_carry__0_n_6;
  wire S_B0__0_carry__0_n_7;
  wire S_B0__0_carry_i_1__3_n_0;
  wire S_B0__0_carry_i_2__3_n_0;
  wire S_B0__0_carry_i_3__3_n_0;
  wire S_B0__0_carry_i_4__3_n_0;
  wire S_B0__0_carry_i_5__3_n_0;
  wire S_B0__0_carry_i_6__3_n_0;
  wire S_B0__0_carry_i_7__3_n_0;
  wire S_B0__0_carry_n_0;
  wire S_B0__0_carry_n_1;
  wire S_B0__0_carry_n_2;
  wire S_B0__0_carry_n_3;
  wire S_B0__0_carry_n_4;
  wire S_B0__0_carry_n_6;
  wire sgf_result_o0__1_carry__0_n_1;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_4;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire sgf_result_o1__35_carry_i_10_n_0;
  wire sgf_result_o1__35_carry_i_11__0__0_n_0;
  wire sgf_result_o1__35_carry_i_11__0_n_0;
  wire sgf_result_o1__35_carry_i_12_n_0;
  wire sgf_result_o1__35_carry_i_13_n_0;
  wire sgf_result_o1__35_carry_i_8__1_n_0;
  wire sgf_result_o1__35_carry_i_8__1_n_1;
  wire sgf_result_o1__35_carry_i_8__1_n_2;
  wire sgf_result_o1__35_carry_i_8__1_n_3;
  wire sgf_result_o1__35_carry_i_9__0_n_3;
  wire sgf_result_o1__35_carry_i_9_n_0;
  wire sgf_result_o1__35_carry_i_9_n_1;
  wire sgf_result_o1__35_carry_i_9_n_2;
  wire sgf_result_o1__35_carry_i_9_n_3;
  wire [0:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [1:0]\sgf_result_o[47]_2 ;
  wire [3:3]NLW_S_B0__0_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:1]NLW_sgf_result_o1__35_carry_i_9__0_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o1__35_carry_i_9__0_O_UNCONNECTED;

  CARRY4 S_B0__0_carry
       (.CI(1'b0),
        .CO({S_B0__0_carry_n_0,S_B0__0_carry_n_1,S_B0__0_carry_n_2,S_B0__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({S_B0__0_carry_i_1__3_n_0,S_B0__0_carry_i_2__3_n_0,S_B0__0_carry_i_3__3_n_0,1'b1}),
        .O({S_B0__0_carry_n_4,O[1],S_B0__0_carry_n_6,O[0]}),
        .S({S_B0__0_carry_i_4__3_n_0,S_B0__0_carry_i_5__3_n_0,S_B0__0_carry_i_6__3_n_0,S_B0__0_carry_i_7__3_n_0}));
  CARRY4 S_B0__0_carry__0
       (.CI(S_B0__0_carry_n_0),
        .CO({NLW_S_B0__0_carry__0_CO_UNCONNECTED[3],S_B0__0_carry__0_n_1,S_B0__0_carry__0_n_2,S_B0__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,sgf_result_o0__1_carry__0_n_5,S_B0__0_carry__0_i_1__3_n_0,S_B0__0_carry__0_i_2__3_n_0}),
        .O({S_B0__0_carry__0_n_4,\sgf_result_o[47] ,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .S({sgf_result_o0__1_carry__0_n_4,S_B0__0_carry__0_i_4__3_n_0,S_B0__0_carry__0_i_5__3_n_0,S_B0__0_carry__0_i_6__3_n_0}));
  (* HLUTNM = "lutpair47" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    S_B0__0_carry__0_i_1__3
       (.I0(\Data_B_i[12]_3 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[12]_7 ),
        .O(S_B0__0_carry__0_i_1__3_n_0));
  (* HLUTNM = "lutpair46" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    S_B0__0_carry__0_i_2__3
       (.I0(\Data_B_i[12]_2 ),
        .I1(\Data_A_i[12]_6 ),
        .I2(sgf_result_o0__1_carry_n_4),
        .O(S_B0__0_carry__0_i_2__3_n_0));
  LUT4 #(
    .INIT(16'h4DB2)) 
    S_B0__0_carry__0_i_4__3
       (.I0(\Data_A_i[12]_3 ),
        .I1(\Data_A_i[12]_4 ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .I3(sgf_result_o0__1_carry__0_n_5),
        .O(S_B0__0_carry__0_i_4__3_n_0));
  LUT4 #(
    .INIT(16'h9669)) 
    S_B0__0_carry__0_i_5__3
       (.I0(S_B0__0_carry__0_i_1__3_n_0),
        .I1(\Data_A_i[12]_3 ),
        .I2(\Data_A_i[12]_4 ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(S_B0__0_carry__0_i_5__3_n_0));
  (* HLUTNM = "lutpair47" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry__0_i_6__3
       (.I0(\Data_B_i[12]_3 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[12]_7 ),
        .I3(S_B0__0_carry__0_i_2__3_n_0),
        .O(S_B0__0_carry__0_i_6__3_n_0));
  (* HLUTNM = "lutpair45" *) 
  LUT3 #(
    .INIT(8'h71)) 
    S_B0__0_carry_i_1__3
       (.I0(\Data_B_i[12]_1 ),
        .I1(\Data_A_i[12]_5 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .O(S_B0__0_carry_i_1__3_n_0));
  LUT6 #(
    .INIT(64'h87770000FFFF8777)) 
    S_B0__0_carry_i_2__3
       (.I0(\Data_B_i[12] [1]),
        .I1(\Data_A_i[12]_1 [0]),
        .I2(\Data_A_i[12]_1 [1]),
        .I3(\Data_B_i[12] [0]),
        .I4(sgf_result_o0__1_carry_n_6),
        .I5(\Data_B_i[12]_0 ),
        .O(S_B0__0_carry_i_2__3_n_0));
  (* HLUTNM = "lutpair87" *) 
  LUT5 #(
    .INIT(32'h2ABFBFBF)) 
    S_B0__0_carry_i_3__3
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\Data_A_i[12]_11 ),
        .I2(\Data_B_i[12]_4 ),
        .I3(\Data_A_i[12]_1 [0]),
        .I4(\Data_B_i[12] [0]),
        .O(S_B0__0_carry_i_3__3_n_0));
  (* HLUTNM = "lutpair46" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_4__3
       (.I0(\Data_B_i[12]_2 ),
        .I1(\Data_A_i[12]_6 ),
        .I2(sgf_result_o0__1_carry_n_4),
        .I3(S_B0__0_carry_i_1__3_n_0),
        .O(S_B0__0_carry_i_4__3_n_0));
  (* HLUTNM = "lutpair45" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_5__3
       (.I0(\Data_B_i[12]_1 ),
        .I1(\Data_A_i[12]_5 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .I3(S_B0__0_carry_i_2__3_n_0),
        .O(S_B0__0_carry_i_5__3_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_6__3
       (.I0(S_B0__0_carry_i_3__3_n_0),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_B_i[12]_0 ),
        .I3(\Data_A_i[12]_2 ),
        .O(S_B0__0_carry_i_6__3_n_0));
  (* HLUTNM = "lutpair87" *) 
  LUT5 #(
    .INIT(32'h6A959595)) 
    S_B0__0_carry_i_7__3
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\Data_A_i[12]_11 ),
        .I2(\Data_B_i[12]_4 ),
        .I3(\Data_A_i[12]_1 [0]),
        .I4(\Data_B_i[12] [0]),
        .O(S_B0__0_carry_i_7__3_n_0));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_1,sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_A_i[12] }),
        .O({sgf_result_o0__1_carry__0_n_4,sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[12]_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__35_carry_i_10
       (.I0(S_B0__0_carry_n_6),
        .I1(\Data_B_i[12]_3 ),
        .O(sgf_result_o1__35_carry_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__35_carry_i_11__0
       (.I0(S_B0__0_carry__0_n_6),
        .I1(\Data_A_i[12]_5 ),
        .O(sgf_result_o1__35_carry_i_11__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__35_carry_i_11__0__0
       (.I0(S_B0__0_carry__0_n_4),
        .I1(\Data_A_i[12]_7 ),
        .O(sgf_result_o1__35_carry_i_11__0__0_n_0));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    sgf_result_o1__35_carry_i_12
       (.I0(S_B0__0_carry__0_n_7),
        .I1(\Data_B_i[12] [0]),
        .I2(\Data_A_i[12]_1 [1]),
        .I3(\Data_A_i[12]_1 [0]),
        .I4(\Data_B_i[12] [1]),
        .O(sgf_result_o1__35_carry_i_12_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    sgf_result_o1__35_carry_i_13
       (.I0(S_B0__0_carry_n_4),
        .I1(\Data_A_i[12]_1 [0]),
        .I2(\Data_B_i[12] [0]),
        .O(sgf_result_o1__35_carry_i_13_n_0));
  CARRY4 sgf_result_o1__35_carry_i_8__1
       (.CI(1'b0),
        .CO({sgf_result_o1__35_carry_i_8__1_n_0,sgf_result_o1__35_carry_i_8__1_n_1,sgf_result_o1__35_carry_i_8__1_n_2,sgf_result_o1__35_carry_i_8__1_n_3}),
        .CYINIT(1'b0),
        .DI({O[1],S_B0__0_carry_n_6,O[0],1'b0}),
        .O(\sgf_result_o[47]_0 ),
        .S({\Data_A_i[12]_8 [2],sgf_result_o1__35_carry_i_10_n_0,\Data_A_i[12]_8 [1:0]}));
  CARRY4 sgf_result_o1__35_carry_i_9
       (.CI(sgf_result_o1__35_carry_i_8__1_n_0),
        .CO({sgf_result_o1__35_carry_i_9_n_0,sgf_result_o1__35_carry_i_9_n_1,sgf_result_o1__35_carry_i_9_n_2,sgf_result_o1__35_carry_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({\sgf_result_o[47] ,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7,S_B0__0_carry_n_4}),
        .O(\sgf_result_o[47]_1 ),
        .S({\Data_A_i[12]_9 ,sgf_result_o1__35_carry_i_11__0_n_0,sgf_result_o1__35_carry_i_12_n_0,sgf_result_o1__35_carry_i_13_n_0}));
  CARRY4 sgf_result_o1__35_carry_i_9__0
       (.CI(sgf_result_o1__35_carry_i_9_n_0),
        .CO({NLW_sgf_result_o1__35_carry_i_9__0_CO_UNCONNECTED[3:1],sgf_result_o1__35_carry_i_9__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,S_B0__0_carry__0_n_4}),
        .O({NLW_sgf_result_o1__35_carry_i_9__0_O_UNCONNECTED[3:2],\sgf_result_o[47]_2 }),
        .S({1'b0,1'b0,\Data_A_i[12]_10 ,sgf_result_o1__35_carry_i_11__0__0_n_0}));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized37
   (\sgf_result_o[47] ,
    DI,
    S,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[47]_6 ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[12] ,
    \Data_B_i[12]_0 ,
    \Data_A_i[12] ,
    O,
    \Data_B_i[12]_1 ,
    Q_middle_temp__5,
    \Data_A_i[12]_0 ,
    sgf_result_o1,
    sgf_result_o_OBUF,
    \Data_B_i[12]_2 ,
    \Data_A_i[12]_1 ,
    \Data_B_i[12]_3 ,
    \Data_A_i[17] ,
    \Data_A_i[23] ,
    \Data_B_i[12]_4 ,
    \Data_B_i[12]_5 ,
    \Data_A_i[12]_2 ,
    \Data_B_i[17] ,
    \Data_B_i[17]_0 ,
    \Data_A_i[14] ,
    \Data_A_i[14]_0 ,
    \Data_A_i[13] ,
    \Data_A_i[13]_0 ,
    \Data_A_i[13]_1 ,
    \Data_A_i[13]_2 ,
    \Data_A_i[13]_3 ,
    \Data_A_i[13]_4 ,
    \Data_A_i[14]_1 ,
    \Data_A_i[11] ,
    \Data_A_i[14]_2 ,
    \Data_A_i[14]_3 ,
    \Data_A_i[14]_4 ,
    \Data_A_i[14]_5 ,
    \Data_A_i[11]_0 ,
    \Data_A_i[2] ,
    \Data_A_i[2]_0 ,
    \Data_A_i[2]_1 ,
    \Data_A_i[23]_0 ,
    \Data_A_i[14]_6 );
  output [2:0]\sgf_result_o[47] ;
  output [1:0]DI;
  output [3:0]S;
  output [3:0]\sgf_result_o[47]_0 ;
  output [2:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [0:0]\sgf_result_o[47]_3 ;
  output [3:0]\sgf_result_o[47]_4 ;
  output [18:0]\sgf_result_o[47]_5 ;
  output [36:0]\sgf_result_o[47]_6 ;
  input [3:0]Data_B_i_IBUF;
  input [3:0]Data_A_i_IBUF;
  input \Data_B_i[12] ;
  input [3:0]\Data_B_i[12]_0 ;
  input [3:0]\Data_A_i[12] ;
  input [2:0]O;
  input [2:0]\Data_B_i[12]_1 ;
  input [11:0]Q_middle_temp__5;
  input [1:0]\Data_A_i[12]_0 ;
  input [15:0]sgf_result_o1;
  input [5:0]sgf_result_o_OBUF;
  input [2:0]\Data_B_i[12]_2 ;
  input [0:0]\Data_A_i[12]_1 ;
  input [3:0]\Data_B_i[12]_3 ;
  input [2:0]\Data_A_i[17] ;
  input [3:0]\Data_A_i[23] ;
  input [3:0]\Data_B_i[12]_4 ;
  input [3:0]\Data_B_i[12]_5 ;
  input [3:0]\Data_A_i[12]_2 ;
  input [0:0]\Data_B_i[17] ;
  input [0:0]\Data_B_i[17]_0 ;
  input [3:0]\Data_A_i[14] ;
  input [3:0]\Data_A_i[14]_0 ;
  input [3:0]\Data_A_i[13] ;
  input [3:0]\Data_A_i[13]_0 ;
  input [3:0]\Data_A_i[13]_1 ;
  input [3:0]\Data_A_i[13]_2 ;
  input [3:0]\Data_A_i[13]_3 ;
  input [3:0]\Data_A_i[13]_4 ;
  input [0:0]\Data_A_i[14]_1 ;
  input [0:0]\Data_A_i[11] ;
  input [0:0]\Data_A_i[14]_2 ;
  input [3:0]\Data_A_i[14]_3 ;
  input [3:0]\Data_A_i[14]_4 ;
  input [0:0]\Data_A_i[14]_5 ;
  input [0:0]\Data_A_i[11]_0 ;
  input [3:0]\Data_A_i[2] ;
  input [3:0]\Data_A_i[2]_0 ;
  input [2:0]\Data_A_i[2]_1 ;
  input [3:0]\Data_A_i[23]_0 ;
  input [0:0]\Data_A_i[14]_6 ;

  wire [1:0]DI;
  wire [0:0]\Data_A_i[11] ;
  wire [0:0]\Data_A_i[11]_0 ;
  wire [3:0]\Data_A_i[12] ;
  wire [1:0]\Data_A_i[12]_0 ;
  wire [0:0]\Data_A_i[12]_1 ;
  wire [3:0]\Data_A_i[12]_2 ;
  wire [3:0]\Data_A_i[13] ;
  wire [3:0]\Data_A_i[13]_0 ;
  wire [3:0]\Data_A_i[13]_1 ;
  wire [3:0]\Data_A_i[13]_2 ;
  wire [3:0]\Data_A_i[13]_3 ;
  wire [3:0]\Data_A_i[13]_4 ;
  wire [3:0]\Data_A_i[14] ;
  wire [3:0]\Data_A_i[14]_0 ;
  wire [0:0]\Data_A_i[14]_1 ;
  wire [0:0]\Data_A_i[14]_2 ;
  wire [3:0]\Data_A_i[14]_3 ;
  wire [3:0]\Data_A_i[14]_4 ;
  wire [0:0]\Data_A_i[14]_5 ;
  wire [0:0]\Data_A_i[14]_6 ;
  wire [2:0]\Data_A_i[17] ;
  wire [3:0]\Data_A_i[23] ;
  wire [3:0]\Data_A_i[23]_0 ;
  wire [3:0]\Data_A_i[2] ;
  wire [3:0]\Data_A_i[2]_0 ;
  wire [2:0]\Data_A_i[2]_1 ;
  wire [3:0]Data_A_i_IBUF;
  wire \Data_B_i[12] ;
  wire [3:0]\Data_B_i[12]_0 ;
  wire [2:0]\Data_B_i[12]_1 ;
  wire [2:0]\Data_B_i[12]_2 ;
  wire [3:0]\Data_B_i[12]_3 ;
  wire [3:0]\Data_B_i[12]_4 ;
  wire [3:0]\Data_B_i[12]_5 ;
  wire [0:0]\Data_B_i[17] ;
  wire [0:0]\Data_B_i[17]_0 ;
  wire [3:0]Data_B_i_IBUF;
  wire [2:0]O;
  wire \ODD1.middle_n_0 ;
  wire \ODD1.middle_n_1 ;
  wire \ODD1.middle_n_10 ;
  wire \ODD1.middle_n_11 ;
  wire \ODD1.middle_n_12 ;
  wire \ODD1.middle_n_13 ;
  wire \ODD1.middle_n_14 ;
  wire \ODD1.middle_n_15 ;
  wire \ODD1.middle_n_16 ;
  wire \ODD1.middle_n_17 ;
  wire \ODD1.middle_n_18 ;
  wire \ODD1.middle_n_19 ;
  wire \ODD1.middle_n_2 ;
  wire \ODD1.middle_n_20 ;
  wire \ODD1.middle_n_21 ;
  wire \ODD1.middle_n_3 ;
  wire \ODD1.middle_n_4 ;
  wire \ODD1.middle_n_5 ;
  wire \ODD1.middle_n_6 ;
  wire \ODD1.middle_n_7 ;
  wire \ODD1.middle_n_8 ;
  wire \ODD1.middle_n_9 ;
  wire \ODD1.right_lower_n_10 ;
  wire \ODD1.right_lower_n_11 ;
  wire \ODD1.right_lower_n_12 ;
  wire \ODD1.right_lower_n_13 ;
  wire \ODD1.right_lower_n_14 ;
  wire \ODD1.right_lower_n_15 ;
  wire \ODD1.right_lower_n_16 ;
  wire \ODD1.right_lower_n_17 ;
  wire \ODD1.right_lower_n_18 ;
  wire \ODD1.right_lower_n_19 ;
  wire \ODD1.right_lower_n_20 ;
  wire \ODD1.right_lower_n_21 ;
  wire \ODD1.right_lower_n_22 ;
  wire \ODD1.right_lower_n_23 ;
  wire \ODD1.right_lower_n_3 ;
  wire \ODD1.right_lower_n_4 ;
  wire \ODD1.right_lower_n_5 ;
  wire \ODD1.right_lower_n_6 ;
  wire \ODD1.right_lower_n_7 ;
  wire \ODD1.right_lower_n_8 ;
  wire \ODD1.right_lower_n_9 ;
  wire [9:2]Q_middle_temp__3;
  wire [11:0]Q_middle_temp__5;
  wire [25:25]Q_middle_temp__6;
  wire [3:0]S;
  wire sgf_result_o0__1_carry__0_i_1__7_n_0;
  wire sgf_result_o0__1_carry__0_i_2__6_n_0;
  wire sgf_result_o0__1_carry__0_i_3__7_n_0;
  wire sgf_result_o0__1_carry__0_i_4__7_n_0;
  wire sgf_result_o0__1_carry__0_i_5__8_n_0;
  wire sgf_result_o0__1_carry__0_i_6__6_n_0;
  wire sgf_result_o0__1_carry__0_i_7__3_n_0;
  wire sgf_result_o0__1_carry__0_i_8__6_n_0;
  wire sgf_result_o0__1_carry__0_i_9__3_n_0;
  wire sgf_result_o0__1_carry_i_10__2_n_0;
  wire sgf_result_o0__1_carry_i_11__7_n_0;
  wire sgf_result_o0__1_carry_i_1__7_n_0;
  wire sgf_result_o0__1_carry_i_2__7_n_0;
  wire sgf_result_o0__1_carry_i_3__7_n_0;
  wire sgf_result_o0__1_carry_i_4__7_n_0;
  wire sgf_result_o0__1_carry_i_5__7_n_0;
  wire sgf_result_o0__1_carry_i_6__5_n_0;
  wire sgf_result_o0__1_carry_i_7__7_n_0;
  wire sgf_result_o0_carry__0_i_1_n_0;
  wire sgf_result_o0_carry__0_i_2_n_0;
  wire sgf_result_o0_carry__0_i_3_n_0;
  wire sgf_result_o0_carry__0_i_5_n_0;
  wire sgf_result_o0_carry__0_n_0;
  wire sgf_result_o0_carry__0_n_1;
  wire sgf_result_o0_carry__0_n_2;
  wire sgf_result_o0_carry__0_n_3;
  wire sgf_result_o0_carry__0_n_4;
  wire sgf_result_o0_carry__0_n_5;
  wire sgf_result_o0_carry__0_n_6;
  wire sgf_result_o0_carry__0_n_7;
  wire sgf_result_o0_carry__1_i_1_n_0;
  wire sgf_result_o0_carry__1_i_2_n_0;
  wire sgf_result_o0_carry__1_i_3_n_0;
  wire sgf_result_o0_carry__1_n_2;
  wire sgf_result_o0_carry__1_n_3;
  wire sgf_result_o0_carry__1_n_5;
  wire sgf_result_o0_carry__1_n_6;
  wire sgf_result_o0_carry__1_n_7;
  wire sgf_result_o0_carry_n_0;
  wire sgf_result_o0_carry_n_1;
  wire sgf_result_o0_carry_n_2;
  wire sgf_result_o0_carry_n_3;
  wire sgf_result_o0_carry_n_4;
  wire sgf_result_o0_carry_n_5;
  wire sgf_result_o0_carry_n_6;
  wire sgf_result_o0_carry_n_7;
  wire [15:0]sgf_result_o1;
  wire sgf_result_o1__0_carry__0_i_6__1_n_0;
  wire sgf_result_o1__0_carry__0_i_7__1_n_0;
  wire sgf_result_o1__0_carry_i_10__1_n_0;
  wire sgf_result_o1__0_carry_i_11__1_n_0;
  wire sgf_result_o1__0_carry_i_14__1_n_0;
  wire sgf_result_o1__0_carry_i_15__1_n_0;
  wire sgf_result_o1__0_carry_i_16__1_n_0;
  wire sgf_result_o1__0_carry_i_17__1_n_0;
  wire sgf_result_o1__0_carry_i_19__1_n_0;
  wire sgf_result_o1__0_carry_i_24_n_0;
  wire sgf_result_o1__0_carry_i_8__1_n_0;
  wire sgf_result_o1__0_carry_i_9__1_n_0;
  wire sgf_result_o1__21_carry__0_i_10__1_n_0;
  wire sgf_result_o1__21_carry__0_i_9__1_n_0;
  wire sgf_result_o1__21_carry__0_n_0;
  wire sgf_result_o1__21_carry__0_n_1;
  wire sgf_result_o1__21_carry__0_n_2;
  wire sgf_result_o1__21_carry__0_n_3;
  wire sgf_result_o1__21_carry__0_n_4;
  wire sgf_result_o1__21_carry__0_n_5;
  wire sgf_result_o1__21_carry__0_n_6;
  wire sgf_result_o1__21_carry__0_n_7;
  wire sgf_result_o1__21_carry__1_i_1__1_n_0;
  wire sgf_result_o1__21_carry__1_n_3;
  wire sgf_result_o1__21_carry__1_n_6;
  wire sgf_result_o1__21_carry__1_n_7;
  wire sgf_result_o1__21_carry_i_10__1_n_0;
  wire sgf_result_o1__21_carry_i_8__1_n_0;
  wire sgf_result_o1__21_carry_i_9__1_n_0;
  wire sgf_result_o1__21_carry_n_0;
  wire sgf_result_o1__21_carry_n_1;
  wire sgf_result_o1__21_carry_n_2;
  wire sgf_result_o1__21_carry_n_3;
  wire sgf_result_o1__21_carry_n_4;
  wire sgf_result_o1__21_carry_n_5;
  wire sgf_result_o1__21_carry_n_6;
  wire sgf_result_o1__21_carry_n_7;
  wire sgf_result_o1_carry__0_n_1;
  wire sgf_result_o1_carry__0_n_2;
  wire sgf_result_o1_carry__0_n_3;
  wire sgf_result_o1_carry_i_4__1_n_0;
  wire sgf_result_o1_carry_i_5__1_n_0;
  wire sgf_result_o1_carry_n_0;
  wire sgf_result_o1_carry_n_1;
  wire sgf_result_o1_carry_n_2;
  wire sgf_result_o1_carry_n_3;
  wire [2:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [2:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [0:0]\sgf_result_o[47]_3 ;
  wire [3:0]\sgf_result_o[47]_4 ;
  wire [18:0]\sgf_result_o[47]_5 ;
  wire [36:0]\sgf_result_o[47]_6 ;
  wire [5:0]sgf_result_o_OBUF;
  wire \sgf_result_o_OBUF[22]_inst_i_10_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_12_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_13_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_14_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_8_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_9_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_16_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_16_n_1 ;
  wire \sgf_result_o_OBUF[26]_inst_i_16_n_2 ;
  wire \sgf_result_o_OBUF[26]_inst_i_16_n_3 ;
  wire \sgf_result_o_OBUF[26]_inst_i_20_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_21_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_22_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_15_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_15_n_1 ;
  wire \sgf_result_o_OBUF[30]_inst_i_15_n_2 ;
  wire \sgf_result_o_OBUF[30]_inst_i_15_n_3 ;
  wire \sgf_result_o_OBUF[30]_inst_i_16_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_17_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_18_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_19_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_16_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_16_n_1 ;
  wire \sgf_result_o_OBUF[34]_inst_i_16_n_2 ;
  wire \sgf_result_o_OBUF[34]_inst_i_16_n_3 ;
  wire \sgf_result_o_OBUF[38]_inst_i_20_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_20_n_1 ;
  wire \sgf_result_o_OBUF[38]_inst_i_20_n_2 ;
  wire \sgf_result_o_OBUF[38]_inst_i_20_n_3 ;
  wire \sgf_result_o_OBUF[38]_inst_i_8_n_1 ;
  wire \sgf_result_o_OBUF[38]_inst_i_8_n_2 ;
  wire \sgf_result_o_OBUF[38]_inst_i_8_n_3 ;
  wire \sgf_result_o_OBUF[38]_inst_i_9_n_0 ;
  wire [3:2]NLW_sgf_result_o0_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0_carry__1_O_UNCONNECTED;
  wire [3:1]NLW_sgf_result_o1__21_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o1__21_carry__1_O_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o1_carry__0_CO_UNCONNECTED;
  wire [3:3]\NLW_sgf_result_o_OBUF[38]_inst_i_8_CO_UNCONNECTED ;

  Recursive_KOA__parameterized40 \ODD1.middle 
       (.CO(\ODD1.right_lower_n_3 ),
        .\Data_A_i[12] (\Data_A_i[12] ),
        .\Data_A_i[12]_0 (O),
        .\Data_A_i[12]_1 (Q_middle_temp__3[8:7]),
        .\Data_A_i[16] (sgf_result_o1__0_carry_i_14__1_n_0),
        .\Data_A_i[16]_0 (sgf_result_o1__0_carry__0_i_7__1_n_0),
        .\Data_A_i[16]_1 (sgf_result_o1__0_carry_i_8__1_n_0),
        .\Data_A_i[16]_2 (sgf_result_o1__0_carry_i_9__1_n_0),
        .\Data_A_i[16]_3 (sgf_result_o1__0_carry_i_17__1_n_0),
        .\Data_A_i[16]_4 (sgf_result_o1__0_carry_i_10__1_n_0),
        .\Data_B_i[12] (\Data_B_i[12]_0 ),
        .\Data_B_i[12]_0 (\Data_B_i[12]_1 ),
        .\Data_B_i[12]_1 (sgf_result_o1__0_carry__0_i_6__1_n_0),
        .\Data_B_i[12]_2 (sgf_result_o1__0_carry_i_16__1_n_0),
        .\Data_B_i[16] (sgf_result_o1__0_carry_i_15__1_n_0),
        .\Data_B_i[16]_0 (sgf_result_o1__0_carry_i_11__1_n_0),
        .O({\ODD1.middle_n_0 ,\ODD1.middle_n_1 ,\ODD1.middle_n_2 ,\ODD1.middle_n_3 }),
        .S({\ODD1.middle_n_14 ,\ODD1.middle_n_15 ,\ODD1.middle_n_16 }),
        .\sgf_result_o[47] ({\ODD1.middle_n_4 ,\ODD1.middle_n_5 }),
        .\sgf_result_o[47]_0 (\ODD1.middle_n_6 ),
        .\sgf_result_o[47]_1 (\ODD1.middle_n_7 ),
        .\sgf_result_o[47]_2 (\ODD1.middle_n_8 ),
        .\sgf_result_o[47]_3 (\ODD1.middle_n_9 ),
        .\sgf_result_o[47]_4 (\ODD1.middle_n_10 ),
        .\sgf_result_o[47]_5 (\ODD1.middle_n_11 ),
        .\sgf_result_o[47]_6 (\ODD1.middle_n_12 ),
        .\sgf_result_o[47]_7 (\ODD1.middle_n_13 ),
        .\sgf_result_o[47]_8 ({\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 }),
        .\sgf_result_o[47]_9 (\ODD1.middle_n_21 ));
  Recursive_KOA__parameterized39 \ODD1.right_lower 
       (.CO(\ODD1.right_lower_n_3 ),
        .DI({sgf_result_o0__1_carry_i_1__7_n_0,sgf_result_o0__1_carry_i_2__7_n_0,sgf_result_o0__1_carry_i_3__7_n_0}),
        .\Data_A_i[11] (\Data_A_i[11] ),
        .\Data_A_i[11]_0 (\Data_A_i[11]_0 ),
        .\Data_A_i[12] ({sgf_result_o0__1_carry__0_i_4__7_n_0,sgf_result_o0__1_carry__0_i_5__8_n_0,sgf_result_o0__1_carry__0_i_6__6_n_0}),
        .\Data_A_i[12]_0 (O[1:0]),
        .\Data_A_i[12]_1 (sgf_result_o1__21_carry_i_10__1_n_0),
        .\Data_A_i[12]_2 ({sgf_result_o1__21_carry_n_4,sgf_result_o1__21_carry_n_5,sgf_result_o1__21_carry_n_6,sgf_result_o1__21_carry_n_7}),
        .\Data_A_i[12]_3 (sgf_result_o1__21_carry_i_8__1_n_0),
        .\Data_A_i[12]_4 (sgf_result_o1__21_carry_i_9__1_n_0),
        .\Data_A_i[12]_5 (sgf_result_o1__21_carry__0_i_10__1_n_0),
        .\Data_A_i[12]_6 (sgf_result_o0_carry_n_7),
        .\Data_A_i[12]_7 (\sgf_result_o[47]_5 [18]),
        .\Data_A_i[12]_8 ({\sgf_result_o_OBUF[38]_inst_i_9_n_0 ,\Data_A_i[14]_1 }),
        .\Data_A_i[12]_9 (\Data_A_i[12] [0]),
        .\Data_A_i[13] (\Data_A_i[13] ),
        .\Data_A_i[13]_0 (\Data_A_i[13]_0 ),
        .\Data_A_i[13]_1 (\Data_A_i[13]_1 ),
        .\Data_A_i[13]_2 (\Data_A_i[13]_2 ),
        .\Data_A_i[13]_3 (\Data_A_i[13]_3 ),
        .\Data_A_i[13]_4 (\Data_A_i[13]_4 ),
        .\Data_A_i[14] (\Data_A_i[14] ),
        .\Data_A_i[14]_0 (\Data_A_i[14]_0 ),
        .\Data_A_i[14]_1 (\Data_A_i[14]_2 ),
        .\Data_A_i[14]_2 (\Data_A_i[14]_3 ),
        .\Data_A_i[14]_3 (\Data_A_i[14]_4 ),
        .\Data_A_i[14]_4 (\Data_A_i[14]_5 ),
        .\Data_A_i[14]_5 (\Data_A_i[14]_6 ),
        .\Data_A_i[17] (\Data_A_i[17] ),
        .\Data_A_i[23] (\Data_A_i[23] ),
        .\Data_A_i[23]_0 (\Data_A_i[23]_0 ),
        .\Data_A_i[2] (\Data_A_i[2] ),
        .\Data_A_i[2]_0 (\Data_A_i[2]_0 ),
        .\Data_A_i[2]_1 (\Data_A_i[2]_1 ),
        .Data_A_i_IBUF(Data_A_i_IBUF),
        .\Data_B_i[12] ({sgf_result_o0__1_carry__0_i_1__7_n_0,sgf_result_o0__1_carry__0_i_2__6_n_0,sgf_result_o0__1_carry__0_i_3__7_n_0}),
        .\Data_B_i[12]_0 (\Data_B_i[12] ),
        .\Data_B_i[12]_1 (\Data_B_i[12]_1 [1:0]),
        .\Data_B_i[12]_2 (sgf_result_o1__21_carry__0_i_9__1_n_0),
        .\Data_B_i[12]_3 (\Data_B_i[12]_0 [0]),
        .\Data_B_i[16] (sgf_result_o1__0_carry_i_11__1_n_0),
        .\Data_B_i[17] ({\Data_B_i[17] ,\sgf_result_o_OBUF[22]_inst_i_8_n_0 ,\sgf_result_o_OBUF[22]_inst_i_9_n_0 ,\sgf_result_o_OBUF[22]_inst_i_10_n_0 }),
        .\Data_B_i[17]_0 ({\Data_B_i[17]_0 ,\sgf_result_o_OBUF[22]_inst_i_12_n_0 ,\sgf_result_o_OBUF[22]_inst_i_13_n_0 ,\sgf_result_o_OBUF[22]_inst_i_14_n_0 }),
        .Data_B_i_IBUF(Data_B_i_IBUF),
        .O(\sgf_result_o[47] ),
        .Q_middle_temp__3(Q_middle_temp__3[7:2]),
        .S({sgf_result_o0__1_carry_i_4__7_n_0,sgf_result_o0__1_carry_i_5__7_n_0,sgf_result_o0__1_carry_i_6__5_n_0,sgf_result_o0__1_carry_i_7__7_n_0}),
        .\sgf_result_o[47] ({\ODD1.right_lower_n_4 ,\ODD1.right_lower_n_5 ,\ODD1.right_lower_n_6 }),
        .\sgf_result_o[47]_0 ({\ODD1.right_lower_n_7 ,\ODD1.right_lower_n_8 ,\ODD1.right_lower_n_9 ,\ODD1.right_lower_n_10 }),
        .\sgf_result_o[47]_1 ({\ODD1.right_lower_n_11 ,\ODD1.right_lower_n_12 ,\ODD1.right_lower_n_13 ,\ODD1.right_lower_n_14 }),
        .\sgf_result_o[47]_2 ({\ODD1.right_lower_n_15 ,\ODD1.right_lower_n_16 ,\ODD1.right_lower_n_17 ,\ODD1.right_lower_n_18 }),
        .\sgf_result_o[47]_3 ({\ODD1.right_lower_n_19 ,\ODD1.right_lower_n_20 ,\ODD1.right_lower_n_21 ,\ODD1.right_lower_n_22 }),
        .\sgf_result_o[47]_4 (\ODD1.right_lower_n_23 ),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_6 ),
        .sgf_result_o_OBUF(sgf_result_o_OBUF[2:0]));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_1__7
       (.I0(\Data_A_i[12] [3]),
        .I1(\Data_B_i[12]_0 [3]),
        .O(sgf_result_o0__1_carry__0_i_1__7_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    sgf_result_o0__1_carry__0_i_2__6
       (.I0(sgf_result_o0__1_carry_i_10__2_n_0),
        .I1(\Data_B_i[12]_0 [1]),
        .I2(\Data_A_i[12] [0]),
        .I3(\Data_B_i[12]_0 [0]),
        .I4(\Data_A_i[12] [3]),
        .I5(sgf_result_o0__1_carry__0_i_7__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__6_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    sgf_result_o0__1_carry__0_i_3__7
       (.I0(sgf_result_o0__1_carry_i_10__2_n_0),
        .I1(\Data_B_i[12]_0 [1]),
        .I2(\Data_A_i[12] [0]),
        .I3(\Data_B_i[12]_0 [0]),
        .I4(\Data_A_i[12] [3]),
        .I5(sgf_result_o0__1_carry__0_i_7__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__7_n_0));
  LUT6 #(
    .INIT(64'h173F8080C0000000)) 
    sgf_result_o0__1_carry__0_i_4__7
       (.I0(\Data_B_i[12]_0 [1]),
        .I1(\Data_A_i[12] [2]),
        .I2(\Data_B_i[12]_0 [2]),
        .I3(\Data_A_i[12] [1]),
        .I4(\Data_B_i[12]_0 [3]),
        .I5(\Data_A_i[12] [3]),
        .O(sgf_result_o0__1_carry__0_i_4__7_n_0));
  LUT6 #(
    .INIT(64'h9666699969996999)) 
    sgf_result_o0__1_carry__0_i_5__8
       (.I0(sgf_result_o0__1_carry__0_i_2__6_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__6_n_0),
        .I2(\Data_A_i[12] [3]),
        .I3(\Data_B_i[12]_0 [2]),
        .I4(\Data_A_i[12] [2]),
        .I5(\Data_B_i[12]_0 [3]),
        .O(sgf_result_o0__1_carry__0_i_5__8_n_0));
  LUT6 #(
    .INIT(64'h56666AAA6AAA6AAA)) 
    sgf_result_o0__1_carry__0_i_6__6
       (.I0(sgf_result_o0__1_carry__0_i_3__7_n_0),
        .I1(sgf_result_o0__1_carry__0_i_9__3_n_0),
        .I2(\Data_A_i[12] [1]),
        .I3(\Data_B_i[12]_0 [2]),
        .I4(\Data_A_i[12] [0]),
        .I5(\Data_B_i[12]_0 [3]),
        .O(sgf_result_o0__1_carry__0_i_6__6_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry__0_i_7__3
       (.I0(\Data_B_i[12]_0 [1]),
        .I1(\Data_A_i[12] [3]),
        .I2(\Data_A_i[12] [2]),
        .I3(\Data_B_i[12]_0 [2]),
        .I4(\Data_A_i[12] [1]),
        .I5(\Data_B_i[12]_0 [3]),
        .O(sgf_result_o0__1_carry__0_i_7__3_n_0));
  LUT6 #(
    .INIT(64'h07777FFF7FFF7FFF)) 
    sgf_result_o0__1_carry__0_i_8__6
       (.I0(\Data_B_i[12]_0 [3]),
        .I1(\Data_A_i[12] [1]),
        .I2(\Data_B_i[12]_0 [2]),
        .I3(\Data_A_i[12] [2]),
        .I4(\Data_A_i[12] [3]),
        .I5(\Data_B_i[12]_0 [1]),
        .O(sgf_result_o0__1_carry__0_i_8__6_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry__0_i_9__3
       (.I0(\Data_A_i[12] [2]),
        .I1(\Data_B_i[12]_0 [1]),
        .O(sgf_result_o0__1_carry__0_i_9__3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_10__2
       (.I0(\Data_A_i[12] [1]),
        .I1(\Data_B_i[12]_0 [2]),
        .O(sgf_result_o0__1_carry_i_10__2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_11__7
       (.I0(\Data_B_i[12]_0 [0]),
        .I1(\Data_A_i[12] [3]),
        .O(sgf_result_o0__1_carry_i_11__7_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_1__7
       (.I0(\Data_B_i[12]_0 [1]),
        .I1(\Data_A_i[12] [2]),
        .I2(\Data_A_i[12] [1]),
        .I3(\Data_B_i[12]_0 [2]),
        .I4(\Data_A_i[12] [0]),
        .I5(\Data_B_i[12]_0 [3]),
        .O(sgf_result_o0__1_carry_i_1__7_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_2__7
       (.I0(\Data_B_i[12]_0 [1]),
        .I1(\Data_A_i[12] [1]),
        .I2(\Data_B_i[12]_0 [2]),
        .I3(\Data_A_i[12] [0]),
        .O(sgf_result_o0__1_carry_i_2__7_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_3__7
       (.I0(\Data_A_i[12] [0]),
        .I1(\Data_B_i[12]_0 [1]),
        .O(sgf_result_o0__1_carry_i_3__7_n_0));
  LUT6 #(
    .INIT(64'h99A5C30F665A3CF0)) 
    sgf_result_o0__1_carry_i_4__7
       (.I0(\Data_B_i[12]_0 [3]),
        .I1(\Data_A_i[12] [2]),
        .I2(sgf_result_o0__1_carry_i_10__2_n_0),
        .I3(\Data_B_i[12]_0 [1]),
        .I4(\Data_A_i[12] [0]),
        .I5(sgf_result_o0__1_carry_i_11__7_n_0),
        .O(sgf_result_o0__1_carry_i_4__7_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    sgf_result_o0__1_carry_i_5__7
       (.I0(\Data_A_i[12] [0]),
        .I1(\Data_B_i[12]_0 [2]),
        .I2(\Data_A_i[12] [1]),
        .I3(\Data_B_i[12]_0 [1]),
        .I4(\Data_A_i[12] [2]),
        .I5(\Data_B_i[12]_0 [0]),
        .O(sgf_result_o0__1_carry_i_5__7_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o0__1_carry_i_6__5
       (.I0(\Data_A_i[12] [1]),
        .I1(\Data_B_i[12]_0 [0]),
        .I2(\Data_B_i[12]_0 [1]),
        .I3(\Data_A_i[12] [0]),
        .O(sgf_result_o0__1_carry_i_6__5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0__1_carry_i_7__7
       (.I0(\Data_B_i[12]_0 [0]),
        .I1(\Data_A_i[12] [0]),
        .O(sgf_result_o0__1_carry_i_7__7_n_0));
  CARRY4 sgf_result_o0_carry
       (.CI(1'b0),
        .CO({sgf_result_o0_carry_n_0,sgf_result_o0_carry_n_1,sgf_result_o0_carry_n_2,sgf_result_o0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sgf_result_o1__21_carry_n_5,sgf_result_o1__21_carry_n_6,sgf_result_o1__21_carry_n_7,1'b0}),
        .O({sgf_result_o0_carry_n_4,sgf_result_o0_carry_n_5,sgf_result_o0_carry_n_6,sgf_result_o0_carry_n_7}),
        .S({\ODD1.right_lower_n_19 ,\ODD1.right_lower_n_20 ,\ODD1.right_lower_n_21 ,\ODD1.right_lower_n_22 }));
  CARRY4 sgf_result_o0_carry__0
       (.CI(sgf_result_o0_carry_n_0),
        .CO({sgf_result_o0_carry__0_n_0,sgf_result_o0_carry__0_n_1,sgf_result_o0_carry__0_n_2,sgf_result_o0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({sgf_result_o1__21_carry__0_n_5,sgf_result_o1__21_carry__0_n_6,sgf_result_o1__21_carry__0_n_7,sgf_result_o1__21_carry_n_4}),
        .O({sgf_result_o0_carry__0_n_4,sgf_result_o0_carry__0_n_5,sgf_result_o0_carry__0_n_6,sgf_result_o0_carry__0_n_7}),
        .S({sgf_result_o0_carry__0_i_1_n_0,sgf_result_o0_carry__0_i_2_n_0,sgf_result_o0_carry__0_i_3_n_0,\ODD1.right_lower_n_23 }));
  LUT6 #(
    .INIT(64'h9A956595956A6A6A)) 
    sgf_result_o0_carry__0_i_1
       (.I0(sgf_result_o1__21_carry__0_n_5),
        .I1(O[2]),
        .I2(\Data_B_i[12]_1 [0]),
        .I3(O[0]),
        .I4(\Data_B_i[12]_1 [2]),
        .I5(sgf_result_o0_carry__0_i_5_n_0),
        .O(sgf_result_o0_carry__0_i_1_n_0));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    sgf_result_o0_carry__0_i_2
       (.I0(sgf_result_o1__21_carry__0_n_6),
        .I1(\Data_B_i[12]_1 [0]),
        .I2(O[1]),
        .I3(O[0]),
        .I4(\Data_B_i[12]_1 [1]),
        .O(sgf_result_o0_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    sgf_result_o0_carry__0_i_3
       (.I0(sgf_result_o1__21_carry__0_n_7),
        .I1(O[0]),
        .I2(\Data_B_i[12]_1 [0]),
        .O(sgf_result_o0_carry__0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o0_carry__0_i_5
       (.I0(O[1]),
        .I1(\Data_B_i[12]_1 [1]),
        .O(sgf_result_o0_carry__0_i_5_n_0));
  CARRY4 sgf_result_o0_carry__1
       (.CI(sgf_result_o0_carry__0_n_0),
        .CO({NLW_sgf_result_o0_carry__1_CO_UNCONNECTED[3:2],sgf_result_o0_carry__1_n_2,sgf_result_o0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,sgf_result_o1__21_carry__1_n_7,sgf_result_o1__21_carry__0_n_4}),
        .O({NLW_sgf_result_o0_carry__1_O_UNCONNECTED[3],sgf_result_o0_carry__1_n_5,sgf_result_o0_carry__1_n_6,sgf_result_o0_carry__1_n_7}),
        .S({1'b0,sgf_result_o0_carry__1_i_1_n_0,sgf_result_o0_carry__1_i_2_n_0,sgf_result_o0_carry__1_i_3_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0_carry__1_i_1
       (.I0(sgf_result_o1__21_carry__1_n_6),
        .I1(sgf_result_o1__21_carry__0_i_9__1_n_0),
        .O(sgf_result_o0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sgf_result_o0_carry__1_i_2
       (.I0(sgf_result_o1__21_carry__1_n_7),
        .I1(sgf_result_o1__21_carry__0_i_10__1_n_0),
        .O(sgf_result_o0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    sgf_result_o0_carry__1_i_3
       (.I0(sgf_result_o1__21_carry__0_n_4),
        .I1(sgf_result_o1__21_carry_i_9__1_n_0),
        .O(sgf_result_o0_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h0400464B04000B0B)) 
    sgf_result_o1__0_carry__0_i_6__1
       (.I0(\ODD1.middle_n_9 ),
        .I1(\ODD1.middle_n_7 ),
        .I2(\ODD1.middle_n_6 ),
        .I3(\ODD1.middle_n_11 ),
        .I4(\ODD1.middle_n_8 ),
        .I5(sgf_result_o1__0_carry_i_24_n_0),
        .O(sgf_result_o1__0_carry__0_i_6__1_n_0));
  LUT6 #(
    .INIT(64'h0020000000330020)) 
    sgf_result_o1__0_carry__0_i_7__1
       (.I0(sgf_result_o1__0_carry_i_24_n_0),
        .I1(\ODD1.middle_n_8 ),
        .I2(\ODD1.middle_n_11 ),
        .I3(\ODD1.middle_n_6 ),
        .I4(\ODD1.middle_n_7 ),
        .I5(\ODD1.middle_n_9 ),
        .O(sgf_result_o1__0_carry__0_i_7__1_n_0));
  LUT6 #(
    .INIT(64'h6868688068808080)) 
    sgf_result_o1__0_carry_i_10__1
       (.I0(\Data_A_i[12] [3]),
        .I1(\ODD1.middle_n_10 ),
        .I2(\Data_B_i[12]_0 [3]),
        .I3(\Data_B_i[12]_0 [2]),
        .I4(\ODD1.middle_n_13 ),
        .I5(\Data_B_i[12]_1 [2]),
        .O(sgf_result_o1__0_carry_i_10__1_n_0));
  LUT6 #(
    .INIT(64'h6060609F609F6060)) 
    sgf_result_o1__0_carry_i_11__1
       (.I0(\Data_A_i[12] [0]),
        .I1(O[0]),
        .I2(\ODD1.middle_n_7 ),
        .I3(\ODD1.middle_n_9 ),
        .I4(\Data_B_i[12]_0 [0]),
        .I5(\Data_B_i[12]_1 [0]),
        .O(sgf_result_o1__0_carry_i_11__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h566A)) 
    sgf_result_o1__0_carry_i_14__1
       (.I0(\Data_A_i[12] [3]),
        .I1(\Data_A_i[12] [2]),
        .I2(\ODD1.middle_n_12 ),
        .I3(O[2]),
        .O(sgf_result_o1__0_carry_i_14__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h566A)) 
    sgf_result_o1__0_carry_i_15__1
       (.I0(\Data_B_i[12]_0 [3]),
        .I1(\Data_B_i[12]_0 [2]),
        .I2(\ODD1.middle_n_13 ),
        .I3(\Data_B_i[12]_1 [2]),
        .O(sgf_result_o1__0_carry_i_15__1_n_0));
  LUT6 #(
    .INIT(64'hBEFA7D72FEFA3236)) 
    sgf_result_o1__0_carry_i_16__1
       (.I0(\ODD1.middle_n_9 ),
        .I1(\ODD1.middle_n_7 ),
        .I2(\ODD1.middle_n_6 ),
        .I3(\ODD1.middle_n_11 ),
        .I4(\ODD1.middle_n_8 ),
        .I5(sgf_result_o1__0_carry_i_24_n_0),
        .O(sgf_result_o1__0_carry_i_16__1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o1__0_carry_i_17__1
       (.I0(sgf_result_o1__0_carry_i_15__1_n_0),
        .I1(sgf_result_o1__0_carry_i_14__1_n_0),
        .O(sgf_result_o1__0_carry_i_17__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hA880)) 
    sgf_result_o1__0_carry_i_19__1
       (.I0(\Data_A_i[12] [3]),
        .I1(\Data_A_i[12] [2]),
        .I2(\ODD1.middle_n_12 ),
        .I3(O[2]),
        .O(sgf_result_o1__0_carry_i_19__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_24
       (.I0(\Data_B_i[12]_0 [0]),
        .I1(\Data_B_i[12]_1 [0]),
        .O(sgf_result_o1__0_carry_i_24_n_0));
  LUT6 #(
    .INIT(64'h9A9A3AC53AC59A9A)) 
    sgf_result_o1__0_carry_i_8__1
       (.I0(sgf_result_o1_carry_i_5__1_n_0),
        .I1(\ODD1.middle_n_6 ),
        .I2(\ODD1.middle_n_11 ),
        .I3(\ODD1.middle_n_8 ),
        .I4(\Data_B_i[12]_1 [0]),
        .I5(\Data_B_i[12]_0 [0]),
        .O(sgf_result_o1__0_carry_i_8__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hE8000000)) 
    sgf_result_o1__0_carry_i_9__1
       (.I0(\Data_B_i[12]_1 [2]),
        .I1(\ODD1.middle_n_13 ),
        .I2(\Data_B_i[12]_0 [2]),
        .I3(\Data_B_i[12]_0 [3]),
        .I4(sgf_result_o1__0_carry_i_19__1_n_0),
        .O(sgf_result_o1__0_carry_i_9__1_n_0));
  CARRY4 sgf_result_o1__21_carry
       (.CI(1'b0),
        .CO({sgf_result_o1__21_carry_n_0,sgf_result_o1__21_carry_n_1,sgf_result_o1__21_carry_n_2,sgf_result_o1__21_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\ODD1.right_lower_n_4 ,\ODD1.right_lower_n_5 ,\ODD1.right_lower_n_6 ,1'b1}),
        .O({sgf_result_o1__21_carry_n_4,sgf_result_o1__21_carry_n_5,sgf_result_o1__21_carry_n_6,sgf_result_o1__21_carry_n_7}),
        .S({\ODD1.right_lower_n_11 ,\ODD1.right_lower_n_12 ,\ODD1.right_lower_n_13 ,\ODD1.right_lower_n_14 }));
  CARRY4 sgf_result_o1__21_carry__0
       (.CI(sgf_result_o1__21_carry_n_0),
        .CO({sgf_result_o1__21_carry__0_n_0,sgf_result_o1__21_carry__0_n_1,sgf_result_o1__21_carry__0_n_2,sgf_result_o1__21_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.right_lower_n_7 ,\ODD1.right_lower_n_8 ,\ODD1.right_lower_n_9 ,\ODD1.right_lower_n_10 }),
        .O({sgf_result_o1__21_carry__0_n_4,sgf_result_o1__21_carry__0_n_5,sgf_result_o1__21_carry__0_n_6,sgf_result_o1__21_carry__0_n_7}),
        .S({\ODD1.right_lower_n_15 ,\ODD1.right_lower_n_16 ,\ODD1.right_lower_n_17 ,\ODD1.right_lower_n_18 }));
  LUT6 #(
    .INIT(64'h67878F8F7FFF7FFF)) 
    sgf_result_o1__21_carry__0_i_10__1
       (.I0(\Data_B_i[12]_1 [1]),
        .I1(O[1]),
        .I2(\Data_B_i[12]_1 [2]),
        .I3(O[0]),
        .I4(\Data_B_i[12]_1 [0]),
        .I5(O[2]),
        .O(sgf_result_o1__21_carry__0_i_10__1_n_0));
  LUT6 #(
    .INIT(64'hE080808000000000)) 
    sgf_result_o1__21_carry__0_i_9__1
       (.I0(O[1]),
        .I1(\Data_B_i[12]_1 [1]),
        .I2(O[2]),
        .I3(\Data_B_i[12]_1 [0]),
        .I4(O[0]),
        .I5(\Data_B_i[12]_1 [2]),
        .O(sgf_result_o1__21_carry__0_i_9__1_n_0));
  CARRY4 sgf_result_o1__21_carry__1
       (.CI(sgf_result_o1__21_carry__0_n_0),
        .CO({NLW_sgf_result_o1__21_carry__1_CO_UNCONNECTED[3:1],sgf_result_o1__21_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Q_middle_temp__3[8]}),
        .O({NLW_sgf_result_o1__21_carry__1_O_UNCONNECTED[3:2],sgf_result_o1__21_carry__1_n_6,sgf_result_o1__21_carry__1_n_7}),
        .S({1'b0,1'b0,sgf_result_o1__21_carry__1_i_1__1_n_0,\ODD1.middle_n_21 }));
  LUT1 #(
    .INIT(2'h1)) 
    sgf_result_o1__21_carry__1_i_1__1
       (.I0(Q_middle_temp__3[9]),
        .O(sgf_result_o1__21_carry__1_i_1__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    sgf_result_o1__21_carry_i_10__1
       (.I0(\Data_B_i[12]_1 [1]),
        .I1(O[0]),
        .I2(O[1]),
        .I3(\Data_B_i[12]_1 [0]),
        .O(sgf_result_o1__21_carry_i_10__1_n_0));
  LUT6 #(
    .INIT(64'h0F777888F0887888)) 
    sgf_result_o1__21_carry_i_8__1
       (.I0(\Data_B_i[12]_1 [1]),
        .I1(O[1]),
        .I2(\Data_B_i[12]_1 [2]),
        .I3(O[0]),
        .I4(\Data_B_i[12]_1 [0]),
        .I5(O[2]),
        .O(sgf_result_o1__21_carry_i_8__1_n_0));
  LUT6 #(
    .INIT(64'hED1D1595B73FBF3F)) 
    sgf_result_o1__21_carry_i_9__1
       (.I0(\Data_B_i[12]_1 [1]),
        .I1(O[1]),
        .I2(\Data_B_i[12]_1 [2]),
        .I3(O[0]),
        .I4(\Data_B_i[12]_1 [0]),
        .I5(O[2]),
        .O(sgf_result_o1__21_carry_i_9__1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    sgf_result_o1__35_carry_i_1
       (.I0(Q_middle_temp__5[9]),
        .I1(sgf_result_o0_carry__1_n_6),
        .O(DI[1]));
  (* HLUTNM = "lutpair56" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_1__1
       (.I0(Q_middle_temp__5[3]),
        .I1(\Data_B_i[12]_3 [0]),
        .I2(sgf_result_o0_carry_n_4),
        .O(\sgf_result_o[47]_2 [3]));
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_1__2
       (.I0(Q_middle_temp__5[7]),
        .I1(\Data_A_i[12]_0 [0]),
        .I2(sgf_result_o0_carry__0_n_4),
        .O(\sgf_result_o[47]_0 [3]));
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_2__0
       (.I0(Q_middle_temp__5[8]),
        .I1(\Data_A_i[12]_0 [1]),
        .I2(sgf_result_o0_carry__1_n_7),
        .O(DI[0]));
  (* HLUTNM = "lutpair55" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_2__1
       (.I0(Q_middle_temp__5[2]),
        .I1(\Data_B_i[12]_2 [2]),
        .I2(sgf_result_o0_carry_n_5),
        .O(\sgf_result_o[47]_2 [2]));
  (* HLUTNM = "lutpair59" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_2__2
       (.I0(Q_middle_temp__5[6]),
        .I1(\Data_B_i[12]_3 [3]),
        .I2(sgf_result_o0_carry__0_n_5),
        .O(\sgf_result_o[47]_0 [2]));
  (* HLUTNM = "lutpair54" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_3__0
       (.I0(Q_middle_temp__5[1]),
        .I1(\Data_B_i[12]_2 [1]),
        .I2(sgf_result_o0_carry_n_6),
        .O(\sgf_result_o[47]_2 [1]));
  (* HLUTNM = "lutpair58" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_3__1
       (.I0(Q_middle_temp__5[5]),
        .I1(\Data_B_i[12]_3 [2]),
        .I2(sgf_result_o0_carry__0_n_6),
        .O(\sgf_result_o[47]_0 [1]));
  LUT3 #(
    .INIT(8'h2D)) 
    sgf_result_o1__35_carry_i_4
       (.I0(sgf_result_o0_carry__1_n_5),
        .I1(Q_middle_temp__5[10]),
        .I2(Q_middle_temp__5[11]),
        .O(\sgf_result_o[47]_1 [2]));
  (* HLUTNM = "lutpair53" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_4__0
       (.I0(Q_middle_temp__5[0]),
        .I1(\Data_B_i[12]_2 [0]),
        .I2(sgf_result_o0_carry_n_7),
        .O(\sgf_result_o[47]_2 [0]));
  (* HLUTNM = "lutpair53" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_4__1
       (.I0(Q_middle_temp__5[0]),
        .I1(\Data_B_i[12]_2 [0]),
        .I2(sgf_result_o0_carry_n_7),
        .I3(\Data_A_i[12]_1 ),
        .O(\sgf_result_o[47]_3 ));
  (* HLUTNM = "lutpair57" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_4__2
       (.I0(Q_middle_temp__5[4]),
        .I1(\Data_B_i[12]_3 [1]),
        .I2(sgf_result_o0_carry__0_n_7),
        .O(\sgf_result_o[47]_0 [0]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_5
       (.I0(\sgf_result_o[47]_0 [3]),
        .I1(Q_middle_temp__5[8]),
        .I2(\Data_A_i[12]_0 [1]),
        .I3(sgf_result_o0_carry__1_n_7),
        .O(S[3]));
  LUT4 #(
    .INIT(16'hD22D)) 
    sgf_result_o1__35_carry_i_5__0
       (.I0(sgf_result_o0_carry__1_n_6),
        .I1(Q_middle_temp__5[9]),
        .I2(sgf_result_o0_carry__1_n_5),
        .I3(Q_middle_temp__5[10]),
        .O(\sgf_result_o[47]_1 [1]));
  (* HLUTNM = "lutpair57" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_5__2
       (.I0(Q_middle_temp__5[4]),
        .I1(\Data_B_i[12]_3 [1]),
        .I2(sgf_result_o0_carry__0_n_7),
        .I3(\sgf_result_o[47]_2 [3]),
        .O(\sgf_result_o[47]_4 [3]));
  LUT5 #(
    .INIT(32'h718E8E71)) 
    sgf_result_o1__35_carry_i_6__0
       (.I0(sgf_result_o0_carry__1_n_7),
        .I1(\Data_A_i[12]_0 [1]),
        .I2(Q_middle_temp__5[8]),
        .I3(sgf_result_o0_carry__1_n_6),
        .I4(Q_middle_temp__5[9]),
        .O(\sgf_result_o[47]_1 [0]));
  (* HLUTNM = "lutpair56" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_6__1
       (.I0(Q_middle_temp__5[3]),
        .I1(\Data_B_i[12]_3 [0]),
        .I2(sgf_result_o0_carry_n_4),
        .I3(\sgf_result_o[47]_2 [2]),
        .O(\sgf_result_o[47]_4 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_6__2
       (.I0(Q_middle_temp__5[7]),
        .I1(\Data_A_i[12]_0 [0]),
        .I2(sgf_result_o0_carry__0_n_4),
        .I3(\sgf_result_o[47]_0 [2]),
        .O(S[2]));
  (* HLUTNM = "lutpair55" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_7
       (.I0(Q_middle_temp__5[2]),
        .I1(\Data_B_i[12]_2 [2]),
        .I2(sgf_result_o0_carry_n_5),
        .I3(\sgf_result_o[47]_2 [1]),
        .O(\sgf_result_o[47]_4 [1]));
  (* HLUTNM = "lutpair59" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_7__0
       (.I0(Q_middle_temp__5[6]),
        .I1(\Data_B_i[12]_3 [3]),
        .I2(sgf_result_o0_carry__0_n_5),
        .I3(\sgf_result_o[47]_0 [1]),
        .O(S[1]));
  (* HLUTNM = "lutpair54" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_8
       (.I0(Q_middle_temp__5[1]),
        .I1(\Data_B_i[12]_2 [1]),
        .I2(sgf_result_o0_carry_n_6),
        .I3(\sgf_result_o[47]_2 [0]),
        .O(\sgf_result_o[47]_4 [0]));
  (* HLUTNM = "lutpair58" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_8__0
       (.I0(Q_middle_temp__5[5]),
        .I1(\Data_B_i[12]_3 [2]),
        .I2(sgf_result_o0_carry__0_n_6),
        .I3(\sgf_result_o[47]_0 [0]),
        .O(S[0]));
  CARRY4 sgf_result_o1_carry
       (.CI(1'b0),
        .CO({sgf_result_o1_carry_n_0,sgf_result_o1_carry_n_1,sgf_result_o1_carry_n_2,sgf_result_o1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.middle_n_1 ,\ODD1.middle_n_2 ,\ODD1.middle_n_3 ,1'b0}),
        .O(Q_middle_temp__3[5:2]),
        .S({\ODD1.middle_n_14 ,\ODD1.middle_n_15 ,\ODD1.middle_n_16 ,sgf_result_o1_carry_i_4__1_n_0}));
  CARRY4 sgf_result_o1_carry__0
       (.CI(sgf_result_o1_carry_n_0),
        .CO({NLW_sgf_result_o1_carry__0_CO_UNCONNECTED[3],sgf_result_o1_carry__0_n_1,sgf_result_o1_carry__0_n_2,sgf_result_o1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\ODD1.middle_n_4 ,\ODD1.middle_n_5 ,\ODD1.middle_n_0 }),
        .O(Q_middle_temp__3[9:6]),
        .S({\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 }));
  LUT6 #(
    .INIT(64'h9A9A3AC53AC59A9A)) 
    sgf_result_o1_carry_i_4__1
       (.I0(sgf_result_o1_carry_i_5__1_n_0),
        .I1(\ODD1.middle_n_6 ),
        .I2(\ODD1.middle_n_11 ),
        .I3(\ODD1.middle_n_8 ),
        .I4(\Data_B_i[12]_1 [0]),
        .I5(\Data_B_i[12]_0 [0]),
        .O(sgf_result_o1_carry_i_4__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o1_carry_i_5__1
       (.I0(\Data_B_i[12]_0 [1]),
        .I1(\Data_B_i[12]_1 [1]),
        .I2(\Data_B_i[12]_0 [0]),
        .I3(\Data_B_i[12]_1 [0]),
        .I4(\ODD1.middle_n_9 ),
        .O(sgf_result_o1_carry_i_5__1_n_0));
  (* HLUTNM = "lutpair61" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[22]_inst_i_10 
       (.I0(sgf_result_o0_carry_n_7),
        .I1(\Data_A_i[17] [1]),
        .I2(sgf_result_o_OBUF[2]),
        .O(\sgf_result_o_OBUF[22]_inst_i_10_n_0 ));
  (* HLUTNM = "lutpair64" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[22]_inst_i_12 
       (.I0(\sgf_result_o[47]_5 [0]),
        .I1(\Data_A_i[23] [1]),
        .I2(sgf_result_o_OBUF[5]),
        .I3(\sgf_result_o_OBUF[22]_inst_i_8_n_0 ),
        .O(\sgf_result_o_OBUF[22]_inst_i_12_n_0 ));
  (* HLUTNM = "lutpair63" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[22]_inst_i_13 
       (.I0(sgf_result_o0_carry_n_5),
        .I1(\Data_A_i[23] [0]),
        .I2(sgf_result_o_OBUF[4]),
        .I3(\sgf_result_o_OBUF[22]_inst_i_9_n_0 ),
        .O(\sgf_result_o_OBUF[22]_inst_i_13_n_0 ));
  (* HLUTNM = "lutpair62" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[22]_inst_i_14 
       (.I0(sgf_result_o0_carry_n_6),
        .I1(\Data_A_i[17] [2]),
        .I2(sgf_result_o_OBUF[3]),
        .I3(\sgf_result_o_OBUF[22]_inst_i_10_n_0 ),
        .O(\sgf_result_o_OBUF[22]_inst_i_14_n_0 ));
  (* HLUTNM = "lutpair63" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[22]_inst_i_8 
       (.I0(sgf_result_o0_carry_n_5),
        .I1(\Data_A_i[23] [0]),
        .I2(sgf_result_o_OBUF[4]),
        .O(\sgf_result_o_OBUF[22]_inst_i_8_n_0 ));
  (* HLUTNM = "lutpair62" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[22]_inst_i_9 
       (.I0(sgf_result_o0_carry_n_6),
        .I1(\Data_A_i[17] [2]),
        .I2(sgf_result_o_OBUF[3]),
        .O(\sgf_result_o_OBUF[22]_inst_i_9_n_0 ));
  CARRY4 \sgf_result_o_OBUF[26]_inst_i_16 
       (.CI(1'b0),
        .CO({\sgf_result_o_OBUF[26]_inst_i_16_n_0 ,\sgf_result_o_OBUF[26]_inst_i_16_n_1 ,\sgf_result_o_OBUF[26]_inst_i_16_n_2 ,\sgf_result_o_OBUF[26]_inst_i_16_n_3 }),
        .CYINIT(1'b0),
        .DI({sgf_result_o1[2:0],1'b0}),
        .O(\sgf_result_o[47]_5 [3:0]),
        .S({\sgf_result_o_OBUF[26]_inst_i_20_n_0 ,\sgf_result_o_OBUF[26]_inst_i_21_n_0 ,\sgf_result_o_OBUF[26]_inst_i_22_n_0 ,sgf_result_o0_carry_n_4}));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[26]_inst_i_20 
       (.I0(sgf_result_o1[2]),
        .I1(sgf_result_o0_carry__0_n_5),
        .O(\sgf_result_o_OBUF[26]_inst_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[26]_inst_i_21 
       (.I0(sgf_result_o1[1]),
        .I1(sgf_result_o0_carry__0_n_6),
        .O(\sgf_result_o_OBUF[26]_inst_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[26]_inst_i_22 
       (.I0(sgf_result_o1[0]),
        .I1(sgf_result_o0_carry__0_n_7),
        .O(\sgf_result_o_OBUF[26]_inst_i_22_n_0 ));
  CARRY4 \sgf_result_o_OBUF[30]_inst_i_15 
       (.CI(\sgf_result_o_OBUF[26]_inst_i_16_n_0 ),
        .CO({\sgf_result_o_OBUF[30]_inst_i_15_n_0 ,\sgf_result_o_OBUF[30]_inst_i_15_n_1 ,\sgf_result_o_OBUF[30]_inst_i_15_n_2 ,\sgf_result_o_OBUF[30]_inst_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI(sgf_result_o1[6:3]),
        .O(\sgf_result_o[47]_5 [7:4]),
        .S({\sgf_result_o_OBUF[30]_inst_i_16_n_0 ,\sgf_result_o_OBUF[30]_inst_i_17_n_0 ,\sgf_result_o_OBUF[30]_inst_i_18_n_0 ,\sgf_result_o_OBUF[30]_inst_i_19_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[30]_inst_i_16 
       (.I0(sgf_result_o1[6]),
        .I1(sgf_result_o0_carry__1_n_5),
        .O(\sgf_result_o_OBUF[30]_inst_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[30]_inst_i_17 
       (.I0(sgf_result_o1[5]),
        .I1(sgf_result_o0_carry__1_n_6),
        .O(\sgf_result_o_OBUF[30]_inst_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[30]_inst_i_18 
       (.I0(sgf_result_o1[4]),
        .I1(sgf_result_o0_carry__1_n_7),
        .O(\sgf_result_o_OBUF[30]_inst_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[30]_inst_i_19 
       (.I0(sgf_result_o1[3]),
        .I1(sgf_result_o0_carry__0_n_4),
        .O(\sgf_result_o_OBUF[30]_inst_i_19_n_0 ));
  CARRY4 \sgf_result_o_OBUF[34]_inst_i_16 
       (.CI(\sgf_result_o_OBUF[30]_inst_i_15_n_0 ),
        .CO({\sgf_result_o_OBUF[34]_inst_i_16_n_0 ,\sgf_result_o_OBUF[34]_inst_i_16_n_1 ,\sgf_result_o_OBUF[34]_inst_i_16_n_2 ,\sgf_result_o_OBUF[34]_inst_i_16_n_3 }),
        .CYINIT(1'b0),
        .DI(sgf_result_o1[10:7]),
        .O(\sgf_result_o[47]_5 [11:8]),
        .S(\Data_B_i[12]_4 ));
  CARRY4 \sgf_result_o_OBUF[38]_inst_i_20 
       (.CI(\sgf_result_o_OBUF[34]_inst_i_16_n_0 ),
        .CO({\sgf_result_o_OBUF[38]_inst_i_20_n_0 ,\sgf_result_o_OBUF[38]_inst_i_20_n_1 ,\sgf_result_o_OBUF[38]_inst_i_20_n_2 ,\sgf_result_o_OBUF[38]_inst_i_20_n_3 }),
        .CYINIT(1'b0),
        .DI(sgf_result_o1[14:11]),
        .O(\sgf_result_o[47]_5 [15:12]),
        .S(\Data_B_i[12]_5 ));
  CARRY4 \sgf_result_o_OBUF[38]_inst_i_8 
       (.CI(\sgf_result_o_OBUF[38]_inst_i_20_n_0 ),
        .CO({\NLW_sgf_result_o_OBUF[38]_inst_i_8_CO_UNCONNECTED [3],\sgf_result_o_OBUF[38]_inst_i_8_n_1 ,\sgf_result_o_OBUF[38]_inst_i_8_n_2 ,\sgf_result_o_OBUF[38]_inst_i_8_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,sgf_result_o1[15]}),
        .O({Q_middle_temp__6,\sgf_result_o[47]_5 [18:16]}),
        .S(\Data_A_i[12]_2 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sgf_result_o_OBUF[38]_inst_i_9 
       (.I0(Q_middle_temp__6),
        .O(\sgf_result_o_OBUF[38]_inst_i_9_n_0 ));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized39
   (O,
    CO,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    DI,
    S,
    \Data_B_i[12] ,
    \Data_A_i[12] ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[12]_0 ,
    \Data_B_i[16] ,
    \Data_B_i[12]_1 ,
    \Data_A_i[12]_0 ,
    \Data_B_i[12]_2 ,
    Q_middle_temp__3,
    \Data_A_i[12]_1 ,
    \Data_A_i[12]_2 ,
    sgf_result_o_OBUF,
    \Data_A_i[12]_3 ,
    \Data_A_i[12]_4 ,
    \Data_A_i[12]_5 ,
    \Data_A_i[17] ,
    \Data_A_i[12]_6 ,
    \Data_B_i[17] ,
    \Data_B_i[17]_0 ,
    \Data_A_i[14] ,
    \Data_A_i[14]_0 ,
    \Data_A_i[13] ,
    \Data_A_i[13]_0 ,
    \Data_A_i[13]_1 ,
    \Data_A_i[13]_2 ,
    \Data_A_i[13]_3 ,
    \Data_A_i[13]_4 ,
    \Data_A_i[12]_7 ,
    \Data_A_i[12]_8 ,
    \Data_A_i[11] ,
    \Data_A_i[14]_1 ,
    \Data_A_i[14]_2 ,
    \Data_A_i[14]_3 ,
    \Data_A_i[14]_4 ,
    \Data_B_i[12]_3 ,
    \Data_A_i[12]_9 ,
    \Data_A_i[11]_0 ,
    \Data_A_i[2] ,
    \Data_A_i[2]_0 ,
    \Data_A_i[2]_1 ,
    \Data_A_i[23] ,
    \Data_A_i[23]_0 ,
    \Data_A_i[14]_5 );
  output [2:0]O;
  output [0:0]CO;
  output [2:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [0:0]\sgf_result_o[47]_4 ;
  output [36:0]\sgf_result_o[47]_5 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_B_i[12] ;
  input [2:0]\Data_A_i[12] ;
  input [3:0]Data_B_i_IBUF;
  input [3:0]Data_A_i_IBUF;
  input \Data_B_i[12]_0 ;
  input \Data_B_i[16] ;
  input [1:0]\Data_B_i[12]_1 ;
  input [1:0]\Data_A_i[12]_0 ;
  input \Data_B_i[12]_2 ;
  input [5:0]Q_middle_temp__3;
  input \Data_A_i[12]_1 ;
  input [3:0]\Data_A_i[12]_2 ;
  input [2:0]sgf_result_o_OBUF;
  input \Data_A_i[12]_3 ;
  input \Data_A_i[12]_4 ;
  input \Data_A_i[12]_5 ;
  input [2:0]\Data_A_i[17] ;
  input [0:0]\Data_A_i[12]_6 ;
  input [3:0]\Data_B_i[17] ;
  input [3:0]\Data_B_i[17]_0 ;
  input [3:0]\Data_A_i[14] ;
  input [3:0]\Data_A_i[14]_0 ;
  input [3:0]\Data_A_i[13] ;
  input [3:0]\Data_A_i[13]_0 ;
  input [3:0]\Data_A_i[13]_1 ;
  input [3:0]\Data_A_i[13]_2 ;
  input [3:0]\Data_A_i[13]_3 ;
  input [3:0]\Data_A_i[13]_4 ;
  input [0:0]\Data_A_i[12]_7 ;
  input [1:0]\Data_A_i[12]_8 ;
  input [0:0]\Data_A_i[11] ;
  input [0:0]\Data_A_i[14]_1 ;
  input [3:0]\Data_A_i[14]_2 ;
  input [3:0]\Data_A_i[14]_3 ;
  input [0:0]\Data_A_i[14]_4 ;
  input [0:0]\Data_B_i[12]_3 ;
  input [0:0]\Data_A_i[12]_9 ;
  input [0:0]\Data_A_i[11]_0 ;
  input [3:0]\Data_A_i[2] ;
  input [3:0]\Data_A_i[2]_0 ;
  input [2:0]\Data_A_i[2]_1 ;
  input [3:0]\Data_A_i[23] ;
  input [3:0]\Data_A_i[23]_0 ;
  input [0:0]\Data_A_i[14]_5 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [0:0]\Data_A_i[11] ;
  wire [0:0]\Data_A_i[11]_0 ;
  wire [2:0]\Data_A_i[12] ;
  wire [1:0]\Data_A_i[12]_0 ;
  wire \Data_A_i[12]_1 ;
  wire [3:0]\Data_A_i[12]_2 ;
  wire \Data_A_i[12]_3 ;
  wire \Data_A_i[12]_4 ;
  wire \Data_A_i[12]_5 ;
  wire [0:0]\Data_A_i[12]_6 ;
  wire [0:0]\Data_A_i[12]_7 ;
  wire [1:0]\Data_A_i[12]_8 ;
  wire [0:0]\Data_A_i[12]_9 ;
  wire [3:0]\Data_A_i[13] ;
  wire [3:0]\Data_A_i[13]_0 ;
  wire [3:0]\Data_A_i[13]_1 ;
  wire [3:0]\Data_A_i[13]_2 ;
  wire [3:0]\Data_A_i[13]_3 ;
  wire [3:0]\Data_A_i[13]_4 ;
  wire [3:0]\Data_A_i[14] ;
  wire [3:0]\Data_A_i[14]_0 ;
  wire [0:0]\Data_A_i[14]_1 ;
  wire [3:0]\Data_A_i[14]_2 ;
  wire [3:0]\Data_A_i[14]_3 ;
  wire [0:0]\Data_A_i[14]_4 ;
  wire [0:0]\Data_A_i[14]_5 ;
  wire [2:0]\Data_A_i[17] ;
  wire [3:0]\Data_A_i[23] ;
  wire [3:0]\Data_A_i[23]_0 ;
  wire [3:0]\Data_A_i[2] ;
  wire [3:0]\Data_A_i[2]_0 ;
  wire [2:0]\Data_A_i[2]_1 ;
  wire [3:0]Data_A_i_IBUF;
  wire [2:0]\Data_B_i[12] ;
  wire \Data_B_i[12]_0 ;
  wire [1:0]\Data_B_i[12]_1 ;
  wire \Data_B_i[12]_2 ;
  wire [0:0]\Data_B_i[12]_3 ;
  wire \Data_B_i[16] ;
  wire [3:0]\Data_B_i[17] ;
  wire [3:0]\Data_B_i[17]_0 ;
  wire [3:0]Data_B_i_IBUF;
  wire [2:0]O;
  wire [5:0]Q_middle_temp__3;
  wire [3:0]S;
  wire [37:12]p_1_in;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire [2:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\^sgf_result_o[47]_3 ;
  wire [0:0]\sgf_result_o[47]_4 ;
  wire [36:0]\sgf_result_o[47]_5 ;
  wire [2:0]sgf_result_o_OBUF;
  wire \sgf_result_o_OBUF[14]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[14]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[14]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[14]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[14]_inst_i_2_n_0 ;
  wire \sgf_result_o_OBUF[14]_inst_i_3_n_0 ;
  wire \sgf_result_o_OBUF[14]_inst_i_4_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_10_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_11_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_12_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_13_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[18]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[18]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[18]_inst_i_2_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_2_n_1 ;
  wire \sgf_result_o_OBUF[18]_inst_i_2_n_2 ;
  wire \sgf_result_o_OBUF[18]_inst_i_2_n_3 ;
  wire \sgf_result_o_OBUF[18]_inst_i_3_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_4_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_5_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_6_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_7_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_8_n_0 ;
  wire \sgf_result_o_OBUF[18]_inst_i_9_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[22]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[22]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[22]_inst_i_2_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_2_n_1 ;
  wire \sgf_result_o_OBUF[22]_inst_i_2_n_2 ;
  wire \sgf_result_o_OBUF[22]_inst_i_2_n_3 ;
  wire \sgf_result_o_OBUF[22]_inst_i_3_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_4_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_5_n_0 ;
  wire \sgf_result_o_OBUF[22]_inst_i_6_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[26]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[26]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[26]_inst_i_2_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_2_n_1 ;
  wire \sgf_result_o_OBUF[26]_inst_i_2_n_2 ;
  wire \sgf_result_o_OBUF[26]_inst_i_2_n_3 ;
  wire \sgf_result_o_OBUF[26]_inst_i_3_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_4_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_5_n_0 ;
  wire \sgf_result_o_OBUF[26]_inst_i_6_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[30]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[30]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[30]_inst_i_2_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_2_n_1 ;
  wire \sgf_result_o_OBUF[30]_inst_i_2_n_2 ;
  wire \sgf_result_o_OBUF[30]_inst_i_2_n_3 ;
  wire \sgf_result_o_OBUF[30]_inst_i_3_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_4_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_5_n_0 ;
  wire \sgf_result_o_OBUF[30]_inst_i_6_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[34]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[34]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[34]_inst_i_2_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_2_n_1 ;
  wire \sgf_result_o_OBUF[34]_inst_i_2_n_2 ;
  wire \sgf_result_o_OBUF[34]_inst_i_2_n_3 ;
  wire \sgf_result_o_OBUF[34]_inst_i_3_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_4_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_5_n_0 ;
  wire \sgf_result_o_OBUF[34]_inst_i_6_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[38]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[38]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[38]_inst_i_2_n_3 ;
  wire \sgf_result_o_OBUF[38]_inst_i_3_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_3_n_1 ;
  wire \sgf_result_o_OBUF[38]_inst_i_3_n_2 ;
  wire \sgf_result_o_OBUF[38]_inst_i_3_n_3 ;
  wire \sgf_result_o_OBUF[38]_inst_i_5_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_6_n_0 ;
  wire \sgf_result_o_OBUF[38]_inst_i_7_n_0 ;
  wire \sgf_result_o_OBUF[42]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[42]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[42]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[42]_inst_i_1_n_3 ;
  wire \sgf_result_o_OBUF[46]_inst_i_1_n_0 ;
  wire \sgf_result_o_OBUF[46]_inst_i_1_n_1 ;
  wire \sgf_result_o_OBUF[46]_inst_i_1_n_2 ;
  wire \sgf_result_o_OBUF[46]_inst_i_1_n_3 ;
  wire [2:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;
  wire [3:1]\NLW_sgf_result_o_OBUF[38]_inst_i_2_CO_UNCONNECTED ;
  wire [3:2]\NLW_sgf_result_o_OBUF[38]_inst_i_2_O_UNCONNECTED ;
  wire [3:0]\NLW_sgf_result_o_OBUF[47]_inst_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_sgf_result_o_OBUF[47]_inst_i_1_O_UNCONNECTED ;

  assign \sgf_result_o[47]_3 [3:1] = \^sgf_result_o[47]_3 [3:1];
  assign \sgf_result_o[47]_3 [0] = sgf_result_o0__1_carry_n_4;
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,O}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({CO,NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_B_i[12] }),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[12] }));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0_carry__0_i_4
       (.I0(\Data_A_i[12]_2 [3]),
        .I1(CO),
        .O(\sgf_result_o[47]_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0_carry_i_1
       (.I0(\Data_A_i[12]_2 [2]),
        .I1(sgf_result_o0__1_carry__0_n_5),
        .O(\^sgf_result_o[47]_3 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0_carry_i_2
       (.I0(\Data_A_i[12]_2 [1]),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .O(\^sgf_result_o[47]_3 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0_carry_i_3
       (.I0(\Data_A_i[12]_2 [0]),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .O(\^sgf_result_o[47]_3 [1]));
  LUT2 #(
    .INIT(4'hB)) 
    sgf_result_o1__21_carry__0_i_1__1
       (.I0(Q_middle_temp__3[4]),
        .I1(sgf_result_o0__1_carry__0_n_5),
        .O(\sgf_result_o[47]_0 [3]));
  LUT3 #(
    .INIT(8'h4D)) 
    sgf_result_o1__21_carry__0_i_2__1
       (.I0(\Data_B_i[12]_2 ),
        .I1(Q_middle_temp__3[3]),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .O(\sgf_result_o[47]_0 [2]));
  (* HLUTNM = "lutpair44" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    sgf_result_o1__21_carry__0_i_3__1
       (.I0(\Data_A_i[12]_5 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(Q_middle_temp__3[2]),
        .O(\sgf_result_o[47]_0 [1]));
  (* HLUTNM = "lutpair43" *) 
  LUT3 #(
    .INIT(8'hD4)) 
    sgf_result_o1__21_carry__0_i_4__1
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_A_i[12]_4 ),
        .I2(Q_middle_temp__3[1]),
        .O(\sgf_result_o[47]_0 [0]));
  LUT4 #(
    .INIT(16'hD22D)) 
    sgf_result_o1__21_carry__0_i_5__1
       (.I0(sgf_result_o0__1_carry__0_n_5),
        .I1(Q_middle_temp__3[4]),
        .I2(CO),
        .I3(Q_middle_temp__3[5]),
        .O(\sgf_result_o[47]_2 [3]));
  LUT5 #(
    .INIT(32'h4DB2B24D)) 
    sgf_result_o1__21_carry__0_i_6__1
       (.I0(sgf_result_o0__1_carry__0_n_6),
        .I1(Q_middle_temp__3[3]),
        .I2(\Data_B_i[12]_2 ),
        .I3(sgf_result_o0__1_carry__0_n_5),
        .I4(Q_middle_temp__3[4]),
        .O(\sgf_result_o[47]_2 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry__0_i_7__1
       (.I0(\sgf_result_o[47]_0 [1]),
        .I1(Q_middle_temp__3[3]),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .I3(\Data_B_i[12]_2 ),
        .O(\sgf_result_o[47]_2 [1]));
  (* HLUTNM = "lutpair44" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    sgf_result_o1__21_carry__0_i_8__1
       (.I0(\Data_A_i[12]_5 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(Q_middle_temp__3[2]),
        .I3(\sgf_result_o[47]_0 [0]),
        .O(\sgf_result_o[47]_2 [0]));
  (* HLUTNM = "lutpair42" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__21_carry_i_1__1
       (.I0(Q_middle_temp__3[0]),
        .I1(O[2]),
        .I2(\Data_A_i[12]_3 ),
        .O(\sgf_result_o[47] [2]));
  LUT6 #(
    .INIT(64'hB2222BBB2BBB2BBB)) 
    sgf_result_o1__21_carry_i_2__1
       (.I0(\Data_B_i[16] ),
        .I1(O[1]),
        .I2(\Data_B_i[12]_1 [0]),
        .I3(\Data_A_i[12]_0 [1]),
        .I4(\Data_A_i[12]_0 [0]),
        .I5(\Data_B_i[12]_1 [1]),
        .O(\sgf_result_o[47] [1]));
  (* HLUTNM = "lutpair86" *) 
  LUT5 #(
    .INIT(32'h1747270F)) 
    sgf_result_o1__21_carry_i_3__1
       (.I0(\Data_A_i[12]_0 [0]),
        .I1(\Data_B_i[12]_1 [0]),
        .I2(O[0]),
        .I3(\Data_B_i[12]_3 ),
        .I4(\Data_A_i[12]_9 ),
        .O(\sgf_result_o[47] [0]));
  (* HLUTNM = "lutpair43" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    sgf_result_o1__21_carry_i_4__1
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_A_i[12]_4 ),
        .I2(Q_middle_temp__3[1]),
        .I3(\sgf_result_o[47] [2]),
        .O(\sgf_result_o[47]_1 [3]));
  (* HLUTNM = "lutpair42" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry_i_5__1
       (.I0(Q_middle_temp__3[0]),
        .I1(O[2]),
        .I2(\Data_A_i[12]_3 ),
        .I3(\sgf_result_o[47] [1]),
        .O(\sgf_result_o[47]_1 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__21_carry_i_6__1
       (.I0(\sgf_result_o[47] [0]),
        .I1(O[1]),
        .I2(\Data_A_i[12]_1 ),
        .I3(\Data_B_i[16] ),
        .O(\sgf_result_o[47]_1 [1]));
  (* HLUTNM = "lutpair86" *) 
  LUT5 #(
    .INIT(32'h96C3A50F)) 
    sgf_result_o1__21_carry_i_7__1
       (.I0(\Data_A_i[12]_0 [0]),
        .I1(\Data_B_i[12]_1 [0]),
        .I2(O[0]),
        .I3(\Data_B_i[12]_3 ),
        .I4(\Data_A_i[12]_9 ),
        .O(\sgf_result_o[47]_1 [0]));
  CARRY4 \sgf_result_o_OBUF[14]_inst_i_1 
       (.CI(1'b0),
        .CO({\sgf_result_o_OBUF[14]_inst_i_1_n_0 ,\sgf_result_o_OBUF[14]_inst_i_1_n_1 ,\sgf_result_o_OBUF[14]_inst_i_1_n_2 ,\sgf_result_o_OBUF[14]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({p_1_in[14:12],1'b0}),
        .O(\sgf_result_o[47]_5 [3:0]),
        .S({\sgf_result_o_OBUF[14]_inst_i_2_n_0 ,\sgf_result_o_OBUF[14]_inst_i_3_n_0 ,\sgf_result_o_OBUF[14]_inst_i_4_n_0 ,\Data_A_i[11] }));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[14]_inst_i_2 
       (.I0(p_1_in[14]),
        .I1(\Data_A_i[2] [1]),
        .O(\sgf_result_o_OBUF[14]_inst_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[14]_inst_i_3 
       (.I0(p_1_in[13]),
        .I1(\Data_A_i[2] [0]),
        .O(\sgf_result_o_OBUF[14]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[14]_inst_i_4 
       (.I0(p_1_in[12]),
        .I1(\Data_A_i[11]_0 ),
        .O(\sgf_result_o_OBUF[14]_inst_i_4_n_0 ));
  CARRY4 \sgf_result_o_OBUF[18]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[14]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[18]_inst_i_1_n_0 ,\sgf_result_o_OBUF[18]_inst_i_1_n_1 ,\sgf_result_o_OBUF[18]_inst_i_1_n_2 ,\sgf_result_o_OBUF[18]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(p_1_in[18:15]),
        .O(\sgf_result_o[47]_5 [7:4]),
        .S({\sgf_result_o_OBUF[18]_inst_i_3_n_0 ,\sgf_result_o_OBUF[18]_inst_i_4_n_0 ,\sgf_result_o_OBUF[18]_inst_i_5_n_0 ,\sgf_result_o_OBUF[18]_inst_i_6_n_0 }));
  (* HLUTNM = "lutpair61" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[18]_inst_i_10 
       (.I0(\Data_A_i[12]_6 ),
        .I1(\Data_A_i[17] [1]),
        .I2(sgf_result_o_OBUF[2]),
        .I3(\sgf_result_o_OBUF[18]_inst_i_7_n_0 ),
        .O(\sgf_result_o_OBUF[18]_inst_i_10_n_0 ));
  (* HLUTNM = "lutpair60" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[18]_inst_i_11 
       (.I0(O[2]),
        .I1(\Data_A_i[17] [0]),
        .I2(sgf_result_o_OBUF[1]),
        .I3(\sgf_result_o_OBUF[18]_inst_i_8_n_0 ),
        .O(\sgf_result_o_OBUF[18]_inst_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sgf_result_o_OBUF[18]_inst_i_12 
       (.I0(\sgf_result_o_OBUF[18]_inst_i_9_n_0 ),
        .I1(sgf_result_o_OBUF[0]),
        .I2(\Data_B_i[12]_0 ),
        .I3(O[1]),
        .O(\sgf_result_o_OBUF[18]_inst_i_12_n_0 ));
  (* HLUTNM = "lutpair89" *) 
  LUT5 #(
    .INIT(32'h78888777)) 
    \sgf_result_o_OBUF[18]_inst_i_13 
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[2]),
        .I3(Data_B_i_IBUF[2]),
        .I4(O[0]),
        .O(\sgf_result_o_OBUF[18]_inst_i_13_n_0 ));
  CARRY4 \sgf_result_o_OBUF[18]_inst_i_2 
       (.CI(1'b0),
        .CO({\sgf_result_o_OBUF[18]_inst_i_2_n_0 ,\sgf_result_o_OBUF[18]_inst_i_2_n_1 ,\sgf_result_o_OBUF[18]_inst_i_2_n_2 ,\sgf_result_o_OBUF[18]_inst_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI({\sgf_result_o_OBUF[18]_inst_i_7_n_0 ,\sgf_result_o_OBUF[18]_inst_i_8_n_0 ,\sgf_result_o_OBUF[18]_inst_i_9_n_0 ,1'b1}),
        .O(p_1_in[15:12]),
        .S({\sgf_result_o_OBUF[18]_inst_i_10_n_0 ,\sgf_result_o_OBUF[18]_inst_i_11_n_0 ,\sgf_result_o_OBUF[18]_inst_i_12_n_0 ,\sgf_result_o_OBUF[18]_inst_i_13_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[18]_inst_i_3 
       (.I0(p_1_in[18]),
        .I1(\Data_A_i[2]_0 [1]),
        .O(\sgf_result_o_OBUF[18]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[18]_inst_i_4 
       (.I0(p_1_in[17]),
        .I1(\Data_A_i[2]_0 [0]),
        .O(\sgf_result_o_OBUF[18]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[18]_inst_i_5 
       (.I0(p_1_in[16]),
        .I1(\Data_A_i[2] [3]),
        .O(\sgf_result_o_OBUF[18]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[18]_inst_i_6 
       (.I0(p_1_in[15]),
        .I1(\Data_A_i[2] [2]),
        .O(\sgf_result_o_OBUF[18]_inst_i_6_n_0 ));
  (* HLUTNM = "lutpair60" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    \sgf_result_o_OBUF[18]_inst_i_7 
       (.I0(O[2]),
        .I1(\Data_A_i[17] [0]),
        .I2(sgf_result_o_OBUF[1]),
        .O(\sgf_result_o_OBUF[18]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h87770000FFFF8777)) 
    \sgf_result_o_OBUF[18]_inst_i_8 
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_B_i_IBUF[0]),
        .I4(O[1]),
        .I5(\Data_B_i[12]_0 ),
        .O(\sgf_result_o_OBUF[18]_inst_i_8_n_0 ));
  (* HLUTNM = "lutpair89" *) 
  LUT5 #(
    .INIT(32'h7FFF0777)) 
    \sgf_result_o_OBUF[18]_inst_i_9 
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[2]),
        .I3(Data_B_i_IBUF[2]),
        .I4(O[0]),
        .O(\sgf_result_o_OBUF[18]_inst_i_9_n_0 ));
  CARRY4 \sgf_result_o_OBUF[22]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[18]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[22]_inst_i_1_n_0 ,\sgf_result_o_OBUF[22]_inst_i_1_n_1 ,\sgf_result_o_OBUF[22]_inst_i_1_n_2 ,\sgf_result_o_OBUF[22]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(p_1_in[22:19]),
        .O(\sgf_result_o[47]_5 [11:8]),
        .S({\sgf_result_o_OBUF[22]_inst_i_3_n_0 ,\sgf_result_o_OBUF[22]_inst_i_4_n_0 ,\sgf_result_o_OBUF[22]_inst_i_5_n_0 ,\sgf_result_o_OBUF[22]_inst_i_6_n_0 }));
  CARRY4 \sgf_result_o_OBUF[22]_inst_i_2 
       (.CI(\sgf_result_o_OBUF[18]_inst_i_2_n_0 ),
        .CO({\sgf_result_o_OBUF[22]_inst_i_2_n_0 ,\sgf_result_o_OBUF[22]_inst_i_2_n_1 ,\sgf_result_o_OBUF[22]_inst_i_2_n_2 ,\sgf_result_o_OBUF[22]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\Data_B_i[17] ),
        .O(p_1_in[19:16]),
        .S(\Data_B_i[17]_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[22]_inst_i_3 
       (.I0(p_1_in[22]),
        .I1(\Data_A_i[2]_1 [1]),
        .O(\sgf_result_o_OBUF[22]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[22]_inst_i_4 
       (.I0(p_1_in[21]),
        .I1(\Data_A_i[2]_1 [0]),
        .O(\sgf_result_o_OBUF[22]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[22]_inst_i_5 
       (.I0(p_1_in[20]),
        .I1(\Data_A_i[2]_0 [3]),
        .O(\sgf_result_o_OBUF[22]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[22]_inst_i_6 
       (.I0(p_1_in[19]),
        .I1(\Data_A_i[2]_0 [2]),
        .O(\sgf_result_o_OBUF[22]_inst_i_6_n_0 ));
  CARRY4 \sgf_result_o_OBUF[26]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[22]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[26]_inst_i_1_n_0 ,\sgf_result_o_OBUF[26]_inst_i_1_n_1 ,\sgf_result_o_OBUF[26]_inst_i_1_n_2 ,\sgf_result_o_OBUF[26]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(p_1_in[26:23]),
        .O(\sgf_result_o[47]_5 [15:12]),
        .S({\sgf_result_o_OBUF[26]_inst_i_3_n_0 ,\sgf_result_o_OBUF[26]_inst_i_4_n_0 ,\sgf_result_o_OBUF[26]_inst_i_5_n_0 ,\sgf_result_o_OBUF[26]_inst_i_6_n_0 }));
  CARRY4 \sgf_result_o_OBUF[26]_inst_i_2 
       (.CI(\sgf_result_o_OBUF[22]_inst_i_2_n_0 ),
        .CO({\sgf_result_o_OBUF[26]_inst_i_2_n_0 ,\sgf_result_o_OBUF[26]_inst_i_2_n_1 ,\sgf_result_o_OBUF[26]_inst_i_2_n_2 ,\sgf_result_o_OBUF[26]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\Data_A_i[14] ),
        .O(p_1_in[23:20]),
        .S(\Data_A_i[14]_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[26]_inst_i_3 
       (.I0(p_1_in[26]),
        .I1(\Data_A_i[17] [0]),
        .O(\sgf_result_o_OBUF[26]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    \sgf_result_o_OBUF[26]_inst_i_4 
       (.I0(p_1_in[25]),
        .I1(Data_B_i_IBUF[2]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_A_i_IBUF[2]),
        .I4(Data_B_i_IBUF[3]),
        .O(\sgf_result_o_OBUF[26]_inst_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \sgf_result_o_OBUF[26]_inst_i_5 
       (.I0(p_1_in[24]),
        .I1(Data_A_i_IBUF[2]),
        .I2(Data_B_i_IBUF[2]),
        .O(\sgf_result_o_OBUF[26]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[26]_inst_i_6 
       (.I0(p_1_in[23]),
        .I1(\Data_A_i[2]_1 [2]),
        .O(\sgf_result_o_OBUF[26]_inst_i_6_n_0 ));
  CARRY4 \sgf_result_o_OBUF[30]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[26]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[30]_inst_i_1_n_0 ,\sgf_result_o_OBUF[30]_inst_i_1_n_1 ,\sgf_result_o_OBUF[30]_inst_i_1_n_2 ,\sgf_result_o_OBUF[30]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(p_1_in[30:27]),
        .O(\sgf_result_o[47]_5 [19:16]),
        .S({\sgf_result_o_OBUF[30]_inst_i_3_n_0 ,\sgf_result_o_OBUF[30]_inst_i_4_n_0 ,\sgf_result_o_OBUF[30]_inst_i_5_n_0 ,\sgf_result_o_OBUF[30]_inst_i_6_n_0 }));
  CARRY4 \sgf_result_o_OBUF[30]_inst_i_2 
       (.CI(\sgf_result_o_OBUF[26]_inst_i_2_n_0 ),
        .CO({\sgf_result_o_OBUF[30]_inst_i_2_n_0 ,\sgf_result_o_OBUF[30]_inst_i_2_n_1 ,\sgf_result_o_OBUF[30]_inst_i_2_n_2 ,\sgf_result_o_OBUF[30]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\Data_A_i[13] ),
        .O(p_1_in[27:24]),
        .S(\Data_A_i[13]_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[30]_inst_i_3 
       (.I0(p_1_in[30]),
        .I1(\Data_A_i[23] [1]),
        .O(\sgf_result_o_OBUF[30]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[30]_inst_i_4 
       (.I0(p_1_in[29]),
        .I1(\Data_A_i[23] [0]),
        .O(\sgf_result_o_OBUF[30]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[30]_inst_i_5 
       (.I0(p_1_in[28]),
        .I1(\Data_A_i[17] [2]),
        .O(\sgf_result_o_OBUF[30]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[30]_inst_i_6 
       (.I0(p_1_in[27]),
        .I1(\Data_A_i[17] [1]),
        .O(\sgf_result_o_OBUF[30]_inst_i_6_n_0 ));
  CARRY4 \sgf_result_o_OBUF[34]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[30]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[34]_inst_i_1_n_0 ,\sgf_result_o_OBUF[34]_inst_i_1_n_1 ,\sgf_result_o_OBUF[34]_inst_i_1_n_2 ,\sgf_result_o_OBUF[34]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(p_1_in[34:31]),
        .O(\sgf_result_o[47]_5 [23:20]),
        .S({\sgf_result_o_OBUF[34]_inst_i_3_n_0 ,\sgf_result_o_OBUF[34]_inst_i_4_n_0 ,\sgf_result_o_OBUF[34]_inst_i_5_n_0 ,\sgf_result_o_OBUF[34]_inst_i_6_n_0 }));
  CARRY4 \sgf_result_o_OBUF[34]_inst_i_2 
       (.CI(\sgf_result_o_OBUF[30]_inst_i_2_n_0 ),
        .CO({\sgf_result_o_OBUF[34]_inst_i_2_n_0 ,\sgf_result_o_OBUF[34]_inst_i_2_n_1 ,\sgf_result_o_OBUF[34]_inst_i_2_n_2 ,\sgf_result_o_OBUF[34]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(\Data_A_i[13]_1 ),
        .O(p_1_in[31:28]),
        .S(\Data_A_i[13]_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_3 
       (.I0(p_1_in[34]),
        .I1(\Data_A_i[23]_0 [1]),
        .O(\sgf_result_o_OBUF[34]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_4 
       (.I0(p_1_in[33]),
        .I1(\Data_A_i[23]_0 [0]),
        .O(\sgf_result_o_OBUF[34]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_5 
       (.I0(p_1_in[32]),
        .I1(\Data_A_i[23] [3]),
        .O(\sgf_result_o_OBUF[34]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_6 
       (.I0(p_1_in[31]),
        .I1(\Data_A_i[23] [2]),
        .O(\sgf_result_o_OBUF[34]_inst_i_6_n_0 ));
  CARRY4 \sgf_result_o_OBUF[38]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[34]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[38]_inst_i_1_n_0 ,\sgf_result_o_OBUF[38]_inst_i_1_n_1 ,\sgf_result_o_OBUF[38]_inst_i_1_n_2 ,\sgf_result_o_OBUF[38]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,p_1_in[37:35]}),
        .O(\sgf_result_o[47]_5 [27:24]),
        .S({\Data_A_i[14]_1 ,\sgf_result_o_OBUF[38]_inst_i_5_n_0 ,\sgf_result_o_OBUF[38]_inst_i_6_n_0 ,\sgf_result_o_OBUF[38]_inst_i_7_n_0 }));
  CARRY4 \sgf_result_o_OBUF[38]_inst_i_2 
       (.CI(\sgf_result_o_OBUF[38]_inst_i_3_n_0 ),
        .CO({\NLW_sgf_result_o_OBUF[38]_inst_i_2_CO_UNCONNECTED [3:1],\sgf_result_o_OBUF[38]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\Data_A_i[12]_7 }),
        .O({\NLW_sgf_result_o_OBUF[38]_inst_i_2_O_UNCONNECTED [3:2],p_1_in[37:36]}),
        .S({1'b0,1'b0,\Data_A_i[12]_8 }));
  CARRY4 \sgf_result_o_OBUF[38]_inst_i_3 
       (.CI(\sgf_result_o_OBUF[34]_inst_i_2_n_0 ),
        .CO({\sgf_result_o_OBUF[38]_inst_i_3_n_0 ,\sgf_result_o_OBUF[38]_inst_i_3_n_1 ,\sgf_result_o_OBUF[38]_inst_i_3_n_2 ,\sgf_result_o_OBUF[38]_inst_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(\Data_A_i[13]_3 ),
        .O(p_1_in[35:32]),
        .S(\Data_A_i[13]_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_5 
       (.I0(p_1_in[37]),
        .I1(\Data_A_i[14]_5 ),
        .O(\sgf_result_o_OBUF[38]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_6 
       (.I0(p_1_in[36]),
        .I1(\Data_A_i[23]_0 [3]),
        .O(\sgf_result_o_OBUF[38]_inst_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_7 
       (.I0(p_1_in[35]),
        .I1(\Data_A_i[23]_0 [2]),
        .O(\sgf_result_o_OBUF[38]_inst_i_7_n_0 ));
  CARRY4 \sgf_result_o_OBUF[42]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[38]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[42]_inst_i_1_n_0 ,\sgf_result_o_OBUF[42]_inst_i_1_n_1 ,\sgf_result_o_OBUF[42]_inst_i_1_n_2 ,\sgf_result_o_OBUF[42]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\sgf_result_o[47]_5 [31:28]),
        .S(\Data_A_i[14]_2 ));
  CARRY4 \sgf_result_o_OBUF[46]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[42]_inst_i_1_n_0 ),
        .CO({\sgf_result_o_OBUF[46]_inst_i_1_n_0 ,\sgf_result_o_OBUF[46]_inst_i_1_n_1 ,\sgf_result_o_OBUF[46]_inst_i_1_n_2 ,\sgf_result_o_OBUF[46]_inst_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\sgf_result_o[47]_5 [35:32]),
        .S(\Data_A_i[14]_3 ));
  CARRY4 \sgf_result_o_OBUF[47]_inst_i_1 
       (.CI(\sgf_result_o_OBUF[46]_inst_i_1_n_0 ),
        .CO(\NLW_sgf_result_o_OBUF[47]_inst_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_sgf_result_o_OBUF[47]_inst_i_1_O_UNCONNECTED [3:1],\sgf_result_o[47]_5 [36]}),
        .S({1'b0,1'b0,1'b0,\Data_A_i[14]_4 }));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized4
   (\sgf_result_o[19] ,
    Q_middle_temp__2,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[27] ,
    \sgf_result_o[27]_0 ,
    \sgf_result_o[15] ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[19]_0 ,
    \sgf_result_o[19]_1 ,
    \sgf_result_o[23] ,
    \sgf_result_o[23]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[27]_1 ,
    DI,
    S,
    \Data_A_i[23] ,
    \Data_A_i[19] ,
    O,
    \Data_A_i[18] ,
    \Data_A_i[18]_0 ,
    \Data_B_i[18] ,
    \Data_A_i[18]_1 ,
    \Data_B_i[18]_0 ,
    \Data_A_i[17] ,
    \Data_A_i[23]_0 ,
    \Data_A_i[17]_0 ,
    \Data_A_i[14] ,
    \Data_A_i[20] ,
    \Data_A_i[14]_0 ,
    \Data_A_i[18]_2 ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[18]_1 ,
    \Data_B_i[21] ,
    \Data_B_i[19] ,
    \Data_B_i[22] ,
    \Data_A_i[20]_0 ,
    \Data_A_i[23]_1 ,
    \Data_A_i[20]_1 ,
    \Data_A_i[23]_2 ,
    \Data_A_i[20]_2 ,
    \Data_A_i[23]_3 ,
    \Data_A_i[23]_4 ,
    \Data_A_i[23]_5 ,
    \Data_A_i[23]_6 ,
    \Data_A_i[20]_3 ,
    \Data_B_i[22]_0 ,
    \Data_A_i[17]_1 ,
    \Data_A_i[14]_1 );
  output [2:0]\sgf_result_o[19] ;
  output [10:0]Q_middle_temp__2;
  output [3:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[27] ;
  output [1:0]\sgf_result_o[27]_0 ;
  output [2:0]\sgf_result_o[15] ;
  output [3:0]\sgf_result_o[15]_0 ;
  output [3:0]\sgf_result_o[19]_0 ;
  output [3:0]\sgf_result_o[19]_1 ;
  output [3:0]\sgf_result_o[23] ;
  output [1:0]\sgf_result_o[23]_0 ;
  output [2:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [2:0]\sgf_result_o[27]_1 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_A_i[23] ;
  input [2:0]\Data_A_i[19] ;
  input [3:0]O;
  input [3:0]\Data_A_i[18] ;
  input [3:0]\Data_A_i[18]_0 ;
  input [3:0]\Data_B_i[18] ;
  input [0:0]\Data_A_i[18]_1 ;
  input [2:0]\Data_B_i[18]_0 ;
  input [2:0]\Data_A_i[17] ;
  input [3:0]\Data_A_i[23]_0 ;
  input [3:0]\Data_A_i[17]_0 ;
  input [3:0]\Data_A_i[14] ;
  input [3:0]\Data_A_i[20] ;
  input [3:0]\Data_A_i[14]_0 ;
  input [1:0]\Data_A_i[18]_2 ;
  input [3:0]Data_B_i_IBUF;
  input [3:0]Data_A_i_IBUF;
  input \Data_B_i[18]_1 ;
  input \Data_B_i[21] ;
  input \Data_B_i[19] ;
  input \Data_B_i[22] ;
  input \Data_A_i[20]_0 ;
  input \Data_A_i[23]_1 ;
  input \Data_A_i[20]_1 ;
  input \Data_A_i[23]_2 ;
  input \Data_A_i[20]_2 ;
  input \Data_A_i[23]_3 ;
  input [3:0]\Data_A_i[23]_4 ;
  input [3:0]\Data_A_i[23]_5 ;
  input [3:0]\Data_A_i[23]_6 ;
  input [3:0]\Data_A_i[20]_3 ;
  input [1:0]\Data_B_i[22]_0 ;
  input [3:0]\Data_A_i[17]_1 ;
  input [1:0]\Data_A_i[14]_1 ;

  wire [2:0]DI;
  wire [3:0]\Data_A_i[14] ;
  wire [3:0]\Data_A_i[14]_0 ;
  wire [1:0]\Data_A_i[14]_1 ;
  wire [2:0]\Data_A_i[17] ;
  wire [3:0]\Data_A_i[17]_0 ;
  wire [3:0]\Data_A_i[17]_1 ;
  wire [3:0]\Data_A_i[18] ;
  wire [3:0]\Data_A_i[18]_0 ;
  wire [0:0]\Data_A_i[18]_1 ;
  wire [1:0]\Data_A_i[18]_2 ;
  wire [2:0]\Data_A_i[19] ;
  wire [3:0]\Data_A_i[20] ;
  wire \Data_A_i[20]_0 ;
  wire \Data_A_i[20]_1 ;
  wire \Data_A_i[20]_2 ;
  wire [3:0]\Data_A_i[20]_3 ;
  wire [2:0]\Data_A_i[23] ;
  wire [3:0]\Data_A_i[23]_0 ;
  wire \Data_A_i[23]_1 ;
  wire \Data_A_i[23]_2 ;
  wire \Data_A_i[23]_3 ;
  wire [3:0]\Data_A_i[23]_4 ;
  wire [3:0]\Data_A_i[23]_5 ;
  wire [3:0]\Data_A_i[23]_6 ;
  wire [3:0]Data_A_i_IBUF;
  wire [3:0]\Data_B_i[18] ;
  wire [2:0]\Data_B_i[18]_0 ;
  wire \Data_B_i[18]_1 ;
  wire \Data_B_i[19] ;
  wire \Data_B_i[21] ;
  wire \Data_B_i[22] ;
  wire [1:0]\Data_B_i[22]_0 ;
  wire [3:0]Data_B_i_IBUF;
  wire [3:0]O;
  wire [10:0]Q_middle_temp__2;
  wire [3:0]S;
  wire S_B0__30_carry__0_i_9__0_n_0;
  wire S_B0__30_carry__0_i_9__0_n_1;
  wire S_B0__30_carry__0_i_9__0_n_2;
  wire S_B0__30_carry__0_i_9__0_n_3;
  wire S_B0__30_carry__0_n_0;
  wire S_B0__30_carry__0_n_1;
  wire S_B0__30_carry__0_n_2;
  wire S_B0__30_carry__0_n_3;
  wire S_B0__30_carry__1_i_9__0_n_3;
  wire S_B0__30_carry__1_n_0;
  wire S_B0__30_carry__1_n_1;
  wire S_B0__30_carry__1_n_2;
  wire S_B0__30_carry__1_n_3;
  wire S_B0__30_carry__2_n_3;
  wire S_B0__30_carry_i_8__0_n_0;
  wire S_B0__30_carry_i_8__0_n_1;
  wire S_B0__30_carry_i_8__0_n_2;
  wire S_B0__30_carry_i_8__0_n_3;
  wire S_B0__30_carry_n_0;
  wire S_B0__30_carry_n_1;
  wire S_B0__30_carry_n_2;
  wire S_B0__30_carry_n_3;
  wire S_B0_carry__0_n_0;
  wire S_B0_carry__0_n_1;
  wire S_B0_carry__0_n_2;
  wire S_B0_carry__0_n_3;
  wire S_B0_carry__1_n_2;
  wire S_B0_carry__1_n_3;
  wire S_B0_carry_n_0;
  wire S_B0_carry_n_1;
  wire S_B0_carry_n_2;
  wire S_B0_carry_n_3;
  wire sgf_result_o0__1_carry__0_n_1;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_4;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire [2:0]\sgf_result_o[15] ;
  wire [3:0]\sgf_result_o[15]_0 ;
  wire [2:0]\sgf_result_o[19] ;
  wire [3:0]\^sgf_result_o[19]_0 ;
  wire [3:0]\sgf_result_o[19]_1 ;
  wire [3:0]\sgf_result_o[23] ;
  wire [1:0]\sgf_result_o[23]_0 ;
  wire [3:0]\sgf_result_o[27] ;
  wire [1:0]\sgf_result_o[27]_0 ;
  wire [2:0]\sgf_result_o[27]_1 ;
  wire [3:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [2:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:1]NLW_S_B0__30_carry__1_i_9__0_CO_UNCONNECTED;
  wire [3:2]NLW_S_B0__30_carry__1_i_9__0_O_UNCONNECTED;
  wire [3:1]NLW_S_B0__30_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_S_B0__30_carry__2_O_UNCONNECTED;
  wire [3:2]NLW_S_B0_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_S_B0_carry__1_O_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;

  assign \sgf_result_o[19]_0 [3] = sgf_result_o0__1_carry__0_n_4;
  assign \sgf_result_o[19]_0 [2:0] = \^sgf_result_o[19]_0 [2:0];
  (* HLUTNM = "lutpair25" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    S_B0__0_carry__0_i_1__2
       (.I0(\Data_A_i[20]_2 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[23]_3 ),
        .O(\sgf_result_o[19] [1]));
  (* HLUTNM = "lutpair24" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    S_B0__0_carry__0_i_2__2
       (.I0(\Data_A_i[20]_1 ),
        .I1(\Data_A_i[23]_2 ),
        .I2(sgf_result_o0__1_carry_n_4),
        .O(\sgf_result_o[19] [0]));
  LUT4 #(
    .INIT(16'h4DB2)) 
    S_B0__0_carry__0_i_4__2
       (.I0(\Data_B_i[19] ),
        .I1(\Data_B_i[22] ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .I3(\sgf_result_o[19] [2]),
        .O(\^sgf_result_o[19]_0 [2]));
  LUT4 #(
    .INIT(16'h9669)) 
    S_B0__0_carry__0_i_5__2
       (.I0(\sgf_result_o[19] [1]),
        .I1(\Data_B_i[19] ),
        .I2(\Data_B_i[22] ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(\^sgf_result_o[19]_0 [1]));
  (* HLUTNM = "lutpair25" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry__0_i_6__2
       (.I0(\Data_A_i[20]_2 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[23]_3 ),
        .I3(\sgf_result_o[19] [0]),
        .O(\^sgf_result_o[19]_0 [0]));
  (* HLUTNM = "lutpair23" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    S_B0__0_carry_i_1__2
       (.I0(\Data_A_i[20]_0 ),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[23]_1 ),
        .O(\sgf_result_o[15] [2]));
  LUT6 #(
    .INIT(64'h87770000FFFF8777)) 
    S_B0__0_carry_i_2__2
       (.I0(Data_B_i_IBUF[3]),
        .I1(Data_A_i_IBUF[2]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_B_i_IBUF[2]),
        .I4(sgf_result_o0__1_carry_n_6),
        .I5(\Data_B_i[18]_1 ),
        .O(\sgf_result_o[15] [1]));
  (* HLUTNM = "lutpair83" *) 
  LUT5 #(
    .INIT(32'h2ABFBFBF)) 
    S_B0__0_carry_i_3__2
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_A_i_IBUF[2]),
        .I4(Data_B_i_IBUF[2]),
        .O(\sgf_result_o[15] [0]));
  (* HLUTNM = "lutpair24" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_4__2
       (.I0(\Data_A_i[20]_1 ),
        .I1(\Data_A_i[23]_2 ),
        .I2(sgf_result_o0__1_carry_n_4),
        .I3(\sgf_result_o[15] [2]),
        .O(\sgf_result_o[15]_0 [3]));
  (* HLUTNM = "lutpair23" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_5__2
       (.I0(\Data_A_i[20]_0 ),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[23]_1 ),
        .I3(\sgf_result_o[15] [1]),
        .O(\sgf_result_o[15]_0 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_6__2
       (.I0(\sgf_result_o[15] [0]),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_B_i[18]_1 ),
        .I3(\Data_B_i[21] ),
        .O(\sgf_result_o[15]_0 [1]));
  (* HLUTNM = "lutpair83" *) 
  LUT5 #(
    .INIT(32'h6A959595)) 
    S_B0__0_carry_i_7__2
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_A_i_IBUF[2]),
        .I4(Data_B_i_IBUF[2]),
        .O(\sgf_result_o[15]_0 [0]));
  CARRY4 S_B0__30_carry
       (.CI(1'b0),
        .CO({S_B0__30_carry_n_0,S_B0__30_carry_n_1,S_B0__30_carry_n_2,S_B0__30_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\Data_A_i[17] ,1'b1}),
        .O(\sgf_result_o[47] ),
        .S(\Data_A_i[23]_0 ));
  CARRY4 S_B0__30_carry__0
       (.CI(S_B0__30_carry_n_0),
        .CO({S_B0__30_carry__0_n_0,S_B0__30_carry__0_n_1,S_B0__30_carry__0_n_2,S_B0__30_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\Data_A_i[17]_0 ),
        .O(\sgf_result_o[47]_0 ),
        .S(\Data_A_i[14] ));
  CARRY4 S_B0__30_carry__0_i_9__0
       (.CI(S_B0__30_carry_i_8__0_n_0),
        .CO({S_B0__30_carry__0_i_9__0_n_0,S_B0__30_carry__0_i_9__0_n_1,S_B0__30_carry__0_i_9__0_n_2,S_B0__30_carry__0_i_9__0_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[23]_6 [2:0],\Data_A_i[23]_4 [3]}),
        .O(\sgf_result_o[23] ),
        .S(\Data_A_i[20]_3 ));
  CARRY4 S_B0__30_carry__1
       (.CI(S_B0__30_carry__0_n_0),
        .CO({S_B0__30_carry__1_n_0,S_B0__30_carry__1_n_1,S_B0__30_carry__1_n_2,S_B0__30_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(\Data_A_i[20] ),
        .O(\sgf_result_o[27] ),
        .S(\Data_A_i[14]_0 ));
  CARRY4 S_B0__30_carry__1_i_9__0
       (.CI(S_B0__30_carry__0_i_9__0_n_0),
        .CO({NLW_S_B0__30_carry__1_i_9__0_CO_UNCONNECTED[3:1],S_B0__30_carry__1_i_9__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\Data_A_i[23]_6 [3]}),
        .O({NLW_S_B0__30_carry__1_i_9__0_O_UNCONNECTED[3:2],\sgf_result_o[23]_0 }),
        .S({1'b0,1'b0,\Data_B_i[22]_0 }));
  CARRY4 S_B0__30_carry__2
       (.CI(S_B0__30_carry__1_n_0),
        .CO({NLW_S_B0__30_carry__2_CO_UNCONNECTED[3:1],S_B0__30_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Q_middle_temp__2[9]}),
        .O({NLW_S_B0__30_carry__2_O_UNCONNECTED[3:2],\sgf_result_o[27]_0 }),
        .S({1'b0,1'b0,\Data_A_i[18]_2 }));
  CARRY4 S_B0__30_carry_i_8__0
       (.CI(1'b0),
        .CO({S_B0__30_carry_i_8__0_n_0,S_B0__30_carry_i_8__0_n_1,S_B0__30_carry_i_8__0_n_2,S_B0__30_carry_i_8__0_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[23]_4 [2:0],1'b0}),
        .O(\sgf_result_o[19]_1 ),
        .S(\Data_A_i[23]_5 ));
  CARRY4 S_B0_carry
       (.CI(1'b0),
        .CO({S_B0_carry_n_0,S_B0_carry_n_1,S_B0_carry_n_2,S_B0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({O[2:0],1'b0}),
        .O(Q_middle_temp__2[3:0]),
        .S(\Data_A_i[18] ));
  CARRY4 S_B0_carry__0
       (.CI(S_B0_carry_n_0),
        .CO({S_B0_carry__0_n_0,S_B0_carry__0_n_1,S_B0_carry__0_n_2,S_B0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[18]_0 [2:0],O[3]}),
        .O(Q_middle_temp__2[7:4]),
        .S(\Data_B_i[18] ));
  CARRY4 S_B0_carry__1
       (.CI(S_B0_carry__0_n_0),
        .CO({NLW_S_B0_carry__1_CO_UNCONNECTED[3:2],S_B0_carry__1_n_2,S_B0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\Data_A_i[18]_1 ,\Data_A_i[18]_0 [3]}),
        .O({NLW_S_B0_carry__1_O_UNCONNECTED[3],Q_middle_temp__2[10:8]}),
        .S({1'b0,\Data_B_i[18]_0 }));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_1,sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_A_i[23] }),
        .O({sgf_result_o0__1_carry__0_n_4,\sgf_result_o[19] [2],sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[19] }));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_17 
       (.I0(\sgf_result_o[47] [2]),
        .I1(\Data_A_i[17]_1 [2]),
        .O(\sgf_result_o[47]_1 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_18 
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_A_i[17]_1 [1]),
        .O(\sgf_result_o[47]_1 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[34]_inst_i_19 
       (.I0(\sgf_result_o[47] [0]),
        .I1(\Data_A_i[17]_1 [0]),
        .O(\sgf_result_o[47]_1 [0]));
  LUT3 #(
    .INIT(8'h6A)) 
    \sgf_result_o_OBUF[38]_inst_i_25 
       (.I0(\sgf_result_o[47]_0 [2]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .O(\sgf_result_o[47]_2 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_26 
       (.I0(\sgf_result_o[47]_0 [1]),
        .I1(\Data_A_i[14]_1 [1]),
        .O(\sgf_result_o[47]_2 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_27 
       (.I0(\sgf_result_o[47]_0 [0]),
        .I1(\Data_A_i[14]_1 [0]),
        .O(\sgf_result_o[47]_2 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[38]_inst_i_28 
       (.I0(\sgf_result_o[47] [3]),
        .I1(\Data_A_i[17]_1 [3]),
        .O(\sgf_result_o[47]_2 [0]));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    \sgf_result_o_OBUF[42]_inst_i_10 
       (.I0(\sgf_result_o[47]_0 [3]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_A_i_IBUF[1]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_B_i_IBUF[1]),
        .O(\sgf_result_o[47]_3 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[42]_inst_i_7 
       (.I0(\sgf_result_o[27] [2]),
        .I1(\sgf_result_o[19]_1 [2]),
        .O(\sgf_result_o[47]_3 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[42]_inst_i_8 
       (.I0(\sgf_result_o[27] [1]),
        .I1(\sgf_result_o[19]_1 [1]),
        .O(\sgf_result_o[47]_3 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[42]_inst_i_9 
       (.I0(\sgf_result_o[27] [0]),
        .I1(\sgf_result_o[19]_1 [0]),
        .O(\sgf_result_o[47]_3 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[46]_inst_i_10 
       (.I0(\sgf_result_o[27] [3]),
        .I1(\sgf_result_o[19]_1 [3]),
        .O(\sgf_result_o[27]_1 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[46]_inst_i_8 
       (.I0(\sgf_result_o[27]_0 [1]),
        .I1(\sgf_result_o[23] [1]),
        .O(\sgf_result_o[27]_1 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    \sgf_result_o_OBUF[46]_inst_i_9 
       (.I0(\sgf_result_o[27]_0 [0]),
        .I1(\sgf_result_o[23] [0]),
        .O(\sgf_result_o[27]_1 [1]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized40
   (O,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    S,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[47]_9 ,
    \Data_A_i[12] ,
    \Data_A_i[12]_0 ,
    \Data_B_i[12] ,
    \Data_B_i[12]_0 ,
    \Data_A_i[16] ,
    \Data_B_i[16] ,
    \Data_A_i[16]_0 ,
    \Data_B_i[12]_1 ,
    \Data_A_i[16]_1 ,
    \Data_A_i[16]_2 ,
    \Data_A_i[16]_3 ,
    \Data_A_i[16]_4 ,
    CO,
    \Data_A_i[12]_1 ,
    \Data_B_i[16]_0 ,
    \Data_B_i[12]_2 );
  output [3:0]O;
  output [1:0]\sgf_result_o[47] ;
  output \sgf_result_o[47]_0 ;
  output \sgf_result_o[47]_1 ;
  output \sgf_result_o[47]_2 ;
  output \sgf_result_o[47]_3 ;
  output \sgf_result_o[47]_4 ;
  output \sgf_result_o[47]_5 ;
  output \sgf_result_o[47]_6 ;
  output \sgf_result_o[47]_7 ;
  output [2:0]S;
  output [3:0]\sgf_result_o[47]_8 ;
  output [0:0]\sgf_result_o[47]_9 ;
  input [3:0]\Data_A_i[12] ;
  input [2:0]\Data_A_i[12]_0 ;
  input [3:0]\Data_B_i[12] ;
  input [2:0]\Data_B_i[12]_0 ;
  input \Data_A_i[16] ;
  input \Data_B_i[16] ;
  input \Data_A_i[16]_0 ;
  input \Data_B_i[12]_1 ;
  input \Data_A_i[16]_1 ;
  input \Data_A_i[16]_2 ;
  input \Data_A_i[16]_3 ;
  input \Data_A_i[16]_4 ;
  input [0:0]CO;
  input [1:0]\Data_A_i[12]_1 ;
  input \Data_B_i[16]_0 ;
  input \Data_B_i[12]_2 ;

  wire [0:0]CO;
  wire [3:0]\Data_A_i[12] ;
  wire [2:0]\Data_A_i[12]_0 ;
  wire [1:0]\Data_A_i[12]_1 ;
  wire \Data_A_i[16] ;
  wire \Data_A_i[16]_0 ;
  wire \Data_A_i[16]_1 ;
  wire \Data_A_i[16]_2 ;
  wire \Data_A_i[16]_3 ;
  wire \Data_A_i[16]_4 ;
  wire [3:0]\Data_B_i[12] ;
  wire [2:0]\Data_B_i[12]_0 ;
  wire \Data_B_i[12]_1 ;
  wire \Data_B_i[12]_2 ;
  wire \Data_B_i[16] ;
  wire \Data_B_i[16]_0 ;
  wire [3:0]O;
  wire \ODD1.middle_n_10 ;
  wire \ODD1.middle_n_11 ;
  wire \ODD1.middle_n_12 ;
  wire \ODD1.middle_n_13 ;
  wire \ODD1.middle_n_14 ;
  wire \ODD1.middle_n_16 ;
  wire \ODD1.middle_n_17 ;
  wire \ODD1.middle_n_18 ;
  wire \ODD1.middle_n_19 ;
  wire \ODD1.middle_n_7 ;
  wire \ODD1.middle_n_8 ;
  wire \ODD1.middle_n_9 ;
  wire [2:0]S;
  wire sgf_result_o1__0_carry__0_n_2;
  wire sgf_result_o1__0_carry__0_n_3;
  wire sgf_result_o1__0_carry__0_n_5;
  wire sgf_result_o1__0_carry_n_0;
  wire sgf_result_o1__0_carry_n_1;
  wire sgf_result_o1__0_carry_n_2;
  wire sgf_result_o1__0_carry_n_3;
  wire [1:0]\sgf_result_o[47] ;
  wire \sgf_result_o[47]_0 ;
  wire \sgf_result_o[47]_1 ;
  wire \sgf_result_o[47]_2 ;
  wire \sgf_result_o[47]_3 ;
  wire \sgf_result_o[47]_4 ;
  wire \sgf_result_o[47]_5 ;
  wire \sgf_result_o[47]_6 ;
  wire \sgf_result_o[47]_7 ;
  wire [3:0]\^sgf_result_o[47]_8 ;
  wire [0:0]\sgf_result_o[47]_9 ;
  wire [3:2]NLW_sgf_result_o1__0_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o1__0_carry__0_O_UNCONNECTED;

  assign \sgf_result_o[47]_8 [3] = sgf_result_o1__0_carry__0_n_5;
  assign \sgf_result_o[47]_8 [2:0] = \^sgf_result_o[47]_8 [2:0];
  Recursive_KOA__parameterized43 \ODD1.middle 
       (.DI({\ODD1.middle_n_7 ,\ODD1.middle_n_8 ,\ODD1.middle_n_9 }),
        .\Data_A_i[12] (\Data_A_i[12] ),
        .\Data_A_i[12]_0 (\Data_A_i[12]_0 ),
        .\Data_A_i[16] (\Data_A_i[16] ),
        .\Data_A_i[16]_0 (\Data_A_i[16]_0 ),
        .\Data_A_i[16]_1 (\Data_A_i[16]_1 ),
        .\Data_A_i[16]_2 (\Data_A_i[16]_2 ),
        .\Data_A_i[16]_3 (\Data_A_i[16]_4 ),
        .\Data_A_i[16]_4 (\Data_A_i[16]_3 ),
        .\Data_B_i[12] (\Data_B_i[12] ),
        .\Data_B_i[12]_0 (\Data_B_i[12]_0 ),
        .\Data_B_i[12]_1 (\Data_B_i[12]_1 ),
        .\Data_B_i[12]_2 (\Data_B_i[12]_2 ),
        .\Data_B_i[16] (\Data_B_i[16] ),
        .\Data_B_i[16]_0 (\Data_B_i[16]_0 ),
        .S({\ODD1.middle_n_10 ,\ODD1.middle_n_11 ,\ODD1.middle_n_12 }),
        .\sgf_result_o[47] (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_1 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_4 ),
        .\sgf_result_o[47]_4 (\sgf_result_o[47]_5 ),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_6 ),
        .\sgf_result_o[47]_6 ({\ODD1.middle_n_13 ,\ODD1.middle_n_14 }),
        .\sgf_result_o[47]_7 (\sgf_result_o[47]_7 ),
        .\sgf_result_o[47]_8 ({\ODD1.middle_n_16 ,\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 }));
  CARRY4 sgf_result_o1__0_carry
       (.CI(1'b0),
        .CO({sgf_result_o1__0_carry_n_0,sgf_result_o1__0_carry_n_1,sgf_result_o1__0_carry_n_2,sgf_result_o1__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\ODD1.middle_n_7 ,\ODD1.middle_n_8 ,\ODD1.middle_n_9 ,1'b1}),
        .O(O),
        .S({\ODD1.middle_n_16 ,\ODD1.middle_n_17 ,\ODD1.middle_n_18 ,\ODD1.middle_n_19 }));
  CARRY4 sgf_result_o1__0_carry__0
       (.CI(sgf_result_o1__0_carry_n_0),
        .CO({NLW_sgf_result_o1__0_carry__0_CO_UNCONNECTED[3:2],sgf_result_o1__0_carry__0_n_2,sgf_result_o1__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\ODD1.middle_n_13 ,\ODD1.middle_n_14 }),
        .O({NLW_sgf_result_o1__0_carry__0_O_UNCONNECTED[3],sgf_result_o1__0_carry__0_n_5,\sgf_result_o[47] }),
        .S({1'b0,\ODD1.middle_n_10 ,\ODD1.middle_n_11 ,\ODD1.middle_n_12 }));
  LUT3 #(
    .INIT(8'h2D)) 
    sgf_result_o1__21_carry__1_i_2__1
       (.I0(CO),
        .I1(\Data_A_i[12]_1 [0]),
        .I2(\Data_A_i[12]_1 [1]),
        .O(\sgf_result_o[47]_9 ));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_2__1
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_A_i[16]_2 ),
        .O(\^sgf_result_o[47]_8 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_3__1
       (.I0(\sgf_result_o[47] [0]),
        .I1(\Data_A_i[16]_4 ),
        .O(\^sgf_result_o[47]_8 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_4__1
       (.I0(O[3]),
        .I1(\Data_A_i[16]_3 ),
        .O(\^sgf_result_o[47]_8 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_1__1
       (.I0(O[2]),
        .I1(\Data_A_i[16]_0 ),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_2__1
       (.I0(O[1]),
        .I1(\Data_B_i[12]_1 ),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    sgf_result_o1_carry_i_3__2
       (.I0(O[0]),
        .I1(\Data_B_i[12]_2 ),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized43
   (\sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    DI,
    S,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    \Data_A_i[12] ,
    \Data_A_i[12]_0 ,
    \Data_B_i[12] ,
    \Data_B_i[12]_0 ,
    \Data_A_i[16] ,
    \Data_B_i[16] ,
    \Data_A_i[16]_0 ,
    \Data_B_i[12]_1 ,
    \Data_A_i[16]_1 ,
    \Data_A_i[16]_2 ,
    \Data_A_i[16]_3 ,
    \Data_B_i[16]_0 ,
    \Data_B_i[12]_2 ,
    \Data_A_i[16]_4 );
  output \sgf_result_o[47] ;
  output \sgf_result_o[47]_0 ;
  output \sgf_result_o[47]_1 ;
  output \sgf_result_o[47]_2 ;
  output \sgf_result_o[47]_3 ;
  output \sgf_result_o[47]_4 ;
  output \sgf_result_o[47]_5 ;
  output [2:0]DI;
  output [2:0]S;
  output [1:0]\sgf_result_o[47]_6 ;
  output \sgf_result_o[47]_7 ;
  output [3:0]\sgf_result_o[47]_8 ;
  input [3:0]\Data_A_i[12] ;
  input [2:0]\Data_A_i[12]_0 ;
  input [3:0]\Data_B_i[12] ;
  input [2:0]\Data_B_i[12]_0 ;
  input \Data_A_i[16] ;
  input \Data_B_i[16] ;
  input \Data_A_i[16]_0 ;
  input \Data_B_i[12]_1 ;
  input \Data_A_i[16]_1 ;
  input \Data_A_i[16]_2 ;
  input \Data_A_i[16]_3 ;
  input \Data_B_i[16]_0 ;
  input \Data_B_i[12]_2 ;
  input \Data_A_i[16]_4 ;

  wire [2:0]DI;
  wire [3:0]\Data_A_i[12] ;
  wire [2:0]\Data_A_i[12]_0 ;
  wire \Data_A_i[16] ;
  wire \Data_A_i[16]_0 ;
  wire \Data_A_i[16]_1 ;
  wire \Data_A_i[16]_2 ;
  wire \Data_A_i[16]_3 ;
  wire \Data_A_i[16]_4 ;
  wire [3:0]\Data_B_i[12] ;
  wire [2:0]\Data_B_i[12]_0 ;
  wire \Data_B_i[12]_1 ;
  wire \Data_B_i[12]_2 ;
  wire \Data_B_i[16] ;
  wire \Data_B_i[16]_0 ;
  wire [2:0]S;
  wire sgf_result_o0__1_carry__0_i_1__8_n_0;
  wire sgf_result_o0__1_carry__0_i_2__12_n_0;
  wire sgf_result_o0__1_carry__0_i_3__1_n_0;
  wire sgf_result_o0__1_carry__0_i_4__8_n_0;
  wire sgf_result_o0__1_carry__0_i_7__11_n_0;
  wire sgf_result_o0__1_carry__0_i_8__7_n_0;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_i_10__11_n_0;
  wire sgf_result_o0__1_carry_i_11__8_n_0;
  wire sgf_result_o0__1_carry_i_13__5_n_0;
  wire sgf_result_o0__1_carry_i_14__8_n_0;
  wire sgf_result_o0__1_carry_i_15__2_n_0;
  wire sgf_result_o0__1_carry_i_16__3_n_0;
  wire sgf_result_o0__1_carry_i_17__2_n_0;
  wire sgf_result_o0__1_carry_i_1__8_n_0;
  wire sgf_result_o0__1_carry_i_21__2_n_0;
  wire sgf_result_o0__1_carry_i_2__8_n_0;
  wire sgf_result_o0__1_carry_i_3__8_n_0;
  wire sgf_result_o0__1_carry_i_4__8_n_0;
  wire sgf_result_o0__1_carry_i_5__8_n_0;
  wire sgf_result_o0__1_carry_i_6__12_n_0;
  wire sgf_result_o0__1_carry_i_7__8_n_0;
  wire sgf_result_o0__1_carry_i_8__5_n_0;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire \sgf_result_o[47] ;
  wire \sgf_result_o[47]_0 ;
  wire \sgf_result_o[47]_1 ;
  wire \sgf_result_o[47]_2 ;
  wire \sgf_result_o[47]_3 ;
  wire \sgf_result_o[47]_4 ;
  wire \sgf_result_o[47]_5 ;
  wire [1:0]\sgf_result_o[47]_6 ;
  wire \sgf_result_o[47]_7 ;
  wire [3:0]\sgf_result_o[47]_8 ;
  wire [3:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;

  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sgf_result_o0__1_carry_i_1__8_n_0,sgf_result_o0__1_carry_i_2__8_n_0,sgf_result_o0__1_carry_i_3__8_n_0,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S({sgf_result_o0__1_carry_i_4__8_n_0,sgf_result_o0__1_carry_i_5__8_n_0,sgf_result_o0__1_carry_i_6__12_n_0,sgf_result_o0__1_carry_i_7__8_n_0}));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3:2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,sgf_result_o0__1_carry__0_i_1__8_n_0}),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b0,sgf_result_o0__1_carry__0_i_2__12_n_0,sgf_result_o0__1_carry__0_i_3__1_n_0,sgf_result_o0__1_carry__0_i_4__8_n_0}));
  LUT6 #(
    .INIT(64'h00651075107565C3)) 
    sgf_result_o0__1_carry__0_i_1__8
       (.I0(\sgf_result_o[47] ),
        .I1(sgf_result_o0__1_carry_i_13__5_n_0),
        .I2(\sgf_result_o[47]_0 ),
        .I3(\sgf_result_o[47]_1 ),
        .I4(\sgf_result_o[47]_2 ),
        .I5(sgf_result_o0__1_carry__0_i_7__11_n_0),
        .O(sgf_result_o0__1_carry__0_i_1__8_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    sgf_result_o0__1_carry__0_i_2__12
       (.I0(sgf_result_o0__1_carry__0_i_8__7_n_0),
        .I1(\sgf_result_o[47] ),
        .I2(sgf_result_o0__1_carry_i_17__2_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__12_n_0));
  LUT4 #(
    .INIT(16'h5035)) 
    sgf_result_o0__1_carry__0_i_3__1
       (.I0(sgf_result_o0__1_carry_i_17__2_n_0),
        .I1(sgf_result_o0__1_carry_i_11__8_n_0),
        .I2(sgf_result_o0__1_carry__0_i_8__7_n_0),
        .I3(\sgf_result_o[47] ),
        .O(sgf_result_o0__1_carry__0_i_3__1_n_0));
  LUT6 #(
    .INIT(64'h040404490B4646B9)) 
    sgf_result_o0__1_carry__0_i_4__8
       (.I0(sgf_result_o0__1_carry_i_13__5_n_0),
        .I1(\sgf_result_o[47]_0 ),
        .I2(\sgf_result_o[47]_1 ),
        .I3(\sgf_result_o[47]_2 ),
        .I4(sgf_result_o0__1_carry__0_i_7__11_n_0),
        .I5(\sgf_result_o[47] ),
        .O(sgf_result_o0__1_carry__0_i_4__8_n_0));
  LUT6 #(
    .INIT(64'h077FF880F880077F)) 
    sgf_result_o0__1_carry__0_i_5__1
       (.I0(\Data_A_i[12] [0]),
        .I1(\Data_A_i[12]_0 [0]),
        .I2(\Data_A_i[12] [1]),
        .I3(\Data_A_i[12]_0 [1]),
        .I4(\Data_A_i[12]_0 [2]),
        .I5(\Data_A_i[12] [2]),
        .O(\sgf_result_o[47]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry__0_i_6__12
       (.I0(\Data_A_i[12]_0 [0]),
        .I1(\Data_A_i[12] [0]),
        .I2(\Data_A_i[12]_0 [1]),
        .I3(\Data_A_i[12] [1]),
        .O(\sgf_result_o[47]_2 ));
  LUT6 #(
    .INIT(64'h0909099F099F9F9F)) 
    sgf_result_o0__1_carry__0_i_7__11
       (.I0(\Data_A_i[12] [0]),
        .I1(\Data_A_i[12]_0 [0]),
        .I2(\Data_A_i[12] [3]),
        .I3(\Data_A_i[12] [2]),
        .I4(\sgf_result_o[47]_5 ),
        .I5(\Data_A_i[12]_0 [2]),
        .O(sgf_result_o0__1_carry__0_i_7__11_n_0));
  LUT6 #(
    .INIT(64'h9000666066606000)) 
    sgf_result_o0__1_carry__0_i_8__7
       (.I0(\Data_B_i[12] [1]),
        .I1(\Data_B_i[12]_0 [1]),
        .I2(sgf_result_o0__1_carry_i_21__2_n_0),
        .I3(\Data_B_i[12] [3]),
        .I4(\Data_B_i[12]_0 [0]),
        .I5(\Data_B_i[12] [0]),
        .O(sgf_result_o0__1_carry__0_i_8__7_n_0));
  LUT6 #(
    .INIT(64'hE81717E817E8E817)) 
    sgf_result_o0__1_carry_i_10__11
       (.I0(\Data_A_i[12]_0 [2]),
        .I1(\sgf_result_o[47]_5 ),
        .I2(\Data_A_i[12] [2]),
        .I3(\Data_A_i[12] [3]),
        .I4(\Data_A_i[12]_0 [0]),
        .I5(\Data_A_i[12] [0]),
        .O(sgf_result_o0__1_carry_i_10__11_n_0));
  LUT6 #(
    .INIT(64'h0EF1F108F10808F7)) 
    sgf_result_o0__1_carry_i_11__8
       (.I0(\sgf_result_o[47]_4 ),
        .I1(\Data_A_i[12] [3]),
        .I2(\sgf_result_o[47]_2 ),
        .I3(\Data_A_i[12] [2]),
        .I4(\Data_A_i[12]_0 [2]),
        .I5(\sgf_result_o[47]_5 ),
        .O(sgf_result_o0__1_carry_i_11__8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    sgf_result_o0__1_carry_i_12__6
       (.I0(\Data_B_i[12]_0 [0]),
        .I1(\Data_B_i[12] [0]),
        .I2(\Data_B_i[12]_0 [1]),
        .I3(\Data_B_i[12] [1]),
        .O(\sgf_result_o[47]_0 ));
  LUT6 #(
    .INIT(64'h0909099F099F9F9F)) 
    sgf_result_o0__1_carry_i_13__5
       (.I0(\Data_B_i[12] [0]),
        .I1(\Data_B_i[12]_0 [0]),
        .I2(\Data_B_i[12] [3]),
        .I3(\Data_B_i[12] [2]),
        .I4(\sgf_result_o[47]_7 ),
        .I5(\Data_B_i[12]_0 [2]),
        .O(sgf_result_o0__1_carry_i_13__5_n_0));
  LUT6 #(
    .INIT(64'hE81717E817E8E817)) 
    sgf_result_o0__1_carry_i_14__8
       (.I0(\Data_B_i[12]_0 [2]),
        .I1(\sgf_result_o[47]_7 ),
        .I2(\Data_B_i[12] [2]),
        .I3(\Data_B_i[12] [3]),
        .I4(\Data_B_i[12]_0 [0]),
        .I5(\Data_B_i[12] [0]),
        .O(sgf_result_o0__1_carry_i_14__8_n_0));
  LUT3 #(
    .INIT(8'h82)) 
    sgf_result_o0__1_carry_i_15__2
       (.I0(sgf_result_o0__1_carry_i_8__5_n_0),
        .I1(\sgf_result_o[47] ),
        .I2(sgf_result_o0__1_carry__0_i_8__7_n_0),
        .O(sgf_result_o0__1_carry_i_15__2_n_0));
  LUT6 #(
    .INIT(64'h6999999699969666)) 
    sgf_result_o0__1_carry_i_16__3
       (.I0(\Data_B_i[12] [1]),
        .I1(\Data_B_i[12]_0 [1]),
        .I2(sgf_result_o0__1_carry_i_21__2_n_0),
        .I3(\Data_B_i[12] [3]),
        .I4(\Data_B_i[12]_0 [0]),
        .I5(\Data_B_i[12] [0]),
        .O(sgf_result_o0__1_carry_i_16__3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF1FF7F77F)) 
    sgf_result_o0__1_carry_i_17__2
       (.I0(\sgf_result_o[47]_4 ),
        .I1(\Data_A_i[12] [3]),
        .I2(\Data_A_i[12] [2]),
        .I3(\sgf_result_o[47]_5 ),
        .I4(\Data_A_i[12]_0 [2]),
        .I5(\sgf_result_o[47]_2 ),
        .O(sgf_result_o0__1_carry_i_17__2_n_0));
  LUT6 #(
    .INIT(64'hFEEAEAEAA8808080)) 
    sgf_result_o0__1_carry_i_18__3
       (.I0(\Data_A_i[12]_0 [2]),
        .I1(\Data_A_i[12]_0 [1]),
        .I2(\Data_A_i[12] [1]),
        .I3(\Data_A_i[12]_0 [0]),
        .I4(\Data_A_i[12] [0]),
        .I5(\Data_A_i[12] [2]),
        .O(\sgf_result_o[47]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    sgf_result_o0__1_carry_i_19__3
       (.I0(\Data_A_i[12]_0 [1]),
        .I1(\Data_A_i[12] [1]),
        .I2(\Data_A_i[12]_0 [0]),
        .I3(\Data_A_i[12] [0]),
        .O(\sgf_result_o[47]_5 ));
  LUT6 #(
    .INIT(64'h22DD22228B8B22DD)) 
    sgf_result_o0__1_carry_i_1__8
       (.I0(sgf_result_o0__1_carry_i_8__5_n_0),
        .I1(\sgf_result_o[47] ),
        .I2(sgf_result_o0__1_carry_i_10__11_n_0),
        .I3(sgf_result_o0__1_carry_i_11__8_n_0),
        .I4(\sgf_result_o[47]_0 ),
        .I5(sgf_result_o0__1_carry_i_13__5_n_0),
        .O(sgf_result_o0__1_carry_i_1__8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    sgf_result_o0__1_carry_i_20__2
       (.I0(\Data_B_i[12]_0 [1]),
        .I1(\Data_B_i[12] [1]),
        .I2(\Data_B_i[12]_0 [0]),
        .I3(\Data_B_i[12] [0]),
        .O(\sgf_result_o[47]_7 ));
  LUT6 #(
    .INIT(64'hFEEAEAEAA8808080)) 
    sgf_result_o0__1_carry_i_21__2
       (.I0(\Data_B_i[12]_0 [2]),
        .I1(\Data_B_i[12]_0 [1]),
        .I2(\Data_B_i[12] [1]),
        .I3(\Data_B_i[12]_0 [0]),
        .I4(\Data_B_i[12] [0]),
        .I5(\Data_B_i[12] [2]),
        .O(sgf_result_o0__1_carry_i_21__2_n_0));
  LUT5 #(
    .INIT(32'hA30A9039)) 
    sgf_result_o0__1_carry_i_2__8
       (.I0(sgf_result_o0__1_carry_i_8__5_n_0),
        .I1(sgf_result_o0__1_carry_i_10__11_n_0),
        .I2(sgf_result_o0__1_carry_i_13__5_n_0),
        .I3(\sgf_result_o[47]_0 ),
        .I4(\sgf_result_o[47] ),
        .O(sgf_result_o0__1_carry_i_2__8_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    sgf_result_o0__1_carry_i_3__8
       (.I0(sgf_result_o0__1_carry_i_8__5_n_0),
        .I1(sgf_result_o0__1_carry_i_14__8_n_0),
        .O(sgf_result_o0__1_carry_i_3__8_n_0));
  LUT6 #(
    .INIT(64'hAA6AAA6AAA6A5555)) 
    sgf_result_o0__1_carry_i_4__8
       (.I0(sgf_result_o0__1_carry_i_1__8_n_0),
        .I1(sgf_result_o0__1_carry_i_15__2_n_0),
        .I2(sgf_result_o0__1_carry_i_16__3_n_0),
        .I3(sgf_result_o0__1_carry_i_10__11_n_0),
        .I4(sgf_result_o0__1_carry_i_17__2_n_0),
        .I5(sgf_result_o0__1_carry_i_14__8_n_0),
        .O(sgf_result_o0__1_carry_i_4__8_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    sgf_result_o0__1_carry_i_5__8
       (.I0(sgf_result_o0__1_carry_i_2__8_n_0),
        .I1(sgf_result_o0__1_carry_i_14__8_n_0),
        .I2(sgf_result_o0__1_carry_i_11__8_n_0),
        .O(sgf_result_o0__1_carry_i_5__8_n_0));
  LUT4 #(
    .INIT(16'h44B4)) 
    sgf_result_o0__1_carry_i_6__12
       (.I0(sgf_result_o0__1_carry_i_14__8_n_0),
        .I1(sgf_result_o0__1_carry_i_8__5_n_0),
        .I2(sgf_result_o0__1_carry_i_16__3_n_0),
        .I3(sgf_result_o0__1_carry_i_10__11_n_0),
        .O(sgf_result_o0__1_carry_i_6__12_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry_i_7__8
       (.I0(sgf_result_o0__1_carry_i_10__11_n_0),
        .I1(sgf_result_o0__1_carry_i_14__8_n_0),
        .O(sgf_result_o0__1_carry_i_7__8_n_0));
  LUT6 #(
    .INIT(64'h6999999699969666)) 
    sgf_result_o0__1_carry_i_8__5
       (.I0(\Data_A_i[12] [1]),
        .I1(\Data_A_i[12]_0 [1]),
        .I2(\sgf_result_o[47]_3 ),
        .I3(\Data_A_i[12] [3]),
        .I4(\Data_A_i[12]_0 [0]),
        .I5(\Data_A_i[12] [0]),
        .O(sgf_result_o0__1_carry_i_8__5_n_0));
  LUT6 #(
    .INIT(64'h077FF880F880077F)) 
    sgf_result_o0__1_carry_i_9__1
       (.I0(\Data_B_i[12] [0]),
        .I1(\Data_B_i[12]_0 [0]),
        .I2(\Data_B_i[12] [1]),
        .I3(\Data_B_i[12]_0 [1]),
        .I4(\Data_B_i[12]_0 [2]),
        .I5(\Data_B_i[12] [2]),
        .O(\sgf_result_o[47] ));
  LUT2 #(
    .INIT(4'hB)) 
    sgf_result_o1__0_carry__0_i_1__1
       (.I0(sgf_result_o0__1_carry__0_n_7),
        .I1(\Data_B_i[12]_1 ),
        .O(\sgf_result_o[47]_6 [1]));
  (* HLUTNM = "lutpair41" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sgf_result_o1__0_carry__0_i_2__1
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_B_i[12]_2 ),
        .O(\sgf_result_o[47]_6 [0]));
  LUT3 #(
    .INIT(8'h59)) 
    sgf_result_o1__0_carry__0_i_3__1
       (.I0(sgf_result_o0__1_carry__0_n_5),
        .I1(\Data_A_i[16]_0 ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .O(S[2]));
  LUT4 #(
    .INIT(16'hD22D)) 
    sgf_result_o1__0_carry__0_i_4__1
       (.I0(\Data_B_i[12]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[16]_0 ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h96)) 
    sgf_result_o1__0_carry__0_i_5__1
       (.I0(\sgf_result_o[47]_6 [0]),
        .I1(\Data_B_i[12]_1 ),
        .I2(sgf_result_o0__1_carry__0_n_7),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_12__1
       (.I0(\Data_A_i[12] [0]),
        .I1(\Data_A_i[12]_0 [0]),
        .O(\sgf_result_o[47]_4 ));
  LUT3 #(
    .INIT(8'h71)) 
    sgf_result_o1__0_carry_i_1__1
       (.I0(\Data_A_i[16]_1 ),
        .I1(\Data_A_i[16]_2 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .O(DI[2]));
  (* HLUTNM = "lutpair40" *) 
  LUT3 #(
    .INIT(8'h71)) 
    sgf_result_o1__0_carry_i_2__1
       (.I0(\Data_A_i[16]_3 ),
        .I1(\Data_B_i[16]_0 ),
        .I2(sgf_result_o0__1_carry_n_6),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'hA22AFBBFFBBFFBBF)) 
    sgf_result_o1__0_carry_i_3__1
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\sgf_result_o[47]_4 ),
        .I2(\Data_B_i[12] [0]),
        .I3(\Data_B_i[12]_0 [0]),
        .I4(\Data_A_i[16] ),
        .I5(\Data_B_i[16] ),
        .O(DI[0]));
  (* HLUTNM = "lutpair41" *) 
  LUT5 #(
    .INIT(32'h99696966)) 
    sgf_result_o1__0_carry_i_4__1
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_B_i[12]_2 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .I3(\Data_A_i[16]_2 ),
        .I4(\Data_A_i[16]_1 ),
        .O(\sgf_result_o[47]_8 [3]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__0_carry_i_5__1
       (.I0(DI[1]),
        .I1(\Data_A_i[16]_1 ),
        .I2(sgf_result_o0__1_carry_n_5),
        .I3(\Data_A_i[16]_2 ),
        .O(\sgf_result_o[47]_8 [2]));
  (* HLUTNM = "lutpair40" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__0_carry_i_6__1
       (.I0(\Data_A_i[16]_3 ),
        .I1(\Data_B_i[16]_0 ),
        .I2(sgf_result_o0__1_carry_n_6),
        .I3(DI[0]),
        .O(\sgf_result_o[47]_8 [1]));
  LUT6 #(
    .INIT(64'h9999966996699999)) 
    sgf_result_o1__0_carry_i_7__1
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\Data_A_i[16]_4 ),
        .I2(\Data_B_i[12]_0 [0]),
        .I3(\Data_B_i[12] [0]),
        .I4(\Data_A_i[12]_0 [0]),
        .I5(\Data_A_i[12] [0]),
        .O(\sgf_result_o[47]_8 [0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized44
   (CO,
    O,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[15] ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[47]_9 ,
    DI,
    S,
    \Data_B_i[16] ,
    \Data_A_i[16] ,
    \Data_A_i[20] ,
    \Data_A_i[20]_0 ,
    \Data_B_i[20] ,
    \Data_A_i[20]_1 ,
    \Data_A_i[12] ,
    \Data_B_i[12] ,
    \Data_A_i[12]_0 ,
    \Data_A_i[12]_1 ,
    \Data_B_i[12]_0 ,
    \Data_B_i[12]_1 ,
    \Data_B_i[12]_2 ,
    \Data_B_i[12]_3 ,
    \Data_B_i[16]_0 ,
    \Data_B_i[20]_0 ,
    \Data_A_i[12]_2 ,
    \Data_A_i[16]_0 ,
    \Data_A_i[20]_2 );
  output [0:0]CO;
  output [3:0]O;
  output [3:0]\sgf_result_o[47] ;
  output [1:0]\sgf_result_o[47]_0 ;
  output [2:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [2:0]\sgf_result_o[47]_3 ;
  output [0:0]\sgf_result_o[15] ;
  output [3:0]\sgf_result_o[47]_4 ;
  output [2:0]\sgf_result_o[47]_5 ;
  output [0:0]\sgf_result_o[15]_0 ;
  output [3:0]\sgf_result_o[47]_6 ;
  output [3:0]\sgf_result_o[47]_7 ;
  output [3:0]\sgf_result_o[47]_8 ;
  output [2:0]\sgf_result_o[47]_9 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_B_i[16] ;
  input [2:0]\Data_A_i[16] ;
  input [2:0]\Data_A_i[20] ;
  input [3:0]\Data_A_i[20]_0 ;
  input [2:0]\Data_B_i[20] ;
  input [2:0]\Data_A_i[20]_1 ;
  input [2:0]\Data_A_i[12] ;
  input [0:0]\Data_B_i[12] ;
  input [3:0]\Data_A_i[12]_0 ;
  input [0:0]\Data_A_i[12]_1 ;
  input [3:0]\Data_B_i[12]_0 ;
  input \Data_B_i[12]_1 ;
  input [0:0]\Data_B_i[12]_2 ;
  input [3:0]\Data_B_i[12]_3 ;
  input [3:0]\Data_B_i[16]_0 ;
  input [1:0]\Data_B_i[20]_0 ;
  input [3:0]\Data_A_i[12]_2 ;
  input [3:0]\Data_A_i[16]_0 ;
  input [1:0]\Data_A_i[20]_2 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [2:0]\Data_A_i[12] ;
  wire [3:0]\Data_A_i[12]_0 ;
  wire [0:0]\Data_A_i[12]_1 ;
  wire [3:0]\Data_A_i[12]_2 ;
  wire [2:0]\Data_A_i[16] ;
  wire [3:0]\Data_A_i[16]_0 ;
  wire [2:0]\Data_A_i[20] ;
  wire [3:0]\Data_A_i[20]_0 ;
  wire [2:0]\Data_A_i[20]_1 ;
  wire [1:0]\Data_A_i[20]_2 ;
  wire [0:0]\Data_B_i[12] ;
  wire [3:0]\Data_B_i[12]_0 ;
  wire \Data_B_i[12]_1 ;
  wire [0:0]\Data_B_i[12]_2 ;
  wire [3:0]\Data_B_i[12]_3 ;
  wire [2:0]\Data_B_i[16] ;
  wire [3:0]\Data_B_i[16]_0 ;
  wire [2:0]\Data_B_i[20] ;
  wire [1:0]\Data_B_i[20]_0 ;
  wire \EVEN1.left_high_n_0 ;
  wire \EVEN1.left_high_n_1 ;
  wire \EVEN1.left_high_n_10 ;
  wire \EVEN1.left_high_n_11 ;
  wire \EVEN1.left_high_n_19 ;
  wire \EVEN1.left_high_n_2 ;
  wire \EVEN1.left_high_n_20 ;
  wire \EVEN1.left_high_n_21 ;
  wire \EVEN1.left_high_n_4 ;
  wire \EVEN1.left_high_n_5 ;
  wire \EVEN1.left_high_n_6 ;
  wire \EVEN1.left_high_n_7 ;
  wire \EVEN1.left_high_n_8 ;
  wire \EVEN1.left_high_n_9 ;
  wire \EVEN1.middle_n_18 ;
  wire \EVEN1.middle_n_26 ;
  wire \EVEN1.middle_n_28 ;
  wire \EVEN1.middle_n_29 ;
  wire \EVEN1.middle_n_30 ;
  wire \EVEN1.middle_n_31 ;
  wire \EVEN1.middle_n_39 ;
  wire \EVEN1.middle_n_40 ;
  wire \EVEN1.middle_n_42 ;
  wire \EVEN1.middle_n_43 ;
  wire \EVEN1.right_lower_n_0 ;
  wire \EVEN1.right_lower_n_1 ;
  wire \EVEN1.right_lower_n_10 ;
  wire \EVEN1.right_lower_n_11 ;
  wire \EVEN1.right_lower_n_12 ;
  wire \EVEN1.right_lower_n_2 ;
  wire \EVEN1.right_lower_n_21 ;
  wire \EVEN1.right_lower_n_22 ;
  wire \EVEN1.right_lower_n_3 ;
  wire \EVEN1.right_lower_n_4 ;
  wire \EVEN1.right_lower_n_5 ;
  wire \EVEN1.right_lower_n_6 ;
  wire [3:0]O;
  wire [9:2]Q_middle_temp__4;
  wire [3:0]S;
  wire S_B0__21_carry__1_i_1_n_0;
  wire S_B0_carry_i_4_n_0;
  wire S_B0_carry_i_5_n_0;
  wire sgf_result_o1__0_carry__0_i_6__2_n_0;
  wire sgf_result_o1__0_carry__0_i_7__2_n_0;
  wire sgf_result_o1__0_carry_i_10__2_n_0;
  wire sgf_result_o1__0_carry_i_11__2_n_0;
  wire sgf_result_o1__0_carry_i_13_n_0;
  wire sgf_result_o1__0_carry_i_14__2_n_0;
  wire sgf_result_o1__0_carry_i_15__2_n_0;
  wire sgf_result_o1__0_carry_i_8__2_n_0;
  wire sgf_result_o1__0_carry_i_9__2_n_0;
  wire [0:0]\sgf_result_o[15] ;
  wire [0:0]\sgf_result_o[15]_0 ;
  wire [3:0]\sgf_result_o[47] ;
  wire [1:0]\sgf_result_o[47]_0 ;
  wire [2:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [2:0]\sgf_result_o[47]_3 ;
  wire [3:0]\sgf_result_o[47]_4 ;
  wire [2:0]\sgf_result_o[47]_5 ;
  wire [3:0]\sgf_result_o[47]_6 ;
  wire [3:0]\sgf_result_o[47]_7 ;
  wire [3:0]\sgf_result_o[47]_8 ;
  wire [2:0]\sgf_result_o[47]_9 ;

  Recursive_KOA__parameterized45 \EVEN1.left_high 
       (.CO(CO),
        .DI({\EVEN1.left_high_n_8 ,\EVEN1.left_high_n_9 ,\EVEN1.left_high_n_10 ,\EVEN1.left_high_n_11 }),
        .\Data_A_i[16] ({\EVEN1.right_lower_n_0 ,\EVEN1.right_lower_n_1 ,\EVEN1.right_lower_n_2 }),
        .\Data_A_i[16]_0 (\sgf_result_o[47]_2 [0]),
        .\Data_A_i[20] (\Data_A_i[20] ),
        .\Data_A_i[20]_0 (\Data_A_i[20]_0 ),
        .\Data_A_i[20]_1 (\Data_A_i[20]_1 ),
        .\Data_A_i[20]_2 (\sgf_result_o[47] ),
        .\Data_A_i[20]_3 (\sgf_result_o[47]_0 ),
        .\Data_A_i[20]_4 (\sgf_result_o[47]_3 [0]),
        .\Data_B_i[16] (\EVEN1.right_lower_n_3 ),
        .\Data_B_i[16]_0 ({\EVEN1.right_lower_n_4 ,\EVEN1.right_lower_n_5 ,\EVEN1.right_lower_n_6 }),
        .\Data_B_i[16]_1 (\sgf_result_o[47]_4 [0]),
        .\Data_B_i[20] (\Data_B_i[20] ),
        .\Data_B_i[20]_0 (\sgf_result_o[47]_5 [0]),
        .O({\EVEN1.left_high_n_0 ,\EVEN1.left_high_n_1 ,\EVEN1.left_high_n_2 }),
        .Q_middle_temp__4(Q_middle_temp__4[7:2]),
        .S({\EVEN1.left_high_n_4 ,\EVEN1.left_high_n_5 ,\EVEN1.left_high_n_6 ,\EVEN1.left_high_n_7 }),
        .\sgf_result_o[47] (\sgf_result_o[47]_7 [3:1]),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_8 ),
        .\sgf_result_o[47]_1 (\EVEN1.left_high_n_19 ),
        .\sgf_result_o[47]_2 ({\EVEN1.left_high_n_20 ,\EVEN1.left_high_n_21 }));
  Recursive_KOA__parameterized47 \EVEN1.middle 
       (.CO(\sgf_result_o[15] ),
        .DI({\EVEN1.left_high_n_19 ,\EVEN1.right_lower_n_10 ,\EVEN1.right_lower_n_11 }),
        .\Data_A_i[12] (\Data_A_i[12]_2 ),
        .\Data_A_i[12]_0 (\Data_A_i[12]_0 [2:0]),
        .\Data_A_i[16] (\Data_A_i[16]_0 ),
        .\Data_A_i[20] ({\EVEN1.left_high_n_20 ,\EVEN1.right_lower_n_21 ,\EVEN1.right_lower_n_22 ,\EVEN1.left_high_n_21 }),
        .\Data_A_i[20]_0 ({S_B0__21_carry__1_i_1_n_0,\EVEN1.right_lower_n_12 }),
        .\Data_A_i[20]_1 (sgf_result_o1__0_carry__0_i_7__2_n_0),
        .\Data_A_i[20]_2 (sgf_result_o1__0_carry_i_13_n_0),
        .\Data_A_i[20]_3 (sgf_result_o1__0_carry_i_15__2_n_0),
        .\Data_A_i[20]_4 (sgf_result_o1__0_carry_i_10__2_n_0),
        .\Data_A_i[20]_5 (sgf_result_o1__0_carry_i_8__2_n_0),
        .\Data_A_i[20]_6 (\Data_A_i[20]_2 ),
        .\Data_B_i[12] (\Data_B_i[12]_3 ),
        .\Data_B_i[12]_0 (\Data_B_i[12]_0 [2:0]),
        .\Data_B_i[16] (\Data_B_i[16]_0 ),
        .\Data_B_i[20] ({\EVEN1.left_high_n_8 ,\EVEN1.left_high_n_9 ,\EVEN1.left_high_n_10 ,\EVEN1.left_high_n_11 }),
        .\Data_B_i[20]_0 ({\EVEN1.left_high_n_4 ,\EVEN1.left_high_n_5 ,\EVEN1.left_high_n_6 ,\EVEN1.left_high_n_7 }),
        .\Data_B_i[20]_1 (sgf_result_o1__0_carry__0_i_6__2_n_0),
        .\Data_B_i[20]_2 (sgf_result_o1__0_carry_i_11__2_n_0),
        .\Data_B_i[20]_3 (sgf_result_o1__0_carry_i_9__2_n_0),
        .\Data_B_i[20]_4 (sgf_result_o1__0_carry_i_14__2_n_0),
        .\Data_B_i[20]_5 (\Data_B_i[20]_0 ),
        .O(O),
        .Q_middle_temp__4(Q_middle_temp__4),
        .S(S_B0_carry_i_4_n_0),
        .\sgf_result_o[15] (\EVEN1.middle_n_28 ),
        .\sgf_result_o[15]_0 (\EVEN1.middle_n_30 ),
        .\sgf_result_o[15]_1 (\EVEN1.middle_n_39 ),
        .\sgf_result_o[15]_2 (\EVEN1.middle_n_40 ),
        .\sgf_result_o[15]_3 (\sgf_result_o[15]_0 ),
        .\sgf_result_o[47] (\sgf_result_o[47] ),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_1 (\EVEN1.middle_n_18 ),
        .\sgf_result_o[47]_10 (\EVEN1.middle_n_43 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_4 (\EVEN1.middle_n_26 ),
        .\sgf_result_o[47]_5 (\EVEN1.middle_n_29 ),
        .\sgf_result_o[47]_6 (\EVEN1.middle_n_31 ),
        .\sgf_result_o[47]_7 (\sgf_result_o[47]_4 ),
        .\sgf_result_o[47]_8 (\sgf_result_o[47]_5 ),
        .\sgf_result_o[47]_9 (\EVEN1.middle_n_42 ));
  Recursive_KOA__parameterized46 \EVEN1.right_lower 
       (.CO(CO),
        .DI(DI),
        .\Data_A_i[12] (\Data_A_i[12] ),
        .\Data_A_i[12]_0 (\Data_A_i[12]_0 [3]),
        .\Data_A_i[12]_1 (\Data_A_i[12]_1 ),
        .\Data_A_i[16] (\Data_A_i[16] ),
        .\Data_A_i[16]_0 (\sgf_result_o[47]_2 [0]),
        .\Data_A_i[20] (\sgf_result_o[47]_3 [0]),
        .\Data_A_i[20]_0 (O),
        .\Data_B_i[12] (\Data_B_i[12] ),
        .\Data_B_i[12]_0 (\Data_B_i[12]_0 [3]),
        .\Data_B_i[12]_1 (\Data_B_i[12]_1 ),
        .\Data_B_i[12]_2 (\Data_B_i[12]_2 ),
        .\Data_B_i[16] (\Data_B_i[16] ),
        .\Data_B_i[16]_0 (\sgf_result_o[47]_4 [0]),
        .\Data_B_i[20] (\sgf_result_o[47]_5 [0]),
        .\Data_B_i[20]_0 (sgf_result_o1__0_carry_i_11__2_n_0),
        .O({\EVEN1.left_high_n_0 ,\EVEN1.left_high_n_1 ,\EVEN1.left_high_n_2 }),
        .Q_middle_temp__4({Q_middle_temp__4[8:7],Q_middle_temp__4[2]}),
        .S(S),
        .\sgf_result_o[47] ({\EVEN1.right_lower_n_0 ,\EVEN1.right_lower_n_1 ,\EVEN1.right_lower_n_2 }),
        .\sgf_result_o[47]_0 (\EVEN1.right_lower_n_3 ),
        .\sgf_result_o[47]_1 ({\EVEN1.right_lower_n_4 ,\EVEN1.right_lower_n_5 ,\EVEN1.right_lower_n_6 }),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_3 ({\EVEN1.right_lower_n_10 ,\EVEN1.right_lower_n_11 }),
        .\sgf_result_o[47]_4 (\EVEN1.right_lower_n_12 ),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_6 ),
        .\sgf_result_o[47]_6 (\sgf_result_o[47]_7 [0]),
        .\sgf_result_o[47]_7 (\sgf_result_o[47]_9 ),
        .\sgf_result_o[47]_8 ({\EVEN1.right_lower_n_21 ,\EVEN1.right_lower_n_22 }));
  LUT1 #(
    .INIT(2'h1)) 
    S_B0__21_carry__1_i_1
       (.I0(Q_middle_temp__4[9]),
        .O(S_B0__21_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h9A9A3AC53AC59A9A)) 
    S_B0_carry_i_4
       (.I0(S_B0_carry_i_5_n_0),
        .I1(\EVEN1.middle_n_18 ),
        .I2(\EVEN1.middle_n_31 ),
        .I3(\EVEN1.middle_n_29 ),
        .I4(\sgf_result_o[47]_5 [0]),
        .I5(\sgf_result_o[47]_4 [0]),
        .O(S_B0_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h00009666)) 
    S_B0_carry_i_5
       (.I0(\sgf_result_o[47]_4 [1]),
        .I1(\sgf_result_o[47]_5 [1]),
        .I2(\sgf_result_o[47]_4 [0]),
        .I3(\sgf_result_o[47]_5 [0]),
        .I4(\EVEN1.middle_n_26 ),
        .O(S_B0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h0400464B04000B0B)) 
    sgf_result_o1__0_carry__0_i_6__2
       (.I0(\EVEN1.middle_n_26 ),
        .I1(\EVEN1.middle_n_42 ),
        .I2(\EVEN1.middle_n_18 ),
        .I3(\EVEN1.middle_n_31 ),
        .I4(\EVEN1.middle_n_29 ),
        .I5(\EVEN1.middle_n_43 ),
        .O(sgf_result_o1__0_carry__0_i_6__2_n_0));
  LUT6 #(
    .INIT(64'h0020000000330020)) 
    sgf_result_o1__0_carry__0_i_7__2
       (.I0(\EVEN1.middle_n_43 ),
        .I1(\EVEN1.middle_n_29 ),
        .I2(\EVEN1.middle_n_31 ),
        .I3(\EVEN1.middle_n_18 ),
        .I4(\EVEN1.middle_n_42 ),
        .I5(\EVEN1.middle_n_26 ),
        .O(sgf_result_o1__0_carry__0_i_7__2_n_0));
  LUT6 #(
    .INIT(64'h698E8E00E769698E)) 
    sgf_result_o1__0_carry_i_10__2
       (.I0(\sgf_result_o[15]_0 ),
        .I1(\sgf_result_o[47]_4 [3]),
        .I2(\EVEN1.middle_n_40 ),
        .I3(\sgf_result_o[47]_2 [3]),
        .I4(\sgf_result_o[15] ),
        .I5(\EVEN1.middle_n_28 ),
        .O(sgf_result_o1__0_carry_i_10__2_n_0));
  LUT6 #(
    .INIT(64'h6060609F609F6060)) 
    sgf_result_o1__0_carry_i_11__2
       (.I0(\sgf_result_o[47]_2 [0]),
        .I1(\sgf_result_o[47]_3 [0]),
        .I2(\EVEN1.middle_n_42 ),
        .I3(\EVEN1.middle_n_26 ),
        .I4(\sgf_result_o[47]_4 [0]),
        .I5(\sgf_result_o[47]_5 [0]),
        .O(sgf_result_o1__0_carry_i_11__2_n_0));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    sgf_result_o1__0_carry_i_13
       (.I0(\sgf_result_o[15]_0 ),
        .I1(\sgf_result_o[47]_4 [3]),
        .I2(\EVEN1.middle_n_40 ),
        .I3(\sgf_result_o[47]_2 [3]),
        .I4(\sgf_result_o[15] ),
        .I5(\EVEN1.middle_n_28 ),
        .O(sgf_result_o1__0_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'hBEFA7D72FEFA3236)) 
    sgf_result_o1__0_carry_i_14__2
       (.I0(\EVEN1.middle_n_26 ),
        .I1(\EVEN1.middle_n_42 ),
        .I2(\EVEN1.middle_n_18 ),
        .I3(\EVEN1.middle_n_31 ),
        .I4(\EVEN1.middle_n_29 ),
        .I5(\EVEN1.middle_n_43 ),
        .O(sgf_result_o1__0_carry_i_14__2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o1__0_carry_i_15__2
       (.I0(\EVEN1.middle_n_39 ),
        .I1(\EVEN1.middle_n_30 ),
        .O(sgf_result_o1__0_carry_i_15__2_n_0));
  LUT6 #(
    .INIT(64'h9A9A3AC53AC59A9A)) 
    sgf_result_o1__0_carry_i_8__2
       (.I0(S_B0_carry_i_5_n_0),
        .I1(\EVEN1.middle_n_18 ),
        .I2(\EVEN1.middle_n_31 ),
        .I3(\EVEN1.middle_n_29 ),
        .I4(\sgf_result_o[47]_5 [0]),
        .I5(\sgf_result_o[47]_4 [0]),
        .O(sgf_result_o1__0_carry_i_8__2_n_0));
  LUT6 #(
    .INIT(64'h71FFFFFF797171FF)) 
    sgf_result_o1__0_carry_i_9__2
       (.I0(\sgf_result_o[47]_2 [3]),
        .I1(\sgf_result_o[15] ),
        .I2(\EVEN1.middle_n_28 ),
        .I3(\sgf_result_o[47]_4 [3]),
        .I4(\sgf_result_o[15]_0 ),
        .I5(\EVEN1.middle_n_40 ),
        .O(sgf_result_o1__0_carry_i_9__2_n_0));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized45
   (O,
    CO,
    S,
    DI,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \Data_A_i[20] ,
    \Data_A_i[20]_0 ,
    \Data_B_i[20] ,
    \Data_A_i[20]_1 ,
    Q_middle_temp__4,
    \Data_B_i[16] ,
    \Data_A_i[20]_2 ,
    \Data_A_i[20]_3 ,
    \Data_A_i[16] ,
    \Data_B_i[16]_0 ,
    \Data_A_i[16]_0 ,
    \Data_A_i[20]_4 ,
    \Data_B_i[16]_1 ,
    \Data_B_i[20]_0 );
  output [2:0]O;
  output [0:0]CO;
  output [3:0]S;
  output [3:0]DI;
  output [2:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [0:0]\sgf_result_o[47]_1 ;
  output [1:0]\sgf_result_o[47]_2 ;
  input [2:0]\Data_A_i[20] ;
  input [3:0]\Data_A_i[20]_0 ;
  input [2:0]\Data_B_i[20] ;
  input [2:0]\Data_A_i[20]_1 ;
  input [5:0]Q_middle_temp__4;
  input [0:0]\Data_B_i[16] ;
  input [3:0]\Data_A_i[20]_2 ;
  input [1:0]\Data_A_i[20]_3 ;
  input [2:0]\Data_A_i[16] ;
  input [2:0]\Data_B_i[16]_0 ;
  input [0:0]\Data_A_i[16]_0 ;
  input [0:0]\Data_A_i[20]_4 ;
  input [0:0]\Data_B_i[16]_1 ;
  input [0:0]\Data_B_i[20]_0 ;

  wire [0:0]CO;
  wire [3:0]DI;
  wire [2:0]\Data_A_i[16] ;
  wire [0:0]\Data_A_i[16]_0 ;
  wire [2:0]\Data_A_i[20] ;
  wire [3:0]\Data_A_i[20]_0 ;
  wire [2:0]\Data_A_i[20]_1 ;
  wire [3:0]\Data_A_i[20]_2 ;
  wire [1:0]\Data_A_i[20]_3 ;
  wire [0:0]\Data_A_i[20]_4 ;
  wire [0:0]\Data_B_i[16] ;
  wire [2:0]\Data_B_i[16]_0 ;
  wire [0:0]\Data_B_i[16]_1 ;
  wire [2:0]\Data_B_i[20] ;
  wire [0:0]\Data_B_i[20]_0 ;
  wire [2:0]O;
  wire [5:0]Q_middle_temp__4;
  wire [3:0]S;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire [2:0]\sgf_result_o[47] ;
  wire [3:0]\^sgf_result_o[47]_0 ;
  wire [0:0]\sgf_result_o[47]_1 ;
  wire [1:0]\sgf_result_o[47]_2 ;
  wire [2:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;

  assign \sgf_result_o[47]_0 [3] = sgf_result_o0__1_carry__0_n_5;
  assign \sgf_result_o[47]_0 [2:0] = \^sgf_result_o[47]_0 [2:0];
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__21_carry__0_i_1
       (.I0(Q_middle_temp__4[4]),
        .I1(sgf_result_o0__1_carry__0_n_5),
        .I2(\Data_B_i[16]_0 [2]),
        .O(DI[3]));
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__21_carry__0_i_2
       (.I0(Q_middle_temp__4[3]),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .I2(\Data_B_i[16]_0 [1]),
        .O(DI[2]));
  (* HLUTNM = "lutpair51" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__21_carry__0_i_3
       (.I0(Q_middle_temp__4[2]),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_B_i[16]_0 [0]),
        .O(DI[1]));
  (* HLUTNM = "lutpair50" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__21_carry__0_i_4
       (.I0(Q_middle_temp__4[1]),
        .I1(sgf_result_o0__1_carry_n_4),
        .I2(\Data_A_i[16] [2]),
        .O(DI[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__21_carry__0_i_5
       (.I0(DI[3]),
        .I1(Q_middle_temp__4[5]),
        .I2(CO),
        .I3(\Data_B_i[16] ),
        .O(S[3]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__21_carry__0_i_6
       (.I0(Q_middle_temp__4[4]),
        .I1(sgf_result_o0__1_carry__0_n_5),
        .I2(\Data_B_i[16]_0 [2]),
        .I3(DI[2]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__21_carry__0_i_7
       (.I0(Q_middle_temp__4[3]),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .I2(\Data_B_i[16]_0 [1]),
        .I3(DI[1]),
        .O(S[1]));
  (* HLUTNM = "lutpair51" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__21_carry__0_i_8
       (.I0(Q_middle_temp__4[2]),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_B_i[16]_0 [0]),
        .I3(DI[0]),
        .O(S[0]));
  (* HLUTNM = "lutpair49" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__21_carry_i_1
       (.I0(Q_middle_temp__4[0]),
        .I1(O[2]),
        .I2(\Data_A_i[16] [1]),
        .O(\sgf_result_o[47]_1 ));
  (* HLUTNM = "lutpair50" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__21_carry_i_4
       (.I0(Q_middle_temp__4[1]),
        .I1(sgf_result_o0__1_carry_n_4),
        .I2(\Data_A_i[16] [2]),
        .I3(\sgf_result_o[47]_1 ),
        .O(\sgf_result_o[47]_2 [1]));
  LUT6 #(
    .INIT(64'hF99F06600660F99F)) 
    S_B0__21_carry_i_7
       (.I0(\Data_A_i[16]_0 ),
        .I1(\Data_A_i[20]_4 ),
        .I2(\Data_B_i[16]_1 ),
        .I3(\Data_B_i[20]_0 ),
        .I4(O[0]),
        .I5(\Data_A_i[16] [0]),
        .O(\sgf_result_o[47]_2 [0]));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[20] ,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,O}),
        .S(\Data_A_i[20]_0 ));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({CO,NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_B_i[20] }),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[20]_1 }));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_1
       (.I0(\Data_A_i[20]_2 [2]),
        .I1(O[2]),
        .O(\sgf_result_o[47] [2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_2__2
       (.I0(\Data_A_i[20]_2 [1]),
        .I1(O[1]),
        .O(\sgf_result_o[47] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_3__2
       (.I0(\Data_A_i[20]_2 [0]),
        .I1(O[0]),
        .O(\sgf_result_o[47] [0]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__1_i_2
       (.I0(\Data_A_i[20]_3 [1]),
        .I1(sgf_result_o0__1_carry__0_n_6),
        .O(\^sgf_result_o[47]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__1_i_3
       (.I0(\Data_A_i[20]_3 [0]),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .O(\^sgf_result_o[47]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__1_i_4
       (.I0(\Data_A_i[20]_2 [3]),
        .I1(sgf_result_o0__1_carry_n_4),
        .O(\^sgf_result_o[47]_0 [0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized46
   (\sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    DI,
    S,
    \Data_B_i[16] ,
    \Data_A_i[16] ,
    \Data_A_i[12] ,
    \Data_B_i[12] ,
    \Data_A_i[12]_0 ,
    \Data_A_i[12]_1 ,
    \Data_B_i[12]_0 ,
    \Data_B_i[20] ,
    \Data_B_i[16]_0 ,
    \Data_A_i[20] ,
    \Data_A_i[16]_0 ,
    O,
    CO,
    Q_middle_temp__4,
    \Data_A_i[20]_0 ,
    \Data_B_i[12]_1 ,
    \Data_B_i[20]_0 ,
    \Data_B_i[12]_2 );
  output [2:0]\sgf_result_o[47] ;
  output [0:0]\sgf_result_o[47]_0 ;
  output [2:0]\sgf_result_o[47]_1 ;
  output [2:0]\sgf_result_o[47]_2 ;
  output [1:0]\sgf_result_o[47]_3 ;
  output [0:0]\sgf_result_o[47]_4 ;
  output [3:0]\sgf_result_o[47]_5 ;
  output [0:0]\sgf_result_o[47]_6 ;
  output [2:0]\sgf_result_o[47]_7 ;
  output [1:0]\sgf_result_o[47]_8 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_B_i[16] ;
  input [2:0]\Data_A_i[16] ;
  input [2:0]\Data_A_i[12] ;
  input [0:0]\Data_B_i[12] ;
  input [0:0]\Data_A_i[12]_0 ;
  input [0:0]\Data_A_i[12]_1 ;
  input [0:0]\Data_B_i[12]_0 ;
  input [0:0]\Data_B_i[20] ;
  input [0:0]\Data_B_i[16]_0 ;
  input [0:0]\Data_A_i[20] ;
  input [0:0]\Data_A_i[16]_0 ;
  input [2:0]O;
  input [0:0]CO;
  input [2:0]Q_middle_temp__4;
  input [3:0]\Data_A_i[20]_0 ;
  input \Data_B_i[12]_1 ;
  input \Data_B_i[20]_0 ;
  input [0:0]\Data_B_i[12]_2 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [2:0]\Data_A_i[12] ;
  wire [0:0]\Data_A_i[12]_0 ;
  wire [0:0]\Data_A_i[12]_1 ;
  wire [2:0]\Data_A_i[16] ;
  wire [0:0]\Data_A_i[16]_0 ;
  wire [0:0]\Data_A_i[20] ;
  wire [3:0]\Data_A_i[20]_0 ;
  wire [0:0]\Data_B_i[12] ;
  wire [0:0]\Data_B_i[12]_0 ;
  wire \Data_B_i[12]_1 ;
  wire [0:0]\Data_B_i[12]_2 ;
  wire [2:0]\Data_B_i[16] ;
  wire [0:0]\Data_B_i[16]_0 ;
  wire [0:0]\Data_B_i[20] ;
  wire \Data_B_i[20]_0 ;
  wire [2:0]O;
  wire [2:0]Q_middle_temp__4;
  wire [3:0]S;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_6;
  wire [2:0]\sgf_result_o[47] ;
  wire [0:0]\sgf_result_o[47]_0 ;
  wire [2:0]\sgf_result_o[47]_1 ;
  wire [2:0]\sgf_result_o[47]_2 ;
  wire [1:0]\sgf_result_o[47]_3 ;
  wire [0:0]\sgf_result_o[47]_4 ;
  wire [3:0]\^sgf_result_o[47]_5 ;
  wire [0:0]\sgf_result_o[47]_6 ;
  wire [2:0]\sgf_result_o[47]_7 ;
  wire [1:0]\sgf_result_o[47]_8 ;
  wire [2:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;

  assign \sgf_result_o[47]_5 [3:1] = \^sgf_result_o[47]_5 [3:1];
  assign \sgf_result_o[47]_5 [0] = \sgf_result_o[47] [2];
  LUT4 #(
    .INIT(16'h8E71)) 
    S_B0__21_carry__1_i_2
       (.I0(\sgf_result_o[47]_0 ),
        .I1(CO),
        .I2(Q_middle_temp__4[1]),
        .I3(Q_middle_temp__4[2]),
        .O(\sgf_result_o[47]_4 ));
  (* HLUTNM = "lutpair48" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    S_B0__21_carry_i_2
       (.I0(\Data_B_i[20]_0 ),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(O[1]),
        .O(\sgf_result_o[47]_3 [1]));
  LUT6 #(
    .INIT(64'h000006600660FFFF)) 
    S_B0__21_carry_i_3
       (.I0(\Data_B_i[20] ),
        .I1(\Data_B_i[16]_0 ),
        .I2(\Data_A_i[20] ),
        .I3(\Data_A_i[16]_0 ),
        .I4(\sgf_result_o[47] [0]),
        .I5(O[0]),
        .O(\sgf_result_o[47]_3 [0]));
  (* HLUTNM = "lutpair49" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__21_carry_i_5
       (.I0(Q_middle_temp__4[0]),
        .I1(O[2]),
        .I2(\sgf_result_o[47] [1]),
        .I3(\sgf_result_o[47]_3 [1]),
        .O(\sgf_result_o[47]_8 [1]));
  (* HLUTNM = "lutpair48" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__21_carry_i_6
       (.I0(\Data_B_i[20]_0 ),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(O[1]),
        .I3(\sgf_result_o[47]_3 [0]),
        .O(\sgf_result_o[47]_8 [0]));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({\sgf_result_o[47] [2:1],sgf_result_o0__1_carry_n_6,\sgf_result_o[47] [0]}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({\sgf_result_o[47]_0 ,NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_B_i[16] }),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],\sgf_result_o[47]_1 }),
        .S({1'b1,\Data_A_i[16] }));
  (* HLUTNM = "lutpair52" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    sgf_result_o1__35_carry_i_1__0
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_B_i[12]_2 ),
        .I2(\Data_A_i[12] [2]),
        .O(\sgf_result_o[47]_2 [2]));
  LUT6 #(
    .INIT(64'hB2222BBB2BBB2BBB)) 
    sgf_result_o1__35_carry_i_2
       (.I0(sgf_result_o0__1_carry_n_6),
        .I1(\Data_A_i[12] [1]),
        .I2(\Data_B_i[12] ),
        .I3(\Data_A_i[12]_0 ),
        .I4(\Data_A_i[12]_1 ),
        .I5(\Data_B_i[12]_0 ),
        .O(\sgf_result_o[47]_2 [1]));
  (* HLUTNM = "lutpair88" *) 
  LUT4 #(
    .INIT(16'h2BBB)) 
    sgf_result_o1__35_carry_i_3__2
       (.I0(\sgf_result_o[47] [0]),
        .I1(\Data_A_i[12] [0]),
        .I2(\Data_A_i[12]_0 ),
        .I3(\Data_B_i[12]_0 ),
        .O(\sgf_result_o[47]_2 [0]));
  (* HLUTNM = "lutpair52" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_5__1
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_B_i[12]_2 ),
        .I2(\Data_A_i[12] [2]),
        .I3(\sgf_result_o[47]_2 [1]),
        .O(\sgf_result_o[47]_7 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__35_carry_i_6
       (.I0(\sgf_result_o[47]_2 [0]),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_A_i[12] [1]),
        .I3(\Data_B_i[12]_1 ),
        .O(\sgf_result_o[47]_7 [1]));
  (* HLUTNM = "lutpair88" *) 
  LUT4 #(
    .INIT(16'h6999)) 
    sgf_result_o1__35_carry_i_7__1
       (.I0(\sgf_result_o[47] [0]),
        .I1(\Data_A_i[12] [0]),
        .I2(\Data_A_i[12]_0 ),
        .I3(\Data_B_i[12]_0 ),
        .O(\sgf_result_o[47]_7 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry__0_i_4__2
       (.I0(\Data_A_i[20]_0 [3]),
        .I1(\sgf_result_o[47]_0 ),
        .O(\sgf_result_o[47]_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_1__2
       (.I0(\Data_A_i[20]_0 [2]),
        .I1(\sgf_result_o[47]_1 [2]),
        .O(\^sgf_result_o[47]_5 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_2__2
       (.I0(\Data_A_i[20]_0 [1]),
        .I1(\sgf_result_o[47]_1 [1]),
        .O(\^sgf_result_o[47]_5 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1_carry_i_3
       (.I0(\Data_A_i[20]_0 [0]),
        .I1(\sgf_result_o[47]_1 [0]),
        .O(\^sgf_result_o[47]_5 [1]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized47
   (Q_middle_temp__4,
    O,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    CO,
    \sgf_result_o[15] ,
    \sgf_result_o[47]_5 ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[15]_1 ,
    \sgf_result_o[15]_2 ,
    \sgf_result_o[15]_3 ,
    \sgf_result_o[47]_9 ,
    \sgf_result_o[47]_10 ,
    S,
    DI,
    \Data_A_i[20] ,
    \Data_B_i[20] ,
    \Data_B_i[20]_0 ,
    \Data_A_i[20]_0 ,
    \Data_B_i[20]_1 ,
    \Data_A_i[20]_1 ,
    \Data_A_i[20]_2 ,
    \Data_A_i[20]_3 ,
    \Data_A_i[20]_4 ,
    \Data_B_i[20]_2 ,
    \Data_A_i[20]_5 ,
    \Data_B_i[20]_3 ,
    \Data_B_i[20]_4 ,
    \Data_B_i[12] ,
    \Data_B_i[16] ,
    \Data_B_i[12]_0 ,
    \Data_B_i[20]_5 ,
    \Data_A_i[12] ,
    \Data_A_i[16] ,
    \Data_A_i[12]_0 ,
    \Data_A_i[20]_6 );
  output [7:0]Q_middle_temp__4;
  output [3:0]O;
  output [3:0]\sgf_result_o[47] ;
  output [1:0]\sgf_result_o[47]_0 ;
  output \sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [2:0]\sgf_result_o[47]_3 ;
  output \sgf_result_o[47]_4 ;
  output [0:0]CO;
  output \sgf_result_o[15] ;
  output \sgf_result_o[47]_5 ;
  output \sgf_result_o[15]_0 ;
  output \sgf_result_o[47]_6 ;
  output [3:0]\sgf_result_o[47]_7 ;
  output [2:0]\sgf_result_o[47]_8 ;
  output \sgf_result_o[15]_1 ;
  output \sgf_result_o[15]_2 ;
  output [0:0]\sgf_result_o[15]_3 ;
  output \sgf_result_o[47]_9 ;
  output \sgf_result_o[47]_10 ;
  input [0:0]S;
  input [2:0]DI;
  input [3:0]\Data_A_i[20] ;
  input [3:0]\Data_B_i[20] ;
  input [3:0]\Data_B_i[20]_0 ;
  input [1:0]\Data_A_i[20]_0 ;
  input \Data_B_i[20]_1 ;
  input \Data_A_i[20]_1 ;
  input \Data_A_i[20]_2 ;
  input \Data_A_i[20]_3 ;
  input \Data_A_i[20]_4 ;
  input \Data_B_i[20]_2 ;
  input \Data_A_i[20]_5 ;
  input \Data_B_i[20]_3 ;
  input \Data_B_i[20]_4 ;
  input [3:0]\Data_B_i[12] ;
  input [3:0]\Data_B_i[16] ;
  input [2:0]\Data_B_i[12]_0 ;
  input [1:0]\Data_B_i[20]_5 ;
  input [3:0]\Data_A_i[12] ;
  input [3:0]\Data_A_i[16] ;
  input [2:0]\Data_A_i[12]_0 ;
  input [1:0]\Data_A_i[20]_6 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [3:0]\Data_A_i[12] ;
  wire [2:0]\Data_A_i[12]_0 ;
  wire [3:0]\Data_A_i[16] ;
  wire [3:0]\Data_A_i[20] ;
  wire [1:0]\Data_A_i[20]_0 ;
  wire \Data_A_i[20]_1 ;
  wire \Data_A_i[20]_2 ;
  wire \Data_A_i[20]_3 ;
  wire \Data_A_i[20]_4 ;
  wire \Data_A_i[20]_5 ;
  wire [1:0]\Data_A_i[20]_6 ;
  wire [3:0]\Data_B_i[12] ;
  wire [2:0]\Data_B_i[12]_0 ;
  wire [3:0]\Data_B_i[16] ;
  wire [3:0]\Data_B_i[20] ;
  wire [3:0]\Data_B_i[20]_0 ;
  wire \Data_B_i[20]_1 ;
  wire \Data_B_i[20]_2 ;
  wire \Data_B_i[20]_3 ;
  wire \Data_B_i[20]_4 ;
  wire [1:0]\Data_B_i[20]_5 ;
  wire [3:0]O;
  wire \ODD1.middle_n_32 ;
  wire \ODD1.middle_n_33 ;
  wire \ODD1.middle_n_34 ;
  wire \ODD1.middle_n_35 ;
  wire \ODD1.middle_n_36 ;
  wire \ODD1.middle_n_37 ;
  wire \ODD1.middle_n_38 ;
  wire \ODD1.middle_n_39 ;
  wire \ODD1.middle_n_52 ;
  wire \ODD1.middle_n_53 ;
  wire \ODD1.middle_n_54 ;
  wire \ODD1.middle_n_55 ;
  wire [7:0]Q_middle_temp__4;
  wire [0:0]S;
  wire S_B0_carry__0_i_1_n_0;
  wire S_B0_carry__0_i_2__1_n_0;
  wire S_B0_carry__0_i_3__1_n_0;
  wire S_B0_carry__0_i_4__1_n_0;
  wire S_B0_carry_i_1__1_n_0;
  wire S_B0_carry_i_2__1_n_0;
  wire S_B0_carry_i_3__1_n_0;
  wire sgf_result_o1__0_carry__0_n_2;
  wire sgf_result_o1__0_carry__0_n_3;
  wire sgf_result_o1__0_carry__0_n_5;
  wire sgf_result_o1__0_carry__0_n_6;
  wire sgf_result_o1__0_carry__0_n_7;
  wire sgf_result_o1__0_carry_n_0;
  wire sgf_result_o1__0_carry_n_1;
  wire sgf_result_o1__0_carry_n_2;
  wire sgf_result_o1__0_carry_n_3;
  wire sgf_result_o1__0_carry_n_4;
  wire sgf_result_o1__0_carry_n_5;
  wire sgf_result_o1__0_carry_n_6;
  wire sgf_result_o1__0_carry_n_7;
  wire \sgf_result_o[15] ;
  wire \sgf_result_o[15]_0 ;
  wire \sgf_result_o[15]_1 ;
  wire \sgf_result_o[15]_2 ;
  wire [0:0]\sgf_result_o[15]_3 ;
  wire [3:0]\sgf_result_o[47] ;
  wire [1:0]\sgf_result_o[47]_0 ;
  wire \sgf_result_o[47]_1 ;
  wire \sgf_result_o[47]_10 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [2:0]\sgf_result_o[47]_3 ;
  wire \sgf_result_o[47]_4 ;
  wire \sgf_result_o[47]_5 ;
  wire \sgf_result_o[47]_6 ;
  wire [3:0]\sgf_result_o[47]_7 ;
  wire [2:0]\sgf_result_o[47]_8 ;
  wire \sgf_result_o[47]_9 ;
  wire [3:2]NLW_sgf_result_o1__0_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o1__0_carry__0_O_UNCONNECTED;

  Recursive_KOA__parameterized50 \ODD1.middle 
       (.CO(CO),
        .DI(DI),
        .\Data_A_i[12] (\Data_A_i[12] ),
        .\Data_A_i[12]_0 (\Data_A_i[12]_0 ),
        .\Data_A_i[16] (\Data_A_i[16] ),
        .\Data_A_i[20] ({sgf_result_o1__0_carry__0_n_6,sgf_result_o1__0_carry__0_n_7}),
        .\Data_A_i[20]_0 ({S_B0_carry__0_i_1_n_0,S_B0_carry__0_i_2__1_n_0,S_B0_carry__0_i_3__1_n_0,S_B0_carry__0_i_4__1_n_0}),
        .\Data_A_i[20]_1 (\Data_A_i[20] ),
        .\Data_A_i[20]_2 (\Data_A_i[20]_0 ),
        .\Data_A_i[20]_3 (\Data_A_i[20]_1 ),
        .\Data_A_i[20]_4 (\Data_A_i[20]_4 ),
        .\Data_A_i[20]_5 (\Data_A_i[20]_5 ),
        .\Data_A_i[20]_6 (\Data_A_i[20]_2 ),
        .\Data_A_i[20]_7 (\Data_A_i[20]_6 ),
        .\Data_A_i[20]_8 (\Data_A_i[20]_3 ),
        .\Data_B_i[12] (\Data_B_i[12] ),
        .\Data_B_i[12]_0 (\Data_B_i[12]_0 ),
        .\Data_B_i[16] (\Data_B_i[16] ),
        .\Data_B_i[20] (\Data_B_i[20] ),
        .\Data_B_i[20]_0 (\Data_B_i[20]_0 ),
        .\Data_B_i[20]_1 (\Data_B_i[20]_1 ),
        .\Data_B_i[20]_2 (\Data_B_i[20]_2 ),
        .\Data_B_i[20]_3 (\Data_B_i[20]_3 ),
        .\Data_B_i[20]_4 (\Data_B_i[20]_4 ),
        .\Data_B_i[20]_5 (\Data_B_i[20]_5 ),
        .O({sgf_result_o1__0_carry_n_4,sgf_result_o1__0_carry_n_5,sgf_result_o1__0_carry_n_6,sgf_result_o1__0_carry_n_7}),
        .Q_middle_temp__4(Q_middle_temp__4),
        .S({S_B0_carry_i_1__1_n_0,S_B0_carry_i_2__1_n_0,S_B0_carry_i_3__1_n_0,S}),
        .\sgf_result_o[15] (\sgf_result_o[15] ),
        .\sgf_result_o[15]_0 (\sgf_result_o[15]_0 ),
        .\sgf_result_o[15]_1 ({\ODD1.middle_n_37 ,\ODD1.middle_n_38 ,\ODD1.middle_n_39 }),
        .\sgf_result_o[15]_2 (\sgf_result_o[15]_1 ),
        .\sgf_result_o[15]_3 (\sgf_result_o[15]_2 ),
        .\sgf_result_o[15]_4 (\sgf_result_o[15]_3 ),
        .\sgf_result_o[15]_5 ({\ODD1.middle_n_52 ,\ODD1.middle_n_53 ,\ODD1.middle_n_54 ,\ODD1.middle_n_55 }),
        .\sgf_result_o[19] ({\ODD1.middle_n_32 ,\ODD1.middle_n_33 }),
        .\sgf_result_o[19]_0 ({\ODD1.middle_n_34 ,\ODD1.middle_n_35 ,\ODD1.middle_n_36 }),
        .\sgf_result_o[47] (O),
        .\sgf_result_o[47]_0 (\sgf_result_o[47] ),
        .\sgf_result_o[47]_1 (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_10 (\sgf_result_o[47]_9 ),
        .\sgf_result_o[47]_11 (\sgf_result_o[47]_10 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_4 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_4 ),
        .\sgf_result_o[47]_6 (\sgf_result_o[47]_5 ),
        .\sgf_result_o[47]_7 (\sgf_result_o[47]_6 ),
        .\sgf_result_o[47]_8 (\sgf_result_o[47]_7 ),
        .\sgf_result_o[47]_9 (\sgf_result_o[47]_8 ));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry__0_i_1
       (.I0(sgf_result_o1__0_carry__0_n_5),
        .I1(\Data_A_i[20]_2 ),
        .O(S_B0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0_carry__0_i_2__1
       (.I0(sgf_result_o1__0_carry__0_n_6),
        .I1(\Data_B_i[20]_3 ),
        .O(S_B0_carry__0_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry__0_i_3__1
       (.I0(sgf_result_o1__0_carry__0_n_7),
        .I1(\Data_A_i[20]_4 ),
        .O(S_B0_carry__0_i_3__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry__0_i_4__1
       (.I0(sgf_result_o1__0_carry_n_4),
        .I1(\Data_A_i[20]_3 ),
        .O(S_B0_carry__0_i_4__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry_i_1__1
       (.I0(sgf_result_o1__0_carry_n_5),
        .I1(\Data_A_i[20]_1 ),
        .O(S_B0_carry_i_1__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry_i_2__1
       (.I0(sgf_result_o1__0_carry_n_6),
        .I1(\Data_B_i[20]_1 ),
        .O(S_B0_carry_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0_carry_i_3__1
       (.I0(sgf_result_o1__0_carry_n_7),
        .I1(\Data_B_i[20]_4 ),
        .O(S_B0_carry_i_3__1_n_0));
  CARRY4 sgf_result_o1__0_carry
       (.CI(1'b0),
        .CO({sgf_result_o1__0_carry_n_0,sgf_result_o1__0_carry_n_1,sgf_result_o1__0_carry_n_2,sgf_result_o1__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\ODD1.middle_n_37 ,\ODD1.middle_n_38 ,\ODD1.middle_n_39 ,1'b1}),
        .O({sgf_result_o1__0_carry_n_4,sgf_result_o1__0_carry_n_5,sgf_result_o1__0_carry_n_6,sgf_result_o1__0_carry_n_7}),
        .S({\ODD1.middle_n_52 ,\ODD1.middle_n_53 ,\ODD1.middle_n_54 ,\ODD1.middle_n_55 }));
  CARRY4 sgf_result_o1__0_carry__0
       (.CI(sgf_result_o1__0_carry_n_0),
        .CO({NLW_sgf_result_o1__0_carry__0_CO_UNCONNECTED[3:2],sgf_result_o1__0_carry__0_n_2,sgf_result_o1__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\ODD1.middle_n_32 ,\ODD1.middle_n_33 }),
        .O({NLW_sgf_result_o1__0_carry__0_O_UNCONNECTED[3],sgf_result_o1__0_carry__0_n_5,sgf_result_o1__0_carry__0_n_6,sgf_result_o1__0_carry__0_n_7}),
        .S({1'b0,\ODD1.middle_n_34 ,\ODD1.middle_n_35 ,\ODD1.middle_n_36 }));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized5
   (\sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    Data_A_i_IBUF,
    Data_B_i_IBUF,
    \Data_B_i[12] ,
    \Data_B_i[15] ,
    \Data_B_i[13] ,
    \Data_B_i[16] ,
    \Data_A_i[14] ,
    \Data_A_i[17] ,
    \Data_A_i[17]_0 ,
    \Data_A_i[14]_0 ,
    \Data_A_i[14]_1 ,
    \Data_A_i[17]_1 ,
    S,
    \Data_B_i[16]_0 );
  output [3:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [1:0]\sgf_result_o[47]_1 ;
  input [5:0]Data_A_i_IBUF;
  input [5:0]Data_B_i_IBUF;
  input \Data_B_i[12] ;
  input \Data_B_i[15] ;
  input \Data_B_i[13] ;
  input \Data_B_i[16] ;
  input \Data_A_i[14] ;
  input \Data_A_i[17] ;
  input \Data_A_i[17]_0 ;
  input \Data_A_i[14]_0 ;
  input \Data_A_i[14]_1 ;
  input \Data_A_i[17]_1 ;
  input [0:0]S;
  input [0:0]\Data_B_i[16]_0 ;

  wire \Data_A_i[14] ;
  wire \Data_A_i[14]_0 ;
  wire \Data_A_i[14]_1 ;
  wire \Data_A_i[17] ;
  wire \Data_A_i[17]_0 ;
  wire \Data_A_i[17]_1 ;
  wire [5:0]Data_A_i_IBUF;
  wire \Data_B_i[12] ;
  wire \Data_B_i[13] ;
  wire \Data_B_i[15] ;
  wire \Data_B_i[16] ;
  wire [0:0]\Data_B_i[16]_0 ;
  wire [5:0]Data_B_i_IBUF;
  wire \EVEN1.middle_n_0 ;
  wire \EVEN1.middle_n_1 ;
  wire \EVEN1.middle_n_10 ;
  wire \EVEN1.middle_n_11 ;
  wire \EVEN1.middle_n_12 ;
  wire \EVEN1.middle_n_13 ;
  wire \EVEN1.middle_n_2 ;
  wire \EVEN1.middle_n_3 ;
  wire \EVEN1.middle_n_4 ;
  wire \EVEN1.middle_n_5 ;
  wire \EVEN1.middle_n_6 ;
  wire \EVEN1.middle_n_7 ;
  wire \EVEN1.middle_n_8 ;
  wire \EVEN1.middle_n_9 ;
  wire [0:0]S;
  wire S_B0__0_carry__0_n_1;
  wire S_B0__0_carry__0_n_2;
  wire S_B0__0_carry__0_n_3;
  wire S_B0__0_carry__0_n_4;
  wire S_B0__0_carry__0_n_5;
  wire S_B0__0_carry__0_n_6;
  wire S_B0__0_carry__0_n_7;
  wire S_B0__0_carry_n_0;
  wire S_B0__0_carry_n_1;
  wire S_B0__0_carry_n_2;
  wire S_B0__0_carry_n_3;
  wire S_B0__0_carry_n_4;
  wire S_B0__0_carry_n_5;
  wire S_B0__0_carry_n_6;
  wire S_B0__0_carry_n_7;
  wire S_B0__30_carry__0_i_15__0_n_0;
  wire S_B0__30_carry__0_i_16_n_0;
  wire S_B0__30_carry__0_i_17_n_0;
  wire S_B0__30_carry__0_i_18_n_0;
  wire S_B0__30_carry__1_i_14_n_0;
  wire S_B0__30_carry_i_14_n_0;
  wire S_B0__30_carry_i_15_n_0;
  wire S_B0__30_carry_i_16_n_0;
  wire sgf_result_o0__1_carry__0_i_10__2_n_0;
  wire sgf_result_o0__1_carry__0_i_1__3_n_0;
  wire sgf_result_o0__1_carry__0_i_2__2_n_0;
  wire sgf_result_o0__1_carry__0_i_3__12_n_0;
  wire sgf_result_o0__1_carry__0_i_4__3_n_0;
  wire sgf_result_o0__1_carry__0_i_5__5_n_0;
  wire sgf_result_o0__1_carry__0_i_6__3_n_0;
  wire sgf_result_o0__1_carry__0_i_7__9_n_0;
  wire sgf_result_o0__1_carry__0_i_8__2_n_0;
  wire sgf_result_o0__1_carry__0_i_9__1_n_0;
  wire sgf_result_o0__1_carry_i_10__8_n_0;
  wire sgf_result_o0__1_carry_i_11__3_n_0;
  wire sgf_result_o0__1_carry_i_12__3_n_0;
  wire sgf_result_o0__1_carry_i_13__2_n_0;
  wire sgf_result_o0__1_carry_i_14__5_n_0;
  wire sgf_result_o0__1_carry_i_1__3_n_0;
  wire sgf_result_o0__1_carry_i_2__3_n_0;
  wire sgf_result_o0__1_carry_i_3__3_n_0;
  wire sgf_result_o0__1_carry_i_4__3_n_0;
  wire sgf_result_o0__1_carry_i_5__3_n_0;
  wire sgf_result_o0__1_carry_i_6__2_n_0;
  wire sgf_result_o0__1_carry_i_7__3_n_0;
  wire sgf_result_o0__1_carry_i_8__2_n_0;
  wire sgf_result_o0__1_carry_i_9__10_n_0;
  wire [3:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [1:0]\sgf_result_o[47]_1 ;
  wire [3:3]NLW_S_B0__0_carry__0_CO_UNCONNECTED;

  Recursive_KOA__parameterized8 \EVEN1.middle 
       (.DI({sgf_result_o0__1_carry_i_1__3_n_0,sgf_result_o0__1_carry_i_2__3_n_0,sgf_result_o0__1_carry_i_3__3_n_0}),
        .\Data_A_i[13] ({sgf_result_o0__1_carry__0_i_4__3_n_0,sgf_result_o0__1_carry__0_i_5__5_n_0,sgf_result_o0__1_carry__0_i_6__3_n_0}),
        .\Data_A_i[14] (\Data_A_i[14] ),
        .\Data_A_i[14]_0 (\Data_A_i[14]_0 ),
        .\Data_A_i[14]_1 (\Data_A_i[14]_1 ),
        .\Data_A_i[14]_2 ({S_B0__30_carry__0_i_15__0_n_0,S_B0__30_carry__0_i_16_n_0,S_B0__30_carry__0_i_17_n_0,S_B0__30_carry__0_i_18_n_0}),
        .\Data_A_i[17] ({sgf_result_o0__1_carry__0_i_1__3_n_0,sgf_result_o0__1_carry__0_i_2__2_n_0,sgf_result_o0__1_carry__0_i_3__12_n_0}),
        .\Data_A_i[17]_0 (\Data_A_i[17] ),
        .\Data_A_i[17]_1 (\Data_A_i[17]_0 ),
        .\Data_A_i[17]_2 (\Data_A_i[17]_1 ),
        .\Data_A_i[17]_3 ({S_B0__30_carry_i_14_n_0,S_B0__30_carry_i_15_n_0,S_B0__30_carry_i_16_n_0,S}),
        .\Data_A_i[17]_4 ({S_B0__0_carry__0_n_4,S_B0__0_carry__0_n_5,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .Data_A_i_IBUF({Data_A_i_IBUF[4:3],Data_A_i_IBUF[0]}),
        .\Data_B_i[12] (\Data_B_i[12] ),
        .\Data_B_i[13] (\Data_B_i[13] ),
        .\Data_B_i[15] (\Data_B_i[15] ),
        .\Data_B_i[16] (\Data_B_i[16] ),
        .\Data_B_i[16]_0 ({\Data_B_i[16]_0 ,S_B0__30_carry__1_i_14_n_0}),
        .Data_B_i_IBUF({Data_B_i_IBUF[4:3],Data_B_i_IBUF[0]}),
        .O({S_B0__0_carry_n_4,S_B0__0_carry_n_5,S_B0__0_carry_n_6,S_B0__0_carry_n_7}),
        .S({sgf_result_o0__1_carry_i_4__3_n_0,sgf_result_o0__1_carry_i_5__3_n_0,sgf_result_o0__1_carry_i_6__2_n_0,sgf_result_o0__1_carry_i_7__3_n_0}),
        .\sgf_result_o[47] ({\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 }),
        .\sgf_result_o[47]_0 ({\EVEN1.middle_n_3 ,\EVEN1.middle_n_4 ,\EVEN1.middle_n_5 }),
        .\sgf_result_o[47]_1 ({\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 ,\EVEN1.middle_n_8 ,\EVEN1.middle_n_9 }),
        .\sgf_result_o[47]_2 ({\EVEN1.middle_n_10 ,\EVEN1.middle_n_11 ,\EVEN1.middle_n_12 ,\EVEN1.middle_n_13 }),
        .\sgf_result_o[47]_3 (\sgf_result_o[47] ),
        .\sgf_result_o[47]_4 (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_5 (\sgf_result_o[47]_1 ));
  CARRY4 S_B0__0_carry
       (.CI(1'b0),
        .CO({S_B0__0_carry_n_0,S_B0__0_carry_n_1,S_B0__0_carry_n_2,S_B0__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\EVEN1.middle_n_3 ,\EVEN1.middle_n_4 ,\EVEN1.middle_n_5 ,1'b1}),
        .O({S_B0__0_carry_n_4,S_B0__0_carry_n_5,S_B0__0_carry_n_6,S_B0__0_carry_n_7}),
        .S({\EVEN1.middle_n_6 ,\EVEN1.middle_n_7 ,\EVEN1.middle_n_8 ,\EVEN1.middle_n_9 }));
  CARRY4 S_B0__0_carry__0
       (.CI(S_B0__0_carry_n_0),
        .CO({NLW_S_B0__0_carry__0_CO_UNCONNECTED[3],S_B0__0_carry__0_n_1,S_B0__0_carry__0_n_2,S_B0__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\EVEN1.middle_n_0 ,\EVEN1.middle_n_1 ,\EVEN1.middle_n_2 }),
        .O({S_B0__0_carry__0_n_4,S_B0__0_carry__0_n_5,S_B0__0_carry__0_n_6,S_B0__0_carry__0_n_7}),
        .S({\EVEN1.middle_n_10 ,\EVEN1.middle_n_11 ,\EVEN1.middle_n_12 ,\EVEN1.middle_n_13 }));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry__0_i_15__0
       (.I0(S_B0__0_carry__0_n_5),
        .I1(\Data_A_i[17]_0 ),
        .O(S_B0__30_carry__0_i_15__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry__0_i_16
       (.I0(S_B0__0_carry__0_n_6),
        .I1(\Data_A_i[17] ),
        .O(S_B0__30_carry__0_i_16_n_0));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    S_B0__30_carry__0_i_17
       (.I0(S_B0__0_carry__0_n_7),
        .I1(Data_B_i_IBUF[3]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_B_i_IBUF[4]),
        .O(S_B0__30_carry__0_i_17_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    S_B0__30_carry__0_i_18
       (.I0(S_B0__0_carry_n_4),
        .I1(Data_A_i_IBUF[3]),
        .I2(Data_B_i_IBUF[3]),
        .O(S_B0__30_carry__0_i_18_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry__1_i_14
       (.I0(S_B0__0_carry__0_n_4),
        .I1(\Data_A_i[17]_1 ),
        .O(S_B0__30_carry__1_i_14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0__30_carry_i_14
       (.I0(S_B0__0_carry_n_5),
        .I1(\Data_B_i[13] ),
        .O(S_B0__30_carry_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry_i_15
       (.I0(S_B0__0_carry_n_6),
        .I1(\Data_A_i[14]_1 ),
        .O(S_B0__30_carry_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0__30_carry_i_16
       (.I0(S_B0__0_carry_n_7),
        .I1(\Data_A_i[14]_0 ),
        .O(S_B0__30_carry_i_16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry__0_i_10__2
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[4]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_8__2_n_0),
        .O(sgf_result_o0__1_carry__0_i_10__2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_1__3
       (.I0(sgf_result_o0__1_carry_i_11__3_n_0),
        .I1(sgf_result_o0__1_carry_i_13__2_n_0),
        .O(sgf_result_o0__1_carry__0_i_1__3_n_0));
  LUT5 #(
    .INIT(32'h14000000)) 
    sgf_result_o0__1_carry__0_i_2__2
       (.I0(sgf_result_o0__1_carry_i_13__2_n_0),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(sgf_result_o0__1_carry_i_3__3_n_0),
        .I4(sgf_result_o0__1_carry_i_10__8_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__2_n_0));
  LUT6 #(
    .INIT(64'h1EE11EE11EE1E11E)) 
    sgf_result_o0__1_carry__0_i_3__12
       (.I0(sgf_result_o0__1_carry_i_12__3_n_0),
        .I1(sgf_result_o0__1_carry_i_8__2_n_0),
        .I2(sgf_result_o0__1_carry__0_i_2__2_n_0),
        .I3(sgf_result_o0__1_carry__0_i_7__9_n_0),
        .I4(sgf_result_o0__1_carry_i_9__10_n_0),
        .I5(sgf_result_o0__1_carry_i_13__2_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__12_n_0));
  LUT6 #(
    .INIT(64'h000001010003FCE8)) 
    sgf_result_o0__1_carry__0_i_4__3
       (.I0(sgf_result_o0__1_carry_i_9__10_n_0),
        .I1(sgf_result_o0__1_carry_i_12__3_n_0),
        .I2(sgf_result_o0__1_carry_i_8__2_n_0),
        .I3(sgf_result_o0__1_carry_i_14__5_n_0),
        .I4(sgf_result_o0__1_carry_i_13__2_n_0),
        .I5(sgf_result_o0__1_carry_i_11__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_4__3_n_0));
  LUT6 #(
    .INIT(64'h9996999699966669)) 
    sgf_result_o0__1_carry__0_i_5__5
       (.I0(sgf_result_o0__1_carry__0_i_2__2_n_0),
        .I1(sgf_result_o0__1_carry__0_i_8__2_n_0),
        .I2(sgf_result_o0__1_carry_i_12__3_n_0),
        .I3(sgf_result_o0__1_carry_i_13__2_n_0),
        .I4(sgf_result_o0__1_carry_i_8__2_n_0),
        .I5(sgf_result_o0__1_carry_i_11__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_5__5_n_0));
  LUT6 #(
    .INIT(64'hA595AA99AAA9AAAA)) 
    sgf_result_o0__1_carry__0_i_6__3
       (.I0(sgf_result_o0__1_carry__0_i_3__12_n_0),
        .I1(sgf_result_o0__1_carry_i_14__5_n_0),
        .I2(sgf_result_o0__1_carry_i_11__3_n_0),
        .I3(sgf_result_o0__1_carry_i_12__3_n_0),
        .I4(sgf_result_o0__1_carry__0_i_9__1_n_0),
        .I5(sgf_result_o0__1_carry__0_i_10__2_n_0),
        .O(sgf_result_o0__1_carry__0_i_6__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry__0_i_7__9
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_11__3_n_0),
        .O(sgf_result_o0__1_carry__0_i_7__9_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFEEEE0)) 
    sgf_result_o0__1_carry__0_i_8__2
       (.I0(sgf_result_o0__1_carry_i_11__3_n_0),
        .I1(sgf_result_o0__1_carry_i_14__5_n_0),
        .I2(sgf_result_o0__1_carry_i_8__2_n_0),
        .I3(sgf_result_o0__1_carry_i_12__3_n_0),
        .I4(sgf_result_o0__1_carry_i_9__10_n_0),
        .I5(sgf_result_o0__1_carry_i_13__2_n_0),
        .O(sgf_result_o0__1_carry__0_i_8__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry__0_i_9__1
       (.I0(Data_A_i_IBUF[0]),
        .I1(Data_A_i_IBUF[3]),
        .O(sgf_result_o0__1_carry__0_i_9__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o0__1_carry_i_10__8
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(sgf_result_o0__1_carry_i_12__3_n_0),
        .O(sgf_result_o0__1_carry_i_10__8_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_11__3
       (.I0(Data_B_i_IBUF[1]),
        .I1(Data_B_i_IBUF[4]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .I4(Data_B_i_IBUF[2]),
        .I5(Data_B_i_IBUF[5]),
        .O(sgf_result_o0__1_carry_i_11__3_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_12__3
       (.I0(Data_B_i_IBUF[5]),
        .I1(Data_B_i_IBUF[2]),
        .I2(Data_B_i_IBUF[3]),
        .I3(Data_B_i_IBUF[0]),
        .I4(Data_B_i_IBUF[4]),
        .I5(Data_B_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_12__3_n_0));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    sgf_result_o0__1_carry_i_13__2
       (.I0(Data_A_i_IBUF[1]),
        .I1(Data_A_i_IBUF[4]),
        .I2(Data_A_i_IBUF[0]),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_A_i_IBUF[2]),
        .I5(Data_A_i_IBUF[5]),
        .O(sgf_result_o0__1_carry_i_13__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_14__5
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_A_i_IBUF[4]),
        .I3(Data_A_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_14__5_n_0));
  LUT6 #(
    .INIT(64'hE1E1E1E1E11E1EE1)) 
    sgf_result_o0__1_carry_i_1__3
       (.I0(sgf_result_o0__1_carry_i_8__2_n_0),
        .I1(sgf_result_o0__1_carry_i_9__10_n_0),
        .I2(sgf_result_o0__1_carry_i_10__8_n_0),
        .I3(Data_A_i_IBUF[3]),
        .I4(Data_A_i_IBUF[0]),
        .I5(sgf_result_o0__1_carry_i_11__3_n_0),
        .O(sgf_result_o0__1_carry_i_1__3_n_0));
  LUT6 #(
    .INIT(64'h0906060609F9F906)) 
    sgf_result_o0__1_carry_i_2__3
       (.I0(Data_A_i_IBUF[4]),
        .I1(Data_A_i_IBUF[1]),
        .I2(sgf_result_o0__1_carry_i_9__10_n_0),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_A_i_IBUF[3]),
        .I5(sgf_result_o0__1_carry_i_12__3_n_0),
        .O(sgf_result_o0__1_carry_i_2__3_n_0));
  LUT6 #(
    .INIT(64'h6006066006600660)) 
    sgf_result_o0__1_carry_i_3__3
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[1]),
        .I3(Data_B_i_IBUF[4]),
        .I4(Data_B_i_IBUF[0]),
        .I5(Data_B_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_3__3_n_0));
  LUT6 #(
    .INIT(64'h6A6A6A6A6A95956A)) 
    sgf_result_o0__1_carry_i_4__3
       (.I0(sgf_result_o0__1_carry_i_1__3_n_0),
        .I1(sgf_result_o0__1_carry_i_10__8_n_0),
        .I2(sgf_result_o0__1_carry_i_3__3_n_0),
        .I3(Data_B_i_IBUF[3]),
        .I4(Data_B_i_IBUF[0]),
        .I5(sgf_result_o0__1_carry_i_13__2_n_0),
        .O(sgf_result_o0__1_carry_i_4__3_n_0));
  LUT4 #(
    .INIT(16'hA99A)) 
    sgf_result_o0__1_carry_i_5__3
       (.I0(sgf_result_o0__1_carry_i_2__3_n_0),
        .I1(sgf_result_o0__1_carry_i_8__2_n_0),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_B_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_5__3_n_0));
  LUT6 #(
    .INIT(64'h141414EB14EB1414)) 
    sgf_result_o0__1_carry_i_6__2
       (.I0(sgf_result_o0__1_carry_i_14__5_n_0),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(sgf_result_o0__1_carry_i_9__10_n_0),
        .I4(Data_A_i_IBUF[0]),
        .I5(Data_A_i_IBUF[3]),
        .O(sgf_result_o0__1_carry_i_6__2_n_0));
  LUT4 #(
    .INIT(16'h0660)) 
    sgf_result_o0__1_carry_i_7__3
       (.I0(Data_A_i_IBUF[3]),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[3]),
        .I3(Data_B_i_IBUF[0]),
        .O(sgf_result_o0__1_carry_i_7__3_n_0));
  LUT6 #(
    .INIT(64'h6666699969999999)) 
    sgf_result_o0__1_carry_i_8__2
       (.I0(Data_A_i_IBUF[5]),
        .I1(Data_A_i_IBUF[2]),
        .I2(Data_A_i_IBUF[3]),
        .I3(Data_A_i_IBUF[0]),
        .I4(Data_A_i_IBUF[4]),
        .I5(Data_A_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_8__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_9__10
       (.I0(Data_B_i_IBUF[3]),
        .I1(Data_B_i_IBUF[0]),
        .I2(Data_B_i_IBUF[4]),
        .I3(Data_B_i_IBUF[1]),
        .O(sgf_result_o0__1_carry_i_9__10_n_0));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized50
   (Q_middle_temp__4,
    \sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    CO,
    \sgf_result_o[15] ,
    \sgf_result_o[47]_6 ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[47]_7 ,
    \sgf_result_o[19] ,
    \sgf_result_o[19]_0 ,
    \sgf_result_o[15]_1 ,
    \sgf_result_o[47]_8 ,
    \sgf_result_o[47]_9 ,
    \sgf_result_o[15]_2 ,
    \sgf_result_o[15]_3 ,
    \sgf_result_o[15]_4 ,
    \sgf_result_o[47]_10 ,
    \sgf_result_o[47]_11 ,
    \sgf_result_o[15]_5 ,
    O,
    S,
    \Data_A_i[20] ,
    \Data_A_i[20]_0 ,
    DI,
    \Data_A_i[20]_1 ,
    \Data_B_i[20] ,
    \Data_B_i[20]_0 ,
    \Data_A_i[20]_2 ,
    \Data_B_i[20]_1 ,
    \Data_A_i[20]_3 ,
    \Data_A_i[20]_4 ,
    \Data_B_i[20]_2 ,
    \Data_A_i[20]_5 ,
    \Data_B_i[20]_3 ,
    \Data_A_i[20]_6 ,
    \Data_B_i[20]_4 ,
    \Data_B_i[12] ,
    \Data_B_i[16] ,
    \Data_B_i[12]_0 ,
    \Data_B_i[20]_5 ,
    \Data_A_i[12] ,
    \Data_A_i[16] ,
    \Data_A_i[12]_0 ,
    \Data_A_i[20]_7 ,
    \Data_A_i[20]_8 );
  output [7:0]Q_middle_temp__4;
  output [3:0]\sgf_result_o[47] ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [1:0]\sgf_result_o[47]_1 ;
  output \sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [2:0]\sgf_result_o[47]_4 ;
  output \sgf_result_o[47]_5 ;
  output [0:0]CO;
  output \sgf_result_o[15] ;
  output \sgf_result_o[47]_6 ;
  output \sgf_result_o[15]_0 ;
  output \sgf_result_o[47]_7 ;
  output [1:0]\sgf_result_o[19] ;
  output [2:0]\sgf_result_o[19]_0 ;
  output [2:0]\sgf_result_o[15]_1 ;
  output [3:0]\sgf_result_o[47]_8 ;
  output [2:0]\sgf_result_o[47]_9 ;
  output \sgf_result_o[15]_2 ;
  output \sgf_result_o[15]_3 ;
  output [0:0]\sgf_result_o[15]_4 ;
  output \sgf_result_o[47]_10 ;
  output \sgf_result_o[47]_11 ;
  output [3:0]\sgf_result_o[15]_5 ;
  input [3:0]O;
  input [3:0]S;
  input [1:0]\Data_A_i[20] ;
  input [3:0]\Data_A_i[20]_0 ;
  input [2:0]DI;
  input [3:0]\Data_A_i[20]_1 ;
  input [3:0]\Data_B_i[20] ;
  input [3:0]\Data_B_i[20]_0 ;
  input [1:0]\Data_A_i[20]_2 ;
  input \Data_B_i[20]_1 ;
  input \Data_A_i[20]_3 ;
  input \Data_A_i[20]_4 ;
  input \Data_B_i[20]_2 ;
  input \Data_A_i[20]_5 ;
  input \Data_B_i[20]_3 ;
  input \Data_A_i[20]_6 ;
  input \Data_B_i[20]_4 ;
  input [3:0]\Data_B_i[12] ;
  input [3:0]\Data_B_i[16] ;
  input [2:0]\Data_B_i[12]_0 ;
  input [1:0]\Data_B_i[20]_5 ;
  input [3:0]\Data_A_i[12] ;
  input [3:0]\Data_A_i[16] ;
  input [2:0]\Data_A_i[12]_0 ;
  input [1:0]\Data_A_i[20]_7 ;
  input \Data_A_i[20]_8 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [3:0]\Data_A_i[12] ;
  wire [2:0]\Data_A_i[12]_0 ;
  wire [3:0]\Data_A_i[16] ;
  wire [1:0]\Data_A_i[20] ;
  wire [3:0]\Data_A_i[20]_0 ;
  wire [3:0]\Data_A_i[20]_1 ;
  wire [1:0]\Data_A_i[20]_2 ;
  wire \Data_A_i[20]_3 ;
  wire \Data_A_i[20]_4 ;
  wire \Data_A_i[20]_5 ;
  wire \Data_A_i[20]_6 ;
  wire [1:0]\Data_A_i[20]_7 ;
  wire \Data_A_i[20]_8 ;
  wire [3:0]\Data_B_i[12] ;
  wire [2:0]\Data_B_i[12]_0 ;
  wire [3:0]\Data_B_i[16] ;
  wire [3:0]\Data_B_i[20] ;
  wire [3:0]\Data_B_i[20]_0 ;
  wire \Data_B_i[20]_1 ;
  wire \Data_B_i[20]_2 ;
  wire \Data_B_i[20]_3 ;
  wire \Data_B_i[20]_4 ;
  wire [1:0]\Data_B_i[20]_5 ;
  wire [3:0]O;
  wire [7:0]Q_middle_temp__4;
  wire [3:0]S;
  wire S_B0__21_carry__0_n_0;
  wire S_B0__21_carry__0_n_1;
  wire S_B0__21_carry__0_n_2;
  wire S_B0__21_carry__0_n_3;
  wire S_B0__21_carry__1_n_3;
  wire S_B0__21_carry_n_0;
  wire S_B0__21_carry_n_1;
  wire S_B0__21_carry_n_2;
  wire S_B0__21_carry_n_3;
  wire S_B0_carry__0_n_1;
  wire S_B0_carry__0_n_2;
  wire S_B0_carry__0_n_3;
  wire S_B0_carry_n_0;
  wire S_B0_carry_n_1;
  wire S_B0_carry_n_2;
  wire S_B0_carry_n_3;
  wire sgf_result_o0__1_carry__0_i_1__12_n_0;
  wire sgf_result_o0__1_carry__0_i_2__10_n_0;
  wire sgf_result_o0__1_carry__0_i_3__2_n_0;
  wire sgf_result_o0__1_carry__0_i_4__12_n_0;
  wire sgf_result_o0__1_carry__0_i_5__12_n_0;
  wire sgf_result_o0__1_carry__0_i_6_n_0;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_5;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_i_10__5_n_0;
  wire sgf_result_o0__1_carry_i_12__8_n_0;
  wire sgf_result_o0__1_carry_i_13__7_n_0;
  wire sgf_result_o0__1_carry_i_15__4_n_0;
  wire sgf_result_o0__1_carry_i_16__1_n_0;
  wire sgf_result_o0__1_carry_i_17__3_n_0;
  wire sgf_result_o0__1_carry_i_1__12_n_0;
  wire sgf_result_o0__1_carry_i_23__0_n_0;
  wire sgf_result_o0__1_carry_i_25__0_n_0;
  wire sgf_result_o0__1_carry_i_26__0_n_0;
  wire sgf_result_o0__1_carry_i_2__12_n_0;
  wire sgf_result_o0__1_carry_i_3__12_n_0;
  wire sgf_result_o0__1_carry_i_4__12_n_0;
  wire sgf_result_o0__1_carry_i_5__12_n_0;
  wire sgf_result_o0__1_carry_i_6__9_n_0;
  wire sgf_result_o0__1_carry_i_7__12_n_0;
  wire sgf_result_o0__1_carry_i_8__11_n_0;
  wire sgf_result_o0__1_carry_i_8__11_n_1;
  wire sgf_result_o0__1_carry_i_8__11_n_2;
  wire sgf_result_o0__1_carry_i_8__11_n_3;
  wire sgf_result_o0__1_carry_i_8__12_n_2;
  wire sgf_result_o0__1_carry_i_8__12_n_3;
  wire sgf_result_o0__1_carry_i_8__7_n_0;
  wire sgf_result_o0__1_carry_i_9__2_n_0;
  wire sgf_result_o0__1_carry_i_9__6_n_0;
  wire sgf_result_o0__1_carry_i_9__6_n_1;
  wire sgf_result_o0__1_carry_i_9__6_n_2;
  wire sgf_result_o0__1_carry_i_9__6_n_3;
  wire sgf_result_o0__1_carry_i_9__7_n_2;
  wire sgf_result_o0__1_carry_i_9__7_n_3;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire \sgf_result_o[15] ;
  wire \sgf_result_o[15]_0 ;
  wire [2:0]\sgf_result_o[15]_1 ;
  wire \sgf_result_o[15]_2 ;
  wire \sgf_result_o[15]_3 ;
  wire [0:0]\sgf_result_o[15]_4 ;
  wire [3:0]\sgf_result_o[15]_5 ;
  wire [1:0]\sgf_result_o[19] ;
  wire [2:0]\sgf_result_o[19]_0 ;
  wire [3:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [1:0]\sgf_result_o[47]_1 ;
  wire \sgf_result_o[47]_10 ;
  wire \sgf_result_o[47]_11 ;
  wire \sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [2:0]\sgf_result_o[47]_4 ;
  wire \sgf_result_o[47]_5 ;
  wire \sgf_result_o[47]_6 ;
  wire \sgf_result_o[47]_7 ;
  wire [3:0]\sgf_result_o[47]_8 ;
  wire [2:0]\sgf_result_o[47]_9 ;
  wire [3:1]NLW_S_B0__21_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_S_B0__21_carry__1_O_UNCONNECTED;
  wire [3:3]NLW_S_B0_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED;
  wire [2:2]NLW_sgf_result_o0__1_carry_i_8__12_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry_i_8__12_O_UNCONNECTED;
  wire [2:2]NLW_sgf_result_o0__1_carry_i_9__7_CO_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry_i_9__7_O_UNCONNECTED;

  CARRY4 S_B0__21_carry
       (.CI(1'b0),
        .CO({S_B0__21_carry_n_0,S_B0__21_carry_n_1,S_B0__21_carry_n_2,S_B0__21_carry_n_3}),
        .CYINIT(1'b1),
        .DI({DI,1'b1}),
        .O(\sgf_result_o[47] ),
        .S(\Data_A_i[20]_1 ));
  CARRY4 S_B0__21_carry__0
       (.CI(S_B0__21_carry_n_0),
        .CO({S_B0__21_carry__0_n_0,S_B0__21_carry__0_n_1,S_B0__21_carry__0_n_2,S_B0__21_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\Data_B_i[20] ),
        .O(\sgf_result_o[47]_0 ),
        .S(\Data_B_i[20]_0 ));
  CARRY4 S_B0__21_carry__1
       (.CI(S_B0__21_carry__0_n_0),
        .CO({NLW_S_B0__21_carry__1_CO_UNCONNECTED[3:1],S_B0__21_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Q_middle_temp__4[6]}),
        .O({NLW_S_B0__21_carry__1_O_UNCONNECTED[3:2],\sgf_result_o[47]_1 }),
        .S({1'b0,1'b0,\Data_A_i[20]_2 }));
  CARRY4 S_B0_carry
       (.CI(1'b0),
        .CO({S_B0_carry_n_0,S_B0_carry_n_1,S_B0_carry_n_2,S_B0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({O[2:0],1'b0}),
        .O(Q_middle_temp__4[3:0]),
        .S(S));
  CARRY4 S_B0_carry__0
       (.CI(S_B0_carry_n_0),
        .CO({NLW_S_B0_carry__0_CO_UNCONNECTED[3],S_B0_carry__0_n_1,S_B0_carry__0_n_2,S_B0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_A_i[20] ,O[3]}),
        .O(Q_middle_temp__4[7:4]),
        .S(\Data_A_i[20]_0 ));
  LUT6 #(
    .INIT(64'h077FF880F880077F)) 
    S_B0_carry_i_6
       (.I0(\sgf_result_o[47]_3 [0]),
        .I1(\sgf_result_o[47]_4 [0]),
        .I2(\sgf_result_o[47]_3 [1]),
        .I3(\sgf_result_o[47]_4 [1]),
        .I4(\sgf_result_o[47]_4 [2]),
        .I5(\sgf_result_o[47]_3 [2]),
        .O(\sgf_result_o[47]_6 ));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({sgf_result_o0__1_carry_i_1__12_n_0,sgf_result_o0__1_carry_i_2__12_n_0,sgf_result_o0__1_carry_i_3__12_n_0,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S({sgf_result_o0__1_carry_i_4__12_n_0,sgf_result_o0__1_carry_i_5__12_n_0,sgf_result_o0__1_carry_i_6__9_n_0,sgf_result_o0__1_carry_i_7__12_n_0}));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3:2],sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,sgf_result_o0__1_carry__0_i_1__12_n_0}),
        .O({NLW_sgf_result_o0__1_carry__0_O_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_5,sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b0,sgf_result_o0__1_carry__0_i_2__10_n_0,sgf_result_o0__1_carry__0_i_3__2_n_0,sgf_result_o0__1_carry__0_i_4__12_n_0}));
  LUT6 #(
    .INIT(64'h11F1F1FF1111F11F)) 
    sgf_result_o0__1_carry__0_i_1__12
       (.I0(sgf_result_o0__1_carry_i_16__1_n_0),
        .I1(sgf_result_o0__1_carry_i_9__2_n_0),
        .I2(sgf_result_o0__1_carry_i_12__8_n_0),
        .I3(\sgf_result_o[47]_2 ),
        .I4(sgf_result_o0__1_carry_i_8__7_n_0),
        .I5(sgf_result_o0__1_carry_i_10__5_n_0),
        .O(sgf_result_o0__1_carry__0_i_1__12_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    sgf_result_o0__1_carry__0_i_2__10
       (.I0(sgf_result_o0__1_carry__0_i_5__12_n_0),
        .I1(sgf_result_o0__1_carry_i_16__1_n_0),
        .O(sgf_result_o0__1_carry__0_i_2__10_n_0));
  LUT4 #(
    .INIT(16'h3503)) 
    sgf_result_o0__1_carry__0_i_3__2
       (.I0(sgf_result_o0__1_carry_i_8__7_n_0),
        .I1(sgf_result_o0__1_carry_i_16__1_n_0),
        .I2(\sgf_result_o[47]_2 ),
        .I3(sgf_result_o0__1_carry_i_12__8_n_0),
        .O(sgf_result_o0__1_carry__0_i_3__2_n_0));
  LUT6 #(
    .INIT(64'h1C1FFF1111111C1F)) 
    sgf_result_o0__1_carry__0_i_4__12
       (.I0(sgf_result_o0__1_carry_i_16__1_n_0),
        .I1(sgf_result_o0__1_carry_i_9__2_n_0),
        .I2(sgf_result_o0__1_carry_i_8__7_n_0),
        .I3(sgf_result_o0__1_carry_i_10__5_n_0),
        .I4(\sgf_result_o[47]_2 ),
        .I5(sgf_result_o0__1_carry_i_12__8_n_0),
        .O(sgf_result_o0__1_carry__0_i_4__12_n_0));
  LUT6 #(
    .INIT(64'hAAAAFFEBFFEBFFFF)) 
    sgf_result_o0__1_carry__0_i_5__12
       (.I0(\sgf_result_o[47]_2 ),
        .I1(\sgf_result_o[47]_8 [0]),
        .I2(\sgf_result_o[47]_9 [0]),
        .I3(\sgf_result_o[15]_2 ),
        .I4(\sgf_result_o[47]_10 ),
        .I5(sgf_result_o0__1_carry__0_i_6_n_0),
        .O(sgf_result_o0__1_carry__0_i_5__12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    sgf_result_o0__1_carry__0_i_6
       (.I0(\sgf_result_o[47]_8 [3]),
        .I1(\sgf_result_o[15]_4 ),
        .I2(\sgf_result_o[47]_8 [2]),
        .I3(sgf_result_o0__1_carry_i_26__0_n_0),
        .I4(\sgf_result_o[47]_9 [2]),
        .O(sgf_result_o0__1_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'hF069690F96F0F069)) 
    sgf_result_o0__1_carry_i_10__5
       (.I0(\sgf_result_o[47]_3 [0]),
        .I1(\sgf_result_o[47]_4 [0]),
        .I2(\sgf_result_o[47]_5 ),
        .I3(\sgf_result_o[47]_3 [3]),
        .I4(CO),
        .I5(\sgf_result_o[15] ),
        .O(sgf_result_o0__1_carry_i_10__5_n_0));
  LUT6 #(
    .INIT(64'h077FF880F880077F)) 
    sgf_result_o0__1_carry_i_11__11
       (.I0(\sgf_result_o[47]_8 [0]),
        .I1(\sgf_result_o[47]_9 [0]),
        .I2(\sgf_result_o[47]_8 [1]),
        .I3(\sgf_result_o[47]_9 [1]),
        .I4(\sgf_result_o[47]_9 [2]),
        .I5(\sgf_result_o[47]_8 [2]),
        .O(\sgf_result_o[47]_2 ));
  LUT6 #(
    .INIT(64'hD400FD40FD40D400)) 
    sgf_result_o0__1_carry_i_12__8
       (.I0(\sgf_result_o[15]_3 ),
        .I1(\sgf_result_o[15]_4 ),
        .I2(\sgf_result_o[47]_8 [3]),
        .I3(\sgf_result_o[47]_10 ),
        .I4(\sgf_result_o[47]_9 [0]),
        .I5(\sgf_result_o[47]_8 [0]),
        .O(sgf_result_o0__1_carry_i_12__8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    sgf_result_o0__1_carry_i_13__7
       (.I0(\sgf_result_o[47]_4 [0]),
        .I1(\sgf_result_o[47]_3 [0]),
        .I2(\sgf_result_o[15] ),
        .I3(\sgf_result_o[47]_3 [3]),
        .I4(CO),
        .O(sgf_result_o0__1_carry_i_13__7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h66696999)) 
    sgf_result_o0__1_carry_i_14__0
       (.I0(CO),
        .I1(\sgf_result_o[47]_3 [3]),
        .I2(\sgf_result_o[47]_4 [2]),
        .I3(sgf_result_o0__1_carry_i_23__0_n_0),
        .I4(\sgf_result_o[47]_3 [2]),
        .O(\sgf_result_o[15]_0 ));
  LUT6 #(
    .INIT(64'hA5959555A9A5A595)) 
    sgf_result_o0__1_carry_i_15__4
       (.I0(\sgf_result_o[47]_2 ),
        .I1(\sgf_result_o[47]_11 ),
        .I2(\sgf_result_o[47]_10 ),
        .I3(\sgf_result_o[47]_8 [3]),
        .I4(\sgf_result_o[15]_4 ),
        .I5(\sgf_result_o[15]_3 ),
        .O(sgf_result_o0__1_carry_i_15__4_n_0));
  LUT6 #(
    .INIT(64'hFFEBAAAAFFFFFFEB)) 
    sgf_result_o0__1_carry_i_16__1
       (.I0(\sgf_result_o[47]_6 ),
        .I1(\sgf_result_o[47]_3 [0]),
        .I2(\sgf_result_o[47]_4 [0]),
        .I3(\sgf_result_o[15]_0 ),
        .I4(\sgf_result_o[47]_5 ),
        .I5(sgf_result_o0__1_carry_i_25__0_n_0),
        .O(sgf_result_o0__1_carry_i_16__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h96)) 
    sgf_result_o0__1_carry_i_17__3
       (.I0(\sgf_result_o[47]_9 [0]),
        .I1(\sgf_result_o[47]_8 [0]),
        .I2(\sgf_result_o[15]_2 ),
        .O(sgf_result_o0__1_carry_i_17__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h66696999)) 
    sgf_result_o0__1_carry_i_18__4
       (.I0(\sgf_result_o[15]_4 ),
        .I1(\sgf_result_o[47]_8 [3]),
        .I2(\sgf_result_o[47]_9 [2]),
        .I3(sgf_result_o0__1_carry_i_26__0_n_0),
        .I4(\sgf_result_o[47]_8 [2]),
        .O(\sgf_result_o[15]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    sgf_result_o0__1_carry_i_19__4
       (.I0(\sgf_result_o[47]_4 [0]),
        .I1(\sgf_result_o[47]_3 [0]),
        .I2(\sgf_result_o[47]_4 [1]),
        .I3(\sgf_result_o[47]_3 [1]),
        .O(\sgf_result_o[47]_5 ));
  LUT6 #(
    .INIT(64'hE11111E1E1EE11E1)) 
    sgf_result_o0__1_carry_i_1__12
       (.I0(sgf_result_o0__1_carry_i_8__7_n_0),
        .I1(sgf_result_o0__1_carry_i_9__2_n_0),
        .I2(sgf_result_o0__1_carry_i_10__5_n_0),
        .I3(\sgf_result_o[47]_2 ),
        .I4(sgf_result_o0__1_carry_i_12__8_n_0),
        .I5(sgf_result_o0__1_carry_i_13__7_n_0),
        .O(sgf_result_o0__1_carry_i_1__12_n_0));
  LUT6 #(
    .INIT(64'h00151555557F7FFF)) 
    sgf_result_o0__1_carry_i_20__3
       (.I0(\sgf_result_o[47]_3 [2]),
        .I1(\sgf_result_o[47]_3 [0]),
        .I2(\sgf_result_o[47]_4 [0]),
        .I3(\sgf_result_o[47]_3 [1]),
        .I4(\sgf_result_o[47]_4 [1]),
        .I5(\sgf_result_o[47]_4 [2]),
        .O(\sgf_result_o[15] ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    sgf_result_o0__1_carry_i_21__3
       (.I0(\sgf_result_o[47]_9 [0]),
        .I1(\sgf_result_o[47]_8 [0]),
        .I2(\sgf_result_o[47]_9 [1]),
        .I3(\sgf_result_o[47]_8 [1]),
        .O(\sgf_result_o[47]_10 ));
  LUT6 #(
    .INIT(64'h00151555557F7FFF)) 
    sgf_result_o0__1_carry_i_22__0
       (.I0(\sgf_result_o[47]_8 [2]),
        .I1(\sgf_result_o[47]_8 [0]),
        .I2(\sgf_result_o[47]_9 [0]),
        .I3(\sgf_result_o[47]_8 [1]),
        .I4(\sgf_result_o[47]_9 [1]),
        .I5(\sgf_result_o[47]_9 [2]),
        .O(\sgf_result_o[15]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    sgf_result_o0__1_carry_i_23__0
       (.I0(\sgf_result_o[47]_4 [1]),
        .I1(\sgf_result_o[47]_3 [1]),
        .I2(\sgf_result_o[47]_4 [0]),
        .I3(\sgf_result_o[47]_3 [0]),
        .O(sgf_result_o0__1_carry_i_23__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o0__1_carry_i_24__0
       (.I0(\sgf_result_o[47]_8 [0]),
        .I1(\sgf_result_o[47]_9 [0]),
        .O(\sgf_result_o[47]_11 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    sgf_result_o0__1_carry_i_25__0
       (.I0(\sgf_result_o[47]_3 [3]),
        .I1(CO),
        .I2(\sgf_result_o[47]_3 [2]),
        .I3(sgf_result_o0__1_carry_i_23__0_n_0),
        .I4(\sgf_result_o[47]_4 [2]),
        .O(sgf_result_o0__1_carry_i_25__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    sgf_result_o0__1_carry_i_26__0
       (.I0(\sgf_result_o[47]_9 [1]),
        .I1(\sgf_result_o[47]_8 [1]),
        .I2(\sgf_result_o[47]_9 [0]),
        .I3(\sgf_result_o[47]_8 [0]),
        .O(sgf_result_o0__1_carry_i_26__0_n_0));
  LUT6 #(
    .INIT(64'h2DD2D22D22222222)) 
    sgf_result_o0__1_carry_i_2__12
       (.I0(sgf_result_o0__1_carry_i_10__5_n_0),
        .I1(sgf_result_o0__1_carry_i_9__2_n_0),
        .I2(\sgf_result_o[47]_4 [0]),
        .I3(\sgf_result_o[47]_3 [0]),
        .I4(\sgf_result_o[15]_0 ),
        .I5(sgf_result_o0__1_carry_i_15__4_n_0),
        .O(sgf_result_o0__1_carry_i_2__12_n_0));
  LUT4 #(
    .INIT(16'h1441)) 
    sgf_result_o0__1_carry_i_3__12
       (.I0(sgf_result_o0__1_carry_i_9__2_n_0),
        .I1(\sgf_result_o[15]_0 ),
        .I2(\sgf_result_o[47]_3 [0]),
        .I3(\sgf_result_o[47]_4 [0]),
        .O(sgf_result_o0__1_carry_i_3__12_n_0));
  LUT6 #(
    .INIT(64'h78F078F078F00F0F)) 
    sgf_result_o0__1_carry_i_4__12
       (.I0(sgf_result_o0__1_carry_i_10__5_n_0),
        .I1(sgf_result_o0__1_carry_i_15__4_n_0),
        .I2(sgf_result_o0__1_carry_i_1__12_n_0),
        .I3(sgf_result_o0__1_carry_i_3__12_n_0),
        .I4(sgf_result_o0__1_carry_i_16__1_n_0),
        .I5(sgf_result_o0__1_carry_i_17__3_n_0),
        .O(sgf_result_o0__1_carry_i_4__12_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    sgf_result_o0__1_carry_i_5__12
       (.I0(sgf_result_o0__1_carry_i_2__12_n_0),
        .I1(sgf_result_o0__1_carry_i_17__3_n_0),
        .I2(sgf_result_o0__1_carry_i_8__7_n_0),
        .O(sgf_result_o0__1_carry_i_5__12_n_0));
  LUT3 #(
    .INIT(8'hB4)) 
    sgf_result_o0__1_carry_i_6__9
       (.I0(sgf_result_o0__1_carry_i_17__3_n_0),
        .I1(sgf_result_o0__1_carry_i_10__5_n_0),
        .I2(sgf_result_o0__1_carry_i_3__12_n_0),
        .O(sgf_result_o0__1_carry_i_6__9_n_0));
  LUT6 #(
    .INIT(64'h0069690069000069)) 
    sgf_result_o0__1_carry_i_7__12
       (.I0(\sgf_result_o[15]_0 ),
        .I1(\sgf_result_o[47]_3 [0]),
        .I2(\sgf_result_o[47]_4 [0]),
        .I3(\sgf_result_o[15]_2 ),
        .I4(\sgf_result_o[47]_8 [0]),
        .I5(\sgf_result_o[47]_9 [0]),
        .O(sgf_result_o0__1_carry_i_7__12_n_0));
  CARRY4 sgf_result_o0__1_carry_i_8__11
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_i_8__11_n_0,sgf_result_o0__1_carry_i_8__11_n_1,sgf_result_o0__1_carry_i_8__11_n_2,sgf_result_o0__1_carry_i_8__11_n_3}),
        .CYINIT(1'b0),
        .DI(\Data_B_i[12] ),
        .O(\sgf_result_o[47]_8 ),
        .S(\Data_B_i[16] ));
  CARRY4 sgf_result_o0__1_carry_i_8__12
       (.CI(sgf_result_o0__1_carry_i_8__11_n_0),
        .CO({\sgf_result_o[15]_4 ,NLW_sgf_result_o0__1_carry_i_8__12_CO_UNCONNECTED[2],sgf_result_o0__1_carry_i_8__12_n_2,sgf_result_o0__1_carry_i_8__12_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\Data_B_i[12]_0 [1:0]}),
        .O({NLW_sgf_result_o0__1_carry_i_8__12_O_UNCONNECTED[3],\sgf_result_o[47]_9 }),
        .S({1'b1,\Data_B_i[12]_0 [2],\Data_B_i[20]_5 }));
  LUT6 #(
    .INIT(64'hA5A6A6AA65A5A5A6)) 
    sgf_result_o0__1_carry_i_8__7
       (.I0(\sgf_result_o[47]_6 ),
        .I1(\sgf_result_o[47]_7 ),
        .I2(\sgf_result_o[47]_5 ),
        .I3(\sgf_result_o[47]_3 [3]),
        .I4(CO),
        .I5(\sgf_result_o[15] ),
        .O(sgf_result_o0__1_carry_i_8__7_n_0));
  LUT6 #(
    .INIT(64'hF069690F96F0F069)) 
    sgf_result_o0__1_carry_i_9__2
       (.I0(\sgf_result_o[47]_8 [0]),
        .I1(\sgf_result_o[47]_9 [0]),
        .I2(\sgf_result_o[47]_10 ),
        .I3(\sgf_result_o[47]_8 [3]),
        .I4(\sgf_result_o[15]_4 ),
        .I5(\sgf_result_o[15]_3 ),
        .O(sgf_result_o0__1_carry_i_9__2_n_0));
  CARRY4 sgf_result_o0__1_carry_i_9__6
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_i_9__6_n_0,sgf_result_o0__1_carry_i_9__6_n_1,sgf_result_o0__1_carry_i_9__6_n_2,sgf_result_o0__1_carry_i_9__6_n_3}),
        .CYINIT(1'b0),
        .DI(\Data_A_i[12] ),
        .O(\sgf_result_o[47]_3 ),
        .S(\Data_A_i[16] ));
  CARRY4 sgf_result_o0__1_carry_i_9__7
       (.CI(sgf_result_o0__1_carry_i_9__6_n_0),
        .CO({CO,NLW_sgf_result_o0__1_carry_i_9__7_CO_UNCONNECTED[2],sgf_result_o0__1_carry_i_9__7_n_2,sgf_result_o0__1_carry_i_9__7_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\Data_A_i[12]_0 [1:0]}),
        .O({NLW_sgf_result_o0__1_carry_i_9__7_O_UNCONNECTED[3],\sgf_result_o[47]_4 }),
        .S({1'b1,\Data_A_i[12]_0 [2],\Data_A_i[20]_7 }));
  LUT2 #(
    .INIT(4'hB)) 
    sgf_result_o1__0_carry__0_i_1__2
       (.I0(sgf_result_o0__1_carry__0_n_7),
        .I1(\Data_B_i[20]_1 ),
        .O(\sgf_result_o[19] [1]));
  LUT3 #(
    .INIT(8'hB2)) 
    sgf_result_o1__0_carry__0_i_2__2
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_A_i[20]_6 ),
        .I2(\Data_B_i[20]_4 ),
        .O(\sgf_result_o[19] [0]));
  LUT3 #(
    .INIT(8'h59)) 
    sgf_result_o1__0_carry__0_i_3__2
       (.I0(sgf_result_o0__1_carry__0_n_5),
        .I1(\Data_A_i[20]_3 ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .O(\sgf_result_o[19]_0 [2]));
  LUT4 #(
    .INIT(16'hD22D)) 
    sgf_result_o1__0_carry__0_i_4__2
       (.I0(\Data_B_i[20]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[20]_3 ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(\sgf_result_o[19]_0 [1]));
  LUT3 #(
    .INIT(8'h96)) 
    sgf_result_o1__0_carry__0_i_5__2
       (.I0(\sgf_result_o[19] [0]),
        .I1(\Data_B_i[20]_1 ),
        .I2(sgf_result_o0__1_carry__0_n_7),
        .O(\sgf_result_o[19]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    sgf_result_o1__0_carry_i_12__2
       (.I0(\sgf_result_o[47]_3 [0]),
        .I1(\sgf_result_o[47]_4 [0]),
        .O(\sgf_result_o[47]_7 ));
  LUT3 #(
    .INIT(8'hB2)) 
    sgf_result_o1__0_carry_i_1__2
       (.I0(sgf_result_o0__1_carry_n_5),
        .I1(\Data_A_i[20]_5 ),
        .I2(\Data_B_i[20]_3 ),
        .O(\sgf_result_o[15]_1 [2]));
  LUT3 #(
    .INIT(8'h4D)) 
    sgf_result_o1__0_carry_i_2__2
       (.I0(\Data_A_i[20]_4 ),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_B_i[20]_2 ),
        .O(\sgf_result_o[15]_1 [1]));
  LUT6 #(
    .INIT(64'hFBBFFBBFFBBFA22A)) 
    sgf_result_o1__0_carry_i_3__2
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\sgf_result_o[47]_7 ),
        .I2(\sgf_result_o[47]_8 [0]),
        .I3(\sgf_result_o[47]_9 [0]),
        .I4(\sgf_result_o[15]_0 ),
        .I5(\sgf_result_o[15]_2 ),
        .O(\sgf_result_o[15]_1 [0]));
  LUT4 #(
    .INIT(16'h9669)) 
    sgf_result_o1__0_carry_i_4__2
       (.I0(sgf_result_o0__1_carry_n_4),
        .I1(\Data_A_i[20]_6 ),
        .I2(\Data_B_i[20]_4 ),
        .I3(\sgf_result_o[15]_1 [2]),
        .O(\sgf_result_o[15]_5 [3]));
  LUT4 #(
    .INIT(16'h9669)) 
    sgf_result_o1__0_carry_i_5__2
       (.I0(sgf_result_o0__1_carry_n_5),
        .I1(\Data_A_i[20]_5 ),
        .I2(\Data_B_i[20]_3 ),
        .I3(\sgf_result_o[15]_1 [1]),
        .O(\sgf_result_o[15]_5 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    sgf_result_o1__0_carry_i_6__2
       (.I0(\Data_A_i[20]_4 ),
        .I1(sgf_result_o0__1_carry_n_6),
        .I2(\Data_B_i[20]_2 ),
        .I3(\sgf_result_o[15]_1 [0]),
        .O(\sgf_result_o[15]_5 [1]));
  LUT6 #(
    .INIT(64'h9999966996699999)) 
    sgf_result_o1__0_carry_i_7__2
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(\Data_A_i[20]_8 ),
        .I2(\sgf_result_o[47]_9 [0]),
        .I3(\sgf_result_o[47]_8 [0]),
        .I4(\sgf_result_o[47]_4 [0]),
        .I5(\sgf_result_o[47]_3 [0]),
        .O(\sgf_result_o[15]_5 [0]));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized8
   (\sgf_result_o[47] ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[47]_5 ,
    DI,
    S,
    \Data_A_i[17] ,
    \Data_A_i[13] ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[12] ,
    \Data_B_i[15] ,
    \Data_B_i[13] ,
    \Data_B_i[16] ,
    \Data_A_i[14] ,
    \Data_A_i[17]_0 ,
    \Data_A_i[17]_1 ,
    \Data_A_i[14]_0 ,
    \Data_A_i[14]_1 ,
    \Data_A_i[17]_2 ,
    O,
    \Data_A_i[17]_3 ,
    \Data_A_i[17]_4 ,
    \Data_A_i[14]_2 ,
    \Data_B_i[16]_0 );
  output [2:0]\sgf_result_o[47] ;
  output [2:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [3:0]\sgf_result_o[47]_4 ;
  output [1:0]\sgf_result_o[47]_5 ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_A_i[17] ;
  input [2:0]\Data_A_i[13] ;
  input [2:0]Data_B_i_IBUF;
  input [2:0]Data_A_i_IBUF;
  input \Data_B_i[12] ;
  input \Data_B_i[15] ;
  input \Data_B_i[13] ;
  input \Data_B_i[16] ;
  input \Data_A_i[14] ;
  input \Data_A_i[17]_0 ;
  input \Data_A_i[17]_1 ;
  input \Data_A_i[14]_0 ;
  input \Data_A_i[14]_1 ;
  input \Data_A_i[17]_2 ;
  input [3:0]O;
  input [3:0]\Data_A_i[17]_3 ;
  input [3:0]\Data_A_i[17]_4 ;
  input [3:0]\Data_A_i[14]_2 ;
  input [1:0]\Data_B_i[16]_0 ;

  wire [2:0]DI;
  wire [2:0]\Data_A_i[13] ;
  wire \Data_A_i[14] ;
  wire \Data_A_i[14]_0 ;
  wire \Data_A_i[14]_1 ;
  wire [3:0]\Data_A_i[14]_2 ;
  wire [2:0]\Data_A_i[17] ;
  wire \Data_A_i[17]_0 ;
  wire \Data_A_i[17]_1 ;
  wire \Data_A_i[17]_2 ;
  wire [3:0]\Data_A_i[17]_3 ;
  wire [3:0]\Data_A_i[17]_4 ;
  wire [2:0]Data_A_i_IBUF;
  wire \Data_B_i[12] ;
  wire \Data_B_i[13] ;
  wire \Data_B_i[15] ;
  wire \Data_B_i[16] ;
  wire [1:0]\Data_B_i[16]_0 ;
  wire [2:0]Data_B_i_IBUF;
  wire [3:0]O;
  wire [3:0]S;
  wire S_B0__30_carry__0_i_10__0_n_0;
  wire S_B0__30_carry__0_i_10__0_n_1;
  wire S_B0__30_carry__0_i_10__0_n_2;
  wire S_B0__30_carry__0_i_10__0_n_3;
  wire S_B0__30_carry__1_i_10__0_n_3;
  wire S_B0__30_carry_i_9_n_0;
  wire S_B0__30_carry_i_9_n_1;
  wire S_B0__30_carry_i_9_n_2;
  wire S_B0__30_carry_i_9_n_3;
  wire sgf_result_o0__1_carry__0_n_1;
  wire sgf_result_o0__1_carry__0_n_2;
  wire sgf_result_o0__1_carry__0_n_3;
  wire sgf_result_o0__1_carry__0_n_4;
  wire sgf_result_o0__1_carry__0_n_6;
  wire sgf_result_o0__1_carry__0_n_7;
  wire sgf_result_o0__1_carry_n_0;
  wire sgf_result_o0__1_carry_n_1;
  wire sgf_result_o0__1_carry_n_2;
  wire sgf_result_o0__1_carry_n_3;
  wire sgf_result_o0__1_carry_n_4;
  wire sgf_result_o0__1_carry_n_5;
  wire sgf_result_o0__1_carry_n_6;
  wire sgf_result_o0__1_carry_n_7;
  wire [2:0]\sgf_result_o[47] ;
  wire [2:0]\sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [3:0]\^sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:0]\sgf_result_o[47]_4 ;
  wire [1:0]\sgf_result_o[47]_5 ;
  wire [3:1]NLW_S_B0__30_carry__1_i_10__0_CO_UNCONNECTED;
  wire [3:2]NLW_S_B0__30_carry__1_i_10__0_O_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED;

  assign \sgf_result_o[47]_2 [3] = sgf_result_o0__1_carry__0_n_4;
  assign \sgf_result_o[47]_2 [2:0] = \^sgf_result_o[47]_2 [2:0];
  (* HLUTNM = "lutpair22" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    S_B0__0_carry__0_i_1__1
       (.I0(\Data_A_i[14]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[17]_2 ),
        .O(\sgf_result_o[47] [1]));
  (* HLUTNM = "lutpair21" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    S_B0__0_carry__0_i_2__1
       (.I0(\Data_A_i[17]_1 ),
        .I1(sgf_result_o0__1_carry_n_4),
        .I2(\Data_A_i[14]_0 ),
        .O(\sgf_result_o[47] [0]));
  LUT4 #(
    .INIT(16'h4DB2)) 
    S_B0__0_carry__0_i_4__1
       (.I0(\Data_B_i[13] ),
        .I1(\Data_B_i[16] ),
        .I2(sgf_result_o0__1_carry__0_n_6),
        .I3(\sgf_result_o[47] [2]),
        .O(\^sgf_result_o[47]_2 [2]));
  LUT4 #(
    .INIT(16'h9669)) 
    S_B0__0_carry__0_i_5__1
       (.I0(\sgf_result_o[47] [1]),
        .I1(\Data_B_i[13] ),
        .I2(\Data_B_i[16] ),
        .I3(sgf_result_o0__1_carry__0_n_6),
        .O(\^sgf_result_o[47]_2 [1]));
  (* HLUTNM = "lutpair22" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry__0_i_6__1
       (.I0(\Data_A_i[14]_1 ),
        .I1(sgf_result_o0__1_carry__0_n_7),
        .I2(\Data_A_i[17]_2 ),
        .I3(\sgf_result_o[47] [0]),
        .O(\^sgf_result_o[47]_2 [0]));
  (* HLUTNM = "lutpair20" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    S_B0__0_carry_i_1__1
       (.I0(\Data_A_i[14] ),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[17]_0 ),
        .O(\sgf_result_o[47]_0 [2]));
  LUT6 #(
    .INIT(64'h87770000FFFF8777)) 
    S_B0__0_carry_i_2__1
       (.I0(Data_B_i_IBUF[2]),
        .I1(Data_A_i_IBUF[1]),
        .I2(Data_A_i_IBUF[2]),
        .I3(Data_B_i_IBUF[1]),
        .I4(sgf_result_o0__1_carry_n_6),
        .I5(\Data_B_i[12] ),
        .O(\sgf_result_o[47]_0 [1]));
  (* HLUTNM = "lutpair82" *) 
  LUT5 #(
    .INIT(32'h2ABFBFBF)) 
    S_B0__0_carry_i_3__1
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_A_i_IBUF[1]),
        .I4(Data_B_i_IBUF[1]),
        .O(\sgf_result_o[47]_0 [0]));
  (* HLUTNM = "lutpair21" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    S_B0__0_carry_i_4__1
       (.I0(\Data_A_i[17]_1 ),
        .I1(sgf_result_o0__1_carry_n_4),
        .I2(\Data_A_i[14]_0 ),
        .I3(\sgf_result_o[47]_0 [2]),
        .O(\sgf_result_o[47]_1 [3]));
  (* HLUTNM = "lutpair20" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_5__1
       (.I0(\Data_A_i[14] ),
        .I1(sgf_result_o0__1_carry_n_5),
        .I2(\Data_A_i[17]_0 ),
        .I3(\sgf_result_o[47]_0 [1]),
        .O(\sgf_result_o[47]_1 [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    S_B0__0_carry_i_6__1
       (.I0(\sgf_result_o[47]_0 [0]),
        .I1(\Data_B_i[15] ),
        .I2(\Data_B_i[12] ),
        .I3(sgf_result_o0__1_carry_n_6),
        .O(\sgf_result_o[47]_1 [1]));
  (* HLUTNM = "lutpair82" *) 
  LUT5 #(
    .INIT(32'h6A959595)) 
    S_B0__0_carry_i_7__1
       (.I0(sgf_result_o0__1_carry_n_7),
        .I1(Data_A_i_IBUF[0]),
        .I2(Data_B_i_IBUF[0]),
        .I3(Data_A_i_IBUF[1]),
        .I4(Data_B_i_IBUF[1]),
        .O(\sgf_result_o[47]_1 [0]));
  CARRY4 S_B0__30_carry__0_i_10__0
       (.CI(S_B0__30_carry_i_9_n_0),
        .CO({S_B0__30_carry__0_i_10__0_n_0,S_B0__30_carry__0_i_10__0_n_1,S_B0__30_carry__0_i_10__0_n_2,S_B0__30_carry__0_i_10__0_n_3}),
        .CYINIT(1'b0),
        .DI({\Data_A_i[17]_4 [2:0],O[3]}),
        .O(\sgf_result_o[47]_4 ),
        .S(\Data_A_i[14]_2 ));
  CARRY4 S_B0__30_carry__1_i_10__0
       (.CI(S_B0__30_carry__0_i_10__0_n_0),
        .CO({NLW_S_B0__30_carry__1_i_10__0_CO_UNCONNECTED[3:1],S_B0__30_carry__1_i_10__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\Data_A_i[17]_4 [3]}),
        .O({NLW_S_B0__30_carry__1_i_10__0_O_UNCONNECTED[3:2],\sgf_result_o[47]_5 }),
        .S({1'b0,1'b0,\Data_B_i[16]_0 }));
  CARRY4 S_B0__30_carry_i_9
       (.CI(1'b0),
        .CO({S_B0__30_carry_i_9_n_0,S_B0__30_carry_i_9_n_1,S_B0__30_carry_i_9_n_2,S_B0__30_carry_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({O[2:0],1'b0}),
        .O(\sgf_result_o[47]_3 ),
        .S(\Data_A_i[17]_3 ));
  CARRY4 sgf_result_o0__1_carry
       (.CI(1'b0),
        .CO({sgf_result_o0__1_carry_n_0,sgf_result_o0__1_carry_n_1,sgf_result_o0__1_carry_n_2,sgf_result_o0__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({sgf_result_o0__1_carry_n_4,sgf_result_o0__1_carry_n_5,sgf_result_o0__1_carry_n_6,sgf_result_o0__1_carry_n_7}),
        .S(S));
  CARRY4 sgf_result_o0__1_carry__0
       (.CI(sgf_result_o0__1_carry_n_0),
        .CO({NLW_sgf_result_o0__1_carry__0_CO_UNCONNECTED[3],sgf_result_o0__1_carry__0_n_1,sgf_result_o0__1_carry__0_n_2,sgf_result_o0__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\Data_A_i[17] }),
        .O({sgf_result_o0__1_carry__0_n_4,\sgf_result_o[47] [2],sgf_result_o0__1_carry__0_n_6,sgf_result_o0__1_carry__0_n_7}),
        .S({1'b1,\Data_A_i[13] }));
endmodule

(* ORIG_REF_NAME = "Recursive_KOA" *) 
module Recursive_KOA__parameterized9
   (O,
    \sgf_result_o[23] ,
    \sgf_result_o[23]_0 ,
    \sgf_result_o[47] ,
    \sgf_result_o[15] ,
    \sgf_result_o[15]_0 ,
    \sgf_result_o[15]_1 ,
    \sgf_result_o[15]_2 ,
    \sgf_result_o[23]_1 ,
    \sgf_result_o[47]_0 ,
    \sgf_result_o[19] ,
    \sgf_result_o[47]_1 ,
    \sgf_result_o[47]_2 ,
    \sgf_result_o[47]_3 ,
    \sgf_result_o[47]_4 ,
    \sgf_result_o[39] ,
    \sgf_result_o[43] ,
    DI,
    S,
    \Data_B_i[18] ,
    \Data_A_i[18] ,
    \Data_A_i[22] ,
    Data_B_i_IBUF,
    Data_A_i_IBUF,
    \Data_B_i[12] ,
    \Data_A_i[18]_0 ,
    p_0_in,
    \Data_B_i[18]_0 ,
    \Data_B_i[18]_1 ,
    CO,
    \Data_B_i[18]_2 ,
    \Data_A_i[18]_1 ,
    \Data_B_i[18]_3 ,
    \Data_A_i[18]_2 ,
    \Data_B_i[18]_4 ,
    \Data_A_i[18]_3 ,
    \Data_A_i[18]_4 ,
    \Data_A_i[23] ,
    \Data_A_i[17] ,
    Q_middle_temp__2,
    \Data_A_i[17]_0 ,
    \Data_A_i[23]_0 ,
    \Data_A_i[17]_1 ,
    \Data_A_i[17]_2 ,
    \Data_A_i[14] ,
    \Data_A_i[14]_0 ,
    \Data_A_i[14]_1 ,
    \Data_A_i[23]_1 ,
    \Data_A_i[20] );
  output [3:0]O;
  output [3:0]\sgf_result_o[23] ;
  output [0:0]\sgf_result_o[23]_0 ;
  output [2:0]\sgf_result_o[47] ;
  output \sgf_result_o[15] ;
  output \sgf_result_o[15]_0 ;
  output \sgf_result_o[15]_1 ;
  output \sgf_result_o[15]_2 ;
  output [2:0]\sgf_result_o[23]_1 ;
  output [3:0]\sgf_result_o[47]_0 ;
  output [3:0]\sgf_result_o[19] ;
  output [3:0]\sgf_result_o[47]_1 ;
  output [3:0]\sgf_result_o[47]_2 ;
  output [3:0]\sgf_result_o[47]_3 ;
  output [3:0]\sgf_result_o[47]_4 ;
  output [3:0]\sgf_result_o[39] ;
  output [2:0]\sgf_result_o[43] ;
  input [2:0]DI;
  input [3:0]S;
  input [2:0]\Data_B_i[18] ;
  input [2:0]\Data_A_i[18] ;
  input [0:0]\Data_A_i[22] ;
  input [2:0]Data_B_i_IBUF;
  input [2:0]Data_A_i_IBUF;
  input \Data_B_i[12] ;
  input [3:0]\Data_A_i[18]_0 ;
  input [2:0]p_0_in;
  input [3:0]\Data_B_i[18]_0 ;
  input [1:0]\Data_B_i[18]_1 ;
  input [0:0]CO;
  input \Data_B_i[18]_2 ;
  input \Data_A_i[18]_1 ;
  input \Data_B_i[18]_3 ;
  input \Data_A_i[18]_2 ;
  input \Data_B_i[18]_4 ;
  input \Data_A_i[18]_3 ;
  input \Data_A_i[18]_4 ;
  input [1:0]\Data_A_i[23] ;
  input [1:0]\Data_A_i[17] ;
  input [0:0]Q_middle_temp__2;
  input [3:0]\Data_A_i[17]_0 ;
  input [3:0]\Data_A_i[23]_0 ;
  input [3:0]\Data_A_i[17]_1 ;
  input [3:0]\Data_A_i[17]_2 ;
  input [3:0]\Data_A_i[14] ;
  input [3:0]\Data_A_i[14]_0 ;
  input [1:0]\Data_A_i[14]_1 ;
  input [3:0]\Data_A_i[23]_1 ;
  input [2:0]\Data_A_i[20] ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [3:0]\Data_A_i[14] ;
  wire [3:0]\Data_A_i[14]_0 ;
  wire [1:0]\Data_A_i[14]_1 ;
  wire [1:0]\Data_A_i[17] ;
  wire [3:0]\Data_A_i[17]_0 ;
  wire [3:0]\Data_A_i[17]_1 ;
  wire [3:0]\Data_A_i[17]_2 ;
  wire [2:0]\Data_A_i[18] ;
  wire [3:0]\Data_A_i[18]_0 ;
  wire \Data_A_i[18]_1 ;
  wire \Data_A_i[18]_2 ;
  wire \Data_A_i[18]_3 ;
  wire \Data_A_i[18]_4 ;
  wire [2:0]\Data_A_i[20] ;
  wire [0:0]\Data_A_i[22] ;
  wire [1:0]\Data_A_i[23] ;
  wire [3:0]\Data_A_i[23]_0 ;
  wire [3:0]\Data_A_i[23]_1 ;
  wire [2:0]Data_A_i_IBUF;
  wire \Data_B_i[12] ;
  wire [2:0]\Data_B_i[18] ;
  wire [3:0]\Data_B_i[18]_0 ;
  wire [1:0]\Data_B_i[18]_1 ;
  wire \Data_B_i[18]_2 ;
  wire \Data_B_i[18]_3 ;
  wire \Data_B_i[18]_4 ;
  wire [2:0]Data_B_i_IBUF;
  wire [3:0]O;
  wire \ODD1.middle_n_0 ;
  wire \ODD1.middle_n_1 ;
  wire \ODD1.middle_n_10 ;
  wire \ODD1.middle_n_12 ;
  wire \ODD1.middle_n_13 ;
  wire \ODD1.middle_n_14 ;
  wire \ODD1.middle_n_15 ;
  wire \ODD1.middle_n_16 ;
  wire \ODD1.middle_n_17 ;
  wire \ODD1.middle_n_18 ;
  wire \ODD1.middle_n_19 ;
  wire \ODD1.middle_n_2 ;
  wire \ODD1.middle_n_20 ;
  wire \ODD1.middle_n_21 ;
  wire \ODD1.middle_n_22 ;
  wire \ODD1.middle_n_3 ;
  wire \ODD1.middle_n_4 ;
  wire \ODD1.middle_n_5 ;
  wire \ODD1.middle_n_7 ;
  wire \ODD1.middle_n_9 ;
  wire \ODD1.right_lower_n_0 ;
  wire \ODD1.right_lower_n_10 ;
  wire \ODD1.right_lower_n_11 ;
  wire \ODD1.right_lower_n_12 ;
  wire \ODD1.right_lower_n_13 ;
  wire \ODD1.right_lower_n_14 ;
  wire \ODD1.right_lower_n_15 ;
  wire \ODD1.right_lower_n_16 ;
  wire \ODD1.right_lower_n_17 ;
  wire \ODD1.right_lower_n_18 ;
  wire \ODD1.right_lower_n_4 ;
  wire \ODD1.right_lower_n_5 ;
  wire \ODD1.right_lower_n_6 ;
  wire \ODD1.right_lower_n_7 ;
  wire \ODD1.right_lower_n_8 ;
  wire \ODD1.right_lower_n_9 ;
  wire [9:2]Q_middle_temp__1;
  wire [0:0]Q_middle_temp__2;
  wire [3:0]S;
  wire [2:0]p_0_in;
  wire sgf_result_o1__0_carry__0_i_6__0_n_0;
  wire sgf_result_o1__0_carry__0_i_7__0_n_0;
  wire sgf_result_o1__0_carry_i_10__0_n_0;
  wire sgf_result_o1__0_carry_i_11__0_n_0;
  wire sgf_result_o1__0_carry_i_14__0_n_0;
  wire sgf_result_o1__0_carry_i_15__0_n_0;
  wire sgf_result_o1__0_carry_i_16__0_n_0;
  wire sgf_result_o1__0_carry_i_17__0_n_0;
  wire sgf_result_o1__0_carry_i_19__0_n_0;
  wire sgf_result_o1__0_carry_i_8__0_n_0;
  wire sgf_result_o1__0_carry_i_9__0_n_0;
  wire sgf_result_o1__21_carry__0_n_0;
  wire sgf_result_o1__21_carry__0_n_1;
  wire sgf_result_o1__21_carry__0_n_2;
  wire sgf_result_o1__21_carry__0_n_3;
  wire sgf_result_o1__21_carry__1_i_1__0_n_0;
  wire sgf_result_o1__21_carry__1_n_3;
  wire sgf_result_o1__21_carry__1_n_6;
  wire sgf_result_o1__21_carry_n_0;
  wire sgf_result_o1__21_carry_n_1;
  wire sgf_result_o1__21_carry_n_2;
  wire sgf_result_o1__21_carry_n_3;
  wire sgf_result_o1_carry__0_n_1;
  wire sgf_result_o1_carry__0_n_2;
  wire sgf_result_o1_carry__0_n_3;
  wire sgf_result_o1_carry_n_0;
  wire sgf_result_o1_carry_n_1;
  wire sgf_result_o1_carry_n_2;
  wire sgf_result_o1_carry_n_3;
  wire \sgf_result_o[15] ;
  wire \sgf_result_o[15]_0 ;
  wire \sgf_result_o[15]_1 ;
  wire \sgf_result_o[15]_2 ;
  wire [3:0]\sgf_result_o[19] ;
  wire [3:0]\sgf_result_o[23] ;
  wire [0:0]\sgf_result_o[23]_0 ;
  wire [2:0]\sgf_result_o[23]_1 ;
  wire [3:0]\sgf_result_o[39] ;
  wire [2:0]\sgf_result_o[43] ;
  wire [2:0]\sgf_result_o[47] ;
  wire [3:0]\sgf_result_o[47]_0 ;
  wire [3:0]\sgf_result_o[47]_1 ;
  wire [3:0]\sgf_result_o[47]_2 ;
  wire [3:0]\sgf_result_o[47]_3 ;
  wire [3:0]\sgf_result_o[47]_4 ;
  wire [3:1]NLW_sgf_result_o1__21_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_sgf_result_o1__21_carry__1_O_UNCONNECTED;
  wire [3:3]NLW_sgf_result_o1_carry__0_CO_UNCONNECTED;

  Recursive_KOA__parameterized12 \ODD1.middle 
       (.CO(CO),
        .\Data_A_i[18] (\Data_A_i[18]_0 ),
        .\Data_A_i[18]_0 (Q_middle_temp__1[8:7]),
        .\Data_A_i[22] (sgf_result_o1__0_carry_i_14__0_n_0),
        .\Data_A_i[22]_0 (sgf_result_o1__0_carry__0_i_7__0_n_0),
        .\Data_A_i[22]_1 (sgf_result_o1__0_carry_i_8__0_n_0),
        .\Data_A_i[22]_2 (sgf_result_o1__0_carry_i_9__0_n_0),
        .\Data_A_i[22]_3 (sgf_result_o1__0_carry_i_17__0_n_0),
        .\Data_A_i[22]_4 (sgf_result_o1__0_carry_i_11__0_n_0),
        .\Data_B_i[18] (\Data_B_i[18]_0 ),
        .\Data_B_i[18]_0 (\Data_B_i[18]_1 ),
        .\Data_B_i[18]_1 (sgf_result_o1__0_carry__0_i_6__0_n_0),
        .\Data_B_i[18]_2 (\ODD1.right_lower_n_0 ),
        .\Data_B_i[18]_3 (sgf_result_o1__0_carry_i_16__0_n_0),
        .\Data_B_i[22] (sgf_result_o1__0_carry_i_15__0_n_0),
        .\Data_B_i[22]_0 (sgf_result_o1__0_carry_i_10__0_n_0),
        .O({\ODD1.middle_n_0 ,\ODD1.middle_n_1 ,\ODD1.middle_n_2 ,\ODD1.middle_n_3 }),
        .S({\ODD1.middle_n_15 ,\ODD1.middle_n_16 ,\ODD1.middle_n_17 }),
        .p_0_in(p_0_in),
        .\sgf_result_o[15] (\sgf_result_o[15] ),
        .\sgf_result_o[15]_0 (\ODD1.middle_n_7 ),
        .\sgf_result_o[15]_1 (\sgf_result_o[15]_0 ),
        .\sgf_result_o[15]_2 (\ODD1.middle_n_9 ),
        .\sgf_result_o[15]_3 (\ODD1.middle_n_10 ),
        .\sgf_result_o[15]_4 (\sgf_result_o[15]_1 ),
        .\sgf_result_o[15]_5 (\ODD1.middle_n_12 ),
        .\sgf_result_o[15]_6 (\ODD1.middle_n_13 ),
        .\sgf_result_o[15]_7 (\ODD1.middle_n_14 ),
        .\sgf_result_o[19] ({\ODD1.middle_n_4 ,\ODD1.middle_n_5 }),
        .\sgf_result_o[19]_0 ({\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 ,\ODD1.middle_n_21 }),
        .\sgf_result_o[23] (\ODD1.middle_n_22 ));
  Recursive_KOA__parameterized11 \ODD1.right_lower 
       (.DI(DI),
        .\Data_A_i[14] (\Data_A_i[14] ),
        .\Data_A_i[14]_0 (\Data_A_i[14]_0 ),
        .\Data_A_i[14]_1 (\Data_A_i[14]_1 ),
        .\Data_A_i[17] (\Data_A_i[17] ),
        .\Data_A_i[17]_0 (\Data_A_i[17]_0 ),
        .\Data_A_i[17]_1 (\Data_A_i[17]_1 ),
        .\Data_A_i[17]_2 (\Data_A_i[17]_2 ),
        .\Data_A_i[18] (\Data_A_i[18] ),
        .\Data_A_i[18]_0 (\Data_A_i[18]_1 ),
        .\Data_A_i[18]_1 (\Data_A_i[18]_3 ),
        .\Data_A_i[18]_2 (\Data_A_i[18]_4 ),
        .\Data_A_i[18]_3 (\Data_A_i[18]_2 ),
        .\Data_A_i[18]_4 (\Data_A_i[18]_0 [0]),
        .\Data_A_i[20] (\Data_A_i[20] ),
        .\Data_A_i[23] (\Data_A_i[23] ),
        .\Data_A_i[23]_0 (\Data_A_i[23]_0 ),
        .\Data_A_i[23]_1 (\Data_A_i[23]_1 ),
        .Data_A_i_IBUF(Data_A_i_IBUF),
        .\Data_B_i[12] (\Data_B_i[12] ),
        .\Data_B_i[18] (\Data_B_i[18] ),
        .\Data_B_i[18]_0 (\Data_B_i[18]_1 ),
        .\Data_B_i[18]_1 (\Data_B_i[18]_2 ),
        .\Data_B_i[18]_2 (\Data_B_i[18]_4 ),
        .\Data_B_i[18]_3 (\Data_B_i[18]_0 [0]),
        .\Data_B_i[22] (sgf_result_o1__0_carry_i_10__0_n_0),
        .Data_B_i_IBUF(Data_B_i_IBUF),
        .O(O),
        .Q_middle_temp__1(Q_middle_temp__1[7:2]),
        .Q_middle_temp__2(Q_middle_temp__2),
        .S(S),
        .p_0_in(p_0_in[1:0]),
        .\sgf_result_o[15] ({\ODD1.right_lower_n_4 ,\ODD1.right_lower_n_5 ,\ODD1.right_lower_n_6 }),
        .\sgf_result_o[15]_0 ({\ODD1.right_lower_n_11 ,\ODD1.right_lower_n_12 ,\ODD1.right_lower_n_13 ,\ODD1.right_lower_n_14 }),
        .\sgf_result_o[19] (\ODD1.right_lower_n_0 ),
        .\sgf_result_o[19]_0 ({\ODD1.right_lower_n_7 ,\ODD1.right_lower_n_8 ,\ODD1.right_lower_n_9 ,\ODD1.right_lower_n_10 }),
        .\sgf_result_o[19]_1 ({\ODD1.right_lower_n_15 ,\ODD1.right_lower_n_16 ,\ODD1.right_lower_n_17 ,\ODD1.right_lower_n_18 }),
        .\sgf_result_o[19]_2 (\sgf_result_o[19] [0]),
        .\sgf_result_o[39] (\sgf_result_o[39] ),
        .\sgf_result_o[43] (\sgf_result_o[43] ),
        .\sgf_result_o[47] (\sgf_result_o[47] ),
        .\sgf_result_o[47]_0 (\sgf_result_o[47]_0 ),
        .\sgf_result_o[47]_1 (\sgf_result_o[47]_1 ),
        .\sgf_result_o[47]_2 (\sgf_result_o[47]_2 ),
        .\sgf_result_o[47]_3 (\sgf_result_o[47]_3 ),
        .\sgf_result_o[47]_4 (\sgf_result_o[47]_4 ));
  LUT6 #(
    .INIT(64'h9A956595956A6A6A)) 
    S_B0_carry__0_i_1__1
       (.I0(\sgf_result_o[23] [2]),
        .I1(p_0_in[2]),
        .I2(\Data_B_i[18]_1 [0]),
        .I3(p_0_in[0]),
        .I4(CO),
        .I5(\Data_B_i[18]_3 ),
        .O(\sgf_result_o[19] [3]));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    S_B0_carry__0_i_2__0
       (.I0(\sgf_result_o[23] [1]),
        .I1(\Data_B_i[18]_1 [0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(\Data_B_i[18]_1 [1]),
        .O(\sgf_result_o[19] [2]));
  LUT3 #(
    .INIT(8'h6A)) 
    S_B0_carry__0_i_3__0
       (.I0(\sgf_result_o[23] [0]),
        .I1(p_0_in[0]),
        .I2(\Data_B_i[18]_1 [0]),
        .O(\sgf_result_o[19] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry__1_i_1__0
       (.I0(sgf_result_o1__21_carry__1_n_6),
        .I1(\Data_B_i[18]_2 ),
        .O(\sgf_result_o[23]_1 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    S_B0_carry__1_i_2
       (.I0(\sgf_result_o[23]_0 ),
        .I1(\Data_A_i[18]_2 ),
        .O(\sgf_result_o[23]_1 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    S_B0_carry__1_i_3__0
       (.I0(\sgf_result_o[23] [3]),
        .I1(\Data_A_i[18]_4 ),
        .O(\sgf_result_o[23]_1 [0]));
  LUT6 #(
    .INIT(64'h0400464B04000B0B)) 
    sgf_result_o1__0_carry__0_i_6__0
       (.I0(\ODD1.middle_n_9 ),
        .I1(\ODD1.middle_n_7 ),
        .I2(\sgf_result_o[15] ),
        .I3(\sgf_result_o[15]_1 ),
        .I4(\sgf_result_o[15]_0 ),
        .I5(\ODD1.middle_n_13 ),
        .O(sgf_result_o1__0_carry__0_i_6__0_n_0));
  LUT6 #(
    .INIT(64'h0020000000330020)) 
    sgf_result_o1__0_carry__0_i_7__0
       (.I0(\ODD1.middle_n_13 ),
        .I1(\sgf_result_o[15]_0 ),
        .I2(\sgf_result_o[15]_1 ),
        .I3(\sgf_result_o[15] ),
        .I4(\ODD1.middle_n_7 ),
        .I5(\ODD1.middle_n_9 ),
        .O(sgf_result_o1__0_carry__0_i_7__0_n_0));
  LUT6 #(
    .INIT(64'h6060609F609F6060)) 
    sgf_result_o1__0_carry_i_10__0
       (.I0(\Data_A_i[18]_0 [0]),
        .I1(p_0_in[0]),
        .I2(\ODD1.middle_n_7 ),
        .I3(\ODD1.middle_n_9 ),
        .I4(\Data_B_i[18]_0 [0]),
        .I5(\Data_B_i[18]_1 [0]),
        .O(sgf_result_o1__0_carry_i_10__0_n_0));
  LUT6 #(
    .INIT(64'h6868688068808080)) 
    sgf_result_o1__0_carry_i_11__0
       (.I0(\Data_A_i[18]_0 [3]),
        .I1(\ODD1.middle_n_10 ),
        .I2(\Data_B_i[18]_0 [3]),
        .I3(\Data_B_i[18]_0 [2]),
        .I4(\ODD1.middle_n_14 ),
        .I5(CO),
        .O(sgf_result_o1__0_carry_i_11__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h566A)) 
    sgf_result_o1__0_carry_i_14__0
       (.I0(\Data_A_i[18]_0 [3]),
        .I1(\Data_A_i[18]_0 [2]),
        .I2(\ODD1.middle_n_12 ),
        .I3(p_0_in[2]),
        .O(sgf_result_o1__0_carry_i_14__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h566A)) 
    sgf_result_o1__0_carry_i_15__0
       (.I0(\Data_B_i[18]_0 [3]),
        .I1(\Data_B_i[18]_0 [2]),
        .I2(\ODD1.middle_n_14 ),
        .I3(CO),
        .O(sgf_result_o1__0_carry_i_15__0_n_0));
  LUT6 #(
    .INIT(64'hBEFA7D72FEFA3236)) 
    sgf_result_o1__0_carry_i_16__0
       (.I0(\ODD1.middle_n_9 ),
        .I1(\ODD1.middle_n_7 ),
        .I2(\sgf_result_o[15] ),
        .I3(\sgf_result_o[15]_1 ),
        .I4(\sgf_result_o[15]_0 ),
        .I5(\ODD1.middle_n_13 ),
        .O(sgf_result_o1__0_carry_i_16__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    sgf_result_o1__0_carry_i_17__0
       (.I0(sgf_result_o1__0_carry_i_15__0_n_0),
        .I1(sgf_result_o1__0_carry_i_14__0_n_0),
        .O(sgf_result_o1__0_carry_i_17__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hA880)) 
    sgf_result_o1__0_carry_i_19__0
       (.I0(\Data_A_i[18]_0 [3]),
        .I1(\Data_A_i[18]_0 [2]),
        .I2(\ODD1.middle_n_12 ),
        .I3(p_0_in[2]),
        .O(sgf_result_o1__0_carry_i_19__0_n_0));
  LUT6 #(
    .INIT(64'h9A9A3AC53AC59A9A)) 
    sgf_result_o1__0_carry_i_8__0
       (.I0(\sgf_result_o[15]_2 ),
        .I1(\sgf_result_o[15] ),
        .I2(\sgf_result_o[15]_1 ),
        .I3(\sgf_result_o[15]_0 ),
        .I4(\Data_B_i[18]_1 [0]),
        .I5(\Data_B_i[18]_0 [0]),
        .O(sgf_result_o1__0_carry_i_8__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hE8000000)) 
    sgf_result_o1__0_carry_i_9__0
       (.I0(CO),
        .I1(\ODD1.middle_n_14 ),
        .I2(\Data_B_i[18]_0 [2]),
        .I3(\Data_B_i[18]_0 [3]),
        .I4(sgf_result_o1__0_carry_i_19__0_n_0),
        .O(sgf_result_o1__0_carry_i_9__0_n_0));
  CARRY4 sgf_result_o1__21_carry
       (.CI(1'b0),
        .CO({sgf_result_o1__21_carry_n_0,sgf_result_o1__21_carry_n_1,sgf_result_o1__21_carry_n_2,sgf_result_o1__21_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\ODD1.right_lower_n_4 ,\ODD1.right_lower_n_5 ,\ODD1.right_lower_n_6 ,1'b1}),
        .O(O),
        .S({\ODD1.right_lower_n_11 ,\ODD1.right_lower_n_12 ,\ODD1.right_lower_n_13 ,\ODD1.right_lower_n_14 }));
  CARRY4 sgf_result_o1__21_carry__0
       (.CI(sgf_result_o1__21_carry_n_0),
        .CO({sgf_result_o1__21_carry__0_n_0,sgf_result_o1__21_carry__0_n_1,sgf_result_o1__21_carry__0_n_2,sgf_result_o1__21_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.right_lower_n_7 ,\ODD1.right_lower_n_8 ,\ODD1.right_lower_n_9 ,\ODD1.right_lower_n_10 }),
        .O(\sgf_result_o[23] ),
        .S({\ODD1.right_lower_n_15 ,\ODD1.right_lower_n_16 ,\ODD1.right_lower_n_17 ,\ODD1.right_lower_n_18 }));
  CARRY4 sgf_result_o1__21_carry__1
       (.CI(sgf_result_o1__21_carry__0_n_0),
        .CO({NLW_sgf_result_o1__21_carry__1_CO_UNCONNECTED[3:1],sgf_result_o1__21_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Q_middle_temp__1[8]}),
        .O({NLW_sgf_result_o1__21_carry__1_O_UNCONNECTED[3:2],sgf_result_o1__21_carry__1_n_6,\sgf_result_o[23]_0 }),
        .S({1'b0,1'b0,sgf_result_o1__21_carry__1_i_1__0_n_0,\ODD1.middle_n_22 }));
  LUT1 #(
    .INIT(2'h1)) 
    sgf_result_o1__21_carry__1_i_1__0
       (.I0(Q_middle_temp__1[9]),
        .O(sgf_result_o1__21_carry__1_i_1__0_n_0));
  CARRY4 sgf_result_o1_carry
       (.CI(1'b0),
        .CO({sgf_result_o1_carry_n_0,sgf_result_o1_carry_n_1,sgf_result_o1_carry_n_2,sgf_result_o1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({\ODD1.middle_n_1 ,\ODD1.middle_n_2 ,\ODD1.middle_n_3 ,1'b0}),
        .O(Q_middle_temp__1[5:2]),
        .S({\ODD1.middle_n_15 ,\ODD1.middle_n_16 ,\ODD1.middle_n_17 ,\Data_A_i[22] }));
  CARRY4 sgf_result_o1_carry__0
       (.CI(sgf_result_o1_carry_n_0),
        .CO({NLW_sgf_result_o1_carry__0_CO_UNCONNECTED[3],sgf_result_o1_carry__0_n_1,sgf_result_o1_carry__0_n_2,sgf_result_o1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\ODD1.middle_n_4 ,\ODD1.middle_n_5 ,\ODD1.middle_n_0 }),
        .O(Q_middle_temp__1[9:6]),
        .S({\ODD1.middle_n_18 ,\ODD1.middle_n_19 ,\ODD1.middle_n_20 ,\ODD1.middle_n_21 }));
  LUT5 #(
    .INIT(32'h00009666)) 
    sgf_result_o1_carry_i_5__0
       (.I0(\Data_B_i[18]_0 [1]),
        .I1(\Data_B_i[18]_1 [1]),
        .I2(\Data_B_i[18]_0 [0]),
        .I3(\Data_B_i[18]_1 [0]),
        .I4(\ODD1.middle_n_9 ),
        .O(\sgf_result_o[15]_2 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
