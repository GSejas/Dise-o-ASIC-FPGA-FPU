/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Nov  3 17:57:28 2016
/////////////////////////////////////////////////////////////


module CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_fsm_cordic, 
        ack_cordic, operation, data_in, shift_region_flag, ready_cordic, 
        data_output, beg_add_subt, ack_add_subt, add_subt_dataA, 
        add_subt_dataB, result_add_subt, op_add_subt, ready_add_subt );
  input [31:0] data_in;
  input [1:0] shift_region_flag;
  output [31:0] data_output;
  output [31:0] add_subt_dataA;
  output [31:0] add_subt_dataB;
  input [31:0] result_add_subt;
  input clk, rst, beg_fsm_cordic, ack_cordic, operation, ready_add_subt;
  output ready_cordic, beg_add_subt, ack_add_subt, op_add_subt;
  wire   d_ff1_operation_out, sel_mux_1_reg, d_ff3_sign_out, sel_mux_3_reg,
         data_output2_31_, cordic_FSM_state_next_1_, n331, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
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
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952, n953, n954,
         n955, n956, n957, n958, n959, n960, n961, n962, n963, n964, n965,
         n966, n967, n968, n969, n970, n971, n972, n973, n974, n975, n976,
         n977, n978, n979, n980, n981, n982, n983, n984, n985, n986, n987,
         n988, n989, n990, n991, n992, n993, n994, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1034, n1035, n1036, n1037, n1038, n1039,
         n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049,
         n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110,
         n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120,
         n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140,
         n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150,
         n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160,
         n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170,
         n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180,
         n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190,
         n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200,
         n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210,
         n1211, n1212, n1213, n1214;
  wire   [1:0] d_ff1_shift_region_flag_out;
  wire   [1:0] cont_var_out;
  wire   [3:1] cont_iter_out;
  wire   [31:0] d_ff1_Z;
  wire   [31:0] d_ff_Xn;
  wire   [31:0] d_ff_Yn;
  wire   [31:0] d_ff_Zn;
  wire   [31:0] d_ff2_X;
  wire   [31:0] d_ff2_Y;
  wire   [31:0] d_ff2_Z;
  wire   [31:0] d_ff3_sh_x_out;
  wire   [31:0] d_ff3_sh_y_out;
  wire   [27:0] d_ff3_LUT_out;
  wire   [1:0] sel_mux_2_reg;
  wire   [30:0] sign_inv_out;
  wire   [3:0] cordic_FSM_state_reg;

  DFFRXLTS cont_iter_count_reg_2_ ( .D(n726), .CK(clk), .RN(n1201), .Q(
        cont_iter_out[2]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(n720), .CK(clk), .RN(n1202), .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(n719), .CK(clk), .RN(n1202), .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(n718), .CK(clk), .RN(n1202), .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(n717), .CK(clk), .RN(n1202), .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(n716), .CK(clk), .RN(n1202), .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(n715), .CK(clk), .RN(n1202), .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(n714), .CK(clk), .RN(n1202), .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(n713), .CK(clk), .RN(n1202), .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(n712), .CK(clk), .RN(n1203), .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(n711), .CK(clk), .RN(n1203), .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(n710), .CK(clk), .RN(n1203), .Q(d_ff1_Z[10])
         );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(n709), .CK(clk), .RN(n1203), .Q(d_ff1_Z[11])
         );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(n708), .CK(clk), .RN(n1203), .Q(d_ff1_Z[12])
         );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(n707), .CK(clk), .RN(n1203), .Q(d_ff1_Z[13])
         );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(n706), .CK(clk), .RN(n1203), .Q(d_ff1_Z[14])
         );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(n705), .CK(clk), .RN(n1203), .Q(d_ff1_Z[15])
         );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(n704), .CK(clk), .RN(n1203), .Q(d_ff1_Z[16])
         );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(n703), .CK(clk), .RN(n1203), .Q(d_ff1_Z[17])
         );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(n702), .CK(clk), .RN(n1203), .Q(d_ff1_Z[18])
         );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(n701), .CK(clk), .RN(n1203), .Q(d_ff1_Z[19])
         );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(n700), .CK(clk), .RN(n1204), .Q(d_ff1_Z[20])
         );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(n699), .CK(clk), .RN(n1204), .Q(d_ff1_Z[21])
         );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(n698), .CK(clk), .RN(n1204), .Q(d_ff1_Z[22])
         );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(n697), .CK(clk), .RN(n1204), .Q(d_ff1_Z[23])
         );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(n696), .CK(clk), .RN(n1204), .Q(d_ff1_Z[24])
         );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(n695), .CK(clk), .RN(n1204), .Q(d_ff1_Z[25])
         );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(n694), .CK(clk), .RN(n1204), .Q(d_ff1_Z[26])
         );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(n693), .CK(clk), .RN(n1204), .Q(d_ff1_Z[27])
         );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(n692), .CK(clk), .RN(n1204), .Q(d_ff1_Z[28])
         );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(n691), .CK(clk), .RN(n1204), .Q(d_ff1_Z[29])
         );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(n690), .CK(clk), .RN(n1204), .Q(d_ff1_Z[30])
         );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(n689), .CK(clk), .RN(n1204), .Q(d_ff1_Z[31])
         );
  DFFRXLTS reg_ch_mux_2_Q_reg_0_ ( .D(n686), .CK(clk), .RN(n1205), .Q(
        sel_mux_2_reg[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(n684), .CK(clk), .RN(n1208), .Q(d_ff_Zn[0])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(n683), .CK(clk), .RN(n1205), .Q(d_ff_Zn[1])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(n682), .CK(clk), .RN(n1205), .Q(d_ff_Zn[2])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(n681), .CK(clk), .RN(n1205), .Q(d_ff_Zn[3])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(n680), .CK(clk), .RN(n1205), .Q(d_ff_Zn[4])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(n679), .CK(clk), .RN(n1205), .Q(d_ff_Zn[5])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(n678), .CK(clk), .RN(n1205), .Q(d_ff_Zn[6])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(n677), .CK(clk), .RN(n1205), .Q(d_ff_Zn[7])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(n676), .CK(clk), .RN(n1205), .Q(d_ff_Zn[8])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(n675), .CK(clk), .RN(n1206), .Q(d_ff_Zn[9])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(n674), .CK(clk), .RN(n1206), .Q(d_ff_Zn[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(n673), .CK(clk), .RN(n1206), .Q(d_ff_Zn[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(n672), .CK(clk), .RN(n1206), .Q(d_ff_Zn[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(n671), .CK(clk), .RN(n1206), .Q(d_ff_Zn[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(n670), .CK(clk), .RN(n1206), .Q(d_ff_Zn[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(n669), .CK(clk), .RN(n1206), .Q(d_ff_Zn[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(n668), .CK(clk), .RN(n1206), .Q(d_ff_Zn[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(n667), .CK(clk), .RN(n1206), .Q(d_ff_Zn[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(n666), .CK(clk), .RN(n1206), .Q(d_ff_Zn[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(n665), .CK(clk), .RN(n1206), .Q(d_ff_Zn[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(n664), .CK(clk), .RN(n1206), .Q(d_ff_Zn[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(n663), .CK(clk), .RN(n1188), .Q(d_ff_Zn[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(n662), .CK(clk), .RN(n1197), .Q(d_ff_Zn[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(n661), .CK(clk), .RN(n1189), .Q(d_ff_Zn[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(n660), .CK(clk), .RN(n1194), .Q(d_ff_Zn[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(n659), .CK(clk), .RN(n1193), .Q(d_ff_Zn[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(n658), .CK(clk), .RN(n1194), .Q(d_ff_Zn[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(n657), .CK(clk), .RN(n1193), .Q(d_ff_Zn[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(n656), .CK(clk), .RN(n1205), .Q(d_ff_Zn[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(n655), .CK(clk), .RN(n1202), .Q(d_ff_Zn[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(n654), .CK(clk), .RN(n1207), .Q(d_ff_Zn[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(n653), .CK(clk), .RN(n1206), .Q(d_ff_Zn[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(n652), .CK(clk), .RN(n1209), .Q(d_ff_Yn[0]), 
        .QN(n1161) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(n651), .CK(clk), .RN(n1207), .Q(d_ff_Yn[1]), 
        .QN(n1162) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(n650), .CK(clk), .RN(n1207), .Q(d_ff_Yn[2]), 
        .QN(n1163) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(n649), .CK(clk), .RN(n1207), .Q(d_ff_Yn[3]), 
        .QN(n1164) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(n648), .CK(clk), .RN(n1207), .Q(d_ff_Yn[4]), 
        .QN(n1165) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(n647), .CK(clk), .RN(n1207), .Q(d_ff_Yn[5]), 
        .QN(n1166) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(n646), .CK(clk), .RN(n1207), .Q(d_ff_Yn[6]), 
        .QN(n1167) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(n645), .CK(clk), .RN(n1207), .Q(d_ff_Yn[7]), 
        .QN(n1168) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(n644), .CK(clk), .RN(n1207), .Q(d_ff_Yn[8]), 
        .QN(n1169) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(n643), .CK(clk), .RN(n1207), .Q(d_ff_Yn[9]), 
        .QN(n1170) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(n642), .CK(clk), .RN(n1207), .Q(d_ff_Yn[10]), .QN(n1171) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(n641), .CK(clk), .RN(n1207), .Q(d_ff_Yn[11]), .QN(n1172) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(n640), .CK(clk), .RN(n1207), .Q(d_ff_Yn[12]), .QN(n1173) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(n639), .CK(clk), .RN(n1208), .Q(d_ff_Yn[13]), .QN(n1174) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(n638), .CK(clk), .RN(n1208), .Q(d_ff_Yn[14]), .QN(n1175) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(n637), .CK(clk), .RN(n1208), .Q(d_ff_Yn[15]), .QN(n1176) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(n636), .CK(clk), .RN(n1208), .Q(d_ff_Yn[16]), .QN(n1177) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(n635), .CK(clk), .RN(n1208), .Q(d_ff_Yn[17]), .QN(n1178) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(n634), .CK(clk), .RN(n1208), .Q(d_ff_Yn[18]), .QN(n1179) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(n633), .CK(clk), .RN(n1208), .Q(d_ff_Yn[19]), .QN(n1180) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(n632), .CK(clk), .RN(n1208), .Q(d_ff_Yn[20]), .QN(n1181) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(n621), .CK(clk), .RN(n1212), .Q(d_ff_Yn[31]), .QN(n1186) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(n588), .CK(clk), .RN(n1212), .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(n587), .CK(clk), .RN(n1212), .Q(
        data_output[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(n586), .CK(clk), .RN(n1212), .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(n585), .CK(clk), .RN(n1212), .Q(
        data_output[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(n584), .CK(clk), .RN(n1212), .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(n583), .CK(clk), .RN(n1212), .Q(
        data_output[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(n582), .CK(clk), .RN(n1212), .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(n581), .CK(clk), .RN(n1213), .Q(
        data_output[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(n616), .CK(clk), .RN(n1213), .QN(n804) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(n580), .CK(clk), .RN(n1213), .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(n579), .CK(clk), .RN(n1213), .Q(
        data_output[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(n578), .CK(clk), .RN(n1213), .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(n577), .CK(clk), .RN(n1213), .Q(
        data_output[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(n614), .CK(clk), .RN(n1213), .QN(n803) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(n576), .CK(clk), .RN(n1212), .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(n575), .CK(clk), .RN(n1212), .Q(
        data_output[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(n574), .CK(clk), .RN(n1212), .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(n573), .CK(clk), .RN(n1210), .Q(
        data_output[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(n572), .CK(clk), .RN(n1208), .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(n571), .CK(clk), .RN(n1207), .Q(
        data_output[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(n570), .CK(clk), .RN(n1201), .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(n569), .CK(clk), .RN(n1210), .Q(
        data_output[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(n568), .CK(clk), .RN(n1211), .Q(
        sign_inv_out[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(n567), .CK(clk), .RN(n1206), .Q(
        data_output[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(n566), .CK(clk), .RN(n1207), .Q(
        sign_inv_out[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(n565), .CK(clk), .RN(n1211), .Q(
        data_output[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(n564), .CK(clk), .RN(n1211), .Q(
        sign_inv_out[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(n563), .CK(clk), .RN(n1211), .Q(
        data_output[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(n562), .CK(clk), .RN(n1211), .Q(
        sign_inv_out[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(n561), .CK(clk), .RN(n1211), .Q(
        data_output[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(n560), .CK(clk), .RN(n1211), .Q(
        sign_inv_out[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(n559), .CK(clk), .RN(n1211), .Q(
        data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(n557), .CK(clk), .RN(n1210), .Q(
        data_output[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(n556), .CK(clk), .RN(n1210), .Q(
        sign_inv_out[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(n555), .CK(clk), .RN(n1210), .Q(
        data_output[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(n554), .CK(clk), .RN(n1210), .Q(
        sign_inv_out[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(n553), .CK(clk), .RN(n1210), .Q(
        data_output[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(n552), .CK(clk), .RN(n1210), .Q(
        sign_inv_out[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(n551), .CK(clk), .RN(n1210), .Q(
        data_output[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(n550), .CK(clk), .RN(n1203), .Q(
        sign_inv_out[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(n549), .CK(clk), .RN(n1204), .Q(
        data_output[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(n548), .CK(clk), .RN(n1208), .Q(
        sign_inv_out[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(n547), .CK(clk), .RN(n1209), .Q(
        data_output[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(n546), .CK(clk), .RN(n1204), .Q(
        sign_inv_out[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(n545), .CK(clk), .RN(n1205), .Q(
        data_output[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(n544), .CK(clk), .RN(n1209), .Q(
        sign_inv_out[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(n543), .CK(clk), .RN(n1203), .Q(
        data_output[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(n542), .CK(clk), .RN(n1209), .Q(
        sign_inv_out[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(n541), .CK(clk), .RN(n1209), .Q(
        data_output[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(n540), .CK(clk), .RN(n1209), .Q(
        sign_inv_out[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(n539), .CK(clk), .RN(n1209), .Q(
        data_output[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(n538), .CK(clk), .RN(n1209), .Q(
        sign_inv_out[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(n537), .CK(clk), .RN(n1209), .Q(
        data_output[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(n536), .CK(clk), .RN(n1209), .Q(
        sign_inv_out[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(n535), .CK(clk), .RN(n1209), .Q(
        data_output[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(n534), .CK(clk), .RN(n1208), .Q(
        sign_inv_out[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(n533), .CK(clk), .RN(n1208), .Q(
        data_output[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(n532), .CK(clk), .RN(n1211), .Q(
        sign_inv_out[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(n531), .CK(clk), .RN(n1194), .Q(
        data_output[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(n530), .CK(clk), .RN(n1188), .Q(
        sign_inv_out[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(n529), .CK(clk), .RN(n1188), .Q(
        data_output[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(n528), .CK(clk), .RN(n1188), .Q(
        sign_inv_out[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(n527), .CK(clk), .RN(n1188), .Q(
        data_output[30]) );
  DFFRXLTS d_ff5_Q_reg_31_ ( .D(n526), .CK(clk), .RN(n1188), .Q(
        data_output2_31_) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(n525), .CK(clk), .RN(n1188), .Q(
        data_output[31]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n523), .CK(clk), .RN(n1188), .Q(
        d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n522), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n521), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(n520), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(n519), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n517), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n516), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n515), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n514), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(n513), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n512), .CK(clk), .RN(n1189), .QN(n814) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n511), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(n510), .CK(clk), .RN(n1196), .Q(
        d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n509), .CK(clk), .RN(n1195), .Q(
        d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(n508), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_17_ ( .D(n507), .CK(clk), .RN(n1188), .Q(
        d_ff3_LUT_out[17]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(n506), .CK(clk), .RN(n1197), .Q(
        d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n505), .CK(clk), .RN(n1196), .Q(
        d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(n504), .CK(clk), .RN(n1195), .Q(
        d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n503), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(n502), .CK(clk), .RN(n1188), .Q(
        d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n501), .CK(clk), .RN(n1197), .Q(
        d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n500), .CK(clk), .RN(n1196), .Q(
        d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(n499), .CK(clk), .RN(n1195), .Q(
        d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n498), .CK(clk), .RN(n1190), .Q(
        d_ff3_LUT_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(n409), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(n408), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(n407), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(n406), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(n405), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(n404), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(n403), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(n402), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_y_out[30]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(n345), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(n344), .CK(clk), .RN(n1190), .Q(
        d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(n343), .CK(clk), .RN(n1191), .Q(
        d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(n342), .CK(clk), .RN(n1191), .Q(
        d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(n341), .CK(clk), .RN(n1191), .Q(
        d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(n340), .CK(clk), .RN(n1191), .QN(n815)
         );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(n339), .CK(clk), .RN(n1191), .QN(n802)
         );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(n338), .CK(clk), .RN(n1191), .Q(
        d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(n493), .CK(clk), .RN(n1191), .Q(
        d_ff2_Z[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(n491), .CK(clk), .RN(n1191), .Q(
        d_ff2_Z[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(n489), .CK(clk), .RN(n1200), .Q(
        d_ff2_Z[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(n488), .CK(clk), .RN(n1199), .Q(
        d_ff2_Z[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(n485), .CK(clk), .RN(n1190), .Q(
        d_ff2_Z[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(n484), .CK(clk), .RN(n1194), .Q(
        d_ff2_Z[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(n478), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(n474), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(n473), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(n471), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(n470), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(n469), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(n468), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(n467), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(n466), .CK(clk), .RN(n1193), .Q(
        d_ff2_Z[30]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(n462), .CK(clk), .RN(n1193), .Q(
        d_ff3_sh_y_out[0]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(n460), .CK(clk), .RN(n1193), .Q(
        d_ff3_sh_y_out[1]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(n458), .CK(clk), .RN(n1193), .Q(
        d_ff3_sh_y_out[2]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(n456), .CK(clk), .RN(n1193), .Q(
        d_ff3_sh_y_out[3]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(n454), .CK(clk), .RN(n1194), .Q(
        d_ff3_sh_y_out[4]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(n452), .CK(clk), .RN(n1194), .Q(
        d_ff3_sh_y_out[5]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(n450), .CK(clk), .RN(n1194), .Q(
        d_ff3_sh_y_out[6]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(n448), .CK(clk), .RN(n1194), .Q(
        d_ff3_sh_y_out[7]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(n446), .CK(clk), .RN(n1194), .Q(
        d_ff3_sh_y_out[8]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(n444), .CK(clk), .RN(n1194), .Q(
        d_ff3_sh_y_out[9]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(n442), .CK(clk), .RN(n1195), .Q(
        d_ff3_sh_y_out[10]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(n440), .CK(clk), .RN(n1195), .Q(
        d_ff3_sh_y_out[11]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(n438), .CK(clk), .RN(n1195), .Q(
        d_ff3_sh_y_out[12]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(n436), .CK(clk), .RN(n1195), .Q(
        d_ff3_sh_y_out[13]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(n434), .CK(clk), .RN(n1195), .Q(
        d_ff3_sh_y_out[14]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(n432), .CK(clk), .RN(n1195), .Q(
        d_ff3_sh_y_out[15]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(n430), .CK(clk), .RN(n1196), .Q(
        d_ff3_sh_y_out[16]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(n428), .CK(clk), .RN(n1196), .Q(
        d_ff3_sh_y_out[17]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(n426), .CK(clk), .RN(n1196), .Q(
        d_ff3_sh_y_out[18]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(n424), .CK(clk), .RN(n1196), .Q(
        d_ff3_sh_y_out[19]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(n422), .CK(clk), .RN(n1196), .Q(
        d_ff3_sh_y_out[20]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(n420), .CK(clk), .RN(n1196), .Q(
        d_ff3_sh_y_out[21]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(n418), .CK(clk), .RN(n1197), .Q(
        d_ff3_sh_y_out[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(n412), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(n410), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[30]), .QN(n1149) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(n400), .CK(clk), .RN(n1197), .Q(
        d_ff3_sh_y_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(n398), .CK(clk), .RN(n1198), .Q(
        d_ff3_sh_x_out[0]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(n396), .CK(clk), .RN(n1198), .Q(
        d_ff3_sh_x_out[1]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(n394), .CK(clk), .RN(n1198), .Q(
        d_ff3_sh_x_out[2]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(n392), .CK(clk), .RN(n1198), .Q(
        d_ff3_sh_x_out[3]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(n390), .CK(clk), .RN(n1198), .Q(
        d_ff3_sh_x_out[4]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(n388), .CK(clk), .RN(n1198), .Q(
        d_ff3_sh_x_out[5]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(n386), .CK(clk), .RN(n1199), .Q(
        d_ff3_sh_x_out[6]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(n384), .CK(clk), .RN(n1199), .Q(
        d_ff3_sh_x_out[7]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(n382), .CK(clk), .RN(n1199), .Q(
        d_ff3_sh_x_out[8]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(n380), .CK(clk), .RN(n1199), .Q(
        d_ff3_sh_x_out[9]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(n378), .CK(clk), .RN(n1199), .Q(
        d_ff3_sh_x_out[10]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(n376), .CK(clk), .RN(n1199), .Q(
        d_ff3_sh_x_out[11]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(n374), .CK(clk), .RN(n1200), .Q(
        d_ff3_sh_x_out[12]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(n372), .CK(clk), .RN(n1200), .Q(
        d_ff3_sh_x_out[13]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(n370), .CK(clk), .RN(n1200), .Q(
        d_ff3_sh_x_out[14]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(n368), .CK(clk), .RN(n1200), .Q(
        d_ff3_sh_x_out[15]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(n366), .CK(clk), .RN(n1200), .Q(
        d_ff3_sh_x_out[16]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(n364), .CK(clk), .RN(n1200), .Q(
        d_ff3_sh_x_out[17]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(n362), .CK(clk), .RN(n1210), .Q(
        d_ff3_sh_x_out[18]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(n360), .CK(clk), .RN(n1211), .Q(
        d_ff3_sh_x_out[19]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(n358), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_x_out[20]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(n356), .CK(clk), .RN(n1210), .Q(
        d_ff3_sh_x_out[21]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(n354), .CK(clk), .RN(n1211), .Q(
        d_ff3_sh_x_out[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(n348), .CK(clk), .RN(n1201), 
        .QN(n800) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(n336), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_x_out[31]) );
  DFFRX1TS d_ff4_Yn_Q_reg_30_ ( .D(n622), .CK(clk), .RN(n1213), .QN(n1160) );
  DFFRX1TS d_ff4_Yn_Q_reg_29_ ( .D(n623), .CK(clk), .RN(n1213), .QN(n1159) );
  DFFRX1TS d_ff4_Yn_Q_reg_28_ ( .D(n624), .CK(clk), .RN(n1213), .QN(n1158) );
  DFFRX1TS d_ff4_Yn_Q_reg_27_ ( .D(n625), .CK(clk), .RN(n1213), .QN(n1157) );
  DFFRX1TS d_ff4_Yn_Q_reg_24_ ( .D(n628), .CK(clk), .RN(n1213), .QN(n1156) );
  DFFRX1TS d_ff4_Yn_Q_reg_23_ ( .D(n629), .CK(clk), .RN(n1213), .QN(n1155) );
  DFFRX1TS cont_var_count_reg_0_ ( .D(n724), .CK(clk), .RN(n1202), .Q(
        cont_var_out[0]), .QN(n1152) );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n725), .CK(clk), .RN(n1201), .Q(
        cont_iter_out[3]), .QN(n1146) );
  DFFRX2TS cordic_FSM_state_reg_reg_0_ ( .D(n730), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[0]), .QN(n1143) );
  DFFRX2TS cont_iter_count_reg_0_ ( .D(n728), .CK(clk), .RN(n1201), .Q(n1187), 
        .QN(n1214) );
  DFFRX4TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n331), .Q(cordic_FSM_state_reg[1]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_27_ ( .D(n349), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[27]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_24_ ( .D(n352), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[24]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(n347), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[29]) );
  DFFRX1TS reg_LUT_Q_reg_27_ ( .D(n497), .CK(clk), .RN(n1190), .Q(
        d_ff3_LUT_out[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_18_ ( .D(n363), .CK(clk), .RN(n1211), .Q(
        d_ff2_X[18]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_21_ ( .D(n357), .CK(clk), .RN(n1211), .Q(
        d_ff2_X[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_10_ ( .D(n610), .CK(clk), .RN(n1211), .Q(d_ff_Xn[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(n350), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[26]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_31_ ( .D(n465), .CK(clk), .RN(n1193), .Q(
        d_ff2_Z[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(n416), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[24]), .QN(n799) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_23_ ( .D(n353), .CK(clk), .RN(n1210), .Q(
        d_ff2_X[23]), .QN(n1154) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(n413), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[27]), .QN(n1147) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(n723), .CK(clk), .RN(n1202), .Q(
        d_ff1_operation_out), .QN(n1144) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(n722), .CK(clk), .RN(n1202), .Q(
        d_ff1_shift_region_flag_out[0]), .QN(n1153) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_12_ ( .D(n375), .CK(clk), .RN(n1200), .Q(
        d_ff2_X[12]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_7_ ( .D(n385), .CK(clk), .RN(n1199), .Q(
        d_ff2_X[7]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_6_ ( .D(n387), .CK(clk), .RN(n1199), .Q(
        d_ff2_X[6]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_5_ ( .D(n389), .CK(clk), .RN(n1198), .Q(
        d_ff2_X[5]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_3_ ( .D(n393), .CK(clk), .RN(n1198), .Q(
        d_ff2_X[3]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_2_ ( .D(n395), .CK(clk), .RN(n1198), .Q(
        d_ff2_X[2]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_1_ ( .D(n397), .CK(clk), .RN(n1198), .Q(
        d_ff2_X[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_31_ ( .D(n401), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_17_ ( .D(n429), .CK(clk), .RN(n1196), .Q(
        d_ff2_Y[17]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_16_ ( .D(n431), .CK(clk), .RN(n1196), .Q(
        d_ff2_Y[16]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_15_ ( .D(n433), .CK(clk), .RN(n1195), .Q(
        d_ff2_Y[15]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_14_ ( .D(n435), .CK(clk), .RN(n1195), .Q(
        d_ff2_Y[14]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_13_ ( .D(n437), .CK(clk), .RN(n1195), .Q(
        d_ff2_Y[13]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_11_ ( .D(n441), .CK(clk), .RN(n1195), .Q(
        d_ff2_Y[11]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_10_ ( .D(n443), .CK(clk), .RN(n1195), .Q(
        d_ff2_Y[10]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_9_ ( .D(n445), .CK(clk), .RN(n1194), .Q(
        d_ff2_Y[9]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_6_ ( .D(n451), .CK(clk), .RN(n1194), .Q(
        d_ff2_Y[6]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_5_ ( .D(n453), .CK(clk), .RN(n1194), .Q(
        d_ff2_Y[5]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_4_ ( .D(n455), .CK(clk), .RN(n1193), .Q(
        d_ff2_Y[4]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_3_ ( .D(n457), .CK(clk), .RN(n1193), .Q(
        d_ff2_Y[3]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_2_ ( .D(n459), .CK(clk), .RN(n1193), .Q(
        d_ff2_Y[2]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_1_ ( .D(n461), .CK(clk), .RN(n1193), .Q(
        d_ff2_Y[1]) );
  DFFRX1TS d_ff4_Xn_Q_reg_28_ ( .D(n592), .CK(clk), .RN(n1208), .Q(d_ff_Xn[28]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_9_ ( .D(n381), .CK(clk), .RN(n1199), .Q(
        d_ff2_X[9]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_8_ ( .D(n383), .CK(clk), .RN(n1199), .Q(
        d_ff2_X[8]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_4_ ( .D(n391), .CK(clk), .RN(n1198), .Q(
        d_ff2_X[4]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_0_ ( .D(n399), .CK(clk), .RN(n1198), .Q(
        d_ff2_X[0]) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n729), .CK(clk), .RN(n1201), .Q(
        cont_var_out[1]) );
  DFFRX1TS reg_LUT_Q_reg_6_ ( .D(n518), .CK(clk), .RN(n1189), .Q(
        d_ff3_LUT_out[6]) );
  DFFRX1TS reg_LUT_Q_reg_0_ ( .D(n524), .CK(clk), .RN(n1188), .Q(
        d_ff3_LUT_out[0]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(n411), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[29]), .QN(n1148) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n685), .CK(clk), .RN(n1205), .Q(
        sel_mux_2_reg[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_20_ ( .D(n359), .CK(clk), .RN(n1210), .Q(
        d_ff2_X[20]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_19_ ( .D(n361), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_2_ ( .D(n618), .CK(clk), .RN(n1212), .Q(d_ff_Xn[2])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_7_ ( .D(n613), .CK(clk), .RN(n1212), .Q(d_ff_Xn[7])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_5_ ( .D(n615), .CK(clk), .RN(n1212), .Q(d_ff_Xn[5])
         );
  DFFRX4TS cordic_FSM_state_reg_reg_3_ ( .D(n732), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[3]), .QN(n1145) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(n415), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(n414), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[26]) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(n721), .CK(clk), .RN(n1202), .Q(
        d_ff1_shift_region_flag_out[1]), .QN(n1150) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_30_ ( .D(n346), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[30]) );
  DFFRX1TS reg_ch_mux_1_Q_reg_0_ ( .D(n687), .CK(clk), .RN(n1205), .Q(
        sel_mux_1_reg) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_20_ ( .D(n423), .CK(clk), .RN(n1196), .Q(
        d_ff2_Y[20]) );
  DFFRX1TS reg_ch_mux_3_Q_reg_0_ ( .D(n688), .CK(clk), .RN(n1205), .Q(
        sel_mux_3_reg) );
  DFFRX1TS d_ff4_Xn_Q_reg_29_ ( .D(n591), .CK(clk), .RN(n1188), .Q(d_ff_Xn[29]) );
  DFFRX1TS d_ff4_Xn_Q_reg_1_ ( .D(n619), .CK(clk), .RN(n1212), .Q(d_ff_Xn[1])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_3_ ( .D(n617), .CK(clk), .RN(n1212), .Q(d_ff_Xn[3])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_12_ ( .D(n608), .CK(clk), .RN(n1211), .Q(d_ff_Xn[12]) );
  DFFRX1TS d_ff4_Xn_Q_reg_13_ ( .D(n607), .CK(clk), .RN(n1211), .Q(d_ff_Xn[13]) );
  DFFRX1TS d_ff4_Xn_Q_reg_14_ ( .D(n606), .CK(clk), .RN(n1211), .Q(d_ff_Xn[14]) );
  DFFRX1TS d_ff4_Xn_Q_reg_16_ ( .D(n604), .CK(clk), .RN(n1210), .Q(d_ff_Xn[16]) );
  DFFRX1TS d_ff4_Xn_Q_reg_17_ ( .D(n603), .CK(clk), .RN(n1210), .Q(d_ff_Xn[17]) );
  DFFRX1TS d_ff4_Xn_Q_reg_19_ ( .D(n601), .CK(clk), .RN(n1210), .Q(d_ff_Xn[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_20_ ( .D(n600), .CK(clk), .RN(n1205), .Q(d_ff_Xn[20]) );
  DFFRX1TS d_ff4_Xn_Q_reg_24_ ( .D(n596), .CK(clk), .RN(n1209), .Q(d_ff_Xn[24]) );
  DFFRX1TS d_ff4_Xn_Q_reg_26_ ( .D(n594), .CK(clk), .RN(n1209), .Q(d_ff_Xn[26]) );
  DFFRX1TS d_ff4_Xn_Q_reg_27_ ( .D(n593), .CK(clk), .RN(n1209), .Q(d_ff_Xn[27]) );
  DFFRX1TS d_ff4_Xn_Q_reg_30_ ( .D(n590), .CK(clk), .RN(n1188), .Q(d_ff_Xn[30]) );
  DFFRX1TS d_ff4_Xn_Q_reg_31_ ( .D(n589), .CK(clk), .RN(n1188), .Q(d_ff_Xn[31]) );
  DFFRX1TS d_ff4_Xn_Q_reg_0_ ( .D(n620), .CK(clk), .RN(n1212), .Q(d_ff_Xn[0])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_8_ ( .D(n612), .CK(clk), .RN(n1206), .Q(d_ff_Xn[8])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_9_ ( .D(n611), .CK(clk), .RN(n1202), .Q(d_ff_Xn[9])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_11_ ( .D(n609), .CK(clk), .RN(n1202), .Q(d_ff_Xn[11]) );
  DFFRX1TS d_ff4_Xn_Q_reg_15_ ( .D(n605), .CK(clk), .RN(n1211), .Q(d_ff_Xn[15]) );
  DFFRX1TS d_ff4_Xn_Q_reg_18_ ( .D(n602), .CK(clk), .RN(n1210), .Q(d_ff_Xn[18]) );
  DFFRX1TS d_ff4_Xn_Q_reg_21_ ( .D(n599), .CK(clk), .RN(n1203), .Q(d_ff_Xn[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_22_ ( .D(n598), .CK(clk), .RN(n1208), .Q(d_ff_Xn[22]) );
  DFFRX1TS d_ff4_Xn_Q_reg_25_ ( .D(n595), .CK(clk), .RN(n1209), .Q(d_ff_Xn[25]) );
  DFFRX1TS d_ff4_Xn_Q_reg_23_ ( .D(n597), .CK(clk), .RN(n1204), .Q(d_ff_Xn[23]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_10_ ( .D(n379), .CK(clk), .RN(n1199), .Q(
        d_ff2_X[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_13_ ( .D(n373), .CK(clk), .RN(n1200), .Q(
        d_ff2_X[13]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_14_ ( .D(n371), .CK(clk), .RN(n1200), .Q(
        d_ff2_X[14]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_16_ ( .D(n367), .CK(clk), .RN(n1200), .Q(
        d_ff2_X[16]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_17_ ( .D(n365), .CK(clk), .RN(n1200), .Q(
        d_ff2_X[17]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_11_ ( .D(n377), .CK(clk), .RN(n1199), .Q(
        d_ff2_X[11]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_15_ ( .D(n369), .CK(clk), .RN(n1200), .Q(
        d_ff2_X[15]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_22_ ( .D(n355), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[22]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_31_ ( .D(n337), .CK(clk), .RN(n1188), .Q(
        d_ff2_X[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_0_ ( .D(n463), .CK(clk), .RN(n1193), .Q(
        d_ff2_Y[0]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_7_ ( .D(n449), .CK(clk), .RN(n1194), .Q(
        d_ff2_Y[7]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_8_ ( .D(n447), .CK(clk), .RN(n1194), .Q(
        d_ff2_Y[8]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_12_ ( .D(n439), .CK(clk), .RN(n1195), .Q(
        d_ff2_Y[12]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_18_ ( .D(n427), .CK(clk), .RN(n1196), .Q(
        d_ff2_Y[18]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_19_ ( .D(n425), .CK(clk), .RN(n1196), .Q(
        d_ff2_Y[19]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_21_ ( .D(n421), .CK(clk), .RN(n1196), .Q(
        d_ff2_Y[21]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_22_ ( .D(n419), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[22]) );
  DFFRX1TS reg_sign_Q_reg_0_ ( .D(n464), .CK(clk), .RN(n1193), .Q(
        d_ff3_sign_out) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_23_ ( .D(n417), .CK(clk), .RN(n1197), .Q(
        d_ff2_Y[23]), .QN(n801) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_24_ ( .D(n472), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[24]) );
  DFFRX4TS cordic_FSM_state_reg_reg_2_ ( .D(n731), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[2]), .QN(n1151) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_0_ ( .D(n496), .CK(clk), .RN(n1191), .Q(
        d_ff2_Z[0]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_1_ ( .D(n495), .CK(clk), .RN(n1191), .Q(
        d_ff2_Z[1]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_2_ ( .D(n494), .CK(clk), .RN(n1191), .Q(
        d_ff2_Z[2]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_4_ ( .D(n492), .CK(clk), .RN(n1191), .Q(
        d_ff2_Z[4]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_6_ ( .D(n490), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[6]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_9_ ( .D(n487), .CK(clk), .RN(n1198), .Q(
        d_ff2_Z[9]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_10_ ( .D(n486), .CK(clk), .RN(n1191), .Q(
        d_ff2_Z[10]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_13_ ( .D(n483), .CK(clk), .RN(n1193), .Q(
        d_ff2_Z[13]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_14_ ( .D(n482), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[14]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_15_ ( .D(n481), .CK(clk), .RN(n1200), .Q(
        d_ff2_Z[15]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_16_ ( .D(n480), .CK(clk), .RN(n1199), .Q(
        d_ff2_Z[16]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_17_ ( .D(n479), .CK(clk), .RN(n1198), .Q(
        d_ff2_Z[17]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_19_ ( .D(n477), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[19]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_20_ ( .D(n476), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[20]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_21_ ( .D(n475), .CK(clk), .RN(n1192), .Q(
        d_ff2_Z[21]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(n351), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[25]), .QN(n810) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(n626), .CK(clk), .RN(n1213), .Q(d_ff_Yn[26]), .QN(n1185) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(n627), .CK(clk), .RN(n1213), .Q(d_ff_Yn[25]), .QN(n1184) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(n630), .CK(clk), .RN(n1213), .Q(d_ff_Yn[22]), .QN(n1183) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(n631), .CK(clk), .RN(n1213), .Q(d_ff_Yn[21]), .QN(n1182) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(n558), .CK(clk), .RN(n1210), .Q(
        sign_inv_out[15]) );
  DFFRX2TS cont_iter_count_reg_1_ ( .D(n727), .CK(clk), .RN(n1201), .Q(
        cont_iter_out[1]) );
  AOI222X1TS U795 ( .A0(d_ff2_Z[8]), .A1(n991), .B0(d_ff2_Y[8]), .B1(n996), 
        .C0(d_ff2_X[8]), .C1(n806), .Y(n945) );
  AOI222X1TS U796 ( .A0(d_ff2_Z[3]), .A1(n991), .B0(d_ff2_Y[3]), .B1(n996), 
        .C0(d_ff2_X[3]), .C1(n806), .Y(n938) );
  AOI222X1TS U797 ( .A0(d_ff2_Z[5]), .A1(n991), .B0(d_ff2_Y[5]), .B1(n996), 
        .C0(d_ff2_X[5]), .C1(n806), .Y(n947) );
  AOI222X1TS U798 ( .A0(d_ff2_Z[7]), .A1(n991), .B0(d_ff2_Y[7]), .B1(n996), 
        .C0(d_ff2_X[7]), .C1(n809), .Y(n946) );
  AOI222X1TS U799 ( .A0(d_ff2_Z[22]), .A1(n991), .B0(d_ff2_Y[22]), .B1(n995), 
        .C0(d_ff2_X[22]), .C1(n807), .Y(n990) );
  AOI222X1TS U800 ( .A0(d_ff2_Z[11]), .A1(n991), .B0(d_ff2_Y[11]), .B1(n996), 
        .C0(d_ff2_X[11]), .C1(n809), .Y(n988) );
  AOI222X1TS U801 ( .A0(d_ff2_Z[18]), .A1(n991), .B0(d_ff2_Y[18]), .B1(n995), 
        .C0(d_ff2_X[18]), .C1(n808), .Y(n981) );
  AOI222X1TS U802 ( .A0(d_ff3_sh_x_out[25]), .A1(n995), .B0(d_ff3_LUT_out[25]), 
        .B1(n991), .C0(n809), .C1(d_ff3_sh_y_out[25]), .Y(n949) );
  AOI222X1TS U803 ( .A0(d_ff3_LUT_out[1]), .A1(n985), .B0(n997), .B1(
        d_ff3_sh_x_out[1]), .C0(n808), .C1(d_ff3_sh_y_out[1]), .Y(n969) );
  AOI222X1TS U804 ( .A0(d_ff3_LUT_out[2]), .A1(n985), .B0(n997), .B1(
        d_ff3_sh_x_out[2]), .C0(n807), .C1(d_ff3_sh_y_out[2]), .Y(n965) );
  AOI222X1TS U805 ( .A0(d_ff3_LUT_out[23]), .A1(n985), .B0(d_ff3_sh_y_out[23]), 
        .B1(n809), .C0(d_ff3_sh_x_out[23]), .C1(n995), .Y(n973) );
  AOI222X1TS U806 ( .A0(d_ff3_LUT_out[24]), .A1(n985), .B0(d_ff3_sh_y_out[24]), 
        .B1(n808), .C0(d_ff3_sh_x_out[24]), .C1(n996), .Y(n974) );
  AOI222X1TS U807 ( .A0(d_ff2_Z[26]), .A1(n985), .B0(d_ff2_Y[26]), .B1(n995), 
        .C0(d_ff2_X[26]), .C1(n808), .Y(n986) );
  AOI222X1TS U808 ( .A0(d_ff2_Z[12]), .A1(n985), .B0(d_ff2_Y[12]), .B1(n996), 
        .C0(d_ff2_X[12]), .C1(n809), .Y(n980) );
  NOR2X4TS U809 ( .A(n1032), .B(n1040), .Y(n1034) );
  NOR2X6TS U810 ( .A(sel_mux_3_reg), .B(n922), .Y(n884) );
  CMPR32X2TS U811 ( .A(d_ff2_Y[26]), .B(n1146), .C(n1093), .CO(n1095), .S(
        n1092) );
  CMPR32X2TS U812 ( .A(n1146), .B(d_ff2_X[26]), .C(n1126), .CO(n1130), .S(
        n1124) );
  CMPR32X2TS U813 ( .A(d_ff2_Y[25]), .B(n1091), .C(n1090), .CO(n1093), .S(
        n1089) );
  NAND2X6TS U814 ( .A(n1110), .B(sel_mux_1_reg), .Y(n854) );
  BUFX4TS U815 ( .A(n823), .Y(n1105) );
  BUFX6TS U816 ( .A(n816), .Y(n798) );
  AND3X1TS U817 ( .A(cordic_FSM_state_reg[2]), .B(n1048), .C(n1145), .Y(n825)
         );
  NAND3X4TS U818 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n1007), .Y(n823) );
  CLKBUFX3TS U819 ( .A(n1043), .Y(n1046) );
  CLKBUFX3TS U820 ( .A(n1027), .Y(n1028) );
  OR3X4TS U821 ( .A(n1042), .B(n1041), .C(n1040), .Y(n1043) );
  INVX3TS U822 ( .A(n1026), .Y(n1027) );
  NAND2BX4TS U823 ( .AN(n922), .B(sel_mux_3_reg), .Y(n893) );
  NOR2X1TS U824 ( .A(sel_mux_1_reg), .B(n1112), .Y(n850) );
  OR3X4TS U825 ( .A(n1151), .B(n1145), .C(n1049), .Y(n1050) );
  NAND3X2TS U826 ( .A(n1009), .B(cordic_FSM_state_reg[0]), .C(
        cordic_FSM_state_reg[3]), .Y(n926) );
  OR2X4TS U827 ( .A(n820), .B(sel_mux_2_reg[1]), .Y(n948) );
  CLKINVX2TS U828 ( .A(sel_mux_2_reg[0]), .Y(n820) );
  BUFX4TS U829 ( .A(n817), .Y(n1024) );
  AOI222X1TS U830 ( .A0(d_ff2_Z[1]), .A1(n991), .B0(d_ff2_Y[1]), .B1(n996), 
        .C0(d_ff2_X[1]), .C1(n806), .Y(n941) );
  AOI222X1TS U831 ( .A0(d_ff2_Z[2]), .A1(n991), .B0(d_ff2_Y[2]), .B1(n996), 
        .C0(d_ff2_X[2]), .C1(n806), .Y(n940) );
  AOI222X1TS U832 ( .A0(d_ff2_Z[4]), .A1(n991), .B0(d_ff2_Y[4]), .B1(n996), 
        .C0(d_ff2_X[4]), .C1(n806), .Y(n943) );
  AOI222X1TS U833 ( .A0(d_ff2_Z[6]), .A1(n991), .B0(d_ff2_Y[6]), .B1(n996), 
        .C0(d_ff2_X[6]), .C1(n807), .Y(n944) );
  AOI222X1TS U834 ( .A0(d_ff2_Z[9]), .A1(n991), .B0(d_ff2_Y[9]), .B1(n996), 
        .C0(d_ff2_X[9]), .C1(n806), .Y(n942) );
  AOI222X1TS U835 ( .A0(d_ff2_Z[10]), .A1(n991), .B0(d_ff2_Y[10]), .B1(n996), 
        .C0(d_ff2_X[10]), .C1(n807), .Y(n987) );
  AOI222X1TS U836 ( .A0(d_ff2_Z[14]), .A1(n985), .B0(d_ff2_Y[14]), .B1(n995), 
        .C0(d_ff2_X[14]), .C1(n807), .Y(n982) );
  AOI222X1TS U837 ( .A0(d_ff2_Z[15]), .A1(n985), .B0(d_ff2_Y[15]), .B1(n995), 
        .C0(d_ff2_X[15]), .C1(n807), .Y(n979) );
  AOI222X1TS U838 ( .A0(d_ff2_Z[16]), .A1(n991), .B0(d_ff2_Y[16]), .B1(n995), 
        .C0(d_ff2_X[16]), .C1(n809), .Y(n992) );
  AOI222X1TS U839 ( .A0(d_ff2_Z[17]), .A1(n991), .B0(d_ff2_Y[17]), .B1(n995), 
        .C0(d_ff2_X[17]), .C1(n808), .Y(n978) );
  AOI222X1TS U840 ( .A0(d_ff2_Z[19]), .A1(n991), .B0(d_ff2_Y[19]), .B1(n995), 
        .C0(d_ff2_X[19]), .C1(n809), .Y(n983) );
  AOI222X1TS U841 ( .A0(d_ff2_Z[20]), .A1(n985), .B0(d_ff2_Y[20]), .B1(n995), 
        .C0(d_ff2_X[20]), .C1(n806), .Y(n977) );
  AOI222X1TS U842 ( .A0(d_ff2_Z[21]), .A1(n991), .B0(d_ff2_Y[21]), .B1(n995), 
        .C0(d_ff2_X[21]), .C1(n808), .Y(n989) );
  AO22XLTS U843 ( .A0(n1045), .A1(result_add_subt[23]), .B0(n1046), .B1(
        d_ff_Xn[23]), .Y(n597) );
  AO22XLTS U844 ( .A0(n1047), .A1(result_add_subt[25]), .B0(n1046), .B1(
        d_ff_Xn[25]), .Y(n595) );
  AO22XLTS U845 ( .A0(n1045), .A1(result_add_subt[22]), .B0(n1044), .B1(
        d_ff_Xn[22]), .Y(n598) );
  AO22XLTS U846 ( .A0(n1045), .A1(result_add_subt[21]), .B0(n1044), .B1(
        d_ff_Xn[21]), .Y(n599) );
  AO22XLTS U847 ( .A0(n1045), .A1(result_add_subt[18]), .B0(n1044), .B1(
        d_ff_Xn[18]), .Y(n602) );
  AO22XLTS U848 ( .A0(n1045), .A1(result_add_subt[15]), .B0(n1044), .B1(
        d_ff_Xn[15]), .Y(n605) );
  AO22XLTS U849 ( .A0(n1047), .A1(result_add_subt[11]), .B0(n1043), .B1(
        d_ff_Xn[11]), .Y(n609) );
  AO22XLTS U850 ( .A0(n1047), .A1(result_add_subt[9]), .B0(n1043), .B1(
        d_ff_Xn[9]), .Y(n611) );
  AO22XLTS U851 ( .A0(n1047), .A1(result_add_subt[8]), .B0(n1043), .B1(
        d_ff_Xn[8]), .Y(n612) );
  AO22XLTS U852 ( .A0(n1047), .A1(result_add_subt[0]), .B0(n1044), .B1(
        d_ff_Xn[0]), .Y(n620) );
  AO22XLTS U853 ( .A0(n1047), .A1(result_add_subt[27]), .B0(n1046), .B1(
        d_ff_Xn[27]), .Y(n593) );
  AO22XLTS U854 ( .A0(n1045), .A1(result_add_subt[26]), .B0(n1046), .B1(
        d_ff_Xn[26]), .Y(n594) );
  AO22XLTS U855 ( .A0(n1045), .A1(result_add_subt[24]), .B0(n1046), .B1(
        d_ff_Xn[24]), .Y(n596) );
  AO22XLTS U856 ( .A0(n1045), .A1(result_add_subt[20]), .B0(n1044), .B1(
        d_ff_Xn[20]), .Y(n600) );
  AO22XLTS U857 ( .A0(n1045), .A1(result_add_subt[19]), .B0(n1044), .B1(
        d_ff_Xn[19]), .Y(n601) );
  AO22XLTS U858 ( .A0(n1045), .A1(result_add_subt[17]), .B0(n1044), .B1(
        d_ff_Xn[17]), .Y(n603) );
  AO22XLTS U859 ( .A0(n1045), .A1(result_add_subt[16]), .B0(n1044), .B1(
        d_ff_Xn[16]), .Y(n604) );
  AO22XLTS U860 ( .A0(n1045), .A1(result_add_subt[14]), .B0(n1044), .B1(
        d_ff_Xn[14]), .Y(n606) );
  AO22XLTS U861 ( .A0(n1045), .A1(result_add_subt[13]), .B0(n1044), .B1(
        d_ff_Xn[13]), .Y(n607) );
  AO22XLTS U862 ( .A0(n1045), .A1(result_add_subt[12]), .B0(n1044), .B1(
        d_ff_Xn[12]), .Y(n608) );
  AO22XLTS U863 ( .A0(n1047), .A1(result_add_subt[3]), .B0(n1043), .B1(
        d_ff_Xn[3]), .Y(n617) );
  AO22XLTS U864 ( .A0(n1047), .A1(result_add_subt[1]), .B0(n1043), .B1(
        d_ff_Xn[1]), .Y(n619) );
  AOI211XLTS U865 ( .A0(n1038), .A1(n1151), .B0(n1048), .C0(n1009), .Y(n819)
         );
  AO22XLTS U866 ( .A0(n1047), .A1(result_add_subt[5]), .B0(n1043), .B1(
        d_ff_Xn[5]), .Y(n615) );
  AO22XLTS U867 ( .A0(n1047), .A1(result_add_subt[7]), .B0(n1043), .B1(
        d_ff_Xn[7]), .Y(n613) );
  AO22XLTS U868 ( .A0(n1047), .A1(result_add_subt[2]), .B0(n1043), .B1(
        d_ff_Xn[2]), .Y(n618) );
  AO22XLTS U869 ( .A0(n1045), .A1(result_add_subt[28]), .B0(n1046), .B1(
        d_ff_Xn[28]), .Y(n592) );
  AO22XLTS U870 ( .A0(n1047), .A1(result_add_subt[10]), .B0(n1043), .B1(
        d_ff_Xn[10]), .Y(n610) );
  NAND2BXLTS U871 ( .AN(d_ff3_LUT_out[27]), .B(n1134), .Y(n497) );
  AO22XLTS U872 ( .A0(n1125), .A1(d_ff2_Y[5]), .B0(n1106), .B1(
        d_ff3_sh_y_out[5]), .Y(n452) );
  AO22XLTS U873 ( .A0(n1125), .A1(d_ff2_Y[4]), .B0(n1106), .B1(
        d_ff3_sh_y_out[4]), .Y(n454) );
  AO22XLTS U874 ( .A0(n1125), .A1(d_ff2_Y[3]), .B0(n1106), .B1(
        d_ff3_sh_y_out[3]), .Y(n456) );
  AO22XLTS U875 ( .A0(n1047), .A1(result_add_subt[6]), .B0(n1043), .B1(n812), 
        .Y(n614) );
  AO22XLTS U876 ( .A0(n1047), .A1(result_add_subt[4]), .B0(n1043), .B1(n811), 
        .Y(n616) );
  CLKINVX6TS U877 ( .A(n1131), .Y(n1142) );
  INVX2TS U878 ( .A(n939), .Y(n805) );
  INVX4TS U879 ( .A(n805), .Y(n806) );
  INVX4TS U880 ( .A(n805), .Y(n807) );
  INVX4TS U881 ( .A(n805), .Y(n808) );
  INVX4TS U882 ( .A(n805), .Y(n809) );
  AOI222X1TS U883 ( .A0(n1083), .A1(d_ff2_Z[13]), .B0(n936), .B1(d_ff1_Z[13]), 
        .C0(d_ff_Zn[13]), .C1(n878), .Y(n860) );
  AOI222X1TS U884 ( .A0(d_ff2_Z[13]), .A1(n985), .B0(d_ff2_Y[13]), .B1(n996), 
        .C0(d_ff2_X[13]), .C1(n806), .Y(n984) );
  AOI222X1TS U885 ( .A0(n1109), .A1(d_ff2_Z[0]), .B0(n878), .B1(d_ff_Zn[0]), 
        .C0(n936), .C1(d_ff1_Z[0]), .Y(n879) );
  AOI222X1TS U886 ( .A0(d_ff2_Z[0]), .A1(n985), .B0(d_ff2_Y[0]), .B1(n995), 
        .C0(d_ff2_X[0]), .C1(n806), .Y(n975) );
  NOR4X1TS U887 ( .A(cordic_FSM_state_reg[1]), .B(n1151), .C(n1143), .D(n1145), 
        .Y(ready_cordic) );
  AOI222X4TS U888 ( .A0(n1109), .A1(d_ff2_Z[23]), .B0(n934), .B1(d_ff1_Z[23]), 
        .C0(d_ff_Zn[23]), .C1(n878), .Y(n872) );
  AOI222X4TS U889 ( .A0(n1109), .A1(d_ff2_Z[25]), .B0(n934), .B1(d_ff1_Z[25]), 
        .C0(d_ff_Zn[25]), .C1(n878), .Y(n869) );
  NOR2X2TS U890 ( .A(cordic_FSM_state_reg[0]), .B(cordic_FSM_state_reg[3]), 
        .Y(n1001) );
  AOI222X1TS U891 ( .A0(d_ff3_LUT_out[17]), .A1(n971), .B0(n970), .B1(
        d_ff3_sh_x_out[17]), .C0(n807), .C1(d_ff3_sh_y_out[17]), .Y(n972) );
  AOI222X1TS U892 ( .A0(n971), .A1(d_ff3_LUT_out[19]), .B0(n970), .B1(
        d_ff3_sh_x_out[19]), .C0(n808), .C1(d_ff3_sh_y_out[19]), .Y(n951) );
  BUFX6TS U893 ( .A(n998), .Y(n971) );
  NAND2X2TS U894 ( .A(n1117), .B(n1146), .Y(n1061) );
  AOI222X1TS U895 ( .A0(d_ff2_Z[31]), .A1(n985), .B0(d_ff2_Y[31]), .B1(n995), 
        .C0(d_ff2_X[31]), .C1(n806), .Y(n976) );
  INVX2TS U896 ( .A(n804), .Y(n811) );
  INVX2TS U897 ( .A(n803), .Y(n812) );
  OAI33X1TS U898 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(
        d_ff1_operation_out), .A2(n1153), .B0(n1150), .B1(n1144), .B2(
        d_ff1_shift_region_flag_out[0]), .Y(n1053) );
  CLKINVX6TS U899 ( .A(n817), .Y(n1023) );
  CLKINVX6TS U900 ( .A(n1131), .Y(n1099) );
  CLKINVX6TS U901 ( .A(n798), .Y(n1212) );
  CLKINVX6TS U902 ( .A(n798), .Y(n1201) );
  CLKINVX6TS U903 ( .A(n798), .Y(n1210) );
  AOI222X4TS U904 ( .A0(n1112), .A1(d_ff2_Z[26]), .B0(n934), .B1(d_ff1_Z[26]), 
        .C0(d_ff_Zn[26]), .C1(n1104), .Y(n930) );
  AOI222X4TS U905 ( .A0(n1112), .A1(d_ff2_Z[27]), .B0(n934), .B1(d_ff1_Z[27]), 
        .C0(d_ff_Zn[27]), .C1(n1104), .Y(n931) );
  AOI222X4TS U906 ( .A0(n1109), .A1(d_ff2_Z[11]), .B0(n936), .B1(d_ff1_Z[11]), 
        .C0(d_ff_Zn[11]), .C1(n1104), .Y(n932) );
  AOI222X4TS U907 ( .A0(n1112), .A1(d_ff2_Z[29]), .B0(n934), .B1(d_ff1_Z[29]), 
        .C0(d_ff_Zn[29]), .C1(n1104), .Y(n933) );
  AOI222X4TS U908 ( .A0(n1109), .A1(d_ff2_Z[12]), .B0(n936), .B1(d_ff1_Z[12]), 
        .C0(d_ff_Zn[12]), .C1(n1104), .Y(n937) );
  INVX3TS U909 ( .A(n854), .Y(n1104) );
  INVX4TS U910 ( .A(n1110), .Y(n1112) );
  AOI222X1TS U911 ( .A0(d_ff3_LUT_out[3]), .A1(n971), .B0(n997), .B1(
        d_ff3_sh_x_out[3]), .C0(n807), .C1(d_ff3_sh_y_out[3]), .Y(n957) );
  AOI222X1TS U912 ( .A0(d_ff3_LUT_out[9]), .A1(n971), .B0(n997), .B1(
        d_ff3_sh_x_out[9]), .C0(n808), .C1(d_ff3_sh_y_out[9]), .Y(n958) );
  AOI222X1TS U913 ( .A0(d_ff3_LUT_out[5]), .A1(n971), .B0(n997), .B1(
        d_ff3_sh_x_out[5]), .C0(n809), .C1(d_ff3_sh_y_out[5]), .Y(n959) );
  AOI222X1TS U914 ( .A0(d_ff3_LUT_out[7]), .A1(n971), .B0(n997), .B1(
        d_ff3_sh_x_out[7]), .C0(n807), .C1(d_ff3_sh_y_out[7]), .Y(n966) );
  AOI222X1TS U915 ( .A0(d_ff3_LUT_out[4]), .A1(n971), .B0(n997), .B1(
        d_ff3_sh_x_out[4]), .C0(n808), .C1(d_ff3_sh_y_out[4]), .Y(n968) );
  AOI222X1TS U916 ( .A0(n971), .A1(d_ff3_LUT_out[8]), .B0(n997), .B1(
        d_ff3_sh_x_out[8]), .C0(n809), .C1(d_ff3_sh_y_out[8]), .Y(n950) );
  INVX3TS U917 ( .A(n948), .Y(n997) );
  INVX3TS U918 ( .A(n823), .Y(n1125) );
  INVX2TS U919 ( .A(n800), .Y(n813) );
  NOR2XLTS U920 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n939) );
  AOI222X4TS U921 ( .A0(n1112), .A1(d_ff2_Z[28]), .B0(n934), .B1(d_ff1_Z[28]), 
        .C0(d_ff_Zn[28]), .C1(n876), .Y(n867) );
  AOI222X4TS U922 ( .A0(n1112), .A1(d_ff2_Z[30]), .B0(n934), .B1(d_ff1_Z[30]), 
        .C0(d_ff_Zn[30]), .C1(n1104), .Y(n935) );
  AOI222X1TS U923 ( .A0(d_ff3_LUT_out[0]), .A1(n985), .B0(n997), .B1(
        d_ff3_sh_x_out[0]), .C0(n809), .C1(d_ff3_sh_y_out[0]), .Y(n963) );
  AOI222X1TS U924 ( .A0(d_ff3_LUT_out[6]), .A1(n971), .B0(n997), .B1(
        d_ff3_sh_x_out[6]), .C0(n808), .C1(d_ff3_sh_y_out[6]), .Y(n955) );
  AOI32X4TS U925 ( .A0(n1187), .A1(n1142), .A2(n1070), .B0(d_ff3_LUT_out[23]), 
        .B1(n1131), .Y(n849) );
  AOI221X4TS U926 ( .A0(n1076), .A1(n1142), .B0(d_ff3_LUT_out[24]), .B1(n1131), 
        .C0(n1075), .Y(n1078) );
  AOI222X4TS U927 ( .A0(n1112), .A1(d_ff2_Z[22]), .B0(n934), .B1(d_ff1_Z[22]), 
        .C0(d_ff_Zn[22]), .C1(n878), .Y(n874) );
  NOR2X2TS U928 ( .A(d_ff2_Y[23]), .B(n1214), .Y(n1087) );
  BUFX6TS U929 ( .A(n884), .Y(n927) );
  NOR2X2TS U930 ( .A(d_ff2_X[23]), .B(n1214), .Y(n1116) );
  AOI222X1TS U931 ( .A0(n1112), .A1(d_ff2_Z[31]), .B0(n934), .B1(d_ff1_Z[31]), 
        .C0(d_ff_Zn[31]), .C1(n876), .Y(n875) );
  BUFX4TS U932 ( .A(n893), .Y(n929) );
  BUFX4TS U933 ( .A(n1034), .Y(n1036) );
  INVX3TS U934 ( .A(n1111), .Y(n1140) );
  CLKINVX6TS U935 ( .A(n1024), .Y(n1022) );
  CLKINVX6TS U936 ( .A(n798), .Y(n1211) );
  OAI211X2TS U937 ( .A0(n1123), .A1(n1061), .B0(n1128), .C0(n1070), .Y(n1071)
         );
  AOI222X4TS U938 ( .A0(n1063), .A1(n1123), .B0(n1063), .B1(n1214), .C0(
        cont_iter_out[3]), .C1(n1091), .Y(n1067) );
  INVX3TS U939 ( .A(n1091), .Y(n1123) );
  BUFX4TS U940 ( .A(n1050), .Y(n1051) );
  AOI222X4TS U941 ( .A0(n1109), .A1(d_ff2_Z[8]), .B0(n936), .B1(d_ff1_Z[8]), 
        .C0(d_ff_Zn[8]), .C1(n876), .Y(n855) );
  AOI222X4TS U942 ( .A0(n1109), .A1(d_ff2_Z[7]), .B0(n936), .B1(d_ff1_Z[7]), 
        .C0(d_ff_Zn[7]), .C1(n876), .Y(n856) );
  AOI222X4TS U943 ( .A0(n1109), .A1(d_ff2_Z[5]), .B0(n936), .B1(d_ff1_Z[5]), 
        .C0(d_ff_Zn[5]), .C1(n876), .Y(n858) );
  AOI222X4TS U944 ( .A0(n1109), .A1(d_ff2_Z[18]), .B0(n936), .B1(d_ff1_Z[18]), 
        .C0(d_ff_Zn[18]), .C1(n878), .Y(n859) );
  AOI222X4TS U945 ( .A0(n1109), .A1(d_ff2_Z[3]), .B0(n936), .B1(d_ff1_Z[3]), 
        .C0(d_ff_Zn[3]), .C1(n876), .Y(n861) );
  CLKINVX6TS U946 ( .A(n1110), .Y(n1109) );
  INVX3TS U947 ( .A(n823), .Y(n1138) );
  AOI222X1TS U948 ( .A0(d_ff3_LUT_out[18]), .A1(n971), .B0(n970), .B1(
        d_ff3_sh_x_out[18]), .C0(n809), .C1(d_ff3_sh_y_out[18]), .Y(n952) );
  AOI222X1TS U949 ( .A0(d_ff3_LUT_out[16]), .A1(n971), .B0(n970), .B1(
        d_ff3_sh_x_out[16]), .C0(n808), .C1(d_ff3_sh_y_out[16]), .Y(n953) );
  AOI222X1TS U950 ( .A0(d_ff3_LUT_out[14]), .A1(n971), .B0(n970), .B1(
        d_ff3_sh_x_out[14]), .C0(n807), .C1(d_ff3_sh_y_out[14]), .Y(n954) );
  AOI222X1TS U951 ( .A0(d_ff3_LUT_out[11]), .A1(n971), .B0(n970), .B1(
        d_ff3_sh_x_out[11]), .C0(n807), .C1(d_ff3_sh_y_out[11]), .Y(n960) );
  AOI222X1TS U952 ( .A0(d_ff3_LUT_out[15]), .A1(n971), .B0(n970), .B1(
        d_ff3_sh_x_out[15]), .C0(n809), .C1(d_ff3_sh_y_out[15]), .Y(n961) );
  AOI222X1TS U953 ( .A0(d_ff3_LUT_out[10]), .A1(n971), .B0(n970), .B1(
        d_ff3_sh_x_out[10]), .C0(n808), .C1(d_ff3_sh_y_out[10]), .Y(n964) );
  INVX3TS U954 ( .A(n948), .Y(n970) );
  OAI2BB2X2TS U955 ( .B0(n1117), .B1(d_ff2_X[24]), .A0N(n1116), .A1N(n1115), 
        .Y(n1122) );
  NAND4XLTS U956 ( .A(n1145), .B(cordic_FSM_state_reg[1]), .C(
        cordic_FSM_state_reg[2]), .D(cordic_FSM_state_reg[0]), .Y(n822) );
  NOR4X4TS U957 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[1]), 
        .C(n1143), .D(n1145), .Y(ack_add_subt) );
  NOR2X4TS U958 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n1048) );
  NOR2X2TS U959 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[3]), 
        .Y(n1007) );
  AND3X4TS U960 ( .A(n1048), .B(n1151), .C(n1145), .Y(n816) );
  AND2X2TS U961 ( .A(n1009), .B(n1001), .Y(n817) );
  OAI21XLTS U962 ( .A0(n1123), .A1(n1064), .B0(n1070), .Y(n1065) );
  OAI21XLTS U963 ( .A0(n1081), .A1(n1015), .B0(n1023), .Y(n844) );
  OAI21XLTS U964 ( .A0(n1187), .A1(n1077), .B0(n849), .Y(n501) );
  OAI21XLTS U965 ( .A0(n1186), .A1(n929), .B0(n894), .Y(n526) );
  OAI21XLTS U966 ( .A0(n1178), .A1(n929), .B0(n918), .Y(n554) );
  OAI21XLTS U967 ( .A0(n1173), .A1(n929), .B0(n921), .Y(n564) );
  OAI21XLTS U968 ( .A0(n1164), .A1(n893), .B0(n888), .Y(n582) );
  OAI21XLTS U969 ( .A0(n814), .A1(n827), .B0(n821), .Y(add_subt_dataB[12]) );
  OAI21XLTS U970 ( .A0(n815), .A1(n948), .B0(n889), .Y(add_subt_dataB[28]) );
  OAI21XLTS U971 ( .A0(n801), .A1(n948), .B0(n891), .Y(add_subt_dataA[23]) );
  OAI21XLTS U972 ( .A0(n1096), .A1(n948), .B0(n881), .Y(add_subt_dataA[28]) );
  NAND3X1TS U973 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[1]), 
        .C(n1001), .Y(n843) );
  INVX2TS U974 ( .A(n843), .Y(n842) );
  NAND2X2TS U975 ( .A(n1187), .B(cont_iter_out[1]), .Y(n1081) );
  INVX2TS U976 ( .A(cont_iter_out[2]), .Y(n1091) );
  NAND2X2TS U977 ( .A(n1123), .B(cont_iter_out[3]), .Y(n1070) );
  NOR2X2TS U978 ( .A(n1081), .B(n1070), .Y(n1038) );
  INVX2TS U979 ( .A(n1038), .Y(n1018) );
  XNOR2X1TS U980 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), 
        .Y(n818) );
  XOR2X1TS U981 ( .A(d_ff1_shift_region_flag_out[0]), .B(n818), .Y(n836) );
  NOR2X1TS U982 ( .A(n836), .B(n1018), .Y(n1042) );
  AOI21X1TS U983 ( .A0(cont_var_out[0]), .A1(n1018), .B0(n1042), .Y(n1032) );
  OAI32X1TS U984 ( .A0(n842), .A1(n798), .A2(n820), .B0(n1032), .B1(n843), .Y(
        n686) );
  NAND2X1TS U985 ( .A(n1151), .B(cordic_FSM_state_reg[1]), .Y(n1005) );
  INVX2TS U986 ( .A(n1005), .Y(n1009) );
  OR4X2TS U987 ( .A(ack_cordic), .B(n1151), .C(n1145), .D(
        cordic_FSM_state_reg[1]), .Y(n1011) );
  OAI211XLTS U988 ( .A0(n819), .A1(n1145), .B0(n1011), .C0(n822), .Y(n732) );
  NAND2X1TS U989 ( .A(n820), .B(sel_mux_2_reg[1]), .Y(n827) );
  AOI22X1TS U990 ( .A0(n997), .A1(d_ff3_sh_x_out[12]), .B0(n809), .B1(
        d_ff3_sh_y_out[12]), .Y(n821) );
  INVX2TS U991 ( .A(n822), .Y(beg_add_subt) );
  INVX4TS U992 ( .A(n798), .Y(n1189) );
  INVX4TS U993 ( .A(n816), .Y(n1191) );
  INVX4TS U994 ( .A(n816), .Y(n1190) );
  INVX4TS U995 ( .A(n816), .Y(n1192) );
  INVX4TS U996 ( .A(n798), .Y(n1205) );
  INVX4TS U997 ( .A(n816), .Y(n1198) );
  INVX4TS U998 ( .A(n798), .Y(n1196) );
  INVX4TS U999 ( .A(n816), .Y(n1199) );
  INVX4TS U1000 ( .A(n798), .Y(n1195) );
  INVX4TS U1001 ( .A(n798), .Y(n1197) );
  INVX4TS U1002 ( .A(n798), .Y(n1188) );
  INVX4TS U1003 ( .A(n798), .Y(n1200) );
  BUFX4TS U1004 ( .A(n1105), .Y(n1106) );
  INVX2TS U1005 ( .A(cont_iter_out[1]), .Y(n1117) );
  NOR2X2TS U1006 ( .A(cont_iter_out[3]), .B(n1117), .Y(n1063) );
  INVX2TS U1007 ( .A(n1063), .Y(n1064) );
  BUFX3TS U1008 ( .A(n823), .Y(n1131) );
  OAI211X1TS U1009 ( .A0(n1064), .A1(n1123), .B0(n1070), .C0(n1142), .Y(n824)
         );
  OAI2BB1X1TS U1010 ( .A0N(d_ff3_LUT_out[16]), .A1N(n1106), .B0(n824), .Y(n508) );
  BUFX4TS U1011 ( .A(n1105), .Y(n1141) );
  OAI2BB1X1TS U1012 ( .A0N(d_ff3_LUT_out[3]), .A1N(n1141), .B0(n824), .Y(n521)
         );
  BUFX4TS U1013 ( .A(n825), .Y(n1110) );
  OA22X1TS U1014 ( .A0(n1110), .A1(d_ff2_X[26]), .B0(d_ff_Xn[26]), .B1(n854), 
        .Y(n350) );
  OA22X1TS U1015 ( .A0(n1110), .A1(d_ff2_X[20]), .B0(d_ff_Xn[20]), .B1(n854), 
        .Y(n359) );
  INVX4TS U1016 ( .A(n823), .Y(n1128) );
  NOR3X1TS U1017 ( .A(n1187), .B(n1123), .C(n1061), .Y(n839) );
  NAND2X1TS U1018 ( .A(n1128), .B(n839), .Y(n846) );
  NAND2X1TS U1019 ( .A(n846), .B(n1071), .Y(n826) );
  AO21XLTS U1020 ( .A0(d_ff3_LUT_out[11]), .A1(n1141), .B0(n826), .Y(n513) );
  AO21XLTS U1021 ( .A0(d_ff3_LUT_out[7]), .A1(n1106), .B0(n826), .Y(n517) );
  BUFX3TS U1022 ( .A(n1110), .Y(n1108) );
  OA22X1TS U1023 ( .A0(n1108), .A1(d_ff2_X[1]), .B0(d_ff_Xn[1]), .B1(n854), 
        .Y(n397) );
  BUFX3TS U1024 ( .A(n854), .Y(n1111) );
  OA22X1TS U1025 ( .A0(n1110), .A1(d_ff2_X[6]), .B0(n812), .B1(n1111), .Y(n387) );
  OA22X1TS U1026 ( .A0(n1110), .A1(d_ff2_X[2]), .B0(d_ff_Xn[2]), .B1(n1111), 
        .Y(n395) );
  AOI22X1TS U1027 ( .A0(n997), .A1(d_ff3_sh_x_out[27]), .B0(n808), .B1(
        d_ff3_sh_y_out[27]), .Y(n829) );
  INVX2TS U1028 ( .A(n827), .Y(n998) );
  NAND2X1TS U1029 ( .A(d_ff3_LUT_out[27]), .B(n998), .Y(n828) );
  NAND2X1TS U1030 ( .A(n829), .B(n828), .Y(add_subt_dataB[27]) );
  INVX4TS U1031 ( .A(n816), .Y(n1209) );
  INVX4TS U1032 ( .A(n816), .Y(n1208) );
  INVX4TS U1033 ( .A(n816), .Y(n1206) );
  INVX4TS U1034 ( .A(n816), .Y(n1204) );
  INVX4TS U1035 ( .A(n816), .Y(n1207) );
  INVX4TS U1036 ( .A(n816), .Y(n1203) );
  INVX2TS U1037 ( .A(rst), .Y(n331) );
  INVX4TS U1038 ( .A(n798), .Y(n1193) );
  INVX4TS U1039 ( .A(n816), .Y(n1202) );
  INVX4TS U1040 ( .A(n798), .Y(n1194) );
  NAND2X1TS U1041 ( .A(n1128), .B(n1214), .Y(n1079) );
  BUFX4TS U1042 ( .A(n1131), .Y(n1134) );
  AOI22X1TS U1043 ( .A0(n1142), .A1(n1087), .B0(d_ff3_sh_y_out[23]), .B1(n1134), .Y(n830) );
  OAI21XLTS U1044 ( .A0(n1079), .A1(n801), .B0(n830), .Y(n409) );
  AOI22X1TS U1045 ( .A0(n1142), .A1(n1116), .B0(d_ff3_sh_x_out[23]), .B1(n1134), .Y(n831) );
  OAI21XLTS U1046 ( .A0(n1154), .A1(n1079), .B0(n831), .Y(n345) );
  NAND2X2TS U1047 ( .A(n1128), .B(n1091), .Y(n1120) );
  OAI211XLTS U1048 ( .A0(n1187), .A1(cont_iter_out[3]), .B0(cont_iter_out[1]), 
        .C0(n1091), .Y(n832) );
  OAI21X1TS U1049 ( .A0(n1187), .A1(n1061), .B0(n832), .Y(n1060) );
  AOI22X1TS U1050 ( .A0(n1142), .A1(n1060), .B0(d_ff3_LUT_out[6]), .B1(n1134), 
        .Y(n833) );
  OAI31X1TS U1051 ( .A0(n1214), .A1(n1146), .A2(n1120), .B0(n833), .Y(n518) );
  CLKINVX6TS U1052 ( .A(n798), .Y(n1213) );
  NAND3XLTS U1053 ( .A(n1009), .B(cordic_FSM_state_reg[3]), .C(n1143), .Y(n835) );
  NAND3XLTS U1054 ( .A(n835), .B(sel_mux_3_reg), .C(n1213), .Y(n834) );
  OAI21XLTS U1055 ( .A0(n836), .A1(n835), .B0(n834), .Y(n688) );
  NAND3XLTS U1056 ( .A(cordic_FSM_state_reg[0]), .B(n1009), .C(n1145), .Y(n838) );
  NAND3XLTS U1057 ( .A(n838), .B(sel_mux_1_reg), .C(n1213), .Y(n837) );
  OAI21XLTS U1058 ( .A0(n839), .A1(n838), .B0(n837), .Y(n687) );
  INVX2TS U1059 ( .A(cont_var_out[1]), .Y(n1039) );
  NOR3X1TS U1060 ( .A(n1038), .B(cont_var_out[0]), .C(n1039), .Y(n1025) );
  NAND2X2TS U1061 ( .A(ack_add_subt), .B(n1025), .Y(n1015) );
  NAND3X1TS U1062 ( .A(cont_iter_out[1]), .B(n1187), .C(n1146), .Y(n1056) );
  NAND2X1TS U1063 ( .A(cont_iter_out[3]), .B(n1023), .Y(n840) );
  OAI31X1TS U1064 ( .A0(n1015), .A1(n1091), .A2(n1056), .B0(n840), .Y(n725) );
  NAND2X1TS U1065 ( .A(sel_mux_2_reg[1]), .B(n1213), .Y(n841) );
  OAI32X1TS U1066 ( .A0(n843), .A1(n1038), .A2(n1039), .B0(n842), .B1(n841), 
        .Y(n685) );
  OAI32X1TS U1067 ( .A0(n1123), .A1(n1081), .A2(n1015), .B0(n844), .B1(n1091), 
        .Y(n726) );
  NAND2X2TS U1068 ( .A(n1123), .B(n1128), .Y(n1119) );
  NOR2X1TS U1069 ( .A(n1081), .B(n1120), .Y(n1075) );
  AOI21X1TS U1070 ( .A0(d_ff3_LUT_out[2]), .A1(n1134), .B0(n1075), .Y(n845) );
  OAI21XLTS U1071 ( .A0(n1061), .A1(n1119), .B0(n845), .Y(n522) );
  OAI21X1TS U1072 ( .A0(n1120), .A1(n1146), .B0(n846), .Y(n1057) );
  AOI21X1TS U1073 ( .A0(d_ff3_LUT_out[1]), .A1(n1134), .B0(n1057), .Y(n847) );
  OAI21XLTS U1074 ( .A0(cont_iter_out[3]), .A1(n1119), .B0(n847), .Y(n523) );
  INVX2TS U1075 ( .A(n1120), .Y(n1062) );
  AOI22X1TS U1076 ( .A0(d_ff3_LUT_out[25]), .A1(n1131), .B0(n1062), .B1(n1081), 
        .Y(n848) );
  OAI21XLTS U1077 ( .A0(n1056), .A1(n1119), .B0(n848), .Y(n499) );
  INVX2TS U1078 ( .A(n1119), .Y(n1058) );
  NAND2X1TS U1079 ( .A(cont_iter_out[3]), .B(n1058), .Y(n1077) );
  INVX4TS U1080 ( .A(n1108), .Y(n1139) );
  BUFX4TS U1081 ( .A(n850), .Y(n936) );
  INVX3TS U1082 ( .A(n854), .Y(n878) );
  AOI222X1TS U1083 ( .A0(n1139), .A1(d_ff2_Z[14]), .B0(n936), .B1(d_ff1_Z[14]), 
        .C0(d_ff_Zn[14]), .C1(n878), .Y(n851) );
  INVX2TS U1084 ( .A(n851), .Y(n482) );
  INVX4TS U1085 ( .A(n1108), .Y(n1083) );
  AOI222X1TS U1086 ( .A0(n1083), .A1(d_ff2_Z[15]), .B0(n936), .B1(d_ff1_Z[15]), 
        .C0(d_ff_Zn[15]), .C1(n878), .Y(n852) );
  INVX2TS U1087 ( .A(n852), .Y(n481) );
  AOI222X1TS U1088 ( .A0(n1083), .A1(d_ff2_Z[17]), .B0(n936), .B1(d_ff1_Z[17]), 
        .C0(d_ff_Zn[17]), .C1(n878), .Y(n853) );
  INVX2TS U1089 ( .A(n853), .Y(n479) );
  INVX3TS U1090 ( .A(n854), .Y(n876) );
  INVX2TS U1091 ( .A(n855), .Y(n488) );
  INVX2TS U1092 ( .A(n856), .Y(n489) );
  AOI222X1TS U1093 ( .A0(n1139), .A1(d_ff2_Z[16]), .B0(n936), .B1(d_ff1_Z[16]), 
        .C0(d_ff_Zn[16]), .C1(n878), .Y(n857) );
  INVX2TS U1094 ( .A(n857), .Y(n480) );
  INVX2TS U1095 ( .A(n858), .Y(n491) );
  INVX2TS U1096 ( .A(n859), .Y(n478) );
  INVX2TS U1097 ( .A(n860), .Y(n483) );
  INVX2TS U1098 ( .A(n861), .Y(n493) );
  AOI222X1TS U1099 ( .A0(n1139), .A1(d_ff2_Z[10]), .B0(n936), .B1(d_ff1_Z[10]), 
        .C0(d_ff_Zn[10]), .C1(n876), .Y(n862) );
  INVX2TS U1100 ( .A(n862), .Y(n486) );
  AOI222X1TS U1101 ( .A0(n1109), .A1(d_ff2_Z[6]), .B0(n936), .B1(d_ff1_Z[6]), 
        .C0(d_ff_Zn[6]), .C1(n876), .Y(n863) );
  INVX2TS U1102 ( .A(n863), .Y(n490) );
  AOI222X1TS U1103 ( .A0(n1109), .A1(d_ff2_Z[9]), .B0(n936), .B1(d_ff1_Z[9]), 
        .C0(d_ff_Zn[9]), .C1(n876), .Y(n864) );
  INVX2TS U1104 ( .A(n864), .Y(n487) );
  BUFX4TS U1105 ( .A(n850), .Y(n934) );
  AOI222X1TS U1106 ( .A0(n1109), .A1(d_ff2_Z[20]), .B0(n934), .B1(d_ff1_Z[20]), 
        .C0(d_ff_Zn[20]), .C1(n878), .Y(n865) );
  INVX2TS U1107 ( .A(n865), .Y(n476) );
  AOI222X1TS U1108 ( .A0(n1109), .A1(d_ff2_Z[2]), .B0(n934), .B1(d_ff1_Z[2]), 
        .C0(d_ff_Zn[2]), .C1(n876), .Y(n866) );
  INVX2TS U1109 ( .A(n866), .Y(n494) );
  INVX2TS U1110 ( .A(n867), .Y(n468) );
  AOI222X1TS U1111 ( .A0(n1109), .A1(d_ff2_Z[4]), .B0(n934), .B1(d_ff1_Z[4]), 
        .C0(d_ff_Zn[4]), .C1(n876), .Y(n868) );
  INVX2TS U1112 ( .A(n868), .Y(n492) );
  INVX2TS U1113 ( .A(n869), .Y(n471) );
  AOI222X1TS U1114 ( .A0(n1109), .A1(d_ff2_Z[1]), .B0(n934), .B1(d_ff1_Z[1]), 
        .C0(d_ff_Zn[1]), .C1(n876), .Y(n870) );
  INVX2TS U1115 ( .A(n870), .Y(n495) );
  AOI222X1TS U1116 ( .A0(n1109), .A1(d_ff2_Z[21]), .B0(n934), .B1(d_ff1_Z[21]), 
        .C0(d_ff_Zn[21]), .C1(n878), .Y(n871) );
  INVX2TS U1117 ( .A(n871), .Y(n475) );
  INVX2TS U1118 ( .A(n872), .Y(n473) );
  AOI222X1TS U1119 ( .A0(n1109), .A1(d_ff2_Z[19]), .B0(n934), .B1(d_ff1_Z[19]), 
        .C0(d_ff_Zn[19]), .C1(n878), .Y(n873) );
  INVX2TS U1120 ( .A(n873), .Y(n477) );
  INVX2TS U1121 ( .A(n874), .Y(n474) );
  INVX2TS U1122 ( .A(n875), .Y(n465) );
  AOI222X1TS U1123 ( .A0(n1109), .A1(d_ff2_Z[24]), .B0(n934), .B1(d_ff1_Z[24]), 
        .C0(d_ff_Zn[24]), .C1(n876), .Y(n877) );
  INVX2TS U1124 ( .A(n877), .Y(n472) );
  INVX2TS U1125 ( .A(n879), .Y(n496) );
  AOI22X1TS U1126 ( .A0(n998), .A1(d_ff2_Z[30]), .B0(d_ff2_X[30]), .B1(n809), 
        .Y(n880) );
  OAI21XLTS U1127 ( .A0(n1149), .A1(n948), .B0(n880), .Y(add_subt_dataA[30])
         );
  INVX1TS U1128 ( .A(d_ff2_Y[28]), .Y(n1096) );
  AOI22X1TS U1129 ( .A0(n998), .A1(d_ff2_Z[28]), .B0(n813), .B1(n808), .Y(n881) );
  AOI22X1TS U1130 ( .A0(n998), .A1(d_ff2_Z[27]), .B0(d_ff2_X[27]), .B1(n807), 
        .Y(n882) );
  OAI21XLTS U1131 ( .A0(n1147), .A1(n948), .B0(n882), .Y(add_subt_dataA[27])
         );
  AOI22X1TS U1132 ( .A0(n998), .A1(d_ff2_Z[29]), .B0(d_ff2_X[29]), .B1(n807), 
        .Y(n883) );
  OAI21XLTS U1133 ( .A0(n1148), .A1(n948), .B0(n883), .Y(add_subt_dataA[29])
         );
  BUFX4TS U1134 ( .A(n926), .Y(n922) );
  AOI22X1TS U1135 ( .A0(d_ff_Xn[2]), .A1(n884), .B0(sign_inv_out[2]), .B1(n922), .Y(n885) );
  OAI21XLTS U1136 ( .A0(n1163), .A1(n893), .B0(n885), .Y(n584) );
  AOI22X1TS U1137 ( .A0(d_ff_Xn[1]), .A1(n884), .B0(sign_inv_out[1]), .B1(n922), .Y(n886) );
  OAI21XLTS U1138 ( .A0(n1162), .A1(n893), .B0(n886), .Y(n586) );
  AOI22X1TS U1139 ( .A0(d_ff_Xn[5]), .A1(n884), .B0(sign_inv_out[5]), .B1(n922), .Y(n887) );
  OAI21XLTS U1140 ( .A0(n1166), .A1(n893), .B0(n887), .Y(n578) );
  AOI22X1TS U1141 ( .A0(d_ff_Xn[3]), .A1(n884), .B0(sign_inv_out[3]), .B1(n922), .Y(n888) );
  AOI22X1TS U1142 ( .A0(d_ff3_sh_y_out[28]), .A1(n809), .B0(d_ff3_LUT_out[27]), 
        .B1(n971), .Y(n889) );
  AOI22X1TS U1143 ( .A0(d_ff3_sh_y_out[29]), .A1(n807), .B0(d_ff3_LUT_out[27]), 
        .B1(n971), .Y(n890) );
  OAI21XLTS U1144 ( .A0(n802), .A1(n948), .B0(n890), .Y(add_subt_dataB[29]) );
  AOI22X1TS U1145 ( .A0(d_ff2_X[23]), .A1(n808), .B0(d_ff2_Z[23]), .B1(n971), 
        .Y(n891) );
  AOI22X1TS U1146 ( .A0(d_ff2_X[24]), .A1(n807), .B0(d_ff2_Z[24]), .B1(n971), 
        .Y(n892) );
  OAI21XLTS U1147 ( .A0(n799), .A1(n948), .B0(n892), .Y(add_subt_dataA[24]) );
  BUFX3TS U1148 ( .A(n922), .Y(n924) );
  AOI22X1TS U1149 ( .A0(d_ff_Xn[31]), .A1(n884), .B0(data_output2_31_), .B1(
        n924), .Y(n894) );
  AOI22X1TS U1150 ( .A0(d_ff_Xn[29]), .A1(n884), .B0(sign_inv_out[29]), .B1(
        n924), .Y(n895) );
  OAI21XLTS U1151 ( .A0(n1159), .A1(n929), .B0(n895), .Y(n530) );
  AOI22X1TS U1152 ( .A0(d_ff_Xn[26]), .A1(n884), .B0(sign_inv_out[26]), .B1(
        n924), .Y(n896) );
  OAI21XLTS U1153 ( .A0(n1185), .A1(n929), .B0(n896), .Y(n536) );
  AOI22X1TS U1154 ( .A0(d_ff_Xn[28]), .A1(n884), .B0(sign_inv_out[28]), .B1(
        n924), .Y(n897) );
  OAI21XLTS U1155 ( .A0(n1158), .A1(n893), .B0(n897), .Y(n532) );
  AOI22X1TS U1156 ( .A0(d_ff_Xn[30]), .A1(n884), .B0(sign_inv_out[30]), .B1(
        n924), .Y(n898) );
  OAI21XLTS U1157 ( .A0(n1160), .A1(n893), .B0(n898), .Y(n528) );
  AOI22X1TS U1158 ( .A0(d_ff_Xn[27]), .A1(n884), .B0(sign_inv_out[27]), .B1(
        n924), .Y(n899) );
  OAI21XLTS U1159 ( .A0(n1157), .A1(n929), .B0(n899), .Y(n534) );
  AOI22X1TS U1160 ( .A0(d_ff_Xn[8]), .A1(n884), .B0(sign_inv_out[8]), .B1(n922), .Y(n900) );
  OAI21XLTS U1161 ( .A0(n1169), .A1(n893), .B0(n900), .Y(n572) );
  AOI22X1TS U1162 ( .A0(d_ff_Xn[7]), .A1(n884), .B0(sign_inv_out[7]), .B1(n922), .Y(n902) );
  OAI21XLTS U1163 ( .A0(n1168), .A1(n893), .B0(n902), .Y(n574) );
  BUFX4TS U1164 ( .A(n998), .Y(n985) );
  AOI222X1TS U1165 ( .A0(d_ff3_LUT_out[26]), .A1(n985), .B0(n970), .B1(
        d_ff3_sh_x_out[26]), .C0(n806), .C1(d_ff3_sh_y_out[26]), .Y(n903) );
  INVX2TS U1166 ( .A(n903), .Y(add_subt_dataB[26]) );
  AOI222X1TS U1167 ( .A0(d_ff3_LUT_out[21]), .A1(n985), .B0(n970), .B1(
        d_ff3_sh_x_out[21]), .C0(n806), .C1(d_ff3_sh_y_out[21]), .Y(n904) );
  INVX2TS U1168 ( .A(n904), .Y(add_subt_dataB[21]) );
  AOI22X1TS U1169 ( .A0(d_ff_Xn[0]), .A1(n927), .B0(sign_inv_out[0]), .B1(n922), .Y(n905) );
  OAI21XLTS U1170 ( .A0(n1161), .A1(n893), .B0(n905), .Y(n588) );
  AOI22X1TS U1171 ( .A0(d_ff_Xn[9]), .A1(n927), .B0(sign_inv_out[9]), .B1(n922), .Y(n906) );
  OAI21XLTS U1172 ( .A0(n1170), .A1(n893), .B0(n906), .Y(n570) );
  AOI22X1TS U1173 ( .A0(d_ff_Xn[16]), .A1(n927), .B0(sign_inv_out[16]), .B1(
        n926), .Y(n907) );
  OAI21XLTS U1174 ( .A0(n1177), .A1(n929), .B0(n907), .Y(n556) );
  AOI22X1TS U1175 ( .A0(n811), .A1(n927), .B0(sign_inv_out[4]), .B1(n922), .Y(
        n908) );
  OAI21XLTS U1176 ( .A0(n1165), .A1(n893), .B0(n908), .Y(n580) );
  AOI22X1TS U1177 ( .A0(d_ff_Xn[24]), .A1(n927), .B0(sign_inv_out[24]), .B1(
        n924), .Y(n909) );
  OAI21XLTS U1178 ( .A0(n1156), .A1(n893), .B0(n909), .Y(n540) );
  AOI22X1TS U1179 ( .A0(d_ff_Xn[11]), .A1(n927), .B0(sign_inv_out[11]), .B1(
        n922), .Y(n910) );
  OAI21XLTS U1180 ( .A0(n1172), .A1(n893), .B0(n910), .Y(n566) );
  AOI22X1TS U1181 ( .A0(d_ff_Xn[23]), .A1(n927), .B0(sign_inv_out[23]), .B1(
        n924), .Y(n911) );
  OAI21XLTS U1182 ( .A0(n1155), .A1(n929), .B0(n911), .Y(n542) );
  AOI22X1TS U1183 ( .A0(d_ff_Xn[15]), .A1(n927), .B0(sign_inv_out[15]), .B1(
        n922), .Y(n912) );
  OAI21XLTS U1184 ( .A0(n1176), .A1(n929), .B0(n912), .Y(n558) );
  AOI22X1TS U1185 ( .A0(d_ff_Xn[22]), .A1(n927), .B0(sign_inv_out[22]), .B1(
        n924), .Y(n913) );
  OAI21XLTS U1186 ( .A0(n1183), .A1(n929), .B0(n913), .Y(n544) );
  AOI22X1TS U1187 ( .A0(d_ff_Xn[13]), .A1(n927), .B0(sign_inv_out[13]), .B1(
        n926), .Y(n914) );
  OAI21XLTS U1188 ( .A0(n1174), .A1(n929), .B0(n914), .Y(n562) );
  AOI22X1TS U1189 ( .A0(d_ff_Xn[25]), .A1(n927), .B0(sign_inv_out[25]), .B1(
        n924), .Y(n915) );
  OAI21XLTS U1190 ( .A0(n1184), .A1(n929), .B0(n915), .Y(n538) );
  AOI22X1TS U1191 ( .A0(n812), .A1(n927), .B0(sign_inv_out[6]), .B1(n922), .Y(
        n916) );
  OAI21XLTS U1192 ( .A0(n1167), .A1(n929), .B0(n916), .Y(n576) );
  AOI22X1TS U1193 ( .A0(d_ff_Xn[18]), .A1(n927), .B0(sign_inv_out[18]), .B1(
        n922), .Y(n917) );
  OAI21XLTS U1194 ( .A0(n1179), .A1(n929), .B0(n917), .Y(n552) );
  AOI22X1TS U1195 ( .A0(d_ff_Xn[17]), .A1(n927), .B0(sign_inv_out[17]), .B1(
        n926), .Y(n918) );
  AOI22X1TS U1196 ( .A0(d_ff_Xn[20]), .A1(n927), .B0(sign_inv_out[20]), .B1(
        n924), .Y(n919) );
  OAI21XLTS U1197 ( .A0(n1181), .A1(n929), .B0(n919), .Y(n548) );
  AOI22X1TS U1198 ( .A0(d_ff_Xn[19]), .A1(n927), .B0(sign_inv_out[19]), .B1(
        n926), .Y(n920) );
  OAI21XLTS U1199 ( .A0(n1180), .A1(n929), .B0(n920), .Y(n550) );
  AOI22X1TS U1200 ( .A0(d_ff_Xn[12]), .A1(n927), .B0(sign_inv_out[12]), .B1(
        n926), .Y(n921) );
  AOI22X1TS U1201 ( .A0(d_ff_Xn[10]), .A1(n927), .B0(sign_inv_out[10]), .B1(
        n922), .Y(n923) );
  OAI21XLTS U1202 ( .A0(n1171), .A1(n929), .B0(n923), .Y(n568) );
  AOI22X1TS U1203 ( .A0(d_ff_Xn[21]), .A1(n927), .B0(sign_inv_out[21]), .B1(
        n924), .Y(n925) );
  OAI21XLTS U1204 ( .A0(n1182), .A1(n929), .B0(n925), .Y(n546) );
  AOI22X1TS U1205 ( .A0(d_ff_Xn[14]), .A1(n927), .B0(sign_inv_out[14]), .B1(
        n926), .Y(n928) );
  OAI21XLTS U1206 ( .A0(n1175), .A1(n929), .B0(n928), .Y(n560) );
  INVX2TS U1207 ( .A(n930), .Y(n470) );
  INVX2TS U1208 ( .A(n931), .Y(n469) );
  INVX2TS U1209 ( .A(n932), .Y(n485) );
  INVX2TS U1210 ( .A(n933), .Y(n467) );
  INVX2TS U1211 ( .A(n935), .Y(n466) );
  INVX2TS U1212 ( .A(n937), .Y(n484) );
  BUFX4TS U1213 ( .A(n985), .Y(n991) );
  INVX4TS U1214 ( .A(n948), .Y(n996) );
  INVX2TS U1215 ( .A(n938), .Y(add_subt_dataA[3]) );
  INVX2TS U1216 ( .A(n940), .Y(add_subt_dataA[2]) );
  INVX2TS U1217 ( .A(n941), .Y(add_subt_dataA[1]) );
  INVX2TS U1218 ( .A(n942), .Y(add_subt_dataA[9]) );
  INVX2TS U1219 ( .A(n943), .Y(add_subt_dataA[4]) );
  INVX2TS U1220 ( .A(n944), .Y(add_subt_dataA[6]) );
  INVX2TS U1221 ( .A(n945), .Y(add_subt_dataA[8]) );
  INVX2TS U1222 ( .A(n946), .Y(add_subt_dataA[7]) );
  INVX2TS U1223 ( .A(n947), .Y(add_subt_dataA[5]) );
  INVX4TS U1224 ( .A(n948), .Y(n995) );
  INVX2TS U1225 ( .A(n949), .Y(add_subt_dataB[25]) );
  INVX2TS U1226 ( .A(n950), .Y(add_subt_dataB[8]) );
  INVX2TS U1227 ( .A(n951), .Y(add_subt_dataB[19]) );
  INVX2TS U1228 ( .A(n952), .Y(add_subt_dataB[18]) );
  INVX2TS U1229 ( .A(n953), .Y(add_subt_dataB[16]) );
  INVX2TS U1230 ( .A(n954), .Y(add_subt_dataB[14]) );
  INVX2TS U1231 ( .A(n955), .Y(add_subt_dataB[6]) );
  AOI222X1TS U1232 ( .A0(d_ff3_LUT_out[20]), .A1(n985), .B0(n970), .B1(
        d_ff3_sh_x_out[20]), .C0(n806), .C1(d_ff3_sh_y_out[20]), .Y(n956) );
  INVX2TS U1233 ( .A(n956), .Y(add_subt_dataB[20]) );
  INVX2TS U1234 ( .A(n957), .Y(add_subt_dataB[3]) );
  INVX2TS U1235 ( .A(n958), .Y(add_subt_dataB[9]) );
  INVX2TS U1236 ( .A(n959), .Y(add_subt_dataB[5]) );
  INVX2TS U1237 ( .A(n960), .Y(add_subt_dataB[11]) );
  INVX2TS U1238 ( .A(n961), .Y(add_subt_dataB[15]) );
  AOI222X1TS U1239 ( .A0(n971), .A1(d_ff3_LUT_out[22]), .B0(n970), .B1(
        d_ff3_sh_x_out[22]), .C0(n806), .C1(d_ff3_sh_y_out[22]), .Y(n962) );
  INVX2TS U1240 ( .A(n962), .Y(add_subt_dataB[22]) );
  INVX2TS U1241 ( .A(n963), .Y(add_subt_dataB[0]) );
  INVX2TS U1242 ( .A(n964), .Y(add_subt_dataB[10]) );
  INVX2TS U1243 ( .A(n965), .Y(add_subt_dataB[2]) );
  INVX2TS U1244 ( .A(n966), .Y(add_subt_dataB[7]) );
  AOI222X1TS U1245 ( .A0(d_ff3_LUT_out[13]), .A1(n985), .B0(n970), .B1(
        d_ff3_sh_x_out[13]), .C0(n806), .C1(d_ff3_sh_y_out[13]), .Y(n967) );
  INVX2TS U1246 ( .A(n967), .Y(add_subt_dataB[13]) );
  INVX2TS U1247 ( .A(n968), .Y(add_subt_dataB[4]) );
  INVX2TS U1248 ( .A(n969), .Y(add_subt_dataB[1]) );
  INVX2TS U1249 ( .A(n972), .Y(add_subt_dataB[17]) );
  INVX2TS U1250 ( .A(n973), .Y(add_subt_dataB[23]) );
  INVX2TS U1251 ( .A(n974), .Y(add_subt_dataB[24]) );
  INVX2TS U1252 ( .A(n975), .Y(add_subt_dataA[0]) );
  INVX2TS U1253 ( .A(n976), .Y(add_subt_dataA[31]) );
  INVX2TS U1254 ( .A(n977), .Y(add_subt_dataA[20]) );
  INVX2TS U1255 ( .A(n978), .Y(add_subt_dataA[17]) );
  INVX2TS U1256 ( .A(n979), .Y(add_subt_dataA[15]) );
  INVX2TS U1257 ( .A(n980), .Y(add_subt_dataA[12]) );
  INVX2TS U1258 ( .A(n981), .Y(add_subt_dataA[18]) );
  INVX2TS U1259 ( .A(n982), .Y(add_subt_dataA[14]) );
  INVX2TS U1260 ( .A(n983), .Y(add_subt_dataA[19]) );
  INVX2TS U1261 ( .A(n984), .Y(add_subt_dataA[13]) );
  INVX2TS U1262 ( .A(n986), .Y(add_subt_dataA[26]) );
  INVX2TS U1263 ( .A(n987), .Y(add_subt_dataA[10]) );
  INVX2TS U1264 ( .A(n988), .Y(add_subt_dataA[11]) );
  INVX2TS U1265 ( .A(n989), .Y(add_subt_dataA[21]) );
  INVX2TS U1266 ( .A(n990), .Y(add_subt_dataA[22]) );
  INVX2TS U1267 ( .A(n992), .Y(add_subt_dataA[16]) );
  AOI31XLTS U1268 ( .A0(cordic_FSM_state_reg[0]), .A1(n1007), .A2(
        beg_fsm_cordic), .B0(ack_add_subt), .Y(n994) );
  OAI211XLTS U1269 ( .A0(n1151), .A1(n1145), .B0(cordic_FSM_state_reg[1]), 
        .C0(n1143), .Y(n993) );
  NAND3XLTS U1270 ( .A(n994), .B(n823), .C(n993), .Y(cordic_FSM_state_next_1_)
         );
  AO22XLTS U1271 ( .A0(n995), .A1(d_ff3_sh_x_out[31]), .B0(n809), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U1272 ( .A0(d_ff3_sh_y_out[30]), .A1(n808), .B0(d_ff3_sh_x_out[30]), 
        .B1(n996), .Y(add_subt_dataB[30]) );
  AOI22X1TS U1273 ( .A0(n998), .A1(d_ff2_Z[25]), .B0(d_ff2_Y[25]), .B1(n997), 
        .Y(n999) );
  OAI2BB1X1TS U1274 ( .A0N(n807), .A1N(d_ff2_X[25]), .B0(n999), .Y(
        add_subt_dataA[25]) );
  AOI2BB2XLTS U1275 ( .B0(d_ff3_sign_out), .B1(n1152), .A0N(n1152), .A1N(
        d_ff3_sign_out), .Y(op_add_subt) );
  AOI31XLTS U1276 ( .A0(cordic_FSM_state_reg[3]), .A1(cordic_FSM_state_reg[0]), 
        .A2(ack_cordic), .B0(cordic_FSM_state_reg[1]), .Y(n1000) );
  OAI21X1TS U1277 ( .A0(n1001), .A1(n1000), .B0(cordic_FSM_state_reg[2]), .Y(
        n1004) );
  NAND2X1TS U1278 ( .A(cont_var_out[1]), .B(n1152), .Y(n1002) );
  NAND4XLTS U1279 ( .A(cordic_FSM_state_reg[3]), .B(n1151), .C(n1018), .D(
        n1002), .Y(n1003) );
  AOI32X1TS U1280 ( .A0(n1005), .A1(n1004), .A2(n1003), .B0(n1143), .B1(n1004), 
        .Y(n731) );
  INVX2TS U1281 ( .A(beg_fsm_cordic), .Y(n1006) );
  AOI32X1TS U1282 ( .A0(n1007), .A1(n1151), .A2(n1006), .B0(n1048), .B1(
        cordic_FSM_state_reg[2]), .Y(n1012) );
  NOR2BX1TS U1283 ( .AN(ready_add_subt), .B(cordic_FSM_state_reg[2]), .Y(n1008) );
  OAI31X1TS U1284 ( .A0(n1009), .A1(n1008), .A2(n1145), .B0(n1143), .Y(n1010)
         );
  NAND4XLTS U1285 ( .A(n1012), .B(n1015), .C(n1011), .D(n1010), .Y(n730) );
  NAND3X1TS U1286 ( .A(cont_var_out[0]), .B(ack_add_subt), .C(n1018), .Y(n1020) );
  OAI21XLTS U1287 ( .A0(n1039), .A1(n1020), .B0(n1134), .Y(n1013) );
  AOI21X1TS U1288 ( .A0(n1039), .A1(n1020), .B0(n1013), .Y(n729) );
  NAND2X1TS U1289 ( .A(n1023), .B(n1015), .Y(n1014) );
  AOI22X1TS U1290 ( .A0(n1187), .A1(n1014), .B0(n1015), .B1(n1214), .Y(n728)
         );
  NOR2X1TS U1291 ( .A(n1214), .B(n1015), .Y(n1017) );
  OAI21XLTS U1292 ( .A0(cont_iter_out[1]), .A1(n1017), .B0(n1023), .Y(n1016)
         );
  AOI21X1TS U1293 ( .A0(cont_iter_out[1]), .A1(n1017), .B0(n1016), .Y(n727) );
  AOI31XLTS U1294 ( .A0(ack_add_subt), .A1(n1018), .A2(n1039), .B0(
        cont_var_out[0]), .Y(n1019) );
  NOR3BXLTS U1295 ( .AN(n1020), .B(n1142), .C(n1019), .Y(n724) );
  BUFX3TS U1296 ( .A(n817), .Y(n1021) );
  AO22XLTS U1297 ( .A0(n1022), .A1(d_ff1_operation_out), .B0(n1021), .B1(
        operation), .Y(n723) );
  AO22XLTS U1298 ( .A0(n1022), .A1(d_ff1_shift_region_flag_out[0]), .B0(n1021), 
        .B1(shift_region_flag[0]), .Y(n722) );
  AO22XLTS U1299 ( .A0(n1022), .A1(d_ff1_shift_region_flag_out[1]), .B0(n1021), 
        .B1(shift_region_flag[1]), .Y(n721) );
  AO22XLTS U1300 ( .A0(n1021), .A1(data_in[0]), .B0(n1022), .B1(d_ff1_Z[0]), 
        .Y(n720) );
  AO22XLTS U1301 ( .A0(n1021), .A1(data_in[1]), .B0(n1022), .B1(d_ff1_Z[1]), 
        .Y(n719) );
  AO22XLTS U1302 ( .A0(n817), .A1(data_in[2]), .B0(n1022), .B1(d_ff1_Z[2]), 
        .Y(n718) );
  AO22XLTS U1303 ( .A0(n1024), .A1(data_in[3]), .B0(n1022), .B1(d_ff1_Z[3]), 
        .Y(n717) );
  AO22XLTS U1304 ( .A0(n817), .A1(data_in[4]), .B0(n1022), .B1(d_ff1_Z[4]), 
        .Y(n716) );
  AO22XLTS U1305 ( .A0(n817), .A1(data_in[5]), .B0(n1022), .B1(d_ff1_Z[5]), 
        .Y(n715) );
  AO22XLTS U1306 ( .A0(n1024), .A1(data_in[6]), .B0(n1022), .B1(d_ff1_Z[6]), 
        .Y(n714) );
  AO22XLTS U1307 ( .A0(n817), .A1(data_in[7]), .B0(n1022), .B1(d_ff1_Z[7]), 
        .Y(n713) );
  AO22XLTS U1308 ( .A0(n1024), .A1(data_in[8]), .B0(n1022), .B1(d_ff1_Z[8]), 
        .Y(n712) );
  AO22XLTS U1309 ( .A0(n1024), .A1(data_in[9]), .B0(n1022), .B1(d_ff1_Z[9]), 
        .Y(n711) );
  AO22XLTS U1310 ( .A0(n1024), .A1(data_in[10]), .B0(n1022), .B1(d_ff1_Z[10]), 
        .Y(n710) );
  AO22XLTS U1311 ( .A0(n1024), .A1(data_in[11]), .B0(n1022), .B1(d_ff1_Z[11]), 
        .Y(n709) );
  AO22XLTS U1312 ( .A0(n1024), .A1(data_in[12]), .B0(n1022), .B1(d_ff1_Z[12]), 
        .Y(n708) );
  AO22XLTS U1313 ( .A0(n1024), .A1(data_in[13]), .B0(n1022), .B1(d_ff1_Z[13]), 
        .Y(n707) );
  AO22XLTS U1314 ( .A0(n1024), .A1(data_in[14]), .B0(n1023), .B1(d_ff1_Z[14]), 
        .Y(n706) );
  AO22XLTS U1315 ( .A0(n1024), .A1(data_in[15]), .B0(n1023), .B1(d_ff1_Z[15]), 
        .Y(n705) );
  AO22XLTS U1316 ( .A0(n1024), .A1(data_in[16]), .B0(n1023), .B1(d_ff1_Z[16]), 
        .Y(n704) );
  AO22XLTS U1317 ( .A0(n1024), .A1(data_in[17]), .B0(n1023), .B1(d_ff1_Z[17]), 
        .Y(n703) );
  AO22XLTS U1318 ( .A0(n1024), .A1(data_in[18]), .B0(n1023), .B1(d_ff1_Z[18]), 
        .Y(n702) );
  AO22XLTS U1319 ( .A0(n1024), .A1(data_in[19]), .B0(n1023), .B1(d_ff1_Z[19]), 
        .Y(n701) );
  AO22XLTS U1320 ( .A0(n817), .A1(data_in[20]), .B0(n1023), .B1(d_ff1_Z[20]), 
        .Y(n700) );
  AO22XLTS U1321 ( .A0(n1021), .A1(data_in[21]), .B0(n1023), .B1(d_ff1_Z[21]), 
        .Y(n699) );
  AO22XLTS U1322 ( .A0(n1021), .A1(data_in[22]), .B0(n1023), .B1(d_ff1_Z[22]), 
        .Y(n698) );
  AO22XLTS U1323 ( .A0(n1021), .A1(data_in[23]), .B0(n1023), .B1(d_ff1_Z[23]), 
        .Y(n697) );
  AO22XLTS U1324 ( .A0(n1021), .A1(data_in[24]), .B0(n1023), .B1(d_ff1_Z[24]), 
        .Y(n696) );
  AO22XLTS U1325 ( .A0(n1021), .A1(data_in[25]), .B0(n1023), .B1(d_ff1_Z[25]), 
        .Y(n695) );
  AO22XLTS U1326 ( .A0(n1021), .A1(data_in[26]), .B0(n1023), .B1(d_ff1_Z[26]), 
        .Y(n694) );
  AO22XLTS U1327 ( .A0(n1021), .A1(data_in[27]), .B0(n1023), .B1(d_ff1_Z[27]), 
        .Y(n693) );
  AO22XLTS U1328 ( .A0(n1021), .A1(data_in[28]), .B0(n1023), .B1(d_ff1_Z[28]), 
        .Y(n692) );
  AO22XLTS U1329 ( .A0(n1021), .A1(data_in[29]), .B0(n1022), .B1(d_ff1_Z[29]), 
        .Y(n691) );
  AO22XLTS U1330 ( .A0(n1024), .A1(data_in[30]), .B0(n1022), .B1(d_ff1_Z[30]), 
        .Y(n690) );
  AO22XLTS U1331 ( .A0(n1024), .A1(data_in[31]), .B0(n1023), .B1(d_ff1_Z[31]), 
        .Y(n689) );
  NAND4X1TS U1332 ( .A(cordic_FSM_state_reg[3]), .B(n1048), .C(ready_add_subt), 
        .D(n1151), .Y(n1040) );
  NOR2BX1TS U1333 ( .AN(n1025), .B(n1040), .Y(n1026) );
  INVX4TS U1334 ( .A(n1027), .Y(n1031) );
  AO22XLTS U1335 ( .A0(n1031), .A1(result_add_subt[0]), .B0(n1027), .B1(
        d_ff_Zn[0]), .Y(n684) );
  AO22XLTS U1336 ( .A0(n1031), .A1(result_add_subt[1]), .B0(n1027), .B1(
        d_ff_Zn[1]), .Y(n683) );
  AO22XLTS U1337 ( .A0(n1031), .A1(result_add_subt[2]), .B0(n1027), .B1(
        d_ff_Zn[2]), .Y(n682) );
  AO22XLTS U1338 ( .A0(n1031), .A1(result_add_subt[3]), .B0(n1027), .B1(
        d_ff_Zn[3]), .Y(n681) );
  AO22XLTS U1339 ( .A0(n1031), .A1(result_add_subt[4]), .B0(n1027), .B1(
        d_ff_Zn[4]), .Y(n680) );
  AO22XLTS U1340 ( .A0(n1031), .A1(result_add_subt[5]), .B0(n1027), .B1(
        d_ff_Zn[5]), .Y(n679) );
  AO22XLTS U1341 ( .A0(n1031), .A1(result_add_subt[6]), .B0(n1027), .B1(
        d_ff_Zn[6]), .Y(n678) );
  BUFX3TS U1342 ( .A(n1027), .Y(n1030) );
  AO22XLTS U1343 ( .A0(n1031), .A1(result_add_subt[7]), .B0(n1030), .B1(
        d_ff_Zn[7]), .Y(n677) );
  AO22XLTS U1344 ( .A0(n1031), .A1(result_add_subt[8]), .B0(n1030), .B1(
        d_ff_Zn[8]), .Y(n676) );
  AO22XLTS U1345 ( .A0(n1031), .A1(result_add_subt[9]), .B0(n1030), .B1(
        d_ff_Zn[9]), .Y(n675) );
  AO22XLTS U1346 ( .A0(n1031), .A1(result_add_subt[10]), .B0(n1030), .B1(
        d_ff_Zn[10]), .Y(n674) );
  AO22XLTS U1347 ( .A0(n1031), .A1(result_add_subt[11]), .B0(n1030), .B1(
        d_ff_Zn[11]), .Y(n673) );
  INVX4TS U1348 ( .A(n1027), .Y(n1029) );
  AO22XLTS U1349 ( .A0(n1029), .A1(result_add_subt[12]), .B0(n1028), .B1(
        d_ff_Zn[12]), .Y(n672) );
  AO22XLTS U1350 ( .A0(n1029), .A1(result_add_subt[13]), .B0(n1028), .B1(
        d_ff_Zn[13]), .Y(n671) );
  AO22XLTS U1351 ( .A0(n1029), .A1(result_add_subt[14]), .B0(n1028), .B1(
        d_ff_Zn[14]), .Y(n670) );
  AO22XLTS U1352 ( .A0(n1029), .A1(result_add_subt[15]), .B0(n1028), .B1(
        d_ff_Zn[15]), .Y(n669) );
  AO22XLTS U1353 ( .A0(n1029), .A1(result_add_subt[16]), .B0(n1028), .B1(
        d_ff_Zn[16]), .Y(n668) );
  AO22XLTS U1354 ( .A0(n1029), .A1(result_add_subt[17]), .B0(n1028), .B1(
        d_ff_Zn[17]), .Y(n667) );
  AO22XLTS U1355 ( .A0(n1029), .A1(result_add_subt[18]), .B0(n1028), .B1(
        d_ff_Zn[18]), .Y(n666) );
  AO22XLTS U1356 ( .A0(n1029), .A1(result_add_subt[19]), .B0(n1028), .B1(
        d_ff_Zn[19]), .Y(n665) );
  AO22XLTS U1357 ( .A0(n1029), .A1(result_add_subt[20]), .B0(n1028), .B1(
        d_ff_Zn[20]), .Y(n664) );
  AO22XLTS U1358 ( .A0(n1029), .A1(result_add_subt[21]), .B0(n1028), .B1(
        d_ff_Zn[21]), .Y(n663) );
  AO22XLTS U1359 ( .A0(n1029), .A1(result_add_subt[22]), .B0(n1028), .B1(
        d_ff_Zn[22]), .Y(n662) );
  AO22XLTS U1360 ( .A0(n1029), .A1(result_add_subt[23]), .B0(n1030), .B1(
        d_ff_Zn[23]), .Y(n661) );
  AO22XLTS U1361 ( .A0(n1029), .A1(result_add_subt[24]), .B0(n1030), .B1(
        d_ff_Zn[24]), .Y(n660) );
  AO22XLTS U1362 ( .A0(n1031), .A1(result_add_subt[25]), .B0(n1030), .B1(
        d_ff_Zn[25]), .Y(n659) );
  AO22XLTS U1363 ( .A0(n1029), .A1(result_add_subt[26]), .B0(n1030), .B1(
        d_ff_Zn[26]), .Y(n658) );
  AO22XLTS U1364 ( .A0(n1031), .A1(result_add_subt[27]), .B0(n1030), .B1(
        d_ff_Zn[27]), .Y(n657) );
  AO22XLTS U1365 ( .A0(n1029), .A1(result_add_subt[28]), .B0(n1030), .B1(
        d_ff_Zn[28]), .Y(n656) );
  AO22XLTS U1366 ( .A0(n1031), .A1(result_add_subt[29]), .B0(n1030), .B1(
        d_ff_Zn[29]), .Y(n655) );
  AO22XLTS U1367 ( .A0(n1029), .A1(result_add_subt[30]), .B0(n1030), .B1(
        d_ff_Zn[30]), .Y(n654) );
  AO22XLTS U1368 ( .A0(n1031), .A1(result_add_subt[31]), .B0(n1030), .B1(
        d_ff_Zn[31]), .Y(n653) );
  BUFX4TS U1369 ( .A(n1034), .Y(n1035) );
  OAI2BB2XLTS U1370 ( .B0(n1035), .B1(n1161), .A0N(n1034), .A1N(
        result_add_subt[0]), .Y(n652) );
  OAI2BB2XLTS U1371 ( .B0(n1035), .B1(n1162), .A0N(n1035), .A1N(
        result_add_subt[1]), .Y(n651) );
  BUFX4TS U1372 ( .A(n1034), .Y(n1037) );
  OAI2BB2XLTS U1373 ( .B0(n1035), .B1(n1163), .A0N(n1037), .A1N(
        result_add_subt[2]), .Y(n650) );
  OAI2BB2XLTS U1374 ( .B0(n1035), .B1(n1164), .A0N(n1037), .A1N(
        result_add_subt[3]), .Y(n649) );
  OAI2BB2XLTS U1375 ( .B0(n1035), .B1(n1165), .A0N(n1037), .A1N(
        result_add_subt[4]), .Y(n648) );
  OAI2BB2XLTS U1376 ( .B0(n1035), .B1(n1166), .A0N(n1037), .A1N(
        result_add_subt[5]), .Y(n647) );
  OAI2BB2XLTS U1377 ( .B0(n1035), .B1(n1167), .A0N(n1037), .A1N(
        result_add_subt[6]), .Y(n646) );
  OAI2BB2XLTS U1378 ( .B0(n1035), .B1(n1168), .A0N(n1037), .A1N(
        result_add_subt[7]), .Y(n645) );
  OAI2BB2XLTS U1379 ( .B0(n1035), .B1(n1169), .A0N(n1035), .A1N(
        result_add_subt[8]), .Y(n644) );
  OAI2BB2XLTS U1380 ( .B0(n1035), .B1(n1170), .A0N(n1037), .A1N(
        result_add_subt[9]), .Y(n643) );
  OAI2BB2XLTS U1381 ( .B0(n1036), .B1(n1171), .A0N(n1035), .A1N(
        result_add_subt[10]), .Y(n642) );
  OAI2BB2XLTS U1382 ( .B0(n1037), .B1(n1172), .A0N(n1035), .A1N(
        result_add_subt[11]), .Y(n641) );
  OAI2BB2XLTS U1383 ( .B0(n1034), .B1(n1173), .A0N(n1037), .A1N(
        result_add_subt[12]), .Y(n640) );
  OAI2BB2XLTS U1384 ( .B0(n1036), .B1(n1174), .A0N(n1035), .A1N(
        result_add_subt[13]), .Y(n639) );
  OAI2BB2XLTS U1385 ( .B0(n1036), .B1(n1175), .A0N(n1035), .A1N(
        result_add_subt[14]), .Y(n638) );
  OAI2BB2XLTS U1386 ( .B0(n1036), .B1(n1176), .A0N(n1037), .A1N(
        result_add_subt[15]), .Y(n637) );
  OAI2BB2XLTS U1387 ( .B0(n1035), .B1(n1177), .A0N(n1037), .A1N(
        result_add_subt[16]), .Y(n636) );
  OAI2BB2XLTS U1388 ( .B0(n1034), .B1(n1178), .A0N(n1037), .A1N(
        result_add_subt[17]), .Y(n635) );
  OAI2BB2XLTS U1389 ( .B0(n1034), .B1(n1179), .A0N(n1037), .A1N(
        result_add_subt[18]), .Y(n634) );
  OAI2BB2XLTS U1390 ( .B0(n1036), .B1(n1180), .A0N(n1037), .A1N(
        result_add_subt[19]), .Y(n633) );
  OAI2BB2XLTS U1391 ( .B0(n1036), .B1(n1181), .A0N(n1037), .A1N(
        result_add_subt[20]), .Y(n632) );
  OAI2BB2XLTS U1392 ( .B0(n1036), .B1(n1182), .A0N(n1034), .A1N(
        result_add_subt[21]), .Y(n631) );
  OAI2BB2XLTS U1393 ( .B0(n1036), .B1(n1183), .A0N(n1037), .A1N(
        result_add_subt[22]), .Y(n630) );
  OAI2BB2XLTS U1394 ( .B0(n1036), .B1(n1155), .A0N(n1037), .A1N(
        result_add_subt[23]), .Y(n629) );
  OAI2BB2XLTS U1395 ( .B0(n1036), .B1(n1156), .A0N(n1034), .A1N(
        result_add_subt[24]), .Y(n628) );
  OAI2BB2XLTS U1396 ( .B0(n1036), .B1(n1184), .A0N(n1034), .A1N(
        result_add_subt[25]), .Y(n627) );
  OAI2BB2XLTS U1397 ( .B0(n1036), .B1(n1185), .A0N(n1034), .A1N(
        result_add_subt[26]), .Y(n626) );
  OAI2BB2XLTS U1398 ( .B0(n1036), .B1(n1157), .A0N(n1035), .A1N(
        result_add_subt[27]), .Y(n625) );
  OAI2BB2XLTS U1399 ( .B0(n1036), .B1(n1158), .A0N(n1037), .A1N(
        result_add_subt[28]), .Y(n624) );
  OAI2BB2XLTS U1400 ( .B0(n1036), .B1(n1159), .A0N(n1037), .A1N(
        result_add_subt[29]), .Y(n623) );
  OAI2BB2XLTS U1401 ( .B0(n1036), .B1(n1160), .A0N(n1035), .A1N(
        result_add_subt[30]), .Y(n622) );
  OAI2BB2XLTS U1402 ( .B0(n1037), .B1(n1186), .A0N(n1034), .A1N(
        result_add_subt[31]), .Y(n621) );
  AOI21X1TS U1403 ( .A0(n1152), .A1(n1039), .B0(n1038), .Y(n1041) );
  INVX4TS U1404 ( .A(n1043), .Y(n1047) );
  BUFX3TS U1405 ( .A(n1043), .Y(n1044) );
  INVX4TS U1406 ( .A(n1043), .Y(n1045) );
  AO22XLTS U1407 ( .A0(n1047), .A1(result_add_subt[29]), .B0(n1046), .B1(
        d_ff_Xn[29]), .Y(n591) );
  AO22XLTS U1408 ( .A0(n1045), .A1(result_add_subt[30]), .B0(n1046), .B1(
        d_ff_Xn[30]), .Y(n590) );
  AO22XLTS U1409 ( .A0(n1047), .A1(result_add_subt[31]), .B0(n1046), .B1(
        d_ff_Xn[31]), .Y(n589) );
  INVX2TS U1410 ( .A(n1048), .Y(n1049) );
  INVX4TS U1411 ( .A(n1050), .Y(n1055) );
  AO22XLTS U1412 ( .A0(n1055), .A1(sign_inv_out[0]), .B0(n1050), .B1(
        data_output[0]), .Y(n587) );
  AO22XLTS U1413 ( .A0(n1055), .A1(sign_inv_out[1]), .B0(n1051), .B1(
        data_output[1]), .Y(n585) );
  AO22XLTS U1414 ( .A0(n1055), .A1(sign_inv_out[2]), .B0(n1051), .B1(
        data_output[2]), .Y(n583) );
  AO22XLTS U1415 ( .A0(n1055), .A1(sign_inv_out[3]), .B0(n1050), .B1(
        data_output[3]), .Y(n581) );
  AO22XLTS U1416 ( .A0(n1055), .A1(sign_inv_out[4]), .B0(n1051), .B1(
        data_output[4]), .Y(n579) );
  AO22XLTS U1417 ( .A0(n1055), .A1(sign_inv_out[5]), .B0(n1050), .B1(
        data_output[5]), .Y(n577) );
  AO22XLTS U1418 ( .A0(n1055), .A1(sign_inv_out[6]), .B0(n1050), .B1(
        data_output[6]), .Y(n575) );
  AO22XLTS U1419 ( .A0(n1055), .A1(sign_inv_out[7]), .B0(n1050), .B1(
        data_output[7]), .Y(n573) );
  AO22XLTS U1420 ( .A0(n1055), .A1(sign_inv_out[8]), .B0(n1051), .B1(
        data_output[8]), .Y(n571) );
  AO22XLTS U1421 ( .A0(n1055), .A1(sign_inv_out[9]), .B0(n1051), .B1(
        data_output[9]), .Y(n569) );
  AO22XLTS U1422 ( .A0(n1055), .A1(sign_inv_out[10]), .B0(n1051), .B1(
        data_output[10]), .Y(n567) );
  AO22XLTS U1423 ( .A0(n1055), .A1(sign_inv_out[11]), .B0(n1051), .B1(
        data_output[11]), .Y(n565) );
  INVX4TS U1424 ( .A(n1050), .Y(n1052) );
  AO22XLTS U1425 ( .A0(n1052), .A1(sign_inv_out[12]), .B0(n1051), .B1(
        data_output[12]), .Y(n563) );
  AO22XLTS U1426 ( .A0(n1052), .A1(sign_inv_out[13]), .B0(n1051), .B1(
        data_output[13]), .Y(n561) );
  AO22XLTS U1427 ( .A0(n1052), .A1(sign_inv_out[14]), .B0(n1051), .B1(
        data_output[14]), .Y(n559) );
  AO22XLTS U1428 ( .A0(n1052), .A1(sign_inv_out[15]), .B0(n1051), .B1(
        data_output[15]), .Y(n557) );
  AO22XLTS U1429 ( .A0(n1052), .A1(sign_inv_out[16]), .B0(n1051), .B1(
        data_output[16]), .Y(n555) );
  AO22XLTS U1430 ( .A0(n1052), .A1(sign_inv_out[17]), .B0(n1051), .B1(
        data_output[17]), .Y(n553) );
  AO22XLTS U1431 ( .A0(n1052), .A1(sign_inv_out[18]), .B0(n1051), .B1(
        data_output[18]), .Y(n551) );
  AO22XLTS U1432 ( .A0(n1052), .A1(sign_inv_out[19]), .B0(n1051), .B1(
        data_output[19]), .Y(n549) );
  AO22XLTS U1433 ( .A0(n1052), .A1(sign_inv_out[20]), .B0(n1051), .B1(
        data_output[20]), .Y(n547) );
  AO22XLTS U1434 ( .A0(n1052), .A1(sign_inv_out[21]), .B0(n1051), .B1(
        data_output[21]), .Y(n545) );
  AO22XLTS U1435 ( .A0(n1052), .A1(sign_inv_out[22]), .B0(n1051), .B1(
        data_output[22]), .Y(n543) );
  AO22XLTS U1436 ( .A0(n1052), .A1(sign_inv_out[23]), .B0(n1050), .B1(
        data_output[23]), .Y(n541) );
  AO22XLTS U1437 ( .A0(n1052), .A1(sign_inv_out[24]), .B0(n1050), .B1(
        data_output[24]), .Y(n539) );
  AO22XLTS U1438 ( .A0(n1055), .A1(sign_inv_out[25]), .B0(n1050), .B1(
        data_output[25]), .Y(n537) );
  AO22XLTS U1439 ( .A0(n1052), .A1(sign_inv_out[26]), .B0(n1050), .B1(
        data_output[26]), .Y(n535) );
  AO22XLTS U1440 ( .A0(n1055), .A1(sign_inv_out[27]), .B0(n1050), .B1(
        data_output[27]), .Y(n533) );
  AO22XLTS U1441 ( .A0(n1052), .A1(sign_inv_out[28]), .B0(n1050), .B1(
        data_output[28]), .Y(n531) );
  AO22XLTS U1442 ( .A0(n1055), .A1(sign_inv_out[29]), .B0(n1050), .B1(
        data_output[29]), .Y(n529) );
  AO22XLTS U1443 ( .A0(n1052), .A1(sign_inv_out[30]), .B0(n1050), .B1(
        data_output[30]), .Y(n527) );
  XOR2XLTS U1444 ( .A(data_output2_31_), .B(n1053), .Y(n1054) );
  AO22XLTS U1445 ( .A0(n1055), .A1(n1054), .B0(n1050), .B1(data_output[31]), 
        .Y(n525) );
  INVX2TS U1446 ( .A(n1056), .Y(n1076) );
  AOI21X1TS U1447 ( .A0(n1076), .A1(n1128), .B0(n1057), .Y(n1066) );
  AOI22X1TS U1448 ( .A0(n1063), .A1(n1058), .B0(d_ff3_LUT_out[0]), .B1(n1134), 
        .Y(n1059) );
  NAND2X1TS U1449 ( .A(n1066), .B(n1059), .Y(n524) );
  OAI21X1TS U1450 ( .A0(n1123), .A1(cont_iter_out[3]), .B0(n1128), .Y(n1080)
         );
  OA22X1TS U1451 ( .A0(n1128), .A1(d_ff3_LUT_out[4]), .B0(n1080), .B1(n1060), 
        .Y(n520) );
  OAI32X1TS U1452 ( .A0(n1131), .A1(n1214), .A2(n1061), .B0(n1067), .B1(n1131), 
        .Y(n1068) );
  AO21XLTS U1453 ( .A0(d_ff3_LUT_out[5]), .A1(n1141), .B0(n1068), .Y(n519) );
  AO21XLTS U1454 ( .A0(d_ff3_LUT_out[8]), .A1(n1106), .B0(n1062), .Y(n516) );
  AOI21X1TS U1455 ( .A0(n1063), .A1(n1214), .B0(n1134), .Y(n1073) );
  AOI2BB2XLTS U1456 ( .B0(n1073), .B1(n1065), .A0N(n1128), .A1N(
        d_ff3_LUT_out[9]), .Y(n515) );
  OAI2BB1X1TS U1457 ( .A0N(d_ff3_LUT_out[10]), .A1N(n1105), .B0(n1066), .Y(
        n514) );
  AOI22X1TS U1458 ( .A0(n1099), .A1(n1067), .B0(n814), .B1(n1134), .Y(n512) );
  OAI31X1TS U1459 ( .A0(n1187), .A1(n1123), .A2(cont_iter_out[3]), .B0(n1070), 
        .Y(n1072) );
  NOR2X1TS U1460 ( .A(n1131), .B(n1072), .Y(n1069) );
  AO21XLTS U1461 ( .A0(d_ff3_LUT_out[13]), .A1(n1106), .B0(n1069), .Y(n511) );
  AO21XLTS U1462 ( .A0(d_ff3_LUT_out[14]), .A1(n1106), .B0(n1068), .Y(n510) );
  OAI2BB1X1TS U1463 ( .A0N(d_ff3_LUT_out[15]), .A1N(n1141), .B0(n1071), .Y(
        n509) );
  OAI2BB1X1TS U1464 ( .A0N(d_ff3_LUT_out[17]), .A1N(n823), .B0(n1071), .Y(n507) );
  AO21XLTS U1465 ( .A0(d_ff3_LUT_out[18]), .A1(n1141), .B0(n1069), .Y(n506) );
  NAND2X1TS U1466 ( .A(n1128), .B(n1070), .Y(n1074) );
  OAI2BB1X1TS U1467 ( .A0N(d_ff3_LUT_out[19]), .A1N(n1106), .B0(n1074), .Y(
        n505) );
  OAI2BB1X1TS U1468 ( .A0N(d_ff3_LUT_out[20]), .A1N(n1105), .B0(n1071), .Y(
        n504) );
  AOI2BB2XLTS U1469 ( .B0(n1073), .B1(n1072), .A0N(n1128), .A1N(
        d_ff3_LUT_out[21]), .Y(n503) );
  OAI2BB1X1TS U1470 ( .A0N(d_ff3_LUT_out[22]), .A1N(n823), .B0(n1074), .Y(n502) );
  AOI32X1TS U1471 ( .A0(n1079), .A1(n1078), .A2(n1077), .B0(cont_iter_out[1]), 
        .B1(n1078), .Y(n500) );
  AOI21X1TS U1472 ( .A0(n1081), .A1(n1146), .B0(n1080), .Y(n1082) );
  AOI2BB1XLTS U1473 ( .A0N(n1128), .A1N(d_ff3_LUT_out[26]), .B0(n1082), .Y(
        n498) );
  AO22XLTS U1474 ( .A0(n1131), .A1(d_ff3_sign_out), .B0(n1142), .B1(
        d_ff2_Z[31]), .Y(n464) );
  AO22XLTS U1475 ( .A0(d_ff_Yn[0]), .A1(n1140), .B0(d_ff2_Y[0]), .B1(n1112), 
        .Y(n463) );
  AO22XLTS U1476 ( .A0(n1125), .A1(d_ff2_Y[0]), .B0(n1141), .B1(
        d_ff3_sh_y_out[0]), .Y(n462) );
  INVX4TS U1477 ( .A(n854), .Y(n1107) );
  AO22XLTS U1478 ( .A0(d_ff_Yn[1]), .A1(n1107), .B0(d_ff2_Y[1]), .B1(n1083), 
        .Y(n461) );
  AO22XLTS U1479 ( .A0(n1125), .A1(d_ff2_Y[1]), .B0(n1106), .B1(
        d_ff3_sh_y_out[1]), .Y(n460) );
  AO22XLTS U1480 ( .A0(d_ff_Yn[2]), .A1(n1107), .B0(d_ff2_Y[2]), .B1(n1139), 
        .Y(n459) );
  AO22XLTS U1481 ( .A0(n1125), .A1(d_ff2_Y[2]), .B0(n1106), .B1(
        d_ff3_sh_y_out[2]), .Y(n458) );
  AO22XLTS U1482 ( .A0(d_ff_Yn[3]), .A1(n1107), .B0(d_ff2_Y[3]), .B1(n1112), 
        .Y(n457) );
  AO22XLTS U1483 ( .A0(d_ff_Yn[4]), .A1(n1107), .B0(d_ff2_Y[4]), .B1(n1112), 
        .Y(n455) );
  AO22XLTS U1484 ( .A0(d_ff_Yn[5]), .A1(n1104), .B0(d_ff2_Y[5]), .B1(n1112), 
        .Y(n453) );
  AO22XLTS U1485 ( .A0(d_ff_Yn[6]), .A1(n1104), .B0(d_ff2_Y[6]), .B1(n1083), 
        .Y(n451) );
  AO22XLTS U1486 ( .A0(n1125), .A1(d_ff2_Y[6]), .B0(n1106), .B1(
        d_ff3_sh_y_out[6]), .Y(n450) );
  AO22XLTS U1487 ( .A0(d_ff_Yn[7]), .A1(n1107), .B0(d_ff2_Y[7]), .B1(n1083), 
        .Y(n449) );
  AO22XLTS U1488 ( .A0(n1138), .A1(d_ff2_Y[7]), .B0(n1106), .B1(
        d_ff3_sh_y_out[7]), .Y(n448) );
  AO22XLTS U1489 ( .A0(d_ff_Yn[8]), .A1(n1107), .B0(d_ff2_Y[8]), .B1(n1083), 
        .Y(n447) );
  AO22XLTS U1490 ( .A0(n1138), .A1(d_ff2_Y[8]), .B0(n1106), .B1(
        d_ff3_sh_y_out[8]), .Y(n446) );
  AO22XLTS U1491 ( .A0(d_ff_Yn[9]), .A1(n1107), .B0(d_ff2_Y[9]), .B1(n1083), 
        .Y(n445) );
  AO22XLTS U1492 ( .A0(n1125), .A1(d_ff2_Y[9]), .B0(n1106), .B1(
        d_ff3_sh_y_out[9]), .Y(n444) );
  AO22XLTS U1493 ( .A0(d_ff_Yn[10]), .A1(n1107), .B0(d_ff2_Y[10]), .B1(n1083), 
        .Y(n443) );
  AO22XLTS U1494 ( .A0(n1099), .A1(d_ff2_Y[10]), .B0(n1106), .B1(
        d_ff3_sh_y_out[10]), .Y(n442) );
  AO22XLTS U1495 ( .A0(d_ff_Yn[11]), .A1(n1107), .B0(d_ff2_Y[11]), .B1(n1083), 
        .Y(n441) );
  AO22XLTS U1496 ( .A0(n1125), .A1(d_ff2_Y[11]), .B0(n1106), .B1(
        d_ff3_sh_y_out[11]), .Y(n440) );
  AO22XLTS U1497 ( .A0(d_ff_Yn[12]), .A1(n1107), .B0(d_ff2_Y[12]), .B1(n1083), 
        .Y(n439) );
  AO22XLTS U1498 ( .A0(n1099), .A1(d_ff2_Y[12]), .B0(n1106), .B1(
        d_ff3_sh_y_out[12]), .Y(n438) );
  AO22XLTS U1499 ( .A0(d_ff_Yn[13]), .A1(n1107), .B0(d_ff2_Y[13]), .B1(n1083), 
        .Y(n437) );
  AO22XLTS U1500 ( .A0(n1128), .A1(d_ff2_Y[13]), .B0(n1141), .B1(
        d_ff3_sh_y_out[13]), .Y(n436) );
  AO22XLTS U1501 ( .A0(d_ff_Yn[14]), .A1(n1107), .B0(d_ff2_Y[14]), .B1(n1083), 
        .Y(n435) );
  AO22XLTS U1502 ( .A0(n1125), .A1(d_ff2_Y[14]), .B0(n1141), .B1(
        d_ff3_sh_y_out[14]), .Y(n434) );
  AO22XLTS U1503 ( .A0(d_ff_Yn[15]), .A1(n1107), .B0(d_ff2_Y[15]), .B1(n1083), 
        .Y(n433) );
  AO22XLTS U1504 ( .A0(n1099), .A1(d_ff2_Y[15]), .B0(n1141), .B1(
        d_ff3_sh_y_out[15]), .Y(n432) );
  AO22XLTS U1505 ( .A0(d_ff_Yn[16]), .A1(n1107), .B0(d_ff2_Y[16]), .B1(n1083), 
        .Y(n431) );
  AO22XLTS U1506 ( .A0(n1099), .A1(d_ff2_Y[16]), .B0(n1141), .B1(
        d_ff3_sh_y_out[16]), .Y(n430) );
  AO22XLTS U1507 ( .A0(d_ff_Yn[17]), .A1(n1107), .B0(d_ff2_Y[17]), .B1(n1083), 
        .Y(n429) );
  AO22XLTS U1508 ( .A0(n1099), .A1(d_ff2_Y[17]), .B0(n1141), .B1(
        d_ff3_sh_y_out[17]), .Y(n428) );
  AO22XLTS U1509 ( .A0(d_ff_Yn[18]), .A1(n1140), .B0(d_ff2_Y[18]), .B1(n1083), 
        .Y(n427) );
  AO22XLTS U1510 ( .A0(n1099), .A1(d_ff2_Y[18]), .B0(n1141), .B1(
        d_ff3_sh_y_out[18]), .Y(n426) );
  AO22XLTS U1511 ( .A0(d_ff_Yn[19]), .A1(n1140), .B0(d_ff2_Y[19]), .B1(n1083), 
        .Y(n425) );
  AO22XLTS U1512 ( .A0(n1099), .A1(d_ff2_Y[19]), .B0(n1141), .B1(
        d_ff3_sh_y_out[19]), .Y(n424) );
  AO22XLTS U1513 ( .A0(d_ff_Yn[20]), .A1(n1140), .B0(d_ff2_Y[20]), .B1(n1139), 
        .Y(n423) );
  AO22XLTS U1514 ( .A0(n1142), .A1(d_ff2_Y[20]), .B0(n1141), .B1(
        d_ff3_sh_y_out[20]), .Y(n422) );
  AO22XLTS U1515 ( .A0(d_ff_Yn[21]), .A1(n1140), .B0(d_ff2_Y[21]), .B1(n1139), 
        .Y(n421) );
  AO22XLTS U1516 ( .A0(n1142), .A1(d_ff2_Y[21]), .B0(n1141), .B1(
        d_ff3_sh_y_out[21]), .Y(n420) );
  AO22XLTS U1517 ( .A0(d_ff_Yn[22]), .A1(n1140), .B0(d_ff2_Y[22]), .B1(n1139), 
        .Y(n419) );
  AO22XLTS U1518 ( .A0(n1142), .A1(d_ff2_Y[22]), .B0(n1141), .B1(
        d_ff3_sh_y_out[22]), .Y(n418) );
  OAI22X1TS U1519 ( .A0(n1110), .A1(n801), .B0(n1155), .B1(n854), .Y(n417) );
  OAI22X1TS U1520 ( .A0(n1110), .A1(n799), .B0(n1156), .B1(n854), .Y(n416) );
  AO22XLTS U1521 ( .A0(d_ff_Yn[25]), .A1(n1140), .B0(d_ff2_Y[25]), .B1(n1139), 
        .Y(n415) );
  AO22XLTS U1522 ( .A0(d_ff_Yn[26]), .A1(n1140), .B0(d_ff2_Y[26]), .B1(n1139), 
        .Y(n414) );
  OAI22X1TS U1523 ( .A0(n1110), .A1(n1147), .B0(n1157), .B1(n854), .Y(n413) );
  OAI22X1TS U1524 ( .A0(n1110), .A1(n1096), .B0(n1158), .B1(n854), .Y(n412) );
  OAI22X1TS U1525 ( .A0(n1110), .A1(n1148), .B0(n1159), .B1(n854), .Y(n411) );
  OAI22X1TS U1526 ( .A0(n1110), .A1(n1149), .B0(n1160), .B1(n854), .Y(n410) );
  AOI22X1TS U1527 ( .A0(cont_iter_out[1]), .A1(n799), .B0(d_ff2_Y[24]), .B1(
        n1117), .Y(n1084) );
  XNOR2X1TS U1528 ( .A(n1087), .B(n1084), .Y(n1085) );
  AO22XLTS U1529 ( .A0(n1142), .A1(n1085), .B0(n1105), .B1(d_ff3_sh_y_out[24]), 
        .Y(n408) );
  NAND2X1TS U1530 ( .A(d_ff2_Y[24]), .B(n1117), .Y(n1086) );
  AOI22X1TS U1531 ( .A0(cont_iter_out[1]), .A1(n799), .B0(n1087), .B1(n1086), 
        .Y(n1090) );
  AO22XLTS U1532 ( .A0(n1142), .A1(n1089), .B0(n1105), .B1(d_ff3_sh_y_out[25]), 
        .Y(n407) );
  AO22XLTS U1533 ( .A0(n1142), .A1(n1092), .B0(n1105), .B1(d_ff3_sh_y_out[26]), 
        .Y(n406) );
  NOR2X1TS U1534 ( .A(d_ff2_Y[27]), .B(n1095), .Y(n1097) );
  AOI21X1TS U1535 ( .A0(n1095), .A1(d_ff2_Y[27]), .B0(n1097), .Y(n1094) );
  AOI2BB2XLTS U1536 ( .B0(n1142), .B1(n1094), .A0N(d_ff3_sh_y_out[27]), .A1N(
        n1128), .Y(n405) );
  OR3X1TS U1537 ( .A(n1095), .B(d_ff2_Y[28]), .C(d_ff2_Y[27]), .Y(n1100) );
  OAI21XLTS U1538 ( .A0(n1097), .A1(n1096), .B0(n1100), .Y(n1098) );
  AO22XLTS U1539 ( .A0(n1142), .A1(n1098), .B0(n1105), .B1(d_ff3_sh_y_out[28]), 
        .Y(n404) );
  NOR2X1TS U1540 ( .A(d_ff2_Y[29]), .B(n1100), .Y(n1102) );
  AOI21X1TS U1541 ( .A0(d_ff2_Y[29]), .A1(n1100), .B0(n1102), .Y(n1101) );
  AOI2BB2XLTS U1542 ( .B0(n1128), .B1(n1101), .A0N(d_ff3_sh_y_out[29]), .A1N(
        n1128), .Y(n403) );
  XOR2XLTS U1543 ( .A(d_ff2_Y[30]), .B(n1102), .Y(n1103) );
  AO22XLTS U1544 ( .A0(n1125), .A1(n1103), .B0(n1105), .B1(d_ff3_sh_y_out[30]), 
        .Y(n402) );
  AO22XLTS U1545 ( .A0(d_ff_Yn[31]), .A1(n1104), .B0(d_ff2_Y[31]), .B1(n1139), 
        .Y(n401) );
  AO22XLTS U1546 ( .A0(n1142), .A1(d_ff2_Y[31]), .B0(n1105), .B1(
        d_ff3_sh_y_out[31]), .Y(n400) );
  AO22XLTS U1547 ( .A0(d_ff_Xn[0]), .A1(n1104), .B0(d_ff2_X[0]), .B1(n1139), 
        .Y(n399) );
  AO22XLTS U1548 ( .A0(n1142), .A1(d_ff2_X[0]), .B0(n1105), .B1(
        d_ff3_sh_x_out[0]), .Y(n398) );
  AO22XLTS U1549 ( .A0(n1142), .A1(d_ff2_X[1]), .B0(n1105), .B1(
        d_ff3_sh_x_out[1]), .Y(n396) );
  AO22XLTS U1550 ( .A0(n1099), .A1(d_ff2_X[2]), .B0(n1105), .B1(
        d_ff3_sh_x_out[2]), .Y(n394) );
  OA22X1TS U1551 ( .A0(n825), .A1(d_ff2_X[3]), .B0(d_ff_Xn[3]), .B1(n854), .Y(
        n393) );
  AO22XLTS U1552 ( .A0(n1099), .A1(d_ff2_X[3]), .B0(n1105), .B1(
        d_ff3_sh_x_out[3]), .Y(n392) );
  AO22XLTS U1553 ( .A0(n811), .A1(n1104), .B0(d_ff2_X[4]), .B1(n1139), .Y(n391) );
  AO22XLTS U1554 ( .A0(n1099), .A1(d_ff2_X[4]), .B0(n1105), .B1(
        d_ff3_sh_x_out[4]), .Y(n390) );
  OA22X1TS U1555 ( .A0(n1110), .A1(d_ff2_X[5]), .B0(d_ff_Xn[5]), .B1(n854), 
        .Y(n389) );
  AO22XLTS U1556 ( .A0(n1099), .A1(d_ff2_X[5]), .B0(n1141), .B1(
        d_ff3_sh_x_out[5]), .Y(n388) );
  AO22XLTS U1557 ( .A0(n1099), .A1(d_ff2_X[6]), .B0(n1106), .B1(
        d_ff3_sh_x_out[6]), .Y(n386) );
  OA22X1TS U1558 ( .A0(n1108), .A1(d_ff2_X[7]), .B0(d_ff_Xn[7]), .B1(n1111), 
        .Y(n385) );
  AO22XLTS U1559 ( .A0(n1099), .A1(d_ff2_X[7]), .B0(n1141), .B1(
        d_ff3_sh_x_out[7]), .Y(n384) );
  AO22XLTS U1560 ( .A0(d_ff_Xn[8]), .A1(n1104), .B0(d_ff2_X[8]), .B1(n1139), 
        .Y(n383) );
  AO22XLTS U1561 ( .A0(n1099), .A1(d_ff2_X[8]), .B0(n1105), .B1(
        d_ff3_sh_x_out[8]), .Y(n382) );
  AO22XLTS U1562 ( .A0(d_ff_Xn[9]), .A1(n1104), .B0(d_ff2_X[9]), .B1(n1139), 
        .Y(n381) );
  AO22XLTS U1563 ( .A0(n1099), .A1(d_ff2_X[9]), .B0(n1105), .B1(
        d_ff3_sh_x_out[9]), .Y(n380) );
  OA22X1TS U1564 ( .A0(n825), .A1(d_ff2_X[10]), .B0(d_ff_Xn[10]), .B1(n1111), 
        .Y(n379) );
  AO22XLTS U1565 ( .A0(n1138), .A1(d_ff2_X[10]), .B0(n1105), .B1(
        d_ff3_sh_x_out[10]), .Y(n378) );
  AO22XLTS U1566 ( .A0(d_ff_Xn[11]), .A1(n1107), .B0(d_ff2_X[11]), .B1(n1139), 
        .Y(n377) );
  AO22XLTS U1567 ( .A0(n1138), .A1(d_ff2_X[11]), .B0(n1105), .B1(
        d_ff3_sh_x_out[11]), .Y(n376) );
  OA22X1TS U1568 ( .A0(n1108), .A1(d_ff2_X[12]), .B0(d_ff_Xn[12]), .B1(n1111), 
        .Y(n375) );
  AO22XLTS U1569 ( .A0(n1099), .A1(d_ff2_X[12]), .B0(n1106), .B1(
        d_ff3_sh_x_out[12]), .Y(n374) );
  OA22X1TS U1570 ( .A0(n1108), .A1(d_ff2_X[13]), .B0(d_ff_Xn[13]), .B1(n1111), 
        .Y(n373) );
  AO22XLTS U1571 ( .A0(n1138), .A1(d_ff2_X[13]), .B0(n1105), .B1(
        d_ff3_sh_x_out[13]), .Y(n372) );
  OA22X1TS U1572 ( .A0(n1108), .A1(d_ff2_X[14]), .B0(d_ff_Xn[14]), .B1(n1111), 
        .Y(n371) );
  AO22XLTS U1573 ( .A0(n1138), .A1(d_ff2_X[14]), .B0(n1134), .B1(
        d_ff3_sh_x_out[14]), .Y(n370) );
  AO22XLTS U1574 ( .A0(d_ff_Xn[15]), .A1(n1107), .B0(d_ff2_X[15]), .B1(n1139), 
        .Y(n369) );
  AO22XLTS U1575 ( .A0(n1138), .A1(d_ff2_X[15]), .B0(n823), .B1(
        d_ff3_sh_x_out[15]), .Y(n368) );
  OA22X1TS U1576 ( .A0(n1108), .A1(d_ff2_X[16]), .B0(d_ff_Xn[16]), .B1(n1111), 
        .Y(n367) );
  AO22XLTS U1577 ( .A0(n1138), .A1(d_ff2_X[16]), .B0(n1134), .B1(
        d_ff3_sh_x_out[16]), .Y(n366) );
  OA22X1TS U1578 ( .A0(n1108), .A1(d_ff2_X[17]), .B0(d_ff_Xn[17]), .B1(n1111), 
        .Y(n365) );
  AO22XLTS U1579 ( .A0(n1138), .A1(d_ff2_X[17]), .B0(n1134), .B1(
        d_ff3_sh_x_out[17]), .Y(n364) );
  AO22XLTS U1580 ( .A0(d_ff_Xn[18]), .A1(n1140), .B0(d_ff2_X[18]), .B1(n1139), 
        .Y(n363) );
  AO22XLTS U1581 ( .A0(n1138), .A1(d_ff2_X[18]), .B0(n1131), .B1(
        d_ff3_sh_x_out[18]), .Y(n362) );
  OA22X1TS U1582 ( .A0(n1108), .A1(d_ff2_X[19]), .B0(d_ff_Xn[19]), .B1(n1111), 
        .Y(n361) );
  AO22XLTS U1583 ( .A0(n1138), .A1(d_ff2_X[19]), .B0(n1134), .B1(
        d_ff3_sh_x_out[19]), .Y(n360) );
  AO22XLTS U1584 ( .A0(n1138), .A1(d_ff2_X[20]), .B0(n823), .B1(
        d_ff3_sh_x_out[20]), .Y(n358) );
  AO22XLTS U1585 ( .A0(d_ff_Xn[21]), .A1(n1140), .B0(d_ff2_X[21]), .B1(n1112), 
        .Y(n357) );
  AO22XLTS U1586 ( .A0(n1125), .A1(d_ff2_X[21]), .B0(n1134), .B1(
        d_ff3_sh_x_out[21]), .Y(n356) );
  AO22XLTS U1587 ( .A0(d_ff_Xn[22]), .A1(n1140), .B0(d_ff2_X[22]), .B1(n1112), 
        .Y(n355) );
  AO22XLTS U1588 ( .A0(n1125), .A1(d_ff2_X[22]), .B0(n1134), .B1(
        d_ff3_sh_x_out[22]), .Y(n354) );
  AO22XLTS U1589 ( .A0(d_ff2_X[23]), .A1(n1112), .B0(d_ff_Xn[23]), .B1(n1107), 
        .Y(n353) );
  OA22X1TS U1590 ( .A0(d_ff2_X[24]), .A1(n1108), .B0(d_ff_Xn[24]), .B1(n854), 
        .Y(n352) );
  AOI2BB2XLTS U1591 ( .B0(n810), .B1(n1109), .A0N(d_ff_Xn[25]), .A1N(n854), 
        .Y(n351) );
  OA22X1TS U1592 ( .A0(n1110), .A1(d_ff2_X[27]), .B0(d_ff_Xn[27]), .B1(n854), 
        .Y(n349) );
  OA22X1TS U1593 ( .A0(n1110), .A1(n813), .B0(d_ff_Xn[28]), .B1(n1111), .Y(
        n348) );
  OA22X1TS U1594 ( .A0(n825), .A1(d_ff2_X[29]), .B0(d_ff_Xn[29]), .B1(n1111), 
        .Y(n347) );
  AO22XLTS U1595 ( .A0(d_ff_Xn[30]), .A1(n1140), .B0(d_ff2_X[30]), .B1(n1112), 
        .Y(n346) );
  NAND2X1TS U1596 ( .A(d_ff2_X[24]), .B(n1117), .Y(n1115) );
  OAI21XLTS U1597 ( .A0(d_ff2_X[24]), .A1(n1117), .B0(n1115), .Y(n1113) );
  XOR2XLTS U1598 ( .A(n1116), .B(n1113), .Y(n1114) );
  AO22XLTS U1599 ( .A0(n1138), .A1(n1114), .B0(n1134), .B1(d_ff3_sh_x_out[24]), 
        .Y(n344) );
  XOR2X1TS U1600 ( .A(n1122), .B(n810), .Y(n1118) );
  MXI2X1TS U1601 ( .A(n1120), .B(n1119), .S0(n1118), .Y(n1121) );
  AO21XLTS U1602 ( .A0(d_ff3_sh_x_out[25]), .A1(n1141), .B0(n1121), .Y(n343)
         );
  AOI222X1TS U1603 ( .A0(n1123), .A1(n1122), .B0(n1123), .B1(n810), .C0(n1122), 
        .C1(n810), .Y(n1126) );
  AO22XLTS U1604 ( .A0(n1125), .A1(n1124), .B0(n1134), .B1(d_ff3_sh_x_out[26]), 
        .Y(n342) );
  NOR2XLTS U1605 ( .A(d_ff2_X[27]), .B(n1130), .Y(n1127) );
  AOI21X1TS U1606 ( .A0(n1130), .A1(d_ff2_X[27]), .B0(n1127), .Y(n1129) );
  AOI2BB2XLTS U1607 ( .B0(n1142), .B1(n1129), .A0N(d_ff3_sh_x_out[27]), .A1N(
        n1128), .Y(n341) );
  OR3X1TS U1608 ( .A(n813), .B(d_ff2_X[27]), .C(n1130), .Y(n1133) );
  OAI21XLTS U1609 ( .A0(d_ff2_X[27]), .A1(n1130), .B0(n813), .Y(n1132) );
  AOI32X1TS U1610 ( .A0(n1133), .A1(n1099), .A2(n1132), .B0(n815), .B1(n1131), 
        .Y(n340) );
  NOR2X1TS U1611 ( .A(d_ff2_X[29]), .B(n1133), .Y(n1136) );
  AOI21X1TS U1612 ( .A0(d_ff2_X[29]), .A1(n1133), .B0(n1136), .Y(n1135) );
  AOI22X1TS U1613 ( .A0(n1099), .A1(n1135), .B0(n802), .B1(n1134), .Y(n339) );
  XOR2XLTS U1614 ( .A(d_ff2_X[30]), .B(n1136), .Y(n1137) );
  AO22XLTS U1615 ( .A0(n1138), .A1(n1137), .B0(n823), .B1(d_ff3_sh_x_out[30]), 
        .Y(n338) );
  AO22XLTS U1616 ( .A0(d_ff_Xn[31]), .A1(n1140), .B0(d_ff2_X[31]), .B1(n1139), 
        .Y(n337) );
  AO22XLTS U1617 ( .A0(n1099), .A1(d_ff2_X[31]), .B0(n1141), .B1(
        d_ff3_sh_x_out[31]), .Y(n336) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_syn.sdf"); 
 endmodule

