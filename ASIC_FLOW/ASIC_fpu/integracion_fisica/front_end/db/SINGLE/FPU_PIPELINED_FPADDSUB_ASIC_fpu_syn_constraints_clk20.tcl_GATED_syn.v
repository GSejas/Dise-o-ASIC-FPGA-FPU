/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:05:34 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_ShiftRegister_W7_48 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W13_47 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_9 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
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
         N59, N60, ADD_OVRFLW_SGF, inst_ShiftRegister_net3656620,
         SFT2FRMT_STAGE_VARS_net3656530, FRMT_STAGE_DATAOUT_net3656458,
         SGF_STAGE_DMP_net3656512, NRM_STAGE_Raw_mant_net3656494,
         INPUT_STAGE_OPERANDY_net3656458, EXP_STAGE_DMP_net3656512,
         SHT1_STAGE_DMP_net3656512, SHT2_STAGE_DMP_net3656512,
         SHT2_SHIFT_DATA_net3656494, array_comparators_GTComparator_N0,
         array_comparators_LTComparator_N0, n388, n389, n390,
         DP_OP_15J180_122_6956_n18, DP_OP_15J180_122_6956_n17,
         DP_OP_15J180_122_6956_n16, DP_OP_15J180_122_6956_n15,
         DP_OP_15J180_122_6956_n14, DP_OP_15J180_122_6956_n8,
         DP_OP_15J180_122_6956_n7, DP_OP_15J180_122_6956_n6,
         DP_OP_15J180_122_6956_n5, DP_OP_15J180_122_6956_n4,
         DP_OP_15J180_122_6956_n3, DP_OP_15J180_122_6956_n2,
         DP_OP_15J180_122_6956_n1, intadd_428_CI, intadd_428_SUM_2_,
         intadd_428_SUM_1_, intadd_428_SUM_0_, intadd_428_n3, intadd_428_n2,
         intadd_428_n1, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952, n953, n954,
         n955, n956, n957, n958, n959, n960, n961, n962, n963, n964, n965,
         n966, n967, n968, n969, n970, n971, n972, n973, n974, n975, n976,
         n977, n978, n979, n980, n981, n982, n983, n984, n985, n986, n987,
         n988, n989, n990, n991, n992, n993, n994, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094;
  wire   [3:1] Shift_reg_FLAGS_7;
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

  SNPS_CLOCK_GATE_HIGH_ShiftRegister_W7_48 inst_ShiftRegister_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n390), .ENCLK(inst_ShiftRegister_net3656620), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W13_47 SFT2FRMT_STAGE_VARS_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[1]), .ENCLK(
        SFT2FRMT_STAGE_VARS_net3656530), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_6 FRMT_STAGE_DATAOUT_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n412), .ENCLK(FRMT_STAGE_DATAOUT_net3656458), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_5 SGF_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n_21_net_), .ENCLK(SGF_STAGE_DMP_net3656512), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_1 NRM_STAGE_Raw_mant_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[2]), .ENCLK(
        NRM_STAGE_Raw_mant_net3656494), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_7 INPUT_STAGE_OPERANDY_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enable_Pipeline_input), .ENCLK(
        INPUT_STAGE_OPERANDY_net3656458), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_9 EXP_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7_6), .ENCLK(EXP_STAGE_DMP_net3656512), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_8 SHT1_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7_5), .ENCLK(SHT1_STAGE_DMP_net3656512), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_7 SHT2_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(busy), .ENCLK(SHT2_STAGE_DMP_net3656512), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_4 SHT2_SHIFT_DATA_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n_7_net_), .ENCLK(SHT2_SHIFT_DATA_net3656494), .TE(1'b0) );
  DFFRXLTS inst_ShiftRegister_Q_reg_6_ ( .D(n1094), .CK(
        inst_ShiftRegister_net3656620), .RN(n1058), .Q(Shift_reg_FLAGS_7_6) );
  DFFRXLTS inst_ShiftRegister_Q_reg_5_ ( .D(Shift_reg_FLAGS_7_6), .CK(
        inst_ShiftRegister_net3656620), .RN(n1059), .Q(Shift_reg_FLAGS_7_5) );
  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(busy), .CK(
        inst_ShiftRegister_net3656620), .RN(n1059), .Q(Shift_reg_FLAGS_7[3])
         );
  DFFRXLTS inst_ShiftRegister_Q_reg_2_ ( .D(Shift_reg_FLAGS_7[3]), .CK(
        inst_ShiftRegister_net3656620), .RN(n1060), .Q(Shift_reg_FLAGS_7[2])
         );
  DFFRXLTS inst_ShiftRegister_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[1]), .CK(
        inst_ShiftRegister_net3656620), .RN(n1060), .QN(n402) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(Shift_amount_EXP_EW[0]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1061), .Q(Shift_amount_SHT1_EWR[0])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(Shift_amount_EXP_EW[1]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1060), .Q(Shift_amount_SHT1_EWR[1])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(Shift_amount_EXP_EW[2]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1061), .Q(Shift_amount_SHT1_EWR[2])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(Shift_amount_EXP_EW[3]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1063), .Q(Shift_amount_SHT1_EWR[3])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(Shift_amount_EXP_EW[4]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1062), .Q(Shift_amount_SHT1_EWR[4])
         );
  DFFRXLTS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(Data_X[28]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1060), .Q(intDX_EWSW[28]), .QN(
        n427) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(DmP_INIT_EWSW[0]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1060), .Q(DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(DmP_EXP_EWSW[0]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1063), .Q(DmP_mant_SHT1_SW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(DmP_INIT_EWSW[1]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1061), .Q(DmP_EXP_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(DmP_EXP_EWSW[1]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1064), .Q(DmP_mant_SHT1_SW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(DmP_INIT_EWSW[2]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1059), .Q(DmP_EXP_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(DmP_EXP_EWSW[2]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1058), .Q(DmP_mant_SHT1_SW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(DmP_INIT_EWSW[3]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1063), .Q(DmP_EXP_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(DmP_EXP_EWSW[3]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1059), .Q(DmP_mant_SHT1_SW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(DmP_INIT_EWSW[4]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1058), .Q(DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(DmP_EXP_EWSW[4]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1063), .Q(DmP_mant_SHT1_SW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(DmP_INIT_EWSW[5]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1058), .Q(DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(DmP_EXP_EWSW[5]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1061), .Q(DmP_mant_SHT1_SW[5]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(DmP_INIT_EWSW[6]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1060), .Q(DmP_EXP_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(DmP_EXP_EWSW[6]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1062), .Q(DmP_mant_SHT1_SW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(DmP_INIT_EWSW[7]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1064), .Q(DmP_EXP_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(DmP_EXP_EWSW[7]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1061), .Q(DmP_mant_SHT1_SW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(DmP_INIT_EWSW[8]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1062), .Q(DmP_EXP_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(DmP_EXP_EWSW[8]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1064), .Q(DmP_mant_SHT1_SW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(DmP_INIT_EWSW[9]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1064), .Q(DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(DmP_EXP_EWSW[9]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1063), .Q(DmP_mant_SHT1_SW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(DmP_INIT_EWSW[10]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1059), .Q(DmP_EXP_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(DmP_EXP_EWSW[10]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1063), .Q(DmP_mant_SHT1_SW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(DmP_INIT_EWSW[11]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1061), .Q(DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(DmP_EXP_EWSW[11]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1078), .Q(DmP_mant_SHT1_SW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(DmP_INIT_EWSW[12]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1063), .Q(DmP_EXP_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(DmP_EXP_EWSW[12]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1065), .Q(DmP_mant_SHT1_SW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(DmP_INIT_EWSW[13]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1077), .Q(DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(DmP_EXP_EWSW[13]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1070), .Q(DmP_mant_SHT1_SW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(DmP_INIT_EWSW[14]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1079), .Q(DmP_EXP_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(DmP_EXP_EWSW[14]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1075), .Q(DmP_mant_SHT1_SW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(DmP_INIT_EWSW[15]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1078), .Q(DmP_EXP_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(DmP_EXP_EWSW[15]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1070), .Q(DmP_mant_SHT1_SW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(DmP_INIT_EWSW[16]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n462), .Q(DmP_EXP_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(DmP_EXP_EWSW[16]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1071), .Q(DmP_mant_SHT1_SW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(DmP_INIT_EWSW[17]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n460), .Q(DmP_EXP_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(DmP_EXP_EWSW[17]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n464), .Q(DmP_mant_SHT1_SW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(DmP_INIT_EWSW[18]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n463), .Q(DmP_EXP_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(DmP_EXP_EWSW[18]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1073), .Q(DmP_mant_SHT1_SW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(DmP_INIT_EWSW[19]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1066), .Q(DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(DmP_EXP_EWSW[19]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1088), .Q(DmP_mant_SHT1_SW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(DmP_INIT_EWSW[20]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1067), .Q(DmP_EXP_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(DmP_EXP_EWSW[20]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1087), .Q(DmP_mant_SHT1_SW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(DmP_INIT_EWSW[21]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1085), .Q(DmP_EXP_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(DmP_EXP_EWSW[21]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n425), .Q(DmP_mant_SHT1_SW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(DmP_INIT_EWSW[22]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1086), .Q(DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(DmP_EXP_EWSW[22]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1088), .Q(DmP_mant_SHT1_SW[22]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_23_ ( .D(DmP_INIT_EWSW[23]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1067), .Q(DmP_EXP_EWSW[23]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_24_ ( .D(DmP_INIT_EWSW[24]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1080), .Q(DmP_EXP_EWSW[24]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_25_ ( .D(DmP_INIT_EWSW[25]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1082), .Q(DmP_EXP_EWSW[25]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_26_ ( .D(DmP_INIT_EWSW[26]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1077), .Q(DmP_EXP_EWSW[26]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_27_ ( .D(DmP_INIT_EWSW[27]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1068), .Q(DmP_EXP_EWSW[27]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(DMP_INIT_EWSW[0]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1066), .Q(DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(DMP_INIT_EWSW[1]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1072), .Q(DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(DMP_INIT_EWSW[2]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1072), .Q(DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(DMP_INIT_EWSW[3]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1069), .Q(DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(DMP_INIT_EWSW[4]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1070), .Q(DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(DMP_INIT_EWSW[5]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n460), .Q(DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(DMP_INIT_EWSW[6]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n464), .Q(DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(DMP_INIT_EWSW[7]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n463), .Q(DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(DMP_INIT_EWSW[8]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n462), .Q(DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(DMP_INIT_EWSW[9]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1071), .Q(DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(DMP_INIT_EWSW[10]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1073), .Q(DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(DMP_INIT_EWSW[11]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1066), .Q(DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(DMP_INIT_EWSW[12]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n460), .Q(DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(DMP_INIT_EWSW[13]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n464), .Q(DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(DMP_INIT_EWSW[14]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n463), .Q(DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(DMP_INIT_EWSW[15]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1073), .Q(DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(DMP_INIT_EWSW[16]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1066), .Q(DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(DMP_INIT_EWSW[17]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1072), .Q(DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(DMP_INIT_EWSW[18]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1069), .Q(DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(DMP_INIT_EWSW[19]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1070), .Q(DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(DMP_INIT_EWSW[20]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n462), .Q(DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(DMP_INIT_EWSW[21]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1071), .Q(DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(DMP_INIT_EWSW[22]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1073), .Q(DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_23_ ( .D(DMP_INIT_EWSW[23]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1066), .Q(DMP_EXP_EWSW[23]), .QN(n430)
         );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_27_ ( .D(DMP_INIT_EWSW[27]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1069), .Q(DMP_EXP_EWSW[27]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(DMP_INIT_EWSW[28]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1070), .Q(DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(DMP_INIT_EWSW[29]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n464), .Q(DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(DMP_INIT_EWSW[30]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n463), .Q(DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n460), .Q(ZERO_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1073), .Q(OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1066), .Q(SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(DMP_EXP_EWSW[0]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1072), .Q(DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(DMP_EXP_EWSW[1]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1069), .Q(DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(DMP_EXP_EWSW[2]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1072), .Q(DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(DMP_EXP_EWSW[3]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1069), .Q(DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(DMP_EXP_EWSW[4]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1070), .Q(DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(DMP_EXP_EWSW[5]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n460), .Q(DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(DMP_EXP_EWSW[6]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n464), .Q(DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(DMP_EXP_EWSW[7]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n463), .Q(DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(DMP_EXP_EWSW[8]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n462), .Q(DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(DMP_EXP_EWSW[9]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1071), .Q(DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(DMP_EXP_EWSW[10]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1073), .Q(DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(DMP_EXP_EWSW[11]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1066), .Q(DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(DMP_EXP_EWSW[12]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1072), .Q(DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(DMP_EXP_EWSW[13]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1069), .Q(DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(DMP_EXP_EWSW[14]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1072), .Q(DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(DMP_EXP_EWSW[15]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1069), .Q(DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(DMP_EXP_EWSW[16]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1070), .Q(DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(DMP_EXP_EWSW[17]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n462), .Q(DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(DMP_EXP_EWSW[18]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1071), .Q(DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(DMP_EXP_EWSW[19]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1073), .Q(DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(DMP_EXP_EWSW[20]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1066), .Q(DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(DMP_EXP_EWSW[21]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1072), .Q(DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(DMP_EXP_EWSW[22]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1069), .Q(DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(DMP_EXP_EWSW[23]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1070), .Q(DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(DMP_EXP_EWSW[24]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n464), .Q(DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(DMP_EXP_EWSW[25]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n463), .Q(DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(DMP_EXP_EWSW[26]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(DMP_EXP_EWSW[27]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(DMP_EXP_EWSW[28]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(DMP_EXP_EWSW[29]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(DMP_EXP_EWSW[30]), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1074), .Q(ZERO_FLAG_SHT1) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1074), .Q(OP_FLAG_SHT1) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3656512), .RN(n1074), .Q(SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(DMP_SHT1_EWSW[0]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(DMP_SHT1_EWSW[1]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(DMP_SHT1_EWSW[2]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1078), .Q(DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(DMP_SHT1_EWSW[3]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1076), .Q(DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(DMP_SHT1_EWSW[4]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(DMP_SHT1_EWSW[5]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1077), .Q(DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(DMP_SHT1_EWSW[6]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(DMP_SHT1_EWSW[7]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(DMP_SHT1_EWSW[8]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n411), .Q(DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(DMP_SHT1_EWSW[9]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(DMP_SHT1_EWSW[10]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1075), .Q(DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(DMP_SHT1_EWSW[11]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(DMP_SHT1_EWSW[12]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(DMP_SHT1_EWSW[13]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1078), .Q(DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(DMP_SHT1_EWSW[14]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1062), .Q(DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(DMP_SHT1_EWSW[15]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(DMP_SHT1_EWSW[16]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1075), .Q(DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(DMP_SHT1_EWSW[17]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1060), .Q(DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(DMP_SHT1_EWSW[18]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(DMP_SHT1_EWSW[19]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n425), .Q(DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(DMP_SHT1_EWSW[20]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1089), .Q(DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(DMP_SHT1_EWSW[21]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1078), .Q(DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(DMP_SHT1_EWSW[22]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(DMP_SHT1_EWSW[23]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(DMP_SHT2_EWSW[23]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1077), .Q(DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(DMP_SFG[23]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1087), .Q(DMP_exp_NRM_EW[0]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(DMP_exp_NRM_EW[0]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1088), .Q(DMP_exp_NRM2_EW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(DMP_SHT1_EWSW[24]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1058), .Q(DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(DMP_SHT2_EWSW[24]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(DMP_SFG[24]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1071), .Q(DMP_exp_NRM_EW[1]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(DMP_exp_NRM_EW[1]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1086), .Q(DMP_exp_NRM2_EW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(DMP_SHT1_EWSW[25]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1081), .Q(DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(DMP_SHT2_EWSW[25]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1078), .Q(DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(DMP_SFG[25]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1067), .Q(DMP_exp_NRM_EW[2]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(DMP_exp_NRM_EW[2]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1088), .Q(DMP_exp_NRM2_EW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(DMP_SHT1_EWSW[26]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n411), .Q(DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(DMP_SHT2_EWSW[26]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(DMP_SFG[26]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1086), .Q(DMP_exp_NRM_EW[3]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(DMP_exp_NRM_EW[3]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1087), .Q(DMP_exp_NRM2_EW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(DMP_SHT1_EWSW[27]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n425), .Q(DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(DMP_SHT2_EWSW[27]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1078), .Q(DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(DMP_SFG[27]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1067), .Q(DMP_exp_NRM_EW[4]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(DMP_exp_NRM_EW[4]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1076), .Q(DMP_exp_NRM2_EW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(DMP_SHT1_EWSW[28]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1076), .Q(DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(DMP_SHT2_EWSW[28]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(DMP_SFG[28]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1087), .Q(DMP_exp_NRM_EW[5]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(DMP_exp_NRM_EW[5]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1088), .Q(DMP_exp_NRM2_EW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(DMP_SHT1_EWSW[29]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1077), .Q(DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(DMP_SHT2_EWSW[29]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1084), .Q(DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(DMP_SFG[29]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1085), .Q(DMP_exp_NRM_EW[6]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(DMP_exp_NRM_EW[6]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1089), .Q(DMP_exp_NRM2_EW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(DMP_SHT1_EWSW[30]), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(DMP_SHT2_EWSW[30]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1075), .Q(DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(DMP_SFG[30]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1068), .Q(DMP_exp_NRM_EW[7]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(DMP_exp_NRM_EW[7]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1086), .Q(DMP_exp_NRM2_EW[7]) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1059), .Q(ZERO_FLAG_SHT2) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1079), .Q(OP_FLAG_SHT2) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3656512), .RN(n1078), .Q(SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1061), .Q(ZERO_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(Raw_mant_SGF[2]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1065), .QN(n396) );
  DFFRXLTS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(Raw_mant_SGF[4]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1075), .QN(n395) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(LZD_raw_out_EWR[3]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1078), .Q(LZD_output_NRM2_EW[3])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(LZD_raw_out_EWR[0]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1067), .Q(LZD_output_NRM2_EW[0])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(LZD_raw_out_EWR[2]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1086), .Q(LZD_output_NRM2_EW[2])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(LZD_raw_out_EWR[1]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1087), .Q(LZD_output_NRM2_EW[1])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(LZD_raw_out_EWR[4]), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1088), .Q(LZD_output_NRM2_EW[4])
         );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1068), .Q(SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SFG), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1081), .Q(ZERO_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_NRM), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1084), .Q(ZERO_FLAG_SHT1SHT2) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(SIGN_FLAG_SFG), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1081), .Q(SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(SIGN_FLAG_NRM), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .RN(n1080), .Q(SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(Data_array_SWR[3]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1080), .Q(Data_array_SWR[29]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(Data_array_SWR[2]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1089), .Q(Data_array_SWR[28]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(Data_array_SWR[1]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1084), .Q(Data_array_SWR[27]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(Data_array_SWR[0]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1089), .Q(Data_array_SWR[26]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(sftr_odat_SHT2_SWR[1]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1082), .Q(N60) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(sftr_odat_SHT2_SWR[25]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1088), .QN(n429) );
  CMPR32X2TS DP_OP_15J180_122_6956_U9 ( .A(DMP_exp_NRM2_EW[0]), .B(n946), .C(
        DP_OP_15J180_122_6956_n18), .CO(DP_OP_15J180_122_6956_n8), .S(
        exp_rslt_NRM2_EW1[0]) );
  CMPR32X2TS DP_OP_15J180_122_6956_U8 ( .A(DP_OP_15J180_122_6956_n17), .B(
        DMP_exp_NRM2_EW[1]), .C(DP_OP_15J180_122_6956_n8), .CO(
        DP_OP_15J180_122_6956_n7), .S(exp_rslt_NRM2_EW1[1]) );
  CMPR32X2TS DP_OP_15J180_122_6956_U7 ( .A(DP_OP_15J180_122_6956_n16), .B(
        DMP_exp_NRM2_EW[2]), .C(DP_OP_15J180_122_6956_n7), .CO(
        DP_OP_15J180_122_6956_n6), .S(exp_rslt_NRM2_EW1[2]) );
  CMPR32X2TS DP_OP_15J180_122_6956_U6 ( .A(DP_OP_15J180_122_6956_n15), .B(
        DMP_exp_NRM2_EW[3]), .C(DP_OP_15J180_122_6956_n6), .CO(
        DP_OP_15J180_122_6956_n5), .S(exp_rslt_NRM2_EW1[3]) );
  CMPR32X2TS intadd_428_U4 ( .A(DmP_EXP_EWSW[24]), .B(n1041), .C(intadd_428_CI), .CO(intadd_428_n3), .S(intadd_428_SUM_0_) );
  CMPR32X2TS intadd_428_U3 ( .A(DmP_EXP_EWSW[25]), .B(n1040), .C(intadd_428_n3), .CO(intadd_428_n2), .S(intadd_428_SUM_1_) );
  CMPR32X2TS intadd_428_U2 ( .A(DmP_EXP_EWSW[26]), .B(n1053), .C(intadd_428_n2), .CO(intadd_428_n1), .S(intadd_428_SUM_2_) );
  DFFSX2TS R_0 ( .D(n1054), .CK(INPUT_STAGE_OPERANDY_net3656458), .SN(n1064), 
        .Q(n1092) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(N59), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1075), .Q(Raw_mant_NRM_SWR[0]), 
        .QN(n1052) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(Data_Y[0]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1060), .Q(intDY_EWSW[0]), .QN(
        n1051) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(Data_Y[26]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1080), .Q(intDY_EWSW[26]), .QN(
        n1050) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(Data_Y[15]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1078), .Q(intDY_EWSW[15]), .QN(
        n1049) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(Data_Y[3]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1061), .Q(intDY_EWSW[3]), .QN(
        n1048) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(Data_Y[1]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1063), .Q(intDY_EWSW[1]), .QN(
        n1047) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(Data_Y[11]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1063), .Q(intDY_EWSW[11]), .QN(
        n1046) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(Data_Y[25]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n425), .Q(intDY_EWSW[25]), .QN(
        n1045) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(Data_Y[18]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1071), .Q(intDY_EWSW[18]), .QN(
        n1044) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(Data_Y[17]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n462), .Q(intDY_EWSW[17]), .QN(
        n1043) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(Data_Y[8]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1058), .Q(intDY_EWSW[8]), .QN(
        n1042) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(Data_Y[12]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1076), .Q(intDY_EWSW[12]), .QN(
        n1039) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(Data_Y[27]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1084), .Q(intDY_EWSW[27]), .QN(
        n1038) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(Data_Y[9]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1059), .Q(intDY_EWSW[9]), .QN(
        n1037) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(Data_Y[22]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1078), .Q(intDY_EWSW[22]), .QN(
        n1036) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(Data_Y[20]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1088), .Q(intDY_EWSW[20]), .QN(
        n1035) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(Data_Y[2]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1061), .Q(intDY_EWSW[2]), .QN(
        n1034) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(Data_Y[21]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1067), .Q(intDY_EWSW[21]), .QN(
        n1033) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(Data_Y[13]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1065), .Q(intDY_EWSW[13]), .QN(
        n1032) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(Data_Y[24]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1078), .Q(intDY_EWSW[24]), .QN(
        n1031) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(Data_Y[10]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1061), .Q(intDY_EWSW[10]), .QN(
        n1030) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(Data_Y[4]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1058), .Q(intDY_EWSW[4]), .QN(
        n1029) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(Data_Y[16]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n460), .Q(intDY_EWSW[16]), .QN(
        n1028) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(Data_Y[6]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1064), .Q(intDY_EWSW[6]), .QN(
        n1027) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(Data_Y[5]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1063), .Q(intDY_EWSW[5]), .QN(
        n1026) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(Data_Y[7]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1059), .Q(intDY_EWSW[7]), .QN(
        n1025) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n389), .CK(clk), .RN(
        n1063), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n1024) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_22_ ( .D(DMP_SHT2_EWSW[22]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1076), .Q(DMP_SFG[22]), .QN(n1023) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(Raw_mant_SGF[5]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1065), .Q(Raw_mant_NRM_SWR[5]), 
        .QN(n1021) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(Data_array_SWR[25]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1082), .Q(Data_array_SWR[51]), .QN(
        n1019) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(Data_X[16]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1060), .Q(intDX_EWSW[16]), .QN(
        n1018) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(Data_array_SWR[23]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1068), .Q(Data_array_SWR[49]), .QN(
        n1017) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(Data_X[30]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1060), .Q(intDX_EWSW[30]), .QN(
        n1015) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(Data_X[29]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1059), .Q(intDX_EWSW[29]), .QN(
        n1014) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_20_ ( .D(DMP_SHT2_EWSW[20]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1078), .Q(DMP_SFG[20]), .QN(n1012) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(Data_X[23]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1063), .Q(intDX_EWSW[23]), .QN(
        n1011) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(Data_X[26]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1061), .Q(intDX_EWSW[26]), .QN(
        n1010) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(Data_X[19]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1059), .Q(intDX_EWSW[19]), .QN(
        n1009) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(Data_X[14]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1059), .Q(intDX_EWSW[14]), .QN(
        n1008) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(Data_X[12]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1058), .Q(intDX_EWSW[12]), .QN(
        n1007) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(Data_X[11]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1062), .Q(intDX_EWSW[11]), .QN(
        n1006) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(Data_X[6]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1059), .Q(intDX_EWSW[6]), .QN(
        n1005) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(Data_X[25]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1062), .Q(intDX_EWSW[25]), .QN(
        n1004) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(Data_X[17]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1064), .Q(intDX_EWSW[17]), .QN(
        n1003) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(Data_X[10]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1059), .Q(intDX_EWSW[10]), .QN(
        n1002) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(Data_X[8]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1063), .Q(intDX_EWSW[8]), .QN(
        n1001) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(Data_X[1]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1060), .Q(intDX_EWSW[1]), .QN(
        n1000) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_18_ ( .D(DMP_SHT2_EWSW[18]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1078), .Q(DMP_SFG[18]), .QN(n998) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_17_ ( .D(DMP_SHT2_EWSW[17]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SFG[17]), .QN(n997) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(Data_X[13]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1060), .Q(intDX_EWSW[13]), .QN(
        n996) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(Data_Y[30]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1068), .Q(intDY_EWSW[30]), .QN(
        n995) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_16_ ( .D(DMP_SHT2_EWSW[16]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n461), .Q(DMP_SFG[16]), .QN(n993) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(Raw_mant_SGF[12]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1075), .Q(Raw_mant_NRM_SWR[12]), 
        .QN(n992) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_14_ ( .D(DMP_SHT2_EWSW[14]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SFG[14]), .QN(n991) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_15_ ( .D(DMP_SHT2_EWSW[15]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1077), .Q(DMP_SFG[15]), .QN(n990) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(Raw_mant_SGF[20]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1084), .Q(Raw_mant_NRM_SWR[20]), 
        .QN(n989) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(Raw_mant_SGF[25]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1082), .Q(Raw_mant_NRM_SWR[25]), 
        .QN(n988) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(Raw_mant_SGF[18]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1075), .Q(Raw_mant_NRM_SWR[18]), 
        .QN(n987) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(Raw_mant_SGF[14]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1068), .Q(Raw_mant_NRM_SWR[14]), 
        .QN(n986) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_12_ ( .D(DMP_SHT2_EWSW[12]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SFG[12]), .QN(n984) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(Raw_mant_SGF[17]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1080), .Q(Raw_mant_NRM_SWR[17]), 
        .QN(n983) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(Raw_mant_SGF[1]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1065), .Q(Raw_mant_NRM_SWR[1]), 
        .QN(n982) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(Raw_mant_SGF[3]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1077), .Q(Raw_mant_NRM_SWR[3]), 
        .QN(n980) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(DMP_SHT2_EWSW[10]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n425), .Q(DMP_SFG[10]), .QN(n979) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(Raw_mant_SGF[6]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1076), .Q(Raw_mant_NRM_SWR[6]), 
        .QN(n978) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_8_ ( .D(DMP_SHT2_EWSW[8]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1062), .Q(DMP_SFG[8]), .QN(n976) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_6_ ( .D(DMP_SHT2_EWSW[6]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SFG[6]), .QN(n974) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(DMP_SHT2_EWSW[5]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1077), .Q(DMP_SFG[5]), .QN(n973) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_4_ ( .D(DMP_SHT2_EWSW[4]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1065), .Q(DMP_SFG[4]), .QN(n972) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_2_ ( .D(DMP_SHT2_EWSW[2]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1081), .Q(DMP_SFG[2]), .QN(n970) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_0_ ( .D(DMP_SHT2_EWSW[0]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SFG[0]), .QN(n969) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(Data_Y[14]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1077), .Q(intDY_EWSW[14]), .QN(
        n967) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(Data_Y[19]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1073), .Q(intDY_EWSW[19]), .QN(
        n966) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n388), .CK(clk), .RN(
        n1064), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]), .QN(n965) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(Data_array_SWR[24]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n425), .Q(Data_array_SWR[50]), .QN(
        n964) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(Data_Y[23]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1075), .Q(intDY_EWSW[23]), .QN(
        n963) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_21_ ( .D(DMP_SHT2_EWSW[21]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1075), .Q(DMP_SFG[21]), .QN(n962) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_19_ ( .D(DMP_SHT2_EWSW[19]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1081), .Q(DMP_SFG[19]), .QN(n960) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(Data_X[24]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1059), .Q(intDX_EWSW[24]), .QN(
        n959) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(Data_X[27]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1061), .Q(intDX_EWSW[27]), .QN(
        n958) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(Data_X[22]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1063), .Q(intDX_EWSW[22]), .QN(
        n957) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(Data_X[20]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1062), .Q(intDX_EWSW[20]), .QN(
        n956) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(Data_X[18]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1064), .Q(intDX_EWSW[18]), .QN(
        n955) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(Data_X[9]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1060), .Q(intDX_EWSW[9]), .QN(
        n954) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(Data_X[21]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1060), .Q(intDX_EWSW[21]), .QN(
        n953) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(Data_X[15]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1058), .Q(intDX_EWSW[15]), .QN(
        n952) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(Data_X[3]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1062), .Q(intDX_EWSW[3]), .QN(
        n951) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(Data_Y[29]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n425), .Q(intDY_EWSW[29]), .QN(
        n950) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_13_ ( .D(DMP_SHT2_EWSW[13]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1077), .Q(DMP_SFG[13]), .QN(n948) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_11_ ( .D(DMP_SHT2_EWSW[11]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1076), .Q(DMP_SFG[11]), .QN(n947) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(DMP_SHT2_EWSW[9]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SFG[9]), .QN(n945) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_7_ ( .D(DMP_SHT2_EWSW[7]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1079), .Q(DMP_SFG[7]), .QN(n944) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_3_ ( .D(DMP_SHT2_EWSW[3]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1076), .Q(DMP_SFG[3]), .QN(n942) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_1_ ( .D(DMP_SHT2_EWSW[1]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1074), .Q(DMP_SFG[1]), .QN(n941) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(n1094), .CK(clk), .RN(
        n1058), .Q(inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n940) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(n412), .CK(clk), .RN(n1059), .Q(ready) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(formatted_number_W[23]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1067), .Q(final_result_ieee[23])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(formatted_number_W[24]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1087), .Q(final_result_ieee[24])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(formatted_number_W[25]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1089), .Q(final_result_ieee[25])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(formatted_number_W[26]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1085), .Q(final_result_ieee[26])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(formatted_number_W[27]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1086), .Q(final_result_ieee[27])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(formatted_number_W[28]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1076), .Q(final_result_ieee[28])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(formatted_number_W[29]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1067), .Q(final_result_ieee[29])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(formatted_number_W[30]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1088), .Q(final_result_ieee[30])
         );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(array_comparators_LTComparator_N0), 
        .CK(FRMT_STAGE_DATAOUT_net3656458), .RN(n1075), .Q(underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(array_comparators_GTComparator_N0), 
        .CK(FRMT_STAGE_DATAOUT_net3656458), .RN(n1086), .Q(overflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT1SHT2), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1082), .Q(zero_flag) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(formatted_number_W[31]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1084), .Q(final_result_ieee[31])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(formatted_number_W[8]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1082), .Q(final_result_ieee[8])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(formatted_number_W[9]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1065), .Q(final_result_ieee[9])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(formatted_number_W[10]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1068), .Q(final_result_ieee[10])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(formatted_number_W[11]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1074), .Q(final_result_ieee[11])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(formatted_number_W[12]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1075), .Q(final_result_ieee[12])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(formatted_number_W[13]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1084), .Q(final_result_ieee[13])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(formatted_number_W[0]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1075), .Q(final_result_ieee[0])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(formatted_number_W[1]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n411), .Q(final_result_ieee[1]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(formatted_number_W[2]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n411), .Q(final_result_ieee[2]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(formatted_number_W[3]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n411), .Q(final_result_ieee[3]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(formatted_number_W[4]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n411), .Q(final_result_ieee[4]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(formatted_number_W[5]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n411), .Q(final_result_ieee[5]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(formatted_number_W[6]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n411), .Q(final_result_ieee[6]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(formatted_number_W[7]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1067), .Q(final_result_ieee[7])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(formatted_number_W[14]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1087), .Q(final_result_ieee[14])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(formatted_number_W[15]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1081), .Q(final_result_ieee[15])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(formatted_number_W[16]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1085), .Q(final_result_ieee[16])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(formatted_number_W[17]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1086), .Q(final_result_ieee[17])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(formatted_number_W[18]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1082), .Q(final_result_ieee[18])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(formatted_number_W[19]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1087), .Q(final_result_ieee[19])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(formatted_number_W[20]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1085), .Q(final_result_ieee[20])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(formatted_number_W[21]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1075), .Q(final_result_ieee[21])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(formatted_number_W[22]), .CK(
        FRMT_STAGE_DATAOUT_net3656458), .RN(n1087), .Q(final_result_ieee[22])
         );
  DFFRX1TS inst_ShiftRegister_Q_reg_4_ ( .D(Shift_reg_FLAGS_7_5), .CK(
        inst_ShiftRegister_net3656620), .RN(n1062), .Q(busy) );
  CMPR32X2TS DP_OP_15J180_122_6956_U5 ( .A(DP_OP_15J180_122_6956_n14), .B(
        DMP_exp_NRM2_EW[4]), .C(DP_OP_15J180_122_6956_n5), .CO(
        DP_OP_15J180_122_6956_n4), .S(exp_rslt_NRM2_EW1[4]) );
  CMPR32X2TS DP_OP_15J180_122_6956_U4 ( .A(n946), .B(DMP_exp_NRM2_EW[5]), .C(
        DP_OP_15J180_122_6956_n4), .CO(DP_OP_15J180_122_6956_n3), .S(
        exp_rslt_NRM2_EW1[5]) );
  CMPR32X2TS DP_OP_15J180_122_6956_U3 ( .A(n946), .B(DMP_exp_NRM2_EW[6]), .C(
        DP_OP_15J180_122_6956_n3), .CO(DP_OP_15J180_122_6956_n2), .S(
        exp_rslt_NRM2_EW1[6]) );
  CMPR32X2TS DP_OP_15J180_122_6956_U2 ( .A(n946), .B(DMP_exp_NRM2_EW[7]), .C(
        DP_OP_15J180_122_6956_n2), .CO(DP_OP_15J180_122_6956_n1), .S(
        exp_rslt_NRM2_EW1[7]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(sftr_odat_SHT2_SWR[2]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1082), .Q(DmP_mant_SFG_SWR[2]) );
  DFFSX2TS SFT2FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n428), .CK(
        SFT2FRMT_STAGE_VARS_net3656530), .SN(n1086), .Q(n946), .QN(
        ADD_OVRFLW_NRM2) );
  DFFRX2TS inst_ShiftRegister_Q_reg_1_ ( .D(Shift_reg_FLAGS_7[2]), .CK(
        inst_ShiftRegister_net3656620), .RN(n1060), .Q(Shift_reg_FLAGS_7[1]), 
        .QN(n1093) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(Data_X[7]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1064), .QN(n1057) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(Data_X[5]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1061), .QN(n1055) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(Data_X[4]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1062), .Q(intDX_EWSW[4]), .QN(
        n1056) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_26_ ( .D(DMP_INIT_EWSW[26]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1070), .Q(DMP_EXP_EWSW[26]), .QN(n1053) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(Raw_mant_SGF[22]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1076), .Q(Raw_mant_NRM_SWR[22]), 
        .QN(n949) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(Raw_mant_SGF[11]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1083), .Q(Raw_mant_NRM_SWR[11])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(Raw_mant_SGF[13]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1083), .Q(Raw_mant_NRM_SWR[13])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(Raw_mant_SGF[23]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1083), .Q(Raw_mant_NRM_SWR[23])
         );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(sftr_odat_SHT2_SWR[24]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1077), .Q(DmP_mant_SFG_SWR[24]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(Raw_mant_SGF[24]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1083), .Q(Raw_mant_NRM_SWR[24])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(Raw_mant_SGF[10]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1083), .Q(Raw_mant_NRM_SWR[10])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(Raw_mant_SGF[16]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1083), .Q(Raw_mant_NRM_SWR[16])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(Raw_mant_SGF[21]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1083), .Q(Raw_mant_NRM_SWR[21])
         );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(Data_Y[28]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1068), .Q(intDY_EWSW[28]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(sftr_odat_SHT2_SWR[20]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1086), .Q(DmP_mant_SFG_SWR[20]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(sftr_odat_SHT2_SWR[18]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1087), .Q(DmP_mant_SFG_SWR[18]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(sftr_odat_SHT2_SWR[16]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1085), .Q(DmP_mant_SFG_SWR[16]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(sftr_odat_SHT2_SWR[8]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n411), .Q(DmP_mant_SFG_SWR[8]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(sftr_odat_SHT2_SWR[6]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n411), .Q(DmP_mant_SFG_SWR[6]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(sftr_odat_SHT2_SWR[4]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n411), .Q(DmP_mant_SFG_SWR[4]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(sftr_odat_SHT2_SWR[14]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n425), .Q(DmP_mant_SFG_SWR[14]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(sftr_odat_SHT2_SWR[12]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1083), .Q(DmP_mant_SFG_SWR[12]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(sftr_odat_SHT2_SWR[10]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1083), .Q(DmP_mant_SFG_SWR[10]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(sftr_odat_SHT2_SWR[22]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1086), .Q(DmP_mant_SFG_SWR[22]) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(shft_value_mux_o_EWR[3]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1083), .Q(shift_value_SHT2_EWR[3])
         );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(Raw_mant_SGF[7]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1078), .Q(Raw_mant_NRM_SWR[7]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(Data_array_SWR[16]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1058), .Q(Data_array_SWR[42]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(Data_array_SWR[17]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1080), .Q(Data_array_SWR[43]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(Raw_mant_SGF[19]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1084), .Q(Raw_mant_NRM_SWR[19])
         );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(Data_array_SWR[18]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1081), .Q(Data_array_SWR[44]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(Data_array_SWR[19]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1068), .Q(Data_array_SWR[45]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(Raw_mant_SGF[8]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1089), .Q(Raw_mant_NRM_SWR[8]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(Data_array_SWR[9]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1070), .Q(Data_array_SWR[35]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(Data_array_SWR[8]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1068), .Q(Data_array_SWR[34]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(Data_array_SWR[10]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1081), .Q(Data_array_SWR[36]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(Data_array_SWR[11]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1082), .Q(Data_array_SWR[37]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(Data_X[2]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1061), .Q(intDX_EWSW[2]), .QN(
        n400) );
  DFFRX1TS SHT2_STAGE_SHFTVARS2_Q_reg_0_ ( .D(n410), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1081), .Q(bit_shift_SHT2) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(sftr_odat_SHT2_SWR[19]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1064), .Q(DmP_mant_SFG_SWR[19]), .QN(
        n398) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(sftr_odat_SHT2_SWR[17]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1087), .Q(DmP_mant_SFG_SWR[17]), .QN(
        n397) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(Data_array_SWR[21]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n425), .Q(Data_array_SWR[47]), .QN(
        n961) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(Data_array_SWR[22]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1080), .Q(Data_array_SWR[48]), .QN(
        n1016) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(Data_array_SWR[20]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1084), .Q(Data_array_SWR[46]), .QN(
        n1022) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(Data_array_SWR[15]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n411), .Q(Data_array_SWR[41]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(Data_X[0]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1063), .Q(intDX_EWSW[0]), .QN(
        n401) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(Data_X[31]), .CK(
        INPUT_STAGE_OPERANDY_net3656458), .RN(n1061), .Q(intDX_EWSW[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(Data_array_SWR[13]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1080), .Q(Data_array_SWR[39]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(Data_array_SWR[12]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1082), .Q(Data_array_SWR[38]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(Data_array_SWR[14]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1081), .Q(Data_array_SWR[40]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(Raw_mant_SGF[9]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1075), .Q(Raw_mant_NRM_SWR[9]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(Raw_mant_SGF[15]), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1080), .Q(Raw_mant_NRM_SWR[15])
         );
  DFFRX4TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(shft_value_mux_o_EWR[4]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1081), .Q(shift_value_SHT2_EWR[4]), 
        .QN(n994) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(sftr_odat_SHT2_SWR[0]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1084), .Q(N59) );
  DFFRX1TS NRM_STAGE_FLAGS_Q_reg_2_ ( .D(ADD_OVRFLW_SGF), .CK(
        NRM_STAGE_Raw_mant_net3656494), .RN(n1088), .Q(ADD_OVRFLW_NRM), .QN(
        n428) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(Data_array_SWR[6]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n425), .Q(Data_array_SWR[32]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(Data_array_SWR[7]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1074), .Q(Data_array_SWR[33]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(Data_array_SWR[5]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1068), .Q(Data_array_SWR[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(Data_array_SWR[4]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n425), .Q(Data_array_SWR[30]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(sftr_odat_SHT2_SWR[9]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n411), .Q(DmP_mant_SFG_SWR[9]), .QN(
        n975) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(sftr_odat_SHT2_SWR[23]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1088), .Q(DmP_mant_SFG_SWR[23]), .QN(
        n1020) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(sftr_odat_SHT2_SWR[21]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1067), .Q(DmP_mant_SFG_SWR[21]), .QN(
        n1013) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(sftr_odat_SHT2_SWR[7]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n411), .Q(DmP_mant_SFG_SWR[7]), .QN(
        n943) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(sftr_odat_SHT2_SWR[5]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n411), .Q(DmP_mant_SFG_SWR[5]), .QN(
        n971) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(sftr_odat_SHT2_SWR[3]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1079), .Q(DmP_mant_SFG_SWR[3]), .QN(
        n968) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(sftr_odat_SHT2_SWR[15]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1084), .Q(DmP_mant_SFG_SWR[15]), .QN(
        n985) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(sftr_odat_SHT2_SWR[11]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1082), .Q(DmP_mant_SFG_SWR[11]), .QN(
        n977) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(sftr_odat_SHT2_SWR[13]), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1080), .Q(DmP_mant_SFG_SWR[13]), .QN(
        n981) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_25_ ( .D(DMP_INIT_EWSW[25]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n462), .Q(DMP_EXP_EWSW[25]), .QN(n1040)
         );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_24_ ( .D(DMP_INIT_EWSW[24]), .CK(
        EXP_STAGE_DMP_net3656512), .RN(n1071), .Q(DMP_EXP_EWSW[24]), .QN(n1041) );
  DFFRX1TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(shft_value_mux_o_EWR[2]), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1083), .Q(shift_value_SHT2_EWR[2]), 
        .QN(n999) );
  DFFRX4TS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n1090), .CK(
        SHT2_SHIFT_DATA_net3656494), .RN(n1080), .Q(left_right_SHT2), .QN(n394) );
  DFFRX4TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3656512), .RN(n1079), .Q(n393), .QN(n1091) );
  NAND2X4TS U582 ( .A(n665), .B(n660), .Y(n653) );
  AOI211X2TS U583 ( .A0(Data_array_SWR[42]), .A1(n465), .B0(n499), .C0(n498), 
        .Y(n552) );
  AOI211X2TS U584 ( .A0(Data_array_SWR[43]), .A1(n465), .B0(n499), .C0(n476), 
        .Y(n524) );
  AOI222X4TS U585 ( .A0(DMP_SFG[16]), .A1(DmP_mant_SFG_SWR[18]), .B0(
        DMP_SFG[16]), .B1(n648), .C0(DmP_mant_SFG_SWR[18]), .C1(n648), .Y(n773) );
  AOI222X4TS U586 ( .A0(DMP_SFG[12]), .A1(DmP_mant_SFG_SWR[14]), .B0(
        DMP_SFG[12]), .B1(n636), .C0(DmP_mant_SFG_SWR[14]), .C1(n636), .Y(n891) );
  AOI222X4TS U587 ( .A0(DMP_SFG[10]), .A1(DmP_mant_SFG_SWR[12]), .B0(
        DMP_SFG[10]), .B1(n625), .C0(DmP_mant_SFG_SWR[12]), .C1(n625), .Y(n630) );
  NAND2X1TS U588 ( .A(n763), .B(n436), .Y(n765) );
  NOR2X1TS U589 ( .A(Raw_mant_NRM_SWR[14]), .B(n441), .Y(n436) );
  NOR2XLTS U590 ( .A(n405), .B(n511), .Y(n512) );
  OAI21XLTS U591 ( .A0(n639), .A1(n641), .B0(n638), .Y(n637) );
  OAI21XLTS U592 ( .A0(n659), .A1(n902), .B0(n658), .Y(n657) );
  OAI21XLTS U593 ( .A0(n633), .A1(n635), .B0(n632), .Y(n631) );
  OAI21XLTS U594 ( .A0(n729), .A1(n653), .B0(n728), .Y(Data_array_SWR[4]) );
  OAI21XLTS U595 ( .A0(n741), .A1(n653), .B0(n740), .Y(Data_array_SWR[20]) );
  OAI21XLTS U596 ( .A0(n718), .A1(n653), .B0(n688), .Y(Data_array_SWR[17]) );
  OAI21XLTS U597 ( .A0(n932), .A1(n414), .B0(n679), .Y(Data_array_SWR[25]) );
  OAI22X1TS U598 ( .A0(DmP_mant_SFG_SWR[16]), .A1(n991), .B0(n641), .B1(n640), 
        .Y(n743) );
  OAI22X1TS U599 ( .A0(DmP_mant_SFG_SWR[6]), .A1(n972), .B0(n546), .B1(n545), 
        .Y(n560) );
  XOR2X1TS U600 ( .A(n917), .B(n429), .Y(Raw_mant_SGF[25]) );
  XOR2X1TS U601 ( .A(n910), .B(n909), .Y(Raw_mant_SGF[24]) );
  XOR2X1TS U602 ( .A(n905), .B(n904), .Y(Raw_mant_SGF[23]) );
  OAI21X1TS U603 ( .A0(n736), .A1(n653), .B0(n686), .Y(Data_array_SWR[21]) );
  OAI21X1TS U604 ( .A0(n697), .A1(n653), .B0(n696), .Y(Data_array_SWR[3]) );
  OAI21X1TS U605 ( .A0(n725), .A1(n408), .B0(n681), .Y(Data_array_SWR[6]) );
  OAI21X1TS U606 ( .A0(n712), .A1(n414), .B0(n694), .Y(Data_array_SWR[9]) );
  OAI21X1TS U607 ( .A0(n713), .A1(n408), .B0(n677), .Y(Data_array_SWR[10]) );
  OAI21X1TS U608 ( .A0(n932), .A1(n404), .B0(n668), .Y(Data_array_SWR[22]) );
  OAI21X1TS U609 ( .A0(n731), .A1(n653), .B0(n701), .Y(Data_array_SWR[15]) );
  OAI21X1TS U610 ( .A0(n731), .A1(n408), .B0(n671), .Y(Data_array_SWR[14]) );
  OAI21X1TS U611 ( .A0(n707), .A1(n653), .B0(n684), .Y(Data_array_SWR[2]) );
  AOI222X4TS U612 ( .A0(DMP_SFG[22]), .A1(DmP_mant_SFG_SWR[24]), .B0(
        DMP_SFG[22]), .B1(n908), .C0(DmP_mant_SFG_SWR[24]), .C1(n908), .Y(n913) );
  OAI21X1TS U613 ( .A0(n725), .A1(n653), .B0(n706), .Y(Data_array_SWR[7]) );
  OAI21X1TS U614 ( .A0(n724), .A1(n653), .B0(n690), .Y(Data_array_SWR[5]) );
  OAI21X1TS U615 ( .A0(n719), .A1(n653), .B0(n699), .Y(Data_array_SWR[19]) );
  OAI21X1TS U616 ( .A0(n711), .A1(n653), .B0(n710), .Y(Data_array_SWR[1]) );
  OAI21X1TS U617 ( .A0(n730), .A1(n414), .B0(n692), .Y(Data_array_SWR[13]) );
  OAI21X1TS U618 ( .A0(n735), .A1(n414), .B0(n734), .Y(Data_array_SWR[12]) );
  OAI21X1TS U619 ( .A0(n719), .A1(n408), .B0(n674), .Y(Data_array_SWR[18]) );
  OAI21X1TS U620 ( .A0(n717), .A1(n414), .B0(n716), .Y(Data_array_SWR[8]) );
  OAI21X1TS U621 ( .A0(n723), .A1(n653), .B0(n722), .Y(Data_array_SWR[16]) );
  OAI21X1TS U622 ( .A0(n713), .A1(n414), .B0(n703), .Y(Data_array_SWR[11]) );
  XOR2X1TS U623 ( .A(n900), .B(n899), .Y(Raw_mant_SGF[21]) );
  OAI21X1TS U624 ( .A0(n652), .A1(n655), .B0(n651), .Y(n650) );
  AOI222X4TS U625 ( .A0(DMP_SFG[20]), .A1(DmP_mant_SFG_SWR[22]), .B0(
        DMP_SFG[20]), .B1(n817), .C0(DmP_mant_SFG_SWR[22]), .C1(n817), .Y(n903) );
  XOR2X1TS U626 ( .A(n777), .B(n776), .Y(Raw_mant_SGF[19]) );
  OAI211X1TS U627 ( .A0(n707), .A1(n424), .B0(n711), .C0(n661), .Y(
        Data_array_SWR[0]) );
  OAI21X1TS U628 ( .A0(n645), .A1(n647), .B0(n644), .Y(n643) );
  AOI222X4TS U629 ( .A0(DMP_SFG[18]), .A1(DmP_mant_SFG_SWR[20]), .B0(
        DMP_SFG[18]), .B1(n656), .C0(DmP_mant_SFG_SWR[20]), .C1(n656), .Y(n896) );
  AND2X2TS U630 ( .A(n665), .B(n664), .Y(n666) );
  AOI222X4TS U631 ( .A0(DMP_SFG[14]), .A1(DmP_mant_SFG_SWR[16]), .B0(
        DMP_SFG[14]), .B1(n642), .C0(DmP_mant_SFG_SWR[16]), .C1(n642), .Y(n742) );
  AOI22X1TS U632 ( .A0(DMP_SFG[13]), .A1(n985), .B0(n893), .B1(n892), .Y(n640)
         );
  NOR2X6TS U633 ( .A(array_comparators_LTComparator_N0), .B(
        array_comparators_GTComparator_N0), .Y(n475) );
  AND3X2TS U634 ( .A(n435), .B(exp_rslt_NRM2_EW1[7]), .C(n434), .Y(
        array_comparators_GTComparator_N0) );
  NAND2BX1TS U635 ( .AN(n755), .B(n422), .Y(n764) );
  AOI31X1TS U636 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n456), .A2(n992), .B0(n455), 
        .Y(n457) );
  AOI222X4TS U637 ( .A0(DMP_SFG[8]), .A1(DmP_mant_SFG_SWR[10]), .B0(DMP_SFG[8]), .B1(n579), .C0(DmP_mant_SFG_SWR[10]), .C1(n579), .Y(n619) );
  NAND2BX1TS U638 ( .AN(n765), .B(Raw_mant_NRM_SWR[10]), .Y(n760) );
  NAND3BX1TS U639 ( .AN(n864), .B(n862), .C(n861), .Y(n882) );
  AOI222X4TS U640 ( .A0(DMP_SFG[6]), .A1(DmP_mant_SFG_SWR[8]), .B0(DMP_SFG[6]), 
        .B1(n568), .C0(DmP_mant_SFG_SWR[8]), .C1(n568), .Y(n573) );
  AOI22X2TS U641 ( .A0(DMP_SFG[5]), .A1(n943), .B0(n561), .B1(n560), .Y(n566)
         );
  NOR2X1TS U642 ( .A(Raw_mant_NRM_SWR[10]), .B(n765), .Y(n437) );
  AOI31X1TS U643 ( .A0(Raw_mant_NRM_SWR[16]), .A1(n454), .A2(n983), .B0(n757), 
        .Y(n446) );
  AOI31X1TS U644 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n454), .A2(n453), .B0(n757), 
        .Y(n458) );
  AOI222X4TS U645 ( .A0(DMP_SFG[4]), .A1(DmP_mant_SFG_SWR[6]), .B0(DMP_SFG[4]), 
        .B1(n547), .C0(DmP_mant_SFG_SWR[6]), .C1(n547), .Y(n562) );
  OAI22X1TS U646 ( .A0(DmP_mant_SFG_SWR[4]), .A1(n970), .B0(n534), .B1(n533), 
        .Y(n539) );
  OAI211X1TS U647 ( .A0(n822), .A1(n879), .B0(n821), .C0(n820), .Y(n828) );
  NAND2X4TS U648 ( .A(n406), .B(n994), .Y(n510) );
  CLKBUFX3TS U649 ( .A(n469), .Y(n418) );
  NOR2X4TS U650 ( .A(n406), .B(n511), .Y(n473) );
  INVX1TS U651 ( .A(n440), .Y(n454) );
  OAI211XLTS U652 ( .A0(intDX_EWSW[8]), .A1(n1042), .B0(n845), .C0(n848), .Y(
        n859) );
  AOI222X4TS U653 ( .A0(DMP_SFG[2]), .A1(DmP_mant_SFG_SWR[4]), .B0(DMP_SFG[2]), 
        .B1(n535), .C0(DmP_mant_SFG_SWR[4]), .C1(n535), .Y(n541) );
  OAI211XLTS U654 ( .A0(n1048), .A1(intDX_EWSW[3]), .B0(n833), .C0(n832), .Y(
        n836) );
  NAND2X4TS U655 ( .A(n405), .B(n994), .Y(n466) );
  INVX1TS U656 ( .A(n747), .Y(n749) );
  INVX1TS U657 ( .A(n756), .Y(n758) );
  NOR2X4TS U658 ( .A(shift_value_SHT2_EWR[4]), .B(n588), .Y(n469) );
  CLKINVX3TS U659 ( .A(n494), .Y(n468) );
  NAND3X1TS U660 ( .A(n1050), .B(n819), .C(intDX_EWSW[26]), .Y(n821) );
  OAI211X2TS U661 ( .A0(intDX_EWSW[12]), .A1(n1039), .B0(n855), .C0(n841), .Y(
        n857) );
  OAI21X1TS U662 ( .A0(Raw_mant_NRM_SWR[24]), .A1(n443), .B0(n988), .Y(n444)
         );
  INVX3TS U663 ( .A(n916), .Y(n912) );
  OAI211X2TS U664 ( .A0(intDX_EWSW[20]), .A1(n1035), .B0(n875), .C0(n860), .Y(
        n869) );
  NOR2X6TS U665 ( .A(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .Y(n465) );
  NAND2BX1TS U666 ( .AN(intDX_EWSW[24]), .B(intDY_EWSW[24]), .Y(n876) );
  NAND2BX1TS U667 ( .AN(intDX_EWSW[19]), .B(intDY_EWSW[19]), .Y(n866) );
  NAND2BX1TS U668 ( .AN(intDX_EWSW[21]), .B(intDY_EWSW[21]), .Y(n860) );
  NOR3X1TS U669 ( .A(Raw_mant_NRM_SWR[15]), .B(Raw_mant_NRM_SWR[16]), .C(
        Raw_mant_NRM_SWR[17]), .Y(n756) );
  NOR3X1TS U670 ( .A(Raw_mant_NRM_SWR[19]), .B(Raw_mant_NRM_SWR[20]), .C(
        Raw_mant_NRM_SWR[21]), .Y(n750) );
  NAND2BX1TS U671 ( .AN(intDY_EWSW[27]), .B(intDX_EWSW[27]), .Y(n820) );
  NAND2BX1TS U672 ( .AN(intDX_EWSW[27]), .B(intDY_EWSW[27]), .Y(n819) );
  NOR3X1TS U673 ( .A(Raw_mant_NRM_SWR[12]), .B(Raw_mant_NRM_SWR[13]), .C(
        Raw_mant_NRM_SWR[11]), .Y(n763) );
  OAI32X2TS U674 ( .A0(n916), .A1(n915), .A2(n914), .B0(n913), .B1(n912), .Y(
        n917) );
  NAND2BXLTS U675 ( .AN(intDX_EWSW[2]), .B(intDY_EWSW[2]), .Y(n832) );
  AOI2BB2XLTS U676 ( .B0(intDX_EWSW[3]), .B1(n1048), .A0N(intDY_EWSW[2]), 
        .A1N(n834), .Y(n835) );
  NAND2BXLTS U677 ( .AN(intDY_EWSW[9]), .B(intDX_EWSW[9]), .Y(n847) );
  NAND3XLTS U678 ( .A(n1042), .B(n845), .C(intDX_EWSW[8]), .Y(n846) );
  NOR2XLTS U679 ( .A(n843), .B(intDY_EWSW[10]), .Y(n844) );
  OAI21XLTS U680 ( .A0(intDX_EWSW[13]), .A1(n1032), .B0(intDX_EWSW[12]), .Y(
        n842) );
  NOR2XLTS U681 ( .A(n878), .B(intDY_EWSW[24]), .Y(n818) );
  NAND2BXLTS U682 ( .AN(intDX_EWSW[9]), .B(intDY_EWSW[9]), .Y(n845) );
  NAND2BXLTS U683 ( .AN(intDX_EWSW[13]), .B(intDY_EWSW[13]), .Y(n841) );
  OAI21XLTS U684 ( .A0(intDX_EWSW[23]), .A1(n963), .B0(intDX_EWSW[22]), .Y(
        n871) );
  BUFX4TS U685 ( .A(n1093), .Y(n682) );
  NAND2X1TS U686 ( .A(n750), .B(n747), .Y(n440) );
  OAI22X1TS U687 ( .A0(DmP_mant_SFG_SWR[14]), .A1(n984), .B0(n635), .B1(n634), 
        .Y(n892) );
  OAI22X1TS U688 ( .A0(DmP_mant_SFG_SWR[8]), .A1(n974), .B0(n567), .B1(n566), 
        .Y(n571) );
  CLKAND2X2TS U689 ( .A(DmP_mant_SFG_SWR[8]), .B(n974), .Y(n567) );
  OAI22X1TS U690 ( .A0(DmP_mant_SFG_SWR[18]), .A1(n993), .B0(n647), .B1(n646), 
        .Y(n774) );
  OAI22X1TS U691 ( .A0(DmP_mant_SFG_SWR[20]), .A1(n998), .B0(n655), .B1(n654), 
        .Y(n897) );
  CLKAND2X2TS U692 ( .A(DmP_mant_SFG_SWR[16]), .B(n991), .Y(n641) );
  AOI22X1TS U693 ( .A0(DMP_SFG[7]), .A1(n975), .B0(n572), .B1(n571), .Y(n577)
         );
  CLKAND2X2TS U694 ( .A(DmP_mant_SFG_SWR[10]), .B(n976), .Y(n578) );
  OAI22X1TS U695 ( .A0(DmP_mant_SFG_SWR[12]), .A1(n979), .B0(n624), .B1(n623), 
        .Y(n628) );
  OAI22X1TS U696 ( .A0(DmP_mant_SFG_SWR[10]), .A1(n976), .B0(n578), .B1(n577), 
        .Y(n617) );
  AOI22X1TS U697 ( .A0(DMP_SFG[19]), .A1(n1013), .B0(n898), .B1(n897), .Y(n901) );
  OAI21XLTS U698 ( .A0(n494), .A1(n1019), .B0(n491), .Y(n492) );
  OAI21XLTS U699 ( .A0(n494), .A1(n964), .B0(n493), .Y(n495) );
  AOI211X1TS U700 ( .A0(n420), .A1(Data_array_SWR[45]), .B0(n496), .C0(n490), 
        .Y(n507) );
  OAI21XLTS U701 ( .A0(n494), .A1(n1017), .B0(n489), .Y(n490) );
  AO22XLTS U702 ( .A0(Data_array_SWR[44]), .A1(n469), .B0(n416), .B1(
        Data_array_SWR[40]), .Y(n487) );
  AOI211X1TS U703 ( .A0(Data_array_SWR[44]), .A1(n420), .B0(n496), .C0(n482), 
        .Y(n509) );
  OAI21XLTS U704 ( .A0(n1016), .A1(n494), .B0(n481), .Y(n482) );
  AO22XLTS U705 ( .A0(n469), .A1(Data_array_SWR[45]), .B0(n416), .B1(
        Data_array_SWR[41]), .Y(n480) );
  AOI22X1TS U706 ( .A0(DMP_SFG[3]), .A1(n971), .B0(n540), .B1(n539), .Y(n545)
         );
  CLKAND2X2TS U707 ( .A(DmP_mant_SFG_SWR[6]), .B(n972), .Y(n546) );
  AOI22X1TS U708 ( .A0(DMP_SFG[11]), .A1(n981), .B0(n629), .B1(n628), .Y(n634)
         );
  CLKAND2X2TS U709 ( .A(DmP_mant_SFG_SWR[14]), .B(n984), .Y(n635) );
  CLKAND2X2TS U710 ( .A(DmP_mant_SFG_SWR[18]), .B(n993), .Y(n647) );
  AOI22X1TS U711 ( .A0(DMP_SFG[15]), .A1(n397), .B0(n744), .B1(n743), .Y(n646)
         );
  AOI22X1TS U712 ( .A0(DMP_SFG[17]), .A1(n398), .B0(n775), .B1(n774), .Y(n654)
         );
  CLKAND2X2TS U713 ( .A(DmP_mant_SFG_SWR[20]), .B(n998), .Y(n655) );
  AOI22X1TS U714 ( .A0(DMP_SFG[9]), .A1(n977), .B0(n618), .B1(n617), .Y(n623)
         );
  CLKAND2X2TS U715 ( .A(DmP_mant_SFG_SWR[12]), .B(n979), .Y(n624) );
  NAND2BXLTS U716 ( .AN(Raw_mant_NRM_SWR[23]), .B(n949), .Y(n450) );
  INVX2TS U717 ( .A(n447), .Y(n448) );
  AOI22X1TS U718 ( .A0(DMP_SFG[1]), .A1(n968), .B0(n529), .B1(n528), .Y(n533)
         );
  CLKAND2X2TS U719 ( .A(DmP_mant_SFG_SWR[4]), .B(n970), .Y(n534) );
  NAND2X1TS U720 ( .A(DMP_SFG[0]), .B(DmP_mant_SFG_SWR[2]), .Y(n887) );
  AO22XLTS U721 ( .A0(n935), .A1(LZD_raw_out_EWR[4]), .B0(
        Shift_amount_SHT1_EWR[4]), .B1(n934), .Y(shft_value_mux_o_EWR[4]) );
  XOR2XLTS U722 ( .A(n895), .B(n894), .Y(Raw_mant_SGF[15]) );
  OAI21XLTS U723 ( .A0(DmP_mant_SFG_SWR[15]), .A1(n948), .B0(n893), .Y(n894)
         );
  XOR2XLTS U724 ( .A(n570), .B(n569), .Y(Raw_mant_SGF[9]) );
  OAI21XLTS U725 ( .A0(n565), .A1(n567), .B0(n564), .Y(n563) );
  XOR2XLTS U726 ( .A(n549), .B(n548), .Y(Raw_mant_SGF[7]) );
  AO22XLTS U727 ( .A0(n1090), .A1(LZD_raw_out_EWR[3]), .B0(
        Shift_amount_SHT1_EWR[3]), .B1(n934), .Y(shft_value_mux_o_EWR[3]) );
  XOR2XLTS U728 ( .A(n627), .B(n626), .Y(Raw_mant_SGF[13]) );
  XOR2XLTS U729 ( .A(n581), .B(n580), .Y(Raw_mant_SGF[11]) );
  AO22XLTS U730 ( .A0(n935), .A1(LZD_raw_out_EWR[2]), .B0(
        Shift_amount_SHT1_EWR[2]), .B1(n1093), .Y(shft_value_mux_o_EWR[2]) );
  CLKAND2X2TS U731 ( .A(n475), .B(sftr_odat_SHT2_SWR[24]), .Y(
        formatted_number_W[22]) );
  CLKAND2X2TS U732 ( .A(n475), .B(sftr_odat_SHT2_SWR[23]), .Y(
        formatted_number_W[21]) );
  CLKAND2X2TS U733 ( .A(n475), .B(sftr_odat_SHT2_SWR[22]), .Y(
        formatted_number_W[20]) );
  CLKAND2X2TS U734 ( .A(n426), .B(sftr_odat_SHT2_SWR[21]), .Y(
        formatted_number_W[19]) );
  CLKAND2X2TS U735 ( .A(n426), .B(sftr_odat_SHT2_SWR[20]), .Y(
        formatted_number_W[18]) );
  CLKAND2X2TS U736 ( .A(n426), .B(sftr_odat_SHT2_SWR[19]), .Y(
        formatted_number_W[17]) );
  CLKAND2X2TS U737 ( .A(n426), .B(sftr_odat_SHT2_SWR[18]), .Y(
        formatted_number_W[16]) );
  CLKAND2X2TS U738 ( .A(n426), .B(sftr_odat_SHT2_SWR[17]), .Y(
        formatted_number_W[15]) );
  CLKAND2X2TS U739 ( .A(n475), .B(sftr_odat_SHT2_SWR[16]), .Y(
        formatted_number_W[14]) );
  CLKAND2X2TS U740 ( .A(n475), .B(sftr_odat_SHT2_SWR[9]), .Y(
        formatted_number_W[7]) );
  CLKAND2X2TS U741 ( .A(n475), .B(sftr_odat_SHT2_SWR[8]), .Y(
        formatted_number_W[6]) );
  CLKAND2X2TS U742 ( .A(n426), .B(sftr_odat_SHT2_SWR[7]), .Y(
        formatted_number_W[5]) );
  CLKAND2X2TS U743 ( .A(n426), .B(sftr_odat_SHT2_SWR[6]), .Y(
        formatted_number_W[4]) );
  CLKAND2X2TS U744 ( .A(n426), .B(sftr_odat_SHT2_SWR[5]), .Y(
        formatted_number_W[3]) );
  CLKAND2X2TS U745 ( .A(n426), .B(sftr_odat_SHT2_SWR[4]), .Y(
        formatted_number_W[2]) );
  CLKAND2X2TS U746 ( .A(n475), .B(sftr_odat_SHT2_SWR[3]), .Y(
        formatted_number_W[1]) );
  CLKAND2X2TS U747 ( .A(n475), .B(sftr_odat_SHT2_SWR[2]), .Y(
        formatted_number_W[0]) );
  CLKAND2X2TS U748 ( .A(n475), .B(sftr_odat_SHT2_SWR[15]), .Y(
        formatted_number_W[13]) );
  CLKAND2X2TS U749 ( .A(n475), .B(sftr_odat_SHT2_SWR[14]), .Y(
        formatted_number_W[12]) );
  CLKAND2X2TS U750 ( .A(n475), .B(sftr_odat_SHT2_SWR[13]), .Y(
        formatted_number_W[11]) );
  CLKAND2X2TS U751 ( .A(n475), .B(sftr_odat_SHT2_SWR[12]), .Y(
        formatted_number_W[10]) );
  CLKAND2X2TS U752 ( .A(n475), .B(sftr_odat_SHT2_SWR[11]), .Y(
        formatted_number_W[9]) );
  CLKAND2X2TS U753 ( .A(n475), .B(sftr_odat_SHT2_SWR[10]), .Y(
        formatted_number_W[8]) );
  AOI2BB1XLTS U754 ( .A0N(array_comparators_LTComparator_N0), .A1N(
        SIGN_FLAG_SHT1SHT2), .B0(array_comparators_GTComparator_N0), .Y(
        formatted_number_W[31]) );
  OR2X1TS U755 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[6]), .Y(formatted_number_W[29]) );
  OR2X1TS U756 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[5]), .Y(formatted_number_W[28]) );
  OR2X1TS U757 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[4]), .Y(formatted_number_W[27]) );
  OR2X1TS U758 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[3]), .Y(formatted_number_W[26]) );
  OR2X1TS U759 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[1]), .Y(formatted_number_W[24]) );
  OR2X1TS U760 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[0]), .Y(formatted_number_W[23]) );
  OAI21XLTS U761 ( .A0(n544), .A1(n546), .B0(n543), .Y(n542) );
  XOR2XLTS U762 ( .A(n746), .B(n745), .Y(Raw_mant_SGF[17]) );
  OAI21XLTS U763 ( .A0(n622), .A1(n624), .B0(n621), .Y(n620) );
  OAI21XLTS U764 ( .A0(n510), .A1(n556), .B0(n555), .Y(sftr_odat_SHT2_SWR[1])
         );
  AOI211X1TS U765 ( .A0(n759), .A1(n758), .B0(n757), .C0(n768), .Y(n761) );
  INVX2TS U766 ( .A(n406), .Y(n608) );
  OR2X1TS U767 ( .A(shift_value_SHT2_EWR[4]), .B(n497), .Y(n399) );
  INVX2TS U768 ( .A(n705), .Y(n403) );
  INVX2TS U769 ( .A(n705), .Y(n404) );
  INVX2TS U770 ( .A(left_right_SHT2), .Y(n405) );
  INVX2TS U771 ( .A(n405), .Y(n406) );
  INVX2TS U772 ( .A(n666), .Y(n407) );
  INVX4TS U773 ( .A(n666), .Y(n408) );
  INVX4TS U774 ( .A(n924), .Y(n927) );
  INVX4TS U775 ( .A(n921), .Y(n923) );
  INVX4TS U776 ( .A(n919), .Y(n928) );
  CLKINVX3TS U777 ( .A(n679), .Y(n409) );
  CLKINVX3TS U778 ( .A(n679), .Y(n410) );
  OAI221X1TS U779 ( .A0(n1002), .A1(intDY_EWSW[10]), .B0(n400), .B1(
        intDY_EWSW[2]), .C0(n783), .Y(n786) );
  OAI221X1TS U780 ( .A0(n951), .A1(intDY_EWSW[3]), .B0(n1010), .B1(
        intDY_EWSW[26]), .C0(n791), .Y(n794) );
  OAI221X1TS U781 ( .A0(n956), .A1(intDY_EWSW[20]), .B0(n1015), .B1(
        intDY_EWSW[30]), .C0(n805), .Y(n812) );
  AOI221X1TS U782 ( .A0(intDX_EWSW[30]), .A1(n995), .B0(intDX_EWSW[29]), .B1(
        n950), .C0(n825), .Y(n827) );
  NOR2X2TS U783 ( .A(n587), .B(n999), .Y(n499) );
  CLKINVX3TS U784 ( .A(rst), .Y(n461) );
  BUFX4TS U785 ( .A(n1076), .Y(n1074) );
  OAI21XLTS U786 ( .A0(n559), .A1(n466), .B0(n553), .Y(sftr_odat_SHT2_SWR[25])
         );
  OAI211X1TS U787 ( .A0(n994), .A1(n559), .B0(n502), .C0(n501), .Y(n520) );
  AOI21X2TS U788 ( .A0(n465), .A1(Data_array_SWR[51]), .B0(n500), .Y(n559) );
  BUFX4TS U789 ( .A(n1071), .Y(n1065) );
  BUFX4TS U790 ( .A(n1069), .Y(n1079) );
  BUFX4TS U791 ( .A(n462), .Y(n1075) );
  BUFX4TS U792 ( .A(n1071), .Y(n1078) );
  OAI211X1TS U793 ( .A0(n994), .A1(n584), .B0(n583), .C0(n582), .Y(n596) );
  AOI21X2TS U794 ( .A0(Data_array_SWR[48]), .A1(n465), .B0(n500), .Y(n584) );
  OAI211X1TS U795 ( .A0(n994), .A1(n601), .B0(n600), .C0(n599), .Y(n611) );
  AOI21X2TS U796 ( .A0(n465), .A1(Data_array_SWR[49]), .B0(n500), .Y(n601) );
  INVX4TS U797 ( .A(rst), .Y(n411) );
  CLKBUFX2TS U798 ( .A(n1073), .Y(n1085) );
  BUFX4TS U799 ( .A(n1071), .Y(n1059) );
  BUFX4TS U800 ( .A(n1073), .Y(n1060) );
  BUFX4TS U801 ( .A(n1066), .Y(n1063) );
  BUFX4TS U802 ( .A(n1072), .Y(n1061) );
  AOI21X2TS U803 ( .A0(n465), .A1(Data_array_SWR[50]), .B0(n500), .Y(n556) );
  AOI21X2TS U804 ( .A0(n465), .A1(Data_array_SWR[46]), .B0(n589), .Y(n605) );
  AOI21X2TS U805 ( .A0(n465), .A1(Data_array_SWR[47]), .B0(n586), .Y(n610) );
  AOI222X4TS U806 ( .A0(DmP_mant_SFG_SWR[2]), .A1(n969), .B0(
        DmP_mant_SFG_SWR[2]), .B1(n888), .C0(n969), .C1(n888), .Y(n529) );
  OR2X1TS U807 ( .A(N60), .B(N59), .Y(n888) );
  INVX2TS U808 ( .A(n402), .Y(n412) );
  OAI21XLTS U809 ( .A0(n510), .A1(n559), .B0(n558), .Y(sftr_odat_SHT2_SWR[0])
         );
  BUFX4TS U810 ( .A(n682), .Y(n934) );
  INVX2TS U811 ( .A(n653), .Y(n413) );
  INVX2TS U812 ( .A(n413), .Y(n414) );
  OAI21X2TS U813 ( .A0(n663), .A1(n980), .B0(n662), .Y(n738) );
  BUFX4TS U814 ( .A(n918), .Y(n926) );
  AOI222X4TS U815 ( .A0(n682), .A1(DmP_mant_SHT1_SW[1]), .B0(n1090), .B1(
        Raw_mant_NRM_SWR[22]), .C0(Raw_mant_NRM_SWR[3]), .C1(n409), .Y(n697)
         );
  INVX2TS U816 ( .A(n470), .Y(n415) );
  INVX2TS U817 ( .A(n415), .Y(n416) );
  INVX2TS U818 ( .A(n415), .Y(n417) );
  INVX2TS U819 ( .A(n399), .Y(n419) );
  INVX2TS U820 ( .A(n399), .Y(n420) );
  OAI2BB1X1TS U821 ( .A0N(n935), .A1N(Raw_mant_NRM_SWR[15]), .B0(n675), .Y(
        n715) );
  NOR2X1TS U822 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[8]), .Y(n766)
         );
  NOR4X1TS U823 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[13]), .C(
        Raw_mant_NRM_SWR[11]), .D(n762), .Y(n442) );
  INVX2TS U824 ( .A(n395), .Y(n422) );
  INVX2TS U825 ( .A(n396), .Y(n423) );
  INVX2TS U826 ( .A(n739), .Y(n424) );
  NOR2X4TS U827 ( .A(n665), .B(n664), .Y(n739) );
  BUFX3TS U828 ( .A(n424), .Y(n933) );
  OAI221X1TS U829 ( .A0(n958), .A1(intDY_EWSW[27]), .B0(n1009), .B1(
        intDY_EWSW[19]), .C0(n799), .Y(n802) );
  OAI221X1TS U830 ( .A0(n1003), .A1(intDY_EWSW[17]), .B0(n1018), .B1(
        intDY_EWSW[16]), .C0(n807), .Y(n810) );
  OAI221X1TS U831 ( .A0(n1057), .A1(intDY_EWSW[7]), .B0(n1008), .B1(
        intDY_EWSW[14]), .C0(n789), .Y(n796) );
  BUFX3TS U832 ( .A(n462), .Y(n425) );
  BUFX3TS U833 ( .A(n461), .Y(n462) );
  NOR2X2TS U834 ( .A(n986), .B(n441), .Y(n757) );
  NOR3X6TS U835 ( .A(n435), .B(exp_rslt_NRM2_EW1[7]), .C(n432), .Y(
        array_comparators_LTComparator_N0) );
  XNOR2X2TS U836 ( .A(DP_OP_15J180_122_6956_n1), .B(ADD_OVRFLW_NRM2), .Y(n435)
         );
  OAI21X2TS U837 ( .A0(n978), .A1(n679), .B0(n678), .Y(n727) );
  OAI21X2TS U838 ( .A0(n987), .A1(n679), .B0(n672), .Y(n721) );
  OAI21X2TS U839 ( .A0(n986), .A1(n679), .B0(n669), .Y(n733) );
  NAND2X2TS U840 ( .A(Shift_reg_FLAGS_7[1]), .B(ADD_OVRFLW_NRM), .Y(n679) );
  AOI222X4TS U841 ( .A0(n682), .A1(DmP_mant_SHT1_SW[0]), .B0(n1090), .B1(
        Raw_mant_NRM_SWR[23]), .C0(n423), .C1(n410), .Y(n707) );
  OAI21XLTS U842 ( .A0(intDX_EWSW[3]), .A1(n1048), .B0(intDX_EWSW[2]), .Y(n834) );
  NOR2X4TS U843 ( .A(n660), .B(n665), .Y(n705) );
  INVX4TS U844 ( .A(n924), .Y(n925) );
  BUFX4TS U845 ( .A(n918), .Y(n924) );
  BUFX3TS U846 ( .A(n475), .Y(n426) );
  AOI21X2TS U847 ( .A0(n465), .A1(Data_array_SWR[45]), .B0(n467), .Y(n598) );
  AOI21X2TS U848 ( .A0(n465), .A1(Data_array_SWR[44]), .B0(n483), .Y(n614) );
  NAND2X2TS U849 ( .A(bit_shift_SHT2), .B(shift_value_SHT2_EWR[3]), .Y(n587)
         );
  NAND3X2TS U850 ( .A(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .C(n994), .Y(n494) );
  OAI221X4TS U851 ( .A0(n427), .A1(intDY_EWSW[28]), .B0(n1005), .B1(
        intDY_EWSW[6]), .C0(n797), .Y(n804) );
  OAI32X1TS U852 ( .A0(Raw_mant_NRM_SWR[23]), .A1(Raw_mant_NRM_SWR[21]), .A2(
        n989), .B0(n949), .B1(Raw_mant_NRM_SWR[23]), .Y(n443) );
  NOR2XLTS U853 ( .A(Raw_mant_NRM_SWR[20]), .B(Raw_mant_NRM_SWR[21]), .Y(n452)
         );
  NOR2XLTS U854 ( .A(Raw_mant_NRM_SWR[16]), .B(Raw_mant_NRM_SWR[17]), .Y(n453)
         );
  NOR4X2TS U855 ( .A(Raw_mant_NRM_SWR[24]), .B(Raw_mant_NRM_SWR[25]), .C(
        Raw_mant_NRM_SWR[22]), .D(Raw_mant_NRM_SWR[23]), .Y(n747) );
  NOR2XLTS U856 ( .A(Raw_mant_NRM_SWR[13]), .B(Raw_mant_NRM_SWR[11]), .Y(n748)
         );
  INVX2TS U857 ( .A(intDX_EWSW[28]), .Y(n824) );
  OAI21XLTS U858 ( .A0(intDX_EWSW[1]), .A1(n1047), .B0(intDX_EWSW[0]), .Y(n831) );
  OAI21XLTS U859 ( .A0(intDX_EWSW[15]), .A1(n1049), .B0(intDX_EWSW[14]), .Y(
        n851) );
  NOR2XLTS U860 ( .A(n864), .B(intDY_EWSW[16]), .Y(n865) );
  OAI21XLTS U861 ( .A0(intDX_EWSW[21]), .A1(n1033), .B0(intDX_EWSW[20]), .Y(
        n863) );
  OR2X1TS U862 ( .A(ADD_OVRFLW_NRM2), .B(LZD_output_NRM2_EW[0]), .Y(n780) );
  OR2X1TS U863 ( .A(n499), .B(n496), .Y(n488) );
  NAND2X1TS U864 ( .A(n769), .B(n978), .Y(n755) );
  OAI21XLTS U865 ( .A0(DmP_mant_SFG_SWR[21]), .A1(n960), .B0(n898), .Y(n899)
         );
  OAI21XLTS U866 ( .A0(n576), .A1(n578), .B0(n575), .Y(n574) );
  OR2X1TS U867 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[2]), .Y(formatted_number_W[25]) );
  OAI21XLTS U868 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(n937), .B0(
        n936), .Y(n388) );
  OR2X2TS U869 ( .A(ADD_OVRFLW_NRM), .B(n934), .Y(n663) );
  INVX4TS U870 ( .A(n663), .Y(n1090) );
  OR4X2TS U871 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[2]), .C(
        exp_rslt_NRM2_EW1[1]), .D(exp_rslt_NRM2_EW1[0]), .Y(n431) );
  OR4X2TS U872 ( .A(exp_rslt_NRM2_EW1[6]), .B(exp_rslt_NRM2_EW1[5]), .C(
        exp_rslt_NRM2_EW1[4]), .D(n431), .Y(n432) );
  AND4X1TS U873 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[2]), .C(
        exp_rslt_NRM2_EW1[1]), .D(exp_rslt_NRM2_EW1[0]), .Y(n433) );
  AND4X1TS U874 ( .A(exp_rslt_NRM2_EW1[6]), .B(exp_rslt_NRM2_EW1[5]), .C(
        exp_rslt_NRM2_EW1[4]), .D(n433), .Y(n434) );
  NOR2X1TS U875 ( .A(Raw_mant_NRM_SWR[18]), .B(n440), .Y(n759) );
  NAND2X1TS U876 ( .A(n759), .B(n756), .Y(n441) );
  INVX2TS U877 ( .A(n436), .Y(n762) );
  NOR2X1TS U878 ( .A(Raw_mant_NRM_SWR[13]), .B(n762), .Y(n456) );
  OAI21X1TS U879 ( .A0(n440), .A1(n987), .B0(n760), .Y(n455) );
  NAND2X1TS U880 ( .A(n766), .B(n437), .Y(n447) );
  NOR2X2TS U881 ( .A(Raw_mant_NRM_SWR[7]), .B(n447), .Y(n769) );
  AOI21X1TS U882 ( .A0(Raw_mant_NRM_SWR[0]), .A1(n982), .B0(n423), .Y(n438) );
  NOR3X2TS U883 ( .A(Raw_mant_NRM_SWR[5]), .B(n422), .C(n755), .Y(n752) );
  NAND2X1TS U884 ( .A(n752), .B(n980), .Y(n772) );
  OAI22X1TS U885 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n764), .B0(n438), .B1(n772), 
        .Y(n439) );
  AOI211X1TS U886 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n456), .B0(n455), .C0(n439), 
        .Y(n754) );
  AOI22X1TS U887 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n442), .B0(
        Raw_mant_NRM_SWR[6]), .B1(n769), .Y(n445) );
  NAND4X1TS U888 ( .A(n754), .B(n446), .C(n445), .D(n444), .Y(
        LZD_raw_out_EWR[0]) );
  OA21XLTS U889 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n423), .B0(n752), .Y(n449) );
  OAI31X1TS U890 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n449), .A2(
        Raw_mant_NRM_SWR[6]), .B0(n448), .Y(n771) );
  NOR2X1TS U891 ( .A(Raw_mant_NRM_SWR[24]), .B(Raw_mant_NRM_SWR[25]), .Y(n451)
         );
  AOI32X1TS U892 ( .A0(n452), .A1(n451), .A2(Raw_mant_NRM_SWR[19]), .B0(n450), 
        .B1(n451), .Y(n459) );
  NAND4X1TS U893 ( .A(n771), .B(n459), .C(n458), .D(n457), .Y(
        LZD_raw_out_EWR[1]) );
  AOI33XLTS U894 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .B0(n965), .B1(n940), .B2(n1024), 
        .Y(n390) );
  BUFX3TS U895 ( .A(n461), .Y(n1071) );
  BUFX3TS U896 ( .A(n461), .Y(n1070) );
  BUFX3TS U897 ( .A(n461), .Y(n1069) );
  CLKBUFX2TS U898 ( .A(n461), .Y(n460) );
  CLKBUFX2TS U899 ( .A(n461), .Y(n463) );
  BUFX3TS U900 ( .A(n461), .Y(n1072) );
  CLKBUFX2TS U901 ( .A(n462), .Y(n1089) );
  BUFX3TS U902 ( .A(n1069), .Y(n1088) );
  BUFX3TS U903 ( .A(n1069), .Y(n1084) );
  BUFX3TS U904 ( .A(n1072), .Y(n1086) );
  BUFX3TS U905 ( .A(n1066), .Y(n1087) );
  CLKBUFX2TS U906 ( .A(n461), .Y(n464) );
  BUFX3TS U907 ( .A(n1069), .Y(n1062) );
  BUFX3TS U908 ( .A(n1073), .Y(n1067) );
  BUFX3TS U909 ( .A(n461), .Y(n1066) );
  BUFX3TS U910 ( .A(n461), .Y(n1073) );
  BUFX3TS U911 ( .A(n1072), .Y(n1082) );
  BUFX3TS U912 ( .A(n1066), .Y(n1068) );
  BUFX3TS U913 ( .A(n1073), .Y(n1083) );
  BUFX3TS U914 ( .A(n462), .Y(n1077) );
  BUFX3TS U915 ( .A(n462), .Y(n1081) );
  BUFX3TS U916 ( .A(n1071), .Y(n1080) );
  BUFX3TS U917 ( .A(n1072), .Y(n1058) );
  BUFX3TS U918 ( .A(n1070), .Y(n1076) );
  BUFX3TS U919 ( .A(n1066), .Y(n1064) );
  NOR2BX2TS U920 ( .AN(bit_shift_SHT2), .B(n465), .Y(n500) );
  NAND2BX2TS U921 ( .AN(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .Y(n588) );
  OAI21X1TS U922 ( .A0(n588), .A1(n1017), .B0(n587), .Y(n467) );
  NAND2X1TS U923 ( .A(shift_value_SHT2_EWR[3]), .B(n999), .Y(n497) );
  AOI22X1TS U924 ( .A0(n468), .A1(Data_array_SWR[41]), .B0(n419), .B1(
        Data_array_SWR[37]), .Y(n472) );
  NOR2BX1TS U925 ( .AN(n465), .B(shift_value_SHT2_EWR[4]), .Y(n470) );
  AOI22X1TS U926 ( .A0(n469), .A1(Data_array_SWR[33]), .B0(n416), .B1(
        Data_array_SWR[29]), .Y(n471) );
  OAI211X1TS U927 ( .A0(n598), .A1(n994), .B0(n472), .C0(n471), .Y(n515) );
  NAND2X1TS U928 ( .A(shift_value_SHT2_EWR[4]), .B(bit_shift_SHT2), .Y(n511)
         );
  AOI21X1TS U929 ( .A0(left_right_SHT2), .A1(n515), .B0(n473), .Y(n474) );
  OAI21X1TS U930 ( .A0(n584), .A1(n466), .B0(n474), .Y(sftr_odat_SHT2_SWR[22])
         );
  OAI22X1TS U931 ( .A0(n588), .A1(n961), .B0(n497), .B1(n1019), .Y(n476) );
  AOI22X1TS U932 ( .A0(n418), .A1(Data_array_SWR[31]), .B0(n417), .B1(
        Data_array_SWR[27]), .Y(n478) );
  AOI22X1TS U933 ( .A0(n468), .A1(Data_array_SWR[39]), .B0(n419), .B1(
        Data_array_SWR[35]), .Y(n477) );
  OAI211X1TS U934 ( .A0(n524), .A1(n994), .B0(n478), .C0(n477), .Y(n554) );
  AOI21X1TS U935 ( .A0(left_right_SHT2), .A1(n554), .B0(n473), .Y(n479) );
  OAI21X1TS U936 ( .A0(n556), .A1(n466), .B0(n479), .Y(sftr_odat_SHT2_SWR[24])
         );
  INVX2TS U937 ( .A(n511), .Y(n496) );
  AOI211X1TS U938 ( .A0(n420), .A1(Data_array_SWR[49]), .B0(n488), .C0(n480), 
        .Y(n508) );
  AOI22X1TS U939 ( .A0(n418), .A1(Data_array_SWR[40]), .B0(n417), .B1(
        Data_array_SWR[36]), .Y(n481) );
  AOI22X1TS U940 ( .A0(n406), .A1(n508), .B0(n509), .B1(n608), .Y(
        sftr_odat_SHT2_SWR[10]) );
  OAI21X1TS U941 ( .A0(n588), .A1(n1016), .B0(n587), .Y(n483) );
  AOI22X1TS U942 ( .A0(n468), .A1(Data_array_SWR[40]), .B0(n419), .B1(
        Data_array_SWR[36]), .Y(n485) );
  AOI22X1TS U943 ( .A0(n469), .A1(Data_array_SWR[32]), .B0(n417), .B1(
        Data_array_SWR[28]), .Y(n484) );
  OAI211X1TS U944 ( .A0(n614), .A1(n994), .B0(n485), .C0(n484), .Y(n513) );
  AOI21X1TS U945 ( .A0(left_right_SHT2), .A1(n513), .B0(n473), .Y(n486) );
  OAI21X1TS U946 ( .A0(n601), .A1(n466), .B0(n486), .Y(sftr_odat_SHT2_SWR[23])
         );
  AOI211X1TS U947 ( .A0(Data_array_SWR[48]), .A1(n420), .B0(n488), .C0(n487), 
        .Y(n506) );
  AOI22X1TS U948 ( .A0(n418), .A1(Data_array_SWR[41]), .B0(n417), .B1(
        Data_array_SWR[37]), .Y(n489) );
  AOI22X1TS U949 ( .A0(left_right_SHT2), .A1(n506), .B0(n507), .B1(n608), .Y(
        sftr_odat_SHT2_SWR[11]) );
  AOI22X1TS U950 ( .A0(n469), .A1(Data_array_SWR[43]), .B0(n416), .B1(
        Data_array_SWR[39]), .Y(n491) );
  AOI211X1TS U951 ( .A0(n420), .A1(Data_array_SWR[47]), .B0(n496), .C0(n492), 
        .Y(n504) );
  AOI22X1TS U952 ( .A0(n469), .A1(Data_array_SWR[42]), .B0(n416), .B1(
        Data_array_SWR[38]), .Y(n493) );
  AOI211X1TS U953 ( .A0(n420), .A1(Data_array_SWR[46]), .B0(n496), .C0(n495), 
        .Y(n505) );
  AOI22X1TS U954 ( .A0(n406), .A1(n504), .B0(n505), .B1(n608), .Y(
        sftr_odat_SHT2_SWR[12]) );
  OAI22X1TS U955 ( .A0(n588), .A1(n1022), .B0(n497), .B1(n964), .Y(n498) );
  AOI22X1TS U956 ( .A0(n418), .A1(Data_array_SWR[39]), .B0(n419), .B1(
        Data_array_SWR[43]), .Y(n502) );
  AOI22X1TS U957 ( .A0(n417), .A1(Data_array_SWR[35]), .B0(n468), .B1(
        Data_array_SWR[47]), .Y(n501) );
  AOI21X1TS U958 ( .A0(n406), .A1(n520), .B0(n473), .Y(n503) );
  OAI21X1TS U959 ( .A0(n552), .A1(n466), .B0(n503), .Y(sftr_odat_SHT2_SWR[16])
         );
  AOI22X1TS U960 ( .A0(left_right_SHT2), .A1(n505), .B0(n504), .B1(n405), .Y(
        sftr_odat_SHT2_SWR[13]) );
  AOI22X1TS U961 ( .A0(n406), .A1(n507), .B0(n506), .B1(n405), .Y(
        sftr_odat_SHT2_SWR[14]) );
  AOI22X1TS U962 ( .A0(left_right_SHT2), .A1(n509), .B0(n508), .B1(n405), .Y(
        sftr_odat_SHT2_SWR[15]) );
  BUFX3TS U963 ( .A(n512), .Y(n606) );
  AOI21X1TS U964 ( .A0(n608), .A1(n513), .B0(n606), .Y(n514) );
  OAI21X1TS U965 ( .A0(n601), .A1(n510), .B0(n514), .Y(sftr_odat_SHT2_SWR[2])
         );
  AOI21X1TS U966 ( .A0(n608), .A1(n515), .B0(n606), .Y(n516) );
  OAI21X1TS U967 ( .A0(n510), .A1(n584), .B0(n516), .Y(sftr_odat_SHT2_SWR[3])
         );
  AOI22X1TS U968 ( .A0(n468), .A1(Data_array_SWR[46]), .B0(n419), .B1(
        Data_array_SWR[42]), .Y(n518) );
  AOI22X1TS U969 ( .A0(n469), .A1(Data_array_SWR[38]), .B0(n416), .B1(
        Data_array_SWR[34]), .Y(n517) );
  OAI211X1TS U970 ( .A0(n994), .A1(n556), .B0(n518), .C0(n517), .Y(n522) );
  AOI21X1TS U971 ( .A0(n608), .A1(n522), .B0(n606), .Y(n519) );
  OAI21X1TS U972 ( .A0(n524), .A1(n510), .B0(n519), .Y(sftr_odat_SHT2_SWR[8])
         );
  AOI21X1TS U973 ( .A0(n608), .A1(n520), .B0(n606), .Y(n521) );
  OAI21X1TS U974 ( .A0(n552), .A1(n510), .B0(n521), .Y(sftr_odat_SHT2_SWR[9])
         );
  AOI21X1TS U975 ( .A0(left_right_SHT2), .A1(n522), .B0(n473), .Y(n523) );
  OAI21X1TS U976 ( .A0(n524), .A1(n466), .B0(n523), .Y(sftr_odat_SHT2_SWR[17])
         );
  NAND2X1TS U977 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n940), .Y(n937)
         );
  NAND2X1TS U978 ( .A(n965), .B(inst_FSM_INPUT_ENABLE_state_reg[0]), .Y(n936)
         );
  NAND2X1TS U979 ( .A(DmP_EXP_EWSW[23]), .B(n430), .Y(n527) );
  OAI21XLTS U980 ( .A0(DmP_EXP_EWSW[23]), .A1(n430), .B0(n527), .Y(
        Shift_amount_EXP_EW[0]) );
  INVX2TS U981 ( .A(intadd_428_SUM_0_), .Y(Shift_amount_EXP_EW[1]) );
  INVX2TS U982 ( .A(intadd_428_SUM_1_), .Y(Shift_amount_EXP_EW[2]) );
  CLKBUFX2TS U983 ( .A(n1091), .Y(n916) );
  AOI22X1TS U984 ( .A0(n912), .A1(n529), .B0(n887), .B1(n916), .Y(n526) );
  NAND2X1TS U985 ( .A(DmP_mant_SFG_SWR[3]), .B(n941), .Y(n528) );
  OAI21XLTS U986 ( .A0(DmP_mant_SFG_SWR[3]), .A1(n941), .B0(n528), .Y(n525) );
  XOR2XLTS U987 ( .A(n526), .B(n525), .Y(Raw_mant_SGF[3]) );
  INVX2TS U988 ( .A(intadd_428_SUM_2_), .Y(Shift_amount_EXP_EW[3]) );
  INVX2TS U989 ( .A(n527), .Y(intadd_428_CI) );
  NOR2X1TS U990 ( .A(DmP_mant_SFG_SWR[4]), .B(n970), .Y(n532) );
  AOI222X4TS U991 ( .A0(n941), .A1(n887), .B0(n941), .B1(n968), .C0(n887), 
        .C1(n968), .Y(n535) );
  BUFX3TS U992 ( .A(n1091), .Y(n649) );
  AOI22X1TS U993 ( .A0(n912), .A1(n533), .B0(n535), .B1(n649), .Y(n531) );
  OAI21XLTS U994 ( .A0(n532), .A1(n534), .B0(n531), .Y(n530) );
  OAI31X1TS U995 ( .A0(n532), .A1(n531), .A2(n534), .B0(n530), .Y(
        Raw_mant_SGF[4]) );
  AOI22X1TS U996 ( .A0(n912), .A1(n539), .B0(n541), .B1(n649), .Y(n537) );
  NAND2X1TS U997 ( .A(DmP_mant_SFG_SWR[5]), .B(n942), .Y(n540) );
  OAI21XLTS U998 ( .A0(DmP_mant_SFG_SWR[5]), .A1(n942), .B0(n540), .Y(n536) );
  XOR2XLTS U999 ( .A(n537), .B(n536), .Y(Raw_mant_SGF[5]) );
  OAI211X1TS U1000 ( .A0(n940), .A1(n936), .B0(n937), .C0(beg_OP), .Y(n538) );
  INVX2TS U1001 ( .A(n538), .Y(enable_Pipeline_input) );
  NOR2X1TS U1002 ( .A(DmP_mant_SFG_SWR[6]), .B(n972), .Y(n544) );
  AOI222X4TS U1003 ( .A0(n541), .A1(n942), .B0(n541), .B1(n971), .C0(n942), 
        .C1(n971), .Y(n547) );
  AOI22X1TS U1004 ( .A0(n912), .A1(n545), .B0(n547), .B1(n649), .Y(n543) );
  OAI31X1TS U1005 ( .A0(n544), .A1(n543), .A2(n546), .B0(n542), .Y(
        Raw_mant_SGF[6]) );
  AOI22X1TS U1006 ( .A0(n912), .A1(n560), .B0(n562), .B1(n649), .Y(n549) );
  NAND2X1TS U1007 ( .A(DmP_mant_SFG_SWR[7]), .B(n973), .Y(n561) );
  OAI21XLTS U1008 ( .A0(DmP_mant_SFG_SWR[7]), .A1(n973), .B0(n561), .Y(n548)
         );
  AOI22X1TS U1009 ( .A0(n418), .A1(Data_array_SWR[30]), .B0(n420), .B1(
        Data_array_SWR[34]), .Y(n551) );
  AOI22X1TS U1010 ( .A0(n417), .A1(Data_array_SWR[26]), .B0(n468), .B1(
        Data_array_SWR[38]), .Y(n550) );
  OAI211X1TS U1011 ( .A0(n552), .A1(n994), .B0(n551), .C0(n550), .Y(n557) );
  AOI21X1TS U1012 ( .A0(left_right_SHT2), .A1(n557), .B0(n473), .Y(n553) );
  AOI21X1TS U1013 ( .A0(n405), .A1(n554), .B0(n606), .Y(n555) );
  AOI21X1TS U1014 ( .A0(n405), .A1(n557), .B0(n606), .Y(n558) );
  NOR2X1TS U1015 ( .A(DmP_mant_SFG_SWR[8]), .B(n974), .Y(n565) );
  AOI222X4TS U1016 ( .A0(n562), .A1(n973), .B0(n562), .B1(n943), .C0(n973), 
        .C1(n943), .Y(n568) );
  AOI22X1TS U1017 ( .A0(n912), .A1(n566), .B0(n568), .B1(n649), .Y(n564) );
  OAI31X1TS U1018 ( .A0(n565), .A1(n564), .A2(n567), .B0(n563), .Y(
        Raw_mant_SGF[8]) );
  AOI22X1TS U1019 ( .A0(n912), .A1(n571), .B0(n573), .B1(n649), .Y(n570) );
  NAND2X1TS U1020 ( .A(DmP_mant_SFG_SWR[9]), .B(n944), .Y(n572) );
  OAI21XLTS U1021 ( .A0(DmP_mant_SFG_SWR[9]), .A1(n944), .B0(n572), .Y(n569)
         );
  NOR2X1TS U1022 ( .A(DmP_mant_SFG_SWR[10]), .B(n976), .Y(n576) );
  AOI222X4TS U1023 ( .A0(n573), .A1(n944), .B0(n573), .B1(n975), .C0(n944), 
        .C1(n975), .Y(n579) );
  AOI22X1TS U1024 ( .A0(n912), .A1(n577), .B0(n579), .B1(n649), .Y(n575) );
  OAI31X1TS U1025 ( .A0(n576), .A1(n575), .A2(n578), .B0(n574), .Y(
        Raw_mant_SGF[10]) );
  AOI22X1TS U1026 ( .A0(n912), .A1(n617), .B0(n619), .B1(n649), .Y(n581) );
  NAND2X1TS U1027 ( .A(DmP_mant_SFG_SWR[11]), .B(n945), .Y(n618) );
  OAI21XLTS U1028 ( .A0(DmP_mant_SFG_SWR[11]), .A1(n945), .B0(n618), .Y(n580)
         );
  AOI22X1TS U1029 ( .A0(Data_array_SWR[44]), .A1(n468), .B0(Data_array_SWR[40]), .B1(n420), .Y(n583) );
  AOI22X1TS U1030 ( .A0(n418), .A1(Data_array_SWR[36]), .B0(Data_array_SWR[32]), .B1(n417), .Y(n582) );
  AOI21X1TS U1031 ( .A0(left_right_SHT2), .A1(n596), .B0(n473), .Y(n585) );
  OAI21X1TS U1032 ( .A0(n598), .A1(n466), .B0(n585), .Y(sftr_odat_SHT2_SWR[19]) );
  OAI21X1TS U1033 ( .A0(n588), .A1(n1019), .B0(n587), .Y(n586) );
  OAI21X1TS U1034 ( .A0(n588), .A1(n964), .B0(n587), .Y(n589) );
  AOI22X1TS U1035 ( .A0(n468), .A1(Data_array_SWR[42]), .B0(n419), .B1(
        Data_array_SWR[38]), .Y(n591) );
  AOI22X1TS U1036 ( .A0(n418), .A1(Data_array_SWR[34]), .B0(n416), .B1(
        Data_array_SWR[30]), .Y(n590) );
  OAI211X1TS U1037 ( .A0(n605), .A1(n994), .B0(n591), .C0(n590), .Y(n607) );
  AOI21X1TS U1038 ( .A0(left_right_SHT2), .A1(n607), .B0(n473), .Y(n592) );
  OAI21X1TS U1039 ( .A0(n610), .A1(n466), .B0(n592), .Y(sftr_odat_SHT2_SWR[21]) );
  AOI22X1TS U1040 ( .A0(n468), .A1(Data_array_SWR[43]), .B0(n419), .B1(
        Data_array_SWR[39]), .Y(n594) );
  AOI22X1TS U1041 ( .A0(n418), .A1(Data_array_SWR[35]), .B0(n416), .B1(
        Data_array_SWR[31]), .Y(n593) );
  OAI211X1TS U1042 ( .A0(n610), .A1(n994), .B0(n594), .C0(n593), .Y(n603) );
  AOI21X1TS U1043 ( .A0(n608), .A1(n603), .B0(n606), .Y(n595) );
  OAI21X1TS U1044 ( .A0(n605), .A1(n510), .B0(n595), .Y(sftr_odat_SHT2_SWR[5])
         );
  AOI21X1TS U1045 ( .A0(n405), .A1(n596), .B0(n606), .Y(n597) );
  OAI21X1TS U1046 ( .A0(n598), .A1(n510), .B0(n597), .Y(sftr_odat_SHT2_SWR[6])
         );
  AOI22X1TS U1047 ( .A0(n468), .A1(Data_array_SWR[45]), .B0(n420), .B1(
        Data_array_SWR[41]), .Y(n600) );
  AOI22X1TS U1048 ( .A0(n418), .A1(Data_array_SWR[37]), .B0(n417), .B1(
        Data_array_SWR[33]), .Y(n599) );
  AOI21X1TS U1049 ( .A0(n394), .A1(n611), .B0(n606), .Y(n602) );
  OAI21X1TS U1050 ( .A0(n614), .A1(n510), .B0(n602), .Y(sftr_odat_SHT2_SWR[7])
         );
  AOI21X1TS U1051 ( .A0(n406), .A1(n603), .B0(n473), .Y(n604) );
  OAI21X1TS U1052 ( .A0(n605), .A1(n466), .B0(n604), .Y(sftr_odat_SHT2_SWR[20]) );
  AOI21X1TS U1053 ( .A0(n394), .A1(n607), .B0(n606), .Y(n609) );
  OAI21X1TS U1054 ( .A0(n610), .A1(n510), .B0(n609), .Y(sftr_odat_SHT2_SWR[4])
         );
  AOI21X1TS U1055 ( .A0(left_right_SHT2), .A1(n611), .B0(n473), .Y(n613) );
  OAI21X1TS U1056 ( .A0(n614), .A1(n466), .B0(n613), .Y(sftr_odat_SHT2_SWR[18]) );
  NOR2BX1TS U1057 ( .AN(LZD_output_NRM2_EW[3]), .B(ADD_OVRFLW_NRM2), .Y(n615)
         );
  XOR2X1TS U1058 ( .A(n946), .B(n615), .Y(DP_OP_15J180_122_6956_n15) );
  NOR2BX1TS U1059 ( .AN(LZD_output_NRM2_EW[4]), .B(ADD_OVRFLW_NRM2), .Y(n616)
         );
  XOR2X1TS U1060 ( .A(n946), .B(n616), .Y(DP_OP_15J180_122_6956_n14) );
  NOR2X1TS U1061 ( .A(DmP_mant_SFG_SWR[12]), .B(n979), .Y(n622) );
  AOI222X4TS U1062 ( .A0(n619), .A1(n945), .B0(n619), .B1(n977), .C0(n945), 
        .C1(n977), .Y(n625) );
  AOI22X1TS U1063 ( .A0(n393), .A1(n623), .B0(n625), .B1(n649), .Y(n621) );
  OAI31X1TS U1064 ( .A0(n622), .A1(n621), .A2(n624), .B0(n620), .Y(
        Raw_mant_SGF[12]) );
  AOI22X1TS U1065 ( .A0(n393), .A1(n628), .B0(n630), .B1(n649), .Y(n627) );
  NAND2X1TS U1066 ( .A(DmP_mant_SFG_SWR[13]), .B(n947), .Y(n629) );
  OAI21XLTS U1067 ( .A0(DmP_mant_SFG_SWR[13]), .A1(n947), .B0(n629), .Y(n626)
         );
  NOR2X1TS U1068 ( .A(DmP_mant_SFG_SWR[14]), .B(n984), .Y(n633) );
  AOI222X4TS U1069 ( .A0(n630), .A1(n947), .B0(n630), .B1(n981), .C0(n947), 
        .C1(n981), .Y(n636) );
  AOI22X1TS U1070 ( .A0(n393), .A1(n634), .B0(n636), .B1(n649), .Y(n632) );
  OAI31X1TS U1071 ( .A0(n633), .A1(n632), .A2(n635), .B0(n631), .Y(
        Raw_mant_SGF[14]) );
  NOR2X1TS U1072 ( .A(DmP_mant_SFG_SWR[16]), .B(n991), .Y(n639) );
  NAND2X1TS U1073 ( .A(DmP_mant_SFG_SWR[15]), .B(n948), .Y(n893) );
  AOI222X4TS U1074 ( .A0(n891), .A1(n948), .B0(n891), .B1(n985), .C0(n948), 
        .C1(n985), .Y(n642) );
  AOI22X1TS U1075 ( .A0(n393), .A1(n640), .B0(n642), .B1(n649), .Y(n638) );
  OAI31X1TS U1076 ( .A0(n639), .A1(n638), .A2(n641), .B0(n637), .Y(
        Raw_mant_SGF[16]) );
  NOR2X1TS U1077 ( .A(DmP_mant_SFG_SWR[18]), .B(n993), .Y(n645) );
  NAND2X1TS U1078 ( .A(DmP_mant_SFG_SWR[17]), .B(n990), .Y(n744) );
  AOI222X4TS U1079 ( .A0(n742), .A1(n990), .B0(n742), .B1(n397), .C0(n990), 
        .C1(n397), .Y(n648) );
  AOI22X1TS U1080 ( .A0(n393), .A1(n646), .B0(n648), .B1(n1091), .Y(n644) );
  OAI31X1TS U1081 ( .A0(n645), .A1(n644), .A2(n647), .B0(n643), .Y(
        Raw_mant_SGF[18]) );
  NOR2X1TS U1082 ( .A(DmP_mant_SFG_SWR[20]), .B(n998), .Y(n652) );
  NAND2X1TS U1083 ( .A(DmP_mant_SFG_SWR[19]), .B(n997), .Y(n775) );
  AOI222X4TS U1084 ( .A0(n773), .A1(n997), .B0(n773), .B1(n398), .C0(n997), 
        .C1(n398), .Y(n656) );
  AOI22X1TS U1085 ( .A0(n393), .A1(n654), .B0(n656), .B1(n649), .Y(n651) );
  OAI31X1TS U1086 ( .A0(n652), .A1(n651), .A2(n655), .B0(n650), .Y(
        Raw_mant_SGF[20]) );
  AOI221X4TS U1087 ( .A0(Raw_mant_NRM_SWR[0]), .A1(n1090), .B0(
        Raw_mant_NRM_SWR[25]), .B1(n663), .C0(n682), .Y(n932) );
  AOI22X2TS U1088 ( .A0(n1090), .A1(LZD_raw_out_EWR[1]), .B0(
        Shift_amount_SHT1_EWR[1]), .B1(n682), .Y(n665) );
  OAI22X2TS U1089 ( .A0(Shift_reg_FLAGS_7[1]), .A1(Shift_amount_SHT1_EWR[0]), 
        .B0(LZD_raw_out_EWR[0]), .B1(n663), .Y(n660) );
  NOR2X1TS U1090 ( .A(DmP_mant_SFG_SWR[22]), .B(n1012), .Y(n659) );
  NAND2X1TS U1091 ( .A(DmP_mant_SFG_SWR[21]), .B(n960), .Y(n898) );
  AOI222X4TS U1092 ( .A0(n896), .A1(n960), .B0(n896), .B1(n1013), .C0(n960), 
        .C1(n1013), .Y(n817) );
  AOI22X1TS U1093 ( .A0(n393), .A1(n901), .B0(n817), .B1(n916), .Y(n658) );
  CLKAND2X2TS U1094 ( .A(DmP_mant_SFG_SWR[22]), .B(n1012), .Y(n902) );
  OAI31X1TS U1095 ( .A0(n659), .A1(n658), .A2(n902), .B0(n657), .Y(
        Raw_mant_SGF[22]) );
  INVX2TS U1096 ( .A(n660), .Y(n664) );
  AOI22X1TS U1097 ( .A0(n1090), .A1(Raw_mant_NRM_SWR[24]), .B0(
        Raw_mant_NRM_SWR[1]), .B1(n410), .Y(n711) );
  INVX2TS U1098 ( .A(n697), .Y(n709) );
  AOI22X1TS U1099 ( .A0(n1090), .A1(Raw_mant_NRM_SWR[25]), .B0(n705), .B1(n709), .Y(n661) );
  AOI22X1TS U1100 ( .A0(n409), .A1(Raw_mant_NRM_SWR[22]), .B0(
        DmP_mant_SHT1_SW[20]), .B1(n682), .Y(n662) );
  INVX4TS U1101 ( .A(n663), .Y(n935) );
  AOI222X4TS U1102 ( .A0(n934), .A1(DmP_mant_SHT1_SW[22]), .B0(
        Raw_mant_NRM_SWR[24]), .B1(n410), .C0(Raw_mant_NRM_SWR[1]), .C1(n935), 
        .Y(n929) );
  AOI222X4TS U1103 ( .A0(n934), .A1(DmP_mant_SHT1_SW[21]), .B0(
        Raw_mant_NRM_SWR[23]), .B1(n410), .C0(n423), .C1(n935), .Y(n930) );
  OAI22X1TS U1104 ( .A0(n929), .A1(n933), .B0(n930), .B1(n408), .Y(n667) );
  AOI21X1TS U1105 ( .A0(n413), .A1(n738), .B0(n667), .Y(n668) );
  AOI222X4TS U1106 ( .A0(n934), .A1(DmP_mant_SHT1_SW[13]), .B0(n1090), .B1(
        Raw_mant_NRM_SWR[10]), .C0(Raw_mant_NRM_SWR[15]), .C1(n409), .Y(n731)
         );
  AOI22X1TS U1107 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n1090), .B0(
        DmP_mant_SHT1_SW[12]), .B1(n682), .Y(n669) );
  AOI222X4TS U1108 ( .A0(n934), .A1(DmP_mant_SHT1_SW[15]), .B0(n1090), .B1(
        Raw_mant_NRM_SWR[8]), .C0(Raw_mant_NRM_SWR[17]), .C1(n409), .Y(n718)
         );
  AOI222X4TS U1109 ( .A0(n934), .A1(DmP_mant_SHT1_SW[14]), .B0(n1090), .B1(
        Raw_mant_NRM_SWR[9]), .C0(Raw_mant_NRM_SWR[16]), .C1(n409), .Y(n723)
         );
  OAI22X1TS U1110 ( .A0(n718), .A1(n403), .B0(n723), .B1(n933), .Y(n670) );
  AOI21X1TS U1111 ( .A0(n413), .A1(n733), .B0(n670), .Y(n671) );
  AOI222X4TS U1112 ( .A0(n934), .A1(DmP_mant_SHT1_SW[17]), .B0(
        Raw_mant_NRM_SWR[19]), .B1(n410), .C0(Raw_mant_NRM_SWR[6]), .C1(n935), 
        .Y(n719) );
  AOI22X1TS U1113 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n1090), .B0(
        DmP_mant_SHT1_SW[16]), .B1(n682), .Y(n672) );
  AOI222X4TS U1114 ( .A0(n934), .A1(DmP_mant_SHT1_SW[19]), .B0(
        Raw_mant_NRM_SWR[21]), .B1(n410), .C0(n422), .C1(n935), .Y(n736) );
  AOI222X4TS U1115 ( .A0(n934), .A1(DmP_mant_SHT1_SW[18]), .B0(
        Raw_mant_NRM_SWR[20]), .B1(n410), .C0(Raw_mant_NRM_SWR[5]), .C1(n935), 
        .Y(n741) );
  OAI22X1TS U1116 ( .A0(n736), .A1(n404), .B0(n741), .B1(n933), .Y(n673) );
  AOI21X1TS U1117 ( .A0(n413), .A1(n721), .B0(n673), .Y(n674) );
  AOI222X4TS U1118 ( .A0(n934), .A1(DmP_mant_SHT1_SW[9]), .B0(
        Raw_mant_NRM_SWR[11]), .B1(n410), .C0(Raw_mant_NRM_SWR[14]), .C1(n935), 
        .Y(n713) );
  AOI22X1TS U1119 ( .A0(n409), .A1(Raw_mant_NRM_SWR[10]), .B0(
        DmP_mant_SHT1_SW[8]), .B1(n682), .Y(n675) );
  AOI222X4TS U1120 ( .A0(n934), .A1(DmP_mant_SHT1_SW[11]), .B0(n935), .B1(
        Raw_mant_NRM_SWR[12]), .C0(Raw_mant_NRM_SWR[13]), .C1(n409), .Y(n730)
         );
  AOI222X4TS U1121 ( .A0(n934), .A1(DmP_mant_SHT1_SW[10]), .B0(
        Raw_mant_NRM_SWR[12]), .B1(n409), .C0(Raw_mant_NRM_SWR[13]), .C1(n935), 
        .Y(n735) );
  OAI22X1TS U1122 ( .A0(n730), .A1(n404), .B0(n735), .B1(n933), .Y(n676) );
  AOI21X1TS U1123 ( .A0(n413), .A1(n715), .B0(n676), .Y(n677) );
  AOI222X4TS U1124 ( .A0(n682), .A1(DmP_mant_SHT1_SW[5]), .B0(n1090), .B1(
        Raw_mant_NRM_SWR[18]), .C0(Raw_mant_NRM_SWR[7]), .C1(n409), .Y(n725)
         );
  AOI22X1TS U1125 ( .A0(Raw_mant_NRM_SWR[19]), .A1(n1090), .B0(
        DmP_mant_SHT1_SW[4]), .B1(n682), .Y(n678) );
  AOI222X4TS U1126 ( .A0(n682), .A1(DmP_mant_SHT1_SW[7]), .B0(
        Raw_mant_NRM_SWR[9]), .B1(n410), .C0(Raw_mant_NRM_SWR[16]), .C1(n935), 
        .Y(n712) );
  AOI222X4TS U1127 ( .A0(n934), .A1(DmP_mant_SHT1_SW[6]), .B0(
        Raw_mant_NRM_SWR[8]), .B1(n410), .C0(Raw_mant_NRM_SWR[17]), .C1(n935), 
        .Y(n717) );
  OAI22X1TS U1128 ( .A0(n712), .A1(n403), .B0(n717), .B1(n933), .Y(n680) );
  AOI21X1TS U1129 ( .A0(n413), .A1(n727), .B0(n680), .Y(n681) );
  AOI222X4TS U1130 ( .A0(n682), .A1(DmP_mant_SHT1_SW[3]), .B0(n935), .B1(
        Raw_mant_NRM_SWR[20]), .C0(Raw_mant_NRM_SWR[5]), .C1(n409), .Y(n724)
         );
  AOI222X4TS U1131 ( .A0(n682), .A1(DmP_mant_SHT1_SW[2]), .B0(n935), .B1(
        Raw_mant_NRM_SWR[21]), .C0(n422), .C1(n409), .Y(n729) );
  OAI22X1TS U1132 ( .A0(n724), .A1(n404), .B0(n729), .B1(n933), .Y(n683) );
  AOI21X1TS U1133 ( .A0(n666), .A1(n709), .B0(n683), .Y(n684) );
  OAI22X1TS U1134 ( .A0(n929), .A1(n404), .B0(n930), .B1(n933), .Y(n685) );
  AOI21X1TS U1135 ( .A0(n666), .A1(n738), .B0(n685), .Y(n686) );
  OAI22X1TS U1136 ( .A0(n741), .A1(n404), .B0(n719), .B1(n933), .Y(n687) );
  AOI21X1TS U1137 ( .A0(n666), .A1(n721), .B0(n687), .Y(n688) );
  OAI22X1TS U1138 ( .A0(n717), .A1(n403), .B0(n725), .B1(n933), .Y(n689) );
  AOI21X1TS U1139 ( .A0(n666), .A1(n727), .B0(n689), .Y(n690) );
  OAI22X1TS U1140 ( .A0(n723), .A1(n403), .B0(n731), .B1(n933), .Y(n691) );
  AOI21X1TS U1141 ( .A0(n666), .A1(n733), .B0(n691), .Y(n692) );
  OAI22X1TS U1142 ( .A0(n735), .A1(n403), .B0(n713), .B1(n933), .Y(n693) );
  AOI21X1TS U1143 ( .A0(n666), .A1(n715), .B0(n693), .Y(n694) );
  OAI22X1TS U1144 ( .A0(n724), .A1(n424), .B0(n729), .B1(n408), .Y(n695) );
  AOI21X1TS U1145 ( .A0(n705), .A1(n727), .B0(n695), .Y(n696) );
  OAI22X1TS U1146 ( .A0(n736), .A1(n933), .B0(n741), .B1(n407), .Y(n698) );
  AOI21X1TS U1147 ( .A0(n705), .A1(n738), .B0(n698), .Y(n699) );
  OAI22X1TS U1148 ( .A0(n718), .A1(n424), .B0(n723), .B1(n408), .Y(n700) );
  AOI21X1TS U1149 ( .A0(n705), .A1(n721), .B0(n700), .Y(n701) );
  OAI22X1TS U1150 ( .A0(n730), .A1(n424), .B0(n735), .B1(n407), .Y(n702) );
  AOI21X1TS U1151 ( .A0(n705), .A1(n733), .B0(n702), .Y(n703) );
  OAI22X1TS U1152 ( .A0(n712), .A1(n424), .B0(n717), .B1(n407), .Y(n704) );
  AOI21X1TS U1153 ( .A0(n705), .A1(n715), .B0(n704), .Y(n706) );
  OAI22X1TS U1154 ( .A0(n729), .A1(n404), .B0(n707), .B1(n408), .Y(n708) );
  AOI21X1TS U1155 ( .A0(n739), .A1(n709), .B0(n708), .Y(n710) );
  OAI22X1TS U1156 ( .A0(n713), .A1(n403), .B0(n712), .B1(n407), .Y(n714) );
  AOI21X1TS U1157 ( .A0(n739), .A1(n715), .B0(n714), .Y(n716) );
  OAI22X1TS U1158 ( .A0(n719), .A1(n404), .B0(n718), .B1(n408), .Y(n720) );
  AOI21X1TS U1159 ( .A0(n739), .A1(n721), .B0(n720), .Y(n722) );
  OAI22X1TS U1160 ( .A0(n725), .A1(n403), .B0(n724), .B1(n407), .Y(n726) );
  AOI21X1TS U1161 ( .A0(n739), .A1(n727), .B0(n726), .Y(n728) );
  OAI22X1TS U1162 ( .A0(n731), .A1(n403), .B0(n730), .B1(n407), .Y(n732) );
  AOI21X1TS U1163 ( .A0(n739), .A1(n733), .B0(n732), .Y(n734) );
  OAI22X1TS U1164 ( .A0(n930), .A1(n404), .B0(n736), .B1(n408), .Y(n737) );
  AOI21X1TS U1165 ( .A0(n739), .A1(n738), .B0(n737), .Y(n740) );
  AOI22X1TS U1166 ( .A0(n393), .A1(n743), .B0(n742), .B1(n1091), .Y(n746) );
  OAI21XLTS U1167 ( .A0(DmP_mant_SFG_SWR[17]), .A1(n990), .B0(n744), .Y(n745)
         );
  OAI22X1TS U1168 ( .A0(n750), .A1(n749), .B0(n748), .B1(n762), .Y(n751) );
  AOI21X1TS U1169 ( .A0(n752), .A1(Raw_mant_NRM_SWR[3]), .B0(n751), .Y(n753)
         );
  OAI211X1TS U1170 ( .A0(n755), .A1(n1021), .B0(n754), .C0(n753), .Y(
        LZD_raw_out_EWR[2]) );
  NOR3X1TS U1171 ( .A(n423), .B(n772), .C(n982), .Y(n768) );
  OAI211X1TS U1172 ( .A0(n763), .A1(n762), .B0(n761), .C0(n760), .Y(
        LZD_raw_out_EWR[3]) );
  OAI31X1TS U1173 ( .A0(n766), .A1(Raw_mant_NRM_SWR[10]), .A2(n765), .B0(n764), 
        .Y(n767) );
  AOI211X1TS U1174 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n769), .B0(n768), .C0(n767), 
        .Y(n770) );
  OAI211X1TS U1175 ( .A0(n1052), .A1(n772), .B0(n771), .C0(n770), .Y(
        LZD_raw_out_EWR[4]) );
  AOI22X1TS U1176 ( .A0(n393), .A1(n774), .B0(n773), .B1(n916), .Y(n777) );
  OAI21XLTS U1177 ( .A0(DmP_mant_SFG_SWR[19]), .A1(n997), .B0(n775), .Y(n776)
         );
  NOR2BX1TS U1178 ( .AN(LZD_output_NRM2_EW[2]), .B(ADD_OVRFLW_NRM2), .Y(n778)
         );
  XOR2X1TS U1179 ( .A(n946), .B(n778), .Y(DP_OP_15J180_122_6956_n16) );
  NOR2BX1TS U1180 ( .AN(LZD_output_NRM2_EW[1]), .B(ADD_OVRFLW_NRM2), .Y(n779)
         );
  XOR2X1TS U1181 ( .A(n946), .B(n779), .Y(DP_OP_15J180_122_6956_n17) );
  XOR2X1TS U1182 ( .A(n946), .B(n780), .Y(DP_OP_15J180_122_6956_n18) );
  NOR2BX1TS U1183 ( .AN(exp_rslt_NRM2_EW1[7]), .B(
        array_comparators_GTComparator_N0), .Y(formatted_number_W[30]) );
  XOR2XLTS U1184 ( .A(DMP_EXP_EWSW[27]), .B(DmP_EXP_EWSW[27]), .Y(n781) );
  XOR2XLTS U1185 ( .A(intadd_428_n1), .B(n781), .Y(Shift_amount_EXP_EW[4]) );
  AOI22X1TS U1186 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n936), .B1(n940), .Y(n1094)
         );
  XNOR2X1TS U1187 ( .A(add_subt), .B(Data_Y[31]), .Y(n1054) );
  XNOR2X1TS U1188 ( .A(intDX_EWSW[31]), .B(n1092), .Y(OP_FLAG_INIT) );
  AOI22X1TS U1189 ( .A0(intDX_EWSW[23]), .A1(intDY_EWSW[23]), .B0(n963), .B1(
        n1011), .Y(n788) );
  AOI22X1TS U1190 ( .A0(n952), .A1(intDY_EWSW[15]), .B0(n996), .B1(
        intDY_EWSW[13]), .Y(n782) );
  OAI221XLTS U1191 ( .A0(n952), .A1(intDY_EWSW[15]), .B0(n996), .B1(
        intDY_EWSW[13]), .C0(n782), .Y(n787) );
  AOI22X1TS U1192 ( .A0(n1002), .A1(intDY_EWSW[10]), .B0(n400), .B1(
        intDY_EWSW[2]), .Y(n783) );
  AOI22X1TS U1193 ( .A0(n954), .A1(intDY_EWSW[9]), .B0(n1006), .B1(
        intDY_EWSW[11]), .Y(n784) );
  OAI221XLTS U1194 ( .A0(n954), .A1(intDY_EWSW[9]), .B0(n1006), .B1(
        intDY_EWSW[11]), .C0(n784), .Y(n785) );
  NOR4X1TS U1195 ( .A(n788), .B(n787), .C(n786), .D(n785), .Y(n816) );
  AOI22X1TS U1196 ( .A0(n1057), .A1(intDY_EWSW[7]), .B0(n1008), .B1(
        intDY_EWSW[14]), .Y(n789) );
  AOI22X1TS U1197 ( .A0(n1055), .A1(intDY_EWSW[5]), .B0(n1056), .B1(
        intDY_EWSW[4]), .Y(n790) );
  OAI221XLTS U1198 ( .A0(n1055), .A1(intDY_EWSW[5]), .B0(n1056), .B1(
        intDY_EWSW[4]), .C0(n790), .Y(n795) );
  AOI22X1TS U1199 ( .A0(n951), .A1(intDY_EWSW[3]), .B0(n1010), .B1(
        intDY_EWSW[26]), .Y(n791) );
  AOI22X1TS U1200 ( .A0(n1000), .A1(intDY_EWSW[1]), .B0(n401), .B1(
        intDY_EWSW[0]), .Y(n792) );
  OAI221XLTS U1201 ( .A0(n1000), .A1(intDY_EWSW[1]), .B0(n401), .B1(
        intDY_EWSW[0]), .C0(n792), .Y(n793) );
  NOR4X1TS U1202 ( .A(n796), .B(n795), .C(n794), .D(n793), .Y(n815) );
  AOI22X1TS U1203 ( .A0(n427), .A1(intDY_EWSW[28]), .B0(n1005), .B1(
        intDY_EWSW[6]), .Y(n797) );
  AOI22X1TS U1204 ( .A0(n955), .A1(intDY_EWSW[18]), .B0(n1014), .B1(
        intDY_EWSW[29]), .Y(n798) );
  OAI221XLTS U1205 ( .A0(n955), .A1(intDY_EWSW[18]), .B0(n1014), .B1(
        intDY_EWSW[29]), .C0(n798), .Y(n803) );
  AOI22X1TS U1206 ( .A0(n958), .A1(intDY_EWSW[27]), .B0(n1009), .B1(
        intDY_EWSW[19]), .Y(n799) );
  AOI22X1TS U1207 ( .A0(n1004), .A1(intDY_EWSW[25]), .B0(n959), .B1(
        intDY_EWSW[24]), .Y(n800) );
  OAI221XLTS U1208 ( .A0(n1004), .A1(intDY_EWSW[25]), .B0(n959), .B1(
        intDY_EWSW[24]), .C0(n800), .Y(n801) );
  NOR4X1TS U1209 ( .A(n804), .B(n803), .C(n802), .D(n801), .Y(n814) );
  AOI22X1TS U1210 ( .A0(n956), .A1(intDY_EWSW[20]), .B0(n1015), .B1(
        intDY_EWSW[30]), .Y(n805) );
  AOI22X1TS U1211 ( .A0(n1001), .A1(intDY_EWSW[8]), .B0(n953), .B1(
        intDY_EWSW[21]), .Y(n806) );
  OAI221XLTS U1212 ( .A0(n1001), .A1(intDY_EWSW[8]), .B0(n953), .B1(
        intDY_EWSW[21]), .C0(n806), .Y(n811) );
  AOI22X1TS U1213 ( .A0(n1003), .A1(intDY_EWSW[17]), .B0(n1018), .B1(
        intDY_EWSW[16]), .Y(n807) );
  AOI22X1TS U1214 ( .A0(n957), .A1(intDY_EWSW[22]), .B0(n1007), .B1(
        intDY_EWSW[12]), .Y(n808) );
  OAI221XLTS U1215 ( .A0(n957), .A1(intDY_EWSW[22]), .B0(n1007), .B1(
        intDY_EWSW[12]), .C0(n808), .Y(n809) );
  NOR4X1TS U1216 ( .A(n812), .B(n811), .C(n810), .D(n809), .Y(n813) );
  NAND4XLTS U1217 ( .A(n816), .B(n815), .C(n814), .D(n813), .Y(n884) );
  NOR2BX1TS U1218 ( .AN(OP_FLAG_INIT), .B(n884), .Y(ZERO_FLAG_INIT) );
  NOR2BX1TS U1219 ( .AN(Shift_reg_FLAGS_7[3]), .B(n412), .Y(n_21_net_) );
  AOI222X4TS U1220 ( .A0(n903), .A1(n962), .B0(n903), .B1(n1020), .C0(n962), 
        .C1(n1020), .Y(n908) );
  AOI21X1TS U1221 ( .A0(n913), .A1(n429), .B0(n912), .Y(ADD_OVRFLW_SGF) );
  NOR2X1TS U1222 ( .A(n1045), .B(intDX_EWSW[25]), .Y(n878) );
  AOI22X1TS U1223 ( .A0(intDX_EWSW[25]), .A1(n1045), .B0(intDX_EWSW[24]), .B1(
        n818), .Y(n822) );
  OAI21X1TS U1224 ( .A0(intDX_EWSW[26]), .A1(n1050), .B0(n819), .Y(n879) );
  NOR2X1TS U1225 ( .A(n995), .B(intDX_EWSW[30]), .Y(n826) );
  NOR2X1TS U1226 ( .A(n950), .B(intDX_EWSW[29]), .Y(n823) );
  AOI211X1TS U1227 ( .A0(intDY_EWSW[28]), .A1(n824), .B0(n826), .C0(n823), .Y(
        n877) );
  NOR3X1TS U1228 ( .A(n824), .B(n823), .C(intDY_EWSW[28]), .Y(n825) );
  AOI2BB2X1TS U1229 ( .B0(n828), .B1(n877), .A0N(n827), .A1N(n826), .Y(n883)
         );
  NOR2X1TS U1230 ( .A(n1043), .B(intDX_EWSW[17]), .Y(n864) );
  NOR2X1TS U1231 ( .A(n1046), .B(intDX_EWSW[11]), .Y(n843) );
  AOI21X1TS U1232 ( .A0(intDY_EWSW[10]), .A1(n1002), .B0(n843), .Y(n848) );
  OAI2BB1X1TS U1233 ( .A0N(n1055), .A1N(intDY_EWSW[5]), .B0(intDX_EWSW[4]), 
        .Y(n829) );
  OAI22X1TS U1234 ( .A0(intDY_EWSW[4]), .A1(n829), .B0(n1055), .B1(
        intDY_EWSW[5]), .Y(n840) );
  OAI2BB1X1TS U1235 ( .A0N(n1057), .A1N(intDY_EWSW[7]), .B0(intDX_EWSW[6]), 
        .Y(n830) );
  OAI22X1TS U1236 ( .A0(intDY_EWSW[6]), .A1(n830), .B0(n1057), .B1(
        intDY_EWSW[7]), .Y(n839) );
  OAI2BB2XLTS U1237 ( .B0(intDY_EWSW[0]), .B1(n831), .A0N(intDX_EWSW[1]), 
        .A1N(n1047), .Y(n833) );
  AOI222X1TS U1238 ( .A0(intDY_EWSW[4]), .A1(n1056), .B0(n836), .B1(n835), 
        .C0(intDY_EWSW[5]), .C1(n1055), .Y(n838) );
  AOI22X1TS U1239 ( .A0(intDY_EWSW[7]), .A1(n1057), .B0(intDY_EWSW[6]), .B1(
        n1005), .Y(n837) );
  OAI32X1TS U1240 ( .A0(n840), .A1(n839), .A2(n838), .B0(n837), .B1(n839), .Y(
        n858) );
  OA22X1TS U1241 ( .A0(n967), .A1(intDX_EWSW[14]), .B0(n1049), .B1(
        intDX_EWSW[15]), .Y(n855) );
  OAI2BB2XLTS U1242 ( .B0(intDY_EWSW[12]), .B1(n842), .A0N(intDX_EWSW[13]), 
        .A1N(n1032), .Y(n854) );
  AOI22X1TS U1243 ( .A0(intDX_EWSW[11]), .A1(n1046), .B0(intDX_EWSW[10]), .B1(
        n844), .Y(n850) );
  AOI21X1TS U1244 ( .A0(n847), .A1(n846), .B0(n857), .Y(n849) );
  OAI2BB2XLTS U1245 ( .B0(n850), .B1(n857), .A0N(n849), .A1N(n848), .Y(n853)
         );
  OAI2BB2XLTS U1246 ( .B0(intDY_EWSW[14]), .B1(n851), .A0N(intDX_EWSW[15]), 
        .A1N(n1049), .Y(n852) );
  AOI211X1TS U1247 ( .A0(n855), .A1(n854), .B0(n853), .C0(n852), .Y(n856) );
  OAI31X1TS U1248 ( .A0(n859), .A1(n858), .A2(n857), .B0(n856), .Y(n862) );
  OA22X1TS U1249 ( .A0(n1036), .A1(intDX_EWSW[22]), .B0(n963), .B1(
        intDX_EWSW[23]), .Y(n875) );
  OAI21X1TS U1250 ( .A0(intDX_EWSW[18]), .A1(n1044), .B0(n866), .Y(n870) );
  AOI211X1TS U1251 ( .A0(intDY_EWSW[16]), .A1(n1018), .B0(n869), .C0(n870), 
        .Y(n861) );
  OAI2BB2XLTS U1252 ( .B0(intDY_EWSW[20]), .B1(n863), .A0N(intDX_EWSW[21]), 
        .A1N(n1033), .Y(n874) );
  AOI22X1TS U1253 ( .A0(intDX_EWSW[17]), .A1(n1043), .B0(intDX_EWSW[16]), .B1(
        n865), .Y(n868) );
  AOI32X1TS U1254 ( .A0(n1044), .A1(n866), .A2(intDX_EWSW[18]), .B0(
        intDX_EWSW[19]), .B1(n966), .Y(n867) );
  OAI32X1TS U1255 ( .A0(n870), .A1(n869), .A2(n868), .B0(n867), .B1(n869), .Y(
        n873) );
  OAI2BB2XLTS U1256 ( .B0(intDY_EWSW[22]), .B1(n871), .A0N(intDX_EWSW[23]), 
        .A1N(n963), .Y(n872) );
  AOI211X1TS U1257 ( .A0(n875), .A1(n874), .B0(n873), .C0(n872), .Y(n881) );
  NAND4BBX1TS U1258 ( .AN(n879), .BN(n878), .C(n877), .D(n876), .Y(n880) );
  AOI32X1TS U1259 ( .A0(n883), .A1(n882), .A2(n881), .B0(n880), .B1(n883), .Y(
        n918) );
  AOI21X1TS U1260 ( .A0(n884), .A1(n927), .B0(intDX_EWSW[31]), .Y(n885) );
  AOI21X1TS U1261 ( .A0(n1092), .A1(n928), .B0(n885), .Y(SIGN_FLAG_INIT) );
  NAND2X1TS U1262 ( .A(N59), .B(n912), .Y(n886) );
  XNOR2X1TS U1263 ( .A(n886), .B(N60), .Y(Raw_mant_SGF[1]) );
  OAI21XLTS U1264 ( .A0(DMP_SFG[0]), .A1(DmP_mant_SFG_SWR[2]), .B0(n887), .Y(
        n890) );
  NAND2X1TS U1265 ( .A(n888), .B(n912), .Y(n889) );
  XOR2XLTS U1266 ( .A(n890), .B(n889), .Y(Raw_mant_SGF[2]) );
  AOI22X1TS U1267 ( .A0(n393), .A1(n892), .B0(n891), .B1(n1091), .Y(n895) );
  AOI22X1TS U1268 ( .A0(n393), .A1(n897), .B0(n896), .B1(n1091), .Y(n900) );
  OAI22X1TS U1269 ( .A0(DmP_mant_SFG_SWR[22]), .A1(n1012), .B0(n902), .B1(n901), .Y(n906) );
  AOI22X1TS U1270 ( .A0(n393), .A1(n906), .B0(n903), .B1(n1091), .Y(n905) );
  NAND2X1TS U1271 ( .A(DmP_mant_SFG_SWR[23]), .B(n962), .Y(n907) );
  OAI21XLTS U1272 ( .A0(DmP_mant_SFG_SWR[23]), .A1(n962), .B0(n907), .Y(n904)
         );
  NOR2X1TS U1273 ( .A(DmP_mant_SFG_SWR[24]), .B(n1023), .Y(n915) );
  AOI21X1TS U1274 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n1023), .B0(n915), .Y(n910)
         );
  AOI22X1TS U1275 ( .A0(DMP_SFG[21]), .A1(n1020), .B0(n907), .B1(n906), .Y(
        n911) );
  AOI22X1TS U1276 ( .A0(n393), .A1(n911), .B0(n908), .B1(n916), .Y(n909) );
  AOI21X1TS U1277 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n1023), .B0(n911), .Y(n914)
         );
  BUFX3TS U1278 ( .A(n924), .Y(n920) );
  BUFX3TS U1279 ( .A(n920), .Y(n919) );
  AOI22X1TS U1280 ( .A0(n919), .A1(n1051), .B0(n401), .B1(n923), .Y(
        DmP_INIT_EWSW[0]) );
  AOI22X1TS U1281 ( .A0(n919), .A1(n1047), .B0(n1000), .B1(n928), .Y(
        DmP_INIT_EWSW[1]) );
  AOI22X1TS U1282 ( .A0(n919), .A1(n1034), .B0(n400), .B1(n923), .Y(
        DmP_INIT_EWSW[2]) );
  AOI22X1TS U1283 ( .A0(n919), .A1(n1048), .B0(n951), .B1(n928), .Y(
        DmP_INIT_EWSW[3]) );
  AOI22X1TS U1284 ( .A0(n919), .A1(n1029), .B0(n1056), .B1(n928), .Y(
        DmP_INIT_EWSW[4]) );
  AOI22X1TS U1285 ( .A0(n919), .A1(n1026), .B0(n1055), .B1(n927), .Y(
        DmP_INIT_EWSW[5]) );
  AOI22X1TS U1286 ( .A0(n919), .A1(n1027), .B0(n1005), .B1(n923), .Y(
        DmP_INIT_EWSW[6]) );
  AOI22X1TS U1287 ( .A0(n919), .A1(n1025), .B0(n1057), .B1(n923), .Y(
        DmP_INIT_EWSW[7]) );
  AOI22X1TS U1288 ( .A0(n919), .A1(n1042), .B0(n1001), .B1(n928), .Y(
        DmP_INIT_EWSW[8]) );
  AOI22X1TS U1289 ( .A0(n919), .A1(n1037), .B0(n954), .B1(n928), .Y(
        DmP_INIT_EWSW[9]) );
  AOI22X1TS U1290 ( .A0(n920), .A1(n1030), .B0(n1002), .B1(n923), .Y(
        DmP_INIT_EWSW[10]) );
  AOI22X1TS U1291 ( .A0(n920), .A1(n1046), .B0(n1006), .B1(n923), .Y(
        DmP_INIT_EWSW[11]) );
  AOI22X1TS U1292 ( .A0(n920), .A1(n1039), .B0(n1007), .B1(n928), .Y(
        DmP_INIT_EWSW[12]) );
  AOI22X1TS U1293 ( .A0(n920), .A1(n1032), .B0(n996), .B1(n928), .Y(
        DmP_INIT_EWSW[13]) );
  AOI22X1TS U1294 ( .A0(n920), .A1(n967), .B0(n1008), .B1(n923), .Y(
        DmP_INIT_EWSW[14]) );
  AOI22X1TS U1295 ( .A0(n920), .A1(n1049), .B0(n952), .B1(n923), .Y(
        DmP_INIT_EWSW[15]) );
  AOI22X1TS U1296 ( .A0(n920), .A1(n1028), .B0(n1018), .B1(n928), .Y(
        DmP_INIT_EWSW[16]) );
  AOI22X1TS U1297 ( .A0(n920), .A1(n1043), .B0(n1003), .B1(n923), .Y(
        DmP_INIT_EWSW[17]) );
  AOI22X1TS U1298 ( .A0(n920), .A1(n1044), .B0(n955), .B1(n928), .Y(
        DmP_INIT_EWSW[18]) );
  AOI22X1TS U1299 ( .A0(n920), .A1(n966), .B0(n1009), .B1(n928), .Y(
        DmP_INIT_EWSW[19]) );
  AOI22X1TS U1300 ( .A0(n924), .A1(n1035), .B0(n956), .B1(n923), .Y(
        DmP_INIT_EWSW[20]) );
  AOI22X1TS U1301 ( .A0(n924), .A1(n1033), .B0(n953), .B1(n923), .Y(
        DmP_INIT_EWSW[21]) );
  AOI22X1TS U1302 ( .A0(n924), .A1(n1036), .B0(n957), .B1(n927), .Y(
        DmP_INIT_EWSW[22]) );
  AOI22X1TS U1303 ( .A0(n924), .A1(n963), .B0(n1011), .B1(n927), .Y(
        DmP_INIT_EWSW[23]) );
  AOI22X1TS U1304 ( .A0(n924), .A1(n1031), .B0(n959), .B1(n928), .Y(
        DmP_INIT_EWSW[24]) );
  AOI22X1TS U1305 ( .A0(n924), .A1(n1045), .B0(n1004), .B1(n927), .Y(
        DmP_INIT_EWSW[25]) );
  AOI22X1TS U1306 ( .A0(n924), .A1(n1050), .B0(n1010), .B1(n927), .Y(
        DmP_INIT_EWSW[26]) );
  AOI22X1TS U1307 ( .A0(n924), .A1(n1038), .B0(n958), .B1(n923), .Y(
        DmP_INIT_EWSW[27]) );
  AOI22X1TS U1308 ( .A0(n924), .A1(n401), .B0(n1051), .B1(n927), .Y(
        DMP_INIT_EWSW[0]) );
  AOI22X1TS U1309 ( .A0(n924), .A1(n1000), .B0(n1047), .B1(n927), .Y(
        DMP_INIT_EWSW[1]) );
  BUFX3TS U1310 ( .A(n920), .Y(n921) );
  AOI22X1TS U1311 ( .A0(n921), .A1(n400), .B0(n1034), .B1(n928), .Y(
        DMP_INIT_EWSW[2]) );
  INVX2TS U1312 ( .A(n924), .Y(n922) );
  AOI22X1TS U1313 ( .A0(n921), .A1(n951), .B0(n1048), .B1(n922), .Y(
        DMP_INIT_EWSW[3]) );
  AOI22X1TS U1314 ( .A0(n921), .A1(n1056), .B0(n1029), .B1(n922), .Y(
        DMP_INIT_EWSW[4]) );
  AOI22X1TS U1315 ( .A0(n921), .A1(n1055), .B0(n1026), .B1(n922), .Y(
        DMP_INIT_EWSW[5]) );
  AOI22X1TS U1316 ( .A0(n921), .A1(n1005), .B0(n1027), .B1(n922), .Y(
        DMP_INIT_EWSW[6]) );
  AOI22X1TS U1317 ( .A0(n921), .A1(n1057), .B0(n1025), .B1(n922), .Y(
        DMP_INIT_EWSW[7]) );
  AOI22X1TS U1318 ( .A0(n921), .A1(n1001), .B0(n1042), .B1(n922), .Y(
        DMP_INIT_EWSW[8]) );
  AOI22X1TS U1319 ( .A0(n921), .A1(n954), .B0(n1037), .B1(n925), .Y(
        DMP_INIT_EWSW[9]) );
  AOI22X1TS U1320 ( .A0(n921), .A1(n1002), .B0(n1030), .B1(n925), .Y(
        DMP_INIT_EWSW[10]) );
  AOI22X1TS U1321 ( .A0(n921), .A1(n1006), .B0(n1046), .B1(n925), .Y(
        DMP_INIT_EWSW[11]) );
  AOI22X1TS U1322 ( .A0(n926), .A1(n1007), .B0(n1039), .B1(n922), .Y(
        DMP_INIT_EWSW[12]) );
  AOI22X1TS U1323 ( .A0(n926), .A1(n996), .B0(n1032), .B1(n922), .Y(
        DMP_INIT_EWSW[13]) );
  AOI22X1TS U1324 ( .A0(n926), .A1(n1008), .B0(n967), .B1(n922), .Y(
        DMP_INIT_EWSW[14]) );
  AOI22X1TS U1325 ( .A0(n926), .A1(n952), .B0(n1049), .B1(n925), .Y(
        DMP_INIT_EWSW[15]) );
  AOI22X1TS U1326 ( .A0(n926), .A1(n1018), .B0(n1028), .B1(n925), .Y(
        DMP_INIT_EWSW[16]) );
  AOI22X1TS U1327 ( .A0(n926), .A1(n1003), .B0(n1043), .B1(n927), .Y(
        DMP_INIT_EWSW[17]) );
  AOI22X1TS U1328 ( .A0(n926), .A1(n955), .B0(n1044), .B1(n925), .Y(
        DMP_INIT_EWSW[18]) );
  AOI22X1TS U1329 ( .A0(n926), .A1(n1009), .B0(n966), .B1(n925), .Y(
        DMP_INIT_EWSW[19]) );
  AOI22X1TS U1330 ( .A0(n926), .A1(n956), .B0(n1035), .B1(n925), .Y(
        DMP_INIT_EWSW[20]) );
  AOI22X1TS U1331 ( .A0(n926), .A1(n953), .B0(n1033), .B1(n925), .Y(
        DMP_INIT_EWSW[21]) );
  AOI22X1TS U1332 ( .A0(n926), .A1(n957), .B0(n1036), .B1(n925), .Y(
        DMP_INIT_EWSW[22]) );
  AOI22X1TS U1333 ( .A0(n924), .A1(n1011), .B0(n963), .B1(n925), .Y(
        DMP_INIT_EWSW[23]) );
  AOI22X1TS U1334 ( .A0(n926), .A1(n959), .B0(n1031), .B1(n925), .Y(
        DMP_INIT_EWSW[24]) );
  AOI22X1TS U1335 ( .A0(n926), .A1(n1004), .B0(n1045), .B1(n925), .Y(
        DMP_INIT_EWSW[25]) );
  AOI22X1TS U1336 ( .A0(n926), .A1(n1010), .B0(n1050), .B1(n925), .Y(
        DMP_INIT_EWSW[26]) );
  AOI22X1TS U1337 ( .A0(n926), .A1(n958), .B0(n1038), .B1(n925), .Y(
        DMP_INIT_EWSW[27]) );
  OAI2BB2XLTS U1338 ( .B0(n927), .B1(n824), .A0N(n927), .A1N(intDY_EWSW[28]), 
        .Y(DMP_INIT_EWSW[28]) );
  OAI2BB2XLTS U1339 ( .B0(n927), .B1(n1014), .A0N(n927), .A1N(intDY_EWSW[29]), 
        .Y(DMP_INIT_EWSW[29]) );
  OAI2BB2XLTS U1340 ( .B0(n927), .B1(n1015), .A0N(n927), .A1N(intDY_EWSW[30]), 
        .Y(DMP_INIT_EWSW[30]) );
  OAI22X1TS U1341 ( .A0(n929), .A1(n653), .B0(n932), .B1(n408), .Y(
        Data_array_SWR[24]) );
  OAI222X1TS U1342 ( .A0(n424), .A1(n932), .B0(n653), .B1(n930), .C0(n408), 
        .C1(n929), .Y(Data_array_SWR[23]) );
  INVX2TS U1344 ( .A(n936), .Y(n939) );
  AOI22X1TS U1345 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n965), .B0(
        beg_OP), .B1(n940), .Y(n938) );
  OAI22X1TS U1346 ( .A0(n939), .A1(n938), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B1(n937), .Y(n389) );
  NAND2BXLTS U1347 ( .AN(busy), .B(n1093), .Y(n_7_net_) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule

