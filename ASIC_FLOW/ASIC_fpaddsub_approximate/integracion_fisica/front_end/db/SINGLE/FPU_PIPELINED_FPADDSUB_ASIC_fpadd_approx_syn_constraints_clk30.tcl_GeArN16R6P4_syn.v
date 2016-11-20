/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 19:50:08 2016
/////////////////////////////////////////////////////////////


module FPU_PIPELINED_FPADDSUB_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_OP, 
        Data_X, Data_Y, add_subt, busy, overflow_flag, underflow_flag, 
        zero_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  output [31:0] final_result_ieee;
  input clk, rst, beg_OP, add_subt;
  output busy, overflow_flag, underflow_flag, zero_flag, ready;
  wire   Shift_reg_FLAGS_7_6, intAS, SIGN_FLAG_EXP, OP_FLAG_EXP, ZERO_FLAG_EXP,
         SIGN_FLAG_SHT1, OP_FLAG_SHT1, ZERO_FLAG_SHT1, left_right_SHT2,
         SIGN_FLAG_SHT2, OP_FLAG_SHT2, ZERO_FLAG_SHT2, SIGN_FLAG_SHT1SHT2,
         ZERO_FLAG_SHT1SHT2, SIGN_FLAG_NRM, ZERO_FLAG_NRM, SIGN_FLAG_SFG,
         OP_FLAG_SFG, ZERO_FLAG_SFG, inst_FSM_INPUT_ENABLE_state_next_1_, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816,
         n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         DP_OP_15J60_123_4652_n8, DP_OP_15J60_123_4652_n7,
         DP_OP_15J60_123_4652_n6, DP_OP_15J60_123_4652_n5,
         DP_OP_15J60_123_4652_n4, intadd_68_B_14_, intadd_68_B_13_,
         intadd_68_B_12_, intadd_68_B_11_, intadd_68_B_10_, intadd_68_B_9_,
         intadd_68_B_8_, intadd_68_B_7_, intadd_68_B_6_, intadd_68_B_5_,
         intadd_68_B_4_, intadd_68_B_3_, intadd_68_B_2_, intadd_68_B_1_,
         intadd_68_B_0_, intadd_68_CI, intadd_68_SUM_14_, intadd_68_SUM_13_,
         intadd_68_SUM_12_, intadd_68_SUM_11_, intadd_68_SUM_10_,
         intadd_68_SUM_9_, intadd_68_SUM_8_, intadd_68_SUM_7_,
         intadd_68_SUM_6_, intadd_68_SUM_5_, intadd_68_SUM_4_,
         intadd_68_SUM_3_, intadd_68_SUM_2_, intadd_68_SUM_1_,
         intadd_68_SUM_0_, intadd_68_n15, intadd_68_n14, intadd_68_n13,
         intadd_68_n12, intadd_68_n11, intadd_68_n10, intadd_68_n9,
         intadd_68_n8, intadd_68_n7, intadd_68_n6, intadd_68_n5, intadd_68_n4,
         intadd_68_n3, intadd_68_n2, intadd_68_n1, intadd_69_A_4_,
         intadd_69_A_3_, intadd_69_B_4_, intadd_69_B_3_, intadd_69_B_2_,
         intadd_69_B_1_, intadd_69_B_0_, intadd_69_CI, intadd_69_SUM_4_,
         intadd_69_SUM_3_, intadd_69_SUM_2_, intadd_69_SUM_1_,
         intadd_69_SUM_0_, intadd_69_n5, intadd_69_n4, intadd_69_n3,
         intadd_69_n2, intadd_69_n1, n872, n873, n874, n875, n876, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n895, n896, n897, n898, n899, n900, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987, n988, n989,
         n990, n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000,
         n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010,
         n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020,
         n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030,
         n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040,
         n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050,
         n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060,
         n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070,
         n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
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
         n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220,
         n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1231,
         n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242,
         n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252,
         n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262,
         n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272,
         n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282,
         n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292,
         n1293, n1294, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1331, n1332, n1333, n1334,
         n1336, n1337, n1338, n1339, n1340, n1341, n1345, n1346, n1347, n1348,
         n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1357, n1358, n1359,
         n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369,
         n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379,
         n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389,
         n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399,
         n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409,
         n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419,
         n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1428, n1429, n1430,
         n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440,
         n1441, n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450,
         n1451, n1452, n1453, n1454, n1455, n1456, n1457, n1458, n1459, n1460,
         n1461, n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470,
         n1471, n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480,
         n1481, n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490,
         n1491, n1492, n1493, n1494, n1495, n1496, n1497, n1498, n1499, n1500,
         n1501, n1502, n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510,
         n1511, n1512, n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520,
         n1521, n1522, n1523, n1524, n1525, n1526, n1527, n1528, n1529, n1530,
         n1531, n1532, n1533, n1534, n1535, n1536, n1537, n1538, n1539, n1540,
         n1541, n1542, n1543, n1544, n1545, n1546, n1547, n1548, n1549, n1550,
         n1551, n1552, n1553, n1554, n1555, n1556, n1557, n1558, n1559, n1560,
         n1561, n1562, n1563, n1564, n1565, n1566, n1567, n1568, n1569, n1570,
         n1572, n1573, n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581,
         n1582, n1583, n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591,
         n1592, n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602,
         n1604, n1605, n1606;
  wire   [1:0] Shift_reg_FLAGS_7;
  wire   [31:1] intDX_EWSW;
  wire   [31:0] intDY_EWSW;
  wire   [30:0] DMP_EXP_EWSW;
  wire   [27:0] DmP_EXP_EWSW;
  wire   [30:0] DMP_SHT1_EWSW;
  wire   [22:0] DmP_mant_SHT1_SW;
  wire   [4:0] Shift_amount_SHT1_EWR;
  wire   [25:0] Raw_mant_NRM_SWR;
  wire   [25:0] Data_array_SWR;
  wire   [30:0] DMP_SHT2_EWSW;
  wire   [4:2] shift_value_SHT2_EWR;
  wire   [7:0] DMP_exp_NRM2_EW;
  wire   [7:0] DMP_exp_NRM_EW;
  wire   [4:0] LZD_output_NRM2_EW;
  wire   [4:1] exp_rslt_NRM2_EW1;
  wire   [30:0] DMP_SFG;
  wire   [25:0] DmP_mant_SFG_SWR;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(n866), .CK(clk), .RN(n1573), .QN(
        n883) );
  DFFRXLTS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(n862), .CK(clk), .RN(n1574), 
        .QN(n880) );
  DFFRXLTS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n829), .CK(clk), .RN(n1581), .Q(
        left_right_SHT2) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n1574), 
        .Q(ready) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(n765), .CK(clk), .RN(n1573), 
        .Q(Shift_amount_SHT1_EWR[1]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(n764), .CK(clk), .RN(n1577), 
        .Q(Shift_amount_SHT1_EWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(n763), .CK(clk), .RN(n1580), 
        .Q(Shift_amount_SHT1_EWR[3]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(n762), .CK(clk), .RN(n876), .Q(
        Shift_amount_SHT1_EWR[4]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(n761), .CK(clk), .RN(n1585), .Q(
        final_result_ieee[23]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(n760), .CK(clk), .RN(n1600), .Q(
        final_result_ieee[24]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(n759), .CK(clk), .RN(n1582), .Q(
        final_result_ieee[25]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(n758), .CK(clk), .RN(n1586), .Q(
        final_result_ieee[26]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(n757), .CK(clk), .RN(n1583), .Q(
        final_result_ieee[27]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(n756), .CK(clk), .RN(n1587), .Q(
        final_result_ieee[28]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(n755), .CK(clk), .RN(n1590), .Q(
        final_result_ieee[29]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(n754), .CK(clk), .RN(n1590), .Q(
        final_result_ieee[30]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(n753), .CK(clk), .RN(n1579), .Q(
        DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(n752), .CK(clk), .RN(n1578), .Q(
        DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(n751), .CK(clk), .RN(n1585), .Q(
        DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(n750), .CK(clk), .RN(n1577), .Q(
        DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(n749), .CK(clk), .RN(n1580), .Q(
        DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(n748), .CK(clk), .RN(n876), .Q(
        DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(n747), .CK(clk), .RN(n1579), .Q(
        DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(n746), .CK(clk), .RN(n1576), .Q(
        DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(n745), .CK(clk), .RN(n876), .Q(
        DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(n744), .CK(clk), .RN(n1576), .Q(
        DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(n743), .CK(clk), .RN(n1573), .Q(
        DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(n742), .CK(clk), .RN(n1578), .Q(
        DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(n741), .CK(clk), .RN(n1581), .Q(
        DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(n740), .CK(clk), .RN(n1574), .Q(
        DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(n739), .CK(clk), .RN(n1575), .Q(
        DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(n738), .CK(clk), .RN(n1576), .Q(
        DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(n737), .CK(clk), .RN(n1573), .Q(
        DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(n736), .CK(clk), .RN(n1578), .Q(
        DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(n735), .CK(clk), .RN(n1581), .Q(
        DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(n734), .CK(clk), .RN(n1574), .Q(
        DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(n733), .CK(clk), .RN(n1575), .Q(
        DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(n732), .CK(clk), .RN(n1590), .Q(
        DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(n731), .CK(clk), .RN(n1599), .Q(
        DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_27_ ( .D(n726), .CK(clk), .RN(n1587), .QN(n885)
         );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(n725), .CK(clk), .RN(n1583), .Q(
        DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(n724), .CK(clk), .RN(n1590), .Q(
        DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(n723), .CK(clk), .RN(n1600), .Q(
        DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(n722), .CK(clk), .RN(n1599), .Q(
        OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_0_ ( .D(n721), .CK(clk), .RN(n1590), .Q(
        ZERO_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(n720), .CK(clk), .RN(n1590), .Q(
        SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(n719), .CK(clk), .RN(n1590), .Q(
        DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(n718), .CK(clk), .RN(n1587), .Q(
        DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(n716), .CK(clk), .RN(n1583), .Q(
        DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(n715), .CK(clk), .RN(n1586), .Q(
        DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(n713), .CK(clk), .RN(n1582), .Q(
        DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(n712), .CK(clk), .RN(n1599), .Q(
        DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(n710), .CK(clk), .RN(n1600), .Q(
        DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(n709), .CK(clk), .RN(n1599), .Q(
        DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(n707), .CK(clk), .RN(n1601), .Q(
        DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(n706), .CK(clk), .RN(n1589), .Q(
        DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(n704), .CK(clk), .RN(n1595), .Q(
        DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(n703), .CK(clk), .RN(n1585), .Q(
        DMP_SHT2_EWSW[5]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_5_ ( .D(n702), .CK(clk), .RN(n1584), .Q(
        DMP_SFG[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(n701), .CK(clk), .RN(n1589), .Q(
        DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(n700), .CK(clk), .RN(n1601), .Q(
        DMP_SHT2_EWSW[6]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_6_ ( .D(n699), .CK(clk), .RN(n1601), .Q(
        DMP_SFG[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(n698), .CK(clk), .RN(n1589), .Q(
        DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(n697), .CK(clk), .RN(n1589), .Q(
        DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(n695), .CK(clk), .RN(n1588), .Q(
        DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(n694), .CK(clk), .RN(n1588), .Q(
        DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(n692), .CK(clk), .RN(n1595), .Q(
        DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(n691), .CK(clk), .RN(n1595), .Q(
        DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(n689), .CK(clk), .RN(n1601), .Q(
        DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(n688), .CK(clk), .RN(n1584), .Q(
        DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(n686), .CK(clk), .RN(n1595), .Q(
        DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(n685), .CK(clk), .RN(n1584), .Q(
        DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(n683), .CK(clk), .RN(n1583), .Q(
        DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(n682), .CK(clk), .RN(n1587), .Q(
        DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(n680), .CK(clk), .RN(n1582), .Q(
        DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(n679), .CK(clk), .RN(n1600), .Q(
        DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(n677), .CK(clk), .RN(n1590), .Q(
        DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(n676), .CK(clk), .RN(n1586), .Q(
        DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(n674), .CK(clk), .RN(n1587), .Q(
        DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(n673), .CK(clk), .RN(n1599), .Q(
        DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(n671), .CK(clk), .RN(n1583), .Q(
        DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(n670), .CK(clk), .RN(n1586), .Q(
        DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(n668), .CK(clk), .RN(n1582), .Q(
        DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(n667), .CK(clk), .RN(n1600), .Q(
        DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(n665), .CK(clk), .RN(n1599), .Q(
        DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(n664), .CK(clk), .RN(n1590), .Q(
        DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(n662), .CK(clk), .RN(n1587), .Q(
        DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(n661), .CK(clk), .RN(n1583), .Q(
        DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(n659), .CK(clk), .RN(n1595), .Q(
        DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(n658), .CK(clk), .RN(n1588), .Q(
        DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(n656), .CK(clk), .RN(n1585), .Q(
        DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(n655), .CK(clk), .RN(n1601), .Q(
        DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(n653), .CK(clk), .RN(n1584), .Q(
        DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(n652), .CK(clk), .RN(n1601), .Q(
        DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(n650), .CK(clk), .RN(n1601), .Q(
        DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(n649), .CK(clk), .RN(n1589), .Q(
        DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(n648), .CK(clk), .RN(n1585), .Q(
        DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(n647), .CK(clk), .RN(n1595), .Q(
        DMP_exp_NRM_EW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(n645), .CK(clk), .RN(n1601), .Q(
        DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(n644), .CK(clk), .RN(n1601), .Q(
        DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(n643), .CK(clk), .RN(n1589), .Q(
        DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(n642), .CK(clk), .RN(n1595), .Q(
        DMP_exp_NRM_EW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(n640), .CK(clk), .RN(n1584), .Q(
        DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(n639), .CK(clk), .RN(n1585), .Q(
        DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(n638), .CK(clk), .RN(n1588), .Q(
        DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(n637), .CK(clk), .RN(n1595), .Q(
        DMP_exp_NRM_EW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(n635), .CK(clk), .RN(n1585), .Q(
        DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(n634), .CK(clk), .RN(n1589), .Q(
        DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(n633), .CK(clk), .RN(n1592), .Q(
        DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(n632), .CK(clk), .RN(n932), .Q(
        DMP_exp_NRM_EW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(n630), .CK(clk), .RN(n1596), .Q(
        DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(n629), .CK(clk), .RN(n1576), .Q(
        DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(n628), .CK(clk), .RN(n931), .Q(
        DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(n627), .CK(clk), .RN(n931), .Q(
        DMP_exp_NRM_EW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(n625), .CK(clk), .RN(n1592), .Q(
        DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(n624), .CK(clk), .RN(n932), .Q(
        DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(n623), .CK(clk), .RN(n1596), .Q(
        DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(n622), .CK(clk), .RN(n1585), .Q(
        DMP_exp_NRM_EW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(n620), .CK(clk), .RN(n1586), .Q(
        DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(n619), .CK(clk), .RN(n933), .Q(
        DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(n618), .CK(clk), .RN(n1582), .Q(
        DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(n617), .CK(clk), .RN(n1599), .Q(
        DMP_exp_NRM_EW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(n615), .CK(clk), .RN(n1600), .Q(
        DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(n614), .CK(clk), .RN(n1599), .Q(
        DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(n613), .CK(clk), .RN(n1587), .Q(
        DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(n612), .CK(clk), .RN(n1583), .Q(
        DMP_exp_NRM_EW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(n610), .CK(clk), .RN(n1586), .Q(
        DmP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(n608), .CK(clk), .RN(n1582), .Q(
        DmP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(n606), .CK(clk), .RN(n1600), .Q(
        DmP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(n604), .CK(clk), .RN(n1574), .Q(
        DmP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(n602), .CK(clk), .RN(n1583), .Q(
        DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(n601), .CK(clk), .RN(n1600), .QN(
        n889) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(n600), .CK(clk), .RN(n1586), .Q(
        DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(n599), .CK(clk), .RN(n1587), .QN(
        n886) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(n598), .CK(clk), .RN(n1578), .Q(
        DmP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(n596), .CK(clk), .RN(n1588), .Q(
        DmP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(n594), .CK(clk), .RN(n1584), .Q(
        DmP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(n592), .CK(clk), .RN(n1584), .Q(
        DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(n591), .CK(clk), .RN(n1582), .QN(
        n890) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(n590), .CK(clk), .RN(n1598), .Q(
        DmP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(n588), .CK(clk), .RN(n1597), .Q(
        DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(n587), .CK(clk), .RN(n1594), 
        .QN(n887) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(n586), .CK(clk), .RN(n1591), .Q(
        DmP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(n584), .CK(clk), .RN(n1598), .Q(
        DmP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(n582), .CK(clk), .RN(n1597), .Q(
        DmP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(n580), .CK(clk), .RN(n1592), .Q(
        DmP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(n578), .CK(clk), .RN(n932), .Q(
        DmP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(n576), .CK(clk), .RN(n1596), .Q(
        DmP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(n574), .CK(clk), .RN(n1595), .Q(
        DmP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(n572), .CK(clk), .RN(n931), .Q(
        DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(n571), .CK(clk), .RN(n1592), 
        .QN(n888) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(n570), .CK(clk), .RN(n932), .Q(
        DmP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(n568), .CK(clk), .RN(n932), .Q(
        DmP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(n566), .CK(clk), .RN(n933), .Q(
        DmP_EXP_EWSW[22]) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n559), .CK(clk), .RN(n1596), .Q(
        underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n558), .CK(clk), .RN(n1582), .Q(
        overflow_flag) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_0_ ( .D(n557), .CK(clk), .RN(n1601), .Q(
        ZERO_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_0_ ( .D(n556), .CK(clk), .RN(n1592), .Q(
        ZERO_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_0_ ( .D(n555), .CK(clk), .RN(n1594), .Q(
        ZERO_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_0_ ( .D(n554), .CK(clk), .RN(n1591), .Q(
        ZERO_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(n553), .CK(clk), .RN(n1598), .Q(
        ZERO_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(n552), .CK(clk), .RN(n1597), .Q(
        zero_flag) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(n551), .CK(clk), .RN(n1594), .Q(
        OP_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(n550), .CK(clk), .RN(n1591), .Q(
        OP_FLAG_SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(n548), .CK(clk), .RN(n1598), .Q(
        SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(n547), .CK(clk), .RN(n1597), .Q(
        SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(n546), .CK(clk), .RN(n1594), .Q(
        SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(n545), .CK(clk), .RN(n1591), .Q(
        SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n544), .CK(clk), .RN(n1598), .Q(
        SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(n543), .CK(clk), .RN(n1600), .Q(
        final_result_ieee[31]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(n515), .CK(clk), .RN(n1585), .Q(
        LZD_output_NRM2_EW[0]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(n511), .CK(clk), .RN(n1587), .Q(
        final_result_ieee[10]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(n510), .CK(clk), .RN(n1596), .Q(
        final_result_ieee[11]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(n509), .CK(clk), .RN(n1574), .Q(
        final_result_ieee[9]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(n508), .CK(clk), .RN(n933), .Q(
        final_result_ieee[12]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(n507), .CK(clk), .RN(n931), .Q(
        final_result_ieee[8]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(n506), .CK(clk), .RN(n1592), .Q(
        final_result_ieee[13]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(n505), .CK(clk), .RN(n932), .Q(
        final_result_ieee[7]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(n504), .CK(clk), .RN(n1596), .Q(
        final_result_ieee[14]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(n503), .CK(clk), .RN(n1578), .Q(
        final_result_ieee[6]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(n502), .CK(clk), .RN(n1581), .Q(
        final_result_ieee[15]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(n501), .CK(clk), .RN(n1597), .Q(
        final_result_ieee[5]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(n500), .CK(clk), .RN(n1594), .Q(
        final_result_ieee[16]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(n499), .CK(clk), .RN(n1591), .Q(
        final_result_ieee[4]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(n498), .CK(clk), .RN(n1598), .Q(
        final_result_ieee[17]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(n497), .CK(clk), .RN(n1597), .Q(
        final_result_ieee[3]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(n496), .CK(clk), .RN(n1594), .Q(
        final_result_ieee[18]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(n495), .CK(clk), .RN(n1591), .Q(
        final_result_ieee[2]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(n494), .CK(clk), .RN(n1581), .Q(
        final_result_ieee[19]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(n493), .CK(clk), .RN(n1598), .Q(
        final_result_ieee[1]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(n492), .CK(clk), .RN(n1597), .Q(
        final_result_ieee[0]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(n491), .CK(clk), .RN(n1594), .Q(
        final_result_ieee[20]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(n490), .CK(clk), .RN(n1591), .Q(
        final_result_ieee[21]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(n489), .CK(clk), .RN(n1573), .Q(
        final_result_ieee[22]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(n488), .CK(clk), .RN(n1587), .Q(
        DmP_mant_SFG_SWR[0]), .QN(n913) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(n487), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SFG_SWR[1]), .QN(n917) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(n486), .CK(clk), .RN(n1597), .Q(
        DmP_mant_SFG_SWR[2]), .QN(n918) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(n485), .CK(clk), .RN(n1594), .Q(
        DmP_mant_SFG_SWR[3]), .QN(n919) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(n484), .CK(clk), .RN(n1591), .Q(
        DmP_mant_SFG_SWR[4]), .QN(n920) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(n483), .CK(clk), .RN(n1586), .Q(
        DmP_mant_SFG_SWR[5]), .QN(n921) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(n482), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SFG_SWR[6]), .QN(n922) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(n479), .CK(clk), .RN(n1591), .Q(
        DmP_mant_SFG_SWR[9]), .QN(n926) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(n472), .CK(clk), .RN(n1599), .Q(
        DmP_mant_SFG_SWR[16]), .QN(n927) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(n471), .CK(clk), .RN(n1590), .Q(
        DmP_mant_SFG_SWR[17]), .QN(n928) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(n470), .CK(clk), .RN(n1587), .Q(
        DmP_mant_SFG_SWR[18]), .QN(n924) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(n469), .CK(clk), .RN(n1583), .Q(
        DmP_mant_SFG_SWR[19]), .QN(n909) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(n468), .CK(clk), .RN(n1586), .Q(
        DmP_mant_SFG_SWR[20]), .QN(n910) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(n467), .CK(clk), .RN(n1582), .Q(
        DmP_mant_SFG_SWR[21]), .QN(n911) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(n465), .CK(clk), .RN(n1587), .Q(
        DmP_mant_SFG_SWR[23]), .QN(n914) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(n464), .CK(clk), .RN(n1583), .Q(
        DmP_mant_SFG_SWR[24]), .QN(n915) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(n463), .CK(clk), .RN(n1586), .Q(
        DmP_mant_SFG_SWR[25]), .QN(n916) );
  CMPR32X2TS intadd_68_U16 ( .A(n1503), .B(intadd_68_B_0_), .C(intadd_68_CI), 
        .CO(intadd_68_n15), .S(intadd_68_SUM_0_) );
  CMPR32X2TS intadd_68_U15 ( .A(n1510), .B(intadd_68_B_1_), .C(intadd_68_n15), 
        .CO(intadd_68_n14), .S(intadd_68_SUM_1_) );
  CMPR32X2TS intadd_68_U14 ( .A(n1509), .B(intadd_68_B_2_), .C(intadd_68_n14), 
        .CO(intadd_68_n13), .S(intadd_68_SUM_2_) );
  CMPR32X2TS intadd_68_U13 ( .A(n1516), .B(intadd_68_B_3_), .C(intadd_68_n13), 
        .CO(intadd_68_n12), .S(intadd_68_SUM_3_) );
  CMPR32X2TS intadd_68_U12 ( .A(n1515), .B(intadd_68_B_4_), .C(intadd_68_n12), 
        .CO(intadd_68_n11), .S(intadd_68_SUM_4_) );
  CMPR32X2TS intadd_68_U11 ( .A(n1521), .B(intadd_68_B_5_), .C(intadd_68_n11), 
        .CO(intadd_68_n10), .S(intadd_68_SUM_5_) );
  CMPR32X2TS intadd_68_U10 ( .A(n1520), .B(intadd_68_B_6_), .C(intadd_68_n10), 
        .CO(intadd_68_n9), .S(intadd_68_SUM_6_) );
  CMPR32X2TS intadd_68_U9 ( .A(n1527), .B(intadd_68_B_7_), .C(intadd_68_n9), 
        .CO(intadd_68_n8), .S(intadd_68_SUM_7_) );
  CMPR32X2TS intadd_68_U8 ( .A(n1549), .B(intadd_68_B_8_), .C(intadd_68_n8), 
        .CO(intadd_68_n7), .S(intadd_68_SUM_8_) );
  CMPR32X2TS intadd_68_U7 ( .A(n1548), .B(intadd_68_B_9_), .C(intadd_68_n7), 
        .CO(intadd_68_n6), .S(intadd_68_SUM_9_) );
  CMPR32X2TS intadd_68_U6 ( .A(n1557), .B(intadd_68_B_10_), .C(intadd_68_n6), 
        .CO(intadd_68_n5), .S(intadd_68_SUM_10_) );
  CMPR32X2TS intadd_68_U5 ( .A(n1556), .B(intadd_68_B_11_), .C(intadd_68_n5), 
        .CO(intadd_68_n4), .S(intadd_68_SUM_11_) );
  CMPR32X2TS intadd_68_U4 ( .A(n1565), .B(intadd_68_B_12_), .C(intadd_68_n4), 
        .CO(intadd_68_n3), .S(intadd_68_SUM_12_) );
  CMPR32X2TS intadd_68_U3 ( .A(n1564), .B(intadd_68_B_13_), .C(intadd_68_n3), 
        .CO(intadd_68_n2), .S(intadd_68_SUM_13_) );
  CMPR32X2TS intadd_68_U2 ( .A(n1569), .B(intadd_68_B_14_), .C(intadd_68_n2), 
        .CO(intadd_68_n1), .S(intadd_68_SUM_14_) );
  CMPR32X2TS intadd_69_U6 ( .A(n1555), .B(intadd_69_B_0_), .C(intadd_69_CI), 
        .CO(intadd_69_n5), .S(intadd_69_SUM_0_) );
  CMPR32X2TS intadd_69_U5 ( .A(n1554), .B(intadd_69_B_1_), .C(intadd_69_n5), 
        .CO(intadd_69_n4), .S(intadd_69_SUM_1_) );
  CMPR32X2TS intadd_69_U4 ( .A(n1552), .B(intadd_69_B_2_), .C(intadd_69_n4), 
        .CO(intadd_69_n3), .S(intadd_69_SUM_2_) );
  CMPR32X2TS intadd_69_U3 ( .A(intadd_69_A_3_), .B(intadd_69_B_3_), .C(
        intadd_69_n3), .CO(intadd_69_n2), .S(intadd_69_SUM_3_) );
  CMPR32X2TS intadd_69_U2 ( .A(intadd_69_A_4_), .B(intadd_69_B_4_), .C(
        intadd_69_n2), .CO(intadd_69_n1), .S(intadd_69_SUM_4_) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(n838), .CK(clk), .RN(n1581), 
        .Q(intDX_EWSW[24]), .QN(n1562) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(n785), .CK(clk), .RN(n1577), .Q(
        Data_array_SWR[14]), .QN(n1561) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(n783), .CK(clk), .RN(n1579), .Q(
        Data_array_SWR[12]), .QN(n1560) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(n794), .CK(clk), .RN(n1581), .Q(
        Data_array_SWR[23]), .QN(n1559) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(n539), .CK(clk), .RN(n1588), .Q(
        Raw_mant_NRM_SWR[3]), .QN(n1551) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(n810), .CK(clk), .RN(n1580), 
        .Q(intDY_EWSW[18]), .QN(n1546) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(n798), .CK(clk), .RN(n1576), 
        .Q(intDY_EWSW[30]), .QN(n1544) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(n805), .CK(clk), .RN(n1577), 
        .Q(intDY_EWSW[23]), .QN(n1543) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(n802), .CK(clk), .RN(n1587), 
        .Q(intDY_EWSW[26]), .QN(n1541) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(n808), .CK(clk), .RN(n1583), 
        .Q(intDY_EWSW[20]), .QN(n1540) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(n814), .CK(clk), .RN(n1576), 
        .Q(intDY_EWSW[14]), .QN(n1538) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(n816), .CK(clk), .RN(n1580), 
        .Q(intDY_EWSW[12]), .QN(n1537) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(n820), .CK(clk), .RN(n876), .Q(
        intDY_EWSW[8]), .QN(n1534) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(n827), .CK(clk), .RN(n1574), .Q(
        intDY_EWSW[1]), .QN(n1533) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(n807), .CK(clk), .RN(n876), .Q(
        intDY_EWSW[21]), .QN(n1532) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(n815), .CK(clk), .RN(n876), .Q(
        intDY_EWSW[13]), .QN(n1531) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(n825), .CK(clk), .RN(n1577), .Q(
        intDY_EWSW[3]), .QN(n1529) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(n856), .CK(clk), .RN(n1576), .Q(
        intDX_EWSW[6]), .QN(n1514) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(n846), .CK(clk), .RN(n1578), 
        .Q(intDX_EWSW[16]), .QN(n1513) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(n767), .CK(clk), .RN(n1580), .Q(
        shift_value_SHT2_EWR[4]), .QN(n1511) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(n857), .CK(clk), .RN(n1574), .Q(
        intDX_EWSW[5]), .QN(n1507) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(n837), .CK(clk), .RN(n1574), 
        .Q(intDX_EWSW[25]), .QN(n1499) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(n799), .CK(clk), .RN(n1574), 
        .Q(intDY_EWSW[29]), .QN(n1493) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(n806), .CK(clk), .RN(n1579), 
        .Q(intDY_EWSW[22]), .QN(n1492) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(
        inst_FSM_INPUT_ENABLE_state_next_1_), .CK(clk), .RN(n1578), .Q(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n1489) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(n855), .CK(clk), .RN(n1573), .Q(
        intDX_EWSW[7]), .QN(n1488) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(n858), .CK(clk), .RN(n1581), .Q(
        intDX_EWSW[4]), .QN(n1487) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(n531), .CK(clk), .RN(n1601), .Q(
        Raw_mant_NRM_SWR[11]), .QN(n1475) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(n803), .CK(clk), .RN(n1577), 
        .Q(intDY_EWSW[25]), .QN(n1606) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(n813), .CK(clk), .RN(n876), .Q(
        intDY_EWSW[15]), .QN(n1605) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(n817), .CK(clk), .RN(n1579), 
        .Q(intDY_EWSW[11]), .QN(n1604) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(n611), .CK(clk), .RN(n931), .Q(
        DMP_exp_NRM2_EW[7]), .QN(n1553) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(n616), .CK(clk), .RN(n1588), .Q(
        DMP_exp_NRM2_EW[6]), .QN(n1547) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(n621), .CK(clk), .RN(n1601), .Q(
        DMP_exp_NRM2_EW[5]), .QN(n1526) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(n646), .CK(clk), .RN(n1601), .Q(
        DMP_exp_NRM2_EW[0]), .QN(n1508) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(n541), .CK(clk), .RN(n1595), .Q(
        Raw_mant_NRM_SWR[1]), .QN(n1558) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(n542), .CK(clk), .RN(n1584), .Q(
        Raw_mant_NRM_SWR[0]), .QN(n1478) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(n540), .CK(clk), .RN(n1589), .Q(
        Raw_mant_NRM_SWR[2]), .QN(n1504) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(n537), .CK(clk), .RN(n1595), .Q(
        Raw_mant_NRM_SWR[5]), .QN(n1512) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(n536), .CK(clk), .RN(n1595), .Q(
        Raw_mant_NRM_SWR[6]), .QN(n1482) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(n532), .CK(clk), .RN(n1589), .Q(
        Raw_mant_NRM_SWR[10]), .QN(n1476) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(n535), .CK(clk), .RN(n1589), .Q(
        Raw_mant_NRM_SWR[7]), .QN(n1477) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(n534), .CK(clk), .RN(n1588), .Q(
        Raw_mant_NRM_SWR[8]), .QN(n1479) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(n533), .CK(clk), .RN(n1584), .Q(
        Raw_mant_NRM_SWR[9]), .QN(n1481) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n870), .CK(clk), .RN(
        n1574), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n1525) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(n529), .CK(clk), .RN(n933), .Q(
        Raw_mant_NRM_SWR[13]), .QN(n1497) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(n528), .CK(clk), .RN(n1592), .Q(
        Raw_mant_NRM_SWR[14]), .QN(n1486) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(n527), .CK(clk), .RN(n932), .Q(
        Raw_mant_NRM_SWR[15]), .QN(n1485) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(n526), .CK(clk), .RN(n1596), .Q(
        Raw_mant_NRM_SWR[16]), .QN(n1474) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(n809), .CK(clk), .RN(n1601), 
        .Q(intDY_EWSW[19]), .QN(n1494) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(n801), .CK(clk), .RN(n1576), 
        .Q(intDY_EWSW[27]), .QN(n1545) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(n804), .CK(clk), .RN(n1577), 
        .Q(intDY_EWSW[24]), .QN(n1480) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(n812), .CK(clk), .RN(n876), .Q(
        intDY_EWSW[16]), .QN(n1539) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(n819), .CK(clk), .RN(n876), .Q(
        intDY_EWSW[9]), .QN(n1530) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(n822), .CK(clk), .RN(n1580), .Q(
        intDY_EWSW[6]), .QN(n1523) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(n800), .CK(clk), .RN(n1573), 
        .Q(intDY_EWSW[28]), .QN(n1542) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(n828), .CK(clk), .RN(n1576), .Q(
        intDY_EWSW[0]), .QN(n1491) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(n826), .CK(clk), .RN(n1573), .Q(
        intDY_EWSW[2]), .QN(n1535) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(n824), .CK(clk), .RN(n1579), .Q(
        intDY_EWSW[4]), .QN(n1536) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(n821), .CK(clk), .RN(n1581), .Q(
        intDY_EWSW[7]), .QN(n1524) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(n823), .CK(clk), .RN(n876), .Q(
        intDY_EWSW[5]), .QN(n1490) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(n836), .CK(clk), .RN(n1578), 
        .Q(intDX_EWSW[26]), .QN(n1566) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(n834), .CK(clk), .RN(n1575), 
        .Q(intDX_EWSW[28]), .QN(n1519) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(n525), .CK(clk), .RN(n1574), .Q(
        Raw_mant_NRM_SWR[17]), .QN(n1502) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_26_ ( .D(n561), .CK(clk), .RN(n1592), .Q(
        DmP_EXP_EWSW[26]), .QN(n1498) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_24_ ( .D(n563), .CK(clk), .RN(n932), .Q(
        DmP_EXP_EWSW[24]), .QN(n1495) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_25_ ( .D(n562), .CK(clk), .RN(n931), .Q(
        DmP_EXP_EWSW[25]), .QN(n1563) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_25_ ( .D(n728), .CK(clk), .RN(n1600), .Q(
        DMP_EXP_EWSW[25]), .QN(n1550) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_26_ ( .D(n727), .CK(clk), .RN(n1590), .Q(
        DMP_EXP_EWSW[26]), .QN(n1500) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_24_ ( .D(n729), .CK(clk), .RN(n1586), .Q(
        DMP_EXP_EWSW[24]), .QN(n1496) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(n521), .CK(clk), .RN(n931), .Q(
        Raw_mant_NRM_SWR[21]), .QN(n1506) );
  DFFRX1TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(n769), .CK(clk), .RN(n1578), .Q(
        shift_value_SHT2_EWR[3]), .QN(n1505) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(n520), .CK(clk), .RN(n931), .Q(
        Raw_mant_NRM_SWR[22]), .QN(n1501) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(n519), .CK(clk), .RN(n933), .Q(
        Raw_mant_NRM_SWR[23]), .QN(n1472) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(n518), .CK(clk), .RN(n1596), .Q(
        Raw_mant_NRM_SWR[24]), .QN(n1473) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(n517), .CK(clk), .RN(n1575), .Q(
        Raw_mant_NRM_SWR[25]), .QN(n1484) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(n781), .CK(clk), .RN(n1595), .Q(
        Data_array_SWR[10]), .QN(n1567) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_16_ ( .D(n669), .CK(clk), .RN(n1586), .Q(
        DMP_SFG[16]), .QN(n1549) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(n514), .CK(clk), .RN(n1588), .Q(
        LZD_output_NRM2_EW[2]), .QN(n1518) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(n859), .CK(clk), .RN(n1578), .Q(
        intDX_EWSW[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(n847), .CK(clk), .RN(n1575), 
        .Q(intDX_EWSW[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(n841), .CK(clk), .RN(n1581), 
        .Q(intDX_EWSW[21]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(n849), .CK(clk), .RN(n1575), 
        .Q(intDX_EWSW[13]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(n839), .CK(clk), .RN(n1574), 
        .Q(intDX_EWSW[23]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(n793), .CK(clk), .RN(n1573), .Q(
        Data_array_SWR[22]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(n796), .CK(clk), .RN(n1578), .Q(
        Data_array_SWR[25]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(n795), .CK(clk), .RN(n1576), .Q(
        Data_array_SWR[24]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(n522), .CK(clk), .RN(n1592), .Q(
        Raw_mant_NRM_SWR[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(n845), .CK(clk), .RN(n1576), 
        .Q(intDX_EWSW[17]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(n851), .CK(clk), .RN(n1575), 
        .Q(intDX_EWSW[11]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(n854), .CK(clk), .RN(n1578), .Q(
        intDX_EWSW[8]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(n861), .CK(clk), .RN(n1575), .Q(
        intDX_EWSW[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(n853), .CK(clk), .RN(n1581), .Q(
        intDX_EWSW[9]) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(n770), .CK(clk), .RN(n1573), .Q(
        shift_value_SHT2_EWR[2]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(n786), .CK(clk), .RN(n1579), .Q(
        Data_array_SWR[15]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(n784), .CK(clk), .RN(n876), .Q(
        Data_array_SWR[13]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(n530), .CK(clk), .RN(n932), .Q(
        Raw_mant_NRM_SWR[12]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(n523), .CK(clk), .RN(n933), .Q(
        Raw_mant_NRM_SWR[19]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(n844), .CK(clk), .RN(n1573), 
        .Q(intDX_EWSW[18]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(n833), .CK(clk), .RN(n1578), 
        .Q(intDX_EWSW[29]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(n835), .CK(clk), .RN(n1576), 
        .Q(intDX_EWSW[27]) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n871), .CK(clk), .RN(
        n1581), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(n779), .CK(clk), .RN(n1585), .Q(
        Data_array_SWR[8]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(n790), .CK(clk), .RN(n1577), .Q(
        Data_array_SWR[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(n787), .CK(clk), .RN(n876), .Q(
        Data_array_SWR[16]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(n538), .CK(clk), .RN(n1595), .Q(
        Raw_mant_NRM_SWR[4]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(n524), .CK(clk), .RN(n931), .Q(
        Raw_mant_NRM_SWR[18]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(n777), .CK(clk), .RN(n1580), .Q(
        Data_array_SWR[6]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(n778), .CK(clk), .RN(n1579), .Q(
        Data_array_SWR[7]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(n775), .CK(clk), .RN(n876), .Q(
        Data_array_SWR[4]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(n776), .CK(clk), .RN(n1586), .Q(
        Data_array_SWR[5]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_7_ ( .D(n696), .CK(clk), .RN(n1585), .Q(
        DMP_SFG[7]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_1_ ( .D(n714), .CK(clk), .RN(n1582), .Q(
        DMP_SFG[1]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(n831), .CK(clk), .RN(n1575), 
        .Q(intDX_EWSW[31]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(n818), .CK(clk), .RN(n1579), 
        .Q(intDY_EWSW[10]), .QN(n881) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(n595), .CK(clk), .RN(n1575), .Q(
        DmP_mant_SHT1_SW[7]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(n603), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SHT1_SW[3]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(n569), .CK(clk), .RN(n1592), .Q(
        DmP_mant_SHT1_SW[20]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(n575), .CK(clk), .RN(n932), .Q(
        DmP_mant_SHT1_SW[17]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(n577), .CK(clk), .RN(n1596), .Q(
        DmP_mant_SHT1_SW[16]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(n567), .CK(clk), .RN(n1596), .Q(
        DmP_mant_SHT1_SW[21]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(n593), .CK(clk), .RN(n1597), .Q(
        DmP_mant_SHT1_SW[8]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(n583), .CK(clk), .RN(n1591), .Q(
        DmP_mant_SHT1_SW[13]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(n581), .CK(clk), .RN(n1576), .Q(
        DmP_mant_SHT1_SW[14]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(n589), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SHT1_SW[10]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(n573), .CK(clk), .RN(n1589), .Q(
        DmP_mant_SHT1_SW[18]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(n585), .CK(clk), .RN(n1597), .Q(
        DmP_mant_SHT1_SW[12]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(n579), .CK(clk), .RN(n931), .Q(
        DmP_mant_SHT1_SW[15]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(n597), .CK(clk), .RN(n1594), .Q(
        DmP_mant_SHT1_SW[6]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(n605), .CK(clk), .RN(n1586), .Q(
        DmP_mant_SHT1_SW[2]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(n607), .CK(clk), .RN(n1587), .Q(
        DmP_mant_SHT1_SW[1]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(n609), .CK(clk), .RN(n1583), .Q(
        DmP_mant_SHT1_SW[0]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_0_ ( .D(n717), .CK(clk), .RN(n1599), .Q(
        DMP_SFG[0]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n478), .CK(clk), .RN(n1591), .Q(
        DmP_mant_SFG_SWR[10]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n473), .CK(clk), .RN(n1600), .Q(
        DmP_mant_SFG_SWR[15]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n474), .CK(clk), .RN(n1599), .Q(
        DmP_mant_SFG_SWR[14]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n475), .CK(clk), .RN(n1586), .Q(
        DmP_mant_SFG_SWR[13]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n476), .CK(clk), .RN(n1587), .Q(
        DmP_mant_SFG_SWR[12]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n477), .CK(clk), .RN(n1582), .Q(
        DmP_mant_SFG_SWR[11]) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(n766), .CK(clk), .RN(n1577), 
        .Q(Shift_amount_SHT1_EWR[0]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(n811), .CK(clk), .RN(n876), .Q(
        intDY_EWSW[17]), .QN(n1572) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_23_ ( .D(n730), .CK(clk), .RN(n1590), .Q(
        DMP_EXP_EWSW[23]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(n626), .CK(clk), .RN(n1585), .Q(
        DMP_exp_NRM2_EW[4]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(n631), .CK(clk), .RN(n1585), .Q(
        DMP_exp_NRM2_EW[3]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(n636), .CK(clk), .RN(n1595), .Q(
        DMP_exp_NRM2_EW[2]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(n641), .CK(clk), .RN(n1588), .Q(
        DMP_exp_NRM2_EW[1]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_31_ ( .D(n797), .CK(clk), .RN(n1575), 
        .Q(intDY_EWSW[31]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(n850), .CK(clk), .RN(n1573), 
        .Q(intDX_EWSW[12]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(n842), .CK(clk), .RN(n1578), 
        .Q(intDX_EWSW[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(n848), .CK(clk), .RN(n1575), 
        .Q(intDX_EWSW[14]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(n840), .CK(clk), .RN(n1581), 
        .Q(intDX_EWSW[22]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(n860), .CK(clk), .RN(n1574), .Q(
        intDX_EWSW[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(n852), .CK(clk), .RN(n1576), 
        .Q(intDX_EWSW[10]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(n832), .CK(clk), .RN(n1573), 
        .Q(intDX_EWSW[30]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(n843), .CK(clk), .RN(n1574), 
        .Q(intDX_EWSW[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(n780), .CK(clk), .RN(n1580), .Q(
        Data_array_SWR[9]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(n782), .CK(clk), .RN(n1580), .Q(
        Data_array_SWR[11]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(n792), .CK(clk), .RN(n1575), .Q(
        Data_array_SWR[21]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(n789), .CK(clk), .RN(n876), .Q(
        Data_array_SWR[18]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(n788), .CK(clk), .RN(n1600), .Q(
        Data_array_SWR[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(n791), .CK(clk), .RN(n1573), .Q(
        Data_array_SWR[20]) );
  DFFRX1TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(n549), .CK(clk), .RN(n1594), .Q(
        OP_FLAG_SFG), .QN(n930) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(n565), .CK(clk), .RN(n1590), .Q(
        DmP_mant_SHT1_SW[22]) );
  DFFRX1TS INPUT_STAGE_FLAGS_Q_reg_0_ ( .D(n830), .CK(clk), .RN(n1575), .Q(
        intAS) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(n466), .CK(clk), .RN(n1600), .Q(
        DmP_mant_SFG_SWR[22]), .QN(n912) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(n481), .CK(clk), .RN(n1597), .Q(
        DmP_mant_SFG_SWR[7]), .QN(n923) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(n480), .CK(clk), .RN(n1594), .Q(
        DmP_mant_SFG_SWR[8]), .QN(n925) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_23_ ( .D(n564), .CK(clk), .RN(n931), .Q(
        DmP_EXP_EWSW[23]), .QN(n908) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(n774), .CK(clk), .RN(n1577), .Q(
        Data_array_SWR[3]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(n773), .CK(clk), .RN(n1580), .Q(
        Data_array_SWR[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(n772), .CK(clk), .RN(n876), .Q(
        Data_array_SWR[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(n771), .CK(clk), .RN(n1579), .Q(
        Data_array_SWR[0]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_27_ ( .D(n560), .CK(clk), .RN(n931), .Q(
        DmP_EXP_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_22_ ( .D(n651), .CK(clk), .RN(n1589), .Q(
        DMP_SFG[22]), .QN(n1569) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_21_ ( .D(n654), .CK(clk), .RN(n1584), .Q(
        DMP_SFG[21]), .QN(n1564) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_20_ ( .D(n657), .CK(clk), .RN(n1585), .Q(
        DMP_SFG[20]), .QN(n1565) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_19_ ( .D(n660), .CK(clk), .RN(n1588), .Q(
        DMP_SFG[19]), .QN(n1556) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_18_ ( .D(n663), .CK(clk), .RN(n1583), .Q(
        DMP_SFG[18]), .QN(n1557) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_17_ ( .D(n666), .CK(clk), .RN(n1587), .Q(
        DMP_SFG[17]), .QN(n1548) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_15_ ( .D(n672), .CK(clk), .RN(n1590), .Q(
        DMP_SFG[15]), .QN(n1527) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_14_ ( .D(n675), .CK(clk), .RN(n1590), .Q(
        DMP_SFG[14]), .QN(n1520) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_13_ ( .D(n678), .CK(clk), .RN(n1586), .Q(
        DMP_SFG[13]), .QN(n1521) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_12_ ( .D(n681), .CK(clk), .RN(n1590), .Q(
        DMP_SFG[12]), .QN(n1515) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_11_ ( .D(n684), .CK(clk), .RN(n1583), .Q(
        DMP_SFG[11]), .QN(n1516) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_10_ ( .D(n687), .CK(clk), .RN(n1595), .Q(
        DMP_SFG[10]), .QN(n1509) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_9_ ( .D(n690), .CK(clk), .RN(n1601), .Q(
        DMP_SFG[9]), .QN(n1510) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_8_ ( .D(n693), .CK(clk), .RN(n1589), .Q(
        DMP_SFG[8]), .QN(n1503) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_4_ ( .D(n705), .CK(clk), .RN(n1601), .Q(
        DMP_SFG[4]), .QN(n1552) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_3_ ( .D(n708), .CK(clk), .RN(n1585), .Q(
        DMP_SFG[3]), .QN(n1554) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_2_ ( .D(n711), .CK(clk), .RN(n1600), .Q(
        DMP_SFG[2]), .QN(n1555) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(n516), .CK(clk), .RN(n1584), .Q(
        LZD_output_NRM2_EW[3]), .QN(n1522) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(n512), .CK(clk), .RN(n1585), .Q(
        LZD_output_NRM2_EW[4]), .QN(n1528) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(n513), .CK(clk), .RN(n1589), .Q(
        LZD_output_NRM2_EW[1]), .QN(n1517) );
  DFFRX2TS inst_ShiftRegister_Q_reg_5_ ( .D(n868), .CK(clk), .RN(n1573), .Q(
        n1483), .QN(n1568) );
  ADDFX1TS DP_OP_15J60_123_4652_U8 ( .A(n1517), .B(DMP_exp_NRM2_EW[1]), .CI(
        DP_OP_15J60_123_4652_n8), .CO(DP_OP_15J60_123_4652_n7), .S(
        exp_rslt_NRM2_EW1[1]) );
  ADDFX1TS DP_OP_15J60_123_4652_U7 ( .A(n1518), .B(DMP_exp_NRM2_EW[2]), .CI(
        DP_OP_15J60_123_4652_n7), .CO(DP_OP_15J60_123_4652_n6), .S(
        exp_rslt_NRM2_EW1[2]) );
  ADDFX1TS DP_OP_15J60_123_4652_U6 ( .A(n1522), .B(DMP_exp_NRM2_EW[3]), .CI(
        DP_OP_15J60_123_4652_n6), .CO(DP_OP_15J60_123_4652_n5), .S(
        exp_rslt_NRM2_EW1[3]) );
  ADDFX1TS DP_OP_15J60_123_4652_U5 ( .A(n1528), .B(DMP_exp_NRM2_EW[4]), .CI(
        DP_OP_15J60_123_4652_n5), .CO(DP_OP_15J60_123_4652_n4), .S(
        exp_rslt_NRM2_EW1[4]) );
  DFFRX4TS inst_ShiftRegister_Q_reg_1_ ( .D(n864), .CK(clk), .RN(n1578), .Q(
        Shift_reg_FLAGS_7[1]), .QN(n874) );
  DFFRX4TS inst_ShiftRegister_Q_reg_4_ ( .D(n867), .CK(clk), .RN(n1581), .Q(
        n873), .QN(n1570) );
  DFFRX4TS inst_ShiftRegister_Q_reg_6_ ( .D(n869), .CK(clk), .RN(n1576), .Q(
        Shift_reg_FLAGS_7_6), .QN(n878) );
  DFFRX4TS inst_ShiftRegister_Q_reg_0_ ( .D(n863), .CK(clk), .RN(n1581), .Q(
        Shift_reg_FLAGS_7[0]), .QN(n872) );
  DFFRX4TS inst_ShiftRegister_Q_reg_2_ ( .D(n865), .CK(clk), .RN(n1576), .Q(
        n929), .QN(n1602) );
  NAND2X4TS U897 ( .A(n1169), .B(n1288), .Y(n1155) );
  CLKINVX6TS U898 ( .A(rst), .Y(n931) );
  AOI222X4TS U899 ( .A0(Data_array_SWR[21]), .A1(n1404), .B0(
        Data_array_SWR[17]), .B1(n1403), .C0(Data_array_SWR[25]), .C1(n1389), 
        .Y(n1426) );
  BUFX4TS U900 ( .A(n931), .Y(n932) );
  NOR2X4TS U901 ( .A(n1169), .B(n1211), .Y(n1170) );
  NAND2X4TS U902 ( .A(n1151), .B(n1304), .Y(n1150) );
  AOI211X2TS U903 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n1138), .B0(n1260), .C0(
        n1137), .Y(n1152) );
  INVX2TS U904 ( .A(n1143), .Y(n1145) );
  OAI21XLTS U905 ( .A0(Raw_mant_NRM_SWR[6]), .A1(Raw_mant_NRM_SWR[7]), .B0(
        n1121), .Y(n1122) );
  CLKINVX6TS U906 ( .A(n1298), .Y(n1167) );
  INVX3TS U907 ( .A(n1290), .Y(n902) );
  NAND3X1TS U908 ( .A(n1123), .B(n1254), .C(Raw_mant_NRM_SWR[1]), .Y(n1248) );
  NAND3X1TS U909 ( .A(n1144), .B(n1130), .C(n1249), .Y(n1260) );
  OAI211X1TS U910 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n1129), .B0(n1253), .C0(
        n1512), .Y(n1130) );
  BUFX4TS U911 ( .A(n1037), .Y(n893) );
  NOR2X4TS U912 ( .A(n1017), .B(n1066), .Y(n1025) );
  INVX4TS U913 ( .A(n1277), .Y(n875) );
  AND2X4TS U914 ( .A(beg_OP), .B(n1271), .Y(n1275) );
  NOR2X6TS U915 ( .A(n1468), .B(n1414), .Y(n1367) );
  NAND2X2TS U916 ( .A(n894), .B(n1423), .Y(n1328) );
  NOR2X6TS U917 ( .A(shift_value_SHT2_EWR[4]), .B(n1383), .Y(n1366) );
  NAND3X1TS U918 ( .A(n1502), .B(n1485), .C(n1474), .Y(n1246) );
  BUFX6TS U919 ( .A(n932), .Y(n876) );
  NAND2BXLTS U920 ( .AN(intDX_EWSW[2]), .B(intDY_EWSW[2]), .Y(n967) );
  NAND2BXLTS U921 ( .AN(intDX_EWSW[19]), .B(intDY_EWSW[19]), .Y(n1001) );
  NAND2BXLTS U922 ( .AN(intDX_EWSW[27]), .B(intDY_EWSW[27]), .Y(n955) );
  NAND2BXLTS U923 ( .AN(intDX_EWSW[9]), .B(intDY_EWSW[9]), .Y(n980) );
  NAND2BXLTS U924 ( .AN(intDX_EWSW[13]), .B(intDY_EWSW[13]), .Y(n976) );
  NAND2BXLTS U925 ( .AN(intDX_EWSW[21]), .B(intDY_EWSW[21]), .Y(n995) );
  NAND3XLTS U926 ( .A(n1541), .B(n955), .C(intDX_EWSW[26]), .Y(n957) );
  NAND3BXLTS U927 ( .AN(n999), .B(n997), .C(n996), .Y(n1015) );
  AOI222X4TS U928 ( .A0(Data_array_SWR[14]), .A1(n1366), .B0(
        Data_array_SWR[22]), .B1(n1430), .C0(Data_array_SWR[18]), .C1(n1429), 
        .Y(n1379) );
  AOI222X4TS U929 ( .A0(Data_array_SWR[23]), .A1(n1430), .B0(
        Data_array_SWR[19]), .B1(n1429), .C0(Data_array_SWR[15]), .C1(n1366), 
        .Y(n1375) );
  AOI222X4TS U930 ( .A0(Data_array_SWR[24]), .A1(n1430), .B0(
        Data_array_SWR[20]), .B1(n1429), .C0(Data_array_SWR[16]), .C1(n1366), 
        .Y(n1371) );
  AOI222X4TS U931 ( .A0(Data_array_SWR[21]), .A1(n1429), .B0(
        Data_array_SWR[17]), .B1(n1366), .C0(Data_array_SWR[25]), .C1(n1430), 
        .Y(n1372) );
  NAND2BXLTS U932 ( .AN(n1262), .B(n948), .Y(n950) );
  OAI21XLTS U933 ( .A0(n1512), .A1(n1290), .B0(n1193), .Y(n1194) );
  AOI222X1TS U934 ( .A0(Raw_mant_NRM_SWR[14]), .A1(n902), .B0(n906), .B1(n897), 
        .C0(n1287), .C1(DmP_mant_SHT1_SW[10]), .Y(n1222) );
  AOI222X1TS U935 ( .A0(Raw_mant_NRM_SWR[20]), .A1(n902), .B0(n906), .B1(
        DmP_mant_SHT1_SW[3]), .C0(n1287), .C1(n895), .Y(n1173) );
  AOI222X1TS U936 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n902), .B0(n906), .B1(
        DmP_mant_SHT1_SW[2]), .C0(n1287), .C1(DmP_mant_SHT1_SW[3]), .Y(n1184)
         );
  AOI222X1TS U937 ( .A0(Raw_mant_NRM_SWR[16]), .A1(n902), .B0(n906), .B1(
        DmP_mant_SHT1_SW[7]), .C0(n1287), .C1(DmP_mant_SHT1_SW[8]), .Y(n1187)
         );
  AOI222X1TS U938 ( .A0(n1238), .A1(DMP_SFG[1]), .B0(n1238), .B1(n891), .C0(
        DMP_SFG[1]), .C1(n891), .Y(intadd_69_B_0_) );
  AOI222X1TS U939 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n902), .B0(n906), .B1(
        DmP_mant_SHT1_SW[6]), .C0(n1287), .C1(DmP_mant_SHT1_SW[7]), .Y(n1208)
         );
  AOI222X1TS U940 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n902), .B0(n906), .B1(
        DmP_mant_SHT1_SW[15]), .C0(n1287), .C1(DmP_mant_SHT1_SW[16]), .Y(n1235) );
  AOI211X1TS U941 ( .A0(DmP_mant_SHT1_SW[22]), .A1(n874), .B0(n1213), .C0(
        n1212), .Y(n1281) );
  OAI211XLTS U942 ( .A0(n1258), .A1(n1257), .B0(n1256), .C0(n1255), .Y(n1259)
         );
  AO22XLTS U943 ( .A0(DmP_mant_SFG_SWR[9]), .A1(n1359), .B0(n1358), .B1(n926), 
        .Y(n879) );
  AOI2BB2XLTS U944 ( .B0(DmP_mant_SFG_SWR[10]), .B1(n1358), .A0N(n1358), .A1N(
        DmP_mant_SFG_SWR[10]), .Y(intadd_68_CI) );
  NAND4XLTS U945 ( .A(n1250), .B(n1249), .C(n1248), .D(n1255), .Y(n1251) );
  OAI21XLTS U946 ( .A0(n1478), .A1(n1124), .B0(n1248), .Y(n1125) );
  AO22XLTS U947 ( .A0(DmP_mant_SFG_SWR[3]), .A1(n1359), .B0(n1358), .B1(n919), 
        .Y(n882) );
  OAI21XLTS U948 ( .A0(n1497), .A1(n1290), .B0(n1289), .Y(n1291) );
  OAI21XLTS U949 ( .A0(n1481), .A1(n1290), .B0(n1197), .Y(n1198) );
  OAI21XLTS U950 ( .A0(n1475), .A1(n1290), .B0(n1284), .Y(n1285) );
  AOI222X1TS U951 ( .A0(n1391), .A1(n1468), .B0(Data_array_SWR[8]), .B1(n1438), 
        .C0(n1390), .C1(n1411), .Y(n1458) );
  AOI222X1TS U952 ( .A0(n1391), .A1(n1437), .B0(Data_array_SWR[8]), .B1(n1367), 
        .C0(n1390), .C1(n1410), .Y(n1446) );
  AOI222X1TS U953 ( .A0(n1386), .A1(n1468), .B0(Data_array_SWR[9]), .B1(n1438), 
        .C0(n1385), .C1(n1411), .Y(n1457) );
  AOI222X1TS U954 ( .A0(n1386), .A1(n1437), .B0(Data_array_SWR[9]), .B1(n1367), 
        .C0(n1385), .C1(n1410), .Y(n1447) );
  AO22XLTS U955 ( .A0(n1339), .A1(DmP_EXP_EWSW[22]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[22]), .Y(n565) );
  OAI21XLTS U956 ( .A0(n1205), .A1(n1150), .B0(n1204), .Y(n791) );
  OAI211XLTS U957 ( .A0(n1235), .A1(n1150), .B0(n1234), .C0(n1233), .Y(n788)
         );
  OAI21XLTS U958 ( .A0(n1205), .A1(n1167), .B0(n1196), .Y(n789) );
  OAI211XLTS U959 ( .A0(n1187), .A1(n1150), .B0(n1186), .C0(n1185), .Y(n780)
         );
  AOI2BB2XLTS U960 ( .B0(Raw_mant_NRM_SWR[15]), .B1(n1296), .A0N(n1222), .A1N(
        n1167), .Y(n1185) );
  AO22XLTS U961 ( .A0(n1274), .A1(Data_X[19]), .B0(n1279), .B1(intDX_EWSW[19]), 
        .Y(n843) );
  AO22XLTS U962 ( .A0(n1275), .A1(Data_X[30]), .B0(n1272), .B1(intDX_EWSW[30]), 
        .Y(n832) );
  AO22XLTS U963 ( .A0(n1280), .A1(Data_X[10]), .B0(n1279), .B1(intDX_EWSW[10]), 
        .Y(n852) );
  AO22XLTS U964 ( .A0(n1280), .A1(Data_Y[31]), .B0(n875), .B1(intDY_EWSW[31]), 
        .Y(n797) );
  AO22XLTS U965 ( .A0(n1455), .A1(DMP_SHT2_EWSW[0]), .B0(n1456), .B1(
        DMP_SFG[0]), .Y(n717) );
  AO22XLTS U966 ( .A0(n1483), .A1(DmP_EXP_EWSW[0]), .B0(n1340), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n609) );
  AO22XLTS U967 ( .A0(n1483), .A1(DmP_EXP_EWSW[1]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n607) );
  AO22XLTS U968 ( .A0(n1483), .A1(DmP_EXP_EWSW[2]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n605) );
  AO22XLTS U969 ( .A0(n1483), .A1(DmP_EXP_EWSW[6]), .B0(n1331), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n597) );
  AO22XLTS U970 ( .A0(n1339), .A1(DmP_EXP_EWSW[15]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[15]), .Y(n579) );
  AO22XLTS U971 ( .A0(n1339), .A1(DmP_EXP_EWSW[12]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[12]), .Y(n585) );
  AO22XLTS U972 ( .A0(n1339), .A1(DmP_EXP_EWSW[18]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[18]), .Y(n573) );
  AO22XLTS U973 ( .A0(n1339), .A1(DmP_EXP_EWSW[14]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[14]), .Y(n581) );
  AO22XLTS U974 ( .A0(n1339), .A1(DmP_EXP_EWSW[13]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n583) );
  AO22XLTS U975 ( .A0(n1483), .A1(DmP_EXP_EWSW[8]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[8]), .Y(n593) );
  AO22XLTS U976 ( .A0(n1339), .A1(DmP_EXP_EWSW[21]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[21]), .Y(n567) );
  AO22XLTS U977 ( .A0(n1339), .A1(DmP_EXP_EWSW[16]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[16]), .Y(n577) );
  AO22XLTS U978 ( .A0(n1339), .A1(DmP_EXP_EWSW[17]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[17]), .Y(n575) );
  AO22XLTS U979 ( .A0(n1339), .A1(DmP_EXP_EWSW[20]), .B0(n1333), .B1(
        DmP_mant_SHT1_SW[20]), .Y(n569) );
  AO22XLTS U980 ( .A0(n1280), .A1(Data_X[31]), .B0(n1278), .B1(intDX_EWSW[31]), 
        .Y(n831) );
  AO22XLTS U981 ( .A0(n1453), .A1(DMP_SHT2_EWSW[1]), .B0(n1328), .B1(
        DMP_SFG[1]), .Y(n714) );
  AO22XLTS U982 ( .A0(n1453), .A1(DMP_SHT2_EWSW[7]), .B0(n1469), .B1(
        DMP_SFG[7]), .Y(n696) );
  OAI211XLTS U983 ( .A0(n1184), .A1(n1150), .B0(n1162), .C0(n1161), .Y(n775)
         );
  OAI211XLTS U984 ( .A0(n1187), .A1(n1167), .B0(n1179), .C0(n1178), .Y(n778)
         );
  OAI211XLTS U985 ( .A0(n1208), .A1(n1167), .B0(n1176), .C0(n1175), .Y(n777)
         );
  OAI211XLTS U986 ( .A0(n1231), .A1(n1150), .B0(n1229), .C0(n1228), .Y(n790)
         );
  OAI21XLTS U987 ( .A0(n1294), .A1(n1167), .B0(n1210), .Y(n779) );
  AO22XLTS U988 ( .A0(n1280), .A1(Data_X[27]), .B0(n875), .B1(intDX_EWSW[27]), 
        .Y(n835) );
  AO22XLTS U989 ( .A0(n1274), .A1(Data_X[29]), .B0(n875), .B1(intDX_EWSW[29]), 
        .Y(n833) );
  AO22XLTS U990 ( .A0(n1277), .A1(Data_X[18]), .B0(n875), .B1(intDX_EWSW[18]), 
        .Y(n844) );
  OAI211XLTS U991 ( .A0(n1223), .A1(n1150), .B0(n1218), .C0(n1217), .Y(n786)
         );
  AOI32X1TS U992 ( .A0(Shift_amount_SHT1_EWR[2]), .A1(n1304), .A2(n874), .B0(
        shift_value_SHT2_EWR[2]), .B1(n1301), .Y(n1303) );
  AO22XLTS U993 ( .A0(n1276), .A1(Data_X[1]), .B0(n875), .B1(intDX_EWSW[1]), 
        .Y(n861) );
  OAI21XLTS U994 ( .A0(n1504), .A1(n1155), .B0(n1216), .Y(n793) );
  AO22XLTS U995 ( .A0(n1269), .A1(n1354), .B0(n1270), .B1(n894), .Y(n865) );
  OAI211XLTS U996 ( .A0(n1304), .A1(n1511), .B0(n1244), .C0(n1127), .Y(n767)
         );
  AO22XLTS U997 ( .A0(n1339), .A1(DmP_EXP_EWSW[19]), .B0(n1333), .B1(n896), 
        .Y(n571) );
  AO22XLTS U998 ( .A0(n1339), .A1(DmP_EXP_EWSW[9]), .B0(n1331), .B1(n897), .Y(
        n591) );
  AO22XLTS U999 ( .A0(n1483), .A1(DmP_EXP_EWSW[5]), .B0(n1333), .B1(n899), .Y(
        n599) );
  AO22XLTS U1000 ( .A0(n1483), .A1(DmP_EXP_EWSW[4]), .B0(n1333), .B1(n895), 
        .Y(n601) );
  OAI21XLTS U1001 ( .A0(n1117), .A1(n1066), .B0(n1114), .Y(n1115) );
  AO22XLTS U1002 ( .A0(n1276), .A1(Data_X[0]), .B0(n1279), .B1(n907), .Y(n862)
         );
  AO22XLTS U1003 ( .A0(n1270), .A1(busy), .B0(n1269), .B1(n894), .Y(n866) );
  OR2X1TS U1004 ( .A(Shift_reg_FLAGS_7[1]), .B(Shift_amount_SHT1_EWR[0]), .Y(
        n884) );
  OAI211XLTS U1005 ( .A0(n1158), .A1(n1150), .B0(n1157), .C0(n1156), .Y(n772)
         );
  OAI211XLTS U1006 ( .A0(n1184), .A1(n1167), .B0(n1183), .C0(n1182), .Y(n773)
         );
  OAI211XLTS U1007 ( .A0(n1173), .A1(n1167), .B0(n1172), .C0(n1171), .Y(n774)
         );
  NOR2X2TS U1008 ( .A(Raw_mant_NRM_SWR[6]), .B(n1128), .Y(n1253) );
  BUFX4TS U1009 ( .A(n1592), .Y(n1600) );
  BUFX3TS U1010 ( .A(n1568), .Y(n1332) );
  AOI31XLTS U1011 ( .A0(n1134), .A1(Raw_mant_NRM_SWR[16]), .A2(n1502), .B0(
        n1133), .Y(n1135) );
  NOR2BX2TS U1012 ( .AN(n1258), .B(n1257), .Y(n1134) );
  OAI211XLTS U1013 ( .A0(n958), .A1(n1080), .B0(n957), .C0(n956), .Y(n963) );
  OAI21X2TS U1014 ( .A0(intDX_EWSW[26]), .A1(n1541), .B0(n955), .Y(n1080) );
  BUFX4TS U1015 ( .A(n932), .Y(n1583) );
  BUFX4TS U1016 ( .A(n1596), .Y(n1586) );
  BUFX4TS U1017 ( .A(n1573), .Y(n1587) );
  BUFX4TS U1018 ( .A(n1589), .Y(n1590) );
  BUFX4TS U1019 ( .A(n1578), .Y(n1595) );
  BUFX4TS U1020 ( .A(n1574), .Y(n1589) );
  BUFX4TS U1021 ( .A(n1583), .Y(n1585) );
  BUFX4TS U1022 ( .A(n1600), .Y(n1601) );
  BUFX4TS U1023 ( .A(n1600), .Y(n1575) );
  BUFX4TS U1024 ( .A(n1577), .Y(n1581) );
  INVX2TS U1025 ( .A(n882), .Y(n891) );
  INVX2TS U1026 ( .A(n879), .Y(n892) );
  NOR2X2TS U1027 ( .A(Raw_mant_NRM_SWR[13]), .B(n1247), .Y(n1143) );
  BUFX4TS U1028 ( .A(n876), .Y(n1578) );
  BUFX4TS U1029 ( .A(n1580), .Y(n1573) );
  BUFX4TS U1030 ( .A(n1579), .Y(n1576) );
  BUFX4TS U1031 ( .A(n1583), .Y(n1574) );
  XNOR2X2TS U1032 ( .A(DMP_exp_NRM2_EW[7]), .B(n939), .Y(n949) );
  XNOR2X2TS U1033 ( .A(DMP_exp_NRM2_EW[5]), .B(DP_OP_15J60_123_4652_n4), .Y(
        n951) );
  NOR2X4TS U1034 ( .A(shift_value_SHT2_EWR[4]), .B(n1468), .Y(n1411) );
  BUFX6TS U1035 ( .A(left_right_SHT2), .Y(n1468) );
  BUFX4TS U1036 ( .A(n1020), .Y(n1325) );
  INVX2TS U1037 ( .A(n883), .Y(n894) );
  INVX2TS U1038 ( .A(n889), .Y(n895) );
  INVX2TS U1039 ( .A(n888), .Y(n896) );
  INVX2TS U1040 ( .A(n890), .Y(n897) );
  INVX2TS U1041 ( .A(n887), .Y(n898) );
  CLKINVX6TS U1042 ( .A(n1456), .Y(n1453) );
  INVX2TS U1043 ( .A(n886), .Y(n899) );
  CLKINVX6TS U1044 ( .A(n1328), .Y(n1455) );
  INVX2TS U1045 ( .A(n885), .Y(n900) );
  NOR4BX2TS U1046 ( .AN(n1149), .B(n1148), .C(n1147), .D(n1146), .Y(n1169) );
  INVX2TS U1047 ( .A(n1290), .Y(n901) );
  BUFX4TS U1048 ( .A(n930), .Y(n1358) );
  BUFX4TS U1049 ( .A(n1368), .Y(n1438) );
  BUFX4TS U1050 ( .A(n1365), .Y(n1429) );
  BUFX4TS U1051 ( .A(n1066), .Y(n1268) );
  INVX2TS U1052 ( .A(n1150), .Y(n903) );
  INVX2TS U1053 ( .A(n903), .Y(n904) );
  BUFX4TS U1054 ( .A(n1456), .Y(n1459) );
  BUFX4TS U1055 ( .A(n1456), .Y(n1469) );
  CLKINVX6TS U1056 ( .A(n1328), .Y(n1471) );
  CLKINVX3TS U1057 ( .A(n884), .Y(n905) );
  INVX3TS U1058 ( .A(n884), .Y(n906) );
  AOI222X4TS U1059 ( .A0(Data_array_SWR[24]), .A1(n1389), .B0(
        Data_array_SWR[20]), .B1(n1404), .C0(Data_array_SWR[16]), .C1(n1403), 
        .Y(n1434) );
  OAI211XLTS U1060 ( .A0(n1222), .A1(n904), .B0(n1221), .C0(n1220), .Y(n782)
         );
  AOI32X1TS U1061 ( .A0(n1546), .A1(n1001), .A2(intDX_EWSW[18]), .B0(
        intDX_EWSW[19]), .B1(n1494), .Y(n1002) );
  AOI221X1TS U1062 ( .A0(n1546), .A1(intDX_EWSW[18]), .B0(intDX_EWSW[19]), 
        .B1(n1494), .C0(n1087), .Y(n1092) );
  AOI221X1TS U1063 ( .A0(n1544), .A1(intDX_EWSW[30]), .B0(intDX_EWSW[17]), 
        .B1(n1572), .C0(n1086), .Y(n1093) );
  AOI221X4TS U1064 ( .A0(intDX_EWSW[30]), .A1(n1544), .B0(intDX_EWSW[29]), 
        .B1(n1493), .C0(n960), .Y(n962) );
  INVX2TS U1065 ( .A(n880), .Y(n907) );
  AOI221X1TS U1066 ( .A0(n881), .A1(intDX_EWSW[10]), .B0(intDX_EWSW[11]), .B1(
        n1604), .C0(n1095), .Y(n1100) );
  AOI221X1TS U1067 ( .A0(n1535), .A1(intDX_EWSW[2]), .B0(intDX_EWSW[3]), .B1(
        n1529), .C0(n1103), .Y(n1108) );
  AOI221X1TS U1068 ( .A0(n1492), .A1(intDX_EWSW[22]), .B0(intDX_EWSW[23]), 
        .B1(n1543), .C0(n1089), .Y(n1090) );
  AOI221X1TS U1069 ( .A0(n1538), .A1(intDX_EWSW[14]), .B0(intDX_EWSW[15]), 
        .B1(n1605), .C0(n1097), .Y(n1098) );
  OAI211X2TS U1070 ( .A0(intDX_EWSW[20]), .A1(n1540), .B0(n1009), .C0(n995), 
        .Y(n1004) );
  AOI221X1TS U1071 ( .A0(n1540), .A1(intDX_EWSW[20]), .B0(intDX_EWSW[21]), 
        .B1(n1532), .C0(n1088), .Y(n1091) );
  OAI211X2TS U1072 ( .A0(intDX_EWSW[12]), .A1(n1537), .B0(n990), .C0(n976), 
        .Y(n992) );
  AOI221X1TS U1073 ( .A0(n1537), .A1(intDX_EWSW[12]), .B0(intDX_EWSW[13]), 
        .B1(n1531), .C0(n1096), .Y(n1099) );
  INVX1TS U1074 ( .A(DMP_SFG[5]), .Y(intadd_69_A_3_) );
  INVX1TS U1075 ( .A(DMP_SFG[6]), .Y(intadd_69_A_4_) );
  OAI31XLTS U1076 ( .A0(n1327), .A1(n1117), .A2(n1336), .B0(n1116), .Y(n720)
         );
  NOR2X2TS U1077 ( .A(n908), .B(DMP_EXP_EWSW[23]), .Y(n1311) );
  XNOR2X2TS U1078 ( .A(DMP_exp_NRM2_EW[0]), .B(n1242), .Y(n952) );
  INVX1TS U1079 ( .A(LZD_output_NRM2_EW[0]), .Y(n1242) );
  XNOR2X2TS U1080 ( .A(DMP_exp_NRM2_EW[6]), .B(n936), .Y(n1262) );
  CLKINVX6TS U1081 ( .A(n1073), .Y(n1050) );
  NOR2X4TS U1082 ( .A(shift_value_SHT2_EWR[4]), .B(n1437), .Y(n1410) );
  CLKINVX6TS U1083 ( .A(n1468), .Y(n1437) );
  AOI222X1TS U1084 ( .A0(Raw_mant_NRM_SWR[10]), .A1(n901), .B0(
        DmP_mant_SHT1_SW[14]), .B1(n1287), .C0(n905), .C1(DmP_mant_SHT1_SW[13]), .Y(n1223) );
  AOI222X4TS U1085 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n901), .B0(n905), .B1(
        DmP_mant_SHT1_SW[16]), .C0(n1287), .C1(DmP_mant_SHT1_SW[17]), .Y(n1199) );
  AOI222X1TS U1086 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n902), .B0(n906), .B1(
        DmP_mant_SHT1_SW[17]), .C0(n1287), .C1(DmP_mant_SHT1_SW[18]), .Y(n1231) );
  AOI222X4TS U1087 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n901), .B0(n906), .B1(
        DmP_mant_SHT1_SW[20]), .C0(n1287), .C1(DmP_mant_SHT1_SW[21]), .Y(n1214) );
  NOR2XLTS U1088 ( .A(n978), .B(intDY_EWSW[10]), .Y(n979) );
  NOR2X4TS U1089 ( .A(n1364), .B(n1363), .Y(n1384) );
  OAI2BB1X2TS U1090 ( .A0N(n942), .A1N(n941), .B0(Shift_reg_FLAGS_7[0]), .Y(
        n1363) );
  INVX4TS U1091 ( .A(n1275), .Y(n1278) );
  CLKINVX6TS U1092 ( .A(n1570), .Y(busy) );
  NAND2X2TS U1093 ( .A(n874), .B(n1570), .Y(n1304) );
  AOI22X2TS U1094 ( .A0(DmP_mant_SFG_SWR[7]), .A1(n1358), .B0(n1359), .B1(n923), .Y(intadd_69_B_3_) );
  AOI22X2TS U1095 ( .A0(n1355), .A1(DmP_mant_SFG_SWR[8]), .B0(n1359), .B1(n925), .Y(intadd_69_B_4_) );
  CLKINVX6TS U1096 ( .A(n1358), .Y(n1359) );
  AOI222X4TS U1097 ( .A0(DMP_SFG[7]), .A1(n892), .B0(DMP_SFG[7]), .B1(n1241), 
        .C0(n892), .C1(n1241), .Y(intadd_68_B_0_) );
  AOI222X1TS U1098 ( .A0(n1405), .A1(n1437), .B0(n1367), .B1(Data_array_SWR[5]), .C0(n1406), .C1(n1410), .Y(n1443) );
  AOI222X1TS U1099 ( .A0(n1405), .A1(n1468), .B0(Data_array_SWR[5]), .B1(n1438), .C0(n1406), .C1(n1411), .Y(n1462) );
  AOI222X1TS U1100 ( .A0(n1413), .A1(n1437), .B0(n1367), .B1(Data_array_SWR[4]), .C0(n1412), .C1(n1410), .Y(n1442) );
  AOI222X1TS U1101 ( .A0(n1413), .A1(n1468), .B0(Data_array_SWR[4]), .B1(n1438), .C0(n1412), .C1(n1411), .Y(n1463) );
  AOI222X1TS U1102 ( .A0(n1395), .A1(n1437), .B0(Data_array_SWR[7]), .B1(n1367), .C0(n1394), .C1(n1410), .Y(n1445) );
  AOI222X1TS U1103 ( .A0(n1395), .A1(n1468), .B0(Data_array_SWR[7]), .B1(n1438), .C0(n1394), .C1(n1411), .Y(n1460) );
  AOI222X1TS U1104 ( .A0(n1400), .A1(n1437), .B0(Data_array_SWR[6]), .B1(n1367), .C0(n1399), .C1(n1410), .Y(n1444) );
  AOI222X1TS U1105 ( .A0(n1400), .A1(n1468), .B0(Data_array_SWR[6]), .B1(n1438), .C0(n1399), .C1(n1411), .Y(n1461) );
  INVX4TS U1106 ( .A(n1602), .Y(n1357) );
  INVX3TS U1107 ( .A(Shift_reg_FLAGS_7[0]), .Y(n1423) );
  AOI222X1TS U1108 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n901), .B0(n905), .B1(n896), 
        .C0(n1287), .C1(DmP_mant_SHT1_SW[20]), .Y(n1227) );
  OAI21XLTS U1109 ( .A0(n1286), .A1(n1150), .B0(n1201), .Y(n787) );
  NOR2X2TS U1110 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1525), .Y(n1267) );
  AOI221X1TS U1111 ( .A0(n1541), .A1(intDX_EWSW[26]), .B0(intDX_EWSW[27]), 
        .B1(n1545), .C0(n1080), .Y(n1084) );
  OAI21X2TS U1112 ( .A0(intDX_EWSW[18]), .A1(n1546), .B0(n1001), .Y(n1087) );
  NOR3X1TS U1113 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[19]), .C(
        Raw_mant_NRM_SWR[20]), .Y(n1258) );
  NOR2X2TS U1114 ( .A(Raw_mant_NRM_SWR[12]), .B(n1136), .Y(n1252) );
  AOI222X1TS U1115 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n901), .B0(n905), .B1(n898), .C0(n1287), .C1(DmP_mant_SHT1_SW[12]), .Y(n1226) );
  OAI211XLTS U1116 ( .A0(n1226), .A1(n904), .B0(n1225), .C0(n1224), .Y(n784)
         );
  NOR3X1TS U1117 ( .A(shift_value_SHT2_EWR[4]), .B(shift_value_SHT2_EWR[2]), 
        .C(n1505), .Y(n1365) );
  NOR2X4TS U1118 ( .A(shift_value_SHT2_EWR[2]), .B(shift_value_SHT2_EWR[3]), 
        .Y(n1403) );
  NOR2XLTS U1119 ( .A(n1604), .B(intDX_EWSW[11]), .Y(n978) );
  OAI21XLTS U1120 ( .A0(intDX_EWSW[15]), .A1(n1605), .B0(intDX_EWSW[14]), .Y(
        n986) );
  NOR2XLTS U1121 ( .A(n999), .B(intDY_EWSW[16]), .Y(n1000) );
  OAI21XLTS U1122 ( .A0(intDX_EWSW[23]), .A1(n1543), .B0(intDX_EWSW[22]), .Y(
        n1005) );
  OAI21XLTS U1123 ( .A0(intDX_EWSW[21]), .A1(n1532), .B0(intDX_EWSW[20]), .Y(
        n998) );
  NOR2XLTS U1124 ( .A(Raw_mant_NRM_SWR[17]), .B(Raw_mant_NRM_SWR[16]), .Y(
        n1139) );
  OR2X1TS U1125 ( .A(n950), .B(n949), .Y(n1236) );
  OAI21XLTS U1126 ( .A0(n1486), .A1(n1211), .B0(n1206), .Y(n1207) );
  OAI21XLTS U1127 ( .A0(n1558), .A1(n1211), .B0(n1189), .Y(n1190) );
  OAI21XLTS U1128 ( .A0(n1534), .A1(n1050), .B0(n1045), .Y(n745) );
  OAI211XLTS U1129 ( .A0(n1173), .A1(n904), .B0(n1166), .C0(n1165), .Y(n776)
         );
  OAI21XLTS U1130 ( .A0(n1283), .A1(n1167), .B0(n1192), .Y(n792) );
  CLKBUFX2TS U1131 ( .A(n931), .Y(n933) );
  BUFX3TS U1132 ( .A(n1581), .Y(n1588) );
  BUFX3TS U1133 ( .A(n932), .Y(n1591) );
  BUFX3TS U1134 ( .A(n932), .Y(n1592) );
  BUFX3TS U1135 ( .A(n1575), .Y(n1584) );
  BUFX3TS U1136 ( .A(n931), .Y(n1594) );
  BUFX3TS U1137 ( .A(n931), .Y(n1580) );
  BUFX3TS U1138 ( .A(n931), .Y(n1597) );
  BUFX3TS U1139 ( .A(n932), .Y(n1598) );
  BUFX3TS U1140 ( .A(n931), .Y(n1579) );
  BUFX3TS U1141 ( .A(n931), .Y(n1596) );
  BUFX3TS U1142 ( .A(n1575), .Y(n1599) );
  BUFX3TS U1143 ( .A(n932), .Y(n1577) );
  BUFX3TS U1144 ( .A(n1589), .Y(n1582) );
  INVX2TS U1145 ( .A(DP_OP_15J60_123_4652_n4), .Y(n934) );
  NAND2X1TS U1146 ( .A(n1526), .B(n934), .Y(n936) );
  INVX2TS U1147 ( .A(n936), .Y(n935) );
  NAND2X1TS U1148 ( .A(n1547), .B(n935), .Y(n939) );
  AND4X1TS U1149 ( .A(exp_rslt_NRM2_EW1[3]), .B(n952), .C(exp_rslt_NRM2_EW1[2]), .D(exp_rslt_NRM2_EW1[1]), .Y(n937) );
  AND4X1TS U1150 ( .A(n1262), .B(n951), .C(exp_rslt_NRM2_EW1[4]), .D(n937), 
        .Y(n938) );
  CLKAND2X2TS U1151 ( .A(n949), .B(n938), .Y(n942) );
  INVX2TS U1152 ( .A(n939), .Y(n940) );
  CLKAND2X2TS U1153 ( .A(n1553), .B(n940), .Y(n941) );
  INVX2TS U1154 ( .A(n1363), .Y(n943) );
  AO22XLTS U1155 ( .A0(n943), .A1(n949), .B0(n1423), .B1(final_result_ieee[30]), .Y(n754) );
  NOR2XLTS U1156 ( .A(n952), .B(exp_rslt_NRM2_EW1[1]), .Y(n946) );
  INVX2TS U1157 ( .A(exp_rslt_NRM2_EW1[3]), .Y(n945) );
  INVX2TS U1158 ( .A(exp_rslt_NRM2_EW1[2]), .Y(n944) );
  NAND4BXLTS U1159 ( .AN(exp_rslt_NRM2_EW1[4]), .B(n946), .C(n945), .D(n944), 
        .Y(n947) );
  NOR2XLTS U1160 ( .A(n947), .B(n951), .Y(n948) );
  NAND2X2TS U1161 ( .A(n1236), .B(Shift_reg_FLAGS_7[0]), .Y(n1263) );
  OA22X1TS U1162 ( .A0(n1263), .A1(exp_rslt_NRM2_EW1[4]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[27]), .Y(n757) );
  OA22X1TS U1163 ( .A0(n1263), .A1(exp_rslt_NRM2_EW1[1]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[24]), .Y(n760) );
  OA22X1TS U1164 ( .A0(n1263), .A1(n951), .B0(Shift_reg_FLAGS_7[0]), .B1(
        final_result_ieee[28]), .Y(n756) );
  OA22X1TS U1165 ( .A0(n1263), .A1(n952), .B0(Shift_reg_FLAGS_7[0]), .B1(
        final_result_ieee[23]), .Y(n761) );
  OA22X1TS U1166 ( .A0(n1263), .A1(exp_rslt_NRM2_EW1[3]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[26]), .Y(n758) );
  OA22X1TS U1167 ( .A0(n1263), .A1(exp_rslt_NRM2_EW1[2]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[25]), .Y(n759) );
  OAI21XLTS U1168 ( .A0(n873), .A1(n1437), .B0(n874), .Y(n829) );
  AOI2BB2XLTS U1169 ( .B0(beg_OP), .B1(n1489), .A0N(n1489), .A1N(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .Y(n953) );
  NAND3XLTS U1170 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1489), .C(
        n1525), .Y(n1264) );
  OAI21XLTS U1171 ( .A0(n1267), .A1(n953), .B0(n1264), .Y(n870) );
  NOR2X1TS U1172 ( .A(n1606), .B(intDX_EWSW[25]), .Y(n1012) );
  NOR2XLTS U1173 ( .A(n1012), .B(intDY_EWSW[24]), .Y(n954) );
  AOI22X1TS U1174 ( .A0(intDX_EWSW[25]), .A1(n1606), .B0(intDX_EWSW[24]), .B1(
        n954), .Y(n958) );
  NAND2BXLTS U1175 ( .AN(intDY_EWSW[27]), .B(intDX_EWSW[27]), .Y(n956) );
  NOR2X1TS U1176 ( .A(n1544), .B(intDX_EWSW[30]), .Y(n961) );
  NOR2X1TS U1177 ( .A(n1493), .B(intDX_EWSW[29]), .Y(n959) );
  AOI211X1TS U1178 ( .A0(intDY_EWSW[28]), .A1(n1519), .B0(n961), .C0(n959), 
        .Y(n1011) );
  NOR3XLTS U1179 ( .A(n1519), .B(n959), .C(intDY_EWSW[28]), .Y(n960) );
  AOI2BB2X1TS U1180 ( .B0(n963), .B1(n1011), .A0N(n962), .A1N(n961), .Y(n1016)
         );
  NOR2X1TS U1181 ( .A(n1572), .B(intDX_EWSW[17]), .Y(n999) );
  OAI22X1TS U1182 ( .A0(n881), .A1(intDX_EWSW[10]), .B0(n1604), .B1(
        intDX_EWSW[11]), .Y(n1095) );
  INVX2TS U1183 ( .A(n1095), .Y(n983) );
  OAI211XLTS U1184 ( .A0(intDX_EWSW[8]), .A1(n1534), .B0(n980), .C0(n983), .Y(
        n994) );
  OAI2BB1X1TS U1185 ( .A0N(n1507), .A1N(intDY_EWSW[5]), .B0(intDX_EWSW[4]), 
        .Y(n964) );
  OAI22X1TS U1186 ( .A0(intDY_EWSW[4]), .A1(n964), .B0(n1507), .B1(
        intDY_EWSW[5]), .Y(n975) );
  OAI2BB1X1TS U1187 ( .A0N(n1488), .A1N(intDY_EWSW[7]), .B0(intDX_EWSW[6]), 
        .Y(n965) );
  OAI22X1TS U1188 ( .A0(intDY_EWSW[6]), .A1(n965), .B0(n1488), .B1(
        intDY_EWSW[7]), .Y(n974) );
  OAI21XLTS U1189 ( .A0(intDX_EWSW[1]), .A1(n1533), .B0(n907), .Y(n966) );
  OAI2BB2XLTS U1190 ( .B0(intDY_EWSW[0]), .B1(n966), .A0N(intDX_EWSW[1]), 
        .A1N(n1533), .Y(n968) );
  OAI211XLTS U1191 ( .A0(n1529), .A1(intDX_EWSW[3]), .B0(n968), .C0(n967), .Y(
        n971) );
  OAI21XLTS U1192 ( .A0(intDX_EWSW[3]), .A1(n1529), .B0(intDX_EWSW[2]), .Y(
        n969) );
  AOI2BB2XLTS U1193 ( .B0(intDX_EWSW[3]), .B1(n1529), .A0N(intDY_EWSW[2]), 
        .A1N(n969), .Y(n970) );
  AOI222X1TS U1194 ( .A0(intDY_EWSW[4]), .A1(n1487), .B0(n971), .B1(n970), 
        .C0(intDY_EWSW[5]), .C1(n1507), .Y(n973) );
  AOI22X1TS U1195 ( .A0(intDY_EWSW[7]), .A1(n1488), .B0(intDY_EWSW[6]), .B1(
        n1514), .Y(n972) );
  OAI32X1TS U1196 ( .A0(n975), .A1(n974), .A2(n973), .B0(n972), .B1(n974), .Y(
        n993) );
  OA22X1TS U1197 ( .A0(n1538), .A1(intDX_EWSW[14]), .B0(n1605), .B1(
        intDX_EWSW[15]), .Y(n990) );
  OAI21XLTS U1198 ( .A0(intDX_EWSW[13]), .A1(n1531), .B0(intDX_EWSW[12]), .Y(
        n977) );
  OAI2BB2XLTS U1199 ( .B0(intDY_EWSW[12]), .B1(n977), .A0N(intDX_EWSW[13]), 
        .A1N(n1531), .Y(n989) );
  AOI22X1TS U1200 ( .A0(intDX_EWSW[11]), .A1(n1604), .B0(intDX_EWSW[10]), .B1(
        n979), .Y(n985) );
  NAND2BXLTS U1201 ( .AN(intDY_EWSW[9]), .B(intDX_EWSW[9]), .Y(n982) );
  NAND3XLTS U1202 ( .A(n1534), .B(n980), .C(intDX_EWSW[8]), .Y(n981) );
  AOI21X1TS U1203 ( .A0(n982), .A1(n981), .B0(n992), .Y(n984) );
  OAI2BB2XLTS U1204 ( .B0(n985), .B1(n992), .A0N(n984), .A1N(n983), .Y(n988)
         );
  OAI2BB2XLTS U1205 ( .B0(intDY_EWSW[14]), .B1(n986), .A0N(intDX_EWSW[15]), 
        .A1N(n1605), .Y(n987) );
  AOI211X1TS U1206 ( .A0(n990), .A1(n989), .B0(n988), .C0(n987), .Y(n991) );
  OAI31X1TS U1207 ( .A0(n994), .A1(n993), .A2(n992), .B0(n991), .Y(n997) );
  OA22X1TS U1208 ( .A0(n1492), .A1(intDX_EWSW[22]), .B0(n1543), .B1(
        intDX_EWSW[23]), .Y(n1009) );
  AOI211XLTS U1209 ( .A0(intDY_EWSW[16]), .A1(n1513), .B0(n1004), .C0(n1087), 
        .Y(n996) );
  OAI2BB2XLTS U1210 ( .B0(intDY_EWSW[20]), .B1(n998), .A0N(intDX_EWSW[21]), 
        .A1N(n1532), .Y(n1008) );
  AOI22X1TS U1211 ( .A0(intDX_EWSW[17]), .A1(n1572), .B0(intDX_EWSW[16]), .B1(
        n1000), .Y(n1003) );
  OAI32X1TS U1212 ( .A0(n1087), .A1(n1004), .A2(n1003), .B0(n1002), .B1(n1004), 
        .Y(n1007) );
  OAI2BB2XLTS U1213 ( .B0(intDY_EWSW[22]), .B1(n1005), .A0N(intDX_EWSW[23]), 
        .A1N(n1543), .Y(n1006) );
  AOI211X1TS U1214 ( .A0(n1009), .A1(n1008), .B0(n1007), .C0(n1006), .Y(n1014)
         );
  NAND2BXLTS U1215 ( .AN(intDX_EWSW[24]), .B(intDY_EWSW[24]), .Y(n1010) );
  NAND4BBX1TS U1216 ( .AN(n1080), .BN(n1012), .C(n1011), .D(n1010), .Y(n1013)
         );
  AOI32X1TS U1217 ( .A0(n1016), .A1(n1015), .A2(n1014), .B0(n1013), .B1(n1016), 
        .Y(n1017) );
  INVX2TS U1218 ( .A(Shift_reg_FLAGS_7_6), .Y(n1020) );
  INVX4TS U1219 ( .A(n1025), .Y(n1336) );
  AND2X2TS U1220 ( .A(Shift_reg_FLAGS_7_6), .B(n1017), .Y(n1040) );
  AOI22X1TS U1221 ( .A0(n900), .A1(n1268), .B0(intDX_EWSW[27]), .B1(n1040), 
        .Y(n1018) );
  OAI21XLTS U1222 ( .A0(n1545), .A1(n1336), .B0(n1018), .Y(n726) );
  AOI22X1TS U1223 ( .A0(intDX_EWSW[1]), .A1(n1040), .B0(DMP_EXP_EWSW[1]), .B1(
        n1325), .Y(n1019) );
  OAI21XLTS U1224 ( .A0(n1533), .A1(n1336), .B0(n1019), .Y(n752) );
  BUFX3TS U1225 ( .A(n1040), .Y(n1037) );
  BUFX4TS U1226 ( .A(n1020), .Y(n1066) );
  AOI22X1TS U1227 ( .A0(intDX_EWSW[28]), .A1(n1037), .B0(DMP_EXP_EWSW[28]), 
        .B1(n1066), .Y(n1021) );
  OAI21XLTS U1228 ( .A0(n1542), .A1(n1336), .B0(n1021), .Y(n725) );
  AOI22X1TS U1229 ( .A0(intDX_EWSW[29]), .A1(n1037), .B0(DMP_EXP_EWSW[29]), 
        .B1(n1066), .Y(n1022) );
  OAI21XLTS U1230 ( .A0(n1493), .A1(n1336), .B0(n1022), .Y(n724) );
  AOI22X1TS U1231 ( .A0(intDX_EWSW[30]), .A1(n1037), .B0(DMP_EXP_EWSW[30]), 
        .B1(n1325), .Y(n1023) );
  OAI21XLTS U1232 ( .A0(n1544), .A1(n1336), .B0(n1023), .Y(n723) );
  AOI22X1TS U1233 ( .A0(DMP_EXP_EWSW[23]), .A1(n1268), .B0(intDX_EWSW[23]), 
        .B1(n1037), .Y(n1024) );
  OAI21XLTS U1234 ( .A0(n1543), .A1(n1336), .B0(n1024), .Y(n730) );
  BUFX3TS U1235 ( .A(n1025), .Y(n1073) );
  AOI22X1TS U1236 ( .A0(intDX_EWSW[21]), .A1(n1037), .B0(DMP_EXP_EWSW[21]), 
        .B1(n1066), .Y(n1026) );
  OAI21XLTS U1237 ( .A0(n1532), .A1(n1050), .B0(n1026), .Y(n732) );
  AOI22X1TS U1238 ( .A0(intDX_EWSW[20]), .A1(n1037), .B0(DMP_EXP_EWSW[20]), 
        .B1(n1325), .Y(n1027) );
  OAI21XLTS U1239 ( .A0(n1540), .A1(n1050), .B0(n1027), .Y(n733) );
  AOI22X1TS U1240 ( .A0(intDX_EWSW[17]), .A1(n1037), .B0(DMP_EXP_EWSW[17]), 
        .B1(n1066), .Y(n1028) );
  OAI21XLTS U1241 ( .A0(n1572), .A1(n1050), .B0(n1028), .Y(n736) );
  AOI22X1TS U1242 ( .A0(intDX_EWSW[22]), .A1(n1037), .B0(DMP_EXP_EWSW[22]), 
        .B1(n1325), .Y(n1029) );
  OAI21XLTS U1243 ( .A0(n1492), .A1(n1050), .B0(n1029), .Y(n731) );
  AOI22X1TS U1244 ( .A0(intDX_EWSW[18]), .A1(n1037), .B0(DMP_EXP_EWSW[18]), 
        .B1(n1325), .Y(n1030) );
  OAI21XLTS U1245 ( .A0(n1546), .A1(n1050), .B0(n1030), .Y(n735) );
  AOI22X1TS U1246 ( .A0(intDX_EWSW[7]), .A1(n1040), .B0(DMP_EXP_EWSW[7]), .B1(
        n1325), .Y(n1031) );
  OAI21XLTS U1247 ( .A0(n1524), .A1(n1050), .B0(n1031), .Y(n746) );
  AOI22X1TS U1248 ( .A0(intDX_EWSW[6]), .A1(n1040), .B0(DMP_EXP_EWSW[6]), .B1(
        n1066), .Y(n1032) );
  OAI21XLTS U1249 ( .A0(n1523), .A1(n1050), .B0(n1032), .Y(n747) );
  AOI22X1TS U1250 ( .A0(intDX_EWSW[19]), .A1(n1037), .B0(DMP_EXP_EWSW[19]), 
        .B1(n1066), .Y(n1033) );
  OAI21XLTS U1251 ( .A0(n1494), .A1(n1050), .B0(n1033), .Y(n734) );
  AOI22X1TS U1252 ( .A0(intDX_EWSW[2]), .A1(n1040), .B0(DMP_EXP_EWSW[2]), .B1(
        n1066), .Y(n1034) );
  OAI21XLTS U1253 ( .A0(n1535), .A1(n1050), .B0(n1034), .Y(n751) );
  AOI22X1TS U1254 ( .A0(n907), .A1(n1037), .B0(DMP_EXP_EWSW[0]), .B1(n1325), 
        .Y(n1035) );
  OAI21XLTS U1255 ( .A0(n1491), .A1(n1050), .B0(n1035), .Y(n753) );
  AOI22X1TS U1256 ( .A0(intDX_EWSW[4]), .A1(n1040), .B0(DMP_EXP_EWSW[4]), .B1(
        n1066), .Y(n1036) );
  OAI21XLTS U1257 ( .A0(n1536), .A1(n1050), .B0(n1036), .Y(n749) );
  AOI22X1TS U1258 ( .A0(intDX_EWSW[5]), .A1(n893), .B0(DMP_EXP_EWSW[5]), .B1(
        n1066), .Y(n1038) );
  OAI21XLTS U1259 ( .A0(n1490), .A1(n1336), .B0(n1038), .Y(n748) );
  AOI22X1TS U1260 ( .A0(intDX_EWSW[16]), .A1(n893), .B0(DMP_EXP_EWSW[16]), 
        .B1(n1066), .Y(n1039) );
  OAI21XLTS U1261 ( .A0(n1539), .A1(n1050), .B0(n1039), .Y(n737) );
  AOI222X1TS U1262 ( .A0(n1073), .A1(intDX_EWSW[23]), .B0(DmP_EXP_EWSW[23]), 
        .B1(n1325), .C0(intDY_EWSW[23]), .C1(n1040), .Y(n1041) );
  INVX2TS U1263 ( .A(n1041), .Y(n564) );
  AOI22X1TS U1264 ( .A0(intDX_EWSW[10]), .A1(n893), .B0(DMP_EXP_EWSW[10]), 
        .B1(n1325), .Y(n1042) );
  OAI21XLTS U1265 ( .A0(n881), .A1(n1050), .B0(n1042), .Y(n743) );
  AOI22X1TS U1266 ( .A0(intDX_EWSW[9]), .A1(n893), .B0(DMP_EXP_EWSW[9]), .B1(
        n1066), .Y(n1043) );
  OAI21XLTS U1267 ( .A0(n1530), .A1(n1336), .B0(n1043), .Y(n744) );
  AOI22X1TS U1268 ( .A0(intDX_EWSW[14]), .A1(n893), .B0(DMP_EXP_EWSW[14]), 
        .B1(n1268), .Y(n1044) );
  OAI21XLTS U1269 ( .A0(n1538), .A1(n1050), .B0(n1044), .Y(n739) );
  AOI22X1TS U1270 ( .A0(intDX_EWSW[8]), .A1(n893), .B0(DMP_EXP_EWSW[8]), .B1(
        n1268), .Y(n1045) );
  AOI22X1TS U1271 ( .A0(intDX_EWSW[12]), .A1(n893), .B0(DMP_EXP_EWSW[12]), 
        .B1(n1268), .Y(n1046) );
  OAI21XLTS U1272 ( .A0(n1537), .A1(n1050), .B0(n1046), .Y(n741) );
  AOI22X1TS U1273 ( .A0(intDX_EWSW[11]), .A1(n893), .B0(DMP_EXP_EWSW[11]), 
        .B1(n1066), .Y(n1047) );
  OAI21XLTS U1274 ( .A0(n1604), .A1(n1050), .B0(n1047), .Y(n742) );
  AOI22X1TS U1275 ( .A0(intDX_EWSW[13]), .A1(n893), .B0(DMP_EXP_EWSW[13]), 
        .B1(n1325), .Y(n1048) );
  OAI21XLTS U1276 ( .A0(n1531), .A1(n1050), .B0(n1048), .Y(n740) );
  AOI22X1TS U1277 ( .A0(intDX_EWSW[15]), .A1(n893), .B0(DMP_EXP_EWSW[15]), 
        .B1(n1325), .Y(n1049) );
  OAI21XLTS U1278 ( .A0(n1605), .A1(n1050), .B0(n1049), .Y(n738) );
  AOI22X1TS U1279 ( .A0(intDX_EWSW[3]), .A1(n893), .B0(DMP_EXP_EWSW[3]), .B1(
        n1325), .Y(n1051) );
  OAI21XLTS U1280 ( .A0(n1529), .A1(n1336), .B0(n1051), .Y(n750) );
  INVX3TS U1281 ( .A(n893), .Y(n1114) );
  AOI22X1TS U1282 ( .A0(intDX_EWSW[8]), .A1(n1073), .B0(DmP_EXP_EWSW[8]), .B1(
        n1325), .Y(n1052) );
  OAI21XLTS U1283 ( .A0(n1534), .A1(n1114), .B0(n1052), .Y(n594) );
  CLKBUFX3TS U1284 ( .A(n1073), .Y(n1077) );
  AOI22X1TS U1285 ( .A0(intDX_EWSW[13]), .A1(n1077), .B0(DmP_EXP_EWSW[13]), 
        .B1(n1268), .Y(n1053) );
  OAI21XLTS U1286 ( .A0(n1531), .A1(n1114), .B0(n1053), .Y(n584) );
  AOI22X1TS U1287 ( .A0(intDX_EWSW[12]), .A1(n1073), .B0(DmP_EXP_EWSW[12]), 
        .B1(n1020), .Y(n1054) );
  OAI21XLTS U1288 ( .A0(n1537), .A1(n1114), .B0(n1054), .Y(n586) );
  AOI22X1TS U1289 ( .A0(DmP_EXP_EWSW[27]), .A1(n1268), .B0(intDX_EWSW[27]), 
        .B1(n1073), .Y(n1055) );
  OAI21XLTS U1290 ( .A0(n1545), .A1(n1114), .B0(n1055), .Y(n560) );
  AOI22X1TS U1291 ( .A0(intDX_EWSW[14]), .A1(n1077), .B0(DmP_EXP_EWSW[14]), 
        .B1(n1020), .Y(n1056) );
  OAI21XLTS U1292 ( .A0(n1538), .A1(n1114), .B0(n1056), .Y(n582) );
  AOI22X1TS U1293 ( .A0(intDX_EWSW[15]), .A1(n1077), .B0(DmP_EXP_EWSW[15]), 
        .B1(n1268), .Y(n1057) );
  OAI21XLTS U1294 ( .A0(n1605), .A1(n1114), .B0(n1057), .Y(n580) );
  AOI22X1TS U1295 ( .A0(intDX_EWSW[4]), .A1(n1025), .B0(DmP_EXP_EWSW[4]), .B1(
        n1325), .Y(n1058) );
  OAI21XLTS U1296 ( .A0(n1536), .A1(n1114), .B0(n1058), .Y(n602) );
  AOI22X1TS U1297 ( .A0(intDX_EWSW[5]), .A1(n1073), .B0(DmP_EXP_EWSW[5]), .B1(
        n1325), .Y(n1059) );
  OAI21XLTS U1298 ( .A0(n1490), .A1(n1114), .B0(n1059), .Y(n600) );
  AOI22X1TS U1299 ( .A0(intDX_EWSW[9]), .A1(n1025), .B0(DmP_EXP_EWSW[9]), .B1(
        n1325), .Y(n1060) );
  OAI21XLTS U1300 ( .A0(n1530), .A1(n1114), .B0(n1060), .Y(n592) );
  AOI22X1TS U1301 ( .A0(intDX_EWSW[7]), .A1(n1025), .B0(DmP_EXP_EWSW[7]), .B1(
        n1020), .Y(n1061) );
  OAI21XLTS U1302 ( .A0(n1524), .A1(n1114), .B0(n1061), .Y(n596) );
  AOI22X1TS U1303 ( .A0(intDX_EWSW[6]), .A1(n1073), .B0(DmP_EXP_EWSW[6]), .B1(
        n1268), .Y(n1062) );
  OAI21XLTS U1304 ( .A0(n1523), .A1(n1114), .B0(n1062), .Y(n598) );
  AOI22X1TS U1305 ( .A0(intDX_EWSW[11]), .A1(n1073), .B0(DmP_EXP_EWSW[11]), 
        .B1(n1020), .Y(n1063) );
  OAI21XLTS U1306 ( .A0(n1604), .A1(n1114), .B0(n1063), .Y(n588) );
  AOI22X1TS U1307 ( .A0(intDX_EWSW[10]), .A1(n1025), .B0(DmP_EXP_EWSW[10]), 
        .B1(n1066), .Y(n1064) );
  OAI21XLTS U1308 ( .A0(n881), .A1(n1114), .B0(n1064), .Y(n590) );
  INVX4TS U1309 ( .A(n893), .Y(n1334) );
  AOI22X1TS U1310 ( .A0(intDX_EWSW[2]), .A1(n1073), .B0(DmP_EXP_EWSW[2]), .B1(
        n1268), .Y(n1065) );
  OAI21XLTS U1311 ( .A0(n1535), .A1(n1334), .B0(n1065), .Y(n606) );
  AOI22X1TS U1312 ( .A0(n907), .A1(n1077), .B0(DmP_EXP_EWSW[0]), .B1(n1066), 
        .Y(n1067) );
  OAI21XLTS U1313 ( .A0(n1491), .A1(n1334), .B0(n1067), .Y(n610) );
  AOI22X1TS U1314 ( .A0(intDX_EWSW[17]), .A1(n1077), .B0(DmP_EXP_EWSW[17]), 
        .B1(n1268), .Y(n1068) );
  OAI21XLTS U1315 ( .A0(n1572), .A1(n1334), .B0(n1068), .Y(n576) );
  AOI22X1TS U1316 ( .A0(intDX_EWSW[22]), .A1(n1077), .B0(DmP_EXP_EWSW[22]), 
        .B1(n1268), .Y(n1069) );
  OAI21XLTS U1317 ( .A0(n1492), .A1(n1334), .B0(n1069), .Y(n566) );
  AOI22X1TS U1318 ( .A0(intDX_EWSW[3]), .A1(n1073), .B0(DmP_EXP_EWSW[3]), .B1(
        n1020), .Y(n1070) );
  OAI21XLTS U1319 ( .A0(n1529), .A1(n1334), .B0(n1070), .Y(n604) );
  AOI22X1TS U1320 ( .A0(intDX_EWSW[16]), .A1(n1077), .B0(DmP_EXP_EWSW[16]), 
        .B1(n1268), .Y(n1071) );
  OAI21XLTS U1321 ( .A0(n1539), .A1(n1334), .B0(n1071), .Y(n578) );
  AOI22X1TS U1322 ( .A0(intDX_EWSW[19]), .A1(n1077), .B0(DmP_EXP_EWSW[19]), 
        .B1(n1268), .Y(n1072) );
  OAI21XLTS U1323 ( .A0(n1494), .A1(n1334), .B0(n1072), .Y(n572) );
  AOI22X1TS U1324 ( .A0(intDX_EWSW[1]), .A1(n1073), .B0(DmP_EXP_EWSW[1]), .B1(
        n1066), .Y(n1074) );
  OAI21XLTS U1325 ( .A0(n1533), .A1(n1334), .B0(n1074), .Y(n608) );
  AOI22X1TS U1326 ( .A0(intDX_EWSW[18]), .A1(n1025), .B0(DmP_EXP_EWSW[18]), 
        .B1(n1268), .Y(n1075) );
  OAI21XLTS U1327 ( .A0(n1546), .A1(n1334), .B0(n1075), .Y(n574) );
  AOI22X1TS U1328 ( .A0(intDX_EWSW[21]), .A1(n1077), .B0(DmP_EXP_EWSW[21]), 
        .B1(n1268), .Y(n1076) );
  OAI21XLTS U1329 ( .A0(n1532), .A1(n1334), .B0(n1076), .Y(n568) );
  AOI22X1TS U1330 ( .A0(intDX_EWSW[20]), .A1(n1077), .B0(DmP_EXP_EWSW[20]), 
        .B1(n1268), .Y(n1078) );
  OAI21XLTS U1331 ( .A0(n1540), .A1(n1334), .B0(n1078), .Y(n570) );
  OAI22X1TS U1332 ( .A0(n1533), .A1(intDX_EWSW[1]), .B0(n1606), .B1(
        intDX_EWSW[25]), .Y(n1079) );
  AOI221X1TS U1333 ( .A0(n1533), .A1(intDX_EWSW[1]), .B0(intDX_EWSW[25]), .B1(
        n1606), .C0(n1079), .Y(n1085) );
  OAI22X1TS U1334 ( .A0(n1542), .A1(intDX_EWSW[28]), .B0(n1493), .B1(
        intDX_EWSW[29]), .Y(n1081) );
  AOI221X1TS U1335 ( .A0(n1542), .A1(intDX_EWSW[28]), .B0(intDX_EWSW[29]), 
        .B1(n1493), .C0(n1081), .Y(n1083) );
  AOI2BB2XLTS U1336 ( .B0(intDX_EWSW[7]), .B1(n1524), .A0N(n1524), .A1N(
        intDX_EWSW[7]), .Y(n1082) );
  NAND4XLTS U1337 ( .A(n1085), .B(n1084), .C(n1083), .D(n1082), .Y(n1113) );
  OAI22X1TS U1338 ( .A0(n1544), .A1(intDX_EWSW[30]), .B0(n1572), .B1(
        intDX_EWSW[17]), .Y(n1086) );
  OAI22X1TS U1339 ( .A0(n1540), .A1(intDX_EWSW[20]), .B0(n1532), .B1(
        intDX_EWSW[21]), .Y(n1088) );
  OAI22X1TS U1340 ( .A0(n1492), .A1(intDX_EWSW[22]), .B0(n1543), .B1(
        intDX_EWSW[23]), .Y(n1089) );
  NAND4XLTS U1341 ( .A(n1093), .B(n1092), .C(n1091), .D(n1090), .Y(n1112) );
  OAI22X1TS U1342 ( .A0(n1480), .A1(intDX_EWSW[24]), .B0(n1530), .B1(
        intDX_EWSW[9]), .Y(n1094) );
  AOI221X1TS U1343 ( .A0(n1480), .A1(intDX_EWSW[24]), .B0(intDX_EWSW[9]), .B1(
        n1530), .C0(n1094), .Y(n1101) );
  OAI22X1TS U1344 ( .A0(n1537), .A1(intDX_EWSW[12]), .B0(n1531), .B1(
        intDX_EWSW[13]), .Y(n1096) );
  OAI22X1TS U1345 ( .A0(n1538), .A1(intDX_EWSW[14]), .B0(n1605), .B1(
        intDX_EWSW[15]), .Y(n1097) );
  NAND4XLTS U1346 ( .A(n1101), .B(n1100), .C(n1099), .D(n1098), .Y(n1111) );
  OAI22X1TS U1347 ( .A0(n1539), .A1(intDX_EWSW[16]), .B0(n1491), .B1(n907), 
        .Y(n1102) );
  AOI221X1TS U1348 ( .A0(n1539), .A1(intDX_EWSW[16]), .B0(n907), .B1(n1491), 
        .C0(n1102), .Y(n1109) );
  OAI22X1TS U1349 ( .A0(n1535), .A1(intDX_EWSW[2]), .B0(n1529), .B1(
        intDX_EWSW[3]), .Y(n1103) );
  OAI22X1TS U1350 ( .A0(n1536), .A1(intDX_EWSW[4]), .B0(n1490), .B1(
        intDX_EWSW[5]), .Y(n1104) );
  AOI221X1TS U1351 ( .A0(n1536), .A1(intDX_EWSW[4]), .B0(intDX_EWSW[5]), .B1(
        n1490), .C0(n1104), .Y(n1107) );
  OAI22X1TS U1352 ( .A0(n1534), .A1(intDX_EWSW[8]), .B0(n1523), .B1(
        intDX_EWSW[6]), .Y(n1105) );
  AOI221X1TS U1353 ( .A0(n1534), .A1(intDX_EWSW[8]), .B0(intDX_EWSW[6]), .B1(
        n1523), .C0(n1105), .Y(n1106) );
  NAND4XLTS U1354 ( .A(n1109), .B(n1108), .C(n1107), .D(n1106), .Y(n1110) );
  NOR4X1TS U1355 ( .A(n1113), .B(n1112), .C(n1111), .D(n1110), .Y(n1327) );
  CLKXOR2X2TS U1356 ( .A(intDY_EWSW[31]), .B(intAS), .Y(n1324) );
  INVX2TS U1357 ( .A(n1324), .Y(n1117) );
  AOI22X1TS U1358 ( .A0(intDX_EWSW[31]), .A1(n1115), .B0(SIGN_FLAG_EXP), .B1(
        n878), .Y(n1116) );
  NOR2XLTS U1359 ( .A(Raw_mant_NRM_SWR[8]), .B(Raw_mant_NRM_SWR[9]), .Y(n1119)
         );
  NAND4X1TS U1360 ( .A(n1484), .B(n1473), .C(n1472), .D(n1501), .Y(n1257) );
  NOR2BX1TS U1361 ( .AN(n1134), .B(Raw_mant_NRM_SWR[18]), .Y(n1245) );
  NOR2BX1TS U1362 ( .AN(n1245), .B(n1246), .Y(n1131) );
  NAND2X1TS U1363 ( .A(n1131), .B(n1486), .Y(n1247) );
  NAND2X1TS U1364 ( .A(n1143), .B(n1475), .Y(n1136) );
  NAND2X1TS U1365 ( .A(n1252), .B(n1476), .Y(n1118) );
  NOR2X1TS U1366 ( .A(Raw_mant_NRM_SWR[4]), .B(Raw_mant_NRM_SWR[5]), .Y(n1120)
         );
  NOR3X1TS U1367 ( .A(Raw_mant_NRM_SWR[8]), .B(Raw_mant_NRM_SWR[9]), .C(n1118), 
        .Y(n1121) );
  NAND2X1TS U1368 ( .A(n1121), .B(n1477), .Y(n1128) );
  OAI22X1TS U1369 ( .A0(n1119), .A1(n1118), .B0(n1120), .B1(n1128), .Y(n1126)
         );
  NOR2X1TS U1370 ( .A(Raw_mant_NRM_SWR[3]), .B(Raw_mant_NRM_SWR[2]), .Y(n1123)
         );
  NAND2X1TS U1371 ( .A(n1253), .B(n1120), .Y(n1124) );
  OAI21X1TS U1372 ( .A0(n1123), .A1(n1124), .B0(n1122), .Y(n1147) );
  INVX2TS U1373 ( .A(n1124), .Y(n1254) );
  OAI31X1TS U1374 ( .A0(n1126), .A1(n1147), .A2(n1125), .B0(
        Shift_reg_FLAGS_7[1]), .Y(n1244) );
  NAND3XLTS U1375 ( .A(n873), .B(Shift_amount_SHT1_EWR[4]), .C(n874), .Y(n1127) );
  INVX2TS U1376 ( .A(n1128), .Y(n1138) );
  AOI22X1TS U1377 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n1134), .B0(n1252), .B1(
        Raw_mant_NRM_SWR[10]), .Y(n1144) );
  OAI32X1TS U1378 ( .A0(Raw_mant_NRM_SWR[3]), .A1(Raw_mant_NRM_SWR[1]), .A2(
        n1478), .B0(n1504), .B1(Raw_mant_NRM_SWR[3]), .Y(n1129) );
  NAND2X1TS U1379 ( .A(Raw_mant_NRM_SWR[12]), .B(n1143), .Y(n1249) );
  NAND2X1TS U1380 ( .A(Raw_mant_NRM_SWR[14]), .B(n1131), .Y(n1149) );
  AOI32X1TS U1381 ( .A0(Raw_mant_NRM_SWR[20]), .A1(n1472), .A2(n1506), .B0(
        Raw_mant_NRM_SWR[22]), .B1(n1472), .Y(n1132) );
  AOI32X1TS U1382 ( .A0(n1473), .A1(n1149), .A2(n1132), .B0(
        Raw_mant_NRM_SWR[25]), .B1(n1149), .Y(n1133) );
  OAI31X1TS U1383 ( .A0(Raw_mant_NRM_SWR[9]), .A1(n1136), .A2(n1479), .B0(
        n1135), .Y(n1137) );
  NAND2X2TS U1384 ( .A(Shift_reg_FLAGS_7[1]), .B(n1152), .Y(n1290) );
  NOR2BX1TS U1385 ( .AN(Shift_amount_SHT1_EWR[0]), .B(Shift_reg_FLAGS_7[1]), 
        .Y(n1188) );
  CLKBUFX2TS U1386 ( .A(n1188), .Y(n1213) );
  BUFX4TS U1387 ( .A(n1213), .Y(n1287) );
  AOI22X1TS U1388 ( .A0(Raw_mant_NRM_SWR[24]), .A1(n902), .B0(n1287), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n1158) );
  NOR2XLTS U1389 ( .A(Raw_mant_NRM_SWR[23]), .B(Raw_mant_NRM_SWR[22]), .Y(
        n1142) );
  NOR2X1TS U1390 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[20]), .Y(
        n1140) );
  AOI32X1TS U1391 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n1140), .A2(n1139), .B0(
        Raw_mant_NRM_SWR[19]), .B1(n1140), .Y(n1141) );
  AOI211X1TS U1392 ( .A0(n1142), .A1(n1141), .B0(Raw_mant_NRM_SWR[25]), .C0(
        Raw_mant_NRM_SWR[24]), .Y(n1148) );
  OAI31X1TS U1393 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n1475), .A2(n1145), .B0(
        n1144), .Y(n1146) );
  NOR2X1TS U1394 ( .A(n1169), .B(n874), .Y(n1261) );
  AOI21X1TS U1395 ( .A0(Shift_amount_SHT1_EWR[1]), .A1(n874), .B0(n1261), .Y(
        n1151) );
  INVX2TS U1396 ( .A(n1304), .Y(n1219) );
  BUFX4TS U1397 ( .A(n1219), .Y(n1301) );
  NOR2X2TS U1398 ( .A(n1301), .B(n1151), .Y(n1298) );
  NOR2X4TS U1399 ( .A(n1152), .B(n874), .Y(n1288) );
  AOI22X1TS U1400 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n1288), .B0(n1213), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n1154) );
  AOI22X1TS U1401 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n901), .B0(n905), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n1153) );
  NAND2X1TS U1402 ( .A(n1154), .B(n1153), .Y(n1168) );
  AOI22X1TS U1403 ( .A0(n1219), .A1(Data_array_SWR[1]), .B0(n1298), .B1(n1168), 
        .Y(n1157) );
  INVX2TS U1404 ( .A(n1155), .Y(n1296) );
  NAND2X1TS U1405 ( .A(Raw_mant_NRM_SWR[23]), .B(n1296), .Y(n1156) );
  AOI22X1TS U1406 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n1288), .B0(n1213), .B1(
        n899), .Y(n1160) );
  AOI22X1TS U1407 ( .A0(Raw_mant_NRM_SWR[19]), .A1(n901), .B0(n905), .B1(n895), 
        .Y(n1159) );
  NAND2X1TS U1408 ( .A(n1160), .B(n1159), .Y(n1174) );
  AOI22X1TS U1409 ( .A0(n1219), .A1(Data_array_SWR[4]), .B0(n1298), .B1(n1174), 
        .Y(n1162) );
  NAND2X1TS U1410 ( .A(Raw_mant_NRM_SWR[20]), .B(n1296), .Y(n1161) );
  AOI22X1TS U1411 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n1288), .B0(n1213), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n1164) );
  AOI22X1TS U1412 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n901), .B0(n905), .B1(n899), 
        .Y(n1163) );
  NAND2X1TS U1413 ( .A(n1164), .B(n1163), .Y(n1177) );
  AOI22X1TS U1414 ( .A0(n1301), .A1(Data_array_SWR[5]), .B0(n1298), .B1(n1177), 
        .Y(n1166) );
  NAND2X1TS U1415 ( .A(Raw_mant_NRM_SWR[19]), .B(n1296), .Y(n1165) );
  AOI22X1TS U1416 ( .A0(n1219), .A1(Data_array_SWR[3]), .B0(n903), .B1(n1168), 
        .Y(n1172) );
  INVX2TS U1417 ( .A(n1288), .Y(n1211) );
  NAND2X1TS U1418 ( .A(Raw_mant_NRM_SWR[19]), .B(n1170), .Y(n1171) );
  AOI22X1TS U1419 ( .A0(n1219), .A1(Data_array_SWR[6]), .B0(n903), .B1(n1174), 
        .Y(n1176) );
  NAND2X1TS U1420 ( .A(Raw_mant_NRM_SWR[16]), .B(n1170), .Y(n1175) );
  AOI22X1TS U1421 ( .A0(n1219), .A1(Data_array_SWR[7]), .B0(n903), .B1(n1177), 
        .Y(n1179) );
  NAND2X1TS U1422 ( .A(Raw_mant_NRM_SWR[15]), .B(n1170), .Y(n1178) );
  AOI22X1TS U1423 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n1288), .B0(n1287), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n1181) );
  AOI22X1TS U1424 ( .A0(Raw_mant_NRM_SWR[23]), .A1(n901), .B0(n905), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n1180) );
  NAND2X1TS U1425 ( .A(n1181), .B(n1180), .Y(n1297) );
  AOI22X1TS U1426 ( .A0(n1301), .A1(Data_array_SWR[2]), .B0(n903), .B1(n1297), 
        .Y(n1183) );
  NAND2X1TS U1427 ( .A(Raw_mant_NRM_SWR[20]), .B(n1170), .Y(n1182) );
  AOI22X1TS U1428 ( .A0(n1219), .A1(Data_array_SWR[9]), .B0(
        Raw_mant_NRM_SWR[13]), .B1(n1170), .Y(n1186) );
  AOI22X1TS U1429 ( .A0(n905), .A1(DmP_mant_SHT1_SW[21]), .B0(n1188), .B1(
        DmP_mant_SHT1_SW[22]), .Y(n1189) );
  AOI21X1TS U1430 ( .A0(Raw_mant_NRM_SWR[2]), .A1(n902), .B0(n1190), .Y(n1283)
         );
  OAI22X1TS U1431 ( .A0(n1227), .A1(n904), .B0(n1551), .B1(n1155), .Y(n1191)
         );
  AOI21X1TS U1432 ( .A0(n1301), .A1(Data_array_SWR[21]), .B0(n1191), .Y(n1192)
         );
  AOI22X1TS U1433 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n1288), .B0(n1287), .B1(n896), .Y(n1193) );
  AOI21X1TS U1434 ( .A0(n906), .A1(DmP_mant_SHT1_SW[18]), .B0(n1194), .Y(n1205) );
  OAI22X1TS U1435 ( .A0(n1199), .A1(n904), .B0(n1482), .B1(n1155), .Y(n1195)
         );
  AOI21X1TS U1436 ( .A0(n1301), .A1(Data_array_SWR[18]), .B0(n1195), .Y(n1196)
         );
  AOI22X1TS U1437 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n1288), .B0(
        DmP_mant_SHT1_SW[15]), .B1(n1213), .Y(n1197) );
  AOI21X1TS U1438 ( .A0(DmP_mant_SHT1_SW[14]), .A1(n906), .B0(n1198), .Y(n1286) );
  INVX2TS U1439 ( .A(n1170), .Y(n1202) );
  OAI22X1TS U1440 ( .A0(n1199), .A1(n1167), .B0(n1482), .B1(n1202), .Y(n1200)
         );
  AOI21X1TS U1441 ( .A0(n1301), .A1(Data_array_SWR[16]), .B0(n1200), .Y(n1201)
         );
  OAI22X1TS U1442 ( .A0(n1214), .A1(n1167), .B0(n1504), .B1(n1202), .Y(n1203)
         );
  AOI21X1TS U1443 ( .A0(n1301), .A1(Data_array_SWR[20]), .B0(n1203), .Y(n1204)
         );
  AOI22X1TS U1444 ( .A0(n905), .A1(DmP_mant_SHT1_SW[8]), .B0(n1287), .B1(n897), 
        .Y(n1206) );
  AOI21X1TS U1445 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n902), .B0(n1207), .Y(n1294) );
  OAI22X1TS U1446 ( .A0(n1208), .A1(n904), .B0(n1474), .B1(n1155), .Y(n1209)
         );
  AOI21X1TS U1447 ( .A0(n1301), .A1(Data_array_SWR[8]), .B0(n1209), .Y(n1210)
         );
  OAI22X1TS U1448 ( .A0(n1558), .A1(n1290), .B0(n1478), .B1(n1211), .Y(n1212)
         );
  OAI22X1TS U1449 ( .A0(n1281), .A1(n1167), .B0(n1214), .B1(n904), .Y(n1215)
         );
  AOI21X1TS U1450 ( .A0(n1301), .A1(Data_array_SWR[22]), .B0(n1215), .Y(n1216)
         );
  AOI22X1TS U1451 ( .A0(n1301), .A1(Data_array_SWR[15]), .B0(
        Raw_mant_NRM_SWR[7]), .B1(n1170), .Y(n1218) );
  OA22X1TS U1452 ( .A0(n1481), .A1(n1155), .B0(n1235), .B1(n1167), .Y(n1217)
         );
  AOI22X1TS U1453 ( .A0(n1219), .A1(Data_array_SWR[11]), .B0(
        Raw_mant_NRM_SWR[11]), .B1(n1170), .Y(n1221) );
  OA22X1TS U1454 ( .A0(n1497), .A1(n1155), .B0(n1226), .B1(n1167), .Y(n1220)
         );
  AOI22X1TS U1455 ( .A0(n1301), .A1(Data_array_SWR[13]), .B0(
        Raw_mant_NRM_SWR[9]), .B1(n1170), .Y(n1225) );
  OA22X1TS U1456 ( .A0(n1475), .A1(n1155), .B0(n1223), .B1(n1167), .Y(n1224)
         );
  AOI22X1TS U1457 ( .A0(n1301), .A1(Data_array_SWR[19]), .B0(
        Raw_mant_NRM_SWR[3]), .B1(n1170), .Y(n1229) );
  OA22X1TS U1458 ( .A0(n1512), .A1(n1155), .B0(n1227), .B1(n1167), .Y(n1228)
         );
  AOI22X1TS U1459 ( .A0(n1301), .A1(Data_array_SWR[17]), .B0(
        Raw_mant_NRM_SWR[5]), .B1(n1170), .Y(n1234) );
  OA22X1TS U1460 ( .A0(n1477), .A1(n1155), .B0(n1231), .B1(n1167), .Y(n1233)
         );
  INVX2TS U1461 ( .A(n1236), .Y(n1364) );
  NOR2XLTS U1462 ( .A(n1364), .B(SIGN_FLAG_SHT1SHT2), .Y(n1237) );
  OAI2BB2XLTS U1463 ( .B0(n1237), .B1(n1363), .A0N(n1423), .A1N(
        final_result_ieee[31]), .Y(n543) );
  AOI22X1TS U1464 ( .A0(DmP_mant_SFG_SWR[2]), .A1(n1359), .B0(n1358), .B1(n918), .Y(n1347) );
  NAND2X1TS U1465 ( .A(n1347), .B(DMP_SFG[0]), .Y(n1349) );
  INVX2TS U1466 ( .A(n1349), .Y(n1238) );
  AOI22X1TS U1467 ( .A0(DmP_mant_SFG_SWR[6]), .A1(n1358), .B0(n1359), .B1(n922), .Y(intadd_69_B_2_) );
  BUFX3TS U1468 ( .A(n1358), .Y(n1355) );
  AOI21X1TS U1469 ( .A0(intadd_69_A_3_), .A1(intadd_69_B_3_), .B0(
        intadd_69_B_2_), .Y(n1239) );
  AOI2BB2X1TS U1470 ( .B0(DMP_SFG[4]), .B1(n1239), .A0N(intadd_69_A_3_), .A1N(
        intadd_69_B_3_), .Y(n1240) );
  AOI222X1TS U1471 ( .A0(n1240), .A1(intadd_69_A_4_), .B0(n1240), .B1(
        intadd_69_B_4_), .C0(intadd_69_A_4_), .C1(intadd_69_B_4_), .Y(n1241)
         );
  INVX2TS U1472 ( .A(n1242), .Y(n1243) );
  NAND2X1TS U1473 ( .A(n1508), .B(n1243), .Y(DP_OP_15J60_123_4652_n8) );
  MX2X1TS U1474 ( .A(DMP_exp_NRM2_EW[7]), .B(DMP_exp_NRM_EW[7]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n611) );
  MX2X1TS U1475 ( .A(DMP_exp_NRM2_EW[6]), .B(DMP_exp_NRM_EW[6]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n616) );
  MX2X1TS U1476 ( .A(DMP_exp_NRM2_EW[5]), .B(DMP_exp_NRM_EW[5]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n621) );
  MX2X1TS U1477 ( .A(DMP_exp_NRM2_EW[4]), .B(DMP_exp_NRM_EW[4]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n626) );
  MX2X1TS U1478 ( .A(DMP_exp_NRM2_EW[3]), .B(DMP_exp_NRM_EW[3]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n631) );
  MX2X1TS U1479 ( .A(DMP_exp_NRM2_EW[2]), .B(DMP_exp_NRM_EW[2]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n636) );
  MX2X1TS U1480 ( .A(DMP_exp_NRM2_EW[1]), .B(DMP_exp_NRM_EW[1]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n641) );
  MX2X1TS U1481 ( .A(DMP_exp_NRM2_EW[0]), .B(DMP_exp_NRM_EW[0]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n646) );
  OAI2BB1X1TS U1482 ( .A0N(LZD_output_NRM2_EW[4]), .A1N(n874), .B0(n1244), .Y(
        n512) );
  OAI32X1TS U1483 ( .A0(n874), .A1(Raw_mant_NRM_SWR[14]), .A2(n1246), .B0(
        n1245), .B1(n874), .Y(n1250) );
  AO21XLTS U1484 ( .A0(n1475), .A1(n1497), .B0(n1247), .Y(n1255) );
  AOI21X1TS U1485 ( .A0(n1252), .A1(Raw_mant_NRM_SWR[10]), .B0(n1251), .Y(
        n1306) );
  AOI2BB1XLTS U1486 ( .A0N(Shift_reg_FLAGS_7[1]), .A1N(LZD_output_NRM2_EW[3]), 
        .B0(n1306), .Y(n516) );
  AOI22X1TS U1487 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n1254), .B0(n1253), .B1(
        Raw_mant_NRM_SWR[5]), .Y(n1256) );
  OAI21X1TS U1488 ( .A0(n1260), .A1(n1259), .B0(Shift_reg_FLAGS_7[1]), .Y(
        n1302) );
  OAI2BB1X1TS U1489 ( .A0N(LZD_output_NRM2_EW[2]), .A1N(n874), .B0(n1302), .Y(
        n514) );
  AO21XLTS U1490 ( .A0(LZD_output_NRM2_EW[1]), .A1(n874), .B0(n1261), .Y(n513)
         );
  AO21XLTS U1491 ( .A0(LZD_output_NRM2_EW[0]), .A1(n874), .B0(n1288), .Y(n515)
         );
  OA22X1TS U1492 ( .A0(n1263), .A1(n1262), .B0(Shift_reg_FLAGS_7[0]), .B1(
        final_result_ieee[29]), .Y(n755) );
  OA21XLTS U1493 ( .A0(Shift_reg_FLAGS_7[0]), .A1(overflow_flag), .B0(n1363), 
        .Y(n558) );
  INVX2TS U1494 ( .A(n1267), .Y(n1265) );
  AOI22X1TS U1495 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n1265), .B1(n1489), .Y(
        inst_FSM_INPUT_ENABLE_state_next_1_) );
  NAND2X1TS U1496 ( .A(n1265), .B(n1264), .Y(n871) );
  NOR2XLTS U1497 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .Y(n1266) );
  AOI32X4TS U1498 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B0(n1266), .B1(n1525), .Y(n1270)
         );
  INVX2TS U1499 ( .A(n1270), .Y(n1269) );
  AOI22X1TS U1500 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n1267), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B1(n1489), .Y(n1271) );
  AO22XLTS U1501 ( .A0(n1269), .A1(Shift_reg_FLAGS_7_6), .B0(n1270), .B1(n1271), .Y(n869) );
  AOI22X1TS U1502 ( .A0(n1270), .A1(n1268), .B0(n1332), .B1(n1269), .Y(n868)
         );
  AOI22X1TS U1503 ( .A0(n1270), .A1(n1332), .B0(n1570), .B1(n1269), .Y(n867)
         );
  INVX4TS U1504 ( .A(n1602), .Y(n1354) );
  AOI22X1TS U1505 ( .A0(n1270), .A1(n1602), .B0(n874), .B1(n1269), .Y(n864) );
  AOI22X1TS U1506 ( .A0(n1270), .A1(n874), .B0(n1423), .B1(n1269), .Y(n863) );
  BUFX4TS U1507 ( .A(n1275), .Y(n1276) );
  BUFX3TS U1508 ( .A(n1275), .Y(n1277) );
  BUFX3TS U1509 ( .A(n1275), .Y(n1274) );
  AO22XLTS U1510 ( .A0(n1274), .A1(Data_X[2]), .B0(n875), .B1(intDX_EWSW[2]), 
        .Y(n860) );
  BUFX3TS U1511 ( .A(n1275), .Y(n1280) );
  AO22XLTS U1512 ( .A0(n1280), .A1(Data_X[3]), .B0(n875), .B1(intDX_EWSW[3]), 
        .Y(n859) );
  AO22XLTS U1513 ( .A0(n1277), .A1(Data_X[4]), .B0(n1279), .B1(intDX_EWSW[4]), 
        .Y(n858) );
  AO22XLTS U1514 ( .A0(n1276), .A1(Data_X[5]), .B0(n875), .B1(intDX_EWSW[5]), 
        .Y(n857) );
  AO22XLTS U1515 ( .A0(n1276), .A1(Data_X[6]), .B0(n875), .B1(intDX_EWSW[6]), 
        .Y(n856) );
  AO22XLTS U1516 ( .A0(n1275), .A1(Data_X[7]), .B0(n1279), .B1(intDX_EWSW[7]), 
        .Y(n855) );
  AO22XLTS U1517 ( .A0(n1280), .A1(Data_X[8]), .B0(n875), .B1(intDX_EWSW[8]), 
        .Y(n854) );
  AO22XLTS U1518 ( .A0(n1280), .A1(Data_X[9]), .B0(n875), .B1(intDX_EWSW[9]), 
        .Y(n853) );
  AO22XLTS U1519 ( .A0(n1280), .A1(Data_X[11]), .B0(n1279), .B1(intDX_EWSW[11]), .Y(n851) );
  AO22XLTS U1520 ( .A0(n1276), .A1(Data_X[12]), .B0(n875), .B1(intDX_EWSW[12]), 
        .Y(n850) );
  AO22XLTS U1521 ( .A0(n1277), .A1(Data_X[13]), .B0(n875), .B1(intDX_EWSW[13]), 
        .Y(n849) );
  AO22XLTS U1522 ( .A0(n1275), .A1(Data_X[14]), .B0(n1279), .B1(intDX_EWSW[14]), .Y(n848) );
  INVX2TS U1523 ( .A(n1277), .Y(n1279) );
  AO22XLTS U1524 ( .A0(n1276), .A1(Data_X[15]), .B0(n1279), .B1(intDX_EWSW[15]), .Y(n847) );
  AO22XLTS U1525 ( .A0(n1274), .A1(Data_X[16]), .B0(n875), .B1(intDX_EWSW[16]), 
        .Y(n846) );
  AO22XLTS U1526 ( .A0(n1276), .A1(Data_X[17]), .B0(n875), .B1(intDX_EWSW[17]), 
        .Y(n845) );
  AO22XLTS U1527 ( .A0(n1275), .A1(Data_X[20]), .B0(n1279), .B1(intDX_EWSW[20]), .Y(n842) );
  AO22XLTS U1528 ( .A0(n1277), .A1(Data_X[21]), .B0(n875), .B1(intDX_EWSW[21]), 
        .Y(n841) );
  AO22XLTS U1529 ( .A0(n1277), .A1(Data_X[22]), .B0(n875), .B1(intDX_EWSW[22]), 
        .Y(n840) );
  AO22XLTS U1530 ( .A0(n1274), .A1(Data_X[23]), .B0(n1279), .B1(intDX_EWSW[23]), .Y(n839) );
  INVX2TS U1531 ( .A(n1275), .Y(n1272) );
  AO22XLTS U1532 ( .A0(n1272), .A1(intDX_EWSW[24]), .B0(n1275), .B1(Data_X[24]), .Y(n838) );
  AO22XLTS U1533 ( .A0(n1272), .A1(intDX_EWSW[25]), .B0(n1280), .B1(Data_X[25]), .Y(n837) );
  AO22XLTS U1534 ( .A0(n1272), .A1(intDX_EWSW[26]), .B0(n1275), .B1(Data_X[26]), .Y(n836) );
  AO22XLTS U1535 ( .A0(n1280), .A1(Data_X[28]), .B0(n875), .B1(intDX_EWSW[28]), 
        .Y(n834) );
  AO22XLTS U1536 ( .A0(n1276), .A1(add_subt), .B0(n1272), .B1(intAS), .Y(n830)
         );
  AO22XLTS U1537 ( .A0(n1272), .A1(intDY_EWSW[0]), .B0(n1280), .B1(Data_Y[0]), 
        .Y(n828) );
  AO22XLTS U1538 ( .A0(n1272), .A1(intDY_EWSW[1]), .B0(n1274), .B1(Data_Y[1]), 
        .Y(n827) );
  AO22XLTS U1539 ( .A0(n1272), .A1(intDY_EWSW[2]), .B0(n1274), .B1(Data_Y[2]), 
        .Y(n826) );
  AO22XLTS U1540 ( .A0(n1272), .A1(intDY_EWSW[3]), .B0(n1274), .B1(Data_Y[3]), 
        .Y(n825) );
  AO22XLTS U1541 ( .A0(n1273), .A1(intDY_EWSW[4]), .B0(n1274), .B1(Data_Y[4]), 
        .Y(n824) );
  AO22XLTS U1542 ( .A0(n1278), .A1(intDY_EWSW[5]), .B0(n1274), .B1(Data_Y[5]), 
        .Y(n823) );
  INVX2TS U1543 ( .A(n1275), .Y(n1273) );
  AO22XLTS U1544 ( .A0(n1278), .A1(intDY_EWSW[6]), .B0(n1274), .B1(Data_Y[6]), 
        .Y(n822) );
  AO22XLTS U1545 ( .A0(n1273), .A1(intDY_EWSW[7]), .B0(n1274), .B1(Data_Y[7]), 
        .Y(n821) );
  AO22XLTS U1546 ( .A0(n1278), .A1(intDY_EWSW[8]), .B0(n1274), .B1(Data_Y[8]), 
        .Y(n820) );
  AO22XLTS U1547 ( .A0(n1273), .A1(intDY_EWSW[9]), .B0(n1275), .B1(Data_Y[9]), 
        .Y(n819) );
  AO22XLTS U1548 ( .A0(n1278), .A1(intDY_EWSW[10]), .B0(n1276), .B1(Data_Y[10]), .Y(n818) );
  AO22XLTS U1549 ( .A0(n1273), .A1(intDY_EWSW[11]), .B0(n1277), .B1(Data_Y[11]), .Y(n817) );
  AO22XLTS U1550 ( .A0(n1278), .A1(intDY_EWSW[12]), .B0(n1276), .B1(Data_Y[12]), .Y(n816) );
  AO22XLTS U1551 ( .A0(n1278), .A1(intDY_EWSW[13]), .B0(n1276), .B1(Data_Y[13]), .Y(n815) );
  AO22XLTS U1552 ( .A0(n1273), .A1(intDY_EWSW[14]), .B0(n1276), .B1(Data_Y[14]), .Y(n814) );
  AO22XLTS U1553 ( .A0(n1278), .A1(intDY_EWSW[15]), .B0(n1276), .B1(Data_Y[15]), .Y(n813) );
  AO22XLTS U1554 ( .A0(n1278), .A1(intDY_EWSW[16]), .B0(n1276), .B1(Data_Y[16]), .Y(n812) );
  AO22XLTS U1555 ( .A0(n1273), .A1(intDY_EWSW[17]), .B0(n1276), .B1(Data_Y[17]), .Y(n811) );
  AO22XLTS U1556 ( .A0(n1278), .A1(intDY_EWSW[18]), .B0(n1276), .B1(Data_Y[18]), .Y(n810) );
  AO22XLTS U1557 ( .A0(n1278), .A1(intDY_EWSW[19]), .B0(n1276), .B1(Data_Y[19]), .Y(n809) );
  AO22XLTS U1558 ( .A0(n1273), .A1(intDY_EWSW[20]), .B0(n1276), .B1(Data_Y[20]), .Y(n808) );
  AO22XLTS U1559 ( .A0(n1278), .A1(intDY_EWSW[21]), .B0(n1276), .B1(Data_Y[21]), .Y(n807) );
  AO22XLTS U1560 ( .A0(n1278), .A1(intDY_EWSW[22]), .B0(n1280), .B1(Data_Y[22]), .Y(n806) );
  AO22XLTS U1561 ( .A0(n1273), .A1(intDY_EWSW[23]), .B0(n1280), .B1(Data_Y[23]), .Y(n805) );
  AO22XLTS U1562 ( .A0(n1273), .A1(intDY_EWSW[24]), .B0(n1280), .B1(Data_Y[24]), .Y(n804) );
  AO22XLTS U1563 ( .A0(n1278), .A1(intDY_EWSW[25]), .B0(n1275), .B1(Data_Y[25]), .Y(n803) );
  AO22XLTS U1564 ( .A0(n1278), .A1(intDY_EWSW[26]), .B0(n1274), .B1(Data_Y[26]), .Y(n802) );
  AO22XLTS U1565 ( .A0(n1278), .A1(intDY_EWSW[27]), .B0(n1275), .B1(Data_Y[27]), .Y(n801) );
  AO22XLTS U1566 ( .A0(n1278), .A1(intDY_EWSW[28]), .B0(n1275), .B1(Data_Y[28]), .Y(n800) );
  AO22XLTS U1567 ( .A0(n1273), .A1(intDY_EWSW[29]), .B0(n1276), .B1(Data_Y[29]), .Y(n799) );
  AO22XLTS U1568 ( .A0(n1278), .A1(intDY_EWSW[30]), .B0(n1277), .B1(Data_Y[30]), .Y(n798) );
  AOI21X1TS U1569 ( .A0(n902), .A1(Raw_mant_NRM_SWR[0]), .B0(n906), .Y(n1282)
         );
  OAI2BB2XLTS U1570 ( .B0(n1282), .B1(n1150), .A0N(n1301), .A1N(
        Data_array_SWR[25]), .Y(n796) );
  OAI2BB2XLTS U1571 ( .B0(n1281), .B1(n1150), .A0N(n1301), .A1N(
        Data_array_SWR[24]), .Y(n795) );
  OAI222X1TS U1572 ( .A0(n1559), .A1(n1304), .B0(n1150), .B1(n1283), .C0(n1167), .C1(n1282), .Y(n794) );
  AOI22X1TS U1573 ( .A0(Raw_mant_NRM_SWR[10]), .A1(n1288), .B0(n1287), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n1284) );
  AOI21X1TS U1574 ( .A0(n906), .A1(DmP_mant_SHT1_SW[12]), .B0(n1285), .Y(n1292) );
  OAI222X1TS U1575 ( .A0(n1304), .A1(n1561), .B0(n1150), .B1(n1292), .C0(n1167), .C1(n1286), .Y(n785) );
  AOI22X1TS U1576 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n1288), .B0(n1287), .B1(
        n898), .Y(n1289) );
  AOI21X1TS U1577 ( .A0(n906), .A1(DmP_mant_SHT1_SW[10]), .B0(n1291), .Y(n1293) );
  OAI222X1TS U1578 ( .A0(n1560), .A1(n1304), .B0(n1150), .B1(n1293), .C0(n1167), .C1(n1292), .Y(n783) );
  OAI222X1TS U1579 ( .A0(n1567), .A1(n1304), .B0(n1150), .B1(n1294), .C0(n1167), .C1(n1293), .Y(n781) );
  AOI22X1TS U1580 ( .A0(n1301), .A1(Data_array_SWR[0]), .B0(
        Raw_mant_NRM_SWR[24]), .B1(n1296), .Y(n1300) );
  AOI22X1TS U1581 ( .A0(Raw_mant_NRM_SWR[25]), .A1(n902), .B0(n1298), .B1(
        n1297), .Y(n1299) );
  NAND2X1TS U1582 ( .A(n1300), .B(n1299), .Y(n771) );
  NAND2X1TS U1583 ( .A(n1303), .B(n1302), .Y(n770) );
  AOI21X1TS U1584 ( .A0(n873), .A1(Shift_amount_SHT1_EWR[3]), .B0(
        Shift_reg_FLAGS_7[1]), .Y(n1305) );
  OAI22X1TS U1585 ( .A0(n1306), .A1(n1305), .B0(n1304), .B1(n1505), .Y(n769)
         );
  INVX4TS U1586 ( .A(n1332), .Y(n1339) );
  AOI21X1TS U1587 ( .A0(DMP_EXP_EWSW[23]), .A1(n908), .B0(n1311), .Y(n1307) );
  INVX4TS U1588 ( .A(n1332), .Y(n1341) );
  AOI2BB2XLTS U1589 ( .B0(n1339), .B1(n1307), .A0N(Shift_amount_SHT1_EWR[0]), 
        .A1N(n1341), .Y(n766) );
  NOR2X1TS U1590 ( .A(n1495), .B(DMP_EXP_EWSW[24]), .Y(n1310) );
  AOI21X1TS U1591 ( .A0(DMP_EXP_EWSW[24]), .A1(n1495), .B0(n1310), .Y(n1308)
         );
  XNOR2X1TS U1592 ( .A(n1311), .B(n1308), .Y(n1309) );
  AO22XLTS U1593 ( .A0(n1341), .A1(n1309), .B0(n1332), .B1(
        Shift_amount_SHT1_EWR[1]), .Y(n765) );
  INVX4TS U1594 ( .A(n1332), .Y(n1329) );
  OAI22X1TS U1595 ( .A0(n1311), .A1(n1310), .B0(DmP_EXP_EWSW[24]), .B1(n1496), 
        .Y(n1314) );
  NAND2X1TS U1596 ( .A(DmP_EXP_EWSW[25]), .B(n1550), .Y(n1315) );
  OAI21XLTS U1597 ( .A0(DmP_EXP_EWSW[25]), .A1(n1550), .B0(n1315), .Y(n1312)
         );
  XNOR2X1TS U1598 ( .A(n1314), .B(n1312), .Y(n1313) );
  AO22XLTS U1599 ( .A0(n1329), .A1(n1313), .B0(n1568), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n764) );
  AOI22X1TS U1600 ( .A0(DMP_EXP_EWSW[25]), .A1(n1563), .B0(n1315), .B1(n1314), 
        .Y(n1318) );
  NOR2X1TS U1601 ( .A(n1498), .B(DMP_EXP_EWSW[26]), .Y(n1319) );
  AOI21X1TS U1602 ( .A0(DMP_EXP_EWSW[26]), .A1(n1498), .B0(n1319), .Y(n1316)
         );
  XNOR2X1TS U1603 ( .A(n1318), .B(n1316), .Y(n1317) );
  AO22XLTS U1604 ( .A0(n1341), .A1(n1317), .B0(n1568), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n763) );
  OAI22X1TS U1605 ( .A0(n1319), .A1(n1318), .B0(DmP_EXP_EWSW[26]), .B1(n1500), 
        .Y(n1321) );
  XNOR2X1TS U1606 ( .A(DmP_EXP_EWSW[27]), .B(n900), .Y(n1320) );
  XOR2XLTS U1607 ( .A(n1321), .B(n1320), .Y(n1322) );
  BUFX3TS U1608 ( .A(n1568), .Y(n1331) );
  AO22XLTS U1609 ( .A0(n1329), .A1(n1322), .B0(n1331), .B1(
        Shift_amount_SHT1_EWR[4]), .Y(n762) );
  OAI222X1TS U1610 ( .A0(n1334), .A1(n1562), .B0(n1496), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1480), .C1(n1336), .Y(n729) );
  OAI222X1TS U1611 ( .A0(n1334), .A1(n1499), .B0(n1550), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1606), .C1(n1336), .Y(n728) );
  OAI222X1TS U1612 ( .A0(n1334), .A1(n1566), .B0(n1500), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1541), .C1(n1336), .Y(n727) );
  OAI21XLTS U1613 ( .A0(n1324), .A1(intDX_EWSW[31]), .B0(Shift_reg_FLAGS_7_6), 
        .Y(n1323) );
  AOI21X1TS U1614 ( .A0(n1324), .A1(intDX_EWSW[31]), .B0(n1323), .Y(n1326) );
  AO21XLTS U1615 ( .A0(OP_FLAG_EXP), .A1(n1325), .B0(n1326), .Y(n722) );
  AO22XLTS U1616 ( .A0(n1327), .A1(n1326), .B0(ZERO_FLAG_EXP), .B1(n1325), .Y(
        n721) );
  AO22XLTS U1617 ( .A0(n1329), .A1(DMP_EXP_EWSW[0]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[0]), .Y(n719) );
  AO22XLTS U1618 ( .A0(busy), .A1(DMP_SHT1_EWSW[0]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[0]), .Y(n718) );
  BUFX4TS U1619 ( .A(n1328), .Y(n1456) );
  AO22XLTS U1620 ( .A0(n1341), .A1(DMP_EXP_EWSW[1]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[1]), .Y(n716) );
  AO22XLTS U1621 ( .A0(busy), .A1(DMP_SHT1_EWSW[1]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[1]), .Y(n715) );
  AO22XLTS U1622 ( .A0(n1329), .A1(DMP_EXP_EWSW[2]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[2]), .Y(n713) );
  AO22XLTS U1623 ( .A0(busy), .A1(DMP_SHT1_EWSW[2]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[2]), .Y(n712) );
  AO22XLTS U1624 ( .A0(n1459), .A1(DMP_SFG[2]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[2]), .Y(n711) );
  AO22XLTS U1625 ( .A0(n1329), .A1(DMP_EXP_EWSW[3]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[3]), .Y(n710) );
  AO22XLTS U1626 ( .A0(busy), .A1(DMP_SHT1_EWSW[3]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[3]), .Y(n709) );
  AO22XLTS U1627 ( .A0(n1459), .A1(DMP_SFG[3]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[3]), .Y(n708) );
  AO22XLTS U1628 ( .A0(n1329), .A1(DMP_EXP_EWSW[4]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[4]), .Y(n707) );
  AO22XLTS U1629 ( .A0(busy), .A1(DMP_SHT1_EWSW[4]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[4]), .Y(n706) );
  AO22XLTS U1630 ( .A0(n1459), .A1(DMP_SFG[4]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[4]), .Y(n705) );
  AO22XLTS U1631 ( .A0(n1329), .A1(DMP_EXP_EWSW[5]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[5]), .Y(n704) );
  AO22XLTS U1632 ( .A0(busy), .A1(DMP_SHT1_EWSW[5]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[5]), .Y(n703) );
  AO22XLTS U1633 ( .A0(n1469), .A1(DMP_SFG[5]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[5]), .Y(n702) );
  AO22XLTS U1634 ( .A0(n1329), .A1(DMP_EXP_EWSW[6]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[6]), .Y(n701) );
  AO22XLTS U1635 ( .A0(busy), .A1(DMP_SHT1_EWSW[6]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[6]), .Y(n700) );
  AO22XLTS U1636 ( .A0(n1469), .A1(DMP_SFG[6]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[6]), .Y(n699) );
  AO22XLTS U1637 ( .A0(n1329), .A1(DMP_EXP_EWSW[7]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[7]), .Y(n698) );
  AO22XLTS U1638 ( .A0(busy), .A1(DMP_SHT1_EWSW[7]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[7]), .Y(n697) );
  AO22XLTS U1639 ( .A0(n1329), .A1(DMP_EXP_EWSW[8]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[8]), .Y(n695) );
  AO22XLTS U1640 ( .A0(busy), .A1(DMP_SHT1_EWSW[8]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[8]), .Y(n694) );
  AO22XLTS U1641 ( .A0(n1459), .A1(DMP_SFG[8]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[8]), .Y(n693) );
  AO22XLTS U1642 ( .A0(n1329), .A1(DMP_EXP_EWSW[9]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[9]), .Y(n692) );
  AO22XLTS U1643 ( .A0(busy), .A1(DMP_SHT1_EWSW[9]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[9]), .Y(n691) );
  AO22XLTS U1644 ( .A0(n1459), .A1(DMP_SFG[9]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[9]), .Y(n690) );
  AO22XLTS U1645 ( .A0(n1329), .A1(DMP_EXP_EWSW[10]), .B0(n1331), .B1(
        DMP_SHT1_EWSW[10]), .Y(n689) );
  BUFX4TS U1646 ( .A(n1570), .Y(n1338) );
  AO22XLTS U1647 ( .A0(n873), .A1(DMP_SHT1_EWSW[10]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[10]), .Y(n688) );
  AO22XLTS U1648 ( .A0(n1459), .A1(DMP_SFG[10]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[10]), .Y(n687) );
  BUFX4TS U1649 ( .A(n1568), .Y(n1333) );
  AO22XLTS U1650 ( .A0(n1329), .A1(DMP_EXP_EWSW[11]), .B0(n1333), .B1(
        DMP_SHT1_EWSW[11]), .Y(n686) );
  AO22XLTS U1651 ( .A0(n873), .A1(DMP_SHT1_EWSW[11]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[11]), .Y(n685) );
  AO22XLTS U1652 ( .A0(n1459), .A1(DMP_SFG[11]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[11]), .Y(n684) );
  AO22XLTS U1653 ( .A0(n1329), .A1(DMP_EXP_EWSW[12]), .B0(n1568), .B1(
        DMP_SHT1_EWSW[12]), .Y(n683) );
  AO22XLTS U1654 ( .A0(n873), .A1(DMP_SHT1_EWSW[12]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[12]), .Y(n682) );
  AO22XLTS U1655 ( .A0(n1459), .A1(DMP_SFG[12]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[12]), .Y(n681) );
  BUFX3TS U1656 ( .A(n1568), .Y(n1340) );
  AO22XLTS U1657 ( .A0(n1329), .A1(DMP_EXP_EWSW[13]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[13]), .Y(n680) );
  AO22XLTS U1658 ( .A0(n873), .A1(DMP_SHT1_EWSW[13]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[13]), .Y(n679) );
  AO22XLTS U1659 ( .A0(n1459), .A1(DMP_SFG[13]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[13]), .Y(n678) );
  AO22XLTS U1660 ( .A0(n1329), .A1(DMP_EXP_EWSW[14]), .B0(n1333), .B1(
        DMP_SHT1_EWSW[14]), .Y(n677) );
  AO22XLTS U1661 ( .A0(n873), .A1(DMP_SHT1_EWSW[14]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[14]), .Y(n676) );
  AO22XLTS U1662 ( .A0(n1459), .A1(DMP_SFG[14]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[14]), .Y(n675) );
  AO22XLTS U1663 ( .A0(n1329), .A1(DMP_EXP_EWSW[15]), .B0(n1568), .B1(
        DMP_SHT1_EWSW[15]), .Y(n674) );
  AO22XLTS U1664 ( .A0(n873), .A1(DMP_SHT1_EWSW[15]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[15]), .Y(n673) );
  AO22XLTS U1665 ( .A0(n1459), .A1(DMP_SFG[15]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[15]), .Y(n672) );
  AO22XLTS U1666 ( .A0(n1329), .A1(DMP_EXP_EWSW[16]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[16]), .Y(n671) );
  AO22XLTS U1667 ( .A0(busy), .A1(DMP_SHT1_EWSW[16]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[16]), .Y(n670) );
  AO22XLTS U1668 ( .A0(n1469), .A1(DMP_SFG[16]), .B0(n1453), .B1(
        DMP_SHT2_EWSW[16]), .Y(n669) );
  AO22XLTS U1669 ( .A0(n1341), .A1(DMP_EXP_EWSW[17]), .B0(n1333), .B1(
        DMP_SHT1_EWSW[17]), .Y(n668) );
  AO22XLTS U1670 ( .A0(busy), .A1(DMP_SHT1_EWSW[17]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[17]), .Y(n667) );
  AO22XLTS U1671 ( .A0(n1459), .A1(DMP_SFG[17]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[17]), .Y(n666) );
  AO22XLTS U1672 ( .A0(n1341), .A1(DMP_EXP_EWSW[18]), .B0(n1332), .B1(
        DMP_SHT1_EWSW[18]), .Y(n665) );
  AO22XLTS U1673 ( .A0(busy), .A1(DMP_SHT1_EWSW[18]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[18]), .Y(n664) );
  AO22XLTS U1674 ( .A0(n1459), .A1(DMP_SFG[18]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[18]), .Y(n663) );
  AO22XLTS U1675 ( .A0(n1341), .A1(DMP_EXP_EWSW[19]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[19]), .Y(n662) );
  AO22XLTS U1676 ( .A0(busy), .A1(DMP_SHT1_EWSW[19]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[19]), .Y(n661) );
  AO22XLTS U1677 ( .A0(n1459), .A1(DMP_SFG[19]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[19]), .Y(n660) );
  AO22XLTS U1678 ( .A0(n1341), .A1(DMP_EXP_EWSW[20]), .B0(n1333), .B1(
        DMP_SHT1_EWSW[20]), .Y(n659) );
  AO22XLTS U1679 ( .A0(busy), .A1(DMP_SHT1_EWSW[20]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[20]), .Y(n658) );
  AO22XLTS U1680 ( .A0(n1459), .A1(DMP_SFG[20]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[20]), .Y(n657) );
  AO22XLTS U1681 ( .A0(n1341), .A1(DMP_EXP_EWSW[21]), .B0(n1332), .B1(
        DMP_SHT1_EWSW[21]), .Y(n656) );
  AO22XLTS U1682 ( .A0(busy), .A1(DMP_SHT1_EWSW[21]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[21]), .Y(n655) );
  AO22XLTS U1683 ( .A0(n1459), .A1(DMP_SFG[21]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[21]), .Y(n654) );
  AO22XLTS U1684 ( .A0(n1341), .A1(DMP_EXP_EWSW[22]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[22]), .Y(n653) );
  AO22XLTS U1685 ( .A0(busy), .A1(DMP_SHT1_EWSW[22]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[22]), .Y(n652) );
  AO22XLTS U1686 ( .A0(n1469), .A1(DMP_SFG[22]), .B0(n1455), .B1(
        DMP_SHT2_EWSW[22]), .Y(n651) );
  AO22XLTS U1687 ( .A0(n1341), .A1(DMP_EXP_EWSW[23]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[23]), .Y(n650) );
  AO22XLTS U1688 ( .A0(n873), .A1(DMP_SHT1_EWSW[23]), .B0(n1570), .B1(
        DMP_SHT2_EWSW[23]), .Y(n649) );
  AO22XLTS U1689 ( .A0(n1471), .A1(DMP_SHT2_EWSW[23]), .B0(n1459), .B1(
        DMP_SFG[23]), .Y(n648) );
  AO22XLTS U1690 ( .A0(n1354), .A1(DMP_SFG[23]), .B0(n1361), .B1(
        DMP_exp_NRM_EW[0]), .Y(n647) );
  AO22XLTS U1691 ( .A0(n1341), .A1(DMP_EXP_EWSW[24]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[24]), .Y(n645) );
  AO22XLTS U1692 ( .A0(n873), .A1(DMP_SHT1_EWSW[24]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[24]), .Y(n644) );
  AO22XLTS U1693 ( .A0(n1453), .A1(DMP_SHT2_EWSW[24]), .B0(n1469), .B1(
        DMP_SFG[24]), .Y(n643) );
  AO22XLTS U1694 ( .A0(n1354), .A1(DMP_SFG[24]), .B0(n1602), .B1(
        DMP_exp_NRM_EW[1]), .Y(n642) );
  AO22XLTS U1695 ( .A0(n1341), .A1(DMP_EXP_EWSW[25]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[25]), .Y(n640) );
  AO22XLTS U1696 ( .A0(n873), .A1(DMP_SHT1_EWSW[25]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[25]), .Y(n639) );
  AO22XLTS U1697 ( .A0(n1455), .A1(DMP_SHT2_EWSW[25]), .B0(n1456), .B1(
        DMP_SFG[25]), .Y(n638) );
  AO22XLTS U1698 ( .A0(n1354), .A1(DMP_SFG[25]), .B0(n1602), .B1(
        DMP_exp_NRM_EW[2]), .Y(n637) );
  AO22XLTS U1699 ( .A0(n1341), .A1(DMP_EXP_EWSW[26]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[26]), .Y(n635) );
  AO22XLTS U1700 ( .A0(n873), .A1(DMP_SHT1_EWSW[26]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[26]), .Y(n634) );
  AO22XLTS U1701 ( .A0(n1471), .A1(DMP_SHT2_EWSW[26]), .B0(n1459), .B1(
        DMP_SFG[26]), .Y(n633) );
  AO22XLTS U1702 ( .A0(n1354), .A1(DMP_SFG[26]), .B0(n1602), .B1(
        DMP_exp_NRM_EW[3]), .Y(n632) );
  AO22XLTS U1703 ( .A0(n1341), .A1(n900), .B0(n1340), .B1(DMP_SHT1_EWSW[27]), 
        .Y(n630) );
  AO22XLTS U1704 ( .A0(n873), .A1(DMP_SHT1_EWSW[27]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[27]), .Y(n629) );
  AO22XLTS U1705 ( .A0(n1455), .A1(DMP_SHT2_EWSW[27]), .B0(n1469), .B1(
        DMP_SFG[27]), .Y(n628) );
  AO22XLTS U1706 ( .A0(n1354), .A1(DMP_SFG[27]), .B0(n1602), .B1(
        DMP_exp_NRM_EW[4]), .Y(n627) );
  AO22XLTS U1707 ( .A0(n1341), .A1(DMP_EXP_EWSW[28]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[28]), .Y(n625) );
  AO22XLTS U1708 ( .A0(n873), .A1(DMP_SHT1_EWSW[28]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[28]), .Y(n624) );
  AO22XLTS U1709 ( .A0(n1455), .A1(DMP_SHT2_EWSW[28]), .B0(n1459), .B1(
        DMP_SFG[28]), .Y(n623) );
  AO22XLTS U1710 ( .A0(n1354), .A1(DMP_SFG[28]), .B0(n1602), .B1(
        DMP_exp_NRM_EW[5]), .Y(n622) );
  AO22XLTS U1711 ( .A0(n1341), .A1(DMP_EXP_EWSW[29]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[29]), .Y(n620) );
  AO22XLTS U1712 ( .A0(n873), .A1(DMP_SHT1_EWSW[29]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[29]), .Y(n619) );
  AO22XLTS U1713 ( .A0(n1455), .A1(DMP_SHT2_EWSW[29]), .B0(n1456), .B1(
        DMP_SFG[29]), .Y(n618) );
  BUFX4TS U1714 ( .A(n1602), .Y(n1361) );
  AO22XLTS U1715 ( .A0(n1354), .A1(DMP_SFG[29]), .B0(n1361), .B1(
        DMP_exp_NRM_EW[6]), .Y(n617) );
  AO22XLTS U1716 ( .A0(n1483), .A1(DMP_EXP_EWSW[30]), .B0(n1340), .B1(
        DMP_SHT1_EWSW[30]), .Y(n615) );
  AO22XLTS U1717 ( .A0(n873), .A1(DMP_SHT1_EWSW[30]), .B0(n1338), .B1(
        DMP_SHT2_EWSW[30]), .Y(n614) );
  AO22XLTS U1718 ( .A0(n1455), .A1(DMP_SHT2_EWSW[30]), .B0(n1469), .B1(
        DMP_SFG[30]), .Y(n613) );
  AO22XLTS U1719 ( .A0(n1354), .A1(DMP_SFG[30]), .B0(n1361), .B1(
        DMP_exp_NRM_EW[7]), .Y(n612) );
  AO22XLTS U1720 ( .A0(n1483), .A1(DmP_EXP_EWSW[3]), .B0(n1568), .B1(
        DmP_mant_SHT1_SW[3]), .Y(n603) );
  AO22XLTS U1721 ( .A0(n1483), .A1(DmP_EXP_EWSW[7]), .B0(n1332), .B1(
        DmP_mant_SHT1_SW[7]), .Y(n595) );
  AO22XLTS U1722 ( .A0(n1339), .A1(DmP_EXP_EWSW[10]), .B0(n1332), .B1(
        DmP_mant_SHT1_SW[10]), .Y(n589) );
  AO22XLTS U1723 ( .A0(n1339), .A1(DmP_EXP_EWSW[11]), .B0(n1332), .B1(n898), 
        .Y(n587) );
  OAI222X1TS U1724 ( .A0(n1336), .A1(n1562), .B0(n1495), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1480), .C1(n1334), .Y(n563) );
  OAI222X1TS U1725 ( .A0(n1336), .A1(n1499), .B0(n1563), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1606), .C1(n1334), .Y(n562) );
  OAI222X1TS U1726 ( .A0(n1336), .A1(n1566), .B0(n1498), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1541), .C1(n1334), .Y(n561) );
  NAND2X1TS U1727 ( .A(n1364), .B(Shift_reg_FLAGS_7[0]), .Y(n1337) );
  OAI2BB1X1TS U1728 ( .A0N(underflow_flag), .A1N(n872), .B0(n1337), .Y(n559)
         );
  AO22XLTS U1729 ( .A0(n1339), .A1(ZERO_FLAG_EXP), .B0(n1332), .B1(
        ZERO_FLAG_SHT1), .Y(n557) );
  AO22XLTS U1730 ( .A0(n873), .A1(ZERO_FLAG_SHT1), .B0(n1338), .B1(
        ZERO_FLAG_SHT2), .Y(n556) );
  AO22XLTS U1731 ( .A0(n1455), .A1(ZERO_FLAG_SHT2), .B0(n1456), .B1(
        ZERO_FLAG_SFG), .Y(n555) );
  AO22XLTS U1732 ( .A0(n1354), .A1(ZERO_FLAG_SFG), .B0(n1361), .B1(
        ZERO_FLAG_NRM), .Y(n554) );
  AO22XLTS U1733 ( .A0(Shift_reg_FLAGS_7[1]), .A1(ZERO_FLAG_NRM), .B0(n874), 
        .B1(ZERO_FLAG_SHT1SHT2), .Y(n553) );
  AO22XLTS U1734 ( .A0(Shift_reg_FLAGS_7[0]), .A1(ZERO_FLAG_SHT1SHT2), .B0(
        n872), .B1(zero_flag), .Y(n552) );
  AO22XLTS U1735 ( .A0(n1339), .A1(OP_FLAG_EXP), .B0(OP_FLAG_SHT1), .B1(n1568), 
        .Y(n551) );
  AO22XLTS U1736 ( .A0(n873), .A1(OP_FLAG_SHT1), .B0(n1570), .B1(OP_FLAG_SHT2), 
        .Y(n550) );
  AO22XLTS U1737 ( .A0(n1469), .A1(OP_FLAG_SFG), .B0(n1455), .B1(OP_FLAG_SHT2), 
        .Y(n549) );
  AO22XLTS U1738 ( .A0(n1341), .A1(SIGN_FLAG_EXP), .B0(n1340), .B1(
        SIGN_FLAG_SHT1), .Y(n548) );
  AO22XLTS U1739 ( .A0(n873), .A1(SIGN_FLAG_SHT1), .B0(n1570), .B1(
        SIGN_FLAG_SHT2), .Y(n547) );
  AO22XLTS U1740 ( .A0(n1455), .A1(SIGN_FLAG_SHT2), .B0(n1469), .B1(
        SIGN_FLAG_SFG), .Y(n546) );
  AO22XLTS U1741 ( .A0(n1354), .A1(SIGN_FLAG_SFG), .B0(n1602), .B1(
        SIGN_FLAG_NRM), .Y(n545) );
  AO22XLTS U1742 ( .A0(Shift_reg_FLAGS_7[1]), .A1(SIGN_FLAG_NRM), .B0(n874), 
        .B1(SIGN_FLAG_SHT1SHT2), .Y(n544) );
  AOI22X1TS U1743 ( .A0(DmP_mant_SFG_SWR[0]), .A1(n1355), .B0(n1359), .B1(n913), .Y(n1345) );
  AOI22X1TS U1744 ( .A0(n1357), .A1(n1345), .B0(n1478), .B1(n1361), .Y(n542)
         );
  AOI22X1TS U1745 ( .A0(DmP_mant_SFG_SWR[1]), .A1(n1355), .B0(n1359), .B1(n917), .Y(n1346) );
  AOI22X1TS U1746 ( .A0(n1357), .A1(n1346), .B0(n1558), .B1(n1361), .Y(n541)
         );
  OAI21XLTS U1747 ( .A0(n1347), .A1(DMP_SFG[0]), .B0(n1349), .Y(n1348) );
  AOI22X1TS U1748 ( .A0(n1357), .A1(n1348), .B0(n1504), .B1(n1361), .Y(n540)
         );
  XNOR2X1TS U1749 ( .A(DMP_SFG[1]), .B(n1349), .Y(n1350) );
  XNOR2X1TS U1750 ( .A(n1350), .B(n891), .Y(n1351) );
  AOI22X1TS U1751 ( .A0(n1357), .A1(n1351), .B0(n1551), .B1(n1361), .Y(n539)
         );
  AOI22X1TS U1752 ( .A0(DmP_mant_SFG_SWR[4]), .A1(n1358), .B0(n1359), .B1(n920), .Y(intadd_69_CI) );
  AOI2BB2XLTS U1753 ( .B0(n929), .B1(intadd_69_SUM_0_), .A0N(
        Raw_mant_NRM_SWR[4]), .A1N(n1354), .Y(n538) );
  AOI22X1TS U1754 ( .A0(DmP_mant_SFG_SWR[5]), .A1(n1355), .B0(n1359), .B1(n921), .Y(intadd_69_B_1_) );
  AOI22X1TS U1755 ( .A0(n929), .A1(intadd_69_SUM_1_), .B0(n1512), .B1(n1361), 
        .Y(n537) );
  AOI22X1TS U1756 ( .A0(n929), .A1(intadd_69_SUM_2_), .B0(n1482), .B1(n1361), 
        .Y(n536) );
  AOI22X1TS U1757 ( .A0(n1357), .A1(intadd_69_SUM_3_), .B0(n1477), .B1(n1361), 
        .Y(n535) );
  AOI22X1TS U1758 ( .A0(n1357), .A1(intadd_69_SUM_4_), .B0(n1479), .B1(n1361), 
        .Y(n534) );
  XNOR2X1TS U1759 ( .A(DMP_SFG[7]), .B(n892), .Y(n1352) );
  XNOR2X1TS U1760 ( .A(intadd_69_n1), .B(n1352), .Y(n1353) );
  AOI22X1TS U1761 ( .A0(n929), .A1(n1353), .B0(n1481), .B1(n1361), .Y(n533) );
  AOI22X1TS U1762 ( .A0(n929), .A1(intadd_68_SUM_0_), .B0(n1476), .B1(n1361), 
        .Y(n532) );
  AOI2BB2XLTS U1763 ( .B0(DmP_mant_SFG_SWR[11]), .B1(n1358), .A0N(n1358), 
        .A1N(DmP_mant_SFG_SWR[11]), .Y(intadd_68_B_1_) );
  AOI22X1TS U1764 ( .A0(n929), .A1(intadd_68_SUM_1_), .B0(n1475), .B1(n1361), 
        .Y(n531) );
  AOI2BB2XLTS U1765 ( .B0(DmP_mant_SFG_SWR[12]), .B1(n1358), .A0N(n930), .A1N(
        DmP_mant_SFG_SWR[12]), .Y(intadd_68_B_2_) );
  AOI2BB2XLTS U1766 ( .B0(n1354), .B1(intadd_68_SUM_2_), .A0N(
        Raw_mant_NRM_SWR[12]), .A1N(n1354), .Y(n530) );
  AOI2BB2XLTS U1767 ( .B0(DmP_mant_SFG_SWR[13]), .B1(n1358), .A0N(n930), .A1N(
        DmP_mant_SFG_SWR[13]), .Y(intadd_68_B_3_) );
  AOI22X1TS U1768 ( .A0(n1357), .A1(intadd_68_SUM_3_), .B0(n1497), .B1(n1361), 
        .Y(n529) );
  AOI2BB2XLTS U1769 ( .B0(DmP_mant_SFG_SWR[14]), .B1(n1358), .A0N(n1358), 
        .A1N(DmP_mant_SFG_SWR[14]), .Y(intadd_68_B_4_) );
  AOI22X1TS U1770 ( .A0(n1357), .A1(intadd_68_SUM_4_), .B0(n1486), .B1(n1361), 
        .Y(n528) );
  AOI2BB2XLTS U1771 ( .B0(DmP_mant_SFG_SWR[15]), .B1(n1358), .A0N(n930), .A1N(
        DmP_mant_SFG_SWR[15]), .Y(intadd_68_B_5_) );
  AOI22X1TS U1772 ( .A0(n1357), .A1(intadd_68_SUM_5_), .B0(n1485), .B1(n1361), 
        .Y(n527) );
  AOI22X1TS U1773 ( .A0(DmP_mant_SFG_SWR[16]), .A1(n1355), .B0(n1359), .B1(
        n927), .Y(intadd_68_B_6_) );
  AOI22X1TS U1774 ( .A0(n1357), .A1(intadd_68_SUM_6_), .B0(n1474), .B1(n1602), 
        .Y(n526) );
  AOI22X1TS U1775 ( .A0(DmP_mant_SFG_SWR[17]), .A1(n1355), .B0(n1359), .B1(
        n928), .Y(intadd_68_B_7_) );
  AOI22X1TS U1776 ( .A0(n1357), .A1(intadd_68_SUM_7_), .B0(n1502), .B1(n1602), 
        .Y(n525) );
  AOI22X1TS U1777 ( .A0(DmP_mant_SFG_SWR[18]), .A1(n1355), .B0(n1359), .B1(
        n924), .Y(intadd_68_B_8_) );
  AOI2BB2XLTS U1778 ( .B0(n929), .B1(intadd_68_SUM_8_), .A0N(
        Raw_mant_NRM_SWR[18]), .A1N(n1354), .Y(n524) );
  AOI22X1TS U1779 ( .A0(DmP_mant_SFG_SWR[19]), .A1(n1355), .B0(n1359), .B1(
        n909), .Y(intadd_68_B_9_) );
  AOI2BB2XLTS U1780 ( .B0(n1354), .B1(intadd_68_SUM_9_), .A0N(
        Raw_mant_NRM_SWR[19]), .A1N(n1354), .Y(n523) );
  AOI22X1TS U1781 ( .A0(DmP_mant_SFG_SWR[20]), .A1(n1355), .B0(n1359), .B1(
        n910), .Y(intadd_68_B_10_) );
  AOI2BB2XLTS U1782 ( .B0(n929), .B1(intadd_68_SUM_10_), .A0N(
        Raw_mant_NRM_SWR[20]), .A1N(n1354), .Y(n522) );
  AOI22X1TS U1783 ( .A0(DmP_mant_SFG_SWR[21]), .A1(n1355), .B0(n1359), .B1(
        n911), .Y(intadd_68_B_11_) );
  AOI22X1TS U1784 ( .A0(n1357), .A1(intadd_68_SUM_11_), .B0(n1506), .B1(n1602), 
        .Y(n521) );
  AOI22X1TS U1785 ( .A0(DmP_mant_SFG_SWR[22]), .A1(n1355), .B0(n1359), .B1(
        n912), .Y(intadd_68_B_12_) );
  AOI22X1TS U1786 ( .A0(n1357), .A1(intadd_68_SUM_12_), .B0(n1501), .B1(n1602), 
        .Y(n520) );
  AOI22X1TS U1787 ( .A0(DmP_mant_SFG_SWR[23]), .A1(n1355), .B0(n1359), .B1(
        n914), .Y(intadd_68_B_13_) );
  AOI22X1TS U1788 ( .A0(n1357), .A1(intadd_68_SUM_13_), .B0(n1472), .B1(n1602), 
        .Y(n519) );
  AOI22X1TS U1789 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n1355), .B0(n1359), .B1(
        n915), .Y(intadd_68_B_14_) );
  AOI22X1TS U1790 ( .A0(n1357), .A1(intadd_68_SUM_14_), .B0(n1473), .B1(n1602), 
        .Y(n518) );
  AOI22X1TS U1791 ( .A0(DmP_mant_SFG_SWR[25]), .A1(n1359), .B0(n1358), .B1(
        n916), .Y(n1360) );
  XNOR2X1TS U1792 ( .A(intadd_68_n1), .B(n1360), .Y(n1362) );
  AOI22X1TS U1793 ( .A0(n929), .A1(n1362), .B0(n1484), .B1(n1361), .Y(n517) );
  AND3X4TS U1794 ( .A(shift_value_SHT2_EWR[2]), .B(n1511), .C(
        shift_value_SHT2_EWR[3]), .Y(n1430) );
  NAND2X1TS U1795 ( .A(shift_value_SHT2_EWR[2]), .B(n1505), .Y(n1383) );
  NAND2X1TS U1796 ( .A(n1403), .B(n1511), .Y(n1414) );
  NOR2XLTS U1797 ( .A(n1437), .B(n1414), .Y(n1368) );
  AOI22X1TS U1798 ( .A0(Data_array_SWR[12]), .A1(n1367), .B0(
        Data_array_SWR[13]), .B1(n1438), .Y(n1369) );
  OAI221X1TS U1799 ( .A0(n1468), .A1(n1371), .B0(n1437), .B1(n1372), .C0(n1369), .Y(n1450) );
  AO22XLTS U1800 ( .A0(final_result_ieee[10]), .A1(n872), .B0(n1384), .B1(
        n1450), .Y(n511) );
  AOI22X1TS U1801 ( .A0(Data_array_SWR[12]), .A1(n1438), .B0(
        Data_array_SWR[13]), .B1(n1367), .Y(n1370) );
  OAI221X1TS U1802 ( .A0(n1468), .A1(n1372), .B0(n1437), .B1(n1371), .C0(n1370), .Y(n1451) );
  AO22XLTS U1803 ( .A0(n1384), .A1(n1451), .B0(final_result_ieee[11]), .B1(
        n872), .Y(n510) );
  AOI22X1TS U1804 ( .A0(Data_array_SWR[22]), .A1(n1429), .B0(
        Data_array_SWR[18]), .B1(n1366), .Y(n1376) );
  AOI22X1TS U1805 ( .A0(Data_array_SWR[14]), .A1(n1438), .B0(
        Data_array_SWR[11]), .B1(n1367), .Y(n1373) );
  OAI221X1TS U1806 ( .A0(n1468), .A1(n1375), .B0(n1437), .B1(n1376), .C0(n1373), .Y(n1449) );
  AO22XLTS U1807 ( .A0(n1384), .A1(n1449), .B0(final_result_ieee[9]), .B1(n872), .Y(n509) );
  AOI22X1TS U1808 ( .A0(Data_array_SWR[14]), .A1(n1367), .B0(
        Data_array_SWR[11]), .B1(n1438), .Y(n1374) );
  OAI221X1TS U1809 ( .A0(n1468), .A1(n1376), .B0(n1437), .B1(n1375), .C0(n1374), .Y(n1452) );
  AO22XLTS U1810 ( .A0(n1384), .A1(n1452), .B0(final_result_ieee[12]), .B1(
        n872), .Y(n508) );
  AOI22X1TS U1811 ( .A0(Data_array_SWR[23]), .A1(n1429), .B0(
        Data_array_SWR[19]), .B1(n1366), .Y(n1380) );
  AOI22X1TS U1812 ( .A0(Data_array_SWR[10]), .A1(n1367), .B0(
        Data_array_SWR[15]), .B1(n1438), .Y(n1377) );
  OAI221X1TS U1813 ( .A0(n1468), .A1(n1379), .B0(n1437), .B1(n1380), .C0(n1377), .Y(n1448) );
  AO22XLTS U1814 ( .A0(n1384), .A1(n1448), .B0(final_result_ieee[8]), .B1(n872), .Y(n507) );
  AOI22X1TS U1815 ( .A0(Data_array_SWR[10]), .A1(n1438), .B0(
        Data_array_SWR[15]), .B1(n1367), .Y(n1378) );
  OAI221X1TS U1816 ( .A0(n1468), .A1(n1380), .B0(n1437), .B1(n1379), .C0(n1378), .Y(n1454) );
  AO22XLTS U1817 ( .A0(n1384), .A1(n1454), .B0(final_result_ieee[13]), .B1(
        n872), .Y(n506) );
  AOI22X1TS U1818 ( .A0(Data_array_SWR[17]), .A1(n1429), .B0(
        Data_array_SWR[13]), .B1(n1366), .Y(n1382) );
  CLKAND2X2TS U1819 ( .A(n1403), .B(shift_value_SHT2_EWR[4]), .Y(n1396) );
  AOI22X1TS U1820 ( .A0(Data_array_SWR[21]), .A1(n1430), .B0(
        Data_array_SWR[25]), .B1(n1396), .Y(n1381) );
  NAND2X1TS U1821 ( .A(n1382), .B(n1381), .Y(n1386) );
  NOR2X1TS U1822 ( .A(shift_value_SHT2_EWR[2]), .B(n1505), .Y(n1389) );
  INVX2TS U1823 ( .A(n1383), .Y(n1404) );
  INVX2TS U1824 ( .A(n1434), .Y(n1385) );
  INVX4TS U1825 ( .A(n1384), .Y(n1428) );
  OAI2BB2XLTS U1826 ( .B0(n1447), .B1(n1428), .A0N(final_result_ieee[7]), 
        .A1N(n872), .Y(n505) );
  OAI2BB2XLTS U1827 ( .B0(n1457), .B1(n1428), .A0N(final_result_ieee[14]), 
        .A1N(n872), .Y(n504) );
  AOI22X1TS U1828 ( .A0(Data_array_SWR[12]), .A1(n1366), .B0(
        Data_array_SWR[16]), .B1(n1429), .Y(n1388) );
  AOI22X1TS U1829 ( .A0(Data_array_SWR[24]), .A1(n1396), .B0(
        Data_array_SWR[20]), .B1(n1430), .Y(n1387) );
  NAND2X1TS U1830 ( .A(n1388), .B(n1387), .Y(n1391) );
  INVX2TS U1831 ( .A(n1426), .Y(n1390) );
  OAI2BB2XLTS U1832 ( .B0(n1446), .B1(n1428), .A0N(final_result_ieee[6]), 
        .A1N(n872), .Y(n503) );
  OAI2BB2XLTS U1833 ( .B0(n1458), .B1(n1428), .A0N(final_result_ieee[15]), 
        .A1N(n872), .Y(n502) );
  AOI22X1TS U1834 ( .A0(Data_array_SWR[15]), .A1(n1429), .B0(
        Data_array_SWR[11]), .B1(n1366), .Y(n1393) );
  AOI22X1TS U1835 ( .A0(Data_array_SWR[23]), .A1(n1396), .B0(
        Data_array_SWR[19]), .B1(n1430), .Y(n1392) );
  NAND2X1TS U1836 ( .A(n1393), .B(n1392), .Y(n1395) );
  AOI22X1TS U1837 ( .A0(Data_array_SWR[22]), .A1(n1404), .B0(
        Data_array_SWR[18]), .B1(n1403), .Y(n1420) );
  INVX2TS U1838 ( .A(n1420), .Y(n1394) );
  OAI2BB2XLTS U1839 ( .B0(n1445), .B1(n1428), .A0N(final_result_ieee[5]), 
        .A1N(n872), .Y(n501) );
  OAI2BB2XLTS U1840 ( .B0(n1460), .B1(n1428), .A0N(final_result_ieee[16]), 
        .A1N(n872), .Y(n500) );
  AOI22X1TS U1841 ( .A0(Data_array_SWR[14]), .A1(n1429), .B0(
        Data_array_SWR[10]), .B1(n1366), .Y(n1398) );
  AOI22X1TS U1842 ( .A0(Data_array_SWR[22]), .A1(n1396), .B0(
        Data_array_SWR[18]), .B1(n1430), .Y(n1397) );
  NAND2X1TS U1843 ( .A(n1398), .B(n1397), .Y(n1400) );
  AOI22X1TS U1844 ( .A0(Data_array_SWR[23]), .A1(n1404), .B0(
        Data_array_SWR[19]), .B1(n1403), .Y(n1417) );
  INVX2TS U1845 ( .A(n1417), .Y(n1399) );
  OAI2BB2XLTS U1846 ( .B0(n1444), .B1(n1428), .A0N(final_result_ieee[4]), 
        .A1N(n1423), .Y(n499) );
  OAI2BB2XLTS U1847 ( .B0(n1461), .B1(n1428), .A0N(final_result_ieee[17]), 
        .A1N(n1423), .Y(n498) );
  AOI22X1TS U1848 ( .A0(Data_array_SWR[21]), .A1(n1403), .B0(
        Data_array_SWR[25]), .B1(n1404), .Y(n1409) );
  AOI22X1TS U1849 ( .A0(Data_array_SWR[13]), .A1(n1429), .B0(Data_array_SWR[9]), .B1(n1366), .Y(n1402) );
  NAND2X1TS U1850 ( .A(Data_array_SWR[17]), .B(n1430), .Y(n1401) );
  OAI211X1TS U1851 ( .A0(n1409), .A1(n1511), .B0(n1402), .C0(n1401), .Y(n1405)
         );
  AO22X1TS U1852 ( .A0(Data_array_SWR[24]), .A1(n1404), .B0(Data_array_SWR[20]), .B1(n1403), .Y(n1406) );
  OAI2BB2XLTS U1853 ( .B0(n1443), .B1(n1428), .A0N(final_result_ieee[3]), 
        .A1N(n1423), .Y(n497) );
  OAI2BB2XLTS U1854 ( .B0(n1462), .B1(n1428), .A0N(final_result_ieee[18]), 
        .A1N(n1423), .Y(n496) );
  AOI22X1TS U1855 ( .A0(Data_array_SWR[12]), .A1(n1429), .B0(Data_array_SWR[8]), .B1(n1366), .Y(n1408) );
  AOI22X1TS U1856 ( .A0(Data_array_SWR[16]), .A1(n1430), .B0(
        shift_value_SHT2_EWR[4]), .B1(n1406), .Y(n1407) );
  NAND2X1TS U1857 ( .A(n1408), .B(n1407), .Y(n1413) );
  INVX2TS U1858 ( .A(n1409), .Y(n1412) );
  OAI2BB2XLTS U1859 ( .B0(n1442), .B1(n1428), .A0N(final_result_ieee[2]), 
        .A1N(n1423), .Y(n495) );
  OAI2BB2XLTS U1860 ( .B0(n1463), .B1(n1428), .A0N(final_result_ieee[19]), 
        .A1N(n1423), .Y(n494) );
  AOI22X1TS U1861 ( .A0(Data_array_SWR[15]), .A1(n1430), .B0(
        Data_array_SWR[11]), .B1(n1429), .Y(n1416) );
  INVX2TS U1862 ( .A(n1414), .Y(n1431) );
  AOI22X1TS U1863 ( .A0(Data_array_SWR[7]), .A1(n1366), .B0(Data_array_SWR[3]), 
        .B1(n1431), .Y(n1415) );
  OAI211X1TS U1864 ( .A0(n1417), .A1(n1511), .B0(n1416), .C0(n1415), .Y(n1421)
         );
  AOI22X1TS U1865 ( .A0(Data_array_SWR[22]), .A1(n1438), .B0(n1437), .B1(n1421), .Y(n1441) );
  OAI2BB2XLTS U1866 ( .B0(n1441), .B1(n1428), .A0N(final_result_ieee[1]), 
        .A1N(n1423), .Y(n493) );
  AOI22X1TS U1867 ( .A0(Data_array_SWR[14]), .A1(n1430), .B0(
        Data_array_SWR[10]), .B1(n1429), .Y(n1419) );
  AOI22X1TS U1868 ( .A0(Data_array_SWR[6]), .A1(n1366), .B0(Data_array_SWR[2]), 
        .B1(n1431), .Y(n1418) );
  OAI211X1TS U1869 ( .A0(n1420), .A1(n1511), .B0(n1419), .C0(n1418), .Y(n1422)
         );
  AOI22X1TS U1870 ( .A0(Data_array_SWR[23]), .A1(n1438), .B0(n1437), .B1(n1422), .Y(n1440) );
  OAI2BB2XLTS U1871 ( .B0(n1440), .B1(n1428), .A0N(final_result_ieee[0]), 
        .A1N(n1423), .Y(n492) );
  AOI22X1TS U1872 ( .A0(Data_array_SWR[22]), .A1(n1367), .B0(n1468), .B1(n1421), .Y(n1464) );
  OAI2BB2XLTS U1873 ( .B0(n1464), .B1(n1428), .A0N(final_result_ieee[20]), 
        .A1N(n1423), .Y(n491) );
  AOI22X1TS U1874 ( .A0(Data_array_SWR[23]), .A1(n1367), .B0(n1468), .B1(n1422), .Y(n1465) );
  OAI2BB2XLTS U1875 ( .B0(n1465), .B1(n1428), .A0N(final_result_ieee[21]), 
        .A1N(n1423), .Y(n490) );
  AOI22X1TS U1876 ( .A0(Data_array_SWR[13]), .A1(n1430), .B0(Data_array_SWR[9]), .B1(n1429), .Y(n1425) );
  AOI22X1TS U1877 ( .A0(Data_array_SWR[5]), .A1(n1366), .B0(Data_array_SWR[1]), 
        .B1(n1431), .Y(n1424) );
  OAI211X1TS U1878 ( .A0(n1426), .A1(n1511), .B0(n1425), .C0(n1424), .Y(n1436)
         );
  AOI22X1TS U1879 ( .A0(Data_array_SWR[24]), .A1(n1367), .B0(n1468), .B1(n1436), .Y(n1466) );
  OAI2BB2XLTS U1880 ( .B0(n1466), .B1(n1428), .A0N(final_result_ieee[22]), 
        .A1N(n872), .Y(n489) );
  AOI22X1TS U1881 ( .A0(Data_array_SWR[12]), .A1(n1430), .B0(Data_array_SWR[8]), .B1(n1429), .Y(n1433) );
  AOI22X1TS U1882 ( .A0(Data_array_SWR[4]), .A1(n1366), .B0(Data_array_SWR[0]), 
        .B1(n1431), .Y(n1432) );
  OAI211X1TS U1883 ( .A0(n1434), .A1(n1511), .B0(n1433), .C0(n1432), .Y(n1467)
         );
  AOI22X1TS U1884 ( .A0(Data_array_SWR[25]), .A1(n1438), .B0(n1437), .B1(n1467), .Y(n1435) );
  AOI22X1TS U1885 ( .A0(n1453), .A1(n1435), .B0(n1456), .B1(n913), .Y(n488) );
  AOI22X1TS U1886 ( .A0(Data_array_SWR[24]), .A1(n1438), .B0(n1437), .B1(n1436), .Y(n1439) );
  AOI22X1TS U1887 ( .A0(n1471), .A1(n1439), .B0(n1456), .B1(n917), .Y(n487) );
  AOI22X1TS U1888 ( .A0(n1471), .A1(n1440), .B0(n1456), .B1(n918), .Y(n486) );
  AOI22X1TS U1889 ( .A0(n1455), .A1(n1441), .B0(n1469), .B1(n919), .Y(n485) );
  AOI22X1TS U1890 ( .A0(n1471), .A1(n1442), .B0(n1456), .B1(n920), .Y(n484) );
  AOI22X1TS U1891 ( .A0(n1471), .A1(n1443), .B0(n1469), .B1(n921), .Y(n483) );
  AOI22X1TS U1892 ( .A0(n1471), .A1(n1444), .B0(n1456), .B1(n922), .Y(n482) );
  AOI22X1TS U1893 ( .A0(n1471), .A1(n1445), .B0(n923), .B1(n1469), .Y(n481) );
  AOI22X1TS U1894 ( .A0(n1471), .A1(n1446), .B0(n925), .B1(n1456), .Y(n480) );
  AOI22X1TS U1895 ( .A0(n1471), .A1(n1447), .B0(n1469), .B1(n926), .Y(n479) );
  AO22XLTS U1896 ( .A0(n1456), .A1(DmP_mant_SFG_SWR[10]), .B0(n1453), .B1(
        n1448), .Y(n478) );
  AO22XLTS U1897 ( .A0(n1469), .A1(DmP_mant_SFG_SWR[11]), .B0(n1453), .B1(
        n1449), .Y(n477) );
  AO22XLTS U1898 ( .A0(n1456), .A1(DmP_mant_SFG_SWR[12]), .B0(n1453), .B1(
        n1450), .Y(n476) );
  AO22XLTS U1899 ( .A0(n1456), .A1(DmP_mant_SFG_SWR[13]), .B0(n1453), .B1(
        n1451), .Y(n475) );
  AO22XLTS U1900 ( .A0(n1456), .A1(DmP_mant_SFG_SWR[14]), .B0(n1453), .B1(
        n1452), .Y(n474) );
  AO22XLTS U1901 ( .A0(n1456), .A1(DmP_mant_SFG_SWR[15]), .B0(n1455), .B1(
        n1454), .Y(n473) );
  AOI22X1TS U1902 ( .A0(n1471), .A1(n1457), .B0(n1459), .B1(n927), .Y(n472) );
  AOI22X1TS U1903 ( .A0(n1471), .A1(n1458), .B0(n1469), .B1(n928), .Y(n471) );
  AOI22X1TS U1904 ( .A0(n1471), .A1(n1460), .B0(n1469), .B1(n924), .Y(n470) );
  AOI22X1TS U1905 ( .A0(n1471), .A1(n1461), .B0(n1456), .B1(n909), .Y(n469) );
  AOI22X1TS U1906 ( .A0(n1471), .A1(n1462), .B0(n1469), .B1(n910), .Y(n468) );
  AOI22X1TS U1907 ( .A0(n1471), .A1(n1463), .B0(n1328), .B1(n911), .Y(n467) );
  AOI22X1TS U1908 ( .A0(n1471), .A1(n1464), .B0(n912), .B1(n1328), .Y(n466) );
  AOI22X1TS U1909 ( .A0(n1471), .A1(n1465), .B0(n1328), .B1(n914), .Y(n465) );
  AOI22X1TS U1910 ( .A0(n1471), .A1(n1466), .B0(n1328), .B1(n915), .Y(n464) );
  AOI22X1TS U1911 ( .A0(Data_array_SWR[25]), .A1(n1367), .B0(n1468), .B1(n1467), .Y(n1470) );
  AOI22X1TS U1912 ( .A0(n1471), .A1(n1470), .B0(n1469), .B1(n916), .Y(n463) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpadd_approx_syn_constraints_clk30.tcl_GeArN16R6P4_syn.sdf"); 
 endmodule

