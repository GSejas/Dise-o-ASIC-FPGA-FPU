/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 08:29:05 2016
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
         n985, n986, n987, n988, n989, n990, intadd_366_B_1_, intadd_366_CI,
         intadd_366_SUM_2_, intadd_366_SUM_1_, intadd_366_SUM_0_,
         intadd_366_n3, intadd_366_n2, intadd_366_n1, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098,
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
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228,
         n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238,
         n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248,
         n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258,
         n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268,
         n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278,
         n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288,
         n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298,
         n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308,
         n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318,
         n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328,
         n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338,
         n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348,
         n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358,
         n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368,
         n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378,
         n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1387, n1388, n1389,
         n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399,
         n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409,
         n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419,
         n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429,
         n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439,
         n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449,
         n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457, n1458, n1459,
         n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469,
         n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479,
         n1480, n1481, n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489,
         n1490, n1491, n1492, n1493, n1494, n1495, n1496, n1497, n1498, n1499,
         n1500, n1501, n1502, n1503, n1504, n1505, n1506, n1507;
  wire   [3:0] cont_iter_out;
  wire   [1:0] cont_var_out;
  wire   [1:0] d_ff1_shift_region_flag_out;
  wire   [31:0] d_ff1_Z;
  wire   [30:1] d_ff_Xn;
  wire   [31:21] d_ff_Yn;
  wire   [31:0] d_ff_Zn;
  wire   [29:0] d_ff2_X;
  wire   [31:0] d_ff2_Y;
  wire   [31:0] d_ff2_Z;
  wire   [31:0] d_ff3_sh_x_out;
  wire   [31:0] d_ff3_sh_y_out;
  wire   [27:0] d_ff3_LUT_out;
  wire   [7:0] inst_CORDIC_FSM_v3_state_next;
  wire   [7:0] inst_CORDIC_FSM_v3_state_reg;

  DFFRXLTS ITER_CONT_temp_reg_0_ ( .D(n989), .CK(clk), .RN(n1506), .Q(
        cont_iter_out[0]), .QN(n1173) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(n981), .CK(clk), .RN(n1500), .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(n980), .CK(clk), .RN(n1500), .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(n979), .CK(clk), .RN(n1505), .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(n978), .CK(clk), .RN(n1504), .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(n977), .CK(clk), .RN(n1502), .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(n976), .CK(clk), .RN(n1501), .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(n975), .CK(clk), .RN(n1502), .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(n974), .CK(clk), .RN(n1501), .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(n973), .CK(clk), .RN(n1505), .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(n972), .CK(clk), .RN(n1500), .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(n971), .CK(clk), .RN(n1499), .Q(d_ff1_Z[10])
         );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(n970), .CK(clk), .RN(n1497), .Q(d_ff1_Z[11])
         );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(n969), .CK(clk), .RN(n1504), .Q(d_ff1_Z[12])
         );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(n968), .CK(clk), .RN(n1502), .Q(d_ff1_Z[13])
         );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(n967), .CK(clk), .RN(n1501), .Q(d_ff1_Z[14])
         );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(n966), .CK(clk), .RN(n1505), .Q(d_ff1_Z[15])
         );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(n965), .CK(clk), .RN(n1500), .Q(d_ff1_Z[16])
         );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(n964), .CK(clk), .RN(n1499), .Q(d_ff1_Z[17])
         );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(n963), .CK(clk), .RN(n1498), .Q(d_ff1_Z[18])
         );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(n962), .CK(clk), .RN(n1496), .Q(d_ff1_Z[19])
         );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(n961), .CK(clk), .RN(n1495), .Q(d_ff1_Z[20])
         );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(n960), .CK(clk), .RN(n1503), .Q(d_ff1_Z[21])
         );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(n959), .CK(clk), .RN(n1496), .Q(d_ff1_Z[22])
         );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(n958), .CK(clk), .RN(n1506), .Q(d_ff1_Z[23])
         );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(n957), .CK(clk), .RN(n1498), .Q(d_ff1_Z[24])
         );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(n956), .CK(clk), .RN(n1495), .Q(d_ff1_Z[25])
         );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(n955), .CK(clk), .RN(n1503), .Q(d_ff1_Z[26])
         );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(n954), .CK(clk), .RN(n1177), .Q(d_ff1_Z[27])
         );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(n953), .CK(clk), .RN(n1496), .Q(d_ff1_Z[28])
         );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(n952), .CK(clk), .RN(n1498), .Q(d_ff1_Z[29])
         );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(n951), .CK(clk), .RN(n1505), .Q(d_ff1_Z[30])
         );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(n950), .CK(clk), .RN(n1500), .Q(d_ff1_Z[31])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(n949), .CK(clk), .RN(n1499), .Q(d_ff_Zn[0])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(n948), .CK(clk), .RN(n1497), .Q(d_ff_Zn[1])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(n947), .CK(clk), .RN(n1504), .Q(d_ff_Zn[2])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(n946), .CK(clk), .RN(n1502), .Q(d_ff_Zn[3])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(n945), .CK(clk), .RN(n1501), .Q(d_ff_Zn[4])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(n944), .CK(clk), .RN(n1505), .Q(d_ff_Zn[5])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(n943), .CK(clk), .RN(n1500), .Q(d_ff_Zn[6])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(n942), .CK(clk), .RN(n1499), .Q(d_ff_Zn[7])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(n941), .CK(clk), .RN(n1497), .Q(d_ff_Zn[8])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(n940), .CK(clk), .RN(n1504), .Q(d_ff_Zn[9])
         );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(n939), .CK(clk), .RN(n1499), .Q(d_ff_Zn[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(n938), .CK(clk), .RN(n1497), .Q(d_ff_Zn[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(n937), .CK(clk), .RN(n1504), .Q(d_ff_Zn[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(n936), .CK(clk), .RN(n1502), .Q(d_ff_Zn[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(n935), .CK(clk), .RN(n1501), .Q(d_ff_Zn[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(n934), .CK(clk), .RN(n1505), .Q(d_ff_Zn[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(n933), .CK(clk), .RN(n1500), .Q(d_ff_Zn[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(n932), .CK(clk), .RN(n1499), .Q(d_ff_Zn[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(n931), .CK(clk), .RN(n1497), .Q(d_ff_Zn[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(n930), .CK(clk), .RN(n1504), .Q(d_ff_Zn[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(n929), .CK(clk), .RN(n1502), .Q(d_ff_Zn[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(n928), .CK(clk), .RN(n1501), .Q(d_ff_Zn[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(n927), .CK(clk), .RN(n1504), .Q(d_ff_Zn[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(n926), .CK(clk), .RN(n1502), .Q(d_ff_Zn[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(n925), .CK(clk), .RN(n1501), .Q(d_ff_Zn[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(n924), .CK(clk), .RN(n1505), .Q(d_ff_Zn[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(n923), .CK(clk), .RN(n1500), .Q(d_ff_Zn[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(n922), .CK(clk), .RN(n1499), .Q(d_ff_Zn[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(n921), .CK(clk), .RN(n1497), .Q(d_ff_Zn[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(n920), .CK(clk), .RN(n1504), .Q(d_ff_Zn[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(n919), .CK(clk), .RN(n1502), .Q(d_ff_Zn[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(n918), .CK(clk), .RN(n1501), .Q(d_ff_Zn[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(n917), .CK(clk), .RN(n1505), .QN(n1107) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(n916), .CK(clk), .RN(n1500), .QN(n1082) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(n915), .CK(clk), .RN(n1501), .QN(n1083) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(n914), .CK(clk), .RN(n1505), .QN(n1084) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(n913), .CK(clk), .RN(n1500), .QN(n1085) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(n912), .CK(clk), .RN(n1499), .QN(n1086) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(n911), .CK(clk), .RN(n1497), .QN(n1087) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(n910), .CK(clk), .RN(n1504), .QN(n1088) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(n909), .CK(clk), .RN(n1502), .QN(n1074) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(n908), .CK(clk), .RN(n1501), .QN(n1075) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(n907), .CK(clk), .RN(n1505), .QN(n1089) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(n906), .CK(clk), .RN(n1500), .QN(n1090) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(n905), .CK(clk), .RN(n1499), .QN(n1091) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(n904), .CK(clk), .RN(n1497), .QN(n1092) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(n903), .CK(clk), .RN(n1498), .QN(n1093) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(n902), .CK(clk), .RN(n1177), .QN(n1094) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(n901), .CK(clk), .RN(n1496), .QN(n1095) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(n900), .CK(clk), .RN(n1506), .QN(n1096) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(n899), .CK(clk), .RN(n1498), .QN(n1097) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(n898), .CK(clk), .RN(n1495), .QN(n1098) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(n897), .CK(clk), .RN(n1503), .QN(n1099) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(n895), .CK(clk), .RN(n1496), .QN(n1100) );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(n893), .CK(clk), .RN(n1177), .QN(n1101) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(n892), .CK(clk), .RN(n1506), .QN(n1102) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(n891), .CK(clk), .RN(n1504), .QN(n1103) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(n890), .CK(clk), .RN(n1502), .QN(n1104) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(n888), .CK(clk), .RN(n1501), .QN(n1105) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(n887), .CK(clk), .RN(n1500), .QN(n1106) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(n885), .CK(clk), .RN(n1499), .QN(n1076) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(n853), .CK(clk), .RN(n1497), .Q(
        data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(n852), .CK(clk), .RN(n1504), .Q(
        data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(n851), .CK(clk), .RN(n1502), .Q(
        data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(n850), .CK(clk), .RN(n1506), .Q(
        data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(n849), .CK(clk), .RN(n1495), .Q(
        data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(n848), .CK(clk), .RN(n1503), .Q(
        data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(n847), .CK(clk), .RN(n1496), .Q(
        data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(n846), .CK(clk), .RN(n1496), .Q(
        data_output[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(n877), .CK(clk), .RN(n1506), .QN(n1108) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(n845), .CK(clk), .RN(n1498), .Q(
        data_output[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(n876), .CK(clk), .RN(n1496), .QN(n1109) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(n844), .CK(clk), .RN(n1496), .Q(
        data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(n843), .CK(clk), .RN(n1177), .Q(
        data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(n842), .CK(clk), .RN(n1495), .Q(
        data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(n841), .CK(clk), .RN(n1506), .Q(
        data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(n840), .CK(clk), .RN(n1503), .Q(
        data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(n839), .CK(clk), .RN(n1498), .Q(
        data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(n838), .CK(clk), .RN(n1494), .Q(
        data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(n837), .CK(clk), .RN(n1494), .Q(
        data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(n836), .CK(clk), .RN(n1491), .Q(
        data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(n835), .CK(clk), .RN(n1491), .Q(
        data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(n834), .CK(clk), .RN(n1487), .Q(
        data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(n833), .CK(clk), .RN(n1504), .Q(
        data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(n832), .CK(clk), .RN(n1489), .Q(
        data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(n831), .CK(clk), .RN(n1487), .Q(
        data_output[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(n862), .CK(clk), .RN(n1491), .QN(n1110) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(n830), .CK(clk), .RN(n1488), .Q(
        data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(n829), .CK(clk), .RN(n1487), .Q(
        data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(n828), .CK(clk), .RN(n1493), .Q(
        data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(n827), .CK(clk), .RN(n1492), .Q(
        data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(n826), .CK(clk), .RN(n1489), .Q(
        data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(n825), .CK(clk), .RN(n1488), .Q(
        data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(n824), .CK(clk), .RN(n1487), .Q(
        data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(n823), .CK(clk), .RN(n1491), .Q(
        data_output[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(n854), .CK(clk), .RN(n1493), .QN(n1081) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(n822), .CK(clk), .RN(n1492), .Q(
        data_output[31]) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(n821), .CK(clk), .RN(n1490), .Q(
        d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n820), .CK(clk), .RN(n1488), .Q(
        d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n819), .CK(clk), .RN(n1501), .Q(
        d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n818), .CK(clk), .RN(n1486), .Q(
        d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(n817), .CK(clk), .RN(n1500), .Q(
        d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(n815), .CK(clk), .RN(n1490), .Q(
        d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n813), .CK(clk), .RN(n1494), .Q(
        d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n812), .CK(clk), .RN(n1499), .QN(n1169) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n811), .CK(clk), .RN(n1504), .Q(
        d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n810), .CK(clk), .RN(n1497), .QN(n1172) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n809), .CK(clk), .RN(n1501), .Q(
        d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n806), .CK(clk), .RN(n1493), .QN(n1171) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n805), .CK(clk), .RN(n1492), .Q(
        d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n804), .CK(clk), .RN(n1490), .Q(
        d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(n803), .CK(clk), .RN(n1488), .Q(
        d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n802), .CK(clk), .RN(n1489), .Q(
        d_ff3_LUT_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(n713), .CK(clk), .RN(n1489), .Q(
        d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(n712), .CK(clk), .RN(n1491), .Q(
        d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(n711), .CK(clk), .RN(n1493), .Q(
        d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(n710), .CK(clk), .RN(n1492), .Q(
        d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(n709), .CK(clk), .RN(n1490), .Q(
        d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(n708), .CK(clk), .RN(n1490), .Q(
        d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(n707), .CK(clk), .RN(n1488), .Q(
        d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(n706), .CK(clk), .RN(n1489), .Q(
        d_ff3_sh_y_out[30]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(n649), .CK(clk), .RN(n1487), .Q(
        d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(n648), .CK(clk), .RN(n1491), .Q(
        d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(n647), .CK(clk), .RN(n1493), .Q(
        d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(n646), .CK(clk), .RN(n1492), .Q(
        d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(n645), .CK(clk), .RN(n1490), .Q(
        d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(n644), .CK(clk), .RN(n1489), .Q(
        d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(n643), .CK(clk), .RN(n1488), .QN(n1170)
         );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(n642), .CK(clk), .RN(n1487), .Q(
        d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(n799), .CK(clk), .RN(n1489), .Q(
        d_ff2_Z[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(n798), .CK(clk), .RN(n1487), .Q(
        d_ff2_Z[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(n796), .CK(clk), .RN(n1493), .Q(
        d_ff2_Z[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(n795), .CK(clk), .RN(n1492), .Q(
        d_ff2_Z[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(n794), .CK(clk), .RN(n1490), .Q(
        d_ff2_Z[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(n793), .CK(clk), .RN(n1489), .Q(
        d_ff2_Z[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(n792), .CK(clk), .RN(n1488), .Q(
        d_ff2_Z[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(n791), .CK(clk), .RN(n1487), .Q(
        d_ff2_Z[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(n789), .CK(clk), .RN(n1493), .Q(
        d_ff2_Z[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(n788), .CK(clk), .RN(n1492), .Q(
        d_ff2_Z[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(n787), .CK(clk), .RN(n1491), .Q(
        d_ff2_Z[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(n786), .CK(clk), .RN(n1493), .Q(
        d_ff2_Z[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(n785), .CK(clk), .RN(n1492), .Q(
        d_ff2_Z[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(n784), .CK(clk), .RN(n1490), .Q(
        d_ff2_Z[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(n783), .CK(clk), .RN(n1488), .Q(
        d_ff2_Z[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(n782), .CK(clk), .RN(n1488), .Q(
        d_ff2_Z[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(n781), .CK(clk), .RN(n1487), .Q(
        d_ff2_Z[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(n779), .CK(clk), .RN(n1493), .Q(
        d_ff2_Z[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(n778), .CK(clk), .RN(n1492), .Q(
        d_ff2_Z[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(n777), .CK(clk), .RN(n1490), .Q(
        d_ff2_Z[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(n776), .CK(clk), .RN(n1489), .Q(
        d_ff2_Z[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(n775), .CK(clk), .RN(n1504), .Q(
        d_ff2_Z[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(n774), .CK(clk), .RN(n1499), .Q(
        d_ff2_Z[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(n773), .CK(clk), .RN(n1505), .Q(
        d_ff2_Z[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(n772), .CK(clk), .RN(n1502), .Q(
        d_ff2_Z[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(n771), .CK(clk), .RN(n1494), .Q(
        d_ff2_Z[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(n770), .CK(clk), .RN(n1493), .Q(
        d_ff2_Z[30]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(n766), .CK(clk), .RN(n1505), .Q(
        d_ff3_sh_y_out[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(n765), .CK(clk), .RN(n1499), .QN(
        n1062) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(n764), .CK(clk), .RN(n1499), .Q(
        d_ff3_sh_y_out[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(n763), .CK(clk), .RN(n1491), .QN(
        n1063) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(n762), .CK(clk), .RN(n1490), .Q(
        d_ff3_sh_y_out[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(n761), .CK(clk), .RN(n1488), .QN(
        n1064) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(n760), .CK(clk), .RN(n1489), .Q(
        d_ff3_sh_y_out[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(n759), .CK(clk), .RN(n1489), .QN(
        n1071) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(n758), .CK(clk), .RN(n1491), .Q(
        d_ff3_sh_y_out[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(n757), .CK(clk), .RN(n1493), .QN(
        n1065) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(n756), .CK(clk), .RN(n1492), .Q(
        d_ff3_sh_y_out[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(n755), .CK(clk), .RN(n1490), .QN(
        n1066) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(n754), .CK(clk), .RN(n1489), .Q(
        d_ff3_sh_y_out[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(n753), .CK(clk), .RN(n1488), .QN(
        n1067) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(n752), .CK(clk), .RN(n1487), .Q(
        d_ff3_sh_y_out[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(n751), .CK(clk), .RN(n1494), .QN(
        n1059) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(n750), .CK(clk), .RN(n1492), .Q(
        d_ff3_sh_y_out[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(n749), .CK(clk), .RN(n1486), .QN(
        n1079) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(n748), .CK(clk), .RN(n1493), .Q(
        d_ff3_sh_y_out[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(n747), .CK(clk), .RN(n1504), 
        .QN(n1072) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(n746), .CK(clk), .RN(n1494), .Q(
        d_ff3_sh_y_out[10]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(n744), .CK(clk), .RN(n1505), .Q(
        d_ff3_sh_y_out[11]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(n742), .CK(clk), .RN(n1494), .Q(
        d_ff3_sh_y_out[12]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(n740), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_y_out[13]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(n738), .CK(clk), .RN(n1494), .Q(
        d_ff3_sh_y_out[14]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(n736), .CK(clk), .RN(n1491), .Q(
        d_ff3_sh_y_out[15]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(n734), .CK(clk), .RN(n1490), .Q(
        d_ff3_sh_y_out[16]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(n732), .CK(clk), .RN(n1501), .Q(
        d_ff3_sh_y_out[17]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(n730), .CK(clk), .RN(n1490), .Q(
        d_ff3_sh_y_out[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(n729), .CK(clk), .RN(n1501), 
        .QN(n1073) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(n728), .CK(clk), .RN(n1494), .Q(
        d_ff3_sh_y_out[19]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(n726), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_y_out[20]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(n724), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_y_out[21]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(n722), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_y_out[22]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(n704), .CK(clk), .RN(n1486), .Q(
        d_ff3_sh_y_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(n702), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_x_out[0]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(n700), .CK(clk), .RN(n1486), .Q(
        d_ff3_sh_x_out[1]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(n698), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_x_out[2]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(n696), .CK(clk), .RN(n1486), .Q(
        d_ff3_sh_x_out[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(n695), .CK(clk), .RN(n1485), .QN(
        n1077) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(n694), .CK(clk), .RN(n1483), .Q(
        d_ff3_sh_x_out[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(n693), .CK(clk), .RN(n1507), .QN(
        n1056) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(n692), .CK(clk), .RN(n1485), .Q(
        d_ff3_sh_x_out[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(n691), .CK(clk), .RN(n1483), .QN(
        n1057) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(n690), .CK(clk), .RN(n1507), .Q(
        d_ff3_sh_x_out[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(n689), .CK(clk), .RN(n1485), .QN(
        n1058) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(n688), .CK(clk), .RN(n1483), .Q(
        d_ff3_sh_x_out[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(n687), .CK(clk), .RN(n1507), .QN(
        n1068) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(n686), .CK(clk), .RN(n1485), .Q(
        d_ff3_sh_x_out[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(n685), .CK(clk), .RN(n1483), .QN(
        n1069) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(n684), .CK(clk), .RN(n1507), .Q(
        d_ff3_sh_x_out[9]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(n682), .CK(clk), .RN(n1486), .Q(
        d_ff3_sh_x_out[10]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(n680), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_x_out[11]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(n678), .CK(clk), .RN(n1486), .Q(
        d_ff3_sh_x_out[12]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(n676), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_x_out[13]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(n674), .CK(clk), .RN(n1486), .Q(
        d_ff3_sh_x_out[14]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(n672), .CK(clk), .RN(n1484), .Q(
        d_ff3_sh_x_out[15]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(n670), .CK(clk), .RN(n1485), .Q(
        d_ff3_sh_x_out[16]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(n668), .CK(clk), .RN(n1507), .Q(
        d_ff3_sh_x_out[17]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(n666), .CK(clk), .RN(n281), .Q(
        d_ff3_sh_x_out[18]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(n664), .CK(clk), .RN(n281), .Q(
        d_ff3_sh_x_out[19]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(n662), .CK(clk), .RN(n1507), .Q(
        d_ff3_sh_x_out[20]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(n660), .CK(clk), .RN(n1483), .Q(
        d_ff3_sh_x_out[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(n659), .CK(clk), .RN(n1507), 
        .QN(n1078) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(n658), .CK(clk), .RN(n1485), .Q(
        d_ff3_sh_x_out[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_25_ ( .D(n655), .CK(clk), .RN(n1483), 
        .QN(n1060) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_26_ ( .D(n654), .CK(clk), .RN(n1507), 
        .QN(n1061) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(n650), .CK(clk), .RN(n1485), 
        .QN(n1080) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(n641), .CK(clk), .RN(n1483), 
        .QN(n1070) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(n640), .CK(clk), .RN(n1507), .Q(
        d_ff3_sh_x_out[31]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_28_ ( .D(n716), .CK(clk), .RN(n1494), .Q(
        d_ff2_Y[28]), .QN(n1480) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(n983), .CK(clk), .RN(n1501), .Q(
        d_ff1_shift_region_flag_out[0]), .QN(n1479) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_23_ ( .D(n721), .CK(clk), .RN(n1483), .Q(
        d_ff2_Y[23]), .QN(n1478) );
  DFFRX1TS reg_LUT_Q_reg_15_ ( .D(n808), .CK(clk), .RN(n1502), .QN(n1476) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(n656), .CK(clk), .RN(n1485), .Q(
        d_ff2_X[24]), .QN(n1475) );
  DFFRX2TS ITER_CONT_temp_reg_1_ ( .D(n988), .CK(clk), .RN(n1495), .Q(
        cont_iter_out[1]), .QN(n1474) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(clk), .RN(n1503), .Q(
        inst_CORDIC_FSM_v3_state_reg[6]), .QN(n1473) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(n982), .CK(clk), .RN(n1500), .Q(
        d_ff1_shift_region_flag_out[1]), .QN(n1472) );
  DFFRX2TS ITER_CONT_temp_reg_3_ ( .D(n986), .CK(clk), .RN(n1506), .Q(
        cont_iter_out[3]), .QN(n1471) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(n984), .CK(clk), .RN(n1499), .Q(
        d_ff1_operation_out), .QN(n1470) );
  DFFRX1TS VAR_CONT_temp_reg_1_ ( .D(n990), .CK(clk), .RN(n1495), .Q(
        cont_var_out[1]), .QN(n1469) );
  DFFRX2TS VAR_CONT_temp_reg_0_ ( .D(n985), .CK(clk), .RN(n1503), .Q(
        cont_var_out[0]), .QN(n1468) );
  DFFRX2TS ITER_CONT_temp_reg_2_ ( .D(n987), .CK(clk), .RN(n1498), .Q(n1481), 
        .QN(intadd_366_B_1_) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(n652), .CK(clk), .RN(n1483), .Q(
        d_ff2_X[28]), .QN(n1477) );
  DFFSX1TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(clk), .SN(n1503), .Q(
        inst_CORDIC_FSM_v3_state_reg[0]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(clk), .RN(n1177), .Q(
        inst_CORDIC_FSM_v3_state_reg[5]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(clk), .RN(n1496), .Q(
        inst_CORDIC_FSM_v3_state_reg[7]) );
  DFFRX2TS reg_val_muxY_2stage_Q_reg_27_ ( .D(n717), .CK(clk), .RN(n1486), .Q(
        d_ff2_Y[27]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_27_ ( .D(n653), .CK(clk), .RN(n1485), .Q(
        d_ff2_X[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_23_ ( .D(n657), .CK(clk), .RN(n1507), .Q(
        d_ff2_X[23]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(n715), .CK(clk), .RN(n1484), .Q(
        d_ff2_Y[29]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(n651), .CK(clk), .RN(n1483), .Q(
        d_ff2_X[29]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(n718), .CK(clk), .RN(n1494), .Q(
        d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(n719), .CK(clk), .RN(n1494), .Q(
        d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(n720), .CK(clk), .RN(n281), .Q(
        d_ff2_Y[24]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_30_ ( .D(n714), .CK(clk), .RN(n1486), .Q(
        d_ff2_Y[30]) );
  DFFRX1TS reg_LUT_Q_reg_27_ ( .D(n801), .CK(clk), .RN(n1489), .Q(
        d_ff3_LUT_out[27]) );
  DFFRX1TS d_ff4_Xn_Q_reg_26_ ( .D(n859), .CK(clk), .RN(n1491), .Q(d_ff_Xn[26]) );
  DFFRX1TS d_ff4_Xn_Q_reg_25_ ( .D(n860), .CK(clk), .RN(n1492), .Q(d_ff_Xn[25]) );
  DFFRX1TS d_ff4_Xn_Q_reg_20_ ( .D(n865), .CK(clk), .RN(n1492), .Q(d_ff_Xn[20]) );
  DFFRX1TS d_ff4_Xn_Q_reg_19_ ( .D(n866), .CK(clk), .RN(n1494), .Q(d_ff_Xn[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_17_ ( .D(n868), .CK(clk), .RN(n1494), .Q(d_ff_Xn[17]) );
  DFFRX1TS d_ff4_Xn_Q_reg_16_ ( .D(n869), .CK(clk), .RN(n1505), .Q(d_ff_Xn[16]) );
  DFFRX1TS d_ff4_Xn_Q_reg_14_ ( .D(n871), .CK(clk), .RN(n1498), .Q(d_ff_Xn[14]) );
  DFFRX1TS d_ff4_Xn_Q_reg_13_ ( .D(n872), .CK(clk), .RN(n1503), .Q(d_ff_Xn[13]) );
  DFFRX1TS d_ff4_Xn_Q_reg_12_ ( .D(n873), .CK(clk), .RN(n1506), .Q(d_ff_Xn[12]) );
  DFFRX1TS d_ff4_Xn_Q_reg_10_ ( .D(n875), .CK(clk), .RN(n1495), .Q(d_ff_Xn[10]) );
  DFFRX1TS d_ff4_Xn_Q_reg_7_ ( .D(n878), .CK(clk), .RN(n1503), .Q(d_ff_Xn[7])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_6_ ( .D(n879), .CK(clk), .RN(n1495), .Q(d_ff_Xn[6])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_5_ ( .D(n880), .CK(clk), .RN(n1496), .Q(d_ff_Xn[5])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_3_ ( .D(n882), .CK(clk), .RN(n1496), .Q(d_ff_Xn[3])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_2_ ( .D(n883), .CK(clk), .RN(n1505), .Q(d_ff_Xn[2])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_1_ ( .D(n884), .CK(clk), .RN(n1497), .Q(d_ff_Xn[1])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_28_ ( .D(n857), .CK(clk), .RN(n1492), .Q(d_ff_Xn[28]) );
  DFFRX1TS d_ff4_Xn_Q_reg_24_ ( .D(n861), .CK(clk), .RN(n1493), .Q(d_ff_Xn[24]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_22_ ( .D(n723), .CK(clk), .RN(n281), .Q(
        d_ff2_Y[22]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_20_ ( .D(n727), .CK(clk), .RN(n281), .Q(
        d_ff2_Y[20]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_18_ ( .D(n731), .CK(clk), .RN(n1485), .Q(
        d_ff2_Y[18]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_16_ ( .D(n735), .CK(clk), .RN(n1493), .Q(
        d_ff2_Y[16]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_15_ ( .D(n737), .CK(clk), .RN(n1492), .Q(
        d_ff2_Y[15]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_14_ ( .D(n739), .CK(clk), .RN(n1486), .Q(
        d_ff2_Y[14]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_13_ ( .D(n741), .CK(clk), .RN(n1507), .Q(
        d_ff2_Y[13]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_12_ ( .D(n743), .CK(clk), .RN(n1502), .Q(
        d_ff2_Y[12]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_11_ ( .D(n745), .CK(clk), .RN(n1491), .Q(
        d_ff2_Y[11]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_0_ ( .D(n767), .CK(clk), .RN(n1502), .Q(
        d_ff2_Y[0]) );
  DFFRX1TS d_ff4_Xn_Q_reg_22_ ( .D(n863), .CK(clk), .RN(n1489), .Q(d_ff_Xn[22]) );
  DFFRX1TS d_ff4_Xn_Q_reg_21_ ( .D(n864), .CK(clk), .RN(n1490), .Q(d_ff_Xn[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_18_ ( .D(n867), .CK(clk), .RN(n281), .Q(d_ff_Xn[18])
         );
  DFFRX1TS d_ff4_Xn_Q_reg_15_ ( .D(n870), .CK(clk), .RN(n1490), .Q(d_ff_Xn[15]) );
  DFFRX1TS d_ff4_Xn_Q_reg_11_ ( .D(n874), .CK(clk), .RN(n1496), .Q(d_ff_Xn[11]) );
  DFFRX1TS d_ff4_Xn_Q_reg_30_ ( .D(n855), .CK(clk), .RN(n1493), .Q(d_ff_Xn[30]) );
  DFFRX1TS d_ff4_Yn_Q_reg_21_ ( .D(n896), .CK(clk), .RN(n1506), .Q(d_ff_Yn[21]) );
  DFFRX1TS d_ff4_Yn_Q_reg_28_ ( .D(n889), .CK(clk), .RN(n1499), .Q(d_ff_Yn[28]) );
  DFFRX1TS d_ff4_Yn_Q_reg_23_ ( .D(n894), .CK(clk), .RN(n1498), .Q(d_ff_Yn[23]) );
  DFFRX1TS d_ff4_Yn_Q_reg_31_ ( .D(n886), .CK(clk), .RN(n1500), .Q(d_ff_Yn[31]) );
  DFFRX1TS reg_LUT_Q_reg_7_ ( .D(n814), .CK(clk), .RN(n1492), .Q(
        d_ff3_LUT_out[7]) );
  DFFRX1TS reg_LUT_Q_reg_5_ ( .D(n816), .CK(clk), .RN(n1494), .Q(
        d_ff3_LUT_out[5]) );
  DFFRX1TS reg_sign_Q_reg_0_ ( .D(n768), .CK(clk), .RN(n1489), .Q(
        d_ff3_sign_out) );
  DFFRX1TS reg_LUT_Q_reg_19_ ( .D(n807), .CK(clk), .RN(n1490), .Q(
        d_ff3_LUT_out[19]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_17_ ( .D(n669), .CK(clk), .RN(n1483), .Q(
        d_ff2_X[17]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_16_ ( .D(n671), .CK(clk), .RN(n1507), .Q(
        d_ff2_X[16]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(clk), .RN(n1496), .Q(
        inst_CORDIC_FSM_v3_state_reg[4]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(n1482), .CK(clk), .RN(
        n1504), .Q(inst_CORDIC_FSM_v3_state_reg[3]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(clk), .RN(n1505), .Q(
        inst_CORDIC_FSM_v3_state_reg[1]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_31_ ( .D(n769), .CK(clk), .RN(n1494), .Q(
        d_ff2_Z[31]) );
  DFFRX1TS d_ff4_Xn_Q_reg_27_ ( .D(n858), .CK(clk), .RN(n1487), .Q(d_ff_Xn[27]) );
  DFFRX1TS d_ff4_Xn_Q_reg_29_ ( .D(n856), .CK(clk), .RN(n1489), .Q(d_ff_Xn[29]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_17_ ( .D(n733), .CK(clk), .RN(n1494), .Q(
        d_ff2_Y[17]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_21_ ( .D(n725), .CK(clk), .RN(n281), .Q(
        d_ff2_Y[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_4_ ( .D(n881), .CK(clk), .RN(n1177), .Q(d_ff_Xn[4])
         );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_1_ ( .D(n701), .CK(clk), .RN(n1484), .Q(
        d_ff2_X[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_2_ ( .D(n699), .CK(clk), .RN(n1486), .Q(
        d_ff2_X[2]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_3_ ( .D(n697), .CK(clk), .RN(n1484), .Q(
        d_ff2_X[3]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_10_ ( .D(n683), .CK(clk), .RN(n1486), .Q(
        d_ff2_X[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_12_ ( .D(n679), .CK(clk), .RN(n1484), .Q(
        d_ff2_X[12]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_13_ ( .D(n677), .CK(clk), .RN(n1486), .Q(
        d_ff2_X[13]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_14_ ( .D(n675), .CK(clk), .RN(n1484), .Q(
        d_ff2_X[14]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_19_ ( .D(n665), .CK(clk), .RN(n281), .Q(
        d_ff2_X[19]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_20_ ( .D(n663), .CK(clk), .RN(n281), .Q(
        d_ff2_X[20]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_31_ ( .D(n705), .CK(clk), .RN(n1486), .Q(
        d_ff2_Y[31]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_0_ ( .D(n703), .CK(clk), .RN(n1484), .Q(
        d_ff2_X[0]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_11_ ( .D(n681), .CK(clk), .RN(n1486), .Q(
        d_ff2_X[11]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_15_ ( .D(n673), .CK(clk), .RN(n1484), .Q(
        d_ff2_X[15]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_18_ ( .D(n667), .CK(clk), .RN(n281), .Q(
        d_ff2_X[18]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_21_ ( .D(n661), .CK(clk), .RN(n1507), .Q(
        d_ff2_X[21]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(
        inst_CORDIC_FSM_v3_state_next[2]), .CK(clk), .RN(n1502), .Q(
        inst_CORDIC_FSM_v3_state_reg[2]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_20_ ( .D(n780), .CK(clk), .RN(n1491), .Q(
        d_ff2_Z[20]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_3_ ( .D(n797), .CK(clk), .RN(n1491), .Q(
        d_ff2_Z[3]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_10_ ( .D(n790), .CK(clk), .RN(n1491), .Q(
        d_ff2_Z[10]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_0_ ( .D(n800), .CK(clk), .RN(n1491), .Q(
        d_ff2_Z[0]) );
  ADDFX1TS intadd_366_U4 ( .A(d_ff2_Y[24]), .B(n1474), .CI(intadd_366_CI), 
        .CO(intadd_366_n3), .S(intadd_366_SUM_0_) );
  ADDFX1TS intadd_366_U3 ( .A(d_ff2_Y[25]), .B(intadd_366_B_1_), .CI(
        intadd_366_n3), .CO(intadd_366_n2), .S(intadd_366_SUM_1_) );
  ADDFX1TS intadd_366_U2 ( .A(d_ff2_Y[26]), .B(n1471), .CI(intadd_366_n2), 
        .CO(intadd_366_n1), .S(intadd_366_SUM_2_) );
  AOI222X1TS U705 ( .A0(n1437), .A1(d_ff2_Z[28]), .B0(n1243), .B1(d_ff1_Z[28]), 
        .C0(d_ff_Zn[28]), .C1(n1432), .Y(n1232) );
  AOI222X1TS U706 ( .A0(n1437), .A1(d_ff2_Z[30]), .B0(n1259), .B1(d_ff1_Z[30]), 
        .C0(d_ff_Zn[30]), .C1(n1432), .Y(n1233) );
  AOI222X1TS U707 ( .A0(n1437), .A1(d_ff2_Z[29]), .B0(n1259), .B1(d_ff1_Z[29]), 
        .C0(d_ff_Zn[29]), .C1(n1432), .Y(n1229) );
  AOI222X1TS U708 ( .A0(n1437), .A1(d_ff2_Z[27]), .B0(n1259), .B1(d_ff1_Z[27]), 
        .C0(d_ff_Zn[27]), .C1(n1432), .Y(n1228) );
  AOI222X1TS U709 ( .A0(n1430), .A1(d_ff2_Z[23]), .B0(n1243), .B1(d_ff1_Z[23]), 
        .C0(d_ff_Zn[23]), .C1(n1465), .Y(n1252) );
  AOI222X1TS U710 ( .A0(n1430), .A1(d_ff2_Z[24]), .B0(n1243), .B1(d_ff1_Z[24]), 
        .C0(d_ff_Zn[24]), .C1(n1427), .Y(n1251) );
  AOI222X1TS U711 ( .A0(n1299), .A1(d_ff3_sh_x_out[2]), .B0(n1362), .B1(
        d_ff3_sh_y_out[2]), .C0(n1369), .C1(d_ff3_LUT_out[2]), .Y(n1296) );
  AOI222X1TS U712 ( .A0(n1299), .A1(d_ff3_sh_x_out[0]), .B0(n1362), .B1(
        d_ff3_sh_y_out[0]), .C0(n1369), .C1(d_ff3_LUT_out[0]), .Y(n1289) );
  AOI222X1TS U713 ( .A0(n1299), .A1(d_ff3_sh_x_out[1]), .B0(n1362), .B1(
        d_ff3_sh_y_out[1]), .C0(n1369), .C1(d_ff3_LUT_out[1]), .Y(n1290) );
  AOI222X1TS U714 ( .A0(n1299), .A1(d_ff2_Y[21]), .B0(n1362), .B1(d_ff2_X[21]), 
        .C0(d_ff2_Z[21]), .C1(n1366), .Y(n1297) );
  AOI222X1TS U715 ( .A0(n1299), .A1(d_ff2_Y[26]), .B0(n1362), .B1(n1167), .C0(
        d_ff2_Z[26]), .C1(n1366), .Y(n1288) );
  AOI222X1TS U716 ( .A0(n1299), .A1(d_ff2_Y[25]), .B0(n1362), .B1(n1168), .C0(
        d_ff2_Z[25]), .C1(n1366), .Y(n1298) );
  AOI222X1TS U717 ( .A0(n1299), .A1(n1152), .B0(n1362), .B1(d_ff2_X[19]), .C0(
        d_ff2_Z[19]), .C1(n1367), .Y(n1291) );
  AOI222X1TS U718 ( .A0(n1299), .A1(d_ff2_Y[22]), .B0(n1362), .B1(n1148), .C0(
        d_ff2_Z[22]), .C1(n1366), .Y(n1294) );
  AOI222X1TS U719 ( .A0(n1299), .A1(d_ff2_Y[17]), .B0(n1357), .B1(d_ff2_X[17]), 
        .C0(d_ff2_Z[17]), .C1(n1367), .Y(n1277) );
  AOI222X1TS U720 ( .A0(n1299), .A1(d_ff2_Y[11]), .B0(n1357), .B1(d_ff2_X[11]), 
        .C0(d_ff2_Z[11]), .C1(n1367), .Y(n1281) );
  AOI222X1TS U721 ( .A0(n1299), .A1(d_ff2_Y[18]), .B0(n1357), .B1(d_ff2_X[18]), 
        .C0(d_ff2_Z[18]), .C1(n1367), .Y(n1276) );
  AOI222X1TS U722 ( .A0(n1364), .A1(n1155), .B0(n1372), .B1(n1150), .C0(
        d_ff2_Z[8]), .C1(n1369), .Y(n1273) );
  AOI222X1TS U723 ( .A0(n1299), .A1(n1161), .B0(n1210), .B1(d_ff2_X[2]), .C0(
        d_ff2_Z[2]), .C1(n1369), .Y(n1265) );
  AOI222X1TS U724 ( .A0(n1299), .A1(n1156), .B0(n1210), .B1(n1163), .C0(
        d_ff2_Z[7]), .C1(n1369), .Y(n1263) );
  AOI222X1TS U725 ( .A0(n1299), .A1(n1159), .B0(n1372), .B1(n1151), .C0(
        d_ff2_Z[4]), .C1(n1367), .Y(n1272) );
  AOI222X1TS U726 ( .A0(n1206), .A1(d_ff3_sh_x_out[6]), .B0(n1362), .B1(
        d_ff3_sh_y_out[6]), .C0(d_ff3_LUT_out[6]), .C1(n1366), .Y(n1292) );
  AOI222X1TS U727 ( .A0(n1206), .A1(d_ff3_sh_x_out[4]), .B0(n1362), .B1(
        d_ff3_sh_y_out[4]), .C0(n1369), .C1(d_ff3_LUT_out[4]), .Y(n1301) );
  AOI222X1TS U728 ( .A0(n1206), .A1(d_ff3_sh_x_out[10]), .B0(n1357), .B1(
        d_ff3_sh_y_out[10]), .C0(n1366), .C1(d_ff3_LUT_out[10]), .Y(n1287) );
  AOI222X1TS U729 ( .A0(n1206), .A1(d_ff3_sh_x_out[26]), .B0(n1357), .B1(
        d_ff3_sh_y_out[26]), .C0(n1366), .C1(d_ff3_LUT_out[26]), .Y(n1286) );
  AOI222X1TS U730 ( .A0(n1206), .A1(d_ff3_sh_x_out[23]), .B0(n1357), .B1(
        d_ff3_sh_y_out[23]), .C0(n1367), .C1(d_ff3_LUT_out[23]), .Y(n1284) );
  AOI222X1TS U731 ( .A0(n1206), .A1(d_ff3_sh_x_out[25]), .B0(n1372), .B1(
        d_ff3_sh_y_out[25]), .C0(d_ff3_LUT_out[25]), .C1(n1369), .Y(n1282) );
  AOI222X1TS U732 ( .A0(n1206), .A1(d_ff3_sh_x_out[24]), .B0(n1372), .B1(
        d_ff3_sh_y_out[24]), .C0(n1369), .C1(d_ff3_LUT_out[24]), .Y(n1283) );
  AOI222X1TS U733 ( .A0(n1370), .A1(n1162), .B0(n1210), .B1(d_ff2_X[1]), .C0(
        d_ff2_Z[1]), .C1(n1369), .Y(n1267) );
  AOI222X1TS U734 ( .A0(n1370), .A1(n1158), .B0(n1357), .B1(n1165), .C0(
        d_ff2_Z[5]), .C1(n1369), .Y(n1271) );
  AOI222X1TS U735 ( .A0(n1370), .A1(n1157), .B0(n1210), .B1(n1164), .C0(
        d_ff2_Z[6]), .C1(n1369), .Y(n1264) );
  AOI222X1TS U736 ( .A0(n1370), .A1(n1154), .B0(n1357), .B1(n1149), .C0(
        d_ff2_Z[9]), .C1(n1367), .Y(n1270) );
  AOI222X1TS U737 ( .A0(n1370), .A1(d_ff2_Y[12]), .B0(n1372), .B1(d_ff2_X[12]), 
        .C0(d_ff2_Z[12]), .C1(n1367), .Y(n1278) );
  AOI222X1TS U738 ( .A0(n1370), .A1(d_ff2_Y[14]), .B0(n1357), .B1(d_ff2_X[14]), 
        .C0(d_ff2_Z[14]), .C1(n1367), .Y(n1275) );
  AOI222X1TS U739 ( .A0(n1370), .A1(d_ff2_Y[15]), .B0(n1357), .B1(d_ff2_X[15]), 
        .C0(d_ff2_Z[15]), .C1(n1367), .Y(n1280) );
  AOI222X1TS U740 ( .A0(n1370), .A1(d_ff2_Y[16]), .B0(n1372), .B1(d_ff2_X[16]), 
        .C0(d_ff2_Z[16]), .C1(n1367), .Y(n1279) );
  AOI222X1TS U741 ( .A0(n1370), .A1(d_ff2_Y[13]), .B0(n1362), .B1(d_ff2_X[13]), 
        .C0(d_ff2_Z[13]), .C1(n1367), .Y(n1295) );
  CLKINVX6TS U742 ( .A(n1223), .Y(n1210) );
  NOR2XLTS U743 ( .A(n1373), .B(n1352), .Y(n1302) );
  NAND2X4TS U744 ( .A(n1206), .B(ready_add_subt), .Y(n1382) );
  BUFX4TS U745 ( .A(n281), .Y(n1507) );
  CLKINVX6TS U746 ( .A(rst), .Y(n281) );
  AOI222X1TS U747 ( .A0(n1336), .A1(data_output[11]), .B0(n1343), .B1(n1136), 
        .C0(n1324), .C1(d_ff_Xn[11]), .Y(n1323) );
  AOI222X1TS U748 ( .A0(n1336), .A1(data_output[23]), .B0(n1343), .B1(
        d_ff_Yn[23]), .C0(n1346), .C1(n1115), .Y(n1337) );
  AOI222X1TS U749 ( .A0(n1336), .A1(data_output[12]), .B0(n1347), .B1(n1135), 
        .C0(n1324), .C1(d_ff_Xn[12]), .Y(n1311) );
  AOI222X1TS U750 ( .A0(n1336), .A1(data_output[14]), .B0(n1347), .B1(n1133), 
        .C0(n1324), .C1(d_ff_Xn[14]), .Y(n1319) );
  NOR2BX2TS U751 ( .AN(n1305), .B(n1336), .Y(n1306) );
  BUFX4TS U752 ( .A(n1303), .Y(n1336) );
  BUFX6TS U753 ( .A(n1225), .Y(n1243) );
  NOR2X2TS U754 ( .A(ready_cordic), .B(n1302), .Y(n1303) );
  INVX3TS U755 ( .A(n1203), .Y(n1377) );
  NAND2X4TS U756 ( .A(n1357), .B(ready_add_subt), .Y(n1387) );
  CLKBUFX2TS U757 ( .A(n1202), .Y(n1113) );
  NAND3BX1TS U758 ( .AN(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[4]), .C(n1175), .Y(n1350) );
  BUFX4TS U759 ( .A(n1431), .Y(n1428) );
  NOR3BX1TS U760 ( .AN(n1178), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[1]), .Y(n1175) );
  INVX3TS U761 ( .A(n1221), .Y(n1206) );
  NAND3X1TS U762 ( .A(n1469), .B(n1468), .C(ready_add_subt), .Y(n1392) );
  NAND3BXLTS U763 ( .AN(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(n1175), .Y(n1174) );
  BUFX3TS U764 ( .A(n1243), .Y(n1259) );
  NOR2XLTS U765 ( .A(n1247), .B(n1226), .Y(n1225) );
  OR2X1TS U766 ( .A(n1344), .B(n1305), .Y(n1326) );
  AOI222X1TS U767 ( .A0(n1299), .A1(d_ff2_Y[0]), .B0(n1372), .B1(d_ff2_X[0]), 
        .C0(d_ff2_Z[0]), .C1(n1367), .Y(n1274) );
  AOI222X1TS U768 ( .A0(n1364), .A1(n1160), .B0(n1210), .B1(d_ff2_X[3]), .C0(
        d_ff2_Z[3]), .C1(n1369), .Y(n1266) );
  AOI222X1TS U769 ( .A0(n1370), .A1(n1153), .B0(n1357), .B1(d_ff2_X[10]), .C0(
        d_ff2_Z[10]), .C1(n1367), .Y(n1269) );
  AOI222X1TS U770 ( .A0(n1299), .A1(d_ff2_Y[20]), .B0(n1362), .B1(d_ff2_X[20]), 
        .C0(d_ff2_Z[20]), .C1(n1366), .Y(n1293) );
  AOI222X1TS U771 ( .A0(n1299), .A1(d_ff2_Y[31]), .B0(n1362), .B1(n1147), .C0(
        d_ff2_Z[31]), .C1(n1366), .Y(n1300) );
  AO22XLTS U772 ( .A0(n1397), .A1(result_add_subt[4]), .B0(n1393), .B1(
        d_ff_Xn[4]), .Y(n881) );
  AO22XLTS U773 ( .A0(n1397), .A1(result_add_subt[29]), .B0(n1396), .B1(
        d_ff_Xn[29]), .Y(n856) );
  AO22XLTS U774 ( .A0(n1397), .A1(result_add_subt[27]), .B0(n1396), .B1(
        d_ff_Xn[27]), .Y(n858) );
  AO22XLTS U775 ( .A0(n1467), .A1(n1411), .B0(n1446), .B1(d_ff3_LUT_out[19]), 
        .Y(n807) );
  AO22XLTS U776 ( .A0(n1391), .A1(result_add_subt[31]), .B0(n1387), .B1(
        d_ff_Yn[31]), .Y(n886) );
  AO22XLTS U777 ( .A0(n1390), .A1(result_add_subt[23]), .B0(n1389), .B1(
        d_ff_Yn[23]), .Y(n894) );
  AO22XLTS U778 ( .A0(n1390), .A1(result_add_subt[28]), .B0(n1387), .B1(
        d_ff_Yn[28]), .Y(n889) );
  AO22XLTS U779 ( .A0(n1390), .A1(result_add_subt[21]), .B0(n1389), .B1(
        d_ff_Yn[21]), .Y(n896) );
  AO22XLTS U780 ( .A0(n1395), .A1(result_add_subt[30]), .B0(n1396), .B1(
        d_ff_Xn[30]), .Y(n855) );
  AO22XLTS U781 ( .A0(n1397), .A1(result_add_subt[11]), .B0(n1393), .B1(
        d_ff_Xn[11]), .Y(n874) );
  AO22XLTS U782 ( .A0(n1395), .A1(result_add_subt[15]), .B0(n1394), .B1(
        d_ff_Xn[15]), .Y(n870) );
  AO22XLTS U783 ( .A0(n1395), .A1(result_add_subt[18]), .B0(n1394), .B1(
        d_ff_Xn[18]), .Y(n867) );
  AO22XLTS U784 ( .A0(n1395), .A1(result_add_subt[21]), .B0(n1394), .B1(
        d_ff_Xn[21]), .Y(n864) );
  AO22XLTS U785 ( .A0(n1395), .A1(result_add_subt[22]), .B0(n1394), .B1(
        d_ff_Xn[22]), .Y(n863) );
  AO22XLTS U786 ( .A0(n1395), .A1(result_add_subt[24]), .B0(n1396), .B1(
        d_ff_Xn[24]), .Y(n861) );
  AO22XLTS U787 ( .A0(n1395), .A1(result_add_subt[28]), .B0(n1396), .B1(
        d_ff_Xn[28]), .Y(n857) );
  AO22XLTS U788 ( .A0(n1397), .A1(result_add_subt[1]), .B0(n1393), .B1(
        d_ff_Xn[1]), .Y(n884) );
  AO22XLTS U789 ( .A0(n1397), .A1(result_add_subt[2]), .B0(n1393), .B1(
        d_ff_Xn[2]), .Y(n883) );
  AO22XLTS U790 ( .A0(n1397), .A1(result_add_subt[3]), .B0(n1393), .B1(
        d_ff_Xn[3]), .Y(n882) );
  AO22XLTS U791 ( .A0(n1397), .A1(result_add_subt[5]), .B0(n1393), .B1(
        d_ff_Xn[5]), .Y(n880) );
  AO22XLTS U792 ( .A0(n1397), .A1(result_add_subt[6]), .B0(n1393), .B1(
        d_ff_Xn[6]), .Y(n879) );
  AO22XLTS U793 ( .A0(n1397), .A1(result_add_subt[7]), .B0(n1393), .B1(
        d_ff_Xn[7]), .Y(n878) );
  AO22XLTS U794 ( .A0(n1397), .A1(result_add_subt[10]), .B0(n1393), .B1(
        d_ff_Xn[10]), .Y(n875) );
  AO22XLTS U795 ( .A0(n1395), .A1(result_add_subt[12]), .B0(n1394), .B1(
        d_ff_Xn[12]), .Y(n873) );
  AO22XLTS U796 ( .A0(n1395), .A1(result_add_subt[13]), .B0(n1394), .B1(
        d_ff_Xn[13]), .Y(n872) );
  AO22XLTS U797 ( .A0(n1395), .A1(result_add_subt[14]), .B0(n1394), .B1(
        d_ff_Xn[14]), .Y(n871) );
  AO22XLTS U798 ( .A0(n1395), .A1(result_add_subt[16]), .B0(n1394), .B1(
        d_ff_Xn[16]), .Y(n869) );
  AO22XLTS U799 ( .A0(n1395), .A1(result_add_subt[17]), .B0(n1394), .B1(
        d_ff_Xn[17]), .Y(n868) );
  AO22XLTS U800 ( .A0(n1395), .A1(result_add_subt[19]), .B0(n1394), .B1(
        d_ff_Xn[19]), .Y(n866) );
  AO22XLTS U801 ( .A0(n1395), .A1(result_add_subt[20]), .B0(n1394), .B1(
        d_ff_Xn[20]), .Y(n865) );
  AO22XLTS U802 ( .A0(n1397), .A1(result_add_subt[25]), .B0(n1396), .B1(
        d_ff_Xn[25]), .Y(n860) );
  AO22XLTS U803 ( .A0(n1395), .A1(result_add_subt[26]), .B0(n1396), .B1(
        d_ff_Xn[26]), .Y(n859) );
  AO22XLTS U804 ( .A0(d_ff2_Y[23]), .A1(n1437), .B0(n1436), .B1(d_ff_Yn[23]), 
        .Y(n721) );
  AO22XLTS U805 ( .A0(d_ff2_Y[28]), .A1(n1437), .B0(n1436), .B1(d_ff_Yn[28]), 
        .Y(n716) );
  AO22XLTS U806 ( .A0(n1397), .A1(result_add_subt[31]), .B0(n1396), .B1(n1166), 
        .Y(n854) );
  AO22XLTS U807 ( .A0(n1395), .A1(result_add_subt[23]), .B0(n1394), .B1(n1115), 
        .Y(n862) );
  AOI222X1TS U808 ( .A0(n1303), .A1(data_output[16]), .B0(n1347), .B1(n1131), 
        .C0(n1324), .C1(d_ff_Xn[16]), .Y(n1322) );
  AOI222X1TS U809 ( .A0(n1303), .A1(data_output[15]), .B0(n1347), .B1(n1132), 
        .C0(n1324), .C1(d_ff_Xn[15]), .Y(n1315) );
  AOI222X1TS U810 ( .A0(n1336), .A1(data_output[9]), .B0(n1347), .B1(n1138), 
        .C0(n1324), .C1(n1116), .Y(n1321) );
  AO22XLTS U811 ( .A0(n1397), .A1(result_add_subt[9]), .B0(n1393), .B1(n1116), 
        .Y(n876) );
  AOI222X1TS U812 ( .A0(n1336), .A1(data_output[8]), .B0(n1347), .B1(n1139), 
        .C0(n1324), .C1(n1117), .Y(n1312) );
  AO22XLTS U813 ( .A0(n1397), .A1(result_add_subt[8]), .B0(n1393), .B1(n1117), 
        .Y(n877) );
  AOI222X1TS U814 ( .A0(n1336), .A1(data_output[7]), .B0(n1347), .B1(n1140), 
        .C0(n1324), .C1(d_ff_Xn[7]), .Y(n1318) );
  AOI222X1TS U815 ( .A0(n1336), .A1(data_output[6]), .B0(n1343), .B1(n1141), 
        .C0(n1324), .C1(d_ff_Xn[6]), .Y(n1325) );
  AOI222X1TS U816 ( .A0(n1336), .A1(data_output[5]), .B0(n1306), .B1(n1142), 
        .C0(n1324), .C1(d_ff_Xn[5]), .Y(n1314) );
  AOI222X1TS U817 ( .A0(n1336), .A1(data_output[4]), .B0(n1306), .B1(n1143), 
        .C0(n1346), .C1(d_ff_Xn[4]), .Y(n1335) );
  AOI222X1TS U818 ( .A0(n1336), .A1(data_output[3]), .B0(n1306), .B1(n1144), 
        .C0(n1346), .C1(d_ff_Xn[3]), .Y(n1328) );
  AOI222X1TS U819 ( .A0(n1336), .A1(data_output[2]), .B0(n1343), .B1(n1145), 
        .C0(n1346), .C1(d_ff_Xn[2]), .Y(n1331) );
  AOI222X1TS U820 ( .A0(n1336), .A1(data_output[1]), .B0(n1343), .B1(n1146), 
        .C0(n1346), .C1(d_ff_Xn[1]), .Y(n1327) );
  AOI222X1TS U821 ( .A0(n1336), .A1(data_output[0]), .B0(n1118), .B1(n1347), 
        .C0(n1119), .C1(n1346), .Y(n1348) );
  AO22XLTS U822 ( .A0(n1397), .A1(result_add_subt[0]), .B0(n1396), .B1(n1119), 
        .Y(n885) );
  AO22XLTS U823 ( .A0(n1390), .A1(result_add_subt[30]), .B0(n1387), .B1(n1120), 
        .Y(n887) );
  AO22XLTS U824 ( .A0(n1391), .A1(result_add_subt[29]), .B0(n1387), .B1(n1121), 
        .Y(n888) );
  AO22XLTS U825 ( .A0(n1391), .A1(result_add_subt[27]), .B0(n1387), .B1(n1122), 
        .Y(n890) );
  AO22XLTS U826 ( .A0(n1390), .A1(result_add_subt[26]), .B0(n1387), .B1(n1123), 
        .Y(n891) );
  AO22XLTS U827 ( .A0(n1391), .A1(result_add_subt[25]), .B0(n1387), .B1(n1124), 
        .Y(n892) );
  AO22XLTS U828 ( .A0(n1390), .A1(result_add_subt[24]), .B0(n1387), .B1(n1125), 
        .Y(n893) );
  AO22XLTS U829 ( .A0(n1390), .A1(result_add_subt[22]), .B0(n1389), .B1(n1126), 
        .Y(n895) );
  AO22XLTS U830 ( .A0(n1390), .A1(result_add_subt[20]), .B0(n1389), .B1(n1127), 
        .Y(n897) );
  AO22XLTS U831 ( .A0(n1390), .A1(result_add_subt[19]), .B0(n1389), .B1(n1128), 
        .Y(n898) );
  AO22XLTS U832 ( .A0(n1390), .A1(result_add_subt[18]), .B0(n1389), .B1(n1129), 
        .Y(n899) );
  AO22XLTS U833 ( .A0(n1390), .A1(result_add_subt[17]), .B0(n1389), .B1(n1130), 
        .Y(n900) );
  AO22XLTS U834 ( .A0(n1390), .A1(result_add_subt[16]), .B0(n1389), .B1(n1131), 
        .Y(n901) );
  AO22XLTS U835 ( .A0(n1390), .A1(result_add_subt[15]), .B0(n1389), .B1(n1132), 
        .Y(n902) );
  AO22XLTS U836 ( .A0(n1390), .A1(result_add_subt[14]), .B0(n1389), .B1(n1133), 
        .Y(n903) );
  AO22XLTS U837 ( .A0(n1390), .A1(result_add_subt[13]), .B0(n1389), .B1(n1134), 
        .Y(n904) );
  AO22XLTS U838 ( .A0(n1390), .A1(result_add_subt[12]), .B0(n1389), .B1(n1135), 
        .Y(n905) );
  AO22XLTS U839 ( .A0(n1391), .A1(result_add_subt[11]), .B0(n1388), .B1(n1136), 
        .Y(n906) );
  AO22XLTS U840 ( .A0(n1391), .A1(result_add_subt[10]), .B0(n1388), .B1(n1137), 
        .Y(n907) );
  AO22XLTS U841 ( .A0(n1391), .A1(result_add_subt[9]), .B0(n1388), .B1(n1138), 
        .Y(n908) );
  AO22XLTS U842 ( .A0(n1391), .A1(result_add_subt[8]), .B0(n1388), .B1(n1139), 
        .Y(n909) );
  AO22XLTS U843 ( .A0(n1391), .A1(result_add_subt[7]), .B0(n1388), .B1(n1140), 
        .Y(n910) );
  AO22XLTS U844 ( .A0(n1391), .A1(result_add_subt[6]), .B0(n1388), .B1(n1141), 
        .Y(n911) );
  AO22XLTS U845 ( .A0(n1391), .A1(result_add_subt[5]), .B0(n1388), .B1(n1142), 
        .Y(n912) );
  AO22XLTS U846 ( .A0(n1391), .A1(result_add_subt[4]), .B0(n1388), .B1(n1143), 
        .Y(n913) );
  AO22XLTS U847 ( .A0(n1391), .A1(result_add_subt[3]), .B0(n1388), .B1(n1144), 
        .Y(n914) );
  AO22XLTS U848 ( .A0(n1391), .A1(result_add_subt[2]), .B0(n1388), .B1(n1145), 
        .Y(n915) );
  AO22XLTS U849 ( .A0(n1391), .A1(result_add_subt[1]), .B0(n1388), .B1(n1146), 
        .Y(n916) );
  AO22XLTS U850 ( .A0(n1391), .A1(result_add_subt[0]), .B0(n1387), .B1(n1118), 
        .Y(n917) );
  INVX2TS U851 ( .A(n1428), .Y(n1452) );
  INVX2TS U852 ( .A(n1459), .Y(n1111) );
  INVX4TS U853 ( .A(n1459), .Y(n1112) );
  AOI222X4TS U854 ( .A0(n1437), .A1(d_ff2_Z[26]), .B0(n1259), .B1(d_ff1_Z[26]), 
        .C0(d_ff_Zn[26]), .C1(n1432), .Y(n1231) );
  AOI222X4TS U855 ( .A0(n1430), .A1(d_ff2_Z[19]), .B0(n1259), .B1(d_ff1_Z[19]), 
        .C0(d_ff_Zn[19]), .C1(n1427), .Y(n1256) );
  AOI222X4TS U856 ( .A0(n1430), .A1(d_ff2_Z[18]), .B0(n1259), .B1(d_ff1_Z[18]), 
        .C0(d_ff_Zn[18]), .C1(n1465), .Y(n1262) );
  AOI222X4TS U857 ( .A0(n1430), .A1(d_ff2_Z[17]), .B0(n1259), .B1(d_ff1_Z[17]), 
        .C0(d_ff_Zn[17]), .C1(n1418), .Y(n1255) );
  AOI222X4TS U858 ( .A0(n1430), .A1(d_ff2_Z[16]), .B0(n1259), .B1(d_ff1_Z[16]), 
        .C0(d_ff_Zn[16]), .C1(n1427), .Y(n1261) );
  AOI222X4TS U859 ( .A0(n1430), .A1(d_ff2_Z[14]), .B0(n1259), .B1(d_ff1_Z[14]), 
        .C0(d_ff_Zn[14]), .C1(n1427), .Y(n1258) );
  AOI222X4TS U860 ( .A0(n1430), .A1(d_ff2_Z[13]), .B0(n1259), .B1(d_ff1_Z[13]), 
        .C0(d_ff_Zn[13]), .C1(n1465), .Y(n1257) );
  XOR2XLTS U861 ( .A(d_ff_Yn[31]), .B(n1307), .Y(n1308) );
  OAI33X4TS U862 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(
        d_ff1_operation_out), .A2(n1479), .B0(n1472), .B1(n1470), .B2(
        d_ff1_shift_region_flag_out[0]), .Y(n1307) );
  BUFX4TS U863 ( .A(n1493), .Y(n1491) );
  BUFX4TS U864 ( .A(n1498), .Y(n1502) );
  BUFX4TS U865 ( .A(n1506), .Y(n1501) );
  BUFX4TS U866 ( .A(n281), .Y(n1496) );
  BUFX6TS U867 ( .A(n281), .Y(n1494) );
  BUFX4TS U868 ( .A(n1503), .Y(n1493) );
  BUFX4TS U869 ( .A(n1495), .Y(n1492) );
  BUFX4TS U870 ( .A(n1500), .Y(n1490) );
  BUFX4TS U871 ( .A(n1494), .Y(n1489) );
  BUFX4TS U872 ( .A(n1495), .Y(n1505) );
  BUFX4TS U873 ( .A(n1496), .Y(n1500) );
  BUFX4TS U874 ( .A(n1503), .Y(n1499) );
  BUFX4TS U875 ( .A(n1495), .Y(n1504) );
  NOR2X2TS U876 ( .A(cont_iter_out[3]), .B(intadd_366_B_1_), .Y(n1415) );
  NOR2X2TS U877 ( .A(n1471), .B(intadd_366_B_1_), .Y(n1191) );
  CLKINVX6TS U878 ( .A(n1433), .Y(n1464) );
  BUFX6TS U879 ( .A(n1299), .Y(n1370) );
  INVX2TS U880 ( .A(n1080), .Y(n1114) );
  INVX2TS U881 ( .A(n1110), .Y(n1115) );
  INVX2TS U882 ( .A(n1109), .Y(n1116) );
  INVX2TS U883 ( .A(n1108), .Y(n1117) );
  INVX2TS U884 ( .A(n1107), .Y(n1118) );
  INVX2TS U885 ( .A(n1076), .Y(n1119) );
  INVX2TS U886 ( .A(n1106), .Y(n1120) );
  INVX2TS U887 ( .A(n1105), .Y(n1121) );
  INVX2TS U888 ( .A(n1104), .Y(n1122) );
  INVX2TS U889 ( .A(n1103), .Y(n1123) );
  INVX2TS U890 ( .A(n1102), .Y(n1124) );
  INVX2TS U891 ( .A(n1101), .Y(n1125) );
  INVX2TS U892 ( .A(n1100), .Y(n1126) );
  INVX2TS U893 ( .A(n1099), .Y(n1127) );
  INVX2TS U894 ( .A(n1098), .Y(n1128) );
  INVX2TS U895 ( .A(n1097), .Y(n1129) );
  INVX2TS U896 ( .A(n1096), .Y(n1130) );
  INVX2TS U897 ( .A(n1095), .Y(n1131) );
  INVX2TS U898 ( .A(n1094), .Y(n1132) );
  INVX2TS U899 ( .A(n1093), .Y(n1133) );
  INVX2TS U900 ( .A(n1092), .Y(n1134) );
  INVX2TS U901 ( .A(n1091), .Y(n1135) );
  INVX2TS U902 ( .A(n1090), .Y(n1136) );
  INVX2TS U903 ( .A(n1089), .Y(n1137) );
  INVX2TS U904 ( .A(n1075), .Y(n1138) );
  INVX2TS U905 ( .A(n1074), .Y(n1139) );
  INVX2TS U906 ( .A(n1088), .Y(n1140) );
  INVX2TS U907 ( .A(n1087), .Y(n1141) );
  INVX2TS U908 ( .A(n1086), .Y(n1142) );
  INVX2TS U909 ( .A(n1085), .Y(n1143) );
  INVX2TS U910 ( .A(n1084), .Y(n1144) );
  INVX2TS U911 ( .A(n1083), .Y(n1145) );
  INVX2TS U912 ( .A(n1082), .Y(n1146) );
  INVX2TS U913 ( .A(n1070), .Y(n1147) );
  INVX2TS U914 ( .A(n1078), .Y(n1148) );
  INVX2TS U915 ( .A(n1069), .Y(n1149) );
  INVX2TS U916 ( .A(n1068), .Y(n1150) );
  INVX2TS U917 ( .A(n1077), .Y(n1151) );
  INVX2TS U918 ( .A(n1073), .Y(n1152) );
  INVX2TS U919 ( .A(n1072), .Y(n1153) );
  INVX2TS U920 ( .A(n1079), .Y(n1154) );
  INVX2TS U921 ( .A(n1059), .Y(n1155) );
  INVX2TS U922 ( .A(n1067), .Y(n1156) );
  INVX2TS U923 ( .A(n1066), .Y(n1157) );
  INVX2TS U924 ( .A(n1065), .Y(n1158) );
  INVX2TS U925 ( .A(n1071), .Y(n1159) );
  INVX2TS U926 ( .A(n1064), .Y(n1160) );
  INVX2TS U927 ( .A(n1063), .Y(n1161) );
  INVX2TS U928 ( .A(n1062), .Y(n1162) );
  INVX2TS U929 ( .A(n1058), .Y(n1163) );
  INVX2TS U930 ( .A(n1057), .Y(n1164) );
  INVX2TS U931 ( .A(n1056), .Y(n1165) );
  INVX2TS U932 ( .A(n1081), .Y(n1166) );
  INVX2TS U933 ( .A(n1428), .Y(n1463) );
  AOI222X4TS U934 ( .A0(n1344), .A1(data_output[29]), .B0(n1343), .B1(n1121), 
        .C0(n1346), .C1(d_ff_Xn[29]), .Y(n1338) );
  AOI222X1TS U935 ( .A0(n1344), .A1(data_output[27]), .B0(n1343), .B1(n1122), 
        .C0(n1346), .C1(d_ff_Xn[27]), .Y(n1330) );
  CLKINVX6TS U936 ( .A(n1428), .Y(n1429) );
  AOI222X1TS U937 ( .A0(n1437), .A1(d_ff2_Z[31]), .B0(n1259), .B1(d_ff1_Z[31]), 
        .C0(d_ff_Zn[31]), .C1(n1432), .Y(n1230) );
  INVX2TS U938 ( .A(n1061), .Y(n1167) );
  INVX2TS U939 ( .A(n1060), .Y(n1168) );
  AOI211XLTS U940 ( .A0(n1438), .A1(n1474), .B0(n1459), .C0(n1409), .Y(n1188)
         );
  BUFX4TS U941 ( .A(n1446), .Y(n1459) );
  BUFX3TS U942 ( .A(n1433), .Y(n1482) );
  BUFX4TS U943 ( .A(n1206), .Y(n1364) );
  CLKINVX6TS U944 ( .A(n1428), .Y(n1467) );
  NOR3X2TS U945 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[4]), .C(inst_CORDIC_FSM_v3_state_reg[1]), 
        .Y(n1182) );
  NOR4BX1TS U946 ( .AN(inst_CORDIC_FSM_v3_state_reg[1]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(inst_CORDIC_FSM_v3_state_reg[4]), 
        .D(n1179), .Y(n1202) );
  OAI31XLTS U947 ( .A0(cont_iter_out[3]), .A1(n1198), .A2(n1442), .B0(n1189), 
        .Y(n815) );
  AOI32X1TS U948 ( .A0(n1198), .A1(n1463), .A2(n1411), .B0(d_ff3_LUT_out[23]), 
        .B1(n1456), .Y(n1192) );
  AOI222X1TS U949 ( .A0(n1247), .A1(d_ff2_Z[0]), .B0(n1427), .B1(d_ff_Zn[0]), 
        .C0(n1259), .C1(d_ff1_Z[0]), .Y(n1234) );
  AOI222X4TS U950 ( .A0(n1247), .A1(d_ff2_Z[1]), .B0(n1243), .B1(d_ff1_Z[1]), 
        .C0(d_ff_Zn[1]), .C1(n1418), .Y(n1245) );
  AOI222X4TS U951 ( .A0(n1247), .A1(d_ff2_Z[2]), .B0(n1243), .B1(d_ff1_Z[2]), 
        .C0(d_ff_Zn[2]), .C1(n1418), .Y(n1240) );
  AOI222X1TS U952 ( .A0(n1247), .A1(d_ff2_Z[3]), .B0(n1243), .B1(d_ff1_Z[3]), 
        .C0(d_ff_Zn[3]), .C1(n1418), .Y(n1235) );
  AOI222X4TS U953 ( .A0(n1247), .A1(d_ff2_Z[4]), .B0(n1243), .B1(d_ff1_Z[4]), 
        .C0(d_ff_Zn[4]), .C1(n1418), .Y(n1244) );
  AOI222X4TS U954 ( .A0(n1247), .A1(d_ff2_Z[5]), .B0(n1243), .B1(d_ff1_Z[5]), 
        .C0(d_ff_Zn[5]), .C1(n1418), .Y(n1242) );
  AOI222X4TS U955 ( .A0(n1247), .A1(d_ff2_Z[6]), .B0(n1243), .B1(d_ff1_Z[6]), 
        .C0(d_ff_Zn[6]), .C1(n1418), .Y(n1238) );
  AOI222X4TS U956 ( .A0(n1247), .A1(d_ff2_Z[7]), .B0(n1243), .B1(d_ff1_Z[7]), 
        .C0(d_ff_Zn[7]), .C1(n1418), .Y(n1248) );
  AOI222X4TS U957 ( .A0(n1247), .A1(d_ff2_Z[8]), .B0(n1243), .B1(d_ff1_Z[8]), 
        .C0(d_ff_Zn[8]), .C1(n1418), .Y(n1237) );
  AOI222X4TS U958 ( .A0(n1247), .A1(d_ff2_Z[9]), .B0(n1243), .B1(d_ff1_Z[9]), 
        .C0(d_ff_Zn[9]), .C1(n1418), .Y(n1246) );
  AOI222X1TS U959 ( .A0(n1247), .A1(d_ff2_Z[10]), .B0(n1243), .B1(d_ff1_Z[10]), 
        .C0(d_ff_Zn[10]), .C1(n1418), .Y(n1236) );
  AOI222X4TS U960 ( .A0(n1247), .A1(d_ff2_Z[11]), .B0(n1243), .B1(d_ff1_Z[11]), 
        .C0(d_ff_Zn[11]), .C1(n1418), .Y(n1239) );
  AOI222X4TS U961 ( .A0(n1430), .A1(d_ff2_Z[12]), .B0(n1243), .B1(d_ff1_Z[12]), 
        .C0(d_ff_Zn[12]), .C1(n1418), .Y(n1241) );
  NOR2X2TS U962 ( .A(n1415), .B(n1404), .Y(n1413) );
  BUFX4TS U963 ( .A(n1485), .Y(n1484) );
  BUFX4TS U964 ( .A(n1507), .Y(n1486) );
  INVX4TS U965 ( .A(n1218), .Y(n1366) );
  INVX4TS U966 ( .A(n1218), .Y(n1369) );
  INVX4TS U967 ( .A(n1218), .Y(n1367) );
  OR2X4TS U968 ( .A(n1469), .B(n1468), .Y(n1218) );
  OAI211X2TS U969 ( .A0(n1481), .A1(n1198), .B0(n1197), .C0(n1409), .Y(n1402)
         );
  OAI21X2TS U970 ( .A0(n1191), .A1(n1438), .B0(n1409), .Y(n1404) );
  NAND2X2TS U971 ( .A(cont_iter_out[3]), .B(intadd_366_B_1_), .Y(n1409) );
  NOR3X4TS U972 ( .A(n1373), .B(n1438), .C(n1474), .Y(n1374) );
  INVX3TS U973 ( .A(n1198), .Y(n1438) );
  AOI222X4TS U974 ( .A0(n1344), .A1(data_output[30]), .B0(n1343), .B1(n1120), 
        .C0(n1346), .C1(d_ff_Xn[30]), .Y(n1340) );
  AOI222X1TS U975 ( .A0(n1344), .A1(data_output[21]), .B0(n1343), .B1(
        d_ff_Yn[21]), .C0(n1346), .C1(d_ff_Xn[21]), .Y(n1332) );
  AOI222X1TS U976 ( .A0(n1344), .A1(data_output[22]), .B0(n1343), .B1(n1126), 
        .C0(n1346), .C1(d_ff_Xn[22]), .Y(n1334) );
  AOI222X1TS U977 ( .A0(n1344), .A1(data_output[24]), .B0(n1343), .B1(n1125), 
        .C0(n1346), .C1(d_ff_Xn[24]), .Y(n1339) );
  AOI222X4TS U978 ( .A0(n1344), .A1(data_output[28]), .B0(n1343), .B1(
        d_ff_Yn[28]), .C0(n1346), .C1(d_ff_Xn[28]), .Y(n1342) );
  AOI222X1TS U979 ( .A0(n1344), .A1(data_output[19]), .B0(n1343), .B1(n1128), 
        .C0(n1346), .C1(d_ff_Xn[19]), .Y(n1345) );
  AOI222X1TS U980 ( .A0(n1344), .A1(data_output[20]), .B0(n1343), .B1(n1127), 
        .C0(n1346), .C1(d_ff_Xn[20]), .Y(n1329) );
  AOI222X1TS U981 ( .A0(n1344), .A1(data_output[25]), .B0(n1343), .B1(n1124), 
        .C0(n1346), .C1(d_ff_Xn[25]), .Y(n1341) );
  AOI222X1TS U982 ( .A0(n1344), .A1(data_output[26]), .B0(n1343), .B1(n1123), 
        .C0(n1346), .C1(d_ff_Xn[26]), .Y(n1333) );
  CLKINVX6TS U983 ( .A(n1377), .Y(n1381) );
  AOI222X1TS U984 ( .A0(n1303), .A1(data_output[18]), .B0(n1347), .B1(n1129), 
        .C0(n1324), .C1(d_ff_Xn[18]), .Y(n1320) );
  AOI222X1TS U985 ( .A0(n1303), .A1(data_output[17]), .B0(n1347), .B1(n1130), 
        .C0(n1324), .C1(d_ff_Xn[17]), .Y(n1317) );
  AOI222X4TS U986 ( .A0(n1336), .A1(data_output[13]), .B0(n1347), .B1(n1134), 
        .C0(n1324), .C1(d_ff_Xn[13]), .Y(n1316) );
  AOI222X1TS U987 ( .A0(n1336), .A1(data_output[10]), .B0(n1347), .B1(n1137), 
        .C0(n1324), .C1(d_ff_Xn[10]), .Y(n1313) );
  BUFX4TS U988 ( .A(n1306), .Y(n1343) );
  AOI222X4TS U989 ( .A0(n1430), .A1(d_ff2_Z[22]), .B0(n1243), .B1(d_ff1_Z[22]), 
        .C0(d_ff_Zn[22]), .C1(n1427), .Y(n1249) );
  AOI222X4TS U990 ( .A0(n1430), .A1(d_ff2_Z[21]), .B0(n1243), .B1(d_ff1_Z[21]), 
        .C0(d_ff_Zn[21]), .C1(n1465), .Y(n1250) );
  AOI222X4TS U991 ( .A0(n1437), .A1(d_ff2_Z[25]), .B0(n1243), .B1(d_ff1_Z[25]), 
        .C0(d_ff_Zn[25]), .C1(n1427), .Y(n1253) );
  AOI222X4TS U992 ( .A0(n1430), .A1(d_ff2_Z[15]), .B0(n1243), .B1(d_ff1_Z[15]), 
        .C0(d_ff_Zn[15]), .C1(n1465), .Y(n1254) );
  BUFX4TS U993 ( .A(n1432), .Y(n1465) );
  BUFX4TS U994 ( .A(n1210), .Y(n1362) );
  INVX3TS U995 ( .A(n1434), .Y(n1426) );
  NOR4X2TS U996 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(inst_CORDIC_FSM_v3_state_reg[3]), 
        .D(inst_CORDIC_FSM_v3_state_reg[0]), .Y(n1178) );
  NOR3X4TS U997 ( .A(inst_CORDIC_FSM_v3_state_reg[5]), .B(n1473), .C(n1181), 
        .Y(enab_cont_iter) );
  NOR3X1TS U998 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .Y(n1183) );
  AOI211XLTS U999 ( .A0(d_ff3_LUT_out[6]), .A1(n1449), .B0(n1188), .C0(n1187), 
        .Y(n1189) );
  INVX2TS U1000 ( .A(d_ff3_LUT_out[13]), .Y(n1410) );
  OAI21XLTS U1001 ( .A0(n1218), .A1(n1169), .B0(n1224), .Y(add_subt_dataB[9])
         );
  OAI21XLTS U1002 ( .A0(n1218), .A1(n1476), .B0(n1211), .Y(add_subt_dataB[20])
         );
  OAI21XLTS U1003 ( .A0(n1221), .A1(n1478), .B0(n1220), .Y(add_subt_dataA[23])
         );
  INVX2TS U1004 ( .A(n1174), .Y(n1433) );
  NAND3X1TS U1005 ( .A(inst_CORDIC_FSM_v3_state_reg[7]), .B(n1178), .C(n1182), 
        .Y(n1353) );
  INVX2TS U1006 ( .A(n1353), .Y(ready_cordic) );
  NOR3BX1TS U1007 ( .AN(n1182), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[3]), .Y(n1200) );
  NAND2BX1TS U1008 ( .AN(inst_CORDIC_FSM_v3_state_reg[0]), .B(n1200), .Y(n1181) );
  INVX2TS U1009 ( .A(enab_cont_iter), .Y(n1373) );
  INVX2TS U1010 ( .A(n1173), .Y(n1198) );
  OAI32X1TS U1011 ( .A0(n1374), .A1(n1438), .A2(n1373), .B0(n1474), .B1(n1374), 
        .Y(n988) );
  NOR3BX2TS U1012 ( .AN(n1350), .B(enab_cont_iter), .C(ready_add_subt), .Y(
        n1376) );
  NAND2X1TS U1013 ( .A(cont_var_out[0]), .B(n1469), .Y(n1223) );
  NAND2X1TS U1014 ( .A(cont_var_out[1]), .B(n1468), .Y(n1221) );
  NAND2X1TS U1015 ( .A(n1376), .B(cont_var_out[1]), .Y(n1176) );
  OAI211XLTS U1016 ( .A0(n1376), .A1(n1223), .B0(n1221), .C0(n1176), .Y(n990)
         );
  BUFX3TS U1017 ( .A(n281), .Y(n1495) );
  BUFX3TS U1018 ( .A(n1494), .Y(n1488) );
  CLKBUFX2TS U1019 ( .A(n281), .Y(n1177) );
  BUFX3TS U1020 ( .A(n281), .Y(n1503) );
  BUFX3TS U1021 ( .A(n281), .Y(n1498) );
  BUFX3TS U1022 ( .A(n1496), .Y(n1497) );
  BUFX3TS U1023 ( .A(n1507), .Y(n1483) );
  BUFX3TS U1024 ( .A(n1507), .Y(n1485) );
  BUFX3TS U1025 ( .A(n281), .Y(n1506) );
  BUFX3TS U1026 ( .A(n1494), .Y(n1487) );
  NAND3X1TS U1027 ( .A(n1191), .B(n1198), .C(cont_iter_out[1]), .Y(n1352) );
  NAND2BXLTS U1028 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(n1178), .Y(n1179) );
  AO21XLTS U1029 ( .A0(enab_cont_iter), .A1(n1352), .B0(n1113), .Y(
        inst_CORDIC_FSM_v3_state_next[2]) );
  BUFX3TS U1030 ( .A(n1210), .Y(n1372) );
  AOI22X1TS U1031 ( .A0(n1364), .A1(d_ff2_Y[30]), .B0(d_ff2_Z[30]), .B1(n1369), 
        .Y(n1180) );
  OAI2BB1X1TS U1032 ( .A0N(n1372), .A1N(n1114), .B0(n1180), .Y(
        add_subt_dataA[30]) );
  NAND3BX1TS U1033 ( .AN(n1181), .B(inst_CORDIC_FSM_v3_state_reg[5]), .C(n1473), .Y(n1351) );
  NAND2X1TS U1034 ( .A(n1350), .B(n1351), .Y(beg_add_subt) );
  NAND4BX1TS U1035 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(
        inst_CORDIC_FSM_v3_state_reg[3]), .C(n1183), .D(n1182), .Y(n1431) );
  BUFX3TS U1036 ( .A(n1428), .Y(n1446) );
  OAI21XLTS U1037 ( .A0(n1366), .A1(n1350), .B0(n1459), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  NAND2X2TS U1038 ( .A(n1463), .B(n1474), .Y(n1442) );
  AOI21X1TS U1039 ( .A0(n1481), .A1(n1198), .B0(cont_iter_out[3]), .Y(n1195)
         );
  AOI22X1TS U1040 ( .A0(n1463), .A1(n1195), .B0(d_ff3_LUT_out[26]), .B1(n1459), 
        .Y(n1184) );
  OAI21XLTS U1041 ( .A0(cont_iter_out[3]), .A1(n1442), .B0(n1184), .Y(n802) );
  NAND2X1TS U1042 ( .A(n1198), .B(n1478), .Y(intadd_366_CI) );
  NAND2X1TS U1043 ( .A(n1463), .B(n1438), .Y(n1416) );
  INVX2TS U1044 ( .A(n1416), .Y(n1439) );
  AOI22X1TS U1045 ( .A0(d_ff2_Y[23]), .A1(n1439), .B0(d_ff3_sh_y_out[23]), 
        .B1(n1459), .Y(n1185) );
  OAI21XLTS U1046 ( .A0(n1459), .A1(intadd_366_CI), .B0(n1185), .Y(n713) );
  INVX2TS U1047 ( .A(n1415), .Y(n1197) );
  NAND2X2TS U1048 ( .A(n1463), .B(cont_iter_out[1]), .Y(n1443) );
  NOR3X1TS U1049 ( .A(n1481), .B(n1438), .C(n1443), .Y(n1187) );
  AOI21X1TS U1050 ( .A0(d_ff3_LUT_out[2]), .A1(n1459), .B0(n1187), .Y(n1186)
         );
  OAI21XLTS U1051 ( .A0(n1442), .A1(n1197), .B0(n1186), .Y(n819) );
  BUFX4TS U1052 ( .A(n1459), .Y(n1449) );
  AOI211X1TS U1053 ( .A0(n1198), .A1(n1471), .B0(n1481), .C0(n1442), .Y(n1407)
         );
  AOI21X1TS U1054 ( .A0(d_ff3_LUT_out[0]), .A1(n1459), .B0(n1407), .Y(n1190)
         );
  OAI21XLTS U1055 ( .A0(n1413), .A1(n1443), .B0(n1190), .Y(n821) );
  INVX2TS U1056 ( .A(n1191), .Y(n1411) );
  BUFX3TS U1057 ( .A(n1428), .Y(n1466) );
  CLKBUFX3TS U1058 ( .A(n1466), .Y(n1456) );
  OAI21XLTS U1059 ( .A0(n1411), .A1(n1416), .B0(n1192), .Y(n805) );
  OAI2BB1X1TS U1060 ( .A0N(n1409), .A1N(n1197), .B0(n1463), .Y(n1398) );
  INVX2TS U1061 ( .A(n1443), .Y(n1405) );
  NAND2X1TS U1062 ( .A(n1405), .B(n1411), .Y(n1412) );
  OAI211XLTS U1063 ( .A0(n1463), .A1(n1476), .B0(n1398), .C0(n1412), .Y(n808)
         );
  INVX2TS U1064 ( .A(n1442), .Y(n1400) );
  NAND2X1TS U1065 ( .A(n1198), .B(n1411), .Y(n1193) );
  AOI22X1TS U1066 ( .A0(n1400), .A1(n1193), .B0(d_ff3_LUT_out[24]), .B1(n1466), 
        .Y(n1194) );
  OAI21XLTS U1067 ( .A0(n1438), .A1(n1412), .B0(n1194), .Y(n804) );
  AOI22X1TS U1068 ( .A0(n1195), .A1(n1400), .B0(d_ff3_LUT_out[4]), .B1(n1449), 
        .Y(n1196) );
  OAI21XLTS U1069 ( .A0(n1481), .A1(n1443), .B0(n1196), .Y(n817) );
  NAND2X1TS U1070 ( .A(n1400), .B(n1411), .Y(n1199) );
  NAND2X1TS U1071 ( .A(n1405), .B(n1402), .Y(n1408) );
  OAI211XLTS U1072 ( .A0(n1463), .A1(n1169), .B0(n1199), .C0(n1408), .Y(n812)
         );
  INVX2TS U1073 ( .A(d_ff3_LUT_out[3]), .Y(n1217) );
  OAI211XLTS U1074 ( .A0(n1111), .A1(n1217), .B0(n1398), .C0(n1199), .Y(n818)
         );
  NOR2XLTS U1075 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1201) );
  NAND3X1TS U1076 ( .A(n1201), .B(inst_CORDIC_FSM_v3_state_reg[0]), .C(n1200), 
        .Y(n1349) );
  NOR2BX1TS U1077 ( .AN(n1349), .B(n1113), .Y(n1203) );
  INVX4TS U1078 ( .A(n1377), .Y(n1379) );
  NOR4X1TS U1079 ( .A(enab_cont_iter), .B(n1463), .C(n1482), .D(beg_add_subt), 
        .Y(n1204) );
  AOI32X1TS U1080 ( .A0(n1379), .A1(n1353), .A2(n1204), .B0(ready_cordic), 
        .B1(ack_cordic), .Y(n1205) );
  OAI21XLTS U1081 ( .A0(beg_fsm_cordic), .A1(n1349), .B0(n1205), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  NOR2XLTS U1082 ( .A(n1351), .B(n1382), .Y(inst_CORDIC_FSM_v3_state_next[6])
         );
  BUFX4TS U1083 ( .A(n1206), .Y(n1299) );
  AOI22X1TS U1084 ( .A0(n1370), .A1(d_ff3_sh_x_out[15]), .B0(n1210), .B1(
        d_ff3_sh_y_out[15]), .Y(n1207) );
  OAI21XLTS U1085 ( .A0(n1218), .A1(n1476), .B0(n1207), .Y(add_subt_dataB[15])
         );
  AOI22X1TS U1086 ( .A0(n1370), .A1(d_ff3_sh_x_out[12]), .B0(n1210), .B1(
        d_ff3_sh_y_out[12]), .Y(n1208) );
  OAI21XLTS U1087 ( .A0(n1218), .A1(n1172), .B0(n1208), .Y(add_subt_dataB[12])
         );
  AOI22X1TS U1088 ( .A0(n1364), .A1(d_ff3_sh_x_out[18]), .B0(n1210), .B1(
        d_ff3_sh_y_out[18]), .Y(n1209) );
  OAI21XLTS U1089 ( .A0(n1218), .A1(n1410), .B0(n1209), .Y(add_subt_dataB[18])
         );
  AOI22X1TS U1090 ( .A0(n1364), .A1(d_ff3_sh_x_out[20]), .B0(n1210), .B1(
        d_ff3_sh_y_out[20]), .Y(n1211) );
  AOI22X1TS U1091 ( .A0(n1370), .A1(d_ff2_Y[24]), .B0(d_ff2_Z[24]), .B1(n1369), 
        .Y(n1212) );
  OAI21XLTS U1092 ( .A0(n1223), .A1(n1475), .B0(n1212), .Y(add_subt_dataA[24])
         );
  AOI22X1TS U1093 ( .A0(n1364), .A1(d_ff3_sh_x_out[17]), .B0(n1210), .B1(
        d_ff3_sh_y_out[17]), .Y(n1213) );
  OAI21XLTS U1094 ( .A0(n1218), .A1(n1476), .B0(n1213), .Y(add_subt_dataB[17])
         );
  AOI22X1TS U1095 ( .A0(n1370), .A1(d_ff3_sh_x_out[3]), .B0(n1210), .B1(
        d_ff3_sh_y_out[3]), .Y(n1214) );
  OAI21XLTS U1096 ( .A0(n1218), .A1(n1217), .B0(n1214), .Y(add_subt_dataB[3])
         );
  AOI22X1TS U1097 ( .A0(n1370), .A1(d_ff3_sh_x_out[13]), .B0(n1210), .B1(
        d_ff3_sh_y_out[13]), .Y(n1215) );
  OAI21XLTS U1098 ( .A0(n1218), .A1(n1410), .B0(n1215), .Y(add_subt_dataB[13])
         );
  AOI22X1TS U1099 ( .A0(n1364), .A1(d_ff3_sh_x_out[16]), .B0(n1210), .B1(
        d_ff3_sh_y_out[16]), .Y(n1216) );
  OAI21XLTS U1100 ( .A0(n1218), .A1(n1217), .B0(n1216), .Y(add_subt_dataB[16])
         );
  BUFX4TS U1101 ( .A(n1210), .Y(n1357) );
  AOI22X1TS U1102 ( .A0(n1372), .A1(d_ff3_sh_y_out[29]), .B0(n1366), .B1(
        d_ff3_LUT_out[27]), .Y(n1219) );
  OAI21XLTS U1103 ( .A0(n1221), .A1(n1170), .B0(n1219), .Y(add_subt_dataB[29])
         );
  AOI22X1TS U1104 ( .A0(n1357), .A1(d_ff2_X[23]), .B0(d_ff2_Z[23]), .B1(n1367), 
        .Y(n1220) );
  AOI22X1TS U1105 ( .A0(n1370), .A1(d_ff2_Y[28]), .B0(d_ff2_Z[28]), .B1(n1366), 
        .Y(n1222) );
  OAI21XLTS U1106 ( .A0(n1223), .A1(n1477), .B0(n1222), .Y(add_subt_dataA[28])
         );
  AOI22X1TS U1107 ( .A0(n1370), .A1(d_ff3_sh_x_out[9]), .B0(n1372), .B1(
        d_ff3_sh_y_out[9]), .Y(n1224) );
  CLKBUFX3TS U1108 ( .A(n1482), .Y(n1434) );
  INVX4TS U1109 ( .A(n1434), .Y(n1437) );
  INVX3TS U1110 ( .A(n1434), .Y(n1247) );
  NAND4XLTS U1111 ( .A(n1471), .B(intadd_366_B_1_), .C(n1438), .D(n1474), .Y(
        n1226) );
  NAND2X1TS U1112 ( .A(n1226), .B(n1482), .Y(n1227) );
  BUFX4TS U1113 ( .A(n1227), .Y(n1435) );
  INVX2TS U1114 ( .A(n1435), .Y(n1436) );
  BUFX4TS U1115 ( .A(n1436), .Y(n1432) );
  INVX2TS U1116 ( .A(n1228), .Y(n773) );
  INVX2TS U1117 ( .A(n1229), .Y(n771) );
  INVX2TS U1118 ( .A(n1230), .Y(n769) );
  INVX2TS U1119 ( .A(n1231), .Y(n774) );
  INVX2TS U1120 ( .A(n1232), .Y(n772) );
  INVX2TS U1121 ( .A(n1233), .Y(n770) );
  BUFX3TS U1122 ( .A(n1432), .Y(n1418) );
  INVX2TS U1123 ( .A(n1234), .Y(n800) );
  INVX2TS U1124 ( .A(n1235), .Y(n797) );
  INVX2TS U1125 ( .A(n1236), .Y(n790) );
  INVX2TS U1126 ( .A(n1237), .Y(n792) );
  INVX2TS U1127 ( .A(n1238), .Y(n794) );
  INVX2TS U1128 ( .A(n1239), .Y(n789) );
  INVX2TS U1129 ( .A(n1240), .Y(n798) );
  INVX4TS U1130 ( .A(n1434), .Y(n1430) );
  INVX2TS U1131 ( .A(n1241), .Y(n788) );
  INVX2TS U1132 ( .A(n1242), .Y(n795) );
  INVX2TS U1133 ( .A(n1244), .Y(n796) );
  INVX2TS U1134 ( .A(n1245), .Y(n799) );
  INVX2TS U1135 ( .A(n1246), .Y(n791) );
  INVX2TS U1136 ( .A(n1248), .Y(n793) );
  INVX2TS U1137 ( .A(n1249), .Y(n778) );
  INVX2TS U1138 ( .A(n1250), .Y(n779) );
  INVX2TS U1139 ( .A(n1251), .Y(n776) );
  INVX2TS U1140 ( .A(n1252), .Y(n777) );
  INVX2TS U1141 ( .A(n1253), .Y(n775) );
  INVX2TS U1142 ( .A(n1254), .Y(n785) );
  INVX2TS U1143 ( .A(n1255), .Y(n783) );
  INVX2TS U1144 ( .A(n1256), .Y(n781) );
  INVX2TS U1145 ( .A(n1257), .Y(n787) );
  INVX2TS U1146 ( .A(n1258), .Y(n786) );
  AOI222X1TS U1147 ( .A0(n1430), .A1(d_ff2_Z[20]), .B0(n1259), .B1(d_ff1_Z[20]), .C0(d_ff_Zn[20]), .C1(n1465), .Y(n1260) );
  INVX2TS U1148 ( .A(n1260), .Y(n780) );
  INVX2TS U1149 ( .A(n1261), .Y(n784) );
  INVX2TS U1150 ( .A(n1262), .Y(n782) );
  INVX2TS U1151 ( .A(n1263), .Y(add_subt_dataA[7]) );
  INVX2TS U1152 ( .A(n1264), .Y(add_subt_dataA[6]) );
  INVX2TS U1153 ( .A(n1265), .Y(add_subt_dataA[2]) );
  INVX2TS U1154 ( .A(n1266), .Y(add_subt_dataA[3]) );
  INVX2TS U1155 ( .A(n1267), .Y(add_subt_dataA[1]) );
  AOI22X1TS U1156 ( .A0(n1364), .A1(d_ff3_sh_x_out[21]), .B0(n1362), .B1(
        d_ff3_sh_y_out[21]), .Y(n1268) );
  OAI21XLTS U1157 ( .A0(n1218), .A1(n1171), .B0(n1268), .Y(add_subt_dataB[21])
         );
  INVX2TS U1158 ( .A(n1269), .Y(add_subt_dataA[10]) );
  INVX2TS U1159 ( .A(n1270), .Y(add_subt_dataA[9]) );
  INVX2TS U1160 ( .A(n1271), .Y(add_subt_dataA[5]) );
  INVX2TS U1161 ( .A(n1272), .Y(add_subt_dataA[4]) );
  INVX2TS U1162 ( .A(n1273), .Y(add_subt_dataA[8]) );
  INVX2TS U1163 ( .A(n1274), .Y(add_subt_dataA[0]) );
  INVX2TS U1164 ( .A(n1275), .Y(add_subt_dataA[14]) );
  INVX2TS U1165 ( .A(n1276), .Y(add_subt_dataA[18]) );
  INVX2TS U1166 ( .A(n1277), .Y(add_subt_dataA[17]) );
  INVX2TS U1167 ( .A(n1278), .Y(add_subt_dataA[12]) );
  INVX2TS U1168 ( .A(n1279), .Y(add_subt_dataA[16]) );
  INVX2TS U1169 ( .A(n1280), .Y(add_subt_dataA[15]) );
  INVX2TS U1170 ( .A(n1281), .Y(add_subt_dataA[11]) );
  INVX2TS U1171 ( .A(n1282), .Y(add_subt_dataB[25]) );
  INVX2TS U1172 ( .A(n1283), .Y(add_subt_dataB[24]) );
  INVX2TS U1173 ( .A(n1284), .Y(add_subt_dataB[23]) );
  AOI222X1TS U1174 ( .A0(n1206), .A1(d_ff3_sh_x_out[8]), .B0(n1210), .B1(
        d_ff3_sh_y_out[8]), .C0(n1369), .C1(d_ff3_LUT_out[8]), .Y(n1285) );
  INVX2TS U1175 ( .A(n1285), .Y(add_subt_dataB[8]) );
  INVX2TS U1176 ( .A(n1286), .Y(add_subt_dataB[26]) );
  INVX2TS U1177 ( .A(n1287), .Y(add_subt_dataB[10]) );
  INVX2TS U1178 ( .A(n1288), .Y(add_subt_dataA[26]) );
  INVX2TS U1179 ( .A(n1289), .Y(add_subt_dataB[0]) );
  INVX2TS U1180 ( .A(n1290), .Y(add_subt_dataB[1]) );
  INVX2TS U1181 ( .A(n1291), .Y(add_subt_dataA[19]) );
  INVX2TS U1182 ( .A(n1292), .Y(add_subt_dataB[6]) );
  INVX2TS U1183 ( .A(n1293), .Y(add_subt_dataA[20]) );
  INVX2TS U1184 ( .A(n1294), .Y(add_subt_dataA[22]) );
  INVX2TS U1185 ( .A(n1295), .Y(add_subt_dataA[13]) );
  INVX2TS U1186 ( .A(n1296), .Y(add_subt_dataB[2]) );
  INVX2TS U1187 ( .A(n1297), .Y(add_subt_dataA[21]) );
  INVX2TS U1188 ( .A(n1298), .Y(add_subt_dataA[25]) );
  INVX2TS U1189 ( .A(n1300), .Y(add_subt_dataA[31]) );
  INVX2TS U1190 ( .A(n1301), .Y(add_subt_dataB[4]) );
  XNOR2X1TS U1191 ( .A(n1307), .B(n1166), .Y(n1310) );
  BUFX3TS U1192 ( .A(n1336), .Y(n1344) );
  XNOR2X1TS U1193 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), .Y(n1304) );
  XNOR2X1TS U1194 ( .A(d_ff1_shift_region_flag_out[0]), .B(n1304), .Y(n1305)
         );
  AOI22X1TS U1195 ( .A0(n1344), .A1(data_output[31]), .B0(n1347), .B1(n1308), 
        .Y(n1309) );
  OAI21XLTS U1196 ( .A0(n1310), .A1(n1326), .B0(n1309), .Y(n822) );
  BUFX3TS U1197 ( .A(n1306), .Y(n1347) );
  INVX4TS U1198 ( .A(n1326), .Y(n1324) );
  INVX2TS U1199 ( .A(n1311), .Y(n841) );
  INVX2TS U1200 ( .A(n1312), .Y(n845) );
  INVX2TS U1201 ( .A(n1313), .Y(n843) );
  INVX2TS U1202 ( .A(n1314), .Y(n848) );
  INVX2TS U1203 ( .A(n1315), .Y(n838) );
  INVX2TS U1204 ( .A(n1316), .Y(n840) );
  INVX2TS U1205 ( .A(n1317), .Y(n836) );
  INVX2TS U1206 ( .A(n1318), .Y(n846) );
  INVX2TS U1207 ( .A(n1319), .Y(n839) );
  INVX2TS U1208 ( .A(n1320), .Y(n835) );
  INVX2TS U1209 ( .A(n1321), .Y(n844) );
  INVX2TS U1210 ( .A(n1322), .Y(n837) );
  INVX2TS U1211 ( .A(n1323), .Y(n842) );
  INVX2TS U1212 ( .A(n1325), .Y(n847) );
  INVX4TS U1213 ( .A(n1326), .Y(n1346) );
  INVX2TS U1214 ( .A(n1327), .Y(n852) );
  INVX2TS U1215 ( .A(n1328), .Y(n850) );
  INVX2TS U1216 ( .A(n1329), .Y(n833) );
  INVX2TS U1217 ( .A(n1330), .Y(n826) );
  INVX2TS U1218 ( .A(n1331), .Y(n851) );
  INVX2TS U1219 ( .A(n1332), .Y(n832) );
  INVX2TS U1220 ( .A(n1333), .Y(n827) );
  INVX2TS U1221 ( .A(n1334), .Y(n831) );
  INVX2TS U1222 ( .A(n1335), .Y(n849) );
  INVX2TS U1223 ( .A(n1337), .Y(n830) );
  INVX2TS U1224 ( .A(n1338), .Y(n824) );
  INVX2TS U1225 ( .A(n1339), .Y(n829) );
  INVX2TS U1226 ( .A(n1340), .Y(n823) );
  INVX2TS U1227 ( .A(n1341), .Y(n828) );
  INVX2TS U1228 ( .A(n1342), .Y(n825) );
  INVX2TS U1229 ( .A(n1345), .Y(n834) );
  INVX2TS U1230 ( .A(n1348), .Y(n853) );
  NOR2BX1TS U1231 ( .AN(beg_fsm_cordic), .B(n1349), .Y(
        inst_CORDIC_FSM_v3_state_next[1]) );
  INVX4TS U1232 ( .A(n1382), .Y(n1385) );
  OAI22X1TS U1233 ( .A0(n1385), .A1(n1351), .B0(n1350), .B1(n1218), .Y(
        inst_CORDIC_FSM_v3_state_next[5]) );
  OAI22X1TS U1234 ( .A0(ack_cordic), .A1(n1353), .B0(n1373), .B1(n1352), .Y(
        inst_CORDIC_FSM_v3_state_next[7]) );
  AOI2BB2XLTS U1235 ( .B0(cont_var_out[0]), .B1(d_ff3_sign_out), .A0N(
        d_ff3_sign_out), .A1N(cont_var_out[0]), .Y(op_add_subt) );
  AO22XLTS U1236 ( .A0(n1206), .A1(d_ff3_sh_x_out[31]), .B0(n1357), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U1237 ( .A0(n1206), .A1(d_ff3_sh_x_out[30]), .B0(n1357), .B1(
        d_ff3_sh_y_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U1238 ( .A0(n1364), .A1(d_ff3_sh_x_out[28]), .B0(n1210), .B1(
        d_ff3_sh_y_out[28]), .Y(n1354) );
  NAND2X1TS U1239 ( .A(n1367), .B(d_ff3_LUT_out[27]), .Y(n1355) );
  NAND2X1TS U1240 ( .A(n1354), .B(n1355), .Y(add_subt_dataB[28]) );
  AOI22X1TS U1241 ( .A0(n1364), .A1(d_ff3_sh_x_out[27]), .B0(n1362), .B1(
        d_ff3_sh_y_out[27]), .Y(n1356) );
  NAND2X1TS U1242 ( .A(n1356), .B(n1355), .Y(add_subt_dataB[27]) );
  AOI22X1TS U1243 ( .A0(n1364), .A1(d_ff3_sh_x_out[22]), .B0(n1357), .B1(
        d_ff3_sh_y_out[22]), .Y(n1358) );
  OAI2BB1X1TS U1244 ( .A0N(n1366), .A1N(d_ff3_LUT_out[19]), .B0(n1358), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U1245 ( .A0(n1364), .A1(d_ff3_sh_x_out[19]), .B0(n1372), .B1(
        d_ff3_sh_y_out[19]), .Y(n1359) );
  OAI2BB1X1TS U1246 ( .A0N(n1366), .A1N(d_ff3_LUT_out[19]), .B0(n1359), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U1247 ( .A0(n1364), .A1(d_ff3_sh_x_out[14]), .B0(n1357), .B1(
        d_ff3_sh_y_out[14]), .Y(n1360) );
  OAI2BB1X1TS U1248 ( .A0N(n1366), .A1N(d_ff3_LUT_out[5]), .B0(n1360), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U1249 ( .A0(n1364), .A1(d_ff3_sh_x_out[11]), .B0(n1372), .B1(
        d_ff3_sh_y_out[11]), .Y(n1361) );
  OAI2BB1X1TS U1250 ( .A0N(n1366), .A1N(d_ff3_LUT_out[7]), .B0(n1361), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U1251 ( .A0(n1370), .A1(d_ff3_sh_x_out[7]), .B0(n1362), .B1(
        d_ff3_sh_y_out[7]), .Y(n1363) );
  OAI2BB1X1TS U1252 ( .A0N(n1366), .A1N(d_ff3_LUT_out[7]), .B0(n1363), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U1253 ( .A0(n1364), .A1(d_ff3_sh_x_out[5]), .B0(n1357), .B1(
        d_ff3_sh_y_out[5]), .Y(n1365) );
  OAI2BB1X1TS U1254 ( .A0N(n1366), .A1N(d_ff3_LUT_out[5]), .B0(n1365), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U1255 ( .A0(n1370), .A1(d_ff2_Y[29]), .B0(d_ff2_Z[29]), .B1(n1367), 
        .Y(n1368) );
  OAI2BB1X1TS U1256 ( .A0N(n1357), .A1N(d_ff2_X[29]), .B0(n1368), .Y(
        add_subt_dataA[29]) );
  AOI22X1TS U1257 ( .A0(n1370), .A1(d_ff2_Y[27]), .B0(d_ff2_Z[27]), .B1(n1369), 
        .Y(n1371) );
  OAI2BB1X1TS U1258 ( .A0N(n1372), .A1N(d_ff2_X[27]), .B0(n1371), .Y(
        add_subt_dataA[27]) );
  AOI22X1TS U1259 ( .A0(enab_cont_iter), .A1(cont_iter_out[0]), .B0(n1438), 
        .B1(n1373), .Y(n989) );
  AOI2BB2XLTS U1260 ( .B0(n1481), .B1(n1374), .A0N(n1374), .A1N(n1481), .Y(
        n987) );
  NAND2X1TS U1261 ( .A(n1481), .B(n1374), .Y(n1375) );
  XNOR2X1TS U1262 ( .A(cont_iter_out[3]), .B(n1375), .Y(n986) );
  AOI2BB2XLTS U1263 ( .B0(n1376), .B1(n1468), .A0N(n1468), .A1N(n1376), .Y(
        n985) );
  AO22XLTS U1264 ( .A0(n1379), .A1(d_ff1_operation_out), .B0(n1377), .B1(
        operation), .Y(n984) );
  BUFX3TS U1265 ( .A(n1377), .Y(n1378) );
  AO22XLTS U1266 ( .A0(n1379), .A1(d_ff1_shift_region_flag_out[0]), .B0(n1378), 
        .B1(shift_region_flag[0]), .Y(n983) );
  AO22XLTS U1267 ( .A0(n1379), .A1(d_ff1_shift_region_flag_out[1]), .B0(n1378), 
        .B1(shift_region_flag[1]), .Y(n982) );
  AO22XLTS U1268 ( .A0(n1379), .A1(d_ff1_Z[0]), .B0(n1378), .B1(data_in[0]), 
        .Y(n981) );
  AO22XLTS U1269 ( .A0(n1379), .A1(d_ff1_Z[1]), .B0(n1378), .B1(data_in[1]), 
        .Y(n980) );
  AO22XLTS U1270 ( .A0(n1379), .A1(d_ff1_Z[2]), .B0(n1378), .B1(data_in[2]), 
        .Y(n979) );
  AO22XLTS U1271 ( .A0(n1379), .A1(d_ff1_Z[3]), .B0(n1378), .B1(data_in[3]), 
        .Y(n978) );
  AO22XLTS U1272 ( .A0(n1379), .A1(d_ff1_Z[4]), .B0(n1378), .B1(data_in[4]), 
        .Y(n977) );
  AO22XLTS U1273 ( .A0(n1379), .A1(d_ff1_Z[5]), .B0(n1378), .B1(data_in[5]), 
        .Y(n976) );
  AO22XLTS U1274 ( .A0(n1379), .A1(d_ff1_Z[6]), .B0(n1378), .B1(data_in[6]), 
        .Y(n975) );
  AO22XLTS U1275 ( .A0(n1379), .A1(d_ff1_Z[7]), .B0(n1378), .B1(data_in[7]), 
        .Y(n974) );
  AO22XLTS U1276 ( .A0(n1379), .A1(d_ff1_Z[8]), .B0(n1378), .B1(data_in[8]), 
        .Y(n973) );
  AO22XLTS U1277 ( .A0(n1379), .A1(d_ff1_Z[9]), .B0(n1377), .B1(data_in[9]), 
        .Y(n972) );
  AO22XLTS U1278 ( .A0(n1381), .A1(d_ff1_Z[10]), .B0(n1377), .B1(data_in[10]), 
        .Y(n971) );
  AO22XLTS U1279 ( .A0(n1381), .A1(d_ff1_Z[11]), .B0(n1377), .B1(data_in[11]), 
        .Y(n970) );
  AO22XLTS U1280 ( .A0(n1381), .A1(d_ff1_Z[12]), .B0(n1378), .B1(data_in[12]), 
        .Y(n969) );
  AO22XLTS U1281 ( .A0(n1381), .A1(d_ff1_Z[13]), .B0(n1377), .B1(data_in[13]), 
        .Y(n968) );
  AO22XLTS U1282 ( .A0(n1381), .A1(d_ff1_Z[14]), .B0(n1377), .B1(data_in[14]), 
        .Y(n967) );
  AO22XLTS U1283 ( .A0(n1381), .A1(d_ff1_Z[15]), .B0(n1377), .B1(data_in[15]), 
        .Y(n966) );
  AO22XLTS U1284 ( .A0(n1381), .A1(d_ff1_Z[16]), .B0(n1377), .B1(data_in[16]), 
        .Y(n965) );
  BUFX3TS U1285 ( .A(n1377), .Y(n1380) );
  AO22XLTS U1286 ( .A0(n1381), .A1(d_ff1_Z[17]), .B0(n1380), .B1(data_in[17]), 
        .Y(n964) );
  AO22XLTS U1287 ( .A0(n1381), .A1(d_ff1_Z[18]), .B0(n1380), .B1(data_in[18]), 
        .Y(n963) );
  AO22XLTS U1288 ( .A0(n1381), .A1(d_ff1_Z[19]), .B0(n1378), .B1(data_in[19]), 
        .Y(n962) );
  AO22XLTS U1289 ( .A0(n1381), .A1(d_ff1_Z[20]), .B0(n1380), .B1(data_in[20]), 
        .Y(n961) );
  AO22XLTS U1290 ( .A0(n1381), .A1(d_ff1_Z[21]), .B0(n1380), .B1(data_in[21]), 
        .Y(n960) );
  AO22XLTS U1291 ( .A0(n1381), .A1(d_ff1_Z[22]), .B0(n1380), .B1(data_in[22]), 
        .Y(n959) );
  AO22XLTS U1292 ( .A0(n1381), .A1(d_ff1_Z[23]), .B0(n1380), .B1(data_in[23]), 
        .Y(n958) );
  AO22XLTS U1293 ( .A0(n1379), .A1(d_ff1_Z[24]), .B0(n1380), .B1(data_in[24]), 
        .Y(n957) );
  AO22XLTS U1294 ( .A0(n1379), .A1(d_ff1_Z[25]), .B0(n1380), .B1(data_in[25]), 
        .Y(n956) );
  AO22XLTS U1295 ( .A0(n1381), .A1(d_ff1_Z[26]), .B0(n1380), .B1(data_in[26]), 
        .Y(n955) );
  AO22XLTS U1296 ( .A0(n1381), .A1(d_ff1_Z[27]), .B0(n1380), .B1(data_in[27]), 
        .Y(n954) );
  AO22XLTS U1297 ( .A0(n1381), .A1(d_ff1_Z[28]), .B0(n1380), .B1(data_in[28]), 
        .Y(n953) );
  AO22XLTS U1298 ( .A0(n1381), .A1(d_ff1_Z[29]), .B0(n1380), .B1(data_in[29]), 
        .Y(n952) );
  AO22XLTS U1299 ( .A0(n1381), .A1(d_ff1_Z[30]), .B0(n1380), .B1(data_in[30]), 
        .Y(n951) );
  AO22XLTS U1300 ( .A0(n1381), .A1(d_ff1_Z[31]), .B0(n1380), .B1(data_in[31]), 
        .Y(n950) );
  INVX4TS U1301 ( .A(n1382), .Y(n1384) );
  AO22XLTS U1302 ( .A0(n1384), .A1(result_add_subt[0]), .B0(n1382), .B1(
        d_ff_Zn[0]), .Y(n949) );
  AO22XLTS U1303 ( .A0(n1384), .A1(result_add_subt[1]), .B0(n1382), .B1(
        d_ff_Zn[1]), .Y(n948) );
  BUFX4TS U1304 ( .A(n1382), .Y(n1383) );
  AO22XLTS U1305 ( .A0(n1384), .A1(result_add_subt[2]), .B0(n1383), .B1(
        d_ff_Zn[2]), .Y(n947) );
  AO22XLTS U1306 ( .A0(n1384), .A1(result_add_subt[3]), .B0(n1383), .B1(
        d_ff_Zn[3]), .Y(n946) );
  AO22XLTS U1307 ( .A0(n1384), .A1(result_add_subt[4]), .B0(n1383), .B1(
        d_ff_Zn[4]), .Y(n945) );
  AO22XLTS U1308 ( .A0(n1384), .A1(result_add_subt[5]), .B0(n1383), .B1(
        d_ff_Zn[5]), .Y(n944) );
  AO22XLTS U1309 ( .A0(n1384), .A1(result_add_subt[6]), .B0(n1383), .B1(
        d_ff_Zn[6]), .Y(n943) );
  AO22XLTS U1310 ( .A0(n1384), .A1(result_add_subt[7]), .B0(n1383), .B1(
        d_ff_Zn[7]), .Y(n942) );
  AO22XLTS U1311 ( .A0(n1385), .A1(result_add_subt[8]), .B0(n1383), .B1(
        d_ff_Zn[8]), .Y(n941) );
  AO22XLTS U1312 ( .A0(n1384), .A1(result_add_subt[9]), .B0(n1383), .B1(
        d_ff_Zn[9]), .Y(n940) );
  AO22XLTS U1313 ( .A0(n1385), .A1(result_add_subt[10]), .B0(n1383), .B1(
        d_ff_Zn[10]), .Y(n939) );
  AO22XLTS U1314 ( .A0(n1384), .A1(result_add_subt[11]), .B0(n1383), .B1(
        d_ff_Zn[11]), .Y(n938) );
  AO22XLTS U1315 ( .A0(n1385), .A1(result_add_subt[12]), .B0(n1383), .B1(
        d_ff_Zn[12]), .Y(n937) );
  AO22XLTS U1316 ( .A0(n1385), .A1(result_add_subt[13]), .B0(n1383), .B1(
        d_ff_Zn[13]), .Y(n936) );
  AO22XLTS U1317 ( .A0(n1385), .A1(result_add_subt[14]), .B0(n1383), .B1(
        d_ff_Zn[14]), .Y(n935) );
  AO22XLTS U1318 ( .A0(n1385), .A1(result_add_subt[15]), .B0(n1383), .B1(
        d_ff_Zn[15]), .Y(n934) );
  AO22XLTS U1319 ( .A0(n1385), .A1(result_add_subt[16]), .B0(n1383), .B1(
        d_ff_Zn[16]), .Y(n933) );
  AO22XLTS U1320 ( .A0(n1385), .A1(result_add_subt[17]), .B0(n1383), .B1(
        d_ff_Zn[17]), .Y(n932) );
  AO22XLTS U1321 ( .A0(n1385), .A1(result_add_subt[18]), .B0(n1383), .B1(
        d_ff_Zn[18]), .Y(n931) );
  AO22XLTS U1322 ( .A0(n1385), .A1(result_add_subt[19]), .B0(n1383), .B1(
        d_ff_Zn[19]), .Y(n930) );
  AO22XLTS U1323 ( .A0(n1385), .A1(result_add_subt[20]), .B0(n1383), .B1(
        d_ff_Zn[20]), .Y(n929) );
  AO22XLTS U1324 ( .A0(n1384), .A1(result_add_subt[21]), .B0(n1383), .B1(
        d_ff_Zn[21]), .Y(n928) );
  AO22XLTS U1325 ( .A0(n1384), .A1(result_add_subt[22]), .B0(n1382), .B1(
        d_ff_Zn[22]), .Y(n927) );
  AO22XLTS U1326 ( .A0(n1384), .A1(result_add_subt[23]), .B0(n1382), .B1(
        d_ff_Zn[23]), .Y(n926) );
  AO22XLTS U1327 ( .A0(n1384), .A1(result_add_subt[24]), .B0(n1382), .B1(
        d_ff_Zn[24]), .Y(n925) );
  AO22XLTS U1328 ( .A0(n1384), .A1(result_add_subt[25]), .B0(n1382), .B1(
        d_ff_Zn[25]), .Y(n924) );
  AO22XLTS U1329 ( .A0(n1384), .A1(result_add_subt[26]), .B0(n1382), .B1(
        d_ff_Zn[26]), .Y(n923) );
  AO22XLTS U1330 ( .A0(n1384), .A1(result_add_subt[27]), .B0(n1382), .B1(
        d_ff_Zn[27]), .Y(n922) );
  AO22XLTS U1331 ( .A0(n1385), .A1(result_add_subt[28]), .B0(n1382), .B1(
        d_ff_Zn[28]), .Y(n921) );
  AO22XLTS U1332 ( .A0(n1385), .A1(result_add_subt[29]), .B0(n1382), .B1(
        d_ff_Zn[29]), .Y(n920) );
  AO22XLTS U1333 ( .A0(n1385), .A1(result_add_subt[30]), .B0(n1382), .B1(
        d_ff_Zn[30]), .Y(n919) );
  AO22XLTS U1334 ( .A0(n1385), .A1(result_add_subt[31]), .B0(n1382), .B1(
        d_ff_Zn[31]), .Y(n918) );
  INVX4TS U1335 ( .A(n1387), .Y(n1391) );
  BUFX3TS U1336 ( .A(n1387), .Y(n1389) );
  CLKBUFX3TS U1337 ( .A(n1389), .Y(n1388) );
  INVX4TS U1338 ( .A(n1387), .Y(n1390) );
  BUFX3TS U1339 ( .A(n1392), .Y(n1396) );
  INVX4TS U1340 ( .A(n1396), .Y(n1397) );
  BUFX3TS U1341 ( .A(n1392), .Y(n1394) );
  CLKBUFX3TS U1342 ( .A(n1394), .Y(n1393) );
  INVX4TS U1343 ( .A(n1396), .Y(n1395) );
  AOI22X1TS U1344 ( .A0(n1400), .A1(n1402), .B0(d_ff3_LUT_out[1]), .B1(n1459), 
        .Y(n1399) );
  NAND2X1TS U1345 ( .A(n1399), .B(n1398), .Y(n820) );
  AOI22X1TS U1346 ( .A0(n1400), .A1(n1404), .B0(d_ff3_LUT_out[5]), .B1(n1459), 
        .Y(n1401) );
  NAND2X1TS U1347 ( .A(n1401), .B(n1408), .Y(n816) );
  AOI22X1TS U1348 ( .A0(n1467), .A1(n1402), .B0(d_ff3_LUT_out[7]), .B1(n1456), 
        .Y(n1403) );
  NAND2X1TS U1349 ( .A(n1403), .B(n1412), .Y(n814) );
  AO22XLTS U1350 ( .A0(n1467), .A1(intadd_366_B_1_), .B0(n1428), .B1(
        d_ff3_LUT_out[8]), .Y(n813) );
  AOI22X1TS U1351 ( .A0(n1405), .A1(n1404), .B0(d_ff3_LUT_out[10]), .B1(n1459), 
        .Y(n1406) );
  NAND2BXLTS U1352 ( .AN(n1407), .B(n1406), .Y(n811) );
  OAI221XLTS U1353 ( .A0(n1111), .A1(n1172), .B0(n1428), .B1(n1409), .C0(n1408), .Y(n810) );
  AOI22X1TS U1354 ( .A0(n1112), .A1(n1413), .B0(n1410), .B1(n1459), .Y(n809)
         );
  OAI221XLTS U1355 ( .A0(n1111), .A1(n1171), .B0(n1428), .B1(n1413), .C0(n1412), .Y(n806) );
  NOR2XLTS U1356 ( .A(n1438), .B(n1443), .Y(n1414) );
  AOI22X1TS U1357 ( .A0(n1415), .A1(n1414), .B0(d_ff3_LUT_out[25]), .B1(n1459), 
        .Y(n1417) );
  AOI32X1TS U1358 ( .A0(n1442), .A1(n1417), .A2(n1416), .B0(n1481), .B1(n1417), 
        .Y(n803) );
  NAND2BXLTS U1359 ( .AN(d_ff3_LUT_out[27]), .B(n1459), .Y(n801) );
  AO22XLTS U1360 ( .A0(n1428), .A1(d_ff3_sign_out), .B0(n1467), .B1(
        d_ff2_Z[31]), .Y(n768) );
  AO22XLTS U1361 ( .A0(n1432), .A1(n1118), .B0(d_ff2_Y[0]), .B1(n1437), .Y(
        n767) );
  AO22XLTS U1362 ( .A0(n1429), .A1(d_ff2_Y[0]), .B0(n1456), .B1(
        d_ff3_sh_y_out[0]), .Y(n766) );
  BUFX4TS U1363 ( .A(n1432), .Y(n1427) );
  AO22XLTS U1364 ( .A0(n1465), .A1(n1146), .B0(n1162), .B1(n1426), .Y(n765) );
  AO22XLTS U1365 ( .A0(n1429), .A1(n1162), .B0(n1456), .B1(d_ff3_sh_y_out[1]), 
        .Y(n764) );
  AO22XLTS U1366 ( .A0(n1436), .A1(n1145), .B0(n1161), .B1(n1426), .Y(n763) );
  AO22XLTS U1367 ( .A0(n1452), .A1(n1161), .B0(n1456), .B1(d_ff3_sh_y_out[2]), 
        .Y(n762) );
  AO22XLTS U1368 ( .A0(n1436), .A1(n1144), .B0(n1160), .B1(n1426), .Y(n761) );
  AO22XLTS U1369 ( .A0(n1111), .A1(n1160), .B0(n1456), .B1(d_ff3_sh_y_out[3]), 
        .Y(n760) );
  AO22XLTS U1370 ( .A0(n1436), .A1(n1143), .B0(n1159), .B1(n1426), .Y(n759) );
  AO22XLTS U1371 ( .A0(n1467), .A1(n1159), .B0(n1456), .B1(d_ff3_sh_y_out[4]), 
        .Y(n758) );
  AO22XLTS U1372 ( .A0(n1436), .A1(n1142), .B0(n1158), .B1(n1426), .Y(n757) );
  AO22XLTS U1373 ( .A0(n1112), .A1(n1158), .B0(n1446), .B1(d_ff3_sh_y_out[5]), 
        .Y(n756) );
  AO22XLTS U1374 ( .A0(n1436), .A1(n1141), .B0(n1157), .B1(n1426), .Y(n755) );
  AO22XLTS U1375 ( .A0(n1112), .A1(n1157), .B0(n1446), .B1(d_ff3_sh_y_out[6]), 
        .Y(n754) );
  AO22XLTS U1376 ( .A0(n1432), .A1(n1140), .B0(n1156), .B1(n1426), .Y(n753) );
  AO22XLTS U1377 ( .A0(n1467), .A1(n1156), .B0(n1446), .B1(d_ff3_sh_y_out[7]), 
        .Y(n752) );
  AO22XLTS U1378 ( .A0(n1432), .A1(n1139), .B0(n1155), .B1(n1426), .Y(n751) );
  AO22XLTS U1379 ( .A0(n1112), .A1(n1155), .B0(n1446), .B1(d_ff3_sh_y_out[8]), 
        .Y(n750) );
  AO22XLTS U1380 ( .A0(n1432), .A1(n1138), .B0(n1154), .B1(n1426), .Y(n749) );
  AO22XLTS U1381 ( .A0(n1429), .A1(n1154), .B0(n1446), .B1(d_ff3_sh_y_out[9]), 
        .Y(n748) );
  AO22XLTS U1382 ( .A0(n1436), .A1(n1137), .B0(n1153), .B1(n1426), .Y(n747) );
  AO22XLTS U1383 ( .A0(n1112), .A1(n1153), .B0(n1446), .B1(d_ff3_sh_y_out[10]), 
        .Y(n746) );
  AO22XLTS U1384 ( .A0(n1427), .A1(n1136), .B0(d_ff2_Y[11]), .B1(n1464), .Y(
        n745) );
  AO22XLTS U1385 ( .A0(n1467), .A1(d_ff2_Y[11]), .B0(n1446), .B1(
        d_ff3_sh_y_out[11]), .Y(n744) );
  AO22XLTS U1386 ( .A0(n1465), .A1(n1135), .B0(d_ff2_Y[12]), .B1(n1464), .Y(
        n743) );
  AO22XLTS U1387 ( .A0(n1112), .A1(d_ff2_Y[12]), .B0(n1446), .B1(
        d_ff3_sh_y_out[12]), .Y(n742) );
  AO22XLTS U1388 ( .A0(n1427), .A1(n1134), .B0(d_ff2_Y[13]), .B1(n1464), .Y(
        n741) );
  AO22XLTS U1389 ( .A0(n1467), .A1(d_ff2_Y[13]), .B0(n1446), .B1(
        d_ff3_sh_y_out[13]), .Y(n740) );
  AO22XLTS U1390 ( .A0(n1465), .A1(n1133), .B0(d_ff2_Y[14]), .B1(n1464), .Y(
        n739) );
  AO22XLTS U1391 ( .A0(n1112), .A1(d_ff2_Y[14]), .B0(n1446), .B1(
        d_ff3_sh_y_out[14]), .Y(n738) );
  AO22XLTS U1392 ( .A0(n1427), .A1(n1132), .B0(d_ff2_Y[15]), .B1(n1464), .Y(
        n737) );
  AO22XLTS U1393 ( .A0(n1467), .A1(d_ff2_Y[15]), .B0(n1449), .B1(
        d_ff3_sh_y_out[15]), .Y(n736) );
  AO22XLTS U1394 ( .A0(n1465), .A1(n1131), .B0(d_ff2_Y[16]), .B1(n1464), .Y(
        n735) );
  AO22XLTS U1395 ( .A0(n1112), .A1(d_ff2_Y[16]), .B0(n1449), .B1(
        d_ff3_sh_y_out[16]), .Y(n734) );
  AO22XLTS U1396 ( .A0(n1465), .A1(n1130), .B0(d_ff2_Y[17]), .B1(n1464), .Y(
        n733) );
  AO22XLTS U1397 ( .A0(n1429), .A1(d_ff2_Y[17]), .B0(n1449), .B1(
        d_ff3_sh_y_out[17]), .Y(n732) );
  AO22XLTS U1398 ( .A0(n1465), .A1(n1129), .B0(d_ff2_Y[18]), .B1(n1464), .Y(
        n731) );
  AO22XLTS U1399 ( .A0(n1429), .A1(d_ff2_Y[18]), .B0(n1449), .B1(
        d_ff3_sh_y_out[18]), .Y(n730) );
  AO22XLTS U1400 ( .A0(n1427), .A1(n1128), .B0(n1152), .B1(n1464), .Y(n729) );
  AO22XLTS U1401 ( .A0(n1429), .A1(n1152), .B0(n1449), .B1(d_ff3_sh_y_out[19]), 
        .Y(n728) );
  AO22XLTS U1402 ( .A0(n1427), .A1(n1127), .B0(d_ff2_Y[20]), .B1(n1464), .Y(
        n727) );
  AO22XLTS U1403 ( .A0(n1429), .A1(d_ff2_Y[20]), .B0(n1449), .B1(
        d_ff3_sh_y_out[20]), .Y(n726) );
  AO22XLTS U1404 ( .A0(n1427), .A1(d_ff_Yn[21]), .B0(d_ff2_Y[21]), .B1(n1464), 
        .Y(n725) );
  AO22XLTS U1405 ( .A0(n1452), .A1(d_ff2_Y[21]), .B0(n1449), .B1(
        d_ff3_sh_y_out[21]), .Y(n724) );
  AO22XLTS U1406 ( .A0(n1465), .A1(n1126), .B0(d_ff2_Y[22]), .B1(n1464), .Y(
        n723) );
  AO22XLTS U1407 ( .A0(n1112), .A1(d_ff2_Y[22]), .B0(n1449), .B1(
        d_ff3_sh_y_out[22]), .Y(n722) );
  AO22XLTS U1408 ( .A0(n1427), .A1(n1125), .B0(d_ff2_Y[24]), .B1(n1464), .Y(
        n720) );
  AO22XLTS U1409 ( .A0(n1465), .A1(n1124), .B0(d_ff2_Y[25]), .B1(n1464), .Y(
        n719) );
  AO22XLTS U1410 ( .A0(n1427), .A1(n1123), .B0(d_ff2_Y[26]), .B1(n1464), .Y(
        n718) );
  AO22XLTS U1411 ( .A0(n1465), .A1(n1122), .B0(d_ff2_Y[27]), .B1(n1464), .Y(
        n717) );
  AO22XLTS U1412 ( .A0(n1427), .A1(n1121), .B0(d_ff2_Y[29]), .B1(n1464), .Y(
        n715) );
  AO22XLTS U1413 ( .A0(n1465), .A1(n1120), .B0(d_ff2_Y[30]), .B1(n1464), .Y(
        n714) );
  AO22XLTS U1414 ( .A0(n1429), .A1(intadd_366_SUM_0_), .B0(n1449), .B1(
        d_ff3_sh_y_out[24]), .Y(n712) );
  AO22XLTS U1415 ( .A0(n1111), .A1(intadd_366_SUM_1_), .B0(n1449), .B1(
        d_ff3_sh_y_out[25]), .Y(n711) );
  AO22XLTS U1416 ( .A0(n1467), .A1(intadd_366_SUM_2_), .B0(n1449), .B1(
        d_ff3_sh_y_out[26]), .Y(n710) );
  NOR2X1TS U1417 ( .A(d_ff2_Y[27]), .B(intadd_366_n1), .Y(n1420) );
  AOI21X1TS U1418 ( .A0(intadd_366_n1), .A1(d_ff2_Y[27]), .B0(n1420), .Y(n1419) );
  AOI2BB2XLTS U1419 ( .B0(n1111), .B1(n1419), .A0N(d_ff3_sh_y_out[27]), .A1N(
        n1467), .Y(n709) );
  OR3X1TS U1420 ( .A(d_ff2_Y[27]), .B(d_ff2_Y[28]), .C(intadd_366_n1), .Y(
        n1422) );
  OAI21XLTS U1421 ( .A0(n1420), .A1(n1480), .B0(n1422), .Y(n1421) );
  AO22XLTS U1422 ( .A0(n1112), .A1(n1421), .B0(n1466), .B1(d_ff3_sh_y_out[28]), 
        .Y(n708) );
  NOR2X1TS U1423 ( .A(d_ff2_Y[29]), .B(n1422), .Y(n1424) );
  AOI21X1TS U1424 ( .A0(d_ff2_Y[29]), .A1(n1422), .B0(n1424), .Y(n1423) );
  AOI2BB2XLTS U1425 ( .B0(n1111), .B1(n1423), .A0N(d_ff3_sh_y_out[29]), .A1N(
        n1452), .Y(n707) );
  XOR2XLTS U1426 ( .A(d_ff2_Y[30]), .B(n1424), .Y(n1425) );
  AO22XLTS U1427 ( .A0(n1467), .A1(n1425), .B0(n1466), .B1(d_ff3_sh_y_out[30]), 
        .Y(n706) );
  AO22XLTS U1428 ( .A0(n1427), .A1(d_ff_Yn[31]), .B0(d_ff2_Y[31]), .B1(n1464), 
        .Y(n705) );
  AO22XLTS U1429 ( .A0(n1112), .A1(d_ff2_Y[31]), .B0(n1466), .B1(
        d_ff3_sh_y_out[31]), .Y(n704) );
  AO22XLTS U1430 ( .A0(n1465), .A1(n1119), .B0(d_ff2_X[0]), .B1(n1426), .Y(
        n703) );
  AO22XLTS U1431 ( .A0(n1112), .A1(d_ff2_X[0]), .B0(n1466), .B1(
        d_ff3_sh_x_out[0]), .Y(n702) );
  OA22X1TS U1432 ( .A0(d_ff_Xn[1]), .A1(n1435), .B0(n1433), .B1(d_ff2_X[1]), 
        .Y(n701) );
  AO22XLTS U1433 ( .A0(n1467), .A1(d_ff2_X[1]), .B0(n1466), .B1(
        d_ff3_sh_x_out[1]), .Y(n700) );
  OA22X1TS U1434 ( .A0(d_ff_Xn[2]), .A1(n1435), .B0(n1482), .B1(d_ff2_X[2]), 
        .Y(n699) );
  AO22XLTS U1435 ( .A0(n1112), .A1(d_ff2_X[2]), .B0(n1466), .B1(
        d_ff3_sh_x_out[2]), .Y(n698) );
  OA22X1TS U1436 ( .A0(d_ff_Xn[3]), .A1(n1435), .B0(n1434), .B1(d_ff2_X[3]), 
        .Y(n697) );
  AO22XLTS U1437 ( .A0(n1467), .A1(d_ff2_X[3]), .B0(n1466), .B1(
        d_ff3_sh_x_out[3]), .Y(n696) );
  AO22XLTS U1438 ( .A0(n1427), .A1(d_ff_Xn[4]), .B0(n1151), .B1(n1426), .Y(
        n695) );
  AO22XLTS U1439 ( .A0(n1467), .A1(n1151), .B0(n1466), .B1(d_ff3_sh_x_out[4]), 
        .Y(n694) );
  OA22X1TS U1440 ( .A0(d_ff_Xn[5]), .A1(n1227), .B0(n1433), .B1(n1165), .Y(
        n693) );
  AO22XLTS U1441 ( .A0(n1111), .A1(n1165), .B0(n1449), .B1(d_ff3_sh_x_out[5]), 
        .Y(n692) );
  OA22X1TS U1442 ( .A0(d_ff_Xn[6]), .A1(n1227), .B0(n1482), .B1(n1164), .Y(
        n691) );
  AO22XLTS U1443 ( .A0(n1429), .A1(n1164), .B0(n1466), .B1(d_ff3_sh_x_out[6]), 
        .Y(n690) );
  OA22X1TS U1444 ( .A0(d_ff_Xn[7]), .A1(n1435), .B0(n1482), .B1(n1163), .Y(
        n689) );
  AO22XLTS U1445 ( .A0(n1429), .A1(n1163), .B0(n1449), .B1(d_ff3_sh_x_out[7]), 
        .Y(n688) );
  AO22XLTS U1446 ( .A0(n1465), .A1(n1117), .B0(n1150), .B1(n1426), .Y(n687) );
  AO22XLTS U1447 ( .A0(n1429), .A1(n1150), .B0(n1466), .B1(d_ff3_sh_x_out[8]), 
        .Y(n686) );
  AO22XLTS U1448 ( .A0(n1427), .A1(n1116), .B0(n1149), .B1(n1426), .Y(n685) );
  AO22XLTS U1449 ( .A0(n1429), .A1(n1149), .B0(n1449), .B1(d_ff3_sh_x_out[9]), 
        .Y(n684) );
  OA22X1TS U1450 ( .A0(d_ff_Xn[10]), .A1(n1435), .B0(n1482), .B1(d_ff2_X[10]), 
        .Y(n683) );
  AO22XLTS U1451 ( .A0(n1429), .A1(d_ff2_X[10]), .B0(n1456), .B1(
        d_ff3_sh_x_out[10]), .Y(n682) );
  AO22XLTS U1452 ( .A0(n1432), .A1(d_ff_Xn[11]), .B0(d_ff2_X[11]), .B1(n1437), 
        .Y(n681) );
  AO22XLTS U1453 ( .A0(n1429), .A1(d_ff2_X[11]), .B0(n1449), .B1(
        d_ff3_sh_x_out[11]), .Y(n680) );
  OA22X1TS U1454 ( .A0(d_ff_Xn[12]), .A1(n1435), .B0(n1482), .B1(d_ff2_X[12]), 
        .Y(n679) );
  AO22XLTS U1455 ( .A0(n1429), .A1(d_ff2_X[12]), .B0(n1428), .B1(
        d_ff3_sh_x_out[12]), .Y(n678) );
  OA22X1TS U1456 ( .A0(d_ff_Xn[13]), .A1(n1435), .B0(n1482), .B1(d_ff2_X[13]), 
        .Y(n677) );
  AO22XLTS U1457 ( .A0(n1429), .A1(d_ff2_X[13]), .B0(n1428), .B1(
        d_ff3_sh_x_out[13]), .Y(n676) );
  OA22X1TS U1458 ( .A0(d_ff_Xn[14]), .A1(n1435), .B0(n1482), .B1(d_ff2_X[14]), 
        .Y(n675) );
  AO22XLTS U1459 ( .A0(n1429), .A1(d_ff2_X[14]), .B0(n1428), .B1(
        d_ff3_sh_x_out[14]), .Y(n674) );
  AO22XLTS U1460 ( .A0(n1432), .A1(d_ff_Xn[15]), .B0(d_ff2_X[15]), .B1(n1430), 
        .Y(n673) );
  AO22XLTS U1461 ( .A0(n1429), .A1(d_ff2_X[15]), .B0(n1449), .B1(
        d_ff3_sh_x_out[15]), .Y(n672) );
  OA22X1TS U1462 ( .A0(d_ff_Xn[16]), .A1(n1435), .B0(n1482), .B1(d_ff2_X[16]), 
        .Y(n671) );
  AO22XLTS U1463 ( .A0(n1429), .A1(d_ff2_X[16]), .B0(n1456), .B1(
        d_ff3_sh_x_out[16]), .Y(n670) );
  OA22X1TS U1464 ( .A0(d_ff_Xn[17]), .A1(n1435), .B0(n1434), .B1(d_ff2_X[17]), 
        .Y(n669) );
  AO22XLTS U1465 ( .A0(n1467), .A1(d_ff2_X[17]), .B0(n1428), .B1(
        d_ff3_sh_x_out[17]), .Y(n668) );
  AO22XLTS U1466 ( .A0(n1432), .A1(d_ff_Xn[18]), .B0(d_ff2_X[18]), .B1(n1437), 
        .Y(n667) );
  AO22XLTS U1467 ( .A0(n1429), .A1(d_ff2_X[18]), .B0(n1466), .B1(
        d_ff3_sh_x_out[18]), .Y(n666) );
  OA22X1TS U1468 ( .A0(d_ff_Xn[19]), .A1(n1435), .B0(n1434), .B1(d_ff2_X[19]), 
        .Y(n665) );
  AO22XLTS U1469 ( .A0(n1467), .A1(d_ff2_X[19]), .B0(n1431), .B1(
        d_ff3_sh_x_out[19]), .Y(n664) );
  OA22X1TS U1470 ( .A0(d_ff_Xn[20]), .A1(n1435), .B0(n1433), .B1(d_ff2_X[20]), 
        .Y(n663) );
  AO22XLTS U1471 ( .A0(n1467), .A1(d_ff2_X[20]), .B0(n1428), .B1(
        d_ff3_sh_x_out[20]), .Y(n662) );
  AO22XLTS U1472 ( .A0(n1432), .A1(d_ff_Xn[21]), .B0(d_ff2_X[21]), .B1(n1430), 
        .Y(n661) );
  AO22XLTS U1473 ( .A0(n1467), .A1(d_ff2_X[21]), .B0(n1446), .B1(
        d_ff3_sh_x_out[21]), .Y(n660) );
  AO22XLTS U1474 ( .A0(n1432), .A1(d_ff_Xn[22]), .B0(n1148), .B1(n1437), .Y(
        n659) );
  AO22XLTS U1475 ( .A0(n1452), .A1(n1148), .B0(n1431), .B1(d_ff3_sh_x_out[22]), 
        .Y(n658) );
  AO22XLTS U1476 ( .A0(n1432), .A1(n1115), .B0(d_ff2_X[23]), .B1(n1437), .Y(
        n657) );
  OA22X1TS U1477 ( .A0(n1482), .A1(d_ff2_X[24]), .B0(d_ff_Xn[24]), .B1(n1435), 
        .Y(n656) );
  OA22X1TS U1478 ( .A0(d_ff_Xn[25]), .A1(n1435), .B0(n1433), .B1(n1168), .Y(
        n655) );
  OA22X1TS U1479 ( .A0(d_ff_Xn[26]), .A1(n1227), .B0(n1433), .B1(n1167), .Y(
        n654) );
  OA22X1TS U1480 ( .A0(n1482), .A1(d_ff2_X[27]), .B0(d_ff_Xn[27]), .B1(n1435), 
        .Y(n653) );
  OA22X1TS U1481 ( .A0(n1434), .A1(d_ff2_X[28]), .B0(d_ff_Xn[28]), .B1(n1435), 
        .Y(n652) );
  OA22X1TS U1482 ( .A0(n1433), .A1(d_ff2_X[29]), .B0(d_ff_Xn[29]), .B1(n1435), 
        .Y(n651) );
  AO22XLTS U1483 ( .A0(n1114), .A1(n1437), .B0(n1436), .B1(d_ff_Xn[30]), .Y(
        n650) );
  NOR2X2TS U1484 ( .A(d_ff2_X[23]), .B(n1438), .Y(n1445) );
  AOI22X1TS U1485 ( .A0(n1439), .A1(d_ff2_X[23]), .B0(d_ff3_sh_x_out[23]), 
        .B1(n1459), .Y(n1440) );
  OAI2BB1X1TS U1486 ( .A0N(n1112), .A1N(n1445), .B0(n1440), .Y(n649) );
  XOR2X1TS U1487 ( .A(n1445), .B(d_ff2_X[24]), .Y(n1441) );
  MXI2X1TS U1488 ( .A(n1443), .B(n1442), .S0(n1441), .Y(n1444) );
  AO21XLTS U1489 ( .A0(d_ff3_sh_x_out[24]), .A1(n1456), .B0(n1444), .Y(n648)
         );
  AOI222X1TS U1490 ( .A0(cont_iter_out[1]), .A1(n1445), .B0(cont_iter_out[1]), 
        .B1(n1475), .C0(n1445), .C1(n1475), .Y(n1448) );
  AO22XLTS U1491 ( .A0(n1452), .A1(n1447), .B0(n1446), .B1(d_ff3_sh_x_out[25]), 
        .Y(n647) );
  CMPR32X2TS U1492 ( .A(intadd_366_B_1_), .B(n1168), .C(n1448), .CO(n1451), 
        .S(n1447) );
  AO22XLTS U1493 ( .A0(n1112), .A1(n1450), .B0(n1449), .B1(d_ff3_sh_x_out[26]), 
        .Y(n646) );
  CMPR32X2TS U1494 ( .A(n1471), .B(n1167), .C(n1451), .CO(n1454), .S(n1450) );
  NOR2X1TS U1495 ( .A(d_ff2_X[27]), .B(n1454), .Y(n1455) );
  AOI21X1TS U1496 ( .A0(n1454), .A1(d_ff2_X[27]), .B0(n1455), .Y(n1453) );
  AOI2BB2XLTS U1497 ( .B0(n1112), .B1(n1453), .A0N(d_ff3_sh_x_out[27]), .A1N(
        n1467), .Y(n645) );
  OR3X1TS U1498 ( .A(n1454), .B(d_ff2_X[27]), .C(d_ff2_X[28]), .Y(n1458) );
  OAI21XLTS U1499 ( .A0(n1455), .A1(n1477), .B0(n1458), .Y(n1457) );
  AO22XLTS U1500 ( .A0(n1111), .A1(n1457), .B0(n1456), .B1(d_ff3_sh_x_out[28]), 
        .Y(n644) );
  NOR2X1TS U1501 ( .A(d_ff2_X[29]), .B(n1458), .Y(n1461) );
  AOI21X1TS U1502 ( .A0(d_ff2_X[29]), .A1(n1458), .B0(n1461), .Y(n1460) );
  AOI22X1TS U1503 ( .A0(n1452), .A1(n1460), .B0(n1170), .B1(n1459), .Y(n643)
         );
  XOR2XLTS U1504 ( .A(n1114), .B(n1461), .Y(n1462) );
  AO22XLTS U1505 ( .A0(n1112), .A1(n1462), .B0(n1428), .B1(d_ff3_sh_x_out[30]), 
        .Y(n642) );
  AO22XLTS U1506 ( .A0(n1465), .A1(n1166), .B0(n1147), .B1(n1464), .Y(n641) );
  AO22XLTS U1507 ( .A0(n1452), .A1(n1147), .B0(n1466), .B1(d_ff3_sh_x_out[31]), 
        .Y(n640) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_syn.sdf"); 
 endmodule

