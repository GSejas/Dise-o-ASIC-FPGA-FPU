/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Nov  3 18:00:16 2016
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
         n985, n986, n987, n988, n989, n990, n1057, n1058, n1059, n1060, n1061,
         n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071,
         n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081,
         n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091,
         n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101,
         n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111,
         n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121,
         n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131,
         n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141,
         n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151,
         n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161,
         n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171,
         n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181,
         n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191,
         n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201,
         n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211,
         n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221,
         n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231,
         n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241,
         n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251,
         n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261,
         n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271,
         n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281,
         n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291,
         n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301,
         n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311,
         n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321,
         n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331,
         n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341,
         n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351,
         n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361,
         n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371,
         n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381,
         n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391,
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
         n1512, n1513, n1514, n1515, n1516, n1517, n1518;
  wire   [3:0] cont_iter_out;
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

  DFFRX1TS reg_val_muxY_2stage_Q_reg_28_ ( .D(n716), .CK(n1513), .RN(n1455), 
        .Q(d_ff2_Y[28]), .QN(n1447) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(n984), .CK(n1487), .RN(n1482), .Q(
        d_ff1_operation_out), .QN(n1446) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(n652), .CK(n1516), .RN(n1449), 
        .Q(d_ff2_X[28]), .QN(n1444) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_23_ ( .D(n721), .CK(n1511), .RN(n1455), 
        .Q(d_ff2_Y[23]), .QN(n1443) );
  DFFRX1TS reg_shift_x_Q_reg_29_ ( .D(n643), .CK(n1507), .RN(n1463), .QN(n1442) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(n656), .CK(n1067), .RN(n1449), 
        .Q(d_ff2_X[24]), .QN(n1441) );
  DFFRX2TS ITER_CONT_temp_reg_3_ ( .D(n986), .CK(n1486), .RN(n1484), .Q(
        cont_iter_out[3]), .QN(n1439) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(n983), .CK(n1071), .RN(n1482), .Q(
        d_ff1_shift_region_flag_out[0]), .QN(n1438) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n812), .CK(n1504), .RN(n1466), .QN(n1437) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n806), .CK(n1068), .RN(n1465), .QN(n1436) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n810), .CK(n1068), .RN(n1466), .QN(n1435) );
  DFFRX1TS reg_LUT_Q_reg_3_ ( .D(n818), .CK(n1499), .RN(n1466), .QN(n1434) );
  DFFRX1TS reg_LUT_Q_reg_13_ ( .D(n809), .CK(n1506), .RN(n1465), .QN(n1433) );
  DFFRX1TS reg_LUT_Q_reg_15_ ( .D(n808), .CK(n1503), .RN(n1465), .QN(n1432) );
  DFFRX2TS VAR_CONT_temp_reg_0_ ( .D(n985), .CK(n1071), .RN(n1482), .Q(
        cont_var_out[0]), .QN(n1431) );
  DFFRX2TS ITER_CONT_temp_reg_1_ ( .D(n988), .CK(n1490), .RN(n1483), .Q(
        cont_iter_out[1]), .QN(n1430) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(n982), .CK(n1490), .RN(n1482), .Q(
        d_ff1_shift_region_flag_out[1]), .QN(n1429) );
  DFFRX2TS ITER_CONT_temp_reg_2_ ( .D(n987), .CK(n1071), .RN(n1484), .Q(
        cont_iter_out[2]), .QN(n1428) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(n853), .CK(n1493), .RN(n1473), .Q(
        data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(n852), .CK(n1494), .RN(n1473), .Q(
        data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(n851), .CK(n1494), .RN(n1473), .Q(
        data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(n850), .CK(n1492), .RN(n1472), .Q(
        data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(n849), .CK(n1498), .RN(n1472), .Q(
        data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(n848), .CK(n1497), .RN(n1472), .Q(
        data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(n847), .CK(n1065), .RN(n1472), .Q(
        data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(n846), .CK(n1502), .RN(n1472), .Q(
        data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(n845), .CK(n1502), .RN(n1471), .Q(
        data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(n844), .CK(n1500), .RN(n1471), .Q(
        data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(n843), .CK(n1497), .RN(n1471), .Q(
        data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(n842), .CK(n1065), .RN(n1471), .Q(
        data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(n841), .CK(n1500), .RN(n1471), .Q(
        data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(n840), .CK(n1498), .RN(n1470), .Q(
        data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(n839), .CK(n1499), .RN(n1470), .Q(
        data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(n838), .CK(n1497), .RN(n1470), .Q(
        data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(n837), .CK(n1065), .RN(n1470), .Q(
        data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(n836), .CK(n1498), .RN(n1470), .Q(
        data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(n835), .CK(n1500), .RN(n1469), .Q(
        data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(n834), .CK(n1499), .RN(n1469), .Q(
        data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(n833), .CK(n1501), .RN(n1469), .Q(
        data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(n832), .CK(n1500), .RN(n1469), .Q(
        data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(n831), .CK(n1498), .RN(n1469), .Q(
        data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(n830), .CK(n1499), .RN(n1468), .Q(
        data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(n829), .CK(n1501), .RN(n1468), .Q(
        data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(n828), .CK(n1497), .RN(n1468), .Q(
        data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(n827), .CK(n1065), .RN(n1468), .Q(
        data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(n826), .CK(n1501), .RN(n1468), .Q(
        data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(n825), .CK(n1499), .RN(n1467), .Q(
        data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(n824), .CK(n1500), .RN(n1467), .Q(
        data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(n823), .CK(n1501), .RN(n1467), .Q(
        data_output[30]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(n706), .CK(n1506), .RN(n1464), .Q(
        d_ff3_sh_y_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(n704), .CK(n1509), .RN(n1454), .Q(
        d_ff3_sh_y_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(n640), .CK(n1067), .RN(n1449), .Q(
        d_ff3_sh_x_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(n642), .CK(n1504), .RN(n1463), .Q(
        d_ff3_sh_x_out[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(n822), .CK(n1497), .RN(n1467), .Q(
        data_output[31]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n813), .CK(n1504), .RN(n1466), .Q(
        d_ff3_LUT_out[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(n949), .CK(n1487), .RN(n1479), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(n712), .CK(n1507), .RN(n1464), .Q(
        d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(n711), .CK(n1506), .RN(n1464), .Q(
        d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(n710), .CK(n1508), .RN(n1464), .Q(
        d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(n766), .CK(n1513), .RN(n1460), .Q(
        d_ff3_sh_y_out[0]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(n764), .CK(n1512), .RN(n1459), .Q(
        d_ff3_sh_y_out[1]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(n762), .CK(n1511), .RN(n1459), .Q(
        d_ff3_sh_y_out[2]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(n758), .CK(n1512), .RN(n1459), .Q(
        d_ff3_sh_y_out[4]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(n754), .CK(n1066), .RN(n1458), .Q(
        d_ff3_sh_y_out[6]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(n750), .CK(n1514), .RN(n1458), .Q(
        d_ff3_sh_y_out[8]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(n746), .CK(n1512), .RN(n1458), .Q(
        d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(n948), .CK(n1491), .RN(n1479), .Q(d_ff_Zn[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(n947), .CK(n1486), .RN(n1479), .Q(d_ff_Zn[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(n946), .CK(n1491), .RN(n1479), .Q(d_ff_Zn[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(n945), .CK(n1490), .RN(n1479), .Q(d_ff_Zn[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(n944), .CK(n1071), .RN(n1479), .Q(d_ff_Zn[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(n943), .CK(n1489), .RN(n1479), .Q(d_ff_Zn[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(n942), .CK(n1489), .RN(n1479), .Q(d_ff_Zn[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(n941), .CK(n1486), .RN(n1479), .Q(d_ff_Zn[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(n940), .CK(n1486), .RN(n1479), .Q(d_ff_Zn[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(n939), .CK(n1489), .RN(n1478), .Q(
        d_ff_Zn[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(n938), .CK(n1489), .RN(n1478), .Q(
        d_ff_Zn[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(n937), .CK(n1490), .RN(n1478), .Q(
        d_ff_Zn[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(n936), .CK(n1496), .RN(n1478), .Q(
        d_ff_Zn[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(n935), .CK(n1492), .RN(n1478), .Q(
        d_ff_Zn[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(n934), .CK(n1069), .RN(n1478), .Q(
        d_ff_Zn[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(n933), .CK(n1069), .RN(n1478), .Q(
        d_ff_Zn[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(n932), .CK(n1069), .RN(n1478), .Q(
        d_ff_Zn[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(n931), .CK(n1069), .RN(n1478), .Q(
        d_ff_Zn[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(n930), .CK(n1494), .RN(n1478), .Q(
        d_ff_Zn[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(n929), .CK(n1494), .RN(n1477), .Q(
        d_ff_Zn[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(n928), .CK(n1494), .RN(n1477), .Q(
        d_ff_Zn[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(n927), .CK(n1494), .RN(n1477), .Q(
        d_ff_Zn[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(n926), .CK(n1495), .RN(n1477), .Q(
        d_ff_Zn[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(n925), .CK(n1495), .RN(n1477), .Q(
        d_ff_Zn[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(n924), .CK(n1494), .RN(n1477), .Q(
        d_ff_Zn[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(n923), .CK(n1494), .RN(n1477), .Q(
        d_ff_Zn[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(n922), .CK(n1493), .RN(n1477), .Q(
        d_ff_Zn[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(n921), .CK(n1496), .RN(n1477), .Q(
        d_ff_Zn[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(n920), .CK(n1492), .RN(n1477), .Q(
        d_ff_Zn[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(n919), .CK(n1494), .RN(n1476), .Q(
        d_ff_Zn[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(n918), .CK(n1494), .RN(n1476), .Q(
        d_ff_Zn[31]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(n981), .CK(n1489), .RN(n1482), .Q(d_ff1_Z[0])
         );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(n980), .CK(n1491), .RN(n1482), .Q(d_ff1_Z[1])
         );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(n979), .CK(n1491), .RN(n1481), .Q(d_ff1_Z[2])
         );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(n978), .CK(n1491), .RN(n1481), .Q(d_ff1_Z[3])
         );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(n977), .CK(n1489), .RN(n1481), .Q(d_ff1_Z[4])
         );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(n976), .CK(n1487), .RN(n1481), .Q(d_ff1_Z[5])
         );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(n975), .CK(n1487), .RN(n1481), .Q(d_ff1_Z[6])
         );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(n974), .CK(n1487), .RN(n1481), .Q(d_ff1_Z[7])
         );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(n973), .CK(n1071), .RN(n1481), .Q(d_ff1_Z[8])
         );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(n972), .CK(n1489), .RN(n1481), .Q(d_ff1_Z[9])
         );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(n971), .CK(n1490), .RN(n1481), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(n970), .CK(n1071), .RN(n1481), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(n968), .CK(n1486), .RN(n1484), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(n967), .CK(n1071), .RN(n1485), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(n965), .CK(n1489), .RN(n1483), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(n964), .CK(n1486), .RN(n1484), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(n963), .CK(n1490), .RN(n1485), .Q(d_ff1_Z[18]) );
  DFFRX1TS reg_Z0_Q_reg_19_ ( .D(n962), .CK(n1071), .RN(n281), .Q(d_ff1_Z[19])
         );
  DFFRX1TS reg_Z0_Q_reg_20_ ( .D(n961), .CK(n1490), .RN(n281), .Q(d_ff1_Z[20])
         );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(n959), .CK(n1489), .RN(n1480), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(n958), .CK(n1489), .RN(n1480), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(n957), .CK(n1487), .RN(n1480), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(n956), .CK(n1490), .RN(n1480), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(n955), .CK(n1487), .RN(n1480), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(n954), .CK(n1491), .RN(n1480), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(n953), .CK(n1486), .RN(n1480), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(n952), .CK(n1490), .RN(n1480), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(n951), .CK(n1071), .RN(n1480), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(n950), .CK(n1071), .RN(n1480), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(n648), .CK(n1505), .RN(n1464), .Q(
        d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(n647), .CK(n1505), .RN(n1464), .Q(
        d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(n646), .CK(n1508), .RN(n1463), .Q(
        d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(n702), .CK(n1503), .RN(n1454), .Q(
        d_ff3_sh_x_out[0]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(n700), .CK(n1502), .RN(n1454), .Q(
        d_ff3_sh_x_out[1]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(n698), .CK(clk), .RN(n1454), .Q(
        d_ff3_sh_x_out[2]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(n690), .CK(n1488), .RN(n1453), .Q(
        d_ff3_sh_x_out[6]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(n686), .CK(clk), .RN(n1452), .Q(
        d_ff3_sh_x_out[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(n798), .CK(n1068), .RN(n1463), 
        .Q(d_ff2_Z[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(n796), .CK(n1508), .RN(n1463), 
        .Q(d_ff2_Z[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(n794), .CK(n1505), .RN(n1462), 
        .Q(d_ff2_Z[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(n792), .CK(n1507), .RN(n1462), 
        .Q(d_ff2_Z[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(n790), .CK(n1504), .RN(n1462), 
        .Q(d_ff2_Z[10]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(n708), .CK(n1507), .RN(n1464), .Q(
        d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(n760), .CK(n1514), .RN(n1459), .Q(
        d_ff3_sh_y_out[3]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(n756), .CK(n1513), .RN(n1459), .Q(
        d_ff3_sh_y_out[5]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(n752), .CK(n1066), .RN(n1458), .Q(
        d_ff3_sh_y_out[7]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(n748), .CK(n1511), .RN(n1458), .Q(
        d_ff3_sh_y_out[9]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(n744), .CK(n1510), .RN(n1457), .Q(
        d_ff3_sh_y_out[11]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(n742), .CK(n1513), .RN(n1457), .Q(
        d_ff3_sh_y_out[12]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(n740), .CK(n1066), .RN(n1457), .Q(
        d_ff3_sh_y_out[13]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(n738), .CK(n1512), .RN(n1457), .Q(
        d_ff3_sh_y_out[14]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(n736), .CK(n1509), .RN(n1457), .Q(
        d_ff3_sh_y_out[15]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(n734), .CK(n1509), .RN(n1456), .Q(
        d_ff3_sh_y_out[16]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(n732), .CK(n1510), .RN(n1456), .Q(
        d_ff3_sh_y_out[17]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(n730), .CK(n1513), .RN(n1456), .Q(
        d_ff3_sh_y_out[18]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(n728), .CK(n1514), .RN(n1456), .Q(
        d_ff3_sh_y_out[19]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(n726), .CK(n1511), .RN(n1456), .Q(
        d_ff3_sh_y_out[20]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(n724), .CK(n1510), .RN(n1455), .Q(
        d_ff3_sh_y_out[21]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(n722), .CK(n1512), .RN(n1455), .Q(
        d_ff3_sh_y_out[22]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(n709), .CK(n1506), .RN(n1464), .Q(
        d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(n644), .CK(n1503), .RN(n1463), .Q(
        d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(n696), .CK(n1488), .RN(n1453), .Q(
        d_ff3_sh_x_out[3]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(n692), .CK(clk), .RN(n1453), .Q(
        d_ff3_sh_x_out[5]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(n688), .CK(clk), .RN(n1453), .Q(
        d_ff3_sh_x_out[7]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(n684), .CK(n1516), .RN(n1452), .Q(
        d_ff3_sh_x_out[9]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(n680), .CK(n1518), .RN(n1452), .Q(
        d_ff3_sh_x_out[11]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(n678), .CK(n1517), .RN(n1452), .Q(
        d_ff3_sh_x_out[12]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(n676), .CK(n1067), .RN(n1451), .Q(
        d_ff3_sh_x_out[13]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(n674), .CK(n1067), .RN(n1451), .Q(
        d_ff3_sh_x_out[14]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(n672), .CK(n1515), .RN(n1451), .Q(
        d_ff3_sh_x_out[15]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(n670), .CK(n1516), .RN(n1451), .Q(
        d_ff3_sh_x_out[16]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(n668), .CK(n1517), .RN(n1451), .Q(
        d_ff3_sh_x_out[17]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(n666), .CK(n1067), .RN(n1450), .Q(
        d_ff3_sh_x_out[18]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(n664), .CK(n1515), .RN(n1450), .Q(
        d_ff3_sh_x_out[19]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(n662), .CK(n1517), .RN(n1450), .Q(
        d_ff3_sh_x_out[20]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(n660), .CK(n1516), .RN(n1450), .Q(
        d_ff3_sh_x_out[21]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(n658), .CK(n1517), .RN(n1450), .Q(
        d_ff3_sh_x_out[22]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(n707), .CK(n1503), .RN(n1464), .Q(
        d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(n645), .CK(n1504), .RN(n1463), .Q(
        d_ff3_sh_x_out[27]) );
  DFFRX1TS reg_LUT_Q_reg_0_ ( .D(n821), .CK(n1501), .RN(n1467), .Q(
        d_ff3_LUT_out[0]) );
  DFFRX1TS reg_LUT_Q_reg_2_ ( .D(n819), .CK(n1498), .RN(n1466), .Q(
        d_ff3_LUT_out[2]) );
  DFFRX1TS reg_LUT_Q_reg_1_ ( .D(n820), .CK(n1500), .RN(n1467), .Q(
        d_ff3_LUT_out[1]) );
  DFFRX1TS reg_LUT_Q_reg_4_ ( .D(n817), .CK(n1065), .RN(n1466), .Q(
        d_ff3_LUT_out[4]) );
  DFFRX1TS reg_LUT_Q_reg_10_ ( .D(n811), .CK(n1507), .RN(n1466), .Q(
        d_ff3_LUT_out[10]) );
  DFFRX1TS reg_LUT_Q_reg_24_ ( .D(n804), .CK(n1068), .RN(n1465), .Q(
        d_ff3_LUT_out[24]) );
  DFFRX1TS reg_LUT_Q_reg_26_ ( .D(n802), .CK(n1505), .RN(n1465), .Q(
        d_ff3_LUT_out[26]) );
  DFFRX1TS reg_shift_y_Q_reg_23_ ( .D(n713), .CK(n1508), .RN(n1465), .Q(
        d_ff3_sh_y_out[23]) );
  DFFRX1TS reg_LUT_Q_reg_25_ ( .D(n803), .CK(n1506), .RN(n1465), .Q(
        d_ff3_LUT_out[25]) );
  DFFRX1TS reg_shift_x_Q_reg_23_ ( .D(n649), .CK(n1508), .RN(n1464), .Q(
        d_ff3_sh_x_out[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_23_ ( .D(n777), .CK(n1068), .RN(n1461), 
        .Q(d_ff2_Z[23]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_24_ ( .D(n776), .CK(n1508), .RN(n1461), 
        .Q(d_ff2_Z[24]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_27_ ( .D(n773), .CK(n1506), .RN(n1460), 
        .Q(d_ff2_Z[27]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_28_ ( .D(n772), .CK(n1510), .RN(n1460), 
        .Q(d_ff2_Z[28]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_29_ ( .D(n771), .CK(n1066), .RN(n1460), 
        .Q(d_ff2_Z[29]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_30_ ( .D(n770), .CK(n1514), .RN(n1460), 
        .Q(d_ff2_Z[30]) );
  DFFRX1TS reg_LUT_Q_reg_19_ ( .D(n807), .CK(n1506), .RN(n1465), .Q(
        d_ff3_LUT_out[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_30_ ( .D(n855), .CK(n1498), .RN(n1467), .Q(
        d_ff_Xn[30]) );
  DFFRX1TS d_ff4_Yn_Q_reg_23_ ( .D(n894), .CK(n1495), .RN(n1474), .Q(
        d_ff_Yn[23]) );
  DFFRX1TS d_ff4_Yn_Q_reg_28_ ( .D(n889), .CK(n1069), .RN(n1473), .Q(
        d_ff_Yn[28]) );
  DFFRX1TS d_ff4_Xn_Q_reg_4_ ( .D(n881), .CK(n1492), .RN(n1472), .Q(d_ff_Xn[4]) );
  DFFRX1TS d_ff4_Xn_Q_reg_8_ ( .D(n877), .CK(n1501), .RN(n1471), .Q(d_ff_Xn[8]) );
  DFFRX1TS d_ff4_Xn_Q_reg_9_ ( .D(n876), .CK(n1502), .RN(n1471), .Q(d_ff_Xn[9]) );
  DFFRX1TS d_ff4_Xn_Q_reg_11_ ( .D(n874), .CK(n1500), .RN(n1471), .Q(
        d_ff_Xn[11]) );
  DFFRX1TS d_ff4_Xn_Q_reg_15_ ( .D(n870), .CK(n1498), .RN(n1470), .Q(
        d_ff_Xn[15]) );
  DFFRX1TS d_ff4_Xn_Q_reg_18_ ( .D(n867), .CK(n1502), .RN(n1469), .Q(
        d_ff_Xn[18]) );
  DFFRX1TS d_ff4_Xn_Q_reg_21_ ( .D(n864), .CK(n1502), .RN(n1469), .Q(
        d_ff_Xn[21]) );
  DFFRX1TS d_ff4_Xn_Q_reg_22_ ( .D(n863), .CK(n1501), .RN(n1469), .Q(
        d_ff_Xn[22]) );
  DFFRX1TS d_ff4_Xn_Q_reg_23_ ( .D(n862), .CK(n1065), .RN(n1468), .Q(
        d_ff_Xn[23]) );
  DFFRX1TS d_ff4_Yn_Q_reg_1_ ( .D(n916), .CK(n1492), .RN(n1476), .Q(d_ff_Yn[1]) );
  DFFRX1TS d_ff4_Yn_Q_reg_2_ ( .D(n915), .CK(n1493), .RN(n1476), .Q(d_ff_Yn[2]) );
  DFFRX1TS d_ff4_Yn_Q_reg_3_ ( .D(n914), .CK(n1495), .RN(n1476), .Q(d_ff_Yn[3]) );
  DFFRX1TS d_ff4_Yn_Q_reg_4_ ( .D(n913), .CK(n1493), .RN(n1476), .Q(d_ff_Yn[4]) );
  DFFRX1TS d_ff4_Yn_Q_reg_5_ ( .D(n912), .CK(n1496), .RN(n1476), .Q(d_ff_Yn[5]) );
  DFFRX1TS d_ff4_Yn_Q_reg_6_ ( .D(n911), .CK(n1496), .RN(n1476), .Q(d_ff_Yn[6]) );
  DFFRX1TS d_ff4_Yn_Q_reg_7_ ( .D(n910), .CK(n1495), .RN(n1476), .Q(d_ff_Yn[7]) );
  DFFRX1TS d_ff4_Yn_Q_reg_8_ ( .D(n909), .CK(n1493), .RN(n1475), .Q(d_ff_Yn[8]) );
  DFFRX1TS d_ff4_Yn_Q_reg_9_ ( .D(n908), .CK(n1493), .RN(n1475), .Q(d_ff_Yn[9]) );
  DFFRX1TS d_ff4_Yn_Q_reg_10_ ( .D(n907), .CK(n1069), .RN(n1475), .Q(
        d_ff_Yn[10]) );
  DFFRX1TS d_ff4_Yn_Q_reg_11_ ( .D(n906), .CK(n1495), .RN(n1475), .Q(
        d_ff_Yn[11]) );
  DFFRX1TS d_ff4_Yn_Q_reg_12_ ( .D(n905), .CK(n1492), .RN(n1475), .Q(
        d_ff_Yn[12]) );
  DFFRX1TS d_ff4_Yn_Q_reg_13_ ( .D(n904), .CK(n1495), .RN(n1475), .Q(
        d_ff_Yn[13]) );
  DFFRX1TS d_ff4_Yn_Q_reg_14_ ( .D(n903), .CK(n1496), .RN(n1475), .Q(
        d_ff_Yn[14]) );
  DFFRX1TS d_ff4_Yn_Q_reg_15_ ( .D(n902), .CK(n1069), .RN(n1475), .Q(
        d_ff_Yn[15]) );
  DFFRX1TS d_ff4_Yn_Q_reg_16_ ( .D(n901), .CK(n1069), .RN(n1475), .Q(
        d_ff_Yn[16]) );
  DFFRX1TS d_ff4_Yn_Q_reg_17_ ( .D(n900), .CK(n1069), .RN(n1475), .Q(
        d_ff_Yn[17]) );
  DFFRX1TS d_ff4_Yn_Q_reg_18_ ( .D(n899), .CK(n1496), .RN(n1474), .Q(
        d_ff_Yn[18]) );
  DFFRX1TS d_ff4_Yn_Q_reg_19_ ( .D(n898), .CK(n1496), .RN(n1474), .Q(
        d_ff_Yn[19]) );
  DFFRX1TS d_ff4_Yn_Q_reg_20_ ( .D(n897), .CK(n1492), .RN(n1474), .Q(
        d_ff_Yn[20]) );
  DFFRX1TS d_ff4_Yn_Q_reg_21_ ( .D(n896), .CK(n1492), .RN(n1474), .Q(
        d_ff_Yn[21]) );
  DFFRX1TS d_ff4_Yn_Q_reg_22_ ( .D(n895), .CK(n1069), .RN(n1474), .Q(
        d_ff_Yn[22]) );
  DFFRX1TS d_ff4_Yn_Q_reg_24_ ( .D(n893), .CK(n1493), .RN(n1474), .Q(
        d_ff_Yn[24]) );
  DFFRX1TS d_ff4_Yn_Q_reg_25_ ( .D(n892), .CK(n1493), .RN(n1474), .Q(
        d_ff_Yn[25]) );
  DFFRX1TS d_ff4_Yn_Q_reg_26_ ( .D(n891), .CK(n1496), .RN(n1474), .Q(
        d_ff_Yn[26]) );
  DFFRX1TS d_ff4_Yn_Q_reg_27_ ( .D(n890), .CK(n1493), .RN(n1474), .Q(
        d_ff_Yn[27]) );
  DFFRX1TS d_ff4_Yn_Q_reg_29_ ( .D(n888), .CK(n1492), .RN(n1473), .Q(
        d_ff_Yn[29]) );
  DFFRX1TS d_ff4_Yn_Q_reg_30_ ( .D(n887), .CK(n1495), .RN(n1473), .Q(
        d_ff_Yn[30]) );
  DFFRX1TS d_ff4_Xn_Q_reg_0_ ( .D(n885), .CK(n1495), .RN(n1473), .Q(d_ff_Xn[0]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_0_ ( .D(n703), .CK(n1517), .RN(n1454), 
        .Q(d_ff2_X[0]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_4_ ( .D(n695), .CK(n1067), .RN(n1453), 
        .Q(d_ff2_X[4]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_8_ ( .D(n687), .CK(n1517), .RN(n1452), 
        .Q(d_ff2_X[8]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_9_ ( .D(n685), .CK(n1067), .RN(n1452), 
        .Q(d_ff2_X[9]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_11_ ( .D(n681), .CK(n1517), .RN(n1452), 
        .Q(d_ff2_X[11]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_15_ ( .D(n673), .CK(n1517), .RN(n1451), 
        .Q(d_ff2_X[15]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_18_ ( .D(n667), .CK(n1067), .RN(n1450), 
        .Q(d_ff2_X[18]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_21_ ( .D(n661), .CK(n1515), .RN(n1450), 
        .Q(d_ff2_X[21]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_22_ ( .D(n659), .CK(n1518), .RN(n1450), 
        .Q(d_ff2_X[22]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_31_ ( .D(n641), .CK(n1067), .RN(n1449), 
        .Q(d_ff2_X[31]) );
  DFFRX1TS d_ff4_Yn_Q_reg_0_ ( .D(n917), .CK(n1495), .RN(n1476), .Q(d_ff_Yn[0]) );
  DFFRX1TS reg_sign_Q_reg_0_ ( .D(n768), .CK(n1510), .RN(n1460), .Q(
        d_ff3_sign_out) );
  DFFRX1TS reg_LUT_Q_reg_5_ ( .D(n816), .CK(n1068), .RN(n1466), .Q(
        d_ff3_LUT_out[5]) );
  DFFRX1TS reg_LUT_Q_reg_7_ ( .D(n814), .CK(n1505), .RN(n1466), .Q(
        d_ff3_LUT_out[7]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_1_ ( .D(n701), .CK(n1515), .RN(n1454), 
        .Q(d_ff2_X[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_2_ ( .D(n699), .CK(n1518), .RN(n1454), 
        .Q(d_ff2_X[2]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_3_ ( .D(n697), .CK(n1518), .RN(n1453), 
        .Q(d_ff2_X[3]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_5_ ( .D(n693), .CK(n1515), .RN(n1453), 
        .Q(d_ff2_X[5]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_6_ ( .D(n691), .CK(n1516), .RN(n1453), 
        .Q(d_ff2_X[6]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_7_ ( .D(n689), .CK(n1518), .RN(n1453), 
        .Q(d_ff2_X[7]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_10_ ( .D(n683), .CK(n1067), .RN(n1452), 
        .Q(d_ff2_X[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_12_ ( .D(n679), .CK(n1515), .RN(n1452), 
        .Q(d_ff2_X[12]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_13_ ( .D(n677), .CK(n1516), .RN(n1451), 
        .Q(d_ff2_X[13]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_14_ ( .D(n675), .CK(n1518), .RN(n1451), 
        .Q(d_ff2_X[14]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_16_ ( .D(n671), .CK(n1515), .RN(n1451), 
        .Q(d_ff2_X[16]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_17_ ( .D(n669), .CK(n1516), .RN(n1451), 
        .Q(d_ff2_X[17]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_19_ ( .D(n665), .CK(n1518), .RN(n1450), 
        .Q(d_ff2_X[19]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_20_ ( .D(n663), .CK(n1517), .RN(n1450), 
        .Q(d_ff2_X[20]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_0_ ( .D(n767), .CK(n1511), .RN(n1460), 
        .Q(d_ff2_Y[0]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_1_ ( .D(n765), .CK(n1511), .RN(n1459), 
        .Q(d_ff2_Y[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_2_ ( .D(n763), .CK(n1066), .RN(n1459), 
        .Q(d_ff2_Y[2]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_3_ ( .D(n761), .CK(n1513), .RN(n1459), 
        .Q(d_ff2_Y[3]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_4_ ( .D(n759), .CK(n1510), .RN(n1459), 
        .Q(d_ff2_Y[4]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_5_ ( .D(n757), .CK(n1511), .RN(n1459), 
        .Q(d_ff2_Y[5]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_6_ ( .D(n755), .CK(n1509), .RN(n1458), 
        .Q(d_ff2_Y[6]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_7_ ( .D(n753), .CK(n1066), .RN(n1458), 
        .Q(d_ff2_Y[7]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_8_ ( .D(n751), .CK(n1514), .RN(n1458), 
        .Q(d_ff2_Y[8]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_9_ ( .D(n749), .CK(n1514), .RN(n1458), 
        .Q(d_ff2_Y[9]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_10_ ( .D(n747), .CK(n1514), .RN(n1458), 
        .Q(d_ff2_Y[10]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_11_ ( .D(n745), .CK(n1513), .RN(n1457), 
        .Q(d_ff2_Y[11]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_12_ ( .D(n743), .CK(n1066), .RN(n1457), 
        .Q(d_ff2_Y[12]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_13_ ( .D(n741), .CK(n1513), .RN(n1457), 
        .Q(d_ff2_Y[13]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_14_ ( .D(n739), .CK(n1066), .RN(n1457), 
        .Q(d_ff2_Y[14]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_15_ ( .D(n737), .CK(n1511), .RN(n1457), 
        .Q(d_ff2_Y[15]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_16_ ( .D(n735), .CK(n1509), .RN(n1456), 
        .Q(d_ff2_Y[16]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_17_ ( .D(n733), .CK(n1510), .RN(n1456), 
        .Q(d_ff2_Y[17]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_18_ ( .D(n731), .CK(n1511), .RN(n1456), 
        .Q(d_ff2_Y[18]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_19_ ( .D(n729), .CK(n1514), .RN(n1456), 
        .Q(d_ff2_Y[19]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_20_ ( .D(n727), .CK(n1514), .RN(n1456), 
        .Q(d_ff2_Y[20]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_21_ ( .D(n725), .CK(n1066), .RN(n1455), 
        .Q(d_ff2_Y[21]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_22_ ( .D(n723), .CK(n1511), .RN(n1455), 
        .Q(d_ff2_Y[22]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_31_ ( .D(n705), .CK(n1513), .RN(n1454), 
        .Q(d_ff2_Y[31]) );
  DFFRX1TS d_ff4_Xn_Q_reg_24_ ( .D(n861), .CK(n1500), .RN(n1468), .Q(
        d_ff_Xn[24]) );
  DFFRX1TS d_ff4_Xn_Q_reg_27_ ( .D(n858), .CK(n1501), .RN(n1468), .Q(
        d_ff_Xn[27]) );
  DFFRX1TS d_ff4_Xn_Q_reg_28_ ( .D(n857), .CK(n1499), .RN(n1467), .Q(
        d_ff_Xn[28]) );
  DFFRX1TS d_ff4_Xn_Q_reg_29_ ( .D(n856), .CK(n1500), .RN(n1467), .Q(
        d_ff_Xn[29]) );
  DFFRX1TS d_ff4_Xn_Q_reg_1_ ( .D(n884), .CK(n1493), .RN(n1473), .Q(d_ff_Xn[1]) );
  DFFRX1TS d_ff4_Xn_Q_reg_2_ ( .D(n883), .CK(n1492), .RN(n1473), .Q(d_ff_Xn[2]) );
  DFFRX1TS d_ff4_Xn_Q_reg_3_ ( .D(n882), .CK(n1496), .RN(n1472), .Q(d_ff_Xn[3]) );
  DFFRX1TS d_ff4_Xn_Q_reg_5_ ( .D(n880), .CK(n1499), .RN(n1472), .Q(d_ff_Xn[5]) );
  DFFRX1TS d_ff4_Xn_Q_reg_6_ ( .D(n879), .CK(n1499), .RN(n1472), .Q(d_ff_Xn[6]) );
  DFFRX1TS d_ff4_Xn_Q_reg_7_ ( .D(n878), .CK(n1065), .RN(n1472), .Q(d_ff_Xn[7]) );
  DFFRX1TS d_ff4_Xn_Q_reg_10_ ( .D(n875), .CK(n1498), .RN(n1471), .Q(
        d_ff_Xn[10]) );
  DFFRX1TS d_ff4_Xn_Q_reg_12_ ( .D(n873), .CK(n1500), .RN(n1471), .Q(
        d_ff_Xn[12]) );
  DFFRX1TS d_ff4_Xn_Q_reg_13_ ( .D(n872), .CK(n1498), .RN(n1470), .Q(
        d_ff_Xn[13]) );
  DFFRX1TS d_ff4_Xn_Q_reg_14_ ( .D(n871), .CK(n1065), .RN(n1470), .Q(
        d_ff_Xn[14]) );
  DFFRX1TS d_ff4_Xn_Q_reg_16_ ( .D(n869), .CK(n1501), .RN(n1470), .Q(
        d_ff_Xn[16]) );
  DFFRX1TS d_ff4_Xn_Q_reg_17_ ( .D(n868), .CK(n1499), .RN(n1470), .Q(
        d_ff_Xn[17]) );
  DFFRX1TS d_ff4_Xn_Q_reg_19_ ( .D(n866), .CK(n1065), .RN(n1469), .Q(
        d_ff_Xn[19]) );
  DFFRX1TS d_ff4_Xn_Q_reg_20_ ( .D(n865), .CK(n1498), .RN(n1469), .Q(
        d_ff_Xn[20]) );
  DFFRX1TS d_ff4_Xn_Q_reg_25_ ( .D(n860), .CK(n1501), .RN(n1468), .Q(
        d_ff_Xn[25]) );
  DFFRX1TS d_ff4_Xn_Q_reg_26_ ( .D(n859), .CK(n1065), .RN(n1468), .Q(
        d_ff_Xn[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_30_ ( .D(n650), .CK(n1515), .RN(n1449), 
        .Q(d_ff2_X[30]) );
  DFFRX1TS d_ff4_Yn_Q_reg_31_ ( .D(n886), .CK(n1496), .RN(n1473), .Q(
        d_ff_Yn[31]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(n1491), .RN(n1482), .Q(
        inst_CORDIC_FSM_v3_state_reg[1]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_31_ ( .D(n769), .CK(n1510), .RN(n1460), 
        .Q(d_ff2_Z[31]) );
  DFFRX1TS d_ff4_Xn_Q_reg_31_ ( .D(n854), .CK(n1499), .RN(n1467), .Q(
        d_ff_Xn[31]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(n1448), .CK(n1491), .RN(
        n1482), .Q(inst_CORDIC_FSM_v3_state_reg[3]) );
  DFFRX1TS reg_LUT_Q_reg_27_ ( .D(n801), .CK(n1507), .RN(n1465), .Q(
        d_ff3_LUT_out[27]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_30_ ( .D(n714), .CK(n1513), .RN(n1454), 
        .Q(d_ff2_Y[30]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(n719), .CK(n1066), .RN(n1455), 
        .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(n718), .CK(n1510), .RN(n1455), 
        .Q(d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(n655), .CK(n1516), .RN(n1449), 
        .Q(d_ff2_X[25]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(n654), .CK(n1518), .RN(n1449), 
        .Q(d_ff2_X[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(n720), .CK(n1514), .RN(n1455), 
        .Q(d_ff2_Y[24]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(n1486), .RN(n1485), .Q(
        inst_CORDIC_FSM_v3_state_reg[4]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(n651), .CK(n1517), .RN(n1449), 
        .Q(d_ff2_X[29]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(
        inst_CORDIC_FSM_v3_state_next[2]), .CK(n1487), .RN(n1482), .Q(
        inst_CORDIC_FSM_v3_state_reg[2]) );
  DFFSX2TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(n1516), .SN(n1484), .Q(
        inst_CORDIC_FSM_v3_state_reg[0]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(n715), .CK(n1509), .RN(n1454), 
        .Q(d_ff2_Y[29]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_23_ ( .D(n657), .CK(n1518), .RN(n1449), 
        .Q(d_ff2_X[23]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(n1491), .RN(n1485), .Q(
        inst_CORDIC_FSM_v3_state_reg[7]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_27_ ( .D(n653), .CK(n1518), .RN(n1449), 
        .Q(d_ff2_X[27]) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(n1486), .RN(n1482), .Q(
        inst_CORDIC_FSM_v3_state_reg[5]) );
  DFFRX2TS reg_val_muxY_2stage_Q_reg_27_ ( .D(n717), .CK(n1510), .RN(n1455), 
        .Q(d_ff2_Y[27]) );
  DFFRX1TS VAR_CONT_temp_reg_1_ ( .D(n990), .CK(n1516), .RN(n1485), .Q(
        cont_var_out[1]), .QN(n1440) );
  DFFRX1TS reg_LUT_Q_reg_6_ ( .D(n815), .CK(n1508), .RN(n1466), .Q(
        d_ff3_LUT_out[6]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_26_ ( .D(n774), .CK(n1505), .RN(n1460), 
        .Q(d_ff2_Z[26]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_25_ ( .D(n775), .CK(n1508), .RN(n1460), 
        .Q(d_ff2_Z[25]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_22_ ( .D(n778), .CK(n1068), .RN(n1461), 
        .Q(d_ff2_Z[22]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_21_ ( .D(n779), .CK(n1508), .RN(n1461), 
        .Q(d_ff2_Z[21]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_20_ ( .D(n780), .CK(n1507), .RN(n1461), 
        .Q(d_ff2_Z[20]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_19_ ( .D(n781), .CK(n1503), .RN(n1461), 
        .Q(d_ff2_Z[19]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_18_ ( .D(n782), .CK(n1505), .RN(n1461), 
        .Q(d_ff2_Z[18]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_17_ ( .D(n783), .CK(n1507), .RN(n1461), 
        .Q(d_ff2_Z[17]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_16_ ( .D(n784), .CK(n1506), .RN(n1461), 
        .Q(d_ff2_Z[16]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_15_ ( .D(n785), .CK(n1068), .RN(n1461), 
        .Q(d_ff2_Z[15]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_14_ ( .D(n786), .CK(n1503), .RN(n1462), 
        .Q(d_ff2_Z[14]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_13_ ( .D(n787), .CK(n1507), .RN(n1462), 
        .Q(d_ff2_Z[13]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_12_ ( .D(n788), .CK(n1506), .RN(n1462), 
        .Q(d_ff2_Z[12]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_11_ ( .D(n789), .CK(n1505), .RN(n1462), 
        .Q(d_ff2_Z[11]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_9_ ( .D(n791), .CK(n1507), .RN(n1462), 
        .Q(d_ff2_Z[9]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_7_ ( .D(n793), .CK(n1505), .RN(n1462), 
        .Q(d_ff2_Z[7]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_5_ ( .D(n795), .CK(n1505), .RN(n1462), 
        .Q(d_ff2_Z[5]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_3_ ( .D(n797), .CK(n1068), .RN(n1463), 
        .Q(d_ff2_Z[3]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_1_ ( .D(n799), .CK(n1508), .RN(n1463), 
        .Q(d_ff2_Z[1]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_0_ ( .D(n800), .CK(n1506), .RN(n1463), 
        .Q(d_ff2_Z[0]) );
  DFFRX1TS reg_LUT_Q_reg_23_ ( .D(n805), .CK(n1068), .RN(n1465), .Q(
        d_ff3_LUT_out[23]) );
  DFFRX1TS reg_shift_x_Q_reg_4_ ( .D(n694), .CK(n1515), .RN(n1453), .Q(
        d_ff3_sh_x_out[4]) );
  DFFRX1TS reg_shift_x_Q_reg_10_ ( .D(n682), .CK(n1515), .RN(n1452), .Q(
        d_ff3_sh_x_out[10]) );
  DFFRX2TS ITER_CONT_temp_reg_0_ ( .D(n989), .CK(n1487), .RN(n1483), .Q(
        cont_iter_out[0]), .QN(n1427) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(n1490), .RN(n1483), .Q(
        inst_CORDIC_FSM_v3_state_reg[6]), .QN(n1445) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(n969), .CK(n1487), .RN(n281), .Q(d_ff1_Z[12])
         );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(n966), .CK(n1486), .RN(n281), .Q(d_ff1_Z[15])
         );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(n960), .CK(n1491), .RN(n281), .Q(d_ff1_Z[21])
         );
  NAND4XLTS U705 ( .A(n1439), .B(n1428), .C(n1059), .D(n1430), .Y(n1092) );
  CLKBUFX3TS U706 ( .A(n1417), .Y(n1416) );
  CLKBUFX2TS U707 ( .A(n1310), .Y(n1308) );
  AOI222X1TS U708 ( .A0(n1232), .A1(d_ff2_Y[9]), .B0(n1315), .B1(d_ff2_X[9]), 
        .C0(d_ff2_Z[9]), .C1(n1248), .Y(n1230) );
  AOI222X1TS U709 ( .A0(n1232), .A1(d_ff2_Y[15]), .B0(n1235), .B1(d_ff2_X[15]), 
        .C0(d_ff2_Z[15]), .C1(n1248), .Y(n1224) );
  AOI222X1TS U710 ( .A0(n1232), .A1(d_ff2_Y[16]), .B0(n1235), .B1(d_ff2_X[16]), 
        .C0(d_ff2_Z[16]), .C1(n1392), .Y(n1223) );
  AOI222X1TS U711 ( .A0(n1273), .A1(d_ff2_Y[21]), .B0(n1272), .B1(d_ff2_X[21]), 
        .C0(d_ff2_Z[21]), .C1(n1248), .Y(n1219) );
  AOI222X1TS U712 ( .A0(n1273), .A1(d_ff2_Y[22]), .B0(n1272), .B1(d_ff2_X[22]), 
        .C0(d_ff2_Z[22]), .C1(n1392), .Y(n1218) );
  AOI222X1TS U713 ( .A0(n1189), .A1(d_ff2_Z[19]), .B0(n1120), .B1(d_ff1_Z[19]), 
        .C0(d_ff_Zn[19]), .C1(n1116), .Y(n1117) );
  AOI211X1TS U714 ( .A0(n1059), .A1(n1430), .B0(n1410), .C0(n1409), .Y(n1080)
         );
  CLKINVX3TS U715 ( .A(n1074), .Y(n1448) );
  AOI222X1TS U716 ( .A0(n1176), .A1(data_output[24]), .B0(n1175), .B1(
        d_ff_Yn[24]), .C0(n1161), .C1(d_ff_Xn[24]), .Y(n1169) );
  AOI222X1TS U717 ( .A0(n1167), .A1(data_output[23]), .B0(n1175), .B1(
        d_ff_Yn[23]), .C0(n1107), .C1(d_ff_Xn[23]), .Y(n1168) );
  AOI222X1TS U718 ( .A0(n1176), .A1(data_output[22]), .B0(n1175), .B1(
        d_ff_Yn[22]), .C0(n1174), .C1(d_ff_Xn[22]), .Y(n1166) );
  AOI222X1TS U719 ( .A0(n1167), .A1(data_output[14]), .B0(n1162), .B1(
        d_ff_Yn[14]), .C0(n1107), .C1(d_ff_Xn[14]), .Y(n1151) );
  AND2X2TS U720 ( .A(n1092), .B(n1448), .Y(n1057) );
  INVX2TS U721 ( .A(n1427), .Y(n1058) );
  INVX2TS U722 ( .A(n1058), .Y(n1059) );
  INVX2TS U723 ( .A(n1057), .Y(n1060) );
  INVX2TS U724 ( .A(n1057), .Y(n1061) );
  INVX2TS U725 ( .A(n1057), .Y(n1062) );
  AOI222X1TS U726 ( .A0(n1185), .A1(data_output[12]), .B0(n1162), .B1(
        d_ff_Yn[12]), .C0(n1161), .C1(d_ff_Xn[12]), .Y(n1148) );
  AOI222X1TS U727 ( .A0(n1167), .A1(data_output[16]), .B0(n1162), .B1(
        d_ff_Yn[16]), .C0(n1174), .C1(d_ff_Xn[16]), .Y(n1153) );
  AOI222X1TS U728 ( .A0(n1167), .A1(data_output[18]), .B0(n1162), .B1(
        d_ff_Yn[18]), .C0(n1161), .C1(d_ff_Xn[18]), .Y(n1155) );
  AOI222X4TS U729 ( .A0(n1167), .A1(data_output[20]), .B0(n1162), .B1(
        d_ff_Yn[20]), .C0(n1107), .C1(d_ff_Xn[20]), .Y(n1163) );
  AOI32X1TS U730 ( .A0(cont_iter_out[0]), .A1(n1426), .A2(n1313), .B0(
        d_ff3_LUT_out[23]), .B1(n1410), .Y(n1126) );
  CLKINVX3TS U731 ( .A(n1300), .Y(n1426) );
  CLKBUFX3TS U732 ( .A(n1485), .Y(n1483) );
  CLKBUFX3TS U733 ( .A(n281), .Y(n1485) );
  CLKINVX3TS U734 ( .A(n1448), .Y(n1113) );
  CLKINVX3TS U735 ( .A(n1416), .Y(n1140) );
  CLKINVX3TS U736 ( .A(n1300), .Y(n1414) );
  CLKBUFX3TS U737 ( .A(n1079), .Y(n1300) );
  INVX2TS U738 ( .A(n1358), .Y(n1063) );
  INVX2TS U739 ( .A(n1063), .Y(n1064) );
  INVX2TS U740 ( .A(n1146), .Y(n1174) );
  NOR2X2TS U741 ( .A(cont_iter_out[3]), .B(n1428), .Y(n1349) );
  NOR2X2TS U742 ( .A(n1439), .B(n1428), .Y(n1205) );
  NOR4X2TS U743 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(inst_CORDIC_FSM_v3_state_reg[3]), 
        .D(inst_CORDIC_FSM_v3_state_reg[0]), .Y(n1197) );
  NOR3X4TS U744 ( .A(n1405), .B(n1427), .C(n1430), .Y(n1406) );
  BUFX3TS U745 ( .A(n1085), .Y(n1502) );
  CLKINVX6TS U746 ( .A(n1070), .Y(n1065) );
  BUFX6TS U747 ( .A(n1085), .Y(n1500) );
  BUFX6TS U748 ( .A(n1085), .Y(n1501) );
  BUFX6TS U749 ( .A(n1085), .Y(n1499) );
  BUFX6TS U750 ( .A(n1085), .Y(n1498) );
  BUFX3TS U751 ( .A(n1088), .Y(n1509) );
  CLKINVX6TS U752 ( .A(n1070), .Y(n1066) );
  BUFX6TS U753 ( .A(n1088), .Y(n1513) );
  BUFX6TS U754 ( .A(n1088), .Y(n1510) );
  BUFX6TS U755 ( .A(n1088), .Y(n1511) );
  BUFX6TS U756 ( .A(n1088), .Y(n1514) );
  CLKINVX6TS U757 ( .A(n1070), .Y(n1067) );
  BUFX6TS U758 ( .A(n1497), .Y(n1515) );
  BUFX6TS U759 ( .A(clk), .Y(n1518) );
  BUFX6TS U760 ( .A(n1512), .Y(n1517) );
  BUFX6TS U761 ( .A(n1504), .Y(n1516) );
  BUFX3TS U762 ( .A(n1084), .Y(n1503) );
  CLKINVX6TS U763 ( .A(n1070), .Y(n1068) );
  BUFX6TS U764 ( .A(n1084), .Y(n1505) );
  BUFX6TS U765 ( .A(n1084), .Y(n1506) );
  BUFX6TS U766 ( .A(n1084), .Y(n1507) );
  BUFX6TS U767 ( .A(n1084), .Y(n1508) );
  CLKINVX6TS U768 ( .A(n1070), .Y(n1069) );
  BUFX6TS U769 ( .A(n1087), .Y(n1494) );
  BUFX6TS U770 ( .A(n1087), .Y(n1492) );
  BUFX6TS U771 ( .A(n1087), .Y(n1496) );
  BUFX6TS U772 ( .A(n1087), .Y(n1493) );
  BUFX6TS U773 ( .A(n1087), .Y(n1495) );
  INVX2TS U774 ( .A(n1488), .Y(n1070) );
  CLKINVX6TS U775 ( .A(n1070), .Y(n1071) );
  CLKBUFX2TS U776 ( .A(n1086), .Y(n1488) );
  BUFX6TS U777 ( .A(n1086), .Y(n1489) );
  BUFX6TS U778 ( .A(n1086), .Y(n1490) );
  BUFX6TS U779 ( .A(n1086), .Y(n1486) );
  BUFX6TS U780 ( .A(n1086), .Y(n1491) );
  BUFX6TS U781 ( .A(n1086), .Y(n1487) );
  CLKBUFX3TS U782 ( .A(n1072), .Y(n1073) );
  CLKBUFX3TS U783 ( .A(n281), .Y(n1072) );
  XOR2XLTS U784 ( .A(d_ff_Yn[31]), .B(n1157), .Y(n1158) );
  OAI33X4TS U785 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(
        d_ff1_operation_out), .A2(n1438), .B0(n1429), .B1(n1446), .B2(
        d_ff1_shift_region_flag_out[0]), .Y(n1157) );
  AOI222X1TS U786 ( .A0(n1396), .A1(d_ff3_sh_x_out[23]), .B0(n1215), .B1(
        d_ff3_sh_y_out[23]), .C0(n1392), .C1(d_ff3_LUT_out[23]), .Y(n1251) );
  AOI222X1TS U787 ( .A0(n1273), .A1(d_ff2_Y[0]), .B0(n1315), .B1(d_ff2_X[0]), 
        .C0(d_ff2_Z[0]), .C1(n1271), .Y(n1242) );
  AOI222X1TS U788 ( .A0(n1243), .A1(d_ff2_Y[1]), .B0(n1315), .B1(d_ff2_X[1]), 
        .C0(d_ff2_Z[1]), .C1(n1271), .Y(n1240) );
  AOI222X1TS U789 ( .A0(n1140), .A1(d_ff2_Z[3]), .B0(n1132), .B1(d_ff1_Z[3]), 
        .C0(d_ff_Zn[3]), .C1(n1139), .Y(n1133) );
  AOI222X1TS U790 ( .A0(n1243), .A1(d_ff2_Y[3]), .B0(n1315), .B1(d_ff2_X[3]), 
        .C0(d_ff2_Z[3]), .C1(n1401), .Y(n1244) );
  AOI222X1TS U791 ( .A0(n1140), .A1(d_ff2_Z[5]), .B0(n1132), .B1(d_ff1_Z[5]), 
        .C0(d_ff_Zn[5]), .C1(n1139), .Y(n1129) );
  AOI222X1TS U792 ( .A0(n1140), .A1(d_ff2_Z[7]), .B0(n1132), .B1(d_ff1_Z[7]), 
        .C0(d_ff_Zn[7]), .C1(n1139), .Y(n1115) );
  AOI222X1TS U793 ( .A0(n1113), .A1(d_ff2_Z[9]), .B0(n1132), .B1(d_ff1_Z[9]), 
        .C0(d_ff_Zn[9]), .C1(n1139), .Y(n1098) );
  AOI222X1TS U794 ( .A0(n1113), .A1(d_ff2_Z[11]), .B0(n1109), .B1(d_ff1_Z[11]), 
        .C0(d_ff_Zn[11]), .C1(n1116), .Y(n1110) );
  AOI222X1TS U795 ( .A0(n1113), .A1(d_ff2_Z[12]), .B0(n1120), .B1(d_ff1_Z[12]), 
        .C0(d_ff_Zn[12]), .C1(n1116), .Y(n1093) );
  AOI222X1TS U796 ( .A0(n1232), .A1(d_ff2_Y[12]), .B0(n1235), .B1(d_ff2_X[12]), 
        .C0(d_ff2_Z[12]), .C1(n1401), .Y(n1227) );
  AOI222X1TS U797 ( .A0(n1113), .A1(d_ff2_Z[13]), .B0(n1120), .B1(d_ff1_Z[13]), 
        .C0(d_ff_Zn[13]), .C1(n1116), .Y(n1094) );
  AOI222X1TS U798 ( .A0(n1232), .A1(d_ff2_Y[13]), .B0(n1272), .B1(d_ff2_X[13]), 
        .C0(d_ff2_Z[13]), .C1(n1400), .Y(n1226) );
  AOI222X1TS U799 ( .A0(n1113), .A1(d_ff2_Z[14]), .B0(n1120), .B1(d_ff1_Z[14]), 
        .C0(d_ff_Zn[14]), .C1(n1116), .Y(n1097) );
  AOI222X1TS U800 ( .A0(n1232), .A1(d_ff2_Y[14]), .B0(n1235), .B1(d_ff2_X[14]), 
        .C0(d_ff2_Z[14]), .C1(n1241), .Y(n1225) );
  AOI222X1TS U801 ( .A0(n1113), .A1(d_ff2_Z[15]), .B0(n1120), .B1(d_ff1_Z[15]), 
        .C0(d_ff_Zn[15]), .C1(n1116), .Y(n1099) );
  AOI222X1TS U802 ( .A0(n1113), .A1(d_ff2_Z[16]), .B0(n1120), .B1(d_ff1_Z[16]), 
        .C0(d_ff_Zn[16]), .C1(n1116), .Y(n1106) );
  AOI222X1TS U803 ( .A0(n1113), .A1(d_ff2_Z[17]), .B0(n1120), .B1(d_ff1_Z[17]), 
        .C0(d_ff_Zn[17]), .C1(n1116), .Y(n1111) );
  AOI222X1TS U804 ( .A0(n1232), .A1(d_ff2_Y[17]), .B0(n1235), .B1(d_ff2_X[17]), 
        .C0(d_ff2_Z[17]), .C1(n1271), .Y(n1222) );
  AOI222X1TS U805 ( .A0(n1113), .A1(d_ff2_Z[18]), .B0(n1120), .B1(d_ff1_Z[18]), 
        .C0(d_ff_Zn[18]), .C1(n1116), .Y(n1114) );
  AOI222X1TS U806 ( .A0(n1273), .A1(d_ff2_Y[18]), .B0(n1235), .B1(d_ff2_X[18]), 
        .C0(d_ff2_Z[18]), .C1(n1401), .Y(n1221) );
  AOI222X1TS U807 ( .A0(n1273), .A1(d_ff2_Y[19]), .B0(n1235), .B1(d_ff2_X[19]), 
        .C0(d_ff2_Z[19]), .C1(n1400), .Y(n1220) );
  AOI222X1TS U808 ( .A0(n1189), .A1(d_ff2_Z[20]), .B0(n1120), .B1(d_ff1_Z[20]), 
        .C0(d_ff_Zn[20]), .C1(n1188), .Y(n1119) );
  AOI222X1TS U809 ( .A0(n1273), .A1(d_ff2_Y[20]), .B0(n1272), .B1(d_ff2_X[20]), 
        .C0(d_ff2_Z[20]), .C1(n1241), .Y(n1238) );
  AOI222X1TS U810 ( .A0(n1189), .A1(d_ff2_Z[21]), .B0(n1120), .B1(d_ff1_Z[21]), 
        .C0(d_ff_Zn[21]), .C1(n1188), .Y(n1121) );
  AOI222X1TS U811 ( .A0(n1273), .A1(d_ff2_Y[25]), .B0(n1272), .B1(d_ff2_X[25]), 
        .C0(d_ff2_Z[25]), .C1(n1271), .Y(n1212) );
  AOI222X1TS U812 ( .A0(n1273), .A1(d_ff2_Y[26]), .B0(n1272), .B1(d_ff2_X[26]), 
        .C0(d_ff2_Z[26]), .C1(n1401), .Y(n1211) );
  AOI222X1TS U813 ( .A0(n1396), .A1(d_ff3_sh_x_out[6]), .B0(n1272), .B1(
        d_ff3_sh_y_out[6]), .C0(d_ff3_LUT_out[6]), .C1(n1400), .Y(n1266) );
  NOR2X2TS U814 ( .A(n1349), .B(n1359), .Y(n1412) );
  AOI222X1TS U815 ( .A0(n1149), .A1(data_output[1]), .B0(n1164), .B1(
        d_ff_Yn[1]), .C0(n1161), .C1(d_ff_Xn[1]), .Y(n1104) );
  AOI222X1TS U816 ( .A0(n1167), .A1(data_output[13]), .B0(n1164), .B1(
        d_ff_Yn[13]), .C0(n1107), .C1(d_ff_Xn[13]), .Y(n1150) );
  AOI222X4TS U817 ( .A0(n1167), .A1(data_output[15]), .B0(n1164), .B1(
        d_ff_Yn[15]), .C0(n1161), .C1(d_ff_Xn[15]), .Y(n1152) );
  AOI222X4TS U818 ( .A0(n1167), .A1(data_output[17]), .B0(n1164), .B1(
        d_ff_Yn[17]), .C0(n1174), .C1(d_ff_Xn[17]), .Y(n1154) );
  AOI222X4TS U819 ( .A0(n1167), .A1(data_output[19]), .B0(n1164), .B1(
        d_ff_Yn[19]), .C0(n1107), .C1(d_ff_Xn[19]), .Y(n1156) );
  AOI222X1TS U820 ( .A0(n1149), .A1(data_output[0]), .B0(d_ff_Yn[0]), .B1(
        n1164), .C0(d_ff_Xn[0]), .C1(n1174), .Y(n1108) );
  AOI222X1TS U821 ( .A0(n1140), .A1(d_ff2_Z[0]), .B0(n1139), .B1(d_ff_Zn[0]), 
        .C0(n1138), .C1(d_ff1_Z[0]), .Y(n1141) );
  AOI222X1TS U822 ( .A0(n1140), .A1(d_ff2_Z[1]), .B0(n1138), .B1(d_ff1_Z[1]), 
        .C0(d_ff_Zn[1]), .C1(n1139), .Y(n1136) );
  AOI222X4TS U823 ( .A0(n1140), .A1(d_ff2_Z[2]), .B0(n1138), .B1(d_ff1_Z[2]), 
        .C0(d_ff_Zn[2]), .C1(n1139), .Y(n1135) );
  AOI222X4TS U824 ( .A0(n1140), .A1(d_ff2_Z[4]), .B0(n1138), .B1(d_ff1_Z[4]), 
        .C0(d_ff_Zn[4]), .C1(n1139), .Y(n1131) );
  AOI222X4TS U825 ( .A0(n1113), .A1(d_ff2_Z[10]), .B0(n1138), .B1(d_ff1_Z[10]), 
        .C0(d_ff_Zn[10]), .C1(n1116), .Y(n1105) );
  AOI222X4TS U826 ( .A0(n1140), .A1(d_ff2_Z[8]), .B0(n1138), .B1(d_ff1_Z[8]), 
        .C0(d_ff_Zn[8]), .C1(n1139), .Y(n1096) );
  AOI222X4TS U827 ( .A0(n1140), .A1(d_ff2_Z[6]), .B0(n1138), .B1(d_ff1_Z[6]), 
        .C0(d_ff_Zn[6]), .C1(n1139), .Y(n1095) );
  CLKBUFX3TS U828 ( .A(n1308), .Y(n1304) );
  CLKBUFX3TS U829 ( .A(n1321), .Y(n1319) );
  CLKBUFX3TS U830 ( .A(n1345), .Y(n1320) );
  CLKBUFX3TS U831 ( .A(n1295), .Y(n1280) );
  AOI222X1TS U832 ( .A0(n1176), .A1(data_output[30]), .B0(n1175), .B1(
        d_ff_Yn[30]), .C0(n1161), .C1(d_ff_Xn[30]), .Y(n1112) );
  AOI222X4TS U833 ( .A0(n1167), .A1(data_output[21]), .B0(n1164), .B1(
        d_ff_Yn[21]), .C0(n1107), .C1(d_ff_Xn[21]), .Y(n1165) );
  AOI222X1TS U834 ( .A0(n1176), .A1(data_output[25]), .B0(n1175), .B1(
        d_ff_Yn[25]), .C0(n1174), .C1(d_ff_Xn[25]), .Y(n1170) );
  AOI222X1TS U835 ( .A0(n1396), .A1(d_ff3_sh_x_out[25]), .B0(n1253), .B1(
        d_ff3_sh_y_out[25]), .C0(d_ff3_LUT_out[25]), .C1(n1392), .Y(n1249) );
  AOI222X4TS U836 ( .A0(n1243), .A1(d_ff2_Y[2]), .B0(n1315), .B1(d_ff2_X[2]), 
        .C0(d_ff2_Z[2]), .C1(n1248), .Y(n1239) );
  AOI222X4TS U837 ( .A0(n1243), .A1(d_ff2_Y[4]), .B0(n1315), .B1(d_ff2_X[4]), 
        .C0(d_ff2_Z[4]), .C1(n1241), .Y(n1237) );
  AOI222X1TS U838 ( .A0(n1243), .A1(d_ff2_Y[5]), .B0(n1235), .B1(d_ff2_X[5]), 
        .C0(d_ff2_Z[5]), .C1(n1400), .Y(n1236) );
  AOI222X4TS U839 ( .A0(n1243), .A1(d_ff2_Y[6]), .B0(n1315), .B1(d_ff2_X[6]), 
        .C0(d_ff2_Z[6]), .C1(n1401), .Y(n1234) );
  AOI222X1TS U840 ( .A0(n1232), .A1(d_ff2_Y[7]), .B0(n1315), .B1(d_ff2_X[7]), 
        .C0(d_ff2_Z[7]), .C1(n1271), .Y(n1233) );
  AOI222X4TS U841 ( .A0(n1243), .A1(d_ff2_Y[8]), .B0(n1315), .B1(d_ff2_X[8]), 
        .C0(d_ff2_Z[8]), .C1(n1392), .Y(n1231) );
  AOI222X4TS U842 ( .A0(n1232), .A1(d_ff2_Y[10]), .B0(n1235), .B1(d_ff2_X[10]), 
        .C0(d_ff2_Z[10]), .C1(n1241), .Y(n1229) );
  AOI222X1TS U843 ( .A0(n1232), .A1(d_ff2_Y[11]), .B0(n1235), .B1(d_ff2_X[11]), 
        .C0(d_ff2_Z[11]), .C1(n1400), .Y(n1228) );
  NOR3X2TS U844 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[4]), .C(inst_CORDIC_FSM_v3_state_reg[1]), 
        .Y(n1077) );
  OAI21X2TS U845 ( .A0(n1205), .A1(n1427), .B0(n1409), .Y(n1359) );
  OAI211X2TS U846 ( .A0(cont_iter_out[2]), .A1(cont_iter_out[0]), .B0(n1193), 
        .C0(n1409), .Y(n1334) );
  NAND2X2TS U847 ( .A(cont_iter_out[3]), .B(n1428), .Y(n1409) );
  AOI222X1TS U848 ( .A0(n1189), .A1(d_ff2_Z[22]), .B0(n1201), .B1(d_ff1_Z[22]), 
        .C0(d_ff_Zn[22]), .C1(n1188), .Y(n1122) );
  AOI222X1TS U849 ( .A0(n1189), .A1(d_ff2_Z[25]), .B0(n1201), .B1(d_ff1_Z[25]), 
        .C0(d_ff_Zn[25]), .C1(n1188), .Y(n1123) );
  AOI222X1TS U850 ( .A0(n1189), .A1(d_ff2_Z[26]), .B0(n1201), .B1(d_ff1_Z[26]), 
        .C0(d_ff_Zn[26]), .C1(n1188), .Y(n1125) );
  CLKINVX3TS U851 ( .A(n1416), .Y(n1189) );
  NOR3X4TS U852 ( .A(inst_CORDIC_FSM_v3_state_reg[5]), .B(n1445), .C(n1089), 
        .Y(enab_cont_iter) );
  NOR2XLTS U853 ( .A(n1405), .B(n1387), .Y(n1100) );
  OAI21XLTS U854 ( .A0(n1410), .A1(n1289), .B0(n1194), .Y(n713) );
  OAI21XLTS U855 ( .A0(n1383), .A1(n1437), .B0(n1264), .Y(add_subt_dataB[9])
         );
  OAI21XLTS U856 ( .A0(n1262), .A1(n1432), .B0(n1254), .Y(add_subt_dataB[20])
         );
  OAI21XLTS U857 ( .A0(n1246), .A1(n1443), .B0(n1217), .Y(add_subt_dataA[23])
         );
  INVX2TS U858 ( .A(rst), .Y(n281) );
  BUFX3TS U859 ( .A(n1483), .Y(n1475) );
  CLKBUFX3TS U860 ( .A(n1485), .Y(n1484) );
  BUFX3TS U861 ( .A(n1484), .Y(n1481) );
  BUFX3TS U862 ( .A(n1483), .Y(n1477) );
  BUFX3TS U863 ( .A(n1483), .Y(n1476) );
  BUFX3TS U864 ( .A(n1483), .Y(n1478) );
  BUFX3TS U865 ( .A(n1072), .Y(n1462) );
  BUFX3TS U866 ( .A(n1073), .Y(n1461) );
  BUFX3TS U867 ( .A(n1072), .Y(n1452) );
  BUFX3TS U868 ( .A(n1073), .Y(n1453) );
  BUFX3TS U869 ( .A(n1483), .Y(n1474) );
  BUFX3TS U870 ( .A(n1484), .Y(n1480) );
  BUFX3TS U871 ( .A(n1072), .Y(n1465) );
  BUFX3TS U872 ( .A(n1484), .Y(n1482) );
  BUFX3TS U873 ( .A(n281), .Y(n1471) );
  BUFX3TS U874 ( .A(n1072), .Y(n1472) );
  BUFX3TS U875 ( .A(n1485), .Y(n1470) );
  BUFX3TS U876 ( .A(n1485), .Y(n1473) );
  BUFX3TS U877 ( .A(n1073), .Y(n1469) );
  BUFX3TS U878 ( .A(n1073), .Y(n1455) );
  BUFX3TS U879 ( .A(n1484), .Y(n1468) );
  BUFX3TS U880 ( .A(n1072), .Y(n1449) );
  BUFX3TS U881 ( .A(n1072), .Y(n1460) );
  BUFX3TS U882 ( .A(n1072), .Y(n1454) );
  BUFX3TS U883 ( .A(n1483), .Y(n1463) );
  BUFX3TS U884 ( .A(n1073), .Y(n1450) );
  BUFX3TS U885 ( .A(n1073), .Y(n1451) );
  BUFX3TS U886 ( .A(n1073), .Y(n1456) );
  BUFX3TS U887 ( .A(n1072), .Y(n1457) );
  BUFX3TS U888 ( .A(n1484), .Y(n1479) );
  BUFX3TS U889 ( .A(n1072), .Y(n1466) );
  BUFX3TS U890 ( .A(n1485), .Y(n1467) );
  BUFX3TS U891 ( .A(n1073), .Y(n1458) );
  BUFX3TS U892 ( .A(n1073), .Y(n1459) );
  BUFX3TS U893 ( .A(n1073), .Y(n1464) );
  NOR3BX1TS U894 ( .AN(n1197), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[1]), .Y(n1075) );
  NAND3BXLTS U895 ( .AN(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(n1075), .Y(n1074) );
  NOR3BX1TS U896 ( .AN(n1077), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[3]), .Y(n1195) );
  NAND2BX1TS U897 ( .AN(inst_CORDIC_FSM_v3_state_reg[0]), .B(n1195), .Y(n1089)
         );
  NAND3BX1TS U898 ( .AN(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[4]), .C(n1075), .Y(n1384) );
  NOR3BX2TS U899 ( .AN(n1384), .B(enab_cont_iter), .C(ready_add_subt), .Y(
        n1275) );
  NAND2X1TS U900 ( .A(cont_var_out[0]), .B(n1440), .Y(n1214) );
  NAND2X1TS U901 ( .A(cont_var_out[1]), .B(n1431), .Y(n1246) );
  NAND2X1TS U902 ( .A(n1275), .B(cont_var_out[1]), .Y(n1076) );
  OAI211XLTS U903 ( .A0(n1275), .A1(n1214), .B0(n1246), .C0(n1076), .Y(n990)
         );
  NAND3X1TS U904 ( .A(inst_CORDIC_FSM_v3_state_reg[7]), .B(n1197), .C(n1077), 
        .Y(n1388) );
  INVX2TS U905 ( .A(n1388), .Y(ready_cordic) );
  NOR3XLTS U906 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .Y(n1078) );
  NAND4BXLTS U907 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(
        inst_CORDIC_FSM_v3_state_reg[3]), .C(n1078), .D(n1077), .Y(n1079) );
  NAND2X2TS U908 ( .A(n1414), .B(n1430), .Y(n1352) );
  CLKBUFX2TS U909 ( .A(n1079), .Y(n1279) );
  CLKBUFX2TS U910 ( .A(n1279), .Y(n1287) );
  CLKBUFX3TS U911 ( .A(n1287), .Y(n1410) );
  NAND2X2TS U912 ( .A(n1414), .B(cont_iter_out[1]), .Y(n1347) );
  NOR3X1TS U913 ( .A(cont_iter_out[2]), .B(n1059), .C(n1347), .Y(n1191) );
  AOI211X1TS U914 ( .A0(d_ff3_LUT_out[6]), .A1(n1410), .B0(n1080), .C0(n1191), 
        .Y(n1081) );
  OAI31X1TS U915 ( .A0(cont_iter_out[3]), .A1(cont_iter_out[0]), .A2(n1352), 
        .B0(n1081), .Y(n815) );
  NAND3XLTS U916 ( .A(n1440), .B(n1431), .C(ready_add_subt), .Y(n1082) );
  CLKBUFX2TS U917 ( .A(n1082), .Y(n1326) );
  INVX2TS U918 ( .A(n1326), .Y(n1314) );
  CLKBUFX2TS U919 ( .A(n1082), .Y(n1321) );
  AO22XLTS U920 ( .A0(n1314), .A1(result_add_subt[31]), .B0(n1321), .B1(
        d_ff_Xn[31]), .Y(n854) );
  INVX2TS U921 ( .A(n1352), .Y(n1332) );
  INVX2TS U922 ( .A(n1349), .Y(n1193) );
  AOI22X1TS U923 ( .A0(n1332), .A1(n1334), .B0(d_ff3_LUT_out[1]), .B1(n1410), 
        .Y(n1083) );
  OAI2BB1X1TS U924 ( .A0N(n1409), .A1N(n1193), .B0(n1414), .Y(n1118) );
  NAND2X1TS U925 ( .A(n1083), .B(n1118), .Y(n820) );
  CLKBUFX2TS U926 ( .A(clk), .Y(n1085) );
  CLKBUFX2TS U927 ( .A(clk), .Y(n1086) );
  BUFX3TS U928 ( .A(n1085), .Y(n1497) );
  CLKBUFX2TS U929 ( .A(clk), .Y(n1084) );
  BUFX3TS U930 ( .A(n1084), .Y(n1504) );
  CLKBUFX2TS U931 ( .A(clk), .Y(n1088) );
  BUFX3TS U932 ( .A(n1088), .Y(n1512) );
  CLKBUFX2TS U933 ( .A(clk), .Y(n1087) );
  NAND3BX1TS U934 ( .AN(n1089), .B(inst_CORDIC_FSM_v3_state_reg[5]), .C(n1445), 
        .Y(n1385) );
  NAND2X1TS U935 ( .A(n1384), .B(n1385), .Y(beg_add_subt) );
  INVX2TS U936 ( .A(n1214), .Y(n1215) );
  CLKBUFX2TS U937 ( .A(n1215), .Y(n1253) );
  CLKBUFX2TS U938 ( .A(n1253), .Y(n1404) );
  INVX2TS U939 ( .A(n1246), .Y(n1396) );
  CLKBUFX2TS U940 ( .A(n1396), .Y(n1260) );
  CLKBUFX2TS U941 ( .A(n1260), .Y(n1398) );
  CLKBUFX3TS U942 ( .A(n1398), .Y(n1243) );
  OR2X2TS U943 ( .A(n1440), .B(n1431), .Y(n1262) );
  CLKBUFX2TS U944 ( .A(n1262), .Y(n1389) );
  INVX2TS U945 ( .A(n1389), .Y(n1401) );
  AOI22X1TS U946 ( .A0(n1243), .A1(d_ff2_Y[29]), .B0(d_ff2_Z[29]), .B1(n1248), 
        .Y(n1090) );
  OAI2BB1X1TS U947 ( .A0N(n1253), .A1N(d_ff2_X[29]), .B0(n1090), .Y(
        add_subt_dataA[29]) );
  AOI22X1TS U948 ( .A0(n1243), .A1(d_ff2_Y[27]), .B0(d_ff2_Z[27]), .B1(n1392), 
        .Y(n1091) );
  OAI2BB1X1TS U949 ( .A0N(n1216), .A1N(d_ff2_X[27]), .B0(n1091), .Y(
        add_subt_dataA[27]) );
  CLKBUFX2TS U950 ( .A(n1448), .Y(n1417) );
  NOR2X1TS U951 ( .A(n1140), .B(n1092), .Y(n1109) );
  CLKBUFX2TS U952 ( .A(n1109), .Y(n1132) );
  CLKBUFX3TS U953 ( .A(n1132), .Y(n1120) );
  INVX2TS U954 ( .A(n1060), .Y(n1328) );
  CLKBUFX2TS U955 ( .A(n1328), .Y(n1337) );
  CLKBUFX3TS U956 ( .A(n1337), .Y(n1116) );
  INVX2TS U957 ( .A(n1093), .Y(n788) );
  INVX2TS U958 ( .A(n1094), .Y(n787) );
  CLKBUFX2TS U959 ( .A(n1132), .Y(n1138) );
  CLKBUFX3TS U960 ( .A(n1337), .Y(n1139) );
  INVX2TS U961 ( .A(n1095), .Y(n794) );
  INVX2TS U962 ( .A(n1096), .Y(n792) );
  INVX2TS U963 ( .A(n1097), .Y(n786) );
  INVX2TS U964 ( .A(n1098), .Y(n791) );
  INVX2TS U965 ( .A(n1099), .Y(n785) );
  INVX2TS U966 ( .A(enab_cont_iter), .Y(n1405) );
  NAND3X1TS U967 ( .A(n1205), .B(cont_iter_out[0]), .C(cont_iter_out[1]), .Y(
        n1387) );
  NOR2XLTS U968 ( .A(ready_cordic), .B(n1100), .Y(n1101) );
  CLKBUFX2TS U969 ( .A(n1101), .Y(n1149) );
  XNOR2X1TS U970 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), 
        .Y(n1102) );
  XNOR2X1TS U971 ( .A(d_ff1_shift_region_flag_out[0]), .B(n1102), .Y(n1103) );
  NOR2BX1TS U972 ( .AN(n1103), .B(n1149), .Y(n1127) );
  CLKBUFX2TS U973 ( .A(n1127), .Y(n1162) );
  CLKBUFX2TS U974 ( .A(n1162), .Y(n1164) );
  CLKBUFX3TS U975 ( .A(n1149), .Y(n1176) );
  OR2X2TS U976 ( .A(n1176), .B(n1103), .Y(n1146) );
  INVX2TS U977 ( .A(n1146), .Y(n1183) );
  INVX2TS U978 ( .A(n1104), .Y(n852) );
  INVX2TS U979 ( .A(n1105), .Y(n790) );
  INVX2TS U980 ( .A(n1106), .Y(n784) );
  INVX2TS U981 ( .A(n1146), .Y(n1107) );
  INVX2TS U982 ( .A(n1108), .Y(n853) );
  INVX2TS U983 ( .A(n1347), .Y(n1360) );
  INVX2TS U984 ( .A(n1205), .Y(n1313) );
  NAND2X1TS U985 ( .A(n1360), .B(n1313), .Y(n1411) );
  OAI211XLTS U986 ( .A0(n1426), .A1(n1432), .B0(n1118), .C0(n1411), .Y(n808)
         );
  INVX2TS U987 ( .A(n1110), .Y(n789) );
  INVX2TS U988 ( .A(n1111), .Y(n783) );
  CLKBUFX3TS U989 ( .A(n1162), .Y(n1175) );
  INVX2TS U990 ( .A(n1112), .Y(n823) );
  INVX2TS U991 ( .A(n1114), .Y(n782) );
  INVX2TS U992 ( .A(n1115), .Y(n793) );
  INVX2TS U993 ( .A(n1117), .Y(n781) );
  NAND2X1TS U994 ( .A(n1332), .B(n1313), .Y(n1124) );
  OAI211XLTS U995 ( .A0(n1426), .A1(n1434), .B0(n1118), .C0(n1124), .Y(n818)
         );
  CLKBUFX3TS U996 ( .A(n1328), .Y(n1188) );
  INVX2TS U997 ( .A(n1119), .Y(n780) );
  INVX2TS U998 ( .A(n1121), .Y(n779) );
  CLKBUFX3TS U999 ( .A(n1132), .Y(n1201) );
  INVX2TS U1000 ( .A(n1122), .Y(n778) );
  INVX2TS U1001 ( .A(n1123), .Y(n775) );
  NAND2X1TS U1002 ( .A(n1360), .B(n1334), .Y(n1408) );
  OAI211XLTS U1003 ( .A0(n1426), .A1(n1437), .B0(n1124), .C0(n1408), .Y(n812)
         );
  INVX2TS U1004 ( .A(n1125), .Y(n774) );
  NAND2X1TS U1005 ( .A(n1414), .B(n1059), .Y(n1350) );
  OAI21XLTS U1006 ( .A0(n1313), .A1(n1350), .B0(n1126), .Y(n805) );
  CLKBUFX2TS U1007 ( .A(n1260), .Y(n1378) );
  NAND2X1TS U1008 ( .A(n1378), .B(ready_add_subt), .Y(n1276) );
  CLKBUFX2TS U1009 ( .A(n1276), .Y(n1295) );
  NOR2XLTS U1010 ( .A(n1385), .B(n1280), .Y(inst_CORDIC_FSM_v3_state_next[6])
         );
  CLKBUFX3TS U1011 ( .A(n1127), .Y(n1184) );
  AOI222X1TS U1012 ( .A0(n1149), .A1(data_output[2]), .B0(n1184), .B1(
        d_ff_Yn[2]), .C0(n1183), .C1(d_ff_Xn[2]), .Y(n1128) );
  INVX2TS U1013 ( .A(n1128), .Y(n851) );
  INVX2TS U1014 ( .A(n1129), .Y(n795) );
  CLKBUFX3TS U1015 ( .A(n1149), .Y(n1185) );
  AOI222X1TS U1016 ( .A0(n1185), .A1(data_output[3]), .B0(n1184), .B1(
        d_ff_Yn[3]), .C0(n1183), .C1(d_ff_Xn[3]), .Y(n1130) );
  INVX2TS U1017 ( .A(n1130), .Y(n850) );
  INVX2TS U1018 ( .A(n1131), .Y(n796) );
  INVX2TS U1019 ( .A(n1133), .Y(n797) );
  AOI222X1TS U1020 ( .A0(n1185), .A1(data_output[4]), .B0(n1184), .B1(
        d_ff_Yn[4]), .C0(n1183), .C1(d_ff_Xn[4]), .Y(n1134) );
  INVX2TS U1021 ( .A(n1134), .Y(n849) );
  INVX2TS U1022 ( .A(n1135), .Y(n798) );
  INVX2TS U1023 ( .A(n1136), .Y(n799) );
  AOI222X1TS U1024 ( .A0(n1185), .A1(data_output[6]), .B0(n1184), .B1(
        d_ff_Yn[6]), .C0(n1183), .C1(d_ff_Xn[6]), .Y(n1137) );
  INVX2TS U1025 ( .A(n1137), .Y(n847) );
  INVX2TS U1026 ( .A(n1141), .Y(n800) );
  AOI222X1TS U1027 ( .A0(n1185), .A1(data_output[7]), .B0(n1184), .B1(
        d_ff_Yn[7]), .C0(n1183), .C1(d_ff_Xn[7]), .Y(n1142) );
  INVX2TS U1028 ( .A(n1142), .Y(n846) );
  AOI222X1TS U1029 ( .A0(n1185), .A1(data_output[8]), .B0(n1184), .B1(
        d_ff_Yn[8]), .C0(n1183), .C1(d_ff_Xn[8]), .Y(n1143) );
  INVX2TS U1030 ( .A(n1143), .Y(n845) );
  AOI222X1TS U1031 ( .A0(n1185), .A1(data_output[9]), .B0(n1184), .B1(
        d_ff_Yn[9]), .C0(n1183), .C1(d_ff_Xn[9]), .Y(n1144) );
  INVX2TS U1032 ( .A(n1144), .Y(n844) );
  AOI222X1TS U1033 ( .A0(n1185), .A1(data_output[10]), .B0(n1184), .B1(
        d_ff_Yn[10]), .C0(n1161), .C1(d_ff_Xn[10]), .Y(n1145) );
  INVX2TS U1034 ( .A(n1145), .Y(n843) );
  INVX2TS U1035 ( .A(n1146), .Y(n1161) );
  AOI222X1TS U1036 ( .A0(n1185), .A1(data_output[11]), .B0(n1184), .B1(
        d_ff_Yn[11]), .C0(n1174), .C1(d_ff_Xn[11]), .Y(n1147) );
  INVX2TS U1037 ( .A(n1147), .Y(n842) );
  INVX2TS U1038 ( .A(n1148), .Y(n841) );
  CLKBUFX3TS U1039 ( .A(n1149), .Y(n1167) );
  INVX2TS U1040 ( .A(n1150), .Y(n840) );
  INVX2TS U1041 ( .A(n1151), .Y(n839) );
  INVX2TS U1042 ( .A(n1152), .Y(n838) );
  INVX2TS U1043 ( .A(n1153), .Y(n837) );
  INVX2TS U1044 ( .A(n1154), .Y(n836) );
  INVX2TS U1045 ( .A(n1155), .Y(n835) );
  INVX2TS U1046 ( .A(n1156), .Y(n834) );
  XNOR2X1TS U1047 ( .A(n1157), .B(d_ff_Xn[31]), .Y(n1160) );
  AOI22X1TS U1048 ( .A0(n1176), .A1(data_output[31]), .B0(n1175), .B1(n1158), 
        .Y(n1159) );
  OAI21XLTS U1049 ( .A0(n1160), .A1(n1146), .B0(n1159), .Y(n822) );
  INVX2TS U1050 ( .A(n1163), .Y(n833) );
  INVX2TS U1051 ( .A(n1165), .Y(n832) );
  INVX2TS U1052 ( .A(n1166), .Y(n831) );
  INVX2TS U1053 ( .A(n1168), .Y(n830) );
  INVX2TS U1054 ( .A(n1169), .Y(n829) );
  INVX2TS U1055 ( .A(n1170), .Y(n828) );
  AOI222X1TS U1056 ( .A0(n1176), .A1(data_output[26]), .B0(n1175), .B1(
        d_ff_Yn[26]), .C0(n1174), .C1(d_ff_Xn[26]), .Y(n1171) );
  INVX2TS U1057 ( .A(n1171), .Y(n827) );
  AOI222X1TS U1058 ( .A0(n1176), .A1(data_output[27]), .B0(n1175), .B1(
        d_ff_Yn[27]), .C0(n1161), .C1(d_ff_Xn[27]), .Y(n1172) );
  INVX2TS U1059 ( .A(n1172), .Y(n826) );
  AOI222X1TS U1060 ( .A0(n1176), .A1(data_output[28]), .B0(n1175), .B1(
        d_ff_Yn[28]), .C0(n1107), .C1(d_ff_Xn[28]), .Y(n1173) );
  INVX2TS U1061 ( .A(n1173), .Y(n825) );
  AOI222X1TS U1062 ( .A0(n1176), .A1(data_output[29]), .B0(n1175), .B1(
        d_ff_Yn[29]), .C0(n1174), .C1(d_ff_Xn[29]), .Y(n1177) );
  INVX2TS U1063 ( .A(n1177), .Y(n824) );
  INVX2TS U1064 ( .A(n1416), .Y(n1374) );
  AOI222X1TS U1065 ( .A0(n1374), .A1(d_ff2_Z[29]), .B0(n1201), .B1(d_ff1_Z[29]), .C0(d_ff_Zn[29]), .C1(n1188), .Y(n1178) );
  INVX2TS U1066 ( .A(n1178), .Y(n771) );
  CLKBUFX3TS U1067 ( .A(n1337), .Y(n1375) );
  AOI222X1TS U1068 ( .A0(n1374), .A1(d_ff2_Z[30]), .B0(n1201), .B1(d_ff1_Z[30]), .C0(d_ff_Zn[30]), .C1(n1375), .Y(n1179) );
  INVX2TS U1069 ( .A(n1179), .Y(n770) );
  AOI222X1TS U1070 ( .A0(n1189), .A1(d_ff2_Z[28]), .B0(n1201), .B1(d_ff1_Z[28]), .C0(d_ff_Zn[28]), .C1(n1188), .Y(n1180) );
  INVX2TS U1071 ( .A(n1180), .Y(n772) );
  AOI21X1TS U1072 ( .A0(cont_iter_out[2]), .A1(cont_iter_out[0]), .B0(
        cont_iter_out[3]), .Y(n1207) );
  CLKBUFX3TS U1073 ( .A(n1279), .Y(n1424) );
  AOI22X1TS U1074 ( .A0(n1426), .A1(n1207), .B0(d_ff3_LUT_out[26]), .B1(n1424), 
        .Y(n1181) );
  OAI21XLTS U1075 ( .A0(cont_iter_out[3]), .A1(n1352), .B0(n1181), .Y(n802) );
  OAI21XLTS U1076 ( .A0(n1241), .A1(n1384), .B0(n1424), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  AOI222X1TS U1077 ( .A0(n1189), .A1(d_ff2_Z[27]), .B0(n1201), .B1(d_ff1_Z[27]), .C0(d_ff_Zn[27]), .C1(n1188), .Y(n1182) );
  INVX2TS U1078 ( .A(n1182), .Y(n773) );
  AOI222X1TS U1079 ( .A0(n1185), .A1(data_output[5]), .B0(n1184), .B1(
        d_ff_Yn[5]), .C0(n1107), .C1(d_ff_Xn[5]), .Y(n1186) );
  INVX2TS U1080 ( .A(n1186), .Y(n848) );
  AOI222X1TS U1081 ( .A0(n1189), .A1(d_ff2_Z[24]), .B0(n1201), .B1(d_ff1_Z[24]), .C0(d_ff_Zn[24]), .C1(n1188), .Y(n1187) );
  INVX2TS U1082 ( .A(n1187), .Y(n776) );
  AOI222X1TS U1083 ( .A0(n1189), .A1(d_ff2_Z[23]), .B0(n1201), .B1(d_ff1_Z[23]), .C0(d_ff_Zn[23]), .C1(n1188), .Y(n1190) );
  INVX2TS U1084 ( .A(n1190), .Y(n777) );
  AOI21X1TS U1085 ( .A0(d_ff3_LUT_out[2]), .A1(n1424), .B0(n1191), .Y(n1192)
         );
  OAI21XLTS U1086 ( .A0(n1352), .A1(n1193), .B0(n1192), .Y(n819) );
  NAND2X1TS U1087 ( .A(cont_iter_out[0]), .B(n1443), .Y(n1289) );
  INVX2TS U1088 ( .A(n1350), .Y(n1418) );
  AOI22X1TS U1089 ( .A0(d_ff2_Y[23]), .A1(n1418), .B0(d_ff3_sh_y_out[23]), 
        .B1(n1424), .Y(n1194) );
  NOR2XLTS U1090 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1196) );
  NAND3X1TS U1091 ( .A(n1196), .B(inst_CORDIC_FSM_v3_state_reg[0]), .C(n1195), 
        .Y(n1382) );
  NAND2BXLTS U1092 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(n1197), .Y(n1198) );
  NOR4BX1TS U1093 ( .AN(inst_CORDIC_FSM_v3_state_reg[1]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(inst_CORDIC_FSM_v3_state_reg[4]), 
        .D(n1198), .Y(n1358) );
  NOR2BX4TS U1094 ( .AN(n1382), .B(n1064), .Y(n1311) );
  INVX2TS U1095 ( .A(n1311), .Y(n1310) );
  INVX2TS U1096 ( .A(n1305), .Y(n1306) );
  NOR4X1TS U1097 ( .A(enab_cont_iter), .B(n1414), .C(n1417), .D(beg_add_subt), 
        .Y(n1199) );
  AOI32X1TS U1098 ( .A0(n1306), .A1(n1388), .A2(n1199), .B0(ready_cordic), 
        .B1(ack_cordic), .Y(n1200) );
  OAI21XLTS U1099 ( .A0(beg_fsm_cordic), .A1(n1382), .B0(n1200), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  AOI222X1TS U1100 ( .A0(n1374), .A1(d_ff2_Z[31]), .B0(n1201), .B1(d_ff1_Z[31]), .C0(d_ff_Zn[31]), .C1(n1375), .Y(n1202) );
  INVX2TS U1101 ( .A(n1202), .Y(n769) );
  NAND2X1TS U1102 ( .A(cont_iter_out[0]), .B(n1313), .Y(n1203) );
  AOI22X1TS U1103 ( .A0(n1332), .A1(n1203), .B0(d_ff3_LUT_out[24]), .B1(n1410), 
        .Y(n1204) );
  OAI21XLTS U1104 ( .A0(n1059), .A1(n1411), .B0(n1204), .Y(n804) );
  AOI211X1TS U1105 ( .A0(cont_iter_out[0]), .A1(n1439), .B0(cont_iter_out[2]), 
        .C0(n1352), .Y(n1362) );
  AOI21X1TS U1106 ( .A0(d_ff3_LUT_out[0]), .A1(n1424), .B0(n1362), .Y(n1206)
         );
  OAI21XLTS U1107 ( .A0(n1412), .A1(n1347), .B0(n1206), .Y(n821) );
  AOI22X1TS U1108 ( .A0(n1207), .A1(n1332), .B0(d_ff3_LUT_out[4]), .B1(n1410), 
        .Y(n1208) );
  OAI21XLTS U1109 ( .A0(cont_iter_out[2]), .A1(n1347), .B0(n1208), .Y(n817) );
  CLKBUFX3TS U1110 ( .A(n1378), .Y(n1273) );
  CLKBUFX3TS U1111 ( .A(n1404), .Y(n1272) );
  INVX2TS U1112 ( .A(n1389), .Y(n1400) );
  AOI222X1TS U1113 ( .A0(n1273), .A1(d_ff2_Y[31]), .B0(n1272), .B1(d_ff2_X[31]), .C0(d_ff2_Z[31]), .C1(n1271), .Y(n1209) );
  INVX2TS U1114 ( .A(n1209), .Y(add_subt_dataA[31]) );
  AOI22X1TS U1115 ( .A0(n1396), .A1(d_ff2_Y[28]), .B0(d_ff2_Z[28]), .B1(n1271), 
        .Y(n1210) );
  OAI21XLTS U1116 ( .A0(n1214), .A1(n1444), .B0(n1210), .Y(add_subt_dataA[28])
         );
  INVX2TS U1117 ( .A(n1211), .Y(add_subt_dataA[26]) );
  INVX2TS U1118 ( .A(n1212), .Y(add_subt_dataA[25]) );
  AOI22X1TS U1119 ( .A0(n1243), .A1(d_ff2_Y[24]), .B0(d_ff2_Z[24]), .B1(n1401), 
        .Y(n1213) );
  OAI21XLTS U1120 ( .A0(n1214), .A1(n1441), .B0(n1213), .Y(add_subt_dataA[24])
         );
  CLKBUFX2TS U1121 ( .A(n1215), .Y(n1216) );
  CLKBUFX3TS U1122 ( .A(n1216), .Y(n1395) );
  AOI22X1TS U1123 ( .A0(n1395), .A1(d_ff2_X[23]), .B0(d_ff2_Z[23]), .B1(n1400), 
        .Y(n1217) );
  INVX2TS U1124 ( .A(n1218), .Y(add_subt_dataA[22]) );
  INVX2TS U1125 ( .A(n1219), .Y(add_subt_dataA[21]) );
  CLKBUFX3TS U1126 ( .A(n1404), .Y(n1235) );
  INVX2TS U1127 ( .A(n1389), .Y(n1241) );
  INVX2TS U1128 ( .A(n1220), .Y(add_subt_dataA[19]) );
  INVX2TS U1129 ( .A(n1221), .Y(add_subt_dataA[18]) );
  CLKBUFX3TS U1130 ( .A(n1378), .Y(n1232) );
  INVX2TS U1131 ( .A(n1222), .Y(add_subt_dataA[17]) );
  INVX2TS U1132 ( .A(n1223), .Y(add_subt_dataA[16]) );
  INVX2TS U1133 ( .A(n1224), .Y(add_subt_dataA[15]) );
  INVX2TS U1134 ( .A(n1225), .Y(add_subt_dataA[14]) );
  INVX2TS U1135 ( .A(n1226), .Y(add_subt_dataA[13]) );
  INVX2TS U1136 ( .A(n1227), .Y(add_subt_dataA[12]) );
  INVX2TS U1137 ( .A(n1389), .Y(n1248) );
  INVX2TS U1138 ( .A(n1228), .Y(add_subt_dataA[11]) );
  INVX2TS U1139 ( .A(n1229), .Y(add_subt_dataA[10]) );
  CLKBUFX3TS U1140 ( .A(n1253), .Y(n1315) );
  INVX2TS U1141 ( .A(n1230), .Y(add_subt_dataA[9]) );
  INVX2TS U1142 ( .A(n1231), .Y(add_subt_dataA[8]) );
  INVX2TS U1143 ( .A(n1233), .Y(add_subt_dataA[7]) );
  INVX2TS U1144 ( .A(n1234), .Y(add_subt_dataA[6]) );
  INVX2TS U1145 ( .A(n1236), .Y(add_subt_dataA[5]) );
  INVX2TS U1146 ( .A(n1237), .Y(add_subt_dataA[4]) );
  INVX2TS U1147 ( .A(n1238), .Y(add_subt_dataA[20]) );
  INVX2TS U1148 ( .A(n1239), .Y(add_subt_dataA[2]) );
  INVX2TS U1149 ( .A(n1389), .Y(n1271) );
  INVX2TS U1150 ( .A(n1240), .Y(add_subt_dataA[1]) );
  INVX2TS U1151 ( .A(n1242), .Y(add_subt_dataA[0]) );
  INVX2TS U1152 ( .A(n1244), .Y(add_subt_dataA[3]) );
  AOI22X1TS U1153 ( .A0(n1395), .A1(d_ff3_sh_y_out[29]), .B0(n1241), .B1(
        d_ff3_LUT_out[27]), .Y(n1245) );
  OAI21XLTS U1154 ( .A0(n1246), .A1(n1442), .B0(n1245), .Y(add_subt_dataB[29])
         );
  AOI222X1TS U1155 ( .A0(n1396), .A1(d_ff3_sh_x_out[26]), .B0(n1215), .B1(
        d_ff3_sh_y_out[26]), .C0(n1400), .C1(d_ff3_LUT_out[26]), .Y(n1247) );
  INVX2TS U1156 ( .A(n1247), .Y(add_subt_dataB[26]) );
  INVX2TS U1157 ( .A(n1249), .Y(add_subt_dataB[25]) );
  AOI222X1TS U1158 ( .A0(n1378), .A1(d_ff3_sh_x_out[24]), .B0(n1216), .B1(
        d_ff3_sh_y_out[24]), .C0(n1401), .C1(d_ff3_LUT_out[24]), .Y(n1250) );
  INVX2TS U1159 ( .A(n1250), .Y(add_subt_dataB[24]) );
  INVX2TS U1160 ( .A(n1251), .Y(add_subt_dataB[23]) );
  CLKBUFX2TS U1161 ( .A(n1262), .Y(n1383) );
  CLKBUFX3TS U1162 ( .A(n1260), .Y(n1402) );
  AOI22X1TS U1163 ( .A0(n1402), .A1(d_ff3_sh_x_out[21]), .B0(n1395), .B1(
        d_ff3_sh_y_out[21]), .Y(n1252) );
  OAI21XLTS U1164 ( .A0(n1383), .A1(n1436), .B0(n1252), .Y(add_subt_dataB[21])
         );
  AOI22X1TS U1165 ( .A0(n1402), .A1(d_ff3_sh_x_out[20]), .B0(n1216), .B1(
        d_ff3_sh_y_out[20]), .Y(n1254) );
  AOI22X1TS U1166 ( .A0(n1260), .A1(d_ff3_sh_x_out[18]), .B0(n1395), .B1(
        d_ff3_sh_y_out[18]), .Y(n1255) );
  OAI21XLTS U1167 ( .A0(n1262), .A1(n1433), .B0(n1255), .Y(add_subt_dataB[18])
         );
  AOI22X1TS U1168 ( .A0(n1402), .A1(d_ff3_sh_x_out[17]), .B0(n1215), .B1(
        d_ff3_sh_y_out[17]), .Y(n1256) );
  OAI21XLTS U1169 ( .A0(n1383), .A1(n1432), .B0(n1256), .Y(add_subt_dataB[17])
         );
  AOI22X1TS U1170 ( .A0(n1260), .A1(d_ff3_sh_x_out[16]), .B0(n1253), .B1(
        d_ff3_sh_y_out[16]), .Y(n1257) );
  OAI21XLTS U1171 ( .A0(n1262), .A1(n1434), .B0(n1257), .Y(add_subt_dataB[16])
         );
  AOI22X1TS U1172 ( .A0(n1398), .A1(d_ff3_sh_x_out[15]), .B0(n1395), .B1(
        d_ff3_sh_y_out[15]), .Y(n1258) );
  OAI21XLTS U1173 ( .A0(n1383), .A1(n1432), .B0(n1258), .Y(add_subt_dataB[15])
         );
  AOI22X1TS U1174 ( .A0(n1398), .A1(d_ff3_sh_x_out[13]), .B0(n1216), .B1(
        d_ff3_sh_y_out[13]), .Y(n1259) );
  OAI21XLTS U1175 ( .A0(n1262), .A1(n1433), .B0(n1259), .Y(add_subt_dataB[13])
         );
  AOI22X1TS U1176 ( .A0(n1260), .A1(d_ff3_sh_x_out[12]), .B0(n1395), .B1(
        d_ff3_sh_y_out[12]), .Y(n1261) );
  OAI21XLTS U1177 ( .A0(n1262), .A1(n1435), .B0(n1261), .Y(add_subt_dataB[12])
         );
  AOI222X1TS U1178 ( .A0(n1260), .A1(d_ff3_sh_x_out[10]), .B0(n1404), .B1(
        d_ff3_sh_y_out[10]), .C0(n1400), .C1(d_ff3_LUT_out[10]), .Y(n1263) );
  INVX2TS U1179 ( .A(n1263), .Y(add_subt_dataB[10]) );
  AOI22X1TS U1180 ( .A0(n1398), .A1(d_ff3_sh_x_out[9]), .B0(n1215), .B1(
        d_ff3_sh_y_out[9]), .Y(n1264) );
  AOI222X1TS U1181 ( .A0(n1378), .A1(d_ff3_sh_x_out[8]), .B0(n1215), .B1(
        d_ff3_sh_y_out[8]), .C0(n1241), .C1(d_ff3_LUT_out[8]), .Y(n1265) );
  INVX2TS U1182 ( .A(n1265), .Y(add_subt_dataB[8]) );
  INVX2TS U1183 ( .A(n1266), .Y(add_subt_dataB[6]) );
  AOI222X1TS U1184 ( .A0(n1396), .A1(d_ff3_sh_x_out[4]), .B0(n1404), .B1(
        d_ff3_sh_y_out[4]), .C0(n1248), .C1(d_ff3_LUT_out[4]), .Y(n1267) );
  INVX2TS U1185 ( .A(n1267), .Y(add_subt_dataB[4]) );
  AOI22X1TS U1186 ( .A0(n1398), .A1(d_ff3_sh_x_out[3]), .B0(n1253), .B1(
        d_ff3_sh_y_out[3]), .Y(n1268) );
  OAI21XLTS U1187 ( .A0(n1383), .A1(n1434), .B0(n1268), .Y(add_subt_dataB[3])
         );
  AOI222X1TS U1188 ( .A0(n1378), .A1(d_ff3_sh_x_out[2]), .B0(n1215), .B1(
        d_ff3_sh_y_out[2]), .C0(n1392), .C1(d_ff3_LUT_out[2]), .Y(n1269) );
  INVX2TS U1189 ( .A(n1269), .Y(add_subt_dataB[2]) );
  AOI222X1TS U1190 ( .A0(n1396), .A1(d_ff3_sh_x_out[1]), .B0(n1272), .B1(
        d_ff3_sh_y_out[1]), .C0(n1271), .C1(d_ff3_LUT_out[1]), .Y(n1270) );
  INVX2TS U1191 ( .A(n1270), .Y(add_subt_dataB[1]) );
  AOI222X1TS U1192 ( .A0(n1273), .A1(d_ff3_sh_x_out[0]), .B0(n1272), .B1(
        d_ff3_sh_y_out[0]), .C0(n1401), .C1(d_ff3_LUT_out[0]), .Y(n1274) );
  INVX2TS U1193 ( .A(n1274), .Y(add_subt_dataB[0]) );
  AO22XLTS U1194 ( .A0(d_ff2_Y[28]), .A1(n1374), .B0(n1057), .B1(d_ff_Yn[28]), 
        .Y(n716) );
  INVX2TS U1195 ( .A(n1280), .Y(n1386) );
  CLKBUFX3TS U1196 ( .A(n1295), .Y(n1286) );
  AO22XLTS U1197 ( .A0(n1386), .A1(result_add_subt[19]), .B0(n1286), .B1(
        d_ff_Zn[19]), .Y(n930) );
  AO22XLTS U1198 ( .A0(n1386), .A1(result_add_subt[20]), .B0(n1286), .B1(
        d_ff_Zn[20]), .Y(n929) );
  CLKBUFX2TS U1199 ( .A(n1279), .Y(n1298) );
  INVX2TS U1200 ( .A(n1298), .Y(n1363) );
  CLKBUFX3TS U1201 ( .A(n1287), .Y(n1312) );
  AO22XLTS U1202 ( .A0(n1363), .A1(d_ff2_Y[4]), .B0(n1312), .B1(
        d_ff3_sh_y_out[4]), .Y(n758) );
  AOI2BB2XLTS U1203 ( .B0(n1275), .B1(n1431), .A0N(n1431), .A1N(n1275), .Y(
        n985) );
  AO22XLTS U1204 ( .A0(n1306), .A1(d_ff1_shift_region_flag_out[1]), .B0(n1304), 
        .B1(shift_region_flag[1]), .Y(n982) );
  INVX2TS U1205 ( .A(n1298), .Y(n1364) );
  AO22XLTS U1206 ( .A0(n1364), .A1(d_ff2_Y[2]), .B0(n1312), .B1(
        d_ff3_sh_y_out[2]), .Y(n762) );
  AOI2BB2XLTS U1207 ( .B0(cont_iter_out[2]), .B1(n1406), .A0N(n1406), .A1N(
        cont_iter_out[2]), .Y(n987) );
  INVX2TS U1208 ( .A(n1295), .Y(n1296) );
  AO22XLTS U1209 ( .A0(n1296), .A1(result_add_subt[18]), .B0(n1286), .B1(
        d_ff_Zn[18]), .Y(n931) );
  INVX2TS U1210 ( .A(n1300), .Y(n1343) );
  AO22XLTS U1211 ( .A0(n1343), .A1(d_ff2_Y[6]), .B0(n1312), .B1(
        d_ff3_sh_y_out[6]), .Y(n754) );
  CLKBUFX3TS U1212 ( .A(n1295), .Y(n1278) );
  AO22XLTS U1213 ( .A0(n1296), .A1(result_add_subt[15]), .B0(n1278), .B1(
        d_ff_Zn[15]), .Y(n934) );
  AO22XLTS U1214 ( .A0(n1343), .A1(d_ff2_Y[8]), .B0(n1279), .B1(
        d_ff3_sh_y_out[8]), .Y(n750) );
  AO22XLTS U1215 ( .A0(n1296), .A1(result_add_subt[16]), .B0(n1278), .B1(
        d_ff_Zn[16]), .Y(n933) );
  AO22XLTS U1216 ( .A0(n1296), .A1(result_add_subt[17]), .B0(n1286), .B1(
        d_ff_Zn[17]), .Y(n932) );
  AO22XLTS U1217 ( .A0(n1296), .A1(result_add_subt[14]), .B0(n1278), .B1(
        d_ff_Zn[14]), .Y(n935) );
  AO22XLTS U1218 ( .A0(n1343), .A1(d_ff2_Y[10]), .B0(n1298), .B1(
        d_ff3_sh_y_out[10]), .Y(n746) );
  INVX2TS U1219 ( .A(n1276), .Y(n1297) );
  AO22XLTS U1220 ( .A0(n1297), .A1(result_add_subt[13]), .B0(n1278), .B1(
        d_ff_Zn[13]), .Y(n936) );
  AO22XLTS U1221 ( .A0(n1297), .A1(result_add_subt[12]), .B0(n1278), .B1(
        d_ff_Zn[12]), .Y(n937) );
  AO22XLTS U1222 ( .A0(n1296), .A1(result_add_subt[1]), .B0(n1280), .B1(
        d_ff_Zn[1]), .Y(n948) );
  AO22XLTS U1223 ( .A0(n1306), .A1(d_ff1_shift_region_flag_out[0]), .B0(n1303), 
        .B1(shift_region_flag[0]), .Y(n983) );
  NOR2X1TS U1224 ( .A(d_ff2_Y[27]), .B(n1341), .Y(n1340) );
  OR3X1TS U1225 ( .A(d_ff2_Y[27]), .B(d_ff2_Y[28]), .C(n1341), .Y(n1368) );
  OAI21XLTS U1226 ( .A0(n1340), .A1(n1447), .B0(n1368), .Y(n1277) );
  CLKBUFX3TS U1227 ( .A(n1279), .Y(n1344) );
  AO22XLTS U1228 ( .A0(n1363), .A1(n1277), .B0(n1344), .B1(d_ff3_sh_y_out[28]), 
        .Y(n708) );
  AO22XLTS U1229 ( .A0(n1297), .A1(result_add_subt[11]), .B0(n1278), .B1(
        d_ff_Zn[11]), .Y(n938) );
  AO22XLTS U1230 ( .A0(n1364), .A1(d_ff2_Y[3]), .B0(n1312), .B1(
        d_ff3_sh_y_out[3]), .Y(n760) );
  AO22XLTS U1231 ( .A0(n1296), .A1(result_add_subt[2]), .B0(n1280), .B1(
        d_ff_Zn[2]), .Y(n947) );
  AO22XLTS U1232 ( .A0(n1364), .A1(d_ff2_Y[5]), .B0(n1312), .B1(
        d_ff3_sh_y_out[5]), .Y(n756) );
  AO22XLTS U1233 ( .A0(n1297), .A1(result_add_subt[10]), .B0(n1278), .B1(
        d_ff_Zn[10]), .Y(n939) );
  AO22XLTS U1234 ( .A0(n1363), .A1(d_ff2_Y[7]), .B0(n1312), .B1(
        d_ff3_sh_y_out[7]), .Y(n752) );
  AO22XLTS U1235 ( .A0(n1364), .A1(d_ff2_Y[9]), .B0(n1300), .B1(
        d_ff3_sh_y_out[9]), .Y(n748) );
  CLKBUFX2TS U1236 ( .A(n1287), .Y(n1354) );
  INVX2TS U1237 ( .A(n1354), .Y(n1366) );
  AO22XLTS U1238 ( .A0(n1366), .A1(d_ff2_Y[11]), .B0(n1354), .B1(
        d_ff3_sh_y_out[11]), .Y(n744) );
  AO22XLTS U1239 ( .A0(n1297), .A1(result_add_subt[9]), .B0(n1278), .B1(
        d_ff_Zn[9]), .Y(n940) );
  AO22XLTS U1240 ( .A0(n1296), .A1(result_add_subt[3]), .B0(n1280), .B1(
        d_ff_Zn[3]), .Y(n946) );
  AO22XLTS U1241 ( .A0(n1343), .A1(d_ff2_Y[12]), .B0(n1279), .B1(
        d_ff3_sh_y_out[12]), .Y(n742) );
  AO22XLTS U1242 ( .A0(d_ff2_Y[23]), .A1(n1374), .B0(n1057), .B1(d_ff_Yn[23]), 
        .Y(n721) );
  AO22XLTS U1243 ( .A0(n1363), .A1(d_ff2_Y[13]), .B0(n1300), .B1(
        d_ff3_sh_y_out[13]), .Y(n740) );
  AO22XLTS U1244 ( .A0(n1386), .A1(result_add_subt[8]), .B0(n1278), .B1(
        d_ff_Zn[8]), .Y(n941) );
  AO22XLTS U1245 ( .A0(n1414), .A1(d_ff2_Y[14]), .B0(n1298), .B1(
        d_ff3_sh_y_out[14]), .Y(n738) );
  AO22XLTS U1246 ( .A0(n1296), .A1(result_add_subt[4]), .B0(n1280), .B1(
        d_ff_Zn[4]), .Y(n945) );
  AO22XLTS U1247 ( .A0(n1414), .A1(d_ff2_Y[15]), .B0(n1354), .B1(
        d_ff3_sh_y_out[15]), .Y(n736) );
  INVX2TS U1248 ( .A(n1276), .Y(n1281) );
  AO22XLTS U1249 ( .A0(n1281), .A1(result_add_subt[7]), .B0(n1278), .B1(
        d_ff_Zn[7]), .Y(n942) );
  AO22XLTS U1250 ( .A0(n1364), .A1(d_ff2_Y[16]), .B0(n1279), .B1(
        d_ff3_sh_y_out[16]), .Y(n734) );
  AO22XLTS U1251 ( .A0(n1306), .A1(d_ff1_operation_out), .B0(n1308), .B1(
        operation), .Y(n984) );
  AO22XLTS U1252 ( .A0(n1343), .A1(d_ff2_Y[17]), .B0(n1300), .B1(
        d_ff3_sh_y_out[17]), .Y(n732) );
  AO22XLTS U1253 ( .A0(n1281), .A1(result_add_subt[6]), .B0(n1280), .B1(
        d_ff_Zn[6]), .Y(n943) );
  AO22XLTS U1254 ( .A0(n1363), .A1(d_ff2_Y[18]), .B0(n1344), .B1(
        d_ff3_sh_y_out[18]), .Y(n730) );
  AO22XLTS U1255 ( .A0(n1281), .A1(result_add_subt[5]), .B0(n1280), .B1(
        d_ff_Zn[5]), .Y(n944) );
  AO22XLTS U1256 ( .A0(n1363), .A1(d_ff2_Y[1]), .B0(n1312), .B1(
        d_ff3_sh_y_out[1]), .Y(n764) );
  AO22XLTS U1257 ( .A0(n1386), .A1(result_add_subt[21]), .B0(n1286), .B1(
        d_ff_Zn[21]), .Y(n928) );
  AO22XLTS U1258 ( .A0(n1386), .A1(result_add_subt[22]), .B0(n1286), .B1(
        d_ff_Zn[22]), .Y(n927) );
  AO22XLTS U1259 ( .A0(n1364), .A1(d_ff2_Y[0]), .B0(n1312), .B1(
        d_ff3_sh_y_out[0]), .Y(n766) );
  AO22XLTS U1260 ( .A0(n1386), .A1(result_add_subt[23]), .B0(n1286), .B1(
        d_ff_Zn[23]), .Y(n926) );
  INVX2TS U1261 ( .A(n1354), .Y(n1369) );
  CLKBUFX3TS U1262 ( .A(n1287), .Y(n1371) );
  AO22XLTS U1263 ( .A0(n1369), .A1(d_ff2_X[10]), .B0(n1371), .B1(
        d_ff3_sh_x_out[10]), .Y(n682) );
  CMPR32X2TS U1264 ( .A(d_ff2_Y[26]), .B(n1439), .C(n1282), .CO(n1341), .S(
        n1283) );
  AO22XLTS U1265 ( .A0(n1364), .A1(n1283), .B0(n1344), .B1(d_ff3_sh_y_out[26]), 
        .Y(n710) );
  CLKBUFX3TS U1266 ( .A(n1287), .Y(n1365) );
  AO22XLTS U1267 ( .A0(n1369), .A1(d_ff2_X[8]), .B0(n1365), .B1(
        d_ff3_sh_x_out[8]), .Y(n686) );
  AO22XLTS U1268 ( .A0(n1386), .A1(result_add_subt[24]), .B0(n1286), .B1(
        d_ff_Zn[24]), .Y(n925) );
  AO22XLTS U1269 ( .A0(n1369), .A1(d_ff2_X[6]), .B0(n1365), .B1(
        d_ff3_sh_x_out[6]), .Y(n690) );
  INVX2TS U1270 ( .A(n1298), .Y(n1373) );
  AO22XLTS U1271 ( .A0(n1373), .A1(d_ff2_X[4]), .B0(n1365), .B1(
        d_ff3_sh_x_out[4]), .Y(n694) );
  AO22XLTS U1272 ( .A0(n1297), .A1(result_add_subt[25]), .B0(n1286), .B1(
        d_ff_Zn[25]), .Y(n924) );
  AO22XLTS U1273 ( .A0(n1366), .A1(d_ff2_X[2]), .B0(n1365), .B1(
        d_ff3_sh_x_out[2]), .Y(n698) );
  CMPR32X2TS U1274 ( .A(d_ff2_Y[25]), .B(n1428), .C(n1284), .CO(n1282), .S(
        n1285) );
  AO22XLTS U1275 ( .A0(n1343), .A1(n1285), .B0(n1344), .B1(d_ff3_sh_y_out[25]), 
        .Y(n711) );
  AO22XLTS U1276 ( .A0(n1366), .A1(d_ff2_X[1]), .B0(n1365), .B1(
        d_ff3_sh_x_out[1]), .Y(n700) );
  AO22XLTS U1277 ( .A0(n1373), .A1(d_ff2_X[0]), .B0(n1365), .B1(
        d_ff3_sh_x_out[0]), .Y(n702) );
  AO22XLTS U1278 ( .A0(n1297), .A1(result_add_subt[26]), .B0(n1286), .B1(
        d_ff_Zn[26]), .Y(n923) );
  NOR2X2TS U1279 ( .A(d_ff2_X[23]), .B(n1427), .Y(n1420) );
  AOI222X1TS U1280 ( .A0(cont_iter_out[1]), .A1(n1420), .B0(cont_iter_out[1]), 
        .B1(n1441), .C0(n1420), .C1(n1441), .Y(n1291) );
  CLKBUFX3TS U1281 ( .A(n1287), .Y(n1413) );
  AO22XLTS U1282 ( .A0(n1363), .A1(n1288), .B0(n1413), .B1(d_ff3_sh_x_out[26]), 
        .Y(n646) );
  CMPR32X2TS U1283 ( .A(d_ff2_Y[24]), .B(n1430), .C(n1289), .CO(n1284), .S(
        n1290) );
  AO22XLTS U1284 ( .A0(n1343), .A1(n1290), .B0(n1344), .B1(d_ff3_sh_y_out[24]), 
        .Y(n712) );
  CMPR32X2TS U1285 ( .A(n1428), .B(d_ff2_X[25]), .C(n1291), .CO(n1299), .S(
        n1292) );
  AO22XLTS U1286 ( .A0(n1363), .A1(n1292), .B0(n1413), .B1(d_ff3_sh_x_out[25]), 
        .Y(n647) );
  AO22XLTS U1287 ( .A0(n1297), .A1(result_add_subt[27]), .B0(n1295), .B1(
        d_ff_Zn[27]), .Y(n922) );
  XOR2X1TS U1288 ( .A(n1420), .B(d_ff2_X[24]), .Y(n1293) );
  MXI2X1TS U1289 ( .A(n1347), .B(n1352), .S0(n1293), .Y(n1294) );
  AO21XLTS U1290 ( .A0(d_ff3_sh_x_out[24]), .A1(n1312), .B0(n1294), .Y(n648)
         );
  INVX2TS U1291 ( .A(n1310), .Y(n1309) );
  CLKBUFX2TS U1292 ( .A(n1308), .Y(n1305) );
  AO22XLTS U1293 ( .A0(n1309), .A1(d_ff1_Z[31]), .B0(n1305), .B1(data_in[31]), 
        .Y(n950) );
  AO22XLTS U1294 ( .A0(n1297), .A1(result_add_subt[28]), .B0(n1280), .B1(
        d_ff_Zn[28]), .Y(n921) );
  AO22XLTS U1295 ( .A0(n1309), .A1(d_ff1_Z[30]), .B0(n1305), .B1(data_in[30]), 
        .Y(n951) );
  AO22XLTS U1296 ( .A0(n1296), .A1(result_add_subt[0]), .B0(n1295), .B1(
        d_ff_Zn[0]), .Y(n949) );
  AO22XLTS U1297 ( .A0(n1309), .A1(d_ff1_Z[29]), .B0(n1305), .B1(data_in[29]), 
        .Y(n952) );
  AO22XLTS U1298 ( .A0(n1297), .A1(result_add_subt[29]), .B0(n1280), .B1(
        d_ff_Zn[29]), .Y(n920) );
  AO22XLTS U1299 ( .A0(n1309), .A1(d_ff1_Z[28]), .B0(n1305), .B1(data_in[28]), 
        .Y(n953) );
  AO22XLTS U1300 ( .A0(n1309), .A1(d_ff1_Z[27]), .B0(n1305), .B1(data_in[27]), 
        .Y(n954) );
  AO22XLTS U1301 ( .A0(n1373), .A1(n1428), .B0(n1298), .B1(d_ff3_LUT_out[8]), 
        .Y(n813) );
  AO22XLTS U1302 ( .A0(n1309), .A1(d_ff1_Z[26]), .B0(n1305), .B1(data_in[26]), 
        .Y(n955) );
  AO22XLTS U1303 ( .A0(n1386), .A1(result_add_subt[30]), .B0(n1276), .B1(
        d_ff_Zn[30]), .Y(n919) );
  INVX2TS U1304 ( .A(n1308), .Y(n1302) );
  AO22XLTS U1305 ( .A0(n1302), .A1(d_ff1_Z[25]), .B0(n1304), .B1(data_in[25]), 
        .Y(n956) );
  CLKBUFX3TS U1306 ( .A(n1308), .Y(n1303) );
  AO22XLTS U1307 ( .A0(n1302), .A1(d_ff1_Z[24]), .B0(n1304), .B1(data_in[24]), 
        .Y(n957) );
  AO22XLTS U1308 ( .A0(n1386), .A1(result_add_subt[31]), .B0(n1295), .B1(
        d_ff_Zn[31]), .Y(n918) );
  AO22XLTS U1309 ( .A0(n1302), .A1(d_ff1_Z[23]), .B0(n1303), .B1(data_in[23]), 
        .Y(n958) );
  AO22XLTS U1310 ( .A0(n1302), .A1(d_ff1_Z[22]), .B0(n1304), .B1(data_in[22]), 
        .Y(n959) );
  AO22XLTS U1311 ( .A0(n1306), .A1(d_ff1_Z[0]), .B0(n1304), .B1(data_in[0]), 
        .Y(n981) );
  AO22XLTS U1312 ( .A0(n1302), .A1(d_ff1_Z[21]), .B0(n1303), .B1(data_in[21]), 
        .Y(n960) );
  AO22XLTS U1313 ( .A0(n1302), .A1(d_ff1_Z[20]), .B0(n1304), .B1(data_in[20]), 
        .Y(n961) );
  CMPR32X2TS U1314 ( .A(n1439), .B(d_ff2_X[26]), .C(n1299), .CO(n1353), .S(
        n1288) );
  OR3X1TS U1315 ( .A(n1353), .B(d_ff2_X[27]), .C(d_ff2_X[28]), .Y(n1423) );
  NOR2X1TS U1316 ( .A(d_ff2_X[29]), .B(n1423), .Y(n1422) );
  XOR2XLTS U1317 ( .A(d_ff2_X[30]), .B(n1422), .Y(n1301) );
  AO22XLTS U1318 ( .A0(n1373), .A1(n1301), .B0(n1300), .B1(d_ff3_sh_x_out[30]), 
        .Y(n642) );
  AO22XLTS U1319 ( .A0(n1306), .A1(d_ff1_Z[1]), .B0(n1303), .B1(data_in[1]), 
        .Y(n980) );
  AO22XLTS U1320 ( .A0(n1302), .A1(d_ff1_Z[19]), .B0(n1303), .B1(data_in[19]), 
        .Y(n962) );
  AO22XLTS U1321 ( .A0(n1302), .A1(d_ff1_Z[18]), .B0(n1304), .B1(data_in[18]), 
        .Y(n963) );
  AO22XLTS U1322 ( .A0(n1302), .A1(d_ff1_Z[17]), .B0(n1303), .B1(data_in[17]), 
        .Y(n964) );
  AO22XLTS U1323 ( .A0(n1306), .A1(d_ff1_Z[2]), .B0(n1304), .B1(data_in[2]), 
        .Y(n979) );
  AO22XLTS U1324 ( .A0(n1366), .A1(d_ff2_X[31]), .B0(n1365), .B1(
        d_ff3_sh_x_out[31]), .Y(n640) );
  AO22XLTS U1325 ( .A0(n1302), .A1(d_ff1_Z[16]), .B0(n1304), .B1(data_in[16]), 
        .Y(n965) );
  AO22XLTS U1326 ( .A0(n1311), .A1(d_ff1_Z[15]), .B0(n1303), .B1(data_in[15]), 
        .Y(n966) );
  AO22XLTS U1327 ( .A0(n1306), .A1(d_ff1_Z[3]), .B0(n1303), .B1(data_in[3]), 
        .Y(n978) );
  AO22XLTS U1328 ( .A0(n1311), .A1(d_ff1_Z[14]), .B0(n1310), .B1(data_in[14]), 
        .Y(n967) );
  AO22XLTS U1329 ( .A0(n1366), .A1(d_ff2_Y[31]), .B0(n1365), .B1(
        d_ff3_sh_y_out[31]), .Y(n704) );
  AO22XLTS U1330 ( .A0(n1311), .A1(d_ff1_Z[13]), .B0(n1310), .B1(data_in[13]), 
        .Y(n968) );
  AO22XLTS U1331 ( .A0(n1306), .A1(d_ff1_Z[4]), .B0(n1304), .B1(data_in[4]), 
        .Y(n977) );
  AO22XLTS U1332 ( .A0(n1311), .A1(d_ff1_Z[12]), .B0(n1310), .B1(data_in[12]), 
        .Y(n969) );
  AO22XLTS U1333 ( .A0(n1311), .A1(d_ff1_Z[11]), .B0(n1308), .B1(data_in[11]), 
        .Y(n970) );
  AO22XLTS U1334 ( .A0(n1306), .A1(d_ff1_Z[5]), .B0(n1303), .B1(data_in[5]), 
        .Y(n976) );
  AO22XLTS U1335 ( .A0(n1309), .A1(d_ff1_Z[10]), .B0(n1310), .B1(data_in[10]), 
        .Y(n971) );
  NOR2X1TS U1336 ( .A(d_ff2_Y[29]), .B(n1368), .Y(n1367) );
  XOR2XLTS U1337 ( .A(d_ff2_Y[30]), .B(n1367), .Y(n1307) );
  AO22XLTS U1338 ( .A0(n1366), .A1(n1307), .B0(n1344), .B1(d_ff3_sh_y_out[30]), 
        .Y(n706) );
  AO22XLTS U1339 ( .A0(n1311), .A1(d_ff1_Z[9]), .B0(n1308), .B1(data_in[9]), 
        .Y(n972) );
  AO22XLTS U1340 ( .A0(n1309), .A1(d_ff1_Z[8]), .B0(n1310), .B1(data_in[8]), 
        .Y(n973) );
  AO22XLTS U1341 ( .A0(n1309), .A1(d_ff1_Z[6]), .B0(n1310), .B1(data_in[6]), 
        .Y(n975) );
  AO22XLTS U1342 ( .A0(n1311), .A1(d_ff1_Z[7]), .B0(n1310), .B1(data_in[7]), 
        .Y(n974) );
  INVX2TS U1343 ( .A(n1326), .Y(n1339) );
  CLKBUFX3TS U1344 ( .A(n1321), .Y(n1338) );
  AO22XLTS U1345 ( .A0(n1339), .A1(result_add_subt[25]), .B0(n1338), .B1(
        d_ff_Xn[25]), .Y(n860) );
  AO22XLTS U1346 ( .A0(n1343), .A1(n1313), .B0(n1312), .B1(d_ff3_LUT_out[19]), 
        .Y(n807) );
  INVX2TS U1347 ( .A(n1326), .Y(n1318) );
  AO22XLTS U1348 ( .A0(n1318), .A1(result_add_subt[19]), .B0(n1338), .B1(
        d_ff_Xn[19]), .Y(n866) );
  AO22XLTS U1349 ( .A0(n1314), .A1(result_add_subt[30]), .B0(n1321), .B1(
        d_ff_Xn[30]), .Y(n855) );
  CLKBUFX3TS U1350 ( .A(n1321), .Y(n1317) );
  AO22XLTS U1351 ( .A0(n1318), .A1(result_add_subt[17]), .B0(n1317), .B1(
        d_ff_Xn[17]), .Y(n868) );
  NAND2X1TS U1352 ( .A(n1315), .B(ready_add_subt), .Y(n1316) );
  INVX2TS U1353 ( .A(n1316), .Y(n1325) );
  CLKBUFX2TS U1354 ( .A(n1316), .Y(n1345) );
  CLKBUFX3TS U1355 ( .A(n1345), .Y(n1324) );
  AO22XLTS U1356 ( .A0(n1325), .A1(result_add_subt[23]), .B0(n1324), .B1(
        d_ff_Yn[23]), .Y(n894) );
  AO22XLTS U1357 ( .A0(n1325), .A1(result_add_subt[28]), .B0(n1345), .B1(
        d_ff_Yn[28]), .Y(n889) );
  AO22XLTS U1358 ( .A0(n1318), .A1(result_add_subt[16]), .B0(n1317), .B1(
        d_ff_Xn[16]), .Y(n869) );
  INVX2TS U1359 ( .A(n1319), .Y(n1327) );
  AO22XLTS U1360 ( .A0(n1327), .A1(result_add_subt[4]), .B0(n1319), .B1(
        d_ff_Xn[4]), .Y(n881) );
  AO22XLTS U1361 ( .A0(n1318), .A1(result_add_subt[14]), .B0(n1317), .B1(
        d_ff_Xn[14]), .Y(n871) );
  AO22XLTS U1362 ( .A0(n1327), .A1(result_add_subt[8]), .B0(n1317), .B1(
        d_ff_Xn[8]), .Y(n877) );
  AO22XLTS U1363 ( .A0(n1327), .A1(result_add_subt[9]), .B0(n1317), .B1(
        d_ff_Xn[9]), .Y(n876) );
  AO22XLTS U1364 ( .A0(n1318), .A1(result_add_subt[13]), .B0(n1317), .B1(
        d_ff_Xn[13]), .Y(n872) );
  AO22XLTS U1365 ( .A0(n1318), .A1(result_add_subt[11]), .B0(n1317), .B1(
        d_ff_Xn[11]), .Y(n874) );
  AO22XLTS U1366 ( .A0(n1318), .A1(result_add_subt[12]), .B0(n1317), .B1(
        d_ff_Xn[12]), .Y(n873) );
  AO22XLTS U1367 ( .A0(n1318), .A1(result_add_subt[15]), .B0(n1317), .B1(
        d_ff_Xn[15]), .Y(n870) );
  AO22XLTS U1368 ( .A0(n1318), .A1(result_add_subt[18]), .B0(n1338), .B1(
        d_ff_Xn[18]), .Y(n867) );
  AO22XLTS U1369 ( .A0(n1318), .A1(result_add_subt[10]), .B0(n1317), .B1(
        d_ff_Xn[10]), .Y(n875) );
  AO22XLTS U1370 ( .A0(n1339), .A1(result_add_subt[21]), .B0(n1338), .B1(
        d_ff_Xn[21]), .Y(n864) );
  AO22XLTS U1371 ( .A0(n1327), .A1(result_add_subt[7]), .B0(n1319), .B1(
        d_ff_Xn[7]), .Y(n878) );
  AO22XLTS U1372 ( .A0(n1339), .A1(result_add_subt[22]), .B0(n1338), .B1(
        d_ff_Xn[22]), .Y(n863) );
  AO22XLTS U1373 ( .A0(n1339), .A1(result_add_subt[23]), .B0(n1338), .B1(
        d_ff_Xn[23]), .Y(n862) );
  AO22XLTS U1374 ( .A0(n1327), .A1(result_add_subt[6]), .B0(n1319), .B1(
        d_ff_Xn[6]), .Y(n879) );
  INVX2TS U1375 ( .A(n1320), .Y(n1331) );
  AO22XLTS U1376 ( .A0(n1331), .A1(result_add_subt[1]), .B0(n1320), .B1(
        d_ff_Yn[1]), .Y(n916) );
  AO22XLTS U1377 ( .A0(n1327), .A1(result_add_subt[5]), .B0(n1319), .B1(
        d_ff_Xn[5]), .Y(n880) );
  AO22XLTS U1378 ( .A0(n1331), .A1(result_add_subt[2]), .B0(n1320), .B1(
        d_ff_Yn[2]), .Y(n915) );
  AO22XLTS U1379 ( .A0(n1331), .A1(result_add_subt[3]), .B0(n1320), .B1(
        d_ff_Yn[3]), .Y(n914) );
  AO22XLTS U1380 ( .A0(n1327), .A1(result_add_subt[3]), .B0(n1319), .B1(
        d_ff_Xn[3]), .Y(n882) );
  AO22XLTS U1381 ( .A0(n1331), .A1(result_add_subt[4]), .B0(n1320), .B1(
        d_ff_Yn[4]), .Y(n913) );
  AO22XLTS U1382 ( .A0(n1327), .A1(result_add_subt[2]), .B0(n1319), .B1(
        d_ff_Xn[2]), .Y(n883) );
  AO22XLTS U1383 ( .A0(n1331), .A1(result_add_subt[5]), .B0(n1320), .B1(
        d_ff_Yn[5]), .Y(n912) );
  AO22XLTS U1384 ( .A0(n1331), .A1(result_add_subt[6]), .B0(n1320), .B1(
        d_ff_Yn[6]), .Y(n911) );
  AO22XLTS U1385 ( .A0(n1327), .A1(result_add_subt[1]), .B0(n1319), .B1(
        d_ff_Xn[1]), .Y(n884) );
  AO22XLTS U1386 ( .A0(n1331), .A1(result_add_subt[7]), .B0(n1320), .B1(
        d_ff_Yn[7]), .Y(n910) );
  AO22XLTS U1387 ( .A0(n1339), .A1(result_add_subt[29]), .B0(n1321), .B1(
        d_ff_Xn[29]), .Y(n856) );
  CLKBUFX3TS U1388 ( .A(n1345), .Y(n1322) );
  AO22XLTS U1389 ( .A0(n1331), .A1(result_add_subt[8]), .B0(n1322), .B1(
        d_ff_Yn[8]), .Y(n909) );
  AO22XLTS U1390 ( .A0(n1331), .A1(result_add_subt[9]), .B0(n1322), .B1(
        d_ff_Yn[9]), .Y(n908) );
  AO22XLTS U1391 ( .A0(n1339), .A1(result_add_subt[28]), .B0(n1321), .B1(
        d_ff_Xn[28]), .Y(n857) );
  INVX2TS U1392 ( .A(n1316), .Y(n1323) );
  AO22XLTS U1393 ( .A0(n1323), .A1(result_add_subt[10]), .B0(n1322), .B1(
        d_ff_Yn[10]), .Y(n907) );
  AO22XLTS U1394 ( .A0(n1339), .A1(result_add_subt[27]), .B0(n1338), .B1(
        d_ff_Xn[27]), .Y(n858) );
  AO22XLTS U1395 ( .A0(n1323), .A1(result_add_subt[11]), .B0(n1322), .B1(
        d_ff_Yn[11]), .Y(n906) );
  AO22XLTS U1396 ( .A0(n1323), .A1(result_add_subt[12]), .B0(n1322), .B1(
        d_ff_Yn[12]), .Y(n905) );
  AO22XLTS U1397 ( .A0(n1339), .A1(result_add_subt[24]), .B0(n1338), .B1(
        d_ff_Xn[24]), .Y(n861) );
  AO22XLTS U1398 ( .A0(n1323), .A1(result_add_subt[13]), .B0(n1322), .B1(
        d_ff_Yn[13]), .Y(n904) );
  CLKBUFX3TS U1399 ( .A(n1328), .Y(n1377) );
  INVX2TS U1400 ( .A(n1416), .Y(n1372) );
  AO22XLTS U1401 ( .A0(n1377), .A1(d_ff_Yn[31]), .B0(d_ff2_Y[31]), .B1(n1372), 
        .Y(n705) );
  AO22XLTS U1402 ( .A0(n1323), .A1(result_add_subt[14]), .B0(n1322), .B1(
        d_ff_Yn[14]), .Y(n903) );
  AO22XLTS U1403 ( .A0(n1323), .A1(result_add_subt[15]), .B0(n1322), .B1(
        d_ff_Yn[15]), .Y(n902) );
  CLKBUFX3TS U1404 ( .A(n1328), .Y(n1330) );
  INVX2TS U1405 ( .A(n1448), .Y(n1376) );
  AO22XLTS U1406 ( .A0(n1330), .A1(d_ff_Yn[22]), .B0(d_ff2_Y[22]), .B1(n1376), 
        .Y(n723) );
  AO22XLTS U1407 ( .A0(n1323), .A1(result_add_subt[16]), .B0(n1322), .B1(
        d_ff_Yn[16]), .Y(n901) );
  AO22XLTS U1408 ( .A0(n1330), .A1(d_ff_Yn[21]), .B0(d_ff2_Y[21]), .B1(n1376), 
        .Y(n725) );
  AO22XLTS U1409 ( .A0(n1323), .A1(result_add_subt[17]), .B0(n1322), .B1(
        d_ff_Yn[17]), .Y(n900) );
  AO22XLTS U1410 ( .A0(n1323), .A1(result_add_subt[18]), .B0(n1324), .B1(
        d_ff_Yn[18]), .Y(n899) );
  AO22XLTS U1411 ( .A0(n1330), .A1(d_ff_Yn[20]), .B0(d_ff2_Y[20]), .B1(n1376), 
        .Y(n727) );
  AO22XLTS U1412 ( .A0(n1323), .A1(result_add_subt[19]), .B0(n1324), .B1(
        d_ff_Yn[19]), .Y(n898) );
  AO22XLTS U1413 ( .A0(n1330), .A1(d_ff_Yn[19]), .B0(d_ff2_Y[19]), .B1(n1376), 
        .Y(n729) );
  AO22XLTS U1414 ( .A0(n1325), .A1(result_add_subt[20]), .B0(n1324), .B1(
        d_ff_Yn[20]), .Y(n897) );
  AO22XLTS U1415 ( .A0(n1325), .A1(result_add_subt[21]), .B0(n1324), .B1(
        d_ff_Yn[21]), .Y(n896) );
  AO22XLTS U1416 ( .A0(n1330), .A1(d_ff_Yn[18]), .B0(d_ff2_Y[18]), .B1(n1376), 
        .Y(n731) );
  AO22XLTS U1417 ( .A0(n1325), .A1(result_add_subt[22]), .B0(n1324), .B1(
        d_ff_Yn[22]), .Y(n895) );
  INVX2TS U1418 ( .A(n1417), .Y(n1329) );
  AO22XLTS U1419 ( .A0(n1330), .A1(d_ff_Yn[17]), .B0(d_ff2_Y[17]), .B1(n1329), 
        .Y(n733) );
  AO22XLTS U1420 ( .A0(n1325), .A1(result_add_subt[24]), .B0(n1324), .B1(
        d_ff_Yn[24]), .Y(n893) );
  AO22XLTS U1421 ( .A0(n1325), .A1(result_add_subt[25]), .B0(n1324), .B1(
        d_ff_Yn[25]), .Y(n892) );
  AO22XLTS U1422 ( .A0(n1330), .A1(d_ff_Yn[16]), .B0(d_ff2_Y[16]), .B1(n1329), 
        .Y(n735) );
  AO22XLTS U1423 ( .A0(n1325), .A1(result_add_subt[26]), .B0(n1324), .B1(
        d_ff_Yn[26]), .Y(n891) );
  AO22XLTS U1424 ( .A0(n1330), .A1(d_ff_Yn[15]), .B0(d_ff2_Y[15]), .B1(n1329), 
        .Y(n737) );
  AO22XLTS U1425 ( .A0(n1325), .A1(result_add_subt[27]), .B0(n1324), .B1(
        d_ff_Yn[27]), .Y(n890) );
  AO22XLTS U1426 ( .A0(n1325), .A1(result_add_subt[29]), .B0(n1345), .B1(
        d_ff_Yn[29]), .Y(n888) );
  AO22XLTS U1427 ( .A0(n1328), .A1(d_ff_Yn[14]), .B0(d_ff2_Y[14]), .B1(n1329), 
        .Y(n739) );
  INVX2TS U1428 ( .A(n1320), .Y(n1346) );
  AO22XLTS U1429 ( .A0(n1346), .A1(result_add_subt[30]), .B0(n1345), .B1(
        d_ff_Yn[30]), .Y(n887) );
  AO22XLTS U1430 ( .A0(n1337), .A1(d_ff_Yn[13]), .B0(d_ff2_Y[13]), .B1(n1329), 
        .Y(n741) );
  AO22XLTS U1431 ( .A0(n1327), .A1(result_add_subt[0]), .B0(n1326), .B1(
        d_ff_Xn[0]), .Y(n885) );
  AO22XLTS U1432 ( .A0(n1377), .A1(d_ff_Xn[0]), .B0(d_ff2_X[0]), .B1(n1372), 
        .Y(n703) );
  AO22XLTS U1433 ( .A0(n1328), .A1(d_ff_Yn[12]), .B0(d_ff2_Y[12]), .B1(n1329), 
        .Y(n743) );
  AO22XLTS U1434 ( .A0(n1377), .A1(d_ff_Xn[4]), .B0(d_ff2_X[4]), .B1(n1372), 
        .Y(n695) );
  AO22XLTS U1435 ( .A0(n1328), .A1(d_ff_Yn[11]), .B0(d_ff2_Y[11]), .B1(n1329), 
        .Y(n745) );
  AO22XLTS U1436 ( .A0(n1377), .A1(d_ff_Xn[8]), .B0(d_ff2_X[8]), .B1(n1372), 
        .Y(n687) );
  AO22XLTS U1437 ( .A0(n1375), .A1(d_ff_Xn[9]), .B0(d_ff2_X[9]), .B1(n1372), 
        .Y(n685) );
  AO22XLTS U1438 ( .A0(n1330), .A1(d_ff_Yn[10]), .B0(d_ff2_Y[10]), .B1(n1329), 
        .Y(n747) );
  AO22XLTS U1439 ( .A0(n1375), .A1(d_ff_Xn[11]), .B0(d_ff2_X[11]), .B1(n1372), 
        .Y(n681) );
  AO22XLTS U1440 ( .A0(n1328), .A1(d_ff_Yn[9]), .B0(d_ff2_Y[9]), .B1(n1329), 
        .Y(n749) );
  AO22XLTS U1441 ( .A0(n1375), .A1(d_ff_Xn[15]), .B0(d_ff2_X[15]), .B1(n1372), 
        .Y(n673) );
  AO22XLTS U1442 ( .A0(n1375), .A1(d_ff_Xn[18]), .B0(d_ff2_X[18]), .B1(n1372), 
        .Y(n667) );
  AO22XLTS U1443 ( .A0(n1057), .A1(d_ff_Yn[8]), .B0(d_ff2_Y[8]), .B1(n1329), 
        .Y(n751) );
  AO22XLTS U1444 ( .A0(n1375), .A1(d_ff_Xn[21]), .B0(d_ff2_X[21]), .B1(n1374), 
        .Y(n661) );
  INVX2TS U1445 ( .A(n1448), .Y(n1336) );
  AO22XLTS U1446 ( .A0(n1328), .A1(d_ff_Yn[7]), .B0(d_ff2_Y[7]), .B1(n1336), 
        .Y(n753) );
  AO22XLTS U1447 ( .A0(n1375), .A1(d_ff_Xn[22]), .B0(d_ff2_X[22]), .B1(n1374), 
        .Y(n659) );
  AO22XLTS U1448 ( .A0(n1330), .A1(d_ff_Xn[31]), .B0(d_ff2_X[31]), .B1(n1376), 
        .Y(n641) );
  AO22XLTS U1449 ( .A0(n1337), .A1(d_ff_Yn[6]), .B0(d_ff2_Y[6]), .B1(n1336), 
        .Y(n755) );
  AO22XLTS U1450 ( .A0(n1331), .A1(result_add_subt[0]), .B0(n1316), .B1(
        d_ff_Yn[0]), .Y(n917) );
  AO22XLTS U1451 ( .A0(n1337), .A1(d_ff_Yn[5]), .B0(d_ff2_Y[5]), .B1(n1336), 
        .Y(n757) );
  AO22XLTS U1452 ( .A0(n1354), .A1(d_ff3_sign_out), .B0(n1369), .B1(
        d_ff2_Z[31]), .Y(n768) );
  AOI22X1TS U1453 ( .A0(n1332), .A1(n1359), .B0(d_ff3_LUT_out[5]), .B1(n1410), 
        .Y(n1333) );
  NAND2X1TS U1454 ( .A(n1333), .B(n1408), .Y(n816) );
  AO22XLTS U1455 ( .A0(n1057), .A1(d_ff_Yn[4]), .B0(d_ff2_Y[4]), .B1(n1336), 
        .Y(n759) );
  AOI22X1TS U1456 ( .A0(n1426), .A1(n1334), .B0(d_ff3_LUT_out[7]), .B1(n1410), 
        .Y(n1335) );
  NAND2X1TS U1457 ( .A(n1335), .B(n1411), .Y(n814) );
  AO22XLTS U1458 ( .A0(n1057), .A1(d_ff_Yn[3]), .B0(d_ff2_Y[3]), .B1(n1336), 
        .Y(n761) );
  AO22XLTS U1459 ( .A0(n1057), .A1(d_ff_Yn[2]), .B0(d_ff2_Y[2]), .B1(n1336), 
        .Y(n763) );
  AO22XLTS U1460 ( .A0(n1337), .A1(d_ff_Yn[1]), .B0(d_ff2_Y[1]), .B1(n1336), 
        .Y(n765) );
  AO22XLTS U1461 ( .A0(n1375), .A1(d_ff_Yn[0]), .B0(d_ff2_Y[0]), .B1(n1374), 
        .Y(n767) );
  AO22XLTS U1462 ( .A0(n1339), .A1(result_add_subt[20]), .B0(n1338), .B1(
        d_ff_Xn[20]), .Y(n865) );
  AO22XLTS U1463 ( .A0(n1364), .A1(d_ff2_Y[19]), .B0(n1344), .B1(
        d_ff3_sh_y_out[19]), .Y(n728) );
  AO22XLTS U1464 ( .A0(n1339), .A1(result_add_subt[26]), .B0(n1338), .B1(
        d_ff_Xn[26]), .Y(n859) );
  AOI21X1TS U1465 ( .A0(n1341), .A1(d_ff2_Y[27]), .B0(n1340), .Y(n1342) );
  AOI2BB2XLTS U1466 ( .B0(n1426), .B1(n1342), .A0N(d_ff3_sh_y_out[27]), .A1N(
        n1369), .Y(n709) );
  AO22XLTS U1467 ( .A0(n1373), .A1(d_ff2_X[19]), .B0(n1413), .B1(
        d_ff3_sh_x_out[19]), .Y(n664) );
  AO22XLTS U1468 ( .A0(n1373), .A1(d_ff2_X[16]), .B0(n1371), .B1(
        d_ff3_sh_x_out[16]), .Y(n670) );
  AO22XLTS U1469 ( .A0(n1343), .A1(d_ff2_Y[20]), .B0(n1344), .B1(
        d_ff3_sh_y_out[20]), .Y(n726) );
  AO22XLTS U1470 ( .A0(n1343), .A1(d_ff2_Y[22]), .B0(n1344), .B1(
        d_ff3_sh_y_out[22]), .Y(n722) );
  AO22XLTS U1471 ( .A0(d_ff2_X[30]), .A1(n1374), .B0(n1328), .B1(d_ff_Xn[30]), 
        .Y(n650) );
  AO22XLTS U1472 ( .A0(n1369), .A1(d_ff2_X[14]), .B0(n1371), .B1(
        d_ff3_sh_x_out[14]), .Y(n674) );
  AO22XLTS U1473 ( .A0(n1377), .A1(d_ff_Yn[27]), .B0(d_ff2_Y[27]), .B1(n1376), 
        .Y(n717) );
  AO22XLTS U1474 ( .A0(n1377), .A1(d_ff_Yn[24]), .B0(d_ff2_Y[24]), .B1(n1376), 
        .Y(n720) );
  AO22XLTS U1475 ( .A0(n1364), .A1(d_ff2_Y[21]), .B0(n1344), .B1(
        d_ff3_sh_y_out[21]), .Y(n724) );
  AO22XLTS U1476 ( .A0(n1346), .A1(result_add_subt[31]), .B0(n1345), .B1(
        d_ff_Yn[31]), .Y(n886) );
  NOR2XLTS U1477 ( .A(n1059), .B(n1347), .Y(n1348) );
  AOI22X1TS U1478 ( .A0(n1349), .A1(n1348), .B0(d_ff3_LUT_out[25]), .B1(n1424), 
        .Y(n1351) );
  AOI32X1TS U1479 ( .A0(n1352), .A1(n1351), .A2(n1350), .B0(cont_iter_out[2]), 
        .B1(n1351), .Y(n803) );
  AO22XLTS U1480 ( .A0(n1366), .A1(d_ff2_X[17]), .B0(n1413), .B1(
        d_ff3_sh_x_out[17]), .Y(n668) );
  NAND2BXLTS U1481 ( .AN(d_ff3_LUT_out[27]), .B(n1424), .Y(n801) );
  AO22XLTS U1482 ( .A0(n1366), .A1(d_ff2_X[13]), .B0(n1371), .B1(
        d_ff3_sh_x_out[13]), .Y(n676) );
  AO22XLTS U1483 ( .A0(n1369), .A1(d_ff2_X[9]), .B0(n1371), .B1(
        d_ff3_sh_x_out[9]), .Y(n684) );
  AO22XLTS U1484 ( .A0(n1369), .A1(d_ff2_X[11]), .B0(n1371), .B1(
        d_ff3_sh_x_out[11]), .Y(n680) );
  AO22XLTS U1485 ( .A0(n1373), .A1(d_ff2_X[18]), .B0(n1371), .B1(
        d_ff3_sh_x_out[18]), .Y(n666) );
  NOR2X1TS U1486 ( .A(d_ff2_X[27]), .B(n1353), .Y(n1356) );
  AOI21X1TS U1487 ( .A0(n1353), .A1(d_ff2_X[27]), .B0(n1356), .Y(n1355) );
  INVX2TS U1488 ( .A(n1354), .Y(n1421) );
  AOI2BB2XLTS U1489 ( .B0(n1414), .B1(n1355), .A0N(d_ff3_sh_x_out[27]), .A1N(
        n1421), .Y(n645) );
  OAI21XLTS U1490 ( .A0(n1356), .A1(n1444), .B0(n1423), .Y(n1357) );
  AO22XLTS U1491 ( .A0(n1363), .A1(n1357), .B0(n1413), .B1(d_ff3_sh_x_out[28]), 
        .Y(n644) );
  AO22XLTS U1492 ( .A0(n1377), .A1(d_ff_Yn[29]), .B0(d_ff2_Y[29]), .B1(n1372), 
        .Y(n715) );
  AO21XLTS U1493 ( .A0(enab_cont_iter), .A1(n1387), .B0(n1064), .Y(
        inst_CORDIC_FSM_v3_state_next[2]) );
  AO22XLTS U1494 ( .A0(n1377), .A1(d_ff_Yn[25]), .B0(d_ff2_Y[25]), .B1(n1376), 
        .Y(n719) );
  AOI22X1TS U1495 ( .A0(n1360), .A1(n1359), .B0(d_ff3_LUT_out[10]), .B1(n1424), 
        .Y(n1361) );
  NAND2BXLTS U1496 ( .AN(n1362), .B(n1361), .Y(n811) );
  AO22XLTS U1497 ( .A0(n1366), .A1(d_ff2_X[12]), .B0(n1371), .B1(
        d_ff3_sh_x_out[12]), .Y(n678) );
  AO22XLTS U1498 ( .A0(n1363), .A1(d_ff2_X[22]), .B0(n1413), .B1(
        d_ff3_sh_x_out[22]), .Y(n658) );
  AO22XLTS U1499 ( .A0(n1364), .A1(d_ff2_X[5]), .B0(n1365), .B1(
        d_ff3_sh_x_out[5]), .Y(n692) );
  AO22XLTS U1500 ( .A0(n1366), .A1(d_ff2_X[3]), .B0(n1365), .B1(
        d_ff3_sh_x_out[3]), .Y(n696) );
  AO22XLTS U1501 ( .A0(n1373), .A1(d_ff2_X[20]), .B0(n1413), .B1(
        d_ff3_sh_x_out[20]), .Y(n662) );
  AO22XLTS U1502 ( .A0(n1369), .A1(d_ff2_X[7]), .B0(n1371), .B1(
        d_ff3_sh_x_out[7]), .Y(n688) );
  AOI21X1TS U1503 ( .A0(d_ff2_Y[29]), .A1(n1368), .B0(n1367), .Y(n1370) );
  AOI2BB2XLTS U1504 ( .B0(n1426), .B1(n1370), .A0N(d_ff3_sh_y_out[29]), .A1N(
        n1369), .Y(n707) );
  AO22XLTS U1505 ( .A0(n1373), .A1(d_ff2_X[15]), .B0(n1371), .B1(
        d_ff3_sh_x_out[15]), .Y(n672) );
  AO22XLTS U1506 ( .A0(n1377), .A1(d_ff_Yn[30]), .B0(d_ff2_Y[30]), .B1(n1372), 
        .Y(n714) );
  AO22XLTS U1507 ( .A0(n1373), .A1(d_ff2_X[21]), .B0(n1413), .B1(
        d_ff3_sh_x_out[21]), .Y(n660) );
  AO22XLTS U1508 ( .A0(n1375), .A1(d_ff_Xn[23]), .B0(d_ff2_X[23]), .B1(n1374), 
        .Y(n657) );
  AO22XLTS U1509 ( .A0(n1377), .A1(d_ff_Yn[26]), .B0(d_ff2_Y[26]), .B1(n1376), 
        .Y(n718) );
  AO22XLTS U1510 ( .A0(n1378), .A1(d_ff3_sh_x_out[31]), .B0(n1404), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U1511 ( .A0(n1398), .A1(d_ff3_sh_x_out[30]), .B0(n1404), .B1(
        d_ff3_sh_y_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U1512 ( .A0(n1402), .A1(d_ff3_sh_x_out[28]), .B0(n1395), .B1(
        d_ff3_sh_y_out[28]), .Y(n1379) );
  NAND2X1TS U1513 ( .A(n1248), .B(d_ff3_LUT_out[27]), .Y(n1380) );
  NAND2X1TS U1514 ( .A(n1379), .B(n1380), .Y(add_subt_dataB[28]) );
  AOI22X1TS U1515 ( .A0(n1402), .A1(d_ff3_sh_x_out[27]), .B0(n1395), .B1(
        d_ff3_sh_y_out[27]), .Y(n1381) );
  NAND2X1TS U1516 ( .A(n1381), .B(n1380), .Y(add_subt_dataB[27]) );
  AOI2BB2XLTS U1517 ( .B0(cont_var_out[0]), .B1(d_ff3_sign_out), .A0N(
        d_ff3_sign_out), .A1N(cont_var_out[0]), .Y(op_add_subt) );
  NOR2BX1TS U1518 ( .AN(beg_fsm_cordic), .B(n1382), .Y(
        inst_CORDIC_FSM_v3_state_next[1]) );
  OAI22X1TS U1519 ( .A0(n1386), .A1(n1385), .B0(n1384), .B1(n1383), .Y(
        inst_CORDIC_FSM_v3_state_next[5]) );
  OAI22X1TS U1520 ( .A0(ack_cordic), .A1(n1388), .B0(n1405), .B1(n1387), .Y(
        inst_CORDIC_FSM_v3_state_next[7]) );
  INVX2TS U1521 ( .A(n1389), .Y(n1392) );
  AOI22X1TS U1522 ( .A0(n1402), .A1(d_ff3_sh_x_out[22]), .B0(n1395), .B1(
        d_ff3_sh_y_out[22]), .Y(n1390) );
  OAI2BB1X1TS U1523 ( .A0N(n1248), .A1N(d_ff3_LUT_out[19]), .B0(n1390), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U1524 ( .A0(n1402), .A1(d_ff3_sh_x_out[19]), .B0(n1253), .B1(
        d_ff3_sh_y_out[19]), .Y(n1391) );
  OAI2BB1X1TS U1525 ( .A0N(n1392), .A1N(d_ff3_LUT_out[19]), .B0(n1391), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U1526 ( .A0(n1402), .A1(d_ff3_sh_x_out[14]), .B0(n1216), .B1(
        d_ff3_sh_y_out[14]), .Y(n1393) );
  OAI2BB1X1TS U1527 ( .A0N(n1271), .A1N(d_ff3_LUT_out[5]), .B0(n1393), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U1528 ( .A0(n1402), .A1(d_ff3_sh_x_out[11]), .B0(n1215), .B1(
        d_ff3_sh_y_out[11]), .Y(n1394) );
  OAI2BB1X1TS U1529 ( .A0N(n1401), .A1N(d_ff3_LUT_out[7]), .B0(n1394), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U1530 ( .A0(n1396), .A1(d_ff3_sh_x_out[7]), .B0(n1395), .B1(
        d_ff3_sh_y_out[7]), .Y(n1397) );
  OAI2BB1X1TS U1531 ( .A0N(n1400), .A1N(d_ff3_LUT_out[7]), .B0(n1397), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U1532 ( .A0(n1398), .A1(d_ff3_sh_x_out[5]), .B0(n1216), .B1(
        d_ff3_sh_y_out[5]), .Y(n1399) );
  OAI2BB1X1TS U1533 ( .A0N(n1241), .A1N(d_ff3_LUT_out[5]), .B0(n1399), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U1534 ( .A0(n1402), .A1(d_ff2_Y[30]), .B0(d_ff2_Z[30]), .B1(n1241), 
        .Y(n1403) );
  OAI2BB1X1TS U1535 ( .A0N(n1404), .A1N(d_ff2_X[30]), .B0(n1403), .Y(
        add_subt_dataA[30]) );
  AOI22X1TS U1536 ( .A0(enab_cont_iter), .A1(cont_iter_out[0]), .B0(n1059), 
        .B1(n1405), .Y(n989) );
  OAI32X1TS U1537 ( .A0(n1406), .A1(n1427), .A2(n1405), .B0(n1430), .B1(n1406), 
        .Y(n988) );
  NAND2X1TS U1538 ( .A(cont_iter_out[2]), .B(n1406), .Y(n1407) );
  XNOR2X1TS U1539 ( .A(cont_iter_out[3]), .B(n1407), .Y(n986) );
  OAI221XLTS U1540 ( .A0(n1414), .A1(n1435), .B0(n1413), .B1(n1409), .C0(n1408), .Y(n810) );
  AOI22X1TS U1541 ( .A0(n1426), .A1(n1412), .B0(n1433), .B1(n1410), .Y(n809)
         );
  OAI221XLTS U1542 ( .A0(n1414), .A1(n1436), .B0(n1413), .B1(n1412), .C0(n1411), .Y(n806) );
  OA22X1TS U1543 ( .A0(d_ff_Xn[1]), .A1(n1060), .B0(n1416), .B1(d_ff2_X[1]), 
        .Y(n701) );
  OA22X1TS U1544 ( .A0(d_ff_Xn[2]), .A1(n1060), .B0(n1417), .B1(d_ff2_X[2]), 
        .Y(n699) );
  OA22X1TS U1545 ( .A0(d_ff_Xn[3]), .A1(n1060), .B0(n1417), .B1(d_ff2_X[3]), 
        .Y(n697) );
  OA22X1TS U1546 ( .A0(d_ff_Xn[5]), .A1(n1060), .B0(n1448), .B1(d_ff2_X[5]), 
        .Y(n693) );
  CLKBUFX3TS U1547 ( .A(n1417), .Y(n1415) );
  OA22X1TS U1548 ( .A0(d_ff_Xn[6]), .A1(n1060), .B0(n1415), .B1(d_ff2_X[6]), 
        .Y(n691) );
  OA22X1TS U1549 ( .A0(d_ff_Xn[7]), .A1(n1060), .B0(n1415), .B1(d_ff2_X[7]), 
        .Y(n689) );
  OA22X1TS U1550 ( .A0(d_ff_Xn[10]), .A1(n1062), .B0(n1415), .B1(d_ff2_X[10]), 
        .Y(n683) );
  OA22X1TS U1551 ( .A0(d_ff_Xn[12]), .A1(n1061), .B0(n1415), .B1(d_ff2_X[12]), 
        .Y(n679) );
  OA22X1TS U1552 ( .A0(d_ff_Xn[13]), .A1(n1062), .B0(n1415), .B1(d_ff2_X[13]), 
        .Y(n677) );
  OA22X1TS U1553 ( .A0(d_ff_Xn[14]), .A1(n1061), .B0(n1415), .B1(d_ff2_X[14]), 
        .Y(n675) );
  OA22X1TS U1554 ( .A0(d_ff_Xn[16]), .A1(n1062), .B0(n1415), .B1(d_ff2_X[16]), 
        .Y(n671) );
  OA22X1TS U1555 ( .A0(d_ff_Xn[17]), .A1(n1061), .B0(n1415), .B1(d_ff2_X[17]), 
        .Y(n669) );
  OA22X1TS U1556 ( .A0(d_ff_Xn[19]), .A1(n1062), .B0(n1415), .B1(d_ff2_X[19]), 
        .Y(n665) );
  OA22X1TS U1557 ( .A0(d_ff_Xn[20]), .A1(n1061), .B0(n1415), .B1(d_ff2_X[20]), 
        .Y(n663) );
  OA22X1TS U1558 ( .A0(n1416), .A1(d_ff2_X[24]), .B0(d_ff_Xn[24]), .B1(n1062), 
        .Y(n656) );
  OA22X1TS U1559 ( .A0(d_ff_Xn[25]), .A1(n1062), .B0(n1448), .B1(d_ff2_X[25]), 
        .Y(n655) );
  OA22X1TS U1560 ( .A0(d_ff_Xn[26]), .A1(n1061), .B0(n1448), .B1(d_ff2_X[26]), 
        .Y(n654) );
  OA22X1TS U1561 ( .A0(n1448), .A1(d_ff2_X[27]), .B0(d_ff_Xn[27]), .B1(n1061), 
        .Y(n653) );
  OA22X1TS U1562 ( .A0(n1416), .A1(d_ff2_X[28]), .B0(d_ff_Xn[28]), .B1(n1062), 
        .Y(n652) );
  OA22X1TS U1563 ( .A0(n1417), .A1(d_ff2_X[29]), .B0(d_ff_Xn[29]), .B1(n1061), 
        .Y(n651) );
  AOI22X1TS U1564 ( .A0(n1418), .A1(d_ff2_X[23]), .B0(d_ff3_sh_x_out[23]), 
        .B1(n1424), .Y(n1419) );
  OAI2BB1X1TS U1565 ( .A0N(n1421), .A1N(n1420), .B0(n1419), .Y(n649) );
  AOI21X1TS U1566 ( .A0(d_ff2_X[29]), .A1(n1423), .B0(n1422), .Y(n1425) );
  AOI22X1TS U1567 ( .A0(n1426), .A1(n1425), .B0(n1442), .B1(n1424), .Y(n643)
         );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_noclk.tcl_syn.sdf"); 
 endmodule

