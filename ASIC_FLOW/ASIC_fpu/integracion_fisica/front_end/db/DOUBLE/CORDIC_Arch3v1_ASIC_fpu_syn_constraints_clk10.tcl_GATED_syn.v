/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:16:43 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4_78 ( CLK, EN, ENCLK, TE
 );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_21 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_23 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_24 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_26 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_27 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_29 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_32 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module CORDIC_Arch3v1_W64_EW11_SW52_SWR55_EWR6 ( clk, rst, beg_fsm_cordic, 
        ack_cordic, operation, data_in, shift_region_flag, ready_cordic, 
        data_output, beg_add_subt, add_subt_dataA, add_subt_dataB, 
        result_add_subt, op_add_subt, ready_add_subt, enab_cont_iter );
  input [63:0] data_in;
  input [1:0] shift_region_flag;
  output [63:0] data_output;
  output [63:0] add_subt_dataA;
  output [63:0] add_subt_dataB;
  input [63:0] result_add_subt;
  input clk, rst, beg_fsm_cordic, ack_cordic, operation, ready_add_subt;
  output ready_cordic, beg_add_subt, op_add_subt, enab_cont_iter;
  wire   enab_d_ff4_Zn, enab_d_ff_RB1, enab_RB3, enab_d_ff5_data_out,
         d_ff1_operation_out, d_ff3_sign_out, enab_d_ff4_Yn, enab_d_ff4_Xn,
         fmtted_Result_63_, ITER_CONT_net3830596, ITER_CONT_N4, ITER_CONT_N3,
         d_ff5_data_out_net3830560, reg_Z0_net3830560,
         reg_val_muxZ_2stage_net3830560, reg_shift_y_net3830560,
         d_ff4_Xn_net3830560, d_ff4_Yn_net3830560, d_ff4_Zn_net3830560, n960,
         n961, n962, n963, n964, n965, n966, n967, n968, n969, n970, n971,
         n972, n973, n974, n975, n976, n977, n978, n979, n980, n981, n982,
         n983, n984, n985, n986, n987, n988, n989, n990, n992, n993, n994,
         n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         intadd_459_CI, intadd_459_n3, intadd_459_n2, intadd_459_n1,
         intadd_460_CI, intadd_460_n3, intadd_460_n2, intadd_460_n1, n1134,
         n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144,
         n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154,
         n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164,
         n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174,
         n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184,
         n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194,
         n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204,
         n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214,
         n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224,
         n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234,
         n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244,
         n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254,
         n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264,
         n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274,
         n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284,
         n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294,
         n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304,
         n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314,
         n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324,
         n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334,
         n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344,
         n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354,
         n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364,
         n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374,
         n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384,
         n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404,
         n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414,
         n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424,
         n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434,
         n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444,
         n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454,
         n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464,
         n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474,
         n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484,
         n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494,
         n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504,
         n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514,
         n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524,
         n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534;
  wire   [3:1] cont_iter_out;
  wire   [1:0] cont_var_out;
  wire   [1:0] d_ff1_shift_region_flag_out;
  wire   [63:0] d_ff1_Z;
  wire   [63:0] d_ff_Xn;
  wire   [63:0] first_mux_X;
  wire   [63:0] d_ff_Yn;
  wire   [63:0] first_mux_Y;
  wire   [63:0] d_ff_Zn;
  wire   [63:0] first_mux_Z;
  wire   [63:0] d_ff2_X;
  wire   [63:0] d_ff2_Y;
  wire   [63:0] d_ff2_Z;
  wire   [10:0] sh_exp_x;
  wire   [10:0] sh_exp_y;
  wire   [54:0] data_out_LUT;
  wire   [63:0] d_ff3_sh_x_out;
  wire   [63:0] d_ff3_sh_y_out;
  wire   [56:0] d_ff3_LUT_out;
  wire   [62:0] mux_sal;
  wire   [7:0] inst_CORDIC_FSM_v3_state_next;
  wire   [7:0] inst_CORDIC_FSM_v3_state_reg;

  SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4_78 ITER_CONT_clk_gate_temp_reg ( 
        .CLK(clk), .EN(enab_cont_iter), .ENCLK(ITER_CONT_net3830596), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_21 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3830560), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_32 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff_RB1), .ENCLK(reg_Z0_net3830560), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_29 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(inst_CORDIC_FSM_v3_state_next[3]), .ENCLK(
        reg_val_muxZ_2stage_net3830560), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_27 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_RB3), .ENCLK(reg_shift_y_net3830560), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_26 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3830560), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_24 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3830560), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_23 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3830560), .TE(1'b0) );
  DFFRXLTS ITER_CONT_temp_reg_1_ ( .D(ITER_CONT_N3), .CK(ITER_CONT_net3830596), 
        .RN(n1517), .Q(cont_iter_out[1]), .QN(n1135) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3830560), .RN(n1516), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n1144) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(data_out_LUT[0]), .CK(reg_shift_y_net3830560), 
        .RN(n1515), .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n968), .CK(reg_shift_y_net3830560), .RN(n1515), .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n990), .CK(reg_shift_y_net3830560), .RN(n1515), .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n962), .CK(reg_shift_y_net3830560), .RN(n1515), .Q(d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(n971), .CK(reg_shift_y_net3830560), .RN(n1515), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(n994), .CK(reg_shift_y_net3830560), .RN(n1515), .Q(d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(data_out_LUT[6]), .CK(reg_shift_y_net3830560), 
        .RN(n1515), .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n989), .CK(reg_shift_y_net3830560), .RN(n1515), .Q(d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n993), .CK(reg_shift_y_net3830560), .RN(n1515), .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n963), .CK(reg_shift_y_net3830560), .RN(n1525), .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n982), .CK(reg_shift_y_net3830560), .RN(
        n1525), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(n965), .CK(reg_shift_y_net3830560), .RN(
        n1150), .Q(d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n999), .CK(reg_shift_y_net3830560), .RN(
        n1150), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n969), .CK(reg_shift_y_net3830560), .RN(
        n1525), .Q(d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(n987), .CK(reg_shift_y_net3830560), .RN(
        n1523), .Q(d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n964), .CK(reg_shift_y_net3830560), .RN(
        n1525), .Q(d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(n992), .CK(reg_shift_y_net3830560), .RN(
        n1518), .Q(d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_17_ ( .D(n995), .CK(reg_shift_y_net3830560), .RN(
        n1523), .Q(d_ff3_LUT_out[17]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(n973), .CK(reg_shift_y_net3830560), .RN(
        n1522), .Q(d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n996), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(n1000), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n970), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(n1003), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n979), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n978), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(n984), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n980), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(n966), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[27]) );
  DFFRXLTS reg_LUT_Q_reg_28_ ( .D(n975), .CK(reg_shift_y_net3830560), .RN(
        n1514), .Q(d_ff3_LUT_out[28]) );
  DFFRXLTS reg_LUT_Q_reg_29_ ( .D(n986), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[29]) );
  DFFRXLTS reg_LUT_Q_reg_31_ ( .D(n981), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[31]) );
  DFFRXLTS reg_LUT_Q_reg_32_ ( .D(n974), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[32]) );
  DFFRXLTS reg_LUT_Q_reg_33_ ( .D(n967), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[33]) );
  DFFRXLTS reg_LUT_Q_reg_34_ ( .D(n976), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[34]) );
  DFFRXLTS reg_LUT_Q_reg_35_ ( .D(n972), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[35]) );
  DFFRXLTS reg_LUT_Q_reg_37_ ( .D(n1146), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[37]) );
  DFFRXLTS reg_LUT_Q_reg_39_ ( .D(data_out_LUT[39]), .CK(
        reg_shift_y_net3830560), .RN(n1513), .Q(d_ff3_LUT_out[39]) );
  DFFRXLTS reg_LUT_Q_reg_41_ ( .D(n977), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[41]) );
  DFFRXLTS reg_LUT_Q_reg_42_ ( .D(n998), .CK(reg_shift_y_net3830560), .RN(
        n1513), .Q(d_ff3_LUT_out[42]) );
  DFFRXLTS reg_LUT_Q_reg_44_ ( .D(n1002), .CK(reg_shift_y_net3830560), .RN(
        n1512), .Q(d_ff3_LUT_out[44]) );
  DFFRXLTS reg_LUT_Q_reg_45_ ( .D(n1001), .CK(reg_shift_y_net3830560), .RN(
        n1512), .Q(d_ff3_LUT_out[45]) );
  DFFRXLTS reg_LUT_Q_reg_50_ ( .D(n997), .CK(reg_shift_y_net3830560), .RN(
        n1512), .Q(d_ff3_LUT_out[50]) );
  DFFRXLTS reg_LUT_Q_reg_52_ ( .D(n1145), .CK(reg_shift_y_net3830560), .RN(
        n1512), .Q(d_ff3_LUT_out[52]) );
  DFFRXLTS reg_LUT_Q_reg_53_ ( .D(n988), .CK(reg_shift_y_net3830560), .RN(
        n1512), .Q(d_ff3_LUT_out[53]) );
  DFFRXLTS reg_LUT_Q_reg_54_ ( .D(data_out_LUT[54]), .CK(
        reg_shift_y_net3830560), .RN(n1512), .Q(d_ff3_LUT_out[54]) );
  DFFRXLTS reg_LUT_Q_reg_55_ ( .D(n983), .CK(reg_shift_y_net3830560), .RN(
        n1512), .Q(d_ff3_LUT_out[55]) );
  DFFRXLTS reg_LUT_Q_reg_56_ ( .D(n985), .CK(reg_shift_y_net3830560), .RN(
        n1512), .Q(d_ff3_LUT_out[56]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3830560), .RN(n1512), .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3830560), .RN(n1512), .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3830560), .RN(n1511), .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3830560), .RN(n1511), .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3830560), .RN(n1511), .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3830560), .RN(n1511), .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3830560), .RN(n1511), .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3830560), .RN(n1511), .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3830560), .RN(n1511), .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3830560), .RN(n1511), .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3830560), .RN(
        n1511), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3830560), .RN(
        n1511), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3830560), .RN(
        n1510), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3830560), .RN(
        n1509), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_Z0_Q_reg_32_ ( .D(data_in[32]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[32]) );
  DFFRXLTS reg_Z0_Q_reg_33_ ( .D(data_in[33]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[33]) );
  DFFRXLTS reg_Z0_Q_reg_34_ ( .D(data_in[34]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[34]) );
  DFFRXLTS reg_Z0_Q_reg_35_ ( .D(data_in[35]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[35]) );
  DFFRXLTS reg_Z0_Q_reg_36_ ( .D(data_in[36]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[36]) );
  DFFRXLTS reg_Z0_Q_reg_37_ ( .D(data_in[37]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[37]) );
  DFFRXLTS reg_Z0_Q_reg_38_ ( .D(data_in[38]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[38]) );
  DFFRXLTS reg_Z0_Q_reg_39_ ( .D(data_in[39]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[39]) );
  DFFRXLTS reg_Z0_Q_reg_40_ ( .D(data_in[40]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[40]) );
  DFFRXLTS reg_Z0_Q_reg_41_ ( .D(data_in[41]), .CK(reg_Z0_net3830560), .RN(
        n1508), .Q(d_ff1_Z[41]) );
  DFFRXLTS reg_Z0_Q_reg_42_ ( .D(data_in[42]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[42]) );
  DFFRXLTS reg_Z0_Q_reg_43_ ( .D(data_in[43]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[43]) );
  DFFRXLTS reg_Z0_Q_reg_44_ ( .D(data_in[44]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[44]) );
  DFFRXLTS reg_Z0_Q_reg_45_ ( .D(data_in[45]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[45]) );
  DFFRXLTS reg_Z0_Q_reg_46_ ( .D(data_in[46]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[46]) );
  DFFRXLTS reg_Z0_Q_reg_47_ ( .D(data_in[47]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[47]) );
  DFFRXLTS reg_Z0_Q_reg_48_ ( .D(data_in[48]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[48]) );
  DFFRXLTS reg_Z0_Q_reg_49_ ( .D(data_in[49]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[49]) );
  DFFRXLTS reg_Z0_Q_reg_50_ ( .D(data_in[50]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[50]) );
  DFFRXLTS reg_Z0_Q_reg_51_ ( .D(data_in[51]), .CK(reg_Z0_net3830560), .RN(
        n1507), .Q(d_ff1_Z[51]) );
  DFFRXLTS reg_Z0_Q_reg_52_ ( .D(data_in[52]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[52]) );
  DFFRXLTS reg_Z0_Q_reg_53_ ( .D(data_in[53]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[53]) );
  DFFRXLTS reg_Z0_Q_reg_54_ ( .D(data_in[54]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[54]) );
  DFFRXLTS reg_Z0_Q_reg_55_ ( .D(data_in[55]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[55]) );
  DFFRXLTS reg_Z0_Q_reg_56_ ( .D(data_in[56]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[56]) );
  DFFRXLTS reg_Z0_Q_reg_57_ ( .D(data_in[57]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[57]) );
  DFFRXLTS reg_Z0_Q_reg_58_ ( .D(data_in[58]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[58]) );
  DFFRXLTS reg_Z0_Q_reg_59_ ( .D(data_in[59]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[59]) );
  DFFRXLTS reg_Z0_Q_reg_60_ ( .D(data_in[60]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[60]) );
  DFFRXLTS reg_Z0_Q_reg_61_ ( .D(data_in[61]), .CK(reg_Z0_net3830560), .RN(
        n1506), .Q(d_ff1_Z[61]) );
  DFFRXLTS reg_Z0_Q_reg_62_ ( .D(data_in[62]), .CK(reg_Z0_net3830560), .RN(
        n1505), .Q(d_ff1_Z[62]) );
  DFFRXLTS reg_Z0_Q_reg_63_ ( .D(data_in[63]), .CK(reg_Z0_net3830560), .RN(
        n1505), .Q(d_ff1_Z[63]) );
  DFFRXLTS reg_shift_x_Q_reg_52_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3830560), .RN(n1505), .Q(d_ff3_sh_x_out[52]) );
  DFFRXLTS reg_shift_x_Q_reg_53_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3830560), .RN(n1505), .Q(d_ff3_sh_x_out[53]) );
  DFFRXLTS reg_shift_x_Q_reg_54_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3830560), .RN(n1505), .Q(d_ff3_sh_x_out[54]) );
  DFFRXLTS reg_shift_x_Q_reg_55_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3830560), .RN(n1505), .Q(d_ff3_sh_x_out[55]) );
  DFFRXLTS reg_shift_x_Q_reg_56_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3830560), .RN(n1505), .Q(d_ff3_sh_x_out[56]) );
  DFFRXLTS reg_shift_x_Q_reg_57_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3830560), .RN(n1505), .Q(d_ff3_sh_x_out[57]) );
  DFFRXLTS reg_shift_x_Q_reg_58_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3830560), .RN(n1505), .Q(d_ff3_sh_x_out[58]) );
  DFFRXLTS reg_shift_x_Q_reg_59_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3830560), .RN(n1505), .Q(d_ff3_sh_x_out[59]) );
  DFFRXLTS reg_shift_x_Q_reg_60_ ( .D(sh_exp_x[8]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_x_out[60]) );
  DFFRXLTS reg_shift_x_Q_reg_61_ ( .D(sh_exp_x[9]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_x_out[61]) );
  DFFRXLTS reg_shift_x_Q_reg_62_ ( .D(sh_exp_x[10]), .CK(
        reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_x_out[62]) );
  DFFRXLTS reg_shift_y_Q_reg_52_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_y_out[52]) );
  DFFRXLTS reg_shift_y_Q_reg_53_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_y_out[53]) );
  DFFRXLTS reg_shift_y_Q_reg_54_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_y_out[54]) );
  DFFRXLTS reg_shift_y_Q_reg_55_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_y_out[55]) );
  DFFRXLTS reg_shift_y_Q_reg_56_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_y_out[56]) );
  DFFRXLTS reg_shift_y_Q_reg_57_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_y_out[57]) );
  DFFRXLTS reg_shift_y_Q_reg_58_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3830560), .RN(n1504), .Q(d_ff3_sh_y_out[58]) );
  DFFRXLTS reg_shift_y_Q_reg_59_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3830560), .RN(n1503), .Q(d_ff3_sh_y_out[59]) );
  DFFRXLTS reg_shift_y_Q_reg_60_ ( .D(sh_exp_y[8]), .CK(reg_shift_y_net3830560), .RN(n1503), .Q(d_ff3_sh_y_out[60]) );
  DFFRXLTS reg_shift_y_Q_reg_61_ ( .D(sh_exp_y[9]), .CK(reg_shift_y_net3830560), .RN(n1503), .Q(d_ff3_sh_y_out[61]) );
  DFFRXLTS reg_shift_y_Q_reg_62_ ( .D(sh_exp_y[10]), .CK(
        reg_shift_y_net3830560), .RN(n1503), .Q(d_ff3_sh_y_out[62]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3830560), .RN(n1503), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1503), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3830560), 
        .RN(n1503), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3830560), .RN(n1503), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1503), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3830560), 
        .RN(n1503), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3830560), .RN(n1502), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1502), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3830560), 
        .RN(n1502), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3830560), .RN(n1502), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1502), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3830560), 
        .RN(n1502), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3830560), .RN(n1502), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1502), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3830560), 
        .RN(n1502), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3830560), .RN(n1502), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1501), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3830560), 
        .RN(n1501), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3830560), .RN(n1501), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1501), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3830560), 
        .RN(n1501), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3830560), .RN(n1501), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1501), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3830560), 
        .RN(n1501), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3830560), .RN(n1501), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1501), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3830560), 
        .RN(n1521), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3830560), .RN(n1520), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1524), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3830560), 
        .RN(n1521), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3830560), .RN(n1520), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1524), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3830560), .RN(n1521), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3830560), .RN(n1520), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1524), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3830560), .RN(n1521), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3830560), .RN(n1500), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1500), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3830560), .RN(n1500), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3830560), .RN(n1500), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1500), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3830560), .RN(n1500), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3830560), .RN(n1500), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1500), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3830560), .RN(n1500), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3830560), .RN(n1500), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1499), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3830560), .RN(n1499), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3830560), .RN(n1499), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1499), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3830560), .RN(n1499), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3830560), .RN(n1499), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1499), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3830560), .RN(n1499), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3830560), .RN(n1499), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1499), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3830560), .RN(n1498), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3830560), .RN(n1498), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1498), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3830560), .RN(n1498), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3830560), .RN(n1498), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1498), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3830560), .RN(n1498), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3830560), .RN(n1498), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1498), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3830560), .RN(n1498), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3830560), .RN(n1497), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1497), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3830560), .RN(n1497), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3830560), .RN(n1497), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1497), .Q(d_ff2_X[23]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(d_ff2_X[23]), .CK(reg_shift_y_net3830560), .RN(n1497), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3830560), .RN(n1497), .Q(d_ff_Xn[24]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1497), .Q(d_ff2_X[24]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(d_ff2_X[24]), .CK(reg_shift_y_net3830560), .RN(n1497), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3830560), .RN(n1497), .Q(d_ff_Xn[25]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1496), .Q(d_ff2_X[25]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(d_ff2_X[25]), .CK(reg_shift_y_net3830560), .RN(n1496), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3830560), .RN(n1496), .Q(d_ff_Xn[26]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1496), .Q(d_ff2_X[26]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(d_ff2_X[26]), .CK(reg_shift_y_net3830560), .RN(n1496), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3830560), .RN(n1496), .Q(d_ff_Xn[27]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1496), .Q(d_ff2_X[27]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(d_ff2_X[27]), .CK(reg_shift_y_net3830560), .RN(n1496), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3830560), .RN(n1496), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1496), .Q(d_ff2_X[28]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(d_ff2_X[28]), .CK(reg_shift_y_net3830560), .RN(n1524), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3830560), .RN(n1519), .Q(d_ff_Xn[29]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1533), .Q(d_ff2_X[29]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(d_ff2_X[29]), .CK(reg_shift_y_net3830560), .RN(n1150), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3830560), .RN(n1519), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1530), .Q(d_ff2_X[30]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(d_ff2_X[30]), .CK(reg_shift_y_net3830560), .RN(n1525), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3830560), .RN(n1519), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1533), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3830560), .RN(n1518), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Xn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Xn_net3830560), .RN(n1495), .Q(d_ff_Xn[32]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_32_ ( .D(first_mux_X[32]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1495), .Q(d_ff2_X[32]) );
  DFFRXLTS reg_shift_x_Q_reg_32_ ( .D(d_ff2_X[32]), .CK(reg_shift_y_net3830560), .RN(n1495), .Q(d_ff3_sh_x_out[32]) );
  DFFRXLTS d_ff4_Xn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Xn_net3830560), .RN(n1495), .Q(d_ff_Xn[33]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_33_ ( .D(first_mux_X[33]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1495), .Q(d_ff2_X[33]) );
  DFFRXLTS reg_shift_x_Q_reg_33_ ( .D(d_ff2_X[33]), .CK(reg_shift_y_net3830560), .RN(n1495), .Q(d_ff3_sh_x_out[33]) );
  DFFRXLTS d_ff4_Xn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Xn_net3830560), .RN(n1495), .Q(d_ff_Xn[34]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_34_ ( .D(first_mux_X[34]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1495), .Q(d_ff2_X[34]) );
  DFFRXLTS reg_shift_x_Q_reg_34_ ( .D(d_ff2_X[34]), .CK(reg_shift_y_net3830560), .RN(n1495), .Q(d_ff3_sh_x_out[34]) );
  DFFRXLTS d_ff4_Xn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Xn_net3830560), .RN(n1495), .Q(d_ff_Xn[35]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_35_ ( .D(first_mux_X[35]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1494), .Q(d_ff2_X[35]) );
  DFFRXLTS reg_shift_x_Q_reg_35_ ( .D(d_ff2_X[35]), .CK(reg_shift_y_net3830560), .RN(n1494), .Q(d_ff3_sh_x_out[35]) );
  DFFRXLTS d_ff4_Xn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Xn_net3830560), .RN(n1494), .Q(d_ff_Xn[36]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_36_ ( .D(first_mux_X[36]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1494), .Q(d_ff2_X[36]) );
  DFFRXLTS reg_shift_x_Q_reg_36_ ( .D(d_ff2_X[36]), .CK(reg_shift_y_net3830560), .RN(n1494), .Q(d_ff3_sh_x_out[36]) );
  DFFRXLTS d_ff4_Xn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Xn_net3830560), .RN(n1494), .Q(d_ff_Xn[37]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_37_ ( .D(first_mux_X[37]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1494), .Q(d_ff2_X[37]) );
  DFFRXLTS reg_shift_x_Q_reg_37_ ( .D(d_ff2_X[37]), .CK(reg_shift_y_net3830560), .RN(n1494), .Q(d_ff3_sh_x_out[37]) );
  DFFRXLTS d_ff4_Xn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Xn_net3830560), .RN(n1494), .Q(d_ff_Xn[38]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_38_ ( .D(first_mux_X[38]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1494), .Q(d_ff2_X[38]) );
  DFFRXLTS reg_shift_x_Q_reg_38_ ( .D(d_ff2_X[38]), .CK(reg_shift_y_net3830560), .RN(n1522), .Q(d_ff3_sh_x_out[38]) );
  DFFRXLTS d_ff4_Xn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Xn_net3830560), .RN(n1523), .Q(d_ff_Xn[39]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_39_ ( .D(first_mux_X[39]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1518), .Q(d_ff2_X[39]) );
  DFFRXLTS reg_shift_x_Q_reg_39_ ( .D(d_ff2_X[39]), .CK(reg_shift_y_net3830560), .RN(n1522), .Q(d_ff3_sh_x_out[39]) );
  DFFRXLTS d_ff4_Xn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Xn_net3830560), .RN(n1523), .Q(d_ff_Xn[40]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_40_ ( .D(first_mux_X[40]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1518), .Q(d_ff2_X[40]) );
  DFFRXLTS reg_shift_x_Q_reg_40_ ( .D(d_ff2_X[40]), .CK(reg_shift_y_net3830560), .RN(n1522), .Q(d_ff3_sh_x_out[40]) );
  DFFRXLTS d_ff4_Xn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Xn_net3830560), .RN(n1523), .Q(d_ff_Xn[41]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_41_ ( .D(first_mux_X[41]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1518), .Q(d_ff2_X[41]) );
  DFFRXLTS reg_shift_x_Q_reg_41_ ( .D(d_ff2_X[41]), .CK(reg_shift_y_net3830560), .RN(n1522), .Q(d_ff3_sh_x_out[41]) );
  DFFRXLTS d_ff4_Xn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Xn_net3830560), .RN(n1493), .Q(d_ff_Xn[42]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_42_ ( .D(first_mux_X[42]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1493), .Q(d_ff2_X[42]) );
  DFFRXLTS reg_shift_x_Q_reg_42_ ( .D(d_ff2_X[42]), .CK(reg_shift_y_net3830560), .RN(n1493), .Q(d_ff3_sh_x_out[42]) );
  DFFRXLTS d_ff4_Xn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Xn_net3830560), .RN(n1493), .Q(d_ff_Xn[43]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_43_ ( .D(first_mux_X[43]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1493), .Q(d_ff2_X[43]) );
  DFFRXLTS reg_shift_x_Q_reg_43_ ( .D(d_ff2_X[43]), .CK(reg_shift_y_net3830560), .RN(n1493), .Q(d_ff3_sh_x_out[43]) );
  DFFRXLTS d_ff4_Xn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Xn_net3830560), .RN(n1493), .Q(d_ff_Xn[44]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_44_ ( .D(first_mux_X[44]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1493), .Q(d_ff2_X[44]) );
  DFFRXLTS reg_shift_x_Q_reg_44_ ( .D(d_ff2_X[44]), .CK(reg_shift_y_net3830560), .RN(n1493), .Q(d_ff3_sh_x_out[44]) );
  DFFRXLTS d_ff4_Xn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Xn_net3830560), .RN(n1493), .Q(d_ff_Xn[45]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_45_ ( .D(first_mux_X[45]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1492), .Q(d_ff2_X[45]) );
  DFFRXLTS reg_shift_x_Q_reg_45_ ( .D(d_ff2_X[45]), .CK(reg_shift_y_net3830560), .RN(n1492), .Q(d_ff3_sh_x_out[45]) );
  DFFRXLTS d_ff4_Xn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Xn_net3830560), .RN(n1492), .Q(d_ff_Xn[46]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_46_ ( .D(first_mux_X[46]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1492), .Q(d_ff2_X[46]) );
  DFFRXLTS reg_shift_x_Q_reg_46_ ( .D(d_ff2_X[46]), .CK(reg_shift_y_net3830560), .RN(n1492), .Q(d_ff3_sh_x_out[46]) );
  DFFRXLTS d_ff4_Xn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Xn_net3830560), .RN(n1492), .Q(d_ff_Xn[47]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_47_ ( .D(first_mux_X[47]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1492), .Q(d_ff2_X[47]) );
  DFFRXLTS reg_shift_x_Q_reg_47_ ( .D(d_ff2_X[47]), .CK(reg_shift_y_net3830560), .RN(n1492), .Q(d_ff3_sh_x_out[47]) );
  DFFRXLTS d_ff4_Xn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Xn_net3830560), .RN(n1492), .Q(d_ff_Xn[48]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_48_ ( .D(first_mux_X[48]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1492), .Q(d_ff2_X[48]) );
  DFFRXLTS reg_shift_x_Q_reg_48_ ( .D(d_ff2_X[48]), .CK(reg_shift_y_net3830560), .RN(n1491), .Q(d_ff3_sh_x_out[48]) );
  DFFRXLTS d_ff4_Xn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Xn_net3830560), .RN(n1491), .Q(d_ff_Xn[49]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_49_ ( .D(first_mux_X[49]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1491), .Q(d_ff2_X[49]) );
  DFFRXLTS reg_shift_x_Q_reg_49_ ( .D(d_ff2_X[49]), .CK(reg_shift_y_net3830560), .RN(n1491), .Q(d_ff3_sh_x_out[49]) );
  DFFRXLTS d_ff4_Xn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Xn_net3830560), .RN(n1491), .Q(d_ff_Xn[50]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_50_ ( .D(first_mux_X[50]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1491), .Q(d_ff2_X[50]) );
  DFFRXLTS reg_shift_x_Q_reg_50_ ( .D(d_ff2_X[50]), .CK(reg_shift_y_net3830560), .RN(n1491), .Q(d_ff3_sh_x_out[50]) );
  DFFRXLTS d_ff4_Xn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Xn_net3830560), .RN(n1491), .Q(d_ff_Xn[51]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_51_ ( .D(first_mux_X[51]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1491), .Q(d_ff2_X[51]) );
  DFFRXLTS reg_shift_x_Q_reg_51_ ( .D(d_ff2_X[51]), .CK(reg_shift_y_net3830560), .RN(n1491), .Q(d_ff3_sh_x_out[51]) );
  DFFRXLTS d_ff4_Xn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Xn_net3830560), .RN(n1490), .Q(d_ff_Xn[52]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_52_ ( .D(first_mux_X[52]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1490), .Q(d_ff2_X[52]), .QN(
        n1445) );
  DFFRXLTS d_ff4_Xn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Xn_net3830560), .RN(n1490), .Q(d_ff_Xn[53]) );
  DFFRXLTS d_ff4_Xn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Xn_net3830560), .RN(n1490), .Q(d_ff_Xn[54]) );
  DFFRXLTS d_ff4_Xn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Xn_net3830560), .RN(n1490), .Q(d_ff_Xn[55]) );
  DFFRXLTS d_ff4_Xn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Xn_net3830560), .RN(n1490), .Q(d_ff_Xn[56]) );
  DFFRXLTS d_ff4_Xn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Xn_net3830560), .RN(n1489), .Q(d_ff_Xn[57]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_57_ ( .D(first_mux_X[57]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1489), .Q(d_ff2_X[57]), .QN(
        n1451) );
  DFFRXLTS d_ff4_Xn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Xn_net3830560), .RN(n1489), .Q(d_ff_Xn[58]) );
  DFFRXLTS d_ff4_Xn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Xn_net3830560), .RN(n1489), .Q(d_ff_Xn[59]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_59_ ( .D(first_mux_X[59]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1489), .Q(d_ff2_X[59]) );
  DFFRXLTS d_ff4_Xn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Xn_net3830560), .RN(n1489), .Q(d_ff_Xn[60]) );
  DFFRXLTS d_ff4_Xn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Xn_net3830560), .RN(n1489), .Q(d_ff_Xn[61]) );
  DFFRXLTS d_ff4_Xn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Xn_net3830560), .RN(n1488), .Q(d_ff_Xn[62]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_62_ ( .D(first_mux_X[62]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1488), .Q(d_ff2_X[62]) );
  DFFRXLTS d_ff4_Xn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Xn_net3830560), .RN(n1488), .Q(d_ff_Xn[63]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_63_ ( .D(first_mux_X[63]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1488), .Q(d_ff2_X[63]) );
  DFFRXLTS reg_shift_x_Q_reg_63_ ( .D(d_ff2_X[63]), .CK(reg_shift_y_net3830560), .RN(n1488), .Q(d_ff3_sh_x_out[63]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3830560), .RN(n1488), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1488), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3830560), 
        .RN(n1488), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3830560), .RN(n1488), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1487), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3830560), 
        .RN(n1487), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3830560), .RN(n1487), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1487), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3830560), 
        .RN(n1487), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3830560), .RN(n1487), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1487), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3830560), 
        .RN(n1487), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3830560), .RN(n1486), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1486), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3830560), 
        .RN(n1486), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3830560), .RN(n1486), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1486), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3830560), 
        .RN(n1486), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3830560), .RN(n1486), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1485), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3830560), 
        .RN(n1485), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3830560), .RN(n1485), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1485), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3830560), 
        .RN(n1485), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3830560), .RN(n1485), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1485), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3830560), 
        .RN(n1485), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3830560), .RN(n1484), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1484), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3830560), 
        .RN(n1484), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3830560), .RN(n1484), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1484), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3830560), .RN(n1484), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3830560), .RN(n1484), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1483), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3830560), .RN(n1483), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3830560), .RN(n1483), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1483), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3830560), .RN(n1483), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3830560), .RN(n1483), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1483), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3830560), .RN(n1483), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3830560), .RN(n1482), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1482), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3830560), .RN(n1482), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3830560), .RN(n1482), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1482), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3830560), .RN(n1482), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3830560), .RN(n1482), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1481), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3830560), .RN(n1481), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3830560), .RN(n1481), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1481), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3830560), .RN(n1481), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3830560), .RN(n1481), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1481), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3830560), .RN(n1481), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3830560), .RN(n1480), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1480), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3830560), .RN(n1480), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3830560), .RN(n1480), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1480), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3830560), .RN(n1480), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3830560), .RN(n1480), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1479), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3830560), .RN(n1479), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3830560), .RN(n1479), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1479), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3830560), .RN(n1479), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3830560), .RN(n1479), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1479), .Q(d_ff2_Y[23]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(d_ff2_Y[23]), .CK(reg_shift_y_net3830560), .RN(n1479), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3830560), .RN(n1478), .Q(d_ff_Yn[24]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1478), .Q(d_ff2_Y[24]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(d_ff2_Y[24]), .CK(reg_shift_y_net3830560), .RN(n1478), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3830560), .RN(n1478), .Q(d_ff_Yn[25]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1478), .Q(d_ff2_Y[25]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(d_ff2_Y[25]), .CK(reg_shift_y_net3830560), .RN(n1478), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3830560), .RN(n1478), .Q(d_ff_Yn[26]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1477), .Q(d_ff2_Y[26]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(d_ff2_Y[26]), .CK(reg_shift_y_net3830560), .RN(n1477), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3830560), .RN(n1477), .Q(d_ff_Yn[27]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1477), .Q(d_ff2_Y[27]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(d_ff2_Y[27]), .CK(reg_shift_y_net3830560), .RN(n1477), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3830560), .RN(n1477), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1477), .Q(d_ff2_Y[28]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(d_ff2_Y[28]), .CK(reg_shift_y_net3830560), .RN(n1477), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3830560), .RN(n1476), .Q(d_ff_Yn[29]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1476), .Q(d_ff2_Y[29]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(d_ff2_Y[29]), .CK(reg_shift_y_net3830560), .RN(n1476), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3830560), .RN(n1476), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1476), .Q(d_ff2_Y[30]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(d_ff2_Y[30]), .CK(reg_shift_y_net3830560), .RN(n1476), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3830560), .RN(n1476), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1475), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3830560), .RN(n1475), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Yn_net3830560), .RN(n1475), .Q(d_ff_Yn[32]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_32_ ( .D(first_mux_Y[32]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1475), .Q(d_ff2_Y[32]) );
  DFFRXLTS reg_shift_y_Q_reg_32_ ( .D(d_ff2_Y[32]), .CK(reg_shift_y_net3830560), .RN(n1475), .Q(d_ff3_sh_y_out[32]) );
  DFFRXLTS d_ff4_Yn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Yn_net3830560), .RN(n1475), .Q(d_ff_Yn[33]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_33_ ( .D(first_mux_Y[33]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1475), .Q(d_ff2_Y[33]) );
  DFFRXLTS reg_shift_y_Q_reg_33_ ( .D(d_ff2_Y[33]), .CK(reg_shift_y_net3830560), .RN(n1475), .Q(d_ff3_sh_y_out[33]) );
  DFFRXLTS d_ff4_Yn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Yn_net3830560), .RN(n1474), .Q(d_ff_Yn[34]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_34_ ( .D(first_mux_Y[34]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1474), .Q(d_ff2_Y[34]) );
  DFFRXLTS reg_shift_y_Q_reg_34_ ( .D(d_ff2_Y[34]), .CK(reg_shift_y_net3830560), .RN(n1474), .Q(d_ff3_sh_y_out[34]) );
  DFFRXLTS d_ff4_Yn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Yn_net3830560), .RN(n1474), .Q(d_ff_Yn[35]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_35_ ( .D(first_mux_Y[35]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1474), .Q(d_ff2_Y[35]) );
  DFFRXLTS reg_shift_y_Q_reg_35_ ( .D(d_ff2_Y[35]), .CK(reg_shift_y_net3830560), .RN(n1474), .Q(d_ff3_sh_y_out[35]) );
  DFFRXLTS d_ff4_Yn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Yn_net3830560), .RN(n1474), .Q(d_ff_Yn[36]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_36_ ( .D(first_mux_Y[36]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1473), .Q(d_ff2_Y[36]) );
  DFFRXLTS reg_shift_y_Q_reg_36_ ( .D(d_ff2_Y[36]), .CK(reg_shift_y_net3830560), .RN(n1473), .Q(d_ff3_sh_y_out[36]) );
  DFFRXLTS d_ff4_Yn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Yn_net3830560), .RN(n1473), .Q(d_ff_Yn[37]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_37_ ( .D(first_mux_Y[37]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1473), .Q(d_ff2_Y[37]) );
  DFFRXLTS reg_shift_y_Q_reg_37_ ( .D(d_ff2_Y[37]), .CK(reg_shift_y_net3830560), .RN(n1473), .Q(d_ff3_sh_y_out[37]) );
  DFFRXLTS d_ff4_Yn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Yn_net3830560), .RN(n1473), .Q(d_ff_Yn[38]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_38_ ( .D(first_mux_Y[38]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1473), .Q(d_ff2_Y[38]) );
  DFFRXLTS reg_shift_y_Q_reg_38_ ( .D(d_ff2_Y[38]), .CK(reg_shift_y_net3830560), .RN(n1473), .Q(d_ff3_sh_y_out[38]) );
  DFFRXLTS d_ff4_Yn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Yn_net3830560), .RN(n1472), .Q(d_ff_Yn[39]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_39_ ( .D(first_mux_Y[39]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1472), .Q(d_ff2_Y[39]) );
  DFFRXLTS reg_shift_y_Q_reg_39_ ( .D(d_ff2_Y[39]), .CK(reg_shift_y_net3830560), .RN(n1472), .Q(d_ff3_sh_y_out[39]) );
  DFFRXLTS d_ff4_Yn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Yn_net3830560), .RN(n1472), .Q(d_ff_Yn[40]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_40_ ( .D(first_mux_Y[40]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1472), .Q(d_ff2_Y[40]) );
  DFFRXLTS reg_shift_y_Q_reg_40_ ( .D(d_ff2_Y[40]), .CK(reg_shift_y_net3830560), .RN(n1472), .Q(d_ff3_sh_y_out[40]) );
  DFFRXLTS d_ff4_Yn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Yn_net3830560), .RN(n1472), .Q(d_ff_Yn[41]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_41_ ( .D(first_mux_Y[41]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1526), .Q(d_ff2_Y[41]) );
  DFFRXLTS reg_shift_y_Q_reg_41_ ( .D(d_ff2_Y[41]), .CK(reg_shift_y_net3830560), .RN(n1531), .Q(d_ff3_sh_y_out[41]) );
  DFFRXLTS d_ff4_Yn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Yn_net3830560), .RN(n1520), .Q(d_ff_Yn[42]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_42_ ( .D(first_mux_Y[42]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1529), .Q(d_ff2_Y[42]) );
  DFFRXLTS reg_shift_y_Q_reg_42_ ( .D(d_ff2_Y[42]), .CK(reg_shift_y_net3830560), .RN(n1519), .Q(d_ff3_sh_y_out[42]) );
  DFFRXLTS d_ff4_Yn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Yn_net3830560), .RN(n1532), .Q(d_ff_Yn[43]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_43_ ( .D(first_mux_Y[43]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1524), .Q(d_ff2_Y[43]) );
  DFFRXLTS reg_shift_y_Q_reg_43_ ( .D(d_ff2_Y[43]), .CK(reg_shift_y_net3830560), .RN(n1521), .Q(d_ff3_sh_y_out[43]) );
  DFFRXLTS d_ff4_Yn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Yn_net3830560), .RN(n1532), .Q(d_ff_Yn[44]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_44_ ( .D(first_mux_Y[44]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1529), .Q(d_ff2_Y[44]) );
  DFFRXLTS reg_shift_y_Q_reg_44_ ( .D(d_ff2_Y[44]), .CK(reg_shift_y_net3830560), .RN(n1528), .Q(d_ff3_sh_y_out[44]) );
  DFFRXLTS d_ff4_Yn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Yn_net3830560), .RN(n1526), .Q(d_ff_Yn[45]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_45_ ( .D(first_mux_Y[45]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1532), .Q(d_ff2_Y[45]) );
  DFFRXLTS reg_shift_y_Q_reg_45_ ( .D(d_ff2_Y[45]), .CK(reg_shift_y_net3830560), .RN(n1529), .Q(d_ff3_sh_y_out[45]) );
  DFFRXLTS d_ff4_Yn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Yn_net3830560), .RN(n1528), .Q(d_ff_Yn[46]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_46_ ( .D(first_mux_Y[46]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1471), .Q(d_ff2_Y[46]) );
  DFFRXLTS reg_shift_y_Q_reg_46_ ( .D(d_ff2_Y[46]), .CK(reg_shift_y_net3830560), .RN(n1471), .Q(d_ff3_sh_y_out[46]) );
  DFFRXLTS d_ff4_Yn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Yn_net3830560), .RN(n1471), .Q(d_ff_Yn[47]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_47_ ( .D(first_mux_Y[47]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1471), .Q(d_ff2_Y[47]) );
  DFFRXLTS reg_shift_y_Q_reg_47_ ( .D(d_ff2_Y[47]), .CK(reg_shift_y_net3830560), .RN(n1471), .Q(d_ff3_sh_y_out[47]) );
  DFFRXLTS d_ff4_Yn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Yn_net3830560), .RN(n1471), .Q(d_ff_Yn[48]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_48_ ( .D(first_mux_Y[48]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1471), .Q(d_ff2_Y[48]) );
  DFFRXLTS reg_shift_y_Q_reg_48_ ( .D(d_ff2_Y[48]), .CK(reg_shift_y_net3830560), .RN(n1471), .Q(d_ff3_sh_y_out[48]) );
  DFFRXLTS d_ff4_Yn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Yn_net3830560), .RN(n1470), .Q(d_ff_Yn[49]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_49_ ( .D(first_mux_Y[49]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1470), .Q(d_ff2_Y[49]) );
  DFFRXLTS reg_shift_y_Q_reg_49_ ( .D(d_ff2_Y[49]), .CK(reg_shift_y_net3830560), .RN(n1470), .Q(d_ff3_sh_y_out[49]) );
  DFFRXLTS d_ff4_Yn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Yn_net3830560), .RN(n1470), .Q(d_ff_Yn[50]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_50_ ( .D(first_mux_Y[50]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1470), .Q(d_ff2_Y[50]) );
  DFFRXLTS reg_shift_y_Q_reg_50_ ( .D(d_ff2_Y[50]), .CK(reg_shift_y_net3830560), .RN(n1470), .Q(d_ff3_sh_y_out[50]) );
  DFFRXLTS d_ff4_Yn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Yn_net3830560), .RN(n1470), .Q(d_ff_Yn[51]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_51_ ( .D(first_mux_Y[51]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1469), .Q(d_ff2_Y[51]) );
  DFFRXLTS reg_shift_y_Q_reg_51_ ( .D(d_ff2_Y[51]), .CK(reg_shift_y_net3830560), .RN(n1469), .Q(d_ff3_sh_y_out[51]) );
  DFFRXLTS d_ff4_Yn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Yn_net3830560), .RN(n1469), .Q(d_ff_Yn[52]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_52_ ( .D(first_mux_Y[52]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1469), .Q(d_ff2_Y[52]), .QN(
        n1446) );
  DFFRXLTS d_ff4_Yn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Yn_net3830560), .RN(n1469), .Q(d_ff_Yn[53]) );
  DFFRXLTS d_ff4_Yn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Yn_net3830560), .RN(n1469), .Q(d_ff_Yn[54]) );
  DFFRXLTS d_ff4_Yn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Yn_net3830560), .RN(n1468), .Q(d_ff_Yn[55]) );
  DFFRXLTS d_ff4_Yn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Yn_net3830560), .RN(n1468), .Q(d_ff_Yn[56]) );
  DFFRXLTS d_ff4_Yn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Yn_net3830560), .RN(n1468), .Q(d_ff_Yn[57]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_57_ ( .D(first_mux_Y[57]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1468), .Q(d_ff2_Y[57]), .QN(
        n1452) );
  DFFRXLTS d_ff4_Yn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Yn_net3830560), .RN(n1467), .Q(d_ff_Yn[58]) );
  DFFRXLTS d_ff4_Yn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Yn_net3830560), .RN(n1467), .Q(d_ff_Yn[59]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_59_ ( .D(first_mux_Y[59]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1467), .Q(d_ff2_Y[59]), .QN(
        n1448) );
  DFFRXLTS d_ff4_Yn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Yn_net3830560), .RN(n1467), .Q(d_ff_Yn[60]) );
  DFFRXLTS d_ff4_Yn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Yn_net3830560), .RN(n1519), .Q(d_ff_Yn[61]) );
  DFFRXLTS d_ff4_Yn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Yn_net3830560), .RN(n1532), .Q(d_ff_Yn[62]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_62_ ( .D(first_mux_Y[62]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1520), .Q(d_ff2_Y[62]) );
  DFFRXLTS d_ff4_Yn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Yn_net3830560), .RN(n1524), .Q(d_ff_Yn[63]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_63_ ( .D(first_mux_Y[63]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1521), .Q(d_ff2_Y[63]) );
  DFFRXLTS reg_shift_y_Q_reg_63_ ( .D(d_ff2_Y[63]), .CK(reg_shift_y_net3830560), .RN(n1528), .Q(d_ff3_sh_y_out[63]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3830560), .RN(n1466), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1466), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3830560), .RN(n1466), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1466), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3830560), .RN(n1466), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1466), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3830560), .RN(n1466), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1466), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3830560), .RN(n1466), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1466), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3830560), .RN(n1465), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1465), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3830560), .RN(n1465), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1465), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3830560), .RN(n1465), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1465), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3830560), .RN(n1465), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1465), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3830560), .RN(n1465), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1465), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3830560), .RN(n1464), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1464), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3830560), .RN(n1464), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1464), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3830560), .RN(n1464), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1464), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3830560), .RN(n1464), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1464), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3830560), .RN(n1464), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1464), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3830560), .RN(n1463), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1463), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3830560), .RN(n1463), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1463), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3830560), .RN(n1463), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1463), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3830560), .RN(n1463), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1463), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3830560), .RN(n1463), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1463), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3830560), .RN(n1462), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1462), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3830560), .RN(n1462), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1462), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3830560), .RN(n1462), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1462), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3830560), .RN(n1462), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1462), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3830560), .RN(n1462), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1462), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3830560), .RN(n1461), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1461), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3830560), .RN(n1461), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1461), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3830560), .RN(n1461), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1461), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3830560), .RN(n1461), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1461), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3830560), .RN(n1461), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1461), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3830560), .RN(n1460), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1460), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3830560), .RN(n1460), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1460), .Q(d_ff2_Z[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Zn_net3830560), .RN(n1460), .Q(d_ff_Zn[32]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_32_ ( .D(first_mux_Z[32]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1460), .Q(d_ff2_Z[32]) );
  DFFRXLTS d_ff4_Zn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Zn_net3830560), .RN(n1460), .Q(d_ff_Zn[33]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_33_ ( .D(first_mux_Z[33]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1460), .Q(d_ff2_Z[33]) );
  DFFRXLTS d_ff4_Zn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Zn_net3830560), .RN(n1460), .Q(d_ff_Zn[34]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_34_ ( .D(first_mux_Z[34]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1460), .Q(d_ff2_Z[34]) );
  DFFRXLTS d_ff4_Zn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Zn_net3830560), .RN(n1459), .Q(d_ff_Zn[35]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_35_ ( .D(first_mux_Z[35]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1459), .Q(d_ff2_Z[35]) );
  DFFRXLTS d_ff4_Zn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Zn_net3830560), .RN(n1459), .Q(d_ff_Zn[36]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_36_ ( .D(first_mux_Z[36]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1459), .Q(d_ff2_Z[36]) );
  DFFRXLTS d_ff4_Zn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Zn_net3830560), .RN(n1459), .Q(d_ff_Zn[37]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_37_ ( .D(first_mux_Z[37]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1459), .Q(d_ff2_Z[37]) );
  DFFRXLTS d_ff4_Zn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Zn_net3830560), .RN(n1459), .Q(d_ff_Zn[38]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_38_ ( .D(first_mux_Z[38]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1459), .Q(d_ff2_Z[38]) );
  DFFRXLTS d_ff4_Zn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Zn_net3830560), .RN(n1459), .Q(d_ff_Zn[39]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_39_ ( .D(first_mux_Z[39]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1459), .Q(d_ff2_Z[39]) );
  DFFRXLTS d_ff4_Zn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Zn_net3830560), .RN(n1458), .Q(d_ff_Zn[40]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_40_ ( .D(first_mux_Z[40]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1458), .Q(d_ff2_Z[40]) );
  DFFRXLTS d_ff4_Zn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Zn_net3830560), .RN(n1458), .Q(d_ff_Zn[41]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_41_ ( .D(first_mux_Z[41]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1458), .Q(d_ff2_Z[41]) );
  DFFRXLTS d_ff4_Zn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Zn_net3830560), .RN(n1458), .Q(d_ff_Zn[42]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_42_ ( .D(first_mux_Z[42]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1458), .Q(d_ff2_Z[42]) );
  DFFRXLTS d_ff4_Zn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Zn_net3830560), .RN(n1458), .Q(d_ff_Zn[43]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_43_ ( .D(first_mux_Z[43]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1458), .Q(d_ff2_Z[43]) );
  DFFRXLTS d_ff4_Zn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Zn_net3830560), .RN(n1458), .Q(d_ff_Zn[44]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_44_ ( .D(first_mux_Z[44]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1458), .Q(d_ff2_Z[44]) );
  DFFRXLTS d_ff4_Zn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Zn_net3830560), .RN(n1457), .Q(d_ff_Zn[45]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_45_ ( .D(first_mux_Z[45]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1457), .Q(d_ff2_Z[45]) );
  DFFRXLTS d_ff4_Zn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Zn_net3830560), .RN(n1457), .Q(d_ff_Zn[46]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_46_ ( .D(first_mux_Z[46]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1457), .Q(d_ff2_Z[46]) );
  DFFRXLTS d_ff4_Zn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Zn_net3830560), .RN(n1457), .Q(d_ff_Zn[47]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_47_ ( .D(first_mux_Z[47]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1457), .Q(d_ff2_Z[47]) );
  DFFRXLTS d_ff4_Zn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Zn_net3830560), .RN(n1457), .Q(d_ff_Zn[48]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_48_ ( .D(first_mux_Z[48]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1457), .Q(d_ff2_Z[48]) );
  DFFRXLTS d_ff4_Zn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Zn_net3830560), .RN(n1457), .Q(d_ff_Zn[49]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_49_ ( .D(first_mux_Z[49]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1457), .Q(d_ff2_Z[49]) );
  DFFRXLTS d_ff4_Zn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Zn_net3830560), .RN(n1456), .Q(d_ff_Zn[50]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_50_ ( .D(first_mux_Z[50]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1456), .Q(d_ff2_Z[50]) );
  DFFRXLTS d_ff4_Zn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Zn_net3830560), .RN(n1456), .Q(d_ff_Zn[51]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_51_ ( .D(first_mux_Z[51]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1456), .Q(d_ff2_Z[51]) );
  DFFRXLTS d_ff4_Zn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Zn_net3830560), .RN(n1456), .Q(d_ff_Zn[52]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_52_ ( .D(first_mux_Z[52]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1456), .Q(d_ff2_Z[52]) );
  DFFRXLTS d_ff4_Zn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Zn_net3830560), .RN(n1456), .Q(d_ff_Zn[53]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_53_ ( .D(first_mux_Z[53]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1456), .Q(d_ff2_Z[53]) );
  DFFRXLTS d_ff4_Zn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Zn_net3830560), .RN(n1456), .Q(d_ff_Zn[54]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_54_ ( .D(first_mux_Z[54]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1456), .Q(d_ff2_Z[54]) );
  DFFRXLTS d_ff4_Zn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Zn_net3830560), .RN(n1530), .Q(d_ff_Zn[55]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_55_ ( .D(first_mux_Z[55]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1527), .Q(d_ff2_Z[55]) );
  DFFRXLTS d_ff4_Zn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Zn_net3830560), .RN(n1531), .Q(d_ff_Zn[56]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_56_ ( .D(first_mux_Z[56]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1530), .Q(d_ff2_Z[56]) );
  DFFRXLTS d_ff4_Zn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Zn_net3830560), .RN(n1533), .Q(d_ff_Zn[57]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_57_ ( .D(first_mux_Z[57]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1533), .Q(d_ff2_Z[57]) );
  DFFRXLTS d_ff4_Zn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Zn_net3830560), .RN(n1527), .Q(d_ff_Zn[58]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_58_ ( .D(first_mux_Z[58]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1526), .Q(d_ff2_Z[58]) );
  DFFRXLTS d_ff4_Zn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Zn_net3830560), .RN(n1531), .Q(d_ff_Zn[59]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_59_ ( .D(first_mux_Z[59]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1532), .Q(d_ff2_Z[59]) );
  DFFRXLTS d_ff4_Zn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Zn_net3830560), .RN(n1455), .Q(d_ff_Zn[60]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_60_ ( .D(first_mux_Z[60]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1455), .Q(d_ff2_Z[60]) );
  DFFRXLTS d_ff4_Zn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Zn_net3830560), .RN(n1455), .Q(d_ff_Zn[61]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_61_ ( .D(first_mux_Z[61]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1455), .Q(d_ff2_Z[61]) );
  DFFRXLTS d_ff4_Zn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Zn_net3830560), .RN(n1455), .Q(d_ff_Zn[62]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_62_ ( .D(first_mux_Z[62]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1455), .Q(d_ff2_Z[62]) );
  DFFRXLTS d_ff4_Zn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Zn_net3830560), .RN(n1455), .Q(d_ff_Zn[63]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_63_ ( .D(first_mux_Z[63]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1455), .Q(d_ff2_Z[63]) );
  CMPR32X2TS intadd_460_U2 ( .A(d_ff2_Y[55]), .B(n1442), .C(intadd_460_n2), 
        .CO(intadd_460_n1), .S(sh_exp_y[3]) );
  DFFRXLTS reg_LUT_Q_reg_48_ ( .D(1'b1), .CK(reg_shift_y_net3830560), .RN(
        n1455), .Q(d_ff3_LUT_out[48]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(clk), .RN(n1516), .Q(
        inst_CORDIC_FSM_v3_state_reg[1]), .QN(n1450) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(clk), .RN(n1516), .Q(
        inst_CORDIC_FSM_v3_state_reg[7]), .QN(n1449) );
  DFFRX1TS VAR_CONT_temp_reg_0_ ( .D(n960), .CK(clk), .RN(n1516), .Q(
        cont_var_out[0]), .QN(n1447) );
  DFFSX1TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(clk), .SN(n1517), .Q(
        inst_CORDIC_FSM_v3_state_reg[0]), .QN(n1443) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(mux_sal[0]), .CK(
        d_ff5_data_out_net3830560), .RN(n1488), .Q(data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(mux_sal[1]), .CK(
        d_ff5_data_out_net3830560), .RN(n1487), .Q(data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(mux_sal[2]), .CK(
        d_ff5_data_out_net3830560), .RN(n1487), .Q(data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(mux_sal[3]), .CK(
        d_ff5_data_out_net3830560), .RN(n1486), .Q(data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(mux_sal[4]), .CK(
        d_ff5_data_out_net3830560), .RN(n1486), .Q(data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(mux_sal[5]), .CK(
        d_ff5_data_out_net3830560), .RN(n1486), .Q(data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(mux_sal[6]), .CK(
        d_ff5_data_out_net3830560), .RN(n1485), .Q(data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(mux_sal[7]), .CK(
        d_ff5_data_out_net3830560), .RN(n1485), .Q(data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(mux_sal[8]), .CK(
        d_ff5_data_out_net3830560), .RN(n1484), .Q(data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(mux_sal[9]), .CK(
        d_ff5_data_out_net3830560), .RN(n1484), .Q(data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(mux_sal[10]), .CK(
        d_ff5_data_out_net3830560), .RN(n1484), .Q(data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(mux_sal[11]), .CK(
        d_ff5_data_out_net3830560), .RN(n1483), .Q(data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(mux_sal[12]), .CK(
        d_ff5_data_out_net3830560), .RN(n1483), .Q(data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(mux_sal[13]), .CK(
        d_ff5_data_out_net3830560), .RN(n1482), .Q(data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(mux_sal[14]), .CK(
        d_ff5_data_out_net3830560), .RN(n1482), .Q(data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(mux_sal[15]), .CK(
        d_ff5_data_out_net3830560), .RN(n1482), .Q(data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(mux_sal[16]), .CK(
        d_ff5_data_out_net3830560), .RN(n1481), .Q(data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(mux_sal[17]), .CK(
        d_ff5_data_out_net3830560), .RN(n1481), .Q(data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(mux_sal[18]), .CK(
        d_ff5_data_out_net3830560), .RN(n1480), .Q(data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(mux_sal[19]), .CK(
        d_ff5_data_out_net3830560), .RN(n1480), .Q(data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(mux_sal[20]), .CK(
        d_ff5_data_out_net3830560), .RN(n1480), .Q(data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(mux_sal[21]), .CK(
        d_ff5_data_out_net3830560), .RN(n1479), .Q(data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(mux_sal[22]), .CK(
        d_ff5_data_out_net3830560), .RN(n1479), .Q(data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(mux_sal[23]), .CK(
        d_ff5_data_out_net3830560), .RN(n1478), .Q(data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(mux_sal[24]), .CK(
        d_ff5_data_out_net3830560), .RN(n1478), .Q(data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(mux_sal[25]), .CK(
        d_ff5_data_out_net3830560), .RN(n1478), .Q(data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(mux_sal[26]), .CK(
        d_ff5_data_out_net3830560), .RN(n1477), .Q(data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(mux_sal[27]), .CK(
        d_ff5_data_out_net3830560), .RN(n1477), .Q(data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(mux_sal[28]), .CK(
        d_ff5_data_out_net3830560), .RN(n1476), .Q(data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(mux_sal[29]), .CK(
        d_ff5_data_out_net3830560), .RN(n1476), .Q(data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(mux_sal[30]), .CK(
        d_ff5_data_out_net3830560), .RN(n1476), .Q(data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(mux_sal[31]), .CK(
        d_ff5_data_out_net3830560), .RN(n1475), .Q(data_output[31]) );
  DFFRXLTS d_ff5_data_out_Q_reg_32_ ( .D(mux_sal[32]), .CK(
        d_ff5_data_out_net3830560), .RN(n1475), .Q(data_output[32]) );
  DFFRXLTS d_ff5_data_out_Q_reg_33_ ( .D(mux_sal[33]), .CK(
        d_ff5_data_out_net3830560), .RN(n1474), .Q(data_output[33]) );
  DFFRXLTS d_ff5_data_out_Q_reg_34_ ( .D(mux_sal[34]), .CK(
        d_ff5_data_out_net3830560), .RN(n1474), .Q(data_output[34]) );
  DFFRXLTS d_ff5_data_out_Q_reg_35_ ( .D(mux_sal[35]), .CK(
        d_ff5_data_out_net3830560), .RN(n1474), .Q(data_output[35]) );
  DFFRXLTS d_ff5_data_out_Q_reg_36_ ( .D(mux_sal[36]), .CK(
        d_ff5_data_out_net3830560), .RN(n1473), .Q(data_output[36]) );
  DFFRXLTS d_ff5_data_out_Q_reg_37_ ( .D(mux_sal[37]), .CK(
        d_ff5_data_out_net3830560), .RN(n1473), .Q(data_output[37]) );
  DFFRXLTS d_ff5_data_out_Q_reg_38_ ( .D(mux_sal[38]), .CK(
        d_ff5_data_out_net3830560), .RN(n1472), .Q(data_output[38]) );
  DFFRXLTS d_ff5_data_out_Q_reg_39_ ( .D(mux_sal[39]), .CK(
        d_ff5_data_out_net3830560), .RN(n1472), .Q(data_output[39]) );
  DFFRXLTS d_ff5_data_out_Q_reg_40_ ( .D(mux_sal[40]), .CK(
        d_ff5_data_out_net3830560), .RN(n1472), .Q(data_output[40]) );
  DFFRXLTS d_ff5_data_out_Q_reg_41_ ( .D(mux_sal[41]), .CK(
        d_ff5_data_out_net3830560), .RN(n1528), .Q(data_output[41]) );
  DFFRXLTS d_ff5_data_out_Q_reg_42_ ( .D(mux_sal[42]), .CK(
        d_ff5_data_out_net3830560), .RN(n1521), .Q(data_output[42]) );
  DFFRXLTS d_ff5_data_out_Q_reg_43_ ( .D(mux_sal[43]), .CK(
        d_ff5_data_out_net3830560), .RN(n1528), .Q(data_output[43]) );
  DFFRXLTS d_ff5_data_out_Q_reg_44_ ( .D(mux_sal[44]), .CK(
        d_ff5_data_out_net3830560), .RN(n1529), .Q(data_output[44]) );
  DFFRXLTS d_ff5_data_out_Q_reg_45_ ( .D(mux_sal[45]), .CK(
        d_ff5_data_out_net3830560), .RN(n1528), .Q(data_output[45]) );
  DFFRXLTS d_ff5_data_out_Q_reg_46_ ( .D(mux_sal[46]), .CK(
        d_ff5_data_out_net3830560), .RN(n1471), .Q(data_output[46]) );
  DFFRXLTS d_ff5_data_out_Q_reg_47_ ( .D(mux_sal[47]), .CK(
        d_ff5_data_out_net3830560), .RN(n1471), .Q(data_output[47]) );
  DFFRXLTS d_ff5_data_out_Q_reg_48_ ( .D(mux_sal[48]), .CK(
        d_ff5_data_out_net3830560), .RN(n1470), .Q(data_output[48]) );
  DFFRXLTS d_ff5_data_out_Q_reg_49_ ( .D(mux_sal[49]), .CK(
        d_ff5_data_out_net3830560), .RN(n1470), .Q(data_output[49]) );
  DFFRXLTS d_ff5_data_out_Q_reg_50_ ( .D(mux_sal[50]), .CK(
        d_ff5_data_out_net3830560), .RN(n1470), .Q(data_output[50]) );
  DFFRXLTS d_ff5_data_out_Q_reg_51_ ( .D(mux_sal[51]), .CK(
        d_ff5_data_out_net3830560), .RN(n1469), .Q(data_output[51]) );
  DFFRXLTS d_ff5_data_out_Q_reg_52_ ( .D(mux_sal[52]), .CK(
        d_ff5_data_out_net3830560), .RN(n1469), .Q(data_output[52]) );
  DFFRXLTS d_ff5_data_out_Q_reg_53_ ( .D(mux_sal[53]), .CK(
        d_ff5_data_out_net3830560), .RN(n1469), .Q(data_output[53]) );
  DFFRXLTS d_ff5_data_out_Q_reg_54_ ( .D(mux_sal[54]), .CK(
        d_ff5_data_out_net3830560), .RN(n1468), .Q(data_output[54]) );
  DFFRXLTS d_ff5_data_out_Q_reg_55_ ( .D(mux_sal[55]), .CK(
        d_ff5_data_out_net3830560), .RN(n1468), .Q(data_output[55]) );
  DFFRXLTS d_ff5_data_out_Q_reg_56_ ( .D(mux_sal[56]), .CK(
        d_ff5_data_out_net3830560), .RN(n1468), .Q(data_output[56]) );
  DFFRXLTS d_ff5_data_out_Q_reg_57_ ( .D(mux_sal[57]), .CK(
        d_ff5_data_out_net3830560), .RN(n1467), .Q(data_output[57]) );
  DFFRXLTS d_ff5_data_out_Q_reg_58_ ( .D(mux_sal[58]), .CK(
        d_ff5_data_out_net3830560), .RN(n1467), .Q(data_output[58]) );
  DFFRXLTS d_ff5_data_out_Q_reg_59_ ( .D(mux_sal[59]), .CK(
        d_ff5_data_out_net3830560), .RN(n1467), .Q(data_output[59]) );
  DFFRXLTS d_ff5_data_out_Q_reg_60_ ( .D(mux_sal[60]), .CK(
        d_ff5_data_out_net3830560), .RN(n1467), .Q(data_output[60]) );
  DFFRXLTS d_ff5_data_out_Q_reg_61_ ( .D(mux_sal[61]), .CK(
        d_ff5_data_out_net3830560), .RN(n1529), .Q(data_output[61]) );
  DFFRXLTS d_ff5_data_out_Q_reg_62_ ( .D(mux_sal[62]), .CK(
        d_ff5_data_out_net3830560), .RN(n1531), .Q(data_output[62]) );
  DFFRXLTS d_ff5_data_out_Q_reg_63_ ( .D(fmtted_Result_63_), .CK(
        d_ff5_data_out_net3830560), .RN(n1526), .Q(data_output[63]) );
  DFFRX2TS VAR_CONT_temp_reg_1_ ( .D(n961), .CK(clk), .RN(n1517), .Q(
        cont_var_out[1]) );
  DFFRX2TS ITER_CONT_temp_reg_0_ ( .D(n1454), .CK(ITER_CONT_net3830596), .RN(
        n1517), .Q(n1145), .QN(n1454) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(clk), .RN(n1517), .Q(
        inst_CORDIC_FSM_v3_state_reg[4]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[63]), .CK(reg_shift_y_net3830560), 
        .RN(n1455), .Q(d_ff3_sign_out) );
  DFFRX4TS ITER_CONT_temp_reg_2_ ( .D(ITER_CONT_N4), .CK(ITER_CONT_net3830596), 
        .RN(n1516), .Q(cont_iter_out[2]), .QN(n1444) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_56_ ( .D(first_mux_X[56]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1490), .Q(d_ff2_X[56]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_56_ ( .D(first_mux_Y[56]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1468), .Q(d_ff2_Y[56]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_58_ ( .D(first_mux_X[58]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1489), .Q(d_ff2_X[58]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_58_ ( .D(first_mux_Y[58]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1467), .Q(d_ff2_Y[58]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_61_ ( .D(first_mux_X[61]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1489), .Q(d_ff2_X[61]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_61_ ( .D(first_mux_Y[61]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1522), .Q(d_ff2_Y[61]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_60_ ( .D(first_mux_X[60]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1489), .Q(d_ff2_X[60]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_60_ ( .D(first_mux_Y[60]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1467), .Q(d_ff2_Y[60]) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3830560), .RN(n1515), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_55_ ( .D(first_mux_X[55]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1490), .Q(d_ff2_X[55]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_54_ ( .D(first_mux_X[54]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1490), .Q(d_ff2_X[54]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_53_ ( .D(first_mux_X[53]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1490), .Q(d_ff2_X[53]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_55_ ( .D(first_mux_Y[55]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1468), .Q(d_ff2_Y[55]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_54_ ( .D(first_mux_Y[54]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1468), .Q(d_ff2_Y[54]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_53_ ( .D(first_mux_Y[53]), .CK(
        reg_val_muxZ_2stage_net3830560), .RN(n1469), .Q(d_ff2_Y[53]) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3830560), 
        .RN(n1516), .Q(d_ff1_operation_out) );
  DFFRX4TS ITER_CONT_temp_reg_3_ ( .D(n1453), .CK(ITER_CONT_net3830596), .RN(
        n1516), .Q(cont_iter_out[3]), .QN(n1442) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(
        inst_CORDIC_FSM_v3_state_next[3]), .CK(clk), .RN(n1516), .Q(
        inst_CORDIC_FSM_v3_state_reg[3]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(clk), .RN(n1516), .Q(
        inst_CORDIC_FSM_v3_state_reg[5]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(clk), .RN(n1517), .Q(
        inst_CORDIC_FSM_v3_state_reg[6]), .QN(n1534) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(
        inst_CORDIC_FSM_v3_state_next[2]), .CK(clk), .RN(n1516), .Q(
        inst_CORDIC_FSM_v3_state_reg[2]) );
  ADDFX1TS intadd_459_U4 ( .A(d_ff2_X[53]), .B(n1141), .CI(intadd_459_CI), 
        .CO(intadd_459_n3), .S(sh_exp_x[1]) );
  ADDFX1TS intadd_460_U4 ( .A(d_ff2_Y[53]), .B(n1141), .CI(intadd_460_CI), 
        .CO(intadd_460_n3), .S(sh_exp_y[1]) );
  ADDFX1TS intadd_460_U3 ( .A(d_ff2_Y[54]), .B(n1139), .CI(intadd_460_n3), 
        .CO(intadd_460_n2), .S(sh_exp_y[2]) );
  ADDFX1TS intadd_459_U3 ( .A(d_ff2_X[54]), .B(n1139), .CI(intadd_459_n3), 
        .CO(intadd_459_n2), .S(sh_exp_x[2]) );
  ADDFX1TS intadd_459_U2 ( .A(n1442), .B(d_ff2_X[55]), .CI(intadd_459_n2), 
        .CO(intadd_459_n1), .S(sh_exp_x[3]) );
  OAI21XLTS U726 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(
        d_ff1_operation_out), .B0(n1321), .Y(n1319) );
  CLKBUFX3TS U727 ( .A(n1231), .Y(n1269) );
  CLKBUFX3TS U728 ( .A(n1231), .Y(n1263) );
  CLKBUFX2TS U729 ( .A(n1444), .Y(n1139) );
  INVX3TS U730 ( .A(n1341), .Y(n1327) );
  INVX3TS U731 ( .A(n1361), .Y(n1363) );
  INVX3TS U732 ( .A(n1361), .Y(n1362) );
  CLKBUFX3TS U733 ( .A(n1349), .Y(n1347) );
  INVX2TS U734 ( .A(n1329), .Y(n1326) );
  INVX2TS U735 ( .A(n1329), .Y(n1211) );
  INVX2TS U736 ( .A(n1329), .Y(n1324) );
  INVX2TS U737 ( .A(n1329), .Y(n1210) );
  CLKBUFX3TS U738 ( .A(n1349), .Y(n1345) );
  CLKBUFX3TS U739 ( .A(n1357), .Y(n1349) );
  AOI222X1TS U740 ( .A0(n1288), .A1(d_ff2_X[62]), .B0(n1269), .B1(d_ff2_Y[62]), 
        .C0(n1268), .C1(d_ff2_Z[62]), .Y(n1261) );
  AOI222X1TS U741 ( .A0(n1402), .A1(d_ff2_X[61]), .B0(n1269), .B1(d_ff2_Y[61]), 
        .C0(n1268), .C1(d_ff2_Z[61]), .Y(n1271) );
  CLKBUFX3TS U742 ( .A(n1353), .Y(n1355) );
  AOI222X1TS U743 ( .A0(n1288), .A1(d_ff2_X[60]), .B0(n1269), .B1(d_ff2_Y[60]), 
        .C0(n1268), .C1(d_ff2_Z[60]), .Y(n1267) );
  AOI222X1TS U744 ( .A0(n1265), .A1(d_ff2_X[57]), .B0(n1269), .B1(d_ff2_Y[57]), 
        .C0(n1268), .C1(d_ff2_Z[57]), .Y(n1266) );
  CLKBUFX3TS U745 ( .A(n1353), .Y(n1350) );
  INVX1TS U746 ( .A(n997), .Y(n1209) );
  NOR2X4TS U747 ( .A(n1145), .B(n1140), .Y(n1134) );
  CLKBUFX3TS U748 ( .A(n1405), .Y(n1242) );
  CLKBUFX3TS U749 ( .A(n1405), .Y(n1256) );
  CLKBUFX3TS U750 ( .A(n1277), .Y(n1222) );
  CLKBUFX3TS U751 ( .A(n1202), .Y(n1207) );
  CLKBUFX3TS U752 ( .A(n1277), .Y(n1287) );
  CLKBUFX3TS U753 ( .A(n1277), .Y(n1295) );
  CLKBUFX3TS U754 ( .A(n1277), .Y(n1307) );
  CLKBUFX3TS U755 ( .A(n1277), .Y(n1372) );
  CLKBUFX3TS U756 ( .A(n1202), .Y(n1193) );
  CLKBUFX3TS U757 ( .A(n1179), .Y(n1388) );
  OR2X2TS U758 ( .A(cont_iter_out[3]), .B(cont_iter_out[2]), .Y(n1136) );
  NAND2X2TS U759 ( .A(cont_iter_out[2]), .B(n1442), .Y(n1146) );
  CLKBUFX3TS U760 ( .A(n1374), .Y(n1230) );
  NAND3XLTS U761 ( .A(n1370), .B(n1368), .C(n1314), .Y(n1428) );
  NAND2X1TS U762 ( .A(n1173), .B(n1437), .Y(n1436) );
  OR2X1TS U763 ( .A(d_ff_Xn[61]), .B(n1336), .Y(first_mux_X[61]) );
  BUFX3TS U764 ( .A(n1202), .Y(n1401) );
  NAND3XLTS U765 ( .A(inst_CORDIC_FSM_v3_state_reg[1]), .B(n1149), .C(n1443), 
        .Y(n1366) );
  INVX2TS U766 ( .A(n1320), .Y(n1352) );
  CLKBUFX2TS U767 ( .A(n1352), .Y(n1357) );
  INVX2TS U768 ( .A(d_ff2_X[59]), .Y(n1173) );
  NAND3XLTS U769 ( .A(n1427), .B(n1416), .C(n1146), .Y(n1423) );
  NAND2BXLTS U770 ( .AN(n1171), .B(n1134), .Y(n1317) );
  AOI222X1TS U771 ( .A0(n1265), .A1(d_ff2_X[54]), .B0(n1263), .B1(d_ff2_Y[54]), 
        .C0(n1207), .C1(d_ff2_Z[54]), .Y(n1186) );
  AOI222X1TS U772 ( .A0(n1265), .A1(d_ff2_X[55]), .B0(n1263), .B1(d_ff2_Y[55]), 
        .C0(n1268), .C1(d_ff2_Z[55]), .Y(n1264) );
  AOI222X1TS U773 ( .A0(n1265), .A1(d_ff2_X[56]), .B0(n1263), .B1(d_ff2_Y[56]), 
        .C0(n1268), .C1(d_ff2_Z[56]), .Y(n1260) );
  AOI222X1TS U774 ( .A0(n1265), .A1(d_ff2_X[58]), .B0(n1269), .B1(d_ff2_Y[58]), 
        .C0(n1268), .C1(d_ff2_Z[58]), .Y(n1262) );
  NOR2XLTS U775 ( .A(n1314), .B(n1230), .Y(enab_d_ff4_Yn) );
  OR2X1TS U776 ( .A(d_ff_Xn[54]), .B(n1211), .Y(first_mux_X[54]) );
  OR2X1TS U777 ( .A(d_ff_Xn[55]), .B(n1211), .Y(first_mux_X[55]) );
  OR2X1TS U778 ( .A(d_ff_Xn[58]), .B(n1210), .Y(first_mux_X[58]) );
  OR2X1TS U779 ( .A(d_ff_Xn[56]), .B(n1326), .Y(first_mux_X[56]) );
  OAI21XLTS U780 ( .A0(n1230), .A1(n1429), .B0(n1212), .Y(n961) );
  AO22XLTS U781 ( .A0(n1359), .A1(d_ff_Yn[62]), .B0(n1358), .B1(d_ff_Xn[62]), 
        .Y(mux_sal[62]) );
  AO22XLTS U782 ( .A0(n1359), .A1(d_ff_Yn[61]), .B0(n1358), .B1(d_ff_Xn[61]), 
        .Y(mux_sal[61]) );
  AO22XLTS U783 ( .A0(n1359), .A1(d_ff_Yn[60]), .B0(n1358), .B1(d_ff_Xn[60]), 
        .Y(mux_sal[60]) );
  AO22XLTS U784 ( .A0(n1359), .A1(d_ff_Yn[59]), .B0(n1358), .B1(d_ff_Xn[59]), 
        .Y(mux_sal[59]) );
  AO22XLTS U785 ( .A0(n1356), .A1(d_ff_Yn[58]), .B0(n1358), .B1(d_ff_Xn[58]), 
        .Y(mux_sal[58]) );
  AO22XLTS U786 ( .A0(n1356), .A1(d_ff_Yn[57]), .B0(n1355), .B1(d_ff_Xn[57]), 
        .Y(mux_sal[57]) );
  AO22XLTS U787 ( .A0(n1356), .A1(d_ff_Yn[56]), .B0(n1355), .B1(d_ff_Xn[56]), 
        .Y(mux_sal[56]) );
  AO22XLTS U788 ( .A0(n1356), .A1(d_ff_Yn[55]), .B0(n1355), .B1(d_ff_Xn[55]), 
        .Y(mux_sal[55]) );
  AO22XLTS U789 ( .A0(n1356), .A1(d_ff_Yn[54]), .B0(n1355), .B1(d_ff_Xn[54]), 
        .Y(mux_sal[54]) );
  AO22XLTS U790 ( .A0(n1356), .A1(d_ff_Yn[53]), .B0(n1355), .B1(d_ff_Xn[53]), 
        .Y(mux_sal[53]) );
  AO22XLTS U791 ( .A0(n1356), .A1(d_ff_Yn[52]), .B0(n1355), .B1(d_ff_Xn[52]), 
        .Y(mux_sal[52]) );
  AO22XLTS U792 ( .A0(n1356), .A1(d_ff_Yn[51]), .B0(n1355), .B1(d_ff_Xn[51]), 
        .Y(mux_sal[51]) );
  AO22XLTS U793 ( .A0(n1356), .A1(d_ff_Yn[50]), .B0(n1355), .B1(d_ff_Xn[50]), 
        .Y(mux_sal[50]) );
  AO22XLTS U794 ( .A0(n1356), .A1(d_ff_Yn[49]), .B0(n1355), .B1(d_ff_Xn[49]), 
        .Y(mux_sal[49]) );
  AO22XLTS U795 ( .A0(n1354), .A1(d_ff_Yn[48]), .B0(n1355), .B1(d_ff_Xn[48]), 
        .Y(mux_sal[48]) );
  AO22XLTS U796 ( .A0(n1354), .A1(d_ff_Yn[47]), .B0(n1358), .B1(d_ff_Xn[47]), 
        .Y(mux_sal[47]) );
  AO22XLTS U797 ( .A0(n1354), .A1(d_ff_Yn[46]), .B0(n1353), .B1(d_ff_Xn[46]), 
        .Y(mux_sal[46]) );
  AO22XLTS U798 ( .A0(n1354), .A1(d_ff_Yn[45]), .B0(n1353), .B1(d_ff_Xn[45]), 
        .Y(mux_sal[45]) );
  AO22XLTS U799 ( .A0(n1354), .A1(d_ff_Yn[44]), .B0(n1353), .B1(d_ff_Xn[44]), 
        .Y(mux_sal[44]) );
  AO22XLTS U800 ( .A0(n1354), .A1(d_ff_Yn[43]), .B0(n1353), .B1(d_ff_Xn[43]), 
        .Y(mux_sal[43]) );
  AO22XLTS U801 ( .A0(n1354), .A1(d_ff_Yn[42]), .B0(n1352), .B1(d_ff_Xn[42]), 
        .Y(mux_sal[42]) );
  AO22XLTS U802 ( .A0(n1354), .A1(d_ff_Yn[41]), .B0(n1352), .B1(d_ff_Xn[41]), 
        .Y(mux_sal[41]) );
  AO22XLTS U803 ( .A0(n1354), .A1(d_ff_Yn[40]), .B0(n1352), .B1(d_ff_Xn[40]), 
        .Y(mux_sal[40]) );
  AO22XLTS U804 ( .A0(n1354), .A1(d_ff_Yn[39]), .B0(n1352), .B1(d_ff_Xn[39]), 
        .Y(mux_sal[39]) );
  AO22XLTS U805 ( .A0(n1351), .A1(d_ff_Yn[38]), .B0(n1358), .B1(d_ff_Xn[38]), 
        .Y(mux_sal[38]) );
  AO22XLTS U806 ( .A0(n1351), .A1(d_ff_Yn[37]), .B0(n1350), .B1(d_ff_Xn[37]), 
        .Y(mux_sal[37]) );
  AO22XLTS U807 ( .A0(n1351), .A1(d_ff_Yn[36]), .B0(n1350), .B1(d_ff_Xn[36]), 
        .Y(mux_sal[36]) );
  AO22XLTS U808 ( .A0(n1351), .A1(d_ff_Yn[35]), .B0(n1350), .B1(d_ff_Xn[35]), 
        .Y(mux_sal[35]) );
  AO22XLTS U809 ( .A0(n1351), .A1(d_ff_Yn[34]), .B0(n1350), .B1(d_ff_Xn[34]), 
        .Y(mux_sal[34]) );
  AO22XLTS U810 ( .A0(n1351), .A1(d_ff_Yn[33]), .B0(n1350), .B1(d_ff_Xn[33]), 
        .Y(mux_sal[33]) );
  AO22XLTS U811 ( .A0(n1351), .A1(d_ff_Yn[32]), .B0(n1350), .B1(d_ff_Xn[32]), 
        .Y(mux_sal[32]) );
  AO22XLTS U812 ( .A0(n1351), .A1(d_ff_Yn[31]), .B0(n1350), .B1(d_ff_Xn[31]), 
        .Y(mux_sal[31]) );
  AO22XLTS U813 ( .A0(n1351), .A1(d_ff_Yn[30]), .B0(n1350), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U814 ( .A0(n1351), .A1(d_ff_Yn[29]), .B0(n1350), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U815 ( .A0(n1348), .A1(d_ff_Yn[28]), .B0(n1350), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U816 ( .A0(n1348), .A1(d_ff_Yn[27]), .B0(n1347), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U817 ( .A0(n1348), .A1(d_ff_Yn[26]), .B0(n1347), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U818 ( .A0(n1348), .A1(d_ff_Yn[25]), .B0(n1347), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U819 ( .A0(n1348), .A1(d_ff_Yn[24]), .B0(n1347), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U820 ( .A0(n1348), .A1(d_ff_Yn[23]), .B0(n1347), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U821 ( .A0(n1348), .A1(d_ff_Yn[22]), .B0(n1347), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U822 ( .A0(n1348), .A1(d_ff_Yn[21]), .B0(n1347), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U823 ( .A0(n1348), .A1(d_ff_Yn[20]), .B0(n1347), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U824 ( .A0(n1348), .A1(d_ff_Yn[19]), .B0(n1347), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U825 ( .A0(n1346), .A1(d_ff_Yn[18]), .B0(n1347), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U826 ( .A0(n1346), .A1(d_ff_Yn[17]), .B0(n1345), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U827 ( .A0(n1346), .A1(d_ff_Yn[16]), .B0(n1345), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U828 ( .A0(n1346), .A1(d_ff_Yn[15]), .B0(n1345), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U829 ( .A0(n1346), .A1(d_ff_Yn[14]), .B0(n1345), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U830 ( .A0(n1346), .A1(d_ff_Yn[13]), .B0(n1345), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U831 ( .A0(n1346), .A1(d_ff_Yn[12]), .B0(n1345), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U832 ( .A0(n1346), .A1(d_ff_Yn[11]), .B0(n1345), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U833 ( .A0(n1346), .A1(d_ff_Yn[10]), .B0(n1345), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U834 ( .A0(n1346), .A1(d_ff_Yn[9]), .B0(n1345), .B1(d_ff_Xn[9]), 
        .Y(mux_sal[9]) );
  AO22XLTS U835 ( .A0(n1344), .A1(d_ff_Yn[8]), .B0(n1345), .B1(d_ff_Xn[8]), 
        .Y(mux_sal[8]) );
  AO22XLTS U836 ( .A0(n1344), .A1(d_ff_Yn[7]), .B0(n1352), .B1(d_ff_Xn[7]), 
        .Y(mux_sal[7]) );
  AO22XLTS U837 ( .A0(n1344), .A1(d_ff_Yn[6]), .B0(n1352), .B1(d_ff_Xn[6]), 
        .Y(mux_sal[6]) );
  AO22XLTS U838 ( .A0(n1344), .A1(d_ff_Yn[5]), .B0(n1352), .B1(d_ff_Xn[5]), 
        .Y(mux_sal[5]) );
  AO22XLTS U839 ( .A0(n1344), .A1(d_ff_Yn[4]), .B0(n1352), .B1(d_ff_Xn[4]), 
        .Y(mux_sal[4]) );
  AO22XLTS U840 ( .A0(n1344), .A1(d_ff_Yn[3]), .B0(n1349), .B1(d_ff_Xn[3]), 
        .Y(mux_sal[3]) );
  AO22XLTS U841 ( .A0(n1344), .A1(d_ff_Yn[2]), .B0(n1349), .B1(d_ff_Xn[2]), 
        .Y(mux_sal[2]) );
  AO22XLTS U842 ( .A0(n1344), .A1(d_ff_Yn[1]), .B0(n1349), .B1(d_ff_Xn[1]), 
        .Y(mux_sal[1]) );
  AO22XLTS U843 ( .A0(n1344), .A1(d_ff_Yn[0]), .B0(n1357), .B1(d_ff_Xn[0]), 
        .Y(mux_sal[0]) );
  OAI21XLTS U844 ( .A0(beg_fsm_cordic), .A1(n1365), .B0(n1178), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  AO22XLTS U845 ( .A0(n1312), .A1(d_ff1_Z[63]), .B0(n1342), .B1(d_ff_Zn[63]), 
        .Y(first_mux_Z[63]) );
  AO22XLTS U846 ( .A0(n1325), .A1(d_ff1_Z[62]), .B0(n1342), .B1(d_ff_Zn[62]), 
        .Y(first_mux_Z[62]) );
  AO22XLTS U847 ( .A0(n1330), .A1(d_ff1_Z[61]), .B0(n1342), .B1(d_ff_Zn[61]), 
        .Y(first_mux_Z[61]) );
  AO22XLTS U848 ( .A0(n1332), .A1(d_ff1_Z[60]), .B0(n1342), .B1(d_ff_Zn[60]), 
        .Y(first_mux_Z[60]) );
  AO22XLTS U849 ( .A0(n1339), .A1(d_ff1_Z[59]), .B0(n1340), .B1(d_ff_Zn[59]), 
        .Y(first_mux_Z[59]) );
  AO22XLTS U850 ( .A0(n1330), .A1(d_ff1_Z[58]), .B0(n1340), .B1(d_ff_Zn[58]), 
        .Y(first_mux_Z[58]) );
  AO22XLTS U851 ( .A0(n1332), .A1(d_ff1_Z[57]), .B0(n1340), .B1(d_ff_Zn[57]), 
        .Y(first_mux_Z[57]) );
  AO22XLTS U852 ( .A0(n1312), .A1(d_ff1_Z[56]), .B0(n1340), .B1(d_ff_Zn[56]), 
        .Y(first_mux_Z[56]) );
  AO22XLTS U853 ( .A0(n1333), .A1(d_ff1_Z[55]), .B0(n1340), .B1(d_ff_Zn[55]), 
        .Y(first_mux_Z[55]) );
  AO22XLTS U854 ( .A0(n1336), .A1(d_ff1_Z[54]), .B0(n1340), .B1(d_ff_Zn[54]), 
        .Y(first_mux_Z[54]) );
  AO22XLTS U855 ( .A0(n1300), .A1(d_ff1_Z[53]), .B0(n1340), .B1(d_ff_Zn[53]), 
        .Y(first_mux_Z[53]) );
  AO22XLTS U856 ( .A0(n1325), .A1(d_ff1_Z[52]), .B0(n1340), .B1(d_ff_Zn[52]), 
        .Y(first_mux_Z[52]) );
  AO22XLTS U857 ( .A0(n1330), .A1(d_ff1_Z[51]), .B0(n1340), .B1(d_ff_Zn[51]), 
        .Y(first_mux_Z[51]) );
  AO22XLTS U858 ( .A0(n1332), .A1(d_ff1_Z[50]), .B0(n1340), .B1(d_ff_Zn[50]), 
        .Y(first_mux_Z[50]) );
  AO22XLTS U859 ( .A0(n1339), .A1(d_ff1_Z[49]), .B0(n1337), .B1(d_ff_Zn[49]), 
        .Y(first_mux_Z[49]) );
  AO22XLTS U860 ( .A0(n1312), .A1(d_ff1_Z[48]), .B0(n1337), .B1(d_ff_Zn[48]), 
        .Y(first_mux_Z[48]) );
  AO22XLTS U861 ( .A0(n1333), .A1(d_ff1_Z[47]), .B0(n1337), .B1(d_ff_Zn[47]), 
        .Y(first_mux_Z[47]) );
  AO22XLTS U862 ( .A0(n1312), .A1(d_ff1_Z[46]), .B0(n1337), .B1(d_ff_Zn[46]), 
        .Y(first_mux_Z[46]) );
  AO22XLTS U863 ( .A0(n1325), .A1(d_ff1_Z[45]), .B0(n1337), .B1(d_ff_Zn[45]), 
        .Y(first_mux_Z[45]) );
  AO22XLTS U864 ( .A0(n1332), .A1(d_ff1_Z[44]), .B0(n1337), .B1(d_ff_Zn[44]), 
        .Y(first_mux_Z[44]) );
  AO22XLTS U865 ( .A0(n1339), .A1(d_ff1_Z[43]), .B0(n1337), .B1(d_ff_Zn[43]), 
        .Y(first_mux_Z[43]) );
  AO22XLTS U866 ( .A0(n1330), .A1(d_ff1_Z[42]), .B0(n1337), .B1(d_ff_Zn[42]), 
        .Y(first_mux_Z[42]) );
  AO22XLTS U867 ( .A0(n1312), .A1(d_ff1_Z[41]), .B0(n1337), .B1(d_ff_Zn[41]), 
        .Y(first_mux_Z[41]) );
  AO22XLTS U868 ( .A0(n1333), .A1(d_ff1_Z[40]), .B0(n1337), .B1(d_ff_Zn[40]), 
        .Y(first_mux_Z[40]) );
  AO22XLTS U869 ( .A0(n1336), .A1(d_ff1_Z[39]), .B0(n1334), .B1(d_ff_Zn[39]), 
        .Y(first_mux_Z[39]) );
  AO22XLTS U870 ( .A0(n1300), .A1(d_ff1_Z[38]), .B0(n1334), .B1(d_ff_Zn[38]), 
        .Y(first_mux_Z[38]) );
  AO22XLTS U871 ( .A0(n1336), .A1(d_ff1_Z[37]), .B0(n1334), .B1(d_ff_Zn[37]), 
        .Y(first_mux_Z[37]) );
  AO22XLTS U872 ( .A0(n1300), .A1(d_ff1_Z[36]), .B0(n1334), .B1(d_ff_Zn[36]), 
        .Y(first_mux_Z[36]) );
  AO22XLTS U873 ( .A0(n1325), .A1(d_ff1_Z[35]), .B0(n1334), .B1(d_ff_Zn[35]), 
        .Y(first_mux_Z[35]) );
  AO22XLTS U874 ( .A0(n1330), .A1(d_ff1_Z[34]), .B0(n1334), .B1(d_ff_Zn[34]), 
        .Y(first_mux_Z[34]) );
  AO22XLTS U875 ( .A0(n1332), .A1(d_ff1_Z[33]), .B0(n1334), .B1(d_ff_Zn[33]), 
        .Y(first_mux_Z[33]) );
  AO22XLTS U876 ( .A0(n1339), .A1(d_ff1_Z[32]), .B0(n1334), .B1(d_ff_Zn[32]), 
        .Y(first_mux_Z[32]) );
  AO22XLTS U877 ( .A0(n1333), .A1(d_ff1_Z[31]), .B0(n1334), .B1(d_ff_Zn[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U878 ( .A0(n1336), .A1(d_ff1_Z[30]), .B0(n1334), .B1(d_ff_Zn[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U879 ( .A0(n1300), .A1(d_ff1_Z[29]), .B0(n1335), .B1(d_ff_Zn[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U880 ( .A0(n1336), .A1(d_ff1_Z[28]), .B0(n1341), .B1(d_ff_Zn[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U881 ( .A0(n1300), .A1(d_ff1_Z[27]), .B0(n1331), .B1(d_ff_Zn[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U882 ( .A0(n1343), .A1(d_ff1_Z[26]), .B0(n1335), .B1(d_ff_Zn[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U883 ( .A0(n1325), .A1(d_ff1_Z[25]), .B0(n1342), .B1(d_ff_Zn[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U884 ( .A0(n1332), .A1(d_ff1_Z[24]), .B0(n1331), .B1(d_ff_Zn[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U885 ( .A0(n1339), .A1(d_ff1_Z[23]), .B0(n1335), .B1(d_ff_Zn[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U886 ( .A0(n1330), .A1(d_ff1_Z[22]), .B0(n1342), .B1(d_ff_Zn[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U887 ( .A0(n1209), .A1(d_ff1_Z[21]), .B0(n1331), .B1(d_ff_Zn[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U888 ( .A0(n1343), .A1(d_ff1_Z[20]), .B0(n1331), .B1(d_ff_Zn[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U889 ( .A0(n1209), .A1(d_ff1_Z[19]), .B0(n1338), .B1(d_ff_Zn[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U890 ( .A0(n1343), .A1(d_ff1_Z[18]), .B0(n997), .B1(d_ff_Zn[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U891 ( .A0(n1343), .A1(d_ff1_Z[17]), .B0(n1329), .B1(d_ff_Zn[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U892 ( .A0(n1325), .A1(d_ff1_Z[16]), .B0(n1338), .B1(d_ff_Zn[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U893 ( .A0(n1330), .A1(d_ff1_Z[15]), .B0(n1335), .B1(d_ff_Zn[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U894 ( .A0(n1332), .A1(d_ff1_Z[14]), .B0(n1341), .B1(d_ff_Zn[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U895 ( .A0(n1312), .A1(d_ff1_Z[13]), .B0(n1341), .B1(d_ff_Zn[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U896 ( .A0(n1333), .A1(d_ff1_Z[12]), .B0(n1331), .B1(d_ff_Zn[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U897 ( .A0(n1339), .A1(d_ff1_Z[11]), .B0(n1331), .B1(d_ff_Zn[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U898 ( .A0(n1343), .A1(d_ff1_Z[10]), .B0(n1331), .B1(d_ff_Zn[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U899 ( .A0(n1333), .A1(d_ff1_Z[9]), .B0(n1361), .B1(d_ff_Zn[9]), 
        .Y(first_mux_Z[9]) );
  AO22XLTS U900 ( .A0(n1333), .A1(d_ff1_Z[8]), .B0(n1361), .B1(d_ff_Zn[8]), 
        .Y(first_mux_Z[8]) );
  AO22XLTS U901 ( .A0(n1336), .A1(d_ff1_Z[7]), .B0(n1361), .B1(d_ff_Zn[7]), 
        .Y(first_mux_Z[7]) );
  AO22XLTS U902 ( .A0(n1336), .A1(d_ff1_Z[6]), .B0(n1361), .B1(d_ff_Zn[6]), 
        .Y(first_mux_Z[6]) );
  AO22XLTS U903 ( .A0(n1300), .A1(d_ff1_Z[5]), .B0(n1338), .B1(d_ff_Zn[5]), 
        .Y(first_mux_Z[5]) );
  AO22XLTS U904 ( .A0(n1300), .A1(d_ff1_Z[4]), .B0(n1329), .B1(d_ff_Zn[4]), 
        .Y(first_mux_Z[4]) );
  AO22XLTS U905 ( .A0(n1343), .A1(d_ff1_Z[3]), .B0(n1342), .B1(d_ff_Zn[3]), 
        .Y(first_mux_Z[3]) );
  AO22XLTS U906 ( .A0(n1325), .A1(d_ff1_Z[2]), .B0(n1329), .B1(d_ff_Zn[2]), 
        .Y(first_mux_Z[2]) );
  AO22XLTS U907 ( .A0(n1312), .A1(d_ff1_Z[1]), .B0(n1335), .B1(d_ff_Zn[1]), 
        .Y(first_mux_Z[1]) );
  AO22XLTS U908 ( .A0(n1339), .A1(d_ff1_Z[0]), .B0(n1329), .B1(d_ff_Zn[0]), 
        .Y(first_mux_Z[0]) );
  OR2X1TS U909 ( .A(d_ff_Xn[59]), .B(n1210), .Y(first_mux_X[59]) );
  OR2X1TS U910 ( .A(d_ff_Xn[57]), .B(n1210), .Y(first_mux_X[57]) );
  OR2X1TS U911 ( .A(d_ff_Xn[49]), .B(n1211), .Y(first_mux_X[49]) );
  OR2X1TS U912 ( .A(d_ff_Xn[48]), .B(n1326), .Y(first_mux_X[48]) );
  OR2X1TS U913 ( .A(d_ff_Xn[45]), .B(n1210), .Y(first_mux_X[45]) );
  OR2X1TS U914 ( .A(d_ff_Xn[43]), .B(n1211), .Y(first_mux_X[43]) );
  OR2X1TS U915 ( .A(d_ff_Xn[42]), .B(n1210), .Y(first_mux_X[42]) );
  OR2X1TS U916 ( .A(d_ff_Xn[41]), .B(n1211), .Y(first_mux_X[41]) );
  OR2X1TS U917 ( .A(d_ff_Xn[36]), .B(n1326), .Y(first_mux_X[36]) );
  OR2X1TS U918 ( .A(d_ff_Xn[35]), .B(n1326), .Y(first_mux_X[35]) );
  OR2X1TS U919 ( .A(d_ff_Xn[34]), .B(n1211), .Y(first_mux_X[34]) );
  OR2X1TS U920 ( .A(d_ff_Xn[31]), .B(n1312), .Y(first_mux_X[31]) );
  OR2X1TS U921 ( .A(d_ff_Xn[29]), .B(n1339), .Y(first_mux_X[29]) );
  OR2X1TS U922 ( .A(d_ff_Xn[26]), .B(n1330), .Y(first_mux_X[26]) );
  OR2X1TS U923 ( .A(d_ff_Xn[24]), .B(n1326), .Y(first_mux_X[24]) );
  OR2X1TS U924 ( .A(d_ff_Xn[13]), .B(n1333), .Y(first_mux_X[13]) );
  OR2X1TS U925 ( .A(d_ff_Xn[11]), .B(n1300), .Y(first_mux_X[11]) );
  OR2X1TS U926 ( .A(d_ff_Xn[9]), .B(n1332), .Y(first_mux_X[9]) );
  OR2X1TS U927 ( .A(d_ff_Xn[7]), .B(n1343), .Y(first_mux_X[7]) );
  OR2X1TS U928 ( .A(d_ff_Xn[6]), .B(n1333), .Y(first_mux_X[6]) );
  OR2X1TS U929 ( .A(d_ff_Xn[3]), .B(n1336), .Y(first_mux_X[3]) );
  OR2X1TS U930 ( .A(d_ff_Xn[0]), .B(n1325), .Y(first_mux_X[0]) );
  XOR2XLTS U931 ( .A(n1435), .B(d_ff2_Y[62]), .Y(sh_exp_y[10]) );
  XOR2XLTS U932 ( .A(d_ff2_Y[61]), .B(n1434), .Y(sh_exp_y[9]) );
  AO21XLTS U933 ( .A0(d_ff2_Y[60]), .A1(n1430), .B0(n1434), .Y(sh_exp_y[8]) );
  AO21XLTS U934 ( .A0(d_ff2_Y[58]), .A1(n1432), .B0(n1431), .Y(sh_exp_y[6]) );
  OAI21XLTS U935 ( .A0(n1433), .A1(n1452), .B0(n1432), .Y(sh_exp_y[5]) );
  AO21XLTS U936 ( .A0(intadd_460_n1), .A1(d_ff2_Y[56]), .B0(n1433), .Y(
        sh_exp_y[4]) );
  OAI21XLTS U937 ( .A0(n1145), .A1(n1446), .B0(intadd_460_CI), .Y(sh_exp_y[0])
         );
  XOR2XLTS U938 ( .A(n1441), .B(d_ff2_X[62]), .Y(sh_exp_x[10]) );
  XOR2XLTS U939 ( .A(d_ff2_X[61]), .B(n1440), .Y(sh_exp_x[9]) );
  AO21XLTS U940 ( .A0(d_ff2_X[60]), .A1(n1436), .B0(n1440), .Y(sh_exp_x[8]) );
  OAI21XLTS U941 ( .A0(n1437), .A1(n1173), .B0(n1436), .Y(sh_exp_x[7]) );
  AO21XLTS U942 ( .A0(d_ff2_X[58]), .A1(n1438), .B0(n1437), .Y(sh_exp_x[6]) );
  OAI21XLTS U943 ( .A0(n1439), .A1(n1451), .B0(n1438), .Y(sh_exp_x[5]) );
  AO21XLTS U944 ( .A0(intadd_459_n1), .A1(d_ff2_X[56]), .B0(n1439), .Y(
        sh_exp_x[4]) );
  OAI21XLTS U945 ( .A0(n1145), .A1(n1445), .B0(intadd_459_CI), .Y(sh_exp_x[0])
         );
  NAND2BXLTS U946 ( .AN(n1424), .B(n1423), .Y(n972) );
  OAI211XLTS U947 ( .A0(n1420), .A1(n1411), .B0(n1174), .C0(n1423), .Y(n967)
         );
  OAI21XLTS U948 ( .A0(n1318), .A1(n1419), .B0(n1156), .Y(n966) );
  OAI211XLTS U949 ( .A0(n1138), .A1(n1419), .B0(n1159), .C0(n1411), .Y(n980)
         );
  OAI21XLTS U950 ( .A0(n1427), .A1(n1146), .B0(n1170), .Y(n984) );
  AO21XLTS U951 ( .A0(n1143), .A1(n1146), .B0(n1424), .Y(n973) );
  OAI211XLTS U952 ( .A0(n1146), .A1(n1419), .B0(n1160), .C0(n1409), .Y(n964)
         );
  OAI21XLTS U953 ( .A0(n1171), .A1(n1427), .B0(n1175), .Y(n969) );
  NAND2BXLTS U954 ( .AN(n1421), .B(n1138), .Y(n999) );
  OAI21XLTS U955 ( .A0(n1143), .A1(n1410), .B0(n1157), .Y(n963) );
  AO21XLTS U956 ( .A0(n1416), .A1(n1146), .B0(n1412), .Y(n993) );
  OAI211XLTS U957 ( .A0(n1175), .A1(n1140), .B0(n1174), .C0(n1409), .Y(n968)
         );
  BUFX3TS U958 ( .A(n1338), .Y(n1341) );
  BUFX3TS U959 ( .A(n1338), .Y(n1361) );
  CLKBUFX2TS U960 ( .A(cont_iter_out[1]), .Y(n1427) );
  CLKBUFX2TS U961 ( .A(n1533), .Y(n1527) );
  INVX2TS U962 ( .A(n1136), .Y(n1137) );
  INVX2TS U963 ( .A(n1136), .Y(n1138) );
  INVX2TS U964 ( .A(n1142), .Y(n1140) );
  INVX2TS U965 ( .A(n1427), .Y(n1141) );
  INVX2TS U966 ( .A(n1141), .Y(n1142) );
  INVX2TS U967 ( .A(n1141), .Y(n1143) );
  NOR3X1TS U968 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[1]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .Y(n1148) );
  CLKINVX3TS U969 ( .A(n1338), .Y(n1360) );
  CLKINVX3TS U970 ( .A(n1338), .Y(n1364) );
  CLKINVX3TS U971 ( .A(n1338), .Y(n1328) );
  NOR2X2TS U972 ( .A(n1422), .B(n1412), .Y(ITER_CONT_N3) );
  NOR2X2TS U973 ( .A(cont_iter_out[3]), .B(n1140), .Y(n1415) );
  CLKBUFX3TS U974 ( .A(n1527), .Y(n1530) );
  NOR2X4TS U975 ( .A(n1143), .B(n1454), .Y(n1421) );
  BUFX3TS U976 ( .A(n1529), .Y(n1519) );
  BUFX3TS U977 ( .A(n1521), .Y(n1520) );
  BUFX3TS U978 ( .A(n1524), .Y(n1521) );
  BUFX3TS U979 ( .A(n1150), .Y(n1524) );
  AOI222X1TS U980 ( .A0(n1265), .A1(d_ff2_X[53]), .B0(n1263), .B1(d_ff2_Y[53]), 
        .C0(n1207), .C1(d_ff2_Z[53]), .Y(n1206) );
  CLKINVX3TS U981 ( .A(n1230), .Y(n1265) );
  CLKBUFX3TS U982 ( .A(n1529), .Y(n1528) );
  NOR2X4TS U983 ( .A(n1171), .B(n1137), .Y(n1318) );
  NOR2X4TS U984 ( .A(n1442), .B(n1139), .Y(n1171) );
  NAND4X2TS U985 ( .A(n1147), .B(inst_CORDIC_FSM_v3_state_reg[4]), .C(n1449), 
        .D(n1534), .Y(n1368) );
  AOI211X2TS U986 ( .A0(n1420), .A1(n1454), .B0(n1315), .C0(n1143), .Y(n1424)
         );
  CLKINVX3TS U987 ( .A(n1374), .Y(n1204) );
  CLKINVX3TS U988 ( .A(n1374), .Y(n1220) );
  CLKINVX3TS U989 ( .A(n1374), .Y(n1406) );
  CLKINVX3TS U990 ( .A(n1374), .Y(n1389) );
  CLKINVX3TS U991 ( .A(n1230), .Y(n1296) );
  CLKINVX3TS U992 ( .A(n1374), .Y(n1270) );
  CLKINVX3TS U993 ( .A(n1374), .Y(n1288) );
  CLKINVX3TS U994 ( .A(n1374), .Y(n1402) );
  CLKINVX3TS U995 ( .A(n1230), .Y(n1310) );
  CLKINVX3TS U996 ( .A(n1230), .Y(n1243) );
  NOR3X2TS U997 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(n1449), .C(n1176), 
        .Y(ready_cordic) );
  NAND2X2TS U998 ( .A(n1442), .B(n1454), .Y(n1416) );
  CLKBUFX3TS U999 ( .A(n1150), .Y(n1533) );
  CLKBUFX3TS U1000 ( .A(n1526), .Y(n1531) );
  CLKBUFX3TS U1001 ( .A(n1533), .Y(n1526) );
  NOR2X2TS U1002 ( .A(n1314), .B(n1313), .Y(enab_d_ff4_Zn) );
  OAI21XLTS U1003 ( .A0(n1370), .A1(n985), .B0(n1371), .Y(enab_d_ff5_data_out)
         );
  NAND2X2TS U1004 ( .A(n1171), .B(n1422), .Y(n985) );
  CLKINVX3TS U1005 ( .A(n1230), .Y(n1223) );
  NOR4X2TS U1006 ( .A(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[3]), .C(inst_CORDIC_FSM_v3_state_reg[7]), 
        .D(inst_CORDIC_FSM_v3_state_reg[6]), .Y(n1151) );
  OAI32X4TS U1007 ( .A0(n1144), .A1(d_ff1_shift_region_flag_out[1]), .A2(
        d_ff1_operation_out), .B0(d_ff1_shift_region_flag_out[0]), .B1(n1321), 
        .Y(n1322) );
  NOR2X2TS U1008 ( .A(d_ff2_Y[60]), .B(n1430), .Y(n1434) );
  NOR2X2TS U1009 ( .A(d_ff2_X[60]), .B(n1436), .Y(n1440) );
  BUFX3TS U1010 ( .A(n1529), .Y(n1532) );
  BUFX3TS U1011 ( .A(n1526), .Y(n1529) );
  OR2X1TS U1012 ( .A(n1415), .B(n1425), .Y(n970) );
  AOI21X2TS U1013 ( .A0(n1444), .A1(n1454), .B0(cont_iter_out[3]), .Y(n1425)
         );
  OAI32X1TS U1014 ( .A0(n1140), .A1(cont_iter_out[2]), .A2(n1413), .B0(n1427), 
        .B1(n1414), .Y(n994) );
  BUFX3TS U1015 ( .A(n997), .Y(n1329) );
  CLKBUFX2TS U1016 ( .A(n1179), .Y(n1277) );
  CLKBUFX2TS U1017 ( .A(n1401), .Y(n1275) );
  BUFX3TS U1018 ( .A(n1189), .Y(n1202) );
  INVX2TS U1019 ( .A(rst), .Y(n1150) );
  OAI21XLTS U1020 ( .A0(n1392), .A1(n1368), .B0(n1155), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  OR2X1TS U1021 ( .A(d_ff_Xn[60]), .B(n1324), .Y(first_mux_X[60]) );
  OR2X1TS U1022 ( .A(d_ff_Xn[53]), .B(n1324), .Y(first_mux_X[53]) );
  OR2X1TS U1023 ( .A(d_ff_Xn[46]), .B(n1324), .Y(first_mux_X[46]) );
  OR2X1TS U1024 ( .A(d_ff_Xn[39]), .B(n1324), .Y(first_mux_X[39]) );
  OR2X1TS U1025 ( .A(d_ff_Xn[32]), .B(n1343), .Y(first_mux_X[32]) );
  OR2X1TS U1026 ( .A(d_ff_Xn[28]), .B(n1330), .Y(first_mux_X[28]) );
  OR2X1TS U1027 ( .A(d_ff_Xn[19]), .B(n1339), .Y(first_mux_X[19]) );
  OR2X1TS U1028 ( .A(d_ff_Xn[14]), .B(n1332), .Y(first_mux_X[14]) );
  OR2X1TS U1029 ( .A(d_ff_Xn[8]), .B(n1343), .Y(first_mux_X[8]) );
  NAND2X1TS U1030 ( .A(n1137), .B(n1412), .Y(n997) );
  OAI211XLTS U1031 ( .A0(ITER_CONT_N3), .A1(n1414), .B0(n1317), .C0(n1410), 
        .Y(n989) );
  OAI21XLTS U1032 ( .A0(n1230), .A1(n1173), .B0(n1172), .Y(add_subt_dataA[59])
         );
  NAND2X2TS U1033 ( .A(n1145), .B(n1142), .Y(n1419) );
  INVX2TS U1034 ( .A(n1419), .Y(n1422) );
  AOI21X1TS U1035 ( .A0(n1444), .A1(n1135), .B0(cont_iter_out[3]), .Y(n1159)
         );
  NAND2X2TS U1036 ( .A(n1454), .B(n1141), .Y(n1411) );
  NAND2X2TS U1037 ( .A(n1444), .B(cont_iter_out[3]), .Y(n1410) );
  INVX2TS U1038 ( .A(n1410), .Y(n1420) );
  INVX2TS U1039 ( .A(n1318), .Y(n1414) );
  NAND2X1TS U1040 ( .A(n1421), .B(n1414), .Y(n1174) );
  OR3X1TS U1041 ( .A(d_ff2_Y[57]), .B(d_ff2_Y[56]), .C(intadd_460_n1), .Y(
        n1432) );
  NOR2X2TS U1042 ( .A(d_ff2_Y[58]), .B(n1432), .Y(n1431) );
  NAND2X1TS U1043 ( .A(n1448), .B(n1431), .Y(n1430) );
  OAI21XLTS U1044 ( .A0(n1431), .A1(n1448), .B0(n1430), .Y(sh_exp_y[7]) );
  OR4X2TS U1045 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[1]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .D(inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1154) );
  NOR2X1TS U1046 ( .A(inst_CORDIC_FSM_v3_state_reg[3]), .B(n1154), .Y(n1147)
         );
  NAND2BX1TS U1047 ( .AN(inst_CORDIC_FSM_v3_state_reg[4]), .B(n1147), .Y(n1176) );
  INVX2TS U1048 ( .A(n1411), .Y(n1412) );
  NAND3X1TS U1049 ( .A(inst_CORDIC_FSM_v3_state_reg[5]), .B(n1148), .C(n1151), 
        .Y(n1369) );
  NAND2X1TS U1050 ( .A(n1368), .B(n1369), .Y(beg_add_subt) );
  NOR3BX1TS U1051 ( .AN(n1151), .B(inst_CORDIC_FSM_v3_state_reg[2]), .C(
        inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1149) );
  NAND3X1TS U1052 ( .A(inst_CORDIC_FSM_v3_state_reg[0]), .B(n1149), .C(n1450), 
        .Y(n1365) );
  NAND2X1TS U1053 ( .A(n1366), .B(n1365), .Y(enab_d_ff_RB1) );
  BUFX3TS U1054 ( .A(n1524), .Y(n1490) );
  BUFX3TS U1055 ( .A(n1524), .Y(n1489) );
  BUFX3TS U1056 ( .A(n1524), .Y(n1491) );
  CLKBUFX3TS U1057 ( .A(n1150), .Y(n1525) );
  BUFX3TS U1058 ( .A(n1525), .Y(n1518) );
  CLKBUFX3TS U1059 ( .A(n1518), .Y(n1523) );
  BUFX3TS U1060 ( .A(n1523), .Y(n1492) );
  BUFX3TS U1061 ( .A(n1523), .Y(n1493) );
  BUFX3TS U1062 ( .A(n1519), .Y(n1494) );
  BUFX3TS U1063 ( .A(n1520), .Y(n1495) );
  BUFX3TS U1064 ( .A(n1519), .Y(n1507) );
  BUFX3TS U1065 ( .A(n1519), .Y(n1508) );
  BUFX3TS U1066 ( .A(n1519), .Y(n1509) );
  BUFX3TS U1067 ( .A(n1518), .Y(n1510) );
  BUFX3TS U1068 ( .A(n1518), .Y(n1511) );
  BUFX3TS U1069 ( .A(n1518), .Y(n1512) );
  BUFX3TS U1070 ( .A(n1150), .Y(n1513) );
  BUFX3TS U1071 ( .A(n1150), .Y(n1514) );
  BUFX3TS U1072 ( .A(n1518), .Y(n1515) );
  CLKBUFX3TS U1073 ( .A(n1523), .Y(n1522) );
  BUFX3TS U1074 ( .A(n1522), .Y(n1497) );
  BUFX3TS U1075 ( .A(n1522), .Y(n1498) );
  BUFX3TS U1076 ( .A(n1521), .Y(n1499) );
  BUFX3TS U1077 ( .A(n1521), .Y(n1500) );
  BUFX3TS U1078 ( .A(n1522), .Y(n1496) );
  BUFX3TS U1079 ( .A(n1520), .Y(n1501) );
  BUFX3TS U1080 ( .A(n1520), .Y(n1502) );
  BUFX3TS U1081 ( .A(n1520), .Y(n1503) );
  BUFX3TS U1082 ( .A(n1523), .Y(n1504) );
  BUFX3TS U1083 ( .A(n1150), .Y(n1505) );
  BUFX3TS U1084 ( .A(n1520), .Y(n1506) );
  BUFX3TS U1085 ( .A(n1531), .Y(n1463) );
  BUFX3TS U1086 ( .A(n1531), .Y(n1462) );
  BUFX3TS U1087 ( .A(n1526), .Y(n1473) );
  BUFX3TS U1088 ( .A(n1531), .Y(n1461) );
  BUFX3TS U1089 ( .A(n1528), .Y(n1474) );
  BUFX3TS U1090 ( .A(n1528), .Y(n1475) );
  BUFX3TS U1091 ( .A(n1531), .Y(n1460) );
  BUFX3TS U1092 ( .A(n1528), .Y(n1476) );
  BUFX3TS U1093 ( .A(n1527), .Y(n1477) );
  BUFX3TS U1094 ( .A(n1527), .Y(n1478) );
  BUFX3TS U1095 ( .A(n1531), .Y(n1459) );
  BUFX3TS U1096 ( .A(n1527), .Y(n1479) );
  BUFX3TS U1097 ( .A(n1526), .Y(n1480) );
  BUFX3TS U1098 ( .A(n1526), .Y(n1481) );
  BUFX3TS U1099 ( .A(n1530), .Y(n1458) );
  BUFX3TS U1100 ( .A(n1526), .Y(n1482) );
  BUFX3TS U1101 ( .A(n1533), .Y(n1483) );
  BUFX3TS U1102 ( .A(n1530), .Y(n1457) );
  BUFX3TS U1103 ( .A(n1530), .Y(n1484) );
  BUFX3TS U1104 ( .A(n1530), .Y(n1456) );
  BUFX3TS U1105 ( .A(n1533), .Y(n1485) );
  BUFX3TS U1106 ( .A(n1530), .Y(n1455) );
  BUFX3TS U1107 ( .A(n1529), .Y(n1470) );
  CLKBUFX2TS U1108 ( .A(n1523), .Y(n1517) );
  BUFX3TS U1109 ( .A(n1529), .Y(n1471) );
  BUFX3TS U1110 ( .A(n1519), .Y(n1516) );
  BUFX3TS U1111 ( .A(n1532), .Y(n1467) );
  BUFX3TS U1112 ( .A(n1532), .Y(n1466) );
  BUFX3TS U1113 ( .A(n1532), .Y(n1469) );
  BUFX3TS U1114 ( .A(n1532), .Y(n1468) );
  BUFX3TS U1115 ( .A(n1531), .Y(n1464) );
  BUFX3TS U1116 ( .A(n1532), .Y(n1465) );
  BUFX3TS U1117 ( .A(n1533), .Y(n1472) );
  OAI21XLTS U1118 ( .A0(n1444), .A1(n1140), .B0(n1442), .Y(n1000) );
  INVX2TS U1119 ( .A(n1416), .Y(n1413) );
  OAI21XLTS U1120 ( .A0(cont_iter_out[2]), .A1(n1140), .B0(n1413), .Y(n990) );
  NOR2BX1TS U1121 ( .AN(n1151), .B(inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1152)
         );
  AND4X1TS U1122 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(n1152), .C(n1443), 
        .D(n1450), .Y(inst_CORDIC_FSM_v3_state_next[3]) );
  BUFX3TS U1123 ( .A(n1525), .Y(n1486) );
  BUFX3TS U1124 ( .A(n1525), .Y(n1487) );
  BUFX3TS U1125 ( .A(n1525), .Y(n1488) );
  NAND2X1TS U1126 ( .A(n1445), .B(n1145), .Y(intadd_459_CI) );
  NAND2X1TS U1127 ( .A(n1446), .B(n1145), .Y(intadd_460_CI) );
  INVX2TS U1128 ( .A(n1425), .Y(n1175) );
  INVX2TS U1129 ( .A(ready_add_subt), .Y(n1314) );
  OR2X2TS U1130 ( .A(n1447), .B(cont_var_out[1]), .Y(n1374) );
  OAI2BB1X1TS U1131 ( .A0N(n1145), .A1N(n1137), .B0(n1142), .Y(n1426) );
  OAI21X1TS U1132 ( .A0(n1143), .A1(n1413), .B0(n1426), .Y(n976) );
  OR2X1TS U1133 ( .A(n976), .B(cont_iter_out[2]), .Y(n978) );
  OR3X1TS U1134 ( .A(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[7]), .C(inst_CORDIC_FSM_v3_state_reg[6]), 
        .Y(n1153) );
  NOR3BX2TS U1135 ( .AN(inst_CORDIC_FSM_v3_state_reg[3]), .B(n1154), .C(n1153), 
        .Y(enab_RB3) );
  NAND2X1TS U1136 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .Y(n1367) );
  INVX2TS U1137 ( .A(n1367), .Y(n1189) );
  BUFX3TS U1138 ( .A(n1275), .Y(n1392) );
  INVX2TS U1139 ( .A(enab_RB3), .Y(n1155) );
  AOI22X1TS U1140 ( .A0(cont_iter_out[2]), .A1(n1421), .B0(n1134), .B1(n1410), 
        .Y(n1156) );
  NOR2X1TS U1141 ( .A(d_ff2_X[56]), .B(intadd_459_n1), .Y(n1439) );
  OR3X1TS U1142 ( .A(d_ff2_X[57]), .B(d_ff2_X[56]), .C(intadd_459_n1), .Y(
        n1438) );
  NOR2X1TS U1143 ( .A(d_ff2_Y[56]), .B(intadd_460_n1), .Y(n1433) );
  NOR2X1TS U1144 ( .A(cont_iter_out[3]), .B(n1454), .Y(n1315) );
  AOI21X1TS U1145 ( .A0(n1318), .A1(n1134), .B0(n1315), .Y(n1157) );
  NAND2X1TS U1146 ( .A(n1442), .B(n1419), .Y(n1158) );
  OAI21X1TS U1147 ( .A0(n1318), .A1(n1419), .B0(n1158), .Y(n983) );
  INVX2TS U1148 ( .A(n983), .Y(n1453) );
  INVX2TS U1149 ( .A(n1159), .Y(n1003) );
  AOI22X1TS U1150 ( .A0(n1138), .A1(n1134), .B0(n1421), .B1(n1444), .Y(n1160)
         );
  NAND2X1TS U1151 ( .A(n1318), .B(n1412), .Y(n1409) );
  AOI22X1TS U1152 ( .A0(n1421), .A1(n1139), .B0(n1422), .B1(n1442), .Y(n1161)
         );
  OAI31X1TS U1153 ( .A0(n1171), .A1(n1145), .A2(n1415), .B0(n1161), .Y(n965)
         );
  NAND2X1TS U1154 ( .A(n1447), .B(cont_var_out[1]), .Y(n1313) );
  INVX2TS U1155 ( .A(n1313), .Y(n1179) );
  BUFX3TS U1156 ( .A(n1388), .Y(n1405) );
  AOI222X1TS U1157 ( .A0(n1406), .A1(d_ff2_X[22]), .B0(n1242), .B1(d_ff2_Y[22]), .C0(n1193), .C1(d_ff2_Z[22]), .Y(n1162) );
  INVX2TS U1158 ( .A(n1162), .Y(add_subt_dataA[22]) );
  AOI222X1TS U1159 ( .A0(n1220), .A1(d_ff2_X[21]), .B0(n1242), .B1(d_ff2_Y[21]), .C0(n1193), .C1(d_ff2_Z[21]), .Y(n1163) );
  INVX2TS U1160 ( .A(n1163), .Y(add_subt_dataA[21]) );
  AOI222X1TS U1161 ( .A0(n1389), .A1(d_ff2_X[23]), .B0(n1242), .B1(d_ff2_Y[23]), .C0(n1193), .C1(d_ff2_Z[23]), .Y(n1164) );
  INVX2TS U1162 ( .A(n1164), .Y(add_subt_dataA[23]) );
  AOI222X1TS U1163 ( .A0(n1406), .A1(d_ff2_X[20]), .B0(n1242), .B1(d_ff2_Y[20]), .C0(n1193), .C1(d_ff2_Z[20]), .Y(n1165) );
  INVX2TS U1164 ( .A(n1165), .Y(add_subt_dataA[20]) );
  OAI22X1TS U1165 ( .A0(n1444), .A1(n1419), .B0(n1422), .B1(cont_iter_out[2]), 
        .Y(data_out_LUT[54]) );
  INVX2TS U1166 ( .A(data_out_LUT[54]), .Y(ITER_CONT_N4) );
  AOI222X1TS U1167 ( .A0(n1243), .A1(d_ff2_X[15]), .B0(n1256), .B1(d_ff2_Y[15]), .C0(n1193), .C1(d_ff2_Z[15]), .Y(n1166) );
  INVX2TS U1168 ( .A(n1166), .Y(add_subt_dataA[15]) );
  AOI222X1TS U1169 ( .A0(n1243), .A1(d_ff2_X[16]), .B0(n1256), .B1(d_ff2_Y[16]), .C0(n1193), .C1(d_ff2_Z[16]), .Y(n1167) );
  INVX2TS U1170 ( .A(n1167), .Y(add_subt_dataA[16]) );
  AOI222X1TS U1171 ( .A0(n1243), .A1(d_ff2_X[19]), .B0(n1242), .B1(d_ff2_Y[19]), .C0(n1193), .C1(d_ff2_Z[19]), .Y(n1168) );
  INVX2TS U1172 ( .A(n1168), .Y(add_subt_dataA[19]) );
  AOI222X1TS U1173 ( .A0(n1243), .A1(d_ff2_X[17]), .B0(n1256), .B1(d_ff2_Y[17]), .C0(n1193), .C1(d_ff2_Z[17]), .Y(n1169) );
  INVX2TS U1174 ( .A(n1169), .Y(add_subt_dataA[17]) );
  AOI22X1TS U1175 ( .A0(cont_iter_out[2]), .A1(n1134), .B0(n1422), .B1(n1414), 
        .Y(n1170) );
  NOR2X2TS U1176 ( .A(d_ff2_X[58]), .B(n1438), .Y(n1437) );
  AOI22X1TS U1177 ( .A0(n1388), .A1(d_ff2_Y[59]), .B0(n1392), .B1(d_ff2_Z[59]), 
        .Y(n1172) );
  NOR3X2TS U1178 ( .A(inst_CORDIC_FSM_v3_state_reg[7]), .B(n1176), .C(n1534), 
        .Y(enab_cont_iter) );
  INVX2TS U1179 ( .A(enab_cont_iter), .Y(n1370) );
  INVX2TS U1180 ( .A(ready_cordic), .Y(n1371) );
  NOR4X1TS U1181 ( .A(enab_RB3), .B(inst_CORDIC_FSM_v3_state_next[3]), .C(
        enab_d_ff_RB1), .D(beg_add_subt), .Y(n1177) );
  AOI32X1TS U1182 ( .A0(n1177), .A1(n1371), .A2(n1370), .B0(ready_cordic), 
        .B1(ack_cordic), .Y(n1178) );
  AOI222X1TS U1183 ( .A0(n1204), .A1(d_ff2_X[36]), .B0(n1222), .B1(d_ff2_Y[36]), .C0(n1202), .C1(d_ff2_Z[36]), .Y(n1180) );
  INVX2TS U1184 ( .A(n1180), .Y(add_subt_dataA[36]) );
  AOI222X1TS U1185 ( .A0(n1223), .A1(d_ff2_X[45]), .B0(n1222), .B1(d_ff2_Y[45]), .C0(n1207), .C1(d_ff2_Z[45]), .Y(n1181) );
  INVX2TS U1186 ( .A(n1181), .Y(add_subt_dataA[45]) );
  CLKBUFX2TS U1187 ( .A(n1277), .Y(n1231) );
  AOI222X1TS U1188 ( .A0(n1265), .A1(d_ff2_X[50]), .B0(n1263), .B1(d_ff2_Y[50]), .C0(n1207), .C1(d_ff2_Z[50]), .Y(n1182) );
  INVX2TS U1189 ( .A(n1182), .Y(add_subt_dataA[50]) );
  AOI222X1TS U1190 ( .A0(n1265), .A1(d_ff2_X[51]), .B0(n1263), .B1(d_ff2_Y[51]), .C0(n1207), .C1(d_ff2_Z[51]), .Y(n1183) );
  INVX2TS U1191 ( .A(n1183), .Y(add_subt_dataA[51]) );
  AOI222X1TS U1192 ( .A0(n1265), .A1(d_ff2_X[52]), .B0(n1263), .B1(d_ff2_Y[52]), .C0(n1207), .C1(d_ff2_Z[52]), .Y(n1184) );
  INVX2TS U1193 ( .A(n1184), .Y(add_subt_dataA[52]) );
  BUFX3TS U1194 ( .A(n1231), .Y(n1203) );
  AOI222X1TS U1195 ( .A0(n1204), .A1(d_ff2_X[37]), .B0(n1203), .B1(d_ff2_Y[37]), .C0(n1202), .C1(d_ff2_Z[37]), .Y(n1185) );
  INVX2TS U1196 ( .A(n1185), .Y(add_subt_dataA[37]) );
  INVX2TS U1197 ( .A(n1186), .Y(add_subt_dataA[54]) );
  AOI222X1TS U1198 ( .A0(n1204), .A1(d_ff2_X[30]), .B0(n1203), .B1(d_ff2_Y[30]), .C0(n1189), .C1(d_ff2_Z[30]), .Y(n1187) );
  INVX2TS U1199 ( .A(n1187), .Y(add_subt_dataA[30]) );
  AOI222X1TS U1200 ( .A0(n1204), .A1(d_ff2_X[39]), .B0(n1222), .B1(d_ff2_Y[39]), .C0(n1401), .C1(d_ff2_Z[39]), .Y(n1188) );
  INVX2TS U1201 ( .A(n1188), .Y(add_subt_dataA[39]) );
  AOI222X1TS U1202 ( .A0(n1204), .A1(d_ff2_X[31]), .B0(n1263), .B1(d_ff2_Y[31]), .C0(n1189), .C1(d_ff2_Z[31]), .Y(n1190) );
  INVX2TS U1203 ( .A(n1190), .Y(add_subt_dataA[31]) );
  AOI222X1TS U1204 ( .A0(n1243), .A1(d_ff2_X[18]), .B0(n1203), .B1(d_ff2_Y[18]), .C0(n1193), .C1(d_ff2_Z[18]), .Y(n1191) );
  INVX2TS U1205 ( .A(n1191), .Y(add_subt_dataA[18]) );
  AOI222X1TS U1206 ( .A0(n1204), .A1(d_ff2_X[33]), .B0(n1203), .B1(d_ff2_Y[33]), .C0(n1202), .C1(d_ff2_Z[33]), .Y(n1192) );
  INVX2TS U1207 ( .A(n1192), .Y(add_subt_dataA[33]) );
  AOI222X1TS U1208 ( .A0(n1220), .A1(d_ff2_X[24]), .B0(n1203), .B1(d_ff2_Y[24]), .C0(n1193), .C1(d_ff2_Z[24]), .Y(n1194) );
  INVX2TS U1209 ( .A(n1194), .Y(add_subt_dataA[24]) );
  AOI222X1TS U1210 ( .A0(n1223), .A1(d_ff2_X[47]), .B0(n1222), .B1(d_ff2_Y[47]), .C0(n1207), .C1(d_ff2_Z[47]), .Y(n1195) );
  INVX2TS U1211 ( .A(n1195), .Y(add_subt_dataA[47]) );
  AOI222X1TS U1212 ( .A0(n1223), .A1(d_ff2_X[48]), .B0(n1263), .B1(d_ff2_Y[48]), .C0(n1207), .C1(d_ff2_Z[48]), .Y(n1196) );
  INVX2TS U1213 ( .A(n1196), .Y(add_subt_dataA[48]) );
  AOI222X1TS U1214 ( .A0(n1204), .A1(d_ff2_X[34]), .B0(n1203), .B1(d_ff2_Y[34]), .C0(n1202), .C1(d_ff2_Z[34]), .Y(n1197) );
  INVX2TS U1215 ( .A(n1197), .Y(add_subt_dataA[34]) );
  AOI222X1TS U1216 ( .A0(n1389), .A1(d_ff2_X[29]), .B0(n1203), .B1(d_ff2_Y[29]), .C0(n1401), .C1(d_ff2_Z[29]), .Y(n1198) );
  INVX2TS U1217 ( .A(n1198), .Y(add_subt_dataA[29]) );
  AOI222X1TS U1218 ( .A0(n1204), .A1(d_ff2_X[38]), .B0(n1203), .B1(d_ff2_Y[38]), .C0(n1202), .C1(d_ff2_Z[38]), .Y(n1199) );
  INVX2TS U1219 ( .A(n1199), .Y(add_subt_dataA[38]) );
  AOI222X1TS U1220 ( .A0(n1223), .A1(d_ff2_X[46]), .B0(n1222), .B1(d_ff2_Y[46]), .C0(n1207), .C1(d_ff2_Z[46]), .Y(n1200) );
  INVX2TS U1221 ( .A(n1200), .Y(add_subt_dataA[46]) );
  AOI222X1TS U1222 ( .A0(n1204), .A1(d_ff2_X[35]), .B0(n1203), .B1(d_ff2_Y[35]), .C0(n1202), .C1(d_ff2_Z[35]), .Y(n1201) );
  INVX2TS U1223 ( .A(n1201), .Y(add_subt_dataA[35]) );
  AOI222X1TS U1224 ( .A0(n1204), .A1(d_ff2_X[32]), .B0(n1203), .B1(d_ff2_Y[32]), .C0(n1202), .C1(d_ff2_Z[32]), .Y(n1205) );
  INVX2TS U1225 ( .A(n1205), .Y(add_subt_dataA[32]) );
  INVX2TS U1226 ( .A(n1206), .Y(add_subt_dataA[53]) );
  AOI222X1TS U1227 ( .A0(n1223), .A1(d_ff2_X[49]), .B0(n1263), .B1(d_ff2_Y[49]), .C0(n1207), .C1(d_ff2_Z[49]), .Y(n1208) );
  INVX2TS U1228 ( .A(n1208), .Y(add_subt_dataA[49]) );
  INVX2TS U1229 ( .A(n1428), .Y(n1429) );
  CLKBUFX2TS U1230 ( .A(n1405), .Y(n1396) );
  AOI21X1TS U1231 ( .A0(n1429), .A1(cont_var_out[1]), .B0(n1179), .Y(n1212) );
  BUFX3TS U1232 ( .A(n1401), .Y(n1246) );
  AOI222X1TS U1233 ( .A0(n1406), .A1(d_ff2_X[26]), .B0(n1242), .B1(d_ff2_Y[26]), .C0(n1246), .C1(d_ff2_Z[26]), .Y(n1213) );
  INVX2TS U1234 ( .A(n1213), .Y(add_subt_dataA[26]) );
  AOI222X1TS U1235 ( .A0(n1223), .A1(d_ff2_X[40]), .B0(n1222), .B1(d_ff2_Y[40]), .C0(n1246), .C1(d_ff2_Z[40]), .Y(n1214) );
  INVX2TS U1236 ( .A(n1214), .Y(add_subt_dataA[40]) );
  AOI222X1TS U1237 ( .A0(n1223), .A1(d_ff2_X[42]), .B0(n1222), .B1(d_ff2_Y[42]), .C0(n1246), .C1(d_ff2_Z[42]), .Y(n1215) );
  INVX2TS U1238 ( .A(n1215), .Y(add_subt_dataA[42]) );
  AOI222X1TS U1239 ( .A0(n1220), .A1(d_ff2_X[27]), .B0(n1242), .B1(d_ff2_Y[27]), .C0(n1275), .C1(d_ff2_Z[27]), .Y(n1216) );
  INVX2TS U1240 ( .A(n1216), .Y(add_subt_dataA[27]) );
  AOI222X1TS U1241 ( .A0(n1223), .A1(d_ff2_X[41]), .B0(n1222), .B1(d_ff2_Y[41]), .C0(n1275), .C1(d_ff2_Z[41]), .Y(n1217) );
  INVX2TS U1242 ( .A(n1217), .Y(add_subt_dataA[41]) );
  CLKBUFX2TS U1243 ( .A(n1401), .Y(n1395) );
  AOI222X1TS U1244 ( .A0(n1389), .A1(d_ff2_X[25]), .B0(n1242), .B1(d_ff2_Y[25]), .C0(n1395), .C1(d_ff2_Z[25]), .Y(n1218) );
  INVX2TS U1245 ( .A(n1218), .Y(add_subt_dataA[25]) );
  AOI222X1TS U1246 ( .A0(n1223), .A1(d_ff2_X[44]), .B0(n1222), .B1(d_ff2_Y[44]), .C0(n1395), .C1(d_ff2_Z[44]), .Y(n1219) );
  INVX2TS U1247 ( .A(n1219), .Y(add_subt_dataA[44]) );
  AOI222X1TS U1248 ( .A0(n1406), .A1(d_ff2_X[28]), .B0(n1242), .B1(d_ff2_Y[28]), .C0(n1395), .C1(d_ff2_Z[28]), .Y(n1221) );
  INVX2TS U1249 ( .A(n1221), .Y(add_subt_dataA[28]) );
  AOI222X1TS U1250 ( .A0(n1223), .A1(d_ff2_X[43]), .B0(n1222), .B1(d_ff2_Y[43]), .C0(n1395), .C1(d_ff2_Z[43]), .Y(n1224) );
  INVX2TS U1251 ( .A(n1224), .Y(add_subt_dataA[43]) );
  INVX2TS U1252 ( .A(ITER_CONT_N3), .Y(n988) );
  INVX2TS U1253 ( .A(n1230), .Y(n1373) );
  AOI222X1TS U1254 ( .A0(n1373), .A1(d_ff3_sh_y_out[56]), .B0(n1372), .B1(
        d_ff3_sh_x_out[56]), .C0(n1392), .C1(d_ff3_LUT_out[56]), .Y(n1225) );
  INVX2TS U1255 ( .A(n1225), .Y(add_subt_dataB[56]) );
  AOI222X1TS U1256 ( .A0(n1220), .A1(d_ff2_X[1]), .B0(n1372), .B1(d_ff2_Y[1]), 
        .C0(n1392), .C1(d_ff2_Z[1]), .Y(n1226) );
  INVX2TS U1257 ( .A(n1226), .Y(add_subt_dataA[1]) );
  AOI222X1TS U1258 ( .A0(n1389), .A1(d_ff2_X[2]), .B0(n1231), .B1(d_ff2_Y[2]), 
        .C0(n1392), .C1(d_ff2_Z[2]), .Y(n1227) );
  INVX2TS U1259 ( .A(n1227), .Y(add_subt_dataA[2]) );
  AOI222X1TS U1260 ( .A0(n1406), .A1(d_ff2_X[3]), .B0(n1256), .B1(d_ff2_Y[3]), 
        .C0(n1392), .C1(d_ff2_Z[3]), .Y(n1228) );
  INVX2TS U1261 ( .A(n1228), .Y(add_subt_dataA[3]) );
  AOI222X1TS U1262 ( .A0(n1220), .A1(d_ff2_X[5]), .B0(n1231), .B1(d_ff2_Y[5]), 
        .C0(n1392), .C1(d_ff2_Z[5]), .Y(n1229) );
  INVX2TS U1263 ( .A(n1229), .Y(add_subt_dataA[5]) );
  BUFX3TS U1264 ( .A(n1246), .Y(n1268) );
  AOI222X1TS U1265 ( .A0(n1402), .A1(d_ff2_X[63]), .B0(n1269), .B1(d_ff2_Y[63]), .C0(n1268), .C1(d_ff2_Z[63]), .Y(n1232) );
  INVX2TS U1266 ( .A(n1232), .Y(add_subt_dataA[63]) );
  AOI222X1TS U1267 ( .A0(n1389), .A1(d_ff2_X[9]), .B0(n1256), .B1(d_ff2_Y[9]), 
        .C0(n1246), .C1(d_ff2_Z[9]), .Y(n1233) );
  INVX2TS U1268 ( .A(n1233), .Y(add_subt_dataA[9]) );
  AOI222X1TS U1269 ( .A0(n1406), .A1(d_ff2_X[4]), .B0(n1396), .B1(d_ff2_Y[4]), 
        .C0(n1246), .C1(d_ff2_Z[4]), .Y(n1234) );
  INVX2TS U1270 ( .A(n1234), .Y(add_subt_dataA[4]) );
  AOI222X1TS U1271 ( .A0(n1220), .A1(d_ff2_X[6]), .B0(n1231), .B1(d_ff2_Y[6]), 
        .C0(n1246), .C1(d_ff2_Z[6]), .Y(n1235) );
  INVX2TS U1272 ( .A(n1235), .Y(add_subt_dataA[6]) );
  AOI222X1TS U1273 ( .A0(n1243), .A1(d_ff2_X[10]), .B0(n1256), .B1(d_ff2_Y[10]), .C0(n1246), .C1(d_ff2_Z[10]), .Y(n1236) );
  INVX2TS U1274 ( .A(n1236), .Y(add_subt_dataA[10]) );
  AOI222X1TS U1275 ( .A0(n1402), .A1(d_ff3_sh_y_out[0]), .B0(n1269), .B1(
        d_ff3_sh_x_out[0]), .C0(n1268), .C1(d_ff3_LUT_out[0]), .Y(n1237) );
  INVX2TS U1276 ( .A(n1237), .Y(add_subt_dataB[0]) );
  AOI222X1TS U1277 ( .A0(n1243), .A1(d_ff2_X[11]), .B0(n1256), .B1(d_ff2_Y[11]), .C0(n1246), .C1(d_ff2_Z[11]), .Y(n1238) );
  INVX2TS U1278 ( .A(n1238), .Y(add_subt_dataA[11]) );
  AOI222X1TS U1279 ( .A0(n1243), .A1(d_ff2_X[12]), .B0(n1256), .B1(d_ff2_Y[12]), .C0(n1275), .C1(d_ff2_Z[12]), .Y(n1239) );
  INVX2TS U1280 ( .A(n1239), .Y(add_subt_dataA[12]) );
  AOI222X1TS U1281 ( .A0(n1243), .A1(d_ff2_X[13]), .B0(n1256), .B1(d_ff2_Y[13]), .C0(n1189), .C1(d_ff2_Z[13]), .Y(n1240) );
  INVX2TS U1282 ( .A(n1240), .Y(add_subt_dataA[13]) );
  AOI222X1TS U1283 ( .A0(n1389), .A1(d_ff2_X[7]), .B0(n1396), .B1(d_ff2_Y[7]), 
        .C0(n1189), .C1(d_ff2_Z[7]), .Y(n1241) );
  INVX2TS U1284 ( .A(n1241), .Y(add_subt_dataA[7]) );
  AOI222X1TS U1285 ( .A0(n1243), .A1(d_ff2_X[14]), .B0(n1242), .B1(d_ff2_Y[14]), .C0(n1189), .C1(d_ff2_Z[14]), .Y(n1244) );
  INVX2TS U1286 ( .A(n1244), .Y(add_subt_dataA[14]) );
  AOI222X1TS U1287 ( .A0(n1265), .A1(d_ff2_X[0]), .B0(n1179), .B1(d_ff2_Y[0]), 
        .C0(n1268), .C1(d_ff2_Z[0]), .Y(n1245) );
  INVX2TS U1288 ( .A(n1245), .Y(add_subt_dataA[0]) );
  BUFX3TS U1289 ( .A(n1246), .Y(n1258) );
  AOI222X1TS U1290 ( .A0(n1288), .A1(d_ff3_sh_y_out[1]), .B0(n1269), .B1(
        d_ff3_sh_x_out[1]), .C0(n1258), .C1(d_ff3_LUT_out[1]), .Y(n1247) );
  INVX2TS U1291 ( .A(n1247), .Y(add_subt_dataB[1]) );
  AOI222X1TS U1292 ( .A0(n1270), .A1(d_ff3_sh_y_out[11]), .B0(n1287), .B1(
        d_ff3_sh_x_out[11]), .C0(n1258), .C1(d_ff3_LUT_out[11]), .Y(n1248) );
  INVX2TS U1293 ( .A(n1248), .Y(add_subt_dataB[11]) );
  AOI222X1TS U1294 ( .A0(n1402), .A1(d_ff3_sh_y_out[10]), .B0(n1287), .B1(
        d_ff3_sh_x_out[10]), .C0(n1258), .C1(d_ff3_LUT_out[10]), .Y(n1249) );
  INVX2TS U1295 ( .A(n1249), .Y(add_subt_dataB[10]) );
  AOI222X1TS U1296 ( .A0(n1288), .A1(d_ff3_sh_y_out[9]), .B0(n1287), .B1(
        d_ff3_sh_x_out[9]), .C0(n1258), .C1(d_ff3_LUT_out[9]), .Y(n1250) );
  INVX2TS U1297 ( .A(n1250), .Y(add_subt_dataB[9]) );
  AOI222X1TS U1298 ( .A0(n1270), .A1(d_ff3_sh_y_out[8]), .B0(n1287), .B1(
        d_ff3_sh_x_out[8]), .C0(n1258), .C1(d_ff3_LUT_out[8]), .Y(n1251) );
  INVX2TS U1299 ( .A(n1251), .Y(add_subt_dataB[8]) );
  AOI222X1TS U1300 ( .A0(n1402), .A1(d_ff3_sh_y_out[7]), .B0(n1287), .B1(
        d_ff3_sh_x_out[7]), .C0(n1258), .C1(d_ff3_LUT_out[7]), .Y(n1252) );
  INVX2TS U1301 ( .A(n1252), .Y(add_subt_dataB[7]) );
  AOI222X1TS U1302 ( .A0(n1270), .A1(d_ff3_sh_y_out[6]), .B0(n1287), .B1(
        d_ff3_sh_x_out[6]), .C0(n1258), .C1(d_ff3_LUT_out[6]), .Y(n1253) );
  INVX2TS U1303 ( .A(n1253), .Y(add_subt_dataB[6]) );
  AOI222X1TS U1304 ( .A0(n1402), .A1(d_ff3_sh_y_out[5]), .B0(n1287), .B1(
        d_ff3_sh_x_out[5]), .C0(n1258), .C1(d_ff3_LUT_out[5]), .Y(n1254) );
  INVX2TS U1305 ( .A(n1254), .Y(add_subt_dataB[5]) );
  AOI222X1TS U1306 ( .A0(n1288), .A1(d_ff3_sh_y_out[3]), .B0(n1269), .B1(
        d_ff3_sh_x_out[3]), .C0(n1258), .C1(d_ff3_LUT_out[3]), .Y(n1255) );
  INVX2TS U1307 ( .A(n1255), .Y(add_subt_dataB[3]) );
  AOI222X1TS U1308 ( .A0(n1406), .A1(d_ff2_X[8]), .B0(n1256), .B1(d_ff2_Y[8]), 
        .C0(n1189), .C1(d_ff2_Z[8]), .Y(n1257) );
  INVX2TS U1309 ( .A(n1257), .Y(add_subt_dataA[8]) );
  AOI222X1TS U1310 ( .A0(n1270), .A1(d_ff3_sh_y_out[2]), .B0(n1269), .B1(
        d_ff3_sh_x_out[2]), .C0(n1258), .C1(d_ff3_LUT_out[2]), .Y(n1259) );
  INVX2TS U1311 ( .A(n1259), .Y(add_subt_dataB[2]) );
  INVX2TS U1312 ( .A(n1260), .Y(add_subt_dataA[56]) );
  INVX2TS U1313 ( .A(n1261), .Y(add_subt_dataA[62]) );
  INVX2TS U1314 ( .A(n1262), .Y(add_subt_dataA[58]) );
  INVX2TS U1315 ( .A(n1264), .Y(add_subt_dataA[55]) );
  INVX2TS U1316 ( .A(n1266), .Y(add_subt_dataA[57]) );
  INVX2TS U1317 ( .A(n1267), .Y(add_subt_dataA[60]) );
  INVX2TS U1318 ( .A(n1271), .Y(add_subt_dataA[61]) );
  BUFX3TS U1319 ( .A(n1275), .Y(n1294) );
  AOI222X1TS U1320 ( .A0(n1296), .A1(d_ff3_sh_y_out[19]), .B0(n1295), .B1(
        d_ff3_sh_x_out[19]), .C0(n1294), .C1(d_ff3_LUT_out[19]), .Y(n1272) );
  INVX2TS U1321 ( .A(n1272), .Y(add_subt_dataB[19]) );
  AOI222X1TS U1322 ( .A0(n1288), .A1(d_ff3_sh_y_out[14]), .B0(n1287), .B1(
        d_ff3_sh_x_out[14]), .C0(n1294), .C1(d_ff3_LUT_out[14]), .Y(n1273) );
  INVX2TS U1323 ( .A(n1273), .Y(add_subt_dataB[14]) );
  AOI222X1TS U1324 ( .A0(n1270), .A1(d_ff3_sh_y_out[12]), .B0(n1287), .B1(
        d_ff3_sh_x_out[12]), .C0(n1294), .C1(d_ff3_LUT_out[12]), .Y(n1274) );
  INVX2TS U1325 ( .A(n1274), .Y(add_subt_dataB[12]) );
  BUFX3TS U1326 ( .A(n1275), .Y(n1298) );
  AOI222X1TS U1327 ( .A0(n1296), .A1(d_ff3_sh_y_out[23]), .B0(n1295), .B1(
        d_ff3_sh_x_out[23]), .C0(n1298), .C1(d_ff3_LUT_out[23]), .Y(n1276) );
  INVX2TS U1328 ( .A(n1276), .Y(add_subt_dataB[23]) );
  AOI222X1TS U1329 ( .A0(n1310), .A1(d_ff3_sh_y_out[31]), .B0(n1307), .B1(
        d_ff3_sh_x_out[31]), .C0(n1298), .C1(d_ff3_LUT_out[31]), .Y(n1278) );
  INVX2TS U1330 ( .A(n1278), .Y(add_subt_dataB[31]) );
  AOI222X1TS U1331 ( .A0(n1402), .A1(d_ff3_sh_y_out[15]), .B0(n1295), .B1(
        d_ff3_sh_x_out[15]), .C0(n1294), .C1(d_ff3_LUT_out[15]), .Y(n1279) );
  INVX2TS U1332 ( .A(n1279), .Y(add_subt_dataB[15]) );
  AOI222X1TS U1333 ( .A0(n1288), .A1(d_ff3_sh_y_out[16]), .B0(n1295), .B1(
        d_ff3_sh_x_out[16]), .C0(n1294), .C1(d_ff3_LUT_out[16]), .Y(n1280) );
  INVX2TS U1334 ( .A(n1280), .Y(add_subt_dataB[16]) );
  AOI222X1TS U1335 ( .A0(n1296), .A1(d_ff3_sh_y_out[25]), .B0(n1307), .B1(
        d_ff3_sh_x_out[25]), .C0(n1298), .C1(d_ff3_LUT_out[25]), .Y(n1281) );
  INVX2TS U1336 ( .A(n1281), .Y(add_subt_dataB[25]) );
  AOI222X1TS U1337 ( .A0(n1296), .A1(d_ff3_sh_y_out[18]), .B0(n1295), .B1(
        d_ff3_sh_x_out[18]), .C0(n1294), .C1(d_ff3_LUT_out[18]), .Y(n1282) );
  INVX2TS U1338 ( .A(n1282), .Y(add_subt_dataB[18]) );
  AOI222X1TS U1339 ( .A0(n1296), .A1(d_ff3_sh_y_out[26]), .B0(n1307), .B1(
        d_ff3_sh_x_out[26]), .C0(n1298), .C1(d_ff3_LUT_out[26]), .Y(n1283) );
  INVX2TS U1340 ( .A(n1283), .Y(add_subt_dataB[26]) );
  AOI222X1TS U1341 ( .A0(n1296), .A1(d_ff3_sh_y_out[20]), .B0(n1295), .B1(
        d_ff3_sh_x_out[20]), .C0(n1294), .C1(d_ff3_LUT_out[20]), .Y(n1284) );
  INVX2TS U1342 ( .A(n1284), .Y(add_subt_dataB[20]) );
  AOI222X1TS U1343 ( .A0(n1296), .A1(d_ff3_sh_y_out[21]), .B0(n1295), .B1(
        d_ff3_sh_x_out[21]), .C0(n1294), .C1(d_ff3_LUT_out[21]), .Y(n1285) );
  INVX2TS U1344 ( .A(n1285), .Y(add_subt_dataB[21]) );
  AOI222X1TS U1345 ( .A0(n1296), .A1(d_ff3_sh_y_out[22]), .B0(n1295), .B1(
        d_ff3_sh_x_out[22]), .C0(n1298), .C1(d_ff3_LUT_out[22]), .Y(n1286) );
  INVX2TS U1346 ( .A(n1286), .Y(add_subt_dataB[22]) );
  AOI222X1TS U1347 ( .A0(n1270), .A1(d_ff3_sh_y_out[13]), .B0(n1287), .B1(
        d_ff3_sh_x_out[13]), .C0(n1294), .C1(d_ff3_LUT_out[13]), .Y(n1289) );
  INVX2TS U1348 ( .A(n1289), .Y(add_subt_dataB[13]) );
  AOI222X1TS U1349 ( .A0(n1296), .A1(d_ff3_sh_y_out[24]), .B0(n1295), .B1(
        d_ff3_sh_x_out[24]), .C0(n1298), .C1(d_ff3_LUT_out[24]), .Y(n1290) );
  INVX2TS U1350 ( .A(n1290), .Y(add_subt_dataB[24]) );
  AOI222X1TS U1351 ( .A0(n1310), .A1(d_ff3_sh_y_out[39]), .B0(n1307), .B1(
        d_ff3_sh_x_out[39]), .C0(n1298), .C1(d_ff3_LUT_out[39]), .Y(n1291) );
  INVX2TS U1352 ( .A(n1291), .Y(add_subt_dataB[39]) );
  AOI222X1TS U1353 ( .A0(n1310), .A1(d_ff3_sh_y_out[29]), .B0(n1307), .B1(
        d_ff3_sh_x_out[29]), .C0(n1298), .C1(d_ff3_LUT_out[29]), .Y(n1292) );
  INVX2TS U1354 ( .A(n1292), .Y(add_subt_dataB[29]) );
  AOI222X1TS U1355 ( .A0(n1310), .A1(d_ff3_sh_y_out[27]), .B0(n1307), .B1(
        d_ff3_sh_x_out[27]), .C0(n1298), .C1(d_ff3_LUT_out[27]), .Y(n1293) );
  INVX2TS U1356 ( .A(n1293), .Y(add_subt_dataB[27]) );
  AOI222X1TS U1357 ( .A0(n1296), .A1(d_ff3_sh_y_out[17]), .B0(n1295), .B1(
        d_ff3_sh_x_out[17]), .C0(n1294), .C1(d_ff3_LUT_out[17]), .Y(n1297) );
  INVX2TS U1358 ( .A(n1297), .Y(add_subt_dataB[17]) );
  AOI222X1TS U1359 ( .A0(n1310), .A1(d_ff3_sh_y_out[37]), .B0(n1307), .B1(
        d_ff3_sh_x_out[37]), .C0(n1298), .C1(d_ff3_LUT_out[37]), .Y(n1299) );
  INVX2TS U1360 ( .A(n1299), .Y(add_subt_dataB[37]) );
  INVX2TS U1361 ( .A(n1341), .Y(n1300) );
  BUFX3TS U1362 ( .A(n1395), .Y(n1408) );
  AOI222X1TS U1363 ( .A0(n1310), .A1(d_ff3_sh_y_out[33]), .B0(n1307), .B1(
        d_ff3_sh_x_out[33]), .C0(n1408), .C1(d_ff3_LUT_out[33]), .Y(n1301) );
  INVX2TS U1364 ( .A(n1301), .Y(add_subt_dataB[33]) );
  AOI222X1TS U1365 ( .A0(n1310), .A1(d_ff3_sh_y_out[50]), .B0(n1372), .B1(
        d_ff3_sh_x_out[50]), .C0(n1408), .C1(d_ff3_LUT_out[50]), .Y(n1302) );
  INVX2TS U1366 ( .A(n1302), .Y(add_subt_dataB[50]) );
  AOI222X1TS U1367 ( .A0(n1310), .A1(d_ff3_sh_y_out[41]), .B0(n1307), .B1(
        d_ff3_sh_x_out[41]), .C0(n1408), .C1(d_ff3_LUT_out[41]), .Y(n1303) );
  INVX2TS U1368 ( .A(n1303), .Y(add_subt_dataB[41]) );
  AOI222X1TS U1369 ( .A0(n1373), .A1(d_ff3_sh_y_out[55]), .B0(n1372), .B1(
        d_ff3_sh_x_out[55]), .C0(n1408), .C1(d_ff3_LUT_out[55]), .Y(n1304) );
  INVX2TS U1370 ( .A(n1304), .Y(add_subt_dataB[55]) );
  AOI222X1TS U1371 ( .A0(n1373), .A1(d_ff3_sh_y_out[53]), .B0(n1372), .B1(
        d_ff3_sh_x_out[53]), .C0(n1408), .C1(d_ff3_LUT_out[53]), .Y(n1305) );
  INVX2TS U1372 ( .A(n1305), .Y(add_subt_dataB[53]) );
  AOI222X1TS U1373 ( .A0(n1373), .A1(d_ff3_sh_y_out[54]), .B0(n1372), .B1(
        d_ff3_sh_x_out[54]), .C0(n1408), .C1(d_ff3_LUT_out[54]), .Y(n1306) );
  INVX2TS U1374 ( .A(n1306), .Y(add_subt_dataB[54]) );
  AOI222X1TS U1375 ( .A0(n1310), .A1(d_ff3_sh_y_out[35]), .B0(n1307), .B1(
        d_ff3_sh_x_out[35]), .C0(n1408), .C1(d_ff3_LUT_out[35]), .Y(n1308) );
  INVX2TS U1376 ( .A(n1308), .Y(add_subt_dataB[35]) );
  AOI222X1TS U1377 ( .A0(n1373), .A1(d_ff3_sh_y_out[52]), .B0(n1372), .B1(
        d_ff3_sh_x_out[52]), .C0(n1408), .C1(d_ff3_LUT_out[52]), .Y(n1309) );
  INVX2TS U1378 ( .A(n1309), .Y(add_subt_dataB[52]) );
  AOI222X1TS U1379 ( .A0(n1310), .A1(d_ff3_sh_y_out[45]), .B0(n1372), .B1(
        d_ff3_sh_x_out[45]), .C0(n1408), .C1(d_ff3_LUT_out[45]), .Y(n1311) );
  INVX2TS U1380 ( .A(n1311), .Y(add_subt_dataB[45]) );
  INVX2TS U1381 ( .A(n1341), .Y(n1312) );
  INVX2TS U1382 ( .A(n1341), .Y(n1330) );
  NOR3XLTS U1383 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .C(n1314), .Y(
        enab_d_ff4_Xn) );
  AOI31XLTS U1384 ( .A0(n1143), .A1(n1444), .A2(n1416), .B0(n1424), .Y(
        data_out_LUT[0]) );
  NAND2X1TS U1385 ( .A(n1412), .B(n1410), .Y(n1316) );
  OAI211XLTS U1386 ( .A0(cont_iter_out[2]), .A1(n1454), .B0(n1317), .C0(n1316), 
        .Y(n962) );
  AOI22X1TS U1388 ( .A0(n1412), .A1(n1139), .B0(n1318), .B1(n1411), .Y(
        data_out_LUT[6]) );
  AOI22X1TS U1389 ( .A0(n1427), .A1(n1413), .B0(n1425), .B1(n1140), .Y(
        data_out_LUT[39]) );
  NAND2X1TS U1390 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), .Y(n1321) );
  XOR2X1TS U1391 ( .A(n1144), .B(n1319), .Y(n1320) );
  INVX2TS U1392 ( .A(n1349), .Y(n1344) );
  AOI22X1TS U1393 ( .A0(n1344), .A1(d_ff_Yn[63]), .B0(d_ff_Xn[63]), .B1(n1357), 
        .Y(n1323) );
  XNOR2X1TS U1394 ( .A(n1323), .B(n1322), .Y(fmtted_Result_63_) );
  NAND2X1TS U1395 ( .A(n1413), .B(n1444), .Y(n998) );
  BUFX3TS U1396 ( .A(n1329), .Y(n1338) );
  NOR2BX1TS U1397 ( .AN(d_ff_Yn[0]), .B(n1363), .Y(first_mux_Y[0]) );
  INVX2TS U1398 ( .A(n1361), .Y(n1325) );
  NOR2BX1TS U1399 ( .AN(d_ff_Yn[1]), .B(n1325), .Y(first_mux_Y[1]) );
  NOR2BX1TS U1400 ( .AN(d_ff_Yn[2]), .B(n1210), .Y(first_mux_Y[2]) );
  NOR2BX1TS U1401 ( .AN(d_ff_Yn[3]), .B(n1211), .Y(first_mux_Y[3]) );
  NOR2BX1TS U1402 ( .AN(d_ff_Yn[4]), .B(n1210), .Y(first_mux_Y[4]) );
  NOR2BX1TS U1403 ( .AN(d_ff_Yn[5]), .B(n1326), .Y(first_mux_Y[5]) );
  NOR2BX1TS U1404 ( .AN(d_ff_Yn[6]), .B(n1211), .Y(first_mux_Y[6]) );
  NOR2BX1TS U1405 ( .AN(d_ff_Yn[7]), .B(n1324), .Y(first_mux_Y[7]) );
  NOR2BX1TS U1406 ( .AN(d_ff_Yn[8]), .B(n1324), .Y(first_mux_Y[8]) );
  NOR2BX1TS U1407 ( .AN(d_ff_Yn[9]), .B(n1324), .Y(first_mux_Y[9]) );
  NOR2BX1TS U1408 ( .AN(d_ff_Yn[10]), .B(n1324), .Y(first_mux_Y[10]) );
  NOR2BX1TS U1409 ( .AN(d_ff_Yn[11]), .B(n1210), .Y(first_mux_Y[11]) );
  NOR2BX1TS U1410 ( .AN(d_ff_Yn[12]), .B(n1324), .Y(first_mux_Y[12]) );
  NOR2BX1TS U1411 ( .AN(d_ff_Yn[13]), .B(n1324), .Y(first_mux_Y[13]) );
  NOR2BX1TS U1412 ( .AN(d_ff_Yn[14]), .B(n1326), .Y(first_mux_Y[14]) );
  NOR2BX1TS U1413 ( .AN(d_ff_Yn[15]), .B(n1210), .Y(first_mux_Y[15]) );
  NOR2BX1TS U1414 ( .AN(d_ff_Yn[16]), .B(n1211), .Y(first_mux_Y[16]) );
  NOR2BX1TS U1415 ( .AN(d_ff_Yn[17]), .B(n1300), .Y(first_mux_Y[17]) );
  NOR2BX1TS U1416 ( .AN(d_ff_Yn[18]), .B(n1336), .Y(first_mux_Y[18]) );
  NOR2BX1TS U1417 ( .AN(d_ff_Yn[19]), .B(n1333), .Y(first_mux_Y[19]) );
  NOR2BX1TS U1418 ( .AN(d_ff_Yn[20]), .B(n1326), .Y(first_mux_Y[20]) );
  NOR2BX1TS U1419 ( .AN(d_ff_Yn[21]), .B(n1312), .Y(first_mux_Y[21]) );
  NOR2BX1TS U1420 ( .AN(d_ff_Yn[22]), .B(n1330), .Y(first_mux_Y[22]) );
  NOR2BX1TS U1421 ( .AN(d_ff_Yn[23]), .B(n1339), .Y(first_mux_Y[23]) );
  NOR2BX1TS U1422 ( .AN(d_ff_Yn[24]), .B(n1332), .Y(first_mux_Y[24]) );
  NOR2BX1TS U1423 ( .AN(d_ff_Yn[25]), .B(n1343), .Y(first_mux_Y[25]) );
  INVX2TS U1424 ( .A(n1329), .Y(n1343) );
  NOR2BX1TS U1425 ( .AN(d_ff_Yn[26]), .B(n1312), .Y(first_mux_Y[26]) );
  NOR2BX1TS U1426 ( .AN(d_ff_Yn[27]), .B(n1325), .Y(first_mux_Y[27]) );
  NOR2BX1TS U1427 ( .AN(d_ff_Yn[28]), .B(n1300), .Y(first_mux_Y[28]) );
  NOR2BX1TS U1428 ( .AN(d_ff_Yn[29]), .B(n1326), .Y(first_mux_Y[29]) );
  NOR2BX1TS U1429 ( .AN(d_ff_Yn[30]), .B(n1211), .Y(first_mux_Y[30]) );
  NOR2BX1TS U1430 ( .AN(d_ff_Yn[31]), .B(n1326), .Y(first_mux_Y[31]) );
  NOR2BX1TS U1431 ( .AN(d_ff_Yn[32]), .B(n1210), .Y(first_mux_Y[32]) );
  NOR2BX1TS U1432 ( .AN(d_ff_Yn[33]), .B(n1327), .Y(first_mux_Y[33]) );
  NOR2BX1TS U1433 ( .AN(d_ff_Yn[34]), .B(n1327), .Y(first_mux_Y[34]) );
  NOR2BX1TS U1434 ( .AN(d_ff_Yn[35]), .B(n1327), .Y(first_mux_Y[35]) );
  NOR2BX1TS U1435 ( .AN(d_ff_Yn[36]), .B(n1327), .Y(first_mux_Y[36]) );
  NOR2BX1TS U1436 ( .AN(d_ff_Yn[37]), .B(n1327), .Y(first_mux_Y[37]) );
  NOR2BX1TS U1437 ( .AN(d_ff_Yn[38]), .B(n1327), .Y(first_mux_Y[38]) );
  NOR2BX1TS U1438 ( .AN(d_ff_Yn[39]), .B(n1327), .Y(first_mux_Y[39]) );
  NOR2BX1TS U1439 ( .AN(d_ff_Yn[40]), .B(n1327), .Y(first_mux_Y[40]) );
  NOR2BX1TS U1440 ( .AN(d_ff_Yn[41]), .B(n1327), .Y(first_mux_Y[41]) );
  NOR2BX1TS U1441 ( .AN(d_ff_Yn[42]), .B(n1327), .Y(first_mux_Y[42]) );
  NOR2BX1TS U1442 ( .AN(d_ff_Yn[43]), .B(n1328), .Y(first_mux_Y[43]) );
  NOR2BX1TS U1443 ( .AN(d_ff_Yn[44]), .B(n1364), .Y(first_mux_Y[44]) );
  NOR2BX1TS U1444 ( .AN(d_ff_Yn[45]), .B(n1364), .Y(first_mux_Y[45]) );
  NOR2BX1TS U1445 ( .AN(d_ff_Yn[46]), .B(n1328), .Y(first_mux_Y[46]) );
  NOR2BX1TS U1446 ( .AN(d_ff_Yn[47]), .B(n1364), .Y(first_mux_Y[47]) );
  NOR2BX1TS U1447 ( .AN(d_ff_Yn[48]), .B(n1328), .Y(first_mux_Y[48]) );
  NOR2BX1TS U1448 ( .AN(d_ff_Yn[49]), .B(n1364), .Y(first_mux_Y[49]) );
  NOR2BX1TS U1449 ( .AN(d_ff_Yn[50]), .B(n1328), .Y(first_mux_Y[50]) );
  NOR2BX1TS U1450 ( .AN(d_ff_Yn[51]), .B(n1364), .Y(first_mux_Y[51]) );
  NOR2BX1TS U1451 ( .AN(d_ff_Yn[52]), .B(n1328), .Y(first_mux_Y[52]) );
  NOR2BX1TS U1452 ( .AN(d_ff_Yn[53]), .B(n1360), .Y(first_mux_Y[53]) );
  NOR2BX1TS U1453 ( .AN(d_ff_Yn[54]), .B(n1360), .Y(first_mux_Y[54]) );
  NOR2BX1TS U1454 ( .AN(d_ff_Yn[55]), .B(n1360), .Y(first_mux_Y[55]) );
  NOR2BX1TS U1455 ( .AN(d_ff_Yn[56]), .B(n1360), .Y(first_mux_Y[56]) );
  NOR2BX1TS U1456 ( .AN(d_ff_Yn[57]), .B(n1328), .Y(first_mux_Y[57]) );
  NOR2BX1TS U1457 ( .AN(d_ff_Yn[58]), .B(n1360), .Y(first_mux_Y[58]) );
  NOR2BX1TS U1458 ( .AN(d_ff_Yn[59]), .B(n1364), .Y(first_mux_Y[59]) );
  NOR2BX1TS U1459 ( .AN(d_ff_Yn[60]), .B(n1360), .Y(first_mux_Y[60]) );
  NOR2BX1TS U1460 ( .AN(d_ff_Yn[61]), .B(n1360), .Y(first_mux_Y[61]) );
  NOR2BX1TS U1461 ( .AN(d_ff_Yn[62]), .B(n1360), .Y(first_mux_Y[62]) );
  NOR2BX1TS U1462 ( .AN(d_ff_Yn[63]), .B(n1360), .Y(first_mux_Y[63]) );
  CLKBUFX2TS U1463 ( .A(n1338), .Y(n1331) );
  INVX2TS U1464 ( .A(n1361), .Y(n1332) );
  INVX2TS U1465 ( .A(n1361), .Y(n1333) );
  INVX2TS U1466 ( .A(n1341), .Y(n1336) );
  CLKBUFX2TS U1467 ( .A(n1338), .Y(n1335) );
  BUFX3TS U1468 ( .A(n1335), .Y(n1334) );
  BUFX3TS U1469 ( .A(n1335), .Y(n1337) );
  INVX2TS U1470 ( .A(n1361), .Y(n1339) );
  BUFX3TS U1471 ( .A(n1341), .Y(n1340) );
  CLKBUFX2TS U1472 ( .A(n1341), .Y(n1342) );
  INVX2TS U1473 ( .A(n1349), .Y(n1346) );
  INVX2TS U1474 ( .A(n1349), .Y(n1348) );
  CLKBUFX2TS U1475 ( .A(n1352), .Y(n1353) );
  INVX2TS U1476 ( .A(n1349), .Y(n1351) );
  CLKBUFX2TS U1477 ( .A(n1353), .Y(n1358) );
  INVX2TS U1478 ( .A(n1357), .Y(n1354) );
  INVX2TS U1479 ( .A(n1357), .Y(n1356) );
  INVX2TS U1480 ( .A(n1357), .Y(n1359) );
  NOR2BX1TS U1481 ( .AN(d_ff_Xn[1]), .B(n1360), .Y(first_mux_X[1]) );
  NOR2BX1TS U1482 ( .AN(d_ff_Xn[2]), .B(n1328), .Y(first_mux_X[2]) );
  NOR2BX1TS U1483 ( .AN(d_ff_Xn[4]), .B(n1364), .Y(first_mux_X[4]) );
  NOR2BX1TS U1484 ( .AN(d_ff_Xn[5]), .B(n1328), .Y(first_mux_X[5]) );
  NOR2BX1TS U1485 ( .AN(d_ff_Xn[10]), .B(n1364), .Y(first_mux_X[10]) );
  NOR2BX1TS U1486 ( .AN(d_ff_Xn[12]), .B(n1328), .Y(first_mux_X[12]) );
  NOR2BX1TS U1487 ( .AN(d_ff_Xn[15]), .B(n1364), .Y(first_mux_X[15]) );
  NOR2BX1TS U1488 ( .AN(d_ff_Xn[16]), .B(n1364), .Y(first_mux_X[16]) );
  NOR2BX1TS U1489 ( .AN(d_ff_Xn[17]), .B(n1362), .Y(first_mux_X[17]) );
  NOR2BX1TS U1490 ( .AN(d_ff_Xn[18]), .B(n1362), .Y(first_mux_X[18]) );
  NOR2BX1TS U1491 ( .AN(d_ff_Xn[20]), .B(n1362), .Y(first_mux_X[20]) );
  NOR2BX1TS U1492 ( .AN(d_ff_Xn[21]), .B(n1362), .Y(first_mux_X[21]) );
  NOR2BX1TS U1493 ( .AN(d_ff_Xn[22]), .B(n1362), .Y(first_mux_X[22]) );
  NOR2BX1TS U1494 ( .AN(d_ff_Xn[23]), .B(n1362), .Y(first_mux_X[23]) );
  NOR2BX1TS U1495 ( .AN(d_ff_Xn[25]), .B(n1362), .Y(first_mux_X[25]) );
  NOR2BX1TS U1496 ( .AN(d_ff_Xn[27]), .B(n1362), .Y(first_mux_X[27]) );
  NOR2BX1TS U1497 ( .AN(d_ff_Xn[30]), .B(n1362), .Y(first_mux_X[30]) );
  NOR2BX1TS U1498 ( .AN(d_ff_Xn[33]), .B(n1362), .Y(first_mux_X[33]) );
  NOR2BX1TS U1499 ( .AN(d_ff_Xn[37]), .B(n1363), .Y(first_mux_X[37]) );
  NOR2BX1TS U1500 ( .AN(d_ff_Xn[38]), .B(n1363), .Y(first_mux_X[38]) );
  NOR2BX1TS U1501 ( .AN(d_ff_Xn[40]), .B(n1363), .Y(first_mux_X[40]) );
  NOR2BX1TS U1502 ( .AN(d_ff_Xn[44]), .B(n1363), .Y(first_mux_X[44]) );
  NOR2BX1TS U1503 ( .AN(d_ff_Xn[47]), .B(n1363), .Y(first_mux_X[47]) );
  NOR2BX1TS U1504 ( .AN(d_ff_Xn[50]), .B(n1363), .Y(first_mux_X[50]) );
  NOR2BX1TS U1505 ( .AN(d_ff_Xn[51]), .B(n1363), .Y(first_mux_X[51]) );
  NOR2BX1TS U1506 ( .AN(d_ff_Xn[52]), .B(n1363), .Y(first_mux_X[52]) );
  NOR2BX1TS U1507 ( .AN(d_ff_Xn[62]), .B(n1363), .Y(first_mux_X[62]) );
  NOR2BX1TS U1508 ( .AN(d_ff_Xn[63]), .B(n1328), .Y(first_mux_X[63]) );
  NOR2BX1TS U1509 ( .AN(beg_fsm_cordic), .B(n1365), .Y(
        inst_CORDIC_FSM_v3_state_next[1]) );
  OAI2BB1X1TS U1510 ( .A0N(n985), .A1N(enab_cont_iter), .B0(n1366), .Y(
        inst_CORDIC_FSM_v3_state_next[2]) );
  OAI22X1TS U1511 ( .A0(enab_d_ff4_Zn), .A1(n1369), .B0(n1368), .B1(n1367), 
        .Y(inst_CORDIC_FSM_v3_state_next[5]) );
  NOR2BX1TS U1512 ( .AN(enab_d_ff4_Zn), .B(n1369), .Y(
        inst_CORDIC_FSM_v3_state_next[6]) );
  OAI22X1TS U1513 ( .A0(ack_cordic), .A1(n1371), .B0(n985), .B1(n1370), .Y(
        inst_CORDIC_FSM_v3_state_next[7]) );
  XOR2XLTS U1514 ( .A(d_ff3_sign_out), .B(cont_var_out[0]), .Y(op_add_subt) );
  AO22XLTS U1515 ( .A0(n1373), .A1(d_ff3_sh_y_out[63]), .B0(n1372), .B1(
        d_ff3_sh_x_out[63]), .Y(add_subt_dataB[63]) );
  AO22XLTS U1516 ( .A0(n1373), .A1(d_ff3_sh_y_out[62]), .B0(n1372), .B1(
        d_ff3_sh_x_out[62]), .Y(add_subt_dataB[62]) );
  AOI22X1TS U1517 ( .A0(n1389), .A1(d_ff3_sh_y_out[61]), .B0(n1388), .B1(
        d_ff3_sh_x_out[61]), .Y(n1375) );
  NAND2X2TS U1518 ( .A(n1392), .B(d_ff3_LUT_out[48]), .Y(n1382) );
  NAND2X1TS U1519 ( .A(n1375), .B(n1382), .Y(add_subt_dataB[61]) );
  AOI22X1TS U1520 ( .A0(n1406), .A1(d_ff3_sh_y_out[60]), .B0(n1388), .B1(
        d_ff3_sh_x_out[60]), .Y(n1376) );
  NAND2X1TS U1521 ( .A(n1376), .B(n1382), .Y(add_subt_dataB[60]) );
  AOI22X1TS U1522 ( .A0(n1220), .A1(d_ff3_sh_y_out[59]), .B0(n1388), .B1(
        d_ff3_sh_x_out[59]), .Y(n1377) );
  NAND2X1TS U1523 ( .A(n1377), .B(n1382), .Y(add_subt_dataB[59]) );
  AOI22X1TS U1524 ( .A0(n1389), .A1(d_ff3_sh_y_out[58]), .B0(n1388), .B1(
        d_ff3_sh_x_out[58]), .Y(n1378) );
  NAND2X1TS U1525 ( .A(n1378), .B(n1382), .Y(add_subt_dataB[58]) );
  AOI22X1TS U1526 ( .A0(n1406), .A1(d_ff3_sh_y_out[57]), .B0(n1388), .B1(
        d_ff3_sh_x_out[57]), .Y(n1379) );
  NAND2X1TS U1527 ( .A(n1379), .B(n1382), .Y(add_subt_dataB[57]) );
  AOI22X1TS U1528 ( .A0(n1220), .A1(d_ff3_sh_y_out[51]), .B0(n1388), .B1(
        d_ff3_sh_x_out[51]), .Y(n1380) );
  NAND2X1TS U1529 ( .A(n1380), .B(n1382), .Y(add_subt_dataB[51]) );
  AOI22X1TS U1530 ( .A0(n1389), .A1(d_ff3_sh_y_out[49]), .B0(n1396), .B1(
        d_ff3_sh_x_out[49]), .Y(n1381) );
  NAND2X1TS U1531 ( .A(n1392), .B(d_ff3_LUT_out[44]), .Y(n1386) );
  NAND2X1TS U1532 ( .A(n1381), .B(n1386), .Y(add_subt_dataB[49]) );
  AOI22X1TS U1533 ( .A0(n1406), .A1(d_ff3_sh_y_out[48]), .B0(n1405), .B1(
        d_ff3_sh_x_out[48]), .Y(n1383) );
  NAND2X1TS U1534 ( .A(n1383), .B(n1382), .Y(add_subt_dataB[48]) );
  AOI22X1TS U1535 ( .A0(n1220), .A1(d_ff3_sh_y_out[47]), .B0(n1388), .B1(
        d_ff3_sh_x_out[47]), .Y(n1384) );
  OAI2BB1X1TS U1536 ( .A0N(n1401), .A1N(d_ff3_LUT_out[42]), .B0(n1384), .Y(
        add_subt_dataB[47]) );
  AOI22X1TS U1537 ( .A0(n1270), .A1(d_ff3_sh_y_out[46]), .B0(n1405), .B1(
        d_ff3_sh_x_out[46]), .Y(n1385) );
  NAND2X1TS U1538 ( .A(n1385), .B(n1386), .Y(add_subt_dataB[46]) );
  AOI22X1TS U1539 ( .A0(n1402), .A1(d_ff3_sh_y_out[44]), .B0(n1396), .B1(
        d_ff3_sh_x_out[44]), .Y(n1387) );
  NAND2X1TS U1540 ( .A(n1387), .B(n1386), .Y(add_subt_dataB[44]) );
  AOI22X1TS U1541 ( .A0(n1389), .A1(d_ff3_sh_y_out[43]), .B0(n1388), .B1(
        d_ff3_sh_x_out[43]), .Y(n1390) );
  OAI2BB1X1TS U1542 ( .A0N(n1401), .A1N(d_ff3_LUT_out[34]), .B0(n1390), .Y(
        add_subt_dataB[43]) );
  AOI22X1TS U1543 ( .A0(n1288), .A1(d_ff3_sh_y_out[42]), .B0(n1405), .B1(
        d_ff3_sh_x_out[42]), .Y(n1391) );
  OAI2BB1X1TS U1544 ( .A0N(n1395), .A1N(d_ff3_LUT_out[42]), .B0(n1391), .Y(
        add_subt_dataB[42]) );
  AOI22X1TS U1545 ( .A0(n1288), .A1(d_ff3_sh_y_out[40]), .B0(n1396), .B1(
        d_ff3_sh_x_out[40]), .Y(n1393) );
  NAND2X1TS U1546 ( .A(n1392), .B(d_ff3_LUT_out[28]), .Y(n1403) );
  NAND2X1TS U1547 ( .A(n1393), .B(n1403), .Y(add_subt_dataB[40]) );
  AOI22X1TS U1548 ( .A0(n1270), .A1(d_ff3_sh_y_out[38]), .B0(n1405), .B1(
        d_ff3_sh_x_out[38]), .Y(n1394) );
  OAI2BB1X1TS U1549 ( .A0N(n1395), .A1N(d_ff3_LUT_out[32]), .B0(n1394), .Y(
        add_subt_dataB[38]) );
  AOI22X1TS U1550 ( .A0(n1270), .A1(d_ff3_sh_y_out[36]), .B0(n1396), .B1(
        d_ff3_sh_x_out[36]), .Y(n1397) );
  NAND2X1TS U1551 ( .A(n1397), .B(n1403), .Y(add_subt_dataB[36]) );
  AOI22X1TS U1552 ( .A0(n1402), .A1(d_ff3_sh_y_out[34]), .B0(n1405), .B1(
        d_ff3_sh_x_out[34]), .Y(n1398) );
  OAI2BB1X1TS U1553 ( .A0N(n1401), .A1N(d_ff3_LUT_out[34]), .B0(n1398), .Y(
        add_subt_dataB[34]) );
  AOI22X1TS U1554 ( .A0(n1270), .A1(d_ff3_sh_y_out[32]), .B0(n1405), .B1(
        d_ff3_sh_x_out[32]), .Y(n1399) );
  OAI2BB1X1TS U1555 ( .A0N(n1401), .A1N(d_ff3_LUT_out[32]), .B0(n1399), .Y(
        add_subt_dataB[32]) );
  AOI22X1TS U1556 ( .A0(n1288), .A1(d_ff3_sh_y_out[30]), .B0(n1179), .B1(
        d_ff3_sh_x_out[30]), .Y(n1400) );
  OAI2BB1X1TS U1557 ( .A0N(n1401), .A1N(d_ff3_LUT_out[4]), .B0(n1400), .Y(
        add_subt_dataB[30]) );
  AOI22X1TS U1558 ( .A0(n1402), .A1(d_ff3_sh_y_out[28]), .B0(n1277), .B1(
        d_ff3_sh_x_out[28]), .Y(n1404) );
  NAND2X1TS U1559 ( .A(n1404), .B(n1403), .Y(add_subt_dataB[28]) );
  AOI22X1TS U1560 ( .A0(n1220), .A1(d_ff3_sh_y_out[4]), .B0(n1405), .B1(
        d_ff3_sh_x_out[4]), .Y(n1407) );
  OAI2BB1X1TS U1561 ( .A0N(n1408), .A1N(d_ff3_LUT_out[4]), .B0(n1407), .Y(
        add_subt_dataB[4]) );
  NAND2X1TS U1562 ( .A(n1409), .B(n1003), .Y(n996) );
  OAI22X1TS U1563 ( .A0(n1140), .A1(n1146), .B0(n1411), .B1(n1410), .Y(n995)
         );
  AOI22X1TS U1564 ( .A0(n1143), .A1(n1138), .B0(n1413), .B1(n1141), .Y(n992)
         );
  OAI22X1TS U1565 ( .A0(n1422), .A1(n1139), .B0(n1442), .B1(n1141), .Y(n987)
         );
  AOI22X1TS U1566 ( .A0(cont_iter_out[2]), .A1(n1140), .B0(n1134), .B1(n1414), 
        .Y(n1418) );
  NAND2X1TS U1567 ( .A(n1418), .B(n985), .Y(n986) );
  NAND2X1TS U1568 ( .A(n1422), .B(n1146), .Y(n1417) );
  AOI32X1TS U1569 ( .A0(n1444), .A1(n1417), .A2(n1416), .B0(n1415), .B1(n1417), 
        .Y(n982) );
  NAND2X1TS U1570 ( .A(n1418), .B(n1417), .Y(n981) );
  OAI22X1TS U1571 ( .A0(n1420), .A1(n1419), .B0(n1146), .B1(n988), .Y(n979) );
  NAND2X1TS U1572 ( .A(n1442), .B(n1426), .Y(n977) );
  NAND2X1TS U1573 ( .A(n1138), .B(n1141), .Y(n1002) );
  NAND2X1TS U1574 ( .A(n1138), .B(n1421), .Y(n975) );
  NAND2X1TS U1575 ( .A(n1422), .B(n1138), .Y(n974) );
  NAND2X1TS U1576 ( .A(n1426), .B(n1425), .Y(n971) );
  NAND2X1TS U1577 ( .A(n1143), .B(n1138), .Y(n1001) );
  AOI22X1TS U1578 ( .A0(n1429), .A1(n1447), .B0(cont_var_out[0]), .B1(n1428), 
        .Y(n960) );
  NOR2BX1TS U1580 ( .AN(n1434), .B(d_ff2_Y[61]), .Y(n1435) );
  NOR2BX1TS U1581 ( .AN(n1440), .B(d_ff2_X[61]), .Y(n1441) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule

