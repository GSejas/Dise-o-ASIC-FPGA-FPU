/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:05:07 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_ShiftRegister_W7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_9 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
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
         SIGN_FLAG_NRM, ZERO_FLAG_NRM, n_21_net_, SIGN_FLAG_SFG, OP_FLAG_SFG,
         ZERO_FLAG_SFG, N59, N60, ADD_OVRFLW_SGF,
         inst_ShiftRegister_net3648770, SFT2FRMT_STAGE_VARS_net3648693,
         FRMT_STAGE_DATAOUT_net3648634, SGF_STAGE_DMP_net3648688,
         NRM_STAGE_Raw_mant_net3648670, INPUT_STAGE_OPERANDY_net3648634,
         EXP_STAGE_DMP_net3648688, SHT1_STAGE_DMP_net3648688,
         SHT2_STAGE_DMP_net3648688, SHT2_SHIFT_DATA_net3648670,
         array_comparators_GTComparator_N0, array_comparators_LTComparator_N0,
         n388, n389, n390, DP_OP_15J179_122_6956_n28,
         DP_OP_15J179_122_6956_n18, DP_OP_15J179_122_6956_n17,
         DP_OP_15J179_122_6956_n16, DP_OP_15J179_122_6956_n15,
         DP_OP_15J179_122_6956_n14, DP_OP_15J179_122_6956_n8,
         DP_OP_15J179_122_6956_n7, DP_OP_15J179_122_6956_n6,
         DP_OP_15J179_122_6956_n5, DP_OP_15J179_122_6956_n4,
         DP_OP_15J179_122_6956_n3, DP_OP_15J179_122_6956_n2,
         DP_OP_15J179_122_6956_n1, intadd_427_CI, intadd_427_SUM_2_,
         intadd_427_SUM_1_, intadd_427_SUM_0_, intadd_427_n3, intadd_427_n2,
         intadd_427_n1, n393, n394, n395, n396, n397, n398, n399, n400, n401,
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
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n958, n959, n960, n961, n962, n963,
         n964, n965, n966, n967, n968, n969, n970, n971, n972, n973, n974,
         n975, n976, n977, n978, n979, n980, n981, n982, n983, n984, n985,
         n986, n987, n988, n989, n990, n991, n992, n993, n994, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046,
         n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206,
         n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216,
         n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226,
         n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236,
         n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246,
         n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256,
         n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266,
         n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276,
         n1277;
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
  wire   [25:2] DmP_mant_SFG_SWR;
  wire   [25:1] Raw_mant_SGF;
  wire   [31:0] formatted_number_W;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  SNPS_CLOCK_GATE_HIGH_ShiftRegister_W7 inst_ShiftRegister_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n390), .ENCLK(inst_ShiftRegister_net3648770), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W13 SFT2FRMT_STAGE_VARS_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[1]), .ENCLK(
        SFT2FRMT_STAGE_VARS_net3648693), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_6 FRMT_STAGE_DATAOUT_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[0]), .ENCLK(
        FRMT_STAGE_DATAOUT_net3648634), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_5 SGF_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n_21_net_), .ENCLK(SGF_STAGE_DMP_net3648688), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_1 NRM_STAGE_Raw_mant_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[2]), .ENCLK(
        NRM_STAGE_Raw_mant_net3648670), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_7 INPUT_STAGE_OPERANDY_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enable_Pipeline_input), .ENCLK(
        INPUT_STAGE_OPERANDY_net3648634), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_9 EXP_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7_6), .ENCLK(EXP_STAGE_DMP_net3648688), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_8 SHT1_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7_5), .ENCLK(SHT1_STAGE_DMP_net3648688), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_7 SHT2_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(busy), .ENCLK(SHT2_STAGE_DMP_net3648688), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_4 SHT2_SHIFT_DATA_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n_7_net_), .ENCLK(SHT2_SHIFT_DATA_net3648670), .TE(1'b0) );
  DFFRXLTS inst_ShiftRegister_Q_reg_6_ ( .D(n1277), .CK(
        inst_ShiftRegister_net3648770), .RN(n1234), .Q(Shift_reg_FLAGS_7_6) );
  DFFRXLTS inst_ShiftRegister_Q_reg_5_ ( .D(Shift_reg_FLAGS_7_6), .CK(
        inst_ShiftRegister_net3648770), .RN(n1234), .Q(Shift_reg_FLAGS_7_5) );
  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(busy), .CK(
        inst_ShiftRegister_net3648770), .RN(n1234), .Q(Shift_reg_FLAGS_7[3])
         );
  DFFRXLTS inst_ShiftRegister_Q_reg_2_ ( .D(Shift_reg_FLAGS_7[3]), .CK(
        inst_ShiftRegister_net3648770), .RN(n1234), .Q(Shift_reg_FLAGS_7[2])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(Shift_amount_EXP_EW[0]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1235), .Q(Shift_amount_SHT1_EWR[0])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(Shift_amount_EXP_EW[1]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1235), .Q(Shift_amount_SHT1_EWR[1])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(Shift_amount_EXP_EW[2]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1235), .Q(Shift_amount_SHT1_EWR[2])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(Shift_amount_EXP_EW[3]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1235), .Q(Shift_amount_SHT1_EWR[3])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(Shift_amount_EXP_EW[4]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1235), .Q(Shift_amount_SHT1_EWR[4])
         );
  DFFRXLTS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(Data_X[28]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[28]), .QN(
        n419) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(DmP_INIT_EWSW[0]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1239), .Q(DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(DmP_EXP_EWSW[0]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1239), .Q(DmP_mant_SHT1_SW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(DmP_INIT_EWSW[1]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1239), .Q(DmP_EXP_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(DmP_EXP_EWSW[1]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1239), .Q(DmP_mant_SHT1_SW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(DmP_INIT_EWSW[2]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1239), .Q(DmP_EXP_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(DmP_EXP_EWSW[2]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1239), .Q(DmP_mant_SHT1_SW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(DmP_INIT_EWSW[3]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1239), .Q(DmP_EXP_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(DmP_EXP_EWSW[3]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1240), .Q(DmP_mant_SHT1_SW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(DmP_INIT_EWSW[4]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1240), .Q(DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(DmP_EXP_EWSW[4]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1240), .Q(DmP_mant_SHT1_SW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(DmP_INIT_EWSW[5]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1240), .Q(DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(DmP_EXP_EWSW[5]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1240), .Q(DmP_mant_SHT1_SW[5]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(DmP_INIT_EWSW[6]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1240), .Q(DmP_EXP_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(DmP_EXP_EWSW[6]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1240), .Q(DmP_mant_SHT1_SW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(DmP_INIT_EWSW[7]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1241), .Q(DmP_EXP_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(DmP_EXP_EWSW[7]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1241), .Q(DmP_mant_SHT1_SW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(DmP_INIT_EWSW[8]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1241), .Q(DmP_EXP_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(DmP_EXP_EWSW[8]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1241), .Q(DmP_mant_SHT1_SW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(DmP_INIT_EWSW[9]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1241), .Q(DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(DmP_EXP_EWSW[9]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1241), .Q(DmP_mant_SHT1_SW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(DmP_INIT_EWSW[10]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1242), .Q(DmP_EXP_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(DmP_EXP_EWSW[10]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1242), .Q(DmP_mant_SHT1_SW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(DmP_INIT_EWSW[11]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1242), .Q(DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(DmP_EXP_EWSW[11]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1242), .Q(DmP_mant_SHT1_SW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(DmP_INIT_EWSW[12]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1242), .Q(DmP_EXP_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(DmP_EXP_EWSW[12]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1242), .Q(DmP_mant_SHT1_SW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(DmP_INIT_EWSW[13]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1242), .Q(DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(DmP_EXP_EWSW[13]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1243), .Q(DmP_mant_SHT1_SW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(DmP_INIT_EWSW[14]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1243), .Q(DmP_EXP_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(DmP_EXP_EWSW[14]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1243), .Q(DmP_mant_SHT1_SW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(DmP_INIT_EWSW[15]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1243), .Q(DmP_EXP_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(DmP_EXP_EWSW[15]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1243), .Q(DmP_mant_SHT1_SW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(DmP_INIT_EWSW[16]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1243), .Q(DmP_EXP_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(DmP_EXP_EWSW[16]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1243), .Q(DmP_mant_SHT1_SW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(DmP_INIT_EWSW[17]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1244), .Q(DmP_EXP_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(DmP_EXP_EWSW[17]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1244), .Q(DmP_mant_SHT1_SW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(DmP_INIT_EWSW[18]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1244), .Q(DmP_EXP_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(DmP_EXP_EWSW[18]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1244), .Q(DmP_mant_SHT1_SW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(DmP_INIT_EWSW[19]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1244), .Q(DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(DmP_EXP_EWSW[19]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1244), .Q(DmP_mant_SHT1_SW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(DmP_INIT_EWSW[20]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1245), .Q(DmP_EXP_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(DmP_EXP_EWSW[20]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1245), .Q(DmP_mant_SHT1_SW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(DmP_INIT_EWSW[21]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1245), .Q(DmP_EXP_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(DmP_EXP_EWSW[21]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1245), .Q(DmP_mant_SHT1_SW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(DmP_INIT_EWSW[22]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1245), .Q(DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(DmP_EXP_EWSW[22]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1245), .Q(DmP_mant_SHT1_SW[22]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_23_ ( .D(DmP_INIT_EWSW[23]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1245), .Q(DmP_EXP_EWSW[23]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_24_ ( .D(DmP_INIT_EWSW[24]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1246), .Q(DmP_EXP_EWSW[24]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_25_ ( .D(DmP_INIT_EWSW[25]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1249), .Q(DmP_EXP_EWSW[25]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_26_ ( .D(DmP_INIT_EWSW[26]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1252), .Q(DmP_EXP_EWSW[26]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_27_ ( .D(DmP_INIT_EWSW[27]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1248), .Q(DmP_EXP_EWSW[27]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(DMP_INIT_EWSW[0]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1248), .Q(DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(DMP_INIT_EWSW[1]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n512), .Q(DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(DMP_INIT_EWSW[2]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n511), .Q(DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(DMP_INIT_EWSW[3]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1253), .Q(DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(DMP_INIT_EWSW[4]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n512), .Q(DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(DMP_INIT_EWSW[5]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1247), .Q(DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(DMP_INIT_EWSW[6]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n513), .Q(DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(DMP_INIT_EWSW[7]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1248), .Q(DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(DMP_INIT_EWSW[8]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1253), .Q(DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(DMP_INIT_EWSW[9]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1252), .Q(DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(DMP_INIT_EWSW[10]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1246), .Q(DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(DMP_INIT_EWSW[11]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1249), .Q(DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(DMP_INIT_EWSW[12]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1249), .Q(DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(DMP_INIT_EWSW[13]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1252), .Q(DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(DMP_INIT_EWSW[14]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n531), .Q(DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(DMP_INIT_EWSW[15]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1247), .Q(DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(DMP_INIT_EWSW[16]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1246), .Q(DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(DMP_INIT_EWSW[17]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1248), .Q(DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(DMP_INIT_EWSW[18]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1248), .Q(DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(DMP_INIT_EWSW[19]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n513), .Q(DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(DMP_INIT_EWSW[20]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1248), .Q(DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(DMP_INIT_EWSW[21]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1246), .Q(DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(DMP_INIT_EWSW[22]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1249), .Q(DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_23_ ( .D(DMP_INIT_EWSW[23]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1253), .Q(DMP_EXP_EWSW[23]), .QN(n420)
         );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_24_ ( .D(DMP_INIT_EWSW[24]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1247), .Q(DMP_EXP_EWSW[24]), .QN(n1204) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_25_ ( .D(DMP_INIT_EWSW[25]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1247), .Q(DMP_EXP_EWSW[25]), .QN(n1229) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_26_ ( .D(DMP_INIT_EWSW[26]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1252), .Q(DMP_EXP_EWSW[26]), .QN(n1228) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_27_ ( .D(DMP_INIT_EWSW[27]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n513), .Q(DMP_EXP_EWSW[27]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(DMP_INIT_EWSW[28]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1250), .Q(DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(DMP_INIT_EWSW[29]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1250), .Q(DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(DMP_INIT_EWSW[30]), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1250), .Q(DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1250), .Q(ZERO_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1250), .Q(OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3648688), .RN(n1250), .Q(SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(DMP_EXP_EWSW[0]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(DMP_EXP_EWSW[1]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(DMP_EXP_EWSW[2]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(DMP_EXP_EWSW[3]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(DMP_EXP_EWSW[4]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(DMP_EXP_EWSW[5]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(DMP_EXP_EWSW[6]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(DMP_EXP_EWSW[7]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(DMP_EXP_EWSW[8]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1250), .Q(DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(DMP_EXP_EWSW[9]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1250), .Q(DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(DMP_EXP_EWSW[10]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1250), .Q(DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(DMP_EXP_EWSW[11]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1250), .Q(DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(DMP_EXP_EWSW[12]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(DMP_EXP_EWSW[13]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(DMP_EXP_EWSW[14]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(DMP_EXP_EWSW[15]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(DMP_EXP_EWSW[16]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(DMP_EXP_EWSW[17]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(DMP_EXP_EWSW[18]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(DMP_EXP_EWSW[19]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(DMP_EXP_EWSW[20]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(DMP_EXP_EWSW[21]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1251), .Q(DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(DMP_EXP_EWSW[22]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1252), .Q(DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(DMP_EXP_EWSW[23]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1246), .Q(DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(DMP_EXP_EWSW[24]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n513), .Q(DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(DMP_EXP_EWSW[25]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n513), .Q(DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(DMP_EXP_EWSW[26]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n513), .Q(DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(DMP_EXP_EWSW[27]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1249), .Q(DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(DMP_EXP_EWSW[28]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1275), .Q(DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(DMP_EXP_EWSW[29]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1248), .Q(DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(DMP_EXP_EWSW[30]), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1253), .Q(DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n1252), .Q(ZERO_FLAG_SHT1) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n513), .Q(OP_FLAG_SHT1) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3648688), .RN(n512), .Q(SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(DMP_SHT1_EWSW[0]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(DMP_SHT1_EWSW[1]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(DMP_SHT1_EWSW[2]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(DMP_SHT1_EWSW[3]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(DMP_SHT1_EWSW[4]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(DMP_SHT1_EWSW[5]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(DMP_SHT1_EWSW[6]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(DMP_SHT1_EWSW[7]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(DMP_SHT1_EWSW[8]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(DMP_SHT1_EWSW[9]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(DMP_SHT1_EWSW[10]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(DMP_SHT1_EWSW[11]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(DMP_SHT1_EWSW[12]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(DMP_SHT1_EWSW[13]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(DMP_SHT1_EWSW[14]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(DMP_SHT1_EWSW[15]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(DMP_SHT1_EWSW[16]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(DMP_SHT1_EWSW[17]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(DMP_SHT1_EWSW[18]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(DMP_SHT1_EWSW[19]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(DMP_SHT1_EWSW[20]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(DMP_SHT1_EWSW[21]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1275), .Q(DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(DMP_SHT1_EWSW[22]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1275), .Q(DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(DMP_SHT1_EWSW[23]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1253), .Q(DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(DMP_SHT2_EWSW[23]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n512), .Q(DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(DMP_SFG[23]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1262), .Q(DMP_exp_NRM_EW[0]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(DMP_exp_NRM_EW[0]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1262), .Q(DMP_exp_NRM2_EW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(DMP_SHT1_EWSW[24]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n512), .Q(DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(DMP_SHT2_EWSW[24]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1246), .Q(DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(DMP_SFG[24]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1263), .Q(DMP_exp_NRM_EW[1]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(DMP_exp_NRM_EW[1]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1262), .Q(DMP_exp_NRM2_EW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(DMP_SHT1_EWSW[25]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1247), .Q(DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(DMP_SHT2_EWSW[25]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1247), .Q(DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(DMP_SFG[25]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1263), .Q(DMP_exp_NRM_EW[2]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(DMP_exp_NRM_EW[2]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1263), .Q(DMP_exp_NRM2_EW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(DMP_SHT1_EWSW[26]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1249), .Q(DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(DMP_SHT2_EWSW[26]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1253), .Q(DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(DMP_SFG[26]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1263), .Q(DMP_exp_NRM_EW[3]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(DMP_exp_NRM_EW[3]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1263), .Q(DMP_exp_NRM2_EW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(DMP_SHT1_EWSW[27]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1254), .Q(DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(DMP_SHT2_EWSW[27]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1254), .Q(DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(DMP_SFG[27]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1263), .Q(DMP_exp_NRM_EW[4]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(DMP_exp_NRM_EW[4]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1263), .Q(DMP_exp_NRM2_EW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(DMP_SHT1_EWSW[28]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1254), .Q(DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(DMP_SHT2_EWSW[28]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1254), .Q(DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(DMP_SFG[28]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1263), .Q(DMP_exp_NRM_EW[5]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(DMP_exp_NRM_EW[5]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1263), .Q(DMP_exp_NRM2_EW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(DMP_SHT1_EWSW[29]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1254), .Q(DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(DMP_SHT2_EWSW[29]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1254), .Q(DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(DMP_SFG[29]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(DMP_exp_NRM_EW[6]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(DMP_exp_NRM_EW[6]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1263), .Q(DMP_exp_NRM2_EW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(DMP_SHT1_EWSW[30]), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1254), .Q(DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(DMP_SHT2_EWSW[30]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1254), .Q(DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(DMP_SFG[30]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(DMP_exp_NRM_EW[7]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(DMP_exp_NRM_EW[7]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1264), .Q(DMP_exp_NRM2_EW[7]) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1254), .Q(ZERO_FLAG_SHT2) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1268), .Q(OP_FLAG_SHT2) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3648688), .RN(n1254), .Q(SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1255), .Q(ZERO_FLAG_SFG) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(Raw_mant_SGF[15]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[15])
         );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(Raw_mant_SGF[18]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[18])
         );
  DFFRX4TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(Raw_mant_SGF[20]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[20])
         );
  DFFRX4TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(Raw_mant_SGF[22]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[22])
         );
  DFFRX4TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(Raw_mant_SGF[23]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[23])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(LZD_raw_out_EWR[3]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1262), .Q(LZD_output_NRM2_EW[3])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(LZD_raw_out_EWR[0]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1262), .Q(LZD_output_NRM2_EW[0])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(LZD_raw_out_EWR[2]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1262), .Q(LZD_output_NRM2_EW[2])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(LZD_raw_out_EWR[1]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1262), .Q(LZD_output_NRM2_EW[1])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(LZD_raw_out_EWR[4]), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1262), .Q(LZD_output_NRM2_EW[4])
         );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1255), .Q(SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SFG), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1255), .Q(ZERO_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_NRM), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1255), .Q(ZERO_FLAG_SHT1SHT2) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(SIGN_FLAG_SFG), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1255), .Q(SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(SIGN_FLAG_NRM), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .RN(n1255), .Q(SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_2_ ( .D(ADD_OVRFLW_SGF), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1268), .Q(ADD_OVRFLW_NRM), .QN(
        n1153) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(Data_array_SWR[24]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[50]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(Data_array_SWR[3]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1258), .Q(Data_array_SWR[29]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(Data_array_SWR[2]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1258), .Q(Data_array_SWR[28]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(Data_array_SWR[1]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1258), .Q(Data_array_SWR[27]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(Data_array_SWR[0]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1258), .Q(Data_array_SWR[26]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n1159), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1268), .Q(DmP_mant_SFG_SWR[14]), .QN(
        n1124) );
  CMPR32X2TS DP_OP_15J179_122_6956_U9 ( .A(DMP_exp_NRM2_EW[0]), .B(
        DP_OP_15J179_122_6956_n28), .C(DP_OP_15J179_122_6956_n18), .CO(
        DP_OP_15J179_122_6956_n8), .S(exp_rslt_NRM2_EW1[0]) );
  CMPR32X2TS intadd_427_U4 ( .A(DmP_EXP_EWSW[24]), .B(n1204), .C(intadd_427_CI), .CO(intadd_427_n3), .S(intadd_427_SUM_0_) );
  CMPR32X2TS intadd_427_U3 ( .A(DmP_EXP_EWSW[25]), .B(n1229), .C(intadd_427_n3), .CO(intadd_427_n2), .S(intadd_427_SUM_1_) );
  CMPR32X2TS intadd_427_U2 ( .A(DmP_EXP_EWSW[26]), .B(n1228), .C(intadd_427_n2), .CO(intadd_427_n1), .S(intadd_427_SUM_2_) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(sftr_odat_SHT2_SWR[25]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[25]), .QN(
        n1230) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(Data_Y[0]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDY_EWSW[0]), .QN(
        n1227) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(Data_Y[26]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1247), .Q(intDY_EWSW[26]), .QN(
        n1226) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(Data_Y[15]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1243), .Q(intDY_EWSW[15]), .QN(
        n1225) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(Data_Y[3]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1239), .Q(intDY_EWSW[3]), .QN(
        n1224) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(Data_Y[11]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1242), .Q(intDY_EWSW[11]), .QN(
        n1222) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(Data_Y[25]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1247), .Q(intDY_EWSW[25]), .QN(
        n1221) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(Data_Y[18]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1244), .Q(intDY_EWSW[18]), .QN(
        n1220) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(Data_Y[17]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1244), .Q(intDY_EWSW[17]), .QN(
        n1219) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(Data_Y[8]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1241), .Q(intDY_EWSW[8]), .QN(
        n1218) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(Data_Y[12]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1242), .Q(intDY_EWSW[12]), .QN(
        n1217) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(Data_Y[27]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1275), .Q(intDY_EWSW[27]), .QN(
        n1216) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(Data_Y[9]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1241), .Q(intDY_EWSW[9]), .QN(
        n1215) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(Data_Y[22]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1245), .Q(intDY_EWSW[22]), .QN(
        n1214) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(Data_Y[20]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1244), .Q(intDY_EWSW[20]), .QN(
        n1213) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(Data_Y[2]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1239), .Q(intDY_EWSW[2]), .QN(
        n1212) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(Data_Y[21]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1245), .Q(intDY_EWSW[21]), .QN(
        n1211) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(Data_Y[13]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1242), .Q(intDY_EWSW[13]), .QN(
        n1210) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(Data_Y[24]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n512), .Q(intDY_EWSW[24]), .QN(
        n1209) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(Data_Y[10]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1241), .Q(intDY_EWSW[10]), .QN(
        n1208) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(Data_Y[4]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1240), .Q(intDY_EWSW[4]), .QN(
        n1207) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(Data_Y[16]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1243), .Q(intDY_EWSW[16]), .QN(
        n1206) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(Data_Y[6]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1240), .Q(intDY_EWSW[6]), .QN(
        n1205) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(sftr_odat_SHT2_SWR[23]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[23]), .QN(
        n1201) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(Data_Y[5]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1240), .Q(intDY_EWSW[5]), .QN(
        n1199) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(Data_Y[7]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1241), .Q(intDY_EWSW[7]), .QN(
        n1198) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n389), .CK(clk), .RN(
        n1234), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n1197) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(Data_array_SWR[25]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1255), .Q(Data_array_SWR[51]), .QN(
        n1195) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(sftr_odat_SHT2_SWR[21]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[21]), .QN(
        n1191) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(Raw_mant_SGF[3]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(Raw_mant_NRM_SWR[3]), 
        .QN(n1190) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(Data_array_SWR[23]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[49]), .QN(
        n1189) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(Data_array_SWR[22]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[48]), .QN(
        n1188) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(Data_X[23]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[23]), .QN(
        n1187) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(Data_X[7]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .QN(n1186) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(Data_X[5]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .QN(n1185) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(Raw_mant_SGF[12]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[12]), 
        .QN(n1182) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(Data_X[16]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[16]), .QN(
        n1181) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(sftr_odat_SHT2_SWR[17]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[17]), .QN(
        n1178) );
  DFFRX1TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(shft_value_mux_o_EWR[2]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1258), .Q(shift_value_SHT2_EWR[2]), 
        .QN(n1177) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(Data_X[30]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[30]), .QN(
        n1176) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(Data_X[29]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[29]), .QN(
        n1175) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(Data_X[21]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[21]), .QN(
        n1174) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(Data_X[13]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[13]), .QN(
        n1173) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(Data_X[26]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[26]), .QN(
        n1172) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(Data_X[19]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[19]), .QN(
        n1171) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(Data_X[14]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[14]), .QN(
        n1170) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(Data_X[12]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .Q(intDX_EWSW[12]), .QN(
        n1169) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(Data_X[11]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .Q(intDX_EWSW[11]), .QN(
        n1168) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(Data_X[25]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[25]), .QN(
        n1167) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(Data_X[17]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[17]), .QN(
        n1166) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(Data_X[10]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .Q(intDX_EWSW[10]), .QN(
        n1165) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(Data_X[1]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1235), .Q(intDX_EWSW[1]), .QN(
        n1164) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(sftr_odat_SHT2_SWR[1]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(N60), .QN(n1154) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(Raw_mant_SGF[1]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(Raw_mant_NRM_SWR[1]), 
        .QN(n1151) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(Data_Y[29]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1247), .Q(intDY_EWSW[29]), .QN(
        n1150) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(sftr_odat_SHT2_SWR[3]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[3]), .QN(
        n1149) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(sftr_odat_SHT2_SWR[7]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[7]), .QN(
        n1147) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(sftr_odat_SHT2_SWR[9]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[9]), .QN(
        n1146) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(sftr_odat_SHT2_SWR[4]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[4]), .QN(
        n1145) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(sftr_odat_SHT2_SWR[6]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[6]), .QN(
        n1144) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(sftr_odat_SHT2_SWR[8]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[8]), .QN(
        n1143) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(Data_Y[14]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1243), .Q(intDY_EWSW[14]), .QN(
        n1142) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(Data_Y[19]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1244), .Q(intDY_EWSW[19]), .QN(
        n1141) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n388), .CK(clk), .RN(
        n1234), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]), .QN(n1140) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(Data_Y[23]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1245), .Q(intDY_EWSW[23]), .QN(
        n1139) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(Data_X[6]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .Q(intDX_EWSW[6]), .QN(
        n1137) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(Data_X[24]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[24]), .QN(
        n1136) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(Data_X[4]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .Q(intDX_EWSW[4]), .QN(
        n1135) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(Data_X[2]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1235), .Q(intDX_EWSW[2]), .QN(
        n1134) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(Data_X[0]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1235), .Q(intDX_EWSW[0]), .QN(
        n1133) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(Data_X[15]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[15]), .QN(
        n1132) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(Data_X[3]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .Q(intDX_EWSW[3]), .QN(
        n1131) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(Data_X[27]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[27]), .QN(
        n1130) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(Data_X[22]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[22]), .QN(
        n1129) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(Data_X[20]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[20]), .QN(
        n1128) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(Data_X[18]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1237), .Q(intDX_EWSW[18]), .QN(
        n1127) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(Data_X[9]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .Q(intDX_EWSW[9]), .QN(
        n1126) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(Data_X[8]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1236), .Q(intDX_EWSW[8]), .QN(
        n1125) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n1158), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1268), .Q(DmP_mant_SFG_SWR[15]), .QN(
        n1123) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(Data_Y[30]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n511), .Q(intDY_EWSW[30]), .QN(
        n1122) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n1160), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1268), .Q(DmP_mant_SFG_SWR[13]), .QN(
        n1119) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n1161), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1268), .Q(DmP_mant_SFG_SWR[12]), .QN(
        n1118) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n1163), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[10]), .QN(
        n1117) );
  DFFRX1TS inst_ShiftRegister_Q_reg_1_ ( .D(Shift_reg_FLAGS_7[2]), .CK(
        inst_ShiftRegister_net3648770), .RN(n1234), .Q(Shift_reg_FLAGS_7[1]), 
        .QN(n1155) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(Raw_mant_SGF[6]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(Raw_mant_NRM_SWR[6]), 
        .QN(n1116) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(n1277), .CK(clk), .RN(
        n1234), .Q(inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n1115) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n1235), 
        .Q(ready) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(formatted_number_W[23]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1262), .Q(final_result_ieee[23])
         );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(formatted_number_W[24]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(final_result_ieee[24])
         );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(formatted_number_W[25]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(final_result_ieee[25])
         );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(formatted_number_W[26]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(final_result_ieee[26])
         );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(formatted_number_W[27]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(final_result_ieee[27])
         );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(formatted_number_W[28]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(final_result_ieee[28])
         );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(formatted_number_W[29]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(final_result_ieee[29])
         );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(formatted_number_W[30]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(final_result_ieee[30])
         );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(array_comparators_LTComparator_N0), 
        .CK(FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(array_comparators_GTComparator_N0), 
        .CK(FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(overflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT1SHT2), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1255), .Q(zero_flag) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(formatted_number_W[31]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1255), .Q(final_result_ieee[31])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(formatted_number_W[8]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1258), .Q(final_result_ieee[8])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(formatted_number_W[9]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1258), .Q(final_result_ieee[9])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(formatted_number_W[10]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[10])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(formatted_number_W[11]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[11])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(formatted_number_W[12]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[12])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(formatted_number_W[13]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[13])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(formatted_number_W[0]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[0])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(formatted_number_W[1]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[1])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(formatted_number_W[2]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[2])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(formatted_number_W[3]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[3])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(formatted_number_W[4]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[4])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(formatted_number_W[5]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1259), .Q(final_result_ieee[5])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(formatted_number_W[6]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[6])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(formatted_number_W[7]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[7])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(formatted_number_W[14]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[14])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(formatted_number_W[15]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[15])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(formatted_number_W[16]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[16])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(formatted_number_W[17]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[17])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(formatted_number_W[18]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[18])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(formatted_number_W[19]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[19])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(formatted_number_W[20]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[20])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(formatted_number_W[21]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1260), .Q(final_result_ieee[21])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(formatted_number_W[22]), .CK(
        FRMT_STAGE_DATAOUT_net3648634), .RN(n1261), .Q(final_result_ieee[22])
         );
  DFFRX1TS inst_ShiftRegister_Q_reg_4_ ( .D(Shift_reg_FLAGS_7_5), .CK(
        inst_ShiftRegister_net3648770), .RN(n1234), .Q(busy) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(Raw_mant_SGF[5]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(Raw_mant_NRM_SWR[5]), 
        .QN(n1196) );
  ADDFX2TS DP_OP_15J179_122_6956_U2 ( .A(DP_OP_15J179_122_6956_n28), .B(
        DMP_exp_NRM2_EW[7]), .CI(DP_OP_15J179_122_6956_n2), .CO(
        DP_OP_15J179_122_6956_n1), .S(exp_rslt_NRM2_EW1[7]) );
  CMPR32X2TS DP_OP_15J179_122_6956_U3 ( .A(DP_OP_15J179_122_6956_n28), .B(
        DMP_exp_NRM2_EW[6]), .C(DP_OP_15J179_122_6956_n3), .CO(
        DP_OP_15J179_122_6956_n2), .S(exp_rslt_NRM2_EW1[6]) );
  CMPR32X2TS DP_OP_15J179_122_6956_U4 ( .A(DP_OP_15J179_122_6956_n28), .B(
        DMP_exp_NRM2_EW[5]), .C(DP_OP_15J179_122_6956_n4), .CO(
        DP_OP_15J179_122_6956_n3), .S(exp_rslt_NRM2_EW1[5]) );
  CMPR32X2TS DP_OP_15J179_122_6956_U6 ( .A(DP_OP_15J179_122_6956_n15), .B(
        DMP_exp_NRM2_EW[3]), .C(DP_OP_15J179_122_6956_n6), .CO(
        DP_OP_15J179_122_6956_n5), .S(exp_rslt_NRM2_EW1[3]) );
  CMPR32X2TS DP_OP_15J179_122_6956_U7 ( .A(DP_OP_15J179_122_6956_n16), .B(
        DMP_exp_NRM2_EW[2]), .C(DP_OP_15J179_122_6956_n7), .CO(
        DP_OP_15J179_122_6956_n6), .S(exp_rslt_NRM2_EW1[2]) );
  DFFSXLTS R_0 ( .D(n1231), .CK(INPUT_STAGE_OPERANDY_net3648634), .SN(n1235), 
        .Q(n1276) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(Raw_mant_SGF[25]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[25]), 
        .QN(n1180) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(sftr_odat_SHT2_SWR[24]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[24]), .QN(
        n1202) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(Raw_mant_SGF[10]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[10])
         );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(shft_value_mux_o_EWR[3]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1258), .Q(shift_value_SHT2_EWR[3])
         );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(Data_Y[28]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n511), .Q(intDY_EWSW[28]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(Raw_mant_SGF[2]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(Raw_mant_NRM_SWR[2]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(Raw_mant_SGF[7]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[7]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(Raw_mant_SGF[4]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(Raw_mant_NRM_SWR[4]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(Raw_mant_SGF[9]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[9]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(DMP_SHT2_EWSW[10]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SFG[10]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(DMP_SHT2_EWSW[5]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SFG[5]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(Raw_mant_SGF[8]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[8]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(Data_array_SWR[16]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[42]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(Data_array_SWR[17]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[43]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_19_ ( .D(DMP_SHT2_EWSW[19]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SFG[19]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_17_ ( .D(DMP_SHT2_EWSW[17]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SFG[17]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_15_ ( .D(DMP_SHT2_EWSW[15]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SFG[15]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_13_ ( .D(DMP_SHT2_EWSW[13]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SFG[13]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_11_ ( .D(DMP_SHT2_EWSW[11]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SFG[11]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_4_ ( .D(DMP_SHT2_EWSW[4]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SFG[4]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_3_ ( .D(DMP_SHT2_EWSW[3]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SFG[3]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_2_ ( .D(DMP_SHT2_EWSW[2]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SFG[2]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_1_ ( .D(DMP_SHT2_EWSW[1]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1270), .Q(DMP_SFG[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(Data_array_SWR[18]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[44]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(Data_array_SWR[19]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[45]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(DMP_SHT2_EWSW[9]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SFG[9]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_0_ ( .D(DMP_SHT2_EWSW[0]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DMP_SFG[0]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_22_ ( .D(DMP_SHT2_EWSW[22]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1275), .Q(DMP_SFG[22]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_20_ ( .D(DMP_SHT2_EWSW[20]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SFG[20]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_18_ ( .D(DMP_SHT2_EWSW[18]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SFG[18]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_16_ ( .D(DMP_SHT2_EWSW[16]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SFG[16]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_14_ ( .D(DMP_SHT2_EWSW[14]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SFG[14]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_12_ ( .D(DMP_SHT2_EWSW[12]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1273), .Q(DMP_SFG[12]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(Data_array_SWR[9]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[35]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(Data_array_SWR[8]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[34]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(Data_array_SWR[10]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[36]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(Data_array_SWR[11]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[37]) );
  DFFRX1TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1268), .Q(OP_FLAG_SFG) );
  DFFRX1TS inst_ShiftRegister_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[1]), .CK(
        inst_ShiftRegister_net3648770), .RN(n1234), .Q(Shift_reg_FLAGS_7[0])
         );
  DFFRX4TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(shft_value_mux_o_EWR[4]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1258), .Q(shift_value_SHT2_EWR[4]), 
        .QN(n1156) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(Data_X[31]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1238), .Q(intDX_EWSW[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(Data_array_SWR[13]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[39]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(Data_array_SWR[12]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[38]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(Data_array_SWR[14]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[40]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(Data_array_SWR[15]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[41]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(Raw_mant_SGF[11]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[11])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(Raw_mant_SGF[13]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[13])
         );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(N59), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1264), .Q(Raw_mant_NRM_SWR[0]) );
  DFFRX1TS SHT2_STAGE_SHFTVARS2_Q_reg_0_ ( .D(n622), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1255), .Q(bit_shift_SHT2) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(Data_array_SWR[20]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[46]), .QN(
        n1200) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(Data_array_SWR[21]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1256), .Q(Data_array_SWR[47]), .QN(
        n1138) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(sftr_odat_SHT2_SWR[5]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[5]), .QN(
        n1148) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(Data_array_SWR[6]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[32]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(Data_array_SWR[7]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[33]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(Data_array_SWR[5]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1257), .Q(Data_array_SWR[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(Data_array_SWR[4]), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1258), .Q(Data_array_SWR[30]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(Raw_mant_SGF[16]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[16])
         );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(Raw_mant_SGF[17]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[17])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(Raw_mant_SGF[19]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[19]), 
        .QN(n1194) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(Raw_mant_SGF[21]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1266), .Q(Raw_mant_NRM_SWR[21]), 
        .QN(n1183) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(Raw_mant_SGF[24]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[24]), 
        .QN(n1184) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(sftr_odat_SHT2_SWR[22]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[22]), .QN(
        n1203) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(sftr_odat_SHT2_SWR[20]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[20]), .QN(
        n1193) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(sftr_odat_SHT2_SWR[18]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[18]), .QN(
        n1179) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(sftr_odat_SHT2_SWR[16]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1268), .Q(DmP_mant_SFG_SWR[16]), .QN(
        n1157) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(Raw_mant_SGF[14]), .CK(
        NRM_STAGE_Raw_mant_net3648670), .RN(n1265), .Q(Raw_mant_NRM_SWR[14]), 
        .QN(n1121) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n1162), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1268), .Q(DmP_mant_SFG_SWR[11]), .QN(
        n1120) );
  DFFSX2TS SFT2FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n1153), .CK(
        SFT2FRMT_STAGE_VARS_net3648693), .SN(n1262), .Q(
        DP_OP_15J179_122_6956_n28), .QN(ADD_OVRFLW_NRM2) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_21_ ( .D(DMP_SHT2_EWSW[21]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1274), .Q(DMP_SFG[21]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(sftr_odat_SHT2_SWR[0]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1266), .Q(N59), .QN(n422) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(sftr_odat_SHT2_SWR[2]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1267), .Q(DmP_mant_SFG_SWR[2]), .QN(
        n1152) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_7_ ( .D(DMP_SHT2_EWSW[7]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SFG[7]) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_8_ ( .D(DMP_SHT2_EWSW[8]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1272), .Q(DMP_SFG[8]) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_6_ ( .D(DMP_SHT2_EWSW[6]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1271), .Q(DMP_SFG[6]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(sftr_odat_SHT2_SWR[19]), .CK(
        SGF_STAGE_DMP_net3648688), .RN(n1269), .Q(DmP_mant_SFG_SWR[19]), .QN(
        n1192) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(Data_Y[1]), .CK(
        INPUT_STAGE_OPERANDY_net3648634), .RN(n1239), .Q(intDY_EWSW[1]), .QN(
        n1223) );
  CMPR32X2TS DP_OP_15J179_122_6956_U8 ( .A(DP_OP_15J179_122_6956_n17), .B(
        DMP_exp_NRM2_EW[1]), .C(DP_OP_15J179_122_6956_n8), .CO(
        DP_OP_15J179_122_6956_n7), .S(exp_rslt_NRM2_EW1[1]) );
  CMPR32X2TS DP_OP_15J179_122_6956_U5 ( .A(DP_OP_15J179_122_6956_n14), .B(
        DMP_exp_NRM2_EW[4]), .C(DP_OP_15J179_122_6956_n5), .CO(
        DP_OP_15J179_122_6956_n4), .S(exp_rslt_NRM2_EW1[4]) );
  DFFRX4TS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n559), .CK(
        SHT2_SHIFT_DATA_net3648670), .RN(n1268), .Q(left_right_SHT2), .QN(n399) );
  BUFX3TS U582 ( .A(n1102), .Y(n1095) );
  AOI222X4TS U583 ( .A0(n1232), .A1(Raw_mant_NRM_SWR[4]), .B0(n1233), .B1(
        Raw_mant_NRM_SWR[21]), .C0(n1114), .C1(DmP_mant_SHT1_SW[2]), .Y(n655)
         );
  INVX4TS U584 ( .A(n393), .Y(n394) );
  BUFX3TS U585 ( .A(n1090), .Y(n1102) );
  BUFX8TS U586 ( .A(n455), .Y(n408) );
  BUFX8TS U587 ( .A(n455), .Y(n662) );
  CLKBUFX2TS U588 ( .A(n1156), .Y(n400) );
  NOR2X1TS U589 ( .A(n760), .B(n761), .Y(n485) );
  NOR2X1TS U590 ( .A(n778), .B(n780), .Y(n783) );
  OAI21X1TS U591 ( .A0(n972), .A1(n980), .B0(n973), .Y(n950) );
  OAI21X1TS U592 ( .A0(n766), .A1(n928), .B0(n765), .Y(n794) );
  NOR2X1TS U593 ( .A(n1117), .B(DMP_SFG[8]), .Y(n766) );
  NAND2X1TS U594 ( .A(n1146), .B(DMP_SFG[7]), .Y(n928) );
  NAND2X1TS U595 ( .A(DMP_SFG[6]), .B(DmP_mant_SFG_SWR[8]), .Y(n746) );
  NOR2XLTS U596 ( .A(n1047), .B(intDY_EWSW[10]), .Y(n1048) );
  OAI21XLTS U597 ( .A0(intDX_EWSW[15]), .A1(n1225), .B0(intDX_EWSW[14]), .Y(
        n1055) );
  NOR2XLTS U598 ( .A(n1068), .B(intDY_EWSW[16]), .Y(n1069) );
  OAI21XLTS U599 ( .A0(intDX_EWSW[23]), .A1(n1139), .B0(intDX_EWSW[22]), .Y(
        n1075) );
  NOR2XLTS U600 ( .A(n1119), .B(DMP_SFG[11]), .Y(n807) );
  OAI21X1TS U601 ( .A0(n982), .A1(n517), .B0(n516), .Y(n964) );
  INVX2TS U602 ( .A(n426), .Y(n427) );
  NOR2XLTS U603 ( .A(n1191), .B(DMP_SFG[19]), .Y(n848) );
  OAI21X2TS U604 ( .A0(n808), .A1(n807), .B0(n806), .Y(n922) );
  OAI21XLTS U605 ( .A0(n1188), .A1(n710), .B0(n705), .Y(n706) );
  AND2X4TS U606 ( .A(n457), .B(n456), .Y(n393) );
  OAI21X1TS U607 ( .A0(n630), .A1(n412), .B0(n629), .Y(Data_array_SWR[15]) );
  OAI21X1TS U608 ( .A0(n649), .A1(n413), .B0(n615), .Y(Data_array_SWR[19]) );
  OAI21X1TS U609 ( .A0(n663), .A1(n413), .B0(n469), .Y(Data_array_SWR[12]) );
  OAI21X1TS U610 ( .A0(n627), .A1(n413), .B0(n626), .Y(Data_array_SWR[16]) );
  OAI21X1TS U611 ( .A0(n650), .A1(n412), .B0(n467), .Y(Data_array_SWR[20]) );
  OAI21X1TS U612 ( .A0(n661), .A1(n413), .B0(n638), .Y(Data_array_SWR[11]) );
  OAI21X1TS U613 ( .A0(n631), .A1(n413), .B0(n620), .Y(Data_array_SWR[8]) );
  OAI21X1TS U614 ( .A0(n655), .A1(n412), .B0(n464), .Y(Data_array_SWR[4]) );
  OAI21X1TS U615 ( .A0(n613), .A1(n413), .B0(n612), .Y(Data_array_SWR[3]) );
  OAI21X1TS U616 ( .A0(n609), .A1(n412), .B0(n608), .Y(Data_array_SWR[1]) );
  OAI21X1TS U617 ( .A0(n634), .A1(n412), .B0(n633), .Y(Data_array_SWR[7]) );
  OAI21X1TS U618 ( .A0(n642), .A1(n413), .B0(n471), .Y(Data_array_SWR[21]) );
  OAI21X1TS U619 ( .A0(n645), .A1(n413), .B0(n475), .Y(Data_array_SWR[13]) );
  OAI21X1TS U620 ( .A0(n654), .A1(n413), .B0(n653), .Y(Data_array_SWR[17]) );
  OAI21X1TS U621 ( .A0(n656), .A1(n413), .B0(n473), .Y(Data_array_SWR[5]) );
  OAI21X1TS U622 ( .A0(n660), .A1(n412), .B0(n659), .Y(Data_array_SWR[2]) );
  OAI21X1TS U623 ( .A0(n667), .A1(n412), .B0(n666), .Y(Data_array_SWR[9]) );
  INVX4TS U624 ( .A(n393), .Y(n411) );
  OAI211X1TS U625 ( .A0(n660), .A1(n415), .B0(n609), .C0(n560), .Y(
        Data_array_SWR[0]) );
  OAI21X1TS U626 ( .A0(n1106), .A1(n412), .B0(n556), .Y(Data_array_SWR[25]) );
  AO22X1TS U627 ( .A0(n1233), .A1(LZD_raw_out_EWR[3]), .B0(
        Shift_amount_SHT1_EWR[3]), .B1(n1109), .Y(shft_value_mux_o_EWR[3]) );
  AO22X1TS U628 ( .A0(n559), .A1(LZD_raw_out_EWR[4]), .B0(
        Shift_amount_SHT1_EWR[4]), .B1(n1109), .Y(shft_value_mux_o_EWR[4]) );
  NAND3BX1TS U629 ( .AN(n510), .B(n509), .C(n508), .Y(LZD_raw_out_EWR[4]) );
  INVX3TS U630 ( .A(n506), .Y(n504) );
  NOR2X2TS U631 ( .A(n554), .B(n551), .Y(n552) );
  INVX3TS U632 ( .A(n1095), .Y(n1093) );
  AOI31X1TS U633 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n443), .A2(n1182), .B0(n442), 
        .Y(n438) );
  INVX3TS U634 ( .A(n1095), .Y(n1097) );
  INVX3TS U635 ( .A(n1095), .Y(n1098) );
  OAI21X1TS U636 ( .A0(n396), .A1(n694), .B0(n539), .Y(sftr_odat_SHT2_SWR[0])
         );
  OAI21X1TS U637 ( .A0(n414), .A1(n694), .B0(n544), .Y(sftr_odat_SHT2_SWR[1])
         );
  OAI21X1TS U638 ( .A0(n701), .A1(n396), .B0(n548), .Y(sftr_odat_SHT2_SWR[25])
         );
  OAI21X1TS U639 ( .A0(n710), .A1(n564), .B0(n497), .Y(n498) );
  CLKINVX2TS U640 ( .A(n658), .Y(n613) );
  NAND3BX1TS U641 ( .AN(n1068), .B(n1066), .C(n1065), .Y(n1086) );
  OAI21X1TS U642 ( .A0(n710), .A1(n1189), .B0(n709), .Y(n711) );
  OAI21X1TS U643 ( .A0(n710), .A1(n1195), .B0(n495), .Y(n496) );
  NAND3X1TS U644 ( .A(exp_rslt_NRM2_EW1[2]), .B(exp_rslt_NRM2_EW1[1]), .C(
        exp_rslt_NRM2_EW1[0]), .Y(n549) );
  AOI21X2TS U645 ( .A0(n784), .A1(n783), .B0(n782), .Y(n808) );
  OAI21X2TS U646 ( .A0(Data_array_SWR[51]), .A1(n583), .B0(n582), .Y(n396) );
  OAI211X1TS U647 ( .A0(n1027), .A1(n1083), .B0(n1026), .C0(n1025), .Y(n1032)
         );
  INVX3TS U648 ( .A(n532), .Y(n559) );
  INVX3TS U649 ( .A(n532), .Y(n1233) );
  INVX3TS U650 ( .A(n532), .Y(n621) );
  NOR2X4TS U651 ( .A(n410), .B(n545), .Y(n546) );
  INVX1TS U652 ( .A(n676), .Y(n679) );
  INVX3TS U653 ( .A(n710), .Y(n536) );
  AOI21X2TS U654 ( .A0(n964), .A1(n521), .B0(n520), .Y(n740) );
  OR2X2TS U655 ( .A(shift_value_SHT2_EWR[4]), .B(n580), .Y(n397) );
  OAI211X2TS U656 ( .A0(intDX_EWSW[20]), .A1(n1213), .B0(n1079), .C0(n1064), 
        .Y(n1073) );
  NAND3X1TS U657 ( .A(n1226), .B(n1024), .C(intDX_EWSW[26]), .Y(n1026) );
  OAI21X1TS U658 ( .A0(n445), .A1(Raw_mant_NRM_SWR[23]), .B0(n1184), .Y(n446)
         );
  NOR2X1TS U659 ( .A(n1082), .B(intDY_EWSW[24]), .Y(n1023) );
  INVX2TS U660 ( .A(n774), .Y(n776) );
  OAI211X2TS U661 ( .A0(intDX_EWSW[12]), .A1(n1217), .B0(n1059), .C0(n1045), 
        .Y(n1061) );
  OR2X2TS U662 ( .A(shift_value_SHT2_EWR[4]), .B(n540), .Y(n398) );
  CLKAND2X2TS U663 ( .A(n1124), .B(DMP_SFG[12]), .Y(n809) );
  NAND2BX1TS U664 ( .AN(intDX_EWSW[21]), .B(intDY_EWSW[21]), .Y(n1064) );
  NAND2BX1TS U665 ( .AN(intDX_EWSW[19]), .B(intDY_EWSW[19]), .Y(n1070) );
  NAND2BX1TS U666 ( .AN(intDX_EWSW[13]), .B(intDY_EWSW[13]), .Y(n1045) );
  NAND2BX1TS U667 ( .AN(intDX_EWSW[9]), .B(intDY_EWSW[9]), .Y(n1049) );
  NOR2X4TS U668 ( .A(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .Y(n493) );
  NAND2BX1TS U669 ( .AN(intDX_EWSW[27]), .B(intDY_EWSW[27]), .Y(n1024) );
  NAND2BX1TS U670 ( .AN(intDY_EWSW[27]), .B(intDX_EWSW[27]), .Y(n1025) );
  NAND2BX1TS U671 ( .AN(intDX_EWSW[24]), .B(intDY_EWSW[24]), .Y(n1080) );
  NOR3X8TS U672 ( .A(Raw_mant_NRM_SWR[5]), .B(Raw_mant_NRM_SWR[4]), .C(n675), 
        .Y(n672) );
  NAND2X6TS U673 ( .A(n507), .B(n1116), .Y(n675) );
  INVX4TS U674 ( .A(n447), .Y(n423) );
  AOI21X2TS U675 ( .A0(n868), .A1(n867), .B0(n491), .Y(n876) );
  OAI21X2TS U676 ( .A0(n805), .A1(n802), .B0(n803), .Y(n846) );
  AOI21X2TS U677 ( .A0(n829), .A1(n828), .B0(n489), .Y(n805) );
  OAI21X2TS U678 ( .A0(n897), .A1(n816), .B0(n815), .Y(n888) );
  AOI21X2TS U679 ( .A0(n905), .A1(n814), .B0(n813), .Y(n897) );
  OAI21X2TS U680 ( .A0(n841), .A1(n820), .B0(n819), .Y(n832) );
  OAI21X2TS U681 ( .A0(n914), .A1(n812), .B0(n811), .Y(n905) );
  NAND2X1TS U682 ( .A(DMP_SFG[0]), .B(DmP_mant_SFG_SWR[2]), .Y(n980) );
  OAI21X2TS U683 ( .A0(n894), .A1(n891), .B0(n892), .Y(n885) );
  OAI21X2TS U684 ( .A0(n838), .A1(n835), .B0(n836), .Y(n829) );
  NAND2X1TS U685 ( .A(n1154), .B(n422), .Y(n982) );
  AOI21X4TS U686 ( .A0(n861), .A1(n860), .B0(n859), .Y(n871) );
  OAI21X2TS U687 ( .A0(n849), .A1(n848), .B0(n847), .Y(n861) );
  CLKAND2X2TS U688 ( .A(n1203), .B(DMP_SFG[20]), .Y(n859) );
  CLKAND2X2TS U689 ( .A(n1179), .B(DMP_SFG[16]), .Y(n817) );
  AOI21X2TS U690 ( .A0(n832), .A1(n822), .B0(n821), .Y(n849) );
  CLKAND2X2TS U691 ( .A(n1193), .B(DMP_SFG[18]), .Y(n821) );
  CLKAND2X2TS U692 ( .A(n1157), .B(DMP_SFG[14]), .Y(n813) );
  AOI2BB2XLTS U693 ( .B0(intDX_EWSW[3]), .B1(n1224), .A0N(intDY_EWSW[2]), 
        .A1N(n1038), .Y(n1039) );
  OAI21XLTS U694 ( .A0(intDX_EWSW[3]), .A1(n1224), .B0(intDX_EWSW[2]), .Y(
        n1038) );
  OAI21X2TS U695 ( .A0(n740), .A1(n739), .B0(n738), .Y(n784) );
  NAND2X1TS U696 ( .A(n750), .B(n737), .Y(n739) );
  OAI21X2TS U697 ( .A0(n514), .A1(n481), .B0(n480), .Y(n758) );
  NOR2X1TS U698 ( .A(n745), .B(n726), .Y(n479) );
  AOI21X1TS U699 ( .A0(n794), .A1(n768), .B0(n767), .Y(n781) );
  CLKAND2X2TS U700 ( .A(n1120), .B(DMP_SFG[9]), .Y(n767) );
  NAND2X1TS U701 ( .A(n793), .B(n768), .Y(n778) );
  OAI21XLTS U702 ( .A0(n930), .A1(n796), .B0(n795), .Y(n799) );
  INVX2TS U703 ( .A(n793), .Y(n796) );
  INVX2TS U704 ( .A(n794), .Y(n795) );
  AOI222X1TS U705 ( .A0(n622), .A1(Raw_mant_NRM_SWR[18]), .B0(n559), .B1(
        Raw_mant_NRM_SWR[7]), .C0(n1109), .C1(DmP_mant_SHT1_SW[16]), .Y(n623)
         );
  OAI21XLTS U706 ( .A0(n946), .A1(n752), .B0(n751), .Y(n755) );
  INVX2TS U707 ( .A(n950), .Y(n963) );
  INVX2TS U708 ( .A(n515), .Y(n938) );
  OAI21XLTS U709 ( .A0(n930), .A1(n929), .B0(n928), .Y(n933) );
  XNOR2X2TS U710 ( .A(DP_OP_15J179_122_6956_n1), .B(ADD_OVRFLW_NRM2), .Y(n553)
         );
  INVX2TS U711 ( .A(n732), .Y(n522) );
  NAND2X1TS U712 ( .A(n926), .B(n791), .Y(n760) );
  OAI21XLTS U713 ( .A0(n930), .A1(n778), .B0(n781), .Y(n771) );
  INVX2TS U714 ( .A(n972), .Y(n974) );
  AOI222X4TS U715 ( .A0(n1232), .A1(Raw_mant_NRM_SWR[2]), .B0(n1233), .B1(
        Raw_mant_NRM_SWR[23]), .C0(n1114), .C1(DmP_mant_SHT1_SW[0]), .Y(n660)
         );
  AOI211X2TS U716 ( .A0(n559), .A1(Raw_mant_NRM_SWR[0]), .B0(n555), .C0(n1109), 
        .Y(n1106) );
  NOR2X1TS U717 ( .A(n424), .B(Raw_mant_NRM_SWR[15]), .Y(n676) );
  NOR2XLTS U718 ( .A(n1192), .B(DMP_SFG[17]), .Y(n820) );
  NOR2XLTS U719 ( .A(n1178), .B(DMP_SFG[15]), .Y(n816) );
  NOR2XLTS U720 ( .A(n1123), .B(DMP_SFG[13]), .Y(n812) );
  AOI21X1TS U721 ( .A0(n919), .A1(n918), .B0(n486), .Y(n911) );
  MX2X1TS U722 ( .A(n882), .B(n881), .S0(n947), .Y(Raw_mant_SGF[25]) );
  AOI2BB1XLTS U723 ( .A0N(array_comparators_LTComparator_N0), .A1N(
        SIGN_FLAG_SHT1SHT2), .B0(array_comparators_GTComparator_N0), .Y(
        formatted_number_W[31]) );
  OAI2BB2XLTS U724 ( .B0(intDY_EWSW[0]), .B1(n1035), .A0N(intDX_EWSW[1]), 
        .A1N(n1223), .Y(n1037) );
  NAND2BXLTS U725 ( .AN(intDX_EWSW[2]), .B(intDY_EWSW[2]), .Y(n1036) );
  NAND2BXLTS U726 ( .AN(intDY_EWSW[9]), .B(intDX_EWSW[9]), .Y(n1051) );
  NAND3XLTS U727 ( .A(n1218), .B(n1049), .C(intDX_EWSW[8]), .Y(n1050) );
  OAI21XLTS U728 ( .A0(intDX_EWSW[13]), .A1(n1210), .B0(intDX_EWSW[12]), .Y(
        n1046) );
  OAI21XLTS U729 ( .A0(n735), .A1(n751), .B0(n734), .Y(n736) );
  OAI21XLTS U730 ( .A0(n726), .A1(n746), .B0(n727), .Y(n478) );
  NOR2X1TS U731 ( .A(n929), .B(n766), .Y(n793) );
  INVX2TS U732 ( .A(n745), .Y(n747) );
  INVX2TS U733 ( .A(n726), .Y(n728) );
  INVX2TS U734 ( .A(n960), .Y(n962) );
  INVX2TS U735 ( .A(n940), .Y(n942) );
  INVX2TS U736 ( .A(n936), .Y(n937) );
  CLKAND2X2TS U737 ( .A(n1202), .B(DMP_SFG[22]), .Y(n877) );
  INVX2TS U738 ( .A(n951), .Y(n953) );
  INVX2TS U739 ( .A(exp_rslt_NRM2_EW1[7]), .Y(n554) );
  AO22XLTS U740 ( .A0(n403), .A1(Data_array_SWR[45]), .B0(n406), .B1(
        Data_array_SWR[41]), .Y(n708) );
  INVX2TS U741 ( .A(n761), .Y(n763) );
  CLKBUFX2TS U742 ( .A(OP_FLAG_SFG), .Y(n985) );
  AO22XLTS U743 ( .A0(Data_array_SWR[44]), .A1(n403), .B0(n406), .B1(
        Data_array_SWR[40]), .Y(n713) );
  NAND4XLTS U744 ( .A(n1022), .B(n1021), .C(n1020), .D(n1019), .Y(n1088) );
  INVX2TS U745 ( .A(intDX_EWSW[28]), .Y(n1103) );
  NAND2BXLTS U746 ( .AN(busy), .B(n1114), .Y(n_7_net_) );
  OAI21XLTS U747 ( .A0(n634), .A1(n394), .B0(n459), .Y(Data_array_SWR[6]) );
  MX2X1TS U748 ( .A(n788), .B(n787), .S0(n852), .Y(Raw_mant_SGF[13]) );
  MX2X1TS U749 ( .A(n801), .B(n800), .S0(n852), .Y(Raw_mant_SGF[11]) );
  OAI21XLTS U750 ( .A0(n927), .A1(n789), .B0(n925), .Y(n792) );
  OAI21XLTS U751 ( .A0(n630), .A1(n394), .B0(n462), .Y(Data_array_SWR[14]) );
  OAI21XLTS U752 ( .A0(n661), .A1(n411), .B0(n648), .Y(Data_array_SWR[10]) );
  OAI21XLTS U753 ( .A0(n649), .A1(n411), .B0(n644), .Y(Data_array_SWR[18]) );
  MX2X1TS U754 ( .A(n757), .B(n756), .S0(n852), .Y(Raw_mant_SGF[8]) );
  MX2X1TS U755 ( .A(n744), .B(n743), .S0(n852), .Y(Raw_mant_SGF[9]) );
  MX2X1TS U756 ( .A(n971), .B(n970), .S0(n985), .Y(Raw_mant_SGF[4]) );
  MX2X1TS U757 ( .A(n949), .B(n948), .S0(n947), .Y(Raw_mant_SGF[7]) );
  MX2X1TS U758 ( .A(n984), .B(n983), .S0(n985), .Y(Raw_mant_SGF[2]) );
  CLKAND2X2TS U759 ( .A(n981), .B(n980), .Y(n984) );
  MX2X1TS U760 ( .A(n935), .B(n934), .S0(n947), .Y(Raw_mant_SGF[10]) );
  MX2X1TS U761 ( .A(n959), .B(n958), .S0(n985), .Y(Raw_mant_SGF[5]) );
  CLKAND2X2TS U762 ( .A(n417), .B(sftr_odat_SHT2_SWR[24]), .Y(
        formatted_number_W[22]) );
  CLKAND2X2TS U763 ( .A(n416), .B(sftr_odat_SHT2_SWR[23]), .Y(
        formatted_number_W[21]) );
  CLKAND2X2TS U764 ( .A(n418), .B(sftr_odat_SHT2_SWR[22]), .Y(
        formatted_number_W[20]) );
  CLKAND2X2TS U765 ( .A(n417), .B(sftr_odat_SHT2_SWR[21]), .Y(
        formatted_number_W[19]) );
  CLKAND2X2TS U766 ( .A(n416), .B(sftr_odat_SHT2_SWR[20]), .Y(
        formatted_number_W[18]) );
  CLKAND2X2TS U767 ( .A(n418), .B(sftr_odat_SHT2_SWR[19]), .Y(
        formatted_number_W[17]) );
  CLKAND2X2TS U768 ( .A(n417), .B(sftr_odat_SHT2_SWR[18]), .Y(
        formatted_number_W[16]) );
  CLKAND2X2TS U769 ( .A(n416), .B(sftr_odat_SHT2_SWR[17]), .Y(
        formatted_number_W[15]) );
  CLKAND2X2TS U770 ( .A(n418), .B(sftr_odat_SHT2_SWR[16]), .Y(
        formatted_number_W[14]) );
  CLKAND2X2TS U771 ( .A(n417), .B(sftr_odat_SHT2_SWR[9]), .Y(
        formatted_number_W[7]) );
  CLKAND2X2TS U772 ( .A(n416), .B(sftr_odat_SHT2_SWR[8]), .Y(
        formatted_number_W[6]) );
  CLKAND2X2TS U773 ( .A(n418), .B(sftr_odat_SHT2_SWR[7]), .Y(
        formatted_number_W[5]) );
  CLKAND2X2TS U774 ( .A(n417), .B(sftr_odat_SHT2_SWR[6]), .Y(
        formatted_number_W[4]) );
  CLKAND2X2TS U775 ( .A(n416), .B(sftr_odat_SHT2_SWR[5]), .Y(
        formatted_number_W[3]) );
  CLKAND2X2TS U776 ( .A(n418), .B(sftr_odat_SHT2_SWR[4]), .Y(
        formatted_number_W[2]) );
  CLKAND2X2TS U777 ( .A(n417), .B(sftr_odat_SHT2_SWR[3]), .Y(
        formatted_number_W[1]) );
  CLKAND2X2TS U778 ( .A(n416), .B(sftr_odat_SHT2_SWR[2]), .Y(
        formatted_number_W[0]) );
  CLKAND2X2TS U779 ( .A(n417), .B(n1158), .Y(formatted_number_W[13]) );
  CLKAND2X2TS U780 ( .A(n416), .B(n1159), .Y(formatted_number_W[12]) );
  CLKAND2X2TS U781 ( .A(n418), .B(n1160), .Y(formatted_number_W[11]) );
  CLKAND2X2TS U782 ( .A(n417), .B(n1161), .Y(formatted_number_W[10]) );
  CLKAND2X2TS U783 ( .A(n416), .B(n1162), .Y(formatted_number_W[9]) );
  CLKAND2X2TS U784 ( .A(n418), .B(n1163), .Y(formatted_number_W[8]) );
  NOR3X6TS U785 ( .A(n553), .B(exp_rslt_NRM2_EW1[7]), .C(n530), .Y(
        array_comparators_LTComparator_N0) );
  OR4X2TS U786 ( .A(exp_rslt_NRM2_EW1[6]), .B(exp_rslt_NRM2_EW1[5]), .C(
        exp_rslt_NRM2_EW1[4]), .D(n529), .Y(n530) );
  NOR2XLTS U787 ( .A(array_comparators_GTComparator_N0), .B(n554), .Y(
        formatted_number_W[30]) );
  OR2X1TS U788 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[6]), .Y(formatted_number_W[29]) );
  OR2X1TS U789 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[5]), .Y(formatted_number_W[28]) );
  OR2X1TS U790 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[4]), .Y(formatted_number_W[27]) );
  OR2X1TS U791 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[3]), .Y(formatted_number_W[26]) );
  OR2X1TS U792 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[2]), .Y(formatted_number_W[25]) );
  OR2X1TS U793 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[1]), .Y(formatted_number_W[24]) );
  OR2X1TS U794 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[0]), .Y(formatted_number_W[23]) );
  MX2X1TS U795 ( .A(n528), .B(n527), .S0(n985), .Y(Raw_mant_SGF[6]) );
  MX2X1TS U796 ( .A(n924), .B(n923), .S0(n947), .Y(Raw_mant_SGF[14]) );
  MX2X1TS U797 ( .A(N60), .B(n986), .S0(n985), .Y(Raw_mant_SGF[1]) );
  AO22XLTS U798 ( .A0(n451), .A1(LZD_raw_out_EWR[2]), .B0(
        Shift_amount_SHT1_EWR[2]), .B1(n1109), .Y(shft_value_mux_o_EWR[2]) );
  MX2X1TS U799 ( .A(n773), .B(n772), .S0(n852), .Y(Raw_mant_SGF[12]) );
  OAI21XLTS U800 ( .A0(n927), .A1(n760), .B0(n759), .Y(n764) );
  OAI21XLTS U801 ( .A0(n1106), .A1(n408), .B0(n641), .Y(Data_array_SWR[22]) );
  MX2X1TS U802 ( .A(n979), .B(n978), .S0(n985), .Y(Raw_mant_SGF[3]) );
  AOI211X1TS U803 ( .A0(n506), .A1(Raw_mant_NRM_SWR[0]), .B0(n505), .C0(n677), 
        .Y(n509) );
  NAND4BX1TS U804 ( .AN(n505), .B(n438), .C(n437), .D(n436), .Y(
        LZD_raw_out_EWR[1]) );
  AOI31XLTS U805 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n447), .A2(n432), .B0(n678), 
        .Y(n437) );
  NAND3BXLTS U806 ( .AN(Raw_mant_NRM_SWR[17]), .B(n447), .C(
        Raw_mant_NRM_SWR[16]), .Y(n448) );
  MX2X1TS U807 ( .A(n875), .B(n874), .S0(n947), .Y(Raw_mant_SGF[24]) );
  MX2X1TS U808 ( .A(n865), .B(n864), .S0(n947), .Y(Raw_mant_SGF[23]) );
  MX2X1TS U809 ( .A(n854), .B(n853), .S0(n852), .Y(Raw_mant_SGF[22]) );
  MX2X1TS U810 ( .A(n826), .B(n825), .S0(n852), .Y(Raw_mant_SGF[21]) );
  MX2X1TS U811 ( .A(n834), .B(n833), .S0(n852), .Y(Raw_mant_SGF[20]) );
  MX2X1TS U812 ( .A(n843), .B(n842), .S0(n852), .Y(Raw_mant_SGF[19]) );
  MX2X1TS U813 ( .A(n890), .B(n889), .S0(n947), .Y(Raw_mant_SGF[18]) );
  MX2X1TS U814 ( .A(n899), .B(n898), .S0(n947), .Y(Raw_mant_SGF[17]) );
  MX2X1TS U815 ( .A(n907), .B(n906), .S0(n947), .Y(Raw_mant_SGF[16]) );
  MX2X1TS U816 ( .A(n916), .B(n915), .S0(n947), .Y(Raw_mant_SGF[15]) );
  XOR2XLTS U817 ( .A(intadd_427_n1), .B(n987), .Y(Shift_amount_EXP_EW[4]) );
  OA21XLTS U818 ( .A0(n583), .A1(Data_array_SWR[50]), .B0(n582), .Y(n395) );
  NAND2X1TS U819 ( .A(n457), .B(n454), .Y(n452) );
  BUFX3TS U820 ( .A(n452), .Y(n413) );
  BUFX3TS U821 ( .A(n452), .Y(n412) );
  INVX2TS U822 ( .A(n410), .Y(n715) );
  CLKINVX3TS U823 ( .A(rst), .Y(n531) );
  NOR2X4TS U824 ( .A(Raw_mant_NRM_SWR[25]), .B(Raw_mant_NRM_SWR[24]), .Y(n434)
         );
  NAND2X4TS U825 ( .A(n680), .B(n676), .Y(n431) );
  NOR2X6TS U826 ( .A(n457), .B(n456), .Y(n625) );
  OR2X2TS U827 ( .A(ADD_OVRFLW_NRM2), .B(LZD_output_NRM2_EW[0]), .Y(n421) );
  XOR2X1TS U828 ( .A(DP_OP_15J179_122_6956_n28), .B(n421), .Y(
        DP_OP_15J179_122_6956_n18) );
  OR2X4TS U829 ( .A(array_comparators_LTComparator_N0), .B(
        array_comparators_GTComparator_N0), .Y(n1108) );
  INVX2TS U830 ( .A(n398), .Y(n401) );
  INVX2TS U831 ( .A(n398), .Y(n402) );
  INVX2TS U832 ( .A(n397), .Y(n403) );
  INVX2TS U833 ( .A(n397), .Y(n404) );
  INVX2TS U834 ( .A(n494), .Y(n405) );
  INVX2TS U835 ( .A(n405), .Y(n406) );
  INVX2TS U836 ( .A(n405), .Y(n407) );
  INVX4TS U837 ( .A(n637), .Y(n455) );
  INVX2TS U838 ( .A(left_right_SHT2), .Y(n409) );
  INVX2TS U839 ( .A(n409), .Y(n410) );
  OAI221X1TS U840 ( .A0(n1131), .A1(intDY_EWSW[3]), .B0(n1172), .B1(
        intDY_EWSW[26]), .C0(n997), .Y(n1000) );
  OAI221X1TS U841 ( .A0(n1128), .A1(intDY_EWSW[20]), .B0(n1176), .B1(
        intDY_EWSW[30]), .C0(n1011), .Y(n1018) );
  NOR2X2TS U842 ( .A(n423), .B(Raw_mant_NRM_SWR[18]), .Y(n680) );
  INVX2TS U843 ( .A(n395), .Y(n414) );
  OAI21X2TS U844 ( .A0(n583), .A1(Data_array_SWR[48]), .B0(n582), .Y(n697) );
  OAI21X2TS U845 ( .A0(n583), .A1(Data_array_SWR[49]), .B0(n582), .Y(n700) );
  CLKBUFX3TS U846 ( .A(n511), .Y(n1275) );
  BUFX3TS U847 ( .A(n531), .Y(n513) );
  CLKBUFX3TS U848 ( .A(n531), .Y(n511) );
  AOI21X2TS U849 ( .A0(n493), .A1(Data_array_SWR[47]), .B0(n563), .Y(n594) );
  AOI21X2TS U850 ( .A0(n493), .A1(Data_array_SWR[46]), .B0(n565), .Y(n600) );
  OAI21X2TS U851 ( .A0(n1121), .A1(n556), .B0(n460), .Y(n636) );
  NOR2XLTS U852 ( .A(Raw_mant_NRM_SWR[13]), .B(Raw_mant_NRM_SWR[11]), .Y(n668)
         );
  INVX4TS U853 ( .A(n625), .Y(n415) );
  INVX4TS U854 ( .A(n625), .Y(n704) );
  INVX2TS U855 ( .A(n1108), .Y(n416) );
  INVX2TS U856 ( .A(n1108), .Y(n417) );
  INVX2TS U857 ( .A(n1108), .Y(n418) );
  OAI221X1TS U858 ( .A0(n1165), .A1(intDY_EWSW[10]), .B0(n1134), .B1(
        intDY_EWSW[2]), .C0(n989), .Y(n992) );
  OAI221X1TS U859 ( .A0(n1130), .A1(intDY_EWSW[27]), .B0(n1171), .B1(
        intDY_EWSW[19]), .C0(n1005), .Y(n1008) );
  OAI221X1TS U860 ( .A0(n1166), .A1(intDY_EWSW[17]), .B0(n1181), .B1(
        intDY_EWSW[16]), .C0(n1013), .Y(n1016) );
  OAI21XLTS U861 ( .A0(DmP_EXP_EWSW[23]), .A1(n420), .B0(n534), .Y(
        Shift_amount_EXP_EW[0]) );
  OAI221X1TS U862 ( .A0(n1186), .A1(intDY_EWSW[7]), .B0(n1170), .B1(
        intDY_EWSW[14]), .C0(n995), .Y(n1002) );
  NOR2X2TS U863 ( .A(n1121), .B(n431), .Y(n678) );
  OAI2BB2XLTS U864 ( .B0(n1054), .B1(n1061), .A0N(n1053), .A1N(n1052), .Y(
        n1057) );
  NAND2X4TS U865 ( .A(n715), .B(n400), .Y(n701) );
  NAND2X4TS U866 ( .A(n1156), .B(left_right_SHT2), .Y(n694) );
  BUFX3TS U867 ( .A(n531), .Y(n512) );
  OAI21X2TS U868 ( .A0(n532), .A1(n1190), .B0(n465), .Y(n640) );
  OAI21X2TS U869 ( .A0(n1116), .A1(n556), .B0(n453), .Y(n611) );
  OR2X1TS U870 ( .A(n1120), .B(DMP_SFG[9]), .Y(n768) );
  NOR2X1TS U871 ( .A(n1201), .B(DMP_SFG[21]), .Y(n870) );
  AOI21X2TS U872 ( .A0(n493), .A1(Data_array_SWR[45]), .B0(n581), .Y(n687) );
  AOI21X2TS U873 ( .A0(n493), .A1(Data_array_SWR[44]), .B0(n572), .Y(n691) );
  NOR2X2TS U874 ( .A(DMP_SFG[2]), .B(DmP_mant_SFG_SWR[4]), .Y(n960) );
  NOR2X2TS U875 ( .A(DMP_SFG[3]), .B(DmP_mant_SFG_SWR[5]), .Y(n951) );
  AOI211X2TS U876 ( .A0(n493), .A1(Data_array_SWR[43]), .B0(n707), .C0(n541), 
        .Y(n589) );
  AOI211X2TS U877 ( .A0(n493), .A1(Data_array_SWR[42]), .B0(n707), .C0(n535), 
        .Y(n604) );
  NOR2X1TS U878 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[8]), .Y(n503)
         );
  NAND2X1TS U879 ( .A(DMP_SFG[8]), .B(DmP_mant_SFG_SWR[10]), .Y(n925) );
  NOR2X4TS U880 ( .A(Raw_mant_NRM_SWR[7]), .B(n426), .Y(n507) );
  AOI211X4TS U881 ( .A0(intDY_EWSW[28]), .A1(n419), .B0(n1030), .C0(n1028), 
        .Y(n1081) );
  OAI221X1TS U882 ( .A0(n1103), .A1(intDY_EWSW[28]), .B0(n1137), .B1(
        intDY_EWSW[6]), .C0(n1003), .Y(n1010) );
  NOR2X4TS U883 ( .A(Raw_mant_NRM_SWR[10]), .B(n502), .Y(n425) );
  OAI31X1TS U884 ( .A0(n503), .A1(Raw_mant_NRM_SWR[10]), .A2(n502), .B0(n501), 
        .Y(n510) );
  OAI21XLTS U885 ( .A0(intDX_EWSW[1]), .A1(n1223), .B0(intDX_EWSW[0]), .Y(
        n1035) );
  OAI21XLTS U886 ( .A0(intDX_EWSW[21]), .A1(n1211), .B0(intDX_EWSW[20]), .Y(
        n1067) );
  NOR2X1TS U887 ( .A(n752), .B(n735), .Y(n737) );
  NAND2X1TS U888 ( .A(n725), .B(n479), .Y(n481) );
  INVX2TS U889 ( .A(n730), .Y(n523) );
  OR2X1TS U890 ( .A(DMP_SFG[9]), .B(DmP_mant_SFG_SWR[11]), .Y(n791) );
  OAI21XLTS U891 ( .A0(n963), .A1(n960), .B0(n961), .Y(n954) );
  OR2X1TS U892 ( .A(n707), .B(n712), .Y(n714) );
  NOR2X2TS U893 ( .A(Raw_mant_NRM_SWR[3]), .B(n439), .Y(n506) );
  AOI21X2TS U894 ( .A0(n888), .A1(n818), .B0(n817), .Y(n841) );
  OAI21X2TS U895 ( .A0(n911), .A1(n908), .B0(n909), .Y(n902) );
  OAI21XLTS U896 ( .A0(n748), .A1(n745), .B0(n746), .Y(n729) );
  OAI21XLTS U897 ( .A0(n977), .A1(n966), .B0(n965), .Y(n969) );
  AND2X2TS U898 ( .A(n553), .B(n552), .Y(array_comparators_GTComparator_N0) );
  OAI21XLTS U899 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(n1111), .B0(
        n1110), .Y(n388) );
  NOR3X2TS U900 ( .A(Raw_mant_NRM_SWR[12]), .B(Raw_mant_NRM_SWR[13]), .C(
        Raw_mant_NRM_SWR[11]), .Y(n684) );
  NOR3X2TS U901 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[19]), .C(
        Raw_mant_NRM_SWR[20]), .Y(n670) );
  NOR2X2TS U902 ( .A(Raw_mant_NRM_SWR[22]), .B(Raw_mant_NRM_SWR[23]), .Y(n433)
         );
  NAND2X2TS U903 ( .A(n434), .B(n433), .Y(n669) );
  NOR2BX4TS U904 ( .AN(n670), .B(n669), .Y(n447) );
  NOR2X2TS U905 ( .A(Raw_mant_NRM_SWR[16]), .B(Raw_mant_NRM_SWR[17]), .Y(n432)
         );
  INVX2TS U906 ( .A(n432), .Y(n424) );
  NOR2X4TS U907 ( .A(Raw_mant_NRM_SWR[14]), .B(n431), .Y(n430) );
  NAND2X4TS U908 ( .A(n684), .B(n430), .Y(n502) );
  NAND2X4TS U909 ( .A(n503), .B(n425), .Y(n426) );
  OA21XLTS U910 ( .A0(Raw_mant_NRM_SWR[3]), .A1(Raw_mant_NRM_SWR[2]), .B0(n672), .Y(n429) );
  OAI21X1TS U911 ( .A0(Raw_mant_NRM_SWR[7]), .A1(Raw_mant_NRM_SWR[6]), .B0(
        n427), .Y(n428) );
  NAND2BX2TS U912 ( .AN(n429), .B(n428), .Y(n505) );
  INVX2TS U913 ( .A(n430), .Y(n683) );
  NOR2X1TS U914 ( .A(Raw_mant_NRM_SWR[13]), .B(n683), .Y(n443) );
  NAND2BX1TS U915 ( .AN(n502), .B(Raw_mant_NRM_SWR[10]), .Y(n681) );
  OAI2BB1X1TS U916 ( .A0N(Raw_mant_NRM_SWR[18]), .A1N(n447), .B0(n681), .Y(
        n442) );
  OAI31X1TS U917 ( .A0(n1194), .A1(Raw_mant_NRM_SWR[21]), .A2(
        Raw_mant_NRM_SWR[20]), .B0(n433), .Y(n435) );
  NAND2X1TS U918 ( .A(n435), .B(n434), .Y(n436) );
  NAND2BX1TS U919 ( .AN(n675), .B(Raw_mant_NRM_SWR[4]), .Y(n501) );
  AOI21X1TS U920 ( .A0(n1151), .A1(Raw_mant_NRM_SWR[0]), .B0(
        Raw_mant_NRM_SWR[2]), .Y(n440) );
  INVX2TS U921 ( .A(n672), .Y(n439) );
  OAI22X4TS U922 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n501), .B0(n440), .B1(n504), 
        .Y(n441) );
  AOI211X2TS U923 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n443), .B0(n442), .C0(n441), 
        .Y(n674) );
  NOR4X1TS U924 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[13]), .C(
        Raw_mant_NRM_SWR[11]), .D(n683), .Y(n444) );
  AOI22X1TS U925 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n444), .B0(
        Raw_mant_NRM_SWR[6]), .B1(n507), .Y(n450) );
  AOI21X1TS U926 ( .A0(n1183), .A1(Raw_mant_NRM_SWR[20]), .B0(
        Raw_mant_NRM_SWR[22]), .Y(n445) );
  AOI21X1TS U927 ( .A0(n446), .A1(n1180), .B0(n678), .Y(n449) );
  NAND4X2TS U928 ( .A(n674), .B(n450), .C(n449), .D(n448), .Y(
        LZD_raw_out_EWR[0]) );
  OR2X2TS U929 ( .A(n1155), .B(n1153), .Y(n556) );
  INVX2TS U930 ( .A(n556), .Y(n616) );
  BUFX3TS U931 ( .A(n1155), .Y(n618) );
  NOR2X1TS U932 ( .A(ADD_OVRFLW_NRM), .B(n618), .Y(n451) );
  INVX2TS U933 ( .A(n451), .Y(n532) );
  BUFX3TS U934 ( .A(n1155), .Y(n1114) );
  AOI222X4TS U935 ( .A0(n622), .A1(Raw_mant_NRM_SWR[7]), .B0(n621), .B1(
        Raw_mant_NRM_SWR[18]), .C0(n1114), .C1(DmP_mant_SHT1_SW[5]), .Y(n634)
         );
  AOI22X4TS U936 ( .A0(n621), .A1(LZD_raw_out_EWR[1]), .B0(
        Shift_amount_SHT1_EWR[1]), .B1(n618), .Y(n457) );
  OAI22X4TS U937 ( .A0(Shift_reg_FLAGS_7[1]), .A1(Shift_amount_SHT1_EWR[0]), 
        .B0(LZD_raw_out_EWR[0]), .B1(n532), .Y(n454) );
  INVX4TS U938 ( .A(n454), .Y(n456) );
  INVX2TS U939 ( .A(n452), .Y(n647) );
  AOI22X1TS U940 ( .A0(n1233), .A1(Raw_mant_NRM_SWR[19]), .B0(n618), .B1(
        DmP_mant_SHT1_SW[4]), .Y(n453) );
  INVX2TS U941 ( .A(n556), .Y(n622) );
  AOI222X4TS U942 ( .A0(n618), .A1(DmP_mant_SHT1_SW[7]), .B0(
        Raw_mant_NRM_SWR[9]), .B1(n1232), .C0(Raw_mant_NRM_SWR[16]), .C1(n621), 
        .Y(n667) );
  NOR2X4TS U943 ( .A(n454), .B(n457), .Y(n637) );
  AOI222X4TS U944 ( .A0(n622), .A1(Raw_mant_NRM_SWR[8]), .B0(n621), .B1(
        Raw_mant_NRM_SWR[17]), .C0(n1114), .C1(DmP_mant_SHT1_SW[6]), .Y(n631)
         );
  OAI22X1TS U945 ( .A0(n667), .A1(n408), .B0(n631), .B1(n704), .Y(n458) );
  AOI21X1TS U946 ( .A0(n647), .A1(n611), .B0(n458), .Y(n459) );
  INVX2TS U947 ( .A(n556), .Y(n1232) );
  AOI222X4TS U948 ( .A0(n1114), .A1(DmP_mant_SHT1_SW[13]), .B0(n559), .B1(
        Raw_mant_NRM_SWR[10]), .C0(Raw_mant_NRM_SWR[15]), .C1(n616), .Y(n630)
         );
  AOI22X1TS U949 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n1233), .B0(
        DmP_mant_SHT1_SW[12]), .B1(n618), .Y(n460) );
  BUFX3TS U950 ( .A(n1155), .Y(n1109) );
  AOI222X4TS U951 ( .A0(n622), .A1(Raw_mant_NRM_SWR[17]), .B0(n621), .B1(
        Raw_mant_NRM_SWR[8]), .C0(n1109), .C1(DmP_mant_SHT1_SW[15]), .Y(n654)
         );
  AOI222X4TS U952 ( .A0(n1114), .A1(DmP_mant_SHT1_SW[14]), .B0(n621), .B1(
        Raw_mant_NRM_SWR[9]), .C0(Raw_mant_NRM_SWR[16]), .C1(n1232), .Y(n627)
         );
  OAI22X1TS U953 ( .A0(n654), .A1(n408), .B0(n627), .B1(n704), .Y(n461) );
  AOI21X1TS U954 ( .A0(n647), .A1(n636), .B0(n461), .Y(n462) );
  AOI222X4TS U955 ( .A0(n616), .A1(Raw_mant_NRM_SWR[5]), .B0(n1233), .B1(
        Raw_mant_NRM_SWR[20]), .C0(n1114), .C1(DmP_mant_SHT1_SW[3]), .Y(n656)
         );
  OAI22X1TS U956 ( .A0(n634), .A1(n408), .B0(n656), .B1(n411), .Y(n463) );
  AOI21X1TS U957 ( .A0(n625), .A1(n611), .B0(n463), .Y(n464) );
  AOI222X4TS U958 ( .A0(n1232), .A1(Raw_mant_NRM_SWR[20]), .B0(n621), .B1(
        Raw_mant_NRM_SWR[5]), .C0(n1114), .C1(DmP_mant_SHT1_SW[18]), .Y(n650)
         );
  AOI22X1TS U959 ( .A0(n622), .A1(Raw_mant_NRM_SWR[22]), .B0(n618), .B1(
        DmP_mant_SHT1_SW[20]), .Y(n465) );
  AOI222X4TS U960 ( .A0(n1232), .A1(Raw_mant_NRM_SWR[23]), .B0(n559), .B1(
        Raw_mant_NRM_SWR[2]), .C0(n1109), .C1(DmP_mant_SHT1_SW[21]), .Y(n703)
         );
  AOI222X4TS U961 ( .A0(n616), .A1(Raw_mant_NRM_SWR[21]), .B0(n559), .B1(
        Raw_mant_NRM_SWR[4]), .C0(n1109), .C1(DmP_mant_SHT1_SW[19]), .Y(n642)
         );
  OAI22X1TS U962 ( .A0(n703), .A1(n408), .B0(n642), .B1(n394), .Y(n466) );
  AOI21X1TS U963 ( .A0(n625), .A1(n640), .B0(n466), .Y(n467) );
  AOI222X4TS U964 ( .A0(n618), .A1(DmP_mant_SHT1_SW[10]), .B0(
        Raw_mant_NRM_SWR[12]), .B1(n616), .C0(Raw_mant_NRM_SWR[13]), .C1(n621), 
        .Y(n663) );
  AOI222X4TS U965 ( .A0(n1114), .A1(DmP_mant_SHT1_SW[11]), .B0(n559), .B1(
        Raw_mant_NRM_SWR[12]), .C0(Raw_mant_NRM_SWR[13]), .C1(n1232), .Y(n645)
         );
  OAI22X1TS U966 ( .A0(n630), .A1(n662), .B0(n645), .B1(n411), .Y(n468) );
  AOI21X1TS U967 ( .A0(n625), .A1(n636), .B0(n468), .Y(n469) );
  AOI222X4TS U968 ( .A0(n622), .A1(Raw_mant_NRM_SWR[24]), .B0(n559), .B1(
        Raw_mant_NRM_SWR[1]), .C0(n1109), .C1(DmP_mant_SHT1_SW[22]), .Y(n1107)
         );
  OAI22X1TS U969 ( .A0(n1107), .A1(n408), .B0(n703), .B1(n704), .Y(n470) );
  AOI21X1TS U970 ( .A0(n393), .A1(n640), .B0(n470), .Y(n471) );
  OAI22X1TS U971 ( .A0(n631), .A1(n408), .B0(n634), .B1(n704), .Y(n472) );
  AOI21X1TS U972 ( .A0(n393), .A1(n611), .B0(n472), .Y(n473) );
  OAI22X1TS U973 ( .A0(n627), .A1(n662), .B0(n630), .B1(n704), .Y(n474) );
  AOI21X1TS U974 ( .A0(n393), .A1(n636), .B0(n474), .Y(n475) );
  NOR2X1TS U975 ( .A(DMP_SFG[1]), .B(DmP_mant_SFG_SWR[3]), .Y(n972) );
  NAND2X1TS U976 ( .A(DMP_SFG[1]), .B(DmP_mant_SFG_SWR[3]), .Y(n973) );
  NOR2X1TS U977 ( .A(n960), .B(n951), .Y(n477) );
  NAND2X1TS U978 ( .A(DMP_SFG[2]), .B(DmP_mant_SFG_SWR[4]), .Y(n961) );
  NAND2X1TS U979 ( .A(DMP_SFG[3]), .B(DmP_mant_SFG_SWR[5]), .Y(n952) );
  OAI21X1TS U980 ( .A0(n951), .A1(n961), .B0(n952), .Y(n476) );
  AOI21X2TS U981 ( .A0(n950), .A1(n477), .B0(n476), .Y(n514) );
  NOR2X1TS U982 ( .A(DMP_SFG[4]), .B(DmP_mant_SFG_SWR[6]), .Y(n515) );
  NOR2X2TS U983 ( .A(DMP_SFG[5]), .B(DmP_mant_SFG_SWR[7]), .Y(n940) );
  NOR2X1TS U984 ( .A(n515), .B(n940), .Y(n725) );
  NOR2X2TS U985 ( .A(DMP_SFG[6]), .B(DmP_mant_SFG_SWR[8]), .Y(n745) );
  NOR2X2TS U986 ( .A(DMP_SFG[7]), .B(DmP_mant_SFG_SWR[9]), .Y(n726) );
  NAND2X1TS U987 ( .A(DMP_SFG[4]), .B(DmP_mant_SFG_SWR[6]), .Y(n936) );
  NAND2X1TS U988 ( .A(DMP_SFG[5]), .B(DmP_mant_SFG_SWR[7]), .Y(n941) );
  OAI21X1TS U989 ( .A0(n940), .A1(n936), .B0(n941), .Y(n724) );
  NAND2X1TS U990 ( .A(DMP_SFG[7]), .B(DmP_mant_SFG_SWR[9]), .Y(n727) );
  AOI21X1TS U991 ( .A0(n724), .A1(n479), .B0(n478), .Y(n480) );
  NOR2X1TS U992 ( .A(DMP_SFG[8]), .B(DmP_mant_SFG_SWR[10]), .Y(n789) );
  INVX2TS U993 ( .A(n789), .Y(n926) );
  NOR2X2TS U994 ( .A(DMP_SFG[10]), .B(DmP_mant_SFG_SWR[12]), .Y(n761) );
  INVX2TS U995 ( .A(n925), .Y(n483) );
  NAND2X1TS U996 ( .A(DMP_SFG[9]), .B(DmP_mant_SFG_SWR[11]), .Y(n790) );
  INVX2TS U997 ( .A(n790), .Y(n482) );
  AOI21X1TS U998 ( .A0(n791), .A1(n483), .B0(n482), .Y(n759) );
  NAND2X1TS U999 ( .A(DMP_SFG[10]), .B(DmP_mant_SFG_SWR[12]), .Y(n762) );
  OAI21X1TS U1000 ( .A0(n759), .A1(n761), .B0(n762), .Y(n484) );
  AOI21X4TS U1001 ( .A0(n758), .A1(n485), .B0(n484), .Y(n777) );
  NOR2X1TS U1002 ( .A(DMP_SFG[11]), .B(DmP_mant_SFG_SWR[13]), .Y(n774) );
  NAND2X1TS U1003 ( .A(DMP_SFG[11]), .B(DmP_mant_SFG_SWR[13]), .Y(n775) );
  OAI21X4TS U1004 ( .A0(n777), .A1(n774), .B0(n775), .Y(n919) );
  OR2X1TS U1005 ( .A(DMP_SFG[12]), .B(DmP_mant_SFG_SWR[14]), .Y(n918) );
  NAND2X1TS U1006 ( .A(DMP_SFG[12]), .B(DmP_mant_SFG_SWR[14]), .Y(n917) );
  INVX2TS U1007 ( .A(n917), .Y(n486) );
  NOR2X1TS U1008 ( .A(DMP_SFG[13]), .B(DmP_mant_SFG_SWR[15]), .Y(n908) );
  NAND2X1TS U1009 ( .A(DMP_SFG[13]), .B(DmP_mant_SFG_SWR[15]), .Y(n909) );
  OR2X1TS U1010 ( .A(DMP_SFG[14]), .B(DmP_mant_SFG_SWR[16]), .Y(n901) );
  NAND2X1TS U1011 ( .A(DMP_SFG[14]), .B(DmP_mant_SFG_SWR[16]), .Y(n900) );
  INVX2TS U1012 ( .A(n900), .Y(n487) );
  AOI21X4TS U1013 ( .A0(n902), .A1(n901), .B0(n487), .Y(n894) );
  NOR2X1TS U1014 ( .A(DMP_SFG[15]), .B(DmP_mant_SFG_SWR[17]), .Y(n891) );
  NAND2X1TS U1015 ( .A(DMP_SFG[15]), .B(DmP_mant_SFG_SWR[17]), .Y(n892) );
  OR2X1TS U1016 ( .A(DMP_SFG[16]), .B(DmP_mant_SFG_SWR[18]), .Y(n884) );
  NAND2X1TS U1017 ( .A(DMP_SFG[16]), .B(DmP_mant_SFG_SWR[18]), .Y(n883) );
  INVX2TS U1018 ( .A(n883), .Y(n488) );
  AOI21X4TS U1019 ( .A0(n885), .A1(n884), .B0(n488), .Y(n838) );
  NOR2X1TS U1020 ( .A(DMP_SFG[17]), .B(DmP_mant_SFG_SWR[19]), .Y(n835) );
  NAND2X1TS U1021 ( .A(DMP_SFG[17]), .B(DmP_mant_SFG_SWR[19]), .Y(n836) );
  OR2X1TS U1022 ( .A(DMP_SFG[18]), .B(DmP_mant_SFG_SWR[20]), .Y(n828) );
  NAND2X1TS U1023 ( .A(DMP_SFG[18]), .B(DmP_mant_SFG_SWR[20]), .Y(n827) );
  INVX2TS U1024 ( .A(n827), .Y(n489) );
  NOR2X1TS U1025 ( .A(DMP_SFG[19]), .B(DmP_mant_SFG_SWR[21]), .Y(n802) );
  NAND2X1TS U1026 ( .A(DMP_SFG[19]), .B(DmP_mant_SFG_SWR[21]), .Y(n803) );
  OR2X1TS U1027 ( .A(DMP_SFG[20]), .B(DmP_mant_SFG_SWR[22]), .Y(n845) );
  NAND2X1TS U1028 ( .A(DMP_SFG[20]), .B(DmP_mant_SFG_SWR[22]), .Y(n844) );
  INVX2TS U1029 ( .A(n844), .Y(n490) );
  AOI21X4TS U1030 ( .A0(n846), .A1(n845), .B0(n490), .Y(n858) );
  NOR2X1TS U1031 ( .A(DMP_SFG[21]), .B(DmP_mant_SFG_SWR[23]), .Y(n855) );
  NAND2X1TS U1032 ( .A(DMP_SFG[21]), .B(DmP_mant_SFG_SWR[23]), .Y(n856) );
  OAI21X4TS U1033 ( .A0(n858), .A1(n855), .B0(n856), .Y(n868) );
  OR2X1TS U1034 ( .A(DMP_SFG[22]), .B(DmP_mant_SFG_SWR[24]), .Y(n867) );
  NAND2X1TS U1035 ( .A(DMP_SFG[22]), .B(DmP_mant_SFG_SWR[24]), .Y(n866) );
  INVX2TS U1036 ( .A(n866), .Y(n491) );
  NAND2X1TS U1037 ( .A(n876), .B(n1230), .Y(n492) );
  BUFX3TS U1038 ( .A(OP_FLAG_SFG), .Y(n852) );
  NOR2BX1TS U1039 ( .AN(n492), .B(n852), .Y(ADD_OVRFLW_SGF) );
  NAND2X1TS U1040 ( .A(shift_value_SHT2_EWR[3]), .B(n1177), .Y(n540) );
  NAND2X1TS U1041 ( .A(shift_value_SHT2_EWR[4]), .B(bit_shift_SHT2), .Y(n545)
         );
  INVX2TS U1042 ( .A(n545), .Y(n712) );
  NAND3X2TS U1043 ( .A(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .C(n400), .Y(n710) );
  NAND2BX2TS U1044 ( .AN(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .Y(n580) );
  NOR2BX1TS U1045 ( .AN(n493), .B(shift_value_SHT2_EWR[4]), .Y(n494) );
  AOI22X1TS U1046 ( .A0(n403), .A1(Data_array_SWR[43]), .B0(n406), .B1(
        Data_array_SWR[39]), .Y(n495) );
  AOI211X1TS U1047 ( .A0(n402), .A1(Data_array_SWR[47]), .B0(n712), .C0(n496), 
        .Y(n499) );
  INVX1TS U1048 ( .A(Data_array_SWR[50]), .Y(n564) );
  AOI22X1TS U1049 ( .A0(n403), .A1(Data_array_SWR[42]), .B0(n406), .B1(
        Data_array_SWR[38]), .Y(n497) );
  AOI211X1TS U1050 ( .A0(n402), .A1(Data_array_SWR[46]), .B0(n712), .C0(n498), 
        .Y(n500) );
  MXI2X1TS U1051 ( .A(n499), .B(n500), .S0(left_right_SHT2), .Y(n1160) );
  MXI2X1TS U1052 ( .A(n500), .B(n499), .S0(n410), .Y(n1161) );
  NAND2X1TS U1053 ( .A(DmP_EXP_EWSW[23]), .B(n420), .Y(n534) );
  NOR3X1TS U1054 ( .A(Raw_mant_NRM_SWR[2]), .B(n504), .C(n1151), .Y(n677) );
  NAND2X1TS U1055 ( .A(Raw_mant_NRM_SWR[5]), .B(n507), .Y(n508) );
  AOI33XLTS U1056 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .B0(n1140), .B1(n1115), .B2(n1197), .Y(n390) );
  BUFX3TS U1057 ( .A(n511), .Y(n1250) );
  BUFX3TS U1058 ( .A(n531), .Y(n1249) );
  BUFX3TS U1059 ( .A(n513), .Y(n1257) );
  BUFX3TS U1060 ( .A(n531), .Y(n1248) );
  BUFX3TS U1061 ( .A(n511), .Y(n1270) );
  BUFX3TS U1062 ( .A(n1253), .Y(n1271) );
  BUFX3TS U1063 ( .A(n512), .Y(n1272) );
  BUFX3TS U1064 ( .A(n1252), .Y(n1273) );
  BUFX3TS U1065 ( .A(n513), .Y(n1274) );
  BUFX3TS U1066 ( .A(n531), .Y(n1253) );
  BUFX3TS U1067 ( .A(n1248), .Y(n1263) );
  BUFX3TS U1068 ( .A(n512), .Y(n1254) );
  BUFX3TS U1069 ( .A(n511), .Y(n1251) );
  BUFX3TS U1070 ( .A(n531), .Y(n1252) );
  BUFX3TS U1071 ( .A(n1249), .Y(n1265) );
  BUFX3TS U1072 ( .A(n1246), .Y(n1262) );
  BUFX3TS U1073 ( .A(n513), .Y(n1259) );
  BUFX3TS U1074 ( .A(n1246), .Y(n1260) );
  BUFX3TS U1075 ( .A(n1248), .Y(n1261) );
  BUFX3TS U1076 ( .A(n512), .Y(n1239) );
  BUFX3TS U1077 ( .A(n1252), .Y(n1242) );
  BUFX3TS U1078 ( .A(n1275), .Y(n1240) );
  BUFX3TS U1079 ( .A(n1275), .Y(n1241) );
  BUFX3TS U1080 ( .A(n1249), .Y(n1255) );
  BUFX3TS U1081 ( .A(n1275), .Y(n1256) );
  BUFX3TS U1082 ( .A(n511), .Y(n1266) );
  BUFX3TS U1083 ( .A(n511), .Y(n1269) );
  BUFX3TS U1084 ( .A(n531), .Y(n1246) );
  BUFX3TS U1085 ( .A(n1249), .Y(n1238) );
  BUFX3TS U1086 ( .A(n1253), .Y(n1237) );
  BUFX3TS U1087 ( .A(n512), .Y(n1236) );
  BUFX3TS U1088 ( .A(n1246), .Y(n1235) );
  BUFX3TS U1089 ( .A(n1252), .Y(n1268) );
  BUFX3TS U1090 ( .A(n1252), .Y(n1245) );
  BUFX3TS U1091 ( .A(n1246), .Y(n1258) );
  BUFX3TS U1092 ( .A(n1248), .Y(n1264) );
  BUFX3TS U1093 ( .A(n1253), .Y(n1234) );
  BUFX3TS U1094 ( .A(n1275), .Y(n1244) );
  BUFX3TS U1095 ( .A(n1249), .Y(n1267) );
  BUFX3TS U1096 ( .A(n1253), .Y(n1243) );
  INVX2TS U1097 ( .A(n514), .Y(n939) );
  NAND2X1TS U1098 ( .A(n938), .B(n936), .Y(n524) );
  XNOR2X1TS U1099 ( .A(n939), .B(n524), .Y(n528) );
  NOR2XLTS U1100 ( .A(n1152), .B(DMP_SFG[0]), .Y(n517) );
  NAND2X1TS U1101 ( .A(n1152), .B(DMP_SFG[0]), .Y(n516) );
  NOR2X1TS U1102 ( .A(n1149), .B(DMP_SFG[1]), .Y(n966) );
  NOR2X1TS U1103 ( .A(n1145), .B(DMP_SFG[2]), .Y(n519) );
  NOR2X1TS U1104 ( .A(n966), .B(n519), .Y(n521) );
  NAND2X1TS U1105 ( .A(n1149), .B(DMP_SFG[1]), .Y(n965) );
  NAND2X1TS U1106 ( .A(n1145), .B(DMP_SFG[2]), .Y(n518) );
  OAI21X1TS U1107 ( .A0(n519), .A1(n965), .B0(n518), .Y(n520) );
  INVX2TS U1108 ( .A(n740), .Y(n957) );
  NOR2X1TS U1109 ( .A(n1148), .B(DMP_SFG[3]), .Y(n730) );
  NAND2X1TS U1110 ( .A(n1148), .B(DMP_SFG[3]), .Y(n732) );
  AOI21X1TS U1111 ( .A0(n957), .A1(n523), .B0(n522), .Y(n526) );
  INVX2TS U1112 ( .A(n524), .Y(n525) );
  XOR2X1TS U1113 ( .A(n526), .B(n525), .Y(n527) );
  OR4X2TS U1114 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[2]), .C(
        exp_rslt_NRM2_EW1[1]), .D(exp_rslt_NRM2_EW1[0]), .Y(n529) );
  CLKBUFX3TS U1115 ( .A(n531), .Y(n1247) );
  NAND2X1TS U1116 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1115), .Y(
        n1111) );
  NAND2X1TS U1117 ( .A(n1140), .B(inst_FSM_INPUT_ENABLE_state_reg[0]), .Y(
        n1110) );
  INVX2TS U1118 ( .A(intadd_427_SUM_0_), .Y(Shift_amount_EXP_EW[1]) );
  OAI211X1TS U1119 ( .A0(n1115), .A1(n1110), .B0(n1111), .C0(beg_OP), .Y(n533)
         );
  INVX2TS U1120 ( .A(n533), .Y(enable_Pipeline_input) );
  INVX2TS U1121 ( .A(intadd_427_SUM_1_), .Y(Shift_amount_EXP_EW[2]) );
  INVX2TS U1122 ( .A(intadd_427_SUM_2_), .Y(Shift_amount_EXP_EW[3]) );
  INVX2TS U1123 ( .A(n534), .Y(intadd_427_CI) );
  NOR2BX2TS U1124 ( .AN(bit_shift_SHT2), .B(n493), .Y(n583) );
  OR2X2TS U1125 ( .A(n583), .B(n493), .Y(n582) );
  NAND2X2TS U1126 ( .A(bit_shift_SHT2), .B(shift_value_SHT2_EWR[3]), .Y(n579)
         );
  NOR2X2TS U1127 ( .A(n579), .B(n1177), .Y(n707) );
  OAI22X1TS U1128 ( .A0(n580), .A1(n1200), .B0(n540), .B1(n564), .Y(n535) );
  AOI22X1TS U1129 ( .A0(n407), .A1(Data_array_SWR[26]), .B0(n536), .B1(
        Data_array_SWR[38]), .Y(n538) );
  AOI22X1TS U1130 ( .A0(n404), .A1(Data_array_SWR[30]), .B0(n402), .B1(
        Data_array_SWR[34]), .Y(n537) );
  OAI211X1TS U1131 ( .A0(n604), .A1(n1156), .B0(n538), .C0(n537), .Y(n547) );
  NOR2X2TS U1132 ( .A(n715), .B(n545), .Y(n692) );
  AOI21X1TS U1133 ( .A0(n547), .A1(n715), .B0(n692), .Y(n539) );
  OAI22X1TS U1134 ( .A0(n580), .A1(n1138), .B0(n540), .B1(n1195), .Y(n541) );
  AOI22X1TS U1135 ( .A0(n536), .A1(Data_array_SWR[39]), .B0(n401), .B1(
        Data_array_SWR[35]), .Y(n543) );
  AOI22X1TS U1136 ( .A0(n404), .A1(Data_array_SWR[31]), .B0(n407), .B1(
        Data_array_SWR[27]), .Y(n542) );
  OAI211X1TS U1137 ( .A0(n589), .A1(n1156), .B0(n543), .C0(n542), .Y(n561) );
  AOI21X1TS U1138 ( .A0(n561), .A1(n715), .B0(n692), .Y(n544) );
  AOI21X1TS U1139 ( .A0(n410), .A1(n547), .B0(n546), .Y(n548) );
  NAND3BX1TS U1140 ( .AN(n549), .B(exp_rslt_NRM2_EW1[4]), .C(
        exp_rslt_NRM2_EW1[3]), .Y(n550) );
  NAND3BX1TS U1141 ( .AN(n550), .B(exp_rslt_NRM2_EW1[6]), .C(
        exp_rslt_NRM2_EW1[5]), .Y(n551) );
  NOR2X1TS U1142 ( .A(n559), .B(n1180), .Y(n555) );
  AOI22X1TS U1143 ( .A0(n616), .A1(Raw_mant_NRM_SWR[1]), .B0(n1233), .B1(
        Raw_mant_NRM_SWR[24]), .Y(n609) );
  NAND2X1TS U1144 ( .A(n616), .B(Raw_mant_NRM_SWR[3]), .Y(n558) );
  AOI22X1TS U1145 ( .A0(n621), .A1(Raw_mant_NRM_SWR[22]), .B0(n618), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n557) );
  NAND2X1TS U1146 ( .A(n558), .B(n557), .Y(n658) );
  AOI22X1TS U1147 ( .A0(n637), .A1(n658), .B0(n1233), .B1(Raw_mant_NRM_SWR[25]), .Y(n560) );
  AOI21X1TS U1148 ( .A0(left_right_SHT2), .A1(n561), .B0(n546), .Y(n562) );
  OAI21X1TS U1149 ( .A0(n701), .A1(n414), .B0(n562), .Y(sftr_odat_SHT2_SWR[24]) );
  OAI21X1TS U1150 ( .A0(n580), .A1(n1195), .B0(n579), .Y(n563) );
  OAI21X1TS U1151 ( .A0(n580), .A1(n564), .B0(n579), .Y(n565) );
  AOI22X1TS U1152 ( .A0(n536), .A1(Data_array_SWR[42]), .B0(n401), .B1(
        Data_array_SWR[38]), .Y(n567) );
  AOI22X1TS U1153 ( .A0(n404), .A1(Data_array_SWR[34]), .B0(n407), .B1(
        Data_array_SWR[30]), .Y(n566) );
  OAI211X1TS U1154 ( .A0(n600), .A1(n1156), .B0(n567), .C0(n566), .Y(n590) );
  NAND2X1TS U1155 ( .A(n590), .B(n715), .Y(n568) );
  INVX2TS U1156 ( .A(n692), .Y(n602) );
  OAI211X1TS U1157 ( .A0(n594), .A1(n694), .B0(n568), .C0(n602), .Y(
        sftr_odat_SHT2_SWR[4]) );
  AOI22X1TS U1158 ( .A0(n406), .A1(Data_array_SWR[35]), .B0(n536), .B1(
        Data_array_SWR[47]), .Y(n570) );
  AOI22X1TS U1159 ( .A0(n404), .A1(Data_array_SWR[39]), .B0(n401), .B1(
        Data_array_SWR[43]), .Y(n569) );
  OAI211X1TS U1160 ( .A0(n396), .A1(n1156), .B0(n570), .C0(n569), .Y(n601) );
  AOI21X1TS U1161 ( .A0(n410), .A1(n601), .B0(n546), .Y(n571) );
  OAI21X1TS U1162 ( .A0(n701), .A1(n604), .B0(n571), .Y(sftr_odat_SHT2_SWR[16]) );
  OAI21X1TS U1163 ( .A0(n580), .A1(n1188), .B0(n579), .Y(n572) );
  AOI22X1TS U1164 ( .A0(n404), .A1(Data_array_SWR[37]), .B0(n407), .B1(
        Data_array_SWR[33]), .Y(n574) );
  AOI22X1TS U1165 ( .A0(n536), .A1(Data_array_SWR[45]), .B0(n401), .B1(
        Data_array_SWR[41]), .Y(n573) );
  OAI211X1TS U1166 ( .A0(n700), .A1(n1156), .B0(n574), .C0(n573), .Y(n605) );
  NAND2X1TS U1167 ( .A(n605), .B(n409), .Y(n575) );
  OAI211X1TS U1168 ( .A0(n691), .A1(n694), .B0(n575), .C0(n602), .Y(
        sftr_odat_SHT2_SWR[7]) );
  AOI22X1TS U1169 ( .A0(n404), .A1(Data_array_SWR[38]), .B0(n407), .B1(
        Data_array_SWR[34]), .Y(n577) );
  AOI22X1TS U1170 ( .A0(n536), .A1(Data_array_SWR[46]), .B0(n401), .B1(
        Data_array_SWR[42]), .Y(n576) );
  OAI211X1TS U1171 ( .A0(n414), .A1(n1156), .B0(n577), .C0(n576), .Y(n587) );
  NAND2X1TS U1172 ( .A(n587), .B(n399), .Y(n578) );
  OAI211X1TS U1173 ( .A0(n589), .A1(n694), .B0(n578), .C0(n602), .Y(
        sftr_odat_SHT2_SWR[8]) );
  OAI21X1TS U1174 ( .A0(n580), .A1(n1189), .B0(n579), .Y(n581) );
  AOI22X1TS U1175 ( .A0(n404), .A1(Data_array_SWR[36]), .B0(Data_array_SWR[32]), .B1(n407), .Y(n585) );
  AOI22X1TS U1176 ( .A0(Data_array_SWR[44]), .A1(n536), .B0(Data_array_SWR[40]), .B1(n401), .Y(n584) );
  OAI211X1TS U1177 ( .A0(n697), .A1(n1156), .B0(n585), .C0(n584), .Y(n596) );
  NAND2X1TS U1178 ( .A(n596), .B(n409), .Y(n586) );
  OAI211X1TS U1179 ( .A0(n687), .A1(n694), .B0(n586), .C0(n602), .Y(
        sftr_odat_SHT2_SWR[6]) );
  AOI21X1TS U1180 ( .A0(n410), .A1(n587), .B0(n546), .Y(n588) );
  OAI21X1TS U1181 ( .A0(n701), .A1(n589), .B0(n588), .Y(sftr_odat_SHT2_SWR[17]) );
  AOI21X1TS U1182 ( .A0(left_right_SHT2), .A1(n590), .B0(n546), .Y(n591) );
  OAI21X1TS U1183 ( .A0(n701), .A1(n594), .B0(n591), .Y(sftr_odat_SHT2_SWR[21]) );
  AOI22X1TS U1184 ( .A0(n536), .A1(Data_array_SWR[43]), .B0(n402), .B1(
        Data_array_SWR[39]), .Y(n593) );
  AOI22X1TS U1185 ( .A0(n404), .A1(Data_array_SWR[35]), .B0(n407), .B1(
        Data_array_SWR[31]), .Y(n592) );
  OAI211X1TS U1186 ( .A0(n594), .A1(n400), .B0(n593), .C0(n592), .Y(n598) );
  NAND2X1TS U1187 ( .A(n598), .B(n399), .Y(n595) );
  OAI211X1TS U1188 ( .A0(n600), .A1(n694), .B0(n595), .C0(n602), .Y(
        sftr_odat_SHT2_SWR[5]) );
  AOI21X1TS U1189 ( .A0(left_right_SHT2), .A1(n596), .B0(n546), .Y(n597) );
  OAI21X1TS U1190 ( .A0(n687), .A1(n701), .B0(n597), .Y(sftr_odat_SHT2_SWR[19]) );
  AOI21X1TS U1191 ( .A0(n410), .A1(n598), .B0(n546), .Y(n599) );
  OAI21X1TS U1192 ( .A0(n701), .A1(n600), .B0(n599), .Y(sftr_odat_SHT2_SWR[20]) );
  NAND2X1TS U1193 ( .A(n601), .B(n409), .Y(n603) );
  OAI211X1TS U1194 ( .A0(n604), .A1(n694), .B0(n603), .C0(n602), .Y(
        sftr_odat_SHT2_SWR[9]) );
  AOI21X1TS U1195 ( .A0(left_right_SHT2), .A1(n605), .B0(n546), .Y(n606) );
  OAI21X1TS U1196 ( .A0(n701), .A1(n691), .B0(n606), .Y(sftr_odat_SHT2_SWR[18]) );
  OAI22X1TS U1197 ( .A0(n655), .A1(n662), .B0(n660), .B1(n411), .Y(n607) );
  AOI21X1TS U1198 ( .A0(n625), .A1(n658), .B0(n607), .Y(n608) );
  OAI22X1TS U1199 ( .A0(n656), .A1(n415), .B0(n655), .B1(n411), .Y(n610) );
  AOI21X1TS U1200 ( .A0(n637), .A1(n611), .B0(n610), .Y(n612) );
  AOI222X4TS U1201 ( .A0(n616), .A1(Raw_mant_NRM_SWR[19]), .B0(n621), .B1(
        Raw_mant_NRM_SWR[6]), .C0(n1109), .C1(DmP_mant_SHT1_SW[17]), .Y(n649)
         );
  OAI22X1TS U1202 ( .A0(n642), .A1(n704), .B0(n650), .B1(n394), .Y(n614) );
  AOI21X1TS U1203 ( .A0(n637), .A1(n640), .B0(n614), .Y(n615) );
  AOI22X1TS U1204 ( .A0(n622), .A1(Raw_mant_NRM_SWR[10]), .B0(
        DmP_mant_SHT1_SW[8]), .B1(n618), .Y(n617) );
  OAI2BB1X1TS U1205 ( .A0N(n1233), .A1N(Raw_mant_NRM_SWR[15]), .B0(n617), .Y(
        n665) );
  AOI222X4TS U1206 ( .A0(n618), .A1(DmP_mant_SHT1_SW[9]), .B0(
        Raw_mant_NRM_SWR[11]), .B1(n616), .C0(Raw_mant_NRM_SWR[14]), .C1(n1233), .Y(n661) );
  OAI22X1TS U1207 ( .A0(n661), .A1(n662), .B0(n667), .B1(n394), .Y(n619) );
  AOI21X1TS U1208 ( .A0(n625), .A1(n665), .B0(n619), .Y(n620) );
  INVX2TS U1209 ( .A(n623), .Y(n652) );
  OAI22X1TS U1210 ( .A0(n649), .A1(n662), .B0(n654), .B1(n394), .Y(n624) );
  AOI21X1TS U1211 ( .A0(n625), .A1(n652), .B0(n624), .Y(n626) );
  OAI22X1TS U1212 ( .A0(n654), .A1(n415), .B0(n627), .B1(n394), .Y(n628) );
  AOI21X1TS U1213 ( .A0(n637), .A1(n652), .B0(n628), .Y(n629) );
  OAI22X1TS U1214 ( .A0(n667), .A1(n415), .B0(n631), .B1(n394), .Y(n632) );
  AOI21X1TS U1215 ( .A0(n637), .A1(n665), .B0(n632), .Y(n633) );
  OAI22X1TS U1216 ( .A0(n645), .A1(n415), .B0(n663), .B1(n394), .Y(n635) );
  AOI21X1TS U1217 ( .A0(n637), .A1(n636), .B0(n635), .Y(n638) );
  OAI22X1TS U1218 ( .A0(n1107), .A1(n415), .B0(n703), .B1(n411), .Y(n639) );
  AOI21X1TS U1219 ( .A0(n647), .A1(n640), .B0(n639), .Y(n641) );
  OAI22X1TS U1220 ( .A0(n642), .A1(n408), .B0(n650), .B1(n415), .Y(n643) );
  AOI21X1TS U1221 ( .A0(n647), .A1(n652), .B0(n643), .Y(n644) );
  OAI22X1TS U1222 ( .A0(n645), .A1(n662), .B0(n663), .B1(n704), .Y(n646) );
  AOI21X1TS U1223 ( .A0(n647), .A1(n665), .B0(n646), .Y(n648) );
  OAI22X1TS U1224 ( .A0(n650), .A1(n408), .B0(n649), .B1(n415), .Y(n651) );
  AOI21X1TS U1225 ( .A0(n393), .A1(n652), .B0(n651), .Y(n653) );
  OAI22X1TS U1226 ( .A0(n656), .A1(n662), .B0(n655), .B1(n704), .Y(n657) );
  AOI21X1TS U1227 ( .A0(n393), .A1(n658), .B0(n657), .Y(n659) );
  OAI22X1TS U1228 ( .A0(n663), .A1(n662), .B0(n661), .B1(n415), .Y(n664) );
  AOI21X1TS U1229 ( .A0(n393), .A1(n665), .B0(n664), .Y(n666) );
  OAI22X1TS U1230 ( .A0(n670), .A1(n669), .B0(n668), .B1(n683), .Y(n671) );
  AOI21X1TS U1231 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n672), .B0(n671), .Y(n673)
         );
  OAI211X1TS U1232 ( .A0(n675), .A1(n1196), .B0(n674), .C0(n673), .Y(
        LZD_raw_out_EWR[2]) );
  AOI211X1TS U1233 ( .A0(n680), .A1(n679), .B0(n678), .C0(n677), .Y(n682) );
  OAI211X1TS U1234 ( .A0(n684), .A1(n683), .B0(n682), .C0(n681), .Y(
        LZD_raw_out_EWR[3]) );
  AOI22X1TS U1235 ( .A0(n536), .A1(Data_array_SWR[41]), .B0(n401), .B1(
        Data_array_SWR[37]), .Y(n686) );
  AOI22X1TS U1236 ( .A0(n403), .A1(Data_array_SWR[33]), .B0(n407), .B1(
        Data_array_SWR[29]), .Y(n685) );
  OAI211X1TS U1237 ( .A0(n687), .A1(n1156), .B0(n686), .C0(n685), .Y(n695) );
  AOI21X1TS U1238 ( .A0(n695), .A1(n715), .B0(n692), .Y(n688) );
  OAI21X1TS U1239 ( .A0(n697), .A1(n694), .B0(n688), .Y(sftr_odat_SHT2_SWR[3])
         );
  AOI22X1TS U1240 ( .A0(n536), .A1(Data_array_SWR[40]), .B0(n401), .B1(
        Data_array_SWR[36]), .Y(n690) );
  AOI22X1TS U1241 ( .A0(n404), .A1(Data_array_SWR[32]), .B0(n407), .B1(
        Data_array_SWR[28]), .Y(n689) );
  OAI211X1TS U1242 ( .A0(n691), .A1(n400), .B0(n690), .C0(n689), .Y(n698) );
  AOI21X1TS U1243 ( .A0(n698), .A1(n409), .B0(n692), .Y(n693) );
  OAI21X1TS U1244 ( .A0(n700), .A1(n694), .B0(n693), .Y(sftr_odat_SHT2_SWR[2])
         );
  AOI21X1TS U1245 ( .A0(left_right_SHT2), .A1(n695), .B0(n546), .Y(n696) );
  OAI21X1TS U1246 ( .A0(n701), .A1(n697), .B0(n696), .Y(sftr_odat_SHT2_SWR[22]) );
  AOI21X1TS U1247 ( .A0(left_right_SHT2), .A1(n698), .B0(n546), .Y(n699) );
  OAI21X1TS U1248 ( .A0(n701), .A1(n700), .B0(n699), .Y(sftr_odat_SHT2_SWR[23]) );
  NOR2BX1TS U1249 ( .AN(LZD_output_NRM2_EW[4]), .B(ADD_OVRFLW_NRM2), .Y(n702)
         );
  XOR2X1TS U1250 ( .A(DP_OP_15J179_122_6956_n28), .B(n702), .Y(
        DP_OP_15J179_122_6956_n14) );
  OAI222X1TS U1251 ( .A0(n415), .A1(n1106), .B0(n412), .B1(n703), .C0(n394), 
        .C1(n1107), .Y(Data_array_SWR[23]) );
  AOI22X1TS U1252 ( .A0(n403), .A1(Data_array_SWR[40]), .B0(n406), .B1(
        Data_array_SWR[36]), .Y(n705) );
  AOI211X1TS U1253 ( .A0(Data_array_SWR[44]), .A1(n402), .B0(n712), .C0(n706), 
        .Y(n720) );
  AOI211X1TS U1254 ( .A0(n402), .A1(Data_array_SWR[49]), .B0(n714), .C0(n708), 
        .Y(n719) );
  MXI2X1TS U1255 ( .A(n720), .B(n719), .S0(n715), .Y(n1158) );
  AOI22X1TS U1256 ( .A0(n403), .A1(Data_array_SWR[41]), .B0(n406), .B1(
        Data_array_SWR[37]), .Y(n709) );
  AOI211X1TS U1257 ( .A0(n402), .A1(Data_array_SWR[45]), .B0(n712), .C0(n711), 
        .Y(n717) );
  AOI211X1TS U1258 ( .A0(Data_array_SWR[48]), .A1(n402), .B0(n714), .C0(n713), 
        .Y(n716) );
  MXI2X1TS U1259 ( .A(n717), .B(n716), .S0(n409), .Y(n1159) );
  MXI2X1TS U1260 ( .A(n717), .B(n716), .S0(left_right_SHT2), .Y(n1162) );
  MXI2X1TS U1261 ( .A(n720), .B(n719), .S0(n410), .Y(n1163) );
  NOR2BX1TS U1262 ( .AN(LZD_output_NRM2_EW[3]), .B(ADD_OVRFLW_NRM2), .Y(n721)
         );
  XOR2X1TS U1263 ( .A(DP_OP_15J179_122_6956_n28), .B(n721), .Y(
        DP_OP_15J179_122_6956_n15) );
  NOR2BX1TS U1264 ( .AN(LZD_output_NRM2_EW[2]), .B(ADD_OVRFLW_NRM2), .Y(n722)
         );
  XOR2X1TS U1265 ( .A(DP_OP_15J179_122_6956_n28), .B(n722), .Y(
        DP_OP_15J179_122_6956_n16) );
  NOR2BX1TS U1266 ( .AN(LZD_output_NRM2_EW[1]), .B(ADD_OVRFLW_NRM2), .Y(n723)
         );
  XOR2X1TS U1267 ( .A(DP_OP_15J179_122_6956_n28), .B(n723), .Y(
        DP_OP_15J179_122_6956_n17) );
  AOI21X1TS U1268 ( .A0(n939), .A1(n725), .B0(n724), .Y(n748) );
  NAND2X1TS U1269 ( .A(n728), .B(n727), .Y(n741) );
  XNOR2X1TS U1270 ( .A(n729), .B(n741), .Y(n744) );
  NOR2X1TS U1271 ( .A(n1144), .B(DMP_SFG[4]), .Y(n733) );
  NOR2X1TS U1272 ( .A(n730), .B(n733), .Y(n750) );
  NOR2X1TS U1273 ( .A(n1147), .B(DMP_SFG[5]), .Y(n752) );
  NOR2X1TS U1274 ( .A(n1143), .B(DMP_SFG[6]), .Y(n735) );
  NAND2X1TS U1275 ( .A(n1144), .B(DMP_SFG[4]), .Y(n731) );
  OAI21X1TS U1276 ( .A0(n733), .A1(n732), .B0(n731), .Y(n749) );
  NAND2X1TS U1277 ( .A(n1147), .B(DMP_SFG[5]), .Y(n751) );
  NAND2X1TS U1278 ( .A(n1143), .B(DMP_SFG[6]), .Y(n734) );
  AOI21X1TS U1279 ( .A0(n749), .A1(n737), .B0(n736), .Y(n738) );
  INVX2TS U1280 ( .A(n784), .Y(n930) );
  INVX2TS U1281 ( .A(n741), .Y(n742) );
  XOR2X1TS U1282 ( .A(n930), .B(n742), .Y(n743) );
  NAND2X1TS U1283 ( .A(n747), .B(n746), .Y(n753) );
  XOR2X1TS U1284 ( .A(n748), .B(n753), .Y(n757) );
  AOI21X1TS U1285 ( .A0(n957), .A1(n750), .B0(n749), .Y(n946) );
  INVX2TS U1286 ( .A(n753), .Y(n754) );
  XNOR2X1TS U1287 ( .A(n755), .B(n754), .Y(n756) );
  INVX2TS U1288 ( .A(n758), .Y(n927) );
  NAND2X1TS U1289 ( .A(n763), .B(n762), .Y(n769) );
  XNOR2X1TS U1290 ( .A(n764), .B(n769), .Y(n773) );
  NOR2X1TS U1291 ( .A(n1146), .B(DMP_SFG[7]), .Y(n929) );
  NAND2X1TS U1292 ( .A(n1117), .B(DMP_SFG[8]), .Y(n765) );
  INVX2TS U1293 ( .A(n769), .Y(n770) );
  XNOR2X1TS U1294 ( .A(n771), .B(n770), .Y(n772) );
  NAND2X1TS U1295 ( .A(n776), .B(n775), .Y(n785) );
  XOR2X1TS U1296 ( .A(n777), .B(n785), .Y(n788) );
  NOR2X1TS U1297 ( .A(n1118), .B(DMP_SFG[10]), .Y(n780) );
  NAND2X1TS U1298 ( .A(n1118), .B(DMP_SFG[10]), .Y(n779) );
  OAI21X1TS U1299 ( .A0(n781), .A1(n780), .B0(n779), .Y(n782) );
  INVX2TS U1300 ( .A(n785), .Y(n786) );
  XOR2X1TS U1301 ( .A(n808), .B(n786), .Y(n787) );
  NAND2X1TS U1302 ( .A(n791), .B(n790), .Y(n797) );
  XNOR2X1TS U1303 ( .A(n792), .B(n797), .Y(n801) );
  INVX2TS U1304 ( .A(n797), .Y(n798) );
  XNOR2X1TS U1305 ( .A(n799), .B(n798), .Y(n800) );
  INVX2TS U1306 ( .A(n802), .Y(n804) );
  NAND2X1TS U1307 ( .A(n804), .B(n803), .Y(n823) );
  XOR2X1TS U1308 ( .A(n805), .B(n823), .Y(n826) );
  NAND2X1TS U1309 ( .A(n1119), .B(DMP_SFG[11]), .Y(n806) );
  OR2X1TS U1310 ( .A(n1124), .B(DMP_SFG[12]), .Y(n810) );
  AOI21X4TS U1311 ( .A0(n922), .A1(n810), .B0(n809), .Y(n914) );
  NAND2X1TS U1312 ( .A(n1123), .B(DMP_SFG[13]), .Y(n811) );
  OR2X1TS U1313 ( .A(n1157), .B(DMP_SFG[14]), .Y(n814) );
  NAND2X1TS U1314 ( .A(n1178), .B(DMP_SFG[15]), .Y(n815) );
  OR2X1TS U1315 ( .A(n1179), .B(DMP_SFG[16]), .Y(n818) );
  NAND2X1TS U1316 ( .A(n1192), .B(DMP_SFG[17]), .Y(n819) );
  OR2X1TS U1317 ( .A(n1193), .B(DMP_SFG[18]), .Y(n822) );
  INVX2TS U1318 ( .A(n823), .Y(n824) );
  XOR2X1TS U1319 ( .A(n849), .B(n824), .Y(n825) );
  NAND2X1TS U1320 ( .A(n828), .B(n827), .Y(n830) );
  XNOR2X1TS U1321 ( .A(n829), .B(n830), .Y(n834) );
  INVX2TS U1322 ( .A(n830), .Y(n831) );
  XNOR2X1TS U1323 ( .A(n832), .B(n831), .Y(n833) );
  INVX2TS U1324 ( .A(n835), .Y(n837) );
  NAND2X1TS U1325 ( .A(n837), .B(n836), .Y(n839) );
  XOR2X1TS U1326 ( .A(n838), .B(n839), .Y(n843) );
  INVX2TS U1327 ( .A(n839), .Y(n840) );
  XOR2X1TS U1328 ( .A(n841), .B(n840), .Y(n842) );
  NAND2X1TS U1329 ( .A(n845), .B(n844), .Y(n850) );
  XNOR2X1TS U1330 ( .A(n846), .B(n850), .Y(n854) );
  NAND2X1TS U1331 ( .A(n1191), .B(DMP_SFG[19]), .Y(n847) );
  INVX2TS U1332 ( .A(n850), .Y(n851) );
  XNOR2X1TS U1333 ( .A(n861), .B(n851), .Y(n853) );
  INVX2TS U1334 ( .A(n855), .Y(n857) );
  NAND2X1TS U1335 ( .A(n857), .B(n856), .Y(n862) );
  XOR2X1TS U1336 ( .A(n858), .B(n862), .Y(n865) );
  OR2X1TS U1337 ( .A(n1203), .B(DMP_SFG[20]), .Y(n860) );
  INVX2TS U1338 ( .A(n862), .Y(n863) );
  XOR2X1TS U1339 ( .A(n871), .B(n863), .Y(n864) );
  BUFX3TS U1340 ( .A(OP_FLAG_SFG), .Y(n947) );
  NAND2X1TS U1341 ( .A(n867), .B(n866), .Y(n872) );
  XNOR2X1TS U1342 ( .A(n868), .B(n872), .Y(n875) );
  NAND2X1TS U1343 ( .A(n1201), .B(DMP_SFG[21]), .Y(n869) );
  OAI21X2TS U1344 ( .A0(n871), .A1(n870), .B0(n869), .Y(n879) );
  INVX2TS U1345 ( .A(n872), .Y(n873) );
  XNOR2X1TS U1346 ( .A(n879), .B(n873), .Y(n874) );
  XOR2X1TS U1347 ( .A(n876), .B(DmP_mant_SFG_SWR[25]), .Y(n882) );
  OR2X1TS U1348 ( .A(n1202), .B(DMP_SFG[22]), .Y(n878) );
  AOI21X1TS U1349 ( .A0(n879), .A1(n878), .B0(n877), .Y(n880) );
  XOR2X1TS U1350 ( .A(n880), .B(n1230), .Y(n881) );
  NAND2X1TS U1351 ( .A(n884), .B(n883), .Y(n886) );
  XNOR2X1TS U1352 ( .A(n885), .B(n886), .Y(n890) );
  INVX2TS U1353 ( .A(n886), .Y(n887) );
  XNOR2X1TS U1354 ( .A(n888), .B(n887), .Y(n889) );
  INVX2TS U1355 ( .A(n891), .Y(n893) );
  NAND2X1TS U1356 ( .A(n893), .B(n892), .Y(n895) );
  XOR2X1TS U1357 ( .A(n894), .B(n895), .Y(n899) );
  INVX2TS U1358 ( .A(n895), .Y(n896) );
  XOR2X1TS U1359 ( .A(n897), .B(n896), .Y(n898) );
  NAND2X1TS U1360 ( .A(n901), .B(n900), .Y(n903) );
  XNOR2X1TS U1361 ( .A(n902), .B(n903), .Y(n907) );
  INVX2TS U1362 ( .A(n903), .Y(n904) );
  XNOR2X1TS U1363 ( .A(n905), .B(n904), .Y(n906) );
  INVX2TS U1364 ( .A(n908), .Y(n910) );
  NAND2X1TS U1365 ( .A(n910), .B(n909), .Y(n912) );
  XOR2X1TS U1366 ( .A(n911), .B(n912), .Y(n916) );
  INVX2TS U1367 ( .A(n912), .Y(n913) );
  XOR2X1TS U1368 ( .A(n914), .B(n913), .Y(n915) );
  NAND2X1TS U1369 ( .A(n918), .B(n917), .Y(n920) );
  XNOR2X1TS U1370 ( .A(n919), .B(n920), .Y(n924) );
  INVX2TS U1371 ( .A(n920), .Y(n921) );
  XNOR2X1TS U1372 ( .A(n922), .B(n921), .Y(n923) );
  NAND2X1TS U1373 ( .A(n926), .B(n925), .Y(n931) );
  XOR2X1TS U1374 ( .A(n927), .B(n931), .Y(n935) );
  INVX2TS U1375 ( .A(n931), .Y(n932) );
  XNOR2X1TS U1376 ( .A(n933), .B(n932), .Y(n934) );
  AOI21X1TS U1377 ( .A0(n939), .A1(n938), .B0(n937), .Y(n943) );
  NAND2X1TS U1378 ( .A(n942), .B(n941), .Y(n944) );
  XOR2X1TS U1379 ( .A(n943), .B(n944), .Y(n949) );
  INVX2TS U1380 ( .A(n944), .Y(n945) );
  XOR2X1TS U1381 ( .A(n946), .B(n945), .Y(n948) );
  NAND2X1TS U1382 ( .A(n953), .B(n952), .Y(n955) );
  XNOR2X1TS U1383 ( .A(n954), .B(n955), .Y(n959) );
  INVX2TS U1384 ( .A(n955), .Y(n956) );
  XNOR2X1TS U1385 ( .A(n957), .B(n956), .Y(n958) );
  NAND2X1TS U1386 ( .A(n962), .B(n961), .Y(n967) );
  XOR2X1TS U1387 ( .A(n963), .B(n967), .Y(n971) );
  INVX2TS U1388 ( .A(n964), .Y(n977) );
  INVX2TS U1389 ( .A(n967), .Y(n968) );
  XNOR2X1TS U1390 ( .A(n969), .B(n968), .Y(n970) );
  NAND2X1TS U1391 ( .A(n974), .B(n973), .Y(n975) );
  XOR2X1TS U1392 ( .A(n975), .B(n980), .Y(n979) );
  INVX2TS U1393 ( .A(n975), .Y(n976) );
  XOR2X1TS U1394 ( .A(n977), .B(n976), .Y(n978) );
  OR2X1TS U1395 ( .A(DMP_SFG[0]), .B(DmP_mant_SFG_SWR[2]), .Y(n981) );
  XOR2X1TS U1396 ( .A(n984), .B(n982), .Y(n983) );
  XNOR2X1TS U1397 ( .A(N60), .B(n422), .Y(n986) );
  XOR2X1TS U1398 ( .A(DMP_EXP_EWSW[27]), .B(DmP_EXP_EWSW[27]), .Y(n987) );
  AOI22X1TS U1399 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n1110), .B1(n1115), .Y(n1277)
         );
  XNOR2X1TS U1400 ( .A(add_subt), .B(Data_Y[31]), .Y(n1231) );
  XNOR2X1TS U1401 ( .A(intDX_EWSW[31]), .B(n1276), .Y(OP_FLAG_INIT) );
  AOI22X1TS U1402 ( .A0(intDX_EWSW[23]), .A1(intDY_EWSW[23]), .B0(n1139), .B1(
        n1187), .Y(n994) );
  AOI22X1TS U1403 ( .A0(n1132), .A1(intDY_EWSW[15]), .B0(n1173), .B1(
        intDY_EWSW[13]), .Y(n988) );
  OAI221XLTS U1404 ( .A0(n1132), .A1(intDY_EWSW[15]), .B0(n1173), .B1(
        intDY_EWSW[13]), .C0(n988), .Y(n993) );
  AOI22X1TS U1405 ( .A0(n1165), .A1(intDY_EWSW[10]), .B0(n1134), .B1(
        intDY_EWSW[2]), .Y(n989) );
  AOI22X1TS U1406 ( .A0(n1126), .A1(intDY_EWSW[9]), .B0(n1168), .B1(
        intDY_EWSW[11]), .Y(n990) );
  OAI221XLTS U1407 ( .A0(n1126), .A1(intDY_EWSW[9]), .B0(n1168), .B1(
        intDY_EWSW[11]), .C0(n990), .Y(n991) );
  NOR4X1TS U1408 ( .A(n994), .B(n993), .C(n992), .D(n991), .Y(n1022) );
  AOI22X1TS U1409 ( .A0(n1186), .A1(intDY_EWSW[7]), .B0(n1170), .B1(
        intDY_EWSW[14]), .Y(n995) );
  AOI22X1TS U1410 ( .A0(n1185), .A1(intDY_EWSW[5]), .B0(n1135), .B1(
        intDY_EWSW[4]), .Y(n996) );
  OAI221XLTS U1411 ( .A0(n1185), .A1(intDY_EWSW[5]), .B0(n1135), .B1(
        intDY_EWSW[4]), .C0(n996), .Y(n1001) );
  AOI22X1TS U1412 ( .A0(n1131), .A1(intDY_EWSW[3]), .B0(n1172), .B1(
        intDY_EWSW[26]), .Y(n997) );
  AOI22X1TS U1413 ( .A0(n1164), .A1(intDY_EWSW[1]), .B0(n1133), .B1(
        intDY_EWSW[0]), .Y(n998) );
  OAI221XLTS U1414 ( .A0(n1164), .A1(intDY_EWSW[1]), .B0(n1133), .B1(
        intDY_EWSW[0]), .C0(n998), .Y(n999) );
  NOR4X1TS U1415 ( .A(n1002), .B(n1001), .C(n1000), .D(n999), .Y(n1021) );
  AOI22X1TS U1416 ( .A0(n1103), .A1(intDY_EWSW[28]), .B0(n1137), .B1(
        intDY_EWSW[6]), .Y(n1003) );
  AOI22X1TS U1417 ( .A0(n1127), .A1(intDY_EWSW[18]), .B0(n1175), .B1(
        intDY_EWSW[29]), .Y(n1004) );
  OAI221XLTS U1418 ( .A0(n1127), .A1(intDY_EWSW[18]), .B0(n1175), .B1(
        intDY_EWSW[29]), .C0(n1004), .Y(n1009) );
  AOI22X1TS U1419 ( .A0(n1130), .A1(intDY_EWSW[27]), .B0(n1171), .B1(
        intDY_EWSW[19]), .Y(n1005) );
  AOI22X1TS U1420 ( .A0(n1167), .A1(intDY_EWSW[25]), .B0(n1136), .B1(
        intDY_EWSW[24]), .Y(n1006) );
  OAI221XLTS U1421 ( .A0(n1167), .A1(intDY_EWSW[25]), .B0(n1136), .B1(
        intDY_EWSW[24]), .C0(n1006), .Y(n1007) );
  NOR4X1TS U1422 ( .A(n1010), .B(n1009), .C(n1008), .D(n1007), .Y(n1020) );
  AOI22X1TS U1423 ( .A0(n1128), .A1(intDY_EWSW[20]), .B0(n1176), .B1(
        intDY_EWSW[30]), .Y(n1011) );
  AOI22X1TS U1424 ( .A0(n1125), .A1(intDY_EWSW[8]), .B0(n1174), .B1(
        intDY_EWSW[21]), .Y(n1012) );
  OAI221XLTS U1425 ( .A0(n1125), .A1(intDY_EWSW[8]), .B0(n1174), .B1(
        intDY_EWSW[21]), .C0(n1012), .Y(n1017) );
  AOI22X1TS U1426 ( .A0(n1166), .A1(intDY_EWSW[17]), .B0(n1181), .B1(
        intDY_EWSW[16]), .Y(n1013) );
  AOI22X1TS U1427 ( .A0(n1129), .A1(intDY_EWSW[22]), .B0(n1169), .B1(
        intDY_EWSW[12]), .Y(n1014) );
  OAI221XLTS U1428 ( .A0(n1129), .A1(intDY_EWSW[22]), .B0(n1169), .B1(
        intDY_EWSW[12]), .C0(n1014), .Y(n1015) );
  NOR4X1TS U1429 ( .A(n1018), .B(n1017), .C(n1016), .D(n1015), .Y(n1019) );
  NOR2BX1TS U1430 ( .AN(OP_FLAG_INIT), .B(n1088), .Y(ZERO_FLAG_INIT) );
  NOR2BX1TS U1431 ( .AN(Shift_reg_FLAGS_7[3]), .B(Shift_reg_FLAGS_7[0]), .Y(
        n_21_net_) );
  NOR2X1TS U1432 ( .A(n1221), .B(intDX_EWSW[25]), .Y(n1082) );
  AOI22X1TS U1433 ( .A0(intDX_EWSW[25]), .A1(n1221), .B0(intDX_EWSW[24]), .B1(
        n1023), .Y(n1027) );
  OAI21X1TS U1434 ( .A0(intDX_EWSW[26]), .A1(n1226), .B0(n1024), .Y(n1083) );
  NOR2X1TS U1435 ( .A(n1122), .B(intDX_EWSW[30]), .Y(n1030) );
  NOR2X1TS U1436 ( .A(n1150), .B(intDX_EWSW[29]), .Y(n1028) );
  NOR3X1TS U1437 ( .A(n419), .B(n1028), .C(intDY_EWSW[28]), .Y(n1029) );
  AOI221X1TS U1438 ( .A0(intDX_EWSW[30]), .A1(n1122), .B0(intDX_EWSW[29]), 
        .B1(n1150), .C0(n1029), .Y(n1031) );
  AOI2BB2X1TS U1439 ( .B0(n1032), .B1(n1081), .A0N(n1031), .A1N(n1030), .Y(
        n1087) );
  NOR2X1TS U1440 ( .A(n1219), .B(intDX_EWSW[17]), .Y(n1068) );
  NOR2X1TS U1441 ( .A(n1222), .B(intDX_EWSW[11]), .Y(n1047) );
  AOI21X1TS U1442 ( .A0(intDY_EWSW[10]), .A1(n1165), .B0(n1047), .Y(n1052) );
  OAI211X1TS U1443 ( .A0(intDX_EWSW[8]), .A1(n1218), .B0(n1049), .C0(n1052), 
        .Y(n1063) );
  OAI2BB1X1TS U1444 ( .A0N(n1185), .A1N(intDY_EWSW[5]), .B0(intDX_EWSW[4]), 
        .Y(n1033) );
  OAI22X1TS U1445 ( .A0(intDY_EWSW[4]), .A1(n1033), .B0(n1185), .B1(
        intDY_EWSW[5]), .Y(n1044) );
  OAI2BB1X1TS U1446 ( .A0N(n1186), .A1N(intDY_EWSW[7]), .B0(intDX_EWSW[6]), 
        .Y(n1034) );
  OAI22X1TS U1447 ( .A0(intDY_EWSW[6]), .A1(n1034), .B0(n1186), .B1(
        intDY_EWSW[7]), .Y(n1043) );
  OAI211X1TS U1448 ( .A0(n1224), .A1(intDX_EWSW[3]), .B0(n1037), .C0(n1036), 
        .Y(n1040) );
  AOI222X1TS U1449 ( .A0(intDY_EWSW[4]), .A1(n1135), .B0(n1040), .B1(n1039), 
        .C0(intDY_EWSW[5]), .C1(n1185), .Y(n1042) );
  AOI22X1TS U1450 ( .A0(intDY_EWSW[7]), .A1(n1186), .B0(intDY_EWSW[6]), .B1(
        n1137), .Y(n1041) );
  OAI32X1TS U1451 ( .A0(n1044), .A1(n1043), .A2(n1042), .B0(n1041), .B1(n1043), 
        .Y(n1062) );
  OA22X1TS U1452 ( .A0(n1142), .A1(intDX_EWSW[14]), .B0(n1225), .B1(
        intDX_EWSW[15]), .Y(n1059) );
  OAI2BB2XLTS U1453 ( .B0(intDY_EWSW[12]), .B1(n1046), .A0N(intDX_EWSW[13]), 
        .A1N(n1210), .Y(n1058) );
  AOI22X1TS U1454 ( .A0(intDX_EWSW[11]), .A1(n1222), .B0(intDX_EWSW[10]), .B1(
        n1048), .Y(n1054) );
  AOI21X1TS U1455 ( .A0(n1051), .A1(n1050), .B0(n1061), .Y(n1053) );
  OAI2BB2XLTS U1456 ( .B0(intDY_EWSW[14]), .B1(n1055), .A0N(intDX_EWSW[15]), 
        .A1N(n1225), .Y(n1056) );
  AOI211X1TS U1457 ( .A0(n1059), .A1(n1058), .B0(n1057), .C0(n1056), .Y(n1060)
         );
  OAI31X1TS U1458 ( .A0(n1063), .A1(n1062), .A2(n1061), .B0(n1060), .Y(n1066)
         );
  OA22X1TS U1459 ( .A0(n1214), .A1(intDX_EWSW[22]), .B0(n1139), .B1(
        intDX_EWSW[23]), .Y(n1079) );
  OAI21X1TS U1460 ( .A0(intDX_EWSW[18]), .A1(n1220), .B0(n1070), .Y(n1074) );
  AOI211X1TS U1461 ( .A0(intDY_EWSW[16]), .A1(n1181), .B0(n1073), .C0(n1074), 
        .Y(n1065) );
  OAI2BB2XLTS U1462 ( .B0(intDY_EWSW[20]), .B1(n1067), .A0N(intDX_EWSW[21]), 
        .A1N(n1211), .Y(n1078) );
  AOI22X1TS U1463 ( .A0(intDX_EWSW[17]), .A1(n1219), .B0(intDX_EWSW[16]), .B1(
        n1069), .Y(n1072) );
  AOI32X1TS U1464 ( .A0(n1220), .A1(n1070), .A2(intDX_EWSW[18]), .B0(
        intDX_EWSW[19]), .B1(n1141), .Y(n1071) );
  OAI32X1TS U1465 ( .A0(n1074), .A1(n1073), .A2(n1072), .B0(n1071), .B1(n1073), 
        .Y(n1077) );
  OAI2BB2XLTS U1466 ( .B0(intDY_EWSW[22]), .B1(n1075), .A0N(intDX_EWSW[23]), 
        .A1N(n1139), .Y(n1076) );
  AOI211X1TS U1467 ( .A0(n1079), .A1(n1078), .B0(n1077), .C0(n1076), .Y(n1085)
         );
  NAND4BBX1TS U1468 ( .AN(n1083), .BN(n1082), .C(n1081), .D(n1080), .Y(n1084)
         );
  AOI32X1TS U1469 ( .A0(n1087), .A1(n1086), .A2(n1085), .B0(n1084), .B1(n1087), 
        .Y(n1090) );
  INVX2TS U1470 ( .A(n1102), .Y(n1105) );
  AOI21X1TS U1471 ( .A0(n1088), .A1(n1100), .B0(intDX_EWSW[31]), .Y(n1089) );
  AOI21X1TS U1472 ( .A0(n1276), .A1(n1105), .B0(n1089), .Y(SIGN_FLAG_INIT) );
  AOI22X1TS U1473 ( .A0(n1102), .A1(n1227), .B0(n1133), .B1(n1091), .Y(
        DmP_INIT_EWSW[0]) );
  AOI22X1TS U1474 ( .A0(n1102), .A1(n1223), .B0(n1164), .B1(n1100), .Y(
        DmP_INIT_EWSW[1]) );
  AOI22X1TS U1475 ( .A0(n1102), .A1(n1212), .B0(n1134), .B1(n1105), .Y(
        DmP_INIT_EWSW[2]) );
  AOI22X1TS U1476 ( .A0(n1102), .A1(n1224), .B0(n1131), .B1(n1104), .Y(
        DmP_INIT_EWSW[3]) );
  AOI22X1TS U1477 ( .A0(n1095), .A1(n1207), .B0(n1135), .B1(n1091), .Y(
        DmP_INIT_EWSW[4]) );
  INVX2TS U1478 ( .A(n1102), .Y(n1091) );
  AOI22X1TS U1479 ( .A0(n1102), .A1(n1199), .B0(n1185), .B1(n1100), .Y(
        DmP_INIT_EWSW[5]) );
  AOI22X1TS U1480 ( .A0(n1095), .A1(n1205), .B0(n1137), .B1(n1100), .Y(
        DmP_INIT_EWSW[6]) );
  BUFX3TS U1481 ( .A(n1090), .Y(n1101) );
  BUFX3TS U1482 ( .A(n1101), .Y(n1092) );
  AOI22X1TS U1483 ( .A0(n1092), .A1(n1198), .B0(n1186), .B1(n1105), .Y(
        DmP_INIT_EWSW[7]) );
  AOI22X1TS U1484 ( .A0(n1092), .A1(n1218), .B0(n1125), .B1(n1104), .Y(
        DmP_INIT_EWSW[8]) );
  AOI22X1TS U1485 ( .A0(n1092), .A1(n1215), .B0(n1126), .B1(n1104), .Y(
        DmP_INIT_EWSW[9]) );
  AOI22X1TS U1486 ( .A0(n1092), .A1(n1208), .B0(n1165), .B1(n1091), .Y(
        DmP_INIT_EWSW[10]) );
  AOI22X1TS U1487 ( .A0(n1092), .A1(n1222), .B0(n1168), .B1(n1105), .Y(
        DmP_INIT_EWSW[11]) );
  AOI22X1TS U1488 ( .A0(n1092), .A1(n1217), .B0(n1169), .B1(n1100), .Y(
        DmP_INIT_EWSW[12]) );
  AOI22X1TS U1489 ( .A0(n1092), .A1(n1210), .B0(n1173), .B1(n1104), .Y(
        DmP_INIT_EWSW[13]) );
  AOI22X1TS U1490 ( .A0(n1092), .A1(n1142), .B0(n1170), .B1(n1105), .Y(
        DmP_INIT_EWSW[14]) );
  AOI22X1TS U1491 ( .A0(n1092), .A1(n1225), .B0(n1132), .B1(n1104), .Y(
        DmP_INIT_EWSW[15]) );
  AOI22X1TS U1492 ( .A0(n1092), .A1(n1206), .B0(n1181), .B1(n1097), .Y(
        DmP_INIT_EWSW[16]) );
  BUFX3TS U1493 ( .A(n1095), .Y(n1094) );
  AOI22X1TS U1494 ( .A0(n1094), .A1(n1219), .B0(n1166), .B1(n1097), .Y(
        DmP_INIT_EWSW[17]) );
  AOI22X1TS U1495 ( .A0(n1094), .A1(n1220), .B0(n1127), .B1(n1093), .Y(
        DmP_INIT_EWSW[18]) );
  AOI22X1TS U1496 ( .A0(n1094), .A1(n1141), .B0(n1171), .B1(n1093), .Y(
        DmP_INIT_EWSW[19]) );
  AOI22X1TS U1497 ( .A0(n1094), .A1(n1213), .B0(n1128), .B1(n1093), .Y(
        DmP_INIT_EWSW[20]) );
  AOI22X1TS U1498 ( .A0(n1094), .A1(n1211), .B0(n1174), .B1(n1097), .Y(
        DmP_INIT_EWSW[21]) );
  AOI22X1TS U1499 ( .A0(n1094), .A1(n1214), .B0(n1129), .B1(n1093), .Y(
        DmP_INIT_EWSW[22]) );
  AOI22X1TS U1500 ( .A0(n1094), .A1(n1139), .B0(n1187), .B1(n1097), .Y(
        DmP_INIT_EWSW[23]) );
  AOI22X1TS U1501 ( .A0(n1094), .A1(n1209), .B0(n1136), .B1(n1093), .Y(
        DmP_INIT_EWSW[24]) );
  AOI22X1TS U1502 ( .A0(n1094), .A1(n1221), .B0(n1167), .B1(n1097), .Y(
        DmP_INIT_EWSW[25]) );
  AOI22X1TS U1503 ( .A0(n1094), .A1(n1226), .B0(n1172), .B1(n1097), .Y(
        DmP_INIT_EWSW[26]) );
  BUFX3TS U1504 ( .A(n1095), .Y(n1096) );
  AOI22X1TS U1505 ( .A0(n1096), .A1(n1216), .B0(n1130), .B1(n1093), .Y(
        DmP_INIT_EWSW[27]) );
  AOI22X1TS U1506 ( .A0(n1096), .A1(n1133), .B0(n1227), .B1(n1093), .Y(
        DMP_INIT_EWSW[0]) );
  AOI22X1TS U1507 ( .A0(n1096), .A1(n1164), .B0(n1223), .B1(n1093), .Y(
        DMP_INIT_EWSW[1]) );
  AOI22X1TS U1508 ( .A0(n1096), .A1(n1134), .B0(n1212), .B1(n1097), .Y(
        DMP_INIT_EWSW[2]) );
  AOI22X1TS U1509 ( .A0(n1096), .A1(n1131), .B0(n1224), .B1(n1097), .Y(
        DMP_INIT_EWSW[3]) );
  AOI22X1TS U1510 ( .A0(n1096), .A1(n1135), .B0(n1207), .B1(n1097), .Y(
        DMP_INIT_EWSW[4]) );
  AOI22X1TS U1511 ( .A0(n1096), .A1(n1185), .B0(n1199), .B1(n1093), .Y(
        DMP_INIT_EWSW[5]) );
  AOI22X1TS U1512 ( .A0(n1096), .A1(n1137), .B0(n1205), .B1(n1097), .Y(
        DMP_INIT_EWSW[6]) );
  AOI22X1TS U1513 ( .A0(n1096), .A1(n1186), .B0(n1198), .B1(n1098), .Y(
        DMP_INIT_EWSW[7]) );
  AOI22X1TS U1514 ( .A0(n1096), .A1(n1125), .B0(n1218), .B1(n1098), .Y(
        DMP_INIT_EWSW[8]) );
  BUFX3TS U1515 ( .A(n1095), .Y(n1099) );
  AOI22X1TS U1516 ( .A0(n1099), .A1(n1126), .B0(n1215), .B1(n1098), .Y(
        DMP_INIT_EWSW[9]) );
  AOI22X1TS U1517 ( .A0(n1099), .A1(n1165), .B0(n1208), .B1(n1098), .Y(
        DMP_INIT_EWSW[10]) );
  AOI22X1TS U1518 ( .A0(n1099), .A1(n1168), .B0(n1222), .B1(n1098), .Y(
        DMP_INIT_EWSW[11]) );
  AOI22X1TS U1519 ( .A0(n1099), .A1(n1169), .B0(n1217), .B1(n1098), .Y(
        DMP_INIT_EWSW[12]) );
  AOI22X1TS U1520 ( .A0(n1099), .A1(n1173), .B0(n1210), .B1(n1098), .Y(
        DMP_INIT_EWSW[13]) );
  AOI22X1TS U1521 ( .A0(n1099), .A1(n1170), .B0(n1142), .B1(n1098), .Y(
        DMP_INIT_EWSW[14]) );
  AOI22X1TS U1522 ( .A0(n1099), .A1(n1132), .B0(n1225), .B1(n1098), .Y(
        DMP_INIT_EWSW[15]) );
  AOI22X1TS U1523 ( .A0(n1099), .A1(n1181), .B0(n1206), .B1(n1098), .Y(
        DMP_INIT_EWSW[16]) );
  AOI22X1TS U1524 ( .A0(n1099), .A1(n1166), .B0(n1219), .B1(n1093), .Y(
        DMP_INIT_EWSW[17]) );
  INVX2TS U1525 ( .A(n1102), .Y(n1100) );
  AOI22X1TS U1526 ( .A0(n1099), .A1(n1127), .B0(n1220), .B1(n1091), .Y(
        DMP_INIT_EWSW[18]) );
  AOI22X1TS U1527 ( .A0(n1101), .A1(n1171), .B0(n1141), .B1(n1100), .Y(
        DMP_INIT_EWSW[19]) );
  AOI22X1TS U1528 ( .A0(n1101), .A1(n1128), .B0(n1213), .B1(n1100), .Y(
        DMP_INIT_EWSW[20]) );
  AOI22X1TS U1529 ( .A0(n1101), .A1(n1174), .B0(n1211), .B1(n1091), .Y(
        DMP_INIT_EWSW[21]) );
  AOI22X1TS U1530 ( .A0(n1101), .A1(n1129), .B0(n1214), .B1(n1105), .Y(
        DMP_INIT_EWSW[22]) );
  AOI22X1TS U1531 ( .A0(n1101), .A1(n1187), .B0(n1139), .B1(n1091), .Y(
        DMP_INIT_EWSW[23]) );
  AOI22X1TS U1532 ( .A0(n1101), .A1(n1136), .B0(n1209), .B1(n1100), .Y(
        DMP_INIT_EWSW[24]) );
  AOI22X1TS U1533 ( .A0(n1101), .A1(n1167), .B0(n1221), .B1(n1104), .Y(
        DMP_INIT_EWSW[25]) );
  AOI22X1TS U1534 ( .A0(n1101), .A1(n1172), .B0(n1226), .B1(n1105), .Y(
        DMP_INIT_EWSW[26]) );
  AOI22X1TS U1535 ( .A0(n1101), .A1(n1130), .B0(n1216), .B1(n1091), .Y(
        DMP_INIT_EWSW[27]) );
  INVX2TS U1536 ( .A(n1102), .Y(n1104) );
  OAI2BB2XLTS U1537 ( .B0(n1105), .B1(n1103), .A0N(n1100), .A1N(intDY_EWSW[28]), .Y(DMP_INIT_EWSW[28]) );
  OAI2BB2XLTS U1538 ( .B0(n1091), .B1(n1175), .A0N(n1105), .A1N(intDY_EWSW[29]), .Y(DMP_INIT_EWSW[29]) );
  OAI2BB2XLTS U1539 ( .B0(n1104), .B1(n1176), .A0N(n1104), .A1N(intDY_EWSW[30]), .Y(DMP_INIT_EWSW[30]) );
  OAI22X1TS U1540 ( .A0(n1107), .A1(n412), .B0(n1106), .B1(n411), .Y(
        Data_array_SWR[24]) );
  INVX2TS U1542 ( .A(n1110), .Y(n1113) );
  AOI22X1TS U1543 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n1140), .B0(
        beg_OP), .B1(n1115), .Y(n1112) );
  OAI22X1TS U1544 ( .A0(n1113), .A1(n1112), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B1(n1111), .Y(n389) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule

