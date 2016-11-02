/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Nov  1 20:38:58 2016
/////////////////////////////////////////////////////////////


module d_ff_en_W2 ( clk, rst, enable, D, Q );
  input [1:0] D;
  output [1:0] Q;
  input clk, rst, enable;
  wire   n1;

  DFFRX1TS Q_reg_0_ ( .D(D[0]), .CK(clk), .RN(n1), .Q(Q[0]) );
  DFFRX1TS Q_reg_1_ ( .D(D[1]), .CK(clk), .RN(n1), .Q(Q[1]) );
  INVX2TS U2 ( .A(rst), .Y(n1) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W32_1 ( clk, rst, enable, D, Q, OUT4 );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, enable;
  output OUT4;
  wire   n31;
  assign Q[22] = D[22];
  assign Q[21] = D[21];
  assign Q[20] = D[20];
  assign Q[19] = D[19];
  assign Q[18] = D[18];
  assign Q[17] = D[17];
  assign Q[16] = D[16];
  assign Q[15] = D[15];
  assign Q[14] = D[14];
  assign Q[13] = D[13];
  assign Q[12] = D[12];
  assign Q[11] = D[11];
  assign Q[10] = D[10];
  assign Q[9] = D[9];
  assign Q[8] = D[8];
  assign Q[7] = D[7];
  assign Q[6] = D[6];
  assign Q[5] = D[5];
  assign Q[4] = D[4];
  assign Q[3] = D[3];
  assign Q[2] = D[2];
  assign Q[1] = D[1];
  assign Q[0] = D[0];

  DFFRXLTS Q_reg_31_ ( .D(D[31]), .CK(clk), .RN(n31), .Q(Q[31]) );
  INVX2TS U5 ( .A(rst), .Y(OUT4) );
  INVX2TS U31 ( .A(rst), .Y(n31) );
  DFFRX1TS Q_reg_29_ ( .D(D[29]), .CK(clk), .RN(n31), .Q(Q[29]) );
  DFFRX1TS Q_reg_30_ ( .D(D[30]), .CK(clk), .RN(n31), .Q(Q[30]) );
  DFFRX1TS Q_reg_27_ ( .D(D[27]), .CK(clk), .RN(n31), .Q(Q[27]) );
  DFFRX1TS Q_reg_23_ ( .D(D[23]), .CK(clk), .RN(n31), .Q(Q[23]) );
  DFFRX1TS Q_reg_28_ ( .D(D[28]), .CK(clk), .RN(n31), .Q(Q[28]) );
  DFFRX1TS Q_reg_25_ ( .D(D[25]), .CK(clk), .RN(n31), .Q(Q[25]) );
  DFFRX1TS Q_reg_26_ ( .D(D[26]), .CK(clk), .RN(OUT4), .Q(Q[26]) );
  DFFRXLTS Q_reg_24_ ( .D(D[24]), .CK(clk), .RN(n31), .Q(Q[24]) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W1 ( clk, rst, enable, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, enable;
  wire   n1;

  INVX2TS U2 ( .A(rst), .Y(n1) );
  DFFRXLTS Q_reg_0_ ( .D(D[0]), .CK(clk), .RN(n1), .Q(Q[0]) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module demux_1x3_1 ( data, select, ch1, ch2, ch3 );
  input [1:0] select;
  input data;
  output ch1, ch2, ch3;
  wire   n1;

  CLKAND2X2TS U2 ( .A(select[0]), .B(data), .Y(ch2) );
  NOR3BX1TS U3 ( .AN(data), .B(select[0]), .C(select[1]), .Y(ch1) );
  NOR2BX1TS U4 ( .AN(data), .B(select[0]), .Y(n1) );
  CLKAND2X2TS U5 ( .A(n1), .B(select[1]), .Y(ch3) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module demux_1x3_0 ( data, select, ch1, ch2, ch3 );
  input [1:0] select;
  input data;
  output ch1, ch2, ch3;
  wire   n1;

  INVX1TS U2 ( .A(select[0]), .Y(n1) );
  NOR2BX1TS U3 ( .AN(data), .B(n1), .Y(ch2) );
  AND3X1TS U4 ( .A(n1), .B(data), .C(select[1]), .Y(ch3) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module deco_op ( operation, op_mod_add_subt, op_mod_cordic );
  input [1:0] operation;
  output op_mod_add_subt, op_mod_cordic;


  NOR2BX1TS U3 ( .AN(operation[0]), .B(operation[1]), .Y(op_mod_add_subt) );
  CLKAND2X2TS U4 ( .A(operation[0]), .B(operation[1]), .Y(op_mod_cordic) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_3 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  AO22X1TS U1 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
  INVX2TS U2 ( .A(select), .Y(n1) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W32_1 ( select, ch_0, ch_1, data_out );
  input [31:0] ch_0;
  input [31:0] ch_1;
  output [31:0] data_out;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7;

  AO22XLTS U1 ( .A0(select), .A1(ch_1[31]), .B0(n7), .B1(ch_0[31]), .Y(
        data_out[31]) );
  AO22XLTS U2 ( .A0(select), .A1(ch_1[0]), .B0(n4), .B1(ch_0[0]), .Y(
        data_out[0]) );
  AO22XLTS U3 ( .A0(n3), .A1(ch_1[15]), .B0(n5), .B1(ch_0[15]), .Y(
        data_out[15]) );
  AO22XLTS U4 ( .A0(select), .A1(ch_1[18]), .B0(n5), .B1(ch_0[18]), .Y(
        data_out[18]) );
  AO22XLTS U5 ( .A0(select), .A1(ch_1[14]), .B0(n5), .B1(ch_0[14]), .Y(
        data_out[14]) );
  AO22XLTS U6 ( .A0(n3), .A1(ch_1[5]), .B0(n4), .B1(ch_0[5]), .Y(data_out[5])
         );
  AO22XLTS U7 ( .A0(n2), .A1(ch_1[13]), .B0(n5), .B1(ch_0[13]), .Y(
        data_out[13]) );
  AO22XLTS U8 ( .A0(n3), .A1(ch_1[17]), .B0(n5), .B1(ch_0[17]), .Y(
        data_out[17]) );
  AO22XLTS U9 ( .A0(n1), .A1(ch_1[11]), .B0(n5), .B1(ch_0[11]), .Y(
        data_out[11]) );
  AO22XLTS U10 ( .A0(n1), .A1(ch_1[3]), .B0(n4), .B1(ch_0[3]), .Y(data_out[3])
         );
  AO22XLTS U11 ( .A0(n1), .A1(ch_1[4]), .B0(n4), .B1(ch_0[4]), .Y(data_out[4])
         );
  AO22XLTS U12 ( .A0(n3), .A1(ch_1[1]), .B0(n4), .B1(ch_0[1]), .Y(data_out[1])
         );
  AO22XLTS U13 ( .A0(n2), .A1(ch_1[2]), .B0(n4), .B1(ch_0[2]), .Y(data_out[2])
         );
  AO22XLTS U14 ( .A0(n2), .A1(ch_1[28]), .B0(n6), .B1(ch_0[28]), .Y(
        data_out[28]) );
  AO22XLTS U15 ( .A0(n1), .A1(ch_1[22]), .B0(n6), .B1(ch_0[22]), .Y(
        data_out[22]) );
  AO22XLTS U16 ( .A0(n2), .A1(ch_1[6]), .B0(n4), .B1(ch_0[6]), .Y(data_out[6])
         );
  AO22XLTS U17 ( .A0(n2), .A1(ch_1[16]), .B0(n5), .B1(ch_0[16]), .Y(
        data_out[16]) );
  AO22XLTS U18 ( .A0(n1), .A1(ch_1[9]), .B0(n4), .B1(ch_0[9]), .Y(data_out[9])
         );
  AO22XLTS U19 ( .A0(n2), .A1(ch_1[8]), .B0(n4), .B1(ch_0[8]), .Y(data_out[8])
         );
  AO22XLTS U20 ( .A0(n2), .A1(ch_1[21]), .B0(n6), .B1(ch_0[21]), .Y(
        data_out[21]) );
  AO22XLTS U21 ( .A0(n3), .A1(ch_1[20]), .B0(n6), .B1(ch_0[20]), .Y(
        data_out[20]) );
  AO22XLTS U22 ( .A0(select), .A1(ch_1[27]), .B0(n6), .B1(ch_0[27]), .Y(
        data_out[27]) );
  AO22XLTS U23 ( .A0(n3), .A1(ch_1[10]), .B0(n5), .B1(ch_0[10]), .Y(
        data_out[10]) );
  AO22XLTS U24 ( .A0(select), .A1(ch_1[19]), .B0(n5), .B1(ch_0[19]), .Y(
        data_out[19]) );
  AO22XLTS U25 ( .A0(n2), .A1(ch_1[12]), .B0(n5), .B1(ch_0[12]), .Y(
        data_out[12]) );
  AO22XLTS U26 ( .A0(n3), .A1(ch_1[7]), .B0(n4), .B1(ch_0[7]), .Y(data_out[7])
         );
  AO22XLTS U27 ( .A0(n3), .A1(ch_1[30]), .B0(n7), .B1(ch_0[30]), .Y(
        data_out[30]) );
  AO22XLTS U28 ( .A0(n2), .A1(ch_1[25]), .B0(n6), .B1(ch_0[25]), .Y(
        data_out[25]) );
  AO22XLTS U29 ( .A0(n3), .A1(ch_1[23]), .B0(n6), .B1(ch_0[23]), .Y(
        data_out[23]) );
  AO22XLTS U30 ( .A0(n2), .A1(ch_1[24]), .B0(n6), .B1(ch_0[24]), .Y(
        data_out[24]) );
  AO22XLTS U31 ( .A0(n3), .A1(ch_1[29]), .B0(n6), .B1(ch_0[29]), .Y(
        data_out[29]) );
  AO22XLTS U32 ( .A0(n1), .A1(ch_1[26]), .B0(n6), .B1(ch_0[26]), .Y(
        data_out[26]) );
  CLKBUFX2TS U33 ( .A(select), .Y(n1) );
  BUFX3TS U34 ( .A(select), .Y(n2) );
  BUFX3TS U35 ( .A(select), .Y(n3) );
  INVX2TS U36 ( .A(n1), .Y(n7) );
  BUFX3TS U37 ( .A(n7), .Y(n4) );
  BUFX3TS U38 ( .A(n7), .Y(n5) );
  BUFX3TS U39 ( .A(n7), .Y(n6) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module FPU_PIPELINED_FPADDSUB_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_OP, 
        Data_X, Data_Y, add_subt, busy, overflow_flag, underflow_flag, 
        zero_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  output [31:0] final_result_ieee;
  input clk, rst, beg_OP, add_subt;
  output busy, overflow_flag, underflow_flag, zero_flag, ready;
  wire   intAS, SIGN_FLAG_EXP, OP_FLAG_EXP, SIGN_FLAG_SHT1, OP_FLAG_SHT1,
         SIGN_FLAG_SHT2, OP_FLAG_SHT2, SIGN_FLAG_SHT1SHT2, SIGN_FLAG_NRM,
         DmP_mant_SFG_SWR_25_, SIGN_FLAG_SFG, OP_FLAG_SFG,
         inst_FSM_INPUT_ENABLE_state_next_1_, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n557, n558, n559, n560, n561,
         n562, n563, n564, n566, n567, n568, n569, n570, n571, n572, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n632, n633, n634, n635, n636, n637, n638, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n765, n766,
         n768, n769, n771, n772, n774, n775, n777, n778, n780, n781, n783,
         n784, n786, n787, n788, n790, n791, n792, n793, n794, n795, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n814, n815, n816, n817, n818, n819, n820,
         n828, n829, n830, n831, n832, n833, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861,
         n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872,
         n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n892, n893, n894,
         n895, n896, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n908, n909, n910, n911, n912, n913, n914, n915, n916,
         n917, n918, n919, n920, n921, n922, n923, n924, n925, n926, n927,
         n928, n929, n930, n931, n932, n933, n934, n935, n936, n937, n938,
         DP_OP_15J43_122_6956_n18, DP_OP_15J43_122_6956_n17,
         DP_OP_15J43_122_6956_n16, DP_OP_15J43_122_6956_n15,
         DP_OP_15J43_122_6956_n14, DP_OP_15J43_122_6956_n8,
         DP_OP_15J43_122_6956_n7, DP_OP_15J43_122_6956_n6,
         DP_OP_15J43_122_6956_n5, DP_OP_15J43_122_6956_n4,
         DP_OP_15J43_122_6956_n3, DP_OP_15J43_122_6956_n2,
         DP_OP_15J43_122_6956_n1, n73, n1430, n1432, n1434, n1437, n1438,
         n1439, n1441, n1442, n1445, n1446, n1447, n1452, n1458, n1459, n1461,
         n1464, n1469, n1480, n1482, n1483, n1487, n1488, n1491, n1492, n1493,
         n1499, n1502, n1505, n1506, n1509, n1510, n1514, n1516, n1517, n1520,
         n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1186, n2533,
         n2535, n2545, n2548, n2551, n2556, n2557, n2558, n2559, n2560, n2561,
         n2563, n2565, n2570, n2573, n2575, n2578, n2580, n2582, n2584, n2586,
         n2589, n2595, n2597, n2599, n3605, n3606, n3609, n3615, n3616, n3617,
         n3619, n3623, n3627, n3637, n3638, n3648, n3657, n3671, n3672, n3673,
         n3674, n3677, n3725, n1156, n1157, n4745, n4747, n4749, n4753, n4755,
         n4759, n4760, n4765, n4768, n4769, n4770, n4771, n4774, n4775, n4780,
         n4781, n4782, n4785, n4786, n4787, n4788, n4794, n4801, n4806, n4809,
         n4814, n4815, n4816, n4818, n4820, n4823, n4827, n4831, n4832, n4834,
         n4835, n4836, n4837, n4840, n4841, n4886, n4887, n1151, n1152, n1153,
         n1154, n1155, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n4888,
         n4889, n4890, n4891, n4892, n4893, n4894, n4895, n4896, n4897, n4898,
         n4899, n4900, n4901, n4902, n4903, n4904, n4905, n4906, n4907, n4908,
         n4909, n4910, n4911, n4912, n4913, n4914, n4915, n4916, n4917, n4918,
         n4919, n4920, n4921, n4922, n4923, n4924, n4925, n4926, n4927, n4928,
         n4929, n4930, n4931, n4932, n4933, n4934, n4935, n4936, n4937, n4938,
         n4939, n4940, n4941, n4942, n4943, n4944, n4945, n4946, n4947, n4948,
         n4949, n4950, n4951, n4952, n4953, n4954, n4955, n4956, n4957, n4958,
         n4959, n4960, n4961, n4962, n4963, n4964, n4965, n4966, n4967, n4968,
         n4969, n4970, n4971, n4972, n4973, n4974, n4975, n4976, n4977, n4978,
         n4979, n4980, n4981, n4982, n4983, n4984, n4985, n4986, n4987, n4988,
         n4989, n4990, n4991, n4992, n4993, n4994, n4995, n4996, n4997, n4998,
         n4999, n5000, n5001, n5002, n5003, n5004, n5005, n5006, n5007, n5008,
         n5009, n5010, n5011, n5012, n5013, n5014, n5015, n5016, n5017, n5018,
         n5019, n5020, n5021, n5022, n5023, n5024, n5025, n5026, n5027, n5028,
         n5029, n5030, n5031, n5032, n5033, n5034, n5035, n5036, n5037, n5038,
         n5039, n5040, n5041, n5042, n5043, n5044, n5045, n5046, n5047, n5048,
         n5049, n5050, n5051, n5052, n5053, n5054, n5055, n5056, n5057, n5058,
         n5059, n5060, n5061, n5062, n5063, n5064, n5065, n5066, n5067, n5068,
         n5069, n5070, n5071, n5072, n5073, n5074, n5075, n5076, n5077, n5078,
         n5079, n5080, n5081, n5082, n5083, n5084, n5085, n5086, n5087, n5088,
         n5089, n5090, n5091, n5092, n5093, n5094, n5095, n5096, n5097, n5098,
         n5099, n5100, n5101, n5102, n5103, n5104, n5105, n5106, n5107, n5108,
         n5109, n5110, n5111, n5112, n5113, n5114, n5115, n5116, n5117, n5118,
         n5119, n5120, n5121, n5122, n5123, n5124, n5125, n5126, n5127, n5128,
         n5129, n5130, n5131, n5132, n5133, n5134, n5135, n5136, n5137, n5138,
         n5139, n5140, n5141, n5142, n5143, n5144, n5145, n5146, n5147, n5148,
         n5149, n5150, n5151, n5152, n5153, n5154, n5155, n5156, n5157, n5158,
         n5159, n5160, n5161, n5162, n5163, n5164, n5165, n5166, n5167, n5168,
         n5169, n5170, n5171, n5172, n5173, n5174, n5175, n5176, n5177, n5178,
         n5179, n5180, n5181, n5182, n5183, n5184, n5185, n5186, n5187, n5188,
         n5189, n5190, n5191, n5192, n5193, n5194, n5195, n5196, n5197, n5198,
         n5199, n5200, n5201, n5202, n5203, n5204, n5205, n5206, n5207, n5208,
         n5209, n5210, n5211, n5212, n5213, n5214, n5215, n5216, n5217, n5218,
         n5219, n5220, n5221, n5222, n5223, n5224, n5225, n5226, n5227, n5228,
         n5229, n5230, n5231, n5232, n5233, n5234, n5235, n5236, n5237, n5238,
         n5239, n5240, n5241, n5242, n5243, n5244, n5245, n5246, n5247, n5248,
         n5249, n5250, n5251, n5252, n5253, n5254, n5255, n5256, n5257, n5258,
         n5259, n5260, n5261, n5262, n5263, n5264, n5265, n5266, n5267, n5268,
         n5269, n5270, n5271, n5272, n5273, n5274, n5275, n5276, n5277, n5278,
         n5279, n5280, n5281, n5282, n5283, n5284, n5285, n5286, n5287, n5288,
         n5289, n5290, n5291, n5292, n5293, n5294, n5295, n5296, n5297, n5298,
         n5299, n5300, n5301, n5302, n5303, n5304, n5305, n5306, n5307, n5308,
         n5309, n5310, n5311, n5312, n5313, n5314, n5315, n5316, n5317, n5318,
         n5319, n5320, n5321, n5322, n5323, n5324, n5325, n5326, n5327, n5328,
         n5329, n5330, n5331, n5332, n5333, n5334, n5335, n5336, n5337, n5338,
         n5339, n5340, n5341, n5342, n5343, n5344, n5345, n5346, n5347, n5348,
         n5349, n5350, n5351, n5352, n5353, n5354, n5355, n5356, n5357, n5358,
         n5359, n5360, n5361, n5362, n5363, n5364, n5365, n5366, n5367, n5368,
         n5369, n5370, n5371, n5372, n5373, n5374, n5375, n5376, n5377, n5378,
         n5379, n5380, n5381, n5382, n5383, n5384, n5385, n5386, n5387, n5388,
         n5389, n5390, n5391, n5392, n5393, n5394, n5395, n5396, n5397, n5398,
         n5399, n5400, n5401, n5402, n5403, n5404, n5405, n5406, n5407, n5408,
         n5409, n5410, n5411, n5412, n5413, n5414, n5415, n5416, n5417, n5418,
         n5419, n5420, n5421, n5422, n5423, n5424, n5425, n5426, n5427, n5428,
         n5429, n5430, n5431, n5432, n5433, n5434, n5435, n5436, n5437, n5438,
         n5439, n5440, n5441, n5442, n5443, n5444, n5445, n5446, n5447, n5448,
         n5449, n5450, n5451, n5452, n5453, n5454, n5455, n5456, n5457, n5458,
         n5459, n5460, n5461, n5462, n5463, n5464, n5465, n5466, n5467, n5468,
         n5469, n5470, n5471, n5472, n5473, n5474, n5475, n5476, n5477, n5478,
         n5479, n5480, n5481, n5482, n5483, n5484, n5485, n5486, n5487, n5488,
         n5489, n5490, n5491, n5492, n5493, n5494, n5495, n5496, n5497, n5498,
         n5499, n5500, n5501, n5502, n5503, n5504, n5505, n5506, n5507, n5508,
         n5509, n5510, n5511, n5512, n5513, n5514, n5515, n5516, n5517, n5518,
         n5519, n5520, n5521, n5522, n5523, n5524, n5525, n5526, n5527, n5528,
         n5529, n5530, n5531, n5532, n5533, n5534, n5535, n5536, n5537, n5538,
         n5539, n5540, n5541, n5542, n5543, n5544, n5545, n5546, n5547, n5548,
         n5549, n5550, n5551, n5552, n5553, n5554, n5555, n5556, n5557, n5558,
         n5559, n5560, n5561, n5562, n5563, n5564, n5565, n5566, n5567, n5568,
         n5569, n5570, n5571, n5572, n5573, n5574, n5575, n5576, n5577, n5578,
         n5579, n5580, n5581, n5582, n5583, n5584, n5585, n5586, n5587, n5588,
         n5589, n5590, n5591, n5592, n5593, n5594, n5595, n5596, n5597, n5598,
         n5599, n5600, n5601, n5602, n5603, n5604, n5605, n5606, n5607, n5608,
         n5609, n5610, n5611, n5612, n5613, n5614, n5615, n5616, n5617, n5618,
         n5619, n5620, n5621, n5622, n5623, n5624, n5625, n5626, n5627, n5628,
         n5629, n5630, n5631, n5632, n5633, n5634, n5635, n5636, n5637, n5638,
         n5639, n5640, n5641, n5642, n5643, n5644, n5645, n5646, n5647, n5648,
         n5649, n5650, n5651, n5652, n5653, n5654, n5655, n5656, n5657, n5658,
         n5659, n5660, n5661, n5662, n5663, n5664, n5665, n5666, n5667, n5668,
         n5669, n5670, n5671, n5672, n5673, n5674, n5675, n5676, n5677, n5678,
         n5679, n5680, n5681, n5682, n5683, n5684, n5685, n5686, n5687, n5688,
         n5689, n5690, n5691, n5692, n5693, n5694, n5695, n5696, n5697, n5698,
         n5699, n5700, n5701, n5702, n5703, n5704, n5705, n5706, n5707, n5708,
         n5709, n5710, n5711, n5712, n5713, n5714, n5715, n5716, n5717, n5718,
         n5719, n5720, n5721, n5722, n5723, n5724, n5725, n5726, n5727, n5728,
         n5729, n5730, n5731, n5732, n5733, n5734, n5735, n5736, n5737, n5738,
         n5739, n5740, n5741, n5742, n5743, n5744, n5745, n5746, n5747, n5748,
         n5749, n5750, n5751, n5752, n5753, n5754, n5755, n5756, n5757, n5758,
         n5759, n5760, n5761, n5762, n5763, n5764, n5765, n5766, n5767, n5768,
         n5769, n5770, n5771, n5772, n5773, n5774, n5775, n5776, n5777, n5778,
         n5779, n5780, n5781, n5782, n5783, n5784, n5785, n5786, n5787, n5788,
         n5789, n5790, n5791, n5792, n5793, n5794, n5795, n5796, n5797, n5798,
         n5799, n5800, n5801, n5802, n5803, n5804, n5805, n5806, n5807, n5808,
         n5809, n5810, n5811, n5812, n5813, n5814, n5815, n5816, n5817, n5818,
         n5819, n5820, n5821, n5822, n5823, n5824, n5825, n5826, n5827, n5828,
         n5829, n5830, n5831, n5832, n5833, n5834, n5835, n5836, n5837, n5838,
         n5839, n5840, n5841, n5842, n5843, n5844, n5845, n5846, n5847, n5848,
         n5849, n5850, n5851, n5852, n5853, n5854, n5855, n5856, n5857, n5858,
         n5859, n5860, n5861, n5862, n5863, n5864, n5865, n5866, n5867, n5868,
         n5869, n5870, n5871, n5872, n5873, n5874, n5875, n5876, n5877, n5878,
         n5879, n5880, n5881, n5882, n5883, n5884, n5885, n5886, n5887, n5888,
         n5889, n5890, n5891, n5892, n5893, n5894, n5895, n5896, n5897, n5898,
         n5899, n5900, n5901, n5902, n5903, n5904, n5905, n5906, n5907, n5908,
         n5909, n5910, n5911, n5912, n5913, n5914, n5915, n5916, n5917, n5918,
         n5919, n5920, n5921, n5922, n5923, n5924, n5925, n5926, n5927, n5928,
         n5929, n5930, n5931, n5932, n5933, n5934, n5935, n5936, n5937, n5938,
         n5939, n5940, n5941, n5942, n5943, n5944, n5945, n5946, n5947, n5948,
         n5949, n5950, n5951, n5952, n5953, n5954, n5955, n5956, n5957, n5958,
         n5959, n5960, n5961, n5962, n5963, n5964, n5965, n5966, n5967, n5968,
         n5969, n5970, n5971, n5972, n5973, n5974, n5975, n5976, n5977, n5978,
         n5979, n5980, n5981, n5982, n5983, n5984, n5985, n5986, n5987, n5988,
         n5989, n5990, n5991, n5992, n5993, n5995, n5996, n5997, n5998, n5999,
         n6000, n6001, n6002, n6003, n6004, n6005;
  wire   [31:7] intDX_EWSW;
  wire   [31:0] intDY_EWSW;
  wire   [30:0] DMP_EXP_EWSW;
  wire   [27:0] DmP_EXP_EWSW;
  wire   [30:0] DMP_SHT1_EWSW;
  wire   [22:0] DmP_mant_SHT1_SW;
  wire   [4:0] Shift_amount_SHT1_EWR;
  wire   [25:2] Raw_mant_NRM_SWR;
  wire   [24:0] Data_array_SWR;
  wire   [30:0] DMP_SHT2_EWSW;
  wire   [4:2] shift_value_SHT2_EWR;
  wire   [7:0] DMP_exp_NRM2_EW;
  wire   [7:0] DMP_exp_NRM_EW;
  wire   [4:0] LZD_output_NRM2_EW;
  wire   [7:0] exp_rslt_NRM2_EW1;
  wire   [30:9] DMP_SFG;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(n830), .CK(clk), .RN(n5980), 
        .Q(Shift_amount_SHT1_EWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(n829), .CK(clk), .RN(n5980), 
        .Q(Shift_amount_SHT1_EWR[3]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(n828), .CK(clk), .RN(n5979), 
        .Q(Shift_amount_SHT1_EWR[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(n1151), .CK(clk), .RN(n5979), .Q(
        DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(n812), .CK(clk), .RN(n5979), .Q(
        DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(n811), .CK(clk), .RN(n5979), .Q(
        DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(n807), .CK(clk), .RN(n5979), .Q(
        DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(n800), .CK(clk), .RN(n5979), .Q(
        DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(n1152), .CK(clk), .RN(n5979), .Q(
        DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(n788), .CK(clk), .RN(n5979), .Q(
        OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(n787), .CK(clk), .RN(n5978), .Q(
        SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(n786), .CK(clk), .RN(n5978), .Q(
        DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(n1534), .CK(clk), .RN(n5979), .Q(
        DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(n783), .CK(clk), .RN(n5978), .Q(
        DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(n1533), .CK(clk), .RN(n5979), .Q(
        DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(n780), .CK(clk), .RN(n5978), .Q(
        DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(n1532), .CK(clk), .RN(n5978), .Q(
        DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(n777), .CK(clk), .RN(n5978), .Q(
        DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(n1531), .CK(clk), .RN(n5978), .Q(
        DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(n774), .CK(clk), .RN(n5978), .Q(
        DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(n1530), .CK(clk), .RN(n5978), .Q(
        DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(n771), .CK(clk), .RN(n5977), .Q(
        DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(n1529), .CK(clk), .RN(n5978), .Q(
        DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(n768), .CK(clk), .RN(n5977), .Q(
        DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(n1528), .CK(clk), .RN(n5977), .Q(
        DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(n765), .CK(clk), .RN(n5977), .Q(
        DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(n1527), .CK(clk), .RN(n5980), .Q(
        DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(n762), .CK(clk), .RN(n5977), .Q(
        DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(n761), .CK(clk), .RN(n5977), .Q(
        DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(n759), .CK(clk), .RN(n5977), .Q(
        DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(n758), .CK(clk), .RN(n5977), .Q(
        DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(n756), .CK(clk), .RN(n5977), .Q(
        DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(n755), .CK(clk), .RN(n5976), .Q(
        DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(n753), .CK(clk), .RN(n5977), .Q(
        DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(n752), .CK(clk), .RN(n5976), .Q(
        DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(n750), .CK(clk), .RN(n5976), .Q(
        DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(n749), .CK(clk), .RN(n5976), .Q(
        DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(n747), .CK(clk), .RN(n5976), .Q(
        DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(n746), .CK(clk), .RN(n5976), .Q(
        DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(n744), .CK(clk), .RN(n5976), .Q(
        DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(n743), .CK(clk), .RN(n5976), .Q(
        DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(n741), .CK(clk), .RN(n5976), .Q(
        DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(n740), .CK(clk), .RN(n5975), .Q(
        DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(n738), .CK(clk), .RN(n5975), .Q(
        DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(n737), .CK(clk), .RN(n5975), .Q(
        DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(n735), .CK(clk), .RN(n5975), .Q(
        DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(n734), .CK(clk), .RN(n5975), .Q(
        DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(n732), .CK(clk), .RN(n5975), .Q(
        DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(n731), .CK(clk), .RN(n5975), .Q(
        DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(n729), .CK(clk), .RN(n5975), .Q(
        DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(n728), .CK(clk), .RN(n5975), .Q(
        DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(n726), .CK(clk), .RN(n5975), .Q(
        DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(n725), .CK(clk), .RN(n5974), .Q(
        DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(n723), .CK(clk), .RN(n5974), .Q(
        DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(n722), .CK(clk), .RN(n5974), .Q(
        DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(n720), .CK(clk), .RN(n5974), .Q(
        DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(n719), .CK(clk), .RN(n5974), .Q(
        DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(n717), .CK(clk), .RN(n5974), .Q(
        DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(n716), .CK(clk), .RN(n5974), .Q(
        DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(n715), .CK(clk), .RN(n5974), .Q(
        DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(n714), .CK(clk), .RN(n5974), .Q(
        DMP_exp_NRM_EW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(n712), .CK(clk), .RN(n5974), .Q(
        DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(n711), .CK(clk), .RN(n5973), .Q(
        DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(n710), .CK(clk), .RN(n5973), .Q(
        DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(n709), .CK(clk), .RN(n5973), .Q(
        DMP_exp_NRM_EW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(n707), .CK(clk), .RN(n5973), .Q(
        DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(n706), .CK(clk), .RN(n5973), .Q(
        DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(n705), .CK(clk), .RN(n5973), .Q(
        DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(n704), .CK(clk), .RN(n5973), .Q(
        DMP_exp_NRM_EW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(n702), .CK(clk), .RN(n5973), .Q(
        DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(n701), .CK(clk), .RN(n5973), .Q(
        DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(n700), .CK(clk), .RN(n5976), .Q(
        DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(n699), .CK(clk), .RN(n5980), .Q(
        DMP_exp_NRM_EW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(n697), .CK(clk), .RN(n5980), .Q(
        DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(n696), .CK(clk), .RN(n5980), .Q(
        DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(n695), .CK(clk), .RN(n5980), .Q(
        DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(n694), .CK(clk), .RN(n5980), .Q(
        DMP_exp_NRM_EW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(n692), .CK(clk), .RN(n5980), .Q(
        DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(n691), .CK(clk), .RN(n5980), .Q(
        DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(n690), .CK(clk), .RN(n5981), .Q(
        DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(n689), .CK(clk), .RN(n5981), .Q(
        DMP_exp_NRM_EW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(n687), .CK(clk), .RN(n5981), .Q(
        DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(n686), .CK(clk), .RN(n5981), .Q(
        DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(n685), .CK(clk), .RN(n5981), .Q(
        DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(n684), .CK(clk), .RN(n5981), .Q(
        DMP_exp_NRM_EW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(n682), .CK(clk), .RN(n5981), .Q(
        DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(n681), .CK(clk), .RN(n5981), .Q(
        DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(n680), .CK(clk), .RN(n5982), .Q(
        DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(n679), .CK(clk), .RN(n5982), .Q(
        DMP_exp_NRM_EW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(n1153), .CK(clk), .RN(n5982), .Q(
        DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(n676), .CK(clk), .RN(n5982), .Q(
        DmP_mant_SHT1_SW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(n675), .CK(clk), .RN(n5982), .Q(
        DmP_EXP_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(n674), .CK(clk), .RN(n5982), .Q(
        DmP_mant_SHT1_SW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(n673), .CK(clk), .RN(n5982), .Q(
        DmP_EXP_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(n672), .CK(clk), .RN(n5982), .Q(
        DmP_mant_SHT1_SW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(n671), .CK(clk), .RN(n5982), .Q(
        DmP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(n669), .CK(clk), .RN(n5982), .Q(
        DmP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(n667), .CK(clk), .RN(n5983), .Q(
        DmP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(n1154), .CK(clk), .RN(n5983), .Q(
        DmP_EXP_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(n664), .CK(clk), .RN(n5983), .Q(
        DmP_mant_SHT1_SW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(n659), .CK(clk), .RN(n5983), .Q(
        DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(n658), .CK(clk), .RN(n5983), .Q(
        DmP_mant_SHT1_SW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(n657), .CK(clk), .RN(n5983), .Q(
        DmP_EXP_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(n656), .CK(clk), .RN(n5984), .Q(
        DmP_mant_SHT1_SW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(n655), .CK(clk), .RN(n5984), .Q(
        DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(n654), .CK(clk), .RN(n5984), .Q(
        DmP_mant_SHT1_SW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(n653), .CK(clk), .RN(n5984), .Q(
        DmP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(n651), .CK(clk), .RN(n5984), .Q(
        DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(n650), .CK(clk), .RN(n5984), .Q(
        DmP_mant_SHT1_SW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(n649), .CK(clk), .RN(n5984), .Q(
        DmP_EXP_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(n648), .CK(clk), .RN(n5984), .Q(
        DmP_mant_SHT1_SW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(n647), .CK(clk), .RN(n5984), .Q(
        DmP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(n645), .CK(clk), .RN(n5984), .Q(
        DmP_EXP_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(n644), .CK(clk), .RN(n5985), .Q(
        DmP_mant_SHT1_SW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(n643), .CK(clk), .RN(n5985), .Q(
        DmP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(n641), .CK(clk), .RN(n5985), .Q(
        DmP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(n1155), .CK(clk), .RN(n5985), .Q(
        DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(n638), .CK(clk), .RN(n5985), .Q(
        DmP_mant_SHT1_SW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(n637), .CK(clk), .RN(n5985), .Q(
        DmP_EXP_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(n636), .CK(clk), .RN(n5985), .Q(
        DmP_mant_SHT1_SW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(n635), .CK(clk), .RN(n5985), .Q(
        DmP_EXP_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(n634), .CK(clk), .RN(n5985), .Q(
        DmP_mant_SHT1_SW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(n633), .CK(clk), .RN(n5986), .Q(
        DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(n624), .CK(clk), .RN(n5986), .Q(
        OP_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(n623), .CK(clk), .RN(n5986), .Q(
        OP_FLAG_SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(n619), .CK(clk), .RN(n5986), .Q(
        SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(n618), .CK(clk), .RN(n5986), .Q(
        SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(n617), .CK(clk), .RN(n5986), .Q(
        SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(n616), .CK(clk), .RN(n5986), .Q(
        SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n615), .CK(clk), .RN(n5986), .Q(
        SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(n587), .CK(clk), .RN(n5986), .Q(
        LZD_output_NRM2_EW[3]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(n583), .CK(clk), .RN(n5986), .Q(
        LZD_output_NRM2_EW[4]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(n845), .CK(clk), .RN(n5972), .Q(
        Data_array_SWR[8]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(n693), .CK(clk), .RN(n5972), .Q(
        DMP_exp_NRM2_EW[4]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(n708), .CK(clk), .RN(n5972), .Q(
        DMP_exp_NRM2_EW[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(n843), .CK(clk), .RN(n5972), .Q(
        Data_array_SWR[6]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(n844), .CK(clk), .RN(n5972), .Q(
        Data_array_SWR[7]) );
  DFFRX1TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(n622), .CK(clk), .RN(n5968), .Q(
        OP_FLAG_SFG) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(n678), .CK(clk), .RN(n5972), .Q(
        DMP_exp_NRM2_EW[7]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(n683), .CK(clk), .RN(n5972), .Q(
        DMP_exp_NRM2_EW[6]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(n688), .CK(clk), .RN(n5972), .Q(
        DMP_exp_NRM2_EW[5]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(n698), .CK(clk), .RN(n5971), .Q(
        DMP_exp_NRM2_EW[3]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(n703), .CK(clk), .RN(n5971), .Q(
        DMP_exp_NRM2_EW[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(n840), .CK(clk), .RN(n5971), .Q(
        Data_array_SWR[3]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(n848), .CK(clk), .RN(n5971), .Q(
        Data_array_SWR[11]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(n847), .CK(clk), .RN(n5971), .Q(
        Data_array_SWR[10]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(n846), .CK(clk), .RN(n5971), .Q(
        Data_array_SWR[9]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(n842), .CK(clk), .RN(n5971), .Q(
        Data_array_SWR[5]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(n841), .CK(clk), .RN(n5971), .Q(
        Data_array_SWR[4]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_27_ ( .D(n792), .CK(clk), .RN(n5971), .Q(
        DMP_EXP_EWSW[27]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(n838), .CK(clk), .RN(n5970), .Q(
        Data_array_SWR[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(n837), .CK(clk), .RN(n5971), .Q(
        Data_array_SWR[0]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_27_ ( .D(n627), .CK(clk), .RN(n5970), .Q(
        DmP_EXP_EWSW[27]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(n534), .CK(clk), .RN(n5965), .Q(
        DmP_mant_SFG_SWR_25_) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_24_ ( .D(n630), .CK(clk), .RN(n5970), .QN(n1441) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(n867), .CK(clk), .RN(n5969), 
        .Q(n3648) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(n592), .CK(clk), .RN(n5953), .Q(
        Raw_mant_NRM_SWR[21]), .QN(n5900) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(n550), .CK(clk), .RN(n5967), .Q(
        n3638), .QN(n4938) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(n599), .CK(clk), .RN(n5965), .Q(
        n4782) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_26_ ( .D(n628), .CK(clk), .RN(n5969), .QN(n1445) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(n868), .CK(clk), .RN(n5969), 
        .Q(intDY_EWSW[28]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(n896), .CK(clk), .RN(n5960), .Q(
        intDY_EWSW[0]), .QN(n4937) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_13_ ( .D(n745), .CK(clk), .RN(n5956), .Q(n5890), 
        .QN(n2561) );
  DFFRX2TS SHT2_STAGE_SHFTVARS2_Q_reg_0_ ( .D(n864), .CK(clk), .RN(n5949), 
        .QN(n1493) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(n835), .CK(clk), .RN(n5950), .Q(
        n5862), .QN(n3609) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(n604), .CK(clk), .RN(n5949), .QN(
        n3615) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(n903), .CK(clk), .RN(n5949), 
        .QN(n73) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n546), .CK(clk), .RN(n5956), .QN(
        n1509) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n547), .CK(clk), .RN(n5957), .QN(
        n1510) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(n873), .CK(clk), .RN(n5949), 
        .QN(n2589) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(n871), .CK(clk), .RN(n5949), 
        .QN(n1430) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_18_ ( .D(n730), .CK(clk), .RN(n5954), .Q(n5904), 
        .QN(n2575) );
  DFFRX2TS inst_ShiftRegister_Q_reg_4_ ( .D(n934), .CK(clk), .RN(n5948), .Q(
        n5855), .QN(n5931) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_19_ ( .D(n727), .CK(clk), .RN(n5954), .QN(n2599) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(n836), .CK(clk), .RN(n5948), .Q(
        shift_value_SHT2_EWR[2]), .QN(n5905) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(n598), .CK(clk), .RN(n5955), .Q(
        Raw_mant_NRM_SWR[15]), .QN(n5923) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(n602), .CK(clk), .RN(n5953), .Q(
        Raw_mant_NRM_SWR[11]), .QN(n5898) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(n920), .CK(clk), .RN(n5949), 
        .QN(n1488) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(n913), .CK(clk), .RN(n5948), 
        .QN(n1438) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(n858), .CK(clk), .RN(n5949), .Q(
        Data_array_SWR[21]), .QN(n5921) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(n839), .CK(clk), .RN(n5960), .Q(
        Data_array_SWR[2]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(n652), .CK(clk), .RN(n5962), 
        .QN(n3674) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(n907), .CK(clk), .RN(n5950), 
        .QN(n1487) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(n586), .CK(clk), .RN(n5963), .Q(
        LZD_output_NRM2_EW[0]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(n584), .CK(clk), .RN(n5963), .Q(
        LZD_output_NRM2_EW[1]) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_1_ ( .D(n781), .CK(clk), .RN(n5957), .Q(n5878), 
        .QN(n3619) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_0_ ( .D(n784), .CK(clk), .RN(n5957), .QN(n2545)
         );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_23_ ( .D(n1186), .CK(clk), .RN(n5964), .QN(
        n1492) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_24_ ( .D(n795), .CK(clk), .RN(n5964), .Q(n4887)
         );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(n900), .CK(clk), .RN(n5964), 
        .QN(n1491) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(n901), .CK(clk), .RN(n5964), 
        .QN(n1432) );
  DFFRX1TS NRM_STAGE_FLAGS_Q_reg_2_ ( .D(n621), .CK(clk), .RN(n5965), .QN(
        n1480) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(n754), .CK(clk), .RN(n5966), .Q(n4936), 
        .QN(n2558) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(n805), .CK(clk), .RN(n5981), .Q(
        DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(n809), .CK(clk), .RN(n5981), .Q(
        DMP_EXP_EWSW[10]) );
  DFFRXLTS inst_ShiftRegister_Q_reg_6_ ( .D(n936), .CK(clk), .RN(n5950), .Q(
        n4745), .QN(n4889) );
  DFFRX4TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(n928), .CK(clk), .RN(n5952), 
        .QN(n1482) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(n925), .CK(clk), .RN(n5964), 
        .QN(n1434) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_2_ ( .D(n778), .CK(clk), .RN(n5967), .QN(n4765)
         );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_6_ ( .D(n766), .CK(clk), .RN(n5967), .QN(n4775)
         );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_7_ ( .D(n763), .CK(clk), .RN(n5967), .QN(n2556)
         );
  DFFRX1TS inst_ShiftRegister_Q_reg_5_ ( .D(n935), .CK(clk), .RN(n5948), .Q(
        n4816) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n544), .CK(clk), .RN(n5966), .Q(
        n5930), .QN(n4770) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(n662), .CK(clk), .RN(n5960), .Q(
        DmP_mant_SHT1_SW[7]), .QN(n5925) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(n608), .CK(clk), .RN(n5970), .Q(
        n5916), .QN(n3677) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n545), .CK(clk), .RN(n5966), .Q(
        n5888), .QN(n4771) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(n542), .CK(clk), .RN(n5966), .Q(
        n4769), .QN(n5887) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(n541), .CK(clk), .RN(n5965), .Q(
        n4781), .QN(n5886) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n626), .CK(clk), .RN(n5973), .Q(
        underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n625), .CK(clk), .RN(n5987), .Q(
        overflow_flag) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(n820), .CK(clk), .RN(n5960), .Q(
        final_result_ieee[30]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(n614), .CK(clk), .RN(n5960), .Q(
        final_result_ieee[31]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(n1161), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[25]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(n1163), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[26]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(n1160), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[29]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(n1159), .CK(clk), .RN(n5996), .Q(
        final_result_ieee[23]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(n1158), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[24]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(n1164), .CK(clk), .RN(n5988), .Q(
        final_result_ieee[27]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(n1162), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[28]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(n582), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[10]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(n581), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[11]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(n580), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[9]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(n579), .CK(clk), .RN(n5992), .Q(
        final_result_ieee[12]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(n578), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[8]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(n577), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[13]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(n576), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[7]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(n575), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[6]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(n574), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[5]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(n572), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[3]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(n571), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[2]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(n570), .CK(clk), .RN(n5989), .Q(
        final_result_ieee[1]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(n569), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[0]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(n568), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[14]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(n567), .CK(clk), .RN(n5958), .Q(
        final_result_ieee[15]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(n566), .CK(clk), .RN(n5991), .Q(
        final_result_ieee[16]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(n564), .CK(clk), .RN(n5992), .Q(
        final_result_ieee[18]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(n563), .CK(clk), .RN(n5987), .Q(
        final_result_ieee[19]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(n562), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[20]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(n561), .CK(clk), .RN(n5990), .Q(
        final_result_ieee[21]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(n560), .CK(clk), .RN(n5959), .Q(
        final_result_ieee[22]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(n713), .CK(clk), .RN(n5963), .Q(
        DMP_exp_NRM2_EW[0]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(n601), .CK(clk), .RN(n5965), .Q(
        Raw_mant_NRM_SWR[12]), .QN(n5918) );
  CMPR32X2TS DP_OP_15J43_122_6956_U7 ( .A(DP_OP_15J43_122_6956_n16), .B(
        DMP_exp_NRM2_EW[2]), .C(DP_OP_15J43_122_6956_n7), .CO(
        DP_OP_15J43_122_6956_n6), .S(exp_rslt_NRM2_EW1[2]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U3 ( .A(n3725), .B(DMP_exp_NRM2_EW[6]), .C(
        DP_OP_15J43_122_6956_n3), .CO(DP_OP_15J43_122_6956_n2), .S(
        exp_rslt_NRM2_EW1[6]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U6 ( .A(DP_OP_15J43_122_6956_n15), .B(
        DMP_exp_NRM2_EW[3]), .C(DP_OP_15J43_122_6956_n6), .CO(
        DP_OP_15J43_122_6956_n5), .S(exp_rslt_NRM2_EW1[3]) );
  DFFRX4TS SFT2FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n620), .CK(clk), .RN(n5948), .Q(
        n2563), .QN(n3725) );
  DFFSX2TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(n1156), .CK(clk), .SN(n5987), .Q(
        n1514) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(n640), .CK(clk), .RN(n5962), 
        .QN(n3672) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_15_ ( .D(n739), .CK(clk), .RN(n5966), .Q(n5885), 
        .QN(n2565) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(n535), .CK(clk), .RN(n5954), .Q(
        n5935), .QN(n1516) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(n536), .CK(clk), .RN(n5954), .Q(
        n2578), .QN(n5924) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(n539), .CK(clk), .RN(n5955), .Q(
        n3657), .QN(n5908) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(n540), .CK(clk), .RN(n5955), .Q(
        n5934), .QN(n1506) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(n596), .CK(clk), .RN(n5966), .Q(
        Raw_mant_NRM_SWR[17]), .QN(n5903) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(n899), .CK(clk), .RN(n5968), 
        .Q(n4815), .QN(n5910) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(n607), .CK(clk), .RN(n5948), .Q(
        Raw_mant_NRM_SWR[6]), .QN(n5902) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(n590), .CK(clk), .RN(n5965), .Q(
        Raw_mant_NRM_SWR[23]), .QN(n5922) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(n4902), .CK(clk), .RN(n5987), .Q(ready) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n937), .CK(clk), .RN(
        n5950), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(
        inst_FSM_INPUT_ENABLE_state_next_1_), .CK(clk), .RN(n5949), .Q(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n6005) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(n611), .CK(clk), .RN(n5950), .Q(
        Raw_mant_NRM_SWR[2]) );
  DFFRX2TS inst_ShiftRegister_Q_reg_1_ ( .D(n931), .CK(clk), .RN(n5957), .Q(
        n3605), .QN(n4939) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_21_ ( .D(n721), .CK(clk), .RN(n5954), .Q(
        DMP_SFG[21]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(n557), .CK(clk), .RN(n5967), .Q(
        n3627) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(n874), .CK(clk), .RN(n5950), 
        .Q(intDY_EWSW[22]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(n593), .CK(clk), .RN(n5953), .Q(
        n4747) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(n875), .CK(clk), .RN(n5951), 
        .Q(intDY_EWSW[21]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(n893), .CK(clk), .RN(n5950), .Q(
        intDY_EWSW[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(n869), .CK(clk), .RN(n5951), 
        .Q(intDY_EWSW[27]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(n879), .CK(clk), .RN(n5950), 
        .Q(intDY_EWSW[17]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(n885), .CK(clk), .RN(n5951), 
        .Q(intDY_EWSW[11]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(n887), .CK(clk), .RN(n5951), .Q(
        intDY_EWSW[9]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(n894), .CK(clk), .RN(n5951), .Q(
        intDY_EWSW[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(n895), .CK(clk), .RN(n5951), .Q(
        intDY_EWSW[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(n922), .CK(clk), .RN(n5951), .Q(
        intDX_EWSW[7]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(n876), .CK(clk), .RN(n5951), 
        .Q(intDY_EWSW[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(n877), .CK(clk), .RN(n5949), 
        .Q(intDY_EWSW[19]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(n880), .CK(clk), .RN(n5952), 
        .Q(intDY_EWSW[16]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(n886), .CK(clk), .RN(n5952), 
        .Q(intDY_EWSW[10]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(n892), .CK(clk), .RN(n5952), .Q(
        intDY_EWSW[4]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(n929), .CK(clk), .RN(n5965), .Q(
        n4840) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(n594), .CK(clk), .RN(n5953), .Q(
        Raw_mant_NRM_SWR[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(n849), .CK(clk), .RN(n5955), .Q(
        Data_array_SWR[12]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(n850), .CK(clk), .RN(n5953), .Q(
        Data_array_SWR[13]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(n851), .CK(clk), .RN(n5956), .Q(
        Data_array_SWR[14]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(n856), .CK(clk), .RN(n5955), .Q(
        Data_array_SWR[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(n854), .CK(clk), .RN(n5955), .Q(
        Data_array_SWR[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(n853), .CK(clk), .RN(n5955), .Q(
        Data_array_SWR[16]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(n852), .CK(clk), .RN(n5956), .Q(
        Data_array_SWR[15]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(n591), .CK(clk), .RN(n5953), .Q(
        Raw_mant_NRM_SWR[22]), .QN(n5870) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(n804), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(n790), .CK(clk), .RN(n5963), .Q(
        DMP_EXP_EWSW[29]) );
  DFFSX1TS R_7 ( .D(n6002), .CK(clk), .SN(n5990), .Q(n5939) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(n595), .CK(clk), .RN(n5965), .Q(
        n5865), .QN(n4788) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(n870), .CK(clk), .RN(n5970), 
        .Q(n4755), .QN(n5928) );
  DFFRX1TS inst_ShiftRegister_Q_reg_2_ ( .D(n932), .CK(clk), .RN(n5960), .Q(
        n4814), .QN(n4940) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(n917), .CK(clk), .RN(n5960), 
        .Q(n4749) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_11_ ( .D(n751), .CK(clk), .RN(n5966), .QN(n2560) );
  DFFRX1TS inst_ShiftRegister_Q_reg_3_ ( .D(n933), .CK(clk), .RN(n5987), .QN(
        n4787) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(n910), .CK(clk), .RN(n5969), 
        .QN(n4780) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(n889), .CK(clk), .RN(n5964), 
        .QN(n1459) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(n919), .CK(clk), .RN(n5964), 
        .QN(n1437) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_31_ ( .D(n865), .CK(clk), .RN(n5983), 
        .Q(intDY_EWSW[31]) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_14_ ( .D(n742), .CK(clk), .RN(n5966), .QN(n2570) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_4_ ( .D(n772), .CK(clk), .RN(n5967), .QN(n2548)
         );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(n902), .CK(clk), .RN(n5969), 
        .QN(n1464) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(n909), .CK(clk), .RN(n5968), 
        .QN(n1461) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_9_ ( .D(n757), .CK(clk), .RN(n5966), .Q(
        DMP_SFG[9]) );
  DFFRX2TS EXP_STAGE_DMP_Q_reg_25_ ( .D(n794), .CK(clk), .RN(n5972), .QN(n1442) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_8_ ( .D(n760), .CK(clk), .RN(n5966), .QN(n2557)
         );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(n552), .CK(clk), .RN(n5967), .Q(
        n3637) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(n831), .CK(clk), .RN(n5987), 
        .Q(Shift_amount_SHT1_EWR[1]) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n938), .CK(clk), .RN(
        n5970), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n5901) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(n605), .CK(clk), .RN(n5968), .QN(
        n4768) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(n884), .CK(clk), .RN(n5968), 
        .QN(n4774) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(n606), .CK(clk), .RN(n5969), .QN(
        n3616) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(n908), .CK(clk), .RN(n5969), 
        .QN(n1458) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(n660), .CK(clk), .RN(n5983), .QN(
        n3671) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(n668), .CK(clk), .RN(n5983), .Q(
        DmP_mant_SHT1_SW[4]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(n642), .CK(clk), .RN(n5985), .Q(
        DmP_mant_SHT1_SW[17]) );
  DFFRX1TS INPUT_STAGE_FLAGS_Q_reg_0_ ( .D(n897), .CK(clk), .RN(n5983), .Q(
        intAS) );
  DFFRX1TS inst_ShiftRegister_Q_reg_0_ ( .D(n930), .CK(clk), .RN(n5948), .Q(
        n5937), .QN(n5993) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(n833), .CK(clk), .RN(n5950), .Q(
        shift_value_SHT2_EWR[4]), .QN(n5995) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(n832), .CK(clk), .RN(n5970), 
        .Q(Shift_amount_SHT1_EWR[0]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(n883), .CK(clk), .RN(n5951), 
        .Q(intDY_EWSW[13]), .QN(n5945) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(n891), .CK(clk), .RN(n5951), .Q(
        intDY_EWSW[5]), .QN(n5936) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(n921), .CK(clk), .RN(n5952), .Q(
        n3623), .QN(n5871) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(n857), .CK(clk), .RN(n5955), .Q(
        Data_array_SWR[20]), .QN(n5919) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n548), .CK(clk), .RN(n5957), .Q(
        n2584), .QN(n5891) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(n553), .CK(clk), .RN(n5957), .Q(
        n5876), .QN(n1502) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(n769), .CK(clk), .RN(n5956), .Q(n5889), 
        .QN(n2551) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_20_ ( .D(n724), .CK(clk), .RN(n5954), .Q(n5947), 
        .QN(n2582) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n549), .CK(clk), .RN(n5957), .Q(
        n4760), .QN(n5892) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(n551), .CK(clk), .RN(n5957), .Q(
        n4836), .QN(n5875) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(n555), .CK(clk), .RN(n5957), .Q(
        n4837), .QN(n5879) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(n597), .CK(clk), .RN(n5956), .Q(
        n5856), .QN(n4841) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(n600), .CK(clk), .RN(n5953), .Q(
        Raw_mant_NRM_SWR[13]), .QN(n5872) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(n890), .CK(clk), .RN(n5949), .Q(
        intDY_EWSW[6]), .QN(n5874) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(n806), .CK(clk), .RN(n5960), .Q(
        DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(n808), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(n814), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(n791), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(n797), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(n798), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(n799), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(n801), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(n802), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(n803), .CK(clk), .RN(n5961), .Q(
        DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(n661), .CK(clk), .RN(n5962), .Q(
        DmP_EXP_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(n666), .CK(clk), .RN(n5962), .QN(
        n3673) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(n670), .CK(clk), .RN(n5962), .QN(
        n3617) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(n923), .CK(clk), .RN(n5950), .Q(
        n3606), .QN(n5873) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(n646), .CK(clk), .RN(n5962), .Q(
        DmP_mant_SHT1_SW[15]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(n632), .CK(clk), .RN(n5962), .Q(
        DmP_mant_SHT1_SW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(n819), .CK(clk), .RN(n5962), .Q(
        DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(n818), .CK(clk), .RN(n5962), .Q(
        DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(n817), .CK(clk), .RN(n5962), .Q(
        DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(n816), .CK(clk), .RN(n5963), .Q(
        DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(n815), .CK(clk), .RN(n5963), .Q(
        DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(n810), .CK(clk), .RN(n5963), .Q(
        DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(n663), .CK(clk), .RN(n5963), .Q(
        DmP_EXP_EWSW[7]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(n554), .CK(clk), .RN(n5957), .Q(
        n4806), .QN(n5880) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(n559), .CK(clk), .RN(n5967), .QN(
        n2597) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(n927), .CK(clk), .RN(n5965), 
        .QN(n1483) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(n926), .CK(clk), .RN(n5964), .Q(
        n4834), .QN(n5869) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(n918), .CK(clk), .RN(n5964), 
        .Q(n4827), .QN(n5868) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(n912), .CK(clk), .RN(n5969), 
        .Q(n4832), .QN(n5857) );
  DFFSX1TS R_3 ( .D(n6000), .CK(clk), .SN(n5988), .Q(n5942) );
  DFFSX1TS R_1 ( .D(n6001), .CK(clk), .SN(n5990), .Q(n5944) );
  DFFSX1TS R_5 ( .D(n6003), .CK(clk), .SN(n5987), .Q(n5941) );
  DFFSX1TS R_2 ( .D(n5998), .CK(clk), .SN(n5991), .Q(n5943) );
  DFFSX1TS R_6 ( .D(n5999), .CK(clk), .SN(n5989), .Q(n5940) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_3_ ( .D(n775), .CK(clk), .RN(n5967), .QN(n4759)
         );
  DFFSX1TS R_21 ( .D(n6004), .CK(clk), .SN(n5991), .Q(n5938) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(n613), .CK(clk), .RN(n5965), .Q(
        n5895), .QN(n1499) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_17_ ( .D(n733), .CK(clk), .RN(n5955), .Q(n5909), 
        .QN(n2573) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_22_ ( .D(n718), .CK(clk), .RN(n5954), .Q(n5917), 
        .QN(n2586) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_16_ ( .D(n736), .CK(clk), .RN(n5955), .Q(n5897), 
        .QN(n2533) );
  DFFRX1TS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n863), .CK(clk), .RN(n5948), .Q(
        n5907), .QN(n4794) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_12_ ( .D(n748), .CK(clk), .RN(n5956), .Q(n5899), 
        .QN(n2559) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(n610), .CK(clk), .RN(n5968), .Q(
        Raw_mant_NRM_SWR[3]), .QN(n5913) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(n538), .CK(clk), .RN(n5954), .Q(
        n5933), .QN(n1505) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(n543), .CK(clk), .RN(n5956), .Q(
        n5896), .QN(n1520) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(n537), .CK(clk), .RN(n5954), .Q(
        n5946), .QN(n1517) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(n558), .CK(clk), .RN(n5967), .Q(
        n5929), .QN(n1469) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(n612), .CK(clk), .RN(n5952), .Q(
        n5866), .QN(n1452) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(n916), .CK(clk), .RN(n5963), 
        .Q(n4886), .QN(n5858) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(n881), .CK(clk), .RN(n5952), 
        .Q(intDY_EWSW[15]), .QN(n5859) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(n905), .CK(clk), .RN(n5948), 
        .Q(n5861), .QN(n1439) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(n878), .CK(clk), .RN(n5952), 
        .Q(intDY_EWSW[18]), .QN(n5893) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(n882), .CK(clk), .RN(n5952), 
        .Q(intDY_EWSW[14]), .QN(n5881) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(n866), .CK(clk), .RN(n5963), 
        .Q(intDY_EWSW[30]), .QN(n5906) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(n872), .CK(clk), .RN(n5968), 
        .Q(n4786), .QN(n5894) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(n924), .CK(clk), .RN(n5964), .Q(
        n4820), .QN(n5997) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(n915), .CK(clk), .RN(n5968), 
        .Q(n4818), .QN(n5882) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(n906), .CK(clk), .RN(n5969), 
        .Q(n4785), .QN(n5867) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(n888), .CK(clk), .RN(n5960), .Q(
        n4835), .QN(n5877) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(n904), .CK(clk), .RN(n5960), 
        .Q(n4753), .QN(n5927) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(n911), .CK(clk), .RN(n5968), 
        .Q(n4831), .QN(n5883) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(n914), .CK(clk), .RN(n5968), 
        .Q(n4823), .QN(n5884) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(n603), .CK(clk), .RN(n5952), .Q(
        n4809), .QN(n5863) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_25_ ( .D(n629), .CK(clk), .RN(n5969), .Q(n5914), 
        .QN(n1447) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(n609), .CK(clk), .RN(n5948), .Q(
        n5860), .QN(n2535) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_23_ ( .D(n1157), .CK(clk), .RN(n5972), .Q(
        DmP_EXP_EWSW[23]), .QN(n5932) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_26_ ( .D(n793), .CK(clk), .RN(n5970), .Q(n5911), 
        .QN(n1446) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(n862), .CK(clk), .RN(n5956), .Q(
        n2580), .QN(n5864) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(n860), .CK(clk), .RN(n5970), .Q(
        n4801), .QN(n5915) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(n861), .CK(clk), .RN(n5956), .Q(
        Data_array_SWR[24]), .QN(n5926) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(n855), .CK(clk), .RN(n5953), .Q(
        Data_array_SWR[18]), .QN(n5920) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(n859), .CK(clk), .RN(n5970), .Q(
        n2595), .QN(n5912) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(n585), .CK(clk), .RN(n5987), .Q(
        LZD_output_NRM2_EW[2]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(n898), .CK(clk), .RN(n5953), 
        .Q(intDX_EWSW[31]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U4 ( .A(n3725), .B(DMP_exp_NRM2_EW[5]), .CI(
        DP_OP_15J43_122_6956_n4), .CO(DP_OP_15J43_122_6956_n3), .S(
        exp_rslt_NRM2_EW1[5]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U8 ( .A(DP_OP_15J43_122_6956_n17), .B(
        DMP_exp_NRM2_EW[1]), .CI(DP_OP_15J43_122_6956_n8), .CO(
        DP_OP_15J43_122_6956_n7), .S(exp_rslt_NRM2_EW1[1]) );
  DFFRX4TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(n589), .CK(clk), .RN(n5953), .Q(
        Raw_mant_NRM_SWR[24]) );
  DFFRX4TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(n588), .CK(clk), .RN(n5954), .Q(
        Raw_mant_NRM_SWR[25]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U9 ( .A(DMP_exp_NRM2_EW[0]), .B(n3725), .C(
        DP_OP_15J43_122_6956_n18), .CO(DP_OP_15J43_122_6956_n8), .S(
        exp_rslt_NRM2_EW1[0]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U5 ( .A(DP_OP_15J43_122_6956_n14), .B(
        DMP_exp_NRM2_EW[4]), .C(DP_OP_15J43_122_6956_n5), .CO(
        DP_OP_15J43_122_6956_n4), .S(exp_rslt_NRM2_EW1[4]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U2 ( .A(n3725), .B(DMP_exp_NRM2_EW[7]), .C(
        DP_OP_15J43_122_6956_n2), .CO(DP_OP_15J43_122_6956_n1), .S(
        exp_rslt_NRM2_EW1[7]) );
  OAI211X1TS U3 ( .A0(n4931), .A1(n5639), .B0(n5638), .C0(n5637), .Y(n851) );
  BUFX3TS U4 ( .A(n5708), .Y(n5733) );
  BUFX4TS U5 ( .A(n5840), .Y(n5674) );
  NAND2X4TS U6 ( .A(n4910), .B(n5995), .Y(n6001) );
  INVX3TS U7 ( .A(n4888), .Y(n4919) );
  BUFX3TS U8 ( .A(n5804), .Y(n5790) );
  BUFX3TS U9 ( .A(n5694), .Y(n5840) );
  INVX8TS U10 ( .A(n4909), .Y(n4910) );
  INVX2TS U11 ( .A(n5757), .Y(n4912) );
  NAND2X4TS U12 ( .A(n5573), .B(n5579), .Y(n5757) );
  NAND2X2TS U13 ( .A(beg_OP), .B(n5843), .Y(n5804) );
  INVX2TS U14 ( .A(n4903), .Y(n4904) );
  NOR2X4TS U15 ( .A(n4794), .B(n5433), .Y(n5776) );
  BUFX3TS U16 ( .A(n4745), .Y(n5844) );
  NOR2X1TS U17 ( .A(n5014), .B(n5013), .Y(n5291) );
  AOI22X2TS U18 ( .A0(n4905), .A1(n5783), .B0(Shift_amount_SHT1_EWR[1]), .B1(
        n5812), .Y(n5578) );
  INVX2TS U19 ( .A(n5822), .Y(n5819) );
  CLKBUFX2TS U20 ( .A(n3605), .Y(n5808) );
  NAND2X4TS U21 ( .A(n4977), .B(n4976), .Y(n5371) );
  OAI21X2TS U22 ( .A0(n5497), .A1(n5534), .B0(n5496), .Y(n5498) );
  OAI2BB1X1TS U23 ( .A0N(n5945), .A1N(n4886), .B0(n5499), .Y(n5500) );
  AOI222X2TS U24 ( .A0(n5859), .A1(n4823), .B0(n5881), .B1(n4818), .C0(n5500), 
        .C1(n5539), .Y(n5502) );
  NOR3XLTS U25 ( .A(shift_value_SHT2_EWR[4]), .B(shift_value_SHT2_EWR[2]), .C(
        n3609), .Y(n5072) );
  NOR2X1TS U26 ( .A(LZD_output_NRM2_EW[1]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n17) );
  AOI2BB1X2TS U27 ( .A0N(n4781), .A1N(n2533), .B0(n4959), .Y(n5424) );
  OAI211XLTS U28 ( .A0(n5313), .A1(n5468), .B0(n5306), .C0(n5305), .Y(n5307)
         );
  OAI211XLTS U29 ( .A0(n5468), .A1(n5346), .B0(n5344), .C0(n5345), .Y(n5350)
         );
  OAI21XLTS U30 ( .A0(n1514), .A1(n5761), .B0(n5178), .Y(n5179) );
  NAND2X4TS U31 ( .A(n5579), .B(n5578), .Y(n5639) );
  BUFX3TS U32 ( .A(n5708), .Y(n5737) );
  BUFX4TS U33 ( .A(n5708), .Y(n5841) );
  OAI211XLTS U34 ( .A0(n4896), .A1(n5220), .B0(n5171), .C0(n5170), .Y(n543) );
  NAND2X4TS U35 ( .A(n5432), .B(n4910), .Y(n6000) );
  OAI21XLTS U36 ( .A0(n5571), .A1(n5995), .B0(n5452), .Y(n833) );
  OAI21XLTS U37 ( .A0(n5761), .A1(n2548), .B0(n5078), .Y(n772) );
  AOI211XLTS U38 ( .A0(n5221), .A1(n5453), .B0(n5180), .C0(n5179), .Y(n1156)
         );
  OAI21XLTS U39 ( .A0(n1437), .A1(n5737), .B0(n5736), .Y(n809) );
  OAI21XLTS U40 ( .A0(n5824), .A1(n2561), .B0(n5088), .Y(n745) );
  OAI21XLTS U41 ( .A0(n5874), .A1(n5841), .B0(n5710), .Y(n1154) );
  OAI21XLTS U42 ( .A0(n5873), .A1(n5733), .B0(n5711), .Y(n1151) );
  CLKINVX3TS U43 ( .A(n4904), .Y(n5560) );
  CLKINVX3TS U44 ( .A(n5844), .Y(n4903) );
  OR2X1TS U45 ( .A(n5578), .B(n5570), .Y(n4888) );
  OAI211X1TS U46 ( .A0(n4930), .A1(n5639), .B0(n5607), .C0(n5606), .Y(n847) );
  OAI211X1TS U47 ( .A0(n5758), .A1(n5757), .B0(n5756), .C0(n5755), .Y(n852) );
  OAI211X1TS U48 ( .A0(n5657), .A1(n5639), .B0(n5583), .C0(n5582), .Y(n860) );
  OAI211X1TS U49 ( .A0(n5681), .A1(n5639), .B0(n5613), .C0(n5612), .Y(n855) );
  OAI21X1TS U50 ( .A0(n5882), .A1(n5728), .B0(n5727), .Y(n805) );
  OAI21X1TS U51 ( .A0(n5858), .A1(n5728), .B0(n5698), .Y(n806) );
  OAI21X1TS U52 ( .A0(n4937), .A1(n5841), .B0(n5719), .Y(n1153) );
  OAI21X1TS U53 ( .A0(n1438), .A1(n5728), .B0(n5722), .Y(n803) );
  OAI21X1TS U54 ( .A0(n5884), .A1(n5728), .B0(n5725), .Y(n804) );
  OAI21X1TS U55 ( .A0(n5997), .A1(n5728), .B0(n5724), .Y(n814) );
  INVX4TS U56 ( .A(n5757), .Y(n4913) );
  INVX3TS U57 ( .A(n5639), .Y(n4921) );
  INVX4TS U58 ( .A(n4890), .Y(n4925) );
  INVX4TS U59 ( .A(n4926), .Y(n5708) );
  INVX4TS U60 ( .A(n5694), .Y(n5718) );
  INVX4TS U61 ( .A(n4891), .Y(n4926) );
  INVX4TS U62 ( .A(n5694), .Y(n5735) );
  INVX4TS U63 ( .A(n5694), .Y(n5720) );
  OAI211X1TS U64 ( .A0(n5455), .A1(n6003), .B0(n5075), .C0(n6002), .Y(n562) );
  OR2X4TS U65 ( .A(n5545), .B(n4903), .Y(n4891) );
  OAI211X1TS U66 ( .A0(n5444), .A1(n4909), .B0(n5443), .C0(n5442), .Y(n582) );
  AOI31X2TS U67 ( .A0(n3616), .A1(n5902), .A2(n5027), .B0(n5026), .Y(n5448) );
  AO22X1TS U68 ( .A0(n5852), .A1(final_result_ieee[31]), .B0(n5785), .B1(n5773), .Y(n614) );
  NAND2X4TS U69 ( .A(n5391), .B(n3677), .Y(n5046) );
  AO22X1TS U70 ( .A0(exp_rslt_NRM2_EW1[7]), .A1(n5785), .B0(n5852), .B1(
        final_result_ieee[30]), .Y(n820) );
  NOR2X6TS U71 ( .A(n5052), .B(Raw_mant_NRM_SWR[12]), .Y(n5032) );
  OAI21X1TS U72 ( .A0(n5444), .A1(n5158), .B0(n5100), .Y(n546) );
  AO22X1TS U73 ( .A0(n5789), .A1(n4815), .B0(n5791), .B1(Data_X[30]), .Y(n899)
         );
  AO22X1TS U74 ( .A0(n5788), .A1(n4785), .B0(n5780), .B1(Data_X[23]), .Y(n906)
         );
  AO22X1TS U75 ( .A0(n5778), .A1(n4818), .B0(n5780), .B1(Data_X[14]), .Y(n915)
         );
  AO22X1TS U76 ( .A0(n5805), .A1(Data_Y[28]), .B0(n5788), .B1(intDY_EWSW[28]), 
        .Y(n868) );
  AO22X1TS U77 ( .A0(n5778), .A1(n4820), .B0(n5780), .B1(Data_X[5]), .Y(n924)
         );
  AO22X1TS U78 ( .A0(n5789), .A1(intDY_EWSW[0]), .B0(n5791), .B1(Data_Y[0]), 
        .Y(n896) );
  AO22X1TS U79 ( .A0(n5778), .A1(n4786), .B0(n5780), .B1(Data_Y[24]), .Y(n872)
         );
  AO22X1TS U80 ( .A0(n5789), .A1(intDY_EWSW[14]), .B0(n5791), .B1(Data_Y[14]), 
        .Y(n882) );
  AO22X1TS U81 ( .A0(n5793), .A1(add_subt), .B0(n5792), .B1(intAS), .Y(n897)
         );
  AO22X1TS U82 ( .A0(n5789), .A1(intDY_EWSW[18]), .B0(n5791), .B1(Data_Y[18]), 
        .Y(n878) );
  AO22X1TS U83 ( .A0(n5778), .A1(intDX_EWSW[31]), .B0(n5781), .B1(Data_X[31]), 
        .Y(n898) );
  AO22X1TS U84 ( .A0(n5789), .A1(n4755), .B0(n5781), .B1(Data_Y[26]), .Y(n870)
         );
  AO22X1TS U85 ( .A0(n5788), .A1(n4823), .B0(n5781), .B1(Data_X[15]), .Y(n914)
         );
  AO22X1TS U86 ( .A0(n5778), .A1(n4831), .B0(n5781), .B1(Data_X[18]), .Y(n911)
         );
  AO22X1TS U87 ( .A0(n5805), .A1(Data_X[12]), .B0(n5788), .B1(n4749), .Y(n917)
         );
  AO22X1TS U88 ( .A0(n5778), .A1(n4753), .B0(n5780), .B1(Data_X[25]), .Y(n904)
         );
  AO22X1TS U89 ( .A0(n5794), .A1(Data_Y[31]), .B0(n5792), .B1(intDY_EWSW[31]), 
        .Y(n865) );
  AO22X1TS U90 ( .A0(n5805), .A1(Data_Y[29]), .B0(n5804), .B1(n3648), .Y(n867)
         );
  AO22X1TS U91 ( .A0(n5778), .A1(n4835), .B0(n5780), .B1(Data_Y[8]), .Y(n888)
         );
  AO22X1TS U92 ( .A0(n5794), .A1(Data_Y[11]), .B0(n5792), .B1(intDY_EWSW[11]), 
        .Y(n885) );
  AO22X1TS U93 ( .A0(n5789), .A1(n3606), .B0(n5791), .B1(Data_X[6]), .Y(n923)
         );
  AO22X1TS U94 ( .A0(n5794), .A1(Data_Y[17]), .B0(n5792), .B1(intDY_EWSW[17]), 
        .Y(n879) );
  AO22X1TS U95 ( .A0(n5794), .A1(Data_Y[9]), .B0(n5792), .B1(intDY_EWSW[9]), 
        .Y(n887) );
  AO22X1TS U96 ( .A0(n5794), .A1(Data_Y[27]), .B0(n5792), .B1(intDY_EWSW[27]), 
        .Y(n869) );
  AO22X1TS U97 ( .A0(n5794), .A1(Data_Y[2]), .B0(n5792), .B1(intDY_EWSW[2]), 
        .Y(n894) );
  AO22X1TS U98 ( .A0(n5778), .A1(n4886), .B0(n5780), .B1(Data_X[13]), .Y(n916)
         );
  AO22X1TS U99 ( .A0(n5805), .A1(Data_Y[3]), .B0(n5804), .B1(intDY_EWSW[3]), 
        .Y(n893) );
  AO22X1TS U100 ( .A0(n5794), .A1(Data_Y[1]), .B0(n5792), .B1(intDY_EWSW[1]), 
        .Y(n895) );
  AO22X1TS U101 ( .A0(n5789), .A1(intDY_EWSW[6]), .B0(n5791), .B1(Data_Y[6]), 
        .Y(n890) );
  AO22X1TS U102 ( .A0(n5793), .A1(Data_Y[21]), .B0(n5804), .B1(intDY_EWSW[21]), 
        .Y(n875) );
  AO22X1TS U103 ( .A0(n5805), .A1(Data_X[7]), .B0(n5792), .B1(intDX_EWSW[7]), 
        .Y(n922) );
  AO22X1TS U104 ( .A0(n5789), .A1(intDY_EWSW[15]), .B0(n5791), .B1(Data_Y[15]), 
        .Y(n881) );
  AO22X1TS U105 ( .A0(n5794), .A1(Data_X[0]), .B0(n5788), .B1(n4840), .Y(n929)
         );
  AO22X1TS U106 ( .A0(n5789), .A1(n4834), .B0(n5780), .B1(Data_X[3]), .Y(n926)
         );
  AO22X1TS U107 ( .A0(n5805), .A1(Data_Y[10]), .B0(n5788), .B1(intDY_EWSW[10]), 
        .Y(n886) );
  AO22X1TS U108 ( .A0(n5794), .A1(Data_Y[13]), .B0(n5792), .B1(intDY_EWSW[13]), 
        .Y(n883) );
  AO22X1TS U109 ( .A0(n5805), .A1(Data_Y[16]), .B0(n5788), .B1(intDY_EWSW[16]), 
        .Y(n880) );
  AO22X1TS U110 ( .A0(n5805), .A1(Data_Y[4]), .B0(n5788), .B1(intDY_EWSW[4]), 
        .Y(n892) );
  AO22X1TS U111 ( .A0(n5778), .A1(n4832), .B0(n5780), .B1(Data_X[17]), .Y(n912) );
  AO22X1TS U112 ( .A0(n5777), .A1(n5861), .B0(n5780), .B1(Data_X[24]), .Y(n905) );
  AO22X1TS U113 ( .A0(n5805), .A1(Data_Y[19]), .B0(n5788), .B1(intDY_EWSW[19]), 
        .Y(n877) );
  AO22X1TS U114 ( .A0(n5778), .A1(n4827), .B0(n5781), .B1(Data_X[11]), .Y(n918) );
  AO22X1TS U115 ( .A0(n5789), .A1(n3623), .B0(n5791), .B1(Data_X[8]), .Y(n921)
         );
  AO22X1TS U116 ( .A0(n5805), .A1(Data_Y[20]), .B0(n5788), .B1(intDY_EWSW[20]), 
        .Y(n876) );
  AO22X1TS U117 ( .A0(n5794), .A1(Data_Y[22]), .B0(n5804), .B1(intDY_EWSW[22]), 
        .Y(n874) );
  OAI21X1TS U118 ( .A0(n1509), .A1(n5761), .B0(n5163), .Y(n5099) );
  OAI21X1TS U119 ( .A0(n1510), .A1(n5761), .B0(n5163), .Y(n5164) );
  AOI31X1TS U120 ( .A0(n5044), .A1(n5903), .A2(n5043), .B0(n5042), .Y(n5056)
         );
  OAI21X1TS U121 ( .A0(n5160), .A1(n2599), .B0(n5077), .Y(n727) );
  NOR2X1TS U122 ( .A(n5098), .B(n1517), .Y(n5161) );
  CLKINVX3TS U123 ( .A(n5035), .Y(n5044) );
  INVX2TS U124 ( .A(n5384), .Y(n5386) );
  INVX4TS U125 ( .A(n5767), .Y(n5098) );
  NAND2BX1TS U126 ( .AN(n5544), .B(n5510), .Y(n5520) );
  INVX4TS U127 ( .A(n5808), .Y(n5812) );
  AND2X2TS U128 ( .A(intDY_EWSW[21]), .B(n1458), .Y(n5530) );
  NAND2BX1TS U129 ( .AN(n2578), .B(DMP_SFG[21]), .Y(n5551) );
  AO22X1TS U130 ( .A0(intDY_EWSW[15]), .A1(n5884), .B0(n1438), .B1(
        intDY_EWSW[16]), .Y(n5531) );
  OAI211X1TS U131 ( .A0(n5663), .A1(n5639), .B0(n5595), .C0(n5594), .Y(n842)
         );
  OAI211X1TS U132 ( .A0(n5681), .A1(n5751), .B0(n5680), .C0(n5679), .Y(n856)
         );
  OAI211X1TS U133 ( .A0(n5663), .A1(n5748), .B0(n5620), .C0(n5619), .Y(n841)
         );
  OAI211X1TS U134 ( .A0(n4930), .A1(n5748), .B0(n5618), .C0(n5617), .Y(n846)
         );
  OAI211X1TS U135 ( .A0(n5657), .A1(n5748), .B0(n5626), .C0(n5625), .Y(n859)
         );
  OAI21X1TS U136 ( .A0(n5559), .A1(n5558), .B0(n5557), .Y(n590) );
  OAI211X1TS U137 ( .A0(n4929), .A1(n5639), .B0(n5587), .C0(n5586), .Y(n838)
         );
  OAI211X1TS U138 ( .A0(n4929), .A1(n5748), .B0(n5576), .C0(n5575), .Y(n837)
         );
  OAI211X1TS U139 ( .A0(n5657), .A1(n5757), .B0(n5651), .C0(n5650), .Y(n858)
         );
  OAI211X1TS U140 ( .A0(n5642), .A1(n5757), .B0(n5641), .C0(n5640), .Y(n857)
         );
  OAI211X1TS U141 ( .A0(n5616), .A1(n5748), .B0(n5600), .C0(n5599), .Y(n844)
         );
  OAI211X1TS U142 ( .A0(n4931), .A1(n5748), .B0(n5654), .C0(n5653), .Y(n850)
         );
  OAI211X1TS U143 ( .A0(n4931), .A1(n5757), .B0(n5646), .C0(n5645), .Y(n849)
         );
  OAI211X1TS U144 ( .A0(n5743), .A1(n5757), .B0(n5742), .C0(n5741), .Y(n839)
         );
  OAI211X1TS U145 ( .A0(n4930), .A1(n5757), .B0(n5623), .C0(n5622), .Y(n845)
         );
  OAI211X1TS U146 ( .A0(n5663), .A1(n5757), .B0(n5615), .C0(n5614), .Y(n840)
         );
  OAI211X1TS U147 ( .A0(n5663), .A1(n5751), .B0(n5662), .C0(n5661), .Y(n843)
         );
  OAI211X1TS U148 ( .A0(n5681), .A1(n5757), .B0(n5644), .C0(n5643), .Y(n853)
         );
  OAI211X1TS U149 ( .A0(n5749), .A1(n5748), .B0(n5747), .C0(n5746), .Y(n848)
         );
  OAI21X1TS U150 ( .A0(n5657), .A1(n5751), .B0(n5656), .Y(n861) );
  OAI21X1TS U151 ( .A0(n1432), .A1(n5737), .B0(n5716), .Y(n791) );
  OAI21X1TS U152 ( .A0(n1434), .A1(n5737), .B0(n5702), .Y(n815) );
  OAI21X1TS U153 ( .A0(n1491), .A1(n5737), .B0(n5715), .Y(n790) );
  OAI21X1TS U154 ( .A0(n1482), .A1(n5737), .B0(n5703), .Y(n818) );
  OAI21X1TS U155 ( .A0(n5484), .A1(n5470), .B0(n5483), .Y(n591) );
  OAI21X1TS U156 ( .A0(n5883), .A1(n5728), .B0(n5726), .Y(n801) );
  OAI21X1TS U157 ( .A0(n1458), .A1(n5737), .B0(n5706), .Y(n798) );
  OAI21X1TS U158 ( .A0(n1459), .A1(n5733), .B0(n5705), .Y(n663) );
  OAI21X1TS U159 ( .A0(n1488), .A1(n5733), .B0(n5701), .Y(n810) );
  OAI21X1TS U160 ( .A0(n1487), .A1(n5737), .B0(n5704), .Y(n797) );
  OAI21X1TS U161 ( .A0(n5868), .A1(n5728), .B0(n5699), .Y(n808) );
  OAI21X1TS U162 ( .A0(n1483), .A1(n5733), .B0(n5700), .Y(n817) );
  OAI21X1TS U163 ( .A0(n4774), .A1(n5737), .B0(n5721), .Y(n653) );
  OAI21X1TS U164 ( .A0(n5871), .A1(n5733), .B0(n5730), .Y(n811) );
  OAI21X1TS U165 ( .A0(n5869), .A1(n5841), .B0(n5709), .Y(n816) );
  OAI21X1TS U166 ( .A0(n5893), .A1(n5733), .B0(n5732), .Y(n641) );
  OAI21X1TS U167 ( .A0(n4780), .A1(n5733), .B0(n5717), .Y(n800) );
  OAI21X1TS U168 ( .A0(n1461), .A1(n5737), .B0(n5707), .Y(n799) );
  OAI21X1TS U169 ( .A0(n5881), .A1(n5733), .B0(n5712), .Y(n649) );
  OAI21X1TS U170 ( .A0(n1464), .A1(n5737), .B0(n5697), .Y(n792) );
  OAI21X1TS U171 ( .A0(n5936), .A1(n5733), .B0(n5714), .Y(n667) );
  OAI21X1TS U172 ( .A0(n5857), .A1(n5728), .B0(n5723), .Y(n802) );
  OAI21X1TS U173 ( .A0(n5859), .A1(n5733), .B0(n5729), .Y(n647) );
  OAI21X1TS U174 ( .A0(n5869), .A1(n5842), .B0(n5564), .Y(n671) );
  OAI21X1TS U175 ( .A0(n1464), .A1(n5674), .B0(n5673), .Y(n627) );
  OAI21X1TS U176 ( .A0(n1434), .A1(n5674), .B0(n5668), .Y(n669) );
  OAI21X1TS U177 ( .A0(n1482), .A1(n5674), .B0(n5666), .Y(n675) );
  OAI21X1TS U178 ( .A0(n1483), .A1(n5674), .B0(n5664), .Y(n673) );
  OAI21X1TS U179 ( .A0(n1488), .A1(n5842), .B0(n5561), .Y(n659) );
  OAI21X1TS U180 ( .A0(n5475), .A1(n5474), .B0(n5473), .Y(n592) );
  OAI21X1TS U181 ( .A0(n4780), .A1(n5674), .B0(n5669), .Y(n1155) );
  OAI21X1TS U182 ( .A0(n1459), .A1(n5674), .B0(n5671), .Y(n812) );
  OAI21X1TS U183 ( .A0(n1461), .A1(n5674), .B0(n5672), .Y(n637) );
  OAI21X1TS U184 ( .A0(n1437), .A1(n5842), .B0(n5567), .Y(n657) );
  OAI21X1TS U185 ( .A0(n5871), .A1(n5842), .B0(n5566), .Y(n661) );
  OAI21X1TS U186 ( .A0(n1487), .A1(n5674), .B0(n5665), .Y(n633) );
  OAI21X1TS U187 ( .A0(n5868), .A1(n5842), .B0(n5562), .Y(n655) );
  OAI21X1TS U188 ( .A0(n4937), .A1(n5842), .B0(n5565), .Y(n819) );
  OAI21X1TS U189 ( .A0(n1438), .A1(n5674), .B0(n5667), .Y(n645) );
  OAI21X1TS U190 ( .A0(n1458), .A1(n5674), .B0(n5670), .Y(n635) );
  OAI21X1TS U191 ( .A0(n5857), .A1(n5840), .B0(n5523), .Y(n643) );
  OAI21X1TS U192 ( .A0(n4774), .A1(n5842), .B0(n5568), .Y(n807) );
  OAI21X1TS U193 ( .A0(n5858), .A1(n5842), .B0(n5563), .Y(n651) );
  OAI211X1TS U194 ( .A0(n5406), .A1(n6001), .B0(n5398), .C0(n6000), .Y(n574)
         );
  OAI211X1TS U195 ( .A0(n5409), .A1(n6001), .B0(n5401), .C0(n6000), .Y(n575)
         );
  OAI21X1TS U196 ( .A0(n5464), .A1(n5470), .B0(n5463), .Y(n593) );
  OAI211X1TS U197 ( .A0(n5415), .A1(n6001), .B0(n5399), .C0(n6000), .Y(n572)
         );
  OAI21X1TS U198 ( .A0(n5428), .A1(n5427), .B0(n5426), .Y(n594) );
  OAI211X1TS U199 ( .A0(n4896), .A1(n6001), .B0(n5400), .C0(n6000), .Y(n576)
         );
  OAI21X1TS U200 ( .A0(n5809), .A1(n5635), .B0(n5392), .Y(n836) );
  OAI211X1TS U201 ( .A0(n6001), .A1(n5455), .B0(n5454), .C0(n6000), .Y(n570)
         );
  OAI211X1TS U202 ( .A0(n5409), .A1(n6003), .B0(n5408), .C0(n6002), .Y(n567)
         );
  OAI211X1TS U203 ( .A0(n5412), .A1(n6001), .B0(n5397), .C0(n6000), .Y(n571)
         );
  OAI211X1TS U204 ( .A0(n6003), .A1(n5458), .B0(n5396), .C0(n6002), .Y(n561)
         );
  OAI21X1TS U205 ( .A0(n5376), .A1(n5468), .B0(n5375), .Y(n595) );
  INVX3TS U206 ( .A(n5051), .Y(n5388) );
  OAI21X2TS U207 ( .A0(n5371), .A1(n4981), .B0(n4980), .Y(n4982) );
  OAI21X1TS U208 ( .A0(Raw_mant_NRM_SWR[3]), .A1(Raw_mant_NRM_SWR[2]), .B0(
        n5447), .Y(n5027) );
  OAI21X1TS U209 ( .A0(n5235), .A1(n5234), .B0(n5233), .Y(n597) );
  OAI21X1TS U210 ( .A0(n5282), .A1(n5281), .B0(n5280), .Y(n598) );
  AO21XLTS U211 ( .A0(n5003), .A1(n5002), .B0(n5001), .Y(n599) );
  OAI21X1TS U212 ( .A0(n5245), .A1(n5244), .B0(n5243), .Y(n601) );
  OAI21X1TS U213 ( .A0(n5254), .A1(n5253), .B0(n5252), .Y(n600) );
  OAI21X1TS U214 ( .A0(n5265), .A1(n5264), .B0(n5263), .Y(n602) );
  OAI21X1TS U215 ( .A0(n4934), .A1(n3615), .B0(n5296), .Y(n604) );
  OAI21X1TS U216 ( .A0(n4934), .A1(n4768), .B0(n5336), .Y(n605) );
  OAI21X1TS U217 ( .A0(n4934), .A1(n3677), .B0(n5351), .Y(n608) );
  OAI21X1TS U218 ( .A0(n4933), .A1(n2535), .B0(n5368), .Y(n609) );
  OAI21X1TS U219 ( .A0(n4933), .A1(n3616), .B0(n5322), .Y(n606) );
  OAI21X1TS U220 ( .A0(n5295), .A1(n5294), .B0(n5293), .Y(n5296) );
  OAI21X1TS U221 ( .A0(n4933), .A1(n5902), .B0(n5309), .Y(n607) );
  OAI211X1TS U222 ( .A0(n5415), .A1(n5220), .B0(n5169), .C0(n5168), .Y(n539)
         );
  OAI211X1TS U223 ( .A0(n5363), .A1(n5362), .B0(n5361), .C0(n5365), .Y(n5364)
         );
  OAI21X1TS U224 ( .A0(n4933), .A1(n5913), .B0(n5189), .Y(n610) );
  OAI21X1TS U225 ( .A0(n5470), .A1(n5227), .B0(n5226), .Y(n612) );
  OAI211X1TS U226 ( .A0(n5303), .A1(n5362), .B0(n5302), .C0(n5304), .Y(n5308)
         );
  OAI211X1TS U227 ( .A0(n5406), .A1(n5220), .B0(n5175), .C0(n5174), .Y(n541)
         );
  OAI211X2TS U228 ( .A0(n5239), .A1(n4973), .B0(n4972), .C0(n4971), .Y(n4974)
         );
  NOR4X1TS U229 ( .A(exp_rslt_NRM2_EW1[5]), .B(exp_rslt_NRM2_EW1[4]), .C(
        exp_rslt_NRM2_EW1[6]), .D(exp_rslt_NRM2_EW1[2]), .Y(n4945) );
  OAI211X1TS U230 ( .A0(n5409), .A1(n5220), .B0(n5177), .C0(n5176), .Y(n542)
         );
  OAI211X1TS U231 ( .A0(n5468), .A1(n5318), .B0(n5316), .C0(n5317), .Y(n5321)
         );
  OAI211X1TS U232 ( .A0(n5412), .A1(n5220), .B0(n5167), .C0(n5166), .Y(n538)
         );
  OAI211X1TS U233 ( .A0(n5211), .A1(n5220), .B0(n5210), .C0(n5209), .Y(n534)
         );
  OAI21X1TS U234 ( .A0(n5439), .A1(n5158), .B0(n5106), .Y(n549) );
  OAI21X1TS U235 ( .A0(n5439), .A1(n5762), .B0(n5107), .Y(n544) );
  OAI211X1TS U236 ( .A0(n6004), .A1(n5220), .B0(n5219), .C0(n5218), .Y(n540)
         );
  OAI211X1TS U237 ( .A0(n5458), .A1(n5220), .B0(n5173), .C0(n5172), .Y(n536)
         );
  AOI21X2TS U238 ( .A0(n5014), .A1(n5286), .B0(n4952), .Y(n4954) );
  NOR2X1TS U239 ( .A(n5225), .B(n5455), .Y(n5180) );
  NAND2BX1TS U240 ( .AN(n5206), .B(n5205), .Y(n5430) );
  AOI31X2TS U241 ( .A0(n5315), .A1(n5314), .A2(n5323), .B0(n4950), .Y(n5014)
         );
  OAI211X1TS U242 ( .A0(n5184), .A1(n5468), .B0(n5183), .C0(n5186), .Y(n5185)
         );
  NAND2BX1TS U243 ( .AN(n5103), .B(n5102), .Y(n5104) );
  OAI21X1TS U244 ( .A0(n5761), .A1(n2570), .B0(n5082), .Y(n742) );
  OAI21X1TS U245 ( .A0(n5824), .A1(n2551), .B0(n5085), .Y(n769) );
  OAI21X1TS U246 ( .A0(n5093), .A1(n4765), .B0(n5084), .Y(n778) );
  NAND2X4TS U247 ( .A(n5044), .B(n4788), .Y(n5381) );
  OAI211X2TS U248 ( .A0(n5409), .A1(n5995), .B0(n5191), .C0(n5190), .Y(n5393)
         );
  OAI21X1TS U249 ( .A0(n5093), .A1(n2582), .B0(n5089), .Y(n724) );
  OAI21X1TS U250 ( .A0(n5093), .A1(n4775), .B0(n5091), .Y(n766) );
  OAI21X1TS U251 ( .A0(n5761), .A1(n2557), .B0(n5080), .Y(n760) );
  OAI21X1TS U252 ( .A0(n5824), .A1(n3619), .B0(n5087), .Y(n781) );
  NAND3X2TS U253 ( .A(n4965), .B(n4964), .C(n5311), .Y(n5284) );
  OAI21X1TS U254 ( .A0(n5093), .A1(n2545), .B0(n5086), .Y(n784) );
  OAI211X2TS U255 ( .A0(n5915), .A1(n5202), .B0(n5201), .C0(n5105), .Y(n5437)
         );
  OAI211X2TS U256 ( .A0(n5406), .A1(n5995), .B0(n5150), .C0(n5149), .Y(n5456)
         );
  OAI211X2TS U257 ( .A0(n5415), .A1(n4908), .B0(n5133), .C0(n5132), .Y(n5410)
         );
  OAI21X1TS U258 ( .A0(n5093), .A1(n2559), .B0(n5079), .Y(n748) );
  OAI21X1TS U259 ( .A0(n5824), .A1(n2556), .B0(n5092), .Y(n763) );
  OAI211X2TS U260 ( .A0(n4908), .A1(n5211), .B0(n5122), .C0(n5121), .Y(n5402)
         );
  NOR2X4TS U261 ( .A(n5158), .B(n5157), .Y(n5159) );
  OAI211X2TS U262 ( .A0(n5995), .A1(n5395), .B0(n5146), .C0(n5145), .Y(n5407)
         );
  OAI211X2TS U263 ( .A0(n4908), .A1(n5455), .B0(n5217), .C0(n5216), .Y(n5775)
         );
  OAI211X2TS U264 ( .A0(n5912), .A1(n5202), .B0(n5201), .C0(n5200), .Y(n5766)
         );
  NOR2X4TS U265 ( .A(n5762), .B(n5157), .Y(n5114) );
  OAI21X1TS U266 ( .A0(n5824), .A1(n2575), .B0(n5090), .Y(n730) );
  OAI211X2TS U267 ( .A0(n5995), .A1(n5458), .B0(n5112), .C0(n5111), .Y(n5404)
         );
  OAI21X1TS U268 ( .A0(n5761), .A1(n2560), .B0(n5083), .Y(n751) );
  INVX3TS U269 ( .A(n5465), .Y(n5470) );
  INVX2TS U270 ( .A(n5465), .Y(n5692) );
  OAI211X2TS U271 ( .A0(n5021), .A1(n1499), .B0(n5813), .C0(n5057), .Y(n5655)
         );
  OAI21X2TS U272 ( .A0(n1434), .A1(intDY_EWSW[4]), .B0(n5488), .Y(n5489) );
  INVX2TS U273 ( .A(n5823), .Y(n5824) );
  INVX3TS U274 ( .A(n5571), .Y(n5658) );
  NOR2BX2TS U275 ( .AN(n5518), .B(n5517), .Y(n5519) );
  INVX2TS U276 ( .A(n5823), .Y(n5093) );
  INVX3TS U277 ( .A(n4898), .Y(n4915) );
  INVX3TS U278 ( .A(n5058), .Y(n5627) );
  INVX3TS U279 ( .A(n5571), .Y(n5676) );
  INVX3TS U280 ( .A(n5767), .Y(n5160) );
  NAND2BX1TS U281 ( .AN(n5130), .B(n5011), .Y(n5012) );
  NAND2BX1TS U282 ( .AN(n5130), .B(n5129), .Y(n5131) );
  NAND2BX1TS U283 ( .AN(n5130), .B(n5126), .Y(n5127) );
  NOR2X1TS U284 ( .A(n5041), .B(Raw_mant_NRM_SWR[25]), .Y(n5042) );
  NAND2BXLTS U285 ( .AN(n4997), .B(n4955), .Y(n4956) );
  INVX3TS U286 ( .A(n4897), .Y(n4917) );
  OR2X2TS U287 ( .A(shift_value_SHT2_EWR[4]), .B(n5120), .Y(n4898) );
  INVX3TS U288 ( .A(n5811), .Y(n5632) );
  INVX2TS U289 ( .A(n5808), .Y(n5853) );
  NAND2BX1TS U290 ( .AN(n5229), .B(n5228), .Y(n5234) );
  NAND2BX1TS U291 ( .AN(n5552), .B(n5551), .Y(n5558) );
  OAI211X2TS U292 ( .A0(n1459), .A1(intDX_EWSW[7]), .B0(n5493), .C0(n5490), 
        .Y(n5534) );
  AND2X2TS U293 ( .A(n5822), .B(OP_FLAG_SFG), .Y(n5292) );
  NAND2BX1TS U294 ( .AN(n5369), .B(n5370), .Y(n5005) );
  NOR2X1TS U295 ( .A(n5915), .B(n5137), .Y(n5010) );
  INVX2TS U296 ( .A(n5836), .Y(n5850) );
  NAND2BX1TS U297 ( .AN(n5477), .B(n5476), .Y(n5479) );
  OR2X2TS U298 ( .A(shift_value_SHT2_EWR[4]), .B(n5137), .Y(n4897) );
  INVX3TS U299 ( .A(n5825), .Y(busy) );
  AND2X2TS U300 ( .A(n5030), .B(n5024), .Y(n5382) );
  NAND2BX1TS U301 ( .AN(n5467), .B(n5466), .Y(n5474) );
  NOR2X1TS U302 ( .A(LZD_output_NRM2_EW[3]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n15) );
  NAND2BX1TS U303 ( .AN(n2586), .B(n1516), .Y(n5683) );
  NOR2X1TS U304 ( .A(LZD_output_NRM2_EW[4]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n14) );
  NOR2X1TS U305 ( .A(LZD_output_NRM2_EW[2]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n16) );
  NOR2X1TS U306 ( .A(n4753), .B(n1430), .Y(n5512) );
  AOI2BB2X1TS U307 ( .B0(n1430), .B1(n4753), .A0N(n73), .A1N(n4755), .Y(n5511)
         );
  OAI211X2TS U308 ( .A0(n5938), .A1(n5944), .B0(n5943), .C0(n5942), .Y(
        final_result_ieee[4]) );
  OAI211X2TS U309 ( .A0(n5938), .A1(n5941), .B0(n5940), .C0(n5939), .Y(
        final_result_ieee[17]) );
  INVX3TS U310 ( .A(n5937), .Y(n4923) );
  OAI2BB1X4TS U311 ( .A0N(n4769), .A1N(n2565), .B0(n4958), .Y(n5373) );
  AO21X4TS U312 ( .A0(n5555), .A1(n5551), .B0(n5552), .Y(n5685) );
  AOI22X2TS U313 ( .A0(n4831), .A1(n5893), .B0(n5529), .B1(n5503), .Y(n5504)
         );
  OAI211X1TS U314 ( .A0(n5681), .A1(n5748), .B0(n5648), .C0(n5647), .Y(n854)
         );
  OA21X4TS U315 ( .A0(n4994), .A1(n4956), .B0(n4941), .Y(n4957) );
  OAI211X1TS U316 ( .A0(n5444), .A1(n5435), .B0(n5434), .C0(n5442), .Y(n581)
         );
  OAI2BB1X4TS U317 ( .A0N(n2586), .A1N(n1516), .B0(n4987), .Y(n5769) );
  OAI21X4TS U318 ( .A0(n2560), .A1(n1509), .B0(n4974), .Y(n4998) );
  AOI21X4TS U319 ( .A0(n2575), .A1(n5908), .B0(n4983), .Y(n5469) );
  AOI21X2TS U320 ( .A0(n3657), .A1(n5904), .B0(n5461), .Y(n4983) );
  NOR2X4TS U321 ( .A(n5752), .B(n5572), .Y(n5579) );
  XNOR2X4TS U322 ( .A(DP_OP_15J43_122_6956_n1), .B(n2563), .Y(n4944) );
  OAI211X1TS U323 ( .A0(n6001), .A1(n5458), .B0(n5457), .C0(n6000), .Y(n569)
         );
  NAND2BXLTS U324 ( .AN(n2551), .B(n3637), .Y(n4964) );
  CLKAND2X2TS U325 ( .A(n5283), .B(n5327), .Y(n4967) );
  NAND2BX1TS U326 ( .AN(n1514), .B(n3619), .Y(n5353) );
  OR2X1TS U327 ( .A(n4765), .B(n4837), .Y(n5359) );
  CLKAND2X2TS U328 ( .A(n2557), .B(n4760), .Y(n5237) );
  OR2X1TS U329 ( .A(n3627), .B(n2545), .Y(n5797) );
  NAND2BXLTS U330 ( .AN(n3637), .B(n2551), .Y(n5283) );
  NAND2BXLTS U331 ( .AN(n4759), .B(n4806), .Y(n4962) );
  OR2X1TS U332 ( .A(n4765), .B(n5879), .Y(n5340) );
  INVX2TS U333 ( .A(n5030), .Y(n5034) );
  AOI2BB1XLTS U334 ( .A0N(n5040), .A1N(Raw_mant_NRM_SWR[23]), .B0(
        Raw_mant_NRM_SWR[24]), .Y(n5041) );
  INVX2TS U335 ( .A(n5993), .Y(n4901) );
  OR2X1TS U336 ( .A(n4775), .B(n5875), .Y(n5328) );
  OR2X1TS U337 ( .A(n2556), .B(n3638), .Y(n5287) );
  CLKAND2X2TS U338 ( .A(n2558), .B(n1510), .Y(n5247) );
  OAI21X2TS U339 ( .A0(n5016), .A1(n4970), .B0(n4969), .Y(n5239) );
  NAND2BX1TS U340 ( .AN(n5015), .B(n4968), .Y(n4970) );
  INVX2TS U341 ( .A(n5578), .Y(n5573) );
  AO21XLTS U342 ( .A0(DmP_mant_SHT1_SW[13]), .A1(n5812), .B0(n5628), .Y(n4895)
         );
  CLKAND2X2TS U343 ( .A(n2557), .B(n5892), .Y(n5255) );
  NAND2X1TS U344 ( .A(n5144), .B(n5143), .Y(n5395) );
  OAI21X2TS U345 ( .A0(n2586), .A1(n1516), .B0(n5688), .Y(n4987) );
  NOR2XLTS U346 ( .A(n5926), .B(n5137), .Y(n5128) );
  INVX2TS U347 ( .A(n5770), .Y(n5689) );
  OR2X1TS U348 ( .A(n4994), .B(n4993), .Y(n5250) );
  AO22XLTS U349 ( .A0(n5261), .A1(n5550), .B0(n5277), .B1(n5260), .Y(n5262) );
  NOR2XLTS U350 ( .A(n5864), .B(n5137), .Y(n5125) );
  NAND2BXLTS U351 ( .AN(n5139), .B(n5138), .Y(n5140) );
  OAI21XLTS U352 ( .A0(n5912), .A1(n5204), .B0(n5101), .Y(n5103) );
  NAND2BXLTS U353 ( .AN(n5118), .B(n5117), .Y(n5119) );
  CLKAND2X2TS U354 ( .A(n5581), .B(n5580), .Y(n5642) );
  NAND2BXLTS U355 ( .AN(n5813), .B(DmP_mant_SHT1_SW[21]), .Y(n5580) );
  AOI2BB2XLTS U356 ( .B0(n5604), .B1(Raw_mant_NRM_SWR[2]), .A0N(n5627), .A1N(
        n5922), .Y(n5581) );
  AOI2BB2XLTS U357 ( .B0(n4900), .B1(n4747), .A0N(n5813), .A1N(n3672), .Y(
        n5611) );
  AO21XLTS U358 ( .A0(DmP_mant_SHT1_SW[0]), .A1(n5632), .B0(n5569), .Y(n4893)
         );
  AO22XLTS U359 ( .A0(n4899), .A1(Raw_mant_NRM_SWR[2]), .B0(
        Raw_mant_NRM_SWR[23]), .B1(n5631), .Y(n5569) );
  CLKAND2X2TS U360 ( .A(n5603), .B(n5602), .Y(n5749) );
  NAND2BXLTS U361 ( .AN(n5813), .B(DmP_mant_SHT1_SW[11]), .Y(n5602) );
  AOI2BB2XLTS U362 ( .B0(Raw_mant_NRM_SWR[12]), .B1(n5604), .A0N(n5627), .A1N(
        n5872), .Y(n5603) );
  NAND2BXLTS U363 ( .AN(n3617), .B(n5853), .Y(n5590) );
  CLKAND2X2TS U364 ( .A(n5604), .B(n5856), .Y(n5596) );
  INVX2TS U365 ( .A(n5639), .Y(n4920) );
  AO21XLTS U366 ( .A0(DmP_mant_SHT1_SW[9]), .A1(n5812), .B0(n5601), .Y(n4894)
         );
  BUFX3TS U367 ( .A(n3605), .Y(n5811) );
  AOI31XLTS U368 ( .A0(n5378), .A1(n5447), .A2(n5866), .B0(n5377), .Y(n5380)
         );
  NOR2XLTS U369 ( .A(Raw_mant_NRM_SWR[3]), .B(Raw_mant_NRM_SWR[2]), .Y(n5378)
         );
  INVX2TS U370 ( .A(n4891), .Y(n4928) );
  INVX2TS U371 ( .A(n4891), .Y(n4927) );
  AO22XLTS U372 ( .A0(n5804), .A1(intDY_EWSW[5]), .B0(n5791), .B1(Data_Y[5]), 
        .Y(n891) );
  AOI31XLTS U373 ( .A0(n3623), .A1(n5877), .A2(n5492), .B0(n5491), .Y(n5495)
         );
  NOR2X4TS U374 ( .A(n5381), .B(n5025), .Y(n5379) );
  INVX2TS U375 ( .A(n5535), .Y(n5510) );
  INVX2TS U376 ( .A(n5352), .Y(n5354) );
  INVX2TS U377 ( .A(n4993), .Y(n4955) );
  NOR3X4TS U378 ( .A(shift_value_SHT2_EWR[4]), .B(n3609), .C(n5905), .Y(n5215)
         );
  NOR2X4TS U379 ( .A(n5860), .B(n5046), .Y(n5447) );
  NAND2X1TS U380 ( .A(n1434), .B(intDY_EWSW[4]), .Y(n5526) );
  CLKAND2X2TS U381 ( .A(intDY_EWSW[19]), .B(n4780), .Y(n5527) );
  OAI21X2TS U382 ( .A0(n5685), .A1(n5682), .B0(n5683), .Y(n4961) );
  NAND3XLTS U383 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n6005), .C(n5901), .Y(n5846) );
  AO22XLTS U384 ( .A0(n4900), .A1(Raw_mant_NRM_SWR[19]), .B0(n5631), .B1(
        Raw_mant_NRM_SWR[6]), .Y(n5608) );
  AO22XLTS U385 ( .A0(n5004), .A1(n5550), .B0(n5554), .B1(n5371), .Y(n5006) );
  INVX2TS U386 ( .A(n5271), .Y(n5786) );
  NAND2BX2TS U387 ( .AN(n5448), .B(n5039), .Y(n5783) );
  OAI21XLTS U388 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n5629), .B0(n4841), .Y(n5043) );
  OAI21XLTS U389 ( .A0(n5915), .A1(n5204), .B0(n5203), .Y(n5206) );
  AO22XLTS U390 ( .A0(n4900), .A1(Raw_mant_NRM_SWR[6]), .B0(
        Raw_mant_NRM_SWR[19]), .B1(n5631), .Y(n5588) );
  NOR2XLTS U391 ( .A(n5532), .B(n5531), .Y(n5538) );
  AO22XLTS U392 ( .A0(n5816), .A1(DmP_EXP_EWSW[17]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[17]), .Y(n642) );
  AO22XLTS U393 ( .A0(n5818), .A1(DmP_EXP_EWSW[4]), .B0(n5817), .B1(
        DmP_mant_SHT1_SW[4]), .Y(n668) );
  AOI2BB2XLTS U394 ( .B0(n3671), .B1(n5850), .A0N(n5850), .A1N(DmP_EXP_EWSW[8]), .Y(n660) );
  OAI21XLTS U395 ( .A0(n5326), .A1(n5692), .B0(n5319), .Y(n5320) );
  OAI211XLTS U396 ( .A0(n5357), .A1(n5331), .B0(n5329), .C0(n5330), .Y(n5335)
         );
  AO22XLTS U397 ( .A0(n5826), .A1(n5801), .B0(n5814), .B1(
        Shift_amount_SHT1_EWR[1]), .Y(n831) );
  MX2X1TS U398 ( .A(DMP_SHT2_EWSW[9]), .B(DMP_SFG[9]), .S0(n5823), .Y(n757) );
  AOI2BB2XLTS U399 ( .B0(n5813), .B1(n5809), .A0N(LZD_output_NRM2_EW[2]), 
        .A1N(n3605), .Y(n585) );
  MX2X1TS U400 ( .A(DMP_SHT2_EWSW[21]), .B(DMP_SFG[21]), .S0(n5768), .Y(n721)
         );
  AOI2BB2XLTS U401 ( .B0(n4934), .B1(n5800), .A0N(Raw_mant_NRM_SWR[2]), .A1N(
        n4933), .Y(n611) );
  NAND2BXLTS U402 ( .AN(n5847), .B(n5846), .Y(n937) );
  NOR2XLTS U403 ( .A(n5356), .B(n5692), .Y(n5367) );
  NOR2XLTS U404 ( .A(n5360), .B(n5357), .Y(n5366) );
  AO21XLTS U405 ( .A0(n5020), .A1(n5019), .B0(n5018), .Y(n603) );
  AO22XLTS U406 ( .A0(n5790), .A1(intDY_EWSW[30]), .B0(n5791), .B1(Data_Y[30]), 
        .Y(n866) );
  OAI21XLTS U407 ( .A0(n5455), .A1(n5220), .B0(n5162), .Y(n537) );
  AOI211XLTS U408 ( .A0(n5453), .A1(n4907), .B0(n5159), .C0(n5161), .Y(n5162)
         );
  OAI211XLTS U409 ( .A0(n5395), .A1(n5220), .B0(n5193), .C0(n5192), .Y(n535)
         );
  NOR2XLTS U410 ( .A(n5355), .B(n5692), .Y(n5188) );
  NOR2XLTS U411 ( .A(n5357), .B(n5182), .Y(n5187) );
  MX2X1TS U412 ( .A(DMP_SHT2_EWSW[15]), .B(n5885), .S0(n5823), .Y(n739) );
  MX2X1TS U413 ( .A(DMP_SHT2_EWSW[16]), .B(n5897), .S0(n5823), .Y(n736) );
  MX2X1TS U414 ( .A(DMP_SHT2_EWSW[22]), .B(n5917), .S0(n5820), .Y(n718) );
  MX2X1TS U415 ( .A(DMP_SHT2_EWSW[17]), .B(n5909), .S0(n5767), .Y(n733) );
  AOI2BB2XLTS U416 ( .B0(n3672), .B1(n5850), .A0N(n5850), .A1N(
        DmP_EXP_EWSW[18]), .Y(n640) );
  OAI21XLTS U417 ( .A0(n5093), .A1(n4759), .B0(n5081), .Y(n775) );
  AO22XLTS U418 ( .A0(n5808), .A1(DMP_exp_NRM_EW[0]), .B0(n4939), .B1(
        DMP_exp_NRM2_EW[0]), .Y(n713) );
  OAI211XLTS U419 ( .A0(n6003), .A1(n5395), .B0(n5394), .C0(n6002), .Y(n560)
         );
  OAI211XLTS U420 ( .A0(n5412), .A1(n6003), .B0(n5411), .C0(n6002), .Y(n563)
         );
  OAI211XLTS U421 ( .A0(n5415), .A1(n6003), .B0(n5414), .C0(n6002), .Y(n564)
         );
  OAI211XLTS U422 ( .A0(n5406), .A1(n6003), .B0(n5405), .C0(n6002), .Y(n566)
         );
  OAI211XLTS U423 ( .A0(n4896), .A1(n6003), .B0(n5403), .C0(n6002), .Y(n568)
         );
  OAI21XLTS U424 ( .A0(n5439), .A1(n4909), .B0(n5438), .Y(n577) );
  OAI21XLTS U425 ( .A0(n5439), .A1(n5435), .B0(n5429), .Y(n578) );
  OAI21XLTS U426 ( .A0(n5763), .A1(n4909), .B0(n5436), .Y(n579) );
  OAI21XLTS U427 ( .A0(n5763), .A1(n5435), .B0(n5431), .Y(n580) );
  NAND2BXLTS U428 ( .AN(SIGN_FLAG_SHT1SHT2), .B(n5786), .Y(n5773) );
  AOI2BB1XLTS U429 ( .A0N(overflow_flag), .A1N(n4902), .B0(n5785), .Y(n625) );
  AO21XLTS U430 ( .A0(n5852), .A1(underflow_flag), .B0(n5787), .Y(n626) );
  NOR2XLTS U431 ( .A(n5852), .B(n5786), .Y(n5787) );
  AO21XLTS U432 ( .A0(n5766), .A1(n5765), .B0(n5764), .Y(n545) );
  OAI21XLTS U433 ( .A0(n5348), .A1(n5692), .B0(n5347), .Y(n5349) );
  AO22XLTS U434 ( .A0(n5826), .A1(DmP_EXP_EWSW[7]), .B0(n5814), .B1(
        DmP_mant_SHT1_SW[7]), .Y(n662) );
  AO22XLTS U435 ( .A0(n5851), .A1(n4745), .B0(n5854), .B1(n5843), .Y(n936) );
  MX2X1TS U436 ( .A(DMP_SHT2_EWSW[10]), .B(n4936), .S0(n5768), .Y(n754) );
  NOR2BX1TS U437 ( .AN(n5769), .B(DmP_mant_SFG_SWR_25_), .Y(n5771) );
  AOI2BB1XLTS U438 ( .A0N(n2597), .A1N(n5761), .B0(n5114), .Y(n5198) );
  AO22XLTS U439 ( .A0(n3605), .A1(n5783), .B0(n4939), .B1(
        LZD_output_NRM2_EW[1]), .Y(n584) );
  AO21XLTS U440 ( .A0(LZD_output_NRM2_EW[0]), .A1(n4939), .B0(n5784), .Y(n586)
         );
  AO22XLTS U441 ( .A0(n5826), .A1(DmP_EXP_EWSW[22]), .B0(n5814), .B1(
        DmP_mant_SHT1_SW[22]), .Y(n632) );
  AO22XLTS U442 ( .A0(n5826), .A1(DmP_EXP_EWSW[15]), .B0(n5814), .B1(
        DmP_mant_SHT1_SW[15]), .Y(n646) );
  AOI2BB2XLTS U443 ( .B0(n3617), .B1(n5850), .A0N(n5782), .A1N(DmP_EXP_EWSW[3]), .Y(n670) );
  AOI2BB2XLTS U444 ( .B0(n3673), .B1(n5850), .A0N(n5782), .A1N(DmP_EXP_EWSW[5]), .Y(n666) );
  AOI2BB2XLTS U445 ( .B0(n3674), .B1(n5850), .A0N(n5782), .A1N(
        DmP_EXP_EWSW[12]), .Y(n652) );
  AOI2BB2XLTS U446 ( .B0(n5554), .B1(n5231), .A0N(n5230), .A1N(n5362), .Y(
        n5235) );
  AOI2BB2XLTS U447 ( .B0(n5278), .B1(n5550), .A0N(n5276), .A1N(n5468), .Y(
        n5282) );
  OR2X1TS U448 ( .A(n5275), .B(n5274), .Y(n5281) );
  OAI21XLTS U449 ( .A0(n5444), .A1(n5762), .B0(n5165), .Y(n547) );
  NOR2XLTS U450 ( .A(n5291), .B(n5470), .Y(n5295) );
  OAI21XLTS U451 ( .A0(n5289), .A1(n5468), .B0(n5288), .Y(n5294) );
  OAI21XLTS U452 ( .A0(n3609), .A1(n5571), .B0(n5383), .Y(n835) );
  OAI21XLTS U453 ( .A0(n1493), .A1(n5571), .B0(n5627), .Y(n864) );
  AO22XLTS U454 ( .A0(n5826), .A1(n5807), .B0(n5814), .B1(
        Shift_amount_SHT1_EWR[0]), .Y(n832) );
  OAI21XLTS U455 ( .A0(n1492), .A1(DmP_EXP_EWSW[23]), .B0(n5806), .Y(n5807) );
  AO22XLTS U456 ( .A0(n5808), .A1(DMP_exp_NRM_EW[2]), .B0(n4939), .B1(
        DMP_exp_NRM2_EW[2]), .Y(n703) );
  AO22XLTS U457 ( .A0(n3605), .A1(DMP_exp_NRM_EW[3]), .B0(n5853), .B1(
        DMP_exp_NRM2_EW[3]), .Y(n698) );
  AO22XLTS U458 ( .A0(n5811), .A1(DMP_exp_NRM_EW[5]), .B0(n5812), .B1(
        DMP_exp_NRM2_EW[5]), .Y(n688) );
  AO22XLTS U459 ( .A0(n3605), .A1(DMP_exp_NRM_EW[6]), .B0(n5853), .B1(
        DMP_exp_NRM2_EW[6]), .Y(n683) );
  AO22XLTS U460 ( .A0(n3605), .A1(DMP_exp_NRM_EW[7]), .B0(n5812), .B1(
        DMP_exp_NRM2_EW[7]), .Y(n678) );
  MX2X1TS U461 ( .A(OP_FLAG_SHT2), .B(OP_FLAG_SFG), .S0(n5767), .Y(n622) );
  AO22XLTS U462 ( .A0(n3605), .A1(DMP_exp_NRM_EW[1]), .B0(n5853), .B1(
        DMP_exp_NRM2_EW[1]), .Y(n708) );
  AO22XLTS U463 ( .A0(n3605), .A1(DMP_exp_NRM_EW[4]), .B0(n5812), .B1(
        DMP_exp_NRM2_EW[4]), .Y(n693) );
  AO22XLTS U464 ( .A0(n5808), .A1(n5772), .B0(n4939), .B1(
        LZD_output_NRM2_EW[4]), .Y(n583) );
  AO22XLTS U465 ( .A0(n5811), .A1(n5810), .B0(n5853), .B1(
        LZD_output_NRM2_EW[3]), .Y(n587) );
  AO22XLTS U466 ( .A0(n5813), .A1(SIGN_FLAG_NRM), .B0(n5812), .B1(
        SIGN_FLAG_SHT1SHT2), .Y(n615) );
  AO22XLTS U467 ( .A0(n4934), .A1(SIGN_FLAG_SFG), .B0(n5819), .B1(
        SIGN_FLAG_NRM), .Y(n616) );
  AO22XLTS U468 ( .A0(n5093), .A1(SIGN_FLAG_SHT2), .B0(n5820), .B1(
        SIGN_FLAG_SFG), .Y(n617) );
  AO22XLTS U469 ( .A0(n5828), .A1(SIGN_FLAG_SHT1), .B0(n5831), .B1(
        SIGN_FLAG_SHT2), .Y(n618) );
  AO22XLTS U470 ( .A0(n5826), .A1(SIGN_FLAG_EXP), .B0(n5814), .B1(
        SIGN_FLAG_SHT1), .Y(n619) );
  AO22XLTS U471 ( .A0(n5855), .A1(OP_FLAG_SHT1), .B0(n5825), .B1(OP_FLAG_SHT2), 
        .Y(n623) );
  AO22XLTS U472 ( .A0(n5816), .A1(OP_FLAG_EXP), .B0(n5815), .B1(OP_FLAG_SHT1), 
        .Y(n624) );
  AO22XLTS U473 ( .A0(n5816), .A1(DmP_EXP_EWSW[21]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[21]), .Y(n634) );
  AO22XLTS U474 ( .A0(n5816), .A1(DmP_EXP_EWSW[20]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[20]), .Y(n636) );
  AO22XLTS U475 ( .A0(n5816), .A1(DmP_EXP_EWSW[19]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[19]), .Y(n638) );
  AO22XLTS U476 ( .A0(n5816), .A1(DmP_EXP_EWSW[16]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[16]), .Y(n644) );
  AO22XLTS U477 ( .A0(n5816), .A1(DmP_EXP_EWSW[14]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[14]), .Y(n648) );
  AO22XLTS U478 ( .A0(n5816), .A1(DmP_EXP_EWSW[13]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n650) );
  AO22XLTS U479 ( .A0(n5816), .A1(DmP_EXP_EWSW[11]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[11]), .Y(n654) );
  AO22XLTS U480 ( .A0(n5816), .A1(DmP_EXP_EWSW[10]), .B0(n5815), .B1(
        DmP_mant_SHT1_SW[10]), .Y(n656) );
  AO22XLTS U481 ( .A0(n5818), .A1(DmP_EXP_EWSW[9]), .B0(n5817), .B1(
        DmP_mant_SHT1_SW[9]), .Y(n658) );
  AO22XLTS U482 ( .A0(n5818), .A1(DmP_EXP_EWSW[6]), .B0(n5817), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n664) );
  AO22XLTS U483 ( .A0(n5818), .A1(DmP_EXP_EWSW[2]), .B0(n5817), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n672) );
  AO22XLTS U484 ( .A0(n5818), .A1(DmP_EXP_EWSW[1]), .B0(n5817), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n674) );
  AO22XLTS U485 ( .A0(n5818), .A1(DmP_EXP_EWSW[0]), .B0(n5817), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n676) );
  AO22XLTS U486 ( .A0(n4933), .A1(DMP_SFG[30]), .B0(n5819), .B1(
        DMP_exp_NRM_EW[7]), .Y(n679) );
  AO22XLTS U487 ( .A0(n5824), .A1(DMP_SHT2_EWSW[30]), .B0(n5820), .B1(
        DMP_SFG[30]), .Y(n680) );
  AO22XLTS U488 ( .A0(n5829), .A1(DMP_SHT1_EWSW[30]), .B0(n5825), .B1(
        DMP_SHT2_EWSW[30]), .Y(n681) );
  AO22XLTS U489 ( .A0(n5818), .A1(DMP_EXP_EWSW[30]), .B0(n5817), .B1(
        DMP_SHT1_EWSW[30]), .Y(n682) );
  AO22XLTS U490 ( .A0(n4934), .A1(DMP_SFG[29]), .B0(n5819), .B1(
        DMP_exp_NRM_EW[6]), .Y(n684) );
  AO22XLTS U491 ( .A0(n5093), .A1(DMP_SHT2_EWSW[29]), .B0(n5820), .B1(
        DMP_SFG[29]), .Y(n685) );
  AO22XLTS U492 ( .A0(n5829), .A1(DMP_SHT1_EWSW[29]), .B0(n5849), .B1(
        DMP_SHT2_EWSW[29]), .Y(n686) );
  AO22XLTS U493 ( .A0(n5818), .A1(DMP_EXP_EWSW[29]), .B0(n5817), .B1(
        DMP_SHT1_EWSW[29]), .Y(n687) );
  AO22XLTS U494 ( .A0(n4934), .A1(DMP_SFG[28]), .B0(n5821), .B1(
        DMP_exp_NRM_EW[5]), .Y(n689) );
  AO22XLTS U495 ( .A0(n5824), .A1(DMP_SHT2_EWSW[28]), .B0(n5820), .B1(
        DMP_SFG[28]), .Y(n690) );
  AO22XLTS U496 ( .A0(n5855), .A1(DMP_SHT1_EWSW[28]), .B0(n5931), .B1(
        DMP_SHT2_EWSW[28]), .Y(n691) );
  AO22XLTS U497 ( .A0(n5818), .A1(DMP_EXP_EWSW[28]), .B0(n5817), .B1(
        DMP_SHT1_EWSW[28]), .Y(n692) );
  AO22XLTS U498 ( .A0(n4933), .A1(DMP_SFG[27]), .B0(n5821), .B1(
        DMP_exp_NRM_EW[4]), .Y(n694) );
  AO22XLTS U499 ( .A0(n5093), .A1(DMP_SHT2_EWSW[27]), .B0(n5820), .B1(
        DMP_SFG[27]), .Y(n695) );
  AO22XLTS U500 ( .A0(n5855), .A1(DMP_SHT1_EWSW[27]), .B0(n5931), .B1(
        DMP_SHT2_EWSW[27]), .Y(n696) );
  AO22XLTS U501 ( .A0(n5818), .A1(DMP_EXP_EWSW[27]), .B0(n5817), .B1(
        DMP_SHT1_EWSW[27]), .Y(n697) );
  AO22XLTS U502 ( .A0(n4934), .A1(DMP_SFG[26]), .B0(n5821), .B1(
        DMP_exp_NRM_EW[3]), .Y(n699) );
  AO22XLTS U503 ( .A0(n5824), .A1(DMP_SHT2_EWSW[26]), .B0(n5820), .B1(
        DMP_SFG[26]), .Y(n700) );
  AO22XLTS U504 ( .A0(n5855), .A1(DMP_SHT1_EWSW[26]), .B0(n5931), .B1(
        DMP_SHT2_EWSW[26]), .Y(n701) );
  AO22XLTS U505 ( .A0(n4816), .A1(n5911), .B0(n5814), .B1(DMP_SHT1_EWSW[26]), 
        .Y(n702) );
  AO22XLTS U506 ( .A0(n4933), .A1(DMP_SFG[25]), .B0(n5821), .B1(
        DMP_exp_NRM_EW[2]), .Y(n704) );
  AO22XLTS U507 ( .A0(n5093), .A1(DMP_SHT2_EWSW[25]), .B0(n5820), .B1(
        DMP_SFG[25]), .Y(n705) );
  AO22XLTS U508 ( .A0(n5855), .A1(DMP_SHT1_EWSW[25]), .B0(n5931), .B1(
        DMP_SHT2_EWSW[25]), .Y(n706) );
  AO22XLTS U509 ( .A0(n4933), .A1(DMP_SFG[24]), .B0(n5819), .B1(
        DMP_exp_NRM_EW[1]), .Y(n709) );
  AO22XLTS U510 ( .A0(n5824), .A1(DMP_SHT2_EWSW[24]), .B0(n5820), .B1(
        DMP_SFG[24]), .Y(n710) );
  AO22XLTS U511 ( .A0(n5855), .A1(DMP_SHT1_EWSW[24]), .B0(n5830), .B1(
        DMP_SHT2_EWSW[24]), .Y(n711) );
  AO22XLTS U512 ( .A0(n5833), .A1(n4887), .B0(n5832), .B1(DMP_SHT1_EWSW[24]), 
        .Y(n712) );
  AO22XLTS U513 ( .A0(n4933), .A1(DMP_SFG[23]), .B0(n5821), .B1(
        DMP_exp_NRM_EW[0]), .Y(n714) );
  AO22XLTS U514 ( .A0(n5824), .A1(DMP_SHT2_EWSW[23]), .B0(n5823), .B1(
        DMP_SFG[23]), .Y(n715) );
  AO22XLTS U515 ( .A0(n5855), .A1(DMP_SHT1_EWSW[23]), .B0(n5825), .B1(
        DMP_SHT2_EWSW[23]), .Y(n716) );
  AOI2BB2XLTS U516 ( .B0(n5836), .B1(n1492), .A0N(DMP_SHT1_EWSW[23]), .A1N(
        n5826), .Y(n717) );
  AO22XLTS U517 ( .A0(n5855), .A1(DMP_SHT1_EWSW[22]), .B0(n5830), .B1(
        DMP_SHT2_EWSW[22]), .Y(n719) );
  AO22XLTS U518 ( .A0(n5833), .A1(DMP_EXP_EWSW[22]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[22]), .Y(n720) );
  AO22XLTS U519 ( .A0(n5855), .A1(DMP_SHT1_EWSW[21]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[21]), .Y(n722) );
  AO22XLTS U520 ( .A0(n5833), .A1(DMP_EXP_EWSW[21]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[21]), .Y(n723) );
  AO22XLTS U521 ( .A0(n5828), .A1(DMP_SHT1_EWSW[20]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[20]), .Y(n725) );
  AO22XLTS U522 ( .A0(n5833), .A1(DMP_EXP_EWSW[20]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[20]), .Y(n726) );
  AO22XLTS U523 ( .A0(n5828), .A1(DMP_SHT1_EWSW[19]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[19]), .Y(n728) );
  AO22XLTS U524 ( .A0(n5833), .A1(DMP_EXP_EWSW[19]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[19]), .Y(n729) );
  AO22XLTS U525 ( .A0(n5828), .A1(DMP_SHT1_EWSW[18]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[18]), .Y(n731) );
  AO22XLTS U526 ( .A0(n5833), .A1(DMP_EXP_EWSW[18]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[18]), .Y(n732) );
  AO22XLTS U527 ( .A0(n5828), .A1(DMP_SHT1_EWSW[17]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[17]), .Y(n734) );
  AO22XLTS U528 ( .A0(n5833), .A1(DMP_EXP_EWSW[17]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[17]), .Y(n735) );
  AO22XLTS U529 ( .A0(n5849), .A1(DMP_SHT2_EWSW[16]), .B0(n5829), .B1(
        DMP_SHT1_EWSW[16]), .Y(n737) );
  AO22XLTS U530 ( .A0(n5833), .A1(DMP_EXP_EWSW[16]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[16]), .Y(n738) );
  AO22XLTS U531 ( .A0(n5828), .A1(DMP_SHT1_EWSW[15]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[15]), .Y(n740) );
  AO22XLTS U532 ( .A0(n5834), .A1(DMP_EXP_EWSW[15]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[15]), .Y(n741) );
  AO22XLTS U533 ( .A0(n5828), .A1(DMP_SHT1_EWSW[14]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[14]), .Y(n743) );
  AO22XLTS U534 ( .A0(n5834), .A1(DMP_EXP_EWSW[14]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[14]), .Y(n744) );
  AO22XLTS U535 ( .A0(n5828), .A1(DMP_SHT1_EWSW[13]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[13]), .Y(n746) );
  AO22XLTS U536 ( .A0(n5834), .A1(DMP_EXP_EWSW[13]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[13]), .Y(n747) );
  AO22XLTS U537 ( .A0(n5830), .A1(DMP_SHT2_EWSW[12]), .B0(n5829), .B1(
        DMP_SHT1_EWSW[12]), .Y(n749) );
  AO22XLTS U538 ( .A0(n5834), .A1(DMP_EXP_EWSW[12]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[12]), .Y(n750) );
  AO22XLTS U539 ( .A0(n5855), .A1(DMP_SHT1_EWSW[11]), .B0(n5831), .B1(
        DMP_SHT2_EWSW[11]), .Y(n752) );
  AO22XLTS U540 ( .A0(n5834), .A1(DMP_EXP_EWSW[11]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[11]), .Y(n753) );
  AO22XLTS U541 ( .A0(DMP_SHT1_EWSW[10]), .A1(n5828), .B0(DMP_SHT2_EWSW[10]), 
        .B1(n5849), .Y(n755) );
  AO22XLTS U542 ( .A0(n5834), .A1(DMP_EXP_EWSW[10]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[10]), .Y(n756) );
  AO22XLTS U543 ( .A0(DMP_SHT1_EWSW[9]), .A1(busy), .B0(DMP_SHT2_EWSW[9]), 
        .B1(n5849), .Y(n758) );
  AO22XLTS U544 ( .A0(n5834), .A1(DMP_EXP_EWSW[9]), .B0(n5832), .B1(
        DMP_SHT1_EWSW[9]), .Y(n759) );
  AO22XLTS U545 ( .A0(DMP_SHT1_EWSW[8]), .A1(busy), .B0(DMP_SHT2_EWSW[8]), 
        .B1(n5849), .Y(n761) );
  AO22XLTS U546 ( .A0(n5833), .A1(DMP_EXP_EWSW[8]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[8]), .Y(n762) );
  AO22XLTS U547 ( .A0(DMP_SHT1_EWSW[7]), .A1(busy), .B0(DMP_SHT2_EWSW[7]), 
        .B1(n5825), .Y(n1527) );
  AO22XLTS U548 ( .A0(n5834), .A1(DMP_EXP_EWSW[7]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[7]), .Y(n765) );
  AO22XLTS U549 ( .A0(DMP_SHT1_EWSW[6]), .A1(busy), .B0(DMP_SHT2_EWSW[6]), 
        .B1(n5849), .Y(n1528) );
  AO22XLTS U550 ( .A0(n5834), .A1(DMP_EXP_EWSW[6]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[6]), .Y(n768) );
  AO22XLTS U551 ( .A0(DMP_SHT1_EWSW[5]), .A1(busy), .B0(DMP_SHT2_EWSW[5]), 
        .B1(n5849), .Y(n1529) );
  AO22XLTS U552 ( .A0(n5834), .A1(DMP_EXP_EWSW[5]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[5]), .Y(n771) );
  AO22XLTS U553 ( .A0(DMP_SHT1_EWSW[4]), .A1(busy), .B0(DMP_SHT2_EWSW[4]), 
        .B1(n5825), .Y(n1530) );
  AO22XLTS U554 ( .A0(n5836), .A1(DMP_EXP_EWSW[4]), .B0(n5835), .B1(
        DMP_SHT1_EWSW[4]), .Y(n774) );
  AO22XLTS U555 ( .A0(DMP_SHT1_EWSW[3]), .A1(busy), .B0(DMP_SHT2_EWSW[3]), 
        .B1(n5825), .Y(n1531) );
  AO22XLTS U556 ( .A0(n5836), .A1(DMP_EXP_EWSW[3]), .B0(n5782), .B1(
        DMP_SHT1_EWSW[3]), .Y(n777) );
  AO22XLTS U557 ( .A0(DMP_SHT1_EWSW[2]), .A1(busy), .B0(DMP_SHT2_EWSW[2]), 
        .B1(n5825), .Y(n1532) );
  AO22XLTS U558 ( .A0(n5836), .A1(DMP_EXP_EWSW[2]), .B0(n5782), .B1(
        DMP_SHT1_EWSW[2]), .Y(n780) );
  AO22XLTS U559 ( .A0(DMP_SHT1_EWSW[1]), .A1(busy), .B0(DMP_SHT2_EWSW[1]), 
        .B1(n5825), .Y(n1533) );
  AO22XLTS U560 ( .A0(n5836), .A1(DMP_EXP_EWSW[1]), .B0(n5782), .B1(
        DMP_SHT1_EWSW[1]), .Y(n783) );
  AO22XLTS U561 ( .A0(DMP_SHT1_EWSW[0]), .A1(busy), .B0(DMP_SHT2_EWSW[0]), 
        .B1(n5825), .Y(n1534) );
  AO22XLTS U562 ( .A0(n5836), .A1(DMP_EXP_EWSW[0]), .B0(n5782), .B1(
        DMP_SHT1_EWSW[0]), .Y(n786) );
  AO22XLTS U563 ( .A0(n5844), .A1(n5839), .B0(n4889), .B1(OP_FLAG_EXP), .Y(
        n788) );
  AOI2BB2XLTS U564 ( .B0(n5838), .B1(intDX_EWSW[31]), .A0N(intDX_EWSW[31]), 
        .A1N(n5838), .Y(n5839) );
  AO22XLTS U565 ( .A0(n5836), .A1(n5070), .B0(n5782), .B1(
        Shift_amount_SHT1_EWR[4]), .Y(n828) );
  AO22XLTS U566 ( .A0(n5827), .A1(n5065), .B0(n5782), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n829) );
  AO22XLTS U567 ( .A0(n5833), .A1(n5061), .B0(n5782), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n830) );
  NOR4X2TS U568 ( .A(exp_rslt_NRM2_EW1[7]), .B(exp_rslt_NRM2_EW1[0]), .C(
        exp_rslt_NRM2_EW1[3]), .D(n4944), .Y(n4946) );
  INVX2TS U569 ( .A(n5604), .Y(n5635) );
  CLKINVX6TS U570 ( .A(n5776), .Y(n4909) );
  OR2X4TS U571 ( .A(n5573), .B(n5570), .Y(n4890) );
  OAI21X2TS U572 ( .A0(n3616), .A1(n5627), .B0(n5593), .Y(n4892) );
  NOR2X2TS U573 ( .A(n5141), .B(n5119), .Y(n4896) );
  INVX2TS U574 ( .A(n5634), .Y(n4899) );
  INVX2TS U575 ( .A(n5634), .Y(n4900) );
  INVX2TS U576 ( .A(n5993), .Y(n4902) );
  NOR2X4TS U577 ( .A(n5433), .B(n5907), .Y(n4947) );
  BUFX8TS U578 ( .A(n4947), .Y(n5774) );
  INVX2TS U579 ( .A(n5635), .Y(n4905) );
  INVX2TS U580 ( .A(n5762), .Y(n4906) );
  INVX2TS U581 ( .A(n5762), .Y(n4907) );
  INVX2TS U582 ( .A(shift_value_SHT2_EWR[4]), .Y(n4908) );
  INVX12TS U583 ( .A(n4909), .Y(n4911) );
  INVX2TS U584 ( .A(n4898), .Y(n4914) );
  INVX2TS U585 ( .A(n4897), .Y(n4916) );
  INVX4TS U586 ( .A(n4888), .Y(n4918) );
  INVX2TS U587 ( .A(n5937), .Y(n4922) );
  INVX6TS U588 ( .A(n4890), .Y(n4924) );
  OAI21X2TS U589 ( .A0(n5238), .A1(n5237), .B0(n5236), .Y(n5261) );
  NOR2X2TS U590 ( .A(n5813), .B(n5849), .Y(n5451) );
  INVX2TS U591 ( .A(n4893), .Y(n4929) );
  NAND3X2TS U592 ( .A(n5591), .B(n5590), .C(n5589), .Y(n5738) );
  OR2X1TS U593 ( .A(n5634), .B(n3677), .Y(n5591) );
  NOR2X2TS U594 ( .A(n5905), .B(n5108), .Y(n5141) );
  OAI211XLTS U595 ( .A0(n5225), .A1(n5211), .B0(n5199), .C0(n5198), .Y(n559)
         );
  OAI211XLTS U596 ( .A0(n4896), .A1(n5225), .B0(n5124), .C0(n5123), .Y(n550)
         );
  OAI211XLTS U597 ( .A0(n6004), .A1(n5225), .B0(n5224), .C0(n5223), .Y(n553)
         );
  OAI211XLTS U598 ( .A0(n5395), .A1(n5225), .B0(n5195), .C0(n5194), .Y(n558)
         );
  OAI211XLTS U599 ( .A0(n5415), .A1(n5225), .B0(n5156), .C0(n5155), .Y(n554)
         );
  OAI211XLTS U600 ( .A0(n5409), .A1(n5225), .B0(n5148), .C0(n5147), .Y(n551)
         );
  OAI211XLTS U601 ( .A0(n5412), .A1(n5225), .B0(n5135), .C0(n5134), .Y(n555)
         );
  OAI211XLTS U602 ( .A0(n5225), .A1(n5458), .B0(n5152), .C0(n5151), .Y(n557)
         );
  INVX2TS U603 ( .A(n4894), .Y(n4930) );
  INVX2TS U604 ( .A(n4895), .Y(n4931) );
  OAI21X2TS U605 ( .A0(n5627), .A1(n5913), .B0(n5574), .Y(n5739) );
  OAI21X2TS U606 ( .A0(n5918), .A1(n5627), .B0(n5605), .Y(n5744) );
  OAI21X2TS U607 ( .A0(n3677), .A1(n5021), .B0(n5611), .Y(n5675) );
  OAI21X2TS U608 ( .A0(n5913), .A1(n5021), .B0(n5624), .Y(n5678) );
  OAI211X4TS U609 ( .A0(n5412), .A1(n4908), .B0(n5154), .C0(n5153), .Y(n5413)
         );
  OAI211X4TS U610 ( .A0(n6004), .A1(n4908), .B0(n5074), .C0(n5073), .Y(n5453)
         );
  OAI21X2TS U611 ( .A0(n4768), .A1(n5627), .B0(n5592), .Y(n5659) );
  OAI21X2TS U612 ( .A0(n4768), .A1(n5021), .B0(n5633), .Y(n5754) );
  NOR2X2TS U613 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n5901), .Y(n5847)
         );
  OAI21X2TS U614 ( .A0(n5120), .A1(n2580), .B0(n5143), .Y(n5211) );
  NAND2X2TS U615 ( .A(n1493), .B(n5120), .Y(n5143) );
  CLKINVX3TS U616 ( .A(rst), .Y(n5996) );
  NOR2BX2TS U617 ( .AN(n4769), .B(n2565), .Y(n5369) );
  AOI22X2TS U618 ( .A0(n1432), .A1(intDY_EWSW[28]), .B0(n1491), .B1(n3648), 
        .Y(n5515) );
  OR2X1TS U619 ( .A(n5369), .B(n5416), .Y(n4981) );
  NOR2X2TS U620 ( .A(n5886), .B(n2533), .Y(n5416) );
  OAI211XLTS U621 ( .A0(n5406), .A1(n5225), .B0(n5116), .C0(n5115), .Y(n552)
         );
  CLKINVX3TS U622 ( .A(n4901), .Y(n5441) );
  OR2X1TS U623 ( .A(n2557), .B(n4760), .Y(n5236) );
  NOR2BX2TS U624 ( .AN(n4760), .B(n2557), .Y(n5256) );
  OAI21XLTS U625 ( .A0(n1442), .A1(n5914), .B0(n5062), .Y(n5060) );
  NAND2BX2TS U626 ( .AN(n2584), .B(DMP_SFG[9]), .Y(n5258) );
  NAND2X4TS U627 ( .A(n5765), .B(n5995), .Y(n5220) );
  NAND2X1TS U628 ( .A(n2548), .B(n1502), .Y(n5310) );
  OR2X1TS U629 ( .A(n2548), .B(n1502), .Y(n5311) );
  OR2X1TS U630 ( .A(n1520), .B(n2570), .Y(n4976) );
  XNOR2X2TS U631 ( .A(intAS), .B(intDY_EWSW[31]), .Y(n5837) );
  AOI22X1TS U632 ( .A0(intDY_EWSW[10]), .A1(n1437), .B0(intDY_EWSW[11]), .B1(
        n5868), .Y(n5493) );
  OAI22X1TS U633 ( .A0(n5504), .A1(n5527), .B0(intDY_EWSW[19]), .B1(n4780), 
        .Y(n5506) );
  AOI21X2TS U634 ( .A0(Raw_mant_NRM_SWR[24]), .A1(n4900), .B0(n5577), .Y(n5657) );
  OAI21X2TS U635 ( .A0(n5811), .A1(n3671), .B0(n5598), .Y(n5621) );
  OAI21X2TS U636 ( .A0(n2535), .A1(n5627), .B0(n5585), .Y(n5740) );
  INVX2TS U637 ( .A(n5202), .Y(n4932) );
  AOI21X2TS U638 ( .A0(Data_array_SWR[21]), .A1(n4932), .B0(n5095), .Y(n5444)
         );
  INVX2TS U639 ( .A(n5214), .Y(n5202) );
  CLKBUFX2TS U640 ( .A(n5072), .Y(n5214) );
  AOI21X2TS U641 ( .A0(DmP_mant_SHT1_SW[4]), .A1(n5632), .B0(n5588), .Y(n5663)
         );
  AOI21X2TS U642 ( .A0(DmP_mant_SHT1_SW[17]), .A1(n5812), .B0(n5608), .Y(n5681) );
  OAI21X2TS U643 ( .A0(n3616), .A1(n5021), .B0(n5609), .Y(n5750) );
  BUFX3TS U644 ( .A(n4814), .Y(n4933) );
  BUFX3TS U645 ( .A(n4814), .Y(n4934) );
  CLKBUFX2TS U646 ( .A(n4814), .Y(n5822) );
  NOR3X4TS U647 ( .A(shift_value_SHT2_EWR[4]), .B(n3609), .C(n5905), .Y(n4935)
         );
  INVX2TS U648 ( .A(n5255), .Y(n4968) );
  AOI21X1TS U649 ( .A0(n5888), .A1(n2559), .B0(n4995), .Y(n4941) );
  OA22X1TS U650 ( .A0(n5495), .A1(n5494), .B0(n5868), .B1(intDY_EWSW[11]), .Y(
        n5496) );
  OA22X1TS U651 ( .A0(n5857), .A1(intDY_EWSW[17]), .B0(n1438), .B1(
        intDY_EWSW[16]), .Y(n5501) );
  OAI21X2TS U652 ( .A0(n5502), .A1(n5531), .B0(n5501), .Y(n5503) );
  OR2X1TS U653 ( .A(n4759), .B(n4806), .Y(n5343) );
  OR2X1TS U654 ( .A(n2548), .B(n5876), .Y(n5314) );
  NAND2X4TS U655 ( .A(n5379), .B(n5872), .Y(n5052) );
  NAND2X1TS U656 ( .A(n1514), .B(n5878), .Y(n5352) );
  OR2X1TS U657 ( .A(n2558), .B(n1510), .Y(n5246) );
  NAND2X1TS U658 ( .A(n1482), .B(intDY_EWSW[1]), .Y(n5525) );
  OAI21XLTS U659 ( .A0(n5333), .A1(n5692), .B0(n5332), .Y(n5334) );
  NAND2X4TS U660 ( .A(n4947), .B(n4908), .Y(n6003) );
  AND4X2TS U661 ( .A(exp_rslt_NRM2_EW1[2]), .B(exp_rslt_NRM2_EW1[7]), .C(
        exp_rslt_NRM2_EW1[0]), .D(exp_rslt_NRM2_EW1[3]), .Y(n4942) );
  AND4X4TS U662 ( .A(exp_rslt_NRM2_EW1[5]), .B(exp_rslt_NRM2_EW1[1]), .C(n4942), .D(n4944), .Y(n4943) );
  INVX2TS U663 ( .A(n4901), .Y(n5852) );
  AOI31X4TS U664 ( .A0(exp_rslt_NRM2_EW1[6]), .A1(exp_rslt_NRM2_EW1[4]), .A2(
        n4943), .B0(n5852), .Y(n5785) );
  AND2X4TS U665 ( .A(n4946), .B(n4945), .Y(n5212) );
  NOR2BX4TS U666 ( .AN(n5212), .B(exp_rslt_NRM2_EW1[1]), .Y(n5271) );
  NAND2X6TS U667 ( .A(n5785), .B(n5786), .Y(n5433) );
  AND2X2TS U668 ( .A(n1469), .B(n2597), .Y(n5795) );
  NAND2X1TS U669 ( .A(n2545), .B(n3627), .Y(n5796) );
  NAND2X2TS U670 ( .A(n5795), .B(n5796), .Y(n5181) );
  NAND3X1TS U671 ( .A(n5181), .B(n5797), .C(n5352), .Y(n4948) );
  NAND2X1TS U672 ( .A(n4765), .B(n4837), .Y(n5358) );
  NAND3X2TS U673 ( .A(n4948), .B(n5358), .C(n5353), .Y(n5297) );
  NAND3X2TS U674 ( .A(n5297), .B(n5359), .C(n5343), .Y(n4949) );
  NAND2X1TS U675 ( .A(n5876), .B(n2548), .Y(n5301) );
  NAND2X1TS U676 ( .A(n4759), .B(n4806), .Y(n5342) );
  NAND3X2TS U677 ( .A(n4949), .B(n5301), .C(n5342), .Y(n5315) );
  NAND2BX1TS U678 ( .AN(n3637), .B(n5889), .Y(n5323) );
  NAND2X1TS U679 ( .A(n3637), .B(n2551), .Y(n5324) );
  OAI2BB1X1TS U680 ( .A0N(n4836), .A1N(n4775), .B0(n5324), .Y(n4950) );
  NAND2X2TS U681 ( .A(n2556), .B(n3638), .Y(n5286) );
  NOR2X1TS U682 ( .A(n4836), .B(n4775), .Y(n5013) );
  NAND2X1TS U683 ( .A(n5013), .B(n5286), .Y(n4951) );
  NAND4X1TS U684 ( .A(n4951), .B(n5258), .C(n5287), .D(n5236), .Y(n4952) );
  NAND2BX1TS U685 ( .AN(DMP_SFG[9]), .B(n2584), .Y(n5259) );
  OAI21X1TS U686 ( .A0(n4936), .A1(n1510), .B0(n5259), .Y(n4953) );
  AOI211X2TS U687 ( .A0(n5237), .A1(n5258), .B0(n4954), .C0(n4953), .Y(n4994)
         );
  NOR2BX1TS U688 ( .AN(n1509), .B(n2560), .Y(n4997) );
  NOR2BX1TS U689 ( .AN(n1510), .B(n2558), .Y(n4993) );
  NOR2BX1TS U690 ( .AN(n2560), .B(n1509), .Y(n4995) );
  AOI21X4TS U691 ( .A0(n4771), .A1(n5899), .B0(n4957), .Y(n5278) );
  NAND2X1TS U692 ( .A(n4770), .B(n5890), .Y(n5273) );
  NOR2BX1TS U693 ( .AN(n2561), .B(n4770), .Y(n5275) );
  AOI21X4TS U694 ( .A0(n5278), .A1(n5273), .B0(n5275), .Y(n5230) );
  NAND2X1TS U695 ( .A(n5896), .B(n2570), .Y(n5228) );
  NOR2BX1TS U696 ( .AN(n1520), .B(n2570), .Y(n5229) );
  AOI21X4TS U697 ( .A0(n5230), .A1(n5228), .B0(n5229), .Y(n5004) );
  OAI21X4TS U698 ( .A0(n2565), .A1(n4769), .B0(n5004), .Y(n4958) );
  AOI21X4TS U699 ( .A0(n4781), .A1(n2533), .B0(n5373), .Y(n4959) );
  NAND2BX1TS U700 ( .AN(n2573), .B(n1506), .Y(n5421) );
  NOR2X1TS U701 ( .A(n1506), .B(n5909), .Y(n5420) );
  AOI21X4TS U702 ( .A0(n5424), .A1(n5421), .B0(n5420), .Y(n5459) );
  NAND2X1TS U703 ( .A(n2575), .B(n3657), .Y(n4960) );
  AOI2BB2X4TS U704 ( .B0(n5459), .B1(n4960), .A0N(n3657), .A1N(n2575), .Y(
        n5471) );
  NAND2BX1TS U705 ( .AN(n2599), .B(n1505), .Y(n5466) );
  NOR2BX1TS U706 ( .AN(n2599), .B(n1505), .Y(n5467) );
  AOI21X4TS U707 ( .A0(n5471), .A1(n5466), .B0(n5467), .Y(n5478) );
  NAND2X1TS U708 ( .A(n5946), .B(n2582), .Y(n5476) );
  NOR2BX1TS U709 ( .AN(n1517), .B(n2582), .Y(n5477) );
  AOI21X4TS U710 ( .A0(n5478), .A1(n5476), .B0(n5477), .Y(n5555) );
  NOR2X1TS U711 ( .A(n5924), .B(DMP_SFG[21]), .Y(n5552) );
  NOR2X1TS U712 ( .A(n1516), .B(n5917), .Y(n5682) );
  XNOR2X1TS U713 ( .A(n4961), .B(DmP_mant_SFG_SWR_25_), .Y(n4990) );
  BUFX3TS U714 ( .A(n5292), .Y(n5550) );
  BUFX3TS U715 ( .A(n5550), .Y(n5465) );
  NAND2BX2TS U716 ( .AN(n2545), .B(n3627), .Y(n5182) );
  OAI21X2TS U717 ( .A0(n1514), .A1(n3619), .B0(n5182), .Y(n5338) );
  NAND2X1TS U718 ( .A(n1514), .B(n3619), .Y(n5337) );
  NAND2X1TS U719 ( .A(n4765), .B(n5879), .Y(n5339) );
  NAND3X2TS U720 ( .A(n5338), .B(n5337), .C(n5339), .Y(n4963) );
  NAND3X2TS U721 ( .A(n4963), .B(n4962), .C(n5340), .Y(n5300) );
  NAND2X1TS U722 ( .A(n4759), .B(n5880), .Y(n5299) );
  NAND3X1TS U723 ( .A(n5300), .B(n5299), .C(n5310), .Y(n4965) );
  NAND2X1TS U724 ( .A(n4775), .B(n5875), .Y(n5327) );
  OAI21X1TS U725 ( .A0(n2556), .A1(n4938), .B0(n5328), .Y(n4966) );
  AOI21X4TS U726 ( .A0(n5284), .A1(n4967), .B0(n4966), .Y(n5016) );
  NOR2BX1TS U727 ( .AN(n2556), .B(n3638), .Y(n5015) );
  AOI21X1TS U728 ( .A0(n2584), .A1(DMP_SFG[9]), .B0(n5256), .Y(n4969) );
  INVX2TS U729 ( .A(n5246), .Y(n4973) );
  AOI21X1TS U730 ( .A0(n2560), .A1(n1509), .B0(n5247), .Y(n4972) );
  NOR2BX1TS U731 ( .AN(n5891), .B(DMP_SFG[9]), .Y(n5240) );
  NAND2X1TS U732 ( .A(n5246), .B(n5240), .Y(n4971) );
  NOR2X1TS U733 ( .A(n2559), .B(n4771), .Y(n4991) );
  NAND2X1TS U734 ( .A(n4771), .B(n2559), .Y(n4992) );
  OAI21X4TS U735 ( .A0(n4998), .A1(n4991), .B0(n4992), .Y(n5276) );
  AO21X4TS U736 ( .A0(n4770), .A1(n2561), .B0(n5276), .Y(n4975) );
  OAI21X4TS U737 ( .A0(n2561), .A1(n4770), .B0(n4975), .Y(n5231) );
  OAI2BB1X4TS U738 ( .A0N(n2570), .A1N(n1520), .B0(n5231), .Y(n4977) );
  NAND2X1TS U739 ( .A(n5887), .B(n2565), .Y(n5370) );
  AOI21X1TS U740 ( .A0(n5370), .A1(n4781), .B0(n5897), .Y(n4979) );
  NOR3X1TS U741 ( .A(n5885), .B(n4781), .C(n4769), .Y(n4978) );
  AOI211X1TS U742 ( .A0(n2573), .A1(n1506), .B0(n4979), .C0(n4978), .Y(n4980)
         );
  OAI21X2TS U743 ( .A0(n2573), .A1(n1506), .B0(n4982), .Y(n5461) );
  NAND2X1TS U744 ( .A(n1505), .B(n2599), .Y(n4984) );
  AOI2BB2X4TS U745 ( .B0(n5469), .B1(n4984), .A0N(n2599), .A1N(n1505), .Y(
        n5481) );
  OAI2BB1X4TS U746 ( .A0N(n5946), .A1N(n5947), .B0(n5481), .Y(n4985) );
  OAI2BB1X4TS U747 ( .A0N(n1517), .A1N(n2582), .B0(n4985), .Y(n5553) );
  AOI2BB1X2TS U748 ( .A0N(DMP_SFG[21]), .A1N(n2578), .B0(n5553), .Y(n4986) );
  AOI21X4TS U749 ( .A0(DMP_SFG[21]), .A1(n2578), .B0(n4986), .Y(n5688) );
  XOR2X1TS U750 ( .A(n5769), .B(DmP_mant_SFG_SWR_25_), .Y(n4988) );
  BUFX3TS U751 ( .A(n5819), .Y(n5821) );
  BUFX3TS U752 ( .A(n5821), .Y(n5760) );
  OR2X2TS U753 ( .A(n5760), .B(OP_FLAG_SFG), .Y(n5357) );
  CLKBUFX2TS U754 ( .A(n5357), .Y(n5770) );
  AOI22X1TS U755 ( .A0(n4988), .A1(n5689), .B0(Raw_mant_NRM_SWR[25]), .B1(
        n5819), .Y(n4989) );
  OAI21X2TS U756 ( .A0(n4990), .A1(n5470), .B0(n4989), .Y(n588) );
  NOR2BX1TS U757 ( .AN(n4992), .B(n4991), .Y(n5003) );
  INVX2TS U758 ( .A(n4995), .Y(n4996) );
  OAI21X1TS U759 ( .A0(n5250), .A1(n4997), .B0(n4996), .Y(n4999) );
  OAI22X1TS U760 ( .A0(n4999), .A1(n5470), .B0(n4998), .B1(n5357), .Y(n5002)
         );
  INVX2TS U761 ( .A(n5770), .Y(n5554) );
  AOI22X1TS U762 ( .A0(n4999), .A1(n5550), .B0(n4998), .B1(n5689), .Y(n5000)
         );
  INVX2TS U763 ( .A(n4782), .Y(n5629) );
  OAI22X1TS U764 ( .A0(n5000), .A1(n5003), .B0(n4934), .B1(n5629), .Y(n5001)
         );
  NAND2X2TS U765 ( .A(LZD_output_NRM2_EW[0]), .B(n3725), .Y(
        DP_OP_15J43_122_6956_n18) );
  INVX2TS U766 ( .A(n5005), .Y(n5009) );
  OAI22X1TS U767 ( .A0(n5004), .A1(n5470), .B0(n5770), .B1(n5371), .Y(n5008)
         );
  INVX2TS U768 ( .A(n5770), .Y(n5277) );
  AOI22X1TS U769 ( .A0(n5006), .A1(n5005), .B0(Raw_mant_NRM_SWR[17]), .B1(
        n5819), .Y(n5007) );
  OAI2BB1X1TS U770 ( .A0N(n5009), .A1N(n5008), .B0(n5007), .Y(n596) );
  BUFX3TS U771 ( .A(n5808), .Y(n5813) );
  CLKBUFX2TS U772 ( .A(n5931), .Y(n5830) );
  INVX2TS U773 ( .A(n5830), .Y(n5828) );
  OR2X2TS U774 ( .A(n5813), .B(n5828), .Y(n5571) );
  AND2X2TS U775 ( .A(n1480), .B(n5811), .Y(n5631) );
  INVX2TS U776 ( .A(n5631), .Y(n5021) );
  INVX2TS U777 ( .A(n5021), .Y(n5604) );
  OAI21XLTS U778 ( .A0(n4794), .A1(n5571), .B0(n5635), .Y(n863) );
  NOR2X2TS U779 ( .A(n3609), .B(n1493), .Y(n5130) );
  NOR2X4TS U780 ( .A(shift_value_SHT2_EWR[2]), .B(n5862), .Y(n5142) );
  NAND2X2TS U781 ( .A(shift_value_SHT2_EWR[2]), .B(n3609), .Y(n5137) );
  AOI21X1TS U782 ( .A0(n5142), .A1(Data_array_SWR[19]), .B0(n5010), .Y(n5011)
         );
  INVX2TS U783 ( .A(n5012), .Y(n6004) );
  NOR2X1TS U784 ( .A(n5256), .B(n5255), .Y(n5020) );
  OAI2BB1X1TS U785 ( .A0N(n5287), .A1N(n5291), .B0(n5286), .Y(n5238) );
  NOR2X2TS U786 ( .A(n5016), .B(n5015), .Y(n5257) );
  OAI22X1TS U787 ( .A0(n5238), .A1(n5470), .B0(n5257), .B1(n5357), .Y(n5019)
         );
  AOI22X1TS U788 ( .A0(n5238), .A1(n5465), .B0(n5554), .B1(n5257), .Y(n5017)
         );
  OAI22X1TS U789 ( .A0(n5017), .A1(n5020), .B0(n5822), .B1(n5863), .Y(n5018)
         );
  NOR2BX4TS U790 ( .AN(n5870), .B(Raw_mant_NRM_SWR[23]), .Y(n5028) );
  INVX2TS U791 ( .A(n5028), .Y(n5023) );
  NOR2X2TS U792 ( .A(Raw_mant_NRM_SWR[24]), .B(Raw_mant_NRM_SWR[25]), .Y(n5037) );
  INVX2TS U793 ( .A(n5037), .Y(n5022) );
  NOR2X4TS U794 ( .A(n5023), .B(n5022), .Y(n5384) );
  NOR3X2TS U795 ( .A(Raw_mant_NRM_SWR[19]), .B(Raw_mant_NRM_SWR[21]), .C(n4747), .Y(n5387) );
  NAND2X4TS U796 ( .A(n5384), .B(n5387), .Y(n5035) );
  NOR2X2TS U797 ( .A(n5856), .B(Raw_mant_NRM_SWR[17]), .Y(n5030) );
  NOR2X1TS U798 ( .A(Raw_mant_NRM_SWR[15]), .B(n4782), .Y(n5024) );
  INVX2TS U799 ( .A(n5382), .Y(n5025) );
  NOR3BX4TS U800 ( .AN(n5032), .B(Raw_mant_NRM_SWR[11]), .C(n4809), .Y(n5445)
         );
  NAND3X4TS U801 ( .A(n5445), .B(n3615), .C(n4768), .Y(n5026) );
  NOR2BX4TS U802 ( .AN(n3616), .B(n5026), .Y(n5054) );
  NOR2BX4TS U803 ( .AN(n5054), .B(Raw_mant_NRM_SWR[6]), .Y(n5391) );
  AOI21X1TS U804 ( .A0(n5030), .A1(Raw_mant_NRM_SWR[15]), .B0(
        Raw_mant_NRM_SWR[19]), .Y(n5029) );
  OAI31X1TS U805 ( .A0(n5029), .A1(Raw_mant_NRM_SWR[21]), .A2(n4747), .B0(
        n5028), .Y(n5038) );
  NOR2X1TS U806 ( .A(n5035), .B(n4788), .Y(n5048) );
  NAND2X1TS U807 ( .A(n5898), .B(n5863), .Y(n5031) );
  NAND2X1TS U808 ( .A(n5032), .B(n5031), .Y(n5033) );
  OAI31X1TS U809 ( .A0(n5035), .A1(n5034), .A2(n5629), .B0(n5033), .Y(n5036)
         );
  AOI211X1TS U810 ( .A0(n5038), .A1(n5037), .B0(n5048), .C0(n5036), .Y(n5039)
         );
  AOI21X1TS U811 ( .A0(n5900), .A1(n4747), .B0(Raw_mant_NRM_SWR[22]), .Y(n5040) );
  AOI21X1TS U812 ( .A0(n1452), .A1(n5895), .B0(Raw_mant_NRM_SWR[2]), .Y(n5045)
         );
  OAI32X1TS U813 ( .A0(n5046), .A1(Raw_mant_NRM_SWR[3]), .A2(n5045), .B0(n2535), .B1(n5046), .Y(n5050) );
  AOI21X1TS U814 ( .A0(n4809), .A1(n5898), .B0(Raw_mant_NRM_SWR[12]), .Y(n5047) );
  NOR2X1TS U815 ( .A(n5052), .B(n5047), .Y(n5377) );
  NOR2X1TS U816 ( .A(n5377), .B(n5048), .Y(n5049) );
  NAND2BX2TS U817 ( .AN(n5050), .B(n5049), .Y(n5051) );
  NOR3X1TS U818 ( .A(Raw_mant_NRM_SWR[11]), .B(n4768), .C(n5052), .Y(n5053) );
  AOI22X1TS U819 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n5054), .B0(n3615), .B1(n5053), .Y(n5055) );
  AOI31X1TS U820 ( .A0(n5056), .A1(n5388), .A2(n5055), .B0(n5812), .Y(n5784)
         );
  NOR2X1TS U821 ( .A(n1480), .B(n5853), .Y(n5058) );
  INVX2TS U822 ( .A(n5058), .Y(n5634) );
  AOI211X4TS U823 ( .A0(Shift_amount_SHT1_EWR[0]), .A1(n5853), .B0(n5784), 
        .C0(n4899), .Y(n5572) );
  NAND2X2TS U824 ( .A(n5572), .B(n5571), .Y(n5570) );
  NAND2X1TS U825 ( .A(n5021), .B(Raw_mant_NRM_SWR[25]), .Y(n5057) );
  AOI22X1TS U826 ( .A0(n5676), .A1(n2580), .B0(n4924), .B1(n5655), .Y(n5059)
         );
  NAND2X1TS U827 ( .A(n5059), .B(n5627), .Y(n862) );
  BUFX3TS U828 ( .A(n5931), .Y(n5825) );
  OAI21XLTS U829 ( .A0(n5813), .A1(n3725), .B0(n5634), .Y(n620) );
  CLKBUFX3TS U830 ( .A(n5996), .Y(n5990) );
  BUFX3TS U831 ( .A(n5990), .Y(n5970) );
  BUFX3TS U832 ( .A(n5990), .Y(n5971) );
  CLKBUFX3TS U833 ( .A(n5996), .Y(n5991) );
  BUFX3TS U834 ( .A(n5991), .Y(n5958) );
  BUFX3TS U835 ( .A(n5990), .Y(n5955) );
  CLKBUFX3TS U836 ( .A(n5996), .Y(n5988) );
  BUFX3TS U837 ( .A(n5988), .Y(n5954) );
  BUFX3TS U838 ( .A(n5988), .Y(n5949) );
  CLKBUFX3TS U839 ( .A(n5996), .Y(n5989) );
  BUFX3TS U840 ( .A(n5989), .Y(n5956) );
  BUFX3TS U841 ( .A(n5989), .Y(n5966) );
  BUFX3TS U842 ( .A(n5989), .Y(n5968) );
  CLKBUFX3TS U843 ( .A(n5996), .Y(n5992) );
  BUFX3TS U844 ( .A(n5992), .Y(n5957) );
  BUFX3TS U845 ( .A(n5988), .Y(n5950) );
  BUFX3TS U846 ( .A(n5988), .Y(n5952) );
  BUFX3TS U847 ( .A(n5989), .Y(n5969) );
  BUFX3TS U848 ( .A(n5988), .Y(n5951) );
  BUFX3TS U849 ( .A(n5989), .Y(n5967) );
  BUFX3TS U850 ( .A(n5988), .Y(n5953) );
  BUFX3TS U851 ( .A(n5989), .Y(n5964) );
  BUFX3TS U852 ( .A(n5991), .Y(n5979) );
  BUFX3TS U853 ( .A(n5991), .Y(n5978) );
  BUFX3TS U854 ( .A(n5991), .Y(n5977) );
  BUFX3TS U855 ( .A(n5990), .Y(n5975) );
  BUFX3TS U856 ( .A(n5990), .Y(n5974) );
  BUFX3TS U857 ( .A(n5990), .Y(n5973) );
  BUFX3TS U858 ( .A(n5991), .Y(n5976) );
  BUFX3TS U859 ( .A(n5991), .Y(n5981) );
  BUFX3TS U860 ( .A(n5991), .Y(n5980) );
  CLKBUFX3TS U861 ( .A(n5992), .Y(n5987) );
  BUFX3TS U862 ( .A(n5988), .Y(n5959) );
  BUFX3TS U863 ( .A(n5988), .Y(n5948) );
  BUFX3TS U864 ( .A(n5992), .Y(n5982) );
  BUFX3TS U865 ( .A(n5989), .Y(n5965) );
  BUFX3TS U866 ( .A(n5990), .Y(n5972) );
  BUFX3TS U867 ( .A(n5992), .Y(n5983) );
  BUFX3TS U868 ( .A(n5992), .Y(n5985) );
  BUFX3TS U869 ( .A(n5992), .Y(n5986) );
  BUFX3TS U870 ( .A(n5992), .Y(n5984) );
  BUFX3TS U871 ( .A(n4816), .Y(n5836) );
  CLKBUFX2TS U872 ( .A(n4816), .Y(n5827) );
  INVX2TS U873 ( .A(n5827), .Y(n5782) );
  BUFX3TS U874 ( .A(n5836), .Y(n5826) );
  BUFX3TS U875 ( .A(n5826), .Y(n5833) );
  NAND2X1TS U876 ( .A(n1492), .B(DmP_EXP_EWSW[23]), .Y(n5806) );
  NAND2X1TS U877 ( .A(n5914), .B(n1442), .Y(n5062) );
  XNOR2X1TS U878 ( .A(n5063), .B(n5060), .Y(n5061) );
  AOI2BB2X1TS U879 ( .B0(n5063), .B1(n5062), .A0N(n5914), .A1N(n1442), .Y(
        n5066) );
  NOR2X1TS U880 ( .A(n1445), .B(n5911), .Y(n5067) );
  AOI21X1TS U881 ( .A0(n1445), .A1(n5911), .B0(n5067), .Y(n5064) );
  XNOR2X1TS U882 ( .A(n5066), .B(n5064), .Y(n5065) );
  OAI2BB2XLTS U883 ( .B0(n5067), .B1(n5066), .A0N(n5911), .A1N(n1445), .Y(
        n5069) );
  XNOR2X1TS U884 ( .A(DmP_EXP_EWSW[27]), .B(DMP_EXP_EWSW[27]), .Y(n5068) );
  XOR2X1TS U885 ( .A(n5069), .B(n5068), .Y(n5070) );
  NOR2X1TS U886 ( .A(inst_FSM_INPUT_ENABLE_state_reg[0]), .B(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .Y(n5759) );
  NOR2X1TS U887 ( .A(inst_FSM_INPUT_ENABLE_state_reg[1]), .B(n5847), .Y(n5845)
         );
  AOI22X1TS U888 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n5759), .B0(
        beg_OP), .B1(n5845), .Y(n5071) );
  NAND2X1TS U889 ( .A(n5071), .B(n5846), .Y(n938) );
  NOR2X4TS U890 ( .A(n1493), .B(n4908), .Y(n5432) );
  NAND2X4TS U891 ( .A(n5432), .B(n5774), .Y(n6002) );
  INVX2TS U892 ( .A(n5142), .Y(n5120) );
  OAI21X2TS U893 ( .A0(n2595), .A1(n5120), .B0(n5143), .Y(n5455) );
  AOI22X1TS U894 ( .A0(Data_array_SWR[3]), .A1(n4914), .B0(Data_array_SWR[15]), 
        .B1(n5215), .Y(n5074) );
  AOI22X1TS U895 ( .A0(Data_array_SWR[7]), .A1(n4916), .B0(Data_array_SWR[11]), 
        .B1(n5214), .Y(n5073) );
  AOI22X1TS U896 ( .A0(n4922), .A1(final_result_ieee[20]), .B0(n4911), .B1(
        n5453), .Y(n5075) );
  BUFX3TS U897 ( .A(n5996), .Y(n5962) );
  BUFX3TS U898 ( .A(n5996), .Y(n5960) );
  BUFX3TS U899 ( .A(n5996), .Y(n5961) );
  BUFX3TS U900 ( .A(n5996), .Y(n5963) );
  BUFX3TS U901 ( .A(n5560), .Y(n5848) );
  OAI32X1TS U902 ( .A0(intDY_EWSW[30]), .A1(n5848), .A2(n4815), .B0(
        DMP_EXP_EWSW[30]), .B1(n5844), .Y(n5076) );
  INVX2TS U903 ( .A(n5076), .Y(n1152) );
  OR2X2TS U904 ( .A(n4787), .B(n4901), .Y(n5222) );
  BUFX3TS U905 ( .A(n5222), .Y(n5767) );
  NAND2X1TS U906 ( .A(n5098), .B(DMP_SHT2_EWSW[19]), .Y(n5077) );
  BUFX3TS U907 ( .A(n5222), .Y(n5823) );
  INVX2TS U908 ( .A(n5823), .Y(n5761) );
  NAND2X1TS U909 ( .A(n5098), .B(DMP_SHT2_EWSW[4]), .Y(n5078) );
  NAND2X1TS U910 ( .A(n5160), .B(DMP_SHT2_EWSW[12]), .Y(n5079) );
  NAND2X1TS U911 ( .A(n5098), .B(DMP_SHT2_EWSW[8]), .Y(n5080) );
  NAND2X1TS U912 ( .A(n5160), .B(DMP_SHT2_EWSW[3]), .Y(n5081) );
  NAND2X1TS U913 ( .A(n5098), .B(DMP_SHT2_EWSW[14]), .Y(n5082) );
  NAND2X1TS U914 ( .A(n5098), .B(DMP_SHT2_EWSW[11]), .Y(n5083) );
  NAND2X1TS U915 ( .A(n5098), .B(DMP_SHT2_EWSW[2]), .Y(n5084) );
  NAND2X1TS U916 ( .A(n5160), .B(DMP_SHT2_EWSW[5]), .Y(n5085) );
  NAND2X1TS U917 ( .A(n5098), .B(DMP_SHT2_EWSW[0]), .Y(n5086) );
  NAND2X1TS U918 ( .A(n5160), .B(DMP_SHT2_EWSW[1]), .Y(n5087) );
  NAND2X1TS U919 ( .A(n5160), .B(DMP_SHT2_EWSW[13]), .Y(n5088) );
  NAND2X1TS U920 ( .A(n5160), .B(DMP_SHT2_EWSW[20]), .Y(n5089) );
  NAND2X1TS U921 ( .A(n5160), .B(DMP_SHT2_EWSW[18]), .Y(n5090) );
  NAND2X1TS U922 ( .A(n5160), .B(DMP_SHT2_EWSW[6]), .Y(n5091) );
  NAND2X1TS U923 ( .A(n5160), .B(DMP_SHT2_EWSW[7]), .Y(n5092) );
  INVX2TS U924 ( .A(n5215), .Y(n5204) );
  AOI22X1TS U925 ( .A0(Data_array_SWR[17]), .A1(n4916), .B0(Data_array_SWR[13]), .B1(n4914), .Y(n5094) );
  OAI21X1TS U926 ( .A0(n5864), .A1(n5204), .B0(n5094), .Y(n5095) );
  NOR2X1TS U927 ( .A(n5767), .B(n5907), .Y(n5113) );
  INVX2TS U928 ( .A(n5113), .Y(n5158) );
  AOI22X1TS U929 ( .A0(Data_array_SWR[12]), .A1(n4914), .B0(Data_array_SWR[24]), .B1(n4935), .Y(n5097) );
  AOI22X1TS U930 ( .A0(Data_array_SWR[20]), .A1(n4932), .B0(Data_array_SWR[16]), .B1(n4916), .Y(n5096) );
  NAND2X1TS U931 ( .A(n5097), .B(n5096), .Y(n5440) );
  NAND2X2TS U932 ( .A(n5098), .B(n5907), .Y(n5762) );
  NAND2X1TS U933 ( .A(n5098), .B(n5432), .Y(n5163) );
  AOI21X1TS U934 ( .A0(n5440), .A1(n4906), .B0(n5099), .Y(n5100) );
  AOI22X1TS U935 ( .A0(Data_array_SWR[10]), .A1(n4914), .B0(Data_array_SWR[18]), .B1(n4932), .Y(n5101) );
  AOI21X1TS U936 ( .A0(n4917), .A1(Data_array_SWR[14]), .B0(n5432), .Y(n5102)
         );
  INVX2TS U937 ( .A(n5104), .Y(n5439) );
  INVX2TS U938 ( .A(n5130), .Y(n5108) );
  NOR2X1TS U939 ( .A(n5432), .B(n5141), .Y(n5201) );
  AOI22X1TS U940 ( .A0(Data_array_SWR[15]), .A1(n4915), .B0(Data_array_SWR[19]), .B1(n4917), .Y(n5105) );
  AOI22X1TS U941 ( .A0(n5437), .A1(n4907), .B0(n4760), .B1(n5767), .Y(n5106)
         );
  INVX2TS U942 ( .A(n5158), .Y(n5765) );
  AOI22X1TS U943 ( .A0(n5437), .A1(n5765), .B0(n5930), .B1(n5823), .Y(n5107)
         );
  OAI21X1TS U944 ( .A0(n5912), .A1(n5137), .B0(n5108), .Y(n5109) );
  AOI2BB1X2TS U945 ( .A0N(n5120), .A1N(n5920), .B0(n5109), .Y(n5406) );
  OR2X2TS U946 ( .A(n5762), .B(shift_value_SHT2_EWR[4]), .Y(n5225) );
  NAND2X1TS U947 ( .A(n5142), .B(n5915), .Y(n5110) );
  NAND2X2TS U948 ( .A(n5110), .B(n5143), .Y(n5458) );
  AOI22X1TS U949 ( .A0(Data_array_SWR[7]), .A1(n4915), .B0(Data_array_SWR[19]), 
        .B1(n4935), .Y(n5112) );
  AOI22X1TS U950 ( .A0(Data_array_SWR[11]), .A1(n4917), .B0(Data_array_SWR[15]), .B1(n4932), .Y(n5111) );
  NAND2X1TS U951 ( .A(n5404), .B(n5113), .Y(n5116) );
  INVX2TS U952 ( .A(n5432), .Y(n5157) );
  AOI21X1TS U953 ( .A0(n3637), .A1(n5767), .B0(n5114), .Y(n5115) );
  NAND2X1TS U954 ( .A(n5905), .B(n5862), .Y(n5136) );
  OAI22X1TS U955 ( .A0(n5919), .A1(n5137), .B0(n5926), .B1(n5136), .Y(n5118)
         );
  NAND2X1TS U956 ( .A(n5142), .B(Data_array_SWR[16]), .Y(n5117) );
  AOI22X1TS U957 ( .A0(Data_array_SWR[9]), .A1(n4915), .B0(Data_array_SWR[21]), 
        .B1(n5215), .Y(n5122) );
  AOI22X1TS U958 ( .A0(Data_array_SWR[17]), .A1(n5214), .B0(Data_array_SWR[13]), .B1(n4917), .Y(n5121) );
  NAND2X1TS U959 ( .A(n5402), .B(n5765), .Y(n5124) );
  BUFX3TS U960 ( .A(n5222), .Y(n5768) );
  AOI21X1TS U961 ( .A0(n3638), .A1(n5768), .B0(n5114), .Y(n5123) );
  AOI21X1TS U962 ( .A0(n5142), .A1(Data_array_SWR[21]), .B0(n5125), .Y(n5126)
         );
  INVX2TS U963 ( .A(n5127), .Y(n5412) );
  AOI21X1TS U964 ( .A0(n5142), .A1(Data_array_SWR[20]), .B0(n5128), .Y(n5129)
         );
  INVX2TS U965 ( .A(n5131), .Y(n5415) );
  AOI22X1TS U966 ( .A0(Data_array_SWR[16]), .A1(n4935), .B0(Data_array_SWR[4]), 
        .B1(n4915), .Y(n5133) );
  AOI22X1TS U967 ( .A0(Data_array_SWR[12]), .A1(n4932), .B0(Data_array_SWR[8]), 
        .B1(n4917), .Y(n5132) );
  INVX2TS U968 ( .A(n5158), .Y(n5221) );
  NAND2X1TS U969 ( .A(n5410), .B(n5221), .Y(n5135) );
  AOI21X1TS U970 ( .A0(n4837), .A1(n5768), .B0(n5114), .Y(n5134) );
  OAI22X1TS U971 ( .A0(n5921), .A1(n5137), .B0(n5864), .B1(n5136), .Y(n5139)
         );
  NAND2X1TS U972 ( .A(n5142), .B(Data_array_SWR[17]), .Y(n5138) );
  NOR2X2TS U973 ( .A(n5141), .B(n5140), .Y(n5409) );
  NAND2X1TS U974 ( .A(n5142), .B(n5926), .Y(n5144) );
  AOI22X1TS U975 ( .A0(Data_array_SWR[20]), .A1(n4935), .B0(Data_array_SWR[8]), 
        .B1(n4915), .Y(n5146) );
  AOI22X1TS U976 ( .A0(Data_array_SWR[12]), .A1(n4917), .B0(Data_array_SWR[16]), .B1(n4932), .Y(n5145) );
  NAND2X1TS U977 ( .A(n5407), .B(n5221), .Y(n5148) );
  AOI21X1TS U978 ( .A0(n4836), .A1(n5222), .B0(n5114), .Y(n5147) );
  AOI22X1TS U979 ( .A0(Data_array_SWR[14]), .A1(n5215), .B0(Data_array_SWR[2]), 
        .B1(n4915), .Y(n5150) );
  AOI22X1TS U980 ( .A0(Data_array_SWR[10]), .A1(n5214), .B0(Data_array_SWR[6]), 
        .B1(n4916), .Y(n5149) );
  NAND2X1TS U981 ( .A(n5456), .B(n5221), .Y(n5152) );
  AOI21X1TS U982 ( .A0(n3627), .A1(n5767), .B0(n5114), .Y(n5151) );
  AOI22X1TS U983 ( .A0(Data_array_SWR[5]), .A1(n4915), .B0(Data_array_SWR[17]), 
        .B1(n4935), .Y(n5154) );
  AOI22X1TS U984 ( .A0(Data_array_SWR[9]), .A1(n4917), .B0(Data_array_SWR[13]), 
        .B1(n5214), .Y(n5153) );
  NAND2X1TS U985 ( .A(n5413), .B(n5221), .Y(n5156) );
  AOI21X1TS U986 ( .A0(n4806), .A1(n5823), .B0(n5114), .Y(n5155) );
  AOI21X1TS U987 ( .A0(n5440), .A1(n5221), .B0(n5164), .Y(n5165) );
  NAND2X1TS U988 ( .A(n5410), .B(n4906), .Y(n5167) );
  AOI21X1TS U989 ( .A0(n5933), .A1(n5768), .B0(n5159), .Y(n5166) );
  NAND2X1TS U990 ( .A(n5413), .B(n4906), .Y(n5169) );
  AOI21X1TS U991 ( .A0(n3657), .A1(n5768), .B0(n5159), .Y(n5168) );
  NAND2X1TS U992 ( .A(n5402), .B(n4906), .Y(n5171) );
  AOI21X1TS U993 ( .A0(n5896), .A1(n5768), .B0(n5159), .Y(n5170) );
  NAND2X1TS U994 ( .A(n5456), .B(n4906), .Y(n5173) );
  AOI21X1TS U995 ( .A0(n2578), .A1(n5222), .B0(n5159), .Y(n5172) );
  NAND2X1TS U996 ( .A(n5404), .B(n4906), .Y(n5175) );
  AOI21X1TS U997 ( .A0(n4781), .A1(n5768), .B0(n5159), .Y(n5174) );
  NAND2X1TS U998 ( .A(n5407), .B(n4907), .Y(n5177) );
  AOI21X1TS U999 ( .A0(n4769), .A1(n5222), .B0(n5159), .Y(n5176) );
  INVX2TS U1000 ( .A(n5114), .Y(n5178) );
  NAND2X1TS U1001 ( .A(n5181), .B(n5797), .Y(n5355) );
  NAND2X1TS U1002 ( .A(n5353), .B(n5352), .Y(n5186) );
  INVX2TS U1003 ( .A(n5182), .Y(n5184) );
  BUFX3TS U1004 ( .A(n5357), .Y(n5468) );
  NAND2X1TS U1005 ( .A(n5355), .B(n5550), .Y(n5183) );
  OAI31X1TS U1006 ( .A0(n5188), .A1(n5187), .A2(n5186), .B0(n5185), .Y(n5189)
         );
  AOI22X1TS U1007 ( .A0(Data_array_SWR[1]), .A1(n4915), .B0(Data_array_SWR[13]), .B1(n4935), .Y(n5191) );
  AOI22X1TS U1008 ( .A0(Data_array_SWR[5]), .A1(n4917), .B0(Data_array_SWR[9]), 
        .B1(n4932), .Y(n5190) );
  NAND2X1TS U1009 ( .A(n5393), .B(n4907), .Y(n5193) );
  AOI21X1TS U1010 ( .A0(n5935), .A1(n5222), .B0(n5159), .Y(n5192) );
  NAND2X1TS U1011 ( .A(n5393), .B(n5221), .Y(n5195) );
  AOI21X1TS U1012 ( .A0(n5929), .A1(n5823), .B0(n5114), .Y(n5194) );
  AOI22X1TS U1013 ( .A0(Data_array_SWR[12]), .A1(n4935), .B0(Data_array_SWR[0]), .B1(n4914), .Y(n5197) );
  AOI22X1TS U1014 ( .A0(Data_array_SWR[8]), .A1(n4932), .B0(Data_array_SWR[4]), 
        .B1(n4916), .Y(n5196) );
  OAI211X1TS U1015 ( .A0(n4896), .A1(n4908), .B0(n5197), .C0(n5196), .Y(n5208)
         );
  NAND2X1TS U1016 ( .A(n5208), .B(n5765), .Y(n5199) );
  BUFX3TS U1017 ( .A(n5222), .Y(n5820) );
  AOI22X1TS U1018 ( .A0(Data_array_SWR[18]), .A1(n4917), .B0(
        Data_array_SWR[14]), .B1(n4915), .Y(n5200) );
  AOI22X1TS U1019 ( .A0(Data_array_SWR[11]), .A1(n4914), .B0(
        Data_array_SWR[19]), .B1(n5214), .Y(n5203) );
  AOI21X1TS U1020 ( .A0(n4916), .A1(Data_array_SWR[15]), .B0(n5432), .Y(n5205)
         );
  AOI222X1TS U1021 ( .A0(n5820), .A1(n2584), .B0(n4907), .B1(n5766), .C0(n5430), .C1(n5221), .Y(n5207) );
  INVX2TS U1022 ( .A(n5207), .Y(n548) );
  NAND2X1TS U1023 ( .A(n5208), .B(n4907), .Y(n5210) );
  AOI21X1TS U1024 ( .A0(DmP_mant_SFG_SWR_25_), .A1(n5768), .B0(n5159), .Y(
        n5209) );
  OAI32X1TS U1025 ( .A0(exp_rslt_NRM2_EW1[1]), .A1(n5441), .A2(n5212), .B0(
        n4902), .B1(final_result_ieee[24]), .Y(n5213) );
  INVX2TS U1026 ( .A(n5213), .Y(n1158) );
  AOI22X1TS U1027 ( .A0(Data_array_SWR[10]), .A1(n4917), .B0(
        Data_array_SWR[14]), .B1(n4932), .Y(n5217) );
  AOI22X1TS U1028 ( .A0(Data_array_SWR[18]), .A1(n4935), .B0(Data_array_SWR[6]), .B1(n4915), .Y(n5216) );
  NAND2X1TS U1029 ( .A(n5775), .B(n4907), .Y(n5219) );
  AOI21X1TS U1030 ( .A0(n5934), .A1(n5768), .B0(n5159), .Y(n5218) );
  NAND2X1TS U1031 ( .A(n5775), .B(n5221), .Y(n5224) );
  AOI21X1TS U1032 ( .A0(n5876), .A1(n5222), .B0(n5114), .Y(n5223) );
  XNOR2X1TS U1033 ( .A(n1469), .B(n2597), .Y(n5227) );
  AOI22X1TS U1034 ( .A0(n5929), .A1(n5689), .B0(n5760), .B1(n5866), .Y(n5226)
         );
  INVX2TS U1035 ( .A(n5292), .Y(n5362) );
  OAI2BB2XLTS U1036 ( .B0(n5231), .B1(n5357), .A0N(n5292), .A1N(n5230), .Y(
        n5232) );
  AOI22X1TS U1037 ( .A0(n5232), .A1(n5234), .B0(n5856), .B1(n5760), .Y(n5233)
         );
  OAI2BB1X1TS U1038 ( .A0N(n5259), .A1N(n5261), .B0(n5258), .Y(n5241) );
  NAND2BX1TS U1039 ( .AN(n5240), .B(n5239), .Y(n5248) );
  AOI22X1TS U1040 ( .A0(n5241), .A1(n5465), .B0(n5277), .B1(n5248), .Y(n5245)
         );
  XNOR2X1TS U1041 ( .A(n2558), .B(n1510), .Y(n5244) );
  OAI22X1TS U1042 ( .A0(n5241), .A1(n5692), .B0(n5770), .B1(n5248), .Y(n5242)
         );
  AOI22X1TS U1043 ( .A0(n5242), .A1(n5244), .B0(Raw_mant_NRM_SWR[12]), .B1(
        n5760), .Y(n5243) );
  OA21XLTS U1044 ( .A0(n5248), .A1(n5247), .B0(n5246), .Y(n5249) );
  AOI22X1TS U1045 ( .A0(n5250), .A1(n5465), .B0(n5689), .B1(n5249), .Y(n5254)
         );
  XNOR2X1TS U1046 ( .A(n2560), .B(n1509), .Y(n5253) );
  OAI22X1TS U1047 ( .A0(n5250), .A1(n5692), .B0(n5249), .B1(n5357), .Y(n5251)
         );
  AOI22X1TS U1048 ( .A0(n5251), .A1(n5253), .B0(Raw_mant_NRM_SWR[13]), .B1(
        n5760), .Y(n5252) );
  AOI21X1TS U1049 ( .A0(n5257), .A1(n4968), .B0(n5256), .Y(n5260) );
  OA22X1TS U1050 ( .A0(n5261), .A1(n5362), .B0(n5260), .B1(n5468), .Y(n5265)
         );
  NAND2X1TS U1051 ( .A(n5259), .B(n5258), .Y(n5264) );
  AOI22X1TS U1052 ( .A0(n5262), .A1(n5264), .B0(Raw_mant_NRM_SWR[11]), .B1(
        n5760), .Y(n5263) );
  OAI32X1TS U1053 ( .A0(exp_rslt_NRM2_EW1[6]), .A1(n5441), .A2(n5271), .B0(
        n4902), .B1(final_result_ieee[29]), .Y(n5266) );
  INVX2TS U1054 ( .A(n5266), .Y(n1160) );
  OAI32X1TS U1055 ( .A0(exp_rslt_NRM2_EW1[2]), .A1(n5441), .A2(n5271), .B0(
        n4902), .B1(final_result_ieee[25]), .Y(n5267) );
  INVX2TS U1056 ( .A(n5267), .Y(n1161) );
  OAI32X1TS U1057 ( .A0(exp_rslt_NRM2_EW1[4]), .A1(n5441), .A2(n5271), .B0(
        n4902), .B1(final_result_ieee[27]), .Y(n5268) );
  INVX2TS U1058 ( .A(n5268), .Y(n1164) );
  OAI32X1TS U1059 ( .A0(exp_rslt_NRM2_EW1[5]), .A1(n5441), .A2(n5271), .B0(
        n4902), .B1(final_result_ieee[28]), .Y(n5269) );
  INVX2TS U1060 ( .A(n5269), .Y(n1162) );
  OAI32X1TS U1061 ( .A0(exp_rslt_NRM2_EW1[3]), .A1(n5441), .A2(n5271), .B0(
        n4902), .B1(final_result_ieee[26]), .Y(n5270) );
  INVX2TS U1062 ( .A(n5270), .Y(n1163) );
  OAI32X1TS U1063 ( .A0(exp_rslt_NRM2_EW1[0]), .A1(n5441), .A2(n5271), .B0(
        n4902), .B1(final_result_ieee[23]), .Y(n5272) );
  INVX2TS U1064 ( .A(n5272), .Y(n1159) );
  INVX2TS U1065 ( .A(n5273), .Y(n5274) );
  OAI2BB2XLTS U1066 ( .B0(n5278), .B1(n5692), .A0N(n5277), .A1N(n5276), .Y(
        n5279) );
  AOI22X1TS U1067 ( .A0(n5279), .A1(n5281), .B0(Raw_mant_NRM_SWR[15]), .B1(
        n4940), .Y(n5280) );
  NAND2X1TS U1068 ( .A(n5284), .B(n5283), .Y(n5331) );
  INVX2TS U1069 ( .A(n5327), .Y(n5285) );
  OAI21X1TS U1070 ( .A0(n5331), .A1(n5285), .B0(n5328), .Y(n5289) );
  NAND2X1TS U1071 ( .A(n5287), .B(n5286), .Y(n5288) );
  AOI21X1TS U1072 ( .A0(n5289), .A1(n5689), .B0(n5288), .Y(n5290) );
  OAI2BB1X1TS U1073 ( .A0N(n5292), .A1N(n5291), .B0(n5290), .Y(n5293) );
  NAND2X1TS U1074 ( .A(n5297), .B(n5359), .Y(n5348) );
  INVX2TS U1075 ( .A(n5343), .Y(n5298) );
  OAI21X1TS U1076 ( .A0(n5348), .A1(n5298), .B0(n5342), .Y(n5303) );
  NAND2X1TS U1077 ( .A(n5300), .B(n5299), .Y(n5313) );
  NAND2X1TS U1078 ( .A(n5313), .B(n5689), .Y(n5302) );
  NAND2X1TS U1079 ( .A(n5314), .B(n5301), .Y(n5304) );
  NAND2X1TS U1080 ( .A(n5303), .B(n5550), .Y(n5306) );
  INVX2TS U1081 ( .A(n5304), .Y(n5305) );
  NAND2X1TS U1082 ( .A(n5308), .B(n5307), .Y(n5309) );
  INVX2TS U1083 ( .A(n5310), .Y(n5312) );
  OAI21X1TS U1084 ( .A0(n5313), .A1(n5312), .B0(n5311), .Y(n5318) );
  NAND2X1TS U1085 ( .A(n5315), .B(n5314), .Y(n5326) );
  NAND2X1TS U1086 ( .A(n5326), .B(n5465), .Y(n5316) );
  NAND2X1TS U1087 ( .A(n5323), .B(n5324), .Y(n5317) );
  AOI21X1TS U1088 ( .A0(n5318), .A1(n5689), .B0(n5317), .Y(n5319) );
  NAND2X1TS U1089 ( .A(n5321), .B(n5320), .Y(n5322) );
  INVX2TS U1090 ( .A(n5323), .Y(n5325) );
  OAI21X1TS U1091 ( .A0(n5326), .A1(n5325), .B0(n5324), .Y(n5333) );
  NAND2X1TS U1092 ( .A(n5333), .B(n5550), .Y(n5329) );
  NAND2X1TS U1093 ( .A(n5328), .B(n5327), .Y(n5330) );
  AOI21X1TS U1094 ( .A0(n5331), .A1(n5554), .B0(n5330), .Y(n5332) );
  NAND2X1TS U1095 ( .A(n5335), .B(n5334), .Y(n5336) );
  NAND2X1TS U1096 ( .A(n5338), .B(n5337), .Y(n5360) );
  INVX2TS U1097 ( .A(n5339), .Y(n5341) );
  OAI21X1TS U1098 ( .A0(n5360), .A1(n5341), .B0(n5340), .Y(n5346) );
  NAND2X1TS U1099 ( .A(n5348), .B(n5550), .Y(n5344) );
  NAND2X1TS U1100 ( .A(n5343), .B(n5342), .Y(n5345) );
  AOI21X1TS U1101 ( .A0(n5346), .A1(n5554), .B0(n5345), .Y(n5347) );
  NAND2X1TS U1102 ( .A(n5350), .B(n5349), .Y(n5351) );
  OAI21X1TS U1103 ( .A0(n5355), .A1(n5354), .B0(n5353), .Y(n5363) );
  INVX2TS U1104 ( .A(n5363), .Y(n5356) );
  NAND2X1TS U1105 ( .A(n5359), .B(n5358), .Y(n5365) );
  NAND2X1TS U1106 ( .A(n5360), .B(n5277), .Y(n5361) );
  OAI31X1TS U1107 ( .A0(n5367), .A1(n5366), .A2(n5365), .B0(n5364), .Y(n5368)
         );
  AOI21X1TS U1108 ( .A0(n5371), .A1(n5370), .B0(n5369), .Y(n5419) );
  NOR2X1TS U1109 ( .A(n5897), .B(n4781), .Y(n5417) );
  NOR2X1TS U1110 ( .A(n5417), .B(n5416), .Y(n5372) );
  XOR2X1TS U1111 ( .A(n5419), .B(n5372), .Y(n5376) );
  XOR2X1TS U1112 ( .A(n5373), .B(n5372), .Y(n5374) );
  AOI22X1TS U1113 ( .A0(n5374), .A1(n5465), .B0(n5865), .B1(n5819), .Y(n5375)
         );
  OAI21X1TS U1114 ( .A0(Raw_mant_NRM_SWR[13]), .A1(Raw_mant_NRM_SWR[11]), .B0(
        n5379), .Y(n5385) );
  OAI211X1TS U1115 ( .A0(n5382), .A1(n5381), .B0(n5380), .C0(n5385), .Y(n5810)
         );
  BUFX3TS U1116 ( .A(n5931), .Y(n5849) );
  AOI22X1TS U1117 ( .A0(n4905), .A1(n5810), .B0(n5451), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n5383) );
  OAI21XLTS U1118 ( .A0(n5387), .A1(n5386), .B0(n5385), .Y(n5390) );
  OAI2BB1X1TS U1119 ( .A0N(Raw_mant_NRM_SWR[3]), .A1N(n5447), .B0(n5388), .Y(
        n5389) );
  AOI211X1TS U1120 ( .A0(n5391), .A1(n5916), .B0(n5390), .C0(n5389), .Y(n5809)
         );
  AOI22X1TS U1121 ( .A0(n5658), .A1(shift_value_SHT2_EWR[2]), .B0(n5451), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n5392) );
  AOI22X1TS U1122 ( .A0(n5441), .A1(final_result_ieee[22]), .B0(n4910), .B1(
        n5393), .Y(n5394) );
  AOI22X1TS U1123 ( .A0(n4922), .A1(final_result_ieee[21]), .B0(n4911), .B1(
        n5456), .Y(n5396) );
  AOI22X1TS U1124 ( .A0(n4922), .A1(final_result_ieee[2]), .B0(n5774), .B1(
        n5410), .Y(n5397) );
  AOI22X1TS U1125 ( .A0(n4922), .A1(final_result_ieee[5]), .B0(n5774), .B1(
        n5404), .Y(n5398) );
  AOI22X1TS U1126 ( .A0(n4923), .A1(final_result_ieee[3]), .B0(n5774), .B1(
        n5413), .Y(n5399) );
  AOI22X1TS U1127 ( .A0(n4923), .A1(final_result_ieee[7]), .B0(n5774), .B1(
        n5402), .Y(n5400) );
  AOI22X1TS U1128 ( .A0(n4922), .A1(final_result_ieee[6]), .B0(n5774), .B1(
        n5407), .Y(n5401) );
  AOI22X1TS U1129 ( .A0(n4923), .A1(final_result_ieee[14]), .B0(n4910), .B1(
        n5402), .Y(n5403) );
  AOI22X1TS U1130 ( .A0(n4922), .A1(final_result_ieee[16]), .B0(n4911), .B1(
        n5404), .Y(n5405) );
  AOI22X1TS U1131 ( .A0(n4922), .A1(final_result_ieee[15]), .B0(n4911), .B1(
        n5407), .Y(n5408) );
  AOI22X1TS U1132 ( .A0(n4923), .A1(final_result_ieee[19]), .B0(n4911), .B1(
        n5410), .Y(n5411) );
  AOI22X1TS U1133 ( .A0(n4923), .A1(final_result_ieee[18]), .B0(n4911), .B1(
        n5413), .Y(n5414) );
  INVX2TS U1134 ( .A(n5416), .Y(n5418) );
  AOI21X1TS U1135 ( .A0(n5419), .A1(n5418), .B0(n5417), .Y(n5423) );
  AOI22X1TS U1136 ( .A0(n5424), .A1(n5465), .B0(n5554), .B1(n5423), .Y(n5428)
         );
  INVX2TS U1137 ( .A(n5420), .Y(n5422) );
  NAND2X1TS U1138 ( .A(n5422), .B(n5421), .Y(n5427) );
  OAI22X1TS U1139 ( .A0(n5424), .A1(n5692), .B0(n5423), .B1(n5468), .Y(n5425)
         );
  AOI22X1TS U1140 ( .A0(n5425), .A1(n5427), .B0(Raw_mant_NRM_SWR[19]), .B1(
        n5819), .Y(n5426) );
  INVX2TS U1141 ( .A(n5774), .Y(n5435) );
  AOI22X1TS U1142 ( .A0(n4923), .A1(final_result_ieee[8]), .B0(n4911), .B1(
        n5437), .Y(n5429) );
  INVX2TS U1143 ( .A(n5430), .Y(n5763) );
  AOI22X1TS U1144 ( .A0(n4923), .A1(final_result_ieee[9]), .B0(n4911), .B1(
        n5766), .Y(n5431) );
  AOI22X1TS U1145 ( .A0(n5441), .A1(final_result_ieee[11]), .B0(n4910), .B1(
        n5440), .Y(n5434) );
  NAND2BX1TS U1146 ( .AN(n5433), .B(n5432), .Y(n5442) );
  AOI22X1TS U1147 ( .A0(n4923), .A1(final_result_ieee[12]), .B0(n4947), .B1(
        n5766), .Y(n5436) );
  AOI22X1TS U1148 ( .A0(n4923), .A1(final_result_ieee[13]), .B0(n4947), .B1(
        n5437), .Y(n5438) );
  AOI22X1TS U1149 ( .A0(n5441), .A1(final_result_ieee[10]), .B0(n5774), .B1(
        n5440), .Y(n5443) );
  NAND2X1TS U1150 ( .A(n3615), .B(n4768), .Y(n5446) );
  OAI31X1TS U1151 ( .A0(n5860), .A1(n5446), .A2(n5916), .B0(n5445), .Y(n5450)
         );
  OAI32X1TS U1152 ( .A0(n5448), .A1(n5866), .A2(n5895), .B0(n5447), .B1(n5448), 
        .Y(n5449) );
  NAND2X1TS U1153 ( .A(n5450), .B(n5449), .Y(n5772) );
  AOI22X1TS U1154 ( .A0(n5631), .A1(n5772), .B0(Shift_amount_SHT1_EWR[4]), 
        .B1(n5451), .Y(n5452) );
  AOI22X1TS U1155 ( .A0(n4922), .A1(final_result_ieee[1]), .B0(n5774), .B1(
        n5453), .Y(n5454) );
  AOI22X1TS U1156 ( .A0(n4922), .A1(final_result_ieee[0]), .B0(n5774), .B1(
        n5456), .Y(n5457) );
  XOR2X1TS U1157 ( .A(n2575), .B(n5908), .Y(n5460) );
  XOR2X1TS U1158 ( .A(n5459), .B(n5460), .Y(n5464) );
  XOR2X1TS U1159 ( .A(n5461), .B(n5460), .Y(n5462) );
  AOI22X1TS U1160 ( .A0(n5462), .A1(n5277), .B0(n4747), .B1(n5760), .Y(n5463)
         );
  AOI22X1TS U1161 ( .A0(n5471), .A1(n5465), .B0(n5469), .B1(n5277), .Y(n5475)
         );
  OAI22X1TS U1162 ( .A0(n5471), .A1(n5692), .B0(n5469), .B1(n5468), .Y(n5472)
         );
  AOI22X1TS U1163 ( .A0(n5472), .A1(n5474), .B0(Raw_mant_NRM_SWR[21]), .B1(
        n5760), .Y(n5473) );
  XOR2X1TS U1164 ( .A(n5478), .B(n5479), .Y(n5484) );
  INVX2TS U1165 ( .A(n5479), .Y(n5480) );
  XOR2X1TS U1166 ( .A(n5481), .B(n5480), .Y(n5482) );
  AOI22X1TS U1167 ( .A0(n5482), .A1(n5277), .B0(Raw_mant_NRM_SWR[22]), .B1(
        n4940), .Y(n5483) );
  AOI22X1TS U1168 ( .A0(intDY_EWSW[17]), .A1(n5857), .B0(intDY_EWSW[18]), .B1(
        n5883), .Y(n5529) );
  AO22X2TS U1169 ( .A0(intDY_EWSW[3]), .A1(n5869), .B0(intDY_EWSW[2]), .B1(
        n1483), .Y(n5532) );
  OAI22X1TS U1170 ( .A0(n1482), .A1(intDY_EWSW[1]), .B0(intDY_EWSW[2]), .B1(
        n1483), .Y(n5485) );
  AOI31X1TS U1171 ( .A0(n4840), .A1(n5525), .A2(n4937), .B0(n5485), .Y(n5486)
         );
  OAI22X2TS U1172 ( .A0(n5532), .A1(n5486), .B0(intDY_EWSW[3]), .B1(n5869), 
        .Y(n5487) );
  AOI2BB2X4TS U1173 ( .B0(n5526), .B1(n5487), .A0N(n5997), .A1N(intDY_EWSW[5]), 
        .Y(n5488) );
  AOI22X1TS U1174 ( .A0(intDY_EWSW[5]), .A1(n5997), .B0(intDY_EWSW[6]), .B1(
        n5873), .Y(n5540) );
  AOI222X2TS U1175 ( .A0(n5874), .A1(n3606), .B0(n1459), .B1(intDX_EWSW[7]), 
        .C0(n5489), .C1(n5540), .Y(n5497) );
  AOI22X1TS U1176 ( .A0(n4835), .A1(n5871), .B0(n1488), .B1(intDY_EWSW[9]), 
        .Y(n5490) );
  NAND2X1TS U1177 ( .A(n1488), .B(intDY_EWSW[9]), .Y(n5492) );
  OAI22X1TS U1178 ( .A0(n1437), .A1(intDY_EWSW[10]), .B0(n1488), .B1(
        intDY_EWSW[9]), .Y(n5491) );
  INVX2TS U1179 ( .A(n5493), .Y(n5494) );
  AOI222X2TS U1180 ( .A0(n4749), .A1(n4774), .B0(n4749), .B1(n5498), .C0(n4774), .C1(n5498), .Y(n5499) );
  AOI22X1TS U1181 ( .A0(intDY_EWSW[13]), .A1(n5858), .B0(intDY_EWSW[14]), .B1(
        n5882), .Y(n5539) );
  NAND2X1TS U1182 ( .A(n1461), .B(intDY_EWSW[20]), .Y(n5528) );
  OAI22X1TS U1183 ( .A0(n1458), .A1(intDY_EWSW[21]), .B0(n1461), .B1(
        intDY_EWSW[20]), .Y(n5505) );
  AOI21X4TS U1184 ( .A0(n5506), .A1(n5528), .B0(n5505), .Y(n5507) );
  OAI22X4TS U1185 ( .A0(n5507), .A1(n5530), .B0(intDY_EWSW[22]), .B1(n1487), 
        .Y(n5508) );
  NAND2X1TS U1186 ( .A(intDY_EWSW[22]), .B(n1487), .Y(n5524) );
  AOI22X4TS U1187 ( .A0(n4785), .A1(n2589), .B0(n5508), .B1(n5524), .Y(n5521)
         );
  AOI22X1TS U1188 ( .A0(n73), .A1(n4755), .B0(n1464), .B1(intDY_EWSW[27]), .Y(
        n5516) );
  OA21XLTS U1189 ( .A0(n5861), .A1(n5894), .B0(n5515), .Y(n5509) );
  OAI211X1TS U1190 ( .A0(n4753), .A1(n1430), .B0(n5516), .C0(n5509), .Y(n5544)
         );
  NOR2X1TS U1191 ( .A(n2589), .B(n4785), .Y(n5535) );
  OAI31X1TS U1192 ( .A0(n5512), .A1(n1439), .A2(n4786), .B0(n5511), .Y(n5514)
         );
  OAI22X1TS U1193 ( .A0(n1464), .A1(intDY_EWSW[27]), .B0(n1432), .B1(
        intDY_EWSW[28]), .Y(n5513) );
  AOI32X1TS U1194 ( .A0(n5516), .A1(n5515), .A2(n5514), .B0(n5513), .B1(n5515), 
        .Y(n5518) );
  OAI22X1TS U1195 ( .A0(intDY_EWSW[30]), .A1(n5910), .B0(n1491), .B1(n3648), 
        .Y(n5517) );
  OAI21X4TS U1196 ( .A0(n5521), .A1(n5520), .B0(n5519), .Y(n5522) );
  OAI21X4TS U1197 ( .A0(n4815), .A1(n5906), .B0(n5522), .Y(n5545) );
  NAND2X4TS U1198 ( .A(n4904), .B(n5545), .Y(n5694) );
  AOI22X1TS U1199 ( .A0(intDY_EWSW[17]), .A1(n4927), .B0(DmP_EXP_EWSW[17]), 
        .B1(n5560), .Y(n5523) );
  NAND4BXLTS U1200 ( .AN(n5527), .B(n5526), .C(n5525), .D(n5524), .Y(n5543) );
  NAND3BXLTS U1201 ( .AN(n5530), .B(n5529), .C(n5528), .Y(n5542) );
  NOR2XLTS U1202 ( .A(n4815), .B(n5906), .Y(n5536) );
  OAI22X1TS U1203 ( .A0(n4749), .A1(n4774), .B0(n4840), .B1(n4937), .Y(n5533)
         );
  NOR4X1TS U1204 ( .A(n5536), .B(n5535), .C(n5534), .D(n5533), .Y(n5537) );
  NAND4XLTS U1205 ( .A(n5540), .B(n5539), .C(n5538), .D(n5537), .Y(n5541) );
  NOR4X1TS U1206 ( .A(n5544), .B(n5543), .C(n5542), .D(n5541), .Y(n5548) );
  AOI21X1TS U1207 ( .A0(n5545), .A1(n5837), .B0(n5560), .Y(n5546) );
  AOI22X1TS U1208 ( .A0(intDX_EWSW[31]), .A1(n5546), .B0(SIGN_FLAG_EXP), .B1(
        n5560), .Y(n5547) );
  OAI31X1TS U1209 ( .A0(n5548), .A1(n5840), .A2(n5837), .B0(n5547), .Y(n787)
         );
  INVX2TS U1210 ( .A(n5553), .Y(n5549) );
  AOI22X1TS U1211 ( .A0(n5555), .A1(n5550), .B0(n5549), .B1(n5689), .Y(n5559)
         );
  OAI2BB2X1TS U1212 ( .B0(n5555), .B1(n5470), .A0N(n5554), .A1N(n5553), .Y(
        n5556) );
  AOI22X1TS U1213 ( .A0(n5556), .A1(n5558), .B0(Raw_mant_NRM_SWR[23]), .B1(
        n5819), .Y(n5557) );
  BUFX4TS U1214 ( .A(n5840), .Y(n5842) );
  BUFX3TS U1215 ( .A(n5560), .Y(n5713) );
  AOI22X1TS U1216 ( .A0(intDY_EWSW[9]), .A1(n4928), .B0(DmP_EXP_EWSW[9]), .B1(
        n5713), .Y(n5561) );
  AOI22X1TS U1217 ( .A0(intDY_EWSW[11]), .A1(n4927), .B0(DmP_EXP_EWSW[11]), 
        .B1(n5713), .Y(n5562) );
  AOI22X1TS U1218 ( .A0(intDY_EWSW[13]), .A1(n4928), .B0(DmP_EXP_EWSW[13]), 
        .B1(n5713), .Y(n5563) );
  AOI22X1TS U1219 ( .A0(intDY_EWSW[3]), .A1(n4927), .B0(DmP_EXP_EWSW[3]), .B1(
        n5713), .Y(n5564) );
  BUFX3TS U1220 ( .A(n5560), .Y(n5734) );
  AOI22X1TS U1221 ( .A0(n4840), .A1(n4928), .B0(DMP_EXP_EWSW[0]), .B1(n5734), 
        .Y(n5565) );
  AOI22X1TS U1222 ( .A0(n4835), .A1(n4927), .B0(DmP_EXP_EWSW[8]), .B1(n4903), 
        .Y(n5566) );
  AOI22X1TS U1223 ( .A0(intDY_EWSW[10]), .A1(n4928), .B0(DmP_EXP_EWSW[10]), 
        .B1(n5713), .Y(n5567) );
  AOI22X1TS U1224 ( .A0(n4749), .A1(n4927), .B0(DMP_EXP_EWSW[12]), .B1(n5734), 
        .Y(n5568) );
  INVX4TS U1225 ( .A(n4918), .Y(n5748) );
  AOI22X1TS U1226 ( .A0(n5604), .A1(Raw_mant_NRM_SWR[25]), .B0(n5676), .B1(
        Data_array_SWR[0]), .Y(n5576) );
  INVX2TS U1227 ( .A(n5571), .Y(n5752) );
  AOI22X1TS U1228 ( .A0(n5632), .A1(DmP_mant_SHT1_SW[1]), .B0(
        Raw_mant_NRM_SWR[22]), .B1(n5604), .Y(n5574) );
  OAI2BB2X1TS U1229 ( .B0(n1452), .B1(n5634), .A0N(Raw_mant_NRM_SWR[24]), 
        .A1N(n5631), .Y(n5584) );
  AOI21X1TS U1230 ( .A0(n4913), .A1(n5739), .B0(n5584), .Y(n5575) );
  OAI2BB2XLTS U1231 ( .B0(n5635), .B1(n1452), .A0N(DmP_mant_SHT1_SW[22]), 
        .A1N(n5853), .Y(n5577) );
  INVX2TS U1232 ( .A(n5642), .Y(n5649) );
  AOI22X1TS U1233 ( .A0(n5658), .A1(n4801), .B0(n4924), .B1(n5649), .Y(n5583)
         );
  NAND2X1TS U1234 ( .A(n4919), .B(n5655), .Y(n5582) );
  AOI22X1TS U1235 ( .A0(n5752), .A1(Data_array_SWR[1]), .B0(n4924), .B1(n5584), 
        .Y(n5587) );
  AOI22X1TS U1236 ( .A0(n5632), .A1(DmP_mant_SHT1_SW[2]), .B0(
        Raw_mant_NRM_SWR[21]), .B1(n5631), .Y(n5585) );
  AOI22X1TS U1237 ( .A0(n4913), .A1(n5740), .B0(n4919), .B1(n5739), .Y(n5586)
         );
  NAND2X1TS U1238 ( .A(n5604), .B(n4747), .Y(n5589) );
  AOI22X1TS U1239 ( .A0(n5752), .A1(Data_array_SWR[5]), .B0(n4924), .B1(n5738), 
        .Y(n5595) );
  AOI22X1TS U1240 ( .A0(n5632), .A1(DmP_mant_SHT1_SW[6]), .B0(
        Raw_mant_NRM_SWR[17]), .B1(n5604), .Y(n5592) );
  OA22X1TS U1241 ( .A0(n5635), .A1(n4788), .B0(n5813), .B1(n3673), .Y(n5593)
         );
  AOI22X1TS U1242 ( .A0(n4912), .A1(n5659), .B0(n4919), .B1(n4892), .Y(n5594)
         );
  OAI22X1TS U1243 ( .A0(n5634), .A1(n3615), .B0(n5811), .B1(n5925), .Y(n5597)
         );
  NOR2X1TS U1244 ( .A(n5597), .B(n5596), .Y(n5616) );
  AOI22X1TS U1245 ( .A0(n5658), .A1(Data_array_SWR[7]), .B0(n4925), .B1(n4892), 
        .Y(n5600) );
  AOI22X1TS U1246 ( .A0(n4900), .A1(n4809), .B0(Raw_mant_NRM_SWR[15]), .B1(
        n4905), .Y(n5598) );
  AOI22X1TS U1247 ( .A0(n4913), .A1(n5621), .B0(n4921), .B1(n5659), .Y(n5599)
         );
  OAI22X1TS U1248 ( .A0(n5635), .A1(n5629), .B0(n5898), .B1(n5634), .Y(n5601)
         );
  AOI22X1TS U1249 ( .A0(n5752), .A1(Data_array_SWR[10]), .B0(n4925), .B1(n5621), .Y(n5607) );
  INVX2TS U1250 ( .A(n5749), .Y(n5652) );
  AOI22X1TS U1251 ( .A0(n5632), .A1(DmP_mant_SHT1_SW[10]), .B0(
        Raw_mant_NRM_SWR[13]), .B1(n5604), .Y(n5605) );
  AOI22X1TS U1252 ( .A0(n4913), .A1(n5652), .B0(n4919), .B1(n5744), .Y(n5606)
         );
  AOI22X1TS U1253 ( .A0(n5865), .A1(n4900), .B0(DmP_mant_SHT1_SW[16]), .B1(
        n5632), .Y(n5609) );
  AOI22X1TS U1254 ( .A0(n5752), .A1(Data_array_SWR[18]), .B0(n4925), .B1(n5750), .Y(n5613) );
  AOI22X1TS U1255 ( .A0(n4899), .A1(Raw_mant_NRM_SWR[21]), .B0(
        DmP_mant_SHT1_SW[19]), .B1(n5632), .Y(n5610) );
  OAI2BB1X1TS U1256 ( .A0N(n5631), .A1N(n5860), .B0(n5610), .Y(n5677) );
  AOI22X1TS U1257 ( .A0(n4912), .A1(n5677), .B0(n4918), .B1(n5675), .Y(n5612)
         );
  AOI22X1TS U1258 ( .A0(n5658), .A1(Data_array_SWR[3]), .B0(n4924), .B1(n5739), 
        .Y(n5615) );
  AOI22X1TS U1259 ( .A0(n4918), .A1(n5738), .B0(n4920), .B1(n5740), .Y(n5614)
         );
  INVX2TS U1260 ( .A(n5616), .Y(n5660) );
  AOI22X1TS U1261 ( .A0(n5676), .A1(Data_array_SWR[9]), .B0(n4924), .B1(n5660), 
        .Y(n5618) );
  AOI22X1TS U1262 ( .A0(n4913), .A1(n5744), .B0(n4921), .B1(n5621), .Y(n5617)
         );
  AOI22X1TS U1263 ( .A0(n5676), .A1(Data_array_SWR[4]), .B0(n4925), .B1(n5740), 
        .Y(n5620) );
  AOI22X1TS U1264 ( .A0(n4912), .A1(n4892), .B0(n4920), .B1(n5738), .Y(n5619)
         );
  AOI22X1TS U1265 ( .A0(n5658), .A1(Data_array_SWR[8]), .B0(n4921), .B1(n5660), 
        .Y(n5623) );
  AOI22X1TS U1266 ( .A0(n4919), .A1(n5621), .B0(n4925), .B1(n5659), .Y(n5622)
         );
  AOI22X1TS U1267 ( .A0(n5676), .A1(n2595), .B0(n4921), .B1(n5649), .Y(n5626)
         );
  AOI22X1TS U1268 ( .A0(n4900), .A1(Raw_mant_NRM_SWR[22]), .B0(n5632), .B1(
        DmP_mant_SHT1_SW[20]), .Y(n5624) );
  AOI22X1TS U1269 ( .A0(n4913), .A1(n5655), .B0(n4925), .B1(n5678), .Y(n5625)
         );
  OAI22X1TS U1270 ( .A0(n5021), .A1(n5863), .B0(n5923), .B1(n5627), .Y(n5628)
         );
  OAI22X1TS U1271 ( .A0(n5634), .A1(n5629), .B0(n5811), .B1(n3674), .Y(n5630)
         );
  AO21X1TS U1272 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n5631), .B0(n5630), .Y(n5745) );
  AOI22X1TS U1273 ( .A0(n5658), .A1(Data_array_SWR[14]), .B0(n4924), .B1(n5745), .Y(n5638) );
  AOI22X1TS U1274 ( .A0(n4900), .A1(Raw_mant_NRM_SWR[17]), .B0(
        DmP_mant_SHT1_SW[15]), .B1(n5632), .Y(n5633) );
  OAI22X1TS U1275 ( .A0(n5635), .A1(n3615), .B0(n4841), .B1(n5634), .Y(n5636)
         );
  AO21X1TS U1276 ( .A0(DmP_mant_SHT1_SW[14]), .A1(n5853), .B0(n5636), .Y(n5753) );
  AOI22X1TS U1277 ( .A0(n4913), .A1(n5754), .B0(n4919), .B1(n5753), .Y(n5637)
         );
  AOI22X1TS U1278 ( .A0(n5658), .A1(Data_array_SWR[20]), .B0(n4925), .B1(n5675), .Y(n5641) );
  AOI22X1TS U1279 ( .A0(n4919), .A1(n5678), .B0(n4921), .B1(n5677), .Y(n5640)
         );
  AOI22X1TS U1280 ( .A0(n5658), .A1(Data_array_SWR[16]), .B0(n4925), .B1(n5753), .Y(n5644) );
  AOI22X1TS U1281 ( .A0(n4918), .A1(n5750), .B0(n4920), .B1(n5754), .Y(n5643)
         );
  AOI22X1TS U1282 ( .A0(n5658), .A1(Data_array_SWR[12]), .B0(n4924), .B1(n5744), .Y(n5646) );
  AOI22X1TS U1283 ( .A0(n4919), .A1(n5745), .B0(n4920), .B1(n5652), .Y(n5645)
         );
  AOI22X1TS U1284 ( .A0(n5676), .A1(Data_array_SWR[17]), .B0(n4925), .B1(n5754), .Y(n5648) );
  AOI22X1TS U1285 ( .A0(n4912), .A1(n5675), .B0(n4920), .B1(n5750), .Y(n5647)
         );
  AOI22X1TS U1286 ( .A0(n5676), .A1(Data_array_SWR[21]), .B0(n4921), .B1(n5678), .Y(n5651) );
  AOI22X1TS U1287 ( .A0(n4919), .A1(n5649), .B0(n4924), .B1(n5677), .Y(n5650)
         );
  AOI22X1TS U1288 ( .A0(n5676), .A1(Data_array_SWR[13]), .B0(n4921), .B1(n5745), .Y(n5654) );
  AOI22X1TS U1289 ( .A0(n4912), .A1(n5753), .B0(n4925), .B1(n5652), .Y(n5653)
         );
  INVX2TS U1290 ( .A(n4924), .Y(n5751) );
  AOI22X1TS U1291 ( .A0(n5676), .A1(Data_array_SWR[24]), .B0(n4921), .B1(n5655), .Y(n5656) );
  AOI22X1TS U1292 ( .A0(n5658), .A1(Data_array_SWR[6]), .B0(n4920), .B1(n4892), 
        .Y(n5662) );
  AOI22X1TS U1293 ( .A0(n4912), .A1(n5660), .B0(n4918), .B1(n5659), .Y(n5661)
         );
  BUFX3TS U1294 ( .A(n5560), .Y(n5731) );
  AOI22X1TS U1295 ( .A0(intDY_EWSW[2]), .A1(n4927), .B0(DmP_EXP_EWSW[2]), .B1(
        n5731), .Y(n5664) );
  AOI22X1TS U1296 ( .A0(intDY_EWSW[22]), .A1(n4928), .B0(DmP_EXP_EWSW[22]), 
        .B1(n5731), .Y(n5665) );
  AOI22X1TS U1297 ( .A0(intDY_EWSW[1]), .A1(n4927), .B0(DmP_EXP_EWSW[1]), .B1(
        n5731), .Y(n5666) );
  AOI22X1TS U1298 ( .A0(intDY_EWSW[16]), .A1(n4928), .B0(DmP_EXP_EWSW[16]), 
        .B1(n5731), .Y(n5667) );
  AOI22X1TS U1299 ( .A0(intDY_EWSW[4]), .A1(n4927), .B0(DmP_EXP_EWSW[4]), .B1(
        n5731), .Y(n5668) );
  AOI22X1TS U1300 ( .A0(intDY_EWSW[19]), .A1(n4926), .B0(DmP_EXP_EWSW[19]), 
        .B1(n5848), .Y(n5669) );
  AOI22X1TS U1301 ( .A0(intDY_EWSW[21]), .A1(n4927), .B0(DmP_EXP_EWSW[21]), 
        .B1(n5713), .Y(n5670) );
  AOI22X1TS U1302 ( .A0(intDX_EWSW[7]), .A1(n4926), .B0(DMP_EXP_EWSW[7]), .B1(
        n5731), .Y(n5671) );
  AOI22X1TS U1303 ( .A0(intDY_EWSW[20]), .A1(n4926), .B0(DmP_EXP_EWSW[20]), 
        .B1(n5731), .Y(n5672) );
  AOI22X1TS U1304 ( .A0(intDY_EWSW[27]), .A1(n4928), .B0(DmP_EXP_EWSW[27]), 
        .B1(n4889), .Y(n5673) );
  AOI22X1TS U1305 ( .A0(n5676), .A1(Data_array_SWR[19]), .B0(n4920), .B1(n5675), .Y(n5680) );
  AOI22X1TS U1306 ( .A0(n4912), .A1(n5678), .B0(n4918), .B1(n5677), .Y(n5679)
         );
  INVX2TS U1307 ( .A(n5682), .Y(n5684) );
  NAND2X1TS U1308 ( .A(n5684), .B(n5683), .Y(n5686) );
  XNOR2X1TS U1309 ( .A(n5685), .B(n5686), .Y(n5693) );
  INVX2TS U1310 ( .A(n5686), .Y(n5687) );
  XOR2X1TS U1311 ( .A(n5688), .B(n5687), .Y(n5690) );
  AOI22X1TS U1312 ( .A0(n5690), .A1(n5554), .B0(Raw_mant_NRM_SWR[24]), .B1(
        n5821), .Y(n5691) );
  OAI21X1TS U1313 ( .A0(n5693), .A1(n5470), .B0(n5691), .Y(n589) );
  INVX2TS U1314 ( .A(n5694), .Y(n5696) );
  AOI222X1TS U1315 ( .A0(n4786), .A1(n5696), .B0(n4887), .B1(n5560), .C0(n4928), .C1(n5861), .Y(n5695) );
  INVX2TS U1316 ( .A(n5695), .Y(n795) );
  AOI22X1TS U1317 ( .A0(intDY_EWSW[27]), .A1(n5696), .B0(DMP_EXP_EWSW[27]), 
        .B1(n5734), .Y(n5697) );
  BUFX3TS U1318 ( .A(n5708), .Y(n5728) );
  AOI22X1TS U1319 ( .A0(intDY_EWSW[13]), .A1(n5720), .B0(DMP_EXP_EWSW[13]), 
        .B1(n4903), .Y(n5698) );
  AOI22X1TS U1320 ( .A0(intDY_EWSW[11]), .A1(n5720), .B0(DMP_EXP_EWSW[11]), 
        .B1(n4903), .Y(n5699) );
  AOI22X1TS U1321 ( .A0(intDY_EWSW[2]), .A1(n5720), .B0(DMP_EXP_EWSW[2]), .B1(
        n5713), .Y(n5700) );
  AOI22X1TS U1322 ( .A0(intDY_EWSW[9]), .A1(n5720), .B0(DMP_EXP_EWSW[9]), .B1(
        n5734), .Y(n5701) );
  AOI22X1TS U1323 ( .A0(intDY_EWSW[4]), .A1(n5720), .B0(DMP_EXP_EWSW[4]), .B1(
        n5734), .Y(n5702) );
  AOI22X1TS U1324 ( .A0(intDY_EWSW[1]), .A1(n5720), .B0(DMP_EXP_EWSW[1]), .B1(
        n5734), .Y(n5703) );
  AOI22X1TS U1325 ( .A0(intDY_EWSW[22]), .A1(n5718), .B0(DMP_EXP_EWSW[22]), 
        .B1(n5848), .Y(n5704) );
  AOI22X1TS U1326 ( .A0(intDX_EWSW[7]), .A1(n5720), .B0(DmP_EXP_EWSW[7]), .B1(
        n5734), .Y(n5705) );
  AOI22X1TS U1327 ( .A0(intDY_EWSW[21]), .A1(n5718), .B0(DMP_EXP_EWSW[21]), 
        .B1(n5848), .Y(n5706) );
  AOI22X1TS U1328 ( .A0(intDY_EWSW[20]), .A1(n5718), .B0(DMP_EXP_EWSW[20]), 
        .B1(n5848), .Y(n5707) );
  AOI22X1TS U1329 ( .A0(intDY_EWSW[3]), .A1(n5718), .B0(DMP_EXP_EWSW[3]), .B1(
        n5560), .Y(n5709) );
  AOI22X1TS U1330 ( .A0(n3606), .A1(n5718), .B0(DmP_EXP_EWSW[6]), .B1(n5848), 
        .Y(n5710) );
  AOI22X1TS U1331 ( .A0(intDY_EWSW[6]), .A1(n5720), .B0(DMP_EXP_EWSW[6]), .B1(
        n5713), .Y(n5711) );
  AOI22X1TS U1332 ( .A0(n4818), .A1(n5718), .B0(DmP_EXP_EWSW[14]), .B1(n5713), 
        .Y(n5712) );
  AOI22X1TS U1333 ( .A0(n4820), .A1(n5718), .B0(DmP_EXP_EWSW[5]), .B1(n5713), 
        .Y(n5714) );
  AOI22X1TS U1334 ( .A0(n3648), .A1(n5718), .B0(DMP_EXP_EWSW[29]), .B1(n5848), 
        .Y(n5715) );
  AOI22X1TS U1335 ( .A0(intDY_EWSW[28]), .A1(n5718), .B0(DMP_EXP_EWSW[28]), 
        .B1(n5848), .Y(n5716) );
  AOI22X1TS U1336 ( .A0(intDY_EWSW[19]), .A1(n5720), .B0(DMP_EXP_EWSW[19]), 
        .B1(n5734), .Y(n5717) );
  AOI22X1TS U1337 ( .A0(n4840), .A1(n5718), .B0(DmP_EXP_EWSW[0]), .B1(n5848), 
        .Y(n5719) );
  AOI22X1TS U1338 ( .A0(n4749), .A1(n5720), .B0(DmP_EXP_EWSW[12]), .B1(n5734), 
        .Y(n5721) );
  AOI22X1TS U1339 ( .A0(intDY_EWSW[16]), .A1(n5735), .B0(DMP_EXP_EWSW[16]), 
        .B1(n4903), .Y(n5722) );
  AOI22X1TS U1340 ( .A0(intDY_EWSW[17]), .A1(n5735), .B0(DMP_EXP_EWSW[17]), 
        .B1(n4903), .Y(n5723) );
  AOI22X1TS U1341 ( .A0(intDY_EWSW[5]), .A1(n5735), .B0(DMP_EXP_EWSW[5]), .B1(
        n5560), .Y(n5724) );
  AOI22X1TS U1342 ( .A0(intDY_EWSW[15]), .A1(n5735), .B0(DMP_EXP_EWSW[15]), 
        .B1(n4903), .Y(n5725) );
  AOI22X1TS U1343 ( .A0(intDY_EWSW[18]), .A1(n5735), .B0(DMP_EXP_EWSW[18]), 
        .B1(n4903), .Y(n5726) );
  AOI22X1TS U1344 ( .A0(intDY_EWSW[14]), .A1(n5735), .B0(DMP_EXP_EWSW[14]), 
        .B1(n4903), .Y(n5727) );
  AOI22X1TS U1345 ( .A0(n4823), .A1(n5735), .B0(DmP_EXP_EWSW[15]), .B1(n5731), 
        .Y(n5729) );
  AOI22X1TS U1346 ( .A0(n4835), .A1(n5735), .B0(DMP_EXP_EWSW[8]), .B1(n5731), 
        .Y(n5730) );
  AOI22X1TS U1347 ( .A0(n4831), .A1(n5735), .B0(DmP_EXP_EWSW[18]), .B1(n5731), 
        .Y(n5732) );
  AOI22X1TS U1348 ( .A0(intDY_EWSW[10]), .A1(n5735), .B0(DMP_EXP_EWSW[10]), 
        .B1(n5734), .Y(n5736) );
  INVX2TS U1349 ( .A(n5738), .Y(n5743) );
  AOI2BB2X1TS U1350 ( .B0(n5752), .B1(Data_array_SWR[2]), .A0N(n5751), .A1N(
        n4929), .Y(n5742) );
  AOI22X1TS U1351 ( .A0(n4919), .A1(n5740), .B0(n4921), .B1(n5739), .Y(n5741)
         );
  AOI2BB2X1TS U1352 ( .B0(n5752), .B1(Data_array_SWR[11]), .A0N(n5751), .A1N(
        n4930), .Y(n5747) );
  AOI22X1TS U1353 ( .A0(n4913), .A1(n5745), .B0(n4921), .B1(n5744), .Y(n5746)
         );
  INVX2TS U1354 ( .A(n5750), .Y(n5758) );
  AOI2BB2X1TS U1355 ( .B0(n5752), .B1(Data_array_SWR[15]), .A0N(n5751), .A1N(
        n4931), .Y(n5756) );
  AOI22X1TS U1356 ( .A0(n4918), .A1(n5754), .B0(n4920), .B1(n5753), .Y(n5755)
         );
  OAI222X1TS U1357 ( .A0(n5867), .A1(n5841), .B0(n5844), .B1(n1492), .C0(n5840), .C1(n2589), .Y(n1186) );
  MXI2X1TS U1358 ( .A(n2597), .B(n1499), .S0(n5760), .Y(n613) );
  AOI32X4TS U1359 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B0(n5759), .B1(n6005), .Y(n5854)
         );
  MXI2X1TS U1360 ( .A(n5760), .B(n4787), .S0(n5854), .Y(n932) );
  OAI22X1TS U1361 ( .A0(n5763), .A1(n5762), .B0(n4771), .B1(n5761), .Y(n5764)
         );
  OAI22X1TS U1362 ( .A0(n5771), .A1(n5770), .B0(n4934), .B1(n1480), .Y(n621)
         );
  AOI22X1TS U1363 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n5847), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B1(n6005), .Y(n5843) );
  INVX2TS U1364 ( .A(n5790), .Y(n5803) );
  CLKBUFX2TS U1365 ( .A(n5804), .Y(n5777) );
  INVX2TS U1366 ( .A(n5777), .Y(n5802) );
  OAI2BB2XLTS U1367 ( .B0(n5803), .B1(n1482), .A0N(n5802), .A1N(Data_X[1]), 
        .Y(n928) );
  OAI2BB2XLTS U1368 ( .B0(n5803), .B1(n1459), .A0N(n5802), .A1N(Data_Y[7]), 
        .Y(n889) );
  OAI2BB2XLTS U1369 ( .B0(n5803), .B1(n1432), .A0N(n5802), .A1N(Data_X[28]), 
        .Y(n901) );
  INVX2TS U1370 ( .A(n5790), .Y(n5780) );
  BUFX3TS U1371 ( .A(n5790), .Y(n5788) );
  INVX2TS U1372 ( .A(n5827), .Y(n5814) );
  OAI2BB2XLTS U1373 ( .B0(n5850), .B1(n1442), .A0N(n5814), .A1N(
        DMP_SHT1_EWSW[25]), .Y(n707) );
  OAI222X1TS U1374 ( .A0(n5928), .A1(n5841), .B0(n5844), .B1(n1445), .C0(n5840), .C1(n73), .Y(n628) );
  OAI222X1TS U1375 ( .A0(n5841), .A1(n5927), .B0(n4904), .B1(n1442), .C0(n5840), .C1(n1430), .Y(n794) );
  OAI222X1TS U1376 ( .A0(n5894), .A1(n5841), .B0(n5844), .B1(n1441), .C0(n5840), .C1(n1439), .Y(n630) );
  INVX2TS U1377 ( .A(n5777), .Y(n5781) );
  OAI2BB2XLTS U1378 ( .B0(n5803), .B1(n1483), .A0N(n5781), .A1N(Data_X[2]), 
        .Y(n927) );
  INVX2TS U1379 ( .A(n5790), .Y(n5794) );
  BUFX3TS U1380 ( .A(n5790), .Y(n5792) );
  INVX2TS U1381 ( .A(n5790), .Y(n5793) );
  BUFX3TS U1382 ( .A(n5790), .Y(n5778) );
  AOI22X1TS U1383 ( .A0(n4923), .A1(final_result_ieee[4]), .B0(n4947), .B1(
        n5775), .Y(n5998) );
  AOI22X1TS U1384 ( .A0(n5852), .A1(final_result_ieee[17]), .B0(n4911), .B1(
        n5775), .Y(n5999) );
  OAI2BB2XLTS U1385 ( .B0(n5803), .B1(n1458), .A0N(n5802), .A1N(Data_X[21]), 
        .Y(n908) );
  OAI2BB2XLTS U1386 ( .B0(n5803), .B1(n1461), .A0N(n5802), .A1N(Data_X[20]), 
        .Y(n909) );
  OAI2BB2XLTS U1387 ( .B0(n5803), .B1(n1464), .A0N(n5781), .A1N(Data_X[27]), 
        .Y(n902) );
  OAI2BB2XLTS U1388 ( .B0(n5803), .B1(n1487), .A0N(n5781), .A1N(Data_X[22]), 
        .Y(n907) );
  OAI2BB2XLTS U1389 ( .B0(n5803), .B1(n1438), .A0N(n5802), .A1N(Data_X[16]), 
        .Y(n913) );
  OAI2BB2XLTS U1390 ( .B0(n5793), .B1(n1488), .A0N(n5781), .A1N(Data_X[9]), 
        .Y(n920) );
  INVX2TS U1391 ( .A(n5777), .Y(n5779) );
  OAI2BB2XLTS U1392 ( .B0(n5793), .B1(n1437), .A0N(n5779), .A1N(Data_X[10]), 
        .Y(n919) );
  OAI2BB2XLTS U1393 ( .B0(n5793), .B1(n1491), .A0N(n5781), .A1N(Data_X[29]), 
        .Y(n900) );
  OAI2BB2XLTS U1394 ( .B0(n5793), .B1(n1434), .A0N(n5802), .A1N(Data_X[4]), 
        .Y(n925) );
  OAI2BB2XLTS U1395 ( .B0(n5793), .B1(n1430), .A0N(n5779), .A1N(Data_Y[25]), 
        .Y(n871) );
  OAI2BB2XLTS U1396 ( .B0(n5793), .B1(n73), .A0N(n5802), .A1N(Data_X[26]), .Y(
        n903) );
  OAI2BB2XLTS U1397 ( .B0(n5793), .B1(n2589), .A0N(n5779), .A1N(Data_Y[23]), 
        .Y(n873) );
  BUFX3TS U1398 ( .A(n5804), .Y(n5789) );
  INVX2TS U1399 ( .A(n5790), .Y(n5791) );
  INVX2TS U1400 ( .A(n5790), .Y(n5805) );
  OAI2BB2XLTS U1401 ( .B0(n5793), .B1(n4774), .A0N(n5802), .A1N(Data_Y[12]), 
        .Y(n884) );
  NOR2BX1TS U1402 ( .AN(OP_FLAG_SFG), .B(n5795), .Y(n5799) );
  NAND2X1TS U1403 ( .A(n5797), .B(n5796), .Y(n5798) );
  XNOR2X1TS U1404 ( .A(n5799), .B(n5798), .Y(n5800) );
  CMPR32X2TS U1405 ( .A(n4887), .B(n1441), .C(n5806), .CO(n5063), .S(n5801) );
  OAI2BB2XLTS U1406 ( .B0(n5803), .B1(n4780), .A0N(n5802), .A1N(Data_X[19]), 
        .Y(n910) );
  BUFX3TS U1407 ( .A(n5931), .Y(n5831) );
  BUFX3TS U1408 ( .A(n5826), .Y(n5816) );
  INVX2TS U1409 ( .A(n5836), .Y(n5815) );
  BUFX3TS U1410 ( .A(n5827), .Y(n5818) );
  INVX2TS U1411 ( .A(n4816), .Y(n5817) );
  INVX2TS U1412 ( .A(n5830), .Y(n5829) );
  INVX2TS U1413 ( .A(n5827), .Y(n5832) );
  BUFX3TS U1414 ( .A(n5826), .Y(n5834) );
  INVX2TS U1415 ( .A(n5827), .Y(n5835) );
  INVX2TS U1416 ( .A(n5837), .Y(n5838) );
  OAI222X1TS U1417 ( .A0(n5928), .A1(n5842), .B0(n5844), .B1(n1446), .C0(n5841), .C1(n73), .Y(n793) );
  OAI222X1TS U1418 ( .A0(n5840), .A1(n5927), .B0(n5844), .B1(n1447), .C0(n5841), .C1(n1430), .Y(n629) );
  OAI222X1TS U1419 ( .A0(n5867), .A1(n5842), .B0(n5932), .B1(n5844), .C0(n5841), .C1(n2589), .Y(n1157) );
  INVX2TS U1420 ( .A(n5854), .Y(n5851) );
  AOI22X1TS U1421 ( .A0(n5854), .A1(n5849), .B0(n4787), .B1(n5851), .Y(n933)
         );
  AOI21X1TS U1422 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .B0(n5845), .Y(
        inst_FSM_INPUT_ENABLE_state_next_1_) );
  AOI22X1TS U1423 ( .A0(n5854), .A1(n5848), .B0(n5850), .B1(n5851), .Y(n935)
         );
  AOI22X1TS U1424 ( .A0(n5854), .A1(n5850), .B0(n5849), .B1(n5851), .Y(n934)
         );
  AOI22X1TS U1425 ( .A0(n5854), .A1(n5821), .B0(n5853), .B1(n5851), .Y(n931)
         );
  AOI22X1TS U1426 ( .A0(n5854), .A1(n5812), .B0(n5852), .B1(n5851), .Y(n930)
         );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_3x1_b_W32 ( select, ch_0, ch_1, ch_2, data_out );
  input [1:0] select;
  input [31:0] ch_0;
  input [31:0] ch_1;
  input [31:0] ch_2;
  output [31:0] data_out;
  wire   n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221;

  BUFX3TS U2 ( .A(n181), .Y(n215) );
  BUFX3TS U3 ( .A(n177), .Y(n200) );
  NOR2BX4TS U4 ( .AN(select[1]), .B(select[0]), .Y(n181) );
  BUFX3TS U5 ( .A(n200), .Y(n190) );
  CLKBUFX2TS U6 ( .A(n200), .Y(n216) );
  BUFX3TS U7 ( .A(n181), .Y(n218) );
  BUFX3TS U8 ( .A(n216), .Y(n220) );
  BUFX3TS U9 ( .A(n178), .Y(n203) );
  INVX2TS U10 ( .A(n205), .Y(data_out[22]) );
  INVX2TS U11 ( .A(n206), .Y(data_out[31]) );
  NOR2X2TS U12 ( .A(select[1]), .B(select[0]), .Y(n178) );
  AOI222X1TS U13 ( .A0(n220), .A1(ch_1[22]), .B0(n178), .B1(ch_0[22]), .C0(
        n218), .C1(ch_2[22]), .Y(n205) );
  AOI222X1TS U14 ( .A0(n220), .A1(ch_1[31]), .B0(n178), .B1(ch_0[31]), .C0(
        n218), .C1(ch_2[31]), .Y(n206) );
  AOI222X1TS U15 ( .A0(n190), .A1(ch_1[23]), .B0(n189), .B1(ch_0[23]), .C0(
        n181), .C1(ch_2[23]), .Y(n179) );
  AOI222X1TS U16 ( .A0(n190), .A1(ch_1[6]), .B0(n189), .B1(ch_0[6]), .C0(n181), 
        .C1(ch_2[6]), .Y(n180) );
  AOI222X1TS U17 ( .A0(n190), .A1(ch_1[27]), .B0(n189), .B1(ch_0[27]), .C0(
        n181), .C1(ch_2[27]), .Y(n183) );
  AOI222X1TS U18 ( .A0(n190), .A1(ch_1[8]), .B0(n189), .B1(ch_0[8]), .C0(n215), 
        .C1(ch_2[8]), .Y(n184) );
  AOI222X1TS U19 ( .A0(n190), .A1(ch_1[11]), .B0(n189), .B1(ch_0[11]), .C0(
        n215), .C1(ch_2[11]), .Y(n185) );
  AOI222X1TS U20 ( .A0(n220), .A1(ch_1[26]), .B0(n219), .B1(ch_0[26]), .C0(
        n218), .C1(ch_2[26]), .Y(n207) );
  AOI222X1TS U21 ( .A0(n220), .A1(ch_1[29]), .B0(n219), .B1(ch_0[29]), .C0(
        n218), .C1(ch_2[29]), .Y(n208) );
  AOI222X1TS U22 ( .A0(n220), .A1(ch_1[5]), .B0(n219), .B1(ch_0[5]), .C0(n218), 
        .C1(ch_2[5]), .Y(n209) );
  AOI222X1TS U23 ( .A0(n220), .A1(ch_1[10]), .B0(n219), .B1(ch_0[10]), .C0(
        n218), .C1(ch_2[10]), .Y(n211) );
  AOI222X1TS U24 ( .A0(n220), .A1(ch_1[24]), .B0(n219), .B1(ch_0[24]), .C0(
        n218), .C1(ch_2[24]), .Y(n212) );
  AOI222X1TS U25 ( .A0(n190), .A1(ch_1[12]), .B0(n189), .B1(ch_0[12]), .C0(
        n215), .C1(ch_2[12]), .Y(n186) );
  AOI222X1TS U26 ( .A0(n190), .A1(ch_1[9]), .B0(n189), .B1(ch_0[9]), .C0(n215), 
        .C1(ch_2[9]), .Y(n188) );
  AOI222X1TS U27 ( .A0(n190), .A1(ch_1[20]), .B0(n189), .B1(ch_0[20]), .C0(
        n215), .C1(ch_2[20]), .Y(n191) );
  AOI222X1TS U28 ( .A0(n200), .A1(ch_1[14]), .B0(n203), .B1(ch_0[14]), .C0(
        n202), .C1(ch_2[14]), .Y(n193) );
  BUFX3TS U29 ( .A(n215), .Y(n202) );
  AOI222X1TS U30 ( .A0(n200), .A1(ch_1[15]), .B0(n203), .B1(ch_0[15]), .C0(
        n202), .C1(ch_2[15]), .Y(n195) );
  AOI222X1TS U31 ( .A0(n200), .A1(ch_1[28]), .B0(n203), .B1(ch_0[28]), .C0(
        n202), .C1(ch_2[28]), .Y(n196) );
  AOI222X1TS U32 ( .A0(n200), .A1(ch_1[18]), .B0(n203), .B1(ch_0[18]), .C0(
        n202), .C1(ch_2[18]), .Y(n197) );
  AOI222X1TS U33 ( .A0(n200), .A1(ch_1[19]), .B0(n203), .B1(ch_0[19]), .C0(
        n202), .C1(ch_2[19]), .Y(n198) );
  AOI222X1TS U34 ( .A0(n216), .A1(ch_1[25]), .B0(n203), .B1(ch_0[25]), .C0(
        n202), .C1(ch_2[25]), .Y(n199) );
  AOI222X1TS U35 ( .A0(n200), .A1(ch_1[21]), .B0(n203), .B1(ch_0[21]), .C0(
        n202), .C1(ch_2[21]), .Y(n201) );
  AOI222X1TS U36 ( .A0(n216), .A1(ch_1[3]), .B0(n203), .B1(ch_0[3]), .C0(n202), 
        .C1(ch_2[3]), .Y(n204) );
  AOI222X1TS U37 ( .A0(n220), .A1(ch_1[16]), .B0(n219), .B1(ch_0[16]), .C0(
        n218), .C1(ch_2[16]), .Y(n214) );
  AOI222X1TS U38 ( .A0(n216), .A1(ch_1[30]), .B0(n219), .B1(ch_0[30]), .C0(
        n215), .C1(ch_2[30]), .Y(n217) );
  AOI222X1TS U39 ( .A0(n220), .A1(ch_1[7]), .B0(n219), .B1(ch_0[7]), .C0(n218), 
        .C1(ch_2[7]), .Y(n221) );
  AOI222X1TS U40 ( .A0(n190), .A1(ch_1[17]), .B0(n189), .B1(ch_0[17]), .C0(
        n215), .C1(ch_2[17]), .Y(n187) );
  AOI222X1TS U41 ( .A0(n200), .A1(ch_1[13]), .B0(n203), .B1(ch_0[13]), .C0(
        n202), .C1(ch_2[13]), .Y(n192) );
  AOI222X1TS U42 ( .A0(n190), .A1(ch_1[2]), .B0(n189), .B1(ch_0[2]), .C0(n181), 
        .C1(ch_2[2]), .Y(n182) );
  BUFX3TS U43 ( .A(n178), .Y(n189) );
  AOI222X1TS U44 ( .A0(n220), .A1(ch_1[1]), .B0(n219), .B1(ch_0[1]), .C0(n218), 
        .C1(ch_2[1]), .Y(n213) );
  AOI222X1TS U45 ( .A0(n216), .A1(ch_1[0]), .B0(n219), .B1(ch_0[0]), .C0(n215), 
        .C1(ch_2[0]), .Y(n210) );
  BUFX3TS U46 ( .A(n178), .Y(n219) );
  AOI222X1TS U47 ( .A0(n200), .A1(ch_1[4]), .B0(n203), .B1(ch_0[4]), .C0(n202), 
        .C1(ch_2[4]), .Y(n194) );
  NOR2BX1TS U48 ( .AN(select[0]), .B(select[1]), .Y(n177) );
  INVX2TS U49 ( .A(n179), .Y(data_out[23]) );
  INVX2TS U50 ( .A(n180), .Y(data_out[6]) );
  INVX2TS U51 ( .A(n182), .Y(data_out[2]) );
  INVX2TS U52 ( .A(n183), .Y(data_out[27]) );
  INVX2TS U53 ( .A(n184), .Y(data_out[8]) );
  INVX2TS U54 ( .A(n185), .Y(data_out[11]) );
  INVX2TS U55 ( .A(n186), .Y(data_out[12]) );
  INVX2TS U56 ( .A(n187), .Y(data_out[17]) );
  INVX2TS U57 ( .A(n188), .Y(data_out[9]) );
  INVX2TS U58 ( .A(n191), .Y(data_out[20]) );
  INVX2TS U59 ( .A(n192), .Y(data_out[13]) );
  INVX2TS U60 ( .A(n193), .Y(data_out[14]) );
  INVX2TS U61 ( .A(n194), .Y(data_out[4]) );
  INVX2TS U62 ( .A(n195), .Y(data_out[15]) );
  INVX2TS U63 ( .A(n196), .Y(data_out[28]) );
  INVX2TS U64 ( .A(n197), .Y(data_out[18]) );
  INVX2TS U65 ( .A(n198), .Y(data_out[19]) );
  INVX2TS U66 ( .A(n199), .Y(data_out[25]) );
  INVX2TS U67 ( .A(n201), .Y(data_out[21]) );
  INVX2TS U68 ( .A(n204), .Y(data_out[3]) );
  INVX2TS U69 ( .A(n207), .Y(data_out[26]) );
  INVX2TS U70 ( .A(n208), .Y(data_out[29]) );
  INVX2TS U71 ( .A(n209), .Y(data_out[5]) );
  INVX2TS U72 ( .A(n210), .Y(data_out[0]) );
  INVX2TS U73 ( .A(n211), .Y(data_out[10]) );
  INVX2TS U74 ( .A(n212), .Y(data_out[24]) );
  INVX2TS U75 ( .A(n213), .Y(data_out[1]) );
  INVX2TS U76 ( .A(n214), .Y(data_out[16]) );
  INVX2TS U77 ( .A(n217), .Y(data_out[30]) );
  INVX2TS U78 ( .A(n221), .Y(data_out[7]) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W32_0 ( clk, rst, enable, D, Q, OUT3, OUT4, OUT5 );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, enable;
  output OUT3, OUT4, OUT5;
  wire   n2, OUT5;
  assign Q[22] = D[22];
  assign Q[21] = D[21];
  assign Q[20] = D[20];
  assign Q[19] = D[19];
  assign Q[18] = D[18];
  assign Q[17] = D[17];
  assign Q[16] = D[16];
  assign Q[15] = D[15];
  assign Q[14] = D[14];
  assign Q[13] = D[13];
  assign Q[12] = D[12];
  assign Q[11] = D[11];
  assign Q[10] = D[10];
  assign Q[9] = D[9];
  assign Q[8] = D[8];
  assign Q[7] = D[7];
  assign Q[6] = D[6];
  assign Q[5] = D[5];
  assign Q[4] = D[4];
  assign Q[3] = D[3];
  assign Q[2] = D[2];
  assign Q[1] = D[1];
  assign Q[0] = D[0];
  assign OUT3 = OUT5;
  assign OUT4 = OUT5;

  DFFRXLTS Q_reg_31_ ( .D(D[31]), .CK(clk), .RN(n2), .Q(Q[31]) );
  DFFRXLTS Q_reg_29_ ( .D(D[29]), .CK(clk), .RN(n2), .Q(Q[29]) );
  DFFRXLTS Q_reg_27_ ( .D(D[27]), .CK(clk), .RN(OUT5), .Q(Q[27]) );
  DFFRXLTS Q_reg_25_ ( .D(D[25]), .CK(clk), .RN(n2), .Q(Q[25]) );
  INVX2TS U9 ( .A(rst), .Y(OUT5) );
  INVX2TS U33 ( .A(rst), .Y(n2) );
  DFFRX1TS Q_reg_30_ ( .D(D[30]), .CK(clk), .RN(n2), .Q(Q[30]) );
  DFFRX1TS Q_reg_28_ ( .D(D[28]), .CK(clk), .RN(n2), .Q(Q[28]) );
  DFFRX1TS Q_reg_23_ ( .D(D[23]), .CK(clk), .RN(n2), .Q(Q[23]) );
  DFFRX1TS Q_reg_26_ ( .D(D[26]), .CK(clk), .RN(n2), .Q(Q[26]) );
  DFFRX1TS Q_reg_24_ ( .D(D[24]), .CK(clk), .RN(n2), .Q(Q[24]) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W32_0 ( select, ch_0, ch_1, data_out );
  input [31:0] ch_0;
  input [31:0] ch_1;
  output [31:0] data_out;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7;

  AO22XLTS U1 ( .A0(n3), .A1(ch_1[4]), .B0(n4), .B1(ch_0[4]), .Y(data_out[4])
         );
  AO22XLTS U2 ( .A0(n1), .A1(ch_1[16]), .B0(n5), .B1(ch_0[16]), .Y(
        data_out[16]) );
  AO22XLTS U3 ( .A0(n3), .A1(ch_1[1]), .B0(n4), .B1(ch_0[1]), .Y(data_out[1])
         );
  AO22XLTS U4 ( .A0(n2), .A1(ch_1[2]), .B0(n4), .B1(ch_0[2]), .Y(data_out[2])
         );
  AO22XLTS U5 ( .A0(n2), .A1(ch_1[9]), .B0(n4), .B1(ch_0[9]), .Y(data_out[9])
         );
  AO22XLTS U6 ( .A0(n3), .A1(ch_1[11]), .B0(n5), .B1(ch_0[11]), .Y(
        data_out[11]) );
  AO22XLTS U7 ( .A0(n3), .A1(ch_1[17]), .B0(n5), .B1(ch_0[17]), .Y(
        data_out[17]) );
  AO22XLTS U8 ( .A0(n1), .A1(ch_1[3]), .B0(n4), .B1(ch_0[3]), .Y(data_out[3])
         );
  AO22XLTS U9 ( .A0(n2), .A1(ch_1[22]), .B0(n6), .B1(ch_0[22]), .Y(
        data_out[22]) );
  AO22XLTS U10 ( .A0(n2), .A1(ch_1[8]), .B0(n4), .B1(ch_0[8]), .Y(data_out[8])
         );
  AO22XLTS U11 ( .A0(n1), .A1(ch_1[14]), .B0(n5), .B1(ch_0[14]), .Y(
        data_out[14]) );
  AO22XLTS U12 ( .A0(n3), .A1(ch_1[18]), .B0(n5), .B1(ch_0[18]), .Y(
        data_out[18]) );
  AO22XLTS U13 ( .A0(n2), .A1(ch_1[15]), .B0(n5), .B1(ch_0[15]), .Y(
        data_out[15]) );
  AO22XLTS U14 ( .A0(n2), .A1(ch_1[6]), .B0(n4), .B1(ch_0[6]), .Y(data_out[6])
         );
  AO22XLTS U15 ( .A0(n1), .A1(ch_1[0]), .B0(n4), .B1(ch_0[0]), .Y(data_out[0])
         );
  AO22XLTS U16 ( .A0(n3), .A1(ch_1[5]), .B0(n4), .B1(ch_0[5]), .Y(data_out[5])
         );
  AO22XLTS U17 ( .A0(n2), .A1(ch_1[13]), .B0(n5), .B1(ch_0[13]), .Y(
        data_out[13]) );
  AO22XLTS U18 ( .A0(n1), .A1(ch_1[12]), .B0(n5), .B1(ch_0[12]), .Y(
        data_out[12]) );
  AO22XLTS U19 ( .A0(n1), .A1(ch_1[31]), .B0(n7), .B1(ch_0[31]), .Y(
        data_out[31]) );
  AO22XLTS U20 ( .A0(select), .A1(ch_1[7]), .B0(n4), .B1(ch_0[7]), .Y(
        data_out[7]) );
  AO22XLTS U21 ( .A0(n2), .A1(ch_1[26]), .B0(n6), .B1(ch_0[26]), .Y(
        data_out[26]) );
  AO22XLTS U22 ( .A0(n1), .A1(ch_1[10]), .B0(n5), .B1(ch_0[10]), .Y(
        data_out[10]) );
  AO22XLTS U23 ( .A0(n2), .A1(ch_1[19]), .B0(n5), .B1(ch_0[19]), .Y(
        data_out[19]) );
  AO22XLTS U24 ( .A0(n1), .A1(ch_1[20]), .B0(n6), .B1(ch_0[20]), .Y(
        data_out[20]) );
  AO22XLTS U25 ( .A0(n1), .A1(ch_1[27]), .B0(n6), .B1(ch_0[27]), .Y(
        data_out[27]) );
  AO22XLTS U26 ( .A0(n3), .A1(ch_1[21]), .B0(n6), .B1(ch_0[21]), .Y(
        data_out[21]) );
  AO22XLTS U27 ( .A0(n1), .A1(ch_1[24]), .B0(n6), .B1(ch_0[24]), .Y(
        data_out[24]) );
  AO22XLTS U28 ( .A0(n3), .A1(ch_1[30]), .B0(n7), .B1(ch_0[30]), .Y(
        data_out[30]) );
  AO22XLTS U29 ( .A0(n3), .A1(ch_1[25]), .B0(n6), .B1(ch_0[25]), .Y(
        data_out[25]) );
  AO22XLTS U30 ( .A0(select), .A1(ch_1[23]), .B0(n6), .B1(ch_0[23]), .Y(
        data_out[23]) );
  AO22XLTS U31 ( .A0(n3), .A1(ch_1[28]), .B0(n6), .B1(ch_0[28]), .Y(
        data_out[28]) );
  AO22XLTS U32 ( .A0(n2), .A1(ch_1[29]), .B0(n6), .B1(ch_0[29]), .Y(
        data_out[29]) );
  BUFX3TS U33 ( .A(select), .Y(n1) );
  BUFX3TS U34 ( .A(select), .Y(n2) );
  BUFX3TS U35 ( .A(select), .Y(n3) );
  INVX2TS U36 ( .A(select), .Y(n7) );
  BUFX3TS U37 ( .A(n7), .Y(n4) );
  BUFX3TS U38 ( .A(n7), .Y(n5) );
  BUFX3TS U39 ( .A(n7), .Y(n6) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_0 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX2TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_1 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX1TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_2 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX1TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule


module FPU_Interface2_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, begin_operation, 
        ack_operation, operation, region_flag, Data_1, Data_2, r_mode, 
        overflow_flag, underflow_flag, NaN_flag, operation_ready, op_result, 
        busy );
  input [2:0] operation;
  input [1:0] region_flag;
  input [31:0] Data_1;
  input [31:0] Data_2;
  input [1:0] r_mode;
  output [31:0] op_result;
  input clk, rst, begin_operation, ack_operation;
  output overflow_flag, underflow_flag, NaN_flag, operation_ready, busy;
  wire   NaN_reg, beg_fsm_addsubt, beg_fsm_cordic, beg_fsm_mult,
         ack_fsm_cordic, ack_fsm_mult, op_mod_add_subt, op_mod_cordic,
         beg_add_subt_cordic, beg_add_subt, op_addsubt_cordic, op_addsubt,
         ready_cordic, ready_add_subt, enab_cont_iter, overflow_flag_mult,
         underflow_flag_mult, ready_mult, n_4_net_, overflow_flag_addsubt,
         underflow_flag_addsubt, n34, n35, n36, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [1:0] operation_reg;
  wire   [31:0] dataA;
  wire   [31:0] dataB;
  wire   [31:0] add_subt_dataA;
  wire   [31:0] add_subt_data1;
  wire   [31:0] add_subt_dataB;
  wire   [31:0] add_subt_data2;
  wire   [31:0] cordic_result;
  wire   [31:0] result_add_subt;
  wire   [31:0] mult_result;

  d_ff_en_W2 operation_dff ( .clk(clk), .rst(rst), .enable(1'b1), .D({n36, n42}), .Q(operation_reg) );
  d_ff_en_W32_1 reg_dataA ( .clk(clk), .rst(rst), .enable(1'b1), .D(Data_1), 
        .Q(dataA), .OUT4(n72) );
  d_ff_en_W32_0 reg_dataB ( .clk(clk), .rst(rst), .enable(1'b1), .D(Data_2), 
        .Q(dataB), .OUT3(n77), .OUT4(n75), .OUT5(n73) );
  d_ff_en_W1 NaN_dff ( .clk(clk), .rst(rst), .enable(1'b1), .D(NaN_reg), .Q(
        NaN_flag) );
  demux_1x3_1 demux_beg_op ( .data(begin_operation), .select({n36, n42}), 
        .ch1(beg_fsm_addsubt), .ch2(beg_fsm_cordic), .ch3(beg_fsm_mult) );
  demux_1x3_0 demux_ack_op ( .data(ack_operation), .select({n36, n39}), .ch2(
        ack_fsm_cordic), .ch3(ack_fsm_mult) );
  deco_op deco_operation ( .operation({n42, operation[0]}), .op_mod_add_subt(
        op_mod_add_subt), .op_mod_cordic(op_mod_cordic) );
  Mux_2x1_W1_3 mux_beg_addsubt ( .select(n42), .ch_0(beg_fsm_addsubt), .ch_1(
        beg_add_subt_cordic), .data_out(beg_add_subt) );
  Mux_2x1_W1_2 mux_operation_add_cordic ( .select(n39), .ch_0(op_mod_add_subt), 
        .ch_1(op_addsubt_cordic), .data_out(op_addsubt) );
  Mux_2x1_W32_1 mux_data_in1 ( .select(n38), .ch_0(Data_1), .ch_1(
        add_subt_dataA), .data_out(add_subt_data1) );
  Mux_2x1_W32_0 mux_data_in2 ( .select(n39), .ch_0(Data_2), .ch_1(
        add_subt_dataB), .data_out(add_subt_data2) );
  CORDIC_Arch3v1 FPSENCOS ( .clk(clk), .rst(rst), .beg_fsm_cordic(
        beg_fsm_cordic), .ack_cordic(ack_fsm_cordic), .operation(op_mod_cordic), .data_in(Data_1), .shift_region_flag(region_flag), .ready_cordic(
        ready_cordic), .data_output(cordic_result), .beg_add_subt(
        beg_add_subt_cordic), .add_subt_dataA(add_subt_dataA), 
        .add_subt_dataB(add_subt_dataB), .result_add_subt(result_add_subt), 
        .op_add_subt(op_addsubt_cordic), .ready_add_subt(ready_add_subt), 
        .enab_cont_iter(enab_cont_iter) );
  FPU_Multiplication_Function FPMULT ( .clk(clk), .rst(rst), .beg_FSM(
        beg_fsm_mult), .ack_FSM(ack_fsm_mult), .Data_MX(Data_1), .Data_MY(
        Data_2), .round_mode(r_mode), .overflow_flag(overflow_flag_mult), 
        .underflow_flag(underflow_flag_mult), .ready(ready_mult), 
        .final_result_ieee(mult_result) );
  FPU_PIPELINED_FPADDSUB_W32_EW8_SW23_SWR26_EWR5 FPADDSUB ( .clk(clk), .rst(
        n_4_net_), .beg_OP(beg_add_subt), .Data_X(add_subt_data1), .Data_Y(
        add_subt_data2), .add_subt(op_addsubt), .busy(busy), .overflow_flag(
        overflow_flag_addsubt), .underflow_flag(underflow_flag_addsubt), 
        .ready(ready_add_subt), .final_result_ieee(result_add_subt) );
  Mux_2x1_W1_1 overflow_flag_mux ( .select(n36), .ch_0(overflow_flag_addsubt), 
        .ch_1(overflow_flag_mult), .data_out(overflow_flag) );
  Mux_2x1_W1_0 underflow_flag_mux ( .select(n36), .ch_0(underflow_flag_addsubt), .ch_1(underflow_flag_mult), .data_out(underflow_flag) );
  Mux_3x1_b mux_ready_op ( .select(operation[2:1]), .ch_0(ready_add_subt), 
        .ch_1(ready_cordic), .ch_2(ready_mult), .data_out(operation_ready) );
  Mux_3x1_b_W32 mux_result_op ( .select({n35, n41}), .ch_0(result_add_subt), 
        .ch_1(cordic_result), .ch_2(mult_result), .data_out(op_result) );
  OR2X1TS U35 ( .A(enab_cont_iter), .B(rst), .Y(n_4_net_) );
  DFFRXLTS R_20 ( .D(n70), .CK(clk), .RN(n72), .Q(n78) );
  DFFSX1TS R_12 ( .D(n74), .CK(clk), .SN(n73), .Q(n81) );
  DFFSX1TS R_11 ( .D(n76), .CK(clk), .SN(n75), .Q(n80) );
  DFFSX1TS R_19 ( .D(n71), .CK(clk), .SN(n77), .Q(n79) );
  INVX2TS U37 ( .A(n40), .Y(n42) );
  NAND3X1TS U38 ( .A(n45), .B(n44), .C(n43), .Y(n46) );
  INVX6TS U39 ( .A(operation[1]), .Y(n40) );
  NAND3X1TS U40 ( .A(n53), .B(n52), .C(n51), .Y(n70) );
  NAND3XLTS U41 ( .A(dataB[28]), .B(dataB[23]), .C(dataB[25]), .Y(n64) );
  AOI31XLTS U42 ( .A0(n62), .A1(n61), .A2(n60), .B0(n67), .Y(n65) );
  NOR3XLTS U43 ( .A(dataA[2]), .B(dataA[5]), .C(dataA[4]), .Y(n49) );
  NAND4XLTS U44 ( .A(dataA[30]), .B(dataA[27]), .C(dataA[28]), .D(dataA[26]), 
        .Y(n55) );
  NAND4XLTS U45 ( .A(dataA[29]), .B(dataA[23]), .C(dataA[25]), .D(dataA[24]), 
        .Y(n54) );
  NAND4XLTS U46 ( .A(n81), .B(n80), .C(n79), .D(n66), .Y(n68) );
  INVX2TS U47 ( .A(n40), .Y(n38) );
  INVX2TS U48 ( .A(operation[2]), .Y(n34) );
  INVX2TS U49 ( .A(n34), .Y(n35) );
  INVX2TS U50 ( .A(n34), .Y(n36) );
  INVX2TS U51 ( .A(n40), .Y(n39) );
  INVX2TS U52 ( .A(n40), .Y(n41) );
  NOR4X1TS U53 ( .A(dataB[17]), .B(dataB[16]), .C(dataB[8]), .D(n46), .Y(n71)
         );
  NOR4X1TS U54 ( .A(dataA[13]), .B(dataA[15]), .C(dataA[17]), .D(dataA[18]), 
        .Y(n47) );
  NOR4X1TS U55 ( .A(dataA[21]), .B(dataA[19]), .C(dataA[14]), .D(dataA[20]), 
        .Y(n48) );
  NOR4X1TS U56 ( .A(dataB[4]), .B(dataB[18]), .C(dataB[20]), .D(dataB[1]), .Y(
        n44) );
  NOR4X1TS U57 ( .A(dataA[8]), .B(dataA[7]), .C(dataA[6]), .D(dataA[0]), .Y(
        n52) );
  NOR4X1TS U58 ( .A(dataB[3]), .B(dataB[5]), .C(dataB[22]), .D(dataB[0]), .Y(
        n43) );
  AOI31XLTS U59 ( .A0(n58), .A1(n57), .A2(n56), .B0(dataB[27]), .Y(n69) );
  NOR4X1TS U60 ( .A(dataB[2]), .B(dataB[10]), .C(dataB[12]), .D(dataB[14]), 
        .Y(n76) );
  NOR4X1TS U61 ( .A(dataB[7]), .B(dataB[9]), .C(dataB[11]), .D(dataB[6]), .Y(
        n74) );
  NOR4X1TS U62 ( .A(dataA[3]), .B(dataA[16]), .C(dataA[1]), .D(dataA[22]), .Y(
        n50) );
  NOR4X1TS U63 ( .A(dataB[15]), .B(dataB[19]), .C(dataB[13]), .D(dataB[21]), 
        .Y(n45) );
  NOR4X1TS U64 ( .A(dataA[12]), .B(dataA[11]), .C(dataA[10]), .D(dataA[9]), 
        .Y(n53) );
  NOR3XLTS U65 ( .A(dataB[25]), .B(dataB[31]), .C(n59), .Y(n56) );
  AND4X1TS U67 ( .A(n50), .B(n49), .C(n48), .D(n47), .Y(n51) );
  NOR4BX1TS U68 ( .AN(operation_reg[1]), .B(dataB[28]), .C(operation_reg[0]), 
        .D(dataB[23]), .Y(n58) );
  NOR4X1TS U69 ( .A(dataB[30]), .B(dataB[24]), .C(dataB[26]), .D(dataB[29]), 
        .Y(n57) );
  OR3X1TS U70 ( .A(n78), .B(n55), .C(n54), .Y(n59) );
  NOR4X1TS U71 ( .A(dataA[30]), .B(dataA[27]), .C(dataA[28]), .D(dataA[26]), 
        .Y(n62) );
  NOR4X1TS U72 ( .A(dataA[29]), .B(dataA[23]), .C(dataA[25]), .D(dataA[24]), 
        .Y(n61) );
  NOR4BX1TS U73 ( .AN(operation_reg[1]), .B(dataA[31]), .C(operation_reg[0]), 
        .D(n78), .Y(n60) );
  NOR2X1TS U74 ( .A(operation_reg[1]), .B(n59), .Y(n67) );
  NAND4XLTS U75 ( .A(dataB[30]), .B(dataB[24]), .C(dataB[26]), .D(dataB[29]), 
        .Y(n63) );
  OAI31X1TS U76 ( .A0(n65), .A1(n64), .A2(n63), .B0(dataB[27]), .Y(n66) );
  OAI2BB2XLTS U77 ( .B0(n69), .B1(n68), .A0N(n67), .A1N(operation_reg[0]), .Y(
        NaN_reg) );
initial $sdf_annotate("FPU_Interface2_RKOA_2STAGE_syn.sdf"); 
 endmodule

