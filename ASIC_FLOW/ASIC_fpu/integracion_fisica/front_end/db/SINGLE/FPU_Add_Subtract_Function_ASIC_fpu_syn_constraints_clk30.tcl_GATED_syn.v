/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:04:12 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_FSM_Add_Subtract_41 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W8_40 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W5_39 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
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
         FS_Module_net3634763, final_result_ieee_Module_Sign_S_mux,
         YRegister_net3634673, Exp_Operation_Module_exp_result_net3634727,
         Leading_Zero_Detector_Module_Output_Reg_net3634691,
         final_result_ieee_Module_Final_Result_IEEE_net3634673,
         Add_Subt_Sgf_module_Add_Subt_Result_net3634709,
         Oper_Start_in_module_MRegister_net3634745,
         Barrel_Shifter_module_Output_Reg_net3634709, n400, n401, n404, n405,
         n406, n407, n411, n412, n413, DP_OP_42J177_122_8048_n20,
         DP_OP_42J177_122_8048_n19, DP_OP_42J177_122_8048_n18,
         DP_OP_42J177_122_8048_n17, DP_OP_42J177_122_8048_n16,
         DP_OP_42J177_122_8048_n15, DP_OP_42J177_122_8048_n14,
         DP_OP_42J177_122_8048_n13, DP_OP_42J177_122_8048_n8,
         DP_OP_42J177_122_8048_n7, DP_OP_42J177_122_8048_n6,
         DP_OP_42J177_122_8048_n5, DP_OP_42J177_122_8048_n4,
         DP_OP_42J177_122_8048_n3, DP_OP_42J177_122_8048_n2,
         DP_OP_42J177_122_8048_n1, DP_OP_45J177_125_5354_n56,
         DP_OP_45J177_125_5354_n55, DP_OP_45J177_125_5354_n54,
         DP_OP_45J177_125_5354_n53, DP_OP_45J177_125_5354_n52,
         DP_OP_45J177_125_5354_n51, DP_OP_45J177_125_5354_n50,
         DP_OP_45J177_125_5354_n49, DP_OP_45J177_125_5354_n48,
         DP_OP_45J177_125_5354_n47, DP_OP_45J177_125_5354_n46,
         DP_OP_45J177_125_5354_n45, DP_OP_45J177_125_5354_n44,
         DP_OP_45J177_125_5354_n43, DP_OP_45J177_125_5354_n42,
         DP_OP_45J177_125_5354_n41, DP_OP_45J177_125_5354_n40,
         DP_OP_45J177_125_5354_n39, DP_OP_45J177_125_5354_n38,
         DP_OP_45J177_125_5354_n37, DP_OP_45J177_125_5354_n36,
         DP_OP_45J177_125_5354_n35, DP_OP_45J177_125_5354_n34,
         DP_OP_45J177_125_5354_n33, DP_OP_45J177_125_5354_n32,
         DP_OP_45J177_125_5354_n31, DP_OP_45J177_125_5354_n26,
         DP_OP_45J177_125_5354_n25, DP_OP_45J177_125_5354_n24,
         DP_OP_45J177_125_5354_n23, DP_OP_45J177_125_5354_n22,
         DP_OP_45J177_125_5354_n21, DP_OP_45J177_125_5354_n20,
         DP_OP_45J177_125_5354_n19, DP_OP_45J177_125_5354_n18,
         DP_OP_45J177_125_5354_n17, DP_OP_45J177_125_5354_n16,
         DP_OP_45J177_125_5354_n15, DP_OP_45J177_125_5354_n14,
         DP_OP_45J177_125_5354_n13, DP_OP_45J177_125_5354_n12,
         DP_OP_45J177_125_5354_n11, DP_OP_45J177_125_5354_n10,
         DP_OP_45J177_125_5354_n9, DP_OP_45J177_125_5354_n8,
         DP_OP_45J177_125_5354_n7, DP_OP_45J177_125_5354_n6,
         DP_OP_45J177_125_5354_n5, DP_OP_45J177_125_5354_n4,
         DP_OP_45J177_125_5354_n3, DP_OP_45J177_125_5354_n2,
         DP_OP_45J177_125_5354_n1, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
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
         n969, n970, n971, n972, n973, n974, n975, n976, n977, n978, n979,
         n980, n981, n982, n983, n984, n985, n986, n987, n988, n989, n990,
         n991, n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002,
         n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012,
         n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022,
         n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032,
         n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042,
         n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052,
         n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
         n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092,
         n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102,
         n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112,
         n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122,
         n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132,
         n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142,
         n1143, n1144;
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

  SNPS_CLOCK_GATE_HIGH_FSM_Add_Subtract_41 FS_Module_clk_gate_state_reg_reg ( 
        .CLK(clk), .EN(n412), .ENCLK(FS_Module_net3634763), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_5 YRegister_clk_gate_Q_reg ( .CLK(clk), .EN(n411), .ENCLK(YRegister_net3634673), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W8_40 Exp_Operation_Module_exp_result_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_exp_operation_load_diff), .ENCLK(
        Exp_Operation_Module_exp_result_net3634727), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W5_39 Leading_Zero_Detector_Module_Output_Reg_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_LZA_load), .ENCLK(
        Leading_Zero_Detector_Module_Output_Reg_net3634691), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_4 final_result_ieee_Module_Final_Result_IEEE_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_Final_Result_load), .ENCLK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_2 Add_Subt_Sgf_module_Add_Subt_Result_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_Add_Subt_Sgf_load), .ENCLK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_6 Oper_Start_in_module_MRegister_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n413), .ENCLK(Oper_Start_in_module_MRegister_net3634745), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_3 Barrel_Shifter_module_Output_Reg_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_barrel_shifter_load), .ENCLK(
        Barrel_Shifter_module_Output_Reg_net3634709), .TE(1'b0) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_7_ ( .D(
        Exp_Operation_Module_Data_S[7]), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1114), .Q(
        exp_oper_result[7]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_6_ ( .D(
        Exp_Operation_Module_Data_S[6]), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1112), .Q(
        exp_oper_result[6]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_5_ ( .D(
        Exp_Operation_Module_Data_S[5]), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1101), .Q(
        exp_oper_result[5]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_30_ ( .D(
        Oper_Start_in_module_intM[30]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1113), .Q(DMP[30]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_29_ ( .D(
        Oper_Start_in_module_intM[29]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1105), .Q(DMP[29]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_28_ ( .D(
        Oper_Start_in_module_intM[28]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1102), .Q(DMP[28]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_27_ ( .D(
        Oper_Start_in_module_intM[27]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1107), .Q(DMP[27]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_26_ ( .D(
        Oper_Start_in_module_intM[26]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1108), .Q(DMP[26]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_25_ ( .D(
        Oper_Start_in_module_intM[25]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1106), .Q(DMP[25]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_24_ ( .D(
        Oper_Start_in_module_intM[24]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n433), .Q(DMP[24]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_23_ ( .D(
        Oper_Start_in_module_intM[23]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1101), .Q(DMP[23]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_22_ ( .D(
        Oper_Start_in_module_intM[22]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1099), .Q(DMP[22]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_21_ ( .D(
        Oper_Start_in_module_intM[21]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1109), .Q(DMP[21]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_20_ ( .D(
        Oper_Start_in_module_intM[20]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1105), .Q(DMP[20]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_19_ ( .D(
        Oper_Start_in_module_intM[19]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1112), .Q(DMP[19]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_18_ ( .D(
        Oper_Start_in_module_intM[18]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1102), .Q(DMP[18]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_17_ ( .D(
        Oper_Start_in_module_intM[17]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1101), .Q(DMP[17]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_16_ ( .D(
        Oper_Start_in_module_intM[16]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1107), .Q(DMP[16]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_15_ ( .D(
        Oper_Start_in_module_intM[15]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1108), .Q(DMP[15]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_14_ ( .D(
        Oper_Start_in_module_intM[14]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1106), .Q(DMP[14]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_13_ ( .D(
        Oper_Start_in_module_intM[13]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n433), .Q(DMP[13]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_12_ ( .D(
        Oper_Start_in_module_intM[12]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n434), .Q(DMP[12]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_11_ ( .D(
        Oper_Start_in_module_intM[11]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1103), .Q(DMP[11]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_10_ ( .D(
        Oper_Start_in_module_intM[10]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1097), .Q(DMP[10]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_9_ ( .D(
        Oper_Start_in_module_intM[9]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1105), .Q(DMP[9]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_8_ ( .D(
        Oper_Start_in_module_intM[8]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1112), .Q(DMP[8]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_7_ ( .D(
        Oper_Start_in_module_intM[7]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1113), .Q(DMP[7]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_6_ ( .D(
        Oper_Start_in_module_intM[6]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1114), .Q(DMP[6]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_5_ ( .D(
        Oper_Start_in_module_intM[5]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1102), .Q(DMP[5]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_4_ ( .D(
        Oper_Start_in_module_intM[4]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1099), .Q(DMP[4]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_3_ ( .D(
        Oper_Start_in_module_intM[3]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1109), .Q(DMP[3]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_2_ ( .D(
        Oper_Start_in_module_intM[2]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1111), .Q(DMP[2]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_1_ ( .D(
        Oper_Start_in_module_intM[1]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1111), .Q(DMP[1]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_0_ ( .D(
        Oper_Start_in_module_intM[0]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1111), .Q(DMP[0]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_30_ ( .D(
        Oper_Start_in_module_intm[30]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1107), .Q(DmP[30]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_29_ ( .D(
        Oper_Start_in_module_intm[29]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1108), .Q(DmP[29]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_28_ ( .D(
        Oper_Start_in_module_intm[28]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1106), .Q(DmP[28]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_27_ ( .D(
        Oper_Start_in_module_intm[27]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n433), .Q(DmP[27]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_26_ ( .D(
        Oper_Start_in_module_intm[26]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n434), .Q(DmP[26]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_25_ ( .D(
        Oper_Start_in_module_intm[25]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1103), .Q(DmP[25]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_24_ ( .D(
        Oper_Start_in_module_intm[24]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1114), .Q(DmP[24]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_23_ ( .D(
        Oper_Start_in_module_intm[23]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1113), .Q(DmP[23]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_22_ ( .D(
        Oper_Start_in_module_intm[22]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1100), .Q(DmP[22]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_21_ ( .D(
        Oper_Start_in_module_intm[21]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1100), .Q(DmP[21]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_20_ ( .D(
        Oper_Start_in_module_intm[20]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1100), .Q(DmP[20]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_19_ ( .D(
        Oper_Start_in_module_intm[19]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1099), .Q(DmP[19]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_18_ ( .D(
        Oper_Start_in_module_intm[18]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1110), .Q(DmP[18]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_17_ ( .D(
        Oper_Start_in_module_intm[17]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1115), .Q(DmP[17]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_16_ ( .D(
        Oper_Start_in_module_intm[16]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1110), .Q(DmP[16]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_15_ ( .D(
        Oper_Start_in_module_intm[15]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1109), .Q(DmP[15]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_14_ ( .D(
        Oper_Start_in_module_intm[14]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1099), .Q(DmP[14]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_13_ ( .D(
        Oper_Start_in_module_intm[13]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1115), .Q(DmP[13]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_12_ ( .D(
        Oper_Start_in_module_intm[12]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1110), .Q(DmP[12]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_11_ ( .D(
        Oper_Start_in_module_intm[11]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1109), .Q(DmP[11]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_10_ ( .D(
        Oper_Start_in_module_intm[10]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1099), .Q(DmP[10]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_9_ ( .D(
        Oper_Start_in_module_intm[9]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1115), .Q(DmP[9]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_8_ ( .D(
        Oper_Start_in_module_intm[8]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1110), .Q(DmP[8]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_7_ ( .D(
        Oper_Start_in_module_intm[7]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1102), .Q(DmP[7]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_6_ ( .D(
        Oper_Start_in_module_intm[6]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1114), .Q(DmP[6]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_5_ ( .D(
        Oper_Start_in_module_intm[5]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1113), .Q(DmP[5]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_4_ ( .D(
        Oper_Start_in_module_intm[4]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1112), .Q(DmP[4]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_3_ ( .D(
        Oper_Start_in_module_intm[3]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1105), .Q(DmP[3]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_2_ ( .D(
        Oper_Start_in_module_intm[2]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1097), .Q(DmP[2]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_1_ ( .D(
        Oper_Start_in_module_intm[1]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1103), .Q(DmP[1]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_0_ ( .D(
        Oper_Start_in_module_intm[0]), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n434), .Q(DmP[0]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_0_ ( .D(
        Add_Subt_Sgf_module_S_to_D[0]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n433), .Q(
        Add_Subt_result[0]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_2_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[2]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3634691), .RN(n1113), .Q(
        LZA_output[2]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_1_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[1]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3634691), .RN(n1097), .Q(
        LZA_output[1]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_0_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[0]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3634691), .RN(n1097), .Q(
        LZA_output[0]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_1_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[1]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[27]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_0_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[0]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[26]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_31_ ( .D(
        final_result_ieee_Module_Sign_S_mux), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1104), 
        .Q(final_result_ieee[31]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_23_ ( .D(
        final_result_ieee_Module_Exp_S_mux[0]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1104), 
        .Q(final_result_ieee[23]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_24_ ( .D(
        final_result_ieee_Module_Exp_S_mux[1]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1099), 
        .Q(final_result_ieee[24]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_25_ ( .D(
        final_result_ieee_Module_Exp_S_mux[2]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1110), 
        .Q(final_result_ieee[25]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_26_ ( .D(
        final_result_ieee_Module_Exp_S_mux[3]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1115), 
        .Q(final_result_ieee[26]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_27_ ( .D(
        final_result_ieee_Module_Exp_S_mux[4]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1109), 
        .Q(final_result_ieee[27]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_28_ ( .D(
        final_result_ieee_Module_Exp_S_mux[5]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1099), 
        .Q(final_result_ieee[28]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_29_ ( .D(
        final_result_ieee_Module_Exp_S_mux[6]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1110), 
        .Q(final_result_ieee[29]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_30_ ( .D(
        final_result_ieee_Module_Exp_S_mux[7]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1115), 
        .Q(final_result_ieee[30]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_0_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[0]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1109), 
        .Q(final_result_ieee[0]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_1_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[1]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1099), 
        .Q(final_result_ieee[1]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_2_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[2]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1110), 
        .Q(final_result_ieee[2]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_3_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[3]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1115), 
        .Q(final_result_ieee[3]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_4_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[4]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1109), 
        .Q(final_result_ieee[4]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_5_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[5]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1096), 
        .Q(final_result_ieee[5]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_6_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[6]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1098), 
        .Q(final_result_ieee[6]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_7_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[7]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1104), 
        .Q(final_result_ieee[7]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_8_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[8]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1110), 
        .Q(final_result_ieee[8]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_9_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[9]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1109), 
        .Q(final_result_ieee[9]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_10_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[10]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1099), 
        .Q(final_result_ieee[10]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_11_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[11]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1115), 
        .Q(final_result_ieee[11]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_12_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[12]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1110), 
        .Q(final_result_ieee[12]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_13_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[13]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1109), 
        .Q(final_result_ieee[13]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_14_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[14]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1099), 
        .Q(final_result_ieee[14]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_15_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[15]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1115), 
        .Q(final_result_ieee[15]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_16_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[16]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1099), 
        .Q(final_result_ieee[16]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_17_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[17]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1106), 
        .Q(final_result_ieee[17]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_18_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[18]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1108), 
        .Q(final_result_ieee[18]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_19_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[19]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1107), 
        .Q(final_result_ieee[19]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_20_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[20]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1101), 
        .Q(final_result_ieee[20]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_21_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[21]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1112), 
        .Q(final_result_ieee[21]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_22_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[22]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3634673), .RN(n1105), 
        .Q(final_result_ieee[22]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_25_ ( .D(n1119), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1110), .Q(
        Sgf_normalized_result[25]) );
  DFFRXLTS Oper_Start_in_module_SignRegister_Q_reg_0_ ( .D(n1118), .CK(
        Oper_Start_in_module_MRegister_net3634745), .RN(n1114), .Q(
        sign_final_result), .QN(n436) );
  CMPR32X2TS DP_OP_42J177_122_8048_U6 ( .A(DP_OP_42J177_122_8048_n17), .B(
        S_Oper_A_exp[3]), .C(DP_OP_42J177_122_8048_n6), .CO(
        DP_OP_42J177_122_8048_n5), .S(Exp_Operation_Module_Data_S[3]) );
  CMPR32X2TS DP_OP_42J177_122_8048_U5 ( .A(DP_OP_42J177_122_8048_n16), .B(
        S_Oper_A_exp[4]), .C(DP_OP_42J177_122_8048_n5), .CO(
        DP_OP_42J177_122_8048_n4), .S(Exp_Operation_Module_Data_S[4]) );
  CMPR32X2TS DP_OP_42J177_122_8048_U4 ( .A(DP_OP_42J177_122_8048_n15), .B(
        S_Oper_A_exp[5]), .C(DP_OP_42J177_122_8048_n4), .CO(
        DP_OP_42J177_122_8048_n3), .S(Exp_Operation_Module_Data_S[5]) );
  CMPR32X2TS DP_OP_42J177_122_8048_U3 ( .A(DP_OP_42J177_122_8048_n14), .B(
        S_Oper_A_exp[6]), .C(DP_OP_42J177_122_8048_n3), .CO(
        DP_OP_42J177_122_8048_n2), .S(Exp_Operation_Module_Data_S[6]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U27 ( .A(S_A_S_Oper_A[0]), .B(n787), .C(
        DP_OP_45J177_125_5354_n56), .CO(DP_OP_45J177_125_5354_n26), .S(
        Add_Subt_Sgf_module_S_to_D[0]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U25 ( .A(DP_OP_45J177_125_5354_n54), .B(
        S_A_S_Oper_A[2]), .C(DP_OP_45J177_125_5354_n25), .CO(
        DP_OP_45J177_125_5354_n24), .S(Add_Subt_Sgf_module_S_to_D[2]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U23 ( .A(DP_OP_45J177_125_5354_n52), .B(
        S_A_S_Oper_A[4]), .C(DP_OP_45J177_125_5354_n23), .CO(
        DP_OP_45J177_125_5354_n22), .S(Add_Subt_Sgf_module_S_to_D[4]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U22 ( .A(DP_OP_45J177_125_5354_n51), .B(
        S_A_S_Oper_A[5]), .C(DP_OP_45J177_125_5354_n22), .CO(
        DP_OP_45J177_125_5354_n21), .S(Add_Subt_Sgf_module_S_to_D[5]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U21 ( .A(DP_OP_45J177_125_5354_n50), .B(
        S_A_S_Oper_A[6]), .C(DP_OP_45J177_125_5354_n21), .CO(
        DP_OP_45J177_125_5354_n20), .S(Add_Subt_Sgf_module_S_to_D[6]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U20 ( .A(DP_OP_45J177_125_5354_n49), .B(
        S_A_S_Oper_A[7]), .C(DP_OP_45J177_125_5354_n20), .CO(
        DP_OP_45J177_125_5354_n19), .S(Add_Subt_Sgf_module_S_to_D[7]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U19 ( .A(DP_OP_45J177_125_5354_n48), .B(
        S_A_S_Oper_A[8]), .C(DP_OP_45J177_125_5354_n19), .CO(
        DP_OP_45J177_125_5354_n18), .S(Add_Subt_Sgf_module_S_to_D[8]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U18 ( .A(DP_OP_45J177_125_5354_n47), .B(
        S_A_S_Oper_A[9]), .C(DP_OP_45J177_125_5354_n18), .CO(
        DP_OP_45J177_125_5354_n17), .S(Add_Subt_Sgf_module_S_to_D[9]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U17 ( .A(DP_OP_45J177_125_5354_n46), .B(
        S_A_S_Oper_A[10]), .C(DP_OP_45J177_125_5354_n17), .CO(
        DP_OP_45J177_125_5354_n16), .S(Add_Subt_Sgf_module_S_to_D[10]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U16 ( .A(DP_OP_45J177_125_5354_n45), .B(
        S_A_S_Oper_A[11]), .C(DP_OP_45J177_125_5354_n16), .CO(
        DP_OP_45J177_125_5354_n15), .S(Add_Subt_Sgf_module_S_to_D[11]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U15 ( .A(DP_OP_45J177_125_5354_n44), .B(
        S_A_S_Oper_A[12]), .C(DP_OP_45J177_125_5354_n15), .CO(
        DP_OP_45J177_125_5354_n14), .S(Add_Subt_Sgf_module_S_to_D[12]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U14 ( .A(DP_OP_45J177_125_5354_n43), .B(
        S_A_S_Oper_A[13]), .C(DP_OP_45J177_125_5354_n14), .CO(
        DP_OP_45J177_125_5354_n13), .S(Add_Subt_Sgf_module_S_to_D[13]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U13 ( .A(DP_OP_45J177_125_5354_n42), .B(
        S_A_S_Oper_A[14]), .C(DP_OP_45J177_125_5354_n13), .CO(
        DP_OP_45J177_125_5354_n12), .S(Add_Subt_Sgf_module_S_to_D[14]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U12 ( .A(DP_OP_45J177_125_5354_n41), .B(
        S_A_S_Oper_A[15]), .C(DP_OP_45J177_125_5354_n12), .CO(
        DP_OP_45J177_125_5354_n11), .S(Add_Subt_Sgf_module_S_to_D[15]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U11 ( .A(DP_OP_45J177_125_5354_n40), .B(
        S_A_S_Oper_A[16]), .C(DP_OP_45J177_125_5354_n11), .CO(
        DP_OP_45J177_125_5354_n10), .S(Add_Subt_Sgf_module_S_to_D[16]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U10 ( .A(DP_OP_45J177_125_5354_n39), .B(
        S_A_S_Oper_A[17]), .C(DP_OP_45J177_125_5354_n10), .CO(
        DP_OP_45J177_125_5354_n9), .S(Add_Subt_Sgf_module_S_to_D[17]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U9 ( .A(DP_OP_45J177_125_5354_n38), .B(
        S_A_S_Oper_A[18]), .C(DP_OP_45J177_125_5354_n9), .CO(
        DP_OP_45J177_125_5354_n8), .S(Add_Subt_Sgf_module_S_to_D[18]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U8 ( .A(DP_OP_45J177_125_5354_n37), .B(
        S_A_S_Oper_A[19]), .C(DP_OP_45J177_125_5354_n8), .CO(
        DP_OP_45J177_125_5354_n7), .S(Add_Subt_Sgf_module_S_to_D[19]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U7 ( .A(DP_OP_45J177_125_5354_n36), .B(
        S_A_S_Oper_A[20]), .C(DP_OP_45J177_125_5354_n7), .CO(
        DP_OP_45J177_125_5354_n6), .S(Add_Subt_Sgf_module_S_to_D[20]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U6 ( .A(DP_OP_45J177_125_5354_n35), .B(
        S_A_S_Oper_A[21]), .C(DP_OP_45J177_125_5354_n6), .CO(
        DP_OP_45J177_125_5354_n5), .S(Add_Subt_Sgf_module_S_to_D[21]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U5 ( .A(DP_OP_45J177_125_5354_n34), .B(
        S_A_S_Oper_A[22]), .C(DP_OP_45J177_125_5354_n5), .CO(
        DP_OP_45J177_125_5354_n4), .S(Add_Subt_Sgf_module_S_to_D[22]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U4 ( .A(DP_OP_45J177_125_5354_n33), .B(
        S_A_S_Oper_A[23]), .C(DP_OP_45J177_125_5354_n4), .CO(
        DP_OP_45J177_125_5354_n3), .S(Add_Subt_Sgf_module_S_to_D[23]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U3 ( .A(DP_OP_45J177_125_5354_n32), .B(
        S_A_S_Oper_A[24]), .C(DP_OP_45J177_125_5354_n3), .CO(
        DP_OP_45J177_125_5354_n2), .S(Add_Subt_Sgf_module_S_to_D[24]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U2 ( .A(DP_OP_45J177_125_5354_n31), .B(
        S_A_S_Oper_A[25]), .C(DP_OP_45J177_125_5354_n2), .CO(
        DP_OP_45J177_125_5354_n1), .S(Add_Subt_Sgf_module_S_to_D[25]) );
  DFFSX2TS R_0 ( .D(n1091), .CK(YRegister_net3634673), .SN(n1110), .Q(n1116)
         );
  DFFRX2TS YRegister_Q_reg_23_ ( .D(Data_Y[23]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[23]), .QN(n1087) );
  DFFRX2TS YRegister_Q_reg_15_ ( .D(Data_Y[15]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[15]), .QN(n1086) );
  DFFRX2TS YRegister_Q_reg_3_ ( .D(Data_Y[3]), .CK(YRegister_net3634673), .RN(
        n1101), .Q(intDY[3]), .QN(n1084) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_13_ ( .D(
        Add_Subt_Sgf_module_S_to_D[13]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1113), .Q(
        Add_Subt_result[13]), .QN(n1061) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_19_ ( .D(
        Add_Subt_Sgf_module_S_to_D[19]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1111), .Q(
        Add_Subt_result[19]), .QN(n1060) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_16_ ( .D(
        Add_Subt_Sgf_module_S_to_D[16]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1114), .Q(
        Add_Subt_result[16]), .QN(n1059) );
  DFFRX2TS YRegister_Q_reg_5_ ( .D(Data_Y[5]), .CK(YRegister_net3634673), .RN(
        n1112), .Q(intDY[5]), .QN(n1057) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_10_ ( .D(
        Add_Subt_Sgf_module_S_to_D[10]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1105), .Q(
        Add_Subt_result[10]), .QN(n1056) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_18_ ( .D(
        Add_Subt_Sgf_module_S_to_D[18]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1114), .Q(
        Add_Subt_result[18]), .QN(n1055) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_25_ ( .D(
        Add_Subt_Sgf_module_S_to_D[25]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n434), .Q(
        Add_Subt_result[25]), .QN(n1049) );
  DFFRX2TS XRegister_Q_reg_16_ ( .D(Data_X[16]), .CK(YRegister_net3634673), 
        .RN(n1107), .Q(intDX[16]), .QN(n1047) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_25_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[25]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[51]), .QN(n1045) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_24_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[24]), .CK(clk), .RN(n1112), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[50]), .QN(n1044) );
  DFFRX2TS XRegister_Q_reg_4_ ( .D(Data_X[4]), .CK(YRegister_net3634673), .RN(
        n1096), .Q(intDX[4]), .QN(n1042) );
  DFFRX2TS Exp_Operation_Module_exp_result_Q_reg_4_ ( .D(
        Exp_Operation_Module_Data_S[4]), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1105), .Q(
        exp_oper_result[4]), .QN(n1032) );
  DFFRX2TS Exp_Operation_Module_exp_result_Q_reg_3_ ( .D(
        Exp_Operation_Module_Data_S[3]), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1102), .Q(
        exp_oper_result[3]), .QN(n1031) );
  DFFRX2TS Sel_C_Q_reg_0_ ( .D(n407), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n400), .Q(
        FSM_selector_C), .QN(n1026) );
  DFFRX2TS Sel_B_Q_reg_0_ ( .D(n405), .CK(FS_Module_net3634763), .RN(n400), 
        .Q(FSM_selector_B[0]), .QN(n1025) );
  DFFRX2TS FS_Module_state_reg_reg_2_ ( .D(FS_Module_state_next[2]), .CK(
        FS_Module_net3634763), .RN(n1098), .Q(FS_Module_state_reg[2]), .QN(
        n1024) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_17_ ( .D(
        Add_Subt_Sgf_module_S_to_D[17]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1102), .Q(
        Add_Subt_result[17]), .QN(n1018) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_12_ ( .D(
        Add_Subt_Sgf_module_S_to_D[12]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1103), .Q(
        Add_Subt_result[12]), .QN(n1017) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_16_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[16]), .CK(clk), .RN(n1113), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[42]), .QN(n1016) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_12_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[12]), .CK(clk), .RN(n1102), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[38]), .QN(n1015) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_17_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[17]), .CK(clk), .RN(n1097), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[43]), .QN(n1014) );
  DFFRX2TS YRegister_Q_reg_30_ ( .D(Data_Y[30]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[30]), .QN(n1012) );
  DFFRX2TS XRegister_Q_reg_5_ ( .D(Data_X[5]), .CK(YRegister_net3634673), .RN(
        n1096), .QN(n1011) );
  DFFRX2TS FS_Module_state_reg_reg_1_ ( .D(FS_Module_state_next[1]), .CK(
        FS_Module_net3634763), .RN(n1111), .Q(FS_Module_state_reg[1]), .QN(
        n999) );
  DFFRX2TS FS_Module_state_reg_reg_3_ ( .D(FS_Module_state_next[3]), .CK(
        FS_Module_net3634763), .RN(n1104), .Q(FS_Module_state_reg[3]), .QN(
        n998) );
  DFFRX2TS Leading_Zero_Detector_Module_Output_Reg_Q_reg_3_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[3]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3634691), .RN(n1114), .Q(
        LZA_output[3]), .QN(n996) );
  CMPR32X2TS DP_OP_42J177_122_8048_U9 ( .A(S_Oper_A_exp[0]), .B(n1092), .C(
        DP_OP_42J177_122_8048_n20), .CO(DP_OP_42J177_122_8048_n8), .S(
        Exp_Operation_Module_Data_S[0]) );
  CMPR32X2TS DP_OP_42J177_122_8048_U2 ( .A(DP_OP_42J177_122_8048_n13), .B(
        S_Oper_A_exp[7]), .C(DP_OP_42J177_122_8048_n2), .CO(
        DP_OP_42J177_122_8048_n1), .S(Exp_Operation_Module_Data_S[7]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_2_ ( .D(
        Add_Subt_Sgf_module_S_to_D[2]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1108), .Q(
        Add_Subt_result[2]), .QN(n1058) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_5_ ( .D(
        Add_Subt_Sgf_module_S_to_D[5]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1107), .Q(
        Add_Subt_result[5]), .QN(n997) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_22_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[22]), .CK(clk), .RN(n1101), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[48]), .QN(n1053) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_23_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[23]), .CK(clk), .RN(n1112), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[49]), .QN(n1051) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_7_ ( .D(
        Add_Subt_Sgf_module_S_to_D[7]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1101), .Q(
        Add_Subt_result[7]), .QN(n1089) );
  DFFRX1TS YRegister_Q_reg_29_ ( .D(Data_Y[29]), .CK(YRegister_net3634673), 
        .RN(n1111), .Q(intDY[29]), .QN(n1079) );
  DFFRX1TS YRegister_Q_reg_28_ ( .D(Data_Y[28]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDY[28]), .QN(n1063) );
  DFFRX1TS YRegister_Q_reg_27_ ( .D(Data_Y[27]), .CK(YRegister_net3634673), 
        .RN(n1104), .Q(intDY[27]), .QN(n1074) );
  DFFRX1TS YRegister_Q_reg_26_ ( .D(Data_Y[26]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDY[26]), .QN(n1085) );
  DFFRX1TS YRegister_Q_reg_25_ ( .D(Data_Y[25]), .CK(YRegister_net3634673), 
        .RN(n1104), .Q(intDY[25]), .QN(n1082) );
  DFFRX1TS YRegister_Q_reg_24_ ( .D(Data_Y[24]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[24]), .QN(n1067) );
  DFFRX1TS YRegister_Q_reg_22_ ( .D(Data_Y[22]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[22]), .QN(n1022) );
  DFFRX1TS YRegister_Q_reg_21_ ( .D(Data_Y[21]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[21]), .QN(n1069) );
  DFFRX1TS YRegister_Q_reg_20_ ( .D(Data_Y[20]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[20]), .QN(n1071) );
  DFFRX1TS YRegister_Q_reg_19_ ( .D(Data_Y[19]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[19]), .QN(n1020) );
  DFFRX1TS YRegister_Q_reg_18_ ( .D(Data_Y[18]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[18]), .QN(n1078) );
  DFFRX1TS YRegister_Q_reg_17_ ( .D(Data_Y[17]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[17]), .QN(n1081) );
  DFFRX1TS YRegister_Q_reg_16_ ( .D(Data_Y[16]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[16]), .QN(n1064) );
  DFFRX1TS YRegister_Q_reg_14_ ( .D(Data_Y[14]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[14]), .QN(n1021) );
  DFFRX1TS YRegister_Q_reg_13_ ( .D(Data_Y[13]), .CK(YRegister_net3634673), 
        .RN(n1096), .Q(intDY[13]), .QN(n1068) );
  DFFRX1TS YRegister_Q_reg_11_ ( .D(Data_Y[11]), .CK(YRegister_net3634673), 
        .RN(n1113), .Q(intDY[11]), .QN(n1077) );
  DFFRX1TS YRegister_Q_reg_10_ ( .D(Data_Y[10]), .CK(YRegister_net3634673), 
        .RN(n1112), .Q(intDY[10]), .QN(n1076) );
  DFFRX1TS YRegister_Q_reg_9_ ( .D(Data_Y[9]), .CK(YRegister_net3634673), .RN(
        n1105), .Q(intDY[9]), .QN(n1073) );
  DFFRX1TS YRegister_Q_reg_8_ ( .D(Data_Y[8]), .CK(YRegister_net3634673), .RN(
        n1097), .Q(intDY[8]), .QN(n1080) );
  DFFRX1TS YRegister_Q_reg_7_ ( .D(Data_Y[7]), .CK(YRegister_net3634673), .RN(
        n1102), .Q(intDY[7]), .QN(n1072) );
  DFFRX1TS YRegister_Q_reg_6_ ( .D(Data_Y[6]), .CK(YRegister_net3634673), .RN(
        n1103), .Q(intDY[6]), .QN(n1075) );
  DFFRX1TS YRegister_Q_reg_4_ ( .D(Data_Y[4]), .CK(YRegister_net3634673), .RN(
        n1106), .Q(intDY[4]), .QN(n1066) );
  DFFRX1TS YRegister_Q_reg_2_ ( .D(Data_Y[2]), .CK(YRegister_net3634673), .RN(
        n434), .Q(intDY[2]), .QN(n1070) );
  DFFRX1TS YRegister_Q_reg_1_ ( .D(Data_Y[1]), .CK(YRegister_net3634673), .RN(
        n433), .Q(intDY[1]), .QN(n1083) );
  DFFRX1TS YRegister_Q_reg_0_ ( .D(Data_Y[0]), .CK(YRegister_net3634673), .RN(
        n1098), .Q(intDY[0]), .QN(n1088) );
  DFFRX1TS XRegister_Q_reg_30_ ( .D(Data_X[30]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[30]), .QN(n1043) );
  DFFRX1TS XRegister_Q_reg_29_ ( .D(Data_X[29]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[29]), .QN(n1036) );
  DFFRX1TS XRegister_Q_reg_27_ ( .D(Data_X[27]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[27]), .QN(n1010) );
  DFFRX1TS XRegister_Q_reg_26_ ( .D(Data_X[26]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[26]), .QN(n1007) );
  DFFRX1TS XRegister_Q_reg_25_ ( .D(Data_X[25]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[25]), .QN(n1041) );
  DFFRX1TS XRegister_Q_reg_24_ ( .D(Data_X[24]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[24]), .QN(n1006) );
  DFFRX1TS XRegister_Q_reg_23_ ( .D(Data_X[23]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[23]), .QN(n1030) );
  DFFRX1TS XRegister_Q_reg_22_ ( .D(Data_X[22]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[22]), .QN(n1035) );
  DFFRX1TS XRegister_Q_reg_21_ ( .D(Data_X[21]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[21]), .QN(n1002) );
  DFFRX1TS XRegister_Q_reg_20_ ( .D(Data_X[20]), .CK(YRegister_net3634673), 
        .RN(n1114), .Q(intDX[20]), .QN(n1005) );
  DFFRX1TS XRegister_Q_reg_19_ ( .D(Data_X[19]), .CK(YRegister_net3634673), 
        .RN(n1113), .Q(intDX[19]), .QN(n1040) );
  DFFRX1TS XRegister_Q_reg_18_ ( .D(Data_X[18]), .CK(YRegister_net3634673), 
        .RN(n1097), .Q(intDX[18]), .QN(n1004) );
  DFFRX1TS XRegister_Q_reg_17_ ( .D(Data_X[17]), .CK(YRegister_net3634673), 
        .RN(n1102), .Q(intDX[17]), .QN(n1039) );
  DFFRX1TS XRegister_Q_reg_15_ ( .D(Data_X[15]), .CK(YRegister_net3634673), 
        .RN(n1103), .Q(intDX[15]), .QN(n1029) );
  DFFRX1TS XRegister_Q_reg_14_ ( .D(Data_X[14]), .CK(YRegister_net3634673), 
        .RN(n434), .Q(intDX[14]), .QN(n1034) );
  DFFRX1TS XRegister_Q_reg_13_ ( .D(Data_X[13]), .CK(YRegister_net3634673), 
        .RN(n433), .Q(intDX[13]), .QN(n1001) );
  DFFRX1TS XRegister_Q_reg_12_ ( .D(Data_X[12]), .CK(YRegister_net3634673), 
        .RN(n1106), .Q(intDX[12]), .QN(n1065) );
  DFFRX1TS XRegister_Q_reg_11_ ( .D(Data_X[11]), .CK(YRegister_net3634673), 
        .RN(n1108), .Q(intDX[11]), .QN(n1027) );
  DFFRX1TS XRegister_Q_reg_10_ ( .D(Data_X[10]), .CK(YRegister_net3634673), 
        .RN(n1107), .Q(intDX[10]), .QN(n1000) );
  DFFRX1TS XRegister_Q_reg_9_ ( .D(Data_X[9]), .CK(YRegister_net3634673), .RN(
        n1101), .Q(intDX[9]), .QN(n1003) );
  DFFRX1TS XRegister_Q_reg_8_ ( .D(Data_X[8]), .CK(YRegister_net3634673), .RN(
        n1100), .Q(intDX[8]), .QN(n1037) );
  DFFRX1TS XRegister_Q_reg_6_ ( .D(Data_X[6]), .CK(YRegister_net3634673), .RN(
        n1100), .Q(intDX[6]), .QN(n1013) );
  DFFRX1TS XRegister_Q_reg_3_ ( .D(Data_X[3]), .CK(YRegister_net3634673), .RN(
        n1100), .Q(intDX[3]), .QN(n1028) );
  DFFRX1TS XRegister_Q_reg_2_ ( .D(Data_X[2]), .CK(YRegister_net3634673), .RN(
        n1100), .Q(intDX[2]), .QN(n1009) );
  DFFRX1TS XRegister_Q_reg_1_ ( .D(Data_X[1]), .CK(YRegister_net3634673), .RN(
        n1100), .Q(intDX[1]), .QN(n1033) );
  DFFRX1TS XRegister_Q_reg_0_ ( .D(Data_X[0]), .CK(YRegister_net3634673), .RN(
        n1100), .Q(intDX[0]), .QN(n1008) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_21_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[21]), .CK(clk), .RN(n1105), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[47]), .QN(n1050) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_8_ ( .D(
        Add_Subt_Sgf_module_S_to_D[8]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1103), .Q(
        Add_Subt_result[8]), .QN(n1019) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_18_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[18]), .CK(clk), .RN(n1107), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[44]), .QN(n1054) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_19_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[19]), .CK(clk), .RN(n1101), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[45]), .QN(n1052) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_20_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[20]), .CK(clk), .RN(n1112), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[46]), .QN(n1048) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_9_ ( .D(
        Add_Subt_Sgf_module_S_to_D[9]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1106), .Q(
        Add_Subt_result[9]), .QN(n1062) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_13_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[13]), .CK(clk), .RN(n1103), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[39]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_10_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[10]), .CK(clk), .RN(n1106), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[36]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_11_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[11]), .CK(clk), .RN(n434), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[37]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_14_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[14]), .CK(clk), .RN(n433), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[40]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_15_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[15]), .CK(clk), .RN(n1108), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[41]) );
  DFFRX2TS XRegister_Q_reg_7_ ( .D(Data_X[7]), .CK(YRegister_net3634673), .RN(
        n1100), .QN(n1095) );
  DFFRX2TS Leading_Zero_Detector_Module_Output_Reg_Q_reg_4_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[4]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3634691), .RN(n1113), .Q(
        LZA_output[4]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_20_ ( .D(
        Add_Subt_Sgf_module_S_to_D[20]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1111), .Q(
        Add_Subt_result[20]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_14_ ( .D(
        Add_Subt_Sgf_module_S_to_D[14]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1111), .Q(
        Add_Subt_result[14]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_3_ ( .D(
        Add_Subt_Sgf_module_S_to_D[3]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1097), .Q(
        Add_Subt_result[3]) );
  DFFRX2TS Sel_D_Q_reg_0_ ( .D(n406), .CK(FS_Module_net3634763), .RN(n400), 
        .Q(FSM_selector_D) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_6_ ( .D(
        Add_Subt_Sgf_module_S_to_D[6]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n434), .Q(
        Add_Subt_result[6]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_1_ ( .D(
        Add_Subt_Sgf_module_S_to_D[1]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n433), .Q(
        Add_Subt_result[1]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_4_ ( .D(
        Add_Subt_Sgf_module_S_to_D[4]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n433), .Q(
        Add_Subt_result[4]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_23_ ( .D(
        Add_Subt_Sgf_module_S_to_D[23]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1106), .Q(
        Add_Subt_result[23]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_11_ ( .D(
        Add_Subt_Sgf_module_S_to_D[11]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1108), .Q(
        Add_Subt_result[11]) );
  DFFRX2TS XRegister_Q_reg_28_ ( .D(Data_X[28]), .CK(YRegister_net3634673), 
        .RN(n1098), .QN(n1094) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_9_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[9]), .CK(clk), .RN(n1105), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[35]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_5_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[5]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[31]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_3_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[3]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[29]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_7_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[7]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[33]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_4_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[4]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[30]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_2_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[2]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[28]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_6_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[6]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[32]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_8_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[8]), .CK(clk), .RN(n1104), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[34]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_2_ ( .D(n1127), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1111), .Q(
        Sgf_normalized_result[2]) );
  DFFRX1TS Exp_Operation_Module_exp_result_Q_reg_1_ ( .D(
        Exp_Operation_Module_Data_S[1]), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1108), .Q(
        exp_oper_result[1]) );
  DFFRX1TS Exp_Operation_Module_exp_result_Q_reg_2_ ( .D(
        Exp_Operation_Module_Data_S[2]), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1097), .Q(
        exp_oper_result[2]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_4_ ( .D(n1121), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1111), .Q(
        Sgf_normalized_result[4]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_5_ ( .D(n1125), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1102), .Q(
        Sgf_normalized_result[5]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_6_ ( .D(n1129), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1103), .Q(
        Sgf_normalized_result[6]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_3_ ( .D(n1131), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1111), .Q(
        Sgf_normalized_result[3]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_7_ ( .D(n1133), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n434), .Q(
        Sgf_normalized_result[7]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_8_ ( .D(n1135), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n433), .Q(
        Sgf_normalized_result[8]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_9_ ( .D(n1137), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1106), .Q(
        Sgf_normalized_result[9]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_10_ ( .D(n1139), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1108), .Q(
        Sgf_normalized_result[10]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_11_ ( .D(n1141), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1107), .Q(
        Sgf_normalized_result[11]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_12_ ( .D(n1143), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1101), .Q(
        Sgf_normalized_result[12]) );
  DFFRX1TS Exp_Operation_Module_Overflow_Q_reg_0_ ( .D(n1117), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1108), .Q(
        overflow_flag) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_21_ ( .D(n1120), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1097), .Q(
        Sgf_normalized_result[21]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_24_ ( .D(n1122), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1107), .Q(
        Sgf_normalized_result[24]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_20_ ( .D(n1124), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1102), .Q(
        Sgf_normalized_result[20]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_23_ ( .D(n1126), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1101), .Q(
        Sgf_normalized_result[23]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_19_ ( .D(n1128), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n434), .Q(
        Sgf_normalized_result[19]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_22_ ( .D(n1130), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n433), .Q(
        Sgf_normalized_result[22]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_18_ ( .D(n1132), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1106), .Q(
        Sgf_normalized_result[18]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_17_ ( .D(n1134), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1103), .Q(
        Sgf_normalized_result[17]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_16_ ( .D(n1136), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1112), .Q(
        Sgf_normalized_result[16]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_15_ ( .D(n1138), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1105), .Q(
        Sgf_normalized_result[15]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_14_ ( .D(n1140), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1114), .Q(
        Sgf_normalized_result[14]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_13_ ( .D(n1142), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1113), .Q(
        Sgf_normalized_result[13]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_0_ ( .D(n1144), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1111), .Q(
        Sgf_normalized_result[0]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_1_ ( .D(n1123), .CK(
        Barrel_Shifter_module_Output_Reg_net3634709), .RN(n1111), .Q(
        Sgf_normalized_result[1]) );
  DFFRX1TS Exp_Operation_Module_exp_result_Q_reg_0_ ( .D(
        Exp_Operation_Module_Data_S[0]), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1107), .Q(
        exp_oper_result[0]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_overflow_Result_Q_reg_0_ ( .D(
        Add_Subt_Sgf_module_S_to_D[26]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1115), .Q(
        add_overflow_flag), .QN(n1023) );
  DFFRX1TS XRegister_Q_reg_31_ ( .D(Data_X[31]), .CK(YRegister_net3634673), 
        .RN(n1098), .Q(intDX[31]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_22_ ( .D(
        Add_Subt_Sgf_module_S_to_D[22]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n434), .Q(
        Add_Subt_result[22]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_24_ ( .D(
        Add_Subt_Sgf_module_S_to_D[24]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1103), .Q(
        Add_Subt_result[24]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_15_ ( .D(
        Add_Subt_Sgf_module_S_to_D[15]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1097), .Q(
        Add_Subt_result[15]) );
  DFFRX2TS YRegister_Q_reg_12_ ( .D(Data_Y[12]), .CK(YRegister_net3634673), 
        .RN(n1114), .Q(intDY[12]), .QN(n1038) );
  DFFRXLTS Exp_Operation_Module_Underflow_Q_reg_0_ ( .D(n401), .CK(
        Exp_Operation_Module_exp_result_net3634727), .RN(n1104), .Q(
        underflow_flag), .QN(n1090) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_21_ ( .D(
        Add_Subt_Sgf_module_S_to_D[21]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3634709), .RN(n1111), .Q(
        Add_Subt_result[21]), .QN(n1046) );
  ADDFX1TS DP_OP_45J177_125_5354_U24 ( .A(DP_OP_45J177_125_5354_n53), .B(
        S_A_S_Oper_A[3]), .CI(DP_OP_45J177_125_5354_n24), .CO(
        DP_OP_45J177_125_5354_n23), .S(Add_Subt_Sgf_module_S_to_D[3]) );
  CMPR32X2TS DP_OP_45J177_125_5354_U26 ( .A(DP_OP_45J177_125_5354_n55), .B(
        S_A_S_Oper_A[1]), .C(DP_OP_45J177_125_5354_n26), .CO(
        DP_OP_45J177_125_5354_n25), .S(Add_Subt_Sgf_module_S_to_D[1]) );
  DFFRX4TS FS_Module_state_reg_reg_0_ ( .D(FS_Module_state_next[0]), .CK(
        FS_Module_net3634763), .RN(n1111), .Q(FS_Module_state_reg[0]) );
  DFFRX2TS Sel_B_Q_reg_1_ ( .D(n404), .CK(FS_Module_net3634763), .RN(n400), 
        .Q(FSM_selector_B[1]), .QN(n437) );
  CMPR32X2TS DP_OP_42J177_122_8048_U8 ( .A(DP_OP_42J177_122_8048_n19), .B(
        S_Oper_A_exp[1]), .C(DP_OP_42J177_122_8048_n8), .CO(
        DP_OP_42J177_122_8048_n7), .S(Exp_Operation_Module_Data_S[1]) );
  CMPR32X2TS DP_OP_42J177_122_8048_U7 ( .A(DP_OP_42J177_122_8048_n18), .B(
        S_Oper_A_exp[2]), .C(DP_OP_42J177_122_8048_n7), .CO(
        DP_OP_42J177_122_8048_n6), .S(Exp_Operation_Module_Data_S[2]) );
  NOR2X4TS U648 ( .A(overflow_flag), .B(underflow_flag), .Y(n991) );
  NOR2X1TS U649 ( .A(n927), .B(n477), .Y(n781) );
  OAI33X1TS U650 ( .A0(sign_final_result), .A1(r_mode[0]), .A2(n439), .B0(n436), .B1(n438), .B2(r_mode[1]), .Y(n440) );
  NOR2X4TS U651 ( .A(n477), .B(n828), .Y(n787) );
  XOR2X1TS U652 ( .A(DP_OP_45J177_125_5354_n1), .B(n1093), .Y(
        Add_Subt_Sgf_module_S_to_D[26]) );
  INVX3TS U653 ( .A(n926), .Y(n973) );
  CLKINVX6TS U654 ( .A(n716), .Y(n635) );
  CLKINVX6TS U655 ( .A(n762), .Y(n631) );
  OAI211XLTS U656 ( .A0(n865), .A1(n921), .B0(n864), .C0(n863), .Y(n870) );
  NOR2BX4TS U657 ( .AN(n560), .B(n820), .Y(n561) );
  CLKINVX3TS U658 ( .A(n533), .Y(n420) );
  NAND2BXLTS U659 ( .AN(intDX[27]), .B(intDY[27]), .Y(n862) );
  AO22XLTS U660 ( .A0(n698), .A1(n756), .B0(n755), .B1(n987), .Y(n422) );
  AO22XLTS U661 ( .A0(n692), .A1(n649), .B0(n984), .B1(n695), .Y(n423) );
  AO22XLTS U662 ( .A0(n698), .A1(n708), .B0(n697), .B1(n987), .Y(n421) );
  CLKINVX6TS U663 ( .A(n973), .Y(n967) );
  AOI211X1TS U664 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[33]), .A1(
        n428), .B0(n617), .C0(n734), .Y(n619) );
  AOI211X1TS U665 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[29]), .A1(
        n428), .B0(n605), .C0(n734), .Y(n607) );
  AOI211X1TS U666 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[32]), .A1(
        n428), .B0(n613), .C0(n734), .Y(n615) );
  AOI211X1TS U667 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[31]), .A1(
        n428), .B0(n609), .C0(n734), .Y(n611) );
  AOI211X1TS U668 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[30]), .A1(
        n428), .B0(n599), .C0(n734), .Y(n603) );
  AOI211X1TS U669 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[28]), .A1(
        n428), .B0(n621), .C0(n734), .Y(n623) );
  MX2X1TS U670 ( .A(DMP[9]), .B(Sgf_normalized_result[11]), .S0(n850), .Y(
        S_A_S_Oper_A[11]) );
  MX2X1TS U671 ( .A(DMP[2]), .B(Sgf_normalized_result[4]), .S0(n850), .Y(
        S_A_S_Oper_A[4]) );
  CLKAND2X2TS U672 ( .A(n849), .B(Sgf_normalized_result[1]), .Y(
        S_A_S_Oper_A[1]) );
  MX2X1TS U673 ( .A(DMP[4]), .B(Sgf_normalized_result[6]), .S0(n850), .Y(
        S_A_S_Oper_A[6]) );
  MX2X1TS U674 ( .A(DMP[1]), .B(Sgf_normalized_result[3]), .S0(n850), .Y(
        S_A_S_Oper_A[3]) );
  MX2X1TS U675 ( .A(DMP[7]), .B(Sgf_normalized_result[9]), .S0(n850), .Y(
        S_A_S_Oper_A[9]) );
  AOI32X1TS U676 ( .A0(n698), .A1(n635), .A2(n985), .B0(n767), .B1(n635), .Y(
        n768) );
  MX2X1TS U677 ( .A(DMP[6]), .B(Sgf_normalized_result[8]), .S0(n850), .Y(
        S_A_S_Oper_A[8]) );
  MX2X1TS U678 ( .A(DMP[5]), .B(Sgf_normalized_result[7]), .S0(n850), .Y(
        S_A_S_Oper_A[7]) );
  MX2X1TS U679 ( .A(DMP[3]), .B(Sgf_normalized_result[5]), .S0(n850), .Y(
        S_A_S_Oper_A[5]) );
  MX2X1TS U680 ( .A(DMP[0]), .B(Sgf_normalized_result[2]), .S0(n850), .Y(
        S_A_S_Oper_A[2]) );
  MX2X1TS U681 ( .A(DMP[10]), .B(Sgf_normalized_result[12]), .S0(n850), .Y(
        S_A_S_Oper_A[12]) );
  MX2X1TS U682 ( .A(DMP[8]), .B(Sgf_normalized_result[10]), .S0(n850), .Y(
        S_A_S_Oper_A[10]) );
  CLKAND2X2TS U683 ( .A(n849), .B(Sgf_normalized_result[0]), .Y(
        S_A_S_Oper_A[0]) );
  OA21XLTS U684 ( .A0(n957), .A1(n596), .B0(n726), .Y(n424) );
  OR2X1TS U685 ( .A(n529), .B(add_overflow_flag), .Y(n425) );
  OR2X1TS U686 ( .A(n437), .B(n932), .Y(n426) );
  OAI221X1TS U687 ( .A0(n1028), .A1(intDY[3]), .B0(n1009), .B1(intDY[2]), .C0(
        n445), .Y(n448) );
  OAI221X1TS U688 ( .A0(n1005), .A1(intDY[20]), .B0(n1040), .B1(intDY[19]), 
        .C0(n459), .Y(n462) );
  INVX1TS U689 ( .A(ready), .Y(n487) );
  INVX2TS U690 ( .A(n425), .Y(n427) );
  OA21XLTS U691 ( .A0(Sgf_normalized_result[1]), .A1(Sgf_normalized_result[0]), 
        .B0(n440), .Y(n785) );
  NAND4X1TS U692 ( .A(n476), .B(n475), .C(n474), .D(n473), .Y(n927) );
  NOR2X2TS U693 ( .A(n698), .B(n988), .Y(n767) );
  AOI222X1TS U694 ( .A0(n731), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[47]), .B0(n561), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[31]), .C1(n582), .Y(n612)
         );
  AOI222X1TS U695 ( .A0(n731), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[44]), .B0(n561), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[28]), .C1(n582), .Y(n624)
         );
  AOI222X1TS U696 ( .A0(n731), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[45]), .B0(n561), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[29]), .C1(n582), .Y(n608)
         );
  AOI222X1TS U697 ( .A0(n731), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[48]), .B0(n561), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[32]), .C1(n582), .Y(n616)
         );
  AOI222X1TS U698 ( .A0(n731), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(n561), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[33]), .C1(n582), .Y(n620)
         );
  AOI222X1TS U699 ( .A0(n731), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[46]), .B0(n561), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[30]), .C1(n582), .Y(n604)
         );
  NOR2X4TS U700 ( .A(n820), .B(n566), .Y(n582) );
  INVX2TS U701 ( .A(n424), .Y(n428) );
  NOR2X2TS U702 ( .A(n533), .B(n932), .Y(n950) );
  BUFX4TS U703 ( .A(n1110), .Y(n1111) );
  INVX2TS U704 ( .A(n426), .Y(n429) );
  AOI32X2TS U705 ( .A0(n671), .A1(n698), .A2(n670), .B0(n685), .B1(n987), .Y(
        n706) );
  CLKINVX3TS U706 ( .A(n973), .Y(n975) );
  NAND2X2TS U707 ( .A(n590), .B(n562), .Y(n559) );
  OAI221XLTS U708 ( .A0(n1036), .A1(intDY[29]), .B0(n1038), .B1(intDX[12]), 
        .C0(n468), .Y(n469) );
  AND2X6TS U709 ( .A(n822), .B(n588), .Y(n698) );
  AOI222X1TS U710 ( .A0(n981), .A1(n635), .B0(n985), .B1(n631), .C0(n984), 
        .C1(n982), .Y(n758) );
  BUFX6TS U711 ( .A(n627), .Y(n982) );
  INVX2TS U712 ( .A(n423), .Y(n430) );
  AOI22X2TS U713 ( .A0(n692), .A1(n668), .B0(n683), .B1(n987), .Y(n754) );
  INVX2TS U714 ( .A(n422), .Y(n431) );
  INVX2TS U715 ( .A(n421), .Y(n432) );
  AO22XLTS U716 ( .A0(n677), .A1(Add_Subt_result[15]), .B0(DmP[8]), .B1(n676), 
        .Y(n662) );
  OAI2BB1X2TS U717 ( .A0N(Add_Subt_result[24]), .A1N(n674), .B0(n652), .Y(n981) );
  NOR2X1TS U718 ( .A(Add_Subt_result[23]), .B(Add_Subt_result[22]), .Y(n851)
         );
  OAI2BB1X2TS U719 ( .A0N(Add_Subt_result[22]), .A1N(n674), .B0(n650), .Y(n985) );
  OAI221X1TS U720 ( .A0(n1047), .A1(intDY[16]), .B0(n1029), .B1(intDY[15]), 
        .C0(n457), .Y(n464) );
  OAI221X1TS U721 ( .A0(n1006), .A1(intDY[24]), .B0(n1030), .B1(intDY[23]), 
        .C0(n465), .Y(n472) );
  AOI221X1TS U722 ( .A0(intDX[30]), .A1(n1012), .B0(intDX[29]), .B1(n1079), 
        .C0(n867), .Y(n869) );
  AOI222X1TS U723 ( .A0(n935), .A1(n730), .B0(FSM_selector_B[1]), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .C0(n933), .C1(n729), 
        .Y(n938) );
  MXI2X2TS U724 ( .A(n1015), .B(n1048), .S0(exp_oper_result[3]), .Y(n933) );
  NAND2X2TS U725 ( .A(n420), .B(exp_oper_result[4]), .Y(n565) );
  OAI221X1TS U726 ( .A0(n1027), .A1(intDY[11]), .B0(n1000), .B1(intDY[10]), 
        .C0(n890), .Y(n454) );
  OAI2BB2XLTS U727 ( .B0(n892), .B1(n899), .A0N(n891), .A1N(n890), .Y(n895) );
  AOI22X2TS U728 ( .A0(n1027), .A1(intDY[11]), .B0(n1000), .B1(intDY[10]), .Y(
        n890) );
  AOI22X2TS U729 ( .A0(n521), .A1(Add_Subt_result[10]), .B0(n841), .B1(
        Add_Subt_result[18]), .Y(n859) );
  NOR2X2TS U730 ( .A(n837), .B(n494), .Y(n521) );
  OAI211X1TS U731 ( .A0(FSM_selector_B[1]), .A1(n1031), .B0(n820), .C0(n595), 
        .Y(n531) );
  NOR2X2TS U732 ( .A(n527), .B(n1023), .Y(n595) );
  OAI211X2TS U733 ( .A0(intDX[12]), .A1(n1038), .B0(n897), .C0(n883), .Y(n899)
         );
  BUFX3TS U734 ( .A(n486), .Y(n433) );
  BUFX3TS U735 ( .A(n486), .Y(n434) );
  BUFX4TS U736 ( .A(n1109), .Y(n1104) );
  BUFX4TS U737 ( .A(n1115), .Y(n1096) );
  BUFX4TS U738 ( .A(n1109), .Y(n1098) );
  AOI211XLTS U739 ( .A0(intDY[16]), .A1(n1047), .B0(n911), .C0(n912), .Y(n903)
         );
  OAI211X2TS U740 ( .A0(intDX[20]), .A1(n1071), .B0(n917), .C0(n902), .Y(n911)
         );
  BUFX4TS U741 ( .A(n787), .Y(n1093) );
  OAI2BB1X2TS U742 ( .A0N(exp_oper_result[0]), .A1N(n1025), .B0(n826), .Y(n634) );
  NOR2X4TS U743 ( .A(n600), .B(n954), .Y(n836) );
  AOI21X2TS U744 ( .A0(FSM_selector_B[0]), .A1(n564), .B0(n563), .Y(n600) );
  NOR4X4TS U745 ( .A(FS_Module_state_reg[0]), .B(FS_Module_state_reg[3]), .C(
        FS_Module_state_reg[2]), .D(n999), .Y(n413) );
  OR2X1TS U746 ( .A(n828), .B(Sgf_normalized_result[2]), .Y(n812) );
  NOR2X4TS U747 ( .A(n1025), .B(FSM_selector_B[1]), .Y(n590) );
  NOR3X1TS U748 ( .A(n1094), .B(n866), .C(intDY[28]), .Y(n867) );
  OAI221X1TS U749 ( .A0(n1094), .A1(intDY[28]), .B0(n1010), .B1(intDY[27]), 
        .C0(n467), .Y(n470) );
  INVX2TS U750 ( .A(n770), .Y(n435) );
  NOR2X2TS U751 ( .A(Add_Subt_result[13]), .B(Add_Subt_result[11]), .Y(n838)
         );
  OAI2BB1X2TS U752 ( .A0N(Add_Subt_result[23]), .A1N(n674), .B0(n648), .Y(n984) );
  AO22XLTS U753 ( .A0(n677), .A1(Add_Subt_result[4]), .B0(DmP[19]), .B1(n676), 
        .Y(n640) );
  NOR2X2TS U754 ( .A(Add_Subt_result[6]), .B(Add_Subt_result[7]), .Y(n518) );
  BUFX6TS U755 ( .A(FSM_selector_D), .Y(n849) );
  BUFX6TS U756 ( .A(FSM_selector_D), .Y(n850) );
  AOI22X2TS U757 ( .A0(n692), .A1(n659), .B0(n649), .B1(n695), .Y(n723) );
  AOI22X2TS U758 ( .A0(n692), .A1(n683), .B0(n682), .B1(n695), .Y(n749) );
  AOI22X2TS U759 ( .A0(n692), .A1(n682), .B0(n659), .B1(n695), .Y(n743) );
  AOI22X2TS U760 ( .A0(n698), .A1(n641), .B0(n756), .B1(n695), .Y(n719) );
  AOI22X2TS U761 ( .A0(n698), .A1(n661), .B0(n641), .B1(n695), .Y(n738) );
  AOI22X2TS U762 ( .A0(n698), .A1(n685), .B0(n684), .B1(n695), .Y(n751) );
  AOI22X2TS U763 ( .A0(n698), .A1(n684), .B0(n663), .B1(n695), .Y(n746) );
  AOI22X2TS U764 ( .A0(n698), .A1(n663), .B0(n651), .B1(n695), .Y(n740) );
  AOI22X2TS U765 ( .A0(n698), .A1(n690), .B0(n679), .B1(n695), .Y(n750) );
  AOI22X2TS U766 ( .A0(n692), .A1(n679), .B0(n661), .B1(n695), .Y(n744) );
  AOI22X2TS U767 ( .A0(n698), .A1(n697), .B0(n696), .B1(n695), .Y(n745) );
  AOI22X2TS U768 ( .A0(n698), .A1(n696), .B0(n645), .B1(n695), .Y(n739) );
  AOI22X2TS U769 ( .A0(n698), .A1(n645), .B0(n653), .B1(n987), .Y(n720) );
  INVX4TS U770 ( .A(n692), .Y(n987) );
  INVX4TS U771 ( .A(n692), .Y(n695) );
  NOR3X1TS U772 ( .A(n840), .B(Add_Subt_result[18]), .C(Add_Subt_result[14]), 
        .Y(n491) );
  AO22XLTS U773 ( .A0(n677), .A1(Add_Subt_result[20]), .B0(DmP[3]), .B1(n676), 
        .Y(n678) );
  NOR2X4TS U774 ( .A(n996), .B(LZA_output[4]), .Y(n560) );
  NOR2X4TS U775 ( .A(LZA_output[3]), .B(LZA_output[4]), .Y(n564) );
  NOR2X2TS U776 ( .A(LZA_output[4]), .B(n820), .Y(n730) );
  OAI221X1TS U777 ( .A0(n1095), .A1(intDY[7]), .B0(n1013), .B1(intDY[6]), .C0(
        n879), .Y(n456) );
  AOI211XLTS U778 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .A1(
        n557), .B0(n941), .C0(n542), .Y(n543) );
  AOI211XLTS U779 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .A1(
        n557), .B0(n941), .C0(n547), .Y(n548) );
  AOI211XLTS U780 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .A1(
        n557), .B0(n941), .C0(n537), .Y(n538) );
  AOI211XLTS U781 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[36]), .A1(
        n557), .B0(n941), .C0(n534), .Y(n535) );
  NOR2XLTS U782 ( .A(n1077), .B(intDX[11]), .Y(n885) );
  OAI21XLTS U783 ( .A0(intDX[15]), .A1(n1086), .B0(intDX[14]), .Y(n893) );
  NOR2XLTS U784 ( .A(n906), .B(intDY[16]), .Y(n907) );
  OAI21XLTS U785 ( .A0(intDX[23]), .A1(n1087), .B0(intDX[22]), .Y(n913) );
  OR2X1TS U786 ( .A(FSM_selector_B[0]), .B(FSM_selector_B[1]), .Y(n533) );
  NOR2XLTS U787 ( .A(n958), .B(n1048), .Y(n599) );
  NOR2XLTS U788 ( .A(n987), .B(n976), .Y(n978) );
  OAI211XLTS U789 ( .A0(n957), .A1(n938), .B0(n937), .C0(n936), .Y(n939) );
  OAI21XLTS U790 ( .A0(FS_Module_state_reg[0]), .A1(n488), .B0(n676), .Y(n407)
         );
  OAI211XLTS U791 ( .A0(n754), .A1(n762), .B0(n681), .C0(n680), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[2]) );
  OAI211XLTS U792 ( .A0(n944), .A1(n954), .B0(n737), .C0(n736), .Y(n1137) );
  XOR2X1TS U793 ( .A(n1116), .B(intDX[31]), .Y(n477) );
  BUFX4TS U794 ( .A(FSM_selector_D), .Y(n828) );
  NOR3X2TS U795 ( .A(FS_Module_state_reg[3]), .B(n999), .C(n1024), .Y(
        FSM_Add_Subt_Sgf_load) );
  NOR2X2TS U796 ( .A(FS_Module_state_reg[1]), .B(n998), .Y(n550) );
  AND3X1TS U797 ( .A(n550), .B(FS_Module_state_reg[0]), .C(
        FS_Module_state_reg[2]), .Y(FSM_Final_Result_load) );
  NOR2X2TS U798 ( .A(FS_Module_state_reg[1]), .B(FS_Module_state_reg[3]), .Y(
        n553) );
  INVX2TS U799 ( .A(FS_Module_state_reg[0]), .Y(n552) );
  NOR2X2TS U800 ( .A(FS_Module_state_reg[2]), .B(n552), .Y(n592) );
  CLKAND2X2TS U801 ( .A(n553), .B(n592), .Y(n411) );
  NAND2X1TS U802 ( .A(FS_Module_state_reg[2]), .B(n553), .Y(n479) );
  INVX2TS U803 ( .A(n479), .Y(n585) );
  NAND2X1TS U804 ( .A(FS_Module_state_reg[0]), .B(n585), .Y(n994) );
  AOI211XLTS U805 ( .A0(FS_Module_state_reg[0]), .A1(FSM_Add_Subt_Sgf_load), 
        .B0(n413), .C0(FSM_Final_Result_load), .Y(n442) );
  NOR3X2TS U806 ( .A(FS_Module_state_reg[0]), .B(FS_Module_state_reg[2]), .C(
        n998), .Y(n846) );
  NAND2X1TS U807 ( .A(FS_Module_state_reg[1]), .B(n846), .Y(n551) );
  INVX2TS U808 ( .A(r_mode[1]), .Y(n439) );
  INVX2TS U809 ( .A(r_mode[0]), .Y(n438) );
  NAND2X1TS U810 ( .A(n592), .B(n550), .Y(n784) );
  NOR2BX1TS U811 ( .AN(n785), .B(n784), .Y(n786) );
  NOR3BXLTS U812 ( .AN(n551), .B(n786), .C(n411), .Y(n441) );
  OAI211XLTS U813 ( .A0(FSM_selector_C), .A1(n994), .B0(n441), .C0(n442), .Y(
        FS_Module_state_next[1]) );
  INVX2TS U814 ( .A(n592), .Y(n443) );
  OAI22X1TS U815 ( .A0(FS_Module_state_reg[0]), .A1(n479), .B0(n999), .B1(n443), .Y(FSM_exp_operation_load_diff) );
  AOI22X1TS U816 ( .A0(intDX[30]), .A1(intDY[30]), .B0(n1012), .B1(n1043), .Y(
        n450) );
  AOI22X1TS U817 ( .A0(n1033), .A1(intDY[1]), .B0(n1008), .B1(intDY[0]), .Y(
        n444) );
  OAI221XLTS U818 ( .A0(n1033), .A1(intDY[1]), .B0(n1008), .B1(intDY[0]), .C0(
        n444), .Y(n449) );
  AOI22X1TS U819 ( .A0(n1028), .A1(intDY[3]), .B0(n1009), .B1(intDY[2]), .Y(
        n445) );
  AOI22X1TS U820 ( .A0(n1011), .A1(intDY[5]), .B0(n1042), .B1(intDY[4]), .Y(
        n446) );
  OAI221XLTS U821 ( .A0(n1011), .A1(intDY[5]), .B0(n1042), .B1(intDY[4]), .C0(
        n446), .Y(n447) );
  NOR4X1TS U822 ( .A(n450), .B(n449), .C(n448), .D(n447), .Y(n476) );
  AOI22X1TS U823 ( .A0(intDY[7]), .A1(n1095), .B0(intDY[6]), .B1(n1013), .Y(
        n879) );
  AOI22X1TS U824 ( .A0(n1003), .A1(intDY[9]), .B0(n1037), .B1(intDY[8]), .Y(
        n451) );
  OAI221XLTS U825 ( .A0(n1003), .A1(intDY[9]), .B0(n1037), .B1(intDY[8]), .C0(
        n451), .Y(n455) );
  AOI22X1TS U826 ( .A0(n1034), .A1(intDY[14]), .B0(n1001), .B1(intDY[13]), .Y(
        n452) );
  OAI221XLTS U827 ( .A0(n1034), .A1(intDY[14]), .B0(n1001), .B1(intDY[13]), 
        .C0(n452), .Y(n453) );
  NOR4X1TS U828 ( .A(n456), .B(n455), .C(n454), .D(n453), .Y(n475) );
  AOI22X1TS U829 ( .A0(n1047), .A1(intDY[16]), .B0(n1029), .B1(intDY[15]), .Y(
        n457) );
  AOI22X1TS U830 ( .A0(n1004), .A1(intDY[18]), .B0(n1039), .B1(intDY[17]), .Y(
        n458) );
  OAI221XLTS U831 ( .A0(n1004), .A1(intDY[18]), .B0(n1039), .B1(intDY[17]), 
        .C0(n458), .Y(n463) );
  AOI22X1TS U832 ( .A0(n1005), .A1(intDY[20]), .B0(n1040), .B1(intDY[19]), .Y(
        n459) );
  AOI22X1TS U833 ( .A0(n1035), .A1(intDY[22]), .B0(n1002), .B1(intDY[21]), .Y(
        n460) );
  OAI221XLTS U834 ( .A0(n1035), .A1(intDY[22]), .B0(n1002), .B1(intDY[21]), 
        .C0(n460), .Y(n461) );
  NOR4X1TS U835 ( .A(n464), .B(n463), .C(n462), .D(n461), .Y(n474) );
  AOI22X1TS U836 ( .A0(n1006), .A1(intDY[24]), .B0(n1030), .B1(intDY[23]), .Y(
        n465) );
  AOI22X1TS U837 ( .A0(n1007), .A1(intDY[26]), .B0(n1041), .B1(intDY[25]), .Y(
        n466) );
  OAI221XLTS U838 ( .A0(n1007), .A1(intDY[26]), .B0(n1041), .B1(intDY[25]), 
        .C0(n466), .Y(n471) );
  AOI22X1TS U839 ( .A0(n1094), .A1(intDY[28]), .B0(n1010), .B1(intDY[27]), .Y(
        n467) );
  AOI22X1TS U840 ( .A0(n1036), .A1(intDY[29]), .B0(n1038), .B1(intDX[12]), .Y(
        n468) );
  NOR4X1TS U841 ( .A(n472), .B(n471), .C(n470), .D(n469), .Y(n473) );
  AOI211XLTS U842 ( .A0(n781), .A1(n413), .B0(n550), .C0(
        FSM_exp_operation_load_diff), .Y(n478) );
  OAI21XLTS U843 ( .A0(FSM_selector_C), .A1(n994), .B0(n478), .Y(
        FS_Module_state_next[2]) );
  NAND3X2TS U844 ( .A(n1024), .B(n552), .C(n553), .Y(n400) );
  AOI21X1TS U845 ( .A0(n592), .A1(FS_Module_state_reg[3]), .B0(n553), .Y(n482)
         );
  NOR3XLTS U846 ( .A(FS_Module_state_reg[0]), .B(FSM_selector_C), .C(n479), 
        .Y(n480) );
  AOI211XLTS U847 ( .A0(FS_Module_state_reg[0]), .A1(n999), .B0(n480), .C0(
        n1023), .Y(n481) );
  NAND3BXLTS U848 ( .AN(n482), .B(n481), .C(n400), .Y(n483) );
  CLKBUFX3TS U849 ( .A(n483), .Y(n1092) );
  AND4X1TS U850 ( .A(Exp_Operation_Module_Data_S[3]), .B(
        Exp_Operation_Module_Data_S[2]), .C(Exp_Operation_Module_Data_S[1]), 
        .D(Exp_Operation_Module_Data_S[0]), .Y(n484) );
  AND4X1TS U851 ( .A(Exp_Operation_Module_Data_S[6]), .B(
        Exp_Operation_Module_Data_S[5]), .C(Exp_Operation_Module_Data_S[4]), 
        .D(n484), .Y(n485) );
  XOR2X1TS U852 ( .A(DP_OP_42J177_122_8048_n1), .B(n1092), .Y(n776) );
  AO21XLTS U853 ( .A0(Exp_Operation_Module_Data_S[7]), .A1(n485), .B0(n776), 
        .Y(n1117) );
  INVX4TS U854 ( .A(rst), .Y(n486) );
  BUFX3TS U855 ( .A(n486), .Y(n1115) );
  BUFX3TS U856 ( .A(n486), .Y(n1105) );
  BUFX3TS U857 ( .A(n486), .Y(n1101) );
  BUFX3TS U858 ( .A(n486), .Y(n1112) );
  BUFX3TS U859 ( .A(n486), .Y(n1113) );
  BUFX3TS U860 ( .A(n486), .Y(n1114) );
  BUFX3TS U861 ( .A(n486), .Y(n1107) );
  BUFX3TS U862 ( .A(n486), .Y(n1102) );
  BUFX3TS U863 ( .A(n486), .Y(n1108) );
  BUFX3TS U864 ( .A(n486), .Y(n1110) );
  BUFX3TS U865 ( .A(n486), .Y(n1103) );
  BUFX3TS U866 ( .A(n1115), .Y(n1100) );
  BUFX3TS U867 ( .A(n486), .Y(n1099) );
  BUFX3TS U868 ( .A(n486), .Y(n1097) );
  BUFX3TS U869 ( .A(n486), .Y(n1109) );
  BUFX3TS U870 ( .A(n486), .Y(n1106) );
  NOR4X1TS U871 ( .A(FS_Module_state_reg[0]), .B(n998), .C(n999), .D(n1024), 
        .Y(ready) );
  OA22X1TS U872 ( .A0(ack_FSM), .A1(n487), .B0(beg_FSM), .B1(n400), .Y(n412)
         );
  INVX2TS U873 ( .A(FSM_Add_Subt_Sgf_load), .Y(n488) );
  BUFX4TS U874 ( .A(n1026), .Y(n676) );
  INVX2TS U875 ( .A(n846), .Y(n848) );
  NOR2XLTS U876 ( .A(FS_Module_state_reg[1]), .B(n848), .Y(FSM_LZA_load) );
  INVX2TS U877 ( .A(Add_Subt_result[0]), .Y(n710) );
  AOI2BB1X1TS U878 ( .A0N(n710), .A1N(Add_Subt_result[1]), .B0(
        Add_Subt_result[2]), .Y(n514) );
  NOR2BX1TS U879 ( .AN(n514), .B(Add_Subt_result[3]), .Y(n502) );
  NOR3X1TS U880 ( .A(Add_Subt_result[21]), .B(Add_Subt_result[20]), .C(
        Add_Subt_result[19]), .Y(n497) );
  INVX2TS U881 ( .A(n497), .Y(n489) );
  NOR2X1TS U882 ( .A(Add_Subt_result[25]), .B(Add_Subt_result[24]), .Y(n855)
         );
  NAND2X1TS U883 ( .A(n855), .B(n851), .Y(n496) );
  NOR2X2TS U884 ( .A(n489), .B(n496), .Y(n841) );
  NOR2XLTS U885 ( .A(Add_Subt_result[15]), .B(Add_Subt_result[16]), .Y(n490)
         );
  NAND2X1TS U886 ( .A(n1018), .B(n490), .Y(n840) );
  NAND2X1TS U887 ( .A(n841), .B(n491), .Y(n837) );
  NAND2X1TS U888 ( .A(n838), .B(n1017), .Y(n494) );
  NOR3X1TS U889 ( .A(Add_Subt_result[9]), .B(Add_Subt_result[10]), .C(
        Add_Subt_result[8]), .Y(n492) );
  NAND2X1TS U890 ( .A(n521), .B(n492), .Y(n517) );
  NAND2X1TS U891 ( .A(n518), .B(n997), .Y(n493) );
  OR2X1TS U892 ( .A(n517), .B(n493), .Y(n499) );
  NOR2X1TS U893 ( .A(n499), .B(Add_Subt_result[4]), .Y(n515) );
  INVX2TS U894 ( .A(n515), .Y(n503) );
  INVX2TS U895 ( .A(n517), .Y(n511) );
  INVX2TS U896 ( .A(n837), .Y(n856) );
  NAND2X1TS U897 ( .A(n856), .B(n494), .Y(n495) );
  OAI211XLTS U898 ( .A0(n497), .A1(n496), .B0(n859), .C0(n495), .Y(n498) );
  AOI31XLTS U899 ( .A0(n511), .A1(n518), .A2(Add_Subt_result[5]), .B0(n498), 
        .Y(n501) );
  INVX2TS U900 ( .A(n499), .Y(n500) );
  CLKAND2X2TS U901 ( .A(n500), .B(Add_Subt_result[4]), .Y(n519) );
  INVX2TS U902 ( .A(n519), .Y(n512) );
  OAI211XLTS U903 ( .A0(n502), .A1(n503), .B0(n501), .C0(n512), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[2]) );
  NOR2X1TS U904 ( .A(n503), .B(Add_Subt_result[3]), .Y(n522) );
  INVX2TS U905 ( .A(n522), .Y(n524) );
  INVX2TS U906 ( .A(n841), .Y(n853) );
  NOR4BX1TS U907 ( .AN(Add_Subt_result[14]), .B(n853), .C(Add_Subt_result[18]), 
        .D(n840), .Y(n504) );
  AOI31X1TS U908 ( .A0(n856), .A1(Add_Subt_result[12]), .A2(n1061), .B0(n504), 
        .Y(n843) );
  AOI21X1TS U909 ( .A0(n1046), .A1(Add_Subt_result[20]), .B0(
        Add_Subt_result[22]), .Y(n505) );
  AOI2BB1XLTS U910 ( .A0N(n505), .A1N(Add_Subt_result[23]), .B0(
        Add_Subt_result[24]), .Y(n506) );
  NOR2XLTS U911 ( .A(n506), .B(Add_Subt_result[25]), .Y(n507) );
  AOI31XLTS U912 ( .A0(n841), .A1(Add_Subt_result[16]), .A2(n1018), .B0(n507), 
        .Y(n509) );
  NAND4XLTS U913 ( .A(n856), .B(n838), .C(Add_Subt_result[8]), .D(n1062), .Y(
        n508) );
  NAND4XLTS U914 ( .A(n843), .B(n859), .C(n509), .D(n508), .Y(n510) );
  AOI31XLTS U915 ( .A0(n511), .A1(Add_Subt_result[6]), .A2(n1089), .B0(n510), 
        .Y(n513) );
  OAI211XLTS U916 ( .A0(n514), .A1(n524), .B0(n513), .C0(n512), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[0]) );
  AOI31XLTS U917 ( .A0(n1062), .A1(n1019), .A2(n997), .B0(Add_Subt_result[10]), 
        .Y(n520) );
  OAI21XLTS U918 ( .A0(Add_Subt_result[3]), .A1(Add_Subt_result[2]), .B0(n515), 
        .Y(n516) );
  OAI21X1TS U919 ( .A0(n518), .A1(n517), .B0(n516), .Y(n860) );
  AOI211XLTS U920 ( .A0(n521), .A1(n520), .B0(n860), .C0(n519), .Y(n523) );
  NAND3XLTS U921 ( .A(n522), .B(Add_Subt_result[1]), .C(n1058), .Y(n844) );
  OAI211XLTS U922 ( .A0(n710), .A1(n524), .B0(n844), .C0(n523), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[4]) );
  NAND2X1TS U923 ( .A(n420), .B(exp_oper_result[3]), .Y(n567) );
  NOR2X2TS U924 ( .A(n567), .B(exp_oper_result[4]), .Y(n831) );
  NOR2XLTS U925 ( .A(n998), .B(n1023), .Y(n526) );
  NAND2X1TS U926 ( .A(FSM_selector_C), .B(n998), .Y(n529) );
  INVX2TS U927 ( .A(n529), .Y(n525) );
  NOR2X2TS U928 ( .A(n526), .B(n525), .Y(n562) );
  INVX2TS U929 ( .A(n590), .Y(n820) );
  NOR2XLTS U930 ( .A(FS_Module_state_reg[3]), .B(FSM_selector_C), .Y(n527) );
  INVX2TS U931 ( .A(n595), .Y(n932) );
  NOR2X2TS U932 ( .A(n820), .B(n932), .Y(n952) );
  INVX2TS U933 ( .A(n952), .Y(n532) );
  NOR2X1TS U934 ( .A(n996), .B(n532), .Y(n597) );
  NOR2X1TS U935 ( .A(n932), .B(n567), .Y(n598) );
  AOI211X4TS U936 ( .A0(n831), .A1(n562), .B0(n597), .C0(n598), .Y(n601) );
  NOR3X1TS U937 ( .A(FSM_selector_B[0]), .B(exp_oper_result[4]), .C(
        exp_oper_result[3]), .Y(n528) );
  NOR2X2TS U938 ( .A(n528), .B(FSM_selector_B[1]), .Y(n596) );
  INVX4TS U939 ( .A(n427), .Y(n954) );
  NOR2X4TS U940 ( .A(n596), .B(n954), .Y(n934) );
  AOI22X1TS U941 ( .A0(n560), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[44]), .B0(n564), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .Y(n541) );
  AOI2BB2XLTS U942 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .B1(
        n934), .A0N(n541), .A1N(n559), .Y(n536) );
  INVX2TS U943 ( .A(n596), .Y(n563) );
  NAND2X1TS U944 ( .A(n562), .B(n563), .Y(n530) );
  OAI211X2TS U945 ( .A0(LZA_output[3]), .A1(n532), .B0(n531), .C0(n530), .Y(
        n557) );
  NAND2X2TS U946 ( .A(n590), .B(LZA_output[4]), .Y(n834) );
  AOI21X4TS U947 ( .A0(n834), .A1(n565), .B0(n932), .Y(n941) );
  AOI22X1TS U948 ( .A0(n560), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(n564), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .Y(n540) );
  NAND2X2TS U949 ( .A(n590), .B(n427), .Y(n930) );
  NAND2X2TS U950 ( .A(n831), .B(n427), .Y(n929) );
  OAI22X1TS U951 ( .A0(n540), .A1(n930), .B0(n1051), .B1(n929), .Y(n534) );
  OAI211XLTS U952 ( .A0(n601), .A1(n1054), .B0(n536), .C0(n535), .Y(n1139) );
  AOI22X1TS U953 ( .A0(n560), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[45]), .B0(n564), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .Y(n546) );
  AOI2BB2XLTS U954 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .B1(
        n934), .A0N(n546), .A1N(n559), .Y(n539) );
  AOI22X1TS U955 ( .A0(n560), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[48]), .B0(n564), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .Y(n545) );
  OAI22X1TS U956 ( .A0(n545), .A1(n930), .B0(n1053), .B1(n929), .Y(n537) );
  OAI211XLTS U957 ( .A0(n601), .A1(n1052), .B0(n539), .C0(n538), .Y(n1141) );
  AOI2BB2XLTS U958 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[36]), .B1(
        n934), .A0N(n540), .A1N(n559), .Y(n544) );
  OAI22X1TS U959 ( .A0(n541), .A1(n930), .B0(n1054), .B1(n929), .Y(n542) );
  OAI211XLTS U960 ( .A0(n601), .A1(n1051), .B0(n544), .C0(n543), .Y(n1138) );
  AOI2BB2XLTS U961 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .B1(
        n934), .A0N(n545), .A1N(n559), .Y(n549) );
  OAI22X1TS U962 ( .A0(n546), .A1(n930), .B0(n1052), .B1(n929), .Y(n547) );
  OAI211XLTS U963 ( .A0(n601), .A1(n1053), .B0(n549), .C0(n548), .Y(n1140) );
  INVX2TS U964 ( .A(n413), .Y(n555) );
  NAND3X1TS U965 ( .A(FS_Module_state_reg[2]), .B(n550), .C(n552), .Y(n995) );
  OAI211X1TS U966 ( .A0(n1026), .A1(n994), .B0(n995), .C0(n551), .Y(n779) );
  AOI21X1TS U967 ( .A0(n553), .A1(n552), .B0(n779), .Y(n554) );
  OAI211XLTS U968 ( .A0(n781), .A1(n555), .B0(n554), .C0(n784), .Y(
        FS_Module_state_next[0]) );
  AOI22X1TS U969 ( .A0(n560), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[47]), .B0(n564), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .Y(n931) );
  AOI22X1TS U970 ( .A0(LZA_output[3]), .A1(n1048), .B0(n1015), .B1(n996), .Y(
        n935) );
  CLKAND2X2TS U971 ( .A(n420), .B(n1032), .Y(n729) );
  OAI22X1TS U972 ( .A0(n601), .A1(n1050), .B0(n938), .B1(n954), .Y(n556) );
  AOI21X1TS U973 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[39]), .A1(
        n557), .B0(n556), .Y(n558) );
  INVX2TS U974 ( .A(n941), .Y(n958) );
  OAI211XLTS U975 ( .A0(n931), .A1(n559), .B0(n558), .C0(n958), .Y(n1142) );
  OAI22X4TS U976 ( .A0(n834), .A1(LZA_output[3]), .B0(exp_oper_result[3]), 
        .B1(n565), .Y(n731) );
  INVX2TS U977 ( .A(n564), .Y(n566) );
  INVX3TS U978 ( .A(n562), .Y(n957) );
  OAI21X4TS U979 ( .A0(n957), .A1(n600), .B0(n932), .Y(n963) );
  AOI22X1TS U980 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .A1(
        n963), .B0(Barrel_Shifter_module_Mux_Array_Data_array[32]), .B1(n934), 
        .Y(n570) );
  INVX2TS U981 ( .A(n929), .Y(n953) );
  INVX2TS U982 ( .A(n565), .Y(n830) );
  AOI21X1TS U983 ( .A0(n590), .A1(n566), .B0(n830), .Y(n568) );
  AOI21X4TS U984 ( .A0(n568), .A1(n567), .B0(n932), .Y(n965) );
  AOI21X1TS U985 ( .A0(n953), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .B0(n965), .Y(n569)
         );
  OAI211XLTS U986 ( .A0(n616), .A1(n954), .B0(n570), .C0(n569), .Y(n1128) );
  AOI22X1TS U987 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .A1(
        n963), .B0(Barrel_Shifter_module_Mux_Array_Data_array[30]), .B1(n934), 
        .Y(n572) );
  AOI21X1TS U988 ( .A0(n953), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .B0(n965), .Y(n571)
         );
  OAI211XLTS U989 ( .A0(n604), .A1(n954), .B0(n572), .C0(n571), .Y(n1120) );
  AOI22X1TS U990 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[49]), .A1(
        n963), .B0(Barrel_Shifter_module_Mux_Array_Data_array[28]), .B1(n934), 
        .Y(n574) );
  AOI21X1TS U991 ( .A0(n953), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .B0(n965), .Y(n573)
         );
  OAI211XLTS U992 ( .A0(n624), .A1(n954), .B0(n574), .C0(n573), .Y(n1126) );
  OAI22X1TS U993 ( .A0(n996), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(LZA_output[3]), 
        .Y(n724) );
  MXI2X2TS U994 ( .A(n1014), .B(n1045), .S0(exp_oper_result[3]), .Y(n949) );
  INVX2TS U995 ( .A(n600), .Y(n829) );
  AOI22X1TS U996 ( .A0(n830), .A1(n949), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[27]), .B1(n829), .Y(n575)
         );
  OAI21X1TS U997 ( .A0(n724), .A1(n834), .B0(n575), .Y(n576) );
  OAI32X1TS U998 ( .A0(n576), .A1(n831), .A2(n561), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[35]), .B1(n576), .Y(n788)
         );
  AOI21X1TS U999 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1(
        n963), .B0(n965), .Y(n577) );
  OAI21XLTS U1000 ( .A0(n788), .A1(n954), .B0(n577), .Y(n1122) );
  AOI22X1TS U1001 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[33]), .A1(
        n934), .B0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .B1(n963), 
        .Y(n579) );
  AOI21X1TS U1002 ( .A0(n953), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .B0(n965), .Y(n578)
         );
  OAI211XLTS U1003 ( .A0(n620), .A1(n954), .B0(n579), .C0(n578), .Y(n1132) );
  AOI22X1TS U1004 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[31]), .A1(
        n934), .B0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .B1(n963), 
        .Y(n581) );
  AOI21X1TS U1005 ( .A0(n953), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .B0(n965), .Y(n580)
         );
  OAI211XLTS U1006 ( .A0(n612), .A1(n954), .B0(n581), .C0(n580), .Y(n1124) );
  AOI22X1TS U1007 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[29]), .A1(
        n934), .B0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .B1(n963), 
        .Y(n584) );
  AOI21X1TS U1008 ( .A0(n953), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .B0(n965), .Y(n583)
         );
  OAI211XLTS U1009 ( .A0(n608), .A1(n954), .B0(n584), .C0(n583), .Y(n1130) );
  NAND2X1TS U1010 ( .A(FSM_selector_C), .B(n585), .Y(n771) );
  OR2X1TS U1011 ( .A(n771), .B(add_overflow_flag), .Y(n709) );
  INVX4TS U1012 ( .A(n709), .Y(n688) );
  OR2X2TS U1013 ( .A(n688), .B(n676), .Y(n711) );
  INVX4TS U1014 ( .A(n711), .Y(n689) );
  NAND2X1TS U1015 ( .A(n689), .B(n1049), .Y(n587) );
  NAND2X1TS U1016 ( .A(n688), .B(n710), .Y(n586) );
  CLKAND2X2TS U1017 ( .A(n587), .B(n586), .Y(n983) );
  INVX2TS U1018 ( .A(n983), .Y(n755) );
  NAND2X1TS U1019 ( .A(n590), .B(LZA_output[2]), .Y(n822) );
  NAND2X1TS U1020 ( .A(n420), .B(exp_oper_result[2]), .Y(n588) );
  BUFX3TS U1021 ( .A(n698), .Y(n692) );
  NAND2X1TS U1022 ( .A(n590), .B(LZA_output[1]), .Y(n824) );
  NAND2X1TS U1023 ( .A(n420), .B(exp_oper_result[1]), .Y(n589) );
  CLKAND2X2TS U1024 ( .A(n824), .B(n589), .Y(n630) );
  INVX2TS U1025 ( .A(n630), .Y(n976) );
  AOI22X1TS U1026 ( .A0(n590), .A1(LZA_output[0]), .B0(FSM_selector_B[1]), 
        .B1(n1025), .Y(n826) );
  NOR2XLTS U1027 ( .A(n976), .B(n634), .Y(n591) );
  BUFX4TS U1028 ( .A(n591), .Y(n986) );
  INVX2TS U1029 ( .A(n986), .Y(n770) );
  NOR2XLTS U1030 ( .A(n987), .B(n770), .Y(n594) );
  NAND3X1TS U1031 ( .A(FS_Module_state_reg[1]), .B(FS_Module_state_reg[3]), 
        .C(n592), .Y(n780) );
  AOI31XLTS U1032 ( .A0(n995), .A1(n780), .A2(n771), .B0(n1023), .Y(n593) );
  INVX2TS U1033 ( .A(n593), .Y(n988) );
  OAI32X1TS U1034 ( .A0(n755), .A1(n987), .A2(n770), .B0(n594), .B1(n988), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[25]) );
  NAND2X1TS U1035 ( .A(n829), .B(n595), .Y(n726) );
  AO22X2TS U1036 ( .A0(n598), .A1(exp_oper_result[4]), .B0(LZA_output[4]), 
        .B1(n597), .Y(n734) );
  INVX2TS U1037 ( .A(n601), .Y(n732) );
  AOI22X1TS U1038 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .A1(
        n836), .B0(Barrel_Shifter_module_Mux_Array_Data_array[38]), .B1(n732), 
        .Y(n602) );
  OAI211XLTS U1039 ( .A0(n604), .A1(n957), .B0(n603), .C0(n602), .Y(n1121) );
  NOR2XLTS U1040 ( .A(n958), .B(n1052), .Y(n605) );
  AOI22X1TS U1041 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .A1(
        n836), .B0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .B1(n732), 
        .Y(n606) );
  OAI211XLTS U1042 ( .A0(n608), .A1(n957), .B0(n607), .C0(n606), .Y(n1131) );
  NOR2XLTS U1043 ( .A(n958), .B(n1050), .Y(n609) );
  AOI22X1TS U1044 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .A1(
        n836), .B0(Barrel_Shifter_module_Mux_Array_Data_array[39]), .B1(n732), 
        .Y(n610) );
  OAI211XLTS U1045 ( .A0(n612), .A1(n957), .B0(n611), .C0(n610), .Y(n1125) );
  NOR2XLTS U1046 ( .A(n958), .B(n1053), .Y(n613) );
  AOI22X1TS U1047 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .A1(
        n836), .B0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .B1(n732), 
        .Y(n614) );
  OAI211XLTS U1048 ( .A0(n616), .A1(n957), .B0(n615), .C0(n614), .Y(n1129) );
  NOR2XLTS U1049 ( .A(n958), .B(n1051), .Y(n617) );
  AOI22X1TS U1050 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .A1(
        n836), .B0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .B1(n732), 
        .Y(n618) );
  OAI211XLTS U1051 ( .A0(n620), .A1(n957), .B0(n619), .C0(n618), .Y(n1133) );
  NOR2XLTS U1052 ( .A(n958), .B(n1054), .Y(n621) );
  AOI22X1TS U1053 ( .A0(n836), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .B1(n732), .Y(n622)
         );
  OAI211XLTS U1054 ( .A0(n624), .A1(n957), .B0(n623), .C0(n622), .Y(n1127) );
  INVX2TS U1055 ( .A(n711), .Y(n674) );
  AOI22X1TS U1056 ( .A0(n688), .A1(Add_Subt_result[10]), .B0(DmP[13]), .B1(
        n676), .Y(n625) );
  OAI2BB1X1TS U1057 ( .A0N(Add_Subt_result[15]), .A1N(n674), .B0(n625), .Y(
        n659) );
  AOI22X1TS U1058 ( .A0(n688), .A1(Add_Subt_result[6]), .B0(DmP[17]), .B1(n676), .Y(n626) );
  OAI21X1TS U1059 ( .A0(n711), .A1(n1060), .B0(n626), .Y(n649) );
  NOR2XLTS U1060 ( .A(n630), .B(n634), .Y(n627) );
  INVX2TS U1061 ( .A(n982), .Y(n701) );
  INVX2TS U1062 ( .A(n709), .Y(n677) );
  AO22XLTS U1063 ( .A0(n677), .A1(Add_Subt_result[12]), .B0(DmP[11]), .B1(
        n1026), .Y(n628) );
  AOI21X1TS U1064 ( .A0(n689), .A1(Add_Subt_result[13]), .B0(n628), .Y(n661)
         );
  AO22XLTS U1065 ( .A0(n688), .A1(Add_Subt_result[8]), .B0(DmP[15]), .B1(n1026), .Y(n629) );
  AOI21X1TS U1066 ( .A0(n689), .A1(Add_Subt_result[17]), .B0(n629), .Y(n641)
         );
  NAND2X2TS U1067 ( .A(n634), .B(n630), .Y(n762) );
  AO22XLTS U1068 ( .A0(n688), .A1(Add_Subt_result[11]), .B0(DmP[12]), .B1(n676), .Y(n632) );
  AOI21X1TS U1069 ( .A0(Add_Subt_result[14]), .A1(n689), .B0(n632), .Y(n663)
         );
  AO22XLTS U1070 ( .A0(n677), .A1(Add_Subt_result[7]), .B0(DmP[16]), .B1(n1026), .Y(n633) );
  AOI21X1TS U1071 ( .A0(Add_Subt_result[18]), .A1(n689), .B0(n633), .Y(n651)
         );
  AOI22X1TS U1072 ( .A0(n986), .A1(n738), .B0(n631), .B1(n740), .Y(n639) );
  NAND2X2TS U1073 ( .A(n976), .B(n634), .Y(n716) );
  AO22XLTS U1074 ( .A0(n688), .A1(Add_Subt_result[9]), .B0(DmP[14]), .B1(n1026), .Y(n636) );
  AOI21X1TS U1075 ( .A0(Add_Subt_result[16]), .A1(n689), .B0(n636), .Y(n645)
         );
  AO22XLTS U1076 ( .A0(n677), .A1(Add_Subt_result[5]), .B0(DmP[18]), .B1(n1026), .Y(n637) );
  AOI21X1TS U1077 ( .A0(Add_Subt_result[20]), .A1(n689), .B0(n637), .Y(n653)
         );
  NAND2X1TS U1078 ( .A(n635), .B(n720), .Y(n638) );
  OAI211XLTS U1079 ( .A0(n723), .A1(n701), .B0(n639), .C0(n638), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[13]) );
  AOI22X1TS U1080 ( .A0(n986), .A1(n740), .B0(n982), .B1(n720), .Y(n643) );
  AOI21X1TS U1081 ( .A0(n689), .A1(Add_Subt_result[21]), .B0(n640), .Y(n756)
         );
  NAND2X1TS U1082 ( .A(n635), .B(n719), .Y(n642) );
  OAI211XLTS U1083 ( .A0(n723), .A1(n762), .B0(n643), .C0(n642), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[14]) );
  AO22XLTS U1084 ( .A0(n688), .A1(Add_Subt_result[13]), .B0(DmP[10]), .B1(n676), .Y(n644) );
  AOI21X1TS U1085 ( .A0(Add_Subt_result[12]), .A1(n689), .B0(n644), .Y(n696)
         );
  AOI22X1TS U1086 ( .A0(n986), .A1(n739), .B0(n631), .B1(n738), .Y(n647) );
  NAND2X1TS U1087 ( .A(n982), .B(n740), .Y(n646) );
  OAI211XLTS U1088 ( .A0(n723), .A1(n716), .B0(n647), .C0(n646), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[12]) );
  AOI22X1TS U1089 ( .A0(n688), .A1(Add_Subt_result[2]), .B0(DmP[21]), .B1(n676), .Y(n648) );
  AOI22X1TS U1090 ( .A0(n688), .A1(Add_Subt_result[3]), .B0(DmP[20]), .B1(n676), .Y(n650) );
  AOI2BB2X2TS U1091 ( .B0(n698), .B1(n651), .A0N(n985), .A1N(n692), .Y(n759)
         );
  AOI22X1TS U1092 ( .A0(n986), .A1(n719), .B0(n631), .B1(n759), .Y(n655) );
  AOI22X1TS U1093 ( .A0(n688), .A1(Add_Subt_result[1]), .B0(DmP[22]), .B1(n676), .Y(n652) );
  AOI2BB2X2TS U1094 ( .B0(n698), .B1(n653), .A0N(n981), .A1N(n698), .Y(n766)
         );
  NAND2X1TS U1095 ( .A(n635), .B(n766), .Y(n654) );
  OAI211XLTS U1096 ( .A0(n430), .A1(n701), .B0(n655), .C0(n654), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[17]) );
  AOI22X1TS U1097 ( .A0(n986), .A1(n720), .B0(n631), .B1(n719), .Y(n657) );
  NAND2X1TS U1098 ( .A(n982), .B(n759), .Y(n656) );
  OAI211XLTS U1099 ( .A0(n430), .A1(n716), .B0(n657), .C0(n656), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[16]) );
  AOI22X1TS U1100 ( .A0(n688), .A1(Add_Subt_result[14]), .B0(DmP[9]), .B1(n676), .Y(n658) );
  OAI2BB1X1TS U1101 ( .A0N(Add_Subt_result[11]), .A1N(n674), .B0(n658), .Y(
        n682) );
  AO22XLTS U1102 ( .A0(n677), .A1(Add_Subt_result[16]), .B0(DmP[7]), .B1(n676), 
        .Y(n660) );
  AOI21X1TS U1103 ( .A0(n689), .A1(Add_Subt_result[9]), .B0(n660), .Y(n679) );
  AOI21X1TS U1104 ( .A0(Add_Subt_result[10]), .A1(n689), .B0(n662), .Y(n684)
         );
  AOI22X1TS U1105 ( .A0(n986), .A1(n744), .B0(n631), .B1(n746), .Y(n665) );
  NAND2X1TS U1106 ( .A(n635), .B(n739), .Y(n664) );
  OAI211XLTS U1107 ( .A0(n743), .A1(n701), .B0(n665), .C0(n664), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[9]) );
  AOI22X1TS U1108 ( .A0(n688), .A1(Add_Subt_result[22]), .B0(DmP[1]), .B1(n676), .Y(n666) );
  OAI2BB1X1TS U1109 ( .A0N(Add_Subt_result[3]), .A1N(n674), .B0(n666), .Y(n668) );
  AOI22X1TS U1110 ( .A0(n688), .A1(Add_Subt_result[18]), .B0(DmP[5]), .B1(n676), .Y(n667) );
  OAI2BB1X1TS U1111 ( .A0N(Add_Subt_result[7]), .A1N(n674), .B0(n667), .Y(n683) );
  AOI22X1TS U1112 ( .A0(n688), .A1(Add_Subt_result[23]), .B0(DmP[0]), .B1(n676), .Y(n671) );
  NAND2X1TS U1113 ( .A(n689), .B(Add_Subt_result[2]), .Y(n670) );
  AO22XLTS U1114 ( .A0(n677), .A1(Add_Subt_result[19]), .B0(DmP[4]), .B1(n676), 
        .Y(n669) );
  AOI21X1TS U1115 ( .A0(Add_Subt_result[6]), .A1(n689), .B0(n669), .Y(n685) );
  NAND2X1TS U1116 ( .A(n688), .B(Add_Subt_result[21]), .Y(n672) );
  OAI2BB1X1TS U1117 ( .A0N(DmP[2]), .A1N(n676), .B0(n672), .Y(n673) );
  AOI21X1TS U1118 ( .A0(n674), .A1(Add_Subt_result[4]), .B0(n673), .Y(n708) );
  AO22XLTS U1119 ( .A0(n677), .A1(Add_Subt_result[17]), .B0(DmP[6]), .B1(n676), 
        .Y(n675) );
  AOI21X1TS U1120 ( .A0(Add_Subt_result[8]), .A1(n689), .B0(n675), .Y(n697) );
  AOI22X1TS U1121 ( .A0(n986), .A1(n706), .B0(n982), .B1(n432), .Y(n681) );
  AOI21X1TS U1122 ( .A0(Add_Subt_result[5]), .A1(n689), .B0(n678), .Y(n690) );
  NAND2X1TS U1123 ( .A(n635), .B(n750), .Y(n680) );
  AOI22X1TS U1124 ( .A0(n986), .A1(n432), .B0(n631), .B1(n750), .Y(n687) );
  NAND2X1TS U1125 ( .A(n982), .B(n751), .Y(n686) );
  OAI211XLTS U1126 ( .A0(n749), .A1(n716), .B0(n687), .C0(n686), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[4]) );
  AOI22X1TS U1127 ( .A0(n631), .A1(n706), .B0(n635), .B1(n432), .Y(n694) );
  AOI22X1TS U1128 ( .A0(n689), .A1(Add_Subt_result[1]), .B0(n688), .B1(
        Add_Subt_result[24]), .Y(n691) );
  AOI22X1TS U1129 ( .A0(n692), .A1(n691), .B0(n690), .B1(n987), .Y(n707) );
  NAND2X1TS U1130 ( .A(n986), .B(n707), .Y(n693) );
  OAI211XLTS U1131 ( .A0(n754), .A1(n701), .B0(n694), .C0(n693), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[1]) );
  AOI22X1TS U1132 ( .A0(n986), .A1(n750), .B0(n631), .B1(n751), .Y(n700) );
  NAND2X1TS U1133 ( .A(n635), .B(n745), .Y(n699) );
  OAI211XLTS U1134 ( .A0(n749), .A1(n701), .B0(n700), .C0(n699), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[5]) );
  AOI22X1TS U1135 ( .A0(n986), .A1(n746), .B0(n982), .B1(n739), .Y(n703) );
  NAND2X1TS U1136 ( .A(n635), .B(n738), .Y(n702) );
  OAI211XLTS U1137 ( .A0(n743), .A1(n762), .B0(n703), .C0(n702), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[10]) );
  AOI22X1TS U1138 ( .A0(n986), .A1(n745), .B0(n631), .B1(n744), .Y(n705) );
  NAND2X1TS U1139 ( .A(n982), .B(n746), .Y(n704) );
  OAI211XLTS U1140 ( .A0(n743), .A1(n716), .B0(n705), .C0(n704), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[8]) );
  AOI22X1TS U1141 ( .A0(n631), .A1(n707), .B0(n982), .B1(n706), .Y(n715) );
  INVX2TS U1142 ( .A(n708), .Y(n713) );
  OAI22X1TS U1143 ( .A0(n711), .A1(n710), .B0(n1049), .B1(n709), .Y(n712) );
  OAI221XLTS U1144 ( .A0(n698), .A1(n713), .B0(n695), .B1(n712), .C0(n986), 
        .Y(n714) );
  OAI211XLTS U1145 ( .A0(n754), .A1(n716), .B0(n715), .C0(n714), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[0]) );
  AOI22X1TS U1146 ( .A0(n986), .A1(n751), .B0(n982), .B1(n745), .Y(n718) );
  NAND2X1TS U1147 ( .A(n635), .B(n744), .Y(n717) );
  OAI211XLTS U1148 ( .A0(n749), .A1(n762), .B0(n718), .C0(n717), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[6]) );
  AOI22X1TS U1149 ( .A0(n631), .A1(n720), .B0(n982), .B1(n719), .Y(n722) );
  NAND2X1TS U1150 ( .A(n635), .B(n759), .Y(n721) );
  OAI211XLTS U1151 ( .A0(n770), .A1(n723), .B0(n722), .C0(n721), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[15]) );
  INVX2TS U1152 ( .A(n724), .Y(n951) );
  AOI222X1TS U1153 ( .A0(n951), .A1(n730), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(FSM_selector_B[1]), .C0(n949), .C1(n729), .Y(n956) );
  AOI222X1TS U1154 ( .A0(n731), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B0(n561), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .C0(n829), .C1(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n955) );
  OAI2BB2XLTS U1155 ( .B0(n957), .B1(n955), .A0N(n732), .A1N(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .Y(n725) );
  AOI211X1TS U1156 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1(
        n941), .B0(n734), .C0(n725), .Y(n728) );
  INVX2TS U1157 ( .A(n726), .Y(n735) );
  NAND2X1TS U1158 ( .A(n735), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n727) );
  OAI211XLTS U1159 ( .A0(n956), .A1(n954), .B0(n728), .C0(n727), .Y(n1135) );
  OAI22X1TS U1160 ( .A0(n996), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(LZA_output[3]), 
        .Y(n835) );
  INVX2TS U1161 ( .A(n835), .Y(n943) );
  MXI2X2TS U1162 ( .A(n1016), .B(n1044), .S0(exp_oper_result[3]), .Y(n942) );
  AOI222X1TS U1163 ( .A0(n943), .A1(n730), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(FSM_selector_B[1]), .C0(n942), .C1(n729), .Y(n944) );
  AOI222X1TS U1164 ( .A0(n731), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(n561), .C0(n829), 
        .C1(Barrel_Shifter_module_Mux_Array_Data_array[35]), .Y(n945) );
  OAI2BB2XLTS U1165 ( .B0(n957), .B1(n945), .A0N(n732), .A1N(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .Y(n733) );
  AOI211X1TS U1166 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[51]), .A1(
        n941), .B0(n734), .C0(n733), .Y(n737) );
  NAND2X1TS U1167 ( .A(Barrel_Shifter_module_Mux_Array_Data_array[35]), .B(
        n735), .Y(n736) );
  AOI22X1TS U1168 ( .A0(n631), .A1(n739), .B0(n982), .B1(n738), .Y(n742) );
  NAND2X1TS U1169 ( .A(n635), .B(n740), .Y(n741) );
  OAI211XLTS U1170 ( .A0(n770), .A1(n743), .B0(n742), .C0(n741), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[11]) );
  AOI22X1TS U1171 ( .A0(n631), .A1(n745), .B0(n982), .B1(n744), .Y(n748) );
  NAND2X1TS U1172 ( .A(n635), .B(n746), .Y(n747) );
  OAI211XLTS U1173 ( .A0(n770), .A1(n749), .B0(n748), .C0(n747), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[7]) );
  AOI22X1TS U1174 ( .A0(n631), .A1(n432), .B0(n982), .B1(n750), .Y(n753) );
  NAND2X1TS U1175 ( .A(n635), .B(n751), .Y(n752) );
  OAI211XLTS U1176 ( .A0(n770), .A1(n754), .B0(n753), .C0(n752), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[3]) );
  AOI22X1TS U1177 ( .A0(n435), .A1(n431), .B0(n767), .B1(n770), .Y(n757) );
  OAI21XLTS U1178 ( .A0(n758), .A1(n987), .B0(n757), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[21]) );
  AOI22X1TS U1179 ( .A0(n986), .A1(n759), .B0(n982), .B1(n766), .Y(n761) );
  NAND2X1TS U1180 ( .A(n635), .B(n431), .Y(n760) );
  OAI211XLTS U1181 ( .A0(n430), .A1(n762), .B0(n761), .C0(n760), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[18]) );
  AOI22X1TS U1182 ( .A0(n982), .A1(n985), .B0(n635), .B1(n984), .Y(n765) );
  AOI22X1TS U1183 ( .A0(n986), .A1(n766), .B0(n631), .B1(n431), .Y(n764) );
  NAND2X1TS U1184 ( .A(n767), .B(n976), .Y(n763) );
  OAI211XLTS U1185 ( .A0(n765), .A1(n987), .B0(n764), .C0(n763), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[20]) );
  AOI22X1TS U1186 ( .A0(n631), .A1(n766), .B0(n982), .B1(n431), .Y(n769) );
  OAI211XLTS U1187 ( .A0(n770), .A1(n430), .B0(n769), .C0(n768), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[19]) );
  OAI21X1TS U1188 ( .A0(FS_Module_state_reg[0]), .A1(n771), .B0(n780), .Y(n778) );
  INVX2TS U1189 ( .A(n778), .Y(n773) );
  OR4X2TS U1190 ( .A(Exp_Operation_Module_Data_S[2]), .B(
        Exp_Operation_Module_Data_S[1]), .C(Exp_Operation_Module_Data_S[0]), 
        .D(n773), .Y(n774) );
  OR4X2TS U1191 ( .A(Exp_Operation_Module_Data_S[5]), .B(
        Exp_Operation_Module_Data_S[4]), .C(Exp_Operation_Module_Data_S[3]), 
        .D(n774), .Y(n775) );
  OR4X2TS U1192 ( .A(n776), .B(Exp_Operation_Module_Data_S[7]), .C(
        Exp_Operation_Module_Data_S[6]), .D(n775), .Y(n777) );
  OAI21XLTS U1193 ( .A0(n1090), .A1(n778), .B0(n777), .Y(n401) );
  NOR4BX1TS U1194 ( .AN(n780), .B(FSM_Add_Subt_Sgf_load), .C(
        FSM_Final_Result_load), .D(n779), .Y(n783) );
  NAND2X1TS U1195 ( .A(n781), .B(n413), .Y(n782) );
  OAI211XLTS U1196 ( .A0(n785), .A1(n784), .B0(n783), .C0(n782), .Y(
        FS_Module_state_next[3]) );
  OR2X1TS U1197 ( .A(n786), .B(n849), .Y(n406) );
  OAI2BB2XLTS U1198 ( .B0(n427), .B1(n788), .A0N(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1N(n836), .Y(n1123)
         );
  NOR2BX1TS U1199 ( .AN(Sgf_normalized_result[25]), .B(n849), .Y(n789) );
  XOR2X1TS U1200 ( .A(n1093), .B(n789), .Y(DP_OP_45J177_125_5354_n31) );
  NOR2BX1TS U1201 ( .AN(Sgf_normalized_result[24]), .B(n849), .Y(n790) );
  XOR2X1TS U1202 ( .A(n1093), .B(n790), .Y(DP_OP_45J177_125_5354_n32) );
  NOR2BX1TS U1203 ( .AN(Sgf_normalized_result[23]), .B(n828), .Y(n791) );
  XOR2X1TS U1204 ( .A(n1093), .B(n791), .Y(DP_OP_45J177_125_5354_n33) );
  NOR2BX1TS U1205 ( .AN(Sgf_normalized_result[22]), .B(n849), .Y(n792) );
  XOR2X1TS U1206 ( .A(n1093), .B(n792), .Y(DP_OP_45J177_125_5354_n34) );
  NOR2BX1TS U1207 ( .AN(Sgf_normalized_result[21]), .B(n849), .Y(n793) );
  XOR2X1TS U1208 ( .A(n1093), .B(n793), .Y(DP_OP_45J177_125_5354_n35) );
  NOR2BX1TS U1209 ( .AN(Sgf_normalized_result[20]), .B(n828), .Y(n794) );
  XOR2X1TS U1210 ( .A(n1093), .B(n794), .Y(DP_OP_45J177_125_5354_n36) );
  NOR2BX1TS U1211 ( .AN(Sgf_normalized_result[19]), .B(n849), .Y(n795) );
  XOR2X1TS U1212 ( .A(n1093), .B(n795), .Y(DP_OP_45J177_125_5354_n37) );
  NOR2BX1TS U1213 ( .AN(Sgf_normalized_result[18]), .B(n849), .Y(n796) );
  XOR2X1TS U1214 ( .A(n1093), .B(n796), .Y(DP_OP_45J177_125_5354_n38) );
  NOR2BX1TS U1215 ( .AN(Sgf_normalized_result[17]), .B(n849), .Y(n797) );
  XOR2X1TS U1216 ( .A(n1093), .B(n797), .Y(DP_OP_45J177_125_5354_n39) );
  NOR2BX1TS U1217 ( .AN(Sgf_normalized_result[16]), .B(n849), .Y(n798) );
  XOR2X1TS U1218 ( .A(n1093), .B(n798), .Y(DP_OP_45J177_125_5354_n40) );
  NOR2BX1TS U1219 ( .AN(Sgf_normalized_result[15]), .B(n849), .Y(n799) );
  XOR2X1TS U1220 ( .A(n1093), .B(n799), .Y(DP_OP_45J177_125_5354_n41) );
  NOR2BX1TS U1221 ( .AN(Sgf_normalized_result[14]), .B(n828), .Y(n800) );
  XOR2X1TS U1222 ( .A(n1093), .B(n800), .Y(DP_OP_45J177_125_5354_n42) );
  NOR2BX1TS U1223 ( .AN(Sgf_normalized_result[13]), .B(n828), .Y(n801) );
  XOR2X1TS U1224 ( .A(n1093), .B(n801), .Y(DP_OP_45J177_125_5354_n43) );
  NOR2BX1TS U1225 ( .AN(Sgf_normalized_result[12]), .B(n828), .Y(n802) );
  XOR2X1TS U1226 ( .A(n1093), .B(n802), .Y(DP_OP_45J177_125_5354_n44) );
  NOR2BX1TS U1227 ( .AN(Sgf_normalized_result[11]), .B(n849), .Y(n803) );
  XOR2X1TS U1228 ( .A(n1093), .B(n803), .Y(DP_OP_45J177_125_5354_n45) );
  NOR2BX1TS U1229 ( .AN(Sgf_normalized_result[10]), .B(n828), .Y(n804) );
  XOR2X1TS U1230 ( .A(n1093), .B(n804), .Y(DP_OP_45J177_125_5354_n46) );
  NOR2BX1TS U1231 ( .AN(Sgf_normalized_result[9]), .B(n828), .Y(n805) );
  XOR2X1TS U1232 ( .A(n1093), .B(n805), .Y(DP_OP_45J177_125_5354_n47) );
  NOR2BX1TS U1233 ( .AN(Sgf_normalized_result[8]), .B(n828), .Y(n806) );
  XOR2X1TS U1234 ( .A(n787), .B(n806), .Y(DP_OP_45J177_125_5354_n48) );
  NOR2BX1TS U1235 ( .AN(Sgf_normalized_result[7]), .B(n828), .Y(n807) );
  XOR2X1TS U1236 ( .A(n787), .B(n807), .Y(DP_OP_45J177_125_5354_n49) );
  NOR2BX1TS U1237 ( .AN(Sgf_normalized_result[6]), .B(n828), .Y(n808) );
  XOR2X1TS U1238 ( .A(n787), .B(n808), .Y(DP_OP_45J177_125_5354_n50) );
  NOR2BX1TS U1239 ( .AN(Sgf_normalized_result[5]), .B(n828), .Y(n809) );
  XOR2X1TS U1240 ( .A(n787), .B(n809), .Y(DP_OP_45J177_125_5354_n51) );
  NOR2BX1TS U1241 ( .AN(Sgf_normalized_result[4]), .B(n828), .Y(n810) );
  XOR2X1TS U1242 ( .A(n787), .B(n810), .Y(DP_OP_45J177_125_5354_n52) );
  NOR2BX1TS U1243 ( .AN(Sgf_normalized_result[3]), .B(n828), .Y(n811) );
  XOR2X1TS U1244 ( .A(n787), .B(n811), .Y(DP_OP_45J177_125_5354_n53) );
  XOR2X1TS U1245 ( .A(n787), .B(n812), .Y(DP_OP_45J177_125_5354_n54) );
  NOR2BX1TS U1246 ( .AN(Sgf_normalized_result[1]), .B(n828), .Y(n813) );
  XOR2X1TS U1247 ( .A(n787), .B(n813), .Y(DP_OP_45J177_125_5354_n55) );
  NOR2BX1TS U1248 ( .AN(Sgf_normalized_result[0]), .B(n828), .Y(n815) );
  XOR2X1TS U1249 ( .A(n787), .B(n815), .Y(DP_OP_45J177_125_5354_n56) );
  CLKAND2X2TS U1250 ( .A(n420), .B(DmP[30]), .Y(n816) );
  XOR2X1TS U1251 ( .A(n1092), .B(n816), .Y(DP_OP_42J177_122_8048_n13) );
  CLKAND2X2TS U1252 ( .A(n420), .B(DmP[29]), .Y(n817) );
  XOR2X1TS U1253 ( .A(n1092), .B(n817), .Y(DP_OP_42J177_122_8048_n14) );
  CLKAND2X2TS U1254 ( .A(n420), .B(DmP[28]), .Y(n818) );
  XOR2X1TS U1255 ( .A(n1092), .B(n818), .Y(DP_OP_42J177_122_8048_n15) );
  OAI2BB1X1TS U1256 ( .A0N(n420), .A1N(DmP[27]), .B0(n834), .Y(n819) );
  XOR2X1TS U1257 ( .A(n1092), .B(n819), .Y(DP_OP_42J177_122_8048_n16) );
  OAI2BB2XLTS U1258 ( .B0(n820), .B1(n996), .A0N(n420), .A1N(DmP[26]), .Y(n821) );
  XOR2X1TS U1259 ( .A(n1092), .B(n821), .Y(DP_OP_42J177_122_8048_n17) );
  OAI2BB1X1TS U1260 ( .A0N(n420), .A1N(DmP[25]), .B0(n822), .Y(n823) );
  XOR2X1TS U1261 ( .A(n1092), .B(n823), .Y(DP_OP_42J177_122_8048_n18) );
  OAI2BB1X1TS U1262 ( .A0N(n420), .A1N(DmP[24]), .B0(n824), .Y(n825) );
  XOR2X1TS U1263 ( .A(n1092), .B(n825), .Y(DP_OP_42J177_122_8048_n19) );
  OAI2BB1X1TS U1264 ( .A0N(DmP[23]), .A1N(n1025), .B0(n826), .Y(n827) );
  XOR2X1TS U1265 ( .A(n1092), .B(n827), .Y(DP_OP_42J177_122_8048_n20) );
  NAND2BXLTS U1266 ( .AN(Sgf_normalized_result[25]), .B(n828), .Y(
        S_A_S_Oper_A[25]) );
  MX2X1TS U1267 ( .A(DMP[22]), .B(Sgf_normalized_result[24]), .S0(n849), .Y(
        S_A_S_Oper_A[24]) );
  MX2X1TS U1268 ( .A(DMP[21]), .B(Sgf_normalized_result[23]), .S0(
        FSM_selector_D), .Y(S_A_S_Oper_A[23]) );
  MX2X1TS U1269 ( .A(DMP[20]), .B(Sgf_normalized_result[22]), .S0(
        FSM_selector_D), .Y(S_A_S_Oper_A[22]) );
  MX2X1TS U1270 ( .A(DMP[19]), .B(Sgf_normalized_result[21]), .S0(
        FSM_selector_D), .Y(S_A_S_Oper_A[21]) );
  MX2X1TS U1271 ( .A(DMP[18]), .B(Sgf_normalized_result[20]), .S0(
        FSM_selector_D), .Y(S_A_S_Oper_A[20]) );
  MX2X1TS U1272 ( .A(DMP[17]), .B(Sgf_normalized_result[19]), .S0(n850), .Y(
        S_A_S_Oper_A[19]) );
  MX2X1TS U1273 ( .A(DMP[16]), .B(Sgf_normalized_result[18]), .S0(n850), .Y(
        S_A_S_Oper_A[18]) );
  MX2X1TS U1274 ( .A(DMP[15]), .B(Sgf_normalized_result[17]), .S0(n850), .Y(
        S_A_S_Oper_A[17]) );
  MX2X1TS U1275 ( .A(DMP[14]), .B(Sgf_normalized_result[16]), .S0(n850), .Y(
        S_A_S_Oper_A[16]) );
  MX2X1TS U1276 ( .A(DMP[13]), .B(Sgf_normalized_result[15]), .S0(n850), .Y(
        S_A_S_Oper_A[15]) );
  MX2X1TS U1277 ( .A(DMP[12]), .B(Sgf_normalized_result[14]), .S0(n850), .Y(
        S_A_S_Oper_A[14]) );
  MX2X1TS U1278 ( .A(DMP[11]), .B(Sgf_normalized_result[13]), .S0(n850), .Y(
        S_A_S_Oper_A[13]) );
  AOI22X1TS U1279 ( .A0(n830), .A1(n942), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[26]), .B1(n829), .Y(n833)
         );
  OAI21XLTS U1280 ( .A0(n831), .A1(n561), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n832) );
  OAI211X1TS U1281 ( .A0(n835), .A1(n834), .B0(n833), .C0(n832), .Y(n962) );
  AO22XLTS U1282 ( .A0(n962), .A1(n954), .B0(n836), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .Y(n1144) );
  AOI21X1TS U1283 ( .A0(n838), .A1(n1056), .B0(n837), .Y(n839) );
  AOI31XLTS U1284 ( .A0(n841), .A1(n840), .A2(n1055), .B0(n839), .Y(n842) );
  NAND3XLTS U1285 ( .A(n844), .B(n843), .C(n842), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[3]) );
  AOI22X1TS U1286 ( .A0(n1025), .A1(n848), .B0(add_overflow_flag), .B1(n846), 
        .Y(n405) );
  NOR3BX1TS U1287 ( .AN(n846), .B(FS_Module_state_reg[1]), .C(
        add_overflow_flag), .Y(n847) );
  AOI21X1TS U1288 ( .A0(n848), .A1(n437), .B0(n847), .Y(n404) );
  MX2X1TS U1289 ( .A(DMP[30]), .B(exp_oper_result[7]), .S0(n849), .Y(
        S_Oper_A_exp[7]) );
  MX2X1TS U1290 ( .A(DMP[29]), .B(exp_oper_result[6]), .S0(n849), .Y(
        S_Oper_A_exp[6]) );
  MX2X1TS U1291 ( .A(DMP[28]), .B(exp_oper_result[5]), .S0(n849), .Y(
        S_Oper_A_exp[5]) );
  MX2X1TS U1292 ( .A(DMP[27]), .B(exp_oper_result[4]), .S0(n849), .Y(
        S_Oper_A_exp[4]) );
  MX2X1TS U1293 ( .A(DMP[26]), .B(exp_oper_result[3]), .S0(n849), .Y(
        S_Oper_A_exp[3]) );
  MX2X1TS U1294 ( .A(DMP[25]), .B(exp_oper_result[2]), .S0(n850), .Y(
        S_Oper_A_exp[2]) );
  MX2X1TS U1295 ( .A(DMP[24]), .B(exp_oper_result[1]), .S0(n849), .Y(
        S_Oper_A_exp[1]) );
  MX2X1TS U1296 ( .A(DMP[23]), .B(exp_oper_result[0]), .S0(n850), .Y(
        S_Oper_A_exp[0]) );
  OAI31X1TS U1297 ( .A0(n1060), .A1(Add_Subt_result[21]), .A2(
        Add_Subt_result[20]), .B0(n851), .Y(n854) );
  OAI211XLTS U1298 ( .A0(Add_Subt_result[15]), .A1(Add_Subt_result[14]), .B0(
        n1018), .C0(n1059), .Y(n852) );
  AOI2BB2XLTS U1299 ( .B0(n855), .B1(n854), .A0N(n853), .A1N(n852), .Y(n858)
         );
  NAND4XLTS U1300 ( .A(n856), .B(Add_Subt_result[11]), .C(n1061), .D(n1017), 
        .Y(n857) );
  NAND4BXLTS U1301 ( .AN(n860), .B(n859), .C(n858), .D(n857), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[1]) );
  BUFX4TS U1302 ( .A(n991), .Y(n993) );
  NAND2BXLTS U1303 ( .AN(exp_oper_result[7]), .B(n993), .Y(
        final_result_ieee_Module_Exp_S_mux[7]) );
  NAND2BXLTS U1304 ( .AN(exp_oper_result[6]), .B(n993), .Y(
        final_result_ieee_Module_Exp_S_mux[6]) );
  NAND2BXLTS U1305 ( .AN(exp_oper_result[5]), .B(n993), .Y(
        final_result_ieee_Module_Exp_S_mux[5]) );
  NAND2X1TS U1306 ( .A(n993), .B(n1032), .Y(
        final_result_ieee_Module_Exp_S_mux[4]) );
  NAND2X1TS U1307 ( .A(n993), .B(n1031), .Y(
        final_result_ieee_Module_Exp_S_mux[3]) );
  NAND2BXLTS U1308 ( .AN(exp_oper_result[2]), .B(n993), .Y(
        final_result_ieee_Module_Exp_S_mux[2]) );
  NAND2BXLTS U1309 ( .AN(exp_oper_result[1]), .B(n993), .Y(
        final_result_ieee_Module_Exp_S_mux[1]) );
  NAND2BXLTS U1310 ( .AN(exp_oper_result[0]), .B(n993), .Y(
        final_result_ieee_Module_Exp_S_mux[0]) );
  XNOR2X1TS U1311 ( .A(add_subt), .B(Data_Y[31]), .Y(n1091) );
  NOR2X1TS U1312 ( .A(n1082), .B(intDX[25]), .Y(n920) );
  NOR2XLTS U1313 ( .A(n920), .B(intDY[24]), .Y(n861) );
  AOI22X1TS U1314 ( .A0(intDX[25]), .A1(n1082), .B0(intDX[24]), .B1(n861), .Y(
        n865) );
  OAI21X1TS U1315 ( .A0(intDX[26]), .A1(n1085), .B0(n862), .Y(n921) );
  NAND3XLTS U1316 ( .A(n1085), .B(n862), .C(intDX[26]), .Y(n864) );
  NAND2BXLTS U1317 ( .AN(intDY[27]), .B(intDX[27]), .Y(n863) );
  NOR2X1TS U1318 ( .A(n1012), .B(intDX[30]), .Y(n868) );
  NOR2X1TS U1319 ( .A(n1079), .B(intDX[29]), .Y(n866) );
  AOI211X1TS U1320 ( .A0(intDY[28]), .A1(n1094), .B0(n868), .C0(n866), .Y(n919) );
  AOI2BB2X1TS U1321 ( .B0(n870), .B1(n919), .A0N(n869), .A1N(n868), .Y(n925)
         );
  NOR2X1TS U1322 ( .A(n1081), .B(intDX[17]), .Y(n906) );
  NAND2BXLTS U1323 ( .AN(intDX[9]), .B(intDY[9]), .Y(n887) );
  OAI211XLTS U1324 ( .A0(intDX[8]), .A1(n1080), .B0(n887), .C0(n890), .Y(n901)
         );
  OAI2BB1X1TS U1325 ( .A0N(n1011), .A1N(intDY[5]), .B0(intDX[4]), .Y(n871) );
  OAI22X1TS U1326 ( .A0(intDY[4]), .A1(n871), .B0(n1011), .B1(intDY[5]), .Y(
        n882) );
  OAI2BB1X1TS U1327 ( .A0N(n1095), .A1N(intDY[7]), .B0(intDX[6]), .Y(n872) );
  OAI22X1TS U1328 ( .A0(intDY[6]), .A1(n872), .B0(n1095), .B1(intDY[7]), .Y(
        n881) );
  OAI21XLTS U1329 ( .A0(intDX[1]), .A1(n1083), .B0(intDX[0]), .Y(n873) );
  OAI2BB2XLTS U1330 ( .B0(intDY[0]), .B1(n873), .A0N(intDX[1]), .A1N(n1083), 
        .Y(n875) );
  NAND2BXLTS U1331 ( .AN(intDX[2]), .B(intDY[2]), .Y(n874) );
  OAI211XLTS U1332 ( .A0(n1084), .A1(intDX[3]), .B0(n875), .C0(n874), .Y(n878)
         );
  OAI21XLTS U1333 ( .A0(intDX[3]), .A1(n1084), .B0(intDX[2]), .Y(n876) );
  AOI2BB2XLTS U1334 ( .B0(intDX[3]), .B1(n1084), .A0N(intDY[2]), .A1N(n876), 
        .Y(n877) );
  AOI222X1TS U1335 ( .A0(intDY[4]), .A1(n1042), .B0(n878), .B1(n877), .C0(
        intDY[5]), .C1(n1011), .Y(n880) );
  OAI32X1TS U1336 ( .A0(n882), .A1(n881), .A2(n880), .B0(n879), .B1(n881), .Y(
        n900) );
  OA22X1TS U1337 ( .A0(n1021), .A1(intDX[14]), .B0(n1086), .B1(intDX[15]), .Y(
        n897) );
  NAND2BXLTS U1338 ( .AN(intDX[13]), .B(intDY[13]), .Y(n883) );
  OAI21XLTS U1339 ( .A0(intDX[13]), .A1(n1068), .B0(intDX[12]), .Y(n884) );
  OAI2BB2XLTS U1340 ( .B0(intDY[12]), .B1(n884), .A0N(intDX[13]), .A1N(n1068), 
        .Y(n896) );
  NOR2XLTS U1341 ( .A(n885), .B(intDY[10]), .Y(n886) );
  AOI22X1TS U1342 ( .A0(intDX[11]), .A1(n1077), .B0(intDX[10]), .B1(n886), .Y(
        n892) );
  NAND2BXLTS U1343 ( .AN(intDY[9]), .B(intDX[9]), .Y(n889) );
  NAND3XLTS U1344 ( .A(n1080), .B(n887), .C(intDX[8]), .Y(n888) );
  AOI21X1TS U1345 ( .A0(n889), .A1(n888), .B0(n899), .Y(n891) );
  OAI2BB2XLTS U1346 ( .B0(intDY[14]), .B1(n893), .A0N(intDX[15]), .A1N(n1086), 
        .Y(n894) );
  AOI211X1TS U1347 ( .A0(n897), .A1(n896), .B0(n895), .C0(n894), .Y(n898) );
  OAI31X1TS U1348 ( .A0(n901), .A1(n900), .A2(n899), .B0(n898), .Y(n904) );
  OA22X1TS U1349 ( .A0(n1022), .A1(intDX[22]), .B0(n1087), .B1(intDX[23]), .Y(
        n917) );
  NAND2BXLTS U1350 ( .AN(intDX[21]), .B(intDY[21]), .Y(n902) );
  NAND2BXLTS U1351 ( .AN(intDX[19]), .B(intDY[19]), .Y(n908) );
  OAI21X1TS U1352 ( .A0(intDX[18]), .A1(n1078), .B0(n908), .Y(n912) );
  NAND3BXLTS U1353 ( .AN(n906), .B(n904), .C(n903), .Y(n924) );
  OAI21XLTS U1354 ( .A0(intDX[21]), .A1(n1069), .B0(intDX[20]), .Y(n905) );
  OAI2BB2XLTS U1355 ( .B0(intDY[20]), .B1(n905), .A0N(intDX[21]), .A1N(n1069), 
        .Y(n916) );
  AOI22X1TS U1356 ( .A0(intDX[17]), .A1(n1081), .B0(intDX[16]), .B1(n907), .Y(
        n910) );
  AOI32X1TS U1357 ( .A0(n1078), .A1(n908), .A2(intDX[18]), .B0(intDX[19]), 
        .B1(n1020), .Y(n909) );
  OAI32X1TS U1358 ( .A0(n912), .A1(n911), .A2(n910), .B0(n909), .B1(n911), .Y(
        n915) );
  OAI2BB2XLTS U1359 ( .B0(intDY[22]), .B1(n913), .A0N(intDX[23]), .A1N(n1087), 
        .Y(n914) );
  AOI211X1TS U1360 ( .A0(n917), .A1(n916), .B0(n915), .C0(n914), .Y(n923) );
  NAND2BXLTS U1361 ( .AN(intDX[24]), .B(intDY[24]), .Y(n918) );
  NAND4BBX1TS U1362 ( .AN(n921), .BN(n920), .C(n919), .D(n918), .Y(n922) );
  AOI32X1TS U1363 ( .A0(n925), .A1(n924), .A2(n923), .B0(n922), .B1(n925), .Y(
        n926) );
  BUFX3TS U1364 ( .A(n973), .Y(n966) );
  BUFX3TS U1365 ( .A(n966), .Y(n971) );
  AOI21X1TS U1366 ( .A0(n927), .A1(n973), .B0(intDX[31]), .Y(n928) );
  AOI21X1TS U1367 ( .A0(n1116), .A1(n971), .B0(n928), .Y(n1118) );
  OAI22X1TS U1368 ( .A0(n931), .A1(n930), .B0(n1050), .B1(n929), .Y(n940) );
  AOI22X1TS U1369 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[38]), .A1(
        n429), .B0(n950), .B1(n933), .Y(n937) );
  AOI22X1TS U1370 ( .A0(n952), .A1(n935), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .B1(n934), .Y(n936)
         );
  OR3X1TS U1371 ( .A(n941), .B(n940), .C(n939), .Y(n1143) );
  AOI22X1TS U1372 ( .A0(n952), .A1(n943), .B0(n950), .B1(n942), .Y(n948) );
  AOI22X1TS U1373 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[43]), .A1(
        n953), .B0(Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(n429), 
        .Y(n947) );
  OA22X1TS U1374 ( .A0(n945), .A1(n954), .B0(n957), .B1(n944), .Y(n946) );
  NAND4XLTS U1375 ( .A(n948), .B(n947), .C(n946), .D(n958), .Y(n1136) );
  AOI22X1TS U1376 ( .A0(n952), .A1(n951), .B0(n950), .B1(n949), .Y(n961) );
  AOI22X1TS U1377 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[43]), .A1(
        n429), .B0(Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(n953), 
        .Y(n960) );
  OA22X1TS U1378 ( .A0(n957), .A1(n956), .B0(n955), .B1(n954), .Y(n959) );
  NAND4XLTS U1379 ( .A(n961), .B(n960), .C(n959), .D(n958), .Y(n1134) );
  AOI22X1TS U1380 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[51]), .A1(
        n963), .B0(n427), .B1(n962), .Y(n964) );
  NAND2BXLTS U1381 ( .AN(n965), .B(n964), .Y(n1119) );
  AOI21X1TS U1382 ( .A0(n436), .A1(n1090), .B0(overflow_flag), .Y(
        final_result_ieee_Module_Sign_S_mux) );
  INVX4TS U1383 ( .A(n973), .Y(n970) );
  BUFX3TS U1384 ( .A(n973), .Y(n972) );
  AOI22X1TS U1385 ( .A0(n970), .A1(n1088), .B0(n1008), .B1(n972), .Y(
        Oper_Start_in_module_intm[0]) );
  INVX4TS U1386 ( .A(n973), .Y(n968) );
  BUFX3TS U1387 ( .A(n966), .Y(n974) );
  AOI22X1TS U1388 ( .A0(n968), .A1(n1083), .B0(n1033), .B1(n974), .Y(
        Oper_Start_in_module_intm[1]) );
  AOI22X1TS U1389 ( .A0(n970), .A1(n1070), .B0(n1009), .B1(n972), .Y(
        Oper_Start_in_module_intm[2]) );
  AOI22X1TS U1390 ( .A0(n968), .A1(n1084), .B0(n1028), .B1(n971), .Y(
        Oper_Start_in_module_intm[3]) );
  BUFX3TS U1391 ( .A(n973), .Y(n969) );
  AOI22X1TS U1392 ( .A0(n967), .A1(n1066), .B0(n1042), .B1(n969), .Y(
        Oper_Start_in_module_intm[4]) );
  AOI22X1TS U1393 ( .A0(n967), .A1(n1057), .B0(n1011), .B1(n973), .Y(
        Oper_Start_in_module_intm[5]) );
  AOI22X1TS U1394 ( .A0(n970), .A1(n1075), .B0(n1013), .B1(n969), .Y(
        Oper_Start_in_module_intm[6]) );
  AOI22X1TS U1395 ( .A0(n967), .A1(n1072), .B0(n1095), .B1(n974), .Y(
        Oper_Start_in_module_intm[7]) );
  AOI22X1TS U1396 ( .A0(n968), .A1(n1080), .B0(n1037), .B1(n966), .Y(
        Oper_Start_in_module_intm[8]) );
  AOI22X1TS U1397 ( .A0(n967), .A1(n1073), .B0(n1003), .B1(n966), .Y(
        Oper_Start_in_module_intm[9]) );
  AOI22X1TS U1398 ( .A0(n967), .A1(n1076), .B0(n1000), .B1(n966), .Y(
        Oper_Start_in_module_intm[10]) );
  AOI22X1TS U1399 ( .A0(n967), .A1(n1077), .B0(n1027), .B1(n966), .Y(
        Oper_Start_in_module_intm[11]) );
  AOI22X1TS U1400 ( .A0(n967), .A1(n1038), .B0(n1065), .B1(n966), .Y(
        Oper_Start_in_module_intm[12]) );
  AOI22X1TS U1401 ( .A0(n967), .A1(n1068), .B0(n1001), .B1(n966), .Y(
        Oper_Start_in_module_intm[13]) );
  AOI22X1TS U1402 ( .A0(n967), .A1(n1021), .B0(n1034), .B1(n966), .Y(
        Oper_Start_in_module_intm[14]) );
  AOI22X1TS U1403 ( .A0(n967), .A1(n1086), .B0(n1029), .B1(n966), .Y(
        Oper_Start_in_module_intm[15]) );
  AOI22X1TS U1404 ( .A0(n967), .A1(n1064), .B0(n1047), .B1(n966), .Y(
        Oper_Start_in_module_intm[16]) );
  AOI22X1TS U1405 ( .A0(n967), .A1(n1081), .B0(n1039), .B1(n966), .Y(
        Oper_Start_in_module_intm[17]) );
  AOI22X1TS U1406 ( .A0(n967), .A1(n1078), .B0(n1004), .B1(n971), .Y(
        Oper_Start_in_module_intm[18]) );
  AOI22X1TS U1407 ( .A0(n967), .A1(n1020), .B0(n1040), .B1(n971), .Y(
        Oper_Start_in_module_intm[19]) );
  AOI22X1TS U1408 ( .A0(n967), .A1(n1071), .B0(n1005), .B1(n971), .Y(
        Oper_Start_in_module_intm[20]) );
  AOI22X1TS U1409 ( .A0(n967), .A1(n1069), .B0(n1002), .B1(n971), .Y(
        Oper_Start_in_module_intm[21]) );
  AOI22X1TS U1410 ( .A0(n967), .A1(n1022), .B0(n1035), .B1(n971), .Y(
        Oper_Start_in_module_intm[22]) );
  AOI22X1TS U1411 ( .A0(n967), .A1(n1087), .B0(n1030), .B1(n971), .Y(
        Oper_Start_in_module_intm[23]) );
  AOI22X1TS U1412 ( .A0(n967), .A1(n1067), .B0(n1006), .B1(n971), .Y(
        Oper_Start_in_module_intm[24]) );
  AOI22X1TS U1413 ( .A0(n967), .A1(n1082), .B0(n1041), .B1(n971), .Y(
        Oper_Start_in_module_intm[25]) );
  AOI22X1TS U1414 ( .A0(n968), .A1(n1085), .B0(n1007), .B1(n971), .Y(
        Oper_Start_in_module_intm[26]) );
  AOI22X1TS U1415 ( .A0(n968), .A1(n1074), .B0(n1010), .B1(n971), .Y(
        Oper_Start_in_module_intm[27]) );
  AOI22X1TS U1416 ( .A0(n968), .A1(n1063), .B0(n1094), .B1(n974), .Y(
        Oper_Start_in_module_intm[28]) );
  AOI22X1TS U1417 ( .A0(n968), .A1(n1079), .B0(n1036), .B1(n974), .Y(
        Oper_Start_in_module_intm[29]) );
  AOI22X1TS U1418 ( .A0(n968), .A1(n1012), .B0(n1043), .B1(n974), .Y(
        Oper_Start_in_module_intm[30]) );
  AOI22X1TS U1419 ( .A0(n968), .A1(n1008), .B0(n1088), .B1(n974), .Y(
        Oper_Start_in_module_intM[0]) );
  AOI22X1TS U1420 ( .A0(n968), .A1(n1033), .B0(n1083), .B1(n974), .Y(
        Oper_Start_in_module_intM[1]) );
  AOI22X1TS U1421 ( .A0(n968), .A1(n1009), .B0(n1070), .B1(n974), .Y(
        Oper_Start_in_module_intM[2]) );
  AOI22X1TS U1422 ( .A0(n968), .A1(n1028), .B0(n1084), .B1(n974), .Y(
        Oper_Start_in_module_intM[3]) );
  AOI22X1TS U1423 ( .A0(n968), .A1(n1042), .B0(n1066), .B1(n974), .Y(
        Oper_Start_in_module_intM[4]) );
  AOI22X1TS U1424 ( .A0(n968), .A1(n1011), .B0(n1057), .B1(n974), .Y(
        Oper_Start_in_module_intM[5]) );
  AOI22X1TS U1425 ( .A0(n968), .A1(n1013), .B0(n1075), .B1(n969), .Y(
        Oper_Start_in_module_intM[6]) );
  AOI22X1TS U1426 ( .A0(n968), .A1(n1095), .B0(n1072), .B1(n969), .Y(
        Oper_Start_in_module_intM[7]) );
  AOI22X1TS U1427 ( .A0(n970), .A1(n1037), .B0(n1080), .B1(n969), .Y(
        Oper_Start_in_module_intM[8]) );
  AOI22X1TS U1428 ( .A0(n970), .A1(n1003), .B0(n1073), .B1(n969), .Y(
        Oper_Start_in_module_intM[9]) );
  AOI22X1TS U1429 ( .A0(n970), .A1(n1000), .B0(n1076), .B1(n969), .Y(
        Oper_Start_in_module_intM[10]) );
  AOI22X1TS U1430 ( .A0(n970), .A1(n1027), .B0(n1077), .B1(n969), .Y(
        Oper_Start_in_module_intM[11]) );
  AOI22X1TS U1431 ( .A0(n970), .A1(n1065), .B0(n1038), .B1(n969), .Y(
        Oper_Start_in_module_intM[12]) );
  AOI22X1TS U1432 ( .A0(n970), .A1(n1001), .B0(n1068), .B1(n969), .Y(
        Oper_Start_in_module_intM[13]) );
  AOI22X1TS U1433 ( .A0(n970), .A1(n1034), .B0(n1021), .B1(n969), .Y(
        Oper_Start_in_module_intM[14]) );
  AOI22X1TS U1434 ( .A0(n970), .A1(n1029), .B0(n1086), .B1(n969), .Y(
        Oper_Start_in_module_intM[15]) );
  AOI22X1TS U1435 ( .A0(n970), .A1(n1047), .B0(n1064), .B1(n972), .Y(
        Oper_Start_in_module_intM[16]) );
  AOI22X1TS U1436 ( .A0(n970), .A1(n1039), .B0(n1081), .B1(n972), .Y(
        Oper_Start_in_module_intM[17]) );
  AOI22X1TS U1437 ( .A0(n970), .A1(n1004), .B0(n1078), .B1(n972), .Y(
        Oper_Start_in_module_intM[18]) );
  AOI22X1TS U1438 ( .A0(n970), .A1(n1040), .B0(n1020), .B1(n972), .Y(
        Oper_Start_in_module_intM[19]) );
  AOI22X1TS U1439 ( .A0(n970), .A1(n1005), .B0(n1071), .B1(n972), .Y(
        Oper_Start_in_module_intM[20]) );
  AOI22X1TS U1440 ( .A0(n975), .A1(n1002), .B0(n1069), .B1(n972), .Y(
        Oper_Start_in_module_intM[21]) );
  AOI22X1TS U1441 ( .A0(n975), .A1(n1035), .B0(n1022), .B1(n972), .Y(
        Oper_Start_in_module_intM[22]) );
  AOI22X1TS U1442 ( .A0(n975), .A1(n1030), .B0(n1087), .B1(n972), .Y(
        Oper_Start_in_module_intM[23]) );
  AOI22X1TS U1443 ( .A0(n975), .A1(n1006), .B0(n1067), .B1(n972), .Y(
        Oper_Start_in_module_intM[24]) );
  AOI22X1TS U1444 ( .A0(n975), .A1(n1041), .B0(n1082), .B1(n972), .Y(
        Oper_Start_in_module_intM[25]) );
  AOI22X1TS U1445 ( .A0(n975), .A1(n1007), .B0(n1085), .B1(n973), .Y(
        Oper_Start_in_module_intM[26]) );
  AOI22X1TS U1446 ( .A0(n975), .A1(n1010), .B0(n1074), .B1(n971), .Y(
        Oper_Start_in_module_intM[27]) );
  AOI22X1TS U1447 ( .A0(n975), .A1(n1094), .B0(n1063), .B1(n972), .Y(
        Oper_Start_in_module_intM[28]) );
  AOI22X1TS U1448 ( .A0(n975), .A1(n1036), .B0(n1079), .B1(n973), .Y(
        Oper_Start_in_module_intM[29]) );
  AOI22X1TS U1449 ( .A0(n975), .A1(n1043), .B0(n1012), .B1(n974), .Y(
        Oper_Start_in_module_intM[30]) );
  AOI22X1TS U1450 ( .A0(n435), .A1(n981), .B0(n631), .B1(n983), .Y(n977) );
  OAI22X1TS U1451 ( .A0(n988), .A1(n978), .B0(n977), .B1(n987), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[24]) );
  NOR2XLTS U1452 ( .A(n987), .B(n635), .Y(n980) );
  AOI222X1TS U1453 ( .A0(n984), .A1(n435), .B0(n983), .B1(n982), .C0(n981), 
        .C1(n631), .Y(n979) );
  OAI22X1TS U1454 ( .A0(n988), .A1(n980), .B0(n979), .B1(n987), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[23]) );
  AOI22X1TS U1455 ( .A0(n635), .A1(n983), .B0(n982), .B1(n981), .Y(n990) );
  AOI22X1TS U1456 ( .A0(n435), .A1(n985), .B0(n631), .B1(n984), .Y(n989) );
  AOI32X1TS U1457 ( .A0(n990), .A1(n698), .A2(n989), .B0(n988), .B1(n987), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[22]) );
  CLKAND2X2TS U1458 ( .A(n993), .B(Sgf_normalized_result[2]), .Y(
        final_result_ieee_Module_Sgf_S_mux[0]) );
  CLKAND2X2TS U1459 ( .A(n993), .B(Sgf_normalized_result[3]), .Y(
        final_result_ieee_Module_Sgf_S_mux[1]) );
  CLKAND2X2TS U1460 ( .A(n993), .B(Sgf_normalized_result[4]), .Y(
        final_result_ieee_Module_Sgf_S_mux[2]) );
  CLKAND2X2TS U1461 ( .A(n993), .B(Sgf_normalized_result[5]), .Y(
        final_result_ieee_Module_Sgf_S_mux[3]) );
  CLKAND2X2TS U1462 ( .A(n993), .B(Sgf_normalized_result[6]), .Y(
        final_result_ieee_Module_Sgf_S_mux[4]) );
  CLKAND2X2TS U1463 ( .A(n993), .B(Sgf_normalized_result[7]), .Y(
        final_result_ieee_Module_Sgf_S_mux[5]) );
  CLKAND2X2TS U1464 ( .A(n993), .B(Sgf_normalized_result[8]), .Y(
        final_result_ieee_Module_Sgf_S_mux[6]) );
  CLKAND2X2TS U1465 ( .A(n993), .B(Sgf_normalized_result[9]), .Y(
        final_result_ieee_Module_Sgf_S_mux[7]) );
  CLKAND2X2TS U1466 ( .A(n993), .B(Sgf_normalized_result[10]), .Y(
        final_result_ieee_Module_Sgf_S_mux[8]) );
  CLKAND2X2TS U1467 ( .A(n993), .B(Sgf_normalized_result[11]), .Y(
        final_result_ieee_Module_Sgf_S_mux[9]) );
  CLKAND2X2TS U1468 ( .A(n993), .B(Sgf_normalized_result[12]), .Y(
        final_result_ieee_Module_Sgf_S_mux[10]) );
  CLKAND2X2TS U1469 ( .A(n991), .B(Sgf_normalized_result[13]), .Y(
        final_result_ieee_Module_Sgf_S_mux[11]) );
  CLKAND2X2TS U1470 ( .A(n991), .B(Sgf_normalized_result[14]), .Y(
        final_result_ieee_Module_Sgf_S_mux[12]) );
  CLKAND2X2TS U1471 ( .A(n991), .B(Sgf_normalized_result[15]), .Y(
        final_result_ieee_Module_Sgf_S_mux[13]) );
  CLKAND2X2TS U1472 ( .A(n991), .B(Sgf_normalized_result[16]), .Y(
        final_result_ieee_Module_Sgf_S_mux[14]) );
  CLKAND2X2TS U1473 ( .A(n991), .B(Sgf_normalized_result[17]), .Y(
        final_result_ieee_Module_Sgf_S_mux[15]) );
  CLKAND2X2TS U1474 ( .A(n991), .B(Sgf_normalized_result[18]), .Y(
        final_result_ieee_Module_Sgf_S_mux[16]) );
  CLKAND2X2TS U1475 ( .A(n991), .B(Sgf_normalized_result[19]), .Y(
        final_result_ieee_Module_Sgf_S_mux[17]) );
  CLKAND2X2TS U1476 ( .A(n991), .B(Sgf_normalized_result[20]), .Y(
        final_result_ieee_Module_Sgf_S_mux[18]) );
  CLKAND2X2TS U1477 ( .A(n991), .B(Sgf_normalized_result[21]), .Y(
        final_result_ieee_Module_Sgf_S_mux[19]) );
  CLKAND2X2TS U1478 ( .A(n991), .B(Sgf_normalized_result[22]), .Y(
        final_result_ieee_Module_Sgf_S_mux[20]) );
  CLKAND2X2TS U1479 ( .A(n991), .B(Sgf_normalized_result[23]), .Y(
        final_result_ieee_Module_Sgf_S_mux[21]) );
  CLKAND2X2TS U1480 ( .A(n993), .B(Sgf_normalized_result[24]), .Y(
        final_result_ieee_Module_Sgf_S_mux[22]) );
  NAND2X1TS U1482 ( .A(n995), .B(n994), .Y(FSM_barrel_shifter_load) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule

