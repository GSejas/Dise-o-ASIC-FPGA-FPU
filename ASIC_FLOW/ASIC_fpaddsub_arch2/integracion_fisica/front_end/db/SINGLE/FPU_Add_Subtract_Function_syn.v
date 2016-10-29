/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Fri Oct 28 13:01:03 2016
/////////////////////////////////////////////////////////////


module FPU_Add_Subtract_Function_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_FSM, 
        ack_FSM, Data_X, Data_Y, add_subt, r_mode, overflow_flag, 
        underflow_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  input [1:0] r_mode;
  output [31:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM, add_subt;
  output overflow_flag, underflow_flag, ready;
  wire   FSM_selector_C, add_overflow_flag, FSM_exp_operation_A_S,
         FSM_selector_D, intAS, sign_final_result, n12, n13, n14, n15, n16,
         n17, n19, n20, n21, n23, n24, n25, n27, n28, n29, n31, n32, n33, n35,
         n36, n37, n39, n40, n41, n43, n44, n45, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n242, n243, n244, n245, n246, n247, n248,
         DP_OP_42J1_122_8048_n20, DP_OP_42J1_122_8048_n19,
         DP_OP_42J1_122_8048_n18, DP_OP_42J1_122_8048_n17,
         DP_OP_42J1_122_8048_n16, DP_OP_42J1_122_8048_n15,
         DP_OP_42J1_122_8048_n14, DP_OP_42J1_122_8048_n13,
         DP_OP_42J1_122_8048_n8, DP_OP_42J1_122_8048_n7,
         DP_OP_42J1_122_8048_n6, DP_OP_42J1_122_8048_n5,
         DP_OP_42J1_122_8048_n4, DP_OP_42J1_122_8048_n3,
         DP_OP_42J1_122_8048_n2, DP_OP_42J1_122_8048_n1, n652, n653, n654,
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
         n985, n986, n987, n988, n989, n990, n991, n992, n993, n994, n995,
         n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005,
         n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015,
         n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025,
         n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035,
         n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045,
         n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055,
         n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065,
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
         n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465,
         n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475,
         n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485,
         n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495,
         n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505,
         n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515,
         n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525,
         n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535,
         n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545,
         n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555,
         n1556, n1557, n1558;
  wire   [1:0] FSM_selector_B;
  wire   [31:0] intDX;
  wire   [31:0] intDY;
  wire   [30:0] DMP;
  wire   [30:0] DmP;
  wire   [7:0] exp_oper_result;
  wire   [7:0] S_Oper_A_exp;
  wire   [4:1] LZA_output;
  wire   [25:0] Add_Subt_result;
  wire   [25:0] Sgf_normalized_result;
  wire   [3:0] FS_Module_state_reg;
  wire   [7:0] Exp_Operation_Module_Data_S;
  wire   [51:0] Barrel_Shifter_module_Mux_Array_Data_array;

  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_25_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[25]), .CK(clk), .RN(n1557), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[51]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_0_ ( .D(n248), .CK(clk), 
        .RN(n1552), .Q(Sgf_normalized_result[0]) );
  DFFRXLTS Sel_C_Q_reg_0_ ( .D(n243), .CK(clk), .RN(n244), .Q(FSM_selector_C), 
        .QN(n1519) );
  DFFRXLTS Add_Subt_Sgf_module_Add_overflow_Result_Q_reg_0_ ( .D(n667), .CK(
        clk), .RN(n1552), .Q(add_overflow_flag), .QN(n1520) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_24_ ( .D(n240), .CK(clk), 
        .RN(n1549), .Q(Add_Subt_result[24]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_23_ ( .D(n239), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[23]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_22_ ( .D(n238), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[22]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_21_ ( .D(n237), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[21]), .QN(n1525) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_20_ ( .D(n236), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[20]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_19_ ( .D(n235), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[19]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_18_ ( .D(n234), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[18]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_17_ ( .D(n233), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[17]), .QN(n1530) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_16_ ( .D(n232), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[16]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_15_ ( .D(n231), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[15]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_14_ ( .D(n230), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[14]), .QN(n1521) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_13_ ( .D(n229), .CK(clk), 
        .RN(n1546), .Q(Add_Subt_result[13]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_12_ ( .D(n228), .CK(clk), 
        .RN(n1546), .Q(Add_Subt_result[12]), .QN(n1451) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_11_ ( .D(n227), .CK(clk), 
        .RN(n1546), .Q(Add_Subt_result[11]), .QN(n1526) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_10_ ( .D(n226), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[10]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_9_ ( .D(n225), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[9]), .QN(n1528) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_8_ ( .D(n224), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[8]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_7_ ( .D(n223), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[7]), .QN(n1522) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_6_ ( .D(n222), .CK(clk), 
        .RN(n1547), .Q(Add_Subt_result[6]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_5_ ( .D(n221), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[5]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_4_ ( .D(n220), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[4]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_3_ ( .D(n219), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[3]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_2_ ( .D(n218), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[2]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_1_ ( .D(n217), .CK(clk), 
        .RN(n1548), .Q(Add_Subt_result[1]), .QN(n1527) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_0_ ( .D(n216), .CK(clk), 
        .RN(n1557), .Q(Add_Subt_result[0]), .QN(n1452) );
  DFFRXLTS XRegister_Q_reg_30_ ( .D(n213), .CK(clk), .RN(n1533), .Q(intDX[30]), 
        .QN(n1440) );
  DFFRXLTS XRegister_Q_reg_29_ ( .D(n212), .CK(clk), .RN(n1533), .Q(intDX[29]), 
        .QN(n1441) );
  DFFRXLTS XRegister_Q_reg_28_ ( .D(n211), .CK(clk), .RN(n1533), .QN(n1501) );
  DFFRXLTS XRegister_Q_reg_27_ ( .D(n210), .CK(clk), .RN(n1533), .Q(intDX[27]), 
        .QN(n1489) );
  DFFRXLTS XRegister_Q_reg_26_ ( .D(n209), .CK(clk), .RN(n1533), .Q(intDX[26]), 
        .QN(n1485) );
  DFFRXLTS XRegister_Q_reg_25_ ( .D(n208), .CK(clk), .RN(n1533), .Q(intDX[25]), 
        .QN(n1443) );
  DFFRXLTS XRegister_Q_reg_24_ ( .D(n207), .CK(clk), .RN(n1533), .Q(intDX[24])
         );
  DFFRXLTS XRegister_Q_reg_23_ ( .D(n206), .CK(clk), .RN(n1533), .Q(intDX[23]), 
        .QN(n1483) );
  DFFRXLTS XRegister_Q_reg_22_ ( .D(n205), .CK(clk), .RN(n1533), .Q(intDX[22]), 
        .QN(n1446) );
  DFFRXLTS XRegister_Q_reg_21_ ( .D(n204), .CK(clk), .RN(n1533), .Q(intDX[21]), 
        .QN(n1480) );
  DFFRXLTS XRegister_Q_reg_20_ ( .D(n203), .CK(clk), .RN(n1534), .Q(intDX[20]), 
        .QN(n1445) );
  DFFRXLTS XRegister_Q_reg_19_ ( .D(n202), .CK(clk), .RN(n1534), .Q(intDX[19]), 
        .QN(n1436) );
  DFFRXLTS XRegister_Q_reg_18_ ( .D(n201), .CK(clk), .RN(n1534), .Q(intDX[18]), 
        .QN(n1484) );
  DFFRXLTS XRegister_Q_reg_17_ ( .D(n200), .CK(clk), .RN(n1534), .Q(intDX[17]), 
        .QN(n1494) );
  DFFRXLTS XRegister_Q_reg_16_ ( .D(n199), .CK(clk), .RN(n1534), .Q(intDX[16]), 
        .QN(n1509) );
  DFFRXLTS XRegister_Q_reg_15_ ( .D(n198), .CK(clk), .RN(n1534), .Q(intDX[15]), 
        .QN(n1479) );
  DFFRXLTS XRegister_Q_reg_14_ ( .D(n197), .CK(clk), .RN(n1534), .Q(intDX[14]), 
        .QN(n1487) );
  DFFRXLTS XRegister_Q_reg_13_ ( .D(n196), .CK(clk), .RN(n1534), .Q(intDX[13]), 
        .QN(n1442) );
  DFFRXLTS XRegister_Q_reg_12_ ( .D(n195), .CK(clk), .RN(n1534), .Q(intDX[12]), 
        .QN(n1444) );
  DFFRXLTS XRegister_Q_reg_11_ ( .D(n194), .CK(clk), .RN(n1534), .Q(intDX[11]), 
        .QN(n1481) );
  DFFRXLTS XRegister_Q_reg_10_ ( .D(n193), .CK(clk), .RN(n1535), .Q(intDX[10]), 
        .QN(n1506) );
  DFFRXLTS XRegister_Q_reg_9_ ( .D(n192), .CK(clk), .RN(n1535), .Q(intDX[9]), 
        .QN(n1488) );
  DFFRXLTS XRegister_Q_reg_8_ ( .D(n191), .CK(clk), .RN(n1535), .Q(intDX[8]), 
        .QN(n1482) );
  DFFRXLTS XRegister_Q_reg_7_ ( .D(n190), .CK(clk), .RN(n1535), .QN(n1447) );
  DFFRXLTS XRegister_Q_reg_6_ ( .D(n189), .CK(clk), .RN(n1551), .Q(intDX[6]), 
        .QN(n1507) );
  DFFRXLTS XRegister_Q_reg_5_ ( .D(n188), .CK(clk), .RN(n1554), .Q(intDX[5]), 
        .QN(n1448) );
  DFFRXLTS XRegister_Q_reg_4_ ( .D(n187), .CK(clk), .RN(n1553), .Q(intDX[4]), 
        .QN(n1508) );
  DFFRXLTS XRegister_Q_reg_3_ ( .D(n186), .CK(clk), .RN(n1553), .Q(intDX[3]), 
        .QN(n1490) );
  DFFRXLTS XRegister_Q_reg_2_ ( .D(n185), .CK(clk), .RN(n1553), .Q(intDX[2]), 
        .QN(n1492) );
  DFFRXLTS XRegister_Q_reg_1_ ( .D(n184), .CK(clk), .RN(n1553), .Q(intDX[1]), 
        .QN(n1491) );
  DFFRXLTS XRegister_Q_reg_0_ ( .D(n183), .CK(clk), .RN(n1552), .Q(intDX[0]), 
        .QN(n1493) );
  DFFRXLTS YRegister_Q_reg_30_ ( .D(n180), .CK(clk), .RN(n1535), .Q(intDY[30]), 
        .QN(n1449) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_30_ ( .D(n179), .CK(clk), .RN(
        n1550), .Q(DmP[30]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_30_ ( .D(n178), .CK(clk), .RN(
        n1551), .Q(DMP[30]) );
  DFFRXLTS YRegister_Q_reg_29_ ( .D(n177), .CK(clk), .RN(n1535), .Q(intDY[29]), 
        .QN(n1498) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_29_ ( .D(n176), .CK(clk), .RN(
        n1550), .Q(DmP[29]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_29_ ( .D(n175), .CK(clk), .RN(
        n1551), .Q(DMP[29]) );
  DFFRXLTS YRegister_Q_reg_28_ ( .D(n174), .CK(clk), .RN(n1535), .Q(intDY[28])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_28_ ( .D(n173), .CK(clk), .RN(
        n1550), .Q(DmP[28]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_28_ ( .D(n172), .CK(clk), .RN(
        n1551), .Q(DMP[28]) );
  DFFRXLTS YRegister_Q_reg_27_ ( .D(n171), .CK(clk), .RN(n1535), .Q(intDY[27])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_27_ ( .D(n170), .CK(clk), .RN(
        n1549), .Q(DmP[27]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_27_ ( .D(n169), .CK(clk), .RN(
        n1551), .Q(DMP[27]) );
  DFFRXLTS YRegister_Q_reg_26_ ( .D(n168), .CK(clk), .RN(n1535), .Q(intDY[26]), 
        .QN(n1496) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_26_ ( .D(n167), .CK(clk), .RN(
        n1549), .Q(DmP[26]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_26_ ( .D(n166), .CK(clk), .RN(
        n1551), .Q(DMP[26]) );
  DFFRXLTS YRegister_Q_reg_25_ ( .D(n165), .CK(clk), .RN(n1535), .Q(intDY[25]), 
        .QN(n1499) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_25_ ( .D(n164), .CK(clk), .RN(
        n1549), .Q(DmP[25]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_25_ ( .D(n163), .CK(clk), .RN(
        n1550), .Q(DMP[25]) );
  DFFRXLTS YRegister_Q_reg_24_ ( .D(n162), .CK(clk), .RN(n1536), .Q(intDY[24]), 
        .QN(n1486) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_24_ ( .D(n161), .CK(clk), .RN(
        n1549), .Q(DmP[24]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_24_ ( .D(n160), .CK(clk), .RN(
        n1550), .Q(DMP[24]) );
  DFFRXLTS YRegister_Q_reg_23_ ( .D(n159), .CK(clk), .RN(n1536), .Q(intDY[23]), 
        .QN(n1438) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_23_ ( .D(n158), .CK(clk), .RN(
        n1549), .Q(DmP[23]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_23_ ( .D(n157), .CK(clk), .RN(
        n1550), .Q(DMP[23]) );
  DFFRXLTS YRegister_Q_reg_22_ ( .D(n156), .CK(clk), .RN(n1536), .Q(intDY[22]), 
        .QN(n1473) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_22_ ( .D(n155), .CK(clk), .RN(
        n1536), .Q(DmP[22]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_22_ ( .D(n154), .CK(clk), .RN(
        n1557), .Q(DMP[22]) );
  DFFRXLTS YRegister_Q_reg_21_ ( .D(n153), .CK(clk), .RN(n1536), .Q(intDY[21]), 
        .QN(n1495) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_21_ ( .D(n152), .CK(clk), .RN(
        n1536), .Q(DmP[21]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_21_ ( .D(n151), .CK(clk), .RN(
        n1557), .Q(DMP[21]) );
  DFFRXLTS YRegister_Q_reg_20_ ( .D(n150), .CK(clk), .RN(n1536), .Q(intDY[20]), 
        .QN(n1497) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_20_ ( .D(n149), .CK(clk), .RN(
        n1536), .Q(DmP[20]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_20_ ( .D(n148), .CK(clk), .RN(
        n1557), .Q(DMP[20]) );
  DFFRXLTS YRegister_Q_reg_19_ ( .D(n147), .CK(clk), .RN(n1536), .Q(intDY[19]), 
        .QN(n1500) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_19_ ( .D(n146), .CK(clk), .RN(
        n1536), .Q(DmP[19]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_19_ ( .D(n145), .CK(clk), .RN(
        n1557), .Q(DMP[19]) );
  DFFRXLTS YRegister_Q_reg_18_ ( .D(n144), .CK(clk), .RN(n1537), .Q(intDY[18]), 
        .QN(n1450) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_18_ ( .D(n143), .CK(clk), .RN(
        n1537), .Q(DmP[18]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_18_ ( .D(n142), .CK(clk), .RN(
        n1556), .Q(DMP[18]) );
  DFFRXLTS YRegister_Q_reg_17_ ( .D(n141), .CK(clk), .RN(n1537), .Q(intDY[17]), 
        .QN(n1518) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_17_ ( .D(n140), .CK(clk), .RN(
        n1537), .Q(DmP[17]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_17_ ( .D(n139), .CK(clk), .RN(
        n1556), .Q(DMP[17]) );
  DFFRXLTS YRegister_Q_reg_16_ ( .D(n138), .CK(clk), .RN(n1537), .Q(intDY[16])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_16_ ( .D(n137), .CK(clk), .RN(
        n1537), .Q(DmP[16]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_16_ ( .D(n136), .CK(clk), .RN(
        n1556), .Q(DMP[16]) );
  DFFRXLTS YRegister_Q_reg_15_ ( .D(n135), .CK(clk), .RN(n1537), .Q(intDY[15]), 
        .QN(n1439) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_15_ ( .D(n134), .CK(clk), .RN(
        n1537), .Q(DmP[15]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_15_ ( .D(n133), .CK(clk), .RN(
        n1556), .Q(DMP[15]) );
  DFFRXLTS YRegister_Q_reg_14_ ( .D(n132), .CK(clk), .RN(n1537), .Q(intDY[14]), 
        .QN(n1472) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_14_ ( .D(n131), .CK(clk), .RN(
        n1537), .Q(DmP[14]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_14_ ( .D(n130), .CK(clk), .RN(
        n1556), .Q(DMP[14]) );
  DFFRXLTS YRegister_Q_reg_13_ ( .D(n129), .CK(clk), .RN(n1538), .Q(intDY[13]), 
        .QN(n1469) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_13_ ( .D(n128), .CK(clk), .RN(
        n1538), .Q(DmP[13]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_13_ ( .D(n127), .CK(clk), .RN(
        n1555), .Q(DMP[13]) );
  DFFRXLTS YRegister_Q_reg_12_ ( .D(n126), .CK(clk), .RN(n1538), .Q(intDY[12]), 
        .QN(n1471) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_12_ ( .D(n125), .CK(clk), .RN(
        n1538), .Q(DmP[12]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_12_ ( .D(n124), .CK(clk), .RN(
        n1555), .Q(DMP[12]) );
  DFFRXLTS YRegister_Q_reg_11_ ( .D(n123), .CK(clk), .RN(n1538), .Q(intDY[11]), 
        .QN(n1475) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_11_ ( .D(n122), .CK(clk), .RN(
        n1538), .Q(DmP[11]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_11_ ( .D(n121), .CK(clk), .RN(
        n1555), .Q(DMP[11]) );
  DFFRXLTS YRegister_Q_reg_10_ ( .D(n120), .CK(clk), .RN(n1538), .Q(intDY[10])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_10_ ( .D(n119), .CK(clk), .RN(
        n1538), .Q(DmP[10]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_10_ ( .D(n118), .CK(clk), .RN(
        n1555), .Q(DMP[10]) );
  DFFRXLTS YRegister_Q_reg_9_ ( .D(n117), .CK(clk), .RN(n1538), .Q(intDY[9])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_9_ ( .D(n116), .CK(clk), .RN(
        n1538), .Q(DmP[9]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_9_ ( .D(n115), .CK(clk), .RN(
        n1555), .Q(DMP[9]) );
  DFFRXLTS YRegister_Q_reg_8_ ( .D(n114), .CK(clk), .RN(n1539), .Q(intDY[8]), 
        .QN(n1474) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_8_ ( .D(n113), .CK(clk), .RN(
        n1539), .Q(DmP[8]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_8_ ( .D(n112), .CK(clk), .RN(
        n1554), .Q(DMP[8]) );
  DFFRXLTS YRegister_Q_reg_7_ ( .D(n111), .CK(clk), .RN(n1539), .Q(intDY[7])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_7_ ( .D(n110), .CK(clk), .RN(
        n1539), .Q(DmP[7]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_7_ ( .D(n109), .CK(clk), .RN(
        n1554), .Q(DMP[7]) );
  DFFRXLTS YRegister_Q_reg_6_ ( .D(n108), .CK(clk), .RN(n1539), .Q(intDY[6])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_6_ ( .D(n107), .CK(clk), .RN(
        n1539), .Q(DmP[6]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_6_ ( .D(n106), .CK(clk), .RN(
        n1554), .Q(DMP[6]) );
  DFFRXLTS YRegister_Q_reg_5_ ( .D(n105), .CK(clk), .RN(n1539), .Q(intDY[5])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_5_ ( .D(n104), .CK(clk), .RN(
        n1539), .Q(DmP[5]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_5_ ( .D(n103), .CK(clk), .RN(
        n1554), .Q(DMP[5]) );
  DFFRXLTS YRegister_Q_reg_4_ ( .D(n102), .CK(clk), .RN(n1539), .Q(intDY[4])
         );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_4_ ( .D(n101), .CK(clk), .RN(
        n1539), .Q(DmP[4]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_4_ ( .D(n100), .CK(clk), .RN(
        n1553), .Q(DMP[4]) );
  DFFRXLTS YRegister_Q_reg_3_ ( .D(n99), .CK(clk), .RN(n1540), .Q(intDY[3]), 
        .QN(n1468) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_3_ ( .D(n98), .CK(clk), .RN(
        n1540), .Q(DmP[3]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_3_ ( .D(n97), .CK(clk), .RN(
        n1553), .Q(DMP[3]) );
  DFFRXLTS YRegister_Q_reg_2_ ( .D(n96), .CK(clk), .RN(n1540), .Q(intDY[2]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_2_ ( .D(n95), .CK(clk), .RN(
        n1540), .Q(DmP[2]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_2_ ( .D(n94), .CK(clk), .RN(
        n1553), .Q(DMP[2]) );
  DFFRXLTS YRegister_Q_reg_1_ ( .D(n93), .CK(clk), .RN(n1540), .Q(intDY[1]), 
        .QN(n1470) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_1_ ( .D(n92), .CK(clk), .RN(
        n1540), .Q(DmP[1]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_1_ ( .D(n91), .CK(clk), .RN(
        n1552), .Q(DMP[1]) );
  DFFRXLTS YRegister_Q_reg_0_ ( .D(n90), .CK(clk), .RN(n1540), .Q(intDY[0]) );
  DFFRXLTS Oper_Start_in_module_mRegister_Q_reg_0_ ( .D(n89), .CK(clk), .RN(
        n1540), .Q(DmP[0]) );
  DFFRXLTS Oper_Start_in_module_MRegister_Q_reg_0_ ( .D(n88), .CK(clk), .RN(
        n1552), .Q(DMP[0]) );
  DFFRXLTS Oper_Start_in_module_SignRegister_Q_reg_0_ ( .D(n86), .CK(clk), 
        .RN(n1558), .Q(sign_final_result), .QN(n1453) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_6_ ( .D(n85), .CK(clk), .RN(
        n1551), .Q(exp_oper_result[6]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_5_ ( .D(n84), .CK(clk), .RN(
        n1551), .Q(exp_oper_result[5]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_4_ ( .D(n83), .CK(clk), .RN(
        n1551), .Q(exp_oper_result[4]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_3_ ( .D(n82), .CK(clk), .RN(
        n1550), .Q(exp_oper_result[3]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_2_ ( .D(n81), .CK(clk), .RN(
        n1550), .Q(exp_oper_result[2]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_1_ ( .D(n80), .CK(clk), .RN(
        n1550), .Q(exp_oper_result[1]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_0_ ( .D(n79), .CK(clk), .RN(
        n1549), .Q(exp_oper_result[0]) );
  DFFRXLTS Exp_Operation_Module_exp_result_Q_reg_7_ ( .D(n78), .CK(clk), .RN(
        n1551), .Q(exp_oper_result[7]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_3_ ( .D(n76), .CK(clk), .RN(n1549), .Q(LZA_output[3]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_2_ ( .D(n75), .CK(clk), .RN(n1549), .Q(LZA_output[2]) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_1_ ( .D(n74), .CK(clk), .RN(n1549), .Q(LZA_output[1]), .QN(n1467) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_0_ ( .D(n73), .CK(clk), .RN(n1540), .QN(n1531) );
  DFFRXLTS Leading_Zero_Detector_Module_Output_Reg_Q_reg_4_ ( .D(n72), .CK(clk), .RN(n1550), .Q(LZA_output[4]) );
  DFFRXLTS Sel_B_Q_reg_0_ ( .D(n71), .CK(clk), .RN(n244), .Q(FSM_selector_B[0]), .QN(n1459) );
  DFFRXLTS Sel_B_Q_reg_1_ ( .D(n70), .CK(clk), .RN(n244), .Q(FSM_selector_B[1]), .QN(n1437) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_18_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[18]), .CK(clk), .RN(n1540), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[44]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_17_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[17]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[43]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_16_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[16]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[42]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_15_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[15]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[41]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_14_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[14]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[40]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_13_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[13]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[39]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_12_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[12]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[38]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_11_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[11]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[37]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_10_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[10]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[36]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_9_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[9]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[35]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_8_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[8]), .CK(clk), .RN(n1541), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[34]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_7_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[7]), .CK(clk), .RN(n1542), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[33]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_3_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[3]), .CK(clk), .RN(n1542), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[29]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_6_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[6]), .CK(clk), .RN(n1542), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[32]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_2_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[2]), .CK(clk), .RN(n1542), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[28]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_5_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[5]), .CK(clk), .RN(n1542), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[31]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_1_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[1]), .CK(clk), .RN(n1542), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[27]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_4_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[4]), .CK(clk), .RN(n1542), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[30]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_0_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[0]), .CK(clk), .RN(n1542), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[26]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_20_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[20]), .CK(clk), .RN(n1543), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[46]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_19_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[19]), .CK(clk), .RN(n1543), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[45]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_24_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[24]), .CK(clk), .RN(n1558), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[50]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_23_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[23]), .CK(clk), .RN(n1543), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[49]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_22_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[22]), .CK(clk), .RN(n1544), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[48]) );
  DFFRXLTS Barrel_Shifter_module_Mux_Array_Mid_Reg_Q_reg_21_ ( .D(
        Barrel_Shifter_module_Mux_Array_Data_array[21]), .CK(clk), .RN(n1544), 
        .Q(Barrel_Shifter_module_Mux_Array_Data_array[47]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_12_ ( .D(n59), .CK(clk), 
        .RN(n1555), .Q(Sgf_normalized_result[12]), .QN(n1462) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_13_ ( .D(n57), .CK(clk), 
        .RN(n1555), .Q(Sgf_normalized_result[13]), .QN(n1466) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_11_ ( .D(n55), .CK(clk), 
        .RN(n1554), .Q(Sgf_normalized_result[11]), .QN(n1461) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_14_ ( .D(n53), .CK(clk), 
        .RN(n1555), .Q(Sgf_normalized_result[14]), .QN(n1465) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_10_ ( .D(n51), .CK(clk), 
        .RN(n1554), .Q(Sgf_normalized_result[10]), .QN(n1460) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_15_ ( .D(n49), .CK(clk), 
        .RN(n1555), .Q(Sgf_normalized_result[15]), .QN(n1464) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_9_ ( .D(n47), .CK(clk), .RN(
        n1554), .Q(Sgf_normalized_result[9]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_16_ ( .D(n45), .CK(clk), 
        .RN(n1555), .Q(Sgf_normalized_result[16]), .QN(n1463) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_8_ ( .D(n43), .CK(clk), .RN(
        n1554), .Q(Sgf_normalized_result[8]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_17_ ( .D(n41), .CK(clk), 
        .RN(n1556), .Q(Sgf_normalized_result[17]), .QN(n1478) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_7_ ( .D(n39), .CK(clk), .RN(
        n1554), .Q(Sgf_normalized_result[7]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_18_ ( .D(n37), .CK(clk), 
        .RN(n1556), .Q(Sgf_normalized_result[18]), .QN(n1477) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_6_ ( .D(n35), .CK(clk), .RN(
        n1553), .Q(Sgf_normalized_result[6]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_19_ ( .D(n33), .CK(clk), 
        .RN(n1556), .Q(Sgf_normalized_result[19]), .QN(n1476) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_5_ ( .D(n31), .CK(clk), .RN(
        n1553), .Q(Sgf_normalized_result[5]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_20_ ( .D(n29), .CK(clk), 
        .RN(n1556), .Q(Sgf_normalized_result[20]), .QN(n1505) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_4_ ( .D(n27), .CK(clk), .RN(
        n1553), .Q(Sgf_normalized_result[4]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_21_ ( .D(n25), .CK(clk), 
        .RN(n1556), .Q(Sgf_normalized_result[21]), .QN(n1504) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_3_ ( .D(n23), .CK(clk), .RN(
        n1552), .Q(Sgf_normalized_result[3]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_22_ ( .D(n21), .CK(clk), 
        .RN(n1557), .Q(Sgf_normalized_result[22]), .QN(n1503) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_2_ ( .D(n19), .CK(clk), .RN(
        n1552), .Q(Sgf_normalized_result[2]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_23_ ( .D(n17), .CK(clk), 
        .RN(n1557), .Q(Sgf_normalized_result[23]), .QN(n1502) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_1_ ( .D(n15), .CK(clk), .RN(
        n1552), .Q(Sgf_normalized_result[1]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_24_ ( .D(n14), .CK(clk), 
        .RN(n1557), .Q(Sgf_normalized_result[24]), .QN(n1524) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_25_ ( .D(n12), .CK(clk), 
        .RN(n1558), .Q(Sgf_normalized_result[25]) );
  CMPR32X2TS DP_OP_42J1_122_8048_U8 ( .A(DP_OP_42J1_122_8048_n19), .B(
        S_Oper_A_exp[1]), .C(DP_OP_42J1_122_8048_n8), .CO(
        DP_OP_42J1_122_8048_n7), .S(Exp_Operation_Module_Data_S[1]) );
  CMPR32X2TS DP_OP_42J1_122_8048_U7 ( .A(DP_OP_42J1_122_8048_n18), .B(
        S_Oper_A_exp[2]), .C(DP_OP_42J1_122_8048_n7), .CO(
        DP_OP_42J1_122_8048_n6), .S(Exp_Operation_Module_Data_S[2]) );
  CMPR32X2TS DP_OP_42J1_122_8048_U6 ( .A(DP_OP_42J1_122_8048_n17), .B(
        S_Oper_A_exp[3]), .C(DP_OP_42J1_122_8048_n6), .CO(
        DP_OP_42J1_122_8048_n5), .S(Exp_Operation_Module_Data_S[3]) );
  CMPR32X2TS DP_OP_42J1_122_8048_U5 ( .A(DP_OP_42J1_122_8048_n16), .B(
        S_Oper_A_exp[4]), .C(DP_OP_42J1_122_8048_n5), .CO(
        DP_OP_42J1_122_8048_n4), .S(Exp_Operation_Module_Data_S[4]) );
  CMPR32X2TS DP_OP_42J1_122_8048_U4 ( .A(DP_OP_42J1_122_8048_n15), .B(
        S_Oper_A_exp[5]), .C(DP_OP_42J1_122_8048_n4), .CO(
        DP_OP_42J1_122_8048_n3), .S(Exp_Operation_Module_Data_S[5]) );
  CMPR32X2TS DP_OP_42J1_122_8048_U3 ( .A(DP_OP_42J1_122_8048_n14), .B(
        S_Oper_A_exp[6]), .C(DP_OP_42J1_122_8048_n3), .CO(
        DP_OP_42J1_122_8048_n2), .S(Exp_Operation_Module_Data_S[6]) );
  CMPR32X2TS DP_OP_42J1_122_8048_U2 ( .A(DP_OP_42J1_122_8048_n13), .B(
        S_Oper_A_exp[7]), .C(DP_OP_42J1_122_8048_n2), .CO(
        DP_OP_42J1_122_8048_n1), .S(Exp_Operation_Module_Data_S[7]) );
  CMPR32X2TS DP_OP_42J1_122_8048_U9 ( .A(S_Oper_A_exp[0]), .B(
        FSM_exp_operation_A_S), .C(DP_OP_42J1_122_8048_n20), .CO(
        DP_OP_42J1_122_8048_n8), .S(Exp_Operation_Module_Data_S[0]) );
  DFFRXLTS FS_Module_state_reg_reg_0_ ( .D(n214), .CK(clk), .RN(n1552), .Q(
        FS_Module_state_reg[0]), .QN(n1455) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_25_ ( .D(n215), .CK(clk), 
        .RN(n1557), .Q(Add_Subt_result[25]), .QN(n1523) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_18_ ( .D(n28), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[18]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_30_ ( .D(n60), 
        .CK(clk), .RN(n1543), .Q(final_result_ieee[30]) );
  DFFRXLTS YRegister_Q_reg_31_ ( .D(n87), .CK(clk), .RN(n1558), .Q(intDY[31])
         );
  DFFRXLTS FS_Module_state_reg_reg_1_ ( .D(n247), .CK(clk), .RN(n1558), .Q(
        FS_Module_state_reg[1]), .QN(n1456) );
  DFFRXLTS FS_Module_state_reg_reg_2_ ( .D(n246), .CK(clk), .RN(n1558), .Q(
        FS_Module_state_reg[2]), .QN(n1457) );
  DFFRXLTS Exp_Operation_Module_Overflow_Q_reg_0_ ( .D(n77), .CK(clk), .RN(
        n1546), .Q(overflow_flag), .QN(n1532) );
  DFFRXLTS Exp_Operation_Module_Underflow_Q_reg_0_ ( .D(n69), .CK(clk), .RN(
        n1546), .Q(underflow_flag), .QN(n1529) );
  DFFRXLTS Sel_D_Q_reg_0_ ( .D(n245), .CK(clk), .RN(n244), .Q(FSM_selector_D)
         );
  DFFRXLTS FS_Module_state_reg_reg_3_ ( .D(n242), .CK(clk), .RN(n1552), .Q(
        FS_Module_state_reg[3]), .QN(n1458) );
  DFFRXLTS XRegister_Q_reg_31_ ( .D(n182), .CK(clk), .RN(n1558), .Q(intDX[31]), 
        .QN(n1454) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_31_ ( .D(n68), 
        .CK(clk), .RN(n1542), .Q(final_result_ieee[31]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_10_ ( .D(n58), 
        .CK(clk), .RN(n1544), .Q(final_result_ieee[10]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_11_ ( .D(n56), 
        .CK(clk), .RN(n1544), .Q(final_result_ieee[11]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_9_ ( .D(n54), .CK(
        clk), .RN(n1544), .Q(final_result_ieee[9]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_12_ ( .D(n52), 
        .CK(clk), .RN(n1544), .Q(final_result_ieee[12]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_8_ ( .D(n50), .CK(
        clk), .RN(n1544), .Q(final_result_ieee[8]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_13_ ( .D(n48), 
        .CK(clk), .RN(n1544), .Q(final_result_ieee[13]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_14_ ( .D(n44), 
        .CK(clk), .RN(n1544), .Q(final_result_ieee[14]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_15_ ( .D(n40), 
        .CK(clk), .RN(n1544), .Q(final_result_ieee[15]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_16_ ( .D(n36), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[16]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_17_ ( .D(n32), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[17]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_19_ ( .D(n24), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[19]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_20_ ( .D(n20), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[20]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_21_ ( .D(n16), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[21]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_22_ ( .D(n13), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[22]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_7_ ( .D(n1517), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[7]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_6_ ( .D(n1516), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[6]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_5_ ( .D(n1515), 
        .CK(clk), .RN(n1545), .Q(final_result_ieee[5]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_4_ ( .D(n1514), 
        .CK(clk), .RN(n1546), .Q(final_result_ieee[4]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_3_ ( .D(n1513), 
        .CK(clk), .RN(n1546), .Q(final_result_ieee[3]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_2_ ( .D(n1512), 
        .CK(clk), .RN(n1546), .Q(final_result_ieee[2]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_1_ ( .D(n1511), 
        .CK(clk), .RN(n1546), .Q(final_result_ieee[1]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_0_ ( .D(n1510), 
        .CK(clk), .RN(n1546), .Q(final_result_ieee[0]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_28_ ( .D(n62), 
        .CK(clk), .RN(n1543), .Q(final_result_ieee[28]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_29_ ( .D(n61), 
        .CK(clk), .RN(n1543), .Q(final_result_ieee[29]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_23_ ( .D(n67), 
        .CK(clk), .RN(n1542), .Q(final_result_ieee[23]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_24_ ( .D(n66), 
        .CK(clk), .RN(n1543), .Q(final_result_ieee[24]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_25_ ( .D(n65), 
        .CK(clk), .RN(n1543), .Q(final_result_ieee[25]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_26_ ( .D(n64), 
        .CK(clk), .RN(n1543), .Q(final_result_ieee[26]) );
  DFFRXLTS final_result_ieee_Module_Final_Result_IEEE_Q_reg_27_ ( .D(n63), 
        .CK(clk), .RN(n1543), .Q(final_result_ieee[27]) );
  DFFRXLTS ASRegister_Q_reg_0_ ( .D(n181), .CK(clk), .RN(n1558), .Q(intAS) );
  OAI21XLTS U892 ( .A0(intDX[18]), .A1(n1450), .B0(n760), .Y(n764) );
  INVX2TS U893 ( .A(n919), .Y(n1305) );
  INVX2TS U894 ( .A(n919), .Y(n1267) );
  INVX2TS U895 ( .A(n1093), .Y(n1076) );
  OAI211XLTS U896 ( .A0(n717), .A1(n773), .B0(n716), .C0(n715), .Y(n722) );
  INVX2TS U897 ( .A(n1026), .Y(n783) );
  NOR2XLTS U898 ( .A(n1074), .B(Add_Subt_result[18]), .Y(n1089) );
  AOI211XLTS U899 ( .A0(n769), .A1(n768), .B0(n767), .C0(n766), .Y(n775) );
  NOR2XLTS U900 ( .A(n1465), .B(n702), .Y(n675) );
  NOR2XLTS U901 ( .A(n1478), .B(n702), .Y(n673) );
  NOR2XLTS U902 ( .A(FS_Module_state_reg[1]), .B(n1457), .Y(n824) );
  NOR3XLTS U903 ( .A(n939), .B(n659), .C(n921), .Y(n954) );
  NOR2XLTS U904 ( .A(n655), .B(n926), .Y(n1398) );
  NOR2XLTS U905 ( .A(n1459), .B(FSM_selector_B[1]), .Y(n1012) );
  INVX2TS U906 ( .A(n795), .Y(n800) );
  NOR2XLTS U907 ( .A(n1456), .B(FS_Module_state_reg[2]), .Y(n1024) );
  NAND2X1TS U908 ( .A(FS_Module_state_reg[0]), .B(n1024), .Y(n1025) );
  INVX2TS U909 ( .A(n1422), .Y(n1431) );
  NOR2XLTS U910 ( .A(FS_Module_state_reg[0]), .B(n1458), .Y(n1029) );
  INVX2TS U911 ( .A(n1359), .Y(n1006) );
  NAND2X1TS U912 ( .A(FS_Module_state_reg[2]), .B(n1023), .Y(n1032) );
  INVX2TS U913 ( .A(n935), .Y(n939) );
  NOR2XLTS U914 ( .A(n976), .B(FS_Module_state_reg[1]), .Y(n1420) );
  INVX2TS U915 ( .A(n890), .Y(n975) );
  OAI21XLTS U916 ( .A0(n988), .A1(n1529), .B0(n987), .Y(n69) );
  OAI31X1TS U917 ( .A0(n1245), .A1(n1311), .A2(n937), .B0(n936), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[25]) );
  INVX2TS U918 ( .A(n864), .Y(ready) );
  OAI211X1TS U919 ( .A0(Add_Subt_result[3]), .A1(n1097), .B0(n1096), .C0(n1095), .Y(n1416) );
  NOR3BX1TS U920 ( .AN(n1099), .B(Add_Subt_result[3]), .C(Add_Subt_result[2]), 
        .Y(n1094) );
  XOR2X1TS U921 ( .A(DP_OP_42J1_122_8048_n1), .B(FSM_exp_operation_A_S), .Y(
        n1230) );
  NAND2BX1TS U922 ( .AN(Add_Subt_result[5]), .B(n1100), .Y(n1081) );
  INVX1TS U923 ( .A(n1078), .Y(n1415) );
  OAI31XLTS U924 ( .A0(Add_Subt_result[5]), .A1(Add_Subt_result[9]), .A2(
        Add_Subt_result[8]), .B0(n1082), .Y(n1083) );
  OAI31XLTS U925 ( .A0(Add_Subt_result[12]), .A1(Add_Subt_result[11]), .A2(
        Add_Subt_result[13]), .B0(n1098), .Y(n1102) );
  INVX1TS U926 ( .A(n1238), .Y(n957) );
  NAND3BX1TS U927 ( .AN(n758), .B(n756), .C(n755), .Y(n776) );
  NOR3X1TS U928 ( .A(n981), .B(n1374), .C(n980), .Y(n983) );
  INVX1TS U929 ( .A(n931), .Y(n656) );
  INVX1TS U930 ( .A(n984), .Y(n988) );
  XOR2X1TS U931 ( .A(n696), .B(n678), .Y(n1217) );
  XOR2X1TS U932 ( .A(n696), .B(n671), .Y(n1151) );
  XOR2X1TS U933 ( .A(n1038), .B(n670), .Y(n1133) );
  INVX1TS U934 ( .A(n926), .Y(n921) );
  XOR2X1TS U935 ( .A(n696), .B(n674), .Y(n1204) );
  XOR2X1TS U936 ( .A(n1038), .B(n672), .Y(n1169) );
  XOR2X1TS U937 ( .A(n696), .B(n680), .Y(n1200) );
  INVX1TS U938 ( .A(n950), .Y(n784) );
  XOR2X1TS U939 ( .A(n1038), .B(n673), .Y(n1187) );
  XOR2X1TS U940 ( .A(n696), .B(n695), .Y(n1195) );
  XOR2X1TS U941 ( .A(n1038), .B(n699), .Y(n1178) );
  XOR2X1TS U942 ( .A(n1038), .B(n708), .Y(n1141) );
  AOI2BB2X1TS U943 ( .B0(n722), .B1(n771), .A0N(n721), .A1N(n720), .Y(n777) );
  INVX1TS U944 ( .A(n915), .Y(n940) );
  INVX1TS U945 ( .A(n1028), .Y(n978) );
  NAND2XLTS U946 ( .A(n782), .B(FS_Module_state_reg[0]), .Y(n1019) );
  INVX1TS U947 ( .A(n1177), .Y(n700) );
  NAND2XLTS U948 ( .A(n1455), .B(n782), .Y(n1026) );
  INVX1TS U949 ( .A(n1194), .Y(n697) );
  INVX1TS U950 ( .A(n1159), .Y(n705) );
  NOR2X1TS U951 ( .A(n1505), .B(n702), .Y(n703) );
  NOR2X1TS U952 ( .A(n1477), .B(n707), .Y(n699) );
  NOR2X1TS U953 ( .A(n1463), .B(n707), .Y(n695) );
  INVX1TS U954 ( .A(n1140), .Y(n709) );
  NOR2X1TS U955 ( .A(n1503), .B(n707), .Y(n708) );
  NAND2BX1TS U956 ( .AN(Sgf_normalized_result[25]), .B(n707), .Y(n1034) );
  NOR2X1TS U957 ( .A(n1476), .B(n707), .Y(n672) );
  OAI21X1TS U958 ( .A0(intDX[26]), .A1(n1496), .B0(n714), .Y(n773) );
  AOI211X1TS U959 ( .A0(intDY[28]), .A1(n1501), .B0(n720), .C0(n718), .Y(n771)
         );
  OAI211X1TS U960 ( .A0(intDX[20]), .A1(n1497), .B0(n769), .C0(n754), .Y(n763)
         );
  OAI211X1TS U961 ( .A0(intDX[12]), .A1(n1471), .B0(n749), .C0(n723), .Y(n753)
         );
  NAND2XLTS U962 ( .A(Sgf_normalized_result[1]), .B(n1127), .Y(n666) );
  NAND2XLTS U963 ( .A(FSM_selector_C), .B(n824), .Y(n785) );
  NOR2X1TS U964 ( .A(n1499), .B(intDX[25]), .Y(n772) );
  NOR2X1TS U965 ( .A(Add_Subt_result[21]), .B(Add_Subt_result[20]), .Y(n1110)
         );
  NAND2BX1TS U966 ( .AN(intDX[19]), .B(intDY[19]), .Y(n760) );
  NAND2BX1TS U967 ( .AN(intDX[24]), .B(intDY[24]), .Y(n770) );
  NOR3X1TS U968 ( .A(FS_Module_state_reg[2]), .B(FS_Module_state_reg[1]), .C(
        FS_Module_state_reg[3]), .Y(n982) );
  NOR2X1TS U969 ( .A(Add_Subt_result[25]), .B(Add_Subt_result[24]), .Y(n1111)
         );
  OR2X2TS U970 ( .A(FSM_selector_B[0]), .B(FSM_selector_B[1]), .Y(n1014) );
  NOR2X1TS U971 ( .A(Add_Subt_result[17]), .B(Add_Subt_result[16]), .Y(n1107)
         );
  NOR2X1TS U972 ( .A(n1498), .B(intDX[29]), .Y(n718) );
  NOR2X1TS U973 ( .A(n1518), .B(intDX[17]), .Y(n758) );
  NAND2BX1TS U974 ( .AN(intDX[27]), .B(intDY[27]), .Y(n714) );
  ADDFHX1TS U975 ( .A(n1035), .B(n1034), .CI(n1033), .CO(n711), .S(n1036) );
  ADDFHX2TS U976 ( .A(n1125), .B(n1124), .CI(n1123), .CO(n1033), .S(n1126) );
  XOR2XLTS U977 ( .A(n1143), .B(n1142), .Y(n1144) );
  XOR2XLTS U978 ( .A(n1162), .B(n1161), .Y(n1163) );
  XOR2XLTS U979 ( .A(n1180), .B(n1179), .Y(n1181) );
  XOR2XLTS U980 ( .A(n1197), .B(n1196), .Y(n1198) );
  MXI2X1TS U981 ( .A(n1532), .B(n1233), .S0(n1232), .Y(n77) );
  NOR2X1TS U982 ( .A(Add_Subt_result[4]), .B(n1081), .Y(n1099) );
  NOR3X1TS U983 ( .A(Add_Subt_result[7]), .B(Add_Subt_result[6]), .C(n1078), 
        .Y(n1100) );
  NOR2X1TS U984 ( .A(Add_Subt_result[10]), .B(n1076), .Y(n1082) );
  XOR2XLTS U985 ( .A(n1175), .B(n1174), .Y(n1176) );
  INVX1TS U986 ( .A(n970), .Y(n898) );
  NOR2X1TS U987 ( .A(Add_Subt_result[11]), .B(n1116), .Y(n1417) );
  NAND2BX1TS U988 ( .AN(Add_Subt_result[13]), .B(n1098), .Y(n1116) );
  NAND2BX1TS U989 ( .AN(n1052), .B(n654), .Y(n1067) );
  NOR2X1TS U990 ( .A(Add_Subt_result[14]), .B(n1112), .Y(n1098) );
  OR2X2TS U991 ( .A(n778), .B(n993), .Y(n1000) );
  NOR2X1TS U992 ( .A(n939), .B(n938), .Y(n1375) );
  AFHCONX2TS U993 ( .A(n1138), .B(n1137), .CI(n1136), .CON(n1145), .S(n1139)
         );
  NOR2X1TS U994 ( .A(n653), .B(n926), .Y(n1394) );
  XOR2XLTS U995 ( .A(n1141), .B(n1140), .Y(n1142) );
  OAI31XLTS U996 ( .A0(FS_Module_state_reg[0]), .A1(FS_Module_state_reg[1]), 
        .A2(FS_Module_state_reg[3]), .B0(n863), .Y(n865) );
  XOR2XLTS U997 ( .A(n1178), .B(n1177), .Y(n1179) );
  XOR2XLTS U998 ( .A(n1195), .B(n1194), .Y(n1196) );
  XOR2XLTS U999 ( .A(n1160), .B(n1159), .Y(n1161) );
  XOR2XLTS U1000 ( .A(n1173), .B(n1172), .Y(n1174) );
  NOR2X1TS U1001 ( .A(n799), .B(n795), .Y(n961) );
  NOR2X1TS U1002 ( .A(n1073), .B(n1103), .Y(n1410) );
  NOR2X1TS U1003 ( .A(n1075), .B(Add_Subt_result[15]), .Y(n1086) );
  AO22X1TS U1004 ( .A0(LZA_output[2]), .A1(n1012), .B0(n665), .B1(
        exp_oper_result[2]), .Y(n1236) );
  NOR2X1TS U1005 ( .A(n1072), .B(Add_Subt_result[19]), .Y(n1104) );
  AND2X2TS U1006 ( .A(n1455), .B(n979), .Y(n974) );
  OR2X2TS U1007 ( .A(n977), .B(FS_Module_state_reg[3]), .Y(n1153) );
  NAND2BX1TS U1008 ( .AN(n825), .B(n824), .Y(n826) );
  MX2X1TS U1009 ( .A(DMP[11]), .B(Sgf_normalized_result[13]), .S0(n704), .Y(
        n1222) );
  NOR2XLTS U1010 ( .A(n1466), .B(n702), .Y(n676) );
  INVX1TS U1011 ( .A(n825), .Y(n862) );
  INVX1TS U1012 ( .A(n1012), .Y(n1015) );
  NAND2XLTS U1013 ( .A(FS_Module_state_reg[0]), .B(FS_Module_state_reg[3]), 
        .Y(n825) );
  NAND2XLTS U1014 ( .A(FS_Module_state_reg[2]), .B(FS_Module_state_reg[1]), 
        .Y(n977) );
  NOR2X1TS U1015 ( .A(n1449), .B(intDX[30]), .Y(n720) );
  NOR2X2TS U1016 ( .A(n1130), .B(n690), .Y(n1136) );
  AFHCINX2TS U1017 ( .CIN(n1220), .B(n1221), .A(n1222), .S(n1223), .CO(n1212)
         );
  NAND3X1TS U1018 ( .A(n983), .B(n1063), .C(n244), .Y(FSM_exp_operation_A_S)
         );
  NAND4BXLTS U1019 ( .AN(n979), .B(n978), .C(add_overflow_flag), .D(n1405), 
        .Y(n980) );
  MX2X1TS U1020 ( .A(DMP[24]), .B(exp_oper_result[1]), .S0(n1070), .Y(
        S_Oper_A_exp[1]) );
  XOR2XLTS U1021 ( .A(FSM_exp_operation_A_S), .B(n1016), .Y(
        DP_OP_42J1_122_8048_n19) );
  MX2X1TS U1022 ( .A(DMP[27]), .B(exp_oper_result[4]), .S0(n1070), .Y(
        S_Oper_A_exp[4]) );
  XOR2XLTS U1023 ( .A(FSM_exp_operation_A_S), .B(n1010), .Y(
        DP_OP_42J1_122_8048_n16) );
  AO22XLTS U1024 ( .A0(LZA_output[4]), .A1(n1012), .B0(n665), .B1(DmP[27]), 
        .Y(n1010) );
  NAND2BXLTS U1025 ( .AN(intDX[13]), .B(intDY[13]), .Y(n723) );
  NOR2BX1TS U1026 ( .AN(n1141), .B(n709), .Y(n710) );
  NAND2BXLTS U1027 ( .AN(n1081), .B(Add_Subt_result[4]), .Y(n1095) );
  AO22XLTS U1028 ( .A0(n1410), .A1(Add_Subt_result[18]), .B0(
        Add_Subt_result[10]), .B1(n1093), .Y(n1119) );
  MX2X1TS U1029 ( .A(DMP[30]), .B(exp_oper_result[7]), .S0(n1070), .Y(
        S_Oper_A_exp[7]) );
  XOR2XLTS U1030 ( .A(FSM_exp_operation_A_S), .B(n1007), .Y(
        DP_OP_42J1_122_8048_n13) );
  CLKAND2X2TS U1031 ( .A(n664), .B(DmP[30]), .Y(n1007) );
  MX2X1TS U1032 ( .A(DMP[25]), .B(exp_oper_result[2]), .S0(n1070), .Y(
        S_Oper_A_exp[2]) );
  XOR2XLTS U1033 ( .A(FSM_exp_operation_A_S), .B(n1013), .Y(
        DP_OP_42J1_122_8048_n18) );
  AO22XLTS U1034 ( .A0(LZA_output[2]), .A1(n1012), .B0(n665), .B1(DmP[25]), 
        .Y(n1013) );
  MX2X1TS U1035 ( .A(DMP[28]), .B(exp_oper_result[5]), .S0(n1070), .Y(
        S_Oper_A_exp[5]) );
  XOR2XLTS U1036 ( .A(FSM_exp_operation_A_S), .B(n1009), .Y(
        DP_OP_42J1_122_8048_n15) );
  CLKAND2X2TS U1037 ( .A(n664), .B(DmP[28]), .Y(n1009) );
  MX2X1TS U1038 ( .A(DMP[0]), .B(Sgf_normalized_result[2]), .S0(n692), .Y(
        n1138) );
  MX2X1TS U1039 ( .A(DMP[6]), .B(Sgf_normalized_result[8]), .S0(n692), .Y(
        n1192) );
  OAI21XLTS U1040 ( .A0(intDX[3]), .A1(n1468), .B0(intDX[2]), .Y(n729) );
  NAND2BXLTS U1041 ( .AN(intDY[9]), .B(intDX[9]), .Y(n741) );
  NAND3XLTS U1042 ( .A(n1474), .B(n739), .C(intDX[8]), .Y(n740) );
  NOR2XLTS U1043 ( .A(intDY[10]), .B(n737), .Y(n738) );
  OAI211XLTS U1044 ( .A0(intDX[8]), .A1(n1474), .B0(n739), .C0(n742), .Y(n751)
         );
  NOR2BX1TS U1045 ( .AN(n1173), .B(n693), .Y(n694) );
  NOR2BX1TS U1046 ( .AN(n1160), .B(n705), .Y(n706) );
  OAI21XLTS U1047 ( .A0(n1019), .A1(n1318), .B0(n918), .Y(n950) );
  NOR2XLTS U1048 ( .A(r_mode[1]), .B(sign_final_result), .Y(n947) );
  AOI2BB2XLTS U1049 ( .B0(n1322), .B1(n1255), .A0N(n1242), .A1N(n1322), .Y(
        n1252) );
  NAND2BXLTS U1050 ( .AN(Add_Subt_result[6]), .B(n1522), .Y(n1079) );
  AOI31XLTS U1051 ( .A0(n1094), .A1(Add_Subt_result[0]), .A2(n1527), .B0(n1119), .Y(n1096) );
  MX2X1TS U1052 ( .A(DMP[23]), .B(exp_oper_result[0]), .S0(n1070), .Y(
        S_Oper_A_exp[0]) );
  XOR2XLTS U1053 ( .A(FSM_exp_operation_A_S), .B(n1018), .Y(
        DP_OP_42J1_122_8048_n20) );
  AO21XLTS U1054 ( .A0(DmP[23]), .A1(n1459), .B0(n1017), .Y(n1018) );
  MX2X1TS U1055 ( .A(DMP[26]), .B(exp_oper_result[3]), .S0(n1070), .Y(
        S_Oper_A_exp[3]) );
  XOR2XLTS U1056 ( .A(FSM_exp_operation_A_S), .B(n1011), .Y(
        DP_OP_42J1_122_8048_n17) );
  AO22XLTS U1057 ( .A0(LZA_output[3]), .A1(n1012), .B0(n664), .B1(DmP[26]), 
        .Y(n1011) );
  MX2X1TS U1058 ( .A(DMP[29]), .B(exp_oper_result[6]), .S0(n1070), .Y(
        S_Oper_A_exp[6]) );
  XOR2XLTS U1059 ( .A(FSM_exp_operation_A_S), .B(n1008), .Y(
        DP_OP_42J1_122_8048_n14) );
  CLKAND2X2TS U1060 ( .A(n665), .B(DmP[29]), .Y(n1008) );
  CLKAND2X2TS U1061 ( .A(Sgf_normalized_result[0]), .B(n1127), .Y(n1039) );
  XOR2XLTS U1062 ( .A(n682), .B(n689), .Y(n1128) );
  MX2X1TS U1063 ( .A(DMP[2]), .B(Sgf_normalized_result[4]), .S0(n692), .Y(
        n1157) );
  MX2X1TS U1064 ( .A(DMP[7]), .B(Sgf_normalized_result[9]), .S0(n692), .Y(
        n1201) );
  MX2X1TS U1065 ( .A(DMP[10]), .B(Sgf_normalized_result[12]), .S0(n704), .Y(
        n1226) );
  NOR2XLTS U1066 ( .A(n1462), .B(n702), .Y(n677) );
  AFHCINX2TS U1067 ( .CIN(n1150), .B(n1151), .A(n1152), .S(n1154), .CO(n1143)
         );
  MX2X1TS U1068 ( .A(DMP[19]), .B(Sgf_normalized_result[21]), .S0(n704), .Y(
        n1152) );
  OAI22X2TS U1069 ( .A0(n1162), .A1(n706), .B0(n1160), .B1(n1159), .Y(n1150)
         );
  MX2X1TS U1070 ( .A(DMP[22]), .B(Sgf_normalized_result[24]), .S0(n1070), .Y(
        n1124) );
  NOR3BXLTS U1071 ( .AN(n862), .B(FS_Module_state_reg[2]), .C(
        FS_Module_state_reg[1]), .Y(n1028) );
  CLKAND2X2TS U1072 ( .A(n953), .B(n1028), .Y(n1020) );
  NOR2XLTS U1073 ( .A(n1475), .B(intDX[11]), .Y(n737) );
  OAI211XLTS U1074 ( .A0(n1468), .A1(intDX[3]), .B0(n728), .C0(n727), .Y(n731)
         );
  AOI2BB2XLTS U1075 ( .B0(intDX[3]), .B1(n1468), .A0N(intDY[2]), .A1N(n729), 
        .Y(n730) );
  NAND2BXLTS U1076 ( .AN(intDX[2]), .B(intDY[2]), .Y(n727) );
  OAI21XLTS U1077 ( .A0(intDX[13]), .A1(n1469), .B0(intDX[12]), .Y(n736) );
  NAND2BXLTS U1078 ( .AN(intDX[9]), .B(intDY[9]), .Y(n739) );
  AOI211XLTS U1079 ( .A0(n749), .A1(n748), .B0(n747), .C0(n746), .Y(n750) );
  NAND2BXLTS U1080 ( .AN(intDX[21]), .B(intDY[21]), .Y(n754) );
  NAND2BXLTS U1081 ( .AN(intDY[27]), .B(intDX[27]), .Y(n716) );
  NAND3XLTS U1082 ( .A(n1496), .B(n714), .C(intDX[26]), .Y(n715) );
  AO22XLTS U1083 ( .A0(n1305), .A1(Add_Subt_result[19]), .B0(DmP[4]), .B1(
        n1294), .Y(n1295) );
  AO22XLTS U1084 ( .A0(n1305), .A1(Add_Subt_result[20]), .B0(DmP[3]), .B1(
        n1318), .Y(n1300) );
  AO22XLTS U1085 ( .A0(n1305), .A1(Add_Subt_result[18]), .B0(DmP[5]), .B1(
        n1294), .Y(n1288) );
  AO22XLTS U1086 ( .A0(n1305), .A1(Add_Subt_result[17]), .B0(DmP[6]), .B1(
        n1519), .Y(n1282) );
  AO22XLTS U1087 ( .A0(n1305), .A1(Add_Subt_result[16]), .B0(n1294), .B1(
        DmP[7]), .Y(n1277) );
  AO22XLTS U1088 ( .A0(n1305), .A1(Add_Subt_result[15]), .B0(DmP[8]), .B1(
        n1294), .Y(n1272) );
  AO22XLTS U1089 ( .A0(n1305), .A1(Add_Subt_result[10]), .B0(DmP[13]), .B1(
        n1294), .Y(n1250) );
  AO22XLTS U1090 ( .A0(n1305), .A1(Add_Subt_result[9]), .B0(n1519), .B1(
        DmP[14]), .Y(n875) );
  AO22XLTS U1091 ( .A0(n1267), .A1(Add_Subt_result[8]), .B0(DmP[15]), .B1(
        n1519), .Y(n870) );
  AO22XLTS U1092 ( .A0(n1267), .A1(Add_Subt_result[7]), .B0(n1294), .B1(
        DmP[16]), .Y(n869) );
  AO22XLTS U1093 ( .A0(n1267), .A1(Add_Subt_result[6]), .B0(DmP[17]), .B1(
        n1519), .Y(n868) );
  INVX2TS U1094 ( .A(n1128), .Y(n690) );
  OR2X1TS U1095 ( .A(Sgf_normalized_result[2]), .B(n1070), .Y(n687) );
  NOR2BX1TS U1096 ( .AN(n1195), .B(n697), .Y(n698) );
  NOR2BX1TS U1097 ( .AN(n1178), .B(n700), .Y(n701) );
  NOR2XLTS U1098 ( .A(n1504), .B(n702), .Y(n671) );
  NOR2XLTS U1099 ( .A(n1502), .B(n702), .Y(n670) );
  INVX2TS U1100 ( .A(FSM_selector_C), .Y(n1294) );
  NOR2XLTS U1101 ( .A(n938), .B(n915), .Y(n922) );
  NAND3XLTS U1102 ( .A(FS_Module_state_reg[1]), .B(FS_Module_state_reg[2]), 
        .C(n1029), .Y(n864) );
  CLKAND2X2TS U1103 ( .A(n917), .B(n916), .Y(n928) );
  AO22XLTS U1104 ( .A0(n1305), .A1(Add_Subt_result[4]), .B0(n1519), .B1(
        DmP[19]), .Y(n801) );
  AO22XLTS U1105 ( .A0(n1267), .A1(Add_Subt_result[5]), .B0(n1519), .B1(
        DmP[18]), .Y(n871) );
  AO22XLTS U1106 ( .A0(n1305), .A1(Add_Subt_result[21]), .B0(DmP[2]), .B1(
        n1318), .Y(n1306) );
  NAND3XLTS U1107 ( .A(n1410), .B(Add_Subt_result[16]), .C(n1530), .Y(n1411)
         );
  AFHCINX2TS U1108 ( .CIN(n1145), .B(n1146), .A(n1147), .S(n1149), .CO(n1155)
         );
  MX2X1TS U1109 ( .A(DMP[1]), .B(Sgf_normalized_result[3]), .S0(n692), .Y(
        n1147) );
  XOR2XLTS U1110 ( .A(n682), .B(n686), .Y(n1146) );
  XOR2XLTS U1111 ( .A(n682), .B(n691), .Y(n1173) );
  MX2X1TS U1112 ( .A(DMP[4]), .B(Sgf_normalized_result[6]), .S0(n692), .Y(
        n1172) );
  MX2X1TS U1113 ( .A(DMP[3]), .B(Sgf_normalized_result[5]), .S0(n692), .Y(
        n1166) );
  XOR2XLTS U1114 ( .A(n682), .B(n684), .Y(n1165) );
  AFHCINX2TS U1115 ( .CIN(n1182), .B(n1183), .A(n1184), .S(n1185), .CO(n1190)
         );
  MX2X1TS U1116 ( .A(DMP[5]), .B(Sgf_normalized_result[7]), .S0(n692), .Y(
        n1184) );
  XOR2XLTS U1117 ( .A(n682), .B(n683), .Y(n1183) );
  OAI22X1TS U1118 ( .A0(n1175), .A1(n694), .B0(n1173), .B1(n1172), .Y(n1182)
         );
  MX2X1TS U1119 ( .A(DMP[8]), .B(Sgf_normalized_result[10]), .S0(n692), .Y(
        n1210) );
  NOR2XLTS U1120 ( .A(n1460), .B(n702), .Y(n679) );
  AFHCINX2TS U1121 ( .CIN(n1216), .B(n1217), .A(n1218), .S(n1219), .CO(n1224)
         );
  MX2X1TS U1122 ( .A(DMP[9]), .B(Sgf_normalized_result[11]), .S0(n692), .Y(
        n1218) );
  NOR2XLTS U1123 ( .A(n1461), .B(n702), .Y(n678) );
  MX2X1TS U1124 ( .A(DMP[12]), .B(Sgf_normalized_result[14]), .S0(n704), .Y(
        n1214) );
  MX2X1TS U1125 ( .A(DMP[14]), .B(Sgf_normalized_result[16]), .S0(n704), .Y(
        n1194) );
  AFHCINX2TS U1126 ( .CIN(n1203), .B(n1204), .A(n1205), .S(n1207), .CO(n1197)
         );
  MX2X1TS U1127 ( .A(DMP[13]), .B(Sgf_normalized_result[15]), .S0(n704), .Y(
        n1205) );
  NOR2XLTS U1128 ( .A(n1464), .B(n707), .Y(n674) );
  MX2X1TS U1129 ( .A(DMP[16]), .B(Sgf_normalized_result[18]), .S0(n704), .Y(
        n1177) );
  AFHCINX2TS U1130 ( .CIN(n1186), .B(n1187), .A(n1188), .S(n1189), .CO(n1180)
         );
  MX2X1TS U1131 ( .A(DMP[15]), .B(Sgf_normalized_result[17]), .S0(n704), .Y(
        n1188) );
  OAI22X1TS U1132 ( .A0(n1197), .A1(n698), .B0(n1195), .B1(n1194), .Y(n1186)
         );
  MX2X1TS U1133 ( .A(DMP[18]), .B(Sgf_normalized_result[20]), .S0(n704), .Y(
        n1159) );
  AFHCINX2TS U1134 ( .CIN(n1168), .B(n1169), .A(n1170), .S(n1171), .CO(n1162)
         );
  MX2X1TS U1135 ( .A(DMP[17]), .B(Sgf_normalized_result[19]), .S0(n704), .Y(
        n1170) );
  OAI22X1TS U1136 ( .A0(n1180), .A1(n701), .B0(n1178), .B1(n1177), .Y(n1168)
         );
  MX2X1TS U1137 ( .A(DMP[20]), .B(Sgf_normalized_result[22]), .S0(
        FSM_selector_D), .Y(n1140) );
  MX2X1TS U1138 ( .A(DMP[21]), .B(Sgf_normalized_result[23]), .S0(
        FSM_selector_D), .Y(n1134) );
  OAI22X1TS U1139 ( .A0(n1143), .A1(n710), .B0(n1141), .B1(n1140), .Y(n1132)
         );
  XOR2XLTS U1140 ( .A(n1038), .B(n668), .Y(n1035) );
  NAND3XLTS U1141 ( .A(n971), .B(n949), .C(n974), .Y(n1030) );
  CLKAND2X2TS U1142 ( .A(n924), .B(n923), .Y(n930) );
  MX2X1TS U1143 ( .A(Data_Y[31]), .B(intDY[31]), .S0(n1063), .Y(n87) );
  AOI2BB1XLTS U1144 ( .A0N(n866), .A1N(n865), .B0(n1023), .Y(n214) );
  MX2X1TS U1145 ( .A(add_subt), .B(intAS), .S0(n1063), .Y(n181) );
  AO22XLTS U1146 ( .A0(n1405), .A1(final_result_ieee[0]), .B0(
        Sgf_normalized_result[2]), .B1(n1006), .Y(n1510) );
  AO22XLTS U1147 ( .A0(n826), .A1(final_result_ieee[1]), .B0(
        Sgf_normalized_result[3]), .B1(n1006), .Y(n1511) );
  AO22XLTS U1148 ( .A0(n826), .A1(final_result_ieee[2]), .B0(
        Sgf_normalized_result[4]), .B1(n1006), .Y(n1512) );
  AO22XLTS U1149 ( .A0(n826), .A1(final_result_ieee[3]), .B0(
        Sgf_normalized_result[5]), .B1(n1006), .Y(n1513) );
  AO22XLTS U1150 ( .A0(n826), .A1(final_result_ieee[4]), .B0(
        Sgf_normalized_result[6]), .B1(n1006), .Y(n1514) );
  AO22XLTS U1151 ( .A0(n826), .A1(final_result_ieee[5]), .B0(
        Sgf_normalized_result[7]), .B1(n1006), .Y(n1515) );
  AO22XLTS U1152 ( .A0(n826), .A1(final_result_ieee[6]), .B0(
        Sgf_normalized_result[8]), .B1(n1006), .Y(n1516) );
  AO22XLTS U1153 ( .A0(n826), .A1(final_result_ieee[7]), .B0(
        Sgf_normalized_result[9]), .B1(n1006), .Y(n1517) );
  MX2X1TS U1154 ( .A(Data_X[31]), .B(intDX[31]), .S0(n1063), .Y(n182) );
  OAI211XLTS U1155 ( .A0(n953), .A1(n978), .B0(n952), .C0(n951), .Y(n242) );
  OR2X1TS U1156 ( .A(n1020), .B(n1127), .Y(n245) );
  OAI211XLTS U1157 ( .A0(n930), .A1(n1371), .B0(n925), .C0(n1368), .Y(n12) );
  OAI211XLTS U1158 ( .A0(n928), .A1(n1371), .B0(n920), .C0(n1368), .Y(n14) );
  OAI21XLTS U1159 ( .A0(n928), .A1(n1373), .B0(n927), .Y(n15) );
  NAND3XLTS U1160 ( .A(n1354), .B(n1353), .C(n1368), .Y(n17) );
  NAND3XLTS U1161 ( .A(n1069), .B(n1068), .C(n1067), .Y(n19) );
  AOI2BB2XLTS U1162 ( .B0(n659), .B1(Sgf_normalized_result[2]), .A0N(n1373), 
        .A1N(n1352), .Y(n1069) );
  NAND3XLTS U1163 ( .A(n1358), .B(n1357), .C(n1368), .Y(n21) );
  NAND3XLTS U1164 ( .A(n1062), .B(n1061), .C(n1067), .Y(n23) );
  AOI2BB2XLTS U1165 ( .B0(n661), .B1(Sgf_normalized_result[3]), .A0N(n655), 
        .A1N(n1355), .Y(n1062) );
  NAND3XLTS U1166 ( .A(n1362), .B(n1361), .C(n1368), .Y(n25) );
  NAND3XLTS U1167 ( .A(n1060), .B(n1059), .C(n1067), .Y(n27) );
  AOI2BB2XLTS U1168 ( .B0(n660), .B1(Sgf_normalized_result[4]), .A0N(n655), 
        .A1N(n1360), .Y(n1060) );
  NAND3XLTS U1169 ( .A(n1365), .B(n1364), .C(n1368), .Y(n29) );
  NAND3XLTS U1170 ( .A(n1058), .B(n1057), .C(n1067), .Y(n31) );
  AOI2BB2XLTS U1171 ( .B0(n659), .B1(Sgf_normalized_result[5]), .A0N(n1373), 
        .A1N(n1363), .Y(n1058) );
  NAND3XLTS U1172 ( .A(n1370), .B(n1369), .C(n1368), .Y(n33) );
  NAND3XLTS U1173 ( .A(n1056), .B(n1055), .C(n1067), .Y(n35) );
  AOI2BB2XLTS U1174 ( .B0(n661), .B1(Sgf_normalized_result[6]), .A0N(n1373), 
        .A1N(n1367), .Y(n1056) );
  OAI211XLTS U1175 ( .A0(n1371), .A1(n1051), .B0(n956), .C0(n955), .Y(n37) );
  NAND3XLTS U1176 ( .A(n1054), .B(n1053), .C(n1067), .Y(n39) );
  AOI2BB2XLTS U1177 ( .B0(n660), .B1(Sgf_normalized_result[7]), .A0N(n655), 
        .A1N(n1051), .Y(n1054) );
  OAI211XLTS U1178 ( .A0(n1048), .A1(n1373), .B0(n946), .C0(n945), .Y(n41) );
  AO21XLTS U1179 ( .A0(n1050), .A1(n654), .B0(n1049), .Y(n43) );
  OAI211XLTS U1180 ( .A0(n1048), .A1(n1371), .B0(n1047), .C0(n1046), .Y(n1049)
         );
  OAI211XLTS U1181 ( .A0(n1043), .A1(n1373), .B0(n943), .C0(n942), .Y(n45) );
  AO21XLTS U1182 ( .A0(n1045), .A1(n654), .B0(n1044), .Y(n47) );
  NAND4XLTS U1183 ( .A(n1378), .B(n1377), .C(n1400), .D(n1376), .Y(n49) );
  NAND4XLTS U1184 ( .A(n1383), .B(n1382), .C(n1400), .D(n1381), .Y(n51) );
  NAND4XLTS U1185 ( .A(n1386), .B(n1385), .C(n1400), .D(n1384), .Y(n53) );
  NAND4XLTS U1186 ( .A(n1389), .B(n1388), .C(n1400), .D(n1387), .Y(n55) );
  NAND4XLTS U1187 ( .A(n1392), .B(n1391), .C(n1400), .D(n1390), .Y(n57) );
  NAND4XLTS U1188 ( .A(n1402), .B(n1401), .C(n1400), .D(n1399), .Y(n59) );
  OAI21XLTS U1189 ( .A0(n803), .A1(n1236), .B0(n802), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[21]) );
  OAI211XLTS U1190 ( .A0(n939), .A1(n1240), .B0(n1238), .C0(n934), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[23]) );
  OAI21XLTS U1191 ( .A0(n1247), .A1(n1236), .B0(n1238), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[24]) );
  OAI211XLTS U1192 ( .A0(n965), .A1(n1245), .B0(n959), .C0(n958), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[19]) );
  OAI211XLTS U1193 ( .A0(n965), .A1(n931), .B0(n874), .C0(n873), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[17]) );
  OAI211XLTS U1194 ( .A0(n965), .A1(n1243), .B0(n964), .C0(n963), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[18]) );
  MXI2XLTS U1195 ( .A(n1459), .B(add_overflow_flag), .S0(n1071), .Y(n71) );
  MX2X1TS U1196 ( .A(n1085), .B(LZA_output[4]), .S0(n1418), .Y(n72) );
  NAND4XLTS U1197 ( .A(n1115), .B(n1095), .C(n1084), .D(n1083), .Y(n1085) );
  OAI211XLTS U1198 ( .A0(Add_Subt_result[25]), .A1(n1413), .B0(n1412), .C0(
        n1411), .Y(n1414) );
  MXI2XLTS U1199 ( .A(n1121), .B(n1467), .S0(n1418), .Y(n74) );
  OAI21XLTS U1200 ( .A0(n1416), .A1(n1105), .B0(n1420), .Y(n1106) );
  OAI211XLTS U1201 ( .A0(n1104), .A1(n1103), .B0(n1102), .C0(n1101), .Y(n1105)
         );
  AO21XLTS U1202 ( .A0(LZA_output[3]), .A1(n1418), .B0(n1092), .Y(n76) );
  AOI211XLTS U1203 ( .A0(n1089), .A1(n1088), .B0(n1087), .C0(n1409), .Y(n1090)
         );
  MX2X1TS U1204 ( .A(exp_oper_result[7]), .B(Exp_Operation_Module_Data_S[7]), 
        .S0(n1232), .Y(n78) );
  MX2X1TS U1205 ( .A(Exp_Operation_Module_Data_S[0]), .B(exp_oper_result[0]), 
        .S0(n1122), .Y(n79) );
  MX2X1TS U1206 ( .A(Exp_Operation_Module_Data_S[1]), .B(exp_oper_result[1]), 
        .S0(n1122), .Y(n80) );
  MX2X1TS U1207 ( .A(Exp_Operation_Module_Data_S[2]), .B(exp_oper_result[2]), 
        .S0(n1122), .Y(n81) );
  MX2X1TS U1208 ( .A(exp_oper_result[3]), .B(Exp_Operation_Module_Data_S[3]), 
        .S0(n1232), .Y(n82) );
  MX2X1TS U1209 ( .A(exp_oper_result[4]), .B(Exp_Operation_Module_Data_S[4]), 
        .S0(n1232), .Y(n83) );
  MX2X1TS U1210 ( .A(exp_oper_result[5]), .B(Exp_Operation_Module_Data_S[5]), 
        .S0(n1232), .Y(n84) );
  MX2X1TS U1211 ( .A(exp_oper_result[6]), .B(Exp_Operation_Module_Data_S[6]), 
        .S0(n1232), .Y(n85) );
  AOI2BB2XLTS U1212 ( .B0(intDX[31]), .B1(n974), .A0N(n971), .A1N(n970), .Y(
        n972) );
  AO22XLTS U1213 ( .A0(n1432), .A1(Data_Y[0]), .B0(n1427), .B1(intDY[0]), .Y(
        n90) );
  AO22XLTS U1214 ( .A0(n1428), .A1(Data_Y[1]), .B0(n1423), .B1(intDY[1]), .Y(
        n93) );
  AO22XLTS U1215 ( .A0(n1428), .A1(Data_Y[2]), .B0(n1423), .B1(intDY[2]), .Y(
        n96) );
  AO22XLTS U1216 ( .A0(n1428), .A1(Data_Y[3]), .B0(n1424), .B1(intDY[3]), .Y(
        n99) );
  AO22XLTS U1217 ( .A0(n1428), .A1(Data_Y[4]), .B0(n1424), .B1(intDY[4]), .Y(
        n102) );
  AO22XLTS U1218 ( .A0(n1428), .A1(Data_Y[5]), .B0(n1424), .B1(intDY[5]), .Y(
        n105) );
  AO22XLTS U1219 ( .A0(n1425), .A1(Data_Y[6]), .B0(n1424), .B1(intDY[6]), .Y(
        n108) );
  AO22XLTS U1220 ( .A0(n1425), .A1(Data_Y[7]), .B0(n1424), .B1(intDY[7]), .Y(
        n111) );
  AO22XLTS U1221 ( .A0(n1425), .A1(Data_Y[8]), .B0(n1424), .B1(intDY[8]), .Y(
        n114) );
  AO22XLTS U1222 ( .A0(n1425), .A1(Data_Y[9]), .B0(n1424), .B1(intDY[9]), .Y(
        n117) );
  AO22XLTS U1223 ( .A0(n1425), .A1(Data_Y[10]), .B0(n1424), .B1(intDY[10]), 
        .Y(n120) );
  AO22XLTS U1224 ( .A0(n1425), .A1(Data_Y[11]), .B0(n1424), .B1(intDY[11]), 
        .Y(n123) );
  AO22XLTS U1225 ( .A0(n1425), .A1(Data_Y[12]), .B0(n1424), .B1(intDY[12]), 
        .Y(n126) );
  AO22XLTS U1226 ( .A0(n1425), .A1(Data_Y[13]), .B0(n1423), .B1(intDY[13]), 
        .Y(n129) );
  AO22XLTS U1227 ( .A0(n1425), .A1(Data_Y[14]), .B0(n1423), .B1(intDY[14]), 
        .Y(n132) );
  AO22XLTS U1228 ( .A0(n1425), .A1(Data_Y[15]), .B0(n1423), .B1(intDY[15]), 
        .Y(n135) );
  AO22XLTS U1229 ( .A0(n1426), .A1(Data_Y[16]), .B0(n1423), .B1(intDY[16]), 
        .Y(n138) );
  OAI21XLTS U1230 ( .A0(n1494), .A1(n969), .B0(n968), .Y(n139) );
  AO22XLTS U1231 ( .A0(n1426), .A1(Data_Y[18]), .B0(n1423), .B1(intDY[18]), 
        .Y(n144) );
  AO22XLTS U1232 ( .A0(n1426), .A1(Data_Y[19]), .B0(n1423), .B1(intDY[19]), 
        .Y(n147) );
  AO22XLTS U1233 ( .A0(n1426), .A1(Data_Y[20]), .B0(n1423), .B1(intDY[20]), 
        .Y(n150) );
  AO22XLTS U1234 ( .A0(n1426), .A1(Data_Y[21]), .B0(n1423), .B1(intDY[21]), 
        .Y(n153) );
  AO22XLTS U1235 ( .A0(n1426), .A1(Data_Y[22]), .B0(n1422), .B1(intDY[22]), 
        .Y(n156) );
  AO22XLTS U1236 ( .A0(n1426), .A1(Data_Y[23]), .B0(n1427), .B1(intDY[23]), 
        .Y(n159) );
  AO22XLTS U1237 ( .A0(n1426), .A1(Data_Y[25]), .B0(n1427), .B1(intDY[25]), 
        .Y(n165) );
  AO22XLTS U1238 ( .A0(n1426), .A1(Data_Y[26]), .B0(n1427), .B1(intDY[26]), 
        .Y(n168) );
  AO22XLTS U1239 ( .A0(n1426), .A1(Data_Y[27]), .B0(n1427), .B1(intDY[27]), 
        .Y(n171) );
  AO22XLTS U1240 ( .A0(n1432), .A1(Data_Y[28]), .B0(n1427), .B1(intDY[28]), 
        .Y(n174) );
  AO22XLTS U1241 ( .A0(n1432), .A1(Data_Y[29]), .B0(n1427), .B1(intDY[29]), 
        .Y(n177) );
  AO22XLTS U1242 ( .A0(n1432), .A1(Data_Y[30]), .B0(n1427), .B1(intDY[30]), 
        .Y(n180) );
  MX2X1TS U1243 ( .A(Data_X[0]), .B(intDX[0]), .S0(n1063), .Y(n183) );
  MX2X1TS U1244 ( .A(Data_X[1]), .B(intDX[1]), .S0(n1063), .Y(n184) );
  MX2X1TS U1245 ( .A(Data_X[2]), .B(intDX[2]), .S0(n1063), .Y(n185) );
  MX2X1TS U1246 ( .A(Data_X[3]), .B(intDX[3]), .S0(n1427), .Y(n186) );
  MX2X1TS U1247 ( .A(Data_X[4]), .B(intDX[4]), .S0(n1063), .Y(n187) );
  MX2X1TS U1248 ( .A(Data_X[5]), .B(intDX[5]), .S0(n1063), .Y(n188) );
  MX2X1TS U1249 ( .A(Data_X[6]), .B(intDX[6]), .S0(n1427), .Y(n189) );
  AO22XLTS U1250 ( .A0(n1432), .A1(Data_X[24]), .B0(n1422), .B1(intDX[24]), 
        .Y(n207) );
  MX2X1TS U1251 ( .A(Add_Subt_result[0]), .B(n1040), .S0(n1148), .Y(n216) );
  MX2X1TS U1252 ( .A(Add_Subt_result[1]), .B(n1131), .S0(n1148), .Y(n217) );
  XOR2XLTS U1253 ( .A(n1130), .B(n1129), .Y(n1131) );
  XOR2XLTS U1254 ( .A(n1128), .B(n666), .Y(n1129) );
  MX2X1TS U1255 ( .A(Add_Subt_result[2]), .B(n1139), .S0(n1148), .Y(n218) );
  MX2X1TS U1256 ( .A(Add_Subt_result[3]), .B(n1149), .S0(n1148), .Y(n219) );
  MX2X1TS U1257 ( .A(Add_Subt_result[4]), .B(n1158), .S0(n1206), .Y(n220) );
  MX2X1TS U1258 ( .A(Add_Subt_result[5]), .B(n1167), .S0(n1206), .Y(n221) );
  MX2X1TS U1259 ( .A(Add_Subt_result[6]), .B(n1176), .S0(n1206), .Y(n222) );
  MX2X1TS U1260 ( .A(Add_Subt_result[7]), .B(n1185), .S0(n1206), .Y(n223) );
  MX2X1TS U1261 ( .A(Add_Subt_result[8]), .B(n1193), .S0(n1227), .Y(n224) );
  MX2X1TS U1262 ( .A(Add_Subt_result[9]), .B(n1202), .S0(n1227), .Y(n225) );
  MX2X1TS U1263 ( .A(Add_Subt_result[10]), .B(n1211), .S0(n1227), .Y(n226) );
  MX2X1TS U1264 ( .A(Add_Subt_result[11]), .B(n1219), .S0(n1227), .Y(n227) );
  MX2X1TS U1265 ( .A(Add_Subt_result[12]), .B(n1228), .S0(n1227), .Y(n228) );
  MX2X1TS U1266 ( .A(Add_Subt_result[13]), .B(n1223), .S0(n1227), .Y(n229) );
  MX2X1TS U1267 ( .A(Add_Subt_result[14]), .B(n1215), .S0(n1227), .Y(n230) );
  MX2X1TS U1268 ( .A(Add_Subt_result[15]), .B(n1207), .S0(n1206), .Y(n231) );
  MX2X1TS U1269 ( .A(Add_Subt_result[16]), .B(n1198), .S0(n1227), .Y(n232) );
  MX2X1TS U1270 ( .A(Add_Subt_result[17]), .B(n1189), .S0(n1206), .Y(n233) );
  MX2X1TS U1271 ( .A(Add_Subt_result[18]), .B(n1181), .S0(n1206), .Y(n234) );
  MX2X1TS U1272 ( .A(Add_Subt_result[19]), .B(n1171), .S0(n1206), .Y(n235) );
  MX2X1TS U1273 ( .A(Add_Subt_result[20]), .B(n1163), .S0(n1206), .Y(n236) );
  MX2X1TS U1274 ( .A(Add_Subt_result[21]), .B(n1154), .S0(n1206), .Y(n237) );
  MX2X1TS U1275 ( .A(Add_Subt_result[22]), .B(n1144), .S0(n1148), .Y(n238) );
  MX2X1TS U1276 ( .A(Add_Subt_result[23]), .B(n1135), .S0(n1148), .Y(n239) );
  MX2X1TS U1277 ( .A(Add_Subt_result[24]), .B(n1126), .S0(n1148), .Y(n240) );
  MX2X1TS U1278 ( .A(add_overflow_flag), .B(n712), .S0(n1148), .Y(n667) );
  XOR2XLTS U1279 ( .A(n711), .B(n682), .Y(n712) );
  NAND4XLTS U1280 ( .A(n1032), .B(n1122), .C(n1031), .D(n1030), .Y(n246) );
  NAND3XLTS U1281 ( .A(n1063), .B(n1022), .C(n1021), .Y(n247) );
  OAI21XLTS U1282 ( .A0(n930), .A1(n1373), .B0(n929), .Y(n248) );
  OAI21XLTS U1283 ( .A0(n1245), .A1(n1236), .B0(n935), .Y(n936) );
  INVX2TS U1284 ( .A(n1371), .Y(n652) );
  INVX2TS U1285 ( .A(n652), .Y(n653) );
  INVX2TS U1286 ( .A(n1373), .Y(n654) );
  INVX2TS U1287 ( .A(n654), .Y(n655) );
  INVX2TS U1288 ( .A(n931), .Y(n657) );
  INVX2TS U1289 ( .A(n1372), .Y(n658) );
  CLKBUFX2TS U1290 ( .A(n1374), .Y(n1395) );
  INVX2TS U1291 ( .A(n1395), .Y(n659) );
  INVX2TS U1292 ( .A(n1395), .Y(n660) );
  INVX2TS U1293 ( .A(n1395), .Y(n661) );
  INVX2TS U1294 ( .A(n1245), .Y(n662) );
  INVX2TS U1295 ( .A(n1245), .Y(n663) );
  INVX2TS U1296 ( .A(n1014), .Y(n664) );
  INVX2TS U1297 ( .A(n1014), .Y(n665) );
  NOR2BX2TS U1298 ( .AN(n949), .B(n1127), .Y(n682) );
  OAI21XLTS U1299 ( .A0(intDX[1]), .A1(n1470), .B0(intDX[0]), .Y(n726) );
  OAI21XLTS U1300 ( .A0(intDX[15]), .A1(n1439), .B0(intDX[14]), .Y(n745) );
  INVX2TS U1301 ( .A(n1172), .Y(n693) );
  NOR2XLTS U1302 ( .A(n1524), .B(n702), .Y(n669) );
  OAI31X1TS U1303 ( .A0(Add_Subt_result[12]), .A1(n1526), .A2(n1116), .B0(
        n1115), .Y(n1117) );
  AOI211XLTS U1304 ( .A0(n1029), .A1(n1024), .B0(n1028), .C0(n950), .Y(n863)
         );
  NOR4BXLTS U1305 ( .AN(n1030), .B(n1366), .C(n1227), .D(n950), .Y(n952) );
  AOI211XLTS U1306 ( .A0(r_mode[0]), .A1(r_mode[1]), .B0(n948), .C0(n947), .Y(
        n953) );
  OAI211XLTS U1307 ( .A0(n1043), .A1(n1371), .B0(n1042), .C0(n1041), .Y(n1044)
         );
  AFHCINX2TS U1308 ( .CIN(n1164), .B(n1165), .A(n1166), .S(n1167), .CO(n1175)
         );
  INVX2TS U1309 ( .A(rst), .Y(n822) );
  OAI211XLTS U1310 ( .A0(n1240), .A1(n965), .B0(n877), .C0(n876), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[16]) );
  XNOR2X1TS U1311 ( .A(intDY[31]), .B(intAS), .Y(n973) );
  XOR2X1TS U1312 ( .A(n973), .B(n1454), .Y(n949) );
  CLKBUFX2TS U1313 ( .A(FSM_selector_D), .Y(n1127) );
  BUFX3TS U1314 ( .A(n682), .Y(n1038) );
  NOR2BX1TS U1315 ( .AN(Sgf_normalized_result[25]), .B(n1127), .Y(n668) );
  CLKBUFX2TS U1316 ( .A(FSM_selector_D), .Y(n707) );
  CLKBUFX2TS U1317 ( .A(FSM_selector_D), .Y(n702) );
  XOR2X1TS U1318 ( .A(n1038), .B(n669), .Y(n1125) );
  CLKBUFX2TS U1319 ( .A(FSM_selector_D), .Y(n1070) );
  CLKBUFX2TS U1320 ( .A(FSM_selector_D), .Y(n704) );
  CLKBUFX2TS U1321 ( .A(n682), .Y(n696) );
  XOR2X1TS U1322 ( .A(n696), .B(n675), .Y(n1213) );
  XOR2X1TS U1323 ( .A(n696), .B(n676), .Y(n1221) );
  XOR2X1TS U1324 ( .A(n696), .B(n677), .Y(n1225) );
  CLKBUFX2TS U1325 ( .A(FSM_selector_D), .Y(n692) );
  XOR2X1TS U1326 ( .A(n696), .B(n679), .Y(n1209) );
  NOR2BX1TS U1327 ( .AN(Sgf_normalized_result[9]), .B(n1127), .Y(n680) );
  NOR2BX1TS U1328 ( .AN(Sgf_normalized_result[8]), .B(n1127), .Y(n681) );
  XOR2X1TS U1329 ( .A(n696), .B(n681), .Y(n1191) );
  NOR2BX1TS U1330 ( .AN(Sgf_normalized_result[7]), .B(n1127), .Y(n683) );
  NOR2BX1TS U1331 ( .AN(Sgf_normalized_result[5]), .B(n707), .Y(n684) );
  NOR2BX1TS U1332 ( .AN(Sgf_normalized_result[4]), .B(n707), .Y(n685) );
  XOR2X1TS U1333 ( .A(n682), .B(n685), .Y(n1156) );
  NOR2BX1TS U1334 ( .AN(Sgf_normalized_result[3]), .B(n1127), .Y(n686) );
  XOR2X1TS U1335 ( .A(n682), .B(n687), .Y(n1137) );
  NOR2BX1TS U1336 ( .AN(Sgf_normalized_result[0]), .B(n707), .Y(n688) );
  XOR2X4TS U1337 ( .A(n1038), .B(n688), .Y(n1037) );
  NOR2BX1TS U1338 ( .AN(Sgf_normalized_result[1]), .B(n707), .Y(n689) );
  NOR2BX1TS U1339 ( .AN(Sgf_normalized_result[6]), .B(n1127), .Y(n691) );
  XOR2X1TS U1340 ( .A(n1038), .B(n703), .Y(n1160) );
  INVX2TS U1341 ( .A(n1153), .Y(n1148) );
  NOR2XLTS U1342 ( .A(intDY[24]), .B(n772), .Y(n713) );
  AOI22X1TS U1343 ( .A0(intDX[24]), .A1(n713), .B0(intDX[25]), .B1(n1499), .Y(
        n717) );
  NOR3XLTS U1344 ( .A(n1501), .B(intDY[28]), .C(n718), .Y(n719) );
  AOI221XLTS U1345 ( .A0(intDX[30]), .A1(n1449), .B0(intDX[29]), .B1(n1498), 
        .C0(n719), .Y(n721) );
  OA22X1TS U1346 ( .A0(n1472), .A1(intDX[14]), .B0(n1439), .B1(intDX[15]), .Y(
        n749) );
  OAI2BB1X1TS U1347 ( .A0N(n1448), .A1N(intDY[5]), .B0(intDX[4]), .Y(n724) );
  OAI22X1TS U1348 ( .A0(intDY[4]), .A1(n724), .B0(n1448), .B1(intDY[5]), .Y(
        n735) );
  OAI2BB1X1TS U1349 ( .A0N(n1447), .A1N(intDY[7]), .B0(intDX[6]), .Y(n725) );
  OAI22X1TS U1350 ( .A0(intDY[6]), .A1(n725), .B0(n1447), .B1(intDY[7]), .Y(
        n734) );
  OAI2BB2XLTS U1351 ( .B0(intDY[0]), .B1(n726), .A0N(intDX[1]), .A1N(n1470), 
        .Y(n728) );
  AOI222XLTS U1352 ( .A0(intDY[4]), .A1(n1508), .B0(n731), .B1(n730), .C0(
        intDY[5]), .C1(n1448), .Y(n733) );
  AOI22X1TS U1353 ( .A0(intDY[7]), .A1(n1447), .B0(intDY[6]), .B1(n1507), .Y(
        n732) );
  OAI32X1TS U1354 ( .A0(n735), .A1(n734), .A2(n733), .B0(n732), .B1(n734), .Y(
        n752) );
  AOI21X1TS U1355 ( .A0(intDY[10]), .A1(n1506), .B0(n737), .Y(n742) );
  OAI2BB2XLTS U1356 ( .B0(intDY[12]), .B1(n736), .A0N(intDX[13]), .A1N(n1469), 
        .Y(n748) );
  AOI22X1TS U1357 ( .A0(intDX[10]), .A1(n738), .B0(intDX[11]), .B1(n1475), .Y(
        n744) );
  AOI21X1TS U1358 ( .A0(n741), .A1(n740), .B0(n753), .Y(n743) );
  OAI2BB2XLTS U1359 ( .B0(n744), .B1(n753), .A0N(n743), .A1N(n742), .Y(n747)
         );
  OAI2BB2XLTS U1360 ( .B0(intDY[14]), .B1(n745), .A0N(intDX[15]), .A1N(n1439), 
        .Y(n746) );
  OAI31X1TS U1361 ( .A0(n753), .A1(n752), .A2(n751), .B0(n750), .Y(n756) );
  OA22X1TS U1362 ( .A0(n1473), .A1(intDX[22]), .B0(n1438), .B1(intDX[23]), .Y(
        n769) );
  AOI211XLTS U1363 ( .A0(intDY[16]), .A1(n1509), .B0(n763), .C0(n764), .Y(n755) );
  OAI21XLTS U1364 ( .A0(intDX[21]), .A1(n1495), .B0(intDX[20]), .Y(n757) );
  OAI2BB2XLTS U1365 ( .B0(intDY[20]), .B1(n757), .A0N(intDX[21]), .A1N(n1495), 
        .Y(n768) );
  NOR2XLTS U1366 ( .A(intDY[16]), .B(n758), .Y(n759) );
  AOI22X1TS U1367 ( .A0(intDX[16]), .A1(n759), .B0(intDX[17]), .B1(n1518), .Y(
        n762) );
  AOI32X1TS U1368 ( .A0(n760), .A1(n1450), .A2(intDX[18]), .B0(intDX[19]), 
        .B1(n1500), .Y(n761) );
  OAI32X1TS U1369 ( .A0(n764), .A1(n763), .A2(n762), .B0(n761), .B1(n763), .Y(
        n767) );
  OAI21XLTS U1370 ( .A0(intDX[23]), .A1(n1438), .B0(intDX[22]), .Y(n765) );
  OAI2BB2XLTS U1371 ( .B0(intDY[22]), .B1(n765), .A0N(intDX[23]), .A1N(n1438), 
        .Y(n766) );
  NAND4BBX1TS U1372 ( .AN(n773), .BN(n772), .C(n771), .D(n770), .Y(n774) );
  AOI32X1TS U1373 ( .A0(n777), .A1(n776), .A2(n775), .B0(n774), .B1(n777), .Y(
        n778) );
  NOR2BX1TS U1374 ( .AN(n1024), .B(FS_Module_state_reg[3]), .Y(n979) );
  INVX2TS U1375 ( .A(n974), .Y(n993) );
  CLKBUFX2TS U1376 ( .A(n1000), .Y(n970) );
  CLKBUFX2TS U1377 ( .A(n970), .Y(n992) );
  INVX2TS U1378 ( .A(n974), .Y(n906) );
  INVX2TS U1379 ( .A(n974), .Y(n1003) );
  NOR2BX1TS U1380 ( .AN(n778), .B(n1003), .Y(n989) );
  AOI22X1TS U1381 ( .A0(DmP[3]), .A1(n906), .B0(intDY[3]), .B1(n989), .Y(n779)
         );
  OAI21XLTS U1382 ( .A0(n1490), .A1(n992), .B0(n779), .Y(n98) );
  AOI22X1TS U1383 ( .A0(DmP[2]), .A1(n906), .B0(intDY[2]), .B1(n989), .Y(n780)
         );
  OAI21XLTS U1384 ( .A0(n1492), .A1(n992), .B0(n780), .Y(n95) );
  CLKBUFX2TS U1385 ( .A(n1000), .Y(n996) );
  INVX2TS U1386 ( .A(n974), .Y(n990) );
  CLKBUFX2TS U1387 ( .A(n989), .Y(n890) );
  AOI22X1TS U1388 ( .A0(DmP[0]), .A1(n990), .B0(intDY[0]), .B1(n890), .Y(n781)
         );
  OAI21XLTS U1389 ( .A0(n1493), .A1(n996), .B0(n781), .Y(n89) );
  AOI22X1TS U1390 ( .A0(LZA_output[1]), .A1(n1012), .B0(n665), .B1(
        exp_oper_result[1]), .Y(n795) );
  NOR2BX1TS U1391 ( .AN(n824), .B(FS_Module_state_reg[3]), .Y(n782) );
  CLKBUFX2TS U1392 ( .A(n1294), .Y(n1318) );
  NAND2X1TS U1393 ( .A(n1029), .B(n824), .Y(n918) );
  AOI22X1TS U1394 ( .A0(n783), .A1(FSM_selector_C), .B0(n1024), .B1(n862), .Y(
        n984) );
  AOI21X1TS U1395 ( .A0(n784), .A1(n984), .B0(n1520), .Y(n935) );
  OAI22X1TS U1396 ( .A0(n1015), .A1(n1531), .B0(FSM_selector_B[0]), .B1(n1437), 
        .Y(n1017) );
  AOI21X1TS U1397 ( .A0(exp_oper_result[0]), .A1(n1459), .B0(n1017), .Y(n799)
         );
  NOR2X1TS U1398 ( .A(n799), .B(n800), .Y(n1327) );
  INVX2TS U1399 ( .A(n1327), .Y(n1243) );
  INVX2TS U1400 ( .A(n1243), .Y(n1290) );
  OR3X1TS U1401 ( .A(FS_Module_state_reg[3]), .B(n785), .C(add_overflow_flag), 
        .Y(n919) );
  INVX2TS U1402 ( .A(n919), .Y(n1340) );
  NOR2X1TS U1403 ( .A(n1340), .B(n1318), .Y(n1283) );
  CLKBUFX2TS U1404 ( .A(n1283), .Y(n1341) );
  AOI22X1TS U1405 ( .A0(n1341), .A1(n1523), .B0(n1340), .B1(n1452), .Y(n1235)
         );
  NAND2X1TS U1406 ( .A(n1340), .B(Add_Subt_result[1]), .Y(n787) );
  NAND2X1TS U1407 ( .A(n1318), .B(DmP[22]), .Y(n786) );
  NAND2X1TS U1408 ( .A(n787), .B(n786), .Y(n788) );
  AOI21X1TS U1409 ( .A0(n1341), .A1(Add_Subt_result[24]), .B0(n788), .Y(n872)
         );
  INVX2TS U1410 ( .A(n872), .Y(n1234) );
  NAND2X1TS U1411 ( .A(n799), .B(n795), .Y(n1245) );
  INVX2TS U1412 ( .A(n1245), .Y(n1347) );
  AOI222XLTS U1413 ( .A0(n800), .A1(n935), .B0(n1290), .B1(n1235), .C0(n1234), 
        .C1(n1347), .Y(n1247) );
  CLKBUFX2TS U1414 ( .A(n1236), .Y(n1311) );
  NAND2X1TS U1415 ( .A(n1311), .B(n935), .Y(n1238) );
  AOI22X1TS U1416 ( .A0(DmP[4]), .A1(n990), .B0(intDY[4]), .B1(n890), .Y(n789)
         );
  OAI21XLTS U1417 ( .A0(n1508), .A1(n992), .B0(n789), .Y(n101) );
  CLKBUFX2TS U1418 ( .A(n989), .Y(n994) );
  INVX2TS U1419 ( .A(n994), .Y(n1005) );
  INVX2TS U1420 ( .A(n996), .Y(n1002) );
  AOI22X1TS U1421 ( .A0(n1003), .A1(DMP[2]), .B0(intDY[2]), .B1(n1002), .Y(
        n790) );
  OAI21XLTS U1422 ( .A0(n1005), .A1(n1492), .B0(n790), .Y(n94) );
  AOI22X1TS U1423 ( .A0(n1003), .A1(DMP[0]), .B0(intDY[0]), .B1(n1002), .Y(
        n791) );
  OAI21XLTS U1424 ( .A0(n1005), .A1(n1493), .B0(n791), .Y(n88) );
  AOI22X1TS U1425 ( .A0(n1003), .A1(DMP[3]), .B0(intDY[3]), .B1(n1002), .Y(
        n792) );
  OAI21XLTS U1426 ( .A0(n1005), .A1(n1490), .B0(n792), .Y(n97) );
  AOI22X1TS U1427 ( .A0(DmP[6]), .A1(n990), .B0(intDY[6]), .B1(n989), .Y(n793)
         );
  OAI21XLTS U1428 ( .A0(n1507), .A1(n992), .B0(n793), .Y(n107) );
  AOI22X1TS U1429 ( .A0(n1340), .A1(Add_Subt_result[3]), .B0(DmP[20]), .B1(
        n1318), .Y(n794) );
  OAI2BB1X1TS U1430 ( .A0N(Add_Subt_result[22]), .A1N(n1283), .B0(n794), .Y(
        n1242) );
  CLKBUFX2TS U1431 ( .A(n1283), .Y(n1319) );
  NAND2X1TS U1432 ( .A(n1340), .B(Add_Subt_result[2]), .Y(n797) );
  NAND2X1TS U1433 ( .A(n1318), .B(DmP[21]), .Y(n796) );
  NAND2X1TS U1434 ( .A(n797), .B(n796), .Y(n798) );
  AOI21X1TS U1435 ( .A0(n1319), .A1(Add_Subt_result[23]), .B0(n798), .Y(n932)
         );
  INVX2TS U1436 ( .A(n932), .Y(n1241) );
  NAND2X1TS U1437 ( .A(n800), .B(n799), .Y(n931) );
  INVX2TS U1438 ( .A(n931), .Y(n1339) );
  AOI222XLTS U1439 ( .A0(n1242), .A1(n1290), .B0(n1234), .B1(n961), .C0(n1241), 
        .C1(n656), .Y(n803) );
  INVX2TS U1440 ( .A(n1311), .Y(n1345) );
  AOI21X1TS U1441 ( .A0(n1283), .A1(Add_Subt_result[21]), .B0(n801), .Y(n1244)
         );
  INVX2TS U1442 ( .A(n1235), .Y(n937) );
  CLKBUFX2TS U1443 ( .A(n1311), .Y(n1342) );
  AOI22X1TS U1444 ( .A0(n1345), .A1(n1244), .B0(n937), .B1(n1342), .Y(n962) );
  AOI22X1TS U1445 ( .A0(n663), .A1(n962), .B0(n957), .B1(n1245), .Y(n802) );
  AOI22X1TS U1446 ( .A0(DmP[8]), .A1(n990), .B0(intDY[8]), .B1(n989), .Y(n804)
         );
  OAI21XLTS U1447 ( .A0(n1482), .A1(n992), .B0(n804), .Y(n113) );
  INVX2TS U1448 ( .A(n974), .Y(n966) );
  AOI22X1TS U1449 ( .A0(intDY[30]), .A1(n890), .B0(DmP[30]), .B1(n966), .Y(
        n805) );
  OAI21XLTS U1450 ( .A0(n1440), .A1(n996), .B0(n805), .Y(n179) );
  AOI22X1TS U1451 ( .A0(intDY[29]), .A1(n890), .B0(DmP[29]), .B1(n993), .Y(
        n806) );
  OAI21XLTS U1452 ( .A0(n1441), .A1(n996), .B0(n806), .Y(n176) );
  AOI22X1TS U1453 ( .A0(DmP[1]), .A1(n990), .B0(intDY[1]), .B1(n890), .Y(n807)
         );
  OAI21XLTS U1454 ( .A0(n1491), .A1(n1000), .B0(n807), .Y(n92) );
  INVX2TS U1455 ( .A(n970), .Y(n913) );
  AOI22X1TS U1456 ( .A0(intDY[22]), .A1(n913), .B0(DMP[22]), .B1(n966), .Y(
        n808) );
  OAI21XLTS U1457 ( .A0(n1446), .A1(n975), .B0(n808), .Y(n154) );
  INVX2TS U1458 ( .A(n974), .Y(n912) );
  AOI22X1TS U1459 ( .A0(intDY[25]), .A1(n994), .B0(DmP[25]), .B1(n912), .Y(
        n809) );
  OAI21XLTS U1460 ( .A0(n1443), .A1(n996), .B0(n809), .Y(n164) );
  AOI22X1TS U1461 ( .A0(intDY[26]), .A1(n994), .B0(DmP[26]), .B1(n912), .Y(
        n810) );
  OAI21XLTS U1462 ( .A0(n1485), .A1(n996), .B0(n810), .Y(n167) );
  AOI22X1TS U1463 ( .A0(intDY[27]), .A1(n994), .B0(DmP[27]), .B1(n912), .Y(
        n811) );
  OAI21XLTS U1464 ( .A0(n1489), .A1(n996), .B0(n811), .Y(n170) );
  AOI22X1TS U1465 ( .A0(intDX[24]), .A1(n994), .B0(DMP[24]), .B1(n912), .Y(
        n812) );
  OAI21XLTS U1466 ( .A0(n1486), .A1(n996), .B0(n812), .Y(n160) );
  CLKBUFX2TS U1467 ( .A(n989), .Y(n997) );
  AOI22X1TS U1468 ( .A0(DmP[11]), .A1(n990), .B0(intDY[11]), .B1(n997), .Y(
        n813) );
  OAI21XLTS U1469 ( .A0(n1481), .A1(n992), .B0(n813), .Y(n122) );
  INVX2TS U1470 ( .A(n974), .Y(n998) );
  AOI22X1TS U1471 ( .A0(DmP[19]), .A1(n998), .B0(intDY[19]), .B1(n997), .Y(
        n814) );
  OAI21XLTS U1472 ( .A0(n1436), .A1(n970), .B0(n814), .Y(n146) );
  AOI22X1TS U1473 ( .A0(DmP[9]), .A1(n990), .B0(intDY[9]), .B1(n997), .Y(n815)
         );
  OAI21XLTS U1474 ( .A0(n1488), .A1(n992), .B0(n815), .Y(n116) );
  AOI22X1TS U1475 ( .A0(DmP[20]), .A1(n998), .B0(intDY[20]), .B1(n994), .Y(
        n816) );
  OAI21XLTS U1476 ( .A0(n1445), .A1(n970), .B0(n816), .Y(n149) );
  AOI22X1TS U1477 ( .A0(DmP[21]), .A1(n998), .B0(intDY[21]), .B1(n994), .Y(
        n817) );
  OAI21XLTS U1478 ( .A0(n1480), .A1(n970), .B0(n817), .Y(n152) );
  AOI22X1TS U1479 ( .A0(n1003), .A1(DMP[4]), .B0(intDY[4]), .B1(n1002), .Y(
        n818) );
  OAI21XLTS U1480 ( .A0(n1005), .A1(n1508), .B0(n818), .Y(n100) );
  AOI22X1TS U1481 ( .A0(n1003), .A1(DMP[1]), .B0(intDY[1]), .B1(n1002), .Y(
        n819) );
  OAI21XLTS U1482 ( .A0(n1005), .A1(n1491), .B0(n819), .Y(n91) );
  CLKBUFX2TS U1483 ( .A(n822), .Y(n1541) );
  CLKBUFX2TS U1484 ( .A(n822), .Y(n821) );
  CLKBUFX2TS U1485 ( .A(n821), .Y(n1551) );
  CLKBUFX2TS U1486 ( .A(n822), .Y(n820) );
  CLKBUFX2TS U1487 ( .A(n820), .Y(n1535) );
  CLKBUFX2TS U1488 ( .A(n822), .Y(n1550) );
  CLKBUFX2TS U1489 ( .A(n820), .Y(n1540) );
  CLKBUFX2TS U1490 ( .A(n820), .Y(n1536) );
  CLKBUFX2TS U1491 ( .A(n821), .Y(n1539) );
  CLKBUFX2TS U1492 ( .A(n820), .Y(n1537) );
  CLKBUFX2TS U1493 ( .A(n821), .Y(n1549) );
  CLKBUFX2TS U1494 ( .A(n821), .Y(n1545) );
  CLKBUFX2TS U1495 ( .A(n822), .Y(n1538) );
  CLKBUFX2TS U1496 ( .A(n820), .Y(n1546) );
  CLKBUFX2TS U1497 ( .A(n822), .Y(n1547) );
  CLKBUFX2TS U1498 ( .A(n820), .Y(n1553) );
  CLKBUFX2TS U1499 ( .A(n821), .Y(n1556) );
  CLKBUFX2TS U1500 ( .A(n820), .Y(n1552) );
  CLKBUFX2TS U1501 ( .A(n820), .Y(n1548) );
  CLKBUFX2TS U1502 ( .A(n820), .Y(n1558) );
  CLKBUFX2TS U1503 ( .A(n821), .Y(n1557) );
  CLKBUFX2TS U1504 ( .A(n821), .Y(n1543) );
  CLKBUFX2TS U1505 ( .A(n821), .Y(n1534) );
  CLKBUFX2TS U1506 ( .A(n822), .Y(n1554) );
  CLKBUFX2TS U1507 ( .A(n822), .Y(n1555) );
  CLKBUFX2TS U1508 ( .A(n821), .Y(n1533) );
  CLKBUFX2TS U1509 ( .A(n822), .Y(n1544) );
  CLKBUFX2TS U1510 ( .A(n822), .Y(n1542) );
  NOR2BX1TS U1511 ( .AN(n1029), .B(FS_Module_state_reg[2]), .Y(n1071) );
  INVX2TS U1512 ( .A(n1071), .Y(n976) );
  INVX2TS U1513 ( .A(n1420), .Y(n1418) );
  AOI22X1TS U1514 ( .A0(n1029), .A1(n1024), .B0(FSM_selector_B[1]), .B1(n976), 
        .Y(n823) );
  OAI21XLTS U1515 ( .A0(n1418), .A1(n1520), .B0(n823), .Y(n70) );
  INVX2TS U1516 ( .A(n826), .Y(n1407) );
  CLKBUFX2TS U1517 ( .A(n1407), .Y(n1366) );
  INVX2TS U1518 ( .A(n1366), .Y(n1405) );
  OR3X1TS U1519 ( .A(overflow_flag), .B(underflow_flag), .C(n1405), .Y(n1359)
         );
  CLKBUFX2TS U1520 ( .A(n1359), .Y(n1403) );
  OA22X1TS U1521 ( .A0(exp_oper_result[6]), .A1(n1403), .B0(n1366), .B1(
        final_result_ieee[29]), .Y(n61) );
  NAND2X1TS U1522 ( .A(n982), .B(n1455), .Y(n244) );
  OAI22X1TS U1523 ( .A0(n1486), .A1(intDX[24]), .B0(n1501), .B1(intDY[28]), 
        .Y(n827) );
  AOI221XLTS U1524 ( .A0(n1486), .A1(intDX[24]), .B0(intDY[28]), .B1(n1501), 
        .C0(n827), .Y(n833) );
  OAI22X1TS U1525 ( .A0(n1493), .A1(intDY[0]), .B0(n1508), .B1(intDY[4]), .Y(
        n828) );
  AOI221XLTS U1526 ( .A0(n1493), .A1(intDY[0]), .B0(intDY[4]), .B1(n1508), 
        .C0(n828), .Y(n832) );
  OAI22X1TS U1527 ( .A0(n1448), .A1(intDY[5]), .B0(n1492), .B1(intDY[2]), .Y(
        n829) );
  AOI221XLTS U1528 ( .A0(n1448), .A1(intDY[5]), .B0(intDY[2]), .B1(n1492), 
        .C0(n829), .Y(n831) );
  AOI22X1TS U1529 ( .A0(intDX[17]), .A1(n1518), .B0(intDY[17]), .B1(n1494), 
        .Y(n830) );
  NAND4XLTS U1530 ( .A(n833), .B(n832), .C(n831), .D(n830), .Y(n861) );
  OAI22X1TS U1531 ( .A0(n1490), .A1(intDY[3]), .B0(n1447), .B1(intDY[7]), .Y(
        n834) );
  AOI221XLTS U1532 ( .A0(n1490), .A1(intDY[3]), .B0(intDY[7]), .B1(n1447), 
        .C0(n834), .Y(n841) );
  OAI22X1TS U1533 ( .A0(n1482), .A1(intDY[8]), .B0(n1442), .B1(intDY[13]), .Y(
        n835) );
  AOI221XLTS U1534 ( .A0(n1482), .A1(intDY[8]), .B0(intDY[13]), .B1(n1442), 
        .C0(n835), .Y(n840) );
  OAI22X1TS U1535 ( .A0(n1507), .A1(intDY[6]), .B0(n1481), .B1(intDY[11]), .Y(
        n836) );
  AOI221XLTS U1536 ( .A0(n1507), .A1(intDY[6]), .B0(intDY[11]), .B1(n1481), 
        .C0(n836), .Y(n839) );
  OAI22X1TS U1537 ( .A0(n1444), .A1(intDY[12]), .B0(n1491), .B1(intDY[1]), .Y(
        n837) );
  AOI221XLTS U1538 ( .A0(n1444), .A1(intDY[12]), .B0(intDY[1]), .B1(n1491), 
        .C0(n837), .Y(n838) );
  NAND4XLTS U1539 ( .A(n841), .B(n840), .C(n839), .D(n838), .Y(n860) );
  OAI22X1TS U1540 ( .A0(n1506), .A1(intDY[10]), .B0(n1479), .B1(intDY[15]), 
        .Y(n842) );
  AOI221XLTS U1541 ( .A0(n1506), .A1(intDY[10]), .B0(intDY[15]), .B1(n1479), 
        .C0(n842), .Y(n849) );
  OAI22X1TS U1542 ( .A0(n1509), .A1(intDY[16]), .B0(n1480), .B1(intDY[21]), 
        .Y(n843) );
  AOI221XLTS U1543 ( .A0(n1509), .A1(intDY[16]), .B0(intDY[21]), .B1(n1480), 
        .C0(n843), .Y(n848) );
  OAI22X1TS U1544 ( .A0(n1487), .A1(intDY[14]), .B0(n1436), .B1(intDY[19]), 
        .Y(n844) );
  AOI221XLTS U1545 ( .A0(n1487), .A1(intDY[14]), .B0(intDY[19]), .B1(n1436), 
        .C0(n844), .Y(n847) );
  OAI22X1TS U1546 ( .A0(n1445), .A1(intDY[20]), .B0(n1488), .B1(intDY[9]), .Y(
        n845) );
  AOI221XLTS U1547 ( .A0(n1445), .A1(intDY[20]), .B0(intDY[9]), .B1(n1488), 
        .C0(n845), .Y(n846) );
  NAND4XLTS U1548 ( .A(n849), .B(n848), .C(n847), .D(n846), .Y(n859) );
  OAI22X1TS U1549 ( .A0(n1484), .A1(intDY[18]), .B0(n1443), .B1(intDY[25]), 
        .Y(n850) );
  AOI221XLTS U1550 ( .A0(n1484), .A1(intDY[18]), .B0(intDY[25]), .B1(n1443), 
        .C0(n850), .Y(n857) );
  OAI22X1TS U1551 ( .A0(n1483), .A1(intDY[23]), .B0(n1440), .B1(intDY[30]), 
        .Y(n851) );
  AOI221XLTS U1552 ( .A0(n1483), .A1(intDY[23]), .B0(intDY[30]), .B1(n1440), 
        .C0(n851), .Y(n856) );
  OAI22X1TS U1553 ( .A0(n1446), .A1(intDY[22]), .B0(n1489), .B1(intDY[27]), 
        .Y(n852) );
  AOI221XLTS U1554 ( .A0(n1446), .A1(intDY[22]), .B0(intDY[27]), .B1(n1489), 
        .C0(n852), .Y(n855) );
  OAI22X1TS U1555 ( .A0(n1485), .A1(intDY[26]), .B0(n1441), .B1(intDY[29]), 
        .Y(n853) );
  AOI221XLTS U1556 ( .A0(n1485), .A1(intDY[26]), .B0(intDY[29]), .B1(n1441), 
        .C0(n853), .Y(n854) );
  NAND4XLTS U1557 ( .A(n857), .B(n856), .C(n855), .D(n854), .Y(n858) );
  NOR4XLTS U1558 ( .A(n861), .B(n860), .C(n859), .D(n858), .Y(n971) );
  AOI21X1TS U1559 ( .A0(n971), .A1(n949), .B0(n1003), .Y(n866) );
  OAI22X1TS U1560 ( .A0(beg_FSM), .A1(n244), .B0(ack_FSM), .B1(n864), .Y(n1023) );
  AOI22X1TS U1561 ( .A0(DmP[5]), .A1(n906), .B0(intDY[5]), .B1(n989), .Y(n867)
         );
  OAI21XLTS U1562 ( .A0(n1448), .A1(n992), .B0(n867), .Y(n104) );
  INVX2TS U1563 ( .A(n1311), .Y(n1322) );
  AOI21X1TS U1564 ( .A0(n1283), .A1(Add_Subt_result[19]), .B0(n868), .Y(n1251)
         );
  OAI2BB2XLTS U1565 ( .B0(n1322), .B1(n1241), .A0N(n1322), .A1N(n1251), .Y(
        n965) );
  INVX2TS U1566 ( .A(n1243), .Y(n1349) );
  AOI21X1TS U1567 ( .A0(n1283), .A1(Add_Subt_result[18]), .B0(n869), .Y(n1255)
         );
  AOI21X1TS U1568 ( .A0(n1283), .A1(Add_Subt_result[17]), .B0(n870), .Y(n1259)
         );
  AOI22X1TS U1569 ( .A0(n1345), .A1(n1259), .B0(n1244), .B1(n1342), .Y(n1256)
         );
  AOI22X1TS U1570 ( .A0(n1349), .A1(n1252), .B0(n1347), .B1(n1256), .Y(n874)
         );
  AOI21X1TS U1571 ( .A0(Add_Subt_result[20]), .A1(n1341), .B0(n871), .Y(n1246)
         );
  AOI22X1TS U1572 ( .A0(n1345), .A1(n1246), .B0(n872), .B1(n1342), .Y(n960) );
  NAND2X1TS U1573 ( .A(n960), .B(n961), .Y(n873) );
  INVX2TS U1574 ( .A(n961), .Y(n1240) );
  AOI21X1TS U1575 ( .A0(Add_Subt_result[16]), .A1(n1341), .B0(n875), .Y(n1263)
         );
  AOI22X1TS U1576 ( .A0(n1345), .A1(n1263), .B0(n1246), .B1(n1342), .Y(n1260)
         );
  AOI22X1TS U1577 ( .A0(n1349), .A1(n1256), .B0(n663), .B1(n1260), .Y(n877) );
  NAND2X1TS U1578 ( .A(n657), .B(n1252), .Y(n876) );
  AOI22X1TS U1579 ( .A0(DmP[17]), .A1(n998), .B0(intDX[17]), .B1(n898), .Y(
        n878) );
  OAI21XLTS U1580 ( .A0(n1518), .A1(n975), .B0(n878), .Y(n140) );
  AOI22X1TS U1581 ( .A0(intDY[23]), .A1(n994), .B0(DmP[23]), .B1(n912), .Y(
        n879) );
  OAI21XLTS U1582 ( .A0(n1483), .A1(n1000), .B0(n879), .Y(n158) );
  AOI22X1TS U1583 ( .A0(DmP[15]), .A1(n998), .B0(intDY[15]), .B1(n997), .Y(
        n880) );
  OAI21XLTS U1584 ( .A0(n1479), .A1(n1000), .B0(n880), .Y(n134) );
  AOI22X1TS U1585 ( .A0(DmP[18]), .A1(n998), .B0(intDY[18]), .B1(n997), .Y(
        n881) );
  OAI21XLTS U1586 ( .A0(n1484), .A1(n1000), .B0(n881), .Y(n143) );
  AOI22X1TS U1587 ( .A0(DmP[12]), .A1(n998), .B0(intDY[12]), .B1(n997), .Y(
        n882) );
  OAI21XLTS U1588 ( .A0(n1444), .A1(n1000), .B0(n882), .Y(n125) );
  AOI22X1TS U1589 ( .A0(DmP[14]), .A1(n990), .B0(intDY[14]), .B1(n997), .Y(
        n883) );
  OAI21XLTS U1590 ( .A0(n1487), .A1(n1000), .B0(n883), .Y(n131) );
  AOI22X1TS U1591 ( .A0(DmP[13]), .A1(n998), .B0(intDY[13]), .B1(n997), .Y(
        n884) );
  OAI21XLTS U1592 ( .A0(n1442), .A1(n1000), .B0(n884), .Y(n128) );
  AOI22X1TS U1593 ( .A0(DmP[22]), .A1(n998), .B0(intDY[22]), .B1(n994), .Y(
        n885) );
  OAI21XLTS U1594 ( .A0(n1446), .A1(n996), .B0(n885), .Y(n155) );
  AOI22X1TS U1595 ( .A0(DmP[10]), .A1(n990), .B0(intDY[10]), .B1(n997), .Y(
        n886) );
  OAI21XLTS U1596 ( .A0(n1506), .A1(n992), .B0(n886), .Y(n119) );
  INVX2TS U1597 ( .A(n890), .Y(n969) );
  INVX2TS U1598 ( .A(n970), .Y(n967) );
  AOI22X1TS U1599 ( .A0(intDY[15]), .A1(n967), .B0(DMP[15]), .B1(n906), .Y(
        n887) );
  OAI21XLTS U1600 ( .A0(n1479), .A1(n969), .B0(n887), .Y(n133) );
  AOI22X1TS U1601 ( .A0(intDY[18]), .A1(n967), .B0(DMP[18]), .B1(n966), .Y(
        n888) );
  OAI21XLTS U1602 ( .A0(n1484), .A1(n969), .B0(n888), .Y(n142) );
  AOI22X1TS U1603 ( .A0(intDY[19]), .A1(n913), .B0(DMP[19]), .B1(n966), .Y(
        n889) );
  OAI21XLTS U1604 ( .A0(n1436), .A1(n969), .B0(n889), .Y(n145) );
  INVX2TS U1605 ( .A(n890), .Y(n909) );
  AOI22X1TS U1606 ( .A0(intDY[27]), .A1(n913), .B0(DMP[27]), .B1(n912), .Y(
        n891) );
  OAI21XLTS U1607 ( .A0(n1489), .A1(n909), .B0(n891), .Y(n169) );
  AOI22X1TS U1608 ( .A0(intDY[20]), .A1(n913), .B0(DMP[20]), .B1(n966), .Y(
        n892) );
  OAI21XLTS U1609 ( .A0(n1445), .A1(n969), .B0(n892), .Y(n148) );
  AOI22X1TS U1610 ( .A0(intDY[11]), .A1(n967), .B0(DMP[11]), .B1(n966), .Y(
        n893) );
  OAI21XLTS U1611 ( .A0(n1481), .A1(n909), .B0(n893), .Y(n121) );
  AOI22X1TS U1612 ( .A0(intDY[30]), .A1(n967), .B0(DMP[30]), .B1(n993), .Y(
        n894) );
  OAI21XLTS U1613 ( .A0(n1440), .A1(n909), .B0(n894), .Y(n178) );
  AOI22X1TS U1614 ( .A0(intDY[12]), .A1(n967), .B0(DMP[12]), .B1(n906), .Y(
        n895) );
  OAI21XLTS U1615 ( .A0(n1444), .A1(n969), .B0(n895), .Y(n124) );
  AOI22X1TS U1616 ( .A0(intDX[24]), .A1(n913), .B0(DmP[24]), .B1(n912), .Y(
        n896) );
  OAI21XLTS U1617 ( .A0(n1486), .A1(n909), .B0(n896), .Y(n161) );
  AOI22X1TS U1618 ( .A0(intDY[8]), .A1(n1002), .B0(DMP[8]), .B1(n906), .Y(n897) );
  OAI21XLTS U1619 ( .A0(n1482), .A1(n909), .B0(n897), .Y(n112) );
  AOI22X1TS U1620 ( .A0(intDY[9]), .A1(n898), .B0(DMP[9]), .B1(n906), .Y(n899)
         );
  OAI21XLTS U1621 ( .A0(n1488), .A1(n909), .B0(n899), .Y(n115) );
  AOI22X1TS U1622 ( .A0(intDY[25]), .A1(n913), .B0(DMP[25]), .B1(n912), .Y(
        n900) );
  OAI21XLTS U1623 ( .A0(n1443), .A1(n909), .B0(n900), .Y(n163) );
  AOI22X1TS U1624 ( .A0(intDY[13]), .A1(n967), .B0(DMP[13]), .B1(n906), .Y(
        n901) );
  OAI21XLTS U1625 ( .A0(n1442), .A1(n969), .B0(n901), .Y(n127) );
  AOI22X1TS U1626 ( .A0(intDY[29]), .A1(n1002), .B0(DMP[29]), .B1(n993), .Y(
        n902) );
  OAI21XLTS U1627 ( .A0(n1441), .A1(n909), .B0(n902), .Y(n175) );
  AOI22X1TS U1628 ( .A0(intDY[21]), .A1(n913), .B0(DMP[21]), .B1(n966), .Y(
        n903) );
  OAI21XLTS U1629 ( .A0(n1480), .A1(n969), .B0(n903), .Y(n151) );
  AOI22X1TS U1630 ( .A0(intDY[14]), .A1(n967), .B0(DMP[14]), .B1(n966), .Y(
        n904) );
  OAI21XLTS U1631 ( .A0(n1487), .A1(n969), .B0(n904), .Y(n130) );
  AOI22X1TS U1632 ( .A0(intDY[10]), .A1(n967), .B0(DMP[10]), .B1(n906), .Y(
        n905) );
  OAI21XLTS U1633 ( .A0(n1506), .A1(n909), .B0(n905), .Y(n118) );
  AOI22X1TS U1634 ( .A0(intDY[16]), .A1(n967), .B0(DMP[16]), .B1(n906), .Y(
        n907) );
  OAI21XLTS U1635 ( .A0(n1509), .A1(n969), .B0(n907), .Y(n136) );
  AOI22X1TS U1636 ( .A0(intDY[28]), .A1(n913), .B0(DMP[28]), .B1(n912), .Y(
        n908) );
  OAI21XLTS U1637 ( .A0(n1501), .A1(n909), .B0(n908), .Y(n172) );
  AOI22X1TS U1638 ( .A0(n1003), .A1(DMP[6]), .B0(intDY[6]), .B1(n1002), .Y(
        n910) );
  OAI21XLTS U1639 ( .A0(n1005), .A1(n1507), .B0(n910), .Y(n106) );
  AOI22X1TS U1640 ( .A0(intDY[23]), .A1(n913), .B0(DMP[23]), .B1(n966), .Y(
        n911) );
  OAI21XLTS U1641 ( .A0(n1483), .A1(n1005), .B0(n911), .Y(n157) );
  AOI22X1TS U1642 ( .A0(intDY[26]), .A1(n913), .B0(DMP[26]), .B1(n912), .Y(
        n914) );
  OAI21XLTS U1643 ( .A0(n1485), .A1(n1005), .B0(n914), .Y(n166) );
  AOI22X1TS U1644 ( .A0(LZA_output[3]), .A1(n1012), .B0(n664), .B1(
        exp_oper_result[3]), .Y(n915) );
  AOI22X1TS U1645 ( .A0(LZA_output[4]), .A1(n1012), .B0(n664), .B1(
        exp_oper_result[4]), .Y(n938) );
  NAND2X1TS U1646 ( .A(n915), .B(n938), .Y(n926) );
  NOR2X1TS U1647 ( .A(n938), .B(n940), .Y(n1064) );
  AOI22X1TS U1648 ( .A0(n921), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[27]), .B0(n1064), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .Y(n917) );
  NAND2X1TS U1649 ( .A(n940), .B(n938), .Y(n1372) );
  INVX2TS U1650 ( .A(n1372), .Y(n1065) );
  AOI22X1TS U1651 ( .A0(n922), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[35]), .B1(n658), .Y(n916)
         );
  NAND2X1TS U1652 ( .A(n1019), .B(n918), .Y(n1374) );
  NAND2X1TS U1653 ( .A(n1374), .B(n1340), .Y(n1371) );
  NAND2X1TS U1654 ( .A(n1374), .B(n919), .Y(n1373) );
  CLKBUFX2TS U1655 ( .A(n1398), .Y(n1380) );
  AOI22X1TS U1656 ( .A0(n659), .A1(Sgf_normalized_result[24]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B1(n1380), .Y(n920)
         );
  INVX2TS U1657 ( .A(n954), .Y(n1368) );
  AOI22X1TS U1658 ( .A0(n921), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[26]), .B0(n1064), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .Y(n924) );
  AOI22X1TS U1659 ( .A0(n922), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .B1(n658), .Y(n923)
         );
  AOI22X1TS U1660 ( .A0(n661), .A1(Sgf_normalized_result[25]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B1(n1380), .Y(n925)
         );
  CLKBUFX2TS U1661 ( .A(n1394), .Y(n1066) );
  AOI22X1TS U1662 ( .A0(n1066), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B0(n659), .B1(
        Sgf_normalized_result[1]), .Y(n927) );
  AOI22X1TS U1663 ( .A0(n1066), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[51]), .B0(n660), .B1(
        Sgf_normalized_result[0]), .Y(n929) );
  OAI22X1TS U1664 ( .A0(n932), .A1(n1245), .B0(n931), .B1(n937), .Y(n933) );
  INVX2TS U1665 ( .A(n1311), .Y(n1331) );
  AOI32X1TS U1666 ( .A0(n1290), .A1(n1322), .A2(n1234), .B0(n933), .B1(n1331), 
        .Y(n934) );
  AOI21X1TS U1667 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[50]), .A1(
        n1065), .B0(n1375), .Y(n1043) );
  AOI22X1TS U1668 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[51]), .A1(
        n1064), .B0(n1065), .B1(Barrel_Shifter_module_Mux_Array_Data_array[43]), .Y(n941) );
  NAND2X1TS U1669 ( .A(n1375), .B(n940), .Y(n1052) );
  NAND2X1TS U1670 ( .A(n941), .B(n1052), .Y(n1045) );
  CLKBUFX2TS U1671 ( .A(n1394), .Y(n1379) );
  AOI22X1TS U1672 ( .A0(n652), .A1(n1045), .B0(n1379), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[35]), .Y(n943) );
  AOI22X1TS U1673 ( .A0(n659), .A1(Sgf_normalized_result[16]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .B1(n1380), .Y(n942)
         );
  AOI21X1TS U1674 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[51]), .A1(
        n1065), .B0(n1375), .Y(n1048) );
  AOI22X1TS U1675 ( .A0(n1065), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .B0(
        Barrel_Shifter_module_Mux_Array_Data_array[50]), .B1(n1064), .Y(n944)
         );
  NAND2X1TS U1676 ( .A(n944), .B(n1052), .Y(n1050) );
  AOI22X1TS U1677 ( .A0(n652), .A1(n1050), .B0(n1379), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .Y(n946) );
  AOI22X1TS U1678 ( .A0(n660), .A1(Sgf_normalized_result[17]), .B0(n1380), 
        .B1(Barrel_Shifter_module_Mux_Array_Data_array[43]), .Y(n945) );
  OAI22X1TS U1679 ( .A0(r_mode[0]), .A1(n1453), .B0(Sgf_normalized_result[0]), 
        .B1(Sgf_normalized_result[1]), .Y(n948) );
  INVX2TS U1680 ( .A(n1153), .Y(n1227) );
  OAI21XLTS U1681 ( .A0(n1023), .A1(n1024), .B0(FS_Module_state_reg[3]), .Y(
        n951) );
  AOI22X1TS U1682 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[41]), .A1(
        n1065), .B0(Barrel_Shifter_module_Mux_Array_Data_array[49]), .B1(n1064), .Y(n1051) );
  AOI21X1TS U1683 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .A1(
        n1380), .B0(n954), .Y(n956) );
  AOI22X1TS U1684 ( .A0(n661), .A1(Sgf_normalized_result[18]), .B0(n1379), 
        .B1(Barrel_Shifter_module_Mux_Array_Data_array[33]), .Y(n955) );
  AOI22X1TS U1685 ( .A0(n1349), .A1(n960), .B0(n656), .B1(n962), .Y(n959) );
  INVX2TS U1686 ( .A(n1240), .Y(n1333) );
  AOI32X1TS U1687 ( .A0(n1345), .A1(n1333), .A2(n1242), .B0(n957), .B1(n1333), 
        .Y(n958) );
  AOI22X1TS U1688 ( .A0(n960), .A1(n1339), .B0(n662), .B1(n1252), .Y(n964) );
  NAND2X1TS U1689 ( .A(n962), .B(n961), .Y(n963) );
  AOI22X1TS U1690 ( .A0(intDY[17]), .A1(n967), .B0(DMP[17]), .B1(n966), .Y(
        n968) );
  OAI222X1TS U1691 ( .A0(n975), .A1(n1454), .B0(n1453), .B1(n974), .C0(n973), 
        .C1(n972), .Y(n86) );
  OAI211XLTS U1692 ( .A0(n1026), .A1(FSM_selector_C), .B0(n977), .C0(n976), 
        .Y(n981) );
  NAND2X1TS U1693 ( .A(n982), .B(FS_Module_state_reg[0]), .Y(n1422) );
  INVX2TS U1694 ( .A(n1422), .Y(n1430) );
  CLKBUFX2TS U1695 ( .A(n1430), .Y(n1433) );
  INVX2TS U1696 ( .A(n1433), .Y(n1063) );
  OR4X2TS U1697 ( .A(Exp_Operation_Module_Data_S[2]), .B(
        Exp_Operation_Module_Data_S[0]), .C(Exp_Operation_Module_Data_S[1]), 
        .D(n984), .Y(n985) );
  OR4X2TS U1698 ( .A(Exp_Operation_Module_Data_S[5]), .B(
        Exp_Operation_Module_Data_S[4]), .C(Exp_Operation_Module_Data_S[3]), 
        .D(n985), .Y(n986) );
  OR4X2TS U1699 ( .A(n1230), .B(Exp_Operation_Module_Data_S[7]), .C(
        Exp_Operation_Module_Data_S[6]), .D(n986), .Y(n987) );
  OAI21XLTS U1700 ( .A0(n1153), .A1(FS_Module_state_reg[0]), .B0(n1318), .Y(
        n243) );
  AOI22X1TS U1701 ( .A0(DmP[7]), .A1(n990), .B0(intDY[7]), .B1(n989), .Y(n991)
         );
  OAI21XLTS U1702 ( .A0(n1447), .A1(n992), .B0(n991), .Y(n110) );
  AOI22X1TS U1703 ( .A0(intDY[28]), .A1(n994), .B0(DmP[28]), .B1(n993), .Y(
        n995) );
  OAI21XLTS U1704 ( .A0(n1501), .A1(n996), .B0(n995), .Y(n173) );
  AOI22X1TS U1705 ( .A0(DmP[16]), .A1(n998), .B0(intDY[16]), .B1(n997), .Y(
        n999) );
  OAI21XLTS U1706 ( .A0(n1509), .A1(n1000), .B0(n999), .Y(n137) );
  AOI22X1TS U1707 ( .A0(n1003), .A1(DMP[7]), .B0(intDY[7]), .B1(n1002), .Y(
        n1001) );
  OAI21XLTS U1708 ( .A0(n1005), .A1(n1447), .B0(n1001), .Y(n109) );
  AOI22X1TS U1709 ( .A0(n1003), .A1(DMP[5]), .B0(intDY[5]), .B1(n1002), .Y(
        n1004) );
  OAI21XLTS U1710 ( .A0(n1005), .A1(n1448), .B0(n1004), .Y(n103) );
  OAI2BB2XLTS U1711 ( .B0(n1467), .B1(n1015), .A0N(DmP[24]), .A1N(n664), .Y(
        n1016) );
  OAI21XLTS U1712 ( .A0(FSM_selector_C), .A1(n1019), .B0(n1405), .Y(n1027) );
  AOI211XLTS U1713 ( .A0(FS_Module_state_reg[1]), .A1(n1023), .B0(n1020), .C0(
        n1027), .Y(n1022) );
  AOI22X1TS U1714 ( .A0(FS_Module_state_reg[0]), .A1(n1148), .B0(n1024), .B1(
        n1455), .Y(n1021) );
  NAND2X1TS U1715 ( .A(n1026), .B(n1025), .Y(n1232) );
  INVX2TS U1716 ( .A(n1232), .Y(n1122) );
  AOI211XLTS U1717 ( .A0(n1029), .A1(n1456), .B0(n1028), .C0(n1027), .Y(n1031)
         );
  CLKMX2X2TS U1718 ( .A(Add_Subt_result[25]), .B(n1036), .S0(n1227), .Y(n215)
         );
  AFHCONX2TS U1719 ( .A(n1039), .B(n1038), .CI(n1037), .CON(n1130), .S(n1040)
         );
  CLKBUFX2TS U1720 ( .A(n1398), .Y(n1356) );
  AOI22X1TS U1721 ( .A0(n1356), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[35]), .B0(n661), .B1(
        Sgf_normalized_result[9]), .Y(n1042) );
  NAND2X1TS U1722 ( .A(n1066), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[42]), .Y(n1041) );
  AOI22X1TS U1723 ( .A0(n1356), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[34]), .B0(n660), .B1(
        Sgf_normalized_result[8]), .Y(n1047) );
  NAND2X1TS U1724 ( .A(n1066), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[43]), .Y(n1046) );
  AOI22X1TS U1725 ( .A0(n1066), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[44]), .B0(n1356), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[33]), .Y(n1053) );
  AOI22X1TS U1726 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[40]), .A1(
        n1065), .B0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .B1(n1064), .Y(n1367) );
  AOI22X1TS U1727 ( .A0(n1066), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[45]), .B0(n1356), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[32]), .Y(n1055) );
  INVX2TS U1728 ( .A(n1433), .Y(n1427) );
  AOI22X1TS U1729 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[39]), .A1(
        n1065), .B0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .B1(n1064), .Y(n1363) );
  AOI22X1TS U1730 ( .A0(n1066), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[46]), .B0(n1356), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[31]), .Y(n1057) );
  AOI22X1TS U1731 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[38]), .A1(
        n1065), .B0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .B1(n1064), .Y(n1360) );
  AOI22X1TS U1732 ( .A0(n1066), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[47]), .B0(n1356), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[30]), .Y(n1059) );
  AOI22X1TS U1733 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[37]), .A1(
        n1065), .B0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .B1(n1064), .Y(n1355) );
  AOI22X1TS U1734 ( .A0(n1066), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[48]), .B0(n1356), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[29]), .Y(n1061) );
  AOI22X1TS U1735 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[36]), .A1(
        n1065), .B0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .B1(n1064), .Y(n1352) );
  AOI22X1TS U1736 ( .A0(n1066), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .B0(n1356), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[28]), .Y(n1068) );
  INVX2TS U1737 ( .A(n1110), .Y(n1072) );
  INVX2TS U1738 ( .A(n1104), .Y(n1073) );
  NOR2XLTS U1739 ( .A(Add_Subt_result[23]), .B(Add_Subt_result[22]), .Y(n1108)
         );
  NAND2X1TS U1740 ( .A(n1111), .B(n1108), .Y(n1103) );
  INVX2TS U1741 ( .A(n1410), .Y(n1074) );
  INVX2TS U1742 ( .A(n1107), .Y(n1075) );
  NAND2X1TS U1743 ( .A(n1089), .B(n1086), .Y(n1112) );
  NOR2BX1TS U1744 ( .AN(n1417), .B(Add_Subt_result[12]), .Y(n1093) );
  NOR2XLTS U1745 ( .A(Add_Subt_result[9]), .B(Add_Subt_result[8]), .Y(n1077)
         );
  NAND2X1TS U1746 ( .A(n1082), .B(n1077), .Y(n1078) );
  OR2X1TS U1747 ( .A(Add_Subt_result[3]), .B(Add_Subt_result[2]), .Y(n1080) );
  AOI22X1TS U1748 ( .A0(n1099), .A1(n1080), .B0(n1415), .B1(n1079), .Y(n1115)
         );
  OAI21XLTS U1749 ( .A0(Add_Subt_result[1]), .A1(Add_Subt_result[0]), .B0(
        n1094), .Y(n1084) );
  AOI22X1TS U1750 ( .A0(Add_Subt_result[10]), .A1(n1417), .B0(n1094), .B1(
        Add_Subt_result[1]), .Y(n1091) );
  INVX2TS U1751 ( .A(n1086), .Y(n1088) );
  OA21XLTS U1752 ( .A0(Add_Subt_result[11]), .A1(Add_Subt_result[13]), .B0(
        n1098), .Y(n1087) );
  OAI22X1TS U1753 ( .A0(n1116), .A1(n1451), .B0(n1112), .B1(n1521), .Y(n1409)
         );
  AOI21X1TS U1754 ( .A0(n1091), .A1(n1090), .B0(n1418), .Y(n1092) );
  NAND2X1TS U1755 ( .A(Add_Subt_result[2]), .B(n1099), .Y(n1097) );
  AOI22X1TS U1756 ( .A0(Add_Subt_result[5]), .A1(n1100), .B0(
        Add_Subt_result[3]), .B1(n1099), .Y(n1101) );
  OAI2BB1X1TS U1757 ( .A0N(LZA_output[2]), .A1N(n1418), .B0(n1106), .Y(n75) );
  AND3X1TS U1758 ( .A(n1410), .B(Add_Subt_result[15]), .C(n1107), .Y(n1120) );
  INVX2TS U1759 ( .A(n1108), .Y(n1109) );
  AOI21X1TS U1760 ( .A0(n1110), .A1(Add_Subt_result[19]), .B0(n1109), .Y(n1114) );
  INVX2TS U1761 ( .A(n1111), .Y(n1113) );
  OAI22X1TS U1762 ( .A0(n1114), .A1(n1113), .B0(n1521), .B1(n1112), .Y(n1118)
         );
  NOR4XLTS U1763 ( .A(n1120), .B(n1119), .C(n1118), .D(n1117), .Y(n1121) );
  AFHCINX2TS U1764 ( .CIN(n1132), .B(n1133), .A(n1134), .S(n1135), .CO(n1123)
         );
  INVX2TS U1765 ( .A(n1153), .Y(n1206) );
  AFHCONX2TS U1766 ( .A(n1157), .B(n1156), .CI(n1155), .CON(n1164), .S(n1158)
         );
  AFHCONX2TS U1767 ( .A(n1192), .B(n1191), .CI(n1190), .CON(n1199), .S(n1193)
         );
  AFHCINX2TS U1768 ( .CIN(n1199), .B(n1200), .A(n1201), .S(n1202), .CO(n1208)
         );
  AFHCONX2TS U1769 ( .A(n1210), .B(n1209), .CI(n1208), .CON(n1216), .S(n1211)
         );
  AFHCONX2TS U1770 ( .A(n1214), .B(n1213), .CI(n1212), .CON(n1203), .S(n1215)
         );
  AFHCONX2TS U1771 ( .A(n1226), .B(n1225), .CI(n1224), .CON(n1220), .S(n1228)
         );
  AND4X1TS U1772 ( .A(Exp_Operation_Module_Data_S[3]), .B(
        Exp_Operation_Module_Data_S[2]), .C(Exp_Operation_Module_Data_S[0]), 
        .D(Exp_Operation_Module_Data_S[1]), .Y(n1229) );
  AND4X1TS U1773 ( .A(Exp_Operation_Module_Data_S[6]), .B(
        Exp_Operation_Module_Data_S[5]), .C(Exp_Operation_Module_Data_S[4]), 
        .D(n1229), .Y(n1231) );
  AOI21X1TS U1774 ( .A0(Exp_Operation_Module_Data_S[7]), .A1(n1231), .B0(n1230), .Y(n1233) );
  AOI22X1TS U1775 ( .A0(n1349), .A1(n1241), .B0(n656), .B1(n1234), .Y(n1239)
         );
  AOI22X1TS U1776 ( .A0(n1235), .A1(n1333), .B0(n662), .B1(n1242), .Y(n1237)
         );
  CLKBUFX2TS U1777 ( .A(n1236), .Y(n1328) );
  AOI32X1TS U1778 ( .A0(n1239), .A1(n1238), .A2(n1237), .B0(n1328), .B1(n1238), 
        .Y(Barrel_Shifter_module_Mux_Array_Data_array[22]) );
  INVX2TS U1779 ( .A(n1240), .Y(n1337) );
  AOI22X1TS U1780 ( .A0(n657), .A1(n1242), .B0(n1337), .B1(n1241), .Y(n1249)
         );
  OA22X1TS U1781 ( .A0(n1246), .A1(n1245), .B0(n1244), .B1(n1243), .Y(n1248)
         );
  AOI32X1TS U1782 ( .A0(n1249), .A1(n1322), .A2(n1248), .B0(n1247), .B1(n1311), 
        .Y(Barrel_Shifter_module_Mux_Array_Data_array[20]) );
  AOI21X1TS U1783 ( .A0(n1319), .A1(Add_Subt_result[15]), .B0(n1250), .Y(n1268) );
  AOI22X1TS U1784 ( .A0(n1345), .A1(n1268), .B0(n1251), .B1(n1342), .Y(n1264)
         );
  AOI22X1TS U1785 ( .A0(n1349), .A1(n1260), .B0(n662), .B1(n1264), .Y(n1254)
         );
  AOI22X1TS U1786 ( .A0(n657), .A1(n1256), .B0(n1337), .B1(n1252), .Y(n1253)
         );
  NAND2X1TS U1787 ( .A(n1254), .B(n1253), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[15]) );
  AOI222XLTS U1788 ( .A0(n1519), .A1(DmP[12]), .B0(Add_Subt_result[14]), .B1(
        n1319), .C0(Add_Subt_result[11]), .C1(n1267), .Y(n1273) );
  AOI22X1TS U1789 ( .A0(n1345), .A1(n1273), .B0(n1255), .B1(n1342), .Y(n1269)
         );
  AOI22X1TS U1790 ( .A0(n1349), .A1(n1264), .B0(n663), .B1(n1269), .Y(n1258)
         );
  AOI22X1TS U1791 ( .A0(n1339), .A1(n1260), .B0(n1337), .B1(n1256), .Y(n1257)
         );
  NAND2X1TS U1792 ( .A(n1258), .B(n1257), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[14]) );
  AOI222XLTS U1793 ( .A0(n1519), .A1(DmP[11]), .B0(Add_Subt_result[13]), .B1(
        n1319), .C0(Add_Subt_result[12]), .C1(n1267), .Y(n1278) );
  AOI22X1TS U1794 ( .A0(n1345), .A1(n1278), .B0(n1259), .B1(n1342), .Y(n1274)
         );
  AOI22X1TS U1795 ( .A0(n1349), .A1(n1269), .B0(n1347), .B1(n1274), .Y(n1262)
         );
  AOI22X1TS U1796 ( .A0(n657), .A1(n1264), .B0(n1337), .B1(n1260), .Y(n1261)
         );
  NAND2X1TS U1797 ( .A(n1262), .B(n1261), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[13]) );
  AOI222XLTS U1798 ( .A0(n1519), .A1(DmP[10]), .B0(Add_Subt_result[13]), .B1(
        n1267), .C0(Add_Subt_result[12]), .C1(n1319), .Y(n1284) );
  AOI22X1TS U1799 ( .A0(n1345), .A1(n1284), .B0(n1263), .B1(n1342), .Y(n1279)
         );
  AOI22X1TS U1800 ( .A0(n1349), .A1(n1274), .B0(n662), .B1(n1279), .Y(n1266)
         );
  AOI22X1TS U1801 ( .A0(n1339), .A1(n1269), .B0(n1337), .B1(n1264), .Y(n1265)
         );
  NAND2X1TS U1802 ( .A(n1266), .B(n1265), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[12]) );
  AOI222XLTS U1803 ( .A0(n1519), .A1(DmP[9]), .B0(Add_Subt_result[14]), .B1(
        n1267), .C0(Add_Subt_result[11]), .C1(n1319), .Y(n1289) );
  AOI22X1TS U1804 ( .A0(n1331), .A1(n1289), .B0(n1268), .B1(n1342), .Y(n1285)
         );
  AOI22X1TS U1805 ( .A0(n1349), .A1(n1279), .B0(n663), .B1(n1285), .Y(n1271)
         );
  AOI22X1TS U1806 ( .A0(n657), .A1(n1274), .B0(n1337), .B1(n1269), .Y(n1270)
         );
  NAND2X1TS U1807 ( .A(n1271), .B(n1270), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[11]) );
  AOI21X1TS U1808 ( .A0(n1283), .A1(Add_Subt_result[10]), .B0(n1272), .Y(n1296) );
  AOI22X1TS U1809 ( .A0(n1331), .A1(n1296), .B0(n1273), .B1(n1328), .Y(n1291)
         );
  AOI22X1TS U1810 ( .A0(n1327), .A1(n1285), .B0(n663), .B1(n1291), .Y(n1276)
         );
  AOI22X1TS U1811 ( .A0(n657), .A1(n1279), .B0(n1337), .B1(n1274), .Y(n1275)
         );
  NAND2X1TS U1812 ( .A(n1276), .B(n1275), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[10]) );
  AOI21X1TS U1813 ( .A0(n1283), .A1(Add_Subt_result[9]), .B0(n1277), .Y(n1301)
         );
  AOI22X1TS U1814 ( .A0(n1331), .A1(n1301), .B0(n1278), .B1(n1328), .Y(n1297)
         );
  AOI22X1TS U1815 ( .A0(n1327), .A1(n1291), .B0(n1347), .B1(n1297), .Y(n1281)
         );
  AOI22X1TS U1816 ( .A0(n657), .A1(n1285), .B0(n1337), .B1(n1279), .Y(n1280)
         );
  NAND2X1TS U1817 ( .A(n1281), .B(n1280), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[9]) );
  AOI21X1TS U1818 ( .A0(n1283), .A1(Add_Subt_result[8]), .B0(n1282), .Y(n1307)
         );
  AOI22X1TS U1819 ( .A0(n1331), .A1(n1307), .B0(n1284), .B1(n1328), .Y(n1302)
         );
  AOI22X1TS U1820 ( .A0(n1290), .A1(n1297), .B0(n1347), .B1(n1302), .Y(n1287)
         );
  AOI22X1TS U1821 ( .A0(n1339), .A1(n1291), .B0(n1337), .B1(n1285), .Y(n1286)
         );
  NAND2X1TS U1822 ( .A(n1287), .B(n1286), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[8]) );
  AOI21X1TS U1823 ( .A0(n1341), .A1(Add_Subt_result[7]), .B0(n1288), .Y(n1312)
         );
  AOI22X1TS U1824 ( .A0(n1331), .A1(n1312), .B0(n1289), .B1(n1328), .Y(n1308)
         );
  AOI22X1TS U1825 ( .A0(n1290), .A1(n1302), .B0(n662), .B1(n1308), .Y(n1293)
         );
  AOI22X1TS U1826 ( .A0(n657), .A1(n1297), .B0(n1333), .B1(n1291), .Y(n1292)
         );
  NAND2X1TS U1827 ( .A(n1293), .B(n1292), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[7]) );
  AOI21X1TS U1828 ( .A0(n1341), .A1(Add_Subt_result[6]), .B0(n1295), .Y(n1320)
         );
  AOI22X1TS U1829 ( .A0(n1331), .A1(n1320), .B0(n1296), .B1(n1328), .Y(n1315)
         );
  AOI22X1TS U1830 ( .A0(n1327), .A1(n1308), .B0(n662), .B1(n1315), .Y(n1299)
         );
  AOI22X1TS U1831 ( .A0(n1339), .A1(n1302), .B0(n1333), .B1(n1297), .Y(n1298)
         );
  NAND2X1TS U1832 ( .A(n1299), .B(n1298), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[6]) );
  AOI21X1TS U1833 ( .A0(n1341), .A1(Add_Subt_result[5]), .B0(n1300), .Y(n1329)
         );
  AOI22X1TS U1834 ( .A0(n1331), .A1(n1329), .B0(n1301), .B1(n1328), .Y(n1324)
         );
  AOI22X1TS U1835 ( .A0(n1327), .A1(n1315), .B0(n663), .B1(n1324), .Y(n1304)
         );
  AOI22X1TS U1836 ( .A0(n1339), .A1(n1308), .B0(n1333), .B1(n1302), .Y(n1303)
         );
  NAND2X1TS U1837 ( .A(n1304), .B(n1303), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[5]) );
  AOI21X1TS U1838 ( .A0(n1341), .A1(Add_Subt_result[4]), .B0(n1306), .Y(n1343)
         );
  AOI22X1TS U1839 ( .A0(n1331), .A1(n1343), .B0(n1307), .B1(n1328), .Y(n1332)
         );
  AOI22X1TS U1840 ( .A0(n1327), .A1(n1324), .B0(n1347), .B1(n1332), .Y(n1310)
         );
  AOI22X1TS U1841 ( .A0(n657), .A1(n1315), .B0(n1333), .B1(n1308), .Y(n1309)
         );
  NAND2X1TS U1842 ( .A(n1310), .B(n1309), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[4]) );
  AOI22X1TS U1843 ( .A0(n1340), .A1(Add_Subt_result[22]), .B0(DmP[1]), .B1(
        n1318), .Y(n1314) );
  NAND2X1TS U1844 ( .A(Add_Subt_result[3]), .B(n1319), .Y(n1313) );
  AOI32X1TS U1845 ( .A0(n1314), .A1(n1322), .A2(n1313), .B0(n1312), .B1(n1311), 
        .Y(n1336) );
  AOI22X1TS U1846 ( .A0(n1327), .A1(n1332), .B0(n662), .B1(n1336), .Y(n1317)
         );
  AOI22X1TS U1847 ( .A0(n1339), .A1(n1324), .B0(n1333), .B1(n1315), .Y(n1316)
         );
  NAND2X1TS U1848 ( .A(n1317), .B(n1316), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[3]) );
  AOI22X1TS U1849 ( .A0(n1340), .A1(Add_Subt_result[23]), .B0(DmP[0]), .B1(
        n1318), .Y(n1323) );
  NAND2X1TS U1850 ( .A(Add_Subt_result[2]), .B(n1319), .Y(n1321) );
  AOI32X1TS U1851 ( .A0(n1323), .A1(n1322), .A2(n1321), .B0(n1320), .B1(n1328), 
        .Y(n1338) );
  AOI22X1TS U1852 ( .A0(n1327), .A1(n1336), .B0(n663), .B1(n1338), .Y(n1326)
         );
  AOI22X1TS U1853 ( .A0(n1339), .A1(n1332), .B0(n1333), .B1(n1324), .Y(n1325)
         );
  NAND2X1TS U1854 ( .A(n1326), .B(n1325), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[2]) );
  AOI22X1TS U1855 ( .A0(n1327), .A1(n1338), .B0(n657), .B1(n1336), .Y(n1335)
         );
  AOI22X1TS U1856 ( .A0(n1341), .A1(Add_Subt_result[1]), .B0(n1340), .B1(
        Add_Subt_result[24]), .Y(n1330) );
  AOI22X1TS U1857 ( .A0(n1331), .A1(n1330), .B0(n1329), .B1(n1328), .Y(n1348)
         );
  AOI22X1TS U1858 ( .A0(n1347), .A1(n1348), .B0(n1333), .B1(n1332), .Y(n1334)
         );
  NAND2X1TS U1859 ( .A(n1335), .B(n1334), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[1]) );
  AOI22X1TS U1860 ( .A0(n1339), .A1(n1338), .B0(n1337), .B1(n1336), .Y(n1351)
         );
  AOI22X1TS U1861 ( .A0(n1341), .A1(Add_Subt_result[0]), .B0(
        Add_Subt_result[25]), .B1(n1340), .Y(n1344) );
  AOI22X1TS U1862 ( .A0(n1345), .A1(n1344), .B0(n1343), .B1(n1342), .Y(n1346)
         );
  AOI22X1TS U1863 ( .A0(n1349), .A1(n1348), .B0(n1347), .B1(n1346), .Y(n1350)
         );
  NAND2X1TS U1864 ( .A(n1351), .B(n1350), .Y(
        Barrel_Shifter_module_Mux_Array_Data_array[0]) );
  OAI2BB2XLTS U1865 ( .B0(n1524), .B1(n1359), .A0N(final_result_ieee[22]), 
        .A1N(n1405), .Y(n13) );
  OAI2BB2XLTS U1866 ( .B0(n1502), .B1(n1359), .A0N(final_result_ieee[21]), 
        .A1N(n1405), .Y(n16) );
  OA22X1TS U1867 ( .A0(n1374), .A1(n1502), .B0(n1352), .B1(n653), .Y(n1354) );
  AOI22X1TS U1868 ( .A0(n1379), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[28]), .B0(n1356), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[49]), .Y(n1353) );
  OAI2BB2XLTS U1869 ( .B0(n1503), .B1(n1359), .A0N(final_result_ieee[20]), 
        .A1N(n1405), .Y(n20) );
  OA22X1TS U1870 ( .A0(n1374), .A1(n1503), .B0(n1355), .B1(n1371), .Y(n1358)
         );
  AOI22X1TS U1871 ( .A0(n1379), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[29]), .B0(n1356), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[48]), .Y(n1357) );
  CLKBUFX2TS U1872 ( .A(n1359), .Y(n1404) );
  OAI2BB2XLTS U1873 ( .B0(n1504), .B1(n1404), .A0N(final_result_ieee[19]), 
        .A1N(n1405), .Y(n24) );
  OA22X1TS U1874 ( .A0(n1374), .A1(n1504), .B0(n1360), .B1(n653), .Y(n1362) );
  AOI22X1TS U1875 ( .A0(n1379), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[30]), .B0(n1380), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[47]), .Y(n1361) );
  OAI2BB2XLTS U1876 ( .B0(n1505), .B1(n1404), .A0N(final_result_ieee[18]), 
        .A1N(n1405), .Y(n28) );
  OA22X1TS U1877 ( .A0(n1374), .A1(n1505), .B0(n1363), .B1(n653), .Y(n1365) );
  AOI22X1TS U1878 ( .A0(n1379), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[31]), .B0(n1380), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[46]), .Y(n1364) );
  INVX2TS U1879 ( .A(n1366), .Y(n1393) );
  OAI2BB2XLTS U1880 ( .B0(n1476), .B1(n1404), .A0N(final_result_ieee[17]), 
        .A1N(n1393), .Y(n32) );
  OA22X1TS U1881 ( .A0(n1374), .A1(n1476), .B0(n1367), .B1(n653), .Y(n1370) );
  AOI22X1TS U1882 ( .A0(n1379), .A1(
        Barrel_Shifter_module_Mux_Array_Data_array[32]), .B0(n1380), .B1(
        Barrel_Shifter_module_Mux_Array_Data_array[45]), .Y(n1369) );
  OAI2BB2XLTS U1883 ( .B0(n1477), .B1(n1404), .A0N(final_result_ieee[16]), 
        .A1N(n1393), .Y(n36) );
  OAI2BB2XLTS U1884 ( .B0(n1478), .B1(n1404), .A0N(final_result_ieee[15]), 
        .A1N(n1393), .Y(n40) );
  OAI2BB2XLTS U1885 ( .B0(n1463), .B1(n1404), .A0N(final_result_ieee[14]), 
        .A1N(n1393), .Y(n44) );
  OAI2BB2XLTS U1886 ( .B0(n1464), .B1(n1403), .A0N(final_result_ieee[13]), 
        .A1N(n1393), .Y(n48) );
  AOI22X1TS U1887 ( .A0(n660), .A1(Sgf_normalized_result[15]), .B0(n1379), 
        .B1(Barrel_Shifter_module_Mux_Array_Data_array[36]), .Y(n1378) );
  NOR2X1TS U1888 ( .A(n653), .B(n1372), .Y(n1396) );
  NOR2X1TS U1889 ( .A(n655), .B(n1372), .Y(n1397) );
  AOI22X1TS U1890 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .A1(
        n1396), .B0(Barrel_Shifter_module_Mux_Array_Data_array[49]), .B1(n1397), .Y(n1377) );
  NAND2X1TS U1891 ( .A(n1375), .B(n1374), .Y(n1400) );
  NAND2X1TS U1892 ( .A(n1380), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[41]), .Y(n1376) );
  OAI2BB2XLTS U1893 ( .B0(n1460), .B1(n1403), .A0N(final_result_ieee[8]), 
        .A1N(n1393), .Y(n50) );
  AOI22X1TS U1894 ( .A0(n661), .A1(Sgf_normalized_result[10]), .B0(n1379), 
        .B1(Barrel_Shifter_module_Mux_Array_Data_array[41]), .Y(n1383) );
  AOI22X1TS U1895 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[44]), .A1(
        n1397), .B0(Barrel_Shifter_module_Mux_Array_Data_array[49]), .B1(n1396), .Y(n1382) );
  NAND2X1TS U1896 ( .A(n1380), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[36]), .Y(n1381) );
  OAI2BB2XLTS U1897 ( .B0(n1465), .B1(n1403), .A0N(final_result_ieee[12]), 
        .A1N(n1393), .Y(n52) );
  AOI22X1TS U1898 ( .A0(n659), .A1(Sgf_normalized_result[14]), .B0(n1394), 
        .B1(Barrel_Shifter_module_Mux_Array_Data_array[37]), .Y(n1386) );
  AOI22X1TS U1899 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .A1(
        n1396), .B0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .B1(n1397), .Y(n1385) );
  NAND2X1TS U1900 ( .A(n1398), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[40]), .Y(n1384) );
  OAI2BB2XLTS U1901 ( .B0(n1461), .B1(n1403), .A0N(final_result_ieee[9]), 
        .A1N(n1393), .Y(n54) );
  AOI22X1TS U1902 ( .A0(n660), .A1(Sgf_normalized_result[11]), .B0(n1394), 
        .B1(Barrel_Shifter_module_Mux_Array_Data_array[40]), .Y(n1389) );
  AOI22X1TS U1903 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[45]), .A1(
        n1397), .B0(Barrel_Shifter_module_Mux_Array_Data_array[48]), .B1(n1396), .Y(n1388) );
  NAND2X1TS U1904 ( .A(n1398), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[37]), .Y(n1387) );
  OAI2BB2XLTS U1905 ( .B0(n1466), .B1(n1403), .A0N(final_result_ieee[11]), 
        .A1N(n1393), .Y(n56) );
  AOI22X1TS U1906 ( .A0(n661), .A1(Sgf_normalized_result[13]), .B0(n1394), 
        .B1(Barrel_Shifter_module_Mux_Array_Data_array[38]), .Y(n1392) );
  AOI22X1TS U1907 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .A1(
        n1396), .B0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .B1(n1397), .Y(n1391) );
  NAND2X1TS U1908 ( .A(n1398), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[39]), .Y(n1390) );
  OAI2BB2XLTS U1909 ( .B0(n1462), .B1(n1403), .A0N(final_result_ieee[10]), 
        .A1N(n1393), .Y(n58) );
  AOI22X1TS U1910 ( .A0(n659), .A1(Sgf_normalized_result[12]), .B0(n1394), 
        .B1(Barrel_Shifter_module_Mux_Array_Data_array[39]), .Y(n1402) );
  AOI22X1TS U1911 ( .A0(Barrel_Shifter_module_Mux_Array_Data_array[46]), .A1(
        n1397), .B0(Barrel_Shifter_module_Mux_Array_Data_array[47]), .B1(n1396), .Y(n1401) );
  NAND2X1TS U1912 ( .A(n1398), .B(
        Barrel_Shifter_module_Mux_Array_Data_array[38]), .Y(n1399) );
  OA22X1TS U1913 ( .A0(exp_oper_result[7]), .A1(n1403), .B0(n1407), .B1(
        final_result_ieee[30]), .Y(n60) );
  OA22X1TS U1914 ( .A0(exp_oper_result[5]), .A1(n1403), .B0(n1407), .B1(
        final_result_ieee[28]), .Y(n62) );
  OA22X1TS U1915 ( .A0(n1407), .A1(final_result_ieee[27]), .B0(
        exp_oper_result[4]), .B1(n1403), .Y(n63) );
  OA22X1TS U1916 ( .A0(n1407), .A1(final_result_ieee[26]), .B0(
        exp_oper_result[3]), .B1(n1404), .Y(n64) );
  OA22X1TS U1917 ( .A0(n1407), .A1(final_result_ieee[25]), .B0(
        exp_oper_result[2]), .B1(n1404), .Y(n65) );
  OA22X1TS U1918 ( .A0(n1407), .A1(final_result_ieee[24]), .B0(
        exp_oper_result[1]), .B1(n1404), .Y(n66) );
  OA22X1TS U1919 ( .A0(n1407), .A1(final_result_ieee[23]), .B0(
        exp_oper_result[0]), .B1(n1404), .Y(n67) );
  AOI21X1TS U1920 ( .A0(n1453), .A1(n1529), .B0(overflow_flag), .Y(n1406) );
  AO22XLTS U1921 ( .A0(n1407), .A1(n1406), .B0(n1405), .B1(
        final_result_ieee[31]), .Y(n68) );
  AOI21X1TS U1922 ( .A0(n1525), .A1(Add_Subt_result[20]), .B0(
        Add_Subt_result[22]), .Y(n1408) );
  AOI2BB1XLTS U1923 ( .A0N(n1408), .A1N(Add_Subt_result[23]), .B0(
        Add_Subt_result[24]), .Y(n1413) );
  INVX2TS U1924 ( .A(n1409), .Y(n1412) );
  AOI31XLTS U1925 ( .A0(Add_Subt_result[6]), .A1(n1415), .A2(n1522), .B0(n1414), .Y(n1421) );
  AOI31XLTS U1926 ( .A0(n1417), .A1(Add_Subt_result[8]), .A2(n1528), .B0(n1416), .Y(n1419) );
  AOI32X1TS U1927 ( .A0(n1421), .A1(n1420), .A2(n1419), .B0(n1531), .B1(n1418), 
        .Y(n73) );
  CLKBUFX2TS U1928 ( .A(n1431), .Y(n1432) );
  CLKBUFX2TS U1929 ( .A(n1431), .Y(n1428) );
  CLKBUFX2TS U1930 ( .A(n1430), .Y(n1435) );
  INVX2TS U1931 ( .A(n1435), .Y(n1423) );
  INVX2TS U1932 ( .A(n1435), .Y(n1424) );
  CLKBUFX2TS U1933 ( .A(n1431), .Y(n1425) );
  CLKBUFX2TS U1934 ( .A(n1431), .Y(n1426) );
  CLKBUFX2TS U1935 ( .A(n1431), .Y(n1429) );
  OAI2BB2XLTS U1936 ( .B0(n1430), .B1(n1518), .A0N(n1429), .A1N(Data_Y[17]), 
        .Y(n141) );
  OAI2BB2XLTS U1937 ( .B0(n1433), .B1(n1486), .A0N(n1432), .A1N(Data_Y[24]), 
        .Y(n162) );
  OAI2BB2XLTS U1938 ( .B0(n1428), .B1(n1447), .A0N(n1432), .A1N(Data_X[7]), 
        .Y(n190) );
  OAI2BB2XLTS U1939 ( .B0(n1428), .B1(n1482), .A0N(n1432), .A1N(Data_X[8]), 
        .Y(n191) );
  OAI2BB2XLTS U1940 ( .B0(n1428), .B1(n1488), .A0N(n1432), .A1N(Data_X[9]), 
        .Y(n192) );
  OAI2BB2XLTS U1941 ( .B0(n1428), .B1(n1506), .A0N(n1432), .A1N(Data_X[10]), 
        .Y(n193) );
  OAI2BB2XLTS U1942 ( .B0(n1428), .B1(n1481), .A0N(n1429), .A1N(Data_X[11]), 
        .Y(n194) );
  OAI2BB2XLTS U1943 ( .B0(n1435), .B1(n1444), .A0N(n1429), .A1N(Data_X[12]), 
        .Y(n195) );
  OAI2BB2XLTS U1944 ( .B0(n1435), .B1(n1442), .A0N(n1429), .A1N(Data_X[13]), 
        .Y(n196) );
  OAI2BB2XLTS U1945 ( .B0(n1430), .B1(n1487), .A0N(n1429), .A1N(Data_X[14]), 
        .Y(n197) );
  OAI2BB2XLTS U1946 ( .B0(n1435), .B1(n1479), .A0N(n1429), .A1N(Data_X[15]), 
        .Y(n198) );
  OAI2BB2XLTS U1947 ( .B0(n1435), .B1(n1509), .A0N(n1429), .A1N(Data_X[16]), 
        .Y(n199) );
  OAI2BB2XLTS U1948 ( .B0(n1430), .B1(n1494), .A0N(n1429), .A1N(Data_X[17]), 
        .Y(n200) );
  OAI2BB2XLTS U1949 ( .B0(n1430), .B1(n1484), .A0N(n1429), .A1N(Data_X[18]), 
        .Y(n201) );
  OAI2BB2XLTS U1950 ( .B0(n1430), .B1(n1436), .A0N(n1429), .A1N(Data_X[19]), 
        .Y(n202) );
  CLKBUFX2TS U1951 ( .A(n1431), .Y(n1434) );
  OAI2BB2XLTS U1952 ( .B0(n1435), .B1(n1445), .A0N(n1434), .A1N(Data_X[20]), 
        .Y(n203) );
  OAI2BB2XLTS U1953 ( .B0(n1433), .B1(n1480), .A0N(n1434), .A1N(Data_X[21]), 
        .Y(n204) );
  OAI2BB2XLTS U1954 ( .B0(n1433), .B1(n1446), .A0N(n1434), .A1N(Data_X[22]), 
        .Y(n205) );
  OAI2BB2XLTS U1955 ( .B0(n1433), .B1(n1483), .A0N(n1434), .A1N(Data_X[23]), 
        .Y(n206) );
  OAI2BB2XLTS U1956 ( .B0(n1433), .B1(n1443), .A0N(n1434), .A1N(Data_X[25]), 
        .Y(n208) );
  OAI2BB2XLTS U1957 ( .B0(n1433), .B1(n1485), .A0N(n1434), .A1N(Data_X[26]), 
        .Y(n209) );
  OAI2BB2XLTS U1958 ( .B0(n1433), .B1(n1489), .A0N(n1434), .A1N(Data_X[27]), 
        .Y(n210) );
  OAI2BB2XLTS U1959 ( .B0(n1433), .B1(n1501), .A0N(n1434), .A1N(Data_X[28]), 
        .Y(n211) );
  OAI2BB2XLTS U1960 ( .B0(n1435), .B1(n1441), .A0N(n1434), .A1N(Data_X[29]), 
        .Y(n212) );
  OAI2BB2XLTS U1961 ( .B0(n1435), .B1(n1440), .A0N(n1434), .A1N(Data_X[30]), 
        .Y(n213) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule

