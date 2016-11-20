/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 19:07:56 2016
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
         ZERO_FLAG_SFG, inst_FSM_INPUT_ENABLE_state_next_1_, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952,
         DP_OP_15J10_123_2691_n8, DP_OP_15J10_123_2691_n7,
         DP_OP_15J10_123_2691_n6, DP_OP_15J10_123_2691_n5,
         DP_OP_15J10_123_2691_n4, intadd_4_B_9_, intadd_4_B_8_, intadd_4_B_7_,
         intadd_4_B_6_, intadd_4_B_5_, intadd_4_B_4_, intadd_4_B_3_,
         intadd_4_B_2_, intadd_4_B_1_, intadd_4_B_0_, intadd_4_CI,
         intadd_4_SUM_9_, intadd_4_SUM_8_, intadd_4_SUM_7_, intadd_4_SUM_6_,
         intadd_4_SUM_5_, intadd_4_SUM_4_, intadd_4_SUM_3_, intadd_4_SUM_2_,
         intadd_4_SUM_1_, intadd_4_SUM_0_, intadd_4_n10, intadd_4_n9,
         intadd_4_n8, intadd_4_n7, intadd_4_n6, intadd_4_n5, intadd_4_n4,
         intadd_4_n3, intadd_4_n2, intadd_4_n1, n953, n954, n955, n956, n957,
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
         n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151,
         n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1161, n1162,
         n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172,
         n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182,
         n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192,
         n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202,
         n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212,
         n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222,
         n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232,
         n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242,
         n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252,
         n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262,
         n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272,
         n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282,
         n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292,
         n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302,
         n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312,
         n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322,
         n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353,
         n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363,
         n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373,
         n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383,
         n1384, n1385, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404,
         n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414,
         n1415, n1416, n1417, n1419, n1420, n1421, n1422, n1423, n1424, n1425,
         n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435,
         n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445,
         n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455,
         n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465,
         n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475,
         n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485,
         n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495,
         n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505,
         n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1514, n1515, n1516,
         n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526,
         n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536,
         n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546,
         n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556,
         n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566,
         n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576,
         n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586,
         n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596,
         n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606,
         n1607, n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617,
         n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626, n1627,
         n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635, n1636, n1637,
         n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645, n1646, n1647,
         n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655, n1656, n1657,
         n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665, n1666, n1667,
         n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675, n1676, n1677,
         n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685, n1686, n1687,
         n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695, n1696, n1697,
         n1698, n1699, n1700, n1701, n1702, n1703, n1704, n1705, n1706, n1707,
         n1708, n1709, n1710, n1711, n1712, n1713, n1714, n1715, n1716, n1717,
         n1718, n1720, n1721, n1722, n1723, n1724, n1725, n1726, n1727, n1728,
         n1729, n1730, n1731, n1732, n1733, n1734, n1735, n1736, n1737, n1738,
         n1739, n1740, n1741, n1742, n1743, n1744, n1745, n1746, n1747, n1748,
         n1749, n1751, n1752, n1753;
  wire   [1:0] Shift_reg_FLAGS_7;
  wire   [31:0] intDX_EWSW;
  wire   [31:0] intDY_EWSW;
  wire   [30:0] DMP_EXP_EWSW;
  wire   [27:0] DmP_EXP_EWSW;
  wire   [30:0] DMP_SHT1_EWSW;
  wire   [22:1] DmP_mant_SHT1_SW;
  wire   [4:0] Shift_amount_SHT1_EWR;
  wire   [25:1] Raw_mant_NRM_SWR;
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

  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(n947), .CK(clk), .RN(n1722), .QN(
        n963) );
  DFFRXLTS INPUT_STAGE_FLAGS_Q_reg_0_ ( .D(n911), .CK(clk), .RN(n1723), .Q(
        intAS) );
  DFFRXLTS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n910), .CK(clk), .RN(n1726), .Q(
        left_right_SHT2) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n1735), 
        .Q(ready) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(n846), .CK(clk), .RN(n1727), 
        .Q(Shift_amount_SHT1_EWR[1]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(n845), .CK(clk), .RN(n1728), 
        .Q(Shift_amount_SHT1_EWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(n844), .CK(clk), .RN(n1724), 
        .Q(Shift_amount_SHT1_EWR[3]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(n843), .CK(clk), .RN(n1741), 
        .Q(Shift_amount_SHT1_EWR[4]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(n842), .CK(clk), .RN(n1735), .Q(
        final_result_ieee[23]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(n841), .CK(clk), .RN(n1731), .Q(
        final_result_ieee[24]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(n840), .CK(clk), .RN(n1734), .Q(
        final_result_ieee[25]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(n839), .CK(clk), .RN(n1733), .Q(
        final_result_ieee[26]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(n838), .CK(clk), .RN(n973), .Q(
        final_result_ieee[27]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(n837), .CK(clk), .RN(n1747), .Q(
        final_result_ieee[28]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(n836), .CK(clk), .RN(n1736), .Q(
        final_result_ieee[29]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(n835), .CK(clk), .RN(n1748), .Q(
        final_result_ieee[30]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(n834), .CK(clk), .RN(n1727), .Q(
        DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(n833), .CK(clk), .RN(n1725), .Q(
        DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(n832), .CK(clk), .RN(n1725), .Q(
        DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(n831), .CK(clk), .RN(n1735), .Q(
        DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(n830), .CK(clk), .RN(n1724), .Q(
        DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(n829), .CK(clk), .RN(n1729), .Q(
        DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(n828), .CK(clk), .RN(n1727), .Q(
        DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(n827), .CK(clk), .RN(n1725), .Q(
        DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(n826), .CK(clk), .RN(n1015), .Q(
        DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(n825), .CK(clk), .RN(n1723), .Q(
        DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(n824), .CK(clk), .RN(n1726), .Q(
        DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(n823), .CK(clk), .RN(n1727), .Q(
        DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(n822), .CK(clk), .RN(n1721), .Q(
        DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(n821), .CK(clk), .RN(n1722), .Q(
        DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(n820), .CK(clk), .RN(n1730), .Q(
        DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(n819), .CK(clk), .RN(n1723), .Q(
        DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(n818), .CK(clk), .RN(n1743), .Q(
        DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(n817), .CK(clk), .RN(n1726), .Q(
        DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(n816), .CK(clk), .RN(n1721), .Q(
        DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(n815), .CK(clk), .RN(n1722), .Q(
        DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(n814), .CK(clk), .RN(n1730), .Q(
        DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(n813), .CK(clk), .RN(n1733), .Q(
        DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(n812), .CK(clk), .RN(n1734), .Q(
        DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_27_ ( .D(n807), .CK(clk), .RN(n1731), .QN(n964)
         );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(n806), .CK(clk), .RN(n1732), .Q(
        DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(n805), .CK(clk), .RN(n1748), .Q(
        DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(n804), .CK(clk), .RN(n1736), .Q(
        DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(n803), .CK(clk), .RN(n1747), .Q(
        OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_0_ ( .D(n802), .CK(clk), .RN(n1731), .Q(
        ZERO_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(n801), .CK(clk), .RN(n1732), .Q(
        SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(n800), .CK(clk), .RN(n1748), .Q(
        DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(n799), .CK(clk), .RN(n1736), .Q(
        DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(n797), .CK(clk), .RN(n1747), .Q(
        DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(n796), .CK(clk), .RN(n1732), .Q(
        DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(n794), .CK(clk), .RN(n1748), .Q(
        DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(n793), .CK(clk), .RN(n1736), .Q(
        DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(n791), .CK(clk), .RN(n1747), .Q(
        DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(n790), .CK(clk), .RN(n973), .Q(
        DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(n788), .CK(clk), .RN(n1728), .Q(
        DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(n787), .CK(clk), .RN(n973), .Q(
        DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(n785), .CK(clk), .RN(n973), .Q(
        DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(n784), .CK(clk), .RN(n1013), .Q(
        DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(n782), .CK(clk), .RN(n1743), .Q(
        DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(n781), .CK(clk), .RN(n1742), .Q(
        DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(n779), .CK(clk), .RN(n1722), .Q(
        DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(n778), .CK(clk), .RN(n1743), .Q(
        DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(n776), .CK(clk), .RN(n1742), .Q(
        DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(n775), .CK(clk), .RN(n1742), .Q(
        DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(n773), .CK(clk), .RN(n1726), .Q(
        DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(n772), .CK(clk), .RN(n1729), .Q(
        DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(n770), .CK(clk), .RN(n1742), .Q(
        DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(n769), .CK(clk), .RN(n1741), .Q(
        DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(n767), .CK(clk), .RN(n1742), .Q(
        DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(n766), .CK(clk), .RN(n1728), .Q(
        DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(n764), .CK(clk), .RN(n1734), .Q(
        DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(n763), .CK(clk), .RN(n1731), .Q(
        DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(n761), .CK(clk), .RN(n1732), .Q(
        DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(n760), .CK(clk), .RN(n1748), .Q(
        DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(n758), .CK(clk), .RN(n1736), .Q(
        DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(n757), .CK(clk), .RN(n1747), .Q(
        DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(n755), .CK(clk), .RN(n973), .Q(
        DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(n754), .CK(clk), .RN(n1733), .Q(
        DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(n752), .CK(clk), .RN(n1732), .Q(
        DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(n751), .CK(clk), .RN(n1747), .Q(
        DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(n749), .CK(clk), .RN(n1736), .Q(
        DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(n748), .CK(clk), .RN(n1731), .Q(
        DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(n746), .CK(clk), .RN(n973), .Q(
        DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(n745), .CK(clk), .RN(n1733), .Q(
        DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(n743), .CK(clk), .RN(n1734), .Q(
        DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(n742), .CK(clk), .RN(n1748), .Q(
        DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(n740), .CK(clk), .RN(n1748), .Q(
        DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(n739), .CK(clk), .RN(n1737), .Q(
        DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(n737), .CK(clk), .RN(n1734), .Q(
        DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(n736), .CK(clk), .RN(n1734), .Q(
        DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(n734), .CK(clk), .RN(n1013), .Q(
        DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(n733), .CK(clk), .RN(n1726), .Q(
        DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(n731), .CK(clk), .RN(n1742), .Q(
        DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(n730), .CK(clk), .RN(n1729), .Q(
        DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(n729), .CK(clk), .RN(n1746), .Q(
        DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(n728), .CK(clk), .RN(n1726), .Q(
        DMP_exp_NRM_EW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(n726), .CK(clk), .RN(n1748), .Q(
        DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(n725), .CK(clk), .RN(n1742), .Q(
        DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(n724), .CK(clk), .RN(n1748), .Q(
        DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(n723), .CK(clk), .RN(n1723), .Q(
        DMP_exp_NRM_EW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(n721), .CK(clk), .RN(n1737), .Q(
        DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(n720), .CK(clk), .RN(n1740), .Q(
        DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(n719), .CK(clk), .RN(n1014), .Q(
        DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(n718), .CK(clk), .RN(n1731), .Q(
        DMP_exp_NRM_EW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(n716), .CK(clk), .RN(n1013), .Q(
        DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(n715), .CK(clk), .RN(n1740), .Q(
        DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(n714), .CK(clk), .RN(n1735), .Q(
        DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(n713), .CK(clk), .RN(n1728), .Q(
        DMP_exp_NRM_EW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(n711), .CK(clk), .RN(n1735), .Q(
        DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(n710), .CK(clk), .RN(n1728), .Q(
        DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(n709), .CK(clk), .RN(n1735), .Q(
        DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(n708), .CK(clk), .RN(n1728), .Q(
        DMP_exp_NRM_EW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(n706), .CK(clk), .RN(n1735), .Q(
        DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(n705), .CK(clk), .RN(n1728), .Q(
        DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(n704), .CK(clk), .RN(n1735), .Q(
        DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(n703), .CK(clk), .RN(n1728), .Q(
        DMP_exp_NRM_EW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(n701), .CK(clk), .RN(n1735), .Q(
        DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(n700), .CK(clk), .RN(n1728), .Q(
        DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(n699), .CK(clk), .RN(n1748), .Q(
        DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(n698), .CK(clk), .RN(n1736), .Q(
        DMP_exp_NRM_EW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(n696), .CK(clk), .RN(n1731), .Q(
        DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(n695), .CK(clk), .RN(n1747), .Q(
        DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(n694), .CK(clk), .RN(n1732), .Q(
        DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(n693), .CK(clk), .RN(n1748), .Q(
        DMP_exp_NRM_EW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(n691), .CK(clk), .RN(n1736), .Q(
        DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(n690), .CK(clk), .RN(n1747), .QN(
        n965) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(n689), .CK(clk), .RN(n973), .Q(
        DmP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(n687), .CK(clk), .RN(n1733), .Q(
        DmP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(n685), .CK(clk), .RN(n1737), .Q(
        DmP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(n683), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(n682), .CK(clk), .RN(n1737), .QN(
        n971) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(n681), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(n680), .CK(clk), .RN(n1737), .QN(
        n972) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(n679), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(n677), .CK(clk), .RN(n1746), .Q(
        DmP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(n675), .CK(clk), .RN(n1737), .Q(
        DmP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(n673), .CK(clk), .RN(n1738), .Q(
        DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(n672), .CK(clk), .RN(n1741), .QN(
        n966) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(n671), .CK(clk), .RN(n1738), .Q(
        DmP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(n669), .CK(clk), .RN(n1738), .Q(
        DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(n668), .CK(clk), .RN(n1738), 
        .QN(n967) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(n667), .CK(clk), .RN(n1738), .Q(
        DmP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(n665), .CK(clk), .RN(n1738), .Q(
        DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(n664), .CK(clk), .RN(n1738), 
        .QN(n968) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(n663), .CK(clk), .RN(n1738), .Q(
        DmP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(n661), .CK(clk), .RN(n1739), .Q(
        DmP_EXP_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(n660), .CK(clk), .RN(n1739), 
        .QN(n969) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(n659), .CK(clk), .RN(n1739), .Q(
        DmP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(n657), .CK(clk), .RN(n1739), .Q(
        DmP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(n655), .CK(clk), .RN(n1739), .Q(
        DmP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(n653), .CK(clk), .RN(n1739), .Q(
        DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(n652), .CK(clk), .RN(n1739), 
        .QN(n970) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(n651), .CK(clk), .RN(n1739), .Q(
        DmP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(n649), .CK(clk), .RN(n1740), .Q(
        DmP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(n647), .CK(clk), .RN(n1740), .Q(
        DmP_EXP_EWSW[22]) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n640), .CK(clk), .RN(n1740), .Q(
        underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n639), .CK(clk), .RN(n1731), .Q(
        overflow_flag) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_0_ ( .D(n638), .CK(clk), .RN(n1740), .Q(
        ZERO_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_0_ ( .D(n637), .CK(clk), .RN(n1740), .Q(
        ZERO_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_0_ ( .D(n636), .CK(clk), .RN(n1729), .Q(
        ZERO_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_0_ ( .D(n635), .CK(clk), .RN(n1741), .Q(
        ZERO_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(n634), .CK(clk), .RN(n1729), .Q(
        ZERO_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(n633), .CK(clk), .RN(n1741), .Q(
        zero_flag) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(n632), .CK(clk), .RN(n1729), .Q(
        OP_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(n631), .CK(clk), .RN(n1741), .Q(
        OP_FLAG_SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(n629), .CK(clk), .RN(n1729), .Q(
        SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(n628), .CK(clk), .RN(n1741), .Q(
        SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(n627), .CK(clk), .RN(n1729), .Q(
        SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(n626), .CK(clk), .RN(n1741), .Q(
        SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n625), .CK(clk), .RN(n1729), .Q(
        SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(n624), .CK(clk), .RN(n1732), .Q(
        final_result_ieee[31]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(n609), .CK(clk), .RN(n1743), .Q(
        DmP_mant_SFG_SWR[1]), .QN(n1003) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(n606), .CK(clk), .RN(n1743), .Q(
        DmP_mant_SFG_SWR[8]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(n603), .CK(clk), .RN(n1743), .Q(
        DmP_mant_SFG_SWR[0]), .QN(n1004) );
  DFFRXLTS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(n602), .CK(clk), .RN(n1743), .QN(
        n960) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(n593), .CK(clk), .RN(n1747), .Q(
        LZD_output_NRM2_EW[0]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(n583), .CK(clk), .RN(n1744), .Q(
        final_result_ieee[10]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n580), .CK(clk), .RN(n1745), .Q(
        DmP_mant_SFG_SWR[11]), .QN(n1008) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n578), .CK(clk), .RN(n1745), .Q(
        DmP_mant_SFG_SWR[10]), .QN(n991) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(n577), .CK(clk), .RN(n1745), .Q(
        final_result_ieee[8]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(n576), .CK(clk), .RN(n1745), .Q(
        final_result_ieee[13]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(n574), .CK(clk), .RN(n1745), .Q(
        final_result_ieee[9]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(n573), .CK(clk), .RN(n1745), .Q(
        final_result_ieee[12]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(n572), .CK(clk), .RN(n1745), .Q(
        final_result_ieee[11]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(n571), .CK(clk), .RN(n1745), .Q(
        final_result_ieee[7]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(n570), .CK(clk), .RN(n1737), .Q(
        final_result_ieee[14]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(n569), .CK(clk), .RN(n1746), .Q(
        final_result_ieee[5]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(n568), .CK(clk), .RN(n1737), .Q(
        final_result_ieee[16]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(n567), .CK(clk), .RN(n1746), .Q(
        final_result_ieee[3]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(n566), .CK(clk), .RN(n1737), .Q(
        final_result_ieee[18]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(n565), .CK(clk), .RN(n1746), .Q(
        final_result_ieee[2]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(n564), .CK(clk), .RN(n1737), .Q(
        final_result_ieee[19]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(n563), .CK(clk), .RN(n1746), .Q(
        final_result_ieee[4]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(n562), .CK(clk), .RN(n1737), .Q(
        final_result_ieee[17]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(n561), .CK(clk), .RN(n1746), .Q(
        final_result_ieee[1]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(n560), .CK(clk), .RN(n1737), .Q(
        final_result_ieee[0]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(n559), .CK(clk), .RN(n1746), .Q(
        final_result_ieee[6]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(n558), .CK(clk), .RN(n1734), .Q(
        final_result_ieee[15]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(n557), .CK(clk), .RN(n1731), .Q(
        final_result_ieee[20]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(n556), .CK(clk), .RN(n1732), .Q(
        final_result_ieee[21]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(n555), .CK(clk), .RN(n1748), .Q(
        final_result_ieee[22]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(n549), .CK(clk), .RN(n1747), .Q(
        DmP_mant_SFG_SWR[20]), .QN(n997) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(n548), .CK(clk), .RN(n973), .Q(
        DmP_mant_SFG_SWR[21]), .QN(n998) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(n545), .CK(clk), .RN(n1733), .Q(
        DmP_mant_SFG_SWR[24]), .QN(n1000) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(n544), .CK(clk), .RN(n1734), .Q(
        DmP_mant_SFG_SWR[25]), .QN(n1001) );
  CMPR32X2TS intadd_4_U11 ( .A(n1670), .B(intadd_4_B_0_), .C(intadd_4_CI), 
        .CO(intadd_4_n10), .S(intadd_4_SUM_0_) );
  CMPR32X2TS intadd_4_U10 ( .A(n1669), .B(intadd_4_B_1_), .C(intadd_4_n10), 
        .CO(intadd_4_n9), .S(intadd_4_SUM_1_) );
  CMPR32X2TS intadd_4_U9 ( .A(n1676), .B(intadd_4_B_2_), .C(intadd_4_n9), .CO(
        intadd_4_n8), .S(intadd_4_SUM_2_) );
  CMPR32X2TS intadd_4_U8 ( .A(n1699), .B(intadd_4_B_3_), .C(intadd_4_n8), .CO(
        intadd_4_n7), .S(intadd_4_SUM_3_) );
  CMPR32X2TS intadd_4_U7 ( .A(n1698), .B(intadd_4_B_4_), .C(intadd_4_n7), .CO(
        intadd_4_n6), .S(intadd_4_SUM_4_) );
  CMPR32X2TS intadd_4_U6 ( .A(n1705), .B(intadd_4_B_5_), .C(intadd_4_n6), .CO(
        intadd_4_n5), .S(intadd_4_SUM_5_) );
  CMPR32X2TS intadd_4_U5 ( .A(n1704), .B(intadd_4_B_6_), .C(intadd_4_n5), .CO(
        intadd_4_n4), .S(intadd_4_SUM_6_) );
  CMPR32X2TS intadd_4_U4 ( .A(n1714), .B(intadd_4_B_7_), .C(intadd_4_n4), .CO(
        intadd_4_n3), .S(intadd_4_SUM_7_) );
  CMPR32X2TS intadd_4_U3 ( .A(n1713), .B(intadd_4_B_8_), .C(intadd_4_n3), .CO(
        intadd_4_n2), .S(intadd_4_SUM_8_) );
  CMPR32X2TS intadd_4_U2 ( .A(n1717), .B(intadd_4_B_9_), .C(intadd_4_n2), .CO(
        intadd_4_n1), .S(intadd_4_SUM_9_) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(n919), .CK(clk), .RN(n1723), 
        .Q(intDX_EWSW[24]), .QN(n1710) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(n864), .CK(clk), .RN(n1735), .Q(
        Data_array_SWR[12]), .QN(n1709) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(n599), .CK(clk), .RN(n1743), .Q(
        Raw_mant_NRM_SWR[3]), .QN(n1702) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(n891), .CK(clk), .RN(n1728), 
        .Q(intDY_EWSW[18]), .QN(n1695) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(n915), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[28]), .QN(n1694) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(n886), .CK(clk), .RN(n1015), 
        .Q(intDY_EWSW[23]), .QN(n1693) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(n889), .CK(clk), .RN(n1724), 
        .Q(intDY_EWSW[20]), .QN(n1690) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(n895), .CK(clk), .RN(n1015), 
        .Q(intDY_EWSW[14]), .QN(n1688) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(n897), .CK(clk), .RN(n1728), 
        .Q(intDY_EWSW[12]), .QN(n1687) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(n901), .CK(clk), .RN(n1727), .Q(
        intDY_EWSW[8]), .QN(n1684) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(n908), .CK(clk), .RN(n1723), .Q(
        intDY_EWSW[1]), .QN(n1683) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(n888), .CK(clk), .RN(n1725), 
        .Q(intDY_EWSW[21]), .QN(n1682) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(n896), .CK(clk), .RN(n1724), 
        .Q(intDY_EWSW[13]), .QN(n1681) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(n892), .CK(clk), .RN(n1727), 
        .Q(intDY_EWSW[17]), .QN(n1679) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(n906), .CK(clk), .RN(n1729), .Q(
        intDY_EWSW[3]), .QN(n1678) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(n937), .CK(clk), .RN(n1722), .Q(
        intDX_EWSW[6]), .QN(n1663) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(n927), .CK(clk), .RN(n1722), 
        .Q(intDX_EWSW[16]), .QN(n1662) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(n938), .CK(clk), .RN(n1726), .Q(
        intDX_EWSW[5]), .QN(n1658) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(n848), .CK(clk), .RN(n1730), .Q(
        shift_value_SHT2_EWR[4]), .QN(n1655) );
  DFFRX1TS inst_ShiftRegister_Q_reg_4_ ( .D(n948), .CK(clk), .RN(n1726), .QN(
        n1718) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(n917), .CK(clk), .RN(n1746), 
        .Q(intDX_EWSW[26]), .QN(n1652) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(n918), .CK(clk), .RN(n1730), 
        .Q(intDX_EWSW[25]), .QN(n1651) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(n866), .CK(clk), .RN(n1727), .Q(
        Data_array_SWR[14]), .QN(n1650) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(n875), .CK(clk), .RN(n1727), .Q(
        Data_array_SWR[23]), .QN(n1646) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(n887), .CK(clk), .RN(n1725), 
        .Q(intDY_EWSW[22]), .QN(n1643) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(
        inst_FSM_INPUT_ENABLE_state_next_1_), .CK(clk), .RN(n1730), .Q(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n1640) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(n936), .CK(clk), .RN(n1730), .Q(
        intDX_EWSW[7]), .QN(n1637) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(n939), .CK(clk), .RN(n1723), .Q(
        intDX_EWSW[4]), .QN(n1636) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(n575), .CK(clk), .RN(n1735), .Q(
        Raw_mant_NRM_SWR[11]), .QN(n1634) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(n611), .CK(clk), .RN(n1743), .Q(
        Raw_mant_NRM_SWR[14]), .QN(n1633) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(n622), .CK(clk), .RN(n1739), .Q(
        Raw_mant_NRM_SWR[16]), .QN(n1631) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(n874), .CK(clk), .RN(n1722), .Q(
        Data_array_SWR[22]), .QN(n1630) );
  DFFRX2TS inst_ShiftRegister_Q_reg_2_ ( .D(n946), .CK(clk), .RN(n1730), .QN(
        n1749) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(n883), .CK(clk), .RN(n1015), 
        .Q(intDY_EWSW[26]), .QN(n1753) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(n894), .CK(clk), .RN(n1741), 
        .Q(intDY_EWSW[15]), .QN(n1752) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(n898), .CK(clk), .RN(n1725), 
        .Q(intDY_EWSW[11]), .QN(n1751) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(n692), .CK(clk), .RN(n1742), .Q(
        DMP_exp_NRM2_EW[7]), .QN(n1703) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(n697), .CK(clk), .RN(n1735), .Q(
        DMP_exp_NRM2_EW[6]), .QN(n1697) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(n702), .CK(clk), .RN(n1014), .Q(
        DMP_exp_NRM2_EW[5]), .QN(n1675) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(n727), .CK(clk), .RN(n1732), .Q(
        DMP_exp_NRM2_EW[0]), .QN(n1659) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(n600), .CK(clk), .RN(n1743), .Q(
        Raw_mant_NRM_SWR[2]), .QN(n1657) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(n596), .CK(clk), .RN(n1743), .Q(
        Raw_mant_NRM_SWR[4]), .QN(n1635) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(n579), .CK(clk), .RN(n1745), .Q(
        Raw_mant_NRM_SWR[12]), .QN(n1653) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(n594), .CK(clk), .RN(n1015), .Q(
        Raw_mant_NRM_SWR[6]), .QN(n1660) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(n587), .CK(clk), .RN(n1744), .Q(
        Raw_mant_NRM_SWR[9]), .QN(n1661) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(n585), .CK(clk), .RN(n1744), .Q(
        Raw_mant_NRM_SWR[10]), .QN(n1656) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(n589), .CK(clk), .RN(n1744), .Q(
        Raw_mant_NRM_SWR[7]), .QN(n1654) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(n621), .CK(clk), .RN(n1015), .Q(
        Raw_mant_NRM_SWR[17]), .QN(n1628) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n951), .CK(clk), .RN(
        n1723), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n1674) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(n617), .CK(clk), .RN(n1736), .Q(
        Raw_mant_NRM_SWR[21]), .QN(n1626) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_26_ ( .D(n808), .CK(clk), .RN(n1733), .Q(
        DMP_EXP_EWSW[26]), .QN(n1711) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_25_ ( .D(n809), .CK(clk), .RN(n1734), .Q(
        DMP_EXP_EWSW[25]), .QN(n1701) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_24_ ( .D(n810), .CK(clk), .RN(n1736), .Q(
        DMP_EXP_EWSW[24]), .QN(n1649) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_26_ ( .D(n642), .CK(clk), .RN(n1740), .Q(
        DmP_EXP_EWSW[26]), .QN(n1708) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_25_ ( .D(n643), .CK(clk), .RN(n1740), .Q(
        DmP_EXP_EWSW[25]), .QN(n1712) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_24_ ( .D(n644), .CK(clk), .RN(n1740), .Q(
        DmP_EXP_EWSW[24]), .QN(n1648) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(n616), .CK(clk), .RN(n1742), .Q(
        Raw_mant_NRM_SWR[22]), .QN(n1625) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(n879), .CK(clk), .RN(n1721), 
        .Q(intDY_EWSW[30]), .QN(n1639) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(n890), .CK(clk), .RN(n1728), 
        .Q(intDY_EWSW[19]), .QN(n1645) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(n882), .CK(clk), .RN(n1722), 
        .Q(intDY_EWSW[27]), .QN(n1691) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(n885), .CK(clk), .RN(n1724), 
        .Q(intDY_EWSW[24]), .QN(n1629) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(n893), .CK(clk), .RN(n1725), 
        .Q(intDY_EWSW[16]), .QN(n1689) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(n900), .CK(clk), .RN(n1725), .Q(
        intDY_EWSW[9]), .QN(n1680) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(n903), .CK(clk), .RN(n1741), .Q(
        intDY_EWSW[6]), .QN(n1672) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(n905), .CK(clk), .RN(n1727), .Q(
        intDY_EWSW[4]), .QN(n1686) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(n904), .CK(clk), .RN(n1728), .Q(
        intDY_EWSW[5]), .QN(n1641) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(n909), .CK(clk), .RN(n1723), .Q(
        intDY_EWSW[0]), .QN(n1642) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(n907), .CK(clk), .RN(n1721), .Q(
        intDY_EWSW[2]), .QN(n1685) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(n913), .CK(clk), .RN(n1722), 
        .Q(intDX_EWSW[30]), .QN(n1644) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(n914), .CK(clk), .RN(n1730), 
        .Q(intDX_EWSW[29]), .QN(n1692) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(n902), .CK(clk), .RN(n1724), .Q(
        intDY_EWSW[7]), .QN(n1673) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(n613), .CK(clk), .RN(n1732), .Q(
        Raw_mant_NRM_SWR[25]), .QN(n1627) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(n880), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[29]), .QN(n1666) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(n862), .CK(clk), .RN(n1741), .Q(
        Data_array_SWR[10]), .QN(n1706) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(n872), .CK(clk), .RN(n1015), .Q(
        Data_array_SWR[20]), .QN(n1715) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(n870), .CK(clk), .RN(n1722), .Q(
        Data_array_SWR[18]), .QN(n1700) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(n867), .CK(clk), .RN(n1725), .Q(
        Data_array_SWR[15]), .QN(n1647) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(n863), .CK(clk), .RN(n1727), .Q(
        Data_array_SWR[11]), .QN(n1707) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(n871), .CK(clk), .RN(n1727), .Q(
        Data_array_SWR[19]), .QN(n1696) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(n940), .CK(clk), .RN(n1722), .Q(
        intDX_EWSW[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(n920), .CK(clk), .RN(n1730), 
        .Q(intDX_EWSW[23]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(n928), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(n922), .CK(clk), .RN(n1722), 
        .Q(intDX_EWSW[21]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(n930), .CK(clk), .RN(n1748), 
        .Q(intDX_EWSW[13]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(n876), .CK(clk), .RN(n1747), .Q(
        Data_array_SWR[24]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(n618), .CK(clk), .RN(n1746), .Q(
        Raw_mant_NRM_SWR[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(n926), .CK(clk), .RN(n1730), 
        .Q(intDX_EWSW[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(n877), .CK(clk), .RN(n1735), .Q(
        Data_array_SWR[25]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(n932), .CK(clk), .RN(n1730), 
        .Q(intDX_EWSW[11]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(n934), .CK(clk), .RN(n1723), .Q(
        intDX_EWSW[9]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(n935), .CK(clk), .RN(n1726), .Q(
        intDX_EWSW[8]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(n916), .CK(clk), .RN(n1721), 
        .Q(intDX_EWSW[27]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(n591), .CK(clk), .RN(n1744), .Q(
        Raw_mant_NRM_SWR[5]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(n865), .CK(clk), .RN(n1724), .Q(
        Data_array_SWR[13]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(n581), .CK(clk), .RN(n1745), .Q(
        Raw_mant_NRM_SWR[13]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(n619), .CK(clk), .RN(n1742), .Q(
        Raw_mant_NRM_SWR[19]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(n623), .CK(clk), .RN(n1014), .Q(
        Raw_mant_NRM_SWR[15]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(n605), .CK(clk), .RN(n1743), .Q(
        Raw_mant_NRM_SWR[8]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(n943), .CK(clk), .RN(n1726), .Q(
        intDX_EWSW[0]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(n925), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[18]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(n608), .CK(clk), .RN(n1743), .Q(
        Raw_mant_NRM_SWR[1]) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n952), .CK(clk), .RN(
        n1723), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(n860), .CK(clk), .RN(n1724), .Q(
        Data_array_SWR[8]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(n868), .CK(clk), .RN(n1725), .Q(
        Data_array_SWR[16]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(n620), .CK(clk), .RN(n1015), .Q(
        Raw_mant_NRM_SWR[18]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(n856), .CK(clk), .RN(n1729), .Q(
        Data_array_SWR[4]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(n857), .CK(clk), .RN(n1735), .Q(
        Data_array_SWR[5]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(n615), .CK(clk), .RN(n1741), .Q(
        Raw_mant_NRM_SWR[23]), .QN(n957) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(n858), .CK(clk), .RN(n1724), .Q(
        Data_array_SWR[6]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(n859), .CK(clk), .RN(n1725), .Q(
        Data_array_SWR[7]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_2_ ( .D(n792), .CK(clk), .RN(n1747), .Q(
        DMP_SFG[2]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_12_ ( .D(n762), .CK(clk), .RN(n1734), .Q(
        DMP_SFG[12]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(n912), .CK(clk), .RN(n1740), 
        .Q(intDX_EWSW[31]) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(n850), .CK(clk), .RN(n1726), .Q(
        shift_value_SHT2_EWR[3]), .QN(n1665) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(n614), .CK(clk), .RN(n1730), .Q(
        Raw_mant_NRM_SWR[24]), .QN(n1011) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_8_ ( .D(n774), .CK(clk), .RN(n1733), .Q(
        DMP_SFG[8]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_1_ ( .D(n795), .CK(clk), .RN(n1731), .Q(
        DMP_SFG[1]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(n646), .CK(clk), .RN(n1740), .Q(
        DmP_mant_SHT1_SW[22]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(n656), .CK(clk), .RN(n1739), .Q(
        DmP_mant_SHT1_SW[17]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(n658), .CK(clk), .RN(n1739), .Q(
        DmP_mant_SHT1_SW[16]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(n676), .CK(clk), .RN(n1737), .Q(
        DmP_mant_SHT1_SW[7]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(n684), .CK(clk), .RN(n1746), .Q(
        DmP_mant_SHT1_SW[3]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(n654), .CK(clk), .RN(n1739), .Q(
        DmP_mant_SHT1_SW[18]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(n666), .CK(clk), .RN(n1738), .Q(
        DmP_mant_SHT1_SW[12]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(n670), .CK(clk), .RN(n1738), .Q(
        DmP_mant_SHT1_SW[10]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(n674), .CK(clk), .RN(n1737), .Q(
        DmP_mant_SHT1_SW[8]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(n899), .CK(clk), .RN(n1725), 
        .Q(intDY_EWSW[10]), .QN(n959) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(n650), .CK(clk), .RN(n1739), .Q(
        DmP_mant_SHT1_SW[20]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(n662), .CK(clk), .RN(n1738), .Q(
        DmP_mant_SHT1_SW[14]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(n648), .CK(clk), .RN(n1740), .Q(
        DmP_mant_SHT1_SW[21]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(n678), .CK(clk), .RN(n1746), .Q(
        DmP_mant_SHT1_SW[6]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(n686), .CK(clk), .RN(n973), .Q(
        DmP_mant_SHT1_SW[2]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(n688), .CK(clk), .RN(n1733), .Q(
        DmP_mant_SHT1_SW[1]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_7_ ( .D(n777), .CK(clk), .RN(n1747), .Q(
        DMP_SFG[7]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_11_ ( .D(n765), .CK(clk), .RN(n1732), .Q(
        DMP_SFG[11]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_4_ ( .D(n786), .CK(clk), .RN(n1722), .Q(
        DMP_SFG[4]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_3_ ( .D(n789), .CK(clk), .RN(n1723), .Q(
        DMP_SFG[3]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n582), .CK(clk), .RN(n1745), .Q(
        DmP_mant_SFG_SWR[13]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n584), .CK(clk), .RN(n1744), .Q(
        DmP_mant_SFG_SWR[12]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(n597), .CK(clk), .RN(n1743), .Q(
        DmP_mant_SFG_SWR[3]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(n601), .CK(clk), .RN(n1743), .Q(
        DmP_mant_SFG_SWR[2]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(n768), .CK(clk), .RN(n1735), .Q(
        DMP_SFG[10]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_6_ ( .D(n780), .CK(clk), .RN(n1014), .Q(
        DMP_SFG[6]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_0_ ( .D(n798), .CK(clk), .RN(n973), .Q(
        DMP_SFG[0]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(n771), .CK(clk), .RN(n1015), .Q(
        DMP_SFG[9]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(n546), .CK(clk), .RN(n1736), .Q(
        DmP_mant_SFG_SWR[23]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(n547), .CK(clk), .RN(n1748), .Q(
        DmP_mant_SFG_SWR[22]) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(n847), .CK(clk), .RN(n1735), 
        .Q(Shift_amount_SHT1_EWR[0]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(n783), .CK(clk), .RN(n1736), .Q(
        DMP_SFG[5]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(n884), .CK(clk), .RN(n1729), 
        .Q(intDY_EWSW[25]), .QN(n1720) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_23_ ( .D(n811), .CK(clk), .RN(n1747), .Q(
        DMP_EXP_EWSW[23]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(n707), .CK(clk), .RN(n1742), .Q(
        DMP_exp_NRM2_EW[4]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(n712), .CK(clk), .RN(n1013), .Q(
        DMP_exp_NRM2_EW[3]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(n717), .CK(clk), .RN(n1721), .Q(
        DMP_exp_NRM2_EW[2]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(n722), .CK(clk), .RN(n1743), .Q(
        DMP_exp_NRM2_EW[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(n854), .CK(clk), .RN(n1724), .Q(
        Data_array_SWR[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(n855), .CK(clk), .RN(n1725), .Q(
        Data_array_SWR[3]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_31_ ( .D(n878), .CK(clk), .RN(n1730), 
        .Q(intDY_EWSW[31]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(n931), .CK(clk), .RN(n1730), 
        .Q(intDX_EWSW[12]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(n923), .CK(clk), .RN(n1726), 
        .Q(intDX_EWSW[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(n929), .CK(clk), .RN(n1721), 
        .Q(intDX_EWSW[14]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(n921), .CK(clk), .RN(n1723), 
        .Q(intDX_EWSW[22]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(n942), .CK(clk), .RN(n1721), .Q(
        intDX_EWSW[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(n941), .CK(clk), .RN(n1721), .Q(
        intDX_EWSW[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(n933), .CK(clk), .RN(n1723), 
        .Q(intDX_EWSW[10]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(n881), .CK(clk), .RN(n1723), 
        .Q(intDY_EWSW[28]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(n924), .CK(clk), .RN(n1722), 
        .Q(intDX_EWSW[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(n861), .CK(clk), .RN(n1741), .Q(
        Data_array_SWR[9]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(n869), .CK(clk), .RN(n1015), .Q(
        Data_array_SWR[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(n873), .CK(clk), .RN(n1725), .Q(
        Data_array_SWR[21]) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(n851), .CK(clk), .RN(n1721), .Q(
        shift_value_SHT2_EWR[2]), .QN(n1664) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_21_ ( .D(n735), .CK(clk), .RN(n1013), .Q(
        DMP_SFG[21]), .QN(n1713) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(n586), .CK(clk), .RN(n1744), .Q(
        DmP_mant_SFG_SWR[9]), .QN(n1009) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(n590), .CK(clk), .RN(n1744), .Q(
        DmP_mant_SFG_SWR[5]), .QN(n1007) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(n595), .CK(clk), .RN(n1744), .Q(
        DmP_mant_SFG_SWR[6]), .QN(n1005) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(n588), .CK(clk), .RN(n1744), .Q(
        DmP_mant_SFG_SWR[7]), .QN(n1010) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_23_ ( .D(n645), .CK(clk), .RN(n1740), .Q(
        DmP_EXP_EWSW[23]), .QN(n999) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(n852), .CK(clk), .RN(n1726), .Q(
        Data_array_SWR[0]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(n853), .CK(clk), .RN(n1741), .Q(
        Data_array_SWR[1]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_27_ ( .D(n641), .CK(clk), .RN(n1740), .Q(
        DmP_EXP_EWSW[27]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n554), .CK(clk), .RN(n1736), .Q(
        DmP_mant_SFG_SWR[15]), .QN(n992) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(n553), .CK(clk), .RN(n1747), .Q(
        DmP_mant_SFG_SWR[16]), .QN(n993) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(n552), .CK(clk), .RN(n1732), .Q(
        DmP_mant_SFG_SWR[17]), .QN(n994) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(n551), .CK(clk), .RN(n1748), .Q(
        DmP_mant_SFG_SWR[18]), .QN(n995) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(n550), .CK(clk), .RN(n1736), .Q(
        DmP_mant_SFG_SWR[19]), .QN(n996) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_19_ ( .D(n741), .CK(clk), .RN(n1732), .Q(
        DMP_SFG[19]), .QN(n1704) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_20_ ( .D(n738), .CK(clk), .RN(n1740), .Q(
        DMP_SFG[20]), .QN(n1714) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_17_ ( .D(n747), .CK(clk), .RN(n1731), .Q(
        DMP_SFG[17]), .QN(n1698) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_15_ ( .D(n753), .CK(clk), .RN(n973), .Q(
        DMP_SFG[15]), .QN(n1676) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_14_ ( .D(n756), .CK(clk), .RN(n1732), .Q(
        DMP_SFG[14]), .QN(n1669) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_13_ ( .D(n759), .CK(clk), .RN(n1748), .Q(
        DMP_SFG[13]), .QN(n1670) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_22_ ( .D(n732), .CK(clk), .RN(n1737), .Q(
        DMP_SFG[22]), .QN(n1717) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_18_ ( .D(n744), .CK(clk), .RN(n1733), .Q(
        DMP_SFG[18]), .QN(n1705) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_16_ ( .D(n750), .CK(clk), .RN(n1734), .Q(
        DMP_SFG[16]), .QN(n1699) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(n604), .CK(clk), .RN(n1739), .Q(
        LZD_output_NRM2_EW[1]), .QN(n1667) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(n610), .CK(clk), .RN(n1742), .Q(
        LZD_output_NRM2_EW[4]), .QN(n1677) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(n598), .CK(clk), .RN(n1015), .Q(
        LZD_output_NRM2_EW[3]), .QN(n1671) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(n607), .CK(clk), .RN(n1733), .Q(
        LZD_output_NRM2_EW[2]), .QN(n1668) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n612), .CK(clk), .RN(n1013), .Q(
        DmP_mant_SFG_SWR[14]), .QN(n1002) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(n592), .CK(clk), .RN(n1744), .Q(
        DmP_mant_SFG_SWR[4]), .QN(n1006) );
  DFFRX2TS inst_ShiftRegister_Q_reg_5_ ( .D(n949), .CK(clk), .RN(n1739), .Q(
        n1632), .QN(n1716) );
  ADDFX1TS DP_OP_15J10_123_2691_U7 ( .A(n1668), .B(DMP_exp_NRM2_EW[2]), .CI(
        DP_OP_15J10_123_2691_n7), .CO(DP_OP_15J10_123_2691_n6), .S(
        exp_rslt_NRM2_EW1[2]) );
  ADDFX1TS DP_OP_15J10_123_2691_U6 ( .A(n1671), .B(DMP_exp_NRM2_EW[3]), .CI(
        DP_OP_15J10_123_2691_n6), .CO(DP_OP_15J10_123_2691_n5), .S(
        exp_rslt_NRM2_EW1[3]) );
  ADDFX1TS DP_OP_15J10_123_2691_U5 ( .A(n1677), .B(DMP_exp_NRM2_EW[4]), .CI(
        DP_OP_15J10_123_2691_n5), .CO(DP_OP_15J10_123_2691_n4), .S(
        exp_rslt_NRM2_EW1[4]) );
  DFFRX4TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(n630), .CK(clk), .RN(n1729), .Q(n1012), .QN(n1638) );
  CMPR32X2TS DP_OP_15J10_123_2691_U8 ( .A(n1667), .B(DMP_exp_NRM2_EW[1]), .C(
        DP_OP_15J10_123_2691_n8), .CO(DP_OP_15J10_123_2691_n7), .S(
        exp_rslt_NRM2_EW1[1]) );
  DFFRX4TS inst_ShiftRegister_Q_reg_1_ ( .D(n945), .CK(clk), .RN(n1730), .Q(
        Shift_reg_FLAGS_7[1]), .QN(n953) );
  DFFRX4TS inst_ShiftRegister_Q_reg_6_ ( .D(n950), .CK(clk), .RN(n1721), .Q(
        Shift_reg_FLAGS_7_6), .QN(n956) );
  DFFRX4TS inst_ShiftRegister_Q_reg_0_ ( .D(n944), .CK(clk), .RN(n1741), .Q(
        Shift_reg_FLAGS_7[0]) );
  NAND2X4TS U964 ( .A(n976), .B(n1602), .Y(n1411) );
  NOR2X6TS U965 ( .A(n1105), .B(n1200), .Y(n1111) );
  CMPR32X2TS U966 ( .A(DMP_SFG[1]), .B(n1039), .C(n1471), .CO(n1484), .S(n1016) );
  AOI222X4TS U967 ( .A0(Data_array_SWR[21]), .A1(n1481), .B0(
        Data_array_SWR[17]), .B1(n1480), .C0(Data_array_SWR[25]), .C1(n1455), 
        .Y(n1445) );
  OAI21XLTS U968 ( .A0(Raw_mant_NRM_SWR[7]), .A1(Raw_mant_NRM_SWR[6]), .B0(
        n1207), .Y(n1208) );
  OAI21XLTS U969 ( .A0(n1369), .A1(n987), .B0(n1306), .Y(n868) );
  INVX3TS U970 ( .A(n1309), .Y(n1377) );
  INVX3TS U971 ( .A(n1303), .Y(n1280) );
  CLKINVX6TS U972 ( .A(n1379), .Y(n1238) );
  AND2X2TS U973 ( .A(n1239), .B(n1387), .Y(n1240) );
  OAI211X2TS U974 ( .A0(n1660), .A1(n1227), .B0(n1226), .C0(n1225), .Y(n1243)
         );
  AOI31X1TS U975 ( .A0(n1224), .A1(Raw_mant_NRM_SWR[8]), .A2(n1661), .B0(n1335), .Y(n1225) );
  AND2X4TS U976 ( .A(Shift_reg_FLAGS_7_6), .B(n1105), .Y(n1151) );
  AO21X1TS U977 ( .A0(n1219), .A1(Raw_mant_NRM_SWR[18]), .B0(n1327), .Y(n1228)
         );
  INVX4TS U978 ( .A(n1352), .Y(n954) );
  NOR2X6TS U979 ( .A(shift_value_SHT2_EWR[4]), .B(n1464), .Y(n1430) );
  CLKINVX3TS U980 ( .A(n1550), .Y(n1429) );
  AND2X4TS U981 ( .A(beg_OP), .B(n1347), .Y(n1351) );
  INVX3TS U982 ( .A(n1387), .Y(n955) );
  CLKINVX3TS U983 ( .A(n1549), .Y(n1438) );
  NOR2BX4TS U984 ( .AN(Shift_amount_SHT1_EWR[0]), .B(Shift_reg_FLAGS_7[1]), 
        .Y(n1296) );
  NAND2BXLTS U985 ( .AN(intDX_EWSW[2]), .B(intDY_EWSW[2]), .Y(n1054) );
  NAND2BXLTS U986 ( .AN(intDX_EWSW[19]), .B(intDY_EWSW[19]), .Y(n1088) );
  NAND2BXLTS U987 ( .AN(intDX_EWSW[27]), .B(intDY_EWSW[27]), .Y(n1042) );
  NAND2BXLTS U988 ( .AN(intDX_EWSW[9]), .B(intDY_EWSW[9]), .Y(n1067) );
  NAND2BXLTS U989 ( .AN(intDX_EWSW[13]), .B(intDY_EWSW[13]), .Y(n1063) );
  NAND2BXLTS U990 ( .AN(intDX_EWSW[21]), .B(intDY_EWSW[21]), .Y(n1082) );
  CLKAND2X2TS U991 ( .A(n1321), .B(n1322), .Y(n1320) );
  OAI211XLTS U992 ( .A0(n1045), .A1(n1100), .B0(n1044), .C0(n1043), .Y(n1050)
         );
  NAND3XLTS U993 ( .A(n1753), .B(n1042), .C(intDX_EWSW[26]), .Y(n1044) );
  NAND3BXLTS U994 ( .AN(n1086), .B(n1084), .C(n1083), .Y(n1103) );
  AO22XLTS U995 ( .A0(DmP_mant_SFG_SWR[4]), .A1(n1514), .B0(n1638), .B1(n1006), 
        .Y(n961) );
  AOI31XLTS U996 ( .A0(n1653), .A1(Raw_mant_NRM_SWR[11]), .A2(n1229), .B0(
        n1228), .Y(n1236) );
  NAND2BXLTS U997 ( .AN(n1227), .B(Raw_mant_NRM_SWR[5]), .Y(n1332) );
  AOI222X4TS U998 ( .A0(Data_array_SWR[21]), .A1(n1429), .B0(
        Data_array_SWR[17]), .B1(n1430), .C0(Data_array_SWR[25]), .C1(n1438), 
        .Y(n1527) );
  NAND2BXLTS U999 ( .AN(n1338), .B(n1032), .Y(n1034) );
  AOI222X1TS U1000 ( .A0(Raw_mant_NRM_SWR[16]), .A1(n1380), .B0(n989), .B1(
        DmP_mant_SHT1_SW[7]), .C0(n1370), .C1(DmP_mant_SHT1_SW[8]), .Y(n1275)
         );
  AOI222X1TS U1001 ( .A0(Raw_mant_NRM_SWR[20]), .A1(n1380), .B0(n989), .B1(
        DmP_mant_SHT1_SW[3]), .C0(n1370), .C1(n977), .Y(n1288) );
  AOI222X1TS U1002 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n1380), .B0(n989), .B1(
        DmP_mant_SHT1_SW[2]), .C0(n1370), .C1(DmP_mant_SHT1_SW[3]), .Y(n1292)
         );
  AOI222X1TS U1003 ( .A0(DMP_SFG[12]), .A1(n974), .B0(DMP_SFG[12]), .B1(n1316), 
        .C0(n974), .C1(n1316), .Y(intadd_4_B_0_) );
  AOI222X1TS U1004 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n1380), .B0(
        DmP_mant_SHT1_SW[20]), .B1(n1370), .C0(n989), .C1(n978), .Y(n1276) );
  AOI222X1TS U1005 ( .A0(Raw_mant_NRM_SWR[14]), .A1(n1380), .B0(n989), .B1(
        n982), .C0(n1370), .C1(DmP_mant_SHT1_SW[10]), .Y(n1284) );
  AOI222X1TS U1006 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n1380), .B0(n989), .B1(
        n981), .C0(n1370), .C1(DmP_mant_SHT1_SW[12]), .Y(n1281) );
  AOI222X1TS U1007 ( .A0(Raw_mant_NRM_SWR[10]), .A1(n1358), .B0(n989), .B1(
        n980), .C0(n1370), .C1(DmP_mant_SHT1_SW[14]), .Y(n1268) );
  AOI222X1TS U1008 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n1380), .B0(n989), .B1(n979), .C0(n1370), .C1(DmP_mant_SHT1_SW[16]), .Y(n1265) );
  OAI21XLTS U1009 ( .A0(n1633), .A1(n1372), .B0(n1307), .Y(n1308) );
  AOI31X1TS U1010 ( .A0(n975), .A1(DMP_SFG[2]), .A2(n1473), .B0(n1483), .Y(
        n1493) );
  OAI21XLTS U1011 ( .A0(n1330), .A1(n1329), .B0(n1328), .Y(n1336) );
  AO22XLTS U1012 ( .A0(Raw_mant_NRM_SWR[1]), .A1(n1358), .B0(n990), .B1(n1360), 
        .Y(n1359) );
  OAI21XLTS U1013 ( .A0(n1702), .A1(n1362), .B0(n1361), .Y(n1363) );
  OAI21XLTS U1014 ( .A0(n1661), .A1(n1362), .B0(n1301), .Y(n1302) );
  OAI21XLTS U1015 ( .A0(n1656), .A1(n1372), .B0(n1367), .Y(n1368) );
  OAI21XLTS U1016 ( .A0(n1653), .A1(n1372), .B0(n1371), .Y(n1373) );
  AOI222X1TS U1017 ( .A0(n1575), .A1(n1620), .B0(Data_array_SWR[9]), .B1(n1593), .C0(n1574), .C1(n1591), .Y(n1605) );
  AOI222X1TS U1018 ( .A0(n1575), .A1(n1597), .B0(n1621), .B1(Data_array_SWR[9]), .C0(n1574), .C1(n1512), .Y(n1573) );
  CLKINVX3TS U1019 ( .A(n1411), .Y(n1613) );
  BUFX4TS U1020 ( .A(n1718), .Y(n1413) );
  AOI2BB2XLTS U1021 ( .B0(Raw_mant_NRM_SWR[3]), .B1(n1377), .A0N(n1293), .A1N(
        n1238), .Y(n1261) );
  AOI2BB2XLTS U1022 ( .B0(Raw_mant_NRM_SWR[7]), .B1(n1377), .A0N(n1279), .A1N(
        n1238), .Y(n1263) );
  OAI211XLTS U1023 ( .A0(n1275), .A1(n987), .B0(n1274), .C0(n1273), .Y(n861)
         );
  AOI2BB2XLTS U1024 ( .B0(Raw_mant_NRM_SWR[15]), .B1(n1377), .A0N(n1284), 
        .A1N(n1238), .Y(n1273) );
  AO22XLTS U1025 ( .A0(n1348), .A1(Data_X[19]), .B0(n954), .B1(intDX_EWSW[19]), 
        .Y(n924) );
  AO22XLTS U1026 ( .A0(n1351), .A1(Data_Y[28]), .B0(n1355), .B1(intDY_EWSW[28]), .Y(n881) );
  AO22XLTS U1027 ( .A0(n1354), .A1(Data_X[10]), .B0(n954), .B1(intDX_EWSW[10]), 
        .Y(n933) );
  AO22XLTS U1028 ( .A0(n1356), .A1(Data_Y[31]), .B0(n954), .B1(intDY_EWSW[31]), 
        .Y(n878) );
  AO22XLTS U1029 ( .A0(n1613), .A1(DMP_SHT2_EWSW[5]), .B0(n1611), .B1(
        DMP_SFG[5]), .Y(n783) );
  AO22XLTS U1030 ( .A0(n1616), .A1(DMP_SHT2_EWSW[9]), .B0(n1611), .B1(
        DMP_SFG[9]), .Y(n771) );
  AO22XLTS U1031 ( .A0(n1528), .A1(DMP_SHT2_EWSW[0]), .B0(n1611), .B1(
        DMP_SFG[0]), .Y(n798) );
  AO22XLTS U1032 ( .A0(n1528), .A1(DMP_SHT2_EWSW[6]), .B0(n1611), .B1(
        DMP_SFG[6]), .Y(n780) );
  AO22XLTS U1033 ( .A0(n1528), .A1(DMP_SHT2_EWSW[10]), .B0(n1611), .B1(
        DMP_SFG[10]), .Y(n768) );
  AO22XLTS U1034 ( .A0(n1613), .A1(n1589), .B0(n1611), .B1(DmP_mant_SFG_SWR[2]), .Y(n601) );
  AO22XLTS U1035 ( .A0(n1616), .A1(n1588), .B0(n1611), .B1(DmP_mant_SFG_SWR[3]), .Y(n597) );
  AO22XLTS U1036 ( .A0(n1528), .A1(n1524), .B0(n1611), .B1(
        DmP_mant_SFG_SWR[12]), .Y(n584) );
  AO22XLTS U1037 ( .A0(n1616), .A1(n1572), .B0(n1617), .B1(
        DmP_mant_SFG_SWR[13]), .Y(n582) );
  AO22XLTS U1038 ( .A0(n1613), .A1(DMP_SHT2_EWSW[3]), .B0(n1411), .B1(
        DMP_SFG[3]), .Y(n789) );
  AO22XLTS U1039 ( .A0(n1616), .A1(DMP_SHT2_EWSW[4]), .B0(n1411), .B1(
        DMP_SFG[4]), .Y(n786) );
  AO22XLTS U1040 ( .A0(n1528), .A1(DMP_SHT2_EWSW[11]), .B0(n1611), .B1(
        DMP_SFG[11]), .Y(n765) );
  AO22XLTS U1041 ( .A0(n1632), .A1(DmP_EXP_EWSW[1]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n688) );
  AO22XLTS U1042 ( .A0(n1632), .A1(DmP_EXP_EWSW[2]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n686) );
  AO22XLTS U1043 ( .A0(n1632), .A1(DmP_EXP_EWSW[6]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n678) );
  AO22XLTS U1044 ( .A0(n1423), .A1(DmP_EXP_EWSW[14]), .B0(n1414), .B1(
        DmP_mant_SHT1_SW[14]), .Y(n662) );
  AO22XLTS U1045 ( .A0(n1423), .A1(DmP_EXP_EWSW[20]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[20]), .Y(n650) );
  AO22XLTS U1046 ( .A0(n1632), .A1(DmP_EXP_EWSW[8]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[8]), .Y(n674) );
  AO22XLTS U1047 ( .A0(n1423), .A1(DmP_EXP_EWSW[10]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[10]), .Y(n670) );
  AO22XLTS U1048 ( .A0(n1423), .A1(DmP_EXP_EWSW[12]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[12]), .Y(n666) );
  AO22XLTS U1049 ( .A0(n1423), .A1(DmP_EXP_EWSW[18]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[18]), .Y(n654) );
  AO22XLTS U1050 ( .A0(n1632), .A1(DmP_EXP_EWSW[3]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[3]), .Y(n684) );
  AO22XLTS U1051 ( .A0(n1632), .A1(DmP_EXP_EWSW[7]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[7]), .Y(n676) );
  AO22XLTS U1052 ( .A0(n1423), .A1(DmP_EXP_EWSW[22]), .B0(n1416), .B1(
        DmP_mant_SHT1_SW[22]), .Y(n646) );
  AO22XLTS U1053 ( .A0(n1616), .A1(DMP_SHT2_EWSW[1]), .B0(n1411), .B1(
        DMP_SFG[1]), .Y(n795) );
  AO22XLTS U1054 ( .A0(n1616), .A1(DMP_SHT2_EWSW[8]), .B0(n1611), .B1(
        DMP_SFG[8]), .Y(n774) );
  AO22XLTS U1055 ( .A0(n1348), .A1(Data_X[31]), .B0(n1353), .B1(intDX_EWSW[31]), .Y(n912) );
  AO22XLTS U1056 ( .A0(n1528), .A1(DMP_SHT2_EWSW[12]), .B0(n1617), .B1(
        DMP_SFG[12]), .Y(n762) );
  AO22XLTS U1057 ( .A0(n1528), .A1(DMP_SHT2_EWSW[2]), .B0(n1411), .B1(
        DMP_SFG[2]), .Y(n792) );
  OAI211XLTS U1058 ( .A0(n1275), .A1(n1238), .B0(n1249), .C0(n1248), .Y(n859)
         );
  OAI211XLTS U1059 ( .A0(n1310), .A1(n1238), .B0(n1257), .C0(n1256), .Y(n858)
         );
  OAI211XLTS U1060 ( .A0(n1288), .A1(n987), .B0(n1287), .C0(n1286), .Y(n857)
         );
  OAI211XLTS U1061 ( .A0(n1292), .A1(n987), .B0(n1291), .C0(n1290), .Y(n856)
         );
  AO22XLTS U1062 ( .A0(n1352), .A1(Data_X[18]), .B0(n1355), .B1(intDX_EWSW[18]), .Y(n925) );
  AO22XLTS U1063 ( .A0(n1356), .A1(Data_X[0]), .B0(n1355), .B1(intDX_EWSW[0]), 
        .Y(n943) );
  NAND2BXLTS U1064 ( .AN(n1532), .B(n1531), .Y(n1533) );
  AOI2BB2XLTS U1065 ( .B0(Raw_mant_NRM_SWR[11]), .B1(n1377), .A0N(n1268), 
        .A1N(n1238), .Y(n1259) );
  OAI211XLTS U1066 ( .A0(n1279), .A1(n987), .B0(n1278), .C0(n1277), .Y(n871)
         );
  AOI2BB2XLTS U1067 ( .B0(Raw_mant_NRM_SWR[5]), .B1(n1377), .A0N(n1276), .A1N(
        n1238), .Y(n1277) );
  OAI211XLTS U1068 ( .A0(n1284), .A1(n987), .B0(n1283), .C0(n1282), .Y(n863)
         );
  AOI2BB2XLTS U1069 ( .B0(Raw_mant_NRM_SWR[13]), .B1(n1377), .A0N(n1281), 
        .A1N(n1238), .Y(n1282) );
  OAI211XLTS U1070 ( .A0(n1268), .A1(n987), .B0(n1267), .C0(n1266), .Y(n867)
         );
  AOI2BB2XLTS U1071 ( .B0(Raw_mant_NRM_SWR[9]), .B1(n1377), .A0N(n1265), .A1N(
        n1238), .Y(n1266) );
  OAI21XLTS U1072 ( .A0(n1365), .A1(n1238), .B0(n1300), .Y(n870) );
  AO22XLTS U1073 ( .A0(n1345), .A1(n1569), .B0(n1346), .B1(n976), .Y(n946) );
  OAI21XLTS U1074 ( .A0(n1357), .A1(n1238), .B0(n1295), .Y(n875) );
  OAI21XLTS U1075 ( .A0(n1387), .A1(n1655), .B0(n1215), .Y(n848) );
  AO22XLTS U1076 ( .A0(n1423), .A1(DmP_EXP_EWSW[15]), .B0(n1414), .B1(n979), 
        .Y(n660) );
  AO22XLTS U1077 ( .A0(n1423), .A1(DmP_EXP_EWSW[13]), .B0(n1416), .B1(n980), 
        .Y(n664) );
  AO22XLTS U1078 ( .A0(n1423), .A1(DmP_EXP_EWSW[11]), .B0(n1416), .B1(n981), 
        .Y(n668) );
  AO22XLTS U1079 ( .A0(n1423), .A1(DmP_EXP_EWSW[9]), .B0(n1416), .B1(n982), 
        .Y(n672) );
  AO22XLTS U1080 ( .A0(n1632), .A1(DmP_EXP_EWSW[5]), .B0(n1416), .B1(n983), 
        .Y(n680) );
  AO22XLTS U1081 ( .A0(n1632), .A1(DmP_EXP_EWSW[4]), .B0(n1416), .B1(n977), 
        .Y(n682) );
  AO22XLTS U1082 ( .A0(n1632), .A1(DmP_EXP_EWSW[0]), .B0(n1424), .B1(n984), 
        .Y(n690) );
  AO22XLTS U1083 ( .A0(n1346), .A1(busy), .B0(n1345), .B1(n976), .Y(n947) );
  OA22X1TS U1084 ( .A0(n1459), .A1(DmP_mant_SFG_SWR[14]), .B0(n1002), .B1(
        n1012), .Y(n958) );
  BUFX3TS U1085 ( .A(n955), .Y(n1385) );
  OR2X1TS U1086 ( .A(Shift_reg_FLAGS_7[1]), .B(Shift_amount_SHT1_EWR[0]), .Y(
        n962) );
  AOI211XLTS U1087 ( .A0(intDY_EWSW[16]), .A1(n1662), .B0(n1091), .C0(n1121), 
        .Y(n1083) );
  OAI211XLTS U1088 ( .A0(n1272), .A1(n987), .B0(n1271), .C0(n1270), .Y(n853)
         );
  NOR2BX2TS U1089 ( .AN(n1330), .B(n1329), .Y(n1219) );
  AOI222X1TS U1090 ( .A0(n1594), .A1(n1597), .B0(n1621), .B1(Data_array_SWR[8]), .C0(n1592), .C1(n1512), .Y(n1590) );
  CLKINVX3TS U1091 ( .A(n1596), .Y(n1621) );
  AOI222X1TS U1092 ( .A0(n1594), .A1(n1620), .B0(Data_array_SWR[8]), .B1(n1593), .C0(n1592), .C1(n1591), .Y(n1606) );
  CLKINVX3TS U1093 ( .A(n1553), .Y(n1593) );
  BUFX4TS U1094 ( .A(n1742), .Y(n1729) );
  BUFX4TS U1095 ( .A(n1742), .Y(n1741) );
  BUFX4TS U1096 ( .A(n1742), .Y(n1739) );
  BUFX4TS U1097 ( .A(n1746), .Y(n1740) );
  NOR2X4TS U1098 ( .A(shift_value_SHT2_EWR[4]), .B(n1620), .Y(n1591) );
  NOR2X4TS U1099 ( .A(shift_value_SHT2_EWR[4]), .B(n1597), .Y(n1512) );
  BUFX4TS U1100 ( .A(n1736), .Y(n1728) );
  BUFX4TS U1101 ( .A(n1723), .Y(n1735) );
  BUFX3TS U1102 ( .A(n1736), .Y(n1015) );
  BUFX3TS U1103 ( .A(n1716), .Y(n1415) );
  NOR4BBX2TS U1104 ( .AN(n1237), .BN(n1236), .C(n1235), .D(n1234), .Y(n1258)
         );
  BUFX3TS U1105 ( .A(n1014), .Y(n973) );
  BUFX4TS U1106 ( .A(n1014), .Y(n1736) );
  BUFX4TS U1107 ( .A(n1014), .Y(n1747) );
  BUFX4TS U1108 ( .A(n1014), .Y(n1748) );
  BUFX4TS U1109 ( .A(n1014), .Y(n1732) );
  BUFX3TS U1110 ( .A(n1741), .Y(n1014) );
  BUFX4TS U1111 ( .A(n1747), .Y(n1743) );
  BUFX4TS U1112 ( .A(n1729), .Y(n1746) );
  BUFX4TS U1113 ( .A(n1728), .Y(n1737) );
  BUFX4TS U1114 ( .A(n1728), .Y(n1722) );
  BUFX4TS U1115 ( .A(n1013), .Y(n1742) );
  NOR2X2TS U1116 ( .A(shift_value_SHT2_EWR[2]), .B(n1665), .Y(n1455) );
  OAI22X2TS U1117 ( .A0(n1630), .A1(n1464), .B0(n1700), .B1(n1463), .Y(n1577)
         );
  OAI22X2TS U1118 ( .A0(n1646), .A1(n1464), .B0(n1696), .B1(n1463), .Y(n1586)
         );
  BUFX4TS U1119 ( .A(n1724), .Y(n1723) );
  BUFX4TS U1120 ( .A(n1729), .Y(n1726) );
  BUFX4TS U1121 ( .A(n1725), .Y(n1730) );
  INVX2TS U1122 ( .A(n958), .Y(n974) );
  XNOR2X2TS U1123 ( .A(DMP_exp_NRM2_EW[7]), .B(n1023), .Y(n1033) );
  INVX2TS U1124 ( .A(n961), .Y(n975) );
  XNOR2X2TS U1125 ( .A(DMP_exp_NRM2_EW[5]), .B(DP_OP_15J10_123_2691_n4), .Y(
        n1035) );
  NOR2X4TS U1126 ( .A(n1463), .B(shift_value_SHT2_EWR[4]), .Y(n1467) );
  BUFX4TS U1127 ( .A(n1106), .Y(n1408) );
  INVX2TS U1128 ( .A(n963), .Y(n976) );
  INVX2TS U1129 ( .A(n971), .Y(n977) );
  INVX2TS U1130 ( .A(n970), .Y(n978) );
  INVX2TS U1131 ( .A(n969), .Y(n979) );
  INVX2TS U1132 ( .A(n968), .Y(n980) );
  INVX2TS U1133 ( .A(n967), .Y(n981) );
  INVX2TS U1134 ( .A(n966), .Y(n982) );
  INVX2TS U1135 ( .A(n972), .Y(n983) );
  INVX2TS U1136 ( .A(n965), .Y(n984) );
  INVX2TS U1137 ( .A(n964), .Y(n985) );
  NOR2X2TS U1138 ( .A(n1258), .B(n953), .Y(n1337) );
  AOI211X1TS U1139 ( .A0(DmP_mant_SHT1_SW[22]), .A1(n953), .B0(n1370), .C0(
        n1359), .Y(n1364) );
  BUFX4TS U1140 ( .A(n1411), .Y(n1611) );
  CLKINVX6TS U1141 ( .A(n1620), .Y(n1597) );
  BUFX6TS U1142 ( .A(left_right_SHT2), .Y(n1620) );
  BUFX4TS U1143 ( .A(n1200), .Y(n1344) );
  INVX2TS U1144 ( .A(n1240), .Y(n986) );
  INVX4TS U1145 ( .A(n1240), .Y(n987) );
  BUFX4TS U1146 ( .A(n1411), .Y(n1617) );
  INVX2TS U1147 ( .A(n962), .Y(n988) );
  INVX4TS U1148 ( .A(n962), .Y(n989) );
  CLKINVX6TS U1149 ( .A(n1411), .Y(n1528) );
  CLKINVX6TS U1150 ( .A(n1411), .Y(n1616) );
  INVX2TS U1151 ( .A(n960), .Y(n990) );
  OAI211XLTS U1152 ( .A0(n1276), .A1(n986), .B0(n1262), .C0(n1261), .Y(n873)
         );
  OAI211XLTS U1153 ( .A0(n1265), .A1(n986), .B0(n1264), .C0(n1263), .Y(n869)
         );
  AOI32X1TS U1154 ( .A0(n1695), .A1(n1088), .A2(intDX_EWSW[18]), .B0(
        intDX_EWSW[19]), .B1(n1645), .Y(n1089) );
  AOI221X1TS U1155 ( .A0(n1695), .A1(intDX_EWSW[18]), .B0(intDX_EWSW[19]), 
        .B1(n1645), .C0(n1121), .Y(n1126) );
  AOI221X1TS U1156 ( .A0(n1691), .A1(intDX_EWSW[27]), .B0(intDY_EWSW[28]), 
        .B1(n1694), .C0(n1114), .Y(n1118) );
  AOI221X1TS U1157 ( .A0(n959), .A1(intDX_EWSW[10]), .B0(intDX_EWSW[11]), .B1(
        n1751), .C0(n1129), .Y(n1134) );
  AOI221X1TS U1158 ( .A0(n1685), .A1(intDX_EWSW[2]), .B0(intDX_EWSW[3]), .B1(
        n1678), .C0(n1137), .Y(n1142) );
  AOI221X1TS U1159 ( .A0(n1683), .A1(intDX_EWSW[1]), .B0(intDX_EWSW[17]), .B1(
        n1679), .C0(n1120), .Y(n1127) );
  AOI221X1TS U1160 ( .A0(n1643), .A1(intDX_EWSW[22]), .B0(intDX_EWSW[23]), 
        .B1(n1693), .C0(n1123), .Y(n1124) );
  AOI221X1TS U1161 ( .A0(n1688), .A1(intDX_EWSW[14]), .B0(intDX_EWSW[15]), 
        .B1(n1752), .C0(n1131), .Y(n1132) );
  OAI211X2TS U1162 ( .A0(intDX_EWSW[20]), .A1(n1690), .B0(n1096), .C0(n1082), 
        .Y(n1091) );
  AOI221X1TS U1163 ( .A0(n1690), .A1(intDX_EWSW[20]), .B0(intDX_EWSW[21]), 
        .B1(n1682), .C0(n1122), .Y(n1125) );
  OAI211X2TS U1164 ( .A0(intDX_EWSW[12]), .A1(n1687), .B0(n1077), .C0(n1063), 
        .Y(n1079) );
  AOI221X1TS U1165 ( .A0(n1687), .A1(intDX_EWSW[12]), .B0(intDX_EWSW[13]), 
        .B1(n1681), .C0(n1130), .Y(n1133) );
  OAI211XLTS U1166 ( .A0(n1288), .A1(n1238), .B0(n1245), .C0(n1244), .Y(n855)
         );
  OAI211XLTS U1167 ( .A0(n1292), .A1(n1238), .B0(n1253), .C0(n1252), .Y(n854)
         );
  OAI31XLTS U1168 ( .A0(n1410), .A1(n1150), .A2(n1419), .B0(n1149), .Y(n801)
         );
  NOR2X2TS U1169 ( .A(n999), .B(DMP_EXP_EWSW[23]), .Y(n1394) );
  BUFX4TS U1170 ( .A(n1729), .Y(n1725) );
  XNOR2X2TS U1171 ( .A(DMP_exp_NRM2_EW[6]), .B(n1020), .Y(n1338) );
  XNOR2X2TS U1172 ( .A(DMP_exp_NRM2_EW[0]), .B(n1317), .Y(n1036) );
  CLKINVX6TS U1173 ( .A(n1459), .Y(n1514) );
  NOR2X2TS U1174 ( .A(n1470), .B(DMP_SFG[3]), .Y(n1482) );
  NOR2X2TS U1175 ( .A(n1446), .B(DMP_SFG[4]), .Y(n1494) );
  NOR2X2TS U1176 ( .A(n1315), .B(DMP_SFG[11]), .Y(n1532) );
  NOR2X2TS U1177 ( .A(n1504), .B(DMP_SFG[7]), .Y(n1559) );
  AOI222X1TS U1178 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n1358), .B0(n988), .B1(
        DmP_mant_SHT1_SW[6]), .C0(n1370), .C1(DmP_mant_SHT1_SW[7]), .Y(n1310)
         );
  AOI222X1TS U1179 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n1358), .B0(n989), .B1(
        DmP_mant_SHT1_SW[17]), .C0(n1370), .C1(DmP_mant_SHT1_SW[18]), .Y(n1279) );
  AOI222X4TS U1180 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n1380), .B0(n989), .B1(
        DmP_mant_SHT1_SW[16]), .C0(n1370), .C1(DmP_mant_SHT1_SW[17]), .Y(n1304) );
  AOI222X1TS U1181 ( .A0(Raw_mant_NRM_SWR[2]), .A1(n1358), .B0(n989), .B1(
        DmP_mant_SHT1_SW[21]), .C0(n1370), .C1(DmP_mant_SHT1_SW[22]), .Y(n1293) );
  OAI211XLTS U1182 ( .A0(n975), .A1(DMP_SFG[2]), .B0(n1471), .C0(DMP_SFG[1]), 
        .Y(n1474) );
  NOR2X4TS U1183 ( .A(n1523), .B(n1522), .Y(n1600) );
  OAI2BB1X2TS U1184 ( .A0N(n1026), .A1N(n1025), .B0(Shift_reg_FLAGS_7[0]), .Y(
        n1522) );
  INVX4TS U1185 ( .A(n1351), .Y(n1353) );
  NAND3X2TS U1186 ( .A(shift_value_SHT2_EWR[2]), .B(shift_value_SHT2_EWR[3]), 
        .C(n1655), .Y(n1549) );
  CLKINVX6TS U1187 ( .A(n1151), .Y(n1417) );
  NAND2X4TS U1188 ( .A(n953), .B(n1413), .Y(n1387) );
  CLKINVX6TS U1189 ( .A(n1413), .Y(n1426) );
  XOR2XLTS U1190 ( .A(DMP_SFG[12]), .B(n974), .Y(n1436) );
  AOI222X1TS U1191 ( .A0(n1578), .A1(n1597), .B0(n1621), .B1(Data_array_SWR[7]), .C0(n1577), .C1(n1512), .Y(n1576) );
  AOI222X1TS U1192 ( .A0(n1578), .A1(n1620), .B0(Data_array_SWR[7]), .B1(n1593), .C0(n1577), .C1(n1591), .Y(n1607) );
  AOI222X1TS U1193 ( .A0(n1587), .A1(n1597), .B0(n1621), .B1(Data_array_SWR[6]), .C0(n1586), .C1(n1512), .Y(n1585) );
  AOI222X1TS U1194 ( .A0(n1587), .A1(n1620), .B0(Data_array_SWR[6]), .B1(n1593), .C0(n1586), .C1(n1591), .Y(n1609) );
  AOI222X1TS U1195 ( .A0(n1581), .A1(n1597), .B0(n1621), .B1(Data_array_SWR[5]), .C0(n1580), .C1(n1512), .Y(n1579) );
  AOI222X1TS U1196 ( .A0(n1581), .A1(n1620), .B0(Data_array_SWR[5]), .B1(n1593), .C0(n1580), .C1(n1591), .Y(n1610) );
  AOI222X1TS U1197 ( .A0(n1584), .A1(n1597), .B0(n1621), .B1(Data_array_SWR[4]), .C0(n1583), .C1(n1512), .Y(n1582) );
  AOI222X1TS U1198 ( .A0(n1584), .A1(n1620), .B0(Data_array_SWR[4]), .B1(n1593), .C0(n1583), .C1(n1591), .Y(n1612) );
  INVX3TS U1199 ( .A(n1420), .Y(n1602) );
  AOI222X4TS U1200 ( .A0(Data_array_SWR[20]), .A1(n1429), .B0(
        Data_array_SWR[24]), .B1(n1438), .C0(Data_array_SWR[16]), .C1(n1430), 
        .Y(n1526) );
  AOI222X4TS U1201 ( .A0(Data_array_SWR[20]), .A1(n1481), .B0(
        Data_array_SWR[24]), .B1(n1455), .C0(Data_array_SWR[16]), .C1(n1480), 
        .Y(n1511) );
  NOR2X2TS U1202 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1674), .Y(n1343) );
  OAI21X2TS U1203 ( .A0(intDX_EWSW[18]), .A1(n1695), .B0(n1088), .Y(n1121) );
  AOI32X1TS U1204 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n1231), .A2(n1230), .B0(
        Raw_mant_NRM_SWR[19]), .B1(n1231), .Y(n1232) );
  NOR3X1TS U1205 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[19]), .C(
        Raw_mant_NRM_SWR[20]), .Y(n1330) );
  NOR2X2TS U1206 ( .A(Raw_mant_NRM_SWR[13]), .B(n1206), .Y(n1229) );
  OAI211XLTS U1207 ( .A0(n1281), .A1(n986), .B0(n1260), .C0(n1259), .Y(n865)
         );
  AOI221X1TS U1208 ( .A0(n1684), .A1(intDX_EWSW[8]), .B0(intDX_EWSW[6]), .B1(
        n1672), .C0(n1139), .Y(n1140) );
  NOR2XLTS U1209 ( .A(n1751), .B(intDX_EWSW[11]), .Y(n1065) );
  OAI21XLTS U1210 ( .A0(intDX_EWSW[15]), .A1(n1752), .B0(intDX_EWSW[14]), .Y(
        n1073) );
  NOR2XLTS U1211 ( .A(n1086), .B(intDY_EWSW[16]), .Y(n1087) );
  OAI21XLTS U1212 ( .A0(intDX_EWSW[21]), .A1(n1682), .B0(intDX_EWSW[20]), .Y(
        n1085) );
  NOR2XLTS U1213 ( .A(Raw_mant_NRM_SWR[17]), .B(Raw_mant_NRM_SWR[16]), .Y(
        n1230) );
  OAI21XLTS U1214 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n1657), .B0(n1635), .Y(n1220) );
  AOI31XLTS U1215 ( .A0(n1219), .A1(Raw_mant_NRM_SWR[16]), .A2(n1628), .B0(
        n1217), .Y(n1226) );
  OAI21XLTS U1216 ( .A0(n1635), .A1(n1372), .B0(n1297), .Y(n1298) );
  OAI21XLTS U1217 ( .A0(n1482), .A1(n1474), .B0(n1493), .Y(n1475) );
  NOR2XLTS U1218 ( .A(n1483), .B(n1482), .Y(n1486) );
  OAI21XLTS U1219 ( .A0(DmP_EXP_EWSW[25]), .A1(n1701), .B0(n1398), .Y(n1395)
         );
  INVX2TS U1220 ( .A(rst), .Y(n1013) );
  AOI31XLTS U1221 ( .A0(n1426), .A1(Shift_amount_SHT1_EWR[4]), .A2(n953), .B0(
        n1319), .Y(n1215) );
  OAI21XLTS U1222 ( .A0(n1343), .A1(n1040), .B0(n1340), .Y(n951) );
  OAI21XLTS U1223 ( .A0(n1752), .A1(n1205), .B0(n1204), .Y(n819) );
  OAI21XLTS U1224 ( .A0(n1683), .A1(n1205), .B0(n1164), .Y(n833) );
  OAI21XLTS U1225 ( .A0(n1375), .A1(n1238), .B0(n1312), .Y(n860) );
  INVX4TS U1226 ( .A(n1413), .Y(busy) );
  BUFX3TS U1227 ( .A(n1014), .Y(n1734) );
  BUFX3TS U1228 ( .A(n1742), .Y(n1738) );
  BUFX3TS U1229 ( .A(n1014), .Y(n1733) );
  BUFX3TS U1230 ( .A(n1732), .Y(n1745) );
  BUFX3TS U1231 ( .A(n1736), .Y(n1727) );
  BUFX3TS U1232 ( .A(n1725), .Y(n1721) );
  BUFX3TS U1233 ( .A(n1732), .Y(n1744) );
  BUFX3TS U1234 ( .A(n1014), .Y(n1731) );
  BUFX3TS U1235 ( .A(n1739), .Y(n1724) );
  AO22XLTS U1236 ( .A0(Shift_reg_FLAGS_7[1]), .A1(ZERO_FLAG_NRM), .B0(n953), 
        .B1(ZERO_FLAG_SHT1SHT2), .Y(n634) );
  AO22XLTS U1237 ( .A0(Shift_reg_FLAGS_7[1]), .A1(SIGN_FLAG_NRM), .B0(n953), 
        .B1(SIGN_FLAG_SHT1SHT2), .Y(n625) );
  BUFX4TS U1238 ( .A(n1749), .Y(n1567) );
  BUFX3TS U1239 ( .A(n1567), .Y(n1546) );
  INVX4TS U1240 ( .A(n1546), .Y(n1487) );
  AOI2BB2X1TS U1241 ( .B0(DmP_mant_SFG_SWR[2]), .B1(n1012), .A0N(n1012), .A1N(
        DmP_mant_SFG_SWR[2]), .Y(n1037) );
  CLKAND2X2TS U1242 ( .A(n1037), .B(DMP_SFG[0]), .Y(n1039) );
  AOI2BB2X1TS U1243 ( .B0(DmP_mant_SFG_SWR[3]), .B1(n1012), .A0N(n1012), .A1N(
        DmP_mant_SFG_SWR[3]), .Y(n1471) );
  AO22XLTS U1244 ( .A0(n1567), .A1(Raw_mant_NRM_SWR[3]), .B0(n1487), .B1(n1016), .Y(n599) );
  BUFX3TS U1245 ( .A(n1638), .Y(n1459) );
  AO22XLTS U1246 ( .A0(n1567), .A1(Raw_mant_NRM_SWR[4]), .B0(n1487), .B1(n1017), .Y(n596) );
  INVX2TS U1247 ( .A(DP_OP_15J10_123_2691_n4), .Y(n1018) );
  NAND2X1TS U1248 ( .A(n1675), .B(n1018), .Y(n1020) );
  INVX2TS U1249 ( .A(n1020), .Y(n1019) );
  NAND2X1TS U1250 ( .A(n1697), .B(n1019), .Y(n1023) );
  INVX1TS U1251 ( .A(LZD_output_NRM2_EW[0]), .Y(n1317) );
  AND4X1TS U1252 ( .A(exp_rslt_NRM2_EW1[3]), .B(n1036), .C(
        exp_rslt_NRM2_EW1[2]), .D(exp_rslt_NRM2_EW1[1]), .Y(n1021) );
  AND4X1TS U1253 ( .A(n1338), .B(n1035), .C(exp_rslt_NRM2_EW1[4]), .D(n1021), 
        .Y(n1022) );
  CLKAND2X2TS U1254 ( .A(n1033), .B(n1022), .Y(n1026) );
  INVX2TS U1255 ( .A(n1023), .Y(n1024) );
  CLKAND2X2TS U1256 ( .A(n1703), .B(n1024), .Y(n1025) );
  INVX2TS U1257 ( .A(n1522), .Y(n1027) );
  CLKBUFX2TS U1258 ( .A(Shift_reg_FLAGS_7[0]), .Y(n1420) );
  AO22XLTS U1259 ( .A0(n1027), .A1(n1033), .B0(n1602), .B1(
        final_result_ieee[30]), .Y(n835) );
  NOR2XLTS U1260 ( .A(n1036), .B(exp_rslt_NRM2_EW1[1]), .Y(n1030) );
  INVX2TS U1261 ( .A(exp_rslt_NRM2_EW1[3]), .Y(n1029) );
  INVX2TS U1262 ( .A(exp_rslt_NRM2_EW1[2]), .Y(n1028) );
  NAND4BXLTS U1263 ( .AN(exp_rslt_NRM2_EW1[4]), .B(n1030), .C(n1029), .D(n1028), .Y(n1031) );
  NOR2XLTS U1264 ( .A(n1031), .B(n1035), .Y(n1032) );
  OR2X1TS U1265 ( .A(n1034), .B(n1033), .Y(n1313) );
  NAND2X2TS U1266 ( .A(n1313), .B(n1420), .Y(n1339) );
  OA22X1TS U1267 ( .A0(n1339), .A1(n1035), .B0(Shift_reg_FLAGS_7[0]), .B1(
        final_result_ieee[28]), .Y(n837) );
  OA22X1TS U1268 ( .A0(n1339), .A1(exp_rslt_NRM2_EW1[1]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[24]), .Y(n841) );
  OA22X1TS U1269 ( .A0(n1339), .A1(exp_rslt_NRM2_EW1[3]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[26]), .Y(n839) );
  OA22X1TS U1270 ( .A0(n1339), .A1(n1036), .B0(Shift_reg_FLAGS_7[0]), .B1(
        final_result_ieee[23]), .Y(n842) );
  OA22X1TS U1271 ( .A0(n1339), .A1(exp_rslt_NRM2_EW1[4]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[27]), .Y(n838) );
  OA22X1TS U1272 ( .A0(n1339), .A1(exp_rslt_NRM2_EW1[2]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[25]), .Y(n840) );
  OAI21XLTS U1273 ( .A0(n1426), .A1(n1597), .B0(n953), .Y(n910) );
  NOR2XLTS U1274 ( .A(n1037), .B(DMP_SFG[0]), .Y(n1038) );
  INVX4TS U1275 ( .A(n1546), .Y(n1569) );
  OAI32X1TS U1276 ( .A0(n1546), .A1(n1039), .A2(n1038), .B0(n1569), .B1(n1657), 
        .Y(n600) );
  AOI2BB2XLTS U1277 ( .B0(beg_OP), .B1(n1640), .A0N(n1640), .A1N(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .Y(n1040) );
  NAND3XLTS U1278 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1640), .C(
        n1674), .Y(n1340) );
  NOR2X1TS U1279 ( .A(n1720), .B(intDX_EWSW[25]), .Y(n1099) );
  NOR2XLTS U1280 ( .A(n1099), .B(intDY_EWSW[24]), .Y(n1041) );
  AOI22X1TS U1281 ( .A0(intDX_EWSW[25]), .A1(n1720), .B0(intDX_EWSW[24]), .B1(
        n1041), .Y(n1045) );
  OAI21X1TS U1282 ( .A0(intDX_EWSW[26]), .A1(n1753), .B0(n1042), .Y(n1100) );
  NAND2BXLTS U1283 ( .AN(intDY_EWSW[27]), .B(intDX_EWSW[27]), .Y(n1043) );
  NOR2X1TS U1284 ( .A(n1639), .B(intDX_EWSW[30]), .Y(n1048) );
  NOR2X1TS U1285 ( .A(n1666), .B(intDX_EWSW[29]), .Y(n1046) );
  AOI211X1TS U1286 ( .A0(intDY_EWSW[28]), .A1(n1694), .B0(n1048), .C0(n1046), 
        .Y(n1098) );
  NOR3X1TS U1287 ( .A(n1694), .B(n1046), .C(intDY_EWSW[28]), .Y(n1047) );
  AOI221X1TS U1288 ( .A0(intDX_EWSW[30]), .A1(n1639), .B0(intDX_EWSW[29]), 
        .B1(n1666), .C0(n1047), .Y(n1049) );
  AOI2BB2X1TS U1289 ( .B0(n1050), .B1(n1098), .A0N(n1049), .A1N(n1048), .Y(
        n1104) );
  NOR2X1TS U1290 ( .A(n1679), .B(intDX_EWSW[17]), .Y(n1086) );
  OAI22X1TS U1291 ( .A0(n959), .A1(intDX_EWSW[10]), .B0(n1751), .B1(
        intDX_EWSW[11]), .Y(n1129) );
  INVX2TS U1292 ( .A(n1129), .Y(n1070) );
  OAI211XLTS U1293 ( .A0(intDX_EWSW[8]), .A1(n1684), .B0(n1067), .C0(n1070), 
        .Y(n1081) );
  OAI2BB1X1TS U1294 ( .A0N(n1658), .A1N(intDY_EWSW[5]), .B0(intDX_EWSW[4]), 
        .Y(n1051) );
  OAI22X1TS U1295 ( .A0(intDY_EWSW[4]), .A1(n1051), .B0(n1658), .B1(
        intDY_EWSW[5]), .Y(n1062) );
  OAI2BB1X1TS U1296 ( .A0N(n1637), .A1N(intDY_EWSW[7]), .B0(intDX_EWSW[6]), 
        .Y(n1052) );
  OAI22X1TS U1297 ( .A0(intDY_EWSW[6]), .A1(n1052), .B0(n1637), .B1(
        intDY_EWSW[7]), .Y(n1061) );
  OAI21XLTS U1298 ( .A0(intDX_EWSW[1]), .A1(n1683), .B0(intDX_EWSW[0]), .Y(
        n1053) );
  OAI2BB2XLTS U1299 ( .B0(intDY_EWSW[0]), .B1(n1053), .A0N(intDX_EWSW[1]), 
        .A1N(n1683), .Y(n1055) );
  OAI211XLTS U1300 ( .A0(n1678), .A1(intDX_EWSW[3]), .B0(n1055), .C0(n1054), 
        .Y(n1058) );
  OAI21XLTS U1301 ( .A0(intDX_EWSW[3]), .A1(n1678), .B0(intDX_EWSW[2]), .Y(
        n1056) );
  AOI2BB2XLTS U1302 ( .B0(intDX_EWSW[3]), .B1(n1678), .A0N(intDY_EWSW[2]), 
        .A1N(n1056), .Y(n1057) );
  AOI222X1TS U1303 ( .A0(intDY_EWSW[4]), .A1(n1636), .B0(n1058), .B1(n1057), 
        .C0(intDY_EWSW[5]), .C1(n1658), .Y(n1060) );
  AOI22X1TS U1304 ( .A0(intDY_EWSW[7]), .A1(n1637), .B0(intDY_EWSW[6]), .B1(
        n1663), .Y(n1059) );
  OAI32X1TS U1305 ( .A0(n1062), .A1(n1061), .A2(n1060), .B0(n1059), .B1(n1061), 
        .Y(n1080) );
  OA22X1TS U1306 ( .A0(n1688), .A1(intDX_EWSW[14]), .B0(n1752), .B1(
        intDX_EWSW[15]), .Y(n1077) );
  OAI21XLTS U1307 ( .A0(intDX_EWSW[13]), .A1(n1681), .B0(intDX_EWSW[12]), .Y(
        n1064) );
  OAI2BB2XLTS U1308 ( .B0(intDY_EWSW[12]), .B1(n1064), .A0N(intDX_EWSW[13]), 
        .A1N(n1681), .Y(n1076) );
  NOR2XLTS U1309 ( .A(n1065), .B(intDY_EWSW[10]), .Y(n1066) );
  AOI22X1TS U1310 ( .A0(intDX_EWSW[11]), .A1(n1751), .B0(intDX_EWSW[10]), .B1(
        n1066), .Y(n1072) );
  NAND2BXLTS U1311 ( .AN(intDY_EWSW[9]), .B(intDX_EWSW[9]), .Y(n1069) );
  NAND3XLTS U1312 ( .A(n1684), .B(n1067), .C(intDX_EWSW[8]), .Y(n1068) );
  AOI21X1TS U1313 ( .A0(n1069), .A1(n1068), .B0(n1079), .Y(n1071) );
  OAI2BB2XLTS U1314 ( .B0(n1072), .B1(n1079), .A0N(n1071), .A1N(n1070), .Y(
        n1075) );
  OAI2BB2XLTS U1315 ( .B0(intDY_EWSW[14]), .B1(n1073), .A0N(intDX_EWSW[15]), 
        .A1N(n1752), .Y(n1074) );
  AOI211X1TS U1316 ( .A0(n1077), .A1(n1076), .B0(n1075), .C0(n1074), .Y(n1078)
         );
  OAI31X1TS U1317 ( .A0(n1081), .A1(n1080), .A2(n1079), .B0(n1078), .Y(n1084)
         );
  OA22X1TS U1318 ( .A0(n1643), .A1(intDX_EWSW[22]), .B0(n1693), .B1(
        intDX_EWSW[23]), .Y(n1096) );
  OAI2BB2XLTS U1319 ( .B0(intDY_EWSW[20]), .B1(n1085), .A0N(intDX_EWSW[21]), 
        .A1N(n1682), .Y(n1095) );
  AOI22X1TS U1320 ( .A0(intDX_EWSW[17]), .A1(n1679), .B0(intDX_EWSW[16]), .B1(
        n1087), .Y(n1090) );
  OAI32X1TS U1321 ( .A0(n1121), .A1(n1091), .A2(n1090), .B0(n1089), .B1(n1091), 
        .Y(n1094) );
  OAI21XLTS U1322 ( .A0(intDX_EWSW[23]), .A1(n1693), .B0(intDX_EWSW[22]), .Y(
        n1092) );
  OAI2BB2XLTS U1323 ( .B0(intDY_EWSW[22]), .B1(n1092), .A0N(intDX_EWSW[23]), 
        .A1N(n1693), .Y(n1093) );
  AOI211X1TS U1324 ( .A0(n1096), .A1(n1095), .B0(n1094), .C0(n1093), .Y(n1102)
         );
  NAND2BXLTS U1325 ( .AN(intDX_EWSW[24]), .B(intDY_EWSW[24]), .Y(n1097) );
  NAND4BBX1TS U1326 ( .AN(n1100), .BN(n1099), .C(n1098), .D(n1097), .Y(n1101)
         );
  AOI32X1TS U1327 ( .A0(n1104), .A1(n1103), .A2(n1102), .B0(n1101), .B1(n1104), 
        .Y(n1105) );
  INVX2TS U1328 ( .A(Shift_reg_FLAGS_7_6), .Y(n1106) );
  INVX4TS U1329 ( .A(n1111), .Y(n1205) );
  BUFX4TS U1330 ( .A(n1106), .Y(n1200) );
  AOI22X1TS U1331 ( .A0(intDX_EWSW[6]), .A1(n1151), .B0(DMP_EXP_EWSW[6]), .B1(
        n1200), .Y(n1107) );
  OAI21XLTS U1332 ( .A0(n1672), .A1(n1205), .B0(n1107), .Y(n828) );
  AOI22X1TS U1333 ( .A0(intDX_EWSW[7]), .A1(n1151), .B0(DMP_EXP_EWSW[7]), .B1(
        n1408), .Y(n1108) );
  OAI21XLTS U1334 ( .A0(n1673), .A1(n1205), .B0(n1108), .Y(n827) );
  AOI22X1TS U1335 ( .A0(intDX_EWSW[4]), .A1(n1151), .B0(DMP_EXP_EWSW[4]), .B1(
        n1200), .Y(n1109) );
  OAI21XLTS U1336 ( .A0(n1686), .A1(n1205), .B0(n1109), .Y(n830) );
  AOI22X1TS U1337 ( .A0(intDX_EWSW[5]), .A1(n1151), .B0(DMP_EXP_EWSW[5]), .B1(
        n1200), .Y(n1110) );
  OAI21XLTS U1338 ( .A0(n1641), .A1(n1205), .B0(n1110), .Y(n829) );
  INVX3TS U1339 ( .A(n1151), .Y(n1186) );
  AOI22X1TS U1340 ( .A0(intDX_EWSW[16]), .A1(n1111), .B0(DmP_EXP_EWSW[16]), 
        .B1(n1344), .Y(n1112) );
  OAI21XLTS U1341 ( .A0(n1689), .A1(n1186), .B0(n1112), .Y(n659) );
  OAI22X1TS U1342 ( .A0(n1720), .A1(intDX_EWSW[25]), .B0(n1753), .B1(
        intDX_EWSW[26]), .Y(n1113) );
  AOI221X1TS U1343 ( .A0(n1720), .A1(intDX_EWSW[25]), .B0(intDX_EWSW[26]), 
        .B1(n1753), .C0(n1113), .Y(n1119) );
  OAI22X1TS U1344 ( .A0(n1691), .A1(intDX_EWSW[27]), .B0(n1694), .B1(
        intDY_EWSW[28]), .Y(n1114) );
  OAI22X1TS U1345 ( .A0(n1692), .A1(intDY_EWSW[29]), .B0(n1644), .B1(
        intDY_EWSW[30]), .Y(n1115) );
  AOI221X1TS U1346 ( .A0(n1692), .A1(intDY_EWSW[29]), .B0(intDY_EWSW[30]), 
        .B1(n1644), .C0(n1115), .Y(n1117) );
  AOI2BB2XLTS U1347 ( .B0(intDX_EWSW[7]), .B1(n1673), .A0N(n1673), .A1N(
        intDX_EWSW[7]), .Y(n1116) );
  NAND4XLTS U1348 ( .A(n1119), .B(n1118), .C(n1117), .D(n1116), .Y(n1147) );
  OAI22X1TS U1349 ( .A0(n1683), .A1(intDX_EWSW[1]), .B0(n1679), .B1(
        intDX_EWSW[17]), .Y(n1120) );
  OAI22X1TS U1350 ( .A0(n1690), .A1(intDX_EWSW[20]), .B0(n1682), .B1(
        intDX_EWSW[21]), .Y(n1122) );
  OAI22X1TS U1351 ( .A0(n1643), .A1(intDX_EWSW[22]), .B0(n1693), .B1(
        intDX_EWSW[23]), .Y(n1123) );
  NAND4XLTS U1352 ( .A(n1127), .B(n1126), .C(n1125), .D(n1124), .Y(n1146) );
  OAI22X1TS U1353 ( .A0(n1629), .A1(intDX_EWSW[24]), .B0(n1680), .B1(
        intDX_EWSW[9]), .Y(n1128) );
  AOI221X1TS U1354 ( .A0(n1629), .A1(intDX_EWSW[24]), .B0(intDX_EWSW[9]), .B1(
        n1680), .C0(n1128), .Y(n1135) );
  OAI22X1TS U1355 ( .A0(n1687), .A1(intDX_EWSW[12]), .B0(n1681), .B1(
        intDX_EWSW[13]), .Y(n1130) );
  OAI22X1TS U1356 ( .A0(n1688), .A1(intDX_EWSW[14]), .B0(n1752), .B1(
        intDX_EWSW[15]), .Y(n1131) );
  NAND4XLTS U1357 ( .A(n1135), .B(n1134), .C(n1133), .D(n1132), .Y(n1145) );
  OAI22X1TS U1358 ( .A0(n1689), .A1(intDX_EWSW[16]), .B0(n1642), .B1(
        intDX_EWSW[0]), .Y(n1136) );
  AOI221X1TS U1359 ( .A0(n1689), .A1(intDX_EWSW[16]), .B0(intDX_EWSW[0]), .B1(
        n1642), .C0(n1136), .Y(n1143) );
  OAI22X1TS U1360 ( .A0(n1685), .A1(intDX_EWSW[2]), .B0(n1678), .B1(
        intDX_EWSW[3]), .Y(n1137) );
  OAI22X1TS U1361 ( .A0(n1686), .A1(intDX_EWSW[4]), .B0(n1641), .B1(
        intDX_EWSW[5]), .Y(n1138) );
  AOI221X1TS U1362 ( .A0(n1686), .A1(intDX_EWSW[4]), .B0(intDX_EWSW[5]), .B1(
        n1641), .C0(n1138), .Y(n1141) );
  OAI22X1TS U1363 ( .A0(n1684), .A1(intDX_EWSW[8]), .B0(n1672), .B1(
        intDX_EWSW[6]), .Y(n1139) );
  NAND4XLTS U1364 ( .A(n1143), .B(n1142), .C(n1141), .D(n1140), .Y(n1144) );
  NOR4X1TS U1365 ( .A(n1147), .B(n1146), .C(n1145), .D(n1144), .Y(n1410) );
  CLKXOR2X2TS U1366 ( .A(intDY_EWSW[31]), .B(intAS), .Y(n1407) );
  INVX2TS U1367 ( .A(n1407), .Y(n1150) );
  INVX4TS U1368 ( .A(n1111), .Y(n1419) );
  OAI21XLTS U1369 ( .A0(n1150), .A1(n1200), .B0(n1186), .Y(n1148) );
  AOI22X1TS U1370 ( .A0(intDX_EWSW[31]), .A1(n1148), .B0(SIGN_FLAG_EXP), .B1(
        n956), .Y(n1149) );
  AOI22X1TS U1371 ( .A0(intDY_EWSW[28]), .A1(n1111), .B0(DMP_EXP_EWSW[28]), 
        .B1(n1200), .Y(n1152) );
  OAI21XLTS U1372 ( .A0(n1694), .A1(n1417), .B0(n1152), .Y(n806) );
  AOI22X1TS U1373 ( .A0(intDX_EWSW[19]), .A1(n1111), .B0(DmP_EXP_EWSW[19]), 
        .B1(n1344), .Y(n1153) );
  OAI21XLTS U1374 ( .A0(n1645), .A1(n1417), .B0(n1153), .Y(n653) );
  AOI22X1TS U1375 ( .A0(intDX_EWSW[22]), .A1(n1111), .B0(DmP_EXP_EWSW[22]), 
        .B1(n1344), .Y(n1154) );
  OAI21XLTS U1376 ( .A0(n1643), .A1(n1417), .B0(n1154), .Y(n647) );
  AOI22X1TS U1377 ( .A0(intDX_EWSW[20]), .A1(n1111), .B0(DmP_EXP_EWSW[20]), 
        .B1(n1344), .Y(n1155) );
  OAI21XLTS U1378 ( .A0(n1690), .A1(n1417), .B0(n1155), .Y(n651) );
  AOI22X1TS U1379 ( .A0(intDX_EWSW[17]), .A1(n1111), .B0(DmP_EXP_EWSW[17]), 
        .B1(n1344), .Y(n1156) );
  OAI21XLTS U1380 ( .A0(n1679), .A1(n1417), .B0(n1156), .Y(n657) );
  AOI22X1TS U1381 ( .A0(intDX_EWSW[14]), .A1(n1111), .B0(DmP_EXP_EWSW[14]), 
        .B1(n1106), .Y(n1157) );
  OAI21XLTS U1382 ( .A0(n1688), .A1(n1186), .B0(n1157), .Y(n663) );
  AOI22X1TS U1383 ( .A0(intDX_EWSW[21]), .A1(n1111), .B0(DmP_EXP_EWSW[21]), 
        .B1(n1344), .Y(n1158) );
  OAI21XLTS U1384 ( .A0(n1682), .A1(n1417), .B0(n1158), .Y(n649) );
  AOI22X1TS U1385 ( .A0(intDX_EWSW[13]), .A1(n1111), .B0(DmP_EXP_EWSW[13]), 
        .B1(n1344), .Y(n1159) );
  OAI21XLTS U1386 ( .A0(n1681), .A1(n1186), .B0(n1159), .Y(n665) );
  AOI22X1TS U1387 ( .A0(intDX_EWSW[15]), .A1(n1111), .B0(DmP_EXP_EWSW[15]), 
        .B1(n1344), .Y(n1161) );
  OAI21XLTS U1388 ( .A0(n1752), .A1(n1186), .B0(n1161), .Y(n661) );
  AOI22X1TS U1389 ( .A0(intDX_EWSW[0]), .A1(n1151), .B0(DMP_EXP_EWSW[0]), .B1(
        n1408), .Y(n1162) );
  OAI21XLTS U1390 ( .A0(n1642), .A1(n1419), .B0(n1162), .Y(n834) );
  AOI22X1TS U1391 ( .A0(intDX_EWSW[9]), .A1(n1151), .B0(DMP_EXP_EWSW[9]), .B1(
        n1200), .Y(n1163) );
  OAI21XLTS U1392 ( .A0(n1680), .A1(n1205), .B0(n1163), .Y(n825) );
  AOI22X1TS U1393 ( .A0(intDX_EWSW[1]), .A1(n1151), .B0(DMP_EXP_EWSW[1]), .B1(
        n1408), .Y(n1164) );
  AOI22X1TS U1394 ( .A0(intDX_EWSW[2]), .A1(n1151), .B0(DMP_EXP_EWSW[2]), .B1(
        n1200), .Y(n1165) );
  OAI21XLTS U1395 ( .A0(n1685), .A1(n1205), .B0(n1165), .Y(n832) );
  AOI22X1TS U1396 ( .A0(intDX_EWSW[8]), .A1(n1151), .B0(DMP_EXP_EWSW[8]), .B1(
        n1344), .Y(n1166) );
  OAI21XLTS U1397 ( .A0(n1684), .A1(n1205), .B0(n1166), .Y(n826) );
  AOI22X1TS U1398 ( .A0(intDX_EWSW[3]), .A1(n1151), .B0(DMP_EXP_EWSW[3]), .B1(
        n1408), .Y(n1167) );
  OAI21XLTS U1399 ( .A0(n1678), .A1(n1419), .B0(n1167), .Y(n831) );
  BUFX4TS U1400 ( .A(n1111), .Y(n1184) );
  AOI22X1TS U1401 ( .A0(intDY_EWSW[29]), .A1(n1184), .B0(DMP_EXP_EWSW[29]), 
        .B1(n1200), .Y(n1168) );
  OAI21XLTS U1402 ( .A0(n1692), .A1(n1417), .B0(n1168), .Y(n805) );
  AOI22X1TS U1403 ( .A0(intDY_EWSW[30]), .A1(n1184), .B0(DMP_EXP_EWSW[30]), 
        .B1(n1200), .Y(n1169) );
  OAI21XLTS U1404 ( .A0(n1644), .A1(n1417), .B0(n1169), .Y(n804) );
  AOI22X1TS U1405 ( .A0(intDX_EWSW[7]), .A1(n1184), .B0(DmP_EXP_EWSW[7]), .B1(
        n1408), .Y(n1170) );
  OAI21XLTS U1406 ( .A0(n1673), .A1(n1186), .B0(n1170), .Y(n677) );
  AOI22X1TS U1407 ( .A0(intDX_EWSW[5]), .A1(n1184), .B0(DmP_EXP_EWSW[5]), .B1(
        n1408), .Y(n1171) );
  OAI21XLTS U1408 ( .A0(n1641), .A1(n1186), .B0(n1171), .Y(n681) );
  AOI22X1TS U1409 ( .A0(intDX_EWSW[6]), .A1(n1184), .B0(DmP_EXP_EWSW[6]), .B1(
        n1408), .Y(n1172) );
  OAI21XLTS U1410 ( .A0(n1672), .A1(n1186), .B0(n1172), .Y(n679) );
  AOI22X1TS U1411 ( .A0(intDX_EWSW[4]), .A1(n1184), .B0(DmP_EXP_EWSW[4]), .B1(
        n1408), .Y(n1173) );
  OAI21XLTS U1412 ( .A0(n1686), .A1(n1417), .B0(n1173), .Y(n683) );
  AOI22X1TS U1413 ( .A0(intDX_EWSW[18]), .A1(n1184), .B0(DmP_EXP_EWSW[18]), 
        .B1(n1344), .Y(n1174) );
  OAI21XLTS U1414 ( .A0(n1695), .A1(n1417), .B0(n1174), .Y(n655) );
  AOI22X1TS U1415 ( .A0(intDX_EWSW[0]), .A1(n1184), .B0(DmP_EXP_EWSW[0]), .B1(
        n1200), .Y(n1175) );
  OAI21XLTS U1416 ( .A0(n1642), .A1(n1417), .B0(n1175), .Y(n691) );
  AOI22X1TS U1417 ( .A0(intDX_EWSW[10]), .A1(n1184), .B0(DmP_EXP_EWSW[10]), 
        .B1(n1200), .Y(n1176) );
  OAI21XLTS U1418 ( .A0(n959), .A1(n1186), .B0(n1176), .Y(n671) );
  AOI22X1TS U1419 ( .A0(intDX_EWSW[1]), .A1(n1184), .B0(DmP_EXP_EWSW[1]), .B1(
        n1344), .Y(n1177) );
  OAI21XLTS U1420 ( .A0(n1683), .A1(n1417), .B0(n1177), .Y(n689) );
  AOI22X1TS U1421 ( .A0(intDX_EWSW[9]), .A1(n1184), .B0(DmP_EXP_EWSW[9]), .B1(
        n1344), .Y(n1178) );
  OAI21XLTS U1422 ( .A0(n1680), .A1(n1186), .B0(n1178), .Y(n673) );
  AOI22X1TS U1423 ( .A0(intDX_EWSW[2]), .A1(n1184), .B0(DmP_EXP_EWSW[2]), .B1(
        n1200), .Y(n1179) );
  OAI21XLTS U1424 ( .A0(n1685), .A1(n1417), .B0(n1179), .Y(n687) );
  AOI22X1TS U1425 ( .A0(intDX_EWSW[12]), .A1(n1184), .B0(DmP_EXP_EWSW[12]), 
        .B1(n1106), .Y(n1180) );
  OAI21XLTS U1426 ( .A0(n1687), .A1(n1186), .B0(n1180), .Y(n667) );
  AOI22X1TS U1427 ( .A0(intDX_EWSW[8]), .A1(n1184), .B0(DmP_EXP_EWSW[8]), .B1(
        n1106), .Y(n1181) );
  OAI21XLTS U1428 ( .A0(n1684), .A1(n1186), .B0(n1181), .Y(n675) );
  AOI22X1TS U1429 ( .A0(intDX_EWSW[11]), .A1(n1184), .B0(DmP_EXP_EWSW[11]), 
        .B1(n1106), .Y(n1182) );
  OAI21XLTS U1430 ( .A0(n1751), .A1(n1186), .B0(n1182), .Y(n669) );
  AOI22X1TS U1431 ( .A0(intDX_EWSW[3]), .A1(n1184), .B0(DmP_EXP_EWSW[3]), .B1(
        n1106), .Y(n1183) );
  OAI21XLTS U1432 ( .A0(n1678), .A1(n1417), .B0(n1183), .Y(n685) );
  AOI22X1TS U1433 ( .A0(DmP_EXP_EWSW[27]), .A1(n1344), .B0(intDX_EWSW[27]), 
        .B1(n1184), .Y(n1185) );
  OAI21XLTS U1434 ( .A0(n1691), .A1(n1186), .B0(n1185), .Y(n641) );
  BUFX3TS U1435 ( .A(n1151), .Y(n1203) );
  AOI22X1TS U1436 ( .A0(intDX_EWSW[16]), .A1(n1203), .B0(DMP_EXP_EWSW[16]), 
        .B1(n1200), .Y(n1187) );
  OAI21XLTS U1437 ( .A0(n1689), .A1(n1205), .B0(n1187), .Y(n818) );
  AOI222X1TS U1438 ( .A0(n1111), .A1(intDX_EWSW[23]), .B0(DmP_EXP_EWSW[23]), 
        .B1(n1408), .C0(intDY_EWSW[23]), .C1(n1203), .Y(n1188) );
  INVX2TS U1439 ( .A(n1188), .Y(n645) );
  AOI22X1TS U1440 ( .A0(intDX_EWSW[22]), .A1(n1151), .B0(DMP_EXP_EWSW[22]), 
        .B1(n1408), .Y(n1189) );
  OAI21XLTS U1441 ( .A0(n1643), .A1(n1419), .B0(n1189), .Y(n812) );
  AOI22X1TS U1442 ( .A0(n985), .A1(n1344), .B0(intDX_EWSW[27]), .B1(n1151), 
        .Y(n1190) );
  OAI21XLTS U1443 ( .A0(n1691), .A1(n1419), .B0(n1190), .Y(n807) );
  AOI22X1TS U1444 ( .A0(intDX_EWSW[20]), .A1(n1151), .B0(DMP_EXP_EWSW[20]), 
        .B1(n1408), .Y(n1191) );
  OAI21XLTS U1445 ( .A0(n1690), .A1(n1419), .B0(n1191), .Y(n814) );
  AOI22X1TS U1446 ( .A0(DMP_EXP_EWSW[23]), .A1(n1344), .B0(intDX_EWSW[23]), 
        .B1(n1151), .Y(n1192) );
  OAI21XLTS U1447 ( .A0(n1693), .A1(n1205), .B0(n1192), .Y(n811) );
  AOI22X1TS U1448 ( .A0(intDX_EWSW[21]), .A1(n1151), .B0(DMP_EXP_EWSW[21]), 
        .B1(n1200), .Y(n1193) );
  OAI21XLTS U1449 ( .A0(n1682), .A1(n1419), .B0(n1193), .Y(n813) );
  AOI22X1TS U1450 ( .A0(intDX_EWSW[19]), .A1(n1203), .B0(DMP_EXP_EWSW[19]), 
        .B1(n1200), .Y(n1194) );
  OAI21XLTS U1451 ( .A0(n1645), .A1(n1419), .B0(n1194), .Y(n815) );
  AOI22X1TS U1452 ( .A0(intDX_EWSW[18]), .A1(n1203), .B0(DMP_EXP_EWSW[18]), 
        .B1(n1408), .Y(n1195) );
  OAI21XLTS U1453 ( .A0(n1695), .A1(n1205), .B0(n1195), .Y(n816) );
  AOI22X1TS U1454 ( .A0(intDX_EWSW[10]), .A1(n1203), .B0(DMP_EXP_EWSW[10]), 
        .B1(n1200), .Y(n1196) );
  OAI21XLTS U1455 ( .A0(n959), .A1(n1205), .B0(n1196), .Y(n824) );
  AOI22X1TS U1456 ( .A0(intDX_EWSW[14]), .A1(n1203), .B0(DMP_EXP_EWSW[14]), 
        .B1(n1344), .Y(n1197) );
  OAI21XLTS U1457 ( .A0(n1688), .A1(n1205), .B0(n1197), .Y(n820) );
  AOI22X1TS U1458 ( .A0(intDX_EWSW[17]), .A1(n1203), .B0(DMP_EXP_EWSW[17]), 
        .B1(n1408), .Y(n1198) );
  OAI21XLTS U1459 ( .A0(n1679), .A1(n1205), .B0(n1198), .Y(n817) );
  AOI22X1TS U1460 ( .A0(intDX_EWSW[12]), .A1(n1203), .B0(DMP_EXP_EWSW[12]), 
        .B1(n1344), .Y(n1199) );
  OAI21XLTS U1461 ( .A0(n1687), .A1(n1205), .B0(n1199), .Y(n822) );
  AOI22X1TS U1462 ( .A0(intDX_EWSW[11]), .A1(n1203), .B0(DMP_EXP_EWSW[11]), 
        .B1(n1408), .Y(n1201) );
  OAI21XLTS U1463 ( .A0(n1751), .A1(n1205), .B0(n1201), .Y(n823) );
  AOI22X1TS U1464 ( .A0(intDX_EWSW[13]), .A1(n1203), .B0(DMP_EXP_EWSW[13]), 
        .B1(n1408), .Y(n1202) );
  OAI21XLTS U1465 ( .A0(n1681), .A1(n1205), .B0(n1202), .Y(n821) );
  AOI22X1TS U1466 ( .A0(intDX_EWSW[15]), .A1(n1203), .B0(DMP_EXP_EWSW[15]), 
        .B1(n1408), .Y(n1204) );
  NAND4X1TS U1467 ( .A(n1627), .B(n1011), .C(n957), .D(n1625), .Y(n1329) );
  NOR2BX1TS U1468 ( .AN(n1219), .B(Raw_mant_NRM_SWR[18]), .Y(n1321) );
  NOR3X1TS U1469 ( .A(Raw_mant_NRM_SWR[17]), .B(Raw_mant_NRM_SWR[15]), .C(
        Raw_mant_NRM_SWR[16]), .Y(n1322) );
  NAND2X1TS U1470 ( .A(n1320), .B(n1633), .Y(n1206) );
  NAND2X1TS U1471 ( .A(n1229), .B(n1634), .Y(n1218) );
  NOR2X1TS U1472 ( .A(Raw_mant_NRM_SWR[10]), .B(n1218), .Y(n1224) );
  NAND2X1TS U1473 ( .A(n1224), .B(n1653), .Y(n1210) );
  NOR3X1TS U1474 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[8]), .C(n1210), 
        .Y(n1207) );
  NAND2X1TS U1475 ( .A(n1207), .B(n1654), .Y(n1227) );
  NOR3X2TS U1476 ( .A(Raw_mant_NRM_SWR[6]), .B(Raw_mant_NRM_SWR[5]), .C(n1227), 
        .Y(n1221) );
  NOR2XLTS U1477 ( .A(Raw_mant_NRM_SWR[3]), .B(Raw_mant_NRM_SWR[2]), .Y(n1209)
         );
  NAND2X1TS U1478 ( .A(n1221), .B(n1635), .Y(n1331) );
  OAI21X1TS U1479 ( .A0(n1209), .A1(n1331), .B0(n1208), .Y(n1235) );
  NOR2XLTS U1480 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[8]), .Y(n1211)
         );
  OAI21XLTS U1481 ( .A0(n1211), .A1(n1210), .B0(n1332), .Y(n1212) );
  AOI211X1TS U1482 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n1221), .B0(n1235), .C0(
        n1212), .Y(n1214) );
  NOR3X1TS U1483 ( .A(Raw_mant_NRM_SWR[3]), .B(Raw_mant_NRM_SWR[2]), .C(n1331), 
        .Y(n1213) );
  NAND2X1TS U1484 ( .A(n1213), .B(n990), .Y(n1223) );
  NAND2X1TS U1485 ( .A(Raw_mant_NRM_SWR[1]), .B(n1213), .Y(n1324) );
  AOI31X1TS U1486 ( .A0(n1214), .A1(n1223), .A2(n1324), .B0(n953), .Y(n1319)
         );
  NAND2X1TS U1487 ( .A(Raw_mant_NRM_SWR[14]), .B(n1320), .Y(n1237) );
  AOI32X1TS U1488 ( .A0(Raw_mant_NRM_SWR[20]), .A1(n957), .A2(n1626), .B0(
        Raw_mant_NRM_SWR[22]), .B1(n957), .Y(n1216) );
  AOI32X1TS U1489 ( .A0(n1011), .A1(n1237), .A2(n1216), .B0(
        Raw_mant_NRM_SWR[25]), .B1(n1237), .Y(n1217) );
  NOR3X1TS U1490 ( .A(Raw_mant_NRM_SWR[12]), .B(n1656), .C(n1218), .Y(n1327)
         );
  AOI21X1TS U1491 ( .A0(n1221), .A1(n1220), .B0(n1228), .Y(n1222) );
  NAND2X1TS U1492 ( .A(Raw_mant_NRM_SWR[12]), .B(n1229), .Y(n1325) );
  OAI211X1TS U1493 ( .A0(Raw_mant_NRM_SWR[1]), .A1(n1223), .B0(n1222), .C0(
        n1325), .Y(n1335) );
  OR2X2TS U1494 ( .A(n953), .B(n1243), .Y(n1362) );
  INVX2TS U1495 ( .A(n1362), .Y(n1358) );
  BUFX4TS U1496 ( .A(n1296), .Y(n1370) );
  NOR2XLTS U1497 ( .A(Raw_mant_NRM_SWR[23]), .B(Raw_mant_NRM_SWR[22]), .Y(
        n1233) );
  NOR2X1TS U1498 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[20]), .Y(
        n1231) );
  AOI211X1TS U1499 ( .A0(n1233), .A1(n1232), .B0(Raw_mant_NRM_SWR[24]), .C0(
        Raw_mant_NRM_SWR[25]), .Y(n1234) );
  AOI21X1TS U1500 ( .A0(Shift_amount_SHT1_EWR[1]), .A1(n953), .B0(n1337), .Y(
        n1239) );
  NOR2X2TS U1501 ( .A(n955), .B(n1239), .Y(n1379) );
  NAND2X2TS U1502 ( .A(n1243), .B(Shift_reg_FLAGS_7[1]), .Y(n1372) );
  INVX2TS U1503 ( .A(n1372), .Y(n1360) );
  AOI22X1TS U1504 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n1360), .B0(n1296), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n1242) );
  INVX4TS U1505 ( .A(n1362), .Y(n1380) );
  AOI22X1TS U1506 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n1358), .B0(n988), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n1241) );
  NAND2X1TS U1507 ( .A(n1242), .B(n1241), .Y(n1269) );
  AOI22X1TS U1508 ( .A0(n1385), .A1(Data_array_SWR[3]), .B0(n1240), .B1(n1269), 
        .Y(n1245) );
  NAND2X1TS U1509 ( .A(n1337), .B(n1243), .Y(n1303) );
  NAND2X1TS U1510 ( .A(Raw_mant_NRM_SWR[19]), .B(n1280), .Y(n1244) );
  AOI22X1TS U1511 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n1360), .B0(n1296), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n1247) );
  AOI22X1TS U1512 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n1358), .B0(n988), .B1(n983), .Y(n1246) );
  NAND2X1TS U1513 ( .A(n1247), .B(n1246), .Y(n1285) );
  AOI22X1TS U1514 ( .A0(n1385), .A1(Data_array_SWR[7]), .B0(n1240), .B1(n1285), 
        .Y(n1249) );
  NAND2X1TS U1515 ( .A(Raw_mant_NRM_SWR[15]), .B(n1280), .Y(n1248) );
  AOI22X1TS U1516 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n1360), .B0(n1370), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n1251) );
  AOI22X1TS U1517 ( .A0(Raw_mant_NRM_SWR[23]), .A1(n1358), .B0(n988), .B1(n984), .Y(n1250) );
  NAND2X1TS U1518 ( .A(n1251), .B(n1250), .Y(n1378) );
  AOI22X1TS U1519 ( .A0(n1385), .A1(Data_array_SWR[2]), .B0(n1240), .B1(n1378), 
        .Y(n1253) );
  NAND2X1TS U1520 ( .A(Raw_mant_NRM_SWR[20]), .B(n1280), .Y(n1252) );
  AOI22X1TS U1521 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n1360), .B0(n1296), .B1(
        n983), .Y(n1255) );
  AOI22X1TS U1522 ( .A0(Raw_mant_NRM_SWR[19]), .A1(n1380), .B0(n988), .B1(n977), .Y(n1254) );
  NAND2X1TS U1523 ( .A(n1255), .B(n1254), .Y(n1289) );
  AOI22X1TS U1524 ( .A0(n955), .A1(Data_array_SWR[6]), .B0(n1240), .B1(n1289), 
        .Y(n1257) );
  NAND2X1TS U1525 ( .A(Raw_mant_NRM_SWR[16]), .B(n1280), .Y(n1256) );
  AOI22X1TS U1526 ( .A0(n955), .A1(Data_array_SWR[13]), .B0(
        Raw_mant_NRM_SWR[9]), .B1(n1280), .Y(n1260) );
  NAND2X1TS U1527 ( .A(n1258), .B(n1360), .Y(n1309) );
  AOI22X1TS U1528 ( .A0(n955), .A1(Data_array_SWR[21]), .B0(
        Raw_mant_NRM_SWR[1]), .B1(n1280), .Y(n1262) );
  AOI22X1TS U1529 ( .A0(n955), .A1(Data_array_SWR[17]), .B0(
        Raw_mant_NRM_SWR[5]), .B1(n1280), .Y(n1264) );
  AOI22X1TS U1530 ( .A0(n1385), .A1(Data_array_SWR[15]), .B0(
        Raw_mant_NRM_SWR[7]), .B1(n1280), .Y(n1267) );
  AOI22X1TS U1531 ( .A0(Raw_mant_NRM_SWR[24]), .A1(n1380), .B0(n1370), .B1(
        n984), .Y(n1272) );
  AOI22X1TS U1532 ( .A0(n1385), .A1(Data_array_SWR[1]), .B0(
        Raw_mant_NRM_SWR[23]), .B1(n1377), .Y(n1271) );
  NAND2X1TS U1533 ( .A(n1379), .B(n1269), .Y(n1270) );
  AOI22X1TS U1534 ( .A0(n1385), .A1(Data_array_SWR[9]), .B0(
        Raw_mant_NRM_SWR[13]), .B1(n1280), .Y(n1274) );
  AOI22X1TS U1535 ( .A0(n1385), .A1(Data_array_SWR[19]), .B0(
        Raw_mant_NRM_SWR[3]), .B1(n1280), .Y(n1278) );
  AOI22X1TS U1536 ( .A0(n1385), .A1(Data_array_SWR[11]), .B0(
        Raw_mant_NRM_SWR[11]), .B1(n1280), .Y(n1283) );
  AOI22X1TS U1537 ( .A0(n1385), .A1(Data_array_SWR[5]), .B0(n1379), .B1(n1285), 
        .Y(n1287) );
  NAND2X1TS U1538 ( .A(Raw_mant_NRM_SWR[19]), .B(n1377), .Y(n1286) );
  AOI22X1TS U1539 ( .A0(n1385), .A1(Data_array_SWR[4]), .B0(n1379), .B1(n1289), 
        .Y(n1291) );
  NAND2X1TS U1540 ( .A(Raw_mant_NRM_SWR[20]), .B(n1377), .Y(n1290) );
  AOI21X1TS U1541 ( .A0(n1380), .A1(n990), .B0(n989), .Y(n1357) );
  OAI22X1TS U1542 ( .A0(n1293), .A1(n986), .B0(n1387), .B1(n1646), .Y(n1294)
         );
  AOI21X1TS U1543 ( .A0(Raw_mant_NRM_SWR[1]), .A1(n1377), .B0(n1294), .Y(n1295) );
  AOI22X1TS U1544 ( .A0(n988), .A1(DmP_mant_SHT1_SW[18]), .B0(n1296), .B1(n978), .Y(n1297) );
  AOI21X1TS U1545 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n1380), .B0(n1298), .Y(n1365) );
  OAI22X1TS U1546 ( .A0(n1304), .A1(n986), .B0(n1660), .B1(n1309), .Y(n1299)
         );
  AOI21X1TS U1547 ( .A0(n955), .A1(Data_array_SWR[18]), .B0(n1299), .Y(n1300)
         );
  AOI22X1TS U1548 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n1360), .B0(n1296), .B1(n979), .Y(n1301) );
  AOI21X1TS U1549 ( .A0(n989), .A1(DmP_mant_SHT1_SW[14]), .B0(n1302), .Y(n1369) );
  OAI22X1TS U1550 ( .A0(n1304), .A1(n1238), .B0(n1660), .B1(n1303), .Y(n1305)
         );
  AOI21X1TS U1551 ( .A0(n955), .A1(Data_array_SWR[16]), .B0(n1305), .Y(n1306)
         );
  AOI22X1TS U1552 ( .A0(n988), .A1(DmP_mant_SHT1_SW[8]), .B0(n1296), .B1(n982), 
        .Y(n1307) );
  AOI21X1TS U1553 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n1380), .B0(n1308), .Y(
        n1375) );
  OAI22X1TS U1554 ( .A0(n1310), .A1(n986), .B0(n1631), .B1(n1309), .Y(n1311)
         );
  AOI21X1TS U1555 ( .A0(n1385), .A1(Data_array_SWR[8]), .B0(n1311), .Y(n1312)
         );
  INVX2TS U1556 ( .A(n1313), .Y(n1523) );
  NOR2XLTS U1557 ( .A(n1523), .B(SIGN_FLAG_SHT1SHT2), .Y(n1314) );
  OAI2BB2XLTS U1558 ( .B0(n1314), .B1(n1522), .A0N(n1602), .A1N(
        final_result_ieee[31]), .Y(n624) );
  AOI2BB2X1TS U1559 ( .B0(DmP_mant_SFG_SWR[13]), .B1(n1012), .A0N(n1012), 
        .A1N(DmP_mant_SFG_SWR[13]), .Y(n1315) );
  AOI2BB2X1TS U1560 ( .B0(DmP_mant_SFG_SWR[12]), .B1(n1459), .A0N(n1638), 
        .A1N(DmP_mant_SFG_SWR[12]), .Y(n1433) );
  NAND2BX1TS U1561 ( .AN(n1433), .B(DMP_SFG[10]), .Y(n1543) );
  NAND2X1TS U1562 ( .A(n1315), .B(DMP_SFG[11]), .Y(n1531) );
  OAI21X1TS U1563 ( .A0(n1532), .A1(n1543), .B0(n1531), .Y(n1316) );
  INVX2TS U1564 ( .A(n1317), .Y(n1318) );
  NAND2X1TS U1565 ( .A(n1659), .B(n1318), .Y(DP_OP_15J10_123_2691_n8) );
  MX2X1TS U1566 ( .A(DMP_exp_NRM2_EW[7]), .B(DMP_exp_NRM_EW[7]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n692) );
  MX2X1TS U1567 ( .A(DMP_exp_NRM2_EW[6]), .B(DMP_exp_NRM_EW[6]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n697) );
  MX2X1TS U1568 ( .A(DMP_exp_NRM2_EW[5]), .B(DMP_exp_NRM_EW[5]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n702) );
  MX2X1TS U1569 ( .A(DMP_exp_NRM2_EW[4]), .B(DMP_exp_NRM_EW[4]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n707) );
  MX2X1TS U1570 ( .A(DMP_exp_NRM2_EW[3]), .B(DMP_exp_NRM_EW[3]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n712) );
  MX2X1TS U1571 ( .A(DMP_exp_NRM2_EW[2]), .B(DMP_exp_NRM_EW[2]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n717) );
  MX2X1TS U1572 ( .A(DMP_exp_NRM2_EW[1]), .B(DMP_exp_NRM_EW[1]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n722) );
  MX2X1TS U1573 ( .A(DMP_exp_NRM2_EW[0]), .B(DMP_exp_NRM_EW[0]), .S0(
        Shift_reg_FLAGS_7[1]), .Y(n727) );
  AO21XLTS U1574 ( .A0(LZD_output_NRM2_EW[4]), .A1(n953), .B0(n1319), .Y(n610)
         );
  OAI211X1TS U1575 ( .A0(Raw_mant_NRM_SWR[11]), .A1(Raw_mant_NRM_SWR[13]), 
        .B0(n1320), .C0(n1633), .Y(n1328) );
  OAI2BB1X1TS U1576 ( .A0N(n1322), .A1N(n1633), .B0(n1321), .Y(n1323) );
  NAND4XLTS U1577 ( .A(n1325), .B(n1328), .C(n1324), .D(n1323), .Y(n1326) );
  OAI21X1TS U1578 ( .A0(n1327), .A1(n1326), .B0(Shift_reg_FLAGS_7[1]), .Y(
        n1388) );
  OAI2BB1X1TS U1579 ( .A0N(LZD_output_NRM2_EW[3]), .A1N(n953), .B0(n1388), .Y(
        n598) );
  OAI22X1TS U1580 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n1332), .B0(n1331), .B1(
        n1702), .Y(n1334) );
  OAI31X1TS U1581 ( .A0(n1336), .A1(n1335), .A2(n1334), .B0(
        Shift_reg_FLAGS_7[1]), .Y(n1383) );
  OAI2BB1X1TS U1582 ( .A0N(LZD_output_NRM2_EW[2]), .A1N(n953), .B0(n1383), .Y(
        n607) );
  AO21XLTS U1583 ( .A0(LZD_output_NRM2_EW[1]), .A1(n953), .B0(n1337), .Y(n604)
         );
  OAI2BB1X1TS U1584 ( .A0N(LZD_output_NRM2_EW[0]), .A1N(n953), .B0(n1372), .Y(
        n593) );
  OA22X1TS U1585 ( .A0(n1339), .A1(n1338), .B0(Shift_reg_FLAGS_7[0]), .B1(
        final_result_ieee[29]), .Y(n836) );
  OA21XLTS U1586 ( .A0(Shift_reg_FLAGS_7[0]), .A1(overflow_flag), .B0(n1522), 
        .Y(n639) );
  INVX2TS U1587 ( .A(n1343), .Y(n1341) );
  AOI22X1TS U1588 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n1341), .B1(n1640), .Y(
        inst_FSM_INPUT_ENABLE_state_next_1_) );
  NAND2X1TS U1589 ( .A(n1341), .B(n1340), .Y(n952) );
  NOR2XLTS U1590 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .Y(n1342) );
  AOI32X4TS U1591 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B0(n1342), .B1(n1674), .Y(n1346)
         );
  INVX2TS U1592 ( .A(n1346), .Y(n1345) );
  AOI22X1TS U1593 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n1343), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B1(n1640), .Y(n1347) );
  AO22XLTS U1594 ( .A0(n1345), .A1(Shift_reg_FLAGS_7_6), .B0(n1346), .B1(n1347), .Y(n950) );
  AOI22X1TS U1595 ( .A0(n1346), .A1(n1344), .B0(n1415), .B1(n1345), .Y(n949)
         );
  AOI22X1TS U1596 ( .A0(n1346), .A1(n1415), .B0(n1413), .B1(n1345), .Y(n948)
         );
  AOI22X1TS U1597 ( .A0(n1346), .A1(n1546), .B0(n953), .B1(n1345), .Y(n945) );
  AOI22X1TS U1598 ( .A0(n1346), .A1(n953), .B0(n1602), .B1(n1345), .Y(n944) );
  BUFX4TS U1599 ( .A(n1351), .Y(n1356) );
  BUFX3TS U1600 ( .A(n1351), .Y(n1352) );
  AO22XLTS U1601 ( .A0(n1356), .A1(Data_X[1]), .B0(n954), .B1(intDX_EWSW[1]), 
        .Y(n942) );
  BUFX3TS U1602 ( .A(n1351), .Y(n1348) );
  AO22XLTS U1603 ( .A0(n1348), .A1(Data_X[2]), .B0(n954), .B1(intDX_EWSW[2]), 
        .Y(n941) );
  BUFX3TS U1604 ( .A(n1351), .Y(n1354) );
  AO22XLTS U1605 ( .A0(n1354), .A1(Data_X[3]), .B0(n1355), .B1(intDX_EWSW[3]), 
        .Y(n940) );
  AO22XLTS U1606 ( .A0(n1352), .A1(Data_X[4]), .B0(n954), .B1(intDX_EWSW[4]), 
        .Y(n939) );
  AO22XLTS U1607 ( .A0(n1356), .A1(Data_X[5]), .B0(n954), .B1(intDX_EWSW[5]), 
        .Y(n938) );
  AO22XLTS U1608 ( .A0(n1356), .A1(Data_X[6]), .B0(n1355), .B1(intDX_EWSW[6]), 
        .Y(n937) );
  AO22XLTS U1609 ( .A0(n1351), .A1(Data_X[7]), .B0(n954), .B1(intDX_EWSW[7]), 
        .Y(n936) );
  AO22XLTS U1610 ( .A0(n1354), .A1(Data_X[8]), .B0(n954), .B1(intDX_EWSW[8]), 
        .Y(n935) );
  AO22XLTS U1611 ( .A0(n1354), .A1(Data_X[9]), .B0(n1355), .B1(intDX_EWSW[9]), 
        .Y(n934) );
  AO22XLTS U1612 ( .A0(n1354), .A1(Data_X[11]), .B0(n954), .B1(intDX_EWSW[11]), 
        .Y(n932) );
  INVX2TS U1613 ( .A(n1352), .Y(n1355) );
  AO22XLTS U1614 ( .A0(n1356), .A1(Data_X[12]), .B0(n1355), .B1(intDX_EWSW[12]), .Y(n931) );
  AO22XLTS U1615 ( .A0(n1352), .A1(Data_X[13]), .B0(n954), .B1(intDX_EWSW[13]), 
        .Y(n930) );
  AO22XLTS U1616 ( .A0(n1351), .A1(Data_X[14]), .B0(n954), .B1(intDX_EWSW[14]), 
        .Y(n929) );
  AO22XLTS U1617 ( .A0(n1356), .A1(Data_X[15]), .B0(n1355), .B1(intDX_EWSW[15]), .Y(n928) );
  AO22XLTS U1618 ( .A0(n1348), .A1(Data_X[16]), .B0(n954), .B1(intDX_EWSW[16]), 
        .Y(n927) );
  AO22XLTS U1619 ( .A0(n1356), .A1(Data_X[17]), .B0(n954), .B1(intDX_EWSW[17]), 
        .Y(n926) );
  AO22XLTS U1620 ( .A0(n1351), .A1(Data_X[20]), .B0(n1355), .B1(intDX_EWSW[20]), .Y(n923) );
  AO22XLTS U1621 ( .A0(n1352), .A1(Data_X[21]), .B0(n954), .B1(intDX_EWSW[21]), 
        .Y(n922) );
  AO22XLTS U1622 ( .A0(n1352), .A1(Data_X[22]), .B0(n954), .B1(intDX_EWSW[22]), 
        .Y(n921) );
  AO22XLTS U1623 ( .A0(n1348), .A1(Data_X[23]), .B0(n1355), .B1(intDX_EWSW[23]), .Y(n920) );
  INVX2TS U1624 ( .A(n1351), .Y(n1349) );
  AO22XLTS U1625 ( .A0(n1349), .A1(intDX_EWSW[24]), .B0(n1351), .B1(Data_X[24]), .Y(n919) );
  AO22XLTS U1626 ( .A0(n1349), .A1(intDX_EWSW[25]), .B0(n1354), .B1(Data_X[25]), .Y(n918) );
  AO22XLTS U1627 ( .A0(n1349), .A1(intDX_EWSW[26]), .B0(n1348), .B1(Data_X[26]), .Y(n917) );
  AO22XLTS U1628 ( .A0(n1354), .A1(Data_X[27]), .B0(n1349), .B1(intDX_EWSW[27]), .Y(n916) );
  AO22XLTS U1629 ( .A0(n1349), .A1(intDX_EWSW[28]), .B0(n1354), .B1(Data_X[28]), .Y(n915) );
  AO22XLTS U1630 ( .A0(n1349), .A1(intDX_EWSW[29]), .B0(n1348), .B1(Data_X[29]), .Y(n914) );
  AO22XLTS U1631 ( .A0(n1349), .A1(intDX_EWSW[30]), .B0(n1348), .B1(Data_X[30]), .Y(n913) );
  AO22XLTS U1632 ( .A0(n1354), .A1(add_subt), .B0(n1349), .B1(intAS), .Y(n911)
         );
  AO22XLTS U1633 ( .A0(n1350), .A1(intDY_EWSW[0]), .B0(n1348), .B1(Data_Y[0]), 
        .Y(n909) );
  AO22XLTS U1634 ( .A0(n1349), .A1(intDY_EWSW[1]), .B0(n1348), .B1(Data_Y[1]), 
        .Y(n908) );
  AO22XLTS U1635 ( .A0(n1353), .A1(intDY_EWSW[2]), .B0(n1348), .B1(Data_Y[2]), 
        .Y(n907) );
  INVX2TS U1636 ( .A(n1351), .Y(n1350) );
  AO22XLTS U1637 ( .A0(n1353), .A1(intDY_EWSW[3]), .B0(n1348), .B1(Data_Y[3]), 
        .Y(n906) );
  AO22XLTS U1638 ( .A0(n1350), .A1(intDY_EWSW[4]), .B0(n1348), .B1(Data_Y[4]), 
        .Y(n905) );
  AO22XLTS U1639 ( .A0(n1353), .A1(intDY_EWSW[5]), .B0(n1348), .B1(Data_Y[5]), 
        .Y(n904) );
  AO22XLTS U1640 ( .A0(n1350), .A1(intDY_EWSW[6]), .B0(n1351), .B1(Data_Y[6]), 
        .Y(n903) );
  AO22XLTS U1641 ( .A0(n1350), .A1(intDY_EWSW[7]), .B0(n1356), .B1(Data_Y[7]), 
        .Y(n902) );
  AO22XLTS U1642 ( .A0(n1350), .A1(intDY_EWSW[8]), .B0(n1356), .B1(Data_Y[8]), 
        .Y(n901) );
  AO22XLTS U1643 ( .A0(n1353), .A1(intDY_EWSW[9]), .B0(n1351), .B1(Data_Y[9]), 
        .Y(n900) );
  AO22XLTS U1644 ( .A0(n1353), .A1(intDY_EWSW[10]), .B0(n1356), .B1(Data_Y[10]), .Y(n899) );
  AO22XLTS U1645 ( .A0(n1353), .A1(intDY_EWSW[11]), .B0(n1356), .B1(Data_Y[11]), .Y(n898) );
  AO22XLTS U1646 ( .A0(n1353), .A1(intDY_EWSW[12]), .B0(n1356), .B1(Data_Y[12]), .Y(n897) );
  AO22XLTS U1647 ( .A0(n1350), .A1(intDY_EWSW[13]), .B0(n1356), .B1(Data_Y[13]), .Y(n896) );
  AO22XLTS U1648 ( .A0(n1353), .A1(intDY_EWSW[14]), .B0(n1356), .B1(Data_Y[14]), .Y(n895) );
  AO22XLTS U1649 ( .A0(n1353), .A1(intDY_EWSW[15]), .B0(n1356), .B1(Data_Y[15]), .Y(n894) );
  AO22XLTS U1650 ( .A0(n1353), .A1(intDY_EWSW[16]), .B0(n1356), .B1(Data_Y[16]), .Y(n893) );
  AO22XLTS U1651 ( .A0(n1350), .A1(intDY_EWSW[17]), .B0(n1356), .B1(Data_Y[17]), .Y(n892) );
  AO22XLTS U1652 ( .A0(n1353), .A1(intDY_EWSW[18]), .B0(n1356), .B1(Data_Y[18]), .Y(n891) );
  AO22XLTS U1653 ( .A0(n1350), .A1(intDY_EWSW[19]), .B0(n1356), .B1(Data_Y[19]), .Y(n890) );
  AO22XLTS U1654 ( .A0(n1353), .A1(intDY_EWSW[20]), .B0(n1354), .B1(Data_Y[20]), .Y(n889) );
  AO22XLTS U1655 ( .A0(n1350), .A1(intDY_EWSW[21]), .B0(n1354), .B1(Data_Y[21]), .Y(n888) );
  AO22XLTS U1656 ( .A0(n1353), .A1(intDY_EWSW[22]), .B0(n1354), .B1(Data_Y[22]), .Y(n887) );
  AO22XLTS U1657 ( .A0(n1353), .A1(intDY_EWSW[23]), .B0(n1352), .B1(Data_Y[23]), .Y(n886) );
  AO22XLTS U1658 ( .A0(n1353), .A1(intDY_EWSW[24]), .B0(n1351), .B1(Data_Y[24]), .Y(n885) );
  AO22XLTS U1659 ( .A0(n1350), .A1(intDY_EWSW[25]), .B0(n1351), .B1(Data_Y[25]), .Y(n884) );
  AO22XLTS U1660 ( .A0(n1353), .A1(intDY_EWSW[26]), .B0(n1351), .B1(Data_Y[26]), .Y(n883) );
  AO22XLTS U1661 ( .A0(n1353), .A1(intDY_EWSW[27]), .B0(n1352), .B1(Data_Y[27]), .Y(n882) );
  AO22XLTS U1662 ( .A0(n1354), .A1(Data_Y[29]), .B0(n954), .B1(intDY_EWSW[29]), 
        .Y(n880) );
  AO22XLTS U1663 ( .A0(n1354), .A1(Data_Y[30]), .B0(n954), .B1(intDY_EWSW[30]), 
        .Y(n879) );
  OAI2BB2XLTS U1664 ( .B0(n1357), .B1(n986), .A0N(n955), .A1N(
        Data_array_SWR[25]), .Y(n877) );
  OAI2BB2XLTS U1665 ( .B0(n1364), .B1(n987), .A0N(n955), .A1N(
        Data_array_SWR[24]), .Y(n876) );
  AOI22X1TS U1666 ( .A0(Raw_mant_NRM_SWR[2]), .A1(n1360), .B0(
        DmP_mant_SHT1_SW[21]), .B1(n1370), .Y(n1361) );
  AOI21X1TS U1667 ( .A0(DmP_mant_SHT1_SW[20]), .A1(n989), .B0(n1363), .Y(n1366) );
  OAI222X1TS U1668 ( .A0(n1387), .A1(n1630), .B0(n1238), .B1(n1364), .C0(n987), 
        .C1(n1366), .Y(n874) );
  OAI222X1TS U1669 ( .A0(n1715), .A1(n1387), .B0(n1238), .B1(n1366), .C0(n987), 
        .C1(n1365), .Y(n872) );
  AOI22X1TS U1670 ( .A0(n988), .A1(DmP_mant_SHT1_SW[12]), .B0(n1370), .B1(n980), .Y(n1367) );
  AOI21X1TS U1671 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n1380), .B0(n1368), .Y(
        n1374) );
  OAI222X1TS U1672 ( .A0(n1650), .A1(n1387), .B0(n1238), .B1(n1369), .C0(n987), 
        .C1(n1374), .Y(n866) );
  AOI22X1TS U1673 ( .A0(n988), .A1(DmP_mant_SHT1_SW[10]), .B0(n1370), .B1(n981), .Y(n1371) );
  AOI21X1TS U1674 ( .A0(Raw_mant_NRM_SWR[13]), .A1(n1380), .B0(n1373), .Y(
        n1376) );
  OAI222X1TS U1675 ( .A0(n1709), .A1(n1387), .B0(n1238), .B1(n1374), .C0(n987), 
        .C1(n1376), .Y(n864) );
  OAI222X1TS U1676 ( .A0(n1706), .A1(n1387), .B0(n1238), .B1(n1376), .C0(n987), 
        .C1(n1375), .Y(n862) );
  AOI22X1TS U1677 ( .A0(n955), .A1(Data_array_SWR[0]), .B0(
        Raw_mant_NRM_SWR[24]), .B1(n1377), .Y(n1382) );
  AOI22X1TS U1678 ( .A0(Raw_mant_NRM_SWR[25]), .A1(n1380), .B0(n1379), .B1(
        n1378), .Y(n1381) );
  NAND2X1TS U1679 ( .A(n1382), .B(n1381), .Y(n852) );
  AOI32X1TS U1680 ( .A0(Shift_amount_SHT1_EWR[2]), .A1(n1387), .A2(n953), .B0(
        shift_value_SHT2_EWR[2]), .B1(n955), .Y(n1384) );
  NAND2X1TS U1681 ( .A(n1384), .B(n1383), .Y(n851) );
  AOI32X1TS U1682 ( .A0(Shift_amount_SHT1_EWR[3]), .A1(n1387), .A2(n953), .B0(
        shift_value_SHT2_EWR[3]), .B1(n955), .Y(n1389) );
  NAND2X1TS U1683 ( .A(n1389), .B(n1388), .Y(n850) );
  INVX4TS U1684 ( .A(n1415), .Y(n1423) );
  AOI21X1TS U1685 ( .A0(DMP_EXP_EWSW[23]), .A1(n999), .B0(n1394), .Y(n1390) );
  INVX4TS U1686 ( .A(n1415), .Y(n1425) );
  AOI2BB2XLTS U1687 ( .B0(n1423), .B1(n1390), .A0N(Shift_amount_SHT1_EWR[0]), 
        .A1N(n1425), .Y(n847) );
  NOR2X1TS U1688 ( .A(n1648), .B(DMP_EXP_EWSW[24]), .Y(n1393) );
  AOI21X1TS U1689 ( .A0(DMP_EXP_EWSW[24]), .A1(n1648), .B0(n1393), .Y(n1391)
         );
  XNOR2X1TS U1690 ( .A(n1394), .B(n1391), .Y(n1392) );
  AO22XLTS U1691 ( .A0(n1425), .A1(n1392), .B0(n1415), .B1(
        Shift_amount_SHT1_EWR[1]), .Y(n846) );
  INVX4TS U1692 ( .A(n1415), .Y(n1412) );
  OAI22X1TS U1693 ( .A0(n1394), .A1(n1393), .B0(DmP_EXP_EWSW[24]), .B1(n1649), 
        .Y(n1397) );
  NAND2X1TS U1694 ( .A(DmP_EXP_EWSW[25]), .B(n1701), .Y(n1398) );
  XNOR2X1TS U1695 ( .A(n1397), .B(n1395), .Y(n1396) );
  AO22XLTS U1696 ( .A0(n1412), .A1(n1396), .B0(n1716), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n845) );
  AOI22X1TS U1697 ( .A0(DMP_EXP_EWSW[25]), .A1(n1712), .B0(n1398), .B1(n1397), 
        .Y(n1401) );
  NOR2X1TS U1698 ( .A(n1708), .B(DMP_EXP_EWSW[26]), .Y(n1402) );
  AOI21X1TS U1699 ( .A0(DMP_EXP_EWSW[26]), .A1(n1708), .B0(n1402), .Y(n1399)
         );
  XNOR2X1TS U1700 ( .A(n1401), .B(n1399), .Y(n1400) );
  AO22XLTS U1701 ( .A0(n1425), .A1(n1400), .B0(n1716), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n844) );
  OAI22X1TS U1702 ( .A0(n1402), .A1(n1401), .B0(DmP_EXP_EWSW[26]), .B1(n1711), 
        .Y(n1404) );
  XNOR2X1TS U1703 ( .A(DmP_EXP_EWSW[27]), .B(n985), .Y(n1403) );
  XOR2XLTS U1704 ( .A(n1404), .B(n1403), .Y(n1405) );
  BUFX3TS U1705 ( .A(n1716), .Y(n1414) );
  AO22XLTS U1706 ( .A0(n1412), .A1(n1405), .B0(n1414), .B1(
        Shift_amount_SHT1_EWR[4]), .Y(n843) );
  OAI222X1TS U1707 ( .A0(n1417), .A1(n1710), .B0(n1649), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1629), .C1(n1419), .Y(n810) );
  OAI222X1TS U1708 ( .A0(n1417), .A1(n1651), .B0(n1701), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1720), .C1(n1419), .Y(n809) );
  OAI222X1TS U1709 ( .A0(n1417), .A1(n1652), .B0(n1711), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1753), .C1(n1419), .Y(n808) );
  OAI21XLTS U1710 ( .A0(n1407), .A1(intDX_EWSW[31]), .B0(Shift_reg_FLAGS_7_6), 
        .Y(n1406) );
  AOI21X1TS U1711 ( .A0(n1407), .A1(intDX_EWSW[31]), .B0(n1406), .Y(n1409) );
  AO21XLTS U1712 ( .A0(OP_FLAG_EXP), .A1(n1408), .B0(n1409), .Y(n803) );
  AO22XLTS U1713 ( .A0(n1410), .A1(n1409), .B0(ZERO_FLAG_EXP), .B1(n1408), .Y(
        n802) );
  AO22XLTS U1714 ( .A0(n1412), .A1(DMP_EXP_EWSW[0]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[0]), .Y(n800) );
  AO22XLTS U1715 ( .A0(busy), .A1(DMP_SHT1_EWSW[0]), .B0(n1718), .B1(
        DMP_SHT2_EWSW[0]), .Y(n799) );
  AO22XLTS U1716 ( .A0(n1425), .A1(DMP_EXP_EWSW[1]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[1]), .Y(n797) );
  AO22XLTS U1717 ( .A0(busy), .A1(DMP_SHT1_EWSW[1]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[1]), .Y(n796) );
  AO22XLTS U1718 ( .A0(n1412), .A1(DMP_EXP_EWSW[2]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[2]), .Y(n794) );
  AO22XLTS U1719 ( .A0(busy), .A1(DMP_SHT1_EWSW[2]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[2]), .Y(n793) );
  AO22XLTS U1720 ( .A0(n1412), .A1(DMP_EXP_EWSW[3]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[3]), .Y(n791) );
  AO22XLTS U1721 ( .A0(busy), .A1(DMP_SHT1_EWSW[3]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[3]), .Y(n790) );
  AO22XLTS U1722 ( .A0(n1412), .A1(DMP_EXP_EWSW[4]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[4]), .Y(n788) );
  AO22XLTS U1723 ( .A0(busy), .A1(DMP_SHT1_EWSW[4]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[4]), .Y(n787) );
  AO22XLTS U1724 ( .A0(n1412), .A1(DMP_EXP_EWSW[5]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[5]), .Y(n785) );
  AO22XLTS U1725 ( .A0(busy), .A1(DMP_SHT1_EWSW[5]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[5]), .Y(n784) );
  AO22XLTS U1726 ( .A0(n1412), .A1(DMP_EXP_EWSW[6]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[6]), .Y(n782) );
  AO22XLTS U1727 ( .A0(busy), .A1(DMP_SHT1_EWSW[6]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[6]), .Y(n781) );
  AO22XLTS U1728 ( .A0(n1412), .A1(DMP_EXP_EWSW[7]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[7]), .Y(n779) );
  AO22XLTS U1729 ( .A0(busy), .A1(DMP_SHT1_EWSW[7]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[7]), .Y(n778) );
  AO22XLTS U1730 ( .A0(n1624), .A1(DMP_SHT2_EWSW[7]), .B0(n1411), .B1(
        DMP_SFG[7]), .Y(n777) );
  AO22XLTS U1731 ( .A0(n1412), .A1(DMP_EXP_EWSW[8]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[8]), .Y(n776) );
  AO22XLTS U1732 ( .A0(busy), .A1(DMP_SHT1_EWSW[8]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[8]), .Y(n775) );
  AO22XLTS U1733 ( .A0(n1412), .A1(DMP_EXP_EWSW[9]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[9]), .Y(n773) );
  AO22XLTS U1734 ( .A0(n1426), .A1(DMP_SHT1_EWSW[9]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[9]), .Y(n772) );
  AO22XLTS U1735 ( .A0(n1412), .A1(DMP_EXP_EWSW[10]), .B0(n1414), .B1(
        DMP_SHT1_EWSW[10]), .Y(n770) );
  BUFX4TS U1736 ( .A(n1413), .Y(n1422) );
  AO22XLTS U1737 ( .A0(n1426), .A1(DMP_SHT1_EWSW[10]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[10]), .Y(n769) );
  AO22XLTS U1738 ( .A0(n1412), .A1(DMP_EXP_EWSW[11]), .B0(n1716), .B1(
        DMP_SHT1_EWSW[11]), .Y(n767) );
  AO22XLTS U1739 ( .A0(n1426), .A1(DMP_SHT1_EWSW[11]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[11]), .Y(n766) );
  BUFX4TS U1740 ( .A(n1716), .Y(n1416) );
  AO22XLTS U1741 ( .A0(n1412), .A1(DMP_EXP_EWSW[12]), .B0(n1416), .B1(
        DMP_SHT1_EWSW[12]), .Y(n764) );
  AO22XLTS U1742 ( .A0(n1426), .A1(DMP_SHT1_EWSW[12]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[12]), .Y(n763) );
  BUFX3TS U1743 ( .A(n1716), .Y(n1424) );
  AO22XLTS U1744 ( .A0(n1412), .A1(DMP_EXP_EWSW[13]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[13]), .Y(n761) );
  AO22XLTS U1745 ( .A0(n1426), .A1(DMP_SHT1_EWSW[13]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[13]), .Y(n760) );
  BUFX3TS U1746 ( .A(n1411), .Y(n1622) );
  AO22XLTS U1747 ( .A0(n1622), .A1(DMP_SFG[13]), .B0(n1528), .B1(
        DMP_SHT2_EWSW[13]), .Y(n759) );
  AO22XLTS U1748 ( .A0(n1412), .A1(DMP_EXP_EWSW[14]), .B0(n1716), .B1(
        DMP_SHT1_EWSW[14]), .Y(n758) );
  AO22XLTS U1749 ( .A0(n1426), .A1(DMP_SHT1_EWSW[14]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[14]), .Y(n757) );
  AO22XLTS U1750 ( .A0(n1611), .A1(DMP_SFG[14]), .B0(n1613), .B1(
        DMP_SHT2_EWSW[14]), .Y(n756) );
  AO22XLTS U1751 ( .A0(n1412), .A1(DMP_EXP_EWSW[15]), .B0(n1416), .B1(
        DMP_SHT1_EWSW[15]), .Y(n755) );
  AO22XLTS U1752 ( .A0(n1426), .A1(DMP_SHT1_EWSW[15]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[15]), .Y(n754) );
  AO22XLTS U1753 ( .A0(n1611), .A1(DMP_SFG[15]), .B0(n1616), .B1(
        DMP_SHT2_EWSW[15]), .Y(n753) );
  AO22XLTS U1754 ( .A0(n1412), .A1(DMP_EXP_EWSW[16]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[16]), .Y(n752) );
  AO22XLTS U1755 ( .A0(busy), .A1(DMP_SHT1_EWSW[16]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[16]), .Y(n751) );
  AO22XLTS U1756 ( .A0(n1622), .A1(DMP_SFG[16]), .B0(n1624), .B1(
        DMP_SHT2_EWSW[16]), .Y(n750) );
  AO22XLTS U1757 ( .A0(n1425), .A1(DMP_EXP_EWSW[17]), .B0(n1415), .B1(
        DMP_SHT1_EWSW[17]), .Y(n749) );
  AO22XLTS U1758 ( .A0(busy), .A1(DMP_SHT1_EWSW[17]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[17]), .Y(n748) );
  AO22XLTS U1759 ( .A0(n1617), .A1(DMP_SFG[17]), .B0(n1528), .B1(
        DMP_SHT2_EWSW[17]), .Y(n747) );
  AO22XLTS U1760 ( .A0(n1425), .A1(DMP_EXP_EWSW[18]), .B0(n1416), .B1(
        DMP_SHT1_EWSW[18]), .Y(n746) );
  AO22XLTS U1761 ( .A0(busy), .A1(DMP_SHT1_EWSW[18]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[18]), .Y(n745) );
  AO22XLTS U1762 ( .A0(n1622), .A1(DMP_SFG[18]), .B0(n1624), .B1(
        DMP_SHT2_EWSW[18]), .Y(n744) );
  AO22XLTS U1763 ( .A0(n1425), .A1(DMP_EXP_EWSW[19]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[19]), .Y(n743) );
  AO22XLTS U1764 ( .A0(busy), .A1(DMP_SHT1_EWSW[19]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[19]), .Y(n742) );
  AO22XLTS U1765 ( .A0(n1617), .A1(DMP_SFG[19]), .B0(n1624), .B1(
        DMP_SHT2_EWSW[19]), .Y(n741) );
  AO22XLTS U1766 ( .A0(n1425), .A1(DMP_EXP_EWSW[20]), .B0(n1415), .B1(
        DMP_SHT1_EWSW[20]), .Y(n740) );
  AO22XLTS U1767 ( .A0(busy), .A1(DMP_SHT1_EWSW[20]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[20]), .Y(n739) );
  AO22XLTS U1768 ( .A0(n1617), .A1(DMP_SFG[20]), .B0(n1616), .B1(
        DMP_SHT2_EWSW[20]), .Y(n738) );
  AO22XLTS U1769 ( .A0(n1425), .A1(DMP_EXP_EWSW[21]), .B0(n1416), .B1(
        DMP_SHT1_EWSW[21]), .Y(n737) );
  AO22XLTS U1770 ( .A0(busy), .A1(DMP_SHT1_EWSW[21]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[21]), .Y(n736) );
  AO22XLTS U1771 ( .A0(n1617), .A1(DMP_SFG[21]), .B0(n1528), .B1(
        DMP_SHT2_EWSW[21]), .Y(n735) );
  AO22XLTS U1772 ( .A0(n1425), .A1(DMP_EXP_EWSW[22]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[22]), .Y(n734) );
  AO22XLTS U1773 ( .A0(n1426), .A1(DMP_SHT1_EWSW[22]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[22]), .Y(n733) );
  AO22XLTS U1774 ( .A0(n1622), .A1(DMP_SFG[22]), .B0(n1624), .B1(
        DMP_SHT2_EWSW[22]), .Y(n732) );
  AO22XLTS U1775 ( .A0(n1425), .A1(DMP_EXP_EWSW[23]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[23]), .Y(n731) );
  AO22XLTS U1776 ( .A0(n1426), .A1(DMP_SHT1_EWSW[23]), .B0(n1413), .B1(
        DMP_SHT2_EWSW[23]), .Y(n730) );
  AO22XLTS U1777 ( .A0(n1624), .A1(DMP_SHT2_EWSW[23]), .B0(n1622), .B1(
        DMP_SFG[23]), .Y(n729) );
  AO22XLTS U1778 ( .A0(n1487), .A1(DMP_SFG[23]), .B0(n1749), .B1(
        DMP_exp_NRM_EW[0]), .Y(n728) );
  AO22XLTS U1779 ( .A0(n1425), .A1(DMP_EXP_EWSW[24]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[24]), .Y(n726) );
  AO22XLTS U1780 ( .A0(n1426), .A1(DMP_SHT1_EWSW[24]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[24]), .Y(n725) );
  AO22XLTS U1781 ( .A0(n1616), .A1(DMP_SHT2_EWSW[24]), .B0(n1622), .B1(
        DMP_SFG[24]), .Y(n724) );
  AO22XLTS U1782 ( .A0(n1487), .A1(DMP_SFG[24]), .B0(n1749), .B1(
        DMP_exp_NRM_EW[1]), .Y(n723) );
  AO22XLTS U1783 ( .A0(n1425), .A1(DMP_EXP_EWSW[25]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[25]), .Y(n721) );
  AO22XLTS U1784 ( .A0(n1426), .A1(DMP_SHT1_EWSW[25]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[25]), .Y(n720) );
  AO22XLTS U1785 ( .A0(n1624), .A1(DMP_SHT2_EWSW[25]), .B0(n1622), .B1(
        DMP_SFG[25]), .Y(n719) );
  AO22XLTS U1786 ( .A0(n1487), .A1(DMP_SFG[25]), .B0(n1567), .B1(
        DMP_exp_NRM_EW[2]), .Y(n718) );
  AO22XLTS U1787 ( .A0(n1425), .A1(DMP_EXP_EWSW[26]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[26]), .Y(n716) );
  AO22XLTS U1788 ( .A0(busy), .A1(DMP_SHT1_EWSW[26]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[26]), .Y(n715) );
  AO22XLTS U1789 ( .A0(n1616), .A1(DMP_SHT2_EWSW[26]), .B0(n1622), .B1(
        DMP_SFG[26]), .Y(n714) );
  AO22XLTS U1790 ( .A0(n1487), .A1(DMP_SFG[26]), .B0(n1567), .B1(
        DMP_exp_NRM_EW[3]), .Y(n713) );
  AO22XLTS U1791 ( .A0(n1425), .A1(n985), .B0(n1424), .B1(DMP_SHT1_EWSW[27]), 
        .Y(n711) );
  AO22XLTS U1792 ( .A0(n1426), .A1(DMP_SHT1_EWSW[27]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[27]), .Y(n710) );
  AO22XLTS U1793 ( .A0(n1624), .A1(DMP_SHT2_EWSW[27]), .B0(n1622), .B1(
        DMP_SFG[27]), .Y(n709) );
  AO22XLTS U1794 ( .A0(n1487), .A1(DMP_SFG[27]), .B0(n1567), .B1(
        DMP_exp_NRM_EW[4]), .Y(n708) );
  AO22XLTS U1795 ( .A0(n1425), .A1(DMP_EXP_EWSW[28]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[28]), .Y(n706) );
  AO22XLTS U1796 ( .A0(n1426), .A1(DMP_SHT1_EWSW[28]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[28]), .Y(n705) );
  AO22XLTS U1797 ( .A0(n1528), .A1(DMP_SHT2_EWSW[28]), .B0(n1622), .B1(
        DMP_SFG[28]), .Y(n704) );
  AO22XLTS U1798 ( .A0(n1487), .A1(DMP_SFG[28]), .B0(n1567), .B1(
        DMP_exp_NRM_EW[5]), .Y(n703) );
  AO22XLTS U1799 ( .A0(n1425), .A1(DMP_EXP_EWSW[29]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[29]), .Y(n701) );
  AO22XLTS U1800 ( .A0(n1426), .A1(DMP_SHT1_EWSW[29]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[29]), .Y(n700) );
  AO22XLTS U1801 ( .A0(n1613), .A1(DMP_SHT2_EWSW[29]), .B0(n1622), .B1(
        DMP_SFG[29]), .Y(n699) );
  AO22XLTS U1802 ( .A0(n1487), .A1(DMP_SFG[29]), .B0(n1567), .B1(
        DMP_exp_NRM_EW[6]), .Y(n698) );
  AO22XLTS U1803 ( .A0(n1632), .A1(DMP_EXP_EWSW[30]), .B0(n1424), .B1(
        DMP_SHT1_EWSW[30]), .Y(n696) );
  AO22XLTS U1804 ( .A0(n1426), .A1(DMP_SHT1_EWSW[30]), .B0(n1422), .B1(
        DMP_SHT2_EWSW[30]), .Y(n695) );
  AO22XLTS U1805 ( .A0(n1624), .A1(DMP_SHT2_EWSW[30]), .B0(n1622), .B1(
        DMP_SFG[30]), .Y(n694) );
  INVX4TS U1806 ( .A(n1546), .Y(n1536) );
  AO22XLTS U1807 ( .A0(n1536), .A1(DMP_SFG[30]), .B0(n1567), .B1(
        DMP_exp_NRM_EW[7]), .Y(n693) );
  AO22XLTS U1808 ( .A0(n1423), .A1(DmP_EXP_EWSW[16]), .B0(n1716), .B1(
        DmP_mant_SHT1_SW[16]), .Y(n658) );
  AO22XLTS U1809 ( .A0(n1423), .A1(DmP_EXP_EWSW[17]), .B0(n1415), .B1(
        DmP_mant_SHT1_SW[17]), .Y(n656) );
  AO22XLTS U1810 ( .A0(n1423), .A1(DmP_EXP_EWSW[19]), .B0(n1415), .B1(n978), 
        .Y(n652) );
  AO22XLTS U1811 ( .A0(n1423), .A1(DmP_EXP_EWSW[21]), .B0(n1415), .B1(
        DmP_mant_SHT1_SW[21]), .Y(n648) );
  OAI222X1TS U1812 ( .A0(n1419), .A1(n1710), .B0(n1648), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1629), .C1(n1417), .Y(n644) );
  OAI222X1TS U1813 ( .A0(n1419), .A1(n1651), .B0(n1712), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1720), .C1(n1417), .Y(n643) );
  OAI222X1TS U1814 ( .A0(n1419), .A1(n1652), .B0(n1708), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1753), .C1(n1417), .Y(n642) );
  INVX4TS U1815 ( .A(n1420), .Y(n1599) );
  NAND2X1TS U1816 ( .A(n1523), .B(Shift_reg_FLAGS_7[0]), .Y(n1421) );
  OAI2BB1X1TS U1817 ( .A0N(underflow_flag), .A1N(n1599), .B0(n1421), .Y(n640)
         );
  AO22XLTS U1818 ( .A0(n1423), .A1(ZERO_FLAG_EXP), .B0(n1415), .B1(
        ZERO_FLAG_SHT1), .Y(n638) );
  AO22XLTS U1819 ( .A0(n1426), .A1(ZERO_FLAG_SHT1), .B0(n1422), .B1(
        ZERO_FLAG_SHT2), .Y(n637) );
  AO22XLTS U1820 ( .A0(n1624), .A1(ZERO_FLAG_SHT2), .B0(n1622), .B1(
        ZERO_FLAG_SFG), .Y(n636) );
  AO22XLTS U1821 ( .A0(n1487), .A1(ZERO_FLAG_SFG), .B0(n1749), .B1(
        ZERO_FLAG_NRM), .Y(n635) );
  AO22XLTS U1822 ( .A0(Shift_reg_FLAGS_7[0]), .A1(ZERO_FLAG_SHT1SHT2), .B0(
        n1599), .B1(zero_flag), .Y(n633) );
  AO22XLTS U1823 ( .A0(n1423), .A1(OP_FLAG_EXP), .B0(OP_FLAG_SHT1), .B1(n1716), 
        .Y(n632) );
  AO22XLTS U1824 ( .A0(n1426), .A1(OP_FLAG_SHT1), .B0(n1718), .B1(OP_FLAG_SHT2), .Y(n631) );
  AO22XLTS U1825 ( .A0(n1617), .A1(n1514), .B0(n1613), .B1(OP_FLAG_SHT2), .Y(
        n630) );
  AO22XLTS U1826 ( .A0(n1425), .A1(SIGN_FLAG_EXP), .B0(n1424), .B1(
        SIGN_FLAG_SHT1), .Y(n629) );
  AO22XLTS U1827 ( .A0(n1426), .A1(SIGN_FLAG_SHT1), .B0(n1718), .B1(
        SIGN_FLAG_SHT2), .Y(n628) );
  AO22XLTS U1828 ( .A0(n1616), .A1(SIGN_FLAG_SHT2), .B0(n1622), .B1(
        SIGN_FLAG_SFG), .Y(n627) );
  AO22XLTS U1829 ( .A0(n1536), .A1(SIGN_FLAG_SFG), .B0(n1749), .B1(
        SIGN_FLAG_NRM), .Y(n626) );
  AOI22X1TS U1830 ( .A0(n1514), .A1(n992), .B0(DmP_mant_SFG_SWR[15]), .B1(
        n1638), .Y(intadd_4_CI) );
  AOI2BB2XLTS U1831 ( .B0(n1536), .B1(intadd_4_SUM_0_), .A0N(
        Raw_mant_NRM_SWR[15]), .A1N(n1487), .Y(n623) );
  AOI22X1TS U1832 ( .A0(n1514), .A1(n993), .B0(DmP_mant_SFG_SWR[16]), .B1(
        n1638), .Y(intadd_4_B_1_) );
  AOI22X1TS U1833 ( .A0(n1569), .A1(intadd_4_SUM_1_), .B0(n1631), .B1(n1567), 
        .Y(n622) );
  AOI22X1TS U1834 ( .A0(n1514), .A1(n994), .B0(DmP_mant_SFG_SWR[17]), .B1(
        n1638), .Y(intadd_4_B_2_) );
  AOI22X1TS U1835 ( .A0(n1569), .A1(intadd_4_SUM_2_), .B0(n1628), .B1(n1567), 
        .Y(n621) );
  AOI22X1TS U1836 ( .A0(n1514), .A1(n995), .B0(DmP_mant_SFG_SWR[18]), .B1(
        n1638), .Y(intadd_4_B_3_) );
  AOI2BB2XLTS U1837 ( .B0(n1536), .B1(intadd_4_SUM_3_), .A0N(
        Raw_mant_NRM_SWR[18]), .A1N(n1487), .Y(n620) );
  AOI22X1TS U1838 ( .A0(n1514), .A1(n996), .B0(DmP_mant_SFG_SWR[19]), .B1(
        n1638), .Y(intadd_4_B_4_) );
  AOI2BB2XLTS U1839 ( .B0(n1536), .B1(intadd_4_SUM_4_), .A0N(
        Raw_mant_NRM_SWR[19]), .A1N(n1487), .Y(n619) );
  AOI22X1TS U1840 ( .A0(DmP_mant_SFG_SWR[20]), .A1(n1459), .B0(n1514), .B1(
        n997), .Y(intadd_4_B_5_) );
  AOI2BB2XLTS U1841 ( .B0(n1536), .B1(intadd_4_SUM_5_), .A0N(
        Raw_mant_NRM_SWR[20]), .A1N(n1536), .Y(n618) );
  AOI22X1TS U1842 ( .A0(DmP_mant_SFG_SWR[21]), .A1(n1459), .B0(n1514), .B1(
        n998), .Y(intadd_4_B_6_) );
  AOI22X1TS U1843 ( .A0(n1536), .A1(intadd_4_SUM_6_), .B0(n1626), .B1(n1567), 
        .Y(n617) );
  AOI2BB2XLTS U1844 ( .B0(DmP_mant_SFG_SWR[22]), .B1(n1459), .A0N(n1638), 
        .A1N(DmP_mant_SFG_SWR[22]), .Y(intadd_4_B_7_) );
  AOI22X1TS U1845 ( .A0(n1536), .A1(intadd_4_SUM_7_), .B0(n1625), .B1(n1567), 
        .Y(n616) );
  AOI2BB2XLTS U1846 ( .B0(DmP_mant_SFG_SWR[23]), .B1(n1459), .A0N(n1459), 
        .A1N(DmP_mant_SFG_SWR[23]), .Y(intadd_4_B_8_) );
  AOI22X1TS U1847 ( .A0(n1569), .A1(intadd_4_SUM_8_), .B0(n957), .B1(n1567), 
        .Y(n615) );
  AOI22X1TS U1848 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n1459), .B0(n1012), .B1(
        n1000), .Y(intadd_4_B_9_) );
  AOI22X1TS U1849 ( .A0(n1569), .A1(intadd_4_SUM_9_), .B0(n1011), .B1(n1567), 
        .Y(n614) );
  AOI22X1TS U1850 ( .A0(DmP_mant_SFG_SWR[25]), .A1(n1514), .B0(n1638), .B1(
        n1001), .Y(n1427) );
  XNOR2X1TS U1851 ( .A(intadd_4_n1), .B(n1427), .Y(n1428) );
  AOI22X1TS U1852 ( .A0(n1569), .A1(n1428), .B0(n1627), .B1(n1567), .Y(n613)
         );
  NAND2X2TS U1853 ( .A(n1655), .B(n1455), .Y(n1550) );
  NOR2X2TS U1854 ( .A(shift_value_SHT2_EWR[3]), .B(n1664), .Y(n1481) );
  INVX2TS U1855 ( .A(n1481), .Y(n1464) );
  AOI22X1TS U1856 ( .A0(Data_array_SWR[19]), .A1(n1429), .B0(
        Data_array_SWR[15]), .B1(n1430), .Y(n1431) );
  OAI21X1TS U1857 ( .A0(n1646), .A1(n1549), .B0(n1431), .Y(n1538) );
  INVX2TS U1858 ( .A(n1430), .Y(n1548) );
  OAI22X1TS U1859 ( .A0(n1630), .A1(n1550), .B0(n1700), .B1(n1548), .Y(n1539)
         );
  NOR2X2TS U1860 ( .A(shift_value_SHT2_EWR[2]), .B(shift_value_SHT2_EWR[3]), 
        .Y(n1480) );
  INVX2TS U1861 ( .A(n1480), .Y(n1463) );
  NAND2X2TS U1862 ( .A(n1597), .B(n1467), .Y(n1596) );
  NAND2X2TS U1863 ( .A(n1620), .B(n1467), .Y(n1553) );
  OAI22X1TS U1864 ( .A0(n1650), .A1(n1596), .B0(n1707), .B1(n1553), .Y(n1432)
         );
  AOI221X1TS U1865 ( .A0(n1620), .A1(n1538), .B0(n1597), .B1(n1539), .C0(n1432), .Y(n1571) );
  AOI22X1TS U1866 ( .A0(n1528), .A1(n1571), .B0(n1002), .B1(n1611), .Y(n612)
         );
  AOI22X1TS U1867 ( .A0(n1514), .A1(DmP_mant_SFG_SWR[11]), .B0(n1638), .B1(
        n1008), .Y(n1529) );
  CLKAND2X2TS U1868 ( .A(DMP_SFG[9]), .B(n1529), .Y(n1564) );
  NAND2BX1TS U1869 ( .AN(DMP_SFG[10]), .B(n1433), .Y(n1542) );
  OAI2BB1X1TS U1870 ( .A0N(n1564), .A1N(n1542), .B0(n1543), .Y(n1530) );
  INVX2TS U1871 ( .A(n1530), .Y(n1434) );
  OAI21XLTS U1872 ( .A0(n1434), .A1(n1532), .B0(n1531), .Y(n1435) );
  XNOR2X1TS U1873 ( .A(n1436), .B(n1435), .Y(n1437) );
  AOI22X1TS U1874 ( .A0(n1569), .A1(n1437), .B0(n1633), .B1(n1567), .Y(n611)
         );
  AOI22X1TS U1875 ( .A0(Data_array_SWR[13]), .A1(n1438), .B0(Data_array_SWR[9]), .B1(n1429), .Y(n1440) );
  AOI22X1TS U1876 ( .A0(Data_array_SWR[5]), .A1(n1430), .B0(Data_array_SWR[1]), 
        .B1(n1467), .Y(n1439) );
  OAI211X1TS U1877 ( .A0(n1445), .A1(n1655), .B0(n1440), .C0(n1439), .Y(n1601)
         );
  AOI22X1TS U1878 ( .A0(Data_array_SWR[24]), .A1(n1593), .B0(n1597), .B1(n1601), .Y(n1441) );
  AOI22X1TS U1879 ( .A0(n1616), .A1(n1441), .B0(n1611), .B1(n1003), .Y(n609)
         );
  AOI22X1TS U1880 ( .A0(DmP_mant_SFG_SWR[1]), .A1(n1459), .B0(n1012), .B1(
        n1003), .Y(n1442) );
  AOI2BB2XLTS U1881 ( .B0(n1536), .B1(n1442), .A0N(Raw_mant_NRM_SWR[1]), .A1N(
        n1536), .Y(n608) );
  AOI22X1TS U1882 ( .A0(Data_array_SWR[12]), .A1(n1430), .B0(
        Data_array_SWR[16]), .B1(n1429), .Y(n1444) );
  NOR2X2TS U1883 ( .A(n1655), .B(n1463), .Y(n1508) );
  AOI22X1TS U1884 ( .A0(Data_array_SWR[20]), .A1(n1438), .B0(
        Data_array_SWR[24]), .B1(n1508), .Y(n1443) );
  NAND2X1TS U1885 ( .A(n1444), .B(n1443), .Y(n1594) );
  INVX2TS U1886 ( .A(n1445), .Y(n1592) );
  CLKINVX1TS U1887 ( .A(DmP_mant_SFG_SWR[8]), .Y(n1450) );
  AOI22X1TS U1888 ( .A0(n1528), .A1(n1590), .B0(n1450), .B1(n1411), .Y(n606)
         );
  AOI22X1TS U1889 ( .A0(n1514), .A1(n1010), .B0(DmP_mant_SFG_SWR[7]), .B1(
        n1638), .Y(n1447) );
  NAND2BX1TS U1890 ( .AN(DMP_SFG[5]), .B(n1447), .Y(n1502) );
  AOI22X1TS U1891 ( .A0(n1514), .A1(DmP_mant_SFG_SWR[6]), .B0(n1005), .B1(
        n1638), .Y(n1446) );
  AOI22X1TS U1892 ( .A0(DmP_mant_SFG_SWR[5]), .A1(n1514), .B0(n1638), .B1(
        n1007), .Y(n1470) );
  NAND2X1TS U1893 ( .A(n1470), .B(DMP_SFG[3]), .Y(n1472) );
  NAND2X1TS U1894 ( .A(n1446), .B(DMP_SFG[4]), .Y(n1492) );
  OAI21XLTS U1895 ( .A0(n1494), .A1(n1472), .B0(n1492), .Y(n1449) );
  INVX2TS U1896 ( .A(n1447), .Y(n1448) );
  CLKAND2X2TS U1897 ( .A(DMP_SFG[5]), .B(n1448), .Y(n1500) );
  AOI21X1TS U1898 ( .A0(n1502), .A1(n1449), .B0(n1500), .Y(n1453) );
  OAI22X1TS U1899 ( .A0(n1459), .A1(n1450), .B0(DmP_mant_SFG_SWR[8]), .B1(
        n1514), .Y(n1451) );
  NAND2BX1TS U1900 ( .AN(n1451), .B(DMP_SFG[6]), .Y(n1558) );
  NAND2BX1TS U1901 ( .AN(DMP_SFG[6]), .B(n1451), .Y(n1501) );
  NAND2X1TS U1902 ( .A(n1558), .B(n1501), .Y(n1452) );
  XNOR2X1TS U1903 ( .A(n1453), .B(n1452), .Y(n1454) );
  AOI2BB2XLTS U1904 ( .B0(n1536), .B1(n1454), .A0N(Raw_mant_NRM_SWR[8]), .A1N(
        n1569), .Y(n605) );
  INVX2TS U1905 ( .A(n1411), .Y(n1624) );
  AOI22X1TS U1906 ( .A0(Data_array_SWR[12]), .A1(n1438), .B0(Data_array_SWR[8]), .B1(n1429), .Y(n1457) );
  AOI22X1TS U1907 ( .A0(Data_array_SWR[4]), .A1(n1430), .B0(Data_array_SWR[0]), 
        .B1(n1467), .Y(n1456) );
  OAI211X1TS U1908 ( .A0(n1511), .A1(n1655), .B0(n1457), .C0(n1456), .Y(n1619)
         );
  AOI22X1TS U1909 ( .A0(Data_array_SWR[25]), .A1(n1593), .B0(n1597), .B1(n1619), .Y(n1458) );
  AOI22X1TS U1910 ( .A0(n1528), .A1(n1458), .B0(n1617), .B1(n1004), .Y(n603)
         );
  AOI22X1TS U1911 ( .A0(DmP_mant_SFG_SWR[0]), .A1(n1459), .B0(n1514), .B1(
        n1004), .Y(n1460) );
  AOI2BB2XLTS U1912 ( .B0(n1536), .B1(n1460), .A0N(n990), .A1N(n1487), .Y(n602) );
  OAI22X1TS U1913 ( .A0(n1650), .A1(n1549), .B0(n1706), .B1(n1550), .Y(n1462)
         );
  AO22XLTS U1914 ( .A0(n1577), .A1(shift_value_SHT2_EWR[4]), .B0(
        Data_array_SWR[6]), .B1(n1430), .Y(n1461) );
  AOI211X1TS U1915 ( .A0(Data_array_SWR[2]), .A1(n1467), .B0(n1462), .C0(n1461), .Y(n1598) );
  OAI22X1TS U1916 ( .A0(n1620), .A1(n1598), .B0(n1646), .B1(n1553), .Y(n1589)
         );
  OAI22X1TS U1917 ( .A0(n1647), .A1(n1549), .B0(n1707), .B1(n1550), .Y(n1466)
         );
  AO22XLTS U1918 ( .A0(n1586), .A1(shift_value_SHT2_EWR[4]), .B0(
        Data_array_SWR[7]), .B1(n1430), .Y(n1465) );
  AOI211X1TS U1919 ( .A0(Data_array_SWR[3]), .A1(n1467), .B0(n1466), .C0(n1465), .Y(n1595) );
  OAI22X1TS U1920 ( .A0(n1620), .A1(n1595), .B0(n1630), .B1(n1553), .Y(n1588)
         );
  AOI22X1TS U1921 ( .A0(Data_array_SWR[14]), .A1(n1429), .B0(
        Data_array_SWR[10]), .B1(n1430), .Y(n1469) );
  AOI22X1TS U1922 ( .A0(Data_array_SWR[22]), .A1(n1508), .B0(
        Data_array_SWR[18]), .B1(n1438), .Y(n1468) );
  NAND2X1TS U1923 ( .A(n1469), .B(n1468), .Y(n1587) );
  AOI22X1TS U1924 ( .A0(n1613), .A1(n1585), .B0(n1005), .B1(n1611), .Y(n595)
         );
  INVX2TS U1925 ( .A(n1492), .Y(n1503) );
  NOR2XLTS U1926 ( .A(n1503), .B(n1494), .Y(n1476) );
  INVX2TS U1927 ( .A(n1482), .Y(n1473) );
  INVX2TS U1928 ( .A(n1472), .Y(n1483) );
  XNOR2X1TS U1929 ( .A(n1476), .B(n1475), .Y(n1477) );
  AOI22X1TS U1930 ( .A0(n1569), .A1(n1477), .B0(n1660), .B1(n1546), .Y(n594)
         );
  AOI22X1TS U1931 ( .A0(Data_array_SWR[20]), .A1(n1480), .B0(
        Data_array_SWR[24]), .B1(n1481), .Y(n1491) );
  AOI22X1TS U1932 ( .A0(Data_array_SWR[12]), .A1(n1429), .B0(Data_array_SWR[8]), .B1(n1430), .Y(n1479) );
  NAND2X1TS U1933 ( .A(Data_array_SWR[16]), .B(n1438), .Y(n1478) );
  OAI211X1TS U1934 ( .A0(n1491), .A1(n1655), .B0(n1479), .C0(n1478), .Y(n1584)
         );
  AO22X1TS U1935 ( .A0(Data_array_SWR[25]), .A1(n1481), .B0(Data_array_SWR[21]), .B1(n1480), .Y(n1583) );
  AOI22X1TS U1936 ( .A0(n1616), .A1(n1582), .B0(n1006), .B1(n1611), .Y(n592)
         );
  CMPR32X2TS U1937 ( .A(DMP_SFG[2]), .B(n975), .C(n1484), .CO(n1485), .S(n1017) );
  XNOR2X1TS U1938 ( .A(n1486), .B(n1485), .Y(n1488) );
  AOI2BB2XLTS U1939 ( .B0(n1536), .B1(n1488), .A0N(Raw_mant_NRM_SWR[5]), .A1N(
        n1487), .Y(n591) );
  AOI22X1TS U1940 ( .A0(Data_array_SWR[13]), .A1(n1429), .B0(Data_array_SWR[9]), .B1(n1430), .Y(n1490) );
  AOI22X1TS U1941 ( .A0(Data_array_SWR[17]), .A1(n1438), .B0(
        shift_value_SHT2_EWR[4]), .B1(n1583), .Y(n1489) );
  NAND2X1TS U1942 ( .A(n1490), .B(n1489), .Y(n1581) );
  INVX2TS U1943 ( .A(n1491), .Y(n1580) );
  AOI22X1TS U1944 ( .A0(n1616), .A1(n1579), .B0(n1007), .B1(n1617), .Y(n590)
         );
  NOR2BX1TS U1945 ( .AN(n1502), .B(n1500), .Y(n1496) );
  OAI21XLTS U1946 ( .A0(n1494), .A1(n1493), .B0(n1492), .Y(n1495) );
  XNOR2X1TS U1947 ( .A(n1496), .B(n1495), .Y(n1497) );
  AOI22X1TS U1948 ( .A0(n1569), .A1(n1497), .B0(n1654), .B1(n1546), .Y(n589)
         );
  AOI22X1TS U1949 ( .A0(Data_array_SWR[15]), .A1(n1429), .B0(
        Data_array_SWR[11]), .B1(n1430), .Y(n1499) );
  AOI22X1TS U1950 ( .A0(Data_array_SWR[23]), .A1(n1508), .B0(
        Data_array_SWR[19]), .B1(n1438), .Y(n1498) );
  NAND2X1TS U1951 ( .A(n1499), .B(n1498), .Y(n1578) );
  AOI22X1TS U1952 ( .A0(n1528), .A1(n1576), .B0(n1010), .B1(n1617), .Y(n588)
         );
  OAI2BB1X1TS U1953 ( .A0N(n1500), .A1N(n1501), .B0(n1558), .Y(n1516) );
  AOI31XLTS U1954 ( .A0(n1503), .A1(n1502), .A2(n1501), .B0(n1516), .Y(n1506)
         );
  AOI22X1TS U1955 ( .A0(n1514), .A1(DmP_mant_SFG_SWR[9]), .B0(n1009), .B1(
        n1638), .Y(n1504) );
  NAND2X1TS U1956 ( .A(n1504), .B(DMP_SFG[7]), .Y(n1557) );
  NOR2BX1TS U1957 ( .AN(n1557), .B(n1559), .Y(n1505) );
  XOR2X1TS U1958 ( .A(n1506), .B(n1505), .Y(n1507) );
  AOI22X1TS U1959 ( .A0(n1569), .A1(n1507), .B0(n1661), .B1(n1546), .Y(n587)
         );
  AOI22X1TS U1960 ( .A0(Data_array_SWR[17]), .A1(n1429), .B0(
        Data_array_SWR[13]), .B1(n1430), .Y(n1510) );
  AOI22X1TS U1961 ( .A0(Data_array_SWR[21]), .A1(n1438), .B0(
        Data_array_SWR[25]), .B1(n1508), .Y(n1509) );
  NAND2X1TS U1962 ( .A(n1510), .B(n1509), .Y(n1575) );
  INVX2TS U1963 ( .A(n1511), .Y(n1574) );
  AOI22X1TS U1964 ( .A0(n1613), .A1(n1573), .B0(n1009), .B1(n1617), .Y(n586)
         );
  AOI22X1TS U1965 ( .A0(n1514), .A1(DmP_mant_SFG_SWR[10]), .B0(n1638), .B1(
        n991), .Y(n1515) );
  NAND2X1TS U1966 ( .A(n1515), .B(DMP_SFG[8]), .Y(n1540) );
  INVX2TS U1967 ( .A(n1540), .Y(n1562) );
  NOR2X2TS U1968 ( .A(n1515), .B(DMP_SFG[8]), .Y(n1560) );
  NOR2XLTS U1969 ( .A(n1562), .B(n1560), .Y(n1519) );
  INVX2TS U1970 ( .A(n1516), .Y(n1517) );
  OAI21XLTS U1971 ( .A0(n1559), .A1(n1517), .B0(n1557), .Y(n1518) );
  XNOR2X1TS U1972 ( .A(n1519), .B(n1518), .Y(n1520) );
  AOI22X1TS U1973 ( .A0(n1569), .A1(n1520), .B0(n1656), .B1(n1546), .Y(n585)
         );
  AOI22X1TS U1974 ( .A0(Data_array_SWR[12]), .A1(n1621), .B0(
        Data_array_SWR[13]), .B1(n1593), .Y(n1521) );
  OAI221X1TS U1975 ( .A0(n1620), .A1(n1526), .B0(n1597), .B1(n1527), .C0(n1521), .Y(n1524) );
  AO22XLTS U1976 ( .A0(n1600), .A1(n1524), .B0(final_result_ieee[10]), .B1(
        n1599), .Y(n583) );
  AOI22X1TS U1977 ( .A0(Data_array_SWR[12]), .A1(n1593), .B0(
        Data_array_SWR[13]), .B1(n1621), .Y(n1525) );
  OAI221X1TS U1978 ( .A0(n1620), .A1(n1527), .B0(n1597), .B1(n1526), .C0(n1525), .Y(n1572) );
  OR2X1TS U1979 ( .A(DMP_SFG[9]), .B(n1529), .Y(n1563) );
  AOI31XLTS U1980 ( .A0(n1562), .A1(n1542), .A2(n1563), .B0(n1530), .Y(n1534)
         );
  XNOR2X1TS U1981 ( .A(n1534), .B(n1533), .Y(n1535) );
  AOI2BB2XLTS U1982 ( .B0(n1536), .B1(n1535), .A0N(Raw_mant_NRM_SWR[13]), 
        .A1N(n1536), .Y(n581) );
  OAI22X1TS U1983 ( .A0(n1650), .A1(n1553), .B0(n1707), .B1(n1596), .Y(n1537)
         );
  AOI221X1TS U1984 ( .A0(n1620), .A1(n1539), .B0(n1597), .B1(n1538), .C0(n1537), .Y(n1570) );
  AOI22X1TS U1985 ( .A0(n1528), .A1(n1570), .B0(n1617), .B1(n1008), .Y(n580)
         );
  OAI21XLTS U1986 ( .A0(n1560), .A1(n1557), .B0(n1540), .Y(n1541) );
  AOI21X1TS U1987 ( .A0(n1563), .A1(n1541), .B0(n1564), .Y(n1545) );
  NAND2X1TS U1988 ( .A(n1543), .B(n1542), .Y(n1544) );
  XNOR2X1TS U1989 ( .A(n1545), .B(n1544), .Y(n1547) );
  AOI22X1TS U1990 ( .A0(n1569), .A1(n1547), .B0(n1653), .B1(n1546), .Y(n579)
         );
  OAI22X1TS U1991 ( .A0(n1646), .A1(n1550), .B0(n1696), .B1(n1548), .Y(n1555)
         );
  OAI222X1TS U1992 ( .A0(n1550), .A1(n1700), .B0(n1549), .B1(n1630), .C0(n1548), .C1(n1650), .Y(n1556) );
  OAI22X1TS U1993 ( .A0(n1706), .A1(n1596), .B0(n1647), .B1(n1553), .Y(n1551)
         );
  AOI221X1TS U1994 ( .A0(n1620), .A1(n1555), .B0(n1597), .B1(n1556), .C0(n1551), .Y(n1552) );
  AOI22X1TS U1995 ( .A0(n1616), .A1(n1552), .B0(n1617), .B1(n991), .Y(n578) );
  INVX4TS U1996 ( .A(n1600), .Y(n1603) );
  OAI2BB2XLTS U1997 ( .B0(n1552), .B1(n1603), .A0N(final_result_ieee[8]), 
        .A1N(n1599), .Y(n577) );
  OAI22X1TS U1998 ( .A0(n1706), .A1(n1553), .B0(n1647), .B1(n1596), .Y(n1554)
         );
  AOI221X1TS U1999 ( .A0(n1620), .A1(n1556), .B0(n1597), .B1(n1555), .C0(n1554), .Y(n1604) );
  OAI2BB2XLTS U2000 ( .B0(n1604), .B1(n1603), .A0N(final_result_ieee[13]), 
        .A1N(n1599), .Y(n576) );
  OAI32X1TS U2001 ( .A0(n1560), .A1(n1559), .A2(n1558), .B0(n1557), .B1(n1560), 
        .Y(n1561) );
  NOR2XLTS U2002 ( .A(n1562), .B(n1561), .Y(n1566) );
  NAND2BXLTS U2003 ( .AN(n1564), .B(n1563), .Y(n1565) );
  XNOR2X1TS U2004 ( .A(n1566), .B(n1565), .Y(n1568) );
  AOI22X1TS U2005 ( .A0(n1569), .A1(n1568), .B0(n1634), .B1(n1567), .Y(n575)
         );
  OAI2BB2XLTS U2006 ( .B0(n1570), .B1(n1603), .A0N(final_result_ieee[9]), 
        .A1N(n1599), .Y(n574) );
  OAI2BB2XLTS U2007 ( .B0(n1571), .B1(n1603), .A0N(final_result_ieee[12]), 
        .A1N(n1599), .Y(n573) );
  AO22XLTS U2008 ( .A0(n1600), .A1(n1572), .B0(final_result_ieee[11]), .B1(
        n1599), .Y(n572) );
  OAI2BB2XLTS U2009 ( .B0(n1573), .B1(n1603), .A0N(final_result_ieee[7]), 
        .A1N(n1599), .Y(n571) );
  OAI2BB2XLTS U2010 ( .B0(n1605), .B1(n1603), .A0N(final_result_ieee[14]), 
        .A1N(n1599), .Y(n570) );
  OAI2BB2XLTS U2011 ( .B0(n1576), .B1(n1603), .A0N(final_result_ieee[5]), 
        .A1N(n1602), .Y(n569) );
  OAI2BB2XLTS U2012 ( .B0(n1607), .B1(n1603), .A0N(final_result_ieee[16]), 
        .A1N(n1602), .Y(n568) );
  OAI2BB2XLTS U2013 ( .B0(n1579), .B1(n1603), .A0N(final_result_ieee[3]), 
        .A1N(n1602), .Y(n567) );
  OAI2BB2XLTS U2014 ( .B0(n1610), .B1(n1603), .A0N(final_result_ieee[18]), 
        .A1N(n1602), .Y(n566) );
  OAI2BB2XLTS U2015 ( .B0(n1582), .B1(n1603), .A0N(final_result_ieee[2]), 
        .A1N(n1602), .Y(n565) );
  OAI2BB2XLTS U2016 ( .B0(n1612), .B1(n1603), .A0N(final_result_ieee[19]), 
        .A1N(n1602), .Y(n564) );
  OAI2BB2XLTS U2017 ( .B0(n1585), .B1(n1603), .A0N(final_result_ieee[4]), 
        .A1N(n1602), .Y(n563) );
  OAI2BB2XLTS U2018 ( .B0(n1609), .B1(n1603), .A0N(final_result_ieee[17]), 
        .A1N(n1602), .Y(n562) );
  AO22XLTS U2019 ( .A0(n1600), .A1(n1588), .B0(final_result_ieee[1]), .B1(
        n1599), .Y(n561) );
  AO22XLTS U2020 ( .A0(n1600), .A1(n1589), .B0(final_result_ieee[0]), .B1(
        n1599), .Y(n560) );
  OAI2BB2XLTS U2021 ( .B0(n1590), .B1(n1603), .A0N(final_result_ieee[6]), 
        .A1N(n1602), .Y(n559) );
  OAI2BB2XLTS U2022 ( .B0(n1606), .B1(n1603), .A0N(final_result_ieee[15]), 
        .A1N(n1599), .Y(n558) );
  OAI22X1TS U2023 ( .A0(n1595), .A1(n1597), .B0(n1630), .B1(n1596), .Y(n1614)
         );
  AO22XLTS U2024 ( .A0(n1600), .A1(n1614), .B0(final_result_ieee[20]), .B1(
        n1599), .Y(n557) );
  OAI22X1TS U2025 ( .A0(n1598), .A1(n1597), .B0(n1646), .B1(n1596), .Y(n1615)
         );
  AO22XLTS U2026 ( .A0(n1600), .A1(n1615), .B0(final_result_ieee[21]), .B1(
        n1599), .Y(n556) );
  AOI22X1TS U2027 ( .A0(Data_array_SWR[24]), .A1(n1621), .B0(n1620), .B1(n1601), .Y(n1618) );
  OAI2BB2XLTS U2028 ( .B0(n1618), .B1(n1603), .A0N(final_result_ieee[22]), 
        .A1N(n1602), .Y(n555) );
  AOI22X1TS U2029 ( .A0(n1528), .A1(n1604), .B0(n992), .B1(n1617), .Y(n554) );
  AOI22X1TS U2030 ( .A0(n1613), .A1(n1605), .B0(n993), .B1(n1617), .Y(n553) );
  AOI22X1TS U2031 ( .A0(n1616), .A1(n1606), .B0(n994), .B1(n1411), .Y(n552) );
  AOI22X1TS U2032 ( .A0(n1528), .A1(n1607), .B0(n995), .B1(n1617), .Y(n551) );
  AOI22X1TS U2033 ( .A0(n1616), .A1(n1609), .B0(n996), .B1(n1617), .Y(n550) );
  AOI22X1TS U2034 ( .A0(n1528), .A1(n1610), .B0(n1611), .B1(n997), .Y(n549) );
  AOI22X1TS U2035 ( .A0(n1616), .A1(n1612), .B0(n1411), .B1(n998), .Y(n548) );
  AO22XLTS U2036 ( .A0(n1617), .A1(DmP_mant_SFG_SWR[22]), .B0(n1528), .B1(
        n1614), .Y(n547) );
  AO22XLTS U2037 ( .A0(n1617), .A1(DmP_mant_SFG_SWR[23]), .B0(n1613), .B1(
        n1615), .Y(n546) );
  AOI22X1TS U2038 ( .A0(n1613), .A1(n1618), .B0(n1611), .B1(n1000), .Y(n545)
         );
  AOI22X1TS U2039 ( .A0(Data_array_SWR[25]), .A1(n1621), .B0(n1620), .B1(n1619), .Y(n1623) );
  AOI22X1TS U2040 ( .A0(n1616), .A1(n1623), .B0(n1611), .B1(n1001), .Y(n544)
         );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpadd_approx_syn_constraints_clk30.tcl_ACAIN16Q4_syn.sdf"); 
 endmodule

