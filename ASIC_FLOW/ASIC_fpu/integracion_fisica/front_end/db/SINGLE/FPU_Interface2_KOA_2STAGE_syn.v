/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Nov  1 20:38:24 2016
/////////////////////////////////////////////////////////////


module d_ff_en_W2 ( clk, rst, enable, D, Q );
  input [1:0] D;
  output [1:0] Q;
  input clk, rst, enable;
  wire   n1;

  DFFRX1TS Q_reg_0_ ( .D(D[0]), .CK(clk), .RN(n1), .Q(Q[0]) );
  DFFRX1TS Q_reg_1_ ( .D(D[1]), .CK(clk), .RN(n1), .Q(Q[1]) );
  INVX2TS U2 ( .A(rst), .Y(n1) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W32_1 ( clk, rst, enable, D, Q, OUT4 );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, enable;
  output OUT4;
  wire   n32;
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

  DFFRXLTS Q_reg_31_ ( .D(D[31]), .CK(clk), .RN(n32), .Q(Q[31]) );
  INVX2TS U5 ( .A(rst), .Y(OUT4) );
  INVX2TS U32 ( .A(rst), .Y(n32) );
  DFFRX1TS Q_reg_29_ ( .D(D[29]), .CK(clk), .RN(n32), .Q(Q[29]) );
  DFFRX1TS Q_reg_30_ ( .D(D[30]), .CK(clk), .RN(n32), .Q(Q[30]) );
  DFFRX1TS Q_reg_27_ ( .D(D[27]), .CK(clk), .RN(n32), .Q(Q[27]) );
  DFFRX1TS Q_reg_23_ ( .D(D[23]), .CK(clk), .RN(OUT4), .Q(Q[23]) );
  DFFRX1TS Q_reg_28_ ( .D(D[28]), .CK(clk), .RN(n32), .Q(Q[28]) );
  DFFRX1TS Q_reg_25_ ( .D(D[25]), .CK(clk), .RN(n32), .Q(Q[25]) );
  DFFRX1TS Q_reg_26_ ( .D(D[26]), .CK(clk), .RN(n32), .Q(Q[26]) );
  DFFRXLTS Q_reg_24_ ( .D(D[24]), .CK(clk), .RN(n32), .Q(Q[24]) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W1 ( clk, rst, enable, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, enable;
  wire   n1;

  INVX2TS U2 ( .A(rst), .Y(n1) );
  DFFRXLTS Q_reg_0_ ( .D(D[0]), .CK(clk), .RN(n1), .Q(Q[0]) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
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
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule


module demux_1x3_0 ( data, select, ch1, ch2, ch3 );
  input [1:0] select;
  input data;
  output ch1, ch2, ch3;
  wire   n1;

  INVX1TS U2 ( .A(select[0]), .Y(n1) );
  NOR2BX1TS U3 ( .AN(data), .B(n1), .Y(ch2) );
  AND3X1TS U4 ( .A(n1), .B(data), .C(select[1]), .Y(ch3) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule


module deco_op ( operation, op_mod_add_subt, op_mod_cordic );
  input [1:0] operation;
  output op_mod_add_subt, op_mod_cordic;


  NOR2BX1TS U3 ( .AN(operation[0]), .B(operation[1]), .Y(op_mod_add_subt) );
  CLKAND2X2TS U4 ( .A(operation[0]), .B(operation[1]), .Y(op_mod_cordic) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
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
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W32_1 ( select, ch_0, ch_1, data_out );
  input [31:0] ch_0;
  input [31:0] ch_1;
  output [31:0] data_out;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7;

  INVX2TS U1 ( .A(n1), .Y(n6) );
  CLKBUFX2TS U2 ( .A(select), .Y(n1) );
  AO22XLTS U3 ( .A0(n3), .A1(ch_1[15]), .B0(n5), .B1(ch_0[15]), .Y(
        data_out[15]) );
  AO22XLTS U4 ( .A0(n2), .A1(ch_1[17]), .B0(n5), .B1(ch_0[17]), .Y(
        data_out[17]) );
  AO22XLTS U5 ( .A0(n3), .A1(ch_1[14]), .B0(n5), .B1(ch_0[14]), .Y(
        data_out[14]) );
  AO22XLTS U6 ( .A0(select), .A1(ch_1[18]), .B0(n5), .B1(ch_0[18]), .Y(
        data_out[18]) );
  AO22XLTS U7 ( .A0(select), .A1(ch_1[11]), .B0(n5), .B1(ch_0[11]), .Y(
        data_out[11]) );
  AO22XLTS U8 ( .A0(n3), .A1(ch_1[16]), .B0(n5), .B1(ch_0[16]), .Y(
        data_out[16]) );
  AO22XLTS U9 ( .A0(select), .A1(ch_1[10]), .B0(n5), .B1(ch_0[10]), .Y(
        data_out[10]) );
  AO22XLTS U10 ( .A0(n2), .A1(ch_1[13]), .B0(n5), .B1(ch_0[13]), .Y(
        data_out[13]) );
  AO22XLTS U11 ( .A0(n3), .A1(ch_1[12]), .B0(n5), .B1(ch_0[12]), .Y(
        data_out[12]) );
  AO22XLTS U12 ( .A0(n2), .A1(ch_1[19]), .B0(n5), .B1(ch_0[19]), .Y(
        data_out[19]) );
  AO22XLTS U13 ( .A0(n3), .A1(ch_1[31]), .B0(n7), .B1(ch_0[31]), .Y(
        data_out[31]) );
  AO22XLTS U14 ( .A0(n1), .A1(ch_1[24]), .B0(n6), .B1(ch_0[24]), .Y(
        data_out[24]) );
  AO22XLTS U15 ( .A0(n3), .A1(ch_1[22]), .B0(n6), .B1(ch_0[22]), .Y(
        data_out[22]) );
  AO22XLTS U16 ( .A0(n2), .A1(ch_1[6]), .B0(n4), .B1(ch_0[6]), .Y(data_out[6])
         );
  AO22XLTS U17 ( .A0(n1), .A1(ch_1[0]), .B0(n4), .B1(ch_0[0]), .Y(data_out[0])
         );
  AO22XLTS U18 ( .A0(n1), .A1(ch_1[1]), .B0(n4), .B1(ch_0[1]), .Y(data_out[1])
         );
  AO22XLTS U19 ( .A0(n1), .A1(ch_1[2]), .B0(n4), .B1(ch_0[2]), .Y(data_out[2])
         );
  AO22XLTS U20 ( .A0(n1), .A1(ch_1[3]), .B0(n4), .B1(ch_0[3]), .Y(data_out[3])
         );
  AO22XLTS U21 ( .A0(n2), .A1(ch_1[5]), .B0(n4), .B1(ch_0[5]), .Y(data_out[5])
         );
  AO22XLTS U22 ( .A0(n2), .A1(ch_1[4]), .B0(n4), .B1(ch_0[4]), .Y(data_out[4])
         );
  AO22XLTS U23 ( .A0(n3), .A1(ch_1[9]), .B0(n4), .B1(ch_0[9]), .Y(data_out[9])
         );
  AO22XLTS U24 ( .A0(n2), .A1(ch_1[28]), .B0(n7), .B1(ch_0[28]), .Y(
        data_out[28]) );
  AO22XLTS U25 ( .A0(n1), .A1(ch_1[29]), .B0(n6), .B1(ch_0[29]), .Y(
        data_out[29]) );
  AO22XLTS U26 ( .A0(n3), .A1(ch_1[26]), .B0(n7), .B1(ch_0[26]), .Y(
        data_out[26]) );
  AO22XLTS U27 ( .A0(n2), .A1(ch_1[25]), .B0(n6), .B1(ch_0[25]), .Y(
        data_out[25]) );
  AO22XLTS U28 ( .A0(select), .A1(ch_1[30]), .B0(n7), .B1(ch_0[30]), .Y(
        data_out[30]) );
  AO22XLTS U29 ( .A0(n2), .A1(ch_1[20]), .B0(n6), .B1(ch_0[20]), .Y(
        data_out[20]) );
  AO22XLTS U30 ( .A0(n2), .A1(ch_1[27]), .B0(n6), .B1(ch_0[27]), .Y(
        data_out[27]) );
  AO22XLTS U31 ( .A0(select), .A1(ch_1[21]), .B0(n6), .B1(ch_0[21]), .Y(
        data_out[21]) );
  AO22XLTS U32 ( .A0(n3), .A1(ch_1[8]), .B0(n4), .B1(ch_0[8]), .Y(data_out[8])
         );
  AO22XLTS U33 ( .A0(select), .A1(ch_1[7]), .B0(n4), .B1(ch_0[7]), .Y(
        data_out[7]) );
  AO22XLTS U34 ( .A0(n3), .A1(ch_1[23]), .B0(n7), .B1(ch_0[23]), .Y(
        data_out[23]) );
  BUFX3TS U35 ( .A(select), .Y(n2) );
  BUFX3TS U36 ( .A(select), .Y(n3) );
  BUFX3TS U37 ( .A(n6), .Y(n4) );
  CLKBUFX2TS U38 ( .A(n6), .Y(n7) );
  BUFX3TS U39 ( .A(n7), .Y(n5) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
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
         left_right_SHT2, SIGN_FLAG_SHT2, OP_FLAG_SHT2, SIGN_FLAG_SHT1SHT2,
         SIGN_FLAG_NRM, DmP_mant_SFG_SWR_25_, SIGN_FLAG_SFG, OP_FLAG_SFG,
         inst_FSM_INPUT_ENABLE_state_next_1_, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n632, n633, n634, n635, n636, n637, n638, n639,
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
         n761, n762, n763, n765, n766, n768, n769, n771, n772, n774, n775,
         n777, n778, n780, n781, n783, n784, n786, n787, n788, n790, n791,
         n792, n793, n794, n795, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n828, n829, n830, n831, n832,
         n833, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, DP_OP_15J43_122_6956_n18,
         DP_OP_15J43_122_6956_n17, DP_OP_15J43_122_6956_n16,
         DP_OP_15J43_122_6956_n15, DP_OP_15J43_122_6956_n14,
         DP_OP_15J43_122_6956_n8, DP_OP_15J43_122_6956_n7,
         DP_OP_15J43_122_6956_n6, DP_OP_15J43_122_6956_n5,
         DP_OP_15J43_122_6956_n4, DP_OP_15J43_122_6956_n3,
         DP_OP_15J43_122_6956_n2, DP_OP_15J43_122_6956_n1, n73, n1430, n1431,
         n1432, n1433, n1434, n1437, n1438, n1439, n1440, n1441, n1442, n1443,
         n1445, n1446, n1447, n1452, n1455, n1456, n1457, n1458, n1459, n1460,
         n1461, n1462, n1463, n1464, n1465, n1467, n1469, n1477, n1480, n1482,
         n1483, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1499,
         n1501, n1502, n1503, n1505, n1506, n1507, n1509, n1510, n1513, n1514,
         n1516, n1517, n1519, n1520, n1527, n1528, n1529, n1530, n1531, n1532,
         n1533, n1534, n1186, n2533, n2535, n2536, n2545, n2548, n2551, n2556,
         n2557, n2558, n2559, n2560, n2561, n2563, n2565, n2570, n2573, n2575,
         n2578, n2580, n2582, n2584, n2586, n2589, n2592, n2593, n2595, n2597,
         n2599, n3605, n3606, n3607, n3608, n3609, n3612, n3613, n3615, n3616,
         n3617, n3619, n3623, n3626, n3627, n3637, n3638, n3648, n3657, n3660,
         n3671, n3672, n3673, n3674, n3675, n3677, n3725, n1148, n1149, n1150,
         n1151, n1152, n1153, n1154, n1155, n1156, n1157, n3729, n3730, n3731,
         n3732, n3733, n3734, n3735, n3736, n3737, n3738, n3739, n3740, n3741,
         n3742, n3743, n3744, n3745, n3746, n3747, n3748, n3749, n3750, n3751,
         n3752, n3753, n3754, n3755, n3756, n3757, n3758, n3759, n3760, n3761,
         n3762, n3763, n3764, n3765, n3766, n3767, n3768, n3769, n3770, n3771,
         n3772, n3773, n3774, n3775, n3776, n3777, n3778, n3779, n3780, n3781,
         n3782, n3783, n3784, n3785, n3786, n3787, n3788, n3789, n3790, n3791,
         n3792, n3793, n3794, n3795, n3796, n3797, n3798, n3799, n3800, n3801,
         n3802, n3803, n3804, n3805, n3806, n3807, n3808, n3809, n3810, n3811,
         n3812, n3813, n3814, n3815, n3816, n3817, n3818, n3819, n3820, n3821,
         n3822, n3823, n3824, n3825, n3826, n3827, n3828, n3829, n3830, n3831,
         n3832, n3833, n3834, n3835, n3836, n3837, n3838, n3839, n3840, n3841,
         n3842, n3843, n3844, n3845, n3846, n3847, n3848, n3849, n3850, n3851,
         n3852, n3853, n3854, n3855, n3856, n3857, n3858, n3859, n3860, n3861,
         n3862, n3863, n3864, n3865, n3866, n3867, n3868, n3869, n3870, n3871,
         n3872, n3873, n3874, n3875, n3876, n3877, n3878, n3879, n3880, n3881,
         n3882, n3883, n3884, n3885, n3886, n3887, n3888, n3889, n3890, n3891,
         n3892, n3893, n3894, n3895, n3896, n3897, n3898, n3899, n3900, n3901,
         n3902, n3903, n3904, n3905, n3906, n3907, n3908, n3909, n3910, n3911,
         n3912, n3913, n3914, n3915, n3916, n3917, n3918, n3919, n3920, n3921,
         n3922, n3923, n3924, n3925, n3926, n3927, n3928, n3929, n3930, n3931,
         n3932, n3933, n3934, n3935, n3936, n3937, n3938, n3939, n3940, n3941,
         n3942, n3943, n3944, n3945, n3946, n3947, n3948, n3949, n3950, n3951,
         n3952, n3953, n3954, n3955, n3956, n3957, n3958, n3959, n3960, n3961,
         n3962, n3963, n3964, n3965, n3966, n3967, n3968, n3969, n3970, n3971,
         n3972, n3973, n3974, n3975, n3976, n3977, n3978, n3979, n3980, n3981,
         n3982, n3983, n3984, n3985, n3986, n3987, n3988, n3989, n3990, n3991,
         n3992, n3993, n3994, n3995, n3996, n3997, n3998, n3999, n4000, n4001,
         n4002, n4003, n4004, n4005, n4006, n4007, n4008, n4009, n4010, n4011,
         n4012, n4013, n4014, n4015, n4016, n4017, n4018, n4019, n4020, n4021,
         n4022, n4023, n4024, n4025, n4026, n4027, n4028, n4029, n4030, n4031,
         n4032, n4033, n4034, n4035, n4036, n4037, n4038, n4039, n4040, n4041,
         n4042, n4043, n4044, n4045, n4046, n4047, n4048, n4049, n4050, n4051,
         n4052, n4053, n4054, n4055, n4056, n4057, n4058, n4059, n4060, n4061,
         n4062, n4063, n4064, n4065, n4066, n4067, n4068, n4069, n4070, n4071,
         n4072, n4073, n4074, n4075, n4076, n4077, n4078, n4079, n4080, n4081,
         n4082, n4083, n4084, n4085, n4086, n4087, n4088, n4089, n4090, n4091,
         n4092, n4093, n4094, n4095, n4096, n4097, n4098, n4099, n4100, n4101,
         n4102, n4103, n4104, n4105, n4106, n4107, n4108, n4109, n4110, n4111,
         n4112, n4113, n4114, n4115, n4116, n4117, n4118, n4119, n4120, n4121,
         n4122, n4123, n4124, n4125, n4126, n4127, n4128, n4129, n4130, n4131,
         n4132, n4133, n4134, n4135, n4136, n4137, n4138, n4139, n4140, n4141,
         n4142, n4143, n4144, n4145, n4146, n4147, n4148, n4149, n4150, n4151,
         n4152, n4153, n4154, n4155, n4156, n4157, n4158, n4159, n4160, n4161,
         n4162, n4163, n4164, n4165, n4166, n4167, n4168, n4169, n4170, n4171,
         n4172, n4173, n4174, n4175, n4176, n4177, n4178, n4179, n4180, n4181,
         n4182, n4183, n4184, n4185, n4186, n4187, n4188, n4189, n4190, n4191,
         n4192, n4193, n4194, n4195, n4196, n4197, n4198, n4199, n4200, n4201,
         n4202, n4203, n4204, n4205, n4206, n4207, n4208, n4209, n4210, n4211,
         n4212, n4213, n4214, n4215, n4216, n4217, n4218, n4219, n4220, n4221,
         n4222, n4223, n4224, n4225, n4226, n4227, n4228, n4229, n4230, n4231,
         n4232, n4233, n4234, n4235, n4236, n4237, n4238, n4239, n4240, n4241,
         n4242, n4243, n4244, n4245, n4246, n4247, n4248, n4249, n4250, n4251,
         n4252, n4253, n4254, n4255, n4256, n4257, n4258, n4259, n4260, n4261,
         n4262, n4263, n4264, n4265, n4266, n4267, n4268, n4269, n4270, n4271,
         n4272, n4273, n4274, n4275, n4276, n4277, n4278, n4279, n4280, n4281,
         n4282, n4283, n4284, n4285, n4286, n4287, n4288, n4289, n4290, n4291,
         n4292, n4293, n4294, n4295, n4296, n4297, n4298, n4299, n4300, n4301,
         n4302, n4303, n4304, n4305, n4306, n4307, n4308, n4309, n4310, n4311,
         n4312, n4313, n4314, n4315, n4316, n4317, n4318, n4319, n4320, n4321,
         n4322, n4323, n4324, n4325, n4326, n4327, n4328, n4329, n4330, n4331,
         n4332, n4333, n4334, n4335, n4336, n4337, n4338, n4339, n4340, n4341,
         n4342, n4343, n4344, n4345, n4346, n4347, n4348, n4349, n4350, n4351,
         n4352, n4353, n4354, n4355, n4356, n4357, n4358, n4359, n4360, n4361,
         n4362, n4363, n4364, n4365, n4366, n4367, n4368, n4369, n4370, n4371,
         n4372, n4373, n4374, n4375, n4376, n4377, n4378, n4379, n4380, n4381,
         n4382, n4383, n4384, n4385, n4386, n4387, n4388, n4389, n4390, n4391,
         n4392, n4393, n4394, n4395, n4396, n4397, n4398, n4399, n4400, n4401,
         n4402, n4403, n4404, n4405, n4406, n4407, n4408, n4409, n4410, n4411,
         n4412, n4413, n4414, n4415, n4416, n4417, n4418, n4419, n4420, n4421,
         n4422, n4423, n4424, n4425, n4426, n4427, n4428, n4429, n4430, n4431,
         n4432, n4433, n4434, n4435, n4436, n4437, n4438, n4439, n4440, n4441,
         n4442, n4443, n4444, n4445, n4446, n4447, n4448, n4449, n4450, n4451,
         n4452, n4453, n4454, n4455, n4456, n4457, n4458, n4459, n4460, n4461,
         n4462, n4463, n4464, n4465, n4466, n4467, n4468, n4469, n4470, n4471,
         n4472, n4473, n4474, n4475, n4476, n4477, n4478, n4479, n4480, n4481,
         n4482, n4483, n4484, n4485, n4486, n4487, n4488, n4489, n4490, n4491,
         n4492, n4493, n4494, n4495, n4496, n4497, n4498, n4499, n4500, n4501,
         n4502, n4503, n4504, n4505, n4506, n4507, n4508, n4509, n4510, n4511,
         n4512, n4513, n4514, n4515, n4516, n4517, n4518, n4519, n4520, n4521,
         n4522, n4523, n4524, n4525, n4526, n4527, n4528, n4529, n4530, n4531,
         n4532, n4533, n4534, n4535, n4536, n4537, n4538, n4539, n4540, n4541,
         n4542, n4543, n4544, n4545, n4546, n4547, n4548, n4549, n4550, n4551,
         n4552, n4553, n4554, n4555, n4556, n4557, n4558, n4559, n4560, n4561,
         n4562, n4563, n4564, n4565, n4566, n4567, n4568, n4569, n4570, n4571,
         n4572, n4573, n4574, n4575, n4576, n4577, n4578, n4579, n4580, n4581,
         n4582, n4583, n4584, n4585, n4586, n4587, n4588, n4589, n4590, n4591,
         n4592, n4593, n4594, n4595, n4596, n4597, n4598, n4599, n4600, n4601,
         n4602, n4603, n4604, n4605, n4606, n4607, n4608, n4609, n4610, n4611,
         n4612, n4613, n4614, n4615, n4616, n4617, n4618, n4619, n4620, n4621,
         n4622, n4623, n4624, n4625, n4626, n4627, n4628, n4629, n4630, n4631,
         n4632, n4633, n4634, n4635, n4636, n4637, n4638, n4639, n4640, n4641,
         n4642, n4643, n4644, n4645, n4646, n4647, n4648, n4649, n4650, n4651,
         n4652, n4653, n4654, n4655, n4656, n4657, n4658, n4659, n4660, n4661,
         n4662, n4663, n4664, n4665, n4666, n4667, n4668, n4669, n4670, n4671,
         n4672, n4673, n4674, n4675, n4676, n4677, n4678, n4679, n4680, n4681,
         n4682, n4683, n4684, n4685, n4686, n4687, n4688, n4689, n4690, n4691,
         n4692, n4693, n4694, n4695, n4696, n4697, n4698, n4699, n4700, n4701,
         n4702, n4703, n4704, n4705, n4706, n4707, n4708, n4709, n4710, n4711,
         n4712, n4713, n4714, n4715, n4716, n4717, n4718, n4719, n4720, n4721,
         n4722, n4723, n4724, n4725, n4726, n4727, n4728, n4729, n4730, n4731,
         n4732, n4733, n4734, n4735, n4736, n4737, n4738, n4739, n4740, n4741,
         n4742, n4743, n4744, n4745, n4746, n4747, n4748, n4749, n4750, n4751,
         n4752, n4753, n4754, n4755, n4756, n4757, n4758, n4759, n4760, n4761,
         n4762, n4763, n4764, n4765, n4766, n4767, n4768, n4769, n4770, n4771,
         n4772, n4773, n4774, n4775, n4776, n4777, n4778, n4779, n4780, n4781,
         n4782, n4783, n4784, n4785, n4786, n4787, n4788, n4789, n4790, n4791,
         n4792, n4793, n4794, n4795, n4796, n4797, n4798, n4799, n4800, n4801,
         n4802, n4803, n4804, n4805, n4806, n4807, n4808, n4809, n4810, n4811,
         n4812, n4813, n4814, n4815, n4816, n4817, n4818, n4819, n4820, n4821,
         n4822, n4823, n4824, n4825, n4826, n4827, n4828, n4829, n4830, n4831,
         n4832, n4833, n4834, n4835, n4836, n4837, n4838, n4839, n4840, n4841,
         n4842, n4843, n4844, n4845, n4846, n4847, n4848, n4849, n4850, n4851,
         n4852, n4853, n4854, n4855, n4856, n4857, n4858, n4859, n4860, n4861,
         n4862, n4863, n4864, n4865, n4866, n4867, n4868, n4869, n4870, n4871,
         n4872, n4873, n4874, n4875, n4876, n4877, n4878, n4879, n4880, n4881,
         n4882, n4883, n4884, n4885, n4886, n4887;
  wire   [3:0] Shift_reg_FLAGS_7;
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
  wire   [30:2] DMP_SFG;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(n830), .CK(clk), .RN(n4873), 
        .Q(Shift_amount_SHT1_EWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(n829), .CK(clk), .RN(n4872), 
        .Q(Shift_amount_SHT1_EWR[3]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(n828), .CK(clk), .RN(n4871), 
        .Q(Shift_amount_SHT1_EWR[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(n813), .CK(clk), .RN(n4882), .Q(
        DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(n812), .CK(clk), .RN(n4882), .Q(
        DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(n811), .CK(clk), .RN(n4882), .Q(
        DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(n807), .CK(clk), .RN(n4882), .Q(
        DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(n800), .CK(clk), .RN(n4880), .Q(
        DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(n1148), .CK(clk), .RN(n4871), .Q(
        DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(n788), .CK(clk), .RN(n4871), .Q(
        OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(n787), .CK(clk), .RN(n4877), .Q(
        SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(n786), .CK(clk), .RN(n4873), .Q(
        DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(n1534), .CK(clk), .RN(n4873), .Q(
        DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(n783), .CK(clk), .RN(n4873), .Q(
        DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(n1533), .CK(clk), .RN(n4866), .Q(
        DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(n780), .CK(clk), .RN(n4874), .Q(
        DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(n1532), .CK(clk), .RN(n4874), .Q(
        DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(n777), .CK(clk), .RN(n4874), .Q(
        DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(n1531), .CK(clk), .RN(n4874), .Q(
        DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(n774), .CK(clk), .RN(n4875), .Q(
        DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(n1530), .CK(clk), .RN(n4875), .Q(
        DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(n771), .CK(clk), .RN(n4875), .Q(
        DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(n1529), .CK(clk), .RN(n4875), .Q(
        DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(n768), .CK(clk), .RN(n4871), .Q(
        DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(n1528), .CK(clk), .RN(n4875), .Q(
        DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(n765), .CK(clk), .RN(n4871), .Q(
        DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(n1527), .CK(clk), .RN(n4875), .Q(
        DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(n762), .CK(clk), .RN(n4870), .Q(
        DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(n761), .CK(clk), .RN(n4875), .Q(
        DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(n759), .CK(clk), .RN(n4872), .Q(
        DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(n758), .CK(clk), .RN(n4872), .Q(
        DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(n756), .CK(clk), .RN(n4871), .Q(
        DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(n755), .CK(clk), .RN(n4871), .Q(
        DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(n753), .CK(clk), .RN(n4876), .Q(
        DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(n752), .CK(clk), .RN(n4876), .Q(
        DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(n750), .CK(clk), .RN(n4870), .Q(
        DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(n749), .CK(clk), .RN(n4876), .Q(
        DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(n747), .CK(clk), .RN(n4876), .Q(
        DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(n746), .CK(clk), .RN(n4876), .Q(
        DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(n744), .CK(clk), .RN(n4881), .Q(
        DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(n743), .CK(clk), .RN(n4872), .Q(
        DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(n741), .CK(clk), .RN(n4881), .Q(
        DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(n740), .CK(clk), .RN(n4870), .Q(
        DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(n738), .CK(clk), .RN(n4881), .Q(
        DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(n737), .CK(clk), .RN(n4870), .Q(
        DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(n735), .CK(clk), .RN(n4881), .Q(
        DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(n734), .CK(clk), .RN(n4869), .Q(
        DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(n732), .CK(clk), .RN(n4881), .Q(
        DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(n731), .CK(clk), .RN(n4869), .Q(
        DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(n729), .CK(clk), .RN(n4869), .Q(
        DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(n728), .CK(clk), .RN(n4869), .Q(
        DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(n726), .CK(clk), .RN(n4880), .Q(
        DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(n725), .CK(clk), .RN(n4869), .Q(
        DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(n723), .CK(clk), .RN(n4880), .Q(
        DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(n722), .CK(clk), .RN(n4869), .Q(
        DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(n720), .CK(clk), .RN(n4880), .Q(
        DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(n719), .CK(clk), .RN(n4869), .Q(
        DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(n717), .CK(clk), .RN(n4869), .Q(
        DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(n716), .CK(clk), .RN(n4868), .Q(
        DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(n715), .CK(clk), .RN(n4868), .Q(
        DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(n714), .CK(clk), .RN(n4868), .Q(
        DMP_exp_NRM_EW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(n712), .CK(clk), .RN(n4868), .Q(
        DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(n711), .CK(clk), .RN(n4868), .Q(
        DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(n710), .CK(clk), .RN(n4868), .Q(
        DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(n709), .CK(clk), .RN(n4867), .Q(
        DMP_exp_NRM_EW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(n707), .CK(clk), .RN(n4880), .Q(
        DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(n706), .CK(clk), .RN(n4868), .Q(
        DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(n705), .CK(clk), .RN(n4868), .Q(
        DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(n704), .CK(clk), .RN(n4867), .Q(
        DMP_exp_NRM_EW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(n702), .CK(clk), .RN(n4880), .Q(
        DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(n701), .CK(clk), .RN(n4867), .Q(
        DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(n700), .CK(clk), .RN(n4867), .Q(
        DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(n699), .CK(clk), .RN(n4867), .Q(
        DMP_exp_NRM_EW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(n697), .CK(clk), .RN(n4880), .Q(
        DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(n696), .CK(clk), .RN(n4867), .Q(
        DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(n695), .CK(clk), .RN(n4867), .Q(
        DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(n694), .CK(clk), .RN(n4867), .Q(
        DMP_exp_NRM_EW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(n692), .CK(clk), .RN(n4879), .Q(
        DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(n691), .CK(clk), .RN(n4868), .Q(
        DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(n690), .CK(clk), .RN(n4866), .Q(
        DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(n689), .CK(clk), .RN(n4866), .Q(
        DMP_exp_NRM_EW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(n687), .CK(clk), .RN(n4879), .Q(
        DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(n686), .CK(clk), .RN(n4866), .Q(
        DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(n685), .CK(clk), .RN(n4866), .Q(
        DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(n684), .CK(clk), .RN(n4866), .Q(
        DMP_exp_NRM_EW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(n682), .CK(clk), .RN(n4866), .Q(
        DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(n681), .CK(clk), .RN(n4866), .Q(
        DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(n680), .CK(clk), .RN(n4865), .Q(
        DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(n679), .CK(clk), .RN(n4865), .Q(
        DMP_exp_NRM_EW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(n677), .CK(clk), .RN(n4879), .Q(
        DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(n676), .CK(clk), .RN(n4865), .Q(
        DmP_mant_SHT1_SW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(n675), .CK(clk), .RN(n4879), .Q(
        DmP_EXP_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(n674), .CK(clk), .RN(n4865), .Q(
        DmP_mant_SHT1_SW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(n673), .CK(clk), .RN(n4879), .Q(
        DmP_EXP_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(n672), .CK(clk), .RN(n4867), .Q(
        DmP_mant_SHT1_SW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(n671), .CK(clk), .RN(n4879), .Q(
        DmP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(n669), .CK(clk), .RN(n4879), .Q(
        DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(n668), .CK(clk), .RN(n4866), .Q(
        DmP_mant_SHT1_SW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(n667), .CK(clk), .RN(n4879), .Q(
        DmP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(n665), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(n664), .CK(clk), .RN(n4869), .Q(
        DmP_mant_SHT1_SW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(n660), .CK(clk), .RN(n4877), .QN(
        n3671) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(n659), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(n658), .CK(clk), .RN(n4866), .Q(
        DmP_mant_SHT1_SW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(n657), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(n656), .CK(clk), .RN(n4867), .Q(
        DmP_mant_SHT1_SW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(n655), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(n654), .CK(clk), .RN(n4870), .Q(
        DmP_mant_SHT1_SW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(n653), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(n651), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(n650), .CK(clk), .RN(n4869), .Q(
        DmP_mant_SHT1_SW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(n649), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(n648), .CK(clk), .RN(n4873), .Q(
        DmP_mant_SHT1_SW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(n647), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(n645), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(n644), .CK(clk), .RN(n4870), .Q(
        DmP_mant_SHT1_SW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(n643), .CK(clk), .RN(n4878), .Q(
        DmP_EXP_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(n642), .CK(clk), .RN(n4870), .Q(
        DmP_mant_SHT1_SW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(n641), .CK(clk), .RN(n4877), .Q(
        DmP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(n639), .CK(clk), .RN(n4877), .Q(
        DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(n638), .CK(clk), .RN(n4870), .Q(
        DmP_mant_SHT1_SW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(n637), .CK(clk), .RN(n4877), .Q(
        DmP_EXP_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(n636), .CK(clk), .RN(n4871), .Q(
        DmP_mant_SHT1_SW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(n635), .CK(clk), .RN(n4877), .Q(
        DmP_EXP_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(n634), .CK(clk), .RN(n4872), .Q(
        DmP_mant_SHT1_SW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(n633), .CK(clk), .RN(n4877), .Q(
        DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(n624), .CK(clk), .RN(n4872), .Q(
        OP_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(n623), .CK(clk), .RN(n4872), .Q(
        OP_FLAG_SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(n619), .CK(clk), .RN(n4873), .Q(
        SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(n618), .CK(clk), .RN(n4873), .Q(
        SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(n617), .CK(clk), .RN(n4873), .Q(
        SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(n616), .CK(clk), .RN(n4874), .Q(
        SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n615), .CK(clk), .RN(n4874), .Q(
        SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(n587), .CK(clk), .RN(n4874), .Q(
        LZD_output_NRM2_EW[3]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(n585), .CK(clk), .RN(n4874), .Q(
        LZD_output_NRM2_EW[2]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(n583), .CK(clk), .RN(n4875), .Q(
        LZD_output_NRM2_EW[4]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_25_ ( .D(n794), .CK(clk), .RN(n4858), .Q(n4798), 
        .QN(n1442) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(n845), .CK(clk), .RN(n4859), .Q(
        Data_array_SWR[8]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(n693), .CK(clk), .RN(n4859), .Q(
        DMP_exp_NRM2_EW[4]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(n708), .CK(clk), .RN(n4859), .Q(
        DMP_exp_NRM2_EW[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(n843), .CK(clk), .RN(n4859), .Q(
        Data_array_SWR[6]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(n844), .CK(clk), .RN(n4859), .Q(
        Data_array_SWR[7]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_23_ ( .D(n1157), .CK(clk), .RN(n3992), .Q(
        DmP_EXP_EWSW[23]) );
  DFFRX1TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(n622), .CK(clk), .RN(n3990), .Q(
        OP_FLAG_SFG) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(n678), .CK(clk), .RN(n4859), .Q(
        DMP_exp_NRM2_EW[7]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(n683), .CK(clk), .RN(n4859), .Q(
        DMP_exp_NRM2_EW[6]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(n688), .CK(clk), .RN(n4859), .Q(
        DMP_exp_NRM2_EW[5]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(n698), .CK(clk), .RN(n4860), .Q(
        DMP_exp_NRM2_EW[3]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(n703), .CK(clk), .RN(n4860), .Q(
        DMP_exp_NRM2_EW[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(n840), .CK(clk), .RN(n4860), .Q(
        Data_array_SWR[3]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(n848), .CK(clk), .RN(n4860), .Q(
        Data_array_SWR[11]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(n847), .CK(clk), .RN(n4860), .Q(
        Data_array_SWR[10]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(n846), .CK(clk), .RN(n4860), .Q(
        Data_array_SWR[9]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(n842), .CK(clk), .RN(n4860), .Q(
        Data_array_SWR[5]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(n841), .CK(clk), .RN(n4860), .Q(
        Data_array_SWR[4]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_27_ ( .D(n792), .CK(clk), .RN(n3989), .Q(
        DMP_EXP_EWSW[27]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(n838), .CK(clk), .RN(n4860), .Q(
        Data_array_SWR[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(n837), .CK(clk), .RN(n4861), .Q(
        Data_array_SWR[0]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_27_ ( .D(n627), .CK(clk), .RN(n3988), .Q(
        DmP_EXP_EWSW[27]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_26_ ( .D(n793), .CK(clk), .RN(n4859), .Q(n4805), 
        .QN(n1446) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(n3750), .CK(clk), .RN(n4876), .Q(ready) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(n534), .CK(clk), .RN(n3988), .Q(
        DmP_mant_SFG_SWR_25_) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n938), .CK(clk), .RN(
        n4861), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n4752) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(n832), .CK(clk), .RN(n4861), 
        .Q(Shift_amount_SHT1_EWR[0]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(n870), .CK(clk), .RN(n4855), 
        .Q(n4755), .QN(n1431) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(n860), .CK(clk), .RN(n4861), .Q(
        n4801), .QN(n3660) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_24_ ( .D(n630), .CK(clk), .RN(n4857), .Q(n4799), 
        .QN(n1441) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(n859), .CK(clk), .RN(n4861), .Q(
        n2595), .QN(n4842) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(n608), .CK(clk), .RN(n4861), .Q(
        n4803), .QN(n3677) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(n867), .CK(clk), .RN(n3988), 
        .Q(n3648) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(n606), .CK(clk), .RN(n4854), .Q(
        n4804), .QN(n3616) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(n906), .CK(clk), .RN(n4854), 
        .Q(n4785), .QN(n1477) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(n910), .CK(clk), .RN(n3988), 
        .Q(n3607), .QN(n4780) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(n831), .CK(clk), .RN(n4882), 
        .Q(Shift_amount_SHT1_EWR[1]) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n937), .CK(clk), .RN(
        n4847), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(n611), .CK(clk), .RN(n4847), .Q(
        Raw_mant_NRM_SWR[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(n874), .CK(clk), .RN(n4853), 
        .Q(intDY_EWSW[22]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(n893), .CK(clk), .RN(n4850), .Q(
        intDY_EWSW[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(n875), .CK(clk), .RN(n4853), 
        .Q(intDY_EWSW[21]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(n879), .CK(clk), .RN(n4852), 
        .Q(intDY_EWSW[17]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(n883), .CK(clk), .RN(n4852), 
        .Q(intDY_EWSW[13]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(n885), .CK(clk), .RN(n4851), 
        .Q(intDY_EWSW[11]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(n895), .CK(clk), .RN(n4850), .Q(
        intDY_EWSW[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(n887), .CK(clk), .RN(n4852), .Q(
        intDY_EWSW[9]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(n894), .CK(clk), .RN(n4850), .Q(
        intDY_EWSW[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(n869), .CK(clk), .RN(n3990), 
        .Q(intDY_EWSW[27]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(n891), .CK(clk), .RN(n4851), .Q(
        intDY_EWSW[5]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(n922), .CK(clk), .RN(n4851), .Q(
        intDX_EWSW[7]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(n921), .CK(clk), .RN(n4851), .Q(
        n3623) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(n876), .CK(clk), .RN(n4853), 
        .Q(intDY_EWSW[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(n878), .CK(clk), .RN(n4852), 
        .Q(intDY_EWSW[18]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(n880), .CK(clk), .RN(n4849), 
        .Q(intDY_EWSW[16]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(n881), .CK(clk), .RN(n4849), 
        .Q(intDY_EWSW[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(n882), .CK(clk), .RN(n4852), 
        .Q(intDY_EWSW[14]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(n886), .CK(clk), .RN(n3989), 
        .Q(intDY_EWSW[10]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(n892), .CK(clk), .RN(n4850), .Q(
        intDY_EWSW[4]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(n594), .CK(clk), .RN(n4843), .Q(
        Raw_mant_NRM_SWR[19]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(n592), .CK(clk), .RN(n4844), .Q(
        Raw_mant_NRM_SWR[21]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(n588), .CK(clk), .RN(n4844), .Q(
        Raw_mant_NRM_SWR[25]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(n850), .CK(clk), .RN(n4847), .Q(
        Data_array_SWR[13]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(n855), .CK(clk), .RN(n4848), .Q(
        Data_array_SWR[18]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(n856), .CK(clk), .RN(n4848), .Q(
        Data_array_SWR[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(n853), .CK(clk), .RN(n4848), .Q(
        Data_array_SWR[16]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(n854), .CK(clk), .RN(n4848), .Q(
        Data_array_SWR[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(n857), .CK(clk), .RN(n4848), .Q(
        Data_array_SWR[20]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(n849), .CK(clk), .RN(n4850), .Q(
        Data_array_SWR[12]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(n851), .CK(clk), .RN(n4851), .Q(
        Data_array_SWR[14]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(n852), .CK(clk), .RN(n4852), .Q(
        Data_array_SWR[15]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(n589), .CK(clk), .RN(n4844), .Q(
        Raw_mant_NRM_SWR[24]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(n550), .CK(clk), .RN(n4857), .Q(
        n3638), .QN(n4762) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(n599), .CK(clk), .RN(n4855), .Q(
        n4782), .QN(n3612) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n545), .CK(clk), .RN(n4856), .Q(
        n2592), .QN(n4771) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(n862), .CK(clk), .RN(n4853), .Q(
        n2580) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(n861), .CK(clk), .RN(n3992), .Q(
        Data_array_SWR[24]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(n557), .CK(clk), .RN(n4858), .Q(
        n3627), .QN(n4756) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_26_ ( .D(n628), .CK(clk), .RN(n3991), .Q(n4808), 
        .QN(n1445) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_25_ ( .D(n629), .CK(clk), .RN(n3989), .Q(n4796), 
        .QN(n1447) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(n552), .CK(clk), .RN(n3991), .Q(
        n3637), .QN(n4776) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(n541), .CK(clk), .RN(n4856), .Q(
        n4781), .QN(n1519) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(n868), .CK(clk), .RN(n4859), 
        .Q(intDY_EWSW[28]) );
  DFFRX2TS inst_ShiftRegister_Q_reg_1_ ( .D(n931), .CK(clk), .RN(n3991), .Q(
        n3605), .QN(n3779) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(n912), .CK(clk), .RN(n4852), 
        .Q(n4832), .QN(n1490) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(n911), .CK(clk), .RN(n4853), 
        .Q(n4831), .QN(n1463) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(n908), .CK(clk), .RN(n4853), 
        .Q(n4829), .QN(n1458) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(n902), .CK(clk), .RN(n3989), 
        .Q(n4825), .QN(n1464) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(n914), .CK(clk), .RN(n4849), 
        .Q(n4823), .QN(n1457) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(n909), .CK(clk), .RN(n4853), 
        .Q(n4822), .QN(n1461) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(n915), .CK(clk), .RN(n4852), 
        .Q(n4818), .QN(n1486) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(n899), .CK(clk), .RN(n4849), 
        .Q(n4815), .QN(n1465) );
  DFFRX1TS inst_ShiftRegister_Q_reg_2_ ( .D(n932), .CK(clk), .RN(n4849), .Q(
        n4814) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(n610), .CK(clk), .RN(n4846), .Q(
        Raw_mant_NRM_SWR[3]), .QN(n4813) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(n872), .CK(clk), .RN(n3990), 
        .Q(n4786), .QN(n1467) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(n884), .CK(clk), .RN(n4849), 
        .Q(intDY_EWSW[12]), .QN(n4774) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(n601), .CK(clk), .RN(n4843), .Q(
        Raw_mant_NRM_SWR[12]), .QN(n4773) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_11_ ( .D(n751), .CK(clk), .RN(n4846), .Q(n4772), 
        .QN(n2560) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(n605), .CK(clk), .RN(n4853), .Q(
        Raw_mant_NRM_SWR[8]), .QN(n4768) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(n896), .CK(clk), .RN(n4849), .Q(
        intDY_EWSW[0]), .QN(n4767) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(n904), .CK(clk), .RN(n3992), 
        .Q(n4753), .QN(n1440) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(n917), .CK(clk), .RN(n4849), 
        .Q(n4749), .QN(n1462) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n626), .CK(clk), .RN(n4876), .Q(
        underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n625), .CK(clk), .RN(n4876), .Q(
        overflow_flag) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(n820), .CK(clk), .RN(n4861), .Q(
        final_result_ieee[30]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(n614), .CK(clk), .RN(n4861), .Q(
        final_result_ieee[31]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(n582), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[10]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(n581), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[11]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(n1152), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[25]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(n1153), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[26]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(n1151), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[29]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(n1150), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[23]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(n1149), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[24]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(n1154), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[27]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(n1155), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[28]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(n580), .CK(clk), .RN(n4862), .Q(
        final_result_ieee[9]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(n579), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[12]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(n578), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[8]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(n577), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[13]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(n576), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[7]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(n575), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[6]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(n574), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[5]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(n573), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[4]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(n572), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[3]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(n571), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[2]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(n570), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[1]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(n569), .CK(clk), .RN(n4863), .Q(
        final_result_ieee[0]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(n568), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[14]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(n567), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[15]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(n566), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[16]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(n565), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[17]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(n564), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[18]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(n563), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[19]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(n562), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[20]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(n561), .CK(clk), .RN(n4865), .Q(
        final_result_ieee[21]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(n560), .CK(clk), .RN(n4864), .Q(
        final_result_ieee[22]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U4 ( .A(n3725), .B(DMP_exp_NRM2_EW[5]), .CI(
        DP_OP_15J43_122_6956_n4), .CO(DP_OP_15J43_122_6956_n3), .S(
        exp_rslt_NRM2_EW1[5]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U6 ( .A(DP_OP_15J43_122_6956_n15), .B(
        DMP_exp_NRM2_EW[3]), .C(DP_OP_15J43_122_6956_n6), .CO(
        DP_OP_15J43_122_6956_n5), .S(exp_rslt_NRM2_EW1[3]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n548), .CK(clk), .RN(n3988), .Q(
        n2584) );
  DFFRX2TS inst_ShiftRegister_Q_reg_6_ ( .D(n936), .CK(clk), .RN(n4871), .Q(
        n4745), .QN(n4884) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_13_ ( .D(n745), .CK(clk), .RN(n4846), .QN(n2561) );
  DFFRX2TS SHT2_STAGE_SHFTVARS2_Q_reg_0_ ( .D(n864), .CK(clk), .RN(n4844), 
        .QN(n1493) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(n835), .CK(clk), .RN(n4853), 
        .QN(n3609) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(n543), .CK(clk), .RN(n4845), .QN(
        n1520) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(n604), .CK(clk), .RN(n4846), .QN(
        n3615) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(n538), .CK(clk), .RN(n4844), .Q(
        n4885), .QN(n1505) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(n903), .CK(clk), .RN(n4858), 
        .QN(n73) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_17_ ( .D(n733), .CK(clk), .RN(n4856), .QN(n2573) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_16_ ( .D(n736), .CK(clk), .RN(n4856), .QN(n2533) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n546), .CK(clk), .RN(n4856), .QN(
        n1509) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n547), .CK(clk), .RN(n3991), .QN(
        n1510) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(n553), .CK(clk), .RN(n3992), .QN(
        n1502) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(n540), .CK(clk), .RN(n4856), .QN(
        n1506) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(n873), .CK(clk), .RN(n3988), 
        .QN(n2589) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(n871), .CK(clk), .RN(n4854), 
        .QN(n1430) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(n905), .CK(clk), .RN(n3989), 
        .QN(n1439) );
  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(n933), .CK(clk), .RN(n4861), .Q(
        Shift_reg_FLAGS_7[3]), .QN(n4787) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(
        inst_FSM_INPUT_ENABLE_state_next_1_), .CK(clk), .RN(n4845), .Q(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n4792) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_21_ ( .D(n721), .CK(clk), .RN(n4844), .Q(
        DMP_SFG[21]), .QN(n4807) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_18_ ( .D(n730), .CK(clk), .RN(n4845), .Q(n4754), 
        .QN(n2575) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_22_ ( .D(n718), .CK(clk), .RN(n4844), .Q(n4838), 
        .QN(n2586) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_5_ ( .D(n769), .CK(clk), .RN(n4847), .Q(n4777), 
        .QN(n2551) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_20_ ( .D(n724), .CK(clk), .RN(n4856), .Q(n4797), 
        .QN(n2582) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_12_ ( .D(n748), .CK(clk), .RN(n4846), .Q(n4778), 
        .QN(n2559) );
  DFFRX2TS inst_ShiftRegister_Q_reg_4_ ( .D(n934), .CK(clk), .RN(n4845), .Q(
        busy), .QN(n4746) );
  DFFRX2TS inst_ShiftRegister_Q_reg_5_ ( .D(n935), .CK(clk), .RN(n4845), .Q(
        n4816), .QN(n3778) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_19_ ( .D(n727), .CK(clk), .RN(n4845), .Q(n4800), 
        .QN(n2599) );
  DFFRX2TS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n863), .CK(clk), .RN(n4845), .Q(
        left_right_SHT2), .QN(n4794) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(n612), .CK(clk), .RN(n4843), .Q(
        n4784), .QN(n1452) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(n836), .CK(clk), .RN(n4845), .Q(
        shift_value_SHT2_EWR[2]), .QN(n4779) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n549), .CK(clk), .RN(n4846), .Q(
        n4760), .QN(n3626) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(n537), .CK(clk), .RN(n3988), .Q(
        n4795), .QN(n1517) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(n603), .CK(clk), .RN(n4846), .Q(
        n4809), .QN(n3608) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(n535), .CK(clk), .RN(n4844), .Q(
        n4812), .QN(n1516) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(n598), .CK(clk), .RN(n4857), .Q(
        Raw_mant_NRM_SWR[15]), .QN(n4839) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(n539), .CK(clk), .RN(n4856), .Q(
        n3657), .QN(n4790) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(n536), .CK(clk), .RN(n4844), .Q(
        n2578), .QN(n4811) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(n551), .CK(clk), .RN(n4847), .Q(
        n4836), .QN(n1501) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(n555), .CK(clk), .RN(n4848), .Q(
        n4837), .QN(n1503) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(n602), .CK(clk), .RN(n4843), .Q(
        Raw_mant_NRM_SWR[11]), .QN(n4789) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(n607), .CK(clk), .RN(n4846), .Q(
        Raw_mant_NRM_SWR[6]), .QN(n4802) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(n609), .CK(clk), .RN(n4844), .Q(
        n4810), .QN(n2535) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(n920), .CK(clk), .RN(n4851), .Q(
        n4824), .QN(n1488) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(n913), .CK(clk), .RN(n4849), 
        .Q(n4817), .QN(n1438) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(n597), .CK(clk), .RN(n4843), .Q(
        n3675), .QN(n4841) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(n591), .CK(clk), .RN(n4858), .Q(
        Raw_mant_NRM_SWR[22]), .QN(n4783) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(n858), .CK(clk), .RN(n4861), .Q(
        Data_array_SWR[21]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n544), .CK(clk), .RN(n4856), .Q(
        n2593), .QN(n4770) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(n888), .CK(clk), .RN(n4851), .Q(
        n4835), .QN(n2536) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(n596), .CK(clk), .RN(n4843), .Q(
        Raw_mant_NRM_SWR[17]), .QN(n4791) );
  DFFRX4TS inst_ShiftRegister_Q_reg_0_ ( .D(n930), .CK(clk), .RN(n4843), .Q(
        Shift_reg_FLAGS_7[0]), .QN(n4883) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(n600), .CK(clk), .RN(n4856), .Q(
        Raw_mant_NRM_SWR[13]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(n877), .CK(clk), .RN(n4857), 
        .Q(intDY_EWSW[19]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(n890), .CK(clk), .RN(n4858), .Q(
        intDY_EWSW[6]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(n898), .CK(clk), .RN(n3991), 
        .Q(intDX_EWSW[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(n839), .CK(clk), .RN(n4872), .Q(
        Data_array_SWR[2]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(n662), .CK(clk), .RN(n4877), .Q(
        DmP_mant_SHT1_SW[7]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_13_ ( .D(n806), .CK(clk), .RN(n4876), .Q(
        DMP_EXP_EWSW[13]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_11_ ( .D(n808), .CK(clk), .RN(n4876), .Q(
        DMP_EXP_EWSW[11]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_5_ ( .D(n814), .CK(clk), .RN(n4875), .Q(
        DMP_EXP_EWSW[5]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_28_ ( .D(n791), .CK(clk), .RN(n4879), .Q(
        DMP_EXP_EWSW[28]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_22_ ( .D(n797), .CK(clk), .RN(n4880), .Q(
        DMP_EXP_EWSW[22]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_21_ ( .D(n798), .CK(clk), .RN(n4880), .Q(
        DMP_EXP_EWSW[21]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_20_ ( .D(n799), .CK(clk), .RN(n4880), .Q(
        DMP_EXP_EWSW[20]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_18_ ( .D(n801), .CK(clk), .RN(n4881), .Q(
        DMP_EXP_EWSW[18]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_17_ ( .D(n802), .CK(clk), .RN(n4881), .Q(
        DMP_EXP_EWSW[17]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_16_ ( .D(n803), .CK(clk), .RN(n4881), .Q(
        DMP_EXP_EWSW[16]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_15_ ( .D(n804), .CK(clk), .RN(n4881), .Q(
        DMP_EXP_EWSW[15]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_8_ ( .D(n661), .CK(clk), .RN(n4877), .Q(
        DmP_EXP_EWSW[8]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(n652), .CK(clk), .RN(n4868), 
        .QN(n3674) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(n666), .CK(clk), .RN(n4865), .QN(
        n3673) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(n670), .CK(clk), .RN(n4865), .QN(
        n3617) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(n923), .CK(clk), .RN(n4857), .Q(
        n3606) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(n640), .CK(clk), .RN(n4870), 
        .QN(n3672) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(n646), .CK(clk), .RN(n4870), .Q(
        DmP_mant_SHT1_SW[15]) );
  DFFRX1TS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(n632), .CK(clk), .RN(n4872), .Q(
        DmP_mant_SHT1_SW[22]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_0_ ( .D(n819), .CK(clk), .RN(n4873), .Q(
        DMP_EXP_EWSW[0]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_1_ ( .D(n818), .CK(clk), .RN(n4873), .Q(
        DMP_EXP_EWSW[1]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_2_ ( .D(n817), .CK(clk), .RN(n4874), .Q(
        DMP_EXP_EWSW[2]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_3_ ( .D(n816), .CK(clk), .RN(n4874), .Q(
        DMP_EXP_EWSW[3]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_4_ ( .D(n815), .CK(clk), .RN(n4875), .Q(
        DMP_EXP_EWSW[4]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_9_ ( .D(n810), .CK(clk), .RN(n4872), .Q(
        DMP_EXP_EWSW[9]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_7_ ( .D(n663), .CK(clk), .RN(n4877), .Q(
        DmP_EXP_EWSW[7]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_29_ ( .D(n790), .CK(clk), .RN(n4879), .Q(
        DMP_EXP_EWSW[29]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(n907), .CK(clk), .RN(n4853), 
        .Q(n4821), .QN(n1487) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(n833), .CK(clk), .RN(n4855), .Q(
        shift_value_SHT2_EWR[4]), .QN(n4793) );
  ADDFHX2TS DP_OP_15J43_122_6956_U2 ( .A(n3725), .B(DMP_exp_NRM2_EW[7]), .CI(
        DP_OP_15J43_122_6956_n2), .CO(DP_OP_15J43_122_6956_n1), .S(
        exp_rslt_NRM2_EW1[7]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U3 ( .A(n3725), .B(DMP_exp_NRM2_EW[6]), .CI(
        DP_OP_15J43_122_6956_n3), .CO(DP_OP_15J43_122_6956_n2), .S(
        exp_rslt_NRM2_EW1[6]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U9 ( .A(DMP_exp_NRM2_EW[0]), .B(n3725), .CI(
        DP_OP_15J43_122_6956_n18), .CO(DP_OP_15J43_122_6956_n8), .S(
        exp_rslt_NRM2_EW1[0]) );
  DFFRXLTS INPUT_STAGE_OPERANDY_Q_reg_31_ ( .D(n865), .CK(clk), .RN(n4860), 
        .Q(intDY_EWSW[31]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(n866), .CK(clk), .RN(n4849), 
        .Q(intDY_EWSW[30]) );
  DFFRXLTS INPUT_STAGE_FLAGS_Q_reg_0_ ( .D(n897), .CK(clk), .RN(n4865), .Q(
        intAS) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(n713), .CK(clk), .RN(n4864), .Q(
        DMP_exp_NRM2_EW[0]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(n593), .CK(clk), .RN(n3988), .Q(
        n4747), .QN(n3613) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(n554), .CK(clk), .RN(n4854), .Q(
        n4806), .QN(n1513) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(n586), .CK(clk), .RN(n4865), .Q(
        LZD_output_NRM2_EW[0]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(n584), .CK(clk), .RN(n4865), .Q(
        LZD_output_NRM2_EW[1]) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_1_ ( .D(n781), .CK(clk), .RN(n4848), .QN(n3619)
         );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_0_ ( .D(n784), .CK(clk), .RN(n4848), .QN(n2545)
         );
  DFFSX1TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(n1156), .CK(clk), .SN(n4882), .Q(
        n1514), .QN(n4764) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(n916), .CK(clk), .RN(n4852), 
        .Q(n4886), .QN(n1456) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(n613), .CK(clk), .RN(n4854), .QN(
        n1499) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_23_ ( .D(n1186), .CK(clk), .RN(n3992), .QN(
        n1492) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(n559), .CK(clk), .RN(n3989), .QN(
        n2597) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_24_ ( .D(n795), .CK(clk), .RN(n3989), .Q(n4887), 
        .QN(n1443) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(n900), .CK(clk), .RN(n4855), 
        .QN(n1491) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(n901), .CK(clk), .RN(n3990), 
        .QN(n1432) );
  DFFRX1TS NRM_STAGE_FLAGS_Q_reg_2_ ( .D(n621), .CK(clk), .RN(n4855), .QN(
        n1480) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_15_ ( .D(n739), .CK(clk), .RN(n4845), .Q(n4750), 
        .QN(n2565) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_14_ ( .D(n742), .CK(clk), .RN(n4846), .Q(n4751), 
        .QN(n2570) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_8_ ( .D(n760), .CK(clk), .RN(n4846), .Q(n4761), 
        .QN(n2557) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_7_ ( .D(n763), .CK(clk), .RN(n4847), .Q(n4748), 
        .QN(n2556) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_6_ ( .D(n766), .CK(clk), .RN(n4847), .Q(
        DMP_SFG[6]), .QN(n4775) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_4_ ( .D(n772), .CK(clk), .RN(n4847), .Q(n4758), 
        .QN(n2548) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(n754), .CK(clk), .RN(n4848), .Q(n4766), 
        .QN(n2558) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(n757), .CK(clk), .RN(n4848), .Q(
        DMP_SFG[9]), .QN(n4763) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_3_ ( .D(n775), .CK(clk), .RN(n4847), .Q(
        DMP_SFG[3]), .QN(n4759) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_2_ ( .D(n778), .CK(clk), .RN(n4847), .Q(
        DMP_SFG[2]), .QN(n4765) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(n542), .CK(clk), .RN(n4845), .Q(
        n4769), .QN(n1507) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(n919), .CK(clk), .RN(n4852), 
        .Q(n4826), .QN(n1437) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(n925), .CK(clk), .RN(n4850), .Q(
        n4833), .QN(n1434) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(n889), .CK(clk), .RN(n4851), .Q(
        n4830), .QN(n1459) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(n918), .CK(clk), .RN(n4851), 
        .Q(n4827), .QN(n1489) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(n924), .CK(clk), .RN(n4851), .Q(
        n4820), .QN(n1433) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(n926), .CK(clk), .RN(n4850), .Q(
        n4834), .QN(n1455) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(n927), .CK(clk), .RN(n4850), .Q(
        n4828), .QN(n1483) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(n929), .CK(clk), .RN(n4850), .Q(
        n4840), .QN(n1460) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(n595), .CK(clk), .RN(n4843), .Q(
        Raw_mant_NRM_SWR[18]), .QN(n4788) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(n590), .CK(clk), .RN(n4843), .Q(
        Raw_mant_NRM_SWR[23]), .QN(n4757) );
  DFFRX4TS SFT2FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n620), .CK(clk), .RN(n4843), .Q(
        n2563), .QN(n3725) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(n928), .CK(clk), .RN(n4850), .Q(
        n4819), .QN(n1482) );
  ADDFHX2TS DP_OP_15J43_122_6956_U8 ( .A(DP_OP_15J43_122_6956_n17), .B(
        DMP_exp_NRM2_EW[1]), .CI(DP_OP_15J43_122_6956_n8), .CO(
        DP_OP_15J43_122_6956_n7), .S(exp_rslt_NRM2_EW1[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(n805), .CK(clk), .RN(n4881), .Q(
        DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(n809), .CK(clk), .RN(n4871), .Q(
        DMP_EXP_EWSW[10]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(n558), .CK(clk), .RN(n3990), .QN(
        n1469) );
  CMPR32X2TS DP_OP_15J43_122_6956_U7 ( .A(DP_OP_15J43_122_6956_n16), .B(
        DMP_exp_NRM2_EW[2]), .C(DP_OP_15J43_122_6956_n7), .CO(
        DP_OP_15J43_122_6956_n6), .S(exp_rslt_NRM2_EW1[2]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U5 ( .A(DP_OP_15J43_122_6956_n14), .B(
        DMP_exp_NRM2_EW[4]), .CI(DP_OP_15J43_122_6956_n5), .CO(
        DP_OP_15J43_122_6956_n4), .S(exp_rslt_NRM2_EW1[4]) );
  INVX3TS U3 ( .A(n3978), .Y(n4443) );
  INVX4TS U4 ( .A(n4509), .Y(n3759) );
  OAI2BB1X1TS U5 ( .A0N(DmP_mant_SHT1_SW[17]), .A1N(n4740), .B0(n4539), .Y(
        n4601) );
  OAI2BB1X1TS U6 ( .A0N(DmP_mant_SHT1_SW[20]), .A1N(n4740), .B0(n4510), .Y(
        n4591) );
  BUFX3TS U7 ( .A(n4646), .Y(n4675) );
  OA21X2TS U8 ( .A0(n4264), .A1(n4263), .B0(n4262), .Y(n4268) );
  NAND2BX2TS U9 ( .AN(n4644), .B(beg_OP), .Y(n4646) );
  BUFX3TS U10 ( .A(n4211), .Y(n4206) );
  NAND2X1TS U11 ( .A(n1480), .B(n4693), .Y(n4370) );
  AO22X2TS U12 ( .A0(n3901), .A1(n4398), .B0(n2589), .B1(n4785), .Y(n3905) );
  NAND2X4TS U13 ( .A(n4021), .B(n2535), .Y(n4377) );
  OAI32X4TS U14 ( .A0(n4018), .A1(Raw_mant_NRM_SWR[11]), .A2(n3608), .B0(n4773), .B1(n4018), .Y(n4372) );
  NOR2X1TS U15 ( .A(n4231), .B(n3953), .Y(n3955) );
  CLKBUFX2TS U16 ( .A(n3605), .Y(n4696) );
  NAND2X4TS U17 ( .A(n3843), .B(n3842), .Y(n4303) );
  NAND3X1TS U18 ( .A(n3875), .B(n3879), .C(n3878), .Y(n4383) );
  OA22X1TS U19 ( .A0(n2536), .A1(n3623), .B0(n1459), .B1(intDX_EWSW[7]), .Y(
        n3875) );
  NAND2X1TS U20 ( .A(n1488), .B(intDY_EWSW[9]), .Y(n3878) );
  AND3X1TS U21 ( .A(n3878), .B(n2536), .C(n3623), .Y(n3881) );
  OAI21XLTS U22 ( .A0(n1489), .A1(intDY_EWSW[11]), .B0(n3882), .Y(n3883) );
  OAI21XLTS U23 ( .A0(n1439), .A1(n4786), .B0(n3906), .Y(n3908) );
  NOR2XLTS U24 ( .A(n1501), .B(n4775), .Y(n3822) );
  CLKINVX3TS U25 ( .A(n3978), .Y(n4447) );
  NAND2X1TS U26 ( .A(n4220), .B(n4219), .Y(n4264) );
  NOR2XLTS U27 ( .A(n4105), .B(n4640), .Y(n3944) );
  OAI211XLTS U28 ( .A0(n4131), .A1(n4498), .B0(n4130), .C0(n4132), .Y(n4137)
         );
  CLKINVX3TS U29 ( .A(n4698), .Y(n4665) );
  OAI21XLTS U30 ( .A0(n4158), .A1(n4157), .B0(n4156), .Y(n4159) );
  CLKINVX3TS U31 ( .A(n4206), .Y(n4041) );
  OAI21XLTS U32 ( .A0(n3944), .A1(n3943), .B0(n3942), .Y(n3945) );
  OAI21XLTS U33 ( .A0(n4054), .A1(n4053), .B0(n4052), .Y(n4055) );
  CLKINVX3TS U34 ( .A(n4675), .Y(n4259) );
  CLKINVX3TS U35 ( .A(n4701), .Y(n4737) );
  OAI21XLTS U36 ( .A0(n4283), .A1(n1482), .B0(n4279), .Y(n928) );
  OAI21XLTS U37 ( .A0(n4676), .A1(n1459), .B0(n4276), .Y(n889) );
  OAI21XLTS U38 ( .A0(n4676), .A1(n1432), .B0(n4273), .Y(n901) );
  OAI21XLTS U39 ( .A0(n2536), .A1(n4452), .B0(n4430), .Y(n661) );
  OAI21XLTS U40 ( .A0(n4459), .A1(n4458), .B0(n4457), .Y(n591) );
  OAI21XLTS U41 ( .A0(n4622), .A1(n4621), .B0(n4068), .Y(n549) );
  OAI21XLTS U42 ( .A0(n4280), .A1(n1439), .B0(n4251), .Y(n905) );
  OAI21XLTS U43 ( .A0(n2561), .A1(n4656), .B0(n4042), .Y(n745) );
  OAI21XLTS U44 ( .A0(n4272), .A1(n4271), .B0(n4270), .Y(n601) );
  OAI211XLTS U45 ( .A0(n4047), .A1(n4621), .B0(n4046), .C0(n4169), .Y(n552) );
  OAI21XLTS U46 ( .A0(n4283), .A1(n1477), .B0(n4239), .Y(n906) );
  OAI21XLTS U47 ( .A0(n1442), .A1(n4655), .B0(n4031), .Y(n707) );
  INVX2TS U48 ( .A(n4509), .Y(n3758) );
  AO21X1TS U49 ( .A0(n4670), .A1(n4755), .B0(n3979), .Y(n628) );
  AO21X1TS U50 ( .A0(n4670), .A1(n4753), .B0(n4669), .Y(n794) );
  INVX6TS U51 ( .A(n4416), .Y(n4452) );
  AO21X1TS U52 ( .A0(n4670), .A1(n4785), .B0(n3965), .Y(n1186) );
  AO21X1TS U53 ( .A0(n4670), .A1(n4786), .B0(n4666), .Y(n630) );
  OAI211X1TS U54 ( .A0(n3770), .A1(n4509), .B0(n4590), .C0(n4589), .Y(n842) );
  OAI211X1TS U55 ( .A0(n3768), .A1(n4509), .B0(n4579), .C0(n4578), .Y(n838) );
  OAI211X1TS U56 ( .A0(n4586), .A1(n4509), .B0(n4585), .C0(n4584), .Y(n837) );
  BUFX6TS U57 ( .A(n3987), .Y(n4416) );
  OAI211X1TS U58 ( .A0(n4600), .A1(n4509), .B0(n4599), .C0(n4598), .Y(n847) );
  INVX2TS U59 ( .A(n3922), .Y(n3921) );
  OR2X4TS U60 ( .A(n4508), .B(n4507), .Y(n4509) );
  AOI21X2TS U61 ( .A0(n3899), .A1(n4395), .B0(n3898), .Y(n3900) );
  AO22X1TS U62 ( .A0(exp_rslt_NRM2_EW1[7]), .A1(n4672), .B0(n4742), .B1(
        final_result_ieee[30]), .Y(n820) );
  AOI21X1TS U63 ( .A0(n3888), .A1(n4381), .B0(n3887), .Y(n3892) );
  OAI211X2TS U64 ( .A0(n4793), .A1(n4216), .B0(n4161), .C0(n4160), .Y(n4360)
         );
  INVX4TS U65 ( .A(n3737), .Y(n4547) );
  OAI21X1TS U66 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n4017), .B0(n2535), .Y(n4020)
         );
  AND2X2TS U67 ( .A(n1458), .B(intDY_EWSW[21]), .Y(n4400) );
  OAI21X1TS U68 ( .A0(n4483), .A1(n4482), .B0(n4481), .Y(n596) );
  OAI211X1TS U69 ( .A0(n3769), .A1(n4509), .B0(n4606), .C0(n4605), .Y(n855) );
  INVX4TS U70 ( .A(n4416), .Y(n4429) );
  INVX4TS U71 ( .A(n4416), .Y(n4445) );
  OR2X2TS U72 ( .A(n4467), .B(n4466), .Y(n4470) );
  INVX4TS U73 ( .A(n3978), .Y(n4438) );
  INVX4TS U74 ( .A(n3978), .Y(n4423) );
  INVX4TS U75 ( .A(n3978), .Y(n4450) );
  OR2X8TS U76 ( .A(n3922), .B(n4645), .Y(n3978) );
  NAND2X4TS U77 ( .A(n3745), .B(n4793), .Y(n4341) );
  NAND2X4TS U78 ( .A(n4657), .B(n3745), .Y(n4367) );
  AOI21X2TS U79 ( .A0(n3918), .A1(n3917), .B0(n4394), .Y(n3920) );
  INVX4TS U80 ( .A(n3733), .Y(n3745) );
  NAND2X2TS U81 ( .A(n3905), .B(n3904), .Y(n3918) );
  AO22X1TS U82 ( .A0(n3605), .A1(n4691), .B0(n4694), .B1(LZD_output_NRM2_EW[4]), .Y(n583) );
  AO22X1TS U83 ( .A0(n4742), .A1(final_result_ieee[31]), .B0(n4672), .B1(n4671), .Y(n614) );
  OAI22X2TS U84 ( .A0(n3900), .A1(n4400), .B0(n1487), .B1(intDY_EWSW[22]), .Y(
        n3901) );
  NAND2BX1TS U85 ( .AN(n4627), .B(n4626), .Y(n4629) );
  NAND2X4TS U86 ( .A(n4221), .B(n3827), .Y(n3947) );
  NAND2X4TS U87 ( .A(n3824), .B(n3823), .Y(n4112) );
  OAI22X1TS U88 ( .A0(n3884), .A1(n3883), .B0(n4749), .B1(n4774), .Y(n3885) );
  OAI21X1TS U89 ( .A0(n4280), .A1(n1483), .B0(n4277), .Y(n927) );
  OAI211X1TS U90 ( .A0(n4172), .A1(n4621), .B0(n4170), .C0(n4169), .Y(n553) );
  OAI21X1TS U91 ( .A0(n1516), .A1(n4041), .B0(n4199), .Y(n4165) );
  AO22X1TS U92 ( .A0(n4283), .A1(Data_Y[31]), .B0(n4673), .B1(intDY_EWSW[31]), 
        .Y(n865) );
  AO22X1TS U93 ( .A0(n4280), .A1(add_subt), .B0(n4675), .B1(intAS), .Y(n897)
         );
  AO22X1TS U94 ( .A0(n4674), .A1(intDX_EWSW[31]), .B0(n4676), .B1(Data_X[31]), 
        .Y(n898) );
  OAI211X1TS U95 ( .A0(n3675), .A1(n4012), .B0(n4011), .C0(n4791), .Y(n4013)
         );
  INVX4TS U96 ( .A(n4673), .Y(n4284) );
  INVX4TS U97 ( .A(n4675), .Y(n4256) );
  INVX4TS U98 ( .A(n4675), .Y(n4258) );
  INVX4TS U99 ( .A(n4540), .Y(n4537) );
  INVX4TS U100 ( .A(n4623), .Y(n4209) );
  NAND3X1TS U101 ( .A(n3836), .B(n3950), .C(n3952), .Y(n3837) );
  OAI211X2TS U102 ( .A0(n4793), .A1(n4350), .B0(n4187), .C0(n4186), .Y(n4363)
         );
  AOI2BB2X1TS U103 ( .B0(n3865), .B1(n4384), .A0N(n1455), .A1N(intDY_EWSW[3]), 
        .Y(n3869) );
  OR2X2TS U104 ( .A(n1480), .B(n4740), .Y(n3737) );
  INVX4TS U105 ( .A(n4696), .Y(n4740) );
  NAND2X2TS U106 ( .A(n3916), .B(n3915), .Y(n4394) );
  NAND2BX1TS U107 ( .AN(n2592), .B(n4778), .Y(n3801) );
  NOR2X1TS U108 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .Y(n4643) );
  NAND2X2TS U109 ( .A(LZD_output_NRM2_EW[0]), .B(n3725), .Y(
        DP_OP_15J43_122_6956_n18) );
  OR2X2TS U110 ( .A(n1430), .B(n4753), .Y(n3907) );
  INVX4TS U111 ( .A(n4745), .Y(n4645) );
  NOR2X1TS U112 ( .A(n3626), .B(n2557), .Y(n3826) );
  OAI21X1TS U113 ( .A0(n4495), .A1(n4494), .B0(n4493), .Y(n590) );
  OAI21X1TS U114 ( .A0(n1455), .A1(n4452), .B0(n4414), .Y(n816) );
  OAI21X1TS U115 ( .A0(n1463), .A1(n4452), .B0(n4433), .Y(n801) );
  OAI21X1TS U116 ( .A0(n1456), .A1(n4452), .B0(n4412), .Y(n806) );
  OAI21X1TS U117 ( .A0(n1489), .A1(n4452), .B0(n4428), .Y(n808) );
  OAI21X1TS U118 ( .A0(n1490), .A1(n4452), .B0(n4432), .Y(n802) );
  OAI21X1TS U119 ( .A0(n1486), .A1(n4452), .B0(n4442), .Y(n805) );
  AO21XLTS U120 ( .A0(n3964), .A1(n3963), .B0(n3962), .Y(n598) );
  OAI21X1TS U121 ( .A0(n1433), .A1(n4452), .B0(n4415), .Y(n814) );
  OAI21X1TS U122 ( .A0(n4409), .A1(n4714), .B0(n4408), .Y(n787) );
  OAI21X1TS U123 ( .A0(n1457), .A1(n4452), .B0(n4440), .Y(n804) );
  OAI21X1TS U124 ( .A0(n1438), .A1(n4452), .B0(n4420), .Y(n803) );
  AOI22X1TS U125 ( .A0(n4443), .A1(intDY_EWSW[18]), .B0(n4441), .B1(
        DMP_EXP_EWSW[18]), .Y(n4433) );
  OAI21X1TS U126 ( .A0(n4322), .A1(n4321), .B0(n4320), .Y(n592) );
  OAI211X1TS U127 ( .A0(n3769), .A1(n4576), .B0(n4575), .C0(n4574), .Y(n857)
         );
  AOI222X1TS U128 ( .A0(intDY_EWSW[6]), .A1(n4464), .B0(n4463), .B1(n3606), 
        .C0(n4446), .C1(DMP_EXP_EWSW[6]), .Y(n4461) );
  AOI222X1TS U129 ( .A0(n3607), .A1(n4464), .B0(n4463), .B1(intDY_EWSW[19]), 
        .C0(n4736), .C1(DmP_EXP_EWSW[19]), .Y(n4462) );
  OAI211X1TS U130 ( .A0(n4600), .A1(n4576), .B0(n4573), .C0(n4572), .Y(n849)
         );
  OAI211X1TS U131 ( .A0(n4613), .A1(n4576), .B0(n4571), .C0(n4570), .Y(n853)
         );
  OAI211X1TS U132 ( .A0(n4613), .A1(n4509), .B0(n4612), .C0(n4611), .Y(n851)
         );
  AOI222X1TS U133 ( .A0(n3606), .A1(n4464), .B0(n4463), .B1(intDY_EWSW[6]), 
        .C0(n4422), .C1(DmP_EXP_EWSW[6]), .Y(n4460) );
  OAI211X1TS U134 ( .A0(n3768), .A1(n4576), .B0(n4567), .C0(n4566), .Y(n840)
         );
  OAI211X1TS U135 ( .A0(n3770), .A1(n4576), .B0(n4569), .C0(n4568), .Y(n844)
         );
  AO21XLTS U136 ( .A0(n3977), .A1(n3976), .B0(n3975), .Y(n599) );
  OAI21X1TS U137 ( .A0(n4294), .A1(n4293), .B0(n4292), .Y(n594) );
  AOI21X2TS U138 ( .A0(n1505), .A1(n4800), .B0(n4318), .Y(n3806) );
  OAI211X1TS U139 ( .A0(n4596), .A1(n4576), .B0(n4565), .C0(n4564), .Y(n860)
         );
  OAI21X1TS U140 ( .A0(n4307), .A1(n4306), .B0(n4305), .Y(n593) );
  AOI22X1TS U141 ( .A0(n4269), .A1(n4271), .B0(n4665), .B1(
        Raw_mant_NRM_SWR[12]), .Y(n4270) );
  OAI21X1TS U142 ( .A0(n4236), .A1(n4235), .B0(n4234), .Y(n600) );
  OAI21X1TS U143 ( .A0(n4225), .A1(n4224), .B0(n4223), .Y(n602) );
  OAI211X1TS U144 ( .A0(n4356), .A1(n4340), .B0(n4334), .C0(n4338), .Y(n572)
         );
  OAI211X1TS U145 ( .A0(n4347), .A1(n4340), .B0(n4339), .C0(n4338), .Y(n570)
         );
  OAI211X1TS U146 ( .A0(n4353), .A1(n4340), .B0(n4331), .C0(n4338), .Y(n571)
         );
  INVX4TS U147 ( .A(n3734), .Y(n3757) );
  OAI21X1TS U148 ( .A0(n4618), .A1(n3733), .B0(n4330), .Y(n580) );
  OAI211X1TS U149 ( .A0(n4362), .A1(n4341), .B0(n4361), .C0(n4367), .Y(n568)
         );
  OAI21X1TS U150 ( .A0(n4618), .A1(n3731), .B0(n4327), .Y(n579) );
  OAI211X1TS U151 ( .A0(n4365), .A1(n4341), .B0(n4364), .C0(n4367), .Y(n567)
         );
  OAI211X1TS U152 ( .A0(n4369), .A1(n4340), .B0(n4333), .C0(n4338), .Y(n573)
         );
  OAI211X1TS U153 ( .A0(n4344), .A1(n4340), .B0(n4337), .C0(n4338), .Y(n569)
         );
  OAI211X1TS U154 ( .A0(n4359), .A1(n4340), .B0(n4332), .C0(n4338), .Y(n574)
         );
  OAI211X1TS U155 ( .A0(n4359), .A1(n4341), .B0(n4358), .C0(n4367), .Y(n566)
         );
  OAI211X1TS U156 ( .A0(n4369), .A1(n4341), .B0(n4368), .C0(n4367), .Y(n565)
         );
  OAI211X1TS U157 ( .A0(n4365), .A1(n4340), .B0(n4335), .C0(n4338), .Y(n575)
         );
  OAI21X1TS U158 ( .A0(n4622), .A1(n3733), .B0(n4329), .Y(n578) );
  OAI211X1TS U159 ( .A0(n4362), .A1(n4340), .B0(n4336), .C0(n4338), .Y(n576)
         );
  OAI211X1TS U160 ( .A0(n4356), .A1(n4341), .B0(n4355), .C0(n4367), .Y(n564)
         );
  OAI21X1TS U161 ( .A0(n4622), .A1(n3731), .B0(n4328), .Y(n577) );
  OAI211X1TS U162 ( .A0(n4341), .A1(n4344), .B0(n4343), .C0(n4367), .Y(n561)
         );
  OAI211X1TS U163 ( .A0(n4341), .A1(n4347), .B0(n4346), .C0(n4367), .Y(n562)
         );
  OAI211X1TS U164 ( .A0(n4353), .A1(n4341), .B0(n4352), .C0(n4367), .Y(n563)
         );
  OAI21X1TS U165 ( .A0(n3608), .A1(n4698), .B0(n4117), .Y(n603) );
  OAI21X1TS U166 ( .A0(n4485), .A1(n3747), .B0(n3862), .Y(n833) );
  OR2X4TS U167 ( .A(n4290), .B(n3841), .Y(n3843) );
  INVX4TS U168 ( .A(n3733), .Y(n3746) );
  OAI21X1TS U169 ( .A0(n4116), .A1(n4115), .B0(n4114), .Y(n4117) );
  NAND2X2TS U170 ( .A(n3840), .B(n3839), .Y(n4290) );
  NOR2X1TS U171 ( .A(n4218), .B(n4498), .Y(n4116) );
  OAI21X1TS U172 ( .A0(n4692), .A1(n4537), .B0(n4316), .Y(n836) );
  NOR2X1TS U173 ( .A(n3752), .B(n4688), .Y(n4689) );
  OAI21X1TS U174 ( .A0(n4684), .A1(n4768), .B0(n4055), .Y(n605) );
  OAI21X1TS U175 ( .A0(n4084), .A1(n4083), .B0(n4082), .Y(n606) );
  NOR2X1TS U176 ( .A(n4051), .B(n4477), .Y(n4054) );
  NAND2X2TS U177 ( .A(n4232), .B(n4229), .Y(n3800) );
  OAI21X1TS U178 ( .A0(n4684), .A1(n4802), .B0(n4148), .Y(n607) );
  OAI21X1TS U179 ( .A0(n3677), .A1(n4698), .B0(n4127), .Y(n608) );
  OAI21X1TS U180 ( .A0(n4147), .A1(n4146), .B0(n4145), .Y(n4148) );
  OAI211X1TS U181 ( .A0(n4344), .A1(n4215), .B0(n4205), .C0(n4204), .Y(n536)
         );
  OAI211X1TS U182 ( .A0(n4344), .A1(n4198), .B0(n4185), .C0(n4184), .Y(n557)
         );
  OAI211X1TS U183 ( .A0(n4356), .A1(n4215), .B0(n4208), .C0(n4207), .Y(n539)
         );
  OAI211X1TS U184 ( .A0(n4216), .A1(n4215), .B0(n4214), .C0(n4213), .Y(n534)
         );
  OAI211X1TS U185 ( .A0(n4365), .A1(n4215), .B0(n4201), .C0(n4200), .Y(n542)
         );
  OAI21X1TS U186 ( .A0(n4350), .A1(n4215), .B0(n4166), .Y(n535) );
  OAI211X1TS U187 ( .A0(n4216), .A1(n4198), .B0(n4092), .C0(n4091), .Y(n559)
         );
  OAI21X1TS U188 ( .A0(n2535), .A1(n4698), .B0(n4159), .Y(n609) );
  OAI211X1TS U189 ( .A0(n4353), .A1(n4198), .B0(n4193), .C0(n4192), .Y(n555)
         );
  OAI211X1TS U190 ( .A0(n4353), .A1(n4215), .B0(n4203), .C0(n4202), .Y(n538)
         );
  OAI211X1TS U191 ( .A0(n4365), .A1(n4198), .B0(n4189), .C0(n4188), .Y(n551)
         );
  NOR2X1TS U192 ( .A(n4144), .B(n4477), .Y(n4147) );
  OAI211X1TS U193 ( .A0(n4356), .A1(n4198), .B0(n4181), .C0(n4180), .Y(n554)
         );
  OAI21X1TS U194 ( .A0(n4350), .A1(n4198), .B0(n4103), .Y(n558) );
  OAI21X1TS U195 ( .A0(n4684), .A1(n4813), .B0(n4138), .Y(n610) );
  OAI211X1TS U196 ( .A0(n4362), .A1(n4198), .B0(n4197), .C0(n4196), .Y(n550)
         );
  OAI211X1TS U197 ( .A0(n4122), .A1(n4614), .B0(n4120), .C0(n4121), .Y(n4126)
         );
  AOI211X1TS U198 ( .A0(n4345), .A1(n4194), .B0(n4195), .C0(n4076), .Y(n1156)
         );
  OAI2BB2XLTS U199 ( .B0(n1452), .B1(n4537), .A0N(Raw_mant_NRM_SWR[24]), .A1N(
        n3761), .Y(n4484) );
  OAI211X1TS U200 ( .A0(n4362), .A1(n4215), .B0(n4163), .C0(n4162), .Y(n543)
         );
  OAI21X1TS U201 ( .A0(n4676), .A1(n1467), .B0(n4238), .Y(n872) );
  OAI21X1TS U202 ( .A0(n4258), .A1(n1458), .B0(n4243), .Y(n908) );
  OAI21X1TS U203 ( .A0(n4259), .A1(n1490), .B0(n4242), .Y(n912) );
  OAI21X1TS U204 ( .A0(n4280), .A1(n1457), .B0(n4274), .Y(n914) );
  OAI21X1TS U205 ( .A0(n4259), .A1(n1461), .B0(n4247), .Y(n909) );
  OAI21X1TS U206 ( .A0(n4258), .A1(n1486), .B0(n4248), .Y(n915) );
  OAI21X1TS U207 ( .A0(n4258), .A1(n1463), .B0(n4241), .Y(n911) );
  OAI21X1TS U208 ( .A0(n4283), .A1(n1464), .B0(n4246), .Y(n902) );
  OAI21X1TS U209 ( .A0(n4280), .A1(n1440), .B0(n4240), .Y(n904) );
  OAI21X1TS U210 ( .A0(n4259), .A1(n1487), .B0(n4245), .Y(n907) );
  OAI21X1TS U211 ( .A0(n4283), .A1(n1438), .B0(n4285), .Y(n913) );
  OAI21X1TS U212 ( .A0(n4283), .A1(n1488), .B0(n4253), .Y(n920) );
  OAI21X1TS U213 ( .A0(n4676), .A1(n2536), .B0(n4252), .Y(n888) );
  OAI21X1TS U214 ( .A0(n4256), .A1(n1456), .B0(n4257), .Y(n916) );
  OAI21X1TS U215 ( .A0(n4280), .A1(n1437), .B0(n4255), .Y(n919) );
  OAI21X1TS U216 ( .A0(n4280), .A1(n1491), .B0(n4244), .Y(n900) );
  OAI21X1TS U217 ( .A0(n4283), .A1(n1434), .B0(n4254), .Y(n925) );
  OAI21X1TS U218 ( .A0(n4280), .A1(n1489), .B0(n4282), .Y(n918) );
  OAI21X1TS U219 ( .A0(n4283), .A1(n1433), .B0(n4281), .Y(n924) );
  OAI21X1TS U220 ( .A0(n4676), .A1(n1430), .B0(n4249), .Y(n871) );
  OAI21X1TS U221 ( .A0(n4676), .A1(n73), .B0(n4260), .Y(n903) );
  OAI21X1TS U222 ( .A0(n4259), .A1(n2589), .B0(n4250), .Y(n873) );
  OAI21X1TS U223 ( .A0(n4676), .A1(n1460), .B0(n4278), .Y(n929) );
  OAI21X1TS U224 ( .A0(n4283), .A1(n1455), .B0(n4275), .Y(n926) );
  OAI21X1TS U225 ( .A0(n4258), .A1(n1431), .B0(n4237), .Y(n870) );
  NOR2X1TS U226 ( .A(n4151), .B(n4477), .Y(n4158) );
  NAND2BX1TS U227 ( .AN(n4064), .B(n4063), .Y(n4065) );
  OAI211X2TS U228 ( .A0(n4537), .A1(n1499), .B0(n4693), .C0(n4025), .Y(n4563)
         );
  OR2X6TS U229 ( .A(n4124), .B(n3785), .Y(n4140) );
  OAI21X1TS U230 ( .A0(n4155), .A1(n4498), .B0(n4154), .Y(n4156) );
  OAI211XLTS U231 ( .A0(n4749), .A1(n4774), .B0(n4389), .C0(n4388), .Y(n4390)
         );
  NOR2X1TS U232 ( .A(n3835), .B(n3833), .Y(n3834) );
  OAI21X1TS U233 ( .A0(n4124), .A1(n4640), .B0(n4123), .Y(n4125) );
  NAND2X2TS U234 ( .A(n3816), .B(n3815), .Y(n4142) );
  OAI211X2TS U235 ( .A0(n4356), .A1(n3747), .B0(n4191), .C0(n4190), .Y(n4351)
         );
  OAI21X2TS U236 ( .A0(n3615), .A1(n3737), .B0(n4533), .Y(n3741) );
  OAI211X2TS U237 ( .A0(n3730), .A1(n4842), .B0(n4067), .C0(n4060), .Y(n4616)
         );
  OAI21X1TS U238 ( .A0(n3796), .A1(n3795), .B0(n3794), .Y(n3797) );
  NAND2X4TS U239 ( .A(n3784), .B(n3783), .Y(n4124) );
  NAND2BX1TS U240 ( .AN(n4058), .B(n4057), .Y(n4059) );
  NAND2BX1TS U241 ( .AN(n4098), .B(n4087), .Y(n4088) );
  OAI211X2TS U242 ( .A0(n3730), .A1(n3660), .B0(n4067), .C0(n4066), .Y(n4619)
         );
  OAI21X1TS U243 ( .A0(n2533), .A1(n4707), .B0(n4032), .Y(n736) );
  OAI21X1TS U244 ( .A0(n2586), .A1(n4164), .B0(n4040), .Y(n718) );
  OAI21X1TS U245 ( .A0(n2573), .A1(n4661), .B0(n4034), .Y(n733) );
  OAI21X1TS U246 ( .A0(n2551), .A1(n4656), .B0(n4037), .Y(n769) );
  OAI21X1TS U247 ( .A0(n2582), .A1(n4707), .B0(n4036), .Y(n724) );
  OAI21X1TS U248 ( .A0(n2559), .A1(n4041), .B0(n4039), .Y(n748) );
  OAI21X1TS U249 ( .A0(n2599), .A1(n4164), .B0(n4033), .Y(n727) );
  OAI211X2TS U250 ( .A0(n4369), .A1(n3747), .B0(n4071), .C0(n4070), .Y(n4345)
         );
  OAI211X2TS U251 ( .A0(n4353), .A1(n4793), .B0(n4179), .C0(n4178), .Y(n4354)
         );
  OAI211X2TS U252 ( .A0(n3747), .A1(n4347), .B0(n4168), .C0(n4167), .Y(n4366)
         );
  NAND2BX1TS U253 ( .AN(n4098), .B(n4097), .Y(n4099) );
  OAI21X1TS U254 ( .A0(n2545), .A1(n4661), .B0(n4038), .Y(n784) );
  OAI21X1TS U255 ( .A0(n3619), .A1(n4164), .B0(n4035), .Y(n781) );
  OAI211X2TS U256 ( .A0(n4344), .A1(n3747), .B0(n3994), .C0(n3993), .Y(n4357)
         );
  OAI21X1TS U257 ( .A0(n1446), .A1(n4655), .B0(n4030), .Y(n702) );
  OAI211X2TS U258 ( .A0(n4359), .A1(n4793), .B0(n4183), .C0(n4182), .Y(n4342)
         );
  OAI21X1TS U259 ( .A0(n4733), .A1(n4043), .B0(n4734), .Y(n938) );
  OAI21X1TS U260 ( .A0(n3911), .A1(n73), .B0(n4755), .Y(n3913) );
  INVX3TS U261 ( .A(n4206), .Y(n4164) );
  INVX3TS U262 ( .A(n4206), .Y(n4661) );
  INVX3TS U263 ( .A(n4206), .Y(n4656) );
  NAND2X2TS U264 ( .A(n3812), .B(n4129), .Y(n4153) );
  INVX3TS U265 ( .A(n4693), .Y(n4545) );
  CLKBUFX3TS U266 ( .A(n4651), .Y(n3753) );
  OR2X2TS U267 ( .A(n4665), .B(OP_FLAG_SFG), .Y(n3851) );
  INVX3TS U268 ( .A(n3740), .Y(n3755) );
  INVX3TS U269 ( .A(n4703), .Y(n4655) );
  INVX1TS U270 ( .A(n4394), .Y(n4404) );
  NAND2BX1TS U271 ( .AN(n4636), .B(n4635), .Y(n4638) );
  NOR2X1TS U272 ( .A(Raw_mant_NRM_SWR[6]), .B(n3857), .Y(n3858) );
  INVX3TS U273 ( .A(n4668), .Y(n4446) );
  NAND4X1TS U274 ( .A(n3907), .B(n3903), .C(n3902), .D(n3909), .Y(n4406) );
  AO22X1TS U275 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n4733), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B1(n4792), .Y(n4644) );
  INVX3TS U276 ( .A(n4668), .Y(n4736) );
  INVX3TS U277 ( .A(n4668), .Y(n4422) );
  INVX3TS U278 ( .A(n4668), .Y(n4449) );
  NAND2X1TS U279 ( .A(n4262), .B(n4110), .Y(n3787) );
  CLKAND2X2TS U280 ( .A(n3874), .B(n3873), .Y(n3879) );
  INVX3TS U281 ( .A(n4745), .Y(n4441) );
  INVX2TS U282 ( .A(Shift_reg_FLAGS_7[0]), .Y(n4742) );
  NAND2BX1TS U283 ( .AN(n3638), .B(n4748), .Y(n4104) );
  NOR2X1TS U284 ( .A(LZD_output_NRM2_EW[3]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n15) );
  NOR2X1TS U285 ( .A(LZD_output_NRM2_EW[2]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n16) );
  NAND2BX1TS U286 ( .AN(n2584), .B(n4763), .Y(n3827) );
  CLKAND2X2TS U287 ( .A(n1503), .B(n4765), .Y(n4118) );
  NAND2X2TS U288 ( .A(intDY_EWSW[30]), .B(n1465), .Y(n4388) );
  NAND2BX1TS U289 ( .AN(n2592), .B(n2559), .Y(n3958) );
  NAND2BX1TS U290 ( .AN(n1431), .B(n73), .Y(n3903) );
  NAND3X1TS U291 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n4792), .C(n4752), .Y(n4734) );
  NAND2BX1TS U292 ( .AN(n2570), .B(n1520), .Y(n4624) );
  NOR2X2TS U293 ( .A(n2545), .B(n4756), .Y(n4135) );
  AOI21X4TS U294 ( .A0(n2578), .A1(DMP_SFG[21]), .B0(n3849), .Y(n4497) );
  AOI2BB1X2TS U295 ( .A0N(n2578), .A1N(DMP_SFG[21]), .B0(n4491), .Y(n3849) );
  NAND2X2TS U296 ( .A(n4119), .B(n3814), .Y(n3816) );
  NAND3X2TS U297 ( .A(n3800), .B(n4230), .C(n3799), .Y(n3802) );
  AOI22X4TS U298 ( .A0(n4455), .A1(n3807), .B0(n1517), .B1(n4797), .Y(n4489)
         );
  NOR2X4TS U299 ( .A(n4747), .B(Raw_mant_NRM_SWR[21]), .Y(n3998) );
  OAI21X2TS U300 ( .A0(n3892), .A1(n3891), .B0(n3890), .Y(n3896) );
  OAI211X1TS U301 ( .A0(n4341), .A1(n4350), .B0(n4349), .C0(n4367), .Y(n560)
         );
  OAI2BB1X4TS U302 ( .A0N(n2556), .A1N(n4762), .B0(n3940), .Y(n3824) );
  OAI22X2TS U303 ( .A0(n3897), .A1(n4399), .B0(intDY_EWSW[19]), .B1(n4780), 
        .Y(n3899) );
  AOI2BB2X2TS U304 ( .B0(n3896), .B1(n3895), .A0N(n1463), .A1N(intDY_EWSW[18]), 
        .Y(n3897) );
  OR2X1TS U305 ( .A(n2599), .B(n1505), .Y(n3845) );
  CLKAND2X2TS U306 ( .A(n1505), .B(n2599), .Y(n3846) );
  AOI2BB2XLTS U307 ( .B0(n4468), .B1(n4634), .A0N(n1519), .A1N(n2533), .Y(
        n3831) );
  AOI2BB1XLTS U308 ( .A0N(n4784), .A1N(n1499), .B0(Raw_mant_NRM_SWR[2]), .Y(
        n4017) );
  OR2X1TS U309 ( .A(n1506), .B(n2573), .Y(n3842) );
  CLKAND2X2TS U310 ( .A(n1506), .B(n2573), .Y(n3841) );
  BUFX3TS U311 ( .A(n4646), .Y(n4674) );
  OR2X1TS U312 ( .A(n1510), .B(n2558), .Y(n3948) );
  CLKAND2X2TS U313 ( .A(n4472), .B(n3828), .Y(n4634) );
  AO21XLTS U314 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n4000), .B0(
        Raw_mant_NRM_SWR[19]), .Y(n3997) );
  NAND3XLTS U315 ( .A(n4011), .B(n4000), .C(n4782), .Y(n4003) );
  NOR2XLTS U316 ( .A(Raw_mant_NRM_SWR[15]), .B(n3612), .Y(n4012) );
  NOR2XLTS U317 ( .A(n1503), .B(n4765), .Y(n3813) );
  INVX2TS U318 ( .A(n4487), .Y(n3762) );
  CLKBUFX2TS U319 ( .A(n4453), .Y(n4490) );
  NAND2X1TS U320 ( .A(n4218), .B(n4217), .Y(n4220) );
  NAND2X1TS U321 ( .A(n2584), .B(n4763), .Y(n4261) );
  NAND2X4TS U322 ( .A(n3802), .B(n3801), .Y(n3960) );
  OA21X1TS U323 ( .A0(n4051), .A1(n3938), .B0(n3937), .Y(n4105) );
  INVX4TS U324 ( .A(n3731), .Y(n3748) );
  AO22XLTS U325 ( .A0(Data_array_SWR[21]), .A1(n4175), .B0(n2580), .B1(n4095), 
        .Y(n4096) );
  NAND2X1TS U326 ( .A(n3935), .B(n4077), .Y(n4051) );
  NAND2X1TS U327 ( .A(n4080), .B(n4078), .Y(n3935) );
  OAI21XLTS U328 ( .A0(n4049), .A1(n4614), .B0(n4048), .Y(n4053) );
  INVX2TS U329 ( .A(n4261), .Y(n4263) );
  OR2X1TS U330 ( .A(n1510), .B(n4766), .Y(n4266) );
  INVX2TS U331 ( .A(n4490), .Y(n4498) );
  OAI21XLTS U332 ( .A0(n3660), .A1(n3743), .B0(n4056), .Y(n4058) );
  AO22XLTS U333 ( .A0(Data_array_SWR[20]), .A1(n4175), .B0(Data_array_SWR[24]), 
        .B1(n4095), .Y(n4086) );
  AO22XLTS U334 ( .A0(n3761), .A1(Raw_mant_NRM_SWR[17]), .B0(n4580), .B1(
        Raw_mant_NRM_SWR[8]), .Y(n4519) );
  AO21XLTS U335 ( .A0(DmP_mant_SHT1_SW[19]), .A1(n4545), .B0(n4538), .Y(n3736)
         );
  NAND2X1TS U336 ( .A(n1502), .B(n2548), .Y(n3818) );
  OR2X4TS U337 ( .A(n4142), .B(n3817), .Y(n3819) );
  CLKAND2X2TS U338 ( .A(n4528), .B(n4527), .Y(n4586) );
  NAND2BXLTS U339 ( .AN(n4693), .B(DmP_mant_SHT1_SW[1]), .Y(n4527) );
  AOI2BB2XLTS U340 ( .B0(Raw_mant_NRM_SWR[22]), .B1(n4580), .A0N(n3737), .A1N(
        n4813), .Y(n4528) );
  INVX2TS U341 ( .A(n3762), .Y(n3765) );
  BUFX3TS U342 ( .A(n4646), .Y(n4673) );
  AO21XLTS U343 ( .A0(DmP_mant_SHT1_SW[2]), .A1(n4545), .B0(n4525), .Y(n3742)
         );
  AO21XLTS U344 ( .A0(DmP_mant_SHT1_SW[6]), .A1(n4545), .B0(n4532), .Y(n3735)
         );
  AO22XLTS U345 ( .A0(n3761), .A1(Raw_mant_NRM_SWR[8]), .B0(
        Raw_mant_NRM_SWR[17]), .B1(n4544), .Y(n4532) );
  OAI211XLTS U346 ( .A0(n4813), .A1(n4377), .B0(n4312), .C0(n4311), .Y(n4313)
         );
  NOR2XLTS U347 ( .A(n4387), .B(n4386), .Y(n4389) );
  OA22X1TS U348 ( .A0(n1483), .A1(intDY_EWSW[2]), .B0(n1482), .B1(
        intDY_EWSW[1]), .Y(n3864) );
  NAND2BX1TS U349 ( .AN(n3886), .B(n3885), .Y(n3888) );
  AOI21X1TS U350 ( .A0(n3877), .A1(n3876), .B0(n4383), .Y(n3884) );
  NAND2X1TS U351 ( .A(n4486), .B(n4485), .Y(n4505) );
  INVX2TS U352 ( .A(n4504), .Y(n4508) );
  CLKAND2X2TS U353 ( .A(n4150), .B(n4149), .Y(n4155) );
  CLKAND2X2TS U354 ( .A(n1513), .B(DMP_SFG[3]), .Y(n3785) );
  OR2X1TS U355 ( .A(n1513), .B(DMP_SFG[3]), .Y(n4139) );
  OR2X1TS U356 ( .A(n1501), .B(DMP_SFG[6]), .Y(n3936) );
  NAND3X4TS U357 ( .A(n4140), .B(n4139), .C(n3786), .Y(n3931) );
  OR2X1TS U358 ( .A(n1502), .B(n4758), .Y(n3786) );
  NAND2BX1TS U359 ( .AN(Raw_mant_NRM_SWR[19]), .B(n3998), .Y(n4309) );
  AOI21X1TS U360 ( .A0(intDY_EWSW[5]), .A1(n1433), .B0(n3870), .Y(n4382) );
  INVX2TS U361 ( .A(n4383), .Y(n4385) );
  NAND2X1TS U362 ( .A(n1482), .B(intDY_EWSW[1]), .Y(n4396) );
  OR2X1TS U363 ( .A(n4751), .B(n1520), .Y(n4625) );
  NAND2BXLTS U364 ( .AN(n1513), .B(DMP_SFG[3]), .Y(n3815) );
  INVX2TS U365 ( .A(n4018), .Y(n4008) );
  AOI31XLTS U366 ( .A0(n3615), .A1(Raw_mant_NRM_SWR[8]), .A2(n4016), .B0(n4015), .Y(n4024) );
  NAND3BXLTS U367 ( .AN(n4022), .B(Raw_mant_NRM_SWR[6]), .C(n3616), .Y(n4023)
         );
  OAI21XLTS U368 ( .A0(Raw_mant_NRM_SWR[25]), .A1(n4014), .B0(n4013), .Y(n4015) );
  AND2X2TS U369 ( .A(n4227), .B(n4226), .Y(n4295) );
  NOR4X1TS U370 ( .A(exp_rslt_NRM2_EW1[7]), .B(exp_rslt_NRM2_EW1[2]), .C(
        exp_rslt_NRM2_EW1[4]), .D(n4323), .Y(n4227) );
  AO21XLTS U371 ( .A0(n4658), .A1(left_right_SHT2), .B0(n4657), .Y(n4659) );
  AO21XLTS U372 ( .A0(n4658), .A1(n4794), .B0(n4657), .Y(n4654) );
  AND4X1TS U373 ( .A(exp_rslt_NRM2_EW1[0]), .B(exp_rslt_NRM2_EW1[1]), .C(n4324), .D(n4323), .Y(n4325) );
  AND4X1TS U374 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[7]), .C(
        exp_rslt_NRM2_EW1[2]), .D(exp_rslt_NRM2_EW1[4]), .Y(n4324) );
  INVX2TS U375 ( .A(n4326), .Y(n4688) );
  AOI22X2TS U376 ( .A0(n4489), .A1(n3808), .B0(n2578), .B1(n4807), .Y(n4499)
         );
  AO22XLTS U377 ( .A0(n4697), .A1(DmP_mant_SHT1_SW[22]), .B0(n4703), .B1(
        DmP_EXP_EWSW[22]), .Y(n632) );
  AO22XLTS U378 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[15]), .B0(n4816), .B1(
        DmP_EXP_EWSW[15]), .Y(n646) );
  AOI2BB2XLTS U379 ( .B0(n3778), .B1(n3672), .A0N(DmP_EXP_EWSW[18]), .A1N(
        n4702), .Y(n640) );
  MX2X1TS U380 ( .A(Data_X[6]), .B(n3606), .S0(n4675), .Y(n923) );
  AOI2BB2XLTS U381 ( .B0(n4702), .B1(n3617), .A0N(DmP_EXP_EWSW[3]), .A1N(n4702), .Y(n670) );
  AOI2BB2XLTS U382 ( .B0(n4731), .B1(n3673), .A0N(DmP_EXP_EWSW[5]), .A1N(n4702), .Y(n666) );
  AOI2BB2XLTS U383 ( .B0(n4702), .B1(n3674), .A0N(DmP_EXP_EWSW[12]), .A1N(
        n4702), .Y(n652) );
  MX2X1TS U384 ( .A(DmP_EXP_EWSW[7]), .B(DmP_mant_SHT1_SW[7]), .S0(n3778), .Y(
        n662) );
  OAI211X1TS U385 ( .A0(n3768), .A1(n4561), .B0(n4531), .C0(n4530), .Y(n839)
         );
  MX2X1TS U386 ( .A(Data_Y[6]), .B(intDY_EWSW[6]), .S0(n4674), .Y(n890) );
  MX2X1TS U387 ( .A(Data_Y[19]), .B(intDY_EWSW[19]), .S0(n4646), .Y(n877) );
  AOI2BB2XLTS U388 ( .B0(n4232), .B1(n4496), .A0N(n4614), .A1N(n4231), .Y(
        n4236) );
  AOI2BB2XLTS U389 ( .B0(n3775), .B1(n4491), .A0N(n4489), .A1N(n4498), .Y(
        n4495) );
  OAI21XLTS U390 ( .A0(n4153), .A1(n3851), .B0(n4152), .Y(n4157) );
  OAI21XLTS U391 ( .A0(n4142), .A1(n3851), .B0(n4141), .Y(n4146) );
  OAI211XLTS U392 ( .A0(n4075), .A1(n4623), .B0(n4074), .C0(n4199), .Y(n537)
         );
  OAI21XLTS U393 ( .A0(n4485), .A1(n4794), .B0(n4537), .Y(n863) );
  MX2X1TS U394 ( .A(DMP_SFG[2]), .B(DMP_SHT2_EWSW[2]), .S0(n4656), .Y(n778) );
  MX2X1TS U395 ( .A(DMP_SFG[3]), .B(DMP_SHT2_EWSW[3]), .S0(n4164), .Y(n775) );
  MX2X1TS U396 ( .A(DMP_SFG[9]), .B(DMP_SHT2_EWSW[9]), .S0(n4707), .Y(n757) );
  MX2X1TS U397 ( .A(n4766), .B(DMP_SHT2_EWSW[10]), .S0(n4661), .Y(n754) );
  MX2X1TS U398 ( .A(n4758), .B(DMP_SHT2_EWSW[4]), .S0(n4661), .Y(n772) );
  MX2X1TS U399 ( .A(DMP_SFG[6]), .B(DMP_SHT2_EWSW[6]), .S0(n4707), .Y(n766) );
  MX2X1TS U400 ( .A(n4748), .B(DMP_SHT2_EWSW[7]), .S0(n4656), .Y(n763) );
  MX2X1TS U401 ( .A(n4761), .B(DMP_SHT2_EWSW[8]), .S0(n4164), .Y(n760) );
  MX2X1TS U402 ( .A(DMP_SHT2_EWSW[14]), .B(n4751), .S0(n4706), .Y(n742) );
  MX2X1TS U403 ( .A(DMP_SHT2_EWSW[15]), .B(n4750), .S0(n4706), .Y(n739) );
  MX2X1TS U404 ( .A(DMP_SHT2_EWSW[18]), .B(n4754), .S0(n4706), .Y(n730) );
  MX2X1TS U405 ( .A(DMP_SHT2_EWSW[21]), .B(DMP_SFG[21]), .S0(n4706), .Y(n721)
         );
  OAI21XLTS U406 ( .A0(n1469), .A1(n4041), .B0(n4169), .Y(n4102) );
  OAI211XLTS U407 ( .A0(n4172), .A1(n4623), .B0(n4171), .C0(n4199), .Y(n540)
         );
  OAI21XLTS U408 ( .A0(n3609), .A1(n4485), .B0(n4380), .Y(n835) );
  OAI21XLTS U409 ( .A0(n1493), .A1(n4485), .B0(n3760), .Y(n864) );
  OAI21XLTS U410 ( .A0(n4618), .A1(n4621), .B0(n4061), .Y(n548) );
  AOI2BB2XLTS U411 ( .B0(n4693), .B1(n4677), .A0N(LZD_output_NRM2_EW[1]), 
        .A1N(n4696), .Y(n584) );
  AO21XLTS U412 ( .A0(LZD_output_NRM2_EW[0]), .A1(n3779), .B0(n4678), .Y(n586)
         );
  NAND2BXLTS U413 ( .AN(SIGN_FLAG_SHT1SHT2), .B(n4688), .Y(n4671) );
  AOI2BB1XLTS U414 ( .A0N(overflow_flag), .A1N(n3750), .B0(n4672), .Y(n625) );
  AO21XLTS U415 ( .A0(n4742), .A1(underflow_flag), .B0(n4689), .Y(n626) );
  MX2X1TS U416 ( .A(Data_X[12]), .B(n4749), .S0(n4675), .Y(n917) );
  MX2X1TS U417 ( .A(Data_Y[0]), .B(intDY_EWSW[0]), .S0(n4674), .Y(n896) );
  MX2X1TS U418 ( .A(n4772), .B(DMP_SHT2_EWSW[11]), .S0(n4661), .Y(n751) );
  MX2X1TS U419 ( .A(Data_Y[12]), .B(intDY_EWSW[12]), .S0(n4675), .Y(n884) );
  OAI211XLTS U420 ( .A0(n4135), .A1(n3851), .B0(n4134), .C0(n4133), .Y(n4136)
         );
  MX2X1TS U421 ( .A(n4684), .B(Shift_reg_FLAGS_7[3]), .S0(n4741), .Y(n932) );
  MX2X1TS U422 ( .A(Data_X[30]), .B(n4815), .S0(n4673), .Y(n899) );
  AOI2BB2XLTS U423 ( .B0(n3776), .B1(n4303), .A0N(n4302), .A1N(n4640), .Y(
        n4307) );
  AO22XLTS U424 ( .A0(n4696), .A1(DMP_exp_NRM_EW[0]), .B0(n3779), .B1(
        DMP_exp_NRM2_EW[0]), .Y(n713) );
  OAI21XLTS U425 ( .A0(n4693), .A1(n3725), .B0(n3760), .Y(n620) );
  MX2X1TS U426 ( .A(Data_Y[28]), .B(intDY_EWSW[28]), .S0(n4647), .Y(n868) );
  OAI211XLTS U427 ( .A0(n4047), .A1(n4623), .B0(n3996), .C0(n4199), .Y(n541)
         );
  AOI2BB2XLTS U428 ( .B0(n4286), .B1(n4453), .A0N(n4290), .A1N(n4614), .Y(
        n4294) );
  OR2X1TS U429 ( .A(n4289), .B(n4288), .Y(n4293) );
  MX2X1TS U430 ( .A(Data_Y[4]), .B(intDY_EWSW[4]), .S0(n4675), .Y(n892) );
  MX2X1TS U431 ( .A(Data_Y[10]), .B(intDY_EWSW[10]), .S0(n4673), .Y(n886) );
  MX2X1TS U432 ( .A(Data_Y[14]), .B(intDY_EWSW[14]), .S0(n4647), .Y(n882) );
  MX2X1TS U433 ( .A(Data_Y[15]), .B(intDY_EWSW[15]), .S0(n4673), .Y(n881) );
  MX2X1TS U434 ( .A(Data_Y[16]), .B(intDY_EWSW[16]), .S0(n4673), .Y(n880) );
  MX2X1TS U435 ( .A(Data_Y[18]), .B(intDY_EWSW[18]), .S0(n4675), .Y(n878) );
  MX2X1TS U436 ( .A(Data_Y[20]), .B(intDY_EWSW[20]), .S0(n4674), .Y(n876) );
  MX2X1TS U437 ( .A(Data_X[8]), .B(n3623), .S0(n4647), .Y(n921) );
  MX2X1TS U438 ( .A(Data_Y[30]), .B(intDY_EWSW[30]), .S0(n4673), .Y(n866) );
  MX2X1TS U439 ( .A(Data_X[7]), .B(intDX_EWSW[7]), .S0(n4647), .Y(n922) );
  MX2X1TS U440 ( .A(Data_Y[5]), .B(intDY_EWSW[5]), .S0(n4647), .Y(n891) );
  MX2X1TS U441 ( .A(Data_Y[27]), .B(intDY_EWSW[27]), .S0(n4673), .Y(n869) );
  MX2X1TS U442 ( .A(Data_Y[2]), .B(intDY_EWSW[2]), .S0(n4673), .Y(n894) );
  MX2X1TS U443 ( .A(Data_Y[9]), .B(intDY_EWSW[9]), .S0(n4647), .Y(n887) );
  MX2X1TS U444 ( .A(Data_Y[1]), .B(intDY_EWSW[1]), .S0(n4647), .Y(n895) );
  MX2X1TS U445 ( .A(Data_Y[11]), .B(intDY_EWSW[11]), .S0(n4647), .Y(n885) );
  MX2X1TS U446 ( .A(Data_Y[13]), .B(intDY_EWSW[13]), .S0(n4647), .Y(n883) );
  MX2X1TS U447 ( .A(Data_Y[17]), .B(intDY_EWSW[17]), .S0(n4646), .Y(n879) );
  MX2X1TS U448 ( .A(Data_Y[21]), .B(intDY_EWSW[21]), .S0(n4674), .Y(n875) );
  MX2X1TS U449 ( .A(Data_Y[3]), .B(intDY_EWSW[3]), .S0(n4674), .Y(n893) );
  MX2X1TS U450 ( .A(Data_Y[22]), .B(intDY_EWSW[22]), .S0(n4673), .Y(n874) );
  AOI2BB2XLTS U451 ( .B0(n4685), .B1(n4684), .A0N(n4698), .A1N(
        Raw_mant_NRM_SWR[2]), .Y(n611) );
  AO22XLTS U452 ( .A0(n4731), .A1(Shift_amount_SHT1_EWR[1]), .B0(n4727), .B1(
        n4687), .Y(n831) );
  MX2X1TS U453 ( .A(Data_X[19]), .B(n3607), .S0(n4646), .Y(n910) );
  AOI2BB2XLTS U454 ( .B0(n4080), .B1(n4453), .A0N(n4079), .A1N(n3851), .Y(
        n4084) );
  MX2X1TS U455 ( .A(Data_Y[29]), .B(n3648), .S0(n4647), .Y(n867) );
  AO22XLTS U456 ( .A0(n4697), .A1(Shift_amount_SHT1_EWR[0]), .B0(n4703), .B1(
        n4690), .Y(n832) );
  OAI21XLTS U457 ( .A0(DmP_EXP_EWSW[23]), .A1(n1492), .B0(n4717), .Y(n4690) );
  AOI2BB2XLTS U458 ( .B0(beg_OP), .B1(n4792), .A0N(n4792), .A1N(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .Y(n4043) );
  AO22XLTS U459 ( .A0(n4693), .A1(DMP_exp_NRM_EW[2]), .B0(n3779), .B1(
        DMP_exp_NRM2_EW[2]), .Y(n703) );
  AO22XLTS U460 ( .A0(n3605), .A1(DMP_exp_NRM_EW[3]), .B0(n3779), .B1(
        DMP_exp_NRM2_EW[3]), .Y(n698) );
  AO22XLTS U461 ( .A0(n3605), .A1(DMP_exp_NRM_EW[5]), .B0(n4694), .B1(
        DMP_exp_NRM2_EW[5]), .Y(n688) );
  AO22XLTS U462 ( .A0(n3605), .A1(DMP_exp_NRM_EW[6]), .B0(n4694), .B1(
        DMP_exp_NRM2_EW[6]), .Y(n683) );
  AO22XLTS U463 ( .A0(n3605), .A1(DMP_exp_NRM_EW[7]), .B0(n4694), .B1(
        DMP_exp_NRM2_EW[7]), .Y(n678) );
  MX2X1TS U464 ( .A(OP_FLAG_SHT2), .B(OP_FLAG_SFG), .S0(n4706), .Y(n622) );
  AO22XLTS U465 ( .A0(n3605), .A1(DMP_exp_NRM_EW[1]), .B0(n4694), .B1(
        DMP_exp_NRM2_EW[1]), .Y(n708) );
  AO22XLTS U466 ( .A0(n3605), .A1(DMP_exp_NRM_EW[4]), .B0(n3779), .B1(
        DMP_exp_NRM2_EW[4]), .Y(n693) );
  OAI211XLTS U467 ( .A0(n3770), .A1(n4592), .B0(n4536), .C0(n4535), .Y(n845)
         );
  AOI2BB2XLTS U468 ( .B0(n4693), .B1(n4692), .A0N(LZD_output_NRM2_EW[2]), 
        .A1N(n3605), .Y(n585) );
  AO22XLTS U469 ( .A0(n4696), .A1(n4695), .B0(n4694), .B1(
        LZD_output_NRM2_EW[3]), .Y(n587) );
  AO22XLTS U470 ( .A0(n4696), .A1(SIGN_FLAG_NRM), .B0(n3779), .B1(
        SIGN_FLAG_SHT1SHT2), .Y(n615) );
  AO22XLTS U471 ( .A0(n4738), .A1(SIGN_FLAG_NRM), .B0(n4698), .B1(
        SIGN_FLAG_SFG), .Y(n616) );
  AO22XLTS U472 ( .A0(n4661), .A1(SIGN_FLAG_SHT2), .B0(n4706), .B1(
        SIGN_FLAG_SFG), .Y(n617) );
  AO22XLTS U473 ( .A0(n4737), .A1(SIGN_FLAG_SHT2), .B0(n4701), .B1(
        SIGN_FLAG_SHT1), .Y(n618) );
  AO22XLTS U474 ( .A0(n4697), .A1(SIGN_FLAG_SHT1), .B0(n4703), .B1(
        SIGN_FLAG_EXP), .Y(n619) );
  AO22XLTS U475 ( .A0(n4699), .A1(OP_FLAG_SHT2), .B0(n4711), .B1(OP_FLAG_SHT1), 
        .Y(n623) );
  AO22XLTS U476 ( .A0(n4697), .A1(OP_FLAG_SHT1), .B0(n4667), .B1(OP_FLAG_EXP), 
        .Y(n624) );
  AO22XLTS U477 ( .A0(n4697), .A1(DmP_mant_SHT1_SW[21]), .B0(n4667), .B1(
        DmP_EXP_EWSW[21]), .Y(n634) );
  AO22XLTS U478 ( .A0(n4697), .A1(DmP_mant_SHT1_SW[20]), .B0(n4667), .B1(
        DmP_EXP_EWSW[20]), .Y(n636) );
  AO22XLTS U479 ( .A0(n4697), .A1(DmP_mant_SHT1_SW[19]), .B0(n4727), .B1(
        DmP_EXP_EWSW[19]), .Y(n638) );
  AO22XLTS U480 ( .A0(n4697), .A1(DmP_mant_SHT1_SW[17]), .B0(n3777), .B1(
        DmP_EXP_EWSW[17]), .Y(n642) );
  AO22XLTS U481 ( .A0(n4697), .A1(DmP_mant_SHT1_SW[16]), .B0(n4816), .B1(
        DmP_EXP_EWSW[16]), .Y(n644) );
  AO22XLTS U482 ( .A0(n4697), .A1(DmP_mant_SHT1_SW[14]), .B0(n4816), .B1(
        DmP_EXP_EWSW[14]), .Y(n648) );
  AO22XLTS U483 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[13]), .B0(n4727), .B1(
        DmP_EXP_EWSW[13]), .Y(n650) );
  AO22XLTS U484 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[11]), .B0(n3777), .B1(
        DmP_EXP_EWSW[11]), .Y(n654) );
  AO22XLTS U485 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[10]), .B0(n4727), .B1(
        DmP_EXP_EWSW[10]), .Y(n656) );
  AO22XLTS U486 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[9]), .B0(n4727), .B1(
        DmP_EXP_EWSW[9]), .Y(n658) );
  AO22XLTS U487 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[6]), .B0(n4708), .B1(
        DmP_EXP_EWSW[6]), .Y(n664) );
  AO22XLTS U488 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[4]), .B0(n4727), .B1(
        DmP_EXP_EWSW[4]), .Y(n668) );
  AO22XLTS U489 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[2]), .B0(n4727), .B1(
        DmP_EXP_EWSW[2]), .Y(n672) );
  AO22XLTS U490 ( .A0(n4710), .A1(DmP_mant_SHT1_SW[1]), .B0(n4708), .B1(
        DmP_EXP_EWSW[1]), .Y(n674) );
  AO22XLTS U491 ( .A0(n4731), .A1(DmP_mant_SHT1_SW[0]), .B0(n4708), .B1(
        DmP_EXP_EWSW[0]), .Y(n676) );
  AO22XLTS U492 ( .A0(n4738), .A1(DMP_exp_NRM_EW[7]), .B0(n4704), .B1(
        DMP_SFG[30]), .Y(n679) );
  AO22XLTS U493 ( .A0(n4707), .A1(DMP_SHT2_EWSW[30]), .B0(n4706), .B1(
        DMP_SFG[30]), .Y(n680) );
  AO22XLTS U494 ( .A0(n4699), .A1(DMP_SHT2_EWSW[30]), .B0(n4711), .B1(
        DMP_SHT1_EWSW[30]), .Y(n681) );
  AO22XLTS U495 ( .A0(n4708), .A1(DMP_EXP_EWSW[30]), .B0(n4702), .B1(
        DMP_SHT1_EWSW[30]), .Y(n682) );
  AO22XLTS U496 ( .A0(n4705), .A1(DMP_exp_NRM_EW[6]), .B0(n4814), .B1(
        DMP_SFG[29]), .Y(n684) );
  AO22XLTS U497 ( .A0(n4656), .A1(DMP_SHT2_EWSW[29]), .B0(n4706), .B1(
        DMP_SFG[29]), .Y(n685) );
  AO22XLTS U498 ( .A0(n4699), .A1(DMP_SHT2_EWSW[29]), .B0(n4711), .B1(
        DMP_SHT1_EWSW[29]), .Y(n686) );
  MX2X1TS U499 ( .A(DMP_SHT1_EWSW[29]), .B(DMP_EXP_EWSW[29]), .S0(n3777), .Y(
        n687) );
  AO22XLTS U500 ( .A0(n4738), .A1(DMP_exp_NRM_EW[5]), .B0(n4704), .B1(
        DMP_SFG[28]), .Y(n689) );
  AO22XLTS U501 ( .A0(n4164), .A1(DMP_SHT2_EWSW[28]), .B0(n4211), .B1(
        DMP_SFG[28]), .Y(n690) );
  AO22XLTS U502 ( .A0(n4699), .A1(DMP_SHT2_EWSW[28]), .B0(n4711), .B1(
        DMP_SHT1_EWSW[28]), .Y(n691) );
  MX2X1TS U503 ( .A(DMP_SHT1_EWSW[28]), .B(DMP_EXP_EWSW[28]), .S0(n4667), .Y(
        n692) );
  AO22XLTS U504 ( .A0(n4738), .A1(DMP_exp_NRM_EW[4]), .B0(n4698), .B1(
        DMP_SFG[27]), .Y(n694) );
  AO22XLTS U505 ( .A0(n4661), .A1(DMP_SHT2_EWSW[27]), .B0(n4211), .B1(
        DMP_SFG[27]), .Y(n695) );
  AO22XLTS U506 ( .A0(n4699), .A1(DMP_SHT2_EWSW[27]), .B0(n4711), .B1(
        DMP_SHT1_EWSW[27]), .Y(n696) );
  MX2X1TS U507 ( .A(DMP_SHT1_EWSW[27]), .B(DMP_EXP_EWSW[27]), .S0(n4667), .Y(
        n697) );
  AO22XLTS U508 ( .A0(n4705), .A1(DMP_exp_NRM_EW[3]), .B0(n4704), .B1(
        DMP_SFG[26]), .Y(n699) );
  AO22XLTS U509 ( .A0(n4707), .A1(DMP_SHT2_EWSW[26]), .B0(n4700), .B1(
        DMP_SFG[26]), .Y(n700) );
  AO22XLTS U510 ( .A0(n4699), .A1(DMP_SHT2_EWSW[26]), .B0(n4711), .B1(
        DMP_SHT1_EWSW[26]), .Y(n701) );
  AO22XLTS U511 ( .A0(n4705), .A1(DMP_exp_NRM_EW[2]), .B0(n4704), .B1(
        DMP_SFG[25]), .Y(n704) );
  AO22XLTS U512 ( .A0(n4656), .A1(DMP_SHT2_EWSW[25]), .B0(n4700), .B1(
        DMP_SFG[25]), .Y(n705) );
  AO22XLTS U513 ( .A0(n4699), .A1(DMP_SHT2_EWSW[25]), .B0(n4711), .B1(
        DMP_SHT1_EWSW[25]), .Y(n706) );
  AO22XLTS U514 ( .A0(n4705), .A1(DMP_exp_NRM_EW[1]), .B0(n4704), .B1(
        DMP_SFG[24]), .Y(n709) );
  AO22XLTS U515 ( .A0(n4164), .A1(DMP_SHT2_EWSW[24]), .B0(n4700), .B1(
        DMP_SFG[24]), .Y(n710) );
  AO22XLTS U516 ( .A0(n4712), .A1(DMP_SHT2_EWSW[24]), .B0(busy), .B1(
        DMP_SHT1_EWSW[24]), .Y(n711) );
  AO22XLTS U517 ( .A0(n4703), .A1(n4887), .B0(n4702), .B1(DMP_SHT1_EWSW[24]), 
        .Y(n712) );
  AO22XLTS U518 ( .A0(n4705), .A1(DMP_exp_NRM_EW[0]), .B0(n4704), .B1(
        DMP_SFG[23]), .Y(n714) );
  AO22XLTS U519 ( .A0(n4661), .A1(DMP_SHT2_EWSW[23]), .B0(n4706), .B1(
        DMP_SFG[23]), .Y(n715) );
  AO22XLTS U520 ( .A0(n4712), .A1(DMP_SHT2_EWSW[23]), .B0(busy), .B1(
        DMP_SHT1_EWSW[23]), .Y(n716) );
  AOI2BB2XLTS U521 ( .B0(n1492), .B1(n4667), .A0N(n3777), .A1N(
        DMP_SHT1_EWSW[23]), .Y(n717) );
  AO22XLTS U522 ( .A0(n4712), .A1(DMP_SHT2_EWSW[22]), .B0(n4709), .B1(
        DMP_SHT1_EWSW[22]), .Y(n719) );
  MX2X1TS U523 ( .A(DMP_SHT1_EWSW[22]), .B(DMP_EXP_EWSW[22]), .S0(n4703), .Y(
        n720) );
  AO22XLTS U524 ( .A0(n4712), .A1(DMP_SHT2_EWSW[21]), .B0(busy), .B1(
        DMP_SHT1_EWSW[21]), .Y(n722) );
  MX2X1TS U525 ( .A(DMP_SHT1_EWSW[21]), .B(DMP_EXP_EWSW[21]), .S0(n4703), .Y(
        n723) );
  AO22XLTS U526 ( .A0(n4712), .A1(DMP_SHT2_EWSW[20]), .B0(n4709), .B1(
        DMP_SHT1_EWSW[20]), .Y(n725) );
  MX2X1TS U527 ( .A(DMP_SHT1_EWSW[20]), .B(DMP_EXP_EWSW[20]), .S0(n3777), .Y(
        n726) );
  AO22XLTS U528 ( .A0(n4712), .A1(DMP_SHT2_EWSW[19]), .B0(n4709), .B1(
        DMP_SHT1_EWSW[19]), .Y(n728) );
  AO22XLTS U529 ( .A0(n4710), .A1(DMP_SHT1_EWSW[19]), .B0(n4708), .B1(
        DMP_EXP_EWSW[19]), .Y(n729) );
  AO22XLTS U530 ( .A0(n4712), .A1(DMP_SHT2_EWSW[18]), .B0(busy), .B1(
        DMP_SHT1_EWSW[18]), .Y(n731) );
  MX2X1TS U531 ( .A(DMP_SHT1_EWSW[18]), .B(DMP_EXP_EWSW[18]), .S0(n4708), .Y(
        n732) );
  AO22XLTS U532 ( .A0(n4712), .A1(DMP_SHT2_EWSW[17]), .B0(n4711), .B1(
        DMP_SHT1_EWSW[17]), .Y(n734) );
  MX2X1TS U533 ( .A(DMP_SHT1_EWSW[17]), .B(DMP_EXP_EWSW[17]), .S0(n4667), .Y(
        n735) );
  AO22XLTS U534 ( .A0(n4712), .A1(DMP_SHT2_EWSW[16]), .B0(n4711), .B1(
        DMP_SHT1_EWSW[16]), .Y(n737) );
  MX2X1TS U535 ( .A(DMP_SHT1_EWSW[16]), .B(DMP_EXP_EWSW[16]), .S0(n4667), .Y(
        n738) );
  AO22XLTS U536 ( .A0(n4712), .A1(DMP_SHT2_EWSW[15]), .B0(n4713), .B1(
        DMP_SHT1_EWSW[15]), .Y(n740) );
  MX2X1TS U537 ( .A(DMP_SHT1_EWSW[15]), .B(DMP_EXP_EWSW[15]), .S0(n4667), .Y(
        n741) );
  AO22XLTS U538 ( .A0(n4737), .A1(DMP_SHT2_EWSW[14]), .B0(n4713), .B1(
        DMP_SHT1_EWSW[14]), .Y(n743) );
  MX2X1TS U539 ( .A(DMP_SHT1_EWSW[14]), .B(DMP_EXP_EWSW[14]), .S0(n4667), .Y(
        n744) );
  AO22XLTS U540 ( .A0(n4746), .A1(DMP_SHT2_EWSW[13]), .B0(DMP_SHT1_EWSW[13]), 
        .B1(n4713), .Y(n746) );
  MX2X1TS U541 ( .A(DMP_EXP_EWSW[13]), .B(DMP_SHT1_EWSW[13]), .S0(n3778), .Y(
        n747) );
  AO22XLTS U542 ( .A0(DMP_SHT1_EWSW[12]), .A1(n4709), .B0(DMP_SHT2_EWSW[12]), 
        .B1(n4737), .Y(n749) );
  AO22XLTS U543 ( .A0(n4731), .A1(DMP_SHT1_EWSW[12]), .B0(n4708), .B1(
        DMP_EXP_EWSW[12]), .Y(n750) );
  AO22XLTS U544 ( .A0(n4746), .A1(DMP_SHT2_EWSW[11]), .B0(DMP_SHT1_EWSW[11]), 
        .B1(n4713), .Y(n752) );
  MX2X1TS U545 ( .A(DMP_EXP_EWSW[11]), .B(DMP_SHT1_EWSW[11]), .S0(n3778), .Y(
        n753) );
  AO22XLTS U546 ( .A0(n4746), .A1(DMP_SHT2_EWSW[10]), .B0(DMP_SHT1_EWSW[10]), 
        .B1(n4713), .Y(n755) );
  MX2X1TS U547 ( .A(DMP_EXP_EWSW[10]), .B(DMP_SHT1_EWSW[10]), .S0(n4655), .Y(
        n756) );
  AO22XLTS U548 ( .A0(n4746), .A1(DMP_SHT2_EWSW[9]), .B0(DMP_SHT1_EWSW[9]), 
        .B1(n4709), .Y(n758) );
  MX2X1TS U549 ( .A(DMP_EXP_EWSW[9]), .B(DMP_SHT1_EWSW[9]), .S0(n4655), .Y(
        n759) );
  AO22XLTS U550 ( .A0(DMP_SHT1_EWSW[8]), .A1(n4709), .B0(DMP_SHT2_EWSW[8]), 
        .B1(n4737), .Y(n761) );
  AO22XLTS U551 ( .A0(n4731), .A1(DMP_SHT1_EWSW[8]), .B0(n3777), .B1(
        DMP_EXP_EWSW[8]), .Y(n762) );
  AO22XLTS U552 ( .A0(DMP_SHT1_EWSW[7]), .A1(n4709), .B0(DMP_SHT2_EWSW[7]), 
        .B1(n4737), .Y(n1527) );
  AO22XLTS U553 ( .A0(n4731), .A1(DMP_SHT1_EWSW[7]), .B0(n4708), .B1(
        DMP_EXP_EWSW[7]), .Y(n765) );
  AO22XLTS U554 ( .A0(DMP_SHT1_EWSW[6]), .A1(n4709), .B0(DMP_SHT2_EWSW[6]), 
        .B1(n4737), .Y(n1528) );
  AO22XLTS U555 ( .A0(n4731), .A1(DMP_SHT1_EWSW[6]), .B0(n4708), .B1(
        DMP_EXP_EWSW[6]), .Y(n768) );
  AO22XLTS U556 ( .A0(n4746), .A1(DMP_SHT2_EWSW[5]), .B0(DMP_SHT1_EWSW[5]), 
        .B1(n4713), .Y(n1529) );
  MX2X1TS U557 ( .A(DMP_EXP_EWSW[5]), .B(DMP_SHT1_EWSW[5]), .S0(n3778), .Y(
        n771) );
  AO22XLTS U558 ( .A0(n4746), .A1(DMP_SHT2_EWSW[4]), .B0(DMP_SHT1_EWSW[4]), 
        .B1(n4713), .Y(n1530) );
  MX2X1TS U559 ( .A(DMP_EXP_EWSW[4]), .B(DMP_SHT1_EWSW[4]), .S0(n4655), .Y(
        n774) );
  AO22XLTS U560 ( .A0(n4746), .A1(DMP_SHT2_EWSW[3]), .B0(DMP_SHT1_EWSW[3]), 
        .B1(n4713), .Y(n1531) );
  MX2X1TS U561 ( .A(DMP_EXP_EWSW[3]), .B(DMP_SHT1_EWSW[3]), .S0(n3778), .Y(
        n777) );
  AO22XLTS U562 ( .A0(n4746), .A1(DMP_SHT2_EWSW[2]), .B0(DMP_SHT1_EWSW[2]), 
        .B1(n4713), .Y(n1532) );
  MX2X1TS U563 ( .A(DMP_EXP_EWSW[2]), .B(DMP_SHT1_EWSW[2]), .S0(n4655), .Y(
        n780) );
  AO22XLTS U564 ( .A0(n4746), .A1(DMP_SHT2_EWSW[1]), .B0(DMP_SHT1_EWSW[1]), 
        .B1(n4709), .Y(n1533) );
  MX2X1TS U565 ( .A(DMP_EXP_EWSW[1]), .B(DMP_SHT1_EWSW[1]), .S0(n4655), .Y(
        n783) );
  AO22XLTS U566 ( .A0(n4746), .A1(DMP_SHT2_EWSW[0]), .B0(DMP_SHT1_EWSW[0]), 
        .B1(n4713), .Y(n1534) );
  MX2X1TS U567 ( .A(DMP_EXP_EWSW[0]), .B(DMP_SHT1_EWSW[0]), .S0(n4655), .Y(
        n786) );
  NAND4BXLTS U568 ( .AN(n4406), .B(n4405), .C(n4404), .D(n4403), .Y(n4407) );
  AO22XLTS U569 ( .A0(n4884), .A1(OP_FLAG_EXP), .B0(n4745), .B1(n4716), .Y(
        n788) );
  AOI2BB2XLTS U570 ( .B0(intDX_EWSW[31]), .B1(n4715), .A0N(n4715), .A1N(
        intDX_EWSW[31]), .Y(n4716) );
  AO22XLTS U571 ( .A0(n4731), .A1(Shift_amount_SHT1_EWR[4]), .B0(n4708), .B1(
        n4723), .Y(n828) );
  AO21XLTS U572 ( .A0(n1445), .A1(n4805), .B0(n4720), .Y(n4722) );
  AO22XLTS U573 ( .A0(n4731), .A1(Shift_amount_SHT1_EWR[3]), .B0(n3777), .B1(
        n4726), .Y(n829) );
  AO22XLTS U574 ( .A0(n4731), .A1(Shift_amount_SHT1_EWR[2]), .B0(n4703), .B1(
        n4730), .Y(n830) );
  NAND2X4TS U575 ( .A(n4657), .B(n3748), .Y(n4338) );
  INVX4TS U576 ( .A(n3734), .Y(n3756) );
  CLKINVX3TS U577 ( .A(n3732), .Y(n3767) );
  OA21XLTS U578 ( .A0(n4693), .A1(n3671), .B0(n4534), .Y(n3729) );
  OR3X2TS U579 ( .A(shift_value_SHT2_EWR[4]), .B(shift_value_SHT2_EWR[2]), .C(
        n3609), .Y(n3730) );
  OR2X2TS U580 ( .A(n4794), .B(n4743), .Y(n3731) );
  OR2X2TS U581 ( .A(n4504), .B(n4505), .Y(n3732) );
  OR2X2TS U582 ( .A(left_right_SHT2), .B(n4743), .Y(n3733) );
  OR2X2TS U583 ( .A(n4505), .B(n4508), .Y(n3734) );
  OAI21X2TS U584 ( .A0(n4802), .A1(n3737), .B0(n4546), .Y(n3738) );
  OAI21X2TS U585 ( .A0(n4773), .A1(n3737), .B0(n4514), .Y(n3739) );
  OR2X1TS U586 ( .A(shift_value_SHT2_EWR[4]), .B(n4085), .Y(n3740) );
  NOR2X4TS U587 ( .A(shift_value_SHT2_EWR[4]), .B(n4094), .Y(n4651) );
  CLKINVX3TS U588 ( .A(rst), .Y(n4027) );
  BUFX3TS U589 ( .A(n4816), .Y(n4667) );
  INVX2TS U590 ( .A(n4650), .Y(n3743) );
  INVX2TS U591 ( .A(n3743), .Y(n3744) );
  INVX2TS U592 ( .A(shift_value_SHT2_EWR[4]), .Y(n3747) );
  INVX4TS U593 ( .A(n3731), .Y(n3749) );
  INVX2TS U594 ( .A(n4883), .Y(n3750) );
  INVX2TS U595 ( .A(n3750), .Y(n3751) );
  INVX2TS U596 ( .A(n3750), .Y(n3752) );
  INVX2TS U597 ( .A(n3740), .Y(n3754) );
  INVX2TS U598 ( .A(n4547), .Y(n3760) );
  INVX2TS U599 ( .A(n3760), .Y(n3761) );
  INVX2TS U600 ( .A(n3762), .Y(n3763) );
  INVX2TS U601 ( .A(n3762), .Y(n3764) );
  INVX4TS U602 ( .A(n3732), .Y(n3766) );
  BUFX3TS U603 ( .A(n4027), .Y(n3988) );
  BUFX3TS U604 ( .A(n4027), .Y(n3989) );
  CLKBUFX3TS U605 ( .A(n4027), .Y(n3992) );
  AOI211X2TS U606 ( .A0(Shift_amount_SHT1_EWR[0]), .A1(n4740), .B0(n4678), 
        .C0(n4547), .Y(n4486) );
  AOI22X1TS U607 ( .A0(n3852), .A1(n3774), .B0(n4738), .B1(
        Raw_mant_NRM_SWR[25]), .Y(n3853) );
  AOI211X1TS U608 ( .A0(n4375), .A1(n4374), .B0(n4373), .C0(n4372), .Y(n4376)
         );
  AOI211X1TS U609 ( .A0(n4021), .A1(n4020), .B0(n4019), .C0(n4372), .Y(n4312)
         );
  NOR2X2TS U610 ( .A(n4693), .B(n4737), .Y(n4379) );
  NAND2X2TS U611 ( .A(n1493), .B(n4094), .Y(n4093) );
  OAI211X4TS U612 ( .A0(n4365), .A1(n4793), .B0(n4101), .C0(n4100), .Y(n4348)
         );
  OAI2BB1X2TS U613 ( .A0N(n4842), .A1N(n4177), .B0(n4093), .Y(n4347) );
  INVX2TS U614 ( .A(n3742), .Y(n3768) );
  INVX2TS U615 ( .A(n3736), .Y(n3769) );
  INVX2TS U616 ( .A(n3735), .Y(n3770) );
  OAI21X2TS U617 ( .A0(n3615), .A1(n4537), .B0(n4522), .Y(n4610) );
  INVX2TS U618 ( .A(n3729), .Y(n3771) );
  OAI21X2TS U619 ( .A0(n3616), .A1(n4537), .B0(n4521), .Y(n4603) );
  OAI21X2TS U620 ( .A0(n2580), .A1(n4094), .B0(n4093), .Y(n4216) );
  INVX2TS U621 ( .A(n3730), .Y(n3772) );
  INVX2TS U622 ( .A(n3730), .Y(n3773) );
  OAI21X2TS U623 ( .A0(n3608), .A1(n4537), .B0(n4520), .Y(n4609) );
  OAI21X2TS U624 ( .A0(n4549), .A1(n3617), .B0(n4529), .Y(n4587) );
  OAI21X2TS U625 ( .A0(n4549), .A1(n3673), .B0(n4548), .Y(n4588) );
  OAI21X2TS U626 ( .A0(n4549), .A1(n3674), .B0(n4515), .Y(n4607) );
  NOR2X2TS U627 ( .A(n4779), .B(n4174), .Y(n4098) );
  AOI22X1TS U628 ( .A0(n4500), .A1(n4502), .B0(n4738), .B1(
        Raw_mant_NRM_SWR[24]), .Y(n4501) );
  NOR2X2TS U629 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n4752), .Y(n4733)
         );
  BUFX3TS U630 ( .A(n4027), .Y(n3990) );
  BUFX3TS U631 ( .A(busy), .Y(n4709) );
  OAI21X2TS U632 ( .A0(Data_array_SWR[24]), .A1(n4094), .B0(n4093), .Y(n4350)
         );
  OAI21X2TS U633 ( .A0(n4549), .A1(n3672), .B0(n4541), .Y(n4604) );
  OAI21XLTS U634 ( .A0(n4596), .A1(n4592), .B0(n4488), .Y(n861) );
  AOI21X2TS U635 ( .A0(DmP_mant_SHT1_SW[22]), .A1(n4740), .B0(n4484), .Y(n4596) );
  OAI211XLTS U636 ( .A0(n4613), .A1(n4592), .B0(n4558), .C0(n4557), .Y(n854)
         );
  AOI21X2TS U637 ( .A0(DmP_mant_SHT1_SW[15]), .A1(n4545), .B0(n4519), .Y(n4613) );
  AOI21X2TS U638 ( .A0(n4177), .A1(Data_array_SWR[18]), .B0(n3995), .Y(n4359)
         );
  OAI21X2TS U639 ( .A0(n4789), .A1(n3737), .B0(n4516), .Y(n4597) );
  INVX2TS U640 ( .A(n3851), .Y(n3774) );
  INVX2TS U641 ( .A(n3851), .Y(n3775) );
  INVX2TS U642 ( .A(n3851), .Y(n3776) );
  CLKBUFX2TS U643 ( .A(n4816), .Y(n3777) );
  OR2X4TS U644 ( .A(n4623), .B(shift_value_SHT2_EWR[4]), .Y(n4198) );
  OA22X1TS U645 ( .A0(n1433), .A1(intDY_EWSW[5]), .B0(n1434), .B1(
        intDY_EWSW[4]), .Y(n3868) );
  OAI21XLTS U646 ( .A0(n3881), .A1(n3880), .B0(n3879), .Y(n3882) );
  NOR2X1TS U647 ( .A(n3788), .B(n4109), .Y(n3789) );
  NOR2XLTS U648 ( .A(n3619), .B(n4764), .Y(n3781) );
  OAI21XLTS U649 ( .A0(n3613), .A1(Raw_mant_NRM_SWR[21]), .B0(n4783), .Y(n4010) );
  OR2X1TS U650 ( .A(n1520), .B(n2570), .Y(n4471) );
  AOI21X1TS U651 ( .A0(n3793), .A1(n3792), .B0(n3791), .Y(n3794) );
  OAI21XLTS U652 ( .A0(n4842), .A1(n3743), .B0(n4062), .Y(n4064) );
  NAND2X1TS U653 ( .A(n2545), .B(n3627), .Y(n4680) );
  OAI21XLTS U654 ( .A0(n4112), .A1(n4614), .B0(n4111), .Y(n4115) );
  OAI21XLTS U655 ( .A0(n3940), .A1(n4614), .B0(n3939), .Y(n3943) );
  OR2X1TS U656 ( .A(n1509), .B(n4772), .Y(n4230) );
  NOR2X2TS U657 ( .A(n3955), .B(n3954), .Y(n3972) );
  NAND2X4TS U658 ( .A(n4672), .B(n4688), .Y(n4743) );
  XOR2X1TS U659 ( .A(n3810), .B(DmP_mant_SFG_SWR_25_), .Y(n3854) );
  INVX2TS U660 ( .A(n3756), .Y(n4561) );
  BUFX3TS U661 ( .A(n3987), .Y(n4463) );
  NOR2X4TS U662 ( .A(n3921), .B(n4645), .Y(n3987) );
  BUFX3TS U663 ( .A(n3987), .Y(n4670) );
  OAI211XLTS U664 ( .A0(n3768), .A1(n4592), .B0(n4556), .C0(n4555), .Y(n841)
         );
  OAI21XLTS U665 ( .A0(n4816), .A1(n3671), .B0(n4029), .Y(n660) );
  AND2X2TS U666 ( .A(n1469), .B(n2597), .Y(n4679) );
  NAND2X2TS U667 ( .A(n4679), .B(n4680), .Y(n3780) );
  OR2X2TS U668 ( .A(n3627), .B(n2545), .Y(n4681) );
  NAND2X2TS U669 ( .A(n3780), .B(n4681), .Y(n4131) );
  OR2X4TS U670 ( .A(n4131), .B(n3781), .Y(n4150) );
  NAND2X1TS U671 ( .A(n4764), .B(n3619), .Y(n4149) );
  OA21XLTS U672 ( .A0(DMP_SFG[2]), .A1(n1503), .B0(n4149), .Y(n3782) );
  NAND2X2TS U673 ( .A(n4150), .B(n3782), .Y(n3784) );
  NAND2X1TS U674 ( .A(n1503), .B(DMP_SFG[2]), .Y(n3783) );
  NAND2BX2TS U675 ( .AN(n2584), .B(DMP_SFG[9]), .Y(n4262) );
  NOR2X1TS U676 ( .A(n3626), .B(n4761), .Y(n4110) );
  NAND2X2TS U677 ( .A(n3787), .B(n4261), .Y(n3790) );
  NOR2X1TS U678 ( .A(n4762), .B(n4748), .Y(n4106) );
  NOR2X2TS U679 ( .A(n3790), .B(n4106), .Y(n3793) );
  NAND2X1TS U680 ( .A(n1501), .B(DMP_SFG[6]), .Y(n3937) );
  NAND2X1TS U681 ( .A(n4104), .B(n3937), .Y(n3792) );
  INVX2TS U682 ( .A(n4262), .Y(n3788) );
  NOR2X1TS U683 ( .A(n4760), .B(n2557), .Y(n4109) );
  NAND2X1TS U684 ( .A(n1510), .B(n4766), .Y(n4265) );
  OAI21X1TS U685 ( .A0(n3790), .A1(n3789), .B0(n4265), .Y(n3791) );
  NAND2X1TS U686 ( .A(n1502), .B(n4758), .Y(n3932) );
  NAND2BX1TS U687 ( .AN(n3637), .B(n4777), .Y(n4078) );
  NAND4X2TS U688 ( .A(n3931), .B(n3794), .C(n3932), .D(n4078), .Y(n3798) );
  INVX2TS U689 ( .A(n3793), .Y(n3796) );
  NAND2X1TS U690 ( .A(n3637), .B(n2551), .Y(n4077) );
  NAND2X1TS U691 ( .A(n3936), .B(n4077), .Y(n3795) );
  NAND3X4TS U692 ( .A(n3798), .B(n4266), .C(n3797), .Y(n4232) );
  NAND2X1TS U693 ( .A(n1509), .B(n4772), .Y(n4229) );
  NAND2X1TS U694 ( .A(n2592), .B(n2559), .Y(n3799) );
  NOR2X1TS U695 ( .A(n2561), .B(n2593), .Y(n3803) );
  NOR2X4TS U696 ( .A(n3960), .B(n3803), .Y(n4627) );
  NAND2X1TS U697 ( .A(n2593), .B(n2561), .Y(n4626) );
  NAND2X1TS U698 ( .A(n4626), .B(n4625), .Y(n3804) );
  OA21X4TS U699 ( .A0(n4627), .A1(n3804), .B0(n4624), .Y(n4478) );
  NAND2BX1TS U700 ( .AN(n2565), .B(n1507), .Y(n4475) );
  NOR2X1TS U701 ( .A(n1507), .B(n4750), .Y(n4474) );
  AOI21X4TS U702 ( .A0(n4478), .A1(n4475), .B0(n4474), .Y(n4639) );
  NAND2X1TS U703 ( .A(n4781), .B(n2533), .Y(n4635) );
  NOR2BX1TS U704 ( .AN(n1519), .B(n2533), .Y(n4636) );
  AOI21X4TS U705 ( .A0(n4639), .A1(n4635), .B0(n4636), .Y(n4286) );
  NAND2BX1TS U706 ( .AN(n2573), .B(n1506), .Y(n4287) );
  NOR2BX1TS U707 ( .AN(n2573), .B(n1506), .Y(n4289) );
  AOI21X4TS U708 ( .A0(n4286), .A1(n4287), .B0(n4289), .Y(n4302) );
  OAI2BB1X4TS U709 ( .A0N(n3657), .A1N(n2575), .B0(n4302), .Y(n3805) );
  OAI21X4TS U710 ( .A0(n3657), .A1(n2575), .B0(n3805), .Y(n4318) );
  AOI21X4TS U711 ( .A0(n2599), .A1(n4885), .B0(n3806), .Y(n4455) );
  NAND2X1TS U712 ( .A(n4795), .B(n2582), .Y(n3807) );
  NAND2X1TS U713 ( .A(n4811), .B(DMP_SFG[21]), .Y(n3808) );
  NAND2X1TS U714 ( .A(n4812), .B(n2586), .Y(n3809) );
  AOI22X1TS U715 ( .A0(n4499), .A1(n3809), .B0(n1516), .B1(n4838), .Y(n3810)
         );
  BUFX3TS U716 ( .A(n4814), .Y(n4698) );
  INVX2TS U717 ( .A(n4698), .Y(n4738) );
  NAND2BX1TS U718 ( .AN(n4738), .B(OP_FLAG_SFG), .Y(n3811) );
  INVX2TS U719 ( .A(n3811), .Y(n4453) );
  INVX2TS U720 ( .A(n4490), .Y(n4477) );
  NAND2X2TS U721 ( .A(n3619), .B(n1514), .Y(n4128) );
  NAND2X1TS U722 ( .A(n4135), .B(n4128), .Y(n3812) );
  OR2X2TS U723 ( .A(n3619), .B(n1514), .Y(n4129) );
  OR2X4TS U724 ( .A(n4153), .B(n3813), .Y(n4119) );
  AOI21X1TS U725 ( .A0(n1513), .A1(n4759), .B0(n4118), .Y(n3814) );
  NOR2BX1TS U726 ( .AN(n4758), .B(n1502), .Y(n3817) );
  NAND2X4TS U727 ( .A(n3819), .B(n3818), .Y(n4079) );
  NOR2BX1TS U728 ( .AN(n2551), .B(n3637), .Y(n3820) );
  OAI22X4TS U729 ( .A0(n4079), .A1(n3820), .B0(n2551), .B1(n4776), .Y(n4049)
         );
  NAND2X1TS U730 ( .A(n1501), .B(n4775), .Y(n3821) );
  OA21X4TS U731 ( .A0(n4049), .A1(n3822), .B0(n3821), .Y(n3940) );
  NAND2X1TS U732 ( .A(n4748), .B(n3638), .Y(n3823) );
  NAND2X1TS U733 ( .A(n3626), .B(n2557), .Y(n3825) );
  OA21X4TS U734 ( .A0(n4112), .A1(n3826), .B0(n3825), .Y(n4221) );
  NOR2X1TS U735 ( .A(n4771), .B(n2559), .Y(n3956) );
  NOR2X1TS U736 ( .A(n2560), .B(n1509), .Y(n3954) );
  NAND2X1TS U737 ( .A(n1520), .B(n2570), .Y(n4472) );
  NAND2X1TS U738 ( .A(n1507), .B(n2565), .Y(n3828) );
  NAND2X1TS U739 ( .A(n3958), .B(n4634), .Y(n3829) );
  NOR2BX1TS U740 ( .AN(n2561), .B(n2593), .Y(n4466) );
  NOR2X1TS U741 ( .A(n3829), .B(n4466), .Y(n3836) );
  OAI21X1TS U742 ( .A0(n3956), .A1(n3954), .B0(n3836), .Y(n3832) );
  NAND2X1TS U743 ( .A(n4471), .B(n2565), .Y(n3830) );
  AOI2BB2X1TS U744 ( .B0(n3830), .B1(n4769), .A0N(n2565), .A1N(n4471), .Y(
        n4632) );
  NOR2X1TS U745 ( .A(n4770), .B(n2561), .Y(n4468) );
  NAND3X1TS U746 ( .A(n3832), .B(n4632), .C(n3831), .Y(n3835) );
  NAND2X1TS U747 ( .A(n2584), .B(DMP_SFG[9]), .Y(n3946) );
  NAND2X1TS U748 ( .A(n3948), .B(n3946), .Y(n3833) );
  NAND2X2TS U749 ( .A(n3947), .B(n3834), .Y(n3840) );
  INVX2TS U750 ( .A(n3835), .Y(n3838) );
  NAND2X1TS U751 ( .A(n1510), .B(n2558), .Y(n3950) );
  NAND2X1TS U752 ( .A(n1509), .B(n2560), .Y(n3952) );
  AOI22X1TS U753 ( .A0(n3838), .A1(n3837), .B0(n1519), .B1(n2533), .Y(n3839)
         );
  NOR2X1TS U754 ( .A(n4790), .B(n2575), .Y(n3844) );
  OAI22X4TS U755 ( .A0(n4303), .A1(n3844), .B0(n3657), .B1(n4754), .Y(n4317)
         );
  OA21X4TS U756 ( .A0(n4317), .A1(n3846), .B0(n3845), .Y(n4454) );
  OAI21X2TS U757 ( .A0(n1517), .A1(n2582), .B0(n4454), .Y(n3848) );
  NAND2X1TS U758 ( .A(n2582), .B(n1517), .Y(n3847) );
  NAND2X2TS U759 ( .A(n3848), .B(n3847), .Y(n4491) );
  OAI21X2TS U760 ( .A0(n1516), .A1(n2586), .B0(n4497), .Y(n3850) );
  OAI2BB1X4TS U761 ( .A0N(n1516), .A1N(n2586), .B0(n3850), .Y(n4662) );
  XOR2X1TS U762 ( .A(n4662), .B(DmP_mant_SFG_SWR_25_), .Y(n3852) );
  OAI21X2TS U763 ( .A0(n3854), .A1(n4477), .B0(n3853), .Y(n588) );
  CLKBUFX2TS U764 ( .A(busy), .Y(n4701) );
  INVX2TS U765 ( .A(n4696), .Y(n4694) );
  NAND2X2TS U766 ( .A(n4737), .B(n4694), .Y(n4485) );
  CLKBUFX2TS U767 ( .A(n3605), .Y(n4549) );
  BUFX3TS U768 ( .A(n4549), .Y(n4693) );
  INVX2TS U769 ( .A(n4370), .Y(n4544) );
  NOR2X2TS U770 ( .A(Raw_mant_NRM_SWR[24]), .B(Raw_mant_NRM_SWR[25]), .Y(n3999) );
  NAND2X2TS U771 ( .A(n4757), .B(n3999), .Y(n3855) );
  NOR2X4TS U772 ( .A(n3855), .B(Raw_mant_NRM_SWR[22]), .Y(n4310) );
  NAND2BX4TS U773 ( .AN(n4309), .B(n4310), .Y(n4001) );
  NOR2X4TS U774 ( .A(n4001), .B(Raw_mant_NRM_SWR[18]), .Y(n4375) );
  NOR2X2TS U775 ( .A(Raw_mant_NRM_SWR[17]), .B(n3675), .Y(n4000) );
  NAND2BX1TS U776 ( .AN(Raw_mant_NRM_SWR[15]), .B(n4000), .Y(n3856) );
  NAND2BX2TS U777 ( .AN(n3856), .B(n3612), .Y(n4374) );
  NOR2BX4TS U778 ( .AN(n4375), .B(n4374), .Y(n4308) );
  NAND2BX4TS U779 ( .AN(Raw_mant_NRM_SWR[13]), .B(n4308), .Y(n4018) );
  NOR2X4TS U780 ( .A(Raw_mant_NRM_SWR[11]), .B(n4018), .Y(n4016) );
  NAND3X4TS U781 ( .A(n3608), .B(n4016), .C(n4773), .Y(n3859) );
  NAND3BX4TS U782 ( .AN(n3859), .B(n3615), .C(n4768), .Y(n4022) );
  INVX2TS U783 ( .A(n3616), .Y(n3857) );
  NOR3X4TS U784 ( .A(n4022), .B(n3857), .C(Raw_mant_NRM_SWR[6]), .Y(n4315) );
  NOR2X1TS U785 ( .A(Raw_mant_NRM_SWR[2]), .B(Raw_mant_NRM_SWR[3]), .Y(n4371)
         );
  INVX2TS U786 ( .A(n3677), .Y(n4314) );
  NOR2BX4TS U787 ( .AN(n4315), .B(n4314), .Y(n4021) );
  OAI22X1TS U788 ( .A0(n3858), .A1(n4022), .B0(n4371), .B1(n4377), .Y(n4007)
         );
  AOI31XLTS U789 ( .A0(n3615), .A1(n3677), .A2(n4768), .B0(n3859), .Y(n3860)
         );
  AOI211X1TS U790 ( .A0(n4315), .A1(n4810), .B0(n4007), .C0(n3860), .Y(n3861)
         );
  AOI32X1TS U791 ( .A0(n1499), .A1(n3861), .A2(n1452), .B0(n4377), .B1(n3861), 
        .Y(n4691) );
  AOI22X1TS U792 ( .A0(n4544), .A1(n4691), .B0(Shift_amount_SHT1_EWR[4]), .B1(
        n4379), .Y(n3862) );
  NOR2X1TS U793 ( .A(LZD_output_NRM2_EW[1]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n17) );
  NOR2X1TS U794 ( .A(LZD_output_NRM2_EW[4]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n14) );
  OAI22X1TS U795 ( .A0(n1456), .A1(intDY_EWSW[13]), .B0(n1462), .B1(
        intDY_EWSW[12]), .Y(n3886) );
  NAND3BX1TS U796 ( .AN(n1460), .B(n4396), .C(n4767), .Y(n3863) );
  NAND2X1TS U797 ( .A(n3864), .B(n3863), .Y(n3865) );
  NAND2X1TS U798 ( .A(n1483), .B(intDY_EWSW[2]), .Y(n4384) );
  NAND2X1TS U799 ( .A(n1434), .B(intDY_EWSW[4]), .Y(n3867) );
  NAND2X1TS U800 ( .A(n1455), .B(intDY_EWSW[3]), .Y(n3866) );
  NAND2X1TS U801 ( .A(n3867), .B(n3866), .Y(n4393) );
  OAI21X2TS U802 ( .A0(n3869), .A1(n4393), .B0(n3868), .Y(n3871) );
  NOR2BX1TS U803 ( .AN(intDY_EWSW[6]), .B(n3606), .Y(n3870) );
  NAND2X2TS U804 ( .A(n3871), .B(n4382), .Y(n3877) );
  NOR2BX1TS U805 ( .AN(n3606), .B(intDY_EWSW[6]), .Y(n3872) );
  AOI21X1TS U806 ( .A0(intDX_EWSW[7]), .A1(n1459), .B0(n3872), .Y(n3876) );
  NAND2X1TS U807 ( .A(n1437), .B(intDY_EWSW[10]), .Y(n3874) );
  NAND2X1TS U808 ( .A(n1489), .B(intDY_EWSW[11]), .Y(n3873) );
  OAI22X1TS U809 ( .A0(intDY_EWSW[10]), .A1(n1437), .B0(n1488), .B1(
        intDY_EWSW[9]), .Y(n3880) );
  AOI22X1TS U810 ( .A0(n1456), .A1(intDY_EWSW[13]), .B0(n1486), .B1(
        intDY_EWSW[14]), .Y(n4381) );
  OAI22X1TS U811 ( .A0(n1486), .A1(intDY_EWSW[14]), .B0(n1457), .B1(
        intDY_EWSW[15]), .Y(n3887) );
  NAND2X1TS U812 ( .A(n1457), .B(intDY_EWSW[15]), .Y(n4397) );
  NAND2X1TS U813 ( .A(n1438), .B(intDY_EWSW[16]), .Y(n3889) );
  NAND2X1TS U814 ( .A(n4397), .B(n3889), .Y(n3891) );
  OA22X1TS U815 ( .A0(n1438), .A1(intDY_EWSW[16]), .B0(n1490), .B1(
        intDY_EWSW[17]), .Y(n3890) );
  NAND2X1TS U816 ( .A(n1463), .B(intDY_EWSW[18]), .Y(n3894) );
  NAND2X1TS U817 ( .A(n1490), .B(intDY_EWSW[17]), .Y(n3893) );
  NAND2X1TS U818 ( .A(n3894), .B(n3893), .Y(n4392) );
  INVX2TS U819 ( .A(n4392), .Y(n3895) );
  NOR2BX1TS U820 ( .AN(intDY_EWSW[19]), .B(n3607), .Y(n4399) );
  NAND2X1TS U821 ( .A(n1461), .B(intDY_EWSW[20]), .Y(n4395) );
  OAI22X1TS U822 ( .A0(n1458), .A1(intDY_EWSW[21]), .B0(n1461), .B1(
        intDY_EWSW[20]), .Y(n3898) );
  NAND2X1TS U823 ( .A(n1487), .B(intDY_EWSW[22]), .Y(n4398) );
  NOR2BX1TS U824 ( .AN(n1477), .B(n2589), .Y(n4387) );
  NAND2X1TS U825 ( .A(n1439), .B(n4786), .Y(n3902) );
  NAND2X1TS U826 ( .A(n1464), .B(intDY_EWSW[27]), .Y(n3909) );
  NOR2X1TS U827 ( .A(n4387), .B(n4406), .Y(n3904) );
  NAND2X1TS U828 ( .A(n1430), .B(n4753), .Y(n3906) );
  NAND2X1TS U829 ( .A(n3908), .B(n3907), .Y(n3911) );
  INVX2TS U830 ( .A(n3909), .Y(n3910) );
  AOI21X1TS U831 ( .A0(n3911), .A1(n73), .B0(n3910), .Y(n3914) );
  OAI22X1TS U832 ( .A0(n1432), .A1(intDY_EWSW[28]), .B0(n1464), .B1(
        intDY_EWSW[27]), .Y(n3912) );
  AOI21X1TS U833 ( .A0(n3914), .A1(n3913), .B0(n3912), .Y(n3917) );
  NAND2X1TS U834 ( .A(n1432), .B(intDY_EWSW[28]), .Y(n3916) );
  NAND2X1TS U835 ( .A(n1491), .B(n3648), .Y(n3915) );
  OAI22X1TS U836 ( .A0(n1491), .A1(n3648), .B0(n1465), .B1(intDY_EWSW[30]), 
        .Y(n3919) );
  OA21X4TS U837 ( .A0(n3920), .A1(n3919), .B0(n4388), .Y(n3922) );
  BUFX3TS U838 ( .A(n4745), .Y(n4668) );
  AOI22X1TS U839 ( .A0(n4450), .A1(n4832), .B0(DmP_EXP_EWSW[17]), .B1(n4736), 
        .Y(n3923) );
  OAI2BB1X1TS U840 ( .A0N(intDY_EWSW[17]), .A1N(n4463), .B0(n3923), .Y(n643)
         );
  AOI22X1TS U841 ( .A0(n4423), .A1(n4825), .B0(DmP_EXP_EWSW[27]), .B1(n4736), 
        .Y(n3924) );
  OAI2BB1X1TS U842 ( .A0N(intDY_EWSW[27]), .A1N(n4670), .B0(n3924), .Y(n627)
         );
  AOI22X1TS U843 ( .A0(n4438), .A1(n4828), .B0(DmP_EXP_EWSW[2]), .B1(n4446), 
        .Y(n3925) );
  OAI2BB1X1TS U844 ( .A0N(intDY_EWSW[2]), .A1N(n4416), .B0(n3925), .Y(n673) );
  AOI22X1TS U845 ( .A0(n4443), .A1(n4835), .B0(DMP_EXP_EWSW[8]), .B1(n4736), 
        .Y(n3926) );
  OAI2BB1X1TS U846 ( .A0N(n3623), .A1N(n4670), .B0(n3926), .Y(n811) );
  AOI22X1TS U847 ( .A0(n4443), .A1(n4830), .B0(DMP_EXP_EWSW[7]), .B1(n4446), 
        .Y(n3927) );
  OAI2BB1X1TS U848 ( .A0N(intDX_EWSW[7]), .A1N(n4670), .B0(n3927), .Y(n812) );
  AOI22X1TS U849 ( .A0(n4423), .A1(n4833), .B0(DmP_EXP_EWSW[4]), .B1(n4736), 
        .Y(n3928) );
  OAI2BB1X1TS U850 ( .A0N(intDY_EWSW[4]), .A1N(n4416), .B0(n3928), .Y(n669) );
  AOI22X1TS U851 ( .A0(n4438), .A1(n4819), .B0(DmP_EXP_EWSW[1]), .B1(n4446), 
        .Y(n3929) );
  OAI2BB1X1TS U852 ( .A0N(intDY_EWSW[1]), .A1N(n4670), .B0(n3929), .Y(n675) );
  AOI22X1TS U853 ( .A0(n4423), .A1(n4831), .B0(DmP_EXP_EWSW[18]), .B1(n4446), 
        .Y(n3930) );
  OAI2BB1X1TS U854 ( .A0N(intDY_EWSW[18]), .A1N(n4463), .B0(n3930), .Y(n641)
         );
  INVX2TS U855 ( .A(n3931), .Y(n3934) );
  INVX2TS U856 ( .A(n3932), .Y(n3933) );
  NOR2X2TS U857 ( .A(n3934), .B(n3933), .Y(n4080) );
  INVX2TS U858 ( .A(n3936), .Y(n3938) );
  INVX2TS U859 ( .A(n3774), .Y(n4614) );
  XNOR2X1TS U860 ( .A(n3638), .B(n2556), .Y(n3939) );
  BUFX3TS U861 ( .A(n4453), .Y(n4496) );
  AOI21X1TS U862 ( .A0(n3940), .A1(n3776), .B0(n3939), .Y(n3941) );
  OAI2BB1X1TS U863 ( .A0N(n4496), .A1N(n4105), .B0(n3941), .Y(n3942) );
  OAI21XLTS U864 ( .A0(n3615), .A1(n4814), .B0(n3945), .Y(n604) );
  XOR2X1TS U865 ( .A(n2593), .B(n2561), .Y(n3964) );
  NAND2X4TS U866 ( .A(n3947), .B(n3946), .Y(n4267) );
  INVX2TS U867 ( .A(n3948), .Y(n3949) );
  OR2X4TS U868 ( .A(n4267), .B(n3949), .Y(n3951) );
  NAND2X4TS U869 ( .A(n3951), .B(n3950), .Y(n4231) );
  INVX2TS U870 ( .A(n3952), .Y(n3953) );
  INVX2TS U871 ( .A(n3956), .Y(n3957) );
  NAND2X2TS U872 ( .A(n3972), .B(n3957), .Y(n3959) );
  NAND2X2TS U873 ( .A(n3959), .B(n3958), .Y(n4467) );
  BUFX3TS U874 ( .A(n4614), .Y(n4663) );
  OAI22X1TS U875 ( .A0(n4467), .A1(n4663), .B0(n3960), .B1(n4477), .Y(n3963)
         );
  AOI22X1TS U876 ( .A0(n4467), .A1(n3774), .B0(n4496), .B1(n3960), .Y(n3961)
         );
  CLKBUFX2TS U877 ( .A(n4814), .Y(n4704) );
  BUFX3TS U878 ( .A(n4704), .Y(n4684) );
  OAI22X1TS U879 ( .A0(n3961), .A1(n3964), .B0(n4684), .B1(n4839), .Y(n3962)
         );
  OAI22X1TS U880 ( .A0(n3978), .A1(n2589), .B0(n1492), .B1(n4668), .Y(n3965)
         );
  AOI22X1TS U881 ( .A0(n4450), .A1(n4821), .B0(DmP_EXP_EWSW[22]), .B1(n4736), 
        .Y(n3966) );
  OAI2BB1X1TS U882 ( .A0N(intDY_EWSW[22]), .A1N(n4670), .B0(n3966), .Y(n633)
         );
  AOI22X1TS U883 ( .A0(n4450), .A1(n4823), .B0(DmP_EXP_EWSW[15]), .B1(n4449), 
        .Y(n3967) );
  OAI2BB1X1TS U884 ( .A0N(intDY_EWSW[15]), .A1N(n4463), .B0(n3967), .Y(n647)
         );
  AOI22X1TS U885 ( .A0(n4450), .A1(n4822), .B0(DmP_EXP_EWSW[20]), .B1(n4449), 
        .Y(n3968) );
  OAI2BB1X1TS U886 ( .A0N(intDY_EWSW[20]), .A1N(n4463), .B0(n3968), .Y(n637)
         );
  AOI22X1TS U887 ( .A0(n4450), .A1(n4817), .B0(DmP_EXP_EWSW[16]), .B1(n4449), 
        .Y(n3969) );
  OAI2BB1X1TS U888 ( .A0N(intDY_EWSW[16]), .A1N(n4463), .B0(n3969), .Y(n645)
         );
  AOI22X1TS U889 ( .A0(n4450), .A1(n4818), .B0(DmP_EXP_EWSW[14]), .B1(n4736), 
        .Y(n3970) );
  OAI2BB1X1TS U890 ( .A0N(intDY_EWSW[14]), .A1N(n4463), .B0(n3970), .Y(n649)
         );
  XOR2X1TS U891 ( .A(n2592), .B(n2559), .Y(n3977) );
  INVX2TS U892 ( .A(n4230), .Y(n3971) );
  OAI21X1TS U893 ( .A0(n4232), .A1(n3971), .B0(n4229), .Y(n3973) );
  OAI22X1TS U894 ( .A0(n3973), .A1(n4640), .B0(n3972), .B1(n4614), .Y(n3976)
         );
  AOI22X1TS U895 ( .A0(n3973), .A1(n4453), .B0(n3776), .B1(n3972), .Y(n3974)
         );
  OAI22X1TS U896 ( .A0(n3974), .A1(n3977), .B0(n3612), .B1(n4684), .Y(n3975)
         );
  OAI22X1TS U897 ( .A0(n3978), .A1(n73), .B0(n1445), .B1(n4668), .Y(n3979) );
  AOI22X1TS U898 ( .A0(n4450), .A1(n4829), .B0(DmP_EXP_EWSW[21]), .B1(n4449), 
        .Y(n3980) );
  OAI2BB1X1TS U899 ( .A0N(intDY_EWSW[21]), .A1N(n3987), .B0(n3980), .Y(n635)
         );
  AOI22X1TS U900 ( .A0(n4423), .A1(n4886), .B0(DmP_EXP_EWSW[13]), .B1(n4446), 
        .Y(n3981) );
  OAI2BB1X1TS U901 ( .A0N(intDY_EWSW[13]), .A1N(n3987), .B0(n3981), .Y(n651)
         );
  AOI22X1TS U902 ( .A0(n4423), .A1(n4826), .B0(DmP_EXP_EWSW[10]), .B1(n4446), 
        .Y(n3982) );
  OAI2BB1X1TS U903 ( .A0N(intDY_EWSW[10]), .A1N(n3987), .B0(n3982), .Y(n657)
         );
  AOI22X1TS U904 ( .A0(n4423), .A1(n4827), .B0(DmP_EXP_EWSW[11]), .B1(n4449), 
        .Y(n3983) );
  OAI2BB1X1TS U905 ( .A0N(intDY_EWSW[11]), .A1N(n3987), .B0(n3983), .Y(n655)
         );
  AOI22X1TS U906 ( .A0(n4423), .A1(n4824), .B0(DmP_EXP_EWSW[9]), .B1(n4449), 
        .Y(n3984) );
  OAI2BB1X1TS U907 ( .A0N(intDY_EWSW[9]), .A1N(n3987), .B0(n3984), .Y(n659) );
  AOI22X1TS U908 ( .A0(n4423), .A1(n4834), .B0(DmP_EXP_EWSW[3]), .B1(n4449), 
        .Y(n3985) );
  OAI2BB1X1TS U909 ( .A0N(intDY_EWSW[3]), .A1N(n3987), .B0(n3985), .Y(n671) );
  AOI22X1TS U910 ( .A0(n4423), .A1(n4820), .B0(DmP_EXP_EWSW[5]), .B1(n4446), 
        .Y(n3986) );
  OAI2BB1X1TS U911 ( .A0N(intDY_EWSW[5]), .A1N(n3987), .B0(n3986), .Y(n667) );
  BUFX3TS U912 ( .A(n4854), .Y(n4860) );
  BUFX3TS U913 ( .A(n3990), .Y(n4862) );
  BUFX3TS U914 ( .A(n4858), .Y(n4863) );
  BUFX3TS U915 ( .A(n3988), .Y(n4845) );
  BUFX3TS U916 ( .A(n4855), .Y(n4849) );
  BUFX3TS U917 ( .A(n3990), .Y(n4850) );
  BUFX3TS U918 ( .A(n4857), .Y(n4851) );
  CLKBUFX2TS U919 ( .A(n4027), .Y(n3991) );
  BUFX3TS U920 ( .A(n4858), .Y(n4852) );
  BUFX3TS U921 ( .A(n4854), .Y(n4847) );
  BUFX3TS U922 ( .A(n3990), .Y(n4848) );
  BUFX3TS U923 ( .A(n3990), .Y(n4853) );
  BUFX3TS U924 ( .A(n4858), .Y(n4844) );
  BUFX3TS U925 ( .A(n4027), .Y(n4861) );
  BUFX3TS U926 ( .A(n4857), .Y(n4846) );
  BUFX3TS U927 ( .A(n4855), .Y(n4859) );
  BUFX3TS U928 ( .A(n3992), .Y(n4856) );
  CLKBUFX2TS U929 ( .A(n3992), .Y(n4882) );
  BUFX3TS U930 ( .A(n3989), .Y(n4873) );
  BUFX3TS U931 ( .A(n3992), .Y(n4874) );
  BUFX3TS U932 ( .A(n3991), .Y(n4871) );
  BUFX3TS U933 ( .A(n4858), .Y(n4876) );
  BUFX3TS U934 ( .A(n4857), .Y(n4872) );
  BUFX3TS U935 ( .A(n4857), .Y(n4881) );
  BUFX3TS U936 ( .A(n3992), .Y(n4875) );
  BUFX3TS U937 ( .A(n4854), .Y(n4864) );
  BUFX3TS U938 ( .A(n4858), .Y(n4870) );
  BUFX3TS U939 ( .A(n4855), .Y(n4843) );
  BUFX3TS U940 ( .A(n3989), .Y(n4880) );
  BUFX3TS U941 ( .A(n4855), .Y(n4877) );
  BUFX3TS U942 ( .A(n4854), .Y(n4878) );
  BUFX3TS U943 ( .A(n4857), .Y(n4869) );
  BUFX3TS U944 ( .A(n3988), .Y(n4867) );
  BUFX3TS U945 ( .A(n4855), .Y(n4868) );
  BUFX3TS U946 ( .A(n3989), .Y(n4879) );
  BUFX3TS U947 ( .A(n4854), .Y(n4865) );
  BUFX3TS U948 ( .A(n3990), .Y(n4866) );
  NAND2X2TS U949 ( .A(n4779), .B(n3609), .Y(n4094) );
  OAI21X2TS U950 ( .A0(n4094), .A1(n4801), .B0(n4093), .Y(n4344) );
  AOI22X1TS U951 ( .A0(Data_array_SWR[15]), .A1(n3772), .B0(Data_array_SWR[7]), 
        .B1(n4651), .Y(n3994) );
  NAND2X1TS U952 ( .A(shift_value_SHT2_EWR[2]), .B(n3609), .Y(n4085) );
  NOR3X6TS U953 ( .A(shift_value_SHT2_EWR[4]), .B(n3609), .C(n4779), .Y(n4650)
         );
  AOI22X1TS U954 ( .A0(Data_array_SWR[11]), .A1(n3754), .B0(Data_array_SWR[19]), .B1(n4650), .Y(n3993) );
  INVX2TS U955 ( .A(n4357), .Y(n4047) );
  OR2X2TS U956 ( .A(Shift_reg_FLAGS_7[0]), .B(n4787), .Y(n4211) );
  NAND2X2TS U957 ( .A(n4041), .B(left_right_SHT2), .Y(n4623) );
  INVX2TS U958 ( .A(n4094), .Y(n4177) );
  OR2X2TS U959 ( .A(n3609), .B(n1493), .Y(n4174) );
  OAI21X1TS U960 ( .A0(n4085), .A1(n4842), .B0(n4174), .Y(n3995) );
  INVX2TS U961 ( .A(n4359), .Y(n4045) );
  NAND2X2TS U962 ( .A(n4041), .B(n4794), .Y(n4621) );
  OR2X2TS U963 ( .A(n4621), .B(shift_value_SHT2_EWR[4]), .Y(n4215) );
  INVX2TS U964 ( .A(n4215), .Y(n4073) );
  AOI22X1TS U965 ( .A0(n4045), .A1(n4073), .B0(n4781), .B1(n4206), .Y(n3996)
         );
  NOR2X4TS U966 ( .A(n1493), .B(n3747), .Y(n4657) );
  INVX2TS U967 ( .A(n4621), .Y(n4194) );
  NAND2X2TS U968 ( .A(n4657), .B(n4194), .Y(n4199) );
  INVX2TS U969 ( .A(n4485), .Y(n4513) );
  CLKBUFX2TS U970 ( .A(n4513), .Y(n4581) );
  BUFX3TS U971 ( .A(n4581), .Y(n4608) );
  AOI21X1TS U972 ( .A0(n3608), .A1(n4789), .B0(Raw_mant_NRM_SWR[12]), .Y(n4009) );
  AOI211X1TS U973 ( .A0(n3998), .A1(n3997), .B0(Raw_mant_NRM_SWR[23]), .C0(
        Raw_mant_NRM_SWR[22]), .Y(n4005) );
  CLKINVX1TS U974 ( .A(n3999), .Y(n4004) );
  INVX2TS U975 ( .A(n4001), .Y(n4011) );
  NOR2X1TS U976 ( .A(n4001), .B(n4788), .Y(n4019) );
  INVX2TS U977 ( .A(n4019), .Y(n4002) );
  OAI211X1TS U978 ( .A0(n4005), .A1(n4004), .B0(n4003), .C0(n4002), .Y(n4006)
         );
  AOI211X2TS U979 ( .A0(n4009), .A1(n4008), .B0(n4007), .C0(n4006), .Y(n4677)
         );
  INVX2TS U980 ( .A(n4370), .Y(n4540) );
  OAI2BB2X2TS U981 ( .B0(n4677), .B1(n4537), .A0N(Shift_amount_SHT1_EWR[1]), 
        .A1N(n4694), .Y(n4504) );
  AOI21X1TS U982 ( .A0(n4010), .A1(n4757), .B0(Raw_mant_NRM_SWR[24]), .Y(n4014) );
  AOI31X1TS U983 ( .A0(n4024), .A1(n4312), .A2(n4023), .B0(n4740), .Y(n4678)
         );
  NAND2X1TS U984 ( .A(n4537), .B(Raw_mant_NRM_SWR[25]), .Y(n4025) );
  AOI22X1TS U985 ( .A0(n4608), .A1(n2580), .B0(n3766), .B1(n4563), .Y(n4026)
         );
  NAND2X1TS U986 ( .A(n4026), .B(n3760), .Y(n862) );
  BUFX3TS U987 ( .A(n4027), .Y(n4855) );
  BUFX3TS U988 ( .A(n4027), .Y(n4854) );
  BUFX3TS U989 ( .A(n4027), .Y(n4858) );
  BUFX3TS U990 ( .A(n4027), .Y(n4857) );
  OAI32X1TS U991 ( .A0(n4815), .A1(n4422), .A2(intDY_EWSW[30]), .B0(n4668), 
        .B1(DMP_EXP_EWSW[30]), .Y(n4028) );
  INVX2TS U992 ( .A(n4028), .Y(n1148) );
  BUFX3TS U993 ( .A(n4727), .Y(n4703) );
  NAND2X1TS U994 ( .A(n4703), .B(DmP_EXP_EWSW[8]), .Y(n4029) );
  NAND2X1TS U995 ( .A(n4655), .B(DMP_SHT1_EWSW[26]), .Y(n4030) );
  NAND2X1TS U996 ( .A(n4655), .B(DMP_SHT1_EWSW[25]), .Y(n4031) );
  NAND2X1TS U997 ( .A(n4164), .B(DMP_SHT2_EWSW[16]), .Y(n4032) );
  NAND2X1TS U998 ( .A(n4656), .B(DMP_SHT2_EWSW[19]), .Y(n4033) );
  NAND2X1TS U999 ( .A(n4656), .B(DMP_SHT2_EWSW[17]), .Y(n4034) );
  NAND2X1TS U1000 ( .A(n4656), .B(DMP_SHT2_EWSW[1]), .Y(n4035) );
  NAND2X1TS U1001 ( .A(n4164), .B(DMP_SHT2_EWSW[20]), .Y(n4036) );
  NAND2X1TS U1002 ( .A(n4661), .B(DMP_SHT2_EWSW[5]), .Y(n4037) );
  NAND2X1TS U1003 ( .A(n4164), .B(DMP_SHT2_EWSW[0]), .Y(n4038) );
  NAND2X1TS U1004 ( .A(n4661), .B(DMP_SHT2_EWSW[12]), .Y(n4039) );
  NAND2X1TS U1005 ( .A(n4707), .B(DMP_SHT2_EWSW[22]), .Y(n4040) );
  NAND2X1TS U1006 ( .A(n4707), .B(DMP_SHT2_EWSW[13]), .Y(n4042) );
  INVX2TS U1007 ( .A(n4198), .Y(n4044) );
  AOI22X1TS U1008 ( .A0(n4045), .A1(n4044), .B0(n3637), .B1(n4206), .Y(n4046)
         );
  NAND2X2TS U1009 ( .A(n4657), .B(n4209), .Y(n4169) );
  XOR2X1TS U1010 ( .A(n1501), .B(n4775), .Y(n4048) );
  AOI21X1TS U1011 ( .A0(n4049), .A1(n3775), .B0(n4048), .Y(n4050) );
  OAI2BB1X1TS U1012 ( .A0N(n4496), .A1N(n4051), .B0(n4050), .Y(n4052) );
  AOI22X1TS U1013 ( .A0(Data_array_SWR[11]), .A1(n4651), .B0(
        Data_array_SWR[19]), .B1(n3773), .Y(n4056) );
  AOI21X1TS U1014 ( .A0(n3755), .A1(Data_array_SWR[15]), .B0(n4657), .Y(n4057)
         );
  INVX2TS U1015 ( .A(n4059), .Y(n4618) );
  NOR2X1TS U1016 ( .A(n4657), .B(n4098), .Y(n4067) );
  AOI22X1TS U1017 ( .A0(Data_array_SWR[18]), .A1(n3755), .B0(
        Data_array_SWR[14]), .B1(n3753), .Y(n4060) );
  AOI22X1TS U1018 ( .A0(n4616), .A1(n4209), .B0(n2584), .B1(n4211), .Y(n4061)
         );
  AOI22X1TS U1019 ( .A0(Data_array_SWR[18]), .A1(n3772), .B0(
        Data_array_SWR[10]), .B1(n3753), .Y(n4062) );
  AOI21X1TS U1020 ( .A0(n3755), .A1(Data_array_SWR[14]), .B0(n4657), .Y(n4063)
         );
  INVX2TS U1021 ( .A(n4065), .Y(n4622) );
  AOI22X1TS U1022 ( .A0(Data_array_SWR[15]), .A1(n4651), .B0(
        Data_array_SWR[19]), .B1(n3755), .Y(n4066) );
  AOI22X1TS U1023 ( .A0(n4619), .A1(n4209), .B0(n4760), .B1(n4206), .Y(n4068)
         );
  OAI21X1TS U1024 ( .A0(n3660), .A1(n4085), .B0(n4174), .Y(n4069) );
  AOI21X2TS U1025 ( .A0(n4177), .A1(Data_array_SWR[19]), .B0(n4069), .Y(n4369)
         );
  AOI22X1TS U1026 ( .A0(Data_array_SWR[11]), .A1(n3773), .B0(Data_array_SWR[3]), .B1(n4651), .Y(n4071) );
  AOI22X1TS U1027 ( .A0(Data_array_SWR[15]), .A1(n3744), .B0(Data_array_SWR[7]), .B1(n3754), .Y(n4070) );
  INVX2TS U1028 ( .A(n4345), .Y(n4075) );
  INVX2TS U1029 ( .A(n4347), .Y(n4072) );
  AOI22X1TS U1030 ( .A0(n4795), .A1(n4211), .B0(n4073), .B1(n4072), .Y(n4074)
         );
  INVX2TS U1031 ( .A(n4169), .Y(n4195) );
  OAI22X1TS U1032 ( .A0(n4198), .A1(n4347), .B0(n1514), .B1(n4041), .Y(n4076)
         );
  NAND2X1TS U1033 ( .A(n4078), .B(n4077), .Y(n4083) );
  OAI2BB2XLTS U1034 ( .B0(n4080), .B1(n4498), .A0N(n3774), .A1N(n4079), .Y(
        n4081) );
  AOI22X1TS U1035 ( .A0(n4081), .A1(n4083), .B0(n4665), .B1(n4804), .Y(n4082)
         );
  INVX2TS U1036 ( .A(n4085), .Y(n4175) );
  NOR2X1TS U1037 ( .A(shift_value_SHT2_EWR[2]), .B(n3609), .Y(n4095) );
  AOI21X1TS U1038 ( .A0(Data_array_SWR[16]), .A1(n4177), .B0(n4086), .Y(n4087)
         );
  INVX2TS U1039 ( .A(n4088), .Y(n4362) );
  AOI22X1TS U1040 ( .A0(Data_array_SWR[8]), .A1(n3773), .B0(Data_array_SWR[0]), 
        .B1(n3753), .Y(n4090) );
  AOI22X1TS U1041 ( .A0(Data_array_SWR[4]), .A1(n3755), .B0(Data_array_SWR[12]), .B1(n4650), .Y(n4089) );
  OAI211X1TS U1042 ( .A0(n4362), .A1(n4793), .B0(n4090), .C0(n4089), .Y(n4210)
         );
  NAND2X1TS U1043 ( .A(n4210), .B(n4194), .Y(n4092) );
  OA21XLTS U1044 ( .A0(n2597), .A1(n4041), .B0(n4169), .Y(n4091) );
  AOI21X1TS U1045 ( .A0(Data_array_SWR[17]), .A1(n4177), .B0(n4096), .Y(n4097)
         );
  INVX2TS U1046 ( .A(n4099), .Y(n4365) );
  AOI22X1TS U1047 ( .A0(Data_array_SWR[5]), .A1(n3755), .B0(Data_array_SWR[13]), .B1(n4650), .Y(n4101) );
  AOI22X1TS U1048 ( .A0(Data_array_SWR[9]), .A1(n3773), .B0(Data_array_SWR[1]), 
        .B1(n4651), .Y(n4100) );
  AOI21X1TS U1049 ( .A0(n4348), .A1(n4194), .B0(n4102), .Y(n4103) );
  NAND2X1TS U1050 ( .A(n4105), .B(n4104), .Y(n4108) );
  INVX2TS U1051 ( .A(n4106), .Y(n4107) );
  NAND2X2TS U1052 ( .A(n4108), .B(n4107), .Y(n4218) );
  INVX2TS U1053 ( .A(n4109), .Y(n4217) );
  INVX2TS U1054 ( .A(n4110), .Y(n4219) );
  NAND2X1TS U1055 ( .A(n4217), .B(n4219), .Y(n4111) );
  AOI21X1TS U1056 ( .A0(n4112), .A1(n3776), .B0(n4111), .Y(n4113) );
  OAI2BB1X1TS U1057 ( .A0N(n4496), .A1N(n4218), .B0(n4113), .Y(n4114) );
  NOR2BX1TS U1058 ( .AN(n4119), .B(n4118), .Y(n4122) );
  NAND2X1TS U1059 ( .A(n4124), .B(n4453), .Y(n4120) );
  XOR2X1TS U1060 ( .A(n1513), .B(n4759), .Y(n4121) );
  AOI21X1TS U1061 ( .A0(n4122), .A1(n3774), .B0(n4121), .Y(n4123) );
  NAND2X1TS U1062 ( .A(n4126), .B(n4125), .Y(n4127) );
  INVX2TS U1063 ( .A(n4490), .Y(n4640) );
  NAND2X1TS U1064 ( .A(n3775), .B(n4135), .Y(n4130) );
  NAND2X1TS U1065 ( .A(n4129), .B(n4128), .Y(n4132) );
  NAND2X1TS U1066 ( .A(n4131), .B(n4490), .Y(n4134) );
  INVX2TS U1067 ( .A(n4132), .Y(n4133) );
  NAND2X1TS U1068 ( .A(n4137), .B(n4136), .Y(n4138) );
  NAND2X1TS U1069 ( .A(n4140), .B(n4139), .Y(n4144) );
  XOR2X1TS U1070 ( .A(n1502), .B(n2548), .Y(n4141) );
  AOI21X1TS U1071 ( .A0(n4142), .A1(n3774), .B0(n4141), .Y(n4143) );
  OAI2BB1X1TS U1072 ( .A0N(n4496), .A1N(n4144), .B0(n4143), .Y(n4145) );
  INVX2TS U1073 ( .A(n4155), .Y(n4151) );
  XOR2X1TS U1074 ( .A(n1503), .B(n4765), .Y(n4152) );
  AOI21X1TS U1075 ( .A0(n4153), .A1(n3775), .B0(n4152), .Y(n4154) );
  AOI22X1TS U1076 ( .A0(Data_array_SWR[21]), .A1(n4650), .B0(
        Data_array_SWR[13]), .B1(n3755), .Y(n4161) );
  AOI22X1TS U1077 ( .A0(Data_array_SWR[9]), .A1(n4651), .B0(Data_array_SWR[17]), .B1(n3772), .Y(n4160) );
  NAND2X1TS U1078 ( .A(n4360), .B(n4209), .Y(n4163) );
  OA21XLTS U1079 ( .A0(n1520), .A1(n4041), .B0(n4199), .Y(n4162) );
  AOI21X1TS U1080 ( .A0(n4348), .A1(n4209), .B0(n4165), .Y(n4166) );
  AOI22X1TS U1081 ( .A0(Data_array_SWR[18]), .A1(n4650), .B0(
        Data_array_SWR[10]), .B1(n3755), .Y(n4168) );
  AOI22X1TS U1082 ( .A0(Data_array_SWR[6]), .A1(n4651), .B0(Data_array_SWR[14]), .B1(n3773), .Y(n4167) );
  INVX2TS U1083 ( .A(n4366), .Y(n4172) );
  OA22X1TS U1084 ( .A0(n4369), .A1(n4198), .B0(n1502), .B1(n4041), .Y(n4170)
         );
  OA22X1TS U1085 ( .A0(n4369), .A1(n4215), .B0(n1506), .B1(n4041), .Y(n4171)
         );
  OAI2BB1X1TS U1086 ( .A0N(n4175), .A1N(Data_array_SWR[24]), .B0(n4174), .Y(
        n4173) );
  AOI21X2TS U1087 ( .A0(Data_array_SWR[20]), .A1(n4177), .B0(n4173), .Y(n4356)
         );
  OAI2BB1X1TS U1088 ( .A0N(n4175), .A1N(n2580), .B0(n4174), .Y(n4176) );
  AOI21X2TS U1089 ( .A0(Data_array_SWR[21]), .A1(n4177), .B0(n4176), .Y(n4353)
         );
  AOI22X1TS U1090 ( .A0(Data_array_SWR[5]), .A1(n4651), .B0(Data_array_SWR[13]), .B1(n3772), .Y(n4179) );
  AOI22X1TS U1091 ( .A0(Data_array_SWR[9]), .A1(n3754), .B0(Data_array_SWR[17]), .B1(n4650), .Y(n4178) );
  NAND2X1TS U1092 ( .A(n4354), .B(n4194), .Y(n4181) );
  BUFX3TS U1093 ( .A(n4211), .Y(n4700) );
  AOI21X1TS U1094 ( .A0(n4806), .A1(n4700), .B0(n4195), .Y(n4180) );
  AOI22X1TS U1095 ( .A0(Data_array_SWR[2]), .A1(n4651), .B0(Data_array_SWR[10]), .B1(n3773), .Y(n4183) );
  AOI22X1TS U1096 ( .A0(Data_array_SWR[6]), .A1(n3754), .B0(Data_array_SWR[14]), .B1(n4650), .Y(n4182) );
  NAND2X1TS U1097 ( .A(n4342), .B(n4194), .Y(n4185) );
  AOI21X1TS U1098 ( .A0(n3627), .A1(n4700), .B0(n4195), .Y(n4184) );
  AOI22X1TS U1099 ( .A0(Data_array_SWR[8]), .A1(n3753), .B0(Data_array_SWR[16]), .B1(n3773), .Y(n4187) );
  AOI22X1TS U1100 ( .A0(Data_array_SWR[20]), .A1(n4650), .B0(
        Data_array_SWR[12]), .B1(n3755), .Y(n4186) );
  NAND2X1TS U1101 ( .A(n4363), .B(n4194), .Y(n4189) );
  AOI21X1TS U1102 ( .A0(n4836), .A1(n4700), .B0(n4195), .Y(n4188) );
  AOI22X1TS U1103 ( .A0(Data_array_SWR[4]), .A1(n3753), .B0(Data_array_SWR[12]), .B1(n3772), .Y(n4191) );
  AOI22X1TS U1104 ( .A0(Data_array_SWR[8]), .A1(n3755), .B0(Data_array_SWR[16]), .B1(n4650), .Y(n4190) );
  NAND2X1TS U1105 ( .A(n4351), .B(n4194), .Y(n4193) );
  AOI21X1TS U1106 ( .A0(n4837), .A1(n4206), .B0(n4195), .Y(n4192) );
  NAND2X1TS U1107 ( .A(n4360), .B(n4194), .Y(n4197) );
  AOI21X1TS U1108 ( .A0(n3638), .A1(n4700), .B0(n4195), .Y(n4196) );
  NAND2X1TS U1109 ( .A(n4363), .B(n4209), .Y(n4201) );
  INVX2TS U1110 ( .A(n4199), .Y(n4212) );
  AOI21X1TS U1111 ( .A0(n4769), .A1(n4700), .B0(n4212), .Y(n4200) );
  NAND2X1TS U1112 ( .A(n4351), .B(n4209), .Y(n4203) );
  AOI21X1TS U1113 ( .A0(n4885), .A1(n4700), .B0(n4212), .Y(n4202) );
  NAND2X1TS U1114 ( .A(n4342), .B(n4209), .Y(n4205) );
  AOI21X1TS U1115 ( .A0(n2578), .A1(n4700), .B0(n4212), .Y(n4204) );
  NAND2X1TS U1116 ( .A(n4354), .B(n4209), .Y(n4208) );
  AOI21X1TS U1117 ( .A0(n3657), .A1(n4206), .B0(n4212), .Y(n4207) );
  NAND2X1TS U1118 ( .A(n4210), .B(n4209), .Y(n4214) );
  BUFX3TS U1119 ( .A(n4211), .Y(n4706) );
  AOI21X1TS U1120 ( .A0(DmP_mant_SFG_SWR_25_), .A1(n4706), .B0(n4212), .Y(
        n4213) );
  AOI22X1TS U1121 ( .A0(n4264), .A1(n4490), .B0(n4221), .B1(n3776), .Y(n4225)
         );
  NAND2X1TS U1122 ( .A(n4262), .B(n4261), .Y(n4224) );
  OAI22X1TS U1123 ( .A0(n4264), .A1(n4640), .B0(n4221), .B1(n4663), .Y(n4222)
         );
  AOI22X1TS U1124 ( .A0(n4222), .A1(n4224), .B0(n4665), .B1(
        Raw_mant_NRM_SWR[11]), .Y(n4223) );
  XNOR2X2TS U1125 ( .A(DP_OP_15J43_122_6956_n1), .B(n2563), .Y(n4323) );
  NOR4X1TS U1126 ( .A(exp_rslt_NRM2_EW1[0]), .B(exp_rslt_NRM2_EW1[6]), .C(
        exp_rslt_NRM2_EW1[5]), .D(exp_rslt_NRM2_EW1[3]), .Y(n4226) );
  OAI32X1TS U1127 ( .A0(exp_rslt_NRM2_EW1[1]), .A1(n4883), .A2(n4295), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[24]), .Y(n4228) );
  INVX2TS U1128 ( .A(n4228), .Y(n1149) );
  NAND2X1TS U1129 ( .A(n4230), .B(n4229), .Y(n4235) );
  OAI2BB2XLTS U1130 ( .B0(n4232), .B1(n4477), .A0N(n3776), .A1N(n4231), .Y(
        n4233) );
  AOI22X1TS U1131 ( .A0(n4233), .A1(n4235), .B0(n4738), .B1(
        Raw_mant_NRM_SWR[13]), .Y(n4234) );
  NAND2X1TS U1132 ( .A(n4258), .B(Data_Y[26]), .Y(n4237) );
  INVX2TS U1133 ( .A(n4674), .Y(n4280) );
  NAND2X1TS U1134 ( .A(n4256), .B(Data_Y[24]), .Y(n4238) );
  INVX2TS U1135 ( .A(n4674), .Y(n4283) );
  NAND2X1TS U1136 ( .A(n4258), .B(Data_X[23]), .Y(n4239) );
  NAND2X1TS U1137 ( .A(n4258), .B(Data_X[25]), .Y(n4240) );
  NAND2X1TS U1138 ( .A(n4259), .B(Data_X[18]), .Y(n4241) );
  NAND2X1TS U1139 ( .A(n4259), .B(Data_X[17]), .Y(n4242) );
  NAND2X1TS U1140 ( .A(n4258), .B(Data_X[21]), .Y(n4243) );
  NAND2X1TS U1141 ( .A(n4256), .B(Data_X[29]), .Y(n4244) );
  NAND2X1TS U1142 ( .A(n4258), .B(Data_X[22]), .Y(n4245) );
  NAND2X1TS U1143 ( .A(n4256), .B(Data_X[27]), .Y(n4246) );
  NAND2X1TS U1144 ( .A(n4259), .B(Data_X[20]), .Y(n4247) );
  NAND2X1TS U1145 ( .A(n4259), .B(Data_X[14]), .Y(n4248) );
  NAND2X1TS U1146 ( .A(n4256), .B(Data_Y[25]), .Y(n4249) );
  NAND2X1TS U1147 ( .A(n4256), .B(Data_Y[23]), .Y(n4250) );
  NAND2X1TS U1148 ( .A(n4256), .B(Data_X[24]), .Y(n4251) );
  NAND2X1TS U1149 ( .A(n4259), .B(Data_Y[8]), .Y(n4252) );
  NAND2X1TS U1150 ( .A(n4256), .B(Data_X[9]), .Y(n4253) );
  NAND2X1TS U1151 ( .A(n4259), .B(Data_X[4]), .Y(n4254) );
  NAND2X1TS U1152 ( .A(n4258), .B(Data_X[10]), .Y(n4255) );
  NAND2X1TS U1153 ( .A(n4256), .B(Data_X[13]), .Y(n4257) );
  NAND2X1TS U1154 ( .A(n4256), .B(Data_X[26]), .Y(n4260) );
  AOI22X1TS U1155 ( .A0(n4268), .A1(n4453), .B0(n3776), .B1(n4267), .Y(n4272)
         );
  NAND2X1TS U1156 ( .A(n4266), .B(n4265), .Y(n4271) );
  OAI22X1TS U1157 ( .A0(n4268), .A1(n4477), .B0(n4663), .B1(n4267), .Y(n4269)
         );
  INVX2TS U1158 ( .A(n4674), .Y(n4676) );
  NAND2X1TS U1159 ( .A(n4284), .B(Data_X[28]), .Y(n4273) );
  NAND2X1TS U1160 ( .A(n4284), .B(Data_X[15]), .Y(n4274) );
  NAND2X1TS U1161 ( .A(n4284), .B(Data_X[3]), .Y(n4275) );
  NAND2X1TS U1162 ( .A(n4284), .B(Data_Y[7]), .Y(n4276) );
  NAND2X1TS U1163 ( .A(n4284), .B(Data_X[2]), .Y(n4277) );
  NAND2X1TS U1164 ( .A(n4284), .B(Data_X[0]), .Y(n4278) );
  NAND2X1TS U1165 ( .A(n4284), .B(Data_X[1]), .Y(n4279) );
  NAND2X1TS U1166 ( .A(n4284), .B(Data_X[5]), .Y(n4281) );
  NAND2X1TS U1167 ( .A(n4284), .B(Data_X[11]), .Y(n4282) );
  NAND2X1TS U1168 ( .A(n4284), .B(Data_X[16]), .Y(n4285) );
  INVX2TS U1169 ( .A(n4287), .Y(n4288) );
  OAI2BB2XLTS U1170 ( .B0(n4286), .B1(n4640), .A0N(n3775), .A1N(n4290), .Y(
        n4291) );
  AOI22X1TS U1171 ( .A0(n4291), .A1(n4293), .B0(n4665), .B1(
        Raw_mant_NRM_SWR[19]), .Y(n4292) );
  NOR2BX4TS U1172 ( .AN(n4295), .B(exp_rslt_NRM2_EW1[1]), .Y(n4326) );
  OAI32X1TS U1173 ( .A0(exp_rslt_NRM2_EW1[0]), .A1(n4883), .A2(n4326), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[23]), .Y(n4296) );
  INVX2TS U1174 ( .A(n4296), .Y(n1150) );
  OAI32X1TS U1175 ( .A0(exp_rslt_NRM2_EW1[6]), .A1(n4883), .A2(n4326), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[29]), .Y(n4297) );
  INVX2TS U1176 ( .A(n4297), .Y(n1151) );
  OAI32X1TS U1177 ( .A0(exp_rslt_NRM2_EW1[2]), .A1(n4883), .A2(n4326), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[25]), .Y(n4298) );
  INVX2TS U1178 ( .A(n4298), .Y(n1152) );
  OAI32X1TS U1179 ( .A0(exp_rslt_NRM2_EW1[5]), .A1(n4883), .A2(n4326), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[28]), .Y(n4299) );
  INVX2TS U1180 ( .A(n4299), .Y(n1155) );
  OAI32X1TS U1181 ( .A0(exp_rslt_NRM2_EW1[3]), .A1(n4883), .A2(n4326), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[26]), .Y(n4300) );
  INVX2TS U1182 ( .A(n4300), .Y(n1153) );
  OAI32X1TS U1183 ( .A0(exp_rslt_NRM2_EW1[4]), .A1(n4883), .A2(n4326), .B0(
        n3750), .B1(final_result_ieee[27]), .Y(n4301) );
  INVX2TS U1184 ( .A(n4301), .Y(n1154) );
  XNOR2X1TS U1185 ( .A(n3657), .B(n2575), .Y(n4306) );
  OAI2BB2XLTS U1186 ( .B0(n4303), .B1(n4663), .A0N(n4496), .A1N(n4302), .Y(
        n4304) );
  AOI22X1TS U1187 ( .A0(n4304), .A1(n4306), .B0(n4665), .B1(n4747), .Y(n4305)
         );
  OA21XLTS U1188 ( .A0(Raw_mant_NRM_SWR[13]), .A1(Raw_mant_NRM_SWR[11]), .B0(
        n4308), .Y(n4373) );
  AOI21X1TS U1189 ( .A0(n4310), .A1(n4309), .B0(n4373), .Y(n4311) );
  AOI21X1TS U1190 ( .A0(n4315), .A1(n4314), .B0(n4313), .Y(n4692) );
  AOI22X1TS U1191 ( .A0(n4608), .A1(shift_value_SHT2_EWR[2]), .B0(n4379), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n4316) );
  AOI22X1TS U1192 ( .A0(n4318), .A1(n4496), .B0(n3775), .B1(n4317), .Y(n4322)
         );
  XNOR2X1TS U1193 ( .A(n2599), .B(n1505), .Y(n4321) );
  OAI22X1TS U1194 ( .A0(n4318), .A1(n4498), .B0(n4317), .B1(n4663), .Y(n4319)
         );
  AOI22X1TS U1195 ( .A0(n4319), .A1(n4321), .B0(n4665), .B1(
        Raw_mant_NRM_SWR[21]), .Y(n4320) );
  AOI31X4TS U1196 ( .A0(exp_rslt_NRM2_EW1[5]), .A1(exp_rslt_NRM2_EW1[6]), .A2(
        n4325), .B0(n4742), .Y(n4672) );
  AOI22X1TS U1197 ( .A0(n3752), .A1(final_result_ieee[12]), .B0(n3746), .B1(
        n4616), .Y(n4327) );
  AOI22X1TS U1198 ( .A0(n3752), .A1(final_result_ieee[13]), .B0(n3746), .B1(
        n4619), .Y(n4328) );
  AOI22X1TS U1199 ( .A0(n3752), .A1(final_result_ieee[8]), .B0(n3749), .B1(
        n4619), .Y(n4329) );
  AOI22X1TS U1200 ( .A0(n3752), .A1(final_result_ieee[9]), .B0(n3749), .B1(
        n4616), .Y(n4330) );
  NAND2X4TS U1201 ( .A(n3748), .B(n4793), .Y(n4340) );
  AOI22X1TS U1202 ( .A0(n3752), .A1(final_result_ieee[2]), .B0(n3746), .B1(
        n4351), .Y(n4331) );
  AOI22X1TS U1203 ( .A0(n3752), .A1(final_result_ieee[5]), .B0(n3745), .B1(
        n4357), .Y(n4332) );
  AOI22X1TS U1204 ( .A0(n4883), .A1(final_result_ieee[4]), .B0(n3746), .B1(
        n4366), .Y(n4333) );
  AOI22X1TS U1205 ( .A0(n3752), .A1(final_result_ieee[3]), .B0(n3746), .B1(
        n4354), .Y(n4334) );
  AOI22X1TS U1206 ( .A0(n4742), .A1(final_result_ieee[6]), .B0(n3746), .B1(
        n4363), .Y(n4335) );
  AOI22X1TS U1207 ( .A0(n4742), .A1(final_result_ieee[7]), .B0(n3746), .B1(
        n4360), .Y(n4336) );
  AOI22X1TS U1208 ( .A0(n4742), .A1(final_result_ieee[0]), .B0(n3746), .B1(
        n4342), .Y(n4337) );
  AOI22X1TS U1209 ( .A0(n4883), .A1(final_result_ieee[1]), .B0(n3745), .B1(
        n4345), .Y(n4339) );
  AOI22X1TS U1210 ( .A0(n3751), .A1(final_result_ieee[21]), .B0(n3749), .B1(
        n4342), .Y(n4343) );
  AOI22X1TS U1211 ( .A0(n3751), .A1(final_result_ieee[20]), .B0(n3748), .B1(
        n4345), .Y(n4346) );
  AOI22X1TS U1212 ( .A0(n3751), .A1(final_result_ieee[22]), .B0(n3748), .B1(
        n4348), .Y(n4349) );
  AOI22X1TS U1213 ( .A0(n3751), .A1(final_result_ieee[19]), .B0(n3749), .B1(
        n4351), .Y(n4352) );
  AOI22X1TS U1214 ( .A0(n3751), .A1(final_result_ieee[18]), .B0(n3749), .B1(
        n4354), .Y(n4355) );
  AOI22X1TS U1215 ( .A0(n3751), .A1(final_result_ieee[16]), .B0(n3748), .B1(
        n4357), .Y(n4358) );
  AOI22X1TS U1216 ( .A0(n3751), .A1(final_result_ieee[14]), .B0(n3749), .B1(
        n4360), .Y(n4361) );
  AOI22X1TS U1217 ( .A0(n3751), .A1(final_result_ieee[15]), .B0(n3749), .B1(
        n4363), .Y(n4364) );
  AOI22X1TS U1218 ( .A0(n4742), .A1(final_result_ieee[17]), .B0(n3749), .B1(
        n4366), .Y(n4368) );
  INVX2TS U1219 ( .A(n4370), .Y(n4580) );
  INVX2TS U1220 ( .A(n4371), .Y(n4378) );
  OAI31X1TS U1221 ( .A0(n1452), .A1(n4378), .A2(n4377), .B0(n4376), .Y(n4695)
         );
  AOI22X1TS U1222 ( .A0(n4580), .A1(n4695), .B0(n4379), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n4380) );
  NAND2X1TS U1223 ( .A(n4382), .B(n4381), .Y(n4391) );
  NAND2X1TS U1224 ( .A(n4385), .B(n4384), .Y(n4386) );
  NOR4X1TS U1225 ( .A(n4393), .B(n4392), .C(n4391), .D(n4390), .Y(n4405) );
  AOI22X1TS U1226 ( .A0(intDY_EWSW[16]), .A1(n1438), .B0(n1460), .B1(
        intDY_EWSW[0]), .Y(n4402) );
  NAND4XLTS U1227 ( .A(n4398), .B(n4397), .C(n4396), .D(n4395), .Y(n4401) );
  NOR4BX1TS U1228 ( .AN(n4402), .B(n4401), .C(n4400), .D(n4399), .Y(n4403) );
  AOI22X1TS U1229 ( .A0(n4450), .A1(n4407), .B0(intDX_EWSW[31]), .B1(n4668), 
        .Y(n4409) );
  XNOR2X1TS U1230 ( .A(intAS), .B(intDY_EWSW[31]), .Y(n4714) );
  AOI22X1TS U1231 ( .A0(n4670), .A1(intDX_EWSW[31]), .B0(n4422), .B1(
        SIGN_FLAG_EXP), .Y(n4408) );
  AOI22X1TS U1232 ( .A0(n4438), .A1(n4755), .B0(n4441), .B1(n4805), .Y(n4410)
         );
  OAI21X1TS U1233 ( .A0(n73), .A1(n4445), .B0(n4410), .Y(n793) );
  AOI22X1TS U1234 ( .A0(n4447), .A1(intDY_EWSW[2]), .B0(n4645), .B1(
        DMP_EXP_EWSW[2]), .Y(n4411) );
  OAI21X1TS U1235 ( .A0(n1483), .A1(n4445), .B0(n4411), .Y(n817) );
  AOI22X1TS U1236 ( .A0(n4447), .A1(intDY_EWSW[13]), .B0(n4422), .B1(
        DMP_EXP_EWSW[13]), .Y(n4412) );
  AOI22X1TS U1237 ( .A0(n4450), .A1(intDX_EWSW[7]), .B0(n4449), .B1(
        DmP_EXP_EWSW[7]), .Y(n4413) );
  OAI21X1TS U1238 ( .A0(n1459), .A1(n4445), .B0(n4413), .Y(n663) );
  AOI22X1TS U1239 ( .A0(n4447), .A1(intDY_EWSW[3]), .B0(n4645), .B1(
        DMP_EXP_EWSW[3]), .Y(n4414) );
  AOI22X1TS U1240 ( .A0(n4447), .A1(intDY_EWSW[5]), .B0(n4422), .B1(
        DMP_EXP_EWSW[5]), .Y(n4415) );
  AOI22X1TS U1241 ( .A0(n4438), .A1(intDY_EWSW[19]), .B0(n4441), .B1(
        DMP_EXP_EWSW[19]), .Y(n4417) );
  OAI21X1TS U1242 ( .A0(n4780), .A1(n4445), .B0(n4417), .Y(n800) );
  AOI22X1TS U1243 ( .A0(n4443), .A1(intDY_EWSW[12]), .B0(n4422), .B1(
        DMP_EXP_EWSW[12]), .Y(n4418) );
  OAI21X1TS U1244 ( .A0(n1462), .A1(n4429), .B0(n4418), .Y(n807) );
  AOI22X1TS U1245 ( .A0(n4447), .A1(intDY_EWSW[9]), .B0(n4645), .B1(
        DMP_EXP_EWSW[9]), .Y(n4419) );
  OAI21X1TS U1246 ( .A0(n1488), .A1(n4429), .B0(n4419), .Y(n810) );
  AOI22X1TS U1247 ( .A0(n4443), .A1(intDY_EWSW[16]), .B0(n4441), .B1(
        DMP_EXP_EWSW[16]), .Y(n4420) );
  AOI22X1TS U1248 ( .A0(n4447), .A1(intDY_EWSW[4]), .B0(n4645), .B1(
        DMP_EXP_EWSW[4]), .Y(n4421) );
  OAI21X1TS U1249 ( .A0(n1434), .A1(n4445), .B0(n4421), .Y(n815) );
  AOI22X1TS U1250 ( .A0(n4423), .A1(n4749), .B0(DmP_EXP_EWSW[12]), .B1(n4449), 
        .Y(n4424) );
  OAI21X1TS U1251 ( .A0(n4774), .A1(n4429), .B0(n4424), .Y(n653) );
  AOI22X1TS U1252 ( .A0(n4447), .A1(intDY_EWSW[1]), .B0(n4645), .B1(
        DMP_EXP_EWSW[1]), .Y(n4425) );
  OAI21X1TS U1253 ( .A0(n1482), .A1(n4429), .B0(n4425), .Y(n818) );
  AOI22X1TS U1254 ( .A0(n4443), .A1(intDY_EWSW[10]), .B0(n4645), .B1(
        DMP_EXP_EWSW[10]), .Y(n4426) );
  OAI21X1TS U1255 ( .A0(n1437), .A1(n4445), .B0(n4426), .Y(n809) );
  INVX2TS U1256 ( .A(n3978), .Y(n4464) );
  AOI22X1TS U1257 ( .A0(n4464), .A1(intDY_EWSW[0]), .B0(n4645), .B1(
        DMP_EXP_EWSW[0]), .Y(n4427) );
  OAI21X1TS U1258 ( .A0(n1460), .A1(n4429), .B0(n4427), .Y(n819) );
  AOI22X1TS U1259 ( .A0(n4447), .A1(intDY_EWSW[11]), .B0(n4422), .B1(
        DMP_EXP_EWSW[11]), .Y(n4428) );
  AOI22X1TS U1260 ( .A0(n4447), .A1(n3623), .B0(n4422), .B1(DmP_EXP_EWSW[8]), 
        .Y(n4430) );
  AOI22X1TS U1261 ( .A0(n4438), .A1(intDY_EWSW[27]), .B0(n4449), .B1(
        DMP_EXP_EWSW[27]), .Y(n4431) );
  OAI21X1TS U1262 ( .A0(n1464), .A1(n4429), .B0(n4431), .Y(n792) );
  AOI22X1TS U1263 ( .A0(n4443), .A1(intDY_EWSW[17]), .B0(n4441), .B1(
        DMP_EXP_EWSW[17]), .Y(n4432) );
  AOI22X1TS U1264 ( .A0(n4438), .A1(intDY_EWSW[21]), .B0(n4441), .B1(
        DMP_EXP_EWSW[21]), .Y(n4434) );
  OAI21X1TS U1265 ( .A0(n1458), .A1(n4429), .B0(n4434), .Y(n798) );
  AOI22X1TS U1266 ( .A0(n4438), .A1(intDY_EWSW[28]), .B0(n4441), .B1(
        DMP_EXP_EWSW[28]), .Y(n4435) );
  OAI21X1TS U1267 ( .A0(n1432), .A1(n4445), .B0(n4435), .Y(n791) );
  AOI22X1TS U1268 ( .A0(n4438), .A1(n3648), .B0(n4736), .B1(DMP_EXP_EWSW[29]), 
        .Y(n4436) );
  OAI21X1TS U1269 ( .A0(n1491), .A1(n4445), .B0(n4436), .Y(n790) );
  AOI22X1TS U1270 ( .A0(n4438), .A1(intDY_EWSW[22]), .B0(n4441), .B1(
        DMP_EXP_EWSW[22]), .Y(n4437) );
  OAI21X1TS U1271 ( .A0(n1487), .A1(n4429), .B0(n4437), .Y(n797) );
  AOI22X1TS U1272 ( .A0(n4438), .A1(intDY_EWSW[20]), .B0(n4441), .B1(
        DMP_EXP_EWSW[20]), .Y(n4439) );
  OAI21X1TS U1273 ( .A0(n1461), .A1(n4445), .B0(n4439), .Y(n799) );
  AOI22X1TS U1274 ( .A0(n4443), .A1(intDY_EWSW[15]), .B0(n4422), .B1(
        DMP_EXP_EWSW[15]), .Y(n4440) );
  AOI22X1TS U1275 ( .A0(n4443), .A1(intDY_EWSW[14]), .B0(n4441), .B1(
        DMP_EXP_EWSW[14]), .Y(n4442) );
  AOI22X1TS U1276 ( .A0(n4443), .A1(n4753), .B0(n4446), .B1(n4796), .Y(n4444)
         );
  OAI21X1TS U1277 ( .A0(n1430), .A1(n4429), .B0(n4444), .Y(n629) );
  AOI22X1TS U1278 ( .A0(n4447), .A1(n4786), .B0(n4736), .B1(n4887), .Y(n4448)
         );
  OAI21X1TS U1279 ( .A0(n1439), .A1(n4445), .B0(n4448), .Y(n795) );
  AOI22X1TS U1280 ( .A0(n4450), .A1(n4785), .B0(DmP_EXP_EWSW[23]), .B1(n4446), 
        .Y(n4451) );
  OAI21X1TS U1281 ( .A0(n2589), .A1(n4429), .B0(n4451), .Y(n1157) );
  AOI22X1TS U1282 ( .A0(n4455), .A1(n4453), .B0(n4454), .B1(n3774), .Y(n4459)
         );
  XNOR2X1TS U1283 ( .A(n1517), .B(n2582), .Y(n4458) );
  OAI22X1TS U1284 ( .A0(n4455), .A1(n4498), .B0(n4454), .B1(n4663), .Y(n4456)
         );
  AOI22X1TS U1285 ( .A0(n4456), .A1(n4458), .B0(n4738), .B1(
        Raw_mant_NRM_SWR[22]), .Y(n4457) );
  INVX2TS U1286 ( .A(n4460), .Y(n665) );
  INVX2TS U1287 ( .A(n4461), .Y(n813) );
  INVX2TS U1288 ( .A(n4462), .Y(n639) );
  AOI222X1TS U1289 ( .A0(n4840), .A1(n4464), .B0(n4422), .B1(DmP_EXP_EWSW[0]), 
        .C0(intDY_EWSW[0]), .C1(n4463), .Y(n4465) );
  INVX2TS U1290 ( .A(n4465), .Y(n677) );
  INVX2TS U1291 ( .A(n4468), .Y(n4469) );
  NAND2X2TS U1292 ( .A(n4470), .B(n4469), .Y(n4633) );
  INVX2TS U1293 ( .A(n4471), .Y(n4473) );
  OA21X2TS U1294 ( .A0(n4633), .A1(n4473), .B0(n4472), .Y(n4479) );
  AOI22X1TS U1295 ( .A0(n4479), .A1(n3774), .B0(n4478), .B1(n4496), .Y(n4483)
         );
  INVX2TS U1296 ( .A(n4474), .Y(n4476) );
  NAND2X1TS U1297 ( .A(n4476), .B(n4475), .Y(n4482) );
  OAI22X1TS U1298 ( .A0(n4479), .A1(n4663), .B0(n4478), .B1(n4477), .Y(n4480)
         );
  AOI22X1TS U1299 ( .A0(n4480), .A1(n4482), .B0(n4665), .B1(
        Raw_mant_NRM_SWR[17]), .Y(n4481) );
  INVX2TS U1300 ( .A(n3766), .Y(n4592) );
  NAND2BX2TS U1301 ( .AN(n4486), .B(n4485), .Y(n4507) );
  NOR2X2TS U1302 ( .A(n4504), .B(n4507), .Y(n4487) );
  AOI22X1TS U1303 ( .A0(n4608), .A1(Data_array_SWR[24]), .B0(n3764), .B1(n4563), .Y(n4488) );
  XNOR2X1TS U1304 ( .A(n2578), .B(DMP_SFG[21]), .Y(n4494) );
  OAI2BB2XLTS U1305 ( .B0(n4491), .B1(n4663), .A0N(n4490), .A1N(n4489), .Y(
        n4492) );
  AOI22X1TS U1306 ( .A0(n4492), .A1(n4494), .B0(n4665), .B1(
        Raw_mant_NRM_SWR[23]), .Y(n4493) );
  AOI22X1TS U1307 ( .A0(n4499), .A1(n4496), .B0(n4497), .B1(n3775), .Y(n4503)
         );
  XNOR2X1TS U1308 ( .A(n1516), .B(n2586), .Y(n4502) );
  OAI22X1TS U1309 ( .A0(n4499), .A1(n4640), .B0(n4497), .B1(n4663), .Y(n4500)
         );
  OAI21X1TS U1310 ( .A0(n4503), .A1(n4502), .B0(n4501), .Y(n589) );
  AOI22X1TS U1311 ( .A0(n3761), .A1(Raw_mant_NRM_SWR[23]), .B0(n4544), .B1(
        Raw_mant_NRM_SWR[2]), .Y(n4506) );
  OAI2BB1X1TS U1312 ( .A0N(DmP_mant_SHT1_SW[21]), .A1N(n4694), .B0(n4506), .Y(
        n4593) );
  AOI22X1TS U1313 ( .A0(n4581), .A1(n2595), .B0(n3765), .B1(n4593), .Y(n4512)
         );
  AOI22X1TS U1314 ( .A0(n3761), .A1(Raw_mant_NRM_SWR[22]), .B0(n4580), .B1(
        Raw_mant_NRM_SWR[3]), .Y(n4510) );
  AOI22X1TS U1315 ( .A0(n3759), .A1(n4563), .B0(n3767), .B1(n4591), .Y(n4511)
         );
  OAI211X1TS U1316 ( .A0(n4596), .A1(n4561), .B0(n4512), .C0(n4511), .Y(n859)
         );
  AOI222X4TS U1317 ( .A0(n4694), .A1(DmP_mant_SHT1_SW[11]), .B0(
        Raw_mant_NRM_SWR[12]), .B1(n4580), .C0(Raw_mant_NRM_SWR[13]), .C1(
        n4547), .Y(n4600) );
  CLKBUFX2TS U1318 ( .A(n4513), .Y(n4602) );
  AOI22X1TS U1319 ( .A0(Raw_mant_NRM_SWR[13]), .A1(n4544), .B0(
        DmP_mant_SHT1_SW[10]), .B1(n4740), .Y(n4514) );
  AOI22X1TS U1320 ( .A0(n4602), .A1(Data_array_SWR[11]), .B0(n3765), .B1(n3739), .Y(n4518) );
  AOI22X1TS U1321 ( .A0(n4782), .A1(n4547), .B0(n4540), .B1(
        Raw_mant_NRM_SWR[11]), .Y(n4515) );
  AOI22X1TS U1322 ( .A0(n4782), .A1(n4540), .B0(DmP_mant_SHT1_SW[9]), .B1(
        n4545), .Y(n4516) );
  AOI22X1TS U1323 ( .A0(n3758), .A1(n4607), .B0(n3766), .B1(n4597), .Y(n4517)
         );
  OAI211X1TS U1324 ( .A0(n4600), .A1(n4561), .B0(n4518), .C0(n4517), .Y(n848)
         );
  AOI22X1TS U1325 ( .A0(n4547), .A1(Raw_mant_NRM_SWR[15]), .B0(n4545), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n4520) );
  AOI22X1TS U1326 ( .A0(n4602), .A1(Data_array_SWR[15]), .B0(n3767), .B1(n4609), .Y(n4524) );
  AOI22X1TS U1327 ( .A0(n4547), .A1(Raw_mant_NRM_SWR[18]), .B0(n4545), .B1(
        DmP_mant_SHT1_SW[16]), .Y(n4521) );
  AOI22X1TS U1328 ( .A0(n3761), .A1(n3675), .B0(n4545), .B1(
        DmP_mant_SHT1_SW[14]), .Y(n4522) );
  AOI22X1TS U1329 ( .A0(n3758), .A1(n4603), .B0(n3765), .B1(n4610), .Y(n4523)
         );
  OAI211X1TS U1330 ( .A0(n4613), .A1(n4561), .B0(n4524), .C0(n4523), .Y(n852)
         );
  OAI2BB2XLTS U1331 ( .B0(n2535), .B1(n3737), .A0N(Raw_mant_NRM_SWR[21]), 
        .A1N(n4544), .Y(n4525) );
  AOI22X1TS U1332 ( .A0(n3761), .A1(Raw_mant_NRM_SWR[2]), .B0(
        Raw_mant_NRM_SWR[23]), .B1(n4544), .Y(n4526) );
  OAI2BB1X1TS U1333 ( .A0N(DmP_mant_SHT1_SW[0]), .A1N(n4740), .B0(n4526), .Y(
        n4583) );
  AOI22X1TS U1334 ( .A0(n4608), .A1(Data_array_SWR[2]), .B0(n3767), .B1(n4583), 
        .Y(n4531) );
  INVX2TS U1335 ( .A(n4586), .Y(n4577) );
  AOI22X1TS U1336 ( .A0(n4803), .A1(n3761), .B0(n4747), .B1(n4580), .Y(n4529)
         );
  AOI22X1TS U1337 ( .A0(n3763), .A1(n4577), .B0(n3759), .B1(n4587), .Y(n4530)
         );
  AOI22X1TS U1338 ( .A0(n4545), .A1(DmP_mant_SHT1_SW[7]), .B0(n4540), .B1(
        n3675), .Y(n4533) );
  AOI22X1TS U1339 ( .A0(n4608), .A1(Data_array_SWR[8]), .B0(n3764), .B1(n3741), 
        .Y(n4536) );
  AOI22X1TS U1340 ( .A0(n4547), .A1(n4809), .B0(Raw_mant_NRM_SWR[15]), .B1(
        n4544), .Y(n4534) );
  AOI22X1TS U1341 ( .A0(n3757), .A1(n3771), .B0(n3759), .B1(n4597), .Y(n4535)
         );
  OAI2BB2XLTS U1342 ( .B0(n2535), .B1(n4537), .A0N(Raw_mant_NRM_SWR[21]), 
        .A1N(n4547), .Y(n4538) );
  AOI22X1TS U1343 ( .A0(n3761), .A1(Raw_mant_NRM_SWR[19]), .B0(n4540), .B1(
        Raw_mant_NRM_SWR[6]), .Y(n4539) );
  AOI22X1TS U1344 ( .A0(n4513), .A1(Data_array_SWR[19]), .B0(n3766), .B1(n4601), .Y(n4543) );
  AOI22X1TS U1345 ( .A0(n4803), .A1(n4540), .B0(n4747), .B1(n4547), .Y(n4541)
         );
  AOI22X1TS U1346 ( .A0(n3764), .A1(n4604), .B0(n3759), .B1(n4591), .Y(n4542)
         );
  OAI211X1TS U1347 ( .A0(n3769), .A1(n4561), .B0(n4543), .C0(n4542), .Y(n856)
         );
  AOI22X1TS U1348 ( .A0(n4545), .A1(DmP_mant_SHT1_SW[4]), .B0(
        Raw_mant_NRM_SWR[19]), .B1(n4544), .Y(n4546) );
  AOI22X1TS U1349 ( .A0(n4513), .A1(Data_array_SWR[6]), .B0(n3767), .B1(n3738), 
        .Y(n4551) );
  AOI22X1TS U1350 ( .A0(n4804), .A1(n4547), .B0(Raw_mant_NRM_SWR[18]), .B1(
        n4580), .Y(n4548) );
  AOI22X1TS U1351 ( .A0(n3764), .A1(n4588), .B0(n3759), .B1(n3741), .Y(n4550)
         );
  OAI211X1TS U1352 ( .A0(n3770), .A1(n4561), .B0(n4551), .C0(n4550), .Y(n843)
         );
  INVX2TS U1353 ( .A(n4597), .Y(n4554) );
  AOI22X1TS U1354 ( .A0(n4513), .A1(Data_array_SWR[9]), .B0(n3766), .B1(n3741), 
        .Y(n4553) );
  AOI22X1TS U1355 ( .A0(n3765), .A1(n3771), .B0(n3759), .B1(n3739), .Y(n4552)
         );
  OAI211X1TS U1356 ( .A0(n4554), .A1(n4561), .B0(n4553), .C0(n4552), .Y(n846)
         );
  AOI22X1TS U1357 ( .A0(n4608), .A1(Data_array_SWR[4]), .B0(n3765), .B1(n4587), 
        .Y(n4556) );
  AOI22X1TS U1358 ( .A0(n3757), .A1(n3738), .B0(n3758), .B1(n4588), .Y(n4555)
         );
  AOI22X1TS U1359 ( .A0(n4513), .A1(Data_array_SWR[17]), .B0(n3763), .B1(n4603), .Y(n4558) );
  AOI22X1TS U1360 ( .A0(n3756), .A1(n4601), .B0(n3758), .B1(n4604), .Y(n4557)
         );
  INVX2TS U1361 ( .A(n4609), .Y(n4562) );
  AOI2BB2X1TS U1362 ( .B0(n4608), .B1(Data_array_SWR[13]), .A0N(n4592), .A1N(
        n4600), .Y(n4560) );
  AOI22X1TS U1363 ( .A0(n3765), .A1(n4607), .B0(n3759), .B1(n4610), .Y(n4559)
         );
  OAI211X1TS U1364 ( .A0(n4562), .A1(n4561), .B0(n4560), .C0(n4559), .Y(n850)
         );
  INVX2TS U1365 ( .A(n3763), .Y(n4576) );
  AOI22X1TS U1366 ( .A0(n4608), .A1(n4801), .B0(n3757), .B1(n4563), .Y(n4565)
         );
  NAND2X1TS U1367 ( .A(n3766), .B(n4593), .Y(n4564) );
  AOI22X1TS U1368 ( .A0(n4602), .A1(Data_array_SWR[3]), .B0(n3766), .B1(n4577), 
        .Y(n4567) );
  AOI22X1TS U1369 ( .A0(n3756), .A1(n4587), .B0(n3759), .B1(n3738), .Y(n4566)
         );
  AOI22X1TS U1370 ( .A0(n4581), .A1(Data_array_SWR[7]), .B0(n3767), .B1(n4588), 
        .Y(n4569) );
  AOI22X1TS U1371 ( .A0(n3757), .A1(n3741), .B0(n3758), .B1(n3771), .Y(n4568)
         );
  AOI22X1TS U1372 ( .A0(n4513), .A1(Data_array_SWR[16]), .B0(n3766), .B1(n4610), .Y(n4571) );
  AOI22X1TS U1373 ( .A0(n3756), .A1(n4603), .B0(n3758), .B1(n4601), .Y(n4570)
         );
  AOI22X1TS U1374 ( .A0(n4513), .A1(Data_array_SWR[12]), .B0(n3767), .B1(n3739), .Y(n4573) );
  AOI22X1TS U1375 ( .A0(n3756), .A1(n4607), .B0(n3759), .B1(n4609), .Y(n4572)
         );
  AOI22X1TS U1376 ( .A0(n4513), .A1(Data_array_SWR[20]), .B0(n3766), .B1(n4604), .Y(n4575) );
  AOI22X1TS U1377 ( .A0(n3757), .A1(n4591), .B0(n3759), .B1(n4593), .Y(n4574)
         );
  OAI2BB2X1TS U1378 ( .B0(n1452), .B1(n3737), .A0N(Raw_mant_NRM_SWR[24]), 
        .A1N(n4580), .Y(n4582) );
  AOI22X1TS U1379 ( .A0(n4581), .A1(Data_array_SWR[1]), .B0(n3767), .B1(n4582), 
        .Y(n4579) );
  AOI22X1TS U1380 ( .A0(n3757), .A1(n4577), .B0(n3765), .B1(n4583), .Y(n4578)
         );
  AOI22X1TS U1381 ( .A0(n4581), .A1(Data_array_SWR[0]), .B0(
        Raw_mant_NRM_SWR[25]), .B1(n4580), .Y(n4585) );
  AOI21X1TS U1382 ( .A0(n3756), .A1(n4583), .B0(n4582), .Y(n4584) );
  AOI22X1TS U1383 ( .A0(n4602), .A1(Data_array_SWR[5]), .B0(n3764), .B1(n3738), 
        .Y(n4590) );
  AOI22X1TS U1384 ( .A0(n3756), .A1(n4588), .B0(n3766), .B1(n4587), .Y(n4589)
         );
  AOI22X1TS U1385 ( .A0(n4608), .A1(Data_array_SWR[21]), .B0(n3764), .B1(n4591), .Y(n4595) );
  AOI2BB2X1TS U1386 ( .B0(n3757), .B1(n4593), .A0N(n4592), .A1N(n3769), .Y(
        n4594) );
  OAI211X1TS U1387 ( .A0(n4596), .A1(n4509), .B0(n4595), .C0(n4594), .Y(n858)
         );
  AOI22X1TS U1388 ( .A0(n4602), .A1(Data_array_SWR[10]), .B0(n3767), .B1(n3771), .Y(n4599) );
  AOI22X1TS U1389 ( .A0(n3757), .A1(n3739), .B0(n3764), .B1(n4597), .Y(n4598)
         );
  AOI22X1TS U1390 ( .A0(n4602), .A1(Data_array_SWR[18]), .B0(n3765), .B1(n4601), .Y(n4606) );
  AOI22X1TS U1391 ( .A0(n3757), .A1(n4604), .B0(n3767), .B1(n4603), .Y(n4605)
         );
  AOI22X1TS U1392 ( .A0(n4608), .A1(Data_array_SWR[14]), .B0(n3767), .B1(n4607), .Y(n4612) );
  AOI22X1TS U1393 ( .A0(n3757), .A1(n4610), .B0(n3764), .B1(n4609), .Y(n4611)
         );
  XNOR2X1TS U1394 ( .A(n1469), .B(n2597), .Y(n4615) );
  OAI222X1TS U1395 ( .A0(n4640), .A1(n4615), .B0(n4614), .B1(n1469), .C0(n4698), .C1(n1452), .Y(n612) );
  INVX2TS U1396 ( .A(n4616), .Y(n4617) );
  OAI222X1TS U1397 ( .A0(n4623), .A1(n4618), .B0(n4621), .B1(n4617), .C0(n4771), .C1(n4707), .Y(n545) );
  INVX2TS U1398 ( .A(n4619), .Y(n4620) );
  OAI222X1TS U1399 ( .A0(n4623), .A1(n4622), .B0(n4621), .B1(n4620), .C0(n4770), .C1(n4656), .Y(n544) );
  NAND2X1TS U1400 ( .A(n4625), .B(n4624), .Y(n4628) );
  XNOR2X1TS U1401 ( .A(n4633), .B(n4628), .Y(n4631) );
  XNOR2X1TS U1402 ( .A(n4629), .B(n4628), .Y(n4630) );
  OAI222X1TS U1403 ( .A0(n4631), .A1(n3851), .B0(n4630), .B1(n4477), .C0(n4841), .C1(n4684), .Y(n597) );
  OAI2BB1X1TS U1404 ( .A0N(n4634), .A1N(n4633), .B0(n4632), .Y(n4637) );
  XNOR2X1TS U1405 ( .A(n4637), .B(n4638), .Y(n4642) );
  XOR2X1TS U1406 ( .A(n4639), .B(n4638), .Y(n4641) );
  OAI222X1TS U1407 ( .A0(n4642), .A1(n3851), .B0(n4641), .B1(n4498), .C0(n4788), .C1(n4684), .Y(n595) );
  AOI32X4TS U1408 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B0(n4643), .B1(n4752), .Y(n4741)
         );
  MXI2X1TS U1409 ( .A(n4645), .B(n4644), .S0(n4741), .Y(n936) );
  BUFX3TS U1410 ( .A(n4646), .Y(n4647) );
  BUFX3TS U1411 ( .A(busy), .Y(n4711) );
  BUFX3TS U1412 ( .A(n4711), .Y(n4713) );
  AOI22X1TS U1413 ( .A0(Data_array_SWR[17]), .A1(n3754), .B0(n2580), .B1(n3744), .Y(n4649) );
  AOI22X1TS U1414 ( .A0(Data_array_SWR[21]), .A1(n3773), .B0(
        Data_array_SWR[13]), .B1(n3753), .Y(n4648) );
  NAND2X1TS U1415 ( .A(n4649), .B(n4648), .Y(n4660) );
  AOI22X1TS U1416 ( .A0(Data_array_SWR[16]), .A1(n3754), .B0(
        Data_array_SWR[24]), .B1(n3744), .Y(n4653) );
  AOI22X1TS U1417 ( .A0(Data_array_SWR[20]), .A1(n3772), .B0(
        Data_array_SWR[12]), .B1(n3753), .Y(n4652) );
  NAND2X1TS U1418 ( .A(n4653), .B(n4652), .Y(n4658) );
  AOI21X1TS U1419 ( .A0(left_right_SHT2), .A1(n4660), .B0(n4654), .Y(n4732) );
  MXI2X1TS U1420 ( .A(n4732), .B(n1510), .S0(n4211), .Y(n547) );
  AOI21X1TS U1421 ( .A0(n4660), .A1(n4794), .B0(n4659), .Y(n4744) );
  MXI2X1TS U1422 ( .A(n4744), .B(n1509), .S0(n4211), .Y(n546) );
  NOR2BX1TS U1423 ( .AN(n4662), .B(DmP_mant_SFG_SWR_25_), .Y(n4664) );
  OAI22X1TS U1424 ( .A0(n4664), .A1(n4663), .B0(n1480), .B1(n4684), .Y(n621)
         );
  MXI2X1TS U1425 ( .A(n2597), .B(n1499), .S0(n4665), .Y(n613) );
  OAI22X1TS U1426 ( .A0(n3978), .A1(n1439), .B0(n1441), .B1(n4668), .Y(n4666)
         );
  OAI22X1TS U1427 ( .A0(n3978), .A1(n1430), .B0(n1442), .B1(n4668), .Y(n4669)
         );
  BUFX3TS U1428 ( .A(n4816), .Y(n4708) );
  NOR2BX1TS U1429 ( .AN(OP_FLAG_SFG), .B(n4679), .Y(n4683) );
  NAND2X1TS U1430 ( .A(n4681), .B(n4680), .Y(n4682) );
  XNOR2X1TS U1431 ( .A(n4683), .B(n4682), .Y(n4685) );
  INVX2TS U1432 ( .A(n4703), .Y(n4731) );
  NAND2X1TS U1433 ( .A(DmP_EXP_EWSW[23]), .B(n1492), .Y(n4717) );
  XOR2X1TS U1434 ( .A(n1441), .B(n1443), .Y(n4686) );
  XNOR2X1TS U1435 ( .A(n4717), .B(n4686), .Y(n4687) );
  INVX2TS U1436 ( .A(n4741), .Y(n4739) );
  AOI22X1TS U1437 ( .A0(n4741), .A1(n4737), .B0(n4787), .B1(n4739), .Y(n933)
         );
  INVX2TS U1438 ( .A(n4816), .Y(n4697) );
  INVX2TS U1439 ( .A(n4206), .Y(n4707) );
  INVX2TS U1440 ( .A(n4701), .Y(n4699) );
  INVX2TS U1441 ( .A(n4727), .Y(n4702) );
  INVX2TS U1442 ( .A(n4727), .Y(n4710) );
  BUFX3TS U1443 ( .A(n4816), .Y(n4727) );
  INVX2TS U1444 ( .A(n4698), .Y(n4705) );
  INVX2TS U1445 ( .A(n4701), .Y(n4712) );
  INVX2TS U1446 ( .A(n4714), .Y(n4715) );
  NAND2X1TS U1447 ( .A(n4799), .B(n1443), .Y(n4718) );
  AOI22X1TS U1448 ( .A0(n4718), .A1(n4717), .B0(n1441), .B1(n4887), .Y(n4729)
         );
  AOI21X1TS U1449 ( .A0(n1442), .A1(n4796), .B0(n4729), .Y(n4719) );
  AOI21X1TS U1450 ( .A0(n1447), .A1(n4798), .B0(n4719), .Y(n4725) );
  AOI21X1TS U1451 ( .A0(n1446), .A1(n4808), .B0(n4725), .Y(n4720) );
  XNOR2X1TS U1452 ( .A(DMP_EXP_EWSW[27]), .B(DmP_EXP_EWSW[27]), .Y(n4721) );
  XOR2X1TS U1453 ( .A(n4722), .B(n4721), .Y(n4723) );
  XOR2X1TS U1454 ( .A(n1445), .B(n1446), .Y(n4724) );
  XOR2X1TS U1455 ( .A(n4725), .B(n4724), .Y(n4726) );
  XOR2X1TS U1456 ( .A(n1447), .B(n1442), .Y(n4728) );
  XOR2X1TS U1457 ( .A(n4729), .B(n4728), .Y(n4730) );
  OAI2BB2XLTS U1458 ( .B0(n4732), .B1(n4743), .A0N(n4742), .A1N(
        final_result_ieee[10]), .Y(n582) );
  INVX2TS U1459 ( .A(n4733), .Y(n4735) );
  AOI22X1TS U1460 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n4735), .B1(n4792), .Y(
        inst_FSM_INPUT_ENABLE_state_next_1_) );
  NAND2X1TS U1461 ( .A(n4735), .B(n4734), .Y(n937) );
  AOI22X1TS U1462 ( .A0(n4741), .A1(n4736), .B0(n3778), .B1(n4739), .Y(n935)
         );
  AOI22X1TS U1463 ( .A0(n4741), .A1(n3778), .B0(n4737), .B1(n4739), .Y(n934)
         );
  AOI22X1TS U1464 ( .A0(n4741), .A1(n4738), .B0(n4740), .B1(n4739), .Y(n931)
         );
  AOI22X1TS U1465 ( .A0(n4741), .A1(n4740), .B0(n3752), .B1(n4739), .Y(n930)
         );
  OAI2BB2XLTS U1466 ( .B0(n4744), .B1(n4743), .A0N(n4742), .A1N(
        final_result_ieee[11]), .Y(n581) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_3x1_b_W32 ( select, ch_0, ch_1, ch_2, data_out );
  input [1:0] select;
  input [31:0] ch_0;
  input [31:0] ch_1;
  input [31:0] ch_2;
  output [31:0] data_out;
  wire   n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176;

  BUFX3TS U2 ( .A(n138), .Y(n169) );
  AOI222X1TS U3 ( .A0(n133), .A1(ch_1[13]), .B0(n158), .B1(ch_0[13]), .C0(n157), .C1(ch_2[13]), .Y(n159) );
  NOR2BX4TS U4 ( .AN(select[1]), .B(select[0]), .Y(n138) );
  BUFX3TS U5 ( .A(n134), .Y(n158) );
  BUFX3TS U6 ( .A(n133), .Y(n146) );
  BUFX3TS U7 ( .A(n134), .Y(n145) );
  BUFX3TS U8 ( .A(n138), .Y(n173) );
  BUFX3TS U9 ( .A(n134), .Y(n174) );
  AOI222X1TS U10 ( .A0(n170), .A1(ch_1[4]), .B0(n158), .B1(ch_0[4]), .C0(n157), 
        .C1(ch_2[4]), .Y(n149) );
  AOI222X1TS U11 ( .A0(n133), .A1(ch_1[14]), .B0(n158), .B1(ch_0[14]), .C0(
        n157), .C1(ch_2[14]), .Y(n156) );
  AOI222X1TS U12 ( .A0(n133), .A1(ch_1[15]), .B0(n158), .B1(ch_0[15]), .C0(
        n157), .C1(ch_2[15]), .Y(n152) );
  AOI222X1TS U13 ( .A0(n133), .A1(ch_1[18]), .B0(n158), .B1(ch_0[18]), .C0(
        n157), .C1(ch_2[18]), .Y(n148) );
  AOI222X1TS U14 ( .A0(n133), .A1(ch_1[19]), .B0(n158), .B1(ch_0[19]), .C0(
        n157), .C1(ch_2[19]), .Y(n155) );
  AOI222X1TS U15 ( .A0(n133), .A1(ch_1[21]), .B0(n158), .B1(ch_0[21]), .C0(
        n157), .C1(ch_2[21]), .Y(n150) );
  AOI222X1TS U16 ( .A0(n133), .A1(ch_1[28]), .B0(n158), .B1(ch_0[28]), .C0(
        n157), .C1(ch_2[28]), .Y(n151) );
  AOI222X1TS U17 ( .A0(n133), .A1(ch_1[30]), .B0(n158), .B1(ch_0[30]), .C0(
        n157), .C1(ch_2[30]), .Y(n154) );
  NOR2X2TS U18 ( .A(select[1]), .B(select[0]), .Y(n134) );
  NOR2BX4TS U19 ( .AN(select[0]), .B(select[1]), .Y(n133) );
  AOI222X1TS U20 ( .A0(n146), .A1(ch_1[11]), .B0(n145), .B1(ch_0[11]), .C0(
        n138), .C1(ch_2[11]), .Y(n135) );
  AOI222X1TS U21 ( .A0(n146), .A1(ch_1[8]), .B0(n145), .B1(ch_0[8]), .C0(n138), 
        .C1(ch_2[8]), .Y(n136) );
  AOI222X1TS U22 ( .A0(n146), .A1(ch_1[6]), .B0(n145), .B1(ch_0[6]), .C0(n138), 
        .C1(ch_2[6]), .Y(n137) );
  AOI222X1TS U23 ( .A0(n146), .A1(ch_1[9]), .B0(n145), .B1(ch_0[9]), .C0(n138), 
        .C1(ch_2[9]), .Y(n139) );
  AOI222X1TS U24 ( .A0(n170), .A1(ch_1[5]), .B0(n174), .B1(ch_0[5]), .C0(n169), 
        .C1(ch_2[5]), .Y(n164) );
  AOI222X1TS U25 ( .A0(n170), .A1(ch_1[16]), .B0(n174), .B1(ch_0[16]), .C0(
        n169), .C1(ch_2[16]), .Y(n171) );
  AOI222X1TS U26 ( .A0(n175), .A1(ch_1[23]), .B0(n134), .B1(ch_0[23]), .C0(
        n173), .C1(ch_2[23]), .Y(n160) );
  BUFX3TS U27 ( .A(n170), .Y(n175) );
  AOI222X1TS U28 ( .A0(n146), .A1(ch_1[24]), .B0(n145), .B1(ch_0[24]), .C0(
        n169), .C1(ch_2[24]), .Y(n140) );
  AOI222X1TS U29 ( .A0(n146), .A1(ch_1[29]), .B0(n145), .B1(ch_0[29]), .C0(
        n169), .C1(ch_2[29]), .Y(n141) );
  AOI222X1TS U30 ( .A0(n146), .A1(ch_1[10]), .B0(n145), .B1(ch_0[10]), .C0(
        n169), .C1(ch_2[10]), .Y(n142) );
  AOI222X1TS U31 ( .A0(n146), .A1(ch_1[7]), .B0(n145), .B1(ch_0[7]), .C0(n169), 
        .C1(ch_2[7]), .Y(n143) );
  AOI222X1TS U32 ( .A0(n146), .A1(ch_1[25]), .B0(n145), .B1(ch_0[25]), .C0(
        n169), .C1(ch_2[25]), .Y(n144) );
  BUFX3TS U33 ( .A(n169), .Y(n157) );
  AOI222X1TS U34 ( .A0(n175), .A1(ch_1[2]), .B0(n134), .B1(ch_0[2]), .C0(n173), 
        .C1(ch_2[2]), .Y(n161) );
  AOI222X1TS U35 ( .A0(n175), .A1(ch_1[27]), .B0(n174), .B1(ch_0[27]), .C0(
        n173), .C1(ch_2[27]), .Y(n162) );
  AOI222X1TS U36 ( .A0(n175), .A1(ch_1[17]), .B0(n174), .B1(ch_0[17]), .C0(
        n173), .C1(ch_2[17]), .Y(n163) );
  AOI222X1TS U37 ( .A0(n175), .A1(ch_1[12]), .B0(n174), .B1(ch_0[12]), .C0(
        n173), .C1(ch_2[12]), .Y(n165) );
  AOI222X1TS U38 ( .A0(n175), .A1(ch_1[20]), .B0(n174), .B1(ch_0[20]), .C0(
        n173), .C1(ch_2[20]), .Y(n166) );
  AOI222X1TS U39 ( .A0(n175), .A1(ch_1[22]), .B0(n174), .B1(ch_0[22]), .C0(
        n173), .C1(ch_2[22]), .Y(n167) );
  AOI222X1TS U40 ( .A0(n175), .A1(ch_1[31]), .B0(n174), .B1(ch_0[31]), .C0(
        n173), .C1(ch_2[31]), .Y(n168) );
  AOI222X1TS U41 ( .A0(n175), .A1(ch_1[26]), .B0(n174), .B1(ch_0[26]), .C0(
        n173), .C1(ch_2[26]), .Y(n172) );
  AOI222X1TS U42 ( .A0(n146), .A1(ch_1[3]), .B0(n145), .B1(ch_0[3]), .C0(n169), 
        .C1(ch_2[3]), .Y(n147) );
  AOI222X1TS U43 ( .A0(n175), .A1(ch_1[1]), .B0(n174), .B1(ch_0[1]), .C0(n173), 
        .C1(ch_2[1]), .Y(n176) );
  AOI222X1TS U44 ( .A0(n170), .A1(ch_1[0]), .B0(n158), .B1(ch_0[0]), .C0(n157), 
        .C1(ch_2[0]), .Y(n153) );
  CLKBUFX2TS U45 ( .A(n133), .Y(n170) );
  INVX2TS U46 ( .A(n135), .Y(data_out[11]) );
  INVX2TS U47 ( .A(n136), .Y(data_out[8]) );
  INVX2TS U48 ( .A(n137), .Y(data_out[6]) );
  INVX2TS U49 ( .A(n139), .Y(data_out[9]) );
  INVX2TS U50 ( .A(n140), .Y(data_out[24]) );
  INVX2TS U51 ( .A(n141), .Y(data_out[29]) );
  INVX2TS U52 ( .A(n142), .Y(data_out[10]) );
  INVX2TS U53 ( .A(n143), .Y(data_out[7]) );
  INVX2TS U54 ( .A(n144), .Y(data_out[25]) );
  INVX2TS U55 ( .A(n147), .Y(data_out[3]) );
  INVX2TS U56 ( .A(n148), .Y(data_out[18]) );
  INVX2TS U57 ( .A(n149), .Y(data_out[4]) );
  INVX2TS U58 ( .A(n150), .Y(data_out[21]) );
  INVX2TS U59 ( .A(n151), .Y(data_out[28]) );
  INVX2TS U60 ( .A(n152), .Y(data_out[15]) );
  INVX2TS U61 ( .A(n153), .Y(data_out[0]) );
  INVX2TS U62 ( .A(n154), .Y(data_out[30]) );
  INVX2TS U63 ( .A(n155), .Y(data_out[19]) );
  INVX2TS U64 ( .A(n156), .Y(data_out[14]) );
  INVX2TS U65 ( .A(n159), .Y(data_out[13]) );
  INVX2TS U66 ( .A(n160), .Y(data_out[23]) );
  INVX2TS U67 ( .A(n161), .Y(data_out[2]) );
  INVX2TS U68 ( .A(n162), .Y(data_out[27]) );
  INVX2TS U69 ( .A(n163), .Y(data_out[17]) );
  INVX2TS U70 ( .A(n164), .Y(data_out[5]) );
  INVX2TS U71 ( .A(n165), .Y(data_out[12]) );
  INVX2TS U72 ( .A(n166), .Y(data_out[20]) );
  INVX2TS U73 ( .A(n167), .Y(data_out[22]) );
  INVX2TS U74 ( .A(n168), .Y(data_out[31]) );
  INVX2TS U75 ( .A(n171), .Y(data_out[16]) );
  INVX2TS U76 ( .A(n172), .Y(data_out[26]) );
  INVX2TS U77 ( .A(n176), .Y(data_out[1]) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
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
  DFFRXLTS Q_reg_29_ ( .D(D[29]), .CK(clk), .RN(OUT5), .Q(Q[29]) );
  DFFRXLTS Q_reg_27_ ( .D(D[27]), .CK(clk), .RN(n2), .Q(Q[27]) );
  DFFRXLTS Q_reg_25_ ( .D(D[25]), .CK(clk), .RN(n2), .Q(Q[25]) );
  INVX2TS U9 ( .A(rst), .Y(OUT5) );
  INVX2TS U33 ( .A(rst), .Y(n2) );
  DFFRX1TS Q_reg_30_ ( .D(D[30]), .CK(clk), .RN(n2), .Q(Q[30]) );
  DFFRX1TS Q_reg_28_ ( .D(D[28]), .CK(clk), .RN(n2), .Q(Q[28]) );
  DFFRX1TS Q_reg_23_ ( .D(D[23]), .CK(clk), .RN(n2), .Q(Q[23]) );
  DFFRX1TS Q_reg_26_ ( .D(D[26]), .CK(clk), .RN(n2), .Q(Q[26]) );
  DFFRX1TS Q_reg_24_ ( .D(D[24]), .CK(clk), .RN(n2), .Q(Q[24]) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W32_0 ( select, ch_0, ch_1, data_out );
  input [31:0] ch_0;
  input [31:0] ch_1;
  output [31:0] data_out;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  CLKBUFX2TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_1[23]), .B0(n7), .B1(ch_0[23]), .Y(
        data_out[23]) );
  AO22XLTS U3 ( .A0(n1), .A1(ch_1[24]), .B0(n7), .B1(ch_0[24]), .Y(
        data_out[24]) );
  AO22XLTS U4 ( .A0(n3), .A1(ch_1[6]), .B0(n5), .B1(ch_0[6]), .Y(data_out[6])
         );
  AO22XLTS U5 ( .A0(n4), .A1(ch_1[19]), .B0(n6), .B1(ch_0[19]), .Y(
        data_out[19]) );
  AO22XLTS U6 ( .A0(n1), .A1(ch_1[8]), .B0(n5), .B1(ch_0[8]), .Y(data_out[8])
         );
  AO22XLTS U7 ( .A0(n1), .A1(ch_1[7]), .B0(n5), .B1(ch_0[7]), .Y(data_out[7])
         );
  AO22XLTS U8 ( .A0(n1), .A1(ch_1[25]), .B0(n7), .B1(ch_0[25]), .Y(
        data_out[25]) );
  AO22XLTS U9 ( .A0(n3), .A1(ch_1[0]), .B0(n5), .B1(ch_0[0]), .Y(data_out[0])
         );
  AO22XLTS U10 ( .A0(n2), .A1(ch_1[12]), .B0(n6), .B1(ch_0[12]), .Y(
        data_out[12]) );
  AO22XLTS U11 ( .A0(n2), .A1(ch_1[28]), .B0(n7), .B1(ch_0[28]), .Y(
        data_out[28]) );
  AO22XLTS U12 ( .A0(n3), .A1(ch_1[4]), .B0(n5), .B1(ch_0[4]), .Y(data_out[4])
         );
  AO22XLTS U13 ( .A0(n4), .A1(ch_1[10]), .B0(n6), .B1(ch_0[10]), .Y(
        data_out[10]) );
  AO22XLTS U14 ( .A0(n3), .A1(ch_1[14]), .B0(n6), .B1(ch_0[14]), .Y(
        data_out[14]) );
  AO22XLTS U15 ( .A0(n3), .A1(ch_1[15]), .B0(n6), .B1(ch_0[15]), .Y(
        data_out[15]) );
  AO22XLTS U16 ( .A0(n2), .A1(ch_1[16]), .B0(n6), .B1(ch_0[16]), .Y(
        data_out[16]) );
  AO22XLTS U17 ( .A0(n2), .A1(ch_1[18]), .B0(n6), .B1(ch_0[18]), .Y(
        data_out[18]) );
  AO22XLTS U18 ( .A0(n2), .A1(ch_1[20]), .B0(n7), .B1(ch_0[20]), .Y(
        data_out[20]) );
  AO22XLTS U19 ( .A0(n2), .A1(ch_1[30]), .B0(n8), .B1(ch_0[30]), .Y(
        data_out[30]) );
  AO22XLTS U20 ( .A0(n4), .A1(ch_1[5]), .B0(n5), .B1(ch_0[5]), .Y(data_out[5])
         );
  AO22XLTS U21 ( .A0(n3), .A1(ch_1[27]), .B0(n7), .B1(ch_0[27]), .Y(
        data_out[27]) );
  AO22XLTS U22 ( .A0(n2), .A1(ch_1[2]), .B0(n5), .B1(ch_0[2]), .Y(data_out[2])
         );
  AO22XLTS U23 ( .A0(n3), .A1(ch_1[9]), .B0(n5), .B1(ch_0[9]), .Y(data_out[9])
         );
  AO22XLTS U24 ( .A0(n2), .A1(ch_1[1]), .B0(n5), .B1(ch_0[1]), .Y(data_out[1])
         );
  AO22XLTS U25 ( .A0(n2), .A1(ch_1[11]), .B0(n6), .B1(ch_0[11]), .Y(
        data_out[11]) );
  AO22XLTS U26 ( .A0(n4), .A1(ch_1[13]), .B0(n6), .B1(ch_0[13]), .Y(
        data_out[13]) );
  AO22XLTS U27 ( .A0(n3), .A1(ch_1[17]), .B0(n6), .B1(ch_0[17]), .Y(
        data_out[17]) );
  AO22XLTS U28 ( .A0(n4), .A1(ch_1[21]), .B0(n7), .B1(ch_0[21]), .Y(
        data_out[21]) );
  AO22XLTS U29 ( .A0(n4), .A1(ch_1[3]), .B0(n5), .B1(ch_0[3]), .Y(data_out[3])
         );
  AO22XLTS U30 ( .A0(n4), .A1(ch_1[22]), .B0(n7), .B1(ch_0[22]), .Y(
        data_out[22]) );
  AO22XLTS U31 ( .A0(n4), .A1(ch_1[29]), .B0(n7), .B1(ch_0[29]), .Y(
        data_out[29]) );
  AO22XLTS U32 ( .A0(n1), .A1(ch_1[26]), .B0(n7), .B1(ch_0[26]), .Y(
        data_out[26]) );
  AO22XLTS U33 ( .A0(n3), .A1(ch_1[31]), .B0(n8), .B1(ch_0[31]), .Y(
        data_out[31]) );
  BUFX3TS U34 ( .A(select), .Y(n2) );
  BUFX3TS U35 ( .A(select), .Y(n3) );
  BUFX3TS U36 ( .A(select), .Y(n4) );
  INVX2TS U37 ( .A(n1), .Y(n8) );
  BUFX3TS U38 ( .A(n8), .Y(n5) );
  BUFX3TS U39 ( .A(n8), .Y(n6) );
  BUFX3TS U40 ( .A(n8), .Y(n7) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_0 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX1TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
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
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
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
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
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
         n72, n73, n74, n75, n76, n77, n78, n79, n80;
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

  d_ff_en_W2 operation_dff ( .clk(clk), .rst(rst), .enable(1'b1), .D({n36, n41}), .Q(operation_reg) );
  d_ff_en_W32_1 reg_dataA ( .clk(clk), .rst(rst), .enable(1'b1), .D(Data_1), 
        .Q(dataA), .OUT4(n71) );
  d_ff_en_W32_0 reg_dataB ( .clk(clk), .rst(rst), .enable(1'b1), .D(Data_2), 
        .Q(dataB), .OUT3(n76), .OUT4(n74), .OUT5(n72) );
  d_ff_en_W1 NaN_dff ( .clk(clk), .rst(rst), .enable(1'b1), .D(NaN_reg), .Q(
        NaN_flag) );
  demux_1x3_1 demux_beg_op ( .data(begin_operation), .select({n36, n41}), 
        .ch1(beg_fsm_addsubt), .ch2(beg_fsm_cordic), .ch3(beg_fsm_mult) );
  demux_1x3_0 demux_ack_op ( .data(ack_operation), .select({n36, n39}), .ch2(
        ack_fsm_cordic), .ch3(ack_fsm_mult) );
  deco_op deco_operation ( .operation({n41, operation[0]}), .op_mod_add_subt(
        op_mod_add_subt), .op_mod_cordic(op_mod_cordic) );
  Mux_2x1_W1_3 mux_beg_addsubt ( .select(n39), .ch_0(beg_fsm_addsubt), .ch_1(
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
  DFFSX1TS R_3 ( .D(n75), .CK(clk), .SN(n74), .Q(n79) );
  DFFSX1TS R_4 ( .D(n73), .CK(clk), .SN(n72), .Q(n80) );
  DFFSX1TS R_11 ( .D(n70), .CK(clk), .SN(n76), .Q(n78) );
  DFFRX1TS R_12 ( .D(n69), .CK(clk), .RN(n71), .Q(n77) );
  INVX2TS U37 ( .A(n40), .Y(n39) );
  INVX2TS U38 ( .A(n40), .Y(n38) );
  INVX2TS U39 ( .A(n40), .Y(n41) );
  NAND3X1TS U40 ( .A(n44), .B(n43), .C(n42), .Y(n45) );
  NAND3X1TS U41 ( .A(n52), .B(n51), .C(n50), .Y(n69) );
  INVX4TS U42 ( .A(operation[1]), .Y(n40) );
  NAND3XLTS U43 ( .A(dataB[28]), .B(dataB[23]), .C(dataB[25]), .Y(n63) );
  AOI31XLTS U44 ( .A0(n61), .A1(n60), .A2(n59), .B0(n66), .Y(n64) );
  NOR3XLTS U45 ( .A(dataA[2]), .B(dataA[5]), .C(dataA[4]), .Y(n48) );
  NAND4XLTS U46 ( .A(dataA[30]), .B(dataA[27]), .C(dataA[28]), .D(dataA[26]), 
        .Y(n54) );
  NAND4XLTS U47 ( .A(dataA[29]), .B(dataA[23]), .C(dataA[25]), .D(dataA[24]), 
        .Y(n53) );
  NAND4XLTS U48 ( .A(n80), .B(n79), .C(n78), .D(n65), .Y(n67) );
  INVX2TS U49 ( .A(operation[2]), .Y(n34) );
  INVX2TS U50 ( .A(n34), .Y(n35) );
  INVX2TS U51 ( .A(n34), .Y(n36) );
  NOR4X1TS U52 ( .A(dataB[17]), .B(dataB[16]), .C(dataB[8]), .D(n45), .Y(n70)
         );
  NOR4X1TS U53 ( .A(dataA[13]), .B(dataA[15]), .C(dataA[17]), .D(dataA[18]), 
        .Y(n46) );
  NOR4X1TS U54 ( .A(dataA[21]), .B(dataA[19]), .C(dataA[14]), .D(dataA[20]), 
        .Y(n47) );
  NOR4X1TS U55 ( .A(dataB[4]), .B(dataB[18]), .C(dataB[20]), .D(dataB[1]), .Y(
        n43) );
  NOR4X1TS U56 ( .A(dataA[8]), .B(dataA[7]), .C(dataA[6]), .D(dataA[0]), .Y(
        n51) );
  NOR4X1TS U57 ( .A(dataB[3]), .B(dataB[5]), .C(dataB[22]), .D(dataB[0]), .Y(
        n42) );
  AOI31XLTS U58 ( .A0(n57), .A1(n56), .A2(n55), .B0(dataB[27]), .Y(n68) );
  NOR4X1TS U59 ( .A(dataB[7]), .B(dataB[9]), .C(dataB[11]), .D(dataB[6]), .Y(
        n73) );
  NOR4X1TS U60 ( .A(dataB[2]), .B(dataB[10]), .C(dataB[12]), .D(dataB[14]), 
        .Y(n75) );
  NOR4X1TS U61 ( .A(dataA[3]), .B(dataA[16]), .C(dataA[1]), .D(dataA[22]), .Y(
        n49) );
  NOR4X1TS U62 ( .A(dataB[15]), .B(dataB[19]), .C(dataB[13]), .D(dataB[21]), 
        .Y(n44) );
  NOR4X1TS U63 ( .A(dataA[12]), .B(dataA[11]), .C(dataA[10]), .D(dataA[9]), 
        .Y(n52) );
  NOR3XLTS U64 ( .A(dataB[25]), .B(dataB[31]), .C(n58), .Y(n55) );
  AND4X1TS U66 ( .A(n49), .B(n48), .C(n47), .D(n46), .Y(n50) );
  NOR4BX1TS U67 ( .AN(operation_reg[1]), .B(dataB[28]), .C(operation_reg[0]), 
        .D(dataB[23]), .Y(n57) );
  NOR4X1TS U68 ( .A(dataB[30]), .B(dataB[24]), .C(dataB[26]), .D(dataB[29]), 
        .Y(n56) );
  OR3X1TS U69 ( .A(n77), .B(n54), .C(n53), .Y(n58) );
  NOR4X1TS U70 ( .A(dataA[30]), .B(dataA[27]), .C(dataA[28]), .D(dataA[26]), 
        .Y(n61) );
  NOR4X1TS U71 ( .A(dataA[29]), .B(dataA[23]), .C(dataA[25]), .D(dataA[24]), 
        .Y(n60) );
  NOR4BX1TS U72 ( .AN(operation_reg[1]), .B(dataA[31]), .C(operation_reg[0]), 
        .D(n77), .Y(n59) );
  NOR2X1TS U73 ( .A(operation_reg[1]), .B(n58), .Y(n66) );
  NAND4XLTS U74 ( .A(dataB[30]), .B(dataB[24]), .C(dataB[26]), .D(dataB[29]), 
        .Y(n62) );
  OAI31X1TS U75 ( .A0(n64), .A1(n63), .A2(n62), .B0(dataB[27]), .Y(n65) );
  OAI2BB2XLTS U76 ( .B0(n68), .B1(n67), .A0N(n66), .A1N(operation_reg[0]), .Y(
        NaN_reg) );
initial $sdf_annotate("FPU_Interface2_KOA_2STAGE_syn.sdf"); 
 endmodule

