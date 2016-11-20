/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 19:40:17 2016
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
         ZERO_FLAG_SFG, inst_FSM_INPUT_ENABLE_state_next_1_, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682, n683, n684, n685, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708,
         n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, n719,
         n720, n721, n722, n723, n724, n725, n726, n727, n728, n729, n730,
         n731, n732, n733, n734, n735, n736, n737, n738, n739, n740, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871,
         DP_OP_15J48_123_3372_n8, DP_OP_15J48_123_3372_n7,
         DP_OP_15J48_123_3372_n6, DP_OP_15J48_123_3372_n5,
         DP_OP_15J48_123_3372_n4, intadd_50_B_2_, intadd_50_B_1_,
         intadd_50_B_0_, intadd_50_CI, intadd_50_SUM_2_, intadd_50_SUM_1_,
         intadd_50_SUM_0_, intadd_50_n3, intadd_50_n2, intadd_50_n1,
         DP_OP_285J48_122_2126_n74, DP_OP_285J48_122_2126_n73,
         DP_OP_285J48_122_2126_n72, DP_OP_285J48_122_2126_n71,
         DP_OP_285J48_122_2126_n70, n873, n874, n875, n876, n877, n878, n879,
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
         n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230,
         n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240,
         n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250,
         n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260,
         n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270,
         n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280,
         n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290,
         n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300,
         n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310,
         n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320,
         n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330,
         n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340,
         n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350,
         n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360,
         n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370,
         n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380,
         n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390,
         n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400,
         n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410,
         n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420,
         n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430,
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
         n1571, n1572, n1573, n1574, n1575, n1576, n1577, n1578, n1579, n1580,
         n1581, n1582, n1583, n1584, n1585, n1586, n1587, n1588, n1589, n1590,
         n1591, n1592, n1593, n1594, n1595, n1596, n1597, n1598, n1599, n1600,
         n1601, n1602, n1603, n1604, n1605, n1606, n1607, n1608, n1609, n1610,
         n1611, n1612, n1613, n1614, n1615, n1616, n1617, n1618, n1619, n1620,
         n1621, n1622, n1623, n1624, n1625, n1626, n1627, n1628, n1629, n1630,
         n1631, n1632, n1633, n1634, n1635, n1636, n1637, n1638, n1639, n1640,
         n1641, n1642, n1643, n1644, n1645, n1646, n1647, n1648, n1649, n1650,
         n1651, n1652, n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660,
         n1661, n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670,
         n1671, n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680,
         n1681, n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690,
         n1691, n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700,
         n1701, n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710,
         n1711, n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720,
         n1721, n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730,
         n1731, n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740,
         n1741, n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750,
         n1751, n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760,
         n1761, n1762, n1763, n1764, n1765;
  wire   [3:0] Shift_reg_FLAGS_7;
  wire   [31:0] intDX_EWSW;
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
  wire   [11:10] DmP_mant_SFG_SWR_signed;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  DFFRXLTS inst_ShiftRegister_Q_reg_6_ ( .D(n869), .CK(clk), .RN(n1724), .Q(
        Shift_reg_FLAGS_7_6), .QN(n928) );
  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(n866), .CK(clk), .RN(n1724), .Q(
        Shift_reg_FLAGS_7[3]) );
  DFFRXLTS inst_ShiftRegister_Q_reg_2_ ( .D(n865), .CK(clk), .RN(n1763), .Q(
        Shift_reg_FLAGS_7[2]), .QN(n1717) );
  DFFRXLTS INPUT_STAGE_FLAGS_Q_reg_0_ ( .D(n830), .CK(clk), .RN(n1728), .Q(
        intAS) );
  DFFRXLTS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n829), .CK(clk), .RN(n1728), .Q(
        left_right_SHT2), .QN(n888) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(n764), .CK(clk), .RN(n1734), 
        .Q(Shift_amount_SHT1_EWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(n763), .CK(clk), .RN(n1734), 
        .Q(Shift_amount_SHT1_EWR[3]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(n762), .CK(clk), .RN(n1734), 
        .Q(Shift_amount_SHT1_EWR[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(n753), .CK(clk), .RN(n1738), .Q(
        DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(n752), .CK(clk), .RN(n1135), .Q(
        DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(n751), .CK(clk), .RN(n1739), .Q(
        DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(n750), .CK(clk), .RN(n1136), .Q(
        DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(n749), .CK(clk), .RN(n1134), .Q(
        DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(n748), .CK(clk), .RN(n1139), .Q(
        DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(n747), .CK(clk), .RN(n1138), .Q(
        DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(n746), .CK(clk), .RN(n1735), .Q(
        DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(n745), .CK(clk), .RN(n1134), .Q(
        DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(n744), .CK(clk), .RN(n1735), .Q(
        DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(n743), .CK(clk), .RN(n1738), .Q(
        DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(n742), .CK(clk), .RN(n1135), .Q(
        DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(n741), .CK(clk), .RN(n1739), .Q(
        DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(n740), .CK(clk), .RN(n1136), .Q(
        DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(n739), .CK(clk), .RN(n1134), .Q(
        DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(n738), .CK(clk), .RN(n1139), .Q(
        DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(n737), .CK(clk), .RN(n1138), .Q(
        DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(n736), .CK(clk), .RN(n1735), .Q(
        DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(n735), .CK(clk), .RN(n1138), .Q(
        DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(n734), .CK(clk), .RN(n1736), .Q(
        DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(n733), .CK(clk), .RN(n1139), .Q(
        DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(n732), .CK(clk), .RN(n1134), .Q(
        DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(n731), .CK(clk), .RN(n1735), .Q(
        DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(n725), .CK(clk), .RN(n1138), .Q(
        DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(n724), .CK(clk), .RN(n1736), .Q(
        DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(n723), .CK(clk), .RN(n1737), .Q(
        DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(n722), .CK(clk), .RN(n1737), .Q(
        OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_0_ ( .D(n721), .CK(clk), .RN(n1737), .Q(
        ZERO_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(n720), .CK(clk), .RN(n1737), .Q(
        SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(n719), .CK(clk), .RN(n1737), .Q(
        DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(n718), .CK(clk), .RN(n1737), .Q(
        DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(n716), .CK(clk), .RN(n1737), .Q(
        DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(n715), .CK(clk), .RN(n1737), .Q(
        DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(n713), .CK(clk), .RN(n1735), .Q(
        DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(n712), .CK(clk), .RN(n1736), .Q(
        DMP_SHT2_EWSW[2]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_2_ ( .D(n711), .CK(clk), .RN(n1738), .Q(
        DMP_SFG[2]), .QN(n1700) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(n710), .CK(clk), .RN(n1138), .Q(
        DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(n709), .CK(clk), .RN(n1135), .Q(
        DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(n707), .CK(clk), .RN(n1739), .Q(
        DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(n706), .CK(clk), .RN(n1136), .Q(
        DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(n704), .CK(clk), .RN(n1134), .Q(
        DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(n703), .CK(clk), .RN(n1736), .Q(
        DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(n701), .CK(clk), .RN(n1738), .Q(
        DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(n700), .CK(clk), .RN(n1138), .Q(
        DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(n698), .CK(clk), .RN(n1135), .Q(
        DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(n697), .CK(clk), .RN(n1739), .Q(
        DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(n695), .CK(clk), .RN(n1136), .Q(
        DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(n694), .CK(clk), .RN(n1134), .Q(
        DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(n692), .CK(clk), .RN(n1139), .Q(
        DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(n691), .CK(clk), .RN(n1138), .Q(
        DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(n689), .CK(clk), .RN(n1740), .Q(
        DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(n688), .CK(clk), .RN(n1740), .Q(
        DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(n686), .CK(clk), .RN(n1740), .Q(
        DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(n685), .CK(clk), .RN(n1740), .Q(
        DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(n683), .CK(clk), .RN(n1740), .Q(
        DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(n682), .CK(clk), .RN(n1740), .Q(
        DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(n680), .CK(clk), .RN(n1740), .Q(
        DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(n679), .CK(clk), .RN(n1740), .Q(
        DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(n677), .CK(clk), .RN(n1740), .Q(
        DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(n676), .CK(clk), .RN(n1740), .Q(
        DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(n674), .CK(clk), .RN(n1741), .Q(
        DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(n673), .CK(clk), .RN(n1741), .Q(
        DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(n671), .CK(clk), .RN(n1741), .Q(
        DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(n670), .CK(clk), .RN(n1741), .Q(
        DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(n668), .CK(clk), .RN(n1741), .Q(
        DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(n667), .CK(clk), .RN(n1741), .Q(
        DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(n665), .CK(clk), .RN(n1741), .Q(
        DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(n664), .CK(clk), .RN(n1741), .Q(
        DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(n662), .CK(clk), .RN(n1741), .Q(
        DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(n661), .CK(clk), .RN(n1741), .Q(
        DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(n659), .CK(clk), .RN(n1742), .Q(
        DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(n658), .CK(clk), .RN(n1742), .Q(
        DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(n656), .CK(clk), .RN(n1742), .Q(
        DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(n655), .CK(clk), .RN(n1742), .Q(
        DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(n653), .CK(clk), .RN(n1742), .Q(
        DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(n652), .CK(clk), .RN(n1742), .Q(
        DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(n650), .CK(clk), .RN(n1742), .Q(
        DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(n649), .CK(clk), .RN(n1742), .Q(
        DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(n648), .CK(clk), .RN(n1742), .Q(
        DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(n647), .CK(clk), .RN(n1742), .Q(
        DMP_exp_NRM_EW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(n645), .CK(clk), .RN(n1743), .Q(
        DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(n644), .CK(clk), .RN(n1743), .Q(
        DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(n643), .CK(clk), .RN(n1743), .Q(
        DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(n642), .CK(clk), .RN(n1743), .Q(
        DMP_exp_NRM_EW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(n640), .CK(clk), .RN(n1743), .Q(
        DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(n639), .CK(clk), .RN(n1743), .Q(
        DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(n638), .CK(clk), .RN(n1743), .Q(
        DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(n637), .CK(clk), .RN(n1743), .Q(
        DMP_exp_NRM_EW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(n635), .CK(clk), .RN(n1743), .Q(
        DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(n634), .CK(clk), .RN(n1743), .Q(
        DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(n633), .CK(clk), .RN(n1744), .Q(
        DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(n632), .CK(clk), .RN(n1744), .Q(
        DMP_exp_NRM_EW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(n630), .CK(clk), .RN(n1744), .Q(
        DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(n629), .CK(clk), .RN(n1744), .Q(
        DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(n628), .CK(clk), .RN(n1744), .Q(
        DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(n627), .CK(clk), .RN(n1744), .Q(
        DMP_exp_NRM_EW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(n625), .CK(clk), .RN(n1744), .Q(
        DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(n624), .CK(clk), .RN(n1744), .Q(
        DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(n623), .CK(clk), .RN(n1744), .Q(
        DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(n622), .CK(clk), .RN(n1744), .Q(
        DMP_exp_NRM_EW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(n620), .CK(clk), .RN(n1745), .Q(
        DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(n619), .CK(clk), .RN(n1745), .Q(
        DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(n618), .CK(clk), .RN(n1745), .Q(
        DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(n617), .CK(clk), .RN(n1745), .Q(
        DMP_exp_NRM_EW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(n615), .CK(clk), .RN(n1745), .Q(
        DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(n614), .CK(clk), .RN(n1745), .Q(
        DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(n613), .CK(clk), .RN(n1745), .Q(
        DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(n612), .CK(clk), .RN(n1745), .Q(
        DMP_exp_NRM_EW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(n610), .CK(clk), .RN(n1745), .Q(
        DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(n609), .CK(clk), .RN(n1745), .Q(
        DmP_mant_SHT1_SW[0]), .QN(n1715) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(n608), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(n606), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(n604), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(n602), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(n600), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(n598), .CK(clk), .RN(n1747), .Q(
        DmP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(n596), .CK(clk), .RN(n1747), .Q(
        DmP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(n594), .CK(clk), .RN(n1747), .Q(
        DmP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(n592), .CK(clk), .RN(n1747), .Q(
        DmP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(n590), .CK(clk), .RN(n1747), .Q(
        DmP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(n588), .CK(clk), .RN(n1748), .Q(
        DmP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(n586), .CK(clk), .RN(n1748), .Q(
        DmP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(n584), .CK(clk), .RN(n1748), .Q(
        DmP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(n582), .CK(clk), .RN(n1748), .Q(
        DmP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(n580), .CK(clk), .RN(n1748), .Q(
        DmP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(n578), .CK(clk), .RN(n1749), .Q(
        DmP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(n576), .CK(clk), .RN(n1749), .Q(
        DmP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(n574), .CK(clk), .RN(n1749), .Q(
        DmP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(n572), .CK(clk), .RN(n1749), .Q(
        DmP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(n570), .CK(clk), .RN(n1749), .Q(
        DmP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(n568), .CK(clk), .RN(n1750), .Q(
        DmP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(n566), .CK(clk), .RN(n1750), .Q(
        DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_0_ ( .D(n557), .CK(clk), .RN(n1751), .Q(
        ZERO_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_0_ ( .D(n556), .CK(clk), .RN(n1751), .Q(
        ZERO_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_0_ ( .D(n555), .CK(clk), .RN(n1751), .Q(
        ZERO_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_0_ ( .D(n554), .CK(clk), .RN(n1751), .Q(
        ZERO_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(n553), .CK(clk), .RN(n1751), .Q(
        ZERO_FLAG_SHT1SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(n551), .CK(clk), .RN(n1751), .Q(
        OP_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(n1716), .CK(clk), .RN(n1763), .Q(
        OP_FLAG_SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(n548), .CK(clk), .RN(n1751), .Q(
        SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(n547), .CK(clk), .RN(n1751), .Q(
        SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(n546), .CK(clk), .RN(n1751), .Q(
        SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(n545), .CK(clk), .RN(n1752), .Q(
        SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n544), .CK(clk), .RN(n1752), .Q(
        SIGN_FLAG_SHT1SHT2) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(n527), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[15]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(n526), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[16]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(n524), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[18]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(n516), .CK(clk), .RN(n1757), .Q(
        LZD_output_NRM2_EW[3]), .QN(n1663) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(n514), .CK(clk), .RN(n1757), .Q(
        LZD_output_NRM2_EW[2]), .QN(n1665) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(n513), .CK(clk), .RN(n1757), .Q(
        LZD_output_NRM2_EW[1]), .QN(n1664) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(n512), .CK(clk), .RN(n1757), .Q(
        LZD_output_NRM2_EW[4]), .QN(n1671) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(n488), .CK(clk), .RN(n1755), .Q(
        DmP_mant_SFG_SWR[0]), .QN(n922) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(n487), .CK(clk), .RN(n1755), .Q(
        DmP_mant_SFG_SWR[1]), .QN(n923) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(n484), .CK(clk), .RN(n1755), .Q(
        DmP_mant_SFG_SWR[4]), .QN(n1673) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(n483), .CK(clk), .RN(n1755), .Q(
        DmP_mant_SFG_SWR[5]), .QN(n1666) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(n482), .CK(clk), .RN(n1755), .Q(
        DmP_mant_SFG_SWR[6]), .QN(n1672) );
  CMPR32X2TS intadd_50_U4 ( .A(n1700), .B(intadd_50_B_0_), .C(intadd_50_CI), 
        .CO(intadd_50_n3), .S(intadd_50_SUM_0_) );
  CMPR32X2TS intadd_50_U3 ( .A(n1710), .B(intadd_50_B_1_), .C(intadd_50_n3), 
        .CO(intadd_50_n2), .S(intadd_50_SUM_1_) );
  CMPR32X2TS intadd_50_U2 ( .A(n1711), .B(intadd_50_B_2_), .C(intadd_50_n2), 
        .CO(intadd_50_n1), .S(intadd_50_SUM_2_) );
  AFCSIHCONX2TS DP_OP_285J48_122_2126_U78 ( .A(DMP_SFG[8]), .B(
        DmP_mant_SFG_SWR_signed[10]), .CS(DP_OP_285J48_122_2126_n74), .CO0N(
        DP_OP_285J48_122_2126_n73), .CO1N(DP_OP_285J48_122_2126_n72) );
  AFCSHCINX2TS DP_OP_285J48_122_2126_U77 ( .CI1N(DP_OP_285J48_122_2126_n72), 
        .B(DmP_mant_SFG_SWR_signed[11]), .A(DMP_SFG[9]), .CI0N(
        DP_OP_285J48_122_2126_n73), .CS(DP_OP_285J48_122_2126_n74), .CO1(
        DP_OP_285J48_122_2126_n70), .CO0(DP_OP_285J48_122_2126_n71) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n1728), 
        .Q(ready) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n559), .CK(clk), .RN(n1750), .Q(
        underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(n552), .CK(clk), .RN(n1751), .Q(
        zero_flag) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(n505), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[7]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(n503), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[6]) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n558), .CK(clk), .RN(n1755), .Q(
        overflow_flag) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(n754), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[30]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(n543), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[31]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(n761), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[23]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(n760), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[24]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(n759), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[25]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(n758), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[26]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(n757), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[27]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(n756), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[28]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(n755), .CK(clk), .RN(n1756), .Q(
        final_result_ieee[29]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(n530), .CK(clk), .RN(n1758), .Q(
        Raw_mant_NRM_SWR[12]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(n528), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[14]), .QN(n1659) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(n827), .CK(clk), .RN(n1728), .Q(
        intDY_EWSW[1]), .QN(n1765) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(n539), .CK(clk), .RN(n1752), .Q(
        Raw_mant_NRM_SWR[3]), .QN(n1647) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(
        inst_FSM_INPUT_ENABLE_state_next_1_), .CK(clk), .RN(n1724), .Q(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n1640) );
  DFFRX2TS inst_ShiftRegister_Q_reg_5_ ( .D(n868), .CK(clk), .RN(n1724), .Q(
        n1636), .QN(n1714) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(n858), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[4]), .QN(n1637) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(n536), .CK(clk), .RN(n1752), .Q(
        Raw_mant_NRM_SWR[6]), .QN(n1702) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(n838), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[24]), .QN(n1707) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(n837), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[25]), .QN(n1649) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(n808), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[20]), .QN(n1688) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(n814), .CK(clk), .RN(n1729), 
        .Q(intDY_EWSW[14]), .QN(n1686) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(n815), .CK(clk), .RN(n1729), 
        .Q(intDY_EWSW[13]), .QN(n1680) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(n816), .CK(clk), .RN(n1729), 
        .Q(intDY_EWSW[12]), .QN(n1685) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(n810), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[18]), .QN(n1694) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(n811), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[17]), .QN(n1678) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(n813), .CK(clk), .RN(n1729), 
        .Q(intDY_EWSW[15]), .QN(n1643) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(n817), .CK(clk), .RN(n1729), 
        .Q(intDY_EWSW[11]), .QN(n1660) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(n820), .CK(clk), .RN(n1729), .Q(
        intDY_EWSW[8]), .QN(n1682) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(n825), .CK(clk), .RN(n1728), .Q(
        intDY_EWSW[3]), .QN(n1677) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(n805), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[23]), .QN(n1691) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(n806), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[22]), .QN(n1644) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(n807), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[21]), .QN(n1681) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(n798), .CK(clk), .RN(n1731), 
        .Q(intDY_EWSW[30]), .QN(n1692) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(n799), .CK(clk), .RN(n1731), 
        .Q(intDY_EWSW[29]), .QN(n1645) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(n802), .CK(clk), .RN(n1731), 
        .Q(intDY_EWSW[26]), .QN(n1689) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(n803), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[25]), .QN(n1676) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(n846), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[16]), .QN(n1656) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(n855), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[7]), .QN(n1638) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(n856), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[6]), .QN(n1657) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(n857), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[5]), .QN(n1651) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(n525), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[17]), .QN(n1674) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(n796), .CK(clk), .RN(n1731), .Q(
        Data_array_SWR[25]), .QN(n1720) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(n795), .CK(clk), .RN(n1731), .Q(
        Data_array_SWR[24]), .QN(n1721) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(n509), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[9]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(n520), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[22]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(n517), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[25]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(n497), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[3]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(n506), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[13]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(n542), .CK(clk), .RN(n1758), .Q(
        Raw_mant_NRM_SWR[0]), .QN(n1639) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(n826), .CK(clk), .RN(n1728), .Q(
        intDY_EWSW[2]), .QN(n1683) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(n788), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[17]), .QN(n1719) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(n859), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(n839), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[23]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(n847), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(n841), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[21]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(n849), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[13]) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(n767), .CK(clk), .RN(n1734), .Q(
        shift_value_SHT2_EWR[4]), .QN(n882) );
  DFFRX2TS inst_ShiftRegister_Q_reg_0_ ( .D(n863), .CK(clk), .RN(n1724), .Q(
        Shift_reg_FLAGS_7[0]), .QN(n1701) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(n845), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(n793), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[22]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(n533), .CK(clk), .RN(n1758), .Q(
        Raw_mant_NRM_SWR[9]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(n854), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[8]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(n851), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[11]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(n532), .CK(clk), .RN(n1758), .Q(
        Raw_mant_NRM_SWR[10]), .QN(n881) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(n861), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(n853), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[9]) );
  DFFRX4TS inst_ShiftRegister_Q_reg_4_ ( .D(n867), .CK(clk), .RN(n1724), .Q(
        busy), .QN(n1764) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(n770), .CK(clk), .RN(n1731), .Q(
        shift_value_SHT2_EWR[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(n844), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[18]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(n794), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[23]), .QN(n1703) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(n786), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(n833), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[29]) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n871), .CK(clk), .RN(
        n1724), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(n843), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[19]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(n835), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[27]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(n785), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[14]), .QN(n1706) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(n783), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[12]), .QN(n1705) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(n538), .CK(clk), .RN(n1752), .Q(
        Raw_mant_NRM_SWR[4]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(n780), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[9]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_7_ ( .D(n696), .CK(clk), .RN(n1763), .Q(
        DMP_SFG[7]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(n777), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[6]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(n778), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[7]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(n775), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[4]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(n776), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[5]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(n831), .CK(clk), .RN(n1728), 
        .Q(intDX_EWSW[31]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(n702), .CK(clk), .RN(n1135), .Q(
        DMP_SFG[5]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_1_ ( .D(n714), .CK(clk), .RN(n1737), .Q(
        DMP_SFG[1]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_8_ ( .D(n693), .CK(clk), .RN(n1763), .Q(
        DMP_SFG[8]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_11_ ( .D(n684), .CK(clk), .RN(n1763), .Q(
        DMP_SFG[11]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_18_ ( .D(n663), .CK(clk), .RN(n1761), .Q(
        DMP_SFG[18]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_16_ ( .D(n669), .CK(clk), .RN(n1761), .Q(
        DMP_SFG[16]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(n690), .CK(clk), .RN(n1763), .Q(
        DMP_SFG[9]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_6_ ( .D(n699), .CK(clk), .RN(n1763), .Q(
        DMP_SFG[6]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_14_ ( .D(n675), .CK(clk), .RN(n1761), .Q(
        DMP_SFG[14]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(n575), .CK(clk), .RN(n1749), .Q(
        DmP_mant_SHT1_SW[17]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_17_ ( .D(n666), .CK(clk), .RN(n1761), .Q(
        DMP_SFG[17]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_15_ ( .D(n672), .CK(clk), .RN(n1761), .Q(
        DMP_SFG[15]) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(n765), .CK(clk), .RN(n1734), 
        .Q(Shift_amount_SHT1_EWR[1]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_21_ ( .D(n654), .CK(clk), .RN(n1761), .Q(
        DMP_SFG[21]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_13_ ( .D(n678), .CK(clk), .RN(n1763), .Q(
        DMP_SFG[13]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(n626), .CK(clk), .RN(n1757), .Q(
        DMP_exp_NRM2_EW[4]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(n631), .CK(clk), .RN(n1757), .Q(
        DMP_exp_NRM2_EW[3]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(n636), .CK(clk), .RN(n1757), .Q(
        DMP_exp_NRM2_EW[2]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(n641), .CK(clk), .RN(n1757), .Q(
        DMP_exp_NRM2_EW[1]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_12_ ( .D(n681), .CK(clk), .RN(n1763), .Q(
        DMP_SFG[12]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(n687), .CK(clk), .RN(n1763), .Q(
        DMP_SFG[10]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_22_ ( .D(n651), .CK(clk), .RN(n1762), .Q(
        DMP_SFG[22]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_20_ ( .D(n657), .CK(clk), .RN(n1761), .Q(
        DMP_SFG[20]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_19_ ( .D(n660), .CK(clk), .RN(n1761), .Q(
        DMP_SFG[19]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_26_ ( .D(n561), .CK(clk), .RN(n1750), .Q(
        DmP_EXP_EWSW[26]), .QN(n889) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n478), .CK(clk), .RN(n1762), .Q(
        DmP_mant_SFG_SWR[10]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(n468), .CK(clk), .RN(n1760), .Q(
        DmP_mant_SFG_SWR[20]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(n470), .CK(clk), .RN(n1760), .Q(
        DmP_mant_SFG_SWR[18]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(n479), .CK(clk), .RN(n1762), .Q(
        DmP_mant_SFG_SWR[9]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(n480), .CK(clk), .RN(n1762), .Q(
        DmP_mant_SFG_SWR[8]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_0_ ( .D(n717), .CK(clk), .RN(n1737), .Q(
        DMP_SFG[0]), .QN(n886) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_31_ ( .D(n797), .CK(clk), .RN(n1731), 
        .Q(intDY_EWSW[31]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n473), .CK(clk), .RN(n1762), .Q(
        DmP_mant_SFG_SWR[15]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n474), .CK(clk), .RN(n1762), .Q(
        DmP_mant_SFG_SWR[14]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n475), .CK(clk), .RN(n1762), .Q(
        DmP_mant_SFG_SWR[13]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n476), .CK(clk), .RN(n1762), .Q(
        DmP_mant_SFG_SWR[12]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n477), .CK(clk), .RN(n1762), .Q(
        DmP_mant_SFG_SWR[11]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(n463), .CK(clk), .RN(n1761), .Q(
        DmP_mant_SFG_SWR[25]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(n464), .CK(clk), .RN(n1761), .Q(
        DmP_mant_SFG_SWR[24]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(n465), .CK(clk), .RN(n1760), .Q(
        DmP_mant_SFG_SWR[23]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(n466), .CK(clk), .RN(n1760), .Q(
        DmP_mant_SFG_SWR[22]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(n467), .CK(clk), .RN(n1760), .Q(
        DmP_mant_SFG_SWR[21]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(n469), .CK(clk), .RN(n1760), .Q(
        DmP_mant_SFG_SWR[19]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(n471), .CK(clk), .RN(n1760), .Q(
        DmP_mant_SFG_SWR[17]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(n472), .CK(clk), .RN(n1760), .Q(
        DmP_mant_SFG_SWR[16]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(n850), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[12]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(n842), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(n848), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[14]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(n840), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[22]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(n860), .CK(clk), .RN(n1725), .Q(
        intDX_EWSW[2]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(n784), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[13]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(n832), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[30]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(n852), .CK(clk), .RN(n1725), 
        .Q(intDX_EWSW[10]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(n862), .CK(clk), .RN(n1724), .Q(
        intDX_EWSW[0]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(n782), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[11]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(n790), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(n789), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[18]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(n779), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[8]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(n781), .CK(clk), .RN(n1733), .Q(
        Data_array_SWR[10]), .QN(n1713) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(n603), .CK(clk), .RN(n1746), .Q(
        DmP_mant_SHT1_SW[3]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(n593), .CK(clk), .RN(n1747), .Q(
        DmP_mant_SHT1_SW[8]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(n589), .CK(clk), .RN(n1747), .Q(
        DmP_mant_SHT1_SW[10]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(n585), .CK(clk), .RN(n1748), .Q(
        DmP_mant_SHT1_SW[12]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(n565), .CK(clk), .RN(n1750), .Q(
        DmP_mant_SHT1_SW[22]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(n579), .CK(clk), .RN(n1748), .Q(
        DmP_mant_SHT1_SW[15]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_27_ ( .D(n726), .CK(clk), .RN(n1739), .Q(
        DMP_EXP_EWSW[27]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_25_ ( .D(n728), .CK(clk), .RN(n1136), .Q(
        DMP_EXP_EWSW[25]), .QN(n924) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(n607), .CK(clk), .RN(n1746), .Q(
        DmP_mant_SHT1_SW[1]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(n599), .CK(clk), .RN(n1746), .Q(
        DmP_mant_SHT1_SW[5]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_24_ ( .D(n729), .CK(clk), .RN(n1134), .Q(
        DMP_EXP_EWSW[24]), .QN(n1648) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_26_ ( .D(n727), .CK(clk), .RN(n1139), .Q(
        DMP_EXP_EWSW[26]), .QN(n1650) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(n567), .CK(clk), .RN(n1750), .Q(
        DmP_mant_SHT1_SW[21]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(n605), .CK(clk), .RN(n1746), .Q(
        DmP_mant_SHT1_SW[2]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(n597), .CK(clk), .RN(n1747), .Q(
        DmP_mant_SHT1_SW[6]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(n591), .CK(clk), .RN(n1747), .Q(
        DmP_mant_SHT1_SW[9]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(n587), .CK(clk), .RN(n1748), .Q(
        DmP_mant_SHT1_SW[11]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(n571), .CK(clk), .RN(n1749), .Q(
        DmP_mant_SHT1_SW[19]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(n581), .CK(clk), .RN(n1748), .Q(
        DmP_mant_SHT1_SW[14]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(n601), .CK(clk), .RN(n1746), .Q(
        DmP_mant_SHT1_SW[4]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(n583), .CK(clk), .RN(n1748), .Q(
        DmP_mant_SHT1_SW[13]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(n573), .CK(clk), .RN(n1749), .Q(
        DmP_mant_SHT1_SW[18]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(n595), .CK(clk), .RN(n1747), .Q(
        DmP_mant_SHT1_SW[7]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(n577), .CK(clk), .RN(n1749), .Q(
        DmP_mant_SHT1_SW[16]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(n569), .CK(clk), .RN(n1749), .Q(
        DmP_mant_SHT1_SW[20]) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(n766), .CK(clk), .RN(n1734), 
        .Q(Shift_amount_SHT1_EWR[0]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_23_ ( .D(n564), .CK(clk), .RN(n1750), .Q(
        DmP_EXP_EWSW[23]), .QN(n925) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_24_ ( .D(n563), .CK(clk), .RN(n1750), .Q(
        DmP_EXP_EWSW[24]), .QN(n887) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(n774), .CK(clk), .RN(n1734), .Q(
        Data_array_SWR[3]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(n773), .CK(clk), .RN(n1734), .Q(
        Data_array_SWR[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(n772), .CK(clk), .RN(n1734), .Q(
        Data_array_SWR[1]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_27_ ( .D(n560), .CK(clk), .RN(n1750), .Q(
        DmP_EXP_EWSW[27]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_25_ ( .D(n562), .CK(clk), .RN(n1750), .Q(
        DmP_EXP_EWSW[25]), .QN(n1708) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(n771), .CK(clk), .RN(n1734), .Q(
        Data_array_SWR[0]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(n515), .CK(clk), .RN(n1756), .Q(
        LZD_output_NRM2_EW[0]), .QN(n878) );
  DFFRX1TS inst_ShiftRegister_Q_reg_1_ ( .D(n864), .CK(clk), .RN(n1724), .Q(
        Shift_reg_FLAGS_7[1]), .QN(n877) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(n523), .CK(clk), .RN(n1760), .Q(
        Raw_mant_NRM_SWR[19]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(n522), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[20]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(n521), .CK(clk), .RN(n1760), .Q(
        Raw_mant_NRM_SWR[21]), .QN(n1675) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(n519), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[23]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(n529), .CK(clk), .RN(n1758), .Q(
        Raw_mant_NRM_SWR[13]), .QN(n1704) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(n531), .CK(clk), .RN(n1758), .Q(
        Raw_mant_NRM_SWR[11]), .QN(n1633) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(n504), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[14]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(n502), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[15]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(n501), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[5]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(n500), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[16]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(n499), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[4]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(n498), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[17]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(n496), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[18]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(n495), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[2]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(n494), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[19]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(n493), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[1]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(n492), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[0]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(n491), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[20]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(n490), .CK(clk), .RN(n1754), .Q(
        final_result_ieee[21]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(n489), .CK(clk), .RN(n1755), .Q(
        final_result_ieee[22]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(n510), .CK(clk), .RN(n1752), .Q(
        final_result_ieee[11]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(n508), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[12]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(n507), .CK(clk), .RN(n1753), .Q(
        final_result_ieee[8]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(n511), .CK(clk), .RN(n1752), .Q(
        final_result_ieee[10]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(n611), .CK(clk), .RN(n1758), .Q(
        DMP_exp_NRM2_EW[7]), .QN(n1699) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(n616), .CK(clk), .RN(n1758), .Q(
        DMP_exp_NRM2_EW[6]), .QN(n1698) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(n621), .CK(clk), .RN(n1757), .Q(
        DMP_exp_NRM2_EW[5]), .QN(n1670) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(n646), .CK(clk), .RN(n1757), .Q(
        DMP_exp_NRM2_EW[0]), .QN(n1662) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(n541), .CK(clk), .RN(n1758), .Q(
        Raw_mant_NRM_SWR[1]), .QN(n1709) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n870), .CK(clk), .RN(
        n1724), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n1669) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(n540), .CK(clk), .RN(n1752), .Q(
        Raw_mant_NRM_SWR[2]), .QN(n1634) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(n537), .CK(clk), .RN(n1752), .Q(
        Raw_mant_NRM_SWR[5]), .QN(n1654) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_4_ ( .D(n705), .CK(clk), .RN(n1138), .Q(
        DMP_SFG[4]), .QN(n1711) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_3_ ( .D(n708), .CK(clk), .RN(n1736), .Q(
        DMP_SFG[3]), .QN(n1710) );
  DFFRX1TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(n769), .CK(clk), .RN(n1731), .Q(
        shift_value_SHT2_EWR[3]), .QN(n1652) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(n821), .CK(clk), .RN(n1729), .Q(
        intDY_EWSW[7]), .QN(n1668) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(n836), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[26]), .QN(n1712) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(n809), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[19]), .QN(n1646) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(n818), .CK(clk), .RN(n1729), 
        .Q(intDY_EWSW[10]), .QN(n1653) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(n828), .CK(clk), .RN(n1728), .Q(
        intDY_EWSW[0]), .QN(n1642) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(n819), .CK(clk), .RN(n1729), .Q(
        intDY_EWSW[9]), .QN(n1679) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(n812), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[16]), .QN(n1687) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(n822), .CK(clk), .RN(n1729), .Q(
        intDY_EWSW[6]), .QN(n1667) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(n824), .CK(clk), .RN(n1728), .Q(
        intDY_EWSW[4]), .QN(n1684) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(n823), .CK(clk), .RN(n1728), .Q(
        intDY_EWSW[5]), .QN(n1641) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(n834), .CK(clk), .RN(n1727), 
        .Q(intDX_EWSW[28]), .QN(n1658) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(n801), .CK(clk), .RN(n1731), 
        .Q(intDY_EWSW[27]), .QN(n1693) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(n804), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[24]), .QN(n1635) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(n800), .CK(clk), .RN(n1731), 
        .Q(intDY_EWSW[28]), .QN(n1690) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(n535), .CK(clk), .RN(n1752), .Q(
        Raw_mant_NRM_SWR[7]), .QN(n1655) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(n486), .CK(clk), .RN(n1755), .Q(
        DmP_mant_SFG_SWR[2]), .QN(n1696) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(n485), .CK(clk), .RN(n1755), .Q(
        DmP_mant_SFG_SWR[3]), .QN(n1697) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(n481), .CK(clk), .RN(n1755), .Q(
        DmP_mant_SFG_SWR[7]), .QN(n1695) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(n787), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[16]), .QN(n1723) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(n791), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[20]), .QN(n1722) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(n534), .CK(clk), .RN(n1758), .Q(
        Raw_mant_NRM_SWR[8]), .QN(n1632) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(n792), .CK(clk), .RN(n1732), .Q(
        Data_array_SWR[21]), .QN(n1718) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_23_ ( .D(n730), .CK(clk), .RN(n1738), .Q(
        DMP_EXP_EWSW[23]) );
  DFFRX2TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(n549), .CK(clk), .RN(n1762), .Q(n873), 
        .QN(n1661) );
  ADDFX1TS DP_OP_15J48_123_3372_U7 ( .A(n1665), .B(DMP_exp_NRM2_EW[2]), .CI(
        DP_OP_15J48_123_3372_n7), .CO(DP_OP_15J48_123_3372_n6), .S(
        exp_rslt_NRM2_EW1[2]) );
  ADDFX1TS DP_OP_15J48_123_3372_U6 ( .A(n1663), .B(DMP_exp_NRM2_EW[3]), .CI(
        DP_OP_15J48_123_3372_n6), .CO(DP_OP_15J48_123_3372_n5), .S(
        exp_rslt_NRM2_EW1[3]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(n518), .CK(clk), .RN(n1759), .Q(
        Raw_mant_NRM_SWR[24]) );
  CMPR32X2TS DP_OP_15J48_123_3372_U8 ( .A(n1664), .B(DMP_exp_NRM2_EW[1]), .C(
        DP_OP_15J48_123_3372_n8), .CO(DP_OP_15J48_123_3372_n7), .S(
        exp_rslt_NRM2_EW1[1]) );
  CMPR32X2TS DP_OP_15J48_123_3372_U5 ( .A(n1671), .B(DMP_exp_NRM2_EW[4]), .C(
        DP_OP_15J48_123_3372_n5), .CO(DP_OP_15J48_123_3372_n4), .S(
        exp_rslt_NRM2_EW1[4]) );
  OAI221X1TS U897 ( .A0(n906), .A1(n1394), .B0(n905), .B1(n1393), .C0(n1392), 
        .Y(n1589) );
  AOI222X1TS U898 ( .A0(n1601), .A1(n888), .B0(Data_array_SWR[6]), .B1(n904), 
        .C0(n1600), .C1(n1604), .Y(n1628) );
  OAI2BB2XLTS U899 ( .B0(n1339), .B1(n909), .A0N(Raw_mant_NRM_SWR[16]), .A1N(
        n1353), .Y(n966) );
  CMPR32X2TS U900 ( .A(DMP_SFG[8]), .B(DmP_mant_SFG_SWR_signed[10]), .C(n1477), 
        .CO(n1471), .S(n1478) );
  AOI222X4TS U901 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n897), .B0(n918), .B1(
        DmP_mant_SHT1_SW[19]), .C0(n1313), .C1(DmP_mant_SHT1_SW[20]), .Y(n1376) );
  AOI222X4TS U902 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n897), .B0(n917), .B1(
        DmP_mant_SHT1_SW[20]), .C0(n1360), .C1(DmP_mant_SHT1_SW[21]), .Y(n1379) );
  AOI222X4TS U903 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n897), .B0(n918), .B1(
        DmP_mant_SHT1_SW[16]), .C0(n1313), .C1(DmP_mant_SHT1_SW[17]), .Y(n1306) );
  AND2X2TS U904 ( .A(beg_OP), .B(n1509), .Y(n1514) );
  AOI211X1TS U905 ( .A0(DmP_mant_SHT1_SW[22]), .A1(n914), .B0(n1527), .C0(
        n1114), .Y(n1380) );
  CMPR32X2TS U906 ( .A(DMP_SFG[7]), .B(n1483), .C(n1482), .CO(n1477), .S(n1484) );
  INVX2TS U907 ( .A(n896), .Y(n897) );
  INVX2TS U908 ( .A(n883), .Y(n874) );
  CMPR32X2TS U909 ( .A(DMP_SFG[6]), .B(n1480), .C(n1479), .CO(n1482), .S(n1481) );
  INVX2TS U910 ( .A(n1567), .Y(n1243) );
  AOI32X1TS U911 ( .A0(n1057), .A1(n1056), .A2(n1055), .B0(n1054), .B1(n1057), 
        .Y(n1058) );
  NAND3X1TS U912 ( .A(shift_value_SHT2_EWR[2]), .B(n882), .C(
        shift_value_SHT2_EWR[3]), .Y(n883) );
  BUFX3TS U913 ( .A(Shift_reg_FLAGS_7_6), .Y(n1567) );
  NAND2X1TS U914 ( .A(n1698), .B(n1066), .Y(n1092) );
  INVX2TS U915 ( .A(n905), .Y(n906) );
  INVX2TS U916 ( .A(n1401), .Y(n905) );
  NAND2X1TS U917 ( .A(n1670), .B(n1061), .Y(n1065) );
  INVX2TS U918 ( .A(n914), .Y(n915) );
  NAND2X2TS U919 ( .A(n914), .B(n894), .Y(n1540) );
  CMPR32X2TS U920 ( .A(n1462), .B(DMP_SFG[11]), .C(n1461), .CO(n1458), .S(
        n1463) );
  NAND2X2TS U921 ( .A(n1490), .B(n1218), .Y(n1222) );
  CMPR32X2TS U922 ( .A(n1475), .B(DMP_SFG[10]), .C(n1474), .CO(n1461), .S(
        n1476) );
  BUFX3TS U923 ( .A(Shift_reg_FLAGS_7[1]), .Y(n1576) );
  CMPR32X2TS U924 ( .A(n1483), .B(DMP_SFG[7]), .C(n977), .CO(
        DP_OP_285J48_122_2126_n74) );
  NOR3X1TS U925 ( .A(Raw_mant_NRM_SWR[17]), .B(Raw_mant_NRM_SWR[15]), .C(
        Raw_mant_NRM_SWR[16]), .Y(n1118) );
  OAI211XLTS U926 ( .A0(n1677), .A1(intDX_EWSW[3]), .B0(n1024), .C0(n1023), 
        .Y(n1027) );
  OAI21XLTS U927 ( .A0(Raw_mant_NRM_SWR[25]), .A1(n935), .B0(n934), .Y(n936)
         );
  AOI31XLTS U928 ( .A0(n941), .A1(Raw_mant_NRM_SWR[16]), .A2(n1674), .B0(n936), 
        .Y(n937) );
  OAI21XLTS U929 ( .A0(intDX_EWSW[23]), .A1(n1691), .B0(intDX_EWSW[22]), .Y(
        n1046) );
  OAI211XLTS U930 ( .A0(DMP_SFG[3]), .A1(n1466), .B0(n1464), .C0(DMP_SFG[2]), 
        .Y(n1465) );
  NOR2XLTS U931 ( .A(n1063), .B(n1089), .Y(n1064) );
  NOR2XLTS U932 ( .A(DMP_SFG[5]), .B(n1585), .Y(n1469) );
  NOR2XLTS U933 ( .A(n1673), .B(n873), .Y(n1198) );
  OR2X1TS U934 ( .A(n906), .B(n1127), .Y(n885) );
  OAI21XLTS U935 ( .A0(n1654), .A1(n1533), .B0(n968), .Y(n969) );
  CLKINVX3TS U936 ( .A(n1555), .Y(n1237) );
  NOR2X2TS U937 ( .A(n970), .B(n875), .Y(n1368) );
  INVX2TS U938 ( .A(n1090), .Y(n1077) );
  CLKINVX3TS U939 ( .A(n1245), .Y(n1568) );
  CLKINVX3TS U940 ( .A(n1576), .Y(n914) );
  OAI21XLTS U941 ( .A0(n1526), .A1(n908), .B0(n1378), .Y(n792) );
  OAI21XLTS U942 ( .A0(n1530), .A1(n910), .B0(n976), .Y(n787) );
  OAI21XLTS U943 ( .A0(n1504), .A1(n1060), .B0(n1502), .Y(n870) );
  OAI21XLTS U944 ( .A0(n1693), .A1(n1265), .B0(n1252), .Y(n560) );
  OAI211XLTS U945 ( .A0(n1343), .A1(n907), .B0(n1342), .C0(n1341), .Y(n773) );
  OAI21XLTS U946 ( .A0(n1693), .A1(n1312), .B0(n1285), .Y(n726) );
  OAI21XLTS U947 ( .A0(n1537), .A1(n907), .B0(n967), .Y(n779) );
  OAI21XLTS U948 ( .A0(n1214), .A1(n1402), .B0(n1213), .Y(n466) );
  OAI21XLTS U949 ( .A0(n1596), .A1(n1402), .B0(n1194), .Y(n479) );
  OAI211XLTS U950 ( .A0(n1347), .A1(n910), .B0(n1335), .C0(n1334), .Y(n776) );
  OAI21XLTS U951 ( .A0(n1634), .A1(n1383), .B0(n1382), .Y(n793) );
  OAI211XLTS U952 ( .A0(n1540), .A1(n882), .B0(n1488), .C0(n1226), .Y(n767) );
  OAI211XLTS U953 ( .A0(n1069), .A1(n1187), .B0(n1569), .C0(n1068), .Y(n757)
         );
  OAI21XLTS U954 ( .A0(n1679), .A1(n1261), .B0(n1260), .Y(n592) );
  OAI21XLTS U955 ( .A0(n1688), .A1(n1312), .B0(n1305), .Y(n733) );
  INVX4TS U956 ( .A(n1661), .Y(n1387) );
  OAI21X1TS U957 ( .A0(n1309), .A1(n908), .B0(n1308), .Y(n789) );
  OAI211X1TS U958 ( .A0(n1363), .A1(n911), .B0(n1362), .C0(n1361), .Y(n782) );
  AOI2BB1X1TS U959 ( .A0N(n1576), .A1N(LZD_output_NRM2_EW[3]), .B0(n1542), .Y(
        n516) );
  OAI21X1TS U960 ( .A0(n1659), .A1(n875), .B0(n950), .Y(n951) );
  OAI21X1TS U961 ( .A0(n1709), .A1(n875), .B0(n1374), .Y(n1375) );
  CLKMX2X2TS U962 ( .A(Raw_mant_NRM_SWR[24]), .B(n1432), .S0(n1451), .Y(n518)
         );
  AO22X1TS U963 ( .A0(n1500), .A1(n1499), .B0(final_result_ieee[30]), .B1(
        n1507), .Y(n754) );
  AO22X1TS U964 ( .A0(final_result_ieee[10]), .A1(n1610), .B0(n1595), .B1(
        n1589), .Y(n511) );
  AND2X2TS U965 ( .A(n1499), .B(n1091), .Y(n927) );
  INVX4TS U966 ( .A(n1319), .Y(n1566) );
  NAND2X4TS U967 ( .A(n1126), .B(n881), .Y(n1219) );
  AND2X2TS U968 ( .A(n1699), .B(n1093), .Y(n1094) );
  INVX1TS U969 ( .A(n1089), .Y(n1073) );
  OAI21X1TS U970 ( .A0(busy), .A1(n1617), .B0(n914), .Y(n829) );
  INVX4TS U971 ( .A(n906), .Y(n1617) );
  INVX4TS U972 ( .A(n1555), .Y(n1402) );
  NOR2X1TS U973 ( .A(n1002), .B(intDY_EWSW[10]), .Y(n1003) );
  NOR2X1TS U974 ( .A(n1672), .B(n873), .Y(n1078) );
  OAI21X1TS U975 ( .A0(intDX_EWSW[15]), .A1(n1643), .B0(intDX_EWSW[14]), .Y(
        n1009) );
  OAI21X1TS U976 ( .A0(intDX_EWSW[21]), .A1(n1681), .B0(intDX_EWSW[20]), .Y(
        n1039) );
  NOR2X1TS U977 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .Y(n1385) );
  OAI21X1TS U978 ( .A0(n1309), .A1(n911), .B0(n972), .Y(n791) );
  OAI211X1TS U979 ( .A0(n1318), .A1(n911), .B0(n1317), .C0(n1316), .Y(n772) );
  OAI211X1TS U980 ( .A0(n1339), .A1(n908), .B0(n1338), .C0(n1337), .Y(n777) );
  AOI222X1TS U981 ( .A0(Raw_mant_NRM_SWR[16]), .A1(n898), .B0(n918), .B1(
        DmP_mant_SHT1_SW[7]), .C0(n1360), .C1(DmP_mant_SHT1_SW[8]), .Y(n1356)
         );
  OAI21X1TS U982 ( .A0(n1704), .A1(n1533), .B0(n1532), .Y(n1534) );
  AND2X2TS U983 ( .A(n965), .B(n1540), .Y(n879) );
  OAI21X1TS U984 ( .A0(n1639), .A1(n1222), .B0(n1221), .Y(n1223) );
  INVX4TS U985 ( .A(n1531), .Y(n875) );
  OAI211X1TS U986 ( .A0(n1495), .A1(n1494), .B0(n1493), .C0(n1492), .Y(n1496)
         );
  NAND4X1TS U987 ( .A(n1124), .B(n1123), .C(n1221), .D(n1492), .Y(n1125) );
  AO22X1TS U988 ( .A0(n1595), .A1(n1590), .B0(final_result_ieee[11]), .B1(
        n1701), .Y(n510) );
  AO22X1TS U989 ( .A0(n1595), .A1(n1593), .B0(final_result_ieee[8]), .B1(n1610), .Y(n507) );
  AO22X1TS U990 ( .A0(n1595), .A1(n1592), .B0(final_result_ieee[12]), .B1(
        n1701), .Y(n508) );
  AO22X1TS U991 ( .A0(n1595), .A1(n1591), .B0(final_result_ieee[9]), .B1(n1701), .Y(n509) );
  AO22X1TS U992 ( .A0(n1595), .A1(n1594), .B0(final_result_ieee[13]), .B1(
        n1701), .Y(n506) );
  OAI211X1TS U993 ( .A0(n1077), .A1(n1187), .B0(n1569), .C0(n1076), .Y(n755)
         );
  OAI211X1TS U994 ( .A0(n1073), .A1(n1187), .B0(n1569), .C0(n1072), .Y(n756)
         );
  OAI211X1TS U995 ( .A0(n1191), .A1(n1610), .B0(n1569), .C0(n1190), .Y(n760)
         );
  OAI211X1TS U996 ( .A0(n1075), .A1(n1187), .B0(n1569), .C0(n1074), .Y(n758)
         );
  OAI211X1TS U997 ( .A0(n1071), .A1(n1187), .B0(n1569), .C0(n1070), .Y(n759)
         );
  OAI211X1TS U998 ( .A0(n1189), .A1(n1610), .B0(n1569), .C0(n1188), .Y(n761)
         );
  INVX1TS U999 ( .A(n1501), .Y(n1500) );
  OAI21X1TS U1000 ( .A0(n1645), .A1(n1568), .B0(n1280), .Y(n724) );
  OAI21X1TS U1001 ( .A0(n1644), .A1(n1566), .B0(n1322), .Y(n566) );
  OAI21X1TS U1002 ( .A0(n1765), .A1(n1568), .B0(n1273), .Y(n752) );
  OAI21X1TS U1003 ( .A0(n1641), .A1(n1279), .B0(n1276), .Y(n748) );
  NOR2X6TS U1004 ( .A(n1219), .B(n930), .Y(n957) );
  OAI21X1TS U1005 ( .A0(n1690), .A1(n1568), .B0(n1272), .Y(n725) );
  OAI21X1TS U1006 ( .A0(n1677), .A1(n1279), .B0(n1059), .Y(n750) );
  OAI21X1TS U1007 ( .A0(n1643), .A1(n1301), .B0(n1293), .Y(n738) );
  OAI21X1TS U1008 ( .A0(n1668), .A1(n1301), .B0(n1295), .Y(n746) );
  OAI21X1TS U1009 ( .A0(n1688), .A1(n1566), .B0(n1320), .Y(n570) );
  OAI21X1TS U1010 ( .A0(n1667), .A1(n1261), .B0(n1247), .Y(n598) );
  OAI21X1TS U1011 ( .A0(n1678), .A1(n1312), .B0(n1289), .Y(n736) );
  OAI21X1TS U1012 ( .A0(n1686), .A1(n1301), .B0(n1288), .Y(n739) );
  OAI21X1TS U1013 ( .A0(n1765), .A1(n1261), .B0(n1250), .Y(n608) );
  OAI21X1TS U1014 ( .A0(n1646), .A1(n1566), .B0(n1323), .Y(n572) );
  OAI21X1TS U1015 ( .A0(n1684), .A1(n1279), .B0(n1275), .Y(n749) );
  OAI21X1TS U1016 ( .A0(n1687), .A1(n1265), .B0(n1244), .Y(n578) );
  OAI21X1TS U1017 ( .A0(n1646), .A1(n1312), .B0(n1303), .Y(n734) );
  OAI21X1TS U1018 ( .A0(n1683), .A1(n1279), .B0(n1278), .Y(n751) );
  OAI21X1TS U1019 ( .A0(n1685), .A1(n1265), .B0(n1259), .Y(n586) );
  OAI21X1TS U1020 ( .A0(n1694), .A1(n1312), .B0(n1281), .Y(n735) );
  OAI21X1TS U1021 ( .A0(n1660), .A1(n1301), .B0(n1292), .Y(n742) );
  OAI21X1TS U1022 ( .A0(n1641), .A1(n1261), .B0(n1248), .Y(n600) );
  OAI21X1TS U1023 ( .A0(n1679), .A1(n1301), .B0(n1296), .Y(n744) );
  OAI21X1TS U1024 ( .A0(n1667), .A1(n1279), .B0(n1277), .Y(n747) );
  OAI21X1TS U1025 ( .A0(n1681), .A1(n1566), .B0(n1321), .Y(n568) );
  OAI21X1TS U1026 ( .A0(n1660), .A1(n1265), .B0(n1257), .Y(n588) );
  OAI21X1TS U1027 ( .A0(n1270), .A1(n1554), .B0(n1267), .Y(n1268) );
  OAI21X1TS U1028 ( .A0(n1678), .A1(n1265), .B0(n1241), .Y(n576) );
  OAI21X1TS U1029 ( .A0(n1642), .A1(n1261), .B0(n1242), .Y(n610) );
  NOR2X6TS U1030 ( .A(Raw_mant_NRM_SWR[12]), .B(n938), .Y(n1126) );
  INVX1TS U1031 ( .A(n1284), .Y(n1267) );
  OAI21X1TS U1032 ( .A0(n1597), .A1(n1240), .B0(n1197), .Y(n480) );
  NAND2BX1TS U1033 ( .AN(n1090), .B(n1064), .Y(n1067) );
  OAI21X1TS U1034 ( .A0(n1206), .A1(n1240), .B0(n1205), .Y(n463) );
  AOI222X1TS U1035 ( .A0(n1599), .A1(n906), .B0(Data_array_SWR[7]), .B1(n900), 
        .C0(n1598), .C1(n1112), .Y(n1236) );
  AOI222X1TS U1036 ( .A0(n1599), .A1(n905), .B0(Data_array_SWR[7]), .B1(n904), 
        .C0(n1598), .C1(n1604), .Y(n1630) );
  AOI222X1TS U1037 ( .A0(n1603), .A1(n905), .B0(n904), .B1(Data_array_SWR[5]), 
        .C0(n1602), .C1(n1604), .Y(n1626) );
  NOR2X6TS U1038 ( .A(Raw_mant_NRM_SWR[13]), .B(n1122), .Y(n959) );
  AOI222X1TS U1039 ( .A0(n1606), .A1(n905), .B0(n904), .B1(Data_array_SWR[4]), 
        .C0(n1605), .C1(n1604), .Y(n1623) );
  OAI21X1TS U1040 ( .A0(n1415), .A1(n1418), .B0(n1419), .Y(n985) );
  OAI21X1TS U1041 ( .A0(n1612), .A1(n1402), .B0(n1212), .Y(n464) );
  OR2X2TS U1042 ( .A(n1617), .B(n1127), .Y(n884) );
  OAI21X1TS U1043 ( .A0(n1216), .A1(n1402), .B0(n1215), .Y(n465) );
  NOR2X1TS U1044 ( .A(n1414), .B(n1418), .Y(n986) );
  OAI21X1TS U1045 ( .A0(n1038), .A1(n1037), .B0(n1036), .Y(n1056) );
  NAND4BX1TS U1046 ( .AN(exp_rslt_NRM2_EW1[4]), .B(n1062), .C(n1075), .D(n1071), .Y(n1063) );
  AO22XLTS U1047 ( .A0(n1517), .A1(add_subt), .B0(n1515), .B1(intAS), .Y(n830)
         );
  BUFX3TS U1048 ( .A(n1527), .Y(n1313) );
  AOI32X1TS U1049 ( .A0(Shift_amount_SHT1_EWR[2]), .A1(n1540), .A2(n914), .B0(
        shift_value_SHT2_EWR[2]), .B1(n1113), .Y(n1539) );
  OAI211X1TS U1050 ( .A0(n995), .A1(n1148), .B0(n994), .C0(n993), .Y(n1000) );
  NOR2BX4TS U1051 ( .AN(Shift_amount_SHT1_EWR[0]), .B(n915), .Y(n1527) );
  INVX3TS U1052 ( .A(n1620), .Y(n1629) );
  OR2X2TS U1053 ( .A(n915), .B(Shift_amount_SHT1_EWR[0]), .Y(n949) );
  INVX2TS U1054 ( .A(n1555), .Y(n1240) );
  CLKBUFX3TS U1055 ( .A(n1085), .Y(n902) );
  OAI211X1TS U1056 ( .A0(intDX_EWSW[8]), .A1(n1682), .B0(n1017), .C0(n1016), 
        .Y(n1018) );
  INVX3TS U1057 ( .A(n989), .Y(n1588) );
  NAND2BX1TS U1058 ( .AN(n954), .B(n953), .Y(n956) );
  AOI211X1TS U1059 ( .A0(intDY_EWSW[16]), .A1(n1656), .B0(n1045), .C0(n1155), 
        .Y(n1035) );
  CLKBUFX3TS U1060 ( .A(n1390), .Y(n901) );
  NOR2X1TS U1061 ( .A(n1186), .B(exp_rslt_NRM2_EW1[1]), .Y(n1062) );
  INVX1TS U1062 ( .A(n1118), .Y(n1120) );
  OAI211X2TS U1063 ( .A0(intDX_EWSW[12]), .A1(n1685), .B0(n1013), .C0(n1004), 
        .Y(n1015) );
  OAI211X2TS U1064 ( .A0(intDX_EWSW[20]), .A1(n1688), .B0(n1050), .C0(n1034), 
        .Y(n1045) );
  NOR2X1TS U1065 ( .A(n1053), .B(intDY_EWSW[24]), .Y(n991) );
  NAND3X1TS U1066 ( .A(n1689), .B(n992), .C(intDX_EWSW[26]), .Y(n994) );
  NOR2X4TS U1067 ( .A(shift_value_SHT2_EWR[4]), .B(n1108), .Y(n1085) );
  NOR2X1TS U1068 ( .A(n1666), .B(n873), .Y(n1116) );
  NAND3X1TS U1069 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1640), .C(
        n1669), .Y(n1502) );
  INVX2TS U1070 ( .A(n883), .Y(n876) );
  INVX4TS U1071 ( .A(Shift_reg_FLAGS_7[2]), .Y(n989) );
  CLKINVX2TS U1072 ( .A(Shift_reg_FLAGS_7[3]), .Y(n1386) );
  NAND2BX1TS U1073 ( .AN(intDX_EWSW[27]), .B(intDY_EWSW[27]), .Y(n992) );
  NOR2X1TS U1074 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[20]), .Y(n953) );
  NAND2BX1TS U1075 ( .AN(intDY_EWSW[27]), .B(intDX_EWSW[27]), .Y(n993) );
  NAND2BX1TS U1076 ( .AN(intDX_EWSW[21]), .B(intDY_EWSW[21]), .Y(n1034) );
  INVX1TS U1077 ( .A(DmP_mant_SFG_SWR[6]), .Y(n1627) );
  NAND2BX1TS U1078 ( .AN(intDX_EWSW[19]), .B(intDY_EWSW[19]), .Y(n1042) );
  NAND2BX1TS U1079 ( .AN(intDX_EWSW[24]), .B(intDY_EWSW[24]), .Y(n1051) );
  INVX1TS U1080 ( .A(DmP_mant_SFG_SWR[4]), .Y(n1622) );
  OR2X2TS U1081 ( .A(Raw_mant_NRM_SWR[25]), .B(Raw_mant_NRM_SWR[24]), .Y(n880)
         );
  NAND2BX1TS U1082 ( .AN(intDX_EWSW[13]), .B(intDY_EWSW[13]), .Y(n1004) );
  NAND2BX1TS U1083 ( .AN(Raw_mant_NRM_SWR[9]), .B(n1632), .Y(n930) );
  NAND2BX1TS U1084 ( .AN(intDX_EWSW[9]), .B(intDY_EWSW[9]), .Y(n1017) );
  NOR2X8TS U1085 ( .A(n948), .B(n1575), .Y(n1531) );
  AOI222X4TS U1086 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n897), .B0(n917), .B1(
        DmP_mant_SHT1_SW[6]), .C0(n1360), .C1(DmP_mant_SHT1_SW[7]), .Y(n1339)
         );
  ADDFHX2TS U1087 ( .A(n1450), .B(DMP_SFG[13]), .CI(n1449), .CO(n1456), .S(
        n1452) );
  ADDFHX2TS U1088 ( .A(n1459), .B(DMP_SFG[12]), .CI(n1458), .CO(n1449), .S(
        n1460) );
  NAND2BXLTS U1089 ( .AN(intDY_EWSW[9]), .B(intDX_EWSW[9]), .Y(n1006) );
  NAND3XLTS U1090 ( .A(n1682), .B(n1017), .C(intDX_EWSW[8]), .Y(n1005) );
  AOI21X1TS U1091 ( .A0(n940), .A1(Raw_mant_NRM_SWR[6]), .B0(n939), .Y(n946)
         );
  NAND2BXLTS U1092 ( .AN(intDX_EWSW[2]), .B(intDY_EWSW[2]), .Y(n1023) );
  NAND2BX1TS U1093 ( .AN(n942), .B(n960), .Y(n945) );
  INVX2TS U1094 ( .A(n1123), .Y(n942) );
  NOR2X4TS U1095 ( .A(n929), .B(n880), .Y(n1489) );
  NAND2X1TS U1096 ( .A(Raw_mant_NRM_SWR[12]), .B(n959), .Y(n1123) );
  NAND3X1TS U1097 ( .A(n1121), .B(n1491), .C(Raw_mant_NRM_SWR[1]), .Y(n1221)
         );
  AO21XLTS U1098 ( .A0(n1633), .A1(n1704), .B0(n1122), .Y(n1492) );
  INVX4TS U1099 ( .A(n1661), .Y(n1200) );
  AOI21X1TS U1100 ( .A0(n1407), .A1(n1410), .B0(n983), .Y(n1415) );
  NAND2X1TS U1101 ( .A(n1408), .B(n1410), .Y(n1414) );
  NAND2X1TS U1102 ( .A(n1454), .B(n1445), .Y(n1433) );
  CLKBUFX2TS U1103 ( .A(n1245), .Y(n1287) );
  AOI222X1TS U1104 ( .A0(Raw_mant_NRM_SWR[20]), .A1(n898), .B0(n917), .B1(
        DmP_mant_SHT1_SW[3]), .C0(n1360), .C1(DmP_mant_SHT1_SW[4]), .Y(n1347)
         );
  AOI222X1TS U1105 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n898), .B0(n917), .B1(
        DmP_mant_SHT1_SW[2]), .C0(n1360), .C1(DmP_mant_SHT1_SW[3]), .Y(n1343)
         );
  INVX2TS U1106 ( .A(n1383), .Y(n1353) );
  NAND2X2TS U1107 ( .A(n970), .B(n1531), .Y(n1383) );
  NOR2X4TS U1108 ( .A(n926), .B(n1501), .Y(n1595) );
  AOI222X1TS U1109 ( .A0(n1603), .A1(n1401), .B0(Data_array_SWR[5]), .B1(n900), 
        .C0(n1602), .C1(n1112), .Y(n1232) );
  AO22XLTS U1110 ( .A0(n903), .A1(Data_array_SWR[8]), .B0(n1195), .B1(n905), 
        .Y(n1196) );
  AO22XLTS U1111 ( .A0(n903), .A1(Data_array_SWR[9]), .B0(n1192), .B1(n1617), 
        .Y(n1193) );
  INVX2TS U1112 ( .A(n1415), .Y(n1416) );
  INVX2TS U1113 ( .A(n1418), .Y(n1420) );
  OAI21X1TS U1114 ( .A0(n1434), .A1(n1437), .B0(n1438), .Y(n1407) );
  NOR2X1TS U1115 ( .A(n1433), .B(n1437), .Y(n1408) );
  INVX2TS U1116 ( .A(n1434), .Y(n1435) );
  INVX2TS U1117 ( .A(n1437), .Y(n1439) );
  INVX2TS U1118 ( .A(n1284), .Y(n1265) );
  BUFX3TS U1119 ( .A(n1245), .Y(n1263) );
  INVX2TS U1120 ( .A(n1284), .Y(n1261) );
  NAND4XLTS U1121 ( .A(n1169), .B(n1168), .C(n1167), .D(n1166), .Y(n1179) );
  NAND4XLTS U1122 ( .A(n1153), .B(n1152), .C(n1151), .D(n1150), .Y(n1181) );
  NAND4XLTS U1123 ( .A(n1177), .B(n1176), .C(n1175), .D(n1174), .Y(n1178) );
  INVX2TS U1124 ( .A(n1287), .Y(n1301) );
  BUFX3TS U1125 ( .A(n1284), .Y(n1302) );
  INVX2TS U1126 ( .A(n1287), .Y(n1312) );
  AO22XLTS U1127 ( .A0(n1512), .A1(Data_X[10]), .B0(n1511), .B1(intDX_EWSW[10]), .Y(n852) );
  AO22XLTS U1128 ( .A0(n1513), .A1(Data_X[30]), .B0(n1515), .B1(intDX_EWSW[30]), .Y(n832) );
  AO22XLTS U1129 ( .A0(n1512), .A1(Data_X[22]), .B0(n1523), .B1(intDX_EWSW[22]), .Y(n840) );
  AO22XLTS U1130 ( .A0(n1514), .A1(Data_X[14]), .B0(n1511), .B1(intDX_EWSW[14]), .Y(n848) );
  AO22XLTS U1131 ( .A0(n1513), .A1(Data_X[20]), .B0(n1523), .B1(intDX_EWSW[20]), .Y(n842) );
  AO22XLTS U1132 ( .A0(n1512), .A1(Data_X[12]), .B0(n1511), .B1(intDX_EWSW[12]), .Y(n850) );
  AO22XLTS U1133 ( .A0(n1513), .A1(Data_X[31]), .B0(n1515), .B1(intDX_EWSW[31]), .Y(n831) );
  AO22XLTS U1134 ( .A0(n1512), .A1(Data_X[19]), .B0(n1523), .B1(intDX_EWSW[19]), .Y(n843) );
  AO22XLTS U1135 ( .A0(n1513), .A1(Data_X[29]), .B0(n1515), .B1(intDX_EWSW[29]), .Y(n833) );
  AO22XLTS U1136 ( .A0(n1524), .A1(Data_X[18]), .B0(n1523), .B1(intDX_EWSW[18]), .Y(n844) );
  AO22XLTS U1137 ( .A0(n1513), .A1(Data_X[9]), .B0(n1511), .B1(intDX_EWSW[9]), 
        .Y(n853) );
  AO22XLTS U1138 ( .A0(n1512), .A1(Data_X[11]), .B0(n1511), .B1(intDX_EWSW[11]), .Y(n851) );
  AO22XLTS U1139 ( .A0(n1513), .A1(Data_X[8]), .B0(n1511), .B1(intDX_EWSW[8]), 
        .Y(n854) );
  AO22XLTS U1140 ( .A0(n1512), .A1(Data_X[17]), .B0(n1523), .B1(intDX_EWSW[17]), .Y(n845) );
  AO22XLTS U1141 ( .A0(n1512), .A1(Data_X[13]), .B0(n1511), .B1(intDX_EWSW[13]), .Y(n849) );
  AO22XLTS U1142 ( .A0(n1513), .A1(Data_X[21]), .B0(n1523), .B1(intDX_EWSW[21]), .Y(n841) );
  AO22XLTS U1143 ( .A0(n1512), .A1(Data_X[15]), .B0(n1523), .B1(intDX_EWSW[15]), .Y(n847) );
  AO22XLTS U1144 ( .A0(n1516), .A1(intDY_EWSW[2]), .B0(n1519), .B1(Data_Y[2]), 
        .Y(n826) );
  AO22XLTS U1145 ( .A0(n1520), .A1(Data_X[5]), .B0(n1511), .B1(intDX_EWSW[5]), 
        .Y(n857) );
  AO22XLTS U1146 ( .A0(n1520), .A1(Data_X[6]), .B0(n1511), .B1(intDX_EWSW[6]), 
        .Y(n856) );
  AO22XLTS U1147 ( .A0(n1513), .A1(Data_X[7]), .B0(n1511), .B1(intDX_EWSW[7]), 
        .Y(n855) );
  AO22XLTS U1148 ( .A0(n1512), .A1(Data_X[16]), .B0(n1523), .B1(intDX_EWSW[16]), .Y(n846) );
  AO22XLTS U1149 ( .A0(n1522), .A1(intDY_EWSW[29]), .B0(n1521), .B1(Data_Y[29]), .Y(n799) );
  AO22XLTS U1150 ( .A0(n1522), .A1(intDY_EWSW[30]), .B0(n1521), .B1(Data_Y[30]), .Y(n798) );
  AO22XLTS U1151 ( .A0(n1522), .A1(intDY_EWSW[21]), .B0(n1519), .B1(Data_Y[21]), .Y(n807) );
  AO22XLTS U1152 ( .A0(n1522), .A1(intDY_EWSW[22]), .B0(n1520), .B1(Data_Y[22]), .Y(n806) );
  AO22XLTS U1153 ( .A0(n1516), .A1(intDY_EWSW[3]), .B0(n1519), .B1(Data_Y[3]), 
        .Y(n825) );
  AO22XLTS U1154 ( .A0(n1516), .A1(intDY_EWSW[8]), .B0(n1520), .B1(Data_Y[8]), 
        .Y(n820) );
  AO22XLTS U1155 ( .A0(n1518), .A1(intDY_EWSW[11]), .B0(n1520), .B1(Data_Y[11]), .Y(n817) );
  AO22XLTS U1156 ( .A0(n1518), .A1(intDY_EWSW[15]), .B0(n1521), .B1(Data_Y[15]), .Y(n813) );
  AO22XLTS U1157 ( .A0(n1518), .A1(intDY_EWSW[17]), .B0(n1521), .B1(Data_Y[17]), .Y(n811) );
  AO22XLTS U1158 ( .A0(n1518), .A1(intDY_EWSW[18]), .B0(n1521), .B1(Data_Y[18]), .Y(n810) );
  AO22XLTS U1159 ( .A0(n1518), .A1(intDY_EWSW[12]), .B0(n1519), .B1(Data_Y[12]), .Y(n816) );
  AO22XLTS U1160 ( .A0(n1518), .A1(intDY_EWSW[13]), .B0(n1521), .B1(Data_Y[13]), .Y(n815) );
  AO22XLTS U1161 ( .A0(n1518), .A1(intDY_EWSW[14]), .B0(n1521), .B1(Data_Y[14]), .Y(n814) );
  AO22XLTS U1162 ( .A0(n1518), .A1(intDY_EWSW[20]), .B0(n1519), .B1(Data_Y[20]), .Y(n808) );
  AO22XLTS U1163 ( .A0(n1522), .A1(intDY_EWSW[28]), .B0(n1517), .B1(Data_Y[28]), .Y(n800) );
  AO22XLTS U1164 ( .A0(n1512), .A1(Data_X[28]), .B0(n1515), .B1(intDX_EWSW[28]), .Y(n834) );
  AO22XLTS U1165 ( .A0(n1516), .A1(intDY_EWSW[5]), .B0(n1519), .B1(Data_Y[5]), 
        .Y(n823) );
  AO22XLTS U1166 ( .A0(n1516), .A1(intDY_EWSW[4]), .B0(n1519), .B1(Data_Y[4]), 
        .Y(n824) );
  AO22XLTS U1167 ( .A0(n1516), .A1(intDY_EWSW[6]), .B0(n1519), .B1(Data_Y[6]), 
        .Y(n822) );
  AO22XLTS U1168 ( .A0(n1518), .A1(intDY_EWSW[16]), .B0(n1521), .B1(Data_Y[16]), .Y(n812) );
  AO22XLTS U1169 ( .A0(n1516), .A1(intDY_EWSW[9]), .B0(n1520), .B1(Data_Y[9]), 
        .Y(n819) );
  AO22XLTS U1170 ( .A0(n1516), .A1(intDY_EWSW[0]), .B0(n1520), .B1(Data_Y[0]), 
        .Y(n828) );
  AO22XLTS U1171 ( .A0(n1516), .A1(intDY_EWSW[1]), .B0(n1519), .B1(Data_Y[1]), 
        .Y(n827) );
  AO22XLTS U1172 ( .A0(n1516), .A1(intDY_EWSW[10]), .B0(n1520), .B1(Data_Y[10]), .Y(n818) );
  AO22XLTS U1173 ( .A0(n1518), .A1(intDY_EWSW[19]), .B0(n1521), .B1(Data_Y[19]), .Y(n809) );
  AO22XLTS U1174 ( .A0(n1515), .A1(intDY_EWSW[7]), .B0(n1519), .B1(Data_Y[7]), 
        .Y(n821) );
  AOI222X1TS U1175 ( .A0(intDY_EWSW[4]), .A1(n1637), .B0(n1027), .B1(n1026), 
        .C0(intDY_EWSW[5]), .C1(n1651), .Y(n1029) );
  AOI2BB2XLTS U1176 ( .B0(intDX_EWSW[3]), .B1(n1677), .A0N(intDY_EWSW[2]), 
        .A1N(n1025), .Y(n1026) );
  AOI2BB1XLTS U1177 ( .A0N(n932), .A1N(Raw_mant_NRM_SWR[23]), .B0(
        Raw_mant_NRM_SWR[24]), .Y(n935) );
  OAI2BB2XLTS U1178 ( .B0(n1008), .B1(n1015), .A0N(n1007), .A1N(n1016), .Y(
        n1011) );
  NOR2BX1TS U1179 ( .AN(n1019), .B(n1018), .Y(n1033) );
  INVX2TS U1180 ( .A(n1015), .Y(n1019) );
  INVX2TS U1181 ( .A(n947), .Y(n912) );
  CLKAND2X2TS U1182 ( .A(n1101), .B(shift_value_SHT2_EWR[4]), .Y(n1103) );
  NAND2X1TS U1183 ( .A(n1101), .B(n882), .Y(n1127) );
  NOR2XLTS U1184 ( .A(Raw_mant_NRM_SWR[17]), .B(Raw_mant_NRM_SWR[16]), .Y(n952) );
  NOR2XLTS U1185 ( .A(n1040), .B(intDY_EWSW[16]), .Y(n1041) );
  AOI211X1TS U1186 ( .A0(intDY_EWSW[28]), .A1(n1658), .B0(n998), .C0(n996), 
        .Y(n1052) );
  NOR2BX1TS U1187 ( .AN(n1035), .B(n1040), .Y(n1036) );
  NOR2BX1TS U1188 ( .AN(n1033), .B(n1032), .Y(n1037) );
  INVX2TS U1189 ( .A(n1014), .Y(n1038) );
  INVX2TS U1190 ( .A(n947), .Y(n896) );
  INVX4TS U1191 ( .A(n912), .Y(n913) );
  NOR2X1TS U1192 ( .A(n1117), .B(n1116), .Y(intadd_50_B_1_) );
  NOR2XLTS U1193 ( .A(n1661), .B(n1115), .Y(n1117) );
  NAND4XLTS U1194 ( .A(n1161), .B(n1160), .C(n1159), .D(n1158), .Y(n1180) );
  BUFX3TS U1195 ( .A(n1631), .Y(n1555) );
  AO21XLTS U1196 ( .A0(n1580), .A1(DMP_SFG[1]), .B0(n1579), .Y(n1185) );
  OAI21XLTS U1197 ( .A0(n1633), .A1(n1533), .B0(n1528), .Y(n1529) );
  INVX2TS U1198 ( .A(n1504), .Y(n1503) );
  CLKMX2X2TS U1199 ( .A(DP_OP_285J48_122_2126_n71), .B(
        DP_OP_285J48_122_2126_n70), .S0(DP_OP_285J48_122_2126_n74), .Y(n1474)
         );
  NAND2X1TS U1200 ( .A(n1662), .B(LZD_output_NRM2_EW[0]), .Y(
        DP_OP_15J48_123_3372_n8) );
  AOI222X1TS U1201 ( .A0(n1606), .A1(n1401), .B0(Data_array_SWR[4]), .B1(n900), 
        .C0(n1605), .C1(n1112), .Y(n1234) );
  AOI222X1TS U1202 ( .A0(n1195), .A1(n906), .B0(Data_array_SWR[8]), .B1(n900), 
        .C0(n1207), .C1(n1112), .Y(n1239) );
  AOI222X1TS U1203 ( .A0(n1192), .A1(n1401), .B0(Data_array_SWR[9]), .B1(n900), 
        .C0(n1201), .C1(n1112), .Y(n1228) );
  INVX2TS U1204 ( .A(n1489), .Y(n1494) );
  AOI21X1TS U1205 ( .A0(n1456), .A1(n986), .B0(n985), .Y(n1404) );
  CLKBUFX2TS U1206 ( .A(n1631), .Y(n1620) );
  MX2X1TS U1207 ( .A(n1387), .B(OP_FLAG_SHT2), .S0(n1403), .Y(n549) );
  AO21XLTS U1208 ( .A0(LZD_output_NRM2_EW[0]), .A1(n914), .B0(n890), .Y(n515)
         );
  AOI2BB2XLTS U1209 ( .B0(n1572), .B1(n1543), .A0N(Shift_amount_SHT1_EWR[0]), 
        .A1N(n1552), .Y(n766) );
  AO22XLTS U1210 ( .A0(n1572), .A1(DmP_EXP_EWSW[20]), .B0(n1570), .B1(
        DmP_mant_SHT1_SW[20]), .Y(n569) );
  AO22XLTS U1211 ( .A0(n1572), .A1(DmP_EXP_EWSW[16]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[16]), .Y(n577) );
  AO22XLTS U1212 ( .A0(n921), .A1(DmP_EXP_EWSW[7]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[7]), .Y(n595) );
  AO22XLTS U1213 ( .A0(n1572), .A1(DmP_EXP_EWSW[18]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[18]), .Y(n573) );
  AO22XLTS U1214 ( .A0(n921), .A1(DmP_EXP_EWSW[13]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n583) );
  AO22XLTS U1215 ( .A0(n1563), .A1(DmP_EXP_EWSW[4]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[4]), .Y(n601) );
  AO22XLTS U1216 ( .A0(n921), .A1(DmP_EXP_EWSW[14]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[14]), .Y(n581) );
  AO22XLTS U1217 ( .A0(n1572), .A1(DmP_EXP_EWSW[19]), .B0(n1570), .B1(
        DmP_mant_SHT1_SW[19]), .Y(n571) );
  AO22XLTS U1218 ( .A0(n921), .A1(DmP_EXP_EWSW[11]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[11]), .Y(n587) );
  AO22XLTS U1219 ( .A0(n921), .A1(DmP_EXP_EWSW[9]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[9]), .Y(n591) );
  AO22XLTS U1220 ( .A0(n1636), .A1(DmP_EXP_EWSW[6]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n597) );
  AO22XLTS U1221 ( .A0(n1563), .A1(DmP_EXP_EWSW[2]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n605) );
  AO22XLTS U1222 ( .A0(n1572), .A1(DmP_EXP_EWSW[21]), .B0(n1570), .B1(
        DmP_mant_SHT1_SW[21]), .Y(n567) );
  AO22XLTS U1223 ( .A0(n1563), .A1(DmP_EXP_EWSW[5]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[5]), .Y(n599) );
  AO22XLTS U1224 ( .A0(n1563), .A1(DmP_EXP_EWSW[1]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n607) );
  AO22XLTS U1225 ( .A0(n921), .A1(DmP_EXP_EWSW[15]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[15]), .Y(n579) );
  AO22XLTS U1226 ( .A0(n1572), .A1(DmP_EXP_EWSW[22]), .B0(n1570), .B1(
        DmP_mant_SHT1_SW[22]), .Y(n565) );
  AO22XLTS U1227 ( .A0(n921), .A1(DmP_EXP_EWSW[12]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[12]), .Y(n585) );
  AO22XLTS U1228 ( .A0(n921), .A1(DmP_EXP_EWSW[10]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[10]), .Y(n589) );
  AO22XLTS U1229 ( .A0(n921), .A1(DmP_EXP_EWSW[8]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[8]), .Y(n593) );
  AO22XLTS U1230 ( .A0(n1563), .A1(DmP_EXP_EWSW[3]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[3]), .Y(n603) );
  OAI222X1TS U1231 ( .A0(n1713), .A1(n1540), .B0(n910), .B1(n1537), .C0(n907), 
        .C1(n1536), .Y(n781) );
  AO22XLTS U1232 ( .A0(n1524), .A1(Data_X[0]), .B0(n1510), .B1(intDX_EWSW[0]), 
        .Y(n862) );
  AO22XLTS U1233 ( .A0(n1524), .A1(Data_X[2]), .B0(n1510), .B1(intDX_EWSW[2]), 
        .Y(n860) );
  MX2X1TS U1234 ( .A(n1591), .B(DmP_mant_SFG_SWR[11]), .S0(n1402), .Y(n477) );
  MX2X1TS U1235 ( .A(n1589), .B(DmP_mant_SFG_SWR[12]), .S0(n1402), .Y(n476) );
  MX2X1TS U1236 ( .A(n1590), .B(DmP_mant_SFG_SWR[13]), .S0(n1402), .Y(n475) );
  MX2X1TS U1237 ( .A(n1592), .B(DmP_mant_SFG_SWR[14]), .S0(n1402), .Y(n474) );
  MX2X1TS U1238 ( .A(n1594), .B(DmP_mant_SFG_SWR[15]), .S0(n1402), .Y(n473) );
  AO22XLTS U1239 ( .A0(n1524), .A1(Data_Y[31]), .B0(n1523), .B1(intDY_EWSW[31]), .Y(n797) );
  AO22XLTS U1240 ( .A0(n1555), .A1(DMP_SHT2_EWSW[0]), .B0(n1562), .B1(
        DMP_SFG[0]), .Y(n717) );
  OAI21XLTS U1241 ( .A0(n1240), .A1(n1236), .B0(n1235), .Y(n470) );
  OAI21XLTS U1242 ( .A0(n1240), .A1(n1232), .B0(n1231), .Y(n468) );
  MX2X1TS U1243 ( .A(n1593), .B(DmP_mant_SFG_SWR[10]), .S0(n1402), .Y(n478) );
  MX2X1TS U1244 ( .A(DMP_SFG[19]), .B(DMP_SHT2_EWSW[19]), .S0(n1555), .Y(n660)
         );
  MX2X1TS U1245 ( .A(DMP_SFG[20]), .B(DMP_SHT2_EWSW[20]), .S0(n1555), .Y(n657)
         );
  MX2X1TS U1246 ( .A(DMP_SFG[22]), .B(DMP_SHT2_EWSW[22]), .S0(n1403), .Y(n651)
         );
  MX2X1TS U1247 ( .A(DMP_SFG[10]), .B(DMP_SHT2_EWSW[10]), .S0(n1555), .Y(n687)
         );
  MX2X1TS U1248 ( .A(DMP_SFG[12]), .B(DMP_SHT2_EWSW[12]), .S0(n1403), .Y(n681)
         );
  MX2X1TS U1249 ( .A(DMP_exp_NRM2_EW[1]), .B(DMP_exp_NRM_EW[1]), .S0(n1576), 
        .Y(n641) );
  MX2X1TS U1250 ( .A(DMP_exp_NRM2_EW[2]), .B(DMP_exp_NRM_EW[2]), .S0(n915), 
        .Y(n636) );
  MX2X1TS U1251 ( .A(DMP_exp_NRM2_EW[3]), .B(DMP_exp_NRM_EW[3]), .S0(n1576), 
        .Y(n631) );
  MX2X1TS U1252 ( .A(DMP_exp_NRM2_EW[4]), .B(DMP_exp_NRM_EW[4]), .S0(n915), 
        .Y(n626) );
  MX2X1TS U1253 ( .A(DMP_SFG[13]), .B(DMP_SHT2_EWSW[13]), .S0(n1555), .Y(n678)
         );
  MX2X1TS U1254 ( .A(DMP_SFG[21]), .B(DMP_SHT2_EWSW[21]), .S0(n1403), .Y(n654)
         );
  OAI21XLTS U1255 ( .A0(n1691), .A1(n1312), .B0(n1286), .Y(n730) );
  AO22XLTS U1256 ( .A0(n1552), .A1(n1547), .B0(n1571), .B1(
        Shift_amount_SHT1_EWR[1]), .Y(n765) );
  MX2X1TS U1257 ( .A(DMP_SFG[15]), .B(DMP_SHT2_EWSW[15]), .S0(n1624), .Y(n672)
         );
  MX2X1TS U1258 ( .A(DMP_SFG[17]), .B(DMP_SHT2_EWSW[17]), .S0(n1631), .Y(n666)
         );
  AO22XLTS U1259 ( .A0(n1572), .A1(DmP_EXP_EWSW[17]), .B0(n1565), .B1(
        DmP_mant_SHT1_SW[17]), .Y(n575) );
  MX2X1TS U1260 ( .A(DMP_SFG[14]), .B(DMP_SHT2_EWSW[14]), .S0(n1555), .Y(n675)
         );
  MX2X1TS U1261 ( .A(DMP_SFG[6]), .B(DMP_SHT2_EWSW[6]), .S0(n1403), .Y(n699)
         );
  MX2X1TS U1262 ( .A(DMP_SFG[9]), .B(DMP_SHT2_EWSW[9]), .S0(n1403), .Y(n690)
         );
  MX2X1TS U1263 ( .A(DMP_SFG[16]), .B(DMP_SHT2_EWSW[16]), .S0(n1403), .Y(n669)
         );
  MX2X1TS U1264 ( .A(DMP_SFG[18]), .B(DMP_SHT2_EWSW[18]), .S0(n1403), .Y(n663)
         );
  MX2X1TS U1265 ( .A(DMP_SFG[11]), .B(DMP_SHT2_EWSW[11]), .S0(n1555), .Y(n684)
         );
  MX2X1TS U1266 ( .A(DMP_SFG[8]), .B(DMP_SHT2_EWSW[8]), .S0(n1403), .Y(n693)
         );
  AO22XLTS U1267 ( .A0(n1624), .A1(DMP_SHT2_EWSW[1]), .B0(n1562), .B1(
        DMP_SFG[1]), .Y(n714) );
  AO22XLTS U1268 ( .A0(n1615), .A1(DMP_SHT2_EWSW[5]), .B0(n1574), .B1(
        DMP_SFG[5]), .Y(n702) );
  OAI211XLTS U1269 ( .A0(n1343), .A1(n911), .B0(n1330), .C0(n1329), .Y(n775)
         );
  OAI211XLTS U1270 ( .A0(n1356), .A1(n907), .B0(n1350), .C0(n1349), .Y(n778)
         );
  MX2X1TS U1271 ( .A(DMP_SFG[7]), .B(DMP_SHT2_EWSW[7]), .S0(n1403), .Y(n696)
         );
  AOI2BB2XLTS U1272 ( .B0(n1588), .B1(intadd_50_SUM_0_), .A0N(
        Raw_mant_NRM_SWR[4]), .A1N(n1584), .Y(n538) );
  OAI222X1TS U1273 ( .A0(n1705), .A1(n1540), .B0(n910), .B1(n1536), .C0(n908), 
        .C1(n1535), .Y(n783) );
  OAI222X1TS U1274 ( .A0(n1540), .A1(n1706), .B0(n911), .B1(n1535), .C0(n907), 
        .C1(n1530), .Y(n785) );
  AO22XLTS U1275 ( .A0(n1513), .A1(Data_X[27]), .B0(n1515), .B1(intDX_EWSW[27]), .Y(n835) );
  AO22XLTS U1276 ( .A0(n1524), .A1(Data_X[1]), .B0(n1510), .B1(intDX_EWSW[1]), 
        .Y(n861) );
  MX2X1TS U1277 ( .A(Raw_mant_NRM_SWR[10]), .B(n1478), .S0(n1486), .Y(n532) );
  MX2X1TS U1278 ( .A(Raw_mant_NRM_SWR[9]), .B(n1484), .S0(n1486), .Y(n533) );
  NAND3XLTS U1279 ( .A(busy), .B(Shift_amount_SHT1_EWR[4]), .C(n877), .Y(n1226) );
  AO22XLTS U1280 ( .A0(n1513), .A1(Data_X[23]), .B0(n1523), .B1(intDX_EWSW[23]), .Y(n839) );
  AO22XLTS U1281 ( .A0(n1524), .A1(Data_X[3]), .B0(n1510), .B1(intDX_EWSW[3]), 
        .Y(n859) );
  CLKMX2X2TS U1282 ( .A(Raw_mant_NRM_SWR[25]), .B(n990), .S0(n1451), .Y(n517)
         );
  MX2X1TS U1283 ( .A(Raw_mant_NRM_SWR[22]), .B(n1426), .S0(n1451), .Y(n520) );
  MX2X1TS U1284 ( .A(Raw_mant_NRM_SWR[17]), .B(n1448), .S0(n1451), .Y(n525) );
  AO22XLTS U1285 ( .A0(n1522), .A1(intDY_EWSW[25]), .B0(n1517), .B1(Data_Y[25]), .Y(n803) );
  AO22XLTS U1286 ( .A0(n1522), .A1(intDY_EWSW[26]), .B0(n1517), .B1(Data_Y[26]), .Y(n802) );
  AO22XLTS U1287 ( .A0(n1522), .A1(intDY_EWSW[23]), .B0(n1517), .B1(Data_Y[23]), .Y(n805) );
  AO22XLTS U1288 ( .A0(n1515), .A1(intDX_EWSW[25]), .B0(n1520), .B1(Data_X[25]), .Y(n837) );
  AO22XLTS U1289 ( .A0(n1515), .A1(intDX_EWSW[24]), .B0(n1521), .B1(Data_X[24]), .Y(n838) );
  MX2X1TS U1290 ( .A(Raw_mant_NRM_SWR[8]), .B(n1481), .S0(n1486), .Y(n534) );
  AO22XLTS U1291 ( .A0(n1524), .A1(Data_X[4]), .B0(n1510), .B1(intDX_EWSW[4]), 
        .Y(n858) );
  AO22XLTS U1292 ( .A0(n1522), .A1(intDY_EWSW[24]), .B0(n1517), .B1(Data_Y[24]), .Y(n804) );
  AO22XLTS U1293 ( .A0(n1522), .A1(intDY_EWSW[27]), .B0(n1514), .B1(Data_Y[27]), .Y(n801) );
  AO22XLTS U1294 ( .A0(n1515), .A1(intDX_EWSW[26]), .B0(n1520), .B1(Data_X[26]), .Y(n836) );
  AO22XLTS U1295 ( .A0(n1562), .A1(DMP_SFG[3]), .B0(n1624), .B1(
        DMP_SHT2_EWSW[3]), .Y(n708) );
  AO22XLTS U1296 ( .A0(n1629), .A1(DMP_SFG[4]), .B0(n1624), .B1(
        DMP_SHT2_EWSW[4]), .Y(n705) );
  MX2X1TS U1297 ( .A(Raw_mant_NRM_SWR[14]), .B(n1460), .S0(n1486), .Y(n528) );
  AO21XLTS U1298 ( .A0(n1577), .A1(n886), .B0(n1580), .Y(n1578) );
  AOI2BB2XLTS U1299 ( .B0(beg_OP), .B1(n1640), .A0N(n1640), .A1N(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .Y(n1060) );
  MX2X1TS U1300 ( .A(DMP_exp_NRM2_EW[0]), .B(DMP_exp_NRM_EW[0]), .S0(n1576), 
        .Y(n646) );
  MX2X1TS U1301 ( .A(DMP_exp_NRM2_EW[5]), .B(DMP_exp_NRM_EW[5]), .S0(n915), 
        .Y(n621) );
  MX2X1TS U1302 ( .A(DMP_exp_NRM2_EW[6]), .B(DMP_exp_NRM_EW[6]), .S0(n1576), 
        .Y(n616) );
  MX2X1TS U1303 ( .A(DMP_exp_NRM2_EW[7]), .B(DMP_exp_NRM_EW[7]), .S0(n915), 
        .Y(n611) );
  MX2X1TS U1304 ( .A(Raw_mant_NRM_SWR[12]), .B(n1476), .S0(n1486), .Y(n530) );
  AO22XLTS U1305 ( .A0(Shift_reg_FLAGS_7[0]), .A1(ZERO_FLAG_SHT1SHT2), .B0(
        n1610), .B1(zero_flag), .Y(n552) );
  MX2X1TS U1306 ( .A(Raw_mant_NRM_SWR[11]), .B(n1473), .S0(n1486), .Y(n531) );
  MX2X1TS U1307 ( .A(Raw_mant_NRM_SWR[13]), .B(n1463), .S0(n1486), .Y(n529) );
  AO21XLTS U1308 ( .A0(LZD_output_NRM2_EW[1]), .A1(n1575), .B0(n1498), .Y(n513) );
  MX2X1TS U1309 ( .A(Raw_mant_NRM_SWR[23]), .B(n1429), .S0(n1451), .Y(n519) );
  MX2X1TS U1310 ( .A(Raw_mant_NRM_SWR[21]), .B(n1406), .S0(n1451), .Y(n521) );
  MX2X1TS U1311 ( .A(Raw_mant_NRM_SWR[20]), .B(n1423), .S0(n1451), .Y(n522) );
  MX2X1TS U1312 ( .A(Raw_mant_NRM_SWR[19]), .B(n1413), .S0(n1451), .Y(n523) );
  MX2X1TS U1313 ( .A(Raw_mant_NRM_SWR[18]), .B(n1442), .S0(n1451), .Y(n524) );
  MX2X1TS U1314 ( .A(Raw_mant_NRM_SWR[16]), .B(n1457), .S0(n1486), .Y(n526) );
  MX2X1TS U1315 ( .A(Raw_mant_NRM_SWR[15]), .B(n1452), .S0(n1451), .Y(n527) );
  AO22XLTS U1316 ( .A0(Shift_reg_FLAGS_7[1]), .A1(SIGN_FLAG_NRM), .B0(n914), 
        .B1(SIGN_FLAG_SHT1SHT2), .Y(n544) );
  AO22XLTS U1317 ( .A0(n1584), .A1(SIGN_FLAG_SFG), .B0(n1582), .B1(
        SIGN_FLAG_NRM), .Y(n545) );
  AO22XLTS U1318 ( .A0(n1620), .A1(SIGN_FLAG_SHT2), .B0(n1574), .B1(
        SIGN_FLAG_SFG), .Y(n546) );
  AO22XLTS U1319 ( .A0(n920), .A1(SIGN_FLAG_SHT1), .B0(n1764), .B1(
        SIGN_FLAG_SHT2), .Y(n547) );
  AO22XLTS U1320 ( .A0(n921), .A1(SIGN_FLAG_EXP), .B0(n1573), .B1(
        SIGN_FLAG_SHT1), .Y(n548) );
  AO22XLTS U1321 ( .A0(busy), .A1(OP_FLAG_SHT1), .B0(OP_FLAG_SHT2), .B1(n895), 
        .Y(n1716) );
  AO22XLTS U1322 ( .A0(n1572), .A1(OP_FLAG_EXP), .B0(n1571), .B1(OP_FLAG_SHT1), 
        .Y(n551) );
  AO22XLTS U1323 ( .A0(n915), .A1(ZERO_FLAG_NRM), .B0(n877), .B1(
        ZERO_FLAG_SHT1SHT2), .Y(n553) );
  AO22XLTS U1324 ( .A0(n1584), .A1(ZERO_FLAG_SFG), .B0(n1717), .B1(
        ZERO_FLAG_NRM), .Y(n554) );
  AO22XLTS U1325 ( .A0(n1624), .A1(ZERO_FLAG_SHT2), .B0(n1574), .B1(
        ZERO_FLAG_SFG), .Y(n555) );
  AO22XLTS U1326 ( .A0(n920), .A1(ZERO_FLAG_SHT1), .B0(n1764), .B1(
        ZERO_FLAG_SHT2), .Y(n556) );
  AO22XLTS U1327 ( .A0(n1572), .A1(ZERO_FLAG_EXP), .B0(n1570), .B1(
        ZERO_FLAG_SHT1), .Y(n557) );
  OAI21XLTS U1328 ( .A0(n1694), .A1(n1265), .B0(n1254), .Y(n574) );
  OAI21XLTS U1329 ( .A0(n1643), .A1(n1265), .B0(n1264), .Y(n580) );
  OAI21XLTS U1330 ( .A0(n1686), .A1(n1265), .B0(n1256), .Y(n582) );
  OAI21XLTS U1331 ( .A0(n1680), .A1(n1265), .B0(n1262), .Y(n584) );
  OAI21XLTS U1332 ( .A0(n1653), .A1(n1265), .B0(n1255), .Y(n590) );
  OAI21XLTS U1333 ( .A0(n1682), .A1(n1261), .B0(n1258), .Y(n594) );
  OAI21XLTS U1334 ( .A0(n1668), .A1(n1261), .B0(n1253), .Y(n596) );
  OAI21XLTS U1335 ( .A0(n1684), .A1(n1261), .B0(n1246), .Y(n602) );
  OAI21XLTS U1336 ( .A0(n1677), .A1(n1261), .B0(n1251), .Y(n604) );
  OAI21XLTS U1337 ( .A0(n1683), .A1(n1261), .B0(n1249), .Y(n606) );
  AO22XLTS U1338 ( .A0(n1563), .A1(DmP_EXP_EWSW[0]), .B0(n1564), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n609) );
  AO22XLTS U1339 ( .A0(n1588), .A1(DMP_SFG[30]), .B0(n1582), .B1(
        DMP_exp_NRM_EW[7]), .Y(n612) );
  AO22XLTS U1340 ( .A0(n1615), .A1(DMP_SHT2_EWSW[30]), .B0(n1562), .B1(
        DMP_SFG[30]), .Y(n613) );
  AO22XLTS U1341 ( .A0(n920), .A1(DMP_SHT1_EWSW[30]), .B0(n1764), .B1(
        DMP_SHT2_EWSW[30]), .Y(n614) );
  AO22XLTS U1342 ( .A0(n1563), .A1(DMP_EXP_EWSW[30]), .B0(n1564), .B1(
        DMP_SHT1_EWSW[30]), .Y(n615) );
  AO22XLTS U1343 ( .A0(n1584), .A1(DMP_SFG[29]), .B0(n1582), .B1(
        DMP_exp_NRM_EW[6]), .Y(n617) );
  AO22XLTS U1344 ( .A0(n1615), .A1(DMP_SHT2_EWSW[29]), .B0(n1562), .B1(
        DMP_SFG[29]), .Y(n618) );
  AO22XLTS U1345 ( .A0(n920), .A1(DMP_SHT1_EWSW[29]), .B0(n1764), .B1(
        DMP_SHT2_EWSW[29]), .Y(n619) );
  AO22XLTS U1346 ( .A0(n1563), .A1(DMP_EXP_EWSW[29]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[29]), .Y(n620) );
  AO22XLTS U1347 ( .A0(n1584), .A1(DMP_SFG[28]), .B0(n1582), .B1(
        DMP_exp_NRM_EW[5]), .Y(n622) );
  AO22XLTS U1348 ( .A0(n1615), .A1(DMP_SHT2_EWSW[28]), .B0(n1574), .B1(
        DMP_SFG[28]), .Y(n623) );
  AO22XLTS U1349 ( .A0(n920), .A1(DMP_SHT1_EWSW[28]), .B0(n1764), .B1(
        DMP_SHT2_EWSW[28]), .Y(n624) );
  AO22XLTS U1350 ( .A0(n1563), .A1(DMP_EXP_EWSW[28]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[28]), .Y(n625) );
  AO22XLTS U1351 ( .A0(n1584), .A1(DMP_SFG[27]), .B0(n1582), .B1(
        DMP_exp_NRM_EW[4]), .Y(n627) );
  AO22XLTS U1352 ( .A0(n1615), .A1(DMP_SHT2_EWSW[27]), .B0(n1562), .B1(
        DMP_SFG[27]), .Y(n628) );
  AO22XLTS U1353 ( .A0(busy), .A1(DMP_SHT1_EWSW[27]), .B0(n1764), .B1(
        DMP_SHT2_EWSW[27]), .Y(n629) );
  AO22XLTS U1354 ( .A0(n1563), .A1(DMP_EXP_EWSW[27]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[27]), .Y(n630) );
  AO22XLTS U1355 ( .A0(n1588), .A1(DMP_SFG[26]), .B0(n1582), .B1(
        DMP_exp_NRM_EW[3]), .Y(n632) );
  AO22XLTS U1356 ( .A0(n1615), .A1(DMP_SHT2_EWSW[26]), .B0(n1562), .B1(
        DMP_SFG[26]), .Y(n633) );
  AO22XLTS U1357 ( .A0(n1561), .A1(DMP_SHT1_EWSW[26]), .B0(n1764), .B1(
        DMP_SHT2_EWSW[26]), .Y(n634) );
  AO22XLTS U1358 ( .A0(n1552), .A1(DMP_EXP_EWSW[26]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[26]), .Y(n635) );
  AO22XLTS U1359 ( .A0(n1588), .A1(DMP_SFG[25]), .B0(n1582), .B1(
        DMP_exp_NRM_EW[2]), .Y(n637) );
  AO22XLTS U1360 ( .A0(n1615), .A1(DMP_SHT2_EWSW[25]), .B0(n1562), .B1(
        DMP_SFG[25]), .Y(n638) );
  AO22XLTS U1361 ( .A0(n893), .A1(DMP_SHT1_EWSW[25]), .B0(n894), .B1(
        DMP_SHT2_EWSW[25]), .Y(n639) );
  AO22XLTS U1362 ( .A0(n1636), .A1(DMP_EXP_EWSW[25]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[25]), .Y(n640) );
  AO22XLTS U1363 ( .A0(n1584), .A1(DMP_SFG[24]), .B0(n1582), .B1(
        DMP_exp_NRM_EW[1]), .Y(n642) );
  AO22XLTS U1364 ( .A0(n1615), .A1(DMP_SHT2_EWSW[24]), .B0(n1562), .B1(
        DMP_SFG[24]), .Y(n643) );
  AO22XLTS U1365 ( .A0(n1561), .A1(DMP_SHT1_EWSW[24]), .B0(n1764), .B1(
        DMP_SHT2_EWSW[24]), .Y(n644) );
  AO22XLTS U1366 ( .A0(n1636), .A1(DMP_EXP_EWSW[24]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[24]), .Y(n645) );
  AO22XLTS U1367 ( .A0(n1588), .A1(DMP_SFG[23]), .B0(n1717), .B1(
        DMP_exp_NRM_EW[0]), .Y(n647) );
  AO22XLTS U1368 ( .A0(n1615), .A1(DMP_SHT2_EWSW[23]), .B0(n1562), .B1(
        DMP_SFG[23]), .Y(n648) );
  AO22XLTS U1369 ( .A0(n1561), .A1(DMP_SHT1_EWSW[23]), .B0(n894), .B1(
        DMP_SHT2_EWSW[23]), .Y(n649) );
  AO22XLTS U1370 ( .A0(n1636), .A1(DMP_EXP_EWSW[23]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[23]), .Y(n650) );
  AO22XLTS U1371 ( .A0(n1561), .A1(DMP_SHT1_EWSW[22]), .B0(n894), .B1(
        DMP_SHT2_EWSW[22]), .Y(n652) );
  AO22XLTS U1372 ( .A0(n1636), .A1(DMP_EXP_EWSW[22]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[22]), .Y(n653) );
  AO22XLTS U1373 ( .A0(n1561), .A1(DMP_SHT1_EWSW[21]), .B0(n894), .B1(
        DMP_SHT2_EWSW[21]), .Y(n655) );
  AO22XLTS U1374 ( .A0(n1636), .A1(DMP_EXP_EWSW[21]), .B0(n1573), .B1(
        DMP_SHT1_EWSW[21]), .Y(n656) );
  AO22XLTS U1375 ( .A0(n1561), .A1(DMP_SHT1_EWSW[20]), .B0(n894), .B1(
        DMP_SHT2_EWSW[20]), .Y(n658) );
  AO22XLTS U1376 ( .A0(n1636), .A1(DMP_EXP_EWSW[20]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[20]), .Y(n659) );
  AO22XLTS U1377 ( .A0(n1561), .A1(DMP_SHT1_EWSW[19]), .B0(n894), .B1(
        DMP_SHT2_EWSW[19]), .Y(n661) );
  AO22XLTS U1378 ( .A0(n1636), .A1(DMP_EXP_EWSW[19]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[19]), .Y(n662) );
  AO22XLTS U1379 ( .A0(n1561), .A1(DMP_SHT1_EWSW[18]), .B0(n894), .B1(
        DMP_SHT2_EWSW[18]), .Y(n664) );
  AO22XLTS U1380 ( .A0(n1636), .A1(DMP_EXP_EWSW[18]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[18]), .Y(n665) );
  AO22XLTS U1381 ( .A0(n1561), .A1(DMP_SHT1_EWSW[17]), .B0(n894), .B1(
        DMP_SHT2_EWSW[17]), .Y(n667) );
  AO22XLTS U1382 ( .A0(n1559), .A1(DMP_EXP_EWSW[17]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[17]), .Y(n668) );
  AO22XLTS U1383 ( .A0(n1561), .A1(DMP_SHT1_EWSW[16]), .B0(n894), .B1(
        DMP_SHT2_EWSW[16]), .Y(n670) );
  AO22XLTS U1384 ( .A0(n1559), .A1(DMP_EXP_EWSW[16]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[16]), .Y(n671) );
  AO22XLTS U1385 ( .A0(n893), .A1(DMP_SHT1_EWSW[15]), .B0(n895), .B1(
        DMP_SHT2_EWSW[15]), .Y(n673) );
  AO22XLTS U1386 ( .A0(n1559), .A1(DMP_EXP_EWSW[15]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[15]), .Y(n674) );
  AO22XLTS U1387 ( .A0(n893), .A1(DMP_SHT1_EWSW[14]), .B0(n895), .B1(
        DMP_SHT2_EWSW[14]), .Y(n676) );
  AO22XLTS U1388 ( .A0(n1559), .A1(DMP_EXP_EWSW[14]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[14]), .Y(n677) );
  AO22XLTS U1389 ( .A0(n893), .A1(DMP_SHT1_EWSW[13]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[13]), .Y(n679) );
  AO22XLTS U1390 ( .A0(n1559), .A1(DMP_EXP_EWSW[13]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[13]), .Y(n680) );
  AO22XLTS U1391 ( .A0(n893), .A1(DMP_SHT1_EWSW[12]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[12]), .Y(n682) );
  AO22XLTS U1392 ( .A0(n1559), .A1(DMP_EXP_EWSW[12]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[12]), .Y(n683) );
  AO22XLTS U1393 ( .A0(n893), .A1(DMP_SHT1_EWSW[11]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[11]), .Y(n685) );
  AO22XLTS U1394 ( .A0(n1559), .A1(DMP_EXP_EWSW[11]), .B0(n1560), .B1(
        DMP_SHT1_EWSW[11]), .Y(n686) );
  AO22XLTS U1395 ( .A0(n893), .A1(DMP_SHT1_EWSW[10]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[10]), .Y(n688) );
  AO22XLTS U1396 ( .A0(n1559), .A1(DMP_EXP_EWSW[10]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[10]), .Y(n689) );
  AO22XLTS U1397 ( .A0(n893), .A1(DMP_SHT1_EWSW[9]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[9]), .Y(n691) );
  AO22XLTS U1398 ( .A0(n1559), .A1(DMP_EXP_EWSW[9]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[9]), .Y(n692) );
  AO22XLTS U1399 ( .A0(n920), .A1(DMP_SHT1_EWSW[8]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[8]), .Y(n694) );
  AO22XLTS U1400 ( .A0(n1559), .A1(DMP_EXP_EWSW[8]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[8]), .Y(n695) );
  AO22XLTS U1401 ( .A0(n920), .A1(DMP_SHT1_EWSW[7]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[7]), .Y(n697) );
  AO22XLTS U1402 ( .A0(n1556), .A1(DMP_EXP_EWSW[7]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[7]), .Y(n698) );
  AO22XLTS U1403 ( .A0(busy), .A1(DMP_SHT1_EWSW[6]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[6]), .Y(n700) );
  AO22XLTS U1404 ( .A0(n1556), .A1(DMP_EXP_EWSW[6]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[6]), .Y(n701) );
  AO22XLTS U1405 ( .A0(busy), .A1(DMP_SHT1_EWSW[5]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[5]), .Y(n703) );
  AO22XLTS U1406 ( .A0(n1556), .A1(DMP_EXP_EWSW[5]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[5]), .Y(n704) );
  AO22XLTS U1407 ( .A0(n920), .A1(DMP_SHT1_EWSW[4]), .B0(n1558), .B1(
        DMP_SHT2_EWSW[4]), .Y(n706) );
  AO22XLTS U1408 ( .A0(n1556), .A1(DMP_EXP_EWSW[4]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[4]), .Y(n707) );
  AO22XLTS U1409 ( .A0(n920), .A1(DMP_SHT1_EWSW[3]), .B0(n895), .B1(
        DMP_SHT2_EWSW[3]), .Y(n709) );
  AO22XLTS U1410 ( .A0(n1556), .A1(DMP_EXP_EWSW[3]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[3]), .Y(n710) );
  AO22XLTS U1411 ( .A0(n1629), .A1(DMP_SFG[2]), .B0(n1624), .B1(
        DMP_SHT2_EWSW[2]), .Y(n711) );
  AO22XLTS U1412 ( .A0(n920), .A1(DMP_SHT1_EWSW[2]), .B0(n895), .B1(
        DMP_SHT2_EWSW[2]), .Y(n712) );
  AO22XLTS U1413 ( .A0(n1556), .A1(DMP_EXP_EWSW[2]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[2]), .Y(n713) );
  AO22XLTS U1414 ( .A0(busy), .A1(DMP_SHT1_EWSW[1]), .B0(n895), .B1(
        DMP_SHT2_EWSW[1]), .Y(n715) );
  AO22XLTS U1415 ( .A0(n1556), .A1(DMP_EXP_EWSW[1]), .B0(n1557), .B1(
        DMP_SHT1_EWSW[1]), .Y(n716) );
  AO22XLTS U1416 ( .A0(busy), .A1(DMP_SHT1_EWSW[0]), .B0(n895), .B1(
        DMP_SHT2_EWSW[0]), .Y(n718) );
  AO22XLTS U1417 ( .A0(n1556), .A1(DMP_EXP_EWSW[0]), .B0(n1714), .B1(
        DMP_SHT1_EWSW[0]), .Y(n719) );
  AO22XLTS U1418 ( .A0(n1271), .A1(n1553), .B0(ZERO_FLAG_EXP), .B1(n1554), .Y(
        n721) );
  AO21XLTS U1419 ( .A0(OP_FLAG_EXP), .A1(n1554), .B0(n1553), .Y(n722) );
  OAI21XLTS U1420 ( .A0(n1692), .A1(n1312), .B0(n1283), .Y(n723) );
  OAI21XLTS U1421 ( .A0(n1644), .A1(n1312), .B0(n1304), .Y(n731) );
  OAI21XLTS U1422 ( .A0(n1681), .A1(n1312), .B0(n1311), .Y(n732) );
  OAI21XLTS U1423 ( .A0(n1687), .A1(n1301), .B0(n1300), .Y(n737) );
  OAI21XLTS U1424 ( .A0(n1680), .A1(n1301), .B0(n1294), .Y(n740) );
  OAI21XLTS U1425 ( .A0(n1685), .A1(n1301), .B0(n1290), .Y(n741) );
  OAI21XLTS U1426 ( .A0(n1653), .A1(n1301), .B0(n1298), .Y(n743) );
  OAI21XLTS U1427 ( .A0(n1682), .A1(n1301), .B0(n1291), .Y(n745) );
  OAI21XLTS U1428 ( .A0(n1642), .A1(n1312), .B0(n1299), .Y(n753) );
  AO22XLTS U1429 ( .A0(n1556), .A1(n1146), .B0(n1714), .B1(
        Shift_amount_SHT1_EWR[4]), .Y(n762) );
  AO22XLTS U1430 ( .A0(n1556), .A1(n1141), .B0(n1714), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n763) );
  AO22XLTS U1431 ( .A0(n1552), .A1(n1551), .B0(n1714), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n764) );
  AO22XLTS U1432 ( .A0(n1508), .A1(busy), .B0(n1506), .B1(Shift_reg_FLAGS_7[3]), .Y(n866) );
  AO22XLTS U1433 ( .A0(n1506), .A1(n1567), .B0(n1508), .B1(n1509), .Y(n869) );
  INVX2TS U1434 ( .A(n915), .Y(n1575) );
  BUFX3TS U1435 ( .A(left_right_SHT2), .Y(n1401) );
  INVX2TS U1436 ( .A(n1368), .Y(n891) );
  AND2X4TS U1437 ( .A(n1567), .B(n1058), .Y(n1284) );
  BUFX3TS U1438 ( .A(n1284), .Y(n1319) );
  BUFX3TS U1439 ( .A(n1084), .Y(n1390) );
  CLKINVX3TS U1440 ( .A(rst), .Y(n1137) );
  INVX2TS U1441 ( .A(n875), .Y(n890) );
  INVX2TS U1442 ( .A(n891), .Y(n892) );
  INVX2TS U1443 ( .A(n1764), .Y(n893) );
  INVX2TS U1444 ( .A(n893), .Y(n894) );
  INVX2TS U1445 ( .A(n893), .Y(n895) );
  INVX2TS U1446 ( .A(n896), .Y(n898) );
  INVX2TS U1447 ( .A(n884), .Y(n899) );
  INVX2TS U1448 ( .A(n884), .Y(n900) );
  INVX2TS U1449 ( .A(n885), .Y(n903) );
  INVX2TS U1450 ( .A(n885), .Y(n904) );
  INVX4TS U1451 ( .A(n1333), .Y(n907) );
  INVX4TS U1452 ( .A(n1333), .Y(n908) );
  INVX2TS U1453 ( .A(n879), .Y(n909) );
  INVX2TS U1454 ( .A(n879), .Y(n910) );
  INVX2TS U1455 ( .A(n879), .Y(n911) );
  NAND2X1TS U1456 ( .A(n1083), .B(n1082), .Y(n771) );
  BUFX3TS U1457 ( .A(n1137), .Y(n1138) );
  BUFX3TS U1458 ( .A(n1137), .Y(n1134) );
  CLKBUFX3TS U1459 ( .A(n1137), .Y(n1136) );
  NOR2X4TS U1460 ( .A(shift_value_SHT2_EWR[4]), .B(n1401), .Y(n1112) );
  AOI222X1TS U1461 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n913), .B0(n918), .B1(
        DmP_mant_SHT1_SW[15]), .C0(n1360), .C1(DmP_mant_SHT1_SW[16]), .Y(n1373) );
  AOI222X1TS U1462 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n913), .B0(n919), .B1(
        DmP_mant_SHT1_SW[17]), .C0(n1313), .C1(DmP_mant_SHT1_SW[18]), .Y(n1370) );
  AOI222X1TS U1463 ( .A0(Raw_mant_NRM_SWR[10]), .A1(n913), .B0(
        DmP_mant_SHT1_SW[14]), .B1(n1313), .C0(n918), .C1(DmP_mant_SHT1_SW[13]), .Y(n1364) );
  AOI222X1TS U1464 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n913), .B0(n918), .B1(
        DmP_mant_SHT1_SW[11]), .C0(n1360), .C1(DmP_mant_SHT1_SW[12]), .Y(n1367) );
  AOI222X1TS U1465 ( .A0(Raw_mant_NRM_SWR[14]), .A1(n913), .B0(n919), .B1(
        DmP_mant_SHT1_SW[9]), .C0(n1360), .C1(DmP_mant_SHT1_SW[10]), .Y(n1363)
         );
  AOI222X4TS U1466 ( .A0(Data_array_SWR[14]), .A1(n902), .B0(
        Data_array_SWR[22]), .B1(n876), .C0(Data_array_SWR[18]), .C1(n901), 
        .Y(n1400) );
  AOI222X4TS U1467 ( .A0(Data_array_SWR[23]), .A1(n874), .B0(
        Data_array_SWR[19]), .B1(n901), .C0(Data_array_SWR[15]), .C1(n902), 
        .Y(n1397) );
  AOI221X1TS U1468 ( .A0(n1653), .A1(intDX_EWSW[10]), .B0(intDX_EWSW[11]), 
        .B1(n1660), .C0(n1163), .Y(n1168) );
  AOI221X1TS U1469 ( .A0(intDX_EWSW[30]), .A1(n1692), .B0(intDX_EWSW[29]), 
        .B1(n1645), .C0(n997), .Y(n999) );
  AOI221X1TS U1470 ( .A0(n1692), .A1(intDX_EWSW[30]), .B0(intDX_EWSW[17]), 
        .B1(n1678), .C0(n1154), .Y(n1161) );
  NOR2X1TS U1471 ( .A(n1692), .B(intDX_EWSW[30]), .Y(n998) );
  OAI211XLTS U1472 ( .A0(n1367), .A1(n910), .B0(n1366), .C0(n1365), .Y(n784)
         );
  AOI221X1TS U1473 ( .A0(n1683), .A1(intDX_EWSW[2]), .B0(intDX_EWSW[3]), .B1(
        n1677), .C0(n1171), .Y(n1176) );
  AOI221X1TS U1474 ( .A0(n1644), .A1(intDX_EWSW[22]), .B0(intDX_EWSW[23]), 
        .B1(n1691), .C0(n1157), .Y(n1158) );
  AOI221X1TS U1475 ( .A0(n1686), .A1(intDX_EWSW[14]), .B0(intDX_EWSW[15]), 
        .B1(n1643), .C0(n1165), .Y(n1166) );
  AOI221X1TS U1476 ( .A0(n1688), .A1(intDX_EWSW[20]), .B0(intDX_EWSW[21]), 
        .B1(n1681), .C0(n1156), .Y(n1159) );
  AOI221X1TS U1477 ( .A0(n1685), .A1(intDX_EWSW[12]), .B0(intDX_EWSW[13]), 
        .B1(n1680), .C0(n1164), .Y(n1167) );
  INVX2TS U1478 ( .A(n1595), .Y(n916) );
  INVX2TS U1479 ( .A(n1595), .Y(n1611) );
  OAI21XLTS U1480 ( .A0(n1240), .A1(n1239), .B0(n1238), .Y(n471) );
  OAI21XLTS U1481 ( .A0(n1240), .A1(n1230), .B0(n1229), .Y(n469) );
  OAI21XLTS U1482 ( .A0(n1240), .A1(n1234), .B0(n1233), .Y(n467) );
  CLKXOR2X2TS U1483 ( .A(n1387), .B(DmP_mant_SFG_SWR[11]), .Y(
        DmP_mant_SFG_SWR_signed[11]) );
  XOR2X1TS U1484 ( .A(n1387), .B(DmP_mant_SFG_SWR[8]), .Y(n1480) );
  XOR2X1TS U1485 ( .A(n1387), .B(DmP_mant_SFG_SWR[9]), .Y(n1483) );
  XOR2X1TS U1486 ( .A(n1200), .B(DmP_mant_SFG_SWR[18]), .Y(n981) );
  XOR2X1TS U1487 ( .A(n1200), .B(DmP_mant_SFG_SWR[20]), .Y(n984) );
  NOR4X4TS U1488 ( .A(n964), .B(n963), .C(n1224), .D(n962), .Y(n970) );
  NOR4X2TS U1489 ( .A(n1181), .B(n1180), .C(n1179), .D(n1178), .Y(n1271) );
  AFHCINX2TS U1490 ( .CIN(n1427), .B(n1428), .A(DMP_SFG[21]), .S(n1429), .CO(
        n1430) );
  NOR2X2TS U1491 ( .A(n925), .B(DMP_EXP_EWSW[23]), .Y(n1546) );
  AOI21X2TS U1492 ( .A0(Shift_amount_SHT1_EWR[1]), .A1(n877), .B0(n1498), .Y(
        n965) );
  XNOR2X2TS U1493 ( .A(DMP_exp_NRM2_EW[0]), .B(n878), .Y(n1186) );
  BUFX3TS U1494 ( .A(n1137), .Y(n1139) );
  OR2X1TS U1495 ( .A(n978), .B(DMP_SFG[14]), .Y(n1454) );
  AND2X2TS U1496 ( .A(DMP_SFG[6]), .B(n1480), .Y(n977) );
  OAI2BB2XLTS U1497 ( .B0(n1470), .B1(n1469), .A0N(DMP_SFG[5]), .A1N(n1585), 
        .Y(n1479) );
  OAI21XLTS U1498 ( .A0(n1266), .A1(intDX_EWSW[31]), .B0(n1567), .Y(n1182) );
  AOI222X4TS U1499 ( .A0(n1601), .A1(left_right_SHT2), .B0(Data_array_SWR[6]), 
        .B1(n900), .C0(n1600), .C1(n1112), .Y(n1230) );
  INVX2TS U1500 ( .A(n949), .Y(n917) );
  INVX2TS U1501 ( .A(n949), .Y(n918) );
  INVX2TS U1502 ( .A(n949), .Y(n919) );
  AOI221X1TS U1503 ( .A0(n1694), .A1(intDX_EWSW[18]), .B0(intDX_EWSW[19]), 
        .B1(n1646), .C0(n1155), .Y(n1160) );
  AOI32X1TS U1504 ( .A0(n1694), .A1(n1042), .A2(intDX_EWSW[18]), .B0(
        intDX_EWSW[19]), .B1(n1646), .Y(n1043) );
  AOI221X1TS U1505 ( .A0(n1690), .A1(intDX_EWSW[28]), .B0(intDX_EWSW[29]), 
        .B1(n1645), .C0(n1149), .Y(n1151) );
  NOR2X1TS U1506 ( .A(n1645), .B(intDX_EWSW[29]), .Y(n996) );
  OAI211XLTS U1507 ( .A0(n1364), .A1(n911), .B0(n1352), .C0(n1351), .Y(n786)
         );
  NOR3X1TS U1508 ( .A(shift_value_SHT2_EWR[4]), .B(shift_value_SHT2_EWR[2]), 
        .C(n1652), .Y(n1084) );
  INVX2TS U1509 ( .A(n1764), .Y(n920) );
  OAI2BB2XLTS U1510 ( .B0(intDY_EWSW[0]), .B1(n1022), .A0N(intDX_EWSW[1]), 
        .A1N(n1765), .Y(n1024) );
  AOI22X1TS U1511 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n941), .B0(n1126), .B1(
        Raw_mant_NRM_SWR[10]), .Y(n960) );
  NOR2XLTS U1512 ( .A(n1660), .B(intDX_EWSW[11]), .Y(n1002) );
  NOR2XLTS U1513 ( .A(Raw_mant_NRM_SWR[8]), .B(Raw_mant_NRM_SWR[9]), .Y(n1220)
         );
  NOR2X1TS U1514 ( .A(n1678), .B(intDX_EWSW[17]), .Y(n1040) );
  BUFX3TS U1515 ( .A(n1636), .Y(n921) );
  NOR2X4TS U1516 ( .A(shift_value_SHT2_EWR[4]), .B(n1617), .Y(n1604) );
  OAI21XLTS U1517 ( .A0(intDX_EWSW[13]), .A1(n1680), .B0(intDX_EWSW[12]), .Y(
        n1001) );
  OA22X1TS U1518 ( .A0(n1686), .A1(intDX_EWSW[14]), .B0(n1643), .B1(
        intDX_EWSW[15]), .Y(n1013) );
  OA22X1TS U1519 ( .A0(n1644), .A1(intDX_EWSW[22]), .B0(n1691), .B1(
        intDX_EWSW[23]), .Y(n1050) );
  OAI21XLTS U1520 ( .A0(intDX_EWSW[3]), .A1(n1677), .B0(intDX_EWSW[2]), .Y(
        n1025) );
  NOR2X2TS U1521 ( .A(n1067), .B(n1499), .Y(n926) );
  OAI21XLTS U1522 ( .A0(intDX_EWSW[1]), .A1(n1765), .B0(intDX_EWSW[0]), .Y(
        n1022) );
  AND4X1TS U1523 ( .A(n1090), .B(n1089), .C(exp_rslt_NRM2_EW1[4]), .D(n1088), 
        .Y(n1091) );
  AOI2BB2X1TS U1524 ( .B0(n1000), .B1(n1052), .A0N(n999), .A1N(n998), .Y(n1057) );
  OR2X1TS U1525 ( .A(n979), .B(DMP_SFG[15]), .Y(n1445) );
  INVX2TS U1526 ( .A(n1101), .Y(n1107) );
  OR2X1TS U1527 ( .A(n982), .B(DMP_SFG[17]), .Y(n1410) );
  NAND2X2TS U1528 ( .A(n1576), .B(n948), .Y(n1533) );
  NOR2X1TS U1529 ( .A(n1079), .B(n1078), .Y(intadd_50_B_2_) );
  OAI21XLTS U1530 ( .A0(DmP_EXP_EWSW[25]), .A1(n924), .B0(n1548), .Y(n1549) );
  NOR2XLTS U1531 ( .A(n926), .B(SIGN_FLAG_SHT1SHT2), .Y(n1384) );
  XOR2X1TS U1532 ( .A(n988), .B(n987), .Y(n990) );
  BUFX3TS U1533 ( .A(n1514), .Y(n1524) );
  OAI211XLTS U1534 ( .A0(n1373), .A1(n910), .B0(n1372), .C0(n1371), .Y(n788)
         );
  OAI21XLTS U1535 ( .A0(n1240), .A1(n1228), .B0(n1227), .Y(n472) );
  OAI211XLTS U1536 ( .A0(n1347), .A1(n908), .B0(n1346), .C0(n1345), .Y(n774)
         );
  OAI211XLTS U1537 ( .A0(n1370), .A1(n910), .B0(n1358), .C0(n1357), .Y(n790)
         );
  NOR2X2TS U1538 ( .A(Raw_mant_NRM_SWR[22]), .B(Raw_mant_NRM_SWR[23]), .Y(n955) );
  INVX2TS U1539 ( .A(n955), .Y(n929) );
  NOR3X2TS U1540 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[19]), .C(
        Raw_mant_NRM_SWR[20]), .Y(n1495) );
  NAND2X2TS U1541 ( .A(n1489), .B(n1495), .Y(n931) );
  NOR2X2TS U1542 ( .A(Raw_mant_NRM_SWR[18]), .B(n931), .Y(n1119) );
  NAND2X2TS U1543 ( .A(n1119), .B(n1118), .Y(n933) );
  OR2X4TS U1544 ( .A(n933), .B(Raw_mant_NRM_SWR[14]), .Y(n1122) );
  NAND2X2TS U1545 ( .A(n959), .B(n1633), .Y(n938) );
  NAND2X4TS U1546 ( .A(n957), .B(n1655), .Y(n1217) );
  INVX2TS U1547 ( .A(n1217), .Y(n940) );
  INVX2TS U1548 ( .A(n931), .Y(n941) );
  AOI21X1TS U1549 ( .A0(n1675), .A1(Raw_mant_NRM_SWR[20]), .B0(
        Raw_mant_NRM_SWR[22]), .Y(n932) );
  NOR2X2TS U1550 ( .A(n1659), .B(n933), .Y(n964) );
  INVX2TS U1551 ( .A(n964), .Y(n934) );
  OAI31X1TS U1552 ( .A0(Raw_mant_NRM_SWR[9]), .A1(n938), .A2(n1632), .B0(n937), 
        .Y(n939) );
  OAI32X1TS U1553 ( .A0(Raw_mant_NRM_SWR[3]), .A1(Raw_mant_NRM_SWR[1]), .A2(
        n1639), .B0(n1634), .B1(Raw_mant_NRM_SWR[3]), .Y(n943) );
  NOR2X6TS U1554 ( .A(Raw_mant_NRM_SWR[6]), .B(n1217), .Y(n1490) );
  OAI211X1TS U1555 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n943), .B0(n1490), .C0(
        n1654), .Y(n944) );
  NAND2BX4TS U1556 ( .AN(n945), .B(n944), .Y(n1497) );
  NOR2BX4TS U1557 ( .AN(n946), .B(n1497), .Y(n948) );
  INVX2TS U1558 ( .A(n1533), .Y(n947) );
  AOI22X1TS U1559 ( .A0(n919), .A1(DmP_mant_SHT1_SW[8]), .B0(n1313), .B1(
        DmP_mant_SHT1_SW[9]), .Y(n950) );
  AOI21X1TS U1560 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n897), .B0(n951), .Y(n1537)
         );
  INVX2TS U1561 ( .A(n1540), .Y(n1359) );
  CLKBUFX2TS U1562 ( .A(n1359), .Y(n1113) );
  BUFX3TS U1563 ( .A(n1113), .Y(n1369) );
  AOI21X1TS U1564 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n952), .B0(
        Raw_mant_NRM_SWR[19]), .Y(n954) );
  AOI21X1TS U1565 ( .A0(n956), .A1(n955), .B0(n880), .Y(n963) );
  NOR2X1TS U1566 ( .A(Raw_mant_NRM_SWR[3]), .B(Raw_mant_NRM_SWR[2]), .Y(n1121)
         );
  NOR2X1TS U1567 ( .A(Raw_mant_NRM_SWR[4]), .B(Raw_mant_NRM_SWR[5]), .Y(n1218)
         );
  OAI21X1TS U1568 ( .A0(Raw_mant_NRM_SWR[6]), .A1(Raw_mant_NRM_SWR[7]), .B0(
        n957), .Y(n958) );
  OAI21X2TS U1569 ( .A0(n1121), .A1(n1222), .B0(n958), .Y(n1224) );
  INVX2TS U1570 ( .A(n959), .Y(n961) );
  OAI31X1TS U1571 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n1633), .A2(n961), .B0(n960), .Y(n962) );
  NOR2X4TS U1572 ( .A(n970), .B(n1575), .Y(n1498) );
  NOR2X4TS U1573 ( .A(n1369), .B(n965), .Y(n1333) );
  BUFX3TS U1574 ( .A(n1313), .Y(n1360) );
  AOI21X1TS U1575 ( .A0(n1369), .A1(Data_array_SWR[8]), .B0(n966), .Y(n967) );
  AOI22X1TS U1576 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n890), .B0(n1527), .B1(
        DmP_mant_SHT1_SW[19]), .Y(n968) );
  AOI21X1TS U1577 ( .A0(n919), .A1(DmP_mant_SHT1_SW[18]), .B0(n969), .Y(n1309)
         );
  OAI22X1TS U1578 ( .A0(n1379), .A1(n907), .B0(n1634), .B1(n891), .Y(n971) );
  AOI21X1TS U1579 ( .A0(n1369), .A1(Data_array_SWR[20]), .B0(n971), .Y(n972)
         );
  AOI22X1TS U1580 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n1531), .B0(
        DmP_mant_SHT1_SW[15]), .B1(n1360), .Y(n973) );
  OAI2BB1X1TS U1581 ( .A0N(Raw_mant_NRM_SWR[9]), .A1N(n913), .B0(n973), .Y(
        n974) );
  AOI21X1TS U1582 ( .A0(DmP_mant_SHT1_SW[14]), .A1(n917), .B0(n974), .Y(n1530)
         );
  OAI22X1TS U1583 ( .A0(n1306), .A1(n907), .B0(n1702), .B1(n891), .Y(n975) );
  AOI21X1TS U1584 ( .A0(n1369), .A1(Data_array_SWR[16]), .B0(n975), .Y(n976)
         );
  XOR2X1TS U1585 ( .A(n1200), .B(DmP_mant_SFG_SWR[24]), .Y(n1431) );
  XOR2X1TS U1586 ( .A(n1200), .B(DmP_mant_SFG_SWR[23]), .Y(n1428) );
  XOR2X1TS U1587 ( .A(n1200), .B(DmP_mant_SFG_SWR[22]), .Y(n1425) );
  XOR2X1TS U1588 ( .A(n1200), .B(DmP_mant_SFG_SWR[21]), .Y(n1405) );
  XOR2X1TS U1589 ( .A(n1387), .B(DmP_mant_SFG_SWR[15]), .Y(n1450) );
  XOR2X1TS U1590 ( .A(n1387), .B(DmP_mant_SFG_SWR[14]), .Y(n1459) );
  XOR2X1TS U1591 ( .A(n1387), .B(DmP_mant_SFG_SWR[13]), .Y(n1462) );
  XOR2X1TS U1592 ( .A(n1387), .B(DmP_mant_SFG_SWR[12]), .Y(n1475) );
  XOR2X1TS U1593 ( .A(n1200), .B(DmP_mant_SFG_SWR[16]), .Y(n978) );
  XOR2X1TS U1594 ( .A(n1200), .B(DmP_mant_SFG_SWR[17]), .Y(n979) );
  NOR2X2TS U1595 ( .A(n981), .B(DMP_SFG[16]), .Y(n1437) );
  XOR2X1TS U1596 ( .A(n1200), .B(DmP_mant_SFG_SWR[19]), .Y(n982) );
  NOR2X2TS U1597 ( .A(n984), .B(DMP_SFG[18]), .Y(n1418) );
  NAND2X1TS U1598 ( .A(n978), .B(DMP_SFG[14]), .Y(n1453) );
  INVX2TS U1599 ( .A(n1453), .Y(n1443) );
  NAND2X1TS U1600 ( .A(n979), .B(DMP_SFG[15]), .Y(n1444) );
  INVX2TS U1601 ( .A(n1444), .Y(n980) );
  AOI21X1TS U1602 ( .A0(n1445), .A1(n1443), .B0(n980), .Y(n1434) );
  NAND2X1TS U1603 ( .A(n981), .B(DMP_SFG[16]), .Y(n1438) );
  NAND2X1TS U1604 ( .A(n982), .B(DMP_SFG[17]), .Y(n1409) );
  INVX2TS U1605 ( .A(n1409), .Y(n983) );
  NAND2X1TS U1606 ( .A(n984), .B(DMP_SFG[18]), .Y(n1419) );
  XOR2X1TS U1607 ( .A(n1387), .B(DmP_mant_SFG_SWR[25]), .Y(n987) );
  INVX4TS U1608 ( .A(n989), .Y(n1451) );
  NOR2X1TS U1609 ( .A(n1676), .B(intDX_EWSW[25]), .Y(n1053) );
  AOI22X1TS U1610 ( .A0(intDX_EWSW[25]), .A1(n1676), .B0(intDX_EWSW[24]), .B1(
        n991), .Y(n995) );
  OAI21X2TS U1611 ( .A0(intDX_EWSW[26]), .A1(n1689), .B0(n992), .Y(n1148) );
  NOR3X1TS U1612 ( .A(n1658), .B(n996), .C(intDY_EWSW[28]), .Y(n997) );
  OAI2BB2XLTS U1613 ( .B0(intDY_EWSW[12]), .B1(n1001), .A0N(intDX_EWSW[13]), 
        .A1N(n1680), .Y(n1012) );
  AOI22X1TS U1614 ( .A0(intDX_EWSW[11]), .A1(n1660), .B0(intDX_EWSW[10]), .B1(
        n1003), .Y(n1008) );
  AOI21X1TS U1615 ( .A0(n1006), .A1(n1005), .B0(n1015), .Y(n1007) );
  OAI22X1TS U1616 ( .A0(n1653), .A1(intDX_EWSW[10]), .B0(n1660), .B1(
        intDX_EWSW[11]), .Y(n1163) );
  INVX2TS U1617 ( .A(n1163), .Y(n1016) );
  OAI2BB2XLTS U1618 ( .B0(intDY_EWSW[14]), .B1(n1009), .A0N(intDX_EWSW[15]), 
        .A1N(n1643), .Y(n1010) );
  AOI211X1TS U1619 ( .A0(n1013), .A1(n1012), .B0(n1011), .C0(n1010), .Y(n1014)
         );
  OAI2BB1X1TS U1620 ( .A0N(n1651), .A1N(intDY_EWSW[5]), .B0(intDX_EWSW[4]), 
        .Y(n1020) );
  OAI22X1TS U1621 ( .A0(intDY_EWSW[4]), .A1(n1020), .B0(n1651), .B1(
        intDY_EWSW[5]), .Y(n1031) );
  OAI2BB1X1TS U1622 ( .A0N(n1638), .A1N(intDY_EWSW[7]), .B0(intDX_EWSW[6]), 
        .Y(n1021) );
  OAI22X1TS U1623 ( .A0(intDY_EWSW[6]), .A1(n1021), .B0(n1638), .B1(
        intDY_EWSW[7]), .Y(n1030) );
  AOI22X1TS U1624 ( .A0(intDY_EWSW[7]), .A1(n1638), .B0(intDY_EWSW[6]), .B1(
        n1657), .Y(n1028) );
  OAI32X1TS U1625 ( .A0(n1031), .A1(n1030), .A2(n1029), .B0(n1028), .B1(n1030), 
        .Y(n1032) );
  OAI21X2TS U1626 ( .A0(intDX_EWSW[18]), .A1(n1694), .B0(n1042), .Y(n1155) );
  OAI2BB2XLTS U1627 ( .B0(intDY_EWSW[20]), .B1(n1039), .A0N(intDX_EWSW[21]), 
        .A1N(n1681), .Y(n1049) );
  AOI22X1TS U1628 ( .A0(intDX_EWSW[17]), .A1(n1678), .B0(intDX_EWSW[16]), .B1(
        n1041), .Y(n1044) );
  OAI32X1TS U1629 ( .A0(n1155), .A1(n1045), .A2(n1044), .B0(n1043), .B1(n1045), 
        .Y(n1048) );
  OAI2BB2XLTS U1630 ( .B0(intDY_EWSW[22]), .B1(n1046), .A0N(intDX_EWSW[23]), 
        .A1N(n1691), .Y(n1047) );
  AOI211X1TS U1631 ( .A0(n1050), .A1(n1049), .B0(n1048), .C0(n1047), .Y(n1055)
         );
  NAND4BBX1TS U1632 ( .AN(n1148), .BN(n1053), .C(n1052), .D(n1051), .Y(n1054)
         );
  BUFX3TS U1633 ( .A(n1243), .Y(n1554) );
  NOR2X4TS U1634 ( .A(n1058), .B(n1554), .Y(n1245) );
  INVX2TS U1635 ( .A(n1287), .Y(n1279) );
  AOI22X1TS U1636 ( .A0(intDX_EWSW[3]), .A1(n1319), .B0(DMP_EXP_EWSW[3]), .B1(
        n1554), .Y(n1059) );
  NOR2X2TS U1637 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1669), .Y(n1504) );
  INVX2TS U1638 ( .A(exp_rslt_NRM2_EW1[4]), .Y(n1069) );
  INVX2TS U1639 ( .A(Shift_reg_FLAGS_7[0]), .Y(n1187) );
  INVX2TS U1640 ( .A(DP_OP_15J48_123_3372_n4), .Y(n1061) );
  XNOR2X2TS U1641 ( .A(DMP_exp_NRM2_EW[6]), .B(n1065), .Y(n1090) );
  INVX2TS U1642 ( .A(exp_rslt_NRM2_EW1[3]), .Y(n1075) );
  INVX2TS U1643 ( .A(exp_rslt_NRM2_EW1[2]), .Y(n1071) );
  XNOR2X2TS U1644 ( .A(DMP_exp_NRM2_EW[5]), .B(DP_OP_15J48_123_3372_n4), .Y(
        n1089) );
  INVX2TS U1645 ( .A(n1065), .Y(n1066) );
  XNOR2X2TS U1646 ( .A(DMP_exp_NRM2_EW[7]), .B(n1092), .Y(n1499) );
  NAND2X2TS U1647 ( .A(n926), .B(Shift_reg_FLAGS_7[0]), .Y(n1569) );
  BUFX3TS U1648 ( .A(n1187), .Y(n1507) );
  NAND2X1TS U1649 ( .A(n1507), .B(final_result_ieee[27]), .Y(n1068) );
  NAND2X1TS U1650 ( .A(n1507), .B(final_result_ieee[25]), .Y(n1070) );
  NAND2X1TS U1651 ( .A(n1507), .B(final_result_ieee[28]), .Y(n1072) );
  NAND2X1TS U1652 ( .A(n1507), .B(final_result_ieee[26]), .Y(n1074) );
  NAND2X1TS U1653 ( .A(n1507), .B(final_result_ieee[29]), .Y(n1076) );
  NOR2XLTS U1654 ( .A(n1661), .B(DmP_mant_SFG_SWR[6]), .Y(n1079) );
  AOI22X1TS U1655 ( .A0(n1353), .A1(Raw_mant_NRM_SWR[24]), .B0(n1359), .B1(
        Data_array_SWR[0]), .Y(n1083) );
  NAND2X1TS U1656 ( .A(n913), .B(Raw_mant_NRM_SWR[23]), .Y(n1081) );
  AOI22X1TS U1657 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n890), .B0(n1360), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n1080) );
  OAI211X1TS U1658 ( .A0(n1715), .A1(n949), .B0(n1081), .C0(n1080), .Y(n1340)
         );
  AOI22X1TS U1659 ( .A0(n1333), .A1(n1340), .B0(n898), .B1(
        Raw_mant_NRM_SWR[25]), .Y(n1082) );
  NAND2X2TS U1660 ( .A(shift_value_SHT2_EWR[2]), .B(n1652), .Y(n1108) );
  AOI22X1TS U1661 ( .A0(Data_array_SWR[14]), .A1(n901), .B0(Data_array_SWR[10]), .B1(n902), .Y(n1087) );
  NOR2X4TS U1662 ( .A(shift_value_SHT2_EWR[2]), .B(shift_value_SHT2_EWR[3]), 
        .Y(n1101) );
  AOI22X1TS U1663 ( .A0(Data_array_SWR[22]), .A1(n1103), .B0(
        Data_array_SWR[18]), .B1(n876), .Y(n1086) );
  NAND2X1TS U1664 ( .A(n1087), .B(n1086), .Y(n1601) );
  INVX2TS U1665 ( .A(n1108), .Y(n1102) );
  AOI22X1TS U1666 ( .A0(Data_array_SWR[23]), .A1(n1102), .B0(
        Data_array_SWR[19]), .B1(n1101), .Y(n1133) );
  INVX2TS U1667 ( .A(n1133), .Y(n1600) );
  AND4X1TS U1668 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[2]), .C(
        n1186), .D(exp_rslt_NRM2_EW1[1]), .Y(n1088) );
  INVX2TS U1669 ( .A(n1092), .Y(n1093) );
  OAI2BB1X2TS U1670 ( .A0N(n927), .A1N(n1094), .B0(Shift_reg_FLAGS_7[0]), .Y(
        n1501) );
  BUFX3TS U1671 ( .A(n1187), .Y(n1607) );
  OAI2BB2XLTS U1672 ( .B0(n1230), .B1(n1611), .A0N(final_result_ieee[17]), 
        .A1N(n1607), .Y(n498) );
  AOI22X1TS U1673 ( .A0(Data_array_SWR[15]), .A1(n901), .B0(Data_array_SWR[11]), .B1(n902), .Y(n1096) );
  AOI22X1TS U1674 ( .A0(Data_array_SWR[23]), .A1(n1103), .B0(
        Data_array_SWR[19]), .B1(n874), .Y(n1095) );
  NAND2X1TS U1675 ( .A(n1096), .B(n1095), .Y(n1599) );
  AOI22X1TS U1676 ( .A0(Data_array_SWR[22]), .A1(n1102), .B0(
        Data_array_SWR[18]), .B1(n1101), .Y(n1130) );
  INVX2TS U1677 ( .A(n1130), .Y(n1598) );
  OAI2BB2XLTS U1678 ( .B0(n1236), .B1(n1611), .A0N(final_result_ieee[16]), 
        .A1N(n1607), .Y(n500) );
  AOI22X1TS U1679 ( .A0(Data_array_SWR[17]), .A1(n1390), .B0(
        Data_array_SWR[13]), .B1(n1085), .Y(n1098) );
  AOI22X1TS U1680 ( .A0(Data_array_SWR[21]), .A1(n876), .B0(Data_array_SWR[25]), .B1(n1103), .Y(n1097) );
  NAND2X1TS U1681 ( .A(n1098), .B(n1097), .Y(n1192) );
  OR2X1TS U1682 ( .A(shift_value_SHT2_EWR[2]), .B(n1652), .Y(n1106) );
  OAI222X4TS U1683 ( .A0(n1721), .A1(n1106), .B0(n1722), .B1(n1108), .C0(n1723), .C1(n1107), .Y(n1201) );
  OAI2BB2XLTS U1684 ( .B0(n1228), .B1(n1611), .A0N(final_result_ieee[14]), 
        .A1N(n1607), .Y(n504) );
  AOI22X1TS U1685 ( .A0(Data_array_SWR[21]), .A1(n1101), .B0(
        Data_array_SWR[25]), .B1(n1102), .Y(n1111) );
  AOI22X1TS U1686 ( .A0(Data_array_SWR[13]), .A1(n901), .B0(Data_array_SWR[9]), 
        .B1(n1085), .Y(n1100) );
  NAND2X1TS U1687 ( .A(Data_array_SWR[17]), .B(n874), .Y(n1099) );
  OAI211X1TS U1688 ( .A0(n1111), .A1(n882), .B0(n1100), .C0(n1099), .Y(n1603)
         );
  AO22X1TS U1689 ( .A0(Data_array_SWR[24]), .A1(n1102), .B0(Data_array_SWR[20]), .B1(n1101), .Y(n1602) );
  OAI2BB2XLTS U1690 ( .B0(n1232), .B1(n1611), .A0N(final_result_ieee[18]), 
        .A1N(n1607), .Y(n496) );
  AOI22X1TS U1691 ( .A0(Data_array_SWR[12]), .A1(n1085), .B0(
        Data_array_SWR[16]), .B1(n1390), .Y(n1105) );
  AOI22X1TS U1692 ( .A0(Data_array_SWR[24]), .A1(n1103), .B0(
        Data_array_SWR[20]), .B1(n876), .Y(n1104) );
  NAND2X1TS U1693 ( .A(n1105), .B(n1104), .Y(n1195) );
  OAI222X4TS U1694 ( .A0(n1718), .A1(n1108), .B0(n1719), .B1(n1107), .C0(n1720), .C1(n1106), .Y(n1207) );
  OAI2BB2XLTS U1695 ( .B0(n1239), .B1(n1611), .A0N(final_result_ieee[15]), 
        .A1N(n1607), .Y(n502) );
  AOI22X1TS U1696 ( .A0(Data_array_SWR[12]), .A1(n901), .B0(Data_array_SWR[8]), 
        .B1(n902), .Y(n1110) );
  AOI22X1TS U1697 ( .A0(Data_array_SWR[16]), .A1(n874), .B0(
        shift_value_SHT2_EWR[4]), .B1(n1602), .Y(n1109) );
  NAND2X1TS U1698 ( .A(n1110), .B(n1109), .Y(n1606) );
  INVX2TS U1699 ( .A(n1111), .Y(n1605) );
  OAI2BB2XLTS U1700 ( .B0(n1234), .B1(n1611), .A0N(final_result_ieee[19]), 
        .A1N(n1607), .Y(n494) );
  AOI21X1TS U1701 ( .A0(n898), .A1(Raw_mant_NRM_SWR[0]), .B0(n918), .Y(n1525)
         );
  OAI2BB2XLTS U1702 ( .B0(n1525), .B1(n911), .A0N(n1113), .A1N(
        Data_array_SWR[25]), .Y(n796) );
  OAI22X1TS U1703 ( .A0(n1709), .A1(n1533), .B0(n1639), .B1(n875), .Y(n1114)
         );
  OAI2BB2XLTS U1704 ( .B0(n1380), .B1(n910), .A0N(n1113), .A1N(
        Data_array_SWR[24]), .Y(n795) );
  INVX2TS U1705 ( .A(DmP_mant_SFG_SWR[5]), .Y(n1625) );
  INVX2TS U1706 ( .A(n1625), .Y(n1115) );
  OAI32X1TS U1707 ( .A0(n877), .A1(Raw_mant_NRM_SWR[14]), .A2(n1120), .B0(
        n1119), .B1(n914), .Y(n1124) );
  INVX2TS U1708 ( .A(n1222), .Y(n1491) );
  AOI21X1TS U1709 ( .A0(n1126), .A1(Raw_mant_NRM_SWR[10]), .B0(n1125), .Y(
        n1542) );
  AOI22X1TS U1710 ( .A0(Data_array_SWR[14]), .A1(n876), .B0(Data_array_SWR[10]), .B1(n1390), .Y(n1129) );
  INVX2TS U1711 ( .A(n1127), .Y(n1208) );
  AOI22X1TS U1712 ( .A0(Data_array_SWR[6]), .A1(n1085), .B0(Data_array_SWR[2]), 
        .B1(n1208), .Y(n1128) );
  OAI211X1TS U1713 ( .A0(n1130), .A1(n882), .B0(n1129), .C0(n1128), .Y(n1609)
         );
  AOI22X1TS U1714 ( .A0(Data_array_SWR[23]), .A1(n904), .B0(n1401), .B1(n1609), 
        .Y(n1216) );
  OAI2BB2XLTS U1715 ( .B0(n1216), .B1(n1611), .A0N(final_result_ieee[21]), 
        .A1N(n1701), .Y(n490) );
  AOI22X1TS U1716 ( .A0(Data_array_SWR[15]), .A1(n874), .B0(Data_array_SWR[11]), .B1(n1390), .Y(n1132) );
  AOI22X1TS U1717 ( .A0(Data_array_SWR[7]), .A1(n1085), .B0(Data_array_SWR[3]), 
        .B1(n1208), .Y(n1131) );
  OAI211X1TS U1718 ( .A0(n1133), .A1(n882), .B0(n1132), .C0(n1131), .Y(n1608)
         );
  AOI22X1TS U1719 ( .A0(Data_array_SWR[22]), .A1(n904), .B0(n906), .B1(n1608), 
        .Y(n1214) );
  OAI2BB2XLTS U1720 ( .B0(n1214), .B1(n1611), .A0N(final_result_ieee[20]), 
        .A1N(n1701), .Y(n491) );
  BUFX3TS U1721 ( .A(n1736), .Y(n1741) );
  BUFX3TS U1722 ( .A(n1735), .Y(n1759) );
  BUFX3TS U1723 ( .A(n1735), .Y(n1740) );
  BUFX3TS U1724 ( .A(n1137), .Y(n1739) );
  BUFX3TS U1725 ( .A(n1138), .Y(n1760) );
  CLKBUFX2TS U1726 ( .A(n1137), .Y(n1135) );
  BUFX3TS U1727 ( .A(n1134), .Y(n1746) );
  BUFX3TS U1728 ( .A(n1139), .Y(n1747) );
  BUFX3TS U1729 ( .A(n1137), .Y(n1744) );
  BUFX3TS U1730 ( .A(n1739), .Y(n1748) );
  BUFX3TS U1731 ( .A(n1139), .Y(n1743) );
  BUFX3TS U1732 ( .A(n1738), .Y(n1749) );
  BUFX3TS U1733 ( .A(n1139), .Y(n1762) );
  BUFX3TS U1734 ( .A(n1739), .Y(n1761) );
  BUFX3TS U1735 ( .A(n1739), .Y(n1742) );
  BUFX3TS U1736 ( .A(n1738), .Y(n1745) );
  BUFX3TS U1737 ( .A(n1738), .Y(n1733) );
  BUFX3TS U1738 ( .A(n1736), .Y(n1750) );
  BUFX3TS U1739 ( .A(n1134), .Y(n1751) );
  BUFX3TS U1740 ( .A(n1735), .Y(n1754) );
  BUFX3TS U1741 ( .A(n1136), .Y(n1753) );
  BUFX3TS U1742 ( .A(n1736), .Y(n1763) );
  BUFX3TS U1743 ( .A(n1139), .Y(n1756) );
  BUFX3TS U1744 ( .A(n1736), .Y(n1732) );
  BUFX3TS U1745 ( .A(n1137), .Y(n1738) );
  BUFX3TS U1746 ( .A(n1134), .Y(n1755) );
  BUFX3TS U1747 ( .A(n1137), .Y(n1736) );
  BUFX3TS U1748 ( .A(n1136), .Y(n1731) );
  BUFX3TS U1749 ( .A(n1138), .Y(n1737) );
  BUFX3TS U1750 ( .A(n1738), .Y(n1728) );
  BUFX3TS U1751 ( .A(n1736), .Y(n1727) );
  BUFX3TS U1752 ( .A(n1137), .Y(n1735) );
  BUFX3TS U1753 ( .A(n1735), .Y(n1730) );
  BUFX3TS U1754 ( .A(n1136), .Y(n1757) );
  BUFX3TS U1755 ( .A(n1735), .Y(n1758) );
  BUFX3TS U1756 ( .A(n1136), .Y(n1729) );
  BUFX3TS U1757 ( .A(n1739), .Y(n1752) );
  BUFX3TS U1758 ( .A(n1139), .Y(n1726) );
  BUFX3TS U1759 ( .A(n1135), .Y(n1734) );
  BUFX3TS U1760 ( .A(n1739), .Y(n1725) );
  BUFX3TS U1761 ( .A(n1738), .Y(n1724) );
  CLKBUFX2TS U1762 ( .A(n1714), .Y(n1571) );
  INVX2TS U1763 ( .A(n1571), .Y(n1556) );
  NAND2X1TS U1764 ( .A(DmP_EXP_EWSW[25]), .B(n924), .Y(n1548) );
  NOR2X1TS U1765 ( .A(n887), .B(DMP_EXP_EWSW[24]), .Y(n1544) );
  OAI22X1TS U1766 ( .A0(n1546), .A1(n1544), .B0(DmP_EXP_EWSW[24]), .B1(n1648), 
        .Y(n1550) );
  AOI22X1TS U1767 ( .A0(DMP_EXP_EWSW[25]), .A1(n1708), .B0(n1548), .B1(n1550), 
        .Y(n1142) );
  NOR2X1TS U1768 ( .A(n889), .B(DMP_EXP_EWSW[26]), .Y(n1143) );
  AOI21X1TS U1769 ( .A0(DMP_EXP_EWSW[26]), .A1(n889), .B0(n1143), .Y(n1140) );
  XNOR2X1TS U1770 ( .A(n1142), .B(n1140), .Y(n1141) );
  OAI22X1TS U1771 ( .A0(n1143), .A1(n1142), .B0(DmP_EXP_EWSW[26]), .B1(n1650), 
        .Y(n1145) );
  XNOR2X1TS U1772 ( .A(DmP_EXP_EWSW[27]), .B(DMP_EXP_EWSW[27]), .Y(n1144) );
  XOR2X1TS U1773 ( .A(n1145), .B(n1144), .Y(n1146) );
  OAI22X1TS U1774 ( .A0(n1765), .A1(intDX_EWSW[1]), .B0(n1676), .B1(
        intDX_EWSW[25]), .Y(n1147) );
  AOI221X1TS U1775 ( .A0(n1765), .A1(intDX_EWSW[1]), .B0(intDX_EWSW[25]), .B1(
        n1676), .C0(n1147), .Y(n1153) );
  AOI221X1TS U1776 ( .A0(n1689), .A1(intDX_EWSW[26]), .B0(intDX_EWSW[27]), 
        .B1(n1693), .C0(n1148), .Y(n1152) );
  OAI22X1TS U1777 ( .A0(n1690), .A1(intDX_EWSW[28]), .B0(n1645), .B1(
        intDX_EWSW[29]), .Y(n1149) );
  AOI2BB2XLTS U1778 ( .B0(intDX_EWSW[7]), .B1(n1668), .A0N(n1668), .A1N(
        intDX_EWSW[7]), .Y(n1150) );
  OAI22X1TS U1779 ( .A0(n1692), .A1(intDX_EWSW[30]), .B0(n1678), .B1(
        intDX_EWSW[17]), .Y(n1154) );
  OAI22X1TS U1780 ( .A0(n1688), .A1(intDX_EWSW[20]), .B0(n1681), .B1(
        intDX_EWSW[21]), .Y(n1156) );
  OAI22X1TS U1781 ( .A0(n1644), .A1(intDX_EWSW[22]), .B0(n1691), .B1(
        intDX_EWSW[23]), .Y(n1157) );
  OAI22X1TS U1782 ( .A0(n1635), .A1(intDX_EWSW[24]), .B0(n1679), .B1(
        intDX_EWSW[9]), .Y(n1162) );
  AOI221X1TS U1783 ( .A0(n1635), .A1(intDX_EWSW[24]), .B0(intDX_EWSW[9]), .B1(
        n1679), .C0(n1162), .Y(n1169) );
  OAI22X1TS U1784 ( .A0(n1685), .A1(intDX_EWSW[12]), .B0(n1680), .B1(
        intDX_EWSW[13]), .Y(n1164) );
  OAI22X1TS U1785 ( .A0(n1686), .A1(intDX_EWSW[14]), .B0(n1643), .B1(
        intDX_EWSW[15]), .Y(n1165) );
  OAI22X1TS U1786 ( .A0(n1687), .A1(intDX_EWSW[16]), .B0(n1642), .B1(
        intDX_EWSW[0]), .Y(n1170) );
  AOI221X1TS U1787 ( .A0(n1687), .A1(intDX_EWSW[16]), .B0(intDX_EWSW[0]), .B1(
        n1642), .C0(n1170), .Y(n1177) );
  OAI22X1TS U1788 ( .A0(n1683), .A1(intDX_EWSW[2]), .B0(n1677), .B1(
        intDX_EWSW[3]), .Y(n1171) );
  OAI22X1TS U1789 ( .A0(n1684), .A1(intDX_EWSW[4]), .B0(n1641), .B1(
        intDX_EWSW[5]), .Y(n1172) );
  AOI221X1TS U1790 ( .A0(n1684), .A1(intDX_EWSW[4]), .B0(intDX_EWSW[5]), .B1(
        n1641), .C0(n1172), .Y(n1175) );
  OAI22X1TS U1791 ( .A0(n1682), .A1(intDX_EWSW[8]), .B0(n1667), .B1(
        intDX_EWSW[6]), .Y(n1173) );
  AOI221X1TS U1792 ( .A0(n1682), .A1(intDX_EWSW[8]), .B0(intDX_EWSW[6]), .B1(
        n1667), .C0(n1173), .Y(n1174) );
  CLKXOR2X2TS U1793 ( .A(intDY_EWSW[31]), .B(intAS), .Y(n1266) );
  AOI21X1TS U1794 ( .A0(n1266), .A1(intDX_EWSW[31]), .B0(n1182), .Y(n1553) );
  NAND2X1TS U1795 ( .A(n873), .B(DmP_mant_SFG_SWR[2]), .Y(n1183) );
  OAI21X1TS U1796 ( .A0(n873), .A1(DmP_mant_SFG_SWR[2]), .B0(n1183), .Y(n1577)
         );
  NOR2X2TS U1797 ( .A(n1577), .B(n886), .Y(n1580) );
  NOR2BX1TS U1798 ( .AN(n1697), .B(n873), .Y(n1184) );
  AOI21X1TS U1799 ( .A0(n873), .A1(DmP_mant_SFG_SWR[3]), .B0(n1184), .Y(n1579)
         );
  OAI21X1TS U1800 ( .A0(n1580), .A1(DMP_SFG[1]), .B0(n1185), .Y(intadd_50_B_0_) );
  INVX2TS U1801 ( .A(n1186), .Y(n1189) );
  CLKBUFX2TS U1802 ( .A(n1187), .Y(n1610) );
  NAND2X1TS U1803 ( .A(n1507), .B(final_result_ieee[23]), .Y(n1188) );
  INVX2TS U1804 ( .A(exp_rslt_NRM2_EW1[1]), .Y(n1191) );
  NAND2X1TS U1805 ( .A(n1507), .B(final_result_ieee[24]), .Y(n1190) );
  AOI21X1TS U1806 ( .A0(n1201), .A1(n1604), .B0(n1193), .Y(n1596) );
  NOR2X4TS U1807 ( .A(n1386), .B(Shift_reg_FLAGS_7[0]), .Y(n1631) );
  NAND2X1TS U1808 ( .A(n1240), .B(DmP_mant_SFG_SWR[9]), .Y(n1194) );
  AOI21X1TS U1809 ( .A0(n1207), .A1(n1604), .B0(n1196), .Y(n1597) );
  NAND2X1TS U1810 ( .A(n1240), .B(DmP_mant_SFG_SWR[8]), .Y(n1197) );
  NOR2XLTS U1811 ( .A(n1661), .B(DmP_mant_SFG_SWR[4]), .Y(n1199) );
  NOR2X1TS U1812 ( .A(n1199), .B(n1198), .Y(intadd_50_CI) );
  CLKXOR2X2TS U1813 ( .A(n1200), .B(DmP_mant_SFG_SWR[10]), .Y(
        DmP_mant_SFG_SWR_signed[10]) );
  INVX2TS U1814 ( .A(n1201), .Y(n1204) );
  AOI22X1TS U1815 ( .A0(Data_array_SWR[12]), .A1(n874), .B0(Data_array_SWR[8]), 
        .B1(n1390), .Y(n1203) );
  AOI22X1TS U1816 ( .A0(Data_array_SWR[4]), .A1(n902), .B0(Data_array_SWR[0]), 
        .B1(n1208), .Y(n1202) );
  OAI211X1TS U1817 ( .A0(n1204), .A1(n882), .B0(n1203), .C0(n1202), .Y(n1613)
         );
  AOI22X1TS U1818 ( .A0(Data_array_SWR[25]), .A1(n904), .B0(n1401), .B1(n1613), 
        .Y(n1206) );
  NAND2X1TS U1819 ( .A(n1237), .B(DmP_mant_SFG_SWR[25]), .Y(n1205) );
  INVX2TS U1820 ( .A(n1207), .Y(n1211) );
  AOI22X1TS U1821 ( .A0(Data_array_SWR[13]), .A1(n874), .B0(Data_array_SWR[9]), 
        .B1(n1390), .Y(n1210) );
  AOI22X1TS U1822 ( .A0(Data_array_SWR[5]), .A1(n1085), .B0(Data_array_SWR[1]), 
        .B1(n1208), .Y(n1209) );
  OAI211X1TS U1823 ( .A0(n1211), .A1(n882), .B0(n1210), .C0(n1209), .Y(n1616)
         );
  AOI22X1TS U1824 ( .A0(Data_array_SWR[24]), .A1(n904), .B0(n1401), .B1(n1616), 
        .Y(n1612) );
  NAND2X1TS U1825 ( .A(n1237), .B(DmP_mant_SFG_SWR[24]), .Y(n1212) );
  NAND2X1TS U1826 ( .A(n1237), .B(DmP_mant_SFG_SWR[22]), .Y(n1213) );
  NAND2X1TS U1827 ( .A(n1237), .B(DmP_mant_SFG_SWR[23]), .Y(n1215) );
  OAI22X1TS U1828 ( .A0(n1220), .A1(n1219), .B0(n1218), .B1(n1217), .Y(n1225)
         );
  OAI31X1TS U1829 ( .A0(n1225), .A1(n1224), .A2(n1223), .B0(n1576), .Y(n1488)
         );
  NAND2X1TS U1830 ( .A(n1237), .B(DmP_mant_SFG_SWR[16]), .Y(n1227) );
  NAND2X1TS U1831 ( .A(n1237), .B(DmP_mant_SFG_SWR[19]), .Y(n1229) );
  NAND2X1TS U1832 ( .A(n1237), .B(DmP_mant_SFG_SWR[20]), .Y(n1231) );
  NAND2X1TS U1833 ( .A(n1237), .B(DmP_mant_SFG_SWR[21]), .Y(n1233) );
  NAND2X1TS U1834 ( .A(n1237), .B(DmP_mant_SFG_SWR[18]), .Y(n1235) );
  NAND2X1TS U1835 ( .A(n1237), .B(DmP_mant_SFG_SWR[17]), .Y(n1238) );
  CLKBUFX2TS U1836 ( .A(n1243), .Y(n1274) );
  BUFX3TS U1837 ( .A(n1274), .Y(n1505) );
  AOI22X1TS U1838 ( .A0(intDX_EWSW[17]), .A1(n1245), .B0(DmP_EXP_EWSW[17]), 
        .B1(n1505), .Y(n1241) );
  BUFX3TS U1839 ( .A(n1554), .Y(n1282) );
  AOI22X1TS U1840 ( .A0(intDX_EWSW[0]), .A1(n1245), .B0(DmP_EXP_EWSW[0]), .B1(
        n1282), .Y(n1242) );
  AOI22X1TS U1841 ( .A0(intDX_EWSW[16]), .A1(n1325), .B0(DmP_EXP_EWSW[16]), 
        .B1(n1243), .Y(n1244) );
  BUFX3TS U1842 ( .A(n1245), .Y(n1325) );
  AOI22X1TS U1843 ( .A0(intDX_EWSW[4]), .A1(n1325), .B0(DmP_EXP_EWSW[4]), .B1(
        n1282), .Y(n1246) );
  AOI22X1TS U1844 ( .A0(intDX_EWSW[6]), .A1(n1325), .B0(DmP_EXP_EWSW[6]), .B1(
        n1282), .Y(n1247) );
  AOI22X1TS U1845 ( .A0(intDX_EWSW[5]), .A1(n1325), .B0(DmP_EXP_EWSW[5]), .B1(
        n1243), .Y(n1248) );
  AOI22X1TS U1846 ( .A0(intDX_EWSW[2]), .A1(n1325), .B0(DmP_EXP_EWSW[2]), .B1(
        n1282), .Y(n1249) );
  AOI22X1TS U1847 ( .A0(intDX_EWSW[1]), .A1(n1325), .B0(DmP_EXP_EWSW[1]), .B1(
        n1282), .Y(n1250) );
  AOI22X1TS U1848 ( .A0(intDX_EWSW[3]), .A1(n1325), .B0(DmP_EXP_EWSW[3]), .B1(
        n1282), .Y(n1251) );
  AOI22X1TS U1849 ( .A0(DmP_EXP_EWSW[27]), .A1(n1505), .B0(intDX_EWSW[27]), 
        .B1(n1325), .Y(n1252) );
  AOI22X1TS U1850 ( .A0(intDX_EWSW[7]), .A1(n1263), .B0(DmP_EXP_EWSW[7]), .B1(
        n1243), .Y(n1253) );
  AOI22X1TS U1851 ( .A0(intDX_EWSW[18]), .A1(n1263), .B0(DmP_EXP_EWSW[18]), 
        .B1(n1243), .Y(n1254) );
  AOI22X1TS U1852 ( .A0(intDX_EWSW[10]), .A1(n1263), .B0(DmP_EXP_EWSW[10]), 
        .B1(n1282), .Y(n1255) );
  AOI22X1TS U1853 ( .A0(intDX_EWSW[14]), .A1(n1263), .B0(DmP_EXP_EWSW[14]), 
        .B1(n1274), .Y(n1256) );
  AOI22X1TS U1854 ( .A0(intDX_EWSW[11]), .A1(n1263), .B0(DmP_EXP_EWSW[11]), 
        .B1(n1274), .Y(n1257) );
  AOI22X1TS U1855 ( .A0(intDX_EWSW[8]), .A1(n1263), .B0(DmP_EXP_EWSW[8]), .B1(
        n928), .Y(n1258) );
  AOI22X1TS U1856 ( .A0(intDX_EWSW[12]), .A1(n1263), .B0(DmP_EXP_EWSW[12]), 
        .B1(n1274), .Y(n1259) );
  AOI22X1TS U1857 ( .A0(intDX_EWSW[9]), .A1(n1263), .B0(DmP_EXP_EWSW[9]), .B1(
        n1243), .Y(n1260) );
  AOI22X1TS U1858 ( .A0(intDX_EWSW[13]), .A1(n1263), .B0(DmP_EXP_EWSW[13]), 
        .B1(n928), .Y(n1262) );
  AOI22X1TS U1859 ( .A0(intDX_EWSW[15]), .A1(n1263), .B0(DmP_EXP_EWSW[15]), 
        .B1(n1505), .Y(n1264) );
  INVX2TS U1860 ( .A(n1266), .Y(n1270) );
  AOI22X1TS U1861 ( .A0(intDX_EWSW[31]), .A1(n1268), .B0(SIGN_FLAG_EXP), .B1(
        n1282), .Y(n1269) );
  OAI31X1TS U1862 ( .A0(n1271), .A1(n1270), .A2(n1568), .B0(n1269), .Y(n720)
         );
  BUFX3TS U1863 ( .A(n1274), .Y(n1310) );
  AOI22X1TS U1864 ( .A0(intDX_EWSW[28]), .A1(n1319), .B0(DMP_EXP_EWSW[28]), 
        .B1(n1310), .Y(n1272) );
  AOI22X1TS U1865 ( .A0(intDX_EWSW[1]), .A1(n1324), .B0(DMP_EXP_EWSW[1]), .B1(
        n1554), .Y(n1273) );
  BUFX3TS U1866 ( .A(n1274), .Y(n1297) );
  AOI22X1TS U1867 ( .A0(intDX_EWSW[4]), .A1(n1302), .B0(DMP_EXP_EWSW[4]), .B1(
        n1297), .Y(n1275) );
  AOI22X1TS U1868 ( .A0(intDX_EWSW[5]), .A1(n1324), .B0(DMP_EXP_EWSW[5]), .B1(
        n1297), .Y(n1276) );
  AOI22X1TS U1869 ( .A0(intDX_EWSW[6]), .A1(n1324), .B0(DMP_EXP_EWSW[6]), .B1(
        n1297), .Y(n1277) );
  AOI22X1TS U1870 ( .A0(intDX_EWSW[2]), .A1(n1324), .B0(DMP_EXP_EWSW[2]), .B1(
        n1554), .Y(n1278) );
  AOI22X1TS U1871 ( .A0(intDX_EWSW[29]), .A1(n1319), .B0(DMP_EXP_EWSW[29]), 
        .B1(n1282), .Y(n1280) );
  AOI22X1TS U1872 ( .A0(intDX_EWSW[18]), .A1(n1302), .B0(DMP_EXP_EWSW[18]), 
        .B1(n1310), .Y(n1281) );
  AOI22X1TS U1873 ( .A0(intDX_EWSW[30]), .A1(n1319), .B0(DMP_EXP_EWSW[30]), 
        .B1(n1282), .Y(n1283) );
  CLKBUFX2TS U1874 ( .A(n1284), .Y(n1324) );
  AOI22X1TS U1875 ( .A0(DMP_EXP_EWSW[27]), .A1(n1505), .B0(intDX_EWSW[27]), 
        .B1(n1324), .Y(n1285) );
  AOI22X1TS U1876 ( .A0(DMP_EXP_EWSW[23]), .A1(n1505), .B0(intDX_EWSW[23]), 
        .B1(n1319), .Y(n1286) );
  AOI22X1TS U1877 ( .A0(intDX_EWSW[14]), .A1(n1302), .B0(DMP_EXP_EWSW[14]), 
        .B1(n1310), .Y(n1288) );
  AOI22X1TS U1878 ( .A0(intDX_EWSW[17]), .A1(n1302), .B0(DMP_EXP_EWSW[17]), 
        .B1(n1310), .Y(n1289) );
  AOI22X1TS U1879 ( .A0(intDX_EWSW[12]), .A1(n1302), .B0(DMP_EXP_EWSW[12]), 
        .B1(n1297), .Y(n1290) );
  AOI22X1TS U1880 ( .A0(intDX_EWSW[8]), .A1(n1284), .B0(DMP_EXP_EWSW[8]), .B1(
        n1297), .Y(n1291) );
  AOI22X1TS U1881 ( .A0(intDX_EWSW[11]), .A1(n1302), .B0(DMP_EXP_EWSW[11]), 
        .B1(n1310), .Y(n1292) );
  AOI22X1TS U1882 ( .A0(intDX_EWSW[15]), .A1(n1302), .B0(DMP_EXP_EWSW[15]), 
        .B1(n1297), .Y(n1293) );
  AOI22X1TS U1883 ( .A0(intDX_EWSW[13]), .A1(n1302), .B0(DMP_EXP_EWSW[13]), 
        .B1(n1297), .Y(n1294) );
  AOI22X1TS U1884 ( .A0(intDX_EWSW[7]), .A1(n1284), .B0(DMP_EXP_EWSW[7]), .B1(
        n1297), .Y(n1295) );
  AOI22X1TS U1885 ( .A0(intDX_EWSW[9]), .A1(n1284), .B0(DMP_EXP_EWSW[9]), .B1(
        n1297), .Y(n1296) );
  AOI22X1TS U1886 ( .A0(intDX_EWSW[10]), .A1(n1284), .B0(DMP_EXP_EWSW[10]), 
        .B1(n1297), .Y(n1298) );
  AOI22X1TS U1887 ( .A0(intDX_EWSW[0]), .A1(n1319), .B0(DMP_EXP_EWSW[0]), .B1(
        n1554), .Y(n1299) );
  AOI22X1TS U1888 ( .A0(intDX_EWSW[16]), .A1(n1302), .B0(DMP_EXP_EWSW[16]), 
        .B1(n1310), .Y(n1300) );
  AOI22X1TS U1889 ( .A0(intDX_EWSW[19]), .A1(n1302), .B0(DMP_EXP_EWSW[19]), 
        .B1(n1310), .Y(n1303) );
  AOI22X1TS U1890 ( .A0(intDX_EWSW[22]), .A1(n1319), .B0(DMP_EXP_EWSW[22]), 
        .B1(n1310), .Y(n1304) );
  AOI22X1TS U1891 ( .A0(intDX_EWSW[20]), .A1(n1319), .B0(DMP_EXP_EWSW[20]), 
        .B1(n1310), .Y(n1305) );
  OAI22X1TS U1892 ( .A0(n1306), .A1(n909), .B0(n1702), .B1(n1383), .Y(n1307)
         );
  AOI21X1TS U1893 ( .A0(n1369), .A1(Data_array_SWR[18]), .B0(n1307), .Y(n1308)
         );
  AOI22X1TS U1894 ( .A0(intDX_EWSW[21]), .A1(n1319), .B0(DMP_EXP_EWSW[21]), 
        .B1(n1310), .Y(n1311) );
  AOI22X1TS U1895 ( .A0(n898), .A1(Raw_mant_NRM_SWR[24]), .B0(
        DmP_mant_SHT1_SW[0]), .B1(n1313), .Y(n1318) );
  AOI22X1TS U1896 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n890), .B0(n1527), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n1315) );
  AOI22X1TS U1897 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n913), .B0(n917), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n1314) );
  NAND2X1TS U1898 ( .A(n1315), .B(n1314), .Y(n1344) );
  AOI22X1TS U1899 ( .A0(n1359), .A1(Data_array_SWR[1]), .B0(n1333), .B1(n1344), 
        .Y(n1317) );
  NAND2X1TS U1900 ( .A(n1353), .B(Raw_mant_NRM_SWR[23]), .Y(n1316) );
  AOI22X1TS U1901 ( .A0(intDX_EWSW[20]), .A1(n1245), .B0(DmP_EXP_EWSW[20]), 
        .B1(n1505), .Y(n1320) );
  AOI22X1TS U1902 ( .A0(intDX_EWSW[21]), .A1(n1245), .B0(DmP_EXP_EWSW[21]), 
        .B1(n1505), .Y(n1321) );
  AOI22X1TS U1903 ( .A0(intDX_EWSW[22]), .A1(n1245), .B0(DmP_EXP_EWSW[22]), 
        .B1(n1505), .Y(n1322) );
  AOI22X1TS U1904 ( .A0(intDX_EWSW[19]), .A1(n1245), .B0(DmP_EXP_EWSW[19]), 
        .B1(n1505), .Y(n1323) );
  AOI222X1TS U1905 ( .A0(n1325), .A1(intDX_EWSW[23]), .B0(DmP_EXP_EWSW[23]), 
        .B1(n1554), .C0(intDY_EWSW[23]), .C1(n1324), .Y(n1326) );
  INVX2TS U1906 ( .A(n1326), .Y(n564) );
  AOI22X1TS U1907 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n890), .B0(n1527), .B1(
        DmP_mant_SHT1_SW[5]), .Y(n1328) );
  AOI22X1TS U1908 ( .A0(Raw_mant_NRM_SWR[19]), .A1(n913), .B0(n919), .B1(
        DmP_mant_SHT1_SW[4]), .Y(n1327) );
  NAND2X1TS U1909 ( .A(n1328), .B(n1327), .Y(n1336) );
  AOI22X1TS U1910 ( .A0(n1359), .A1(Data_array_SWR[4]), .B0(n1333), .B1(n1336), 
        .Y(n1330) );
  NAND2X1TS U1911 ( .A(Raw_mant_NRM_SWR[20]), .B(n1353), .Y(n1329) );
  AOI22X1TS U1912 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n890), .B0(n1527), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n1332) );
  AOI22X1TS U1913 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n913), .B0(n917), .B1(
        DmP_mant_SHT1_SW[5]), .Y(n1331) );
  NAND2X1TS U1914 ( .A(n1332), .B(n1331), .Y(n1348) );
  AOI22X1TS U1915 ( .A0(n1359), .A1(Data_array_SWR[5]), .B0(n1333), .B1(n1348), 
        .Y(n1335) );
  NAND2X1TS U1916 ( .A(Raw_mant_NRM_SWR[19]), .B(n1353), .Y(n1334) );
  AOI22X1TS U1917 ( .A0(n1369), .A1(Data_array_SWR[6]), .B0(n879), .B1(n1336), 
        .Y(n1338) );
  NAND2X1TS U1918 ( .A(Raw_mant_NRM_SWR[16]), .B(n892), .Y(n1337) );
  AOI22X1TS U1919 ( .A0(n1359), .A1(Data_array_SWR[2]), .B0(n879), .B1(n1340), 
        .Y(n1342) );
  NAND2X1TS U1920 ( .A(Raw_mant_NRM_SWR[20]), .B(n892), .Y(n1341) );
  AOI22X1TS U1921 ( .A0(n1359), .A1(Data_array_SWR[3]), .B0(n879), .B1(n1344), 
        .Y(n1346) );
  NAND2X1TS U1922 ( .A(Raw_mant_NRM_SWR[19]), .B(n892), .Y(n1345) );
  AOI22X1TS U1923 ( .A0(n1359), .A1(Data_array_SWR[7]), .B0(n879), .B1(n1348), 
        .Y(n1350) );
  NAND2X1TS U1924 ( .A(Raw_mant_NRM_SWR[15]), .B(n892), .Y(n1349) );
  AOI22X1TS U1925 ( .A0(n1369), .A1(Data_array_SWR[15]), .B0(
        Raw_mant_NRM_SWR[7]), .B1(n1368), .Y(n1352) );
  AOI2BB2X1TS U1926 ( .B0(Raw_mant_NRM_SWR[9]), .B1(n1353), .A0N(n1373), .A1N(
        n907), .Y(n1351) );
  AOI22X1TS U1927 ( .A0(n1113), .A1(Data_array_SWR[9]), .B0(
        Raw_mant_NRM_SWR[13]), .B1(n892), .Y(n1355) );
  AOI2BB2X1TS U1928 ( .B0(Raw_mant_NRM_SWR[15]), .B1(n1353), .A0N(n1363), 
        .A1N(n907), .Y(n1354) );
  OAI211X1TS U1929 ( .A0(n1356), .A1(n910), .B0(n1355), .C0(n1354), .Y(n780)
         );
  AOI22X1TS U1930 ( .A0(n1369), .A1(Data_array_SWR[19]), .B0(
        Raw_mant_NRM_SWR[3]), .B1(n1368), .Y(n1358) );
  OA22X1TS U1931 ( .A0(n1654), .A1(n1383), .B0(n1376), .B1(n907), .Y(n1357) );
  AOI22X1TS U1932 ( .A0(n1359), .A1(Data_array_SWR[11]), .B0(
        Raw_mant_NRM_SWR[11]), .B1(n1368), .Y(n1362) );
  OA22X1TS U1933 ( .A0(n1704), .A1(n1383), .B0(n1367), .B1(n908), .Y(n1361) );
  AOI22X1TS U1934 ( .A0(n1369), .A1(Data_array_SWR[13]), .B0(
        Raw_mant_NRM_SWR[9]), .B1(n1368), .Y(n1366) );
  OA22X1TS U1935 ( .A0(n1633), .A1(n1383), .B0(n1364), .B1(n908), .Y(n1365) );
  AOI22X1TS U1936 ( .A0(n1369), .A1(Data_array_SWR[17]), .B0(
        Raw_mant_NRM_SWR[5]), .B1(n892), .Y(n1372) );
  OA22X1TS U1937 ( .A0(n1655), .A1(n1383), .B0(n1370), .B1(n908), .Y(n1371) );
  AOI22X1TS U1938 ( .A0(n919), .A1(DmP_mant_SHT1_SW[21]), .B0(n1527), .B1(
        DmP_mant_SHT1_SW[22]), .Y(n1374) );
  AOI21X1TS U1939 ( .A0(Raw_mant_NRM_SWR[2]), .A1(n898), .B0(n1375), .Y(n1526)
         );
  OAI22X1TS U1940 ( .A0(n1376), .A1(n909), .B0(n1647), .B1(n1383), .Y(n1377)
         );
  AOI21X1TS U1941 ( .A0(n1113), .A1(Data_array_SWR[21]), .B0(n1377), .Y(n1378)
         );
  OAI22X1TS U1942 ( .A0(n1380), .A1(n908), .B0(n1379), .B1(n909), .Y(n1381) );
  AOI21X1TS U1943 ( .A0(n1113), .A1(Data_array_SWR[22]), .B0(n1381), .Y(n1382)
         );
  OAI2BB2XLTS U1944 ( .B0(n1384), .B1(n1501), .A0N(final_result_ieee[31]), 
        .A1N(n1507), .Y(n543) );
  AOI32X4TS U1945 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B0(n1385), .B1(n1669), .Y(n1508)
         );
  MXI2X1TS U1946 ( .A(n989), .B(n1386), .S0(n1508), .Y(n865) );
  BUFX3TS U1947 ( .A(n1631), .Y(n1403) );
  AOI22X1TS U1948 ( .A0(Data_array_SWR[23]), .A1(n901), .B0(Data_array_SWR[19]), .B1(n902), .Y(n1399) );
  AOI22X1TS U1949 ( .A0(Data_array_SWR[10]), .A1(n899), .B0(Data_array_SWR[15]), .B1(n903), .Y(n1388) );
  OAI221X1TS U1950 ( .A0(n906), .A1(n1399), .B0(n1617), .B1(n1400), .C0(n1388), 
        .Y(n1594) );
  AOI22X1TS U1951 ( .A0(Data_array_SWR[22]), .A1(n901), .B0(Data_array_SWR[18]), .B1(n902), .Y(n1396) );
  AOI22X1TS U1952 ( .A0(Data_array_SWR[14]), .A1(n903), .B0(Data_array_SWR[11]), .B1(n899), .Y(n1389) );
  OAI221X1TS U1953 ( .A0(n1401), .A1(n1396), .B0(n1617), .B1(n1397), .C0(n1389), .Y(n1592) );
  AOI222X1TS U1954 ( .A0(Data_array_SWR[21]), .A1(n901), .B0(
        Data_array_SWR[17]), .B1(n902), .C0(Data_array_SWR[25]), .C1(n876), 
        .Y(n1393) );
  AOI222X1TS U1955 ( .A0(Data_array_SWR[24]), .A1(n874), .B0(
        Data_array_SWR[20]), .B1(n1390), .C0(Data_array_SWR[16]), .C1(n1085), 
        .Y(n1394) );
  AOI22X1TS U1956 ( .A0(Data_array_SWR[12]), .A1(n899), .B0(Data_array_SWR[13]), .B1(n903), .Y(n1391) );
  OAI221X1TS U1957 ( .A0(n906), .A1(n1393), .B0(n1617), .B1(n1394), .C0(n1391), 
        .Y(n1590) );
  AOI22X1TS U1958 ( .A0(Data_array_SWR[12]), .A1(n903), .B0(Data_array_SWR[13]), .B1(n899), .Y(n1392) );
  AOI22X1TS U1959 ( .A0(Data_array_SWR[14]), .A1(n899), .B0(Data_array_SWR[11]), .B1(n903), .Y(n1395) );
  OAI221X1TS U1960 ( .A0(n1401), .A1(n1397), .B0(n905), .B1(n1396), .C0(n1395), 
        .Y(n1591) );
  AOI22X1TS U1961 ( .A0(Data_array_SWR[10]), .A1(n903), .B0(Data_array_SWR[15]), .B1(n899), .Y(n1398) );
  OAI221X1TS U1962 ( .A0(n906), .A1(n1400), .B0(n1617), .B1(n1399), .C0(n1398), 
        .Y(n1593) );
  CLKBUFX2TS U1963 ( .A(n1631), .Y(n1624) );
  AFHCINX2TS U1964 ( .CIN(n1404), .B(n1405), .A(DMP_SFG[19]), .S(n1406), .CO(
        n1424) );
  AOI21X1TS U1965 ( .A0(n1456), .A1(n1408), .B0(n1407), .Y(n1412) );
  NAND2X1TS U1966 ( .A(n1410), .B(n1409), .Y(n1411) );
  XOR2X1TS U1967 ( .A(n1412), .B(n1411), .Y(n1413) );
  INVX2TS U1968 ( .A(n1414), .Y(n1417) );
  AOI21X1TS U1969 ( .A0(n1456), .A1(n1417), .B0(n1416), .Y(n1422) );
  NAND2X1TS U1970 ( .A(n1420), .B(n1419), .Y(n1421) );
  XOR2X1TS U1971 ( .A(n1422), .B(n1421), .Y(n1423) );
  AFHCONX2TS U1972 ( .A(DMP_SFG[20]), .B(n1425), .CI(n1424), .CON(n1427), .S(
        n1426) );
  AFHCONX2TS U1973 ( .A(DMP_SFG[22]), .B(n1431), .CI(n1430), .CON(n988), .S(
        n1432) );
  INVX2TS U1974 ( .A(n1433), .Y(n1436) );
  AOI21X1TS U1975 ( .A0(n1456), .A1(n1436), .B0(n1435), .Y(n1441) );
  NAND2X1TS U1976 ( .A(n1439), .B(n1438), .Y(n1440) );
  XOR2X1TS U1977 ( .A(n1441), .B(n1440), .Y(n1442) );
  AOI21X1TS U1978 ( .A0(n1456), .A1(n1454), .B0(n1443), .Y(n1447) );
  NAND2X1TS U1979 ( .A(n1445), .B(n1444), .Y(n1446) );
  XOR2X1TS U1980 ( .A(n1447), .B(n1446), .Y(n1448) );
  NAND2X1TS U1981 ( .A(n1454), .B(n1453), .Y(n1455) );
  XNOR2X1TS U1982 ( .A(n1456), .B(n1455), .Y(n1457) );
  INVX4TS U1983 ( .A(n989), .Y(n1486) );
  INVX2TS U1984 ( .A(intadd_50_B_2_), .Y(n1468) );
  INVX2TS U1985 ( .A(intadd_50_B_1_), .Y(n1466) );
  INVX2TS U1986 ( .A(intadd_50_CI), .Y(n1464) );
  OAI2BB1X1TS U1987 ( .A0N(n1466), .A1N(DMP_SFG[3]), .B0(n1465), .Y(n1467) );
  AOI222X1TS U1988 ( .A0(n1468), .A1(DMP_SFG[4]), .B0(n1468), .B1(n1467), .C0(
        DMP_SFG[4]), .C1(n1467), .Y(n1470) );
  MXI2X2TS U1989 ( .A(n1695), .B(DmP_mant_SFG_SWR[7]), .S0(n873), .Y(n1585) );
  XOR2X1TS U1990 ( .A(DMP_SFG[9]), .B(n1471), .Y(n1472) );
  XOR2X1TS U1991 ( .A(DmP_mant_SFG_SWR_signed[11]), .B(n1472), .Y(n1473) );
  MXI2X1TS U1992 ( .A(DmP_mant_SFG_SWR[1]), .B(n923), .S0(n873), .Y(n1485) );
  MXI2X1TS U1993 ( .A(n1709), .B(n1485), .S0(n1486), .Y(n541) );
  MXI2X1TS U1994 ( .A(DmP_mant_SFG_SWR[0]), .B(n922), .S0(n1387), .Y(n1487) );
  MXI2X1TS U1995 ( .A(n1639), .B(n1487), .S0(n1486), .Y(n542) );
  OAI2BB1X1TS U1996 ( .A0N(LZD_output_NRM2_EW[4]), .A1N(n1575), .B0(n1488), 
        .Y(n512) );
  AOI22X1TS U1997 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n1491), .B0(n1490), .B1(
        Raw_mant_NRM_SWR[5]), .Y(n1493) );
  OAI21X1TS U1998 ( .A0(n1497), .A1(n1496), .B0(n1576), .Y(n1538) );
  OAI2BB1X1TS U1999 ( .A0N(LZD_output_NRM2_EW[2]), .A1N(n1575), .B0(n1538), 
        .Y(n514) );
  OA21XLTS U2000 ( .A0(Shift_reg_FLAGS_7[0]), .A1(overflow_flag), .B0(n1501), 
        .Y(n558) );
  AOI22X1TS U2001 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n1503), .B1(n1640), .Y(
        inst_FSM_INPUT_ENABLE_state_next_1_) );
  NAND2X1TS U2002 ( .A(n1503), .B(n1502), .Y(n871) );
  INVX2TS U2003 ( .A(n1508), .Y(n1506) );
  AOI22X1TS U2004 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n1504), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B1(n1640), .Y(n1509) );
  BUFX3TS U2005 ( .A(n1714), .Y(n1570) );
  AOI22X1TS U2006 ( .A0(n1508), .A1(n1505), .B0(n1570), .B1(n1506), .Y(n868)
         );
  AOI22X1TS U2007 ( .A0(n1508), .A1(n1570), .B0(n895), .B1(n1506), .Y(n867) );
  AOI22X1TS U2008 ( .A0(n1508), .A1(n989), .B0(n914), .B1(n1506), .Y(n864) );
  AOI22X1TS U2009 ( .A0(n1508), .A1(n914), .B0(n1507), .B1(n1506), .Y(n863) );
  INVX2TS U2010 ( .A(n1514), .Y(n1510) );
  BUFX3TS U2011 ( .A(n1514), .Y(n1520) );
  INVX2TS U2012 ( .A(n1524), .Y(n1511) );
  BUFX3TS U2013 ( .A(n1514), .Y(n1513) );
  BUFX3TS U2014 ( .A(n1514), .Y(n1517) );
  BUFX3TS U2015 ( .A(n1517), .Y(n1512) );
  INVX2TS U2016 ( .A(n1524), .Y(n1523) );
  INVX2TS U2017 ( .A(n1517), .Y(n1515) );
  BUFX3TS U2018 ( .A(n1514), .Y(n1521) );
  INVX2TS U2019 ( .A(n1517), .Y(n1516) );
  BUFX3TS U2020 ( .A(n1514), .Y(n1519) );
  INVX2TS U2021 ( .A(n1517), .Y(n1518) );
  INVX2TS U2022 ( .A(n1524), .Y(n1522) );
  OAI222X1TS U2023 ( .A0(n1703), .A1(n1540), .B0(n911), .B1(n1526), .C0(n908), 
        .C1(n1525), .Y(n794) );
  AOI22X1TS U2024 ( .A0(Raw_mant_NRM_SWR[10]), .A1(n890), .B0(n1527), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n1528) );
  AOI21X1TS U2025 ( .A0(n918), .A1(DmP_mant_SHT1_SW[12]), .B0(n1529), .Y(n1535) );
  AOI22X1TS U2026 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n1531), .B0(n1313), .B1(
        DmP_mant_SHT1_SW[11]), .Y(n1532) );
  AOI21X1TS U2027 ( .A0(n919), .A1(DmP_mant_SHT1_SW[10]), .B0(n1534), .Y(n1536) );
  NAND2X1TS U2028 ( .A(n1539), .B(n1538), .Y(n770) );
  AOI21X1TS U2029 ( .A0(busy), .A1(Shift_amount_SHT1_EWR[3]), .B0(n1576), .Y(
        n1541) );
  OAI22X1TS U2030 ( .A0(n1542), .A1(n1541), .B0(n1540), .B1(n1652), .Y(n769)
         );
  INVX2TS U2031 ( .A(n1570), .Y(n1572) );
  AOI21X1TS U2032 ( .A0(DMP_EXP_EWSW[23]), .A1(n925), .B0(n1546), .Y(n1543) );
  INVX2TS U2033 ( .A(n1571), .Y(n1552) );
  AOI21X1TS U2034 ( .A0(DMP_EXP_EWSW[24]), .A1(n887), .B0(n1544), .Y(n1545) );
  XNOR2X1TS U2035 ( .A(n1546), .B(n1545), .Y(n1547) );
  XNOR2X1TS U2036 ( .A(n1550), .B(n1549), .Y(n1551) );
  OAI222X1TS U2037 ( .A0(n1566), .A1(n1707), .B0(n1648), .B1(n1567), .C0(n1635), .C1(n1568), .Y(n729) );
  OAI222X1TS U2038 ( .A0(n1566), .A1(n1649), .B0(n924), .B1(n1567), .C0(n1676), 
        .C1(n1568), .Y(n728) );
  OAI222X1TS U2039 ( .A0(n1566), .A1(n1712), .B0(n1650), .B1(n1567), .C0(n1689), .C1(n1568), .Y(n727) );
  INVX2TS U2040 ( .A(n1620), .Y(n1562) );
  BUFX3TS U2041 ( .A(n1714), .Y(n1557) );
  BUFX3TS U2042 ( .A(n895), .Y(n1558) );
  BUFX3TS U2043 ( .A(n1631), .Y(n1615) );
  INVX2TS U2044 ( .A(n1620), .Y(n1574) );
  INVX2TS U2045 ( .A(n1571), .Y(n1559) );
  BUFX3TS U2046 ( .A(n1714), .Y(n1560) );
  INVX2TS U2047 ( .A(n895), .Y(n1561) );
  BUFX3TS U2048 ( .A(n1714), .Y(n1573) );
  INVX2TS U2049 ( .A(n989), .Y(n1584) );
  BUFX3TS U2050 ( .A(n989), .Y(n1582) );
  INVX2TS U2051 ( .A(n1570), .Y(n1563) );
  BUFX3TS U2052 ( .A(n1571), .Y(n1564) );
  BUFX3TS U2053 ( .A(n1570), .Y(n1565) );
  OAI222X1TS U2054 ( .A0(n1568), .A1(n1707), .B0(n887), .B1(n1567), .C0(n1635), 
        .C1(n1566), .Y(n563) );
  OAI222X1TS U2055 ( .A0(n1568), .A1(n1649), .B0(n1708), .B1(n1567), .C0(n1676), .C1(n1566), .Y(n562) );
  OAI222X1TS U2056 ( .A0(n1568), .A1(n1712), .B0(n889), .B1(n1567), .C0(n1689), 
        .C1(n1566), .Y(n561) );
  OAI2BB1X1TS U2057 ( .A0N(underflow_flag), .A1N(n1610), .B0(n1569), .Y(n559)
         );
  AOI22X1TS U2058 ( .A0(n1588), .A1(n1578), .B0(n1634), .B1(n1582), .Y(n540)
         );
  XOR2X1TS U2059 ( .A(n1579), .B(DMP_SFG[1]), .Y(n1581) );
  XNOR2X1TS U2060 ( .A(n1581), .B(n1580), .Y(n1583) );
  AOI22X1TS U2061 ( .A0(n1588), .A1(n1583), .B0(n1647), .B1(n1582), .Y(n539)
         );
  AOI22X1TS U2062 ( .A0(n1588), .A1(intadd_50_SUM_1_), .B0(n1654), .B1(n989), 
        .Y(n537) );
  AOI22X1TS U2063 ( .A0(n1588), .A1(intadd_50_SUM_2_), .B0(n1702), .B1(n989), 
        .Y(n536) );
  XOR2X1TS U2064 ( .A(n1585), .B(DMP_SFG[5]), .Y(n1586) );
  XOR2X1TS U2065 ( .A(intadd_50_n1), .B(n1586), .Y(n1587) );
  AOI22X1TS U2066 ( .A0(n1588), .A1(n1587), .B0(n1655), .B1(n989), .Y(n535) );
  OAI2BB2XLTS U2067 ( .B0(n1596), .B1(n916), .A0N(final_result_ieee[7]), .A1N(
        n1701), .Y(n505) );
  OAI2BB2XLTS U2068 ( .B0(n1597), .B1(n916), .A0N(final_result_ieee[6]), .A1N(
        n1701), .Y(n503) );
  OAI2BB2XLTS U2069 ( .B0(n1630), .B1(n1611), .A0N(final_result_ieee[5]), 
        .A1N(n1607), .Y(n501) );
  OAI2BB2XLTS U2070 ( .B0(n1628), .B1(n916), .A0N(final_result_ieee[4]), .A1N(
        n1607), .Y(n499) );
  OAI2BB2XLTS U2071 ( .B0(n1626), .B1(n916), .A0N(final_result_ieee[3]), .A1N(
        n1607), .Y(n497) );
  OAI2BB2XLTS U2072 ( .B0(n1623), .B1(n916), .A0N(final_result_ieee[2]), .A1N(
        n1607), .Y(n495) );
  AOI22X1TS U2073 ( .A0(Data_array_SWR[22]), .A1(n899), .B0(n888), .B1(n1608), 
        .Y(n1621) );
  OAI2BB2XLTS U2074 ( .B0(n1621), .B1(n916), .A0N(final_result_ieee[1]), .A1N(
        n1701), .Y(n493) );
  AOI22X1TS U2075 ( .A0(Data_array_SWR[23]), .A1(n900), .B0(n905), .B1(n1609), 
        .Y(n1619) );
  OAI2BB2XLTS U2076 ( .B0(n1619), .B1(n916), .A0N(final_result_ieee[0]), .A1N(
        n1701), .Y(n492) );
  OAI2BB2XLTS U2077 ( .B0(n1612), .B1(n916), .A0N(final_result_ieee[22]), 
        .A1N(n1610), .Y(n489) );
  AOI22X1TS U2078 ( .A0(Data_array_SWR[25]), .A1(n900), .B0(n1617), .B1(n1613), 
        .Y(n1614) );
  AOI22X1TS U2079 ( .A0(n1615), .A1(n1614), .B0(n922), .B1(n1629), .Y(n488) );
  AOI22X1TS U2080 ( .A0(Data_array_SWR[24]), .A1(n900), .B0(n1617), .B1(n1616), 
        .Y(n1618) );
  AOI22X1TS U2081 ( .A0(n1620), .A1(n1618), .B0(n923), .B1(n1629), .Y(n487) );
  AOI22X1TS U2082 ( .A0(n1620), .A1(n1619), .B0(n1696), .B1(n1629), .Y(n486)
         );
  AOI22X1TS U2083 ( .A0(n1631), .A1(n1621), .B0(n1697), .B1(n1629), .Y(n485)
         );
  AOI22X1TS U2084 ( .A0(n1624), .A1(n1623), .B0(n1622), .B1(n1629), .Y(n484)
         );
  AOI22X1TS U2085 ( .A0(n1631), .A1(n1626), .B0(n1625), .B1(n1629), .Y(n483)
         );
  AOI22X1TS U2086 ( .A0(n1631), .A1(n1628), .B0(n1627), .B1(n1629), .Y(n482)
         );
  AOI22X1TS U2087 ( .A0(n1631), .A1(n1630), .B0(n1695), .B1(n1629), .Y(n481)
         );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpadd_approx_syn_constraints_clk10.tcl_GeArN16R4P4_syn.sdf"); 
 endmodule

