/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 08:26:29 2016
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
         n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097,
         n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107,
         n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117,
         n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127,
         n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137,
         n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147,
         n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157,
         n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167,
         n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177,
         n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187,
         n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197,
         n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207,
         n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217,
         n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227,
         n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237,
         n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247,
         n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257,
         n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267,
         n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277,
         n1278, n1279, n1280;
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

  DFFRXLTS cont_iter_count_reg_0_ ( .D(n728), .CK(clk), .RN(n1241), .QN(n809)
         );
  DFFRXLTS cont_iter_count_reg_2_ ( .D(n726), .CK(clk), .RN(n1265), .Q(
        cont_iter_out[2]), .QN(n811) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(n719), .CK(clk), .RN(n1261), .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(n718), .CK(clk), .RN(n1273), .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(n717), .CK(clk), .RN(n1259), .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(n716), .CK(clk), .RN(n1262), .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(n715), .CK(clk), .RN(n1272), .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(n714), .CK(clk), .RN(n1273), .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(n713), .CK(clk), .RN(n1259), .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(n712), .CK(clk), .RN(n1262), .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(n711), .CK(clk), .RN(n1272), .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(n710), .CK(clk), .RN(n1273), .Q(d_ff1_Z[10])
         );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(n709), .CK(clk), .RN(n1259), .Q(d_ff1_Z[11])
         );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(n708), .CK(clk), .RN(n1246), .Q(d_ff1_Z[12])
         );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(n707), .CK(clk), .RN(n1247), .Q(d_ff1_Z[13])
         );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(n706), .CK(clk), .RN(n1263), .Q(d_ff1_Z[14])
         );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(n705), .CK(clk), .RN(n1242), .Q(d_ff1_Z[15])
         );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(n704), .CK(clk), .RN(n1243), .Q(d_ff1_Z[16])
         );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(n703), .CK(clk), .RN(n1242), .Q(d_ff1_Z[17])
         );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(n702), .CK(clk), .RN(n1243), .Q(d_ff1_Z[18])
         );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(n701), .CK(clk), .RN(n1246), .Q(d_ff1_Z[19])
         );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(n700), .CK(clk), .RN(n1247), .Q(d_ff1_Z[20])
         );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(n699), .CK(clk), .RN(n1263), .Q(d_ff1_Z[21])
         );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(n698), .CK(clk), .RN(n1267), .Q(d_ff1_Z[22])
         );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(n697), .CK(clk), .RN(n1270), .Q(d_ff1_Z[23])
         );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(n696), .CK(clk), .RN(n1264), .Q(d_ff1_Z[24])
         );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(n695), .CK(clk), .RN(n1266), .Q(d_ff1_Z[25])
         );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(n694), .CK(clk), .RN(n1268), .Q(d_ff1_Z[26])
         );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(n693), .CK(clk), .RN(n1269), .Q(d_ff1_Z[27])
         );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(n692), .CK(clk), .RN(n1271), .Q(d_ff1_Z[28])
         );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(n691), .CK(clk), .RN(n1267), .Q(d_ff1_Z[29])
         );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(n690), .CK(clk), .RN(n1270), .Q(d_ff1_Z[30])
         );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(n689), .CK(clk), .RN(n1264), .Q(d_ff1_Z[31])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(n684), .CK(clk), .RN(n1264), .Q(d_ff_Zn[0])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(n683), .CK(clk), .RN(n1260), .Q(d_ff_Zn[1])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(n682), .CK(clk), .RN(n1260), .Q(d_ff_Zn[2])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(n681), .CK(clk), .RN(n1245), .Q(d_ff_Zn[3])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(n680), .CK(clk), .RN(n1261), .Q(d_ff_Zn[4])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(n679), .CK(clk), .RN(n1261), .Q(d_ff_Zn[5])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(n678), .CK(clk), .RN(n1261), .Q(d_ff_Zn[6])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(n677), .CK(clk), .RN(n1268), .Q(d_ff_Zn[7])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(n676), .CK(clk), .RN(n1269), .Q(d_ff_Zn[8])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(n675), .CK(clk), .RN(n1271), .Q(d_ff_Zn[9])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(n674), .CK(clk), .RN(n1267), .Q(d_ff_Zn[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(n673), .CK(clk), .RN(n1270), .Q(d_ff_Zn[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(n672), .CK(clk), .RN(n1264), .Q(d_ff_Zn[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(n671), .CK(clk), .RN(n1266), .Q(d_ff_Zn[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(n670), .CK(clk), .RN(n1268), .Q(d_ff_Zn[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(n669), .CK(clk), .RN(n1269), .Q(d_ff_Zn[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(n668), .CK(clk), .RN(n1271), .Q(d_ff_Zn[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(n667), .CK(clk), .RN(n1271), .Q(d_ff_Zn[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(n666), .CK(clk), .RN(n1267), .Q(d_ff_Zn[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(n665), .CK(clk), .RN(n1270), .Q(d_ff_Zn[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(n664), .CK(clk), .RN(n1264), .Q(d_ff_Zn[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(n663), .CK(clk), .RN(n1266), .Q(d_ff_Zn[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(n662), .CK(clk), .RN(n1268), .Q(d_ff_Zn[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(n661), .CK(clk), .RN(n1269), .Q(d_ff_Zn[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(n660), .CK(clk), .RN(n1271), .Q(d_ff_Zn[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(n659), .CK(clk), .RN(n1267), .Q(d_ff_Zn[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(n658), .CK(clk), .RN(n1270), .Q(d_ff_Zn[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(n657), .CK(clk), .RN(n1270), .Q(d_ff_Zn[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(n656), .CK(clk), .RN(n1264), .Q(d_ff_Zn[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(n655), .CK(clk), .RN(n1266), .Q(d_ff_Zn[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(n654), .CK(clk), .RN(n1268), .Q(d_ff_Zn[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(n653), .CK(clk), .RN(n1269), .Q(d_ff_Zn[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(n652), .CK(clk), .RN(n1271), .Q(d_ff_Yn[0]), 
        .QN(n1215) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(n650), .CK(clk), .RN(n1270), .Q(d_ff_Yn[2]), 
        .QN(n1217) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(n649), .CK(clk), .RN(n1264), .Q(d_ff_Yn[3]), 
        .QN(n1218) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(n648), .CK(clk), .RN(n1266), .Q(d_ff_Yn[4]), 
        .QN(n1219) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(n647), .CK(clk), .RN(n1269), .Q(d_ff_Yn[5]), 
        .QN(n1220) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(n646), .CK(clk), .RN(n1271), .Q(d_ff_Yn[6]), 
        .QN(n1221) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(n644), .CK(clk), .RN(n1270), .Q(d_ff_Yn[8]), 
        .QN(n1223) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(n643), .CK(clk), .RN(n1264), .Q(d_ff_Yn[9]), 
        .QN(n1224) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(n642), .CK(clk), .RN(n1266), .Q(d_ff_Yn[10]), .QN(n1225) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(n641), .CK(clk), .RN(n1268), .Q(d_ff_Yn[11]), .QN(n1226) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(n640), .CK(clk), .RN(n1269), .Q(d_ff_Yn[12]), .QN(n1227) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(n639), .CK(clk), .RN(n1271), .Q(d_ff_Yn[13]), .QN(n1228) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(n637), .CK(clk), .RN(n1266), .Q(d_ff_Yn[15]), .QN(n1230) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(n636), .CK(clk), .RN(n1268), .Q(d_ff_Yn[16]), .QN(n1231) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(n635), .CK(clk), .RN(n1269), .Q(d_ff_Yn[17]), .QN(n1232) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(n634), .CK(clk), .RN(n1271), .Q(d_ff_Yn[18]), .QN(n1233) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(n633), .CK(clk), .RN(n1267), .Q(d_ff_Yn[19]), .QN(n1234) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(n632), .CK(clk), .RN(n1270), .Q(d_ff_Yn[20]), .QN(n1235) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(n631), .CK(clk), .RN(n1278), .Q(d_ff_Yn[21]), .QN(n1236) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(n630), .CK(clk), .RN(n1276), .Q(d_ff_Yn[22]), .QN(n1237) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(n629), .CK(clk), .RN(n1278), .Q(d_ff_Yn[23]) );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(n628), .CK(clk), .RN(n1279), .Q(d_ff_Yn[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(n627), .CK(clk), .RN(n1277), .Q(d_ff_Yn[25]), .QN(n1238) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(n625), .CK(clk), .RN(n1276), .Q(d_ff_Yn[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(n624), .CK(clk), .RN(n1279), .Q(d_ff_Yn[28]) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(n623), .CK(clk), .RN(n1277), .Q(d_ff_Yn[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(n622), .CK(clk), .RN(n1275), .Q(d_ff_Yn[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(n621), .CK(clk), .RN(n1277), .Q(d_ff_Yn[31]), .QN(n1240) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(n588), .CK(clk), .RN(n1279), .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(n586), .CK(clk), .RN(n1278), .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(n584), .CK(clk), .RN(n1278), .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(n582), .CK(clk), .RN(n1276), .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(n580), .CK(clk), .RN(n1277), .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(n578), .CK(clk), .RN(n1280), .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(n576), .CK(clk), .RN(n1275), .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(n574), .CK(clk), .RN(n1277), .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(n572), .CK(clk), .RN(n1275), .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(n570), .CK(clk), .RN(n1276), .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(n568), .CK(clk), .RN(n1277), .Q(
        sign_inv_out[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(n566), .CK(clk), .RN(n1279), .Q(
        sign_inv_out[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(n564), .CK(clk), .RN(n1278), .Q(
        sign_inv_out[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(n562), .CK(clk), .RN(n1277), .Q(
        sign_inv_out[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(n560), .CK(clk), .RN(n1274), .Q(
        sign_inv_out[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(n558), .CK(clk), .RN(n1249), .Q(
        sign_inv_out[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(n556), .CK(clk), .RN(n1250), .Q(
        sign_inv_out[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(n554), .CK(clk), .RN(n1273), .Q(
        sign_inv_out[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(n552), .CK(clk), .RN(n1262), .Q(
        sign_inv_out[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(n550), .CK(clk), .RN(n1273), .Q(
        sign_inv_out[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(n548), .CK(clk), .RN(n1262), .Q(
        sign_inv_out[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(n546), .CK(clk), .RN(n1273), .Q(
        sign_inv_out[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(n544), .CK(clk), .RN(n1262), .Q(
        sign_inv_out[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(n542), .CK(clk), .RN(n1262), .Q(
        sign_inv_out[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(n540), .CK(clk), .RN(n1267), .Q(
        sign_inv_out[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(n538), .CK(clk), .RN(n1268), .Q(
        sign_inv_out[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(n536), .CK(clk), .RN(n1264), .Q(
        sign_inv_out[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(n534), .CK(clk), .RN(n1268), .Q(
        sign_inv_out[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(n532), .CK(clk), .RN(n1276), .Q(
        sign_inv_out[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(n530), .CK(clk), .RN(n1260), .Q(
        sign_inv_out[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(n528), .CK(clk), .RN(n1265), .Q(
        sign_inv_out[30]) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(n524), .CK(clk), .RN(n1246), .Q(
        d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n522), .CK(clk), .RN(n1263), .Q(
        d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n521), .CK(clk), .RN(n1242), .Q(
        d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(n520), .CK(clk), .RN(n1243), .Q(
        d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(n519), .CK(clk), .RN(n1246), .Q(
        d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n517), .CK(clk), .RN(n1263), .Q(
        d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n516), .CK(clk), .RN(n1242), .Q(
        d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n515), .CK(clk), .RN(n1243), .Q(
        d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n514), .CK(clk), .RN(n1246), .Q(
        d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n512), .CK(clk), .RN(n1263), .QN(n808) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n511), .CK(clk), .RN(n1242), .Q(
        d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(n510), .CK(clk), .RN(n1243), .Q(
        d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n509), .CK(clk), .RN(n1246), .Q(
        d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_17_ ( .D(n507), .CK(clk), .RN(n1263), .Q(
        d_ff3_LUT_out[17]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(n506), .CK(clk), .RN(n1242), .Q(
        d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n505), .CK(clk), .RN(n1243), .Q(
        d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(n504), .CK(clk), .RN(n1244), .Q(
        d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n503), .CK(clk), .RN(n1244), .Q(
        d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(n502), .CK(clk), .RN(n1244), .Q(
        d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n501), .CK(clk), .RN(n1244), .Q(
        d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n500), .CK(clk), .RN(n1244), .Q(
        d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(n499), .CK(clk), .RN(n1244), .Q(
        d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n498), .CK(clk), .RN(n1244), .Q(
        d_ff3_LUT_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(n409), .CK(clk), .RN(n1244), .Q(
        d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(n408), .CK(clk), .RN(n1244), .Q(
        d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(n407), .CK(clk), .RN(n1245), .Q(
        d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(n406), .CK(clk), .RN(n1241), .Q(
        d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(n405), .CK(clk), .RN(n1245), .Q(
        d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(n404), .CK(clk), .RN(n1241), .Q(
        d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(n403), .CK(clk), .RN(n1260), .Q(
        d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(n402), .CK(clk), .RN(n1260), .Q(
        d_ff3_sh_y_out[30]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(n345), .CK(clk), .RN(n1261), .Q(
        d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(n344), .CK(clk), .RN(n1241), .Q(
        d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(n343), .CK(clk), .RN(n1245), .Q(
        d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(n342), .CK(clk), .RN(n1245), .Q(
        d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(n341), .CK(clk), .RN(n1246), .Q(
        d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(n340), .CK(clk), .RN(n1247), .QN(n807)
         );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(n339), .CK(clk), .RN(n1263), .QN(n802)
         );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(n338), .CK(clk), .RN(n1242), .Q(
        d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(n496), .CK(clk), .RN(n1243), .Q(
        d_ff2_Z[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(n495), .CK(clk), .RN(n1246), .Q(
        d_ff2_Z[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(n493), .CK(clk), .RN(n1263), .Q(
        d_ff2_Z[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(n492), .CK(clk), .RN(n1242), .Q(
        d_ff2_Z[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(n491), .CK(clk), .RN(n1243), .Q(
        d_ff2_Z[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(n490), .CK(clk), .RN(n1246), .Q(
        d_ff2_Z[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(n489), .CK(clk), .RN(n1247), .Q(
        d_ff2_Z[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(n488), .CK(clk), .RN(n1263), .Q(
        d_ff2_Z[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(n487), .CK(clk), .RN(n1242), .Q(
        d_ff2_Z[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(n486), .CK(clk), .RN(n1243), .Q(
        d_ff2_Z[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(n485), .CK(clk), .RN(n1246), .Q(
        d_ff2_Z[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(n484), .CK(clk), .RN(n1247), .Q(
        d_ff2_Z[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(n483), .CK(clk), .RN(n1263), .Q(
        d_ff2_Z[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(n482), .CK(clk), .RN(n1242), .Q(
        d_ff2_Z[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(n481), .CK(clk), .RN(n1243), .Q(
        d_ff2_Z[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(n480), .CK(clk), .RN(n1254), .Q(
        d_ff2_Z[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(n479), .CK(clk), .RN(n1251), .Q(
        d_ff2_Z[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(n478), .CK(clk), .RN(n1254), .Q(
        d_ff2_Z[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(n477), .CK(clk), .RN(n1251), .Q(
        d_ff2_Z[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(n476), .CK(clk), .RN(n806), .Q(
        d_ff2_Z[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(n470), .CK(clk), .RN(n1274), .Q(
        d_ff2_Z[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(n469), .CK(clk), .RN(n1249), .Q(
        d_ff2_Z[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(n466), .CK(clk), .RN(n1249), .Q(
        d_ff2_Z[30]) );
  DFFRX1TS reg_sign_Q_reg_0_ ( .D(n464), .CK(clk), .RN(n1274), .Q(
        d_ff3_sign_out) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(n462), .CK(clk), .RN(n1250), .Q(
        d_ff3_sh_y_out[0]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(n460), .CK(clk), .RN(n1274), .Q(
        d_ff3_sh_y_out[1]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(n458), .CK(clk), .RN(n1249), .Q(
        d_ff3_sh_y_out[2]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(n456), .CK(clk), .RN(n1250), .Q(
        d_ff3_sh_y_out[3]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(n454), .CK(clk), .RN(n1274), .Q(
        d_ff3_sh_y_out[4]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(n452), .CK(clk), .RN(n1249), .Q(
        d_ff3_sh_y_out[5]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(n450), .CK(clk), .RN(n1255), .Q(
        d_ff3_sh_y_out[6]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(n448), .CK(clk), .RN(n1256), .Q(
        d_ff3_sh_y_out[7]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(n446), .CK(clk), .RN(n1253), .Q(
        d_ff3_sh_y_out[8]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(n444), .CK(clk), .RN(n1252), .Q(
        d_ff3_sh_y_out[9]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(n442), .CK(clk), .RN(n1254), .Q(
        d_ff3_sh_y_out[10]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(n440), .CK(clk), .RN(n1251), .Q(
        d_ff3_sh_y_out[11]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(n438), .CK(clk), .RN(n806), .Q(
        d_ff3_sh_y_out[12]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(n436), .CK(clk), .RN(n1248), .Q(
        d_ff3_sh_y_out[13]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(n434), .CK(clk), .RN(n1253), .Q(
        d_ff3_sh_y_out[14]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(n432), .CK(clk), .RN(n1252), .Q(
        d_ff3_sh_y_out[15]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(n430), .CK(clk), .RN(n1255), .Q(
        d_ff3_sh_y_out[16]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(n428), .CK(clk), .RN(n1256), .Q(
        d_ff3_sh_y_out[17]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(n426), .CK(clk), .RN(n1253), .Q(
        d_ff3_sh_y_out[18]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(n424), .CK(clk), .RN(n1252), .Q(
        d_ff3_sh_y_out[19]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(n422), .CK(clk), .RN(n1251), .Q(
        d_ff3_sh_y_out[20]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(n420), .CK(clk), .RN(n1253), .Q(
        d_ff3_sh_y_out[21]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(n418), .CK(clk), .RN(n1252), .Q(
        d_ff3_sh_y_out[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(n412), .CK(clk), .RN(n1254), .Q(
        d_ff2_Y[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(n410), .CK(clk), .RN(n1256), .Q(
        d_ff2_Y[30]), .QN(n1211) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(n400), .CK(clk), .RN(n1253), .Q(
        d_ff3_sh_y_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(n398), .CK(clk), .RN(n1252), .Q(
        d_ff3_sh_x_out[0]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(n396), .CK(clk), .RN(n1254), .Q(
        d_ff3_sh_x_out[1]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(n394), .CK(clk), .RN(n1255), .Q(
        d_ff3_sh_x_out[2]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(n392), .CK(clk), .RN(n1251), .Q(
        d_ff3_sh_x_out[3]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(n390), .CK(clk), .RN(n806), .Q(
        d_ff3_sh_x_out[4]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(n388), .CK(clk), .RN(n1248), .Q(
        d_ff3_sh_x_out[5]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(n386), .CK(clk), .RN(n1255), .Q(
        d_ff3_sh_x_out[6]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(n384), .CK(clk), .RN(n1256), .Q(
        d_ff3_sh_x_out[7]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(n382), .CK(clk), .RN(n1257), .Q(
        d_ff3_sh_x_out[8]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(n380), .CK(clk), .RN(n1257), .Q(
        d_ff3_sh_x_out[9]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(n378), .CK(clk), .RN(n1257), .Q(
        d_ff3_sh_x_out[10]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(n376), .CK(clk), .RN(n1257), .Q(
        d_ff3_sh_x_out[11]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(n374), .CK(clk), .RN(n1257), .Q(
        d_ff3_sh_x_out[12]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(n372), .CK(clk), .RN(n1258), .Q(
        d_ff3_sh_x_out[13]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(n370), .CK(clk), .RN(n1258), .Q(
        d_ff3_sh_x_out[14]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(n368), .CK(clk), .RN(n1258), .Q(
        d_ff3_sh_x_out[15]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(n366), .CK(clk), .RN(n1258), .Q(
        d_ff3_sh_x_out[16]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(n364), .CK(clk), .RN(n1258), .Q(
        d_ff3_sh_x_out[17]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(n362), .CK(clk), .RN(n1272), .Q(
        d_ff3_sh_x_out[18]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(n360), .CK(clk), .RN(n1273), .Q(
        d_ff3_sh_x_out[19]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(n358), .CK(clk), .RN(n1259), .Q(
        d_ff3_sh_x_out[20]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(n356), .CK(clk), .RN(n1262), .Q(
        d_ff3_sh_x_out[21]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(n354), .CK(clk), .RN(n1272), .Q(
        d_ff3_sh_x_out[22]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(n336), .CK(clk), .RN(n1260), .Q(
        d_ff3_sh_x_out[31]) );
  DFFRX2TS cordic_FSM_state_reg_reg_0_ ( .D(n730), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[0]), .QN(n1213) );
  DFFRX1TS cont_var_count_reg_0_ ( .D(n724), .CK(clk), .RN(n1245), .Q(
        cont_var_out[0]), .QN(n1208) );
  DFFRX1TS reg_ch_mux_2_Q_reg_0_ ( .D(n686), .CK(clk), .RN(n1260), .Q(
        sel_mux_2_reg[0]), .QN(n1205) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(n587), .CK(clk), .RN(n1275), .Q(
        data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(n585), .CK(clk), .RN(n1276), .Q(
        data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(n583), .CK(clk), .RN(n1275), .Q(
        data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(n581), .CK(clk), .RN(n1280), .Q(
        data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(n579), .CK(clk), .RN(n1280), .Q(
        data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(n577), .CK(clk), .RN(n1280), .Q(
        data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(n575), .CK(clk), .RN(n1280), .Q(
        data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(n573), .CK(clk), .RN(n1279), .Q(
        data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(n571), .CK(clk), .RN(n1278), .Q(
        data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(n569), .CK(clk), .RN(n1276), .Q(
        data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(n567), .CK(clk), .RN(n1275), .Q(
        data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(n565), .CK(clk), .RN(n1278), .Q(
        data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(n563), .CK(clk), .RN(n1276), .Q(
        data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(n561), .CK(clk), .RN(n1275), .Q(
        data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(n559), .CK(clk), .RN(n1250), .Q(
        data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(n557), .CK(clk), .RN(n1274), .Q(
        data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(n555), .CK(clk), .RN(n1249), .Q(
        data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(n553), .CK(clk), .RN(n1259), .Q(
        data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(n551), .CK(clk), .RN(n1262), .Q(
        data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(n549), .CK(clk), .RN(n1272), .Q(
        data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(n547), .CK(clk), .RN(n1262), .Q(
        data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(n545), .CK(clk), .RN(n1272), .Q(
        data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(n543), .CK(clk), .RN(n1273), .Q(
        data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(n541), .CK(clk), .RN(n1259), .Q(
        data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(n539), .CK(clk), .RN(n1264), .Q(
        data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(n537), .CK(clk), .RN(n1266), .Q(
        data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(n535), .CK(clk), .RN(n1268), .Q(
        data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(n533), .CK(clk), .RN(n1269), .Q(
        data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(n531), .CK(clk), .RN(n1250), .Q(
        data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(n529), .CK(clk), .RN(n1265), .Q(
        data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(n527), .CK(clk), .RN(n1265), .Q(
        data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(n525), .CK(clk), .RN(n1241), .Q(
        data_output[31]) );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n725), .CK(clk), .RN(n1260), .Q(
        cont_iter_out[3]), .QN(n1204) );
  DFFRX4TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n331), .Q(cordic_FSM_state_reg[1]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_27_ ( .D(n349), .CK(clk), .RN(n1265), .Q(
        d_ff2_X[27]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_24_ ( .D(n352), .CK(clk), .RN(n1245), .Q(
        d_ff2_X[24]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(n347), .CK(clk), .RN(n1261), .Q(
        d_ff2_X[29]) );
  DFFRX1TS reg_LUT_Q_reg_27_ ( .D(n497), .CK(clk), .RN(n1244), .Q(
        d_ff3_LUT_out[27]) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n685), .CK(clk), .RN(n1265), .Q(
        sel_mux_2_reg[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_28_ ( .D(n348), .CK(clk), .RN(n1260), .Q(
        d_ff2_X[28]) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(n722), .CK(clk), .RN(n1245), .Q(
        d_ff1_shift_region_flag_out[0]), .QN(n1212) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(n721), .CK(clk), .RN(n1265), .Q(
        d_ff1_shift_region_flag_out[1]), .QN(n1207) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(n416), .CK(clk), .RN(n806), .Q(
        d_ff2_Y[24]), .QN(n799) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(n350), .CK(clk), .RN(n1265), .Q(
        d_ff2_X[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(n414), .CK(clk), .RN(n1248), .Q(
        d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(n415), .CK(clk), .RN(n806), .Q(
        d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_31_ ( .D(n465), .CK(clk), .RN(n1250), .Q(
        d_ff2_Z[31]) );
  DFFRX1TS reg_ch_mux_3_Q_reg_0_ ( .D(n688), .CK(clk), .RN(n1241), .Q(
        sel_mux_3_reg) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_23_ ( .D(n353), .CK(clk), .RN(n1245), .Q(
        d_ff2_X[23]), .QN(n1214) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_30_ ( .D(n346), .CK(clk), .RN(n1241), .Q(
        d_ff2_X[30]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(n413), .CK(clk), .RN(n1248), .Q(
        d_ff2_Y[27]), .QN(n1209) );
  DFFRX1TS reg_ch_mux_1_Q_reg_0_ ( .D(n687), .CK(clk), .RN(n1265), .Q(
        sel_mux_1_reg) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_31_ ( .D(n401), .CK(clk), .RN(n1256), .Q(
        d_ff2_Y[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_22_ ( .D(n419), .CK(clk), .RN(n1255), .Q(
        d_ff2_Y[22]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_21_ ( .D(n421), .CK(clk), .RN(n1256), .Q(
        d_ff2_Y[21]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_20_ ( .D(n423), .CK(clk), .RN(n1248), .Q(
        d_ff2_Y[20]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_19_ ( .D(n425), .CK(clk), .RN(n1255), .Q(
        d_ff2_Y[19]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_18_ ( .D(n427), .CK(clk), .RN(n1256), .Q(
        d_ff2_Y[18]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_17_ ( .D(n429), .CK(clk), .RN(n1253), .Q(
        d_ff2_Y[17]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_16_ ( .D(n431), .CK(clk), .RN(n1252), .Q(
        d_ff2_Y[16]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_15_ ( .D(n433), .CK(clk), .RN(n1255), .Q(
        d_ff2_Y[15]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_14_ ( .D(n435), .CK(clk), .RN(n1256), .Q(
        d_ff2_Y[14]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_13_ ( .D(n437), .CK(clk), .RN(n1253), .Q(
        d_ff2_Y[13]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_12_ ( .D(n439), .CK(clk), .RN(n1252), .Q(
        d_ff2_Y[12]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_11_ ( .D(n441), .CK(clk), .RN(n806), .Q(
        d_ff2_Y[11]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_10_ ( .D(n443), .CK(clk), .RN(n1254), .Q(
        d_ff2_Y[10]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_9_ ( .D(n445), .CK(clk), .RN(n806), .Q(
        d_ff2_Y[9]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_8_ ( .D(n447), .CK(clk), .RN(n1248), .Q(
        d_ff2_Y[8]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_7_ ( .D(n449), .CK(clk), .RN(n1255), .Q(
        d_ff2_Y[7]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_6_ ( .D(n451), .CK(clk), .RN(n1256), .Q(
        d_ff2_Y[6]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_5_ ( .D(n453), .CK(clk), .RN(n1274), .Q(
        d_ff2_Y[5]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_4_ ( .D(n455), .CK(clk), .RN(n1249), .Q(
        d_ff2_Y[4]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_3_ ( .D(n457), .CK(clk), .RN(n1250), .Q(
        d_ff2_Y[3]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_2_ ( .D(n459), .CK(clk), .RN(n1274), .Q(
        d_ff2_Y[2]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_1_ ( .D(n461), .CK(clk), .RN(n1249), .Q(
        d_ff2_Y[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_0_ ( .D(n463), .CK(clk), .RN(n1250), .Q(
        d_ff2_Y[0]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_20_ ( .D(n359), .CK(clk), .RN(n1273), .Q(
        d_ff2_X[20]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_19_ ( .D(n361), .CK(clk), .RN(n1272), .Q(
        d_ff2_X[19]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_17_ ( .D(n365), .CK(clk), .RN(n1258), .Q(
        d_ff2_X[17]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_16_ ( .D(n367), .CK(clk), .RN(n1258), .Q(
        d_ff2_X[16]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_14_ ( .D(n371), .CK(clk), .RN(n1258), .Q(
        d_ff2_X[14]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_13_ ( .D(n373), .CK(clk), .RN(n1258), .Q(
        d_ff2_X[13]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_12_ ( .D(n375), .CK(clk), .RN(n1257), .Q(
        d_ff2_X[12]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_10_ ( .D(n379), .CK(clk), .RN(n1257), .Q(
        d_ff2_X[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_7_ ( .D(n385), .CK(clk), .RN(n1253), .Q(
        d_ff2_X[7]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_6_ ( .D(n387), .CK(clk), .RN(n1252), .Q(
        d_ff2_X[6]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_5_ ( .D(n389), .CK(clk), .RN(n806), .Q(
        d_ff2_X[5]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_3_ ( .D(n393), .CK(clk), .RN(n1248), .Q(
        d_ff2_X[3]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_2_ ( .D(n395), .CK(clk), .RN(n1253), .Q(
        d_ff2_X[2]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_1_ ( .D(n397), .CK(clk), .RN(n1252), .Q(
        d_ff2_X[1]) );
  DFFRX1TS d_ff4_Xn_Q_reg_25_ ( .D(n595), .CK(clk), .RN(n1269), .Q(d_ff_Xn[25]) );
  DFFRX1TS d_ff4_Xn_Q_reg_27_ ( .D(n593), .CK(clk), .RN(n1271), .Q(d_ff_Xn[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_22_ ( .D(n355), .CK(clk), .RN(n1259), .Q(
        d_ff2_X[22]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_21_ ( .D(n357), .CK(clk), .RN(n1262), .Q(
        d_ff2_X[21]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_18_ ( .D(n363), .CK(clk), .RN(n1273), .Q(
        d_ff2_X[18]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_15_ ( .D(n369), .CK(clk), .RN(n1258), .Q(
        d_ff2_X[15]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_11_ ( .D(n377), .CK(clk), .RN(n1257), .Q(
        d_ff2_X[11]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_9_ ( .D(n381), .CK(clk), .RN(n1257), .Q(
        d_ff2_X[9]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_8_ ( .D(n383), .CK(clk), .RN(n1257), .Q(
        d_ff2_X[8]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_4_ ( .D(n391), .CK(clk), .RN(n1255), .Q(
        d_ff2_X[4]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_0_ ( .D(n399), .CK(clk), .RN(n1251), .Q(
        d_ff2_X[0]) );
  DFFRX1TS d_ff4_Xn_Q_reg_31_ ( .D(n589), .CK(clk), .RN(n1260), .Q(d_ff_Xn[31]) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n729), .CK(clk), .RN(n1261), .Q(
        cont_var_out[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(n411), .CK(clk), .RN(n1254), .Q(
        d_ff2_Y[29]), .QN(n1210) );
  DFFRX1TS d_ff4_Xn_Q_reg_10_ ( .D(n610), .CK(clk), .RN(n1278), .Q(d_ff_Xn[10]) );
  DFFRX1TS d_ff4_Xn_Q_reg_0_ ( .D(n620), .CK(clk), .RN(n1278), .Q(d_ff_Xn[0])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_1_ ( .D(n651), .CK(clk), .RN(n1267), .Q(d_ff_Yn[1]), 
        .QN(n1216) );
  DFFRX1TS d_ff4_Yn_Q_reg_14_ ( .D(n638), .CK(clk), .RN(n1267), .Q(d_ff_Yn[14]), .QN(n1229) );
  DFFRX1TS d_ff4_Yn_Q_reg_7_ ( .D(n645), .CK(clk), .RN(n1267), .Q(d_ff_Yn[7]), 
        .QN(n1222) );
  DFFRX1TS reg_LUT_Q_reg_16_ ( .D(n508), .CK(clk), .RN(n1247), .Q(
        d_ff3_LUT_out[16]) );
  DFFRX1TS reg_LUT_Q_reg_11_ ( .D(n513), .CK(clk), .RN(n1247), .Q(
        d_ff3_LUT_out[11]) );
  DFFRX1TS reg_LUT_Q_reg_6_ ( .D(n518), .CK(clk), .RN(n1247), .Q(
        d_ff3_LUT_out[6]) );
  DFFRX1TS reg_LUT_Q_reg_1_ ( .D(n523), .CK(clk), .RN(n1247), .Q(
        d_ff3_LUT_out[1]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_2_ ( .D(n494), .CK(clk), .RN(n1247), .Q(
        d_ff2_Z[2]) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(n723), .CK(clk), .RN(n1245), .Q(
        d_ff1_operation_out), .QN(n1203) );
  DFFRX1TS d_ff4_Xn_Q_reg_1_ ( .D(n619), .CK(clk), .RN(n1277), .Q(d_ff_Xn[1])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_2_ ( .D(n618), .CK(clk), .RN(n1279), .Q(d_ff_Xn[2])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_3_ ( .D(n617), .CK(clk), .RN(n1275), .Q(d_ff_Xn[3])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_5_ ( .D(n615), .CK(clk), .RN(n1275), .Q(d_ff_Xn[5])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_6_ ( .D(n614), .CK(clk), .RN(n1278), .Q(d_ff_Xn[6])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_7_ ( .D(n613), .CK(clk), .RN(n1279), .Q(d_ff_Xn[7])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_12_ ( .D(n608), .CK(clk), .RN(n1275), .Q(d_ff_Xn[12]) );
  DFFRX1TS d_ff4_Xn_Q_reg_13_ ( .D(n607), .CK(clk), .RN(n1279), .Q(d_ff_Xn[13]) );
  DFFRX1TS d_ff4_Xn_Q_reg_14_ ( .D(n606), .CK(clk), .RN(n1249), .Q(d_ff_Xn[14]) );
  DFFRX1TS d_ff4_Xn_Q_reg_16_ ( .D(n604), .CK(clk), .RN(n1274), .Q(d_ff_Xn[16]) );
  DFFRX1TS d_ff4_Xn_Q_reg_17_ ( .D(n603), .CK(clk), .RN(n1249), .Q(d_ff_Xn[17]) );
  DFFRX1TS d_ff4_Xn_Q_reg_19_ ( .D(n601), .CK(clk), .RN(n1259), .Q(d_ff_Xn[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_20_ ( .D(n600), .CK(clk), .RN(n1272), .Q(d_ff_Xn[20]) );
  DFFRX1TS d_ff4_Xn_Q_reg_24_ ( .D(n596), .CK(clk), .RN(n1270), .Q(d_ff_Xn[24]) );
  DFFRX1TS d_ff4_Xn_Q_reg_26_ ( .D(n594), .CK(clk), .RN(n1266), .Q(d_ff_Xn[26]) );
  DFFRX1TS d_ff4_Xn_Q_reg_28_ ( .D(n592), .CK(clk), .RN(n1266), .Q(d_ff_Xn[28]) );
  DFFRX1TS d_ff4_Xn_Q_reg_29_ ( .D(n591), .CK(clk), .RN(n1241), .Q(d_ff_Xn[29]) );
  DFFRX1TS d_ff4_Xn_Q_reg_4_ ( .D(n616), .CK(clk), .RN(n1279), .Q(d_ff_Xn[4])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_8_ ( .D(n612), .CK(clk), .RN(n1277), .Q(d_ff_Xn[8])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_9_ ( .D(n611), .CK(clk), .RN(n1279), .Q(d_ff_Xn[9])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_11_ ( .D(n609), .CK(clk), .RN(n1277), .Q(d_ff_Xn[11]) );
  DFFRX1TS d_ff4_Xn_Q_reg_15_ ( .D(n605), .CK(clk), .RN(n1250), .Q(d_ff_Xn[15]) );
  DFFRX1TS d_ff4_Xn_Q_reg_18_ ( .D(n602), .CK(clk), .RN(n1272), .Q(d_ff_Xn[18]) );
  DFFRX1TS d_ff4_Xn_Q_reg_21_ ( .D(n599), .CK(clk), .RN(n1259), .Q(d_ff_Xn[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_22_ ( .D(n598), .CK(clk), .RN(n1272), .Q(d_ff_Xn[22]) );
  DFFRX1TS d_ff4_Xn_Q_reg_30_ ( .D(n590), .CK(clk), .RN(n1241), .Q(d_ff_Xn[30]) );
  DFFRX1TS d_ff4_Xn_Q_reg_23_ ( .D(n597), .CK(clk), .RN(n1259), .Q(d_ff_Xn[23]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_31_ ( .D(n337), .CK(clk), .RN(n1241), .Q(
        d_ff2_X[31]) );
  DFFRX1TS d_ff4_Yn_Q_reg_26_ ( .D(n626), .CK(clk), .RN(n1276), .Q(d_ff_Yn[26]), .QN(n1239) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_23_ ( .D(n417), .CK(clk), .RN(n1251), .Q(
        d_ff2_Y[23]), .QN(n801) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_25_ ( .D(n471), .CK(clk), .RN(n1252), .Q(
        d_ff2_Z[25]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_28_ ( .D(n468), .CK(clk), .RN(n1250), .Q(
        d_ff2_Z[28]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_29_ ( .D(n467), .CK(clk), .RN(n1274), .Q(
        d_ff2_Z[29]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_23_ ( .D(n473), .CK(clk), .RN(n1256), .Q(
        d_ff2_Z[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_24_ ( .D(n472), .CK(clk), .RN(n1253), .Q(
        d_ff2_Z[24]) );
  DFFRX4TS cordic_FSM_state_reg_reg_2_ ( .D(n731), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[2]), .QN(n1202) );
  DFFRX1TS d_ff5_Q_reg_31_ ( .D(n526), .CK(clk), .RN(n1261), .Q(
        data_output2_31_) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_21_ ( .D(n475), .CK(clk), .RN(n1248), .Q(
        d_ff2_Z[21]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_22_ ( .D(n474), .CK(clk), .RN(n1255), .Q(
        d_ff2_Z[22]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(n351), .CK(clk), .RN(n1261), .Q(
        d_ff2_X[25]), .QN(n800) );
  DFFRX2TS cordic_FSM_state_reg_reg_3_ ( .D(n732), .CK(clk), .RN(n331), .Q(
        cordic_FSM_state_reg[3]), .QN(n1206) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(n720), .CK(clk), .RN(n1261), .Q(d_ff1_Z[0]) );
  DFFRX2TS cont_iter_count_reg_1_ ( .D(n727), .CK(clk), .RN(n1265), .Q(
        cont_iter_out[1]), .QN(n798) );
  CLKBUFX2TS U795 ( .A(n813), .Y(n1019) );
  OAI32X1TS U796 ( .A0(n1191), .A1(n1104), .A2(n867), .B0(n1109), .B1(n1191), 
        .Y(n822) );
  AOI222X1TS U797 ( .A0(n1198), .A1(d_ff2_Z[27]), .B0(n1009), .B1(d_ff1_Z[27]), 
        .C0(d_ff_Zn[27]), .C1(n1199), .Y(n998) );
  AOI222X1TS U798 ( .A0(d_ff2_Z[1]), .A1(n951), .B0(d_ff2_Y[1]), .B1(n1023), 
        .C0(d_ff2_X[1]), .C1(n953), .Y(n877) );
  AOI222X1TS U799 ( .A0(d_ff2_Z[3]), .A1(n960), .B0(d_ff2_Y[3]), .B1(n956), 
        .C0(d_ff2_X[3]), .C1(n876), .Y(n859) );
  AOI222X1TS U800 ( .A0(d_ff2_Z[4]), .A1(n960), .B0(d_ff2_Y[4]), .B1(n956), 
        .C0(d_ff2_X[4]), .C1(n876), .Y(n852) );
  AOI222X1TS U801 ( .A0(d_ff2_Z[5]), .A1(n960), .B0(d_ff2_Y[5]), .B1(n956), 
        .C0(d_ff2_X[5]), .C1(n876), .Y(n858) );
  AOI222X1TS U802 ( .A0(d_ff2_Z[6]), .A1(n960), .B0(d_ff2_Y[6]), .B1(n956), 
        .C0(d_ff2_X[6]), .C1(n876), .Y(n851) );
  AOI222X1TS U803 ( .A0(d_ff2_Z[7]), .A1(n960), .B0(d_ff2_Y[7]), .B1(n974), 
        .C0(d_ff2_X[7]), .C1(n876), .Y(n855) );
  AOI222X1TS U804 ( .A0(d_ff2_Z[9]), .A1(n960), .B0(d_ff2_Y[9]), .B1(n956), 
        .C0(d_ff2_X[9]), .C1(n876), .Y(n854) );
  AOI222X1TS U805 ( .A0(d_ff2_Z[8]), .A1(n966), .B0(d_ff2_Y[8]), .B1(n956), 
        .C0(d_ff2_X[8]), .C1(n876), .Y(n853) );
  AOI222X1TS U806 ( .A0(d_ff2_Z[11]), .A1(n966), .B0(d_ff2_Y[11]), .B1(n956), 
        .C0(d_ff2_X[11]), .C1(n876), .Y(n856) );
  AOI222X1TS U807 ( .A0(d_ff2_Z[12]), .A1(n966), .B0(d_ff2_Y[12]), .B1(n956), 
        .C0(d_ff2_X[12]), .C1(n876), .Y(n878) );
  AOI222X1TS U808 ( .A0(d_ff2_Z[10]), .A1(n960), .B0(d_ff2_Y[10]), .B1(n956), 
        .C0(d_ff2_X[10]), .C1(n965), .Y(n957) );
  AOI222X1TS U809 ( .A0(d_ff2_Z[13]), .A1(n966), .B0(d_ff2_Y[13]), .B1(n956), 
        .C0(d_ff2_X[13]), .C1(n965), .Y(n954) );
  AOI222X1TS U810 ( .A0(d_ff2_Z[14]), .A1(n966), .B0(d_ff2_Y[14]), .B1(n974), 
        .C0(d_ff2_X[14]), .C1(n965), .Y(n967) );
  AOI222X1TS U811 ( .A0(d_ff2_Z[15]), .A1(n966), .B0(d_ff2_Y[15]), .B1(n974), 
        .C0(d_ff2_X[15]), .C1(n965), .Y(n963) );
  AOI222X1TS U812 ( .A0(d_ff2_Z[16]), .A1(n966), .B0(d_ff2_Y[16]), .B1(n974), 
        .C0(d_ff2_X[16]), .C1(n965), .Y(n955) );
  AOI222X1TS U813 ( .A0(d_ff2_Z[17]), .A1(n966), .B0(d_ff2_Y[17]), .B1(n974), 
        .C0(d_ff2_X[17]), .C1(n965), .Y(n958) );
  AOI222X1TS U814 ( .A0(d_ff2_Z[18]), .A1(n966), .B0(d_ff2_Y[18]), .B1(n974), 
        .C0(d_ff2_X[18]), .C1(n965), .Y(n962) );
  AOI222X1TS U815 ( .A0(d_ff2_Z[19]), .A1(n966), .B0(d_ff2_Y[19]), .B1(n974), 
        .C0(d_ff2_X[19]), .C1(n965), .Y(n964) );
  AOI222X1TS U816 ( .A0(d_ff2_Z[0]), .A1(n975), .B0(d_ff2_Y[0]), .B1(n971), 
        .C0(d_ff2_X[0]), .C1(n973), .Y(n972) );
  AOI222X1TS U817 ( .A0(d_ff2_Z[20]), .A1(n975), .B0(d_ff2_Y[20]), .B1(n974), 
        .C0(d_ff2_X[20]), .C1(n973), .Y(n968) );
  AOI222X1TS U818 ( .A0(d_ff2_Z[26]), .A1(n975), .B0(d_ff2_Y[26]), .B1(n974), 
        .C0(d_ff2_X[26]), .C1(n973), .Y(n976) );
  AOI222X1TS U819 ( .A0(d_ff3_LUT_out[2]), .A1(n969), .B0(n1027), .B1(
        d_ff3_sh_x_out[2]), .C0(n973), .C1(d_ff3_sh_y_out[2]), .Y(n924) );
  AOI222X1TS U820 ( .A0(d_ff3_LUT_out[0]), .A1(n969), .B0(n1027), .B1(
        d_ff3_sh_x_out[0]), .C0(n973), .C1(d_ff3_sh_y_out[0]), .Y(n923) );
  AOI222X1TS U821 ( .A0(d_ff3_LUT_out[23]), .A1(n975), .B0(d_ff3_sh_y_out[23]), 
        .B1(n973), .C0(d_ff3_sh_x_out[23]), .C1(n1023), .Y(n921) );
  AOI222X1TS U822 ( .A0(d_ff3_LUT_out[24]), .A1(n975), .B0(d_ff3_sh_y_out[24]), 
        .B1(n973), .C0(d_ff3_sh_x_out[24]), .C1(n1023), .Y(n922) );
  AOI222X1TS U823 ( .A0(d_ff3_sh_x_out[25]), .A1(n971), .B0(d_ff3_LUT_out[25]), 
        .B1(n951), .C0(n950), .C1(d_ff3_sh_y_out[25]), .Y(n946) );
  NOR2XLTS U824 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n816) );
  CLKBUFX3TS U825 ( .A(n1195), .Y(n1129) );
  NAND3XLTS U826 ( .A(n1022), .B(n1177), .C(n1021), .Y(
        cordic_FSM_state_next_1_) );
  INVX4TS U827 ( .A(n809), .Y(n1110) );
  INVX4TS U828 ( .A(n811), .Y(n1181) );
  INVX1TS U829 ( .A(n810), .Y(n1089) );
  AO22XLTS U830 ( .A0(n1158), .A1(n1147), .B0(n1160), .B1(d_ff3_sh_y_out[26]), 
        .Y(n406) );
  ADDFX1TS U831 ( .A(n1204), .B(d_ff2_X[26]), .CI(n1183), .CO(n1188), .S(n1182) );
  INVX2TS U832 ( .A(n1159), .Y(n1007) );
  INVX2TS U833 ( .A(n1159), .Y(n1199) );
  OAI211X2TS U834 ( .A0(n1181), .A1(n867), .B0(n1193), .C0(n1114), .Y(n1115)
         );
  AO22XLTS U835 ( .A0(n1158), .A1(d_ff2_Y[22]), .B0(n1160), .B1(
        d_ff3_sh_y_out[22]), .Y(n418) );
  AO22XLTS U836 ( .A0(n1133), .A1(d_ff2_Y[21]), .B0(n1200), .B1(
        d_ff3_sh_y_out[21]), .Y(n420) );
  AO22XLTS U837 ( .A0(n1158), .A1(d_ff2_Y[20]), .B0(n1200), .B1(
        d_ff3_sh_y_out[20]), .Y(n422) );
  AO22XLTS U838 ( .A0(n1187), .A1(d_ff2_Y[19]), .B0(n1200), .B1(
        d_ff3_sh_y_out[19]), .Y(n424) );
  AO22XLTS U839 ( .A0(n1201), .A1(d_ff2_Y[18]), .B0(n1200), .B1(
        d_ff3_sh_y_out[18]), .Y(n426) );
  AO22XLTS U840 ( .A0(n1133), .A1(d_ff2_Y[17]), .B0(n1200), .B1(
        d_ff3_sh_y_out[17]), .Y(n428) );
  AO22XLTS U841 ( .A0(n1197), .A1(d_ff2_Y[16]), .B0(n1200), .B1(
        d_ff3_sh_y_out[16]), .Y(n430) );
  AO22XLTS U842 ( .A0(n1133), .A1(d_ff2_Y[15]), .B0(n1200), .B1(
        d_ff3_sh_y_out[15]), .Y(n432) );
  AO22XLTS U843 ( .A0(n1201), .A1(d_ff2_Y[14]), .B0(n1200), .B1(
        d_ff3_sh_y_out[14]), .Y(n434) );
  AO22XLTS U844 ( .A0(n1187), .A1(d_ff2_Y[13]), .B0(n1200), .B1(
        d_ff3_sh_y_out[13]), .Y(n436) );
  AO22XLTS U845 ( .A0(n1201), .A1(d_ff2_Y[11]), .B0(n1131), .B1(
        d_ff3_sh_y_out[11]), .Y(n440) );
  AO22XLTS U846 ( .A0(n1197), .A1(d_ff2_Y[3]), .B0(n1131), .B1(
        d_ff3_sh_y_out[3]), .Y(n456) );
  AO22XLTS U847 ( .A0(n1197), .A1(d_ff2_Y[7]), .B0(n1131), .B1(
        d_ff3_sh_y_out[7]), .Y(n448) );
  AO22XLTS U848 ( .A0(n1201), .A1(d_ff2_Y[8]), .B0(n1131), .B1(
        d_ff3_sh_y_out[8]), .Y(n446) );
  AO22XLTS U849 ( .A0(n1201), .A1(d_ff2_Y[4]), .B0(n1131), .B1(
        d_ff3_sh_y_out[4]), .Y(n454) );
  AO22XLTS U850 ( .A0(n1158), .A1(d_ff2_Y[10]), .B0(n1131), .B1(
        d_ff3_sh_y_out[10]), .Y(n442) );
  ADDFX1TS U851 ( .A(d_ff2_Y[26]), .B(n1204), .CI(n1148), .CO(n1150), .S(n1147) );
  AO22XLTS U852 ( .A0(n1197), .A1(d_ff2_Y[5]), .B0(n1131), .B1(
        d_ff3_sh_y_out[5]), .Y(n452) );
  AO22XLTS U853 ( .A0(n1201), .A1(d_ff2_Y[9]), .B0(n1131), .B1(
        d_ff3_sh_y_out[9]), .Y(n444) );
  NAND2BX2TS U854 ( .AN(n884), .B(sel_mux_3_reg), .Y(n886) );
  NOR2X2TS U855 ( .A(sel_mux_3_reg), .B(n884), .Y(n860) );
  INVX2TS U856 ( .A(n1191), .Y(n1133) );
  INVX2TS U857 ( .A(n1191), .Y(n1187) );
  CLKBUFX3TS U858 ( .A(n1195), .Y(n1119) );
  AOI222X1TS U859 ( .A0(d_ff3_LUT_out[1]), .A1(n969), .B0(n1027), .B1(
        d_ff3_sh_x_out[1]), .C0(n973), .C1(d_ff3_sh_y_out[1]), .Y(n926) );
  ADDFX1TS U860 ( .A(d_ff2_Y[25]), .B(n804), .CI(n1146), .CO(n1148), .S(n1145)
         );
  INVX3TS U861 ( .A(n1191), .Y(n1193) );
  AOI222X1TS U862 ( .A0(d_ff3_LUT_out[6]), .A1(n969), .B0(n1027), .B1(
        d_ff3_sh_x_out[6]), .C0(n948), .C1(d_ff3_sh_y_out[6]), .Y(n941) );
  NOR2X2TS U863 ( .A(sel_mux_1_reg), .B(n1004), .Y(n871) );
  CLKBUFX3TS U864 ( .A(n960), .Y(n951) );
  NAND2X2TS U865 ( .A(n1137), .B(sel_mux_1_reg), .Y(n1159) );
  XOR2XLTS U866 ( .A(n1176), .B(n1175), .Y(n1178) );
  INVX2TS U867 ( .A(n848), .Y(n956) );
  NAND3X2TS U868 ( .A(n1040), .B(cordic_FSM_state_reg[0]), .C(
        cordic_FSM_state_reg[3]), .Y(n884) );
  XOR2XLTS U869 ( .A(data_output2_31_), .B(n826), .Y(n827) );
  INVX2TS U870 ( .A(n1110), .Y(n1104) );
  INVX3TS U871 ( .A(n841), .Y(n937) );
  AND3X2TS U872 ( .A(n1036), .B(n1202), .C(n803), .Y(n812) );
  CLKINVX2TS U873 ( .A(d_ff2_Y[28]), .Y(n1151) );
  OR2X2TS U874 ( .A(n1205), .B(sel_mux_2_reg[1]), .Y(n848) );
  NAND4XLTS U875 ( .A(n1206), .B(cordic_FSM_state_reg[1]), .C(
        cordic_FSM_state_reg[2]), .D(cordic_FSM_state_reg[0]), .Y(n1015) );
  BUFX3TS U876 ( .A(n816), .Y(n1024) );
  BUFX3TS U877 ( .A(n848), .Y(n931) );
  INVX2TS U878 ( .A(n1035), .Y(n1040) );
  OAI21XLTS U879 ( .A0(cont_iter_out[1]), .A1(n1048), .B0(n1057), .Y(n1047) );
  AO22XLTS U880 ( .A0(n1088), .A1(result_add_subt[23]), .B0(n1087), .B1(
        d_ff_Xn[23]), .Y(n597) );
  AO22XLTS U881 ( .A0(n1089), .A1(result_add_subt[30]), .B0(n810), .B1(
        d_ff_Xn[30]), .Y(n590) );
  AO22XLTS U882 ( .A0(n1088), .A1(result_add_subt[22]), .B0(n1087), .B1(
        d_ff_Xn[22]), .Y(n598) );
  AO22XLTS U883 ( .A0(n1088), .A1(result_add_subt[21]), .B0(n1087), .B1(
        d_ff_Xn[21]), .Y(n599) );
  AO22XLTS U884 ( .A0(n1086), .A1(result_add_subt[18]), .B0(n1087), .B1(
        d_ff_Xn[18]), .Y(n602) );
  AO22XLTS U885 ( .A0(n1086), .A1(result_add_subt[15]), .B0(n1085), .B1(
        d_ff_Xn[15]), .Y(n605) );
  AO22XLTS U886 ( .A0(n1086), .A1(result_add_subt[11]), .B0(n1085), .B1(
        d_ff_Xn[11]), .Y(n609) );
  AO22XLTS U887 ( .A0(n1084), .A1(result_add_subt[9]), .B0(n1085), .B1(
        d_ff_Xn[9]), .Y(n611) );
  AO22XLTS U888 ( .A0(n1084), .A1(result_add_subt[8]), .B0(n1085), .B1(
        d_ff_Xn[8]), .Y(n612) );
  AO22XLTS U889 ( .A0(n1084), .A1(result_add_subt[4]), .B0(n1083), .B1(
        d_ff_Xn[4]), .Y(n616) );
  AO22XLTS U890 ( .A0(n1088), .A1(result_add_subt[29]), .B0(n810), .B1(
        d_ff_Xn[29]), .Y(n591) );
  AO22XLTS U891 ( .A0(n1088), .A1(result_add_subt[28]), .B0(n810), .B1(
        d_ff_Xn[28]), .Y(n592) );
  AO22XLTS U892 ( .A0(n1088), .A1(result_add_subt[26]), .B0(n1087), .B1(
        d_ff_Xn[26]), .Y(n594) );
  AO22XLTS U893 ( .A0(n1088), .A1(result_add_subt[24]), .B0(n1087), .B1(
        d_ff_Xn[24]), .Y(n596) );
  AO22XLTS U894 ( .A0(n1088), .A1(result_add_subt[20]), .B0(n1087), .B1(
        d_ff_Xn[20]), .Y(n600) );
  AO22XLTS U895 ( .A0(n1086), .A1(result_add_subt[17]), .B0(n1085), .B1(
        d_ff_Xn[17]), .Y(n603) );
  AO22XLTS U896 ( .A0(n1086), .A1(result_add_subt[16]), .B0(n1085), .B1(
        d_ff_Xn[16]), .Y(n604) );
  AO22XLTS U897 ( .A0(n1086), .A1(result_add_subt[14]), .B0(n1085), .B1(
        d_ff_Xn[14]), .Y(n606) );
  AO22XLTS U898 ( .A0(n1086), .A1(result_add_subt[13]), .B0(n1085), .B1(
        d_ff_Xn[13]), .Y(n607) );
  AO22XLTS U899 ( .A0(n1086), .A1(result_add_subt[12]), .B0(n1085), .B1(
        d_ff_Xn[12]), .Y(n608) );
  AO22XLTS U900 ( .A0(n1084), .A1(result_add_subt[7]), .B0(n1083), .B1(
        d_ff_Xn[7]), .Y(n613) );
  AO22XLTS U901 ( .A0(n1084), .A1(result_add_subt[5]), .B0(n1083), .B1(
        d_ff_Xn[5]), .Y(n615) );
  AO22XLTS U902 ( .A0(n1084), .A1(result_add_subt[3]), .B0(n1083), .B1(
        d_ff_Xn[3]), .Y(n617) );
  AO22XLTS U903 ( .A0(n1084), .A1(result_add_subt[2]), .B0(n1083), .B1(
        d_ff_Xn[2]), .Y(n618) );
  AO22XLTS U904 ( .A0(n1084), .A1(result_add_subt[1]), .B0(n1083), .B1(
        d_ff_Xn[1]), .Y(n619) );
  AO22XLTS U905 ( .A0(n1084), .A1(result_add_subt[0]), .B0(n810), .B1(
        d_ff_Xn[0]), .Y(n620) );
  AO22XLTS U906 ( .A0(n1086), .A1(result_add_subt[10]), .B0(n1085), .B1(
        d_ff_Xn[10]), .Y(n610) );
  AO22XLTS U907 ( .A0(n1088), .A1(result_add_subt[27]), .B0(n1087), .B1(
        d_ff_Xn[27]), .Y(n593) );
  AO22XLTS U908 ( .A0(n1088), .A1(result_add_subt[25]), .B0(n1087), .B1(
        d_ff_Xn[25]), .Y(n595) );
  AO22XLTS U909 ( .A0(d_ff_Xn[30]), .A1(n1173), .B0(d_ff2_X[30]), .B1(n1172), 
        .Y(n346) );
  AO22XLTS U910 ( .A0(d_ff2_X[23]), .A1(n1128), .B0(d_ff_Xn[23]), .B1(n1173), 
        .Y(n353) );
  CLKINVX3TS U911 ( .A(n931), .Y(n943) );
  CLKINVX3TS U912 ( .A(n931), .Y(n1027) );
  CLKINVX3TS U913 ( .A(n848), .Y(n974) );
  CLKINVX3TS U914 ( .A(n931), .Y(n971) );
  INVX2TS U915 ( .A(n1169), .Y(n1172) );
  INVX2TS U916 ( .A(n1169), .Y(n1004) );
  INVX2TS U917 ( .A(d_ff_Yn[30]), .Y(n1140) );
  INVX2TS U918 ( .A(d_ff_Yn[29]), .Y(n1139) );
  INVX2TS U919 ( .A(d_ff_Yn[27]), .Y(n1136) );
  INVX2TS U920 ( .A(d_ff_Yn[24]), .Y(n1135) );
  INVX2TS U921 ( .A(d_ff_Yn[23]), .Y(n1134) );
  AOI222X1TS U922 ( .A0(d_ff2_Z[2]), .A1(n960), .B0(d_ff2_Y[2]), .B1(n1023), 
        .C0(d_ff2_X[2]), .C1(n876), .Y(n857) );
  OAI21XLTS U923 ( .A0(n799), .A1(n931), .B0(n850), .Y(add_subt_dataA[24]) );
  AOI211X1TS U924 ( .A0(n1078), .A1(n1202), .B0(n1036), .C0(n1040), .Y(n1016)
         );
  AOI2BB2XLTS U925 ( .B0(n800), .B1(n1168), .A0N(d_ff_Xn[25]), .A1N(n1167), 
        .Y(n351) );
  NAND4XLTS U926 ( .A(cordic_FSM_state_reg[3]), .B(n1202), .C(n1049), .D(n1032), .Y(n1033) );
  AO22XLTS U927 ( .A0(d_ff_Xn[31]), .A1(n1007), .B0(d_ff2_X[31]), .B1(n1130), 
        .Y(n337) );
  AO22XLTS U928 ( .A0(n1086), .A1(result_add_subt[19]), .B0(n1087), .B1(
        d_ff_Xn[19]), .Y(n601) );
  AO22XLTS U929 ( .A0(n1084), .A1(result_add_subt[6]), .B0(n1083), .B1(
        d_ff_Xn[6]), .Y(n614) );
  AO22XLTS U930 ( .A0(n1057), .A1(d_ff1_operation_out), .B0(n1060), .B1(
        operation), .Y(n723) );
  AOI222X1TS U931 ( .A0(n1168), .A1(d_ff2_Z[2]), .B0(n990), .B1(d_ff1_Z[2]), 
        .C0(d_ff_Zn[2]), .C1(n1007), .Y(n981) );
  AO21XLTS U932 ( .A0(d_ff3_LUT_out[11]), .A1(n1129), .B0(n821), .Y(n513) );
  OAI21XLTS U933 ( .A0(n1079), .A1(n1051), .B0(n1177), .Y(n1044) );
  AO22XLTS U934 ( .A0(n1089), .A1(result_add_subt[31]), .B0(n810), .B1(
        d_ff_Xn[31]), .Y(n589) );
  AO22XLTS U935 ( .A0(d_ff_Xn[0]), .A1(n1161), .B0(d_ff2_X[0]), .B1(n1004), 
        .Y(n399) );
  AO22XLTS U936 ( .A0(d_ff_Xn[4]), .A1(n1161), .B0(d_ff2_X[4]), .B1(n1172), 
        .Y(n391) );
  AO22XLTS U937 ( .A0(d_ff_Xn[8]), .A1(n1161), .B0(d_ff2_X[8]), .B1(n1164), 
        .Y(n383) );
  AO22XLTS U938 ( .A0(d_ff_Xn[9]), .A1(n1199), .B0(d_ff2_X[9]), .B1(n1164), 
        .Y(n381) );
  AO22XLTS U939 ( .A0(d_ff_Xn[11]), .A1(n1173), .B0(d_ff2_X[11]), .B1(n1130), 
        .Y(n377) );
  AO22XLTS U940 ( .A0(d_ff_Xn[15]), .A1(n1173), .B0(d_ff2_X[15]), .B1(n1198), 
        .Y(n369) );
  AO22XLTS U941 ( .A0(d_ff_Xn[18]), .A1(n1173), .B0(d_ff2_X[18]), .B1(n1198), 
        .Y(n363) );
  AO22XLTS U942 ( .A0(d_ff_Xn[21]), .A1(n1173), .B0(d_ff2_X[21]), .B1(n1128), 
        .Y(n357) );
  AO22XLTS U943 ( .A0(d_ff_Xn[22]), .A1(n1173), .B0(d_ff2_X[22]), .B1(n1004), 
        .Y(n355) );
  AO22XLTS U944 ( .A0(d_ff_Yn[0]), .A1(n1173), .B0(d_ff2_Y[0]), .B1(n1130), 
        .Y(n463) );
  AO22XLTS U945 ( .A0(d_ff_Yn[1]), .A1(n1199), .B0(d_ff2_Y[1]), .B1(n1130), 
        .Y(n461) );
  AO22XLTS U946 ( .A0(d_ff_Yn[2]), .A1(n1007), .B0(d_ff2_Y[2]), .B1(n1198), 
        .Y(n459) );
  AO22XLTS U947 ( .A0(d_ff_Yn[3]), .A1(n1199), .B0(d_ff2_Y[3]), .B1(n1198), 
        .Y(n457) );
  AO22XLTS U948 ( .A0(d_ff_Yn[4]), .A1(n1132), .B0(d_ff2_Y[4]), .B1(n1164), 
        .Y(n455) );
  AO22XLTS U949 ( .A0(d_ff_Yn[5]), .A1(n1007), .B0(d_ff2_Y[5]), .B1(n1128), 
        .Y(n453) );
  AO22XLTS U950 ( .A0(d_ff_Yn[6]), .A1(n1199), .B0(d_ff2_Y[6]), .B1(n1004), 
        .Y(n451) );
  AO22XLTS U951 ( .A0(d_ff_Yn[7]), .A1(n1007), .B0(d_ff2_Y[7]), .B1(n1172), 
        .Y(n449) );
  AO22XLTS U952 ( .A0(d_ff_Yn[8]), .A1(n1132), .B0(d_ff2_Y[8]), .B1(n1130), 
        .Y(n447) );
  AO22XLTS U953 ( .A0(d_ff_Yn[9]), .A1(n1161), .B0(d_ff2_Y[9]), .B1(n1198), 
        .Y(n445) );
  AO22XLTS U954 ( .A0(d_ff_Yn[10]), .A1(n1161), .B0(d_ff2_Y[10]), .B1(n1128), 
        .Y(n443) );
  AO22XLTS U955 ( .A0(d_ff_Yn[11]), .A1(n1132), .B0(d_ff2_Y[11]), .B1(n1004), 
        .Y(n441) );
  AO22XLTS U956 ( .A0(d_ff_Yn[12]), .A1(n1132), .B0(d_ff2_Y[12]), .B1(n1172), 
        .Y(n439) );
  AO22XLTS U957 ( .A0(d_ff_Yn[13]), .A1(n1132), .B0(d_ff2_Y[13]), .B1(n1128), 
        .Y(n437) );
  AO22XLTS U958 ( .A0(d_ff_Yn[14]), .A1(n1132), .B0(d_ff2_Y[14]), .B1(n1004), 
        .Y(n435) );
  AO22XLTS U959 ( .A0(d_ff_Yn[15]), .A1(n1132), .B0(d_ff2_Y[15]), .B1(n1172), 
        .Y(n433) );
  AO22XLTS U960 ( .A0(d_ff_Yn[16]), .A1(n1132), .B0(d_ff2_Y[16]), .B1(n1164), 
        .Y(n431) );
  AO22XLTS U961 ( .A0(d_ff_Yn[17]), .A1(n1132), .B0(d_ff2_Y[17]), .B1(n1130), 
        .Y(n429) );
  AO22XLTS U962 ( .A0(d_ff_Yn[18]), .A1(n1132), .B0(d_ff2_Y[18]), .B1(n1198), 
        .Y(n427) );
  AO22XLTS U963 ( .A0(d_ff_Yn[19]), .A1(n1173), .B0(d_ff2_Y[19]), .B1(n1128), 
        .Y(n425) );
  AO22XLTS U964 ( .A0(d_ff_Yn[20]), .A1(n1173), .B0(d_ff2_Y[20]), .B1(n1004), 
        .Y(n423) );
  AO22XLTS U965 ( .A0(d_ff_Yn[21]), .A1(n1161), .B0(d_ff2_Y[21]), .B1(n1172), 
        .Y(n421) );
  AO22XLTS U966 ( .A0(d_ff_Yn[22]), .A1(n1161), .B0(d_ff2_Y[22]), .B1(n1164), 
        .Y(n419) );
  AO22XLTS U967 ( .A0(d_ff_Yn[31]), .A1(n1161), .B0(d_ff2_Y[31]), .B1(n1128), 
        .Y(n401) );
  NAND3XLTS U968 ( .A(n836), .B(sel_mux_1_reg), .C(n1280), .Y(n835) );
  NAND3XLTS U969 ( .A(cordic_FSM_state_reg[0]), .B(n1040), .C(n1206), .Y(n836)
         );
  NAND3XLTS U970 ( .A(n833), .B(sel_mux_3_reg), .C(n1280), .Y(n832) );
  NAND3XLTS U971 ( .A(n1040), .B(cordic_FSM_state_reg[3]), .C(n1213), .Y(n833)
         );
  AO22XLTS U972 ( .A0(d_ff_Yn[25]), .A1(n1161), .B0(d_ff2_Y[25]), .B1(n1130), 
        .Y(n415) );
  AO22XLTS U973 ( .A0(d_ff_Yn[26]), .A1(n1161), .B0(d_ff2_Y[26]), .B1(n1198), 
        .Y(n414) );
  AO22XLTS U974 ( .A0(n1058), .A1(data_in[0]), .B0(n1057), .B1(d_ff1_Z[0]), 
        .Y(n720) );
  AO22XLTS U975 ( .A0(n1057), .A1(d_ff1_shift_region_flag_out[1]), .B0(n1060), 
        .B1(shift_region_flag[1]), .Y(n721) );
  AO22XLTS U976 ( .A0(n1057), .A1(d_ff1_shift_region_flag_out[0]), .B0(n1060), 
        .B1(shift_region_flag[0]), .Y(n722) );
  NAND2BXLTS U977 ( .AN(d_ff3_LUT_out[27]), .B(n1177), .Y(n497) );
  AO22XLTS U978 ( .A0(n1098), .A1(n827), .B0(n1097), .B1(data_output[31]), .Y(
        n525) );
  AO22XLTS U979 ( .A0(n1098), .A1(sign_inv_out[30]), .B0(n1097), .B1(
        data_output[30]), .Y(n527) );
  AO22XLTS U980 ( .A0(n1096), .A1(sign_inv_out[29]), .B0(n1097), .B1(
        data_output[29]), .Y(n529) );
  AO22XLTS U981 ( .A0(n1096), .A1(sign_inv_out[28]), .B0(n1097), .B1(
        data_output[28]), .Y(n531) );
  AO22XLTS U982 ( .A0(n1096), .A1(sign_inv_out[27]), .B0(n1097), .B1(
        data_output[27]), .Y(n533) );
  AO22XLTS U983 ( .A0(n1096), .A1(sign_inv_out[26]), .B0(n1097), .B1(
        data_output[26]), .Y(n535) );
  AO22XLTS U984 ( .A0(n1096), .A1(sign_inv_out[25]), .B0(n1097), .B1(
        data_output[25]), .Y(n537) );
  AO22XLTS U985 ( .A0(n1096), .A1(sign_inv_out[24]), .B0(n1095), .B1(
        data_output[24]), .Y(n539) );
  AO22XLTS U986 ( .A0(n1096), .A1(sign_inv_out[23]), .B0(n1095), .B1(
        data_output[23]), .Y(n541) );
  AO22XLTS U987 ( .A0(n1096), .A1(sign_inv_out[22]), .B0(n1094), .B1(
        data_output[22]), .Y(n543) );
  AO22XLTS U988 ( .A0(n1096), .A1(sign_inv_out[21]), .B0(n1093), .B1(
        data_output[21]), .Y(n545) );
  AO22XLTS U989 ( .A0(n1096), .A1(sign_inv_out[20]), .B0(n1092), .B1(
        data_output[20]), .Y(n547) );
  AO22XLTS U990 ( .A0(n1091), .A1(sign_inv_out[19]), .B0(n1093), .B1(
        data_output[19]), .Y(n549) );
  AO22XLTS U991 ( .A0(n1091), .A1(sign_inv_out[18]), .B0(n1093), .B1(
        data_output[18]), .Y(n551) );
  AO22XLTS U992 ( .A0(n1091), .A1(sign_inv_out[17]), .B0(n1092), .B1(
        data_output[17]), .Y(n553) );
  AO22XLTS U993 ( .A0(n1091), .A1(sign_inv_out[16]), .B0(n1092), .B1(
        data_output[16]), .Y(n555) );
  AO22XLTS U994 ( .A0(n1091), .A1(sign_inv_out[15]), .B0(n1092), .B1(
        data_output[15]), .Y(n557) );
  AO22XLTS U995 ( .A0(n1091), .A1(sign_inv_out[14]), .B0(n1092), .B1(
        data_output[14]), .Y(n559) );
  AO22XLTS U996 ( .A0(n1091), .A1(sign_inv_out[13]), .B0(n1092), .B1(
        data_output[13]), .Y(n561) );
  AO22XLTS U997 ( .A0(n1091), .A1(sign_inv_out[12]), .B0(n1092), .B1(
        data_output[12]), .Y(n563) );
  AO22XLTS U998 ( .A0(n1091), .A1(sign_inv_out[11]), .B0(n1092), .B1(
        data_output[11]), .Y(n565) );
  AO22XLTS U999 ( .A0(n1091), .A1(sign_inv_out[10]), .B0(n1093), .B1(
        data_output[10]), .Y(n567) );
  AO22XLTS U1000 ( .A0(n1090), .A1(sign_inv_out[9]), .B0(n1093), .B1(
        data_output[9]), .Y(n569) );
  AO22XLTS U1001 ( .A0(n1090), .A1(sign_inv_out[8]), .B0(n1094), .B1(
        data_output[8]), .Y(n571) );
  AO22XLTS U1002 ( .A0(n1090), .A1(sign_inv_out[7]), .B0(n1095), .B1(
        data_output[7]), .Y(n573) );
  AO22XLTS U1003 ( .A0(n1090), .A1(sign_inv_out[6]), .B0(n1095), .B1(
        data_output[6]), .Y(n575) );
  AO22XLTS U1004 ( .A0(n1090), .A1(sign_inv_out[5]), .B0(n1095), .B1(
        data_output[5]), .Y(n577) );
  AO22XLTS U1005 ( .A0(n1090), .A1(sign_inv_out[4]), .B0(n1095), .B1(
        data_output[4]), .Y(n579) );
  AO22XLTS U1006 ( .A0(n1090), .A1(sign_inv_out[3]), .B0(n1095), .B1(
        data_output[3]), .Y(n581) );
  AO22XLTS U1007 ( .A0(n1090), .A1(sign_inv_out[2]), .B0(n1095), .B1(
        data_output[2]), .Y(n583) );
  AO22XLTS U1008 ( .A0(n1090), .A1(sign_inv_out[1]), .B0(n1095), .B1(
        data_output[1]), .Y(n585) );
  AO22XLTS U1009 ( .A0(n1090), .A1(sign_inv_out[0]), .B0(n1094), .B1(
        data_output[0]), .Y(n587) );
  NOR3BXLTS U1010 ( .AN(n1051), .B(n1133), .C(n1050), .Y(n724) );
  NAND4XLTS U1011 ( .A(n1043), .B(n1046), .C(n1042), .D(n1041), .Y(n730) );
  AOI32X1TS U1012 ( .A0(n1038), .A1(n1202), .A2(n1037), .B0(n1036), .B1(
        cordic_FSM_state_reg[2]), .Y(n1043) );
  AO22XLTS U1013 ( .A0(n1201), .A1(d_ff2_X[31]), .B0(n1200), .B1(
        d_ff3_sh_x_out[31]), .Y(n336) );
  AO22XLTS U1014 ( .A0(n1197), .A1(d_ff2_X[22]), .B0(n1166), .B1(
        d_ff3_sh_x_out[22]), .Y(n354) );
  AO22XLTS U1015 ( .A0(n1179), .A1(d_ff2_X[21]), .B0(n1166), .B1(
        d_ff3_sh_x_out[21]), .Y(n356) );
  AO22XLTS U1016 ( .A0(n1165), .A1(d_ff2_X[20]), .B0(n1111), .B1(
        d_ff3_sh_x_out[20]), .Y(n358) );
  AO22XLTS U1017 ( .A0(n1165), .A1(d_ff2_X[19]), .B0(n1111), .B1(
        d_ff3_sh_x_out[19]), .Y(n360) );
  AO22XLTS U1018 ( .A0(n1165), .A1(d_ff2_X[18]), .B0(n1166), .B1(
        d_ff3_sh_x_out[18]), .Y(n362) );
  AO22XLTS U1019 ( .A0(n1179), .A1(d_ff2_X[17]), .B0(n820), .B1(
        d_ff3_sh_x_out[17]), .Y(n364) );
  AO22XLTS U1020 ( .A0(n1185), .A1(d_ff2_X[16]), .B0(n1191), .B1(
        d_ff3_sh_x_out[16]), .Y(n366) );
  AO22XLTS U1021 ( .A0(n1165), .A1(d_ff2_X[15]), .B0(n1166), .B1(
        d_ff3_sh_x_out[15]), .Y(n368) );
  AO22XLTS U1022 ( .A0(n1165), .A1(d_ff2_X[14]), .B0(n1111), .B1(
        d_ff3_sh_x_out[14]), .Y(n370) );
  AO22XLTS U1023 ( .A0(n1165), .A1(d_ff2_X[13]), .B0(n1111), .B1(
        d_ff3_sh_x_out[13]), .Y(n372) );
  AO22XLTS U1024 ( .A0(n1179), .A1(d_ff2_X[12]), .B0(n1163), .B1(
        d_ff3_sh_x_out[12]), .Y(n374) );
  AO22XLTS U1025 ( .A0(n1165), .A1(d_ff2_X[11]), .B0(n1163), .B1(
        d_ff3_sh_x_out[11]), .Y(n376) );
  AO22XLTS U1026 ( .A0(n1201), .A1(d_ff2_X[10]), .B0(n1163), .B1(
        d_ff3_sh_x_out[10]), .Y(n378) );
  AO22XLTS U1027 ( .A0(n1179), .A1(d_ff2_X[9]), .B0(n1163), .B1(
        d_ff3_sh_x_out[9]), .Y(n380) );
  AO22XLTS U1028 ( .A0(n1179), .A1(d_ff2_X[8]), .B0(n1163), .B1(
        d_ff3_sh_x_out[8]), .Y(n382) );
  AO22XLTS U1029 ( .A0(n1179), .A1(d_ff2_X[7]), .B0(n1163), .B1(
        d_ff3_sh_x_out[7]), .Y(n384) );
  AO22XLTS U1030 ( .A0(n1179), .A1(d_ff2_X[6]), .B0(n1163), .B1(
        d_ff3_sh_x_out[6]), .Y(n386) );
  AO22XLTS U1031 ( .A0(n1165), .A1(d_ff2_X[5]), .B0(n1163), .B1(
        d_ff3_sh_x_out[5]), .Y(n388) );
  AO22XLTS U1032 ( .A0(n1179), .A1(d_ff2_X[4]), .B0(n1163), .B1(
        d_ff3_sh_x_out[4]), .Y(n390) );
  AO22XLTS U1033 ( .A0(n1179), .A1(d_ff2_X[3]), .B0(n1163), .B1(
        d_ff3_sh_x_out[3]), .Y(n392) );
  AO22XLTS U1034 ( .A0(n1165), .A1(d_ff2_X[2]), .B0(n1160), .B1(
        d_ff3_sh_x_out[2]), .Y(n394) );
  AO22XLTS U1035 ( .A0(n1165), .A1(d_ff2_X[1]), .B0(n1160), .B1(
        d_ff3_sh_x_out[1]), .Y(n396) );
  AO22XLTS U1036 ( .A0(n1158), .A1(d_ff2_X[0]), .B0(n1160), .B1(
        d_ff3_sh_x_out[0]), .Y(n398) );
  AO22XLTS U1037 ( .A0(n1158), .A1(d_ff2_Y[31]), .B0(n1160), .B1(
        d_ff3_sh_y_out[31]), .Y(n400) );
  AO22XLTS U1038 ( .A0(n1201), .A1(d_ff2_Y[12]), .B0(n1131), .B1(
        d_ff3_sh_y_out[12]), .Y(n438) );
  AO22XLTS U1039 ( .A0(n1197), .A1(d_ff2_Y[6]), .B0(n1131), .B1(
        d_ff3_sh_y_out[6]), .Y(n450) );
  AO22XLTS U1040 ( .A0(n1197), .A1(d_ff2_Y[2]), .B0(n1129), .B1(
        d_ff3_sh_y_out[2]), .Y(n458) );
  AO22XLTS U1041 ( .A0(n1197), .A1(d_ff2_Y[1]), .B0(n1129), .B1(
        d_ff3_sh_y_out[1]), .Y(n460) );
  AO22XLTS U1042 ( .A0(n1201), .A1(d_ff2_Y[0]), .B0(n1129), .B1(
        d_ff3_sh_y_out[0]), .Y(n462) );
  AO22XLTS U1043 ( .A0(n1166), .A1(d_ff3_sign_out), .B0(n1185), .B1(
        d_ff2_Z[31]), .Y(n464) );
  AO22XLTS U1044 ( .A0(n1197), .A1(n1196), .B0(n1195), .B1(d_ff3_sh_x_out[30]), 
        .Y(n338) );
  AOI2BB2XLTS U1045 ( .B0(n1187), .B1(n1186), .A0N(d_ff3_sh_x_out[27]), .A1N(
        n1185), .Y(n341) );
  AO22XLTS U1046 ( .A0(n1197), .A1(n1182), .B0(n1191), .B1(d_ff3_sh_x_out[26]), 
        .Y(n342) );
  AO21XLTS U1047 ( .A0(d_ff3_sh_x_out[25]), .A1(n1129), .B0(n824), .Y(n343) );
  AO22XLTS U1048 ( .A0(n1179), .A1(n1178), .B0(n1177), .B1(d_ff3_sh_x_out[24]), 
        .Y(n344) );
  OAI21XLTS U1049 ( .A0(n1214), .A1(n1124), .B0(n831), .Y(n345) );
  AO22XLTS U1050 ( .A0(n1158), .A1(n1157), .B0(n1160), .B1(d_ff3_sh_y_out[30]), 
        .Y(n402) );
  AOI2BB2XLTS U1051 ( .B0(n1133), .B1(n1155), .A0N(d_ff3_sh_y_out[29]), .A1N(
        n1185), .Y(n403) );
  AO22XLTS U1052 ( .A0(n1158), .A1(n1153), .B0(n1160), .B1(d_ff3_sh_y_out[28]), 
        .Y(n404) );
  OAI21XLTS U1053 ( .A0(n1152), .A1(n1151), .B0(n1154), .Y(n1153) );
  AOI2BB2XLTS U1054 ( .B0(n1133), .B1(n1149), .A0N(d_ff3_sh_y_out[27]), .A1N(
        n1185), .Y(n405) );
  AO22XLTS U1055 ( .A0(n1158), .A1(n1145), .B0(n1160), .B1(d_ff3_sh_y_out[25]), 
        .Y(n407) );
  AO22XLTS U1056 ( .A0(n1158), .A1(n1142), .B0(n1160), .B1(d_ff3_sh_y_out[24]), 
        .Y(n408) );
  OAI21XLTS U1057 ( .A0(n1124), .A1(n801), .B0(n830), .Y(n409) );
  AOI2BB1XLTS U1058 ( .A0N(n1133), .A1N(d_ff3_LUT_out[26]), .B0(n1127), .Y(
        n498) );
  OAI21XLTS U1059 ( .A0(n1099), .A1(n873), .B0(n864), .Y(n499) );
  OAI21XLTS U1060 ( .A0(n1110), .A1(n1122), .B0(n874), .Y(n501) );
  AOI2BB2XLTS U1061 ( .B0(n1117), .B1(n1116), .A0N(n1187), .A1N(
        d_ff3_LUT_out[21]), .Y(n503) );
  AO21XLTS U1062 ( .A0(d_ff3_LUT_out[18]), .A1(n1129), .B0(n1113), .Y(n506) );
  AO21XLTS U1063 ( .A0(d_ff3_LUT_out[14]), .A1(n1129), .B0(n822), .Y(n510) );
  AO21XLTS U1064 ( .A0(d_ff3_LUT_out[13]), .A1(n1129), .B0(n1113), .Y(n511) );
  AOI2BB2XLTS U1065 ( .B0(n1117), .B1(n1107), .A0N(n1187), .A1N(
        d_ff3_LUT_out[9]), .Y(n515) );
  OAI21XLTS U1066 ( .A0(n1181), .A1(n1106), .B0(n1114), .Y(n1107) );
  AO21XLTS U1067 ( .A0(d_ff3_LUT_out[8]), .A1(n1129), .B0(n863), .Y(n516) );
  AO21XLTS U1068 ( .A0(d_ff3_LUT_out[7]), .A1(n1129), .B0(n821), .Y(n517) );
  AO21XLTS U1069 ( .A0(d_ff3_LUT_out[5]), .A1(n1119), .B0(n822), .Y(n519) );
  OAI21XLTS U1070 ( .A0(n867), .A1(n873), .B0(n866), .Y(n522) );
  OAI21XLTS U1071 ( .A0(n1140), .A1(n886), .B0(n862), .Y(n528) );
  OAI21XLTS U1072 ( .A0(n1139), .A1(n919), .B0(n914), .Y(n530) );
  OAI21XLTS U1073 ( .A0(n1138), .A1(n919), .B0(n913), .Y(n532) );
  OAI21XLTS U1074 ( .A0(n1136), .A1(n919), .B0(n918), .Y(n534) );
  OAI21XLTS U1075 ( .A0(n1239), .A1(n919), .B0(n892), .Y(n536) );
  OAI21XLTS U1076 ( .A0(n1238), .A1(n919), .B0(n911), .Y(n538) );
  OAI21XLTS U1077 ( .A0(n1135), .A1(n919), .B0(n915), .Y(n540) );
  OAI21XLTS U1078 ( .A0(n1134), .A1(n919), .B0(n912), .Y(n542) );
  OAI21XLTS U1079 ( .A0(n1237), .A1(n919), .B0(n887), .Y(n544) );
  OAI21XLTS U1080 ( .A0(n1236), .A1(n919), .B0(n888), .Y(n546) );
  OAI21XLTS U1081 ( .A0(n1235), .A1(n919), .B0(n891), .Y(n548) );
  OAI21XLTS U1082 ( .A0(n1233), .A1(n906), .B0(n885), .Y(n552) );
  OAI21XLTS U1083 ( .A0(n1232), .A1(n906), .B0(n893), .Y(n554) );
  OAI21XLTS U1084 ( .A0(n1231), .A1(n906), .B0(n894), .Y(n556) );
  OAI21XLTS U1085 ( .A0(n1230), .A1(n906), .B0(n889), .Y(n558) );
  OAI21XLTS U1086 ( .A0(n1229), .A1(n906), .B0(n899), .Y(n560) );
  OAI21XLTS U1087 ( .A0(n1228), .A1(n906), .B0(n895), .Y(n562) );
  OAI21XLTS U1088 ( .A0(n1227), .A1(n906), .B0(n897), .Y(n564) );
  OAI21XLTS U1089 ( .A0(n1226), .A1(n906), .B0(n879), .Y(n566) );
  OAI21XLTS U1090 ( .A0(n1225), .A1(n906), .B0(n905), .Y(n568) );
  OAI21XLTS U1091 ( .A0(n1224), .A1(n910), .B0(n883), .Y(n570) );
  OAI21XLTS U1092 ( .A0(n1223), .A1(n910), .B0(n882), .Y(n572) );
  OAI21XLTS U1093 ( .A0(n1222), .A1(n910), .B0(n896), .Y(n574) );
  OAI21XLTS U1094 ( .A0(n1220), .A1(n910), .B0(n902), .Y(n578) );
  OAI21XLTS U1095 ( .A0(n1219), .A1(n910), .B0(n880), .Y(n580) );
  OAI21XLTS U1096 ( .A0(n1218), .A1(n910), .B0(n909), .Y(n582) );
  OAI21XLTS U1097 ( .A0(n1217), .A1(n910), .B0(n903), .Y(n584) );
  OAI21XLTS U1098 ( .A0(n1216), .A1(n910), .B0(n901), .Y(n586) );
  OAI21XLTS U1099 ( .A0(n1215), .A1(n910), .B0(n881), .Y(n588) );
  AO22XLTS U1100 ( .A0(n1070), .A1(result_add_subt[31]), .B0(n1067), .B1(
        d_ff_Zn[31]), .Y(n653) );
  AO22XLTS U1101 ( .A0(n1070), .A1(result_add_subt[30]), .B0(n1069), .B1(
        d_ff_Zn[30]), .Y(n654) );
  AO22XLTS U1102 ( .A0(n1068), .A1(result_add_subt[29]), .B0(n1069), .B1(
        d_ff_Zn[29]), .Y(n655) );
  AO22XLTS U1103 ( .A0(n1068), .A1(result_add_subt[28]), .B0(n1069), .B1(
        d_ff_Zn[28]), .Y(n656) );
  AO22XLTS U1104 ( .A0(n1068), .A1(result_add_subt[27]), .B0(n1069), .B1(
        d_ff_Zn[27]), .Y(n657) );
  AO22XLTS U1105 ( .A0(n1068), .A1(result_add_subt[26]), .B0(n1069), .B1(
        d_ff_Zn[26]), .Y(n658) );
  AO22XLTS U1106 ( .A0(n1068), .A1(result_add_subt[25]), .B0(n1067), .B1(
        d_ff_Zn[25]), .Y(n659) );
  AO22XLTS U1107 ( .A0(n1068), .A1(result_add_subt[24]), .B0(n1067), .B1(
        d_ff_Zn[24]), .Y(n660) );
  AO22XLTS U1108 ( .A0(n1068), .A1(result_add_subt[23]), .B0(n1067), .B1(
        d_ff_Zn[23]), .Y(n661) );
  AO22XLTS U1109 ( .A0(n1068), .A1(result_add_subt[22]), .B0(n1067), .B1(
        d_ff_Zn[22]), .Y(n662) );
  AO22XLTS U1110 ( .A0(n1068), .A1(result_add_subt[21]), .B0(n1067), .B1(
        d_ff_Zn[21]), .Y(n663) );
  AO22XLTS U1111 ( .A0(n1068), .A1(result_add_subt[20]), .B0(n1067), .B1(
        d_ff_Zn[20]), .Y(n664) );
  AO22XLTS U1112 ( .A0(n1066), .A1(result_add_subt[19]), .B0(n1069), .B1(
        d_ff_Zn[19]), .Y(n665) );
  AO22XLTS U1113 ( .A0(n1066), .A1(result_add_subt[18]), .B0(n1069), .B1(
        d_ff_Zn[18]), .Y(n666) );
  AO22XLTS U1114 ( .A0(n1066), .A1(result_add_subt[17]), .B0(n1065), .B1(
        d_ff_Zn[17]), .Y(n667) );
  AO22XLTS U1115 ( .A0(n1066), .A1(result_add_subt[16]), .B0(n1065), .B1(
        d_ff_Zn[16]), .Y(n668) );
  AO22XLTS U1116 ( .A0(n1066), .A1(result_add_subt[15]), .B0(n1065), .B1(
        d_ff_Zn[15]), .Y(n669) );
  AO22XLTS U1117 ( .A0(n1066), .A1(result_add_subt[14]), .B0(n1065), .B1(
        d_ff_Zn[14]), .Y(n670) );
  AO22XLTS U1118 ( .A0(n1066), .A1(result_add_subt[13]), .B0(n1065), .B1(
        d_ff_Zn[13]), .Y(n671) );
  AO22XLTS U1119 ( .A0(n1066), .A1(result_add_subt[12]), .B0(n1065), .B1(
        d_ff_Zn[12]), .Y(n672) );
  AO22XLTS U1120 ( .A0(n1066), .A1(result_add_subt[11]), .B0(n1065), .B1(
        d_ff_Zn[11]), .Y(n673) );
  AO22XLTS U1121 ( .A0(n1066), .A1(result_add_subt[10]), .B0(n1065), .B1(
        d_ff_Zn[10]), .Y(n674) );
  AO22XLTS U1122 ( .A0(n1064), .A1(result_add_subt[9]), .B0(n1065), .B1(
        d_ff_Zn[9]), .Y(n675) );
  AO22XLTS U1123 ( .A0(n1064), .A1(result_add_subt[8]), .B0(n1065), .B1(
        d_ff_Zn[8]), .Y(n676) );
  AO22XLTS U1124 ( .A0(n1064), .A1(result_add_subt[7]), .B0(n1063), .B1(
        d_ff_Zn[7]), .Y(n677) );
  AO22XLTS U1125 ( .A0(n1064), .A1(result_add_subt[6]), .B0(n1063), .B1(
        d_ff_Zn[6]), .Y(n678) );
  AO22XLTS U1126 ( .A0(n1064), .A1(result_add_subt[5]), .B0(n1063), .B1(
        d_ff_Zn[5]), .Y(n679) );
  AO22XLTS U1127 ( .A0(n1064), .A1(result_add_subt[4]), .B0(n1063), .B1(
        d_ff_Zn[4]), .Y(n680) );
  AO22XLTS U1128 ( .A0(n1064), .A1(result_add_subt[3]), .B0(n1063), .B1(
        d_ff_Zn[3]), .Y(n681) );
  AO22XLTS U1129 ( .A0(n1064), .A1(result_add_subt[2]), .B0(n1063), .B1(
        d_ff_Zn[2]), .Y(n682) );
  AO22XLTS U1130 ( .A0(n1064), .A1(result_add_subt[1]), .B0(n1063), .B1(
        d_ff_Zn[1]), .Y(n683) );
  AO22XLTS U1131 ( .A0(n1064), .A1(result_add_subt[0]), .B0(n1063), .B1(
        d_ff_Zn[0]), .Y(n684) );
  AO22XLTS U1132 ( .A0(n1060), .A1(data_in[31]), .B0(n1059), .B1(d_ff1_Z[31]), 
        .Y(n689) );
  AO22XLTS U1133 ( .A0(n1058), .A1(data_in[30]), .B0(n1057), .B1(d_ff1_Z[30]), 
        .Y(n690) );
  AO22XLTS U1134 ( .A0(n1060), .A1(data_in[29]), .B0(n1056), .B1(d_ff1_Z[29]), 
        .Y(n691) );
  AO22XLTS U1135 ( .A0(n1058), .A1(data_in[28]), .B0(n1056), .B1(d_ff1_Z[28]), 
        .Y(n692) );
  AO22XLTS U1136 ( .A0(n1060), .A1(data_in[27]), .B0(n1056), .B1(d_ff1_Z[27]), 
        .Y(n693) );
  AO22XLTS U1137 ( .A0(n1060), .A1(data_in[26]), .B0(n1056), .B1(d_ff1_Z[26]), 
        .Y(n694) );
  AO22XLTS U1138 ( .A0(n1060), .A1(data_in[25]), .B0(n1056), .B1(d_ff1_Z[25]), 
        .Y(n695) );
  AO22XLTS U1139 ( .A0(n1060), .A1(data_in[24]), .B0(n1056), .B1(d_ff1_Z[24]), 
        .Y(n696) );
  AO22XLTS U1140 ( .A0(n1060), .A1(data_in[23]), .B0(n1056), .B1(d_ff1_Z[23]), 
        .Y(n697) );
  AO22XLTS U1141 ( .A0(n1055), .A1(data_in[22]), .B0(n1056), .B1(d_ff1_Z[22]), 
        .Y(n698) );
  AO22XLTS U1142 ( .A0(n1054), .A1(data_in[21]), .B0(n1056), .B1(d_ff1_Z[21]), 
        .Y(n699) );
  AO22XLTS U1143 ( .A0(n1054), .A1(data_in[20]), .B0(n1056), .B1(d_ff1_Z[20]), 
        .Y(n700) );
  AO22XLTS U1144 ( .A0(n1054), .A1(data_in[19]), .B0(n1059), .B1(d_ff1_Z[19]), 
        .Y(n701) );
  AO22XLTS U1145 ( .A0(n1054), .A1(data_in[18]), .B0(n1059), .B1(d_ff1_Z[18]), 
        .Y(n702) );
  AO22XLTS U1146 ( .A0(n1054), .A1(data_in[17]), .B0(n1059), .B1(d_ff1_Z[17]), 
        .Y(n703) );
  AO22XLTS U1147 ( .A0(n1053), .A1(data_in[16]), .B0(n1059), .B1(d_ff1_Z[16]), 
        .Y(n704) );
  AO22XLTS U1148 ( .A0(n1054), .A1(data_in[15]), .B0(n1059), .B1(d_ff1_Z[15]), 
        .Y(n705) );
  AO22XLTS U1149 ( .A0(n1054), .A1(data_in[14]), .B0(n1059), .B1(d_ff1_Z[14]), 
        .Y(n706) );
  AO22XLTS U1150 ( .A0(n1053), .A1(data_in[13]), .B0(n1059), .B1(d_ff1_Z[13]), 
        .Y(n707) );
  AO22XLTS U1151 ( .A0(n1055), .A1(data_in[12]), .B0(n1059), .B1(d_ff1_Z[12]), 
        .Y(n708) );
  AO22XLTS U1152 ( .A0(n1058), .A1(data_in[11]), .B0(n1059), .B1(d_ff1_Z[11]), 
        .Y(n709) );
  AO22XLTS U1153 ( .A0(n1058), .A1(data_in[10]), .B0(n1052), .B1(d_ff1_Z[10]), 
        .Y(n710) );
  AO22XLTS U1154 ( .A0(n1058), .A1(data_in[9]), .B0(n1052), .B1(d_ff1_Z[9]), 
        .Y(n711) );
  AO22XLTS U1155 ( .A0(n1058), .A1(data_in[8]), .B0(n1052), .B1(d_ff1_Z[8]), 
        .Y(n712) );
  AO22XLTS U1156 ( .A0(n1058), .A1(data_in[7]), .B0(n1052), .B1(d_ff1_Z[7]), 
        .Y(n713) );
  AO22XLTS U1157 ( .A0(n1058), .A1(data_in[6]), .B0(n1052), .B1(d_ff1_Z[6]), 
        .Y(n714) );
  AO22XLTS U1158 ( .A0(n1053), .A1(data_in[5]), .B0(n1052), .B1(d_ff1_Z[5]), 
        .Y(n715) );
  AO22XLTS U1159 ( .A0(n1053), .A1(data_in[4]), .B0(n1052), .B1(d_ff1_Z[4]), 
        .Y(n716) );
  AO22XLTS U1160 ( .A0(n1053), .A1(data_in[3]), .B0(n1052), .B1(d_ff1_Z[3]), 
        .Y(n717) );
  AO22XLTS U1161 ( .A0(n1054), .A1(data_in[2]), .B0(n1052), .B1(d_ff1_Z[2]), 
        .Y(n718) );
  AO22XLTS U1162 ( .A0(n1054), .A1(data_in[1]), .B0(n1052), .B1(d_ff1_Z[1]), 
        .Y(n719) );
  BUFX3TS U1163 ( .A(n818), .Y(n814) );
  BUFX3TS U1164 ( .A(n815), .Y(n813) );
  INVX2TS U1165 ( .A(cordic_FSM_state_reg[3]), .Y(n803) );
  INVX2TS U1166 ( .A(n1181), .Y(n804) );
  INVX2TS U1167 ( .A(n804), .Y(n805) );
  AOI222X1TS U1168 ( .A0(d_ff2_Z[22]), .A1(n960), .B0(d_ff2_Y[22]), .B1(n974), 
        .C0(d_ff2_X[22]), .C1(n965), .Y(n961) );
  AOI222X1TS U1169 ( .A0(d_ff2_Z[21]), .A1(n975), .B0(d_ff2_Y[21]), .B1(n971), 
        .C0(d_ff2_X[21]), .C1(n965), .Y(n959) );
  OAI21XLTS U1170 ( .A0(n1240), .A1(n886), .B0(n861), .Y(n526) );
  OAI32X1TS U1171 ( .A0(n1020), .A1(n1019), .A2(n1205), .B0(n1018), .B1(n1017), 
        .Y(n686) );
  NOR4X1TS U1172 ( .A(cordic_FSM_state_reg[1]), .B(n1202), .C(n1213), .D(n1206), .Y(ready_cordic) );
  OAI31X1TS U1173 ( .A0(n1040), .A1(n1039), .A2(n1206), .B0(n1213), .Y(n1041)
         );
  NOR2X2TS U1174 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[3]), 
        .Y(n1038) );
  NOR2X2TS U1175 ( .A(cordic_FSM_state_reg[0]), .B(cordic_FSM_state_reg[3]), 
        .Y(n1031) );
  AOI222X4TS U1176 ( .A0(n1130), .A1(d_ff2_Z[20]), .B0(n1012), .B1(d_ff1_Z[20]), .C0(d_ff_Zn[20]), .C1(n1011), .Y(n977) );
  AOI222X4TS U1177 ( .A0(n1172), .A1(d_ff2_Z[30]), .B0(n1009), .B1(d_ff1_Z[30]), .C0(d_ff_Zn[30]), .C1(n1011), .Y(n989) );
  AOI222X4TS U1178 ( .A0(n1164), .A1(d_ff2_Z[18]), .B0(n1012), .B1(d_ff1_Z[18]), .C0(d_ff_Zn[18]), .C1(n1011), .Y(n994) );
  AOI222X4TS U1179 ( .A0(n1004), .A1(d_ff2_Z[26]), .B0(n1009), .B1(d_ff1_Z[26]), .C0(d_ff_Zn[26]), .C1(n1011), .Y(n995) );
  CLKINVX3TS U1180 ( .A(n1159), .Y(n1003) );
  CLKINVX3TS U1181 ( .A(n818), .Y(n1276) );
  NOR2X4TS U1182 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n1036) );
  AOI222X4TS U1183 ( .A0(n1168), .A1(d_ff2_Z[9]), .B0(n990), .B1(d_ff1_Z[9]), 
        .C0(d_ff_Zn[9]), .C1(n1007), .Y(n988) );
  AOI222X4TS U1184 ( .A0(n1168), .A1(d_ff2_Z[7]), .B0(n990), .B1(d_ff1_Z[7]), 
        .C0(d_ff_Zn[7]), .C1(n1199), .Y(n986) );
  AOI222X4TS U1185 ( .A0(n1168), .A1(d_ff2_Z[5]), .B0(n990), .B1(d_ff1_Z[5]), 
        .C0(d_ff_Zn[5]), .C1(n1003), .Y(n984) );
  AOI222X4TS U1186 ( .A0(n1168), .A1(d_ff2_Z[3]), .B0(n990), .B1(d_ff1_Z[3]), 
        .C0(d_ff_Zn[3]), .C1(n1003), .Y(n982) );
  AOI222X4TS U1187 ( .A0(n1168), .A1(d_ff2_Z[8]), .B0(n990), .B1(d_ff1_Z[8]), 
        .C0(d_ff_Zn[8]), .C1(n1007), .Y(n980) );
  AOI222X4TS U1188 ( .A0(n1168), .A1(d_ff2_Z[4]), .B0(n990), .B1(d_ff1_Z[4]), 
        .C0(d_ff_Zn[4]), .C1(n1003), .Y(n979) );
  AOI222X4TS U1189 ( .A0(n1168), .A1(d_ff2_Z[1]), .B0(n871), .B1(d_ff1_Z[1]), 
        .C0(d_ff_Zn[1]), .C1(n1199), .Y(n875) );
  AOI222X4TS U1190 ( .A0(n1164), .A1(d_ff2_Z[0]), .B0(n1011), .B1(d_ff_Zn[0]), 
        .C0(n871), .C1(d_ff1_Z[0]), .Y(n872) );
  AOI222X1TS U1191 ( .A0(d_ff2_Z[31]), .A1(n969), .B0(d_ff2_Y[31]), .B1(n971), 
        .C0(d_ff2_X[31]), .C1(n973), .Y(n970) );
  OAI33X1TS U1192 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(
        d_ff1_operation_out), .A2(n1212), .B0(n1207), .B1(n1203), .B2(
        d_ff1_shift_region_flag_out[0]), .Y(n826) );
  BUFX3TS U1193 ( .A(n812), .Y(n818) );
  CLKINVX3TS U1194 ( .A(n813), .Y(n1247) );
  CLKINVX3TS U1195 ( .A(n814), .Y(n1267) );
  CLKINVX3TS U1196 ( .A(n818), .Y(n1278) );
  CLKINVX3TS U1197 ( .A(n818), .Y(n1277) );
  CLKINVX3TS U1198 ( .A(n818), .Y(n1279) );
  CLKINVX3TS U1199 ( .A(n818), .Y(n1275) );
  CLKINVX3TS U1200 ( .A(n813), .Y(n1263) );
  CLKINVX3TS U1201 ( .A(n814), .Y(n1266) );
  CLKINVX3TS U1202 ( .A(n814), .Y(n1268) );
  CLKINVX3TS U1203 ( .A(n814), .Y(n1269) );
  CLKINVX3TS U1204 ( .A(n814), .Y(n1271) );
  CLKINVX3TS U1205 ( .A(n814), .Y(n1264) );
  CLKINVX3TS U1206 ( .A(n814), .Y(n1270) );
  CLKINVX3TS U1207 ( .A(n813), .Y(n1244) );
  CLKINVX3TS U1208 ( .A(n813), .Y(n1242) );
  CLKINVX3TS U1209 ( .A(n813), .Y(n1243) );
  CLKINVX3TS U1210 ( .A(n813), .Y(n1246) );
  CLKINVX3TS U1211 ( .A(n812), .Y(n1273) );
  CLKINVX3TS U1212 ( .A(n1019), .Y(n1241) );
  CLKINVX3TS U1213 ( .A(n812), .Y(n1257) );
  CLKINVX3TS U1214 ( .A(n812), .Y(n1259) );
  CLKINVX3TS U1215 ( .A(n812), .Y(n1262) );
  CLKINVX3TS U1216 ( .A(n812), .Y(n1272) );
  CLKINVX3TS U1217 ( .A(n818), .Y(n1258) );
  CLKINVX3TS U1218 ( .A(n815), .Y(n1249) );
  CLKINVX3TS U1219 ( .A(n815), .Y(n1250) );
  CLKINVX3TS U1220 ( .A(n815), .Y(n1274) );
  INVX2TS U1221 ( .A(n818), .Y(n806) );
  CLKINVX3TS U1222 ( .A(n818), .Y(n1256) );
  CLKINVX3TS U1223 ( .A(n814), .Y(n1255) );
  CLKINVX3TS U1224 ( .A(n814), .Y(n1252) );
  CLKINVX3TS U1225 ( .A(n814), .Y(n1253) );
  CLKINVX3TS U1226 ( .A(n1019), .Y(n1260) );
  CLKINVX3TS U1227 ( .A(n1019), .Y(n1265) );
  CLKINVX3TS U1228 ( .A(n1019), .Y(n1245) );
  AOI32X4TS U1229 ( .A0(n1110), .A1(n1193), .A2(n1114), .B0(d_ff3_LUT_out[23]), 
        .B1(n1111), .Y(n874) );
  AOI221X4TS U1230 ( .A0(n1121), .A1(n1193), .B0(d_ff3_LUT_out[24]), .B1(n1191), .C0(n1120), .Y(n1123) );
  NOR2X2TS U1231 ( .A(d_ff2_Y[23]), .B(n1104), .Y(n1144) );
  AOI222X4TS U1232 ( .A0(n1013), .A1(d_ff2_Z[17]), .B0(n1012), .B1(d_ff1_Z[17]), .C0(d_ff_Zn[17]), .C1(n1011), .Y(n1014) );
  AOI222X4TS U1233 ( .A0(n1013), .A1(d_ff2_Z[15]), .B0(n1012), .B1(d_ff1_Z[15]), .C0(d_ff_Zn[15]), .C1(n1007), .Y(n1008) );
  AOI222X4TS U1234 ( .A0(n1013), .A1(d_ff2_Z[13]), .B0(n1012), .B1(d_ff1_Z[13]), .C0(d_ff_Zn[13]), .C1(n1199), .Y(n1006) );
  AOI222X4TS U1235 ( .A0(n1013), .A1(d_ff2_Z[19]), .B0(n1012), .B1(d_ff1_Z[19]), .C0(d_ff_Zn[19]), .C1(n1011), .Y(n999) );
  AOI222X4TS U1236 ( .A0(n1013), .A1(d_ff2_Z[16]), .B0(n1012), .B1(d_ff1_Z[16]), .C0(d_ff_Zn[16]), .C1(n1007), .Y(n992) );
  AOI222X4TS U1237 ( .A0(n1013), .A1(d_ff2_Z[11]), .B0(n990), .B1(d_ff1_Z[11]), 
        .C0(d_ff_Zn[11]), .C1(n1199), .Y(n991) );
  AOI222X4TS U1238 ( .A0(n1013), .A1(d_ff2_Z[14]), .B0(n1012), .B1(d_ff1_Z[14]), .C0(d_ff_Zn[14]), .C1(n1011), .Y(n987) );
  AOI222X4TS U1239 ( .A0(n1013), .A1(d_ff2_Z[12]), .B0(n1012), .B1(d_ff1_Z[12]), .C0(d_ff_Zn[12]), .C1(n1007), .Y(n985) );
  AOI222X4TS U1240 ( .A0(n1013), .A1(d_ff2_Z[10]), .B0(n990), .B1(d_ff1_Z[10]), 
        .C0(d_ff_Zn[10]), .C1(n1011), .Y(n983) );
  AOI222X4TS U1241 ( .A0(n1128), .A1(d_ff2_Z[6]), .B0(n990), .B1(d_ff1_Z[6]), 
        .C0(d_ff_Zn[6]), .C1(n1199), .Y(n978) );
  NOR4X4TS U1242 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[1]), 
        .C(n1213), .D(n1206), .Y(ack_add_subt) );
  OAI21XLTS U1243 ( .A0(n837), .A1(n836), .B0(n835), .Y(n687) );
  NOR2X2TS U1244 ( .A(d_ff2_X[23]), .B(n1104), .Y(n1176) );
  OAI21XLTS U1245 ( .A0(n834), .A1(n833), .B0(n832), .Y(n688) );
  AOI222X4TS U1246 ( .A0(n1164), .A1(d_ff2_Z[31]), .B0(n1009), .B1(d_ff1_Z[31]), .C0(d_ff_Zn[31]), .C1(n1011), .Y(n1010) );
  CLKINVX3TS U1247 ( .A(n1019), .Y(n1261) );
  OAI2BB2X2TS U1248 ( .B0(n798), .B1(d_ff2_X[24]), .A0N(n1176), .A1N(n1174), 
        .Y(n1180) );
  OAI21XLTS U1249 ( .A0(d_ff2_X[24]), .A1(n798), .B0(n1174), .Y(n1175) );
  BUFX3TS U1250 ( .A(n1024), .Y(n953) );
  OR3X2TS U1251 ( .A(n1082), .B(n1081), .C(n1080), .Y(n810) );
  BUFX3TS U1252 ( .A(n819), .Y(n1169) );
  NOR2X1TS U1253 ( .A(n834), .B(n1049), .Y(n1082) );
  NOR2XLTS U1254 ( .A(d_ff2_X[27]), .B(n1188), .Y(n1184) );
  OAI21XLTS U1255 ( .A0(d_ff2_X[27]), .A1(n1188), .B0(d_ff2_X[28]), .Y(n1189)
         );
  INVX2TS U1256 ( .A(d_ff_Yn[28]), .Y(n1138) );
  INVX2TS U1257 ( .A(n1062), .Y(n1067) );
  CLKBUFX2TS U1258 ( .A(n1054), .Y(n1053) );
  OAI21XLTS U1259 ( .A0(n1126), .A1(n1046), .B0(n1057), .Y(n920) );
  OAI21XLTS U1260 ( .A0(cont_iter_out[3]), .A1(n873), .B0(n870), .Y(n523) );
  OAI21XLTS U1261 ( .A0(n1234), .A1(n906), .B0(n890), .Y(n550) );
  OAI21XLTS U1262 ( .A0(n1221), .A1(n910), .B0(n900), .Y(n576) );
  OAI21XLTS U1263 ( .A0(n807), .A1(n931), .B0(n847), .Y(add_subt_dataB[28]) );
  OAI21XLTS U1264 ( .A0(n801), .A1(n931), .B0(n846), .Y(add_subt_dataA[23]) );
  OAI21XLTS U1265 ( .A0(n1151), .A1(n931), .B0(n844), .Y(add_subt_dataA[28])
         );
  CLKBUFX2TS U1266 ( .A(n812), .Y(n815) );
  INVX2TS U1267 ( .A(n818), .Y(n1248) );
  INVX2TS U1268 ( .A(n813), .Y(n1251) );
  INVX2TS U1269 ( .A(n813), .Y(n1254) );
  NAND2X1TS U1270 ( .A(n1205), .B(sel_mux_2_reg[1]), .Y(n841) );
  AOI22X1TS U1271 ( .A0(n1027), .A1(d_ff3_sh_x_out[12]), .B0(n1024), .B1(
        d_ff3_sh_y_out[12]), .Y(n817) );
  OAI21XLTS U1272 ( .A0(n808), .A1(n841), .B0(n817), .Y(add_subt_dataB[12]) );
  INVX2TS U1273 ( .A(n815), .Y(n1280) );
  AND3X2TS U1274 ( .A(cordic_FSM_state_reg[2]), .B(n1036), .C(n803), .Y(n819)
         );
  BUFX3TS U1275 ( .A(n819), .Y(n1137) );
  BUFX3TS U1276 ( .A(n1159), .Y(n1162) );
  OA22X1TS U1277 ( .A0(n1137), .A1(d_ff2_X[27]), .B0(d_ff_Xn[27]), .B1(n1162), 
        .Y(n349) );
  NAND3X1TS U1278 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n1038), .Y(n820) );
  BUFX3TS U1279 ( .A(n820), .Y(n1166) );
  BUFX3TS U1280 ( .A(n1166), .Y(n1195) );
  BUFX3TS U1281 ( .A(n820), .Y(n1111) );
  BUFX3TS U1282 ( .A(n1111), .Y(n1191) );
  NAND2X2TS U1283 ( .A(n798), .B(n1204), .Y(n867) );
  NOR3X1TS U1284 ( .A(n1110), .B(n1181), .C(n867), .Y(n837) );
  NAND2X1TS U1285 ( .A(n1193), .B(n837), .Y(n868) );
  NAND2X2TS U1286 ( .A(n805), .B(cont_iter_out[3]), .Y(n1114) );
  NAND2X1TS U1287 ( .A(n868), .B(n1115), .Y(n821) );
  NOR2X2TS U1288 ( .A(cont_iter_out[3]), .B(n798), .Y(n1105) );
  AOI222X1TS U1289 ( .A0(n1105), .A1(n1181), .B0(n1105), .B1(n1104), .C0(
        cont_iter_out[3]), .C1(n804), .Y(n1109) );
  NAND2X2TS U1290 ( .A(n1193), .B(n804), .Y(n869) );
  INVX2TS U1291 ( .A(n869), .Y(n863) );
  NAND2X2TS U1292 ( .A(n1181), .B(n1193), .Y(n873) );
  NAND2X1TS U1293 ( .A(d_ff2_X[24]), .B(n798), .Y(n1174) );
  XOR2X1TS U1294 ( .A(n1180), .B(n800), .Y(n823) );
  MXI2X1TS U1295 ( .A(n869), .B(n873), .S0(n823), .Y(n824) );
  INVX2TS U1296 ( .A(n1036), .Y(n825) );
  OR3X2TS U1297 ( .A(n1202), .B(n803), .C(n825), .Y(n1092) );
  CLKBUFX2TS U1298 ( .A(n1092), .Y(n1093) );
  CLKBUFX2TS U1299 ( .A(n1093), .Y(n1094) );
  INVX2TS U1300 ( .A(n1094), .Y(n1098) );
  CLKBUFX2TS U1301 ( .A(n1092), .Y(n1097) );
  NAND2X2TS U1302 ( .A(n1110), .B(cont_iter_out[1]), .Y(n1126) );
  NOR2X4TS U1303 ( .A(n1126), .B(n1114), .Y(n1078) );
  INVX2TS U1304 ( .A(n1078), .Y(n1049) );
  XNOR2X1TS U1305 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), .Y(n828) );
  XOR2X1TS U1306 ( .A(d_ff1_shift_region_flag_out[0]), .B(n828), .Y(n834) );
  AOI21X1TS U1307 ( .A0(cont_var_out[0]), .A1(n1049), .B0(n1082), .Y(n1018) );
  NAND4X1TS U1308 ( .A(cordic_FSM_state_reg[3]), .B(n1036), .C(ready_add_subt), 
        .D(n1202), .Y(n1080) );
  NOR2X1TS U1309 ( .A(n1018), .B(n1080), .Y(n829) );
  BUFX3TS U1310 ( .A(n829), .Y(n1071) );
  BUFX3TS U1311 ( .A(n1071), .Y(n1072) );
  BUFX3TS U1312 ( .A(n1072), .Y(n1074) );
  OAI2BB2XLTS U1313 ( .B0(n1074), .B1(n1215), .A0N(n1071), .A1N(
        result_add_subt[0]), .Y(n652) );
  OAI2BB2XLTS U1314 ( .B0(n1072), .B1(n1140), .A0N(n1071), .A1N(
        result_add_subt[30]), .Y(n622) );
  BUFX3TS U1315 ( .A(n1072), .Y(n1075) );
  OAI2BB2XLTS U1316 ( .B0(n1075), .B1(n1240), .A0N(n1071), .A1N(
        result_add_subt[31]), .Y(n621) );
  BUFX3TS U1317 ( .A(n1072), .Y(n1073) );
  OAI2BB2XLTS U1318 ( .B0(n1073), .B1(n1216), .A0N(n1071), .A1N(
        result_add_subt[1]), .Y(n651) );
  INVX2TS U1319 ( .A(rst), .Y(n331) );
  INVX2TS U1320 ( .A(n1015), .Y(beg_add_subt) );
  NAND2X1TS U1321 ( .A(n1193), .B(n1104), .Y(n1124) );
  BUFX3TS U1322 ( .A(n1166), .Y(n1177) );
  AOI22X1TS U1323 ( .A0(n1187), .A1(n1144), .B0(d_ff3_sh_y_out[23]), .B1(n1177), .Y(n830) );
  AOI22X1TS U1324 ( .A0(n1187), .A1(n1176), .B0(d_ff3_sh_x_out[23]), .B1(n1177), .Y(n831) );
  NAND2X1TS U1325 ( .A(n1202), .B(cordic_FSM_state_reg[1]), .Y(n1035) );
  NAND3X1TS U1326 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[1]), 
        .C(n1031), .Y(n1017) );
  INVX2TS U1327 ( .A(cont_var_out[1]), .Y(n1079) );
  INVX2TS U1328 ( .A(n1017), .Y(n1020) );
  NAND2X1TS U1329 ( .A(sel_mux_2_reg[1]), .B(n1280), .Y(n838) );
  OAI32X1TS U1330 ( .A0(n1017), .A1(n1078), .A2(n1079), .B0(n1020), .B1(n838), 
        .Y(n685) );
  OAI211XLTS U1331 ( .A0(n1110), .A1(cont_iter_out[3]), .B0(cont_iter_out[1]), 
        .C0(n804), .Y(n839) );
  OAI21X1TS U1332 ( .A0(n1110), .A1(n867), .B0(n839), .Y(n1103) );
  AOI22X1TS U1333 ( .A0(n1133), .A1(n1103), .B0(n1111), .B1(d_ff3_LUT_out[6]), 
        .Y(n840) );
  OAI31X1TS U1334 ( .A0(n1104), .A1(n1204), .A2(n869), .B0(n840), .Y(n518) );
  BUFX3TS U1335 ( .A(n937), .Y(n1028) );
  AOI22X1TS U1336 ( .A0(n1028), .A1(d_ff2_Z[27]), .B0(d_ff2_X[27]), .B1(n1024), 
        .Y(n842) );
  OAI21XLTS U1337 ( .A0(n1209), .A1(n931), .B0(n842), .Y(add_subt_dataA[27])
         );
  AOI22X1TS U1338 ( .A0(n1028), .A1(d_ff2_Z[30]), .B0(d_ff2_X[30]), .B1(n1024), 
        .Y(n843) );
  OAI21XLTS U1339 ( .A0(n1211), .A1(n931), .B0(n843), .Y(add_subt_dataA[30])
         );
  AOI22X1TS U1340 ( .A0(d_ff2_Z[28]), .A1(n1028), .B0(d_ff2_X[28]), .B1(n1024), 
        .Y(n844) );
  AOI22X1TS U1341 ( .A0(d_ff2_Z[29]), .A1(n1028), .B0(d_ff2_X[29]), .B1(n1024), 
        .Y(n845) );
  OAI21XLTS U1342 ( .A0(n1210), .A1(n931), .B0(n845), .Y(add_subt_dataA[29])
         );
  AOI22X1TS U1343 ( .A0(d_ff2_X[23]), .A1(n1024), .B0(d_ff2_Z[23]), .B1(n1028), 
        .Y(n846) );
  AOI22X1TS U1344 ( .A0(d_ff3_sh_y_out[28]), .A1(n953), .B0(d_ff3_LUT_out[27]), 
        .B1(n1028), .Y(n847) );
  AOI22X1TS U1345 ( .A0(d_ff3_sh_y_out[29]), .A1(n953), .B0(d_ff3_LUT_out[27]), 
        .B1(n1028), .Y(n849) );
  OAI21XLTS U1346 ( .A0(n802), .A1(n848), .B0(n849), .Y(add_subt_dataB[29]) );
  AOI22X1TS U1347 ( .A0(d_ff2_X[24]), .A1(n1024), .B0(d_ff2_Z[24]), .B1(n1028), 
        .Y(n850) );
  BUFX3TS U1348 ( .A(n937), .Y(n960) );
  BUFX3TS U1349 ( .A(n1024), .Y(n876) );
  INVX2TS U1350 ( .A(n851), .Y(add_subt_dataA[6]) );
  INVX2TS U1351 ( .A(n852), .Y(add_subt_dataA[4]) );
  BUFX3TS U1352 ( .A(n937), .Y(n966) );
  INVX2TS U1353 ( .A(n853), .Y(add_subt_dataA[8]) );
  INVX2TS U1354 ( .A(n854), .Y(add_subt_dataA[9]) );
  INVX2TS U1355 ( .A(n855), .Y(add_subt_dataA[7]) );
  INVX2TS U1356 ( .A(n856), .Y(add_subt_dataA[11]) );
  INVX2TS U1357 ( .A(n848), .Y(n1023) );
  INVX2TS U1358 ( .A(n857), .Y(add_subt_dataA[2]) );
  INVX2TS U1359 ( .A(n858), .Y(add_subt_dataA[5]) );
  INVX2TS U1360 ( .A(n859), .Y(add_subt_dataA[3]) );
  BUFX3TS U1361 ( .A(n884), .Y(n916) );
  AOI22X1TS U1362 ( .A0(d_ff_Xn[31]), .A1(n860), .B0(data_output2_31_), .B1(
        n916), .Y(n861) );
  AOI22X1TS U1363 ( .A0(d_ff_Xn[30]), .A1(n860), .B0(sign_inv_out[30]), .B1(
        n916), .Y(n862) );
  NAND3X1TS U1364 ( .A(cont_iter_out[1]), .B(n1110), .C(n1204), .Y(n1099) );
  AOI22X1TS U1365 ( .A0(d_ff3_LUT_out[25]), .A1(n1111), .B0(n863), .B1(n1126), 
        .Y(n864) );
  NOR3X1TS U1366 ( .A(n1078), .B(cont_var_out[0]), .C(n1079), .Y(n1061) );
  NAND2X2TS U1367 ( .A(ack_add_subt), .B(n1061), .Y(n1046) );
  AND2X2TS U1368 ( .A(n1040), .B(n1031), .Y(n1054) );
  BUFX3TS U1369 ( .A(n1053), .Y(n1058) );
  INVX2TS U1370 ( .A(n1058), .Y(n1057) );
  NAND2X1TS U1371 ( .A(cont_iter_out[3]), .B(n1057), .Y(n865) );
  OAI31X1TS U1372 ( .A0(n1046), .A1(n804), .A2(n1099), .B0(n865), .Y(n725) );
  NOR2X1TS U1373 ( .A(n1126), .B(n869), .Y(n1120) );
  AOI21X1TS U1374 ( .A0(d_ff3_LUT_out[2]), .A1(n1177), .B0(n1120), .Y(n866) );
  OAI21X1TS U1375 ( .A0(n869), .A1(n1204), .B0(n868), .Y(n1100) );
  AOI21X1TS U1376 ( .A0(d_ff3_LUT_out[1]), .A1(n1177), .B0(n1100), .Y(n870) );
  INVX2TS U1377 ( .A(n1137), .Y(n1168) );
  INVX2TS U1378 ( .A(n1162), .Y(n1011) );
  INVX2TS U1379 ( .A(n872), .Y(n496) );
  INVX2TS U1380 ( .A(n873), .Y(n1101) );
  NAND2X1TS U1381 ( .A(cont_iter_out[3]), .B(n1101), .Y(n1122) );
  INVX2TS U1382 ( .A(n875), .Y(n495) );
  INVX2TS U1383 ( .A(n877), .Y(add_subt_dataA[1]) );
  INVX2TS U1384 ( .A(n878), .Y(add_subt_dataA[12]) );
  BUFX3TS U1385 ( .A(n886), .Y(n906) );
  BUFX3TS U1386 ( .A(n860), .Y(n904) );
  BUFX3TS U1387 ( .A(n884), .Y(n907) );
  AOI22X1TS U1388 ( .A0(d_ff_Xn[11]), .A1(n904), .B0(sign_inv_out[11]), .B1(
        n907), .Y(n879) );
  BUFX3TS U1389 ( .A(n886), .Y(n910) );
  BUFX3TS U1390 ( .A(n860), .Y(n908) );
  AOI22X1TS U1391 ( .A0(d_ff_Xn[4]), .A1(n908), .B0(sign_inv_out[4]), .B1(n907), .Y(n880) );
  AOI22X1TS U1392 ( .A0(d_ff_Xn[0]), .A1(n908), .B0(sign_inv_out[0]), .B1(n884), .Y(n881) );
  AOI22X1TS U1393 ( .A0(d_ff_Xn[8]), .A1(n908), .B0(sign_inv_out[8]), .B1(n907), .Y(n882) );
  AOI22X1TS U1394 ( .A0(d_ff_Xn[9]), .A1(n908), .B0(sign_inv_out[9]), .B1(n907), .Y(n883) );
  BUFX3TS U1395 ( .A(n884), .Y(n898) );
  AOI22X1TS U1396 ( .A0(d_ff_Xn[18]), .A1(n904), .B0(sign_inv_out[18]), .B1(
        n898), .Y(n885) );
  BUFX3TS U1397 ( .A(n886), .Y(n919) );
  BUFX3TS U1398 ( .A(n860), .Y(n917) );
  AOI22X1TS U1399 ( .A0(d_ff_Xn[22]), .A1(n917), .B0(sign_inv_out[22]), .B1(
        n916), .Y(n887) );
  AOI22X1TS U1400 ( .A0(d_ff_Xn[21]), .A1(n917), .B0(sign_inv_out[21]), .B1(
        n898), .Y(n888) );
  AOI22X1TS U1401 ( .A0(d_ff_Xn[15]), .A1(n904), .B0(sign_inv_out[15]), .B1(
        n898), .Y(n889) );
  AOI22X1TS U1402 ( .A0(d_ff_Xn[19]), .A1(n904), .B0(sign_inv_out[19]), .B1(
        n898), .Y(n890) );
  AOI22X1TS U1403 ( .A0(d_ff_Xn[20]), .A1(n917), .B0(sign_inv_out[20]), .B1(
        n898), .Y(n891) );
  AOI22X1TS U1404 ( .A0(d_ff_Xn[26]), .A1(n917), .B0(sign_inv_out[26]), .B1(
        n916), .Y(n892) );
  AOI22X1TS U1405 ( .A0(d_ff_Xn[17]), .A1(n904), .B0(sign_inv_out[17]), .B1(
        n898), .Y(n893) );
  AOI22X1TS U1406 ( .A0(d_ff_Xn[16]), .A1(n904), .B0(sign_inv_out[16]), .B1(
        n898), .Y(n894) );
  AOI22X1TS U1407 ( .A0(d_ff_Xn[13]), .A1(n904), .B0(sign_inv_out[13]), .B1(
        n898), .Y(n895) );
  AOI22X1TS U1408 ( .A0(d_ff_Xn[7]), .A1(n908), .B0(sign_inv_out[7]), .B1(n907), .Y(n896) );
  AOI22X1TS U1409 ( .A0(d_ff_Xn[12]), .A1(n904), .B0(sign_inv_out[12]), .B1(
        n898), .Y(n897) );
  AOI22X1TS U1410 ( .A0(d_ff_Xn[14]), .A1(n904), .B0(sign_inv_out[14]), .B1(
        n898), .Y(n899) );
  AOI22X1TS U1411 ( .A0(d_ff_Xn[6]), .A1(n908), .B0(sign_inv_out[6]), .B1(n907), .Y(n900) );
  AOI22X1TS U1412 ( .A0(d_ff_Xn[1]), .A1(n908), .B0(sign_inv_out[1]), .B1(n884), .Y(n901) );
  AOI22X1TS U1413 ( .A0(d_ff_Xn[5]), .A1(n908), .B0(sign_inv_out[5]), .B1(n907), .Y(n902) );
  AOI22X1TS U1414 ( .A0(d_ff_Xn[2]), .A1(n908), .B0(sign_inv_out[2]), .B1(n907), .Y(n903) );
  AOI22X1TS U1415 ( .A0(d_ff_Xn[10]), .A1(n904), .B0(sign_inv_out[10]), .B1(
        n907), .Y(n905) );
  AOI22X1TS U1416 ( .A0(d_ff_Xn[3]), .A1(n908), .B0(sign_inv_out[3]), .B1(n907), .Y(n909) );
  AOI22X1TS U1417 ( .A0(d_ff_Xn[25]), .A1(n917), .B0(sign_inv_out[25]), .B1(
        n916), .Y(n911) );
  AOI22X1TS U1418 ( .A0(d_ff_Xn[23]), .A1(n917), .B0(sign_inv_out[23]), .B1(
        n916), .Y(n912) );
  AOI22X1TS U1419 ( .A0(d_ff_Xn[28]), .A1(n917), .B0(sign_inv_out[28]), .B1(
        n916), .Y(n913) );
  AOI22X1TS U1420 ( .A0(d_ff_Xn[29]), .A1(n917), .B0(sign_inv_out[29]), .B1(
        n916), .Y(n914) );
  AOI22X1TS U1421 ( .A0(d_ff_Xn[24]), .A1(n917), .B0(sign_inv_out[24]), .B1(
        n916), .Y(n915) );
  AOI22X1TS U1422 ( .A0(d_ff_Xn[27]), .A1(n917), .B0(sign_inv_out[27]), .B1(
        n916), .Y(n918) );
  OAI32X1TS U1423 ( .A0(cont_iter_out[2]), .A1(n1126), .A2(n1046), .B0(n920), 
        .B1(n804), .Y(n726) );
  BUFX3TS U1424 ( .A(n937), .Y(n975) );
  BUFX3TS U1425 ( .A(n953), .Y(n973) );
  INVX2TS U1426 ( .A(n921), .Y(add_subt_dataB[23]) );
  INVX2TS U1427 ( .A(n922), .Y(add_subt_dataB[24]) );
  BUFX3TS U1428 ( .A(n937), .Y(n969) );
  INVX2TS U1429 ( .A(n923), .Y(add_subt_dataB[0]) );
  INVX2TS U1430 ( .A(n924), .Y(add_subt_dataB[2]) );
  AOI222X1TS U1431 ( .A0(d_ff3_LUT_out[13]), .A1(n975), .B0(n943), .B1(
        d_ff3_sh_x_out[13]), .C0(n973), .C1(d_ff3_sh_y_out[13]), .Y(n925) );
  INVX2TS U1432 ( .A(n925), .Y(add_subt_dataB[13]) );
  INVX2TS U1433 ( .A(n926), .Y(add_subt_dataB[1]) );
  BUFX3TS U1434 ( .A(n953), .Y(n948) );
  AOI222X1TS U1435 ( .A0(d_ff3_LUT_out[14]), .A1(n937), .B0(n943), .B1(
        d_ff3_sh_x_out[14]), .C0(n948), .C1(d_ff3_sh_y_out[14]), .Y(n927) );
  INVX2TS U1436 ( .A(n927), .Y(add_subt_dataB[14]) );
  BUFX3TS U1437 ( .A(n953), .Y(n950) );
  AOI222X1TS U1438 ( .A0(d_ff3_LUT_out[15]), .A1(n951), .B0(n943), .B1(
        d_ff3_sh_x_out[15]), .C0(n950), .C1(d_ff3_sh_y_out[15]), .Y(n928) );
  INVX2TS U1439 ( .A(n928), .Y(add_subt_dataB[15]) );
  AOI222X1TS U1440 ( .A0(d_ff3_LUT_out[7]), .A1(n969), .B0(n943), .B1(
        d_ff3_sh_x_out[7]), .C0(n948), .C1(d_ff3_sh_y_out[7]), .Y(n929) );
  INVX2TS U1441 ( .A(n929), .Y(add_subt_dataB[7]) );
  AOI222X1TS U1442 ( .A0(d_ff3_LUT_out[16]), .A1(n937), .B0(n943), .B1(
        d_ff3_sh_x_out[16]), .C0(n950), .C1(d_ff3_sh_y_out[16]), .Y(n930) );
  INVX2TS U1443 ( .A(n930), .Y(add_subt_dataB[16]) );
  AOI222X1TS U1444 ( .A0(d_ff3_LUT_out[26]), .A1(n975), .B0(n971), .B1(
        d_ff3_sh_x_out[26]), .C0(n950), .C1(d_ff3_sh_y_out[26]), .Y(n932) );
  INVX2TS U1445 ( .A(n932), .Y(add_subt_dataB[26]) );
  AOI222X1TS U1446 ( .A0(d_ff3_LUT_out[20]), .A1(n975), .B0(n971), .B1(
        d_ff3_sh_x_out[20]), .C0(n950), .C1(d_ff3_sh_y_out[20]), .Y(n933) );
  INVX2TS U1447 ( .A(n933), .Y(add_subt_dataB[20]) );
  AOI222X1TS U1448 ( .A0(d_ff3_LUT_out[21]), .A1(n975), .B0(n971), .B1(
        d_ff3_sh_x_out[21]), .C0(n950), .C1(d_ff3_sh_y_out[21]), .Y(n934) );
  INVX2TS U1449 ( .A(n934), .Y(add_subt_dataB[21]) );
  AOI222X1TS U1450 ( .A0(d_ff3_LUT_out[3]), .A1(n969), .B0(n1027), .B1(
        d_ff3_sh_x_out[3]), .C0(n948), .C1(d_ff3_sh_y_out[3]), .Y(n935) );
  INVX2TS U1451 ( .A(n935), .Y(add_subt_dataB[3]) );
  AOI222X1TS U1452 ( .A0(n1028), .A1(d_ff3_LUT_out[8]), .B0(n943), .B1(
        d_ff3_sh_x_out[8]), .C0(n948), .C1(d_ff3_sh_y_out[8]), .Y(n936) );
  INVX2TS U1453 ( .A(n936), .Y(add_subt_dataB[8]) );
  AOI222X1TS U1454 ( .A0(d_ff3_LUT_out[11]), .A1(n937), .B0(n943), .B1(
        d_ff3_sh_x_out[11]), .C0(n948), .C1(d_ff3_sh_y_out[11]), .Y(n938) );
  INVX2TS U1455 ( .A(n938), .Y(add_subt_dataB[11]) );
  AOI222X1TS U1456 ( .A0(n937), .A1(d_ff3_LUT_out[19]), .B0(n971), .B1(
        d_ff3_sh_x_out[19]), .C0(n950), .C1(d_ff3_sh_y_out[19]), .Y(n939) );
  INVX2TS U1457 ( .A(n939), .Y(add_subt_dataB[19]) );
  AOI222X1TS U1458 ( .A0(d_ff3_LUT_out[9]), .A1(n951), .B0(n943), .B1(
        d_ff3_sh_x_out[9]), .C0(n948), .C1(d_ff3_sh_y_out[9]), .Y(n940) );
  INVX2TS U1459 ( .A(n940), .Y(add_subt_dataB[9]) );
  INVX2TS U1460 ( .A(n941), .Y(add_subt_dataB[6]) );
  AOI222X1TS U1461 ( .A0(d_ff3_LUT_out[17]), .A1(n969), .B0(n943), .B1(
        d_ff3_sh_x_out[17]), .C0(n950), .C1(d_ff3_sh_y_out[17]), .Y(n942) );
  INVX2TS U1462 ( .A(n942), .Y(add_subt_dataB[17]) );
  AOI222X1TS U1463 ( .A0(d_ff3_LUT_out[10]), .A1(n951), .B0(n943), .B1(
        d_ff3_sh_x_out[10]), .C0(n948), .C1(d_ff3_sh_y_out[10]), .Y(n944) );
  INVX2TS U1464 ( .A(n944), .Y(add_subt_dataB[10]) );
  AOI222X1TS U1465 ( .A0(d_ff3_LUT_out[18]), .A1(n951), .B0(n971), .B1(
        d_ff3_sh_x_out[18]), .C0(n950), .C1(d_ff3_sh_y_out[18]), .Y(n945) );
  INVX2TS U1466 ( .A(n945), .Y(add_subt_dataB[18]) );
  INVX2TS U1467 ( .A(n946), .Y(add_subt_dataB[25]) );
  AOI222X1TS U1468 ( .A0(d_ff3_LUT_out[5]), .A1(n969), .B0(n1027), .B1(
        d_ff3_sh_x_out[5]), .C0(n948), .C1(d_ff3_sh_y_out[5]), .Y(n947) );
  INVX2TS U1469 ( .A(n947), .Y(add_subt_dataB[5]) );
  AOI222X1TS U1470 ( .A0(d_ff3_LUT_out[4]), .A1(n969), .B0(n1027), .B1(
        d_ff3_sh_x_out[4]), .C0(n948), .C1(d_ff3_sh_y_out[4]), .Y(n949) );
  INVX2TS U1471 ( .A(n949), .Y(add_subt_dataB[4]) );
  AOI222X1TS U1472 ( .A0(n951), .A1(d_ff3_LUT_out[22]), .B0(n971), .B1(
        d_ff3_sh_x_out[22]), .C0(n950), .C1(d_ff3_sh_y_out[22]), .Y(n952) );
  INVX2TS U1473 ( .A(n952), .Y(add_subt_dataB[22]) );
  BUFX3TS U1474 ( .A(n953), .Y(n965) );
  INVX2TS U1475 ( .A(n954), .Y(add_subt_dataA[13]) );
  INVX2TS U1476 ( .A(n955), .Y(add_subt_dataA[16]) );
  INVX2TS U1477 ( .A(n957), .Y(add_subt_dataA[10]) );
  INVX2TS U1478 ( .A(n958), .Y(add_subt_dataA[17]) );
  INVX2TS U1479 ( .A(n959), .Y(add_subt_dataA[21]) );
  INVX2TS U1480 ( .A(n961), .Y(add_subt_dataA[22]) );
  INVX2TS U1481 ( .A(n962), .Y(add_subt_dataA[18]) );
  INVX2TS U1482 ( .A(n963), .Y(add_subt_dataA[15]) );
  INVX2TS U1483 ( .A(n964), .Y(add_subt_dataA[19]) );
  INVX2TS U1484 ( .A(n967), .Y(add_subt_dataA[14]) );
  INVX2TS U1485 ( .A(n968), .Y(add_subt_dataA[20]) );
  INVX2TS U1486 ( .A(n970), .Y(add_subt_dataA[31]) );
  INVX2TS U1487 ( .A(n972), .Y(add_subt_dataA[0]) );
  INVX2TS U1488 ( .A(n976), .Y(add_subt_dataA[26]) );
  BUFX3TS U1489 ( .A(n871), .Y(n1012) );
  INVX2TS U1490 ( .A(n977), .Y(n476) );
  INVX2TS U1491 ( .A(n1137), .Y(n1013) );
  BUFX3TS U1492 ( .A(n871), .Y(n990) );
  INVX2TS U1493 ( .A(n978), .Y(n490) );
  INVX2TS U1494 ( .A(n979), .Y(n492) );
  INVX2TS U1495 ( .A(n980), .Y(n488) );
  INVX2TS U1496 ( .A(n981), .Y(n494) );
  INVX2TS U1497 ( .A(n982), .Y(n493) );
  INVX2TS U1498 ( .A(n983), .Y(n486) );
  INVX2TS U1499 ( .A(n984), .Y(n491) );
  INVX2TS U1500 ( .A(n985), .Y(n484) );
  INVX2TS U1501 ( .A(n986), .Y(n489) );
  INVX2TS U1502 ( .A(n987), .Y(n482) );
  INVX2TS U1503 ( .A(n988), .Y(n487) );
  BUFX3TS U1504 ( .A(n871), .Y(n1009) );
  INVX2TS U1505 ( .A(n989), .Y(n466) );
  INVX2TS U1506 ( .A(n991), .Y(n485) );
  INVX2TS U1507 ( .A(n992), .Y(n480) );
  AOI222X1TS U1508 ( .A0(n1172), .A1(d_ff2_Z[24]), .B0(n1009), .B1(d_ff1_Z[24]), .C0(d_ff_Zn[24]), .C1(n1003), .Y(n993) );
  INVX2TS U1509 ( .A(n993), .Y(n472) );
  INVX2TS U1510 ( .A(n994), .Y(n478) );
  INVX2TS U1511 ( .A(n995), .Y(n470) );
  AOI222X1TS U1512 ( .A0(n1164), .A1(d_ff2_Z[25]), .B0(n1009), .B1(d_ff1_Z[25]), .C0(d_ff_Zn[25]), .C1(n1003), .Y(n996) );
  INVX2TS U1513 ( .A(n996), .Y(n471) );
  AOI222X1TS U1514 ( .A0(n1130), .A1(d_ff2_Z[28]), .B0(n1009), .B1(d_ff1_Z[28]), .C0(d_ff_Zn[28]), .C1(n1003), .Y(n997) );
  INVX2TS U1515 ( .A(n997), .Y(n468) );
  INVX2TS U1516 ( .A(n998), .Y(n469) );
  INVX2TS U1517 ( .A(n999), .Y(n477) );
  AOI222X1TS U1518 ( .A0(n1198), .A1(d_ff2_Z[29]), .B0(n1009), .B1(d_ff1_Z[29]), .C0(d_ff_Zn[29]), .C1(n1003), .Y(n1000) );
  INVX2TS U1519 ( .A(n1000), .Y(n467) );
  AOI222X1TS U1520 ( .A0(n1128), .A1(d_ff2_Z[21]), .B0(n1012), .B1(d_ff1_Z[21]), .C0(d_ff_Zn[21]), .C1(n1003), .Y(n1001) );
  INVX2TS U1521 ( .A(n1001), .Y(n475) );
  AOI222X1TS U1522 ( .A0(n1004), .A1(d_ff2_Z[22]), .B0(n1009), .B1(d_ff1_Z[22]), .C0(d_ff_Zn[22]), .C1(n1003), .Y(n1002) );
  INVX2TS U1523 ( .A(n1002), .Y(n474) );
  AOI222X1TS U1524 ( .A0(n1172), .A1(d_ff2_Z[23]), .B0(n1009), .B1(d_ff1_Z[23]), .C0(d_ff_Zn[23]), .C1(n1003), .Y(n1005) );
  INVX2TS U1525 ( .A(n1005), .Y(n473) );
  INVX2TS U1526 ( .A(n1006), .Y(n483) );
  INVX2TS U1527 ( .A(n1008), .Y(n481) );
  INVX2TS U1528 ( .A(n1010), .Y(n465) );
  INVX2TS U1529 ( .A(n1014), .Y(n479) );
  OR4X2TS U1530 ( .A(ack_cordic), .B(n1202), .C(n1206), .D(
        cordic_FSM_state_reg[1]), .Y(n1042) );
  OAI211XLTS U1531 ( .A0(n1016), .A1(n1206), .B0(n1042), .C0(n1015), .Y(n732)
         );
  AOI31XLTS U1532 ( .A0(cordic_FSM_state_reg[0]), .A1(n1038), .A2(
        beg_fsm_cordic), .B0(ack_add_subt), .Y(n1022) );
  OAI211XLTS U1533 ( .A0(n1202), .A1(n1206), .B0(cordic_FSM_state_reg[1]), 
        .C0(n1213), .Y(n1021) );
  AO22XLTS U1534 ( .A0(n1023), .A1(d_ff3_sh_x_out[31]), .B0(n953), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U1535 ( .A0(d_ff3_sh_y_out[30]), .A1(n953), .B0(d_ff3_sh_x_out[30]), 
        .B1(n1023), .Y(add_subt_dataB[30]) );
  AOI22X1TS U1536 ( .A0(n1027), .A1(d_ff3_sh_x_out[27]), .B0(n1024), .B1(
        d_ff3_sh_y_out[27]), .Y(n1026) );
  NAND2X1TS U1537 ( .A(d_ff3_LUT_out[27]), .B(n937), .Y(n1025) );
  NAND2X1TS U1538 ( .A(n1026), .B(n1025), .Y(add_subt_dataB[27]) );
  AOI22X1TS U1539 ( .A0(d_ff2_Z[25]), .A1(n1028), .B0(d_ff2_Y[25]), .B1(n1027), 
        .Y(n1029) );
  OAI2BB1X1TS U1540 ( .A0N(d_ff2_X[25]), .A1N(n953), .B0(n1029), .Y(
        add_subt_dataA[25]) );
  AOI2BB2XLTS U1541 ( .B0(d_ff3_sign_out), .B1(n1208), .A0N(n1208), .A1N(
        d_ff3_sign_out), .Y(op_add_subt) );
  AOI31XLTS U1542 ( .A0(cordic_FSM_state_reg[3]), .A1(cordic_FSM_state_reg[0]), 
        .A2(ack_cordic), .B0(cordic_FSM_state_reg[1]), .Y(n1030) );
  OAI21X1TS U1543 ( .A0(n1031), .A1(n1030), .B0(cordic_FSM_state_reg[2]), .Y(
        n1034) );
  NAND2X1TS U1544 ( .A(cont_var_out[1]), .B(n1208), .Y(n1032) );
  AOI32X1TS U1545 ( .A0(n1035), .A1(n1034), .A2(n1033), .B0(n1213), .B1(n1034), 
        .Y(n731) );
  INVX2TS U1546 ( .A(beg_fsm_cordic), .Y(n1037) );
  NOR2BX1TS U1547 ( .AN(ready_add_subt), .B(cordic_FSM_state_reg[2]), .Y(n1039) );
  NAND3X1TS U1548 ( .A(cont_var_out[0]), .B(ack_add_subt), .C(n1049), .Y(n1051) );
  AOI21X1TS U1549 ( .A0(n1079), .A1(n1051), .B0(n1044), .Y(n729) );
  NAND2X1TS U1550 ( .A(n1057), .B(n1046), .Y(n1045) );
  AOI22X1TS U1551 ( .A0(n1110), .A1(n1045), .B0(n1046), .B1(n1104), .Y(n728)
         );
  NOR2X1TS U1552 ( .A(n1104), .B(n1046), .Y(n1048) );
  AOI21X1TS U1553 ( .A0(cont_iter_out[1]), .A1(n1048), .B0(n1047), .Y(n727) );
  AOI31XLTS U1554 ( .A0(ack_add_subt), .A1(n1049), .A2(n1079), .B0(
        cont_var_out[0]), .Y(n1050) );
  CLKBUFX2TS U1555 ( .A(n1053), .Y(n1055) );
  BUFX3TS U1556 ( .A(n1055), .Y(n1060) );
  INVX2TS U1557 ( .A(n1055), .Y(n1052) );
  INVX2TS U1558 ( .A(n1055), .Y(n1059) );
  INVX2TS U1559 ( .A(n1055), .Y(n1056) );
  NOR2BX1TS U1560 ( .AN(n1061), .B(n1080), .Y(n1062) );
  BUFX3TS U1561 ( .A(n1067), .Y(n1063) );
  INVX2TS U1562 ( .A(n1063), .Y(n1064) );
  BUFX3TS U1563 ( .A(n1067), .Y(n1069) );
  BUFX3TS U1564 ( .A(n1067), .Y(n1065) );
  INVX2TS U1565 ( .A(n1069), .Y(n1066) );
  INVX2TS U1566 ( .A(n1069), .Y(n1068) );
  INVX2TS U1567 ( .A(n1069), .Y(n1070) );
  BUFX3TS U1568 ( .A(n1071), .Y(n1077) );
  OAI2BB2XLTS U1569 ( .B0(n1074), .B1(n1217), .A0N(n1077), .A1N(
        result_add_subt[2]), .Y(n650) );
  OAI2BB2XLTS U1570 ( .B0(n1073), .B1(n1218), .A0N(n1077), .A1N(
        result_add_subt[3]), .Y(n649) );
  OAI2BB2XLTS U1571 ( .B0(n1073), .B1(n1219), .A0N(n1077), .A1N(
        result_add_subt[4]), .Y(n648) );
  BUFX3TS U1572 ( .A(n1072), .Y(n1076) );
  OAI2BB2XLTS U1573 ( .B0(n1073), .B1(n1220), .A0N(n1076), .A1N(
        result_add_subt[5]), .Y(n647) );
  OAI2BB2XLTS U1574 ( .B0(n1073), .B1(n1221), .A0N(n1076), .A1N(
        result_add_subt[6]), .Y(n646) );
  OAI2BB2XLTS U1575 ( .B0(n1073), .B1(n1222), .A0N(n1076), .A1N(
        result_add_subt[7]), .Y(n645) );
  OAI2BB2XLTS U1576 ( .B0(n1073), .B1(n1223), .A0N(n1074), .A1N(
        result_add_subt[8]), .Y(n644) );
  OAI2BB2XLTS U1577 ( .B0(n1073), .B1(n1224), .A0N(n1076), .A1N(
        result_add_subt[9]), .Y(n643) );
  OAI2BB2XLTS U1578 ( .B0(n1073), .B1(n1225), .A0N(n1074), .A1N(
        result_add_subt[10]), .Y(n642) );
  OAI2BB2XLTS U1579 ( .B0(n1075), .B1(n1226), .A0N(n1074), .A1N(
        result_add_subt[11]), .Y(n641) );
  OAI2BB2XLTS U1580 ( .B0(n1075), .B1(n1227), .A0N(n1074), .A1N(
        result_add_subt[12]), .Y(n640) );
  OAI2BB2XLTS U1581 ( .B0(n1075), .B1(n1228), .A0N(n1074), .A1N(
        result_add_subt[13]), .Y(n639) );
  OAI2BB2XLTS U1582 ( .B0(n1075), .B1(n1229), .A0N(n1074), .A1N(
        result_add_subt[14]), .Y(n638) );
  OAI2BB2XLTS U1583 ( .B0(n1073), .B1(n1230), .A0N(n1076), .A1N(
        result_add_subt[15]), .Y(n637) );
  OAI2BB2XLTS U1584 ( .B0(n1075), .B1(n1231), .A0N(n1074), .A1N(
        result_add_subt[16]), .Y(n636) );
  OAI2BB2XLTS U1585 ( .B0(n1075), .B1(n1232), .A0N(n1074), .A1N(
        result_add_subt[17]), .Y(n635) );
  OAI2BB2XLTS U1586 ( .B0(n1075), .B1(n1233), .A0N(n1076), .A1N(
        result_add_subt[18]), .Y(n634) );
  OAI2BB2XLTS U1587 ( .B0(n1075), .B1(n1234), .A0N(n1076), .A1N(
        result_add_subt[19]), .Y(n633) );
  OAI2BB2XLTS U1588 ( .B0(n1075), .B1(n1235), .A0N(n1076), .A1N(
        result_add_subt[20]), .Y(n632) );
  OAI2BB2XLTS U1589 ( .B0(n1071), .B1(n1236), .A0N(n1077), .A1N(
        result_add_subt[21]), .Y(n631) );
  OAI2BB2XLTS U1590 ( .B0(n1071), .B1(n1237), .A0N(n1076), .A1N(
        result_add_subt[22]), .Y(n630) );
  OAI2BB2XLTS U1591 ( .B0(n1072), .B1(n1134), .A0N(n1076), .A1N(
        result_add_subt[23]), .Y(n629) );
  OAI2BB2XLTS U1592 ( .B0(n1072), .B1(n1135), .A0N(n1077), .A1N(
        result_add_subt[24]), .Y(n628) );
  OAI2BB2XLTS U1593 ( .B0(n1071), .B1(n1238), .A0N(n1077), .A1N(
        result_add_subt[25]), .Y(n627) );
  OAI2BB2XLTS U1594 ( .B0(n1071), .B1(n1239), .A0N(n1077), .A1N(
        result_add_subt[26]), .Y(n626) );
  OAI2BB2XLTS U1595 ( .B0(n1072), .B1(n1136), .A0N(n1077), .A1N(
        result_add_subt[27]), .Y(n625) );
  OAI2BB2XLTS U1596 ( .B0(n829), .B1(n1138), .A0N(n1077), .A1N(
        result_add_subt[28]), .Y(n624) );
  OAI2BB2XLTS U1597 ( .B0(n1072), .B1(n1139), .A0N(n1077), .A1N(
        result_add_subt[29]), .Y(n623) );
  AOI21X1TS U1598 ( .A0(n1208), .A1(n1079), .B0(n1078), .Y(n1081) );
  BUFX3TS U1599 ( .A(n810), .Y(n1083) );
  INVX2TS U1600 ( .A(n1083), .Y(n1084) );
  BUFX3TS U1601 ( .A(n810), .Y(n1085) );
  INVX2TS U1602 ( .A(n1083), .Y(n1086) );
  BUFX3TS U1603 ( .A(n810), .Y(n1087) );
  INVX2TS U1604 ( .A(n1083), .Y(n1088) );
  BUFX3TS U1605 ( .A(n1093), .Y(n1095) );
  INVX2TS U1606 ( .A(n1095), .Y(n1090) );
  INVX2TS U1607 ( .A(n1094), .Y(n1091) );
  INVX2TS U1608 ( .A(n1094), .Y(n1096) );
  INVX2TS U1609 ( .A(n1099), .Y(n1121) );
  AOI21X1TS U1610 ( .A0(n1121), .A1(n1193), .B0(n1100), .Y(n1108) );
  AOI22X1TS U1611 ( .A0(n1105), .A1(n1101), .B0(n1111), .B1(d_ff3_LUT_out[0]), 
        .Y(n1102) );
  NAND2X1TS U1612 ( .A(n1108), .B(n1102), .Y(n524) );
  INVX2TS U1613 ( .A(n1105), .Y(n1106) );
  OAI211X1TS U1614 ( .A0(n1106), .A1(n1181), .B0(n1114), .C0(n1193), .Y(n1112)
         );
  OAI2BB1X1TS U1615 ( .A0N(d_ff3_LUT_out[3]), .A1N(n1119), .B0(n1112), .Y(n521) );
  OAI21X1TS U1616 ( .A0(n1181), .A1(cont_iter_out[3]), .B0(n1193), .Y(n1125)
         );
  OA22X1TS U1617 ( .A0(n1187), .A1(d_ff3_LUT_out[4]), .B0(n1125), .B1(n1103), 
        .Y(n520) );
  AOI21X1TS U1618 ( .A0(n1105), .A1(n1104), .B0(n1177), .Y(n1117) );
  OAI2BB1X1TS U1619 ( .A0N(d_ff3_LUT_out[10]), .A1N(n1119), .B0(n1108), .Y(
        n514) );
  AOI22X1TS U1620 ( .A0(n1133), .A1(n1109), .B0(n808), .B1(n1177), .Y(n512) );
  OAI31X1TS U1621 ( .A0(n1110), .A1(n1181), .A2(cont_iter_out[3]), .B0(n1114), 
        .Y(n1116) );
  NOR2X1TS U1622 ( .A(n1111), .B(n1116), .Y(n1113) );
  OAI2BB1X1TS U1623 ( .A0N(d_ff3_LUT_out[15]), .A1N(n1119), .B0(n1115), .Y(
        n509) );
  OAI2BB1X1TS U1624 ( .A0N(d_ff3_LUT_out[16]), .A1N(n1119), .B0(n1112), .Y(
        n508) );
  OAI2BB1X1TS U1625 ( .A0N(d_ff3_LUT_out[17]), .A1N(n1119), .B0(n1115), .Y(
        n507) );
  NAND2X1TS U1626 ( .A(n1133), .B(n1114), .Y(n1118) );
  OAI2BB1X1TS U1627 ( .A0N(d_ff3_LUT_out[19]), .A1N(n1119), .B0(n1118), .Y(
        n505) );
  OAI2BB1X1TS U1628 ( .A0N(d_ff3_LUT_out[20]), .A1N(n1119), .B0(n1115), .Y(
        n504) );
  OAI2BB1X1TS U1629 ( .A0N(d_ff3_LUT_out[22]), .A1N(n1119), .B0(n1118), .Y(
        n502) );
  AOI32X1TS U1630 ( .A0(n1124), .A1(n1123), .A2(n1122), .B0(cont_iter_out[1]), 
        .B1(n1123), .Y(n500) );
  AOI21X1TS U1631 ( .A0(n1126), .A1(n1204), .B0(n1125), .Y(n1127) );
  INVX2TS U1632 ( .A(n1166), .Y(n1185) );
  INVX2TS U1633 ( .A(n1162), .Y(n1173) );
  INVX2TS U1634 ( .A(n1195), .Y(n1201) );
  INVX2TS U1635 ( .A(n1169), .Y(n1128) );
  INVX2TS U1636 ( .A(n1195), .Y(n1197) );
  INVX2TS U1637 ( .A(n1169), .Y(n1130) );
  BUFX3TS U1638 ( .A(n1195), .Y(n1131) );
  BUFX3TS U1639 ( .A(n1159), .Y(n1167) );
  INVX2TS U1640 ( .A(n1167), .Y(n1132) );
  INVX2TS U1641 ( .A(n1167), .Y(n1161) );
  INVX2TS U1642 ( .A(n1195), .Y(n1158) );
  INVX2TS U1643 ( .A(n1169), .Y(n1198) );
  BUFX3TS U1644 ( .A(n1195), .Y(n1200) );
  INVX2TS U1645 ( .A(n1169), .Y(n1164) );
  BUFX3TS U1646 ( .A(n1166), .Y(n1160) );
  OAI22X1TS U1647 ( .A0(n1137), .A1(n801), .B0(n1134), .B1(n1162), .Y(n417) );
  OAI22X1TS U1648 ( .A0(n1137), .A1(n799), .B0(n1135), .B1(n1162), .Y(n416) );
  OAI22X1TS U1649 ( .A0(n1137), .A1(n1209), .B0(n1136), .B1(n1162), .Y(n413)
         );
  OAI22X1TS U1650 ( .A0(n819), .A1(n1151), .B0(n1138), .B1(n1162), .Y(n412) );
  OAI22X1TS U1651 ( .A0(n819), .A1(n1210), .B0(n1139), .B1(n1162), .Y(n411) );
  OAI22X1TS U1652 ( .A0(n819), .A1(n1211), .B0(n1140), .B1(n1162), .Y(n410) );
  AOI22X1TS U1653 ( .A0(cont_iter_out[1]), .A1(n799), .B0(d_ff2_Y[24]), .B1(
        n798), .Y(n1141) );
  XNOR2X1TS U1654 ( .A(n1144), .B(n1141), .Y(n1142) );
  NAND2X1TS U1655 ( .A(d_ff2_Y[24]), .B(n798), .Y(n1143) );
  AOI22X1TS U1656 ( .A0(cont_iter_out[1]), .A1(n799), .B0(n1144), .B1(n1143), 
        .Y(n1146) );
  NOR2X1TS U1657 ( .A(d_ff2_Y[27]), .B(n1150), .Y(n1152) );
  AOI21X1TS U1658 ( .A0(n1150), .A1(d_ff2_Y[27]), .B0(n1152), .Y(n1149) );
  OR3X1TS U1659 ( .A(n1150), .B(d_ff2_Y[28]), .C(d_ff2_Y[27]), .Y(n1154) );
  NOR2X1TS U1660 ( .A(d_ff2_Y[29]), .B(n1154), .Y(n1156) );
  AOI21X1TS U1661 ( .A0(d_ff2_Y[29]), .A1(n1154), .B0(n1156), .Y(n1155) );
  XOR2X1TS U1662 ( .A(d_ff2_Y[30]), .B(n1156), .Y(n1157) );
  OA22X1TS U1663 ( .A0(n1169), .A1(d_ff2_X[1]), .B0(d_ff_Xn[1]), .B1(n1159), 
        .Y(n397) );
  INVX2TS U1664 ( .A(n1195), .Y(n1165) );
  BUFX3TS U1665 ( .A(n1169), .Y(n1171) );
  OA22X1TS U1666 ( .A0(n1171), .A1(d_ff2_X[2]), .B0(d_ff_Xn[2]), .B1(n1167), 
        .Y(n395) );
  OA22X1TS U1667 ( .A0(n1171), .A1(d_ff2_X[3]), .B0(d_ff_Xn[3]), .B1(n1167), 
        .Y(n393) );
  INVX2TS U1668 ( .A(n1195), .Y(n1179) );
  BUFX3TS U1669 ( .A(n1166), .Y(n1163) );
  OA22X1TS U1670 ( .A0(n1171), .A1(d_ff2_X[5]), .B0(d_ff_Xn[5]), .B1(n1167), 
        .Y(n389) );
  OA22X1TS U1671 ( .A0(n1171), .A1(d_ff2_X[6]), .B0(d_ff_Xn[6]), .B1(n1167), 
        .Y(n387) );
  OA22X1TS U1672 ( .A0(n1171), .A1(d_ff2_X[7]), .B0(d_ff_Xn[7]), .B1(n1167), 
        .Y(n385) );
  OA22X1TS U1673 ( .A0(n1171), .A1(d_ff2_X[10]), .B0(d_ff_Xn[10]), .B1(n1167), 
        .Y(n379) );
  BUFX3TS U1674 ( .A(n1162), .Y(n1170) );
  OA22X1TS U1675 ( .A0(n1171), .A1(d_ff2_X[12]), .B0(d_ff_Xn[12]), .B1(n1170), 
        .Y(n375) );
  OA22X1TS U1676 ( .A0(n1171), .A1(d_ff2_X[13]), .B0(d_ff_Xn[13]), .B1(n1170), 
        .Y(n373) );
  OA22X1TS U1677 ( .A0(n1137), .A1(d_ff2_X[14]), .B0(d_ff_Xn[14]), .B1(n1170), 
        .Y(n371) );
  OA22X1TS U1678 ( .A0(n1137), .A1(d_ff2_X[16]), .B0(d_ff_Xn[16]), .B1(n1170), 
        .Y(n367) );
  OA22X1TS U1679 ( .A0(n1137), .A1(d_ff2_X[17]), .B0(d_ff_Xn[17]), .B1(n1170), 
        .Y(n365) );
  OA22X1TS U1680 ( .A0(n1169), .A1(d_ff2_X[19]), .B0(d_ff_Xn[19]), .B1(n1170), 
        .Y(n361) );
  OA22X1TS U1681 ( .A0(n819), .A1(d_ff2_X[20]), .B0(d_ff_Xn[20]), .B1(n1170), 
        .Y(n359) );
  OA22X1TS U1682 ( .A0(d_ff2_X[24]), .A1(n1171), .B0(d_ff_Xn[24]), .B1(n1170), 
        .Y(n352) );
  OA22X1TS U1683 ( .A0(n819), .A1(d_ff2_X[26]), .B0(d_ff_Xn[26]), .B1(n1170), 
        .Y(n350) );
  OA22X1TS U1684 ( .A0(n1169), .A1(d_ff2_X[28]), .B0(d_ff_Xn[28]), .B1(n1159), 
        .Y(n348) );
  OA22X1TS U1685 ( .A0(n1171), .A1(d_ff2_X[29]), .B0(d_ff_Xn[29]), .B1(n1170), 
        .Y(n347) );
  AOI222X1TS U1686 ( .A0(n1181), .A1(n1180), .B0(n805), .B1(n800), .C0(n1180), 
        .C1(n800), .Y(n1183) );
  AOI21X1TS U1687 ( .A0(n1188), .A1(d_ff2_X[27]), .B0(n1184), .Y(n1186) );
  OR3X1TS U1688 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(n1188), .Y(n1190) );
  AOI32X1TS U1689 ( .A0(n1190), .A1(n1187), .A2(n1189), .B0(n807), .B1(n1191), 
        .Y(n340) );
  NOR2X1TS U1690 ( .A(d_ff2_X[29]), .B(n1190), .Y(n1194) );
  AOI21X1TS U1691 ( .A0(d_ff2_X[29]), .A1(n1190), .B0(n1194), .Y(n1192) );
  AOI22X1TS U1692 ( .A0(n1187), .A1(n1192), .B0(n802), .B1(n1191), .Y(n339) );
  XOR2X1TS U1693 ( .A(d_ff2_X[30]), .B(n1194), .Y(n1196) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_syn.sdf"); 
 endmodule

