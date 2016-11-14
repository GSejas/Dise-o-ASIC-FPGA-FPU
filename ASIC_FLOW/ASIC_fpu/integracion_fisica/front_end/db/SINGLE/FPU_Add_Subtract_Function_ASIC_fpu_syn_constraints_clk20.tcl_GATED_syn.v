/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:03:46 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_FSM_Add_Subtract_38 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W8_37 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W5_36 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
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
         FSM_Final_Result_load, FSM_selector_D, sign_final_result, S_A_S_op,
         FS_Module_net3627177, final_result_ieee_Module_Sign_S_mux,
         YRegister_net3627087, Exp_Operation_Module_exp_result_net3627141,
         Leading_Zero_Detector_Module_Output_Reg_net3627105,
         final_result_ieee_Module_Final_Result_IEEE_net3627087,
         Add_Subt_Sgf_module_Add_Subt_Result_net3627123,
         Oper_Start_in_module_MRegister_net3627159,
         Barrel_Shifter_module_Output_Reg_net3627123, n400, n401, n404, n405,
         n406, n407, n411, n412, n413, DP_OP_42J176_122_8048_n20,
         DP_OP_42J176_122_8048_n19, DP_OP_42J176_122_8048_n18,
         DP_OP_42J176_122_8048_n17, DP_OP_42J176_122_8048_n16,
         DP_OP_42J176_122_8048_n15, DP_OP_42J176_122_8048_n14,
         DP_OP_42J176_122_8048_n13, DP_OP_42J176_122_8048_n8,
         DP_OP_42J176_122_8048_n7, DP_OP_42J176_122_8048_n6,
         DP_OP_42J176_122_8048_n5, DP_OP_42J176_122_8048_n4,
         DP_OP_42J176_122_8048_n3, DP_OP_42J176_122_8048_n2,
         DP_OP_42J176_122_8048_n1, DP_OP_45J176_125_5354_n56,
         DP_OP_45J176_125_5354_n55, DP_OP_45J176_125_5354_n54,
         DP_OP_45J176_125_5354_n53, DP_OP_45J176_125_5354_n52,
         DP_OP_45J176_125_5354_n51, DP_OP_45J176_125_5354_n50,
         DP_OP_45J176_125_5354_n49, DP_OP_45J176_125_5354_n48,
         DP_OP_45J176_125_5354_n47, DP_OP_45J176_125_5354_n46,
         DP_OP_45J176_125_5354_n45, DP_OP_45J176_125_5354_n44,
         DP_OP_45J176_125_5354_n43, DP_OP_45J176_125_5354_n42,
         DP_OP_45J176_125_5354_n41, DP_OP_45J176_125_5354_n40,
         DP_OP_45J176_125_5354_n39, DP_OP_45J176_125_5354_n38,
         DP_OP_45J176_125_5354_n37, DP_OP_45J176_125_5354_n36,
         DP_OP_45J176_125_5354_n35, DP_OP_45J176_125_5354_n34,
         DP_OP_45J176_125_5354_n33, DP_OP_45J176_125_5354_n32,
         DP_OP_45J176_125_5354_n31, DP_OP_45J176_125_5354_n26,
         DP_OP_45J176_125_5354_n25, DP_OP_45J176_125_5354_n24,
         DP_OP_45J176_125_5354_n23, DP_OP_45J176_125_5354_n22,
         DP_OP_45J176_125_5354_n21, DP_OP_45J176_125_5354_n20,
         DP_OP_45J176_125_5354_n19, DP_OP_45J176_125_5354_n18,
         DP_OP_45J176_125_5354_n17, DP_OP_45J176_125_5354_n16,
         DP_OP_45J176_125_5354_n15, DP_OP_45J176_125_5354_n14,
         DP_OP_45J176_125_5354_n13, DP_OP_45J176_125_5354_n12,
         DP_OP_45J176_125_5354_n11, DP_OP_45J176_125_5354_n10,
         DP_OP_45J176_125_5354_n9, DP_OP_45J176_125_5354_n8,
         DP_OP_45J176_125_5354_n7, DP_OP_45J176_125_5354_n6,
         DP_OP_45J176_125_5354_n5, DP_OP_45J176_125_5354_n4,
         DP_OP_45J176_125_5354_n3, DP_OP_45J176_125_5354_n2,
         DP_OP_45J176_125_5354_n1, n420, n421, n422, n423, n424, n425, n426,
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
         n658, n659, n660, n661, n662, n663, n664, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
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
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n845, n846, n847,
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
         n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001,
         n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011,
         n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021,
         n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031,
         n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041,
         n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051,
         n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061,
         n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071,
         n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081,
         n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091,
         n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101,
         n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111,
         n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121,
         n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131,
         n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141,
         n1142, n1143;
  wire   [1:0] FSM_selector_B;
  wire   [31:0] intDX;
  wire   [30:0] intDY;
  wire   [30:0] DMP;
  wire   [30:0] DmP;
  wire   [7:0] exp_oper_result;
  wire   [7:0] S_Oper_A_exp;
  wire   [4:0] LZA_output;
  wire   [25:1] Add_Subt_result;
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

  SNPS_CLOCK_GATE_HIGH_FSM_Add_Subtract_38 FS_Module_clk_gate_state_reg_reg ( 
        .CLK(clk), .EN(n412), .ENCLK(FS_Module_net3627177), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_5 YRegister_clk_gate_Q_reg ( .CLK(clk), .EN(n411), .ENCLK(YRegister_net3627087), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W8_37 Exp_Operation_Module_exp_result_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_exp_operation_load_diff), .ENCLK(
        Exp_Operation_Module_exp_result_net3627141), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W5_36 Leading_Zero_Detector_Module_Output_Reg_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_LZA_load), .ENCLK(
        Leading_Zero_Detector_Module_Output_Reg_net3627105), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_4 final_result_ieee_Module_Final_Result_IEEE_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_Final_Result_load), .ENCLK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_2 Add_Subt_Sgf_module_Add_Subt_Result_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_Add_Subt_Sgf_load), .ENCLK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_6 Oper_Start_in_module_MRegister_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n413), .ENCLK(Oper_Start_in_module_MRegister_net3627159), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_1_3 Barrel_Shifter_module_Output_Reg_clk_gate_Q_reg ( 
        .CLK(clk), .EN(FSM_barrel_shifter_load), .ENCLK(
        Barrel_Shifter_module_Output_Reg_net3627123), .TE(1'b0) );
  DFFRX2TS FS_Module_state_reg_reg_1_ ( .D(FS_Module_state_next[1]), .CK(
        FS_Module_net3627177), .RN(n431), .Q(FS_Module_state_reg[1]), .QN(
        n1025) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_7_ ( .D(
        Exp_Operation_Module_Data_S[7]), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1109), .Q(
        exp_oper_result[7]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_6_ ( .D(
        Exp_Operation_Module_Data_S[6]), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1103), .Q(
        exp_oper_result[6]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_5_ ( .D(
        Exp_Operation_Module_Data_S[5]), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1102), .Q(
        exp_oper_result[5]) );
  DFFRX2TS FS_Module_state_reg_reg_2_ ( .D(FS_Module_state_next[2]), .CK(
        FS_Module_net3627177), .RN(n1098), .Q(FS_Module_state_reg[2]), .QN(
        n1114) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_30_ ( .D(
        Oper_Start_in_module_intM[30]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1108), .Q(DMP[30]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_29_ ( .D(
        Oper_Start_in_module_intM[29]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1110), .Q(DMP[29]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_28_ ( .D(
        Oper_Start_in_module_intM[28]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1101), .Q(DMP[28]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_27_ ( .D(
        Oper_Start_in_module_intM[27]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1104), .Q(DMP[27]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_26_ ( .D(
        Oper_Start_in_module_intM[26]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1106), .Q(DMP[26]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_25_ ( .D(
        Oper_Start_in_module_intM[25]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1095), .Q(DMP[25]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_24_ ( .D(
        Oper_Start_in_module_intM[24]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1111), .Q(DMP[24]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_23_ ( .D(
        Oper_Start_in_module_intM[23]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1102), .Q(DMP[23]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_22_ ( .D(
        Oper_Start_in_module_intM[22]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1111), .Q(DMP[22]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_21_ ( .D(
        Oper_Start_in_module_intM[21]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1097), .Q(DMP[21]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_20_ ( .D(
        Oper_Start_in_module_intM[20]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1103), .Q(DMP[20]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_19_ ( .D(
        Oper_Start_in_module_intM[19]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1101), .Q(DMP[19]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_18_ ( .D(
        Oper_Start_in_module_intM[18]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1102), .Q(DMP[18]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_17_ ( .D(
        Oper_Start_in_module_intM[17]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1104), .Q(DMP[17]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_16_ ( .D(
        Oper_Start_in_module_intM[16]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1106), .Q(DMP[16]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_15_ ( .D(
        Oper_Start_in_module_intM[15]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1095), .Q(DMP[15]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_14_ ( .D(
        Oper_Start_in_module_intM[14]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1111), .Q(DMP[14]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_13_ ( .D(
        Oper_Start_in_module_intM[13]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1111), .Q(DMP[13]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_12_ ( .D(
        Oper_Start_in_module_intM[12]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1097), .Q(DMP[12]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_11_ ( .D(
        Oper_Start_in_module_intM[11]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1098), .Q(DMP[11]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_10_ ( .D(
        Oper_Start_in_module_intM[10]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1108), .Q(DMP[10]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_9_ ( .D(
        Oper_Start_in_module_intM[9]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1109), .Q(DMP[9]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_8_ ( .D(
        Oper_Start_in_module_intM[8]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1110), .Q(DMP[8]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_7_ ( .D(
        Oper_Start_in_module_intM[7]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1103), .Q(DMP[7]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_6_ ( .D(
        Oper_Start_in_module_intM[6]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1101), .Q(DMP[6]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_5_ ( .D(
        Oper_Start_in_module_intM[5]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1102), .Q(DMP[5]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_4_ ( .D(
        Oper_Start_in_module_intM[4]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1104), .Q(DMP[4]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_3_ ( .D(
        Oper_Start_in_module_intM[3]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1095), .Q(DMP[3]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_2_ ( .D(
        Oper_Start_in_module_intM[2]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1107), .Q(DMP[2]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_1_ ( .D(
        Oper_Start_in_module_intM[1]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1107), .Q(DMP[1]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_0_ ( .D(
        Oper_Start_in_module_intM[0]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1107), .Q(DMP[0]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_30_ ( .D(
        Oper_Start_in_module_intm[30]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1104), .Q(DmP[30]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_29_ ( .D(
        Oper_Start_in_module_intm[29]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1106), .Q(DmP[29]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_28_ ( .D(
        Oper_Start_in_module_intm[28]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1095), .Q(DmP[28]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_27_ ( .D(
        Oper_Start_in_module_intm[27]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1111), .Q(DmP[27]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_26_ ( .D(
        Oper_Start_in_module_intm[26]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1097), .Q(DmP[26]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_25_ ( .D(
        Oper_Start_in_module_intm[25]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1098), .Q(DmP[25]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_24_ ( .D(
        Oper_Start_in_module_intm[24]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1109), .Q(DmP[24]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_23_ ( .D(
        Oper_Start_in_module_intm[23]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1102), .Q(DmP[23]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_22_ ( .D(
        Oper_Start_in_module_intm[22]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1096), .Q(DmP[22]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_21_ ( .D(
        Oper_Start_in_module_intm[21]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1096), .Q(DmP[21]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_20_ ( .D(
        Oper_Start_in_module_intm[20]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1096), .Q(DmP[20]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_19_ ( .D(
        Oper_Start_in_module_intm[19]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1098), .Q(DmP[19]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_18_ ( .D(
        Oper_Start_in_module_intm[18]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1097), .Q(DmP[18]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_17_ ( .D(
        Oper_Start_in_module_intm[17]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1111), .Q(DmP[17]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_16_ ( .D(
        Oper_Start_in_module_intm[16]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1095), .Q(DmP[16]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_15_ ( .D(
        Oper_Start_in_module_intm[15]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1106), .Q(DmP[15]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_14_ ( .D(
        Oper_Start_in_module_intm[14]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1104), .Q(DmP[14]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_13_ ( .D(
        Oper_Start_in_module_intm[13]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1102), .Q(DmP[13]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_12_ ( .D(
        Oper_Start_in_module_intm[12]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1101), .Q(DmP[12]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_11_ ( .D(
        Oper_Start_in_module_intm[11]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1103), .Q(DmP[11]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_10_ ( .D(
        Oper_Start_in_module_intm[10]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1110), .Q(DmP[10]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_9_ ( .D(
        Oper_Start_in_module_intm[9]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1109), .Q(DmP[9]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_8_ ( .D(
        Oper_Start_in_module_intm[8]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1108), .Q(DmP[8]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_7_ ( .D(
        Oper_Start_in_module_intm[7]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1098), .Q(DmP[7]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_6_ ( .D(
        Oper_Start_in_module_intm[6]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1097), .Q(DmP[6]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_5_ ( .D(
        Oper_Start_in_module_intm[5]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1111), .Q(DmP[5]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_4_ ( .D(
        Oper_Start_in_module_intm[4]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1111), .Q(DmP[4]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_3_ ( .D(
        Oper_Start_in_module_intm[3]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1095), .Q(DmP[3]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_2_ ( .D(
        Oper_Start_in_module_intm[2]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1106), .Q(DmP[2]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_1_ ( .D(
        Oper_Start_in_module_intm[1]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1098), .Q(DmP[1]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_0_ ( .D(
        Oper_Start_in_module_intm[0]), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1097), .Q(DmP[0]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_2_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[2]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3627105), .RN(n1108), .Q(
        LZA_output[2]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_1_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[1]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3627105), .RN(n1110), .Q(
        LZA_output[1]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_0_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[0]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3627105), .RN(n1101), .Q(
        LZA_output[0]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_1_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[1]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[27]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_0_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[0]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[26]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_25_ ( .D(n1118), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1106), .Q(
        Sgf_normalized_result[25]) );
  CMPR32X2TS DP_OP_42J176_122_8048_U6 ( .A(DP_OP_42J176_122_8048_n17), .B(
        S_Oper_A_exp[3]), .C(DP_OP_42J176_122_8048_n6), .CO(
        DP_OP_42J176_122_8048_n5), .S(Exp_Operation_Module_Data_S[3]) );
  CMPR32X2TS DP_OP_42J176_122_8048_U5 ( .A(DP_OP_42J176_122_8048_n16), .B(
        S_Oper_A_exp[4]), .C(DP_OP_42J176_122_8048_n5), .CO(
        DP_OP_42J176_122_8048_n4), .S(Exp_Operation_Module_Data_S[4]) );
  CMPR32X2TS DP_OP_42J176_122_8048_U4 ( .A(DP_OP_42J176_122_8048_n15), .B(
        S_Oper_A_exp[5]), .C(DP_OP_42J176_122_8048_n4), .CO(
        DP_OP_42J176_122_8048_n3), .S(Exp_Operation_Module_Data_S[5]) );
  CMPR32X2TS DP_OP_42J176_122_8048_U3 ( .A(DP_OP_42J176_122_8048_n14), .B(
        S_Oper_A_exp[6]), .C(DP_OP_42J176_122_8048_n3), .CO(
        DP_OP_42J176_122_8048_n2), .S(Exp_Operation_Module_Data_S[6]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U25 ( .A(DP_OP_45J176_125_5354_n54), .B(
        S_A_S_Oper_A[2]), .C(DP_OP_45J176_125_5354_n25), .CO(
        DP_OP_45J176_125_5354_n24), .S(Add_Subt_Sgf_module_S_to_D[2]) );
  DFFSX2TS R_0 ( .D(n1088), .CK(YRegister_net3627087), .SN(n1095), .Q(n1115)
         );
  DFFRX1TS Exp_Operation_Module_Underflow_Q_reg_0_ ( .D(n401), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1100), .Q(
        underflow_flag), .QN(n1087) );
  DFFRX2TS YRegister_Q_reg_23_ ( .D(Data_Y[23]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[23]), .QN(n1084) );
  DFFRX2TS YRegister_Q_reg_15_ ( .D(Data_Y[15]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[15]), .QN(n1083) );
  DFFRX2TS YRegister_Q_reg_3_ ( .D(Data_Y[3]), .CK(YRegister_net3627087), .RN(
        n1095), .Q(intDY[3]), .QN(n1081) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_19_ ( .D(
        Add_Subt_Sgf_module_S_to_D[19]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1107), .Q(
        Add_Subt_result[19]), .QN(n1070) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_16_ ( .D(
        Add_Subt_Sgf_module_S_to_D[16]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1093), .Q(
        Add_Subt_result[16]), .QN(n1069) );
  DFFRX2TS YRegister_Q_reg_5_ ( .D(Data_Y[5]), .CK(YRegister_net3627087), .RN(
        n1106), .Q(intDY[5]), .QN(n1055) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_13_ ( .D(
        Add_Subt_Sgf_module_S_to_D[13]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1099), .Q(
        Add_Subt_result[13]), .QN(n1054) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_10_ ( .D(
        Add_Subt_Sgf_module_S_to_D[10]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[10]), .QN(n1053) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_18_ ( .D(
        Add_Subt_Sgf_module_S_to_D[18]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1099), .Q(
        Add_Subt_result[18]), .QN(n1052) );
  DFFRX2TS XRegister_Q_reg_16_ ( .D(Data_X[16]), .CK(YRegister_net3627087), 
        .RN(n1105), .Q(intDX[16]), .QN(n1046) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_20_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[20]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[46]), .QN(n1044) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_24_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[24]), .CK(clk), .RN(n1093), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[50]), .QN(n1042) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_25_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[25]), .CK(clk), .RN(n430), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[51]), .QN(n1041) );
  DFFRX2TS XRegister_Q_reg_5_ ( .D(Data_X[5]), .CK(YRegister_net3627087), .RN(
        n1096), .QN(n1039) );
  DFFRX2TS FS_Module_state_reg_reg_3_ ( .D(FS_Module_state_next[3]), .CK(
        FS_Module_net3627177), .RN(n431), .Q(FS_Module_state_reg[3]), .QN(
        n1038) );
  DFFRX2TS Exp_Operation_Module_exp_result_Q_reg_4_ ( .D(
        Exp_Operation_Module_Data_S[4]), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1099), .Q(
        exp_oper_result[4]), .QN(n1024) );
  DFFRX2TS Exp_Operation_Module_exp_result_Q_reg_3_ ( .D(
        Exp_Operation_Module_Data_S[3]), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1105), .Q(
        exp_oper_result[3]), .QN(n1022) );
  DFFRX2TS Sel_B_Q_reg_0_ ( .D(n405), .CK(FS_Module_net3627177), .RN(n400), 
        .Q(FSM_selector_B[0]), .QN(n1020) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_16_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[16]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[42]), .QN(n1013) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_17_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[17]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[43]), .QN(n1012) );
  DFFRX2TS YRegister_Q_reg_30_ ( .D(Data_Y[30]), .CK(YRegister_net3627087), 
        .RN(n430), .Q(intDY[30]), .QN(n1010) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_17_ ( .D(
        Add_Subt_Sgf_module_S_to_D[17]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1105), .Q(
        Add_Subt_result[17]), .QN(n1009) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_12_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[12]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[38]), .QN(n1008) );
  DFFRX2TS XRegister_Q_reg_4_ ( .D(Data_X[4]), .CK(YRegister_net3627087), .RN(
        n1096), .Q(intDX[4]), .QN(n1006) );
  DFFRX2TS Leading_Zero_Detector_Module_Output_Reg_Q_reg_3_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[3]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3627105), .RN(n430), .Q(
        LZA_output[3]), .QN(n994) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_31_ ( .D(
        final_result_ieee_Module_Sign_S_mux), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1100), 
        .Q(final_result_ieee[31]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_23_ ( .D(
        final_result_ieee_Module_Exp_S_mux[0]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1100), 
        .Q(final_result_ieee[23]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_24_ ( .D(
        final_result_ieee_Module_Exp_S_mux[1]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1101), 
        .Q(final_result_ieee[24]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_25_ ( .D(
        final_result_ieee_Module_Exp_S_mux[2]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1103), 
        .Q(final_result_ieee[25]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_26_ ( .D(
        final_result_ieee_Module_Exp_S_mux[3]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1110), 
        .Q(final_result_ieee[26]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_27_ ( .D(
        final_result_ieee_Module_Exp_S_mux[4]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1109), 
        .Q(final_result_ieee[27]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_28_ ( .D(
        final_result_ieee_Module_Exp_S_mux[5]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1108), 
        .Q(final_result_ieee[28]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_29_ ( .D(
        final_result_ieee_Module_Exp_S_mux[6]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1098), 
        .Q(final_result_ieee[29]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_30_ ( .D(
        final_result_ieee_Module_Exp_S_mux[7]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1097), 
        .Q(final_result_ieee[30]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_0_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[0]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1111), 
        .Q(final_result_ieee[0]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_1_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[1]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1111), 
        .Q(final_result_ieee[1]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_2_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[2]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1095), 
        .Q(final_result_ieee[2]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_3_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[3]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1106), 
        .Q(final_result_ieee[3]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_4_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[4]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1104), 
        .Q(final_result_ieee[4]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_5_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[5]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1100), 
        .Q(final_result_ieee[5]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_6_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[6]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1092), 
        .Q(final_result_ieee[6]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_7_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[7]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1096), 
        .Q(final_result_ieee[7]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_8_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[8]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1094), 
        .Q(final_result_ieee[8]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_9_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[9]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1107), 
        .Q(final_result_ieee[9]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_10_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[10]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1100), 
        .Q(final_result_ieee[10]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_11_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[11]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1092), 
        .Q(final_result_ieee[11]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_12_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[12]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1096), 
        .Q(final_result_ieee[12]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_13_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[13]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1094), 
        .Q(final_result_ieee[13]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_14_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[14]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1107), 
        .Q(final_result_ieee[14]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_15_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[15]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1100), 
        .Q(final_result_ieee[15]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_16_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[16]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1109), 
        .Q(final_result_ieee[16]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_17_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[17]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1103), 
        .Q(final_result_ieee[17]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_18_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[18]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1110), 
        .Q(final_result_ieee[18]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_19_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[19]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1109), 
        .Q(final_result_ieee[19]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_20_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[20]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1108), 
        .Q(final_result_ieee[20]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_21_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[21]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1098), 
        .Q(final_result_ieee[21]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_22_ ( .D(
        final_result_ieee_Module_Sgf_S_mux[22]), .CK(
        final_result_ieee_Module_Final_Result_IEEE_net3627087), .RN(n1097), 
        .Q(final_result_ieee[22]) );
  DFFRX1TS Exp_Operation_Module_Overflow_Q_reg_0_ ( .D(n1116), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1106), .Q(
        overflow_flag) );
  CMPR32X2TS DP_OP_42J176_122_8048_U9 ( .A(S_Oper_A_exp[0]), .B(n1089), .C(
        DP_OP_42J176_122_8048_n20), .CO(DP_OP_42J176_122_8048_n8), .S(
        Exp_Operation_Module_Data_S[0]) );
  CMPR32X2TS DP_OP_42J176_122_8048_U2 ( .A(DP_OP_42J176_122_8048_n13), .B(
        S_Oper_A_exp[7]), .C(DP_OP_42J176_122_8048_n2), .CO(
        DP_OP_42J176_122_8048_n1), .S(Exp_Operation_Module_Data_S[7]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U9 ( .A(DP_OP_45J176_125_5354_n38), .B(
        S_A_S_Oper_A[18]), .C(DP_OP_45J176_125_5354_n9), .CO(
        DP_OP_45J176_125_5354_n8), .S(Add_Subt_Sgf_module_S_to_D[18]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U11 ( .A(DP_OP_45J176_125_5354_n40), .B(
        S_A_S_Oper_A[16]), .C(DP_OP_45J176_125_5354_n11), .CO(
        DP_OP_45J176_125_5354_n10), .S(Add_Subt_Sgf_module_S_to_D[16]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U15 ( .A(DP_OP_45J176_125_5354_n44), .B(
        S_A_S_Oper_A[12]), .C(DP_OP_45J176_125_5354_n15), .CO(
        DP_OP_45J176_125_5354_n14), .S(Add_Subt_Sgf_module_S_to_D[12]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U17 ( .A(DP_OP_45J176_125_5354_n46), .B(
        S_A_S_Oper_A[10]), .C(DP_OP_45J176_125_5354_n17), .CO(
        DP_OP_45J176_125_5354_n16), .S(Add_Subt_Sgf_module_S_to_D[10]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U19 ( .A(DP_OP_45J176_125_5354_n48), .B(
        S_A_S_Oper_A[8]), .C(DP_OP_45J176_125_5354_n19), .CO(
        DP_OP_45J176_125_5354_n18), .S(Add_Subt_Sgf_module_S_to_D[8]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U21 ( .A(DP_OP_45J176_125_5354_n50), .B(
        S_A_S_Oper_A[6]), .C(DP_OP_45J176_125_5354_n21), .CO(
        DP_OP_45J176_125_5354_n20), .S(Add_Subt_Sgf_module_S_to_D[6]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_2_ ( .D(
        Add_Subt_Sgf_module_S_to_D[2]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[2]), .QN(n1068) );
  DFFRX1TS YRegister_Q_reg_29_ ( .D(Data_Y[29]), .CK(YRegister_net3627087), 
        .RN(n1096), .Q(intDY[29]), .QN(n1076) );
  DFFRX1TS YRegister_Q_reg_28_ ( .D(Data_Y[28]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDY[28]), .QN(n1056) );
  DFFRX1TS YRegister_Q_reg_27_ ( .D(Data_Y[27]), .CK(YRegister_net3627087), 
        .RN(n1107), .Q(intDY[27]), .QN(n1067) );
  DFFRX1TS YRegister_Q_reg_26_ ( .D(Data_Y[26]), .CK(YRegister_net3627087), 
        .RN(n1108), .Q(intDY[26]), .QN(n1082) );
  DFFRX1TS YRegister_Q_reg_25_ ( .D(Data_Y[25]), .CK(YRegister_net3627087), 
        .RN(n1104), .Q(intDY[25]), .QN(n1079) );
  DFFRX1TS YRegister_Q_reg_24_ ( .D(Data_Y[24]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[24]), .QN(n1060) );
  DFFRX1TS YRegister_Q_reg_22_ ( .D(Data_Y[22]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[22]), .QN(n1019) );
  DFFRX1TS YRegister_Q_reg_21_ ( .D(Data_Y[21]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[21]), .QN(n1062) );
  DFFRX1TS YRegister_Q_reg_20_ ( .D(Data_Y[20]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[20]), .QN(n1064) );
  DFFRX1TS YRegister_Q_reg_19_ ( .D(Data_Y[19]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[19]), .QN(n1017) );
  DFFRX1TS YRegister_Q_reg_18_ ( .D(Data_Y[18]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[18]), .QN(n1075) );
  DFFRX1TS YRegister_Q_reg_17_ ( .D(Data_Y[17]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[17]), .QN(n1078) );
  DFFRX1TS YRegister_Q_reg_16_ ( .D(Data_Y[16]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[16]), .QN(n1057) );
  DFFRX1TS YRegister_Q_reg_14_ ( .D(Data_Y[14]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[14]), .QN(n1018) );
  DFFRX1TS YRegister_Q_reg_13_ ( .D(Data_Y[13]), .CK(YRegister_net3627087), 
        .RN(n1092), .Q(intDY[13]), .QN(n1061) );
  DFFRX1TS YRegister_Q_reg_11_ ( .D(Data_Y[11]), .CK(YRegister_net3627087), 
        .RN(n1098), .Q(intDY[11]), .QN(n1074) );
  DFFRX1TS YRegister_Q_reg_10_ ( .D(Data_Y[10]), .CK(YRegister_net3627087), 
        .RN(n1097), .Q(intDY[10]), .QN(n1073) );
  DFFRX1TS YRegister_Q_reg_9_ ( .D(Data_Y[9]), .CK(YRegister_net3627087), .RN(
        n1104), .Q(intDY[9]), .QN(n1066) );
  DFFRX1TS YRegister_Q_reg_8_ ( .D(Data_Y[8]), .CK(YRegister_net3627087), .RN(
        n1102), .Q(intDY[8]), .QN(n1077) );
  DFFRX1TS YRegister_Q_reg_7_ ( .D(Data_Y[7]), .CK(YRegister_net3627087), .RN(
        n1101), .Q(intDY[7]), .QN(n1065) );
  DFFRX1TS YRegister_Q_reg_6_ ( .D(Data_Y[6]), .CK(YRegister_net3627087), .RN(
        n1103), .Q(intDY[6]), .QN(n1072) );
  DFFRX1TS YRegister_Q_reg_4_ ( .D(Data_Y[4]), .CK(YRegister_net3627087), .RN(
        n1110), .Q(intDY[4]), .QN(n1059) );
  DFFRX1TS YRegister_Q_reg_2_ ( .D(Data_Y[2]), .CK(YRegister_net3627087), .RN(
        n1109), .Q(intDY[2]), .QN(n1063) );
  DFFRX1TS YRegister_Q_reg_1_ ( .D(Data_Y[1]), .CK(YRegister_net3627087), .RN(
        n1108), .Q(intDY[1]), .QN(n1080) );
  DFFRX1TS YRegister_Q_reg_0_ ( .D(Data_Y[0]), .CK(YRegister_net3627087), .RN(
        n1094), .Q(intDY[0]), .QN(n1085) );
  DFFRX1TS XRegister_Q_reg_30_ ( .D(Data_X[30]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[30]), .QN(n1040) );
  DFFRX1TS XRegister_Q_reg_29_ ( .D(Data_X[29]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[29]), .QN(n1027) );
  DFFRX1TS XRegister_Q_reg_27_ ( .D(Data_X[27]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[27]), .QN(n1005) );
  DFFRX1TS XRegister_Q_reg_26_ ( .D(Data_X[26]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[26]), .QN(n1002) );
  DFFRX1TS XRegister_Q_reg_25_ ( .D(Data_X[25]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[25]), .QN(n1033) );
  DFFRX1TS XRegister_Q_reg_24_ ( .D(Data_X[24]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[24]), .QN(n1001) );
  DFFRX1TS XRegister_Q_reg_23_ ( .D(Data_X[23]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[23]), .QN(n1037) );
  DFFRX1TS XRegister_Q_reg_22_ ( .D(Data_X[22]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[22]), .QN(n1000) );
  DFFRX1TS XRegister_Q_reg_21_ ( .D(Data_X[21]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[21]), .QN(n1036) );
  DFFRX1TS XRegister_Q_reg_20_ ( .D(Data_X[20]), .CK(YRegister_net3627087), 
        .RN(n1097), .Q(intDX[20]), .QN(n999) );
  DFFRX1TS XRegister_Q_reg_19_ ( .D(Data_X[19]), .CK(YRegister_net3627087), 
        .RN(n1104), .Q(intDX[19]), .QN(n1032) );
  DFFRX1TS XRegister_Q_reg_18_ ( .D(Data_X[18]), .CK(YRegister_net3627087), 
        .RN(n1102), .Q(intDX[18]), .QN(n998) );
  DFFRX1TS XRegister_Q_reg_17_ ( .D(Data_X[17]), .CK(YRegister_net3627087), 
        .RN(n1101), .Q(intDX[17]), .QN(n1031) );
  DFFRX1TS XRegister_Q_reg_15_ ( .D(Data_X[15]), .CK(YRegister_net3627087), 
        .RN(n1103), .Q(intDX[15]), .QN(n1035) );
  DFFRX1TS XRegister_Q_reg_14_ ( .D(Data_X[14]), .CK(YRegister_net3627087), 
        .RN(n1110), .Q(intDX[14]), .QN(n997) );
  DFFRX1TS XRegister_Q_reg_13_ ( .D(Data_X[13]), .CK(YRegister_net3627087), 
        .RN(n1109), .Q(intDX[13]), .QN(n1034) );
  DFFRX1TS XRegister_Q_reg_12_ ( .D(Data_X[12]), .CK(YRegister_net3627087), 
        .RN(n1108), .Q(intDX[12]), .QN(n1058) );
  DFFRX1TS XRegister_Q_reg_11_ ( .D(Data_X[11]), .CK(YRegister_net3627087), 
        .RN(n1111), .Q(intDX[11]), .QN(n1021) );
  DFFRX1TS XRegister_Q_reg_10_ ( .D(Data_X[10]), .CK(YRegister_net3627087), 
        .RN(n1093), .Q(intDX[10]), .QN(n1003) );
  DFFRX1TS XRegister_Q_reg_9_ ( .D(Data_X[9]), .CK(YRegister_net3627087), .RN(
        n1093), .Q(intDX[9]), .QN(n996) );
  DFFRX1TS XRegister_Q_reg_8_ ( .D(Data_X[8]), .CK(YRegister_net3627087), .RN(
        n1096), .Q(intDX[8]), .QN(n1029) );
  DFFRX1TS XRegister_Q_reg_6_ ( .D(Data_X[6]), .CK(YRegister_net3627087), .RN(
        n1096), .Q(intDX[6]), .QN(n1011) );
  DFFRX1TS XRegister_Q_reg_3_ ( .D(Data_X[3]), .CK(YRegister_net3627087), .RN(
        n1096), .Q(intDX[3]), .QN(n1028) );
  DFFRX1TS XRegister_Q_reg_2_ ( .D(Data_X[2]), .CK(YRegister_net3627087), .RN(
        n1096), .Q(intDX[2]), .QN(n1004) );
  DFFRX1TS XRegister_Q_reg_1_ ( .D(Data_X[1]), .CK(YRegister_net3627087), .RN(
        n1096), .Q(intDX[1]), .QN(n1026) );
  DFFRX1TS XRegister_Q_reg_0_ ( .D(Data_X[0]), .CK(YRegister_net3627087), .RN(
        n1096), .Q(intDX[0]), .QN(n1007) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_5_ ( .D(
        Add_Subt_Sgf_module_S_to_D[5]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[5]), .QN(n1016) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_7_ ( .D(
        Add_Subt_Sgf_module_S_to_D[7]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[7]), .QN(n1086) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_8_ ( .D(
        Add_Subt_Sgf_module_S_to_D[8]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[8]), .QN(n995) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_9_ ( .D(
        Add_Subt_Sgf_module_S_to_D[9]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[9]), .QN(n1071) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_22_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[22]), .CK(clk), .RN(n1093), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[48]), .QN(n1050) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_23_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[23]), .CK(clk), .RN(n1093), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[49]), .QN(n1048) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_12_ ( .D(
        Add_Subt_Sgf_module_S_to_D[12]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1099), .Q(
        Add_Subt_result[12]), .QN(n1014) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_21_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[21]), .CK(clk), .RN(n1093), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[47]), .QN(n1047) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_18_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[18]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[44]), .QN(n1051) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_19_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[19]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[45]), .QN(n1049) );
  DFFRX2TS XRegister_Q_reg_7_ ( .D(Data_X[7]), .CK(YRegister_net3627087), .RN(
        n1096), .QN(n1091) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_10_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[10]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[36]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_11_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[11]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[37]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_14_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[14]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[40]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_15_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[15]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[41]) );
  DFFRX2TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_13_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[13]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[39]) );
  DFFRX2TS Leading_Zero_Detector_Module_Output_Reg_Q_reg_4_ ( .D(
        Leading_Zero_Detector_Module_Codec_to_Reg[4]), .CK(
        Leading_Zero_Detector_Module_Output_Reg_net3627105), .RN(n430), .Q(
        LZA_output[4]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_20_ ( .D(
        Add_Subt_Sgf_module_S_to_D[20]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1107), .Q(
        Add_Subt_result[20]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_14_ ( .D(
        Add_Subt_Sgf_module_S_to_D[14]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1107), .Q(
        Add_Subt_result[14]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_3_ ( .D(
        Add_Subt_Sgf_module_S_to_D[3]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[3]) );
  DFFRX2TS Sel_D_Q_reg_0_ ( .D(n406), .CK(FS_Module_net3627177), .RN(n400), 
        .Q(FSM_selector_D), .QN(n421) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_6_ ( .D(
        Add_Subt_Sgf_module_S_to_D[6]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[6]) );
  DFFRX2TS Add_Subt_Sgf_module_Add_overflow_Result_Q_reg_0_ ( .D(
        Add_Subt_Sgf_module_S_to_D[26]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1099), .Q(
        add_overflow_flag), .QN(n1112) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_1_ ( .D(
        Add_Subt_Sgf_module_S_to_D[1]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1105), .Q(
        Add_Subt_result[1]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_4_ ( .D(
        Add_Subt_Sgf_module_S_to_D[4]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .Q(
        Add_Subt_result[4]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_23_ ( .D(
        Add_Subt_Sgf_module_S_to_D[23]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1093), .Q(
        Add_Subt_result[23]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_11_ ( .D(
        Add_Subt_Sgf_module_S_to_D[11]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1099), .Q(
        Add_Subt_result[11]) );
  DFFRX2TS XRegister_Q_reg_28_ ( .D(Data_X[28]), .CK(YRegister_net3627087), 
        .RN(n1094), .QN(n1090) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_3_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[3]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[29]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_2_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[2]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[28]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_9_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[9]), .CK(clk), .RN(n431), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[35]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_8_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[8]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[34]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_5_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[5]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[31]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_7_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[7]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[33]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_4_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[4]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[30]) );
  DFFRX1TS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_6_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[6]), .CK(clk), .RN(n1100), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[32]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_2_ ( .D(n1126), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1107), .Q(
        Sgf_normalized_result[2]) );
  DFFRX1TS Exp_Operation_Module_exp_result_Q_reg_1_ ( .D(
        Exp_Operation_Module_Data_S[1]), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1111), .Q(
        exp_oper_result[1]) );
  DFFRX1TS Exp_Operation_Module_exp_result_Q_reg_2_ ( .D(
        Exp_Operation_Module_Data_S[2]), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1098), .Q(
        exp_oper_result[2]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_21_ ( .D(n1119), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1101), .Q(
        Sgf_normalized_result[21]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_4_ ( .D(n1120), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1107), .Q(
        Sgf_normalized_result[4]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_24_ ( .D(n1121), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1104), .Q(
        Sgf_normalized_result[24]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_20_ ( .D(n1123), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1103), .Q(
        Sgf_normalized_result[20]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_5_ ( .D(n1124), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1101), .Q(
        Sgf_normalized_result[5]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_23_ ( .D(n1125), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1102), .Q(
        Sgf_normalized_result[23]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_19_ ( .D(n1127), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1110), .Q(
        Sgf_normalized_result[19]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_6_ ( .D(n1128), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1103), .Q(
        Sgf_normalized_result[6]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_22_ ( .D(n1129), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1109), .Q(
        Sgf_normalized_result[22]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_3_ ( .D(n1130), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1107), .Q(
        Sgf_normalized_result[3]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_18_ ( .D(n1131), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1108), .Q(
        Sgf_normalized_result[18]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_7_ ( .D(n1132), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1110), .Q(
        Sgf_normalized_result[7]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_17_ ( .D(n1133), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1111), .Q(
        Sgf_normalized_result[17]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_8_ ( .D(n1134), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1109), .Q(
        Sgf_normalized_result[8]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_16_ ( .D(n1135), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1095), .Q(
        Sgf_normalized_result[16]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_9_ ( .D(n1136), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1108), .Q(
        Sgf_normalized_result[9]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_15_ ( .D(n1137), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1106), .Q(
        Sgf_normalized_result[15]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_10_ ( .D(n1138), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1111), .Q(
        Sgf_normalized_result[10]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_14_ ( .D(n1139), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1098), .Q(
        Sgf_normalized_result[14]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_11_ ( .D(n1140), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1097), .Q(
        Sgf_normalized_result[11]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_13_ ( .D(n1141), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1104), .Q(
        Sgf_normalized_result[13]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_12_ ( .D(n1142), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1102), .Q(
        Sgf_normalized_result[12]) );
  DFFRX1TS Exp_Operation_Module_exp_result_Q_reg_0_ ( .D(
        Exp_Operation_Module_Data_S[0]), .CK(
        Exp_Operation_Module_exp_result_net3627141), .RN(n1095), .Q(
        exp_oper_result[0]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_0_ ( .D(n1143), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1107), .Q(
        Sgf_normalized_result[0]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_1_ ( .D(n1122), .CK(
        Barrel_Shifter_module_Output_Reg_net3627123), .RN(n1107), .Q(
        Sgf_normalized_result[1]) );
  DFFRX1TS XRegister_Q_reg_31_ ( .D(Data_X[31]), .CK(YRegister_net3627087), 
        .RN(n1094), .Q(intDX[31]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_0_ ( .D(
        Add_Subt_Sgf_module_S_to_D[0]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n430), .QN(n1113)
         );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_22_ ( .D(
        Add_Subt_Sgf_module_S_to_D[22]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1105), .Q(
        Add_Subt_result[22]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_24_ ( .D(
        Add_Subt_Sgf_module_S_to_D[24]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1093), .Q(
        Add_Subt_result[24]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_15_ ( .D(
        Add_Subt_Sgf_module_S_to_D[15]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1093), .Q(
        Add_Subt_result[15]) );
  DFFRX2TS YRegister_Q_reg_12_ ( .D(Data_Y[12]), .CK(YRegister_net3627087), 
        .RN(n1111), .Q(intDY[12]), .QN(n1030) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_21_ ( .D(
        Add_Subt_Sgf_module_S_to_D[21]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1107), .Q(
        Add_Subt_result[21]), .QN(n1043) );
  DFFRX1TS Oper_Start_in_module_SignRegister_Q_reg_0_ ( .D(n1117), .CK(
        Oper_Start_in_module_MRegister_net3627159), .RN(n1093), .Q(
        sign_final_result), .QN(n1015) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_25_ ( .D(
        Add_Subt_Sgf_module_S_to_D[25]), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n1105), .Q(
        Add_Subt_result[25]), .QN(n1045) );
  ADDFX1TS DP_OP_45J176_125_5354_U27 ( .A(S_A_S_Oper_A[0]), .B(S_A_S_op), .CI(
        DP_OP_45J176_125_5354_n56), .CO(DP_OP_45J176_125_5354_n26), .S(
        Add_Subt_Sgf_module_S_to_D[0]) );
  ADDFX1TS DP_OP_45J176_125_5354_U26 ( .A(DP_OP_45J176_125_5354_n55), .B(
        S_A_S_Oper_A[1]), .CI(DP_OP_45J176_125_5354_n26), .CO(
        DP_OP_45J176_125_5354_n25), .S(Add_Subt_Sgf_module_S_to_D[1]) );
  ADDFX1TS DP_OP_45J176_125_5354_U24 ( .A(DP_OP_45J176_125_5354_n53), .B(
        S_A_S_Oper_A[3]), .CI(DP_OP_45J176_125_5354_n24), .CO(
        DP_OP_45J176_125_5354_n23), .S(Add_Subt_Sgf_module_S_to_D[3]) );
  ADDFX1TS DP_OP_45J176_125_5354_U23 ( .A(DP_OP_45J176_125_5354_n52), .B(
        S_A_S_Oper_A[4]), .CI(DP_OP_45J176_125_5354_n23), .CO(
        DP_OP_45J176_125_5354_n22), .S(Add_Subt_Sgf_module_S_to_D[4]) );
  ADDFX1TS DP_OP_45J176_125_5354_U22 ( .A(DP_OP_45J176_125_5354_n51), .B(
        S_A_S_Oper_A[5]), .CI(DP_OP_45J176_125_5354_n22), .CO(
        DP_OP_45J176_125_5354_n21), .S(Add_Subt_Sgf_module_S_to_D[5]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U20 ( .A(DP_OP_45J176_125_5354_n49), .B(
        S_A_S_Oper_A[7]), .C(DP_OP_45J176_125_5354_n20), .CO(
        DP_OP_45J176_125_5354_n19), .S(Add_Subt_Sgf_module_S_to_D[7]) );
  DFFRX4TS FS_Module_state_reg_reg_0_ ( .D(FS_Module_state_next[0]), .CK(
        FS_Module_net3627177), .RN(n1092), .Q(FS_Module_state_reg[0]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U18 ( .A(DP_OP_45J176_125_5354_n47), .B(
        S_A_S_Oper_A[9]), .C(DP_OP_45J176_125_5354_n18), .CO(
        DP_OP_45J176_125_5354_n17), .S(Add_Subt_Sgf_module_S_to_D[9]) );
  DFFRX2TS Sel_B_Q_reg_1_ ( .D(n404), .CK(FS_Module_net3627177), .RN(n400), 
        .Q(FSM_selector_B[1]), .QN(n438) );
  CMPR32X2TS DP_OP_45J176_125_5354_U16 ( .A(DP_OP_45J176_125_5354_n45), .B(
        S_A_S_Oper_A[11]), .C(DP_OP_45J176_125_5354_n16), .CO(
        DP_OP_45J176_125_5354_n15), .S(Add_Subt_Sgf_module_S_to_D[11]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U14 ( .A(DP_OP_45J176_125_5354_n43), .B(
        S_A_S_Oper_A[13]), .C(DP_OP_45J176_125_5354_n14), .CO(
        DP_OP_45J176_125_5354_n13), .S(Add_Subt_Sgf_module_S_to_D[13]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U13 ( .A(DP_OP_45J176_125_5354_n42), .B(
        S_A_S_Oper_A[14]), .C(DP_OP_45J176_125_5354_n13), .CO(
        DP_OP_45J176_125_5354_n12), .S(Add_Subt_Sgf_module_S_to_D[14]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U12 ( .A(DP_OP_45J176_125_5354_n41), .B(
        S_A_S_Oper_A[15]), .C(DP_OP_45J176_125_5354_n12), .CO(
        DP_OP_45J176_125_5354_n11), .S(Add_Subt_Sgf_module_S_to_D[15]) );
  CMPR32X2TS DP_OP_42J176_122_8048_U8 ( .A(DP_OP_42J176_122_8048_n19), .B(
        S_Oper_A_exp[1]), .C(DP_OP_42J176_122_8048_n8), .CO(
        DP_OP_42J176_122_8048_n7), .S(Exp_Operation_Module_Data_S[1]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U10 ( .A(DP_OP_45J176_125_5354_n39), .B(
        S_A_S_Oper_A[17]), .C(DP_OP_45J176_125_5354_n10), .CO(
        DP_OP_45J176_125_5354_n9), .S(Add_Subt_Sgf_module_S_to_D[17]) );
  DFFRX4TS Sel_C_Q_reg_0_ ( .D(n407), .CK(
        Add_Subt_Sgf_module_Add_Subt_Result_net3627123), .RN(n400), .Q(
        FSM_selector_C), .QN(n1023) );
  CMPR32X2TS DP_OP_42J176_122_8048_U7 ( .A(DP_OP_42J176_122_8048_n18), .B(
        S_Oper_A_exp[2]), .C(DP_OP_42J176_122_8048_n7), .CO(
        DP_OP_42J176_122_8048_n6), .S(Exp_Operation_Module_Data_S[2]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U8 ( .A(DP_OP_45J176_125_5354_n37), .B(
        S_A_S_Oper_A[19]), .C(DP_OP_45J176_125_5354_n8), .CO(
        DP_OP_45J176_125_5354_n7), .S(Add_Subt_Sgf_module_S_to_D[19]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U7 ( .A(DP_OP_45J176_125_5354_n36), .B(
        S_A_S_Oper_A[20]), .C(DP_OP_45J176_125_5354_n7), .CO(
        DP_OP_45J176_125_5354_n6), .S(Add_Subt_Sgf_module_S_to_D[20]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U6 ( .A(DP_OP_45J176_125_5354_n35), .B(
        S_A_S_Oper_A[21]), .C(DP_OP_45J176_125_5354_n6), .CO(
        DP_OP_45J176_125_5354_n5), .S(Add_Subt_Sgf_module_S_to_D[21]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U5 ( .A(DP_OP_45J176_125_5354_n34), .B(
        S_A_S_Oper_A[22]), .C(DP_OP_45J176_125_5354_n5), .CO(
        DP_OP_45J176_125_5354_n4), .S(Add_Subt_Sgf_module_S_to_D[22]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U4 ( .A(DP_OP_45J176_125_5354_n33), .B(
        S_A_S_Oper_A[23]), .C(DP_OP_45J176_125_5354_n4), .CO(
        DP_OP_45J176_125_5354_n3), .S(Add_Subt_Sgf_module_S_to_D[23]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U3 ( .A(DP_OP_45J176_125_5354_n32), .B(
        S_A_S_Oper_A[24]), .C(DP_OP_45J176_125_5354_n3), .CO(
        DP_OP_45J176_125_5354_n2), .S(Add_Subt_Sgf_module_S_to_D[24]) );
  CMPR32X2TS DP_OP_45J176_125_5354_U2 ( .A(DP_OP_45J176_125_5354_n31), .B(
        S_A_S_Oper_A[25]), .C(DP_OP_45J176_125_5354_n2), .CO(
        DP_OP_45J176_125_5354_n1), .S(Add_Subt_Sgf_module_S_to_D[25]) );
  NOR2XLTS U648 ( .A(n883), .B(intDY[10]), .Y(n884) );
  OAI21XLTS U649 ( .A0(intDX[15]), .A1(n1083), .B0(intDX[14]), .Y(n891) );
  OAI21XLTS U650 ( .A0(intDX[23]), .A1(n1084), .B0(intDX[22]), .Y(n911) );
  NOR2XLTS U651 ( .A(FS_Module_state_reg[3]), .B(FSM_selector_C), .Y(n556) );
  OR2X1TS U652 ( .A(FSM_selector_B[0]), .B(FSM_selector_B[1]), .Y(n557) );
  BUFX4TS U653 ( .A(S_A_S_op), .Y(n820) );
  NOR2XLTS U654 ( .A(n984), .B(n743), .Y(n583) );
  OAI21XLTS U655 ( .A0(n798), .A1(n952), .B0(n568), .Y(n1121) );
  OAI211XLTS U656 ( .A0(n743), .A1(n436), .B0(n742), .C0(n741), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[19]) );
  OAI211XLTS U657 ( .A0(n436), .A1(n674), .B0(n673), .C0(n672), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[16]) );
  OAI211XLTS U658 ( .A0(n697), .A1(n424), .B0(n612), .C0(n611), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[9]) );
  OAI211XLTS U659 ( .A0(n685), .A1(n424), .B0(n651), .C0(n650), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[5]) );
  OAI211XLTS U660 ( .A0(n743), .A1(n691), .B0(n690), .C0(n689), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[3]) );
  OAI211XLTS U661 ( .A0(n691), .A1(n735), .B0(n629), .C0(n628), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[2]) );
  OAI211XLTS U662 ( .A0(n1113), .A1(n500), .B0(n499), .C0(n843), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[4]) );
  OAI211XLTS U663 ( .A0(n685), .A1(n735), .B0(n659), .C0(n658), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[6]) );
  OAI211XLTS U664 ( .A0(n679), .A1(n424), .B0(n596), .C0(n595), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[13]) );
  OAI211XLTS U665 ( .A0(n697), .A1(n674), .B0(n653), .C0(n652), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[8]) );
  OAI211XLTS U666 ( .A0(n697), .A1(n735), .B0(n614), .C0(n613), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[10]) );
  OAI211XLTS U667 ( .A0(n743), .A1(n685), .B0(n684), .C0(n683), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[7]) );
  OAI211XLTS U668 ( .A0(n685), .A1(n674), .B0(n645), .C0(n644), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[4]) );
  OAI211XLTS U669 ( .A0(n679), .A1(n674), .B0(n604), .C0(n603), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[12]) );
  OAI211XLTS U670 ( .A0(n743), .A1(n679), .B0(n678), .C0(n677), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[15]) );
  OAI211XLTS U671 ( .A0(n743), .A1(n697), .B0(n696), .C0(n695), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[11]) );
  OAI211XLTS U672 ( .A0(n679), .A1(n735), .B0(n600), .C0(n599), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[14]) );
  OAI211XLTS U673 ( .A0(n691), .A1(n674), .B0(n639), .C0(n638), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[0]) );
  OAI211XLTS U674 ( .A0(n691), .A1(n424), .B0(n657), .C0(n656), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[1]) );
  INVX4TS U675 ( .A(n968), .Y(n974) );
  OAI211XLTS U676 ( .A0(n954), .A1(n952), .B0(n779), .C0(n778), .Y(n1134) );
  OAI211XLTS U677 ( .A0(n942), .A1(n952), .B0(n788), .C0(n787), .Y(n1136) );
  NAND2BXLTS U678 ( .AN(n964), .B(n963), .Y(n1118) );
  OR2X1TS U679 ( .A(n493), .B(n469), .Y(n475) );
  CLKMX2X2TS U680 ( .A(DMP[6]), .B(Sgf_normalized_result[8]), .S0(n848), .Y(
        S_A_S_Oper_A[8]) );
  MX2X1TS U681 ( .A(DMP[15]), .B(Sgf_normalized_result[17]), .S0(n848), .Y(
        S_A_S_Oper_A[17]) );
  CLKMX2X2TS U682 ( .A(DMP[4]), .B(Sgf_normalized_result[6]), .S0(n426), .Y(
        S_A_S_Oper_A[6]) );
  MX2X1TS U683 ( .A(DMP[14]), .B(Sgf_normalized_result[16]), .S0(n848), .Y(
        S_A_S_Oper_A[16]) );
  CLKMX2X2TS U684 ( .A(DMP[5]), .B(Sgf_normalized_result[7]), .S0(n848), .Y(
        S_A_S_Oper_A[7]) );
  MX2X1TS U685 ( .A(DMP[13]), .B(Sgf_normalized_result[15]), .S0(n848), .Y(
        S_A_S_Oper_A[15]) );
  OAI21X1TS U686 ( .A0(n1087), .A1(n797), .B0(n796), .Y(n401) );
  OAI211X1TS U687 ( .A0(n738), .A1(n984), .B0(n737), .C0(n736), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[20]) );
  OAI21X1TS U688 ( .A0(n731), .A1(n646), .B0(n730), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[21]) );
  OAI211X1TS U689 ( .A0(n436), .A1(n735), .B0(n734), .C0(n733), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[18]) );
  OAI211X1TS U690 ( .A0(n490), .A1(n500), .B0(n489), .C0(n488), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[0]) );
  OAI211X1TS U691 ( .A0(n436), .A1(n424), .B0(n671), .C0(n670), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[17]) );
  NAND3X1TS U692 ( .A(n843), .B(n842), .C(n841), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[3]) );
  OAI211X1TS U693 ( .A0(n478), .A1(n479), .B0(n477), .C0(n488), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[2]) );
  NAND3X1TS U694 ( .A(n498), .B(Add_Subt_result[1]), .C(n1068), .Y(n843) );
  NOR2X1TS U695 ( .A(n984), .B(n428), .Y(n979) );
  NOR2X1TS U696 ( .A(n984), .B(n975), .Y(n977) );
  INVX3TS U697 ( .A(n674), .Y(n427) );
  INVX3TS U698 ( .A(n674), .Y(n428) );
  OAI211X1TS U699 ( .A0(n550), .A1(n549), .B0(n548), .C0(n547), .Y(
        FS_Module_state_next[3]) );
  INVX3TS U700 ( .A(n424), .Y(n433) );
  INVX3TS U701 ( .A(n735), .Y(n435) );
  NAND3BX1TS U702 ( .AN(n904), .B(n902), .C(n901), .Y(n922) );
  NOR2X2TS U703 ( .A(n987), .B(n985), .Y(n423) );
  NOR2X6TS U704 ( .A(n975), .B(n592), .Y(n581) );
  OR2X2TS U705 ( .A(n589), .B(n592), .Y(n424) );
  INVX3TS U706 ( .A(n634), .Y(n625) );
  AOI31X1TS U707 ( .A0(n993), .A1(n789), .A2(n790), .B0(n1112), .Y(n582) );
  AND2X2TS U708 ( .A(n830), .B(n580), .Y(n589) );
  OR2X2TS U709 ( .A(n790), .B(add_overflow_flag), .Y(n634) );
  NAND3BX1TS U710 ( .AN(n447), .B(n446), .C(n400), .Y(n448) );
  OAI211X1TS U711 ( .A0(n863), .A1(n919), .B0(n862), .C0(n861), .Y(n868) );
  NOR2BX4TS U712 ( .AN(n717), .B(n826), .Y(n551) );
  NAND3X1TS U713 ( .A(n1082), .B(n860), .C(intDX[26]), .Y(n862) );
  CLKMX2X2TS U714 ( .A(DMP[10]), .B(Sgf_normalized_result[12]), .S0(n848), .Y(
        S_A_S_Oper_A[12]) );
  CLKMX2X2TS U715 ( .A(DMP[9]), .B(Sgf_normalized_result[11]), .S0(n848), .Y(
        S_A_S_Oper_A[11]) );
  OAI211X2TS U716 ( .A0(intDX[20]), .A1(n1064), .B0(n915), .C0(n900), .Y(n909)
         );
  CLKMX2X2TS U717 ( .A(DMP[11]), .B(Sgf_normalized_result[13]), .S0(n848), .Y(
        S_A_S_Oper_A[13]) );
  CLKMX2X2TS U718 ( .A(DMP[8]), .B(Sgf_normalized_result[10]), .S0(n848), .Y(
        S_A_S_Oper_A[10]) );
  CLKMX2X2TS U719 ( .A(DMP[12]), .B(Sgf_normalized_result[14]), .S0(n848), .Y(
        S_A_S_Oper_A[14]) );
  CLKMX2X2TS U720 ( .A(DMP[7]), .B(Sgf_normalized_result[9]), .S0(n848), .Y(
        S_A_S_Oper_A[9]) );
  INVX4TS U721 ( .A(n557), .Y(n420) );
  NOR2X1TS U722 ( .A(n918), .B(intDY[24]), .Y(n859) );
  OAI211X2TS U723 ( .A0(intDX[12]), .A1(n1030), .B0(n895), .C0(n881), .Y(n897)
         );
  NAND2BX1TS U724 ( .AN(intDX[9]), .B(intDY[9]), .Y(n885) );
  NOR2X1TS U725 ( .A(Add_Subt_result[15]), .B(Add_Subt_result[16]), .Y(n466)
         );
  NAND2BX1TS U726 ( .AN(intDY[27]), .B(intDX[27]), .Y(n861) );
  NAND2BX1TS U727 ( .AN(intDX[13]), .B(intDY[13]), .Y(n881) );
  NAND2BX1TS U728 ( .AN(intDX[21]), .B(intDY[21]), .Y(n900) );
  NAND2BX1TS U729 ( .AN(intDX[19]), .B(intDY[19]), .Y(n906) );
  NOR2X1TS U730 ( .A(n1038), .B(n1112), .Y(n554) );
  NAND2BX1TS U731 ( .AN(intDX[24]), .B(intDY[24]), .Y(n916) );
  NAND2BX1TS U732 ( .AN(intDX[27]), .B(intDY[27]), .Y(n860) );
  NOR2X8TS U733 ( .A(n536), .B(n834), .Y(S_A_S_op) );
  MX2X1TS U734 ( .A(DMP[2]), .B(Sgf_normalized_result[4]), .S0(n426), .Y(
        S_A_S_Oper_A[4]) );
  MX2X1TS U735 ( .A(DMP[19]), .B(Sgf_normalized_result[21]), .S0(
        FSM_selector_D), .Y(S_A_S_Oper_A[21]) );
  MX2X1TS U736 ( .A(DMP[22]), .B(Sgf_normalized_result[24]), .S0(n426), .Y(
        S_A_S_Oper_A[24]) );
  CLKAND2X2TS U737 ( .A(n835), .B(Sgf_normalized_result[1]), .Y(
        S_A_S_Oper_A[1]) );
  CLKAND2X2TS U738 ( .A(FSM_selector_D), .B(Sgf_normalized_result[0]), .Y(
        S_A_S_Oper_A[0]) );
  XOR2X1TS U739 ( .A(S_A_S_op), .B(n439), .Y(DP_OP_45J176_125_5354_n56) );
  MX2X1TS U740 ( .A(DMP[21]), .B(Sgf_normalized_result[23]), .S0(n426), .Y(
        S_A_S_Oper_A[23]) );
  XOR2X1TS U741 ( .A(DP_OP_45J176_125_5354_n1), .B(n820), .Y(
        Add_Subt_Sgf_module_S_to_D[26]) );
  MX2X1TS U742 ( .A(DMP[1]), .B(Sgf_normalized_result[3]), .S0(FSM_selector_D), 
        .Y(S_A_S_Oper_A[3]) );
  MX2X1TS U743 ( .A(DMP[18]), .B(Sgf_normalized_result[20]), .S0(n848), .Y(
        S_A_S_Oper_A[20]) );
  MX2X1TS U744 ( .A(DMP[16]), .B(Sgf_normalized_result[18]), .S0(n848), .Y(
        S_A_S_Oper_A[18]) );
  NAND2BXLTS U745 ( .AN(intDY[9]), .B(intDX[9]), .Y(n887) );
  NAND3XLTS U746 ( .A(n1077), .B(n885), .C(intDX[8]), .Y(n886) );
  OAI21XLTS U747 ( .A0(intDX[13]), .A1(n1061), .B0(intDX[12]), .Y(n882) );
  OAI211XLTS U748 ( .A0(n1081), .A1(intDX[3]), .B0(n873), .C0(n872), .Y(n876)
         );
  NAND2BXLTS U749 ( .AN(intDX[2]), .B(intDY[2]), .Y(n872) );
  OAI21XLTS U750 ( .A0(intDX[1]), .A1(n1080), .B0(intDX[0]), .Y(n871) );
  AOI2BB2XLTS U751 ( .B0(intDX[3]), .B1(n1081), .A0N(intDY[2]), .A1N(n874), 
        .Y(n875) );
  OAI21XLTS U752 ( .A0(intDX[3]), .A1(n1081), .B0(intDX[2]), .Y(n874) );
  AO22XLTS U753 ( .A0(n625), .A1(Add_Subt_result[16]), .B0(DmP[7]), .B1(n1023), 
        .Y(n607) );
  AO22XLTS U754 ( .A0(n625), .A1(Add_Subt_result[15]), .B0(DmP[8]), .B1(n624), 
        .Y(n609) );
  AO22XLTS U755 ( .A0(n625), .A1(Add_Subt_result[12]), .B0(DmP[11]), .B1(n624), 
        .Y(n587) );
  AO22XLTS U756 ( .A0(n625), .A1(Add_Subt_result[13]), .B0(DmP[10]), .B1(n1023), .Y(n601) );
  AO22XLTS U757 ( .A0(n666), .A1(Add_Subt_result[11]), .B0(DmP[12]), .B1(n1023), .Y(n590) );
  AO22XLTS U758 ( .A0(n666), .A1(Add_Subt_result[8]), .B0(DmP[15]), .B1(n624), 
        .Y(n588) );
  AO22XLTS U759 ( .A0(n625), .A1(Add_Subt_result[9]), .B0(DmP[14]), .B1(n1023), 
        .Y(n593) );
  AO22XLTS U760 ( .A0(n625), .A1(Add_Subt_result[7]), .B0(DmP[16]), .B1(n624), 
        .Y(n591) );
  AO22XLTS U761 ( .A0(n625), .A1(Add_Subt_result[4]), .B0(DmP[19]), .B1(n624), 
        .Y(n597) );
  AO22XLTS U762 ( .A0(n625), .A1(Add_Subt_result[5]), .B0(DmP[18]), .B1(n1023), 
        .Y(n594) );
  AO22XLTS U763 ( .A0(n625), .A1(Add_Subt_result[17]), .B0(DmP[6]), .B1(n624), 
        .Y(n623) );
  AO22XLTS U764 ( .A0(n625), .A1(Add_Subt_result[19]), .B0(DmP[4]), .B1(n1023), 
        .Y(n618) );
  AO22XLTS U765 ( .A0(n625), .A1(Add_Subt_result[20]), .B0(DmP[3]), .B1(n624), 
        .Y(n626) );
  OAI21XLTS U766 ( .A0(intDX[21]), .A1(n1062), .B0(intDX[20]), .Y(n903) );
  AOI222X1TS U767 ( .A0(n782), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[44]), .B0(n551), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[28]), .C1(n573), .Y(n774)
         );
  CLKAND2X2TS U768 ( .A(n476), .B(Add_Subt_result[4]), .Y(n495) );
  AO22XLTS U769 ( .A0(n663), .A1(n661), .B0(n982), .B1(n984), .Y(n422) );
  CLKAND2X2TS U770 ( .A(n578), .B(n577), .Y(n981) );
  OAI21XLTS U771 ( .A0(n801), .A1(n551), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n802) );
  NOR2XLTS U772 ( .A(n482), .B(Add_Subt_result[25]), .Y(n483) );
  OAI21XLTS U773 ( .A0(Add_Subt_result[3]), .A1(Add_Subt_result[2]), .B0(n491), 
        .Y(n492) );
  INVX4TS U774 ( .A(rst), .Y(n451) );
  MX2X1TS U775 ( .A(DMP[20]), .B(Sgf_normalized_result[22]), .S0(n426), .Y(
        S_A_S_Oper_A[22]) );
  AO22XLTS U776 ( .A0(n960), .A1(n952), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B1(n805), .Y(n1143)
         );
  MX2X1TS U777 ( .A(DMP[23]), .B(exp_oper_result[0]), .S0(n426), .Y(
        S_Oper_A_exp[0]) );
  OAI211XLTS U778 ( .A0(n955), .A1(n936), .B0(n935), .C0(n934), .Y(n937) );
  AOI2BB2XLTS U779 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .B1(
        n932), .A0N(n722), .A1N(n721), .Y(n727) );
  AOI2BB2XLTS U780 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .B1(
        n932), .A0N(n723), .A1N(n721), .Y(n720) );
  AOI2BB2XLTS U781 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .B1(
        n932), .A0N(n711), .A1N(n721), .Y(n715) );
  AOI2BB2XLTS U782 ( .B0(Barrel_Shifter_module_Mux_Array_Data_array[36]), .B1(
        n932), .A0N(n712), .A1N(n721), .Y(n710) );
  NAND4XLTS U783 ( .A(n946), .B(n945), .C(n944), .D(n956), .Y(n1135) );
  NAND4XLTS U784 ( .A(n959), .B(n958), .C(n957), .D(n956), .Y(n1133) );
  NOR2XLTS U785 ( .A(n956), .B(n1048), .Y(n766) );
  NOR2XLTS U786 ( .A(n956), .B(n1049), .Y(n762) );
  OAI211XLTS U787 ( .A0(n761), .A1(n955), .B0(n760), .C0(n759), .Y(n1128) );
  NOR2XLTS U788 ( .A(n956), .B(n1050), .Y(n758) );
  NOR2XLTS U789 ( .A(n956), .B(n1044), .Y(n748) );
  MX2X1TS U790 ( .A(DMP[25]), .B(exp_oper_result[2]), .S0(n426), .Y(
        S_Oper_A_exp[2]) );
  MX2X1TS U791 ( .A(DMP[24]), .B(exp_oper_result[1]), .S0(n426), .Y(
        S_Oper_A_exp[1]) );
  OAI211XLTS U792 ( .A0(n774), .A1(n955), .B0(n773), .C0(n772), .Y(n1126) );
  NOR2XLTS U793 ( .A(n956), .B(n1051), .Y(n770) );
  NAND2BXLTS U794 ( .AN(Sgf_normalized_result[25]), .B(n834), .Y(
        S_A_S_Oper_A[25]) );
  MX2X1TS U795 ( .A(DMP[3]), .B(Sgf_normalized_result[5]), .S0(n426), .Y(
        S_A_S_Oper_A[5]) );
  MX2X1TS U796 ( .A(DMP[0]), .B(Sgf_normalized_result[2]), .S0(FSM_selector_D), 
        .Y(S_A_S_Oper_A[2]) );
  AO21XLTS U797 ( .A0(Exp_Operation_Module_Data_S[7]), .A1(n450), .B0(n795), 
        .Y(n1116) );
  NAND2BXLTS U798 ( .AN(exp_oper_result[2]), .B(n989), .Y(
        final_result_ieee_Module_Exp_S_mux[2]) );
  AOI31XLTS U799 ( .A0(n840), .A1(n839), .A2(n1052), .B0(n838), .Y(n841) );
  MX2X1TS U800 ( .A(DMP[26]), .B(exp_oper_result[3]), .S0(n426), .Y(
        S_Oper_A_exp[3]) );
  MX2X1TS U801 ( .A(DMP[27]), .B(exp_oper_result[4]), .S0(n426), .Y(
        S_Oper_A_exp[4]) );
  MX2X1TS U802 ( .A(DMP[17]), .B(Sgf_normalized_result[19]), .S0(n848), .Y(
        S_A_S_Oper_A[19]) );
  NAND4XLTS U803 ( .A(n842), .B(n857), .C(n485), .D(n484), .Y(n486) );
  AOI31XLTS U804 ( .A0(n840), .A1(Add_Subt_result[16]), .A2(n1009), .B0(n483), 
        .Y(n485) );
  NAND4BXLTS U805 ( .AN(n858), .B(n857), .C(n856), .D(n855), .Y(
        Leading_Zero_Detector_Module_Codec_to_Reg[1]) );
  AOI31XLTS U806 ( .A0(n487), .A1(n494), .A2(Add_Subt_result[5]), .B0(n474), 
        .Y(n477) );
  OAI21XLTS U807 ( .A0(FSM_selector_C), .A1(n992), .B0(n537), .Y(
        FS_Module_state_next[2]) );
  MX2X1TS U808 ( .A(DMP[28]), .B(exp_oper_result[5]), .S0(n426), .Y(
        S_Oper_A_exp[5]) );
  CLKAND2X2TS U809 ( .A(n420), .B(DmP[28]), .Y(n823) );
  MX2X1TS U810 ( .A(DMP[29]), .B(exp_oper_result[6]), .S0(n426), .Y(
        S_Oper_A_exp[6]) );
  CLKAND2X2TS U811 ( .A(n420), .B(DmP[29]), .Y(n822) );
  MX2X1TS U812 ( .A(DMP[30]), .B(exp_oper_result[7]), .S0(n426), .Y(
        S_Oper_A_exp[7]) );
  INVX4TS U813 ( .A(n924), .Y(n970) );
  BUFX4TS U814 ( .A(n966), .Y(n968) );
  OR2X1TS U815 ( .A(n438), .B(n930), .Y(n425) );
  INVX4TS U816 ( .A(n421), .Y(n426) );
  OAI221X1TS U817 ( .A0(n999), .A1(intDY[20]), .B0(n1032), .B1(intDY[19]), 
        .C0(n518), .Y(n521) );
  NOR4X2TS U818 ( .A(FS_Module_state_reg[0]), .B(n1038), .C(n1025), .D(n1114), 
        .Y(ready) );
  AOI221X1TS U819 ( .A0(intDX[30]), .A1(n1010), .B0(intDX[29]), .B1(n1076), 
        .C0(n865), .Y(n867) );
  OA21XLTS U820 ( .A0(Sgf_normalized_result[1]), .A1(Sgf_normalized_result[0]), 
        .B0(n442), .Y(n550) );
  OAI33X1TS U821 ( .A0(sign_final_result), .A1(r_mode[0]), .A2(n441), .B0(
        n1015), .B1(n440), .B2(r_mode[1]), .Y(n442) );
  AOI211XLTS U822 ( .A0(n546), .A1(n413), .B0(n538), .C0(
        FSM_exp_operation_load_diff), .Y(n537) );
  NOR2X2TS U823 ( .A(n925), .B(n536), .Y(n546) );
  AOI222X1TS U824 ( .A0(n782), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[45]), .B0(n551), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[29]), .C1(n573), .Y(n765)
         );
  AOI222X1TS U825 ( .A0(n782), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[48]), .B0(n551), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[32]), .C1(n573), .Y(n761)
         );
  AOI222X1TS U826 ( .A0(n782), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(n551), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[33]), .C1(n573), .Y(n769)
         );
  AOI222X1TS U827 ( .A0(n782), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[47]), .B0(n551), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[31]), .C1(n573), .Y(n757)
         );
  AOI222X1TS U828 ( .A0(n782), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[46]), .B0(n551), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .C0(
        Barrel_Shifter_module_Mux_Array_Data_array[30]), .C1(n573), .Y(n753)
         );
  NOR2X4TS U829 ( .A(n826), .B(n558), .Y(n573) );
  BUFX4TS U830 ( .A(n1110), .Y(n1100) );
  AOI211X1TS U831 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[32]), .A1(
        n771), .B0(n758), .C0(n785), .Y(n760) );
  AOI211X1TS U832 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[29]), .A1(
        n771), .B0(n762), .C0(n785), .Y(n764) );
  AOI211X1TS U833 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[28]), .A1(
        n771), .B0(n770), .C0(n785), .Y(n773) );
  AOI211X1TS U834 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[31]), .A1(
        n771), .B0(n754), .C0(n785), .Y(n756) );
  AOI211X1TS U835 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[33]), .A1(
        n771), .B0(n766), .C0(n785), .Y(n768) );
  AOI211X1TS U836 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[30]), .A1(
        n771), .B0(n748), .C0(n785), .Y(n752) );
  OAI21X4TS U837 ( .A0(n955), .A1(n745), .B0(n777), .Y(n771) );
  NOR2X2TS U838 ( .A(n557), .B(n930), .Y(n948) );
  BUFX4TS U839 ( .A(n1102), .Y(n1094) );
  BUFX4TS U840 ( .A(n1103), .Y(n1107) );
  BUFX4TS U841 ( .A(n1106), .Y(n1096) );
  NOR2X2TS U842 ( .A(overflow_flag), .B(underflow_flag), .Y(n990) );
  AOI222X1TS U843 ( .A0(n933), .A1(n781), .B0(FSM_selector_B[1]), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .C0(n931), .C1(n780), 
        .Y(n936) );
  NOR2X2TS U844 ( .A(LZA_output[4]), .B(n826), .Y(n781) );
  INVX2TS U845 ( .A(n425), .Y(n429) );
  OAI211X1TS U846 ( .A0(FSM_selector_B[1]), .A1(n1022), .B0(n826), .C0(n744), 
        .Y(n700) );
  NOR2X2TS U847 ( .A(n556), .B(n1112), .Y(n744) );
  BUFX4TS U848 ( .A(n1101), .Y(n1092) );
  INVX4TS U849 ( .A(rst), .Y(n430) );
  CLKBUFX2TS U850 ( .A(n451), .Y(n1105) );
  INVX4TS U851 ( .A(rst), .Y(n431) );
  CLKBUFX2TS U852 ( .A(n451), .Y(n1099) );
  NOR2X4TS U853 ( .A(n994), .B(LZA_output[4]), .Y(n717) );
  NAND2X2TS U854 ( .A(n707), .B(n703), .Y(n721) );
  OAI221XLTS U855 ( .A0(n1027), .A1(intDY[29]), .B0(n1030), .B1(intDX[12]), 
        .C0(n527), .Y(n528) );
  BUFX4TS U856 ( .A(n990), .Y(n991) );
  BUFX4TS U857 ( .A(n990), .Y(n989) );
  AOI222X1TS U858 ( .A0(n980), .A1(n428), .B0(n983), .B1(n435), .C0(n982), 
        .C1(n432), .Y(n731) );
  AOI32X1TS U859 ( .A0(n987), .A1(n427), .A2(n983), .B0(n423), .B1(n427), .Y(
        n741) );
  INVX2TS U860 ( .A(n424), .Y(n432) );
  INVX2TS U861 ( .A(n735), .Y(n434) );
  INVX2TS U862 ( .A(n422), .Y(n436) );
  NOR2X4TS U863 ( .A(LZA_output[3]), .B(LZA_output[4]), .Y(n716) );
  NOR2X4TS U864 ( .A(n749), .B(n952), .Y(n805) );
  AOI21X2TS U865 ( .A0(FSM_selector_B[0]), .A1(n716), .B0(n698), .Y(n749) );
  AOI22X2TS U866 ( .A0(n663), .A1(n606), .B0(n661), .B1(n646), .Y(n679) );
  AOI22X2TS U867 ( .A0(n663), .A1(n640), .B0(n606), .B1(n646), .Y(n697) );
  AOI22X2TS U868 ( .A0(n987), .A1(n641), .B0(n640), .B1(n646), .Y(n685) );
  AOI22X2TS U869 ( .A0(n649), .A1(n631), .B0(n627), .B1(n646), .Y(n686) );
  AOI22X2TS U870 ( .A0(n663), .A1(n610), .B0(n664), .B1(n646), .Y(n694) );
  AOI22X2TS U871 ( .A0(n649), .A1(n598), .B0(n729), .B1(n646), .Y(n675) );
  AOI22X2TS U872 ( .A0(n663), .A1(n608), .B0(n598), .B1(n646), .Y(n692) );
  AOI22X2TS U873 ( .A0(n649), .A1(n602), .B0(n669), .B1(n646), .Y(n676) );
  AOI22X2TS U874 ( .A0(n663), .A1(n643), .B0(n642), .B1(n646), .Y(n688) );
  AOI22X2TS U875 ( .A0(n649), .A1(n647), .B0(n602), .B1(n646), .Y(n693) );
  AOI22X2TS U876 ( .A0(n663), .A1(n642), .B0(n610), .B1(n646), .Y(n682) );
  AOI22X2TS U877 ( .A0(n649), .A1(n627), .B0(n608), .B1(n646), .Y(n680) );
  AOI22X2TS U878 ( .A0(n649), .A1(n648), .B0(n647), .B1(n984), .Y(n681) );
  AND2X4TS U879 ( .A(n828), .B(n579), .Y(n649) );
  INVX4TS U880 ( .A(n663), .Y(n646) );
  INVX4TS U881 ( .A(n970), .Y(n969) );
  INVX4TS U882 ( .A(n966), .Y(n971) );
  BUFX4TS U883 ( .A(n970), .Y(n966) );
  INVX4TS U884 ( .A(n973), .Y(n967) );
  OAI2BB1X2TS U885 ( .A0N(Add_Subt_result[24]), .A1N(n668), .B0(n667), .Y(n980) );
  NOR2X1TS U886 ( .A(Add_Subt_result[23]), .B(Add_Subt_result[22]), .Y(n849)
         );
  OAI221X1TS U887 ( .A0(n1028), .A1(intDY[3]), .B0(n1004), .B1(intDY[2]), .C0(
        n504), .Y(n507) );
  OAI221X1TS U888 ( .A0(n1046), .A1(intDY[16]), .B0(n1035), .B1(intDY[15]), 
        .C0(n516), .Y(n523) );
  OAI221X1TS U889 ( .A0(n1001), .A1(intDY[24]), .B0(n1037), .B1(intDY[23]), 
        .C0(n524), .Y(n531) );
  OAI221X1TS U890 ( .A0(n1091), .A1(intDY[7]), .B0(n1011), .B1(intDY[6]), .C0(
        n877), .Y(n515) );
  MXI2X2TS U891 ( .A(n1008), .B(n1044), .S0(exp_oper_result[3]), .Y(n931) );
  NAND2X2TS U892 ( .A(n420), .B(exp_oper_result[4]), .Y(n705) );
  OAI2BB1X2TS U893 ( .A0N(Add_Subt_result[22]), .A1N(n668), .B0(n662), .Y(n983) );
  OAI211XLTS U894 ( .A0(intDX[8]), .A1(n1077), .B0(n885), .C0(n888), .Y(n899)
         );
  OAI221X1TS U895 ( .A0(n1021), .A1(intDY[11]), .B0(n1003), .B1(intDY[10]), 
        .C0(n888), .Y(n513) );
  OAI2BB2XLTS U896 ( .B0(n890), .B1(n897), .A0N(n889), .A1N(n888), .Y(n893) );
  AOI22X2TS U897 ( .A0(n1021), .A1(intDY[11]), .B0(n1003), .B1(intDY[10]), .Y(
        n888) );
  AOI22X2TS U898 ( .A0(n497), .A1(Add_Subt_result[10]), .B0(n840), .B1(
        Add_Subt_result[18]), .Y(n857) );
  NOR2X2TS U899 ( .A(n836), .B(n470), .Y(n497) );
  BUFX4TS U900 ( .A(n451), .Y(n1111) );
  OAI2BB1X2TS U901 ( .A0N(exp_oper_result[0]), .A1N(n1020), .B0(n832), .Y(n592) );
  OAI211XLTS U902 ( .A0(n929), .A1(n721), .B0(n706), .C0(n956), .Y(n1141) );
  OAI211XLTS U903 ( .A0(n750), .A1(n1049), .B0(n727), .C0(n726), .Y(n1140) );
  OAI211XLTS U904 ( .A0(n750), .A1(n1050), .B0(n720), .C0(n719), .Y(n1139) );
  OAI211XLTS U905 ( .A0(n750), .A1(n1051), .B0(n715), .C0(n714), .Y(n1138) );
  OAI211XLTS U906 ( .A0(n769), .A1(n955), .B0(n768), .C0(n767), .Y(n1132) );
  OAI211XLTS U907 ( .A0(n769), .A1(n952), .B0(n575), .C0(n574), .Y(n1131) );
  OAI211XLTS U908 ( .A0(n765), .A1(n955), .B0(n764), .C0(n763), .Y(n1130) );
  OAI211XLTS U909 ( .A0(n765), .A1(n952), .B0(n570), .C0(n569), .Y(n1129) );
  OAI211XLTS U910 ( .A0(n761), .A1(n952), .B0(n565), .C0(n564), .Y(n1127) );
  OAI211XLTS U911 ( .A0(n774), .A1(n952), .B0(n563), .C0(n562), .Y(n1125) );
  OAI211XLTS U912 ( .A0(n757), .A1(n955), .B0(n756), .C0(n755), .Y(n1124) );
  OAI211XLTS U913 ( .A0(n757), .A1(n952), .B0(n572), .C0(n571), .Y(n1123) );
  OAI211XLTS U914 ( .A0(n753), .A1(n955), .B0(n752), .C0(n751), .Y(n1120) );
  OAI211XLTS U915 ( .A0(n753), .A1(n952), .B0(n561), .C0(n560), .Y(n1119) );
  NOR4X4TS U916 ( .A(FS_Module_state_reg[0]), .B(FS_Module_state_reg[3]), .C(
        FS_Module_state_reg[2]), .D(n1025), .Y(n413) );
  OR2X1TS U917 ( .A(n834), .B(Sgf_normalized_result[2]), .Y(n818) );
  NOR2X4TS U918 ( .A(n1020), .B(FSM_selector_B[1]), .Y(n707) );
  OAI221X1TS U919 ( .A0(n1090), .A1(intDY[28]), .B0(n1005), .B1(intDY[27]), 
        .C0(n526), .Y(n529) );
  INVX2TS U920 ( .A(n743), .Y(n437) );
  AOI222X1TS U921 ( .A0(n982), .A1(n581), .B0(n981), .B1(n432), .C0(n980), 
        .C1(n434), .Y(n978) );
  NOR2X2TS U922 ( .A(Add_Subt_result[13]), .B(Add_Subt_result[11]), .Y(n837)
         );
  OAI2BB1X2TS U923 ( .A0N(Add_Subt_result[23]), .A1N(n668), .B0(n660), .Y(n982) );
  NOR2X4TS U924 ( .A(n552), .B(add_overflow_flag), .Y(n961) );
  NOR3BX1TS U925 ( .AN(n845), .B(FS_Module_state_reg[1]), .C(add_overflow_flag), .Y(n846) );
  NOR2X2TS U926 ( .A(Add_Subt_result[6]), .B(Add_Subt_result[7]), .Y(n494) );
  AOI31XLTS U927 ( .A0(n487), .A1(Add_Subt_result[6]), .A2(n1086), .B0(n486), 
        .Y(n489) );
  AOI22X2TS U928 ( .A0(n649), .A1(n633), .B0(n648), .B1(n984), .Y(n687) );
  AOI22X2TS U929 ( .A0(n987), .A1(n729), .B0(n728), .B1(n984), .Y(n739) );
  AOI32X4TS U930 ( .A0(n620), .A1(n987), .A2(n619), .B0(n643), .B1(n984), .Y(
        n654) );
  AOI22X2TS U931 ( .A0(n987), .A1(n617), .B0(n641), .B1(n984), .Y(n691) );
  INVX4TS U932 ( .A(n663), .Y(n984) );
  BUFX4TS U933 ( .A(FSM_selector_D), .Y(n835) );
  BUFX4TS U934 ( .A(FSM_selector_D), .Y(n834) );
  INVX4TS U935 ( .A(n973), .Y(n965) );
  BUFX4TS U936 ( .A(n970), .Y(n973) );
  NOR2XLTS U937 ( .A(n1074), .B(intDX[11]), .Y(n883) );
  NOR2XLTS U938 ( .A(n904), .B(intDY[16]), .Y(n905) );
  NOR2XLTS U939 ( .A(n956), .B(n1047), .Y(n754) );
  OAI211XLTS U940 ( .A0(n473), .A1(n472), .B0(n857), .C0(n471), .Y(n474) );
  OR2X1TS U941 ( .A(n584), .B(n835), .Y(n406) );
  OAI211XLTS U942 ( .A0(n750), .A1(n1048), .B0(n710), .C0(n709), .Y(n1137) );
  OAI211XLTS U943 ( .A0(n546), .A1(n543), .B0(n542), .C0(n549), .Y(
        FS_Module_state_next[0]) );
  CLKXOR2X2TS U944 ( .A(n1115), .B(intDX[31]), .Y(n536) );
  NOR2BX1TS U945 ( .AN(Sgf_normalized_result[0]), .B(n834), .Y(n439) );
  NOR3X2TS U946 ( .A(FS_Module_state_reg[3]), .B(n1025), .C(n1114), .Y(
        FSM_Add_Subt_Sgf_load) );
  NOR2X2TS U947 ( .A(FS_Module_state_reg[1]), .B(n1038), .Y(n538) );
  AND3X1TS U948 ( .A(n538), .B(FS_Module_state_reg[0]), .C(
        FS_Module_state_reg[2]), .Y(FSM_Final_Result_load) );
  NOR2X2TS U949 ( .A(FS_Module_state_reg[1]), .B(FS_Module_state_reg[3]), .Y(
        n541) );
  INVX2TS U950 ( .A(FS_Module_state_reg[0]), .Y(n540) );
  NOR2X2TS U951 ( .A(FS_Module_state_reg[2]), .B(n540), .Y(n544) );
  CLKAND2X2TS U952 ( .A(n541), .B(n544), .Y(n411) );
  NAND2X1TS U953 ( .A(FS_Module_state_reg[2]), .B(n541), .Y(n502) );
  INVX2TS U954 ( .A(n502), .Y(n576) );
  NAND2X1TS U955 ( .A(FS_Module_state_reg[0]), .B(n576), .Y(n992) );
  AOI211XLTS U956 ( .A0(FS_Module_state_reg[0]), .A1(FSM_Add_Subt_Sgf_load), 
        .B0(n413), .C0(FSM_Final_Result_load), .Y(n444) );
  NOR3X2TS U957 ( .A(FS_Module_state_reg[0]), .B(FS_Module_state_reg[2]), .C(
        n1038), .Y(n845) );
  NAND2X1TS U958 ( .A(FS_Module_state_reg[1]), .B(n845), .Y(n539) );
  INVX2TS U959 ( .A(r_mode[1]), .Y(n441) );
  INVX2TS U960 ( .A(r_mode[0]), .Y(n440) );
  NAND2X1TS U961 ( .A(n544), .B(n538), .Y(n549) );
  NOR2BX1TS U962 ( .AN(n550), .B(n549), .Y(n584) );
  NOR3BX1TS U963 ( .AN(n539), .B(n584), .C(n411), .Y(n443) );
  OAI211XLTS U964 ( .A0(FSM_selector_C), .A1(n992), .B0(n443), .C0(n444), .Y(
        FS_Module_state_next[1]) );
  NAND3X2TS U965 ( .A(n1114), .B(n540), .C(n541), .Y(n400) );
  AOI21X1TS U966 ( .A0(n544), .A1(FS_Module_state_reg[3]), .B0(n541), .Y(n447)
         );
  NOR3X1TS U967 ( .A(FS_Module_state_reg[0]), .B(FSM_selector_C), .C(n502), 
        .Y(n445) );
  AOI211X1TS U968 ( .A0(FS_Module_state_reg[0]), .A1(n1025), .B0(n445), .C0(
        n1112), .Y(n446) );
  BUFX3TS U969 ( .A(n448), .Y(n1089) );
  AND4X1TS U970 ( .A(Exp_Operation_Module_Data_S[3]), .B(
        Exp_Operation_Module_Data_S[2]), .C(Exp_Operation_Module_Data_S[1]), 
        .D(Exp_Operation_Module_Data_S[0]), .Y(n449) );
  AND4X1TS U971 ( .A(Exp_Operation_Module_Data_S[6]), .B(
        Exp_Operation_Module_Data_S[5]), .C(Exp_Operation_Module_Data_S[4]), 
        .D(n449), .Y(n450) );
  XOR2X1TS U972 ( .A(DP_OP_42J176_122_8048_n1), .B(n1089), .Y(n795) );
  BUFX3TS U973 ( .A(n451), .Y(n1108) );
  BUFX3TS U974 ( .A(n451), .Y(n1109) );
  BUFX3TS U975 ( .A(n451), .Y(n1110) );
  BUFX3TS U976 ( .A(n451), .Y(n1103) );
  BUFX3TS U977 ( .A(n451), .Y(n1101) );
  BUFX3TS U978 ( .A(n451), .Y(n1102) );
  BUFX3TS U979 ( .A(n451), .Y(n1104) );
  BUFX3TS U980 ( .A(n451), .Y(n1097) );
  BUFX3TS U981 ( .A(n451), .Y(n1095) );
  BUFX3TS U982 ( .A(n451), .Y(n1098) );
  BUFX3TS U983 ( .A(n451), .Y(n1093) );
  BUFX3TS U984 ( .A(n451), .Y(n1106) );
  NAND2X1TS U985 ( .A(n989), .B(n1024), .Y(
        final_result_ieee_Module_Exp_S_mux[4]) );
  NAND2X1TS U986 ( .A(n989), .B(n1022), .Y(
        final_result_ieee_Module_Exp_S_mux[3]) );
  INVX2TS U987 ( .A(ready), .Y(n452) );
  OA22X1TS U988 ( .A0(ack_FSM), .A1(n452), .B0(beg_FSM), .B1(n400), .Y(n412)
         );
  NOR2BX1TS U989 ( .AN(Sgf_normalized_result[15]), .B(n835), .Y(n453) );
  XOR2X1TS U990 ( .A(S_A_S_op), .B(n453), .Y(DP_OP_45J176_125_5354_n41) );
  NOR2BX1TS U991 ( .AN(Sgf_normalized_result[16]), .B(n835), .Y(n454) );
  XOR2X1TS U992 ( .A(S_A_S_op), .B(n454), .Y(DP_OP_45J176_125_5354_n40) );
  NOR2BX1TS U993 ( .AN(Sgf_normalized_result[17]), .B(n835), .Y(n455) );
  XOR2X1TS U994 ( .A(S_A_S_op), .B(n455), .Y(DP_OP_45J176_125_5354_n39) );
  NOR2BX1TS U995 ( .AN(Sgf_normalized_result[18]), .B(n835), .Y(n456) );
  XOR2X1TS U996 ( .A(S_A_S_op), .B(n456), .Y(DP_OP_45J176_125_5354_n38) );
  NOR2BX1TS U997 ( .AN(Sgf_normalized_result[19]), .B(n835), .Y(n457) );
  XOR2X1TS U998 ( .A(S_A_S_op), .B(n457), .Y(DP_OP_45J176_125_5354_n37) );
  NOR2BX1TS U999 ( .AN(Sgf_normalized_result[20]), .B(n835), .Y(n458) );
  XOR2X1TS U1000 ( .A(S_A_S_op), .B(n458), .Y(DP_OP_45J176_125_5354_n36) );
  NOR2BX1TS U1001 ( .AN(Sgf_normalized_result[21]), .B(n835), .Y(n459) );
  XOR2X1TS U1002 ( .A(S_A_S_op), .B(n459), .Y(DP_OP_45J176_125_5354_n35) );
  NOR2BX1TS U1003 ( .AN(Sgf_normalized_result[22]), .B(n835), .Y(n460) );
  XOR2X1TS U1004 ( .A(S_A_S_op), .B(n460), .Y(DP_OP_45J176_125_5354_n34) );
  NOR2BX1TS U1005 ( .AN(Sgf_normalized_result[23]), .B(n834), .Y(n461) );
  XOR2X1TS U1006 ( .A(S_A_S_op), .B(n461), .Y(DP_OP_45J176_125_5354_n33) );
  NOR2BX1TS U1007 ( .AN(Sgf_normalized_result[24]), .B(n835), .Y(n462) );
  XOR2X1TS U1008 ( .A(S_A_S_op), .B(n462), .Y(DP_OP_45J176_125_5354_n32) );
  NOR2BX1TS U1009 ( .AN(Sgf_normalized_result[25]), .B(n835), .Y(n463) );
  XOR2X1TS U1010 ( .A(S_A_S_op), .B(n463), .Y(DP_OP_45J176_125_5354_n31) );
  INVX2TS U1011 ( .A(FSM_Add_Subt_Sgf_load), .Y(n464) );
  OAI21XLTS U1012 ( .A0(FS_Module_state_reg[0]), .A1(n464), .B0(n624), .Y(n407) );
  INVX2TS U1013 ( .A(n845), .Y(n847) );
  NOR2XLTS U1014 ( .A(FS_Module_state_reg[1]), .B(n847), .Y(FSM_LZA_load) );
  AOI2BB1X1TS U1015 ( .A0N(n1113), .A1N(Add_Subt_result[1]), .B0(
        Add_Subt_result[2]), .Y(n490) );
  NOR2BX1TS U1016 ( .AN(n490), .B(Add_Subt_result[3]), .Y(n478) );
  NOR3X1TS U1017 ( .A(Add_Subt_result[21]), .B(Add_Subt_result[20]), .C(
        Add_Subt_result[19]), .Y(n473) );
  INVX2TS U1018 ( .A(n473), .Y(n465) );
  NOR2X1TS U1019 ( .A(Add_Subt_result[25]), .B(Add_Subt_result[24]), .Y(n853)
         );
  NAND2X1TS U1020 ( .A(n853), .B(n849), .Y(n472) );
  NOR2X2TS U1021 ( .A(n465), .B(n472), .Y(n840) );
  NAND2X1TS U1022 ( .A(n1009), .B(n466), .Y(n839) );
  NOR3X1TS U1023 ( .A(n839), .B(Add_Subt_result[18]), .C(Add_Subt_result[14]), 
        .Y(n467) );
  NAND2X1TS U1024 ( .A(n840), .B(n467), .Y(n836) );
  NAND2X1TS U1025 ( .A(n837), .B(n1014), .Y(n470) );
  NOR3X1TS U1026 ( .A(Add_Subt_result[9]), .B(Add_Subt_result[10]), .C(
        Add_Subt_result[8]), .Y(n468) );
  NAND2X1TS U1027 ( .A(n497), .B(n468), .Y(n493) );
  NAND2X1TS U1028 ( .A(n494), .B(n1016), .Y(n469) );
  NOR2X1TS U1029 ( .A(n475), .B(Add_Subt_result[4]), .Y(n491) );
  INVX2TS U1030 ( .A(n491), .Y(n479) );
  INVX2TS U1031 ( .A(n493), .Y(n487) );
  INVX2TS U1032 ( .A(n836), .Y(n854) );
  NAND2X1TS U1033 ( .A(n854), .B(n470), .Y(n471) );
  INVX2TS U1034 ( .A(n475), .Y(n476) );
  INVX2TS U1035 ( .A(n495), .Y(n488) );
  NOR2X1TS U1036 ( .A(n479), .B(Add_Subt_result[3]), .Y(n498) );
  INVX2TS U1037 ( .A(n498), .Y(n500) );
  INVX2TS U1038 ( .A(n840), .Y(n850) );
  NOR4BX1TS U1039 ( .AN(Add_Subt_result[14]), .B(n850), .C(Add_Subt_result[18]), .D(n839), .Y(n480) );
  AOI31X1TS U1040 ( .A0(n854), .A1(Add_Subt_result[12]), .A2(n1054), .B0(n480), 
        .Y(n842) );
  AOI21X1TS U1041 ( .A0(n1043), .A1(Add_Subt_result[20]), .B0(
        Add_Subt_result[22]), .Y(n481) );
  AOI2BB1XLTS U1042 ( .A0N(n481), .A1N(Add_Subt_result[23]), .B0(
        Add_Subt_result[24]), .Y(n482) );
  NAND4XLTS U1043 ( .A(n854), .B(n837), .C(Add_Subt_result[8]), .D(n1071), .Y(
        n484) );
  AOI31XLTS U1044 ( .A0(n1071), .A1(n995), .A2(n1016), .B0(Add_Subt_result[10]), .Y(n496) );
  OAI21X1TS U1045 ( .A0(n494), .A1(n493), .B0(n492), .Y(n858) );
  AOI211X1TS U1046 ( .A0(n497), .A1(n496), .B0(n858), .C0(n495), .Y(n499) );
  INVX2TS U1047 ( .A(n544), .Y(n501) );
  OAI22X1TS U1048 ( .A0(FS_Module_state_reg[0]), .A1(n502), .B0(n1025), .B1(
        n501), .Y(FSM_exp_operation_load_diff) );
  AOI22X1TS U1049 ( .A0(intDX[30]), .A1(intDY[30]), .B0(n1010), .B1(n1040), 
        .Y(n509) );
  AOI22X1TS U1050 ( .A0(n1026), .A1(intDY[1]), .B0(n1007), .B1(intDY[0]), .Y(
        n503) );
  OAI221XLTS U1051 ( .A0(n1026), .A1(intDY[1]), .B0(n1007), .B1(intDY[0]), 
        .C0(n503), .Y(n508) );
  AOI22X1TS U1052 ( .A0(n1028), .A1(intDY[3]), .B0(n1004), .B1(intDY[2]), .Y(
        n504) );
  AOI22X1TS U1053 ( .A0(n1039), .A1(intDY[5]), .B0(n1006), .B1(intDY[4]), .Y(
        n505) );
  OAI221XLTS U1054 ( .A0(n1039), .A1(intDY[5]), .B0(n1006), .B1(intDY[4]), 
        .C0(n505), .Y(n506) );
  NOR4X1TS U1055 ( .A(n509), .B(n508), .C(n507), .D(n506), .Y(n535) );
  AOI22X1TS U1056 ( .A0(intDY[7]), .A1(n1091), .B0(intDY[6]), .B1(n1011), .Y(
        n877) );
  AOI22X1TS U1057 ( .A0(n996), .A1(intDY[9]), .B0(n1029), .B1(intDY[8]), .Y(
        n510) );
  OAI221XLTS U1058 ( .A0(n996), .A1(intDY[9]), .B0(n1029), .B1(intDY[8]), .C0(
        n510), .Y(n514) );
  AOI22X1TS U1059 ( .A0(n997), .A1(intDY[14]), .B0(n1034), .B1(intDY[13]), .Y(
        n511) );
  OAI221XLTS U1060 ( .A0(n997), .A1(intDY[14]), .B0(n1034), .B1(intDY[13]), 
        .C0(n511), .Y(n512) );
  NOR4X1TS U1061 ( .A(n515), .B(n514), .C(n513), .D(n512), .Y(n534) );
  AOI22X1TS U1062 ( .A0(n1046), .A1(intDY[16]), .B0(n1035), .B1(intDY[15]), 
        .Y(n516) );
  AOI22X1TS U1063 ( .A0(n998), .A1(intDY[18]), .B0(n1031), .B1(intDY[17]), .Y(
        n517) );
  OAI221XLTS U1064 ( .A0(n998), .A1(intDY[18]), .B0(n1031), .B1(intDY[17]), 
        .C0(n517), .Y(n522) );
  AOI22X1TS U1065 ( .A0(n999), .A1(intDY[20]), .B0(n1032), .B1(intDY[19]), .Y(
        n518) );
  AOI22X1TS U1066 ( .A0(n1000), .A1(intDY[22]), .B0(n1036), .B1(intDY[21]), 
        .Y(n519) );
  OAI221XLTS U1067 ( .A0(n1000), .A1(intDY[22]), .B0(n1036), .B1(intDY[21]), 
        .C0(n519), .Y(n520) );
  NOR4X1TS U1068 ( .A(n523), .B(n522), .C(n521), .D(n520), .Y(n533) );
  AOI22X1TS U1069 ( .A0(n1001), .A1(intDY[24]), .B0(n1037), .B1(intDY[23]), 
        .Y(n524) );
  AOI22X1TS U1070 ( .A0(n1002), .A1(intDY[26]), .B0(n1033), .B1(intDY[25]), 
        .Y(n525) );
  OAI221XLTS U1071 ( .A0(n1002), .A1(intDY[26]), .B0(n1033), .B1(intDY[25]), 
        .C0(n525), .Y(n530) );
  AOI22X1TS U1072 ( .A0(n1090), .A1(intDY[28]), .B0(n1005), .B1(intDY[27]), 
        .Y(n526) );
  AOI22X1TS U1073 ( .A0(n1027), .A1(intDY[29]), .B0(n1030), .B1(intDX[12]), 
        .Y(n527) );
  NOR4X1TS U1074 ( .A(n531), .B(n530), .C(n529), .D(n528), .Y(n532) );
  NAND4X1TS U1075 ( .A(n535), .B(n534), .C(n533), .D(n532), .Y(n925) );
  INVX2TS U1076 ( .A(n413), .Y(n543) );
  BUFX3TS U1077 ( .A(n1023), .Y(n624) );
  NAND3X1TS U1078 ( .A(FS_Module_state_reg[2]), .B(n538), .C(n540), .Y(n993)
         );
  OAI211X1TS U1079 ( .A0(n1023), .A1(n992), .B0(n993), .C0(n539), .Y(n545) );
  AOI21X1TS U1080 ( .A0(n541), .A1(n540), .B0(n545), .Y(n542) );
  NAND3X1TS U1081 ( .A(FS_Module_state_reg[1]), .B(FS_Module_state_reg[3]), 
        .C(n544), .Y(n789) );
  NOR4BX1TS U1082 ( .AN(n789), .B(FSM_Final_Result_load), .C(
        FSM_Add_Subt_Sgf_load), .D(n545), .Y(n548) );
  NAND2X1TS U1083 ( .A(n546), .B(n413), .Y(n547) );
  NAND2X2TS U1084 ( .A(n707), .B(LZA_output[4]), .Y(n824) );
  OAI22X4TS U1085 ( .A0(n824), .A1(LZA_output[3]), .B0(exp_oper_result[3]), 
        .B1(n705), .Y(n782) );
  INVX2TS U1086 ( .A(n707), .Y(n826) );
  INVX2TS U1087 ( .A(n716), .Y(n558) );
  NAND2X1TS U1088 ( .A(FSM_selector_C), .B(n1038), .Y(n552) );
  INVX4TS U1089 ( .A(n961), .Y(n952) );
  INVX2TS U1090 ( .A(n552), .Y(n553) );
  NOR2X2TS U1091 ( .A(n554), .B(n553), .Y(n703) );
  INVX3TS U1092 ( .A(n703), .Y(n955) );
  NOR3X1TS U1093 ( .A(FSM_selector_B[0]), .B(exp_oper_result[4]), .C(
        exp_oper_result[3]), .Y(n555) );
  NOR2X2TS U1094 ( .A(n555), .B(FSM_selector_B[1]), .Y(n745) );
  INVX2TS U1095 ( .A(n745), .Y(n698) );
  INVX2TS U1096 ( .A(n744), .Y(n930) );
  OAI21X4TS U1097 ( .A0(n955), .A1(n749), .B0(n930), .Y(n962) );
  NOR2X4TS U1098 ( .A(n745), .B(n952), .Y(n932) );
  AOI22X1TS U1099 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .A1(
        n962), .B0(Barrel_Shifter_module_Mux_Array_Data_array[30]), .B1(n932), 
        .Y(n561) );
  NAND2X1TS U1100 ( .A(n420), .B(exp_oper_result[3]), .Y(n702) );
  NOR2X2TS U1101 ( .A(n702), .B(exp_oper_result[4]), .Y(n801) );
  NAND2X2TS U1102 ( .A(n801), .B(n961), .Y(n927) );
  INVX2TS U1103 ( .A(n927), .Y(n951) );
  INVX2TS U1104 ( .A(n705), .Y(n800) );
  AOI21X1TS U1105 ( .A0(n707), .A1(n558), .B0(n800), .Y(n559) );
  AOI21X4TS U1106 ( .A0(n559), .A1(n702), .B0(n930), .Y(n964) );
  AOI21X1TS U1107 ( .A0(n951), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .B0(n964), .Y(n560)
         );
  AOI22X1TS U1108 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[49]), .A1(
        n962), .B0(Barrel_Shifter_module_Mux_Array_Data_array[28]), .B1(n932), 
        .Y(n563) );
  AOI21X1TS U1109 ( .A0(n951), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .B0(n964), .Y(n562)
         );
  AOI22X1TS U1110 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .A1(
        n962), .B0(Barrel_Shifter_module_Mux_Array_Data_array[32]), .B1(n932), 
        .Y(n565) );
  AOI21X1TS U1111 ( .A0(n951), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .B0(n964), .Y(n564)
         );
  OAI22X1TS U1112 ( .A0(n994), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(LZA_output[3]), 
        .Y(n775) );
  MXI2X2TS U1113 ( .A(n1012), .B(n1041), .S0(exp_oper_result[3]), .Y(n947) );
  INVX2TS U1114 ( .A(n749), .Y(n799) );
  AOI22X1TS U1115 ( .A0(n800), .A1(n947), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[27]), .B1(n799), .Y(n566)
         );
  OAI21X1TS U1116 ( .A0(n775), .A1(n824), .B0(n566), .Y(n567) );
  OAI32X1TS U1117 ( .A0(n567), .A1(n801), .A2(n551), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[35]), .B1(n567), .Y(n798)
         );
  AOI21X1TS U1118 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1(
        n962), .B0(n964), .Y(n568) );
  AOI22X1TS U1119 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[29]), .A1(
        n932), .B0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .B1(n962), 
        .Y(n570) );
  AOI21X1TS U1120 ( .A0(n951), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .B0(n964), .Y(n569)
         );
  AOI22X1TS U1121 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[31]), .A1(
        n932), .B0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .B1(n962), 
        .Y(n572) );
  AOI21X1TS U1122 ( .A0(n951), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .B0(n964), .Y(n571)
         );
  AOI22X1TS U1123 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[33]), .A1(
        n932), .B0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .B1(n962), 
        .Y(n575) );
  AOI21X1TS U1124 ( .A0(n951), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .B0(n964), .Y(n574)
         );
  NAND2X1TS U1125 ( .A(FSM_selector_C), .B(n576), .Y(n790) );
  INVX4TS U1126 ( .A(n634), .Y(n666) );
  OR2X2TS U1127 ( .A(n666), .B(n1023), .Y(n635) );
  INVX4TS U1128 ( .A(n635), .Y(n630) );
  NAND2X1TS U1129 ( .A(n630), .B(n1045), .Y(n578) );
  NAND2X1TS U1130 ( .A(n666), .B(n1113), .Y(n577) );
  INVX2TS U1131 ( .A(n981), .Y(n728) );
  NAND2X1TS U1132 ( .A(n707), .B(LZA_output[2]), .Y(n828) );
  NAND2X1TS U1133 ( .A(n420), .B(exp_oper_result[2]), .Y(n579) );
  BUFX3TS U1134 ( .A(n649), .Y(n663) );
  NAND2X1TS U1135 ( .A(n707), .B(LZA_output[1]), .Y(n830) );
  NAND2X1TS U1136 ( .A(n420), .B(exp_oper_result[1]), .Y(n580) );
  INVX2TS U1137 ( .A(n589), .Y(n975) );
  AOI22X1TS U1138 ( .A0(n707), .A1(LZA_output[0]), .B0(FSM_selector_B[1]), 
        .B1(n1020), .Y(n832) );
  INVX2TS U1139 ( .A(n581), .Y(n743) );
  INVX2TS U1140 ( .A(n582), .Y(n985) );
  OAI32X1TS U1141 ( .A0(n728), .A1(n984), .A2(n743), .B0(n583), .B1(n985), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[25]) );
  INVX2TS U1142 ( .A(n635), .Y(n668) );
  AOI22X1TS U1143 ( .A0(n666), .A1(Add_Subt_result[10]), .B0(DmP[13]), .B1(
        n1023), .Y(n585) );
  OAI2BB1X1TS U1144 ( .A0N(Add_Subt_result[15]), .A1N(n668), .B0(n585), .Y(
        n606) );
  AOI22X1TS U1145 ( .A0(n666), .A1(Add_Subt_result[6]), .B0(DmP[17]), .B1(n624), .Y(n586) );
  OAI21X1TS U1146 ( .A0(n635), .A1(n1070), .B0(n586), .Y(n661) );
  AOI21X1TS U1147 ( .A0(n630), .A1(Add_Subt_result[13]), .B0(n587), .Y(n608)
         );
  AOI21X1TS U1148 ( .A0(n630), .A1(Add_Subt_result[17]), .B0(n588), .Y(n598)
         );
  NAND2X2TS U1149 ( .A(n592), .B(n589), .Y(n735) );
  AOI21X1TS U1150 ( .A0(n630), .A1(Add_Subt_result[14]), .B0(n590), .Y(n610)
         );
  AOI21X1TS U1151 ( .A0(n668), .A1(Add_Subt_result[18]), .B0(n591), .Y(n664)
         );
  AOI22X1TS U1152 ( .A0(n437), .A1(n692), .B0(n435), .B1(n694), .Y(n596) );
  NAND2X2TS U1153 ( .A(n975), .B(n592), .Y(n674) );
  AOI21X1TS U1154 ( .A0(n630), .A1(Add_Subt_result[16]), .B0(n593), .Y(n602)
         );
  AOI21X1TS U1155 ( .A0(n630), .A1(Add_Subt_result[20]), .B0(n594), .Y(n669)
         );
  NAND2X1TS U1156 ( .A(n428), .B(n676), .Y(n595) );
  AOI22X1TS U1157 ( .A0(n437), .A1(n694), .B0(n433), .B1(n676), .Y(n600) );
  AOI21X1TS U1158 ( .A0(n668), .A1(Add_Subt_result[21]), .B0(n597), .Y(n729)
         );
  NAND2X1TS U1159 ( .A(n427), .B(n675), .Y(n599) );
  AOI21X1TS U1160 ( .A0(n630), .A1(Add_Subt_result[12]), .B0(n601), .Y(n647)
         );
  AOI22X1TS U1161 ( .A0(n581), .A1(n693), .B0(n435), .B1(n692), .Y(n604) );
  NAND2X1TS U1162 ( .A(n432), .B(n694), .Y(n603) );
  AOI22X1TS U1163 ( .A0(n666), .A1(Add_Subt_result[14]), .B0(DmP[9]), .B1(n624), .Y(n605) );
  OAI2BB1X1TS U1164 ( .A0N(Add_Subt_result[11]), .A1N(n668), .B0(n605), .Y(
        n640) );
  AOI21X1TS U1165 ( .A0(n630), .A1(Add_Subt_result[9]), .B0(n607), .Y(n627) );
  AOI21X1TS U1166 ( .A0(n630), .A1(Add_Subt_result[10]), .B0(n609), .Y(n642)
         );
  AOI22X1TS U1167 ( .A0(n581), .A1(n680), .B0(n434), .B1(n682), .Y(n612) );
  NAND2X1TS U1168 ( .A(n427), .B(n693), .Y(n611) );
  AOI22X1TS U1169 ( .A0(n581), .A1(n682), .B0(n433), .B1(n693), .Y(n614) );
  NAND2X1TS U1170 ( .A(n427), .B(n692), .Y(n613) );
  BUFX3TS U1171 ( .A(n649), .Y(n987) );
  AOI22X1TS U1172 ( .A0(n666), .A1(Add_Subt_result[22]), .B0(DmP[1]), .B1(
        n1023), .Y(n615) );
  OAI2BB1X1TS U1173 ( .A0N(Add_Subt_result[3]), .A1N(n668), .B0(n615), .Y(n617) );
  AOI22X1TS U1174 ( .A0(n666), .A1(Add_Subt_result[18]), .B0(DmP[5]), .B1(
        n1023), .Y(n616) );
  OAI2BB1X1TS U1175 ( .A0N(Add_Subt_result[7]), .A1N(n668), .B0(n616), .Y(n641) );
  AOI22X1TS U1176 ( .A0(n666), .A1(Add_Subt_result[23]), .B0(DmP[0]), .B1(n624), .Y(n620) );
  NAND2X1TS U1177 ( .A(n630), .B(Add_Subt_result[2]), .Y(n619) );
  AOI21X1TS U1178 ( .A0(n630), .A1(Add_Subt_result[6]), .B0(n618), .Y(n643) );
  NAND2X1TS U1179 ( .A(n666), .B(Add_Subt_result[21]), .Y(n621) );
  OAI2BB1X1TS U1180 ( .A0N(DmP[2]), .A1N(n1023), .B0(n621), .Y(n622) );
  AOI21X1TS U1181 ( .A0(n630), .A1(Add_Subt_result[4]), .B0(n622), .Y(n633) );
  AOI21X1TS U1182 ( .A0(n630), .A1(Add_Subt_result[8]), .B0(n623), .Y(n648) );
  AOI22X1TS U1183 ( .A0(n581), .A1(n654), .B0(n433), .B1(n687), .Y(n629) );
  AOI21X1TS U1184 ( .A0(n630), .A1(Add_Subt_result[5]), .B0(n626), .Y(n631) );
  NAND2X1TS U1185 ( .A(n428), .B(n686), .Y(n628) );
  AOI22X1TS U1186 ( .A0(n630), .A1(Add_Subt_result[1]), .B0(n666), .B1(
        Add_Subt_result[24]), .Y(n632) );
  AOI22X1TS U1187 ( .A0(n987), .A1(n632), .B0(n631), .B1(n984), .Y(n655) );
  AOI22X1TS U1188 ( .A0(n434), .A1(n655), .B0(n433), .B1(n654), .Y(n639) );
  INVX2TS U1189 ( .A(n633), .Y(n637) );
  OAI22X1TS U1190 ( .A0(n635), .A1(n1113), .B0(n1045), .B1(n634), .Y(n636) );
  OAI221XLTS U1191 ( .A0(n987), .A1(n637), .B0(n646), .B1(n636), .C0(n581), 
        .Y(n638) );
  AOI22X1TS U1192 ( .A0(n581), .A1(n687), .B0(n435), .B1(n686), .Y(n645) );
  NAND2X1TS U1193 ( .A(n433), .B(n688), .Y(n644) );
  AOI22X1TS U1194 ( .A0(n437), .A1(n686), .B0(n435), .B1(n688), .Y(n651) );
  NAND2X1TS U1195 ( .A(n428), .B(n681), .Y(n650) );
  AOI22X1TS U1196 ( .A0(n437), .A1(n681), .B0(n434), .B1(n680), .Y(n653) );
  NAND2X1TS U1197 ( .A(n432), .B(n682), .Y(n652) );
  AOI22X1TS U1198 ( .A0(n434), .A1(n654), .B0(n428), .B1(n687), .Y(n657) );
  NAND2X1TS U1199 ( .A(n581), .B(n655), .Y(n656) );
  AOI22X1TS U1200 ( .A0(n437), .A1(n688), .B0(n432), .B1(n681), .Y(n659) );
  NAND2X1TS U1201 ( .A(n427), .B(n680), .Y(n658) );
  AOI22X1TS U1202 ( .A0(n666), .A1(Add_Subt_result[2]), .B0(DmP[21]), .B1(n624), .Y(n660) );
  AOI22X1TS U1203 ( .A0(n666), .A1(Add_Subt_result[3]), .B0(DmP[20]), .B1(n624), .Y(n662) );
  AOI2BB2X2TS U1204 ( .B0(n987), .B1(n664), .A0N(n983), .A1N(n663), .Y(n732)
         );
  AOI22X1TS U1205 ( .A0(n581), .A1(n675), .B0(n435), .B1(n732), .Y(n671) );
  AOI22X1TS U1206 ( .A0(n666), .A1(Add_Subt_result[1]), .B0(DmP[22]), .B1(
        n1023), .Y(n667) );
  AOI2BB2X2TS U1207 ( .B0(n987), .B1(n669), .A0N(n980), .A1N(n987), .Y(n740)
         );
  NAND2X1TS U1208 ( .A(n428), .B(n740), .Y(n670) );
  AOI22X1TS U1209 ( .A0(n581), .A1(n676), .B0(n435), .B1(n675), .Y(n673) );
  NAND2X1TS U1210 ( .A(n433), .B(n732), .Y(n672) );
  AOI22X1TS U1211 ( .A0(n434), .A1(n676), .B0(n433), .B1(n675), .Y(n678) );
  NAND2X1TS U1212 ( .A(n427), .B(n732), .Y(n677) );
  AOI22X1TS U1213 ( .A0(n435), .A1(n681), .B0(n433), .B1(n680), .Y(n684) );
  NAND2X1TS U1214 ( .A(n428), .B(n682), .Y(n683) );
  AOI22X1TS U1215 ( .A0(n435), .A1(n687), .B0(n433), .B1(n686), .Y(n690) );
  NAND2X1TS U1216 ( .A(n428), .B(n688), .Y(n689) );
  AOI22X1TS U1217 ( .A0(n434), .A1(n693), .B0(n433), .B1(n692), .Y(n696) );
  NAND2X1TS U1218 ( .A(n427), .B(n694), .Y(n695) );
  AOI22X1TS U1219 ( .A0(n717), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[47]), .B0(n716), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .Y(n929) );
  NOR2X2TS U1220 ( .A(n826), .B(n930), .Y(n950) );
  INVX2TS U1221 ( .A(n950), .Y(n701) );
  NAND2X1TS U1222 ( .A(n703), .B(n698), .Y(n699) );
  OAI211X2TS U1223 ( .A0(LZA_output[3]), .A1(n701), .B0(n700), .C0(n699), .Y(
        n725) );
  NOR2X1TS U1224 ( .A(n994), .B(n701), .Y(n746) );
  NOR2X1TS U1225 ( .A(n930), .B(n702), .Y(n747) );
  AOI211X4TS U1226 ( .A0(n801), .A1(n703), .B0(n746), .C0(n747), .Y(n750) );
  AOI22X1TS U1227 ( .A0(LZA_output[3]), .A1(n1044), .B0(n1008), .B1(n994), .Y(
        n933) );
  CLKAND2X2TS U1228 ( .A(n420), .B(n1024), .Y(n780) );
  OAI22X1TS U1229 ( .A0(n750), .A1(n1047), .B0(n936), .B1(n952), .Y(n704) );
  AOI21X1TS U1230 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[39]), .A1(
        n725), .B0(n704), .Y(n706) );
  AOI21X4TS U1231 ( .A0(n824), .A1(n705), .B0(n930), .Y(n939) );
  INVX2TS U1232 ( .A(n939), .Y(n956) );
  AOI22X1TS U1233 ( .A0(n717), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(n716), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .Y(n712) );
  AOI22X1TS U1234 ( .A0(n717), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[44]), .B0(n716), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .Y(n711) );
  NAND2X2TS U1235 ( .A(n707), .B(n961), .Y(n928) );
  OAI22X1TS U1236 ( .A0(n711), .A1(n928), .B0(n1051), .B1(n927), .Y(n708) );
  AOI211XLTS U1237 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .A1(
        n725), .B0(n939), .C0(n708), .Y(n709) );
  OAI22X1TS U1238 ( .A0(n712), .A1(n928), .B0(n1048), .B1(n927), .Y(n713) );
  AOI211XLTS U1239 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[36]), .A1(
        n725), .B0(n939), .C0(n713), .Y(n714) );
  AOI22X1TS U1240 ( .A0(n717), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[48]), .B0(n716), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .Y(n723) );
  AOI22X1TS U1241 ( .A0(n717), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[45]), .B0(n716), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .Y(n722) );
  OAI22X1TS U1242 ( .A0(n722), .A1(n928), .B0(n1049), .B1(n927), .Y(n718) );
  AOI211XLTS U1243 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .A1(
        n725), .B0(n939), .C0(n718), .Y(n719) );
  OAI22X1TS U1244 ( .A0(n723), .A1(n928), .B0(n1050), .B1(n927), .Y(n724) );
  AOI211XLTS U1245 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .A1(
        n725), .B0(n939), .C0(n724), .Y(n726) );
  AOI22X1TS U1246 ( .A0(n437), .A1(n739), .B0(n423), .B1(n743), .Y(n730) );
  AOI22X1TS U1247 ( .A0(n581), .A1(n732), .B0(n433), .B1(n740), .Y(n734) );
  NAND2X1TS U1248 ( .A(n428), .B(n739), .Y(n733) );
  AOI22X1TS U1249 ( .A0(n432), .A1(n983), .B0(n427), .B1(n982), .Y(n738) );
  AOI22X1TS U1250 ( .A0(n581), .A1(n740), .B0(n435), .B1(n739), .Y(n737) );
  NAND2X1TS U1251 ( .A(n423), .B(n975), .Y(n736) );
  AOI22X1TS U1252 ( .A0(n435), .A1(n740), .B0(n433), .B1(n739), .Y(n742) );
  NAND2X1TS U1253 ( .A(n799), .B(n744), .Y(n777) );
  AO22X2TS U1254 ( .A0(n747), .A1(exp_oper_result[4]), .B0(LZA_output[4]), 
        .B1(n746), .Y(n785) );
  INVX2TS U1255 ( .A(n750), .Y(n783) );
  AOI22X1TS U1256 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .A1(
        n805), .B0(Barrel_Shifter_module_Mux_Array_Data_array[38]), .B1(n783), 
        .Y(n751) );
  AOI22X1TS U1257 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .A1(
        n805), .B0(Barrel_Shifter_module_Mux_Array_Data_array[39]), .B1(n783), 
        .Y(n755) );
  AOI22X1TS U1258 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .A1(
        n805), .B0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .B1(n783), 
        .Y(n759) );
  AOI22X1TS U1259 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .A1(
        n805), .B0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .B1(n783), 
        .Y(n763) );
  AOI22X1TS U1260 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .A1(
        n805), .B0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .B1(n783), 
        .Y(n767) );
  AOI22X1TS U1261 ( .A0(n805), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .B1(n783), .Y(n772)
         );
  INVX2TS U1262 ( .A(n775), .Y(n949) );
  AOI222X1TS U1263 ( .A0(n949), .A1(n781), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(FSM_selector_B[1]), .C0(n947), .C1(n780), .Y(n954) );
  AOI222X1TS U1264 ( .A0(n782), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B0(n551), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .C0(n799), .C1(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n953) );
  OAI2BB2XLTS U1265 ( .B0(n955), .B1(n953), .A0N(n783), .A1N(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .Y(n776) );
  AOI211X1TS U1266 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1(
        n939), .B0(n785), .C0(n776), .Y(n779) );
  INVX2TS U1267 ( .A(n777), .Y(n786) );
  NAND2X1TS U1268 ( .A(n786), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n778) );
  OAI22X1TS U1269 ( .A0(n994), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(LZA_output[3]), 
        .Y(n804) );
  INVX2TS U1270 ( .A(n804), .Y(n941) );
  MXI2X2TS U1271 ( .A(n1013), .B(n1042), .S0(exp_oper_result[3]), .Y(n940) );
  AOI222X1TS U1272 ( .A0(n941), .A1(n781), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(FSM_selector_B[1]), .C0(n940), .C1(n780), .Y(n942) );
  AOI222X1TS U1273 ( .A0(n782), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .B1(n551), .C0(n799), 
        .C1(Barrel_Shifter_module_Mux_Array_Data_array[35]), .Y(n943) );
  OAI2BB2XLTS U1274 ( .B0(n955), .B1(n943), .A0N(n783), .A1N(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .Y(n784) );
  AOI211X1TS U1275 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[51]), .A1(
        n939), .B0(n785), .C0(n784), .Y(n788) );
  NAND2X1TS U1276 ( .A(Barrel_Shifter_module_Mux_Array_Data_array[35]), .B(
        n786), .Y(n787) );
  OAI21X1TS U1277 ( .A0(FS_Module_state_reg[0]), .A1(n790), .B0(n789), .Y(n797) );
  INVX2TS U1278 ( .A(n797), .Y(n792) );
  OR4X2TS U1279 ( .A(Exp_Operation_Module_Data_S[2]), .B(
        Exp_Operation_Module_Data_S[1]), .C(Exp_Operation_Module_Data_S[0]), 
        .D(n792), .Y(n793) );
  OR4X2TS U1280 ( .A(Exp_Operation_Module_Data_S[5]), .B(
        Exp_Operation_Module_Data_S[4]), .C(Exp_Operation_Module_Data_S[3]), 
        .D(n793), .Y(n794) );
  OR4X2TS U1281 ( .A(n795), .B(Exp_Operation_Module_Data_S[7]), .C(
        Exp_Operation_Module_Data_S[6]), .D(n794), .Y(n796) );
  OAI2BB2XLTS U1282 ( .B0(n961), .B1(n798), .A0N(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1N(n805), .Y(n1122)
         );
  AOI22X1TS U1283 ( .A0(n800), .A1(n940), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[26]), .B1(n799), .Y(n803)
         );
  OAI211X1TS U1284 ( .A0(n804), .A1(n824), .B0(n803), .C0(n802), .Y(n960) );
  NOR2BX1TS U1285 ( .AN(Sgf_normalized_result[14]), .B(n835), .Y(n806) );
  XOR2X1TS U1286 ( .A(n820), .B(n806), .Y(DP_OP_45J176_125_5354_n42) );
  NOR2BX1TS U1287 ( .AN(Sgf_normalized_result[13]), .B(n834), .Y(n807) );
  XOR2X1TS U1288 ( .A(n820), .B(n807), .Y(DP_OP_45J176_125_5354_n43) );
  NOR2BX1TS U1289 ( .AN(Sgf_normalized_result[12]), .B(n834), .Y(n808) );
  XOR2X1TS U1290 ( .A(n820), .B(n808), .Y(DP_OP_45J176_125_5354_n44) );
  NOR2BX1TS U1291 ( .AN(Sgf_normalized_result[11]), .B(n835), .Y(n809) );
  XOR2X1TS U1292 ( .A(n820), .B(n809), .Y(DP_OP_45J176_125_5354_n45) );
  NOR2BX1TS U1293 ( .AN(Sgf_normalized_result[10]), .B(n834), .Y(n810) );
  XOR2X1TS U1294 ( .A(n820), .B(n810), .Y(DP_OP_45J176_125_5354_n46) );
  NOR2BX1TS U1295 ( .AN(Sgf_normalized_result[9]), .B(n834), .Y(n811) );
  XOR2X1TS U1296 ( .A(n820), .B(n811), .Y(DP_OP_45J176_125_5354_n47) );
  NOR2BX1TS U1297 ( .AN(Sgf_normalized_result[8]), .B(n835), .Y(n812) );
  XOR2X1TS U1298 ( .A(n820), .B(n812), .Y(DP_OP_45J176_125_5354_n48) );
  NOR2BX1TS U1299 ( .AN(Sgf_normalized_result[7]), .B(n834), .Y(n813) );
  XOR2X1TS U1300 ( .A(n820), .B(n813), .Y(DP_OP_45J176_125_5354_n49) );
  NOR2BX1TS U1301 ( .AN(Sgf_normalized_result[6]), .B(n834), .Y(n814) );
  XOR2X1TS U1302 ( .A(n820), .B(n814), .Y(DP_OP_45J176_125_5354_n50) );
  NOR2BX1TS U1303 ( .AN(Sgf_normalized_result[5]), .B(n834), .Y(n815) );
  XOR2X1TS U1304 ( .A(n820), .B(n815), .Y(DP_OP_45J176_125_5354_n51) );
  NOR2BX1TS U1305 ( .AN(Sgf_normalized_result[4]), .B(n834), .Y(n816) );
  XOR2X1TS U1306 ( .A(n820), .B(n816), .Y(DP_OP_45J176_125_5354_n52) );
  NOR2BX1TS U1307 ( .AN(Sgf_normalized_result[3]), .B(n834), .Y(n817) );
  XOR2X1TS U1308 ( .A(n820), .B(n817), .Y(DP_OP_45J176_125_5354_n53) );
  XOR2X1TS U1309 ( .A(n820), .B(n818), .Y(DP_OP_45J176_125_5354_n54) );
  NOR2BX1TS U1310 ( .AN(Sgf_normalized_result[1]), .B(n834), .Y(n819) );
  XOR2X1TS U1311 ( .A(n820), .B(n819), .Y(DP_OP_45J176_125_5354_n55) );
  CLKAND2X2TS U1312 ( .A(n420), .B(DmP[30]), .Y(n821) );
  XOR2X1TS U1313 ( .A(n1089), .B(n821), .Y(DP_OP_42J176_122_8048_n13) );
  XOR2X1TS U1314 ( .A(n1089), .B(n822), .Y(DP_OP_42J176_122_8048_n14) );
  XOR2X1TS U1315 ( .A(n1089), .B(n823), .Y(DP_OP_42J176_122_8048_n15) );
  OAI2BB1X1TS U1316 ( .A0N(n420), .A1N(DmP[27]), .B0(n824), .Y(n825) );
  XOR2X1TS U1317 ( .A(n1089), .B(n825), .Y(DP_OP_42J176_122_8048_n16) );
  OAI2BB2XLTS U1318 ( .B0(n826), .B1(n994), .A0N(n420), .A1N(DmP[26]), .Y(n827) );
  XOR2X1TS U1319 ( .A(n1089), .B(n827), .Y(DP_OP_42J176_122_8048_n17) );
  OAI2BB1X1TS U1320 ( .A0N(n420), .A1N(DmP[25]), .B0(n828), .Y(n829) );
  XOR2X1TS U1321 ( .A(n1089), .B(n829), .Y(DP_OP_42J176_122_8048_n18) );
  OAI2BB1X1TS U1322 ( .A0N(n420), .A1N(DmP[24]), .B0(n830), .Y(n831) );
  XOR2X1TS U1323 ( .A(n1089), .B(n831), .Y(DP_OP_42J176_122_8048_n19) );
  OAI2BB1X1TS U1324 ( .A0N(DmP[23]), .A1N(n1020), .B0(n832), .Y(n833) );
  XOR2X1TS U1325 ( .A(n1089), .B(n833), .Y(DP_OP_42J176_122_8048_n20) );
  BUFX4TS U1326 ( .A(FSM_selector_D), .Y(n848) );
  AOI21X1TS U1327 ( .A0(n837), .A1(n1053), .B0(n836), .Y(n838) );
  AOI22X1TS U1328 ( .A0(n1020), .A1(n847), .B0(add_overflow_flag), .B1(n845), 
        .Y(n405) );
  AOI21X1TS U1329 ( .A0(n847), .A1(n438), .B0(n846), .Y(n404) );
  OAI31X1TS U1330 ( .A0(n1070), .A1(Add_Subt_result[21]), .A2(
        Add_Subt_result[20]), .B0(n849), .Y(n852) );
  OAI211XLTS U1331 ( .A0(Add_Subt_result[15]), .A1(Add_Subt_result[14]), .B0(
        n1009), .C0(n1069), .Y(n851) );
  AOI2BB2XLTS U1332 ( .B0(n853), .B1(n852), .A0N(n851), .A1N(n850), .Y(n856)
         );
  NAND4XLTS U1333 ( .A(n854), .B(Add_Subt_result[11]), .C(n1054), .D(n1014), 
        .Y(n855) );
  NAND2BXLTS U1334 ( .AN(exp_oper_result[7]), .B(n989), .Y(
        final_result_ieee_Module_Exp_S_mux[7]) );
  NAND2BXLTS U1335 ( .AN(exp_oper_result[6]), .B(n989), .Y(
        final_result_ieee_Module_Exp_S_mux[6]) );
  NAND2BXLTS U1336 ( .AN(exp_oper_result[5]), .B(n989), .Y(
        final_result_ieee_Module_Exp_S_mux[5]) );
  NAND2BXLTS U1337 ( .AN(exp_oper_result[1]), .B(n989), .Y(
        final_result_ieee_Module_Exp_S_mux[1]) );
  NAND2BXLTS U1338 ( .AN(exp_oper_result[0]), .B(n989), .Y(
        final_result_ieee_Module_Exp_S_mux[0]) );
  XNOR2X1TS U1339 ( .A(add_subt), .B(Data_Y[31]), .Y(n1088) );
  NOR2X1TS U1340 ( .A(n1079), .B(intDX[25]), .Y(n918) );
  AOI22X1TS U1341 ( .A0(intDX[25]), .A1(n1079), .B0(intDX[24]), .B1(n859), .Y(
        n863) );
  OAI21X1TS U1342 ( .A0(intDX[26]), .A1(n1082), .B0(n860), .Y(n919) );
  NOR2X1TS U1343 ( .A(n1010), .B(intDX[30]), .Y(n866) );
  NOR2X1TS U1344 ( .A(n1076), .B(intDX[29]), .Y(n864) );
  AOI211X1TS U1345 ( .A0(intDY[28]), .A1(n1090), .B0(n866), .C0(n864), .Y(n917) );
  NOR3X1TS U1346 ( .A(n1090), .B(n864), .C(intDY[28]), .Y(n865) );
  AOI2BB2X1TS U1347 ( .B0(n868), .B1(n917), .A0N(n867), .A1N(n866), .Y(n923)
         );
  NOR2X1TS U1348 ( .A(n1078), .B(intDX[17]), .Y(n904) );
  OAI2BB1X1TS U1349 ( .A0N(n1039), .A1N(intDY[5]), .B0(intDX[4]), .Y(n869) );
  OAI22X1TS U1350 ( .A0(intDY[4]), .A1(n869), .B0(n1039), .B1(intDY[5]), .Y(
        n880) );
  OAI2BB1X1TS U1351 ( .A0N(n1091), .A1N(intDY[7]), .B0(intDX[6]), .Y(n870) );
  OAI22X1TS U1352 ( .A0(intDY[6]), .A1(n870), .B0(n1091), .B1(intDY[7]), .Y(
        n879) );
  OAI2BB2XLTS U1353 ( .B0(intDY[0]), .B1(n871), .A0N(intDX[1]), .A1N(n1080), 
        .Y(n873) );
  AOI222X1TS U1354 ( .A0(intDY[4]), .A1(n1006), .B0(n876), .B1(n875), .C0(
        intDY[5]), .C1(n1039), .Y(n878) );
  OAI32X1TS U1355 ( .A0(n880), .A1(n879), .A2(n878), .B0(n877), .B1(n879), .Y(
        n898) );
  OA22X1TS U1356 ( .A0(n1018), .A1(intDX[14]), .B0(n1083), .B1(intDX[15]), .Y(
        n895) );
  OAI2BB2XLTS U1357 ( .B0(intDY[12]), .B1(n882), .A0N(intDX[13]), .A1N(n1061), 
        .Y(n894) );
  AOI22X1TS U1358 ( .A0(intDX[11]), .A1(n1074), .B0(intDX[10]), .B1(n884), .Y(
        n890) );
  AOI21X1TS U1359 ( .A0(n887), .A1(n886), .B0(n897), .Y(n889) );
  OAI2BB2XLTS U1360 ( .B0(intDY[14]), .B1(n891), .A0N(intDX[15]), .A1N(n1083), 
        .Y(n892) );
  AOI211X1TS U1361 ( .A0(n895), .A1(n894), .B0(n893), .C0(n892), .Y(n896) );
  OAI31X1TS U1362 ( .A0(n899), .A1(n898), .A2(n897), .B0(n896), .Y(n902) );
  OA22X1TS U1363 ( .A0(n1019), .A1(intDX[22]), .B0(n1084), .B1(intDX[23]), .Y(
        n915) );
  OAI21X1TS U1364 ( .A0(intDX[18]), .A1(n1075), .B0(n906), .Y(n910) );
  AOI211X1TS U1365 ( .A0(intDY[16]), .A1(n1046), .B0(n909), .C0(n910), .Y(n901) );
  OAI2BB2XLTS U1366 ( .B0(intDY[20]), .B1(n903), .A0N(intDX[21]), .A1N(n1062), 
        .Y(n914) );
  AOI22X1TS U1367 ( .A0(intDX[17]), .A1(n1078), .B0(intDX[16]), .B1(n905), .Y(
        n908) );
  AOI32X1TS U1368 ( .A0(n1075), .A1(n906), .A2(intDX[18]), .B0(intDX[19]), 
        .B1(n1017), .Y(n907) );
  OAI32X1TS U1369 ( .A0(n910), .A1(n909), .A2(n908), .B0(n907), .B1(n909), .Y(
        n913) );
  OAI2BB2XLTS U1370 ( .B0(intDY[22]), .B1(n911), .A0N(intDX[23]), .A1N(n1084), 
        .Y(n912) );
  AOI211X1TS U1371 ( .A0(n915), .A1(n914), .B0(n913), .C0(n912), .Y(n921) );
  NAND4BBX1TS U1372 ( .AN(n919), .BN(n918), .C(n917), .D(n916), .Y(n920) );
  AOI32X1TS U1373 ( .A0(n923), .A1(n922), .A2(n921), .B0(n920), .B1(n923), .Y(
        n924) );
  AOI21X1TS U1374 ( .A0(n925), .A1(n973), .B0(intDX[31]), .Y(n926) );
  AOI21X1TS U1375 ( .A0(n1115), .A1(n968), .B0(n926), .Y(n1117) );
  OAI22X1TS U1376 ( .A0(n929), .A1(n928), .B0(n1047), .B1(n927), .Y(n938) );
  AOI22X1TS U1377 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[38]), .A1(
        n429), .B0(n948), .B1(n931), .Y(n935) );
  AOI22X1TS U1378 ( .A0(n950), .A1(n933), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .B1(n932), .Y(n934)
         );
  OR3X1TS U1379 ( .A(n939), .B(n938), .C(n937), .Y(n1142) );
  AOI22X1TS U1380 ( .A0(n950), .A1(n941), .B0(n948), .B1(n940), .Y(n946) );
  AOI22X1TS U1381 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[43]), .A1(
        n951), .B0(Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(n429), 
        .Y(n945) );
  OA22X1TS U1382 ( .A0(n943), .A1(n952), .B0(n955), .B1(n942), .Y(n944) );
  AOI22X1TS U1383 ( .A0(n950), .A1(n949), .B0(n948), .B1(n947), .Y(n959) );
  AOI22X1TS U1384 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[43]), .A1(
        n429), .B0(Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(n951), 
        .Y(n958) );
  OA22X1TS U1385 ( .A0(n955), .A1(n954), .B0(n953), .B1(n952), .Y(n957) );
  AOI22X1TS U1386 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[51]), .A1(
        n962), .B0(n961), .B1(n960), .Y(n963) );
  AOI21X1TS U1387 ( .A0(n1015), .A1(n1087), .B0(overflow_flag), .Y(
        final_result_ieee_Module_Sign_S_mux) );
  AOI22X1TS U1388 ( .A0(n965), .A1(n1085), .B0(n1007), .B1(n966), .Y(
        Oper_Start_in_module_intm[0]) );
  AOI22X1TS U1389 ( .A0(n965), .A1(n1080), .B0(n1026), .B1(n968), .Y(
        Oper_Start_in_module_intm[1]) );
  AOI22X1TS U1390 ( .A0(n965), .A1(n1063), .B0(n1004), .B1(n970), .Y(
        Oper_Start_in_module_intm[2]) );
  AOI22X1TS U1391 ( .A0(n965), .A1(n1081), .B0(n1028), .B1(n970), .Y(
        Oper_Start_in_module_intm[3]) );
  AOI22X1TS U1392 ( .A0(n965), .A1(n1059), .B0(n1006), .B1(n970), .Y(
        Oper_Start_in_module_intm[4]) );
  AOI22X1TS U1393 ( .A0(n965), .A1(n1055), .B0(n1039), .B1(n970), .Y(
        Oper_Start_in_module_intm[5]) );
  AOI22X1TS U1394 ( .A0(n965), .A1(n1072), .B0(n1011), .B1(n970), .Y(
        Oper_Start_in_module_intm[6]) );
  AOI22X1TS U1395 ( .A0(n965), .A1(n1065), .B0(n1091), .B1(n970), .Y(
        Oper_Start_in_module_intm[7]) );
  AOI22X1TS U1396 ( .A0(n965), .A1(n1077), .B0(n1029), .B1(n966), .Y(
        Oper_Start_in_module_intm[8]) );
  AOI22X1TS U1397 ( .A0(n965), .A1(n1066), .B0(n996), .B1(n966), .Y(
        Oper_Start_in_module_intm[9]) );
  AOI22X1TS U1398 ( .A0(n965), .A1(n1073), .B0(n1003), .B1(n966), .Y(
        Oper_Start_in_module_intm[10]) );
  AOI22X1TS U1399 ( .A0(n965), .A1(n1074), .B0(n1021), .B1(n966), .Y(
        Oper_Start_in_module_intm[11]) );
  AOI22X1TS U1400 ( .A0(n965), .A1(n1030), .B0(n1058), .B1(n966), .Y(
        Oper_Start_in_module_intm[12]) );
  AOI22X1TS U1401 ( .A0(n967), .A1(n1061), .B0(n1034), .B1(n966), .Y(
        Oper_Start_in_module_intm[13]) );
  AOI22X1TS U1402 ( .A0(n967), .A1(n1018), .B0(n997), .B1(n966), .Y(
        Oper_Start_in_module_intm[14]) );
  AOI22X1TS U1403 ( .A0(n967), .A1(n1083), .B0(n1035), .B1(n966), .Y(
        Oper_Start_in_module_intm[15]) );
  AOI22X1TS U1404 ( .A0(n967), .A1(n1057), .B0(n1046), .B1(n966), .Y(
        Oper_Start_in_module_intm[16]) );
  AOI22X1TS U1405 ( .A0(n967), .A1(n1078), .B0(n1031), .B1(n966), .Y(
        Oper_Start_in_module_intm[17]) );
  AOI22X1TS U1406 ( .A0(n967), .A1(n1075), .B0(n998), .B1(n968), .Y(
        Oper_Start_in_module_intm[18]) );
  AOI22X1TS U1407 ( .A0(n967), .A1(n1017), .B0(n1032), .B1(n968), .Y(
        Oper_Start_in_module_intm[19]) );
  AOI22X1TS U1408 ( .A0(n967), .A1(n1064), .B0(n999), .B1(n968), .Y(
        Oper_Start_in_module_intm[20]) );
  AOI22X1TS U1409 ( .A0(n967), .A1(n1062), .B0(n1036), .B1(n968), .Y(
        Oper_Start_in_module_intm[21]) );
  AOI22X1TS U1410 ( .A0(n967), .A1(n1019), .B0(n1000), .B1(n968), .Y(
        Oper_Start_in_module_intm[22]) );
  AOI22X1TS U1411 ( .A0(n967), .A1(n1084), .B0(n1037), .B1(n968), .Y(
        Oper_Start_in_module_intm[23]) );
  AOI22X1TS U1412 ( .A0(n967), .A1(n1060), .B0(n1001), .B1(n968), .Y(
        Oper_Start_in_module_intm[24]) );
  AOI22X1TS U1413 ( .A0(n967), .A1(n1079), .B0(n1033), .B1(n968), .Y(
        Oper_Start_in_module_intm[25]) );
  AOI22X1TS U1414 ( .A0(n969), .A1(n1082), .B0(n1002), .B1(n968), .Y(
        Oper_Start_in_module_intm[26]) );
  AOI22X1TS U1415 ( .A0(n969), .A1(n1067), .B0(n1005), .B1(n968), .Y(
        Oper_Start_in_module_intm[27]) );
  AOI22X1TS U1416 ( .A0(n969), .A1(n1056), .B0(n1090), .B1(n970), .Y(
        Oper_Start_in_module_intm[28]) );
  AOI22X1TS U1417 ( .A0(n969), .A1(n1076), .B0(n1027), .B1(n973), .Y(
        Oper_Start_in_module_intm[29]) );
  AOI22X1TS U1418 ( .A0(n969), .A1(n1010), .B0(n1040), .B1(n966), .Y(
        Oper_Start_in_module_intm[30]) );
  AOI22X1TS U1419 ( .A0(n969), .A1(n1007), .B0(n1085), .B1(n968), .Y(
        Oper_Start_in_module_intM[0]) );
  AOI22X1TS U1420 ( .A0(n969), .A1(n1026), .B0(n1080), .B1(n966), .Y(
        Oper_Start_in_module_intM[1]) );
  AOI22X1TS U1421 ( .A0(n969), .A1(n1004), .B0(n1063), .B1(n972), .Y(
        Oper_Start_in_module_intM[2]) );
  AOI22X1TS U1422 ( .A0(n969), .A1(n1028), .B0(n1081), .B1(n968), .Y(
        Oper_Start_in_module_intM[3]) );
  AOI22X1TS U1423 ( .A0(n969), .A1(n1006), .B0(n1059), .B1(n972), .Y(
        Oper_Start_in_module_intM[4]) );
  AOI22X1TS U1424 ( .A0(n969), .A1(n1039), .B0(n1055), .B1(n972), .Y(
        Oper_Start_in_module_intM[5]) );
  AOI22X1TS U1425 ( .A0(n969), .A1(n1011), .B0(n1072), .B1(n973), .Y(
        Oper_Start_in_module_intM[6]) );
  AOI22X1TS U1426 ( .A0(n969), .A1(n1091), .B0(n1065), .B1(n973), .Y(
        Oper_Start_in_module_intM[7]) );
  AOI22X1TS U1427 ( .A0(n971), .A1(n1029), .B0(n1077), .B1(n973), .Y(
        Oper_Start_in_module_intM[8]) );
  AOI22X1TS U1428 ( .A0(n971), .A1(n996), .B0(n1066), .B1(n973), .Y(
        Oper_Start_in_module_intM[9]) );
  AOI22X1TS U1429 ( .A0(n971), .A1(n1003), .B0(n1073), .B1(n973), .Y(
        Oper_Start_in_module_intM[10]) );
  AOI22X1TS U1430 ( .A0(n971), .A1(n1021), .B0(n1074), .B1(n970), .Y(
        Oper_Start_in_module_intM[11]) );
  AOI22X1TS U1431 ( .A0(n971), .A1(n1058), .B0(n1030), .B1(n970), .Y(
        Oper_Start_in_module_intM[12]) );
  AOI22X1TS U1432 ( .A0(n971), .A1(n1034), .B0(n1061), .B1(n970), .Y(
        Oper_Start_in_module_intM[13]) );
  AOI22X1TS U1433 ( .A0(n971), .A1(n997), .B0(n1018), .B1(n970), .Y(
        Oper_Start_in_module_intM[14]) );
  AOI22X1TS U1434 ( .A0(n971), .A1(n1035), .B0(n1083), .B1(n970), .Y(
        Oper_Start_in_module_intM[15]) );
  BUFX3TS U1435 ( .A(n973), .Y(n972) );
  AOI22X1TS U1436 ( .A0(n971), .A1(n1046), .B0(n1057), .B1(n972), .Y(
        Oper_Start_in_module_intM[16]) );
  AOI22X1TS U1437 ( .A0(n971), .A1(n1031), .B0(n1078), .B1(n972), .Y(
        Oper_Start_in_module_intM[17]) );
  AOI22X1TS U1438 ( .A0(n971), .A1(n998), .B0(n1075), .B1(n972), .Y(
        Oper_Start_in_module_intM[18]) );
  AOI22X1TS U1439 ( .A0(n971), .A1(n1032), .B0(n1017), .B1(n972), .Y(
        Oper_Start_in_module_intM[19]) );
  AOI22X1TS U1440 ( .A0(n971), .A1(n999), .B0(n1064), .B1(n972), .Y(
        Oper_Start_in_module_intM[20]) );
  AOI22X1TS U1441 ( .A0(n974), .A1(n1036), .B0(n1062), .B1(n972), .Y(
        Oper_Start_in_module_intM[21]) );
  AOI22X1TS U1442 ( .A0(n974), .A1(n1000), .B0(n1019), .B1(n972), .Y(
        Oper_Start_in_module_intM[22]) );
  AOI22X1TS U1443 ( .A0(n974), .A1(n1037), .B0(n1084), .B1(n972), .Y(
        Oper_Start_in_module_intM[23]) );
  AOI22X1TS U1444 ( .A0(n974), .A1(n1001), .B0(n1060), .B1(n972), .Y(
        Oper_Start_in_module_intM[24]) );
  AOI22X1TS U1445 ( .A0(n974), .A1(n1033), .B0(n1079), .B1(n972), .Y(
        Oper_Start_in_module_intM[25]) );
  AOI22X1TS U1446 ( .A0(n974), .A1(n1002), .B0(n1082), .B1(n973), .Y(
        Oper_Start_in_module_intM[26]) );
  AOI22X1TS U1447 ( .A0(n974), .A1(n1005), .B0(n1067), .B1(n973), .Y(
        Oper_Start_in_module_intM[27]) );
  AOI22X1TS U1448 ( .A0(n974), .A1(n1090), .B0(n1056), .B1(n973), .Y(
        Oper_Start_in_module_intM[28]) );
  AOI22X1TS U1449 ( .A0(n974), .A1(n1027), .B0(n1076), .B1(n973), .Y(
        Oper_Start_in_module_intM[29]) );
  AOI22X1TS U1450 ( .A0(n974), .A1(n1040), .B0(n1010), .B1(n973), .Y(
        Oper_Start_in_module_intM[30]) );
  AOI22X1TS U1451 ( .A0(n581), .A1(n980), .B0(n434), .B1(n981), .Y(n976) );
  OAI22X1TS U1452 ( .A0(n985), .A1(n977), .B0(n976), .B1(n984), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[24]) );
  OAI22X1TS U1453 ( .A0(n985), .A1(n979), .B0(n978), .B1(n984), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[23]) );
  AOI22X1TS U1454 ( .A0(n427), .A1(n981), .B0(n432), .B1(n980), .Y(n988) );
  AOI22X1TS U1455 ( .A0(n581), .A1(n983), .B0(n434), .B1(n982), .Y(n986) );
  AOI32X1TS U1456 ( .A0(n988), .A1(n987), .A2(n986), .B0(n985), .B1(n984), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[22]) );
  CLKAND2X2TS U1457 ( .A(n991), .B(Sgf_normalized_result[2]), .Y(
        final_result_ieee_Module_Sgf_S_mux[0]) );
  CLKAND2X2TS U1458 ( .A(n991), .B(Sgf_normalized_result[3]), .Y(
        final_result_ieee_Module_Sgf_S_mux[1]) );
  CLKAND2X2TS U1459 ( .A(n991), .B(Sgf_normalized_result[4]), .Y(
        final_result_ieee_Module_Sgf_S_mux[2]) );
  CLKAND2X2TS U1460 ( .A(n991), .B(Sgf_normalized_result[5]), .Y(
        final_result_ieee_Module_Sgf_S_mux[3]) );
  CLKAND2X2TS U1461 ( .A(n991), .B(Sgf_normalized_result[6]), .Y(
        final_result_ieee_Module_Sgf_S_mux[4]) );
  CLKAND2X2TS U1462 ( .A(n991), .B(Sgf_normalized_result[7]), .Y(
        final_result_ieee_Module_Sgf_S_mux[5]) );
  CLKAND2X2TS U1463 ( .A(n991), .B(Sgf_normalized_result[8]), .Y(
        final_result_ieee_Module_Sgf_S_mux[6]) );
  CLKAND2X2TS U1464 ( .A(n991), .B(Sgf_normalized_result[9]), .Y(
        final_result_ieee_Module_Sgf_S_mux[7]) );
  CLKAND2X2TS U1465 ( .A(n991), .B(Sgf_normalized_result[10]), .Y(
        final_result_ieee_Module_Sgf_S_mux[8]) );
  CLKAND2X2TS U1466 ( .A(n991), .B(Sgf_normalized_result[11]), .Y(
        final_result_ieee_Module_Sgf_S_mux[9]) );
  CLKAND2X2TS U1467 ( .A(n991), .B(Sgf_normalized_result[12]), .Y(
        final_result_ieee_Module_Sgf_S_mux[10]) );
  CLKAND2X2TS U1468 ( .A(n991), .B(Sgf_normalized_result[13]), .Y(
        final_result_ieee_Module_Sgf_S_mux[11]) );
  CLKAND2X2TS U1469 ( .A(n991), .B(Sgf_normalized_result[14]), .Y(
        final_result_ieee_Module_Sgf_S_mux[12]) );
  CLKAND2X2TS U1470 ( .A(n991), .B(Sgf_normalized_result[15]), .Y(
        final_result_ieee_Module_Sgf_S_mux[13]) );
  CLKAND2X2TS U1471 ( .A(n989), .B(Sgf_normalized_result[16]), .Y(
        final_result_ieee_Module_Sgf_S_mux[14]) );
  CLKAND2X2TS U1472 ( .A(n989), .B(Sgf_normalized_result[17]), .Y(
        final_result_ieee_Module_Sgf_S_mux[15]) );
  CLKAND2X2TS U1473 ( .A(n989), .B(Sgf_normalized_result[18]), .Y(
        final_result_ieee_Module_Sgf_S_mux[16]) );
  CLKAND2X2TS U1474 ( .A(n989), .B(Sgf_normalized_result[19]), .Y(
        final_result_ieee_Module_Sgf_S_mux[17]) );
  CLKAND2X2TS U1475 ( .A(n989), .B(Sgf_normalized_result[20]), .Y(
        final_result_ieee_Module_Sgf_S_mux[18]) );
  CLKAND2X2TS U1476 ( .A(n989), .B(Sgf_normalized_result[21]), .Y(
        final_result_ieee_Module_Sgf_S_mux[19]) );
  CLKAND2X2TS U1477 ( .A(n989), .B(Sgf_normalized_result[22]), .Y(
        final_result_ieee_Module_Sgf_S_mux[20]) );
  CLKAND2X2TS U1478 ( .A(n990), .B(Sgf_normalized_result[23]), .Y(
        final_result_ieee_Module_Sgf_S_mux[21]) );
  CLKAND2X2TS U1479 ( .A(n991), .B(Sgf_normalized_result[24]), .Y(
        final_result_ieee_Module_Sgf_S_mux[22]) );
  NAND2X1TS U1481 ( .A(n993), .B(n992), .Y(FSM_barrel_shifter_load) );
initial $sdf_annotate("FPU_Add_Subtract_Function_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule

