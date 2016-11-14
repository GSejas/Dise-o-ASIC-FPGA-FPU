/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:04:39 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_FSM_Add_Subtract_44 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W8_43 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W5_42 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module FPU_Add_Subtract_Function_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_FSM, 
        ack_FSM, Data_X, Data_Y, add_subt, r_mode, overflow_flag, 
        underflow_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  input [1:0] r_mode;
  output [31:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM, add_subt;
  output overflow_flag, underflow_flag, ready;
  wire   FSM_selector_C, add_overflow_flag, FSM_exp_operation_load_diff,
         FSM_barrel_shifter_load, FSM_Add_Subt_Sgf_load, FSM_LZA_load,
         FSM_Final_Result_load, FSM_selector_D, sign_final_result,
         FS_Module_net3641811, final_result_ieee_Module_Sign_S_mux,
         YRegister_net3641721, Exp_Operation_Module_exp_result_net3641775,
         Leading_Zero_Detector_Module_Output_Reg_net3641739,
         final_result_ieee_Module_Final_Result_IEEE_net3641721,
         Add_Subt_Sgf_module_Add_Subt_Result_net3641757,
         Oper_Start_in_module_MRegister_net3641793,
         Barrel_Shifter_module_Output_Reg_net3641757, n400, n401, n404, n405,
         n406, n407, n411, n412, n413, DP_OP_42J178_122_8048_n20,
         DP_OP_42J178_122_8048_n19, DP_OP_42J178_122_8048_n18,
         DP_OP_42J178_122_8048_n17, DP_OP_42J178_122_8048_n16,
         DP_OP_42J178_122_8048_n15, DP_OP_42J178_122_8048_n14,
         DP_OP_42J178_122_8048_n13, DP_OP_42J178_122_8048_n8,
         DP_OP_42J178_122_8048_n7, DP_OP_42J178_122_8048_n6,
         DP_OP_42J178_122_8048_n5, DP_OP_42J178_122_8048_n4,
         DP_OP_42J178_122_8048_n3, DP_OP_42J178_122_8048_n2,
         DP_OP_42J178_122_8048_n1, DP_OP_45J178_125_5354_n56,
         DP_OP_45J178_125_5354_n55, DP_OP_45J178_125_5354_n54,
         DP_OP_45J178_125_5354_n53, DP_OP_45J178_125_5354_n52,
         DP_OP_45J178_125_5354_n51, DP_OP_45J178_125_5354_n50,
         DP_OP_45J178_125_5354_n49, DP_OP_45J178_125_5354_n48,
         DP_OP_45J178_125_5354_n47, DP_OP_45J178_125_5354_n46,
         DP_OP_45J178_125_5354_n45, DP_OP_45J178_125_5354_n44,
         DP_OP_45J178_125_5354_n43, DP_OP_45J178_125_5354_n42,
         DP_OP_45J178_125_5354_n41, DP_OP_45J178_125_5354_n40,
         DP_OP_45J178_125_5354_n39, DP_OP_45J178_125_5354_n38,
         DP_OP_45J178_125_5354_n37, DP_OP_45J178_125_5354_n36,
         DP_OP_45J178_125_5354_n35, DP_OP_45J178_125_5354_n34,
         DP_OP_45J178_125_5354_n33, DP_OP_45J178_125_5354_n32,
         DP_OP_45J178_125_5354_n31, DP_OP_45J178_125_5354_n26,
         DP_OP_45J178_125_5354_n25, DP_OP_45J178_125_5354_n24,
         DP_OP_45J178_125_5354_n23, DP_OP_45J178_125_5354_n22,
         DP_OP_45J178_125_5354_n21, DP_OP_45J178_125_5354_n20,
         DP_OP_45J178_125_5354_n19, DP_OP_45J178_125_5354_n18,
         DP_OP_45J178_125_5354_n17, DP_OP_45J178_125_5354_n16,
         DP_OP_45J178_125_5354_n15, DP_OP_45J178_125_5354_n14,
         DP_OP_45J178_125_5354_n13, DP_OP_45J178_125_5354_n12,
         DP_OP_45J178_125_5354_n11, DP_OP_45J178_125_5354_n10,
         DP_OP_45J178_125_5354_n9, DP_OP_45J178_125_5354_n8,
         DP_OP_45J178_125_5354_n7, DP_OP_45J178_125_5354_n6,
         DP_OP_45J178_125_5354_n5, DP_OP_45J178_125_5354_n4,
         DP_OP_45J178_125_5354_n3, DP_OP_45J178_125_5354_n2,
         DP_OP_45J178_125_5354_n1, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846,
         n847, n848, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n892, n893, n894, n895, n896, n897, n898, n899, n900, n901, n902,
         n903, n904, n905, n906, n907, n908, n909, n910, n911, n912, n913,
         n914, n915, n916, n917, n918, n919, n920, n921, n922, n923, n924,
         n925, n926, n927, n928, n929, n930, n931, n932, n933, n934, n935,
         n936, n937, n938, n939, n940, n941, n942, n943, n944, n945, n946,
         n947, n948, n949, n950, n951, n952, n953, n954, n955, n956, n957,
         n958, n959, n960, n961, n962, n963, n964, n965, n966, n967, n968,
         n969, n970, n971, n972, n973, n974, n976, n977, n978, n979, n980,
         n981, n982, n983, n984, n985, n986, n987, n988, n989, n990, n991,
         n992, n993, n994, n995, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063,
         n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073,
         n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1104,
         n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114,
         n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124,
         n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134,
         n1135, n1136, n1137, n1138, n1139;
  wire   [1:0] FSM_selector_B;
  wire   [31:0] intDX;
  wire   [30:0] intDY;
  wire   [30:0] DMP;
  wire   [30:0] DmP;
  wire   [7:0] exp_oper_result;
  wire   [7:0] S_Oper_A_exp;
  wire   [4:0] LZA_output;
  wire   [25:0] Add_Subt_result;
  wire   [25:0] Sgf_normalized_result;
  wire   [25:0] S_A_S_Oper_A;
  wire   [3:0] FS_Module_state_next;
  wire   [3:0] FS_Module_state_reg;
  wire   [30:0] Oper_Start_in_module_intm;
  wire   [30:0] Oper_Start_in_module_intM;
  wire   [7:0] Exp_Operation_Module_Data_S;
  wire   [26:0] Add_Subt_Sgf_module_S_to_D;
  wire   [4:0] Leading_Zero_Detector_Module_Codec_to_Reg;
  wire   [22:0] final_result_ieee_Module_Sgf_S_mux;
  wire   [7:0] final_result_ieee_Module_Exp_S_mux;
  wire   [51:0] Barrel_Shifter_module_Mux_Array_Data_array;

  SNPS_CLOCK_GATE_HIGH_FSM_Add_Subtract_44 FS_Module_clk_gate_state_reg_reg ( 
        .CLK(clk), .EN(n412), .ENCLK(FS_Module_net3641811), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_5 YRegister_clk_gate_Q_reg ( .CLK(clk), .EN(n411), .ENCLK(YRegister_net3641721), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W8_43 Exp_Operation_Module_exp_result_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_exp_operation_load_diff), .ENCLK(
        Exp_Operation_Module_exp_result_net3641775), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W5_42 Leading_Zero_Detector_Module_Output_Reg_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_LZA_load), .ENCLK(
        Leading_Zero_Detector_Module_Output_Reg_net3641739), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_4 final_result_ieee_Module_Final_Result_IEEE_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_Final_Result_load), .ENCLK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_2 Add_Subt_Sgf_module_Add_Subt_Result_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_Add_Subt_Sgf_load), .ENCLK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_6 Oper_Start_in_module_MRegister_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n413), .ENCLK(Oper_Start_in_module_MRegister_net3641793), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_3 Barrel_Shifter_module_Output_Reg_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_barrel_shifter_load), .ENCLK(
        Barrel_Shifter_module_Output_Reg_net3641757), .TE(1'b0) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_7_ ( .D(
        Exp_Operation_Module_Data_S[7]), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n421), .Q(
        exp_oper_result[7]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_6_ ( .D(
        Exp_Operation_Module_Data_S[6]), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n1108), .Q(
        exp_oper_result[6]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_5_ ( .D(
        Exp_Operation_Module_Data_S[5]), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n1109), .Q(
        exp_oper_result[5]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_1_ ( .D(
        Exp_Operation_Module_Data_S[1]), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n1104), .QN(n427) );
  DFFRXLTS XRegister_Q_reg_31_ ( .D(Data_X[31]), .CK(YRegister_net3641721), 
        .RN(n1106), .Q(intDX[31]), .QN(n437) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_30_ ( .D(
        Oper_Start_in_module_intM[30]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1106), .Q(DMP[30]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_29_ ( .D(
        Oper_Start_in_module_intM[29]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1109), .Q(DMP[29]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_28_ ( .D(
        Oper_Start_in_module_intM[28]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1110), .Q(DMP[28]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_27_ ( .D(
        Oper_Start_in_module_intM[27]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1106), .Q(DMP[27]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_26_ ( .D(
        Oper_Start_in_module_intM[26]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1107), .Q(DMP[26]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_25_ ( .D(
        Oper_Start_in_module_intM[25]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1100), .Q(DMP[25]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_24_ ( .D(
        Oper_Start_in_module_intM[24]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n421), .Q(DMP[24]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_23_ ( .D(
        Oper_Start_in_module_intM[23]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n490), .Q(DMP[23]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_22_ ( .D(
        Oper_Start_in_module_intM[22]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n421), .Q(DMP[22]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_21_ ( .D(
        Oper_Start_in_module_intM[21]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1108), .Q(DMP[21]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_20_ ( .D(
        Oper_Start_in_module_intM[20]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1107), .Q(DMP[20]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_19_ ( .D(
        Oper_Start_in_module_intM[19]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1108), .Q(DMP[19]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_18_ ( .D(
        Oper_Start_in_module_intM[18]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1110), .Q(DMP[18]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_17_ ( .D(
        Oper_Start_in_module_intM[17]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1109), .Q(DMP[17]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_16_ ( .D(
        Oper_Start_in_module_intM[16]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1106), .Q(DMP[16]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_15_ ( .D(
        Oper_Start_in_module_intM[15]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1107), .Q(DMP[15]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_14_ ( .D(
        Oper_Start_in_module_intM[14]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1108), .Q(DMP[14]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_13_ ( .D(
        Oper_Start_in_module_intM[13]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n421), .Q(DMP[13]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_12_ ( .D(
        Oper_Start_in_module_intM[12]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1110), .Q(DMP[12]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_11_ ( .D(
        Oper_Start_in_module_intM[11]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1109), .Q(DMP[11]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_10_ ( .D(
        Oper_Start_in_module_intM[10]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1106), .Q(DMP[10]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_9_ ( .D(
        Oper_Start_in_module_intM[9]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1107), .Q(DMP[9]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_8_ ( .D(
        Oper_Start_in_module_intM[8]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1110), .Q(DMP[8]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_7_ ( .D(
        Oper_Start_in_module_intM[7]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1109), .Q(DMP[7]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_6_ ( .D(
        Oper_Start_in_module_intM[6]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1106), .Q(DMP[6]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_5_ ( .D(
        Oper_Start_in_module_intM[5]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1107), .Q(DMP[5]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_4_ ( .D(
        Oper_Start_in_module_intM[4]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1102), .Q(DMP[4]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_3_ ( .D(
        Oper_Start_in_module_intM[3]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1105), .Q(DMP[3]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_2_ ( .D(
        Oper_Start_in_module_intM[2]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1108), .Q(DMP[2]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_1_ ( .D(
        Oper_Start_in_module_intM[1]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1110), .Q(DMP[1]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_0_ ( .D(
        Oper_Start_in_module_intM[0]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1109), .Q(DMP[0]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_30_ ( .D(
        Oper_Start_in_module_intm[30]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n491), .Q(DmP[30]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_29_ ( .D(
        Oper_Start_in_module_intm[29]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1106), .Q(DmP[29]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_28_ ( .D(
        Oper_Start_in_module_intm[28]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1102), .Q(DmP[28]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_27_ ( .D(
        Oper_Start_in_module_intm[27]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1101), .Q(DmP[27]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_26_ ( .D(
        Oper_Start_in_module_intm[26]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n489), .Q(DmP[26]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_25_ ( .D(
        Oper_Start_in_module_intm[25]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n422), .Q(DmP[25]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_24_ ( .D(
        Oper_Start_in_module_intm[24]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1104), .Q(DmP[24]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_23_ ( .D(
        Oper_Start_in_module_intm[23]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n421), .Q(DmP[23]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_22_ ( .D(
        Oper_Start_in_module_intm[22]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n422), .Q(DmP[22]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_21_ ( .D(
        Oper_Start_in_module_intm[21]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n422), .Q(DmP[21]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_20_ ( .D(
        Oper_Start_in_module_intm[20]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n489), .Q(DmP[20]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_19_ ( .D(
        Oper_Start_in_module_intm[19]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1102), .Q(DmP[19]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_18_ ( .D(
        Oper_Start_in_module_intm[18]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1101), .Q(DmP[18]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_17_ ( .D(
        Oper_Start_in_module_intm[17]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1105), .Q(DmP[17]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_16_ ( .D(
        Oper_Start_in_module_intm[16]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1100), .Q(DmP[16]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_15_ ( .D(
        Oper_Start_in_module_intm[15]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1101), .Q(DmP[15]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_14_ ( .D(
        Oper_Start_in_module_intm[14]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1105), .Q(DmP[14]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_13_ ( .D(
        Oper_Start_in_module_intm[13]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1101), .Q(DmP[13]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_12_ ( .D(
        Oper_Start_in_module_intm[12]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1105), .Q(DmP[12]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_11_ ( .D(
        Oper_Start_in_module_intm[11]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1100), .Q(DmP[11]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_10_ ( .D(
        Oper_Start_in_module_intm[10]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n421), .Q(DmP[10]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_9_ ( .D(
        Oper_Start_in_module_intm[9]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1110), .Q(DmP[9]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_8_ ( .D(
        Oper_Start_in_module_intm[8]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1108), .Q(DmP[8]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_7_ ( .D(
        Oper_Start_in_module_intm[7]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1104), .Q(DmP[7]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_6_ ( .D(
        Oper_Start_in_module_intm[6]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n422), .Q(DmP[6]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_5_ ( .D(
        Oper_Start_in_module_intm[5]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n422), .Q(DmP[5]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_4_ ( .D(
        Oper_Start_in_module_intm[4]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n489), .Q(DmP[4]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_3_ ( .D(
        Oper_Start_in_module_intm[3]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1106), .Q(DmP[3]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_2_ ( .D(
        Oper_Start_in_module_intm[2]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n491), .Q(DmP[2]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_1_ ( .D(
        Oper_Start_in_module_intm[1]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n490), .Q(DmP[1]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_0_ ( .D(
        Oper_Start_in_module_intm[0]), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1101), .Q(DmP[0]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_0_ ( .D(
        Add_Subt_Sgf_module_S_to_D[0]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1108), .Q(
        Add_Subt_result[0]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_2_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[2]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3641739), .RN(n422), .Q(
        LZA_output[2]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_1_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[1]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3641739), .RN(n1102), .Q(
        LZA_output[1]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_0_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[0]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3641739), .RN(n1102), .Q(
        LZA_output[0]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_1_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[1]), .CK(clk), .RN(n491), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[27]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_0_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[0]), .CK(clk), .RN(n490), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[26]) );
  DFFRXLTS Exp_Operation_Module_Overflow_Q_reg_0_ ( .D(n1112), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n1109), .QN(n424) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_31_ ( .D(
        final_result_ieee_Module_Sign_S_mux), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1102), 
        .Q(final_result_ieee[31]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_23_ ( .D(
        final_result_ieee_Module_Exp_S_mux[0]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1101), 
        .Q(final_result_ieee[23]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_24_ ( .D(
        final_result_ieee_Module_Exp_S_mux[1]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1105), 
        .Q(final_result_ieee[24]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_25_ ( .D(
        final_result_ieee_Module_Exp_S_mux[2]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n421), .Q(
        final_result_ieee[25]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_26_ ( .D(
        final_result_ieee_Module_Exp_S_mux[3]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n421), .Q(
        final_result_ieee[26]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_27_ ( .D(
        final_result_ieee_Module_Exp_S_mux[4]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1102), 
        .Q(final_result_ieee[27]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_28_ ( .D(
        final_result_ieee_Module_Exp_S_mux[5]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1101), 
        .Q(final_result_ieee[28]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_29_ ( .D(
        final_result_ieee_Module_Exp_S_mux[6]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1105), 
        .Q(final_result_ieee[29]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_30_ ( .D(
        final_result_ieee_Module_Exp_S_mux[7]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1100), 
        .Q(final_result_ieee[30]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_0_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[0]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n421), .Q(
        final_result_ieee[0]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_1_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[1]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1101), 
        .Q(final_result_ieee[1]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_2_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[2]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1100), 
        .Q(final_result_ieee[2]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_3_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[3]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1105), 
        .Q(final_result_ieee[3]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_4_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[4]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n421), .Q(
        final_result_ieee[4]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_5_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[5]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1102), 
        .Q(final_result_ieee[5]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_6_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[6]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1104), 
        .Q(final_result_ieee[6]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_7_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[7]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n422), .Q(
        final_result_ieee[7]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_8_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[8]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n422), .Q(
        final_result_ieee[8]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_9_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[9]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n489), .Q(
        final_result_ieee[9]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_10_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[10]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1106), 
        .Q(final_result_ieee[10]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_11_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[11]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n491), .Q(
        final_result_ieee[11]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_12_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[12]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n490), .Q(
        final_result_ieee[12]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_13_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[13]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1101), 
        .Q(final_result_ieee[13]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_14_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[14]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1102), 
        .Q(final_result_ieee[14]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_15_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[15]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1104), 
        .Q(final_result_ieee[15]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_16_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[16]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n422), .Q(
        final_result_ieee[16]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_17_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[17]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1102), 
        .Q(final_result_ieee[17]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_18_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[18]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1101), 
        .Q(final_result_ieee[18]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_19_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[19]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1105), 
        .Q(final_result_ieee[19]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_20_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[20]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1100), 
        .Q(final_result_ieee[20]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_21_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[21]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n490), .Q(
        final_result_ieee[21]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_22_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[22]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3641721), .RN(n1100), 
        .Q(final_result_ieee[22]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_25_ ( .D(n1114), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1107), .Q(
        Sgf_normalized_result[25]) );
  DFFRXLTS Oper_Start_in_module_SignRegister_Q_reg_0_ ( .D(n1113), .CK(
        Oper_Start_in_module_MRegister_net3641793), .RN(n1101), .Q(
        sign_final_result), .QN(n439) );
  CMPR32X2TS DP_OP_42J178_122_8048_U6 ( .A(DP_OP_42J178_122_8048_n17), .B(
        S_Oper_A_exp[3]), .C(DP_OP_42J178_122_8048_n6), .CO(
        DP_OP_42J178_122_8048_n5), .S(Exp_Operation_Module_Data_S[3]) );
  CMPR32X2TS DP_OP_42J178_122_8048_U5 ( .A(DP_OP_42J178_122_8048_n16), .B(
        S_Oper_A_exp[4]), .C(DP_OP_42J178_122_8048_n5), .CO(
        DP_OP_42J178_122_8048_n4), .S(Exp_Operation_Module_Data_S[4]) );
  CMPR32X2TS DP_OP_42J178_122_8048_U4 ( .A(DP_OP_42J178_122_8048_n15), .B(
        S_Oper_A_exp[5]), .C(DP_OP_42J178_122_8048_n4), .CO(
        DP_OP_42J178_122_8048_n3), .S(Exp_Operation_Module_Data_S[5]) );
  CMPR32X2TS DP_OP_42J178_122_8048_U3 ( .A(DP_OP_42J178_122_8048_n14), .B(
        S_Oper_A_exp[6]), .C(DP_OP_42J178_122_8048_n3), .CO(
        DP_OP_42J178_122_8048_n2), .S(Exp_Operation_Module_Data_S[6]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U25 ( .A(DP_OP_45J178_125_5354_n54), .B(
        S_A_S_Oper_A[2]), .C(DP_OP_45J178_125_5354_n25), .CO(
        DP_OP_45J178_125_5354_n24), .S(Add_Subt_Sgf_module_S_to_D[2]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U22 ( .A(DP_OP_45J178_125_5354_n51), .B(
        S_A_S_Oper_A[5]), .C(DP_OP_45J178_125_5354_n22), .CO(
        DP_OP_45J178_125_5354_n21), .S(Add_Subt_Sgf_module_S_to_D[5]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U21 ( .A(DP_OP_45J178_125_5354_n50), .B(
        S_A_S_Oper_A[6]), .C(DP_OP_45J178_125_5354_n21), .CO(
        DP_OP_45J178_125_5354_n20), .S(Add_Subt_Sgf_module_S_to_D[6]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U20 ( .A(DP_OP_45J178_125_5354_n49), .B(
        S_A_S_Oper_A[7]), .C(DP_OP_45J178_125_5354_n20), .CO(
        DP_OP_45J178_125_5354_n19), .S(Add_Subt_Sgf_module_S_to_D[7]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U19 ( .A(DP_OP_45J178_125_5354_n48), .B(
        S_A_S_Oper_A[8]), .C(DP_OP_45J178_125_5354_n19), .CO(
        DP_OP_45J178_125_5354_n18), .S(Add_Subt_Sgf_module_S_to_D[8]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U18 ( .A(DP_OP_45J178_125_5354_n47), .B(
        S_A_S_Oper_A[9]), .C(DP_OP_45J178_125_5354_n18), .CO(
        DP_OP_45J178_125_5354_n17), .S(Add_Subt_Sgf_module_S_to_D[9]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U17 ( .A(DP_OP_45J178_125_5354_n46), .B(
        S_A_S_Oper_A[10]), .C(DP_OP_45J178_125_5354_n17), .CO(
        DP_OP_45J178_125_5354_n16), .S(Add_Subt_Sgf_module_S_to_D[10]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U16 ( .A(DP_OP_45J178_125_5354_n45), .B(
        S_A_S_Oper_A[11]), .C(DP_OP_45J178_125_5354_n16), .CO(
        DP_OP_45J178_125_5354_n15), .S(Add_Subt_Sgf_module_S_to_D[11]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U15 ( .A(DP_OP_45J178_125_5354_n44), .B(
        S_A_S_Oper_A[12]), .C(DP_OP_45J178_125_5354_n15), .CO(
        DP_OP_45J178_125_5354_n14), .S(Add_Subt_Sgf_module_S_to_D[12]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U14 ( .A(DP_OP_45J178_125_5354_n43), .B(
        S_A_S_Oper_A[13]), .C(DP_OP_45J178_125_5354_n14), .CO(
        DP_OP_45J178_125_5354_n13), .S(Add_Subt_Sgf_module_S_to_D[13]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U13 ( .A(DP_OP_45J178_125_5354_n42), .B(
        S_A_S_Oper_A[14]), .C(DP_OP_45J178_125_5354_n13), .CO(
        DP_OP_45J178_125_5354_n12), .S(Add_Subt_Sgf_module_S_to_D[14]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U11 ( .A(DP_OP_45J178_125_5354_n40), .B(
        S_A_S_Oper_A[16]), .C(DP_OP_45J178_125_5354_n11), .CO(
        DP_OP_45J178_125_5354_n10), .S(Add_Subt_Sgf_module_S_to_D[16]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U10 ( .A(DP_OP_45J178_125_5354_n39), .B(
        S_A_S_Oper_A[17]), .C(DP_OP_45J178_125_5354_n10), .CO(
        DP_OP_45J178_125_5354_n9), .S(Add_Subt_Sgf_module_S_to_D[17]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U9 ( .A(DP_OP_45J178_125_5354_n38), .B(
        S_A_S_Oper_A[18]), .C(DP_OP_45J178_125_5354_n9), .CO(
        DP_OP_45J178_125_5354_n8), .S(Add_Subt_Sgf_module_S_to_D[18]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U8 ( .A(DP_OP_45J178_125_5354_n37), .B(
        S_A_S_Oper_A[19]), .C(DP_OP_45J178_125_5354_n8), .CO(
        DP_OP_45J178_125_5354_n7), .S(Add_Subt_Sgf_module_S_to_D[19]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U6 ( .A(DP_OP_45J178_125_5354_n35), .B(
        S_A_S_Oper_A[21]), .C(DP_OP_45J178_125_5354_n6), .CO(
        DP_OP_45J178_125_5354_n5), .S(Add_Subt_Sgf_module_S_to_D[21]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U5 ( .A(DP_OP_45J178_125_5354_n34), .B(
        S_A_S_Oper_A[22]), .C(DP_OP_45J178_125_5354_n5), .CO(
        DP_OP_45J178_125_5354_n4), .S(Add_Subt_Sgf_module_S_to_D[22]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U4 ( .A(DP_OP_45J178_125_5354_n33), .B(
        S_A_S_Oper_A[23]), .C(DP_OP_45J178_125_5354_n4), .CO(
        DP_OP_45J178_125_5354_n3), .S(Add_Subt_Sgf_module_S_to_D[23]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U3 ( .A(DP_OP_45J178_125_5354_n32), .B(
        S_A_S_Oper_A[24]), .C(DP_OP_45J178_125_5354_n3), .CO(
        DP_OP_45J178_125_5354_n2), .S(Add_Subt_Sgf_module_S_to_D[24]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U2 ( .A(DP_OP_45J178_125_5354_n31), .B(
        S_A_S_Oper_A[25]), .C(DP_OP_45J178_125_5354_n2), .CO(
        DP_OP_45J178_125_5354_n1), .S(Add_Subt_Sgf_module_S_to_D[25]) );
  DFFSX2TS R_0 ( .D(n1095), .CK(YRegister_net3641721), .SN(n491), .Q(n1111) );
  DFFRX2TS YRegister_Q_reg_23_ ( .D(Data_Y[23]), .CK(YRegister_net3641721), 
        .RN(n1101), .Q(intDY[23]), .QN(n1091) );
  DFFRX2TS YRegister_Q_reg_15_ ( .D(Data_Y[15]), .CK(YRegister_net3641721), 
        .RN(n1102), .Q(intDY[15]), .QN(n1090) );
  DFFRX2TS YRegister_Q_reg_3_ ( .D(Data_Y[3]), .CK(YRegister_net3641721), .RN(
        n1104), .Q(intDY[3]), .QN(n1088) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_19_ ( .D(
        Add_Subt_Sgf_module_S_to_D[19]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1106), .Q(
        Add_Subt_result[19]), .QN(n1077) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_16_ ( .D(
        Add_Subt_Sgf_module_S_to_D[16]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1106), .Q(
        Add_Subt_result[16]), .QN(n1076) );
  DFFRX2TS YRegister_Q_reg_5_ ( .D(Data_Y[5]), .CK(YRegister_net3641721), .RN(
        n1107), .Q(intDY[5]), .QN(n1062) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_10_ ( .D(
        Add_Subt_Sgf_module_S_to_D[10]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1110), .Q(
        Add_Subt_result[10]), .QN(n1060) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_18_ ( .D(
        Add_Subt_Sgf_module_S_to_D[18]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n421), .Q(
        Add_Subt_result[18]), .QN(n1059) );
  DFFRX2TS XRegister_Q_reg_16_ ( .D(Data_X[16]), .CK(YRegister_net3641721), 
        .RN(n1101), .Q(intDX[16]), .QN(n1053) );
  DFFRX1TS Sel_D_Q_reg_0_ ( .D(n406), .CK(FS_Module_net3641811), .RN(n400), 
        .Q(FSM_selector_D) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_25_ ( .D(
        Add_Subt_Sgf_module_S_to_D[25]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1109), .Q(
        Add_Subt_result[25]), .QN(n1052) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_25_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[25]), .CK(clk), .RN(n1101), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[51]), .QN(n1049) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_24_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[24]), .CK(clk), .RN(n490), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[50]), .QN(n1048) );
  DFFRX2TS XRegister_Q_reg_5_ ( .D(Data_X[5]), .CK(YRegister_net3641721), .RN(
        n422), .QN(n1046) );
  DFFRX2TS Exp_Operation_Module_exp_result_Q_reg_4_ ( .D(
        Exp_Operation_Module_Data_S[4]), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n1106), .Q(
        exp_oper_result[4]), .QN(n1044) );
  DFFRX1TS XRegister_Q_reg_1_ ( .D(Data_X[1]), .CK(YRegister_net3641721), .RN(
        n1101), .Q(intDX[1]), .QN(n1032) );
  DFFRX2TS Exp_Operation_Module_exp_result_Q_reg_3_ ( .D(
        Exp_Operation_Module_Data_S[3]), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n1100), .Q(
        exp_oper_result[3]), .QN(n1031) );
  DFFRX2TS Sel_B_Q_reg_0_ ( .D(n405), .CK(FS_Module_net3641811), .RN(n400), 
        .Q(FSM_selector_B[0]), .QN(n1029) );
  DFFRX2TS FS_Module_state_reg_reg_3_ ( .D(FS_Module_state_next[3]), .CK(
        FS_Module_net3641811), .RN(n1102), .Q(FS_Module_state_reg[3]), .QN(
        n1028) );
  DFFRX2TS FS_Module_state_reg_reg_2_ ( .D(FS_Module_state_next[2]), .CK(
        FS_Module_net3641811), .RN(n1105), .Q(FS_Module_state_reg[2]), .QN(
        n1027) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_16_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[16]), .CK(clk), .RN(n421), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[42]), .QN(n1021) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_17_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[17]), .CK(clk), .RN(n1106), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[43]), .QN(n1020) );
  DFFRX2TS YRegister_Q_reg_30_ ( .D(Data_Y[30]), .CK(YRegister_net3641721), 
        .RN(n1101), .Q(intDY[30]), .QN(n1018) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_17_ ( .D(
        Add_Subt_Sgf_module_S_to_D[17]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1109), .Q(
        Add_Subt_result[17]), .QN(n1017) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_12_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[12]), .CK(clk), .RN(n1101), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[38]), .QN(n1016) );
  DFFRX1TS XRegister_Q_reg_0_ ( .D(Data_X[0]), .CK(YRegister_net3641721), .RN(
        n490), .Q(intDX[0]), .QN(n1015) );
  DFFRX2TS XRegister_Q_reg_4_ ( .D(Data_X[4]), .CK(YRegister_net3641721), .RN(
        n489), .Q(intDX[4]), .QN(n1014) );
  DFFRX1TS XRegister_Q_reg_2_ ( .D(Data_X[2]), .CK(YRegister_net3641721), .RN(
        n1102), .Q(intDX[2]), .QN(n1012) );
  DFFRX2TS Sel_C_Q_reg_0_ ( .D(n407), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n400), .Q(
        FSM_selector_C), .QN(n1045) );
  DFFRX2TS Add_Subt_Sgf_module_Add_overflow_Result_Q_reg_0_ ( .D(
        Add_Subt_Sgf_module_S_to_D[26]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1109), .Q(
        add_overflow_flag), .QN(n1003) );
  DFFRX2TS Leading_Zero_Detector_Module_Output_Reg_Q_reg_3_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[3]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3641739), .RN(n1107), .Q(
        LZA_output[3]), .QN(n1001) );
  DFFRX2TS FS_Module_state_reg_reg_1_ ( .D(FS_Module_state_next[1]), .CK(
        FS_Module_net3641811), .RN(n421), .Q(FS_Module_state_reg[1]), .QN(
        n1000) );
  CMPR32X2TS DP_OP_42J178_122_8048_U9 ( .A(S_Oper_A_exp[0]), .B(n1096), .C(
        DP_OP_42J178_122_8048_n20), .CO(DP_OP_42J178_122_8048_n8), .S(
        Exp_Operation_Module_Data_S[0]) );
  CMPR32X2TS DP_OP_42J178_122_8048_U8 ( .A(DP_OP_42J178_122_8048_n19), .B(
        S_Oper_A_exp[1]), .C(DP_OP_42J178_122_8048_n8), .CO(
        DP_OP_42J178_122_8048_n7), .S(Exp_Operation_Module_Data_S[1]) );
  CMPR32X2TS DP_OP_42J178_122_8048_U2 ( .A(DP_OP_42J178_122_8048_n13), .B(
        S_Oper_A_exp[7]), .C(DP_OP_42J178_122_8048_n2), .CO(
        DP_OP_42J178_122_8048_n1), .S(Exp_Operation_Module_Data_S[7]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_2_ ( .D(
        Add_Subt_Sgf_module_S_to_D[2]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n421), .Q(
        Add_Subt_result[2]), .QN(n1075) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_5_ ( .D(
        Add_Subt_Sgf_module_S_to_D[5]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1106), .Q(
        Add_Subt_result[5]), .QN(n1023) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_7_ ( .D(
        Add_Subt_Sgf_module_S_to_D[7]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1109), .Q(
        Add_Subt_result[7]), .QN(n1094) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_23_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[23]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[49]), .QN(n1055) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_22_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[22]), .CK(clk), .RN(n422), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[48]), .QN(n1057) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_8_ ( .D(
        Add_Subt_Sgf_module_S_to_D[8]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1110), .Q(
        Add_Subt_result[8]), .QN(n1002) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_9_ ( .D(
        Add_Subt_Sgf_module_S_to_D[9]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1107), .Q(
        Add_Subt_result[9]), .QN(n1078) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_21_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[21]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[47]), .QN(n1054) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_18_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[18]), .CK(clk), .RN(n421), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[44]), .QN(n1058) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_19_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[19]), .CK(clk), .RN(n1102), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[45]), .QN(n1056) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_20_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[20]), .CK(clk), .RN(n1101), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[46]), .QN(n1051) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_12_ ( .D(
        Add_Subt_Sgf_module_S_to_D[12]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n421), .Q(
        Add_Subt_result[12]), .QN(n1022) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_13_ ( .D(
        Add_Subt_Sgf_module_S_to_D[13]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1107), .Q(
        Add_Subt_result[13]), .QN(n1061) );
  DFFRX1TS YRegister_Q_reg_29_ ( .D(Data_Y[29]), .CK(YRegister_net3641721), 
        .RN(n421), .Q(intDY[29]), .QN(n1083) );
  DFFRX1TS YRegister_Q_reg_28_ ( .D(Data_Y[28]), .CK(YRegister_net3641721), 
        .RN(n1102), .Q(intDY[28]), .QN(n1063) );
  DFFRX1TS YRegister_Q_reg_27_ ( .D(Data_Y[27]), .CK(YRegister_net3641721), 
        .RN(n1105), .Q(intDY[27]), .QN(n1074) );
  DFFRX1TS YRegister_Q_reg_26_ ( .D(Data_Y[26]), .CK(YRegister_net3641721), 
        .RN(n1100), .Q(intDY[26]), .QN(n1089) );
  DFFRX1TS YRegister_Q_reg_25_ ( .D(Data_Y[25]), .CK(YRegister_net3641721), 
        .RN(n422), .Q(intDY[25]), .QN(n1086) );
  DFFRX1TS YRegister_Q_reg_24_ ( .D(Data_Y[24]), .CK(YRegister_net3641721), 
        .RN(n422), .Q(intDY[24]), .QN(n1067) );
  DFFRX1TS YRegister_Q_reg_22_ ( .D(Data_Y[22]), .CK(YRegister_net3641721), 
        .RN(n1104), .Q(intDY[22]), .QN(n1026) );
  DFFRX1TS YRegister_Q_reg_21_ ( .D(Data_Y[21]), .CK(YRegister_net3641721), 
        .RN(n422), .Q(intDY[21]), .QN(n1069) );
  DFFRX1TS YRegister_Q_reg_20_ ( .D(Data_Y[20]), .CK(YRegister_net3641721), 
        .RN(n489), .Q(intDY[20]), .QN(n1071) );
  DFFRX1TS YRegister_Q_reg_19_ ( .D(Data_Y[19]), .CK(YRegister_net3641721), 
        .RN(n1106), .Q(intDY[19]), .QN(n1024) );
  DFFRX1TS YRegister_Q_reg_18_ ( .D(Data_Y[18]), .CK(YRegister_net3641721), 
        .RN(n491), .Q(intDY[18]), .QN(n1082) );
  DFFRX1TS YRegister_Q_reg_17_ ( .D(Data_Y[17]), .CK(YRegister_net3641721), 
        .RN(n490), .Q(intDY[17]), .QN(n1085) );
  DFFRX1TS YRegister_Q_reg_16_ ( .D(Data_Y[16]), .CK(YRegister_net3641721), 
        .RN(n1102), .Q(intDY[16]), .QN(n1064) );
  DFFRX1TS YRegister_Q_reg_14_ ( .D(Data_Y[14]), .CK(YRegister_net3641721), 
        .RN(n1101), .Q(intDY[14]), .QN(n1025) );
  DFFRX1TS YRegister_Q_reg_13_ ( .D(Data_Y[13]), .CK(YRegister_net3641721), 
        .RN(n422), .Q(intDY[13]), .QN(n1068) );
  DFFRX1TS YRegister_Q_reg_11_ ( .D(Data_Y[11]), .CK(YRegister_net3641721), 
        .RN(n1100), .Q(intDY[11]), .QN(n1081) );
  DFFRX1TS YRegister_Q_reg_10_ ( .D(Data_Y[10]), .CK(YRegister_net3641721), 
        .RN(n1102), .Q(intDY[10]), .QN(n1080) );
  DFFRX1TS YRegister_Q_reg_9_ ( .D(Data_Y[9]), .CK(YRegister_net3641721), .RN(
        n1101), .Q(intDY[9]), .QN(n1073) );
  DFFRX1TS YRegister_Q_reg_8_ ( .D(Data_Y[8]), .CK(YRegister_net3641721), .RN(
        n1102), .Q(intDY[8]), .QN(n1084) );
  DFFRX1TS YRegister_Q_reg_7_ ( .D(Data_Y[7]), .CK(YRegister_net3641721), .RN(
        n1105), .Q(intDY[7]), .QN(n1072) );
  DFFRX1TS YRegister_Q_reg_6_ ( .D(Data_Y[6]), .CK(YRegister_net3641721), .RN(
        n1100), .Q(intDY[6]), .QN(n1079) );
  DFFRX1TS YRegister_Q_reg_4_ ( .D(Data_Y[4]), .CK(YRegister_net3641721), .RN(
        n1100), .Q(intDY[4]), .QN(n1066) );
  DFFRX1TS YRegister_Q_reg_2_ ( .D(Data_Y[2]), .CK(YRegister_net3641721), .RN(
        n422), .Q(intDY[2]), .QN(n1070) );
  DFFRX1TS YRegister_Q_reg_1_ ( .D(Data_Y[1]), .CK(YRegister_net3641721), .RN(
        n1102), .Q(intDY[1]), .QN(n1087) );
  DFFRX1TS YRegister_Q_reg_0_ ( .D(Data_Y[0]), .CK(YRegister_net3641721), .RN(
        n1104), .Q(intDY[0]), .QN(n1092) );
  DFFRX1TS XRegister_Q_reg_30_ ( .D(Data_X[30]), .CK(YRegister_net3641721), 
        .RN(n422), .Q(intDX[30]), .QN(n1047) );
  DFFRX1TS XRegister_Q_reg_29_ ( .D(Data_X[29]), .CK(YRegister_net3641721), 
        .RN(n422), .Q(intDX[29]), .QN(n1033) );
  DFFRX1TS XRegister_Q_reg_27_ ( .D(Data_X[27]), .CK(YRegister_net3641721), 
        .RN(n489), .Q(intDX[27]), .QN(n1013) );
  DFFRX1TS XRegister_Q_reg_26_ ( .D(Data_X[26]), .CK(YRegister_net3641721), 
        .RN(n1106), .Q(intDX[26]), .QN(n1010) );
  DFFRX1TS XRegister_Q_reg_25_ ( .D(Data_X[25]), .CK(YRegister_net3641721), 
        .RN(n491), .Q(intDX[25]), .QN(n1039) );
  DFFRX1TS XRegister_Q_reg_24_ ( .D(Data_X[24]), .CK(YRegister_net3641721), 
        .RN(n490), .Q(intDX[24]), .QN(n1009) );
  DFFRX1TS XRegister_Q_reg_23_ ( .D(Data_X[23]), .CK(YRegister_net3641721), 
        .RN(n1101), .Q(intDX[23]), .QN(n1043) );
  DFFRX1TS XRegister_Q_reg_22_ ( .D(Data_X[22]), .CK(YRegister_net3641721), 
        .RN(n1102), .Q(intDX[22]), .QN(n1008) );
  DFFRX1TS XRegister_Q_reg_21_ ( .D(Data_X[21]), .CK(YRegister_net3641721), 
        .RN(n1104), .Q(intDX[21]), .QN(n1042) );
  DFFRX1TS XRegister_Q_reg_20_ ( .D(Data_X[20]), .CK(YRegister_net3641721), 
        .RN(n1101), .Q(intDX[20]), .QN(n1007) );
  DFFRX1TS XRegister_Q_reg_19_ ( .D(Data_X[19]), .CK(YRegister_net3641721), 
        .RN(n1105), .Q(intDX[19]), .QN(n1038) );
  DFFRX1TS XRegister_Q_reg_18_ ( .D(Data_X[18]), .CK(YRegister_net3641721), 
        .RN(n1100), .Q(intDX[18]), .QN(n1006) );
  DFFRX1TS XRegister_Q_reg_17_ ( .D(Data_X[17]), .CK(YRegister_net3641721), 
        .RN(n422), .Q(intDX[17]), .QN(n1037) );
  DFFRX1TS XRegister_Q_reg_15_ ( .D(Data_X[15]), .CK(YRegister_net3641721), 
        .RN(n1105), .Q(intDX[15]), .QN(n1041) );
  DFFRX1TS XRegister_Q_reg_14_ ( .D(Data_X[14]), .CK(YRegister_net3641721), 
        .RN(n422), .Q(intDX[14]), .QN(n1005) );
  DFFRX1TS XRegister_Q_reg_13_ ( .D(Data_X[13]), .CK(YRegister_net3641721), 
        .RN(n1101), .Q(intDX[13]), .QN(n1040) );
  DFFRX1TS XRegister_Q_reg_12_ ( .D(Data_X[12]), .CK(YRegister_net3641721), 
        .RN(n421), .Q(intDX[12]), .QN(n1065) );
  DFFRX1TS XRegister_Q_reg_11_ ( .D(Data_X[11]), .CK(YRegister_net3641721), 
        .RN(n421), .Q(intDX[11]), .QN(n1030) );
  DFFRX1TS XRegister_Q_reg_10_ ( .D(Data_X[10]), .CK(YRegister_net3641721), 
        .RN(n1102), .Q(intDX[10]), .QN(n1011) );
  DFFRX1TS XRegister_Q_reg_9_ ( .D(Data_X[9]), .CK(YRegister_net3641721), .RN(
        n1105), .Q(intDX[9]), .QN(n1004) );
  DFFRX1TS XRegister_Q_reg_8_ ( .D(Data_X[8]), .CK(YRegister_net3641721), .RN(
        n489), .Q(intDX[8]), .QN(n1035) );
  DFFRX1TS XRegister_Q_reg_6_ ( .D(Data_X[6]), .CK(YRegister_net3641721), .RN(
        n1106), .Q(intDX[6]), .QN(n1019) );
  DFFRX1TS XRegister_Q_reg_3_ ( .D(Data_X[3]), .CK(YRegister_net3641721), .RN(
        n491), .Q(intDX[3]), .QN(n1034) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_13_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[13]), .CK(clk), .RN(n1108), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[39]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_10_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[10]), .CK(clk), .RN(n421), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[36]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_11_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[11]), .CK(clk), .RN(n1105), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[37]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_14_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[14]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[40]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_15_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[15]), .CK(clk), .RN(n421), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[41]) );
  DFFRX2TS XRegister_Q_reg_7_ ( .D(Data_X[7]), .CK(YRegister_net3641721), .RN(
        n1106), .QN(n1099) );
  DFFRX2TS Leading_Zero_Detector_Module_Output_Reg_Q_reg_4_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[4]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3641739), .RN(n1100), .Q(
        LZA_output[4]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_20_ ( .D(
        Add_Subt_Sgf_module_S_to_D[20]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1105), .Q(
        Add_Subt_result[20]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_14_ ( .D(
        Add_Subt_Sgf_module_S_to_D[14]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1108), .Q(
        Add_Subt_result[14]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_3_ ( .D(
        Add_Subt_Sgf_module_S_to_D[3]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1110), .Q(
        Add_Subt_result[3]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_6_ ( .D(
        Add_Subt_Sgf_module_S_to_D[6]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1108), .Q(
        Add_Subt_result[6]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_1_ ( .D(
        Add_Subt_Sgf_module_S_to_D[1]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1110), .Q(
        Add_Subt_result[1]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_4_ ( .D(
        Add_Subt_Sgf_module_S_to_D[4]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1108), .Q(
        Add_Subt_result[4]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_23_ ( .D(
        Add_Subt_Sgf_module_S_to_D[23]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1108), .Q(
        Add_Subt_result[23]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_11_ ( .D(
        Add_Subt_Sgf_module_S_to_D[11]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1107), .Q(
        Add_Subt_result[11]) );
  DFFRX2TS XRegister_Q_reg_28_ ( .D(Data_X[28]), .CK(YRegister_net3641721), 
        .RN(n491), .QN(n1098) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_9_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[9]), .CK(clk), .RN(n1102), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[35]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_5_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[5]), .CK(clk), .RN(n422), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[31]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_3_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[3]), .CK(clk), .RN(n489), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[29]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_7_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[7]), .CK(clk), .RN(n1106), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[33]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_4_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[4]), .CK(clk), .RN(n491), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[30]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_2_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[2]), .CK(clk), .RN(n490), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[28]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_6_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[6]), .CK(clk), .RN(n1102), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[32]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_8_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[8]), .CK(clk), .RN(n1101), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[34]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_23_ ( .D(n1121), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1109), .Q(
        Sgf_normalized_result[23]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_22_ ( .D(n1125), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1108), .Q(
        Sgf_normalized_result[22]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_0_ ( .D(n1139), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1106), .Q(
        Sgf_normalized_result[0]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_1_ ( .D(n1118), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1109), .Q(
        Sgf_normalized_result[1]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_22_ ( .D(
        Add_Subt_Sgf_module_S_to_D[22]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1110), .Q(
        Add_Subt_result[22]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_24_ ( .D(
        Add_Subt_Sgf_module_S_to_D[24]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1106), .Q(
        Add_Subt_result[24]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_15_ ( .D(
        Add_Subt_Sgf_module_S_to_D[15]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1109), .Q(
        Add_Subt_result[15]) );
  DFFRX1TS Exp_Operation_Module_exp_result_Q_reg_2_ ( .D(
        Exp_Operation_Module_Data_S[2]), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n1110), .Q(
        exp_oper_result[2]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_2_ ( .D(n1122), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1110), .Q(
        Sgf_normalized_result[2]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_12_ ( .D(n1138), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1109), .Q(
        Sgf_normalized_result[12]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_13_ ( .D(n1137), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1110), .Q(
        Sgf_normalized_result[13]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_11_ ( .D(n1136), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1108), .Q(
        Sgf_normalized_result[11]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_14_ ( .D(n1135), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n421), .Q(
        Sgf_normalized_result[14]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_10_ ( .D(n1134), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1106), .Q(
        Sgf_normalized_result[10]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_15_ ( .D(n1133), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1107), .Q(
        Sgf_normalized_result[15]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_9_ ( .D(n1132), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1109), .Q(
        Sgf_normalized_result[9]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_16_ ( .D(n1131), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1102), .Q(
        Sgf_normalized_result[16]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_8_ ( .D(n1130), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1110), .Q(
        Sgf_normalized_result[8]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_17_ ( .D(n1129), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n422), .Q(
        Sgf_normalized_result[17]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_7_ ( .D(n1128), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1108), .Q(
        Sgf_normalized_result[7]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_18_ ( .D(n1127), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n421), .Q(
        Sgf_normalized_result[18]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_3_ ( .D(n1126), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1108), .Q(
        Sgf_normalized_result[3]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_6_ ( .D(n1124), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1107), .Q(
        Sgf_normalized_result[6]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_19_ ( .D(n1123), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1107), .Q(
        Sgf_normalized_result[19]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_5_ ( .D(n1120), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1106), .Q(
        Sgf_normalized_result[5]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_20_ ( .D(n1119), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1107), .Q(
        Sgf_normalized_result[20]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_24_ ( .D(n1117), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1110), .Q(
        Sgf_normalized_result[24]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_4_ ( .D(n1116), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n422), .Q(
        Sgf_normalized_result[4]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_21_ ( .D(n1115), .CK(
        Barrel_Shifter_module_Output_Reg_net3641757), .RN(n1106), .Q(
        Sgf_normalized_result[21]) );
  DFFRX1TS Exp_Operation_Module_exp_result_Q_reg_0_ ( .D(
        Exp_Operation_Module_Data_S[0]), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n422), .Q(
        exp_oper_result[0]) );
  DFFRX2TS YRegister_Q_reg_12_ ( .D(Data_Y[12]), .CK(YRegister_net3641721), 
        .RN(n1102), .Q(intDY[12]), .QN(n1036) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_21_ ( .D(
        Add_Subt_Sgf_module_S_to_D[21]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3641757), .RN(n1107), .Q(
        Add_Subt_result[21]), .QN(n1050) );
  DFFRXLTS Exp_Operation_Module_Underflow_Q_reg_0_ ( .D(n401), .CK(
        Exp_Operation_Module_exp_result_net3641775), .RN(n422), .Q(
        underflow_flag), .QN(n1093) );
  ADDFX1TS DP_OP_45J178_125_5354_U27 ( .A(S_A_S_Oper_A[0]), .B(n1097), .CI(
        DP_OP_45J178_125_5354_n56), .CO(DP_OP_45J178_125_5354_n26), .S(
        Add_Subt_Sgf_module_S_to_D[0]) );
  ADDFX1TS DP_OP_45J178_125_5354_U26 ( .A(DP_OP_45J178_125_5354_n55), .B(
        S_A_S_Oper_A[1]), .CI(DP_OP_45J178_125_5354_n26), .CO(
        DP_OP_45J178_125_5354_n25), .S(Add_Subt_Sgf_module_S_to_D[1]) );
  ADDFX1TS DP_OP_45J178_125_5354_U24 ( .A(DP_OP_45J178_125_5354_n53), .B(
        S_A_S_Oper_A[3]), .CI(DP_OP_45J178_125_5354_n24), .CO(
        DP_OP_45J178_125_5354_n23), .S(Add_Subt_Sgf_module_S_to_D[3]) );
  ADDFX1TS DP_OP_45J178_125_5354_U23 ( .A(DP_OP_45J178_125_5354_n52), .B(
        S_A_S_Oper_A[4]), .CI(DP_OP_45J178_125_5354_n23), .CO(
        DP_OP_45J178_125_5354_n22), .S(Add_Subt_Sgf_module_S_to_D[4]) );
  DFFRX4TS FS_Module_state_reg_reg_0_ ( .D(FS_Module_state_next[0]), .CK(
        FS_Module_net3641811), .RN(n421), .Q(FS_Module_state_reg[0]) );
  DFFRX2TS Sel_B_Q_reg_1_ ( .D(n404), .CK(FS_Module_net3641811), .RN(n400), 
        .Q(FSM_selector_B[1]), .QN(n440) );
  CMPR32X2TS DP_OP_45J178_125_5354_U12 ( .A(DP_OP_45J178_125_5354_n41), .B(
        S_A_S_Oper_A[15]), .C(DP_OP_45J178_125_5354_n12), .CO(
        DP_OP_45J178_125_5354_n11), .S(Add_Subt_Sgf_module_S_to_D[15]) );
  CMPR32X2TS DP_OP_42J178_122_8048_U7 ( .A(DP_OP_42J178_122_8048_n18), .B(
        S_Oper_A_exp[2]), .C(DP_OP_42J178_122_8048_n7), .CO(
        DP_OP_42J178_122_8048_n6), .S(Exp_Operation_Module_Data_S[2]) );
  CMPR32X2TS DP_OP_45J178_125_5354_U7 ( .A(DP_OP_45J178_125_5354_n36), .B(
        S_A_S_Oper_A[20]), .C(DP_OP_45J178_125_5354_n7), .CO(
        DP_OP_45J178_125_5354_n6), .S(Add_Subt_Sgf_module_S_to_D[20]) );
  CLKINVX6TS U648 ( .A(rst), .Y(n489) );
  NOR2X4TS U649 ( .A(overflow_flag), .B(underflow_flag), .Y(n995) );
  INVX8TS U650 ( .A(n930), .Y(n971) );
  OAI33X1TS U651 ( .A0(sign_final_result), .A1(r_mode[0]), .A2(n442), .B0(n439), .B1(n441), .B2(r_mode[1]), .Y(n443) );
  XOR2XLTS U652 ( .A(DP_OP_45J178_125_5354_n1), .B(n1097), .Y(
        Add_Subt_Sgf_module_S_to_D[26]) );
  BUFX6TS U653 ( .A(n971), .Y(n972) );
  CLKINVX6TS U654 ( .A(n734), .Y(n661) );
  NOR2XLTS U655 ( .A(n980), .B(n652), .Y(n626) );
  OAI211XLTS U656 ( .A0(n790), .A1(n789), .B0(n788), .C0(n787), .Y(
        FS_Module_state_next[3]) );
  CLKINVX6TS U657 ( .A(n767), .Y(n648) );
  NOR3BXLTS U658 ( .AN(n556), .B(n791), .C(n411), .Y(n444) );
  OAI211XLTS U659 ( .A0(n869), .A1(n925), .B0(n868), .C0(n867), .Y(n874) );
  NOR2BX4TS U660 ( .AN(n565), .B(n824), .Y(n566) );
  CLKINVX3TS U661 ( .A(n538), .Y(n420) );
  NAND3XLTS U662 ( .A(n1089), .B(n866), .C(intDX[26]), .Y(n868) );
  NAND2BXLTS U663 ( .AN(intDX[27]), .B(intDY[27]), .Y(n866) );
  BUFX6TS U664 ( .A(n489), .Y(n421) );
  BUFX6TS U665 ( .A(n489), .Y(n1102) );
  BUFX6TS U666 ( .A(n489), .Y(n1106) );
  BUFX6TS U667 ( .A(n489), .Y(n1101) );
  BUFX6TS U668 ( .A(n489), .Y(n422) );
  AO22XLTS U669 ( .A0(n649), .A1(Add_Subt_result[12]), .B0(DmP[11]), .B1(n705), 
        .Y(n650) );
  AO22XLTS U670 ( .A0(n704), .A1(n761), .B0(n760), .B1(n991), .Y(n423) );
  AO22XLTS U671 ( .A0(n710), .A1(n669), .B0(n988), .B1(n725), .Y(n426) );
  AO22XLTS U672 ( .A0(n704), .A1(n714), .B0(n703), .B1(n991), .Y(n425) );
  AOI211X1TS U673 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[30]), .A1(
        n430), .B0(n612), .C0(n640), .Y(n614) );
  AOI211X1TS U674 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[31]), .A1(
        n430), .B0(n604), .C0(n640), .Y(n606) );
  AOI211X1TS U675 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[32]), .A1(
        n430), .B0(n600), .C0(n640), .Y(n602) );
  AOI211X1TS U676 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[29]), .A1(
        n430), .B0(n608), .C0(n640), .Y(n610) );
  AOI211X1TS U677 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[33]), .A1(
        n430), .B0(n594), .C0(n640), .Y(n598) );
  AOI211X1TS U678 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[28]), .A1(
        n430), .B0(n616), .C0(n640), .Y(n618) );
  AOI32X1TS U679 ( .A0(n704), .A1(n661), .A2(n989), .B0(n772), .B1(n661), .Y(
        n773) );
  OA21XLTS U680 ( .A0(n961), .A1(n591), .B0(n632), .Y(n428) );
  OR2X1TS U681 ( .A(n440), .B(n936), .Y(n429) );
  OAI221X1TS U682 ( .A0(n1034), .A1(intDY[3]), .B0(n1012), .B1(intDY[2]), .C0(
        n448), .Y(n451) );
  OAI221X1TS U683 ( .A0(n1007), .A1(intDY[20]), .B0(n1038), .B1(intDY[19]), 
        .C0(n462), .Y(n465) );
  INVX1TS U684 ( .A(ready), .Y(n492) );
  NOR2X4TS U685 ( .A(n534), .B(add_overflow_flag), .Y(n967) );
  OA21XLTS U686 ( .A0(Sgf_normalized_result[1]), .A1(Sgf_normalized_result[0]), 
        .B0(n443), .Y(n790) );
  NOR2X2TS U687 ( .A(n931), .B(n480), .Y(n786) );
  NAND4X1TS U688 ( .A(n479), .B(n478), .C(n477), .D(n476), .Y(n931) );
  NOR2X2TS U689 ( .A(n704), .B(n992), .Y(n772) );
  AOI222X1TS U690 ( .A0(n637), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[47]), .B0(n566), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[31]), .C1(n587), .Y(n607)
         );
  AOI222X1TS U691 ( .A0(n637), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[44]), .B0(n566), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[28]), .C1(n587), .Y(n619)
         );
  AOI222X1TS U692 ( .A0(n637), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[45]), .B0(n566), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[29]), .C1(n587), .Y(n611)
         );
  AOI222X1TS U693 ( .A0(n637), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[48]), .B0(n566), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[32]), .C1(n587), .Y(n603)
         );
  AOI222X1TS U694 ( .A0(n637), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(n566), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[33]), .C1(n587), .Y(n599)
         );
  AOI222X1TS U695 ( .A0(n637), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[46]), .B0(n566), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[30]), .C1(n587), .Y(n615)
         );
  NOR2X4TS U696 ( .A(n824), .B(n571), .Y(n587) );
  INVX2TS U697 ( .A(n428), .Y(n430) );
  NOR2X2TS U698 ( .A(n538), .B(n936), .Y(n954) );
  INVX2TS U699 ( .A(n429), .Y(n431) );
  BUFX4TS U700 ( .A(n1106), .Y(n1100) );
  BUFX4TS U701 ( .A(n491), .Y(n1105) );
  BUFX3TS U702 ( .A(n489), .Y(n490) );
  AOI32X2TS U703 ( .A0(n700), .A1(n704), .A2(n699), .B0(n698), .B1(n991), .Y(
        n724) );
  NAND2X2TS U704 ( .A(n625), .B(n567), .Y(n564) );
  AND2X6TS U705 ( .A(n826), .B(n623), .Y(n704) );
  OAI221XLTS U706 ( .A0(n1033), .A1(intDY[29]), .B0(n1036), .B1(intDX[12]), 
        .C0(n471), .Y(n472) );
  OAI2BB1X2TS U707 ( .A0N(exp_oper_result[0]), .A1N(n1029), .B0(n830), .Y(n652) );
  AOI222X1TS U708 ( .A0(n985), .A1(n661), .B0(n989), .B1(n648), .C0(n988), 
        .C1(n986), .Y(n763) );
  BUFX6TS U709 ( .A(n654), .Y(n986) );
  INVX2TS U710 ( .A(n424), .Y(overflow_flag) );
  INVX2TS U711 ( .A(n427), .Y(n433) );
  INVX2TS U712 ( .A(n426), .Y(n434) );
  AOI22X2TS U713 ( .A0(n710), .A1(n697), .B0(n696), .B1(n991), .Y(n759) );
  INVX2TS U714 ( .A(n423), .Y(n435) );
  INVX2TS U715 ( .A(n425), .Y(n436) );
  INVX6TS U716 ( .A(n715), .Y(n706) );
  BUFX6TS U717 ( .A(FSM_selector_D), .Y(n853) );
  BUFX6TS U718 ( .A(n1045), .Y(n705) );
  CLKINVX6TS U719 ( .A(n971), .Y(n973) );
  INVX6TS U720 ( .A(n717), .Y(n708) );
  OAI2BB1X2TS U721 ( .A0N(Add_Subt_result[24]), .A1N(n673), .B0(n672), .Y(n985) );
  NOR2X1TS U722 ( .A(Add_Subt_result[23]), .B(Add_Subt_result[22]), .Y(n855)
         );
  OAI2BB1X2TS U723 ( .A0N(Add_Subt_result[22]), .A1N(n708), .B0(n670), .Y(n989) );
  INVX2TS U724 ( .A(n437), .Y(n438) );
  OAI221X1TS U725 ( .A0(n1053), .A1(intDY[16]), .B0(n1041), .B1(intDY[15]), 
        .C0(n460), .Y(n467) );
  OAI221X1TS U726 ( .A0(n1009), .A1(intDY[24]), .B0(n1043), .B1(intDY[23]), 
        .C0(n468), .Y(n475) );
  AOI221X1TS U727 ( .A0(intDX[30]), .A1(n1018), .B0(intDX[29]), .B1(n1083), 
        .C0(n871), .Y(n873) );
  AOI222X1TS U728 ( .A0(n939), .A1(n636), .B0(FSM_selector_B[1]), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .C0(n937), .C1(n635), 
        .Y(n942) );
  MXI2X2TS U729 ( .A(n1016), .B(n1051), .S0(exp_oper_result[3]), .Y(n937) );
  NAND2X2TS U730 ( .A(n420), .B(exp_oper_result[4]), .Y(n570) );
  OAI221X1TS U731 ( .A0(n1030), .A1(intDY[11]), .B0(n1011), .B1(intDY[10]), 
        .C0(n894), .Y(n457) );
  OAI2BB2XLTS U732 ( .B0(n896), .B1(n903), .A0N(n895), .A1N(n894), .Y(n899) );
  AOI22X2TS U733 ( .A0(n1030), .A1(intDY[11]), .B0(n1011), .B1(intDY[10]), .Y(
        n894) );
  AOI22X2TS U734 ( .A0(n526), .A1(Add_Subt_result[10]), .B0(n845), .B1(
        Add_Subt_result[18]), .Y(n863) );
  NOR2X2TS U735 ( .A(n841), .B(n499), .Y(n526) );
  OAI211X1TS U736 ( .A0(FSM_selector_B[1]), .A1(n1031), .B0(n824), .C0(n590), 
        .Y(n536) );
  NOR2X2TS U737 ( .A(n532), .B(n1003), .Y(n590) );
  OAI211X2TS U738 ( .A0(intDX[12]), .A1(n1036), .B0(n901), .C0(n887), .Y(n903)
         );
  AOI211XLTS U739 ( .A0(intDY[16]), .A1(n1053), .B0(n915), .C0(n916), .Y(n907)
         );
  OAI211X2TS U740 ( .A0(intDX[20]), .A1(n1071), .B0(n921), .C0(n906), .Y(n915)
         );
  BUFX4TS U741 ( .A(n491), .Y(n1109) );
  BUFX4TS U742 ( .A(n490), .Y(n1110) );
  BUFX4TS U743 ( .A(n1101), .Y(n1107) );
  BUFX4TS U744 ( .A(n489), .Y(n1108) );
  BUFX3TS U745 ( .A(n489), .Y(n491) );
  NOR2X4TS U746 ( .A(n595), .B(n958), .Y(n840) );
  AOI21X2TS U747 ( .A0(FSM_selector_B[0]), .A1(n569), .B0(n568), .Y(n595) );
  NOR4X4TS U748 ( .A(FS_Module_state_reg[0]), .B(FS_Module_state_reg[3]), .C(
        FS_Module_state_reg[2]), .D(n1000), .Y(n413) );
  NOR2X4TS U749 ( .A(n1029), .B(FSM_selector_B[1]), .Y(n625) );
  BUFX6TS U750 ( .A(n995), .Y(n997) );
  NOR3X1TS U751 ( .A(n1098), .B(n870), .C(intDY[28]), .Y(n871) );
  OAI221X1TS U752 ( .A0(n1098), .A1(intDY[28]), .B0(n1013), .B1(intDY[27]), 
        .C0(n470), .Y(n473) );
  BUFX6TS U753 ( .A(n626), .Y(n990) );
  NOR2X2TS U754 ( .A(Add_Subt_result[11]), .B(Add_Subt_result[13]), .Y(n842)
         );
  OAI2BB1X2TS U755 ( .A0N(Add_Subt_result[23]), .A1N(n708), .B0(n668), .Y(n988) );
  NOR2X2TS U756 ( .A(Add_Subt_result[6]), .B(Add_Subt_result[7]), .Y(n523) );
  AOI22X2TS U757 ( .A0(n710), .A1(n680), .B0(n669), .B1(n725), .Y(n742) );
  AOI22X2TS U758 ( .A0(n710), .A1(n696), .B0(n690), .B1(n725), .Y(n748) );
  AOI22X2TS U759 ( .A0(n710), .A1(n690), .B0(n680), .B1(n725), .Y(n754) );
  AOI22X2TS U760 ( .A0(n704), .A1(n663), .B0(n761), .B1(n725), .Y(n738) );
  AOI22X2TS U761 ( .A0(n704), .A1(n684), .B0(n663), .B1(n725), .Y(n749) );
  AOI22X2TS U762 ( .A0(n704), .A1(n698), .B0(n692), .B1(n725), .Y(n756) );
  AOI22X2TS U763 ( .A0(n704), .A1(n692), .B0(n686), .B1(n725), .Y(n745) );
  AOI22X2TS U764 ( .A0(n704), .A1(n686), .B0(n671), .B1(n725), .Y(n751) );
  AOI22X2TS U765 ( .A0(n704), .A1(n727), .B0(n726), .B1(n725), .Y(n755) );
  AOI22X2TS U766 ( .A0(n710), .A1(n726), .B0(n684), .B1(n725), .Y(n743) );
  AOI22X2TS U767 ( .A0(n704), .A1(n703), .B0(n682), .B1(n725), .Y(n744) );
  AOI22X2TS U768 ( .A0(n704), .A1(n660), .B0(n674), .B1(n725), .Y(n739) );
  AOI22X2TS U769 ( .A0(n704), .A1(n682), .B0(n660), .B1(n991), .Y(n750) );
  INVX4TS U770 ( .A(n710), .Y(n991) );
  INVX4TS U771 ( .A(n710), .Y(n725) );
  BUFX6TS U772 ( .A(FSM_selector_D), .Y(n854) );
  BUFX6TS U773 ( .A(n814), .Y(n1097) );
  NOR3X1TS U774 ( .A(n844), .B(Add_Subt_result[18]), .C(Add_Subt_result[14]), 
        .Y(n496) );
  NOR2X4TS U775 ( .A(n1001), .B(LZA_output[4]), .Y(n565) );
  NOR2X4TS U776 ( .A(LZA_output[3]), .B(LZA_output[4]), .Y(n569) );
  NOR2X2TS U777 ( .A(LZA_output[4]), .B(n824), .Y(n636) );
  OAI221X1TS U778 ( .A0(n1099), .A1(intDY[7]), .B0(n1019), .B1(intDY[6]), .C0(
        n883), .Y(n459) );
  AOI211XLTS U779 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .A1(
        n562), .B0(n945), .C0(n547), .Y(n548) );
  AOI211XLTS U780 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .A1(
        n562), .B0(n945), .C0(n544), .Y(n545) );
  AOI211XLTS U781 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .A1(
        n562), .B0(n945), .C0(n539), .Y(n540) );
  AOI211XLTS U782 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[36]), .A1(
        n562), .B0(n945), .C0(n552), .Y(n553) );
  NOR2XLTS U783 ( .A(n1081), .B(intDX[11]), .Y(n889) );
  OAI21XLTS U784 ( .A0(intDX[15]), .A1(n1090), .B0(intDX[14]), .Y(n897) );
  NOR2XLTS U785 ( .A(n910), .B(intDY[16]), .Y(n911) );
  OAI21XLTS U786 ( .A0(intDX[23]), .A1(n1091), .B0(intDX[22]), .Y(n917) );
  OR2X1TS U787 ( .A(FSM_selector_B[0]), .B(FSM_selector_B[1]), .Y(n538) );
  NOR2XLTS U788 ( .A(n962), .B(n1051), .Y(n612) );
  NOR2XLTS U789 ( .A(n991), .B(n661), .Y(n984) );
  AOI31XLTS U790 ( .A0(n516), .A1(Add_Subt_result[6]), .A2(n1094), .B0(n515), 
        .Y(n518) );
  OAI211XLTS U791 ( .A0(n434), .A1(n734), .B0(n678), .C0(n677), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[16]) );
  OAI211XLTS U792 ( .A0(n759), .A1(n767), .B0(n729), .C0(n728), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[2]) );
  OAI211XLTS U793 ( .A0(n948), .A1(n958), .B0(n643), .C0(n642), .Y(n1132) );
  XOR2X1TS U794 ( .A(n1111), .B(n438), .Y(n480) );
  BUFX4TS U795 ( .A(FSM_selector_D), .Y(n832) );
  NOR2X2TS U796 ( .A(n480), .B(n832), .Y(n814) );
  NOR3X2TS U797 ( .A(FS_Module_state_reg[3]), .B(n1000), .C(n1027), .Y(
        FSM_Add_Subt_Sgf_load) );
  NOR2X2TS U798 ( .A(FS_Module_state_reg[1]), .B(n1028), .Y(n555) );
  AND3X1TS U799 ( .A(n555), .B(FS_Module_state_reg[0]), .C(
        FS_Module_state_reg[2]), .Y(FSM_Final_Result_load) );
  NOR2X2TS U800 ( .A(FS_Module_state_reg[1]), .B(FS_Module_state_reg[3]), .Y(
        n558) );
  INVX2TS U801 ( .A(FS_Module_state_reg[0]), .Y(n557) );
  NOR2X2TS U802 ( .A(FS_Module_state_reg[2]), .B(n557), .Y(n627) );
  CLKAND2X2TS U803 ( .A(n558), .B(n627), .Y(n411) );
  NAND2X1TS U804 ( .A(FS_Module_state_reg[2]), .B(n558), .Y(n482) );
  INVX2TS U805 ( .A(n482), .Y(n620) );
  NAND2X1TS U806 ( .A(FS_Module_state_reg[0]), .B(n620), .Y(n998) );
  AOI211XLTS U807 ( .A0(FS_Module_state_reg[0]), .A1(FSM_Add_Subt_Sgf_load), 
        .B0(n413), .C0(FSM_Final_Result_load), .Y(n445) );
  NOR3X2TS U808 ( .A(FS_Module_state_reg[0]), .B(FS_Module_state_reg[2]), .C(
        n1028), .Y(n850) );
  NAND2X1TS U809 ( .A(FS_Module_state_reg[1]), .B(n850), .Y(n556) );
  INVX2TS U810 ( .A(r_mode[1]), .Y(n442) );
  INVX2TS U811 ( .A(r_mode[0]), .Y(n441) );
  NAND2X1TS U812 ( .A(n627), .B(n555), .Y(n789) );
  NOR2BX1TS U813 ( .AN(n790), .B(n789), .Y(n791) );
  OAI211XLTS U814 ( .A0(FSM_selector_C), .A1(n998), .B0(n444), .C0(n445), .Y(
        FS_Module_state_next[1]) );
  INVX2TS U815 ( .A(n627), .Y(n446) );
  OAI22X1TS U816 ( .A0(FS_Module_state_reg[0]), .A1(n482), .B0(n1000), .B1(
        n446), .Y(FSM_exp_operation_load_diff) );
  AOI22X1TS U817 ( .A0(intDX[30]), .A1(intDY[30]), .B0(n1018), .B1(n1047), .Y(
        n453) );
  AOI22X1TS U818 ( .A0(n1032), .A1(intDY[1]), .B0(n1015), .B1(intDY[0]), .Y(
        n447) );
  OAI221XLTS U819 ( .A0(n1032), .A1(intDY[1]), .B0(n1015), .B1(intDY[0]), .C0(
        n447), .Y(n452) );
  AOI22X1TS U820 ( .A0(n1034), .A1(intDY[3]), .B0(n1012), .B1(intDY[2]), .Y(
        n448) );
  AOI22X1TS U821 ( .A0(n1046), .A1(intDY[5]), .B0(n1014), .B1(intDY[4]), .Y(
        n449) );
  OAI221XLTS U822 ( .A0(n1046), .A1(intDY[5]), .B0(n1014), .B1(intDY[4]), .C0(
        n449), .Y(n450) );
  NOR4X1TS U823 ( .A(n453), .B(n452), .C(n451), .D(n450), .Y(n479) );
  AOI22X1TS U824 ( .A0(intDY[7]), .A1(n1099), .B0(intDY[6]), .B1(n1019), .Y(
        n883) );
  AOI22X1TS U825 ( .A0(n1004), .A1(intDY[9]), .B0(n1035), .B1(intDY[8]), .Y(
        n454) );
  OAI221XLTS U826 ( .A0(n1004), .A1(intDY[9]), .B0(n1035), .B1(intDY[8]), .C0(
        n454), .Y(n458) );
  AOI22X1TS U827 ( .A0(n1005), .A1(intDY[14]), .B0(n1040), .B1(intDY[13]), .Y(
        n455) );
  OAI221XLTS U828 ( .A0(n1005), .A1(intDY[14]), .B0(n1040), .B1(intDY[13]), 
        .C0(n455), .Y(n456) );
  NOR4X1TS U829 ( .A(n459), .B(n458), .C(n457), .D(n456), .Y(n478) );
  AOI22X1TS U830 ( .A0(n1053), .A1(intDY[16]), .B0(n1041), .B1(intDY[15]), .Y(
        n460) );
  AOI22X1TS U831 ( .A0(n1006), .A1(intDY[18]), .B0(n1037), .B1(intDY[17]), .Y(
        n461) );
  OAI221XLTS U832 ( .A0(n1006), .A1(intDY[18]), .B0(n1037), .B1(intDY[17]), 
        .C0(n461), .Y(n466) );
  AOI22X1TS U833 ( .A0(n1007), .A1(intDY[20]), .B0(n1038), .B1(intDY[19]), .Y(
        n462) );
  AOI22X1TS U834 ( .A0(n1008), .A1(intDY[22]), .B0(n1042), .B1(intDY[21]), .Y(
        n463) );
  OAI221XLTS U835 ( .A0(n1008), .A1(intDY[22]), .B0(n1042), .B1(intDY[21]), 
        .C0(n463), .Y(n464) );
  NOR4X1TS U836 ( .A(n467), .B(n466), .C(n465), .D(n464), .Y(n477) );
  AOI22X1TS U837 ( .A0(n1009), .A1(intDY[24]), .B0(n1043), .B1(intDY[23]), .Y(
        n468) );
  AOI22X1TS U838 ( .A0(n1010), .A1(intDY[26]), .B0(n1039), .B1(intDY[25]), .Y(
        n469) );
  OAI221XLTS U839 ( .A0(n1010), .A1(intDY[26]), .B0(n1039), .B1(intDY[25]), 
        .C0(n469), .Y(n474) );
  AOI22X1TS U840 ( .A0(n1098), .A1(intDY[28]), .B0(n1013), .B1(intDY[27]), .Y(
        n470) );
  AOI22X1TS U841 ( .A0(n1033), .A1(intDY[29]), .B0(n1036), .B1(intDX[12]), .Y(
        n471) );
  NOR4X1TS U842 ( .A(n475), .B(n474), .C(n473), .D(n472), .Y(n476) );
  AOI211XLTS U843 ( .A0(n786), .A1(n413), .B0(n555), .C0(
        FSM_exp_operation_load_diff), .Y(n481) );
  OAI21XLTS U844 ( .A0(FSM_selector_C), .A1(n998), .B0(n481), .Y(
        FS_Module_state_next[2]) );
  NAND3X2TS U845 ( .A(n1027), .B(n557), .C(n558), .Y(n400) );
  AOI21X1TS U846 ( .A0(n627), .A1(FS_Module_state_reg[3]), .B0(n558), .Y(n485)
         );
  NOR3XLTS U847 ( .A(FS_Module_state_reg[0]), .B(FSM_selector_C), .C(n482), 
        .Y(n483) );
  AOI211XLTS U848 ( .A0(FS_Module_state_reg[0]), .A1(n1000), .B0(n483), .C0(
        n1003), .Y(n484) );
  NAND3BXLTS U849 ( .AN(n485), .B(n484), .C(n400), .Y(n486) );
  CLKBUFX3TS U850 ( .A(n486), .Y(n1096) );
  AND4X1TS U851 ( .A(Exp_Operation_Module_Data_S[3]), .B(
        Exp_Operation_Module_Data_S[2]), .C(Exp_Operation_Module_Data_S[1]), 
        .D(Exp_Operation_Module_Data_S[0]), .Y(n487) );
  AND4X1TS U852 ( .A(Exp_Operation_Module_Data_S[6]), .B(
        Exp_Operation_Module_Data_S[5]), .C(Exp_Operation_Module_Data_S[4]), 
        .D(n487), .Y(n488) );
  XOR2X1TS U853 ( .A(DP_OP_42J178_122_8048_n1), .B(n1096), .Y(n781) );
  AO21XLTS U854 ( .A0(Exp_Operation_Module_Data_S[7]), .A1(n488), .B0(n781), 
        .Y(n1112) );
  BUFX3TS U855 ( .A(n489), .Y(n1104) );
  NOR4X1TS U856 ( .A(FS_Module_state_reg[0]), .B(n1028), .C(n1000), .D(n1027), 
        .Y(ready) );
  OA22X1TS U857 ( .A0(ack_FSM), .A1(n492), .B0(beg_FSM), .B1(n400), .Y(n412)
         );
  INVX2TS U858 ( .A(FSM_Add_Subt_Sgf_load), .Y(n493) );
  OAI21XLTS U859 ( .A0(FS_Module_state_reg[0]), .A1(n493), .B0(n705), .Y(n407)
         );
  INVX2TS U860 ( .A(n850), .Y(n852) );
  NOR2XLTS U861 ( .A(FS_Module_state_reg[1]), .B(n852), .Y(FSM_LZA_load) );
  INVX2TS U862 ( .A(Add_Subt_result[0]), .Y(n716) );
  AOI2BB1X1TS U863 ( .A0N(n716), .A1N(Add_Subt_result[1]), .B0(
        Add_Subt_result[2]), .Y(n519) );
  NOR2BX1TS U864 ( .AN(n519), .B(Add_Subt_result[3]), .Y(n507) );
  NOR3X1TS U865 ( .A(Add_Subt_result[21]), .B(Add_Subt_result[20]), .C(
        Add_Subt_result[19]), .Y(n502) );
  INVX2TS U866 ( .A(n502), .Y(n494) );
  NOR2X1TS U867 ( .A(Add_Subt_result[25]), .B(Add_Subt_result[24]), .Y(n859)
         );
  NAND2X1TS U868 ( .A(n859), .B(n855), .Y(n501) );
  NOR2X2TS U869 ( .A(n494), .B(n501), .Y(n845) );
  NOR2XLTS U870 ( .A(Add_Subt_result[15]), .B(Add_Subt_result[16]), .Y(n495)
         );
  NAND2X1TS U871 ( .A(n1017), .B(n495), .Y(n844) );
  NAND2X1TS U872 ( .A(n845), .B(n496), .Y(n841) );
  NAND2X1TS U873 ( .A(n842), .B(n1022), .Y(n499) );
  NOR3X1TS U874 ( .A(Add_Subt_result[9]), .B(Add_Subt_result[10]), .C(
        Add_Subt_result[8]), .Y(n497) );
  NAND2X1TS U875 ( .A(n526), .B(n497), .Y(n522) );
  NAND2X1TS U876 ( .A(n523), .B(n1023), .Y(n498) );
  OR2X1TS U877 ( .A(n522), .B(n498), .Y(n504) );
  NOR2X1TS U878 ( .A(n504), .B(Add_Subt_result[4]), .Y(n520) );
  INVX2TS U879 ( .A(n520), .Y(n508) );
  INVX2TS U880 ( .A(n522), .Y(n516) );
  INVX2TS U881 ( .A(n841), .Y(n860) );
  NAND2X1TS U882 ( .A(n860), .B(n499), .Y(n500) );
  OAI211XLTS U883 ( .A0(n502), .A1(n501), .B0(n863), .C0(n500), .Y(n503) );
  AOI31XLTS U884 ( .A0(n516), .A1(n523), .A2(Add_Subt_result[5]), .B0(n503), 
        .Y(n506) );
  INVX2TS U885 ( .A(n504), .Y(n505) );
  CLKAND2X2TS U886 ( .A(n505), .B(Add_Subt_result[4]), .Y(n524) );
  INVX2TS U887 ( .A(n524), .Y(n517) );
  OAI211XLTS U888 ( .A0(n507), .A1(n508), .B0(n506), .C0(n517), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[2]) );
  NOR2X1TS U889 ( .A(n508), .B(Add_Subt_result[3]), .Y(n527) );
  INVX2TS U890 ( .A(n527), .Y(n529) );
  INVX2TS U891 ( .A(n845), .Y(n857) );
  NOR4BX1TS U892 ( .AN(Add_Subt_result[14]), .B(n857), .C(Add_Subt_result[18]), 
        .D(n844), .Y(n509) );
  AOI31X1TS U893 ( .A0(n860), .A1(Add_Subt_result[12]), .A2(n1061), .B0(n509), 
        .Y(n847) );
  AOI21X1TS U894 ( .A0(n1050), .A1(Add_Subt_result[20]), .B0(
        Add_Subt_result[22]), .Y(n510) );
  AOI2BB1XLTS U895 ( .A0N(n510), .A1N(Add_Subt_result[23]), .B0(
        Add_Subt_result[24]), .Y(n511) );
  NOR2XLTS U896 ( .A(n511), .B(Add_Subt_result[25]), .Y(n512) );
  AOI31XLTS U897 ( .A0(n845), .A1(Add_Subt_result[16]), .A2(n1017), .B0(n512), 
        .Y(n514) );
  NAND4XLTS U898 ( .A(n860), .B(n842), .C(Add_Subt_result[8]), .D(n1078), .Y(
        n513) );
  NAND4XLTS U899 ( .A(n847), .B(n863), .C(n514), .D(n513), .Y(n515) );
  OAI211XLTS U900 ( .A0(n519), .A1(n529), .B0(n518), .C0(n517), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[0]) );
  AOI31XLTS U901 ( .A0(n1078), .A1(n1002), .A2(n1023), .B0(Add_Subt_result[10]), .Y(n525) );
  OAI21XLTS U902 ( .A0(Add_Subt_result[3]), .A1(Add_Subt_result[2]), .B0(n520), 
        .Y(n521) );
  OAI21X1TS U903 ( .A0(n523), .A1(n522), .B0(n521), .Y(n864) );
  AOI211XLTS U904 ( .A0(n526), .A1(n525), .B0(n864), .C0(n524), .Y(n528) );
  NAND3XLTS U905 ( .A(n527), .B(Add_Subt_result[1]), .C(n1075), .Y(n848) );
  OAI211XLTS U906 ( .A0(n716), .A1(n529), .B0(n848), .C0(n528), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[4]) );
  NAND2X1TS U907 ( .A(n420), .B(exp_oper_result[3]), .Y(n572) );
  NOR2X2TS U908 ( .A(n572), .B(exp_oper_result[4]), .Y(n835) );
  NOR2XLTS U909 ( .A(n1028), .B(n1003), .Y(n531) );
  NAND2X1TS U910 ( .A(FSM_selector_C), .B(n1028), .Y(n534) );
  INVX2TS U911 ( .A(n534), .Y(n530) );
  NOR2X2TS U912 ( .A(n531), .B(n530), .Y(n567) );
  INVX2TS U913 ( .A(n625), .Y(n824) );
  NOR2XLTS U914 ( .A(FSM_selector_C), .B(FS_Module_state_reg[3]), .Y(n532) );
  INVX2TS U915 ( .A(n590), .Y(n936) );
  NOR2X2TS U916 ( .A(n824), .B(n936), .Y(n956) );
  INVX2TS U917 ( .A(n956), .Y(n537) );
  NOR2X1TS U918 ( .A(n1001), .B(n537), .Y(n592) );
  NOR2X1TS U919 ( .A(n936), .B(n572), .Y(n593) );
  AOI211X4TS U920 ( .A0(n835), .A1(n567), .B0(n592), .C0(n593), .Y(n596) );
  NOR3X1TS U921 ( .A(exp_oper_result[4]), .B(FSM_selector_B[0]), .C(
        exp_oper_result[3]), .Y(n533) );
  NOR2X2TS U922 ( .A(n533), .B(FSM_selector_B[1]), .Y(n591) );
  INVX4TS U923 ( .A(n967), .Y(n958) );
  NOR2X4TS U924 ( .A(n591), .B(n958), .Y(n938) );
  AOI22X1TS U925 ( .A0(n565), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[45]), .B0(n569), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .Y(n543) );
  AOI2BB2XLTS U926 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .B1(
        n938), .A0N(n543), .A1N(n564), .Y(n541) );
  INVX2TS U927 ( .A(n591), .Y(n568) );
  NAND2X1TS U928 ( .A(n567), .B(n568), .Y(n535) );
  OAI211X2TS U929 ( .A0(LZA_output[3]), .A1(n537), .B0(n536), .C0(n535), .Y(
        n562) );
  NAND2X2TS U930 ( .A(n625), .B(LZA_output[4]), .Y(n838) );
  AOI21X4TS U931 ( .A0(n838), .A1(n570), .B0(n936), .Y(n945) );
  AOI22X1TS U932 ( .A0(n565), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[48]), .B0(n569), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .Y(n542) );
  NAND2X2TS U933 ( .A(n625), .B(n967), .Y(n934) );
  NAND2X2TS U934 ( .A(n835), .B(n967), .Y(n933) );
  OAI22X1TS U935 ( .A0(n542), .A1(n934), .B0(n1057), .B1(n933), .Y(n539) );
  OAI211XLTS U936 ( .A0(n596), .A1(n1056), .B0(n541), .C0(n540), .Y(n1136) );
  AOI2BB2XLTS U937 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .B1(
        n938), .A0N(n542), .A1N(n564), .Y(n546) );
  OAI22X1TS U938 ( .A0(n543), .A1(n934), .B0(n1056), .B1(n933), .Y(n544) );
  OAI211XLTS U939 ( .A0(n596), .A1(n1057), .B0(n546), .C0(n545), .Y(n1135) );
  AOI22X1TS U940 ( .A0(n565), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(n569), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .Y(n551) );
  AOI2BB2XLTS U941 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[36]), .B1(
        n938), .A0N(n551), .A1N(n564), .Y(n549) );
  AOI22X1TS U942 ( .A0(n565), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[44]), .B0(n569), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .Y(n550) );
  OAI22X1TS U943 ( .A0(n550), .A1(n934), .B0(n1058), .B1(n933), .Y(n547) );
  OAI211XLTS U944 ( .A0(n596), .A1(n1055), .B0(n549), .C0(n548), .Y(n1133) );
  AOI2BB2XLTS U945 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .B1(
        n938), .A0N(n550), .A1N(n564), .Y(n554) );
  OAI22X1TS U946 ( .A0(n551), .A1(n934), .B0(n1055), .B1(n933), .Y(n552) );
  OAI211XLTS U947 ( .A0(n596), .A1(n1058), .B0(n554), .C0(n553), .Y(n1134) );
  INVX2TS U948 ( .A(n413), .Y(n560) );
  NAND3X1TS U949 ( .A(FS_Module_state_reg[2]), .B(n555), .C(n557), .Y(n999) );
  OAI211X1TS U950 ( .A0(n705), .A1(n998), .B0(n999), .C0(n556), .Y(n784) );
  AOI21X1TS U951 ( .A0(n558), .A1(n557), .B0(n784), .Y(n559) );
  OAI211XLTS U952 ( .A0(n786), .A1(n560), .B0(n559), .C0(n789), .Y(
        FS_Module_state_next[0]) );
  AOI22X1TS U953 ( .A0(n565), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[47]), .B0(n569), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .Y(n935) );
  AOI22X1TS U954 ( .A0(LZA_output[3]), .A1(n1051), .B0(n1016), .B1(n1001), .Y(
        n939) );
  CLKAND2X2TS U955 ( .A(n420), .B(n1044), .Y(n635) );
  OAI22X1TS U956 ( .A0(n596), .A1(n1054), .B0(n942), .B1(n958), .Y(n561) );
  AOI21X1TS U957 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[39]), .A1(
        n562), .B0(n561), .Y(n563) );
  INVX2TS U958 ( .A(n945), .Y(n962) );
  OAI211XLTS U959 ( .A0(n935), .A1(n564), .B0(n563), .C0(n962), .Y(n1137) );
  OAI22X4TS U960 ( .A0(n838), .A1(LZA_output[3]), .B0(exp_oper_result[3]), 
        .B1(n570), .Y(n637) );
  INVX2TS U961 ( .A(n569), .Y(n571) );
  INVX3TS U962 ( .A(n567), .Y(n961) );
  OAI21X4TS U963 ( .A0(n961), .A1(n595), .B0(n936), .Y(n968) );
  AOI22X1TS U964 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[49]), .A1(
        n968), .B0(Barrel_Shifter_module_Mux_Array_Data_array[28]), .B1(n938), 
        .Y(n575) );
  INVX2TS U965 ( .A(n933), .Y(n957) );
  INVX2TS U966 ( .A(n570), .Y(n834) );
  AOI21X1TS U967 ( .A0(n625), .A1(n571), .B0(n834), .Y(n573) );
  AOI21X4TS U968 ( .A0(n573), .A1(n572), .B0(n936), .Y(n970) );
  AOI21X1TS U969 ( .A0(n957), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .B0(n970), .Y(n574)
         );
  OAI211XLTS U970 ( .A0(n619), .A1(n958), .B0(n575), .C0(n574), .Y(n1121) );
  AOI22X1TS U971 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .A1(
        n968), .B0(Barrel_Shifter_module_Mux_Array_Data_array[32]), .B1(n938), 
        .Y(n577) );
  AOI21X1TS U972 ( .A0(n957), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .B0(n970), .Y(n576)
         );
  OAI211XLTS U973 ( .A0(n603), .A1(n958), .B0(n577), .C0(n576), .Y(n1123) );
  AOI22X1TS U974 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .A1(
        n968), .B0(Barrel_Shifter_module_Mux_Array_Data_array[30]), .B1(n938), 
        .Y(n579) );
  AOI21X1TS U975 ( .A0(n957), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .B0(n970), .Y(n578)
         );
  OAI211XLTS U976 ( .A0(n615), .A1(n958), .B0(n579), .C0(n578), .Y(n1115) );
  OAI22X1TS U977 ( .A0(n1001), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(LZA_output[3]), 
        .Y(n630) );
  MXI2X2TS U978 ( .A(n1020), .B(n1049), .S0(exp_oper_result[3]), .Y(n953) );
  INVX2TS U979 ( .A(n595), .Y(n833) );
  AOI22X1TS U980 ( .A0(n834), .A1(n953), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[27]), .B1(n833), .Y(n580)
         );
  OAI21X1TS U981 ( .A0(n630), .A1(n838), .B0(n580), .Y(n581) );
  OAI32X1TS U982 ( .A0(n581), .A1(n835), .A2(n566), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[35]), .B1(n581), .Y(n792)
         );
  AOI21X1TS U983 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1(
        n968), .B0(n970), .Y(n582) );
  OAI21XLTS U984 ( .A0(n792), .A1(n958), .B0(n582), .Y(n1117) );
  AOI22X1TS U985 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[31]), .A1(
        n938), .B0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .B1(n968), 
        .Y(n584) );
  AOI21X1TS U986 ( .A0(n957), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .B0(n970), .Y(n583)
         );
  OAI211XLTS U987 ( .A0(n607), .A1(n958), .B0(n584), .C0(n583), .Y(n1119) );
  AOI22X1TS U988 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[29]), .A1(
        n938), .B0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .B1(n968), 
        .Y(n586) );
  AOI21X1TS U989 ( .A0(n957), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .B0(n970), .Y(n585)
         );
  OAI211XLTS U990 ( .A0(n611), .A1(n958), .B0(n586), .C0(n585), .Y(n1125) );
  AOI22X1TS U991 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[33]), .A1(
        n938), .B0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .B1(n968), 
        .Y(n589) );
  AOI21X1TS U992 ( .A0(n957), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .B0(n970), .Y(n588)
         );
  OAI211XLTS U993 ( .A0(n599), .A1(n958), .B0(n589), .C0(n588), .Y(n1127) );
  NAND2X1TS U994 ( .A(n833), .B(n590), .Y(n632) );
  NOR2XLTS U995 ( .A(n962), .B(n1055), .Y(n594) );
  AO22X2TS U996 ( .A0(n593), .A1(exp_oper_result[4]), .B0(LZA_output[4]), .B1(
        n592), .Y(n640) );
  INVX2TS U997 ( .A(n596), .Y(n638) );
  AOI22X1TS U998 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .A1(
        n840), .B0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .B1(n638), 
        .Y(n597) );
  OAI211XLTS U999 ( .A0(n599), .A1(n961), .B0(n598), .C0(n597), .Y(n1128) );
  NOR2XLTS U1000 ( .A(n962), .B(n1057), .Y(n600) );
  AOI22X1TS U1001 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .A1(
        n840), .B0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .B1(n638), 
        .Y(n601) );
  OAI211XLTS U1002 ( .A0(n603), .A1(n961), .B0(n602), .C0(n601), .Y(n1124) );
  NOR2XLTS U1003 ( .A(n962), .B(n1054), .Y(n604) );
  AOI22X1TS U1004 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .A1(
        n840), .B0(Barrel_Shifter_module_Mux_Array_Data_array[39]), .B1(n638), 
        .Y(n605) );
  OAI211XLTS U1005 ( .A0(n607), .A1(n961), .B0(n606), .C0(n605), .Y(n1120) );
  NOR2XLTS U1006 ( .A(n962), .B(n1056), .Y(n608) );
  AOI22X1TS U1007 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .A1(
        n840), .B0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .B1(n638), 
        .Y(n609) );
  OAI211XLTS U1008 ( .A0(n611), .A1(n961), .B0(n610), .C0(n609), .Y(n1126) );
  AOI22X1TS U1009 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .A1(
        n840), .B0(Barrel_Shifter_module_Mux_Array_Data_array[38]), .B1(n638), 
        .Y(n613) );
  OAI211XLTS U1010 ( .A0(n615), .A1(n961), .B0(n614), .C0(n613), .Y(n1116) );
  NOR2XLTS U1011 ( .A(n962), .B(n1058), .Y(n616) );
  AOI22X1TS U1012 ( .A0(n840), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .B1(n638), .Y(n617)
         );
  OAI211XLTS U1013 ( .A0(n619), .A1(n961), .B0(n618), .C0(n617), .Y(n1122) );
  NAND2X1TS U1014 ( .A(FSM_selector_C), .B(n620), .Y(n776) );
  NOR2X1TS U1015 ( .A(n776), .B(add_overflow_flag), .Y(n649) );
  INVX2TS U1016 ( .A(n649), .Y(n715) );
  NOR2X1TS U1017 ( .A(n706), .B(n705), .Y(n673) );
  INVX2TS U1018 ( .A(n673), .Y(n717) );
  NAND2X1TS U1019 ( .A(n708), .B(n1052), .Y(n622) );
  NAND2X1TS U1020 ( .A(n706), .B(n716), .Y(n621) );
  CLKAND2X2TS U1021 ( .A(n622), .B(n621), .Y(n987) );
  INVX2TS U1022 ( .A(n987), .Y(n760) );
  NAND2X1TS U1023 ( .A(n625), .B(LZA_output[2]), .Y(n826) );
  NAND2X1TS U1024 ( .A(n420), .B(exp_oper_result[2]), .Y(n623) );
  BUFX3TS U1025 ( .A(n704), .Y(n710) );
  NAND2X1TS U1026 ( .A(n625), .B(LZA_output[1]), .Y(n828) );
  NAND2X1TS U1027 ( .A(n420), .B(n433), .Y(n624) );
  CLKAND2X2TS U1028 ( .A(n828), .B(n624), .Y(n653) );
  INVX2TS U1029 ( .A(n653), .Y(n980) );
  AOI22X1TS U1030 ( .A0(n625), .A1(LZA_output[0]), .B0(FSM_selector_B[1]), 
        .B1(n1029), .Y(n830) );
  INVX2TS U1031 ( .A(n990), .Y(n775) );
  NOR2XLTS U1032 ( .A(n991), .B(n775), .Y(n629) );
  NAND3X1TS U1033 ( .A(FS_Module_state_reg[1]), .B(FS_Module_state_reg[3]), 
        .C(n627), .Y(n785) );
  AOI31XLTS U1034 ( .A0(n999), .A1(n785), .A2(n776), .B0(n1003), .Y(n628) );
  INVX2TS U1035 ( .A(n628), .Y(n992) );
  OAI32X1TS U1036 ( .A0(n760), .A1(n991), .A2(n775), .B0(n629), .B1(n992), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[25]) );
  INVX2TS U1037 ( .A(n630), .Y(n955) );
  AOI222X1TS U1038 ( .A0(n955), .A1(n636), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(FSM_selector_B[1]), .C0(n953), .C1(n635), .Y(n960) );
  AOI222X1TS U1039 ( .A0(n637), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B0(n566), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .C0(n833), .C1(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n959) );
  OAI2BB2XLTS U1040 ( .B0(n961), .B1(n959), .A0N(n638), .A1N(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .Y(n631) );
  AOI211X1TS U1041 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1(
        n945), .B0(n640), .C0(n631), .Y(n634) );
  INVX2TS U1042 ( .A(n632), .Y(n641) );
  NAND2X1TS U1043 ( .A(n641), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n633) );
  OAI211XLTS U1044 ( .A0(n960), .A1(n958), .B0(n634), .C0(n633), .Y(n1130) );
  OAI22X1TS U1045 ( .A0(n1001), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(LZA_output[3]), 
        .Y(n839) );
  INVX2TS U1046 ( .A(n839), .Y(n947) );
  MXI2X2TS U1047 ( .A(n1021), .B(n1048), .S0(exp_oper_result[3]), .Y(n946) );
  AOI222X1TS U1048 ( .A0(n947), .A1(n636), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(FSM_selector_B[1]), .C0(n946), .C1(n635), .Y(n948) );
  AOI222X1TS U1049 ( .A0(n637), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(n566), .C0(n833), 
        .C1(Barrel_Shifter_module_Mux_Array_Data_array[35]), .Y(n949) );
  OAI2BB2XLTS U1050 ( .B0(n961), .B1(n949), .A0N(n638), .A1N(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .Y(n639) );
  AOI211X1TS U1051 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[51]), .A1(
        n945), .B0(n640), .C0(n639), .Y(n643) );
  NAND2X1TS U1052 ( .A(Barrel_Shifter_module_Mux_Array_Data_array[35]), .B(
        n641), .Y(n642) );
  AOI22X1TS U1053 ( .A0(n706), .A1(Add_Subt_result[10]), .B0(DmP[13]), .B1(
        n705), .Y(n644) );
  OAI2BB1X1TS U1054 ( .A0N(Add_Subt_result[15]), .A1N(n708), .B0(n644), .Y(
        n680) );
  AOI22X1TS U1055 ( .A0(n706), .A1(Add_Subt_result[6]), .B0(DmP[17]), .B1(n705), .Y(n645) );
  OAI21X1TS U1056 ( .A0(n717), .A1(n1077), .B0(n645), .Y(n669) );
  NAND2X2TS U1057 ( .A(n980), .B(n652), .Y(n734) );
  AO22XLTS U1058 ( .A0(n706), .A1(Add_Subt_result[13]), .B0(DmP[10]), .B1(n705), .Y(n646) );
  AOI21X1TS U1059 ( .A0(Add_Subt_result[12]), .A1(n708), .B0(n646), .Y(n682)
         );
  AO22XLTS U1060 ( .A0(n706), .A1(Add_Subt_result[9]), .B0(DmP[14]), .B1(n705), 
        .Y(n647) );
  AOI21X1TS U1061 ( .A0(Add_Subt_result[16]), .A1(n708), .B0(n647), .Y(n660)
         );
  NAND2X2TS U1062 ( .A(n652), .B(n653), .Y(n767) );
  AOI21X1TS U1063 ( .A0(n708), .A1(Add_Subt_result[13]), .B0(n650), .Y(n684)
         );
  AO22XLTS U1064 ( .A0(n706), .A1(Add_Subt_result[8]), .B0(DmP[15]), .B1(n705), 
        .Y(n651) );
  AOI21X1TS U1065 ( .A0(n708), .A1(Add_Subt_result[17]), .B0(n651), .Y(n663)
         );
  AOI22X1TS U1066 ( .A0(n990), .A1(n750), .B0(n648), .B1(n749), .Y(n658) );
  NOR2XLTS U1067 ( .A(n653), .B(n652), .Y(n654) );
  AO22XLTS U1068 ( .A0(n706), .A1(Add_Subt_result[11]), .B0(DmP[12]), .B1(n705), .Y(n655) );
  AOI21X1TS U1069 ( .A0(Add_Subt_result[14]), .A1(n708), .B0(n655), .Y(n686)
         );
  AO22XLTS U1070 ( .A0(n706), .A1(Add_Subt_result[7]), .B0(DmP[16]), .B1(n1045), .Y(n656) );
  AOI21X1TS U1071 ( .A0(Add_Subt_result[18]), .A1(n708), .B0(n656), .Y(n671)
         );
  NAND2X1TS U1072 ( .A(n986), .B(n751), .Y(n657) );
  OAI211XLTS U1073 ( .A0(n742), .A1(n734), .B0(n658), .C0(n657), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[12]) );
  AO22XLTS U1074 ( .A0(n706), .A1(Add_Subt_result[5]), .B0(DmP[18]), .B1(n1045), .Y(n659) );
  AOI21X1TS U1075 ( .A0(Add_Subt_result[20]), .A1(n708), .B0(n659), .Y(n674)
         );
  AOI22X1TS U1076 ( .A0(n990), .A1(n751), .B0(n986), .B1(n739), .Y(n665) );
  AO22XLTS U1077 ( .A0(n706), .A1(Add_Subt_result[4]), .B0(DmP[19]), .B1(n705), 
        .Y(n662) );
  AOI21X1TS U1078 ( .A0(n708), .A1(Add_Subt_result[21]), .B0(n662), .Y(n761)
         );
  NAND2X1TS U1079 ( .A(n661), .B(n738), .Y(n664) );
  OAI211XLTS U1080 ( .A0(n742), .A1(n767), .B0(n665), .C0(n664), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[14]) );
  INVX2TS U1081 ( .A(n986), .Y(n737) );
  AOI22X1TS U1082 ( .A0(n990), .A1(n749), .B0(n648), .B1(n751), .Y(n667) );
  NAND2X1TS U1083 ( .A(n661), .B(n739), .Y(n666) );
  OAI211XLTS U1084 ( .A0(n742), .A1(n737), .B0(n667), .C0(n666), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[13]) );
  AOI22X1TS U1085 ( .A0(n706), .A1(Add_Subt_result[2]), .B0(DmP[21]), .B1(n705), .Y(n668) );
  AOI22X1TS U1086 ( .A0(n706), .A1(Add_Subt_result[3]), .B0(DmP[20]), .B1(n705), .Y(n670) );
  AOI2BB2X2TS U1087 ( .B0(n704), .B1(n671), .A0N(n989), .A1N(n710), .Y(n764)
         );
  AOI22X1TS U1088 ( .A0(n990), .A1(n738), .B0(n648), .B1(n764), .Y(n676) );
  AOI22X1TS U1089 ( .A0(n706), .A1(Add_Subt_result[1]), .B0(DmP[22]), .B1(n705), .Y(n672) );
  AOI2BB2X2TS U1090 ( .B0(n704), .B1(n674), .A0N(n985), .A1N(n704), .Y(n771)
         );
  NAND2X1TS U1091 ( .A(n661), .B(n771), .Y(n675) );
  OAI211XLTS U1092 ( .A0(n434), .A1(n737), .B0(n676), .C0(n675), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[17]) );
  AOI22X1TS U1093 ( .A0(n990), .A1(n739), .B0(n648), .B1(n738), .Y(n678) );
  NAND2X1TS U1094 ( .A(n986), .B(n764), .Y(n677) );
  AOI22X1TS U1095 ( .A0(n706), .A1(Add_Subt_result[14]), .B0(DmP[9]), .B1(n705), .Y(n679) );
  OAI2BB1X1TS U1096 ( .A0N(Add_Subt_result[11]), .A1N(n708), .B0(n679), .Y(
        n690) );
  AO22XLTS U1097 ( .A0(n706), .A1(Add_Subt_result[17]), .B0(DmP[6]), .B1(n705), 
        .Y(n681) );
  AOI21X1TS U1098 ( .A0(Add_Subt_result[8]), .A1(n708), .B0(n681), .Y(n703) );
  AO22XLTS U1099 ( .A0(n706), .A1(Add_Subt_result[16]), .B0(DmP[7]), .B1(n705), 
        .Y(n683) );
  AOI21X1TS U1100 ( .A0(n708), .A1(Add_Subt_result[9]), .B0(n683), .Y(n726) );
  AOI22X1TS U1101 ( .A0(n990), .A1(n744), .B0(n648), .B1(n743), .Y(n688) );
  AO22XLTS U1102 ( .A0(n706), .A1(Add_Subt_result[15]), .B0(DmP[8]), .B1(n705), 
        .Y(n685) );
  AOI21X1TS U1103 ( .A0(Add_Subt_result[10]), .A1(n708), .B0(n685), .Y(n692)
         );
  NAND2X1TS U1104 ( .A(n986), .B(n745), .Y(n687) );
  OAI211XLTS U1105 ( .A0(n754), .A1(n734), .B0(n688), .C0(n687), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[8]) );
  AOI22X1TS U1106 ( .A0(n706), .A1(Add_Subt_result[18]), .B0(DmP[5]), .B1(n705), .Y(n689) );
  OAI2BB1X1TS U1107 ( .A0N(Add_Subt_result[7]), .A1N(n708), .B0(n689), .Y(n696) );
  AO22XLTS U1108 ( .A0(n706), .A1(Add_Subt_result[19]), .B0(DmP[4]), .B1(n705), 
        .Y(n691) );
  AOI21X1TS U1109 ( .A0(Add_Subt_result[6]), .A1(n708), .B0(n691), .Y(n698) );
  AOI22X1TS U1110 ( .A0(n990), .A1(n756), .B0(n986), .B1(n744), .Y(n694) );
  NAND2X1TS U1111 ( .A(n661), .B(n743), .Y(n693) );
  OAI211XLTS U1112 ( .A0(n748), .A1(n767), .B0(n694), .C0(n693), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[6]) );
  AOI22X1TS U1113 ( .A0(n706), .A1(Add_Subt_result[22]), .B0(DmP[1]), .B1(n705), .Y(n695) );
  OAI2BB1X1TS U1114 ( .A0N(Add_Subt_result[3]), .A1N(n708), .B0(n695), .Y(n697) );
  AOI22X1TS U1115 ( .A0(n706), .A1(Add_Subt_result[23]), .B0(DmP[0]), .B1(n705), .Y(n700) );
  NAND2X1TS U1116 ( .A(n708), .B(Add_Subt_result[2]), .Y(n699) );
  NAND2X1TS U1117 ( .A(n706), .B(Add_Subt_result[21]), .Y(n701) );
  OAI2BB1X1TS U1118 ( .A0N(DmP[2]), .A1N(n705), .B0(n701), .Y(n702) );
  AOI21X1TS U1119 ( .A0(n708), .A1(Add_Subt_result[4]), .B0(n702), .Y(n714) );
  AOI22X1TS U1120 ( .A0(n648), .A1(n724), .B0(n661), .B1(n436), .Y(n712) );
  AOI22X1TS U1121 ( .A0(n708), .A1(Add_Subt_result[1]), .B0(n706), .B1(
        Add_Subt_result[24]), .Y(n709) );
  AO22XLTS U1122 ( .A0(n706), .A1(Add_Subt_result[20]), .B0(DmP[3]), .B1(n705), 
        .Y(n707) );
  AOI21X1TS U1123 ( .A0(Add_Subt_result[5]), .A1(n708), .B0(n707), .Y(n727) );
  AOI22X1TS U1124 ( .A0(n710), .A1(n709), .B0(n727), .B1(n991), .Y(n713) );
  NAND2X1TS U1125 ( .A(n990), .B(n713), .Y(n711) );
  OAI211XLTS U1126 ( .A0(n759), .A1(n737), .B0(n712), .C0(n711), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[1]) );
  AOI22X1TS U1127 ( .A0(n648), .A1(n713), .B0(n986), .B1(n724), .Y(n721) );
  INVX2TS U1128 ( .A(n714), .Y(n719) );
  OAI22X1TS U1129 ( .A0(n717), .A1(n716), .B0(n1052), .B1(n715), .Y(n718) );
  OAI221XLTS U1130 ( .A0(n704), .A1(n719), .B0(n725), .B1(n718), .C0(n990), 
        .Y(n720) );
  OAI211XLTS U1131 ( .A0(n759), .A1(n734), .B0(n721), .C0(n720), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[0]) );
  AOI22X1TS U1132 ( .A0(n990), .A1(n743), .B0(n648), .B1(n745), .Y(n723) );
  NAND2X1TS U1133 ( .A(n661), .B(n750), .Y(n722) );
  OAI211XLTS U1134 ( .A0(n754), .A1(n737), .B0(n723), .C0(n722), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[9]) );
  AOI22X1TS U1135 ( .A0(n990), .A1(n724), .B0(n986), .B1(n436), .Y(n729) );
  NAND2X1TS U1136 ( .A(n661), .B(n755), .Y(n728) );
  AOI22X1TS U1137 ( .A0(n990), .A1(n745), .B0(n986), .B1(n750), .Y(n731) );
  NAND2X1TS U1138 ( .A(n661), .B(n749), .Y(n730) );
  OAI211XLTS U1139 ( .A0(n754), .A1(n767), .B0(n731), .C0(n730), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[10]) );
  AOI22X1TS U1140 ( .A0(n990), .A1(n436), .B0(n648), .B1(n755), .Y(n733) );
  NAND2X1TS U1141 ( .A(n986), .B(n756), .Y(n732) );
  OAI211XLTS U1142 ( .A0(n748), .A1(n734), .B0(n733), .C0(n732), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[4]) );
  AOI22X1TS U1143 ( .A0(n990), .A1(n755), .B0(n648), .B1(n756), .Y(n736) );
  NAND2X1TS U1144 ( .A(n661), .B(n744), .Y(n735) );
  OAI211XLTS U1145 ( .A0(n748), .A1(n737), .B0(n736), .C0(n735), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[5]) );
  AOI22X1TS U1146 ( .A0(n648), .A1(n739), .B0(n986), .B1(n738), .Y(n741) );
  NAND2X1TS U1147 ( .A(n661), .B(n764), .Y(n740) );
  OAI211XLTS U1148 ( .A0(n775), .A1(n742), .B0(n741), .C0(n740), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[15]) );
  AOI22X1TS U1149 ( .A0(n648), .A1(n744), .B0(n986), .B1(n743), .Y(n747) );
  NAND2X1TS U1150 ( .A(n661), .B(n745), .Y(n746) );
  OAI211XLTS U1151 ( .A0(n775), .A1(n748), .B0(n747), .C0(n746), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[7]) );
  AOI22X1TS U1152 ( .A0(n648), .A1(n750), .B0(n986), .B1(n749), .Y(n753) );
  NAND2X1TS U1153 ( .A(n661), .B(n751), .Y(n752) );
  OAI211XLTS U1154 ( .A0(n775), .A1(n754), .B0(n753), .C0(n752), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[11]) );
  AOI22X1TS U1155 ( .A0(n648), .A1(n436), .B0(n986), .B1(n755), .Y(n758) );
  NAND2X1TS U1156 ( .A(n661), .B(n756), .Y(n757) );
  OAI211XLTS U1157 ( .A0(n775), .A1(n759), .B0(n758), .C0(n757), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[3]) );
  AOI22X1TS U1158 ( .A0(n990), .A1(n435), .B0(n772), .B1(n775), .Y(n762) );
  OAI21XLTS U1159 ( .A0(n763), .A1(n991), .B0(n762), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[21]) );
  AOI22X1TS U1160 ( .A0(n990), .A1(n764), .B0(n986), .B1(n771), .Y(n766) );
  NAND2X1TS U1161 ( .A(n661), .B(n435), .Y(n765) );
  OAI211XLTS U1162 ( .A0(n434), .A1(n767), .B0(n766), .C0(n765), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[18]) );
  AOI22X1TS U1163 ( .A0(n986), .A1(n989), .B0(n661), .B1(n988), .Y(n770) );
  AOI22X1TS U1164 ( .A0(n990), .A1(n771), .B0(n648), .B1(n435), .Y(n769) );
  NAND2X1TS U1165 ( .A(n772), .B(n980), .Y(n768) );
  OAI211XLTS U1166 ( .A0(n770), .A1(n991), .B0(n769), .C0(n768), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[20]) );
  AOI22X1TS U1167 ( .A0(n648), .A1(n771), .B0(n986), .B1(n435), .Y(n774) );
  OAI211XLTS U1168 ( .A0(n775), .A1(n434), .B0(n774), .C0(n773), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[19]) );
  OAI21X1TS U1169 ( .A0(FS_Module_state_reg[0]), .A1(n776), .B0(n785), .Y(n783) );
  INVX2TS U1170 ( .A(n783), .Y(n778) );
  OR4X2TS U1171 ( .A(Exp_Operation_Module_Data_S[2]), .B(
        Exp_Operation_Module_Data_S[1]), .C(Exp_Operation_Module_Data_S[0]), 
        .D(n778), .Y(n779) );
  OR4X2TS U1172 ( .A(Exp_Operation_Module_Data_S[5]), .B(
        Exp_Operation_Module_Data_S[4]), .C(Exp_Operation_Module_Data_S[3]), 
        .D(n779), .Y(n780) );
  OR4X2TS U1173 ( .A(n781), .B(Exp_Operation_Module_Data_S[7]), .C(
        Exp_Operation_Module_Data_S[6]), .D(n780), .Y(n782) );
  OAI21XLTS U1174 ( .A0(n1093), .A1(n783), .B0(n782), .Y(n401) );
  MX2X1TS U1175 ( .A(DMP[24]), .B(n433), .S0(n853), .Y(S_Oper_A_exp[1]) );
  NOR4BX1TS U1176 ( .AN(n785), .B(FSM_Add_Subt_Sgf_load), .C(
        FSM_Final_Result_load), .D(n784), .Y(n788) );
  NAND2X1TS U1177 ( .A(n786), .B(n413), .Y(n787) );
  OR2X1TS U1178 ( .A(n791), .B(n853), .Y(n406) );
  OAI2BB2XLTS U1179 ( .B0(n967), .B1(n792), .A0N(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1N(n840), .Y(n1118)
         );
  NOR2BX1TS U1180 ( .AN(Sgf_normalized_result[25]), .B(n853), .Y(n793) );
  XOR2X1TS U1181 ( .A(n1097), .B(n793), .Y(DP_OP_45J178_125_5354_n31) );
  NOR2BX1TS U1182 ( .AN(Sgf_normalized_result[24]), .B(n853), .Y(n794) );
  XOR2X1TS U1183 ( .A(n1097), .B(n794), .Y(DP_OP_45J178_125_5354_n32) );
  NOR2BX1TS U1184 ( .AN(Sgf_normalized_result[23]), .B(n832), .Y(n795) );
  XOR2X1TS U1185 ( .A(n1097), .B(n795), .Y(DP_OP_45J178_125_5354_n33) );
  NOR2BX1TS U1186 ( .AN(Sgf_normalized_result[22]), .B(n853), .Y(n796) );
  XOR2X1TS U1187 ( .A(n1097), .B(n796), .Y(DP_OP_45J178_125_5354_n34) );
  NOR2BX1TS U1188 ( .AN(Sgf_normalized_result[21]), .B(n853), .Y(n797) );
  XOR2X1TS U1189 ( .A(n1097), .B(n797), .Y(DP_OP_45J178_125_5354_n35) );
  NOR2BX1TS U1190 ( .AN(Sgf_normalized_result[20]), .B(n832), .Y(n798) );
  XOR2X1TS U1191 ( .A(n1097), .B(n798), .Y(DP_OP_45J178_125_5354_n36) );
  NOR2BX1TS U1192 ( .AN(Sgf_normalized_result[19]), .B(n853), .Y(n799) );
  XOR2X1TS U1193 ( .A(n1097), .B(n799), .Y(DP_OP_45J178_125_5354_n37) );
  NOR2BX1TS U1194 ( .AN(Sgf_normalized_result[18]), .B(n853), .Y(n800) );
  XOR2X1TS U1195 ( .A(n1097), .B(n800), .Y(DP_OP_45J178_125_5354_n38) );
  NOR2BX1TS U1196 ( .AN(Sgf_normalized_result[17]), .B(n853), .Y(n801) );
  XOR2X1TS U1197 ( .A(n1097), .B(n801), .Y(DP_OP_45J178_125_5354_n39) );
  NOR2BX1TS U1198 ( .AN(Sgf_normalized_result[16]), .B(n853), .Y(n802) );
  XOR2X1TS U1199 ( .A(n1097), .B(n802), .Y(DP_OP_45J178_125_5354_n40) );
  NOR2BX1TS U1200 ( .AN(Sgf_normalized_result[15]), .B(n853), .Y(n803) );
  XOR2X1TS U1201 ( .A(n1097), .B(n803), .Y(DP_OP_45J178_125_5354_n41) );
  NOR2BX1TS U1202 ( .AN(Sgf_normalized_result[14]), .B(n832), .Y(n804) );
  XOR2X1TS U1203 ( .A(n1097), .B(n804), .Y(DP_OP_45J178_125_5354_n42) );
  NOR2BX1TS U1204 ( .AN(Sgf_normalized_result[13]), .B(n832), .Y(n805) );
  XOR2X1TS U1205 ( .A(n1097), .B(n805), .Y(DP_OP_45J178_125_5354_n43) );
  NOR2BX1TS U1206 ( .AN(Sgf_normalized_result[12]), .B(n832), .Y(n806) );
  XOR2X1TS U1207 ( .A(n1097), .B(n806), .Y(DP_OP_45J178_125_5354_n44) );
  NOR2BX1TS U1208 ( .AN(Sgf_normalized_result[11]), .B(n853), .Y(n807) );
  XOR2X1TS U1209 ( .A(n1097), .B(n807), .Y(DP_OP_45J178_125_5354_n45) );
  NOR2BX1TS U1210 ( .AN(Sgf_normalized_result[10]), .B(n832), .Y(n808) );
  XOR2X1TS U1211 ( .A(n1097), .B(n808), .Y(DP_OP_45J178_125_5354_n46) );
  NOR2BX1TS U1212 ( .AN(Sgf_normalized_result[9]), .B(n832), .Y(n809) );
  XOR2X1TS U1213 ( .A(n1097), .B(n809), .Y(DP_OP_45J178_125_5354_n47) );
  NOR2BX1TS U1214 ( .AN(Sgf_normalized_result[8]), .B(n832), .Y(n810) );
  XOR2X1TS U1215 ( .A(n814), .B(n810), .Y(DP_OP_45J178_125_5354_n48) );
  NOR2BX1TS U1216 ( .AN(Sgf_normalized_result[7]), .B(n832), .Y(n811) );
  XOR2X1TS U1217 ( .A(n814), .B(n811), .Y(DP_OP_45J178_125_5354_n49) );
  NOR2BX1TS U1218 ( .AN(Sgf_normalized_result[6]), .B(n832), .Y(n812) );
  XOR2X1TS U1219 ( .A(n814), .B(n812), .Y(DP_OP_45J178_125_5354_n50) );
  NOR2BX1TS U1220 ( .AN(Sgf_normalized_result[5]), .B(n832), .Y(n813) );
  XOR2X1TS U1221 ( .A(n814), .B(n813), .Y(DP_OP_45J178_125_5354_n51) );
  NOR2BX1TS U1222 ( .AN(Sgf_normalized_result[4]), .B(n832), .Y(n815) );
  XOR2X1TS U1223 ( .A(n1097), .B(n815), .Y(DP_OP_45J178_125_5354_n52) );
  NOR2BX1TS U1224 ( .AN(Sgf_normalized_result[3]), .B(n832), .Y(n816) );
  XOR2X1TS U1225 ( .A(n1097), .B(n816), .Y(DP_OP_45J178_125_5354_n53) );
  OR2X1TS U1226 ( .A(n832), .B(Sgf_normalized_result[2]), .Y(n817) );
  XOR2X1TS U1227 ( .A(n1097), .B(n817), .Y(DP_OP_45J178_125_5354_n54) );
  NOR2BX1TS U1228 ( .AN(Sgf_normalized_result[1]), .B(n832), .Y(n818) );
  XOR2X1TS U1229 ( .A(n1097), .B(n818), .Y(DP_OP_45J178_125_5354_n55) );
  NOR2BX1TS U1230 ( .AN(Sgf_normalized_result[0]), .B(n832), .Y(n819) );
  XOR2X1TS U1231 ( .A(n1097), .B(n819), .Y(DP_OP_45J178_125_5354_n56) );
  CLKAND2X2TS U1232 ( .A(n420), .B(DmP[30]), .Y(n820) );
  XOR2X1TS U1233 ( .A(n1096), .B(n820), .Y(DP_OP_42J178_122_8048_n13) );
  CLKAND2X2TS U1234 ( .A(n420), .B(DmP[29]), .Y(n821) );
  XOR2X1TS U1235 ( .A(n1096), .B(n821), .Y(DP_OP_42J178_122_8048_n14) );
  CLKAND2X2TS U1236 ( .A(n420), .B(DmP[28]), .Y(n822) );
  XOR2X1TS U1237 ( .A(n1096), .B(n822), .Y(DP_OP_42J178_122_8048_n15) );
  OAI2BB1X1TS U1238 ( .A0N(n420), .A1N(DmP[27]), .B0(n838), .Y(n823) );
  XOR2X1TS U1239 ( .A(n1096), .B(n823), .Y(DP_OP_42J178_122_8048_n16) );
  OAI2BB2XLTS U1240 ( .B0(n824), .B1(n1001), .A0N(n420), .A1N(DmP[26]), .Y(
        n825) );
  XOR2X1TS U1241 ( .A(n1096), .B(n825), .Y(DP_OP_42J178_122_8048_n17) );
  OAI2BB1X1TS U1242 ( .A0N(n420), .A1N(DmP[25]), .B0(n826), .Y(n827) );
  XOR2X1TS U1243 ( .A(n1096), .B(n827), .Y(DP_OP_42J178_122_8048_n18) );
  OAI2BB1X1TS U1244 ( .A0N(n420), .A1N(DmP[24]), .B0(n828), .Y(n829) );
  XOR2X1TS U1245 ( .A(n1096), .B(n829), .Y(DP_OP_42J178_122_8048_n19) );
  OAI2BB1X1TS U1246 ( .A0N(DmP[23]), .A1N(n1029), .B0(n830), .Y(n831) );
  XOR2X1TS U1247 ( .A(n1096), .B(n831), .Y(DP_OP_42J178_122_8048_n20) );
  NAND2BXLTS U1248 ( .AN(Sgf_normalized_result[25]), .B(n832), .Y(
        S_A_S_Oper_A[25]) );
  MX2X1TS U1249 ( .A(DMP[22]), .B(Sgf_normalized_result[24]), .S0(n853), .Y(
        S_A_S_Oper_A[24]) );
  MX2X1TS U1250 ( .A(DMP[21]), .B(Sgf_normalized_result[23]), .S0(n853), .Y(
        S_A_S_Oper_A[23]) );
  MX2X1TS U1251 ( .A(DMP[20]), .B(Sgf_normalized_result[22]), .S0(n853), .Y(
        S_A_S_Oper_A[22]) );
  MX2X1TS U1252 ( .A(DMP[19]), .B(Sgf_normalized_result[21]), .S0(n854), .Y(
        S_A_S_Oper_A[21]) );
  MX2X1TS U1253 ( .A(DMP[18]), .B(Sgf_normalized_result[20]), .S0(n854), .Y(
        S_A_S_Oper_A[20]) );
  MX2X1TS U1254 ( .A(DMP[17]), .B(Sgf_normalized_result[19]), .S0(n854), .Y(
        S_A_S_Oper_A[19]) );
  MX2X1TS U1255 ( .A(DMP[16]), .B(Sgf_normalized_result[18]), .S0(n854), .Y(
        S_A_S_Oper_A[18]) );
  MX2X1TS U1256 ( .A(DMP[15]), .B(Sgf_normalized_result[17]), .S0(n854), .Y(
        S_A_S_Oper_A[17]) );
  MX2X1TS U1257 ( .A(DMP[14]), .B(Sgf_normalized_result[16]), .S0(n854), .Y(
        S_A_S_Oper_A[16]) );
  MX2X1TS U1258 ( .A(DMP[13]), .B(Sgf_normalized_result[15]), .S0(n854), .Y(
        S_A_S_Oper_A[15]) );
  MX2X1TS U1259 ( .A(DMP[12]), .B(Sgf_normalized_result[14]), .S0(n854), .Y(
        S_A_S_Oper_A[14]) );
  MX2X1TS U1260 ( .A(DMP[11]), .B(Sgf_normalized_result[13]), .S0(n854), .Y(
        S_A_S_Oper_A[13]) );
  MX2X1TS U1261 ( .A(DMP[10]), .B(Sgf_normalized_result[12]), .S0(n854), .Y(
        S_A_S_Oper_A[12]) );
  MX2X1TS U1262 ( .A(DMP[9]), .B(Sgf_normalized_result[11]), .S0(n854), .Y(
        S_A_S_Oper_A[11]) );
  MX2X1TS U1263 ( .A(DMP[8]), .B(Sgf_normalized_result[10]), .S0(n854), .Y(
        S_A_S_Oper_A[10]) );
  MX2X1TS U1264 ( .A(DMP[7]), .B(Sgf_normalized_result[9]), .S0(n854), .Y(
        S_A_S_Oper_A[9]) );
  MX2X1TS U1265 ( .A(DMP[6]), .B(Sgf_normalized_result[8]), .S0(n854), .Y(
        S_A_S_Oper_A[8]) );
  MX2X1TS U1266 ( .A(DMP[5]), .B(Sgf_normalized_result[7]), .S0(n854), .Y(
        S_A_S_Oper_A[7]) );
  MX2X1TS U1267 ( .A(DMP[4]), .B(Sgf_normalized_result[6]), .S0(n854), .Y(
        S_A_S_Oper_A[6]) );
  MX2X1TS U1268 ( .A(DMP[3]), .B(Sgf_normalized_result[5]), .S0(n854), .Y(
        S_A_S_Oper_A[5]) );
  MX2X1TS U1269 ( .A(DMP[2]), .B(Sgf_normalized_result[4]), .S0(n854), .Y(
        S_A_S_Oper_A[4]) );
  MX2X1TS U1270 ( .A(DMP[1]), .B(Sgf_normalized_result[3]), .S0(n854), .Y(
        S_A_S_Oper_A[3]) );
  MX2X1TS U1271 ( .A(DMP[0]), .B(Sgf_normalized_result[2]), .S0(n854), .Y(
        S_A_S_Oper_A[2]) );
  CLKAND2X2TS U1272 ( .A(n853), .B(Sgf_normalized_result[1]), .Y(
        S_A_S_Oper_A[1]) );
  AOI22X1TS U1273 ( .A0(n834), .A1(n946), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[26]), .B1(n833), .Y(n837)
         );
  OAI21XLTS U1274 ( .A0(n835), .A1(n566), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n836) );
  OAI211X1TS U1275 ( .A0(n839), .A1(n838), .B0(n837), .C0(n836), .Y(n966) );
  AO22XLTS U1276 ( .A0(n966), .A1(n958), .B0(n840), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .Y(n1139) );
  CLKAND2X2TS U1277 ( .A(n853), .B(Sgf_normalized_result[0]), .Y(
        S_A_S_Oper_A[0]) );
  AOI21X1TS U1278 ( .A0(n842), .A1(n1060), .B0(n841), .Y(n843) );
  AOI31XLTS U1279 ( .A0(n845), .A1(n844), .A2(n1059), .B0(n843), .Y(n846) );
  NAND3XLTS U1280 ( .A(n848), .B(n847), .C(n846), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[3]) );
  AOI22X1TS U1281 ( .A0(n1029), .A1(n852), .B0(add_overflow_flag), .B1(n850), 
        .Y(n405) );
  NOR3BX1TS U1282 ( .AN(n850), .B(FS_Module_state_reg[1]), .C(
        add_overflow_flag), .Y(n851) );
  AOI21X1TS U1283 ( .A0(n852), .A1(n440), .B0(n851), .Y(n404) );
  MX2X1TS U1284 ( .A(DMP[30]), .B(exp_oper_result[7]), .S0(n853), .Y(
        S_Oper_A_exp[7]) );
  MX2X1TS U1285 ( .A(DMP[29]), .B(exp_oper_result[6]), .S0(n853), .Y(
        S_Oper_A_exp[6]) );
  MX2X1TS U1286 ( .A(DMP[28]), .B(exp_oper_result[5]), .S0(n853), .Y(
        S_Oper_A_exp[5]) );
  MX2X1TS U1287 ( .A(DMP[27]), .B(exp_oper_result[4]), .S0(n853), .Y(
        S_Oper_A_exp[4]) );
  MX2X1TS U1288 ( .A(DMP[26]), .B(exp_oper_result[3]), .S0(n853), .Y(
        S_Oper_A_exp[3]) );
  MX2X1TS U1289 ( .A(DMP[25]), .B(exp_oper_result[2]), .S0(n854), .Y(
        S_Oper_A_exp[2]) );
  MX2X1TS U1290 ( .A(DMP[23]), .B(exp_oper_result[0]), .S0(n854), .Y(
        S_Oper_A_exp[0]) );
  OAI31X1TS U1291 ( .A0(n1077), .A1(Add_Subt_result[21]), .A2(
        Add_Subt_result[20]), .B0(n855), .Y(n858) );
  OAI211XLTS U1292 ( .A0(Add_Subt_result[15]), .A1(Add_Subt_result[14]), .B0(
        n1017), .C0(n1076), .Y(n856) );
  AOI2BB2XLTS U1293 ( .B0(n859), .B1(n858), .A0N(n857), .A1N(n856), .Y(n862)
         );
  NAND4XLTS U1294 ( .A(n860), .B(Add_Subt_result[11]), .C(n1061), .D(n1022), 
        .Y(n861) );
  NAND4BXLTS U1295 ( .AN(n864), .B(n863), .C(n862), .D(n861), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[1]) );
  NAND2BXLTS U1296 ( .AN(exp_oper_result[7]), .B(n997), .Y(
        final_result_ieee_Module_Exp_S_mux[7]) );
  NAND2BXLTS U1297 ( .AN(exp_oper_result[6]), .B(n997), .Y(
        final_result_ieee_Module_Exp_S_mux[6]) );
  NAND2BXLTS U1298 ( .AN(exp_oper_result[5]), .B(n997), .Y(
        final_result_ieee_Module_Exp_S_mux[5]) );
  NAND2X1TS U1299 ( .A(n997), .B(n1044), .Y(
        final_result_ieee_Module_Exp_S_mux[4]) );
  NAND2X1TS U1300 ( .A(n997), .B(n1031), .Y(
        final_result_ieee_Module_Exp_S_mux[3]) );
  NAND2BXLTS U1301 ( .AN(exp_oper_result[2]), .B(n997), .Y(
        final_result_ieee_Module_Exp_S_mux[2]) );
  NAND2BXLTS U1302 ( .AN(n433), .B(n997), .Y(
        final_result_ieee_Module_Exp_S_mux[1]) );
  NAND2BXLTS U1303 ( .AN(exp_oper_result[0]), .B(n997), .Y(
        final_result_ieee_Module_Exp_S_mux[0]) );
  XNOR2X1TS U1304 ( .A(add_subt), .B(Data_Y[31]), .Y(n1095) );
  NOR2X1TS U1305 ( .A(n1086), .B(intDX[25]), .Y(n924) );
  NOR2XLTS U1306 ( .A(n924), .B(intDY[24]), .Y(n865) );
  AOI22X1TS U1307 ( .A0(intDX[25]), .A1(n1086), .B0(intDX[24]), .B1(n865), .Y(
        n869) );
  OAI21X1TS U1308 ( .A0(intDX[26]), .A1(n1089), .B0(n866), .Y(n925) );
  NAND2BXLTS U1309 ( .AN(intDY[27]), .B(intDX[27]), .Y(n867) );
  NOR2X1TS U1310 ( .A(n1018), .B(intDX[30]), .Y(n872) );
  NOR2X1TS U1311 ( .A(n1083), .B(intDX[29]), .Y(n870) );
  AOI211X1TS U1312 ( .A0(intDY[28]), .A1(n1098), .B0(n872), .C0(n870), .Y(n923) );
  AOI2BB2X1TS U1313 ( .B0(n874), .B1(n923), .A0N(n873), .A1N(n872), .Y(n929)
         );
  NOR2X1TS U1314 ( .A(n1085), .B(intDX[17]), .Y(n910) );
  NAND2BXLTS U1315 ( .AN(intDX[9]), .B(intDY[9]), .Y(n891) );
  OAI211XLTS U1316 ( .A0(intDX[8]), .A1(n1084), .B0(n891), .C0(n894), .Y(n905)
         );
  OAI2BB1X1TS U1317 ( .A0N(n1046), .A1N(intDY[5]), .B0(intDX[4]), .Y(n875) );
  OAI22X1TS U1318 ( .A0(intDY[4]), .A1(n875), .B0(n1046), .B1(intDY[5]), .Y(
        n886) );
  OAI2BB1X1TS U1319 ( .A0N(n1099), .A1N(intDY[7]), .B0(intDX[6]), .Y(n876) );
  OAI22X1TS U1320 ( .A0(intDY[6]), .A1(n876), .B0(n1099), .B1(intDY[7]), .Y(
        n885) );
  OAI21XLTS U1321 ( .A0(intDX[1]), .A1(n1087), .B0(intDX[0]), .Y(n877) );
  OAI2BB2XLTS U1322 ( .B0(intDY[0]), .B1(n877), .A0N(intDX[1]), .A1N(n1087), 
        .Y(n879) );
  NAND2BXLTS U1323 ( .AN(intDX[2]), .B(intDY[2]), .Y(n878) );
  OAI211XLTS U1324 ( .A0(n1088), .A1(intDX[3]), .B0(n879), .C0(n878), .Y(n882)
         );
  OAI21XLTS U1325 ( .A0(intDX[3]), .A1(n1088), .B0(intDX[2]), .Y(n880) );
  AOI2BB2XLTS U1326 ( .B0(intDX[3]), .B1(n1088), .A0N(intDY[2]), .A1N(n880), 
        .Y(n881) );
  AOI222X1TS U1327 ( .A0(intDY[4]), .A1(n1014), .B0(n882), .B1(n881), .C0(
        intDY[5]), .C1(n1046), .Y(n884) );
  OAI32X1TS U1328 ( .A0(n886), .A1(n885), .A2(n884), .B0(n883), .B1(n885), .Y(
        n904) );
  OA22X1TS U1329 ( .A0(n1025), .A1(intDX[14]), .B0(n1090), .B1(intDX[15]), .Y(
        n901) );
  NAND2BXLTS U1330 ( .AN(intDX[13]), .B(intDY[13]), .Y(n887) );
  OAI21XLTS U1331 ( .A0(intDX[13]), .A1(n1068), .B0(intDX[12]), .Y(n888) );
  OAI2BB2XLTS U1332 ( .B0(intDY[12]), .B1(n888), .A0N(intDX[13]), .A1N(n1068), 
        .Y(n900) );
  NOR2XLTS U1333 ( .A(n889), .B(intDY[10]), .Y(n890) );
  AOI22X1TS U1334 ( .A0(intDX[11]), .A1(n1081), .B0(intDX[10]), .B1(n890), .Y(
        n896) );
  NAND2BXLTS U1335 ( .AN(intDY[9]), .B(intDX[9]), .Y(n893) );
  NAND3XLTS U1336 ( .A(n1084), .B(n891), .C(intDX[8]), .Y(n892) );
  AOI21X1TS U1337 ( .A0(n893), .A1(n892), .B0(n903), .Y(n895) );
  OAI2BB2XLTS U1338 ( .B0(intDY[14]), .B1(n897), .A0N(intDX[15]), .A1N(n1090), 
        .Y(n898) );
  AOI211X1TS U1339 ( .A0(n901), .A1(n900), .B0(n899), .C0(n898), .Y(n902) );
  OAI31X1TS U1340 ( .A0(n905), .A1(n904), .A2(n903), .B0(n902), .Y(n908) );
  OA22X1TS U1341 ( .A0(n1026), .A1(intDX[22]), .B0(n1091), .B1(intDX[23]), .Y(
        n921) );
  NAND2BXLTS U1342 ( .AN(intDX[21]), .B(intDY[21]), .Y(n906) );
  NAND2BXLTS U1343 ( .AN(intDX[19]), .B(intDY[19]), .Y(n912) );
  OAI21X1TS U1344 ( .A0(intDX[18]), .A1(n1082), .B0(n912), .Y(n916) );
  NAND3BXLTS U1345 ( .AN(n910), .B(n908), .C(n907), .Y(n928) );
  OAI21XLTS U1346 ( .A0(intDX[21]), .A1(n1069), .B0(intDX[20]), .Y(n909) );
  OAI2BB2XLTS U1347 ( .B0(intDY[20]), .B1(n909), .A0N(intDX[21]), .A1N(n1069), 
        .Y(n920) );
  AOI22X1TS U1348 ( .A0(intDX[17]), .A1(n1085), .B0(intDX[16]), .B1(n911), .Y(
        n914) );
  AOI32X1TS U1349 ( .A0(n1082), .A1(n912), .A2(intDX[18]), .B0(intDX[19]), 
        .B1(n1024), .Y(n913) );
  OAI32X1TS U1350 ( .A0(n916), .A1(n915), .A2(n914), .B0(n913), .B1(n915), .Y(
        n919) );
  OAI2BB2XLTS U1351 ( .B0(intDY[22]), .B1(n917), .A0N(intDX[23]), .A1N(n1091), 
        .Y(n918) );
  AOI211X1TS U1352 ( .A0(n921), .A1(n920), .B0(n919), .C0(n918), .Y(n927) );
  NAND2BXLTS U1353 ( .AN(intDX[24]), .B(intDY[24]), .Y(n922) );
  NAND4BBX1TS U1354 ( .AN(n925), .BN(n924), .C(n923), .D(n922), .Y(n926) );
  AOI32X1TS U1355 ( .A0(n929), .A1(n928), .A2(n927), .B0(n926), .B1(n929), .Y(
        n930) );
  AOI21X1TS U1356 ( .A0(n931), .A1(n971), .B0(intDX[31]), .Y(n932) );
  AOI21X1TS U1357 ( .A0(n1111), .A1(n972), .B0(n932), .Y(n1113) );
  OAI22X1TS U1358 ( .A0(n935), .A1(n934), .B0(n1054), .B1(n933), .Y(n944) );
  AOI22X1TS U1359 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[38]), .A1(
        n431), .B0(n954), .B1(n937), .Y(n941) );
  AOI22X1TS U1360 ( .A0(n956), .A1(n939), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .B1(n938), .Y(n940)
         );
  OAI211XLTS U1361 ( .A0(n961), .A1(n942), .B0(n941), .C0(n940), .Y(n943) );
  OR3X1TS U1362 ( .A(n945), .B(n944), .C(n943), .Y(n1138) );
  AOI22X1TS U1363 ( .A0(n956), .A1(n947), .B0(n954), .B1(n946), .Y(n952) );
  AOI22X1TS U1364 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[43]), .A1(
        n957), .B0(Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(n431), 
        .Y(n951) );
  OA22X1TS U1365 ( .A0(n949), .A1(n958), .B0(n961), .B1(n948), .Y(n950) );
  NAND4XLTS U1366 ( .A(n952), .B(n951), .C(n950), .D(n962), .Y(n1131) );
  AOI22X1TS U1367 ( .A0(n956), .A1(n955), .B0(n954), .B1(n953), .Y(n965) );
  AOI22X1TS U1368 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[43]), .A1(
        n431), .B0(Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(n957), 
        .Y(n964) );
  OA22X1TS U1369 ( .A0(n961), .A1(n960), .B0(n959), .B1(n958), .Y(n963) );
  NAND4XLTS U1370 ( .A(n965), .B(n964), .C(n963), .D(n962), .Y(n1129) );
  AOI22X1TS U1371 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[51]), .A1(
        n968), .B0(n967), .B1(n966), .Y(n969) );
  NAND2BXLTS U1372 ( .AN(n970), .B(n969), .Y(n1114) );
  AOI21X1TS U1373 ( .A0(n439), .A1(n1093), .B0(overflow_flag), .Y(
        final_result_ieee_Module_Sign_S_mux) );
  INVX4TS U1374 ( .A(n971), .Y(n974) );
  AOI22X1TS U1375 ( .A0(n974), .A1(n1092), .B0(n1015), .B1(n971), .Y(
        Oper_Start_in_module_intm[0]) );
  INVX4TS U1376 ( .A(n971), .Y(n976) );
  AOI22X1TS U1377 ( .A0(n976), .A1(n1087), .B0(n1032), .B1(n971), .Y(
        Oper_Start_in_module_intm[1]) );
  AOI22X1TS U1378 ( .A0(n976), .A1(n1070), .B0(n1012), .B1(n971), .Y(
        Oper_Start_in_module_intm[2]) );
  AOI22X1TS U1379 ( .A0(n974), .A1(n1088), .B0(n1034), .B1(n972), .Y(
        Oper_Start_in_module_intm[3]) );
  BUFX3TS U1380 ( .A(n972), .Y(n978) );
  AOI22X1TS U1381 ( .A0(n973), .A1(n1066), .B0(n1014), .B1(n978), .Y(
        Oper_Start_in_module_intm[4]) );
  AOI22X1TS U1382 ( .A0(n974), .A1(n1062), .B0(n1046), .B1(n972), .Y(
        Oper_Start_in_module_intm[5]) );
  AOI22X1TS U1383 ( .A0(n973), .A1(n1079), .B0(n1019), .B1(n971), .Y(
        Oper_Start_in_module_intm[6]) );
  AOI22X1TS U1384 ( .A0(n973), .A1(n1072), .B0(n1099), .B1(n978), .Y(
        Oper_Start_in_module_intm[7]) );
  AOI22X1TS U1385 ( .A0(n973), .A1(n1084), .B0(n1035), .B1(n972), .Y(
        Oper_Start_in_module_intm[8]) );
  AOI22X1TS U1386 ( .A0(n973), .A1(n1073), .B0(n1004), .B1(n972), .Y(
        Oper_Start_in_module_intm[9]) );
  AOI22X1TS U1387 ( .A0(n973), .A1(n1080), .B0(n1011), .B1(n972), .Y(
        Oper_Start_in_module_intm[10]) );
  AOI22X1TS U1388 ( .A0(n973), .A1(n1081), .B0(n1030), .B1(n972), .Y(
        Oper_Start_in_module_intm[11]) );
  AOI22X1TS U1389 ( .A0(n973), .A1(n1036), .B0(n1065), .B1(n972), .Y(
        Oper_Start_in_module_intm[12]) );
  AOI22X1TS U1390 ( .A0(n973), .A1(n1068), .B0(n1040), .B1(n972), .Y(
        Oper_Start_in_module_intm[13]) );
  AOI22X1TS U1391 ( .A0(n973), .A1(n1025), .B0(n1005), .B1(n972), .Y(
        Oper_Start_in_module_intm[14]) );
  AOI22X1TS U1392 ( .A0(n973), .A1(n1090), .B0(n1041), .B1(n972), .Y(
        Oper_Start_in_module_intm[15]) );
  AOI22X1TS U1393 ( .A0(n973), .A1(n1064), .B0(n1053), .B1(n972), .Y(
        Oper_Start_in_module_intm[16]) );
  AOI22X1TS U1394 ( .A0(n973), .A1(n1085), .B0(n1037), .B1(n972), .Y(
        Oper_Start_in_module_intm[17]) );
  AOI22X1TS U1395 ( .A0(n973), .A1(n1082), .B0(n1006), .B1(n972), .Y(
        Oper_Start_in_module_intm[18]) );
  AOI22X1TS U1396 ( .A0(n973), .A1(n1024), .B0(n1038), .B1(n972), .Y(
        Oper_Start_in_module_intm[19]) );
  AOI22X1TS U1397 ( .A0(n973), .A1(n1071), .B0(n1007), .B1(n972), .Y(
        Oper_Start_in_module_intm[20]) );
  AOI22X1TS U1398 ( .A0(n973), .A1(n1069), .B0(n1042), .B1(n972), .Y(
        Oper_Start_in_module_intm[21]) );
  AOI22X1TS U1399 ( .A0(n973), .A1(n1026), .B0(n1008), .B1(n972), .Y(
        Oper_Start_in_module_intm[22]) );
  AOI22X1TS U1400 ( .A0(n973), .A1(n1091), .B0(n1043), .B1(n972), .Y(
        Oper_Start_in_module_intm[23]) );
  AOI22X1TS U1401 ( .A0(n973), .A1(n1067), .B0(n1009), .B1(n972), .Y(
        Oper_Start_in_module_intm[24]) );
  AOI22X1TS U1402 ( .A0(n973), .A1(n1086), .B0(n1039), .B1(n972), .Y(
        Oper_Start_in_module_intm[25]) );
  AOI22X1TS U1403 ( .A0(n976), .A1(n1089), .B0(n1010), .B1(n972), .Y(
        Oper_Start_in_module_intm[26]) );
  AOI22X1TS U1404 ( .A0(n974), .A1(n1074), .B0(n1013), .B1(n972), .Y(
        Oper_Start_in_module_intm[27]) );
  AOI22X1TS U1405 ( .A0(n976), .A1(n1063), .B0(n1098), .B1(n978), .Y(
        Oper_Start_in_module_intm[28]) );
  AOI22X1TS U1406 ( .A0(n974), .A1(n1083), .B0(n1033), .B1(n978), .Y(
        Oper_Start_in_module_intm[29]) );
  AOI22X1TS U1407 ( .A0(n976), .A1(n1018), .B0(n1047), .B1(n978), .Y(
        Oper_Start_in_module_intm[30]) );
  AOI22X1TS U1408 ( .A0(n974), .A1(n1015), .B0(n1092), .B1(n978), .Y(
        Oper_Start_in_module_intM[0]) );
  AOI22X1TS U1409 ( .A0(n976), .A1(n1032), .B0(n1087), .B1(n978), .Y(
        Oper_Start_in_module_intM[1]) );
  AOI22X1TS U1410 ( .A0(n974), .A1(n1012), .B0(n1070), .B1(n978), .Y(
        Oper_Start_in_module_intM[2]) );
  AOI22X1TS U1411 ( .A0(n976), .A1(n1034), .B0(n1088), .B1(n978), .Y(
        Oper_Start_in_module_intM[3]) );
  AOI22X1TS U1412 ( .A0(n974), .A1(n1014), .B0(n1066), .B1(n978), .Y(
        Oper_Start_in_module_intM[4]) );
  AOI22X1TS U1413 ( .A0(n976), .A1(n1046), .B0(n1062), .B1(n978), .Y(
        Oper_Start_in_module_intM[5]) );
  AOI22X1TS U1414 ( .A0(n974), .A1(n1019), .B0(n1079), .B1(n971), .Y(
        Oper_Start_in_module_intM[6]) );
  AOI22X1TS U1415 ( .A0(n976), .A1(n1099), .B0(n1072), .B1(n971), .Y(
        Oper_Start_in_module_intM[7]) );
  AOI22X1TS U1416 ( .A0(n974), .A1(n1035), .B0(n1084), .B1(n971), .Y(
        Oper_Start_in_module_intM[8]) );
  AOI22X1TS U1417 ( .A0(n974), .A1(n1004), .B0(n1073), .B1(n971), .Y(
        Oper_Start_in_module_intM[9]) );
  AOI22X1TS U1418 ( .A0(n976), .A1(n1011), .B0(n1080), .B1(n971), .Y(
        Oper_Start_in_module_intM[10]) );
  AOI22X1TS U1419 ( .A0(n974), .A1(n1030), .B0(n1081), .B1(n971), .Y(
        Oper_Start_in_module_intM[11]) );
  AOI22X1TS U1420 ( .A0(n976), .A1(n1065), .B0(n1036), .B1(n971), .Y(
        Oper_Start_in_module_intM[12]) );
  AOI22X1TS U1421 ( .A0(n976), .A1(n1040), .B0(n1068), .B1(n971), .Y(
        Oper_Start_in_module_intM[13]) );
  AOI22X1TS U1422 ( .A0(n976), .A1(n1005), .B0(n1025), .B1(n971), .Y(
        Oper_Start_in_module_intM[14]) );
  AOI22X1TS U1423 ( .A0(n974), .A1(n1041), .B0(n1090), .B1(n971), .Y(
        Oper_Start_in_module_intM[15]) );
  BUFX3TS U1424 ( .A(n971), .Y(n977) );
  AOI22X1TS U1425 ( .A0(n974), .A1(n1053), .B0(n1064), .B1(n977), .Y(
        Oper_Start_in_module_intM[16]) );
  AOI22X1TS U1426 ( .A0(n976), .A1(n1037), .B0(n1085), .B1(n977), .Y(
        Oper_Start_in_module_intM[17]) );
  AOI22X1TS U1427 ( .A0(n974), .A1(n1006), .B0(n1082), .B1(n977), .Y(
        Oper_Start_in_module_intM[18]) );
  AOI22X1TS U1428 ( .A0(n974), .A1(n1038), .B0(n1024), .B1(n977), .Y(
        Oper_Start_in_module_intM[19]) );
  AOI22X1TS U1429 ( .A0(n976), .A1(n1007), .B0(n1071), .B1(n977), .Y(
        Oper_Start_in_module_intM[20]) );
  INVX2TS U1430 ( .A(n971), .Y(n979) );
  AOI22X1TS U1431 ( .A0(n979), .A1(n1042), .B0(n1069), .B1(n977), .Y(
        Oper_Start_in_module_intM[21]) );
  AOI22X1TS U1432 ( .A0(n979), .A1(n1008), .B0(n1026), .B1(n977), .Y(
        Oper_Start_in_module_intM[22]) );
  AOI22X1TS U1433 ( .A0(n979), .A1(n1043), .B0(n1091), .B1(n977), .Y(
        Oper_Start_in_module_intM[23]) );
  AOI22X1TS U1434 ( .A0(n979), .A1(n1009), .B0(n1067), .B1(n977), .Y(
        Oper_Start_in_module_intM[24]) );
  AOI22X1TS U1435 ( .A0(n979), .A1(n1039), .B0(n1086), .B1(n977), .Y(
        Oper_Start_in_module_intM[25]) );
  AOI22X1TS U1436 ( .A0(n979), .A1(n1010), .B0(n1089), .B1(n977), .Y(
        Oper_Start_in_module_intM[26]) );
  AOI22X1TS U1437 ( .A0(n979), .A1(n1013), .B0(n1074), .B1(n977), .Y(
        Oper_Start_in_module_intM[27]) );
  AOI22X1TS U1438 ( .A0(n979), .A1(n1098), .B0(n1063), .B1(n971), .Y(
        Oper_Start_in_module_intM[28]) );
  AOI22X1TS U1439 ( .A0(n979), .A1(n1033), .B0(n1083), .B1(n977), .Y(
        Oper_Start_in_module_intM[29]) );
  AOI22X1TS U1440 ( .A0(n976), .A1(n1047), .B0(n1018), .B1(n978), .Y(
        Oper_Start_in_module_intM[30]) );
  NOR2XLTS U1441 ( .A(n991), .B(n980), .Y(n982) );
  AOI22X1TS U1442 ( .A0(n990), .A1(n985), .B0(n648), .B1(n987), .Y(n981) );
  OAI22X1TS U1443 ( .A0(n992), .A1(n982), .B0(n981), .B1(n991), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[24]) );
  AOI222X1TS U1444 ( .A0(n988), .A1(n990), .B0(n987), .B1(n986), .C0(n985), 
        .C1(n648), .Y(n983) );
  OAI22X1TS U1445 ( .A0(n992), .A1(n984), .B0(n983), .B1(n991), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[23]) );
  AOI22X1TS U1446 ( .A0(n661), .A1(n987), .B0(n986), .B1(n985), .Y(n994) );
  AOI22X1TS U1447 ( .A0(n990), .A1(n989), .B0(n648), .B1(n988), .Y(n993) );
  AOI32X1TS U1448 ( .A0(n994), .A1(n704), .A2(n993), .B0(n992), .B1(n991), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[22]) );
  CLKAND2X2TS U1449 ( .A(n997), .B(Sgf_normalized_result[2]), .Y(
        final_result_ieee_Module_Sgf_S_mux[0]) );
  CLKAND2X2TS U1450 ( .A(n997), .B(Sgf_normalized_result[3]), .Y(
        final_result_ieee_Module_Sgf_S_mux[1]) );
  CLKAND2X2TS U1451 ( .A(n997), .B(Sgf_normalized_result[4]), .Y(
        final_result_ieee_Module_Sgf_S_mux[2]) );
  CLKAND2X2TS U1452 ( .A(n997), .B(Sgf_normalized_result[5]), .Y(
        final_result_ieee_Module_Sgf_S_mux[3]) );
  CLKAND2X2TS U1453 ( .A(n997), .B(Sgf_normalized_result[6]), .Y(
        final_result_ieee_Module_Sgf_S_mux[4]) );
  CLKAND2X2TS U1454 ( .A(n997), .B(Sgf_normalized_result[7]), .Y(
        final_result_ieee_Module_Sgf_S_mux[5]) );
  CLKAND2X2TS U1455 ( .A(n997), .B(Sgf_normalized_result[8]), .Y(
        final_result_ieee_Module_Sgf_S_mux[6]) );
  CLKAND2X2TS U1456 ( .A(n997), .B(Sgf_normalized_result[9]), .Y(
        final_result_ieee_Module_Sgf_S_mux[7]) );
  CLKAND2X2TS U1457 ( .A(n997), .B(Sgf_normalized_result[10]), .Y(
        final_result_ieee_Module_Sgf_S_mux[8]) );
  CLKAND2X2TS U1458 ( .A(n997), .B(Sgf_normalized_result[11]), .Y(
        final_result_ieee_Module_Sgf_S_mux[9]) );
  CLKAND2X2TS U1459 ( .A(n997), .B(Sgf_normalized_result[12]), .Y(
        final_result_ieee_Module_Sgf_S_mux[10]) );
  CLKAND2X2TS U1460 ( .A(n997), .B(Sgf_normalized_result[13]), .Y(
        final_result_ieee_Module_Sgf_S_mux[11]) );
  CLKAND2X2TS U1461 ( .A(n997), .B(Sgf_normalized_result[14]), .Y(
        final_result_ieee_Module_Sgf_S_mux[12]) );
  CLKAND2X2TS U1462 ( .A(n995), .B(Sgf_normalized_result[15]), .Y(
        final_result_ieee_Module_Sgf_S_mux[13]) );
  CLKAND2X2TS U1463 ( .A(n995), .B(Sgf_normalized_result[16]), .Y(
        final_result_ieee_Module_Sgf_S_mux[14]) );
  CLKAND2X2TS U1464 ( .A(n995), .B(Sgf_normalized_result[17]), .Y(
        final_result_ieee_Module_Sgf_S_mux[15]) );
  CLKAND2X2TS U1465 ( .A(n995), .B(Sgf_normalized_result[18]), .Y(
        final_result_ieee_Module_Sgf_S_mux[16]) );
  CLKAND2X2TS U1466 ( .A(n995), .B(Sgf_normalized_result[19]), .Y(
        final_result_ieee_Module_Sgf_S_mux[17]) );
  CLKAND2X2TS U1467 ( .A(n995), .B(Sgf_normalized_result[20]), .Y(
        final_result_ieee_Module_Sgf_S_mux[18]) );
  CLKAND2X2TS U1468 ( .A(n995), .B(Sgf_normalized_result[21]), .Y(
        final_result_ieee_Module_Sgf_S_mux[19]) );
  CLKAND2X2TS U1469 ( .A(n995), .B(Sgf_normalized_result[22]), .Y(
        final_result_ieee_Module_Sgf_S_mux[20]) );
  CLKAND2X2TS U1470 ( .A(n995), .B(Sgf_normalized_result[23]), .Y(
        final_result_ieee_Module_Sgf_S_mux[21]) );
  CLKAND2X2TS U1471 ( .A(n997), .B(Sgf_normalized_result[24]), .Y(
        final_result_ieee_Module_Sgf_S_mux[22]) );
  NAND2X1TS U1473 ( .A(n999), .B(n998), .Y(FSM_barrel_shifter_load) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule

