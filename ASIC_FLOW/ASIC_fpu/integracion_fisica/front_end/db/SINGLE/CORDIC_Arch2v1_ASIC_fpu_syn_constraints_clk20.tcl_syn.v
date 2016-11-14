/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 08:26:55 2016
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
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942,
         n943, n944, n945, n946, n947, n948, n949, n950, n951, n952, n953,
         n954, n955, n956, n957, n958, n959, n960, n961, n962, n963, n964,
         n965, n966, n967, n968, n969, n970, n971, n972, n973, n974, n975,
         n976, n977, n978, n979, n980, n981, n982, n983, n984, n985, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067,
         n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077,
         n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087,
         n1088, n1089, n1090, n1091, n1092, n1094, n1095, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108,
         n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188,
         n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198,
         n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208,
         n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218,
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226;
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

  DFFRXLTS cont_iter_count_reg_2_ ( .D(n726), .CK(clk), .RN(n1221), .Q(
        cont_iter_out[2]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(n720), .CK(clk), .RN(n1213), .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(n719), .CK(clk), .RN(n1213), .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(n718), .CK(clk), .RN(n1213), .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(n717), .CK(clk), .RN(n1213), .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(n716), .CK(clk), .RN(n1213), .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(n715), .CK(clk), .RN(n1213), .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(n714), .CK(clk), .RN(n1213), .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(n713), .CK(clk), .RN(n1213), .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(n712), .CK(clk), .RN(n1214), .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(n711), .CK(clk), .RN(n1214), .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(n710), .CK(clk), .RN(n1214), .Q(d_ff1_Z[10])
         );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(n709), .CK(clk), .RN(n1214), .Q(d_ff1_Z[11])
         );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(n708), .CK(clk), .RN(n1214), .Q(d_ff1_Z[12])
         );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(n707), .CK(clk), .RN(n1214), .Q(d_ff1_Z[13])
         );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(n706), .CK(clk), .RN(n1214), .Q(d_ff1_Z[14])
         );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(n705), .CK(clk), .RN(n1214), .Q(d_ff1_Z[15])
         );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(n704), .CK(clk), .RN(n1214), .Q(d_ff1_Z[16])
         );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(n703), .CK(clk), .RN(n1214), .Q(d_ff1_Z[17])
         );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(n702), .CK(clk), .RN(n1214), .Q(d_ff1_Z[18])
         );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(n701), .CK(clk), .RN(n1214), .Q(d_ff1_Z[19])
         );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(n700), .CK(clk), .RN(n1224), .Q(d_ff1_Z[20])
         );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(n699), .CK(clk), .RN(n1223), .Q(d_ff1_Z[21])
         );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(n698), .CK(clk), .RN(n1224), .Q(d_ff1_Z[22])
         );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(n697), .CK(clk), .RN(n1223), .Q(d_ff1_Z[23])
         );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(n696), .CK(clk), .RN(n1224), .Q(d_ff1_Z[24])
         );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(n695), .CK(clk), .RN(n1213), .Q(d_ff1_Z[25])
         );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(n694), .CK(clk), .RN(n1204), .Q(d_ff1_Z[26])
         );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(n693), .CK(clk), .RN(n1216), .Q(d_ff1_Z[27])
         );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(n692), .CK(clk), .RN(n1218), .Q(d_ff1_Z[28])
         );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(n691), .CK(clk), .RN(n1219), .Q(d_ff1_Z[29])
         );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(n690), .CK(clk), .RN(n1220), .Q(d_ff1_Z[30])
         );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(n689), .CK(clk), .RN(n1205), .Q(d_ff1_Z[31])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(n684), .CK(clk), .RN(n1219), .Q(d_ff_Zn[0])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(n683), .CK(clk), .RN(n1215), .Q(d_ff_Zn[1])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(n682), .CK(clk), .RN(n1215), .Q(d_ff_Zn[2])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(n681), .CK(clk), .RN(n1215), .Q(d_ff_Zn[3])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(n680), .CK(clk), .RN(n1215), .Q(d_ff_Zn[4])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(n679), .CK(clk), .RN(n1215), .Q(d_ff_Zn[5])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(n678), .CK(clk), .RN(n1215), .Q(d_ff_Zn[6])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(n677), .CK(clk), .RN(n1215), .Q(d_ff_Zn[7])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(n676), .CK(clk), .RN(n1215), .Q(d_ff_Zn[8])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(n675), .CK(clk), .RN(n1216), .Q(d_ff_Zn[9])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(n674), .CK(clk), .RN(n1216), .Q(d_ff_Zn[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(n673), .CK(clk), .RN(n1216), .Q(d_ff_Zn[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(n672), .CK(clk), .RN(n1216), .Q(d_ff_Zn[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(n671), .CK(clk), .RN(n1216), .Q(d_ff_Zn[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(n670), .CK(clk), .RN(n1216), .Q(d_ff_Zn[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(n669), .CK(clk), .RN(n1216), .Q(d_ff_Zn[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(n668), .CK(clk), .RN(n1216), .Q(d_ff_Zn[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(n667), .CK(clk), .RN(n1216), .Q(d_ff_Zn[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(n666), .CK(clk), .RN(n1216), .Q(d_ff_Zn[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(n665), .CK(clk), .RN(n1216), .Q(d_ff_Zn[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(n664), .CK(clk), .RN(n1216), .Q(d_ff_Zn[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(n663), .CK(clk), .RN(n1217), .Q(d_ff_Zn[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(n662), .CK(clk), .RN(n1217), .Q(d_ff_Zn[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(n661), .CK(clk), .RN(n1217), .Q(d_ff_Zn[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(n660), .CK(clk), .RN(n1217), .Q(d_ff_Zn[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(n659), .CK(clk), .RN(n1217), .Q(d_ff_Zn[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(n658), .CK(clk), .RN(n1217), .Q(d_ff_Zn[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(n657), .CK(clk), .RN(n1217), .Q(d_ff_Zn[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(n656), .CK(clk), .RN(n1217), .Q(d_ff_Zn[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(n655), .CK(clk), .RN(n1217), .Q(d_ff_Zn[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(n654), .CK(clk), .RN(n1217), .Q(d_ff_Zn[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(n653), .CK(clk), .RN(n1217), .Q(d_ff_Zn[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(n652), .CK(clk), .RN(n1217), .Q(d_ff_Yn[0]), 
        .QN(n1171) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(n651), .CK(clk), .RN(n1218), .Q(d_ff_Yn[1]), 
        .QN(n1172) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(n650), .CK(clk), .RN(n1218), .Q(d_ff_Yn[2]), 
        .QN(n1173) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(n649), .CK(clk), .RN(n1218), .Q(d_ff_Yn[3]), 
        .QN(n1174) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(n648), .CK(clk), .RN(n1218), .Q(d_ff_Yn[4]), 
        .QN(n1175) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(n647), .CK(clk), .RN(n1218), .Q(d_ff_Yn[5]), 
        .QN(n1176) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(n646), .CK(clk), .RN(n1218), .Q(d_ff_Yn[6]), 
        .QN(n1177) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(n645), .CK(clk), .RN(n1218), .Q(d_ff_Yn[7]), 
        .QN(n1178) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(n644), .CK(clk), .RN(n1218), .Q(d_ff_Yn[8]), 
        .QN(n1179) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(n643), .CK(clk), .RN(n1218), .Q(d_ff_Yn[9]), 
        .QN(n1180) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(n642), .CK(clk), .RN(n1218), .Q(d_ff_Yn[10]), .QN(n1181) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(n641), .CK(clk), .RN(n1218), .Q(d_ff_Yn[11]), .QN(n1182) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(n640), .CK(clk), .RN(n1218), .Q(d_ff_Yn[12]), .QN(n1183) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(n639), .CK(clk), .RN(n1219), .Q(d_ff_Yn[13]), .QN(n1184) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(n638), .CK(clk), .RN(n1219), .Q(d_ff_Yn[14]), .QN(n1185) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(n637), .CK(clk), .RN(n1219), .Q(d_ff_Yn[15]), .QN(n1186) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(n636), .CK(clk), .RN(n1219), .Q(d_ff_Yn[16]), .QN(n1187) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(n635), .CK(clk), .RN(n1219), .Q(d_ff_Yn[17]), .QN(n1188) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(n634), .CK(clk), .RN(n1219), .Q(d_ff_Yn[18]), .QN(n1189) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(n633), .CK(clk), .RN(n1219), .Q(d_ff_Yn[19]), .QN(n1190) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(n632), .CK(clk), .RN(n1219), .Q(d_ff_Yn[20]), .QN(n1191) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(n621), .CK(clk), .RN(n1224), .Q(d_ff_Yn[31]), .QN(n1196) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(n588), .CK(clk), .RN(n1224), .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(n586), .CK(clk), .RN(n1224), .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(n584), .CK(clk), .RN(n1224), .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(n582), .CK(clk), .RN(n1224), .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(n580), .CK(clk), .RN(n1223), .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(n578), .CK(clk), .RN(n1223), .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(n576), .CK(clk), .RN(n1223), .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(n574), .CK(clk), .RN(n1223), .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(n572), .CK(clk), .RN(n1213), .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(n570), .CK(clk), .RN(n1221), .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(n568), .CK(clk), .RN(n1217), .Q(
        sign_inv_out[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(n566), .CK(clk), .RN(n1216), .Q(
        sign_inv_out[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(n564), .CK(clk), .RN(n1222), .Q(
        sign_inv_out[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(n562), .CK(clk), .RN(n1222), .Q(
        sign_inv_out[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(n560), .CK(clk), .RN(n1222), .Q(
        sign_inv_out[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(n558), .CK(clk), .RN(n1221), .Q(
        sign_inv_out[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(n556), .CK(clk), .RN(n1221), .Q(
        sign_inv_out[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(n554), .CK(clk), .RN(n1221), .Q(
        sign_inv_out[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(n552), .CK(clk), .RN(n1221), .Q(
        sign_inv_out[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(n550), .CK(clk), .RN(n1220), .Q(
        sign_inv_out[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(n548), .CK(clk), .RN(n1218), .Q(
        sign_inv_out[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(n546), .CK(clk), .RN(n1215), .Q(
        sign_inv_out[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(n544), .CK(clk), .RN(n1214), .Q(
        sign_inv_out[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(n542), .CK(clk), .RN(n1220), .Q(
        sign_inv_out[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(n540), .CK(clk), .RN(n1220), .Q(
        sign_inv_out[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(n538), .CK(clk), .RN(n1220), .Q(
        sign_inv_out[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(n536), .CK(clk), .RN(n1220), .Q(
        sign_inv_out[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(n534), .CK(clk), .RN(n1219), .Q(
        sign_inv_out[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(n532), .CK(clk), .RN(n1222), .Q(
        sign_inv_out[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(n530), .CK(clk), .RN(n1199), .Q(
        sign_inv_out[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(n528), .CK(clk), .RN(n1199), .Q(
        sign_inv_out[30]) );
  DFFRXLTS d_ff5_Q_reg_31_ ( .D(n526), .CK(clk), .RN(n1199), .Q(
        data_output2_31_) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(n524), .CK(clk), .RN(n1199), .Q(
        d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n523), .CK(clk), .RN(n1199), .Q(
        d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n522), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n521), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(n520), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(n519), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n517), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n516), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n515), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n514), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(n513), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n512), .CK(clk), .RN(n1200), .QN(n807) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n511), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(n510), .CK(clk), .RN(n1207), .Q(
        d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n509), .CK(clk), .RN(n1206), .Q(
        d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(n508), .CK(clk), .RN(n1199), .Q(
        d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_17_ ( .D(n507), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[17]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(n506), .CK(clk), .RN(n1208), .Q(
        d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n505), .CK(clk), .RN(n1207), .Q(
        d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(n504), .CK(clk), .RN(n1206), .Q(
        d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n503), .CK(clk), .RN(n1199), .Q(
        d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(n502), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n501), .CK(clk), .RN(n1208), .Q(
        d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n500), .CK(clk), .RN(n1207), .Q(
        d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(n499), .CK(clk), .RN(n1206), .Q(
        d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n498), .CK(clk), .RN(n1201), .Q(
        d_ff3_LUT_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(n409), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(n408), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(n407), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(n406), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(n405), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(n404), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(n403), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(n402), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_y_out[30]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(n345), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(n344), .CK(clk), .RN(n1201), .Q(
        d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(n343), .CK(clk), .RN(n1202), .Q(
        d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(n342), .CK(clk), .RN(n1202), .Q(
        d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(n341), .CK(clk), .RN(n1202), .Q(
        d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(n340), .CK(clk), .RN(n1202), .QN(n808)
         );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(n339), .CK(clk), .RN(n1202), .QN(n802)
         );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(n338), .CK(clk), .RN(n1202), .Q(
        d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(n488), .CK(clk), .RN(n1210), .Q(
        d_ff2_Z[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(n487), .CK(clk), .RN(n1209), .Q(
        d_ff2_Z[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(n485), .CK(clk), .RN(n1204), .Q(
        d_ff2_Z[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(n481), .CK(clk), .RN(n1211), .Q(
        d_ff2_Z[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(n478), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(n475), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(n474), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[22]) );
  DFFRX1TS reg_sign_Q_reg_0_ ( .D(n464), .CK(clk), .RN(n1204), .Q(
        d_ff3_sign_out) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(n462), .CK(clk), .RN(n1204), .Q(
        d_ff3_sh_y_out[0]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(n460), .CK(clk), .RN(n1204), .Q(
        d_ff3_sh_y_out[1]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(n458), .CK(clk), .RN(n1204), .Q(
        d_ff3_sh_y_out[2]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(n456), .CK(clk), .RN(n1204), .Q(
        d_ff3_sh_y_out[3]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(n454), .CK(clk), .RN(n1205), .Q(
        d_ff3_sh_y_out[4]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(n452), .CK(clk), .RN(n1205), .Q(
        d_ff3_sh_y_out[5]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(n450), .CK(clk), .RN(n1205), .Q(
        d_ff3_sh_y_out[6]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(n448), .CK(clk), .RN(n1205), .Q(
        d_ff3_sh_y_out[7]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(n446), .CK(clk), .RN(n1205), .Q(
        d_ff3_sh_y_out[8]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(n444), .CK(clk), .RN(n1205), .Q(
        d_ff3_sh_y_out[9]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(n442), .CK(clk), .RN(n1206), .Q(
        d_ff3_sh_y_out[10]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(n440), .CK(clk), .RN(n1206), .Q(
        d_ff3_sh_y_out[11]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(n438), .CK(clk), .RN(n1206), .Q(
        d_ff3_sh_y_out[12]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(n436), .CK(clk), .RN(n1206), .Q(
        d_ff3_sh_y_out[13]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(n434), .CK(clk), .RN(n1206), .Q(
        d_ff3_sh_y_out[14]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(n432), .CK(clk), .RN(n1206), .Q(
        d_ff3_sh_y_out[15]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(n430), .CK(clk), .RN(n1207), .Q(
        d_ff3_sh_y_out[16]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(n428), .CK(clk), .RN(n1207), .Q(
        d_ff3_sh_y_out[17]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(n426), .CK(clk), .RN(n1207), .Q(
        d_ff3_sh_y_out[18]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(n424), .CK(clk), .RN(n1207), .Q(
        d_ff3_sh_y_out[19]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(n422), .CK(clk), .RN(n1207), .Q(
        d_ff3_sh_y_out[20]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(n420), .CK(clk), .RN(n1207), .Q(
        d_ff3_sh_y_out[21]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(n418), .CK(clk), .RN(n1208), .Q(
        d_ff3_sh_y_out[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(n417), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(n412), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(n410), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[30]), .QN(n1159) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(n400), .CK(clk), .RN(n1208), .Q(
        d_ff3_sh_y_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(n398), .CK(clk), .RN(n1209), .Q(
        d_ff3_sh_x_out[0]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(n396), .CK(clk), .RN(n1209), .Q(
        d_ff3_sh_x_out[1]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(n394), .CK(clk), .RN(n1209), .Q(
        d_ff3_sh_x_out[2]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(n392), .CK(clk), .RN(n1209), .Q(
        d_ff3_sh_x_out[3]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(n390), .CK(clk), .RN(n1209), .Q(
        d_ff3_sh_x_out[4]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(n388), .CK(clk), .RN(n1209), .Q(
        d_ff3_sh_x_out[5]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(n386), .CK(clk), .RN(n1210), .Q(
        d_ff3_sh_x_out[6]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(n384), .CK(clk), .RN(n1210), .Q(
        d_ff3_sh_x_out[7]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(n382), .CK(clk), .RN(n1210), .Q(
        d_ff3_sh_x_out[8]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(n380), .CK(clk), .RN(n1210), .Q(
        d_ff3_sh_x_out[9]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(n378), .CK(clk), .RN(n1210), .Q(
        d_ff3_sh_x_out[10]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(n376), .CK(clk), .RN(n1210), .Q(
        d_ff3_sh_x_out[11]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(n374), .CK(clk), .RN(n1211), .Q(
        d_ff3_sh_x_out[12]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(n372), .CK(clk), .RN(n1211), .Q(
        d_ff3_sh_x_out[13]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(n370), .CK(clk), .RN(n1211), .Q(
        d_ff3_sh_x_out[14]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(n368), .CK(clk), .RN(n1211), .Q(
        d_ff3_sh_x_out[15]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(n366), .CK(clk), .RN(n1211), .Q(
        d_ff3_sh_x_out[16]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(n364), .CK(clk), .RN(n1211), .Q(
        d_ff3_sh_x_out[17]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(n362), .CK(clk), .RN(n1212), .Q(
        d_ff3_sh_x_out[18]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(n360), .CK(clk), .RN(n1212), .Q(
        d_ff3_sh_x_out[19]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(n358), .CK(clk), .RN(n1212), .Q(
        d_ff3_sh_x_out[20]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(n356), .CK(clk), .RN(n1212), .Q(
        d_ff3_sh_x_out[21]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(n354), .CK(clk), .RN(n1212), .Q(
        d_ff3_sh_x_out[22]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(n336), .CK(clk), .RN(n1212), .Q(
        d_ff3_sh_x_out[31]) );
  DFFRX1TS d_ff4_Yn_Q_reg_25_ ( .D(n627), .CK(clk), .RN(n1225), .Q(d_ff_Yn[25]), .QN(n1194) );
  DFFRX1TS d_ff4_Yn_Q_reg_22_ ( .D(n630), .CK(clk), .RN(n1225), .Q(d_ff_Yn[22]), .QN(n1193) );
  DFFRX1TS d_ff4_Yn_Q_reg_21_ ( .D(n631), .CK(clk), .RN(n1225), .Q(d_ff_Yn[21]), .QN(n1192) );
  DFFRX1TS d_ff4_Yn_Q_reg_30_ ( .D(n622), .CK(clk), .RN(n1225), .QN(n1170) );
  DFFRX1TS d_ff4_Yn_Q_reg_29_ ( .D(n623), .CK(clk), .RN(n1225), .QN(n1169) );
  DFFRX1TS d_ff4_Yn_Q_reg_28_ ( .D(n624), .CK(clk), .RN(n1225), .QN(n1168) );
  DFFRX1TS d_ff4_Yn_Q_reg_27_ ( .D(n625), .CK(clk), .RN(n1225), .QN(n1167) );
  DFFRX1TS d_ff4_Yn_Q_reg_24_ ( .D(n628), .CK(clk), .RN(n1225), .QN(n1166) );
  DFFRX1TS d_ff4_Yn_Q_reg_23_ ( .D(n629), .CK(clk), .RN(n1225), .QN(n1165) );
  DFFRX1TS cont_var_count_reg_0_ ( .D(n724), .CK(clk), .RN(n1213), .Q(
        cont_var_out[0]), .QN(n1162) );
  DFFRX1TS reg_ch_mux_2_Q_reg_0_ ( .D(n686), .CK(clk), .RN(n1215), .Q(
        sel_mux_2_reg[0]), .QN(n1161) );
  DFFRX2TS cordic_FSM_state_reg_reg_0_ ( .D(n730), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[0]), .QN(n1156) );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n725), .CK(clk), .RN(n1223), .Q(
        cont_iter_out[3]), .QN(n1155) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(n587), .CK(clk), .RN(n1224), .Q(
        data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(n585), .CK(clk), .RN(n1224), .Q(
        data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(n583), .CK(clk), .RN(n1224), .Q(
        data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(n581), .CK(clk), .RN(n1223), .Q(
        data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(n579), .CK(clk), .RN(n1223), .Q(
        data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(n577), .CK(clk), .RN(n1223), .Q(
        data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(n575), .CK(clk), .RN(n1223), .Q(
        data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(n573), .CK(clk), .RN(n1217), .Q(
        data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(n571), .CK(clk), .RN(n1216), .Q(
        data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(n569), .CK(clk), .RN(n1218), .Q(
        data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(n567), .CK(clk), .RN(n1212), .Q(
        data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(n565), .CK(clk), .RN(n1222), .Q(
        data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(n563), .CK(clk), .RN(n1222), .Q(
        data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(n561), .CK(clk), .RN(n1222), .Q(
        data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(n559), .CK(clk), .RN(n1222), .Q(
        data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(n557), .CK(clk), .RN(n1221), .Q(
        data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(n555), .CK(clk), .RN(n1221), .Q(
        data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(n553), .CK(clk), .RN(n1221), .Q(
        data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(n551), .CK(clk), .RN(n1221), .Q(
        data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(n549), .CK(clk), .RN(n1214), .Q(
        data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(n547), .CK(clk), .RN(n1205), .Q(
        data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(n545), .CK(clk), .RN(n1219), .Q(
        data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(n543), .CK(clk), .RN(n1215), .Q(
        data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(n541), .CK(clk), .RN(n1220), .Q(
        data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(n539), .CK(clk), .RN(n1220), .Q(
        data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(n537), .CK(clk), .RN(n1220), .Q(
        data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(n535), .CK(clk), .RN(n1220), .Q(
        data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(n533), .CK(clk), .RN(n1219), .Q(
        data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(n531), .CK(clk), .RN(n1205), .Q(
        data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(n529), .CK(clk), .RN(n1199), .Q(
        data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(n527), .CK(clk), .RN(n1199), .Q(
        data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(n525), .CK(clk), .RN(n1199), .Q(
        data_output[31]) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n685), .CK(clk), .RN(n1215), .Q(
        sel_mux_2_reg[1]) );
  DFFRX2TS cont_iter_count_reg_0_ ( .D(n728), .CK(clk), .RN(n1215), .Q(n1198), 
        .QN(n1226) );
  DFFRX4TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n331), .Q(cordic_FSM_state_reg[1]) );
  DFFRX4TS cordic_FSM_state_reg_reg_3_ ( .D(n732), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[3]), .QN(n1153) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(n347), .CK(clk), .RN(n1222), .Q(
        d_ff2_X[29]) );
  DFFRX1TS reg_LUT_Q_reg_27_ ( .D(n497), .CK(clk), .RN(n1201), .Q(
        d_ff3_LUT_out[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_28_ ( .D(n348), .CK(clk), .RN(n1212), .Q(
        d_ff2_X[28]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(n416), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[24]), .QN(n800) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(n350), .CK(clk), .RN(n1225), .Q(
        d_ff2_X[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_23_ ( .D(n353), .CK(clk), .RN(n1212), .Q(
        d_ff2_X[23]), .QN(n1197) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_30_ ( .D(n346), .CK(clk), .RN(n1221), .Q(
        d_ff2_X[30]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(n413), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[27]), .QN(n1157) );
  DFFRX1TS reg_ch_mux_1_Q_reg_0_ ( .D(n687), .CK(clk), .RN(n1215), .Q(
        sel_mux_1_reg) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(n723), .CK(clk), .RN(n1213), .Q(
        d_ff1_operation_out), .QN(n1154) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(n722), .CK(clk), .RN(n1213), .Q(
        d_ff1_shift_region_flag_out[0]), .QN(n1164) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_19_ ( .D(n425), .CK(clk), .RN(n1207), .Q(
        d_ff2_Y[19]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_18_ ( .D(n427), .CK(clk), .RN(n1207), .Q(
        d_ff2_Y[18]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_17_ ( .D(n429), .CK(clk), .RN(n1207), .Q(
        d_ff2_Y[17]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_16_ ( .D(n431), .CK(clk), .RN(n1207), .Q(
        d_ff2_Y[16]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_15_ ( .D(n433), .CK(clk), .RN(n1206), .Q(
        d_ff2_Y[15]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_14_ ( .D(n435), .CK(clk), .RN(n1206), .Q(
        d_ff2_Y[14]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_13_ ( .D(n437), .CK(clk), .RN(n1206), .Q(
        d_ff2_Y[13]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_12_ ( .D(n439), .CK(clk), .RN(n1206), .Q(
        d_ff2_Y[12]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_11_ ( .D(n441), .CK(clk), .RN(n1206), .Q(
        d_ff2_Y[11]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_10_ ( .D(n443), .CK(clk), .RN(n1206), .Q(
        d_ff2_Y[10]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_9_ ( .D(n445), .CK(clk), .RN(n1205), .Q(
        d_ff2_Y[9]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_8_ ( .D(n447), .CK(clk), .RN(n1205), .Q(
        d_ff2_Y[8]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_7_ ( .D(n449), .CK(clk), .RN(n1205), .Q(
        d_ff2_Y[7]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_6_ ( .D(n451), .CK(clk), .RN(n1205), .Q(
        d_ff2_Y[6]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_5_ ( .D(n453), .CK(clk), .RN(n1205), .Q(
        d_ff2_Y[5]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_4_ ( .D(n455), .CK(clk), .RN(n1204), .Q(
        d_ff2_Y[4]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_3_ ( .D(n457), .CK(clk), .RN(n1204), .Q(
        d_ff2_Y[3]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_2_ ( .D(n459), .CK(clk), .RN(n1204), .Q(
        d_ff2_Y[2]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_1_ ( .D(n461), .CK(clk), .RN(n1204), .Q(
        d_ff2_Y[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_19_ ( .D(n361), .CK(clk), .RN(n1212), .Q(
        d_ff2_X[19]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_17_ ( .D(n365), .CK(clk), .RN(n1211), .Q(
        d_ff2_X[17]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_16_ ( .D(n367), .CK(clk), .RN(n1211), .Q(
        d_ff2_X[16]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_14_ ( .D(n371), .CK(clk), .RN(n1211), .Q(
        d_ff2_X[14]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_13_ ( .D(n373), .CK(clk), .RN(n1211), .Q(
        d_ff2_X[13]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_12_ ( .D(n375), .CK(clk), .RN(n1211), .Q(
        d_ff2_X[12]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_10_ ( .D(n379), .CK(clk), .RN(n1210), .Q(
        d_ff2_X[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_7_ ( .D(n385), .CK(clk), .RN(n1210), .Q(
        d_ff2_X[7]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_6_ ( .D(n387), .CK(clk), .RN(n1210), .Q(
        d_ff2_X[6]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_5_ ( .D(n389), .CK(clk), .RN(n1209), .Q(
        d_ff2_X[5]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_3_ ( .D(n393), .CK(clk), .RN(n1209), .Q(
        d_ff2_X[3]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_2_ ( .D(n395), .CK(clk), .RN(n1209), .Q(
        d_ff2_X[2]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_1_ ( .D(n397), .CK(clk), .RN(n1209), .Q(
        d_ff2_X[1]) );
  DFFRX1TS d_ff4_Xn_Q_reg_27_ ( .D(n593), .CK(clk), .RN(n1220), .Q(d_ff_Xn[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_22_ ( .D(n355), .CK(clk), .RN(n1212), .Q(
        d_ff2_X[22]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_21_ ( .D(n357), .CK(clk), .RN(n1212), .Q(
        d_ff2_X[21]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_24_ ( .D(n352), .CK(clk), .RN(n1212), .Q(
        d_ff2_X[24]) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n729), .CK(clk), .RN(n1199), .Q(
        cont_var_out[1]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_4_ ( .D(n492), .CK(clk), .RN(n1202), .Q(
        d_ff2_Z[4]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(n411), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[29]), .QN(n1158) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(n351), .CK(clk), .RN(n1201), .Q(
        d_ff2_X[25]), .QN(n803) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_27_ ( .D(n349), .CK(clk), .RN(n1200), .Q(
        d_ff2_X[27]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(n415), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(n414), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_31_ ( .D(n465), .CK(clk), .RN(n1204), .Q(
        d_ff2_Z[31]) );
  DFFRX1TS reg_ch_mux_3_Q_reg_0_ ( .D(n688), .CK(clk), .RN(n1215), .Q(
        sel_mux_3_reg) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(n721), .CK(clk), .RN(n1213), .Q(
        d_ff1_shift_region_flag_out[1]), .QN(n1160) );
  DFFRX1TS d_ff4_Xn_Q_reg_25_ ( .D(n595), .CK(clk), .RN(n1220), .Q(d_ff_Xn[25]) );
  DFFRX1TS d_ff4_Xn_Q_reg_1_ ( .D(n619), .CK(clk), .RN(n1224), .Q(d_ff_Xn[1])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_2_ ( .D(n618), .CK(clk), .RN(n1224), .Q(d_ff_Xn[2])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_3_ ( .D(n617), .CK(clk), .RN(n1224), .Q(d_ff_Xn[3])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_5_ ( .D(n615), .CK(clk), .RN(n1223), .Q(d_ff_Xn[5])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_6_ ( .D(n614), .CK(clk), .RN(n1223), .Q(d_ff_Xn[6])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_7_ ( .D(n613), .CK(clk), .RN(n1223), .Q(d_ff_Xn[7])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_10_ ( .D(n610), .CK(clk), .RN(n1222), .Q(d_ff_Xn[10]) );
  DFFRX1TS d_ff4_Xn_Q_reg_12_ ( .D(n608), .CK(clk), .RN(n1222), .Q(d_ff_Xn[12]) );
  DFFRX1TS d_ff4_Xn_Q_reg_13_ ( .D(n607), .CK(clk), .RN(n1222), .Q(d_ff_Xn[13]) );
  DFFRX1TS d_ff4_Xn_Q_reg_14_ ( .D(n606), .CK(clk), .RN(n1222), .Q(d_ff_Xn[14]) );
  DFFRX1TS d_ff4_Xn_Q_reg_16_ ( .D(n604), .CK(clk), .RN(n1221), .Q(d_ff_Xn[16]) );
  DFFRX1TS d_ff4_Xn_Q_reg_17_ ( .D(n603), .CK(clk), .RN(n1221), .Q(d_ff_Xn[17]) );
  DFFRX1TS d_ff4_Xn_Q_reg_19_ ( .D(n601), .CK(clk), .RN(n1221), .Q(d_ff_Xn[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_20_ ( .D(n600), .CK(clk), .RN(n1214), .Q(d_ff_Xn[20]) );
  DFFRX1TS d_ff4_Xn_Q_reg_24_ ( .D(n596), .CK(clk), .RN(n1220), .Q(d_ff_Xn[24]) );
  DFFRX1TS d_ff4_Xn_Q_reg_26_ ( .D(n594), .CK(clk), .RN(n1220), .Q(d_ff_Xn[26]) );
  DFFRX1TS d_ff4_Xn_Q_reg_28_ ( .D(n592), .CK(clk), .RN(n1219), .Q(d_ff_Xn[28]) );
  DFFRX1TS d_ff4_Xn_Q_reg_29_ ( .D(n591), .CK(clk), .RN(n1199), .Q(d_ff_Xn[29]) );
  DFFRX1TS d_ff4_Xn_Q_reg_0_ ( .D(n620), .CK(clk), .RN(n1224), .Q(d_ff_Xn[0])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_4_ ( .D(n616), .CK(clk), .RN(n1223), .Q(d_ff_Xn[4])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_8_ ( .D(n612), .CK(clk), .RN(n1217), .Q(d_ff_Xn[8])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_9_ ( .D(n611), .CK(clk), .RN(n1208), .Q(d_ff_Xn[9])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_11_ ( .D(n609), .CK(clk), .RN(n1213), .Q(d_ff_Xn[11]) );
  DFFRX1TS d_ff4_Xn_Q_reg_15_ ( .D(n605), .CK(clk), .RN(n1222), .Q(d_ff_Xn[15]) );
  DFFRX1TS d_ff4_Xn_Q_reg_18_ ( .D(n602), .CK(clk), .RN(n1221), .Q(d_ff_Xn[18]) );
  DFFRX1TS d_ff4_Xn_Q_reg_21_ ( .D(n599), .CK(clk), .RN(n1219), .Q(d_ff_Xn[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_22_ ( .D(n598), .CK(clk), .RN(n1220), .Q(d_ff_Xn[22]) );
  DFFRX1TS d_ff4_Xn_Q_reg_30_ ( .D(n590), .CK(clk), .RN(n1199), .Q(d_ff_Xn[30]) );
  DFFRX1TS d_ff4_Xn_Q_reg_31_ ( .D(n589), .CK(clk), .RN(n1199), .Q(d_ff_Xn[31]) );
  DFFRX1TS d_ff4_Xn_Q_reg_23_ ( .D(n597), .CK(clk), .RN(n1204), .Q(d_ff_Xn[23]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_20_ ( .D(n359), .CK(clk), .RN(n1212), .Q(
        d_ff2_X[20]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_0_ ( .D(n399), .CK(clk), .RN(n1209), .Q(
        d_ff2_X[0]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_4_ ( .D(n391), .CK(clk), .RN(n1209), .Q(
        d_ff2_X[4]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_8_ ( .D(n383), .CK(clk), .RN(n1210), .Q(
        d_ff2_X[8]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_9_ ( .D(n381), .CK(clk), .RN(n1210), .Q(
        d_ff2_X[9]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_11_ ( .D(n377), .CK(clk), .RN(n1210), .Q(
        d_ff2_X[11]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_15_ ( .D(n369), .CK(clk), .RN(n1211), .Q(
        d_ff2_X[15]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_18_ ( .D(n363), .CK(clk), .RN(n1212), .Q(
        d_ff2_X[18]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_31_ ( .D(n337), .CK(clk), .RN(n1199), .Q(
        d_ff2_X[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_0_ ( .D(n463), .CK(clk), .RN(n1204), .Q(
        d_ff2_Y[0]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_20_ ( .D(n423), .CK(clk), .RN(n1207), .Q(
        d_ff2_Y[20]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_21_ ( .D(n421), .CK(clk), .RN(n1207), .Q(
        d_ff2_Y[21]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_22_ ( .D(n419), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[22]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_31_ ( .D(n401), .CK(clk), .RN(n1208), .Q(
        d_ff2_Y[31]) );
  DFFRX1TS reg_LUT_Q_reg_6_ ( .D(n518), .CK(clk), .RN(n1200), .Q(
        d_ff3_LUT_out[6]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_27_ ( .D(n469), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[27]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_28_ ( .D(n468), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[28]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_29_ ( .D(n467), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[29]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_30_ ( .D(n466), .CK(clk), .RN(n1204), .Q(
        d_ff2_Z[30]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_23_ ( .D(n473), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_24_ ( .D(n472), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[24]) );
  DFFRX4TS cordic_FSM_state_reg_reg_2_ ( .D(n731), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[2]), .QN(n1163) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_0_ ( .D(n496), .CK(clk), .RN(n1202), .Q(
        d_ff2_Z[0]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_1_ ( .D(n495), .CK(clk), .RN(n1202), .Q(
        d_ff2_Z[1]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_2_ ( .D(n494), .CK(clk), .RN(n1202), .Q(
        d_ff2_Z[2]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_3_ ( .D(n493), .CK(clk), .RN(n1202), .Q(
        d_ff2_Z[3]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_5_ ( .D(n491), .CK(clk), .RN(n1202), .Q(
        d_ff2_Z[5]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_6_ ( .D(n490), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[6]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_7_ ( .D(n489), .CK(clk), .RN(n1211), .Q(
        d_ff2_Z[7]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_10_ ( .D(n486), .CK(clk), .RN(n1205), .Q(
        d_ff2_Z[10]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_12_ ( .D(n484), .CK(clk), .RN(n1202), .Q(
        d_ff2_Z[12]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_13_ ( .D(n483), .CK(clk), .RN(n1201), .Q(
        d_ff2_Z[13]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_14_ ( .D(n482), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[14]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_16_ ( .D(n480), .CK(clk), .RN(n1210), .Q(
        d_ff2_Z[16]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_17_ ( .D(n479), .CK(clk), .RN(n1209), .Q(
        d_ff2_Z[17]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_19_ ( .D(n477), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[19]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_20_ ( .D(n476), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[20]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_26_ ( .D(n470), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[26]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_25_ ( .D(n471), .CK(clk), .RN(n1203), .Q(
        d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(n626), .CK(clk), .RN(n1225), .Q(d_ff_Yn[26]), .QN(n1195) );
  DFFRX2TS cont_iter_count_reg_1_ ( .D(n727), .CK(clk), .RN(n1222), .Q(
        cont_iter_out[1]) );
  AOI222X1TS U795 ( .A0(d_ff3_LUT_out[23]), .A1(n977), .B0(d_ff3_sh_y_out[23]), 
        .B1(n988), .C0(d_ff3_sh_x_out[23]), .C1(n987), .Y(n973) );
  AOI222X1TS U796 ( .A0(d_ff3_LUT_out[24]), .A1(n977), .B0(d_ff3_sh_y_out[24]), 
        .B1(n988), .C0(d_ff3_sh_x_out[24]), .C1(n987), .Y(n972) );
  AOI222X1TS U797 ( .A0(d_ff3_sh_x_out[25]), .A1(n976), .B0(d_ff3_LUT_out[25]), 
        .B1(n951), .C0(n917), .C1(d_ff3_sh_y_out[25]), .Y(n920) );
  AOI222X1TS U798 ( .A0(d_ff2_Z[8]), .A1(n944), .B0(d_ff2_Y[8]), .B1(n947), 
        .C0(d_ff2_X[8]), .C1(n917), .Y(n926) );
  AOI222X1TS U799 ( .A0(d_ff2_Z[18]), .A1(n944), .B0(d_ff2_Y[18]), .B1(n976), 
        .C0(d_ff2_X[18]), .C1(n917), .Y(n938) );
  AOI222X1TS U800 ( .A0(d_ff2_Z[21]), .A1(n944), .B0(d_ff2_Y[21]), .B1(n976), 
        .C0(d_ff2_X[21]), .C1(n943), .Y(n937) );
  AOI222X1TS U801 ( .A0(d_ff2_Z[11]), .A1(n944), .B0(d_ff2_Y[11]), .B1(n947), 
        .C0(d_ff2_X[11]), .C1(n943), .Y(n932) );
  AOI222X1TS U802 ( .A0(d_ff2_Z[15]), .A1(n944), .B0(d_ff2_Y[15]), .B1(n976), 
        .C0(d_ff2_X[15]), .C1(n943), .Y(n945) );
  AOI222X1TS U803 ( .A0(d_ff3_LUT_out[0]), .A1(n977), .B0(n991), .B1(
        d_ff3_sh_x_out[0]), .C0(n988), .C1(d_ff3_sh_y_out[0]), .Y(n971) );
  AOI222X1TS U804 ( .A0(d_ff3_LUT_out[2]), .A1(n977), .B0(n991), .B1(
        d_ff3_sh_x_out[2]), .C0(n988), .C1(d_ff3_sh_y_out[2]), .Y(n970) );
  AOI222X1TS U805 ( .A0(d_ff3_LUT_out[1]), .A1(n977), .B0(n991), .B1(
        d_ff3_sh_x_out[1]), .C0(n988), .C1(d_ff3_sh_y_out[1]), .Y(n969) );
  AOI222X1TS U806 ( .A0(d_ff2_Z[9]), .A1(n944), .B0(d_ff2_Y[9]), .B1(n947), 
        .C0(d_ff2_X[9]), .C1(n994), .Y(n931) );
  AOI222X1TS U807 ( .A0(d_ff2_Z[22]), .A1(n967), .B0(d_ff2_Y[22]), .B1(n976), 
        .C0(d_ff2_X[22]), .C1(n943), .Y(n942) );
  CMPR32X2TS U808 ( .A(d_ff2_Y[26]), .B(n1155), .C(n1098), .CO(n1100), .S(
        n1097) );
  CMPR32X2TS U809 ( .A(n1155), .B(d_ff2_X[26]), .C(n1135), .CO(n1139), .S(
        n1133) );
  CMPR32X2TS U810 ( .A(d_ff2_Y[25]), .B(n1096), .C(n1095), .CO(n1098), .S(
        n1094) );
  INVX4TS U811 ( .A(n1022), .Y(n1024) );
  BUFX4TS U812 ( .A(n812), .Y(n799) );
  BUFX4TS U813 ( .A(n813), .Y(n798) );
  BUFX3TS U814 ( .A(n1031), .Y(n1030) );
  BUFX3TS U815 ( .A(n1042), .Y(n1045) );
  INVX3TS U816 ( .A(n1024), .Y(n1023) );
  INVX3TS U817 ( .A(n1024), .Y(n1026) );
  NAND3X1TS U818 ( .A(n986), .B(n1132), .C(n985), .Y(cordic_FSM_state_next_1_)
         );
  AO22XLTS U819 ( .A0(n1104), .A1(d_ff2_Y[22]), .B0(n1146), .B1(
        d_ff3_sh_y_out[22]), .Y(n418) );
  AO22XLTS U820 ( .A0(n1104), .A1(d_ff2_Y[18]), .B0(n1146), .B1(
        d_ff3_sh_y_out[18]), .Y(n426) );
  AO22XLTS U821 ( .A0(n1104), .A1(d_ff2_Y[17]), .B0(n1111), .B1(
        d_ff3_sh_y_out[17]), .Y(n428) );
  AO22XLTS U822 ( .A0(n1104), .A1(d_ff2_Y[16]), .B0(n1146), .B1(
        d_ff3_sh_y_out[16]), .Y(n430) );
  AO22XLTS U823 ( .A0(n1104), .A1(d_ff2_Y[15]), .B0(n1151), .B1(
        d_ff3_sh_y_out[15]), .Y(n432) );
  AO22XLTS U824 ( .A0(n1134), .A1(d_ff2_Y[14]), .B0(n1151), .B1(
        d_ff3_sh_y_out[14]), .Y(n434) );
  AO22XLTS U825 ( .A0(n1134), .A1(d_ff2_Y[5]), .B0(n1151), .B1(
        d_ff3_sh_y_out[5]), .Y(n452) );
  AO22XLTS U826 ( .A0(n1134), .A1(d_ff2_Y[4]), .B0(n1151), .B1(
        d_ff3_sh_y_out[4]), .Y(n454) );
  AO22XLTS U827 ( .A0(n1134), .A1(d_ff2_Y[3]), .B0(n1151), .B1(
        d_ff3_sh_y_out[3]), .Y(n456) );
  OAI211X2TS U828 ( .A0(n1131), .A1(n1062), .B0(n1144), .C0(n1074), .Y(n1075)
         );
  NAND2BX4TS U829 ( .AN(n904), .B(sel_mux_3_reg), .Y(n871) );
  NOR2X2TS U830 ( .A(sel_mux_3_reg), .B(n904), .Y(n829) );
  NAND2XLTS U831 ( .A(sel_mux_2_reg[1]), .B(n1225), .Y(n825) );
  AOI222X1TS U832 ( .A0(d_ff3_LUT_out[7]), .A1(n967), .B0(n991), .B1(
        d_ff3_sh_x_out[7]), .C0(n961), .C1(d_ff3_sh_y_out[7]), .Y(n952) );
  INVX3TS U833 ( .A(n798), .Y(n1144) );
  INVX3TS U834 ( .A(n1118), .Y(n1149) );
  INVX3TS U835 ( .A(n1118), .Y(n1088) );
  AOI222X1TS U836 ( .A0(d_ff2_Z[19]), .A1(n944), .B0(d_ff2_Y[19]), .B1(n976), 
        .C0(d_ff2_X[19]), .C1(n917), .Y(n935) );
  INVX3TS U837 ( .A(n1020), .Y(n1018) );
  INVX3TS U838 ( .A(n798), .Y(n1148) );
  AOI222X1TS U839 ( .A0(d_ff3_LUT_out[6]), .A1(n967), .B0(n991), .B1(
        d_ff3_sh_x_out[6]), .C0(n988), .C1(d_ff3_sh_y_out[6]), .Y(n968) );
  AOI222X1TS U840 ( .A0(d_ff3_LUT_out[10]), .A1(n967), .B0(n987), .B1(
        d_ff3_sh_x_out[10]), .C0(n961), .C1(d_ff3_sh_y_out[10]), .Y(n955) );
  AOI222X1TS U841 ( .A0(d_ff3_LUT_out[13]), .A1(n977), .B0(n987), .B1(
        d_ff3_sh_x_out[13]), .C0(n988), .C1(d_ff3_sh_y_out[13]), .Y(n965) );
  AOI222X1TS U842 ( .A0(d_ff3_LUT_out[20]), .A1(n977), .B0(n947), .B1(
        d_ff3_sh_x_out[20]), .C0(n961), .C1(d_ff3_sh_y_out[20]), .Y(n948) );
  AOI222X1TS U843 ( .A0(d_ff2_Z[5]), .A1(n944), .B0(d_ff2_Y[5]), .B1(n947), 
        .C0(d_ff2_X[5]), .C1(n917), .Y(n933) );
  AOI222X1TS U844 ( .A0(n992), .A1(d_ff3_LUT_out[19]), .B0(n976), .B1(
        d_ff3_sh_x_out[19]), .C0(n961), .C1(d_ff3_sh_y_out[19]), .Y(n946) );
  AOI222X1TS U845 ( .A0(d_ff3_LUT_out[9]), .A1(n967), .B0(n991), .B1(
        d_ff3_sh_x_out[9]), .C0(n961), .C1(d_ff3_sh_y_out[9]), .Y(n954) );
  AOI222X1TS U846 ( .A0(d_ff3_LUT_out[26]), .A1(n977), .B0(n987), .B1(
        d_ff3_sh_x_out[26]), .C0(n961), .C1(d_ff3_sh_y_out[26]), .Y(n950) );
  INVX3TS U847 ( .A(n798), .Y(n1134) );
  AOI222X1TS U848 ( .A0(n992), .A1(d_ff3_LUT_out[8]), .B0(n991), .B1(
        d_ff3_sh_x_out[8]), .C0(n961), .C1(d_ff3_sh_y_out[8]), .Y(n949) );
  AOI222X1TS U849 ( .A0(d_ff3_LUT_out[11]), .A1(n967), .B0(n987), .B1(
        d_ff3_sh_x_out[11]), .C0(n961), .C1(d_ff3_sh_y_out[11]), .Y(n953) );
  AOI222X1TS U850 ( .A0(d_ff3_LUT_out[21]), .A1(n977), .B0(n987), .B1(
        d_ff3_sh_x_out[21]), .C0(n994), .C1(d_ff3_sh_y_out[21]), .Y(n921) );
  AOI222X1TS U851 ( .A0(d_ff2_Z[2]), .A1(n951), .B0(d_ff2_Y[2]), .B1(n947), 
        .C0(d_ff2_X[2]), .C1(n917), .Y(n922) );
  NOR2X4TS U852 ( .A(sel_mux_1_reg), .B(n1119), .Y(n832) );
  NAND2X2TS U853 ( .A(n1117), .B(sel_mux_1_reg), .Y(n1112) );
  INVX3TS U854 ( .A(n919), .Y(n987) );
  OR3X2TS U855 ( .A(n1163), .B(n1153), .C(n1049), .Y(n1051) );
  NAND3X2TS U856 ( .A(n1004), .B(cordic_FSM_state_reg[0]), .C(
        cordic_FSM_state_reg[3]), .Y(n898) );
  AND2X4TS U857 ( .A(n1004), .B(n996), .Y(n1016) );
  BUFX3TS U858 ( .A(n915), .Y(n917) );
  NAND3X2TS U859 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n1002), .Y(n813) );
  OR2X4TS U860 ( .A(n1161), .B(sel_mux_2_reg[1]), .Y(n919) );
  INVX2TS U861 ( .A(n908), .Y(n951) );
  BUFX3TS U862 ( .A(n1129), .Y(n1151) );
  AOI222X1TS U863 ( .A0(n1131), .A1(n1130), .B0(n1131), .B1(n803), .C0(n1130), 
        .C1(n803), .Y(n1135) );
  OAI211XLTS U864 ( .A0(n1198), .A1(cont_iter_out[3]), .B0(cont_iter_out[1]), 
        .C0(n1096), .Y(n811) );
  OAI211X1TS U865 ( .A0(n1066), .A1(n1131), .B0(n1074), .C0(n1144), .Y(n1072)
         );
  AOI222X1TS U866 ( .A0(n867), .A1(d_ff2_Z[25]), .B0(n866), .B1(d_ff1_Z[25]), 
        .C0(d_ff_Zn[25]), .C1(n1110), .Y(n863) );
  AO22XLTS U867 ( .A0(d_ff_Yn[31]), .A1(n1109), .B0(d_ff2_Y[31]), .B1(n1149), 
        .Y(n401) );
  AO22XLTS U868 ( .A0(d_ff_Yn[22]), .A1(n1150), .B0(d_ff2_Y[22]), .B1(n1149), 
        .Y(n419) );
  AO22XLTS U869 ( .A0(d_ff_Yn[21]), .A1(n1150), .B0(d_ff2_Y[21]), .B1(n1149), 
        .Y(n421) );
  AO22XLTS U870 ( .A0(d_ff_Yn[20]), .A1(n1150), .B0(d_ff2_Y[20]), .B1(n1149), 
        .Y(n423) );
  AO22XLTS U871 ( .A0(d_ff_Yn[0]), .A1(n1150), .B0(d_ff2_Y[0]), .B1(n1119), 
        .Y(n463) );
  AO22XLTS U872 ( .A0(d_ff_Xn[31]), .A1(n1150), .B0(d_ff2_X[31]), .B1(n1149), 
        .Y(n337) );
  AO22XLTS U873 ( .A0(d_ff_Xn[18]), .A1(n1150), .B0(d_ff2_X[18]), .B1(n1149), 
        .Y(n363) );
  AO22XLTS U874 ( .A0(d_ff_Xn[15]), .A1(n1113), .B0(d_ff2_X[15]), .B1(n1149), 
        .Y(n369) );
  AO22XLTS U875 ( .A0(d_ff_Xn[11]), .A1(n1110), .B0(d_ff2_X[11]), .B1(n1149), 
        .Y(n377) );
  AO22XLTS U876 ( .A0(d_ff_Xn[9]), .A1(n1109), .B0(d_ff2_X[9]), .B1(n1149), 
        .Y(n381) );
  AO22XLTS U877 ( .A0(d_ff_Xn[8]), .A1(n1109), .B0(d_ff2_X[8]), .B1(n1149), 
        .Y(n383) );
  AO22XLTS U878 ( .A0(d_ff_Xn[4]), .A1(n1109), .B0(d_ff2_X[4]), .B1(n1149), 
        .Y(n391) );
  AO22XLTS U879 ( .A0(d_ff_Xn[0]), .A1(n1109), .B0(d_ff2_X[0]), .B1(n1149), 
        .Y(n399) );
  AO22XLTS U880 ( .A0(n1044), .A1(result_add_subt[23]), .B0(n1046), .B1(
        d_ff_Xn[23]), .Y(n597) );
  AO22XLTS U881 ( .A0(n1047), .A1(result_add_subt[31]), .B0(n1046), .B1(
        d_ff_Xn[31]), .Y(n589) );
  AO22XLTS U882 ( .A0(n1047), .A1(result_add_subt[30]), .B0(n1046), .B1(
        d_ff_Xn[30]), .Y(n590) );
  AO22XLTS U883 ( .A0(n1044), .A1(result_add_subt[22]), .B0(n1043), .B1(
        d_ff_Xn[22]), .Y(n598) );
  AO22XLTS U884 ( .A0(n1044), .A1(result_add_subt[21]), .B0(n1043), .B1(
        d_ff_Xn[21]), .Y(n599) );
  AO22XLTS U885 ( .A0(n1044), .A1(result_add_subt[18]), .B0(n1043), .B1(
        d_ff_Xn[18]), .Y(n602) );
  AO22XLTS U886 ( .A0(n1044), .A1(result_add_subt[15]), .B0(n1043), .B1(
        d_ff_Xn[15]), .Y(n605) );
  AO22XLTS U887 ( .A0(n1044), .A1(result_add_subt[11]), .B0(n1045), .B1(
        d_ff_Xn[11]), .Y(n609) );
  AO22XLTS U888 ( .A0(n1041), .A1(result_add_subt[9]), .B0(n1045), .B1(
        d_ff_Xn[9]), .Y(n611) );
  AO22XLTS U889 ( .A0(n1041), .A1(result_add_subt[8]), .B0(n1045), .B1(
        d_ff_Xn[8]), .Y(n612) );
  AO22XLTS U890 ( .A0(n1041), .A1(result_add_subt[4]), .B0(n1045), .B1(
        d_ff_Xn[4]), .Y(n616) );
  AO22XLTS U891 ( .A0(n1044), .A1(result_add_subt[0]), .B0(n1043), .B1(
        d_ff_Xn[0]), .Y(n620) );
  AO22XLTS U892 ( .A0(n1047), .A1(result_add_subt[29]), .B0(n1046), .B1(
        d_ff_Xn[29]), .Y(n591) );
  AO22XLTS U893 ( .A0(n1047), .A1(result_add_subt[28]), .B0(n1046), .B1(
        d_ff_Xn[28]), .Y(n592) );
  AO22XLTS U894 ( .A0(n1047), .A1(result_add_subt[26]), .B0(n1046), .B1(
        d_ff_Xn[26]), .Y(n594) );
  AO22XLTS U895 ( .A0(n1047), .A1(result_add_subt[24]), .B0(n1046), .B1(
        d_ff_Xn[24]), .Y(n596) );
  AO22XLTS U896 ( .A0(n1044), .A1(result_add_subt[20]), .B0(n1043), .B1(
        d_ff_Xn[20]), .Y(n600) );
  AO22XLTS U897 ( .A0(n1044), .A1(result_add_subt[19]), .B0(n1043), .B1(
        d_ff_Xn[19]), .Y(n601) );
  AO22XLTS U898 ( .A0(n1044), .A1(result_add_subt[17]), .B0(n1043), .B1(
        d_ff_Xn[17]), .Y(n603) );
  AO22XLTS U899 ( .A0(n1044), .A1(result_add_subt[16]), .B0(n1043), .B1(
        d_ff_Xn[16]), .Y(n604) );
  AO22XLTS U900 ( .A0(n1044), .A1(result_add_subt[14]), .B0(n1043), .B1(
        d_ff_Xn[14]), .Y(n606) );
  AO22XLTS U901 ( .A0(n1044), .A1(result_add_subt[13]), .B0(n1043), .B1(
        d_ff_Xn[13]), .Y(n607) );
  AO22XLTS U902 ( .A0(n1044), .A1(result_add_subt[12]), .B0(n1043), .B1(
        d_ff_Xn[12]), .Y(n608) );
  AO22XLTS U903 ( .A0(n1044), .A1(result_add_subt[10]), .B0(n1045), .B1(
        d_ff_Xn[10]), .Y(n610) );
  AO22XLTS U904 ( .A0(n1041), .A1(result_add_subt[7]), .B0(n1045), .B1(
        d_ff_Xn[7]), .Y(n613) );
  AO22XLTS U905 ( .A0(n1041), .A1(result_add_subt[6]), .B0(n1045), .B1(
        d_ff_Xn[6]), .Y(n614) );
  AO22XLTS U906 ( .A0(n1041), .A1(result_add_subt[5]), .B0(n1045), .B1(
        d_ff_Xn[5]), .Y(n615) );
  AO22XLTS U907 ( .A0(n1041), .A1(result_add_subt[3]), .B0(n1045), .B1(
        d_ff_Xn[3]), .Y(n617) );
  AO22XLTS U908 ( .A0(n1041), .A1(result_add_subt[2]), .B0(n1045), .B1(
        d_ff_Xn[2]), .Y(n618) );
  AO22XLTS U909 ( .A0(n1041), .A1(result_add_subt[1]), .B0(n1045), .B1(
        d_ff_Xn[1]), .Y(n619) );
  AO22XLTS U910 ( .A0(n1047), .A1(result_add_subt[25]), .B0(n1046), .B1(
        d_ff_Xn[25]), .Y(n595) );
  AO22XLTS U911 ( .A0(n1018), .A1(d_ff1_shift_region_flag_out[1]), .B0(n1017), 
        .B1(shift_region_flag[1]), .Y(n721) );
  NAND3XLTS U912 ( .A(n822), .B(sel_mux_3_reg), .C(n1225), .Y(n821) );
  NAND3XLTS U913 ( .A(n1004), .B(cordic_FSM_state_reg[3]), .C(n1156), .Y(n822)
         );
  AOI222X1TS U914 ( .A0(n1119), .A1(d_ff2_Z[31]), .B0(n866), .B1(d_ff1_Z[31]), 
        .C0(d_ff_Zn[31]), .C1(n1087), .Y(n844) );
  AO22XLTS U915 ( .A0(d_ff_Yn[26]), .A1(n1150), .B0(d_ff2_Y[26]), .B1(n1149), 
        .Y(n414) );
  AO22XLTS U916 ( .A0(d_ff_Yn[25]), .A1(n1150), .B0(d_ff2_Y[25]), .B1(n1149), 
        .Y(n415) );
  AOI2BB2XLTS U917 ( .B0(n803), .B1(n1114), .A0N(d_ff_Xn[25]), .A1N(n1116), 
        .Y(n351) );
  AO22XLTS U918 ( .A0(d_ff_Xn[21]), .A1(n1150), .B0(d_ff2_X[21]), .B1(n1119), 
        .Y(n357) );
  AO22XLTS U919 ( .A0(d_ff_Xn[22]), .A1(n1150), .B0(d_ff2_X[22]), .B1(n1119), 
        .Y(n355) );
  AO22XLTS U920 ( .A0(n1047), .A1(result_add_subt[27]), .B0(n1046), .B1(
        d_ff_Xn[27]), .Y(n593) );
  AO22XLTS U921 ( .A0(d_ff_Yn[1]), .A1(n1087), .B0(d_ff2_Y[1]), .B1(n1114), 
        .Y(n461) );
  AO22XLTS U922 ( .A0(d_ff_Yn[2]), .A1(n1110), .B0(d_ff2_Y[2]), .B1(n1114), 
        .Y(n459) );
  AO22XLTS U923 ( .A0(d_ff_Yn[3]), .A1(n1109), .B0(d_ff2_Y[3]), .B1(n1119), 
        .Y(n457) );
  AO22XLTS U924 ( .A0(d_ff_Yn[4]), .A1(n1087), .B0(d_ff2_Y[4]), .B1(n1119), 
        .Y(n455) );
  AO22XLTS U925 ( .A0(d_ff_Yn[5]), .A1(n1109), .B0(d_ff2_Y[5]), .B1(n867), .Y(
        n453) );
  AO22XLTS U926 ( .A0(d_ff_Yn[6]), .A1(n1109), .B0(d_ff2_Y[6]), .B1(n1088), 
        .Y(n451) );
  AO22XLTS U927 ( .A0(d_ff_Yn[7]), .A1(n1113), .B0(d_ff2_Y[7]), .B1(n1088), 
        .Y(n449) );
  AO22XLTS U928 ( .A0(d_ff_Yn[8]), .A1(n1113), .B0(d_ff2_Y[8]), .B1(n1088), 
        .Y(n447) );
  AO22XLTS U929 ( .A0(d_ff_Yn[9]), .A1(n1113), .B0(d_ff2_Y[9]), .B1(n1088), 
        .Y(n445) );
  AO22XLTS U930 ( .A0(d_ff_Yn[10]), .A1(n1113), .B0(d_ff2_Y[10]), .B1(n1088), 
        .Y(n443) );
  AO22XLTS U931 ( .A0(d_ff_Yn[11]), .A1(n1150), .B0(d_ff2_Y[11]), .B1(n1088), 
        .Y(n441) );
  AO22XLTS U932 ( .A0(d_ff_Yn[12]), .A1(n1150), .B0(d_ff2_Y[12]), .B1(n1088), 
        .Y(n439) );
  AO22XLTS U933 ( .A0(d_ff_Yn[13]), .A1(n1113), .B0(d_ff2_Y[13]), .B1(n1088), 
        .Y(n437) );
  AO22XLTS U934 ( .A0(d_ff_Yn[14]), .A1(n1113), .B0(d_ff2_Y[14]), .B1(n1088), 
        .Y(n435) );
  AO22XLTS U935 ( .A0(d_ff_Yn[15]), .A1(n1113), .B0(d_ff2_Y[15]), .B1(n1088), 
        .Y(n433) );
  AO22XLTS U936 ( .A0(d_ff_Yn[16]), .A1(n1113), .B0(d_ff2_Y[16]), .B1(n1088), 
        .Y(n431) );
  AO22XLTS U937 ( .A0(d_ff_Yn[17]), .A1(n1109), .B0(d_ff2_Y[17]), .B1(n1088), 
        .Y(n429) );
  AO22XLTS U938 ( .A0(d_ff_Yn[18]), .A1(n1150), .B0(d_ff2_Y[18]), .B1(n1088), 
        .Y(n427) );
  AO22XLTS U939 ( .A0(d_ff_Yn[19]), .A1(n1150), .B0(d_ff2_Y[19]), .B1(n1088), 
        .Y(n425) );
  AO22XLTS U940 ( .A0(n804), .A1(d_ff1_shift_region_flag_out[0]), .B0(n1017), 
        .B1(shift_region_flag[0]), .Y(n722) );
  AO22XLTS U941 ( .A0(n804), .A1(d_ff1_operation_out), .B0(n1017), .B1(
        operation), .Y(n723) );
  NAND3XLTS U942 ( .A(n824), .B(sel_mux_1_reg), .C(n1225), .Y(n823) );
  NAND3XLTS U943 ( .A(cordic_FSM_state_reg[0]), .B(n1004), .C(n1153), .Y(n824)
         );
  AO22XLTS U944 ( .A0(d_ff_Xn[30]), .A1(n1150), .B0(d_ff2_X[30]), .B1(n1119), 
        .Y(n346) );
  AO22XLTS U945 ( .A0(d_ff2_X[23]), .A1(n1119), .B0(d_ff_Xn[23]), .B1(n1113), 
        .Y(n353) );
  NAND2BXLTS U946 ( .AN(d_ff3_LUT_out[27]), .B(n1132), .Y(n497) );
  AO22XLTS U947 ( .A0(n1057), .A1(n1056), .B0(n1055), .B1(data_output[31]), 
        .Y(n525) );
  AO22XLTS U948 ( .A0(n1053), .A1(sign_inv_out[30]), .B0(n1055), .B1(
        data_output[30]), .Y(n527) );
  AO22XLTS U949 ( .A0(n1053), .A1(sign_inv_out[29]), .B0(n1055), .B1(
        data_output[29]), .Y(n529) );
  AO22XLTS U950 ( .A0(n1057), .A1(sign_inv_out[28]), .B0(n1055), .B1(
        data_output[28]), .Y(n531) );
  AO22XLTS U951 ( .A0(n1053), .A1(sign_inv_out[27]), .B0(n1055), .B1(
        data_output[27]), .Y(n533) );
  AO22XLTS U952 ( .A0(n1053), .A1(sign_inv_out[26]), .B0(n1055), .B1(
        data_output[26]), .Y(n535) );
  AO22XLTS U953 ( .A0(n1057), .A1(sign_inv_out[25]), .B0(n1055), .B1(
        data_output[25]), .Y(n537) );
  AO22XLTS U954 ( .A0(n1053), .A1(sign_inv_out[24]), .B0(n1055), .B1(
        data_output[24]), .Y(n539) );
  AO22XLTS U955 ( .A0(n1053), .A1(sign_inv_out[23]), .B0(n1055), .B1(
        data_output[23]), .Y(n541) );
  AO22XLTS U956 ( .A0(n1053), .A1(sign_inv_out[22]), .B0(n1052), .B1(
        data_output[22]), .Y(n543) );
  AO22XLTS U957 ( .A0(n1053), .A1(sign_inv_out[21]), .B0(n1052), .B1(
        data_output[21]), .Y(n545) );
  AO22XLTS U958 ( .A0(n1057), .A1(sign_inv_out[20]), .B0(n1052), .B1(
        data_output[20]), .Y(n547) );
  AO22XLTS U959 ( .A0(n1053), .A1(sign_inv_out[19]), .B0(n1052), .B1(
        data_output[19]), .Y(n549) );
  AO22XLTS U960 ( .A0(n1053), .A1(sign_inv_out[18]), .B0(n1055), .B1(
        data_output[18]), .Y(n551) );
  AO22XLTS U961 ( .A0(n1057), .A1(sign_inv_out[17]), .B0(n1055), .B1(
        data_output[17]), .Y(n553) );
  AO22XLTS U962 ( .A0(n1053), .A1(sign_inv_out[16]), .B0(n1055), .B1(
        data_output[16]), .Y(n555) );
  AO22XLTS U963 ( .A0(n1053), .A1(sign_inv_out[15]), .B0(n1055), .B1(
        data_output[15]), .Y(n557) );
  AO22XLTS U964 ( .A0(n1057), .A1(sign_inv_out[14]), .B0(n1055), .B1(
        data_output[14]), .Y(n559) );
  AO22XLTS U965 ( .A0(n1053), .A1(sign_inv_out[13]), .B0(n1051), .B1(
        data_output[13]), .Y(n561) );
  AO22XLTS U966 ( .A0(n1057), .A1(sign_inv_out[12]), .B0(n1051), .B1(
        data_output[12]), .Y(n563) );
  AO22XLTS U967 ( .A0(n1057), .A1(sign_inv_out[11]), .B0(n1052), .B1(
        data_output[11]), .Y(n565) );
  AO22XLTS U968 ( .A0(n1053), .A1(sign_inv_out[10]), .B0(n1052), .B1(
        data_output[10]), .Y(n567) );
  AO22XLTS U969 ( .A0(n1050), .A1(sign_inv_out[9]), .B0(n1052), .B1(
        data_output[9]), .Y(n569) );
  AO22XLTS U970 ( .A0(n1050), .A1(sign_inv_out[8]), .B0(n1052), .B1(
        data_output[8]), .Y(n571) );
  AO22XLTS U971 ( .A0(n1050), .A1(sign_inv_out[7]), .B0(n1052), .B1(
        data_output[7]), .Y(n573) );
  AO22XLTS U972 ( .A0(n1050), .A1(sign_inv_out[6]), .B0(n1052), .B1(
        data_output[6]), .Y(n575) );
  AO22XLTS U973 ( .A0(n1050), .A1(sign_inv_out[5]), .B0(n1052), .B1(
        data_output[5]), .Y(n577) );
  AO22XLTS U974 ( .A0(n1050), .A1(sign_inv_out[4]), .B0(n1052), .B1(
        data_output[4]), .Y(n579) );
  AO22XLTS U975 ( .A0(n1050), .A1(sign_inv_out[3]), .B0(n1052), .B1(
        data_output[3]), .Y(n581) );
  AO22XLTS U976 ( .A0(n1050), .A1(sign_inv_out[2]), .B0(n1052), .B1(
        data_output[2]), .Y(n583) );
  AO22XLTS U977 ( .A0(n1050), .A1(sign_inv_out[1]), .B0(n1052), .B1(
        data_output[1]), .Y(n585) );
  AO22XLTS U978 ( .A0(n1053), .A1(sign_inv_out[0]), .B0(n1051), .B1(
        data_output[0]), .Y(n587) );
  NAND4XLTS U979 ( .A(n1007), .B(n1010), .C(n1006), .D(n1005), .Y(n730) );
  AOI32X1TS U980 ( .A0(n1002), .A1(n1163), .A2(n1001), .B0(n1048), .B1(
        cordic_FSM_state_reg[2]), .Y(n1007) );
  NOR3BXLTS U981 ( .AN(n1015), .B(n1144), .C(n1014), .Y(n724) );
  AO22XLTS U982 ( .A0(n1152), .A1(d_ff2_X[31]), .B0(n1111), .B1(
        d_ff3_sh_x_out[31]), .Y(n336) );
  AO22XLTS U983 ( .A0(n1134), .A1(d_ff2_X[22]), .B0(n1132), .B1(
        d_ff3_sh_x_out[22]), .Y(n354) );
  AO22XLTS U984 ( .A0(n1134), .A1(d_ff2_X[21]), .B0(n1132), .B1(
        d_ff3_sh_x_out[21]), .Y(n356) );
  AO22XLTS U985 ( .A0(n1148), .A1(d_ff2_X[20]), .B0(n1132), .B1(
        d_ff3_sh_x_out[20]), .Y(n358) );
  AO22XLTS U986 ( .A0(n1148), .A1(d_ff2_X[19]), .B0(n1132), .B1(
        d_ff3_sh_x_out[19]), .Y(n360) );
  AO22XLTS U987 ( .A0(n1148), .A1(d_ff2_X[18]), .B0(n1132), .B1(
        d_ff3_sh_x_out[18]), .Y(n362) );
  AO22XLTS U988 ( .A0(n1148), .A1(d_ff2_X[17]), .B0(n1132), .B1(
        d_ff3_sh_x_out[17]), .Y(n364) );
  AO22XLTS U989 ( .A0(n1148), .A1(d_ff2_X[16]), .B0(n1132), .B1(
        d_ff3_sh_x_out[16]), .Y(n366) );
  AO22XLTS U990 ( .A0(n1148), .A1(d_ff2_X[15]), .B0(n1132), .B1(
        d_ff3_sh_x_out[15]), .Y(n368) );
  AO22XLTS U991 ( .A0(n1148), .A1(d_ff2_X[14]), .B0(n1132), .B1(
        d_ff3_sh_x_out[14]), .Y(n370) );
  AO22XLTS U992 ( .A0(n1148), .A1(d_ff2_X[13]), .B0(n1151), .B1(
        d_ff3_sh_x_out[13]), .Y(n372) );
  AO22XLTS U993 ( .A0(n1152), .A1(d_ff2_X[12]), .B0(n1146), .B1(
        d_ff3_sh_x_out[12]), .Y(n374) );
  AO22XLTS U994 ( .A0(n1148), .A1(d_ff2_X[11]), .B0(n1111), .B1(
        d_ff3_sh_x_out[11]), .Y(n376) );
  AO22XLTS U995 ( .A0(n1148), .A1(d_ff2_X[10]), .B0(n1151), .B1(
        d_ff3_sh_x_out[10]), .Y(n378) );
  AO22XLTS U996 ( .A0(n1152), .A1(d_ff2_X[9]), .B0(n1146), .B1(
        d_ff3_sh_x_out[9]), .Y(n380) );
  AO22XLTS U997 ( .A0(n1152), .A1(d_ff2_X[8]), .B0(n1111), .B1(
        d_ff3_sh_x_out[8]), .Y(n382) );
  AO22XLTS U998 ( .A0(n1152), .A1(d_ff2_X[7]), .B0(n1111), .B1(
        d_ff3_sh_x_out[7]), .Y(n384) );
  AO22XLTS U999 ( .A0(n1152), .A1(d_ff2_X[6]), .B0(n798), .B1(
        d_ff3_sh_x_out[6]), .Y(n386) );
  AO22XLTS U1000 ( .A0(n1152), .A1(d_ff2_X[5]), .B0(n1146), .B1(
        d_ff3_sh_x_out[5]), .Y(n388) );
  AO22XLTS U1001 ( .A0(n1152), .A1(d_ff2_X[4]), .B0(n1111), .B1(
        d_ff3_sh_x_out[4]), .Y(n390) );
  AO22XLTS U1002 ( .A0(n1152), .A1(d_ff2_X[3]), .B0(n1146), .B1(
        d_ff3_sh_x_out[3]), .Y(n392) );
  AO22XLTS U1003 ( .A0(n1152), .A1(d_ff2_X[2]), .B0(n1111), .B1(
        d_ff3_sh_x_out[2]), .Y(n394) );
  AO22XLTS U1004 ( .A0(n1152), .A1(d_ff2_X[1]), .B0(n1146), .B1(
        d_ff3_sh_x_out[1]), .Y(n396) );
  AO22XLTS U1005 ( .A0(n1152), .A1(d_ff2_X[0]), .B0(n1111), .B1(
        d_ff3_sh_x_out[0]), .Y(n398) );
  AO22XLTS U1006 ( .A0(n1152), .A1(d_ff2_Y[31]), .B0(n1146), .B1(
        d_ff3_sh_y_out[31]), .Y(n400) );
  AO22XLTS U1007 ( .A0(n1104), .A1(d_ff2_Y[21]), .B0(n1111), .B1(
        d_ff3_sh_y_out[21]), .Y(n420) );
  AO22XLTS U1008 ( .A0(n1104), .A1(d_ff2_Y[20]), .B0(n1146), .B1(
        d_ff3_sh_y_out[20]), .Y(n422) );
  AO22XLTS U1009 ( .A0(n1104), .A1(d_ff2_Y[19]), .B0(n1111), .B1(
        d_ff3_sh_y_out[19]), .Y(n424) );
  AO22XLTS U1010 ( .A0(n1137), .A1(d_ff2_Y[13]), .B0(n1151), .B1(
        d_ff3_sh_y_out[13]), .Y(n436) );
  AO22XLTS U1011 ( .A0(n1104), .A1(d_ff2_Y[12]), .B0(n1111), .B1(
        d_ff3_sh_y_out[12]), .Y(n438) );
  AO22XLTS U1012 ( .A0(n1134), .A1(d_ff2_Y[11]), .B0(n1151), .B1(
        d_ff3_sh_y_out[11]), .Y(n440) );
  AO22XLTS U1013 ( .A0(n1104), .A1(d_ff2_Y[10]), .B0(n1146), .B1(
        d_ff3_sh_y_out[10]), .Y(n442) );
  AO22XLTS U1014 ( .A0(n1134), .A1(d_ff2_Y[9]), .B0(n1151), .B1(
        d_ff3_sh_y_out[9]), .Y(n444) );
  AO22XLTS U1015 ( .A0(n1148), .A1(d_ff2_Y[8]), .B0(n1151), .B1(
        d_ff3_sh_y_out[8]), .Y(n446) );
  AO22XLTS U1016 ( .A0(n1148), .A1(d_ff2_Y[7]), .B0(n1151), .B1(
        d_ff3_sh_y_out[7]), .Y(n448) );
  AO22XLTS U1017 ( .A0(n1134), .A1(d_ff2_Y[6]), .B0(n1151), .B1(
        d_ff3_sh_y_out[6]), .Y(n450) );
  AO22XLTS U1018 ( .A0(n1134), .A1(d_ff2_Y[2]), .B0(n1151), .B1(
        d_ff3_sh_y_out[2]), .Y(n458) );
  AO22XLTS U1019 ( .A0(n1134), .A1(d_ff2_Y[1]), .B0(n1129), .B1(
        d_ff3_sh_y_out[1]), .Y(n460) );
  AO22XLTS U1020 ( .A0(n1134), .A1(d_ff2_Y[0]), .B0(n1129), .B1(
        d_ff3_sh_y_out[0]), .Y(n462) );
  AO22XLTS U1021 ( .A0(n1142), .A1(d_ff3_sign_out), .B0(n1152), .B1(
        d_ff2_Z[31]), .Y(n464) );
  AO22XLTS U1022 ( .A0(n1148), .A1(n1147), .B0(n1111), .B1(d_ff3_sh_x_out[30]), 
        .Y(n338) );
  AOI2BB2XLTS U1023 ( .B0(n1144), .B1(n1138), .A0N(d_ff3_sh_x_out[27]), .A1N(
        n1137), .Y(n341) );
  AO22XLTS U1024 ( .A0(n1134), .A1(n1133), .B0(n1132), .B1(d_ff3_sh_x_out[26]), 
        .Y(n342) );
  AO22XLTS U1025 ( .A0(n1148), .A1(n1121), .B0(n1132), .B1(d_ff3_sh_x_out[24]), 
        .Y(n344) );
  OAI21XLTS U1026 ( .A0(n1197), .A1(n1083), .B0(n815), .Y(n345) );
  AO22XLTS U1027 ( .A0(n1134), .A1(n1108), .B0(n1146), .B1(d_ff3_sh_y_out[30]), 
        .Y(n402) );
  AOI2BB2XLTS U1028 ( .B0(n1137), .B1(n1106), .A0N(d_ff3_sh_y_out[29]), .A1N(
        n1152), .Y(n403) );
  AO22XLTS U1029 ( .A0(n1104), .A1(n1103), .B0(n1111), .B1(d_ff3_sh_y_out[28]), 
        .Y(n404) );
  OAI21XLTS U1030 ( .A0(n1102), .A1(n1101), .B0(n1105), .Y(n1103) );
  AOI2BB2XLTS U1031 ( .B0(n1144), .B1(n1099), .A0N(d_ff3_sh_y_out[27]), .A1N(
        n1104), .Y(n405) );
  AO22XLTS U1032 ( .A0(n1104), .A1(n1097), .B0(n1146), .B1(d_ff3_sh_y_out[26]), 
        .Y(n406) );
  AO22XLTS U1033 ( .A0(n1104), .A1(n1094), .B0(n1111), .B1(d_ff3_sh_y_out[25]), 
        .Y(n407) );
  AO22XLTS U1034 ( .A0(n1104), .A1(n1091), .B0(n1146), .B1(d_ff3_sh_y_out[24]), 
        .Y(n408) );
  OAI21XLTS U1035 ( .A0(n1083), .A1(n1089), .B0(n814), .Y(n409) );
  OAI21XLTS U1036 ( .A0(n1058), .A1(n1126), .B0(n816), .Y(n499) );
  OAI21XLTS U1037 ( .A0(n1198), .A1(n1081), .B0(n826), .Y(n501) );
  AOI2BB2XLTS U1038 ( .B0(n1077), .B1(n1076), .A0N(n1137), .A1N(
        d_ff3_LUT_out[21]), .Y(n503) );
  AO21XLTS U1039 ( .A0(d_ff3_LUT_out[11]), .A1(n1129), .B0(n1069), .Y(n513) );
  AOI2BB2XLTS U1040 ( .B0(n1077), .B1(n1067), .A0N(n1137), .A1N(
        d_ff3_LUT_out[9]), .Y(n515) );
  OAI21XLTS U1041 ( .A0(n1131), .A1(n1066), .B0(n1074), .Y(n1067) );
  AO21XLTS U1042 ( .A0(d_ff3_LUT_out[7]), .A1(n1129), .B0(n1069), .Y(n517) );
  OAI21XLTS U1043 ( .A0(cont_iter_out[3]), .A1(n1126), .B0(n828), .Y(n523) );
  OAI21XLTS U1044 ( .A0(n1169), .A1(n871), .B0(n897), .Y(n530) );
  OAI21XLTS U1045 ( .A0(n1194), .A1(n871), .B0(n906), .Y(n538) );
  OAI21XLTS U1046 ( .A0(n1165), .A1(n900), .B0(n869), .Y(n542) );
  OAI21XLTS U1047 ( .A0(n1193), .A1(n900), .B0(n899), .Y(n544) );
  OAI21XLTS U1048 ( .A0(n1192), .A1(n900), .B0(n877), .Y(n546) );
  OAI21XLTS U1049 ( .A0(n1191), .A1(n900), .B0(n893), .Y(n548) );
  OAI21XLTS U1050 ( .A0(n1190), .A1(n900), .B0(n890), .Y(n550) );
  OAI21XLTS U1051 ( .A0(n1189), .A1(n900), .B0(n888), .Y(n552) );
  OAI21XLTS U1052 ( .A0(n1188), .A1(n900), .B0(n886), .Y(n554) );
  OAI21XLTS U1053 ( .A0(n1187), .A1(n900), .B0(n884), .Y(n556) );
  OAI21XLTS U1054 ( .A0(n1186), .A1(n900), .B0(n882), .Y(n558) );
  OAI21XLTS U1055 ( .A0(n1185), .A1(n900), .B0(n892), .Y(n560) );
  OAI21XLTS U1056 ( .A0(n1184), .A1(n900), .B0(n878), .Y(n562) );
  OAI21XLTS U1057 ( .A0(n1183), .A1(n900), .B0(n876), .Y(n564) );
  OAI21XLTS U1058 ( .A0(n1182), .A1(n895), .B0(n874), .Y(n566) );
  OAI21XLTS U1059 ( .A0(n1181), .A1(n895), .B0(n873), .Y(n568) );
  OAI21XLTS U1060 ( .A0(n1180), .A1(n895), .B0(n872), .Y(n570) );
  OAI21XLTS U1061 ( .A0(n1179), .A1(n895), .B0(n881), .Y(n572) );
  OAI21XLTS U1062 ( .A0(n1178), .A1(n895), .B0(n883), .Y(n574) );
  OAI21XLTS U1063 ( .A0(n1176), .A1(n895), .B0(n875), .Y(n578) );
  OAI21XLTS U1064 ( .A0(n1175), .A1(n895), .B0(n889), .Y(n580) );
  OAI21XLTS U1065 ( .A0(n1174), .A1(n895), .B0(n891), .Y(n582) );
  OAI21XLTS U1066 ( .A0(n1173), .A1(n895), .B0(n894), .Y(n584) );
  OAI21XLTS U1067 ( .A0(n1172), .A1(n895), .B0(n880), .Y(n586) );
  OAI21XLTS U1068 ( .A0(n1171), .A1(n895), .B0(n887), .Y(n588) );
  AO22XLTS U1069 ( .A0(n1028), .A1(result_add_subt[31]), .B0(n1025), .B1(
        d_ff_Zn[31]), .Y(n653) );
  AO22XLTS U1070 ( .A0(n1028), .A1(result_add_subt[30]), .B0(n1024), .B1(
        d_ff_Zn[30]), .Y(n654) );
  AO22XLTS U1071 ( .A0(n1028), .A1(result_add_subt[29]), .B0(n1024), .B1(
        d_ff_Zn[29]), .Y(n655) );
  AO22XLTS U1072 ( .A0(n1028), .A1(result_add_subt[28]), .B0(n1024), .B1(
        d_ff_Zn[28]), .Y(n656) );
  AO22XLTS U1073 ( .A0(n1028), .A1(result_add_subt[27]), .B0(n1024), .B1(
        d_ff_Zn[27]), .Y(n657) );
  AO22XLTS U1074 ( .A0(n1028), .A1(result_add_subt[26]), .B0(n1024), .B1(
        d_ff_Zn[26]), .Y(n658) );
  AO22XLTS U1075 ( .A0(n1028), .A1(result_add_subt[25]), .B0(n1024), .B1(
        d_ff_Zn[25]), .Y(n659) );
  AO22XLTS U1076 ( .A0(n1028), .A1(result_add_subt[24]), .B0(n1024), .B1(
        d_ff_Zn[24]), .Y(n660) );
  AO22XLTS U1077 ( .A0(n1026), .A1(result_add_subt[23]), .B0(n1027), .B1(
        d_ff_Zn[23]), .Y(n661) );
  AO22XLTS U1078 ( .A0(n1023), .A1(result_add_subt[22]), .B0(n1025), .B1(
        d_ff_Zn[22]), .Y(n662) );
  AO22XLTS U1079 ( .A0(n1023), .A1(result_add_subt[21]), .B0(n1025), .B1(
        d_ff_Zn[21]), .Y(n663) );
  AO22XLTS U1080 ( .A0(n1023), .A1(result_add_subt[20]), .B0(n1025), .B1(
        d_ff_Zn[20]), .Y(n664) );
  AO22XLTS U1081 ( .A0(n1023), .A1(result_add_subt[19]), .B0(n1025), .B1(
        d_ff_Zn[19]), .Y(n665) );
  AO22XLTS U1082 ( .A0(n1023), .A1(result_add_subt[18]), .B0(n1025), .B1(
        d_ff_Zn[18]), .Y(n666) );
  AO22XLTS U1083 ( .A0(n1023), .A1(result_add_subt[17]), .B0(n1025), .B1(
        d_ff_Zn[17]), .Y(n667) );
  AO22XLTS U1084 ( .A0(n1023), .A1(result_add_subt[16]), .B0(n1025), .B1(
        d_ff_Zn[16]), .Y(n668) );
  AO22XLTS U1085 ( .A0(n1023), .A1(result_add_subt[15]), .B0(n1025), .B1(
        d_ff_Zn[15]), .Y(n669) );
  AO22XLTS U1086 ( .A0(n1023), .A1(result_add_subt[14]), .B0(n1025), .B1(
        d_ff_Zn[14]), .Y(n670) );
  AO22XLTS U1087 ( .A0(n1023), .A1(result_add_subt[13]), .B0(n1025), .B1(
        d_ff_Zn[13]), .Y(n671) );
  AO22XLTS U1088 ( .A0(n1023), .A1(result_add_subt[12]), .B0(n1025), .B1(
        d_ff_Zn[12]), .Y(n672) );
  AO22XLTS U1089 ( .A0(n1026), .A1(result_add_subt[11]), .B0(n1027), .B1(
        d_ff_Zn[11]), .Y(n673) );
  AO22XLTS U1090 ( .A0(n1026), .A1(result_add_subt[10]), .B0(n1027), .B1(
        d_ff_Zn[10]), .Y(n674) );
  AO22XLTS U1091 ( .A0(n1026), .A1(result_add_subt[9]), .B0(n1027), .B1(
        d_ff_Zn[9]), .Y(n675) );
  AO22XLTS U1092 ( .A0(n1026), .A1(result_add_subt[8]), .B0(n1027), .B1(
        d_ff_Zn[8]), .Y(n676) );
  AO22XLTS U1093 ( .A0(n1026), .A1(result_add_subt[7]), .B0(n1027), .B1(
        d_ff_Zn[7]), .Y(n677) );
  AO22XLTS U1094 ( .A0(n1026), .A1(result_add_subt[6]), .B0(n1027), .B1(
        d_ff_Zn[6]), .Y(n678) );
  AO22XLTS U1095 ( .A0(n1026), .A1(result_add_subt[5]), .B0(n1027), .B1(
        d_ff_Zn[5]), .Y(n679) );
  AO22XLTS U1096 ( .A0(n1026), .A1(result_add_subt[4]), .B0(n1027), .B1(
        d_ff_Zn[4]), .Y(n680) );
  AO22XLTS U1097 ( .A0(n1026), .A1(result_add_subt[3]), .B0(n1027), .B1(
        d_ff_Zn[3]), .Y(n681) );
  AO22XLTS U1098 ( .A0(n1026), .A1(result_add_subt[2]), .B0(n1027), .B1(
        d_ff_Zn[2]), .Y(n682) );
  AO22XLTS U1099 ( .A0(n1026), .A1(result_add_subt[1]), .B0(n1027), .B1(
        d_ff_Zn[1]), .Y(n683) );
  AO22XLTS U1100 ( .A0(n1026), .A1(result_add_subt[0]), .B0(n1025), .B1(
        d_ff_Zn[0]), .Y(n684) );
  AO22XLTS U1101 ( .A0(n1016), .A1(data_in[31]), .B0(n805), .B1(d_ff1_Z[31]), 
        .Y(n689) );
  AO22XLTS U1102 ( .A0(n1020), .A1(data_in[30]), .B0(n1018), .B1(d_ff1_Z[30]), 
        .Y(n690) );
  AO22XLTS U1103 ( .A0(n1017), .A1(data_in[29]), .B0(n804), .B1(d_ff1_Z[29]), 
        .Y(n691) );
  AO22XLTS U1104 ( .A0(n1017), .A1(data_in[28]), .B0(n1018), .B1(d_ff1_Z[28]), 
        .Y(n692) );
  AO22XLTS U1105 ( .A0(n1017), .A1(data_in[27]), .B0(n804), .B1(d_ff1_Z[27]), 
        .Y(n693) );
  AO22XLTS U1106 ( .A0(n1017), .A1(data_in[26]), .B0(n805), .B1(d_ff1_Z[26]), 
        .Y(n694) );
  AO22XLTS U1107 ( .A0(n1017), .A1(data_in[25]), .B0(n1018), .B1(d_ff1_Z[25]), 
        .Y(n695) );
  AO22XLTS U1108 ( .A0(n1017), .A1(data_in[24]), .B0(n805), .B1(d_ff1_Z[24]), 
        .Y(n696) );
  AO22XLTS U1109 ( .A0(n1017), .A1(data_in[23]), .B0(n805), .B1(d_ff1_Z[23]), 
        .Y(n697) );
  AO22XLTS U1110 ( .A0(n1017), .A1(data_in[22]), .B0(n1018), .B1(d_ff1_Z[22]), 
        .Y(n698) );
  AO22XLTS U1111 ( .A0(n1017), .A1(data_in[21]), .B0(n805), .B1(d_ff1_Z[21]), 
        .Y(n699) );
  AO22XLTS U1112 ( .A0(n1016), .A1(data_in[20]), .B0(n805), .B1(d_ff1_Z[20]), 
        .Y(n700) );
  AO22XLTS U1113 ( .A0(n1017), .A1(data_in[19]), .B0(n1018), .B1(d_ff1_Z[19]), 
        .Y(n701) );
  AO22XLTS U1114 ( .A0(n1016), .A1(data_in[18]), .B0(n805), .B1(d_ff1_Z[18]), 
        .Y(n702) );
  AO22XLTS U1115 ( .A0(n1020), .A1(data_in[17]), .B0(n805), .B1(d_ff1_Z[17]), 
        .Y(n703) );
  AO22XLTS U1116 ( .A0(n1020), .A1(data_in[16]), .B0(n1018), .B1(d_ff1_Z[16]), 
        .Y(n704) );
  AO22XLTS U1117 ( .A0(n1016), .A1(data_in[15]), .B0(n805), .B1(d_ff1_Z[15]), 
        .Y(n705) );
  AO22XLTS U1118 ( .A0(n1020), .A1(data_in[14]), .B0(n805), .B1(d_ff1_Z[14]), 
        .Y(n706) );
  AO22XLTS U1119 ( .A0(n1020), .A1(data_in[13]), .B0(n1018), .B1(d_ff1_Z[13]), 
        .Y(n707) );
  AO22XLTS U1120 ( .A0(n1020), .A1(data_in[12]), .B0(n1018), .B1(d_ff1_Z[12]), 
        .Y(n708) );
  AO22XLTS U1121 ( .A0(n1016), .A1(data_in[11]), .B0(n1018), .B1(d_ff1_Z[11]), 
        .Y(n709) );
  AO22XLTS U1122 ( .A0(n1020), .A1(data_in[10]), .B0(n804), .B1(d_ff1_Z[10]), 
        .Y(n710) );
  AO22XLTS U1123 ( .A0(n1016), .A1(data_in[9]), .B0(n804), .B1(d_ff1_Z[9]), 
        .Y(n711) );
  AO22XLTS U1124 ( .A0(n1016), .A1(data_in[8]), .B0(n804), .B1(d_ff1_Z[8]), 
        .Y(n712) );
  AO22XLTS U1125 ( .A0(n1016), .A1(data_in[7]), .B0(n804), .B1(d_ff1_Z[7]), 
        .Y(n713) );
  AO22XLTS U1126 ( .A0(n1016), .A1(data_in[6]), .B0(n804), .B1(d_ff1_Z[6]), 
        .Y(n714) );
  AO22XLTS U1127 ( .A0(n1020), .A1(data_in[5]), .B0(n1019), .B1(d_ff1_Z[5]), 
        .Y(n715) );
  AO22XLTS U1128 ( .A0(n1016), .A1(data_in[4]), .B0(n1019), .B1(d_ff1_Z[4]), 
        .Y(n716) );
  AO22XLTS U1129 ( .A0(n1020), .A1(data_in[3]), .B0(n1019), .B1(d_ff1_Z[3]), 
        .Y(n717) );
  AO22XLTS U1130 ( .A0(n1016), .A1(data_in[2]), .B0(n1019), .B1(d_ff1_Z[2]), 
        .Y(n718) );
  AO22XLTS U1131 ( .A0(n1016), .A1(data_in[1]), .B0(n1019), .B1(d_ff1_Z[1]), 
        .Y(n719) );
  AO22XLTS U1132 ( .A0(n1017), .A1(data_in[0]), .B0(n804), .B1(d_ff1_Z[0]), 
        .Y(n720) );
  OAI21XLTS U1133 ( .A0(n1085), .A1(n1010), .B0(n1018), .Y(n907) );
  OAI21XLTS U1134 ( .A0(cont_iter_out[1]), .A1(n1012), .B0(n1019), .Y(n1011)
         );
  OR2X1TS U1135 ( .A(d_ff2_Y[23]), .B(n1226), .Y(n801) );
  INVX2TS U1136 ( .A(n1020), .Y(n1019) );
  BUFX4TS U1137 ( .A(n898), .Y(n901) );
  INVX2TS U1138 ( .A(n1020), .Y(n804) );
  INVX2TS U1139 ( .A(n1016), .Y(n805) );
  AOI222X1TS U1140 ( .A0(d_ff2_Z[26]), .A1(n977), .B0(d_ff2_Y[26]), .B1(n976), 
        .C0(d_ff2_X[26]), .C1(n994), .Y(n941) );
  AOI222X1TS U1141 ( .A0(d_ff2_Z[20]), .A1(n977), .B0(d_ff2_Y[20]), .B1(n976), 
        .C0(d_ff2_X[20]), .C1(n988), .Y(n975) );
  AOI222X1TS U1142 ( .A0(d_ff2_Z[17]), .A1(n944), .B0(d_ff2_Y[17]), .B1(n976), 
        .C0(d_ff2_X[17]), .C1(n943), .Y(n939) );
  AOI222X1TS U1143 ( .A0(d_ff2_Z[16]), .A1(n944), .B0(d_ff2_Y[16]), .B1(n976), 
        .C0(d_ff2_X[16]), .C1(n943), .Y(n940) );
  AOI222X1TS U1144 ( .A0(d_ff2_Z[14]), .A1(n944), .B0(d_ff2_Y[14]), .B1(n976), 
        .C0(d_ff2_X[14]), .C1(n943), .Y(n936) );
  AOI222X1TS U1145 ( .A0(d_ff2_Z[13]), .A1(n944), .B0(d_ff2_Y[13]), .B1(n947), 
        .C0(d_ff2_X[13]), .C1(n943), .Y(n925) );
  AOI222X1TS U1146 ( .A0(d_ff2_Z[12]), .A1(n944), .B0(d_ff2_Y[12]), .B1(n947), 
        .C0(d_ff2_X[12]), .C1(n943), .Y(n930) );
  AOI222X1TS U1147 ( .A0(d_ff2_Z[10]), .A1(n944), .B0(d_ff2_Y[10]), .B1(n947), 
        .C0(d_ff2_X[10]), .C1(n943), .Y(n927) );
  AOI222X1TS U1148 ( .A0(d_ff2_Z[7]), .A1(n951), .B0(d_ff2_Y[7]), .B1(n947), 
        .C0(d_ff2_X[7]), .C1(n994), .Y(n929) );
  AOI222X1TS U1149 ( .A0(d_ff2_Z[6]), .A1(n944), .B0(d_ff2_Y[6]), .B1(n947), 
        .C0(d_ff2_X[6]), .C1(n994), .Y(n934) );
  AOI222X1TS U1150 ( .A0(d_ff2_Z[3]), .A1(n951), .B0(d_ff2_Y[3]), .B1(n947), 
        .C0(d_ff2_X[3]), .C1(n994), .Y(n924) );
  AOI222X1TS U1151 ( .A0(d_ff2_Z[1]), .A1(n951), .B0(d_ff2_Y[1]), .B1(n947), 
        .C0(d_ff2_X[1]), .C1(n994), .Y(n923) );
  AOI222X1TS U1152 ( .A0(n1114), .A1(d_ff2_Z[0]), .B0(n1110), .B1(d_ff_Zn[0]), 
        .C0(n862), .C1(d_ff1_Z[0]), .Y(n839) );
  AOI222X1TS U1153 ( .A0(d_ff2_Z[0]), .A1(n977), .B0(d_ff2_Y[0]), .B1(n976), 
        .C0(d_ff2_X[0]), .C1(n988), .Y(n978) );
  OAI32X1TS U1154 ( .A0(n984), .A1(n983), .A2(n1161), .B0(n1029), .B1(n982), 
        .Y(n686) );
  NOR4X1TS U1155 ( .A(cordic_FSM_state_reg[1]), .B(n1163), .C(n1156), .D(n1153), .Y(ready_cordic) );
  OAI31X1TS U1156 ( .A0(n1004), .A1(n1003), .A2(n1153), .B0(n1156), .Y(n1005)
         );
  NOR2X2TS U1157 ( .A(cordic_FSM_state_reg[0]), .B(cordic_FSM_state_reg[3]), 
        .Y(n996) );
  NOR2X2TS U1158 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[3]), 
        .Y(n1002) );
  INVX2TS U1159 ( .A(n801), .Y(n806) );
  BUFX4TS U1160 ( .A(n1051), .Y(n1052) );
  BUFX4TS U1161 ( .A(n1129), .Y(n1146) );
  BUFX4TS U1162 ( .A(n1129), .Y(n1111) );
  BUFX4TS U1163 ( .A(n832), .Y(n862) );
  BUFX4TS U1164 ( .A(n832), .Y(n866) );
  OAI21XLTS U1165 ( .A0(n1062), .A1(n1126), .B0(n819), .Y(n522) );
  NAND2X2TS U1166 ( .A(n1124), .B(n1155), .Y(n1062) );
  AOI222X1TS U1167 ( .A0(d_ff2_Z[31]), .A1(n977), .B0(d_ff2_Y[31]), .B1(n976), 
        .C0(d_ff2_X[31]), .C1(n988), .Y(n974) );
  AOI222X1TS U1168 ( .A0(d_ff2_Z[4]), .A1(n951), .B0(d_ff2_Y[4]), .B1(n947), 
        .C0(d_ff2_X[4]), .C1(n994), .Y(n928) );
  OAI21XLTS U1169 ( .A0(n1037), .A1(n1015), .B0(n1142), .Y(n1008) );
  BUFX4TS U1170 ( .A(n798), .Y(n1142) );
  OAI33X1TS U1171 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(
        d_ff1_operation_out), .A2(n1164), .B0(n1160), .B1(n1154), .B2(
        d_ff1_shift_region_flag_out[0]), .Y(n1054) );
  OAI21XLTS U1172 ( .A0(n981), .A1(n822), .B0(n821), .Y(n688) );
  BUFX3TS U1173 ( .A(n1045), .Y(n1046) );
  BUFX4TS U1174 ( .A(n898), .Y(n904) );
  BUFX4TS U1175 ( .A(n943), .Y(n961) );
  BUFX4TS U1176 ( .A(n829), .Y(n902) );
  NOR2XLTS U1177 ( .A(d_ff2_X[27]), .B(n1139), .Y(n1136) );
  AND3X4TS U1178 ( .A(n1048), .B(n1163), .C(n1153), .Y(n812) );
  NOR2X4TS U1179 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n1048) );
  AOI222X4TS U1180 ( .A0(n1114), .A1(d_ff2_Z[8]), .B0(n866), .B1(d_ff1_Z[8]), 
        .C0(d_ff_Zn[8]), .C1(n1087), .Y(n841) );
  AOI222X4TS U1181 ( .A0(n1114), .A1(d_ff2_Z[9]), .B0(n866), .B1(d_ff1_Z[9]), 
        .C0(d_ff_Zn[9]), .C1(n1087), .Y(n845) );
  AOI222X4TS U1182 ( .A0(n1114), .A1(d_ff2_Z[11]), .B0(n866), .B1(d_ff1_Z[11]), 
        .C0(d_ff_Zn[11]), .C1(n1109), .Y(n833) );
  AOI222X4TS U1183 ( .A0(n867), .A1(d_ff2_Z[15]), .B0(n866), .B1(d_ff1_Z[15]), 
        .C0(d_ff_Zn[15]), .C1(n1110), .Y(n868) );
  AOI222X4TS U1184 ( .A0(n867), .A1(d_ff2_Z[18]), .B0(n866), .B1(d_ff1_Z[18]), 
        .C0(d_ff_Zn[18]), .C1(n1110), .Y(n853) );
  AOI222X4TS U1185 ( .A0(n867), .A1(d_ff2_Z[21]), .B0(n866), .B1(d_ff1_Z[21]), 
        .C0(d_ff_Zn[21]), .C1(n1110), .Y(n854) );
  AOI222X4TS U1186 ( .A0(n1119), .A1(d_ff2_Z[22]), .B0(n866), .B1(d_ff1_Z[22]), 
        .C0(d_ff_Zn[22]), .C1(n1110), .Y(n851) );
  OAI2BB2X2TS U1187 ( .B0(n1124), .B1(d_ff2_X[24]), .A0N(n1123), .A1N(n1122), 
        .Y(n1130) );
  BUFX4TS U1188 ( .A(n1035), .Y(n1033) );
  OAI21XLTS U1189 ( .A0(n1196), .A1(n871), .B0(n830), .Y(n526) );
  OAI21XLTS U1190 ( .A0(n1170), .A1(n871), .B0(n831), .Y(n528) );
  OAI21XLTS U1191 ( .A0(n1166), .A1(n871), .B0(n870), .Y(n540) );
  OAI21XLTS U1192 ( .A0(n1195), .A1(n871), .B0(n879), .Y(n536) );
  OAI21XLTS U1193 ( .A0(n1168), .A1(n871), .B0(n896), .Y(n532) );
  OAI21XLTS U1194 ( .A0(n827), .A1(n824), .B0(n823), .Y(n687) );
  NOR2X2TS U1195 ( .A(d_ff2_X[23]), .B(n1226), .Y(n1123) );
  INVX4TS U1196 ( .A(n1042), .Y(n1044) );
  INVX4TS U1197 ( .A(n1051), .Y(n1053) );
  BUFX4TS U1198 ( .A(n829), .Y(n905) );
  BUFX4TS U1199 ( .A(n943), .Y(n988) );
  BUFX4TS U1200 ( .A(n977), .Y(n944) );
  BUFX4TS U1201 ( .A(n951), .Y(n977) );
  BUFX4TS U1202 ( .A(n951), .Y(n967) );
  INVX4TS U1203 ( .A(n1096), .Y(n1131) );
  AOI222X4TS U1204 ( .A0(n1065), .A1(n1131), .B0(n1065), .B1(n1226), .C0(
        cont_iter_out[3]), .C1(n1096), .Y(n1070) );
  OAI21XLTS U1205 ( .A0(d_ff2_X[27]), .A1(n1139), .B0(d_ff2_X[28]), .Y(n1140)
         );
  BUFX4TS U1206 ( .A(n1117), .Y(n1118) );
  AOI221X4TS U1207 ( .A0(n1080), .A1(n1144), .B0(d_ff3_LUT_out[24]), .B1(n798), 
        .C0(n1079), .Y(n1082) );
  AOI32X4TS U1208 ( .A0(n1198), .A1(n1144), .A2(n1074), .B0(d_ff3_LUT_out[23]), 
        .B1(n798), .Y(n826) );
  NOR4X4TS U1209 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[1]), 
        .C(n1156), .D(n1153), .Y(ack_add_subt) );
  AND3X2TS U1210 ( .A(cordic_FSM_state_reg[2]), .B(n1048), .C(n1153), .Y(n809)
         );
  OAI21XLTS U1211 ( .A0(n1167), .A1(n871), .B0(n903), .Y(n534) );
  OAI21XLTS U1212 ( .A0(n1177), .A1(n895), .B0(n885), .Y(n576) );
  OAI21XLTS U1213 ( .A0(n807), .A1(n908), .B0(n810), .Y(add_subt_dataB[12]) );
  OAI21XLTS U1214 ( .A0(n808), .A1(n919), .B0(n916), .Y(add_subt_dataB[28]) );
  OAI21XLTS U1215 ( .A0(n1089), .A1(n919), .B0(n914), .Y(add_subt_dataA[23])
         );
  OAI21XLTS U1216 ( .A0(n1101), .A1(n919), .B0(n911), .Y(add_subt_dataA[28])
         );
  NAND2X1TS U1217 ( .A(n1161), .B(sel_mux_2_reg[1]), .Y(n908) );
  INVX4TS U1218 ( .A(n919), .Y(n991) );
  NOR2X1TS U1219 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n915) );
  BUFX3TS U1220 ( .A(n917), .Y(n943) );
  AOI22X1TS U1221 ( .A0(n991), .A1(d_ff3_sh_x_out[12]), .B0(n917), .B1(
        d_ff3_sh_y_out[12]), .Y(n810) );
  INVX4TS U1222 ( .A(n799), .Y(n1203) );
  INVX4TS U1223 ( .A(n799), .Y(n1206) );
  INVX4TS U1224 ( .A(n983), .Y(n1201) );
  INVX4TS U1225 ( .A(n812), .Y(n1202) );
  INVX4TS U1226 ( .A(n812), .Y(n1211) );
  INVX4TS U1227 ( .A(n812), .Y(n1210) );
  CLKBUFX2TS U1228 ( .A(n799), .Y(n983) );
  INVX4TS U1229 ( .A(n799), .Y(n1207) );
  INVX4TS U1230 ( .A(n983), .Y(n1221) );
  INVX4TS U1231 ( .A(n983), .Y(n1222) );
  INVX4TS U1232 ( .A(n983), .Y(n1212) );
  INVX4TS U1233 ( .A(n812), .Y(n1209) );
  INVX4TS U1234 ( .A(n813), .Y(n1137) );
  INVX2TS U1235 ( .A(cont_iter_out[2]), .Y(n1096) );
  OAI21X1TS U1236 ( .A0(n1131), .A1(cont_iter_out[3]), .B0(n1137), .Y(n1084)
         );
  INVX2TS U1237 ( .A(cont_iter_out[1]), .Y(n1124) );
  OAI21X1TS U1238 ( .A0(n1198), .A1(n1062), .B0(n811), .Y(n817) );
  OA22X1TS U1239 ( .A0(n1137), .A1(d_ff3_LUT_out[4]), .B0(n1084), .B1(n817), 
        .Y(n520) );
  INVX4TS U1240 ( .A(n799), .Y(n1225) );
  BUFX3TS U1241 ( .A(n809), .Y(n1117) );
  OA22X1TS U1242 ( .A0(n1118), .A1(d_ff2_X[10]), .B0(d_ff_Xn[10]), .B1(n1112), 
        .Y(n379) );
  OA22X1TS U1243 ( .A0(n1118), .A1(d_ff2_X[6]), .B0(d_ff_Xn[6]), .B1(n1115), 
        .Y(n387) );
  INVX4TS U1244 ( .A(n812), .Y(n1204) );
  INVX4TS U1245 ( .A(n799), .Y(n1200) );
  INVX4TS U1246 ( .A(n812), .Y(n1213) );
  INVX2TS U1247 ( .A(rst), .Y(n331) );
  INVX4TS U1248 ( .A(n812), .Y(n1205) );
  INVX4TS U1249 ( .A(n812), .Y(n1220) );
  INVX4TS U1250 ( .A(n799), .Y(n1215) );
  INVX4TS U1251 ( .A(n812), .Y(n1219) );
  INVX4TS U1252 ( .A(n799), .Y(n1199) );
  INVX4TS U1253 ( .A(n812), .Y(n1218) );
  INVX4TS U1254 ( .A(n799), .Y(n1217) );
  INVX4TS U1255 ( .A(n799), .Y(n1208) );
  INVX4TS U1256 ( .A(n812), .Y(n1214) );
  INVX4TS U1257 ( .A(n799), .Y(n1224) );
  INVX4TS U1258 ( .A(n812), .Y(n1216) );
  INVX4TS U1259 ( .A(n799), .Y(n1223) );
  NAND2X1TS U1260 ( .A(n1137), .B(n1226), .Y(n1083) );
  INVX1TS U1261 ( .A(d_ff2_Y[23]), .Y(n1089) );
  AOI22X1TS U1262 ( .A0(n1144), .A1(n806), .B0(d_ff3_sh_y_out[23]), .B1(n1142), 
        .Y(n814) );
  AOI22X1TS U1263 ( .A0(n1144), .A1(n1123), .B0(d_ff3_sh_x_out[23]), .B1(n1142), .Y(n815) );
  NAND3X1TS U1264 ( .A(cont_iter_out[1]), .B(n1198), .C(n1155), .Y(n1058) );
  NAND2X2TS U1265 ( .A(n1131), .B(n1137), .Y(n1126) );
  NAND2X2TS U1266 ( .A(n1137), .B(n1096), .Y(n1127) );
  INVX2TS U1267 ( .A(n1127), .Y(n1064) );
  NAND2X2TS U1268 ( .A(n1198), .B(cont_iter_out[1]), .Y(n1085) );
  AOI22X1TS U1269 ( .A0(d_ff3_LUT_out[25]), .A1(n798), .B0(n1064), .B1(n1085), 
        .Y(n816) );
  AOI22X1TS U1270 ( .A0(n1144), .A1(n817), .B0(d_ff3_LUT_out[6]), .B1(n1142), 
        .Y(n818) );
  OAI31X1TS U1271 ( .A0(n1226), .A1(n1155), .A2(n1127), .B0(n818), .Y(n518) );
  NOR2X1TS U1272 ( .A(n1085), .B(n1127), .Y(n1079) );
  AOI21X1TS U1273 ( .A0(d_ff3_LUT_out[2]), .A1(n1142), .B0(n1079), .Y(n819) );
  XNOR2X1TS U1274 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), .Y(n820) );
  XOR2X1TS U1275 ( .A(d_ff1_shift_region_flag_out[0]), .B(n820), .Y(n981) );
  NAND2X1TS U1276 ( .A(n1163), .B(cordic_FSM_state_reg[1]), .Y(n1000) );
  INVX2TS U1277 ( .A(n1000), .Y(n1004) );
  NOR3X1TS U1278 ( .A(n1198), .B(n1131), .C(n1062), .Y(n827) );
  NAND3X1TS U1279 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[1]), 
        .C(n996), .Y(n982) );
  NAND2X2TS U1280 ( .A(n1131), .B(cont_iter_out[3]), .Y(n1074) );
  NOR2X2TS U1281 ( .A(n1085), .B(n1074), .Y(n1036) );
  INVX2TS U1282 ( .A(cont_var_out[1]), .Y(n1037) );
  INVX2TS U1283 ( .A(n982), .Y(n984) );
  OAI32X1TS U1284 ( .A0(n982), .A1(n1036), .A2(n1037), .B0(n984), .B1(n825), 
        .Y(n685) );
  INVX2TS U1285 ( .A(n1126), .Y(n1060) );
  NAND2X1TS U1286 ( .A(cont_iter_out[3]), .B(n1060), .Y(n1081) );
  NAND2X1TS U1287 ( .A(n1137), .B(n827), .Y(n1063) );
  OAI21X1TS U1288 ( .A0(n1127), .A1(n1155), .B0(n1063), .Y(n1059) );
  AOI21X1TS U1289 ( .A0(d_ff3_LUT_out[1]), .A1(n1142), .B0(n1059), .Y(n828) );
  NAND4X1TS U1290 ( .A(n1153), .B(cordic_FSM_state_reg[1]), .C(
        cordic_FSM_state_reg[2]), .D(cordic_FSM_state_reg[0]), .Y(n979) );
  INVX2TS U1291 ( .A(n979), .Y(beg_add_subt) );
  AOI22X1TS U1292 ( .A0(d_ff_Xn[31]), .A1(n829), .B0(data_output2_31_), .B1(
        n898), .Y(n830) );
  AOI22X1TS U1293 ( .A0(d_ff_Xn[30]), .A1(n829), .B0(sign_inv_out[30]), .B1(
        n904), .Y(n831) );
  INVX4TS U1294 ( .A(n809), .Y(n1114) );
  INVX4TS U1295 ( .A(n809), .Y(n1119) );
  BUFX3TS U1296 ( .A(n1112), .Y(n1116) );
  INVX4TS U1297 ( .A(n1116), .Y(n1109) );
  INVX2TS U1298 ( .A(n833), .Y(n485) );
  AOI222X1TS U1299 ( .A0(n1119), .A1(d_ff2_Z[27]), .B0(n862), .B1(d_ff1_Z[27]), 
        .C0(d_ff_Zn[27]), .C1(n1109), .Y(n834) );
  INVX2TS U1300 ( .A(n834), .Y(n469) );
  AOI222X1TS U1301 ( .A0(n1114), .A1(d_ff2_Z[12]), .B0(n862), .B1(d_ff1_Z[12]), 
        .C0(d_ff_Zn[12]), .C1(n1109), .Y(n835) );
  INVX2TS U1302 ( .A(n835), .Y(n484) );
  AOI222X1TS U1303 ( .A0(n1119), .A1(d_ff2_Z[26]), .B0(n862), .B1(d_ff1_Z[26]), 
        .C0(d_ff_Zn[26]), .C1(n1109), .Y(n836) );
  INVX2TS U1304 ( .A(n836), .Y(n470) );
  AOI222X1TS U1305 ( .A0(n1119), .A1(d_ff2_Z[30]), .B0(n862), .B1(d_ff1_Z[30]), 
        .C0(d_ff_Zn[30]), .C1(n1109), .Y(n837) );
  INVX2TS U1306 ( .A(n837), .Y(n466) );
  AOI222X1TS U1307 ( .A0(n1119), .A1(d_ff2_Z[29]), .B0(n862), .B1(d_ff1_Z[29]), 
        .C0(d_ff_Zn[29]), .C1(n1109), .Y(n838) );
  INVX2TS U1308 ( .A(n838), .Y(n467) );
  INVX4TS U1309 ( .A(n1116), .Y(n1110) );
  INVX2TS U1310 ( .A(n839), .Y(n496) );
  INVX4TS U1311 ( .A(n1116), .Y(n1087) );
  AOI222X1TS U1312 ( .A0(n1114), .A1(d_ff2_Z[7]), .B0(n862), .B1(d_ff1_Z[7]), 
        .C0(d_ff_Zn[7]), .C1(n1087), .Y(n840) );
  INVX2TS U1313 ( .A(n840), .Y(n489) );
  INVX2TS U1314 ( .A(n841), .Y(n488) );
  AOI222X1TS U1315 ( .A0(n1114), .A1(d_ff2_Z[5]), .B0(n832), .B1(d_ff1_Z[5]), 
        .C0(d_ff_Zn[5]), .C1(n1087), .Y(n842) );
  INVX2TS U1316 ( .A(n842), .Y(n491) );
  AOI222X1TS U1317 ( .A0(n1114), .A1(d_ff2_Z[3]), .B0(n832), .B1(d_ff1_Z[3]), 
        .C0(d_ff_Zn[3]), .C1(n1087), .Y(n843) );
  INVX2TS U1318 ( .A(n843), .Y(n493) );
  INVX2TS U1319 ( .A(n844), .Y(n465) );
  INVX2TS U1320 ( .A(n845), .Y(n487) );
  AOI222X1TS U1321 ( .A0(n1114), .A1(d_ff2_Z[6]), .B0(n866), .B1(d_ff1_Z[6]), 
        .C0(d_ff_Zn[6]), .C1(n1087), .Y(n846) );
  INVX2TS U1322 ( .A(n846), .Y(n490) );
  AOI222X1TS U1323 ( .A0(n1114), .A1(d_ff2_Z[1]), .B0(n862), .B1(d_ff1_Z[1]), 
        .C0(d_ff_Zn[1]), .C1(n1087), .Y(n847) );
  INVX2TS U1324 ( .A(n847), .Y(n495) );
  AOI222X1TS U1325 ( .A0(n1114), .A1(d_ff2_Z[2]), .B0(n832), .B1(d_ff1_Z[2]), 
        .C0(d_ff_Zn[2]), .C1(n1087), .Y(n848) );
  INVX2TS U1326 ( .A(n848), .Y(n494) );
  AOI222X1TS U1327 ( .A0(n1114), .A1(d_ff2_Z[4]), .B0(n832), .B1(d_ff1_Z[4]), 
        .C0(d_ff_Zn[4]), .C1(n1087), .Y(n849) );
  INVX2TS U1328 ( .A(n849), .Y(n492) );
  AOI222X1TS U1329 ( .A0(n1119), .A1(d_ff2_Z[28]), .B0(n862), .B1(d_ff1_Z[28]), 
        .C0(d_ff_Zn[28]), .C1(n1087), .Y(n850) );
  INVX2TS U1330 ( .A(n850), .Y(n468) );
  INVX2TS U1331 ( .A(n851), .Y(n474) );
  NOR3X1TS U1332 ( .A(n1036), .B(cont_var_out[0]), .C(n1037), .Y(n1021) );
  NAND2X2TS U1333 ( .A(ack_add_subt), .B(n1021), .Y(n1010) );
  NAND2X1TS U1334 ( .A(cont_iter_out[3]), .B(n1019), .Y(n852) );
  OAI31X1TS U1335 ( .A0(n1010), .A1(n1096), .A2(n1058), .B0(n852), .Y(n725) );
  INVX4TS U1336 ( .A(n809), .Y(n867) );
  INVX2TS U1337 ( .A(n853), .Y(n478) );
  INVX2TS U1338 ( .A(n854), .Y(n475) );
  AOI222X1TS U1339 ( .A0(n867), .A1(d_ff2_Z[10]), .B0(n866), .B1(d_ff1_Z[10]), 
        .C0(d_ff_Zn[10]), .C1(n1087), .Y(n855) );
  INVX2TS U1340 ( .A(n855), .Y(n486) );
  AOI222X1TS U1341 ( .A0(n867), .A1(d_ff2_Z[17]), .B0(n866), .B1(d_ff1_Z[17]), 
        .C0(d_ff_Zn[17]), .C1(n1110), .Y(n856) );
  INVX2TS U1342 ( .A(n856), .Y(n479) );
  AOI222X1TS U1343 ( .A0(n867), .A1(d_ff2_Z[20]), .B0(n862), .B1(d_ff1_Z[20]), 
        .C0(d_ff_Zn[20]), .C1(n1110), .Y(n857) );
  INVX2TS U1344 ( .A(n857), .Y(n476) );
  AOI222X1TS U1345 ( .A0(n867), .A1(d_ff2_Z[23]), .B0(n862), .B1(d_ff1_Z[23]), 
        .C0(d_ff_Zn[23]), .C1(n1110), .Y(n858) );
  INVX2TS U1346 ( .A(n858), .Y(n473) );
  AOI222X1TS U1347 ( .A0(n867), .A1(d_ff2_Z[24]), .B0(n862), .B1(d_ff1_Z[24]), 
        .C0(d_ff_Zn[24]), .C1(n1087), .Y(n859) );
  INVX2TS U1348 ( .A(n859), .Y(n472) );
  AOI222X1TS U1349 ( .A0(n867), .A1(d_ff2_Z[19]), .B0(n862), .B1(d_ff1_Z[19]), 
        .C0(d_ff_Zn[19]), .C1(n1110), .Y(n860) );
  INVX2TS U1350 ( .A(n860), .Y(n477) );
  AOI222X1TS U1351 ( .A0(n867), .A1(d_ff2_Z[16]), .B0(n866), .B1(d_ff1_Z[16]), 
        .C0(d_ff_Zn[16]), .C1(n1110), .Y(n861) );
  INVX2TS U1352 ( .A(n861), .Y(n480) );
  INVX2TS U1353 ( .A(n863), .Y(n471) );
  AOI222X1TS U1354 ( .A0(n867), .A1(d_ff2_Z[14]), .B0(n866), .B1(d_ff1_Z[14]), 
        .C0(d_ff_Zn[14]), .C1(n1110), .Y(n864) );
  INVX2TS U1355 ( .A(n864), .Y(n482) );
  AOI222X1TS U1356 ( .A0(n867), .A1(d_ff2_Z[13]), .B0(n866), .B1(d_ff1_Z[13]), 
        .C0(d_ff_Zn[13]), .C1(n1110), .Y(n865) );
  INVX2TS U1357 ( .A(n865), .Y(n483) );
  INVX2TS U1358 ( .A(n868), .Y(n481) );
  BUFX3TS U1359 ( .A(n871), .Y(n900) );
  AOI22X1TS U1360 ( .A0(d_ff_Xn[23]), .A1(n905), .B0(sign_inv_out[23]), .B1(
        n901), .Y(n869) );
  AOI22X1TS U1361 ( .A0(d_ff_Xn[24]), .A1(n905), .B0(sign_inv_out[24]), .B1(
        n904), .Y(n870) );
  BUFX3TS U1362 ( .A(n871), .Y(n895) );
  AOI22X1TS U1363 ( .A0(d_ff_Xn[9]), .A1(n902), .B0(sign_inv_out[9]), .B1(n901), .Y(n872) );
  AOI22X1TS U1364 ( .A0(d_ff_Xn[10]), .A1(n902), .B0(sign_inv_out[10]), .B1(
        n901), .Y(n873) );
  AOI22X1TS U1365 ( .A0(d_ff_Xn[11]), .A1(n902), .B0(sign_inv_out[11]), .B1(
        n901), .Y(n874) );
  AOI22X1TS U1366 ( .A0(d_ff_Xn[5]), .A1(n902), .B0(sign_inv_out[5]), .B1(n901), .Y(n875) );
  AOI22X1TS U1367 ( .A0(d_ff_Xn[12]), .A1(n902), .B0(sign_inv_out[12]), .B1(
        n904), .Y(n876) );
  AOI22X1TS U1368 ( .A0(d_ff_Xn[21]), .A1(n905), .B0(sign_inv_out[21]), .B1(
        n898), .Y(n877) );
  AOI22X1TS U1369 ( .A0(d_ff_Xn[13]), .A1(n905), .B0(sign_inv_out[13]), .B1(
        n904), .Y(n878) );
  AOI22X1TS U1370 ( .A0(d_ff_Xn[26]), .A1(n905), .B0(sign_inv_out[26]), .B1(
        n898), .Y(n879) );
  AOI22X1TS U1371 ( .A0(d_ff_Xn[1]), .A1(n902), .B0(sign_inv_out[1]), .B1(n901), .Y(n880) );
  AOI22X1TS U1372 ( .A0(d_ff_Xn[8]), .A1(n902), .B0(sign_inv_out[8]), .B1(n901), .Y(n881) );
  AOI22X1TS U1373 ( .A0(d_ff_Xn[15]), .A1(n905), .B0(sign_inv_out[15]), .B1(
        n904), .Y(n882) );
  AOI22X1TS U1374 ( .A0(d_ff_Xn[7]), .A1(n902), .B0(sign_inv_out[7]), .B1(n901), .Y(n883) );
  AOI22X1TS U1375 ( .A0(d_ff_Xn[16]), .A1(n905), .B0(sign_inv_out[16]), .B1(
        n904), .Y(n884) );
  AOI22X1TS U1376 ( .A0(d_ff_Xn[6]), .A1(n902), .B0(sign_inv_out[6]), .B1(n904), .Y(n885) );
  AOI22X1TS U1377 ( .A0(d_ff_Xn[17]), .A1(n905), .B0(sign_inv_out[17]), .B1(
        n904), .Y(n886) );
  AOI22X1TS U1378 ( .A0(d_ff_Xn[0]), .A1(n902), .B0(sign_inv_out[0]), .B1(n901), .Y(n887) );
  AOI22X1TS U1379 ( .A0(d_ff_Xn[18]), .A1(n905), .B0(sign_inv_out[18]), .B1(
        n904), .Y(n888) );
  AOI22X1TS U1380 ( .A0(d_ff_Xn[4]), .A1(n902), .B0(sign_inv_out[4]), .B1(n901), .Y(n889) );
  AOI22X1TS U1381 ( .A0(d_ff_Xn[19]), .A1(n905), .B0(sign_inv_out[19]), .B1(
        n904), .Y(n890) );
  AOI22X1TS U1382 ( .A0(d_ff_Xn[3]), .A1(n902), .B0(sign_inv_out[3]), .B1(n901), .Y(n891) );
  AOI22X1TS U1383 ( .A0(d_ff_Xn[14]), .A1(n905), .B0(sign_inv_out[14]), .B1(
        n904), .Y(n892) );
  AOI22X1TS U1384 ( .A0(d_ff_Xn[20]), .A1(n905), .B0(sign_inv_out[20]), .B1(
        n898), .Y(n893) );
  AOI22X1TS U1385 ( .A0(d_ff_Xn[2]), .A1(n902), .B0(sign_inv_out[2]), .B1(n901), .Y(n894) );
  AOI22X1TS U1386 ( .A0(d_ff_Xn[28]), .A1(n905), .B0(sign_inv_out[28]), .B1(
        n904), .Y(n896) );
  AOI22X1TS U1387 ( .A0(d_ff_Xn[29]), .A1(n902), .B0(sign_inv_out[29]), .B1(
        n901), .Y(n897) );
  AOI22X1TS U1388 ( .A0(d_ff_Xn[22]), .A1(n905), .B0(sign_inv_out[22]), .B1(
        n898), .Y(n899) );
  AOI22X1TS U1389 ( .A0(d_ff_Xn[27]), .A1(n902), .B0(sign_inv_out[27]), .B1(
        n904), .Y(n903) );
  AOI22X1TS U1390 ( .A0(d_ff_Xn[25]), .A1(n905), .B0(sign_inv_out[25]), .B1(
        n901), .Y(n906) );
  OAI32X1TS U1391 ( .A0(n1131), .A1(n1085), .A2(n1010), .B0(n907), .B1(n1096), 
        .Y(n726) );
  BUFX3TS U1392 ( .A(n951), .Y(n992) );
  AOI22X1TS U1393 ( .A0(d_ff2_Z[27]), .A1(n992), .B0(d_ff2_X[27]), .B1(n988), 
        .Y(n909) );
  OAI21XLTS U1394 ( .A0(n1157), .A1(n919), .B0(n909), .Y(add_subt_dataA[27])
         );
  BUFX3TS U1395 ( .A(n917), .Y(n994) );
  AOI22X1TS U1396 ( .A0(d_ff2_Z[30]), .A1(n992), .B0(d_ff2_X[30]), .B1(n994), 
        .Y(n910) );
  OAI21XLTS U1397 ( .A0(n1159), .A1(n919), .B0(n910), .Y(add_subt_dataA[30])
         );
  INVX1TS U1398 ( .A(d_ff2_Y[28]), .Y(n1101) );
  AOI22X1TS U1399 ( .A0(d_ff2_Z[28]), .A1(n992), .B0(d_ff2_X[28]), .B1(n994), 
        .Y(n911) );
  AOI22X1TS U1400 ( .A0(d_ff2_Z[29]), .A1(n992), .B0(d_ff2_X[29]), .B1(n961), 
        .Y(n912) );
  OAI21XLTS U1401 ( .A0(n1158), .A1(n919), .B0(n912), .Y(add_subt_dataA[29])
         );
  AOI22X1TS U1402 ( .A0(d_ff2_X[24]), .A1(n917), .B0(d_ff2_Z[24]), .B1(n992), 
        .Y(n913) );
  OAI21XLTS U1403 ( .A0(n800), .A1(n919), .B0(n913), .Y(add_subt_dataA[24]) );
  AOI22X1TS U1404 ( .A0(d_ff2_X[23]), .A1(n917), .B0(d_ff2_Z[23]), .B1(n992), 
        .Y(n914) );
  AOI22X1TS U1405 ( .A0(d_ff3_sh_y_out[28]), .A1(n915), .B0(d_ff3_LUT_out[27]), 
        .B1(n992), .Y(n916) );
  AOI22X1TS U1406 ( .A0(d_ff3_sh_y_out[29]), .A1(n917), .B0(d_ff3_LUT_out[27]), 
        .B1(n992), .Y(n918) );
  OAI21XLTS U1407 ( .A0(n802), .A1(n919), .B0(n918), .Y(add_subt_dataB[29]) );
  INVX4TS U1408 ( .A(n919), .Y(n976) );
  INVX2TS U1409 ( .A(n920), .Y(add_subt_dataB[25]) );
  INVX2TS U1410 ( .A(n921), .Y(add_subt_dataB[21]) );
  INVX4TS U1411 ( .A(n919), .Y(n947) );
  INVX2TS U1412 ( .A(n922), .Y(add_subt_dataA[2]) );
  INVX2TS U1413 ( .A(n923), .Y(add_subt_dataA[1]) );
  INVX2TS U1414 ( .A(n924), .Y(add_subt_dataA[3]) );
  INVX2TS U1415 ( .A(n925), .Y(add_subt_dataA[13]) );
  INVX2TS U1416 ( .A(n926), .Y(add_subt_dataA[8]) );
  INVX2TS U1417 ( .A(n927), .Y(add_subt_dataA[10]) );
  INVX2TS U1418 ( .A(n928), .Y(add_subt_dataA[4]) );
  INVX2TS U1419 ( .A(n929), .Y(add_subt_dataA[7]) );
  INVX2TS U1420 ( .A(n930), .Y(add_subt_dataA[12]) );
  INVX2TS U1421 ( .A(n931), .Y(add_subt_dataA[9]) );
  INVX2TS U1422 ( .A(n932), .Y(add_subt_dataA[11]) );
  INVX2TS U1423 ( .A(n933), .Y(add_subt_dataA[5]) );
  INVX2TS U1424 ( .A(n934), .Y(add_subt_dataA[6]) );
  INVX2TS U1425 ( .A(n935), .Y(add_subt_dataA[19]) );
  INVX2TS U1426 ( .A(n936), .Y(add_subt_dataA[14]) );
  INVX2TS U1427 ( .A(n937), .Y(add_subt_dataA[21]) );
  INVX2TS U1428 ( .A(n938), .Y(add_subt_dataA[18]) );
  INVX2TS U1429 ( .A(n939), .Y(add_subt_dataA[17]) );
  INVX2TS U1430 ( .A(n940), .Y(add_subt_dataA[16]) );
  INVX2TS U1431 ( .A(n941), .Y(add_subt_dataA[26]) );
  INVX2TS U1432 ( .A(n942), .Y(add_subt_dataA[22]) );
  INVX2TS U1433 ( .A(n945), .Y(add_subt_dataA[15]) );
  INVX2TS U1434 ( .A(n946), .Y(add_subt_dataB[19]) );
  INVX2TS U1435 ( .A(n948), .Y(add_subt_dataB[20]) );
  INVX2TS U1436 ( .A(n949), .Y(add_subt_dataB[8]) );
  INVX2TS U1437 ( .A(n950), .Y(add_subt_dataB[26]) );
  INVX2TS U1438 ( .A(n952), .Y(add_subt_dataB[7]) );
  INVX2TS U1439 ( .A(n953), .Y(add_subt_dataB[11]) );
  INVX2TS U1440 ( .A(n954), .Y(add_subt_dataB[9]) );
  INVX2TS U1441 ( .A(n955), .Y(add_subt_dataB[10]) );
  AOI222X1TS U1442 ( .A0(d_ff3_LUT_out[14]), .A1(n967), .B0(n987), .B1(
        d_ff3_sh_x_out[14]), .C0(n961), .C1(d_ff3_sh_y_out[14]), .Y(n956) );
  INVX2TS U1443 ( .A(n956), .Y(add_subt_dataB[14]) );
  AOI222X1TS U1444 ( .A0(d_ff3_LUT_out[15]), .A1(n967), .B0(n987), .B1(
        d_ff3_sh_x_out[15]), .C0(n961), .C1(d_ff3_sh_y_out[15]), .Y(n957) );
  INVX2TS U1445 ( .A(n957), .Y(add_subt_dataB[15]) );
  AOI222X1TS U1446 ( .A0(d_ff3_LUT_out[16]), .A1(n967), .B0(n987), .B1(
        d_ff3_sh_x_out[16]), .C0(n961), .C1(d_ff3_sh_y_out[16]), .Y(n958) );
  INVX2TS U1447 ( .A(n958), .Y(add_subt_dataB[16]) );
  AOI222X1TS U1448 ( .A0(d_ff3_LUT_out[17]), .A1(n967), .B0(n991), .B1(
        d_ff3_sh_x_out[17]), .C0(n961), .C1(d_ff3_sh_y_out[17]), .Y(n959) );
  INVX2TS U1449 ( .A(n959), .Y(add_subt_dataB[17]) );
  AOI222X1TS U1450 ( .A0(d_ff3_LUT_out[18]), .A1(n967), .B0(n991), .B1(
        d_ff3_sh_x_out[18]), .C0(n961), .C1(d_ff3_sh_y_out[18]), .Y(n960) );
  INVX2TS U1451 ( .A(n960), .Y(add_subt_dataB[18]) );
  AOI222X1TS U1452 ( .A0(n992), .A1(d_ff3_LUT_out[22]), .B0(n987), .B1(
        d_ff3_sh_x_out[22]), .C0(n961), .C1(d_ff3_sh_y_out[22]), .Y(n962) );
  INVX2TS U1453 ( .A(n962), .Y(add_subt_dataB[22]) );
  AOI222X1TS U1454 ( .A0(d_ff3_LUT_out[5]), .A1(n967), .B0(n991), .B1(
        d_ff3_sh_x_out[5]), .C0(n988), .C1(d_ff3_sh_y_out[5]), .Y(n963) );
  INVX2TS U1455 ( .A(n963), .Y(add_subt_dataB[5]) );
  AOI222X1TS U1456 ( .A0(d_ff3_LUT_out[3]), .A1(n967), .B0(n991), .B1(
        d_ff3_sh_x_out[3]), .C0(n988), .C1(d_ff3_sh_y_out[3]), .Y(n964) );
  INVX2TS U1457 ( .A(n964), .Y(add_subt_dataB[3]) );
  INVX2TS U1458 ( .A(n965), .Y(add_subt_dataB[13]) );
  AOI222X1TS U1459 ( .A0(d_ff3_LUT_out[4]), .A1(n967), .B0(n991), .B1(
        d_ff3_sh_x_out[4]), .C0(n988), .C1(d_ff3_sh_y_out[4]), .Y(n966) );
  INVX2TS U1460 ( .A(n966), .Y(add_subt_dataB[4]) );
  INVX2TS U1461 ( .A(n968), .Y(add_subt_dataB[6]) );
  INVX2TS U1462 ( .A(n969), .Y(add_subt_dataB[1]) );
  INVX2TS U1463 ( .A(n970), .Y(add_subt_dataB[2]) );
  INVX2TS U1464 ( .A(n971), .Y(add_subt_dataB[0]) );
  INVX2TS U1465 ( .A(n972), .Y(add_subt_dataB[24]) );
  INVX2TS U1466 ( .A(n973), .Y(add_subt_dataB[23]) );
  INVX2TS U1467 ( .A(n974), .Y(add_subt_dataA[31]) );
  INVX2TS U1468 ( .A(n975), .Y(add_subt_dataA[20]) );
  INVX2TS U1469 ( .A(n978), .Y(add_subt_dataA[0]) );
  AOI211XLTS U1470 ( .A0(n1036), .A1(n1163), .B0(n1048), .C0(n1004), .Y(n980)
         );
  OR4X2TS U1471 ( .A(ack_cordic), .B(n1163), .C(n1153), .D(
        cordic_FSM_state_reg[1]), .Y(n1006) );
  OAI211XLTS U1472 ( .A0(n980), .A1(n1153), .B0(n1006), .C0(n979), .Y(n732) );
  INVX2TS U1473 ( .A(n1036), .Y(n1013) );
  NOR2X1TS U1474 ( .A(n981), .B(n1013), .Y(n1040) );
  AOI21X1TS U1475 ( .A0(cont_var_out[0]), .A1(n1013), .B0(n1040), .Y(n1029) );
  AOI31XLTS U1476 ( .A0(cordic_FSM_state_reg[0]), .A1(n1002), .A2(
        beg_fsm_cordic), .B0(ack_add_subt), .Y(n986) );
  BUFX3TS U1477 ( .A(n1142), .Y(n1132) );
  OAI211XLTS U1478 ( .A0(n1163), .A1(n1153), .B0(cordic_FSM_state_reg[1]), 
        .C0(n1156), .Y(n985) );
  AO22XLTS U1479 ( .A0(n987), .A1(d_ff3_sh_x_out[31]), .B0(n994), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U1480 ( .A0(d_ff3_sh_y_out[30]), .A1(n994), .B0(d_ff3_sh_x_out[30]), 
        .B1(n987), .Y(add_subt_dataB[30]) );
  AOI22X1TS U1481 ( .A0(n991), .A1(d_ff3_sh_x_out[27]), .B0(n988), .B1(
        d_ff3_sh_y_out[27]), .Y(n990) );
  NAND2X1TS U1482 ( .A(d_ff3_LUT_out[27]), .B(n992), .Y(n989) );
  NAND2X1TS U1483 ( .A(n990), .B(n989), .Y(add_subt_dataB[27]) );
  AOI22X1TS U1484 ( .A0(d_ff2_Z[25]), .A1(n992), .B0(d_ff2_Y[25]), .B1(n991), 
        .Y(n993) );
  OAI2BB1X1TS U1485 ( .A0N(d_ff2_X[25]), .A1N(n994), .B0(n993), .Y(
        add_subt_dataA[25]) );
  AOI2BB2XLTS U1486 ( .B0(d_ff3_sign_out), .B1(n1162), .A0N(n1162), .A1N(
        d_ff3_sign_out), .Y(op_add_subt) );
  AOI31XLTS U1487 ( .A0(cordic_FSM_state_reg[3]), .A1(cordic_FSM_state_reg[0]), 
        .A2(ack_cordic), .B0(cordic_FSM_state_reg[1]), .Y(n995) );
  OAI21X1TS U1488 ( .A0(n996), .A1(n995), .B0(cordic_FSM_state_reg[2]), .Y(
        n999) );
  NAND2X1TS U1489 ( .A(cont_var_out[1]), .B(n1162), .Y(n997) );
  NAND4XLTS U1490 ( .A(cordic_FSM_state_reg[3]), .B(n1163), .C(n1013), .D(n997), .Y(n998) );
  AOI32X1TS U1491 ( .A0(n1000), .A1(n999), .A2(n998), .B0(n1156), .B1(n999), 
        .Y(n731) );
  INVX2TS U1492 ( .A(beg_fsm_cordic), .Y(n1001) );
  NOR2BX1TS U1493 ( .AN(ready_add_subt), .B(cordic_FSM_state_reg[2]), .Y(n1003) );
  NAND3X1TS U1494 ( .A(cont_var_out[0]), .B(ack_add_subt), .C(n1013), .Y(n1015) );
  AOI21X1TS U1495 ( .A0(n1037), .A1(n1015), .B0(n1008), .Y(n729) );
  NAND2X1TS U1496 ( .A(n1018), .B(n1010), .Y(n1009) );
  AOI22X1TS U1497 ( .A0(n1198), .A1(n1009), .B0(n1010), .B1(n1226), .Y(n728)
         );
  NOR2X1TS U1498 ( .A(n1226), .B(n1010), .Y(n1012) );
  AOI21X1TS U1499 ( .A0(cont_iter_out[1]), .A1(n1012), .B0(n1011), .Y(n727) );
  AOI31XLTS U1500 ( .A0(ack_add_subt), .A1(n1013), .A2(n1037), .B0(
        cont_var_out[0]), .Y(n1014) );
  BUFX3TS U1501 ( .A(n1020), .Y(n1017) );
  BUFX3TS U1502 ( .A(n1016), .Y(n1020) );
  NAND4X1TS U1503 ( .A(cordic_FSM_state_reg[3]), .B(n1048), .C(ready_add_subt), 
        .D(n1163), .Y(n1038) );
  NOR2BX1TS U1504 ( .AN(n1021), .B(n1038), .Y(n1022) );
  BUFX3TS U1505 ( .A(n1024), .Y(n1027) );
  BUFX3TS U1506 ( .A(n1027), .Y(n1025) );
  INVX2TS U1507 ( .A(n1027), .Y(n1028) );
  NOR2X1TS U1508 ( .A(n1029), .B(n1038), .Y(n1031) );
  BUFX3TS U1509 ( .A(n1030), .Y(n1035) );
  OAI2BB2XLTS U1510 ( .B0(n1032), .B1(n1171), .A0N(n1034), .A1N(
        result_add_subt[0]), .Y(n652) );
  BUFX3TS U1511 ( .A(n1030), .Y(n1034) );
  OAI2BB2XLTS U1512 ( .B0(n1034), .B1(n1172), .A0N(n1032), .A1N(
        result_add_subt[1]), .Y(n651) );
  OAI2BB2XLTS U1513 ( .B0(n1032), .B1(n1173), .A0N(n1034), .A1N(
        result_add_subt[2]), .Y(n650) );
  OAI2BB2XLTS U1514 ( .B0(n1034), .B1(n1174), .A0N(n1032), .A1N(
        result_add_subt[3]), .Y(n649) );
  OAI2BB2XLTS U1515 ( .B0(n1032), .B1(n1175), .A0N(n1034), .A1N(
        result_add_subt[4]), .Y(n648) );
  BUFX3TS U1516 ( .A(n1030), .Y(n1032) );
  OAI2BB2XLTS U1517 ( .B0(n1034), .B1(n1176), .A0N(n1030), .A1N(
        result_add_subt[5]), .Y(n647) );
  OAI2BB2XLTS U1518 ( .B0(n1030), .B1(n1177), .A0N(n1032), .A1N(
        result_add_subt[6]), .Y(n646) );
  OAI2BB2XLTS U1519 ( .B0(n1034), .B1(n1178), .A0N(n1030), .A1N(
        result_add_subt[7]), .Y(n645) );
  OAI2BB2XLTS U1520 ( .B0(n1032), .B1(n1179), .A0N(n1035), .A1N(
        result_add_subt[8]), .Y(n644) );
  OAI2BB2XLTS U1521 ( .B0(n1033), .B1(n1180), .A0N(n1032), .A1N(
        result_add_subt[9]), .Y(n643) );
  OAI2BB2XLTS U1522 ( .B0(n1033), .B1(n1181), .A0N(n1035), .A1N(
        result_add_subt[10]), .Y(n642) );
  OAI2BB2XLTS U1523 ( .B0(n1034), .B1(n1182), .A0N(n1035), .A1N(
        result_add_subt[11]), .Y(n641) );
  OAI2BB2XLTS U1524 ( .B0(n1033), .B1(n1183), .A0N(n1034), .A1N(
        result_add_subt[12]), .Y(n640) );
  OAI2BB2XLTS U1525 ( .B0(n1034), .B1(n1184), .A0N(n1035), .A1N(
        result_add_subt[13]), .Y(n639) );
  OAI2BB2XLTS U1526 ( .B0(n1032), .B1(n1185), .A0N(n1035), .A1N(
        result_add_subt[14]), .Y(n638) );
  OAI2BB2XLTS U1527 ( .B0(n1032), .B1(n1186), .A0N(n1030), .A1N(
        result_add_subt[15]), .Y(n637) );
  OAI2BB2XLTS U1528 ( .B0(n1030), .B1(n1187), .A0N(n1032), .A1N(
        result_add_subt[16]), .Y(n636) );
  OAI2BB2XLTS U1529 ( .B0(n1030), .B1(n1188), .A0N(n1034), .A1N(
        result_add_subt[17]), .Y(n635) );
  OAI2BB2XLTS U1530 ( .B0(n1031), .B1(n1189), .A0N(n1032), .A1N(
        result_add_subt[18]), .Y(n634) );
  OAI2BB2XLTS U1531 ( .B0(n1033), .B1(n1190), .A0N(n1030), .A1N(
        result_add_subt[19]), .Y(n633) );
  OAI2BB2XLTS U1532 ( .B0(n1033), .B1(n1191), .A0N(n1030), .A1N(
        result_add_subt[20]), .Y(n632) );
  OAI2BB2XLTS U1533 ( .B0(n1033), .B1(n1192), .A0N(n1034), .A1N(
        result_add_subt[21]), .Y(n631) );
  OAI2BB2XLTS U1534 ( .B0(n1033), .B1(n1193), .A0N(n1032), .A1N(
        result_add_subt[22]), .Y(n630) );
  OAI2BB2XLTS U1535 ( .B0(n1033), .B1(n1165), .A0N(n1035), .A1N(
        result_add_subt[23]), .Y(n629) );
  OAI2BB2XLTS U1536 ( .B0(n1033), .B1(n1166), .A0N(n1035), .A1N(
        result_add_subt[24]), .Y(n628) );
  OAI2BB2XLTS U1537 ( .B0(n1033), .B1(n1194), .A0N(n1032), .A1N(
        result_add_subt[25]), .Y(n627) );
  OAI2BB2XLTS U1538 ( .B0(n1033), .B1(n1195), .A0N(n1034), .A1N(
        result_add_subt[26]), .Y(n626) );
  OAI2BB2XLTS U1539 ( .B0(n1033), .B1(n1167), .A0N(n1035), .A1N(
        result_add_subt[27]), .Y(n625) );
  OAI2BB2XLTS U1540 ( .B0(n1033), .B1(n1168), .A0N(n1035), .A1N(
        result_add_subt[28]), .Y(n624) );
  OAI2BB2XLTS U1541 ( .B0(n1033), .B1(n1169), .A0N(n1035), .A1N(
        result_add_subt[29]), .Y(n623) );
  OAI2BB2XLTS U1542 ( .B0(n1033), .B1(n1170), .A0N(n1035), .A1N(
        result_add_subt[30]), .Y(n622) );
  OAI2BB2XLTS U1543 ( .B0(n1030), .B1(n1196), .A0N(n1034), .A1N(
        result_add_subt[31]), .Y(n621) );
  AOI21X1TS U1544 ( .A0(n1162), .A1(n1037), .B0(n1036), .Y(n1039) );
  OR3X1TS U1545 ( .A(n1040), .B(n1039), .C(n1038), .Y(n1042) );
  INVX2TS U1546 ( .A(n1042), .Y(n1041) );
  BUFX3TS U1547 ( .A(n1045), .Y(n1043) );
  INVX2TS U1548 ( .A(n1045), .Y(n1047) );
  INVX2TS U1549 ( .A(n1048), .Y(n1049) );
  INVX2TS U1550 ( .A(n1051), .Y(n1050) );
  BUFX3TS U1551 ( .A(n1051), .Y(n1055) );
  INVX2TS U1552 ( .A(n1051), .Y(n1057) );
  XOR2XLTS U1553 ( .A(data_output2_31_), .B(n1054), .Y(n1056) );
  INVX2TS U1554 ( .A(n1058), .Y(n1080) );
  AOI21X1TS U1555 ( .A0(n1080), .A1(n1137), .B0(n1059), .Y(n1068) );
  NOR2X2TS U1556 ( .A(cont_iter_out[3]), .B(n1124), .Y(n1065) );
  AOI22X1TS U1557 ( .A0(n1065), .A1(n1060), .B0(n1142), .B1(d_ff3_LUT_out[0]), 
        .Y(n1061) );
  NAND2X1TS U1558 ( .A(n1068), .B(n1061), .Y(n524) );
  BUFX3TS U1559 ( .A(n798), .Y(n1129) );
  INVX2TS U1560 ( .A(n1065), .Y(n1066) );
  OAI2BB1X1TS U1561 ( .A0N(d_ff3_LUT_out[3]), .A1N(n1146), .B0(n1072), .Y(n521) );
  OAI32X1TS U1562 ( .A0(n798), .A1(n1226), .A2(n1062), .B0(n1070), .B1(n798), 
        .Y(n1071) );
  AO21XLTS U1563 ( .A0(d_ff3_LUT_out[5]), .A1(n1129), .B0(n1071), .Y(n519) );
  NAND2X1TS U1564 ( .A(n1063), .B(n1075), .Y(n1069) );
  AO21XLTS U1565 ( .A0(d_ff3_LUT_out[8]), .A1(n1129), .B0(n1064), .Y(n516) );
  AOI21X1TS U1566 ( .A0(n1065), .A1(n1226), .B0(n1142), .Y(n1077) );
  OAI2BB1X1TS U1567 ( .A0N(d_ff3_LUT_out[10]), .A1N(n813), .B0(n1068), .Y(n514) );
  AOI22X1TS U1568 ( .A0(n1144), .A1(n1070), .B0(n807), .B1(n1142), .Y(n512) );
  OAI31X1TS U1569 ( .A0(n1198), .A1(n1131), .A2(cont_iter_out[3]), .B0(n1074), 
        .Y(n1076) );
  NOR2X1TS U1570 ( .A(n798), .B(n1076), .Y(n1073) );
  AO21XLTS U1571 ( .A0(d_ff3_LUT_out[13]), .A1(n1129), .B0(n1073), .Y(n511) );
  AO21XLTS U1572 ( .A0(d_ff3_LUT_out[14]), .A1(n1129), .B0(n1071), .Y(n510) );
  OAI2BB1X1TS U1573 ( .A0N(d_ff3_LUT_out[15]), .A1N(n798), .B0(n1075), .Y(n509) );
  OAI2BB1X1TS U1574 ( .A0N(d_ff3_LUT_out[16]), .A1N(n813), .B0(n1072), .Y(n508) );
  OAI2BB1X1TS U1575 ( .A0N(d_ff3_LUT_out[17]), .A1N(n1111), .B0(n1075), .Y(
        n507) );
  AO21XLTS U1576 ( .A0(d_ff3_LUT_out[18]), .A1(n1129), .B0(n1073), .Y(n506) );
  NAND2X1TS U1577 ( .A(n1137), .B(n1074), .Y(n1078) );
  OAI2BB1X1TS U1578 ( .A0N(d_ff3_LUT_out[19]), .A1N(n1129), .B0(n1078), .Y(
        n505) );
  OAI2BB1X1TS U1579 ( .A0N(d_ff3_LUT_out[20]), .A1N(n798), .B0(n1075), .Y(n504) );
  OAI2BB1X1TS U1580 ( .A0N(d_ff3_LUT_out[22]), .A1N(n813), .B0(n1078), .Y(n502) );
  AOI32X1TS U1581 ( .A0(n1083), .A1(n1082), .A2(n1081), .B0(cont_iter_out[1]), 
        .B1(n1082), .Y(n500) );
  AOI21X1TS U1582 ( .A0(n1085), .A1(n1155), .B0(n1084), .Y(n1086) );
  AOI2BB1XLTS U1583 ( .A0N(n1137), .A1N(d_ff3_LUT_out[26]), .B0(n1086), .Y(
        n498) );
  INVX4TS U1584 ( .A(n1142), .Y(n1152) );
  INVX4TS U1585 ( .A(n1116), .Y(n1150) );
  INVX2TS U1586 ( .A(n1116), .Y(n1113) );
  INVX4TS U1587 ( .A(n1142), .Y(n1104) );
  BUFX3TS U1588 ( .A(n1112), .Y(n1115) );
  OAI22X1TS U1589 ( .A0(n1117), .A1(n1089), .B0(n1165), .B1(n1115), .Y(n417)
         );
  OAI22X1TS U1590 ( .A0(n1117), .A1(n800), .B0(n1166), .B1(n1115), .Y(n416) );
  OAI22X1TS U1591 ( .A0(n1117), .A1(n1157), .B0(n1167), .B1(n1115), .Y(n413)
         );
  OAI22X1TS U1592 ( .A0(n1117), .A1(n1101), .B0(n1168), .B1(n1115), .Y(n412)
         );
  OAI22X1TS U1593 ( .A0(n1117), .A1(n1158), .B0(n1169), .B1(n1115), .Y(n411)
         );
  OAI22X1TS U1594 ( .A0(n1117), .A1(n1159), .B0(n1170), .B1(n1115), .Y(n410)
         );
  AOI22X1TS U1595 ( .A0(cont_iter_out[1]), .A1(n800), .B0(d_ff2_Y[24]), .B1(
        n1124), .Y(n1090) );
  XNOR2X1TS U1596 ( .A(n806), .B(n1090), .Y(n1091) );
  NAND2X1TS U1597 ( .A(d_ff2_Y[24]), .B(n1124), .Y(n1092) );
  AOI22X1TS U1598 ( .A0(cont_iter_out[1]), .A1(n800), .B0(n806), .B1(n1092), 
        .Y(n1095) );
  NOR2X1TS U1599 ( .A(d_ff2_Y[27]), .B(n1100), .Y(n1102) );
  AOI21X1TS U1600 ( .A0(n1100), .A1(d_ff2_Y[27]), .B0(n1102), .Y(n1099) );
  OR3X1TS U1601 ( .A(n1100), .B(d_ff2_Y[28]), .C(d_ff2_Y[27]), .Y(n1105) );
  NOR2X1TS U1602 ( .A(d_ff2_Y[29]), .B(n1105), .Y(n1107) );
  AOI21X1TS U1603 ( .A0(d_ff2_Y[29]), .A1(n1105), .B0(n1107), .Y(n1106) );
  XOR2X1TS U1604 ( .A(d_ff2_Y[30]), .B(n1107), .Y(n1108) );
  OA22X1TS U1605 ( .A0(n1117), .A1(d_ff2_X[1]), .B0(d_ff_Xn[1]), .B1(n1112), 
        .Y(n397) );
  OA22X1TS U1606 ( .A0(n1118), .A1(d_ff2_X[2]), .B0(d_ff_Xn[2]), .B1(n1116), 
        .Y(n395) );
  OA22X1TS U1607 ( .A0(n809), .A1(d_ff2_X[3]), .B0(d_ff_Xn[3]), .B1(n1112), 
        .Y(n393) );
  OA22X1TS U1608 ( .A0(n809), .A1(d_ff2_X[5]), .B0(d_ff_Xn[5]), .B1(n1116), 
        .Y(n389) );
  OA22X1TS U1609 ( .A0(n1118), .A1(d_ff2_X[7]), .B0(d_ff_Xn[7]), .B1(n1116), 
        .Y(n385) );
  OA22X1TS U1610 ( .A0(n1118), .A1(d_ff2_X[12]), .B0(d_ff_Xn[12]), .B1(n1116), 
        .Y(n375) );
  OA22X1TS U1611 ( .A0(n1118), .A1(d_ff2_X[13]), .B0(d_ff_Xn[13]), .B1(n1112), 
        .Y(n373) );
  OA22X1TS U1612 ( .A0(n1118), .A1(d_ff2_X[14]), .B0(d_ff_Xn[14]), .B1(n1112), 
        .Y(n371) );
  OA22X1TS U1613 ( .A0(n1118), .A1(d_ff2_X[16]), .B0(d_ff_Xn[16]), .B1(n1115), 
        .Y(n367) );
  OA22X1TS U1614 ( .A0(n1118), .A1(d_ff2_X[17]), .B0(d_ff_Xn[17]), .B1(n1115), 
        .Y(n365) );
  OA22X1TS U1615 ( .A0(n1118), .A1(d_ff2_X[19]), .B0(d_ff_Xn[19]), .B1(n1115), 
        .Y(n361) );
  OA22X1TS U1616 ( .A0(n1117), .A1(d_ff2_X[20]), .B0(d_ff_Xn[20]), .B1(n1115), 
        .Y(n359) );
  OA22X1TS U1617 ( .A0(d_ff2_X[24]), .A1(n1118), .B0(d_ff_Xn[24]), .B1(n1115), 
        .Y(n352) );
  OA22X1TS U1618 ( .A0(n1117), .A1(d_ff2_X[26]), .B0(d_ff_Xn[26]), .B1(n1115), 
        .Y(n350) );
  OA22X1TS U1619 ( .A0(n1117), .A1(d_ff2_X[27]), .B0(d_ff_Xn[27]), .B1(n1115), 
        .Y(n349) );
  OA22X1TS U1620 ( .A0(n1117), .A1(d_ff2_X[28]), .B0(d_ff_Xn[28]), .B1(n1116), 
        .Y(n348) );
  OA22X1TS U1621 ( .A0(n1118), .A1(d_ff2_X[29]), .B0(d_ff_Xn[29]), .B1(n1112), 
        .Y(n347) );
  NAND2X1TS U1622 ( .A(d_ff2_X[24]), .B(n1124), .Y(n1122) );
  OAI21XLTS U1623 ( .A0(d_ff2_X[24]), .A1(n1124), .B0(n1122), .Y(n1120) );
  XOR2XLTS U1624 ( .A(n1123), .B(n1120), .Y(n1121) );
  XOR2X1TS U1625 ( .A(n1130), .B(n803), .Y(n1125) );
  MXI2X1TS U1626 ( .A(n1127), .B(n1126), .S0(n1125), .Y(n1128) );
  AO21XLTS U1627 ( .A0(d_ff3_sh_x_out[25]), .A1(n1129), .B0(n1128), .Y(n343)
         );
  AOI21X1TS U1628 ( .A0(n1139), .A1(d_ff2_X[27]), .B0(n1136), .Y(n1138) );
  OR3X1TS U1629 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(n1139), .Y(n1141) );
  AOI32X1TS U1630 ( .A0(n1141), .A1(n1144), .A2(n1140), .B0(n808), .B1(n798), 
        .Y(n340) );
  NOR2X1TS U1631 ( .A(d_ff2_X[29]), .B(n1141), .Y(n1145) );
  AOI21X1TS U1632 ( .A0(d_ff2_X[29]), .A1(n1141), .B0(n1145), .Y(n1143) );
  AOI22X1TS U1633 ( .A0(n1144), .A1(n1143), .B0(n802), .B1(n1142), .Y(n339) );
  XOR2X1TS U1634 ( .A(d_ff2_X[30]), .B(n1145), .Y(n1147) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_syn.sdf"); 
 endmodule

