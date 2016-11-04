/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Nov  3 17:58:16 2016
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
         n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287,
         n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297,
         n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307,
         n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317,
         n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327,
         n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337,
         n1338;
  wire   [1:0] d_ff1_shift_region_flag_out;
  wire   [1:0] cont_var_out;
  wire   [3:0] cont_iter_out;
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

  DFFRX1TS reg_operation_Q_reg_0_ ( .D(n723), .CK(n811), .RN(n1285), .Q(
        d_ff1_operation_out), .QN(n1260) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_23_ ( .D(n353), .CK(n1302), .RN(n1280), 
        .Q(d_ff2_X[23]), .QN(n1259) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(n621), .CK(n1326), .RN(n1286), .Q(
        d_ff_Yn[31]), .QN(n1258) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(n633), .CK(n1324), .RN(n1300), .Q(
        d_ff_Yn[19]), .QN(n1257) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(n634), .CK(n1326), .RN(n1291), .Q(
        d_ff_Yn[18]), .QN(n1256) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(n635), .CK(n1329), .RN(n1287), .Q(
        d_ff_Yn[17]), .QN(n1255) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(n636), .CK(n1331), .RN(n1290), .Q(
        d_ff_Yn[16]), .QN(n1254) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(n637), .CK(n1334), .RN(n1289), .Q(
        d_ff_Yn[15]), .QN(n1253) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(n638), .CK(n809), .RN(n1300), .Q(
        d_ff_Yn[14]), .QN(n1252) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(n639), .CK(n1330), .RN(n1291), .Q(
        d_ff_Yn[13]), .QN(n1251) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(n640), .CK(n1334), .RN(n1290), .Q(
        d_ff_Yn[12]), .QN(n1250) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(n641), .CK(n809), .RN(n1287), .Q(
        d_ff_Yn[11]), .QN(n1249) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(n642), .CK(n1333), .RN(n1289), .Q(
        d_ff_Yn[10]), .QN(n1248) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(n643), .CK(n809), .RN(n1300), .Q(d_ff_Yn[9]), 
        .QN(n1247) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(n644), .CK(n1330), .RN(n1291), .Q(d_ff_Yn[8]), .QN(n1246) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(n645), .CK(n1334), .RN(n1287), .Q(d_ff_Yn[7]), .QN(n1245) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(n646), .CK(n1329), .RN(n1290), .Q(d_ff_Yn[6]), .QN(n1244) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(n647), .CK(n1330), .RN(n1289), .Q(d_ff_Yn[5]), .QN(n1243) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(n648), .CK(n1330), .RN(n1288), .Q(d_ff_Yn[4]), .QN(n1242) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(n649), .CK(n1334), .RN(n1288), .Q(d_ff_Yn[3]), .QN(n1241) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(n650), .CK(n1333), .RN(n1299), .Q(d_ff_Yn[2]), .QN(n1240) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(n651), .CK(n1334), .RN(n1298), .Q(d_ff_Yn[1]), .QN(n1239) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(n652), .CK(n1329), .RN(n1293), .Q(d_ff_Yn[0]), .QN(n1238) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(n340), .CK(n1307), .RN(n1265), .QN(n1237) );
  DFFRX1TS reg_shift_x_Q_reg_29_ ( .D(n339), .CK(n1315), .RN(n1263), .QN(n1236) );
  DFFRX1TS reg_LUT_Q_reg_12_ ( .D(n512), .CK(n1313), .RN(n1263), .QN(n1235) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(n411), .CK(n805), .RN(n1272), 
        .Q(d_ff2_Y[29]), .QN(n1234) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(n413), .CK(n1310), .RN(n1274), 
        .Q(d_ff2_Y[27]), .QN(n1233) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_30_ ( .D(n410), .CK(n1301), .RN(n1276), 
        .Q(d_ff2_Y[30]), .QN(n1232) );
  DFFRX1TS reg_ch_mux_2_Q_reg_0_ ( .D(n686), .CK(n1334), .RN(n1285), .Q(
        sel_mux_2_reg[0]), .QN(n1231) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_28_ ( .D(n412), .CK(n1307), .RN(n1275), 
        .Q(d_ff2_Y[28]), .QN(n1230) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_23_ ( .D(n417), .CK(n1309), .RN(n1272), 
        .Q(d_ff2_Y[23]), .QN(n1229) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(n351), .CK(n1305), .RN(n1283), 
        .Q(d_ff2_X[25]), .QN(n1228) );
  DFFRX1TS cont_var_count_reg_0_ ( .D(n724), .CK(n811), .RN(n1281), .Q(
        cont_var_out[0]), .QN(n1227) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(n416), .CK(n1308), .RN(n1275), 
        .Q(d_ff2_Y[24]), .QN(n1226) );
  DFFRX2TS cordic_FSM_state_reg_reg_0_ ( .D(n730), .CK(n1338), .RN(n331), .Q(
        cordic_FSM_state_reg[0]), .QN(n1225) );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n725), .CK(n1338), .RN(n1281), .Q(
        cont_iter_out[3]), .QN(n1223) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(n722), .CK(n811), .RN(n1281), .Q(
        d_ff1_shift_region_flag_out[0]), .QN(n1222) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(n630), .CK(n806), .RN(n1300), .Q(
        d_ff_Yn[22]), .QN(n1221) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(n632), .CK(n1328), .RN(n1300), .Q(
        d_ff_Yn[20]), .QN(n1220) );
  DFFRX1TS d_ff4_Yn_Q_reg_30_ ( .D(n622), .CK(n806), .RN(n1299), .QN(n1219) );
  DFFRX2TS cont_var_count_reg_1_ ( .D(n729), .CK(n1305), .RN(n1281), .Q(
        cont_var_out[1]), .QN(n1218) );
  DFFRX2TS cont_iter_count_reg_1_ ( .D(n727), .CK(n1338), .RN(n1281), .Q(
        cont_iter_out[1]), .QN(n1217) );
  DFFRX2TS cont_iter_count_reg_0_ ( .D(n728), .CK(n1338), .RN(n1281), .Q(
        cont_iter_out[0]), .QN(n1216) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(n721), .CK(n811), .RN(n1281), .Q(
        d_ff1_shift_region_flag_out[1]), .QN(n1214) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(n626), .CK(n1323), .RN(n1286), .Q(
        d_ff_Yn[26]), .QN(n1213) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(n627), .CK(n1325), .RN(n1291), .Q(
        d_ff_Yn[25]), .QN(n1212) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(n631), .CK(n1326), .RN(n1287), .Q(
        d_ff_Yn[21]), .QN(n1211) );
  DFFRX1TS d_ff4_Yn_Q_reg_29_ ( .D(n623), .CK(n1324), .RN(n1292), .QN(n1210)
         );
  DFFRX1TS d_ff4_Yn_Q_reg_28_ ( .D(n624), .CK(n1325), .RN(n1292), .QN(n1209)
         );
  DFFRX1TS d_ff4_Yn_Q_reg_27_ ( .D(n625), .CK(n1328), .RN(n1292), .QN(n1208)
         );
  DFFRX1TS d_ff4_Yn_Q_reg_24_ ( .D(n628), .CK(n1323), .RN(n1294), .QN(n1207)
         );
  DFFRX1TS d_ff4_Yn_Q_reg_23_ ( .D(n629), .CK(n1323), .RN(n1292), .QN(n1206)
         );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(n587), .CK(n806), .RN(n1299), .Q(
        data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(n585), .CK(n1327), .RN(n1286), .Q(
        data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(n583), .CK(n1323), .RN(n1293), .Q(
        data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(n581), .CK(n1327), .RN(n1262), .Q(
        data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(n579), .CK(n806), .RN(n1271), .Q(
        data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(n577), .CK(n1325), .RN(n1295), .Q(
        data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(n575), .CK(n1324), .RN(n1296), .Q(
        data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(n573), .CK(n1323), .RN(n1296), .Q(
        data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(n571), .CK(n1323), .RN(n1262), .Q(
        data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(n569), .CK(n1324), .RN(n1271), .Q(
        data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(n567), .CK(n1325), .RN(n1295), .Q(
        data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(n565), .CK(n1326), .RN(n1271), .Q(
        data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(n563), .CK(n806), .RN(n1295), .Q(
        data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(n561), .CK(n1328), .RN(n1297), .Q(
        data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(n559), .CK(n1323), .RN(n1290), .Q(
        data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(n557), .CK(n1318), .RN(n1289), .Q(
        data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(n555), .CK(n1320), .RN(n1300), .Q(
        data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(n553), .CK(n1322), .RN(n1286), .Q(
        data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(n551), .CK(n1321), .RN(n1293), .Q(
        data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(n549), .CK(n807), .RN(n1299), .Q(
        data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(n547), .CK(n1318), .RN(n1299), .Q(
        data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(n545), .CK(n1319), .RN(n1288), .Q(
        data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(n543), .CK(n1322), .RN(n1293), .Q(
        data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(n541), .CK(n1318), .RN(n1288), .Q(
        data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(n539), .CK(n1318), .RN(n1289), .Q(
        data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(n537), .CK(n1322), .RN(n1300), .Q(
        data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(n535), .CK(n1319), .RN(n1291), .Q(
        data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(n533), .CK(n1321), .RN(n1291), .Q(
        data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(n531), .CK(n1321), .RN(n1283), .Q(
        data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(n529), .CK(n1318), .RN(n1261), .Q(
        data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(n527), .CK(n1318), .RN(n1261), .Q(
        data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(n525), .CK(n807), .RN(n1261), .Q(
        data_output[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(n400), .CK(n1306), .RN(n1274), .Q(
        d_ff3_sh_y_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(n336), .CK(n1305), .RN(n1280), .Q(
        d_ff3_sh_x_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(n338), .CK(n1313), .RN(n1273), .Q(
        d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(n402), .CK(n808), .RN(n1263), .Q(
        d_ff3_sh_y_out[30]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n505), .CK(n1316), .RN(n1263), .Q(
        d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(n502), .CK(n1315), .RN(n1278), .Q(
        d_ff3_LUT_out[22]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(n720), .CK(n811), .RN(n1270), .Q(d_ff1_Z[0])
         );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(n407), .CK(n1314), .RN(n1263), .Q(
        d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(n406), .CK(n1313), .RN(n1265), .Q(
        d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(n462), .CK(n1307), .RN(n1295), .Q(
        d_ff3_sh_y_out[0]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(n460), .CK(n1310), .RN(n1282), .Q(
        d_ff3_sh_y_out[1]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(n458), .CK(n1312), .RN(n1285), .Q(
        d_ff3_sh_y_out[2]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(n456), .CK(n805), .RN(n1270), .Q(
        d_ff3_sh_y_out[3]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(n454), .CK(n1309), .RN(n1280), .Q(
        d_ff3_sh_y_out[4]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(n452), .CK(n1308), .RN(n1283), .Q(
        d_ff3_sh_y_out[5]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(n450), .CK(n1309), .RN(n1271), .Q(
        d_ff3_sh_y_out[6]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(n448), .CK(n1312), .RN(n1295), .Q(
        d_ff3_sh_y_out[7]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(n444), .CK(n1310), .RN(n1296), .Q(
        d_ff3_sh_y_out[9]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(n442), .CK(n1311), .RN(n1262), .Q(
        d_ff3_sh_y_out[10]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(n440), .CK(n1308), .RN(n1272), .Q(
        d_ff3_sh_y_out[11]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(n436), .CK(n1312), .RN(n1275), .Q(
        d_ff3_sh_y_out[13]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(n434), .CK(n805), .RN(n1272), .Q(
        d_ff3_sh_y_out[14]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(n432), .CK(n1312), .RN(n1276), .Q(
        d_ff3_sh_y_out[15]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(n430), .CK(n1311), .RN(n1263), .Q(
        d_ff3_sh_y_out[16]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(n428), .CK(n1308), .RN(n1273), .Q(
        d_ff3_sh_y_out[17]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(n426), .CK(n1309), .RN(n1284), .Q(
        d_ff3_sh_y_out[18]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(n424), .CK(n1310), .RN(n1267), .Q(
        d_ff3_sh_y_out[19]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(n422), .CK(n1311), .RN(n1267), .Q(
        d_ff3_sh_y_out[20]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(n420), .CK(n1308), .RN(n1272), .Q(
        d_ff3_sh_y_out[21]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(n418), .CK(n1312), .RN(n1276), .Q(
        d_ff3_sh_y_out[22]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(n719), .CK(n811), .RN(n1285), .Q(d_ff1_Z[1])
         );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(n718), .CK(n811), .RN(n1283), .Q(d_ff1_Z[2])
         );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(n717), .CK(n811), .RN(n1282), .Q(d_ff1_Z[3])
         );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(n716), .CK(n811), .RN(n1285), .Q(d_ff1_Z[4])
         );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(n715), .CK(n811), .RN(n1270), .Q(d_ff1_Z[5])
         );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(n714), .CK(n813), .RN(n1280), .Q(d_ff1_Z[6])
         );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(n713), .CK(n813), .RN(n1283), .Q(d_ff1_Z[7])
         );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(n712), .CK(n813), .RN(n1282), .Q(d_ff1_Z[8])
         );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(n711), .CK(n813), .RN(n1285), .Q(d_ff1_Z[9])
         );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(n710), .CK(n813), .RN(n1270), .Q(d_ff1_Z[10])
         );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(n709), .CK(n813), .RN(n1280), .Q(d_ff1_Z[11])
         );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(n708), .CK(n813), .RN(n1283), .Q(d_ff1_Z[12])
         );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(n707), .CK(n813), .RN(n1282), .Q(d_ff1_Z[13])
         );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(n706), .CK(n813), .RN(n1285), .Q(d_ff1_Z[14])
         );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(n705), .CK(n813), .RN(n1270), .Q(d_ff1_Z[15])
         );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(n704), .CK(n1335), .RN(n1280), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(n703), .CK(n1335), .RN(n1283), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(n702), .CK(n1335), .RN(n1282), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(n701), .CK(n1335), .RN(n1285), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(n700), .CK(n1335), .RN(n1270), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(n699), .CK(n1335), .RN(n1280), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(n698), .CK(n1335), .RN(n1265), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(n697), .CK(n1335), .RN(n1267), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(n696), .CK(n1335), .RN(n1273), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(n695), .CK(n1338), .RN(n1265), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(n694), .CK(n1331), .RN(n1265), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(n693), .CK(n1334), .RN(n1284), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(n692), .CK(n809), .RN(n1284), .Q(d_ff1_Z[28])
         );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(n691), .CK(n809), .RN(n1267), .Q(d_ff1_Z[29])
         );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(n690), .CK(n1330), .RN(n1267), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(n689), .CK(n809), .RN(n1284), .Q(d_ff1_Z[31])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(n684), .CK(n1333), .RN(n1287), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(n342), .CK(n1316), .RN(n1273), .Q(
        d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(n398), .CK(n1306), .RN(n1276), .Q(
        d_ff3_sh_x_out[0]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(n396), .CK(n1305), .RN(n1274), .Q(
        d_ff3_sh_x_out[1]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(n394), .CK(n1304), .RN(n1275), .Q(
        d_ff3_sh_x_out[2]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(n392), .CK(n1301), .RN(n1275), .Q(
        d_ff3_sh_x_out[3]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(n390), .CK(n1305), .RN(n1272), .Q(
        d_ff3_sh_x_out[4]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(n388), .CK(n1303), .RN(n1276), .Q(
        d_ff3_sh_x_out[5]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(n386), .CK(n1302), .RN(n1274), .Q(
        d_ff3_sh_x_out[6]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(n384), .CK(n1301), .RN(n1275), .Q(
        d_ff3_sh_x_out[7]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(n382), .CK(n1302), .RN(n1279), .Q(
        d_ff3_sh_x_out[8]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(n380), .CK(n1301), .RN(n1277), .Q(
        d_ff3_sh_x_out[9]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(n378), .CK(n1304), .RN(n1278), .Q(
        d_ff3_sh_x_out[10]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(n376), .CK(n804), .RN(n1279), .Q(
        d_ff3_sh_x_out[11]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(n372), .CK(n1301), .RN(n1278), .Q(
        d_ff3_sh_x_out[13]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(n370), .CK(n1302), .RN(n1279), .Q(
        d_ff3_sh_x_out[14]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(n368), .CK(n1304), .RN(n1277), .Q(
        d_ff3_sh_x_out[15]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(n366), .CK(n804), .RN(n1278), .Q(
        d_ff3_sh_x_out[16]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(n364), .CK(n1303), .RN(n1279), .Q(
        d_ff3_sh_x_out[17]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(n362), .CK(n1303), .RN(n1277), .Q(
        d_ff3_sh_x_out[18]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(n360), .CK(n1305), .RN(n1278), .Q(
        d_ff3_sh_x_out[19]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(n358), .CK(n1304), .RN(n1279), .Q(
        d_ff3_sh_x_out[20]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(n356), .CK(n804), .RN(n1277), .Q(
        d_ff3_sh_x_out[21]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(n354), .CK(n1302), .RN(n1278), .Q(
        d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(n683), .CK(n809), .RN(n1282), .Q(d_ff_Zn[1])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(n682), .CK(n809), .RN(n1285), .Q(d_ff_Zn[2])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(n681), .CK(n1330), .RN(n1270), .Q(d_ff_Zn[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(n680), .CK(n1333), .RN(n1280), .Q(d_ff_Zn[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(n679), .CK(n809), .RN(n1283), .Q(d_ff_Zn[5])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(n678), .CK(n1333), .RN(n1282), .Q(d_ff_Zn[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(n677), .CK(n1331), .RN(n1298), .Q(d_ff_Zn[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(n676), .CK(n1330), .RN(n1288), .Q(d_ff_Zn[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(n675), .CK(n809), .RN(n1298), .Q(d_ff_Zn[9])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(n674), .CK(n1331), .RN(n1286), .Q(
        d_ff_Zn[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(n673), .CK(n1329), .RN(n1288), .Q(
        d_ff_Zn[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(n672), .CK(n1333), .RN(n1288), .Q(
        d_ff_Zn[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(n671), .CK(n1330), .RN(n1298), .Q(
        d_ff_Zn[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(n670), .CK(n1331), .RN(n1293), .Q(
        d_ff_Zn[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(n669), .CK(n1329), .RN(n1288), .Q(
        d_ff_Zn[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(n668), .CK(n1331), .RN(n1298), .Q(
        d_ff_Zn[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(n667), .CK(n1334), .RN(n1300), .Q(
        d_ff_Zn[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(n666), .CK(n1330), .RN(n1291), .Q(
        d_ff_Zn[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(n665), .CK(n1329), .RN(n1290), .Q(
        d_ff_Zn[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(n664), .CK(n1329), .RN(n1287), .Q(
        d_ff_Zn[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(n663), .CK(n1331), .RN(n1289), .Q(
        d_ff_Zn[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(n662), .CK(n1333), .RN(n1300), .Q(
        d_ff_Zn[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(n661), .CK(n1334), .RN(n1291), .Q(
        d_ff_Zn[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(n660), .CK(n1329), .RN(n1287), .Q(
        d_ff_Zn[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(n659), .CK(n1331), .RN(n1290), .Q(
        d_ff_Zn[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(n658), .CK(n1333), .RN(n1289), .Q(
        d_ff_Zn[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(n657), .CK(n1334), .RN(n1299), .Q(
        d_ff_Zn[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(n656), .CK(n1329), .RN(n1286), .Q(
        d_ff_Zn[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(n655), .CK(n1331), .RN(n1286), .Q(
        d_ff_Zn[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(n654), .CK(n1330), .RN(n1293), .Q(
        d_ff_Zn[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(n653), .CK(n1333), .RN(n1299), .Q(
        d_ff_Zn[31]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(n344), .CK(n1315), .RN(n1267), .Q(
        d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n516), .CK(n807), .RN(n1262), .Q(
        d_ff3_LUT_out[8]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(n408), .CK(n808), .RN(n1279), .Q(
        d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n521), .CK(n1320), .RN(n1271), .Q(
        d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n514), .CK(n1314), .RN(n1284), .Q(
        d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n509), .CK(n1313), .RN(n1263), .Q(
        d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(n508), .CK(n1314), .RN(n1263), .Q(
        d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_17_ ( .D(n507), .CK(n1313), .RN(n1263), .Q(
        d_ff3_LUT_out[17]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(n504), .CK(n1315), .RN(n1277), .Q(
        d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n515), .CK(n807), .RN(n1295), .Q(
        d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n503), .CK(n808), .RN(n1278), .Q(
        d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n517), .CK(n1322), .RN(n1296), .Q(
        d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n511), .CK(n1315), .RN(n1273), .Q(
        d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(n510), .CK(n1316), .RN(n1265), .Q(
        d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(n506), .CK(n1314), .RN(n1273), .Q(
        d_ff3_LUT_out[18]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(n343), .CK(n808), .RN(n1273), .Q(
        d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(n438), .CK(n1307), .RN(n1274), .Q(
        d_ff3_sh_y_out[12]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(n405), .CK(n1332), .RN(n1284), .Q(
        d_ff3_sh_y_out[27]) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(n588), .CK(n1325), .RN(n1298), .Q(
        sign_inv_out[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(n586), .CK(n1328), .RN(n1286), .Q(
        sign_inv_out[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(n584), .CK(n1325), .RN(n1299), .Q(
        sign_inv_out[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(n582), .CK(n1328), .RN(n1286), .Q(
        sign_inv_out[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(n580), .CK(n1324), .RN(n1298), .Q(
        sign_inv_out[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(n578), .CK(n1328), .RN(n1297), .Q(
        sign_inv_out[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(n576), .CK(n1325), .RN(n1262), .Q(
        sign_inv_out[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(n574), .CK(n1324), .RN(n1271), .Q(
        sign_inv_out[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(n572), .CK(n1323), .RN(n1296), .Q(
        sign_inv_out[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(n570), .CK(n806), .RN(n1297), .Q(
        sign_inv_out[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(n568), .CK(n1324), .RN(n1296), .Q(
        sign_inv_out[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(n566), .CK(n1325), .RN(n1262), .Q(
        sign_inv_out[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(n564), .CK(n1328), .RN(n1271), .Q(
        sign_inv_out[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(n562), .CK(n1326), .RN(n1295), .Q(
        sign_inv_out[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(n560), .CK(n806), .RN(n1291), .Q(
        sign_inv_out[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(n558), .CK(n1319), .RN(n1287), .Q(
        sign_inv_out[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(n556), .CK(n1318), .RN(n1290), .Q(
        sign_inv_out[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(n554), .CK(n1318), .RN(n1299), .Q(
        sign_inv_out[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(n552), .CK(n1321), .RN(n1293), .Q(
        sign_inv_out[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(n550), .CK(n1320), .RN(n1288), .Q(
        sign_inv_out[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(n548), .CK(n807), .RN(n1298), .Q(
        sign_inv_out[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(n546), .CK(n1318), .RN(n1293), .Q(
        sign_inv_out[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(n544), .CK(n1319), .RN(n1293), .Q(
        sign_inv_out[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(n542), .CK(n1321), .RN(n1298), .Q(
        sign_inv_out[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(n540), .CK(n1320), .RN(n1287), .Q(
        sign_inv_out[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(n538), .CK(n1320), .RN(n1290), .Q(
        sign_inv_out[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(n536), .CK(n1322), .RN(n1289), .Q(
        sign_inv_out[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(n534), .CK(n1321), .RN(n1290), .Q(
        sign_inv_out[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(n532), .CK(n1320), .RN(n1297), .Q(
        sign_inv_out[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(n530), .CK(n807), .RN(n1261), .Q(
        sign_inv_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(n374), .CK(n1304), .RN(n1277), .Q(
        d_ff3_sh_x_out[12]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(n404), .CK(n1317), .RN(n1284), .Q(
        d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(n520), .CK(n1319), .RN(n1262), .Q(
        d_ff3_LUT_out[4]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(n341), .CK(n1316), .RN(n1265), .Q(
        d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(n403), .CK(n1327), .RN(n1267), .Q(
        d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n500), .CK(n1306), .RN(n1279), .Q(
        d_ff3_LUT_out[24]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_0_ ( .D(n496), .CK(n1316), .RN(n1266), 
        .Q(d_ff2_Z[0]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_1_ ( .D(n495), .CK(n1314), .RN(n1273), 
        .Q(d_ff2_Z[1]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_2_ ( .D(n494), .CK(n1315), .RN(n1284), 
        .Q(d_ff2_Z[2]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_3_ ( .D(n493), .CK(n1314), .RN(n1265), 
        .Q(d_ff2_Z[3]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_4_ ( .D(n492), .CK(n1316), .RN(n1266), 
        .Q(d_ff2_Z[4]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_5_ ( .D(n491), .CK(n1316), .RN(n1273), 
        .Q(d_ff2_Z[5]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_6_ ( .D(n490), .CK(n808), .RN(n1284), .Q(
        d_ff2_Z[6]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_7_ ( .D(n489), .CK(n1314), .RN(n1265), 
        .Q(d_ff2_Z[7]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_8_ ( .D(n488), .CK(n1316), .RN(n1267), 
        .Q(d_ff2_Z[8]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_9_ ( .D(n487), .CK(n1314), .RN(n1266), 
        .Q(d_ff2_Z[9]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_10_ ( .D(n486), .CK(n1316), .RN(n1266), 
        .Q(d_ff2_Z[10]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_11_ ( .D(n485), .CK(n1314), .RN(n1266), 
        .Q(d_ff2_Z[11]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_12_ ( .D(n484), .CK(n808), .RN(n1266), 
        .Q(d_ff2_Z[12]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_13_ ( .D(n483), .CK(n1313), .RN(n1266), 
        .Q(d_ff2_Z[13]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_14_ ( .D(n482), .CK(n1336), .RN(n1266), 
        .Q(d_ff2_Z[14]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_15_ ( .D(n481), .CK(n1313), .RN(n1266), 
        .Q(d_ff2_Z[15]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_16_ ( .D(n480), .CK(n1337), .RN(n1268), 
        .Q(d_ff2_Z[16]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_17_ ( .D(n479), .CK(n1316), .RN(n1268), 
        .Q(d_ff2_Z[17]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_18_ ( .D(n478), .CK(n808), .RN(n1268), 
        .Q(d_ff2_Z[18]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_19_ ( .D(n477), .CK(n1314), .RN(n1268), 
        .Q(d_ff2_Z[19]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_20_ ( .D(n476), .CK(n1332), .RN(n1268), 
        .Q(d_ff2_Z[20]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_21_ ( .D(n475), .CK(n1315), .RN(n1268), 
        .Q(d_ff2_Z[21]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_22_ ( .D(n474), .CK(n1313), .RN(n1268), 
        .Q(d_ff2_Z[22]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_26_ ( .D(n470), .CK(n1308), .RN(n1269), 
        .Q(d_ff2_Z[26]) );
  DFFRX1TS reg_shift_x_Q_reg_23_ ( .D(n345), .CK(n1315), .RN(n1273), .Q(
        d_ff3_sh_x_out[23]) );
  DFFRX1TS reg_LUT_Q_reg_23_ ( .D(n501), .CK(n1336), .RN(n1264), .Q(
        d_ff3_LUT_out[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_23_ ( .D(n473), .CK(n1337), .RN(n1268), 
        .Q(d_ff2_Z[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_24_ ( .D(n472), .CK(n1313), .RN(n1268), 
        .Q(d_ff2_Z[24]) );
  DFFRX1TS reg_shift_y_Q_reg_23_ ( .D(n409), .CK(n1317), .RN(n1264), .Q(
        d_ff3_sh_y_out[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_25_ ( .D(n471), .CK(n1315), .RN(n1268), 
        .Q(d_ff2_Z[25]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_27_ ( .D(n469), .CK(n1310), .RN(n1269), 
        .Q(d_ff2_Z[27]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_28_ ( .D(n468), .CK(n1311), .RN(n1269), 
        .Q(d_ff2_Z[28]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_29_ ( .D(n467), .CK(n1309), .RN(n1269), 
        .Q(d_ff2_Z[29]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_30_ ( .D(n466), .CK(n805), .RN(n1269), 
        .Q(d_ff2_Z[30]) );
  DFFRX1TS reg_LUT_Q_reg_25_ ( .D(n499), .CK(n808), .RN(n1264), .Q(
        d_ff3_LUT_out[25]) );
  DFFRX1TS d_ff5_Q_reg_31_ ( .D(n526), .CK(n1320), .RN(n1261), .Q(
        data_output2_31_) );
  DFFRX1TS reg_LUT_Q_reg_1_ ( .D(n523), .CK(n1321), .RN(n1296), .Q(
        d_ff3_LUT_out[1]) );
  DFFRX1TS reg_LUT_Q_reg_2_ ( .D(n522), .CK(n1322), .RN(n1297), .Q(
        d_ff3_LUT_out[2]) );
  DFFRX1TS reg_LUT_Q_reg_0_ ( .D(n524), .CK(n1321), .RN(n1262), .Q(
        d_ff3_LUT_out[0]) );
  DFFRX1TS reg_LUT_Q_reg_6_ ( .D(n518), .CK(n1319), .RN(n1271), .Q(
        d_ff3_LUT_out[6]) );
  DFFRX1TS reg_sign_Q_reg_0_ ( .D(n464), .CK(n1311), .RN(n1269), .Q(
        d_ff3_sign_out) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_0_ ( .D(n399), .CK(n1303), .RN(n1274), 
        .Q(d_ff2_X[0]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_4_ ( .D(n391), .CK(n1306), .RN(n1276), 
        .Q(d_ff2_X[4]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_8_ ( .D(n383), .CK(n1301), .RN(n1264), 
        .Q(d_ff2_X[8]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_9_ ( .D(n381), .CK(n1306), .RN(n1264), 
        .Q(d_ff2_X[9]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_11_ ( .D(n377), .CK(n1302), .RN(n1264), 
        .Q(d_ff2_X[11]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_15_ ( .D(n369), .CK(n1303), .RN(n1277), 
        .Q(d_ff2_X[15]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_18_ ( .D(n363), .CK(n1305), .RN(n1279), 
        .Q(d_ff2_X[18]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_21_ ( .D(n357), .CK(n1303), .RN(n1277), 
        .Q(d_ff2_X[21]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_22_ ( .D(n355), .CK(n1306), .RN(n1278), 
        .Q(d_ff2_X[22]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_31_ ( .D(n337), .CK(n1301), .RN(n1261), 
        .Q(d_ff2_X[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_0_ ( .D(n463), .CK(n1309), .RN(n1269), 
        .Q(d_ff2_Y[0]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_1_ ( .D(n461), .CK(n1310), .RN(n1269), 
        .Q(d_ff2_Y[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_2_ ( .D(n459), .CK(n1309), .RN(n1280), 
        .Q(d_ff2_Y[2]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_3_ ( .D(n457), .CK(n1308), .RN(n1283), 
        .Q(d_ff2_Y[3]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_4_ ( .D(n455), .CK(n1307), .RN(n1282), 
        .Q(d_ff2_Y[4]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_5_ ( .D(n453), .CK(n1311), .RN(n1270), 
        .Q(d_ff2_Y[5]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_6_ ( .D(n451), .CK(n805), .RN(n1295), .Q(
        d_ff2_Y[6]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_7_ ( .D(n449), .CK(n1310), .RN(n1296), 
        .Q(d_ff2_Y[7]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_8_ ( .D(n447), .CK(n1309), .RN(n1297), 
        .Q(d_ff2_Y[8]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_9_ ( .D(n445), .CK(n1308), .RN(n1262), 
        .Q(d_ff2_Y[9]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_10_ ( .D(n443), .CK(n1310), .RN(n1271), 
        .Q(d_ff2_Y[10]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_11_ ( .D(n441), .CK(n805), .RN(n1272), 
        .Q(d_ff2_Y[11]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_12_ ( .D(n439), .CK(n1309), .RN(n1276), 
        .Q(d_ff2_Y[12]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_13_ ( .D(n437), .CK(n1311), .RN(n1274), 
        .Q(d_ff2_Y[13]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_14_ ( .D(n435), .CK(n1308), .RN(n1275), 
        .Q(d_ff2_Y[14]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_15_ ( .D(n433), .CK(n1309), .RN(n1272), 
        .Q(d_ff2_Y[15]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_16_ ( .D(n431), .CK(n805), .RN(n1267), 
        .Q(d_ff2_Y[16]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_17_ ( .D(n429), .CK(n1307), .RN(n1263), 
        .Q(d_ff2_Y[17]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_18_ ( .D(n427), .CK(n1311), .RN(n1284), 
        .Q(d_ff2_Y[18]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_19_ ( .D(n425), .CK(n805), .RN(n1266), 
        .Q(d_ff2_Y[19]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_20_ ( .D(n423), .CK(n1311), .RN(n1267), 
        .Q(d_ff2_Y[20]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_21_ ( .D(n421), .CK(n1310), .RN(n1272), 
        .Q(d_ff2_Y[21]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_22_ ( .D(n419), .CK(n805), .RN(n1276), 
        .Q(d_ff2_Y[22]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_31_ ( .D(n401), .CK(n1305), .RN(n1276), 
        .Q(d_ff2_Y[31]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_1_ ( .D(n397), .CK(n804), .RN(n1274), .Q(
        d_ff2_X[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_2_ ( .D(n395), .CK(n1303), .RN(n1275), 
        .Q(d_ff2_X[2]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_3_ ( .D(n393), .CK(n1302), .RN(n1274), 
        .Q(d_ff2_X[3]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_5_ ( .D(n389), .CK(n804), .RN(n1275), .Q(
        d_ff2_X[5]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_6_ ( .D(n387), .CK(n1305), .RN(n1272), 
        .Q(d_ff2_X[6]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_7_ ( .D(n385), .CK(n1303), .RN(n1276), 
        .Q(d_ff2_X[7]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_10_ ( .D(n379), .CK(n1302), .RN(n1264), 
        .Q(d_ff2_X[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_12_ ( .D(n375), .CK(n804), .RN(n1264), 
        .Q(d_ff2_X[12]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_13_ ( .D(n373), .CK(n1302), .RN(n1278), 
        .Q(d_ff2_X[13]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_14_ ( .D(n371), .CK(n1303), .RN(n1279), 
        .Q(d_ff2_X[14]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_16_ ( .D(n367), .CK(n804), .RN(n1277), 
        .Q(d_ff2_X[16]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_17_ ( .D(n365), .CK(n1301), .RN(n1278), 
        .Q(d_ff2_X[17]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_19_ ( .D(n361), .CK(n804), .RN(n1279), 
        .Q(d_ff2_X[19]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_20_ ( .D(n359), .CK(n1305), .RN(n1277), 
        .Q(d_ff2_X[20]) );
  DFFRX1TS reg_ch_mux_1_Q_reg_0_ ( .D(n687), .CK(n1333), .RN(n1283), .Q(
        sel_mux_1_reg) );
  DFFRX1TS d_ff4_Xn_Q_reg_23_ ( .D(n597), .CK(n1320), .RN(n1292), .Q(
        d_ff_Xn[23]) );
  DFFRX1TS d_ff4_Xn_Q_reg_25_ ( .D(n595), .CK(n1321), .RN(n1294), .Q(
        d_ff_Xn[25]) );
  DFFRX1TS d_ff4_Xn_Q_reg_0_ ( .D(n620), .CK(n1325), .RN(n1292), .Q(d_ff_Xn[0]) );
  DFFRX1TS d_ff4_Xn_Q_reg_4_ ( .D(n616), .CK(n1323), .RN(n1293), .Q(d_ff_Xn[4]) );
  DFFRX1TS d_ff4_Xn_Q_reg_8_ ( .D(n612), .CK(n806), .RN(n1297), .Q(d_ff_Xn[8])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_9_ ( .D(n611), .CK(n1327), .RN(n1262), .Q(d_ff_Xn[9]) );
  DFFRX1TS d_ff4_Xn_Q_reg_11_ ( .D(n609), .CK(n1323), .RN(n1271), .Q(
        d_ff_Xn[11]) );
  DFFRX1TS d_ff4_Xn_Q_reg_15_ ( .D(n605), .CK(n1328), .RN(n1294), .Q(
        d_ff_Xn[15]) );
  DFFRX1TS d_ff4_Xn_Q_reg_18_ ( .D(n602), .CK(n1319), .RN(n1292), .Q(
        d_ff_Xn[18]) );
  DFFRX1TS d_ff4_Xn_Q_reg_21_ ( .D(n599), .CK(n1322), .RN(n1299), .Q(
        d_ff_Xn[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_22_ ( .D(n598), .CK(n1320), .RN(n1292), .Q(
        d_ff_Xn[22]) );
  DFFRX1TS d_ff4_Xn_Q_reg_30_ ( .D(n590), .CK(n1322), .RN(n1261), .Q(
        d_ff_Xn[30]) );
  DFFRX1TS d_ff4_Xn_Q_reg_31_ ( .D(n589), .CK(n1319), .RN(n1261), .Q(
        d_ff_Xn[31]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_31_ ( .D(n465), .CK(n1310), .RN(n1269), 
        .Q(d_ff2_Z[31]) );
  DFFRX1TS d_ff4_Xn_Q_reg_1_ ( .D(n619), .CK(n1324), .RN(n1286), .Q(d_ff_Xn[1]) );
  DFFRX1TS d_ff4_Xn_Q_reg_2_ ( .D(n618), .CK(n1324), .RN(n1288), .Q(d_ff_Xn[2]) );
  DFFRX1TS d_ff4_Xn_Q_reg_3_ ( .D(n617), .CK(n1324), .RN(n1298), .Q(d_ff_Xn[3]) );
  DFFRX1TS d_ff4_Xn_Q_reg_5_ ( .D(n615), .CK(n1325), .RN(n1297), .Q(d_ff_Xn[5]) );
  DFFRX1TS d_ff4_Xn_Q_reg_6_ ( .D(n614), .CK(n1327), .RN(n1296), .Q(d_ff_Xn[6]) );
  DFFRX1TS d_ff4_Xn_Q_reg_7_ ( .D(n613), .CK(n1327), .RN(n1269), .Q(d_ff_Xn[7]) );
  DFFRX1TS d_ff4_Xn_Q_reg_10_ ( .D(n610), .CK(n806), .RN(n1295), .Q(
        d_ff_Xn[10]) );
  DFFRX1TS d_ff4_Xn_Q_reg_12_ ( .D(n608), .CK(n806), .RN(n1295), .Q(
        d_ff_Xn[12]) );
  DFFRX1TS d_ff4_Xn_Q_reg_13_ ( .D(n607), .CK(n1328), .RN(n1296), .Q(
        d_ff_Xn[13]) );
  DFFRX1TS d_ff4_Xn_Q_reg_14_ ( .D(n606), .CK(n1328), .RN(n1294), .Q(
        d_ff_Xn[14]) );
  DFFRX1TS d_ff4_Xn_Q_reg_16_ ( .D(n604), .CK(n1321), .RN(n1294), .Q(
        d_ff_Xn[16]) );
  DFFRX1TS d_ff4_Xn_Q_reg_17_ ( .D(n603), .CK(n807), .RN(n1294), .Q(
        d_ff_Xn[17]) );
  DFFRX1TS d_ff4_Xn_Q_reg_19_ ( .D(n601), .CK(n1320), .RN(n1292), .Q(
        d_ff_Xn[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_20_ ( .D(n600), .CK(n807), .RN(n1292), .Q(
        d_ff_Xn[20]) );
  DFFRX1TS d_ff4_Xn_Q_reg_24_ ( .D(n596), .CK(n1322), .RN(n1294), .Q(
        d_ff_Xn[24]) );
  DFFRX1TS d_ff4_Xn_Q_reg_26_ ( .D(n594), .CK(n807), .RN(n1294), .Q(
        d_ff_Xn[26]) );
  DFFRX1TS d_ff4_Xn_Q_reg_27_ ( .D(n593), .CK(n1319), .RN(n1294), .Q(
        d_ff_Xn[27]) );
  DFFRX1TS d_ff4_Xn_Q_reg_28_ ( .D(n592), .CK(n807), .RN(n1289), .Q(
        d_ff_Xn[28]) );
  DFFRX1TS d_ff4_Xn_Q_reg_29_ ( .D(n591), .CK(n1322), .RN(n1261), .Q(
        d_ff_Xn[29]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_30_ ( .D(n346), .CK(n1301), .RN(n1282), 
        .Q(d_ff2_X[30]) );
  DFFRX1TS reg_ch_mux_3_Q_reg_0_ ( .D(n688), .CK(n1329), .RN(n1282), .Q(
        sel_mux_3_reg) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(n414), .CK(n1308), .RN(n1274), 
        .Q(d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(n350), .CK(n1302), .RN(n1285), 
        .Q(d_ff2_X[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(n415), .CK(n1311), .RN(n1275), 
        .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n685), .CK(n1331), .RN(n1270), .Q(
        sel_mux_2_reg[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_28_ ( .D(n348), .CK(n804), .RN(n1270), 
        .Q(d_ff2_X[28]) );
  DFFRX1TS reg_LUT_Q_reg_27_ ( .D(n497), .CK(n1313), .RN(n1264), .Q(
        d_ff3_LUT_out[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(n347), .CK(n1301), .RN(n1280), 
        .Q(d_ff2_X[29]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_24_ ( .D(n352), .CK(n1303), .RN(n1281), 
        .Q(d_ff2_X[24]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_27_ ( .D(n349), .CK(n804), .RN(n1281), 
        .Q(d_ff2_X[27]) );
  DFFRX2TS cont_iter_count_reg_2_ ( .D(n726), .CK(n1338), .RN(n1281), .Q(
        cont_iter_out[2]), .QN(n1224) );
  DFFRX1TS reg_LUT_Q_reg_26_ ( .D(n498), .CK(n1315), .RN(n1264), .Q(
        d_ff3_LUT_out[26]) );
  DFFRX1TS reg_LUT_Q_reg_11_ ( .D(n513), .CK(n808), .RN(n1265), .Q(
        d_ff3_LUT_out[11]) );
  DFFRX1TS reg_LUT_Q_reg_5_ ( .D(n519), .CK(n1318), .RN(n1297), .Q(
        d_ff3_LUT_out[5]) );
  DFFRX4TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(
        n1338), .RN(n331), .Q(cordic_FSM_state_reg[1]) );
  DFFRX2TS cordic_FSM_state_reg_reg_3_ ( .D(n732), .CK(n1338), .RN(n331), .Q(
        cordic_FSM_state_reg[3]), .QN(n799) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(n528), .CK(n1319), .RN(n1261), .Q(
        sign_inv_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(n446), .CK(n805), .RN(n1297), .Q(
        d_ff3_sh_y_out[8]) );
  DFFRX2TS cordic_FSM_state_reg_reg_2_ ( .D(n731), .CK(n1338), .RN(n331), .Q(
        cordic_FSM_state_reg[2]), .QN(n1215) );
  CLKBUFX3TS U795 ( .A(n985), .Y(n998) );
  OAI32X1TS U796 ( .A0(cont_iter_out[2]), .A1(n1112), .A2(n1166), .B0(n831), 
        .B1(n1224), .Y(n726) );
  AO22XLTS U797 ( .A0(d_ff_Yn[20]), .A1(n1100), .B0(d_ff2_Y[20]), .B1(n1133), 
        .Y(n423) );
  AO22XLTS U798 ( .A0(d_ff_Yn[19]), .A1(n1100), .B0(d_ff2_Y[19]), .B1(n1133), 
        .Y(n425) );
  AO22XLTS U799 ( .A0(n1053), .A1(data_in[0]), .B0(n1167), .B1(d_ff1_Z[0]), 
        .Y(n720) );
  OR3X1TS U800 ( .A(n1215), .B(n799), .C(n821), .Y(n798) );
  CLKBUFX3TS U801 ( .A(n983), .Y(n980) );
  CLKBUFX3TS U802 ( .A(n1199), .Y(n1195) );
  CLKBUFX2TS U803 ( .A(clk), .Y(n836) );
  CLKBUFX3TS U804 ( .A(n818), .Y(n817) );
  CLKBUFX3TS U805 ( .A(n1172), .Y(n818) );
  BUFX3TS U806 ( .A(n818), .Y(n816) );
  BUFX3TS U807 ( .A(n816), .Y(n830) );
  INVX2TS U808 ( .A(n1193), .Y(n1099) );
  CLKBUFX3TS U809 ( .A(n1090), .Y(n1193) );
  INVX2TS U810 ( .A(cordic_FSM_state_reg[3]), .Y(n800) );
  INVX2TS U811 ( .A(n1193), .Y(n801) );
  INVX2TS U812 ( .A(n1193), .Y(n802) );
  AOI222X1TS U813 ( .A0(n1010), .A1(d_ff3_LUT_out[8]), .B0(n1151), .B1(
        d_ff3_sh_x_out[8]), .C0(n1017), .C1(d_ff3_sh_y_out[8]), .Y(n1011) );
  CLKBUFX3TS U814 ( .A(n983), .Y(n1010) );
  NOR4X1TS U815 ( .A(cordic_FSM_state_reg[1]), .B(n1215), .C(n1225), .D(n799), 
        .Y(ready_cordic) );
  INVX2TS U816 ( .A(n798), .Y(n803) );
  CLKBUFX3TS U817 ( .A(n980), .Y(n988) );
  OAI2BB2X2TS U818 ( .B0(n1217), .B1(d_ff2_X[24]), .A0N(n1146), .A1N(n1144), 
        .Y(n1103) );
  NOR2X2TS U819 ( .A(d_ff2_X[23]), .B(n1216), .Y(n1146) );
  NOR2X2TS U820 ( .A(cordic_FSM_state_reg[0]), .B(cordic_FSM_state_reg[3]), 
        .Y(n1044) );
  CLKINVX3TS U821 ( .A(n1108), .Y(n1205) );
  CLKBUFX3TS U822 ( .A(n1132), .Y(n1108) );
  AOI222X4TS U823 ( .A0(n882), .A1(d_ff2_Z[6]), .B0(n870), .B1(d_ff1_Z[6]), 
        .C0(d_ff_Zn[6]), .C1(n894), .Y(n864) );
  AOI222X1TS U824 ( .A0(n899), .A1(d_ff2_Z[21]), .B0(n885), .B1(d_ff1_Z[21]), 
        .C0(d_ff_Zn[21]), .C1(n894), .Y(n886) );
  AOI222X1TS U825 ( .A0(n899), .A1(d_ff2_Z[25]), .B0(n902), .B1(d_ff1_Z[25]), 
        .C0(d_ff_Zn[25]), .C1(n894), .Y(n895) );
  CLKINVX3TS U826 ( .A(n1194), .Y(n894) );
  CLKINVX3TS U827 ( .A(n1195), .Y(n901) );
  CLKINVX3TS U828 ( .A(n998), .Y(n1154) );
  AOI222X1TS U829 ( .A0(n1067), .A1(d_ff2_Z[9]), .B0(n874), .B1(d_ff1_Z[9]), 
        .C0(d_ff_Zn[9]), .C1(n894), .Y(n867) );
  AOI222X4TS U830 ( .A0(n1067), .A1(d_ff2_Z[8]), .B0(n870), .B1(d_ff1_Z[8]), 
        .C0(d_ff_Zn[8]), .C1(n898), .Y(n866) );
  AOI222X1TS U831 ( .A0(n1067), .A1(d_ff2_Z[7]), .B0(n874), .B1(d_ff1_Z[7]), 
        .C0(d_ff_Zn[7]), .C1(n894), .Y(n865) );
  AOI222X1TS U832 ( .A0(n1067), .A1(d_ff2_Z[5]), .B0(n874), .B1(d_ff1_Z[5]), 
        .C0(d_ff_Zn[5]), .C1(n894), .Y(n863) );
  AOI222X4TS U833 ( .A0(n1067), .A1(d_ff2_Z[4]), .B0(n870), .B1(d_ff1_Z[4]), 
        .C0(d_ff_Zn[4]), .C1(n894), .Y(n862) );
  AOI222X1TS U834 ( .A0(n1067), .A1(d_ff2_Z[3]), .B0(n874), .B1(d_ff1_Z[3]), 
        .C0(d_ff_Zn[3]), .C1(n894), .Y(n861) );
  AOI222X4TS U835 ( .A0(n1067), .A1(d_ff2_Z[2]), .B0(n870), .B1(d_ff1_Z[2]), 
        .C0(d_ff_Zn[2]), .C1(n1092), .Y(n860) );
  AOI222X1TS U836 ( .A0(n1067), .A1(d_ff2_Z[1]), .B0(n870), .B1(d_ff1_Z[1]), 
        .C0(d_ff_Zn[1]), .C1(n1092), .Y(n859) );
  AOI222X1TS U837 ( .A0(n801), .A1(d_ff2_Z[0]), .B0(n901), .B1(d_ff_Zn[0]), 
        .C0(n870), .C1(d_ff1_Z[0]), .Y(n858) );
  NAND2X2TS U838 ( .A(cont_iter_out[2]), .B(n1189), .Y(n1105) );
  CLKINVX3TS U839 ( .A(n1108), .Y(n1189) );
  NAND2X2TS U840 ( .A(n1217), .B(n1223), .Y(n1094) );
  NOR2X2TS U841 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[3]), 
        .Y(n1135) );
  CLKBUFX3TS U842 ( .A(n937), .Y(n928) );
  NAND3X2TS U843 ( .A(n1157), .B(cordic_FSM_state_reg[0]), .C(
        cordic_FSM_state_reg[3]), .Y(n937) );
  CLKINVX3TS U844 ( .A(n830), .Y(n1290) );
  CLKINVX3TS U845 ( .A(n830), .Y(n1289) );
  CLKINVX3TS U846 ( .A(n830), .Y(n1287) );
  CLKINVX3TS U847 ( .A(n830), .Y(n1291) );
  CLKINVX3TS U848 ( .A(n830), .Y(n1300) );
  CLKINVX3TS U849 ( .A(n816), .Y(n1292) );
  CLKINVX3TS U850 ( .A(n816), .Y(n1298) );
  CLKINVX3TS U851 ( .A(n816), .Y(n1288) );
  CLKINVX3TS U852 ( .A(n816), .Y(n1293) );
  CLKINVX3TS U853 ( .A(n830), .Y(n1270) );
  CLKINVX3TS U854 ( .A(n816), .Y(n1285) );
  CLKINVX3TS U855 ( .A(n816), .Y(n1266) );
  CLKINVX3TS U856 ( .A(n817), .Y(n1263) );
  CLKINVX3TS U857 ( .A(n830), .Y(n1284) );
  CLKINVX3TS U858 ( .A(n818), .Y(n1273) );
  CLKINVX3TS U859 ( .A(n817), .Y(n1297) );
  CLKINVX3TS U860 ( .A(n830), .Y(n1294) );
  CLKINVX3TS U861 ( .A(n817), .Y(n1296) );
  CLKINVX3TS U862 ( .A(n1172), .Y(n1261) );
  CLKINVX3TS U863 ( .A(n815), .Y(n1264) );
  CLKINVX3TS U864 ( .A(n815), .Y(n1278) );
  CLKINVX3TS U865 ( .A(n815), .Y(n1279) );
  CLKINVX3TS U866 ( .A(n815), .Y(n1277) );
  CLKINVX3TS U867 ( .A(n816), .Y(n1299) );
  CLKINVX3TS U868 ( .A(n816), .Y(n1286) );
  CLKINVX3TS U869 ( .A(n818), .Y(n1272) );
  CLKINVX3TS U870 ( .A(n817), .Y(n1269) );
  CLKINVX3TS U871 ( .A(n817), .Y(n1262) );
  CLKINVX3TS U872 ( .A(n817), .Y(n1271) );
  CLKINVX3TS U873 ( .A(n817), .Y(n1295) );
  CLKINVX3TS U874 ( .A(n817), .Y(n1267) );
  CLKINVX3TS U875 ( .A(n815), .Y(n1265) );
  CLKINVX3TS U876 ( .A(n818), .Y(n1268) );
  CLKINVX3TS U877 ( .A(n818), .Y(n1276) );
  CLKINVX3TS U878 ( .A(n818), .Y(n1274) );
  CLKINVX3TS U879 ( .A(n818), .Y(n1275) );
  INVX3TS U880 ( .A(n830), .Y(n1281) );
  CLKINVX3TS U881 ( .A(n817), .Y(n1283) );
  CLKINVX3TS U882 ( .A(n818), .Y(n1282) );
  BUFX3TS U883 ( .A(n833), .Y(n1306) );
  CLKINVX6TS U884 ( .A(n812), .Y(n804) );
  BUFX6TS U885 ( .A(n833), .Y(n1305) );
  BUFX6TS U886 ( .A(n833), .Y(n1301) );
  BUFX6TS U887 ( .A(n833), .Y(n1302) );
  BUFX6TS U888 ( .A(n833), .Y(n1303) );
  BUFX3TS U889 ( .A(n835), .Y(n1307) );
  CLKINVX6TS U890 ( .A(n810), .Y(n805) );
  BUFX6TS U891 ( .A(n835), .Y(n1308) );
  BUFX6TS U892 ( .A(n835), .Y(n1311) );
  BUFX6TS U893 ( .A(n835), .Y(n1310) );
  BUFX6TS U894 ( .A(n835), .Y(n1309) );
  BUFX3TS U895 ( .A(n832), .Y(n1327) );
  CLKINVX6TS U896 ( .A(n812), .Y(n806) );
  BUFX6TS U897 ( .A(n832), .Y(n1325) );
  BUFX6TS U898 ( .A(n832), .Y(n1328) );
  BUFX6TS U899 ( .A(n832), .Y(n1323) );
  BUFX6TS U900 ( .A(n832), .Y(n1324) );
  CLKINVX6TS U901 ( .A(n810), .Y(n807) );
  CLKBUFX2TS U902 ( .A(n834), .Y(n1317) );
  BUFX6TS U903 ( .A(n834), .Y(n1318) );
  BUFX6TS U904 ( .A(n834), .Y(n1319) );
  BUFX6TS U905 ( .A(n834), .Y(n1320) );
  BUFX6TS U906 ( .A(n834), .Y(n1321) );
  BUFX6TS U907 ( .A(n834), .Y(n1322) );
  BUFX4TS U908 ( .A(n836), .Y(n808) );
  BUFX6TS U909 ( .A(n836), .Y(n1315) );
  BUFX6TS U910 ( .A(n836), .Y(n1316) );
  BUFX6TS U911 ( .A(n836), .Y(n1313) );
  BUFX6TS U912 ( .A(n836), .Y(n1314) );
  CLKINVX6TS U913 ( .A(n810), .Y(n809) );
  CLKBUFX2TS U914 ( .A(clk), .Y(n1332) );
  BUFX6TS U915 ( .A(n1317), .Y(n1330) );
  BUFX6TS U916 ( .A(n836), .Y(n1331) );
  BUFX6TS U917 ( .A(n1312), .Y(n1329) );
  BUFX6TS U918 ( .A(n1304), .Y(n1334) );
  BUFX6TS U919 ( .A(n1326), .Y(n1333) );
  INVX2TS U920 ( .A(n1337), .Y(n810) );
  CLKINVX6TS U921 ( .A(n810), .Y(n811) );
  CLKBUFX2TS U922 ( .A(clk), .Y(n1337) );
  INVX2TS U923 ( .A(n1336), .Y(n812) );
  CLKINVX6TS U924 ( .A(n812), .Y(n813) );
  CLKBUFX2TS U925 ( .A(clk), .Y(n1336) );
  NAND3X2TS U926 ( .A(cordic_FSM_state_reg[2]), .B(n1158), .C(n799), .Y(n1133)
         );
  NOR2X4TS U927 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n1158) );
  AOI222X4TS U928 ( .A0(d_ff3_LUT_out[24]), .A1(n1005), .B0(d_ff3_sh_y_out[24]), .B1(n1021), .C0(d_ff3_sh_x_out[24]), .C1(n975), .Y(n990) );
  AOI221X4TS U929 ( .A0(n1087), .A1(n1205), .B0(d_ff3_LUT_out[24]), .B1(n1203), 
        .C0(n1082), .Y(n1084) );
  NOR2BX2TS U930 ( .AN(n1027), .B(n1026), .Y(n1028) );
  NOR3X1TS U931 ( .A(n1159), .B(cont_var_out[0]), .C(n1218), .Y(n1027) );
  NOR2X2TS U932 ( .A(d_ff2_Y[23]), .B(n1216), .Y(n1125) );
  CLKBUFX3TS U933 ( .A(n1062), .Y(n1052) );
  CLKBUFX3TS U934 ( .A(n1149), .Y(n1129) );
  CLKBUFX3TS U935 ( .A(n1049), .Y(n1042) );
  CLKINVX3TS U936 ( .A(n998), .Y(n1012) );
  CLKINVX3TS U937 ( .A(n1194), .Y(n898) );
  CLKBUFX3TS U938 ( .A(n1195), .Y(n1194) );
  CLKBUFX3TS U939 ( .A(n837), .Y(n983) );
  CLKBUFX3TS U940 ( .A(n1101), .Y(n1192) );
  CLKINVX3TS U941 ( .A(n1193), .Y(n882) );
  CLKINVX3TS U942 ( .A(n1193), .Y(n899) );
  CLKINVX3TS U943 ( .A(n830), .Y(n1280) );
  BUFX4TS U944 ( .A(clk), .Y(n1335) );
  BUFX4TS U945 ( .A(clk), .Y(n1338) );
  INVX2TS U946 ( .A(n1224), .Y(n814) );
  AOI222X1TS U947 ( .A0(cont_iter_out[2]), .A1(n1103), .B0(n814), .B1(n1228), 
        .C0(n1103), .C1(n1228), .Y(n1063) );
  AOI222X4TS U948 ( .A0(n1114), .A1(cont_iter_out[2]), .B0(n1114), .B1(n1216), 
        .C0(cont_iter_out[3]), .C1(n1224), .Y(n1186) );
  OAI211X2TS U949 ( .A0(n814), .A1(n1094), .B0(n1205), .C0(n1188), .Y(n1190)
         );
  NOR4X4TS U950 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[1]), 
        .C(n1225), .D(n799), .Y(ack_add_subt) );
  OAI21XLTS U951 ( .A0(n1085), .A1(n1229), .B0(n893), .Y(n409) );
  OAI21XLTS U952 ( .A0(n1209), .A1(n918), .B0(n853), .Y(n532) );
  OAI21XLTS U953 ( .A0(n1251), .A1(n944), .B0(n943), .Y(n562) );
  OAI21XLTS U954 ( .A0(n1235), .A1(n840), .B0(n839), .Y(add_subt_dataB[12]) );
  OAI21XLTS U955 ( .A0(n1237), .A1(n985), .B0(n984), .Y(add_subt_dataB[28]) );
  OAI21XLTS U956 ( .A0(n1229), .A1(n985), .B0(n951), .Y(add_subt_dataA[23]) );
  OAI21XLTS U957 ( .A0(n1230), .A1(n985), .B0(n954), .Y(add_subt_dataA[28]) );
  AND3X1TS U958 ( .A(n1158), .B(n1215), .C(n800), .Y(n1172) );
  CLKBUFX2TS U959 ( .A(n816), .Y(n815) );
  NAND2X2TS U960 ( .A(cont_iter_out[0]), .B(cont_iter_out[1]), .Y(n1112) );
  NAND2X2TS U961 ( .A(cont_iter_out[2]), .B(cont_iter_out[3]), .Y(n1188) );
  NOR2X2TS U962 ( .A(n1112), .B(n1188), .Y(n1159) );
  INVX2TS U963 ( .A(n1159), .Y(n1065) );
  XNOR2X1TS U964 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), 
        .Y(n819) );
  XOR2X1TS U965 ( .A(d_ff1_shift_region_flag_out[0]), .B(n819), .Y(n916) );
  NOR2X1TS U966 ( .A(n916), .B(n1065), .Y(n828) );
  AOI21X1TS U967 ( .A0(cont_var_out[0]), .A1(n1065), .B0(n828), .Y(n1171) );
  NAND4X1TS U968 ( .A(cordic_FSM_state_reg[3]), .B(n1158), .C(ready_add_subt), 
        .D(n1215), .Y(n1026) );
  NOR2XLTS U969 ( .A(n1171), .B(n1026), .Y(n820) );
  CLKBUFX2TS U970 ( .A(n820), .Y(n824) );
  CLKBUFX2TS U971 ( .A(n824), .Y(n1174) );
  CLKBUFX3TS U972 ( .A(n1174), .Y(n1176) );
  OAI2BB2XLTS U973 ( .B0(n1176), .B1(n1240), .A0N(n824), .A1N(
        result_add_subt[2]), .Y(n650) );
  CLKBUFX2TS U974 ( .A(n1174), .Y(n826) );
  OAI2BB2XLTS U975 ( .B0(n1176), .B1(n1238), .A0N(n826), .A1N(
        result_add_subt[0]), .Y(n652) );
  CLKBUFX3TS U976 ( .A(n826), .Y(n1175) );
  OAI2BB2XLTS U977 ( .B0(n1175), .B1(n1241), .A0N(n824), .A1N(
        result_add_subt[3]), .Y(n649) );
  OAI2BB2XLTS U978 ( .B0(n1175), .B1(n1239), .A0N(n826), .A1N(
        result_add_subt[1]), .Y(n651) );
  OAI2BB2XLTS U979 ( .B0(n1175), .B1(n1242), .A0N(n824), .A1N(
        result_add_subt[4]), .Y(n648) );
  INVX2TS U980 ( .A(n1158), .Y(n821) );
  INVX2TS U981 ( .A(n803), .Y(n1062) );
  CLKBUFX2TS U982 ( .A(n1062), .Y(n1068) );
  INVX2TS U983 ( .A(n1068), .Y(n1038) );
  OAI33X1TS U984 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(
        d_ff1_operation_out), .A2(n1222), .B0(n1214), .B1(n1260), .B2(
        d_ff1_shift_region_flag_out[0]), .Y(n822) );
  XOR2XLTS U985 ( .A(data_output2_31_), .B(n822), .Y(n823) );
  AO22XLTS U986 ( .A0(n1038), .A1(n823), .B0(n798), .B1(data_output[31]), .Y(
        n525) );
  CLKBUFX3TS U987 ( .A(n1174), .Y(n1177) );
  OAI2BB2XLTS U988 ( .B0(n1177), .B1(n1258), .A0N(n826), .A1N(
        result_add_subt[31]), .Y(n621) );
  CLKBUFX3TS U989 ( .A(n824), .Y(n1179) );
  OAI2BB2XLTS U990 ( .B0(n1179), .B1(n1207), .A0N(n1174), .A1N(
        result_add_subt[24]), .Y(n628) );
  OAI2BB2XLTS U991 ( .B0(n1179), .B1(n1208), .A0N(n826), .A1N(
        result_add_subt[27]), .Y(n625) );
  OAI2BB2XLTS U992 ( .B0(n1179), .B1(n1209), .A0N(n824), .A1N(
        result_add_subt[28]), .Y(n624) );
  OAI2BB2XLTS U993 ( .B0(n1179), .B1(n1210), .A0N(n1174), .A1N(
        result_add_subt[29]), .Y(n623) );
  OAI2BB2XLTS U994 ( .B0(n1179), .B1(n1211), .A0N(n1174), .A1N(
        result_add_subt[21]), .Y(n631) );
  OAI2BB2XLTS U995 ( .B0(n1179), .B1(n1212), .A0N(n826), .A1N(
        result_add_subt[25]), .Y(n627) );
  OAI2BB2XLTS U996 ( .B0(n1179), .B1(n1213), .A0N(n824), .A1N(
        result_add_subt[26]), .Y(n626) );
  NAND2X1TS U997 ( .A(n1215), .B(cordic_FSM_state_reg[1]), .Y(n1048) );
  INVX2TS U998 ( .A(n1048), .Y(n1157) );
  NAND2X1TS U999 ( .A(n1157), .B(n1044), .Y(n825) );
  INVX2TS U1000 ( .A(n825), .Y(n1050) );
  CLKBUFX2TS U1001 ( .A(n1050), .Y(n1049) );
  INVX2TS U1002 ( .A(n1050), .Y(n1055) );
  AO22XLTS U1003 ( .A0(n1049), .A1(data_in[21]), .B0(n1055), .B1(d_ff1_Z[21]), 
        .Y(n699) );
  AO22XLTS U1004 ( .A0(n1049), .A1(data_in[22]), .B0(n1055), .B1(d_ff1_Z[22]), 
        .Y(n698) );
  OAI2BB2XLTS U1005 ( .B0(n1179), .B1(n1219), .A0N(n826), .A1N(
        result_add_subt[30]), .Y(n622) );
  AOI21X1TS U1006 ( .A0(n1227), .A1(n1218), .B0(n1159), .Y(n827) );
  OR3X2TS U1007 ( .A(n828), .B(n827), .C(n1026), .Y(n1149) );
  CLKBUFX2TS U1008 ( .A(n1149), .Y(n1139) );
  INVX2TS U1009 ( .A(n1139), .Y(n829) );
  CLKBUFX2TS U1010 ( .A(n1149), .Y(n1141) );
  AO22XLTS U1011 ( .A0(n829), .A1(result_add_subt[31]), .B0(n1141), .B1(
        d_ff_Xn[31]), .Y(n589) );
  AO22XLTS U1012 ( .A0(n829), .A1(result_add_subt[30]), .B0(n1141), .B1(
        d_ff_Xn[30]), .Y(n590) );
  INVX2TS U1013 ( .A(n1133), .Y(n1198) );
  CLKBUFX3TS U1014 ( .A(n1198), .Y(n1090) );
  CLKBUFX3TS U1015 ( .A(n1090), .Y(n1200) );
  NAND2X1TS U1016 ( .A(n1198), .B(sel_mux_1_reg), .Y(n1199) );
  CLKBUFX3TS U1017 ( .A(n1195), .Y(n1197) );
  OA22X1TS U1018 ( .A0(n1200), .A1(d_ff2_X[20]), .B0(d_ff_Xn[20]), .B1(n1197), 
        .Y(n359) );
  OA22X1TS U1019 ( .A0(n1200), .A1(d_ff2_X[19]), .B0(d_ff_Xn[19]), .B1(n1197), 
        .Y(n361) );
  OA22X1TS U1020 ( .A0(n1200), .A1(d_ff2_X[17]), .B0(d_ff_Xn[17]), .B1(n1197), 
        .Y(n365) );
  OA22X1TS U1021 ( .A0(n1200), .A1(d_ff2_X[16]), .B0(d_ff_Xn[16]), .B1(n1197), 
        .Y(n367) );
  OA22X1TS U1022 ( .A0(n1200), .A1(d_ff2_X[14]), .B0(d_ff_Xn[14]), .B1(n1197), 
        .Y(n371) );
  OA22X1TS U1023 ( .A0(n1090), .A1(d_ff2_X[13]), .B0(d_ff_Xn[13]), .B1(n1197), 
        .Y(n373) );
  CLKBUFX2TS U1024 ( .A(n1195), .Y(n1196) );
  OA22X1TS U1025 ( .A0(n1090), .A1(d_ff2_X[6]), .B0(d_ff_Xn[6]), .B1(n1196), 
        .Y(n387) );
  OA22X1TS U1026 ( .A0(n1090), .A1(d_ff2_X[3]), .B0(d_ff_Xn[3]), .B1(n1196), 
        .Y(n393) );
  OA22X1TS U1027 ( .A0(n1193), .A1(d_ff2_X[2]), .B0(d_ff_Xn[2]), .B1(n1196), 
        .Y(n395) );
  OA22X1TS U1028 ( .A0(n1090), .A1(d_ff2_X[1]), .B0(d_ff_Xn[1]), .B1(n1195), 
        .Y(n397) );
  OA22X1TS U1029 ( .A0(n1200), .A1(d_ff2_X[26]), .B0(d_ff_Xn[26]), .B1(n1197), 
        .Y(n350) );
  OA22X1TS U1030 ( .A0(n1193), .A1(d_ff2_X[28]), .B0(d_ff_Xn[28]), .B1(n1194), 
        .Y(n348) );
  OA22X1TS U1031 ( .A0(n1193), .A1(d_ff2_X[29]), .B0(d_ff_Xn[29]), .B1(n1197), 
        .Y(n347) );
  OA22X1TS U1032 ( .A0(d_ff2_X[24]), .A1(n1090), .B0(d_ff_Xn[24]), .B1(n1197), 
        .Y(n352) );
  NAND2X2TS U1033 ( .A(ack_add_subt), .B(n1027), .Y(n1166) );
  INVX2TS U1034 ( .A(n1053), .Y(n1167) );
  OAI21XLTS U1035 ( .A0(n1112), .A1(n1166), .B0(n1167), .Y(n831) );
  CLKBUFX2TS U1036 ( .A(clk), .Y(n832) );
  CLKBUFX2TS U1037 ( .A(clk), .Y(n834) );
  BUFX3TS U1038 ( .A(n832), .Y(n1326) );
  CLKBUFX2TS U1039 ( .A(clk), .Y(n833) );
  BUFX3TS U1040 ( .A(n833), .Y(n1304) );
  CLKBUFX2TS U1041 ( .A(clk), .Y(n835) );
  BUFX3TS U1042 ( .A(n835), .Y(n1312) );
  NOR2X1TS U1043 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n986) );
  CLKBUFX2TS U1044 ( .A(n986), .Y(n1003) );
  CLKBUFX2TS U1045 ( .A(n1003), .Y(n979) );
  CLKBUFX2TS U1046 ( .A(n979), .Y(n1152) );
  NAND2X1TS U1047 ( .A(n1231), .B(sel_mux_2_reg[1]), .Y(n840) );
  INVX2TS U1048 ( .A(n840), .Y(n837) );
  OR2X2TS U1049 ( .A(n1231), .B(sel_mux_2_reg[1]), .Y(n985) );
  AOI22X1TS U1050 ( .A0(d_ff2_Z[25]), .A1(n983), .B0(d_ff2_Y[25]), .B1(n1151), 
        .Y(n838) );
  OAI2BB1X1TS U1051 ( .A0N(d_ff2_X[25]), .A1N(n1152), .B0(n838), .Y(
        add_subt_dataA[25]) );
  CLKBUFX3TS U1052 ( .A(n979), .Y(n1153) );
  AOI22X1TS U1053 ( .A0(n1154), .A1(d_ff3_sh_x_out[12]), .B0(n1153), .B1(
        d_ff3_sh_y_out[12]), .Y(n839) );
  INVX2TS U1054 ( .A(rst), .Y(n331) );
  NAND3X1TS U1055 ( .A(cont_iter_out[1]), .B(cont_iter_out[0]), .C(n1223), .Y(
        n1081) );
  NAND2X1TS U1056 ( .A(cont_iter_out[3]), .B(n1167), .Y(n841) );
  OAI31X1TS U1057 ( .A0(n1166), .A1(n1224), .A2(n1081), .B0(n841), .Y(n725) );
  NAND2BX1TS U1058 ( .AN(n928), .B(sel_mux_3_reg), .Y(n856) );
  CLKBUFX2TS U1059 ( .A(n856), .Y(n918) );
  CLKBUFX3TS U1060 ( .A(n918), .Y(n944) );
  NOR2X2TS U1061 ( .A(sel_mux_3_reg), .B(n937), .Y(n919) );
  CLKBUFX2TS U1062 ( .A(n919), .Y(n854) );
  CLKBUFX3TS U1063 ( .A(n854), .Y(n942) );
  CLKBUFX3TS U1064 ( .A(n928), .Y(n941) );
  AOI22X1TS U1065 ( .A0(d_ff_Xn[18]), .A1(n942), .B0(sign_inv_out[18]), .B1(
        n941), .Y(n842) );
  OAI21XLTS U1066 ( .A0(n1256), .A1(n944), .B0(n842), .Y(n552) );
  AOI22X1TS U1067 ( .A0(d_ff_Xn[19]), .A1(n942), .B0(sign_inv_out[19]), .B1(
        n941), .Y(n843) );
  OAI21XLTS U1068 ( .A0(n1257), .A1(n944), .B0(n843), .Y(n550) );
  AOI22X1TS U1069 ( .A0(d_ff_Xn[20]), .A1(n919), .B0(sign_inv_out[20]), .B1(
        n941), .Y(n844) );
  OAI21XLTS U1070 ( .A0(n1220), .A1(n918), .B0(n844), .Y(n548) );
  CLKBUFX2TS U1071 ( .A(n856), .Y(n908) );
  AOI22X1TS U1072 ( .A0(d_ff_Xn[21]), .A1(n919), .B0(sign_inv_out[21]), .B1(
        n941), .Y(n845) );
  OAI21XLTS U1073 ( .A0(n1211), .A1(n908), .B0(n845), .Y(n546) );
  CLKBUFX2TS U1074 ( .A(n854), .Y(n906) );
  CLKBUFX3TS U1075 ( .A(n928), .Y(n905) );
  AOI22X1TS U1076 ( .A0(d_ff_Xn[22]), .A1(n906), .B0(sign_inv_out[22]), .B1(
        n905), .Y(n846) );
  OAI21XLTS U1077 ( .A0(n1221), .A1(n918), .B0(n846), .Y(n544) );
  AOI22X1TS U1078 ( .A0(d_ff_Xn[23]), .A1(n854), .B0(sign_inv_out[23]), .B1(
        n905), .Y(n847) );
  OAI21XLTS U1079 ( .A0(n1206), .A1(n908), .B0(n847), .Y(n542) );
  AOI22X1TS U1080 ( .A0(d_ff_Xn[24]), .A1(n906), .B0(sign_inv_out[24]), .B1(
        n905), .Y(n848) );
  OAI21XLTS U1081 ( .A0(n1207), .A1(n918), .B0(n848), .Y(n540) );
  AOI22X1TS U1082 ( .A0(d_ff_Xn[25]), .A1(n854), .B0(sign_inv_out[25]), .B1(
        n905), .Y(n849) );
  OAI21XLTS U1083 ( .A0(n1212), .A1(n908), .B0(n849), .Y(n538) );
  NOR2X1TS U1084 ( .A(sel_mux_1_reg), .B(n801), .Y(n872) );
  CLKBUFX2TS U1085 ( .A(n872), .Y(n874) );
  CLKBUFX3TS U1086 ( .A(n874), .Y(n902) );
  AOI222X1TS U1087 ( .A0(n801), .A1(d_ff2_Z[31]), .B0(n902), .B1(d_ff1_Z[31]), 
        .C0(d_ff_Zn[31]), .C1(n901), .Y(n850) );
  INVX2TS U1088 ( .A(n850), .Y(n465) );
  AOI22X1TS U1089 ( .A0(d_ff_Xn[26]), .A1(n906), .B0(sign_inv_out[26]), .B1(
        n905), .Y(n851) );
  OAI21XLTS U1090 ( .A0(n1213), .A1(n918), .B0(n851), .Y(n536) );
  AOI22X1TS U1091 ( .A0(d_ff_Xn[27]), .A1(n854), .B0(sign_inv_out[27]), .B1(
        n905), .Y(n852) );
  OAI21XLTS U1092 ( .A0(n1208), .A1(n908), .B0(n852), .Y(n534) );
  AOI22X1TS U1093 ( .A0(d_ff_Xn[28]), .A1(n906), .B0(sign_inv_out[28]), .B1(
        n905), .Y(n853) );
  AOI22X1TS U1094 ( .A0(d_ff_Xn[29]), .A1(n854), .B0(sign_inv_out[29]), .B1(
        n905), .Y(n855) );
  OAI21XLTS U1095 ( .A0(n1210), .A1(n856), .B0(n855), .Y(n530) );
  AOI22X1TS U1096 ( .A0(d_ff_Xn[30]), .A1(n906), .B0(sign_inv_out[30]), .B1(
        n905), .Y(n857) );
  OAI21XLTS U1097 ( .A0(n1219), .A1(n908), .B0(n857), .Y(n528) );
  INVX2TS U1098 ( .A(n1090), .Y(n1067) );
  CLKBUFX2TS U1099 ( .A(n874), .Y(n870) );
  INVX2TS U1100 ( .A(n858), .Y(n496) );
  INVX2TS U1101 ( .A(n1194), .Y(n1092) );
  INVX2TS U1102 ( .A(n859), .Y(n495) );
  INVX2TS U1103 ( .A(n860), .Y(n494) );
  INVX2TS U1104 ( .A(n861), .Y(n493) );
  INVX2TS U1105 ( .A(n862), .Y(n492) );
  INVX2TS U1106 ( .A(n863), .Y(n491) );
  INVX2TS U1107 ( .A(n864), .Y(n490) );
  INVX2TS U1108 ( .A(n865), .Y(n489) );
  INVX2TS U1109 ( .A(n866), .Y(n488) );
  INVX2TS U1110 ( .A(n867), .Y(n487) );
  NOR3X1TS U1111 ( .A(cont_iter_out[0]), .B(cont_iter_out[2]), .C(n1094), .Y(
        n909) );
  NAND3XLTS U1112 ( .A(cordic_FSM_state_reg[0]), .B(n1157), .C(n800), .Y(n869)
         );
  NAND3XLTS U1113 ( .A(n869), .B(sel_mux_1_reg), .C(n1287), .Y(n868) );
  OAI21XLTS U1114 ( .A0(n909), .A1(n869), .B0(n868), .Y(n687) );
  AOI222X1TS U1115 ( .A0(n882), .A1(d_ff2_Z[10]), .B0(n870), .B1(d_ff1_Z[10]), 
        .C0(d_ff_Zn[10]), .C1(n901), .Y(n871) );
  INVX2TS U1116 ( .A(n871), .Y(n486) );
  AOI222X1TS U1117 ( .A0(n882), .A1(d_ff2_Z[11]), .B0(n872), .B1(d_ff1_Z[11]), 
        .C0(d_ff_Zn[11]), .C1(n898), .Y(n873) );
  INVX2TS U1118 ( .A(n873), .Y(n485) );
  CLKBUFX3TS U1119 ( .A(n874), .Y(n885) );
  AOI222X1TS U1120 ( .A0(n882), .A1(d_ff2_Z[12]), .B0(n885), .B1(d_ff1_Z[12]), 
        .C0(d_ff_Zn[12]), .C1(n898), .Y(n875) );
  INVX2TS U1121 ( .A(n875), .Y(n484) );
  AOI222X1TS U1122 ( .A0(n882), .A1(d_ff2_Z[13]), .B0(n885), .B1(d_ff1_Z[13]), 
        .C0(d_ff_Zn[13]), .C1(n898), .Y(n876) );
  INVX2TS U1123 ( .A(n876), .Y(n483) );
  AOI222X1TS U1124 ( .A0(n882), .A1(d_ff2_Z[14]), .B0(n885), .B1(d_ff1_Z[14]), 
        .C0(d_ff_Zn[14]), .C1(n901), .Y(n877) );
  INVX2TS U1125 ( .A(n877), .Y(n482) );
  AOI222X1TS U1126 ( .A0(n882), .A1(d_ff2_Z[15]), .B0(n885), .B1(d_ff1_Z[15]), 
        .C0(d_ff_Zn[15]), .C1(n898), .Y(n878) );
  INVX2TS U1127 ( .A(n878), .Y(n481) );
  AOI222X1TS U1128 ( .A0(n882), .A1(d_ff2_Z[16]), .B0(n885), .B1(d_ff1_Z[16]), 
        .C0(d_ff_Zn[16]), .C1(n898), .Y(n879) );
  INVX2TS U1129 ( .A(n879), .Y(n480) );
  AOI222X1TS U1130 ( .A0(n882), .A1(d_ff2_Z[17]), .B0(n885), .B1(d_ff1_Z[17]), 
        .C0(d_ff_Zn[17]), .C1(n901), .Y(n880) );
  INVX2TS U1131 ( .A(n880), .Y(n479) );
  AOI222X1TS U1132 ( .A0(n899), .A1(d_ff2_Z[18]), .B0(n885), .B1(d_ff1_Z[18]), 
        .C0(d_ff_Zn[18]), .C1(n901), .Y(n881) );
  INVX2TS U1133 ( .A(n881), .Y(n478) );
  AOI222X1TS U1134 ( .A0(n882), .A1(d_ff2_Z[19]), .B0(n885), .B1(d_ff1_Z[19]), 
        .C0(d_ff_Zn[19]), .C1(n901), .Y(n883) );
  INVX2TS U1135 ( .A(n883), .Y(n477) );
  AOI222X1TS U1136 ( .A0(n899), .A1(d_ff2_Z[20]), .B0(n885), .B1(d_ff1_Z[20]), 
        .C0(d_ff_Zn[20]), .C1(n901), .Y(n884) );
  INVX2TS U1137 ( .A(n884), .Y(n476) );
  INVX2TS U1138 ( .A(n886), .Y(n475) );
  AOI222X1TS U1139 ( .A0(n899), .A1(d_ff2_Z[22]), .B0(n902), .B1(d_ff1_Z[22]), 
        .C0(d_ff_Zn[22]), .C1(n898), .Y(n887) );
  INVX2TS U1140 ( .A(n887), .Y(n474) );
  AOI222X1TS U1141 ( .A0(n801), .A1(d_ff2_Z[26]), .B0(n902), .B1(d_ff1_Z[26]), 
        .C0(d_ff_Zn[26]), .C1(n901), .Y(n888) );
  INVX2TS U1142 ( .A(n888), .Y(n470) );
  NAND3XLTS U1143 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n1135), .Y(n1025) );
  CLKBUFX2TS U1144 ( .A(n1025), .Y(n1096) );
  CLKBUFX2TS U1145 ( .A(n1096), .Y(n1132) );
  NAND2X1TS U1146 ( .A(n1189), .B(n1216), .Y(n1085) );
  CLKBUFX2TS U1147 ( .A(n1096), .Y(n1101) );
  CLKBUFX3TS U1148 ( .A(n1101), .Y(n1185) );
  AOI22X1TS U1149 ( .A0(n1205), .A1(n1146), .B0(d_ff3_sh_x_out[23]), .B1(n1185), .Y(n889) );
  OAI21XLTS U1150 ( .A0(n1259), .A1(n1085), .B0(n889), .Y(n345) );
  INVX2TS U1151 ( .A(n1105), .Y(n1088) );
  NAND2X1TS U1152 ( .A(cont_iter_out[3]), .B(n1088), .Y(n1083) );
  CLKBUFX3TS U1153 ( .A(n1101), .Y(n1203) );
  AOI32X1TS U1154 ( .A0(cont_iter_out[0]), .A1(n1205), .A2(n1188), .B0(
        d_ff3_LUT_out[23]), .B1(n1203), .Y(n890) );
  OAI21XLTS U1155 ( .A0(cont_iter_out[0]), .A1(n1083), .B0(n890), .Y(n501) );
  AOI222X1TS U1156 ( .A0(n899), .A1(d_ff2_Z[23]), .B0(n902), .B1(d_ff1_Z[23]), 
        .C0(d_ff_Zn[23]), .C1(n894), .Y(n891) );
  INVX2TS U1157 ( .A(n891), .Y(n473) );
  AOI222X1TS U1158 ( .A0(n899), .A1(d_ff2_Z[24]), .B0(n902), .B1(d_ff1_Z[24]), 
        .C0(d_ff_Zn[24]), .C1(n894), .Y(n892) );
  INVX2TS U1159 ( .A(n892), .Y(n472) );
  AOI22X1TS U1160 ( .A0(n1205), .A1(n1125), .B0(d_ff3_sh_y_out[23]), .B1(n1185), .Y(n893) );
  INVX2TS U1161 ( .A(n895), .Y(n471) );
  AOI222X1TS U1162 ( .A0(n899), .A1(d_ff2_Z[27]), .B0(n902), .B1(d_ff1_Z[27]), 
        .C0(d_ff_Zn[27]), .C1(n898), .Y(n896) );
  INVX2TS U1163 ( .A(n896), .Y(n469) );
  AOI222X1TS U1164 ( .A0(n899), .A1(d_ff2_Z[28]), .B0(n902), .B1(d_ff1_Z[28]), 
        .C0(d_ff_Zn[28]), .C1(n898), .Y(n897) );
  INVX2TS U1165 ( .A(n897), .Y(n468) );
  AOI222X1TS U1166 ( .A0(n899), .A1(d_ff2_Z[29]), .B0(n902), .B1(d_ff1_Z[29]), 
        .C0(d_ff_Zn[29]), .C1(n898), .Y(n900) );
  INVX2TS U1167 ( .A(n900), .Y(n467) );
  AOI222X1TS U1168 ( .A0(n801), .A1(d_ff2_Z[30]), .B0(n902), .B1(d_ff1_Z[30]), 
        .C0(d_ff_Zn[30]), .C1(n901), .Y(n903) );
  INVX2TS U1169 ( .A(n903), .Y(n466) );
  INVX2TS U1170 ( .A(n1108), .Y(n1183) );
  NAND2X2TS U1171 ( .A(n1183), .B(n1224), .Y(n1106) );
  INVX2TS U1172 ( .A(n1106), .Y(n1131) );
  AOI22X1TS U1173 ( .A0(d_ff3_LUT_out[25]), .A1(n1203), .B0(n1131), .B1(n1112), 
        .Y(n904) );
  OAI21XLTS U1174 ( .A0(n1081), .A1(n1105), .B0(n904), .Y(n499) );
  AOI22X1TS U1175 ( .A0(d_ff_Xn[31]), .A1(n906), .B0(data_output2_31_), .B1(
        n905), .Y(n907) );
  OAI21XLTS U1176 ( .A0(n1258), .A1(n908), .B0(n907), .Y(n526) );
  NAND2X1TS U1177 ( .A(n1189), .B(n909), .Y(n1093) );
  OAI21X1TS U1178 ( .A0(n1106), .A1(n1223), .B0(n1093), .Y(n1086) );
  AOI21X1TS U1179 ( .A0(d_ff3_LUT_out[1]), .A1(n1185), .B0(n1086), .Y(n910) );
  OAI21XLTS U1180 ( .A0(cont_iter_out[3]), .A1(n1105), .B0(n910), .Y(n523) );
  NOR2X1TS U1181 ( .A(n1112), .B(n1106), .Y(n1082) );
  AOI21X1TS U1182 ( .A0(d_ff3_LUT_out[2]), .A1(n1185), .B0(n1082), .Y(n911) );
  OAI21XLTS U1183 ( .A0(n1094), .A1(n1105), .B0(n911), .Y(n522) );
  OAI211XLTS U1184 ( .A0(cont_iter_out[0]), .A1(cont_iter_out[3]), .B0(
        cont_iter_out[1]), .C0(n1224), .Y(n912) );
  OAI21X1TS U1185 ( .A0(cont_iter_out[0]), .A1(n1094), .B0(n912), .Y(n1181) );
  AOI22X1TS U1186 ( .A0(n1205), .A1(n1181), .B0(d_ff3_LUT_out[6]), .B1(n1203), 
        .Y(n913) );
  OAI31X1TS U1187 ( .A0(n1216), .A1(n1223), .A2(n1106), .B0(n913), .Y(n518) );
  NAND3XLTS U1188 ( .A(n1157), .B(cordic_FSM_state_reg[3]), .C(n1225), .Y(n915) );
  NAND3XLTS U1189 ( .A(n915), .B(sel_mux_3_reg), .C(n1290), .Y(n914) );
  OAI21XLTS U1190 ( .A0(n916), .A1(n915), .B0(n914), .Y(n688) );
  NAND3X1TS U1191 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[1]), 
        .C(n1044), .Y(n1170) );
  INVX2TS U1192 ( .A(n1170), .Y(n1173) );
  NAND2X1TS U1193 ( .A(sel_mux_2_reg[1]), .B(n1289), .Y(n917) );
  OAI32X1TS U1194 ( .A0(n1170), .A1(n1159), .A2(n1218), .B0(n1173), .B1(n917), 
        .Y(n685) );
  CLKBUFX3TS U1195 ( .A(n918), .Y(n932) );
  CLKBUFX3TS U1196 ( .A(n919), .Y(n930) );
  AOI22X1TS U1197 ( .A0(d_ff_Xn[0]), .A1(n930), .B0(sign_inv_out[0]), .B1(n928), .Y(n920) );
  OAI21XLTS U1198 ( .A0(n1238), .A1(n932), .B0(n920), .Y(n588) );
  AOI22X1TS U1199 ( .A0(d_ff_Xn[1]), .A1(n930), .B0(sign_inv_out[1]), .B1(n937), .Y(n921) );
  OAI21XLTS U1200 ( .A0(n1239), .A1(n932), .B0(n921), .Y(n586) );
  AOI22X1TS U1201 ( .A0(d_ff_Xn[2]), .A1(n930), .B0(sign_inv_out[2]), .B1(n937), .Y(n922) );
  OAI21XLTS U1202 ( .A0(n1240), .A1(n932), .B0(n922), .Y(n584) );
  AOI22X1TS U1203 ( .A0(d_ff_Xn[3]), .A1(n930), .B0(sign_inv_out[3]), .B1(n928), .Y(n923) );
  OAI21XLTS U1204 ( .A0(n1241), .A1(n932), .B0(n923), .Y(n582) );
  AOI22X1TS U1205 ( .A0(d_ff_Xn[4]), .A1(n930), .B0(sign_inv_out[4]), .B1(n928), .Y(n924) );
  OAI21XLTS U1206 ( .A0(n1242), .A1(n932), .B0(n924), .Y(n580) );
  AOI22X1TS U1207 ( .A0(d_ff_Xn[5]), .A1(n930), .B0(sign_inv_out[5]), .B1(n928), .Y(n925) );
  OAI21XLTS U1208 ( .A0(n1243), .A1(n932), .B0(n925), .Y(n578) );
  AOI22X1TS U1209 ( .A0(d_ff_Xn[6]), .A1(n930), .B0(sign_inv_out[6]), .B1(n928), .Y(n926) );
  OAI21XLTS U1210 ( .A0(n1244), .A1(n932), .B0(n926), .Y(n576) );
  AOI22X1TS U1211 ( .A0(d_ff_Xn[7]), .A1(n930), .B0(sign_inv_out[7]), .B1(n928), .Y(n927) );
  OAI21XLTS U1212 ( .A0(n1245), .A1(n932), .B0(n927), .Y(n574) );
  AOI22X1TS U1213 ( .A0(d_ff_Xn[8]), .A1(n930), .B0(sign_inv_out[8]), .B1(n928), .Y(n929) );
  OAI21XLTS U1214 ( .A0(n1246), .A1(n932), .B0(n929), .Y(n572) );
  AOI22X1TS U1215 ( .A0(d_ff_Xn[9]), .A1(n930), .B0(sign_inv_out[9]), .B1(n937), .Y(n931) );
  OAI21XLTS U1216 ( .A0(n1247), .A1(n932), .B0(n931), .Y(n570) );
  AOI22X1TS U1217 ( .A0(d_ff_Xn[10]), .A1(n942), .B0(sign_inv_out[10]), .B1(
        n937), .Y(n933) );
  OAI21XLTS U1218 ( .A0(n1248), .A1(n944), .B0(n933), .Y(n568) );
  AOI22X1TS U1219 ( .A0(d_ff_Xn[17]), .A1(n942), .B0(sign_inv_out[17]), .B1(
        n941), .Y(n934) );
  OAI21XLTS U1220 ( .A0(n1255), .A1(n944), .B0(n934), .Y(n554) );
  AOI22X1TS U1221 ( .A0(d_ff_Xn[14]), .A1(n942), .B0(sign_inv_out[14]), .B1(
        n941), .Y(n935) );
  OAI21XLTS U1222 ( .A0(n1252), .A1(n944), .B0(n935), .Y(n560) );
  AOI22X1TS U1223 ( .A0(d_ff_Xn[15]), .A1(n942), .B0(sign_inv_out[15]), .B1(
        n941), .Y(n936) );
  OAI21XLTS U1224 ( .A0(n1253), .A1(n944), .B0(n936), .Y(n558) );
  AOI22X1TS U1225 ( .A0(d_ff_Xn[11]), .A1(n942), .B0(sign_inv_out[11]), .B1(
        n937), .Y(n938) );
  OAI21XLTS U1226 ( .A0(n1249), .A1(n944), .B0(n938), .Y(n566) );
  AOI22X1TS U1227 ( .A0(d_ff_Xn[12]), .A1(n942), .B0(sign_inv_out[12]), .B1(
        n941), .Y(n939) );
  OAI21XLTS U1228 ( .A0(n1250), .A1(n944), .B0(n939), .Y(n564) );
  AOI22X1TS U1229 ( .A0(d_ff_Xn[16]), .A1(n942), .B0(sign_inv_out[16]), .B1(
        n941), .Y(n940) );
  OAI21XLTS U1230 ( .A0(n1254), .A1(n944), .B0(n940), .Y(n556) );
  AOI22X1TS U1231 ( .A0(d_ff_Xn[13]), .A1(n942), .B0(sign_inv_out[13]), .B1(
        n941), .Y(n943) );
  NAND4XLTS U1232 ( .A(n799), .B(cordic_FSM_state_reg[1]), .C(
        cordic_FSM_state_reg[2]), .D(cordic_FSM_state_reg[0]), .Y(n1160) );
  INVX2TS U1233 ( .A(n1160), .Y(beg_add_subt) );
  AOI22X1TS U1234 ( .A0(d_ff2_Z[30]), .A1(n1010), .B0(d_ff2_X[30]), .B1(n1153), 
        .Y(n945) );
  OAI21XLTS U1235 ( .A0(n1232), .A1(n998), .B0(n945), .Y(add_subt_dataA[30])
         );
  AOI22X1TS U1236 ( .A0(d_ff2_Z[29]), .A1(n983), .B0(d_ff2_X[29]), .B1(n1153), 
        .Y(n946) );
  OAI21XLTS U1237 ( .A0(n1234), .A1(n985), .B0(n946), .Y(add_subt_dataA[29])
         );
  INVX2TS U1238 ( .A(n998), .Y(n996) );
  CLKBUFX3TS U1239 ( .A(n1003), .Y(n1021) );
  AOI222X1TS U1240 ( .A0(d_ff2_Z[31]), .A1(n837), .B0(d_ff2_Y[31]), .B1(n1154), 
        .C0(d_ff2_X[31]), .C1(n1021), .Y(n947) );
  INVX2TS U1241 ( .A(n947), .Y(add_subt_dataA[31]) );
  AOI22X1TS U1242 ( .A0(d_ff2_Z[27]), .A1(n1010), .B0(d_ff2_X[27]), .B1(n1153), 
        .Y(n948) );
  OAI21XLTS U1243 ( .A0(n1233), .A1(n985), .B0(n948), .Y(add_subt_dataA[27])
         );
  CLKBUFX3TS U1244 ( .A(n1010), .Y(n1005) );
  INVX2TS U1245 ( .A(n998), .Y(n975) );
  AOI222X1TS U1246 ( .A0(d_ff2_Z[26]), .A1(n1005), .B0(d_ff2_Y[26]), .B1(n1154), .C0(d_ff2_X[26]), .C1(n1021), .Y(n949) );
  INVX2TS U1247 ( .A(n949), .Y(add_subt_dataA[26]) );
  AOI22X1TS U1248 ( .A0(d_ff2_X[24]), .A1(n1153), .B0(d_ff2_Z[24]), .B1(n983), 
        .Y(n950) );
  OAI21XLTS U1249 ( .A0(n1226), .A1(n985), .B0(n950), .Y(add_subt_dataA[24])
         );
  AOI22X1TS U1250 ( .A0(d_ff2_X[23]), .A1(n1153), .B0(d_ff2_Z[23]), .B1(n1010), 
        .Y(n951) );
  CLKBUFX3TS U1251 ( .A(n979), .Y(n964) );
  AOI222X1TS U1252 ( .A0(d_ff2_Z[22]), .A1(n988), .B0(d_ff2_Y[22]), .B1(n973), 
        .C0(d_ff2_X[22]), .C1(n964), .Y(n952) );
  INVX2TS U1253 ( .A(n952), .Y(add_subt_dataA[22]) );
  AOI222X1TS U1254 ( .A0(d_ff2_Z[21]), .A1(n1005), .B0(d_ff2_Y[21]), .B1(n973), 
        .C0(d_ff2_X[21]), .C1(n964), .Y(n953) );
  INVX2TS U1255 ( .A(n953), .Y(add_subt_dataA[21]) );
  AOI22X1TS U1256 ( .A0(d_ff2_Z[28]), .A1(n1010), .B0(d_ff2_X[28]), .B1(n1153), 
        .Y(n954) );
  CLKBUFX3TS U1257 ( .A(n983), .Y(n967) );
  AOI222X1TS U1258 ( .A0(d_ff2_Z[19]), .A1(n967), .B0(d_ff2_Y[19]), .B1(n1151), 
        .C0(d_ff2_X[19]), .C1(n964), .Y(n955) );
  INVX2TS U1259 ( .A(n955), .Y(add_subt_dataA[19]) );
  AOI222X1TS U1260 ( .A0(d_ff2_Z[18]), .A1(n967), .B0(d_ff2_Y[18]), .B1(n975), 
        .C0(d_ff2_X[18]), .C1(n964), .Y(n956) );
  INVX2TS U1261 ( .A(n956), .Y(add_subt_dataA[18]) );
  AOI222X1TS U1262 ( .A0(d_ff2_Z[17]), .A1(n967), .B0(d_ff2_Y[17]), .B1(n1012), 
        .C0(d_ff2_X[17]), .C1(n964), .Y(n957) );
  INVX2TS U1263 ( .A(n957), .Y(add_subt_dataA[17]) );
  AOI222X1TS U1264 ( .A0(d_ff2_Z[16]), .A1(n967), .B0(d_ff2_Y[16]), .B1(n1154), 
        .C0(d_ff2_X[16]), .C1(n964), .Y(n958) );
  INVX2TS U1265 ( .A(n958), .Y(add_subt_dataA[16]) );
  AOI222X1TS U1266 ( .A0(d_ff2_Z[15]), .A1(n967), .B0(d_ff2_Y[15]), .B1(n973), 
        .C0(d_ff2_X[15]), .C1(n964), .Y(n959) );
  INVX2TS U1267 ( .A(n959), .Y(add_subt_dataA[15]) );
  AOI222X1TS U1268 ( .A0(d_ff2_Z[14]), .A1(n967), .B0(d_ff2_Y[14]), .B1(n1151), 
        .C0(d_ff2_X[14]), .C1(n964), .Y(n960) );
  INVX2TS U1269 ( .A(n960), .Y(add_subt_dataA[14]) );
  INVX2TS U1270 ( .A(n998), .Y(n973) );
  AOI222X1TS U1271 ( .A0(d_ff2_Z[13]), .A1(n967), .B0(d_ff2_Y[13]), .B1(n1154), 
        .C0(d_ff2_X[13]), .C1(n964), .Y(n961) );
  INVX2TS U1272 ( .A(n961), .Y(add_subt_dataA[13]) );
  AOI222X1TS U1273 ( .A0(d_ff2_Z[12]), .A1(n967), .B0(d_ff2_Y[12]), .B1(n973), 
        .C0(d_ff2_X[12]), .C1(n1003), .Y(n962) );
  INVX2TS U1274 ( .A(n962), .Y(add_subt_dataA[12]) );
  AOI222X1TS U1275 ( .A0(d_ff2_Z[11]), .A1(n967), .B0(d_ff2_Y[11]), .B1(n1151), 
        .C0(d_ff2_X[11]), .C1(n1152), .Y(n963) );
  INVX2TS U1276 ( .A(n963), .Y(add_subt_dataA[11]) );
  AOI222X1TS U1277 ( .A0(d_ff2_Z[10]), .A1(n988), .B0(d_ff2_Y[10]), .B1(n975), 
        .C0(d_ff2_X[10]), .C1(n964), .Y(n965) );
  INVX2TS U1278 ( .A(n965), .Y(add_subt_dataA[10]) );
  AOI222X1TS U1279 ( .A0(d_ff2_Z[9]), .A1(n980), .B0(d_ff2_Y[9]), .B1(n1012), 
        .C0(d_ff2_X[9]), .C1(n1003), .Y(n966) );
  INVX2TS U1280 ( .A(n966), .Y(add_subt_dataA[9]) );
  AOI222X1TS U1281 ( .A0(d_ff2_Z[8]), .A1(n967), .B0(d_ff2_Y[8]), .B1(n1154), 
        .C0(d_ff2_X[8]), .C1(n1003), .Y(n968) );
  INVX2TS U1282 ( .A(n968), .Y(add_subt_dataA[8]) );
  AOI222X1TS U1283 ( .A0(d_ff2_Z[7]), .A1(n988), .B0(d_ff2_Y[7]), .B1(n975), 
        .C0(d_ff2_X[7]), .C1(n1152), .Y(n969) );
  INVX2TS U1284 ( .A(n969), .Y(add_subt_dataA[7]) );
  AOI222X1TS U1285 ( .A0(d_ff2_Z[6]), .A1(n988), .B0(d_ff2_Y[6]), .B1(n973), 
        .C0(d_ff2_X[6]), .C1(n979), .Y(n970) );
  INVX2TS U1286 ( .A(n970), .Y(add_subt_dataA[6]) );
  AOI222X1TS U1287 ( .A0(d_ff2_Z[5]), .A1(n980), .B0(d_ff2_Y[5]), .B1(n1151), 
        .C0(d_ff2_X[5]), .C1(n979), .Y(n971) );
  INVX2TS U1288 ( .A(n971), .Y(add_subt_dataA[5]) );
  AOI222X1TS U1289 ( .A0(d_ff2_Z[4]), .A1(n980), .B0(d_ff2_Y[4]), .B1(n975), 
        .C0(d_ff2_X[4]), .C1(n1003), .Y(n972) );
  INVX2TS U1290 ( .A(n972), .Y(add_subt_dataA[4]) );
  AOI222X1TS U1291 ( .A0(d_ff2_Z[3]), .A1(n980), .B0(d_ff2_Y[3]), .B1(n1012), 
        .C0(d_ff2_X[3]), .C1(n979), .Y(n974) );
  INVX2TS U1292 ( .A(n974), .Y(add_subt_dataA[3]) );
  AOI222X1TS U1293 ( .A0(d_ff2_Z[20]), .A1(n1005), .B0(d_ff2_Y[20]), .B1(n1012), .C0(d_ff2_X[20]), .C1(n1021), .Y(n976) );
  INVX2TS U1294 ( .A(n976), .Y(add_subt_dataA[20]) );
  INVX2TS U1295 ( .A(n998), .Y(n1151) );
  AOI222X1TS U1296 ( .A0(d_ff2_Z[1]), .A1(n988), .B0(d_ff2_Y[1]), .B1(n975), 
        .C0(d_ff2_X[1]), .C1(n1152), .Y(n977) );
  INVX2TS U1297 ( .A(n977), .Y(add_subt_dataA[1]) );
  AOI222X1TS U1298 ( .A0(d_ff2_Z[0]), .A1(n1005), .B0(d_ff2_Y[0]), .B1(n1151), 
        .C0(d_ff2_X[0]), .C1(n1021), .Y(n978) );
  INVX2TS U1299 ( .A(n978), .Y(add_subt_dataA[0]) );
  AOI222X1TS U1300 ( .A0(d_ff2_Z[2]), .A1(n980), .B0(d_ff2_Y[2]), .B1(n1012), 
        .C0(d_ff2_X[2]), .C1(n979), .Y(n981) );
  INVX2TS U1301 ( .A(n981), .Y(add_subt_dataA[2]) );
  AOI22X1TS U1302 ( .A0(d_ff3_sh_y_out[29]), .A1(n1153), .B0(d_ff3_LUT_out[27]), .B1(n983), .Y(n982) );
  OAI21XLTS U1303 ( .A0(n1236), .A1(n985), .B0(n982), .Y(add_subt_dataB[29])
         );
  AOI22X1TS U1304 ( .A0(d_ff3_sh_y_out[28]), .A1(n1153), .B0(d_ff3_LUT_out[27]), .B1(n983), .Y(n984) );
  CLKBUFX3TS U1305 ( .A(n986), .Y(n1001) );
  AOI222X1TS U1306 ( .A0(d_ff3_LUT_out[26]), .A1(n1005), .B0(n996), .B1(
        d_ff3_sh_x_out[26]), .C0(n1001), .C1(d_ff3_sh_y_out[26]), .Y(n987) );
  INVX2TS U1307 ( .A(n987), .Y(add_subt_dataB[26]) );
  AOI222X1TS U1308 ( .A0(d_ff3_sh_x_out[25]), .A1(n1012), .B0(
        d_ff3_LUT_out[25]), .B1(n988), .C0(n1001), .C1(d_ff3_sh_y_out[25]), 
        .Y(n989) );
  INVX2TS U1309 ( .A(n989), .Y(add_subt_dataB[25]) );
  INVX2TS U1310 ( .A(n990), .Y(add_subt_dataB[24]) );
  AOI222X1TS U1311 ( .A0(d_ff3_LUT_out[23]), .A1(n1005), .B0(
        d_ff3_sh_y_out[23]), .B1(n1021), .C0(d_ff3_sh_x_out[23]), .C1(n996), 
        .Y(n991) );
  INVX2TS U1312 ( .A(n991), .Y(add_subt_dataB[23]) );
  AOI222X1TS U1313 ( .A0(n1010), .A1(d_ff3_LUT_out[22]), .B0(n996), .B1(
        d_ff3_sh_x_out[22]), .C0(n1001), .C1(d_ff3_sh_y_out[22]), .Y(n992) );
  INVX2TS U1314 ( .A(n992), .Y(add_subt_dataB[22]) );
  AOI222X1TS U1315 ( .A0(d_ff3_LUT_out[21]), .A1(n1005), .B0(n996), .B1(
        d_ff3_sh_x_out[21]), .C0(n1001), .C1(d_ff3_sh_y_out[21]), .Y(n993) );
  INVX2TS U1316 ( .A(n993), .Y(add_subt_dataB[21]) );
  AOI222X1TS U1317 ( .A0(d_ff3_LUT_out[20]), .A1(n1005), .B0(n996), .B1(
        d_ff3_sh_x_out[20]), .C0(n1001), .C1(d_ff3_sh_y_out[20]), .Y(n994) );
  INVX2TS U1318 ( .A(n994), .Y(add_subt_dataB[20]) );
  AOI222X1TS U1319 ( .A0(n1010), .A1(d_ff3_LUT_out[19]), .B0(n996), .B1(
        d_ff3_sh_x_out[19]), .C0(n1001), .C1(d_ff3_sh_y_out[19]), .Y(n995) );
  INVX2TS U1320 ( .A(n995), .Y(add_subt_dataB[19]) );
  AOI222X1TS U1321 ( .A0(d_ff3_LUT_out[18]), .A1(n980), .B0(n996), .B1(
        d_ff3_sh_x_out[18]), .C0(n1001), .C1(d_ff3_sh_y_out[18]), .Y(n997) );
  INVX2TS U1322 ( .A(n997), .Y(add_subt_dataB[18]) );
  AOI222X1TS U1323 ( .A0(d_ff3_LUT_out[17]), .A1(n988), .B0(n1012), .B1(
        d_ff3_sh_x_out[17]), .C0(n1001), .C1(d_ff3_sh_y_out[17]), .Y(n999) );
  INVX2TS U1324 ( .A(n999), .Y(add_subt_dataB[17]) );
  AOI222X1TS U1325 ( .A0(d_ff3_LUT_out[16]), .A1(n988), .B0(n1154), .B1(
        d_ff3_sh_x_out[16]), .C0(n1001), .C1(d_ff3_sh_y_out[16]), .Y(n1000) );
  INVX2TS U1326 ( .A(n1000), .Y(add_subt_dataB[16]) );
  AOI222X1TS U1327 ( .A0(d_ff3_LUT_out[15]), .A1(n1010), .B0(n973), .B1(
        d_ff3_sh_x_out[15]), .C0(n1001), .C1(d_ff3_sh_y_out[15]), .Y(n1002) );
  INVX2TS U1328 ( .A(n1002), .Y(add_subt_dataB[15]) );
  CLKBUFX3TS U1329 ( .A(n1003), .Y(n1017) );
  AOI222X1TS U1330 ( .A0(d_ff3_LUT_out[14]), .A1(n983), .B0(n1151), .B1(
        d_ff3_sh_x_out[14]), .C0(n1017), .C1(d_ff3_sh_y_out[14]), .Y(n1004) );
  INVX2TS U1331 ( .A(n1004), .Y(add_subt_dataB[14]) );
  AOI222X1TS U1332 ( .A0(d_ff3_LUT_out[13]), .A1(n1005), .B0(n975), .B1(
        d_ff3_sh_x_out[13]), .C0(n1021), .C1(d_ff3_sh_y_out[13]), .Y(n1006) );
  INVX2TS U1333 ( .A(n1006), .Y(add_subt_dataB[13]) );
  AOI222X1TS U1334 ( .A0(d_ff3_LUT_out[11]), .A1(n980), .B0(n1012), .B1(
        d_ff3_sh_x_out[11]), .C0(n1017), .C1(d_ff3_sh_y_out[11]), .Y(n1007) );
  INVX2TS U1335 ( .A(n1007), .Y(add_subt_dataB[11]) );
  AOI222X1TS U1336 ( .A0(d_ff3_LUT_out[10]), .A1(n988), .B0(n1154), .B1(
        d_ff3_sh_x_out[10]), .C0(n1017), .C1(d_ff3_sh_y_out[10]), .Y(n1008) );
  INVX2TS U1337 ( .A(n1008), .Y(add_subt_dataB[10]) );
  AOI222X1TS U1338 ( .A0(d_ff3_LUT_out[9]), .A1(n1010), .B0(n973), .B1(
        d_ff3_sh_x_out[9]), .C0(n1017), .C1(d_ff3_sh_y_out[9]), .Y(n1009) );
  INVX2TS U1339 ( .A(n1009), .Y(add_subt_dataB[9]) );
  INVX2TS U1340 ( .A(n1011), .Y(add_subt_dataB[8]) );
  AOI222X1TS U1341 ( .A0(d_ff3_LUT_out[7]), .A1(n837), .B0(n975), .B1(
        d_ff3_sh_x_out[7]), .C0(n1017), .C1(d_ff3_sh_y_out[7]), .Y(n1013) );
  INVX2TS U1342 ( .A(n1013), .Y(add_subt_dataB[7]) );
  AOI222X1TS U1343 ( .A0(d_ff3_LUT_out[6]), .A1(n837), .B0(n996), .B1(
        d_ff3_sh_x_out[6]), .C0(n1017), .C1(d_ff3_sh_y_out[6]), .Y(n1014) );
  INVX2TS U1344 ( .A(n1014), .Y(add_subt_dataB[6]) );
  AOI222X1TS U1345 ( .A0(d_ff3_LUT_out[5]), .A1(n837), .B0(n996), .B1(
        d_ff3_sh_x_out[5]), .C0(n1017), .C1(d_ff3_sh_y_out[5]), .Y(n1015) );
  INVX2TS U1346 ( .A(n1015), .Y(add_subt_dataB[5]) );
  AOI222X1TS U1347 ( .A0(d_ff3_LUT_out[4]), .A1(n837), .B0(n1154), .B1(
        d_ff3_sh_x_out[4]), .C0(n1017), .C1(d_ff3_sh_y_out[4]), .Y(n1016) );
  INVX2TS U1348 ( .A(n1016), .Y(add_subt_dataB[4]) );
  AOI222X1TS U1349 ( .A0(d_ff3_LUT_out[3]), .A1(n980), .B0(n1012), .B1(
        d_ff3_sh_x_out[3]), .C0(n1017), .C1(d_ff3_sh_y_out[3]), .Y(n1018) );
  INVX2TS U1350 ( .A(n1018), .Y(add_subt_dataB[3]) );
  AOI222X1TS U1351 ( .A0(d_ff3_LUT_out[2]), .A1(n837), .B0(n973), .B1(
        d_ff3_sh_x_out[2]), .C0(n1021), .C1(d_ff3_sh_y_out[2]), .Y(n1019) );
  INVX2TS U1352 ( .A(n1019), .Y(add_subt_dataB[2]) );
  AOI222X1TS U1353 ( .A0(d_ff3_LUT_out[1]), .A1(n837), .B0(n1151), .B1(
        d_ff3_sh_x_out[1]), .C0(n1021), .C1(d_ff3_sh_y_out[1]), .Y(n1020) );
  INVX2TS U1354 ( .A(n1020), .Y(add_subt_dataB[1]) );
  AOI222X1TS U1355 ( .A0(d_ff3_LUT_out[0]), .A1(n837), .B0(n975), .B1(
        d_ff3_sh_x_out[0]), .C0(n1021), .C1(d_ff3_sh_y_out[0]), .Y(n1022) );
  INVX2TS U1356 ( .A(n1022), .Y(add_subt_dataB[0]) );
  INVX2TS U1357 ( .A(n1132), .Y(n1128) );
  NAND2X1TS U1358 ( .A(d_ff2_Y[24]), .B(n1217), .Y(n1023) );
  AOI22X1TS U1359 ( .A0(cont_iter_out[1]), .A1(n1226), .B0(n1125), .B1(n1023), 
        .Y(n1029) );
  CLKBUFX3TS U1360 ( .A(n1101), .Y(n1126) );
  AO22XLTS U1361 ( .A0(n1128), .A1(n1024), .B0(n1126), .B1(d_ff3_sh_y_out[25]), 
        .Y(n407) );
  CLKBUFX2TS U1362 ( .A(n1025), .Y(n1098) );
  INVX2TS U1363 ( .A(n1098), .Y(n1072) );
  CLKBUFX3TS U1364 ( .A(n1096), .Y(n1071) );
  AO22XLTS U1365 ( .A0(n1072), .A1(d_ff2_X[15]), .B0(n1071), .B1(
        d_ff3_sh_x_out[15]), .Y(n368) );
  AO22XLTS U1366 ( .A0(n1072), .A1(d_ff2_X[20]), .B0(n1071), .B1(
        d_ff3_sh_x_out[20]), .Y(n358) );
  INVX2TS U1367 ( .A(n1068), .Y(n1070) );
  AO22XLTS U1368 ( .A0(n1070), .A1(sign_inv_out[15]), .B0(n1062), .B1(
        data_output[15]), .Y(n557) );
  INVX2TS U1369 ( .A(n1132), .Y(n1111) );
  AO22XLTS U1370 ( .A0(n1111), .A1(d_ff2_Y[0]), .B0(n1096), .B1(
        d_ff3_sh_y_out[0]), .Y(n462) );
  INVX2TS U1371 ( .A(n1050), .Y(n1041) );
  AO22XLTS U1372 ( .A0(n1050), .A1(data_in[1]), .B0(n1041), .B1(d_ff1_Z[1]), 
        .Y(n719) );
  AO22XLTS U1373 ( .A0(n1070), .A1(sign_inv_out[16]), .B0(n1062), .B1(
        data_output[16]), .Y(n555) );
  INVX2TS U1374 ( .A(n1132), .Y(n1069) );
  AO22XLTS U1375 ( .A0(n1069), .A1(d_ff2_X[22]), .B0(n1071), .B1(
        d_ff3_sh_x_out[22]), .Y(n354) );
  INVX2TS U1376 ( .A(n1098), .Y(n1148) );
  AO22XLTS U1377 ( .A0(n1148), .A1(d_ff2_X[17]), .B0(n1071), .B1(
        d_ff3_sh_x_out[17]), .Y(n364) );
  INVX2TS U1378 ( .A(n1098), .Y(n1119) );
  AO22XLTS U1379 ( .A0(n1119), .A1(d_ff2_X[16]), .B0(n1071), .B1(
        d_ff3_sh_x_out[16]), .Y(n366) );
  AO22XLTS U1380 ( .A0(n1148), .A1(d_ff2_X[21]), .B0(n1071), .B1(
        d_ff3_sh_x_out[21]), .Y(n356) );
  INVX2TS U1381 ( .A(n1028), .Y(n1036) );
  CLKBUFX2TS U1382 ( .A(n1036), .Y(n1032) );
  AO22XLTS U1383 ( .A0(n1028), .A1(result_add_subt[2]), .B0(n1032), .B1(
        d_ff_Zn[2]), .Y(n682) );
  AO22XLTS U1384 ( .A0(n1072), .A1(d_ff2_X[18]), .B0(n1071), .B1(
        d_ff3_sh_x_out[18]), .Y(n362) );
  AO22XLTS U1385 ( .A0(n1143), .A1(result_add_subt[3]), .B0(n1032), .B1(
        d_ff_Zn[3]), .Y(n681) );
  AO22XLTS U1386 ( .A0(n1070), .A1(sign_inv_out[17]), .B0(n1062), .B1(
        data_output[17]), .Y(n553) );
  CMPR32X2TS U1387 ( .A(d_ff2_Y[25]), .B(n1224), .C(n1029), .CO(n1033), .S(
        n1024) );
  AO22XLTS U1388 ( .A0(n1128), .A1(n1030), .B0(n1126), .B1(d_ff3_sh_y_out[26]), 
        .Y(n406) );
  AO22XLTS U1389 ( .A0(n1072), .A1(d_ff2_X[19]), .B0(n1071), .B1(
        d_ff3_sh_x_out[19]), .Y(n360) );
  NAND2X1TS U1390 ( .A(d_ff2_X[24]), .B(n1217), .Y(n1144) );
  OR3X1TS U1391 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(n1076), .Y(n1202) );
  OAI21XLTS U1392 ( .A0(d_ff2_X[27]), .A1(n1076), .B0(d_ff2_X[28]), .Y(n1031)
         );
  AOI32X1TS U1393 ( .A0(n1202), .A1(n1205), .A2(n1031), .B0(n1237), .B1(n1203), 
        .Y(n340) );
  AO22XLTS U1394 ( .A0(n1143), .A1(result_add_subt[1]), .B0(n1032), .B1(
        d_ff_Zn[1]), .Y(n683) );
  AO22XLTS U1395 ( .A0(n1143), .A1(result_add_subt[4]), .B0(n1032), .B1(
        d_ff_Zn[4]), .Y(n680) );
  CLKBUFX3TS U1396 ( .A(n1062), .Y(n1040) );
  AO22XLTS U1397 ( .A0(n1070), .A1(sign_inv_out[18]), .B0(n1040), .B1(
        data_output[18]), .Y(n551) );
  AO22XLTS U1398 ( .A0(n1072), .A1(d_ff2_X[14]), .B0(n1071), .B1(
        d_ff3_sh_x_out[14]), .Y(n370) );
  AO22XLTS U1399 ( .A0(n1069), .A1(d_ff2_Y[1]), .B0(n1108), .B1(
        d_ff3_sh_y_out[1]), .Y(n460) );
  AO22XLTS U1400 ( .A0(n1143), .A1(result_add_subt[5]), .B0(n1032), .B1(
        d_ff_Zn[5]), .Y(n679) );
  AO22XLTS U1401 ( .A0(n1143), .A1(result_add_subt[6]), .B0(n1032), .B1(
        d_ff_Zn[6]), .Y(n678) );
  AO22XLTS U1402 ( .A0(n1143), .A1(result_add_subt[7]), .B0(n1032), .B1(
        d_ff_Zn[7]), .Y(n677) );
  AO22XLTS U1403 ( .A0(n1070), .A1(sign_inv_out[19]), .B0(n1040), .B1(
        data_output[19]), .Y(n549) );
  CMPR32X2TS U1404 ( .A(d_ff2_Y[26]), .B(n1223), .C(n1033), .CO(n1118), .S(
        n1030) );
  OR3X1TS U1405 ( .A(n1118), .B(d_ff2_Y[28]), .C(d_ff2_Y[27]), .Y(n1079) );
  NOR2X1TS U1406 ( .A(d_ff2_Y[29]), .B(n1079), .Y(n1078) );
  XOR2XLTS U1407 ( .A(d_ff2_Y[30]), .B(n1078), .Y(n1034) );
  AO22XLTS U1408 ( .A0(n1128), .A1(n1034), .B0(n1126), .B1(d_ff3_sh_y_out[30]), 
        .Y(n402) );
  CLKBUFX2TS U1409 ( .A(n1036), .Y(n1142) );
  AO22XLTS U1410 ( .A0(n1143), .A1(result_add_subt[8]), .B0(n1142), .B1(
        d_ff_Zn[8]), .Y(n676) );
  CLKBUFX2TS U1411 ( .A(n1036), .Y(n1140) );
  AO22XLTS U1412 ( .A0(n1143), .A1(result_add_subt[9]), .B0(n1140), .B1(
        d_ff_Zn[9]), .Y(n675) );
  INVX2TS U1413 ( .A(n1140), .Y(n1037) );
  AO22XLTS U1414 ( .A0(n1037), .A1(result_add_subt[10]), .B0(n1036), .B1(
        d_ff_Zn[10]), .Y(n674) );
  NOR2X1TS U1415 ( .A(d_ff2_X[29]), .B(n1202), .Y(n1201) );
  XOR2XLTS U1416 ( .A(d_ff2_X[30]), .B(n1201), .Y(n1035) );
  AO22XLTS U1417 ( .A0(n1069), .A1(n1035), .B0(n1132), .B1(d_ff3_sh_x_out[30]), 
        .Y(n338) );
  AO22XLTS U1418 ( .A0(n803), .A1(sign_inv_out[20]), .B0(n1040), .B1(
        data_output[20]), .Y(n547) );
  AO22XLTS U1419 ( .A0(n1037), .A1(result_add_subt[11]), .B0(n1142), .B1(
        d_ff_Zn[11]), .Y(n673) );
  AO22XLTS U1420 ( .A0(n1037), .A1(result_add_subt[12]), .B0(n1140), .B1(
        d_ff_Zn[12]), .Y(n672) );
  CLKBUFX3TS U1421 ( .A(n1101), .Y(n1051) );
  AO22XLTS U1422 ( .A0(n1111), .A1(d_ff2_X[31]), .B0(n1051), .B1(
        d_ff3_sh_x_out[31]), .Y(n336) );
  AO22XLTS U1423 ( .A0(n1037), .A1(result_add_subt[13]), .B0(n1140), .B1(
        d_ff_Zn[13]), .Y(n671) );
  AO22XLTS U1424 ( .A0(n1038), .A1(sign_inv_out[21]), .B0(n1040), .B1(
        data_output[21]), .Y(n545) );
  AO22XLTS U1425 ( .A0(n1037), .A1(result_add_subt[14]), .B0(n1142), .B1(
        d_ff_Zn[14]), .Y(n670) );
  AO22XLTS U1426 ( .A0(n1128), .A1(d_ff2_Y[31]), .B0(n1126), .B1(
        d_ff3_sh_y_out[31]), .Y(n400) );
  AO22XLTS U1427 ( .A0(n1037), .A1(result_add_subt[15]), .B0(n1036), .B1(
        d_ff_Zn[15]), .Y(n669) );
  AO22XLTS U1428 ( .A0(n1037), .A1(result_add_subt[16]), .B0(n1036), .B1(
        d_ff_Zn[16]), .Y(n668) );
  AO22XLTS U1429 ( .A0(n1037), .A1(result_add_subt[17]), .B0(n1036), .B1(
        d_ff_Zn[17]), .Y(n667) );
  AO22XLTS U1430 ( .A0(n803), .A1(sign_inv_out[22]), .B0(n1040), .B1(
        data_output[22]), .Y(n543) );
  CLKBUFX3TS U1431 ( .A(n1036), .Y(n1039) );
  AO22XLTS U1432 ( .A0(n1037), .A1(result_add_subt[18]), .B0(n1039), .B1(
        d_ff_Zn[18]), .Y(n666) );
  AO22XLTS U1433 ( .A0(n1037), .A1(result_add_subt[19]), .B0(n1039), .B1(
        d_ff_Zn[19]), .Y(n665) );
  AO22XLTS U1434 ( .A0(n1038), .A1(sign_inv_out[30]), .B0(n798), .B1(
        data_output[30]), .Y(n527) );
  INVX2TS U1435 ( .A(n1140), .Y(n1138) );
  AO22XLTS U1436 ( .A0(n1138), .A1(result_add_subt[20]), .B0(n1039), .B1(
        d_ff_Zn[20]), .Y(n664) );
  AO22XLTS U1437 ( .A0(n1038), .A1(sign_inv_out[23]), .B0(n1040), .B1(
        data_output[23]), .Y(n541) );
  AO22XLTS U1438 ( .A0(n1138), .A1(result_add_subt[21]), .B0(n1039), .B1(
        d_ff_Zn[21]), .Y(n663) );
  AO22XLTS U1439 ( .A0(n803), .A1(sign_inv_out[29]), .B0(n1068), .B1(
        data_output[29]), .Y(n529) );
  AO22XLTS U1440 ( .A0(n1138), .A1(result_add_subt[22]), .B0(n1039), .B1(
        d_ff_Zn[22]), .Y(n662) );
  AO22XLTS U1441 ( .A0(n1138), .A1(result_add_subt[23]), .B0(n1039), .B1(
        d_ff_Zn[23]), .Y(n661) );
  AO22XLTS U1442 ( .A0(n1038), .A1(sign_inv_out[24]), .B0(n1040), .B1(
        data_output[24]), .Y(n539) );
  AO22XLTS U1443 ( .A0(n1138), .A1(result_add_subt[24]), .B0(n1039), .B1(
        d_ff_Zn[24]), .Y(n660) );
  AO22XLTS U1444 ( .A0(n803), .A1(sign_inv_out[27]), .B0(n1040), .B1(
        data_output[27]), .Y(n533) );
  AO22XLTS U1445 ( .A0(n1138), .A1(result_add_subt[25]), .B0(n1039), .B1(
        d_ff_Zn[25]), .Y(n659) );
  AO22XLTS U1446 ( .A0(n1138), .A1(result_add_subt[26]), .B0(n1039), .B1(
        d_ff_Zn[26]), .Y(n658) );
  INVX2TS U1447 ( .A(n1199), .Y(n1100) );
  AO22XLTS U1448 ( .A0(d_ff2_X[23]), .A1(n802), .B0(d_ff_Xn[23]), .B1(n1100), 
        .Y(n353) );
  AO22XLTS U1449 ( .A0(n1038), .A1(sign_inv_out[26]), .B0(n1040), .B1(
        data_output[26]), .Y(n535) );
  AO22XLTS U1450 ( .A0(n1138), .A1(result_add_subt[27]), .B0(n1039), .B1(
        d_ff_Zn[27]), .Y(n657) );
  AO22XLTS U1451 ( .A0(n803), .A1(sign_inv_out[25]), .B0(n1040), .B1(
        data_output[25]), .Y(n537) );
  CLKBUFX2TS U1452 ( .A(n1049), .Y(n1053) );
  AO22XLTS U1453 ( .A0(n1167), .A1(d_ff1_operation_out), .B0(n1061), .B1(
        operation), .Y(n723) );
  INVX2TS U1454 ( .A(n1052), .Y(n1054) );
  AO22XLTS U1455 ( .A0(n1054), .A1(sign_inv_out[0]), .B0(n1068), .B1(
        data_output[0]), .Y(n587) );
  AO22XLTS U1456 ( .A0(n1050), .A1(data_in[2]), .B0(n1041), .B1(d_ff1_Z[2]), 
        .Y(n718) );
  AO22XLTS U1457 ( .A0(n1128), .A1(d_ff2_Y[22]), .B0(n1126), .B1(
        d_ff3_sh_y_out[22]), .Y(n418) );
  AO22XLTS U1458 ( .A0(n1050), .A1(data_in[3]), .B0(n1041), .B1(d_ff1_Z[3]), 
        .Y(n717) );
  AO22XLTS U1459 ( .A0(n1050), .A1(data_in[4]), .B0(n1041), .B1(d_ff1_Z[4]), 
        .Y(n716) );
  AO22XLTS U1460 ( .A0(n1183), .A1(d_ff2_Y[21]), .B0(n1051), .B1(
        d_ff3_sh_y_out[21]), .Y(n420) );
  AO22XLTS U1461 ( .A0(n1053), .A1(data_in[5]), .B0(n1041), .B1(d_ff1_Z[5]), 
        .Y(n715) );
  AO22XLTS U1462 ( .A0(n1054), .A1(sign_inv_out[2]), .B0(n1052), .B1(
        data_output[2]), .Y(n583) );
  AO22XLTS U1463 ( .A0(n1061), .A1(data_in[6]), .B0(n1041), .B1(d_ff1_Z[6]), 
        .Y(n714) );
  AO22XLTS U1464 ( .A0(n1128), .A1(d_ff2_Y[20]), .B0(n1051), .B1(
        d_ff3_sh_y_out[20]), .Y(n422) );
  AO22XLTS U1465 ( .A0(n1042), .A1(data_in[7]), .B0(n1041), .B1(d_ff1_Z[7]), 
        .Y(n713) );
  AO22XLTS U1466 ( .A0(n1061), .A1(data_in[8]), .B0(n1041), .B1(d_ff1_Z[8]), 
        .Y(n712) );
  AO22XLTS U1467 ( .A0(n1054), .A1(sign_inv_out[3]), .B0(n1052), .B1(
        data_output[3]), .Y(n581) );
  AO22XLTS U1468 ( .A0(n1183), .A1(d_ff2_Y[19]), .B0(n1051), .B1(
        d_ff3_sh_y_out[19]), .Y(n424) );
  AO22XLTS U1469 ( .A0(n1042), .A1(data_in[9]), .B0(n1041), .B1(d_ff1_Z[9]), 
        .Y(n711) );
  AO22XLTS U1470 ( .A0(n1061), .A1(data_in[10]), .B0(n1041), .B1(d_ff1_Z[10]), 
        .Y(n710) );
  INVX2TS U1471 ( .A(n1049), .Y(n1060) );
  AO22XLTS U1472 ( .A0(n1042), .A1(data_in[11]), .B0(n1060), .B1(d_ff1_Z[11]), 
        .Y(n709) );
  AO22XLTS U1473 ( .A0(n1111), .A1(d_ff2_Y[18]), .B0(n1051), .B1(
        d_ff3_sh_y_out[18]), .Y(n426) );
  AO22XLTS U1474 ( .A0(n1054), .A1(sign_inv_out[4]), .B0(n1052), .B1(
        data_output[4]), .Y(n579) );
  CLKBUFX3TS U1475 ( .A(n1049), .Y(n1061) );
  AO22XLTS U1476 ( .A0(n1061), .A1(data_in[12]), .B0(n1060), .B1(d_ff1_Z[12]), 
        .Y(n708) );
  AO22XLTS U1477 ( .A0(n1042), .A1(data_in[13]), .B0(n1060), .B1(d_ff1_Z[13]), 
        .Y(n707) );
  AO22XLTS U1478 ( .A0(n1183), .A1(d_ff2_Y[17]), .B0(n1051), .B1(
        d_ff3_sh_y_out[17]), .Y(n428) );
  AO22XLTS U1479 ( .A0(n1061), .A1(data_in[14]), .B0(n1060), .B1(d_ff1_Z[14]), 
        .Y(n706) );
  AO22XLTS U1480 ( .A0(n1054), .A1(sign_inv_out[5]), .B0(n1052), .B1(
        data_output[5]), .Y(n577) );
  AO22XLTS U1481 ( .A0(n1042), .A1(data_in[15]), .B0(n1060), .B1(d_ff1_Z[15]), 
        .Y(n705) );
  AO22XLTS U1482 ( .A0(n1167), .A1(d_ff1_shift_region_flag_out[1]), .B0(n1042), 
        .B1(shift_region_flag[1]), .Y(n721) );
  AO22XLTS U1483 ( .A0(n1069), .A1(d_ff2_Y[16]), .B0(n1051), .B1(
        d_ff3_sh_y_out[16]), .Y(n430) );
  AO22XLTS U1484 ( .A0(n1061), .A1(data_in[16]), .B0(n1060), .B1(d_ff1_Z[16]), 
        .Y(n704) );
  AOI31XLTS U1485 ( .A0(cordic_FSM_state_reg[3]), .A1(cordic_FSM_state_reg[0]), 
        .A2(ack_cordic), .B0(cordic_FSM_state_reg[1]), .Y(n1043) );
  OAI21X1TS U1486 ( .A0(n1044), .A1(n1043), .B0(cordic_FSM_state_reg[2]), .Y(
        n1047) );
  NAND2X1TS U1487 ( .A(cont_var_out[1]), .B(n1227), .Y(n1045) );
  NAND4XLTS U1488 ( .A(cordic_FSM_state_reg[3]), .B(n1215), .C(n1065), .D(
        n1045), .Y(n1046) );
  AOI32X1TS U1489 ( .A0(n1048), .A1(n1047), .A2(n1046), .B0(n1225), .B1(n1047), 
        .Y(n731) );
  AO22XLTS U1490 ( .A0(n1050), .A1(data_in[17]), .B0(n1060), .B1(d_ff1_Z[17]), 
        .Y(n703) );
  AO22XLTS U1491 ( .A0(n1183), .A1(d_ff2_Y[15]), .B0(n1051), .B1(
        d_ff3_sh_y_out[15]), .Y(n432) );
  AO22XLTS U1492 ( .A0(n1050), .A1(data_in[18]), .B0(n1060), .B1(d_ff1_Z[18]), 
        .Y(n702) );
  AO22XLTS U1493 ( .A0(n1054), .A1(sign_inv_out[6]), .B0(n1052), .B1(
        data_output[6]), .Y(n575) );
  AO22XLTS U1494 ( .A0(n1049), .A1(data_in[19]), .B0(n1060), .B1(d_ff1_Z[19]), 
        .Y(n701) );
  AO22XLTS U1495 ( .A0(n1050), .A1(data_in[20]), .B0(n1055), .B1(d_ff1_Z[20]), 
        .Y(n700) );
  AO22XLTS U1496 ( .A0(n1111), .A1(d_ff2_Y[14]), .B0(n1051), .B1(
        d_ff3_sh_y_out[14]), .Y(n434) );
  AO22XLTS U1497 ( .A0(n1054), .A1(sign_inv_out[7]), .B0(n1052), .B1(
        data_output[7]), .Y(n573) );
  AO22XLTS U1498 ( .A0(n1183), .A1(d_ff2_Y[13]), .B0(n1051), .B1(
        d_ff3_sh_y_out[13]), .Y(n436) );
  AO22XLTS U1499 ( .A0(n1053), .A1(data_in[23]), .B0(n1055), .B1(d_ff1_Z[23]), 
        .Y(n697) );
  AO22XLTS U1500 ( .A0(n1053), .A1(data_in[24]), .B0(n1055), .B1(d_ff1_Z[24]), 
        .Y(n696) );
  AO22XLTS U1501 ( .A0(n1054), .A1(sign_inv_out[1]), .B0(n1052), .B1(
        data_output[1]), .Y(n585) );
  CLKBUFX3TS U1502 ( .A(n1096), .Y(n1110) );
  AO22XLTS U1503 ( .A0(n1111), .A1(d_ff2_Y[11]), .B0(n1110), .B1(
        d_ff3_sh_y_out[11]), .Y(n440) );
  AO22XLTS U1504 ( .A0(n1053), .A1(data_in[25]), .B0(n1055), .B1(d_ff1_Z[25]), 
        .Y(n695) );
  AO22XLTS U1505 ( .A0(n1054), .A1(sign_inv_out[8]), .B0(n1062), .B1(
        data_output[8]), .Y(n571) );
  AO22XLTS U1506 ( .A0(n1053), .A1(data_in[26]), .B0(n1055), .B1(d_ff1_Z[26]), 
        .Y(n694) );
  AO22XLTS U1507 ( .A0(n1128), .A1(d_ff2_Y[10]), .B0(n1110), .B1(
        d_ff3_sh_y_out[10]), .Y(n442) );
  AO22XLTS U1508 ( .A0(n1042), .A1(data_in[27]), .B0(n1055), .B1(d_ff1_Z[27]), 
        .Y(n693) );
  AO22XLTS U1509 ( .A0(n1167), .A1(d_ff1_shift_region_flag_out[0]), .B0(n1061), 
        .B1(shift_region_flag[0]), .Y(n722) );
  AO22XLTS U1510 ( .A0(n1061), .A1(data_in[28]), .B0(n1055), .B1(d_ff1_Z[28]), 
        .Y(n692) );
  AO22XLTS U1511 ( .A0(n1054), .A1(sign_inv_out[9]), .B0(n1068), .B1(
        data_output[9]), .Y(n569) );
  AO22XLTS U1512 ( .A0(n1042), .A1(data_in[29]), .B0(n1055), .B1(d_ff1_Z[29]), 
        .Y(n691) );
  AO22XLTS U1513 ( .A0(n1111), .A1(d_ff2_Y[9]), .B0(n1110), .B1(
        d_ff3_sh_y_out[9]), .Y(n444) );
  AO22XLTS U1514 ( .A0(n1061), .A1(data_in[30]), .B0(n1167), .B1(d_ff1_Z[30]), 
        .Y(n690) );
  INVX2TS U1515 ( .A(beg_fsm_cordic), .Y(n1056) );
  AOI32X1TS U1516 ( .A0(n1135), .A1(n1215), .A2(n1056), .B0(n1158), .B1(
        cordic_FSM_state_reg[2]), .Y(n1059) );
  OR4X2TS U1517 ( .A(ack_cordic), .B(n1215), .C(n800), .D(
        cordic_FSM_state_reg[1]), .Y(n1161) );
  NOR2BX1TS U1518 ( .AN(ready_add_subt), .B(cordic_FSM_state_reg[2]), .Y(n1057) );
  OAI31X1TS U1519 ( .A0(n1157), .A1(n1057), .A2(n800), .B0(n1225), .Y(n1058)
         );
  NAND4XLTS U1520 ( .A(n1059), .B(n1166), .C(n1161), .D(n1058), .Y(n730) );
  AO22XLTS U1521 ( .A0(n1042), .A1(data_in[31]), .B0(n1060), .B1(d_ff1_Z[31]), 
        .Y(n689) );
  AO22XLTS U1522 ( .A0(n1111), .A1(d_ff2_Y[8]), .B0(n1110), .B1(
        d_ff3_sh_y_out[8]), .Y(n446) );
  AO22XLTS U1523 ( .A0(n1028), .A1(result_add_subt[0]), .B0(n1140), .B1(
        d_ff_Zn[0]), .Y(n684) );
  AO22XLTS U1524 ( .A0(n1070), .A1(sign_inv_out[10]), .B0(n1062), .B1(
        data_output[10]), .Y(n567) );
  CMPR32X2TS U1525 ( .A(n1223), .B(d_ff2_X[26]), .C(n1063), .CO(n1076), .S(
        n1064) );
  AO22XLTS U1526 ( .A0(n1069), .A1(n1064), .B0(n1108), .B1(d_ff3_sh_x_out[26]), 
        .Y(n342) );
  NAND3X1TS U1527 ( .A(cont_var_out[0]), .B(ack_add_subt), .C(n1065), .Y(n1164) );
  AOI31XLTS U1528 ( .A0(ack_add_subt), .A1(n1065), .A2(n1218), .B0(
        cont_var_out[0]), .Y(n1066) );
  NOR3BXLTS U1529 ( .AN(n1164), .B(n1205), .C(n1066), .Y(n724) );
  AO22XLTS U1530 ( .A0(n1069), .A1(d_ff2_Y[7]), .B0(n1110), .B1(
        d_ff3_sh_y_out[7]), .Y(n448) );
  AO22XLTS U1531 ( .A0(n1128), .A1(d_ff2_X[0]), .B0(n1126), .B1(
        d_ff3_sh_x_out[0]), .Y(n398) );
  AOI2BB2XLTS U1532 ( .B0(n1228), .B1(n1067), .A0N(d_ff_Xn[25]), .A1N(n1196), 
        .Y(n351) );
  AO22XLTS U1533 ( .A0(n1072), .A1(d_ff2_X[1]), .B0(n1126), .B1(
        d_ff3_sh_x_out[1]), .Y(n396) );
  AO22XLTS U1534 ( .A0(n1070), .A1(sign_inv_out[11]), .B0(n1062), .B1(
        data_output[11]), .Y(n565) );
  AO22XLTS U1535 ( .A0(n1069), .A1(d_ff2_Y[6]), .B0(n1110), .B1(
        d_ff3_sh_y_out[6]), .Y(n450) );
  AO22XLTS U1536 ( .A0(n1072), .A1(d_ff2_X[2]), .B0(n1126), .B1(
        d_ff3_sh_x_out[2]), .Y(n394) );
  CLKBUFX3TS U1537 ( .A(n1101), .Y(n1073) );
  AO22XLTS U1538 ( .A0(n1148), .A1(d_ff2_X[3]), .B0(n1073), .B1(
        d_ff3_sh_x_out[3]), .Y(n392) );
  AO22XLTS U1539 ( .A0(n1148), .A1(d_ff2_X[4]), .B0(n1073), .B1(
        d_ff3_sh_x_out[4]), .Y(n390) );
  AO22XLTS U1540 ( .A0(n1069), .A1(d_ff2_Y[5]), .B0(n1110), .B1(
        d_ff3_sh_y_out[5]), .Y(n452) );
  AO22XLTS U1541 ( .A0(n1070), .A1(sign_inv_out[12]), .B0(n1068), .B1(
        data_output[12]), .Y(n563) );
  AO22XLTS U1542 ( .A0(n1072), .A1(d_ff2_X[5]), .B0(n1073), .B1(
        d_ff3_sh_x_out[5]), .Y(n388) );
  AO22XLTS U1543 ( .A0(n1148), .A1(d_ff2_X[6]), .B0(n1073), .B1(
        d_ff3_sh_x_out[6]), .Y(n386) );
  AO22XLTS U1544 ( .A0(n1111), .A1(d_ff2_Y[4]), .B0(n1110), .B1(
        d_ff3_sh_y_out[4]), .Y(n454) );
  AO22XLTS U1545 ( .A0(n1148), .A1(d_ff2_X[7]), .B0(n1073), .B1(
        d_ff3_sh_x_out[7]), .Y(n384) );
  AO22XLTS U1546 ( .A0(n1070), .A1(sign_inv_out[13]), .B0(n1068), .B1(
        data_output[13]), .Y(n561) );
  AO22XLTS U1547 ( .A0(n1148), .A1(d_ff2_X[8]), .B0(n1073), .B1(
        d_ff3_sh_x_out[8]), .Y(n382) );
  AO22XLTS U1548 ( .A0(n1069), .A1(d_ff2_Y[3]), .B0(n1110), .B1(
        d_ff3_sh_y_out[3]), .Y(n456) );
  AO22XLTS U1549 ( .A0(n1148), .A1(d_ff2_X[9]), .B0(n1073), .B1(
        d_ff3_sh_x_out[9]), .Y(n380) );
  AO22XLTS U1550 ( .A0(n1111), .A1(d_ff2_X[10]), .B0(n1073), .B1(
        d_ff3_sh_x_out[10]), .Y(n378) );
  AO22XLTS U1551 ( .A0(n1069), .A1(d_ff2_Y[2]), .B0(n1098), .B1(
        d_ff3_sh_y_out[2]), .Y(n458) );
  AO22XLTS U1552 ( .A0(n1072), .A1(d_ff2_X[11]), .B0(n1073), .B1(
        d_ff3_sh_x_out[11]), .Y(n376) );
  AO22XLTS U1553 ( .A0(n1070), .A1(sign_inv_out[14]), .B0(n1052), .B1(
        data_output[14]), .Y(n559) );
  AO22XLTS U1554 ( .A0(n1072), .A1(d_ff2_X[13]), .B0(n1071), .B1(
        d_ff3_sh_x_out[13]), .Y(n372) );
  AO22XLTS U1555 ( .A0(n1138), .A1(result_add_subt[28]), .B0(n1142), .B1(
        d_ff_Zn[28]), .Y(n656) );
  INVX2TS U1556 ( .A(n1129), .Y(n1130) );
  AO22XLTS U1557 ( .A0(n1130), .A1(result_add_subt[5]), .B0(n1129), .B1(
        d_ff_Xn[5]), .Y(n615) );
  AO22XLTS U1558 ( .A0(n1130), .A1(result_add_subt[3]), .B0(n1129), .B1(
        d_ff_Xn[3]), .Y(n617) );
  AO22XLTS U1559 ( .A0(n1130), .A1(result_add_subt[2]), .B0(n1129), .B1(
        d_ff_Xn[2]), .Y(n618) );
  AO22XLTS U1560 ( .A0(n1130), .A1(result_add_subt[1]), .B0(n1129), .B1(
        d_ff_Xn[1]), .Y(n619) );
  INVX2TS U1561 ( .A(n1139), .Y(n1121) );
  CLKBUFX3TS U1562 ( .A(n1149), .Y(n1122) );
  AO22XLTS U1563 ( .A0(n1121), .A1(result_add_subt[22]), .B0(n1122), .B1(
        d_ff_Xn[22]), .Y(n598) );
  AO22XLTS U1564 ( .A0(n1148), .A1(d_ff2_X[12]), .B0(n1073), .B1(
        d_ff3_sh_x_out[12]), .Y(n374) );
  AO22XLTS U1565 ( .A0(n1121), .A1(result_add_subt[21]), .B0(n1122), .B1(
        d_ff_Xn[21]), .Y(n599) );
  NOR2X1TS U1566 ( .A(d_ff2_Y[27]), .B(n1118), .Y(n1117) );
  OAI21XLTS U1567 ( .A0(n1117), .A1(n1230), .B0(n1079), .Y(n1074) );
  AO22XLTS U1568 ( .A0(n1128), .A1(n1074), .B0(n1126), .B1(d_ff3_sh_y_out[28]), 
        .Y(n404) );
  INVX2TS U1569 ( .A(n1139), .Y(n1150) );
  AO22XLTS U1570 ( .A0(n1150), .A1(result_add_subt[18]), .B0(n1122), .B1(
        d_ff_Xn[18]), .Y(n602) );
  NOR2XLTS U1571 ( .A(d_ff2_X[27]), .B(n1076), .Y(n1075) );
  AOI21X1TS U1572 ( .A0(n1076), .A1(d_ff2_X[27]), .B0(n1075), .Y(n1077) );
  AOI2BB2XLTS U1573 ( .B0(n1189), .B1(n1077), .A0N(d_ff3_sh_x_out[27]), .A1N(
        n1119), .Y(n341) );
  AO22XLTS U1574 ( .A0(n1150), .A1(result_add_subt[15]), .B0(n1149), .B1(
        d_ff_Xn[15]), .Y(n605) );
  AOI21X1TS U1575 ( .A0(d_ff2_Y[29]), .A1(n1079), .B0(n1078), .Y(n1080) );
  AOI2BB2XLTS U1576 ( .B0(n1189), .B1(n1080), .A0N(d_ff3_sh_y_out[29]), .A1N(
        n1119), .Y(n403) );
  AO22XLTS U1577 ( .A0(n1150), .A1(result_add_subt[11]), .B0(n1141), .B1(
        d_ff_Xn[11]), .Y(n609) );
  INVX2TS U1578 ( .A(n1081), .Y(n1087) );
  AOI32X1TS U1579 ( .A0(n1085), .A1(n1084), .A2(n1083), .B0(cont_iter_out[1]), 
        .B1(n1084), .Y(n500) );
  AO22XLTS U1580 ( .A0(n1130), .A1(result_add_subt[9]), .B0(n1139), .B1(
        d_ff_Xn[9]), .Y(n611) );
  AO22XLTS U1581 ( .A0(n1130), .A1(result_add_subt[8]), .B0(n1141), .B1(
        d_ff_Xn[8]), .Y(n612) );
  AO22XLTS U1582 ( .A0(n1130), .A1(result_add_subt[4]), .B0(n1129), .B1(
        d_ff_Xn[4]), .Y(n616) );
  AO22XLTS U1583 ( .A0(n1130), .A1(result_add_subt[0]), .B0(n1139), .B1(
        d_ff_Xn[0]), .Y(n620) );
  AO22XLTS U1584 ( .A0(n1121), .A1(result_add_subt[25]), .B0(n1122), .B1(
        d_ff_Xn[25]), .Y(n595) );
  AO22XLTS U1585 ( .A0(n1121), .A1(result_add_subt[23]), .B0(n1122), .B1(
        d_ff_Xn[23]), .Y(n597) );
  AO22XLTS U1586 ( .A0(n1130), .A1(result_add_subt[6]), .B0(n1129), .B1(
        d_ff_Xn[6]), .Y(n614) );
  INVX2TS U1587 ( .A(n1195), .Y(n1123) );
  AO22XLTS U1588 ( .A0(d_ff_Yn[31]), .A1(n1123), .B0(d_ff2_Y[31]), .B1(n1099), 
        .Y(n401) );
  AO22XLTS U1589 ( .A0(d_ff_Yn[22]), .A1(n1123), .B0(d_ff2_Y[22]), .B1(n1099), 
        .Y(n419) );
  AO22XLTS U1590 ( .A0(d_ff_Yn[21]), .A1(n1123), .B0(d_ff2_Y[21]), .B1(n1099), 
        .Y(n421) );
  AOI21X1TS U1591 ( .A0(n1087), .A1(n1189), .B0(n1086), .Y(n1184) );
  NOR2X2TS U1592 ( .A(cont_iter_out[3]), .B(n1217), .Y(n1114) );
  AOI22X1TS U1593 ( .A0(n1114), .A1(n1088), .B0(d_ff3_LUT_out[0]), .B1(n1203), 
        .Y(n1089) );
  NAND2X1TS U1594 ( .A(n1184), .B(n1089), .Y(n524) );
  INVX2TS U1595 ( .A(n1194), .Y(n1134) );
  AO22XLTS U1596 ( .A0(d_ff_Yn[18]), .A1(n1134), .B0(d_ff2_Y[18]), .B1(n1099), 
        .Y(n427) );
  AO22XLTS U1597 ( .A0(n1098), .A1(d_ff3_sign_out), .B0(n1119), .B1(
        d_ff2_Z[31]), .Y(n464) );
  AO22XLTS U1598 ( .A0(d_ff_Yn[17]), .A1(n1134), .B0(d_ff2_Y[17]), .B1(n1133), 
        .Y(n429) );
  AO22XLTS U1599 ( .A0(d_ff_Xn[0]), .A1(n1123), .B0(d_ff2_X[0]), .B1(n1099), 
        .Y(n399) );
  AO22XLTS U1600 ( .A0(d_ff_Xn[4]), .A1(n1123), .B0(d_ff2_X[4]), .B1(n1099), 
        .Y(n391) );
  INVX2TS U1601 ( .A(n1090), .Y(n1091) );
  AO22XLTS U1602 ( .A0(d_ff_Yn[6]), .A1(n1092), .B0(d_ff2_Y[6]), .B1(n1091), 
        .Y(n451) );
  AO22XLTS U1603 ( .A0(d_ff_Xn[8]), .A1(n1123), .B0(d_ff2_X[8]), .B1(n1099), 
        .Y(n383) );
  AO22XLTS U1604 ( .A0(d_ff_Yn[15]), .A1(n1134), .B0(d_ff2_Y[15]), .B1(n802), 
        .Y(n433) );
  AO22XLTS U1605 ( .A0(d_ff_Xn[9]), .A1(n1092), .B0(d_ff2_X[9]), .B1(n801), 
        .Y(n381) );
  AO22XLTS U1606 ( .A0(d_ff_Xn[11]), .A1(n1100), .B0(d_ff2_X[11]), .B1(n802), 
        .Y(n377) );
  AO22XLTS U1607 ( .A0(d_ff_Yn[14]), .A1(n1134), .B0(d_ff2_Y[14]), .B1(n1133), 
        .Y(n435) );
  AO22XLTS U1608 ( .A0(d_ff_Xn[15]), .A1(n1100), .B0(d_ff2_X[15]), .B1(n1133), 
        .Y(n369) );
  AO22XLTS U1609 ( .A0(d_ff_Yn[13]), .A1(n1134), .B0(d_ff2_Y[13]), .B1(n1133), 
        .Y(n437) );
  AO22XLTS U1610 ( .A0(d_ff_Xn[18]), .A1(n1100), .B0(d_ff2_X[18]), .B1(n802), 
        .Y(n363) );
  AO22XLTS U1611 ( .A0(d_ff_Xn[21]), .A1(n1100), .B0(d_ff2_X[21]), .B1(n802), 
        .Y(n357) );
  AO22XLTS U1612 ( .A0(d_ff_Yn[12]), .A1(n1134), .B0(d_ff2_Y[12]), .B1(n1091), 
        .Y(n439) );
  AO22XLTS U1613 ( .A0(d_ff_Xn[22]), .A1(n1100), .B0(d_ff2_X[22]), .B1(n802), 
        .Y(n355) );
  AO22XLTS U1614 ( .A0(d_ff_Yn[11]), .A1(n1134), .B0(d_ff2_Y[11]), .B1(n1091), 
        .Y(n441) );
  AO22XLTS U1615 ( .A0(d_ff_Xn[31]), .A1(n1092), .B0(d_ff2_X[31]), .B1(n801), 
        .Y(n337) );
  AO22XLTS U1616 ( .A0(d_ff_Yn[0]), .A1(n1100), .B0(d_ff2_Y[0]), .B1(n802), 
        .Y(n463) );
  AO22XLTS U1617 ( .A0(d_ff_Yn[10]), .A1(n1123), .B0(d_ff2_Y[10]), .B1(n1091), 
        .Y(n443) );
  AO22XLTS U1618 ( .A0(d_ff_Yn[1]), .A1(n1092), .B0(d_ff2_Y[1]), .B1(n1099), 
        .Y(n461) );
  AO22XLTS U1619 ( .A0(d_ff_Yn[9]), .A1(n1123), .B0(d_ff2_Y[9]), .B1(n1091), 
        .Y(n445) );
  AO22XLTS U1620 ( .A0(d_ff_Yn[2]), .A1(n1092), .B0(d_ff2_Y[2]), .B1(n802), 
        .Y(n459) );
  AO22XLTS U1621 ( .A0(d_ff_Yn[3]), .A1(n1092), .B0(d_ff2_Y[3]), .B1(n1091), 
        .Y(n457) );
  AO22XLTS U1622 ( .A0(d_ff_Yn[8]), .A1(n1134), .B0(d_ff2_Y[8]), .B1(n1091), 
        .Y(n447) );
  AO22XLTS U1623 ( .A0(d_ff_Yn[7]), .A1(n1092), .B0(d_ff2_Y[7]), .B1(n1091), 
        .Y(n449) );
  AO22XLTS U1624 ( .A0(d_ff_Yn[4]), .A1(n1134), .B0(d_ff2_Y[4]), .B1(n1091), 
        .Y(n455) );
  AO22XLTS U1625 ( .A0(d_ff_Yn[5]), .A1(n1092), .B0(d_ff2_Y[5]), .B1(n1091), 
        .Y(n453) );
  NAND2X1TS U1626 ( .A(n1093), .B(n1190), .Y(n1095) );
  AO21XLTS U1627 ( .A0(d_ff3_LUT_out[11]), .A1(n1096), .B0(n1095), .Y(n513) );
  OAI31X1TS U1628 ( .A0(cont_iter_out[0]), .A1(cont_iter_out[2]), .A2(
        cont_iter_out[3]), .B0(n1188), .Y(n1109) );
  NOR2X1TS U1629 ( .A(n1203), .B(n1109), .Y(n1097) );
  AO21XLTS U1630 ( .A0(d_ff3_LUT_out[13]), .A1(n1108), .B0(n1097), .Y(n511) );
  OAI32X1TS U1631 ( .A0(n1203), .A1(n1216), .A2(n1094), .B0(n1186), .B1(n1203), 
        .Y(n1102) );
  AO21XLTS U1632 ( .A0(d_ff3_LUT_out[14]), .A1(n1098), .B0(n1102), .Y(n510) );
  AO21XLTS U1633 ( .A0(d_ff3_LUT_out[7]), .A1(n1096), .B0(n1095), .Y(n517) );
  AO21XLTS U1634 ( .A0(d_ff3_LUT_out[18]), .A1(n1098), .B0(n1097), .Y(n506) );
  AO22XLTS U1635 ( .A0(d_ff_Xn[30]), .A1(n1100), .B0(d_ff2_X[30]), .B1(n802), 
        .Y(n346) );
  AO21XLTS U1636 ( .A0(d_ff3_LUT_out[5]), .A1(n1192), .B0(n1102), .Y(n519) );
  XOR2X1TS U1637 ( .A(n1103), .B(n1228), .Y(n1104) );
  MXI2X1TS U1638 ( .A(n1106), .B(n1105), .S0(n1104), .Y(n1107) );
  AO21XLTS U1639 ( .A0(d_ff3_sh_x_out[25]), .A1(n1108), .B0(n1107), .Y(n343)
         );
  AO22XLTS U1640 ( .A0(d_ff_Yn[25]), .A1(n1123), .B0(d_ff2_Y[25]), .B1(n1099), 
        .Y(n415) );
  AO22XLTS U1641 ( .A0(n1121), .A1(result_add_subt[29]), .B0(n1141), .B1(
        d_ff_Xn[29]), .Y(n591) );
  AOI21X1TS U1642 ( .A0(n1114), .A1(n1216), .B0(n1185), .Y(n1116) );
  AOI2BB2XLTS U1643 ( .B0(n1116), .B1(n1109), .A0N(n1183), .A1N(
        d_ff3_LUT_out[21]), .Y(n503) );
  AO22XLTS U1644 ( .A0(n1111), .A1(d_ff2_Y[12]), .B0(n1110), .B1(
        d_ff3_sh_y_out[12]), .Y(n438) );
  OAI21X1TS U1645 ( .A0(cont_iter_out[2]), .A1(cont_iter_out[3]), .B0(n1189), 
        .Y(n1182) );
  AOI21X1TS U1646 ( .A0(n1112), .A1(n1223), .B0(n1182), .Y(n1113) );
  AOI2BB1XLTS U1647 ( .A0N(n1183), .A1N(d_ff3_LUT_out[26]), .B0(n1113), .Y(
        n498) );
  AO22XLTS U1648 ( .A0(n1121), .A1(result_add_subt[28]), .B0(n1141), .B1(
        d_ff_Xn[28]), .Y(n592) );
  INVX2TS U1649 ( .A(n1114), .Y(n1180) );
  OAI21XLTS U1650 ( .A0(n814), .A1(n1180), .B0(n1188), .Y(n1115) );
  AOI2BB2XLTS U1651 ( .B0(n1116), .B1(n1115), .A0N(n1183), .A1N(
        d_ff3_LUT_out[9]), .Y(n515) );
  AOI21X1TS U1652 ( .A0(n1118), .A1(d_ff2_Y[27]), .B0(n1117), .Y(n1120) );
  AOI2BB2XLTS U1653 ( .B0(n1189), .B1(n1120), .A0N(d_ff3_sh_y_out[27]), .A1N(
        n1119), .Y(n405) );
  AO22XLTS U1654 ( .A0(n1121), .A1(result_add_subt[27]), .B0(n1122), .B1(
        d_ff_Xn[27]), .Y(n593) );
  AO22XLTS U1655 ( .A0(n1121), .A1(result_add_subt[26]), .B0(n1122), .B1(
        d_ff_Xn[26]), .Y(n594) );
  AO22XLTS U1656 ( .A0(n1038), .A1(sign_inv_out[28]), .B0(n1062), .B1(
        data_output[28]), .Y(n531) );
  AO22XLTS U1657 ( .A0(n1121), .A1(result_add_subt[24]), .B0(n1122), .B1(
        d_ff_Xn[24]), .Y(n596) );
  NAND2BXLTS U1658 ( .AN(d_ff3_LUT_out[27]), .B(n1185), .Y(n497) );
  AO22XLTS U1659 ( .A0(n1121), .A1(result_add_subt[20]), .B0(n1122), .B1(
        d_ff_Xn[20]), .Y(n600) );
  AO22XLTS U1660 ( .A0(n1150), .A1(result_add_subt[19]), .B0(n1122), .B1(
        d_ff_Xn[19]), .Y(n601) );
  AO22XLTS U1661 ( .A0(n1150), .A1(result_add_subt[17]), .B0(n1149), .B1(
        d_ff_Xn[17]), .Y(n603) );
  AO22XLTS U1662 ( .A0(d_ff_Yn[26]), .A1(n1123), .B0(d_ff2_Y[26]), .B1(n801), 
        .Y(n414) );
  AOI22X1TS U1663 ( .A0(cont_iter_out[1]), .A1(n1226), .B0(d_ff2_Y[24]), .B1(
        n1217), .Y(n1124) );
  XNOR2X1TS U1664 ( .A(n1125), .B(n1124), .Y(n1127) );
  AO22XLTS U1665 ( .A0(n1128), .A1(n1127), .B0(n1126), .B1(d_ff3_sh_y_out[24]), 
        .Y(n408) );
  AO22XLTS U1666 ( .A0(n1150), .A1(result_add_subt[16]), .B0(n1149), .B1(
        d_ff_Xn[16]), .Y(n604) );
  AO22XLTS U1667 ( .A0(n1130), .A1(result_add_subt[7]), .B0(n1129), .B1(
        d_ff_Xn[7]), .Y(n613) );
  AO22XLTS U1668 ( .A0(n1150), .A1(result_add_subt[12]), .B0(n1139), .B1(
        d_ff_Xn[12]), .Y(n608) );
  AO21XLTS U1669 ( .A0(d_ff3_LUT_out[8]), .A1(n1132), .B0(n1131), .Y(n516) );
  AO22XLTS U1670 ( .A0(d_ff_Yn[16]), .A1(n1134), .B0(d_ff2_Y[16]), .B1(n1133), 
        .Y(n431) );
  AOI31XLTS U1671 ( .A0(cordic_FSM_state_reg[0]), .A1(n1135), .A2(
        beg_fsm_cordic), .B0(ack_add_subt), .Y(n1137) );
  OAI211XLTS U1672 ( .A0(n1215), .A1(n800), .B0(cordic_FSM_state_reg[1]), .C0(
        n1225), .Y(n1136) );
  NAND3XLTS U1673 ( .A(n1137), .B(n1185), .C(n1136), .Y(
        cordic_FSM_state_next_1_) );
  AO22XLTS U1674 ( .A0(n1138), .A1(result_add_subt[29]), .B0(n1142), .B1(
        d_ff_Zn[29]), .Y(n655) );
  AO22XLTS U1675 ( .A0(n1150), .A1(result_add_subt[13]), .B0(n1139), .B1(
        d_ff_Xn[13]), .Y(n607) );
  INVX2TS U1676 ( .A(n1140), .Y(n1143) );
  AO22XLTS U1677 ( .A0(n1143), .A1(result_add_subt[30]), .B0(n1142), .B1(
        d_ff_Zn[30]), .Y(n654) );
  AO22XLTS U1678 ( .A0(n1150), .A1(result_add_subt[14]), .B0(n1141), .B1(
        d_ff_Xn[14]), .Y(n606) );
  AO22XLTS U1679 ( .A0(n1143), .A1(result_add_subt[31]), .B0(n1142), .B1(
        d_ff_Zn[31]), .Y(n653) );
  OAI21XLTS U1680 ( .A0(d_ff2_X[24]), .A1(n1217), .B0(n1144), .Y(n1145) );
  XOR2XLTS U1681 ( .A(n1146), .B(n1145), .Y(n1147) );
  AO22XLTS U1682 ( .A0(n1148), .A1(n1147), .B0(n1185), .B1(d_ff3_sh_x_out[24]), 
        .Y(n344) );
  AO22XLTS U1683 ( .A0(n1150), .A1(result_add_subt[10]), .B0(n1149), .B1(
        d_ff_Xn[10]), .Y(n610) );
  AO22XLTS U1684 ( .A0(n1012), .A1(d_ff3_sh_x_out[31]), .B0(n1152), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U1685 ( .A0(d_ff3_sh_y_out[30]), .A1(n1152), .B0(d_ff3_sh_x_out[30]), .B1(n1154), .Y(add_subt_dataB[30]) );
  AOI22X1TS U1686 ( .A0(n973), .A1(d_ff3_sh_x_out[27]), .B0(n1153), .B1(
        d_ff3_sh_y_out[27]), .Y(n1156) );
  NAND2X1TS U1687 ( .A(d_ff3_LUT_out[27]), .B(n983), .Y(n1155) );
  NAND2X1TS U1688 ( .A(n1156), .B(n1155), .Y(add_subt_dataB[27]) );
  AOI2BB2XLTS U1689 ( .B0(d_ff3_sign_out), .B1(n1227), .A0N(n1227), .A1N(
        d_ff3_sign_out), .Y(op_add_subt) );
  AOI211XLTS U1690 ( .A0(n1159), .A1(n1215), .B0(n1158), .C0(n1157), .Y(n1162)
         );
  OAI211XLTS U1691 ( .A0(n1162), .A1(n800), .B0(n1161), .C0(n1160), .Y(n732)
         );
  OAI21XLTS U1692 ( .A0(n1218), .A1(n1164), .B0(n1185), .Y(n1163) );
  AOI21X1TS U1693 ( .A0(n1218), .A1(n1164), .B0(n1163), .Y(n729) );
  NAND2X1TS U1694 ( .A(n1167), .B(n1166), .Y(n1165) );
  AOI22X1TS U1695 ( .A0(cont_iter_out[0]), .A1(n1165), .B0(n1166), .B1(n1216), 
        .Y(n728) );
  NOR2X1TS U1696 ( .A(n1216), .B(n1166), .Y(n1169) );
  OAI21XLTS U1697 ( .A0(cont_iter_out[1]), .A1(n1169), .B0(n1167), .Y(n1168)
         );
  AOI21X1TS U1698 ( .A0(cont_iter_out[1]), .A1(n1169), .B0(n1168), .Y(n727) );
  OAI32X1TS U1699 ( .A0(n1173), .A1(n1172), .A2(n1231), .B0(n1171), .B1(n1170), 
        .Y(n686) );
  CLKBUFX3TS U1700 ( .A(n1174), .Y(n1178) );
  OAI2BB2XLTS U1701 ( .B0(n1175), .B1(n1243), .A0N(n1178), .A1N(
        result_add_subt[5]), .Y(n647) );
  OAI2BB2XLTS U1702 ( .B0(n1175), .B1(n1244), .A0N(n1178), .A1N(
        result_add_subt[6]), .Y(n646) );
  OAI2BB2XLTS U1703 ( .B0(n1175), .B1(n1245), .A0N(n1178), .A1N(
        result_add_subt[7]), .Y(n645) );
  OAI2BB2XLTS U1704 ( .B0(n1175), .B1(n1246), .A0N(n1176), .A1N(
        result_add_subt[8]), .Y(n644) );
  OAI2BB2XLTS U1705 ( .B0(n1175), .B1(n1247), .A0N(n1178), .A1N(
        result_add_subt[9]), .Y(n643) );
  OAI2BB2XLTS U1706 ( .B0(n1175), .B1(n1248), .A0N(n1176), .A1N(
        result_add_subt[10]), .Y(n642) );
  OAI2BB2XLTS U1707 ( .B0(n1177), .B1(n1249), .A0N(n1176), .A1N(
        result_add_subt[11]), .Y(n641) );
  OAI2BB2XLTS U1708 ( .B0(n1177), .B1(n1250), .A0N(n1176), .A1N(
        result_add_subt[12]), .Y(n640) );
  OAI2BB2XLTS U1709 ( .B0(n1177), .B1(n1251), .A0N(n1176), .A1N(
        result_add_subt[13]), .Y(n639) );
  OAI2BB2XLTS U1710 ( .B0(n1177), .B1(n1252), .A0N(n1176), .A1N(
        result_add_subt[14]), .Y(n638) );
  OAI2BB2XLTS U1711 ( .B0(n1175), .B1(n1253), .A0N(n1178), .A1N(
        result_add_subt[15]), .Y(n637) );
  OAI2BB2XLTS U1712 ( .B0(n1177), .B1(n1254), .A0N(n1176), .A1N(
        result_add_subt[16]), .Y(n636) );
  OAI2BB2XLTS U1713 ( .B0(n1177), .B1(n1255), .A0N(n1176), .A1N(
        result_add_subt[17]), .Y(n635) );
  OAI2BB2XLTS U1714 ( .B0(n1177), .B1(n1256), .A0N(n1178), .A1N(
        result_add_subt[18]), .Y(n634) );
  OAI2BB2XLTS U1715 ( .B0(n1177), .B1(n1257), .A0N(n1178), .A1N(
        result_add_subt[19]), .Y(n633) );
  OAI2BB2XLTS U1716 ( .B0(n1177), .B1(n1220), .A0N(n1178), .A1N(
        result_add_subt[20]), .Y(n632) );
  OAI2BB2XLTS U1717 ( .B0(n1179), .B1(n1221), .A0N(n1178), .A1N(
        result_add_subt[22]), .Y(n630) );
  OAI2BB2XLTS U1718 ( .B0(n1179), .B1(n1206), .A0N(n1178), .A1N(
        result_add_subt[23]), .Y(n629) );
  OAI211X1TS U1719 ( .A0(n1180), .A1(cont_iter_out[2]), .B0(n1188), .C0(n1189), 
        .Y(n1187) );
  OAI2BB1X1TS U1720 ( .A0N(d_ff3_LUT_out[3]), .A1N(n1192), .B0(n1187), .Y(n521) );
  OA22X1TS U1721 ( .A0(n1183), .A1(d_ff3_LUT_out[4]), .B0(n1182), .B1(n1181), 
        .Y(n520) );
  OAI2BB1X1TS U1722 ( .A0N(d_ff3_LUT_out[10]), .A1N(n1192), .B0(n1184), .Y(
        n514) );
  AOI22X1TS U1723 ( .A0(n1205), .A1(n1186), .B0(n1235), .B1(n1185), .Y(n512)
         );
  OAI2BB1X1TS U1724 ( .A0N(d_ff3_LUT_out[15]), .A1N(n1192), .B0(n1190), .Y(
        n509) );
  OAI2BB1X1TS U1725 ( .A0N(d_ff3_LUT_out[16]), .A1N(n1192), .B0(n1187), .Y(
        n508) );
  OAI2BB1X1TS U1726 ( .A0N(d_ff3_LUT_out[17]), .A1N(n1192), .B0(n1190), .Y(
        n507) );
  NAND2X1TS U1727 ( .A(n1189), .B(n1188), .Y(n1191) );
  OAI2BB1X1TS U1728 ( .A0N(d_ff3_LUT_out[19]), .A1N(n1192), .B0(n1191), .Y(
        n505) );
  OAI2BB1X1TS U1729 ( .A0N(d_ff3_LUT_out[20]), .A1N(n1192), .B0(n1190), .Y(
        n504) );
  OAI2BB1X1TS U1730 ( .A0N(d_ff3_LUT_out[22]), .A1N(n1192), .B0(n1191), .Y(
        n502) );
  OAI22X1TS U1731 ( .A0(n1198), .A1(n1229), .B0(n1206), .B1(n1194), .Y(n417)
         );
  OAI22X1TS U1732 ( .A0(n1193), .A1(n1226), .B0(n1207), .B1(n1195), .Y(n416)
         );
  OAI22X1TS U1733 ( .A0(n1198), .A1(n1233), .B0(n1208), .B1(n1194), .Y(n413)
         );
  OAI22X1TS U1734 ( .A0(n1200), .A1(n1230), .B0(n1209), .B1(n1195), .Y(n412)
         );
  OAI22X1TS U1735 ( .A0(n1200), .A1(n1234), .B0(n1210), .B1(n1194), .Y(n411)
         );
  OAI22X1TS U1736 ( .A0(n1200), .A1(n1232), .B0(n1219), .B1(n1195), .Y(n410)
         );
  OA22X1TS U1737 ( .A0(n1198), .A1(d_ff2_X[5]), .B0(d_ff_Xn[5]), .B1(n1196), 
        .Y(n389) );
  OA22X1TS U1738 ( .A0(n1198), .A1(d_ff2_X[7]), .B0(d_ff_Xn[7]), .B1(n1196), 
        .Y(n385) );
  OA22X1TS U1739 ( .A0(n1198), .A1(d_ff2_X[10]), .B0(d_ff_Xn[10]), .B1(n1196), 
        .Y(n379) );
  OA22X1TS U1740 ( .A0(n1198), .A1(d_ff2_X[12]), .B0(d_ff_Xn[12]), .B1(n1197), 
        .Y(n375) );
  OA22X1TS U1741 ( .A0(n1200), .A1(d_ff2_X[27]), .B0(d_ff_Xn[27]), .B1(n1199), 
        .Y(n349) );
  AOI21X1TS U1742 ( .A0(d_ff2_X[29]), .A1(n1202), .B0(n1201), .Y(n1204) );
  AOI22X1TS U1743 ( .A0(n1205), .A1(n1204), .B0(n1236), .B1(n1203), .Y(n339)
         );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_noclk.tcl_syn.sdf"); 
 endmodule

