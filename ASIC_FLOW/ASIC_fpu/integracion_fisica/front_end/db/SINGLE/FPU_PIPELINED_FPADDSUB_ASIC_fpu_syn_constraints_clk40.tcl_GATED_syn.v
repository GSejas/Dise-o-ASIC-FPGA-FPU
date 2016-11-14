/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:06:26 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_ShiftRegister_W7_54 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W13_53 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_9 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module FPU_PIPELINED_FPADDSUB_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_OP, 
        Data_X, Data_Y, add_subt, busy, overflow_flag, underflow_flag, 
        zero_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  output [31:0] final_result_ieee;
  input clk, rst, beg_OP, add_subt;
  output busy, overflow_flag, underflow_flag, zero_flag, ready;
  wire   enable_Pipeline_input, Shift_reg_FLAGS_7_6, Shift_reg_FLAGS_7_5,
         OP_FLAG_INIT, SIGN_FLAG_INIT, ZERO_FLAG_INIT, SIGN_FLAG_EXP,
         OP_FLAG_EXP, ZERO_FLAG_EXP, SIGN_FLAG_SHT1, OP_FLAG_SHT1,
         ZERO_FLAG_SHT1, ADD_OVRFLW_NRM, n_7_net_, left_right_SHT2,
         bit_shift_SHT2, SIGN_FLAG_SHT2, OP_FLAG_SHT2, ZERO_FLAG_SHT2,
         ADD_OVRFLW_NRM2, SIGN_FLAG_SHT1SHT2, ZERO_FLAG_SHT1SHT2,
         SIGN_FLAG_NRM, ZERO_FLAG_NRM, n_21_net_, SIGN_FLAG_SFG, ZERO_FLAG_SFG,
         N59, N60, ADD_OVRFLW_SGF, inst_ShiftRegister_net3669433,
         SFT2FRMT_STAGE_VARS_net3669343, FRMT_STAGE_DATAOUT_net3669271,
         SGF_STAGE_DMP_net3669325, NRM_STAGE_Raw_mant_net3669307,
         INPUT_STAGE_OPERANDY_net3669271, EXP_STAGE_DMP_net3669325,
         SHT1_STAGE_DMP_net3669325, SHT2_STAGE_DMP_net3669325,
         SHT2_SHIFT_DATA_net3669307, array_comparators_GTComparator_N0,
         array_comparators_LTComparator_N0, n388, n389, n390,
         DP_OP_15J182_122_6956_n18, DP_OP_15J182_122_6956_n17,
         DP_OP_15J182_122_6956_n16, DP_OP_15J182_122_6956_n15,
         DP_OP_15J182_122_6956_n14, DP_OP_15J182_122_6956_n8,
         DP_OP_15J182_122_6956_n7, DP_OP_15J182_122_6956_n6,
         DP_OP_15J182_122_6956_n5, DP_OP_15J182_122_6956_n4,
         DP_OP_15J182_122_6956_n3, DP_OP_15J182_122_6956_n2,
         DP_OP_15J182_122_6956_n1, intadd_430_CI, intadd_430_SUM_2_,
         intadd_430_SUM_1_, intadd_430_SUM_0_, intadd_430_n3, intadd_430_n2,
         intadd_430_n1, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n550, n551, n552, n553, n554, n555, n556,
         n557, n559, n560, n561, n562, n563, n564, n565, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987, n988, n989,
         n990, n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000,
         n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010,
         n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020,
         n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030,
         n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040,
         n1041, n1042, n1043, n1045, n1046, n1047, n1048, n1049, n1050, n1051,
         n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080;
  wire   [3:0] Shift_reg_FLAGS_7;
  wire   [31:0] intDX_EWSW;
  wire   [30:0] intDY_EWSW;
  wire   [30:0] DMP_INIT_EWSW;
  wire   [27:0] DmP_INIT_EWSW;
  wire   [30:0] DMP_EXP_EWSW;
  wire   [27:0] DmP_EXP_EWSW;
  wire   [4:0] Shift_amount_EXP_EW;
  wire   [30:0] DMP_SHT1_EWSW;
  wire   [22:0] DmP_mant_SHT1_SW;
  wire   [4:0] Shift_amount_SHT1_EWR;
  wire   [4:0] LZD_raw_out_EWR;
  wire   [4:2] shft_value_mux_o_EWR;
  wire   [25:0] Raw_mant_NRM_SWR;
  wire   [51:0] Data_array_SWR;
  wire   [30:0] DMP_SHT2_EWSW;
  wire   [4:2] shift_value_SHT2_EWR;
  wire   [7:0] DMP_exp_NRM2_EW;
  wire   [7:0] DMP_exp_NRM_EW;
  wire   [25:0] sftr_odat_SHT2_SWR;
  wire   [4:0] LZD_output_NRM2_EW;
  wire   [7:0] exp_rslt_NRM2_EW1;
  wire   [30:0] DMP_SFG;
  wire   [24:2] DmP_mant_SFG_SWR;
  wire   [25:1] Raw_mant_SGF;
  wire   [31:0] formatted_number_W;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  SNPS_CLOCK_GATE_HIGH_ShiftRegister_W7_54 inst_ShiftRegister_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n390), .ENCLK(inst_ShiftRegister_net3669433), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W13_53 SFT2FRMT_STAGE_VARS_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[1]), .ENCLK(
        SFT2FRMT_STAGE_VARS_net3669343), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_6 FRMT_STAGE_DATAOUT_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[0]), .ENCLK(
        FRMT_STAGE_DATAOUT_net3669271), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_5 SGF_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n_21_net_), .ENCLK(SGF_STAGE_DMP_net3669325), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_1 NRM_STAGE_Raw_mant_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[2]), .ENCLK(
        NRM_STAGE_Raw_mant_net3669307), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_7 INPUT_STAGE_OPERANDY_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enable_Pipeline_input), .ENCLK(
        INPUT_STAGE_OPERANDY_net3669271), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_9 EXP_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7_6), .ENCLK(EXP_STAGE_DMP_net3669325), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_8 SHT1_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7_5), .ENCLK(SHT1_STAGE_DMP_net3669325), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_7 SHT2_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(busy), .ENCLK(SHT2_STAGE_DMP_net3669325), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_4 SHT2_SHIFT_DATA_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n_7_net_), .ENCLK(SHT2_SHIFT_DATA_net3669307), .TE(1'b0) );
  DFFRXLTS inst_ShiftRegister_Q_reg_6_ ( .D(n1080), .CK(
        inst_ShiftRegister_net3669433), .RN(n1048), .Q(Shift_reg_FLAGS_7_6) );
  DFFRXLTS inst_ShiftRegister_Q_reg_5_ ( .D(Shift_reg_FLAGS_7_6), .CK(
        inst_ShiftRegister_net3669433), .RN(n1047), .Q(Shift_reg_FLAGS_7_5) );
  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(busy), .CK(
        inst_ShiftRegister_net3669433), .RN(n1047), .Q(Shift_reg_FLAGS_7[3])
         );
  DFFRXLTS inst_ShiftRegister_Q_reg_2_ ( .D(Shift_reg_FLAGS_7[3]), .CK(
        inst_ShiftRegister_net3669433), .RN(n1052), .Q(Shift_reg_FLAGS_7[2])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(Shift_amount_EXP_EW[0]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1046), .Q(Shift_amount_SHT1_EWR[0])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(Shift_amount_EXP_EW[1]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1047), .Q(Shift_amount_SHT1_EWR[1])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(Shift_amount_EXP_EW[2]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1052), .Q(Shift_amount_SHT1_EWR[2])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(Shift_amount_EXP_EW[3]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1046), .Q(Shift_amount_SHT1_EWR[3])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(Shift_amount_EXP_EW[4]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1049), .Q(Shift_amount_SHT1_EWR[4])
         );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n1056), 
        .Q(ready) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(formatted_number_W[23]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1059), .Q(final_result_ieee[23])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(formatted_number_W[24]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1055), .Q(final_result_ieee[24])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(formatted_number_W[25]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1066), .Q(final_result_ieee[25])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(formatted_number_W[26]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1074), .Q(final_result_ieee[26])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(formatted_number_W[27]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1059), .Q(final_result_ieee[27])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(formatted_number_W[28]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1055), .Q(final_result_ieee[28])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(formatted_number_W[29]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1073), .Q(final_result_ieee[29])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(formatted_number_W[30]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1062), .Q(final_result_ieee[30])
         );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(array_comparators_LTComparator_N0), 
        .CK(FRMT_STAGE_DATAOUT_net3669271), .RN(n1070), .Q(underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(array_comparators_GTComparator_N0), 
        .CK(FRMT_STAGE_DATAOUT_net3669271), .RN(n1063), .Q(overflow_flag) );
  DFFRXLTS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(Data_X[28]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1047), .Q(intDX_EWSW[28]), .QN(
        n395) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(DmP_INIT_EWSW[0]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1058), .Q(DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(DmP_EXP_EWSW[0]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1050), .Q(DmP_mant_SHT1_SW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(DmP_INIT_EWSW[1]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1050), .Q(DmP_EXP_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(DmP_EXP_EWSW[1]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1050), .Q(DmP_mant_SHT1_SW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(DmP_INIT_EWSW[2]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1050), .Q(DmP_EXP_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(DmP_EXP_EWSW[2]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1050), .Q(DmP_mant_SHT1_SW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(DmP_INIT_EWSW[3]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1050), .Q(DmP_EXP_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(DmP_EXP_EWSW[3]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1051), .Q(DmP_mant_SHT1_SW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(DmP_INIT_EWSW[4]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1051), .Q(DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(DmP_EXP_EWSW[4]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1051), .Q(DmP_mant_SHT1_SW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(DmP_INIT_EWSW[5]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1051), .Q(DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(DmP_EXP_EWSW[5]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1051), .Q(DmP_mant_SHT1_SW[5]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(DmP_INIT_EWSW[6]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1051), .Q(DmP_EXP_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(DmP_EXP_EWSW[6]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1051), .Q(DmP_mant_SHT1_SW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(DmP_INIT_EWSW[7]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1051), .Q(DmP_EXP_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(DmP_EXP_EWSW[7]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1068), .Q(DmP_mant_SHT1_SW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(DmP_INIT_EWSW[8]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1048), .Q(DmP_EXP_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(DmP_EXP_EWSW[8]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1047), .Q(DmP_mant_SHT1_SW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(DmP_INIT_EWSW[9]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1046), .Q(DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(DmP_EXP_EWSW[9]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1052), .Q(DmP_mant_SHT1_SW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(DmP_INIT_EWSW[10]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1049), .Q(DmP_EXP_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(DmP_EXP_EWSW[10]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1056), .Q(DmP_mant_SHT1_SW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(DmP_INIT_EWSW[11]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1068), .Q(DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(DmP_EXP_EWSW[11]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1053), .Q(DmP_mant_SHT1_SW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(DmP_INIT_EWSW[12]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1053), .Q(DmP_EXP_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(DmP_EXP_EWSW[12]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1053), .Q(DmP_mant_SHT1_SW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(DmP_INIT_EWSW[13]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1053), .Q(DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(DmP_EXP_EWSW[13]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1053), .Q(DmP_mant_SHT1_SW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(DmP_INIT_EWSW[14]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1053), .Q(DmP_EXP_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(DmP_EXP_EWSW[14]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1053), .Q(DmP_mant_SHT1_SW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(DmP_INIT_EWSW[15]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1053), .Q(DmP_EXP_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(DmP_EXP_EWSW[15]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1054), .Q(DmP_mant_SHT1_SW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(DmP_INIT_EWSW[16]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1057), .Q(DmP_EXP_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(DmP_EXP_EWSW[16]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1061), .Q(DmP_mant_SHT1_SW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(DmP_INIT_EWSW[17]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1054), .Q(DmP_EXP_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(DmP_EXP_EWSW[17]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1057), .Q(DmP_mant_SHT1_SW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(DmP_INIT_EWSW[18]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1061), .Q(DmP_EXP_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(DmP_EXP_EWSW[18]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1054), .Q(DmP_mant_SHT1_SW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(DmP_INIT_EWSW[19]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1057), .Q(DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(DmP_EXP_EWSW[19]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1055), .Q(DmP_mant_SHT1_SW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(DmP_INIT_EWSW[20]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1059), .Q(DmP_EXP_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(DmP_EXP_EWSW[20]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1074), .Q(DmP_mant_SHT1_SW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(DmP_INIT_EWSW[21]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1066), .Q(DmP_EXP_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(DmP_EXP_EWSW[21]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1055), .Q(DmP_mant_SHT1_SW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(DmP_INIT_EWSW[22]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1059), .Q(DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(DmP_EXP_EWSW[22]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1074), .Q(DmP_mant_SHT1_SW[22]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_23_ ( .D(DmP_INIT_EWSW[23]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1066), .Q(DmP_EXP_EWSW[23]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_24_ ( .D(DmP_INIT_EWSW[24]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1049), .Q(DmP_EXP_EWSW[24]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_25_ ( .D(DmP_INIT_EWSW[25]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1056), .Q(DmP_EXP_EWSW[25]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_26_ ( .D(DmP_INIT_EWSW[26]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1068), .Q(DmP_EXP_EWSW[26]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_27_ ( .D(DmP_INIT_EWSW[27]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1048), .Q(DmP_EXP_EWSW[27]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(DMP_INIT_EWSW[0]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1065), .Q(DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(DMP_INIT_EWSW[1]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n430), .Q(DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(DMP_INIT_EWSW[2]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1070), .Q(DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(DMP_INIT_EWSW[3]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1065), .Q(DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(DMP_INIT_EWSW[4]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n430), .Q(DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(DMP_INIT_EWSW[5]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1047), .Q(DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(DMP_INIT_EWSW[6]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1065), .Q(DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(DMP_INIT_EWSW[7]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n430), .Q(DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(DMP_INIT_EWSW[8]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1047), .Q(DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(DMP_INIT_EWSW[9]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1065), .Q(DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(DMP_INIT_EWSW[10]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n430), .Q(DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(DMP_INIT_EWSW[11]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1070), .Q(DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(DMP_INIT_EWSW[12]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(DMP_INIT_EWSW[13]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(DMP_INIT_EWSW[14]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1054), .Q(DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(DMP_INIT_EWSW[15]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1057), .Q(DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(DMP_INIT_EWSW[16]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(DMP_INIT_EWSW[17]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1054), .Q(DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(DMP_INIT_EWSW[18]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1057), .Q(DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(DMP_INIT_EWSW[19]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(DMP_INIT_EWSW[20]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1054), .Q(DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(DMP_INIT_EWSW[21]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1057), .Q(DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(DMP_INIT_EWSW[22]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_23_ ( .D(DMP_INIT_EWSW[23]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1054), .Q(DMP_EXP_EWSW[23]), .QN(n397)
         );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_24_ ( .D(DMP_INIT_EWSW[24]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1069), .Q(DMP_EXP_EWSW[24]), .QN(n1030) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_25_ ( .D(DMP_INIT_EWSW[25]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1047), .Q(DMP_EXP_EWSW[25]), .QN(n1029) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_26_ ( .D(DMP_INIT_EWSW[26]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1065), .Q(DMP_EXP_EWSW[26]), .QN(n1042) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_27_ ( .D(DMP_INIT_EWSW[27]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_EXP_EWSW[27]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(DMP_INIT_EWSW[28]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(DMP_INIT_EWSW[29]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1057), .Q(DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(DMP_INIT_EWSW[30]), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1072), .Q(DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1075), .Q(ZERO_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1069), .Q(OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3669325), .RN(n1047), .Q(SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(DMP_EXP_EWSW[0]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(DMP_EXP_EWSW[1]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1058), .Q(DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(DMP_EXP_EWSW[2]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(DMP_EXP_EWSW[3]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(DMP_EXP_EWSW[4]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1069), .Q(DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(DMP_EXP_EWSW[5]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1065), .Q(DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(DMP_EXP_EWSW[6]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1075), .Q(DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(DMP_EXP_EWSW[7]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(DMP_EXP_EWSW[8]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(DMP_EXP_EWSW[9]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(DMP_EXP_EWSW[10]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(DMP_EXP_EWSW[11]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1047), .Q(DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(DMP_EXP_EWSW[12]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1069), .Q(DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(DMP_EXP_EWSW[13]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1065), .Q(DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(DMP_EXP_EWSW[14]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1066), .Q(DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(DMP_EXP_EWSW[15]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1055), .Q(DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(DMP_EXP_EWSW[16]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1059), .Q(DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(DMP_EXP_EWSW[17]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1074), .Q(DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(DMP_EXP_EWSW[18]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1066), .Q(DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(DMP_EXP_EWSW[19]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1055), .Q(DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(DMP_EXP_EWSW[20]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1059), .Q(DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(DMP_EXP_EWSW[21]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1074), .Q(DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(DMP_EXP_EWSW[22]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1066), .Q(DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(DMP_EXP_EWSW[23]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1055), .Q(DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(DMP_EXP_EWSW[24]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1059), .Q(DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(DMP_EXP_EWSW[25]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1074), .Q(DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(DMP_EXP_EWSW[26]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(DMP_EXP_EWSW[27]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1058), .Q(DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(DMP_EXP_EWSW[28]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(DMP_EXP_EWSW[29]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1058), .Q(DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(DMP_EXP_EWSW[30]), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1058), .Q(ZERO_FLAG_SHT1) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1067), .Q(OP_FLAG_SHT1) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3669325), .RN(n1058), .Q(SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(DMP_SHT1_EWSW[0]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(DMP_SHT1_EWSW[1]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1058), .Q(DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(DMP_SHT1_EWSW[2]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1069), .Q(DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(DMP_SHT1_EWSW[3]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1075), .Q(DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(DMP_SHT1_EWSW[4]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(DMP_SHT1_EWSW[5]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(DMP_SHT1_EWSW[6]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1057), .Q(DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(DMP_SHT1_EWSW[7]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1073), .Q(DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(DMP_SHT1_EWSW[8]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1065), .Q(DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(DMP_SHT1_EWSW[9]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1069), .Q(DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(DMP_SHT1_EWSW[10]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n430), .Q(DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(DMP_SHT1_EWSW[11]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(DMP_SHT1_EWSW[12]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(DMP_SHT1_EWSW[13]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1070), .Q(DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(DMP_SHT1_EWSW[14]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1075), .Q(DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(DMP_SHT1_EWSW[15]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1063), .Q(DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(DMP_SHT1_EWSW[16]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1070), .Q(DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(DMP_SHT1_EWSW[17]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n428), .Q(DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(DMP_SHT1_EWSW[18]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n431), .Q(DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(DMP_SHT1_EWSW[19]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1070), .Q(DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(DMP_SHT1_EWSW[20]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(DMP_SHT1_EWSW[21]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(DMP_SHT1_EWSW[22]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(DMP_SHT1_EWSW[23]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(DMP_SHT2_EWSW[23]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(DMP_SFG[23]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1067), .Q(DMP_exp_NRM_EW[0]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(DMP_exp_NRM_EW[0]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1072), .Q(DMP_exp_NRM2_EW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(DMP_SHT1_EWSW[24]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(DMP_SHT2_EWSW[24]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(DMP_SFG[24]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1075), .Q(DMP_exp_NRM_EW[1]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(DMP_exp_NRM_EW[1]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1071), .Q(DMP_exp_NRM2_EW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(DMP_SHT1_EWSW[25]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(DMP_SHT2_EWSW[25]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(DMP_SFG[25]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1070), .Q(DMP_exp_NRM_EW[2]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(DMP_exp_NRM_EW[2]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1063), .Q(DMP_exp_NRM2_EW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(DMP_SHT1_EWSW[26]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(DMP_SHT2_EWSW[26]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1054), .Q(DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(DMP_SFG[26]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n428), .Q(DMP_exp_NRM_EW[3]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(DMP_exp_NRM_EW[3]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1070), .Q(DMP_exp_NRM2_EW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(DMP_SHT1_EWSW[27]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(DMP_SHT2_EWSW[27]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1075), .Q(DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(DMP_SFG[27]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1072), .Q(DMP_exp_NRM_EW[4]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(DMP_exp_NRM_EW[4]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n431), .Q(DMP_exp_NRM2_EW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(DMP_SHT1_EWSW[28]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1069), .Q(DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(DMP_SHT2_EWSW[28]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n430), .Q(DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(DMP_SFG[28]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1071), .Q(DMP_exp_NRM_EW[5]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(DMP_exp_NRM_EW[5]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1067), .Q(DMP_exp_NRM2_EW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(DMP_SHT1_EWSW[29]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(DMP_SHT2_EWSW[29]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1058), .Q(DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(DMP_SFG[29]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1063), .Q(DMP_exp_NRM_EW[6]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(DMP_exp_NRM_EW[6]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1075), .Q(DMP_exp_NRM2_EW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(DMP_SHT1_EWSW[30]), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(DMP_SHT2_EWSW[30]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1063), .Q(DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(DMP_SFG[30]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n429), .Q(DMP_exp_NRM_EW[7]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(DMP_exp_NRM_EW[7]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1076), .Q(DMP_exp_NRM2_EW[7]) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1047), .Q(ZERO_FLAG_SHT2) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1061), .Q(OP_FLAG_SHT2) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3669325), .RN(n1064), .Q(SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1065), .Q(ZERO_FLAG_SFG) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(LZD_raw_out_EWR[3]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1059), .Q(LZD_output_NRM2_EW[3])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(LZD_raw_out_EWR[0]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1074), .Q(LZD_output_NRM2_EW[0])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(LZD_raw_out_EWR[2]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1055), .Q(LZD_output_NRM2_EW[2])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(LZD_raw_out_EWR[1]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1066), .Q(LZD_output_NRM2_EW[1])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(LZD_raw_out_EWR[4]), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1074), .Q(LZD_output_NRM2_EW[4])
         );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1072), .Q(SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SFG), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1067), .Q(ZERO_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_NRM), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n1071), .Q(ZERO_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT1SHT2), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1075), .Q(zero_flag) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(SIGN_FLAG_SFG), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1063), .Q(SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(SIGN_FLAG_NRM), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .RN(n428), .Q(SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(formatted_number_W[31]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n431), .Q(final_result_ieee[31])
         );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(Data_array_SWR[3]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1075), .Q(Data_array_SWR[29]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(Data_array_SWR[2]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1063), .Q(Data_array_SWR[28]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(Data_array_SWR[1]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1070), .Q(Data_array_SWR[27]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(Data_array_SWR[0]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n428), .Q(Data_array_SWR[26]) );
  DFFRXLTS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n1077), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n431), .Q(left_right_SHT2) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(formatted_number_W[8]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1076), .Q(final_result_ieee[8])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(formatted_number_W[9]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n429), .Q(final_result_ieee[9]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(formatted_number_W[10]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1070), .Q(final_result_ieee[10])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(formatted_number_W[11]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1076), .Q(final_result_ieee[11])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(formatted_number_W[12]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n429), .Q(final_result_ieee[12])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(formatted_number_W[13]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1072), .Q(final_result_ieee[13])
         );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(sftr_odat_SHT2_SWR[1]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1067), .Q(N60) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(formatted_number_W[0]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1071), .Q(final_result_ieee[0])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(formatted_number_W[1]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n428), .Q(final_result_ieee[1]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(formatted_number_W[2]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n431), .Q(final_result_ieee[2]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(formatted_number_W[3]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1070), .Q(final_result_ieee[3])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(formatted_number_W[4]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1063), .Q(final_result_ieee[4])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(formatted_number_W[5]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1071), .Q(final_result_ieee[5])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(formatted_number_W[6]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1075), .Q(final_result_ieee[6])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(formatted_number_W[7]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1073), .Q(final_result_ieee[7])
         );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(sftr_odat_SHT2_SWR[25]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1073), .QN(n393) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(formatted_number_W[14]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1073), .Q(final_result_ieee[14])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(formatted_number_W[15]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1073), .Q(final_result_ieee[15])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(formatted_number_W[16]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1073), .Q(final_result_ieee[16])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(formatted_number_W[17]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1073), .Q(final_result_ieee[17])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(formatted_number_W[18]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1073), .Q(final_result_ieee[18])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(formatted_number_W[19]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1062), .Q(final_result_ieee[19])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(formatted_number_W[20]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1064), .Q(final_result_ieee[20])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(formatted_number_W[21]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1070), .Q(final_result_ieee[21])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(formatted_number_W[22]), .CK(
        FRMT_STAGE_DATAOUT_net3669271), .RN(n1064), .Q(final_result_ieee[22])
         );
  CMPR32X2TS DP_OP_15J182_122_6956_U9 ( .A(DMP_exp_NRM2_EW[0]), .B(n933), .C(
        DP_OP_15J182_122_6956_n18), .CO(DP_OP_15J182_122_6956_n8), .S(
        exp_rslt_NRM2_EW1[0]) );
  CMPR32X2TS DP_OP_15J182_122_6956_U8 ( .A(DP_OP_15J182_122_6956_n17), .B(
        DMP_exp_NRM2_EW[1]), .C(DP_OP_15J182_122_6956_n8), .CO(
        DP_OP_15J182_122_6956_n7), .S(exp_rslt_NRM2_EW1[1]) );
  CMPR32X2TS DP_OP_15J182_122_6956_U7 ( .A(DP_OP_15J182_122_6956_n16), .B(
        DMP_exp_NRM2_EW[2]), .C(DP_OP_15J182_122_6956_n7), .CO(
        DP_OP_15J182_122_6956_n6), .S(exp_rslt_NRM2_EW1[2]) );
  CMPR32X2TS DP_OP_15J182_122_6956_U6 ( .A(DP_OP_15J182_122_6956_n15), .B(
        DMP_exp_NRM2_EW[3]), .C(DP_OP_15J182_122_6956_n6), .CO(
        DP_OP_15J182_122_6956_n5), .S(exp_rslt_NRM2_EW1[3]) );
  CMPR32X2TS intadd_430_U4 ( .A(DmP_EXP_EWSW[24]), .B(n1030), .C(intadd_430_CI), .CO(intadd_430_n3), .S(intadd_430_SUM_0_) );
  CMPR32X2TS intadd_430_U3 ( .A(DmP_EXP_EWSW[25]), .B(n1029), .C(intadd_430_n3), .CO(intadd_430_n2), .S(intadd_430_SUM_1_) );
  CMPR32X2TS intadd_430_U2 ( .A(DmP_EXP_EWSW[26]), .B(n1042), .C(intadd_430_n2), .CO(intadd_430_n1), .S(intadd_430_SUM_2_) );
  DFFSX2TS R_0 ( .D(n1043), .CK(INPUT_STAGE_OPERANDY_net3669271), .SN(n1047), 
        .Q(n1079) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(N59), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1058), .Q(Raw_mant_NRM_SWR[0]), 
        .QN(n1041) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(Data_Y[0]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1050), .Q(intDY_EWSW[0]), .QN(
        n1040) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(Data_Y[26]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1056), .Q(intDY_EWSW[26]), .QN(
        n1039) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(Data_Y[15]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1066), .Q(intDY_EWSW[15]), .QN(
        n1038) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(Data_Y[3]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1058), .Q(intDY_EWSW[3]), .QN(
        n1037) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(Data_Y[1]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1050), .Q(intDY_EWSW[1]), .QN(
        n1036) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(Data_Y[11]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1047), .Q(intDY_EWSW[11]), .QN(
        n1035) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(Data_Y[25]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1049), .Q(intDY_EWSW[25]), .QN(
        n1034) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(Data_Y[18]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1054), .Q(intDY_EWSW[18]), .QN(
        n1033) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(Data_Y[17]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1061), .Q(intDY_EWSW[17]), .QN(
        n1032) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(Data_Y[8]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1068), .Q(intDY_EWSW[8]), .QN(
        n1031) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(Data_Y[12]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1053), .Q(intDY_EWSW[12]), .QN(
        n1028) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(Data_Y[27]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1068), .Q(intDY_EWSW[27]), .QN(
        n1027) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(Data_Y[9]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1048), .Q(intDY_EWSW[9]), .QN(
        n1026) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(Data_Y[22]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1059), .Q(intDY_EWSW[22]), .QN(
        n1025) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(Data_Y[20]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1066), .Q(intDY_EWSW[20]), .QN(
        n1024) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(Data_Y[2]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1050), .Q(intDY_EWSW[2]), .QN(
        n1023) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(Data_Y[21]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1055), .Q(intDY_EWSW[21]), .QN(
        n1022) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(Data_Y[13]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1053), .Q(intDY_EWSW[13]), .QN(
        n1021) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(Data_Y[24]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1046), .Q(intDY_EWSW[24]), .QN(
        n1020) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(Data_Y[10]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1047), .Q(intDY_EWSW[10]), .QN(
        n1019) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(Data_Y[4]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1051), .Q(intDY_EWSW[4]), .QN(
        n1018) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(Data_Y[16]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1057), .Q(intDY_EWSW[16]), .QN(
        n1017) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(Data_Y[6]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1051), .Q(intDY_EWSW[6]), .QN(
        n1016) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(Data_Y[5]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1072), .Q(intDY_EWSW[5]), .QN(
        n1015) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(Data_Y[7]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1071), .Q(intDY_EWSW[7]), .QN(
        n1014) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n389), .CK(clk), .RN(
        n1047), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n1013) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_22_ ( .D(DMP_SHT2_EWSW[22]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SFG[22]), .QN(n1012) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(Data_array_SWR[20]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1049), .Q(Data_array_SWR[46]), .QN(
        n1011) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(Raw_mant_SGF[5]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1061), .Q(Raw_mant_NRM_SWR[5]), 
        .QN(n1010) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(Data_array_SWR[25]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1048), .Q(Data_array_SWR[51]), .QN(
        n1009) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(Data_X[16]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1068), .Q(intDX_EWSW[16]), .QN(
        n1008) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(Data_array_SWR[23]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1056), .Q(Data_array_SWR[49]), .QN(
        n1007) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(Data_array_SWR[22]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1046), .Q(Data_array_SWR[48]), .QN(
        n1006) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(Data_X[30]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1068), .Q(intDX_EWSW[30]), .QN(
        n1005) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(Data_X[29]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1056), .Q(intDX_EWSW[29]), .QN(
        n1004) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_20_ ( .D(DMP_SHT2_EWSW[20]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SFG[20]), .QN(n1003) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(Data_X[23]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1056), .Q(intDX_EWSW[23]), .QN(
        n1002) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(Data_X[26]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1047), .Q(intDX_EWSW[26]), .QN(
        n1001) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(Data_X[19]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1047), .Q(intDX_EWSW[19]), .QN(
        n1000) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(Data_X[14]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1068), .Q(intDX_EWSW[14]), .QN(
        n999) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(Data_X[12]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1049), .Q(intDX_EWSW[12]), .QN(
        n998) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(Data_X[11]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1052), .Q(intDX_EWSW[11]), .QN(
        n997) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(Data_X[6]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1048), .Q(intDX_EWSW[6]), .QN(
        n996) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(Data_X[4]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1046), .Q(intDX_EWSW[4]), .QN(
        n995) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(Data_X[25]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1048), .Q(intDX_EWSW[25]), .QN(
        n994) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(Data_X[17]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1048), .Q(intDX_EWSW[17]), .QN(
        n993) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(Data_X[10]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1056), .Q(intDX_EWSW[10]), .QN(
        n992) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(Data_X[8]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1048), .Q(intDX_EWSW[8]), .QN(
        n991) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(Data_X[1]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1046), .Q(intDX_EWSW[1]), .QN(
        n990) );
  DFFRX1TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(shft_value_mux_o_EWR[2]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1076), .Q(shift_value_SHT2_EWR[2]), 
        .QN(n989) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_18_ ( .D(DMP_SHT2_EWSW[18]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n431), .Q(DMP_SFG[18]), .QN(n988) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_21_ ( .D(DMP_SHT2_EWSW[21]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SFG[21]), .QN(n987) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(Data_X[13]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1056), .Q(intDX_EWSW[13]), .QN(
        n986) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(Data_Y[30]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1047), .Q(intDY_EWSW[30]), .QN(
        n985) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(Raw_mant_SGF[12]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1066), .Q(Raw_mant_NRM_SWR[12]), 
        .QN(n983) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_16_ ( .D(DMP_SHT2_EWSW[16]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1071), .Q(DMP_SFG[16]), .QN(n982) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(Raw_mant_SGF[20]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1055), .Q(Raw_mant_NRM_SWR[20]), 
        .QN(n981) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(Raw_mant_SGF[18]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1059), .Q(Raw_mant_NRM_SWR[18]), 
        .QN(n980) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(Raw_mant_SGF[25]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1072), .Q(Raw_mant_NRM_SWR[25]), 
        .QN(n979) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(Raw_mant_SGF[14]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1074), .Q(Raw_mant_NRM_SWR[14]), 
        .QN(n978) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_14_ ( .D(DMP_SHT2_EWSW[14]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1072), .Q(DMP_SFG[14]), .QN(n977) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(Raw_mant_SGF[17]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1074), .Q(Raw_mant_NRM_SWR[17]), 
        .QN(n976) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_12_ ( .D(DMP_SHT2_EWSW[12]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_SFG[12]), .QN(n974) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_19_ ( .D(DMP_SHT2_EWSW[19]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1063), .Q(DMP_SFG[19]), .QN(n973) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(Raw_mant_SGF[3]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1070), .Q(Raw_mant_NRM_SWR[3]), 
        .QN(n972) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(Raw_mant_SGF[6]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1054), .Q(Raw_mant_NRM_SWR[6]), 
        .QN(n971) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(sftr_odat_SHT2_SWR[19]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1073), .Q(DmP_mant_SFG_SWR[19]), .QN(
        n970) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(DMP_SHT2_EWSW[10]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1071), .Q(DMP_SFG[10]), .QN(n969) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(sftr_odat_SHT2_SWR[17]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1073), .Q(DmP_mant_SFG_SWR[17]), .QN(
        n968) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_8_ ( .D(DMP_SHT2_EWSW[8]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1051), .Q(DMP_SFG[8]), .QN(n967) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_6_ ( .D(DMP_SHT2_EWSW[6]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1064), .Q(DMP_SFG[6]), .QN(n966) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_4_ ( .D(DMP_SHT2_EWSW[4]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1075), .Q(DMP_SFG[4]), .QN(n965) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(sftr_odat_SHT2_SWR[15]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1063), .Q(DmP_mant_SFG_SWR[15]), .QN(
        n964) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_2_ ( .D(DMP_SHT2_EWSW[2]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1058), .Q(DMP_SFG[2]), .QN(n963) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_0_ ( .D(DMP_SHT2_EWSW[0]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1058), .Q(DMP_SFG[0]), .QN(n962) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(sftr_odat_SHT2_SWR[13]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1071), .Q(DmP_mant_SFG_SWR[13]), .QN(
        n961) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(sftr_odat_SHT2_SWR[11]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n429), .Q(DmP_mant_SFG_SWR[11]), .QN(
        n960) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(sftr_odat_SHT2_SWR[9]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1070), .Q(DmP_mant_SFG_SWR[9]), .QN(
        n959) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(sftr_odat_SHT2_SWR[7]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1067), .Q(DmP_mant_SFG_SWR[7]), .QN(
        n958) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_3_ ( .D(DMP_SHT2_EWSW[3]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1069), .Q(DMP_SFG[3]), .QN(n957) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(sftr_odat_SHT2_SWR[3]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1075), .Q(DmP_mant_SFG_SWR[3]), .QN(
        n956) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(Data_Y[14]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1053), .Q(intDY_EWSW[14]), .QN(
        n955) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(Data_Y[19]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1057), .Q(intDY_EWSW[19]), .QN(
        n954) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n388), .CK(clk), .RN(
        n1048), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]), .QN(n953) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(Data_array_SWR[24]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1068), .Q(Data_array_SWR[50]), .QN(
        n952) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(Data_Y[23]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1074), .Q(intDY_EWSW[23]), .QN(
        n951) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(Data_array_SWR[21]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1052), .Q(Data_array_SWR[47]), .QN(
        n950) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(Data_X[24]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1068), .Q(intDX_EWSW[24]), .QN(
        n949) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(Data_X[2]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1049), .Q(intDX_EWSW[2]), .QN(
        n948) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(Data_X[0]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1052), .Q(intDX_EWSW[0]), .QN(
        n947) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(Data_X[27]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1049), .Q(intDX_EWSW[27]), .QN(
        n946) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(Data_X[22]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1049), .Q(intDX_EWSW[22]), .QN(
        n945) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(Data_X[20]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1052), .Q(intDX_EWSW[20]), .QN(
        n944) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(Data_X[18]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1047), .Q(intDX_EWSW[18]), .QN(
        n943) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(Data_X[9]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1047), .Q(intDX_EWSW[9]), .QN(
        n942) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(Data_X[5]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1052), .QN(n941) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(Data_X[21]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1046), .Q(intDX_EWSW[21]), .QN(
        n940) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(Data_X[15]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1046), .Q(intDX_EWSW[15]), .QN(
        n939) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(Data_X[3]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1056), .Q(intDX_EWSW[3]), .QN(
        n938) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(Data_Y[29]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1048), .Q(intDY_EWSW[29]), .QN(
        n937) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(sftr_odat_SHT2_SWR[23]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1050), .Q(DmP_mant_SFG_SWR[23]), .QN(
        n936) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(Raw_mant_SGF[22]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1067), .Q(Raw_mant_NRM_SWR[22]), 
        .QN(n934) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(sftr_odat_SHT2_SWR[21]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1070), .Q(DmP_mant_SFG_SWR[21]), .QN(
        n932) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_17_ ( .D(DMP_SHT2_EWSW[17]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n428), .Q(DMP_SFG[17]), .QN(n931) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_15_ ( .D(DMP_SHT2_EWSW[15]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SFG[15]), .QN(n930) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_13_ ( .D(DMP_SHT2_EWSW[13]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1062), .Q(DMP_SFG[13]), .QN(n929) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_11_ ( .D(DMP_SHT2_EWSW[11]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1069), .Q(DMP_SFG[11]), .QN(n928) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(DMP_SHT2_EWSW[9]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SFG[9]), .QN(n927) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_7_ ( .D(DMP_SHT2_EWSW[7]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1061), .Q(DMP_SFG[7]), .QN(n926) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(DMP_SHT2_EWSW[5]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1071), .Q(DMP_SFG[5]), .QN(n925) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(sftr_odat_SHT2_SWR[5]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1072), .Q(DmP_mant_SFG_SWR[5]), .QN(
        n924) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_1_ ( .D(DMP_SHT2_EWSW[1]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1067), .Q(DMP_SFG[1]), .QN(n923) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(n1080), .CK(clk), .RN(
        n1047), .Q(inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n922) );
  CMPR32X2TS DP_OP_15J182_122_6956_U5 ( .A(DP_OP_15J182_122_6956_n14), .B(
        DMP_exp_NRM2_EW[4]), .C(DP_OP_15J182_122_6956_n5), .CO(
        DP_OP_15J182_122_6956_n4), .S(exp_rslt_NRM2_EW1[4]) );
  CMPR32X2TS DP_OP_15J182_122_6956_U4 ( .A(n933), .B(DMP_exp_NRM2_EW[5]), .C(
        DP_OP_15J182_122_6956_n4), .CO(DP_OP_15J182_122_6956_n3), .S(
        exp_rslt_NRM2_EW1[5]) );
  CMPR32X2TS DP_OP_15J182_122_6956_U3 ( .A(n933), .B(DMP_exp_NRM2_EW[6]), .C(
        DP_OP_15J182_122_6956_n3), .CO(DP_OP_15J182_122_6956_n2), .S(
        exp_rslt_NRM2_EW1[6]) );
  CMPR32X2TS DP_OP_15J182_122_6956_U2 ( .A(n933), .B(DMP_exp_NRM2_EW[7]), .C(
        DP_OP_15J182_122_6956_n2), .CO(DP_OP_15J182_122_6956_n1), .S(
        exp_rslt_NRM2_EW1[7]) );
  DFFSX2TS SFT2FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n396), .CK(
        SFT2FRMT_STAGE_VARS_net3669343), .SN(n1066), .Q(n933), .QN(
        ADD_OVRFLW_NRM2) );
  DFFRX2TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1072), .Q(n394), .QN(n1078) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(Data_X[7]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1046), .QN(n1045) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(Raw_mant_SGF[23]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1070), .Q(Raw_mant_NRM_SWR[23])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(Raw_mant_SGF[13]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1066), .Q(Raw_mant_NRM_SWR[13])
         );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(sftr_odat_SHT2_SWR[24]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1064), .Q(DmP_mant_SFG_SWR[24]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(sftr_odat_SHT2_SWR[20]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1073), .Q(DmP_mant_SFG_SWR[20]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(sftr_odat_SHT2_SWR[18]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1073), .Q(DmP_mant_SFG_SWR[18]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(Raw_mant_SGF[24]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1070), .Q(Raw_mant_NRM_SWR[24])
         );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(sftr_odat_SHT2_SWR[22]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1070), .Q(DmP_mant_SFG_SWR[22]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(sftr_odat_SHT2_SWR[16]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1073), .Q(DmP_mant_SFG_SWR[16]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(sftr_odat_SHT2_SWR[8]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1075), .Q(DmP_mant_SFG_SWR[8]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(sftr_odat_SHT2_SWR[6]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1076), .Q(DmP_mant_SFG_SWR[6]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(sftr_odat_SHT2_SWR[4]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n429), .Q(DmP_mant_SFG_SWR[4]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(sftr_odat_SHT2_SWR[14]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1067), .Q(DmP_mant_SFG_SWR[14]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(sftr_odat_SHT2_SWR[12]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1075), .Q(DmP_mant_SFG_SWR[12]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(sftr_odat_SHT2_SWR[10]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1076), .Q(DmP_mant_SFG_SWR[10]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(Raw_mant_SGF[21]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1072), .Q(Raw_mant_NRM_SWR[21])
         );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(shft_value_mux_o_EWR[3]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n429), .Q(shift_value_SHT2_EWR[3]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(Raw_mant_SGF[10]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1066), .Q(Raw_mant_NRM_SWR[10])
         );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(Data_Y[28]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1049), .Q(intDY_EWSW[28]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(Raw_mant_SGF[16]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1066), .Q(Raw_mant_NRM_SWR[16])
         );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(Data_array_SWR[16]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1047), .Q(Data_array_SWR[42]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(Data_array_SWR[17]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1046), .Q(Data_array_SWR[43]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(Raw_mant_SGF[7]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1065), .Q(Raw_mant_NRM_SWR[7]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(Raw_mant_SGF[19]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1066), .Q(Raw_mant_NRM_SWR[19])
         );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(sftr_odat_SHT2_SWR[2]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1063), .Q(DmP_mant_SFG_SWR[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(Data_array_SWR[18]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1052), .Q(Data_array_SWR[44]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(Data_array_SWR[19]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1049), .Q(Data_array_SWR[45]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(Raw_mant_SGF[8]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1069), .Q(Raw_mant_NRM_SWR[8]) );
  DFFRX2TS inst_ShiftRegister_Q_reg_1_ ( .D(Shift_reg_FLAGS_7[2]), .CK(
        inst_ShiftRegister_net3669433), .RN(n1052), .Q(Shift_reg_FLAGS_7[1]), 
        .QN(n935) );
  DFFRX1TS inst_ShiftRegister_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[1]), .CK(
        inst_ShiftRegister_net3669433), .RN(n1047), .Q(Shift_reg_FLAGS_7[0])
         );
  DFFRX1TS inst_ShiftRegister_Q_reg_4_ ( .D(Shift_reg_FLAGS_7_5), .CK(
        inst_ShiftRegister_net3669433), .RN(n1052), .Q(busy) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(Data_array_SWR[9]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1058), .Q(Data_array_SWR[35]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(Data_array_SWR[8]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1065), .Q(Data_array_SWR[34]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(Data_array_SWR[10]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1069), .Q(Data_array_SWR[36]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(Data_array_SWR[11]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1071), .Q(Data_array_SWR[37]) );
  DFFRX1TS SHT2_STAGE_SHFTVARS2_Q_reg_0_ ( .D(n412), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1056), .Q(bit_shift_SHT2) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(sftr_odat_SHT2_SWR[0]), .CK(
        SGF_STAGE_DMP_net3669325), .RN(n1070), .Q(N59) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(Raw_mant_SGF[4]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1071), .Q(Raw_mant_NRM_SWR[4]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(Data_X[31]), .CK(
        INPUT_STAGE_OPERANDY_net3669271), .RN(n1050), .Q(intDX_EWSW[31]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(Raw_mant_SGF[11]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1066), .Q(Raw_mant_NRM_SWR[11])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(Raw_mant_SGF[2]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1058), .Q(Raw_mant_NRM_SWR[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(Data_array_SWR[13]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1062), .Q(Data_array_SWR[39]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(Data_array_SWR[12]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1057), .Q(Data_array_SWR[38]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(Data_array_SWR[14]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1063), .Q(Data_array_SWR[40]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(Data_array_SWR[15]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1068), .Q(Data_array_SWR[41]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(Raw_mant_SGF[9]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1055), .Q(Raw_mant_NRM_SWR[9]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(Raw_mant_SGF[15]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1059), .Q(Raw_mant_NRM_SWR[15])
         );
  DFFRX4TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(shft_value_mux_o_EWR[4]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1071), .Q(shift_value_SHT2_EWR[4]), 
        .QN(n984) );
  DFFRX1TS NRM_STAGE_FLAGS_Q_reg_2_ ( .D(ADD_OVRFLW_SGF), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1070), .Q(ADD_OVRFLW_NRM), .QN(
        n396) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(Data_array_SWR[6]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1058), .Q(Data_array_SWR[32]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(Data_array_SWR[7]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1064), .Q(Data_array_SWR[33]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(Data_array_SWR[5]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1054), .Q(Data_array_SWR[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(Data_array_SWR[4]), .CK(
        SHT2_SHIFT_DATA_net3669307), .RN(n1062), .Q(Data_array_SWR[30]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(Raw_mant_SGF[1]), .CK(
        NRM_STAGE_Raw_mant_net3669307), .RN(n1062), .Q(Raw_mant_NRM_SWR[1]), 
        .QN(n975) );
  BUFX6TS U582 ( .A(n430), .Y(n1067) );
  BUFX6TS U583 ( .A(n899), .Y(n901) );
  NAND2X4TS U584 ( .A(n564), .B(n984), .Y(n433) );
  NAND2X4TS U585 ( .A(n556), .B(n984), .Y(n448) );
  CLKINVX6TS U586 ( .A(n645), .Y(n593) );
  AOI211X2TS U587 ( .A0(Data_array_SWR[42]), .A1(n499), .B0(n478), .C0(n477), 
        .Y(n525) );
  CLKINVX6TS U588 ( .A(n612), .Y(n412) );
  AOI211X2TS U589 ( .A0(Data_array_SWR[43]), .A1(n499), .B0(n478), .C0(n462), 
        .Y(n488) );
  INVX3TS U590 ( .A(n459), .Y(n435) );
  AOI222X2TS U591 ( .A0(DMP_SFG[12]), .A1(DmP_mant_SFG_SWR[14]), .B0(
        DMP_SFG[12]), .B1(n686), .C0(DmP_mant_SFG_SWR[14]), .C1(n686), .Y(n867) );
  AOI222X2TS U592 ( .A0(DMP_SFG[4]), .A1(DmP_mant_SFG_SWR[6]), .B0(DMP_SFG[4]), 
        .B1(n541), .C0(DmP_mant_SFG_SWR[6]), .C1(n541), .Y(n572) );
  AOI222X2TS U593 ( .A0(DMP_SFG[10]), .A1(DmP_mant_SFG_SWR[12]), .B0(
        DMP_SFG[10]), .B1(n680), .C0(DmP_mant_SFG_SWR[12]), .C1(n680), .Y(n862) );
  AOI222X2TS U594 ( .A0(n616), .A1(DmP_mant_SHT1_SW[9]), .B0(
        Raw_mant_NRM_SWR[11]), .B1(n412), .C0(Raw_mant_NRM_SWR[14]), .C1(n1077), .Y(n666) );
  CLKBUFX2TS U595 ( .A(n899), .Y(n903) );
  AOI211X1TS U596 ( .A0(n548), .A1(Data_array_SWR[45]), .B0(n461), .C0(n460), 
        .Y(n485) );
  AOI211X1TS U597 ( .A0(Data_array_SWR[44]), .A1(n548), .B0(n461), .C0(n455), 
        .Y(n494) );
  AOI222X4TS U598 ( .A0(DMP_SFG[2]), .A1(DmP_mant_SFG_SWR[4]), .B0(DMP_SFG[2]), 
        .B1(n520), .C0(DmP_mant_SFG_SWR[4]), .C1(n520), .Y(n535) );
  AOI222X4TS U599 ( .A0(n616), .A1(DmP_mant_SHT1_SW[0]), .B0(n610), .B1(
        Raw_mant_NRM_SWR[23]), .C0(Raw_mant_NRM_SWR[2]), .C1(n412), .Y(n633)
         );
  AOI222X4TS U600 ( .A0(n616), .A1(DmP_mant_SHT1_SW[1]), .B0(n610), .B1(
        Raw_mant_NRM_SWR[22]), .C0(Raw_mant_NRM_SWR[3]), .C1(n412), .Y(n629)
         );
  NAND2BXLTS U601 ( .AN(Raw_mant_NRM_SWR[23]), .B(n934), .Y(n402) );
  AO22XLTS U602 ( .A0(n1077), .A1(LZD_raw_out_EWR[4]), .B0(
        Shift_amount_SHT1_EWR[4]), .B1(n935), .Y(shft_value_mux_o_EWR[4]) );
  AO22XLTS U603 ( .A0(n1077), .A1(LZD_raw_out_EWR[3]), .B0(
        Shift_amount_SHT1_EWR[3]), .B1(n935), .Y(shft_value_mux_o_EWR[3]) );
  AO22XLTS U604 ( .A0(n1077), .A1(LZD_raw_out_EWR[2]), .B0(
        Shift_amount_SHT1_EWR[2]), .B1(n935), .Y(shft_value_mux_o_EWR[2]) );
  BUFX4TS U605 ( .A(n1078), .Y(n893) );
  INVX4TS U606 ( .A(rst), .Y(n430) );
  OAI221X1TS U607 ( .A0(n992), .A1(intDY_EWSW[10]), .B0(n948), .B1(
        intDY_EWSW[2]), .C0(n744), .Y(n747) );
  OAI221X1TS U608 ( .A0(n938), .A1(intDY_EWSW[3]), .B0(n1001), .B1(
        intDY_EWSW[26]), .C0(n752), .Y(n755) );
  OAI221X1TS U609 ( .A0(n946), .A1(intDY_EWSW[27]), .B0(n1000), .B1(
        intDY_EWSW[19]), .C0(n760), .Y(n763) );
  OAI221X1TS U610 ( .A0(n993), .A1(intDY_EWSW[17]), .B0(n1008), .B1(
        intDY_EWSW[16]), .C0(n768), .Y(n771) );
  OAI221X1TS U611 ( .A0(n944), .A1(intDY_EWSW[20]), .B0(n1005), .B1(
        intDY_EWSW[30]), .C0(n766), .Y(n773) );
  OAI21X1TS U612 ( .A0(n497), .A1(n1006), .B0(n496), .Y(n434) );
  OAI21X1TS U613 ( .A0(n497), .A1(n1007), .B0(n496), .Y(n498) );
  NOR2X2TS U614 ( .A(n496), .B(n989), .Y(n478) );
  OAI211X1TS U615 ( .A0(n984), .A1(n532), .B0(n480), .C0(n479), .Y(n506) );
  AOI21X2TS U616 ( .A0(n499), .A1(Data_array_SWR[51]), .B0(n495), .Y(n532) );
  NOR2X2TS U617 ( .A(n978), .B(n405), .Y(n718) );
  OAI211X1TS U618 ( .A0(n984), .A1(n529), .B0(n464), .C0(n463), .Y(n486) );
  AOI21X2TS U619 ( .A0(n499), .A1(Data_array_SWR[50]), .B0(n495), .Y(n529) );
  BUFX4TS U620 ( .A(n1063), .Y(n1073) );
  BUFX4TS U621 ( .A(n1063), .Y(n1062) );
  BUFX4TS U622 ( .A(n1063), .Y(n1064) );
  BUFX4TS U623 ( .A(n430), .Y(n1063) );
  BUFX4TS U624 ( .A(n430), .Y(n1071) );
  BUFX6TS U625 ( .A(n430), .Y(n1070) );
  BUFX4TS U626 ( .A(n430), .Y(n1075) );
  OAI211X1TS U627 ( .A0(n984), .A1(n546), .B0(n545), .C0(n544), .Y(n559) );
  AOI21X2TS U628 ( .A0(n499), .A1(Data_array_SWR[49]), .B0(n495), .Y(n546) );
  BUFX4TS U629 ( .A(n1067), .Y(n1058) );
  BUFX4TS U630 ( .A(n1071), .Y(n1061) );
  BUFX6TS U631 ( .A(n1073), .Y(n1047) );
  BUFX4TS U632 ( .A(n1070), .Y(n1066) );
  AOI21X2TS U633 ( .A0(Data_array_SWR[48]), .A1(n499), .B0(n495), .Y(n554) );
  BUFX4TS U634 ( .A(n432), .Y(n499) );
  AOI21X2TS U635 ( .A0(n499), .A1(Data_array_SWR[46]), .B0(n466), .Y(n491) );
  OAI21X1TS U636 ( .A0(n497), .A1(n952), .B0(n496), .Y(n466) );
  AOI21X2TS U637 ( .A0(n499), .A1(Data_array_SWR[47]), .B0(n467), .Y(n505) );
  OAI21X1TS U638 ( .A0(n497), .A1(n1009), .B0(n496), .Y(n467) );
  CLKINVX6TS U639 ( .A(n564), .Y(n556) );
  BUFX6TS U640 ( .A(left_right_SHT2), .Y(n564) );
  BUFX6TS U641 ( .A(n583), .Y(n914) );
  AOI222X4TS U642 ( .A0(n923), .A1(n847), .B0(n923), .B1(n956), .C0(n847), 
        .C1(n956), .Y(n520) );
  NAND2X1TS U643 ( .A(DMP_SFG[0]), .B(DmP_mant_SFG_SWR[2]), .Y(n847) );
  AOI222X4TS U644 ( .A0(DMP_SFG[20]), .A1(DmP_mant_SFG_SWR[22]), .B0(
        DMP_SFG[20]), .B1(n736), .C0(DmP_mant_SFG_SWR[22]), .C1(n736), .Y(n887) );
  AOI222X4TS U645 ( .A0(n882), .A1(n973), .B0(n882), .B1(n932), .C0(n973), 
        .C1(n932), .Y(n736) );
  OAI21X2TS U646 ( .A0(n978), .A1(n612), .B0(n604), .Y(n662) );
  OAI21X2TS U647 ( .A0(n980), .A1(n612), .B0(n607), .Y(n656) );
  OAI21X2TS U648 ( .A0(n971), .A1(n612), .B0(n611), .Y(n650) );
  OAI21X2TS U649 ( .A0(n595), .A1(n972), .B0(n594), .Y(n674) );
  BUFX4TS U650 ( .A(n438), .Y(n550) );
  BUFX4TS U651 ( .A(n437), .Y(n551) );
  BUFX4TS U652 ( .A(n436), .Y(n548) );
  BUFX6TS U653 ( .A(n935), .Y(n616) );
  INVX2TS U654 ( .A(n903), .Y(n910) );
  INVX4TS U655 ( .A(n903), .Y(n906) );
  INVX3TS U656 ( .A(n595), .Y(n610) );
  CLKINVX3TS U657 ( .A(n893), .Y(n896) );
  INVX4TS U658 ( .A(n893), .Y(n858) );
  NOR3X1TS U659 ( .A(Raw_mant_NRM_SWR[15]), .B(Raw_mant_NRM_SWR[16]), .C(
        Raw_mant_NRM_SWR[17]), .Y(n717) );
  OAI2BB1X1TS U660 ( .A0N(n1077), .A1N(Raw_mant_NRM_SWR[15]), .B0(n601), .Y(
        n668) );
  NOR2X1TS U661 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[8]), .Y(n727)
         );
  NOR4X1TS U662 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[13]), .C(
        Raw_mant_NRM_SWR[11]), .D(n723), .Y(n420) );
  NOR3X1TS U663 ( .A(Raw_mant_NRM_SWR[12]), .B(Raw_mant_NRM_SWR[13]), .C(
        Raw_mant_NRM_SWR[11]), .Y(n724) );
  INVX1TS U664 ( .A(n576), .Y(enable_Pipeline_input) );
  AOI221X1TS U665 ( .A0(intDX_EWSW[30]), .A1(n985), .B0(intDX_EWSW[29]), .B1(
        n937), .C0(n785), .Y(n787) );
  NOR3X6TS U666 ( .A(n427), .B(exp_rslt_NRM2_EW1[7]), .C(n414), .Y(
        array_comparators_LTComparator_N0) );
  XNOR2X2TS U667 ( .A(DP_OP_15J182_122_6956_n1), .B(ADD_OVRFLW_NRM2), .Y(n427)
         );
  OAI211X2TS U668 ( .A0(intDX_EWSW[12]), .A1(n1028), .B0(n815), .C0(n801), .Y(
        n817) );
  AOI211XLTS U669 ( .A0(intDY_EWSW[16]), .A1(n1008), .B0(n829), .C0(n830), .Y(
        n821) );
  OAI211X2TS U670 ( .A0(intDX_EWSW[20]), .A1(n1024), .B0(n835), .C0(n820), .Y(
        n829) );
  CLKINVX6TS U671 ( .A(n903), .Y(n905) );
  NOR3X2TS U672 ( .A(Raw_mant_NRM_SWR[5]), .B(Raw_mant_NRM_SWR[4]), .C(n716), 
        .Y(n713) );
  AOI222X4TS U673 ( .A0(DMP_SFG[18]), .A1(DmP_mant_SFG_SWR[20]), .B0(
        DMP_SFG[18]), .B1(n704), .C0(DmP_mant_SFG_SWR[20]), .C1(n704), .Y(n882) );
  AOI222X4TS U674 ( .A0(n877), .A1(n931), .B0(n877), .B1(n970), .C0(n931), 
        .C1(n970), .Y(n704) );
  NOR2X4TS U675 ( .A(n597), .B(n596), .Y(n675) );
  NOR2X4TS U676 ( .A(n585), .B(n597), .Y(n645) );
  AOI22X2TS U677 ( .A0(n610), .A1(LZD_raw_out_EWR[1]), .B0(
        Shift_amount_SHT1_EWR[1]), .B1(n616), .Y(n597) );
  BUFX6TS U678 ( .A(n443), .Y(n917) );
  NAND2X2TS U679 ( .A(Shift_reg_FLAGS_7[1]), .B(ADD_OVRFLW_NRM), .Y(n612) );
  OAI22X2TS U680 ( .A0(Shift_reg_FLAGS_7[1]), .A1(Shift_amount_SHT1_EWR[0]), 
        .B0(LZD_raw_out_EWR[0]), .B1(n595), .Y(n585) );
  AOI21X2TS U681 ( .A0(n499), .A1(Data_array_SWR[45]), .B0(n498), .Y(n567) );
  AOI21X2TS U682 ( .A0(n499), .A1(Data_array_SWR[44]), .B0(n434), .Y(n561) );
  AOI222X4TS U683 ( .A0(DmP_mant_SFG_SWR[2]), .A1(n962), .B0(
        DmP_mant_SFG_SWR[2]), .B1(n848), .C0(n962), .C1(n848), .Y(n514) );
  NOR3X1TS U684 ( .A(Raw_mant_NRM_SWR[19]), .B(Raw_mant_NRM_SWR[20]), .C(
        Raw_mant_NRM_SWR[21]), .Y(n711) );
  NOR2X2TS U685 ( .A(Raw_mant_NRM_SWR[7]), .B(n399), .Y(n730) );
  NOR3X1TS U686 ( .A(n395), .B(n784), .C(intDY_EWSW[28]), .Y(n785) );
  OAI221X1TS U687 ( .A0(n908), .A1(intDY_EWSW[28]), .B0(n996), .B1(
        intDY_EWSW[6]), .C0(n758), .Y(n765) );
  NAND2X2TS U688 ( .A(bit_shift_SHT2), .B(shift_value_SHT2_EWR[3]), .Y(n496)
         );
  NAND3X2TS U689 ( .A(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .C(n984), .Y(n459) );
  OAI32X1TS U690 ( .A0(Raw_mant_NRM_SWR[23]), .A1(Raw_mant_NRM_SWR[21]), .A2(
        n981), .B0(n934), .B1(Raw_mant_NRM_SWR[23]), .Y(n421) );
  AOI222X4TS U691 ( .A0(DMP_SFG[8]), .A1(DmP_mant_SFG_SWR[10]), .B0(DMP_SFG[8]), .B1(n589), .C0(DmP_mant_SFG_SWR[10]), .C1(n589), .Y(n856) );
  AOI222X4TS U692 ( .A0(DMP_SFG[6]), .A1(DmP_mant_SFG_SWR[8]), .B0(DMP_SFG[6]), 
        .B1(n579), .C0(DmP_mant_SFG_SWR[8]), .C1(n579), .Y(n851) );
  AOI222X4TS U693 ( .A0(DMP_SFG[14]), .A1(DmP_mant_SFG_SWR[16]), .B0(
        DMP_SFG[14]), .B1(n692), .C0(DmP_mant_SFG_SWR[16]), .C1(n692), .Y(n872) );
  NOR4X2TS U694 ( .A(Raw_mant_NRM_SWR[24]), .B(Raw_mant_NRM_SWR[25]), .C(
        Raw_mant_NRM_SWR[22]), .D(Raw_mant_NRM_SWR[23]), .Y(n708) );
  AOI222X4TS U695 ( .A0(DMP_SFG[16]), .A1(DmP_mant_SFG_SWR[18]), .B0(
        DMP_SFG[16]), .B1(n698), .C0(DmP_mant_SFG_SWR[18]), .C1(n698), .Y(n877) );
  AOI222X4TS U696 ( .A0(DMP_SFG[22]), .A1(DmP_mant_SFG_SWR[24]), .B0(
        DMP_SFG[22]), .B1(n894), .C0(DmP_mant_SFG_SWR[24]), .C1(n894), .Y(n778) );
  OAI221X1TS U697 ( .A0(n1045), .A1(intDY_EWSW[7]), .B0(n999), .B1(
        intDY_EWSW[14]), .C0(n750), .Y(n757) );
  INVX2TS U698 ( .A(intDX_EWSW[28]), .Y(n908) );
  OAI21XLTS U699 ( .A0(intDX_EWSW[1]), .A1(n1036), .B0(intDX_EWSW[0]), .Y(n791) );
  OAI21XLTS U700 ( .A0(intDX_EWSW[15]), .A1(n1038), .B0(intDX_EWSW[14]), .Y(
        n811) );
  NOR2XLTS U701 ( .A(n824), .B(intDY_EWSW[16]), .Y(n825) );
  OAI21XLTS U702 ( .A0(intDX_EWSW[21]), .A1(n1022), .B0(intDX_EWSW[20]), .Y(
        n823) );
  NOR2XLTS U703 ( .A(n564), .B(n449), .Y(n450) );
  NOR2XLTS U704 ( .A(n556), .B(n449), .Y(n441) );
  OAI21XLTS U705 ( .A0(n459), .A1(n1007), .B0(n458), .Y(n460) );
  OAI211XLTS U706 ( .A0(n922), .A1(n918), .B0(n919), .C0(beg_OP), .Y(n576) );
  OAI21XLTS U707 ( .A0(n538), .A1(n540), .B0(n537), .Y(n536) );
  OAI21XLTS U708 ( .A0(n671), .A1(n914), .B0(n632), .Y(Data_array_SWR[21]) );
  OAI21XLTS U709 ( .A0(n915), .A1(n593), .B0(n600), .Y(Data_array_SWR[22]) );
  OAI21XLTS U710 ( .A0(n648), .A1(n912), .B0(n615), .Y(Data_array_SWR[6]) );
  OR2X1TS U711 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[4]), .Y(formatted_number_W[27]) );
  NAND2X1TS U712 ( .A(n711), .B(n708), .Y(n408) );
  NOR2X1TS U713 ( .A(Raw_mant_NRM_SWR[18]), .B(n408), .Y(n720) );
  NAND2X1TS U714 ( .A(n720), .B(n717), .Y(n405) );
  NOR2X1TS U715 ( .A(Raw_mant_NRM_SWR[14]), .B(n405), .Y(n407) );
  NAND2X1TS U716 ( .A(n724), .B(n407), .Y(n726) );
  NOR2XLTS U717 ( .A(Raw_mant_NRM_SWR[10]), .B(n726), .Y(n398) );
  NAND2X1TS U718 ( .A(n727), .B(n398), .Y(n399) );
  NAND2X1TS U719 ( .A(n730), .B(n971), .Y(n716) );
  OA21XLTS U720 ( .A0(Raw_mant_NRM_SWR[3]), .A1(Raw_mant_NRM_SWR[2]), .B0(n713), .Y(n401) );
  INVX2TS U721 ( .A(n399), .Y(n400) );
  OAI31X1TS U722 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n401), .A2(
        Raw_mant_NRM_SWR[6]), .B0(n400), .Y(n732) );
  NOR2XLTS U723 ( .A(Raw_mant_NRM_SWR[20]), .B(Raw_mant_NRM_SWR[21]), .Y(n404)
         );
  NOR2X1TS U724 ( .A(Raw_mant_NRM_SWR[24]), .B(Raw_mant_NRM_SWR[25]), .Y(n403)
         );
  AOI32X1TS U725 ( .A0(n404), .A1(n403), .A2(Raw_mant_NRM_SWR[19]), .B0(n402), 
        .B1(n403), .Y(n411) );
  INVX2TS U726 ( .A(n408), .Y(n419) );
  NOR2XLTS U727 ( .A(Raw_mant_NRM_SWR[16]), .B(Raw_mant_NRM_SWR[17]), .Y(n406)
         );
  AOI31XLTS U728 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n419), .A2(n406), .B0(n718), 
        .Y(n410) );
  INVX2TS U729 ( .A(n407), .Y(n723) );
  NOR2X1TS U730 ( .A(Raw_mant_NRM_SWR[13]), .B(n723), .Y(n418) );
  NAND2BXLTS U731 ( .AN(n726), .B(Raw_mant_NRM_SWR[10]), .Y(n721) );
  OAI21X1TS U732 ( .A0(n408), .A1(n980), .B0(n721), .Y(n417) );
  AOI31XLTS U733 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n418), .A2(n983), .B0(n417), 
        .Y(n409) );
  NAND4XLTS U734 ( .A(n732), .B(n411), .C(n410), .D(n409), .Y(
        LZD_raw_out_EWR[1]) );
  OR4X2TS U735 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[2]), .C(
        exp_rslt_NRM2_EW1[1]), .D(exp_rslt_NRM2_EW1[0]), .Y(n413) );
  OR4X2TS U736 ( .A(exp_rslt_NRM2_EW1[6]), .B(exp_rslt_NRM2_EW1[5]), .C(
        exp_rslt_NRM2_EW1[4]), .D(n413), .Y(n414) );
  NAND2BXLTS U737 ( .AN(n716), .B(Raw_mant_NRM_SWR[4]), .Y(n725) );
  AOI21X1TS U738 ( .A0(Raw_mant_NRM_SWR[0]), .A1(n975), .B0(
        Raw_mant_NRM_SWR[2]), .Y(n415) );
  NAND2X1TS U739 ( .A(n713), .B(n972), .Y(n733) );
  OAI22X1TS U740 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n725), .B0(n415), .B1(n733), 
        .Y(n416) );
  AOI211X1TS U741 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n418), .B0(n417), .C0(n416), 
        .Y(n715) );
  AOI31XLTS U742 ( .A0(Raw_mant_NRM_SWR[16]), .A1(n419), .A2(n976), .B0(n718), 
        .Y(n424) );
  AOI22X1TS U743 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n420), .B0(
        Raw_mant_NRM_SWR[6]), .B1(n730), .Y(n423) );
  OAI21XLTS U744 ( .A0(Raw_mant_NRM_SWR[24]), .A1(n421), .B0(n979), .Y(n422)
         );
  NAND4XLTS U745 ( .A(n715), .B(n424), .C(n423), .D(n422), .Y(
        LZD_raw_out_EWR[0]) );
  AOI33XLTS U746 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .B0(n953), .B1(n922), .B2(n1013), 
        .Y(n390) );
  AND4X1TS U747 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[2]), .C(
        exp_rslt_NRM2_EW1[1]), .D(exp_rslt_NRM2_EW1[0]), .Y(n425) );
  AND4X1TS U748 ( .A(exp_rslt_NRM2_EW1[6]), .B(exp_rslt_NRM2_EW1[5]), .C(
        exp_rslt_NRM2_EW1[4]), .D(n425), .Y(n426) );
  AND3X1TS U749 ( .A(n427), .B(exp_rslt_NRM2_EW1[7]), .C(n426), .Y(
        array_comparators_GTComparator_N0) );
  CLKBUFX2TS U750 ( .A(n430), .Y(n431) );
  BUFX3TS U751 ( .A(n1070), .Y(n1059) );
  CLKBUFX2TS U752 ( .A(n430), .Y(n429) );
  BUFX3TS U753 ( .A(n1075), .Y(n1065) );
  BUFX3TS U754 ( .A(n1071), .Y(n1057) );
  CLKBUFX2TS U755 ( .A(n430), .Y(n428) );
  BUFX3TS U756 ( .A(n1067), .Y(n1050) );
  BUFX3TS U757 ( .A(n1070), .Y(n1055) );
  BUFX3TS U758 ( .A(n1047), .Y(n1052) );
  BUFX3TS U759 ( .A(n1075), .Y(n1051) );
  BUFX3TS U760 ( .A(n1071), .Y(n1054) );
  BUFX3TS U761 ( .A(n1070), .Y(n1053) );
  BUFX3TS U762 ( .A(n1063), .Y(n1068) );
  CLKBUFX2TS U763 ( .A(n430), .Y(n1076) );
  BUFX3TS U764 ( .A(n1063), .Y(n1046) );
  BUFX3TS U765 ( .A(n1047), .Y(n1048) );
  BUFX3TS U766 ( .A(n1058), .Y(n1056) );
  BUFX3TS U767 ( .A(n430), .Y(n1072) );
  BUFX3TS U768 ( .A(n1071), .Y(n1069) );
  BUFX3TS U769 ( .A(n1073), .Y(n1049) );
  BUFX3TS U770 ( .A(n1070), .Y(n1074) );
  NOR2XLTS U771 ( .A(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .Y(n432) );
  NOR2BX2TS U772 ( .AN(bit_shift_SHT2), .B(n499), .Y(n495) );
  NAND2BX2TS U773 ( .AN(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .Y(n497) );
  NAND2X1TS U774 ( .A(shift_value_SHT2_EWR[3]), .B(n989), .Y(n476) );
  NOR2XLTS U775 ( .A(shift_value_SHT2_EWR[4]), .B(n476), .Y(n436) );
  AOI22X1TS U776 ( .A0(n435), .A1(Data_array_SWR[40]), .B0(n548), .B1(
        Data_array_SWR[36]), .Y(n440) );
  NOR2XLTS U777 ( .A(shift_value_SHT2_EWR[4]), .B(n497), .Y(n437) );
  NOR2BX1TS U778 ( .AN(n499), .B(shift_value_SHT2_EWR[4]), .Y(n438) );
  AOI22X1TS U779 ( .A0(n551), .A1(Data_array_SWR[32]), .B0(n550), .B1(
        Data_array_SWR[28]), .Y(n439) );
  OAI211X1TS U780 ( .A0(n561), .A1(n984), .B0(n440), .C0(n439), .Y(n451) );
  NAND2X1TS U781 ( .A(shift_value_SHT2_EWR[4]), .B(bit_shift_SHT2), .Y(n449)
         );
  CLKBUFX3TS U782 ( .A(n441), .Y(n555) );
  AOI21X1TS U783 ( .A0(n556), .A1(n451), .B0(n555), .Y(n442) );
  OAI21X1TS U784 ( .A0(n546), .A1(n433), .B0(n442), .Y(sftr_odat_SHT2_SWR[2])
         );
  NOR2XLTS U785 ( .A(array_comparators_LTComparator_N0), .B(
        array_comparators_GTComparator_N0), .Y(n443) );
  CLKAND2X2TS U786 ( .A(n917), .B(sftr_odat_SHT2_SWR[2]), .Y(
        formatted_number_W[0]) );
  INVX2TS U787 ( .A(n449), .Y(n461) );
  AOI22X1TS U788 ( .A0(n551), .A1(Data_array_SWR[43]), .B0(n550), .B1(
        Data_array_SWR[39]), .Y(n444) );
  OAI21XLTS U789 ( .A0(n459), .A1(n1009), .B0(n444), .Y(n445) );
  AOI211X1TS U790 ( .A0(n548), .A1(Data_array_SWR[47]), .B0(n461), .C0(n445), 
        .Y(n482) );
  AOI22X1TS U791 ( .A0(n551), .A1(Data_array_SWR[42]), .B0(n550), .B1(
        Data_array_SWR[38]), .Y(n446) );
  OAI21XLTS U792 ( .A0(n459), .A1(n952), .B0(n446), .Y(n447) );
  AOI211X1TS U793 ( .A0(n548), .A1(Data_array_SWR[46]), .B0(n461), .C0(n447), 
        .Y(n483) );
  AOI22X1TS U794 ( .A0(n564), .A1(n482), .B0(n483), .B1(n556), .Y(
        sftr_odat_SHT2_SWR[12]) );
  CLKAND2X2TS U795 ( .A(n917), .B(sftr_odat_SHT2_SWR[12]), .Y(
        formatted_number_W[10]) );
  CLKBUFX3TS U796 ( .A(n450), .Y(n562) );
  AOI21X1TS U797 ( .A0(n564), .A1(n451), .B0(n562), .Y(n452) );
  OAI21X1TS U798 ( .A0(n546), .A1(n448), .B0(n452), .Y(sftr_odat_SHT2_SWR[23])
         );
  CLKAND2X2TS U799 ( .A(n917), .B(sftr_odat_SHT2_SWR[23]), .Y(
        formatted_number_W[21]) );
  OR2X1TS U800 ( .A(n478), .B(n461), .Y(n457) );
  AO22XLTS U801 ( .A0(n551), .A1(Data_array_SWR[45]), .B0(n550), .B1(
        Data_array_SWR[41]), .Y(n453) );
  AOI211X1TS U802 ( .A0(n548), .A1(Data_array_SWR[49]), .B0(n457), .C0(n453), 
        .Y(n493) );
  AOI22X1TS U803 ( .A0(n551), .A1(Data_array_SWR[40]), .B0(n550), .B1(
        Data_array_SWR[36]), .Y(n454) );
  OAI21XLTS U804 ( .A0(n1006), .A1(n459), .B0(n454), .Y(n455) );
  AOI22X1TS U805 ( .A0(n564), .A1(n493), .B0(n494), .B1(n556), .Y(
        sftr_odat_SHT2_SWR[10]) );
  CLKAND2X2TS U806 ( .A(n917), .B(sftr_odat_SHT2_SWR[10]), .Y(
        formatted_number_W[8]) );
  AO22XLTS U807 ( .A0(Data_array_SWR[44]), .A1(n551), .B0(n550), .B1(
        Data_array_SWR[40]), .Y(n456) );
  AOI211X1TS U808 ( .A0(Data_array_SWR[48]), .A1(n548), .B0(n457), .C0(n456), 
        .Y(n484) );
  AOI22X1TS U809 ( .A0(n551), .A1(Data_array_SWR[41]), .B0(n550), .B1(
        Data_array_SWR[37]), .Y(n458) );
  AOI22X1TS U810 ( .A0(n564), .A1(n484), .B0(n485), .B1(n556), .Y(
        sftr_odat_SHT2_SWR[11]) );
  CLKAND2X2TS U811 ( .A(n917), .B(sftr_odat_SHT2_SWR[11]), .Y(
        formatted_number_W[9]) );
  OAI22X1TS U812 ( .A0(n497), .A1(n950), .B0(n476), .B1(n1009), .Y(n462) );
  AOI22X1TS U813 ( .A0(n435), .A1(Data_array_SWR[46]), .B0(n548), .B1(
        Data_array_SWR[42]), .Y(n464) );
  AOI22X1TS U814 ( .A0(n551), .A1(Data_array_SWR[38]), .B0(n550), .B1(
        Data_array_SWR[34]), .Y(n463) );
  AOI21X1TS U815 ( .A0(n564), .A1(n486), .B0(n562), .Y(n465) );
  OAI21X1TS U816 ( .A0(n488), .A1(n448), .B0(n465), .Y(sftr_odat_SHT2_SWR[17])
         );
  CLKAND2X2TS U817 ( .A(n917), .B(sftr_odat_SHT2_SWR[17]), .Y(
        formatted_number_W[15]) );
  AOI22X1TS U818 ( .A0(n435), .A1(Data_array_SWR[43]), .B0(n548), .B1(
        Data_array_SWR[39]), .Y(n469) );
  AOI22X1TS U819 ( .A0(n551), .A1(Data_array_SWR[35]), .B0(n550), .B1(
        Data_array_SWR[31]), .Y(n468) );
  OAI211X1TS U820 ( .A0(n505), .A1(n984), .B0(n469), .C0(n468), .Y(n471) );
  AOI21X1TS U821 ( .A0(n564), .A1(n471), .B0(n562), .Y(n470) );
  OAI21X1TS U822 ( .A0(n491), .A1(n448), .B0(n470), .Y(sftr_odat_SHT2_SWR[20])
         );
  CLKAND2X2TS U823 ( .A(n917), .B(sftr_odat_SHT2_SWR[20]), .Y(
        formatted_number_W[18]) );
  AOI21X1TS U824 ( .A0(n556), .A1(n471), .B0(n555), .Y(n472) );
  OAI21X1TS U825 ( .A0(n491), .A1(n433), .B0(n472), .Y(sftr_odat_SHT2_SWR[5])
         );
  CLKAND2X2TS U826 ( .A(n917), .B(sftr_odat_SHT2_SWR[5]), .Y(
        formatted_number_W[3]) );
  AOI22X1TS U827 ( .A0(n551), .A1(Data_array_SWR[31]), .B0(n550), .B1(
        Data_array_SWR[27]), .Y(n474) );
  AOI22X1TS U828 ( .A0(n435), .A1(Data_array_SWR[39]), .B0(n548), .B1(
        Data_array_SWR[35]), .Y(n473) );
  OAI211X1TS U829 ( .A0(n488), .A1(n984), .B0(n474), .C0(n473), .Y(n527) );
  AOI21X1TS U830 ( .A0(n564), .A1(n527), .B0(n562), .Y(n475) );
  OAI21X1TS U831 ( .A0(n529), .A1(n448), .B0(n475), .Y(sftr_odat_SHT2_SWR[24])
         );
  CLKAND2X2TS U832 ( .A(n917), .B(sftr_odat_SHT2_SWR[24]), .Y(
        formatted_number_W[22]) );
  OAI22X1TS U833 ( .A0(n497), .A1(n1011), .B0(n476), .B1(n952), .Y(n477) );
  AOI22X1TS U834 ( .A0(n551), .A1(Data_array_SWR[39]), .B0(n548), .B1(
        Data_array_SWR[43]), .Y(n480) );
  AOI22X1TS U835 ( .A0(n550), .A1(Data_array_SWR[35]), .B0(n435), .B1(
        Data_array_SWR[47]), .Y(n479) );
  AOI21X1TS U836 ( .A0(n564), .A1(n506), .B0(n562), .Y(n481) );
  OAI21X1TS U837 ( .A0(n525), .A1(n448), .B0(n481), .Y(sftr_odat_SHT2_SWR[16])
         );
  CLKAND2X2TS U838 ( .A(n917), .B(sftr_odat_SHT2_SWR[16]), .Y(
        formatted_number_W[14]) );
  AOI22X1TS U839 ( .A0(n564), .A1(n483), .B0(n482), .B1(n556), .Y(
        sftr_odat_SHT2_SWR[13]) );
  CLKAND2X2TS U840 ( .A(n917), .B(sftr_odat_SHT2_SWR[13]), .Y(
        formatted_number_W[11]) );
  AOI22X1TS U841 ( .A0(n564), .A1(n485), .B0(n484), .B1(n556), .Y(
        sftr_odat_SHT2_SWR[14]) );
  CLKAND2X2TS U842 ( .A(n917), .B(sftr_odat_SHT2_SWR[14]), .Y(
        formatted_number_W[12]) );
  AOI21X1TS U843 ( .A0(n556), .A1(n486), .B0(n555), .Y(n487) );
  OAI21X1TS U844 ( .A0(n488), .A1(n433), .B0(n487), .Y(sftr_odat_SHT2_SWR[8])
         );
  CLKAND2X2TS U845 ( .A(n917), .B(sftr_odat_SHT2_SWR[8]), .Y(
        formatted_number_W[6]) );
  AOI22X1TS U846 ( .A0(n435), .A1(Data_array_SWR[42]), .B0(n548), .B1(
        Data_array_SWR[38]), .Y(n490) );
  AOI22X1TS U847 ( .A0(n551), .A1(Data_array_SWR[34]), .B0(n550), .B1(
        Data_array_SWR[30]), .Y(n489) );
  OAI211X1TS U848 ( .A0(n491), .A1(n984), .B0(n490), .C0(n489), .Y(n503) );
  AOI21X1TS U849 ( .A0(n556), .A1(n503), .B0(n555), .Y(n492) );
  OAI21X1TS U850 ( .A0(n505), .A1(n433), .B0(n492), .Y(sftr_odat_SHT2_SWR[4])
         );
  CLKAND2X2TS U851 ( .A(n917), .B(sftr_odat_SHT2_SWR[4]), .Y(
        formatted_number_W[2]) );
  AOI22X1TS U852 ( .A0(n564), .A1(n494), .B0(n493), .B1(n556), .Y(
        sftr_odat_SHT2_SWR[15]) );
  CLKAND2X2TS U853 ( .A(n917), .B(sftr_odat_SHT2_SWR[15]), .Y(
        formatted_number_W[13]) );
  AOI22X1TS U854 ( .A0(n435), .A1(Data_array_SWR[41]), .B0(n548), .B1(
        Data_array_SWR[37]), .Y(n501) );
  AOI22X1TS U855 ( .A0(n551), .A1(Data_array_SWR[33]), .B0(n550), .B1(
        Data_array_SWR[29]), .Y(n500) );
  OAI211X1TS U856 ( .A0(n567), .A1(n984), .B0(n501), .C0(n500), .Y(n508) );
  AOI21X1TS U857 ( .A0(n564), .A1(n508), .B0(n562), .Y(n502) );
  OAI21X1TS U858 ( .A0(n554), .A1(n448), .B0(n502), .Y(sftr_odat_SHT2_SWR[22])
         );
  CLKAND2X2TS U859 ( .A(n917), .B(sftr_odat_SHT2_SWR[22]), .Y(
        formatted_number_W[20]) );
  AOI21X1TS U860 ( .A0(n564), .A1(n503), .B0(n562), .Y(n504) );
  OAI21X1TS U861 ( .A0(n505), .A1(n448), .B0(n504), .Y(sftr_odat_SHT2_SWR[21])
         );
  CLKAND2X2TS U862 ( .A(n917), .B(sftr_odat_SHT2_SWR[21]), .Y(
        formatted_number_W[19]) );
  AOI21X1TS U863 ( .A0(n556), .A1(n506), .B0(n555), .Y(n507) );
  OAI21X1TS U864 ( .A0(n525), .A1(n433), .B0(n507), .Y(sftr_odat_SHT2_SWR[9])
         );
  CLKAND2X2TS U865 ( .A(n917), .B(sftr_odat_SHT2_SWR[9]), .Y(
        formatted_number_W[7]) );
  AOI21X1TS U866 ( .A0(n556), .A1(n508), .B0(n555), .Y(n509) );
  OAI21X1TS U867 ( .A0(n433), .A1(n554), .B0(n509), .Y(sftr_odat_SHT2_SWR[3])
         );
  CLKAND2X2TS U868 ( .A(n917), .B(sftr_odat_SHT2_SWR[3]), .Y(
        formatted_number_W[1]) );
  OR2X2TS U869 ( .A(ADD_OVRFLW_NRM), .B(n935), .Y(n595) );
  INVX4TS U870 ( .A(n595), .Y(n1077) );
  NAND2X1TS U871 ( .A(DmP_EXP_EWSW[23]), .B(n397), .Y(n510) );
  OAI21XLTS U872 ( .A0(DmP_EXP_EWSW[23]), .A1(n397), .B0(n510), .Y(
        Shift_amount_EXP_EW[0]) );
  NAND2X1TS U873 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n922), .Y(n919)
         );
  NAND2X1TS U874 ( .A(n953), .B(inst_FSM_INPUT_ENABLE_state_reg[0]), .Y(n918)
         );
  OAI21XLTS U875 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(n919), .B0(
        n918), .Y(n388) );
  INVX2TS U876 ( .A(intadd_430_SUM_0_), .Y(Shift_amount_EXP_EW[1]) );
  INVX2TS U877 ( .A(intadd_430_SUM_1_), .Y(Shift_amount_EXP_EW[2]) );
  INVX2TS U878 ( .A(intadd_430_SUM_2_), .Y(Shift_amount_EXP_EW[3]) );
  INVX2TS U879 ( .A(n510), .Y(intadd_430_CI) );
  OR2X1TS U880 ( .A(N60), .B(N59), .Y(n848) );
  AOI22X1TS U881 ( .A0(n858), .A1(n514), .B0(n847), .B1(n893), .Y(n512) );
  NAND2X1TS U882 ( .A(DmP_mant_SFG_SWR[3]), .B(n923), .Y(n513) );
  OAI21XLTS U883 ( .A0(DmP_mant_SFG_SWR[3]), .A1(n923), .B0(n513), .Y(n511) );
  XOR2XLTS U884 ( .A(n512), .B(n511), .Y(Raw_mant_SGF[3]) );
  NOR2X1TS U885 ( .A(DmP_mant_SFG_SWR[4]), .B(n963), .Y(n517) );
  AOI22X1TS U886 ( .A0(DMP_SFG[1]), .A1(n956), .B0(n514), .B1(n513), .Y(n518)
         );
  AOI22X1TS U887 ( .A0(n896), .A1(n518), .B0(n520), .B1(n893), .Y(n516) );
  CLKAND2X2TS U888 ( .A(DmP_mant_SFG_SWR[4]), .B(n963), .Y(n519) );
  OAI21XLTS U889 ( .A0(n517), .A1(n519), .B0(n516), .Y(n515) );
  OAI31X1TS U890 ( .A0(n517), .A1(n516), .A2(n519), .B0(n515), .Y(
        Raw_mant_SGF[4]) );
  OAI22X1TS U891 ( .A0(DmP_mant_SFG_SWR[4]), .A1(n963), .B0(n519), .B1(n518), 
        .Y(n533) );
  AOI22X1TS U892 ( .A0(n858), .A1(n533), .B0(n535), .B1(n1078), .Y(n522) );
  NAND2X1TS U893 ( .A(DmP_mant_SFG_SWR[5]), .B(n957), .Y(n534) );
  OAI21XLTS U894 ( .A0(DmP_mant_SFG_SWR[5]), .A1(n957), .B0(n534), .Y(n521) );
  XOR2XLTS U895 ( .A(n522), .B(n521), .Y(Raw_mant_SGF[5]) );
  AOI22X1TS U896 ( .A0(n551), .A1(Data_array_SWR[30]), .B0(n548), .B1(
        Data_array_SWR[34]), .Y(n524) );
  AOI22X1TS U897 ( .A0(n550), .A1(Data_array_SWR[26]), .B0(n435), .B1(
        Data_array_SWR[38]), .Y(n523) );
  OAI211X1TS U898 ( .A0(n525), .A1(n984), .B0(n524), .C0(n523), .Y(n530) );
  AOI21X1TS U899 ( .A0(n564), .A1(n530), .B0(n562), .Y(n526) );
  OAI21XLTS U900 ( .A0(n532), .A1(n448), .B0(n526), .Y(sftr_odat_SHT2_SWR[25])
         );
  AOI21X1TS U901 ( .A0(n556), .A1(n527), .B0(n555), .Y(n528) );
  OAI21XLTS U902 ( .A0(n433), .A1(n529), .B0(n528), .Y(sftr_odat_SHT2_SWR[1])
         );
  AOI21X1TS U903 ( .A0(n556), .A1(n530), .B0(n555), .Y(n531) );
  OAI21XLTS U904 ( .A0(n433), .A1(n532), .B0(n531), .Y(sftr_odat_SHT2_SWR[0])
         );
  NOR2X1TS U905 ( .A(DmP_mant_SFG_SWR[6]), .B(n965), .Y(n538) );
  AOI22X1TS U906 ( .A0(DMP_SFG[3]), .A1(n924), .B0(n534), .B1(n533), .Y(n539)
         );
  AOI222X4TS U907 ( .A0(n535), .A1(n957), .B0(n535), .B1(n924), .C0(n957), 
        .C1(n924), .Y(n541) );
  AOI22X1TS U908 ( .A0(n896), .A1(n539), .B0(n541), .B1(n893), .Y(n537) );
  CLKAND2X2TS U909 ( .A(DmP_mant_SFG_SWR[6]), .B(n965), .Y(n540) );
  OAI31X1TS U910 ( .A0(n538), .A1(n537), .A2(n540), .B0(n536), .Y(
        Raw_mant_SGF[6]) );
  OAI22X1TS U911 ( .A0(DmP_mant_SFG_SWR[6]), .A1(n965), .B0(n540), .B1(n539), 
        .Y(n570) );
  AOI22X1TS U912 ( .A0(n858), .A1(n570), .B0(n572), .B1(n893), .Y(n543) );
  NAND2X1TS U913 ( .A(DmP_mant_SFG_SWR[7]), .B(n925), .Y(n571) );
  OAI21XLTS U914 ( .A0(DmP_mant_SFG_SWR[7]), .A1(n925), .B0(n571), .Y(n542) );
  XOR2XLTS U915 ( .A(n543), .B(n542), .Y(Raw_mant_SGF[7]) );
  OR2X1TS U916 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[3]), .Y(formatted_number_W[26]) );
  OR2X1TS U917 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[1]), .Y(formatted_number_W[24]) );
  OR2X1TS U918 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[0]), .Y(formatted_number_W[23]) );
  OR2X1TS U919 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[6]), .Y(formatted_number_W[29]) );
  OR2X1TS U920 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[5]), .Y(formatted_number_W[28]) );
  OR2X1TS U921 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[2]), .Y(formatted_number_W[25]) );
  AOI22X1TS U922 ( .A0(n435), .A1(Data_array_SWR[45]), .B0(n548), .B1(
        Data_array_SWR[41]), .Y(n545) );
  AOI22X1TS U923 ( .A0(n551), .A1(Data_array_SWR[37]), .B0(n550), .B1(
        Data_array_SWR[33]), .Y(n544) );
  AOI21X1TS U924 ( .A0(n556), .A1(n559), .B0(n555), .Y(n547) );
  OAI21X1TS U925 ( .A0(n561), .A1(n433), .B0(n547), .Y(sftr_odat_SHT2_SWR[7])
         );
  AOI22X1TS U926 ( .A0(Data_array_SWR[44]), .A1(n435), .B0(Data_array_SWR[40]), 
        .B1(n548), .Y(n553) );
  AOI22X1TS U927 ( .A0(n551), .A1(Data_array_SWR[36]), .B0(Data_array_SWR[32]), 
        .B1(n550), .Y(n552) );
  OAI211X1TS U928 ( .A0(n984), .A1(n554), .B0(n553), .C0(n552), .Y(n563) );
  AOI21X1TS U929 ( .A0(n556), .A1(n563), .B0(n555), .Y(n557) );
  OAI21X1TS U930 ( .A0(n567), .A1(n433), .B0(n557), .Y(sftr_odat_SHT2_SWR[6])
         );
  AOI21X1TS U931 ( .A0(n564), .A1(n559), .B0(n562), .Y(n560) );
  OAI21X1TS U932 ( .A0(n561), .A1(n448), .B0(n560), .Y(sftr_odat_SHT2_SWR[18])
         );
  AOI21X1TS U933 ( .A0(n564), .A1(n563), .B0(n562), .Y(n565) );
  OAI21X1TS U934 ( .A0(n567), .A1(n448), .B0(n565), .Y(sftr_odat_SHT2_SWR[19])
         );
  NOR2BX1TS U935 ( .AN(LZD_output_NRM2_EW[3]), .B(ADD_OVRFLW_NRM2), .Y(n568)
         );
  XOR2X1TS U936 ( .A(n933), .B(n568), .Y(DP_OP_15J182_122_6956_n15) );
  NOR2BX1TS U937 ( .AN(LZD_output_NRM2_EW[4]), .B(ADD_OVRFLW_NRM2), .Y(n569)
         );
  XOR2X1TS U938 ( .A(n933), .B(n569), .Y(DP_OP_15J182_122_6956_n14) );
  NOR2X1TS U939 ( .A(DmP_mant_SFG_SWR[8]), .B(n966), .Y(n575) );
  AOI22X1TS U940 ( .A0(DMP_SFG[5]), .A1(n958), .B0(n571), .B1(n570), .Y(n577)
         );
  AOI222X4TS U941 ( .A0(n572), .A1(n925), .B0(n572), .B1(n958), .C0(n925), 
        .C1(n958), .Y(n579) );
  AOI22X1TS U942 ( .A0(n896), .A1(n577), .B0(n579), .B1(n893), .Y(n574) );
  CLKAND2X2TS U943 ( .A(DmP_mant_SFG_SWR[8]), .B(n966), .Y(n578) );
  OAI21XLTS U944 ( .A0(n575), .A1(n578), .B0(n574), .Y(n573) );
  OAI31X1TS U945 ( .A0(n575), .A1(n574), .A2(n578), .B0(n573), .Y(
        Raw_mant_SGF[8]) );
  NOR2X1TS U946 ( .A(DmP_mant_SFG_SWR[10]), .B(n967), .Y(n582) );
  NAND2X1TS U947 ( .A(DmP_mant_SFG_SWR[9]), .B(n926), .Y(n853) );
  OAI22X1TS U948 ( .A0(DmP_mant_SFG_SWR[8]), .A1(n966), .B0(n578), .B1(n577), 
        .Y(n852) );
  AOI22X1TS U949 ( .A0(DMP_SFG[7]), .A1(n959), .B0(n853), .B1(n852), .Y(n587)
         );
  AOI222X4TS U950 ( .A0(n851), .A1(n926), .B0(n851), .B1(n959), .C0(n926), 
        .C1(n959), .Y(n589) );
  AOI22X1TS U951 ( .A0(n896), .A1(n587), .B0(n589), .B1(n893), .Y(n581) );
  CLKAND2X2TS U952 ( .A(DmP_mant_SFG_SWR[10]), .B(n967), .Y(n588) );
  OAI21XLTS U953 ( .A0(n582), .A1(n588), .B0(n581), .Y(n580) );
  OAI31X1TS U954 ( .A0(n582), .A1(n581), .A2(n588), .B0(n580), .Y(
        Raw_mant_SGF[10]) );
  AOI221X4TS U955 ( .A0(Raw_mant_NRM_SWR[0]), .A1(n610), .B0(
        Raw_mant_NRM_SWR[25]), .B1(n595), .C0(n616), .Y(n915) );
  NAND2X1TS U956 ( .A(n597), .B(n585), .Y(n583) );
  OAI21XLTS U957 ( .A0(n915), .A1(n914), .B0(n612), .Y(Data_array_SWR[25]) );
  INVX2TS U958 ( .A(n585), .Y(n596) );
  INVX2TS U959 ( .A(n675), .Y(n584) );
  BUFX4TS U960 ( .A(n584), .Y(n916) );
  AOI22X1TS U961 ( .A0(n610), .A1(Raw_mant_NRM_SWR[24]), .B0(
        Raw_mant_NRM_SWR[1]), .B1(n412), .Y(n637) );
  INVX2TS U962 ( .A(n629), .Y(n635) );
  AOI22X1TS U963 ( .A0(n610), .A1(Raw_mant_NRM_SWR[25]), .B0(n645), .B1(n635), 
        .Y(n586) );
  OAI211XLTS U964 ( .A0(n633), .A1(n916), .B0(n637), .C0(n586), .Y(
        Data_array_SWR[0]) );
  NOR2X1TS U965 ( .A(DmP_mant_SFG_SWR[12]), .B(n969), .Y(n592) );
  NAND2X1TS U966 ( .A(DmP_mant_SFG_SWR[11]), .B(n927), .Y(n859) );
  OAI22X1TS U967 ( .A0(DmP_mant_SFG_SWR[10]), .A1(n967), .B0(n588), .B1(n587), 
        .Y(n857) );
  AOI22X1TS U968 ( .A0(DMP_SFG[9]), .A1(n960), .B0(n859), .B1(n857), .Y(n678)
         );
  AOI222X4TS U969 ( .A0(n856), .A1(n927), .B0(n856), .B1(n960), .C0(n927), 
        .C1(n960), .Y(n680) );
  AOI22X1TS U970 ( .A0(n896), .A1(n678), .B0(n680), .B1(n893), .Y(n591) );
  CLKAND2X2TS U971 ( .A(DmP_mant_SFG_SWR[12]), .B(n969), .Y(n679) );
  OAI21XLTS U972 ( .A0(n592), .A1(n679), .B0(n591), .Y(n590) );
  OAI31X1TS U973 ( .A0(n592), .A1(n591), .A2(n679), .B0(n590), .Y(
        Raw_mant_SGF[12]) );
  INVX2TS U974 ( .A(n914), .Y(n614) );
  AOI22X1TS U975 ( .A0(n412), .A1(Raw_mant_NRM_SWR[22]), .B0(
        DmP_mant_SHT1_SW[20]), .B1(n616), .Y(n594) );
  AOI222X4TS U976 ( .A0(n616), .A1(DmP_mant_SHT1_SW[22]), .B0(
        Raw_mant_NRM_SWR[24]), .B1(n412), .C0(Raw_mant_NRM_SWR[1]), .C1(n1077), 
        .Y(n911) );
  AOI222X4TS U977 ( .A0(n616), .A1(DmP_mant_SHT1_SW[21]), .B0(
        Raw_mant_NRM_SWR[23]), .B1(n412), .C0(Raw_mant_NRM_SWR[2]), .C1(n1077), 
        .Y(n913) );
  NAND2X1TS U978 ( .A(n597), .B(n596), .Y(n598) );
  BUFX4TS U979 ( .A(n598), .Y(n912) );
  OAI22X1TS U980 ( .A0(n911), .A1(n916), .B0(n913), .B1(n912), .Y(n599) );
  AOI21X1TS U981 ( .A0(n614), .A1(n674), .B0(n599), .Y(n600) );
  AOI22X1TS U982 ( .A0(n412), .A1(Raw_mant_NRM_SWR[10]), .B0(
        DmP_mant_SHT1_SW[8]), .B1(n616), .Y(n601) );
  AOI222X4TS U983 ( .A0(n616), .A1(DmP_mant_SHT1_SW[11]), .B0(n1077), .B1(
        Raw_mant_NRM_SWR[12]), .C0(Raw_mant_NRM_SWR[13]), .C1(n412), .Y(n659)
         );
  AOI222X4TS U984 ( .A0(n616), .A1(DmP_mant_SHT1_SW[10]), .B0(
        Raw_mant_NRM_SWR[12]), .B1(n412), .C0(Raw_mant_NRM_SWR[13]), .C1(n1077), .Y(n664) );
  OAI22X1TS U985 ( .A0(n659), .A1(n593), .B0(n664), .B1(n916), .Y(n602) );
  AOI21X1TS U986 ( .A0(n614), .A1(n668), .B0(n602), .Y(n603) );
  OAI21XLTS U987 ( .A0(n666), .A1(n912), .B0(n603), .Y(Data_array_SWR[10]) );
  AOI222X4TS U988 ( .A0(n616), .A1(DmP_mant_SHT1_SW[13]), .B0(n610), .B1(
        Raw_mant_NRM_SWR[10]), .C0(Raw_mant_NRM_SWR[15]), .C1(n412), .Y(n660)
         );
  AOI22X1TS U989 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n610), .B0(
        DmP_mant_SHT1_SW[12]), .B1(n616), .Y(n604) );
  AOI222X4TS U990 ( .A0(n616), .A1(DmP_mant_SHT1_SW[15]), .B0(n610), .B1(
        Raw_mant_NRM_SWR[8]), .C0(Raw_mant_NRM_SWR[17]), .C1(n412), .Y(n653)
         );
  AOI222X4TS U991 ( .A0(n616), .A1(DmP_mant_SHT1_SW[14]), .B0(n610), .B1(
        Raw_mant_NRM_SWR[9]), .C0(Raw_mant_NRM_SWR[16]), .C1(n412), .Y(n658)
         );
  OAI22X1TS U992 ( .A0(n653), .A1(n593), .B0(n658), .B1(n916), .Y(n605) );
  AOI21X1TS U993 ( .A0(n614), .A1(n662), .B0(n605), .Y(n606) );
  OAI21XLTS U994 ( .A0(n660), .A1(n912), .B0(n606), .Y(Data_array_SWR[14]) );
  AOI222X4TS U995 ( .A0(n616), .A1(DmP_mant_SHT1_SW[17]), .B0(
        Raw_mant_NRM_SWR[19]), .B1(n412), .C0(Raw_mant_NRM_SWR[6]), .C1(n1077), 
        .Y(n654) );
  AOI22X1TS U996 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n610), .B0(
        DmP_mant_SHT1_SW[16]), .B1(n616), .Y(n607) );
  AOI222X4TS U997 ( .A0(n616), .A1(DmP_mant_SHT1_SW[19]), .B0(
        Raw_mant_NRM_SWR[21]), .B1(n412), .C0(Raw_mant_NRM_SWR[4]), .C1(n1077), 
        .Y(n671) );
  AOI222X4TS U998 ( .A0(n616), .A1(DmP_mant_SHT1_SW[18]), .B0(
        Raw_mant_NRM_SWR[20]), .B1(n412), .C0(Raw_mant_NRM_SWR[5]), .C1(n1077), 
        .Y(n677) );
  OAI22X1TS U999 ( .A0(n671), .A1(n593), .B0(n677), .B1(n916), .Y(n608) );
  AOI21X1TS U1000 ( .A0(n614), .A1(n656), .B0(n608), .Y(n609) );
  OAI21XLTS U1001 ( .A0(n654), .A1(n912), .B0(n609), .Y(Data_array_SWR[18]) );
  AOI222X4TS U1002 ( .A0(n616), .A1(DmP_mant_SHT1_SW[5]), .B0(n610), .B1(
        Raw_mant_NRM_SWR[18]), .C0(Raw_mant_NRM_SWR[7]), .C1(n412), .Y(n648)
         );
  AOI22X1TS U1003 ( .A0(Raw_mant_NRM_SWR[19]), .A1(n610), .B0(
        DmP_mant_SHT1_SW[4]), .B1(n616), .Y(n611) );
  AOI222X4TS U1004 ( .A0(n616), .A1(DmP_mant_SHT1_SW[7]), .B0(
        Raw_mant_NRM_SWR[9]), .B1(n412), .C0(Raw_mant_NRM_SWR[16]), .C1(n1077), 
        .Y(n665) );
  AOI222X4TS U1005 ( .A0(n616), .A1(DmP_mant_SHT1_SW[6]), .B0(
        Raw_mant_NRM_SWR[8]), .B1(n412), .C0(Raw_mant_NRM_SWR[17]), .C1(n1077), 
        .Y(n670) );
  OAI22X1TS U1006 ( .A0(n665), .A1(n593), .B0(n670), .B1(n916), .Y(n613) );
  AOI21X1TS U1007 ( .A0(n614), .A1(n650), .B0(n613), .Y(n615) );
  INVX2TS U1008 ( .A(n912), .Y(n631) );
  AOI222X4TS U1009 ( .A0(n616), .A1(DmP_mant_SHT1_SW[3]), .B0(n1077), .B1(
        Raw_mant_NRM_SWR[20]), .C0(Raw_mant_NRM_SWR[5]), .C1(n412), .Y(n647)
         );
  AOI222X4TS U1010 ( .A0(n616), .A1(DmP_mant_SHT1_SW[2]), .B0(n1077), .B1(
        Raw_mant_NRM_SWR[21]), .C0(Raw_mant_NRM_SWR[4]), .C1(n412), .Y(n652)
         );
  OAI22X1TS U1011 ( .A0(n647), .A1(n593), .B0(n652), .B1(n916), .Y(n617) );
  AOI21X1TS U1012 ( .A0(n631), .A1(n635), .B0(n617), .Y(n618) );
  OAI21XLTS U1013 ( .A0(n633), .A1(n914), .B0(n618), .Y(Data_array_SWR[2]) );
  OAI22X1TS U1014 ( .A0(n658), .A1(n593), .B0(n660), .B1(n916), .Y(n619) );
  AOI21X1TS U1015 ( .A0(n631), .A1(n662), .B0(n619), .Y(n620) );
  OAI21XLTS U1016 ( .A0(n659), .A1(n914), .B0(n620), .Y(Data_array_SWR[13]) );
  OAI22X1TS U1017 ( .A0(n670), .A1(n593), .B0(n648), .B1(n916), .Y(n621) );
  AOI21X1TS U1018 ( .A0(n631), .A1(n650), .B0(n621), .Y(n622) );
  OAI21XLTS U1019 ( .A0(n647), .A1(n914), .B0(n622), .Y(Data_array_SWR[5]) );
  OAI22X1TS U1020 ( .A0(n677), .A1(n593), .B0(n654), .B1(n916), .Y(n623) );
  AOI21X1TS U1021 ( .A0(n631), .A1(n656), .B0(n623), .Y(n624) );
  OAI21XLTS U1022 ( .A0(n653), .A1(n914), .B0(n624), .Y(Data_array_SWR[17]) );
  OAI22X1TS U1023 ( .A0(n664), .A1(n593), .B0(n666), .B1(n916), .Y(n625) );
  AOI21X1TS U1024 ( .A0(n631), .A1(n668), .B0(n625), .Y(n626) );
  OAI21XLTS U1025 ( .A0(n665), .A1(n914), .B0(n626), .Y(Data_array_SWR[9]) );
  OAI22X1TS U1026 ( .A0(n647), .A1(n916), .B0(n652), .B1(n912), .Y(n627) );
  AOI21X1TS U1027 ( .A0(n645), .A1(n650), .B0(n627), .Y(n628) );
  OAI21XLTS U1028 ( .A0(n629), .A1(n914), .B0(n628), .Y(Data_array_SWR[3]) );
  OAI22X1TS U1029 ( .A0(n911), .A1(n593), .B0(n913), .B1(n916), .Y(n630) );
  AOI21X1TS U1030 ( .A0(n631), .A1(n674), .B0(n630), .Y(n632) );
  OAI22X1TS U1031 ( .A0(n652), .A1(n593), .B0(n633), .B1(n912), .Y(n634) );
  AOI21X1TS U1032 ( .A0(n675), .A1(n635), .B0(n634), .Y(n636) );
  OAI21XLTS U1033 ( .A0(n637), .A1(n914), .B0(n636), .Y(Data_array_SWR[1]) );
  OAI22X1TS U1034 ( .A0(n653), .A1(n916), .B0(n658), .B1(n912), .Y(n638) );
  AOI21X1TS U1035 ( .A0(n645), .A1(n656), .B0(n638), .Y(n639) );
  OAI21XLTS U1036 ( .A0(n660), .A1(n914), .B0(n639), .Y(Data_array_SWR[15]) );
  OAI22X1TS U1037 ( .A0(n671), .A1(n916), .B0(n677), .B1(n912), .Y(n640) );
  AOI21X1TS U1038 ( .A0(n645), .A1(n674), .B0(n640), .Y(n641) );
  OAI21XLTS U1039 ( .A0(n654), .A1(n914), .B0(n641), .Y(Data_array_SWR[19]) );
  OAI22X1TS U1040 ( .A0(n659), .A1(n916), .B0(n664), .B1(n912), .Y(n642) );
  AOI21X1TS U1041 ( .A0(n645), .A1(n662), .B0(n642), .Y(n643) );
  OAI21XLTS U1042 ( .A0(n666), .A1(n914), .B0(n643), .Y(Data_array_SWR[11]) );
  OAI22X1TS U1043 ( .A0(n665), .A1(n916), .B0(n670), .B1(n912), .Y(n644) );
  AOI21X1TS U1044 ( .A0(n645), .A1(n668), .B0(n644), .Y(n646) );
  OAI21XLTS U1045 ( .A0(n648), .A1(n914), .B0(n646), .Y(Data_array_SWR[7]) );
  OAI22X1TS U1046 ( .A0(n648), .A1(n593), .B0(n647), .B1(n912), .Y(n649) );
  AOI21X1TS U1047 ( .A0(n675), .A1(n650), .B0(n649), .Y(n651) );
  OAI21XLTS U1048 ( .A0(n652), .A1(n914), .B0(n651), .Y(Data_array_SWR[4]) );
  OAI22X1TS U1049 ( .A0(n654), .A1(n593), .B0(n653), .B1(n912), .Y(n655) );
  AOI21X1TS U1050 ( .A0(n675), .A1(n656), .B0(n655), .Y(n657) );
  OAI21XLTS U1051 ( .A0(n658), .A1(n914), .B0(n657), .Y(Data_array_SWR[16]) );
  OAI22X1TS U1052 ( .A0(n660), .A1(n593), .B0(n659), .B1(n912), .Y(n661) );
  AOI21X1TS U1053 ( .A0(n675), .A1(n662), .B0(n661), .Y(n663) );
  OAI21XLTS U1054 ( .A0(n664), .A1(n914), .B0(n663), .Y(Data_array_SWR[12]) );
  OAI22X1TS U1055 ( .A0(n666), .A1(n593), .B0(n665), .B1(n912), .Y(n667) );
  AOI21X1TS U1056 ( .A0(n675), .A1(n668), .B0(n667), .Y(n669) );
  OAI21XLTS U1057 ( .A0(n670), .A1(n914), .B0(n669), .Y(Data_array_SWR[8]) );
  OAI22X1TS U1058 ( .A0(n913), .A1(n593), .B0(n671), .B1(n912), .Y(n673) );
  AOI21X1TS U1059 ( .A0(n675), .A1(n674), .B0(n673), .Y(n676) );
  OAI21XLTS U1060 ( .A0(n677), .A1(n914), .B0(n676), .Y(Data_array_SWR[20]) );
  NOR2X1TS U1061 ( .A(DmP_mant_SFG_SWR[14]), .B(n974), .Y(n683) );
  NAND2X1TS U1062 ( .A(DmP_mant_SFG_SWR[13]), .B(n928), .Y(n864) );
  OAI22X1TS U1063 ( .A0(DmP_mant_SFG_SWR[12]), .A1(n969), .B0(n679), .B1(n678), 
        .Y(n863) );
  AOI22X1TS U1064 ( .A0(DMP_SFG[11]), .A1(n961), .B0(n864), .B1(n863), .Y(n684) );
  AOI222X4TS U1065 ( .A0(n862), .A1(n928), .B0(n862), .B1(n961), .C0(n928), 
        .C1(n961), .Y(n686) );
  AOI22X1TS U1066 ( .A0(n896), .A1(n684), .B0(n686), .B1(n1078), .Y(n682) );
  CLKAND2X2TS U1067 ( .A(DmP_mant_SFG_SWR[14]), .B(n974), .Y(n685) );
  OAI21XLTS U1068 ( .A0(n683), .A1(n685), .B0(n682), .Y(n681) );
  OAI31X1TS U1069 ( .A0(n683), .A1(n682), .A2(n685), .B0(n681), .Y(
        Raw_mant_SGF[14]) );
  NOR2X1TS U1070 ( .A(DmP_mant_SFG_SWR[16]), .B(n977), .Y(n689) );
  NAND2X1TS U1071 ( .A(DmP_mant_SFG_SWR[15]), .B(n929), .Y(n869) );
  OAI22X1TS U1072 ( .A0(DmP_mant_SFG_SWR[14]), .A1(n974), .B0(n685), .B1(n684), 
        .Y(n868) );
  AOI22X1TS U1073 ( .A0(DMP_SFG[13]), .A1(n964), .B0(n869), .B1(n868), .Y(n690) );
  AOI222X4TS U1074 ( .A0(n867), .A1(n929), .B0(n867), .B1(n964), .C0(n929), 
        .C1(n964), .Y(n692) );
  AOI22X1TS U1075 ( .A0(n394), .A1(n690), .B0(n692), .B1(n893), .Y(n688) );
  CLKAND2X2TS U1076 ( .A(DmP_mant_SFG_SWR[16]), .B(n977), .Y(n691) );
  OAI21XLTS U1077 ( .A0(n689), .A1(n691), .B0(n688), .Y(n687) );
  OAI31X1TS U1078 ( .A0(n689), .A1(n688), .A2(n691), .B0(n687), .Y(
        Raw_mant_SGF[16]) );
  NOR2X1TS U1079 ( .A(DmP_mant_SFG_SWR[18]), .B(n982), .Y(n695) );
  NAND2X1TS U1080 ( .A(DmP_mant_SFG_SWR[17]), .B(n930), .Y(n874) );
  OAI22X1TS U1081 ( .A0(DmP_mant_SFG_SWR[16]), .A1(n977), .B0(n691), .B1(n690), 
        .Y(n873) );
  AOI22X1TS U1082 ( .A0(DMP_SFG[15]), .A1(n968), .B0(n874), .B1(n873), .Y(n696) );
  AOI222X4TS U1083 ( .A0(n872), .A1(n930), .B0(n872), .B1(n968), .C0(n930), 
        .C1(n968), .Y(n698) );
  AOI22X1TS U1084 ( .A0(n896), .A1(n696), .B0(n698), .B1(n893), .Y(n694) );
  CLKAND2X2TS U1085 ( .A(DmP_mant_SFG_SWR[18]), .B(n982), .Y(n697) );
  OAI21XLTS U1086 ( .A0(n695), .A1(n697), .B0(n694), .Y(n693) );
  OAI31X1TS U1087 ( .A0(n695), .A1(n694), .A2(n697), .B0(n693), .Y(
        Raw_mant_SGF[18]) );
  NOR2X1TS U1088 ( .A(DmP_mant_SFG_SWR[20]), .B(n988), .Y(n701) );
  NAND2X1TS U1089 ( .A(DmP_mant_SFG_SWR[19]), .B(n931), .Y(n879) );
  OAI22X1TS U1090 ( .A0(DmP_mant_SFG_SWR[18]), .A1(n982), .B0(n697), .B1(n696), 
        .Y(n878) );
  AOI22X1TS U1091 ( .A0(DMP_SFG[17]), .A1(n970), .B0(n879), .B1(n878), .Y(n702) );
  AOI22X1TS U1092 ( .A0(n896), .A1(n702), .B0(n704), .B1(n893), .Y(n700) );
  CLKAND2X2TS U1093 ( .A(DmP_mant_SFG_SWR[20]), .B(n988), .Y(n703) );
  OAI21XLTS U1094 ( .A0(n701), .A1(n703), .B0(n700), .Y(n699) );
  OAI31X1TS U1095 ( .A0(n701), .A1(n700), .A2(n703), .B0(n699), .Y(
        Raw_mant_SGF[20]) );
  NOR2X1TS U1096 ( .A(DmP_mant_SFG_SWR[22]), .B(n1003), .Y(n707) );
  NAND2X1TS U1097 ( .A(DmP_mant_SFG_SWR[21]), .B(n973), .Y(n884) );
  OAI22X1TS U1098 ( .A0(DmP_mant_SFG_SWR[20]), .A1(n988), .B0(n703), .B1(n702), 
        .Y(n883) );
  AOI22X1TS U1099 ( .A0(DMP_SFG[19]), .A1(n932), .B0(n884), .B1(n883), .Y(n734) );
  AOI22X1TS U1100 ( .A0(n896), .A1(n734), .B0(n736), .B1(n893), .Y(n706) );
  CLKAND2X2TS U1101 ( .A(DmP_mant_SFG_SWR[22]), .B(n1003), .Y(n735) );
  OAI21XLTS U1102 ( .A0(n707), .A1(n735), .B0(n706), .Y(n705) );
  OAI31X1TS U1103 ( .A0(n707), .A1(n706), .A2(n735), .B0(n705), .Y(
        Raw_mant_SGF[22]) );
  INVX2TS U1104 ( .A(n708), .Y(n710) );
  NOR2XLTS U1105 ( .A(Raw_mant_NRM_SWR[13]), .B(Raw_mant_NRM_SWR[11]), .Y(n709) );
  OAI22X1TS U1106 ( .A0(n711), .A1(n710), .B0(n709), .B1(n723), .Y(n712) );
  AOI21X1TS U1107 ( .A0(n713), .A1(Raw_mant_NRM_SWR[3]), .B0(n712), .Y(n714)
         );
  OAI211X1TS U1108 ( .A0(n716), .A1(n1010), .B0(n715), .C0(n714), .Y(
        LZD_raw_out_EWR[2]) );
  INVX2TS U1109 ( .A(n717), .Y(n719) );
  NOR3X1TS U1110 ( .A(Raw_mant_NRM_SWR[2]), .B(n733), .C(n975), .Y(n729) );
  AOI211X1TS U1111 ( .A0(n720), .A1(n719), .B0(n718), .C0(n729), .Y(n722) );
  OAI211X1TS U1112 ( .A0(n724), .A1(n723), .B0(n722), .C0(n721), .Y(
        LZD_raw_out_EWR[3]) );
  OAI31X1TS U1113 ( .A0(n727), .A1(Raw_mant_NRM_SWR[10]), .A2(n726), .B0(n725), 
        .Y(n728) );
  AOI211X1TS U1114 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n730), .B0(n729), .C0(n728), 
        .Y(n731) );
  OAI211X1TS U1115 ( .A0(n1041), .A1(n733), .B0(n732), .C0(n731), .Y(
        LZD_raw_out_EWR[4]) );
  NOR2X1TS U1116 ( .A(DmP_mant_SFG_SWR[24]), .B(n1012), .Y(n892) );
  NAND2X1TS U1117 ( .A(DmP_mant_SFG_SWR[23]), .B(n987), .Y(n889) );
  OAI22X1TS U1118 ( .A0(DmP_mant_SFG_SWR[22]), .A1(n1003), .B0(n735), .B1(n734), .Y(n888) );
  AOI22X1TS U1119 ( .A0(DMP_SFG[21]), .A1(n936), .B0(n889), .B1(n888), .Y(n895) );
  AOI21X1TS U1120 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n1012), .B0(n895), .Y(n737)
         );
  AOI222X4TS U1121 ( .A0(n887), .A1(n987), .B0(n887), .B1(n936), .C0(n987), 
        .C1(n936), .Y(n894) );
  OAI32X1TS U1122 ( .A0(n893), .A1(n892), .A2(n737), .B0(n778), .B1(n896), .Y(
        n738) );
  XOR2XLTS U1123 ( .A(n393), .B(n738), .Y(Raw_mant_SGF[25]) );
  NOR2BX1TS U1124 ( .AN(LZD_output_NRM2_EW[2]), .B(ADD_OVRFLW_NRM2), .Y(n739)
         );
  XOR2X1TS U1125 ( .A(n933), .B(n739), .Y(DP_OP_15J182_122_6956_n16) );
  NOR2BX1TS U1126 ( .AN(LZD_output_NRM2_EW[1]), .B(ADD_OVRFLW_NRM2), .Y(n740)
         );
  XOR2X1TS U1127 ( .A(n933), .B(n740), .Y(DP_OP_15J182_122_6956_n17) );
  OR2X1TS U1128 ( .A(ADD_OVRFLW_NRM2), .B(LZD_output_NRM2_EW[0]), .Y(n741) );
  XOR2X1TS U1129 ( .A(n933), .B(n741), .Y(DP_OP_15J182_122_6956_n18) );
  NOR2BX1TS U1130 ( .AN(exp_rslt_NRM2_EW1[7]), .B(
        array_comparators_GTComparator_N0), .Y(formatted_number_W[30]) );
  AOI2BB1XLTS U1131 ( .A0N(array_comparators_LTComparator_N0), .A1N(
        SIGN_FLAG_SHT1SHT2), .B0(array_comparators_GTComparator_N0), .Y(
        formatted_number_W[31]) );
  XOR2XLTS U1132 ( .A(DMP_EXP_EWSW[27]), .B(DmP_EXP_EWSW[27]), .Y(n742) );
  XOR2XLTS U1133 ( .A(intadd_430_n1), .B(n742), .Y(Shift_amount_EXP_EW[4]) );
  AOI22X1TS U1134 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n918), .B1(n922), .Y(n1080)
         );
  XNOR2X1TS U1135 ( .A(add_subt), .B(Data_Y[31]), .Y(n1043) );
  XNOR2X1TS U1136 ( .A(intDX_EWSW[31]), .B(n1079), .Y(OP_FLAG_INIT) );
  AOI22X1TS U1137 ( .A0(intDX_EWSW[23]), .A1(intDY_EWSW[23]), .B0(n951), .B1(
        n1002), .Y(n749) );
  AOI22X1TS U1138 ( .A0(n939), .A1(intDY_EWSW[15]), .B0(n986), .B1(
        intDY_EWSW[13]), .Y(n743) );
  OAI221XLTS U1139 ( .A0(n939), .A1(intDY_EWSW[15]), .B0(n986), .B1(
        intDY_EWSW[13]), .C0(n743), .Y(n748) );
  AOI22X1TS U1140 ( .A0(n992), .A1(intDY_EWSW[10]), .B0(n948), .B1(
        intDY_EWSW[2]), .Y(n744) );
  AOI22X1TS U1141 ( .A0(n942), .A1(intDY_EWSW[9]), .B0(n997), .B1(
        intDY_EWSW[11]), .Y(n745) );
  OAI221XLTS U1142 ( .A0(n942), .A1(intDY_EWSW[9]), .B0(n997), .B1(
        intDY_EWSW[11]), .C0(n745), .Y(n746) );
  NOR4X1TS U1143 ( .A(n749), .B(n748), .C(n747), .D(n746), .Y(n777) );
  AOI22X1TS U1144 ( .A0(n1045), .A1(intDY_EWSW[7]), .B0(n999), .B1(
        intDY_EWSW[14]), .Y(n750) );
  AOI22X1TS U1145 ( .A0(n941), .A1(intDY_EWSW[5]), .B0(n995), .B1(
        intDY_EWSW[4]), .Y(n751) );
  OAI221XLTS U1146 ( .A0(n941), .A1(intDY_EWSW[5]), .B0(n995), .B1(
        intDY_EWSW[4]), .C0(n751), .Y(n756) );
  AOI22X1TS U1147 ( .A0(n938), .A1(intDY_EWSW[3]), .B0(n1001), .B1(
        intDY_EWSW[26]), .Y(n752) );
  AOI22X1TS U1148 ( .A0(n990), .A1(intDY_EWSW[1]), .B0(n947), .B1(
        intDY_EWSW[0]), .Y(n753) );
  OAI221XLTS U1149 ( .A0(n990), .A1(intDY_EWSW[1]), .B0(n947), .B1(
        intDY_EWSW[0]), .C0(n753), .Y(n754) );
  NOR4X1TS U1150 ( .A(n757), .B(n756), .C(n755), .D(n754), .Y(n776) );
  AOI22X1TS U1151 ( .A0(n908), .A1(intDY_EWSW[28]), .B0(n996), .B1(
        intDY_EWSW[6]), .Y(n758) );
  AOI22X1TS U1152 ( .A0(n943), .A1(intDY_EWSW[18]), .B0(n1004), .B1(
        intDY_EWSW[29]), .Y(n759) );
  OAI221XLTS U1153 ( .A0(n943), .A1(intDY_EWSW[18]), .B0(n1004), .B1(
        intDY_EWSW[29]), .C0(n759), .Y(n764) );
  AOI22X1TS U1154 ( .A0(n946), .A1(intDY_EWSW[27]), .B0(n1000), .B1(
        intDY_EWSW[19]), .Y(n760) );
  AOI22X1TS U1155 ( .A0(n994), .A1(intDY_EWSW[25]), .B0(n949), .B1(
        intDY_EWSW[24]), .Y(n761) );
  OAI221XLTS U1156 ( .A0(n994), .A1(intDY_EWSW[25]), .B0(n949), .B1(
        intDY_EWSW[24]), .C0(n761), .Y(n762) );
  NOR4X1TS U1157 ( .A(n765), .B(n764), .C(n763), .D(n762), .Y(n775) );
  AOI22X1TS U1158 ( .A0(n944), .A1(intDY_EWSW[20]), .B0(n1005), .B1(
        intDY_EWSW[30]), .Y(n766) );
  AOI22X1TS U1159 ( .A0(n991), .A1(intDY_EWSW[8]), .B0(n940), .B1(
        intDY_EWSW[21]), .Y(n767) );
  OAI221XLTS U1160 ( .A0(n991), .A1(intDY_EWSW[8]), .B0(n940), .B1(
        intDY_EWSW[21]), .C0(n767), .Y(n772) );
  AOI22X1TS U1161 ( .A0(n993), .A1(intDY_EWSW[17]), .B0(n1008), .B1(
        intDY_EWSW[16]), .Y(n768) );
  AOI22X1TS U1162 ( .A0(n945), .A1(intDY_EWSW[22]), .B0(n998), .B1(
        intDY_EWSW[12]), .Y(n769) );
  OAI221XLTS U1163 ( .A0(n945), .A1(intDY_EWSW[22]), .B0(n998), .B1(
        intDY_EWSW[12]), .C0(n769), .Y(n770) );
  NOR4X1TS U1164 ( .A(n773), .B(n772), .C(n771), .D(n770), .Y(n774) );
  NAND4XLTS U1165 ( .A(n777), .B(n776), .C(n775), .D(n774), .Y(n844) );
  NOR2BX1TS U1166 ( .AN(OP_FLAG_INIT), .B(n844), .Y(ZERO_FLAG_INIT) );
  NOR2BX1TS U1167 ( .AN(Shift_reg_FLAGS_7[3]), .B(Shift_reg_FLAGS_7[0]), .Y(
        n_21_net_) );
  AOI21X1TS U1168 ( .A0(n778), .A1(n393), .B0(n858), .Y(ADD_OVRFLW_SGF) );
  NOR2X1TS U1169 ( .A(n1034), .B(intDX_EWSW[25]), .Y(n838) );
  NOR2XLTS U1170 ( .A(n838), .B(intDY_EWSW[24]), .Y(n779) );
  AOI22X1TS U1171 ( .A0(intDX_EWSW[25]), .A1(n1034), .B0(intDX_EWSW[24]), .B1(
        n779), .Y(n783) );
  NAND2BXLTS U1172 ( .AN(intDX_EWSW[27]), .B(intDY_EWSW[27]), .Y(n780) );
  OAI21X1TS U1173 ( .A0(intDX_EWSW[26]), .A1(n1039), .B0(n780), .Y(n839) );
  NAND3XLTS U1174 ( .A(n1039), .B(n780), .C(intDX_EWSW[26]), .Y(n782) );
  NAND2BXLTS U1175 ( .AN(intDY_EWSW[27]), .B(intDX_EWSW[27]), .Y(n781) );
  OAI211XLTS U1176 ( .A0(n783), .A1(n839), .B0(n782), .C0(n781), .Y(n788) );
  NOR2X1TS U1177 ( .A(n985), .B(intDX_EWSW[30]), .Y(n786) );
  NOR2X1TS U1178 ( .A(n937), .B(intDX_EWSW[29]), .Y(n784) );
  AOI211X1TS U1179 ( .A0(intDY_EWSW[28]), .A1(n908), .B0(n786), .C0(n784), .Y(
        n837) );
  AOI2BB2X1TS U1180 ( .B0(n788), .B1(n837), .A0N(n787), .A1N(n786), .Y(n843)
         );
  NOR2X1TS U1181 ( .A(n1032), .B(intDX_EWSW[17]), .Y(n824) );
  NAND2BXLTS U1182 ( .AN(intDX_EWSW[9]), .B(intDY_EWSW[9]), .Y(n805) );
  NOR2X1TS U1183 ( .A(n1035), .B(intDX_EWSW[11]), .Y(n803) );
  AOI21X1TS U1184 ( .A0(intDY_EWSW[10]), .A1(n992), .B0(n803), .Y(n808) );
  OAI211XLTS U1185 ( .A0(intDX_EWSW[8]), .A1(n1031), .B0(n805), .C0(n808), .Y(
        n819) );
  OAI2BB1X1TS U1186 ( .A0N(n941), .A1N(intDY_EWSW[5]), .B0(intDX_EWSW[4]), .Y(
        n789) );
  OAI22X1TS U1187 ( .A0(intDY_EWSW[4]), .A1(n789), .B0(n941), .B1(
        intDY_EWSW[5]), .Y(n800) );
  OAI2BB1X1TS U1188 ( .A0N(n1045), .A1N(intDY_EWSW[7]), .B0(intDX_EWSW[6]), 
        .Y(n790) );
  OAI22X1TS U1189 ( .A0(intDY_EWSW[6]), .A1(n790), .B0(n1045), .B1(
        intDY_EWSW[7]), .Y(n799) );
  OAI2BB2XLTS U1190 ( .B0(intDY_EWSW[0]), .B1(n791), .A0N(intDX_EWSW[1]), 
        .A1N(n1036), .Y(n793) );
  NAND2BXLTS U1191 ( .AN(intDX_EWSW[2]), .B(intDY_EWSW[2]), .Y(n792) );
  OAI211XLTS U1192 ( .A0(n1037), .A1(intDX_EWSW[3]), .B0(n793), .C0(n792), .Y(
        n796) );
  OAI21XLTS U1193 ( .A0(intDX_EWSW[3]), .A1(n1037), .B0(intDX_EWSW[2]), .Y(
        n794) );
  AOI2BB2XLTS U1194 ( .B0(intDX_EWSW[3]), .B1(n1037), .A0N(intDY_EWSW[2]), 
        .A1N(n794), .Y(n795) );
  AOI222X1TS U1195 ( .A0(intDY_EWSW[4]), .A1(n995), .B0(n796), .B1(n795), .C0(
        intDY_EWSW[5]), .C1(n941), .Y(n798) );
  AOI22X1TS U1196 ( .A0(intDY_EWSW[7]), .A1(n1045), .B0(intDY_EWSW[6]), .B1(
        n996), .Y(n797) );
  OAI32X1TS U1197 ( .A0(n800), .A1(n799), .A2(n798), .B0(n797), .B1(n799), .Y(
        n818) );
  OA22X1TS U1198 ( .A0(n955), .A1(intDX_EWSW[14]), .B0(n1038), .B1(
        intDX_EWSW[15]), .Y(n815) );
  NAND2BXLTS U1199 ( .AN(intDX_EWSW[13]), .B(intDY_EWSW[13]), .Y(n801) );
  OAI21XLTS U1200 ( .A0(intDX_EWSW[13]), .A1(n1021), .B0(intDX_EWSW[12]), .Y(
        n802) );
  OAI2BB2XLTS U1201 ( .B0(intDY_EWSW[12]), .B1(n802), .A0N(intDX_EWSW[13]), 
        .A1N(n1021), .Y(n814) );
  NOR2XLTS U1202 ( .A(n803), .B(intDY_EWSW[10]), .Y(n804) );
  AOI22X1TS U1203 ( .A0(intDX_EWSW[11]), .A1(n1035), .B0(intDX_EWSW[10]), .B1(
        n804), .Y(n810) );
  NAND2BXLTS U1204 ( .AN(intDY_EWSW[9]), .B(intDX_EWSW[9]), .Y(n807) );
  NAND3XLTS U1205 ( .A(n1031), .B(n805), .C(intDX_EWSW[8]), .Y(n806) );
  AOI21X1TS U1206 ( .A0(n807), .A1(n806), .B0(n817), .Y(n809) );
  OAI2BB2XLTS U1207 ( .B0(n810), .B1(n817), .A0N(n809), .A1N(n808), .Y(n813)
         );
  OAI2BB2XLTS U1208 ( .B0(intDY_EWSW[14]), .B1(n811), .A0N(intDX_EWSW[15]), 
        .A1N(n1038), .Y(n812) );
  AOI211X1TS U1209 ( .A0(n815), .A1(n814), .B0(n813), .C0(n812), .Y(n816) );
  OAI31X1TS U1210 ( .A0(n819), .A1(n818), .A2(n817), .B0(n816), .Y(n822) );
  OA22X1TS U1211 ( .A0(n1025), .A1(intDX_EWSW[22]), .B0(n951), .B1(
        intDX_EWSW[23]), .Y(n835) );
  NAND2BXLTS U1212 ( .AN(intDX_EWSW[21]), .B(intDY_EWSW[21]), .Y(n820) );
  NAND2BXLTS U1213 ( .AN(intDX_EWSW[19]), .B(intDY_EWSW[19]), .Y(n826) );
  OAI21X1TS U1214 ( .A0(intDX_EWSW[18]), .A1(n1033), .B0(n826), .Y(n830) );
  NAND3BXLTS U1215 ( .AN(n824), .B(n822), .C(n821), .Y(n842) );
  OAI2BB2XLTS U1216 ( .B0(intDY_EWSW[20]), .B1(n823), .A0N(intDX_EWSW[21]), 
        .A1N(n1022), .Y(n834) );
  AOI22X1TS U1217 ( .A0(intDX_EWSW[17]), .A1(n1032), .B0(intDX_EWSW[16]), .B1(
        n825), .Y(n828) );
  AOI32X1TS U1218 ( .A0(n1033), .A1(n826), .A2(intDX_EWSW[18]), .B0(
        intDX_EWSW[19]), .B1(n954), .Y(n827) );
  OAI32X1TS U1219 ( .A0(n830), .A1(n829), .A2(n828), .B0(n827), .B1(n829), .Y(
        n833) );
  OAI21XLTS U1220 ( .A0(intDX_EWSW[23]), .A1(n951), .B0(intDX_EWSW[22]), .Y(
        n831) );
  OAI2BB2XLTS U1221 ( .B0(intDY_EWSW[22]), .B1(n831), .A0N(intDX_EWSW[23]), 
        .A1N(n951), .Y(n832) );
  AOI211X1TS U1222 ( .A0(n835), .A1(n834), .B0(n833), .C0(n832), .Y(n841) );
  NAND2BXLTS U1223 ( .AN(intDX_EWSW[24]), .B(intDY_EWSW[24]), .Y(n836) );
  NAND4BBX1TS U1224 ( .AN(n839), .BN(n838), .C(n837), .D(n836), .Y(n840) );
  AOI32X1TS U1225 ( .A0(n843), .A1(n842), .A2(n841), .B0(n840), .B1(n843), .Y(
        n899) );
  AOI21X1TS U1226 ( .A0(n844), .A1(n910), .B0(intDX_EWSW[31]), .Y(n845) );
  AOI21X1TS U1227 ( .A0(n1079), .A1(n906), .B0(n845), .Y(SIGN_FLAG_INIT) );
  NAND2X1TS U1228 ( .A(N59), .B(n858), .Y(n846) );
  XNOR2X1TS U1229 ( .A(n846), .B(N60), .Y(Raw_mant_SGF[1]) );
  OAI21XLTS U1230 ( .A0(DMP_SFG[0]), .A1(DmP_mant_SFG_SWR[2]), .B0(n847), .Y(
        n850) );
  NAND2X1TS U1231 ( .A(n848), .B(n858), .Y(n849) );
  XOR2XLTS U1232 ( .A(n850), .B(n849), .Y(Raw_mant_SGF[2]) );
  AOI22X1TS U1233 ( .A0(n858), .A1(n852), .B0(n851), .B1(n1078), .Y(n855) );
  OAI21XLTS U1234 ( .A0(DmP_mant_SFG_SWR[9]), .A1(n926), .B0(n853), .Y(n854)
         );
  XOR2XLTS U1235 ( .A(n855), .B(n854), .Y(Raw_mant_SGF[9]) );
  AOI22X1TS U1236 ( .A0(n858), .A1(n857), .B0(n856), .B1(n893), .Y(n861) );
  OAI21XLTS U1237 ( .A0(DmP_mant_SFG_SWR[11]), .A1(n927), .B0(n859), .Y(n860)
         );
  XOR2XLTS U1238 ( .A(n861), .B(n860), .Y(Raw_mant_SGF[11]) );
  AOI22X1TS U1239 ( .A0(n858), .A1(n863), .B0(n862), .B1(n893), .Y(n866) );
  OAI21XLTS U1240 ( .A0(DmP_mant_SFG_SWR[13]), .A1(n928), .B0(n864), .Y(n865)
         );
  XOR2XLTS U1241 ( .A(n866), .B(n865), .Y(Raw_mant_SGF[13]) );
  AOI22X1TS U1242 ( .A0(n858), .A1(n868), .B0(n867), .B1(n893), .Y(n871) );
  OAI21XLTS U1243 ( .A0(DmP_mant_SFG_SWR[15]), .A1(n929), .B0(n869), .Y(n870)
         );
  XOR2XLTS U1244 ( .A(n871), .B(n870), .Y(Raw_mant_SGF[15]) );
  AOI22X1TS U1245 ( .A0(n858), .A1(n873), .B0(n872), .B1(n1078), .Y(n876) );
  OAI21XLTS U1246 ( .A0(DmP_mant_SFG_SWR[17]), .A1(n930), .B0(n874), .Y(n875)
         );
  XOR2XLTS U1247 ( .A(n876), .B(n875), .Y(Raw_mant_SGF[17]) );
  AOI22X1TS U1248 ( .A0(n858), .A1(n878), .B0(n877), .B1(n1078), .Y(n881) );
  OAI21XLTS U1249 ( .A0(DmP_mant_SFG_SWR[19]), .A1(n931), .B0(n879), .Y(n880)
         );
  XOR2XLTS U1250 ( .A(n881), .B(n880), .Y(Raw_mant_SGF[19]) );
  AOI22X1TS U1251 ( .A0(n858), .A1(n883), .B0(n882), .B1(n1078), .Y(n886) );
  OAI21XLTS U1252 ( .A0(DmP_mant_SFG_SWR[21]), .A1(n973), .B0(n884), .Y(n885)
         );
  XOR2XLTS U1253 ( .A(n886), .B(n885), .Y(Raw_mant_SGF[21]) );
  AOI22X1TS U1254 ( .A0(n858), .A1(n888), .B0(n887), .B1(n1078), .Y(n891) );
  OAI21XLTS U1255 ( .A0(DmP_mant_SFG_SWR[23]), .A1(n987), .B0(n889), .Y(n890)
         );
  XOR2XLTS U1256 ( .A(n891), .B(n890), .Y(Raw_mant_SGF[23]) );
  AOI21X1TS U1257 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n1012), .B0(n892), .Y(n898)
         );
  AOI22X1TS U1258 ( .A0(n858), .A1(n895), .B0(n894), .B1(n893), .Y(n897) );
  XOR2XLTS U1259 ( .A(n898), .B(n897), .Y(Raw_mant_SGF[24]) );
  AOI22X1TS U1260 ( .A0(n901), .A1(n1040), .B0(n947), .B1(n910), .Y(
        DmP_INIT_EWSW[0]) );
  AOI22X1TS U1261 ( .A0(n901), .A1(n1036), .B0(n990), .B1(n910), .Y(
        DmP_INIT_EWSW[1]) );
  AOI22X1TS U1262 ( .A0(n901), .A1(n1023), .B0(n948), .B1(n910), .Y(
        DmP_INIT_EWSW[2]) );
  AOI22X1TS U1263 ( .A0(n901), .A1(n1037), .B0(n938), .B1(n906), .Y(
        DmP_INIT_EWSW[3]) );
  AOI22X1TS U1264 ( .A0(n901), .A1(n1018), .B0(n995), .B1(n905), .Y(
        DmP_INIT_EWSW[4]) );
  AOI22X1TS U1265 ( .A0(n901), .A1(n1015), .B0(n941), .B1(n905), .Y(
        DmP_INIT_EWSW[5]) );
  AOI22X1TS U1266 ( .A0(n901), .A1(n1016), .B0(n996), .B1(n905), .Y(
        DmP_INIT_EWSW[6]) );
  INVX4TS U1267 ( .A(n903), .Y(n909) );
  AOI22X1TS U1268 ( .A0(n901), .A1(n1014), .B0(n1045), .B1(n906), .Y(
        DmP_INIT_EWSW[7]) );
  AOI22X1TS U1269 ( .A0(n901), .A1(n1031), .B0(n991), .B1(n905), .Y(
        DmP_INIT_EWSW[8]) );
  AOI22X1TS U1270 ( .A0(n901), .A1(n1026), .B0(n942), .B1(n909), .Y(
        DmP_INIT_EWSW[9]) );
  AOI22X1TS U1271 ( .A0(n901), .A1(n1019), .B0(n992), .B1(n905), .Y(
        DmP_INIT_EWSW[10]) );
  AOI22X1TS U1272 ( .A0(n901), .A1(n1035), .B0(n997), .B1(n906), .Y(
        DmP_INIT_EWSW[11]) );
  AOI22X1TS U1273 ( .A0(n901), .A1(n1028), .B0(n998), .B1(n909), .Y(
        DmP_INIT_EWSW[12]) );
  AOI22X1TS U1274 ( .A0(n901), .A1(n1021), .B0(n986), .B1(n909), .Y(
        DmP_INIT_EWSW[13]) );
  AOI22X1TS U1275 ( .A0(n901), .A1(n955), .B0(n999), .B1(n906), .Y(
        DmP_INIT_EWSW[14]) );
  AOI22X1TS U1276 ( .A0(n901), .A1(n1038), .B0(n939), .B1(n906), .Y(
        DmP_INIT_EWSW[15]) );
  AOI22X1TS U1277 ( .A0(n901), .A1(n1017), .B0(n1008), .B1(n905), .Y(
        DmP_INIT_EWSW[16]) );
  AOI22X1TS U1278 ( .A0(n901), .A1(n1032), .B0(n993), .B1(n905), .Y(
        DmP_INIT_EWSW[17]) );
  AOI22X1TS U1279 ( .A0(n901), .A1(n1033), .B0(n943), .B1(n906), .Y(
        DmP_INIT_EWSW[18]) );
  AOI22X1TS U1280 ( .A0(n901), .A1(n954), .B0(n1000), .B1(n909), .Y(
        DmP_INIT_EWSW[19]) );
  BUFX4TS U1281 ( .A(n903), .Y(n907) );
  CLKBUFX3TS U1282 ( .A(n907), .Y(n902) );
  AOI22X1TS U1283 ( .A0(n902), .A1(n1024), .B0(n944), .B1(n905), .Y(
        DmP_INIT_EWSW[20]) );
  AOI22X1TS U1284 ( .A0(n902), .A1(n1022), .B0(n940), .B1(n905), .Y(
        DmP_INIT_EWSW[21]) );
  AOI22X1TS U1285 ( .A0(n902), .A1(n1025), .B0(n945), .B1(n905), .Y(
        DmP_INIT_EWSW[22]) );
  AOI22X1TS U1286 ( .A0(n902), .A1(n951), .B0(n1002), .B1(n905), .Y(
        DmP_INIT_EWSW[23]) );
  AOI22X1TS U1287 ( .A0(n902), .A1(n1020), .B0(n949), .B1(n909), .Y(
        DmP_INIT_EWSW[24]) );
  AOI22X1TS U1288 ( .A0(n902), .A1(n1034), .B0(n994), .B1(n906), .Y(
        DmP_INIT_EWSW[25]) );
  AOI22X1TS U1289 ( .A0(n902), .A1(n1039), .B0(n1001), .B1(n905), .Y(
        DmP_INIT_EWSW[26]) );
  AOI22X1TS U1290 ( .A0(n902), .A1(n1027), .B0(n946), .B1(n909), .Y(
        DmP_INIT_EWSW[27]) );
  AOI22X1TS U1291 ( .A0(n902), .A1(n947), .B0(n1040), .B1(n906), .Y(
        DMP_INIT_EWSW[0]) );
  AOI22X1TS U1292 ( .A0(n902), .A1(n990), .B0(n1036), .B1(n905), .Y(
        DMP_INIT_EWSW[1]) );
  CLKBUFX3TS U1293 ( .A(n907), .Y(n904) );
  AOI22X1TS U1294 ( .A0(n904), .A1(n948), .B0(n1023), .B1(n909), .Y(
        DMP_INIT_EWSW[2]) );
  AOI22X1TS U1295 ( .A0(n904), .A1(n938), .B0(n1037), .B1(n909), .Y(
        DMP_INIT_EWSW[3]) );
  AOI22X1TS U1296 ( .A0(n904), .A1(n995), .B0(n1018), .B1(n906), .Y(
        DMP_INIT_EWSW[4]) );
  AOI22X1TS U1297 ( .A0(n904), .A1(n941), .B0(n1015), .B1(n905), .Y(
        DMP_INIT_EWSW[5]) );
  AOI22X1TS U1298 ( .A0(n904), .A1(n996), .B0(n1016), .B1(n905), .Y(
        DMP_INIT_EWSW[6]) );
  AOI22X1TS U1299 ( .A0(n904), .A1(n1045), .B0(n1014), .B1(n906), .Y(
        DMP_INIT_EWSW[7]) );
  AOI22X1TS U1300 ( .A0(n904), .A1(n991), .B0(n1031), .B1(n909), .Y(
        DMP_INIT_EWSW[8]) );
  AOI22X1TS U1301 ( .A0(n904), .A1(n942), .B0(n1026), .B1(n909), .Y(
        DMP_INIT_EWSW[9]) );
  AOI22X1TS U1302 ( .A0(n904), .A1(n992), .B0(n1019), .B1(n906), .Y(
        DMP_INIT_EWSW[10]) );
  AOI22X1TS U1303 ( .A0(n904), .A1(n997), .B0(n1035), .B1(n905), .Y(
        DMP_INIT_EWSW[11]) );
  AOI22X1TS U1304 ( .A0(n907), .A1(n998), .B0(n1028), .B1(n905), .Y(
        DMP_INIT_EWSW[12]) );
  AOI22X1TS U1305 ( .A0(n907), .A1(n986), .B0(n1021), .B1(n909), .Y(
        DMP_INIT_EWSW[13]) );
  AOI22X1TS U1306 ( .A0(n907), .A1(n999), .B0(n955), .B1(n909), .Y(
        DMP_INIT_EWSW[14]) );
  AOI22X1TS U1307 ( .A0(n907), .A1(n939), .B0(n1038), .B1(n906), .Y(
        DMP_INIT_EWSW[15]) );
  AOI22X1TS U1308 ( .A0(n907), .A1(n1008), .B0(n1017), .B1(n905), .Y(
        DMP_INIT_EWSW[16]) );
  AOI22X1TS U1309 ( .A0(n907), .A1(n993), .B0(n1032), .B1(n906), .Y(
        DMP_INIT_EWSW[17]) );
  AOI22X1TS U1310 ( .A0(n907), .A1(n943), .B0(n1033), .B1(n906), .Y(
        DMP_INIT_EWSW[18]) );
  AOI22X1TS U1311 ( .A0(n907), .A1(n1000), .B0(n954), .B1(n909), .Y(
        DMP_INIT_EWSW[19]) );
  AOI22X1TS U1312 ( .A0(n907), .A1(n944), .B0(n1024), .B1(n905), .Y(
        DMP_INIT_EWSW[20]) );
  AOI22X1TS U1313 ( .A0(n907), .A1(n940), .B0(n1022), .B1(n906), .Y(
        DMP_INIT_EWSW[21]) );
  AOI22X1TS U1314 ( .A0(n907), .A1(n945), .B0(n1025), .B1(n909), .Y(
        DMP_INIT_EWSW[22]) );
  AOI22X1TS U1315 ( .A0(n907), .A1(n1002), .B0(n951), .B1(n905), .Y(
        DMP_INIT_EWSW[23]) );
  AOI22X1TS U1316 ( .A0(n907), .A1(n949), .B0(n1020), .B1(n906), .Y(
        DMP_INIT_EWSW[24]) );
  AOI22X1TS U1317 ( .A0(n907), .A1(n994), .B0(n1034), .B1(n909), .Y(
        DMP_INIT_EWSW[25]) );
  AOI22X1TS U1318 ( .A0(n907), .A1(n1001), .B0(n1039), .B1(n905), .Y(
        DMP_INIT_EWSW[26]) );
  AOI22X1TS U1319 ( .A0(n907), .A1(n946), .B0(n1027), .B1(n909), .Y(
        DMP_INIT_EWSW[27]) );
  OAI2BB2XLTS U1320 ( .B0(n910), .B1(n908), .A0N(n910), .A1N(intDY_EWSW[28]), 
        .Y(DMP_INIT_EWSW[28]) );
  OAI2BB2XLTS U1321 ( .B0(n910), .B1(n1004), .A0N(n910), .A1N(intDY_EWSW[29]), 
        .Y(DMP_INIT_EWSW[29]) );
  OAI2BB2XLTS U1322 ( .B0(n910), .B1(n1005), .A0N(n910), .A1N(intDY_EWSW[30]), 
        .Y(DMP_INIT_EWSW[30]) );
  OAI22X1TS U1323 ( .A0(n911), .A1(n914), .B0(n915), .B1(n912), .Y(
        Data_array_SWR[24]) );
  OAI222X1TS U1324 ( .A0(n916), .A1(n915), .B0(n914), .B1(n913), .C0(n912), 
        .C1(n911), .Y(Data_array_SWR[23]) );
  CLKAND2X2TS U1325 ( .A(n917), .B(sftr_odat_SHT2_SWR[6]), .Y(
        formatted_number_W[4]) );
  CLKAND2X2TS U1326 ( .A(n917), .B(sftr_odat_SHT2_SWR[7]), .Y(
        formatted_number_W[5]) );
  CLKAND2X2TS U1327 ( .A(n917), .B(sftr_odat_SHT2_SWR[18]), .Y(
        formatted_number_W[16]) );
  CLKAND2X2TS U1328 ( .A(n917), .B(sftr_odat_SHT2_SWR[19]), .Y(
        formatted_number_W[17]) );
  INVX2TS U1330 ( .A(n918), .Y(n921) );
  AOI22X1TS U1331 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n953), .B0(
        beg_OP), .B1(n922), .Y(n920) );
  OAI22X1TS U1332 ( .A0(n921), .A1(n920), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B1(n919), .Y(n389) );
  NAND2BXLTS U1333 ( .AN(busy), .B(n935), .Y(n_7_net_) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule

