/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Nov  3 17:58:41 2016
/////////////////////////////////////////////////////////////


module CORDIC_Arch3v1_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_fsm_cordic, 
        ack_cordic, operation, data_in, shift_region_flag, ready_cordic, 
        data_output, beg_add_subt, add_subt_dataA, add_subt_dataB, 
        result_add_subt, op_add_subt, ready_add_subt, enab_cont_iter );
  input [31:0] data_in;
  input [1:0] shift_region_flag;
  output [31:0] data_output;
  output [31:0] add_subt_dataA;
  output [31:0] add_subt_dataB;
  input [31:0] result_add_subt;
  input clk, rst, beg_fsm_cordic, ack_cordic, operation, ready_add_subt;
  output ready_cordic, beg_add_subt, op_add_subt, enab_cont_iter;
  wire   d_ff1_operation_out, d_ff3_sign_out, n281, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906, n907,
         n908, n909, n910, n911, n912, n913, n914, n915, n916, n917, n918,
         n919, n920, n921, n922, n923, n924, n925, n926, n927, n928, n929,
         n930, n931, n932, n933, n934, n935, n936, n937, n938, n939, n940,
         n941, n942, n943, n944, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n955, n956, n957, n958, n959, n960, n961, n962,
         n963, n964, n965, n966, n967, n968, n969, n970, n971, n972, n973,
         n974, n975, n976, n977, n978, n979, n980, n981, n982, n983, n984,
         n985, n986, n987, n988, n989, n990, intadd_515_CI, intadd_515_SUM_2_,
         intadd_515_SUM_1_, intadd_515_SUM_0_, intadd_515_n3, intadd_515_n2,
         intadd_515_n1, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065,
         n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075,
         n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085,
         n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095,
         n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105,
         n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115,
         n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125,
         n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135,
         n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145,
         n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155,
         n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165,
         n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175,
         n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185,
         n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195,
         n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205,
         n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215,
         n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225,
         n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235,
         n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245,
         n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255,
         n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265,
         n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275,
         n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285,
         n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295,
         n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305,
         n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315,
         n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325,
         n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335,
         n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345,
         n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354, n1355,
         n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365,
         n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375,
         n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385,
         n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395,
         n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405,
         n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415,
         n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425,
         n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435,
         n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445,
         n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455,
         n1456, n1457, n1458, n1459, n1460, n1461;
  wire   [3:1] cont_iter_out;
  wire   [1:0] cont_var_out;
  wire   [1:0] d_ff1_shift_region_flag_out;
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
  wire   [7:0] inst_CORDIC_FSM_v3_state_next;
  wire   [7:0] inst_CORDIC_FSM_v3_state_reg;

  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(n975), .CK(clk), .RN(n1457), .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(n974), .CK(clk), .RN(n1457), .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(n973), .CK(clk), .RN(n1457), .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(n972), .CK(clk), .RN(n1457), .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(n971), .CK(clk), .RN(n1457), .Q(d_ff1_Z[10])
         );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(n970), .CK(clk), .RN(n1457), .Q(d_ff1_Z[11])
         );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(n969), .CK(clk), .RN(n1460), .Q(d_ff1_Z[12])
         );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(n968), .CK(clk), .RN(n1459), .Q(d_ff1_Z[13])
         );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(n967), .CK(clk), .RN(n1460), .Q(d_ff1_Z[14])
         );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(n966), .CK(clk), .RN(n1459), .Q(d_ff1_Z[15])
         );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(n965), .CK(clk), .RN(n281), .Q(d_ff1_Z[16])
         );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(n964), .CK(clk), .RN(n281), .Q(d_ff1_Z[17])
         );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(n963), .CK(clk), .RN(n281), .Q(d_ff1_Z[18])
         );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(n962), .CK(clk), .RN(n281), .Q(d_ff1_Z[19])
         );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(n961), .CK(clk), .RN(n281), .Q(d_ff1_Z[20])
         );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(n960), .CK(clk), .RN(n281), .Q(d_ff1_Z[21])
         );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(n959), .CK(clk), .RN(n1456), .Q(d_ff1_Z[22])
         );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(n958), .CK(clk), .RN(n1456), .Q(d_ff1_Z[23])
         );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(n957), .CK(clk), .RN(n1456), .Q(d_ff1_Z[24])
         );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(n956), .CK(clk), .RN(n1456), .Q(d_ff1_Z[25])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(n949), .CK(clk), .RN(n1455), .Q(d_ff_Zn[0])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(n948), .CK(clk), .RN(n1455), .Q(d_ff_Zn[1])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(n947), .CK(clk), .RN(n1455), .Q(d_ff_Zn[2])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(n946), .CK(clk), .RN(n1455), .Q(d_ff_Zn[3])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(n945), .CK(clk), .RN(n1455), .Q(d_ff_Zn[4])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(n940), .CK(clk), .RN(n1455), .Q(d_ff_Zn[9])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(n939), .CK(clk), .RN(n1454), .Q(d_ff_Zn[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(n938), .CK(clk), .RN(n1454), .Q(d_ff_Zn[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(n937), .CK(clk), .RN(n1454), .Q(d_ff_Zn[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(n936), .CK(clk), .RN(n1454), .Q(d_ff_Zn[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(n935), .CK(clk), .RN(n1454), .Q(d_ff_Zn[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(n934), .CK(clk), .RN(n1454), .Q(d_ff_Zn[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(n933), .CK(clk), .RN(n1454), .Q(d_ff_Zn[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(n932), .CK(clk), .RN(n1454), .Q(d_ff_Zn[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(n931), .CK(clk), .RN(n1454), .Q(d_ff_Zn[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(n924), .CK(clk), .RN(n1453), .Q(d_ff_Zn[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(n923), .CK(clk), .RN(n1453), .Q(d_ff_Zn[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(n922), .CK(clk), .RN(n1453), .Q(d_ff_Zn[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(n921), .CK(clk), .RN(n1453), .Q(d_ff_Zn[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(n920), .CK(clk), .RN(n1453), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(n821), .CK(clk), .RN(n1443), .Q(
        d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n820), .CK(clk), .RN(n1443), .Q(
        d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n819), .CK(clk), .RN(n1442), .Q(
        d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n818), .CK(clk), .RN(n1442), .Q(
        d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(n817), .CK(clk), .RN(n1442), .Q(
        d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n812), .CK(clk), .RN(n1442), .QN(n1060) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n811), .CK(clk), .RN(n1442), .Q(
        d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n810), .CK(clk), .RN(n1442), .QN(n1061) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n806), .CK(clk), .RN(n1441), .QN(n1062) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n804), .CK(clk), .RN(n1441), .Q(
        d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(n803), .CK(clk), .RN(n1441), .Q(
        d_ff3_LUT_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(n707), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(n706), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_y_out[30]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(n645), .CK(clk), .RN(n1439), .Q(
        d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(n644), .CK(clk), .RN(n1439), .Q(
        d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(n643), .CK(clk), .RN(n1439), .QN(n1063)
         );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(n642), .CK(clk), .RN(n1439), .Q(
        d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(n795), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(n794), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(n793), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(n792), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(n791), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(n790), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(n789), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(n788), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(n787), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(n786), .CK(clk), .RN(n1438), .Q(
        d_ff2_Z[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(n785), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(n784), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(n783), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(n782), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(n781), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(n780), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(n779), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(n778), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(n777), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(n776), .CK(clk), .RN(n1437), .Q(
        d_ff2_Z[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(n775), .CK(clk), .RN(n1436), .Q(
        d_ff2_Z[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(n771), .CK(clk), .RN(n1436), .Q(
        d_ff2_Z[29]) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(n983), .CK(clk), .RN(n1458), .Q(
        d_ff1_shift_region_flag_out[0]), .QN(n1419) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(n656), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[24]), .QN(n1415) );
  DFFRX2TS ITER_CONT_temp_reg_1_ ( .D(n988), .CK(clk), .RN(n1459), .Q(
        cont_iter_out[1]), .QN(n1414) );
  DFFRX1TS reg_LUT_Q_reg_15_ ( .D(n808), .CK(clk), .RN(n1441), .QN(n1412) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(n982), .CK(clk), .RN(n1458), .Q(
        d_ff1_shift_region_flag_out[1]), .QN(n1411) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(n984), .CK(clk), .RN(n1458), .Q(
        d_ff1_operation_out), .QN(n1410) );
  DFFRX2TS VAR_CONT_temp_reg_0_ ( .D(n985), .CK(clk), .RN(n1458), .Q(
        cont_var_out[0]), .QN(n1409) );
  DFFRX2TS ITER_CONT_temp_reg_3_ ( .D(n986), .CK(clk), .RN(n1459), .Q(
        cont_iter_out[3]), .QN(n1408) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(n852), .CK(clk), .RN(n1449), .Q(
        data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(n851), .CK(clk), .RN(n1449), .Q(
        data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(n850), .CK(clk), .RN(n1448), .Q(
        data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(n849), .CK(clk), .RN(n1448), .Q(
        data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(n848), .CK(clk), .RN(n1448), .Q(
        data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(n847), .CK(clk), .RN(n1448), .Q(
        data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(n846), .CK(clk), .RN(n1448), .Q(
        data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(n845), .CK(clk), .RN(n1447), .Q(
        data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(n844), .CK(clk), .RN(n1447), .Q(
        data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(n843), .CK(clk), .RN(n1447), .Q(
        data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(n842), .CK(clk), .RN(n1447), .Q(
        data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(n841), .CK(clk), .RN(n1447), .Q(
        data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(n840), .CK(clk), .RN(n1446), .Q(
        data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(n839), .CK(clk), .RN(n1446), .Q(
        data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(n838), .CK(clk), .RN(n1446), .Q(
        data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(n837), .CK(clk), .RN(n1446), .Q(
        data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(n836), .CK(clk), .RN(n1446), .Q(
        data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(n835), .CK(clk), .RN(n1445), .Q(
        data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(n834), .CK(clk), .RN(n1445), .Q(
        data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(n832), .CK(clk), .RN(n1445), .Q(
        data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(n831), .CK(clk), .RN(n1445), .Q(
        data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(n830), .CK(clk), .RN(n1444), .Q(
        data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(n829), .CK(clk), .RN(n1444), .Q(
        data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(n828), .CK(clk), .RN(n1444), .Q(
        data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(n827), .CK(clk), .RN(n1444), .Q(
        data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(n826), .CK(clk), .RN(n1444), .Q(
        data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(n825), .CK(clk), .RN(n1443), .Q(
        data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(n824), .CK(clk), .RN(n1443), .Q(
        data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(n823), .CK(clk), .RN(n1443), .Q(
        data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(n822), .CK(clk), .RN(n1443), .Q(
        data_output[31]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(n833), .CK(clk), .RN(n1445), .Q(
        data_output[20]) );
  DFFRX1TS reg_sign_Q_reg_0_ ( .D(n768), .CK(clk), .RN(n1436), .Q(
        d_ff3_sign_out) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(n721), .CK(clk), .RN(n1431), .Q(
        d_ff2_Y[23]), .QN(n1417) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(clk), .RN(n1458), .Q(
        inst_CORDIC_FSM_v3_state_reg[1]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(clk), .RN(n1460), .Q(
        inst_CORDIC_FSM_v3_state_reg[4]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(
        inst_CORDIC_FSM_v3_state_next[2]), .CK(clk), .RN(n1458), .Q(
        inst_CORDIC_FSM_v3_state_reg[2]) );
  DFFRX2TS ITER_CONT_temp_reg_2_ ( .D(n987), .CK(clk), .RN(n1076), .Q(n1422), 
        .QN(n1413) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(n652), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[28]), .QN(n1420) );
  DFFRX2TS ITER_CONT_temp_reg_0_ ( .D(n989), .CK(clk), .RN(n1460), .Q(n1064), 
        .QN(n1423) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_27_ ( .D(n653), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[27]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(clk), .RN(n1458), .Q(
        inst_CORDIC_FSM_v3_state_reg[5]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(clk), .RN(n1078), .Q(
        inst_CORDIC_FSM_v3_state_reg[6]), .QN(n1416) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(n754), .CK(clk), .RN(n1434), .Q(
        d_ff3_sh_y_out[6]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(n676), .CK(clk), .RN(n1427), .Q(
        d_ff3_sh_x_out[13]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(n722), .CK(clk), .RN(n1431), .Q(
        d_ff3_sh_y_out[22]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(n647), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_x_out[25]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_16_ ( .D(n671), .CK(clk), .RN(n1427), .Q(
        d_ff2_X[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(n925), .CK(clk), .RN(n1453), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(n976), .CK(clk), .RN(n1457), .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(n648), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_x_out[24]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_1_ ( .D(n799), .CK(clk), .RN(n1439), .Q(
        d_ff2_Z[1]) );
  DFFRX2TS reg_val_muxY_2stage_Q_reg_27_ ( .D(n717), .CK(clk), .RN(n1431), .Q(
        d_ff2_Y[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_23_ ( .D(n657), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[23]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(n715), .CK(clk), .RN(n1430), .Q(
        d_ff2_Y[29]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(n718), .CK(clk), .RN(n1431), .Q(
        d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(n719), .CK(clk), .RN(n1431), .Q(
        d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(n720), .CK(clk), .RN(n1431), .Q(
        d_ff2_Y[24]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_31_ ( .D(n769), .CK(clk), .RN(n1436), .Q(
        d_ff2_Z[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_30_ ( .D(n714), .CK(clk), .RN(n1430), .Q(
        d_ff2_Y[30]) );
  DFFRX1TS d_ff4_Xn_Q_reg_26_ ( .D(n859), .CK(clk), .RN(n1444), .Q(d_ff_Xn[26]) );
  DFFRX1TS d_ff4_Xn_Q_reg_25_ ( .D(n860), .CK(clk), .RN(n1444), .Q(d_ff_Xn[25]) );
  DFFRX1TS d_ff4_Xn_Q_reg_20_ ( .D(n865), .CK(clk), .RN(n1445), .Q(d_ff_Xn[20]) );
  DFFRX1TS d_ff4_Xn_Q_reg_19_ ( .D(n866), .CK(clk), .RN(n1445), .Q(d_ff_Xn[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_17_ ( .D(n868), .CK(clk), .RN(n1446), .Q(d_ff_Xn[17]) );
  DFFRX1TS d_ff4_Xn_Q_reg_16_ ( .D(n869), .CK(clk), .RN(n1446), .Q(d_ff_Xn[16]) );
  DFFRX1TS d_ff4_Xn_Q_reg_14_ ( .D(n871), .CK(clk), .RN(n1446), .Q(d_ff_Xn[14]) );
  DFFRX1TS d_ff4_Xn_Q_reg_13_ ( .D(n872), .CK(clk), .RN(n1446), .Q(d_ff_Xn[13]) );
  DFFRX1TS d_ff4_Xn_Q_reg_12_ ( .D(n873), .CK(clk), .RN(n1447), .Q(d_ff_Xn[12]) );
  DFFRX1TS d_ff4_Xn_Q_reg_10_ ( .D(n875), .CK(clk), .RN(n1447), .Q(d_ff_Xn[10]) );
  DFFRX1TS d_ff4_Xn_Q_reg_29_ ( .D(n856), .CK(clk), .RN(n1443), .Q(d_ff_Xn[29]) );
  DFFRX1TS d_ff4_Xn_Q_reg_28_ ( .D(n857), .CK(clk), .RN(n1443), .Q(d_ff_Xn[28]) );
  DFFRX1TS d_ff4_Xn_Q_reg_27_ ( .D(n858), .CK(clk), .RN(n1444), .Q(d_ff_Xn[27]) );
  DFFRX1TS d_ff4_Xn_Q_reg_24_ ( .D(n861), .CK(clk), .RN(n1444), .Q(d_ff_Xn[24]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_31_ ( .D(n705), .CK(clk), .RN(n1430), .Q(
        d_ff2_Y[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_22_ ( .D(n723), .CK(clk), .RN(n1431), .Q(
        d_ff2_Y[22]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_21_ ( .D(n725), .CK(clk), .RN(n1431), .Q(
        d_ff2_Y[21]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_20_ ( .D(n727), .CK(clk), .RN(n1432), .Q(
        d_ff2_Y[20]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_19_ ( .D(n729), .CK(clk), .RN(n1432), .Q(
        d_ff2_Y[19]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_18_ ( .D(n731), .CK(clk), .RN(n1432), .Q(
        d_ff2_Y[18]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_17_ ( .D(n733), .CK(clk), .RN(n1432), .Q(
        d_ff2_Y[17]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_16_ ( .D(n735), .CK(clk), .RN(n1432), .Q(
        d_ff2_Y[16]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_15_ ( .D(n737), .CK(clk), .RN(n1433), .Q(
        d_ff2_Y[15]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_14_ ( .D(n739), .CK(clk), .RN(n1433), .Q(
        d_ff2_Y[14]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_13_ ( .D(n741), .CK(clk), .RN(n1433), .Q(
        d_ff2_Y[13]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_12_ ( .D(n743), .CK(clk), .RN(n1433), .Q(
        d_ff2_Y[12]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_11_ ( .D(n745), .CK(clk), .RN(n1433), .Q(
        d_ff2_Y[11]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_10_ ( .D(n747), .CK(clk), .RN(n1434), .Q(
        d_ff2_Y[10]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_9_ ( .D(n749), .CK(clk), .RN(n1434), .Q(
        d_ff2_Y[9]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_8_ ( .D(n751), .CK(clk), .RN(n1434), .Q(
        d_ff2_Y[8]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_7_ ( .D(n753), .CK(clk), .RN(n1434), .Q(
        d_ff2_Y[7]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_6_ ( .D(n755), .CK(clk), .RN(n1434), .Q(
        d_ff2_Y[6]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_5_ ( .D(n757), .CK(clk), .RN(n1435), .Q(
        d_ff2_Y[5]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_4_ ( .D(n759), .CK(clk), .RN(n1435), .Q(
        d_ff2_Y[4]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_3_ ( .D(n761), .CK(clk), .RN(n1435), .Q(
        d_ff2_Y[3]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_2_ ( .D(n763), .CK(clk), .RN(n1435), .Q(
        d_ff2_Y[2]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_1_ ( .D(n765), .CK(clk), .RN(n1435), .Q(
        d_ff2_Y[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_0_ ( .D(n767), .CK(clk), .RN(n1436), .Q(
        d_ff2_Y[0]) );
  DFFRX1TS d_ff4_Xn_Q_reg_22_ ( .D(n863), .CK(clk), .RN(n1445), .Q(d_ff_Xn[22]) );
  DFFRX1TS d_ff4_Xn_Q_reg_21_ ( .D(n864), .CK(clk), .RN(n1445), .Q(d_ff_Xn[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_18_ ( .D(n867), .CK(clk), .RN(n1445), .Q(d_ff_Xn[18]) );
  DFFRX1TS d_ff4_Xn_Q_reg_15_ ( .D(n870), .CK(clk), .RN(n1446), .Q(d_ff_Xn[15]) );
  DFFRX1TS d_ff4_Xn_Q_reg_11_ ( .D(n874), .CK(clk), .RN(n1447), .Q(d_ff_Xn[11]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_8_ ( .D(n687), .CK(clk), .RN(n1428), .Q(
        d_ff2_X[8]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_4_ ( .D(n695), .CK(clk), .RN(n1429), .Q(
        d_ff2_X[4]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_0_ ( .D(n703), .CK(clk), .RN(n1430), .Q(
        d_ff2_X[0]) );
  DFFRX1TS d_ff4_Yn_Q_reg_28_ ( .D(n889), .CK(clk), .RN(n1449), .Q(d_ff_Yn[28]) );
  DFFRX1TS d_ff4_Yn_Q_reg_23_ ( .D(n894), .CK(clk), .RN(n1450), .Q(d_ff_Yn[23]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_30_ ( .D(n650), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[30]) );
  DFFRX1TS reg_LUT_Q_reg_7_ ( .D(n814), .CK(clk), .RN(n1442), .Q(
        d_ff3_LUT_out[7]) );
  DFFRX1TS reg_LUT_Q_reg_5_ ( .D(n816), .CK(clk), .RN(n1442), .Q(
        d_ff3_LUT_out[5]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(clk), .RN(n1459), .Q(
        inst_CORDIC_FSM_v3_state_reg[7]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_26_ ( .D(n774), .CK(clk), .RN(n1436), .Q(
        d_ff2_Z[26]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_2_ ( .D(n798), .CK(clk), .RN(n1439), .Q(
        d_ff2_Z[2]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_28_ ( .D(n772), .CK(clk), .RN(n1436), .Q(
        d_ff2_Z[28]) );
  DFFRX1TS reg_LUT_Q_reg_6_ ( .D(n815), .CK(clk), .RN(n1442), .Q(
        d_ff3_LUT_out[6]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_28_ ( .D(n716), .CK(clk), .RN(n1431), .Q(
        d_ff2_Y[28]), .QN(n1421) );
  DFFRX1TS d_ff4_Yn_Q_reg_0_ ( .D(n917), .CK(clk), .RN(n1452), .Q(d_ff_Yn[0])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_1_ ( .D(n916), .CK(clk), .RN(n1452), .Q(d_ff_Yn[1])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_2_ ( .D(n915), .CK(clk), .RN(n1452), .Q(d_ff_Yn[2])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_3_ ( .D(n914), .CK(clk), .RN(n1452), .Q(d_ff_Yn[3])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_4_ ( .D(n913), .CK(clk), .RN(n1452), .Q(d_ff_Yn[4])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_5_ ( .D(n912), .CK(clk), .RN(n1452), .Q(d_ff_Yn[5])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_6_ ( .D(n911), .CK(clk), .RN(n1452), .Q(d_ff_Yn[6])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_7_ ( .D(n910), .CK(clk), .RN(n1452), .Q(d_ff_Yn[7])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_8_ ( .D(n909), .CK(clk), .RN(n1451), .Q(d_ff_Yn[8])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_9_ ( .D(n908), .CK(clk), .RN(n1451), .Q(d_ff_Yn[9])
         );
  DFFRX1TS d_ff4_Yn_Q_reg_30_ ( .D(n887), .CK(clk), .RN(n1449), .Q(d_ff_Yn[30]) );
  DFFRX1TS d_ff4_Yn_Q_reg_31_ ( .D(n886), .CK(clk), .RN(n1449), .Q(d_ff_Yn[31]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_22_ ( .D(n659), .CK(clk), .RN(n1426), .Q(
        d_ff2_X[22]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_31_ ( .D(n641), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[31]) );
  DFFRX1TS d_ff4_Yn_Q_reg_10_ ( .D(n907), .CK(clk), .RN(n1451), .Q(d_ff_Yn[10]) );
  DFFRX1TS d_ff4_Yn_Q_reg_11_ ( .D(n906), .CK(clk), .RN(n1451), .Q(d_ff_Yn[11]) );
  DFFRX1TS d_ff4_Yn_Q_reg_12_ ( .D(n905), .CK(clk), .RN(n1451), .Q(d_ff_Yn[12]) );
  DFFRX1TS d_ff4_Yn_Q_reg_13_ ( .D(n904), .CK(clk), .RN(n1451), .Q(d_ff_Yn[13]) );
  DFFRX1TS d_ff4_Yn_Q_reg_14_ ( .D(n903), .CK(clk), .RN(n1451), .Q(d_ff_Yn[14]) );
  DFFRX1TS d_ff4_Yn_Q_reg_15_ ( .D(n902), .CK(clk), .RN(n1451), .Q(d_ff_Yn[15]) );
  DFFRX1TS d_ff4_Yn_Q_reg_16_ ( .D(n901), .CK(clk), .RN(n1451), .Q(d_ff_Yn[16]) );
  DFFRX1TS d_ff4_Yn_Q_reg_17_ ( .D(n900), .CK(clk), .RN(n1451), .Q(d_ff_Yn[17]) );
  DFFRX1TS d_ff4_Yn_Q_reg_18_ ( .D(n899), .CK(clk), .RN(n1450), .Q(d_ff_Yn[18]) );
  DFFRX1TS d_ff4_Yn_Q_reg_19_ ( .D(n898), .CK(clk), .RN(n1450), .Q(d_ff_Yn[19]) );
  DFFRX1TS d_ff4_Yn_Q_reg_20_ ( .D(n897), .CK(clk), .RN(n1450), .Q(d_ff_Yn[20]) );
  DFFRX1TS d_ff4_Yn_Q_reg_21_ ( .D(n896), .CK(clk), .RN(n1450), .Q(d_ff_Yn[21]) );
  DFFRX1TS d_ff4_Yn_Q_reg_22_ ( .D(n895), .CK(clk), .RN(n1450), .Q(d_ff_Yn[22]) );
  DFFRX1TS d_ff4_Yn_Q_reg_24_ ( .D(n893), .CK(clk), .RN(n1450), .Q(d_ff_Yn[24]) );
  DFFRX1TS d_ff4_Yn_Q_reg_25_ ( .D(n892), .CK(clk), .RN(n1450), .Q(d_ff_Yn[25]) );
  DFFRX1TS d_ff4_Yn_Q_reg_26_ ( .D(n891), .CK(clk), .RN(n1450), .Q(d_ff_Yn[26]) );
  DFFRX1TS d_ff4_Yn_Q_reg_27_ ( .D(n890), .CK(clk), .RN(n1450), .Q(d_ff_Yn[27]) );
  DFFRX1TS d_ff4_Yn_Q_reg_29_ ( .D(n888), .CK(clk), .RN(n1449), .Q(d_ff_Yn[29]) );
  DFFRX1TS d_ff4_Xn_Q_reg_23_ ( .D(n862), .CK(clk), .RN(n1444), .Q(d_ff_Xn[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_27_ ( .D(n773), .CK(clk), .RN(n1436), .Q(
        d_ff2_Z[27]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_30_ ( .D(n770), .CK(clk), .RN(n1436), .Q(
        d_ff2_Z[30]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_3_ ( .D(n797), .CK(clk), .RN(n1439), .Q(
        d_ff2_Z[3]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_4_ ( .D(n796), .CK(clk), .RN(n1439), .Q(
        d_ff2_Z[4]) );
  DFFRX1TS VAR_CONT_temp_reg_1_ ( .D(n990), .CK(clk), .RN(n1460), .Q(
        cont_var_out[1]), .QN(n1418) );
  DFFSX1TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(clk), .SN(n1460), .Q(
        inst_CORDIC_FSM_v3_state_reg[0]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n813), .CK(clk), .RN(n1442), .Q(
        d_ff3_LUT_out[8]) );
  DFFRX1TS reg_LUT_Q_reg_27_ ( .D(n801), .CK(clk), .RN(n1441), .Q(
        d_ff3_LUT_out[27]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(n1424), .CK(clk), .RN(
        n1458), .Q(inst_CORDIC_FSM_v3_state_reg[3]) );
  DFFRX1TS reg_LUT_Q_reg_13_ ( .D(n809), .CK(clk), .RN(n1441), .QN(n1461) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(n651), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[29]) );
  DFFRX1TS reg_LUT_Q_reg_19_ ( .D(n807), .CK(clk), .RN(n1441), .Q(
        d_ff3_LUT_out[19]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(n752), .CK(clk), .RN(n1434), .Q(
        d_ff3_sh_y_out[7]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(n756), .CK(clk), .RN(n1435), .Q(
        d_ff3_sh_y_out[5]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(n758), .CK(clk), .RN(n1435), .Q(
        d_ff3_sh_y_out[4]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(n760), .CK(clk), .RN(n1435), .Q(
        d_ff3_sh_y_out[3]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(n762), .CK(clk), .RN(n1435), .Q(
        d_ff3_sh_y_out[2]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(n764), .CK(clk), .RN(n1435), .Q(
        d_ff3_sh_y_out[1]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(n766), .CK(clk), .RN(n1436), .Q(
        d_ff3_sh_y_out[0]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(n710), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(n711), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(n712), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(n640), .CK(clk), .RN(n1425), .Q(
        d_ff3_sh_x_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(n666), .CK(clk), .RN(n1426), .Q(
        d_ff3_sh_x_out[18]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(n670), .CK(clk), .RN(n1427), .Q(
        d_ff3_sh_x_out[16]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(n672), .CK(clk), .RN(n1427), .Q(
        d_ff3_sh_x_out[15]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(n674), .CK(clk), .RN(n1427), .Q(
        d_ff3_sh_x_out[14]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(n678), .CK(clk), .RN(n1428), .Q(
        d_ff3_sh_x_out[12]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(n680), .CK(clk), .RN(n1428), .Q(
        d_ff3_sh_x_out[11]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(n682), .CK(clk), .RN(n1428), .Q(
        d_ff3_sh_x_out[10]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(n684), .CK(clk), .RN(n1428), .Q(
        d_ff3_sh_x_out[9]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(n686), .CK(clk), .RN(n1428), .Q(
        d_ff3_sh_x_out[8]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(n688), .CK(clk), .RN(n1429), .Q(
        d_ff3_sh_x_out[7]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(n692), .CK(clk), .RN(n1429), .Q(
        d_ff3_sh_x_out[5]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(n694), .CK(clk), .RN(n1429), .Q(
        d_ff3_sh_x_out[4]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(n696), .CK(clk), .RN(n1429), .Q(
        d_ff3_sh_x_out[3]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(n698), .CK(clk), .RN(n1430), .Q(
        d_ff3_sh_x_out[2]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(n700), .CK(clk), .RN(n1430), .Q(
        d_ff3_sh_x_out[1]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(n702), .CK(clk), .RN(n1430), .Q(
        d_ff3_sh_x_out[0]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(n704), .CK(clk), .RN(n1430), .Q(
        d_ff3_sh_y_out[31]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(n724), .CK(clk), .RN(n1431), .Q(
        d_ff3_sh_y_out[21]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(n726), .CK(clk), .RN(n1432), .Q(
        d_ff3_sh_y_out[20]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(n728), .CK(clk), .RN(n1432), .Q(
        d_ff3_sh_y_out[19]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(n730), .CK(clk), .RN(n1432), .Q(
        d_ff3_sh_y_out[18]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(n732), .CK(clk), .RN(n1432), .Q(
        d_ff3_sh_y_out[17]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(n734), .CK(clk), .RN(n1432), .Q(
        d_ff3_sh_y_out[16]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(n736), .CK(clk), .RN(n1433), .Q(
        d_ff3_sh_y_out[15]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(n738), .CK(clk), .RN(n1433), .Q(
        d_ff3_sh_y_out[14]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(n740), .CK(clk), .RN(n1433), .Q(
        d_ff3_sh_y_out[13]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(n742), .CK(clk), .RN(n1433), .Q(
        d_ff3_sh_y_out[12]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(n744), .CK(clk), .RN(n1433), .Q(
        d_ff3_sh_y_out[11]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(n746), .CK(clk), .RN(n1434), .Q(
        d_ff3_sh_y_out[10]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(n748), .CK(clk), .RN(n1434), .Q(
        d_ff3_sh_y_out[9]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(n750), .CK(clk), .RN(n1434), .Q(
        d_ff3_sh_y_out[8]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(n658), .CK(clk), .RN(n1426), .Q(
        d_ff3_sh_x_out[22]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(n660), .CK(clk), .RN(n1426), .Q(
        d_ff3_sh_x_out[21]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(n662), .CK(clk), .RN(n1426), .Q(
        d_ff3_sh_x_out[20]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(n664), .CK(clk), .RN(n1426), .Q(
        d_ff3_sh_x_out[19]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(n668), .CK(clk), .RN(n1427), .Q(
        d_ff3_sh_x_out[17]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(n654), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(n655), .CK(clk), .RN(n1425), .Q(
        d_ff2_X[25]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_5_ ( .D(n693), .CK(clk), .RN(n1429), .Q(
        d_ff2_X[5]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_3_ ( .D(n697), .CK(clk), .RN(n1429), .Q(
        d_ff2_X[3]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_2_ ( .D(n699), .CK(clk), .RN(n1430), .Q(
        d_ff2_X[2]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_1_ ( .D(n701), .CK(clk), .RN(n1430), .Q(
        d_ff2_X[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_20_ ( .D(n663), .CK(clk), .RN(n1426), .Q(
        d_ff2_X[20]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_19_ ( .D(n665), .CK(clk), .RN(n1426), .Q(
        d_ff2_X[19]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_17_ ( .D(n669), .CK(clk), .RN(n1427), .Q(
        d_ff2_X[17]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_14_ ( .D(n675), .CK(clk), .RN(n1427), .Q(
        d_ff2_X[14]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_13_ ( .D(n677), .CK(clk), .RN(n1427), .Q(
        d_ff2_X[13]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_12_ ( .D(n679), .CK(clk), .RN(n1428), .Q(
        d_ff2_X[12]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_10_ ( .D(n683), .CK(clk), .RN(n1428), .Q(
        d_ff2_X[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_7_ ( .D(n689), .CK(clk), .RN(n1429), .Q(
        d_ff2_X[7]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_6_ ( .D(n691), .CK(clk), .RN(n1429), .Q(
        d_ff2_X[6]) );
  DFFRX1TS reg_shift_x_Q_reg_26_ ( .D(n646), .CK(clk), .RN(n1439), .Q(
        d_ff3_sh_x_out[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_18_ ( .D(n667), .CK(clk), .RN(n1426), .Q(
        d_ff2_X[18]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_15_ ( .D(n673), .CK(clk), .RN(n1427), .Q(
        d_ff2_X[15]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_11_ ( .D(n681), .CK(clk), .RN(n1428), .Q(
        d_ff2_X[11]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_9_ ( .D(n685), .CK(clk), .RN(n1428), .Q(
        d_ff2_X[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(n918), .CK(clk), .RN(n1452), .Q(d_ff_Zn[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(n919), .CK(clk), .RN(n1452), .Q(d_ff_Zn[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(n926), .CK(clk), .RN(n1453), .Q(d_ff_Zn[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(n927), .CK(clk), .RN(n1453), .Q(d_ff_Zn[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(n928), .CK(clk), .RN(n1453), .Q(d_ff_Zn[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(n930), .CK(clk), .RN(n1454), .Q(d_ff_Zn[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(n941), .CK(clk), .RN(n1455), .Q(d_ff_Zn[8])
         );
  DFFRX1TS reg_LUT_Q_reg_23_ ( .D(n805), .CK(clk), .RN(n1441), .Q(
        d_ff3_LUT_out[23]) );
  DFFRX1TS reg_LUT_Q_reg_26_ ( .D(n802), .CK(clk), .RN(n1441), .Q(
        d_ff3_LUT_out[26]) );
  DFFRX1TS reg_shift_y_Q_reg_27_ ( .D(n709), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_y_out[27]) );
  DFFRX1TS d_ff4_Xn_Q_reg_31_ ( .D(n854), .CK(clk), .RN(n1443), .Q(d_ff_Xn[31]) );
  DFFRX1TS d_ff4_Xn_Q_reg_30_ ( .D(n855), .CK(clk), .RN(n1443), .Q(d_ff_Xn[30]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_21_ ( .D(n661), .CK(clk), .RN(n1426), .Q(
        d_ff2_X[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(n929), .CK(clk), .RN(n1453), .Q(d_ff_Zn[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(n853), .CK(clk), .RN(n1449), .Q(
        data_output[0]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(n708), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_y_out[28]) );
  DFFRX1TS reg_Z0_Q_reg_4_ ( .D(n977), .CK(clk), .RN(n1457), .Q(d_ff1_Z[4]) );
  DFFRX1TS reg_Z0_Q_reg_3_ ( .D(n978), .CK(clk), .RN(n1457), .Q(d_ff1_Z[3]) );
  DFFRX1TS reg_Z0_Q_reg_2_ ( .D(n979), .CK(clk), .RN(n1457), .Q(d_ff1_Z[2]) );
  DFFRX1TS reg_Z0_Q_reg_1_ ( .D(n980), .CK(clk), .RN(n1458), .Q(d_ff1_Z[1]) );
  DFFRX1TS reg_Z0_Q_reg_0_ ( .D(n981), .CK(clk), .RN(n1458), .Q(d_ff1_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(n942), .CK(clk), .RN(n1455), .Q(d_ff_Zn[7])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(n943), .CK(clk), .RN(n1455), .Q(d_ff_Zn[6])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(n944), .CK(clk), .RN(n1455), .Q(d_ff_Zn[5])
         );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(n950), .CK(clk), .RN(n1456), .Q(d_ff1_Z[31])
         );
  DFFRX1TS reg_Z0_Q_reg_30_ ( .D(n951), .CK(clk), .RN(n1456), .Q(d_ff1_Z[30])
         );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(n952), .CK(clk), .RN(n1456), .Q(d_ff1_Z[29])
         );
  DFFRX1TS reg_Z0_Q_reg_28_ ( .D(n953), .CK(clk), .RN(n1456), .Q(d_ff1_Z[28])
         );
  DFFRX1TS reg_Z0_Q_reg_26_ ( .D(n955), .CK(clk), .RN(n1456), .Q(d_ff1_Z[26])
         );
  DFFRX1TS reg_shift_x_Q_reg_23_ ( .D(n649), .CK(clk), .RN(n1440), .Q(
        d_ff3_sh_x_out[23]) );
  DFFRX1TS reg_shift_y_Q_reg_23_ ( .D(n713), .CK(clk), .RN(n1441), .Q(
        d_ff3_sh_y_out[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_0_ ( .D(n800), .CK(clk), .RN(n1439), .Q(
        d_ff2_Z[0]) );
  DFFRX1TS d_ff4_Xn_Q_reg_9_ ( .D(n876), .CK(clk), .RN(n1447), .Q(d_ff_Xn[9])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_8_ ( .D(n877), .CK(clk), .RN(n1447), .Q(d_ff_Xn[8])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_7_ ( .D(n878), .CK(clk), .RN(n1448), .Q(d_ff_Xn[7])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_6_ ( .D(n879), .CK(clk), .RN(n1448), .Q(d_ff_Xn[6])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_5_ ( .D(n880), .CK(clk), .RN(n1448), .Q(d_ff_Xn[5])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_4_ ( .D(n881), .CK(clk), .RN(n1448), .Q(d_ff_Xn[4])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_3_ ( .D(n882), .CK(clk), .RN(n1448), .Q(d_ff_Xn[3])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_2_ ( .D(n883), .CK(clk), .RN(n1449), .Q(d_ff_Xn[2])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_1_ ( .D(n884), .CK(clk), .RN(n1449), .Q(d_ff_Xn[1])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_0_ ( .D(n885), .CK(clk), .RN(n1449), .Q(d_ff_Xn[0])
         );
  ADDFX1TS intadd_515_U4 ( .A(d_ff2_Y[24]), .B(n1414), .CI(intadd_515_CI), 
        .CO(intadd_515_n3), .S(intadd_515_SUM_0_) );
  ADDFX1TS intadd_515_U3 ( .A(d_ff2_Y[25]), .B(n1413), .CI(intadd_515_n3), 
        .CO(intadd_515_n2), .S(intadd_515_SUM_1_) );
  ADDFX1TS intadd_515_U2 ( .A(d_ff2_Y[26]), .B(n1408), .CI(intadd_515_n2), 
        .CO(intadd_515_n1), .S(intadd_515_SUM_2_) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(n690), .CK(clk), .RN(n1429), .Q(
        d_ff3_sh_x_out[6]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(n954), .CK(clk), .RN(n1456), .Q(d_ff1_Z[27])
         );
  AOI222X1TS U705 ( .A0(n1348), .A1(d_ff2_Z[29]), .B0(n1226), .B1(d_ff1_Z[29]), 
        .C0(d_ff_Zn[29]), .C1(n1225), .Y(n1221) );
  AOI222X1TS U706 ( .A0(n1351), .A1(d_ff2_Z[24]), .B0(n1226), .B1(d_ff1_Z[24]), 
        .C0(d_ff_Zn[24]), .C1(n1225), .Y(n1200) );
  AOI222X1TS U707 ( .A0(n1348), .A1(d_ff2_Z[23]), .B0(n1226), .B1(d_ff1_Z[23]), 
        .C0(d_ff_Zn[23]), .C1(n1225), .Y(n1203) );
  AOI222X1TS U708 ( .A0(n1284), .A1(d_ff2_Y[8]), .B0(n1070), .B1(d_ff2_X[8]), 
        .C0(d_ff2_Z[8]), .C1(n1283), .Y(n1140) );
  AOI222X1TS U709 ( .A0(n1284), .A1(d_ff2_Y[6]), .B0(n1133), .B1(d_ff2_X[6]), 
        .C0(d_ff2_Z[6]), .C1(n1283), .Y(n1146) );
  AOI222X1TS U710 ( .A0(n1097), .A1(d_ff2_Y[9]), .B0(n1070), .B1(d_ff2_X[9]), 
        .C0(d_ff2_Z[9]), .C1(n1142), .Y(n1134) );
  AOI222X1TS U711 ( .A0(n1097), .A1(d_ff2_Y[7]), .B0(n1133), .B1(d_ff2_X[7]), 
        .C0(d_ff2_Z[7]), .C1(n1283), .Y(n1144) );
  AOI222X1TS U712 ( .A0(n1131), .A1(d_ff3_sh_x_out[25]), .B0(n1286), .B1(
        d_ff3_sh_y_out[25]), .C0(d_ff3_LUT_out[25]), .C1(n1283), .Y(n1101) );
  AOI222X1TS U713 ( .A0(n1131), .A1(d_ff3_sh_x_out[24]), .B0(n1286), .B1(
        d_ff3_sh_y_out[24]), .C0(n1145), .C1(d_ff3_LUT_out[24]), .Y(n1104) );
  AOI222X1TS U714 ( .A0(n1131), .A1(d_ff3_sh_x_out[4]), .B0(n1286), .B1(
        d_ff3_sh_y_out[4]), .C0(n1145), .C1(d_ff3_LUT_out[4]), .Y(n1105) );
  AOI222X1TS U715 ( .A0(n1131), .A1(d_ff3_sh_x_out[10]), .B0(n1286), .B1(
        d_ff3_sh_y_out[10]), .C0(n1135), .C1(d_ff3_LUT_out[10]), .Y(n1098) );
  AOI222X1TS U716 ( .A0(n1284), .A1(d_ff2_Y[5]), .B0(n1127), .B1(d_ff2_X[5]), 
        .C0(d_ff2_Z[5]), .C1(n1283), .Y(n1126) );
  AOI222X1TS U717 ( .A0(n1097), .A1(d_ff2_Y[10]), .B0(n1127), .B1(d_ff2_X[10]), 
        .C0(d_ff2_Z[10]), .C1(n1135), .Y(n1128) );
  AOI222X1TS U718 ( .A0(n1097), .A1(d_ff2_Y[11]), .B0(n1127), .B1(d_ff2_X[11]), 
        .C0(d_ff2_Z[11]), .C1(n1145), .Y(n1123) );
  AOI222X1TS U719 ( .A0(n1097), .A1(d_ff2_Y[12]), .B0(n1127), .B1(d_ff2_X[12]), 
        .C0(d_ff2_Z[12]), .C1(n1135), .Y(n1124) );
  AOI222X1TS U720 ( .A0(n1097), .A1(d_ff2_Y[14]), .B0(n1127), .B1(d_ff2_X[14]), 
        .C0(d_ff2_Z[14]), .C1(n1142), .Y(n1122) );
  AOI222X1TS U721 ( .A0(n1110), .A1(d_ff2_Y[15]), .B0(n1127), .B1(d_ff2_X[15]), 
        .C0(d_ff2_Z[15]), .C1(n1135), .Y(n1121) );
  AOI222X1TS U722 ( .A0(n1110), .A1(d_ff2_Y[16]), .B0(n1127), .B1(d_ff2_X[16]), 
        .C0(d_ff2_Z[16]), .C1(n1145), .Y(n1111) );
  AOI222X1TS U723 ( .A0(n1110), .A1(d_ff2_Y[17]), .B0(n1127), .B1(d_ff2_X[17]), 
        .C0(d_ff2_Z[17]), .C1(n1142), .Y(n1118) );
  AOI222X1TS U724 ( .A0(n1136), .A1(d_ff2_Y[18]), .B0(n1127), .B1(d_ff2_X[18]), 
        .C0(d_ff2_Z[18]), .C1(n1135), .Y(n1117) );
  AOI222X1TS U725 ( .A0(n1136), .A1(d_ff2_Y[19]), .B0(n1127), .B1(d_ff2_X[19]), 
        .C0(d_ff2_Z[19]), .C1(n1145), .Y(n1114) );
  AOI222X1TS U726 ( .A0(n1131), .A1(d_ff3_sh_x_out[1]), .B0(n1130), .B1(
        d_ff3_sh_y_out[1]), .C0(n1145), .C1(d_ff3_LUT_out[1]), .Y(n1132) );
  AOI222X1TS U727 ( .A0(n1136), .A1(d_ff3_sh_x_out[0]), .B0(n1130), .B1(
        d_ff3_sh_y_out[0]), .C0(n1142), .C1(d_ff3_LUT_out[0]), .Y(n1129) );
  AOI222X1TS U728 ( .A0(n1110), .A1(d_ff2_Y[13]), .B0(n1130), .B1(d_ff2_X[13]), 
        .C0(d_ff2_Z[13]), .C1(n1145), .Y(n1120) );
  AOI222X1TS U729 ( .A0(n1136), .A1(d_ff2_Y[20]), .B0(n1130), .B1(d_ff2_X[20]), 
        .C0(d_ff2_Z[20]), .C1(n1135), .Y(n1125) );
  AOI222X1TS U730 ( .A0(n1136), .A1(d_ff2_Y[21]), .B0(n1130), .B1(d_ff2_X[21]), 
        .C0(d_ff2_Z[21]), .C1(n1279), .Y(n1113) );
  AOI222X1TS U731 ( .A0(n1136), .A1(d_ff2_Y[22]), .B0(n1130), .B1(d_ff2_X[22]), 
        .C0(d_ff2_Z[22]), .C1(n1279), .Y(n1116) );
  AOI222X1TS U732 ( .A0(n1136), .A1(d_ff2_Y[25]), .B0(n1130), .B1(d_ff2_X[25]), 
        .C0(d_ff2_Z[25]), .C1(n1279), .Y(n1115) );
  AOI222X1TS U733 ( .A0(n1131), .A1(d_ff3_sh_x_out[2]), .B0(n1133), .B1(
        d_ff3_sh_y_out[2]), .C0(n1135), .C1(d_ff3_LUT_out[2]), .Y(n1106) );
  OA21X2TS U734 ( .A0(n1147), .A1(ready_cordic), .B0(n1150), .Y(n1151) );
  INVX2TS U735 ( .A(n1065), .Y(n1424) );
  AO22XLTS U736 ( .A0(n1363), .A1(d_ff_Yn[25]), .B0(d_ff2_Y[25]), .B1(n1365), 
        .Y(n719) );
  AO22XLTS U737 ( .A0(n1350), .A1(d_ff_Yn[1]), .B0(d_ff2_Y[1]), .B1(n1373), 
        .Y(n765) );
  AO22XLTS U738 ( .A0(n1350), .A1(d_ff_Yn[7]), .B0(d_ff2_Y[7]), .B1(n1373), 
        .Y(n753) );
  AO22XLTS U739 ( .A0(n1350), .A1(d_ff_Yn[13]), .B0(d_ff2_Y[13]), .B1(n1373), 
        .Y(n741) );
  AO22XLTS U740 ( .A0(n1350), .A1(d_ff_Yn[14]), .B0(d_ff2_Y[14]), .B1(n1365), 
        .Y(n739) );
  AO22XLTS U741 ( .A0(n1405), .A1(d_ff_Yn[15]), .B0(d_ff2_Y[15]), .B1(n1404), 
        .Y(n737) );
  AO22XLTS U742 ( .A0(n1405), .A1(d_ff_Yn[18]), .B0(d_ff2_Y[18]), .B1(n1365), 
        .Y(n731) );
  AO22XLTS U743 ( .A0(n1405), .A1(d_ff_Yn[19]), .B0(d_ff2_Y[19]), .B1(n1404), 
        .Y(n729) );
  AO22XLTS U744 ( .A0(n1363), .A1(d_ff_Yn[24]), .B0(d_ff2_Y[24]), .B1(n1373), 
        .Y(n720) );
  AO22XLTS U745 ( .A0(n1363), .A1(d_ff_Yn[26]), .B0(d_ff2_Y[26]), .B1(n1404), 
        .Y(n718) );
  AO22XLTS U746 ( .A0(n1363), .A1(d_ff_Yn[30]), .B0(d_ff2_Y[30]), .B1(n1404), 
        .Y(n714) );
  AO22XLTS U747 ( .A0(n1363), .A1(d_ff_Xn[4]), .B0(d_ff2_X[4]), .B1(n1373), 
        .Y(n695) );
  AO22XLTS U748 ( .A0(n1363), .A1(d_ff_Xn[8]), .B0(d_ff2_X[8]), .B1(n1365), 
        .Y(n687) );
  AO22XLTS U749 ( .A0(n1405), .A1(d_ff_Xn[31]), .B0(d_ff2_X[31]), .B1(n1404), 
        .Y(n641) );
  AOI222X1TS U750 ( .A0(n1351), .A1(d_ff2_Z[31]), .B0(n1226), .B1(d_ff1_Z[31]), 
        .C0(d_ff_Zn[31]), .C1(n1368), .Y(n1223) );
  AO22XLTS U751 ( .A0(n1366), .A1(d_ff_Xn[11]), .B0(d_ff2_X[11]), .B1(n1365), 
        .Y(n681) );
  AO22XLTS U752 ( .A0(n1366), .A1(d_ff_Xn[15]), .B0(d_ff2_X[15]), .B1(n1404), 
        .Y(n673) );
  AO22XLTS U753 ( .A0(n1309), .A1(result_add_subt[30]), .B0(n1308), .B1(
        d_ff_Zn[30]), .Y(n919) );
  AOI222X1TS U754 ( .A0(n1136), .A1(d_ff2_Y[31]), .B0(n1130), .B1(d_ff2_X[31]), 
        .C0(d_ff2_Z[31]), .C1(n1279), .Y(n1109) );
  AOI222X1TS U755 ( .A0(n1136), .A1(d_ff2_Y[26]), .B0(n1130), .B1(d_ff2_X[26]), 
        .C0(d_ff2_Z[26]), .C1(n1279), .Y(n1112) );
  INVX3TS U756 ( .A(n1370), .Y(n1235) );
  INVX2TS U757 ( .A(n1372), .Y(n1227) );
  AOI222X1TS U758 ( .A0(n1284), .A1(d_ff2_Y[1]), .B0(n1070), .B1(d_ff2_X[1]), 
        .C0(d_ff2_Z[1]), .C1(n1283), .Y(n1139) );
  INVX2TS U759 ( .A(n1401), .Y(n1390) );
  AOI222X1TS U760 ( .A0(n1136), .A1(d_ff2_Y[0]), .B0(n1070), .B1(d_ff2_X[0]), 
        .C0(d_ff2_Z[0]), .C1(n1142), .Y(n1137) );
  AOI222X1TS U761 ( .A0(n1131), .A1(d_ff3_sh_x_out[8]), .B0(n1286), .B1(
        d_ff3_sh_y_out[8]), .C0(n1142), .C1(d_ff3_LUT_out[8]), .Y(n1103) );
  AOI222X1TS U762 ( .A0(n1284), .A1(d_ff2_Y[2]), .B0(n1070), .B1(d_ff2_X[2]), 
        .C0(d_ff2_Z[2]), .C1(n1283), .Y(n1138) );
  INVX3TS U763 ( .A(n1401), .Y(n1364) );
  INVX2TS U764 ( .A(n1401), .Y(n1399) );
  AOI222X1TS U765 ( .A0(n1284), .A1(d_ff2_Y[4]), .B0(n1070), .B1(d_ff2_X[4]), 
        .C0(d_ff2_Z[4]), .C1(n1283), .Y(n1141) );
  CLKBUFX3TS U766 ( .A(n1349), .Y(n1406) );
  CLKBUFX3TS U767 ( .A(n1349), .Y(n1352) );
  CLKBUFX3TS U768 ( .A(n1349), .Y(n1367) );
  CLKBUFX3TS U769 ( .A(n1349), .Y(n1393) );
  CLKBUFX3TS U770 ( .A(n1349), .Y(n1360) );
  CLKBUFX3TS U771 ( .A(n1313), .Y(n1311) );
  INVX2TS U772 ( .A(n1100), .Y(n1135) );
  INVX1TS U773 ( .A(n1374), .Y(n1388) );
  INVX3TS U774 ( .A(n1100), .Y(n1142) );
  OAI211X2TS U775 ( .A0(n1422), .A1(n1288), .B0(n1256), .C0(n1339), .Y(n1332)
         );
  NAND3BX1TS U776 ( .AN(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(n1072), .Y(n1065) );
  CLKBUFX3TS U777 ( .A(n1322), .Y(n1324) );
  NAND2BX1TS U778 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(n1079), .Y(n1080)
         );
  NOR2X1TS U779 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1158) );
  BUFX3TS U780 ( .A(n1174), .Y(n1254) );
  NOR2X1TS U781 ( .A(n1287), .B(n1263), .Y(n1147) );
  INVX2TS U782 ( .A(n1401), .Y(n1353) );
  AO22XLTS U783 ( .A0(n1318), .A1(result_add_subt[31]), .B0(n1317), .B1(
        d_ff_Yn[31]), .Y(n886) );
  AO22XLTS U784 ( .A0(d_ff2_Y[28]), .A1(n1365), .B0(n1058), .B1(d_ff_Yn[28]), 
        .Y(n716) );
  AO22XLTS U785 ( .A0(d_ff2_X[30]), .A1(n1404), .B0(n1058), .B1(d_ff_Xn[30]), 
        .Y(n650) );
  AO22XLTS U786 ( .A0(n1363), .A1(d_ff_Yn[29]), .B0(d_ff2_Y[29]), .B1(n1373), 
        .Y(n715) );
  AO22XLTS U787 ( .A0(n1363), .A1(d_ff_Yn[27]), .B0(d_ff2_Y[27]), .B1(n1373), 
        .Y(n717) );
  AO22XLTS U788 ( .A0(n1327), .A1(result_add_subt[31]), .B0(n1321), .B1(
        d_ff_Xn[31]), .Y(n854) );
  CLKINVX3TS U789 ( .A(n1166), .Y(n1252) );
  CLKINVX3TS U790 ( .A(n1166), .Y(n1188) );
  CLKINVX3TS U791 ( .A(n1166), .Y(n1178) );
  INVX2TS U792 ( .A(enab_cont_iter), .Y(n1287) );
  OAI21XLTS U793 ( .A0(n1260), .A1(n1258), .B0(n1093), .Y(add_subt_dataB[3])
         );
  OAI21XLTS U794 ( .A0(n1100), .A1(n1461), .B0(n1096), .Y(add_subt_dataB[13])
         );
  OAI21XLTS U795 ( .A0(n1100), .A1(n1258), .B0(n1092), .Y(add_subt_dataB[16])
         );
  OAI21XLTS U796 ( .A0(n1260), .A1(n1412), .B0(n1094), .Y(add_subt_dataB[17])
         );
  AOI222X1TS U797 ( .A0(n1131), .A1(d_ff3_sh_x_out[23]), .B0(n1286), .B1(
        d_ff3_sh_y_out[23]), .C0(n1145), .C1(d_ff3_LUT_out[23]), .Y(n1099) );
  AO22XLTS U798 ( .A0(n1325), .A1(result_add_subt[23]), .B0(n1324), .B1(
        d_ff_Xn[23]), .Y(n862) );
  AO22XLTS U799 ( .A0(n1316), .A1(result_add_subt[29]), .B0(n1317), .B1(
        d_ff_Yn[29]), .Y(n888) );
  AO22XLTS U800 ( .A0(n1316), .A1(result_add_subt[27]), .B0(n1317), .B1(
        d_ff_Yn[27]), .Y(n890) );
  AO22XLTS U801 ( .A0(n1316), .A1(result_add_subt[26]), .B0(n1315), .B1(
        d_ff_Yn[26]), .Y(n891) );
  AO22XLTS U802 ( .A0(n1316), .A1(result_add_subt[25]), .B0(n1314), .B1(
        d_ff_Yn[25]), .Y(n892) );
  AO22XLTS U803 ( .A0(n1316), .A1(result_add_subt[24]), .B0(n1313), .B1(
        d_ff_Yn[24]), .Y(n893) );
  AO22XLTS U804 ( .A0(n1316), .A1(result_add_subt[22]), .B0(n1314), .B1(
        d_ff_Yn[22]), .Y(n895) );
  AO22XLTS U805 ( .A0(n1316), .A1(result_add_subt[21]), .B0(n1314), .B1(
        d_ff_Yn[21]), .Y(n896) );
  AO22XLTS U806 ( .A0(n1316), .A1(result_add_subt[20]), .B0(n1314), .B1(
        d_ff_Yn[20]), .Y(n897) );
  AO22XLTS U807 ( .A0(n1312), .A1(result_add_subt[19]), .B0(n1314), .B1(
        d_ff_Yn[19]), .Y(n898) );
  AO22XLTS U808 ( .A0(n1312), .A1(result_add_subt[18]), .B0(n1314), .B1(
        d_ff_Yn[18]), .Y(n899) );
  AO22XLTS U809 ( .A0(n1312), .A1(result_add_subt[17]), .B0(n1311), .B1(
        d_ff_Yn[17]), .Y(n900) );
  AO22XLTS U810 ( .A0(n1312), .A1(result_add_subt[16]), .B0(n1311), .B1(
        d_ff_Yn[16]), .Y(n901) );
  AO22XLTS U811 ( .A0(n1312), .A1(result_add_subt[15]), .B0(n1311), .B1(
        d_ff_Yn[15]), .Y(n902) );
  AO22XLTS U812 ( .A0(n1312), .A1(result_add_subt[14]), .B0(n1311), .B1(
        d_ff_Yn[14]), .Y(n903) );
  AO22XLTS U813 ( .A0(n1312), .A1(result_add_subt[13]), .B0(n1311), .B1(
        d_ff_Yn[13]), .Y(n904) );
  AO22XLTS U814 ( .A0(n1312), .A1(result_add_subt[12]), .B0(n1311), .B1(
        d_ff_Yn[12]), .Y(n905) );
  AO22XLTS U815 ( .A0(n1312), .A1(result_add_subt[11]), .B0(n1311), .B1(
        d_ff_Yn[11]), .Y(n906) );
  AO22XLTS U816 ( .A0(n1312), .A1(result_add_subt[10]), .B0(n1311), .B1(
        d_ff_Yn[10]), .Y(n907) );
  AO22XLTS U817 ( .A0(n1058), .A1(d_ff_Xn[22]), .B0(d_ff2_X[22]), .B1(n1365), 
        .Y(n659) );
  AO22XLTS U818 ( .A0(n1318), .A1(result_add_subt[30]), .B0(n1317), .B1(
        d_ff_Yn[30]), .Y(n887) );
  AO22XLTS U819 ( .A0(n1310), .A1(result_add_subt[9]), .B0(n1311), .B1(
        d_ff_Yn[9]), .Y(n908) );
  AO22XLTS U820 ( .A0(n1310), .A1(result_add_subt[8]), .B0(n1311), .B1(
        d_ff_Yn[8]), .Y(n909) );
  AO22XLTS U821 ( .A0(n1310), .A1(result_add_subt[7]), .B0(n1315), .B1(
        d_ff_Yn[7]), .Y(n910) );
  AO22XLTS U822 ( .A0(n1310), .A1(result_add_subt[6]), .B0(n1315), .B1(
        d_ff_Yn[6]), .Y(n911) );
  AO22XLTS U823 ( .A0(n1310), .A1(result_add_subt[5]), .B0(n1315), .B1(
        d_ff_Yn[5]), .Y(n912) );
  AO22XLTS U824 ( .A0(n1310), .A1(result_add_subt[4]), .B0(n1315), .B1(
        d_ff_Yn[4]), .Y(n913) );
  AO22XLTS U825 ( .A0(n1310), .A1(result_add_subt[3]), .B0(n1315), .B1(
        d_ff_Yn[3]), .Y(n914) );
  AO22XLTS U826 ( .A0(n1310), .A1(result_add_subt[2]), .B0(n1315), .B1(
        d_ff_Yn[2]), .Y(n915) );
  AO22XLTS U827 ( .A0(n1310), .A1(result_add_subt[1]), .B0(n1315), .B1(
        d_ff_Yn[1]), .Y(n916) );
  AO22XLTS U828 ( .A0(n1310), .A1(result_add_subt[0]), .B0(n1317), .B1(
        d_ff_Yn[0]), .Y(n917) );
  AO22XLTS U829 ( .A0(n1316), .A1(result_add_subt[23]), .B0(n1314), .B1(
        d_ff_Yn[23]), .Y(n894) );
  AO22XLTS U830 ( .A0(n1316), .A1(result_add_subt[28]), .B0(n1317), .B1(
        d_ff_Yn[28]), .Y(n889) );
  AO22XLTS U831 ( .A0(n1363), .A1(d_ff_Xn[0]), .B0(d_ff2_X[0]), .B1(n1227), 
        .Y(n703) );
  AO22XLTS U832 ( .A0(n1323), .A1(result_add_subt[11]), .B0(n1321), .B1(
        d_ff_Xn[11]), .Y(n874) );
  AO22XLTS U833 ( .A0(n1323), .A1(result_add_subt[15]), .B0(n1321), .B1(
        d_ff_Xn[15]), .Y(n870) );
  AO22XLTS U834 ( .A0(n1323), .A1(result_add_subt[18]), .B0(n1324), .B1(
        d_ff_Xn[18]), .Y(n867) );
  AO22XLTS U835 ( .A0(n1325), .A1(result_add_subt[21]), .B0(n1324), .B1(
        d_ff_Xn[21]), .Y(n864) );
  AO22XLTS U836 ( .A0(n1325), .A1(result_add_subt[22]), .B0(n1324), .B1(
        d_ff_Xn[22]), .Y(n863) );
  AO22XLTS U837 ( .A0(n1058), .A1(d_ff_Yn[0]), .B0(d_ff2_Y[0]), .B1(n1227), 
        .Y(n767) );
  AO22XLTS U838 ( .A0(n1058), .A1(d_ff_Yn[2]), .B0(d_ff2_Y[2]), .B1(n1365), 
        .Y(n763) );
  AO22XLTS U839 ( .A0(n1058), .A1(d_ff_Yn[3]), .B0(d_ff2_Y[3]), .B1(n1404), 
        .Y(n761) );
  AO22XLTS U840 ( .A0(n1058), .A1(d_ff_Yn[4]), .B0(d_ff2_Y[4]), .B1(n1351), 
        .Y(n759) );
  AO22XLTS U841 ( .A0(n1350), .A1(d_ff_Yn[5]), .B0(d_ff2_Y[5]), .B1(n1348), 
        .Y(n757) );
  AO22XLTS U842 ( .A0(n1350), .A1(d_ff_Yn[6]), .B0(d_ff2_Y[6]), .B1(n1227), 
        .Y(n755) );
  AO22XLTS U843 ( .A0(n1350), .A1(d_ff_Yn[8]), .B0(d_ff2_Y[8]), .B1(n1348), 
        .Y(n751) );
  AO22XLTS U844 ( .A0(n1350), .A1(d_ff_Yn[9]), .B0(d_ff2_Y[9]), .B1(n1227), 
        .Y(n749) );
  AO22XLTS U845 ( .A0(n1405), .A1(d_ff_Yn[10]), .B0(d_ff2_Y[10]), .B1(n1351), 
        .Y(n747) );
  AO22XLTS U846 ( .A0(n1350), .A1(d_ff_Yn[11]), .B0(d_ff2_Y[11]), .B1(n1348), 
        .Y(n745) );
  AO22XLTS U847 ( .A0(n1350), .A1(d_ff_Yn[12]), .B0(d_ff2_Y[12]), .B1(n1227), 
        .Y(n743) );
  AO22XLTS U848 ( .A0(n1405), .A1(d_ff_Yn[16]), .B0(d_ff2_Y[16]), .B1(n1351), 
        .Y(n735) );
  AO22XLTS U849 ( .A0(n1405), .A1(d_ff_Yn[17]), .B0(d_ff2_Y[17]), .B1(n1348), 
        .Y(n733) );
  AO22XLTS U850 ( .A0(n1405), .A1(d_ff_Yn[20]), .B0(d_ff2_Y[20]), .B1(n1351), 
        .Y(n727) );
  AO22XLTS U851 ( .A0(n1405), .A1(d_ff_Yn[21]), .B0(d_ff2_Y[21]), .B1(n1348), 
        .Y(n725) );
  AO22XLTS U852 ( .A0(n1405), .A1(d_ff_Yn[22]), .B0(d_ff2_Y[22]), .B1(n1227), 
        .Y(n723) );
  AO22XLTS U853 ( .A0(n1363), .A1(d_ff_Yn[31]), .B0(d_ff2_Y[31]), .B1(n1351), 
        .Y(n705) );
  AO22XLTS U854 ( .A0(n1325), .A1(result_add_subt[24]), .B0(n1324), .B1(
        d_ff_Xn[24]), .Y(n861) );
  AO22XLTS U855 ( .A0(n1325), .A1(result_add_subt[27]), .B0(n1324), .B1(
        d_ff_Xn[27]), .Y(n858) );
  AO22XLTS U856 ( .A0(n1325), .A1(result_add_subt[28]), .B0(n1326), .B1(
        d_ff_Xn[28]), .Y(n857) );
  AO22XLTS U857 ( .A0(n1325), .A1(result_add_subt[29]), .B0(n1326), .B1(
        d_ff_Xn[29]), .Y(n856) );
  AO22XLTS U858 ( .A0(n1323), .A1(result_add_subt[10]), .B0(n1322), .B1(
        d_ff_Xn[10]), .Y(n875) );
  AO22XLTS U859 ( .A0(n1323), .A1(result_add_subt[12]), .B0(n1326), .B1(
        d_ff_Xn[12]), .Y(n873) );
  AO22XLTS U860 ( .A0(n1323), .A1(result_add_subt[13]), .B0(n1320), .B1(
        d_ff_Xn[13]), .Y(n872) );
  AO22XLTS U861 ( .A0(n1323), .A1(result_add_subt[14]), .B0(n1320), .B1(
        d_ff_Xn[14]), .Y(n871) );
  AO22XLTS U862 ( .A0(n1323), .A1(result_add_subt[16]), .B0(n1321), .B1(
        d_ff_Xn[16]), .Y(n869) );
  AO22XLTS U863 ( .A0(n1323), .A1(result_add_subt[17]), .B0(n1321), .B1(
        d_ff_Xn[17]), .Y(n868) );
  AO22XLTS U864 ( .A0(n1323), .A1(result_add_subt[19]), .B0(n1324), .B1(
        d_ff_Xn[19]), .Y(n866) );
  AO22XLTS U865 ( .A0(n1325), .A1(result_add_subt[20]), .B0(n1324), .B1(
        d_ff_Xn[20]), .Y(n865) );
  AO22XLTS U866 ( .A0(n1325), .A1(result_add_subt[25]), .B0(n1324), .B1(
        d_ff_Xn[25]), .Y(n860) );
  AO22XLTS U867 ( .A0(n1325), .A1(result_add_subt[26]), .B0(n1324), .B1(
        d_ff_Xn[26]), .Y(n859) );
  AO22XLTS U868 ( .A0(n1058), .A1(d_ff_Xn[23]), .B0(d_ff2_X[23]), .B1(n1373), 
        .Y(n657) );
  AO21XLTS U869 ( .A0(d_ff3_sh_x_out[24]), .A1(n1382), .B0(n1381), .Y(n648) );
  AO22XLTS U870 ( .A0(n1292), .A1(d_ff1_Z[5]), .B0(n1293), .B1(data_in[5]), 
        .Y(n976) );
  AO22XLTS U871 ( .A0(n1309), .A1(result_add_subt[24]), .B0(n1305), .B1(
        d_ff_Zn[24]), .Y(n925) );
  AO22XLTS U872 ( .A0(n1395), .A1(n1384), .B0(n1393), .B1(d_ff3_sh_x_out[25]), 
        .Y(n647) );
  AO22XLTS U873 ( .A0(n1399), .A1(d_ff2_Y[22]), .B0(n1360), .B1(
        d_ff3_sh_y_out[22]), .Y(n722) );
  AO22XLTS U874 ( .A0(n1407), .A1(d_ff2_X[13]), .B0(n1367), .B1(
        d_ff3_sh_x_out[13]), .Y(n676) );
  AO22XLTS U875 ( .A0(n1353), .A1(d_ff2_Y[6]), .B0(n1382), .B1(
        d_ff3_sh_y_out[6]), .Y(n754) );
  NOR2XLTS U876 ( .A(n1262), .B(n1306), .Y(inst_CORDIC_FSM_v3_state_next[6])
         );
  AO22XLTS U877 ( .A0(n1319), .A1(result_add_subt[0]), .B0(n1326), .B1(
        d_ff_Xn[0]), .Y(n885) );
  AO22XLTS U878 ( .A0(n1319), .A1(result_add_subt[1]), .B0(n1320), .B1(
        d_ff_Xn[1]), .Y(n884) );
  AO22XLTS U879 ( .A0(n1319), .A1(result_add_subt[2]), .B0(n1320), .B1(
        d_ff_Xn[2]), .Y(n883) );
  AO22XLTS U880 ( .A0(n1319), .A1(result_add_subt[3]), .B0(n1320), .B1(
        d_ff_Xn[3]), .Y(n882) );
  AO22XLTS U881 ( .A0(n1319), .A1(result_add_subt[4]), .B0(n1320), .B1(
        d_ff_Xn[4]), .Y(n881) );
  AO22XLTS U882 ( .A0(n1319), .A1(result_add_subt[5]), .B0(n1320), .B1(
        d_ff_Xn[5]), .Y(n880) );
  AO22XLTS U883 ( .A0(n1319), .A1(result_add_subt[6]), .B0(n1320), .B1(
        d_ff_Xn[6]), .Y(n879) );
  AO22XLTS U884 ( .A0(n1319), .A1(result_add_subt[7]), .B0(n1320), .B1(
        d_ff_Xn[7]), .Y(n878) );
  AO22XLTS U885 ( .A0(n1319), .A1(result_add_subt[8]), .B0(n1321), .B1(
        d_ff_Xn[8]), .Y(n877) );
  AO22XLTS U886 ( .A0(n1319), .A1(result_add_subt[9]), .B0(n1321), .B1(
        d_ff_Xn[9]), .Y(n876) );
  OAI21XLTS U887 ( .A0(n1340), .A1(intadd_515_CI), .B0(n1107), .Y(n713) );
  AO22XLTS U888 ( .A0(n1300), .A1(d_ff1_Z[26]), .B0(n1298), .B1(data_in[26]), 
        .Y(n955) );
  AO22XLTS U889 ( .A0(n1300), .A1(d_ff1_Z[27]), .B0(n1297), .B1(data_in[27]), 
        .Y(n954) );
  AO22XLTS U890 ( .A0(n1300), .A1(d_ff1_Z[28]), .B0(n1298), .B1(data_in[28]), 
        .Y(n953) );
  AO22XLTS U891 ( .A0(n1300), .A1(d_ff1_Z[29]), .B0(n1298), .B1(data_in[29]), 
        .Y(n952) );
  AO22XLTS U892 ( .A0(n1300), .A1(d_ff1_Z[30]), .B0(n1298), .B1(data_in[30]), 
        .Y(n951) );
  AO22XLTS U893 ( .A0(n1300), .A1(d_ff1_Z[31]), .B0(n1299), .B1(data_in[31]), 
        .Y(n950) );
  AO22XLTS U894 ( .A0(n1301), .A1(result_add_subt[5]), .B0(n1306), .B1(
        d_ff_Zn[5]), .Y(n944) );
  AO22XLTS U895 ( .A0(n1301), .A1(result_add_subt[6]), .B0(n1306), .B1(
        d_ff_Zn[6]), .Y(n943) );
  AO22XLTS U896 ( .A0(n1301), .A1(result_add_subt[7]), .B0(n1302), .B1(
        d_ff_Zn[7]), .Y(n942) );
  AO22XLTS U897 ( .A0(n1292), .A1(d_ff1_Z[0]), .B0(n1297), .B1(data_in[0]), 
        .Y(n981) );
  AO22XLTS U898 ( .A0(n1292), .A1(d_ff1_Z[1]), .B0(n1297), .B1(data_in[1]), 
        .Y(n980) );
  AO22XLTS U899 ( .A0(n1292), .A1(d_ff1_Z[2]), .B0(n1297), .B1(data_in[2]), 
        .Y(n979) );
  AO22XLTS U900 ( .A0(n1292), .A1(d_ff1_Z[3]), .B0(n1297), .B1(data_in[3]), 
        .Y(n978) );
  AO22XLTS U901 ( .A0(n1292), .A1(d_ff1_Z[4]), .B0(n1297), .B1(data_in[4]), 
        .Y(n977) );
  AO22XLTS U902 ( .A0(n1395), .A1(n1356), .B0(n1360), .B1(d_ff3_sh_y_out[28]), 
        .Y(n708) );
  AO22XLTS U903 ( .A0(n1309), .A1(result_add_subt[20]), .B0(n1304), .B1(
        d_ff_Zn[20]), .Y(n929) );
  AO22XLTS U904 ( .A0(n1368), .A1(d_ff_Xn[21]), .B0(d_ff2_X[21]), .B1(n1227), 
        .Y(n661) );
  AO22XLTS U905 ( .A0(n1327), .A1(result_add_subt[30]), .B0(n1321), .B1(
        d_ff_Xn[30]), .Y(n855) );
  AOI2BB2XLTS U906 ( .B0(n1399), .B1(n1354), .A0N(d_ff3_sh_y_out[27]), .A1N(
        n1390), .Y(n709) );
  OAI21XLTS U907 ( .A0(cont_iter_out[3]), .A1(n1379), .B0(n1108), .Y(n802) );
  AO22XLTS U908 ( .A0(n1309), .A1(result_add_subt[8]), .B0(n1302), .B1(
        d_ff_Zn[8]), .Y(n941) );
  AO22XLTS U909 ( .A0(n1309), .A1(result_add_subt[19]), .B0(n1308), .B1(
        d_ff_Zn[19]), .Y(n930) );
  AO22XLTS U910 ( .A0(n1309), .A1(result_add_subt[21]), .B0(n1305), .B1(
        d_ff_Zn[21]), .Y(n928) );
  AO22XLTS U911 ( .A0(n1309), .A1(result_add_subt[22]), .B0(n1305), .B1(
        d_ff_Zn[22]), .Y(n927) );
  AO22XLTS U912 ( .A0(n1309), .A1(result_add_subt[23]), .B0(n1305), .B1(
        d_ff_Zn[23]), .Y(n926) );
  AO22XLTS U913 ( .A0(n1309), .A1(result_add_subt[31]), .B0(n1308), .B1(
        d_ff_Zn[31]), .Y(n918) );
  AO22XLTS U914 ( .A0(n1366), .A1(d_ff_Xn[9]), .B0(d_ff2_X[9]), .B1(n1348), 
        .Y(n685) );
  AO22XLTS U915 ( .A0(n1366), .A1(d_ff_Xn[18]), .B0(d_ff2_X[18]), .B1(n1351), 
        .Y(n667) );
  AO22XLTS U916 ( .A0(n1395), .A1(n1386), .B0(n1393), .B1(d_ff3_sh_x_out[26]), 
        .Y(n646) );
  AO22XLTS U917 ( .A0(n1407), .A1(d_ff2_X[17]), .B0(n1393), .B1(
        d_ff3_sh_x_out[17]), .Y(n668) );
  AO22XLTS U918 ( .A0(n1403), .A1(d_ff2_X[19]), .B0(n1393), .B1(
        d_ff3_sh_x_out[19]), .Y(n664) );
  AO22XLTS U919 ( .A0(n1403), .A1(d_ff2_X[20]), .B0(n1393), .B1(
        d_ff3_sh_x_out[20]), .Y(n662) );
  AO22XLTS U920 ( .A0(n1403), .A1(d_ff2_X[21]), .B0(n1393), .B1(
        d_ff3_sh_x_out[21]), .Y(n660) );
  AO22XLTS U921 ( .A0(n1395), .A1(d_ff2_X[22]), .B0(n1393), .B1(
        d_ff3_sh_x_out[22]), .Y(n658) );
  AO22XLTS U922 ( .A0(n1364), .A1(d_ff2_Y[8]), .B0(n1352), .B1(
        d_ff3_sh_y_out[8]), .Y(n750) );
  AO22XLTS U923 ( .A0(n1362), .A1(d_ff2_Y[9]), .B0(n1352), .B1(
        d_ff3_sh_y_out[9]), .Y(n748) );
  AO22XLTS U924 ( .A0(n1364), .A1(d_ff2_Y[10]), .B0(n1352), .B1(
        d_ff3_sh_y_out[10]), .Y(n746) );
  AO22XLTS U925 ( .A0(n1407), .A1(d_ff2_Y[11]), .B0(n1352), .B1(
        d_ff3_sh_y_out[11]), .Y(n744) );
  AO22XLTS U926 ( .A0(n1353), .A1(d_ff2_Y[12]), .B0(n1352), .B1(
        d_ff3_sh_y_out[12]), .Y(n742) );
  AO22XLTS U927 ( .A0(n1395), .A1(d_ff2_Y[13]), .B0(n1352), .B1(
        d_ff3_sh_y_out[13]), .Y(n740) );
  AO22XLTS U928 ( .A0(n1390), .A1(d_ff2_Y[14]), .B0(n1352), .B1(
        d_ff3_sh_y_out[14]), .Y(n738) );
  AO22XLTS U929 ( .A0(n1390), .A1(d_ff2_Y[15]), .B0(n1352), .B1(
        d_ff3_sh_y_out[15]), .Y(n736) );
  AO22XLTS U930 ( .A0(n1362), .A1(d_ff2_Y[16]), .B0(n1352), .B1(
        d_ff3_sh_y_out[16]), .Y(n734) );
  AO22XLTS U931 ( .A0(n1390), .A1(d_ff2_Y[17]), .B0(n1352), .B1(
        d_ff3_sh_y_out[17]), .Y(n732) );
  AO22XLTS U932 ( .A0(n1395), .A1(d_ff2_Y[18]), .B0(n1360), .B1(
        d_ff3_sh_y_out[18]), .Y(n730) );
  AO22XLTS U933 ( .A0(n1362), .A1(d_ff2_Y[19]), .B0(n1360), .B1(
        d_ff3_sh_y_out[19]), .Y(n728) );
  AO22XLTS U934 ( .A0(n1399), .A1(d_ff2_Y[20]), .B0(n1360), .B1(
        d_ff3_sh_y_out[20]), .Y(n726) );
  AO22XLTS U935 ( .A0(n1362), .A1(d_ff2_Y[21]), .B0(n1360), .B1(
        d_ff3_sh_y_out[21]), .Y(n724) );
  AO22XLTS U936 ( .A0(n1407), .A1(d_ff2_Y[31]), .B0(n1406), .B1(
        d_ff3_sh_y_out[31]), .Y(n704) );
  AO22XLTS U937 ( .A0(n1403), .A1(d_ff2_X[0]), .B0(n1406), .B1(
        d_ff3_sh_x_out[0]), .Y(n702) );
  AO22XLTS U938 ( .A0(n1407), .A1(d_ff2_X[1]), .B0(n1406), .B1(
        d_ff3_sh_x_out[1]), .Y(n700) );
  AO22XLTS U939 ( .A0(n1407), .A1(d_ff2_X[2]), .B0(n1406), .B1(
        d_ff3_sh_x_out[2]), .Y(n698) );
  AO22XLTS U940 ( .A0(n1407), .A1(d_ff2_X[3]), .B0(n1406), .B1(
        d_ff3_sh_x_out[3]), .Y(n696) );
  AO22XLTS U941 ( .A0(n1403), .A1(d_ff2_X[4]), .B0(n1406), .B1(
        d_ff3_sh_x_out[4]), .Y(n694) );
  AO22XLTS U942 ( .A0(n1362), .A1(d_ff2_X[5]), .B0(n1406), .B1(
        d_ff3_sh_x_out[5]), .Y(n692) );
  AO22XLTS U943 ( .A0(n1353), .A1(d_ff2_X[6]), .B0(n1406), .B1(
        d_ff3_sh_x_out[6]), .Y(n690) );
  AO22XLTS U944 ( .A0(n1364), .A1(d_ff2_X[7]), .B0(n1367), .B1(
        d_ff3_sh_x_out[7]), .Y(n688) );
  AO22XLTS U945 ( .A0(n1399), .A1(d_ff2_X[8]), .B0(n1406), .B1(
        d_ff3_sh_x_out[8]), .Y(n686) );
  AO22XLTS U946 ( .A0(n1353), .A1(d_ff2_X[9]), .B0(n1367), .B1(
        d_ff3_sh_x_out[9]), .Y(n684) );
  AO22XLTS U947 ( .A0(n1390), .A1(d_ff2_X[10]), .B0(n1367), .B1(
        d_ff3_sh_x_out[10]), .Y(n682) );
  AO22XLTS U948 ( .A0(n1390), .A1(d_ff2_X[11]), .B0(n1367), .B1(
        d_ff3_sh_x_out[11]), .Y(n680) );
  AO22XLTS U949 ( .A0(n1407), .A1(d_ff2_X[12]), .B0(n1367), .B1(
        d_ff3_sh_x_out[12]), .Y(n678) );
  AO22XLTS U950 ( .A0(n1399), .A1(d_ff2_X[14]), .B0(n1367), .B1(
        d_ff3_sh_x_out[14]), .Y(n674) );
  AO22XLTS U951 ( .A0(n1403), .A1(d_ff2_X[15]), .B0(n1367), .B1(
        d_ff3_sh_x_out[15]), .Y(n672) );
  AO22XLTS U952 ( .A0(n1403), .A1(d_ff2_X[16]), .B0(n1367), .B1(
        d_ff3_sh_x_out[16]), .Y(n670) );
  AO22XLTS U953 ( .A0(n1403), .A1(d_ff2_X[18]), .B0(n1367), .B1(
        d_ff3_sh_x_out[18]), .Y(n666) );
  AO22XLTS U954 ( .A0(n1407), .A1(d_ff2_X[31]), .B0(n1406), .B1(
        d_ff3_sh_x_out[31]), .Y(n640) );
  AO22XLTS U955 ( .A0(n1399), .A1(intadd_515_SUM_0_), .B0(n1360), .B1(
        d_ff3_sh_y_out[24]), .Y(n712) );
  AO22XLTS U956 ( .A0(n1353), .A1(intadd_515_SUM_1_), .B0(n1360), .B1(
        d_ff3_sh_y_out[25]), .Y(n711) );
  AO22XLTS U957 ( .A0(n1362), .A1(intadd_515_SUM_2_), .B0(n1360), .B1(
        d_ff3_sh_y_out[26]), .Y(n710) );
  AO22XLTS U958 ( .A0(n1362), .A1(d_ff2_Y[0]), .B0(n1382), .B1(
        d_ff3_sh_y_out[0]), .Y(n766) );
  AO22XLTS U959 ( .A0(n1395), .A1(d_ff2_Y[1]), .B0(n1382), .B1(
        d_ff3_sh_y_out[1]), .Y(n764) );
  AO22XLTS U960 ( .A0(n1362), .A1(d_ff2_Y[2]), .B0(n1382), .B1(
        d_ff3_sh_y_out[2]), .Y(n762) );
  AO22XLTS U961 ( .A0(n1362), .A1(d_ff2_Y[3]), .B0(n1382), .B1(
        d_ff3_sh_y_out[3]), .Y(n760) );
  AO22XLTS U962 ( .A0(n1395), .A1(d_ff2_Y[4]), .B0(n1382), .B1(
        d_ff3_sh_y_out[4]), .Y(n758) );
  AO22XLTS U963 ( .A0(n1362), .A1(d_ff2_Y[5]), .B0(n1382), .B1(
        d_ff3_sh_y_out[5]), .Y(n756) );
  AO22XLTS U964 ( .A0(n1395), .A1(d_ff2_Y[7]), .B0(n1382), .B1(
        d_ff3_sh_y_out[7]), .Y(n752) );
  AO22XLTS U965 ( .A0(n1364), .A1(n1341), .B0(n1382), .B1(d_ff3_LUT_out[19]), 
        .Y(n807) );
  NAND2BXLTS U966 ( .AN(d_ff3_LUT_out[27]), .B(n1397), .Y(n801) );
  AO22XLTS U967 ( .A0(n1403), .A1(n1413), .B0(n1401), .B1(d_ff3_LUT_out[8]), 
        .Y(n813) );
  OAI21XLTS U968 ( .A0(beg_fsm_cordic), .A1(n1259), .B0(n1162), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  AOI2BB2XLTS U969 ( .B0(n1422), .B1(n1289), .A0N(n1289), .A1N(n1422), .Y(n987) );
  AO21XLTS U970 ( .A0(enab_cont_iter), .A1(n1263), .B0(n1159), .Y(
        inst_CORDIC_FSM_v3_state_next[2]) );
  AO22XLTS U971 ( .A0(d_ff2_Y[23]), .A1(n1227), .B0(n1058), .B1(d_ff_Yn[23]), 
        .Y(n721) );
  AO22XLTS U972 ( .A0(n1349), .A1(d_ff3_sign_out), .B0(n1353), .B1(d_ff2_Z[31]), .Y(n768) );
  OAI21XLTS U973 ( .A0(n1155), .A1(n1166), .B0(n1154), .Y(n822) );
  AOI2BB2XLTS U974 ( .B0(n1291), .B1(n1409), .A0N(n1409), .A1N(n1291), .Y(n985) );
  AO22XLTS U975 ( .A0(n1292), .A1(d_ff1_operation_out), .B0(n1299), .B1(
        operation), .Y(n984) );
  AO22XLTS U976 ( .A0(n1292), .A1(d_ff1_shift_region_flag_out[1]), .B0(n1297), 
        .B1(shift_region_flag[1]), .Y(n982) );
  OAI211XLTS U977 ( .A0(n1364), .A1(n1412), .B0(n1328), .C0(n1342), .Y(n808)
         );
  OAI211XLTS U978 ( .A0(n1291), .A1(n1087), .B0(n1082), .C0(n1073), .Y(n990)
         );
  AO22XLTS U979 ( .A0(n1292), .A1(d_ff1_shift_region_flag_out[0]), .B0(n1297), 
        .B1(shift_region_flag[0]), .Y(n983) );
  AO22XLTS U980 ( .A0(n1403), .A1(n1402), .B0(n1401), .B1(d_ff3_sh_x_out[30]), 
        .Y(n642) );
  AO22XLTS U981 ( .A0(n1395), .A1(n1394), .B0(n1393), .B1(d_ff3_sh_x_out[28]), 
        .Y(n644) );
  OAI21XLTS U982 ( .A0(n1392), .A1(n1420), .B0(n1396), .Y(n1394) );
  AOI2BB2XLTS U983 ( .B0(n1390), .B1(n1389), .A0N(d_ff3_sh_x_out[27]), .A1N(
        n1388), .Y(n645) );
  AO22XLTS U984 ( .A0(n1407), .A1(n1361), .B0(n1360), .B1(d_ff3_sh_y_out[30]), 
        .Y(n706) );
  AOI2BB2XLTS U985 ( .B0(n1353), .B1(n1358), .A0N(d_ff3_sh_y_out[29]), .A1N(
        n1353), .Y(n707) );
  NOR2XLTS U986 ( .A(n1423), .B(n1380), .Y(n1344) );
  OAI21XLTS U987 ( .A0(n1375), .A1(n1342), .B0(n1238), .Y(n804) );
  NAND2BXLTS U988 ( .AN(n1337), .B(n1336), .Y(n811) );
  OAI211XLTS U989 ( .A0(n1364), .A1(n1060), .B0(n1257), .C0(n1338), .Y(n812)
         );
  OAI21XLTS U990 ( .A0(n1422), .A1(n1380), .B0(n1240), .Y(n817) );
  OAI211XLTS U991 ( .A0(n1399), .A1(n1258), .B0(n1328), .C0(n1257), .Y(n818)
         );
  OAI21XLTS U992 ( .A0(n1379), .A1(n1256), .B0(n1164), .Y(n819) );
  AO22XLTS U993 ( .A0(n1307), .A1(result_add_subt[29]), .B0(n1308), .B1(
        d_ff_Zn[29]), .Y(n920) );
  AO22XLTS U994 ( .A0(n1307), .A1(result_add_subt[28]), .B0(n1308), .B1(
        d_ff_Zn[28]), .Y(n921) );
  AO22XLTS U995 ( .A0(n1307), .A1(result_add_subt[27]), .B0(n1308), .B1(
        d_ff_Zn[27]), .Y(n922) );
  AO22XLTS U996 ( .A0(n1307), .A1(result_add_subt[26]), .B0(n1308), .B1(
        d_ff_Zn[26]), .Y(n923) );
  AO22XLTS U997 ( .A0(n1307), .A1(result_add_subt[25]), .B0(n1306), .B1(
        d_ff_Zn[25]), .Y(n924) );
  AO22XLTS U998 ( .A0(n1303), .A1(result_add_subt[18]), .B0(n1305), .B1(
        d_ff_Zn[18]), .Y(n931) );
  AO22XLTS U999 ( .A0(n1303), .A1(result_add_subt[17]), .B0(n1305), .B1(
        d_ff_Zn[17]), .Y(n932) );
  AO22XLTS U1000 ( .A0(n1303), .A1(result_add_subt[16]), .B0(n1302), .B1(
        d_ff_Zn[16]), .Y(n933) );
  AO22XLTS U1001 ( .A0(n1303), .A1(result_add_subt[15]), .B0(n1302), .B1(
        d_ff_Zn[15]), .Y(n934) );
  AO22XLTS U1002 ( .A0(n1303), .A1(result_add_subt[14]), .B0(n1302), .B1(
        d_ff_Zn[14]), .Y(n935) );
  AO22XLTS U1003 ( .A0(n1307), .A1(result_add_subt[13]), .B0(n1302), .B1(
        d_ff_Zn[13]), .Y(n936) );
  AO22XLTS U1004 ( .A0(n1307), .A1(result_add_subt[12]), .B0(n1302), .B1(
        d_ff_Zn[12]), .Y(n937) );
  AO22XLTS U1005 ( .A0(n1307), .A1(result_add_subt[11]), .B0(n1302), .B1(
        d_ff_Zn[11]), .Y(n938) );
  AO22XLTS U1006 ( .A0(n1307), .A1(result_add_subt[10]), .B0(n1302), .B1(
        d_ff_Zn[10]), .Y(n939) );
  AO22XLTS U1007 ( .A0(n1307), .A1(result_add_subt[9]), .B0(n1302), .B1(
        d_ff_Zn[9]), .Y(n940) );
  AO22XLTS U1008 ( .A0(n1303), .A1(result_add_subt[4]), .B0(n1306), .B1(
        d_ff_Zn[4]), .Y(n945) );
  AO22XLTS U1009 ( .A0(n1303), .A1(result_add_subt[3]), .B0(n1306), .B1(
        d_ff_Zn[3]), .Y(n946) );
  AO22XLTS U1010 ( .A0(n1303), .A1(result_add_subt[2]), .B0(n1306), .B1(
        d_ff_Zn[2]), .Y(n947) );
  AO22XLTS U1011 ( .A0(n1303), .A1(result_add_subt[1]), .B0(n1306), .B1(
        d_ff_Zn[1]), .Y(n948) );
  AO22XLTS U1012 ( .A0(n1303), .A1(result_add_subt[0]), .B0(n1304), .B1(
        d_ff_Zn[0]), .Y(n949) );
  AO22XLTS U1013 ( .A0(n1296), .A1(d_ff1_Z[25]), .B0(n1298), .B1(data_in[25]), 
        .Y(n956) );
  AO22XLTS U1014 ( .A0(n1296), .A1(d_ff1_Z[24]), .B0(n1295), .B1(data_in[24]), 
        .Y(n957) );
  AO22XLTS U1015 ( .A0(n1296), .A1(d_ff1_Z[23]), .B0(n1295), .B1(data_in[23]), 
        .Y(n958) );
  AO22XLTS U1016 ( .A0(n1296), .A1(d_ff1_Z[22]), .B0(n1295), .B1(data_in[22]), 
        .Y(n959) );
  AO22XLTS U1017 ( .A0(n1296), .A1(d_ff1_Z[21]), .B0(n1295), .B1(data_in[21]), 
        .Y(n960) );
  AO22XLTS U1018 ( .A0(n1296), .A1(d_ff1_Z[20]), .B0(n1295), .B1(data_in[20]), 
        .Y(n961) );
  AO22XLTS U1019 ( .A0(n1296), .A1(d_ff1_Z[19]), .B0(n1295), .B1(data_in[19]), 
        .Y(n962) );
  AO22XLTS U1020 ( .A0(n1296), .A1(d_ff1_Z[18]), .B0(n1295), .B1(data_in[18]), 
        .Y(n963) );
  AO22XLTS U1021 ( .A0(n1296), .A1(d_ff1_Z[17]), .B0(n1295), .B1(data_in[17]), 
        .Y(n964) );
  AO22XLTS U1022 ( .A0(n1296), .A1(d_ff1_Z[16]), .B0(n1295), .B1(data_in[16]), 
        .Y(n965) );
  AO22XLTS U1023 ( .A0(n1294), .A1(d_ff1_Z[15]), .B0(n1295), .B1(data_in[15]), 
        .Y(n966) );
  AO22XLTS U1024 ( .A0(n1294), .A1(d_ff1_Z[14]), .B0(n1293), .B1(data_in[14]), 
        .Y(n967) );
  AO22XLTS U1025 ( .A0(n1294), .A1(d_ff1_Z[13]), .B0(n1293), .B1(data_in[13]), 
        .Y(n968) );
  AO22XLTS U1026 ( .A0(n1294), .A1(d_ff1_Z[12]), .B0(n1293), .B1(data_in[12]), 
        .Y(n969) );
  AO22XLTS U1027 ( .A0(n1294), .A1(d_ff1_Z[11]), .B0(n1293), .B1(data_in[11]), 
        .Y(n970) );
  AO22XLTS U1028 ( .A0(n1294), .A1(d_ff1_Z[10]), .B0(n1293), .B1(data_in[10]), 
        .Y(n971) );
  AO22XLTS U1029 ( .A0(n1294), .A1(d_ff1_Z[9]), .B0(n1293), .B1(data_in[9]), 
        .Y(n972) );
  AO22XLTS U1030 ( .A0(n1294), .A1(d_ff1_Z[8]), .B0(n1293), .B1(data_in[8]), 
        .Y(n973) );
  AO22XLTS U1031 ( .A0(n1294), .A1(d_ff1_Z[7]), .B0(n1293), .B1(data_in[7]), 
        .Y(n974) );
  AO22XLTS U1032 ( .A0(n1294), .A1(d_ff1_Z[6]), .B0(n1293), .B1(data_in[6]), 
        .Y(n975) );
  CLKBUFX2TS U1033 ( .A(n1366), .Y(n1368) );
  BUFX3TS U1034 ( .A(n1193), .Y(n1371) );
  NAND2X1TS U1035 ( .A(n1194), .B(n1370), .Y(n1193) );
  INVX2TS U1036 ( .A(n1064), .Y(n1375) );
  INVX2TS U1037 ( .A(n1371), .Y(n1058) );
  INVX2TS U1038 ( .A(n1058), .Y(n1059) );
  AOI222X4TS U1039 ( .A0(n1235), .A1(d_ff2_Z[8]), .B0(n1234), .B1(d_ff1_Z[8]), 
        .C0(d_ff_Zn[8]), .C1(n1233), .Y(n1232) );
  AOI222X1TS U1040 ( .A0(n1284), .A1(d_ff2_Y[3]), .B0(n1133), .B1(d_ff2_X[3]), 
        .C0(d_ff2_Z[3]), .C1(n1283), .Y(n1143) );
  NOR4BX2TS U1041 ( .AN(inst_CORDIC_FSM_v3_state_reg[1]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(inst_CORDIC_FSM_v3_state_reg[4]), 
        .D(n1080), .Y(n1159) );
  OAI21XLTS U1042 ( .A0(n1135), .A1(n1261), .B0(n1397), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  CLKBUFX3TS U1043 ( .A(n1075), .Y(n1076) );
  CLKINVX3TS U1044 ( .A(n1100), .Y(n1283) );
  CLKINVX3TS U1045 ( .A(n1100), .Y(n1145) );
  NOR2X2TS U1046 ( .A(cont_iter_out[3]), .B(n1413), .Y(n1345) );
  NOR2X2TS U1047 ( .A(n1408), .B(n1413), .Y(n1191) );
  AOI222X1TS U1048 ( .A0(n1244), .A1(data_output[23]), .B0(n1253), .B1(
        d_ff_Yn[23]), .C0(n1252), .C1(d_ff_Xn[23]), .Y(n1242) );
  AOI222X1TS U1049 ( .A0(n1254), .A1(data_output[29]), .B0(n1253), .B1(
        d_ff_Yn[29]), .C0(n1252), .C1(d_ff_Xn[29]), .Y(n1255) );
  AOI222X1TS U1050 ( .A0(n1254), .A1(data_output[27]), .B0(n1253), .B1(
        d_ff_Yn[27]), .C0(n1252), .C1(d_ff_Xn[27]), .Y(n1249) );
  AOI222X1TS U1051 ( .A0(n1254), .A1(data_output[26]), .B0(n1253), .B1(
        d_ff_Yn[26]), .C0(n1252), .C1(d_ff_Xn[26]), .Y(n1250) );
  AOI222X1TS U1052 ( .A0(n1254), .A1(data_output[25]), .B0(n1253), .B1(
        d_ff_Yn[25]), .C0(n1252), .C1(d_ff_Xn[25]), .Y(n1248) );
  AOI222X1TS U1053 ( .A0(n1254), .A1(data_output[24]), .B0(n1253), .B1(
        d_ff_Yn[24]), .C0(n1252), .C1(d_ff_Xn[24]), .Y(n1247) );
  AOI222X1TS U1054 ( .A0(n1254), .A1(data_output[22]), .B0(n1253), .B1(
        d_ff_Yn[22]), .C0(n1252), .C1(d_ff_Xn[22]), .Y(n1246) );
  AOI222X1TS U1055 ( .A0(n1244), .A1(data_output[21]), .B0(n1243), .B1(
        d_ff_Yn[21]), .C0(n1252), .C1(d_ff_Xn[21]), .Y(n1245) );
  AOI222X1TS U1056 ( .A0(n1244), .A1(data_output[20]), .B0(n1243), .B1(
        d_ff_Yn[20]), .C0(n1188), .C1(d_ff_Xn[20]), .Y(n1165) );
  AOI222X1TS U1057 ( .A0(n1244), .A1(data_output[19]), .B0(n1243), .B1(
        d_ff_Yn[19]), .C0(n1188), .C1(d_ff_Xn[19]), .Y(n1187) );
  AOI222X1TS U1058 ( .A0(n1244), .A1(data_output[18]), .B0(n1243), .B1(
        d_ff_Yn[18]), .C0(n1188), .C1(d_ff_Xn[18]), .Y(n1181) );
  AOI222X1TS U1059 ( .A0(n1244), .A1(data_output[17]), .B0(n1243), .B1(
        d_ff_Yn[17]), .C0(n1188), .C1(d_ff_Xn[17]), .Y(n1186) );
  AOI222X1TS U1060 ( .A0(n1244), .A1(data_output[16]), .B0(n1243), .B1(
        d_ff_Yn[16]), .C0(n1188), .C1(d_ff_Xn[16]), .Y(n1185) );
  AOI222X1TS U1061 ( .A0(n1244), .A1(data_output[15]), .B0(n1243), .B1(
        d_ff_Yn[15]), .C0(n1188), .C1(d_ff_Xn[15]), .Y(n1180) );
  AOI222X1TS U1062 ( .A0(n1244), .A1(data_output[14]), .B0(n1243), .B1(
        d_ff_Yn[14]), .C0(n1188), .C1(d_ff_Xn[14]), .Y(n1183) );
  AOI222X1TS U1063 ( .A0(n1244), .A1(data_output[13]), .B0(n1243), .B1(
        d_ff_Yn[13]), .C0(n1188), .C1(d_ff_Xn[13]), .Y(n1184) );
  AOI222X1TS U1064 ( .A0(n1189), .A1(data_output[12]), .B0(n1243), .B1(
        d_ff_Yn[12]), .C0(n1188), .C1(d_ff_Xn[12]), .Y(n1190) );
  AOI222X1TS U1065 ( .A0(n1189), .A1(data_output[11]), .B0(n1151), .B1(
        d_ff_Yn[11]), .C0(n1188), .C1(d_ff_Xn[11]), .Y(n1182) );
  AOI222X1TS U1066 ( .A0(n1189), .A1(data_output[10]), .B0(n1151), .B1(
        d_ff_Yn[10]), .C0(n1178), .C1(d_ff_Xn[10]), .Y(n1177) );
  OAI31XLTS U1067 ( .A0(cont_iter_out[3]), .A1(n1064), .A2(n1379), .B0(n1068), 
        .Y(n815) );
  CLKBUFX3TS U1068 ( .A(n1077), .Y(n1078) );
  AOI222X4TS U1069 ( .A0(n1235), .A1(d_ff2_Z[5]), .B0(n1234), .B1(d_ff1_Z[5]), 
        .C0(d_ff_Zn[5]), .C1(n1233), .Y(n1213) );
  AOI222X4TS U1070 ( .A0(n1235), .A1(d_ff2_Z[6]), .B0(n1234), .B1(d_ff1_Z[6]), 
        .C0(d_ff_Zn[6]), .C1(n1233), .Y(n1212) );
  AOI222X4TS U1071 ( .A0(n1235), .A1(d_ff2_Z[7]), .B0(n1234), .B1(d_ff1_Z[7]), 
        .C0(d_ff_Zn[7]), .C1(n1233), .Y(n1236) );
  AOI222X4TS U1072 ( .A0(n1227), .A1(d_ff2_Z[19]), .B0(n1219), .B1(d_ff1_Z[19]), .C0(d_ff_Zn[19]), .C1(n1229), .Y(n1197) );
  AOI222X4TS U1073 ( .A0(n1373), .A1(d_ff2_Z[20]), .B0(n1219), .B1(d_ff1_Z[20]), .C0(d_ff_Zn[20]), .C1(n1225), .Y(n1211) );
  AOI222X4TS U1074 ( .A0(n1365), .A1(d_ff2_Z[21]), .B0(n1219), .B1(d_ff1_Z[21]), .C0(d_ff_Zn[21]), .C1(n1225), .Y(n1210) );
  AOI222X4TS U1075 ( .A0(n1404), .A1(d_ff2_Z[22]), .B0(n1226), .B1(d_ff1_Z[22]), .C0(d_ff_Zn[22]), .C1(n1225), .Y(n1209) );
  AOI222X4TS U1076 ( .A0(n1351), .A1(d_ff2_Z[25]), .B0(n1226), .B1(d_ff1_Z[25]), .C0(d_ff_Zn[25]), .C1(n1225), .Y(n1218) );
  OAI33X4TS U1077 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(
        d_ff1_operation_out), .A2(n1419), .B0(n1411), .B1(n1410), .B2(
        d_ff1_shift_region_flag_out[0]), .Y(n1152) );
  OAI21XLTS U1078 ( .A0(n1343), .A1(n1380), .B0(n1192), .Y(n821) );
  NOR2X2TS U1079 ( .A(n1345), .B(n1334), .Y(n1343) );
  OAI21X2TS U1080 ( .A0(n1191), .A1(n1423), .B0(n1339), .Y(n1334) );
  NAND2X2TS U1081 ( .A(cont_iter_out[3]), .B(n1413), .Y(n1339) );
  OAI32X1TS U1082 ( .A0(n1289), .A1(n1423), .A2(n1287), .B0(n1414), .B1(n1289), 
        .Y(n988) );
  NOR3X4TS U1083 ( .A(n1287), .B(n1423), .C(n1414), .Y(n1289) );
  AOI222X4TS U1084 ( .A0(n1230), .A1(d_ff2_Z[10]), .B0(n1234), .B1(d_ff1_Z[10]), .C0(d_ff_Zn[10]), .C1(n1229), .Y(n1231) );
  AOI222X4TS U1085 ( .A0(n1230), .A1(d_ff2_Z[14]), .B0(n1219), .B1(d_ff1_Z[14]), .C0(d_ff_Zn[14]), .C1(n1229), .Y(n1220) );
  AOI222X4TS U1086 ( .A0(n1230), .A1(d_ff2_Z[9]), .B0(n1234), .B1(d_ff1_Z[9]), 
        .C0(d_ff_Zn[9]), .C1(n1233), .Y(n1208) );
  AOI222X4TS U1087 ( .A0(n1230), .A1(d_ff2_Z[15]), .B0(n1219), .B1(d_ff1_Z[15]), .C0(d_ff_Zn[15]), .C1(n1229), .Y(n1207) );
  AOI222X4TS U1088 ( .A0(n1230), .A1(d_ff2_Z[16]), .B0(n1219), .B1(d_ff1_Z[16]), .C0(d_ff_Zn[16]), .C1(n1229), .Y(n1206) );
  AOI222X4TS U1089 ( .A0(n1230), .A1(d_ff2_Z[11]), .B0(n1234), .B1(d_ff1_Z[11]), .C0(d_ff_Zn[11]), .C1(n1229), .Y(n1205) );
  AOI222X4TS U1090 ( .A0(n1230), .A1(d_ff2_Z[12]), .B0(n1219), .B1(d_ff1_Z[12]), .C0(d_ff_Zn[12]), .C1(n1229), .Y(n1202) );
  AOI222X4TS U1091 ( .A0(n1230), .A1(d_ff2_Z[13]), .B0(n1219), .B1(d_ff1_Z[13]), .C0(d_ff_Zn[13]), .C1(n1229), .Y(n1201) );
  AOI222X4TS U1092 ( .A0(n1230), .A1(d_ff2_Z[17]), .B0(n1219), .B1(d_ff1_Z[17]), .C0(d_ff_Zn[17]), .C1(n1229), .Y(n1199) );
  AOI222X4TS U1093 ( .A0(n1348), .A1(d_ff2_Z[18]), .B0(n1219), .B1(d_ff1_Z[18]), .C0(d_ff_Zn[18]), .C1(n1229), .Y(n1198) );
  AOI222X1TS U1094 ( .A0(n1254), .A1(data_output[28]), .B0(n1253), .B1(
        d_ff_Yn[28]), .C0(n1252), .C1(d_ff_Xn[28]), .Y(n1251) );
  INVX2TS U1095 ( .A(n1423), .Y(n1288) );
  INVX2TS U1096 ( .A(n1149), .Y(n1166) );
  NOR2X1TS U1097 ( .A(n1254), .B(n1150), .Y(n1149) );
  NOR2X4TS U1098 ( .A(ready_cordic), .B(n1147), .Y(n1174) );
  NOR3BX1TS U1099 ( .AN(n1069), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[3]), .Y(n1157) );
  OAI21XLTS U1100 ( .A0(n1355), .A1(n1421), .B0(n1357), .Y(n1356) );
  INVX2TS U1101 ( .A(n1193), .Y(n1366) );
  AOI211XLTS U1102 ( .A0(d_ff3_LUT_out[6]), .A1(n1340), .B0(n1067), .C0(n1163), 
        .Y(n1068) );
  NAND2X1TS U1103 ( .A(n1070), .B(ready_add_subt), .Y(n1313) );
  NAND2BX1TS U1104 ( .AN(inst_CORDIC_FSM_v3_state_reg[0]), .B(n1157), .Y(n1074) );
  INVX2TS U1105 ( .A(d_ff3_LUT_out[3]), .Y(n1258) );
  OAI21XLTS U1106 ( .A0(n1341), .A1(n1346), .B0(n1090), .Y(n805) );
  OAI21XLTS U1107 ( .A0(n1100), .A1(n1060), .B0(n1095), .Y(add_subt_dataB[9])
         );
  OAI21XLTS U1108 ( .A0(n1260), .A1(n1412), .B0(n1091), .Y(add_subt_dataB[20])
         );
  OAI21XLTS U1109 ( .A0(n1082), .A1(n1417), .B0(n1071), .Y(add_subt_dataA[23])
         );
  NOR4X2TS U1110 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(inst_CORDIC_FSM_v3_state_reg[3]), 
        .D(inst_CORDIC_FSM_v3_state_reg[0]), .Y(n1079) );
  NOR3X2TS U1111 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[4]), .C(inst_CORDIC_FSM_v3_state_reg[1]), 
        .Y(n1069) );
  NAND3X1TS U1112 ( .A(inst_CORDIC_FSM_v3_state_reg[7]), .B(n1079), .C(n1069), 
        .Y(n1264) );
  INVX2TS U1113 ( .A(n1264), .Y(ready_cordic) );
  NOR3BX1TS U1114 ( .AN(n1079), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[1]), .Y(n1072) );
  NOR3X1TS U1115 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .Y(n1066) );
  NAND4BX1TS U1116 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(
        inst_CORDIC_FSM_v3_state_reg[3]), .C(n1066), .D(n1069), .Y(n1374) );
  BUFX3TS U1117 ( .A(n1374), .Y(n1349) );
  BUFX3TS U1118 ( .A(n1349), .Y(n1401) );
  NAND2X2TS U1119 ( .A(n1399), .B(n1414), .Y(n1379) );
  BUFX3TS U1120 ( .A(n1401), .Y(n1340) );
  AOI211X1TS U1121 ( .A0(n1423), .A1(n1414), .B0(n1340), .C0(n1339), .Y(n1067)
         );
  NAND2X2TS U1122 ( .A(n1364), .B(cont_iter_out[1]), .Y(n1380) );
  NOR3X1TS U1123 ( .A(n1422), .B(n1423), .C(n1380), .Y(n1163) );
  NOR3X4TS U1124 ( .A(inst_CORDIC_FSM_v3_state_reg[5]), .B(n1416), .C(n1074), 
        .Y(enab_cont_iter) );
  NAND2X1TS U1125 ( .A(cont_var_out[1]), .B(n1409), .Y(n1082) );
  NAND2X1TS U1126 ( .A(cont_var_out[0]), .B(n1418), .Y(n1087) );
  INVX2TS U1127 ( .A(n1087), .Y(n1070) );
  BUFX3TS U1128 ( .A(n1070), .Y(n1274) );
  OR2X2TS U1129 ( .A(n1418), .B(n1409), .Y(n1260) );
  BUFX3TS U1130 ( .A(n1260), .Y(n1100) );
  AOI22X1TS U1131 ( .A0(n1274), .A1(d_ff2_X[23]), .B0(d_ff2_Z[23]), .B1(n1135), 
        .Y(n1071) );
  NAND3BX1TS U1132 ( .AN(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[4]), .C(n1072), .Y(n1261) );
  NOR3BX2TS U1133 ( .AN(n1261), .B(enab_cont_iter), .C(ready_add_subt), .Y(
        n1291) );
  NAND2X1TS U1134 ( .A(n1291), .B(cont_var_out[1]), .Y(n1073) );
  NAND3BX1TS U1135 ( .AN(n1074), .B(inst_CORDIC_FSM_v3_state_reg[5]), .C(n1416), .Y(n1262) );
  NAND2X1TS U1136 ( .A(n1261), .B(n1262), .Y(beg_add_subt) );
  INVX2TS U1137 ( .A(rst), .Y(n281) );
  CLKBUFX2TS U1138 ( .A(n281), .Y(n1075) );
  BUFX3TS U1139 ( .A(n1076), .Y(n1442) );
  BUFX3TS U1140 ( .A(n1075), .Y(n1440) );
  BUFX3TS U1141 ( .A(n1076), .Y(n1439) );
  BUFX3TS U1142 ( .A(n1075), .Y(n1438) );
  BUFX3TS U1143 ( .A(n1075), .Y(n1437) );
  CLKBUFX2TS U1144 ( .A(n281), .Y(n1077) );
  BUFX3TS U1145 ( .A(n1078), .Y(n1435) );
  BUFX3TS U1146 ( .A(n1078), .Y(n1434) );
  BUFX3TS U1147 ( .A(n1077), .Y(n1433) );
  BUFX3TS U1148 ( .A(n1078), .Y(n1460) );
  BUFX3TS U1149 ( .A(n1460), .Y(n1457) );
  BUFX3TS U1150 ( .A(n1460), .Y(n1456) );
  BUFX3TS U1151 ( .A(n1460), .Y(n1455) );
  BUFX3TS U1152 ( .A(n1076), .Y(n1459) );
  BUFX3TS U1153 ( .A(n1459), .Y(n1454) );
  BUFX3TS U1154 ( .A(n1459), .Y(n1453) );
  BUFX3TS U1155 ( .A(n1459), .Y(n1452) );
  BUFX3TS U1156 ( .A(n1459), .Y(n1451) );
  BUFX3TS U1157 ( .A(n1459), .Y(n1450) );
  BUFX3TS U1158 ( .A(n1077), .Y(n1436) );
  BUFX3TS U1159 ( .A(n1076), .Y(n1443) );
  BUFX3TS U1160 ( .A(n1076), .Y(n1444) );
  BUFX3TS U1161 ( .A(n1075), .Y(n1445) );
  BUFX3TS U1162 ( .A(n1076), .Y(n1446) );
  BUFX3TS U1163 ( .A(n1076), .Y(n1447) );
  BUFX3TS U1164 ( .A(n1075), .Y(n1448) );
  BUFX3TS U1165 ( .A(n1078), .Y(n1449) );
  BUFX3TS U1166 ( .A(n1076), .Y(n1441) );
  BUFX3TS U1167 ( .A(n1077), .Y(n1425) );
  BUFX3TS U1168 ( .A(n1077), .Y(n1426) );
  BUFX3TS U1169 ( .A(n1078), .Y(n1427) );
  BUFX3TS U1170 ( .A(n1077), .Y(n1428) );
  BUFX3TS U1171 ( .A(n1460), .Y(n1458) );
  BUFX3TS U1172 ( .A(n1078), .Y(n1429) );
  BUFX3TS U1173 ( .A(n1078), .Y(n1432) );
  BUFX3TS U1174 ( .A(n1078), .Y(n1430) );
  BUFX3TS U1175 ( .A(n1078), .Y(n1431) );
  NAND3X1TS U1176 ( .A(n1191), .B(n1288), .C(cont_iter_out[1]), .Y(n1263) );
  INVX2TS U1177 ( .A(n1082), .Y(n1097) );
  CLKBUFX2TS U1178 ( .A(n1097), .Y(n1265) );
  NAND2X2TS U1179 ( .A(n1265), .B(ready_add_subt), .Y(n1305) );
  CLKBUFX2TS U1180 ( .A(n1305), .Y(n1304) );
  INVX2TS U1181 ( .A(n1304), .Y(n1301) );
  BUFX3TS U1182 ( .A(n1305), .Y(n1302) );
  BUFX3TS U1183 ( .A(n1305), .Y(n1306) );
  AOI22X1TS U1184 ( .A0(n1274), .A1(d_ff3_sh_y_out[29]), .B0(n1145), .B1(
        d_ff3_LUT_out[27]), .Y(n1081) );
  OAI21XLTS U1185 ( .A0(n1082), .A1(n1063), .B0(n1081), .Y(add_subt_dataB[29])
         );
  BUFX3TS U1186 ( .A(n1265), .Y(n1277) );
  AOI22X1TS U1187 ( .A0(n1277), .A1(d_ff3_sh_x_out[15]), .B0(n1274), .B1(
        d_ff3_sh_y_out[15]), .Y(n1083) );
  OAI21XLTS U1188 ( .A0(n1100), .A1(n1412), .B0(n1083), .Y(add_subt_dataB[15])
         );
  BUFX3TS U1189 ( .A(n1265), .Y(n1280) );
  AOI22X1TS U1190 ( .A0(n1280), .A1(d_ff3_sh_x_out[21]), .B0(n1274), .B1(
        d_ff3_sh_y_out[21]), .Y(n1084) );
  OAI21XLTS U1191 ( .A0(n1100), .A1(n1062), .B0(n1084), .Y(add_subt_dataB[21])
         );
  BUFX3TS U1192 ( .A(n1265), .Y(n1284) );
  AOI22X1TS U1193 ( .A0(n1284), .A1(d_ff2_Y[24]), .B0(d_ff2_Z[24]), .B1(n1142), 
        .Y(n1085) );
  OAI21XLTS U1194 ( .A0(n1087), .A1(n1415), .B0(n1085), .Y(add_subt_dataA[24])
         );
  AOI22X1TS U1195 ( .A0(n1277), .A1(d_ff2_Y[28]), .B0(d_ff2_Z[28]), .B1(n1135), 
        .Y(n1086) );
  OAI21XLTS U1196 ( .A0(n1087), .A1(n1420), .B0(n1086), .Y(add_subt_dataA[28])
         );
  BUFX3TS U1197 ( .A(n1401), .Y(n1397) );
  BUFX3TS U1198 ( .A(n1274), .Y(n1133) );
  AOI22X1TS U1199 ( .A0(n1277), .A1(d_ff3_sh_x_out[18]), .B0(n1133), .B1(
        d_ff3_sh_y_out[18]), .Y(n1088) );
  OAI21XLTS U1200 ( .A0(n1260), .A1(n1461), .B0(n1088), .Y(add_subt_dataB[18])
         );
  AOI22X1TS U1201 ( .A0(n1277), .A1(d_ff3_sh_x_out[12]), .B0(n1133), .B1(
        d_ff3_sh_y_out[12]), .Y(n1089) );
  OAI21XLTS U1202 ( .A0(n1100), .A1(n1061), .B0(n1089), .Y(add_subt_dataB[12])
         );
  INVX2TS U1203 ( .A(n1191), .Y(n1341) );
  NAND2X1TS U1204 ( .A(n1353), .B(n1375), .Y(n1346) );
  AOI32X1TS U1205 ( .A0(n1064), .A1(n1399), .A2(n1341), .B0(d_ff3_LUT_out[23]), 
        .B1(n1340), .Y(n1090) );
  BUFX3TS U1206 ( .A(n1133), .Y(n1276) );
  AOI22X1TS U1207 ( .A0(n1280), .A1(d_ff3_sh_x_out[20]), .B0(n1276), .B1(
        d_ff3_sh_y_out[20]), .Y(n1091) );
  AOI22X1TS U1208 ( .A0(n1277), .A1(d_ff3_sh_x_out[16]), .B0(n1276), .B1(
        d_ff3_sh_y_out[16]), .Y(n1092) );
  AOI22X1TS U1209 ( .A0(n1277), .A1(d_ff3_sh_x_out[3]), .B0(n1276), .B1(
        d_ff3_sh_y_out[3]), .Y(n1093) );
  AOI22X1TS U1210 ( .A0(n1280), .A1(d_ff3_sh_x_out[17]), .B0(n1276), .B1(
        d_ff3_sh_y_out[17]), .Y(n1094) );
  AOI22X1TS U1211 ( .A0(n1277), .A1(d_ff3_sh_x_out[9]), .B0(n1276), .B1(
        d_ff3_sh_y_out[9]), .Y(n1095) );
  AOI22X1TS U1212 ( .A0(n1277), .A1(d_ff3_sh_x_out[13]), .B0(n1276), .B1(
        d_ff3_sh_y_out[13]), .Y(n1096) );
  CLKBUFX2TS U1213 ( .A(n1097), .Y(n1110) );
  BUFX3TS U1214 ( .A(n1110), .Y(n1131) );
  BUFX3TS U1215 ( .A(n1274), .Y(n1286) );
  INVX2TS U1216 ( .A(n1098), .Y(add_subt_dataB[10]) );
  INVX2TS U1217 ( .A(n1099), .Y(add_subt_dataB[23]) );
  INVX2TS U1218 ( .A(n1101), .Y(add_subt_dataB[25]) );
  AOI222X1TS U1219 ( .A0(n1131), .A1(d_ff3_sh_x_out[26]), .B0(n1286), .B1(
        d_ff3_sh_y_out[26]), .C0(n1283), .C1(d_ff3_LUT_out[26]), .Y(n1102) );
  INVX2TS U1220 ( .A(n1102), .Y(add_subt_dataB[26]) );
  INVX2TS U1221 ( .A(n1103), .Y(add_subt_dataB[8]) );
  INVX2TS U1222 ( .A(n1104), .Y(add_subt_dataB[24]) );
  INVX2TS U1223 ( .A(n1105), .Y(add_subt_dataB[4]) );
  INVX2TS U1224 ( .A(n1106), .Y(add_subt_dataB[2]) );
  NAND2X1TS U1225 ( .A(n1064), .B(n1417), .Y(intadd_515_CI) );
  INVX2TS U1226 ( .A(n1346), .Y(n1376) );
  AOI22X1TS U1227 ( .A0(d_ff2_Y[23]), .A1(n1376), .B0(d_ff3_sh_y_out[23]), 
        .B1(n1397), .Y(n1107) );
  AOI21X1TS U1228 ( .A0(n1422), .A1(n1064), .B0(cont_iter_out[3]), .Y(n1239)
         );
  AOI22X1TS U1229 ( .A0(n1399), .A1(n1239), .B0(d_ff3_LUT_out[26]), .B1(n1397), 
        .Y(n1108) );
  BUFX3TS U1230 ( .A(n1110), .Y(n1136) );
  BUFX3TS U1231 ( .A(n1133), .Y(n1130) );
  INVX2TS U1232 ( .A(n1260), .Y(n1279) );
  INVX2TS U1233 ( .A(n1109), .Y(add_subt_dataA[31]) );
  BUFX3TS U1234 ( .A(n1133), .Y(n1127) );
  INVX2TS U1235 ( .A(n1111), .Y(add_subt_dataA[16]) );
  INVX2TS U1236 ( .A(n1112), .Y(add_subt_dataA[26]) );
  INVX2TS U1237 ( .A(n1113), .Y(add_subt_dataA[21]) );
  INVX2TS U1238 ( .A(n1114), .Y(add_subt_dataA[19]) );
  INVX2TS U1239 ( .A(n1115), .Y(add_subt_dataA[25]) );
  INVX2TS U1240 ( .A(n1116), .Y(add_subt_dataA[22]) );
  INVX2TS U1241 ( .A(n1117), .Y(add_subt_dataA[18]) );
  INVX2TS U1242 ( .A(n1118), .Y(add_subt_dataA[17]) );
  AOI222X1TS U1243 ( .A0(n1131), .A1(d_ff3_sh_x_out[6]), .B0(n1130), .B1(
        d_ff3_sh_y_out[6]), .C0(d_ff3_LUT_out[6]), .C1(n1279), .Y(n1119) );
  INVX2TS U1244 ( .A(n1119), .Y(add_subt_dataB[6]) );
  INVX2TS U1245 ( .A(n1120), .Y(add_subt_dataA[13]) );
  INVX2TS U1246 ( .A(n1121), .Y(add_subt_dataA[15]) );
  INVX2TS U1247 ( .A(n1122), .Y(add_subt_dataA[14]) );
  INVX2TS U1248 ( .A(n1123), .Y(add_subt_dataA[11]) );
  INVX2TS U1249 ( .A(n1124), .Y(add_subt_dataA[12]) );
  INVX2TS U1250 ( .A(n1125), .Y(add_subt_dataA[20]) );
  INVX2TS U1251 ( .A(n1126), .Y(add_subt_dataA[5]) );
  INVX2TS U1252 ( .A(n1128), .Y(add_subt_dataA[10]) );
  INVX2TS U1253 ( .A(n1129), .Y(add_subt_dataB[0]) );
  INVX2TS U1254 ( .A(n1132), .Y(add_subt_dataB[1]) );
  INVX2TS U1255 ( .A(n1134), .Y(add_subt_dataA[9]) );
  INVX2TS U1256 ( .A(n1137), .Y(add_subt_dataA[0]) );
  INVX2TS U1257 ( .A(n1138), .Y(add_subt_dataA[2]) );
  INVX2TS U1258 ( .A(n1139), .Y(add_subt_dataA[1]) );
  INVX2TS U1259 ( .A(n1140), .Y(add_subt_dataA[8]) );
  INVX2TS U1260 ( .A(n1141), .Y(add_subt_dataA[4]) );
  INVX2TS U1261 ( .A(n1143), .Y(add_subt_dataA[3]) );
  INVX2TS U1262 ( .A(n1144), .Y(add_subt_dataA[7]) );
  INVX2TS U1263 ( .A(n1146), .Y(add_subt_dataA[6]) );
  XNOR2X1TS U1264 ( .A(n1152), .B(d_ff_Xn[31]), .Y(n1155) );
  XNOR2X1TS U1265 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), .Y(n1148) );
  XNOR2X1TS U1266 ( .A(d_ff1_shift_region_flag_out[0]), .B(n1148), .Y(n1150)
         );
  BUFX3TS U1267 ( .A(n1151), .Y(n1173) );
  BUFX3TS U1268 ( .A(n1173), .Y(n1253) );
  XOR2X1TS U1269 ( .A(d_ff_Yn[31]), .B(n1152), .Y(n1153) );
  AOI22X1TS U1270 ( .A0(n1254), .A1(data_output[31]), .B0(n1253), .B1(n1153), 
        .Y(n1154) );
  AOI222X1TS U1271 ( .A0(n1174), .A1(data_output[0]), .B0(d_ff_Yn[0]), .B1(
        n1173), .C0(d_ff_Xn[0]), .C1(n1149), .Y(n1156) );
  INVX2TS U1272 ( .A(n1156), .Y(n853) );
  NAND3X1TS U1273 ( .A(n1158), .B(inst_CORDIC_FSM_v3_state_reg[0]), .C(n1157), 
        .Y(n1259) );
  NOR2BX1TS U1274 ( .AN(n1259), .B(n1159), .Y(n1160) );
  INVX2TS U1275 ( .A(n1160), .Y(n1297) );
  INVX2TS U1276 ( .A(n1298), .Y(n1292) );
  BUFX3TS U1277 ( .A(n1424), .Y(n1370) );
  NOR4X1TS U1278 ( .A(enab_cont_iter), .B(n1390), .C(n1370), .D(beg_add_subt), 
        .Y(n1161) );
  AOI32X1TS U1279 ( .A0(n1292), .A1(n1264), .A2(n1161), .B0(ready_cordic), 
        .B1(ack_cordic), .Y(n1162) );
  INVX2TS U1280 ( .A(n1345), .Y(n1256) );
  AOI21X1TS U1281 ( .A0(d_ff3_LUT_out[2]), .A1(n1397), .B0(n1163), .Y(n1164)
         );
  BUFX3TS U1282 ( .A(n1174), .Y(n1244) );
  BUFX3TS U1283 ( .A(n1173), .Y(n1243) );
  INVX2TS U1284 ( .A(n1165), .Y(n833) );
  BUFX3TS U1285 ( .A(n1174), .Y(n1189) );
  AOI222X1TS U1286 ( .A0(n1189), .A1(data_output[8]), .B0(n1173), .B1(
        d_ff_Yn[8]), .C0(n1178), .C1(d_ff_Xn[8]), .Y(n1167) );
  INVX2TS U1287 ( .A(n1167), .Y(n845) );
  AOI222X1TS U1288 ( .A0(n1189), .A1(data_output[9]), .B0(n1173), .B1(
        d_ff_Yn[9]), .C0(n1178), .C1(d_ff_Xn[9]), .Y(n1168) );
  INVX2TS U1289 ( .A(n1168), .Y(n844) );
  AOI222X1TS U1290 ( .A0(n1189), .A1(data_output[4]), .B0(n1173), .B1(
        d_ff_Yn[4]), .C0(n1178), .C1(d_ff_Xn[4]), .Y(n1169) );
  INVX2TS U1291 ( .A(n1169), .Y(n849) );
  AOI222X1TS U1292 ( .A0(n1189), .A1(data_output[5]), .B0(n1173), .B1(
        d_ff_Yn[5]), .C0(n1178), .C1(d_ff_Xn[5]), .Y(n1170) );
  INVX2TS U1293 ( .A(n1170), .Y(n848) );
  AOI222X1TS U1294 ( .A0(n1189), .A1(data_output[7]), .B0(n1151), .B1(
        d_ff_Yn[7]), .C0(n1178), .C1(d_ff_Xn[7]), .Y(n1171) );
  INVX2TS U1295 ( .A(n1171), .Y(n846) );
  AOI222X1TS U1296 ( .A0(n1174), .A1(data_output[2]), .B0(n1173), .B1(
        d_ff_Yn[2]), .C0(n1178), .C1(d_ff_Xn[2]), .Y(n1172) );
  INVX2TS U1297 ( .A(n1172), .Y(n851) );
  AOI222X1TS U1298 ( .A0(n1174), .A1(data_output[1]), .B0(n1173), .B1(
        d_ff_Yn[1]), .C0(n1178), .C1(d_ff_Xn[1]), .Y(n1175) );
  INVX2TS U1299 ( .A(n1175), .Y(n852) );
  AOI222X1TS U1300 ( .A0(n1189), .A1(data_output[6]), .B0(n1173), .B1(
        d_ff_Yn[6]), .C0(n1178), .C1(d_ff_Xn[6]), .Y(n1176) );
  INVX2TS U1301 ( .A(n1176), .Y(n847) );
  INVX2TS U1302 ( .A(n1177), .Y(n843) );
  AOI222X1TS U1303 ( .A0(n1189), .A1(data_output[3]), .B0(n1151), .B1(
        d_ff_Yn[3]), .C0(n1178), .C1(d_ff_Xn[3]), .Y(n1179) );
  INVX2TS U1304 ( .A(n1179), .Y(n850) );
  INVX2TS U1305 ( .A(n1180), .Y(n838) );
  INVX2TS U1306 ( .A(n1181), .Y(n835) );
  INVX2TS U1307 ( .A(n1182), .Y(n842) );
  INVX2TS U1308 ( .A(n1183), .Y(n839) );
  INVX2TS U1309 ( .A(n1184), .Y(n840) );
  INVX2TS U1310 ( .A(n1185), .Y(n837) );
  INVX2TS U1311 ( .A(n1186), .Y(n836) );
  INVX2TS U1312 ( .A(n1187), .Y(n834) );
  INVX2TS U1313 ( .A(n1190), .Y(n841) );
  AOI211X1TS U1314 ( .A0(n1064), .A1(n1408), .B0(n1422), .C0(n1379), .Y(n1337)
         );
  AOI21X1TS U1315 ( .A0(d_ff3_LUT_out[0]), .A1(n1397), .B0(n1337), .Y(n1192)
         );
  NAND4X1TS U1316 ( .A(n1408), .B(n1413), .C(n1375), .D(n1414), .Y(n1194) );
  BUFX3TS U1317 ( .A(n1366), .Y(n1233) );
  NOR2X2TS U1318 ( .A(n1235), .B(n1194), .Y(n1204) );
  AOI222X1TS U1319 ( .A0(n1235), .A1(d_ff2_Z[0]), .B0(n1233), .B1(d_ff_Zn[0]), 
        .C0(n1204), .C1(d_ff1_Z[0]), .Y(n1195) );
  INVX2TS U1320 ( .A(n1195), .Y(n800) );
  AOI222X1TS U1321 ( .A0(n1235), .A1(d_ff2_Z[1]), .B0(n1204), .B1(d_ff1_Z[1]), 
        .C0(d_ff_Zn[1]), .C1(n1233), .Y(n1196) );
  INVX2TS U1322 ( .A(n1196), .Y(n799) );
  BUFX3TS U1323 ( .A(n1424), .Y(n1372) );
  BUFX3TS U1324 ( .A(n1204), .Y(n1219) );
  BUFX3TS U1325 ( .A(n1366), .Y(n1229) );
  INVX2TS U1326 ( .A(n1197), .Y(n781) );
  INVX2TS U1327 ( .A(n1370), .Y(n1230) );
  INVX2TS U1328 ( .A(n1198), .Y(n782) );
  INVX2TS U1329 ( .A(n1199), .Y(n783) );
  BUFX3TS U1330 ( .A(n1204), .Y(n1226) );
  BUFX3TS U1331 ( .A(n1366), .Y(n1225) );
  INVX2TS U1332 ( .A(n1200), .Y(n776) );
  INVX2TS U1333 ( .A(n1201), .Y(n787) );
  INVX2TS U1334 ( .A(n1202), .Y(n788) );
  INVX2TS U1335 ( .A(n1203), .Y(n777) );
  BUFX3TS U1336 ( .A(n1204), .Y(n1234) );
  INVX2TS U1337 ( .A(n1205), .Y(n789) );
  INVX2TS U1338 ( .A(n1206), .Y(n784) );
  INVX2TS U1339 ( .A(n1207), .Y(n785) );
  INVX2TS U1340 ( .A(n1208), .Y(n791) );
  INVX2TS U1341 ( .A(n1209), .Y(n778) );
  INVX2TS U1342 ( .A(n1210), .Y(n779) );
  INVX2TS U1343 ( .A(n1211), .Y(n780) );
  INVX2TS U1344 ( .A(n1212), .Y(n794) );
  INVX2TS U1345 ( .A(n1213), .Y(n795) );
  AOI222X1TS U1346 ( .A0(n1235), .A1(d_ff2_Z[4]), .B0(n1234), .B1(d_ff1_Z[4]), 
        .C0(d_ff_Zn[4]), .C1(n1233), .Y(n1214) );
  INVX2TS U1347 ( .A(n1214), .Y(n796) );
  AOI222X1TS U1348 ( .A0(n1235), .A1(d_ff2_Z[3]), .B0(n1234), .B1(d_ff1_Z[3]), 
        .C0(d_ff_Zn[3]), .C1(n1233), .Y(n1215) );
  INVX2TS U1349 ( .A(n1215), .Y(n797) );
  AOI222X1TS U1350 ( .A0(n1373), .A1(d_ff2_Z[28]), .B0(n1226), .B1(d_ff1_Z[28]), .C0(d_ff_Zn[28]), .C1(n1225), .Y(n1216) );
  INVX2TS U1351 ( .A(n1216), .Y(n772) );
  AOI222X1TS U1352 ( .A0(n1235), .A1(d_ff2_Z[2]), .B0(n1234), .B1(d_ff1_Z[2]), 
        .C0(d_ff_Zn[2]), .C1(n1233), .Y(n1217) );
  INVX2TS U1353 ( .A(n1217), .Y(n798) );
  INVX2TS U1354 ( .A(n1218), .Y(n775) );
  INVX2TS U1355 ( .A(n1220), .Y(n786) );
  INVX2TS U1356 ( .A(n1372), .Y(n1373) );
  INVX2TS U1357 ( .A(n1221), .Y(n771) );
  AOI222X1TS U1358 ( .A0(n1227), .A1(d_ff2_Z[30]), .B0(n1226), .B1(d_ff1_Z[30]), .C0(d_ff_Zn[30]), .C1(n1366), .Y(n1222) );
  INVX2TS U1359 ( .A(n1222), .Y(n770) );
  INVX2TS U1360 ( .A(n1223), .Y(n769) );
  AOI222X1TS U1361 ( .A0(n1365), .A1(d_ff2_Z[27]), .B0(n1226), .B1(d_ff1_Z[27]), .C0(d_ff_Zn[27]), .C1(n1225), .Y(n1224) );
  INVX2TS U1362 ( .A(n1224), .Y(n773) );
  AOI222X1TS U1363 ( .A0(n1404), .A1(d_ff2_Z[26]), .B0(n1226), .B1(d_ff1_Z[26]), .C0(d_ff_Zn[26]), .C1(n1225), .Y(n1228) );
  INVX2TS U1364 ( .A(n1228), .Y(n774) );
  INVX2TS U1365 ( .A(n1231), .Y(n790) );
  INVX2TS U1366 ( .A(n1232), .Y(n792) );
  INVX2TS U1367 ( .A(n1236), .Y(n793) );
  OAI2BB1X1TS U1368 ( .A0N(n1339), .A1N(n1256), .B0(n1364), .Y(n1328) );
  INVX2TS U1369 ( .A(n1380), .Y(n1335) );
  NAND2X1TS U1370 ( .A(n1335), .B(n1341), .Y(n1342) );
  INVX2TS U1371 ( .A(n1379), .Y(n1330) );
  NAND2X1TS U1372 ( .A(n1064), .B(n1341), .Y(n1237) );
  AOI22X1TS U1373 ( .A0(n1330), .A1(n1237), .B0(d_ff3_LUT_out[24]), .B1(n1340), 
        .Y(n1238) );
  AOI22X1TS U1374 ( .A0(n1239), .A1(n1330), .B0(d_ff3_LUT_out[4]), .B1(n1340), 
        .Y(n1240) );
  AOI222X1TS U1375 ( .A0(n1254), .A1(data_output[30]), .B0(n1253), .B1(
        d_ff_Yn[30]), .C0(n1252), .C1(d_ff_Xn[30]), .Y(n1241) );
  INVX2TS U1376 ( .A(n1241), .Y(n823) );
  INVX2TS U1377 ( .A(n1242), .Y(n830) );
  INVX2TS U1378 ( .A(n1245), .Y(n832) );
  INVX2TS U1379 ( .A(n1246), .Y(n831) );
  INVX2TS U1380 ( .A(n1247), .Y(n829) );
  INVX2TS U1381 ( .A(n1248), .Y(n828) );
  INVX2TS U1382 ( .A(n1249), .Y(n826) );
  INVX2TS U1383 ( .A(n1250), .Y(n827) );
  INVX2TS U1384 ( .A(n1251), .Y(n825) );
  INVX2TS U1385 ( .A(n1255), .Y(n824) );
  NAND2X1TS U1386 ( .A(n1330), .B(n1341), .Y(n1257) );
  NAND2X1TS U1387 ( .A(n1335), .B(n1332), .Y(n1338) );
  NOR2BX1TS U1388 ( .AN(beg_fsm_cordic), .B(n1259), .Y(
        inst_CORDIC_FSM_v3_state_next[1]) );
  INVX2TS U1389 ( .A(n1306), .Y(n1309) );
  OAI22X1TS U1390 ( .A0(n1309), .A1(n1262), .B0(n1261), .B1(n1260), .Y(
        inst_CORDIC_FSM_v3_state_next[5]) );
  OAI22X1TS U1391 ( .A0(ack_cordic), .A1(n1264), .B0(n1287), .B1(n1263), .Y(
        inst_CORDIC_FSM_v3_state_next[7]) );
  AOI2BB2XLTS U1392 ( .B0(cont_var_out[0]), .B1(d_ff3_sign_out), .A0N(
        d_ff3_sign_out), .A1N(cont_var_out[0]), .Y(op_add_subt) );
  AO22XLTS U1393 ( .A0(n1265), .A1(d_ff3_sh_x_out[31]), .B0(n1133), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U1394 ( .A0(n1265), .A1(d_ff3_sh_x_out[30]), .B0(n1070), .B1(
        d_ff3_sh_y_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U1395 ( .A0(n1280), .A1(d_ff3_sh_x_out[28]), .B0(n1274), .B1(
        d_ff3_sh_y_out[28]), .Y(n1266) );
  NAND2X1TS U1396 ( .A(n1142), .B(d_ff3_LUT_out[27]), .Y(n1267) );
  NAND2X1TS U1397 ( .A(n1266), .B(n1267), .Y(add_subt_dataB[28]) );
  AOI22X1TS U1398 ( .A0(n1280), .A1(d_ff3_sh_x_out[27]), .B0(n1274), .B1(
        d_ff3_sh_y_out[27]), .Y(n1268) );
  NAND2X1TS U1399 ( .A(n1268), .B(n1267), .Y(add_subt_dataB[27]) );
  INVX2TS U1400 ( .A(n1260), .Y(n1271) );
  AOI22X1TS U1401 ( .A0(n1280), .A1(d_ff3_sh_x_out[22]), .B0(n1274), .B1(
        d_ff3_sh_y_out[22]), .Y(n1269) );
  OAI2BB1X1TS U1402 ( .A0N(n1271), .A1N(d_ff3_LUT_out[19]), .B0(n1269), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U1403 ( .A0(n1280), .A1(d_ff3_sh_x_out[19]), .B0(n1276), .B1(
        d_ff3_sh_y_out[19]), .Y(n1270) );
  OAI2BB1X1TS U1404 ( .A0N(n1271), .A1N(d_ff3_LUT_out[19]), .B0(n1270), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U1405 ( .A0(n1280), .A1(d_ff3_sh_x_out[14]), .B0(n1276), .B1(
        d_ff3_sh_y_out[14]), .Y(n1272) );
  OAI2BB1X1TS U1406 ( .A0N(n1279), .A1N(d_ff3_LUT_out[5]), .B0(n1272), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U1407 ( .A0(n1280), .A1(d_ff3_sh_x_out[11]), .B0(n1276), .B1(
        d_ff3_sh_y_out[11]), .Y(n1273) );
  OAI2BB1X1TS U1408 ( .A0N(n1279), .A1N(d_ff3_LUT_out[7]), .B0(n1273), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U1409 ( .A0(n1277), .A1(d_ff3_sh_x_out[7]), .B0(n1274), .B1(
        d_ff3_sh_y_out[7]), .Y(n1275) );
  OAI2BB1X1TS U1410 ( .A0N(n1279), .A1N(d_ff3_LUT_out[7]), .B0(n1275), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U1411 ( .A0(n1277), .A1(d_ff3_sh_x_out[5]), .B0(n1276), .B1(
        d_ff3_sh_y_out[5]), .Y(n1278) );
  OAI2BB1X1TS U1412 ( .A0N(n1279), .A1N(d_ff3_LUT_out[5]), .B0(n1278), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U1413 ( .A0(n1280), .A1(d_ff2_Y[30]), .B0(d_ff2_Z[30]), .B1(n1142), 
        .Y(n1281) );
  OAI2BB1X1TS U1414 ( .A0N(n1286), .A1N(d_ff2_X[30]), .B0(n1281), .Y(
        add_subt_dataA[30]) );
  AOI22X1TS U1415 ( .A0(n1284), .A1(d_ff2_Y[29]), .B0(d_ff2_Z[29]), .B1(n1142), 
        .Y(n1282) );
  OAI2BB1X1TS U1416 ( .A0N(n1286), .A1N(d_ff2_X[29]), .B0(n1282), .Y(
        add_subt_dataA[29]) );
  AOI22X1TS U1417 ( .A0(n1284), .A1(d_ff2_Y[27]), .B0(d_ff2_Z[27]), .B1(n1145), 
        .Y(n1285) );
  OAI2BB1X1TS U1418 ( .A0N(n1286), .A1N(d_ff2_X[27]), .B0(n1285), .Y(
        add_subt_dataA[27]) );
  AOI22X1TS U1419 ( .A0(enab_cont_iter), .A1(n1288), .B0(n1423), .B1(n1287), 
        .Y(n989) );
  NAND2X1TS U1420 ( .A(n1422), .B(n1289), .Y(n1290) );
  XNOR2X1TS U1421 ( .A(cont_iter_out[3]), .B(n1290), .Y(n986) );
  BUFX3TS U1422 ( .A(n1297), .Y(n1298) );
  CLKBUFX2TS U1423 ( .A(n1298), .Y(n1299) );
  BUFX3TS U1424 ( .A(n1297), .Y(n1293) );
  INVX2TS U1425 ( .A(n1299), .Y(n1294) );
  BUFX3TS U1426 ( .A(n1298), .Y(n1295) );
  INVX2TS U1427 ( .A(n1299), .Y(n1296) );
  INVX2TS U1428 ( .A(n1299), .Y(n1300) );
  INVX2TS U1429 ( .A(n1304), .Y(n1303) );
  INVX2TS U1430 ( .A(n1304), .Y(n1307) );
  CLKBUFX2TS U1431 ( .A(n1306), .Y(n1308) );
  BUFX3TS U1432 ( .A(n1313), .Y(n1315) );
  INVX2TS U1433 ( .A(n1315), .Y(n1310) );
  BUFX3TS U1434 ( .A(n1313), .Y(n1314) );
  INVX2TS U1435 ( .A(n1314), .Y(n1312) );
  INVX2TS U1436 ( .A(n1314), .Y(n1316) );
  CLKBUFX2TS U1437 ( .A(n1315), .Y(n1317) );
  INVX2TS U1438 ( .A(n1314), .Y(n1318) );
  NAND3X1TS U1439 ( .A(n1418), .B(n1409), .C(ready_add_subt), .Y(n1322) );
  BUFX3TS U1440 ( .A(n1322), .Y(n1321) );
  BUFX3TS U1441 ( .A(n1321), .Y(n1320) );
  INVX2TS U1442 ( .A(n1320), .Y(n1319) );
  CLKBUFX2TS U1443 ( .A(n1321), .Y(n1326) );
  INVX2TS U1444 ( .A(n1326), .Y(n1323) );
  INVX2TS U1445 ( .A(n1326), .Y(n1325) );
  INVX2TS U1446 ( .A(n1326), .Y(n1327) );
  AOI22X1TS U1447 ( .A0(n1330), .A1(n1332), .B0(d_ff3_LUT_out[1]), .B1(n1340), 
        .Y(n1329) );
  NAND2X1TS U1448 ( .A(n1329), .B(n1328), .Y(n820) );
  AOI22X1TS U1449 ( .A0(n1330), .A1(n1334), .B0(d_ff3_LUT_out[5]), .B1(n1340), 
        .Y(n1331) );
  NAND2X1TS U1450 ( .A(n1331), .B(n1338), .Y(n816) );
  AOI22X1TS U1451 ( .A0(n1364), .A1(n1332), .B0(d_ff3_LUT_out[7]), .B1(n1340), 
        .Y(n1333) );
  NAND2X1TS U1452 ( .A(n1333), .B(n1342), .Y(n814) );
  INVX2TS U1453 ( .A(n1349), .Y(n1403) );
  AOI22X1TS U1454 ( .A0(n1335), .A1(n1334), .B0(d_ff3_LUT_out[10]), .B1(n1397), 
        .Y(n1336) );
  OAI221XLTS U1455 ( .A0(n1390), .A1(n1061), .B0(n1393), .B1(n1339), .C0(n1338), .Y(n810) );
  AOI22X1TS U1456 ( .A0(n1364), .A1(n1343), .B0(n1461), .B1(n1340), .Y(n809)
         );
  BUFX3TS U1457 ( .A(n1401), .Y(n1382) );
  OAI221XLTS U1458 ( .A0(n1353), .A1(n1062), .B0(n1393), .B1(n1343), .C0(n1342), .Y(n806) );
  AOI22X1TS U1459 ( .A0(n1345), .A1(n1344), .B0(d_ff3_LUT_out[25]), .B1(n1397), 
        .Y(n1347) );
  AOI32X1TS U1460 ( .A0(n1379), .A1(n1347), .A2(n1346), .B0(n1422), .B1(n1347), 
        .Y(n803) );
  INVX2TS U1461 ( .A(n1349), .Y(n1362) );
  BUFX3TS U1462 ( .A(n1368), .Y(n1350) );
  INVX2TS U1463 ( .A(n1372), .Y(n1348) );
  INVX2TS U1464 ( .A(n1374), .Y(n1395) );
  INVX2TS U1465 ( .A(n1372), .Y(n1351) );
  BUFX3TS U1466 ( .A(n1368), .Y(n1405) );
  INVX2TS U1467 ( .A(n1349), .Y(n1407) );
  INVX2TS U1468 ( .A(n1372), .Y(n1404) );
  BUFX3TS U1469 ( .A(n1368), .Y(n1363) );
  INVX2TS U1470 ( .A(n1372), .Y(n1365) );
  NOR2X1TS U1471 ( .A(d_ff2_Y[27]), .B(intadd_515_n1), .Y(n1355) );
  AOI21X1TS U1472 ( .A0(intadd_515_n1), .A1(d_ff2_Y[27]), .B0(n1355), .Y(n1354) );
  OR3X1TS U1473 ( .A(d_ff2_Y[27]), .B(d_ff2_Y[28]), .C(intadd_515_n1), .Y(
        n1357) );
  NOR2X1TS U1474 ( .A(d_ff2_Y[29]), .B(n1357), .Y(n1359) );
  AOI21X1TS U1475 ( .A0(d_ff2_Y[29]), .A1(n1357), .B0(n1359), .Y(n1358) );
  XOR2X1TS U1476 ( .A(d_ff2_Y[30]), .B(n1359), .Y(n1361) );
  CLKBUFX2TS U1477 ( .A(n1372), .Y(n1369) );
  OA22X1TS U1478 ( .A0(d_ff_Xn[1]), .A1(n1059), .B0(n1369), .B1(d_ff2_X[1]), 
        .Y(n701) );
  OA22X1TS U1479 ( .A0(d_ff_Xn[2]), .A1(n1371), .B0(n1369), .B1(d_ff2_X[2]), 
        .Y(n699) );
  OA22X1TS U1480 ( .A0(d_ff_Xn[3]), .A1(n1059), .B0(n1369), .B1(d_ff2_X[3]), 
        .Y(n697) );
  OA22X1TS U1481 ( .A0(d_ff_Xn[5]), .A1(n1371), .B0(n1369), .B1(d_ff2_X[5]), 
        .Y(n693) );
  OA22X1TS U1482 ( .A0(d_ff_Xn[6]), .A1(n1059), .B0(n1369), .B1(d_ff2_X[6]), 
        .Y(n691) );
  OA22X1TS U1483 ( .A0(d_ff_Xn[7]), .A1(n1371), .B0(n1372), .B1(d_ff2_X[7]), 
        .Y(n689) );
  OA22X1TS U1484 ( .A0(d_ff_Xn[10]), .A1(n1059), .B0(n1370), .B1(d_ff2_X[10]), 
        .Y(n683) );
  OA22X1TS U1485 ( .A0(d_ff_Xn[12]), .A1(n1371), .B0(n1424), .B1(d_ff2_X[12]), 
        .Y(n679) );
  OA22X1TS U1486 ( .A0(d_ff_Xn[13]), .A1(n1059), .B0(n1424), .B1(d_ff2_X[13]), 
        .Y(n677) );
  OA22X1TS U1487 ( .A0(d_ff_Xn[14]), .A1(n1371), .B0(n1424), .B1(d_ff2_X[14]), 
        .Y(n675) );
  OA22X1TS U1488 ( .A0(d_ff_Xn[16]), .A1(n1371), .B0(n1424), .B1(d_ff2_X[16]), 
        .Y(n671) );
  OA22X1TS U1489 ( .A0(d_ff_Xn[17]), .A1(n1059), .B0(n1424), .B1(d_ff2_X[17]), 
        .Y(n669) );
  OA22X1TS U1490 ( .A0(d_ff_Xn[19]), .A1(n1371), .B0(n1424), .B1(d_ff2_X[19]), 
        .Y(n665) );
  OA22X1TS U1491 ( .A0(d_ff_Xn[20]), .A1(n1059), .B0(n1424), .B1(d_ff2_X[20]), 
        .Y(n663) );
  OA22X1TS U1492 ( .A0(n1370), .A1(d_ff2_X[24]), .B0(d_ff_Xn[24]), .B1(n1059), 
        .Y(n656) );
  OA22X1TS U1493 ( .A0(d_ff_Xn[25]), .A1(n1371), .B0(n1369), .B1(d_ff2_X[25]), 
        .Y(n655) );
  OA22X1TS U1494 ( .A0(d_ff_Xn[26]), .A1(n1059), .B0(n1369), .B1(d_ff2_X[26]), 
        .Y(n654) );
  OA22X1TS U1495 ( .A0(n1370), .A1(d_ff2_X[27]), .B0(d_ff_Xn[27]), .B1(n1371), 
        .Y(n653) );
  OA22X1TS U1496 ( .A0(n1372), .A1(d_ff2_X[28]), .B0(d_ff_Xn[28]), .B1(n1059), 
        .Y(n652) );
  OA22X1TS U1497 ( .A0(n1372), .A1(d_ff2_X[29]), .B0(d_ff_Xn[29]), .B1(n1193), 
        .Y(n651) );
  NOR2X2TS U1498 ( .A(d_ff2_X[23]), .B(n1375), .Y(n1383) );
  AOI22X1TS U1499 ( .A0(n1376), .A1(d_ff2_X[23]), .B0(d_ff3_sh_x_out[23]), 
        .B1(n1397), .Y(n1377) );
  OAI2BB1X1TS U1500 ( .A0N(n1388), .A1N(n1383), .B0(n1377), .Y(n649) );
  XOR2X1TS U1501 ( .A(n1383), .B(d_ff2_X[24]), .Y(n1378) );
  MXI2X1TS U1502 ( .A(n1380), .B(n1379), .S0(n1378), .Y(n1381) );
  AOI222X1TS U1503 ( .A0(cont_iter_out[1]), .A1(n1383), .B0(cont_iter_out[1]), 
        .B1(n1415), .C0(n1383), .C1(n1415), .Y(n1385) );
  CMPR32X2TS U1504 ( .A(n1413), .B(d_ff2_X[25]), .C(n1385), .CO(n1387), .S(
        n1384) );
  CMPR32X2TS U1505 ( .A(n1408), .B(d_ff2_X[26]), .C(n1387), .CO(n1391), .S(
        n1386) );
  NOR2X1TS U1506 ( .A(d_ff2_X[27]), .B(n1391), .Y(n1392) );
  AOI21X1TS U1507 ( .A0(n1391), .A1(d_ff2_X[27]), .B0(n1392), .Y(n1389) );
  OR3X1TS U1508 ( .A(n1391), .B(d_ff2_X[27]), .C(d_ff2_X[28]), .Y(n1396) );
  NOR2X1TS U1509 ( .A(d_ff2_X[29]), .B(n1396), .Y(n1400) );
  AOI21X1TS U1510 ( .A0(d_ff2_X[29]), .A1(n1396), .B0(n1400), .Y(n1398) );
  AOI22X1TS U1511 ( .A0(n1390), .A1(n1398), .B0(n1063), .B1(n1397), .Y(n643)
         );
  XOR2X1TS U1512 ( .A(d_ff2_X[30]), .B(n1400), .Y(n1402) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_syn.sdf"); 
 endmodule

