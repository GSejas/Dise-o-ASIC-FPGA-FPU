/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:17:40 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4_80 ( CLK, EN, ENCLK, TE
 );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_21 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_23 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_24 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_26 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_27 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_29 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_32 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
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
         d_ff3_sign_out, enab_d_ff4_Yn, enab_d_ff4_Xn, fmtted_Result_63_,
         ITER_CONT_net3840230, ITER_CONT_N4, ITER_CONT_N3,
         d_ff5_data_out_net3840194, reg_Z0_net3840194,
         reg_val_muxZ_2stage_net3840194, reg_shift_y_net3840194,
         d_ff4_Xn_net3840194, d_ff4_Yn_net3840194, d_ff4_Zn_net3840194, n249,
         n960, n961, n962, n963, n964, n965, n966, n967, n968, n969, n970,
         n971, n972, n973, n974, n975, n976, n977, n978, n979, n980, n981,
         n982, n983, n984, n985, n986, n987, n988, n989, n990, n992, n993,
         n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         intadd_463_CI, intadd_463_n3, intadd_463_n2, intadd_463_n1,
         intadd_464_CI, intadd_464_n3, intadd_464_n2, intadd_464_n1, n1134,
         n1135, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145,
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
         n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1384, n1385, n1386,
         n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396,
         n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406,
         n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416,
         n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426,
         n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436,
         n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446,
         n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456,
         n1457, n1458, n1459, n1460, n1461;
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

  SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4_80 ITER_CONT_clk_gate_temp_reg ( 
        .CLK(clk), .EN(enab_cont_iter), .ENCLK(ITER_CONT_net3840230), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_21 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3840194), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_32 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff_RB1), .ENCLK(reg_Z0_net3840194), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_29 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(inst_CORDIC_FSM_v3_state_next[3]), .ENCLK(
        reg_val_muxZ_2stage_net3840194), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_27 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_RB3), .ENCLK(reg_shift_y_net3840194), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_26 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3840194), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_24 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3840194), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_23 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3840194), .TE(1'b0) );
  DFFRXLTS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3840194), 
        .RN(n1431), .QN(n1137) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3840194), .RN(n1452), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n1143) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(data_out_LUT[0]), .CK(reg_shift_y_net3840194), 
        .RN(n1455), .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n968), .CK(reg_shift_y_net3840194), .RN(n1450), .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n990), .CK(reg_shift_y_net3840194), .RN(n1455), .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n962), .CK(reg_shift_y_net3840194), .RN(n1458), .Q(d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(n971), .CK(reg_shift_y_net3840194), .RN(n1454), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(n994), .CK(reg_shift_y_net3840194), .RN(n1415), .Q(d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(data_out_LUT[6]), .CK(reg_shift_y_net3840194), 
        .RN(n1443), .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n989), .CK(reg_shift_y_net3840194), .RN(n1415), .Q(d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n993), .CK(reg_shift_y_net3840194), .RN(n1453), .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n963), .CK(reg_shift_y_net3840194), .RN(n1434), .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n982), .CK(reg_shift_y_net3840194), .RN(
        n1443), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(n965), .CK(reg_shift_y_net3840194), .RN(
        n1425), .Q(d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n999), .CK(reg_shift_y_net3840194), .RN(
        n1453), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n969), .CK(reg_shift_y_net3840194), .RN(
        n1425), .Q(d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(n987), .CK(reg_shift_y_net3840194), .RN(
        n1443), .Q(d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n964), .CK(reg_shift_y_net3840194), .RN(
        n1415), .Q(d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(n992), .CK(reg_shift_y_net3840194), .RN(
        n1453), .Q(d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_17_ ( .D(n995), .CK(reg_shift_y_net3840194), .RN(
        n1454), .Q(d_ff3_LUT_out[17]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(n973), .CK(reg_shift_y_net3840194), .RN(
        n1454), .Q(d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n996), .CK(reg_shift_y_net3840194), .RN(
        n1458), .Q(d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(n1000), .CK(reg_shift_y_net3840194), .RN(
        n1454), .Q(d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n970), .CK(reg_shift_y_net3840194), .RN(
        n1450), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(n1003), .CK(reg_shift_y_net3840194), .RN(
        n1438), .Q(d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n979), .CK(reg_shift_y_net3840194), .RN(
        n1438), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n978), .CK(reg_shift_y_net3840194), .RN(
        n1450), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(n984), .CK(reg_shift_y_net3840194), .RN(
        n1431), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n980), .CK(reg_shift_y_net3840194), .RN(
        n1452), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(n966), .CK(reg_shift_y_net3840194), .RN(
        n1413), .Q(d_ff3_LUT_out[27]) );
  DFFRXLTS reg_LUT_Q_reg_28_ ( .D(n975), .CK(reg_shift_y_net3840194), .RN(
        n1455), .Q(d_ff3_LUT_out[28]) );
  DFFRXLTS reg_LUT_Q_reg_29_ ( .D(n986), .CK(reg_shift_y_net3840194), .RN(
        n1450), .Q(d_ff3_LUT_out[29]) );
  DFFRXLTS reg_LUT_Q_reg_31_ ( .D(n981), .CK(reg_shift_y_net3840194), .RN(
        n1454), .Q(d_ff3_LUT_out[31]) );
  DFFRXLTS reg_LUT_Q_reg_32_ ( .D(n974), .CK(reg_shift_y_net3840194), .RN(
        n1454), .Q(d_ff3_LUT_out[32]) );
  DFFRXLTS reg_LUT_Q_reg_33_ ( .D(n967), .CK(reg_shift_y_net3840194), .RN(
        n1452), .Q(d_ff3_LUT_out[33]) );
  DFFRXLTS reg_LUT_Q_reg_34_ ( .D(n976), .CK(reg_shift_y_net3840194), .RN(
        n1450), .Q(d_ff3_LUT_out[34]) );
  DFFRXLTS reg_LUT_Q_reg_35_ ( .D(n972), .CK(reg_shift_y_net3840194), .RN(
        n1452), .Q(d_ff3_LUT_out[35]) );
  DFFRXLTS reg_LUT_Q_reg_37_ ( .D(n1145), .CK(reg_shift_y_net3840194), .RN(
        n1454), .Q(d_ff3_LUT_out[37]) );
  DFFRXLTS reg_LUT_Q_reg_39_ ( .D(data_out_LUT[39]), .CK(
        reg_shift_y_net3840194), .RN(n1455), .Q(d_ff3_LUT_out[39]) );
  DFFRXLTS reg_LUT_Q_reg_41_ ( .D(n977), .CK(reg_shift_y_net3840194), .RN(
        n1455), .Q(d_ff3_LUT_out[41]) );
  DFFRXLTS reg_LUT_Q_reg_42_ ( .D(n998), .CK(reg_shift_y_net3840194), .RN(
        n1455), .Q(d_ff3_LUT_out[42]) );
  DFFRXLTS reg_LUT_Q_reg_44_ ( .D(n1002), .CK(reg_shift_y_net3840194), .RN(
        n1451), .Q(d_ff3_LUT_out[44]) );
  DFFRXLTS reg_LUT_Q_reg_45_ ( .D(n1001), .CK(reg_shift_y_net3840194), .RN(
        n1451), .Q(d_ff3_LUT_out[45]) );
  DFFRXLTS reg_LUT_Q_reg_50_ ( .D(n997), .CK(reg_shift_y_net3840194), .RN(
        n1451), .Q(d_ff3_LUT_out[50]) );
  DFFRXLTS reg_LUT_Q_reg_52_ ( .D(n1140), .CK(reg_shift_y_net3840194), .RN(
        n1454), .Q(d_ff3_LUT_out[52]) );
  DFFRXLTS reg_LUT_Q_reg_53_ ( .D(n988), .CK(reg_shift_y_net3840194), .RN(
        n1454), .Q(d_ff3_LUT_out[53]) );
  DFFRXLTS reg_LUT_Q_reg_54_ ( .D(data_out_LUT[54]), .CK(
        reg_shift_y_net3840194), .RN(n1450), .Q(d_ff3_LUT_out[54]) );
  DFFRXLTS reg_LUT_Q_reg_55_ ( .D(n983), .CK(reg_shift_y_net3840194), .RN(
        n1452), .Q(d_ff3_LUT_out[55]) );
  DFFRXLTS reg_LUT_Q_reg_56_ ( .D(n985), .CK(reg_shift_y_net3840194), .RN(
        n1438), .Q(d_ff3_LUT_out[56]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3840194), .RN(n1455), .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3840194), .RN(n1438), .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3840194), .RN(n1455), .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3840194), .RN(n1460), .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3840194), .RN(n1455), .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3840194), .RN(n1451), .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3840194), .RN(n1431), .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3840194), .RN(n249), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3840194), .RN(n1416), .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3840194), .RN(n1449), .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3840194), .RN(
        n1446), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3840194), .RN(
        n1426), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3840194), .RN(
        n1433), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3840194), .RN(
        n1430), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3840194), .RN(
        n1431), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3840194), .RN(
        n1458), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3840194), .RN(
        n1457), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3840194), .RN(
        n1421), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3840194), .RN(
        n1445), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3840194), .RN(
        n1444), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3840194), .RN(
        n1440), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3840194), .RN(
        n1445), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3840194), .RN(
        n1440), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3840194), .RN(
        n1448), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3840194), .RN(
        n1414), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3840194), .RN(
        n1419), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3840194), .RN(
        n1448), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3840194), .RN(
        n1414), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3840194), .RN(
        n1448), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3840194), .RN(
        n1419), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3840194), .RN(
        n1424), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3840194), .RN(
        n1418), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_Z0_Q_reg_32_ ( .D(data_in[32]), .CK(reg_Z0_net3840194), .RN(
        n1447), .Q(d_ff1_Z[32]) );
  DFFRXLTS reg_Z0_Q_reg_33_ ( .D(data_in[33]), .CK(reg_Z0_net3840194), .RN(
        n1435), .Q(d_ff1_Z[33]) );
  DFFRXLTS reg_Z0_Q_reg_34_ ( .D(data_in[34]), .CK(reg_Z0_net3840194), .RN(
        n1442), .Q(d_ff1_Z[34]) );
  DFFRXLTS reg_Z0_Q_reg_35_ ( .D(data_in[35]), .CK(reg_Z0_net3840194), .RN(
        n1459), .Q(d_ff1_Z[35]) );
  DFFRXLTS reg_Z0_Q_reg_36_ ( .D(data_in[36]), .CK(reg_Z0_net3840194), .RN(
        n1424), .Q(d_ff1_Z[36]) );
  DFFRXLTS reg_Z0_Q_reg_37_ ( .D(data_in[37]), .CK(reg_Z0_net3840194), .RN(
        n1418), .Q(d_ff1_Z[37]) );
  DFFRXLTS reg_Z0_Q_reg_38_ ( .D(data_in[38]), .CK(reg_Z0_net3840194), .RN(
        n1447), .Q(d_ff1_Z[38]) );
  DFFRXLTS reg_Z0_Q_reg_39_ ( .D(data_in[39]), .CK(reg_Z0_net3840194), .RN(
        n1435), .Q(d_ff1_Z[39]) );
  DFFRXLTS reg_Z0_Q_reg_40_ ( .D(data_in[40]), .CK(reg_Z0_net3840194), .RN(
        n1442), .Q(d_ff1_Z[40]) );
  DFFRXLTS reg_Z0_Q_reg_41_ ( .D(data_in[41]), .CK(reg_Z0_net3840194), .RN(
        n1459), .Q(d_ff1_Z[41]) );
  DFFRXLTS reg_Z0_Q_reg_42_ ( .D(data_in[42]), .CK(reg_Z0_net3840194), .RN(
        n1449), .Q(d_ff1_Z[42]) );
  DFFRXLTS reg_Z0_Q_reg_43_ ( .D(data_in[43]), .CK(reg_Z0_net3840194), .RN(
        n1446), .Q(d_ff1_Z[43]) );
  DFFRXLTS reg_Z0_Q_reg_44_ ( .D(data_in[44]), .CK(reg_Z0_net3840194), .RN(
        n1426), .Q(d_ff1_Z[44]) );
  DFFRXLTS reg_Z0_Q_reg_45_ ( .D(data_in[45]), .CK(reg_Z0_net3840194), .RN(
        n1433), .Q(d_ff1_Z[45]) );
  DFFRXLTS reg_Z0_Q_reg_46_ ( .D(data_in[46]), .CK(reg_Z0_net3840194), .RN(
        n1430), .Q(d_ff1_Z[46]) );
  DFFRXLTS reg_Z0_Q_reg_47_ ( .D(data_in[47]), .CK(reg_Z0_net3840194), .RN(
        n1431), .Q(d_ff1_Z[47]) );
  DFFRXLTS reg_Z0_Q_reg_48_ ( .D(data_in[48]), .CK(reg_Z0_net3840194), .RN(
        n1458), .Q(d_ff1_Z[48]) );
  DFFRXLTS reg_Z0_Q_reg_49_ ( .D(data_in[49]), .CK(reg_Z0_net3840194), .RN(
        n1424), .Q(d_ff1_Z[49]) );
  DFFRXLTS reg_Z0_Q_reg_50_ ( .D(data_in[50]), .CK(reg_Z0_net3840194), .RN(
        n1454), .Q(d_ff1_Z[50]) );
  DFFRXLTS reg_Z0_Q_reg_51_ ( .D(data_in[51]), .CK(reg_Z0_net3840194), .RN(
        n1449), .Q(d_ff1_Z[51]) );
  DFFRXLTS reg_Z0_Q_reg_52_ ( .D(data_in[52]), .CK(reg_Z0_net3840194), .RN(
        n1446), .Q(d_ff1_Z[52]) );
  DFFRXLTS reg_Z0_Q_reg_53_ ( .D(data_in[53]), .CK(reg_Z0_net3840194), .RN(
        n1431), .Q(d_ff1_Z[53]) );
  DFFRXLTS reg_Z0_Q_reg_54_ ( .D(data_in[54]), .CK(reg_Z0_net3840194), .RN(
        n1433), .Q(d_ff1_Z[54]) );
  DFFRXLTS reg_Z0_Q_reg_55_ ( .D(data_in[55]), .CK(reg_Z0_net3840194), .RN(
        n1430), .Q(d_ff1_Z[55]) );
  DFFRXLTS reg_Z0_Q_reg_56_ ( .D(data_in[56]), .CK(reg_Z0_net3840194), .RN(
        n1431), .Q(d_ff1_Z[56]) );
  DFFRXLTS reg_Z0_Q_reg_57_ ( .D(data_in[57]), .CK(reg_Z0_net3840194), .RN(
        n1458), .Q(d_ff1_Z[57]) );
  DFFRXLTS reg_Z0_Q_reg_58_ ( .D(data_in[58]), .CK(reg_Z0_net3840194), .RN(
        n1418), .Q(d_ff1_Z[58]) );
  DFFRXLTS reg_Z0_Q_reg_59_ ( .D(data_in[59]), .CK(reg_Z0_net3840194), .RN(
        n1420), .Q(d_ff1_Z[59]) );
  DFFRXLTS reg_Z0_Q_reg_60_ ( .D(data_in[60]), .CK(reg_Z0_net3840194), .RN(
        n1449), .Q(d_ff1_Z[60]) );
  DFFRXLTS reg_Z0_Q_reg_61_ ( .D(data_in[61]), .CK(reg_Z0_net3840194), .RN(
        n1446), .Q(d_ff1_Z[61]) );
  DFFRXLTS reg_Z0_Q_reg_62_ ( .D(data_in[62]), .CK(reg_Z0_net3840194), .RN(
        n1413), .Q(d_ff1_Z[62]) );
  DFFRXLTS reg_Z0_Q_reg_63_ ( .D(data_in[63]), .CK(reg_Z0_net3840194), .RN(
        n1458), .Q(d_ff1_Z[63]) );
  DFFRXLTS reg_shift_x_Q_reg_52_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3840194), .RN(n1433), .Q(d_ff3_sh_x_out[52]) );
  DFFRXLTS reg_shift_x_Q_reg_53_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3840194), .RN(n1430), .Q(d_ff3_sh_x_out[53]) );
  DFFRXLTS reg_shift_x_Q_reg_54_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3840194), .RN(n1440), .Q(d_ff3_sh_x_out[54]) );
  DFFRXLTS reg_shift_x_Q_reg_55_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3840194), .RN(n1445), .Q(d_ff3_sh_x_out[55]) );
  DFFRXLTS reg_shift_x_Q_reg_56_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3840194), .RN(n1448), .Q(d_ff3_sh_x_out[56]) );
  DFFRXLTS reg_shift_x_Q_reg_57_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3840194), .RN(n1440), .Q(d_ff3_sh_x_out[57]) );
  DFFRXLTS reg_shift_x_Q_reg_58_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3840194), .RN(n1419), .Q(d_ff3_sh_x_out[58]) );
  DFFRXLTS reg_shift_x_Q_reg_59_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3840194), .RN(n1414), .Q(d_ff3_sh_x_out[59]) );
  DFFRXLTS reg_shift_x_Q_reg_60_ ( .D(sh_exp_x[8]), .CK(reg_shift_y_net3840194), .RN(n1448), .Q(d_ff3_sh_x_out[60]) );
  DFFRXLTS reg_shift_x_Q_reg_61_ ( .D(sh_exp_x[9]), .CK(reg_shift_y_net3840194), .RN(n1414), .Q(d_ff3_sh_x_out[61]) );
  DFFRXLTS reg_shift_x_Q_reg_62_ ( .D(sh_exp_x[10]), .CK(
        reg_shift_y_net3840194), .RN(n1440), .Q(d_ff3_sh_x_out[62]) );
  DFFRXLTS reg_shift_y_Q_reg_52_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3840194), .RN(n1448), .Q(d_ff3_sh_y_out[52]) );
  DFFRXLTS reg_shift_y_Q_reg_53_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3840194), .RN(n1444), .Q(d_ff3_sh_y_out[53]) );
  DFFRXLTS reg_shift_y_Q_reg_54_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3840194), .RN(n1440), .Q(d_ff3_sh_y_out[54]) );
  DFFRXLTS reg_shift_y_Q_reg_55_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3840194), .RN(n1419), .Q(d_ff3_sh_y_out[55]) );
  DFFRXLTS reg_shift_y_Q_reg_56_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3840194), .RN(n1419), .Q(d_ff3_sh_y_out[56]) );
  DFFRXLTS reg_shift_y_Q_reg_57_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3840194), .RN(n1419), .Q(d_ff3_sh_y_out[57]) );
  DFFRXLTS reg_shift_y_Q_reg_58_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3840194), .RN(n1440), .Q(d_ff3_sh_y_out[58]) );
  DFFRXLTS reg_shift_y_Q_reg_59_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3840194), .RN(n1445), .Q(d_ff3_sh_y_out[59]) );
  DFFRXLTS reg_shift_y_Q_reg_60_ ( .D(sh_exp_y[8]), .CK(reg_shift_y_net3840194), .RN(n1448), .Q(d_ff3_sh_y_out[60]) );
  DFFRXLTS reg_shift_y_Q_reg_61_ ( .D(sh_exp_y[9]), .CK(reg_shift_y_net3840194), .RN(n1444), .Q(d_ff3_sh_y_out[61]) );
  DFFRXLTS reg_shift_y_Q_reg_62_ ( .D(sh_exp_y[10]), .CK(
        reg_shift_y_net3840194), .RN(n1444), .Q(d_ff3_sh_y_out[62]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3840194), .RN(n1444), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1448), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3840194), 
        .RN(n1414), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3840194), .RN(n1440), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1443), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3840194), 
        .RN(n1434), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3840194), .RN(n1439), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1443), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3840194), 
        .RN(n1425), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3840194), .RN(n1434), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1453), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3840194), 
        .RN(n1439), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3840194), .RN(n1434), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1453), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3840194), 
        .RN(n1443), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3840194), .RN(n1439), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3840194), 
        .RN(n249), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3840194), .RN(n249), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3840194), 
        .RN(n249), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3840194), .RN(n1436), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1460), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3840194), 
        .RN(n1460), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3840194), .RN(n1441), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1451), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3840194), 
        .RN(n1437), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3840194), .RN(n1456), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1424), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3840194), 
        .RN(n1418), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3840194), .RN(n1459), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1447), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3840194), .RN(n1435), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3840194), .RN(n1442), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1424), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3840194), .RN(n1418), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3840194), .RN(n1447), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1435), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3840194), .RN(n1442), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3840194), .RN(n1459), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1417), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3840194), .RN(n1461), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3840194), .RN(n1457), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3840194), .RN(n1437), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3840194), .RN(n1441), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1417), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3840194), .RN(n1461), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3840194), .RN(n1457), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3840194), .RN(n1437), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3840194), .RN(n1441), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1414), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3840194), .RN(n1440), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3840194), .RN(n1419), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1419), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3840194), .RN(n1419), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3840194), .RN(n1444), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1445), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3840194), .RN(n1448), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3840194), .RN(n1444), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1444), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3840194), .RN(n1444), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3840194), .RN(n1445), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1434), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3840194), .RN(n1415), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3840194), .RN(n1434), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1453), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3840194), .RN(n1453), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3840194), .RN(n1415), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1439), .Q(d_ff2_X[23]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(d_ff2_X[23]), .CK(reg_shift_y_net3840194), .RN(n1425), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3840194), .RN(n1439), .Q(d_ff_Xn[24]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1443), .Q(d_ff2_X[24]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(d_ff2_X[24]), .CK(reg_shift_y_net3840194), .RN(n1443), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3840194), .RN(n1425), .Q(d_ff_Xn[25]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1450), .Q(d_ff2_X[25]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(d_ff2_X[25]), .CK(reg_shift_y_net3840194), .RN(n1454), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3840194), .RN(n1450), .Q(d_ff_Xn[26]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1452), .Q(d_ff2_X[26]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(d_ff2_X[26]), .CK(reg_shift_y_net3840194), .RN(n1451), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3840194), .RN(n1454), .Q(d_ff_Xn[27]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1438), .Q(d_ff2_X[27]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(d_ff2_X[27]), .CK(reg_shift_y_net3840194), .RN(n1455), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3840194), .RN(n1433), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1455), .Q(d_ff2_X[28]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(d_ff2_X[28]), .CK(reg_shift_y_net3840194), .RN(n1452), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3840194), .RN(n1452), .Q(d_ff_Xn[29]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1417), .Q(d_ff2_X[29]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(d_ff2_X[29]), .CK(reg_shift_y_net3840194), .RN(n1461), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3840194), .RN(n1457), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_X[30]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(d_ff2_X[30]), .CK(reg_shift_y_net3840194), .RN(n1437), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3840194), .RN(n1441), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1417), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3840194), .RN(n1461), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Xn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Xn_net3840194), .RN(n1457), .Q(d_ff_Xn[32]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_32_ ( .D(first_mux_X[32]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_X[32]) );
  DFFRXLTS reg_shift_x_Q_reg_32_ ( .D(d_ff2_X[32]), .CK(reg_shift_y_net3840194), .RN(n1437), .Q(d_ff3_sh_x_out[32]) );
  DFFRXLTS d_ff4_Xn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Xn_net3840194), .RN(n1441), .Q(d_ff_Xn[33]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_33_ ( .D(first_mux_X[33]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1438), .Q(d_ff2_X[33]) );
  DFFRXLTS reg_shift_x_Q_reg_33_ ( .D(d_ff2_X[33]), .CK(reg_shift_y_net3840194), .RN(n1455), .Q(d_ff3_sh_x_out[33]) );
  DFFRXLTS d_ff4_Xn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Xn_net3840194), .RN(n1454), .Q(d_ff_Xn[34]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_34_ ( .D(first_mux_X[34]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1438), .Q(d_ff2_X[34]) );
  DFFRXLTS reg_shift_x_Q_reg_34_ ( .D(d_ff2_X[34]), .CK(reg_shift_y_net3840194), .RN(n1450), .Q(d_ff3_sh_x_out[34]) );
  DFFRXLTS d_ff4_Xn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Xn_net3840194), .RN(n1451), .Q(d_ff_Xn[35]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_35_ ( .D(first_mux_X[35]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1450), .Q(d_ff2_X[35]) );
  DFFRXLTS reg_shift_x_Q_reg_35_ ( .D(d_ff2_X[35]), .CK(reg_shift_y_net3840194), .RN(n1433), .Q(d_ff3_sh_x_out[35]) );
  DFFRXLTS d_ff4_Xn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Xn_net3840194), .RN(n1430), .Q(d_ff_Xn[36]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_36_ ( .D(first_mux_X[36]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1430), .Q(d_ff2_X[36]) );
  DFFRXLTS reg_shift_x_Q_reg_36_ ( .D(d_ff2_X[36]), .CK(reg_shift_y_net3840194), .RN(n1450), .Q(d_ff3_sh_x_out[36]) );
  DFFRXLTS d_ff4_Xn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Xn_net3840194), .RN(n1438), .Q(d_ff_Xn[37]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_37_ ( .D(first_mux_X[37]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1460), .Q(d_ff2_X[37]) );
  DFFRXLTS reg_shift_x_Q_reg_37_ ( .D(d_ff2_X[37]), .CK(reg_shift_y_net3840194), .RN(n1436), .Q(d_ff3_sh_x_out[37]) );
  DFFRXLTS d_ff4_Xn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Xn_net3840194), .RN(n1456), .Q(d_ff_Xn[38]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_38_ ( .D(first_mux_X[38]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1460), .Q(d_ff2_X[38]) );
  DFFRXLTS reg_shift_x_Q_reg_38_ ( .D(d_ff2_X[38]), .CK(reg_shift_y_net3840194), .RN(n1436), .Q(d_ff3_sh_x_out[38]) );
  DFFRXLTS d_ff4_Xn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Xn_net3840194), .RN(n1456), .Q(d_ff_Xn[39]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_39_ ( .D(first_mux_X[39]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1460), .Q(d_ff2_X[39]) );
  DFFRXLTS reg_shift_x_Q_reg_39_ ( .D(d_ff2_X[39]), .CK(reg_shift_y_net3840194), .RN(n1436), .Q(d_ff3_sh_x_out[39]) );
  DFFRXLTS d_ff4_Xn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Xn_net3840194), .RN(n1456), .Q(d_ff_Xn[40]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_40_ ( .D(first_mux_X[40]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1460), .Q(d_ff2_X[40]) );
  DFFRXLTS reg_shift_x_Q_reg_40_ ( .D(d_ff2_X[40]), .CK(reg_shift_y_net3840194), .RN(n1436), .Q(d_ff3_sh_x_out[40]) );
  DFFRXLTS d_ff4_Xn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Xn_net3840194), .RN(n1456), .Q(d_ff_Xn[41]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_41_ ( .D(first_mux_X[41]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1424), .Q(d_ff2_X[41]) );
  DFFRXLTS reg_shift_x_Q_reg_41_ ( .D(d_ff2_X[41]), .CK(reg_shift_y_net3840194), .RN(n1418), .Q(d_ff3_sh_x_out[41]) );
  DFFRXLTS d_ff4_Xn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Xn_net3840194), .RN(n1447), .Q(d_ff_Xn[42]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_42_ ( .D(first_mux_X[42]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1435), .Q(d_ff2_X[42]) );
  DFFRXLTS reg_shift_x_Q_reg_42_ ( .D(d_ff2_X[42]), .CK(reg_shift_y_net3840194), .RN(n1442), .Q(d_ff3_sh_x_out[42]) );
  DFFRXLTS d_ff4_Xn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Xn_net3840194), .RN(n1459), .Q(d_ff_Xn[43]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_43_ ( .D(first_mux_X[43]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1424), .Q(d_ff2_X[43]) );
  DFFRXLTS reg_shift_x_Q_reg_43_ ( .D(d_ff2_X[43]), .CK(reg_shift_y_net3840194), .RN(n1418), .Q(d_ff3_sh_x_out[43]) );
  DFFRXLTS d_ff4_Xn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Xn_net3840194), .RN(n1447), .Q(d_ff_Xn[44]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_44_ ( .D(first_mux_X[44]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1435), .Q(d_ff2_X[44]) );
  DFFRXLTS reg_shift_x_Q_reg_44_ ( .D(d_ff2_X[44]), .CK(reg_shift_y_net3840194), .RN(n1442), .Q(d_ff3_sh_x_out[44]) );
  DFFRXLTS d_ff4_Xn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Xn_net3840194), .RN(n1459), .Q(d_ff_Xn[45]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_45_ ( .D(first_mux_X[45]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1443), .Q(d_ff2_X[45]) );
  DFFRXLTS reg_shift_x_Q_reg_45_ ( .D(d_ff2_X[45]), .CK(reg_shift_y_net3840194), .RN(n1443), .Q(d_ff3_sh_x_out[45]) );
  DFFRXLTS d_ff4_Xn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Xn_net3840194), .RN(n1443), .Q(d_ff_Xn[46]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_46_ ( .D(first_mux_X[46]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1415), .Q(d_ff2_X[46]) );
  DFFRXLTS reg_shift_x_Q_reg_46_ ( .D(d_ff2_X[46]), .CK(reg_shift_y_net3840194), .RN(n1434), .Q(d_ff3_sh_x_out[46]) );
  DFFRXLTS d_ff4_Xn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Xn_net3840194), .RN(n1453), .Q(d_ff_Xn[47]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_47_ ( .D(first_mux_X[47]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1453), .Q(d_ff2_X[47]) );
  DFFRXLTS reg_shift_x_Q_reg_47_ ( .D(d_ff2_X[47]), .CK(reg_shift_y_net3840194), .RN(n1453), .Q(d_ff3_sh_x_out[47]) );
  DFFRXLTS d_ff4_Xn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Xn_net3840194), .RN(n1453), .Q(d_ff_Xn[48]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_48_ ( .D(first_mux_X[48]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1425), .Q(d_ff2_X[48]) );
  DFFRXLTS reg_shift_x_Q_reg_48_ ( .D(d_ff2_X[48]), .CK(reg_shift_y_net3840194), .RN(n1439), .Q(d_ff3_sh_x_out[48]) );
  DFFRXLTS d_ff4_Xn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Xn_net3840194), .RN(n1443), .Q(d_ff_Xn[49]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_49_ ( .D(first_mux_X[49]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1425), .Q(d_ff2_X[49]) );
  DFFRXLTS reg_shift_x_Q_reg_49_ ( .D(d_ff2_X[49]), .CK(reg_shift_y_net3840194), .RN(n1421), .Q(d_ff3_sh_x_out[49]) );
  DFFRXLTS d_ff4_Xn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Xn_net3840194), .RN(n1449), .Q(d_ff_Xn[50]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_50_ ( .D(first_mux_X[50]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1446), .Q(d_ff2_X[50]) );
  DFFRXLTS reg_shift_x_Q_reg_50_ ( .D(d_ff2_X[50]), .CK(reg_shift_y_net3840194), .RN(n1427), .Q(d_ff3_sh_x_out[50]) );
  DFFRXLTS d_ff4_Xn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Xn_net3840194), .RN(n1433), .Q(d_ff_Xn[51]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_51_ ( .D(first_mux_X[51]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1430), .Q(d_ff2_X[51]) );
  DFFRXLTS reg_shift_x_Q_reg_51_ ( .D(d_ff2_X[51]), .CK(reg_shift_y_net3840194), .RN(n1431), .Q(d_ff3_sh_x_out[51]) );
  DFFRXLTS d_ff4_Xn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Xn_net3840194), .RN(n1458), .Q(d_ff_Xn[52]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_52_ ( .D(first_mux_X[52]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1447), .Q(d_ff2_X[52]), .QN(
        n1142) );
  DFFRXLTS d_ff4_Xn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Xn_net3840194), .RN(n1455), .Q(d_ff_Xn[53]) );
  DFFRXLTS d_ff4_Xn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Xn_net3840194), .RN(n1433), .Q(d_ff_Xn[54]) );
  DFFRXLTS d_ff4_Xn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Xn_net3840194), .RN(n1430), .Q(d_ff_Xn[55]) );
  DFFRXLTS d_ff4_Xn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Xn_net3840194), .RN(n1431), .Q(d_ff_Xn[56]) );
  DFFRXLTS d_ff4_Xn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Xn_net3840194), .RN(n1440), .Q(d_ff_Xn[57]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_57_ ( .D(first_mux_X[57]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1458), .Q(d_ff2_X[57]), .QN(
        n1406) );
  DFFRXLTS d_ff4_Xn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Xn_net3840194), .RN(n1433), .Q(d_ff_Xn[58]) );
  DFFRXLTS d_ff4_Xn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Xn_net3840194), .RN(n1430), .Q(d_ff_Xn[59]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_59_ ( .D(first_mux_X[59]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1431), .Q(d_ff2_X[59]) );
  DFFRXLTS d_ff4_Xn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Xn_net3840194), .RN(n1432), .Q(d_ff_Xn[60]) );
  DFFRXLTS d_ff4_Xn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Xn_net3840194), .RN(n1432), .Q(d_ff_Xn[61]) );
  DFFRXLTS d_ff4_Xn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Xn_net3840194), .RN(n1432), .Q(d_ff_Xn[62]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_62_ ( .D(first_mux_X[62]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1432), .Q(d_ff2_X[62]) );
  DFFRXLTS d_ff4_Xn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Xn_net3840194), .RN(n1432), .Q(d_ff_Xn[63]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_63_ ( .D(first_mux_X[63]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1432), .Q(d_ff2_X[63]) );
  DFFRXLTS reg_shift_x_Q_reg_63_ ( .D(d_ff2_X[63]), .CK(reg_shift_y_net3840194), .RN(n1432), .Q(d_ff3_sh_x_out[63]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3840194), .RN(n1432), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1432), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3840194), 
        .RN(n1456), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(mux_sal[0]), .CK(
        d_ff5_data_out_net3840194), .RN(n1446), .Q(data_output[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3840194), .RN(n1458), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1433), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3840194), 
        .RN(n1430), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(mux_sal[1]), .CK(
        d_ff5_data_out_net3840194), .RN(n1431), .Q(data_output[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3840194), .RN(n1458), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1448), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3840194), 
        .RN(n1426), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(mux_sal[2]), .CK(
        d_ff5_data_out_net3840194), .RN(n1449), .Q(data_output[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3840194), .RN(n1446), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1427), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3840194), 
        .RN(n1433), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(mux_sal[3]), .CK(
        d_ff5_data_out_net3840194), .RN(n1430), .Q(data_output[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3840194), .RN(n1431), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1458), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3840194), 
        .RN(n1415), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(mux_sal[4]), .CK(
        d_ff5_data_out_net3840194), .RN(n1426), .Q(data_output[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3840194), .RN(n1449), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1446), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3840194), 
        .RN(n1458), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(mux_sal[5]), .CK(
        d_ff5_data_out_net3840194), .RN(n1433), .Q(data_output[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3840194), .RN(n1430), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1431), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3840194), 
        .RN(n1458), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(mux_sal[6]), .CK(
        d_ff5_data_out_net3840194), .RN(n1426), .Q(data_output[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3840194), .RN(n1411), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1426), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3840194), 
        .RN(n1428), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(mux_sal[7]), .CK(
        d_ff5_data_out_net3840194), .RN(n1426), .Q(data_output[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3840194), .RN(n1412), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1426), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3840194), 
        .RN(n1431), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(mux_sal[8]), .CK(
        d_ff5_data_out_net3840194), .RN(n1426), .Q(data_output[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3840194), .RN(n1430), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1426), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3840194), 
        .RN(n1429), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(mux_sal[9]), .CK(
        d_ff5_data_out_net3840194), .RN(n1429), .Q(data_output[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3840194), .RN(n1429), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1429), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3840194), .RN(n1429), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(mux_sal[10]), .CK(
        d_ff5_data_out_net3840194), .RN(n1429), .Q(data_output[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3840194), .RN(n1429), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1429), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3840194), .RN(n1429), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(mux_sal[11]), .CK(
        d_ff5_data_out_net3840194), .RN(n1429), .Q(data_output[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3840194), .RN(n1429), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1429), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3840194), .RN(n1429), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(mux_sal[12]), .CK(
        d_ff5_data_out_net3840194), .RN(n1428), .Q(data_output[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3840194), .RN(n1428), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1428), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3840194), .RN(n1428), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(mux_sal[13]), .CK(
        d_ff5_data_out_net3840194), .RN(n1428), .Q(data_output[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3840194), .RN(n1428), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1428), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3840194), .RN(n1428), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(mux_sal[14]), .CK(
        d_ff5_data_out_net3840194), .RN(n1428), .Q(data_output[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3840194), .RN(n1428), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1428), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3840194), .RN(n1428), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(mux_sal[15]), .CK(
        d_ff5_data_out_net3840194), .RN(n1413), .Q(data_output[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3840194), .RN(n1427), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1413), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3840194), .RN(n1427), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(mux_sal[16]), .CK(
        d_ff5_data_out_net3840194), .RN(n1413), .Q(data_output[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3840194), .RN(n1427), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1413), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3840194), .RN(n1427), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(mux_sal[17]), .CK(
        d_ff5_data_out_net3840194), .RN(n1413), .Q(data_output[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3840194), .RN(n1427), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1413), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3840194), .RN(n1427), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(mux_sal[18]), .CK(
        d_ff5_data_out_net3840194), .RN(n1426), .Q(data_output[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3840194), .RN(n1429), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1426), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3840194), .RN(n1430), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(mux_sal[19]), .CK(
        d_ff5_data_out_net3840194), .RN(n1426), .Q(data_output[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3840194), .RN(n1411), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1426), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3840194), .RN(n1412), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(mux_sal[20]), .CK(
        d_ff5_data_out_net3840194), .RN(n1426), .Q(data_output[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3840194), .RN(n1428), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1426), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3840194), .RN(n1429), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(mux_sal[21]), .CK(
        d_ff5_data_out_net3840194), .RN(n1415), .Q(data_output[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3840194), .RN(n1439), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1443), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3840194), .RN(n1443), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(mux_sal[22]), .CK(
        d_ff5_data_out_net3840194), .RN(n1425), .Q(data_output[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3840194), .RN(n1415), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1425), .Q(d_ff2_Y[23]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(d_ff2_Y[23]), .CK(reg_shift_y_net3840194), .RN(n1434), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(mux_sal[23]), .CK(
        d_ff5_data_out_net3840194), .RN(n1453), .Q(data_output[23]) );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3840194), .RN(n1453), .Q(d_ff_Yn[24]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1453), .Q(d_ff2_Y[24]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(d_ff2_Y[24]), .CK(reg_shift_y_net3840194), .RN(n1425), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(mux_sal[24]), .CK(
        d_ff5_data_out_net3840194), .RN(n1424), .Q(data_output[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3840194), .RN(n1418), .Q(d_ff_Yn[25]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1447), .Q(d_ff2_Y[25]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(d_ff2_Y[25]), .CK(reg_shift_y_net3840194), .RN(n1435), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(mux_sal[25]), .CK(
        d_ff5_data_out_net3840194), .RN(n1442), .Q(data_output[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3840194), .RN(n1459), .Q(d_ff_Yn[26]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1424), .Q(d_ff2_Y[26]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(d_ff2_Y[26]), .CK(reg_shift_y_net3840194), .RN(n1418), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(mux_sal[26]), .CK(
        d_ff5_data_out_net3840194), .RN(n1447), .Q(data_output[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3840194), .RN(n1435), .Q(d_ff_Yn[27]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1442), .Q(d_ff2_Y[27]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(d_ff2_Y[27]), .CK(reg_shift_y_net3840194), .RN(n1459), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(mux_sal[27]), .CK(
        d_ff5_data_out_net3840194), .RN(n1456), .Q(data_output[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3840194), .RN(n1459), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1444), .Q(d_ff2_Y[28]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(d_ff2_Y[28]), .CK(reg_shift_y_net3840194), .RN(n1424), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(mux_sal[28]), .CK(
        d_ff5_data_out_net3840194), .RN(n1459), .Q(data_output[28]) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3840194), .RN(n1419), .Q(d_ff_Yn[29]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1459), .Q(d_ff2_Y[29]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(d_ff2_Y[29]), .CK(reg_shift_y_net3840194), .RN(n1418), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(mux_sal[29]), .CK(
        d_ff5_data_out_net3840194), .RN(n1461), .Q(data_output[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3840194), .RN(n1419), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1448), .Q(d_ff2_Y[30]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(d_ff2_Y[30]), .CK(reg_shift_y_net3840194), .RN(n1447), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(mux_sal[30]), .CK(
        d_ff5_data_out_net3840194), .RN(n1456), .Q(data_output[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3840194), .RN(n1448), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1443), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3840194), .RN(n1447), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(mux_sal[31]), .CK(
        d_ff5_data_out_net3840194), .RN(n1418), .Q(data_output[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Yn_net3840194), .RN(n1440), .Q(d_ff_Yn[32]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_32_ ( .D(first_mux_Y[32]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1453), .Q(d_ff2_Y[32]) );
  DFFRXLTS reg_shift_y_Q_reg_32_ ( .D(d_ff2_Y[32]), .CK(reg_shift_y_net3840194), .RN(n1424), .Q(d_ff3_sh_y_out[32]) );
  DFFRXLTS d_ff5_data_out_Q_reg_32_ ( .D(mux_sal[32]), .CK(
        d_ff5_data_out_net3840194), .RN(n1447), .Q(data_output[32]) );
  DFFRXLTS d_ff4_Yn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Yn_net3840194), .RN(n1439), .Q(d_ff_Yn[33]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_33_ ( .D(first_mux_Y[33]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1414), .Q(d_ff2_Y[33]) );
  DFFRXLTS reg_shift_y_Q_reg_33_ ( .D(d_ff2_Y[33]), .CK(reg_shift_y_net3840194), .RN(n1418), .Q(d_ff3_sh_y_out[33]) );
  DFFRXLTS d_ff5_data_out_Q_reg_33_ ( .D(mux_sal[33]), .CK(
        d_ff5_data_out_net3840194), .RN(n1437), .Q(data_output[33]) );
  DFFRXLTS d_ff4_Yn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Yn_net3840194), .RN(n1441), .Q(d_ff_Yn[34]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_34_ ( .D(first_mux_Y[34]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1417), .Q(d_ff2_Y[34]) );
  DFFRXLTS reg_shift_y_Q_reg_34_ ( .D(d_ff2_Y[34]), .CK(reg_shift_y_net3840194), .RN(n1461), .Q(d_ff3_sh_y_out[34]) );
  DFFRXLTS d_ff5_data_out_Q_reg_34_ ( .D(mux_sal[34]), .CK(
        d_ff5_data_out_net3840194), .RN(n1457), .Q(data_output[34]) );
  DFFRXLTS d_ff4_Yn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Yn_net3840194), .RN(n249), .Q(d_ff_Yn[35]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_35_ ( .D(first_mux_Y[35]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1437), .Q(d_ff2_Y[35]) );
  DFFRXLTS reg_shift_y_Q_reg_35_ ( .D(d_ff2_Y[35]), .CK(reg_shift_y_net3840194), .RN(n1441), .Q(d_ff3_sh_y_out[35]) );
  DFFRXLTS d_ff5_data_out_Q_reg_35_ ( .D(mux_sal[35]), .CK(
        d_ff5_data_out_net3840194), .RN(n1417), .Q(data_output[35]) );
  DFFRXLTS d_ff4_Yn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Yn_net3840194), .RN(n1461), .Q(d_ff_Yn[36]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_36_ ( .D(first_mux_Y[36]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_Y[36]) );
  DFFRXLTS reg_shift_y_Q_reg_36_ ( .D(d_ff2_Y[36]), .CK(reg_shift_y_net3840194), .RN(n1457), .Q(d_ff3_sh_y_out[36]) );
  DFFRXLTS d_ff5_data_out_Q_reg_36_ ( .D(mux_sal[36]), .CK(
        d_ff5_data_out_net3840194), .RN(n1456), .Q(data_output[36]) );
  DFFRXLTS d_ff4_Yn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Yn_net3840194), .RN(n1449), .Q(d_ff_Yn[37]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_37_ ( .D(first_mux_Y[37]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1436), .Q(d_ff2_Y[37]) );
  DFFRXLTS reg_shift_y_Q_reg_37_ ( .D(d_ff2_Y[37]), .CK(reg_shift_y_net3840194), .RN(n1424), .Q(d_ff3_sh_y_out[37]) );
  DFFRXLTS d_ff5_data_out_Q_reg_37_ ( .D(mux_sal[37]), .CK(
        d_ff5_data_out_net3840194), .RN(n1456), .Q(data_output[37]) );
  DFFRXLTS d_ff4_Yn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Yn_net3840194), .RN(n1446), .Q(d_ff_Yn[38]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_38_ ( .D(first_mux_Y[38]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1443), .Q(d_ff2_Y[38]) );
  DFFRXLTS reg_shift_y_Q_reg_38_ ( .D(d_ff2_Y[38]), .CK(reg_shift_y_net3840194), .RN(n1418), .Q(d_ff3_sh_y_out[38]) );
  DFFRXLTS d_ff5_data_out_Q_reg_38_ ( .D(mux_sal[38]), .CK(
        d_ff5_data_out_net3840194), .RN(n1456), .Q(data_output[38]) );
  DFFRXLTS d_ff4_Yn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Yn_net3840194), .RN(n1433), .Q(d_ff_Yn[39]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_39_ ( .D(first_mux_Y[39]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1445), .Q(d_ff2_Y[39]) );
  DFFRXLTS reg_shift_y_Q_reg_39_ ( .D(d_ff2_Y[39]), .CK(reg_shift_y_net3840194), .RN(n1447), .Q(d_ff3_sh_y_out[39]) );
  DFFRXLTS d_ff5_data_out_Q_reg_39_ ( .D(mux_sal[39]), .CK(
        d_ff5_data_out_net3840194), .RN(n1457), .Q(data_output[39]) );
  DFFRXLTS d_ff4_Yn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Yn_net3840194), .RN(n1444), .Q(d_ff_Yn[40]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_40_ ( .D(first_mux_Y[40]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1434), .Q(d_ff2_Y[40]) );
  DFFRXLTS reg_shift_y_Q_reg_40_ ( .D(d_ff2_Y[40]), .CK(reg_shift_y_net3840194), .RN(n1417), .Q(d_ff3_sh_y_out[40]) );
  DFFRXLTS d_ff5_data_out_Q_reg_40_ ( .D(mux_sal[40]), .CK(
        d_ff5_data_out_net3840194), .RN(n1424), .Q(data_output[40]) );
  DFFRXLTS d_ff4_Yn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Yn_net3840194), .RN(n1415), .Q(d_ff_Yn[41]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_41_ ( .D(first_mux_Y[41]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1415), .Q(d_ff2_Y[41]) );
  DFFRXLTS reg_shift_y_Q_reg_41_ ( .D(d_ff2_Y[41]), .CK(reg_shift_y_net3840194), .RN(n1437), .Q(d_ff3_sh_y_out[41]) );
  DFFRXLTS d_ff5_data_out_Q_reg_41_ ( .D(mux_sal[41]), .CK(
        d_ff5_data_out_net3840194), .RN(n1459), .Q(data_output[41]) );
  DFFRXLTS d_ff4_Yn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Yn_net3840194), .RN(n1425), .Q(d_ff_Yn[42]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_42_ ( .D(first_mux_Y[42]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1425), .Q(d_ff2_Y[42]) );
  DFFRXLTS reg_shift_y_Q_reg_42_ ( .D(d_ff2_Y[42]), .CK(reg_shift_y_net3840194), .RN(n1441), .Q(d_ff3_sh_y_out[42]) );
  DFFRXLTS d_ff5_data_out_Q_reg_42_ ( .D(mux_sal[42]), .CK(
        d_ff5_data_out_net3840194), .RN(n1416), .Q(data_output[42]) );
  DFFRXLTS d_ff4_Yn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Yn_net3840194), .RN(n1421), .Q(d_ff_Yn[43]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_43_ ( .D(first_mux_Y[43]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Y[43]) );
  DFFRXLTS reg_shift_y_Q_reg_43_ ( .D(d_ff2_Y[43]), .CK(reg_shift_y_net3840194), .RN(n1422), .Q(d_ff3_sh_y_out[43]) );
  DFFRXLTS d_ff5_data_out_Q_reg_43_ ( .D(mux_sal[43]), .CK(
        d_ff5_data_out_net3840194), .RN(n1423), .Q(data_output[43]) );
  DFFRXLTS d_ff4_Yn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Yn_net3840194), .RN(n1416), .Q(d_ff_Yn[44]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_44_ ( .D(first_mux_Y[44]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1421), .Q(d_ff2_Y[44]) );
  DFFRXLTS reg_shift_y_Q_reg_44_ ( .D(d_ff2_Y[44]), .CK(reg_shift_y_net3840194), .RN(n1440), .Q(d_ff3_sh_y_out[44]) );
  DFFRXLTS d_ff5_data_out_Q_reg_44_ ( .D(mux_sal[44]), .CK(
        d_ff5_data_out_net3840194), .RN(n1420), .Q(data_output[44]) );
  DFFRXLTS d_ff4_Yn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Yn_net3840194), .RN(n1422), .Q(d_ff_Yn[45]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_45_ ( .D(first_mux_Y[45]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1423), .Q(d_ff2_Y[45]) );
  DFFRXLTS reg_shift_y_Q_reg_45_ ( .D(d_ff2_Y[45]), .CK(reg_shift_y_net3840194), .RN(n1416), .Q(d_ff3_sh_y_out[45]) );
  DFFRXLTS d_ff5_data_out_Q_reg_45_ ( .D(mux_sal[45]), .CK(
        d_ff5_data_out_net3840194), .RN(n1421), .Q(data_output[45]) );
  DFFRXLTS d_ff4_Yn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Yn_net3840194), .RN(n1416), .Q(d_ff_Yn[46]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_46_ ( .D(first_mux_Y[46]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1422), .Q(d_ff2_Y[46]) );
  DFFRXLTS reg_shift_y_Q_reg_46_ ( .D(d_ff2_Y[46]), .CK(reg_shift_y_net3840194), .RN(n1423), .Q(d_ff3_sh_y_out[46]) );
  DFFRXLTS d_ff5_data_out_Q_reg_46_ ( .D(mux_sal[46]), .CK(
        d_ff5_data_out_net3840194), .RN(n1420), .Q(data_output[46]) );
  DFFRXLTS d_ff4_Yn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Yn_net3840194), .RN(n1416), .Q(d_ff_Yn[47]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_47_ ( .D(first_mux_Y[47]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Y[47]) );
  DFFRXLTS reg_shift_y_Q_reg_47_ ( .D(d_ff2_Y[47]), .CK(reg_shift_y_net3840194), .RN(n1421), .Q(d_ff3_sh_y_out[47]) );
  DFFRXLTS d_ff5_data_out_Q_reg_47_ ( .D(mux_sal[47]), .CK(
        d_ff5_data_out_net3840194), .RN(n1450), .Q(data_output[47]) );
  DFFRXLTS d_ff4_Yn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Yn_net3840194), .RN(n1422), .Q(d_ff_Yn[48]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_48_ ( .D(first_mux_Y[48]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1416), .Q(d_ff2_Y[48]) );
  DFFRXLTS reg_shift_y_Q_reg_48_ ( .D(d_ff2_Y[48]), .CK(reg_shift_y_net3840194), .RN(n1423), .Q(d_ff3_sh_y_out[48]) );
  DFFRXLTS d_ff5_data_out_Q_reg_48_ ( .D(mux_sal[48]), .CK(
        d_ff5_data_out_net3840194), .RN(n1421), .Q(data_output[48]) );
  DFFRXLTS d_ff4_Yn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Yn_net3840194), .RN(n1420), .Q(d_ff_Yn[49]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_49_ ( .D(first_mux_Y[49]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Y[49]) );
  DFFRXLTS reg_shift_y_Q_reg_49_ ( .D(d_ff2_Y[49]), .CK(reg_shift_y_net3840194), .RN(n1416), .Q(d_ff3_sh_y_out[49]) );
  DFFRXLTS d_ff5_data_out_Q_reg_49_ ( .D(mux_sal[49]), .CK(
        d_ff5_data_out_net3840194), .RN(n1421), .Q(data_output[49]) );
  DFFRXLTS d_ff4_Yn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Yn_net3840194), .RN(n1454), .Q(d_ff_Yn[50]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_50_ ( .D(first_mux_Y[50]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Y[50]) );
  DFFRXLTS reg_shift_y_Q_reg_50_ ( .D(d_ff2_Y[50]), .CK(reg_shift_y_net3840194), .RN(n1422), .Q(d_ff3_sh_y_out[50]) );
  DFFRXLTS d_ff5_data_out_Q_reg_50_ ( .D(mux_sal[50]), .CK(
        d_ff5_data_out_net3840194), .RN(n1423), .Q(data_output[50]) );
  DFFRXLTS d_ff4_Yn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Yn_net3840194), .RN(n1416), .Q(d_ff_Yn[51]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_51_ ( .D(first_mux_Y[51]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1421), .Q(d_ff2_Y[51]) );
  DFFRXLTS reg_shift_y_Q_reg_51_ ( .D(d_ff2_Y[51]), .CK(reg_shift_y_net3840194), .RN(n1455), .Q(d_ff3_sh_y_out[51]) );
  DFFRXLTS d_ff5_data_out_Q_reg_51_ ( .D(mux_sal[51]), .CK(
        d_ff5_data_out_net3840194), .RN(n1420), .Q(data_output[51]) );
  DFFRXLTS d_ff4_Yn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Yn_net3840194), .RN(n1422), .Q(d_ff_Yn[52]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_52_ ( .D(first_mux_Y[52]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1423), .Q(d_ff2_Y[52]), .QN(
        n1141) );
  DFFRXLTS d_ff5_data_out_Q_reg_52_ ( .D(mux_sal[52]), .CK(
        d_ff5_data_out_net3840194), .RN(n1416), .Q(data_output[52]) );
  DFFRXLTS d_ff4_Yn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Yn_net3840194), .RN(n1421), .Q(d_ff_Yn[53]) );
  DFFRXLTS d_ff5_data_out_Q_reg_53_ ( .D(mux_sal[53]), .CK(
        d_ff5_data_out_net3840194), .RN(n1461), .Q(data_output[53]) );
  DFFRXLTS d_ff4_Yn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Yn_net3840194), .RN(n1420), .Q(d_ff_Yn[54]) );
  DFFRXLTS d_ff5_data_out_Q_reg_54_ ( .D(mux_sal[54]), .CK(
        d_ff5_data_out_net3840194), .RN(n1422), .Q(data_output[54]) );
  DFFRXLTS d_ff4_Yn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Yn_net3840194), .RN(n1423), .Q(d_ff_Yn[55]) );
  DFFRXLTS d_ff5_data_out_Q_reg_55_ ( .D(mux_sal[55]), .CK(
        d_ff5_data_out_net3840194), .RN(n1422), .Q(data_output[55]) );
  DFFRXLTS d_ff4_Yn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Yn_net3840194), .RN(n1423), .Q(d_ff_Yn[56]) );
  DFFRXLTS d_ff5_data_out_Q_reg_56_ ( .D(mux_sal[56]), .CK(
        d_ff5_data_out_net3840194), .RN(n1416), .Q(data_output[56]) );
  DFFRXLTS d_ff4_Yn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Yn_net3840194), .RN(n1421), .Q(d_ff_Yn[57]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_57_ ( .D(first_mux_Y[57]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Y[57]), .QN(
        n1407) );
  DFFRXLTS d_ff5_data_out_Q_reg_57_ ( .D(mux_sal[57]), .CK(
        d_ff5_data_out_net3840194), .RN(n1460), .Q(data_output[57]) );
  DFFRXLTS d_ff4_Yn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Yn_net3840194), .RN(n1420), .Q(d_ff_Yn[58]) );
  DFFRXLTS d_ff5_data_out_Q_reg_58_ ( .D(mux_sal[58]), .CK(
        d_ff5_data_out_net3840194), .RN(n1416), .Q(data_output[58]) );
  DFFRXLTS d_ff4_Yn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Yn_net3840194), .RN(n1421), .Q(d_ff_Yn[59]) );
  DFFRXLTS d_ff5_data_out_Q_reg_59_ ( .D(mux_sal[59]), .CK(
        d_ff5_data_out_net3840194), .RN(n1440), .Q(data_output[59]) );
  DFFRXLTS d_ff4_Yn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Yn_net3840194), .RN(n1419), .Q(d_ff_Yn[60]) );
  DFFRXLTS d_ff5_data_out_Q_reg_60_ ( .D(mux_sal[60]), .CK(
        d_ff5_data_out_net3840194), .RN(n1419), .Q(data_output[60]) );
  DFFRXLTS d_ff4_Yn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Yn_net3840194), .RN(n1448), .Q(d_ff_Yn[61]) );
  DFFRXLTS d_ff5_data_out_Q_reg_61_ ( .D(mux_sal[61]), .CK(
        d_ff5_data_out_net3840194), .RN(n1448), .Q(data_output[61]) );
  DFFRXLTS d_ff4_Yn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Yn_net3840194), .RN(n1444), .Q(d_ff_Yn[62]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_62_ ( .D(first_mux_Y[62]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1440), .Q(d_ff2_Y[62]) );
  DFFRXLTS d_ff5_data_out_Q_reg_62_ ( .D(mux_sal[62]), .CK(
        d_ff5_data_out_net3840194), .RN(n1444), .Q(data_output[62]) );
  DFFRXLTS d_ff4_Yn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Yn_net3840194), .RN(n1414), .Q(d_ff_Yn[63]) );
  DFFRXLTS d_ff5_data_out_Q_reg_63_ ( .D(fmtted_Result_63_), .CK(
        d_ff5_data_out_net3840194), .RN(n1419), .Q(data_output[63]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_63_ ( .D(first_mux_Y[63]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1450), .Q(d_ff2_Y[63]) );
  DFFRXLTS reg_shift_y_Q_reg_63_ ( .D(d_ff2_Y[63]), .CK(reg_shift_y_net3840194), .RN(n1458), .Q(d_ff3_sh_y_out[63]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3840194), .RN(n1449), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1446), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3840194), .RN(n1433), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1458), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3840194), .RN(n1433), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1430), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3840194), .RN(n1431), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1453), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3840194), .RN(n1413), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1449), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3840194), .RN(n1435), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1442), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3840194), .RN(n1459), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1424), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3840194), .RN(n1418), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1459), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3840194), .RN(n1447), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1435), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3840194), .RN(n1442), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1424), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3840194), .RN(n1418), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1447), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3840194), .RN(n1417), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1461), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3840194), .RN(n1457), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3840194), .RN(n1437), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1441), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3840194), .RN(n1417), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1461), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3840194), .RN(n1457), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n249), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3840194), .RN(n1437), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1441), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3840194), .RN(n1416), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1421), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3840194), .RN(n1461), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3840194), .RN(n1416), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1421), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3840194), .RN(n1460), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3840194), .RN(n1422), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1423), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3840194), .RN(n1416), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1421), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3840194), .RN(n1425), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1415), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3840194), .RN(n1415), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1415), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3840194), .RN(n1439), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1434), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3840194), .RN(n1415), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1425), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3840194), .RN(n1425), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1425), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3840194), .RN(n1415), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1439), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3840194), .RN(n1419), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1419), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3840194), .RN(n1445), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1414), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3840194), .RN(n1440), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1444), .Q(d_ff2_Z[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Zn_net3840194), .RN(n1444), .Q(d_ff_Zn[32]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_32_ ( .D(first_mux_Z[32]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1444), .Q(d_ff2_Z[32]) );
  DFFRXLTS d_ff4_Zn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Zn_net3840194), .RN(n1414), .Q(d_ff_Zn[33]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_33_ ( .D(first_mux_Z[33]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1445), .Q(d_ff2_Z[33]) );
  DFFRXLTS d_ff4_Zn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Zn_net3840194), .RN(n1448), .Q(d_ff_Zn[34]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_34_ ( .D(first_mux_Z[34]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1445), .Q(d_ff2_Z[34]) );
  DFFRXLTS d_ff4_Zn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Zn_net3840194), .RN(n1413), .Q(d_ff_Zn[35]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_35_ ( .D(first_mux_Z[35]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1427), .Q(d_ff2_Z[35]) );
  DFFRXLTS d_ff4_Zn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Zn_net3840194), .RN(n1413), .Q(d_ff_Zn[36]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_36_ ( .D(first_mux_Z[36]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1427), .Q(d_ff2_Z[36]) );
  DFFRXLTS d_ff4_Zn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Zn_net3840194), .RN(n1413), .Q(d_ff_Zn[37]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_37_ ( .D(first_mux_Z[37]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1427), .Q(d_ff2_Z[37]) );
  DFFRXLTS d_ff4_Zn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Zn_net3840194), .RN(n1413), .Q(d_ff_Zn[38]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_38_ ( .D(first_mux_Z[38]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1427), .Q(d_ff2_Z[38]) );
  DFFRXLTS d_ff4_Zn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Zn_net3840194), .RN(n1413), .Q(d_ff_Zn[39]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_39_ ( .D(first_mux_Z[39]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1427), .Q(d_ff2_Z[39]) );
  DFFRXLTS d_ff4_Zn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Zn_net3840194), .RN(n1413), .Q(d_ff_Zn[40]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_40_ ( .D(first_mux_Z[40]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1427), .Q(d_ff2_Z[40]) );
  DFFRXLTS d_ff4_Zn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Zn_net3840194), .RN(n1412), .Q(d_ff_Zn[41]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_41_ ( .D(first_mux_Z[41]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1412), .Q(d_ff2_Z[41]) );
  DFFRXLTS d_ff4_Zn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Zn_net3840194), .RN(n1412), .Q(d_ff_Zn[42]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_42_ ( .D(first_mux_Z[42]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1412), .Q(d_ff2_Z[42]) );
  DFFRXLTS d_ff4_Zn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Zn_net3840194), .RN(n1412), .Q(d_ff_Zn[43]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_43_ ( .D(first_mux_Z[43]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1412), .Q(d_ff2_Z[43]) );
  DFFRXLTS d_ff4_Zn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Zn_net3840194), .RN(n1412), .Q(d_ff_Zn[44]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_44_ ( .D(first_mux_Z[44]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1412), .Q(d_ff2_Z[44]) );
  DFFRXLTS d_ff4_Zn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Zn_net3840194), .RN(n1412), .Q(d_ff_Zn[45]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_45_ ( .D(first_mux_Z[45]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1412), .Q(d_ff2_Z[45]) );
  DFFRXLTS d_ff4_Zn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Zn_net3840194), .RN(n1412), .Q(d_ff_Zn[46]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_46_ ( .D(first_mux_Z[46]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1412), .Q(d_ff2_Z[46]) );
  DFFRXLTS d_ff4_Zn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Zn_net3840194), .RN(n1423), .Q(d_ff_Zn[47]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_47_ ( .D(first_mux_Z[47]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1423), .Q(d_ff2_Z[47]) );
  DFFRXLTS d_ff4_Zn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Zn_net3840194), .RN(n1413), .Q(d_ff_Zn[48]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_48_ ( .D(first_mux_Z[48]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1427), .Q(d_ff2_Z[48]) );
  DFFRXLTS d_ff4_Zn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Zn_net3840194), .RN(n1458), .Q(d_ff_Zn[49]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_49_ ( .D(first_mux_Z[49]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1433), .Q(d_ff2_Z[49]) );
  DFFRXLTS d_ff4_Zn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Zn_net3840194), .RN(n1431), .Q(d_ff_Zn[50]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_50_ ( .D(first_mux_Z[50]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1430), .Q(d_ff2_Z[50]) );
  DFFRXLTS d_ff4_Zn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Zn_net3840194), .RN(n1411), .Q(d_ff_Zn[51]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_51_ ( .D(first_mux_Z[51]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1428), .Q(d_ff2_Z[51]) );
  DFFRXLTS d_ff4_Zn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Zn_net3840194), .RN(n1412), .Q(d_ff_Zn[52]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_52_ ( .D(first_mux_Z[52]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1411), .Q(d_ff2_Z[52]) );
  DFFRXLTS d_ff4_Zn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Zn_net3840194), .RN(n1411), .Q(d_ff_Zn[53]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_53_ ( .D(first_mux_Z[53]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1411), .Q(d_ff2_Z[53]) );
  DFFRXLTS d_ff4_Zn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Zn_net3840194), .RN(n1411), .Q(d_ff_Zn[54]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_54_ ( .D(first_mux_Z[54]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1411), .Q(d_ff2_Z[54]) );
  DFFRXLTS d_ff4_Zn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Zn_net3840194), .RN(n1411), .Q(d_ff_Zn[55]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_55_ ( .D(first_mux_Z[55]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1411), .Q(d_ff2_Z[55]) );
  DFFRXLTS d_ff4_Zn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Zn_net3840194), .RN(n1411), .Q(d_ff_Zn[56]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_56_ ( .D(first_mux_Z[56]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1411), .Q(d_ff2_Z[56]) );
  DFFRXLTS d_ff4_Zn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Zn_net3840194), .RN(n1411), .Q(d_ff_Zn[57]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_57_ ( .D(first_mux_Z[57]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1411), .Q(d_ff2_Z[57]) );
  DFFRXLTS d_ff4_Zn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Zn_net3840194), .RN(n1411), .Q(d_ff_Zn[58]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_58_ ( .D(first_mux_Z[58]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1411), .Q(d_ff2_Z[58]) );
  DFFRXLTS d_ff4_Zn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Zn_net3840194), .RN(n1410), .Q(d_ff_Zn[59]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_59_ ( .D(first_mux_Z[59]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1410), .Q(d_ff2_Z[59]) );
  DFFRXLTS d_ff4_Zn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Zn_net3840194), .RN(n1410), .Q(d_ff_Zn[60]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_60_ ( .D(first_mux_Z[60]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1410), .Q(d_ff2_Z[60]) );
  DFFRXLTS d_ff4_Zn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Zn_net3840194), .RN(n1410), .Q(d_ff_Zn[61]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_61_ ( .D(first_mux_Z[61]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1410), .Q(d_ff2_Z[61]) );
  DFFRXLTS d_ff4_Zn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Zn_net3840194), .RN(n1410), .Q(d_ff_Zn[62]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_62_ ( .D(first_mux_Z[62]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1410), .Q(d_ff2_Z[62]) );
  DFFRXLTS d_ff4_Zn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Zn_net3840194), .RN(n1410), .Q(d_ff_Zn[63]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_63_ ( .D(first_mux_Z[63]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1410), .Q(d_ff2_Z[63]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[63]), .CK(reg_shift_y_net3840194), 
        .RN(n1410), .Q(d_ff3_sign_out) );
  CMPR32X2TS intadd_464_U2 ( .A(d_ff2_Y[55]), .B(n1402), .C(intadd_464_n2), 
        .CO(intadd_464_n1), .S(sh_exp_y[3]) );
  DFFRXLTS reg_LUT_Q_reg_48_ ( .D(1'b1), .CK(reg_shift_y_net3840194), .RN(
        n1427), .Q(d_ff3_LUT_out[48]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(clk), .RN(n1454), .Q(
        inst_CORDIC_FSM_v3_state_reg[7]), .QN(n1403) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(clk), .RN(n1455), .Q(
        inst_CORDIC_FSM_v3_state_reg[1]), .QN(n1401) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(clk), .RN(n1438), .Q(
        inst_CORDIC_FSM_v3_state_reg[6]), .QN(n1400) );
  DFFRX1TS VAR_CONT_temp_reg_0_ ( .D(n960), .CK(clk), .RN(n1454), .Q(
        cont_var_out[0]), .QN(n1399) );
  DFFRX2TS ITER_CONT_temp_reg_0_ ( .D(n1409), .CK(ITER_CONT_net3840230), .RN(
        n1451), .Q(n1140), .QN(n1409) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_59_ ( .D(first_mux_Y[59]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1460), .Q(d_ff2_Y[59]), .QN(
        n1404) );
  DFFRX4TS ITER_CONT_temp_reg_2_ ( .D(ITER_CONT_N4), .CK(ITER_CONT_net3840230), 
        .RN(n1450), .Q(cont_iter_out[2]), .QN(n1398) );
  DFFRX2TS VAR_CONT_temp_reg_1_ ( .D(n961), .CK(clk), .RN(n1455), .Q(
        cont_var_out[1]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(clk), .RN(n1450), .Q(
        inst_CORDIC_FSM_v3_state_reg[5]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(clk), .RN(n1422), .Q(
        inst_CORDIC_FSM_v3_state_reg[4]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_56_ ( .D(first_mux_X[56]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1424), .Q(d_ff2_X[56]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_56_ ( .D(first_mux_Y[56]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Y[56]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(
        inst_CORDIC_FSM_v3_state_next[3]), .CK(clk), .RN(n1452), .Q(
        inst_CORDIC_FSM_v3_state_reg[3]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_61_ ( .D(first_mux_X[61]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1432), .Q(d_ff2_X[61]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_61_ ( .D(first_mux_Y[61]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1440), .Q(d_ff2_Y[61]) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3840194), .RN(n1438), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_60_ ( .D(first_mux_X[60]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1432), .Q(d_ff2_X[60]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_58_ ( .D(first_mux_X[58]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1446), .Q(d_ff2_X[58]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_60_ ( .D(first_mux_Y[60]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1448), .Q(d_ff2_Y[60]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_58_ ( .D(first_mux_Y[58]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1460), .Q(d_ff2_Y[58]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_55_ ( .D(first_mux_X[55]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1418), .Q(d_ff2_X[55]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_54_ ( .D(first_mux_X[54]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1449), .Q(d_ff2_X[54]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_53_ ( .D(first_mux_X[53]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1447), .Q(d_ff2_X[53]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_55_ ( .D(first_mux_Y[55]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1421), .Q(d_ff2_Y[55]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_54_ ( .D(first_mux_Y[54]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1416), .Q(d_ff2_Y[54]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_53_ ( .D(first_mux_Y[53]), .CK(
        reg_val_muxZ_2stage_net3840194), .RN(n1420), .Q(d_ff2_Y[53]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(
        inst_CORDIC_FSM_v3_state_next[2]), .CK(clk), .RN(n1451), .Q(
        inst_CORDIC_FSM_v3_state_reg[2]) );
  DFFRX4TS ITER_CONT_temp_reg_3_ ( .D(n1408), .CK(ITER_CONT_net3840230), .RN(
        n1452), .Q(cont_iter_out[3]), .QN(n1402) );
  DFFSX1TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(clk), .SN(n1450), .Q(
        inst_CORDIC_FSM_v3_state_reg[0]), .QN(n1405) );
  DFFRX4TS ITER_CONT_temp_reg_1_ ( .D(ITER_CONT_N3), .CK(ITER_CONT_net3840230), 
        .RN(n1451), .Q(cont_iter_out[1]), .QN(n1134) );
  CMPR32X2TS intadd_464_U4 ( .A(d_ff2_Y[53]), .B(n1134), .C(intadd_464_CI), 
        .CO(intadd_464_n3), .S(sh_exp_y[1]) );
  CMPR32X2TS intadd_463_U4 ( .A(d_ff2_X[53]), .B(n1134), .C(intadd_463_CI), 
        .CO(intadd_463_n3), .S(sh_exp_x[1]) );
  CMPR32X2TS intadd_464_U3 ( .A(d_ff2_Y[54]), .B(n1398), .C(intadd_464_n3), 
        .CO(intadd_464_n2), .S(sh_exp_y[2]) );
  CMPR32X2TS intadd_463_U3 ( .A(d_ff2_X[54]), .B(n1398), .C(intadd_463_n3), 
        .CO(intadd_463_n2), .S(sh_exp_x[2]) );
  CMPR32X2TS intadd_463_U2 ( .A(n1402), .B(d_ff2_X[55]), .C(intadd_463_n2), 
        .CO(intadd_463_n1), .S(sh_exp_x[3]) );
  NAND2X4TS U726 ( .A(n1144), .B(n1367), .Y(n997) );
  BUFX4TS U727 ( .A(n1313), .Y(n1135) );
  NAND3X1TS U728 ( .A(n1326), .B(n1324), .C(n1292), .Y(n1384) );
  OAI21XLTS U729 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(n1139), .B0(n1296), 
        .Y(n1294) );
  INVX4TS U730 ( .A(n1323), .Y(n1244) );
  NAND2X2TS U731 ( .A(cont_iter_out[2]), .B(n1402), .Y(n1145) );
  NOR2X4TS U732 ( .A(cont_iter_out[3]), .B(cont_iter_out[2]), .Y(n1144) );
  OR2X4TS U733 ( .A(n1399), .B(cont_var_out[1]), .Y(n1170) );
  CLKINVX6TS U734 ( .A(rst), .Y(n249) );
  BUFX4TS U735 ( .A(n1244), .Y(n1285) );
  CLKBUFX3TS U736 ( .A(n1135), .Y(n1310) );
  AOI222X1TS U737 ( .A0(n1361), .A1(d_ff2_X[3]), .B0(n1360), .B1(d_ff2_Y[3]), 
        .C0(n1244), .C1(d_ff2_Z[3]), .Y(n1172) );
  AOI222X1TS U738 ( .A0(n1361), .A1(d_ff2_X[5]), .B0(n1253), .B1(d_ff2_Y[5]), 
        .C0(n1238), .C1(d_ff2_Z[5]), .Y(n1173) );
  AOI222X1TS U739 ( .A0(n1361), .A1(d_ff2_X[8]), .B0(n1360), .B1(d_ff2_Y[8]), 
        .C0(n1256), .C1(d_ff2_Z[8]), .Y(n1171) );
  AOI222X1TS U740 ( .A0(n1342), .A1(d_ff2_X[54]), .B0(n1360), .B1(d_ff2_Y[54]), 
        .C0(n1238), .C1(d_ff2_Z[54]), .Y(n1188) );
  AOI222X1TS U741 ( .A0(n1329), .A1(d_ff2_X[58]), .B0(n1242), .B1(d_ff2_Y[58]), 
        .C0(n1256), .C1(d_ff2_Z[58]), .Y(n1187) );
  NAND2BXLTS U742 ( .AN(n1380), .B(n1379), .Y(n972) );
  NAND2BXLTS U743 ( .AN(n1377), .B(n1144), .Y(n999) );
  NOR2X2TS U744 ( .A(n1292), .B(n1288), .Y(enab_d_ff4_Zn) );
  BUFX4TS U745 ( .A(n1460), .Y(n1424) );
  BUFX4TS U746 ( .A(n1460), .Y(n1418) );
  BUFX4TS U747 ( .A(n1460), .Y(n1447) );
  BUFX4TS U748 ( .A(n1460), .Y(n1459) );
  BUFX4TS U749 ( .A(n1422), .Y(n1411) );
  BUFX4TS U750 ( .A(n1434), .Y(n1426) );
  BUFX4TS U751 ( .A(n1414), .Y(n1427) );
  BUFX4TS U752 ( .A(n1445), .Y(n1413) );
  BUFX4TS U753 ( .A(n1451), .Y(n1412) );
  BUFX4TS U754 ( .A(n1438), .Y(n1428) );
  BUFX4TS U755 ( .A(n1436), .Y(n1415) );
  BUFX4TS U756 ( .A(n1436), .Y(n1425) );
  BUFX4TS U757 ( .A(n1436), .Y(n1443) );
  BUFX4TS U758 ( .A(n1436), .Y(n1453) );
  BUFX4TS U759 ( .A(n1452), .Y(n1429) );
  BUFX4TS U760 ( .A(n1456), .Y(n1419) );
  BUFX4TS U761 ( .A(n1456), .Y(n1444) );
  BUFX4TS U762 ( .A(n1456), .Y(n1440) );
  BUFX4TS U763 ( .A(n1456), .Y(n1448) );
  BUFX4TS U764 ( .A(n249), .Y(n1456) );
  BUFX4TS U765 ( .A(n249), .Y(n1460) );
  NOR2X2TS U766 ( .A(n1378), .B(n1367), .Y(ITER_CONT_N3) );
  BUFX4TS U767 ( .A(n1459), .Y(n1433) );
  BUFX4TS U768 ( .A(n1442), .Y(n1430) );
  BUFX4TS U769 ( .A(n1435), .Y(n1431) );
  BUFX4TS U770 ( .A(n1459), .Y(n1458) );
  BUFX4TS U771 ( .A(n249), .Y(n1454) );
  BUFX4TS U772 ( .A(n1457), .Y(n1455) );
  BUFX4TS U773 ( .A(n1417), .Y(n1450) );
  NOR2X2TS U774 ( .A(cont_iter_out[3]), .B(n1134), .Y(n1371) );
  NOR2X4TS U775 ( .A(cont_iter_out[1]), .B(n1409), .Y(n1377) );
  NOR2X4TS U776 ( .A(n1140), .B(n1134), .Y(n1370) );
  NOR2X4TS U777 ( .A(n1161), .B(n1144), .Y(n1293) );
  NOR2X4TS U778 ( .A(n1402), .B(n1398), .Y(n1161) );
  AOI211X2TS U779 ( .A0(n1376), .A1(n1409), .B0(n1291), .C0(cont_iter_out[1]), 
        .Y(n1380) );
  NOR3X2TS U780 ( .A(inst_CORDIC_FSM_v3_state_reg[6]), .B(n1403), .C(n1160), 
        .Y(ready_cordic) );
  NAND2X2TS U781 ( .A(n1402), .B(n1409), .Y(n1372) );
  NAND2X2TS U782 ( .A(n1409), .B(n1134), .Y(n1366) );
  INVX4TS U783 ( .A(n1301), .Y(n1138) );
  CLKINVX6TS U784 ( .A(n1301), .Y(n1308) );
  CLKINVX6TS U785 ( .A(n1301), .Y(n1320) );
  INVX4TS U786 ( .A(n1301), .Y(n1317) );
  BUFX4TS U787 ( .A(n997), .Y(n1301) );
  BUFX3TS U788 ( .A(n1434), .Y(n1461) );
  INVX2TS U789 ( .A(n1137), .Y(n1139) );
  CLKINVX6TS U790 ( .A(n1135), .Y(n1312) );
  BUFX4TS U791 ( .A(n1417), .Y(n1421) );
  BUFX4TS U792 ( .A(n1441), .Y(n1416) );
  BUFX4TS U793 ( .A(n1437), .Y(n1420) );
  BUFX3TS U794 ( .A(n1459), .Y(n1457) );
  BUFX6TS U795 ( .A(n1336), .Y(n1360) );
  BUFX4TS U796 ( .A(n1336), .Y(n1229) );
  BUFX4TS U797 ( .A(n1336), .Y(n1286) );
  BUFX4TS U798 ( .A(n997), .Y(n1304) );
  AOI222X1TS U799 ( .A0(n1361), .A1(d_ff2_X[7]), .B0(n1336), .B1(d_ff2_Y[7]), 
        .C0(n1238), .C1(d_ff2_Z[7]), .Y(n1174) );
  AOI222X1TS U800 ( .A0(n1361), .A1(d_ff3_sh_y_out[17]), .B0(n1240), .B1(
        d_ff3_sh_x_out[17]), .C0(n1261), .C1(d_ff3_LUT_out[17]), .Y(n1175) );
  AOI222X1TS U801 ( .A0(n1361), .A1(d_ff3_sh_y_out[11]), .B0(n1240), .B1(
        d_ff3_sh_x_out[11]), .C0(n1261), .C1(d_ff3_LUT_out[11]), .Y(n1176) );
  CLKINVX6TS U802 ( .A(n1170), .Y(n1361) );
  CLKINVX3TS U803 ( .A(n997), .Y(n1302) );
  CLKINVX6TS U804 ( .A(n997), .Y(n1303) );
  CLKINVX3TS U805 ( .A(n997), .Y(n1300) );
  CLKINVX6TS U806 ( .A(n1170), .Y(n1342) );
  CLKINVX6TS U807 ( .A(n1170), .Y(n1329) );
  CLKINVX6TS U808 ( .A(n1170), .Y(n1340) );
  CLKINVX6TS U809 ( .A(n1170), .Y(n1348) );
  NOR3X1TS U810 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[1]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .Y(n1150) );
  AOI222X1TS U811 ( .A0(n1340), .A1(d_ff2_X[53]), .B0(n1360), .B1(d_ff2_Y[53]), 
        .C0(n1350), .C1(d_ff2_Z[53]), .Y(n1189) );
  AOI222X1TS U812 ( .A0(n1348), .A1(d_ff2_X[55]), .B0(n1242), .B1(d_ff2_Y[55]), 
        .C0(n1244), .C1(d_ff2_Z[55]), .Y(n1203) );
  NAND2X2TS U813 ( .A(n1161), .B(n1378), .Y(n985) );
  NOR2X2TS U814 ( .A(d_ff2_Y[58]), .B(n1388), .Y(n1387) );
  NOR2X2TS U815 ( .A(d_ff2_Y[60]), .B(n1386), .Y(n1390) );
  NOR2X2TS U816 ( .A(d_ff2_X[58]), .B(n1394), .Y(n1393) );
  AOI222X1TS U817 ( .A0(n1348), .A1(d_ff2_X[60]), .B0(n1242), .B1(d_ff2_Y[60]), 
        .C0(n1211), .C1(d_ff2_Z[60]), .Y(n1184) );
  NOR2X2TS U818 ( .A(d_ff2_X[60]), .B(n1392), .Y(n1396) );
  OAI32X4TS U819 ( .A0(n1143), .A1(d_ff1_shift_region_flag_out[1]), .A2(n1139), 
        .B0(d_ff1_shift_region_flag_out[0]), .B1(n1296), .Y(n1297) );
  AOI222X1TS U820 ( .A0(n1340), .A1(d_ff2_X[61]), .B0(n1242), .B1(d_ff2_Y[61]), 
        .C0(n1211), .C1(d_ff2_Z[61]), .Y(n1180) );
  AOI21X2TS U821 ( .A0(n1398), .A1(n1409), .B0(cont_iter_out[3]), .Y(n1381) );
  AOI222X1TS U822 ( .A0(n1340), .A1(d_ff2_X[56]), .B0(n1242), .B1(d_ff2_Y[56]), 
        .C0(n1238), .C1(d_ff2_Z[56]), .Y(n1186) );
  NAND4X2TS U823 ( .A(n1148), .B(inst_CORDIC_FSM_v3_state_reg[4]), .C(n1403), 
        .D(n1400), .Y(n1324) );
  NOR4X2TS U824 ( .A(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[3]), .C(inst_CORDIC_FSM_v3_state_reg[7]), 
        .D(inst_CORDIC_FSM_v3_state_reg[6]), .Y(n1149) );
  INVX4TS U825 ( .A(n1310), .Y(n1309) );
  OAI21XLTS U826 ( .A0(beg_fsm_cordic), .A1(n1321), .B0(n1167), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  OR2X1TS U827 ( .A(d_ff_Xn[60]), .B(n1165), .Y(first_mux_X[60]) );
  OR2X1TS U828 ( .A(d_ff_Xn[53]), .B(n1165), .Y(first_mux_X[53]) );
  OR2X1TS U829 ( .A(d_ff_Xn[46]), .B(n1165), .Y(first_mux_X[46]) );
  OR2X1TS U830 ( .A(d_ff_Xn[39]), .B(n1165), .Y(first_mux_X[39]) );
  OR2X1TS U831 ( .A(d_ff_Xn[26]), .B(n1317), .Y(first_mux_X[26]) );
  OR2X1TS U832 ( .A(d_ff_Xn[19]), .B(n1303), .Y(first_mux_X[19]) );
  OR2X1TS U833 ( .A(d_ff_Xn[7]), .B(n1300), .Y(first_mux_X[7]) );
  OR2X1TS U834 ( .A(d_ff_Xn[3]), .B(n1320), .Y(first_mux_X[3]) );
  OAI211XLTS U835 ( .A0(n1145), .A1(n1375), .B0(n1159), .C0(n1364), .Y(n964)
         );
  OAI211XLTS U836 ( .A0(n1164), .A1(n1134), .B0(n1163), .C0(n1364), .Y(n968)
         );
  OAI21XLTS U837 ( .A0(n1170), .A1(n1169), .B0(n1168), .Y(add_subt_dataA[59])
         );
  INVX2TS U838 ( .A(n1366), .Y(n1367) );
  NAND2X2TS U839 ( .A(n1140), .B(cont_iter_out[1]), .Y(n1375) );
  INVX2TS U840 ( .A(n1375), .Y(n1378) );
  AOI21X1TS U841 ( .A0(n1398), .A1(n1134), .B0(cont_iter_out[3]), .Y(n1158) );
  OAI211XLTS U842 ( .A0(n1144), .A1(n1375), .B0(n1158), .C0(n1366), .Y(n980)
         );
  OR4X2TS U843 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[1]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .D(inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1153) );
  NOR2X1TS U844 ( .A(inst_CORDIC_FSM_v3_state_reg[3]), .B(n1153), .Y(n1148) );
  NAND2BX1TS U845 ( .AN(inst_CORDIC_FSM_v3_state_reg[4]), .B(n1148), .Y(n1160)
         );
  BUFX3TS U846 ( .A(n1436), .Y(n1434) );
  BUFX3TS U847 ( .A(n1460), .Y(n1435) );
  BUFX3TS U848 ( .A(n249), .Y(n1436) );
  BUFX3TS U849 ( .A(n1439), .Y(n1437) );
  BUFX3TS U850 ( .A(n1457), .Y(n1438) );
  BUFX3TS U851 ( .A(n1435), .Y(n1449) );
  BUFX3TS U852 ( .A(n249), .Y(n1451) );
  BUFX3TS U853 ( .A(n1437), .Y(n1452) );
  BUFX3TS U854 ( .A(n1436), .Y(n1439) );
  BUFX3TS U855 ( .A(n1445), .Y(n1441) );
  BUFX3TS U856 ( .A(n1460), .Y(n1442) );
  BUFX3TS U857 ( .A(n1456), .Y(n1445) );
  BUFX3TS U858 ( .A(n1442), .Y(n1446) );
  BUFX3TS U859 ( .A(n1414), .Y(n1417) );
  BUFX3TS U860 ( .A(n1456), .Y(n1414) );
  BUFX3TS U861 ( .A(n1439), .Y(n1410) );
  BUFX3TS U862 ( .A(n249), .Y(n1432) );
  BUFX3TS U863 ( .A(n1441), .Y(n1423) );
  BUFX3TS U864 ( .A(n1417), .Y(n1422) );
  OAI21XLTS U865 ( .A0(n1398), .A1(n1134), .B0(n1402), .Y(n1000) );
  INVX2TS U866 ( .A(n1372), .Y(n1368) );
  OAI21XLTS U867 ( .A0(cont_iter_out[2]), .A1(n1134), .B0(n1368), .Y(n990) );
  NAND2X2TS U868 ( .A(n1398), .B(cont_iter_out[3]), .Y(n1365) );
  INVX2TS U869 ( .A(n1365), .Y(n1376) );
  INVX2TS U870 ( .A(n1293), .Y(n1369) );
  NAND2X1TS U871 ( .A(n1377), .B(n1369), .Y(n1163) );
  NAND3XLTS U872 ( .A(cont_iter_out[1]), .B(n1372), .C(n1145), .Y(n1379) );
  OAI211XLTS U873 ( .A0(n1376), .A1(n1366), .B0(n1163), .C0(n1379), .Y(n967)
         );
  NOR3BX1TS U874 ( .AN(n1149), .B(inst_CORDIC_FSM_v3_state_reg[2]), .C(
        inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1146) );
  NAND3XLTS U875 ( .A(inst_CORDIC_FSM_v3_state_reg[1]), .B(n1146), .C(n1405), 
        .Y(n1322) );
  NAND3X1TS U876 ( .A(inst_CORDIC_FSM_v3_state_reg[0]), .B(n1146), .C(n1401), 
        .Y(n1321) );
  NAND2X1TS U877 ( .A(n1322), .B(n1321), .Y(enab_d_ff_RB1) );
  NOR2BX1TS U878 ( .AN(n1149), .B(inst_CORDIC_FSM_v3_state_reg[5]), .Y(n1147)
         );
  AND4X1TS U879 ( .A(inst_CORDIC_FSM_v3_state_reg[2]), .B(n1147), .C(n1405), 
        .D(n1401), .Y(inst_CORDIC_FSM_v3_state_next[3]) );
  NAND3X1TS U880 ( .A(inst_CORDIC_FSM_v3_state_reg[5]), .B(n1150), .C(n1149), 
        .Y(n1325) );
  NAND2X1TS U881 ( .A(n1324), .B(n1325), .Y(beg_add_subt) );
  NAND2X1TS U882 ( .A(n1141), .B(n1140), .Y(intadd_464_CI) );
  OAI21XLTS U883 ( .A0(n1140), .A1(n1141), .B0(intadd_464_CI), .Y(sh_exp_y[0])
         );
  NAND2X1TS U884 ( .A(n1142), .B(n1140), .Y(intadd_463_CI) );
  OAI21XLTS U885 ( .A0(n1140), .A1(n1142), .B0(intadd_463_CI), .Y(sh_exp_x[0])
         );
  OR2X1TS U886 ( .A(n1371), .B(n1381), .Y(n970) );
  INVX2TS U887 ( .A(n1381), .Y(n1164) );
  OAI21XLTS U888 ( .A0(n1161), .A1(cont_iter_out[1]), .B0(n1164), .Y(n969) );
  OAI2BB1X1TS U889 ( .A0N(n1140), .A1N(n1144), .B0(cont_iter_out[1]), .Y(n1382) );
  OAI21X1TS U890 ( .A0(cont_iter_out[1]), .A1(n1368), .B0(n1382), .Y(n976) );
  OR2X1TS U891 ( .A(n976), .B(cont_iter_out[2]), .Y(n978) );
  AOI22X1TS U892 ( .A0(cont_iter_out[2]), .A1(n1377), .B0(n1370), .B1(n1365), 
        .Y(n1151) );
  OAI21XLTS U893 ( .A0(n1293), .A1(n1375), .B0(n1151), .Y(n966) );
  OR3X1TS U894 ( .A(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[7]), .C(inst_CORDIC_FSM_v3_state_reg[6]), 
        .Y(n1152) );
  NOR3BX2TS U895 ( .AN(inst_CORDIC_FSM_v3_state_reg[3]), .B(n1153), .C(n1152), 
        .Y(enab_RB3) );
  NAND2X1TS U896 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .Y(n1323) );
  BUFX3TS U897 ( .A(n1244), .Y(n1350) );
  INVX2TS U898 ( .A(enab_RB3), .Y(n1154) );
  OAI21XLTS U899 ( .A0(n1238), .A1(n1324), .B0(n1154), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  NOR2X1TS U900 ( .A(d_ff2_Y[56]), .B(intadd_464_n1), .Y(n1389) );
  OR3X1TS U901 ( .A(d_ff2_Y[57]), .B(d_ff2_Y[56]), .C(intadd_464_n1), .Y(n1388) );
  OAI21XLTS U902 ( .A0(n1389), .A1(n1407), .B0(n1388), .Y(sh_exp_y[5]) );
  NOR2X1TS U903 ( .A(d_ff2_X[56]), .B(intadd_463_n1), .Y(n1395) );
  OR3X1TS U904 ( .A(d_ff2_X[57]), .B(d_ff2_X[56]), .C(intadd_463_n1), .Y(n1394) );
  OAI21XLTS U905 ( .A0(n1395), .A1(n1406), .B0(n1394), .Y(sh_exp_x[5]) );
  NOR2X1TS U906 ( .A(cont_iter_out[3]), .B(n1409), .Y(n1291) );
  AOI21X1TS U907 ( .A0(n1293), .A1(n1370), .B0(n1291), .Y(n1155) );
  OAI21XLTS U908 ( .A0(cont_iter_out[1]), .A1(n1365), .B0(n1155), .Y(n963) );
  NAND2X1TS U909 ( .A(n1402), .B(n1375), .Y(n1156) );
  OAI21X1TS U910 ( .A0(n1293), .A1(n1375), .B0(n1156), .Y(n983) );
  INVX2TS U911 ( .A(n983), .Y(n1408) );
  AOI22X1TS U912 ( .A0(n1377), .A1(n1398), .B0(n1378), .B1(n1402), .Y(n1157)
         );
  OAI31X1TS U913 ( .A0(n1161), .A1(n1140), .A2(n1371), .B0(n1157), .Y(n965) );
  INVX2TS U914 ( .A(n1158), .Y(n1003) );
  AOI22X1TS U915 ( .A0(n1144), .A1(n1370), .B0(n1377), .B1(n1398), .Y(n1159)
         );
  NAND2X1TS U916 ( .A(n1293), .B(n1367), .Y(n1364) );
  OAI22X1TS U917 ( .A0(n1398), .A1(n1375), .B0(n1378), .B1(cont_iter_out[2]), 
        .Y(data_out_LUT[54]) );
  INVX2TS U918 ( .A(data_out_LUT[54]), .Y(ITER_CONT_N4) );
  NOR3X2TS U919 ( .A(inst_CORDIC_FSM_v3_state_reg[7]), .B(n1160), .C(n1400), 
        .Y(enab_cont_iter) );
  INVX2TS U920 ( .A(enab_cont_iter), .Y(n1326) );
  INVX2TS U921 ( .A(ready_cordic), .Y(n1327) );
  OAI21XLTS U922 ( .A0(n1326), .A1(n985), .B0(n1327), .Y(enab_d_ff5_data_out)
         );
  NAND2BXLTS U923 ( .AN(n1161), .B(n1370), .Y(n1290) );
  OAI211XLTS U924 ( .A0(ITER_CONT_N3), .A1(n1369), .B0(n1290), .C0(n1365), .Y(
        n989) );
  AOI22X1TS U925 ( .A0(cont_iter_out[2]), .A1(n1370), .B0(n1378), .B1(n1369), 
        .Y(n1162) );
  OAI21XLTS U926 ( .A0(cont_iter_out[1]), .A1(n1145), .B0(n1162), .Y(n984) );
  NAND2X1TS U927 ( .A(n1404), .B(n1387), .Y(n1386) );
  OAI21XLTS U928 ( .A0(n1387), .A1(n1404), .B0(n1386), .Y(sh_exp_y[7]) );
  INVX2TS U929 ( .A(d_ff2_X[59]), .Y(n1169) );
  NAND2X1TS U930 ( .A(n1169), .B(n1393), .Y(n1392) );
  OAI21XLTS U931 ( .A0(n1393), .A1(n1169), .B0(n1392), .Y(sh_exp_x[7]) );
  INVX2TS U932 ( .A(ITER_CONT_N3), .Y(n988) );
  INVX4TS U933 ( .A(n1301), .Y(n1319) );
  OR2X1TS U934 ( .A(d_ff_Xn[29]), .B(n1318), .Y(first_mux_X[29]) );
  OR2X1TS U935 ( .A(d_ff_Xn[35]), .B(n1306), .Y(first_mux_X[35]) );
  OR2X1TS U936 ( .A(d_ff_Xn[6]), .B(n1138), .Y(first_mux_X[6]) );
  OR2X1TS U937 ( .A(d_ff_Xn[9]), .B(n1319), .Y(first_mux_X[9]) );
  OR2X1TS U938 ( .A(d_ff_Xn[36]), .B(n1308), .Y(first_mux_X[36]) );
  OR2X1TS U939 ( .A(d_ff_Xn[24]), .B(n1299), .Y(first_mux_X[24]) );
  OR2X1TS U940 ( .A(d_ff_Xn[14]), .B(n1317), .Y(first_mux_X[14]) );
  OR2X1TS U941 ( .A(d_ff_Xn[34]), .B(n1320), .Y(first_mux_X[34]) );
  OR2X1TS U942 ( .A(d_ff_Xn[41]), .B(n1318), .Y(first_mux_X[41]) );
  OR2X1TS U943 ( .A(d_ff_Xn[28]), .B(n1306), .Y(first_mux_X[28]) );
  OR2X1TS U944 ( .A(d_ff_Xn[32]), .B(n1138), .Y(first_mux_X[32]) );
  OR2X1TS U945 ( .A(d_ff_Xn[55]), .B(n1165), .Y(first_mux_X[55]) );
  OR2X1TS U946 ( .A(d_ff_Xn[56]), .B(n1299), .Y(first_mux_X[56]) );
  OR2X1TS U947 ( .A(d_ff_Xn[48]), .B(n1308), .Y(first_mux_X[48]) );
  OR2X1TS U948 ( .A(d_ff_Xn[57]), .B(n1165), .Y(first_mux_X[57]) );
  OR2X1TS U949 ( .A(d_ff_Xn[49]), .B(n1319), .Y(first_mux_X[49]) );
  OR2X1TS U950 ( .A(d_ff_Xn[45]), .B(n1319), .Y(first_mux_X[45]) );
  OR2X1TS U951 ( .A(d_ff_Xn[42]), .B(n1317), .Y(first_mux_X[42]) );
  OR2X1TS U952 ( .A(d_ff_Xn[54]), .B(n1308), .Y(first_mux_X[54]) );
  OR2X1TS U953 ( .A(d_ff_Xn[58]), .B(n1306), .Y(first_mux_X[58]) );
  OR2X1TS U954 ( .A(d_ff_Xn[43]), .B(n1138), .Y(first_mux_X[43]) );
  OR2X1TS U955 ( .A(d_ff_Xn[8]), .B(n1303), .Y(first_mux_X[8]) );
  OR2X1TS U956 ( .A(d_ff_Xn[0]), .B(n1303), .Y(first_mux_X[0]) );
  OR2X1TS U957 ( .A(d_ff_Xn[11]), .B(n1300), .Y(first_mux_X[11]) );
  OR2X1TS U958 ( .A(d_ff_Xn[13]), .B(n1303), .Y(first_mux_X[13]) );
  INVX2TS U959 ( .A(n1304), .Y(n1165) );
  OR2X1TS U960 ( .A(d_ff_Xn[61]), .B(n1165), .Y(first_mux_X[61]) );
  OR2X1TS U961 ( .A(d_ff_Xn[59]), .B(n1165), .Y(first_mux_X[59]) );
  OR2X1TS U962 ( .A(d_ff_Xn[31]), .B(n1165), .Y(first_mux_X[31]) );
  NOR4X1TS U963 ( .A(enab_RB3), .B(inst_CORDIC_FSM_v3_state_next[3]), .C(
        enab_d_ff_RB1), .D(beg_add_subt), .Y(n1166) );
  AOI32X1TS U964 ( .A0(n1166), .A1(n1327), .A2(n1326), .B0(ready_cordic), .B1(
        ack_cordic), .Y(n1167) );
  INVX2TS U965 ( .A(ready_add_subt), .Y(n1292) );
  NOR2XLTS U966 ( .A(n1292), .B(n1170), .Y(enab_d_ff4_Yn) );
  NAND2X1TS U967 ( .A(n1399), .B(cont_var_out[1]), .Y(n1288) );
  INVX2TS U968 ( .A(n1288), .Y(n1336) );
  AOI22X1TS U969 ( .A0(n1286), .A1(d_ff2_Y[59]), .B0(n1350), .B1(d_ff2_Z[59]), 
        .Y(n1168) );
  BUFX4TS U970 ( .A(n1336), .Y(n1253) );
  INVX2TS U971 ( .A(n1171), .Y(add_subt_dataA[8]) );
  INVX2TS U972 ( .A(n1172), .Y(add_subt_dataA[3]) );
  INVX2TS U973 ( .A(n1173), .Y(add_subt_dataA[5]) );
  INVX2TS U974 ( .A(n1174), .Y(add_subt_dataA[7]) );
  BUFX4TS U975 ( .A(n1253), .Y(n1240) );
  CLKBUFX2TS U976 ( .A(n1244), .Y(n1256) );
  BUFX3TS U977 ( .A(n1285), .Y(n1261) );
  INVX2TS U978 ( .A(n1175), .Y(add_subt_dataB[17]) );
  INVX2TS U979 ( .A(n1176), .Y(add_subt_dataB[11]) );
  BUFX3TS U980 ( .A(n1285), .Y(n1211) );
  AOI222X1TS U981 ( .A0(n1361), .A1(d_ff3_sh_y_out[9]), .B0(n1240), .B1(
        d_ff3_sh_x_out[9]), .C0(n1211), .C1(d_ff3_LUT_out[9]), .Y(n1177) );
  INVX2TS U982 ( .A(n1177), .Y(add_subt_dataB[9]) );
  AOI222X1TS U983 ( .A0(n1361), .A1(d_ff3_sh_y_out[13]), .B0(n1240), .B1(
        d_ff3_sh_x_out[13]), .C0(n1261), .C1(d_ff3_LUT_out[13]), .Y(n1178) );
  INVX2TS U984 ( .A(n1178), .Y(add_subt_dataB[13]) );
  AOI222X1TS U985 ( .A0(n1361), .A1(d_ff3_sh_y_out[15]), .B0(n1240), .B1(
        d_ff3_sh_x_out[15]), .C0(n1261), .C1(d_ff3_LUT_out[15]), .Y(n1179) );
  INVX2TS U986 ( .A(n1179), .Y(add_subt_dataB[15]) );
  INVX4TS U987 ( .A(n1170), .Y(n1346) );
  BUFX4TS U988 ( .A(n1360), .Y(n1242) );
  INVX2TS U989 ( .A(n1180), .Y(add_subt_dataA[61]) );
  AOI222X1TS U990 ( .A0(n1342), .A1(d_ff2_X[62]), .B0(n1242), .B1(d_ff2_Y[62]), 
        .C0(n1211), .C1(d_ff2_Z[62]), .Y(n1181) );
  INVX2TS U991 ( .A(n1181), .Y(add_subt_dataA[62]) );
  AOI222X1TS U992 ( .A0(n1340), .A1(d_ff2_X[63]), .B0(n1242), .B1(d_ff2_Y[63]), 
        .C0(n1211), .C1(d_ff2_Z[63]), .Y(n1182) );
  INVX2TS U993 ( .A(n1182), .Y(add_subt_dataA[63]) );
  AOI222X1TS U994 ( .A0(n1342), .A1(d_ff3_sh_y_out[0]), .B0(n1242), .B1(
        d_ff3_sh_x_out[0]), .C0(n1211), .C1(d_ff3_LUT_out[0]), .Y(n1183) );
  INVX2TS U995 ( .A(n1183), .Y(add_subt_dataB[0]) );
  INVX2TS U996 ( .A(n1184), .Y(add_subt_dataA[60]) );
  BUFX4TS U997 ( .A(n1244), .Y(n1238) );
  AOI222X1TS U998 ( .A0(n1348), .A1(d_ff2_X[57]), .B0(n1242), .B1(d_ff2_Y[57]), 
        .C0(n1350), .C1(d_ff2_Z[57]), .Y(n1185) );
  INVX2TS U999 ( .A(n1185), .Y(add_subt_dataA[57]) );
  INVX2TS U1000 ( .A(n1186), .Y(add_subt_dataA[56]) );
  INVX2TS U1001 ( .A(n1187), .Y(add_subt_dataA[58]) );
  INVX2TS U1002 ( .A(n1188), .Y(add_subt_dataA[54]) );
  INVX2TS U1003 ( .A(n1189), .Y(add_subt_dataA[53]) );
  AOI222X1TS U1004 ( .A0(n1346), .A1(d_ff2_X[52]), .B0(n1253), .B1(d_ff2_Y[52]), .C0(n1238), .C1(d_ff2_Z[52]), .Y(n1190) );
  INVX2TS U1005 ( .A(n1190), .Y(add_subt_dataA[52]) );
  AOI222X1TS U1006 ( .A0(n1329), .A1(d_ff2_X[51]), .B0(n1360), .B1(d_ff2_Y[51]), .C0(n1244), .C1(d_ff2_Z[51]), .Y(n1191) );
  INVX2TS U1007 ( .A(n1191), .Y(add_subt_dataA[51]) );
  AOI222X1TS U1008 ( .A0(n1337), .A1(d_ff2_X[50]), .B0(n1253), .B1(d_ff2_Y[50]), .C0(n1256), .C1(d_ff2_Z[50]), .Y(n1192) );
  INVX2TS U1009 ( .A(n1192), .Y(add_subt_dataA[50]) );
  AOI222X1TS U1010 ( .A0(n1340), .A1(d_ff3_sh_y_out[2]), .B0(n1242), .B1(
        d_ff3_sh_x_out[2]), .C0(n1211), .C1(d_ff3_LUT_out[2]), .Y(n1193) );
  INVX2TS U1011 ( .A(n1193), .Y(add_subt_dataB[2]) );
  AOI222X1TS U1012 ( .A0(n1346), .A1(d_ff2_X[49]), .B0(n1229), .B1(d_ff2_Y[49]), .C0(n1350), .C1(d_ff2_Z[49]), .Y(n1194) );
  INVX2TS U1013 ( .A(n1194), .Y(add_subt_dataA[49]) );
  AOI222X1TS U1014 ( .A0(n1329), .A1(d_ff2_X[48]), .B0(n1240), .B1(d_ff2_Y[48]), .C0(n1238), .C1(d_ff2_Z[48]), .Y(n1195) );
  INVX2TS U1015 ( .A(n1195), .Y(add_subt_dataA[48]) );
  AOI222X1TS U1016 ( .A0(n1342), .A1(d_ff2_X[47]), .B0(n1242), .B1(d_ff2_Y[47]), .C0(n1350), .C1(d_ff2_Z[47]), .Y(n1196) );
  INVX2TS U1017 ( .A(n1196), .Y(add_subt_dataA[47]) );
  AOI222X1TS U1018 ( .A0(n1348), .A1(d_ff2_X[46]), .B0(n1229), .B1(d_ff2_Y[46]), .C0(n1238), .C1(d_ff2_Z[46]), .Y(n1197) );
  INVX2TS U1019 ( .A(n1197), .Y(add_subt_dataA[46]) );
  AOI222X1TS U1020 ( .A0(n1346), .A1(d_ff2_X[45]), .B0(n1229), .B1(d_ff2_Y[45]), .C0(n1244), .C1(d_ff2_Z[45]), .Y(n1198) );
  INVX2TS U1021 ( .A(n1198), .Y(add_subt_dataA[45]) );
  AOI222X1TS U1022 ( .A0(n1337), .A1(d_ff3_sh_y_out[1]), .B0(n1242), .B1(
        d_ff3_sh_x_out[1]), .C0(n1211), .C1(d_ff3_LUT_out[1]), .Y(n1199) );
  INVX2TS U1023 ( .A(n1199), .Y(add_subt_dataB[1]) );
  AOI222X1TS U1024 ( .A0(n1346), .A1(d_ff3_sh_y_out[6]), .B0(n1240), .B1(
        d_ff3_sh_x_out[6]), .C0(n1211), .C1(d_ff3_LUT_out[6]), .Y(n1200) );
  INVX2TS U1025 ( .A(n1200), .Y(add_subt_dataB[6]) );
  AOI222X1TS U1026 ( .A0(n1348), .A1(d_ff3_sh_y_out[7]), .B0(n1240), .B1(
        d_ff3_sh_x_out[7]), .C0(n1211), .C1(d_ff3_LUT_out[7]), .Y(n1201) );
  INVX2TS U1027 ( .A(n1201), .Y(add_subt_dataB[7]) );
  AOI222X1TS U1028 ( .A0(n1329), .A1(d_ff3_sh_y_out[3]), .B0(n1242), .B1(
        d_ff3_sh_x_out[3]), .C0(n1211), .C1(d_ff3_LUT_out[3]), .Y(n1202) );
  INVX2TS U1029 ( .A(n1202), .Y(add_subt_dataB[3]) );
  INVX2TS U1030 ( .A(n1203), .Y(add_subt_dataA[55]) );
  AOI222X1TS U1031 ( .A0(n1337), .A1(d_ff3_sh_y_out[5]), .B0(n1242), .B1(
        d_ff3_sh_x_out[5]), .C0(n1211), .C1(d_ff3_LUT_out[5]), .Y(n1204) );
  INVX2TS U1032 ( .A(n1204), .Y(add_subt_dataB[5]) );
  AOI222X1TS U1033 ( .A0(n1337), .A1(d_ff2_X[0]), .B0(n1229), .B1(d_ff2_Y[0]), 
        .C0(n1256), .C1(d_ff2_Z[0]), .Y(n1205) );
  INVX2TS U1034 ( .A(n1205), .Y(add_subt_dataA[0]) );
  INVX2TS U1035 ( .A(n1384), .Y(n1385) );
  BUFX4TS U1036 ( .A(n1360), .Y(n1357) );
  AOI21X1TS U1037 ( .A0(n1385), .A1(cont_var_out[1]), .B0(n1357), .Y(n1206) );
  OAI21XLTS U1038 ( .A0(n1170), .A1(n1385), .B0(n1206), .Y(n961) );
  AOI222X1TS U1039 ( .A0(n1361), .A1(d_ff2_X[2]), .B0(n1357), .B1(d_ff2_Y[2]), 
        .C0(n1238), .C1(d_ff2_Z[2]), .Y(n1207) );
  INVX2TS U1040 ( .A(n1207), .Y(add_subt_dataA[2]) );
  AOI222X1TS U1041 ( .A0(n1342), .A1(d_ff3_sh_y_out[14]), .B0(n1240), .B1(
        d_ff3_sh_x_out[14]), .C0(n1261), .C1(d_ff3_LUT_out[14]), .Y(n1208) );
  INVX2TS U1042 ( .A(n1208), .Y(add_subt_dataB[14]) );
  AOI222X1TS U1043 ( .A0(n1342), .A1(d_ff2_X[15]), .B0(n1360), .B1(d_ff2_Y[15]), .C0(n1285), .C1(d_ff2_Z[15]), .Y(n1209) );
  INVX2TS U1044 ( .A(n1209), .Y(add_subt_dataA[15]) );
  AOI222X1TS U1045 ( .A0(n1348), .A1(d_ff3_sh_y_out[10]), .B0(n1240), .B1(
        d_ff3_sh_x_out[10]), .C0(n1261), .C1(d_ff3_LUT_out[10]), .Y(n1210) );
  INVX2TS U1046 ( .A(n1210), .Y(add_subt_dataB[10]) );
  AOI222X1TS U1047 ( .A0(n1342), .A1(d_ff3_sh_y_out[8]), .B0(n1240), .B1(
        d_ff3_sh_x_out[8]), .C0(n1211), .C1(d_ff3_LUT_out[8]), .Y(n1212) );
  INVX2TS U1048 ( .A(n1212), .Y(add_subt_dataB[8]) );
  AOI222X1TS U1049 ( .A0(n1329), .A1(d_ff2_X[9]), .B0(n1253), .B1(d_ff2_Y[9]), 
        .C0(n1285), .C1(d_ff2_Z[9]), .Y(n1213) );
  INVX2TS U1050 ( .A(n1213), .Y(add_subt_dataA[9]) );
  AOI222X1TS U1051 ( .A0(n1346), .A1(d_ff3_sh_y_out[16]), .B0(n1240), .B1(
        d_ff3_sh_x_out[16]), .C0(n1261), .C1(d_ff3_LUT_out[16]), .Y(n1214) );
  INVX2TS U1052 ( .A(n1214), .Y(add_subt_dataB[16]) );
  AOI222X1TS U1053 ( .A0(n1348), .A1(d_ff2_X[11]), .B0(n1240), .B1(d_ff2_Y[11]), .C0(n1285), .C1(d_ff2_Z[11]), .Y(n1215) );
  INVX2TS U1054 ( .A(n1215), .Y(add_subt_dataA[11]) );
  AOI222X1TS U1055 ( .A0(n1329), .A1(d_ff3_sh_y_out[12]), .B0(n1240), .B1(
        d_ff3_sh_x_out[12]), .C0(n1261), .C1(d_ff3_LUT_out[12]), .Y(n1216) );
  INVX2TS U1056 ( .A(n1216), .Y(add_subt_dataB[12]) );
  AOI222X1TS U1057 ( .A0(n1342), .A1(d_ff2_X[13]), .B0(n1360), .B1(d_ff2_Y[13]), .C0(n1285), .C1(d_ff2_Z[13]), .Y(n1217) );
  INVX2TS U1058 ( .A(n1217), .Y(add_subt_dataA[13]) );
  AOI222X1TS U1059 ( .A0(n1329), .A1(d_ff2_X[14]), .B0(n1286), .B1(d_ff2_Y[14]), .C0(n1285), .C1(d_ff2_Z[14]), .Y(n1218) );
  INVX2TS U1060 ( .A(n1218), .Y(add_subt_dataA[14]) );
  AOI222X1TS U1061 ( .A0(n1337), .A1(d_ff2_X[10]), .B0(n1253), .B1(d_ff2_Y[10]), .C0(n1285), .C1(d_ff2_Z[10]), .Y(n1219) );
  INVX2TS U1062 ( .A(n1219), .Y(add_subt_dataA[10]) );
  AOI222X1TS U1063 ( .A0(n1340), .A1(d_ff2_X[16]), .B0(n1360), .B1(d_ff2_Y[16]), .C0(n1285), .C1(d_ff2_Z[16]), .Y(n1220) );
  INVX2TS U1064 ( .A(n1220), .Y(add_subt_dataA[16]) );
  AOI222X1TS U1065 ( .A0(n1329), .A1(d_ff2_X[1]), .B0(n1357), .B1(d_ff2_Y[1]), 
        .C0(n1238), .C1(d_ff2_Z[1]), .Y(n1221) );
  INVX2TS U1066 ( .A(n1221), .Y(add_subt_dataA[1]) );
  AOI222X1TS U1067 ( .A0(n1340), .A1(d_ff3_sh_y_out[18]), .B0(n1240), .B1(
        d_ff3_sh_x_out[18]), .C0(n1261), .C1(d_ff3_LUT_out[18]), .Y(n1222) );
  INVX2TS U1068 ( .A(n1222), .Y(add_subt_dataB[18]) );
  AOI222X1TS U1069 ( .A0(n1329), .A1(d_ff2_X[17]), .B0(n1253), .B1(d_ff2_Y[17]), .C0(n1285), .C1(d_ff2_Z[17]), .Y(n1223) );
  INVX2TS U1070 ( .A(n1223), .Y(add_subt_dataA[17]) );
  AOI222X1TS U1071 ( .A0(n1340), .A1(d_ff2_X[4]), .B0(n1357), .B1(d_ff2_Y[4]), 
        .C0(n1244), .C1(d_ff2_Z[4]), .Y(n1224) );
  INVX2TS U1072 ( .A(n1224), .Y(add_subt_dataA[4]) );
  AOI222X1TS U1073 ( .A0(n1340), .A1(d_ff2_X[12]), .B0(n1229), .B1(d_ff2_Y[12]), .C0(n1350), .C1(d_ff2_Z[12]), .Y(n1225) );
  INVX2TS U1074 ( .A(n1225), .Y(add_subt_dataA[12]) );
  AOI222X1TS U1075 ( .A0(n1337), .A1(d_ff2_X[6]), .B0(n1360), .B1(d_ff2_Y[6]), 
        .C0(n1256), .C1(d_ff2_Z[6]), .Y(n1226) );
  INVX2TS U1076 ( .A(n1226), .Y(add_subt_dataA[6]) );
  AOI222X1TS U1077 ( .A0(n1340), .A1(d_ff2_X[18]), .B0(n1253), .B1(d_ff2_Y[18]), .C0(n1238), .C1(d_ff2_Z[18]), .Y(n1227) );
  INVX2TS U1078 ( .A(n1227), .Y(add_subt_dataA[18]) );
  AOI222X1TS U1079 ( .A0(n1337), .A1(d_ff2_X[44]), .B0(n1286), .B1(d_ff2_Y[44]), .C0(n1238), .C1(d_ff2_Z[44]), .Y(n1228) );
  INVX2TS U1080 ( .A(n1228), .Y(add_subt_dataA[44]) );
  AOI222X1TS U1081 ( .A0(n1340), .A1(d_ff2_X[41]), .B0(n1229), .B1(d_ff2_Y[41]), .C0(n1350), .C1(d_ff2_Z[41]), .Y(n1230) );
  INVX2TS U1082 ( .A(n1230), .Y(add_subt_dataA[41]) );
  BUFX3TS U1083 ( .A(n1285), .Y(n1363) );
  AOI222X1TS U1084 ( .A0(n1348), .A1(d_ff2_X[40]), .B0(n1240), .B1(d_ff2_Y[40]), .C0(n1363), .C1(d_ff2_Z[40]), .Y(n1231) );
  INVX2TS U1085 ( .A(n1231), .Y(add_subt_dataA[40]) );
  AOI222X1TS U1086 ( .A0(n1346), .A1(d_ff2_X[36]), .B0(n1242), .B1(d_ff2_Y[36]), .C0(n1244), .C1(d_ff2_Z[36]), .Y(n1232) );
  INVX2TS U1087 ( .A(n1232), .Y(add_subt_dataA[36]) );
  AOI222X1TS U1088 ( .A0(n1342), .A1(d_ff2_X[42]), .B0(n1240), .B1(d_ff2_Y[42]), .C0(n1238), .C1(d_ff2_Z[42]), .Y(n1233) );
  INVX2TS U1089 ( .A(n1233), .Y(add_subt_dataA[42]) );
  AOI222X1TS U1090 ( .A0(n1346), .A1(d_ff2_X[34]), .B0(n1242), .B1(d_ff2_Y[34]), .C0(n1244), .C1(d_ff2_Z[34]), .Y(n1234) );
  INVX2TS U1091 ( .A(n1234), .Y(add_subt_dataA[34]) );
  AOI222X1TS U1092 ( .A0(n1346), .A1(d_ff2_X[35]), .B0(n1360), .B1(d_ff2_Y[35]), .C0(n1244), .C1(d_ff2_Z[35]), .Y(n1235) );
  INVX2TS U1093 ( .A(n1235), .Y(add_subt_dataA[35]) );
  AOI222X1TS U1094 ( .A0(n1337), .A1(d_ff2_X[38]), .B0(n1357), .B1(d_ff2_Y[38]), .C0(n1256), .C1(d_ff2_Z[38]), .Y(n1236) );
  INVX2TS U1095 ( .A(n1236), .Y(add_subt_dataA[38]) );
  AOI222X1TS U1096 ( .A0(n1348), .A1(d_ff2_X[39]), .B0(n1357), .B1(d_ff2_Y[39]), .C0(n1350), .C1(d_ff2_Z[39]), .Y(n1237) );
  INVX2TS U1097 ( .A(n1237), .Y(add_subt_dataA[39]) );
  AOI222X1TS U1098 ( .A0(n1342), .A1(d_ff2_X[43]), .B0(n1253), .B1(d_ff2_Y[43]), .C0(n1244), .C1(d_ff2_Z[43]), .Y(n1239) );
  INVX2TS U1099 ( .A(n1239), .Y(add_subt_dataA[43]) );
  AOI222X1TS U1100 ( .A0(n1348), .A1(d_ff2_X[32]), .B0(n1240), .B1(d_ff2_Y[32]), .C0(n1350), .C1(d_ff2_Z[32]), .Y(n1241) );
  INVX2TS U1101 ( .A(n1241), .Y(add_subt_dataA[32]) );
  AOI222X1TS U1102 ( .A0(n1337), .A1(d_ff2_X[33]), .B0(n1242), .B1(d_ff2_Y[33]), .C0(n1238), .C1(d_ff2_Z[33]), .Y(n1243) );
  INVX2TS U1103 ( .A(n1243), .Y(add_subt_dataA[33]) );
  AOI222X1TS U1104 ( .A0(n1348), .A1(d_ff2_X[37]), .B0(n1357), .B1(d_ff2_Y[37]), .C0(n1244), .C1(d_ff2_Z[37]), .Y(n1245) );
  INVX2TS U1105 ( .A(n1245), .Y(add_subt_dataA[37]) );
  INVX4TS U1106 ( .A(n1170), .Y(n1337) );
  AOI222X1TS U1107 ( .A0(n1348), .A1(d_ff2_X[31]), .B0(n1360), .B1(d_ff2_Y[31]), .C0(n1238), .C1(d_ff2_Z[31]), .Y(n1246) );
  INVX2TS U1108 ( .A(n1246), .Y(add_subt_dataA[31]) );
  AOI222X1TS U1109 ( .A0(n1348), .A1(d_ff2_X[29]), .B0(n1229), .B1(d_ff2_Y[29]), .C0(n1350), .C1(d_ff2_Z[29]), .Y(n1247) );
  INVX2TS U1110 ( .A(n1247), .Y(add_subt_dataA[29]) );
  AOI222X1TS U1111 ( .A0(n1340), .A1(d_ff2_X[19]), .B0(n1242), .B1(d_ff2_Y[19]), .C0(n1238), .C1(d_ff2_Z[19]), .Y(n1248) );
  INVX2TS U1112 ( .A(n1248), .Y(add_subt_dataA[19]) );
  BUFX4TS U1113 ( .A(n1285), .Y(n1283) );
  AOI222X1TS U1114 ( .A0(n1340), .A1(d_ff2_X[24]), .B0(n1357), .B1(d_ff2_Y[24]), .C0(n1283), .C1(d_ff2_Z[24]), .Y(n1249) );
  INVX2TS U1115 ( .A(n1249), .Y(add_subt_dataA[24]) );
  AOI222X1TS U1116 ( .A0(n1329), .A1(d_ff2_X[25]), .B0(n1360), .B1(d_ff2_Y[25]), .C0(n1283), .C1(d_ff2_Z[25]), .Y(n1250) );
  INVX2TS U1117 ( .A(n1250), .Y(add_subt_dataA[25]) );
  AOI222X1TS U1118 ( .A0(n1337), .A1(d_ff2_X[27]), .B0(n1253), .B1(d_ff2_Y[27]), .C0(n1285), .C1(d_ff2_Z[27]), .Y(n1251) );
  INVX2TS U1119 ( .A(n1251), .Y(add_subt_dataA[27]) );
  AOI222X1TS U1120 ( .A0(n1346), .A1(d_ff2_X[26]), .B0(n1360), .B1(d_ff2_Y[26]), .C0(n1285), .C1(d_ff2_Z[26]), .Y(n1252) );
  INVX2TS U1121 ( .A(n1252), .Y(add_subt_dataA[26]) );
  AOI222X1TS U1122 ( .A0(n1342), .A1(d_ff2_X[28]), .B0(n1229), .B1(d_ff2_Y[28]), .C0(n1350), .C1(d_ff2_Z[28]), .Y(n1254) );
  INVX2TS U1123 ( .A(n1254), .Y(add_subt_dataA[28]) );
  AOI222X1TS U1124 ( .A0(n1337), .A1(d_ff2_X[20]), .B0(n1336), .B1(d_ff2_Y[20]), .C0(n1238), .C1(d_ff2_Z[20]), .Y(n1255) );
  INVX2TS U1125 ( .A(n1255), .Y(add_subt_dataA[20]) );
  AOI222X1TS U1126 ( .A0(n1337), .A1(d_ff2_X[21]), .B0(n1286), .B1(d_ff2_Y[21]), .C0(n1285), .C1(d_ff2_Z[21]), .Y(n1257) );
  INVX2TS U1127 ( .A(n1257), .Y(add_subt_dataA[21]) );
  AOI222X1TS U1128 ( .A0(n1340), .A1(d_ff3_sh_y_out[20]), .B0(n1286), .B1(
        d_ff3_sh_x_out[20]), .C0(n1261), .C1(d_ff3_LUT_out[20]), .Y(n1258) );
  INVX2TS U1129 ( .A(n1258), .Y(add_subt_dataB[20]) );
  AOI222X1TS U1130 ( .A0(n1342), .A1(d_ff3_sh_y_out[22]), .B0(n1229), .B1(
        d_ff3_sh_x_out[22]), .C0(n1261), .C1(d_ff3_LUT_out[22]), .Y(n1259) );
  INVX2TS U1131 ( .A(n1259), .Y(add_subt_dataB[22]) );
  AOI222X1TS U1132 ( .A0(n1346), .A1(d_ff3_sh_y_out[19]), .B0(n1286), .B1(
        d_ff3_sh_x_out[19]), .C0(n1261), .C1(d_ff3_LUT_out[19]), .Y(n1260) );
  INVX2TS U1133 ( .A(n1260), .Y(add_subt_dataB[19]) );
  AOI222X1TS U1134 ( .A0(n1329), .A1(d_ff3_sh_y_out[21]), .B0(n1229), .B1(
        d_ff3_sh_x_out[21]), .C0(n1261), .C1(d_ff3_LUT_out[21]), .Y(n1262) );
  INVX2TS U1135 ( .A(n1262), .Y(add_subt_dataB[21]) );
  AOI222X1TS U1136 ( .A0(n1329), .A1(d_ff3_sh_y_out[45]), .B0(n1286), .B1(
        d_ff3_sh_x_out[45]), .C0(n1283), .C1(d_ff3_LUT_out[45]), .Y(n1263) );
  INVX2TS U1137 ( .A(n1263), .Y(add_subt_dataB[45]) );
  AOI222X1TS U1138 ( .A0(n1340), .A1(d_ff3_sh_y_out[50]), .B0(n1360), .B1(
        d_ff3_sh_x_out[50]), .C0(n1283), .C1(d_ff3_LUT_out[50]), .Y(n1264) );
  INVX2TS U1139 ( .A(n1264), .Y(add_subt_dataB[50]) );
  AOI222X1TS U1140 ( .A0(n1340), .A1(d_ff2_X[23]), .B0(n1286), .B1(d_ff2_Y[23]), .C0(n1283), .C1(d_ff2_Z[23]), .Y(n1265) );
  INVX2TS U1141 ( .A(n1265), .Y(add_subt_dataA[23]) );
  AOI222X1TS U1142 ( .A0(n1346), .A1(d_ff3_sh_y_out[37]), .B0(n1253), .B1(
        d_ff3_sh_x_out[37]), .C0(n1283), .C1(d_ff3_LUT_out[37]), .Y(n1266) );
  INVX2TS U1143 ( .A(n1266), .Y(add_subt_dataB[37]) );
  AOI222X1TS U1144 ( .A0(n1346), .A1(d_ff3_sh_y_out[39]), .B0(n1253), .B1(
        d_ff3_sh_x_out[39]), .C0(n1283), .C1(d_ff3_LUT_out[39]), .Y(n1267) );
  INVX2TS U1145 ( .A(n1267), .Y(add_subt_dataB[39]) );
  AOI222X1TS U1146 ( .A0(n1346), .A1(d_ff2_X[22]), .B0(n1360), .B1(d_ff2_Y[22]), .C0(n1283), .C1(d_ff2_Z[22]), .Y(n1268) );
  INVX2TS U1147 ( .A(n1268), .Y(add_subt_dataA[22]) );
  AOI222X1TS U1148 ( .A0(n1348), .A1(d_ff3_sh_y_out[29]), .B0(n1286), .B1(
        d_ff3_sh_x_out[29]), .C0(n1283), .C1(d_ff3_LUT_out[29]), .Y(n1269) );
  INVX2TS U1149 ( .A(n1269), .Y(add_subt_dataB[29]) );
  AOI222X1TS U1150 ( .A0(n1348), .A1(d_ff3_sh_y_out[56]), .B0(n1253), .B1(
        d_ff3_sh_x_out[56]), .C0(n1350), .C1(d_ff3_LUT_out[56]), .Y(n1270) );
  INVX2TS U1151 ( .A(n1270), .Y(add_subt_dataB[56]) );
  AOI222X1TS U1152 ( .A0(n1329), .A1(d_ff3_sh_y_out[33]), .B0(n1229), .B1(
        d_ff3_sh_x_out[33]), .C0(n1283), .C1(d_ff3_LUT_out[33]), .Y(n1271) );
  INVX2TS U1153 ( .A(n1271), .Y(add_subt_dataB[33]) );
  AOI222X1TS U1154 ( .A0(n1337), .A1(d_ff3_sh_y_out[31]), .B0(n1286), .B1(
        d_ff3_sh_x_out[31]), .C0(n1283), .C1(d_ff3_LUT_out[31]), .Y(n1272) );
  INVX2TS U1155 ( .A(n1272), .Y(add_subt_dataB[31]) );
  AOI222X1TS U1156 ( .A0(n1348), .A1(d_ff3_sh_y_out[53]), .B0(n1253), .B1(
        d_ff3_sh_x_out[53]), .C0(n1363), .C1(d_ff3_LUT_out[53]), .Y(n1273) );
  INVX2TS U1157 ( .A(n1273), .Y(add_subt_dataB[53]) );
  AOI222X1TS U1158 ( .A0(n1342), .A1(d_ff3_sh_y_out[54]), .B0(n1360), .B1(
        d_ff3_sh_x_out[54]), .C0(n1363), .C1(d_ff3_LUT_out[54]), .Y(n1274) );
  INVX2TS U1159 ( .A(n1274), .Y(add_subt_dataB[54]) );
  AOI222X1TS U1160 ( .A0(n1340), .A1(d_ff3_sh_y_out[55]), .B0(n1253), .B1(
        d_ff3_sh_x_out[55]), .C0(n1363), .C1(d_ff3_LUT_out[55]), .Y(n1275) );
  INVX2TS U1161 ( .A(n1275), .Y(add_subt_dataB[55]) );
  AOI222X1TS U1162 ( .A0(n1337), .A1(d_ff3_sh_y_out[52]), .B0(n1336), .B1(
        d_ff3_sh_x_out[52]), .C0(n1363), .C1(d_ff3_LUT_out[52]), .Y(n1276) );
  INVX2TS U1163 ( .A(n1276), .Y(add_subt_dataB[52]) );
  AOI222X1TS U1164 ( .A0(n1342), .A1(d_ff3_sh_y_out[27]), .B0(n1286), .B1(
        d_ff3_sh_x_out[27]), .C0(n1283), .C1(d_ff3_LUT_out[27]), .Y(n1277) );
  INVX2TS U1165 ( .A(n1277), .Y(add_subt_dataB[27]) );
  AOI222X1TS U1166 ( .A0(n1329), .A1(d_ff3_sh_y_out[35]), .B0(n1229), .B1(
        d_ff3_sh_x_out[35]), .C0(n1283), .C1(d_ff3_LUT_out[35]), .Y(n1278) );
  INVX2TS U1167 ( .A(n1278), .Y(add_subt_dataB[35]) );
  AOI222X1TS U1168 ( .A0(n1342), .A1(d_ff3_sh_y_out[41]), .B0(n1253), .B1(
        d_ff3_sh_x_out[41]), .C0(n1363), .C1(d_ff3_LUT_out[41]), .Y(n1279) );
  INVX2TS U1169 ( .A(n1279), .Y(add_subt_dataB[41]) );
  AOI222X1TS U1170 ( .A0(n1340), .A1(d_ff3_sh_y_out[24]), .B0(n1286), .B1(
        d_ff3_sh_x_out[24]), .C0(n1283), .C1(d_ff3_LUT_out[24]), .Y(n1280) );
  INVX2TS U1171 ( .A(n1280), .Y(add_subt_dataB[24]) );
  AOI222X1TS U1172 ( .A0(n1346), .A1(d_ff3_sh_y_out[23]), .B0(n1286), .B1(
        d_ff3_sh_x_out[23]), .C0(n1283), .C1(d_ff3_LUT_out[23]), .Y(n1281) );
  INVX2TS U1173 ( .A(n1281), .Y(add_subt_dataB[23]) );
  AOI222X1TS U1174 ( .A0(n1346), .A1(d_ff3_sh_y_out[26]), .B0(n1286), .B1(
        d_ff3_sh_x_out[26]), .C0(n1283), .C1(d_ff3_LUT_out[26]), .Y(n1282) );
  INVX2TS U1175 ( .A(n1282), .Y(add_subt_dataB[26]) );
  AOI222X1TS U1176 ( .A0(n1329), .A1(d_ff3_sh_y_out[25]), .B0(n1286), .B1(
        d_ff3_sh_x_out[25]), .C0(n1283), .C1(d_ff3_LUT_out[25]), .Y(n1284) );
  INVX2TS U1177 ( .A(n1284), .Y(add_subt_dataB[25]) );
  AOI222X1TS U1178 ( .A0(n1337), .A1(d_ff2_X[30]), .B0(n1253), .B1(d_ff2_Y[30]), .C0(n1238), .C1(d_ff2_Z[30]), .Y(n1287) );
  INVX2TS U1179 ( .A(n1287), .Y(add_subt_dataA[30]) );
  NAND2X1TS U1180 ( .A(n1367), .B(n1365), .Y(n1289) );
  OAI211XLTS U1181 ( .A0(cont_iter_out[2]), .A1(n1409), .B0(n1290), .C0(n1289), 
        .Y(n962) );
  AOI31XLTS U1182 ( .A0(cont_iter_out[1]), .A1(n1398), .A2(n1372), .B0(n1380), 
        .Y(data_out_LUT[0]) );
  OAI32X1TS U1183 ( .A0(n1134), .A1(cont_iter_out[2]), .A2(n1368), .B0(
        cont_iter_out[1]), .B1(n1369), .Y(n994) );
  NOR3XLTS U1184 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .C(n1292), .Y(
        enab_d_ff4_Xn) );
  AOI22X1TS U1186 ( .A0(n1367), .A1(n1398), .B0(n1293), .B1(n1366), .Y(
        data_out_LUT[6]) );
  AOI22X1TS U1187 ( .A0(cont_iter_out[1]), .A1(n1368), .B0(n1381), .B1(n1134), 
        .Y(data_out_LUT[39]) );
  NAND2X1TS U1188 ( .A(d_ff1_shift_region_flag_out[1]), .B(n1139), .Y(n1296)
         );
  XOR2X1TS U1189 ( .A(n1143), .B(n1294), .Y(n1295) );
  INVX2TS U1190 ( .A(n1295), .Y(n1313) );
  AOI22X1TS U1191 ( .A0(n1311), .A1(d_ff_Yn[63]), .B0(d_ff_Xn[63]), .B1(n1310), 
        .Y(n1298) );
  XNOR2X1TS U1192 ( .A(n1298), .B(n1297), .Y(fmtted_Result_63_) );
  NAND2X1TS U1193 ( .A(n1368), .B(n1398), .Y(n998) );
  NOR2BX1TS U1194 ( .AN(d_ff_Yn[0]), .B(n1303), .Y(first_mux_Y[0]) );
  INVX4TS U1195 ( .A(n1301), .Y(n1318) );
  NOR2BX1TS U1196 ( .AN(d_ff_Yn[1]), .B(n1317), .Y(first_mux_Y[1]) );
  NOR2BX1TS U1197 ( .AN(d_ff_Yn[2]), .B(n1320), .Y(first_mux_Y[2]) );
  NOR2BX1TS U1198 ( .AN(d_ff_Yn[3]), .B(n1138), .Y(first_mux_Y[3]) );
  INVX4TS U1199 ( .A(n1301), .Y(n1306) );
  NOR2BX1TS U1200 ( .AN(d_ff_Yn[4]), .B(n1320), .Y(first_mux_Y[4]) );
  INVX4TS U1201 ( .A(n1301), .Y(n1299) );
  NOR2BX1TS U1202 ( .AN(d_ff_Yn[5]), .B(n1138), .Y(first_mux_Y[5]) );
  NOR2BX1TS U1203 ( .AN(d_ff_Yn[6]), .B(n1299), .Y(first_mux_Y[6]) );
  NOR2BX1TS U1204 ( .AN(d_ff_Yn[7]), .B(n1319), .Y(first_mux_Y[7]) );
  NOR2BX1TS U1205 ( .AN(d_ff_Yn[8]), .B(n1306), .Y(first_mux_Y[8]) );
  NOR2BX1TS U1206 ( .AN(d_ff_Yn[9]), .B(n1320), .Y(first_mux_Y[9]) );
  NOR2BX1TS U1207 ( .AN(d_ff_Yn[10]), .B(n1318), .Y(first_mux_Y[10]) );
  NOR2BX1TS U1208 ( .AN(d_ff_Yn[11]), .B(n1318), .Y(first_mux_Y[11]) );
  NOR2BX1TS U1209 ( .AN(d_ff_Yn[12]), .B(n1318), .Y(first_mux_Y[12]) );
  NOR2BX1TS U1210 ( .AN(d_ff_Yn[13]), .B(n1320), .Y(first_mux_Y[13]) );
  NOR2BX1TS U1211 ( .AN(d_ff_Yn[14]), .B(n1306), .Y(first_mux_Y[14]) );
  NOR2BX1TS U1212 ( .AN(d_ff_Yn[15]), .B(n1320), .Y(first_mux_Y[15]) );
  NOR2BX1TS U1213 ( .AN(d_ff_Yn[16]), .B(n1318), .Y(first_mux_Y[16]) );
  NOR2BX1TS U1214 ( .AN(d_ff_Yn[17]), .B(n1318), .Y(first_mux_Y[17]) );
  NOR2BX1TS U1215 ( .AN(d_ff_Yn[18]), .B(n1299), .Y(first_mux_Y[18]) );
  NOR2BX1TS U1216 ( .AN(d_ff_Yn[19]), .B(n1317), .Y(first_mux_Y[19]) );
  NOR2BX1TS U1217 ( .AN(d_ff_Yn[20]), .B(n1299), .Y(first_mux_Y[20]) );
  NOR2BX1TS U1218 ( .AN(d_ff_Yn[21]), .B(n1299), .Y(first_mux_Y[21]) );
  NOR2BX1TS U1219 ( .AN(d_ff_Yn[22]), .B(n1319), .Y(first_mux_Y[22]) );
  NOR2BX1TS U1220 ( .AN(d_ff_Yn[23]), .B(n1308), .Y(first_mux_Y[23]) );
  NOR2BX1TS U1221 ( .AN(d_ff_Yn[24]), .B(n1318), .Y(first_mux_Y[24]) );
  NOR2BX1TS U1222 ( .AN(d_ff_Yn[25]), .B(n1317), .Y(first_mux_Y[25]) );
  NOR2BX1TS U1223 ( .AN(d_ff_Yn[26]), .B(n1320), .Y(first_mux_Y[26]) );
  NOR2BX1TS U1224 ( .AN(d_ff_Yn[27]), .B(n1306), .Y(first_mux_Y[27]) );
  NOR2BX1TS U1225 ( .AN(d_ff_Yn[28]), .B(n1138), .Y(first_mux_Y[28]) );
  NOR2BX1TS U1226 ( .AN(d_ff_Yn[29]), .B(n1308), .Y(first_mux_Y[29]) );
  NOR2BX1TS U1227 ( .AN(d_ff_Yn[30]), .B(n1306), .Y(first_mux_Y[30]) );
  NOR2BX1TS U1228 ( .AN(d_ff_Yn[31]), .B(n1138), .Y(first_mux_Y[31]) );
  NOR2BX1TS U1229 ( .AN(d_ff_Yn[32]), .B(n1299), .Y(first_mux_Y[32]) );
  NOR2BX1TS U1230 ( .AN(d_ff_Yn[33]), .B(n1299), .Y(first_mux_Y[33]) );
  NOR2BX1TS U1231 ( .AN(d_ff_Yn[34]), .B(n1317), .Y(first_mux_Y[34]) );
  NOR2BX1TS U1232 ( .AN(d_ff_Yn[35]), .B(n1320), .Y(first_mux_Y[35]) );
  NOR2BX1TS U1233 ( .AN(d_ff_Yn[36]), .B(n1319), .Y(first_mux_Y[36]) );
  NOR2BX1TS U1234 ( .AN(d_ff_Yn[37]), .B(n1308), .Y(first_mux_Y[37]) );
  NOR2BX1TS U1235 ( .AN(d_ff_Yn[38]), .B(n1317), .Y(first_mux_Y[38]) );
  NOR2BX1TS U1236 ( .AN(d_ff_Yn[39]), .B(n1320), .Y(first_mux_Y[39]) );
  NOR2BX1TS U1237 ( .AN(d_ff_Yn[40]), .B(n1318), .Y(first_mux_Y[40]) );
  NOR2BX1TS U1238 ( .AN(d_ff_Yn[41]), .B(n1306), .Y(first_mux_Y[41]) );
  NOR2BX1TS U1239 ( .AN(d_ff_Yn[42]), .B(n1138), .Y(first_mux_Y[42]) );
  NOR2BX1TS U1240 ( .AN(d_ff_Yn[43]), .B(n1299), .Y(first_mux_Y[43]) );
  NOR2BX1TS U1241 ( .AN(d_ff_Yn[44]), .B(n1319), .Y(first_mux_Y[44]) );
  NOR2BX1TS U1242 ( .AN(d_ff_Yn[45]), .B(n1138), .Y(first_mux_Y[45]) );
  NOR2BX1TS U1243 ( .AN(d_ff_Yn[46]), .B(n1299), .Y(first_mux_Y[46]) );
  NOR2BX1TS U1244 ( .AN(d_ff_Yn[47]), .B(n1319), .Y(first_mux_Y[47]) );
  NOR2BX1TS U1245 ( .AN(d_ff_Yn[48]), .B(n1308), .Y(first_mux_Y[48]) );
  NOR2BX1TS U1246 ( .AN(d_ff_Yn[49]), .B(n1317), .Y(first_mux_Y[49]) );
  NOR2BX1TS U1247 ( .AN(d_ff_Yn[50]), .B(n1320), .Y(first_mux_Y[50]) );
  NOR2BX1TS U1248 ( .AN(d_ff_Yn[51]), .B(n1318), .Y(first_mux_Y[51]) );
  NOR2BX1TS U1249 ( .AN(d_ff_Yn[52]), .B(n1306), .Y(first_mux_Y[52]) );
  NOR2BX1TS U1250 ( .AN(d_ff_Yn[53]), .B(n1320), .Y(first_mux_Y[53]) );
  NOR2BX1TS U1251 ( .AN(d_ff_Yn[54]), .B(n1318), .Y(first_mux_Y[54]) );
  NOR2BX1TS U1252 ( .AN(d_ff_Yn[55]), .B(n1306), .Y(first_mux_Y[55]) );
  NOR2BX1TS U1253 ( .AN(d_ff_Yn[56]), .B(n1319), .Y(first_mux_Y[56]) );
  NOR2BX1TS U1254 ( .AN(d_ff_Yn[57]), .B(n1138), .Y(first_mux_Y[57]) );
  NOR2BX1TS U1255 ( .AN(d_ff_Yn[58]), .B(n1308), .Y(first_mux_Y[58]) );
  NOR2BX1TS U1256 ( .AN(d_ff_Yn[59]), .B(n1299), .Y(first_mux_Y[59]) );
  NOR2BX1TS U1257 ( .AN(d_ff_Yn[60]), .B(n1317), .Y(first_mux_Y[60]) );
  NOR2BX1TS U1258 ( .AN(d_ff_Yn[61]), .B(n1318), .Y(first_mux_Y[61]) );
  NOR2BX1TS U1259 ( .AN(d_ff_Yn[62]), .B(n1319), .Y(first_mux_Y[62]) );
  NOR2BX1TS U1260 ( .AN(d_ff_Yn[63]), .B(n1308), .Y(first_mux_Y[63]) );
  AO22XLTS U1261 ( .A0(n1319), .A1(d_ff1_Z[0]), .B0(n997), .B1(d_ff_Zn[0]), 
        .Y(first_mux_Z[0]) );
  AO22XLTS U1262 ( .A0(n1303), .A1(d_ff1_Z[1]), .B0(n1301), .B1(d_ff_Zn[1]), 
        .Y(first_mux_Z[1]) );
  AO22XLTS U1263 ( .A0(n1303), .A1(d_ff1_Z[2]), .B0(n1301), .B1(d_ff_Zn[2]), 
        .Y(first_mux_Z[2]) );
  AO22XLTS U1264 ( .A0(n1300), .A1(d_ff1_Z[3]), .B0(n997), .B1(d_ff_Zn[3]), 
        .Y(first_mux_Z[3]) );
  AO22XLTS U1265 ( .A0(n1302), .A1(d_ff1_Z[4]), .B0(n997), .B1(d_ff_Zn[4]), 
        .Y(first_mux_Z[4]) );
  AO22XLTS U1266 ( .A0(n1303), .A1(d_ff1_Z[5]), .B0(n1304), .B1(d_ff_Zn[5]), 
        .Y(first_mux_Z[5]) );
  AO22XLTS U1267 ( .A0(n1302), .A1(d_ff1_Z[6]), .B0(n1304), .B1(d_ff_Zn[6]), 
        .Y(first_mux_Z[6]) );
  AO22XLTS U1268 ( .A0(n1300), .A1(d_ff1_Z[7]), .B0(n1304), .B1(d_ff_Zn[7]), 
        .Y(first_mux_Z[7]) );
  AO22XLTS U1269 ( .A0(n1303), .A1(d_ff1_Z[8]), .B0(n1304), .B1(d_ff_Zn[8]), 
        .Y(first_mux_Z[8]) );
  AO22XLTS U1270 ( .A0(n1303), .A1(d_ff1_Z[9]), .B0(n1304), .B1(d_ff_Zn[9]), 
        .Y(first_mux_Z[9]) );
  AO22XLTS U1271 ( .A0(n1302), .A1(d_ff1_Z[10]), .B0(n1304), .B1(d_ff_Zn[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U1272 ( .A0(n1302), .A1(d_ff1_Z[11]), .B0(n1304), .B1(d_ff_Zn[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U1273 ( .A0(n1302), .A1(d_ff1_Z[12]), .B0(n1304), .B1(d_ff_Zn[12]), 
        .Y(first_mux_Z[12]) );
  BUFX4TS U1274 ( .A(n997), .Y(n1305) );
  AO22XLTS U1275 ( .A0(n1302), .A1(d_ff1_Z[13]), .B0(n1305), .B1(d_ff_Zn[13]), 
        .Y(first_mux_Z[13]) );
  BUFX3TS U1276 ( .A(n997), .Y(n1307) );
  AO22XLTS U1277 ( .A0(n1302), .A1(d_ff1_Z[14]), .B0(n1307), .B1(d_ff_Zn[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U1278 ( .A0(n1302), .A1(d_ff1_Z[15]), .B0(n1305), .B1(d_ff_Zn[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U1279 ( .A0(n1302), .A1(d_ff1_Z[16]), .B0(n1307), .B1(d_ff_Zn[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U1280 ( .A0(n1300), .A1(d_ff1_Z[17]), .B0(n1305), .B1(d_ff_Zn[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U1281 ( .A0(n1306), .A1(d_ff1_Z[18]), .B0(n1307), .B1(d_ff_Zn[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U1282 ( .A0(n1302), .A1(d_ff1_Z[19]), .B0(n1305), .B1(d_ff_Zn[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U1283 ( .A0(n1303), .A1(d_ff1_Z[20]), .B0(n1305), .B1(d_ff_Zn[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U1284 ( .A0(n1303), .A1(d_ff1_Z[21]), .B0(n1307), .B1(d_ff_Zn[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U1285 ( .A0(n1303), .A1(d_ff1_Z[22]), .B0(n1305), .B1(d_ff_Zn[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U1286 ( .A0(n1303), .A1(d_ff1_Z[23]), .B0(n1305), .B1(d_ff_Zn[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U1287 ( .A0(n1300), .A1(d_ff1_Z[24]), .B0(n1305), .B1(d_ff_Zn[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U1288 ( .A0(n1300), .A1(d_ff1_Z[25]), .B0(n1305), .B1(d_ff_Zn[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U1289 ( .A0(n1303), .A1(d_ff1_Z[26]), .B0(n1305), .B1(d_ff_Zn[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U1290 ( .A0(n1303), .A1(d_ff1_Z[27]), .B0(n1305), .B1(d_ff_Zn[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U1291 ( .A0(n1300), .A1(d_ff1_Z[28]), .B0(n1305), .B1(d_ff_Zn[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U1292 ( .A0(n1303), .A1(d_ff1_Z[29]), .B0(n1305), .B1(d_ff_Zn[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U1293 ( .A0(n1300), .A1(d_ff1_Z[30]), .B0(n1305), .B1(d_ff_Zn[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U1294 ( .A0(n1303), .A1(d_ff1_Z[31]), .B0(n1305), .B1(d_ff_Zn[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U1295 ( .A0(n1303), .A1(d_ff1_Z[32]), .B0(n1305), .B1(d_ff_Zn[32]), 
        .Y(first_mux_Z[32]) );
  AO22XLTS U1296 ( .A0(n1300), .A1(d_ff1_Z[33]), .B0(n1305), .B1(d_ff_Zn[33]), 
        .Y(first_mux_Z[33]) );
  AO22XLTS U1297 ( .A0(n1303), .A1(d_ff1_Z[34]), .B0(n1307), .B1(d_ff_Zn[34]), 
        .Y(first_mux_Z[34]) );
  AO22XLTS U1298 ( .A0(n1299), .A1(d_ff1_Z[35]), .B0(n1305), .B1(d_ff_Zn[35]), 
        .Y(first_mux_Z[35]) );
  AO22XLTS U1299 ( .A0(n1318), .A1(d_ff1_Z[36]), .B0(n1304), .B1(d_ff_Zn[36]), 
        .Y(first_mux_Z[36]) );
  AO22XLTS U1300 ( .A0(n1165), .A1(d_ff1_Z[37]), .B0(n1304), .B1(d_ff_Zn[37]), 
        .Y(first_mux_Z[37]) );
  AO22XLTS U1301 ( .A0(n1306), .A1(d_ff1_Z[38]), .B0(n1307), .B1(d_ff_Zn[38]), 
        .Y(first_mux_Z[38]) );
  AO22XLTS U1302 ( .A0(n1299), .A1(d_ff1_Z[39]), .B0(n1305), .B1(d_ff_Zn[39]), 
        .Y(first_mux_Z[39]) );
  AO22XLTS U1303 ( .A0(n1308), .A1(d_ff1_Z[40]), .B0(n997), .B1(d_ff_Zn[40]), 
        .Y(first_mux_Z[40]) );
  AO22XLTS U1304 ( .A0(n1138), .A1(d_ff1_Z[41]), .B0(n997), .B1(d_ff_Zn[41]), 
        .Y(first_mux_Z[41]) );
  AO22XLTS U1305 ( .A0(n1138), .A1(d_ff1_Z[42]), .B0(n1305), .B1(d_ff_Zn[42]), 
        .Y(first_mux_Z[42]) );
  AO22XLTS U1306 ( .A0(n1319), .A1(d_ff1_Z[43]), .B0(n997), .B1(d_ff_Zn[43]), 
        .Y(first_mux_Z[43]) );
  AO22XLTS U1307 ( .A0(n1317), .A1(d_ff1_Z[44]), .B0(n997), .B1(d_ff_Zn[44]), 
        .Y(first_mux_Z[44]) );
  AO22XLTS U1308 ( .A0(n1299), .A1(d_ff1_Z[45]), .B0(n1304), .B1(d_ff_Zn[45]), 
        .Y(first_mux_Z[45]) );
  AO22XLTS U1309 ( .A0(n1138), .A1(d_ff1_Z[46]), .B0(n1304), .B1(d_ff_Zn[46]), 
        .Y(first_mux_Z[46]) );
  AO22XLTS U1310 ( .A0(n1319), .A1(d_ff1_Z[47]), .B0(n1304), .B1(d_ff_Zn[47]), 
        .Y(first_mux_Z[47]) );
  AO22XLTS U1311 ( .A0(n1308), .A1(d_ff1_Z[48]), .B0(n1304), .B1(d_ff_Zn[48]), 
        .Y(first_mux_Z[48]) );
  AO22XLTS U1312 ( .A0(n1317), .A1(d_ff1_Z[49]), .B0(n1304), .B1(d_ff_Zn[49]), 
        .Y(first_mux_Z[49]) );
  AO22XLTS U1313 ( .A0(n1320), .A1(d_ff1_Z[50]), .B0(n1304), .B1(d_ff_Zn[50]), 
        .Y(first_mux_Z[50]) );
  AO22XLTS U1314 ( .A0(n1318), .A1(d_ff1_Z[51]), .B0(n1304), .B1(d_ff_Zn[51]), 
        .Y(first_mux_Z[51]) );
  AO22XLTS U1315 ( .A0(n1306), .A1(d_ff1_Z[52]), .B0(n1304), .B1(d_ff_Zn[52]), 
        .Y(first_mux_Z[52]) );
  AO22XLTS U1316 ( .A0(n1299), .A1(d_ff1_Z[53]), .B0(n1304), .B1(d_ff_Zn[53]), 
        .Y(first_mux_Z[53]) );
  AO22XLTS U1317 ( .A0(n1138), .A1(d_ff1_Z[54]), .B0(n1301), .B1(d_ff_Zn[54]), 
        .Y(first_mux_Z[54]) );
  AO22XLTS U1318 ( .A0(n1317), .A1(d_ff1_Z[55]), .B0(n1301), .B1(d_ff_Zn[55]), 
        .Y(first_mux_Z[55]) );
  AO22XLTS U1319 ( .A0(n1319), .A1(d_ff1_Z[56]), .B0(n1307), .B1(d_ff_Zn[56]), 
        .Y(first_mux_Z[56]) );
  AO22XLTS U1320 ( .A0(n1308), .A1(d_ff1_Z[57]), .B0(n1307), .B1(d_ff_Zn[57]), 
        .Y(first_mux_Z[57]) );
  AO22XLTS U1321 ( .A0(n1320), .A1(d_ff1_Z[58]), .B0(n1307), .B1(d_ff_Zn[58]), 
        .Y(first_mux_Z[58]) );
  AO22XLTS U1322 ( .A0(n1318), .A1(d_ff1_Z[59]), .B0(n1307), .B1(d_ff_Zn[59]), 
        .Y(first_mux_Z[59]) );
  AO22XLTS U1323 ( .A0(n1308), .A1(d_ff1_Z[60]), .B0(n1307), .B1(d_ff_Zn[60]), 
        .Y(first_mux_Z[60]) );
  AO22XLTS U1324 ( .A0(n1320), .A1(d_ff1_Z[61]), .B0(n1307), .B1(d_ff_Zn[61]), 
        .Y(first_mux_Z[61]) );
  AO22XLTS U1325 ( .A0(n1318), .A1(d_ff1_Z[62]), .B0(n1307), .B1(d_ff_Zn[62]), 
        .Y(first_mux_Z[62]) );
  AO22XLTS U1326 ( .A0(n1306), .A1(d_ff1_Z[63]), .B0(n1307), .B1(d_ff_Zn[63]), 
        .Y(first_mux_Z[63]) );
  AO22XLTS U1327 ( .A0(n1309), .A1(d_ff_Yn[0]), .B0(n1313), .B1(d_ff_Xn[0]), 
        .Y(mux_sal[0]) );
  AO22XLTS U1328 ( .A0(n1309), .A1(d_ff_Yn[1]), .B0(n1310), .B1(d_ff_Xn[1]), 
        .Y(mux_sal[1]) );
  AO22XLTS U1329 ( .A0(n1316), .A1(d_ff_Yn[2]), .B0(n1310), .B1(d_ff_Xn[2]), 
        .Y(mux_sal[2]) );
  AO22XLTS U1330 ( .A0(n1309), .A1(d_ff_Yn[3]), .B0(n1310), .B1(d_ff_Xn[3]), 
        .Y(mux_sal[3]) );
  AO22XLTS U1331 ( .A0(n1316), .A1(d_ff_Yn[4]), .B0(n1135), .B1(d_ff_Xn[4]), 
        .Y(mux_sal[4]) );
  AO22XLTS U1332 ( .A0(n1309), .A1(d_ff_Yn[5]), .B0(n1135), .B1(d_ff_Xn[5]), 
        .Y(mux_sal[5]) );
  AO22XLTS U1333 ( .A0(n1316), .A1(d_ff_Yn[6]), .B0(n1135), .B1(d_ff_Xn[6]), 
        .Y(mux_sal[6]) );
  AO22XLTS U1334 ( .A0(n1309), .A1(d_ff_Yn[7]), .B0(n1135), .B1(d_ff_Xn[7]), 
        .Y(mux_sal[7]) );
  AO22XLTS U1335 ( .A0(n1309), .A1(d_ff_Yn[8]), .B0(n1135), .B1(d_ff_Xn[8]), 
        .Y(mux_sal[8]) );
  AO22XLTS U1336 ( .A0(n1316), .A1(d_ff_Yn[9]), .B0(n1135), .B1(d_ff_Xn[9]), 
        .Y(mux_sal[9]) );
  AO22XLTS U1337 ( .A0(n1309), .A1(d_ff_Yn[10]), .B0(n1135), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U1338 ( .A0(n1309), .A1(d_ff_Yn[11]), .B0(n1135), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U1339 ( .A0(n1316), .A1(d_ff_Yn[12]), .B0(n1135), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  INVX4TS U1340 ( .A(n1310), .Y(n1311) );
  AO22XLTS U1341 ( .A0(n1311), .A1(d_ff_Yn[13]), .B0(n1135), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U1342 ( .A0(n1311), .A1(d_ff_Yn[14]), .B0(n1135), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  BUFX3TS U1343 ( .A(n1310), .Y(n1314) );
  AO22XLTS U1344 ( .A0(n1311), .A1(d_ff_Yn[15]), .B0(n1314), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U1345 ( .A0(n1311), .A1(d_ff_Yn[16]), .B0(n1314), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U1346 ( .A0(n1311), .A1(d_ff_Yn[17]), .B0(n1314), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U1347 ( .A0(n1311), .A1(d_ff_Yn[18]), .B0(n1314), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U1348 ( .A0(n1311), .A1(d_ff_Yn[19]), .B0(n1314), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U1349 ( .A0(n1311), .A1(d_ff_Yn[20]), .B0(n1314), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U1350 ( .A0(n1311), .A1(d_ff_Yn[21]), .B0(n1314), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U1351 ( .A0(n1311), .A1(d_ff_Yn[22]), .B0(n1314), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U1352 ( .A0(n1311), .A1(d_ff_Yn[23]), .B0(n1314), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U1353 ( .A0(n1311), .A1(d_ff_Yn[24]), .B0(n1314), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U1354 ( .A0(n1311), .A1(d_ff_Yn[25]), .B0(n1314), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  BUFX4TS U1355 ( .A(n1310), .Y(n1315) );
  AO22XLTS U1356 ( .A0(n1311), .A1(d_ff_Yn[26]), .B0(n1315), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  INVX2TS U1357 ( .A(n1310), .Y(n1316) );
  AO22XLTS U1358 ( .A0(n1309), .A1(d_ff_Yn[27]), .B0(n1315), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U1359 ( .A0(n1309), .A1(d_ff_Yn[28]), .B0(n1310), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U1360 ( .A0(n1309), .A1(d_ff_Yn[29]), .B0(n1135), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U1361 ( .A0(n1309), .A1(d_ff_Yn[30]), .B0(n1135), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U1362 ( .A0(n1316), .A1(d_ff_Yn[31]), .B0(n1313), .B1(d_ff_Xn[31]), 
        .Y(mux_sal[31]) );
  AO22XLTS U1363 ( .A0(n1316), .A1(d_ff_Yn[32]), .B0(n1135), .B1(d_ff_Xn[32]), 
        .Y(mux_sal[32]) );
  AO22XLTS U1364 ( .A0(n1311), .A1(d_ff_Yn[33]), .B0(n1315), .B1(d_ff_Xn[33]), 
        .Y(mux_sal[33]) );
  AO22XLTS U1365 ( .A0(n1309), .A1(d_ff_Yn[34]), .B0(n1315), .B1(d_ff_Xn[34]), 
        .Y(mux_sal[34]) );
  AO22XLTS U1366 ( .A0(n1312), .A1(d_ff_Yn[35]), .B0(n1315), .B1(d_ff_Xn[35]), 
        .Y(mux_sal[35]) );
  AO22XLTS U1367 ( .A0(n1312), .A1(d_ff_Yn[36]), .B0(n1315), .B1(d_ff_Xn[36]), 
        .Y(mux_sal[36]) );
  AO22XLTS U1368 ( .A0(n1312), .A1(d_ff_Yn[37]), .B0(n1315), .B1(d_ff_Xn[37]), 
        .Y(mux_sal[37]) );
  AO22XLTS U1369 ( .A0(n1312), .A1(d_ff_Yn[38]), .B0(n1315), .B1(d_ff_Xn[38]), 
        .Y(mux_sal[38]) );
  AO22XLTS U1370 ( .A0(n1312), .A1(d_ff_Yn[39]), .B0(n1315), .B1(d_ff_Xn[39]), 
        .Y(mux_sal[39]) );
  AO22XLTS U1371 ( .A0(n1312), .A1(d_ff_Yn[40]), .B0(n1315), .B1(d_ff_Xn[40]), 
        .Y(mux_sal[40]) );
  AO22XLTS U1372 ( .A0(n1312), .A1(d_ff_Yn[41]), .B0(n1315), .B1(d_ff_Xn[41]), 
        .Y(mux_sal[41]) );
  AO22XLTS U1373 ( .A0(n1312), .A1(d_ff_Yn[42]), .B0(n1315), .B1(d_ff_Xn[42]), 
        .Y(mux_sal[42]) );
  AO22XLTS U1374 ( .A0(n1312), .A1(d_ff_Yn[43]), .B0(n1315), .B1(d_ff_Xn[43]), 
        .Y(mux_sal[43]) );
  AO22XLTS U1375 ( .A0(n1312), .A1(d_ff_Yn[44]), .B0(n1315), .B1(d_ff_Xn[44]), 
        .Y(mux_sal[44]) );
  AO22XLTS U1376 ( .A0(n1312), .A1(d_ff_Yn[45]), .B0(n1315), .B1(d_ff_Xn[45]), 
        .Y(mux_sal[45]) );
  AO22XLTS U1377 ( .A0(n1312), .A1(d_ff_Yn[46]), .B0(n1315), .B1(d_ff_Xn[46]), 
        .Y(mux_sal[46]) );
  AO22XLTS U1378 ( .A0(n1312), .A1(d_ff_Yn[47]), .B0(n1315), .B1(d_ff_Xn[47]), 
        .Y(mux_sal[47]) );
  AO22XLTS U1379 ( .A0(n1312), .A1(d_ff_Yn[48]), .B0(n1314), .B1(d_ff_Xn[48]), 
        .Y(mux_sal[48]) );
  AO22XLTS U1380 ( .A0(n1312), .A1(d_ff_Yn[49]), .B0(n1135), .B1(d_ff_Xn[49]), 
        .Y(mux_sal[49]) );
  AO22XLTS U1381 ( .A0(n1312), .A1(d_ff_Yn[50]), .B0(n1314), .B1(d_ff_Xn[50]), 
        .Y(mux_sal[50]) );
  AO22XLTS U1382 ( .A0(n1312), .A1(d_ff_Yn[51]), .B0(n1135), .B1(d_ff_Xn[51]), 
        .Y(mux_sal[51]) );
  AO22XLTS U1383 ( .A0(n1312), .A1(d_ff_Yn[52]), .B0(n1313), .B1(d_ff_Xn[52]), 
        .Y(mux_sal[52]) );
  AO22XLTS U1384 ( .A0(n1312), .A1(d_ff_Yn[53]), .B0(n1313), .B1(d_ff_Xn[53]), 
        .Y(mux_sal[53]) );
  AO22XLTS U1385 ( .A0(n1312), .A1(d_ff_Yn[54]), .B0(n1313), .B1(d_ff_Xn[54]), 
        .Y(mux_sal[54]) );
  AO22XLTS U1386 ( .A0(n1309), .A1(d_ff_Yn[55]), .B0(n1313), .B1(d_ff_Xn[55]), 
        .Y(mux_sal[55]) );
  AO22XLTS U1387 ( .A0(n1316), .A1(d_ff_Yn[56]), .B0(n1313), .B1(d_ff_Xn[56]), 
        .Y(mux_sal[56]) );
  AO22XLTS U1388 ( .A0(n1316), .A1(d_ff_Yn[57]), .B0(n1314), .B1(d_ff_Xn[57]), 
        .Y(mux_sal[57]) );
  AO22XLTS U1389 ( .A0(n1309), .A1(d_ff_Yn[58]), .B0(n1135), .B1(d_ff_Xn[58]), 
        .Y(mux_sal[58]) );
  AO22XLTS U1390 ( .A0(n1309), .A1(d_ff_Yn[59]), .B0(n1315), .B1(d_ff_Xn[59]), 
        .Y(mux_sal[59]) );
  AO22XLTS U1391 ( .A0(n1316), .A1(d_ff_Yn[60]), .B0(n1315), .B1(d_ff_Xn[60]), 
        .Y(mux_sal[60]) );
  AO22XLTS U1392 ( .A0(n1309), .A1(d_ff_Yn[61]), .B0(n1135), .B1(d_ff_Xn[61]), 
        .Y(mux_sal[61]) );
  AO22XLTS U1393 ( .A0(n1309), .A1(d_ff_Yn[62]), .B0(n1315), .B1(d_ff_Xn[62]), 
        .Y(mux_sal[62]) );
  NOR2BX1TS U1394 ( .AN(d_ff_Xn[1]), .B(n1317), .Y(first_mux_X[1]) );
  NOR2BX1TS U1395 ( .AN(d_ff_Xn[2]), .B(n1320), .Y(first_mux_X[2]) );
  NOR2BX1TS U1396 ( .AN(d_ff_Xn[4]), .B(n1318), .Y(first_mux_X[4]) );
  NOR2BX1TS U1397 ( .AN(d_ff_Xn[5]), .B(n1306), .Y(first_mux_X[5]) );
  NOR2BX1TS U1398 ( .AN(d_ff_Xn[10]), .B(n1319), .Y(first_mux_X[10]) );
  NOR2BX1TS U1399 ( .AN(d_ff_Xn[12]), .B(n1308), .Y(first_mux_X[12]) );
  NOR2BX1TS U1400 ( .AN(d_ff_Xn[15]), .B(n1138), .Y(first_mux_X[15]) );
  NOR2BX1TS U1401 ( .AN(d_ff_Xn[16]), .B(n1138), .Y(first_mux_X[16]) );
  NOR2BX1TS U1402 ( .AN(d_ff_Xn[17]), .B(n1308), .Y(first_mux_X[17]) );
  NOR2BX1TS U1403 ( .AN(d_ff_Xn[18]), .B(n1299), .Y(first_mux_X[18]) );
  NOR2BX1TS U1404 ( .AN(d_ff_Xn[20]), .B(n1306), .Y(first_mux_X[20]) );
  NOR2BX1TS U1405 ( .AN(d_ff_Xn[21]), .B(n1319), .Y(first_mux_X[21]) );
  NOR2BX1TS U1406 ( .AN(d_ff_Xn[22]), .B(n1138), .Y(first_mux_X[22]) );
  NOR2BX1TS U1407 ( .AN(d_ff_Xn[23]), .B(n1308), .Y(first_mux_X[23]) );
  NOR2BX1TS U1408 ( .AN(d_ff_Xn[25]), .B(n1306), .Y(first_mux_X[25]) );
  NOR2BX1TS U1409 ( .AN(d_ff_Xn[27]), .B(n1317), .Y(first_mux_X[27]) );
  NOR2BX1TS U1410 ( .AN(d_ff_Xn[30]), .B(n1300), .Y(first_mux_X[30]) );
  NOR2BX1TS U1411 ( .AN(d_ff_Xn[33]), .B(n1302), .Y(first_mux_X[33]) );
  NOR2BX1TS U1412 ( .AN(d_ff_Xn[37]), .B(n1319), .Y(first_mux_X[37]) );
  NOR2BX1TS U1413 ( .AN(d_ff_Xn[38]), .B(n1299), .Y(first_mux_X[38]) );
  NOR2BX1TS U1414 ( .AN(d_ff_Xn[40]), .B(n1308), .Y(first_mux_X[40]) );
  NOR2BX1TS U1415 ( .AN(d_ff_Xn[44]), .B(n1317), .Y(first_mux_X[44]) );
  NOR2BX1TS U1416 ( .AN(d_ff_Xn[47]), .B(n1320), .Y(first_mux_X[47]) );
  NOR2BX1TS U1417 ( .AN(d_ff_Xn[50]), .B(n1308), .Y(first_mux_X[50]) );
  NOR2BX1TS U1418 ( .AN(d_ff_Xn[51]), .B(n1317), .Y(first_mux_X[51]) );
  NOR2BX1TS U1419 ( .AN(d_ff_Xn[52]), .B(n1320), .Y(first_mux_X[52]) );
  NOR2BX1TS U1420 ( .AN(d_ff_Xn[62]), .B(n1308), .Y(first_mux_X[62]) );
  NOR2BX1TS U1421 ( .AN(d_ff_Xn[63]), .B(n1317), .Y(first_mux_X[63]) );
  NOR2BX1TS U1422 ( .AN(beg_fsm_cordic), .B(n1321), .Y(
        inst_CORDIC_FSM_v3_state_next[1]) );
  OAI2BB1X1TS U1423 ( .A0N(n985), .A1N(enab_cont_iter), .B0(n1322), .Y(
        inst_CORDIC_FSM_v3_state_next[2]) );
  OAI22X1TS U1424 ( .A0(enab_d_ff4_Zn), .A1(n1325), .B0(n1324), .B1(n1323), 
        .Y(inst_CORDIC_FSM_v3_state_next[5]) );
  NOR2BX1TS U1425 ( .AN(enab_d_ff4_Zn), .B(n1325), .Y(
        inst_CORDIC_FSM_v3_state_next[6]) );
  OAI22X1TS U1426 ( .A0(ack_cordic), .A1(n1327), .B0(n985), .B1(n1326), .Y(
        inst_CORDIC_FSM_v3_state_next[7]) );
  XOR2XLTS U1427 ( .A(d_ff3_sign_out), .B(cont_var_out[0]), .Y(op_add_subt) );
  AO22XLTS U1428 ( .A0(n1348), .A1(d_ff3_sh_y_out[63]), .B0(n1229), .B1(
        d_ff3_sh_x_out[63]), .Y(add_subt_dataB[63]) );
  AO22XLTS U1429 ( .A0(n1340), .A1(d_ff3_sh_y_out[62]), .B0(n1286), .B1(
        d_ff3_sh_x_out[62]), .Y(add_subt_dataB[62]) );
  AOI22X1TS U1430 ( .A0(n1342), .A1(d_ff3_sh_y_out[61]), .B0(n1360), .B1(
        d_ff3_sh_x_out[61]), .Y(n1328) );
  NAND2X2TS U1431 ( .A(n1285), .B(d_ff3_LUT_out[48]), .Y(n1338) );
  NAND2X1TS U1432 ( .A(n1328), .B(n1338), .Y(add_subt_dataB[61]) );
  AOI22X1TS U1433 ( .A0(n1340), .A1(d_ff3_sh_y_out[60]), .B0(n1229), .B1(
        d_ff3_sh_x_out[60]), .Y(n1330) );
  NAND2X1TS U1434 ( .A(n1330), .B(n1338), .Y(add_subt_dataB[60]) );
  AOI22X1TS U1435 ( .A0(n1342), .A1(d_ff3_sh_y_out[59]), .B0(n1286), .B1(
        d_ff3_sh_x_out[59]), .Y(n1331) );
  NAND2X1TS U1436 ( .A(n1331), .B(n1338), .Y(add_subt_dataB[59]) );
  AOI22X1TS U1437 ( .A0(n1342), .A1(d_ff3_sh_y_out[58]), .B0(n1229), .B1(
        d_ff3_sh_x_out[58]), .Y(n1332) );
  NAND2X1TS U1438 ( .A(n1332), .B(n1338), .Y(add_subt_dataB[58]) );
  AOI22X1TS U1439 ( .A0(n1348), .A1(d_ff3_sh_y_out[57]), .B0(n1229), .B1(
        d_ff3_sh_x_out[57]), .Y(n1333) );
  NAND2X1TS U1440 ( .A(n1333), .B(n1338), .Y(add_subt_dataB[57]) );
  AOI22X1TS U1441 ( .A0(n1329), .A1(d_ff3_sh_y_out[51]), .B0(n1360), .B1(
        d_ff3_sh_x_out[51]), .Y(n1334) );
  NAND2X1TS U1442 ( .A(n1334), .B(n1338), .Y(add_subt_dataB[51]) );
  AOI22X1TS U1443 ( .A0(n1329), .A1(d_ff3_sh_y_out[49]), .B0(n1336), .B1(
        d_ff3_sh_x_out[49]), .Y(n1335) );
  NAND2X1TS U1444 ( .A(n1285), .B(d_ff3_LUT_out[44]), .Y(n1344) );
  NAND2X1TS U1445 ( .A(n1335), .B(n1344), .Y(add_subt_dataB[49]) );
  AOI22X1TS U1446 ( .A0(n1348), .A1(d_ff3_sh_y_out[48]), .B0(n1336), .B1(
        d_ff3_sh_x_out[48]), .Y(n1339) );
  NAND2X1TS U1447 ( .A(n1339), .B(n1338), .Y(add_subt_dataB[48]) );
  AOI22X1TS U1448 ( .A0(n1329), .A1(d_ff3_sh_y_out[47]), .B0(n1229), .B1(
        d_ff3_sh_x_out[47]), .Y(n1341) );
  OAI2BB1X1TS U1449 ( .A0N(n1363), .A1N(d_ff3_LUT_out[42]), .B0(n1341), .Y(
        add_subt_dataB[47]) );
  AOI22X1TS U1450 ( .A0(n1329), .A1(d_ff3_sh_y_out[46]), .B0(n1357), .B1(
        d_ff3_sh_x_out[46]), .Y(n1343) );
  NAND2X1TS U1451 ( .A(n1343), .B(n1344), .Y(add_subt_dataB[46]) );
  AOI22X1TS U1452 ( .A0(n1361), .A1(d_ff3_sh_y_out[44]), .B0(n1357), .B1(
        d_ff3_sh_x_out[44]), .Y(n1345) );
  NAND2X1TS U1453 ( .A(n1345), .B(n1344), .Y(add_subt_dataB[44]) );
  AOI22X1TS U1454 ( .A0(n1342), .A1(d_ff3_sh_y_out[43]), .B0(n1286), .B1(
        d_ff3_sh_x_out[43]), .Y(n1347) );
  OAI2BB1X1TS U1455 ( .A0N(n1363), .A1N(d_ff3_LUT_out[34]), .B0(n1347), .Y(
        add_subt_dataB[43]) );
  AOI22X1TS U1456 ( .A0(n1348), .A1(d_ff3_sh_y_out[42]), .B0(n1357), .B1(
        d_ff3_sh_x_out[42]), .Y(n1349) );
  OAI2BB1X1TS U1457 ( .A0N(n1363), .A1N(d_ff3_LUT_out[42]), .B0(n1349), .Y(
        add_subt_dataB[42]) );
  AOI22X1TS U1458 ( .A0(n1361), .A1(d_ff3_sh_y_out[40]), .B0(n1357), .B1(
        d_ff3_sh_x_out[40]), .Y(n1351) );
  NAND2X1TS U1459 ( .A(n1285), .B(d_ff3_LUT_out[28]), .Y(n1358) );
  NAND2X1TS U1460 ( .A(n1351), .B(n1358), .Y(add_subt_dataB[40]) );
  AOI22X1TS U1461 ( .A0(n1361), .A1(d_ff3_sh_y_out[38]), .B0(n1357), .B1(
        d_ff3_sh_x_out[38]), .Y(n1352) );
  OAI2BB1X1TS U1462 ( .A0N(n1363), .A1N(d_ff3_LUT_out[32]), .B0(n1352), .Y(
        add_subt_dataB[38]) );
  AOI22X1TS U1463 ( .A0(n1361), .A1(d_ff3_sh_y_out[36]), .B0(n1357), .B1(
        d_ff3_sh_x_out[36]), .Y(n1353) );
  NAND2X1TS U1464 ( .A(n1353), .B(n1358), .Y(add_subt_dataB[36]) );
  AOI22X1TS U1465 ( .A0(n1361), .A1(d_ff3_sh_y_out[34]), .B0(n1357), .B1(
        d_ff3_sh_x_out[34]), .Y(n1354) );
  OAI2BB1X1TS U1466 ( .A0N(n1363), .A1N(d_ff3_LUT_out[34]), .B0(n1354), .Y(
        add_subt_dataB[34]) );
  AOI22X1TS U1467 ( .A0(n1361), .A1(d_ff3_sh_y_out[32]), .B0(n1357), .B1(
        d_ff3_sh_x_out[32]), .Y(n1355) );
  OAI2BB1X1TS U1468 ( .A0N(n1363), .A1N(d_ff3_LUT_out[32]), .B0(n1355), .Y(
        add_subt_dataB[32]) );
  AOI22X1TS U1469 ( .A0(n1361), .A1(d_ff3_sh_y_out[30]), .B0(n1357), .B1(
        d_ff3_sh_x_out[30]), .Y(n1356) );
  OAI2BB1X1TS U1470 ( .A0N(n1363), .A1N(d_ff3_LUT_out[4]), .B0(n1356), .Y(
        add_subt_dataB[30]) );
  AOI22X1TS U1471 ( .A0(n1361), .A1(d_ff3_sh_y_out[28]), .B0(n1357), .B1(
        d_ff3_sh_x_out[28]), .Y(n1359) );
  NAND2X1TS U1472 ( .A(n1359), .B(n1358), .Y(add_subt_dataB[28]) );
  AOI22X1TS U1473 ( .A0(n1361), .A1(d_ff3_sh_y_out[4]), .B0(n1229), .B1(
        d_ff3_sh_x_out[4]), .Y(n1362) );
  OAI2BB1X1TS U1474 ( .A0N(n1363), .A1N(d_ff3_LUT_out[4]), .B0(n1362), .Y(
        add_subt_dataB[4]) );
  NAND2X1TS U1475 ( .A(n1364), .B(n1003), .Y(n996) );
  OAI22X1TS U1476 ( .A0(n1134), .A1(n1145), .B0(n1366), .B1(n1365), .Y(n995)
         );
  AO21XLTS U1477 ( .A0(n1372), .A1(n1145), .B0(n1367), .Y(n993) );
  AOI22X1TS U1478 ( .A0(cont_iter_out[1]), .A1(n1144), .B0(n1368), .B1(n1134), 
        .Y(n992) );
  OAI22X1TS U1479 ( .A0(n1378), .A1(n1398), .B0(n1402), .B1(n1134), .Y(n987)
         );
  AOI22X1TS U1480 ( .A0(cont_iter_out[2]), .A1(n1134), .B0(n1370), .B1(n1369), 
        .Y(n1374) );
  NAND2X1TS U1481 ( .A(n1374), .B(n985), .Y(n986) );
  NAND2X1TS U1482 ( .A(n1378), .B(n1145), .Y(n1373) );
  AOI32X1TS U1483 ( .A0(n1398), .A1(n1373), .A2(n1372), .B0(n1371), .B1(n1373), 
        .Y(n982) );
  NAND2X1TS U1484 ( .A(n1374), .B(n1373), .Y(n981) );
  OAI22X1TS U1485 ( .A0(n1376), .A1(n1375), .B0(n1145), .B1(n988), .Y(n979) );
  NAND2X1TS U1486 ( .A(n1402), .B(n1382), .Y(n977) );
  NAND2X1TS U1487 ( .A(n1144), .B(n1134), .Y(n1002) );
  NAND2X1TS U1488 ( .A(n1144), .B(n1377), .Y(n975) );
  NAND2X1TS U1489 ( .A(n1378), .B(n1144), .Y(n974) );
  AO21XLTS U1490 ( .A0(cont_iter_out[1]), .A1(n1145), .B0(n1380), .Y(n973) );
  NAND2X1TS U1491 ( .A(n1382), .B(n1381), .Y(n971) );
  NAND2X1TS U1492 ( .A(cont_iter_out[1]), .B(n1144), .Y(n1001) );
  AOI22X1TS U1493 ( .A0(n1385), .A1(n1399), .B0(cont_var_out[0]), .B1(n1384), 
        .Y(n960) );
  XOR2XLTS U1495 ( .A(d_ff2_Y[61]), .B(n1390), .Y(sh_exp_y[9]) );
  AO21XLTS U1496 ( .A0(d_ff2_Y[60]), .A1(n1386), .B0(n1390), .Y(sh_exp_y[8])
         );
  AO21XLTS U1497 ( .A0(d_ff2_Y[58]), .A1(n1388), .B0(n1387), .Y(sh_exp_y[6])
         );
  AO21XLTS U1498 ( .A0(intadd_464_n1), .A1(d_ff2_Y[56]), .B0(n1389), .Y(
        sh_exp_y[4]) );
  NOR2BX1TS U1499 ( .AN(n1390), .B(d_ff2_Y[61]), .Y(n1391) );
  XOR2XLTS U1500 ( .A(n1391), .B(d_ff2_Y[62]), .Y(sh_exp_y[10]) );
  XOR2XLTS U1501 ( .A(d_ff2_X[61]), .B(n1396), .Y(sh_exp_x[9]) );
  AO21XLTS U1502 ( .A0(d_ff2_X[60]), .A1(n1392), .B0(n1396), .Y(sh_exp_x[8])
         );
  AO21XLTS U1503 ( .A0(d_ff2_X[58]), .A1(n1394), .B0(n1393), .Y(sh_exp_x[6])
         );
  AO21XLTS U1504 ( .A0(intadd_463_n1), .A1(d_ff2_X[56]), .B0(n1395), .Y(
        sh_exp_x[4]) );
  NOR2BX1TS U1505 ( .AN(n1396), .B(d_ff2_X[61]), .Y(n1397) );
  XOR2XLTS U1506 ( .A(n1397), .B(d_ff2_X[62]), .Y(sh_exp_x[10]) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule

