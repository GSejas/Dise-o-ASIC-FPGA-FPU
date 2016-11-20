/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 19:16:08 2016
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
         OP_FLAG_SFG, ZERO_FLAG_SFG, inst_FSM_INPUT_ENABLE_state_next_1_, n470,
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
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         DP_OP_15J21_123_3116_n8, DP_OP_15J21_123_3116_n7,
         DP_OP_15J21_123_3116_n6, DP_OP_15J21_123_3116_n5,
         DP_OP_15J21_123_3116_n4, intadd_15_B_12_, intadd_15_B_11_,
         intadd_15_B_10_, intadd_15_B_9_, intadd_15_B_8_, intadd_15_B_7_,
         intadd_15_B_6_, intadd_15_B_5_, intadd_15_B_4_, intadd_15_B_3_,
         intadd_15_B_2_, intadd_15_B_1_, intadd_15_B_0_, intadd_15_CI,
         intadd_15_SUM_12_, intadd_15_SUM_11_, intadd_15_SUM_10_,
         intadd_15_SUM_9_, intadd_15_SUM_8_, intadd_15_SUM_7_,
         intadd_15_SUM_6_, intadd_15_SUM_5_, intadd_15_SUM_4_,
         intadd_15_SUM_3_, intadd_15_SUM_2_, intadd_15_SUM_1_,
         intadd_15_SUM_0_, intadd_15_n13, intadd_15_n12, intadd_15_n11,
         intadd_15_n10, intadd_15_n9, intadd_15_n8, intadd_15_n7, intadd_15_n6,
         intadd_15_n5, intadd_15_n4, intadd_15_n3, intadd_15_n2, intadd_15_n1,
         intadd_16_A_2_, intadd_16_A_1_, intadd_16_B_2_, intadd_16_B_0_,
         intadd_16_CI, intadd_16_SUM_2_, intadd_16_SUM_1_, intadd_16_SUM_0_,
         intadd_16_n3, intadd_16_n2, intadd_16_n1, intadd_17_A_2_,
         intadd_17_A_1_, intadd_17_B_2_, intadd_17_B_0_, intadd_17_CI,
         intadd_17_SUM_2_, intadd_17_SUM_1_, intadd_17_SUM_0_, intadd_17_n3,
         intadd_17_n2, intadd_17_n1, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n958, n959, n960, n961, n962, n963,
         n964, n965, n966, n967, n968, n969, n970, n971, n972, n973, n974,
         n975, n976, n977, n978, n979, n980, n981, n982, n983, n984, n985,
         n986, n987, n988, n989, n990, n991, n992, n993, n994, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046,
         n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206,
         n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216,
         n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226,
         n1227, n1228, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237,
         n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247,
         n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257,
         n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267,
         n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277,
         n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287,
         n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297,
         n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307,
         n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317,
         n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327,
         n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1338,
         n1339, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349,
         n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359,
         n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369,
         n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1379, n1380,
         n1381, n1382, n1383, n1384, n1385, n1386, n1388, n1389, n1390, n1391,
         n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401,
         n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411,
         n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421,
         n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431,
         n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441,
         n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451,
         n1452, n1453, n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461,
         n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471,
         n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481,
         n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491,
         n1492, n1493, n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501,
         n1502, n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511,
         n1512, n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521,
         n1522, n1523, n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531,
         n1532, n1533, n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541,
         n1542, n1543, n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551,
         n1552, n1553, n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561,
         n1562, n1563, n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571,
         n1572, n1573, n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1582,
         n1583, n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592,
         n1593, n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602,
         n1603, n1604, n1605, n1606, n1607, n1608, n1610, n1611, n1612;
  wire   [1:0] Shift_reg_FLAGS_7;
  wire   [31:1] intDX_EWSW;
  wire   [31:0] intDY_EWSW;
  wire   [30:0] DMP_EXP_EWSW;
  wire   [27:0] DmP_EXP_EWSW;
  wire   [30:0] DMP_SHT1_EWSW;
  wire   [21:0] DmP_mant_SHT1_SW;
  wire   [4:0] Shift_amount_SHT1_EWR;
  wire   [25:0] Raw_mant_NRM_SWR;
  wire   [23:0] Data_array_SWR;
  wire   [30:0] DMP_SHT2_EWSW;
  wire   [4:2] shift_value_SHT2_EWR;
  wire   [7:0] DMP_exp_NRM2_EW;
  wire   [7:0] DMP_exp_NRM_EW;
  wire   [4:0] LZD_output_NRM2_EW;
  wire   [4:1] exp_rslt_NRM2_EW1;
  wire   [30:0] DMP_SFG;
  wire   [25:0] DmP_mant_SFG_SWR;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(n873), .CK(clk), .RN(n1587), .QN(
        n895) );
  DFFRXLTS inst_ShiftRegister_Q_reg_1_ ( .D(n871), .CK(clk), .RN(n1582), .Q(
        Shift_reg_FLAGS_7[1]) );
  DFFRXLTS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(n869), .CK(clk), .RN(n1597), 
        .QN(n882) );
  DFFRXLTS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(n867), .CK(clk), .RN(n938), .QN(
        n885) );
  DFFRXLTS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(n859), .CK(clk), .RN(n1587), 
        .QN(n886) );
  DFFRXLTS INPUT_STAGE_FLAGS_Q_reg_0_ ( .D(n837), .CK(clk), .RN(n1582), .Q(
        intAS) );
  DFFRXLTS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n836), .CK(clk), .RN(n1585), .Q(
        left_right_SHT2) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n1591), 
        .Q(ready) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(n796), .CK(clk), .RN(n1583), .QN(
        n889) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(n789), .CK(clk), .RN(n1601), .QN(
        n890) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(n780), .CK(clk), .RN(n1590), .Q(
        Data_array_SWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(n772), .CK(clk), .RN(n1590), 
        .Q(Shift_amount_SHT1_EWR[1]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(n771), .CK(clk), .RN(n1601), 
        .Q(Shift_amount_SHT1_EWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(n770), .CK(clk), .RN(n1584), 
        .Q(Shift_amount_SHT1_EWR[3]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(n769), .CK(clk), .RN(n1586), 
        .Q(Shift_amount_SHT1_EWR[4]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(n768), .CK(clk), .RN(n937), .Q(
        final_result_ieee[23]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(n767), .CK(clk), .RN(n1582), .Q(
        final_result_ieee[24]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(n766), .CK(clk), .RN(n1591), .Q(
        final_result_ieee[25]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(n765), .CK(clk), .RN(n1592), .Q(
        final_result_ieee[26]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(n764), .CK(clk), .RN(n1596), .Q(
        final_result_ieee[27]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(n763), .CK(clk), .RN(n1589), .Q(
        final_result_ieee[28]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(n762), .CK(clk), .RN(n1588), .Q(
        final_result_ieee[29]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(n761), .CK(clk), .RN(n1605), .Q(
        final_result_ieee[30]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(n760), .CK(clk), .RN(n1590), .Q(
        DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(n759), .CK(clk), .RN(n1603), .Q(
        DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(n758), .CK(clk), .RN(n1606), .Q(
        DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(n757), .CK(clk), .RN(n1601), .Q(
        DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(n756), .CK(clk), .RN(n1586), .Q(
        DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(n755), .CK(clk), .RN(n1584), .Q(
        DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(n754), .CK(clk), .RN(n1590), .Q(
        DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(n753), .CK(clk), .RN(n1587), .Q(
        DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(n752), .CK(clk), .RN(n1593), .Q(
        DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(n751), .CK(clk), .RN(n1582), .Q(
        DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(n750), .CK(clk), .RN(n1585), .Q(
        DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(n749), .CK(clk), .RN(n1604), .Q(
        DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(n748), .CK(clk), .RN(n1583), .Q(
        DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(n747), .CK(clk), .RN(n938), .Q(
        DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(n746), .CK(clk), .RN(n1587), .Q(
        DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(n745), .CK(clk), .RN(n1582), .Q(
        DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(n744), .CK(clk), .RN(n1585), .Q(
        DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(n743), .CK(clk), .RN(n1586), .Q(
        DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(n742), .CK(clk), .RN(n1583), .Q(
        DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(n741), .CK(clk), .RN(n938), .Q(
        DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(n740), .CK(clk), .RN(n1587), .Q(
        DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(n739), .CK(clk), .RN(n1605), .Q(
        DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(n738), .CK(clk), .RN(n1592), .Q(
        DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_27_ ( .D(n733), .CK(clk), .RN(n1592), .QN(n896)
         );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(n732), .CK(clk), .RN(n1596), .Q(
        DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(n731), .CK(clk), .RN(n1589), .Q(
        DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(n730), .CK(clk), .RN(n1591), .Q(
        DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(n729), .CK(clk), .RN(n1587), .Q(
        OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_0_ ( .D(n728), .CK(clk), .RN(n1589), .Q(
        ZERO_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(n727), .CK(clk), .RN(n1605), .Q(
        SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(n726), .CK(clk), .RN(n1588), .Q(
        DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(n725), .CK(clk), .RN(n1592), .Q(
        DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(n723), .CK(clk), .RN(n1596), .Q(
        DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(n722), .CK(clk), .RN(n1592), .Q(
        DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(n720), .CK(clk), .RN(n1591), .Q(
        DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(n719), .CK(clk), .RN(n1587), .Q(
        DMP_SHT2_EWSW[2]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_2_ ( .D(n718), .CK(clk), .RN(n1605), .Q(
        DMP_SFG[2]), .QN(n1566) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(n717), .CK(clk), .RN(n1588), .Q(
        DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(n716), .CK(clk), .RN(n1589), .Q(
        DMP_SHT2_EWSW[3]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_3_ ( .D(n715), .CK(clk), .RN(n1593), .Q(
        DMP_SFG[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(n714), .CK(clk), .RN(n1590), .Q(
        DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(n713), .CK(clk), .RN(n937), .Q(
        DMP_SHT2_EWSW[4]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_4_ ( .D(n712), .CK(clk), .RN(n1601), .Q(
        DMP_SFG[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(n711), .CK(clk), .RN(n1606), .Q(
        DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(n710), .CK(clk), .RN(n938), .Q(
        DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(n708), .CK(clk), .RN(n937), .Q(
        DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(n707), .CK(clk), .RN(n1590), .Q(
        DMP_SHT2_EWSW[6]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_6_ ( .D(n706), .CK(clk), .RN(n1594), .Q(
        DMP_SFG[6]), .QN(n1567) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(n705), .CK(clk), .RN(n1593), .Q(
        DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(n704), .CK(clk), .RN(n1601), .Q(
        DMP_SHT2_EWSW[7]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_7_ ( .D(n703), .CK(clk), .RN(n1594), .Q(
        DMP_SFG[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(n702), .CK(clk), .RN(n1593), .Q(
        DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(n701), .CK(clk), .RN(n937), .Q(
        DMP_SHT2_EWSW[8]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_8_ ( .D(n700), .CK(clk), .RN(n1601), .Q(
        DMP_SFG[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(n699), .CK(clk), .RN(n1606), .Q(
        DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(n698), .CK(clk), .RN(n938), .Q(
        DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(n696), .CK(clk), .RN(n937), .Q(
        DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(n695), .CK(clk), .RN(n1590), .Q(
        DMP_SHT2_EWSW[10]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_10_ ( .D(n694), .CK(clk), .RN(n1594), .Q(
        DMP_SFG[10]), .QN(n1521) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(n693), .CK(clk), .RN(n1593), .Q(
        DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(n692), .CK(clk), .RN(n938), .Q(
        DMP_SHT2_EWSW[11]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_11_ ( .D(n691), .CK(clk), .RN(n1592), .Q(
        DMP_SFG[11]), .QN(n1520) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(n690), .CK(clk), .RN(n1596), .Q(
        DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(n689), .CK(clk), .RN(n1589), .Q(
        DMP_SHT2_EWSW[12]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_12_ ( .D(n688), .CK(clk), .RN(n1591), .Q(
        DMP_SFG[12]), .QN(n1526) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(n687), .CK(clk), .RN(n1596), .Q(
        DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(n686), .CK(clk), .RN(n1605), .Q(
        DMP_SHT2_EWSW[13]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_13_ ( .D(n685), .CK(clk), .RN(n1588), .Q(
        DMP_SFG[13]), .QN(n1525) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(n684), .CK(clk), .RN(n1589), .Q(
        DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(n683), .CK(clk), .RN(n1596), .Q(
        DMP_SHT2_EWSW[14]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_14_ ( .D(n682), .CK(clk), .RN(n1592), .Q(
        DMP_SFG[14]), .QN(n1532) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(n681), .CK(clk), .RN(n1591), .Q(
        DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(n680), .CK(clk), .RN(n1600), .Q(
        DMP_SHT2_EWSW[15]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_15_ ( .D(n679), .CK(clk), .RN(n1605), .Q(
        DMP_SFG[15]), .QN(n1549) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(n678), .CK(clk), .RN(n1588), .Q(
        DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(n677), .CK(clk), .RN(n1592), .Q(
        DMP_SHT2_EWSW[16]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_16_ ( .D(n676), .CK(clk), .RN(n1596), .Q(
        DMP_SFG[16]), .QN(n1548) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(n675), .CK(clk), .RN(n1592), .Q(
        DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(n674), .CK(clk), .RN(n1591), .Q(
        DMP_SHT2_EWSW[17]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_17_ ( .D(n673), .CK(clk), .RN(n1603), .Q(
        DMP_SFG[17]), .QN(n1561) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(n672), .CK(clk), .RN(n1605), .Q(
        DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(n671), .CK(clk), .RN(n1588), .Q(
        DMP_SHT2_EWSW[18]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_18_ ( .D(n670), .CK(clk), .RN(n1589), .Q(
        DMP_SFG[18]), .QN(n1560) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(n669), .CK(clk), .RN(n1596), .Q(
        DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(n668), .CK(clk), .RN(n1589), .Q(
        DMP_SHT2_EWSW[19]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_19_ ( .D(n667), .CK(clk), .RN(n1601), .Q(
        DMP_SFG[19]), .QN(n1569) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(n666), .CK(clk), .RN(n938), .Q(
        DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(n665), .CK(clk), .RN(n1606), .Q(
        DMP_SHT2_EWSW[20]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_20_ ( .D(n664), .CK(clk), .RN(n937), .Q(
        DMP_SFG[20]), .QN(n1568) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(n663), .CK(clk), .RN(n1590), .Q(
        DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(n662), .CK(clk), .RN(n1594), .Q(
        DMP_SHT2_EWSW[21]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_21_ ( .D(n661), .CK(clk), .RN(n1593), .Q(
        DMP_SFG[21]), .QN(n1579) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(n660), .CK(clk), .RN(n937), .Q(
        DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(n659), .CK(clk), .RN(n938), .Q(
        DMP_SHT2_EWSW[22]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_22_ ( .D(n658), .CK(clk), .RN(n1601), .Q(
        DMP_SFG[22]), .QN(n1578) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(n657), .CK(clk), .RN(n1606), .Q(
        DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(n656), .CK(clk), .RN(n1593), .Q(
        DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(n655), .CK(clk), .RN(n938), .Q(
        DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(n654), .CK(clk), .RN(n1601), .Q(
        DMP_exp_NRM_EW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(n652), .CK(clk), .RN(n937), .Q(
        DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(n651), .CK(clk), .RN(n1590), .Q(
        DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(n650), .CK(clk), .RN(n1594), .Q(
        DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(n649), .CK(clk), .RN(n1593), .Q(
        DMP_exp_NRM_EW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(n647), .CK(clk), .RN(n938), .Q(
        DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(n646), .CK(clk), .RN(n1601), .Q(
        DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(n645), .CK(clk), .RN(n1606), .Q(
        DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(n644), .CK(clk), .RN(n938), .Q(
        DMP_exp_NRM_EW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(n642), .CK(clk), .RN(n937), .Q(
        DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(n641), .CK(clk), .RN(n1590), .Q(
        DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(n640), .CK(clk), .RN(n1604), .Q(
        DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(n639), .CK(clk), .RN(n1604), .Q(
        DMP_exp_NRM_EW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(n637), .CK(clk), .RN(n1595), .Q(
        DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(n636), .CK(clk), .RN(n1595), .Q(
        DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(n635), .CK(clk), .RN(n1595), .Q(
        DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(n634), .CK(clk), .RN(n1595), .Q(
        DMP_exp_NRM_EW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(n632), .CK(clk), .RN(n1595), .Q(
        DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(n631), .CK(clk), .RN(n1595), .Q(
        DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(n630), .CK(clk), .RN(n1595), .Q(
        DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(n629), .CK(clk), .RN(n1595), .Q(
        DMP_exp_NRM_EW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(n627), .CK(clk), .RN(n1595), .Q(
        DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(n626), .CK(clk), .RN(n1595), .Q(
        DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(n625), .CK(clk), .RN(n1591), .Q(
        DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(n624), .CK(clk), .RN(n1599), .Q(
        DMP_exp_NRM_EW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(n622), .CK(clk), .RN(n1605), .Q(
        DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(n621), .CK(clk), .RN(n1588), .Q(
        DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(n620), .CK(clk), .RN(n1592), .Q(
        DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(n619), .CK(clk), .RN(n1596), .Q(
        DMP_exp_NRM_EW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(n617), .CK(clk), .RN(n1589), .Q(
        DmP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(n615), .CK(clk), .RN(n1591), .Q(
        DmP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(n613), .CK(clk), .RN(n1589), .Q(
        DmP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(n611), .CK(clk), .RN(n1597), .Q(
        DmP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(n609), .CK(clk), .RN(n1597), .Q(
        DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(n608), .CK(clk), .RN(n1597), .QN(
        n898) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(n607), .CK(clk), .RN(n1597), .Q(
        DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(n606), .CK(clk), .RN(n1597), .QN(
        n897) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(n605), .CK(clk), .RN(n1597), .Q(
        DmP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(n603), .CK(clk), .RN(n1597), .Q(
        DmP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(n601), .CK(clk), .RN(n1597), .Q(
        DmP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(n599), .CK(clk), .RN(n1598), .Q(
        DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(n598), .CK(clk), .RN(n1598), .QN(
        n893) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(n597), .CK(clk), .RN(n1598), .Q(
        DmP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(n595), .CK(clk), .RN(n1598), .Q(
        DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(n594), .CK(clk), .RN(n1598), 
        .QN(n894) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(n593), .CK(clk), .RN(n1598), .Q(
        DmP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(n591), .CK(clk), .RN(n1598), .Q(
        DmP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(n589), .CK(clk), .RN(n1598), .Q(
        DmP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(n587), .CK(clk), .RN(n1599), .Q(
        DmP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(n585), .CK(clk), .RN(n1599), .Q(
        DmP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(n583), .CK(clk), .RN(n1599), .Q(
        DmP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(n581), .CK(clk), .RN(n1599), .Q(
        DmP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(n579), .CK(clk), .RN(n1599), .Q(
        DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(n578), .CK(clk), .RN(n1599), 
        .QN(n892) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(n577), .CK(clk), .RN(n1599), .Q(
        DmP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(n575), .CK(clk), .RN(n1600), .Q(
        DmP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(n573), .CK(clk), .RN(n1600), .Q(
        DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(n572), .CK(clk), .RN(n1600), 
        .QN(n891) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n566), .CK(clk), .RN(n1600), .Q(
        underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n565), .CK(clk), .RN(n1591), .Q(
        overflow_flag) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_0_ ( .D(n564), .CK(clk), .RN(n1600), .Q(
        ZERO_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_0_ ( .D(n563), .CK(clk), .RN(n1600), .Q(
        ZERO_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_0_ ( .D(n562), .CK(clk), .RN(n1585), .Q(
        ZERO_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_0_ ( .D(n561), .CK(clk), .RN(n1582), .Q(
        ZERO_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(n560), .CK(clk), .RN(n1600), .Q(
        ZERO_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(n559), .CK(clk), .RN(n1599), .Q(
        zero_flag) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(n558), .CK(clk), .RN(n1600), .Q(
        OP_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(n557), .CK(clk), .RN(n1599), .Q(
        OP_FLAG_SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(n555), .CK(clk), .RN(n1596), .Q(
        SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(n554), .CK(clk), .RN(n1602), .Q(
        SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(n553), .CK(clk), .RN(n1598), .Q(
        SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(n552), .CK(clk), .RN(n1597), .Q(
        SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n551), .CK(clk), .RN(n1591), .Q(
        SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(n550), .CK(clk), .RN(n1585), .Q(
        final_result_ieee[31]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(n525), .CK(clk), .RN(n1606), .Q(
        LZD_output_NRM2_EW[1]), .QN(n1522) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(n524), .CK(clk), .RN(n1590), .Q(
        LZD_output_NRM2_EW[4]), .QN(n1533) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(n523), .CK(clk), .RN(n1602), .Q(
        DmP_mant_SFG_SWR[1]), .QN(n928) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(n521), .CK(clk), .RN(n1601), .Q(
        LZD_output_NRM2_EW[0]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(n520), .CK(clk), .RN(n938), .Q(
        LZD_output_NRM2_EW[2]), .QN(n1528) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(n517), .CK(clk), .RN(n937), .Q(
        LZD_output_NRM2_EW[3]), .QN(n1527) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(n516), .CK(clk), .RN(n1602), .Q(
        DmP_mant_SFG_SWR[0]), .QN(n929) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(n514), .CK(clk), .RN(n1602), .Q(
        final_result_ieee[10]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(n513), .CK(clk), .RN(n1602), .Q(
        final_result_ieee[11]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(n512), .CK(clk), .RN(n1602), .Q(
        final_result_ieee[9]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(n511), .CK(clk), .RN(n1602), .Q(
        final_result_ieee[12]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(n510), .CK(clk), .RN(n1602), .Q(
        final_result_ieee[8]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(n509), .CK(clk), .RN(n1602), .Q(
        final_result_ieee[13]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(n508), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[7]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(n507), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[14]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(n506), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[5]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(n505), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[16]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(n504), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[4]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(n503), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[17]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(n502), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[3]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(n501), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[18]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(n500), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[2]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(n499), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[19]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(n498), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[1]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(n497), .CK(clk), .RN(n1603), .Q(
        final_result_ieee[0]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(n496), .CK(clk), .RN(n1604), .Q(
        final_result_ieee[6]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(n495), .CK(clk), .RN(n1605), .Q(
        final_result_ieee[15]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(n494), .CK(clk), .RN(n1604), .Q(
        final_result_ieee[20]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(n493), .CK(clk), .RN(n1587), .Q(
        final_result_ieee[21]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(n492), .CK(clk), .RN(n1604), .Q(
        final_result_ieee[22]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(n491), .CK(clk), .RN(n1583), .Q(
        DmP_mant_SFG_SWR[4]), .QN(n930) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(n489), .CK(clk), .RN(n1604), .Q(
        DmP_mant_SFG_SWR[6]), .QN(n934) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(n479), .CK(clk), .RN(n1592), .Q(
        DmP_mant_SFG_SWR[16]), .QN(n918) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(n478), .CK(clk), .RN(n1591), .Q(
        DmP_mant_SFG_SWR[17]), .QN(n919) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(n477), .CK(clk), .RN(n1585), .Q(
        DmP_mant_SFG_SWR[18]), .QN(n920) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(n476), .CK(clk), .RN(n1588), .Q(
        DmP_mant_SFG_SWR[19]), .QN(n921) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(n475), .CK(clk), .RN(n1605), .Q(
        DmP_mant_SFG_SWR[20]), .QN(n922) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(n474), .CK(clk), .RN(n1592), .Q(
        DmP_mant_SFG_SWR[21]), .QN(n923) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(n473), .CK(clk), .RN(n1605), .Q(
        DmP_mant_SFG_SWR[22]), .QN(n924) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(n471), .CK(clk), .RN(n1596), .Q(
        DmP_mant_SFG_SWR[24]), .QN(n926) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(n470), .CK(clk), .RN(n1589), .Q(
        DmP_mant_SFG_SWR[25]), .QN(n927) );
  CMPR32X2TS intadd_15_U14 ( .A(n1521), .B(intadd_15_B_0_), .C(intadd_15_CI), 
        .CO(intadd_15_n13), .S(intadd_15_SUM_0_) );
  CMPR32X2TS intadd_15_U13 ( .A(n1520), .B(intadd_15_B_1_), .C(intadd_15_n13), 
        .CO(intadd_15_n12), .S(intadd_15_SUM_1_) );
  CMPR32X2TS intadd_15_U12 ( .A(n1526), .B(intadd_15_B_2_), .C(intadd_15_n12), 
        .CO(intadd_15_n11), .S(intadd_15_SUM_2_) );
  CMPR32X2TS intadd_15_U11 ( .A(n1525), .B(intadd_15_B_3_), .C(intadd_15_n11), 
        .CO(intadd_15_n10), .S(intadd_15_SUM_3_) );
  CMPR32X2TS intadd_15_U10 ( .A(n1532), .B(intadd_15_B_4_), .C(intadd_15_n10), 
        .CO(intadd_15_n9), .S(intadd_15_SUM_4_) );
  CMPR32X2TS intadd_15_U9 ( .A(n1549), .B(intadd_15_B_5_), .C(intadd_15_n9), 
        .CO(intadd_15_n8), .S(intadd_15_SUM_5_) );
  CMPR32X2TS intadd_15_U8 ( .A(n1548), .B(intadd_15_B_6_), .C(intadd_15_n8), 
        .CO(intadd_15_n7), .S(intadd_15_SUM_6_) );
  CMPR32X2TS intadd_15_U7 ( .A(n1561), .B(intadd_15_B_7_), .C(intadd_15_n7), 
        .CO(intadd_15_n6), .S(intadd_15_SUM_7_) );
  CMPR32X2TS intadd_15_U6 ( .A(n1560), .B(intadd_15_B_8_), .C(intadd_15_n6), 
        .CO(intadd_15_n5), .S(intadd_15_SUM_8_) );
  CMPR32X2TS intadd_15_U5 ( .A(n1569), .B(intadd_15_B_9_), .C(intadd_15_n5), 
        .CO(intadd_15_n4), .S(intadd_15_SUM_9_) );
  CMPR32X2TS intadd_15_U4 ( .A(n1568), .B(intadd_15_B_10_), .C(intadd_15_n4), 
        .CO(intadd_15_n3), .S(intadd_15_SUM_10_) );
  CMPR32X2TS intadd_15_U3 ( .A(n1579), .B(intadd_15_B_11_), .C(intadd_15_n3), 
        .CO(intadd_15_n2), .S(intadd_15_SUM_11_) );
  CMPR32X2TS intadd_15_U2 ( .A(n1578), .B(intadd_15_B_12_), .C(intadd_15_n2), 
        .CO(intadd_15_n1), .S(intadd_15_SUM_12_) );
  CMPR32X2TS intadd_16_U4 ( .A(n1567), .B(intadd_16_B_0_), .C(intadd_16_CI), 
        .CO(intadd_16_n3), .S(intadd_16_SUM_0_) );
  CMPR32X2TS intadd_16_U3 ( .A(intadd_16_A_1_), .B(n901), .C(intadd_16_n3), 
        .CO(intadd_16_n2), .S(intadd_16_SUM_1_) );
  CMPR32X2TS intadd_16_U2 ( .A(intadd_16_A_2_), .B(intadd_16_B_2_), .C(
        intadd_16_n2), .CO(intadd_16_n1), .S(intadd_16_SUM_2_) );
  CMPR32X2TS intadd_17_U4 ( .A(n1566), .B(intadd_17_B_0_), .C(intadd_17_CI), 
        .CO(intadd_17_n3), .S(intadd_17_SUM_0_) );
  CMPR32X2TS intadd_17_U3 ( .A(intadd_17_A_1_), .B(n900), .C(intadd_17_n3), 
        .CO(intadd_17_n2), .S(intadd_17_SUM_1_) );
  CMPR32X2TS intadd_17_U2 ( .A(intadd_17_A_2_), .B(n916), .C(intadd_17_n2), 
        .CO(intadd_17_n1), .S(intadd_17_SUM_2_) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(n788), .CK(clk), .RN(n1606), .Q(
        Data_array_SWR[10]), .QN(n1576) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_25_ ( .D(n569), .CK(clk), .RN(n1600), .Q(
        DmP_EXP_EWSW[25]), .QN(n1575) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_26_ ( .D(n734), .CK(clk), .RN(n1592), .Q(
        DMP_EXP_EWSW[26]), .QN(n1574) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_26_ ( .D(n568), .CK(clk), .RN(n1600), .Q(
        DmP_EXP_EWSW[26]), .QN(n1570) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_25_ ( .D(n735), .CK(clk), .RN(n1605), .Q(
        DMP_EXP_EWSW[25]), .QN(n1565) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(n522), .CK(clk), .RN(n1602), .Q(
        Raw_mant_NRM_SWR[1]), .QN(n1564) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(n547), .CK(clk), .RN(n938), .Q(
        Raw_mant_NRM_SWR[6]), .QN(n1563) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(n801), .CK(clk), .RN(n1586), .Q(
        Data_array_SWR[21]), .QN(n1562) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(n618), .CK(clk), .RN(n1594), .Q(
        DMP_exp_NRM2_EW[7]), .QN(n1559) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(n835), .CK(clk), .RN(n1582), .Q(
        intDY_EWSW[0]), .QN(n1551) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(n623), .CK(clk), .RN(n937), .Q(
        DMP_exp_NRM2_EW[6]), .QN(n1547) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(n808), .CK(clk), .RN(n1587), 
        .Q(intDY_EWSW[27]), .QN(n1546) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(n807), .CK(clk), .RN(n1583), 
        .Q(intDY_EWSW[28]), .QN(n1544) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(n828), .CK(clk), .RN(n1586), .Q(
        intDY_EWSW[7]), .QN(n1543) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(n831), .CK(clk), .RN(n1590), .Q(
        intDY_EWSW[4]), .QN(n1539) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(n833), .CK(clk), .RN(n1585), .Q(
        intDY_EWSW[2]), .QN(n1538) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(n826), .CK(clk), .RN(n1606), .Q(
        intDY_EWSW[9]), .QN(n1535) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(n829), .CK(clk), .RN(n1584), .Q(
        intDY_EWSW[6]), .QN(n1534) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(n628), .CK(clk), .RN(n1590), .Q(
        DMP_exp_NRM2_EW[5]), .QN(n1531) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n877), .CK(clk), .RN(
        n1583), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n1530) );
  DFFRX1TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(n776), .CK(clk), .RN(n1584), .Q(
        shift_value_SHT2_EWR[3]), .QN(n1529) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(n841), .CK(clk), .RN(n1592), 
        .Q(intDX_EWSW[28]), .QN(n1524) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(n545), .CK(clk), .RN(n1601), .Q(
        Raw_mant_NRM_SWR[8]), .QN(n1519) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(n548), .CK(clk), .RN(n1606), .Q(
        Raw_mant_NRM_SWR[5]), .QN(n1517) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(n518), .CK(clk), .RN(n1602), .Q(
        Raw_mant_NRM_SWR[2]), .QN(n1516) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(n653), .CK(clk), .RN(n1594), .Q(
        DMP_exp_NRM2_EW[0]), .QN(n1514) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(n546), .CK(clk), .RN(n1594), .Q(
        Raw_mant_NRM_SWR[7]), .QN(n1512) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(n528), .CK(clk), .RN(n1595), .Q(
        Raw_mant_NRM_SWR[25]), .QN(n1511) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(n843), .CK(clk), .RN(n1583), 
        .Q(intDX_EWSW[26]), .QN(n1510) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_24_ ( .D(n736), .CK(clk), .RN(n1588), .Q(
        DMP_EXP_EWSW[24]), .QN(n1507) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_24_ ( .D(n570), .CK(clk), .RN(n1600), .Q(
        DmP_EXP_EWSW[24]), .QN(n1506) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(n816), .CK(clk), .RN(n1584), 
        .Q(intDY_EWSW[19]), .QN(n1504) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(n819), .CK(clk), .RN(n1601), 
        .Q(intDY_EWSW[16]), .QN(n1502) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(n830), .CK(clk), .RN(n1601), .Q(
        intDY_EWSW[5]), .QN(n1501) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(n536), .CK(clk), .RN(n1593), .Q(
        Raw_mant_NRM_SWR[17]), .QN(n1498) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(n515), .CK(clk), .RN(n1602), .Q(
        Raw_mant_NRM_SWR[0]), .QN(n1497) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(n532), .CK(clk), .RN(n1599), .Q(
        Raw_mant_NRM_SWR[21]), .QN(n1495) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(n531), .CK(clk), .RN(n1588), .Q(
        Raw_mant_NRM_SWR[22]), .QN(n1493) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(n540), .CK(clk), .RN(n937), .Q(
        Raw_mant_NRM_SWR[13]), .QN(n1491) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(n811), .CK(clk), .RN(n1586), 
        .Q(intDY_EWSW[24]), .QN(n1490) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(n529), .CK(clk), .RN(n1598), .Q(
        Raw_mant_NRM_SWR[24]), .QN(n1489) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(n544), .CK(clk), .RN(n1590), .Q(
        Raw_mant_NRM_SWR[9]), .QN(n1488) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(n539), .CK(clk), .RN(n1601), .Q(
        Raw_mant_NRM_SWR[14]), .QN(n1487) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(n543), .CK(clk), .RN(n1593), .Q(
        Raw_mant_NRM_SWR[10]), .QN(n1486) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(n530), .CK(clk), .RN(n1593), .Q(
        Raw_mant_NRM_SWR[23]), .QN(n1484) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(
        inst_FSM_INPUT_ENABLE_state_next_1_), .CK(clk), .RN(n1585), .Q(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n1500) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(n526), .CK(clk), .RN(n1603), .Q(
        Raw_mant_NRM_SWR[3]), .QN(n1558) );
  DFFRX2TS inst_ShiftRegister_Q_reg_5_ ( .D(n875), .CK(clk), .RN(n1582), .Q(
        n1492), .QN(n1577) );
  DFFRX2TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(n556), .CK(clk), .RN(n1596), .Q(
        OP_FLAG_SFG), .QN(n1607) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(n542), .CK(clk), .RN(n1601), .Q(
        Raw_mant_NRM_SWR[11]), .QN(n1485) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(n537), .CK(clk), .RN(n1582), .Q(
        Raw_mant_NRM_SWR[16]), .QN(n1508) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(n774), .CK(clk), .RN(n1582), .Q(
        shift_value_SHT2_EWR[4]), .QN(n1515) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(n853), .CK(clk), .RN(n938), .Q(
        intDX_EWSW[16]), .QN(n1523) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(n862), .CK(clk), .RN(n1583), .Q(
        intDX_EWSW[7]), .QN(n1496) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(n863), .CK(clk), .RN(n1582), .Q(
        intDX_EWSW[6]), .QN(n1518) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(n864), .CK(clk), .RN(n1585), .Q(
        intDX_EWSW[5]), .QN(n1513) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(n865), .CK(clk), .RN(n1598), .Q(
        intDX_EWSW[4]), .QN(n1494) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(n818), .CK(clk), .RN(n1604), 
        .Q(intDY_EWSW[17]), .QN(n1552) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(n817), .CK(clk), .RN(n1590), 
        .Q(intDY_EWSW[18]), .QN(n1557) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(n812), .CK(clk), .RN(n1601), 
        .Q(intDY_EWSW[23]), .QN(n1545) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(n813), .CK(clk), .RN(n1586), 
        .Q(intDY_EWSW[22]), .QN(n1503) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(n821), .CK(clk), .RN(n1588), 
        .Q(intDY_EWSW[14]), .QN(n1541) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(n822), .CK(clk), .RN(n1590), 
        .Q(intDY_EWSW[13]), .QN(n1536) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(n827), .CK(clk), .RN(n1601), .Q(
        intDY_EWSW[8]), .QN(n1554) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(n805), .CK(clk), .RN(n1591), 
        .Q(intDY_EWSW[30]), .QN(n1556) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(n806), .CK(clk), .RN(n1587), 
        .Q(intDY_EWSW[29]), .QN(n1505) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(n809), .CK(clk), .RN(n1584), 
        .Q(intDY_EWSW[26]), .QN(n1555) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(n810), .CK(clk), .RN(n1605), 
        .Q(intDY_EWSW[25]), .QN(n1550) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(n823), .CK(clk), .RN(n1584), 
        .Q(intDY_EWSW[12]), .QN(n1540) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(n834), .CK(clk), .RN(n1582), .Q(
        intDY_EWSW[1]), .QN(n1553) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(n844), .CK(clk), .RN(n1587), 
        .Q(intDX_EWSW[25]), .QN(n1509) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(n845), .CK(clk), .RN(n1583), 
        .Q(intDX_EWSW[24]), .QN(n1573) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(n792), .CK(clk), .RN(n1583), .Q(
        Data_array_SWR[13]), .QN(n1572) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(n790), .CK(clk), .RN(n1601), .Q(
        Data_array_SWR[11]), .QN(n1571) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(n846), .CK(clk), .RN(n1582), 
        .Q(intDX_EWSW[23]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(n856), .CK(clk), .RN(n1583), 
        .Q(intDX_EWSW[13]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(n866), .CK(clk), .RN(n1587), .Q(
        intDX_EWSW[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(n854), .CK(clk), .RN(n1600), 
        .Q(intDX_EWSW[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(n848), .CK(clk), .RN(n1585), 
        .Q(intDX_EWSW[21]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(n803), .CK(clk), .RN(n1590), .Q(
        Data_array_SWR[23]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(n802), .CK(clk), .RN(n1601), .Q(
        Data_array_SWR[22]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(n533), .CK(clk), .RN(n1597), .Q(
        Raw_mant_NRM_SWR[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(n852), .CK(clk), .RN(n1583), 
        .Q(intDX_EWSW[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(n800), .CK(clk), .RN(n1586), .Q(
        Data_array_SWR[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(n861), .CK(clk), .RN(n1583), .Q(
        intDX_EWSW[8]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(n858), .CK(clk), .RN(n1582), 
        .Q(intDX_EWSW[11]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(n868), .CK(clk), .RN(n1602), .Q(
        intDX_EWSW[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(n860), .CK(clk), .RN(n1585), .Q(
        intDX_EWSW[9]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(n793), .CK(clk), .RN(n1585), .Q(
        Data_array_SWR[14]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(n791), .CK(clk), .RN(n1586), .Q(
        Data_array_SWR[12]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(n541), .CK(clk), .RN(n938), .Q(
        Raw_mant_NRM_SWR[12]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(n534), .CK(clk), .RN(n1589), .Q(
        Raw_mant_NRM_SWR[19]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(n851), .CK(clk), .RN(n1587), 
        .Q(intDX_EWSW[18]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(n840), .CK(clk), .RN(n1585), 
        .Q(intDX_EWSW[29]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(n538), .CK(clk), .RN(n1606), .Q(
        Raw_mant_NRM_SWR[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(n842), .CK(clk), .RN(n1589), 
        .Q(intDX_EWSW[27]) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n878), .CK(clk), .RN(
        n938), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(n797), .CK(clk), .RN(n938), .Q(
        Data_array_SWR[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(n786), .CK(clk), .RN(n1584), .Q(
        Data_array_SWR[8]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(n549), .CK(clk), .RN(n937), .Q(
        Raw_mant_NRM_SWR[4]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(n535), .CK(clk), .RN(n1591), .Q(
        Raw_mant_NRM_SWR[18]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(n782), .CK(clk), .RN(n1604), .Q(
        Data_array_SWR[4]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(n783), .CK(clk), .RN(n1597), .Q(
        Data_array_SWR[5]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(n785), .CK(clk), .RN(n1590), .Q(
        Data_array_SWR[7]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(n697), .CK(clk), .RN(n1590), .Q(
        DMP_SFG[9]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(n709), .CK(clk), .RN(n1590), .Q(
        DMP_SFG[5]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(n784), .CK(clk), .RN(n1601), .Q(
        Data_array_SWR[6]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_1_ ( .D(n721), .CK(clk), .RN(n1592), .Q(
        DMP_SFG[1]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(n838), .CK(clk), .RN(n938), .Q(
        intDX_EWSW[31]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(n582), .CK(clk), .RN(n1599), .Q(
        DmP_mant_SHT1_SW[17]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(n576), .CK(clk), .RN(n1599), .Q(
        DmP_mant_SHT1_SW[20]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(n584), .CK(clk), .RN(n1599), .Q(
        DmP_mant_SHT1_SW[16]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(n602), .CK(clk), .RN(n1597), .Q(
        DmP_mant_SHT1_SW[7]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(n610), .CK(clk), .RN(n1597), .Q(
        DmP_mant_SHT1_SW[3]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(n574), .CK(clk), .RN(n1600), .Q(
        DmP_mant_SHT1_SW[21]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(n600), .CK(clk), .RN(n1597), .Q(
        DmP_mant_SHT1_SW[8]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(n825), .CK(clk), .RN(n1602), 
        .Q(intDY_EWSW[10]), .QN(n883) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(n588), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SHT1_SW[14]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(n590), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SHT1_SW[13]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(n580), .CK(clk), .RN(n1599), .Q(
        DmP_mant_SHT1_SW[18]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(n592), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SHT1_SW[12]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(n596), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SHT1_SW[10]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(n586), .CK(clk), .RN(n1599), .Q(
        DmP_mant_SHT1_SW[15]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(n604), .CK(clk), .RN(n1597), .Q(
        DmP_mant_SHT1_SW[6]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(n612), .CK(clk), .RN(n1605), .Q(
        DmP_mant_SHT1_SW[2]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(n614), .CK(clk), .RN(n1589), .Q(
        DmP_mant_SHT1_SW[1]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(n616), .CK(clk), .RN(n1596), .Q(
        DmP_mant_SHT1_SW[0]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_0_ ( .D(n724), .CK(clk), .RN(n1591), .Q(
        DMP_SFG[0]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n484), .CK(clk), .RN(n1589), .Q(
        DmP_mant_SFG_SWR[11]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n485), .CK(clk), .RN(n1604), .Q(
        DmP_mant_SFG_SWR[10]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(n519), .CK(clk), .RN(n1602), .Q(
        DmP_mant_SFG_SWR[2]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(n527), .CK(clk), .RN(n1605), .Q(
        DmP_mant_SFG_SWR[3]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(n472), .CK(clk), .RN(n1602), .Q(
        DmP_mant_SFG_SWR[23]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n480), .CK(clk), .RN(n1596), .Q(
        DmP_mant_SFG_SWR[15]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n481), .CK(clk), .RN(n1589), .Q(
        DmP_mant_SFG_SWR[14]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n482), .CK(clk), .RN(n1591), .Q(
        DmP_mant_SFG_SWR[13]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n483), .CK(clk), .RN(n1598), .Q(
        DmP_mant_SFG_SWR[12]) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(n773), .CK(clk), .RN(n1593), 
        .Q(Shift_amount_SHT1_EWR[0]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(n820), .CK(clk), .RN(n1590), 
        .Q(intDY_EWSW[15]), .QN(n1612) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(n815), .CK(clk), .RN(n1604), 
        .Q(intDY_EWSW[20]), .QN(n1542) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(n814), .CK(clk), .RN(n1593), 
        .Q(intDY_EWSW[21]), .QN(n1537) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_23_ ( .D(n737), .CK(clk), .RN(n1596), .Q(
        DMP_EXP_EWSW[23]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(n794), .CK(clk), .RN(n1587), .Q(
        Data_array_SWR[15]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(n638), .CK(clk), .RN(n937), .Q(
        DMP_exp_NRM2_EW[3]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(n643), .CK(clk), .RN(n1593), .Q(
        DMP_exp_NRM2_EW[2]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(n648), .CK(clk), .RN(n937), .Q(
        DMP_exp_NRM2_EW[1]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_31_ ( .D(n804), .CK(clk), .RN(n938), .Q(
        intDY_EWSW[31]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(n857), .CK(clk), .RN(n1596), 
        .Q(intDX_EWSW[12]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(n849), .CK(clk), .RN(n1583), 
        .Q(intDX_EWSW[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(n855), .CK(clk), .RN(n1582), 
        .Q(intDX_EWSW[14]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(n847), .CK(clk), .RN(n1603), 
        .Q(intDX_EWSW[22]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(n832), .CK(clk), .RN(n1586), .Q(
        intDY_EWSW[3]), .QN(n1610) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(n839), .CK(clk), .RN(n938), .Q(
        intDX_EWSW[30]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(n824), .CK(clk), .RN(n1604), 
        .Q(intDY_EWSW[11]), .QN(n1611) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(n850), .CK(clk), .RN(n1585), 
        .Q(intDX_EWSW[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(n787), .CK(clk), .RN(n1604), .Q(
        Data_array_SWR[9]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(n799), .CK(clk), .RN(n1584), .Q(
        Data_array_SWR[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(n795), .CK(clk), .RN(n1583), .Q(
        Data_array_SWR[16]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(n798), .CK(clk), .RN(n938), .Q(
        Data_array_SWR[18]) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(n777), .CK(clk), .RN(n1604), .Q(
        shift_value_SHT2_EWR[2]), .QN(n1499) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(n487), .CK(clk), .RN(n1604), .Q(
        DmP_mant_SFG_SWR[8]), .QN(n931) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_23_ ( .D(n571), .CK(clk), .RN(n1600), .Q(
        DmP_EXP_EWSW[23]), .QN(n925) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(n633), .CK(clk), .RN(n1594), .Q(
        DMP_exp_NRM2_EW[4]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(n781), .CK(clk), .RN(n1584), .Q(
        Data_array_SWR[3]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(n779), .CK(clk), .RN(n1586), .Q(
        Data_array_SWR[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(n778), .CK(clk), .RN(n1592), .Q(
        Data_array_SWR[0]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_27_ ( .D(n567), .CK(clk), .RN(n1600), .Q(
        DmP_EXP_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(n490), .CK(clk), .RN(n1604), .Q(
        DmP_mant_SFG_SWR[5]), .QN(n933) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(n488), .CK(clk), .RN(n1583), .Q(
        DmP_mant_SFG_SWR[7]), .QN(n932) );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(n486), .CK(clk), .RN(n1605), .Q(
        DmP_mant_SFG_SWR[9]), .QN(n917) );
  ADDFX1TS DP_OP_15J21_123_3116_U8 ( .A(n1522), .B(DMP_exp_NRM2_EW[1]), .CI(
        DP_OP_15J21_123_3116_n8), .CO(DP_OP_15J21_123_3116_n7), .S(
        exp_rslt_NRM2_EW1[1]) );
  ADDFX1TS DP_OP_15J21_123_3116_U7 ( .A(n1528), .B(DMP_exp_NRM2_EW[2]), .CI(
        DP_OP_15J21_123_3116_n7), .CO(DP_OP_15J21_123_3116_n6), .S(
        exp_rslt_NRM2_EW1[2]) );
  ADDFX1TS DP_OP_15J21_123_3116_U6 ( .A(n1527), .B(DMP_exp_NRM2_EW[3]), .CI(
        DP_OP_15J21_123_3116_n6), .CO(DP_OP_15J21_123_3116_n5), .S(
        exp_rslt_NRM2_EW1[3]) );
  ADDFX1TS DP_OP_15J21_123_3116_U5 ( .A(n1533), .B(DMP_exp_NRM2_EW[4]), .CI(
        DP_OP_15J21_123_3116_n5), .CO(DP_OP_15J21_123_3116_n4), .S(
        exp_rslt_NRM2_EW1[4]) );
  DFFRX4TS inst_ShiftRegister_Q_reg_4_ ( .D(n874), .CK(clk), .RN(n1587), .Q(
        busy), .QN(n1580) );
  DFFRX4TS inst_ShiftRegister_Q_reg_6_ ( .D(n876), .CK(clk), .RN(n938), .Q(
        Shift_reg_FLAGS_7_6), .QN(n935) );
  DFFRX4TS inst_ShiftRegister_Q_reg_0_ ( .D(n870), .CK(clk), .RN(n1585), .Q(
        Shift_reg_FLAGS_7[0]) );
  DFFRX4TS inst_ShiftRegister_Q_reg_2_ ( .D(n872), .CK(clk), .RN(n1587), .Q(
        n880), .QN(n1608) );
  AOI222X4TS U904 ( .A0(Data_array_SWR[19]), .A1(n1435), .B0(
        Data_array_SWR[16]), .B1(n1434), .C0(Data_array_SWR[23]), .C1(n1433), 
        .Y(n1396) );
  AOI211X1TS U905 ( .A0(n1391), .A1(Data_array_SWR[2]), .B0(n1374), .C0(n1373), 
        .Y(n1447) );
  NAND2X4TS U906 ( .A(n1148), .B(n1147), .Y(n1149) );
  AOI211X2TS U907 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n1133), .B0(n1271), .C0(
        n1132), .Y(n1167) );
  CLKINVX6TS U908 ( .A(n1298), .Y(n1134) );
  BUFX6TS U909 ( .A(n1012), .Y(n881) );
  AND2X4TS U910 ( .A(Shift_reg_FLAGS_7_6), .B(n1011), .Y(n1102) );
  INVX6TS U911 ( .A(rst), .Y(n937) );
  OAI222X1TS U912 ( .A0(n1571), .A1(n1313), .B0(n1304), .B1(n1302), .C0(n1165), 
        .C1(n1301), .Y(n790) );
  OAI222X1TS U913 ( .A0(n1313), .A1(n1572), .B0(n1304), .B1(n1301), .C0(n1165), 
        .C1(n1295), .Y(n792) );
  OAI222X1TS U914 ( .A0(n1562), .A1(n1313), .B0(n1304), .B1(n1292), .C0(n1165), 
        .C1(n1291), .Y(n801) );
  CLKINVX6TS U915 ( .A(n1307), .Y(n1165) );
  NOR2X4TS U916 ( .A(n1167), .B(n1351), .Y(n1147) );
  NAND3XLTS U917 ( .A(n1140), .B(n1124), .C(n1263), .Y(n1271) );
  NOR2X4TS U918 ( .A(n1011), .B(n935), .Y(n1012) );
  INVX4TS U919 ( .A(n1375), .Y(n1361) );
  INVX4TS U920 ( .A(n1445), .Y(n1392) );
  BUFX6TS U921 ( .A(n1336), .Y(n1476) );
  INVX6TS U922 ( .A(Shift_reg_FLAGS_7_6), .Y(n1013) );
  BUFX6TS U923 ( .A(n937), .Y(n1601) );
  BUFX6TS U924 ( .A(n937), .Y(n938) );
  BUFX6TS U925 ( .A(n937), .Y(n1590) );
  NAND2BXLTS U926 ( .AN(n914), .B(intDY_EWSW[2]), .Y(n961) );
  NAND2BXLTS U927 ( .AN(intDX_EWSW[19]), .B(intDY_EWSW[19]), .Y(n995) );
  NAND2BXLTS U928 ( .AN(intDX_EWSW[27]), .B(intDY_EWSW[27]), .Y(n949) );
  NAND2BXLTS U929 ( .AN(intDX_EWSW[9]), .B(intDY_EWSW[9]), .Y(n974) );
  OAI2BB2XLTS U930 ( .B0(intDY_EWSW[14]), .B1(n980), .A0N(intDX_EWSW[15]), 
        .A1N(n1612), .Y(n981) );
  NAND2BXLTS U931 ( .AN(intDX_EWSW[13]), .B(intDY_EWSW[13]), .Y(n970) );
  NAND2BXLTS U932 ( .AN(intDX_EWSW[21]), .B(intDY_EWSW[21]), .Y(n989) );
  AO22XLTS U933 ( .A0(DmP_mant_SFG_SWR[9]), .A1(n1607), .B0(n1384), .B1(n917), 
        .Y(n884) );
  AO22XLTS U934 ( .A0(DmP_mant_SFG_SWR[5]), .A1(n915), .B0(n1384), .B1(n933), 
        .Y(n887) );
  AOI222X4TS U935 ( .A0(Data_array_SWR[13]), .A1(n1434), .B0(
        Data_array_SWR[20]), .B1(n1433), .C0(n910), .C1(n1435), .Y(n1403) );
  AOI222X4TS U936 ( .A0(Data_array_SWR[22]), .A1(n1433), .B0(
        Data_array_SWR[18]), .B1(n1435), .C0(Data_array_SWR[15]), .C1(n1434), 
        .Y(n1395) );
  AOI222X4TS U937 ( .A0(Data_array_SWR[22]), .A1(n1380), .B0(
        Data_array_SWR[18]), .B1(n1423), .C0(Data_array_SWR[15]), .C1(n1422), 
        .Y(n1408) );
  AOI222X4TS U938 ( .A0(Data_array_SWR[19]), .A1(n1423), .B0(
        Data_array_SWR[16]), .B1(n1422), .C0(Data_array_SWR[23]), .C1(n1380), 
        .Y(n1439) );
  NAND2BXLTS U939 ( .AN(n1273), .B(n944), .Y(n947) );
  AOI222X1TS U940 ( .A0(Raw_mant_NRM_SWR[16]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[7]), .C0(n1296), .C1(DmP_mant_SHT1_SW[8]), .Y(n1198)
         );
  AOI222X1TS U941 ( .A0(Raw_mant_NRM_SWR[20]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[3]), .C0(n1296), .C1(n903), .Y(n1176) );
  AOI222X1TS U942 ( .A0(n1233), .A1(DMP_SFG[1]), .B0(n1233), .B1(n1366), .C0(
        DMP_SFG[1]), .C1(n1366), .Y(intadd_17_CI) );
  AOI222X1TS U943 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n1134), .B0(n1300), .B1(n906), .C0(n1296), .C1(DmP_mant_SHT1_SW[20]), .Y(n1214) );
  AOI222X1TS U944 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[17]), .C0(n1296), .C1(DmP_mant_SHT1_SW[18]), .Y(n1219) );
  AOI222X1TS U945 ( .A0(Raw_mant_NRM_SWR[10]), .A1(n1134), .B0(
        DmP_mant_SHT1_SW[14]), .B1(n1296), .C0(n1300), .C1(
        DmP_mant_SHT1_SW[13]), .Y(n1223) );
  AOI222X1TS U946 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[15]), .C0(n1296), .C1(DmP_mant_SHT1_SW[16]), .Y(n1222) );
  AOI222X4TS U947 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[20]), .C0(n1199), .C1(DmP_mant_SHT1_SW[21]), .Y(n1211) );
  AO22XLTS U948 ( .A0(DmP_mant_SFG_SWR[7]), .A1(n1384), .B0(n915), .B1(n932), 
        .Y(n888) );
  AOI222X1TS U949 ( .A0(DMP_SFG[5]), .A1(n899), .B0(DMP_SFG[5]), .B1(n1249), 
        .C0(n899), .C1(n1249), .Y(intadd_16_CI) );
  AOI222X1TS U950 ( .A0(n1443), .A1(n1481), .B0(Data_array_SWR[8]), .B1(n1361), 
        .C0(n1442), .C1(n1441), .Y(n1468) );
  AOI222X1TS U951 ( .A0(n1443), .A1(n1446), .B0(n1392), .B1(Data_array_SWR[8]), 
        .C0(n1442), .C1(n1440), .Y(n1458) );
  AOI222X1TS U952 ( .A0(n1419), .A1(n1481), .B0(Data_array_SWR[6]), .B1(n1361), 
        .C0(n1418), .C1(n1441), .Y(n1470) );
  AOI222X1TS U953 ( .A0(n1410), .A1(n1446), .B0(n1392), .B1(Data_array_SWR[9]), 
        .C0(n1409), .C1(n1440), .Y(n1459) );
  AOI222X1TS U954 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[2]), .C0(n1296), .C1(DmP_mant_SHT1_SW[3]), .Y(n1182)
         );
  AOI222X1TS U955 ( .A0(Raw_mant_NRM_SWR[14]), .A1(n1134), .B0(n1300), .B1(
        n905), .C0(n1296), .C1(DmP_mant_SHT1_SW[10]), .Y(n1232) );
  AOI222X1TS U956 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n1134), .B0(n1300), .B1(
        n904), .C0(n1296), .C1(DmP_mant_SHT1_SW[12]), .Y(n1228) );
  AOI222X4TS U957 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[16]), .C0(n1296), .C1(DmP_mant_SHT1_SW[17]), .Y(n1206) );
  AO22XLTS U958 ( .A0(n1284), .A1(Data_X[19]), .B0(n1283), .B1(intDX_EWSW[19]), 
        .Y(n850) );
  AO22XLTS U959 ( .A0(n1465), .A1(n1431), .B0(n1477), .B1(DmP_mant_SFG_SWR[3]), 
        .Y(n527) );
  AO22XLTS U960 ( .A0(n1483), .A1(DMP_SHT2_EWSW[0]), .B0(n1336), .B1(
        DMP_SFG[0]), .Y(n724) );
  AO22XLTS U961 ( .A0(n1344), .A1(DmP_EXP_EWSW[0]), .B0(n1346), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n616) );
  AO22XLTS U962 ( .A0(n1344), .A1(DmP_EXP_EWSW[1]), .B0(n1338), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n614) );
  AO22XLTS U963 ( .A0(n1344), .A1(DmP_EXP_EWSW[2]), .B0(n1348), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n612) );
  AO22XLTS U964 ( .A0(n1344), .A1(DmP_EXP_EWSW[6]), .B0(n1346), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n604) );
  AO22XLTS U965 ( .A0(n1349), .A1(DmP_EXP_EWSW[15]), .B0(n1348), .B1(
        DmP_mant_SHT1_SW[15]), .Y(n586) );
  AO22XLTS U966 ( .A0(n1344), .A1(DmP_EXP_EWSW[10]), .B0(n1346), .B1(
        DmP_mant_SHT1_SW[10]), .Y(n596) );
  AO22XLTS U967 ( .A0(n1344), .A1(DmP_EXP_EWSW[12]), .B0(n1338), .B1(
        DmP_mant_SHT1_SW[12]), .Y(n592) );
  AO22XLTS U968 ( .A0(n1344), .A1(DmP_EXP_EWSW[18]), .B0(n1338), .B1(
        DmP_mant_SHT1_SW[18]), .Y(n580) );
  AO22XLTS U969 ( .A0(n1349), .A1(DmP_EXP_EWSW[13]), .B0(n1346), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n590) );
  AO22XLTS U970 ( .A0(n1344), .A1(DmP_EXP_EWSW[8]), .B0(n1348), .B1(
        DmP_mant_SHT1_SW[8]), .Y(n600) );
  AO22XLTS U971 ( .A0(n1349), .A1(DmP_EXP_EWSW[21]), .B0(n1346), .B1(
        DmP_mant_SHT1_SW[21]), .Y(n574) );
  AO22XLTS U972 ( .A0(n1344), .A1(DmP_EXP_EWSW[3]), .B0(n1577), .B1(
        DmP_mant_SHT1_SW[3]), .Y(n610) );
  AO22XLTS U973 ( .A0(n1344), .A1(DmP_EXP_EWSW[7]), .B0(n1346), .B1(
        DmP_mant_SHT1_SW[7]), .Y(n602) );
  AO22XLTS U974 ( .A0(n1344), .A1(DmP_EXP_EWSW[16]), .B0(n1346), .B1(
        DmP_mant_SHT1_SW[16]), .Y(n584) );
  AO22XLTS U975 ( .A0(n1349), .A1(DmP_EXP_EWSW[20]), .B0(n1348), .B1(
        DmP_mant_SHT1_SW[20]), .Y(n576) );
  AO22XLTS U976 ( .A0(n1287), .A1(Data_X[31]), .B0(n1285), .B1(intDX_EWSW[31]), 
        .Y(n838) );
  AO22XLTS U977 ( .A0(n1483), .A1(DMP_SHT2_EWSW[1]), .B0(n1477), .B1(
        DMP_SFG[1]), .Y(n721) );
  AO22XLTS U978 ( .A0(n1280), .A1(n1360), .B0(n1281), .B1(n902), .Y(n872) );
  AO22XLTS U979 ( .A0(n1344), .A1(DmP_EXP_EWSW[11]), .B0(n1577), .B1(n904), 
        .Y(n594) );
  AO22XLTS U980 ( .A0(n1344), .A1(DmP_EXP_EWSW[9]), .B0(n1338), .B1(n905), .Y(
        n598) );
  AO22XLTS U981 ( .A0(n1344), .A1(DmP_EXP_EWSW[5]), .B0(n1348), .B1(n907), .Y(
        n606) );
  AO22XLTS U982 ( .A0(n1344), .A1(DmP_EXP_EWSW[4]), .B0(n1346), .B1(n903), .Y(
        n608) );
  AO22XLTS U983 ( .A0(n1281), .A1(busy), .B0(n1280), .B1(n902), .Y(n873) );
  BUFX3TS U984 ( .A(n937), .Y(n1606) );
  NOR3X1TS U985 ( .A(shift_value_SHT2_EWR[4]), .B(shift_value_SHT2_EWR[2]), 
        .C(n1529), .Y(n1362) );
  NOR2X2TS U986 ( .A(n1148), .B(n1351), .Y(n1272) );
  NOR4X2TS U987 ( .A(n1145), .B(n1144), .C(n1143), .D(n1142), .Y(n1148) );
  OAI222X1TS U988 ( .A0(n1576), .A1(n1313), .B0(n1304), .B1(n1303), .C0(n1165), 
        .C1(n1302), .Y(n788) );
  NOR2BX2TS U989 ( .AN(n1269), .B(n1268), .Y(n1129) );
  NAND4XLTS U990 ( .A(n1511), .B(n1489), .C(n1484), .D(n1493), .Y(n1268) );
  AOI221X1TS U991 ( .A0(n1555), .A1(intDX_EWSW[26]), .B0(intDX_EWSW[27]), .B1(
        n1546), .C0(n1048), .Y(n1052) );
  OAI21X2TS U992 ( .A0(intDX_EWSW[26]), .A1(n1555), .B0(n949), .Y(n1048) );
  BUFX4TS U993 ( .A(n1593), .Y(n1604) );
  BUFX4TS U994 ( .A(n1601), .Y(n1592) );
  BUFX4TS U995 ( .A(n1582), .Y(n1605) );
  BUFX4TS U996 ( .A(n1590), .Y(n1600) );
  BUFX4TS U997 ( .A(n937), .Y(n1602) );
  BUFX4TS U998 ( .A(n938), .Y(n1597) );
  BUFX4TS U999 ( .A(n1601), .Y(n1598) );
  BUFX4TS U1000 ( .A(n1590), .Y(n1596) );
  BUFX4TS U1001 ( .A(n1594), .Y(n1589) );
  BUFX4TS U1002 ( .A(n937), .Y(n1591) );
  OAI211XLTS U1003 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n1123), .B0(n1265), .C0(
        n1517), .Y(n1124) );
  NOR2X2TS U1004 ( .A(Raw_mant_NRM_SWR[6]), .B(n1121), .Y(n1265) );
  BUFX4TS U1005 ( .A(n1594), .Y(n1599) );
  BUFX4TS U1006 ( .A(n1594), .Y(n1603) );
  CLKINVX6TS U1007 ( .A(n1338), .Y(n1347) );
  BUFX6TS U1008 ( .A(n1577), .Y(n1346) );
  CLKINVX3TS U1009 ( .A(n1205), .Y(n1226) );
  BUFX4TS U1010 ( .A(n1601), .Y(n1587) );
  BUFX4TS U1011 ( .A(n937), .Y(n1593) );
  INVX2TS U1012 ( .A(n888), .Y(n899) );
  NOR2X2TS U1013 ( .A(Raw_mant_NRM_SWR[13]), .B(n1256), .Y(n1139) );
  BUFX6TS U1014 ( .A(n936), .Y(n1287) );
  BUFX4TS U1015 ( .A(n936), .Y(n1284) );
  BUFX4TS U1016 ( .A(n936), .Y(n1286) );
  NOR2X4TS U1017 ( .A(n1405), .B(shift_value_SHT2_EWR[4]), .Y(n1391) );
  BUFX4TS U1018 ( .A(n1584), .Y(n1585) );
  BUFX4TS U1019 ( .A(n1590), .Y(n1582) );
  BUFX4TS U1020 ( .A(n1585), .Y(n1583) );
  INVX2TS U1021 ( .A(n887), .Y(n900) );
  INVX2TS U1022 ( .A(n884), .Y(n901) );
  BUFX4TS U1023 ( .A(n1363), .Y(n1433) );
  NOR2XLTS U1024 ( .A(n1352), .B(Shift_amount_SHT1_EWR[0]), .Y(n1151) );
  BUFX6TS U1025 ( .A(Shift_reg_FLAGS_7[1]), .Y(n1352) );
  NOR2X4TS U1026 ( .A(shift_value_SHT2_EWR[4]), .B(n1481), .Y(n1441) );
  AOI222X1TS U1027 ( .A0(n1410), .A1(n1481), .B0(Data_array_SWR[9]), .B1(n1361), .C0(n1409), .C1(n1441), .Y(n1467) );
  BUFX6TS U1028 ( .A(left_right_SHT2), .Y(n1481) );
  INVX2TS U1029 ( .A(n895), .Y(n902) );
  INVX2TS U1030 ( .A(n898), .Y(n903) );
  INVX2TS U1031 ( .A(n894), .Y(n904) );
  INVX2TS U1032 ( .A(n893), .Y(n905) );
  INVX2TS U1033 ( .A(n892), .Y(n906) );
  INVX2TS U1034 ( .A(n897), .Y(n907) );
  INVX2TS U1035 ( .A(n896), .Y(n908) );
  INVX2TS U1036 ( .A(n891), .Y(n909) );
  NOR2X4TS U1037 ( .A(shift_value_SHT2_EWR[3]), .B(n1499), .Y(n1423) );
  BUFX4TS U1038 ( .A(n1102), .Y(n1106) );
  BUFX6TS U1039 ( .A(n1146), .Y(n1304) );
  BUFX6TS U1040 ( .A(n1151), .Y(n1300) );
  BUFX6TS U1041 ( .A(n1199), .Y(n1296) );
  CLKINVX3TS U1042 ( .A(n1284), .Y(n1289) );
  CLKINVX6TS U1043 ( .A(n1287), .Y(n1285) );
  CLKINVX3TS U1044 ( .A(n1286), .Y(n1283) );
  INVX6TS U1045 ( .A(n1608), .Y(n1360) );
  INVX3TS U1046 ( .A(n1342), .Y(n1451) );
  INVX2TS U1047 ( .A(n889), .Y(n910) );
  INVX2TS U1048 ( .A(n890), .Y(n911) );
  AOI32X1TS U1049 ( .A0(n1557), .A1(n995), .A2(intDX_EWSW[18]), .B0(
        intDX_EWSW[19]), .B1(n1504), .Y(n996) );
  AOI221X1TS U1050 ( .A0(n1557), .A1(intDX_EWSW[18]), .B0(intDX_EWSW[19]), 
        .B1(n1504), .C0(n1055), .Y(n1060) );
  AOI221X1TS U1051 ( .A0(n883), .A1(n913), .B0(intDX_EWSW[11]), .B1(n1611), 
        .C0(n1063), .Y(n1068) );
  AOI221X1TS U1052 ( .A0(n1556), .A1(intDX_EWSW[30]), .B0(intDX_EWSW[17]), 
        .B1(n1552), .C0(n1054), .Y(n1061) );
  AOI221X4TS U1053 ( .A0(intDX_EWSW[30]), .A1(n1556), .B0(intDX_EWSW[29]), 
        .B1(n1505), .C0(n954), .Y(n956) );
  INVX2TS U1054 ( .A(n882), .Y(n912) );
  INVX2TS U1055 ( .A(n886), .Y(n913) );
  AOI221X1TS U1056 ( .A0(n1538), .A1(n914), .B0(intDX_EWSW[3]), .B1(n1610), 
        .C0(n1071), .Y(n1076) );
  INVX2TS U1057 ( .A(n885), .Y(n914) );
  AOI221X1TS U1058 ( .A0(n1503), .A1(intDX_EWSW[22]), .B0(intDX_EWSW[23]), 
        .B1(n1545), .C0(n1057), .Y(n1058) );
  AOI221X1TS U1059 ( .A0(n1541), .A1(intDX_EWSW[14]), .B0(intDX_EWSW[15]), 
        .B1(n1612), .C0(n1065), .Y(n1066) );
  OAI211X2TS U1060 ( .A0(intDX_EWSW[20]), .A1(n1542), .B0(n1003), .C0(n989), 
        .Y(n998) );
  AOI221X1TS U1061 ( .A0(n1542), .A1(intDX_EWSW[20]), .B0(intDX_EWSW[21]), 
        .B1(n1537), .C0(n1056), .Y(n1059) );
  OAI211X2TS U1062 ( .A0(intDX_EWSW[12]), .A1(n1540), .B0(n984), .C0(n970), 
        .Y(n986) );
  AOI221X1TS U1063 ( .A0(n1540), .A1(intDX_EWSW[12]), .B0(intDX_EWSW[13]), 
        .B1(n1536), .C0(n1064), .Y(n1067) );
  INVX6TS U1064 ( .A(OP_FLAG_SFG), .Y(n915) );
  BUFX4TS U1065 ( .A(n1362), .Y(n1435) );
  INVX1TS U1066 ( .A(DMP_SFG[3]), .Y(intadd_17_A_1_) );
  INVX1TS U1067 ( .A(DMP_SFG[4]), .Y(intadd_17_A_2_) );
  INVX1TS U1068 ( .A(DMP_SFG[7]), .Y(intadd_16_A_1_) );
  INVX1TS U1069 ( .A(DMP_SFG[8]), .Y(intadd_16_A_2_) );
  OAI31XLTS U1070 ( .A0(n1335), .A1(n1085), .A2(n1341), .B0(n1084), .Y(n727)
         );
  NOR2X4TS U1071 ( .A(shift_value_SHT2_EWR[2]), .B(shift_value_SHT2_EWR[3]), 
        .Y(n1422) );
  NOR2X2TS U1072 ( .A(n925), .B(DMP_EXP_EWSW[23]), .Y(n1320) );
  XNOR2X2TS U1073 ( .A(DMP_exp_NRM2_EW[6]), .B(n945), .Y(n1273) );
  XNOR2X2TS U1074 ( .A(DMP_exp_NRM2_EW[0]), .B(n1253), .Y(n1235) );
  INVX1TS U1075 ( .A(LZD_output_NRM2_EW[0]), .Y(n1253) );
  XNOR2X2TS U1076 ( .A(DMP_exp_NRM2_EW[5]), .B(DP_OP_15J21_123_3116_n4), .Y(
        n1237) );
  AO22XLTS U1077 ( .A0(DmP_mant_SFG_SWR[6]), .A1(n915), .B0(n1384), .B1(n934), 
        .Y(intadd_17_B_2_) );
  INVX2TS U1078 ( .A(intadd_17_B_2_), .Y(n916) );
  AOI222X4TS U1079 ( .A0(n1248), .A1(intadd_17_A_2_), .B0(n1248), .B1(n916), 
        .C0(intadd_17_A_2_), .C1(n916), .Y(n1249) );
  CLKINVX6TS U1080 ( .A(n881), .Y(n1108) );
  NOR2X4TS U1081 ( .A(shift_value_SHT2_EWR[4]), .B(n1446), .Y(n1440) );
  CLKINVX6TS U1082 ( .A(n1481), .Y(n1446) );
  AOI2BB2X2TS U1083 ( .B0(DmP_mant_SFG_SWR[3]), .B1(n1384), .A0N(n1384), .A1N(
        DmP_mant_SFG_SWR[3]), .Y(n1366) );
  AOI2BB2X2TS U1084 ( .B0(DmP_mant_SFG_SWR[10]), .B1(n1607), .A0N(n915), .A1N(
        DmP_mant_SFG_SWR[10]), .Y(intadd_16_B_2_) );
  AOI2BB2X2TS U1085 ( .B0(DmP_mant_SFG_SWR[11]), .B1(n1384), .A0N(OP_FLAG_SFG), 
        .A1N(DmP_mant_SFG_SWR[11]), .Y(n1355) );
  AOI222X1TS U1086 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[6]), .C0(n1296), .C1(DmP_mant_SHT1_SW[7]), .Y(n1193)
         );
  AOI222X1TS U1087 ( .A0(n1419), .A1(n1446), .B0(n1392), .B1(Data_array_SWR[6]), .C0(n1418), .C1(n1440), .Y(n1455) );
  AOI222X4TS U1088 ( .A0(DMP_SFG[9]), .A1(n1355), .B0(DMP_SFG[9]), .B1(n1252), 
        .C0(n1355), .C1(n1252), .Y(intadd_15_B_0_) );
  AOI222X1TS U1089 ( .A0(n1414), .A1(n1446), .B0(n1392), .B1(Data_array_SWR[7]), .C0(n1413), .C1(n1440), .Y(n1456) );
  AOI222X1TS U1090 ( .A0(n1414), .A1(n1481), .B0(Data_array_SWR[7]), .B1(n1361), .C0(n1413), .C1(n1441), .Y(n1469) );
  AOI222X1TS U1091 ( .A0(n1424), .A1(n1446), .B0(n1392), .B1(Data_array_SWR[5]), .C0(n1425), .C1(n1440), .Y(n1454) );
  AOI222X1TS U1092 ( .A0(n1424), .A1(n1481), .B0(Data_array_SWR[5]), .B1(n1361), .C0(n1425), .C1(n1441), .Y(n1471) );
  AOI222X1TS U1093 ( .A0(n1430), .A1(n1446), .B0(n1392), .B1(Data_array_SWR[4]), .C0(n1429), .C1(n1440), .Y(n1453) );
  AOI222X1TS U1094 ( .A0(n1430), .A1(n1481), .B0(Data_array_SWR[4]), .B1(n1361), .C0(n1429), .C1(n1441), .Y(n1472) );
  INVX4TS U1095 ( .A(n1477), .Y(n1479) );
  BUFX6TS U1096 ( .A(n1336), .Y(n1477) );
  INVX3TS U1097 ( .A(n1449), .Y(n1452) );
  CLKINVX6TS U1098 ( .A(n1580), .Y(n1350) );
  AOI222X4TS U1099 ( .A0(Data_array_SWR[21]), .A1(n1433), .B0(
        Data_array_SWR[17]), .B1(n1435), .C0(Data_array_SWR[14]), .C1(n1434), 
        .Y(n1399) );
  NOR2X2TS U1100 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1530), .Y(n1278) );
  AOI32X1TS U1101 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n1136), .A2(n1135), .B0(
        Raw_mant_NRM_SWR[19]), .B1(n1136), .Y(n1137) );
  OAI21X2TS U1102 ( .A0(intDX_EWSW[18]), .A1(n1557), .B0(n995), .Y(n1055) );
  NOR3X1TS U1103 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[19]), .C(
        Raw_mant_NRM_SWR[20]), .Y(n1269) );
  AND2X2TS U1104 ( .A(beg_OP), .B(n1282), .Y(n936) );
  NOR2XLTS U1105 ( .A(n1611), .B(intDX_EWSW[11]), .Y(n972) );
  OAI21XLTS U1106 ( .A0(intDX_EWSW[15]), .A1(n1612), .B0(intDX_EWSW[14]), .Y(
        n980) );
  NOR2XLTS U1107 ( .A(n993), .B(intDY_EWSW[16]), .Y(n994) );
  OAI21XLTS U1108 ( .A0(intDX_EWSW[23]), .A1(n1545), .B0(intDX_EWSW[22]), .Y(
        n999) );
  OAI21XLTS U1109 ( .A0(intDX_EWSW[21]), .A1(n1537), .B0(intDX_EWSW[20]), .Y(
        n992) );
  AOI31XLTS U1110 ( .A0(Raw_mant_NRM_SWR[16]), .A1(n1129), .A2(n1498), .B0(
        n1128), .Y(n1130) );
  NOR2XLTS U1111 ( .A(Raw_mant_NRM_SWR[8]), .B(Raw_mant_NRM_SWR[9]), .Y(n1112)
         );
  OAI21XLTS U1112 ( .A0(n1485), .A1(n1298), .B0(n1293), .Y(n1294) );
  OAI21XLTS U1113 ( .A0(n1085), .A1(n1013), .B0(n1082), .Y(n1083) );
  OAI21XLTS U1114 ( .A0(n1564), .A1(n1209), .B0(n1183), .Y(n1184) );
  OAI21XLTS U1115 ( .A0(n1488), .A1(n1298), .B0(n1203), .Y(n1204) );
  OAI21XLTS U1116 ( .A0(n1546), .A1(n1082), .B0(n1036), .Y(n567) );
  OAI21XLTS U1117 ( .A0(n1552), .A1(n1339), .B0(n1022), .Y(n583) );
  OAI21XLTS U1118 ( .A0(n883), .A1(n1082), .B0(n1023), .Y(n597) );
  OAI21XLTS U1119 ( .A0(n1557), .A1(n1108), .B0(n1093), .Y(n742) );
  OAI21XLTS U1120 ( .A0(n1539), .A1(n1341), .B0(n1046), .Y(n756) );
  OAI211XLTS U1121 ( .A0(n1176), .A1(n1165), .B0(n1175), .C0(n1174), .Y(n781)
         );
  BUFX3TS U1122 ( .A(n937), .Y(n1594) );
  BUFX3TS U1123 ( .A(n1593), .Y(n1595) );
  BUFX3TS U1124 ( .A(n937), .Y(n1586) );
  BUFX3TS U1125 ( .A(n1593), .Y(n1588) );
  BUFX3TS U1126 ( .A(n938), .Y(n1584) );
  INVX2TS U1127 ( .A(DP_OP_15J21_123_3116_n4), .Y(n939) );
  NAND2X1TS U1128 ( .A(n1531), .B(n939), .Y(n945) );
  NOR2XLTS U1129 ( .A(n1235), .B(exp_rslt_NRM2_EW1[1]), .Y(n942) );
  INVX2TS U1130 ( .A(exp_rslt_NRM2_EW1[3]), .Y(n941) );
  INVX2TS U1131 ( .A(exp_rslt_NRM2_EW1[2]), .Y(n940) );
  NAND4BXLTS U1132 ( .AN(exp_rslt_NRM2_EW1[4]), .B(n942), .C(n941), .D(n940), 
        .Y(n943) );
  NOR2XLTS U1133 ( .A(n943), .B(n1237), .Y(n944) );
  INVX2TS U1134 ( .A(n945), .Y(n946) );
  NAND2X1TS U1135 ( .A(n1547), .B(n946), .Y(n1240) );
  XNOR2X1TS U1136 ( .A(DMP_exp_NRM2_EW[7]), .B(n1240), .Y(n1234) );
  OR2X1TS U1137 ( .A(n947), .B(n1234), .Y(n1245) );
  CLKBUFX2TS U1138 ( .A(Shift_reg_FLAGS_7[0]), .Y(n1342) );
  NAND2X2TS U1139 ( .A(n1245), .B(n1342), .Y(n1274) );
  OA22X1TS U1140 ( .A0(n1274), .A1(exp_rslt_NRM2_EW1[2]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[25]), .Y(n766) );
  OA22X1TS U1141 ( .A0(n1274), .A1(n1237), .B0(Shift_reg_FLAGS_7[0]), .B1(
        final_result_ieee[28]), .Y(n763) );
  OA22X1TS U1142 ( .A0(n1274), .A1(exp_rslt_NRM2_EW1[3]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[26]), .Y(n765) );
  OA22X1TS U1143 ( .A0(n1274), .A1(n1235), .B0(final_result_ieee[23]), .B1(
        Shift_reg_FLAGS_7[0]), .Y(n768) );
  OA22X1TS U1144 ( .A0(n1274), .A1(exp_rslt_NRM2_EW1[4]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[27]), .Y(n764) );
  OA22X1TS U1145 ( .A0(n1274), .A1(exp_rslt_NRM2_EW1[1]), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[24]), .Y(n767) );
  INVX4TS U1146 ( .A(n1352), .Y(n1351) );
  OAI21XLTS U1147 ( .A0(n1350), .A1(n1446), .B0(n1351), .Y(n836) );
  NOR2X1TS U1148 ( .A(n1550), .B(intDX_EWSW[25]), .Y(n1006) );
  NOR2XLTS U1149 ( .A(n1006), .B(intDY_EWSW[24]), .Y(n948) );
  AOI22X1TS U1150 ( .A0(intDX_EWSW[25]), .A1(n1550), .B0(intDX_EWSW[24]), .B1(
        n948), .Y(n952) );
  NAND3XLTS U1151 ( .A(n1555), .B(n949), .C(intDX_EWSW[26]), .Y(n951) );
  NAND2BXLTS U1152 ( .AN(intDY_EWSW[27]), .B(intDX_EWSW[27]), .Y(n950) );
  OAI211XLTS U1153 ( .A0(n952), .A1(n1048), .B0(n951), .C0(n950), .Y(n957) );
  NOR2X1TS U1154 ( .A(n1556), .B(intDX_EWSW[30]), .Y(n955) );
  NOR2X1TS U1155 ( .A(n1505), .B(intDX_EWSW[29]), .Y(n953) );
  AOI211X1TS U1156 ( .A0(intDY_EWSW[28]), .A1(n1524), .B0(n955), .C0(n953), 
        .Y(n1005) );
  NOR3XLTS U1157 ( .A(n1524), .B(n953), .C(intDY_EWSW[28]), .Y(n954) );
  AOI2BB2X1TS U1158 ( .B0(n957), .B1(n1005), .A0N(n956), .A1N(n955), .Y(n1010)
         );
  NOR2X1TS U1159 ( .A(n1552), .B(intDX_EWSW[17]), .Y(n993) );
  OAI22X1TS U1160 ( .A0(n883), .A1(n913), .B0(n1611), .B1(intDX_EWSW[11]), .Y(
        n1063) );
  INVX2TS U1161 ( .A(n1063), .Y(n977) );
  OAI211XLTS U1162 ( .A0(intDX_EWSW[8]), .A1(n1554), .B0(n974), .C0(n977), .Y(
        n988) );
  OAI2BB1X1TS U1163 ( .A0N(n1513), .A1N(intDY_EWSW[5]), .B0(intDX_EWSW[4]), 
        .Y(n958) );
  OAI22X1TS U1164 ( .A0(intDY_EWSW[4]), .A1(n958), .B0(n1513), .B1(
        intDY_EWSW[5]), .Y(n969) );
  OAI2BB1X1TS U1165 ( .A0N(n1496), .A1N(intDY_EWSW[7]), .B0(intDX_EWSW[6]), 
        .Y(n959) );
  OAI22X1TS U1166 ( .A0(intDY_EWSW[6]), .A1(n959), .B0(n1496), .B1(
        intDY_EWSW[7]), .Y(n968) );
  OAI21XLTS U1167 ( .A0(intDX_EWSW[1]), .A1(n1553), .B0(n912), .Y(n960) );
  OAI2BB2XLTS U1168 ( .B0(intDY_EWSW[0]), .B1(n960), .A0N(intDX_EWSW[1]), 
        .A1N(n1553), .Y(n962) );
  OAI211XLTS U1169 ( .A0(n1610), .A1(intDX_EWSW[3]), .B0(n962), .C0(n961), .Y(
        n965) );
  OAI21XLTS U1170 ( .A0(intDX_EWSW[3]), .A1(n1610), .B0(n914), .Y(n963) );
  AOI2BB2XLTS U1171 ( .B0(intDX_EWSW[3]), .B1(n1610), .A0N(intDY_EWSW[2]), 
        .A1N(n963), .Y(n964) );
  AOI222X1TS U1172 ( .A0(intDY_EWSW[4]), .A1(n1494), .B0(n965), .B1(n964), 
        .C0(intDY_EWSW[5]), .C1(n1513), .Y(n967) );
  AOI22X1TS U1173 ( .A0(intDY_EWSW[7]), .A1(n1496), .B0(intDY_EWSW[6]), .B1(
        n1518), .Y(n966) );
  OAI32X1TS U1174 ( .A0(n969), .A1(n968), .A2(n967), .B0(n966), .B1(n968), .Y(
        n987) );
  OA22X1TS U1175 ( .A0(n1541), .A1(intDX_EWSW[14]), .B0(n1612), .B1(
        intDX_EWSW[15]), .Y(n984) );
  OAI21XLTS U1176 ( .A0(intDX_EWSW[13]), .A1(n1536), .B0(intDX_EWSW[12]), .Y(
        n971) );
  OAI2BB2XLTS U1177 ( .B0(intDY_EWSW[12]), .B1(n971), .A0N(intDX_EWSW[13]), 
        .A1N(n1536), .Y(n983) );
  NOR2XLTS U1178 ( .A(n972), .B(intDY_EWSW[10]), .Y(n973) );
  AOI22X1TS U1179 ( .A0(intDX_EWSW[11]), .A1(n1611), .B0(n913), .B1(n973), .Y(
        n979) );
  NAND2BXLTS U1180 ( .AN(intDY_EWSW[9]), .B(intDX_EWSW[9]), .Y(n976) );
  NAND3XLTS U1181 ( .A(n1554), .B(n974), .C(intDX_EWSW[8]), .Y(n975) );
  AOI21X1TS U1182 ( .A0(n976), .A1(n975), .B0(n986), .Y(n978) );
  OAI2BB2XLTS U1183 ( .B0(n979), .B1(n986), .A0N(n978), .A1N(n977), .Y(n982)
         );
  AOI211X1TS U1184 ( .A0(n984), .A1(n983), .B0(n982), .C0(n981), .Y(n985) );
  OAI31X1TS U1185 ( .A0(n988), .A1(n987), .A2(n986), .B0(n985), .Y(n991) );
  OA22X1TS U1186 ( .A0(n1503), .A1(intDX_EWSW[22]), .B0(n1545), .B1(
        intDX_EWSW[23]), .Y(n1003) );
  AOI211XLTS U1187 ( .A0(intDY_EWSW[16]), .A1(n1523), .B0(n998), .C0(n1055), 
        .Y(n990) );
  NAND3BXLTS U1188 ( .AN(n993), .B(n991), .C(n990), .Y(n1009) );
  OAI2BB2XLTS U1189 ( .B0(intDY_EWSW[20]), .B1(n992), .A0N(intDX_EWSW[21]), 
        .A1N(n1537), .Y(n1002) );
  AOI22X1TS U1190 ( .A0(intDX_EWSW[17]), .A1(n1552), .B0(intDX_EWSW[16]), .B1(
        n994), .Y(n997) );
  OAI32X1TS U1191 ( .A0(n1055), .A1(n998), .A2(n997), .B0(n996), .B1(n998), 
        .Y(n1001) );
  OAI2BB2XLTS U1192 ( .B0(intDY_EWSW[22]), .B1(n999), .A0N(intDX_EWSW[23]), 
        .A1N(n1545), .Y(n1000) );
  AOI211X1TS U1193 ( .A0(n1003), .A1(n1002), .B0(n1001), .C0(n1000), .Y(n1008)
         );
  NAND2BXLTS U1194 ( .AN(intDX_EWSW[24]), .B(intDY_EWSW[24]), .Y(n1004) );
  NAND4BBX1TS U1195 ( .AN(n1048), .BN(n1006), .C(n1005), .D(n1004), .Y(n1007)
         );
  AOI32X1TS U1196 ( .A0(n1010), .A1(n1009), .A2(n1008), .B0(n1007), .B1(n1010), 
        .Y(n1011) );
  INVX3TS U1197 ( .A(n1102), .Y(n1082) );
  BUFX4TS U1198 ( .A(n1013), .Y(n1105) );
  AOI22X1TS U1199 ( .A0(intDX_EWSW[14]), .A1(n1012), .B0(DmP_EXP_EWSW[14]), 
        .B1(n1105), .Y(n1014) );
  OAI21XLTS U1200 ( .A0(n1541), .A1(n1082), .B0(n1014), .Y(n589) );
  INVX4TS U1201 ( .A(n1102), .Y(n1339) );
  BUFX4TS U1202 ( .A(n1013), .Y(n1279) );
  AOI22X1TS U1203 ( .A0(intDX_EWSW[22]), .A1(n1012), .B0(DmP_EXP_EWSW[22]), 
        .B1(n1279), .Y(n1015) );
  OAI21XLTS U1204 ( .A0(n1503), .A1(n1339), .B0(n1015), .Y(n573) );
  AOI22X1TS U1205 ( .A0(n912), .A1(n1012), .B0(DmP_EXP_EWSW[0]), .B1(n1105), 
        .Y(n1016) );
  OAI21XLTS U1206 ( .A0(n1551), .A1(n1339), .B0(n1016), .Y(n617) );
  AOI22X1TS U1207 ( .A0(intDX_EWSW[19]), .A1(n1012), .B0(DmP_EXP_EWSW[19]), 
        .B1(n1279), .Y(n1017) );
  OAI21XLTS U1208 ( .A0(n1504), .A1(n1339), .B0(n1017), .Y(n579) );
  AOI22X1TS U1209 ( .A0(intDX_EWSW[16]), .A1(n881), .B0(DmP_EXP_EWSW[16]), 
        .B1(n1279), .Y(n1018) );
  OAI21XLTS U1210 ( .A0(n1502), .A1(n1339), .B0(n1018), .Y(n585) );
  AOI22X1TS U1211 ( .A0(intDX_EWSW[5]), .A1(n881), .B0(DmP_EXP_EWSW[5]), .B1(
        n1105), .Y(n1019) );
  OAI21XLTS U1212 ( .A0(n1501), .A1(n1082), .B0(n1019), .Y(n607) );
  AOI22X1TS U1213 ( .A0(intDX_EWSW[6]), .A1(n881), .B0(DmP_EXP_EWSW[6]), .B1(
        n1279), .Y(n1020) );
  OAI21XLTS U1214 ( .A0(n1534), .A1(n1082), .B0(n1020), .Y(n605) );
  AOI22X1TS U1215 ( .A0(intDX_EWSW[4]), .A1(n881), .B0(DmP_EXP_EWSW[4]), .B1(
        n1013), .Y(n1021) );
  OAI21XLTS U1216 ( .A0(n1539), .A1(n1082), .B0(n1021), .Y(n609) );
  AOI22X1TS U1217 ( .A0(intDX_EWSW[17]), .A1(n881), .B0(DmP_EXP_EWSW[17]), 
        .B1(n1279), .Y(n1022) );
  AOI22X1TS U1218 ( .A0(n913), .A1(n881), .B0(DmP_EXP_EWSW[10]), .B1(n1105), 
        .Y(n1023) );
  AOI22X1TS U1219 ( .A0(intDX_EWSW[13]), .A1(n881), .B0(DmP_EXP_EWSW[13]), 
        .B1(n1279), .Y(n1024) );
  OAI21XLTS U1220 ( .A0(n1536), .A1(n1082), .B0(n1024), .Y(n591) );
  AOI22X1TS U1221 ( .A0(intDX_EWSW[20]), .A1(n881), .B0(DmP_EXP_EWSW[20]), 
        .B1(n1279), .Y(n1025) );
  OAI21XLTS U1222 ( .A0(n1542), .A1(n1339), .B0(n1025), .Y(n577) );
  AOI22X1TS U1223 ( .A0(intDX_EWSW[9]), .A1(n881), .B0(DmP_EXP_EWSW[9]), .B1(
        n1105), .Y(n1026) );
  OAI21XLTS U1224 ( .A0(n1535), .A1(n1082), .B0(n1026), .Y(n599) );
  AOI22X1TS U1225 ( .A0(intDX_EWSW[21]), .A1(n881), .B0(DmP_EXP_EWSW[21]), 
        .B1(n1279), .Y(n1027) );
  OAI21XLTS U1226 ( .A0(n1537), .A1(n1339), .B0(n1027), .Y(n575) );
  AOI22X1TS U1227 ( .A0(intDX_EWSW[7]), .A1(n881), .B0(DmP_EXP_EWSW[7]), .B1(
        n1105), .Y(n1028) );
  OAI21XLTS U1228 ( .A0(n1543), .A1(n1082), .B0(n1028), .Y(n603) );
  AOI22X1TS U1229 ( .A0(intDX_EWSW[18]), .A1(n881), .B0(DmP_EXP_EWSW[18]), 
        .B1(n1279), .Y(n1029) );
  OAI21XLTS U1230 ( .A0(n1557), .A1(n1339), .B0(n1029), .Y(n581) );
  AOI22X1TS U1231 ( .A0(intDX_EWSW[1]), .A1(n881), .B0(DmP_EXP_EWSW[1]), .B1(
        n1279), .Y(n1030) );
  OAI21XLTS U1232 ( .A0(n1553), .A1(n1339), .B0(n1030), .Y(n615) );
  AOI22X1TS U1233 ( .A0(n914), .A1(n881), .B0(DmP_EXP_EWSW[2]), .B1(n1279), 
        .Y(n1031) );
  OAI21XLTS U1234 ( .A0(n1538), .A1(n1339), .B0(n1031), .Y(n613) );
  AOI22X1TS U1235 ( .A0(intDX_EWSW[12]), .A1(n881), .B0(DmP_EXP_EWSW[12]), 
        .B1(n1013), .Y(n1032) );
  OAI21XLTS U1236 ( .A0(n1540), .A1(n1082), .B0(n1032), .Y(n593) );
  AOI22X1TS U1237 ( .A0(intDX_EWSW[8]), .A1(n881), .B0(DmP_EXP_EWSW[8]), .B1(
        n1013), .Y(n1033) );
  OAI21XLTS U1238 ( .A0(n1554), .A1(n1082), .B0(n1033), .Y(n601) );
  AOI22X1TS U1239 ( .A0(intDX_EWSW[11]), .A1(n881), .B0(DmP_EXP_EWSW[11]), 
        .B1(n1279), .Y(n1034) );
  OAI21XLTS U1240 ( .A0(n1611), .A1(n1082), .B0(n1034), .Y(n595) );
  AOI22X1TS U1241 ( .A0(intDX_EWSW[3]), .A1(n881), .B0(DmP_EXP_EWSW[3]), .B1(
        n1105), .Y(n1035) );
  OAI21XLTS U1242 ( .A0(n1610), .A1(n1339), .B0(n1035), .Y(n611) );
  AOI22X1TS U1243 ( .A0(DmP_EXP_EWSW[27]), .A1(n1279), .B0(intDX_EWSW[27]), 
        .B1(n881), .Y(n1036) );
  AOI22X1TS U1244 ( .A0(intDX_EWSW[15]), .A1(n881), .B0(DmP_EXP_EWSW[15]), 
        .B1(n1279), .Y(n1037) );
  OAI21XLTS U1245 ( .A0(n1612), .A1(n1082), .B0(n1037), .Y(n587) );
  INVX4TS U1246 ( .A(n1012), .Y(n1341) );
  AOI22X1TS U1247 ( .A0(DMP_EXP_EWSW[23]), .A1(n1279), .B0(intDX_EWSW[23]), 
        .B1(n1102), .Y(n1038) );
  OAI21XLTS U1248 ( .A0(n1545), .A1(n1341), .B0(n1038), .Y(n737) );
  AOI22X1TS U1249 ( .A0(intDX_EWSW[30]), .A1(n1106), .B0(DMP_EXP_EWSW[30]), 
        .B1(n1105), .Y(n1039) );
  OAI21XLTS U1250 ( .A0(n1556), .A1(n1341), .B0(n1039), .Y(n730) );
  AOI22X1TS U1251 ( .A0(intDX_EWSW[29]), .A1(n1106), .B0(DMP_EXP_EWSW[29]), 
        .B1(n1105), .Y(n1040) );
  OAI21XLTS U1252 ( .A0(n1505), .A1(n1341), .B0(n1040), .Y(n731) );
  AOI22X1TS U1253 ( .A0(n908), .A1(n1279), .B0(intDX_EWSW[27]), .B1(n1102), 
        .Y(n1041) );
  OAI21XLTS U1254 ( .A0(n1546), .A1(n1341), .B0(n1041), .Y(n733) );
  AOI22X1TS U1255 ( .A0(intDX_EWSW[28]), .A1(n1106), .B0(DMP_EXP_EWSW[28]), 
        .B1(n1105), .Y(n1042) );
  OAI21XLTS U1256 ( .A0(n1544), .A1(n1341), .B0(n1042), .Y(n732) );
  AOI22X1TS U1257 ( .A0(intDX_EWSW[1]), .A1(n1102), .B0(DMP_EXP_EWSW[1]), .B1(
        n1013), .Y(n1043) );
  OAI21XLTS U1258 ( .A0(n1553), .A1(n1341), .B0(n1043), .Y(n759) );
  AOI22X1TS U1259 ( .A0(intDX_EWSW[3]), .A1(n1102), .B0(DMP_EXP_EWSW[3]), .B1(
        n1013), .Y(n1044) );
  OAI21XLTS U1260 ( .A0(n1610), .A1(n1341), .B0(n1044), .Y(n757) );
  AOI22X1TS U1261 ( .A0(intDX_EWSW[9]), .A1(n1102), .B0(DMP_EXP_EWSW[9]), .B1(
        n1013), .Y(n1045) );
  OAI21XLTS U1262 ( .A0(n1535), .A1(n1341), .B0(n1045), .Y(n751) );
  AOI22X1TS U1263 ( .A0(intDX_EWSW[4]), .A1(n1102), .B0(DMP_EXP_EWSW[4]), .B1(
        n1013), .Y(n1046) );
  OAI22X1TS U1264 ( .A0(n1553), .A1(intDX_EWSW[1]), .B0(n1550), .B1(
        intDX_EWSW[25]), .Y(n1047) );
  AOI221X1TS U1265 ( .A0(n1553), .A1(intDX_EWSW[1]), .B0(intDX_EWSW[25]), .B1(
        n1550), .C0(n1047), .Y(n1053) );
  OAI22X1TS U1266 ( .A0(n1544), .A1(intDX_EWSW[28]), .B0(n1505), .B1(
        intDX_EWSW[29]), .Y(n1049) );
  AOI221X1TS U1267 ( .A0(n1544), .A1(intDX_EWSW[28]), .B0(intDX_EWSW[29]), 
        .B1(n1505), .C0(n1049), .Y(n1051) );
  AOI2BB2XLTS U1268 ( .B0(intDX_EWSW[7]), .B1(n1543), .A0N(n1543), .A1N(
        intDX_EWSW[7]), .Y(n1050) );
  NAND4XLTS U1269 ( .A(n1053), .B(n1052), .C(n1051), .D(n1050), .Y(n1081) );
  OAI22X1TS U1270 ( .A0(n1556), .A1(intDX_EWSW[30]), .B0(n1552), .B1(
        intDX_EWSW[17]), .Y(n1054) );
  OAI22X1TS U1271 ( .A0(n1542), .A1(intDX_EWSW[20]), .B0(n1537), .B1(
        intDX_EWSW[21]), .Y(n1056) );
  OAI22X1TS U1272 ( .A0(n1503), .A1(intDX_EWSW[22]), .B0(n1545), .B1(
        intDX_EWSW[23]), .Y(n1057) );
  NAND4XLTS U1273 ( .A(n1061), .B(n1060), .C(n1059), .D(n1058), .Y(n1080) );
  OAI22X1TS U1274 ( .A0(n1490), .A1(intDX_EWSW[24]), .B0(n1535), .B1(
        intDX_EWSW[9]), .Y(n1062) );
  AOI221X1TS U1275 ( .A0(n1490), .A1(intDX_EWSW[24]), .B0(intDX_EWSW[9]), .B1(
        n1535), .C0(n1062), .Y(n1069) );
  OAI22X1TS U1276 ( .A0(n1540), .A1(intDX_EWSW[12]), .B0(n1536), .B1(
        intDX_EWSW[13]), .Y(n1064) );
  OAI22X1TS U1277 ( .A0(n1541), .A1(intDX_EWSW[14]), .B0(n1612), .B1(
        intDX_EWSW[15]), .Y(n1065) );
  NAND4XLTS U1278 ( .A(n1069), .B(n1068), .C(n1067), .D(n1066), .Y(n1079) );
  OAI22X1TS U1279 ( .A0(n1502), .A1(intDX_EWSW[16]), .B0(n1551), .B1(n912), 
        .Y(n1070) );
  AOI221X1TS U1280 ( .A0(n1502), .A1(intDX_EWSW[16]), .B0(n912), .B1(n1551), 
        .C0(n1070), .Y(n1077) );
  OAI22X1TS U1281 ( .A0(n1538), .A1(n914), .B0(n1610), .B1(intDX_EWSW[3]), .Y(
        n1071) );
  OAI22X1TS U1282 ( .A0(n1539), .A1(intDX_EWSW[4]), .B0(n1501), .B1(
        intDX_EWSW[5]), .Y(n1072) );
  AOI221X1TS U1283 ( .A0(n1539), .A1(intDX_EWSW[4]), .B0(intDX_EWSW[5]), .B1(
        n1501), .C0(n1072), .Y(n1075) );
  OAI22X1TS U1284 ( .A0(n1554), .A1(intDX_EWSW[8]), .B0(n1534), .B1(
        intDX_EWSW[6]), .Y(n1073) );
  AOI221X1TS U1285 ( .A0(n1554), .A1(intDX_EWSW[8]), .B0(intDX_EWSW[6]), .B1(
        n1534), .C0(n1073), .Y(n1074) );
  NAND4XLTS U1286 ( .A(n1077), .B(n1076), .C(n1075), .D(n1074), .Y(n1078) );
  NOR4X1TS U1287 ( .A(n1081), .B(n1080), .C(n1079), .D(n1078), .Y(n1335) );
  CLKXOR2X2TS U1288 ( .A(intDY_EWSW[31]), .B(intAS), .Y(n1333) );
  INVX2TS U1289 ( .A(n1333), .Y(n1085) );
  AOI22X1TS U1290 ( .A0(intDX_EWSW[31]), .A1(n1083), .B0(SIGN_FLAG_EXP), .B1(
        n1279), .Y(n1084) );
  AOI22X1TS U1291 ( .A0(intDX_EWSW[17]), .A1(n1106), .B0(DMP_EXP_EWSW[17]), 
        .B1(n1105), .Y(n1086) );
  OAI21XLTS U1292 ( .A0(n1552), .A1(n1108), .B0(n1086), .Y(n743) );
  AOI22X1TS U1293 ( .A0(intDX_EWSW[22]), .A1(n1106), .B0(DMP_EXP_EWSW[22]), 
        .B1(n1105), .Y(n1087) );
  OAI21XLTS U1294 ( .A0(n1503), .A1(n1108), .B0(n1087), .Y(n738) );
  AOI22X1TS U1295 ( .A0(intDX_EWSW[13]), .A1(n1106), .B0(DMP_EXP_EWSW[13]), 
        .B1(n1013), .Y(n1088) );
  OAI21XLTS U1296 ( .A0(n1536), .A1(n1108), .B0(n1088), .Y(n747) );
  AOI22X1TS U1297 ( .A0(intDX_EWSW[15]), .A1(n1102), .B0(DMP_EXP_EWSW[15]), 
        .B1(n1013), .Y(n1089) );
  OAI21XLTS U1298 ( .A0(n1612), .A1(n1108), .B0(n1089), .Y(n745) );
  AOI22X1TS U1299 ( .A0(intDX_EWSW[12]), .A1(n1106), .B0(DMP_EXP_EWSW[12]), 
        .B1(n1013), .Y(n1090) );
  OAI21XLTS U1300 ( .A0(n1540), .A1(n1108), .B0(n1090), .Y(n748) );
  AOI22X1TS U1301 ( .A0(intDX_EWSW[14]), .A1(n1102), .B0(DMP_EXP_EWSW[14]), 
        .B1(n1013), .Y(n1091) );
  OAI21XLTS U1302 ( .A0(n1541), .A1(n1108), .B0(n1091), .Y(n746) );
  AOI22X1TS U1303 ( .A0(intDX_EWSW[8]), .A1(n1106), .B0(DMP_EXP_EWSW[8]), .B1(
        n1013), .Y(n1092) );
  OAI21XLTS U1304 ( .A0(n1554), .A1(n1108), .B0(n1092), .Y(n752) );
  AOI22X1TS U1305 ( .A0(intDX_EWSW[18]), .A1(n1106), .B0(DMP_EXP_EWSW[18]), 
        .B1(n1105), .Y(n1093) );
  AOI22X1TS U1306 ( .A0(intDX_EWSW[7]), .A1(n1102), .B0(DMP_EXP_EWSW[7]), .B1(
        n1013), .Y(n1094) );
  OAI21XLTS U1307 ( .A0(n1543), .A1(n1108), .B0(n1094), .Y(n753) );
  AOI22X1TS U1308 ( .A0(intDX_EWSW[6]), .A1(n1102), .B0(DMP_EXP_EWSW[6]), .B1(
        n1013), .Y(n1095) );
  OAI21XLTS U1309 ( .A0(n1534), .A1(n1108), .B0(n1095), .Y(n754) );
  AOI22X1TS U1310 ( .A0(intDX_EWSW[19]), .A1(n1106), .B0(DMP_EXP_EWSW[19]), 
        .B1(n1105), .Y(n1096) );
  OAI21XLTS U1311 ( .A0(n1504), .A1(n1108), .B0(n1096), .Y(n741) );
  AOI22X1TS U1312 ( .A0(intDX_EWSW[5]), .A1(n1102), .B0(DMP_EXP_EWSW[5]), .B1(
        n1013), .Y(n1097) );
  OAI21XLTS U1313 ( .A0(n1501), .A1(n1108), .B0(n1097), .Y(n755) );
  AOI22X1TS U1314 ( .A0(n914), .A1(n1102), .B0(DMP_EXP_EWSW[2]), .B1(n1013), 
        .Y(n1098) );
  OAI21XLTS U1315 ( .A0(n1538), .A1(n1108), .B0(n1098), .Y(n758) );
  AOI22X1TS U1316 ( .A0(intDX_EWSW[16]), .A1(n1106), .B0(DMP_EXP_EWSW[16]), 
        .B1(n1105), .Y(n1099) );
  OAI21XLTS U1317 ( .A0(n1502), .A1(n1108), .B0(n1099), .Y(n744) );
  AOI22X1TS U1318 ( .A0(n912), .A1(n1106), .B0(DMP_EXP_EWSW[0]), .B1(n1013), 
        .Y(n1100) );
  OAI21XLTS U1319 ( .A0(n1551), .A1(n1108), .B0(n1100), .Y(n760) );
  AOI22X1TS U1320 ( .A0(intDX_EWSW[11]), .A1(n1106), .B0(DMP_EXP_EWSW[11]), 
        .B1(n1105), .Y(n1101) );
  OAI21XLTS U1321 ( .A0(n1611), .A1(n1108), .B0(n1101), .Y(n749) );
  AOI22X1TS U1322 ( .A0(n913), .A1(n1102), .B0(DMP_EXP_EWSW[10]), .B1(n1013), 
        .Y(n1103) );
  OAI21XLTS U1323 ( .A0(n883), .A1(n1108), .B0(n1103), .Y(n750) );
  AOI22X1TS U1324 ( .A0(intDX_EWSW[20]), .A1(n1106), .B0(DMP_EXP_EWSW[20]), 
        .B1(n1105), .Y(n1104) );
  OAI21XLTS U1325 ( .A0(n1542), .A1(n1108), .B0(n1104), .Y(n740) );
  AOI22X1TS U1326 ( .A0(intDX_EWSW[21]), .A1(n1106), .B0(DMP_EXP_EWSW[21]), 
        .B1(n1105), .Y(n1107) );
  OAI21XLTS U1327 ( .A0(n1537), .A1(n1108), .B0(n1107), .Y(n739) );
  AOI222X1TS U1328 ( .A0(n881), .A1(intDX_EWSW[23]), .B0(DmP_EXP_EWSW[23]), 
        .B1(n1013), .C0(intDY_EWSW[23]), .C1(n1102), .Y(n1109) );
  INVX2TS U1329 ( .A(n1109), .Y(n571) );
  AOI2BB2XLTS U1330 ( .B0(beg_OP), .B1(n1500), .A0N(n1500), .A1N(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .Y(n1110) );
  NAND3XLTS U1331 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n1500), .C(
        n1530), .Y(n1275) );
  OAI21XLTS U1332 ( .A0(n1278), .A1(n1110), .B0(n1275), .Y(n877) );
  NAND2X2TS U1333 ( .A(n1351), .B(n1580), .Y(n1313) );
  NOR3X1TS U1334 ( .A(Raw_mant_NRM_SWR[17]), .B(Raw_mant_NRM_SWR[15]), .C(
        Raw_mant_NRM_SWR[16]), .Y(n1258) );
  NOR2BX1TS U1335 ( .AN(n1129), .B(Raw_mant_NRM_SWR[18]), .Y(n1257) );
  NAND2X1TS U1336 ( .A(n1258), .B(n1257), .Y(n1125) );
  OR2X1TS U1337 ( .A(n1125), .B(Raw_mant_NRM_SWR[14]), .Y(n1256) );
  NAND2X1TS U1338 ( .A(n1139), .B(n1485), .Y(n1131) );
  NOR2X1TS U1339 ( .A(Raw_mant_NRM_SWR[12]), .B(n1131), .Y(n1122) );
  NAND2X1TS U1340 ( .A(n1122), .B(n1486), .Y(n1111) );
  NOR2X1TS U1341 ( .A(Raw_mant_NRM_SWR[4]), .B(Raw_mant_NRM_SWR[5]), .Y(n1113)
         );
  NOR3X1TS U1342 ( .A(Raw_mant_NRM_SWR[8]), .B(Raw_mant_NRM_SWR[9]), .C(n1111), 
        .Y(n1114) );
  NAND2X1TS U1343 ( .A(n1114), .B(n1512), .Y(n1121) );
  OAI22X1TS U1344 ( .A0(n1112), .A1(n1111), .B0(n1113), .B1(n1121), .Y(n1119)
         );
  NOR2X1TS U1345 ( .A(Raw_mant_NRM_SWR[3]), .B(Raw_mant_NRM_SWR[2]), .Y(n1116)
         );
  NAND2X1TS U1346 ( .A(n1265), .B(n1113), .Y(n1117) );
  OAI21XLTS U1347 ( .A0(Raw_mant_NRM_SWR[6]), .A1(Raw_mant_NRM_SWR[7]), .B0(
        n1114), .Y(n1115) );
  OAI21X1TS U1348 ( .A0(n1116), .A1(n1117), .B0(n1115), .Y(n1144) );
  INVX2TS U1349 ( .A(n1117), .Y(n1264) );
  NAND3XLTS U1350 ( .A(n1264), .B(n1116), .C(Raw_mant_NRM_SWR[1]), .Y(n1260)
         );
  OAI21XLTS U1351 ( .A0(n1497), .A1(n1117), .B0(n1260), .Y(n1118) );
  OAI31X1TS U1352 ( .A0(n1119), .A1(n1144), .A2(n1118), .B0(n1352), .Y(n1255)
         );
  NAND3XLTS U1353 ( .A(n1350), .B(Shift_amount_SHT1_EWR[4]), .C(n1351), .Y(
        n1120) );
  OAI211XLTS U1354 ( .A0(n1313), .A1(n1515), .B0(n1255), .C0(n1120), .Y(n774)
         );
  INVX2TS U1355 ( .A(n1121), .Y(n1133) );
  NOR2BX1TS U1356 ( .AN(n1122), .B(n1486), .Y(n1262) );
  AOI21X1TS U1357 ( .A0(n1129), .A1(Raw_mant_NRM_SWR[18]), .B0(n1262), .Y(
        n1140) );
  OAI32X1TS U1358 ( .A0(Raw_mant_NRM_SWR[3]), .A1(Raw_mant_NRM_SWR[1]), .A2(
        n1497), .B0(n1516), .B1(Raw_mant_NRM_SWR[3]), .Y(n1123) );
  NAND2X1TS U1359 ( .A(Raw_mant_NRM_SWR[12]), .B(n1139), .Y(n1263) );
  NOR2X1TS U1360 ( .A(n1487), .B(n1125), .Y(n1145) );
  INVX2TS U1361 ( .A(n1145), .Y(n1127) );
  AOI32X1TS U1362 ( .A0(Raw_mant_NRM_SWR[20]), .A1(n1484), .A2(n1495), .B0(
        Raw_mant_NRM_SWR[22]), .B1(n1484), .Y(n1126) );
  AOI32X1TS U1363 ( .A0(n1489), .A1(n1127), .A2(n1126), .B0(
        Raw_mant_NRM_SWR[25]), .B1(n1127), .Y(n1128) );
  OAI31X1TS U1364 ( .A0(Raw_mant_NRM_SWR[9]), .A1(n1131), .A2(n1519), .B0(
        n1130), .Y(n1132) );
  NAND2X2TS U1365 ( .A(n1352), .B(n1167), .Y(n1298) );
  NOR2BX1TS U1366 ( .AN(Shift_amount_SHT1_EWR[0]), .B(n1352), .Y(n1199) );
  AOI22X1TS U1367 ( .A0(Raw_mant_NRM_SWR[24]), .A1(n1134), .B0(n1296), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n1156) );
  NOR2XLTS U1368 ( .A(Raw_mant_NRM_SWR[23]), .B(Raw_mant_NRM_SWR[22]), .Y(
        n1138) );
  NOR2X1TS U1369 ( .A(Raw_mant_NRM_SWR[21]), .B(Raw_mant_NRM_SWR[20]), .Y(
        n1136) );
  NOR2XLTS U1370 ( .A(Raw_mant_NRM_SWR[17]), .B(Raw_mant_NRM_SWR[16]), .Y(
        n1135) );
  AOI211X1TS U1371 ( .A0(n1138), .A1(n1137), .B0(Raw_mant_NRM_SWR[24]), .C0(
        Raw_mant_NRM_SWR[25]), .Y(n1143) );
  INVX2TS U1372 ( .A(n1139), .Y(n1141) );
  OAI31X1TS U1373 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n1485), .A2(n1141), .B0(
        n1140), .Y(n1142) );
  AOI21X1TS U1374 ( .A0(Shift_amount_SHT1_EWR[1]), .A1(n1351), .B0(n1272), .Y(
        n1150) );
  NAND2X1TS U1375 ( .A(n1150), .B(n1313), .Y(n1146) );
  INVX2TS U1376 ( .A(n1313), .Y(n1227) );
  BUFX4TS U1377 ( .A(n1227), .Y(n1310) );
  INVX2TS U1378 ( .A(n1149), .Y(n1305) );
  AOI22X1TS U1379 ( .A0(n1310), .A1(Data_array_SWR[1]), .B0(
        Raw_mant_NRM_SWR[23]), .B1(n1305), .Y(n1155) );
  NOR2X2TS U1380 ( .A(n1310), .B(n1150), .Y(n1307) );
  AOI22X1TS U1381 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n1147), .B0(n1296), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n1153) );
  AOI22X1TS U1382 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n1152) );
  NAND2X1TS U1383 ( .A(n1153), .B(n1152), .Y(n1173) );
  NAND2X1TS U1384 ( .A(n1307), .B(n1173), .Y(n1154) );
  OAI211XLTS U1385 ( .A0(n1156), .A1(n1304), .B0(n1155), .C0(n1154), .Y(n779)
         );
  AOI22X1TS U1386 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n1147), .B0(n1296), .B1(
        n907), .Y(n1158) );
  AOI22X1TS U1387 ( .A0(Raw_mant_NRM_SWR[19]), .A1(n1134), .B0(n1300), .B1(
        n903), .Y(n1157) );
  NAND2X1TS U1388 ( .A(n1158), .B(n1157), .Y(n1170) );
  AOI22X1TS U1389 ( .A0(n1227), .A1(Data_array_SWR[4]), .B0(n1307), .B1(n1170), 
        .Y(n1160) );
  NAND2X1TS U1390 ( .A(Raw_mant_NRM_SWR[20]), .B(n1305), .Y(n1159) );
  OAI211XLTS U1391 ( .A0(n1182), .A1(n1304), .B0(n1160), .C0(n1159), .Y(n782)
         );
  AOI22X1TS U1392 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n1147), .B0(n1296), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n1162) );
  AOI22X1TS U1393 ( .A0(Raw_mant_NRM_SWR[18]), .A1(n1134), .B0(n1300), .B1(
        n907), .Y(n1161) );
  NAND2X1TS U1394 ( .A(n1162), .B(n1161), .Y(n1166) );
  AOI22X1TS U1395 ( .A0(n1227), .A1(Data_array_SWR[5]), .B0(n1307), .B1(n1166), 
        .Y(n1164) );
  NAND2X1TS U1396 ( .A(Raw_mant_NRM_SWR[19]), .B(n1305), .Y(n1163) );
  OAI211XLTS U1397 ( .A0(n1176), .A1(n1304), .B0(n1164), .C0(n1163), .Y(n783)
         );
  INVX2TS U1398 ( .A(n1304), .Y(n1179) );
  AOI22X1TS U1399 ( .A0(n1227), .A1(Data_array_SWR[7]), .B0(n1179), .B1(n1166), 
        .Y(n1169) );
  NAND2BX1TS U1400 ( .AN(n1167), .B(n1272), .Y(n1205) );
  NAND2X1TS U1401 ( .A(Raw_mant_NRM_SWR[15]), .B(n1226), .Y(n1168) );
  OAI211XLTS U1402 ( .A0(n1198), .A1(n1165), .B0(n1169), .C0(n1168), .Y(n785)
         );
  AOI22X1TS U1403 ( .A0(n1227), .A1(Data_array_SWR[6]), .B0(n1179), .B1(n1170), 
        .Y(n1172) );
  NAND2X1TS U1404 ( .A(Raw_mant_NRM_SWR[16]), .B(n1226), .Y(n1171) );
  OAI211XLTS U1405 ( .A0(n1193), .A1(n1165), .B0(n1172), .C0(n1171), .Y(n784)
         );
  AOI22X1TS U1406 ( .A0(n1227), .A1(Data_array_SWR[3]), .B0(n1179), .B1(n1173), 
        .Y(n1175) );
  NAND2X1TS U1407 ( .A(Raw_mant_NRM_SWR[19]), .B(n1226), .Y(n1174) );
  AOI22X1TS U1408 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n1147), .B0(n1296), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n1178) );
  AOI22X1TS U1409 ( .A0(Raw_mant_NRM_SWR[23]), .A1(n1134), .B0(n1300), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n1177) );
  NAND2X1TS U1410 ( .A(n1178), .B(n1177), .Y(n1306) );
  AOI22X1TS U1411 ( .A0(n1310), .A1(Data_array_SWR[2]), .B0(n1179), .B1(n1306), 
        .Y(n1181) );
  NAND2X1TS U1412 ( .A(Raw_mant_NRM_SWR[20]), .B(n1226), .Y(n1180) );
  OAI211XLTS U1413 ( .A0(n1182), .A1(n1165), .B0(n1181), .C0(n1180), .Y(n780)
         );
  INVX2TS U1414 ( .A(n1147), .Y(n1209) );
  AOI22X1TS U1415 ( .A0(n1300), .A1(DmP_mant_SHT1_SW[21]), .B0(n1296), .B1(
        n909), .Y(n1183) );
  AOI21X1TS U1416 ( .A0(Raw_mant_NRM_SWR[2]), .A1(n1134), .B0(n1184), .Y(n1292) );
  OAI22X1TS U1417 ( .A0(n1214), .A1(n1304), .B0(n1558), .B1(n1149), .Y(n1185)
         );
  AOI21X1TS U1418 ( .A0(n1310), .A1(Data_array_SWR[19]), .B0(n1185), .Y(n1186)
         );
  OAI21XLTS U1419 ( .A0(n1292), .A1(n1165), .B0(n1186), .Y(n799) );
  AOI22X1TS U1420 ( .A0(Raw_mant_NRM_SWR[4]), .A1(n1147), .B0(n1296), .B1(n906), .Y(n1187) );
  OAI21XLTS U1421 ( .A0(n1517), .A1(n1298), .B0(n1187), .Y(n1188) );
  AOI21X1TS U1422 ( .A0(n1300), .A1(DmP_mant_SHT1_SW[18]), .B0(n1188), .Y(
        n1202) );
  OAI22X1TS U1423 ( .A0(n1206), .A1(n1304), .B0(n1563), .B1(n1149), .Y(n1189)
         );
  AOI21X1TS U1424 ( .A0(n1310), .A1(n910), .B0(n1189), .Y(n1190) );
  OAI21XLTS U1425 ( .A0(n1202), .A1(n1165), .B0(n1190), .Y(n796) );
  AOI22X1TS U1426 ( .A0(n1300), .A1(DmP_mant_SHT1_SW[8]), .B0(n1296), .B1(n905), .Y(n1191) );
  OAI21XLTS U1427 ( .A0(n1487), .A1(n1209), .B0(n1191), .Y(n1192) );
  AOI21X1TS U1428 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n1134), .B0(n1192), .Y(
        n1303) );
  OAI22X1TS U1429 ( .A0(n1193), .A1(n1304), .B0(n1508), .B1(n1149), .Y(n1194)
         );
  AOI21X1TS U1430 ( .A0(n1310), .A1(Data_array_SWR[8]), .B0(n1194), .Y(n1195)
         );
  OAI21XLTS U1431 ( .A0(n1303), .A1(n1165), .B0(n1195), .Y(n786) );
  AOI22X1TS U1432 ( .A0(n1227), .A1(Data_array_SWR[9]), .B0(
        Raw_mant_NRM_SWR[13]), .B1(n1226), .Y(n1197) );
  AOI2BB2XLTS U1433 ( .B0(Raw_mant_NRM_SWR[15]), .B1(n1305), .A0N(n1232), 
        .A1N(n1165), .Y(n1196) );
  OAI211XLTS U1434 ( .A0(n1198), .A1(n1304), .B0(n1197), .C0(n1196), .Y(n787)
         );
  OAI22X1TS U1435 ( .A0(n1211), .A1(n1165), .B0(n1516), .B1(n1205), .Y(n1200)
         );
  AOI21X1TS U1436 ( .A0(n1310), .A1(Data_array_SWR[18]), .B0(n1200), .Y(n1201)
         );
  OAI21XLTS U1437 ( .A0(n1202), .A1(n1304), .B0(n1201), .Y(n798) );
  AOI22X1TS U1438 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n1147), .B0(
        DmP_mant_SHT1_SW[15]), .B1(n1296), .Y(n1203) );
  AOI21X1TS U1439 ( .A0(DmP_mant_SHT1_SW[14]), .A1(n1300), .B0(n1204), .Y(
        n1295) );
  OAI22X1TS U1440 ( .A0(n1206), .A1(n1165), .B0(n1563), .B1(n1205), .Y(n1207)
         );
  AOI21X1TS U1441 ( .A0(n1310), .A1(Data_array_SWR[15]), .B0(n1207), .Y(n1208)
         );
  OAI21XLTS U1442 ( .A0(n1295), .A1(n1304), .B0(n1208), .Y(n794) );
  OAI22X1TS U1443 ( .A0(n1497), .A1(n1209), .B0(n1564), .B1(n1298), .Y(n1210)
         );
  AOI211X1TS U1444 ( .A0(n909), .A1(n1351), .B0(n1296), .C0(n1210), .Y(n1290)
         );
  OAI22X1TS U1445 ( .A0(n1290), .A1(n1165), .B0(n1211), .B1(n1304), .Y(n1212)
         );
  AOI21X1TS U1446 ( .A0(n1310), .A1(Data_array_SWR[20]), .B0(n1212), .Y(n1213)
         );
  OAI21XLTS U1447 ( .A0(n1516), .A1(n1149), .B0(n1213), .Y(n800) );
  AOI22X1TS U1448 ( .A0(n1310), .A1(Data_array_SWR[17]), .B0(
        Raw_mant_NRM_SWR[3]), .B1(n1226), .Y(n1216) );
  OA22X1TS U1449 ( .A0(n1517), .A1(n1149), .B0(n1214), .B1(n1165), .Y(n1215)
         );
  OAI211XLTS U1450 ( .A0(n1219), .A1(n1304), .B0(n1216), .C0(n1215), .Y(n797)
         );
  AOI22X1TS U1451 ( .A0(n1310), .A1(Data_array_SWR[14]), .B0(
        Raw_mant_NRM_SWR[7]), .B1(n1226), .Y(n1218) );
  OA22X1TS U1452 ( .A0(n1488), .A1(n1149), .B0(n1222), .B1(n1165), .Y(n1217)
         );
  OAI211XLTS U1453 ( .A0(n1223), .A1(n1304), .B0(n1218), .C0(n1217), .Y(n793)
         );
  AOI22X1TS U1454 ( .A0(n1310), .A1(Data_array_SWR[16]), .B0(
        Raw_mant_NRM_SWR[5]), .B1(n1226), .Y(n1221) );
  OA22X1TS U1455 ( .A0(n1512), .A1(n1149), .B0(n1219), .B1(n1165), .Y(n1220)
         );
  OAI211XLTS U1456 ( .A0(n1222), .A1(n1304), .B0(n1221), .C0(n1220), .Y(n795)
         );
  AOI22X1TS U1457 ( .A0(n1310), .A1(Data_array_SWR[12]), .B0(
        Raw_mant_NRM_SWR[9]), .B1(n1226), .Y(n1225) );
  OA22X1TS U1458 ( .A0(n1485), .A1(n1149), .B0(n1223), .B1(n1165), .Y(n1224)
         );
  OAI211XLTS U1459 ( .A0(n1228), .A1(n1304), .B0(n1225), .C0(n1224), .Y(n791)
         );
  AOI22X1TS U1460 ( .A0(n1227), .A1(n911), .B0(Raw_mant_NRM_SWR[11]), .B1(
        n1226), .Y(n1231) );
  OA22X1TS U1461 ( .A0(n1491), .A1(n1149), .B0(n1228), .B1(n1165), .Y(n1230)
         );
  OAI211XLTS U1462 ( .A0(n1232), .A1(n1304), .B0(n1231), .C0(n1230), .Y(n789)
         );
  BUFX4TS U1463 ( .A(OP_FLAG_SFG), .Y(n1384) );
  AOI2BB2X1TS U1464 ( .B0(DmP_mant_SFG_SWR[2]), .B1(n1384), .A0N(n1384), .A1N(
        DmP_mant_SFG_SWR[2]), .Y(n1377) );
  NAND2X1TS U1465 ( .A(n1377), .B(DMP_SFG[0]), .Y(n1376) );
  INVX2TS U1466 ( .A(n1376), .Y(n1233) );
  INVX2TS U1467 ( .A(n1234), .Y(n1244) );
  AND4X1TS U1468 ( .A(exp_rslt_NRM2_EW1[3]), .B(n1235), .C(
        exp_rslt_NRM2_EW1[2]), .D(exp_rslt_NRM2_EW1[1]), .Y(n1236) );
  NAND3XLTS U1469 ( .A(n1237), .B(exp_rslt_NRM2_EW1[4]), .C(n1236), .Y(n1238)
         );
  NAND2BXLTS U1470 ( .AN(n1238), .B(n1273), .Y(n1239) );
  NOR2XLTS U1471 ( .A(n1244), .B(n1239), .Y(n1243) );
  INVX2TS U1472 ( .A(n1240), .Y(n1241) );
  CLKAND2X2TS U1473 ( .A(n1559), .B(n1241), .Y(n1242) );
  OAI2BB1X1TS U1474 ( .A0N(n1243), .A1N(n1242), .B0(Shift_reg_FLAGS_7[0]), .Y(
        n1388) );
  OAI2BB2XLTS U1475 ( .B0(n1388), .B1(n1244), .A0N(final_result_ieee[30]), 
        .A1N(n1451), .Y(n761) );
  INVX2TS U1476 ( .A(n1245), .Y(n1389) );
  NOR2XLTS U1477 ( .A(n1389), .B(SIGN_FLAG_SHT1SHT2), .Y(n1246) );
  OAI2BB2XLTS U1478 ( .B0(n1246), .B1(n1388), .A0N(n1451), .A1N(
        final_result_ieee[31]), .Y(n550) );
  AOI22X1TS U1479 ( .A0(DmP_mant_SFG_SWR[4]), .A1(n915), .B0(n1384), .B1(n930), 
        .Y(intadd_17_B_0_) );
  AOI21X1TS U1480 ( .A0(intadd_17_A_1_), .A1(n900), .B0(intadd_17_B_0_), .Y(
        n1247) );
  AOI2BB2X1TS U1481 ( .B0(DMP_SFG[2]), .B1(n1247), .A0N(intadd_17_A_1_), .A1N(
        n900), .Y(n1248) );
  AOI22X1TS U1482 ( .A0(DmP_mant_SFG_SWR[8]), .A1(n1607), .B0(n1384), .B1(n931), .Y(intadd_16_B_0_) );
  AOI21X1TS U1483 ( .A0(intadd_16_A_1_), .A1(n901), .B0(intadd_16_B_0_), .Y(
        n1250) );
  AOI2BB2X1TS U1484 ( .B0(DMP_SFG[6]), .B1(n1250), .A0N(intadd_16_A_1_), .A1N(
        n901), .Y(n1251) );
  AOI222X1TS U1485 ( .A0(n1251), .A1(intadd_16_A_2_), .B0(n1251), .B1(
        intadd_16_B_2_), .C0(intadd_16_A_2_), .C1(intadd_16_B_2_), .Y(n1252)
         );
  INVX2TS U1486 ( .A(n1253), .Y(n1254) );
  NAND2X1TS U1487 ( .A(n1514), .B(n1254), .Y(DP_OP_15J21_123_3116_n8) );
  MX2X1TS U1488 ( .A(DMP_exp_NRM2_EW[7]), .B(DMP_exp_NRM_EW[7]), .S0(n1352), 
        .Y(n618) );
  MX2X1TS U1489 ( .A(DMP_exp_NRM2_EW[6]), .B(DMP_exp_NRM_EW[6]), .S0(n1352), 
        .Y(n623) );
  MX2X1TS U1490 ( .A(DMP_exp_NRM2_EW[5]), .B(DMP_exp_NRM_EW[5]), .S0(n1352), 
        .Y(n628) );
  MX2X1TS U1491 ( .A(DMP_exp_NRM2_EW[4]), .B(DMP_exp_NRM_EW[4]), .S0(n1352), 
        .Y(n633) );
  MX2X1TS U1492 ( .A(DMP_exp_NRM2_EW[3]), .B(DMP_exp_NRM_EW[3]), .S0(n1352), 
        .Y(n638) );
  MX2X1TS U1493 ( .A(DMP_exp_NRM2_EW[2]), .B(DMP_exp_NRM_EW[2]), .S0(n1352), 
        .Y(n643) );
  MX2X1TS U1494 ( .A(DMP_exp_NRM2_EW[1]), .B(DMP_exp_NRM_EW[1]), .S0(n1352), 
        .Y(n648) );
  MX2X1TS U1495 ( .A(DMP_exp_NRM2_EW[0]), .B(DMP_exp_NRM_EW[0]), .S0(n1352), 
        .Y(n653) );
  OAI2BB1X1TS U1496 ( .A0N(LZD_output_NRM2_EW[4]), .A1N(n1351), .B0(n1255), 
        .Y(n524) );
  AO21XLTS U1497 ( .A0(n1485), .A1(n1491), .B0(n1256), .Y(n1266) );
  OAI2BB1X1TS U1498 ( .A0N(n1258), .A1N(n1487), .B0(n1257), .Y(n1259) );
  NAND4XLTS U1499 ( .A(n1352), .B(n1266), .C(n1260), .D(n1259), .Y(n1261) );
  NOR3BX1TS U1500 ( .AN(n1263), .B(n1262), .C(n1261), .Y(n1315) );
  AOI2BB1XLTS U1501 ( .A0N(n1352), .A1N(LZD_output_NRM2_EW[3]), .B0(n1315), 
        .Y(n517) );
  AOI22X1TS U1502 ( .A0(n1265), .A1(Raw_mant_NRM_SWR[5]), .B0(n1264), .B1(
        Raw_mant_NRM_SWR[3]), .Y(n1267) );
  OAI211XLTS U1503 ( .A0(n1269), .A1(n1268), .B0(n1267), .C0(n1266), .Y(n1270)
         );
  OAI21X1TS U1504 ( .A0(n1271), .A1(n1270), .B0(n1352), .Y(n1311) );
  OAI2BB1X1TS U1505 ( .A0N(LZD_output_NRM2_EW[2]), .A1N(n1351), .B0(n1311), 
        .Y(n520) );
  AO21XLTS U1506 ( .A0(LZD_output_NRM2_EW[1]), .A1(n1351), .B0(n1272), .Y(n525) );
  AO21XLTS U1507 ( .A0(LZD_output_NRM2_EW[0]), .A1(n1351), .B0(n1147), .Y(n521) );
  OA22X1TS U1508 ( .A0(n1274), .A1(n1273), .B0(Shift_reg_FLAGS_7[0]), .B1(
        final_result_ieee[29]), .Y(n762) );
  OA21XLTS U1509 ( .A0(Shift_reg_FLAGS_7[0]), .A1(overflow_flag), .B0(n1388), 
        .Y(n565) );
  INVX2TS U1510 ( .A(n1278), .Y(n1276) );
  AOI22X1TS U1511 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n1276), .B1(n1500), .Y(
        inst_FSM_INPUT_ENABLE_state_next_1_) );
  NAND2X1TS U1512 ( .A(n1276), .B(n1275), .Y(n878) );
  NOR2XLTS U1513 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .Y(n1277) );
  AOI32X4TS U1514 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B0(n1277), .B1(n1530), .Y(n1281)
         );
  INVX2TS U1515 ( .A(n1281), .Y(n1280) );
  AOI22X1TS U1516 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n1278), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B1(n1500), .Y(n1282) );
  AO22XLTS U1517 ( .A0(n1280), .A1(Shift_reg_FLAGS_7_6), .B0(n1281), .B1(n1282), .Y(n876) );
  AOI22X1TS U1518 ( .A0(n1281), .A1(n1279), .B0(n1348), .B1(n1280), .Y(n875)
         );
  AOI22X1TS U1519 ( .A0(n1281), .A1(n1346), .B0(n1580), .B1(n1280), .Y(n874)
         );
  AOI22X1TS U1520 ( .A0(n1281), .A1(n1608), .B0(n1351), .B1(n1280), .Y(n871)
         );
  AOI22X1TS U1521 ( .A0(n1281), .A1(n1351), .B0(n1451), .B1(n1280), .Y(n870)
         );
  AO22XLTS U1522 ( .A0(n1284), .A1(Data_X[0]), .B0(n1283), .B1(n912), .Y(n869)
         );
  AO22XLTS U1523 ( .A0(n1287), .A1(Data_X[1]), .B0(n1289), .B1(intDX_EWSW[1]), 
        .Y(n868) );
  AO22XLTS U1524 ( .A0(n1287), .A1(Data_X[2]), .B0(n1285), .B1(n914), .Y(n867)
         );
  AO22XLTS U1525 ( .A0(n1287), .A1(Data_X[3]), .B0(n1289), .B1(intDX_EWSW[3]), 
        .Y(n866) );
  AO22XLTS U1526 ( .A0(n1287), .A1(Data_X[4]), .B0(n1283), .B1(intDX_EWSW[4]), 
        .Y(n865) );
  AO22XLTS U1527 ( .A0(n1284), .A1(Data_X[5]), .B0(n1285), .B1(intDX_EWSW[5]), 
        .Y(n864) );
  AO22XLTS U1528 ( .A0(n1284), .A1(Data_X[6]), .B0(n1285), .B1(intDX_EWSW[6]), 
        .Y(n863) );
  AO22XLTS U1529 ( .A0(n1286), .A1(Data_X[7]), .B0(n1283), .B1(intDX_EWSW[7]), 
        .Y(n862) );
  AO22XLTS U1530 ( .A0(n1286), .A1(Data_X[8]), .B0(n1285), .B1(intDX_EWSW[8]), 
        .Y(n861) );
  AO22XLTS U1531 ( .A0(n1284), .A1(Data_X[9]), .B0(n1285), .B1(intDX_EWSW[9]), 
        .Y(n860) );
  AO22XLTS U1532 ( .A0(n1286), .A1(Data_X[10]), .B0(n1285), .B1(n913), .Y(n859) );
  AO22XLTS U1533 ( .A0(n1287), .A1(Data_X[11]), .B0(n1285), .B1(intDX_EWSW[11]), .Y(n858) );
  AO22XLTS U1534 ( .A0(n1284), .A1(Data_X[12]), .B0(n1283), .B1(intDX_EWSW[12]), .Y(n857) );
  AO22XLTS U1535 ( .A0(n1287), .A1(Data_X[13]), .B0(n1285), .B1(intDX_EWSW[13]), .Y(n856) );
  AO22XLTS U1536 ( .A0(n1286), .A1(Data_X[14]), .B0(n1283), .B1(intDX_EWSW[14]), .Y(n855) );
  AO22XLTS U1537 ( .A0(n1284), .A1(Data_X[15]), .B0(n1289), .B1(intDX_EWSW[15]), .Y(n854) );
  AO22XLTS U1538 ( .A0(n1287), .A1(Data_X[16]), .B0(n1289), .B1(intDX_EWSW[16]), .Y(n853) );
  AO22XLTS U1539 ( .A0(n1286), .A1(Data_X[17]), .B0(n1289), .B1(intDX_EWSW[17]), .Y(n852) );
  AO22XLTS U1540 ( .A0(n1284), .A1(Data_X[18]), .B0(n1289), .B1(intDX_EWSW[18]), .Y(n851) );
  AO22XLTS U1541 ( .A0(n1286), .A1(Data_X[20]), .B0(n1289), .B1(intDX_EWSW[20]), .Y(n849) );
  AO22XLTS U1542 ( .A0(n1287), .A1(Data_X[21]), .B0(n1289), .B1(intDX_EWSW[21]), .Y(n848) );
  AO22XLTS U1543 ( .A0(n1284), .A1(Data_X[22]), .B0(n1289), .B1(intDX_EWSW[22]), .Y(n847) );
  AO22XLTS U1544 ( .A0(n1286), .A1(Data_X[23]), .B0(n1289), .B1(intDX_EWSW[23]), .Y(n846) );
  AO22XLTS U1545 ( .A0(n1285), .A1(intDX_EWSW[24]), .B0(n1286), .B1(Data_X[24]), .Y(n845) );
  AO22XLTS U1546 ( .A0(n1285), .A1(intDX_EWSW[25]), .B0(n936), .B1(Data_X[25]), 
        .Y(n844) );
  AO22XLTS U1547 ( .A0(n1283), .A1(intDX_EWSW[26]), .B0(n1286), .B1(Data_X[26]), .Y(n843) );
  AO22XLTS U1548 ( .A0(n1287), .A1(Data_X[27]), .B0(n1289), .B1(intDX_EWSW[27]), .Y(n842) );
  AO22XLTS U1549 ( .A0(n1287), .A1(Data_X[28]), .B0(n1285), .B1(intDX_EWSW[28]), .Y(n841) );
  AO22XLTS U1550 ( .A0(n1287), .A1(Data_X[29]), .B0(n1289), .B1(intDX_EWSW[29]), .Y(n840) );
  AO22XLTS U1551 ( .A0(n1286), .A1(Data_X[30]), .B0(n1285), .B1(intDX_EWSW[30]), .Y(n839) );
  AO22XLTS U1552 ( .A0(n1286), .A1(add_subt), .B0(n1283), .B1(intAS), .Y(n837)
         );
  AO22XLTS U1553 ( .A0(n1285), .A1(intDY_EWSW[0]), .B0(n1286), .B1(Data_Y[0]), 
        .Y(n835) );
  AO22XLTS U1554 ( .A0(n1283), .A1(intDY_EWSW[1]), .B0(n1286), .B1(Data_Y[1]), 
        .Y(n834) );
  AO22XLTS U1555 ( .A0(n1285), .A1(intDY_EWSW[2]), .B0(n1284), .B1(Data_Y[2]), 
        .Y(n833) );
  AO22XLTS U1556 ( .A0(n1285), .A1(intDY_EWSW[3]), .B0(n1284), .B1(Data_Y[3]), 
        .Y(n832) );
  AO22XLTS U1557 ( .A0(n1283), .A1(intDY_EWSW[4]), .B0(n1286), .B1(Data_Y[4]), 
        .Y(n831) );
  AO22XLTS U1558 ( .A0(n1285), .A1(intDY_EWSW[5]), .B0(n1287), .B1(Data_Y[5]), 
        .Y(n830) );
  AO22XLTS U1559 ( .A0(n1285), .A1(intDY_EWSW[6]), .B0(n1287), .B1(Data_Y[6]), 
        .Y(n829) );
  AO22XLTS U1560 ( .A0(n1283), .A1(intDY_EWSW[7]), .B0(n1284), .B1(Data_Y[7]), 
        .Y(n828) );
  INVX4TS U1561 ( .A(n936), .Y(n1288) );
  AO22XLTS U1562 ( .A0(n1288), .A1(intDY_EWSW[8]), .B0(n1284), .B1(Data_Y[8]), 
        .Y(n827) );
  AO22XLTS U1563 ( .A0(n1285), .A1(intDY_EWSW[9]), .B0(n1287), .B1(Data_Y[9]), 
        .Y(n826) );
  AO22XLTS U1564 ( .A0(n1285), .A1(intDY_EWSW[10]), .B0(n1287), .B1(Data_Y[10]), .Y(n825) );
  AO22XLTS U1565 ( .A0(n1285), .A1(intDY_EWSW[11]), .B0(n1287), .B1(Data_Y[11]), .Y(n824) );
  AO22XLTS U1566 ( .A0(n1288), .A1(intDY_EWSW[12]), .B0(n1287), .B1(Data_Y[12]), .Y(n823) );
  AO22XLTS U1567 ( .A0(n1288), .A1(intDY_EWSW[13]), .B0(n1287), .B1(Data_Y[13]), .Y(n822) );
  AO22XLTS U1568 ( .A0(n1288), .A1(intDY_EWSW[14]), .B0(n1287), .B1(Data_Y[14]), .Y(n821) );
  AO22XLTS U1569 ( .A0(n1285), .A1(intDY_EWSW[15]), .B0(n1287), .B1(Data_Y[15]), .Y(n820) );
  AO22XLTS U1570 ( .A0(n1283), .A1(intDY_EWSW[16]), .B0(n936), .B1(Data_Y[16]), 
        .Y(n819) );
  AO22XLTS U1571 ( .A0(n1288), .A1(intDY_EWSW[17]), .B0(n1284), .B1(Data_Y[17]), .Y(n818) );
  AO22XLTS U1572 ( .A0(n1288), .A1(intDY_EWSW[18]), .B0(n1286), .B1(Data_Y[18]), .Y(n817) );
  AO22XLTS U1573 ( .A0(n1288), .A1(intDY_EWSW[19]), .B0(n936), .B1(Data_Y[19]), 
        .Y(n816) );
  AO22XLTS U1574 ( .A0(n1288), .A1(intDY_EWSW[20]), .B0(n936), .B1(Data_Y[20]), 
        .Y(n815) );
  AO22XLTS U1575 ( .A0(n1288), .A1(intDY_EWSW[21]), .B0(n936), .B1(Data_Y[21]), 
        .Y(n814) );
  AO22XLTS U1576 ( .A0(n1288), .A1(intDY_EWSW[22]), .B0(n1284), .B1(Data_Y[22]), .Y(n813) );
  AO22XLTS U1577 ( .A0(n1288), .A1(intDY_EWSW[23]), .B0(n1286), .B1(Data_Y[23]), .Y(n812) );
  AO22XLTS U1578 ( .A0(n1288), .A1(intDY_EWSW[24]), .B0(n1287), .B1(Data_Y[24]), .Y(n811) );
  AO22XLTS U1579 ( .A0(n1288), .A1(intDY_EWSW[25]), .B0(n1284), .B1(Data_Y[25]), .Y(n810) );
  AO22XLTS U1580 ( .A0(n1288), .A1(intDY_EWSW[26]), .B0(n1286), .B1(Data_Y[26]), .Y(n809) );
  AO22XLTS U1581 ( .A0(n1288), .A1(intDY_EWSW[27]), .B0(n1284), .B1(Data_Y[27]), .Y(n808) );
  AO22XLTS U1582 ( .A0(n1288), .A1(intDY_EWSW[28]), .B0(n1286), .B1(Data_Y[28]), .Y(n807) );
  AO22XLTS U1583 ( .A0(n1288), .A1(intDY_EWSW[29]), .B0(n1287), .B1(Data_Y[29]), .Y(n806) );
  AO22XLTS U1584 ( .A0(n1288), .A1(intDY_EWSW[30]), .B0(n1284), .B1(Data_Y[30]), .Y(n805) );
  AO22XLTS U1585 ( .A0(n1287), .A1(Data_Y[31]), .B0(n1285), .B1(intDY_EWSW[31]), .Y(n804) );
  AOI21X1TS U1586 ( .A0(n1134), .A1(Raw_mant_NRM_SWR[0]), .B0(n1300), .Y(n1291) );
  OAI2BB2XLTS U1587 ( .B0(n1291), .B1(n1304), .A0N(n1310), .A1N(
        Data_array_SWR[23]), .Y(n803) );
  OAI2BB2XLTS U1588 ( .B0(n1290), .B1(n1304), .A0N(n1310), .A1N(
        Data_array_SWR[22]), .Y(n802) );
  AOI22X1TS U1589 ( .A0(Raw_mant_NRM_SWR[10]), .A1(n1147), .B0(n1296), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n1293) );
  AOI21X1TS U1590 ( .A0(n1300), .A1(DmP_mant_SHT1_SW[12]), .B0(n1294), .Y(
        n1301) );
  AOI22X1TS U1591 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n1147), .B0(n1296), .B1(
        n904), .Y(n1297) );
  OAI21XLTS U1592 ( .A0(n1491), .A1(n1298), .B0(n1297), .Y(n1299) );
  AOI21X1TS U1593 ( .A0(n1300), .A1(DmP_mant_SHT1_SW[10]), .B0(n1299), .Y(
        n1302) );
  AOI22X1TS U1594 ( .A0(n1310), .A1(Data_array_SWR[0]), .B0(
        Raw_mant_NRM_SWR[24]), .B1(n1305), .Y(n1309) );
  AOI22X1TS U1595 ( .A0(Raw_mant_NRM_SWR[25]), .A1(n1134), .B0(n1307), .B1(
        n1306), .Y(n1308) );
  NAND2X1TS U1596 ( .A(n1309), .B(n1308), .Y(n778) );
  AOI32X1TS U1597 ( .A0(Shift_amount_SHT1_EWR[2]), .A1(n1313), .A2(n1351), 
        .B0(shift_value_SHT2_EWR[2]), .B1(n1310), .Y(n1312) );
  NAND2X1TS U1598 ( .A(n1312), .B(n1311), .Y(n777) );
  AOI21X1TS U1599 ( .A0(n1350), .A1(Shift_amount_SHT1_EWR[3]), .B0(n1352), .Y(
        n1314) );
  OAI22X1TS U1600 ( .A0(n1315), .A1(n1314), .B0(n1313), .B1(n1529), .Y(n776)
         );
  INVX4TS U1601 ( .A(n1338), .Y(n1344) );
  AOI21X1TS U1602 ( .A0(DMP_EXP_EWSW[23]), .A1(n925), .B0(n1320), .Y(n1316) );
  AOI2BB2XLTS U1603 ( .B0(n1344), .B1(n1316), .A0N(Shift_amount_SHT1_EWR[0]), 
        .A1N(n1492), .Y(n773) );
  NOR2X1TS U1604 ( .A(n1506), .B(DMP_EXP_EWSW[24]), .Y(n1319) );
  AOI21X1TS U1605 ( .A0(DMP_EXP_EWSW[24]), .A1(n1506), .B0(n1319), .Y(n1317)
         );
  XNOR2X1TS U1606 ( .A(n1320), .B(n1317), .Y(n1318) );
  AO22XLTS U1607 ( .A0(n1492), .A1(n1318), .B0(n1346), .B1(
        Shift_amount_SHT1_EWR[1]), .Y(n772) );
  OAI22X1TS U1608 ( .A0(n1320), .A1(n1319), .B0(DmP_EXP_EWSW[24]), .B1(n1507), 
        .Y(n1323) );
  NAND2X1TS U1609 ( .A(DmP_EXP_EWSW[25]), .B(n1565), .Y(n1324) );
  OAI21XLTS U1610 ( .A0(DmP_EXP_EWSW[25]), .A1(n1565), .B0(n1324), .Y(n1321)
         );
  XNOR2X1TS U1611 ( .A(n1323), .B(n1321), .Y(n1322) );
  AO22XLTS U1612 ( .A0(n1492), .A1(n1322), .B0(n1348), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n771) );
  AOI22X1TS U1613 ( .A0(DMP_EXP_EWSW[25]), .A1(n1575), .B0(n1324), .B1(n1323), 
        .Y(n1327) );
  NOR2X1TS U1614 ( .A(n1570), .B(DMP_EXP_EWSW[26]), .Y(n1328) );
  AOI21X1TS U1615 ( .A0(DMP_EXP_EWSW[26]), .A1(n1570), .B0(n1328), .Y(n1325)
         );
  XNOR2X1TS U1616 ( .A(n1327), .B(n1325), .Y(n1326) );
  AO22XLTS U1617 ( .A0(n1492), .A1(n1326), .B0(n1338), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n770) );
  OAI22X1TS U1618 ( .A0(n1328), .A1(n1327), .B0(DmP_EXP_EWSW[26]), .B1(n1574), 
        .Y(n1330) );
  XNOR2X1TS U1619 ( .A(DmP_EXP_EWSW[27]), .B(n908), .Y(n1329) );
  XOR2XLTS U1620 ( .A(n1330), .B(n1329), .Y(n1331) );
  AO22XLTS U1621 ( .A0(n1492), .A1(n1331), .B0(n1348), .B1(
        Shift_amount_SHT1_EWR[4]), .Y(n769) );
  OAI222X1TS U1622 ( .A0(n1339), .A1(n1573), .B0(n1507), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1490), .C1(n1341), .Y(n736) );
  OAI222X1TS U1623 ( .A0(n1339), .A1(n1509), .B0(n1565), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1550), .C1(n1341), .Y(n735) );
  OAI222X1TS U1624 ( .A0(n1339), .A1(n1510), .B0(n1574), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1555), .C1(n1341), .Y(n734) );
  OAI21XLTS U1625 ( .A0(n1333), .A1(intDX_EWSW[31]), .B0(Shift_reg_FLAGS_7_6), 
        .Y(n1332) );
  AOI21X1TS U1626 ( .A0(n1333), .A1(intDX_EWSW[31]), .B0(n1332), .Y(n1334) );
  AO21XLTS U1627 ( .A0(OP_FLAG_EXP), .A1(n1013), .B0(n1334), .Y(n729) );
  AO22XLTS U1628 ( .A0(n1335), .A1(n1334), .B0(ZERO_FLAG_EXP), .B1(n1013), .Y(
        n728) );
  AO22XLTS U1629 ( .A0(n1492), .A1(DMP_EXP_EWSW[0]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[0]), .Y(n726) );
  AO22XLTS U1630 ( .A0(busy), .A1(DMP_SHT1_EWSW[0]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[0]), .Y(n725) );
  NAND2X1TS U1631 ( .A(n902), .B(n1451), .Y(n1336) );
  INVX2TS U1632 ( .A(n1477), .Y(n1483) );
  AO22XLTS U1633 ( .A0(n1492), .A1(DMP_EXP_EWSW[1]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[1]), .Y(n723) );
  AO22XLTS U1634 ( .A0(busy), .A1(DMP_SHT1_EWSW[1]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[1]), .Y(n722) );
  AO22XLTS U1635 ( .A0(n1492), .A1(DMP_EXP_EWSW[2]), .B0(n1338), .B1(
        DMP_SHT1_EWSW[2]), .Y(n720) );
  AO22XLTS U1636 ( .A0(busy), .A1(DMP_SHT1_EWSW[2]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[2]), .Y(n719) );
  BUFX3TS U1637 ( .A(n1476), .Y(n1457) );
  INVX4TS U1638 ( .A(n1476), .Y(n1475) );
  AO22XLTS U1639 ( .A0(n1457), .A1(DMP_SFG[2]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[2]), .Y(n718) );
  AO22XLTS U1640 ( .A0(n1347), .A1(DMP_EXP_EWSW[3]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[3]), .Y(n717) );
  AO22XLTS U1641 ( .A0(busy), .A1(DMP_SHT1_EWSW[3]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[3]), .Y(n716) );
  AO22XLTS U1642 ( .A0(n1457), .A1(DMP_SFG[3]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[3]), .Y(n715) );
  AO22XLTS U1643 ( .A0(n1347), .A1(DMP_EXP_EWSW[4]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[4]), .Y(n714) );
  AO22XLTS U1644 ( .A0(busy), .A1(DMP_SHT1_EWSW[4]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[4]), .Y(n713) );
  AO22XLTS U1645 ( .A0(n1457), .A1(DMP_SFG[4]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[4]), .Y(n712) );
  AO22XLTS U1646 ( .A0(n1347), .A1(DMP_EXP_EWSW[5]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[5]), .Y(n711) );
  AO22XLTS U1647 ( .A0(busy), .A1(DMP_SHT1_EWSW[5]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[5]), .Y(n710) );
  AO22XLTS U1648 ( .A0(n1483), .A1(DMP_SHT2_EWSW[5]), .B0(n1477), .B1(
        DMP_SFG[5]), .Y(n709) );
  AO22XLTS U1649 ( .A0(n1347), .A1(DMP_EXP_EWSW[6]), .B0(n1338), .B1(
        DMP_SHT1_EWSW[6]), .Y(n708) );
  AO22XLTS U1650 ( .A0(busy), .A1(DMP_SHT1_EWSW[6]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[6]), .Y(n707) );
  AO22XLTS U1651 ( .A0(n1476), .A1(DMP_SFG[6]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[6]), .Y(n706) );
  AO22XLTS U1652 ( .A0(n1347), .A1(DMP_EXP_EWSW[7]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[7]), .Y(n705) );
  AO22XLTS U1653 ( .A0(busy), .A1(DMP_SHT1_EWSW[7]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[7]), .Y(n704) );
  AO22XLTS U1654 ( .A0(n1457), .A1(DMP_SFG[7]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[7]), .Y(n703) );
  AO22XLTS U1655 ( .A0(n1347), .A1(DMP_EXP_EWSW[8]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[8]), .Y(n702) );
  AO22XLTS U1656 ( .A0(busy), .A1(DMP_SHT1_EWSW[8]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[8]), .Y(n701) );
  INVX4TS U1657 ( .A(n1476), .Y(n1465) );
  AO22XLTS U1658 ( .A0(n1457), .A1(DMP_SFG[8]), .B0(n1465), .B1(
        DMP_SHT2_EWSW[8]), .Y(n700) );
  AO22XLTS U1659 ( .A0(n1347), .A1(DMP_EXP_EWSW[9]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[9]), .Y(n699) );
  AO22XLTS U1660 ( .A0(busy), .A1(DMP_SHT1_EWSW[9]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[9]), .Y(n698) );
  AO22XLTS U1661 ( .A0(n1483), .A1(DMP_SHT2_EWSW[9]), .B0(n1477), .B1(
        DMP_SFG[9]), .Y(n697) );
  AO22XLTS U1662 ( .A0(n1347), .A1(DMP_EXP_EWSW[10]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[10]), .Y(n696) );
  BUFX4TS U1663 ( .A(n1580), .Y(n1345) );
  AO22XLTS U1664 ( .A0(n1350), .A1(DMP_SHT1_EWSW[10]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[10]), .Y(n695) );
  AO22XLTS U1665 ( .A0(n1476), .A1(DMP_SFG[10]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[10]), .Y(n694) );
  BUFX4TS U1666 ( .A(n1577), .Y(n1348) );
  AO22XLTS U1667 ( .A0(n1347), .A1(DMP_EXP_EWSW[11]), .B0(n1577), .B1(
        DMP_SHT1_EWSW[11]), .Y(n693) );
  AO22XLTS U1668 ( .A0(n1350), .A1(DMP_SHT1_EWSW[11]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[11]), .Y(n692) );
  AO22XLTS U1669 ( .A0(n1476), .A1(DMP_SFG[11]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[11]), .Y(n691) );
  AO22XLTS U1670 ( .A0(n1347), .A1(DMP_EXP_EWSW[12]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[12]), .Y(n690) );
  AO22XLTS U1671 ( .A0(n1350), .A1(DMP_SHT1_EWSW[12]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[12]), .Y(n689) );
  AO22XLTS U1672 ( .A0(n1457), .A1(DMP_SFG[12]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[12]), .Y(n688) );
  AO22XLTS U1673 ( .A0(n1347), .A1(DMP_EXP_EWSW[13]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[13]), .Y(n687) );
  AO22XLTS U1674 ( .A0(n1350), .A1(DMP_SHT1_EWSW[13]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[13]), .Y(n686) );
  AO22XLTS U1675 ( .A0(n1476), .A1(DMP_SFG[13]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[13]), .Y(n685) );
  AO22XLTS U1676 ( .A0(n1347), .A1(DMP_EXP_EWSW[14]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[14]), .Y(n684) );
  AO22XLTS U1677 ( .A0(n1350), .A1(DMP_SHT1_EWSW[14]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[14]), .Y(n683) );
  AO22XLTS U1678 ( .A0(n1457), .A1(DMP_SFG[14]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[14]), .Y(n682) );
  AO22XLTS U1679 ( .A0(n1347), .A1(DMP_EXP_EWSW[15]), .B0(n1577), .B1(
        DMP_SHT1_EWSW[15]), .Y(n681) );
  AO22XLTS U1680 ( .A0(n1350), .A1(DMP_SHT1_EWSW[15]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[15]), .Y(n680) );
  AO22XLTS U1681 ( .A0(n1476), .A1(DMP_SFG[15]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[15]), .Y(n679) );
  AO22XLTS U1682 ( .A0(n1347), .A1(DMP_EXP_EWSW[16]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[16]), .Y(n678) );
  AO22XLTS U1683 ( .A0(n1350), .A1(DMP_SHT1_EWSW[16]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[16]), .Y(n677) );
  AO22XLTS U1684 ( .A0(n1476), .A1(DMP_SFG[16]), .B0(n1475), .B1(
        DMP_SHT2_EWSW[16]), .Y(n676) );
  INVX4TS U1685 ( .A(n1338), .Y(n1349) );
  AO22XLTS U1686 ( .A0(n1349), .A1(DMP_EXP_EWSW[17]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[17]), .Y(n675) );
  AO22XLTS U1687 ( .A0(n1350), .A1(DMP_SHT1_EWSW[17]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[17]), .Y(n674) );
  AO22XLTS U1688 ( .A0(n1476), .A1(DMP_SFG[17]), .B0(n1465), .B1(
        DMP_SHT2_EWSW[17]), .Y(n673) );
  AO22XLTS U1689 ( .A0(n1349), .A1(DMP_EXP_EWSW[18]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[18]), .Y(n672) );
  AO22XLTS U1690 ( .A0(n1350), .A1(DMP_SHT1_EWSW[18]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[18]), .Y(n671) );
  AO22XLTS U1691 ( .A0(n1457), .A1(DMP_SFG[18]), .B0(n1465), .B1(
        DMP_SHT2_EWSW[18]), .Y(n670) );
  BUFX4TS U1692 ( .A(n1577), .Y(n1338) );
  AO22XLTS U1693 ( .A0(n1349), .A1(DMP_EXP_EWSW[19]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[19]), .Y(n669) );
  AO22XLTS U1694 ( .A0(busy), .A1(DMP_SHT1_EWSW[19]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[19]), .Y(n668) );
  AO22XLTS U1695 ( .A0(n1476), .A1(DMP_SFG[19]), .B0(n1465), .B1(
        DMP_SHT2_EWSW[19]), .Y(n667) );
  AO22XLTS U1696 ( .A0(n1349), .A1(DMP_EXP_EWSW[20]), .B0(n1338), .B1(
        DMP_SHT1_EWSW[20]), .Y(n666) );
  AO22XLTS U1697 ( .A0(busy), .A1(DMP_SHT1_EWSW[20]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[20]), .Y(n665) );
  AO22XLTS U1698 ( .A0(n1476), .A1(DMP_SFG[20]), .B0(n1465), .B1(
        DMP_SHT2_EWSW[20]), .Y(n664) );
  AO22XLTS U1699 ( .A0(n1349), .A1(DMP_EXP_EWSW[21]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[21]), .Y(n663) );
  AO22XLTS U1700 ( .A0(busy), .A1(DMP_SHT1_EWSW[21]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[21]), .Y(n662) );
  AO22XLTS U1701 ( .A0(n1476), .A1(DMP_SFG[21]), .B0(n1465), .B1(
        DMP_SHT2_EWSW[21]), .Y(n661) );
  AO22XLTS U1702 ( .A0(n1349), .A1(DMP_EXP_EWSW[22]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[22]), .Y(n660) );
  AO22XLTS U1703 ( .A0(busy), .A1(DMP_SHT1_EWSW[22]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[22]), .Y(n659) );
  AO22XLTS U1704 ( .A0(n1476), .A1(DMP_SFG[22]), .B0(n1465), .B1(
        DMP_SHT2_EWSW[22]), .Y(n658) );
  AO22XLTS U1705 ( .A0(n1349), .A1(DMP_EXP_EWSW[23]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[23]), .Y(n657) );
  AO22XLTS U1706 ( .A0(n1350), .A1(DMP_SHT1_EWSW[23]), .B0(n1580), .B1(
        DMP_SHT2_EWSW[23]), .Y(n656) );
  AO22XLTS U1707 ( .A0(n1483), .A1(DMP_SHT2_EWSW[23]), .B0(n1477), .B1(
        DMP_SFG[23]), .Y(n655) );
  BUFX4TS U1708 ( .A(n1608), .Y(n1385) );
  AO22XLTS U1709 ( .A0(n880), .A1(DMP_SFG[23]), .B0(n1385), .B1(
        DMP_exp_NRM_EW[0]), .Y(n654) );
  AO22XLTS U1710 ( .A0(n1349), .A1(DMP_EXP_EWSW[24]), .B0(n1338), .B1(
        DMP_SHT1_EWSW[24]), .Y(n652) );
  AO22XLTS U1711 ( .A0(n1350), .A1(DMP_SHT1_EWSW[24]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[24]), .Y(n651) );
  AO22XLTS U1712 ( .A0(n1483), .A1(DMP_SHT2_EWSW[24]), .B0(n1477), .B1(
        DMP_SFG[24]), .Y(n650) );
  AO22XLTS U1713 ( .A0(n880), .A1(DMP_SFG[24]), .B0(n1385), .B1(
        DMP_exp_NRM_EW[1]), .Y(n649) );
  AO22XLTS U1714 ( .A0(n1349), .A1(DMP_EXP_EWSW[25]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[25]), .Y(n647) );
  AO22XLTS U1715 ( .A0(n1350), .A1(DMP_SHT1_EWSW[25]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[25]), .Y(n646) );
  AO22XLTS U1716 ( .A0(n1483), .A1(DMP_SHT2_EWSW[25]), .B0(n1477), .B1(
        DMP_SFG[25]), .Y(n645) );
  AO22XLTS U1717 ( .A0(n880), .A1(DMP_SFG[25]), .B0(n1385), .B1(
        DMP_exp_NRM_EW[2]), .Y(n644) );
  AO22XLTS U1718 ( .A0(n1349), .A1(DMP_EXP_EWSW[26]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[26]), .Y(n642) );
  AO22XLTS U1719 ( .A0(n1350), .A1(DMP_SHT1_EWSW[26]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[26]), .Y(n641) );
  AO22XLTS U1720 ( .A0(n1465), .A1(DMP_SHT2_EWSW[26]), .B0(n1457), .B1(
        DMP_SFG[26]), .Y(n640) );
  AO22XLTS U1721 ( .A0(n880), .A1(DMP_SFG[26]), .B0(n1385), .B1(
        DMP_exp_NRM_EW[3]), .Y(n639) );
  AO22XLTS U1722 ( .A0(n1349), .A1(n908), .B0(n1346), .B1(DMP_SHT1_EWSW[27]), 
        .Y(n637) );
  AO22XLTS U1723 ( .A0(n1350), .A1(DMP_SHT1_EWSW[27]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[27]), .Y(n636) );
  AO22XLTS U1724 ( .A0(n1465), .A1(DMP_SHT2_EWSW[27]), .B0(n1477), .B1(
        DMP_SFG[27]), .Y(n635) );
  AO22XLTS U1725 ( .A0(n880), .A1(DMP_SFG[27]), .B0(n1385), .B1(
        DMP_exp_NRM_EW[4]), .Y(n634) );
  AO22XLTS U1726 ( .A0(n1349), .A1(DMP_EXP_EWSW[28]), .B0(n1577), .B1(
        DMP_SHT1_EWSW[28]), .Y(n632) );
  AO22XLTS U1727 ( .A0(n1350), .A1(DMP_SHT1_EWSW[28]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[28]), .Y(n631) );
  AO22XLTS U1728 ( .A0(n1465), .A1(DMP_SHT2_EWSW[28]), .B0(n1457), .B1(
        DMP_SFG[28]), .Y(n630) );
  AO22XLTS U1729 ( .A0(n880), .A1(DMP_SFG[28]), .B0(n1385), .B1(
        DMP_exp_NRM_EW[5]), .Y(n629) );
  AO22XLTS U1730 ( .A0(n1349), .A1(DMP_EXP_EWSW[29]), .B0(n1348), .B1(
        DMP_SHT1_EWSW[29]), .Y(n627) );
  AO22XLTS U1731 ( .A0(n1350), .A1(DMP_SHT1_EWSW[29]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[29]), .Y(n626) );
  AO22XLTS U1732 ( .A0(n1483), .A1(DMP_SHT2_EWSW[29]), .B0(n1457), .B1(
        DMP_SFG[29]), .Y(n625) );
  AO22XLTS U1733 ( .A0(n1360), .A1(DMP_SFG[29]), .B0(n1385), .B1(
        DMP_exp_NRM_EW[6]), .Y(n624) );
  AO22XLTS U1734 ( .A0(n1344), .A1(DMP_EXP_EWSW[30]), .B0(n1346), .B1(
        DMP_SHT1_EWSW[30]), .Y(n622) );
  AO22XLTS U1735 ( .A0(n1350), .A1(DMP_SHT1_EWSW[30]), .B0(n1345), .B1(
        DMP_SHT2_EWSW[30]), .Y(n621) );
  AO22XLTS U1736 ( .A0(n1465), .A1(DMP_SHT2_EWSW[30]), .B0(n1457), .B1(
        DMP_SFG[30]), .Y(n620) );
  AO22XLTS U1737 ( .A0(n1360), .A1(DMP_SFG[30]), .B0(n1385), .B1(
        DMP_exp_NRM_EW[7]), .Y(n619) );
  AO22XLTS U1738 ( .A0(n1347), .A1(DmP_EXP_EWSW[14]), .B0(n1338), .B1(
        DmP_mant_SHT1_SW[14]), .Y(n588) );
  AO22XLTS U1739 ( .A0(n1347), .A1(DmP_EXP_EWSW[17]), .B0(n1338), .B1(
        DmP_mant_SHT1_SW[17]), .Y(n582) );
  AO22XLTS U1740 ( .A0(n1347), .A1(DmP_EXP_EWSW[19]), .B0(n1577), .B1(n906), 
        .Y(n578) );
  AO22XLTS U1741 ( .A0(n1347), .A1(DmP_EXP_EWSW[22]), .B0(n1348), .B1(n909), 
        .Y(n572) );
  OAI222X1TS U1742 ( .A0(n1341), .A1(n1573), .B0(n1506), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1490), .C1(n1339), .Y(n570) );
  OAI222X1TS U1743 ( .A0(n1341), .A1(n1509), .B0(n1575), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1550), .C1(n1339), .Y(n569) );
  OAI222X1TS U1744 ( .A0(n1341), .A1(n1510), .B0(n1570), .B1(
        Shift_reg_FLAGS_7_6), .C0(n1555), .C1(n1339), .Y(n568) );
  INVX4TS U1745 ( .A(n1342), .Y(n1448) );
  NAND2X1TS U1746 ( .A(n1389), .B(Shift_reg_FLAGS_7[0]), .Y(n1343) );
  OAI2BB1X1TS U1747 ( .A0N(underflow_flag), .A1N(n1448), .B0(n1343), .Y(n566)
         );
  AO22XLTS U1748 ( .A0(n1344), .A1(ZERO_FLAG_EXP), .B0(n1338), .B1(
        ZERO_FLAG_SHT1), .Y(n564) );
  AO22XLTS U1749 ( .A0(n1350), .A1(ZERO_FLAG_SHT1), .B0(n1345), .B1(
        ZERO_FLAG_SHT2), .Y(n563) );
  AO22XLTS U1750 ( .A0(n1465), .A1(ZERO_FLAG_SHT2), .B0(n1476), .B1(
        ZERO_FLAG_SFG), .Y(n562) );
  AO22XLTS U1751 ( .A0(n1360), .A1(ZERO_FLAG_SFG), .B0(n1385), .B1(
        ZERO_FLAG_NRM), .Y(n561) );
  AO22XLTS U1752 ( .A0(n1352), .A1(ZERO_FLAG_NRM), .B0(n1351), .B1(
        ZERO_FLAG_SHT1SHT2), .Y(n560) );
  AO22XLTS U1753 ( .A0(Shift_reg_FLAGS_7[0]), .A1(ZERO_FLAG_SHT1SHT2), .B0(
        n1448), .B1(zero_flag), .Y(n559) );
  AO22XLTS U1754 ( .A0(n1347), .A1(OP_FLAG_EXP), .B0(n1346), .B1(OP_FLAG_SHT1), 
        .Y(n558) );
  AO22XLTS U1755 ( .A0(n1350), .A1(OP_FLAG_SHT1), .B0(n1580), .B1(OP_FLAG_SHT2), .Y(n557) );
  AO22XLTS U1756 ( .A0(n1476), .A1(OP_FLAG_SFG), .B0(n1465), .B1(OP_FLAG_SHT2), 
        .Y(n556) );
  AO22XLTS U1757 ( .A0(n1349), .A1(SIGN_FLAG_EXP), .B0(n1346), .B1(
        SIGN_FLAG_SHT1), .Y(n555) );
  AO22XLTS U1758 ( .A0(n1350), .A1(SIGN_FLAG_SHT1), .B0(n1580), .B1(
        SIGN_FLAG_SHT2), .Y(n554) );
  AO22XLTS U1759 ( .A0(n1465), .A1(SIGN_FLAG_SHT2), .B0(n1457), .B1(
        SIGN_FLAG_SFG), .Y(n553) );
  AO22XLTS U1760 ( .A0(n1360), .A1(SIGN_FLAG_SFG), .B0(n1608), .B1(
        SIGN_FLAG_NRM), .Y(n552) );
  AO22XLTS U1761 ( .A0(n1352), .A1(SIGN_FLAG_NRM), .B0(n1351), .B1(
        SIGN_FLAG_SHT1SHT2), .Y(n551) );
  AOI2BB2XLTS U1762 ( .B0(n880), .B1(intadd_17_SUM_0_), .A0N(
        Raw_mant_NRM_SWR[4]), .A1N(n880), .Y(n549) );
  AOI22X1TS U1763 ( .A0(n1360), .A1(intadd_17_SUM_1_), .B0(n1517), .B1(n1608), 
        .Y(n548) );
  AOI22X1TS U1764 ( .A0(n1360), .A1(intadd_17_SUM_2_), .B0(n1563), .B1(n1608), 
        .Y(n547) );
  XNOR2X1TS U1765 ( .A(DMP_SFG[5]), .B(n899), .Y(n1353) );
  XNOR2X1TS U1766 ( .A(intadd_17_n1), .B(n1353), .Y(n1354) );
  AOI22X1TS U1767 ( .A0(n1360), .A1(n1354), .B0(n1512), .B1(n1608), .Y(n546)
         );
  AOI22X1TS U1768 ( .A0(n1360), .A1(intadd_16_SUM_0_), .B0(n1519), .B1(n1608), 
        .Y(n545) );
  AOI22X1TS U1769 ( .A0(n1360), .A1(intadd_16_SUM_1_), .B0(n1488), .B1(n1385), 
        .Y(n544) );
  AOI22X1TS U1770 ( .A0(n1360), .A1(intadd_16_SUM_2_), .B0(n1486), .B1(n1385), 
        .Y(n543) );
  XNOR2X1TS U1771 ( .A(DMP_SFG[9]), .B(n1355), .Y(n1356) );
  XNOR2X1TS U1772 ( .A(intadd_16_n1), .B(n1356), .Y(n1357) );
  AOI22X1TS U1773 ( .A0(n1360), .A1(n1357), .B0(n1485), .B1(n1385), .Y(n542)
         );
  AOI2BB2XLTS U1774 ( .B0(DmP_mant_SFG_SWR[12]), .B1(n915), .A0N(n1607), .A1N(
        DmP_mant_SFG_SWR[12]), .Y(intadd_15_CI) );
  AOI2BB2XLTS U1775 ( .B0(n880), .B1(intadd_15_SUM_0_), .A0N(
        Raw_mant_NRM_SWR[12]), .A1N(n880), .Y(n541) );
  AOI2BB2XLTS U1776 ( .B0(DmP_mant_SFG_SWR[13]), .B1(n915), .A0N(n915), .A1N(
        DmP_mant_SFG_SWR[13]), .Y(intadd_15_B_1_) );
  AOI22X1TS U1777 ( .A0(n1360), .A1(intadd_15_SUM_1_), .B0(n1491), .B1(n1385), 
        .Y(n540) );
  AOI2BB2XLTS U1778 ( .B0(DmP_mant_SFG_SWR[14]), .B1(n915), .A0N(n915), .A1N(
        DmP_mant_SFG_SWR[14]), .Y(intadd_15_B_2_) );
  AOI22X1TS U1779 ( .A0(n1360), .A1(intadd_15_SUM_2_), .B0(n1487), .B1(n1385), 
        .Y(n539) );
  AOI2BB2XLTS U1780 ( .B0(DmP_mant_SFG_SWR[15]), .B1(n915), .A0N(n915), .A1N(
        DmP_mant_SFG_SWR[15]), .Y(intadd_15_B_3_) );
  AOI2BB2XLTS U1781 ( .B0(n880), .B1(intadd_15_SUM_3_), .A0N(
        Raw_mant_NRM_SWR[15]), .A1N(n880), .Y(n538) );
  AOI22X1TS U1782 ( .A0(DmP_mant_SFG_SWR[16]), .A1(n915), .B0(n1384), .B1(n918), .Y(intadd_15_B_4_) );
  AOI22X1TS U1783 ( .A0(n1360), .A1(intadd_15_SUM_4_), .B0(n1508), .B1(n1385), 
        .Y(n537) );
  AOI22X1TS U1784 ( .A0(DmP_mant_SFG_SWR[17]), .A1(n915), .B0(n1384), .B1(n919), .Y(intadd_15_B_5_) );
  AOI22X1TS U1785 ( .A0(n1360), .A1(intadd_15_SUM_5_), .B0(n1498), .B1(n1385), 
        .Y(n536) );
  AOI22X1TS U1786 ( .A0(DmP_mant_SFG_SWR[18]), .A1(n915), .B0(n1384), .B1(n920), .Y(intadd_15_B_6_) );
  AOI2BB2XLTS U1787 ( .B0(n880), .B1(intadd_15_SUM_6_), .A0N(
        Raw_mant_NRM_SWR[18]), .A1N(n880), .Y(n535) );
  AOI22X1TS U1788 ( .A0(DmP_mant_SFG_SWR[19]), .A1(n915), .B0(n1384), .B1(n921), .Y(intadd_15_B_7_) );
  AOI2BB2XLTS U1789 ( .B0(n880), .B1(intadd_15_SUM_7_), .A0N(
        Raw_mant_NRM_SWR[19]), .A1N(n880), .Y(n534) );
  AOI22X1TS U1790 ( .A0(DmP_mant_SFG_SWR[20]), .A1(n915), .B0(n1384), .B1(n922), .Y(intadd_15_B_8_) );
  AOI2BB2XLTS U1791 ( .B0(n880), .B1(intadd_15_SUM_8_), .A0N(
        Raw_mant_NRM_SWR[20]), .A1N(n880), .Y(n533) );
  AOI22X1TS U1792 ( .A0(DmP_mant_SFG_SWR[21]), .A1(n915), .B0(n1384), .B1(n923), .Y(intadd_15_B_9_) );
  AOI22X1TS U1793 ( .A0(n1360), .A1(intadd_15_SUM_9_), .B0(n1495), .B1(n1385), 
        .Y(n532) );
  AOI22X1TS U1794 ( .A0(DmP_mant_SFG_SWR[22]), .A1(n915), .B0(OP_FLAG_SFG), 
        .B1(n924), .Y(intadd_15_B_10_) );
  AOI22X1TS U1795 ( .A0(n1360), .A1(intadd_15_SUM_10_), .B0(n1493), .B1(n1385), 
        .Y(n531) );
  AOI2BB2XLTS U1796 ( .B0(DmP_mant_SFG_SWR[23]), .B1(n915), .A0N(n915), .A1N(
        DmP_mant_SFG_SWR[23]), .Y(intadd_15_B_11_) );
  AOI22X1TS U1797 ( .A0(n1360), .A1(intadd_15_SUM_11_), .B0(n1484), .B1(n1608), 
        .Y(n530) );
  AOI22X1TS U1798 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n915), .B0(OP_FLAG_SFG), 
        .B1(n926), .Y(intadd_15_B_12_) );
  AOI22X1TS U1799 ( .A0(n1360), .A1(intadd_15_SUM_12_), .B0(n1489), .B1(n1608), 
        .Y(n529) );
  AOI22X1TS U1800 ( .A0(DmP_mant_SFG_SWR[25]), .A1(OP_FLAG_SFG), .B0(n915), 
        .B1(n927), .Y(n1358) );
  XNOR2X1TS U1801 ( .A(intadd_15_n1), .B(n1358), .Y(n1359) );
  AOI22X1TS U1802 ( .A0(n1360), .A1(n1359), .B0(n1511), .B1(n1608), .Y(n528)
         );
  INVX2TS U1803 ( .A(n1422), .Y(n1405) );
  NAND2X1TS U1804 ( .A(n1481), .B(n1391), .Y(n1375) );
  AOI22X1TS U1805 ( .A0(Data_array_SWR[21]), .A1(n1423), .B0(
        Data_array_SWR[17]), .B1(n1422), .Y(n1417) );
  AND2X4TS U1806 ( .A(n1423), .B(n1515), .Y(n1434) );
  AOI22X1TS U1807 ( .A0(n911), .A1(n1435), .B0(Data_array_SWR[7]), .B1(n1434), 
        .Y(n1365) );
  NOR3X1TS U1808 ( .A(shift_value_SHT2_EWR[4]), .B(n1499), .C(n1529), .Y(n1363) );
  AOI22X1TS U1809 ( .A0(Data_array_SWR[14]), .A1(n1433), .B0(Data_array_SWR[3]), .B1(n1391), .Y(n1364) );
  OAI211X1TS U1810 ( .A0(n1417), .A1(n1515), .B0(n1365), .C0(n1364), .Y(n1444)
         );
  AO22XLTS U1811 ( .A0(Data_array_SWR[20]), .A1(n1361), .B0(n1446), .B1(n1444), 
        .Y(n1431) );
  XNOR2X1TS U1812 ( .A(DMP_SFG[1]), .B(n1376), .Y(n1367) );
  XNOR2X1TS U1813 ( .A(n1367), .B(n1366), .Y(n1368) );
  AOI22X1TS U1814 ( .A0(n1360), .A1(n1368), .B0(n1558), .B1(n1608), .Y(n526)
         );
  NOR2X1TS U1815 ( .A(shift_value_SHT2_EWR[2]), .B(n1529), .Y(n1380) );
  AOI22X1TS U1816 ( .A0(Data_array_SWR[12]), .A1(n1433), .B0(Data_array_SWR[9]), .B1(n1435), .Y(n1370) );
  AOI22X1TS U1817 ( .A0(Data_array_SWR[5]), .A1(n1434), .B0(Data_array_SWR[1]), 
        .B1(n1391), .Y(n1369) );
  OAI211X1TS U1818 ( .A0(n1439), .A1(n1515), .B0(n1370), .C0(n1369), .Y(n1450)
         );
  AOI22X1TS U1819 ( .A0(Data_array_SWR[22]), .A1(n1361), .B0(n1446), .B1(n1450), .Y(n1371) );
  AOI22X1TS U1820 ( .A0(n1483), .A1(n1371), .B0(n1476), .B1(n928), .Y(n523) );
  AOI22X1TS U1821 ( .A0(DmP_mant_SFG_SWR[1]), .A1(n915), .B0(OP_FLAG_SFG), 
        .B1(n928), .Y(n1372) );
  AOI22X1TS U1822 ( .A0(n1360), .A1(n1372), .B0(n1564), .B1(n1608), .Y(n522)
         );
  AO22XLTS U1823 ( .A0(Data_array_SWR[13]), .A1(n1433), .B0(Data_array_SWR[10]), .B1(n1435), .Y(n1374) );
  AO22X1TS U1824 ( .A0(Data_array_SWR[20]), .A1(n1423), .B0(n910), .B1(n1422), 
        .Y(n1413) );
  AO22XLTS U1825 ( .A0(n1413), .A1(shift_value_SHT2_EWR[4]), .B0(
        Data_array_SWR[6]), .B1(n1434), .Y(n1373) );
  OAI22X1TS U1826 ( .A0(n1481), .A1(n1447), .B0(n1562), .B1(n1375), .Y(n1432)
         );
  AO22XLTS U1827 ( .A0(n1483), .A1(n1432), .B0(n1477), .B1(DmP_mant_SFG_SWR[2]), .Y(n519) );
  OAI21XLTS U1828 ( .A0(n1377), .A1(DMP_SFG[0]), .B0(n1376), .Y(n1379) );
  AOI22X1TS U1829 ( .A0(n1360), .A1(n1379), .B0(n1516), .B1(n1608), .Y(n518)
         );
  AOI22X1TS U1830 ( .A0(Data_array_SWR[11]), .A1(n1433), .B0(Data_array_SWR[8]), .B1(n1435), .Y(n1382) );
  AOI22X1TS U1831 ( .A0(Data_array_SWR[4]), .A1(n1434), .B0(Data_array_SWR[0]), 
        .B1(n1391), .Y(n1381) );
  OAI211X1TS U1832 ( .A0(n1408), .A1(n1515), .B0(n1382), .C0(n1381), .Y(n1480)
         );
  AOI22X1TS U1833 ( .A0(Data_array_SWR[23]), .A1(n1361), .B0(n1446), .B1(n1480), .Y(n1383) );
  AOI22X1TS U1834 ( .A0(n1479), .A1(n1383), .B0(n1477), .B1(n929), .Y(n516) );
  AOI22X1TS U1835 ( .A0(DmP_mant_SFG_SWR[0]), .A1(n915), .B0(n1384), .B1(n929), 
        .Y(n1386) );
  AOI22X1TS U1836 ( .A0(n1360), .A1(n1386), .B0(n1497), .B1(n1385), .Y(n515)
         );
  NOR2XLTS U1837 ( .A(n1389), .B(n1388), .Y(n1390) );
  CLKBUFX3TS U1838 ( .A(n1390), .Y(n1449) );
  NAND2X1TS U1839 ( .A(n1446), .B(n1391), .Y(n1445) );
  AOI22X1TS U1840 ( .A0(Data_array_SWR[11]), .A1(n1392), .B0(
        Data_array_SWR[12]), .B1(n1361), .Y(n1393) );
  OAI221X1TS U1841 ( .A0(n1481), .A1(n1395), .B0(n1446), .B1(n1396), .C0(n1393), .Y(n1462) );
  AO22XLTS U1842 ( .A0(n1449), .A1(n1462), .B0(final_result_ieee[10]), .B1(
        n1448), .Y(n514) );
  AOI22X1TS U1843 ( .A0(Data_array_SWR[11]), .A1(n1361), .B0(
        Data_array_SWR[12]), .B1(n1392), .Y(n1394) );
  OAI221X1TS U1844 ( .A0(n1481), .A1(n1396), .B0(n1446), .B1(n1395), .C0(n1394), .Y(n1463) );
  AO22XLTS U1845 ( .A0(n1449), .A1(n1463), .B0(final_result_ieee[11]), .B1(
        n1448), .Y(n513) );
  AOI22X1TS U1846 ( .A0(Data_array_SWR[20]), .A1(n1435), .B0(n910), .B1(n1434), 
        .Y(n1400) );
  AOI22X1TS U1847 ( .A0(Data_array_SWR[13]), .A1(n1361), .B0(n911), .B1(n1392), 
        .Y(n1397) );
  OAI221X1TS U1848 ( .A0(n1481), .A1(n1399), .B0(n1446), .B1(n1400), .C0(n1397), .Y(n1461) );
  AO22XLTS U1849 ( .A0(n1449), .A1(n1461), .B0(final_result_ieee[9]), .B1(
        n1448), .Y(n512) );
  AOI22X1TS U1850 ( .A0(Data_array_SWR[13]), .A1(n1392), .B0(n911), .B1(n1361), 
        .Y(n1398) );
  OAI221X1TS U1851 ( .A0(n1481), .A1(n1400), .B0(n1446), .B1(n1399), .C0(n1398), .Y(n1464) );
  AO22XLTS U1852 ( .A0(n1449), .A1(n1464), .B0(final_result_ieee[12]), .B1(
        n1448), .Y(n511) );
  AOI22X1TS U1853 ( .A0(Data_array_SWR[21]), .A1(n1435), .B0(
        Data_array_SWR[17]), .B1(n1434), .Y(n1404) );
  AOI22X1TS U1854 ( .A0(Data_array_SWR[10]), .A1(n1392), .B0(
        Data_array_SWR[14]), .B1(n1361), .Y(n1401) );
  OAI221X1TS U1855 ( .A0(n1481), .A1(n1403), .B0(n1446), .B1(n1404), .C0(n1401), .Y(n1460) );
  AO22XLTS U1856 ( .A0(n1449), .A1(n1460), .B0(final_result_ieee[8]), .B1(
        n1448), .Y(n510) );
  AOI22X1TS U1857 ( .A0(Data_array_SWR[10]), .A1(n1361), .B0(
        Data_array_SWR[14]), .B1(n1392), .Y(n1402) );
  OAI221X1TS U1858 ( .A0(n1481), .A1(n1404), .B0(n1446), .B1(n1403), .C0(n1402), .Y(n1466) );
  AO22XLTS U1859 ( .A0(n1449), .A1(n1466), .B0(final_result_ieee[13]), .B1(
        n1448), .Y(n509) );
  AOI22X1TS U1860 ( .A0(Data_array_SWR[19]), .A1(n1433), .B0(
        Data_array_SWR[12]), .B1(n1434), .Y(n1407) );
  NOR2X2TS U1861 ( .A(n1515), .B(n1405), .Y(n1436) );
  AOI22X1TS U1862 ( .A0(Data_array_SWR[16]), .A1(n1435), .B0(
        Data_array_SWR[23]), .B1(n1436), .Y(n1406) );
  NAND2X1TS U1863 ( .A(n1407), .B(n1406), .Y(n1410) );
  INVX2TS U1864 ( .A(n1408), .Y(n1409) );
  OAI2BB2XLTS U1865 ( .B0(n1459), .B1(n1452), .A0N(final_result_ieee[7]), 
        .A1N(n1448), .Y(n508) );
  OAI2BB2XLTS U1866 ( .B0(n1467), .B1(n1452), .A0N(final_result_ieee[14]), 
        .A1N(n1448), .Y(n507) );
  AOI22X1TS U1867 ( .A0(Data_array_SWR[17]), .A1(n1433), .B0(n911), .B1(n1434), 
        .Y(n1412) );
  AOI22X1TS U1868 ( .A0(Data_array_SWR[21]), .A1(n1436), .B0(
        Data_array_SWR[14]), .B1(n1435), .Y(n1411) );
  NAND2X1TS U1869 ( .A(n1412), .B(n1411), .Y(n1414) );
  OAI2BB2XLTS U1870 ( .B0(n1456), .B1(n1452), .A0N(final_result_ieee[5]), 
        .A1N(n1448), .Y(n506) );
  OAI2BB2XLTS U1871 ( .B0(n1469), .B1(n1452), .A0N(final_result_ieee[16]), 
        .A1N(n1451), .Y(n505) );
  AOI22X1TS U1872 ( .A0(Data_array_SWR[10]), .A1(n1434), .B0(n910), .B1(n1433), 
        .Y(n1416) );
  AOI22X1TS U1873 ( .A0(Data_array_SWR[13]), .A1(n1435), .B0(
        Data_array_SWR[20]), .B1(n1436), .Y(n1415) );
  NAND2X1TS U1874 ( .A(n1416), .B(n1415), .Y(n1419) );
  INVX2TS U1875 ( .A(n1417), .Y(n1418) );
  OAI2BB2XLTS U1876 ( .B0(n1455), .B1(n1452), .A0N(final_result_ieee[4]), 
        .A1N(n1451), .Y(n504) );
  OAI2BB2XLTS U1877 ( .B0(n1470), .B1(n1452), .A0N(final_result_ieee[17]), 
        .A1N(n1451), .Y(n503) );
  AOI22X1TS U1878 ( .A0(Data_array_SWR[19]), .A1(n1422), .B0(
        Data_array_SWR[23]), .B1(n1423), .Y(n1428) );
  AOI22X1TS U1879 ( .A0(Data_array_SWR[16]), .A1(n1433), .B0(Data_array_SWR[9]), .B1(n1434), .Y(n1421) );
  NAND2X1TS U1880 ( .A(Data_array_SWR[12]), .B(n1435), .Y(n1420) );
  OAI211X1TS U1881 ( .A0(n1428), .A1(n1515), .B0(n1421), .C0(n1420), .Y(n1424)
         );
  AO22X1TS U1882 ( .A0(Data_array_SWR[22]), .A1(n1423), .B0(Data_array_SWR[18]), .B1(n1422), .Y(n1425) );
  OAI2BB2XLTS U1883 ( .B0(n1454), .B1(n1452), .A0N(final_result_ieee[3]), 
        .A1N(n1451), .Y(n502) );
  OAI2BB2XLTS U1884 ( .B0(n1471), .B1(n1452), .A0N(final_result_ieee[18]), 
        .A1N(n1451), .Y(n501) );
  AOI22X1TS U1885 ( .A0(Data_array_SWR[15]), .A1(n1433), .B0(Data_array_SWR[8]), .B1(n1434), .Y(n1427) );
  AOI22X1TS U1886 ( .A0(Data_array_SWR[11]), .A1(n1435), .B0(
        shift_value_SHT2_EWR[4]), .B1(n1425), .Y(n1426) );
  NAND2X1TS U1887 ( .A(n1427), .B(n1426), .Y(n1430) );
  INVX2TS U1888 ( .A(n1428), .Y(n1429) );
  OAI2BB2XLTS U1889 ( .B0(n1453), .B1(n1452), .A0N(final_result_ieee[2]), 
        .A1N(n1451), .Y(n500) );
  OAI2BB2XLTS U1890 ( .B0(n1472), .B1(n1452), .A0N(final_result_ieee[19]), 
        .A1N(n1451), .Y(n499) );
  AO22XLTS U1891 ( .A0(n1449), .A1(n1431), .B0(final_result_ieee[1]), .B1(
        n1448), .Y(n498) );
  AO22XLTS U1892 ( .A0(n1449), .A1(n1432), .B0(final_result_ieee[0]), .B1(
        n1448), .Y(n497) );
  AOI22X1TS U1893 ( .A0(Data_array_SWR[11]), .A1(n1434), .B0(
        Data_array_SWR[18]), .B1(n1433), .Y(n1438) );
  AOI22X1TS U1894 ( .A0(Data_array_SWR[22]), .A1(n1436), .B0(
        Data_array_SWR[15]), .B1(n1435), .Y(n1437) );
  NAND2X1TS U1895 ( .A(n1438), .B(n1437), .Y(n1443) );
  INVX2TS U1896 ( .A(n1439), .Y(n1442) );
  OAI2BB2XLTS U1897 ( .B0(n1458), .B1(n1452), .A0N(final_result_ieee[6]), 
        .A1N(n1451), .Y(n496) );
  OAI2BB2XLTS U1898 ( .B0(n1468), .B1(n1452), .A0N(final_result_ieee[15]), 
        .A1N(n1448), .Y(n495) );
  AOI22X1TS U1899 ( .A0(Data_array_SWR[20]), .A1(n1392), .B0(n1481), .B1(n1444), .Y(n1473) );
  OAI2BB2XLTS U1900 ( .B0(n1473), .B1(n1452), .A0N(final_result_ieee[20]), 
        .A1N(n1451), .Y(n494) );
  OAI22X1TS U1901 ( .A0(n1447), .A1(n1446), .B0(n1562), .B1(n1445), .Y(n1474)
         );
  AO22XLTS U1902 ( .A0(n1449), .A1(n1474), .B0(final_result_ieee[21]), .B1(
        n1448), .Y(n493) );
  AOI22X1TS U1903 ( .A0(Data_array_SWR[22]), .A1(n1392), .B0(n1481), .B1(n1450), .Y(n1478) );
  OAI2BB2XLTS U1904 ( .B0(n1478), .B1(n1452), .A0N(final_result_ieee[22]), 
        .A1N(n1451), .Y(n492) );
  AOI22X1TS U1905 ( .A0(n1479), .A1(n1453), .B0(n1476), .B1(n930), .Y(n491) );
  AOI22X1TS U1906 ( .A0(n1479), .A1(n1454), .B0(n933), .B1(n1477), .Y(n490) );
  AOI22X1TS U1907 ( .A0(n1479), .A1(n1455), .B0(n934), .B1(n1477), .Y(n489) );
  AOI22X1TS U1908 ( .A0(n1479), .A1(n1456), .B0(n932), .B1(n1477), .Y(n488) );
  AOI22X1TS U1909 ( .A0(n1479), .A1(n1458), .B0(n931), .B1(n1457), .Y(n487) );
  AOI22X1TS U1910 ( .A0(n1479), .A1(n1459), .B0(n917), .B1(n1477), .Y(n486) );
  AO22XLTS U1911 ( .A0(n1476), .A1(DmP_mant_SFG_SWR[10]), .B0(n1475), .B1(
        n1460), .Y(n485) );
  AO22XLTS U1912 ( .A0(n1476), .A1(DmP_mant_SFG_SWR[11]), .B0(n1475), .B1(
        n1461), .Y(n484) );
  AO22XLTS U1913 ( .A0(n1476), .A1(DmP_mant_SFG_SWR[12]), .B0(n1465), .B1(
        n1462), .Y(n483) );
  AO22XLTS U1914 ( .A0(n1476), .A1(DmP_mant_SFG_SWR[13]), .B0(n1475), .B1(
        n1463), .Y(n482) );
  AO22XLTS U1915 ( .A0(n1476), .A1(DmP_mant_SFG_SWR[14]), .B0(n1465), .B1(
        n1464), .Y(n481) );
  AO22XLTS U1916 ( .A0(n1476), .A1(DmP_mant_SFG_SWR[15]), .B0(n1475), .B1(
        n1466), .Y(n480) );
  AOI22X1TS U1917 ( .A0(n1479), .A1(n1467), .B0(n1477), .B1(n918), .Y(n479) );
  AOI22X1TS U1918 ( .A0(n1479), .A1(n1468), .B0(n1477), .B1(n919), .Y(n478) );
  AOI22X1TS U1919 ( .A0(n1479), .A1(n1469), .B0(n1477), .B1(n920), .Y(n477) );
  AOI22X1TS U1920 ( .A0(n1479), .A1(n1470), .B0(n1477), .B1(n921), .Y(n476) );
  AOI22X1TS U1921 ( .A0(n1479), .A1(n1471), .B0(n1477), .B1(n922), .Y(n475) );
  AOI22X1TS U1922 ( .A0(n1479), .A1(n1472), .B0(n1477), .B1(n923), .Y(n474) );
  AOI22X1TS U1923 ( .A0(n1479), .A1(n1473), .B0(n1477), .B1(n924), .Y(n473) );
  AO22XLTS U1924 ( .A0(n1476), .A1(DmP_mant_SFG_SWR[23]), .B0(n1475), .B1(
        n1474), .Y(n472) );
  AOI22X1TS U1925 ( .A0(n1479), .A1(n1478), .B0(n1477), .B1(n926), .Y(n471) );
  AOI22X1TS U1926 ( .A0(Data_array_SWR[23]), .A1(n1392), .B0(n1481), .B1(n1480), .Y(n1482) );
  AOI22X1TS U1927 ( .A0(n1479), .A1(n1482), .B0(n1477), .B1(n927), .Y(n470) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpadd_approx_syn_constraints_clk40.tcl_ETAIIN16Q8_syn.sdf"); 
 endmodule

