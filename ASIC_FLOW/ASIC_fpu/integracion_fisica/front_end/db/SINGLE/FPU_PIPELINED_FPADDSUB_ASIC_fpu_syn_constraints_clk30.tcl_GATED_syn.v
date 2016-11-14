/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:06:00 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_ShiftRegister_W7_51 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W13_50 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_9 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module FPU_PIPELINED_FPADDSUB_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_OP, 
        Data_X, Data_Y, add_subt, busy, overflow_flag, underflow_flag, 
        zero_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  output [31:0] final_result_ieee;
  input clk, rst, beg_OP, add_subt;
  output busy, overflow_flag, underflow_flag, zero_flag, ready;
  wire   enable_Pipeline_input, Shift_reg_FLAGS_7_6, Shift_reg_FLAGS_7_5,
         OP_FLAG_INIT, SIGN_FLAG_INIT, ZERO_FLAG_INIT, SIGN_FLAG_EXP,
         OP_FLAG_EXP, ZERO_FLAG_EXP, SIGN_FLAG_SHT1, OP_FLAG_SHT1,
         ZERO_FLAG_SHT1, ADD_OVRFLW_NRM, n_7_net_, left_right_SHT2,
         bit_shift_SHT2, SIGN_FLAG_SHT2, OP_FLAG_SHT2, ZERO_FLAG_SHT2,
         ADD_OVRFLW_NRM2, SIGN_FLAG_SHT1SHT2, ZERO_FLAG_SHT1SHT2,
         SIGN_FLAG_NRM, ZERO_FLAG_NRM, n_21_net_, SIGN_FLAG_SFG, ZERO_FLAG_SFG,
         N59, N60, ADD_OVRFLW_SGF, inst_ShiftRegister_net3663114,
         SFT2FRMT_STAGE_VARS_net3663024, FRMT_STAGE_DATAOUT_net3662952,
         SGF_STAGE_DMP_net3663006, NRM_STAGE_Raw_mant_net3662988,
         INPUT_STAGE_OPERANDY_net3662952, EXP_STAGE_DMP_net3663006,
         SHT1_STAGE_DMP_net3663006, SHT2_STAGE_DMP_net3663006,
         SHT2_SHIFT_DATA_net3662988, array_comparators_GTComparator_N0,
         array_comparators_LTComparator_N0, n388, n389, n390,
         DP_OP_15J181_122_6956_n18, DP_OP_15J181_122_6956_n17,
         DP_OP_15J181_122_6956_n16, DP_OP_15J181_122_6956_n15,
         DP_OP_15J181_122_6956_n14, DP_OP_15J181_122_6956_n8,
         DP_OP_15J181_122_6956_n7, DP_OP_15J181_122_6956_n6,
         DP_OP_15J181_122_6956_n5, DP_OP_15J181_122_6956_n4,
         DP_OP_15J181_122_6956_n3, DP_OP_15J181_122_6956_n2,
         DP_OP_15J181_122_6956_n1, intadd_429_CI, intadd_429_SUM_2_,
         intadd_429_SUM_1_, intadd_429_SUM_0_, intadd_429_n3, intadd_429_n2,
         intadd_429_n1, n393, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n615, n616, n617, n618, n619, n620, n621, n622, n623,
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
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942,
         n943, n944, n945, n946, n947, n948, n949, n950, n951, n952, n953,
         n954, n955, n956, n957, n958, n959, n960, n961, n962, n963, n964,
         n965, n966, n967, n968, n969, n970, n971, n972, n973, n974, n975,
         n976, n977, n978, n979, n980, n981, n982, n983, n984, n985, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067;
  wire   [3:0] Shift_reg_FLAGS_7;
  wire   [31:0] intDX_EWSW;
  wire   [30:0] intDY_EWSW;
  wire   [30:0] DMP_INIT_EWSW;
  wire   [27:0] DmP_INIT_EWSW;
  wire   [30:0] DMP_EXP_EWSW;
  wire   [27:0] DmP_EXP_EWSW;
  wire   [4:0] Shift_amount_EXP_EW;
  wire   [30:0] DMP_SHT1_EWSW;
  wire   [22:0] DmP_mant_SHT1_SW;
  wire   [4:0] Shift_amount_SHT1_EWR;
  wire   [4:0] LZD_raw_out_EWR;
  wire   [4:2] shft_value_mux_o_EWR;
  wire   [25:0] Raw_mant_NRM_SWR;
  wire   [51:0] Data_array_SWR;
  wire   [30:0] DMP_SHT2_EWSW;
  wire   [4:2] shift_value_SHT2_EWR;
  wire   [7:0] DMP_exp_NRM2_EW;
  wire   [7:0] DMP_exp_NRM_EW;
  wire   [25:0] sftr_odat_SHT2_SWR;
  wire   [4:0] LZD_output_NRM2_EW;
  wire   [7:0] exp_rslt_NRM2_EW1;
  wire   [30:0] DMP_SFG;
  wire   [24:2] DmP_mant_SFG_SWR;
  wire   [25:1] Raw_mant_SGF;
  wire   [31:0] formatted_number_W;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  SNPS_CLOCK_GATE_HIGH_ShiftRegister_W7_51 inst_ShiftRegister_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n390), .ENCLK(inst_ShiftRegister_net3663114), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W13_50 SFT2FRMT_STAGE_VARS_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[1]), .ENCLK(
        SFT2FRMT_STAGE_VARS_net3663024), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_6 FRMT_STAGE_DATAOUT_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[0]), .ENCLK(
        FRMT_STAGE_DATAOUT_net3662952), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_5 SGF_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n_21_net_), .ENCLK(SGF_STAGE_DMP_net3663006), .TE(1'b0)
         );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_1 NRM_STAGE_Raw_mant_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7[2]), .ENCLK(
        NRM_STAGE_Raw_mant_net3662988), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W32_0_7 INPUT_STAGE_OPERANDY_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enable_Pipeline_input), .ENCLK(
        INPUT_STAGE_OPERANDY_net3662952), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_9 EXP_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7_6), .ENCLK(EXP_STAGE_DMP_net3663006), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_8 SHT1_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(Shift_reg_FLAGS_7_5), .ENCLK(SHT1_STAGE_DMP_net3663006), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W31_0_7 SHT2_STAGE_DMP_clk_gate_Q_reg ( 
        .CLK(clk), .EN(busy), .ENCLK(SHT2_STAGE_DMP_net3663006), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_RegisterAdd_W26_0_4 SHT2_SHIFT_DATA_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n_7_net_), .ENCLK(SHT2_SHIFT_DATA_net3662988), .TE(1'b0) );
  DFFRXLTS inst_ShiftRegister_Q_reg_6_ ( .D(n1067), .CK(
        inst_ShiftRegister_net3663114), .RN(n1037), .Q(Shift_reg_FLAGS_7_6) );
  DFFRXLTS inst_ShiftRegister_Q_reg_5_ ( .D(Shift_reg_FLAGS_7_6), .CK(
        inst_ShiftRegister_net3663114), .RN(n1036), .Q(Shift_reg_FLAGS_7_5) );
  DFFRXLTS inst_ShiftRegister_Q_reg_3_ ( .D(busy), .CK(
        inst_ShiftRegister_net3663114), .RN(n1035), .Q(Shift_reg_FLAGS_7[3])
         );
  DFFRXLTS inst_ShiftRegister_Q_reg_2_ ( .D(Shift_reg_FLAGS_7[3]), .CK(
        inst_ShiftRegister_net3663114), .RN(n1034), .Q(Shift_reg_FLAGS_7[2])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(Shift_amount_EXP_EW[0]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1055), .Q(Shift_amount_SHT1_EWR[0])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(Shift_amount_EXP_EW[1]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1035), .Q(Shift_amount_SHT1_EWR[1])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(Shift_amount_EXP_EW[2]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1055), .Q(Shift_amount_SHT1_EWR[2])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(Shift_amount_EXP_EW[3]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1034), .Q(Shift_amount_SHT1_EWR[3])
         );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(Shift_amount_EXP_EW[4]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1040), .Q(Shift_amount_SHT1_EWR[4])
         );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n1044), 
        .Q(ready) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(formatted_number_W[23]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1049), .Q(final_result_ieee[23])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(formatted_number_W[24]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1062), .Q(final_result_ieee[24])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(formatted_number_W[25]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1050), .Q(final_result_ieee[25])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(formatted_number_W[26]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1049), .Q(final_result_ieee[26])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(formatted_number_W[27]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1062), .Q(final_result_ieee[27])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(formatted_number_W[28]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1050), .Q(final_result_ieee[28])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(formatted_number_W[29]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1061), .Q(final_result_ieee[29])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(formatted_number_W[30]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1061), .Q(final_result_ieee[30])
         );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(array_comparators_LTComparator_N0), 
        .CK(FRMT_STAGE_DATAOUT_net3662952), .RN(n1061), .Q(underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(array_comparators_GTComparator_N0), 
        .CK(FRMT_STAGE_DATAOUT_net3662952), .RN(n1061), .Q(overflow_flag) );
  DFFRXLTS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(Data_X[28]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1040), .Q(intDX_EWSW[28]), .QN(
        n403) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(DmP_INIT_EWSW[0]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1038), .Q(DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(DmP_EXP_EWSW[0]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1054), .Q(DmP_mant_SHT1_SW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(DmP_INIT_EWSW[1]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1052), .Q(DmP_EXP_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(DmP_EXP_EWSW[1]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1046), .Q(DmP_mant_SHT1_SW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(DmP_INIT_EWSW[2]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1038), .Q(DmP_EXP_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(DmP_EXP_EWSW[2]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1054), .Q(DmP_mant_SHT1_SW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(DmP_INIT_EWSW[3]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_EXP_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(DmP_EXP_EWSW[3]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_mant_SHT1_SW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(DmP_INIT_EWSW[4]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(DmP_EXP_EWSW[4]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_mant_SHT1_SW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(DmP_INIT_EWSW[5]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(DmP_EXP_EWSW[5]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_mant_SHT1_SW[5]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(DmP_INIT_EWSW[6]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_EXP_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(DmP_EXP_EWSW[6]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_mant_SHT1_SW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(DmP_INIT_EWSW[7]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1039), .Q(DmP_EXP_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(DmP_EXP_EWSW[7]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1035), .Q(DmP_mant_SHT1_SW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(DmP_INIT_EWSW[8]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1055), .Q(DmP_EXP_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(DmP_EXP_EWSW[8]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1034), .Q(DmP_mant_SHT1_SW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(DmP_INIT_EWSW[9]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1040), .Q(DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(DmP_EXP_EWSW[9]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1044), .Q(DmP_mant_SHT1_SW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(DmP_INIT_EWSW[10]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1037), .Q(DmP_EXP_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(DmP_EXP_EWSW[10]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1036), .Q(DmP_mant_SHT1_SW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(DmP_INIT_EWSW[11]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1035), .Q(DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(DmP_EXP_EWSW[11]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1041), .Q(DmP_mant_SHT1_SW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(DmP_INIT_EWSW[12]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1041), .Q(DmP_EXP_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(DmP_EXP_EWSW[12]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1041), .Q(DmP_mant_SHT1_SW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(DmP_INIT_EWSW[13]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1041), .Q(DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(DmP_EXP_EWSW[13]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1041), .Q(DmP_mant_SHT1_SW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(DmP_INIT_EWSW[14]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1041), .Q(DmP_EXP_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(DmP_EXP_EWSW[14]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1041), .Q(DmP_mant_SHT1_SW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(DmP_INIT_EWSW[15]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1041), .Q(DmP_EXP_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(DmP_EXP_EWSW[15]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1050), .Q(DmP_mant_SHT1_SW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(DmP_INIT_EWSW[16]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1042), .Q(DmP_EXP_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(DmP_EXP_EWSW[16]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1042), .Q(DmP_mant_SHT1_SW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(DmP_INIT_EWSW[17]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1042), .Q(DmP_EXP_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(DmP_EXP_EWSW[17]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1042), .Q(DmP_mant_SHT1_SW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(DmP_INIT_EWSW[18]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1042), .Q(DmP_EXP_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(DmP_EXP_EWSW[18]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1042), .Q(DmP_mant_SHT1_SW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(DmP_INIT_EWSW[19]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1042), .Q(DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(DmP_EXP_EWSW[19]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1047), .Q(DmP_mant_SHT1_SW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(DmP_INIT_EWSW[20]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1053), .Q(DmP_EXP_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(DmP_EXP_EWSW[20]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1043), .Q(DmP_mant_SHT1_SW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(DmP_INIT_EWSW[21]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1047), .Q(DmP_EXP_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(DmP_EXP_EWSW[21]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1053), .Q(DmP_mant_SHT1_SW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(DmP_INIT_EWSW[22]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1043), .Q(DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(DmP_EXP_EWSW[22]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1047), .Q(DmP_mant_SHT1_SW[22]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_23_ ( .D(DmP_INIT_EWSW[23]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1053), .Q(DmP_EXP_EWSW[23]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_24_ ( .D(DmP_INIT_EWSW[24]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1044), .Q(DmP_EXP_EWSW[24]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_25_ ( .D(DmP_INIT_EWSW[25]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1037), .Q(DmP_EXP_EWSW[25]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_26_ ( .D(DmP_INIT_EWSW[26]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1036), .Q(DmP_EXP_EWSW[26]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_27_ ( .D(DmP_INIT_EWSW[27]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1035), .Q(DmP_EXP_EWSW[27]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(DMP_INIT_EWSW[0]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1063), .Q(DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(DMP_INIT_EWSW[1]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1060), .Q(DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(DMP_INIT_EWSW[2]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(DMP_INIT_EWSW[3]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n395), .Q(DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(DMP_INIT_EWSW[4]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1059), .Q(DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(DMP_INIT_EWSW[5]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1059), .Q(DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(DMP_INIT_EWSW[6]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n395), .Q(DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(DMP_INIT_EWSW[7]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1060), .Q(DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(DMP_INIT_EWSW[8]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1063), .Q(DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(DMP_INIT_EWSW[9]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n395), .Q(DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(DMP_INIT_EWSW[10]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(DMP_INIT_EWSW[11]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1059), .Q(DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(DMP_INIT_EWSW[12]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(DMP_INIT_EWSW[13]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(DMP_INIT_EWSW[14]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(DMP_INIT_EWSW[15]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(DMP_INIT_EWSW[16]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(DMP_INIT_EWSW[17]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(DMP_INIT_EWSW[18]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(DMP_INIT_EWSW[19]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(DMP_INIT_EWSW[20]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(DMP_INIT_EWSW[21]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(DMP_INIT_EWSW[22]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1035), .Q(DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_23_ ( .D(DMP_INIT_EWSW[23]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_EXP_EWSW[23]), .QN(n406)
         );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_24_ ( .D(DMP_INIT_EWSW[24]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1063), .Q(DMP_EXP_EWSW[24]), .QN(n1006) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_25_ ( .D(DMP_INIT_EWSW[25]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1047), .Q(DMP_EXP_EWSW[25]), .QN(n1032) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_26_ ( .D(DMP_INIT_EWSW[26]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1050), .Q(DMP_EXP_EWSW[26]), .QN(n1031) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_27_ ( .D(DMP_INIT_EWSW[27]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_EXP_EWSW[27]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(DMP_INIT_EWSW[28]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1046), .Q(DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(DMP_INIT_EWSW[29]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1050), .Q(DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(DMP_INIT_EWSW[30]), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1053), .Q(DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1062), .Q(ZERO_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1056), .Q(OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_INIT), .CK(
        EXP_STAGE_DMP_net3663006), .RN(n1049), .Q(SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(DMP_EXP_EWSW[0]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(DMP_EXP_EWSW[1]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1038), .Q(DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(DMP_EXP_EWSW[2]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(DMP_EXP_EWSW[3]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1062), .Q(DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(DMP_EXP_EWSW[4]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(DMP_EXP_EWSW[5]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1052), .Q(DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(DMP_EXP_EWSW[6]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1057), .Q(DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(DMP_EXP_EWSW[7]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1043), .Q(DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(DMP_EXP_EWSW[8]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1049), .Q(DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(DMP_EXP_EWSW[9]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(DMP_EXP_EWSW[10]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1050), .Q(DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(DMP_EXP_EWSW[11]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(DMP_EXP_EWSW[12]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1054), .Q(DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(DMP_EXP_EWSW[13]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(DMP_EXP_EWSW[14]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1043), .Q(DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(DMP_EXP_EWSW[15]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1047), .Q(DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(DMP_EXP_EWSW[16]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1053), .Q(DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(DMP_EXP_EWSW[17]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1043), .Q(DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(DMP_EXP_EWSW[18]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1047), .Q(DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(DMP_EXP_EWSW[19]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1053), .Q(DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(DMP_EXP_EWSW[20]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1043), .Q(DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(DMP_EXP_EWSW[21]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1047), .Q(DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(DMP_EXP_EWSW[22]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1053), .Q(DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(DMP_EXP_EWSW[23]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1043), .Q(DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(DMP_EXP_EWSW[24]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1047), .Q(DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(DMP_EXP_EWSW[25]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1053), .Q(DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(DMP_EXP_EWSW[26]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(DMP_EXP_EWSW[27]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(DMP_EXP_EWSW[28]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(DMP_EXP_EWSW[29]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(DMP_EXP_EWSW[30]), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1048), .Q(ZERO_FLAG_SHT1) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1048), .Q(OP_FLAG_SHT1) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_EXP), .CK(
        SHT1_STAGE_DMP_net3663006), .RN(n1048), .Q(SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(DMP_SHT1_EWSW[0]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(DMP_SHT1_EWSW[1]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(DMP_SHT1_EWSW[2]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(DMP_SHT1_EWSW[3]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1049), .Q(DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(DMP_SHT1_EWSW[4]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1045), .Q(DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(DMP_SHT1_EWSW[5]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1052), .Q(DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(DMP_SHT1_EWSW[6]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1060), .Q(DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(DMP_SHT1_EWSW[7]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1049), .Q(DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(DMP_SHT1_EWSW[8]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1062), .Q(DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(DMP_SHT1_EWSW[9]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(DMP_SHT1_EWSW[10]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1046), .Q(DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(DMP_SHT1_EWSW[11]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1057), .Q(DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(DMP_SHT1_EWSW[12]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1053), .Q(DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(DMP_SHT1_EWSW[13]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1062), .Q(DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(DMP_SHT1_EWSW[14]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(DMP_SHT1_EWSW[15]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1058), .Q(DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(DMP_SHT1_EWSW[16]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1057), .Q(DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(DMP_SHT1_EWSW[17]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1059), .Q(DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(DMP_SHT1_EWSW[18]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n395), .Q(DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(DMP_SHT1_EWSW[19]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1063), .Q(DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(DMP_SHT1_EWSW[20]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1052), .Q(DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(DMP_SHT1_EWSW[21]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1046), .Q(DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(DMP_SHT1_EWSW[22]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1038), .Q(DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(DMP_SHT1_EWSW[23]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1054), .Q(DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(DMP_SHT2_EWSW[23]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1052), .Q(DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(DMP_SFG[23]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n395), .Q(DMP_exp_NRM_EW[0]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(DMP_exp_NRM_EW[0]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1059), .Q(DMP_exp_NRM2_EW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(DMP_SHT1_EWSW[24]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1046), .Q(DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(DMP_SHT2_EWSW[24]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1038), .Q(DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(DMP_SFG[24]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1058), .Q(DMP_exp_NRM_EW[1]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(DMP_exp_NRM_EW[1]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1063), .Q(DMP_exp_NRM2_EW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(DMP_SHT1_EWSW[25]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1054), .Q(DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(DMP_SHT2_EWSW[25]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1052), .Q(DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(DMP_SFG[25]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1057), .Q(DMP_exp_NRM_EW[2]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(DMP_exp_NRM_EW[2]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1051), .Q(DMP_exp_NRM2_EW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(DMP_SHT1_EWSW[26]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1043), .Q(DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(DMP_SHT2_EWSW[26]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1062), .Q(DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(DMP_SFG[26]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n438), .Q(DMP_exp_NRM_EW[3]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(DMP_exp_NRM_EW[3]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n395), .Q(DMP_exp_NRM2_EW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(DMP_SHT1_EWSW[27]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(DMP_SHT2_EWSW[27]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1049), .Q(DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(DMP_SFG[27]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n395), .Q(DMP_exp_NRM_EW[4]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(DMP_exp_NRM_EW[4]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1057), .Q(DMP_exp_NRM2_EW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(DMP_SHT1_EWSW[28]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(DMP_SHT2_EWSW[28]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1038), .Q(DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(DMP_SFG[28]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1059), .Q(DMP_exp_NRM_EW[5]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(DMP_exp_NRM_EW[5]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1058), .Q(DMP_exp_NRM2_EW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(DMP_SHT1_EWSW[29]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1063), .Q(DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(DMP_SHT2_EWSW[29]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1047), .Q(DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(DMP_SFG[29]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1063), .Q(DMP_exp_NRM_EW[6]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(DMP_exp_NRM_EW[6]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n395), .Q(DMP_exp_NRM2_EW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(DMP_SHT1_EWSW[30]), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1050), .Q(DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(DMP_SHT2_EWSW[30]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n437), .Q(DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(DMP_SFG[30]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1051), .Q(DMP_exp_NRM_EW[7]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(DMP_exp_NRM_EW[7]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1058), .Q(DMP_exp_NRM2_EW[7]) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1059), .Q(ZERO_FLAG_SHT2) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1050), .Q(OP_FLAG_SHT2) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_SHT1), .CK(
        SHT2_STAGE_DMP_net3663006), .RN(n1054), .Q(SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1056), .Q(ZERO_FLAG_SFG) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(LZD_raw_out_EWR[3]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1050), .Q(LZD_output_NRM2_EW[3])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(LZD_raw_out_EWR[0]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1050), .Q(LZD_output_NRM2_EW[0])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(LZD_raw_out_EWR[2]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1049), .Q(LZD_output_NRM2_EW[2])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(LZD_raw_out_EWR[1]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1062), .Q(LZD_output_NRM2_EW[1])
         );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(LZD_raw_out_EWR[4]), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1062), .Q(LZD_output_NRM2_EW[4])
         );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(SIGN_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1059), .Q(SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SFG), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n395), .Q(ZERO_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_NRM), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n1063), .Q(ZERO_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_0_ ( .D(ZERO_FLAG_SHT1SHT2), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1058), .Q(zero_flag) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(SIGN_FLAG_SFG), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1051), .Q(SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(SIGN_FLAG_NRM), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .RN(n395), .Q(SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(formatted_number_W[31]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n438), .Q(final_result_ieee[31])
         );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(Data_array_SWR[3]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1050), .Q(Data_array_SWR[29]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(Data_array_SWR[2]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1051), .Q(Data_array_SWR[28]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(Data_array_SWR[1]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1057), .Q(Data_array_SWR[27]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(Data_array_SWR[0]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n395), .Q(Data_array_SWR[26]) );
  DFFRXLTS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n1064), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n438), .Q(left_right_SHT2) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(formatted_number_W[8]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n437), .Q(final_result_ieee[8]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(formatted_number_W[9]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1058), .Q(final_result_ieee[9])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(formatted_number_W[10]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1058), .Q(final_result_ieee[10])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(formatted_number_W[11]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1051), .Q(final_result_ieee[11])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(formatted_number_W[12]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1057), .Q(final_result_ieee[12])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(formatted_number_W[13]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n395), .Q(final_result_ieee[13])
         );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(sftr_odat_SHT2_SWR[1]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n438), .Q(N60) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(formatted_number_W[0]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1035), .Q(final_result_ieee[0])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(formatted_number_W[1]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1035), .Q(final_result_ieee[1])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(formatted_number_W[2]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n437), .Q(final_result_ieee[2]) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(formatted_number_W[3]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1057), .Q(final_result_ieee[3])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(formatted_number_W[4]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1063), .Q(final_result_ieee[4])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(formatted_number_W[5]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1058), .Q(final_result_ieee[5])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(formatted_number_W[6]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1051), .Q(final_result_ieee[6])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(formatted_number_W[7]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1060), .Q(final_result_ieee[7])
         );
  DFFRXLTS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(sftr_odat_SHT2_SWR[25]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1060), .QN(n405) );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(formatted_number_W[14]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1060), .Q(final_result_ieee[14])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(formatted_number_W[15]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1060), .Q(final_result_ieee[15])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(formatted_number_W[16]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1060), .Q(final_result_ieee[16])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(formatted_number_W[17]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1060), .Q(final_result_ieee[17])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(formatted_number_W[18]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1060), .Q(final_result_ieee[18])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(formatted_number_W[19]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1061), .Q(final_result_ieee[19])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(formatted_number_W[20]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1061), .Q(final_result_ieee[20])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(formatted_number_W[21]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1061), .Q(final_result_ieee[21])
         );
  DFFRXLTS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(formatted_number_W[22]), .CK(
        FRMT_STAGE_DATAOUT_net3662952), .RN(n1061), .Q(final_result_ieee[22])
         );
  CMPR32X2TS DP_OP_15J181_122_6956_U9 ( .A(DMP_exp_NRM2_EW[0]), .B(n920), .C(
        DP_OP_15J181_122_6956_n18), .CO(DP_OP_15J181_122_6956_n8), .S(
        exp_rslt_NRM2_EW1[0]) );
  CMPR32X2TS DP_OP_15J181_122_6956_U8 ( .A(DP_OP_15J181_122_6956_n17), .B(
        DMP_exp_NRM2_EW[1]), .C(DP_OP_15J181_122_6956_n8), .CO(
        DP_OP_15J181_122_6956_n7), .S(exp_rslt_NRM2_EW1[1]) );
  CMPR32X2TS DP_OP_15J181_122_6956_U7 ( .A(DP_OP_15J181_122_6956_n16), .B(
        DMP_exp_NRM2_EW[2]), .C(DP_OP_15J181_122_6956_n7), .CO(
        DP_OP_15J181_122_6956_n6), .S(exp_rslt_NRM2_EW1[2]) );
  CMPR32X2TS DP_OP_15J181_122_6956_U6 ( .A(DP_OP_15J181_122_6956_n15), .B(
        DMP_exp_NRM2_EW[3]), .C(DP_OP_15J181_122_6956_n6), .CO(
        DP_OP_15J181_122_6956_n5), .S(exp_rslt_NRM2_EW1[3]) );
  CMPR32X2TS intadd_429_U4 ( .A(DmP_EXP_EWSW[24]), .B(n1006), .C(intadd_429_CI), .CO(intadd_429_n3), .S(intadd_429_SUM_0_) );
  CMPR32X2TS intadd_429_U3 ( .A(DmP_EXP_EWSW[25]), .B(n1032), .C(intadd_429_n3), .CO(intadd_429_n2), .S(intadd_429_SUM_1_) );
  CMPR32X2TS intadd_429_U2 ( .A(DmP_EXP_EWSW[26]), .B(n1031), .C(intadd_429_n2), .CO(intadd_429_n1), .S(intadd_429_SUM_2_) );
  DFFSX2TS R_0 ( .D(n1033), .CK(INPUT_STAGE_OPERANDY_net3662952), .SN(n1035), 
        .Q(n1066) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(N59), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1052), .Q(Raw_mant_NRM_SWR[0]), 
        .QN(n1030) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(Data_Y[0]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1046), .Q(intDY_EWSW[0]), .QN(
        n1029) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(Data_Y[26]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1040), .Q(intDY_EWSW[26]), .QN(
        n1028) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(Data_Y[15]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1056), .Q(intDY_EWSW[15]), .QN(
        n1027) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(Data_Y[3]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1054), .Q(intDY_EWSW[3]), .QN(
        n1026) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(Data_Y[1]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1038), .Q(intDY_EWSW[1]), .QN(
        n1025) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(Data_Y[11]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1037), .Q(intDY_EWSW[11]), .QN(
        n1024) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(Data_Y[25]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1034), .Q(intDY_EWSW[25]), .QN(
        n1023) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(Data_Y[18]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1042), .Q(intDY_EWSW[18]), .QN(
        n1022) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(Data_Y[17]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1042), .Q(intDY_EWSW[17]), .QN(
        n1021) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(Data_Y[8]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1035), .Q(intDY_EWSW[8]), .QN(
        n1020) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(Data_Y[12]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1041), .Q(intDY_EWSW[12]), .QN(
        n1019) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(Data_Y[27]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1044), .Q(intDY_EWSW[27]), .QN(
        n1018) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(Data_Y[9]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1040), .Q(intDY_EWSW[9]), .QN(
        n1017) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(Data_Y[22]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1053), .Q(intDY_EWSW[22]), .QN(
        n1016) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(Data_Y[20]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1043), .Q(intDY_EWSW[20]), .QN(
        n1015) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(Data_Y[2]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1052), .Q(intDY_EWSW[2]), .QN(
        n1014) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(Data_Y[21]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1047), .Q(intDY_EWSW[21]), .QN(
        n1013) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(Data_Y[13]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1041), .Q(intDY_EWSW[13]), .QN(
        n1012) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(Data_Y[24]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1055), .Q(intDY_EWSW[24]), .QN(
        n1011) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(Data_Y[10]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1044), .Q(intDY_EWSW[10]), .QN(
        n1010) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(Data_Y[4]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1039), .Q(intDY_EWSW[4]), .QN(
        n1009) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(Data_Y[16]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1042), .Q(intDY_EWSW[16]), .QN(
        n1008) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(Data_Y[6]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1039), .Q(intDY_EWSW[6]), .QN(
        n1007) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(Data_Y[5]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1054), .Q(intDY_EWSW[5]), .QN(
        n1005) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(Data_Y[7]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1054), .Q(intDY_EWSW[7]), .QN(
        n1004) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(Raw_mant_SGF[5]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1050), .Q(Raw_mant_NRM_SWR[5]), 
        .QN(n1003) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n389), .CK(clk), .RN(
        n1035), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n1002) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_22_ ( .D(DMP_SHT2_EWSW[22]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1054), .Q(DMP_SFG[22]), .QN(n1001) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(Data_array_SWR[21]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1037), .Q(Data_array_SWR[47]), .QN(
        n1000) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(Data_array_SWR[20]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1035), .Q(Data_array_SWR[46]), .QN(
        n999) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(Data_array_SWR[23]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1035), .Q(Data_array_SWR[49]), .QN(
        n998) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(Data_array_SWR[22]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1036), .Q(Data_array_SWR[48]), .QN(
        n997) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(sftr_odat_SHT2_SWR[23]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1061), .Q(DmP_mant_SFG_SWR[23]), .QN(
        n996) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_20_ ( .D(DMP_SHT2_EWSW[20]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1046), .Q(DMP_SFG[20]), .QN(n995) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(Data_X[23]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1055), .Q(intDX_EWSW[23]), .QN(
        n994) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(Data_X[7]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1037), .QN(n993) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(Data_X[5]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1055), .QN(n992) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(Data_X[16]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1034), .Q(intDX_EWSW[16]), .QN(
        n991) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(Data_X[30]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1035), .Q(intDX_EWSW[30]), .QN(
        n990) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(Data_X[29]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1035), .Q(intDX_EWSW[29]), .QN(
        n989) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(Data_X[21]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1035), .Q(intDX_EWSW[21]), .QN(
        n988) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(Data_X[13]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1040), .Q(intDX_EWSW[13]), .QN(
        n987) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(Data_X[26]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1037), .Q(intDX_EWSW[26]), .QN(
        n986) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(Data_X[19]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1037), .Q(intDX_EWSW[19]), .QN(
        n985) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(Data_X[14]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1037), .Q(intDX_EWSW[14]), .QN(
        n984) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(Data_X[12]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1035), .Q(intDX_EWSW[12]), .QN(
        n983) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(Data_X[11]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1036), .Q(intDX_EWSW[11]), .QN(
        n982) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(Data_X[25]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1044), .Q(intDX_EWSW[25]), .QN(
        n981) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(Data_X[17]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1055), .Q(intDX_EWSW[17]), .QN(
        n980) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(Data_X[10]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1055), .Q(intDX_EWSW[10]), .QN(
        n979) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(Data_X[1]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1034), .Q(intDX_EWSW[1]), .QN(
        n978) );
  DFFRX1TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(shft_value_mux_o_EWR[2]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1057), .Q(shift_value_SHT2_EWR[2]), 
        .QN(n977) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(sftr_odat_SHT2_SWR[21]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1061), .Q(DmP_mant_SFG_SWR[21]), .QN(
        n975) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_18_ ( .D(DMP_SHT2_EWSW[18]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1059), .Q(DMP_SFG[18]), .QN(n974) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(Data_Y[29]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1037), .Q(intDY_EWSW[29]), .QN(
        n973) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(sftr_odat_SHT2_SWR[19]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1060), .Q(DmP_mant_SFG_SWR[19]), .QN(
        n972) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_16_ ( .D(DMP_SHT2_EWSW[16]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1051), .Q(DMP_SFG[16]), .QN(n971) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(Raw_mant_SGF[20]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1052), .Q(Raw_mant_NRM_SWR[20]), 
        .QN(n970) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(Raw_mant_SGF[12]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1054), .Q(Raw_mant_NRM_SWR[12]), 
        .QN(n969) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(Raw_mant_SGF[14]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1052), .Q(Raw_mant_NRM_SWR[14]), 
        .QN(n968) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(sftr_odat_SHT2_SWR[17]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1060), .Q(DmP_mant_SFG_SWR[17]), .QN(
        n967) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(Raw_mant_SGF[17]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1038), .Q(Raw_mant_NRM_SWR[17]), 
        .QN(n966) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(Raw_mant_SGF[25]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1059), .Q(Raw_mant_NRM_SWR[25]), 
        .QN(n965) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(Raw_mant_SGF[18]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1046), .Q(Raw_mant_NRM_SWR[18]), 
        .QN(n964) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(sftr_odat_SHT2_SWR[15]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n395), .Q(DmP_mant_SFG_SWR[15]), .QN(
        n963) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_14_ ( .D(DMP_SHT2_EWSW[14]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1063), .Q(DMP_SFG[14]), .QN(n962) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(Raw_mant_SGF[1]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1043), .Q(Raw_mant_NRM_SWR[1]), 
        .QN(n961) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(Raw_mant_SGF[3]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1045), .Q(Raw_mant_NRM_SWR[3]), 
        .QN(n960) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_12_ ( .D(DMP_SHT2_EWSW[12]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1038), .Q(DMP_SFG[12]), .QN(n959) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(sftr_odat_SHT2_SWR[13]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1063), .Q(DmP_mant_SFG_SWR[13]), .QN(
        n958) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(DMP_SHT2_EWSW[10]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1049), .Q(DMP_SFG[10]), .QN(n957) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(Raw_mant_SGF[6]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1056), .Q(Raw_mant_NRM_SWR[6]), 
        .QN(n956) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_8_ ( .D(DMP_SHT2_EWSW[8]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1053), .Q(DMP_SFG[8]), .QN(n955) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_6_ ( .D(DMP_SHT2_EWSW[6]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1058), .Q(DMP_SFG[6]), .QN(n954) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(sftr_odat_SHT2_SWR[11]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n395), .Q(DmP_mant_SFG_SWR[11]), .QN(
        n953) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_4_ ( .D(DMP_SHT2_EWSW[4]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_SFG[4]), .QN(n952) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_2_ ( .D(DMP_SHT2_EWSW[2]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1050), .Q(DMP_SFG[2]), .QN(n951) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_0_ ( .D(DMP_SHT2_EWSW[0]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SFG[0]), .QN(n950) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(sftr_odat_SHT2_SWR[9]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1057), .Q(DmP_mant_SFG_SWR[9]), .QN(
        n949) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(sftr_odat_SHT2_SWR[7]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n395), .Q(DmP_mant_SFG_SWR[7]), .QN(
        n948) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(sftr_odat_SHT2_SWR[5]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1059), .Q(DmP_mant_SFG_SWR[5]), .QN(
        n947) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_1_ ( .D(DMP_SHT2_EWSW[1]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1048), .Q(DMP_SFG[1]), .QN(n946) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(Data_Y[14]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1041), .Q(intDY_EWSW[14]), .QN(
        n945) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(Data_Y[19]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1042), .Q(intDY_EWSW[19]), .QN(
        n944) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n388), .CK(clk), .RN(
        n1055), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]), .QN(n943) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(Data_Y[23]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1053), .Q(intDY_EWSW[23]), .QN(
        n942) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(Data_array_SWR[24]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1055), .Q(Data_array_SWR[50]), .QN(
        n941) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(Data_array_SWR[25]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1034), .Q(Data_array_SWR[51]), .QN(
        n940) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_21_ ( .D(DMP_SHT2_EWSW[21]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1038), .Q(DMP_SFG[21]), .QN(n939) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(Data_X[0]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1055), .Q(intDX_EWSW[0]), .QN(
        n938) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(Data_X[24]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1040), .Q(intDX_EWSW[24]), .QN(
        n937) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(Data_X[6]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1036), .Q(intDX_EWSW[6]), .QN(
        n936) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(Data_X[4]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1034), .Q(intDX_EWSW[4]), .QN(
        n935) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(Data_X[2]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1040), .Q(intDX_EWSW[2]), .QN(
        n934) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(Data_X[15]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1044), .Q(intDX_EWSW[15]), .QN(
        n933) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(Data_X[3]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1044), .Q(intDX_EWSW[3]), .QN(
        n932) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(Data_X[27]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1036), .Q(intDX_EWSW[27]), .QN(
        n931) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(Data_X[22]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1034), .Q(intDX_EWSW[22]), .QN(
        n930) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(Data_X[20]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1036), .Q(intDX_EWSW[20]), .QN(
        n929) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(Data_X[18]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1034), .Q(intDX_EWSW[18]), .QN(
        n928) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(Data_Y[30]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1036), .Q(intDY_EWSW[30]), .QN(
        n927) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_19_ ( .D(DMP_SHT2_EWSW[19]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n395), .Q(DMP_SFG[19]), .QN(n926) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_17_ ( .D(DMP_SHT2_EWSW[17]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1057), .Q(DMP_SFG[17]), .QN(n925) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(Raw_mant_SGF[22]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n395), .Q(Raw_mant_NRM_SWR[22]), 
        .QN(n923) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_15_ ( .D(DMP_SHT2_EWSW[15]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1058), .Q(DMP_SFG[15]), .QN(n922) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_13_ ( .D(DMP_SHT2_EWSW[13]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1060), .Q(DMP_SFG[13]), .QN(n921) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_11_ ( .D(DMP_SHT2_EWSW[11]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_SFG[11]), .QN(n919) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(DMP_SHT2_EWSW[9]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1056), .Q(DMP_SFG[9]), .QN(n918) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_7_ ( .D(DMP_SHT2_EWSW[7]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1046), .Q(DMP_SFG[7]), .QN(n917) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(DMP_SHT2_EWSW[5]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1062), .Q(DMP_SFG[5]), .QN(n916) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_3_ ( .D(DMP_SHT2_EWSW[3]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1047), .Q(DMP_SFG[3]), .QN(n915) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(sftr_odat_SHT2_SWR[3]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n438), .Q(DmP_mant_SFG_SWR[3]), .QN(
        n914) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(n1067), .CK(clk), .RN(
        n1035), .Q(inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n913) );
  CMPR32X2TS DP_OP_15J181_122_6956_U5 ( .A(DP_OP_15J181_122_6956_n14), .B(
        DMP_exp_NRM2_EW[4]), .C(DP_OP_15J181_122_6956_n5), .CO(
        DP_OP_15J181_122_6956_n4), .S(exp_rslt_NRM2_EW1[4]) );
  CMPR32X2TS DP_OP_15J181_122_6956_U4 ( .A(n920), .B(DMP_exp_NRM2_EW[5]), .C(
        DP_OP_15J181_122_6956_n4), .CO(DP_OP_15J181_122_6956_n3), .S(
        exp_rslt_NRM2_EW1[5]) );
  CMPR32X2TS DP_OP_15J181_122_6956_U3 ( .A(n920), .B(DMP_exp_NRM2_EW[6]), .C(
        DP_OP_15J181_122_6956_n3), .CO(DP_OP_15J181_122_6956_n2), .S(
        exp_rslt_NRM2_EW1[6]) );
  CMPR32X2TS DP_OP_15J181_122_6956_U2 ( .A(n920), .B(DMP_exp_NRM2_EW[7]), .C(
        DP_OP_15J181_122_6956_n2), .CO(DP_OP_15J181_122_6956_n1), .S(
        exp_rslt_NRM2_EW1[7]) );
  DFFSX2TS SFT2FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n404), .CK(
        SFT2FRMT_STAGE_VARS_net3663024), .SN(n1049), .Q(n920), .QN(
        ADD_OVRFLW_NRM2) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(Raw_mant_SGF[11]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1046), .Q(Raw_mant_NRM_SWR[11])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(Raw_mant_SGF[23]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1057), .Q(Raw_mant_NRM_SWR[23])
         );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(sftr_odat_SHT2_SWR[24]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1053), .Q(DmP_mant_SFG_SWR[24]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(Raw_mant_SGF[24]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1059), .Q(Raw_mant_NRM_SWR[24])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(Raw_mant_SGF[10]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1054), .Q(Raw_mant_NRM_SWR[10])
         );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(sftr_odat_SHT2_SWR[8]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1058), .Q(DmP_mant_SFG_SWR[8]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(sftr_odat_SHT2_SWR[6]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n395), .Q(DmP_mant_SFG_SWR[6]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(sftr_odat_SHT2_SWR[4]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n438), .Q(DmP_mant_SFG_SWR[4]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(sftr_odat_SHT2_SWR[10]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1051), .Q(DmP_mant_SFG_SWR[10]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(sftr_odat_SHT2_SWR[22]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1061), .Q(DmP_mant_SFG_SWR[22]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(sftr_odat_SHT2_SWR[20]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1060), .Q(DmP_mant_SFG_SWR[20]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(sftr_odat_SHT2_SWR[18]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1060), .Q(DmP_mant_SFG_SWR[18]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(sftr_odat_SHT2_SWR[16]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1060), .Q(DmP_mant_SFG_SWR[16]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(sftr_odat_SHT2_SWR[14]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1051), .Q(DmP_mant_SFG_SWR[14]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(sftr_odat_SHT2_SWR[12]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1058), .Q(DmP_mant_SFG_SWR[12]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(Raw_mant_SGF[21]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n395), .Q(Raw_mant_NRM_SWR[21]) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(shft_value_mux_o_EWR[3]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1057), .Q(shift_value_SHT2_EWR[3])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(Raw_mant_SGF[16]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1054), .Q(Raw_mant_NRM_SWR[16])
         );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(Data_Y[28]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1044), .Q(intDY_EWSW[28]) );
  DFFRX4TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(OP_FLAG_SHT2), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1048), .Q(n407), .QN(n1065) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(Data_array_SWR[16]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1040), .Q(Data_array_SWR[42]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(Data_array_SWR[17]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1044), .Q(Data_array_SWR[43]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(Raw_mant_SGF[7]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1056), .Q(Raw_mant_NRM_SWR[7]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(Raw_mant_SGF[19]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1046), .Q(Raw_mant_NRM_SWR[19])
         );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(sftr_odat_SHT2_SWR[2]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n1058), .Q(DmP_mant_SFG_SWR[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(Data_array_SWR[18]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1037), .Q(Data_array_SWR[44]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(Data_array_SWR[19]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1036), .Q(Data_array_SWR[45]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(Raw_mant_SGF[8]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1050), .Q(Raw_mant_NRM_SWR[8]) );
  DFFRX1TS inst_ShiftRegister_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[1]), .CK(
        inst_ShiftRegister_net3663114), .RN(n1040), .Q(Shift_reg_FLAGS_7[0])
         );
  DFFRX1TS inst_ShiftRegister_Q_reg_4_ ( .D(Shift_reg_FLAGS_7_5), .CK(
        inst_ShiftRegister_net3663114), .RN(n1044), .Q(busy) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(Data_array_SWR[9]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1053), .Q(Data_array_SWR[35]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(Data_array_SWR[8]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1058), .Q(Data_array_SWR[34]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(Data_array_SWR[10]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1062), .Q(Data_array_SWR[36]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(Data_array_SWR[11]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1045), .Q(Data_array_SWR[37]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(Data_X[8]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1036), .Q(intDX_EWSW[8]), .QN(
        n396) );
  DFFRX1TS SHT2_STAGE_SHFTVARS2_Q_reg_0_ ( .D(n401), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1035), .Q(bit_shift_SHT2) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(Data_X[9]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1035), .Q(intDX_EWSW[9]), .QN(
        n397) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(sftr_odat_SHT2_SWR[0]), .CK(
        SGF_STAGE_DMP_net3663006), .RN(n395), .Q(N59) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(Raw_mant_SGF[4]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1050), .Q(Raw_mant_NRM_SWR[4]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(Data_X[31]), .CK(
        INPUT_STAGE_OPERANDY_net3662952), .RN(n1054), .Q(intDX_EWSW[31]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(Raw_mant_SGF[13]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1054), .Q(Raw_mant_NRM_SWR[13])
         );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(Raw_mant_SGF[2]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1053), .Q(Raw_mant_NRM_SWR[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(Data_array_SWR[13]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1054), .Q(Data_array_SWR[39]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(Data_array_SWR[12]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1059), .Q(Data_array_SWR[38]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(Data_array_SWR[14]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1050), .Q(Data_array_SWR[40]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(Data_array_SWR[15]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1034), .Q(Data_array_SWR[41]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(Raw_mant_SGF[9]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1038), .Q(Raw_mant_NRM_SWR[9]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(Raw_mant_SGF[15]), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1052), .Q(Raw_mant_NRM_SWR[15])
         );
  DFFRX4TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(shft_value_mux_o_EWR[4]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1063), .Q(shift_value_SHT2_EWR[4]), 
        .QN(n976) );
  DFFRX1TS NRM_STAGE_FLAGS_Q_reg_2_ ( .D(ADD_OVRFLW_SGF), .CK(
        NRM_STAGE_Raw_mant_net3662988), .RN(n1057), .Q(ADD_OVRFLW_NRM), .QN(
        n404) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(Data_array_SWR[6]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1043), .Q(Data_array_SWR[32]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(Data_array_SWR[7]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1057), .Q(Data_array_SWR[33]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(Data_array_SWR[5]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1049), .Q(Data_array_SWR[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(Data_array_SWR[4]), .CK(
        SHT2_SHIFT_DATA_net3662988), .RN(n1056), .Q(Data_array_SWR[30]) );
  DFFRX4TS inst_ShiftRegister_Q_reg_1_ ( .D(Shift_reg_FLAGS_7[2]), .CK(
        inst_ShiftRegister_net3663114), .RN(n1040), .Q(Shift_reg_FLAGS_7[1]), 
        .QN(n924) );
  AOI32X4TS U582 ( .A0(n840), .A1(n839), .A2(n838), .B0(n837), .B1(n840), .Y(
        n895) );
  AOI211X2TS U583 ( .A0(Data_array_SWR[42]), .A1(n439), .B0(n485), .C0(n456), 
        .Y(n531) );
  AOI211X2TS U584 ( .A0(Data_array_SWR[43]), .A1(n439), .B0(n485), .C0(n440), 
        .Y(n489) );
  AOI222X4TS U585 ( .A0(DMP_SFG[18]), .A1(DmP_mant_SFG_SWR[20]), .B0(
        DMP_SFG[18]), .B1(n701), .C0(DmP_mant_SFG_SWR[20]), .C1(n701), .Y(n879) );
  AOI222X4TS U586 ( .A0(DMP_SFG[16]), .A1(DmP_mant_SFG_SWR[18]), .B0(
        DMP_SFG[16]), .B1(n695), .C0(DmP_mant_SFG_SWR[18]), .C1(n695), .Y(n874) );
  AOI222X2TS U587 ( .A0(DMP_SFG[12]), .A1(DmP_mant_SFG_SWR[14]), .B0(
        DMP_SFG[12]), .B1(n683), .C0(DmP_mant_SFG_SWR[14]), .C1(n683), .Y(n864) );
  AOI222X2TS U588 ( .A0(DMP_SFG[10]), .A1(DmP_mant_SFG_SWR[12]), .B0(
        DMP_SFG[10]), .B1(n677), .C0(DmP_mant_SFG_SWR[12]), .C1(n677), .Y(n859) );
  CLKINVX6TS U589 ( .A(n672), .Y(n583) );
  INVX4TS U590 ( .A(n643), .Y(n592) );
  NAND4XLTS U591 ( .A(n712), .B(n431), .C(n430), .D(n429), .Y(
        LZD_raw_out_EWR[0]) );
  NAND4XLTS U592 ( .A(n729), .B(n421), .C(n420), .D(n419), .Y(
        LZD_raw_out_EWR[1]) );
  NOR2X1TS U593 ( .A(array_comparators_LTComparator_N0), .B(
        array_comparators_GTComparator_N0), .Y(n450) );
  BUFX6TS U594 ( .A(n899), .Y(n393) );
  NOR2X1TS U595 ( .A(Raw_mant_NRM_SWR[10]), .B(n723), .Y(n408) );
  NAND2BX1TS U596 ( .AN(n723), .B(Raw_mant_NRM_SWR[10]), .Y(n718) );
  NAND2X4TS U597 ( .A(n560), .B(n976), .Y(n441) );
  NOR2X4TS U598 ( .A(n560), .B(n482), .Y(n452) );
  NOR2X6TS U599 ( .A(shift_value_SHT2_EWR[4]), .B(n493), .Y(n444) );
  NOR2X6TS U600 ( .A(shift_value_SHT2_EWR[4]), .B(n455), .Y(n443) );
  NAND2X4TS U601 ( .A(n564), .B(n976), .Y(n451) );
  CLKINVX3TS U602 ( .A(n505), .Y(n442) );
  INVX3TS U603 ( .A(n890), .Y(n855) );
  NOR2X4TS U604 ( .A(n564), .B(n482), .Y(n448) );
  NOR2X6TS U605 ( .A(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .Y(n439) );
  BUFX6TS U606 ( .A(n437), .Y(n395) );
  NAND2BXLTS U607 ( .AN(intDX_EWSW[9]), .B(intDY_EWSW[9]), .Y(n802) );
  CLKAND2X2TS U608 ( .A(DmP_mant_SFG_SWR[4]), .B(n951), .Y(n525) );
  CLKAND2X2TS U609 ( .A(DmP_mant_SFG_SWR[8]), .B(n954), .Y(n577) );
  CLKAND2X2TS U610 ( .A(DmP_mant_SFG_SWR[10]), .B(n955), .Y(n587) );
  AOI211X1TS U611 ( .A0(n443), .A1(Data_array_SWR[45]), .B0(n507), .C0(n499), 
        .Y(n512) );
  CLKAND2X2TS U612 ( .A(DmP_mant_SFG_SWR[6]), .B(n952), .Y(n546) );
  AOI211X1TS U613 ( .A0(Data_array_SWR[44]), .A1(n443), .B0(n507), .C0(n484), 
        .Y(n514) );
  AOI222X4TS U614 ( .A0(n924), .A1(DmP_mant_SHT1_SW[0]), .B0(n611), .B1(
        Raw_mant_NRM_SWR[23]), .C0(Raw_mant_NRM_SWR[2]), .C1(n401), .Y(n631)
         );
  AOI222X4TS U615 ( .A0(n924), .A1(DmP_mant_SHT1_SW[1]), .B0(n611), .B1(
        Raw_mant_NRM_SWR[22]), .C0(Raw_mant_NRM_SWR[3]), .C1(n401), .Y(n627)
         );
  NAND2BXLTS U616 ( .AN(n713), .B(Raw_mant_NRM_SWR[4]), .Y(n722) );
  NAND2BXLTS U617 ( .AN(Raw_mant_NRM_SWR[23]), .B(n923), .Y(n412) );
  AO22XLTS U618 ( .A0(n1064), .A1(LZD_raw_out_EWR[4]), .B0(
        Shift_amount_SHT1_EWR[4]), .B1(n912), .Y(shft_value_mux_o_EWR[4]) );
  OAI21XLTS U619 ( .A0(n652), .A1(n399), .B0(n639), .Y(Data_array_SWR[19]) );
  OAI21XLTS U620 ( .A0(n652), .A1(n904), .B0(n605), .Y(Data_array_SWR[18]) );
  XOR2XLTS U621 ( .A(n878), .B(n877), .Y(Raw_mant_SGF[19]) );
  OAI21XLTS U622 ( .A0(n651), .A1(n399), .B0(n624), .Y(Data_array_SWR[17]) );
  OAI21XLTS U623 ( .A0(n656), .A1(n399), .B0(n655), .Y(Data_array_SWR[16]) );
  OAI21XLTS U624 ( .A0(n686), .A1(n688), .B0(n685), .Y(n684) );
  AO22XLTS U625 ( .A0(n1064), .A1(LZD_raw_out_EWR[3]), .B0(
        Shift_amount_SHT1_EWR[3]), .B1(n912), .Y(shft_value_mux_o_EWR[3]) );
  XOR2XLTS U626 ( .A(n883), .B(n882), .Y(Raw_mant_SGF[21]) );
  XOR2XLTS U627 ( .A(n894), .B(n893), .Y(Raw_mant_SGF[24]) );
  XOR2XLTS U628 ( .A(n888), .B(n887), .Y(Raw_mant_SGF[23]) );
  OAI21XLTS U629 ( .A0(n704), .A1(n732), .B0(n703), .Y(n702) );
  OAI21XLTS U630 ( .A0(n692), .A1(n694), .B0(n691), .Y(n690) );
  XOR2XLTS U631 ( .A(n735), .B(n405), .Y(Raw_mant_SGF[25]) );
  XOR2XLTS U632 ( .A(n873), .B(n872), .Y(Raw_mant_SGF[17]) );
  OAI21XLTS U633 ( .A0(n698), .A1(n700), .B0(n697), .Y(n696) );
  AO22XLTS U634 ( .A0(n1064), .A1(LZD_raw_out_EWR[2]), .B0(
        Shift_amount_SHT1_EWR[2]), .B1(n912), .Y(shft_value_mux_o_EWR[2]) );
  OAI21XLTS U635 ( .A0(n906), .A1(n592), .B0(n599), .Y(Data_array_SWR[22]) );
  OAI21XLTS U636 ( .A0(n674), .A1(n399), .B0(n673), .Y(Data_array_SWR[20]) );
  OAI21XLTS U637 ( .A0(n669), .A1(n399), .B0(n630), .Y(Data_array_SWR[21]) );
  OAI211XLTS U638 ( .A0(n631), .A1(n583), .B0(n635), .C0(n585), .Y(
        Data_array_SWR[0]) );
  OAI21XLTS U639 ( .A0(n635), .A1(n399), .B0(n634), .Y(Data_array_SWR[1]) );
  OAI21XLTS U640 ( .A0(n631), .A1(n399), .B0(n616), .Y(Data_array_SWR[2]) );
  OAI21XLTS U641 ( .A0(n627), .A1(n399), .B0(n626), .Y(Data_array_SWR[3]) );
  AOI211X1TS U642 ( .A0(n717), .A1(n716), .B0(n715), .C0(n726), .Y(n719) );
  CLKINVX6TS U643 ( .A(rst), .Y(n437) );
  OAI221X1TS U644 ( .A0(n979), .A1(intDY_EWSW[10]), .B0(n934), .B1(
        intDY_EWSW[2]), .C0(n741), .Y(n744) );
  OAI221X1TS U645 ( .A0(n932), .A1(intDY_EWSW[3]), .B0(n986), .B1(
        intDY_EWSW[26]), .C0(n749), .Y(n752) );
  OAI221X1TS U646 ( .A0(n931), .A1(intDY_EWSW[27]), .B0(n985), .B1(
        intDY_EWSW[19]), .C0(n757), .Y(n760) );
  OAI221X1TS U647 ( .A0(n980), .A1(intDY_EWSW[17]), .B0(n991), .B1(
        intDY_EWSW[16]), .C0(n765), .Y(n768) );
  OAI221X1TS U648 ( .A0(n929), .A1(intDY_EWSW[20]), .B0(n990), .B1(
        intDY_EWSW[30]), .C0(n763), .Y(n770) );
  OAI21X1TS U649 ( .A0(n493), .A1(n998), .B0(n492), .Y(n465) );
  OAI21X1TS U650 ( .A0(n493), .A1(n997), .B0(n492), .Y(n494) );
  OAI21XLTS U651 ( .A0(n650), .A1(n399), .B0(n649), .Y(Data_array_SWR[4]) );
  OAI21XLTS U652 ( .A0(n645), .A1(n399), .B0(n618), .Y(Data_array_SWR[5]) );
  OAI21XLTS U653 ( .A0(n646), .A1(n904), .B0(n608), .Y(Data_array_SWR[6]) );
  NOR2X2TS U654 ( .A(n492), .B(n977), .Y(n485) );
  OAI211X1TS U655 ( .A0(n976), .A1(n535), .B0(n458), .C0(n457), .Y(n480) );
  AOI21X2TS U656 ( .A0(n439), .A1(Data_array_SWR[51]), .B0(n491), .Y(n535) );
  OAI211X1TS U657 ( .A0(n976), .A1(n538), .B0(n447), .C0(n446), .Y(n453) );
  AOI21X2TS U658 ( .A0(n439), .A1(Data_array_SWR[50]), .B0(n491), .Y(n538) );
  BUFX4TS U659 ( .A(n1051), .Y(n1060) );
  BUFX4TS U660 ( .A(n1051), .Y(n1048) );
  BUFX4TS U661 ( .A(n437), .Y(n1063) );
  BUFX4TS U662 ( .A(n437), .Y(n1059) );
  BUFX6TS U663 ( .A(n437), .Y(n1057) );
  BUFX4TS U664 ( .A(n437), .Y(n1058) );
  OAI211X1TS U665 ( .A0(n976), .A1(n552), .B0(n551), .C0(n550), .Y(n559) );
  AOI21X2TS U666 ( .A0(n439), .A1(Data_array_SWR[49]), .B0(n491), .Y(n552) );
  BUFX6TS U667 ( .A(n1063), .Y(n1035) );
  BUFX4TS U668 ( .A(n1057), .Y(n1054) );
  AOI21X2TS U669 ( .A0(Data_array_SWR[48]), .A1(n439), .B0(n491), .Y(n557) );
  AOI21X2TS U670 ( .A0(n439), .A1(Data_array_SWR[46]), .B0(n460), .Y(n473) );
  OAI21X1TS U671 ( .A0(n493), .A1(n941), .B0(n492), .Y(n460) );
  AOI21X2TS U672 ( .A0(n439), .A1(Data_array_SWR[47]), .B0(n461), .Y(n479) );
  OAI21X1TS U673 ( .A0(n493), .A1(n940), .B0(n492), .Y(n461) );
  BUFX4TS U674 ( .A(n1059), .Y(n1053) );
  BUFX4TS U675 ( .A(n1063), .Y(n1050) );
  BUFX4TS U676 ( .A(n1058), .Y(n1056) );
  CLKINVX6TS U677 ( .A(n564), .Y(n560) );
  BUFX6TS U678 ( .A(left_right_SHT2), .Y(n564) );
  INVX2TS U679 ( .A(n582), .Y(n398) );
  INVX4TS U680 ( .A(n398), .Y(n399) );
  OAI21X2TS U681 ( .A0(n968), .A1(n610), .B0(n609), .Y(n660) );
  OAI21X2TS U682 ( .A0(n964), .A1(n610), .B0(n603), .Y(n654) );
  OAI21X2TS U683 ( .A0(n956), .A1(n610), .B0(n606), .Y(n648) );
  OAI21X2TS U684 ( .A0(n594), .A1(n960), .B0(n593), .Y(n671) );
  CLKINVX3TS U685 ( .A(n610), .Y(n400) );
  INVX3TS U686 ( .A(n610), .Y(n401) );
  BUFX4TS U687 ( .A(n445), .Y(n554) );
  BUFX4TS U688 ( .A(n924), .Y(n912) );
  INVX2TS U689 ( .A(n895), .Y(n902) );
  INVX4TS U690 ( .A(n895), .Y(n901) );
  INVX4TS U691 ( .A(n895), .Y(n897) );
  INVX3TS U692 ( .A(n594), .Y(n611) );
  NOR3X1TS U693 ( .A(Raw_mant_NRM_SWR[15]), .B(Raw_mant_NRM_SWR[16]), .C(
        Raw_mant_NRM_SWR[17]), .Y(n714) );
  OAI2BB1X1TS U694 ( .A0N(n1064), .A1N(Raw_mant_NRM_SWR[15]), .B0(n600), .Y(
        n666) );
  NOR2X1TS U695 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[8]), .Y(n724)
         );
  NOR4X1TS U696 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[13]), .C(
        Raw_mant_NRM_SWR[11]), .D(n720), .Y(n427) );
  OAI21XLTS U697 ( .A0(n658), .A1(n582), .B0(n641), .Y(Data_array_SWR[15]) );
  OAI21XLTS U698 ( .A0(n658), .A1(n904), .B0(n613), .Y(Data_array_SWR[14]) );
  OAI21XLTS U699 ( .A0(n662), .A1(n582), .B0(n661), .Y(Data_array_SWR[12]) );
  OAI21XLTS U700 ( .A0(n657), .A1(n399), .B0(n620), .Y(Data_array_SWR[13]) );
  NOR3X1TS U701 ( .A(Raw_mant_NRM_SWR[12]), .B(Raw_mant_NRM_SWR[13]), .C(
        Raw_mant_NRM_SWR[11]), .Y(n721) );
  OAI221X1TS U702 ( .A0(n993), .A1(intDY_EWSW[7]), .B0(n984), .B1(
        intDY_EWSW[14]), .C0(n747), .Y(n754) );
  INVX1TS U703 ( .A(n575), .Y(enable_Pipeline_input) );
  AOI221X1TS U704 ( .A0(intDX_EWSW[30]), .A1(n927), .B0(intDX_EWSW[29]), .B1(
        n973), .C0(n782), .Y(n784) );
  AOI31XLTS U705 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n426), .A2(n416), .B0(n715), 
        .Y(n420) );
  NOR2X2TS U706 ( .A(n968), .B(n415), .Y(n715) );
  OAI211X2TS U707 ( .A0(intDX_EWSW[12]), .A1(n1019), .B0(n812), .C0(n798), .Y(
        n814) );
  AOI211XLTS U708 ( .A0(intDY_EWSW[16]), .A1(n991), .B0(n826), .C0(n827), .Y(
        n818) );
  OAI211X2TS U709 ( .A0(intDX_EWSW[20]), .A1(n1015), .B0(n832), .C0(n817), .Y(
        n826) );
  NOR3X6TS U710 ( .A(n436), .B(exp_rslt_NRM2_EW1[7]), .C(n433), .Y(
        array_comparators_LTComparator_N0) );
  XNOR2X2TS U711 ( .A(DP_OP_15J181_122_6956_n1), .B(ADD_OVRFLW_NRM2), .Y(n436)
         );
  CLKINVX6TS U712 ( .A(n895), .Y(n898) );
  NOR3X2TS U713 ( .A(Raw_mant_NRM_SWR[5]), .B(Raw_mant_NRM_SWR[4]), .C(n713), 
        .Y(n710) );
  OR2X1TS U714 ( .A(N60), .B(N59), .Y(n845) );
  OAI21XLTS U715 ( .A0(n664), .A1(n399), .B0(n637), .Y(Data_array_SWR[11]) );
  OAI21XLTS U716 ( .A0(n664), .A1(n904), .B0(n602), .Y(Data_array_SWR[10]) );
  OAI21XLTS U717 ( .A0(n668), .A1(n399), .B0(n667), .Y(Data_array_SWR[8]) );
  OAI21XLTS U718 ( .A0(n663), .A1(n582), .B0(n622), .Y(Data_array_SWR[9]) );
  NOR2X4TS U719 ( .A(n596), .B(n595), .Y(n672) );
  NOR2X4TS U720 ( .A(n584), .B(n596), .Y(n643) );
  AOI22X2TS U721 ( .A0(n611), .A1(LZD_raw_out_EWR[1]), .B0(
        Shift_amount_SHT1_EWR[1]), .B1(n924), .Y(n596) );
  CLKBUFX2TS U722 ( .A(n907), .Y(n402) );
  NAND2X2TS U723 ( .A(Shift_reg_FLAGS_7[1]), .B(ADD_OVRFLW_NRM), .Y(n610) );
  OAI22X2TS U724 ( .A0(Shift_reg_FLAGS_7[1]), .A1(Shift_amount_SHT1_EWR[0]), 
        .B0(LZD_raw_out_EWR[0]), .B1(n594), .Y(n584) );
  AOI21X2TS U725 ( .A0(n439), .A1(Data_array_SWR[45]), .B0(n465), .Y(n566) );
  AOI21X2TS U726 ( .A0(n439), .A1(Data_array_SWR[44]), .B0(n494), .Y(n562) );
  AOI222X4TS U727 ( .A0(DmP_mant_SFG_SWR[2]), .A1(n950), .B0(
        DmP_mant_SFG_SWR[2]), .B1(n845), .C0(n950), .C1(n845), .Y(n520) );
  NOR3X1TS U728 ( .A(Raw_mant_NRM_SWR[19]), .B(Raw_mant_NRM_SWR[20]), .C(
        Raw_mant_NRM_SWR[21]), .Y(n708) );
  NOR2X2TS U729 ( .A(Raw_mant_NRM_SWR[7]), .B(n409), .Y(n727) );
  NOR3X1TS U730 ( .A(n403), .B(n781), .C(intDY_EWSW[28]), .Y(n782) );
  OAI221X1TS U731 ( .A0(n900), .A1(intDY_EWSW[28]), .B0(n936), .B1(
        intDY_EWSW[6]), .C0(n755), .Y(n762) );
  AOI31XLTS U732 ( .A0(Raw_mant_NRM_SWR[16]), .A1(n426), .A2(n966), .B0(n715), 
        .Y(n431) );
  NAND2X2TS U733 ( .A(bit_shift_SHT2), .B(shift_value_SHT2_EWR[3]), .Y(n492)
         );
  NAND3X2TS U734 ( .A(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .C(n976), .Y(n505) );
  OAI32X1TS U735 ( .A0(Raw_mant_NRM_SWR[23]), .A1(Raw_mant_NRM_SWR[21]), .A2(
        n970), .B0(n923), .B1(Raw_mant_NRM_SWR[23]), .Y(n428) );
  AOI222X4TS U736 ( .A0(DMP_SFG[14]), .A1(DmP_mant_SFG_SWR[16]), .B0(
        DMP_SFG[14]), .B1(n689), .C0(DmP_mant_SFG_SWR[16]), .C1(n689), .Y(n869) );
  AOI222X4TS U737 ( .A0(DMP_SFG[20]), .A1(DmP_mant_SFG_SWR[22]), .B0(
        DMP_SFG[20]), .B1(n733), .C0(DmP_mant_SFG_SWR[22]), .C1(n733), .Y(n884) );
  AOI222X4TS U738 ( .A0(DMP_SFG[8]), .A1(DmP_mant_SFG_SWR[10]), .B0(DMP_SFG[8]), .B1(n588), .C0(DmP_mant_SFG_SWR[10]), .C1(n588), .Y(n853) );
  AOI222X4TS U739 ( .A0(DMP_SFG[2]), .A1(DmP_mant_SFG_SWR[4]), .B0(DMP_SFG[2]), 
        .B1(n526), .C0(DmP_mant_SFG_SWR[4]), .C1(n526), .Y(n541) );
  AOI222X4TS U740 ( .A0(DMP_SFG[4]), .A1(DmP_mant_SFG_SWR[6]), .B0(DMP_SFG[4]), 
        .B1(n547), .C0(DmP_mant_SFG_SWR[6]), .C1(n547), .Y(n571) );
  AOI222X4TS U741 ( .A0(DMP_SFG[6]), .A1(DmP_mant_SFG_SWR[8]), .B0(DMP_SFG[6]), 
        .B1(n578), .C0(DmP_mant_SFG_SWR[8]), .C1(n578), .Y(n848) );
  NOR4X2TS U742 ( .A(Raw_mant_NRM_SWR[24]), .B(Raw_mant_NRM_SWR[25]), .C(
        Raw_mant_NRM_SWR[22]), .D(Raw_mant_NRM_SWR[23]), .Y(n705) );
  AOI222X4TS U743 ( .A0(DMP_SFG[22]), .A1(DmP_mant_SFG_SWR[24]), .B0(
        DMP_SFG[22]), .B1(n891), .C0(DmP_mant_SFG_SWR[24]), .C1(n891), .Y(n775) );
  AOI31XLTS U744 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n425), .A2(n969), .B0(n424), 
        .Y(n419) );
  INVX2TS U745 ( .A(intDX_EWSW[28]), .Y(n900) );
  OAI21XLTS U746 ( .A0(intDX_EWSW[1]), .A1(n1025), .B0(intDX_EWSW[0]), .Y(n788) );
  OAI21XLTS U747 ( .A0(intDX_EWSW[15]), .A1(n1027), .B0(intDX_EWSW[14]), .Y(
        n808) );
  NOR2XLTS U748 ( .A(n821), .B(intDY_EWSW[16]), .Y(n822) );
  OAI21XLTS U749 ( .A0(intDX_EWSW[21]), .A1(n1013), .B0(intDX_EWSW[20]), .Y(
        n820) );
  OAI21XLTS U750 ( .A0(n505), .A1(n998), .B0(n498), .Y(n499) );
  OAI211XLTS U751 ( .A0(n913), .A1(n908), .B0(n909), .C0(beg_OP), .Y(n575) );
  OAI21XLTS U752 ( .A0(n581), .A1(n587), .B0(n580), .Y(n579) );
  OAI21XLTS U753 ( .A0(n523), .A1(n525), .B0(n522), .Y(n521) );
  OAI21XLTS U754 ( .A0(n906), .A1(n399), .B0(n610), .Y(Data_array_SWR[25]) );
  OAI21XLTS U755 ( .A0(n646), .A1(n399), .B0(n644), .Y(Data_array_SWR[7]) );
  OR2X1TS U756 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[4]), .Y(formatted_number_W[27]) );
  NAND2X1TS U757 ( .A(n708), .B(n705), .Y(n418) );
  NOR2X1TS U758 ( .A(Raw_mant_NRM_SWR[18]), .B(n418), .Y(n717) );
  NAND2X1TS U759 ( .A(n717), .B(n714), .Y(n415) );
  NOR2X1TS U760 ( .A(Raw_mant_NRM_SWR[14]), .B(n415), .Y(n417) );
  NAND2X1TS U761 ( .A(n721), .B(n417), .Y(n723) );
  NAND2X1TS U762 ( .A(n724), .B(n408), .Y(n409) );
  NAND2X1TS U763 ( .A(n727), .B(n956), .Y(n713) );
  OA21XLTS U764 ( .A0(Raw_mant_NRM_SWR[3]), .A1(Raw_mant_NRM_SWR[2]), .B0(n710), .Y(n411) );
  INVX2TS U765 ( .A(n409), .Y(n410) );
  OAI31X1TS U766 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n411), .A2(
        Raw_mant_NRM_SWR[6]), .B0(n410), .Y(n729) );
  NOR2XLTS U767 ( .A(Raw_mant_NRM_SWR[20]), .B(Raw_mant_NRM_SWR[21]), .Y(n414)
         );
  NOR2X1TS U768 ( .A(Raw_mant_NRM_SWR[24]), .B(Raw_mant_NRM_SWR[25]), .Y(n413)
         );
  AOI32X1TS U769 ( .A0(n414), .A1(n413), .A2(Raw_mant_NRM_SWR[19]), .B0(n412), 
        .B1(n413), .Y(n421) );
  INVX2TS U770 ( .A(n418), .Y(n426) );
  NOR2XLTS U771 ( .A(Raw_mant_NRM_SWR[16]), .B(Raw_mant_NRM_SWR[17]), .Y(n416)
         );
  INVX2TS U772 ( .A(n417), .Y(n720) );
  NOR2X1TS U773 ( .A(Raw_mant_NRM_SWR[13]), .B(n720), .Y(n425) );
  OAI21X1TS U774 ( .A0(n418), .A1(n964), .B0(n718), .Y(n424) );
  AOI21X1TS U775 ( .A0(Raw_mant_NRM_SWR[0]), .A1(n961), .B0(
        Raw_mant_NRM_SWR[2]), .Y(n422) );
  NAND2X1TS U776 ( .A(n710), .B(n960), .Y(n730) );
  OAI22X1TS U777 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n722), .B0(n422), .B1(n730), 
        .Y(n423) );
  AOI211X1TS U778 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n425), .B0(n424), .C0(n423), 
        .Y(n712) );
  AOI22X1TS U779 ( .A0(Raw_mant_NRM_SWR[8]), .A1(n427), .B0(
        Raw_mant_NRM_SWR[6]), .B1(n727), .Y(n430) );
  OAI21XLTS U780 ( .A0(Raw_mant_NRM_SWR[24]), .A1(n428), .B0(n965), .Y(n429)
         );
  OR4X2TS U781 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[2]), .C(
        exp_rslt_NRM2_EW1[1]), .D(exp_rslt_NRM2_EW1[0]), .Y(n432) );
  OR4X2TS U782 ( .A(exp_rslt_NRM2_EW1[6]), .B(exp_rslt_NRM2_EW1[5]), .C(
        exp_rslt_NRM2_EW1[4]), .D(n432), .Y(n433) );
  AND4X1TS U783 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[2]), .C(
        exp_rslt_NRM2_EW1[1]), .D(exp_rslt_NRM2_EW1[0]), .Y(n434) );
  AND4X1TS U784 ( .A(exp_rslt_NRM2_EW1[6]), .B(exp_rslt_NRM2_EW1[5]), .C(
        exp_rslt_NRM2_EW1[4]), .D(n434), .Y(n435) );
  AND3X1TS U785 ( .A(n436), .B(exp_rslt_NRM2_EW1[7]), .C(n435), .Y(
        array_comparators_GTComparator_N0) );
  AOI33XLTS U786 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .B0(n943), .B1(n913), .B2(n1002), 
        .Y(n390) );
  CLKBUFX2TS U787 ( .A(n437), .Y(n438) );
  BUFX3TS U788 ( .A(n1057), .Y(n1046) );
  BUFX3TS U789 ( .A(n1059), .Y(n1047) );
  BUFX3TS U790 ( .A(n437), .Y(n1055) );
  BUFX3TS U791 ( .A(n1057), .Y(n1052) );
  BUFX3TS U792 ( .A(n1048), .Y(n1034) );
  BUFX3TS U793 ( .A(n437), .Y(n1051) );
  BUFX3TS U794 ( .A(n1063), .Y(n1049) );
  BUFX3TS U795 ( .A(n1051), .Y(n1037) );
  BUFX3TS U796 ( .A(n437), .Y(n1036) );
  BUFX3TS U797 ( .A(n1058), .Y(n1045) );
  BUFX3TS U798 ( .A(n1063), .Y(n1062) );
  BUFX3TS U799 ( .A(n1059), .Y(n1061) );
  BUFX3TS U800 ( .A(n1057), .Y(n1038) );
  BUFX3TS U801 ( .A(n1058), .Y(n1041) );
  BUFX3TS U802 ( .A(n1063), .Y(n1042) );
  BUFX3TS U803 ( .A(n1053), .Y(n1044) );
  BUFX3TS U804 ( .A(n1057), .Y(n1039) );
  BUFX3TS U805 ( .A(n1059), .Y(n1043) );
  BUFX3TS U806 ( .A(n1049), .Y(n1040) );
  NAND2BX2TS U807 ( .AN(shift_value_SHT2_EWR[3]), .B(shift_value_SHT2_EWR[2]), 
        .Y(n493) );
  NAND2X1TS U808 ( .A(shift_value_SHT2_EWR[3]), .B(n977), .Y(n455) );
  OAI22X1TS U809 ( .A0(n493), .A1(n1000), .B0(n455), .B1(n940), .Y(n440) );
  NOR2BX2TS U810 ( .AN(bit_shift_SHT2), .B(n439), .Y(n491) );
  AOI22X1TS U811 ( .A0(n442), .A1(Data_array_SWR[46]), .B0(n443), .B1(
        Data_array_SWR[42]), .Y(n447) );
  NOR2BX1TS U812 ( .AN(n439), .B(shift_value_SHT2_EWR[4]), .Y(n445) );
  AOI22X1TS U813 ( .A0(n444), .A1(Data_array_SWR[38]), .B0(n554), .B1(
        Data_array_SWR[34]), .Y(n446) );
  NAND2X1TS U814 ( .A(shift_value_SHT2_EWR[4]), .B(bit_shift_SHT2), .Y(n482)
         );
  AOI21X1TS U815 ( .A0(n564), .A1(n453), .B0(n448), .Y(n449) );
  OAI21X1TS U816 ( .A0(n489), .A1(n441), .B0(n449), .Y(sftr_odat_SHT2_SWR[17])
         );
  BUFX4TS U817 ( .A(n450), .Y(n907) );
  CLKAND2X2TS U818 ( .A(n907), .B(sftr_odat_SHT2_SWR[17]), .Y(
        formatted_number_W[15]) );
  AOI21X1TS U819 ( .A0(n560), .A1(n453), .B0(n452), .Y(n454) );
  OAI21X1TS U820 ( .A0(n489), .A1(n451), .B0(n454), .Y(sftr_odat_SHT2_SWR[8])
         );
  CLKAND2X2TS U821 ( .A(n907), .B(sftr_odat_SHT2_SWR[8]), .Y(
        formatted_number_W[6]) );
  OAI22X1TS U822 ( .A0(n493), .A1(n999), .B0(n455), .B1(n941), .Y(n456) );
  AOI22X1TS U823 ( .A0(n444), .A1(Data_array_SWR[39]), .B0(n443), .B1(
        Data_array_SWR[43]), .Y(n458) );
  AOI22X1TS U824 ( .A0(n554), .A1(Data_array_SWR[35]), .B0(n442), .B1(
        Data_array_SWR[47]), .Y(n457) );
  AOI21X1TS U825 ( .A0(n560), .A1(n480), .B0(n452), .Y(n459) );
  OAI21X1TS U826 ( .A0(n531), .A1(n451), .B0(n459), .Y(sftr_odat_SHT2_SWR[9])
         );
  CLKAND2X2TS U827 ( .A(n907), .B(sftr_odat_SHT2_SWR[9]), .Y(
        formatted_number_W[7]) );
  AOI22X1TS U828 ( .A0(n442), .A1(Data_array_SWR[43]), .B0(n443), .B1(
        Data_array_SWR[39]), .Y(n463) );
  AOI22X1TS U829 ( .A0(n444), .A1(Data_array_SWR[35]), .B0(n554), .B1(
        Data_array_SWR[31]), .Y(n462) );
  OAI211X1TS U830 ( .A0(n479), .A1(n976), .B0(n463), .C0(n462), .Y(n469) );
  AOI21X1TS U831 ( .A0(n560), .A1(n469), .B0(n452), .Y(n464) );
  OAI21X1TS U832 ( .A0(n473), .A1(n451), .B0(n464), .Y(sftr_odat_SHT2_SWR[5])
         );
  CLKAND2X2TS U833 ( .A(n907), .B(sftr_odat_SHT2_SWR[5]), .Y(
        formatted_number_W[3]) );
  AOI22X1TS U834 ( .A0(n442), .A1(Data_array_SWR[41]), .B0(n443), .B1(
        Data_array_SWR[37]), .Y(n467) );
  AOI22X1TS U835 ( .A0(n444), .A1(Data_array_SWR[33]), .B0(n554), .B1(
        Data_array_SWR[29]), .Y(n466) );
  OAI211X1TS U836 ( .A0(n566), .A1(n976), .B0(n467), .C0(n466), .Y(n475) );
  AOI21X1TS U837 ( .A0(n564), .A1(n475), .B0(n448), .Y(n468) );
  OAI21X1TS U838 ( .A0(n557), .A1(n441), .B0(n468), .Y(sftr_odat_SHT2_SWR[22])
         );
  CLKAND2X2TS U839 ( .A(n907), .B(sftr_odat_SHT2_SWR[22]), .Y(
        formatted_number_W[20]) );
  AOI21X1TS U840 ( .A0(n564), .A1(n469), .B0(n448), .Y(n470) );
  OAI21X1TS U841 ( .A0(n473), .A1(n441), .B0(n470), .Y(sftr_odat_SHT2_SWR[20])
         );
  CLKAND2X2TS U842 ( .A(n907), .B(sftr_odat_SHT2_SWR[20]), .Y(
        formatted_number_W[18]) );
  AOI22X1TS U843 ( .A0(n442), .A1(Data_array_SWR[42]), .B0(n443), .B1(
        Data_array_SWR[38]), .Y(n472) );
  AOI22X1TS U844 ( .A0(n444), .A1(Data_array_SWR[34]), .B0(n554), .B1(
        Data_array_SWR[30]), .Y(n471) );
  OAI211X1TS U845 ( .A0(n473), .A1(n976), .B0(n472), .C0(n471), .Y(n477) );
  AOI21X1TS U846 ( .A0(n560), .A1(n477), .B0(n452), .Y(n474) );
  OAI21X1TS U847 ( .A0(n479), .A1(n451), .B0(n474), .Y(sftr_odat_SHT2_SWR[4])
         );
  CLKAND2X2TS U848 ( .A(n907), .B(sftr_odat_SHT2_SWR[4]), .Y(
        formatted_number_W[2]) );
  AOI21X1TS U849 ( .A0(n560), .A1(n475), .B0(n452), .Y(n476) );
  OAI21X1TS U850 ( .A0(n451), .A1(n557), .B0(n476), .Y(sftr_odat_SHT2_SWR[3])
         );
  CLKAND2X2TS U851 ( .A(n907), .B(sftr_odat_SHT2_SWR[3]), .Y(
        formatted_number_W[1]) );
  AOI21X1TS U852 ( .A0(n564), .A1(n477), .B0(n448), .Y(n478) );
  OAI21X1TS U853 ( .A0(n479), .A1(n441), .B0(n478), .Y(sftr_odat_SHT2_SWR[21])
         );
  CLKAND2X2TS U854 ( .A(n907), .B(sftr_odat_SHT2_SWR[21]), .Y(
        formatted_number_W[19]) );
  AOI21X1TS U855 ( .A0(n564), .A1(n480), .B0(n448), .Y(n481) );
  OAI21X1TS U856 ( .A0(n531), .A1(n441), .B0(n481), .Y(sftr_odat_SHT2_SWR[16])
         );
  CLKAND2X2TS U857 ( .A(n907), .B(sftr_odat_SHT2_SWR[16]), .Y(
        formatted_number_W[14]) );
  INVX2TS U858 ( .A(n482), .Y(n507) );
  AOI22X1TS U859 ( .A0(n444), .A1(Data_array_SWR[40]), .B0(n554), .B1(
        Data_array_SWR[36]), .Y(n483) );
  OAI21XLTS U860 ( .A0(n997), .A1(n505), .B0(n483), .Y(n484) );
  OR2X1TS U861 ( .A(n485), .B(n507), .Y(n501) );
  AO22XLTS U862 ( .A0(n444), .A1(Data_array_SWR[45]), .B0(n554), .B1(
        Data_array_SWR[41]), .Y(n486) );
  AOI211X1TS U863 ( .A0(n443), .A1(Data_array_SWR[49]), .B0(n501), .C0(n486), 
        .Y(n515) );
  AOI22X1TS U864 ( .A0(n564), .A1(n514), .B0(n515), .B1(n560), .Y(
        sftr_odat_SHT2_SWR[15]) );
  CLKAND2X2TS U865 ( .A(n907), .B(sftr_odat_SHT2_SWR[15]), .Y(
        formatted_number_W[13]) );
  AOI22X1TS U866 ( .A0(n444), .A1(Data_array_SWR[31]), .B0(n554), .B1(
        Data_array_SWR[27]), .Y(n488) );
  AOI22X1TS U867 ( .A0(n442), .A1(Data_array_SWR[39]), .B0(n443), .B1(
        Data_array_SWR[35]), .Y(n487) );
  OAI211X1TS U868 ( .A0(n489), .A1(n976), .B0(n488), .C0(n487), .Y(n536) );
  AOI21X1TS U869 ( .A0(n564), .A1(n536), .B0(n448), .Y(n490) );
  OAI21X1TS U870 ( .A0(n538), .A1(n441), .B0(n490), .Y(sftr_odat_SHT2_SWR[24])
         );
  CLKAND2X2TS U871 ( .A(n907), .B(sftr_odat_SHT2_SWR[24]), .Y(
        formatted_number_W[22]) );
  AOI22X1TS U872 ( .A0(n442), .A1(Data_array_SWR[40]), .B0(n443), .B1(
        Data_array_SWR[36]), .Y(n496) );
  AOI22X1TS U873 ( .A0(n444), .A1(Data_array_SWR[32]), .B0(n554), .B1(
        Data_array_SWR[28]), .Y(n495) );
  OAI211X1TS U874 ( .A0(n562), .A1(n976), .B0(n496), .C0(n495), .Y(n508) );
  AOI21X1TS U875 ( .A0(n564), .A1(n508), .B0(n448), .Y(n497) );
  OAI21X1TS U876 ( .A0(n552), .A1(n441), .B0(n497), .Y(sftr_odat_SHT2_SWR[23])
         );
  CLKAND2X2TS U877 ( .A(n907), .B(sftr_odat_SHT2_SWR[23]), .Y(
        formatted_number_W[21]) );
  AOI22X1TS U878 ( .A0(n444), .A1(Data_array_SWR[41]), .B0(n554), .B1(
        Data_array_SWR[37]), .Y(n498) );
  AO22XLTS U879 ( .A0(Data_array_SWR[44]), .A1(n444), .B0(n554), .B1(
        Data_array_SWR[40]), .Y(n500) );
  AOI211X1TS U880 ( .A0(Data_array_SWR[48]), .A1(n443), .B0(n501), .C0(n500), 
        .Y(n513) );
  AOI22X1TS U881 ( .A0(n564), .A1(n512), .B0(n513), .B1(n560), .Y(
        sftr_odat_SHT2_SWR[14]) );
  CLKAND2X2TS U882 ( .A(n907), .B(sftr_odat_SHT2_SWR[14]), .Y(
        formatted_number_W[12]) );
  AOI22X1TS U883 ( .A0(n444), .A1(Data_array_SWR[42]), .B0(n554), .B1(
        Data_array_SWR[38]), .Y(n502) );
  OAI21XLTS U884 ( .A0(n505), .A1(n941), .B0(n502), .Y(n503) );
  AOI211X1TS U885 ( .A0(n443), .A1(Data_array_SWR[46]), .B0(n507), .C0(n503), 
        .Y(n510) );
  AOI22X1TS U886 ( .A0(n444), .A1(Data_array_SWR[43]), .B0(n554), .B1(
        Data_array_SWR[39]), .Y(n504) );
  OAI21XLTS U887 ( .A0(n505), .A1(n940), .B0(n504), .Y(n506) );
  AOI211X1TS U888 ( .A0(n443), .A1(Data_array_SWR[47]), .B0(n507), .C0(n506), 
        .Y(n511) );
  AOI22X1TS U889 ( .A0(n564), .A1(n510), .B0(n511), .B1(n560), .Y(
        sftr_odat_SHT2_SWR[13]) );
  CLKAND2X2TS U890 ( .A(n907), .B(sftr_odat_SHT2_SWR[13]), .Y(
        formatted_number_W[11]) );
  AOI21X1TS U891 ( .A0(n560), .A1(n508), .B0(n452), .Y(n509) );
  OAI21X1TS U892 ( .A0(n552), .A1(n451), .B0(n509), .Y(sftr_odat_SHT2_SWR[2])
         );
  CLKAND2X2TS U893 ( .A(n907), .B(sftr_odat_SHT2_SWR[2]), .Y(
        formatted_number_W[0]) );
  AOI22X1TS U894 ( .A0(n564), .A1(n511), .B0(n510), .B1(n560), .Y(
        sftr_odat_SHT2_SWR[12]) );
  CLKAND2X2TS U895 ( .A(n907), .B(sftr_odat_SHT2_SWR[12]), .Y(
        formatted_number_W[10]) );
  AOI22X1TS U896 ( .A0(n564), .A1(n513), .B0(n512), .B1(n560), .Y(
        sftr_odat_SHT2_SWR[11]) );
  CLKAND2X2TS U897 ( .A(n907), .B(sftr_odat_SHT2_SWR[11]), .Y(
        formatted_number_W[9]) );
  AOI22X1TS U898 ( .A0(n564), .A1(n515), .B0(n514), .B1(n560), .Y(
        sftr_odat_SHT2_SWR[10]) );
  CLKAND2X2TS U899 ( .A(n402), .B(sftr_odat_SHT2_SWR[10]), .Y(
        formatted_number_W[8]) );
  OR2X2TS U900 ( .A(ADD_OVRFLW_NRM), .B(n912), .Y(n594) );
  INVX4TS U901 ( .A(n594), .Y(n1064) );
  NAND2X1TS U902 ( .A(DmP_EXP_EWSW[23]), .B(n406), .Y(n516) );
  OAI21XLTS U903 ( .A0(DmP_EXP_EWSW[23]), .A1(n406), .B0(n516), .Y(
        Shift_amount_EXP_EW[0]) );
  NAND2X1TS U904 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n913), .Y(n909)
         );
  NAND2X1TS U905 ( .A(n943), .B(inst_FSM_INPUT_ENABLE_state_reg[0]), .Y(n908)
         );
  OAI21XLTS U906 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[0]), .A1(n909), .B0(
        n908), .Y(n388) );
  INVX2TS U907 ( .A(intadd_429_SUM_0_), .Y(Shift_amount_EXP_EW[1]) );
  INVX2TS U908 ( .A(intadd_429_SUM_1_), .Y(Shift_amount_EXP_EW[2]) );
  INVX2TS U909 ( .A(intadd_429_SUM_2_), .Y(Shift_amount_EXP_EW[3]) );
  INVX2TS U910 ( .A(n516), .Y(intadd_429_CI) );
  CLKBUFX2TS U911 ( .A(n1065), .Y(n890) );
  NAND2X1TS U912 ( .A(DMP_SFG[0]), .B(DmP_mant_SFG_SWR[2]), .Y(n844) );
  AOI22X1TS U913 ( .A0(n855), .A1(n520), .B0(n844), .B1(n890), .Y(n518) );
  NAND2X1TS U914 ( .A(DmP_mant_SFG_SWR[3]), .B(n946), .Y(n519) );
  OAI21XLTS U915 ( .A0(DmP_mant_SFG_SWR[3]), .A1(n946), .B0(n519), .Y(n517) );
  XOR2XLTS U916 ( .A(n518), .B(n517), .Y(Raw_mant_SGF[3]) );
  NOR2X1TS U917 ( .A(DmP_mant_SFG_SWR[4]), .B(n951), .Y(n523) );
  AOI22X1TS U918 ( .A0(DMP_SFG[1]), .A1(n914), .B0(n520), .B1(n519), .Y(n524)
         );
  AOI222X4TS U919 ( .A0(n946), .A1(n844), .B0(n946), .B1(n914), .C0(n844), 
        .C1(n914), .Y(n526) );
  AOI22X1TS U920 ( .A0(n855), .A1(n524), .B0(n526), .B1(n1065), .Y(n522) );
  OAI31X1TS U921 ( .A0(n523), .A1(n522), .A2(n525), .B0(n521), .Y(
        Raw_mant_SGF[4]) );
  OAI22X1TS U922 ( .A0(DmP_mant_SFG_SWR[4]), .A1(n951), .B0(n525), .B1(n524), 
        .Y(n539) );
  AOI22X1TS U923 ( .A0(n855), .A1(n539), .B0(n541), .B1(n1065), .Y(n528) );
  NAND2X1TS U924 ( .A(DmP_mant_SFG_SWR[5]), .B(n915), .Y(n540) );
  OAI21XLTS U925 ( .A0(DmP_mant_SFG_SWR[5]), .A1(n915), .B0(n540), .Y(n527) );
  XOR2XLTS U926 ( .A(n528), .B(n527), .Y(Raw_mant_SGF[5]) );
  AOI22X1TS U927 ( .A0(n444), .A1(Data_array_SWR[30]), .B0(n443), .B1(
        Data_array_SWR[34]), .Y(n530) );
  AOI22X1TS U928 ( .A0(n554), .A1(Data_array_SWR[26]), .B0(n442), .B1(
        Data_array_SWR[38]), .Y(n529) );
  OAI211X1TS U929 ( .A0(n531), .A1(n976), .B0(n530), .C0(n529), .Y(n533) );
  AOI21X1TS U930 ( .A0(n564), .A1(n533), .B0(n448), .Y(n532) );
  OAI21XLTS U931 ( .A0(n535), .A1(n441), .B0(n532), .Y(sftr_odat_SHT2_SWR[25])
         );
  AOI21X1TS U932 ( .A0(n560), .A1(n533), .B0(n452), .Y(n534) );
  OAI21XLTS U933 ( .A0(n451), .A1(n535), .B0(n534), .Y(sftr_odat_SHT2_SWR[0])
         );
  AOI21X1TS U934 ( .A0(n560), .A1(n536), .B0(n452), .Y(n537) );
  OAI21XLTS U935 ( .A0(n451), .A1(n538), .B0(n537), .Y(sftr_odat_SHT2_SWR[1])
         );
  NOR2X1TS U936 ( .A(DmP_mant_SFG_SWR[6]), .B(n952), .Y(n544) );
  AOI22X1TS U937 ( .A0(DMP_SFG[3]), .A1(n947), .B0(n540), .B1(n539), .Y(n545)
         );
  AOI222X4TS U938 ( .A0(n541), .A1(n915), .B0(n541), .B1(n947), .C0(n915), 
        .C1(n947), .Y(n547) );
  AOI22X1TS U939 ( .A0(n855), .A1(n545), .B0(n547), .B1(n1065), .Y(n543) );
  OAI21XLTS U940 ( .A0(n544), .A1(n546), .B0(n543), .Y(n542) );
  OAI31X1TS U941 ( .A0(n544), .A1(n543), .A2(n546), .B0(n542), .Y(
        Raw_mant_SGF[6]) );
  OAI22X1TS U942 ( .A0(DmP_mant_SFG_SWR[6]), .A1(n952), .B0(n546), .B1(n545), 
        .Y(n569) );
  AOI22X1TS U943 ( .A0(n855), .A1(n569), .B0(n571), .B1(n1065), .Y(n549) );
  NAND2X1TS U944 ( .A(DmP_mant_SFG_SWR[7]), .B(n916), .Y(n570) );
  OAI21XLTS U945 ( .A0(DmP_mant_SFG_SWR[7]), .A1(n916), .B0(n570), .Y(n548) );
  XOR2XLTS U946 ( .A(n549), .B(n548), .Y(Raw_mant_SGF[7]) );
  OR2X1TS U947 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[3]), .Y(formatted_number_W[26]) );
  OR2X1TS U948 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[5]), .Y(formatted_number_W[28]) );
  OR2X1TS U949 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[0]), .Y(formatted_number_W[23]) );
  OR2X1TS U950 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[6]), .Y(formatted_number_W[29]) );
  OR2X1TS U951 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[2]), .Y(formatted_number_W[25]) );
  OR2X1TS U952 ( .A(array_comparators_LTComparator_N0), .B(
        exp_rslt_NRM2_EW1[1]), .Y(formatted_number_W[24]) );
  AOI22X1TS U953 ( .A0(n442), .A1(Data_array_SWR[45]), .B0(n443), .B1(
        Data_array_SWR[41]), .Y(n551) );
  AOI22X1TS U954 ( .A0(n444), .A1(Data_array_SWR[37]), .B0(n554), .B1(
        Data_array_SWR[33]), .Y(n550) );
  AOI21X1TS U955 ( .A0(n564), .A1(n559), .B0(n448), .Y(n553) );
  OAI21X1TS U956 ( .A0(n562), .A1(n441), .B0(n553), .Y(sftr_odat_SHT2_SWR[18])
         );
  AOI22X1TS U957 ( .A0(Data_array_SWR[44]), .A1(n442), .B0(Data_array_SWR[40]), 
        .B1(n443), .Y(n556) );
  AOI22X1TS U958 ( .A0(n444), .A1(Data_array_SWR[36]), .B0(Data_array_SWR[32]), 
        .B1(n554), .Y(n555) );
  OAI211X1TS U959 ( .A0(n976), .A1(n557), .B0(n556), .C0(n555), .Y(n563) );
  AOI21X1TS U960 ( .A0(n560), .A1(n563), .B0(n452), .Y(n558) );
  OAI21X1TS U961 ( .A0(n566), .A1(n451), .B0(n558), .Y(sftr_odat_SHT2_SWR[6])
         );
  AOI21X1TS U962 ( .A0(n560), .A1(n559), .B0(n452), .Y(n561) );
  OAI21X1TS U963 ( .A0(n562), .A1(n451), .B0(n561), .Y(sftr_odat_SHT2_SWR[7])
         );
  AOI21X1TS U964 ( .A0(n564), .A1(n563), .B0(n448), .Y(n565) );
  OAI21X1TS U965 ( .A0(n566), .A1(n441), .B0(n565), .Y(sftr_odat_SHT2_SWR[19])
         );
  NOR2BX1TS U966 ( .AN(LZD_output_NRM2_EW[3]), .B(ADD_OVRFLW_NRM2), .Y(n567)
         );
  XOR2X1TS U967 ( .A(n920), .B(n567), .Y(DP_OP_15J181_122_6956_n15) );
  NOR2BX1TS U968 ( .AN(LZD_output_NRM2_EW[4]), .B(ADD_OVRFLW_NRM2), .Y(n568)
         );
  XOR2X1TS U969 ( .A(n920), .B(n568), .Y(DP_OP_15J181_122_6956_n14) );
  NOR2X1TS U970 ( .A(DmP_mant_SFG_SWR[8]), .B(n954), .Y(n574) );
  AOI22X1TS U971 ( .A0(DMP_SFG[5]), .A1(n948), .B0(n570), .B1(n569), .Y(n576)
         );
  AOI222X4TS U972 ( .A0(n571), .A1(n916), .B0(n571), .B1(n948), .C0(n916), 
        .C1(n948), .Y(n578) );
  AOI22X1TS U973 ( .A0(n855), .A1(n576), .B0(n578), .B1(n1065), .Y(n573) );
  OAI21XLTS U974 ( .A0(n574), .A1(n577), .B0(n573), .Y(n572) );
  OAI31X1TS U975 ( .A0(n574), .A1(n573), .A2(n577), .B0(n572), .Y(
        Raw_mant_SGF[8]) );
  NOR2X1TS U976 ( .A(DmP_mant_SFG_SWR[10]), .B(n955), .Y(n581) );
  NAND2X1TS U977 ( .A(DmP_mant_SFG_SWR[9]), .B(n917), .Y(n850) );
  OAI22X1TS U978 ( .A0(DmP_mant_SFG_SWR[8]), .A1(n954), .B0(n577), .B1(n576), 
        .Y(n849) );
  AOI22X1TS U979 ( .A0(DMP_SFG[7]), .A1(n949), .B0(n850), .B1(n849), .Y(n586)
         );
  AOI222X4TS U980 ( .A0(n848), .A1(n917), .B0(n848), .B1(n949), .C0(n917), 
        .C1(n949), .Y(n588) );
  AOI22X1TS U981 ( .A0(n855), .A1(n586), .B0(n588), .B1(n1065), .Y(n580) );
  OAI31X1TS U982 ( .A0(n581), .A1(n580), .A2(n587), .B0(n579), .Y(
        Raw_mant_SGF[10]) );
  AOI221X4TS U983 ( .A0(Raw_mant_NRM_SWR[0]), .A1(n611), .B0(
        Raw_mant_NRM_SWR[25]), .B1(n594), .C0(n924), .Y(n906) );
  NAND2X1TS U984 ( .A(n596), .B(n584), .Y(n582) );
  INVX2TS U985 ( .A(n584), .Y(n595) );
  AOI22X1TS U986 ( .A0(n611), .A1(Raw_mant_NRM_SWR[24]), .B0(
        Raw_mant_NRM_SWR[1]), .B1(n401), .Y(n635) );
  INVX2TS U987 ( .A(n627), .Y(n633) );
  AOI22X1TS U988 ( .A0(n611), .A1(Raw_mant_NRM_SWR[25]), .B0(n643), .B1(n633), 
        .Y(n585) );
  NOR2X1TS U989 ( .A(DmP_mant_SFG_SWR[12]), .B(n957), .Y(n591) );
  NAND2X1TS U990 ( .A(DmP_mant_SFG_SWR[11]), .B(n918), .Y(n856) );
  OAI22X1TS U991 ( .A0(DmP_mant_SFG_SWR[10]), .A1(n955), .B0(n587), .B1(n586), 
        .Y(n854) );
  AOI22X1TS U992 ( .A0(DMP_SFG[9]), .A1(n953), .B0(n856), .B1(n854), .Y(n675)
         );
  AOI222X4TS U993 ( .A0(n853), .A1(n918), .B0(n853), .B1(n953), .C0(n918), 
        .C1(n953), .Y(n677) );
  AOI22X1TS U994 ( .A0(n407), .A1(n675), .B0(n677), .B1(n1065), .Y(n590) );
  CLKAND2X2TS U995 ( .A(DmP_mant_SFG_SWR[12]), .B(n957), .Y(n676) );
  OAI21XLTS U996 ( .A0(n591), .A1(n676), .B0(n590), .Y(n589) );
  OAI31X1TS U997 ( .A0(n591), .A1(n590), .A2(n676), .B0(n589), .Y(
        Raw_mant_SGF[12]) );
  AOI22X1TS U998 ( .A0(n400), .A1(Raw_mant_NRM_SWR[22]), .B0(
        DmP_mant_SHT1_SW[20]), .B1(n924), .Y(n593) );
  AOI222X4TS U999 ( .A0(n912), .A1(DmP_mant_SHT1_SW[22]), .B0(
        Raw_mant_NRM_SWR[24]), .B1(n401), .C0(Raw_mant_NRM_SWR[1]), .C1(n1064), 
        .Y(n903) );
  AOI222X4TS U1000 ( .A0(n912), .A1(DmP_mant_SHT1_SW[21]), .B0(
        Raw_mant_NRM_SWR[23]), .B1(n401), .C0(Raw_mant_NRM_SWR[2]), .C1(n1064), 
        .Y(n905) );
  NAND2X1TS U1001 ( .A(n596), .B(n595), .Y(n597) );
  BUFX4TS U1002 ( .A(n597), .Y(n904) );
  OAI22X1TS U1003 ( .A0(n903), .A1(n583), .B0(n905), .B1(n904), .Y(n598) );
  AOI21X1TS U1004 ( .A0(n398), .A1(n671), .B0(n598), .Y(n599) );
  AOI222X4TS U1005 ( .A0(n912), .A1(DmP_mant_SHT1_SW[9]), .B0(
        Raw_mant_NRM_SWR[11]), .B1(n400), .C0(Raw_mant_NRM_SWR[14]), .C1(n1064), .Y(n664) );
  AOI22X1TS U1006 ( .A0(n400), .A1(Raw_mant_NRM_SWR[10]), .B0(
        DmP_mant_SHT1_SW[8]), .B1(n924), .Y(n600) );
  AOI222X4TS U1007 ( .A0(n912), .A1(DmP_mant_SHT1_SW[11]), .B0(n1064), .B1(
        Raw_mant_NRM_SWR[12]), .C0(Raw_mant_NRM_SWR[13]), .C1(n400), .Y(n657)
         );
  AOI222X4TS U1008 ( .A0(n912), .A1(DmP_mant_SHT1_SW[10]), .B0(
        Raw_mant_NRM_SWR[12]), .B1(n400), .C0(Raw_mant_NRM_SWR[13]), .C1(n1064), .Y(n662) );
  OAI22X1TS U1009 ( .A0(n657), .A1(n592), .B0(n662), .B1(n583), .Y(n601) );
  AOI21X1TS U1010 ( .A0(n398), .A1(n666), .B0(n601), .Y(n602) );
  AOI222X4TS U1011 ( .A0(n912), .A1(DmP_mant_SHT1_SW[17]), .B0(
        Raw_mant_NRM_SWR[19]), .B1(n401), .C0(Raw_mant_NRM_SWR[6]), .C1(n1064), 
        .Y(n652) );
  AOI22X1TS U1012 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n611), .B0(
        DmP_mant_SHT1_SW[16]), .B1(n924), .Y(n603) );
  AOI222X4TS U1013 ( .A0(n912), .A1(DmP_mant_SHT1_SW[19]), .B0(
        Raw_mant_NRM_SWR[21]), .B1(n401), .C0(Raw_mant_NRM_SWR[4]), .C1(n1064), 
        .Y(n669) );
  AOI222X4TS U1014 ( .A0(n912), .A1(DmP_mant_SHT1_SW[18]), .B0(
        Raw_mant_NRM_SWR[20]), .B1(n401), .C0(Raw_mant_NRM_SWR[5]), .C1(n1064), 
        .Y(n674) );
  OAI22X1TS U1015 ( .A0(n669), .A1(n592), .B0(n674), .B1(n583), .Y(n604) );
  AOI21X1TS U1016 ( .A0(n398), .A1(n654), .B0(n604), .Y(n605) );
  AOI222X4TS U1017 ( .A0(n924), .A1(DmP_mant_SHT1_SW[5]), .B0(n611), .B1(
        Raw_mant_NRM_SWR[18]), .C0(Raw_mant_NRM_SWR[7]), .C1(n401), .Y(n646)
         );
  AOI22X1TS U1018 ( .A0(Raw_mant_NRM_SWR[19]), .A1(n611), .B0(
        DmP_mant_SHT1_SW[4]), .B1(n924), .Y(n606) );
  AOI222X4TS U1019 ( .A0(n924), .A1(DmP_mant_SHT1_SW[7]), .B0(
        Raw_mant_NRM_SWR[9]), .B1(n400), .C0(Raw_mant_NRM_SWR[16]), .C1(n1064), 
        .Y(n663) );
  AOI222X4TS U1020 ( .A0(n912), .A1(DmP_mant_SHT1_SW[6]), .B0(
        Raw_mant_NRM_SWR[8]), .B1(n400), .C0(Raw_mant_NRM_SWR[17]), .C1(n1064), 
        .Y(n668) );
  OAI22X1TS U1021 ( .A0(n663), .A1(n592), .B0(n668), .B1(n583), .Y(n607) );
  AOI21X1TS U1022 ( .A0(n398), .A1(n648), .B0(n607), .Y(n608) );
  AOI222X4TS U1023 ( .A0(n912), .A1(DmP_mant_SHT1_SW[13]), .B0(n611), .B1(
        Raw_mant_NRM_SWR[10]), .C0(Raw_mant_NRM_SWR[15]), .C1(n400), .Y(n658)
         );
  AOI22X1TS U1024 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n611), .B0(
        DmP_mant_SHT1_SW[12]), .B1(n924), .Y(n609) );
  AOI222X4TS U1025 ( .A0(n912), .A1(DmP_mant_SHT1_SW[15]), .B0(n611), .B1(
        Raw_mant_NRM_SWR[8]), .C0(Raw_mant_NRM_SWR[17]), .C1(n400), .Y(n651)
         );
  AOI222X4TS U1026 ( .A0(n912), .A1(DmP_mant_SHT1_SW[14]), .B0(n611), .B1(
        Raw_mant_NRM_SWR[9]), .C0(Raw_mant_NRM_SWR[16]), .C1(n400), .Y(n656)
         );
  OAI22X1TS U1027 ( .A0(n651), .A1(n592), .B0(n656), .B1(n583), .Y(n612) );
  AOI21X1TS U1028 ( .A0(n398), .A1(n660), .B0(n612), .Y(n613) );
  INVX2TS U1029 ( .A(n904), .Y(n629) );
  AOI222X4TS U1030 ( .A0(n924), .A1(DmP_mant_SHT1_SW[3]), .B0(n1064), .B1(
        Raw_mant_NRM_SWR[20]), .C0(Raw_mant_NRM_SWR[5]), .C1(n401), .Y(n645)
         );
  AOI222X4TS U1031 ( .A0(n924), .A1(DmP_mant_SHT1_SW[2]), .B0(n1064), .B1(
        Raw_mant_NRM_SWR[21]), .C0(Raw_mant_NRM_SWR[4]), .C1(n401), .Y(n650)
         );
  OAI22X1TS U1032 ( .A0(n645), .A1(n592), .B0(n650), .B1(n583), .Y(n615) );
  AOI21X1TS U1033 ( .A0(n629), .A1(n633), .B0(n615), .Y(n616) );
  OAI22X1TS U1034 ( .A0(n668), .A1(n592), .B0(n646), .B1(n583), .Y(n617) );
  AOI21X1TS U1035 ( .A0(n629), .A1(n648), .B0(n617), .Y(n618) );
  OAI22X1TS U1036 ( .A0(n656), .A1(n592), .B0(n658), .B1(n583), .Y(n619) );
  AOI21X1TS U1037 ( .A0(n629), .A1(n660), .B0(n619), .Y(n620) );
  OAI22X1TS U1038 ( .A0(n662), .A1(n592), .B0(n664), .B1(n583), .Y(n621) );
  AOI21X1TS U1039 ( .A0(n629), .A1(n666), .B0(n621), .Y(n622) );
  OAI22X1TS U1040 ( .A0(n674), .A1(n592), .B0(n652), .B1(n583), .Y(n623) );
  AOI21X1TS U1041 ( .A0(n629), .A1(n654), .B0(n623), .Y(n624) );
  OAI22X1TS U1042 ( .A0(n645), .A1(n583), .B0(n650), .B1(n904), .Y(n625) );
  AOI21X1TS U1043 ( .A0(n643), .A1(n648), .B0(n625), .Y(n626) );
  OAI22X1TS U1044 ( .A0(n903), .A1(n592), .B0(n905), .B1(n583), .Y(n628) );
  AOI21X1TS U1045 ( .A0(n629), .A1(n671), .B0(n628), .Y(n630) );
  OAI22X1TS U1046 ( .A0(n650), .A1(n592), .B0(n631), .B1(n904), .Y(n632) );
  AOI21X1TS U1047 ( .A0(n672), .A1(n633), .B0(n632), .Y(n634) );
  OAI22X1TS U1048 ( .A0(n657), .A1(n583), .B0(n662), .B1(n904), .Y(n636) );
  AOI21X1TS U1049 ( .A0(n643), .A1(n660), .B0(n636), .Y(n637) );
  OAI22X1TS U1050 ( .A0(n669), .A1(n583), .B0(n674), .B1(n904), .Y(n638) );
  AOI21X1TS U1051 ( .A0(n643), .A1(n671), .B0(n638), .Y(n639) );
  OAI22X1TS U1052 ( .A0(n651), .A1(n583), .B0(n656), .B1(n904), .Y(n640) );
  AOI21X1TS U1053 ( .A0(n643), .A1(n654), .B0(n640), .Y(n641) );
  OAI22X1TS U1054 ( .A0(n663), .A1(n583), .B0(n668), .B1(n904), .Y(n642) );
  AOI21X1TS U1055 ( .A0(n643), .A1(n666), .B0(n642), .Y(n644) );
  OAI22X1TS U1056 ( .A0(n646), .A1(n592), .B0(n645), .B1(n904), .Y(n647) );
  AOI21X1TS U1057 ( .A0(n672), .A1(n648), .B0(n647), .Y(n649) );
  OAI22X1TS U1058 ( .A0(n652), .A1(n592), .B0(n651), .B1(n904), .Y(n653) );
  AOI21X1TS U1059 ( .A0(n672), .A1(n654), .B0(n653), .Y(n655) );
  OAI22X1TS U1060 ( .A0(n658), .A1(n592), .B0(n657), .B1(n904), .Y(n659) );
  AOI21X1TS U1061 ( .A0(n672), .A1(n660), .B0(n659), .Y(n661) );
  OAI22X1TS U1062 ( .A0(n664), .A1(n592), .B0(n663), .B1(n904), .Y(n665) );
  AOI21X1TS U1063 ( .A0(n672), .A1(n666), .B0(n665), .Y(n667) );
  OAI22X1TS U1064 ( .A0(n905), .A1(n592), .B0(n669), .B1(n904), .Y(n670) );
  AOI21X1TS U1065 ( .A0(n672), .A1(n671), .B0(n670), .Y(n673) );
  NOR2X1TS U1066 ( .A(DmP_mant_SFG_SWR[14]), .B(n959), .Y(n680) );
  NAND2X1TS U1067 ( .A(DmP_mant_SFG_SWR[13]), .B(n919), .Y(n861) );
  OAI22X1TS U1068 ( .A0(DmP_mant_SFG_SWR[12]), .A1(n957), .B0(n676), .B1(n675), 
        .Y(n860) );
  AOI22X1TS U1069 ( .A0(DMP_SFG[11]), .A1(n958), .B0(n861), .B1(n860), .Y(n681) );
  AOI222X4TS U1070 ( .A0(n859), .A1(n919), .B0(n859), .B1(n958), .C0(n919), 
        .C1(n958), .Y(n683) );
  AOI22X1TS U1071 ( .A0(n407), .A1(n681), .B0(n683), .B1(n1065), .Y(n679) );
  CLKAND2X2TS U1072 ( .A(DmP_mant_SFG_SWR[14]), .B(n959), .Y(n682) );
  OAI21XLTS U1073 ( .A0(n680), .A1(n682), .B0(n679), .Y(n678) );
  OAI31X1TS U1074 ( .A0(n680), .A1(n679), .A2(n682), .B0(n678), .Y(
        Raw_mant_SGF[14]) );
  NOR2X1TS U1075 ( .A(DmP_mant_SFG_SWR[16]), .B(n962), .Y(n686) );
  NAND2X1TS U1076 ( .A(DmP_mant_SFG_SWR[15]), .B(n921), .Y(n866) );
  OAI22X1TS U1077 ( .A0(DmP_mant_SFG_SWR[14]), .A1(n959), .B0(n682), .B1(n681), 
        .Y(n865) );
  AOI22X1TS U1078 ( .A0(DMP_SFG[13]), .A1(n963), .B0(n866), .B1(n865), .Y(n687) );
  AOI222X4TS U1079 ( .A0(n864), .A1(n921), .B0(n864), .B1(n963), .C0(n921), 
        .C1(n963), .Y(n689) );
  AOI22X1TS U1080 ( .A0(n407), .A1(n687), .B0(n689), .B1(n1065), .Y(n685) );
  CLKAND2X2TS U1081 ( .A(DmP_mant_SFG_SWR[16]), .B(n962), .Y(n688) );
  OAI31X1TS U1082 ( .A0(n686), .A1(n685), .A2(n688), .B0(n684), .Y(
        Raw_mant_SGF[16]) );
  NOR2X1TS U1083 ( .A(DmP_mant_SFG_SWR[18]), .B(n971), .Y(n692) );
  NAND2X1TS U1084 ( .A(DmP_mant_SFG_SWR[17]), .B(n922), .Y(n871) );
  OAI22X1TS U1085 ( .A0(DmP_mant_SFG_SWR[16]), .A1(n962), .B0(n688), .B1(n687), 
        .Y(n870) );
  AOI22X1TS U1086 ( .A0(DMP_SFG[15]), .A1(n967), .B0(n871), .B1(n870), .Y(n693) );
  AOI222X4TS U1087 ( .A0(n869), .A1(n922), .B0(n869), .B1(n967), .C0(n922), 
        .C1(n967), .Y(n695) );
  AOI22X1TS U1088 ( .A0(n407), .A1(n693), .B0(n695), .B1(n1065), .Y(n691) );
  CLKAND2X2TS U1089 ( .A(DmP_mant_SFG_SWR[18]), .B(n971), .Y(n694) );
  OAI31X1TS U1090 ( .A0(n692), .A1(n691), .A2(n694), .B0(n690), .Y(
        Raw_mant_SGF[18]) );
  NOR2X1TS U1091 ( .A(DmP_mant_SFG_SWR[20]), .B(n974), .Y(n698) );
  NAND2X1TS U1092 ( .A(DmP_mant_SFG_SWR[19]), .B(n925), .Y(n876) );
  OAI22X1TS U1093 ( .A0(DmP_mant_SFG_SWR[18]), .A1(n971), .B0(n694), .B1(n693), 
        .Y(n875) );
  AOI22X1TS U1094 ( .A0(DMP_SFG[17]), .A1(n972), .B0(n876), .B1(n875), .Y(n699) );
  AOI222X4TS U1095 ( .A0(n874), .A1(n925), .B0(n874), .B1(n972), .C0(n925), 
        .C1(n972), .Y(n701) );
  AOI22X1TS U1096 ( .A0(n407), .A1(n699), .B0(n701), .B1(n1065), .Y(n697) );
  CLKAND2X2TS U1097 ( .A(DmP_mant_SFG_SWR[20]), .B(n974), .Y(n700) );
  OAI31X1TS U1098 ( .A0(n698), .A1(n697), .A2(n700), .B0(n696), .Y(
        Raw_mant_SGF[20]) );
  NOR2X1TS U1099 ( .A(DmP_mant_SFG_SWR[22]), .B(n995), .Y(n704) );
  NAND2X1TS U1100 ( .A(DmP_mant_SFG_SWR[21]), .B(n926), .Y(n881) );
  OAI22X1TS U1101 ( .A0(DmP_mant_SFG_SWR[20]), .A1(n974), .B0(n700), .B1(n699), 
        .Y(n880) );
  AOI22X1TS U1102 ( .A0(DMP_SFG[19]), .A1(n975), .B0(n881), .B1(n880), .Y(n731) );
  AOI222X4TS U1103 ( .A0(n879), .A1(n926), .B0(n879), .B1(n975), .C0(n926), 
        .C1(n975), .Y(n733) );
  AOI22X1TS U1104 ( .A0(n407), .A1(n731), .B0(n733), .B1(n890), .Y(n703) );
  CLKAND2X2TS U1105 ( .A(DmP_mant_SFG_SWR[22]), .B(n995), .Y(n732) );
  OAI31X1TS U1106 ( .A0(n704), .A1(n703), .A2(n732), .B0(n702), .Y(
        Raw_mant_SGF[22]) );
  INVX2TS U1107 ( .A(n705), .Y(n707) );
  NOR2XLTS U1108 ( .A(Raw_mant_NRM_SWR[13]), .B(Raw_mant_NRM_SWR[11]), .Y(n706) );
  OAI22X1TS U1109 ( .A0(n708), .A1(n707), .B0(n706), .B1(n720), .Y(n709) );
  AOI21X1TS U1110 ( .A0(n710), .A1(Raw_mant_NRM_SWR[3]), .B0(n709), .Y(n711)
         );
  OAI211X1TS U1111 ( .A0(n713), .A1(n1003), .B0(n712), .C0(n711), .Y(
        LZD_raw_out_EWR[2]) );
  INVX2TS U1112 ( .A(n714), .Y(n716) );
  NOR3X1TS U1113 ( .A(Raw_mant_NRM_SWR[2]), .B(n730), .C(n961), .Y(n726) );
  OAI211X1TS U1114 ( .A0(n721), .A1(n720), .B0(n719), .C0(n718), .Y(
        LZD_raw_out_EWR[3]) );
  OAI31X1TS U1115 ( .A0(n724), .A1(Raw_mant_NRM_SWR[10]), .A2(n723), .B0(n722), 
        .Y(n725) );
  AOI211X1TS U1116 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n727), .B0(n726), .C0(n725), 
        .Y(n728) );
  OAI211X1TS U1117 ( .A0(n1030), .A1(n730), .B0(n729), .C0(n728), .Y(
        LZD_raw_out_EWR[4]) );
  NOR2X1TS U1118 ( .A(DmP_mant_SFG_SWR[24]), .B(n1001), .Y(n889) );
  NAND2X1TS U1119 ( .A(DmP_mant_SFG_SWR[23]), .B(n939), .Y(n886) );
  OAI22X1TS U1120 ( .A0(DmP_mant_SFG_SWR[22]), .A1(n995), .B0(n732), .B1(n731), 
        .Y(n885) );
  AOI22X1TS U1121 ( .A0(DMP_SFG[21]), .A1(n996), .B0(n886), .B1(n885), .Y(n892) );
  AOI21X1TS U1122 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n1001), .B0(n892), .Y(n734)
         );
  AOI222X4TS U1123 ( .A0(n884), .A1(n939), .B0(n884), .B1(n996), .C0(n939), 
        .C1(n996), .Y(n891) );
  OAI32X1TS U1124 ( .A0(n890), .A1(n889), .A2(n734), .B0(n775), .B1(n855), .Y(
        n735) );
  NOR2BX1TS U1125 ( .AN(LZD_output_NRM2_EW[2]), .B(ADD_OVRFLW_NRM2), .Y(n736)
         );
  XOR2X1TS U1126 ( .A(n920), .B(n736), .Y(DP_OP_15J181_122_6956_n16) );
  NOR2BX1TS U1127 ( .AN(LZD_output_NRM2_EW[1]), .B(ADD_OVRFLW_NRM2), .Y(n737)
         );
  XOR2X1TS U1128 ( .A(n920), .B(n737), .Y(DP_OP_15J181_122_6956_n17) );
  OR2X1TS U1129 ( .A(ADD_OVRFLW_NRM2), .B(LZD_output_NRM2_EW[0]), .Y(n738) );
  XOR2X1TS U1130 ( .A(n920), .B(n738), .Y(DP_OP_15J181_122_6956_n18) );
  NOR2BX1TS U1131 ( .AN(exp_rslt_NRM2_EW1[7]), .B(
        array_comparators_GTComparator_N0), .Y(formatted_number_W[30]) );
  AOI2BB1XLTS U1132 ( .A0N(array_comparators_LTComparator_N0), .A1N(
        SIGN_FLAG_SHT1SHT2), .B0(array_comparators_GTComparator_N0), .Y(
        formatted_number_W[31]) );
  XOR2XLTS U1133 ( .A(DMP_EXP_EWSW[27]), .B(DmP_EXP_EWSW[27]), .Y(n739) );
  XOR2XLTS U1134 ( .A(intadd_429_n1), .B(n739), .Y(Shift_amount_EXP_EW[4]) );
  AOI22X1TS U1135 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n908), .B1(n913), .Y(n1067)
         );
  XNOR2X1TS U1136 ( .A(add_subt), .B(Data_Y[31]), .Y(n1033) );
  XNOR2X1TS U1137 ( .A(intDX_EWSW[31]), .B(n1066), .Y(OP_FLAG_INIT) );
  AOI22X1TS U1138 ( .A0(intDX_EWSW[23]), .A1(intDY_EWSW[23]), .B0(n942), .B1(
        n994), .Y(n746) );
  AOI22X1TS U1139 ( .A0(n933), .A1(intDY_EWSW[15]), .B0(n987), .B1(
        intDY_EWSW[13]), .Y(n740) );
  OAI221XLTS U1140 ( .A0(n933), .A1(intDY_EWSW[15]), .B0(n987), .B1(
        intDY_EWSW[13]), .C0(n740), .Y(n745) );
  AOI22X1TS U1141 ( .A0(n979), .A1(intDY_EWSW[10]), .B0(n934), .B1(
        intDY_EWSW[2]), .Y(n741) );
  AOI22X1TS U1142 ( .A0(n397), .A1(intDY_EWSW[9]), .B0(n982), .B1(
        intDY_EWSW[11]), .Y(n742) );
  OAI221XLTS U1143 ( .A0(n397), .A1(intDY_EWSW[9]), .B0(n982), .B1(
        intDY_EWSW[11]), .C0(n742), .Y(n743) );
  NOR4X1TS U1144 ( .A(n746), .B(n745), .C(n744), .D(n743), .Y(n774) );
  AOI22X1TS U1145 ( .A0(n993), .A1(intDY_EWSW[7]), .B0(n984), .B1(
        intDY_EWSW[14]), .Y(n747) );
  AOI22X1TS U1146 ( .A0(n992), .A1(intDY_EWSW[5]), .B0(n935), .B1(
        intDY_EWSW[4]), .Y(n748) );
  OAI221XLTS U1147 ( .A0(n992), .A1(intDY_EWSW[5]), .B0(n935), .B1(
        intDY_EWSW[4]), .C0(n748), .Y(n753) );
  AOI22X1TS U1148 ( .A0(n932), .A1(intDY_EWSW[3]), .B0(n986), .B1(
        intDY_EWSW[26]), .Y(n749) );
  AOI22X1TS U1149 ( .A0(n978), .A1(intDY_EWSW[1]), .B0(n938), .B1(
        intDY_EWSW[0]), .Y(n750) );
  OAI221XLTS U1150 ( .A0(n978), .A1(intDY_EWSW[1]), .B0(n938), .B1(
        intDY_EWSW[0]), .C0(n750), .Y(n751) );
  NOR4X1TS U1151 ( .A(n754), .B(n753), .C(n752), .D(n751), .Y(n773) );
  AOI22X1TS U1152 ( .A0(n900), .A1(intDY_EWSW[28]), .B0(n936), .B1(
        intDY_EWSW[6]), .Y(n755) );
  AOI22X1TS U1153 ( .A0(n928), .A1(intDY_EWSW[18]), .B0(n989), .B1(
        intDY_EWSW[29]), .Y(n756) );
  OAI221XLTS U1154 ( .A0(n928), .A1(intDY_EWSW[18]), .B0(n989), .B1(
        intDY_EWSW[29]), .C0(n756), .Y(n761) );
  AOI22X1TS U1155 ( .A0(n931), .A1(intDY_EWSW[27]), .B0(n985), .B1(
        intDY_EWSW[19]), .Y(n757) );
  AOI22X1TS U1156 ( .A0(n981), .A1(intDY_EWSW[25]), .B0(n937), .B1(
        intDY_EWSW[24]), .Y(n758) );
  OAI221XLTS U1157 ( .A0(n981), .A1(intDY_EWSW[25]), .B0(n937), .B1(
        intDY_EWSW[24]), .C0(n758), .Y(n759) );
  NOR4X1TS U1158 ( .A(n762), .B(n761), .C(n760), .D(n759), .Y(n772) );
  AOI22X1TS U1159 ( .A0(n929), .A1(intDY_EWSW[20]), .B0(n990), .B1(
        intDY_EWSW[30]), .Y(n763) );
  AOI22X1TS U1160 ( .A0(n396), .A1(intDY_EWSW[8]), .B0(n988), .B1(
        intDY_EWSW[21]), .Y(n764) );
  OAI221XLTS U1161 ( .A0(n396), .A1(intDY_EWSW[8]), .B0(n988), .B1(
        intDY_EWSW[21]), .C0(n764), .Y(n769) );
  AOI22X1TS U1162 ( .A0(n980), .A1(intDY_EWSW[17]), .B0(n991), .B1(
        intDY_EWSW[16]), .Y(n765) );
  AOI22X1TS U1163 ( .A0(n930), .A1(intDY_EWSW[22]), .B0(n983), .B1(
        intDY_EWSW[12]), .Y(n766) );
  OAI221XLTS U1164 ( .A0(n930), .A1(intDY_EWSW[22]), .B0(n983), .B1(
        intDY_EWSW[12]), .C0(n766), .Y(n767) );
  NOR4X1TS U1165 ( .A(n770), .B(n769), .C(n768), .D(n767), .Y(n771) );
  NAND4XLTS U1166 ( .A(n774), .B(n773), .C(n772), .D(n771), .Y(n841) );
  NOR2BX1TS U1167 ( .AN(OP_FLAG_INIT), .B(n841), .Y(ZERO_FLAG_INIT) );
  NOR2BX1TS U1168 ( .AN(Shift_reg_FLAGS_7[3]), .B(Shift_reg_FLAGS_7[0]), .Y(
        n_21_net_) );
  AOI21X1TS U1169 ( .A0(n775), .A1(n405), .B0(n855), .Y(ADD_OVRFLW_SGF) );
  NOR2X1TS U1170 ( .A(n1023), .B(intDX_EWSW[25]), .Y(n835) );
  NOR2XLTS U1171 ( .A(n835), .B(intDY_EWSW[24]), .Y(n776) );
  AOI22X1TS U1172 ( .A0(intDX_EWSW[25]), .A1(n1023), .B0(intDX_EWSW[24]), .B1(
        n776), .Y(n780) );
  NAND2BXLTS U1173 ( .AN(intDX_EWSW[27]), .B(intDY_EWSW[27]), .Y(n777) );
  OAI21X1TS U1174 ( .A0(intDX_EWSW[26]), .A1(n1028), .B0(n777), .Y(n836) );
  NAND3XLTS U1175 ( .A(n1028), .B(n777), .C(intDX_EWSW[26]), .Y(n779) );
  NAND2BXLTS U1176 ( .AN(intDY_EWSW[27]), .B(intDX_EWSW[27]), .Y(n778) );
  OAI211XLTS U1177 ( .A0(n780), .A1(n836), .B0(n779), .C0(n778), .Y(n785) );
  NOR2X1TS U1178 ( .A(n927), .B(intDX_EWSW[30]), .Y(n783) );
  NOR2X1TS U1179 ( .A(n973), .B(intDX_EWSW[29]), .Y(n781) );
  AOI211X1TS U1180 ( .A0(intDY_EWSW[28]), .A1(n900), .B0(n783), .C0(n781), .Y(
        n834) );
  AOI2BB2X1TS U1181 ( .B0(n785), .B1(n834), .A0N(n784), .A1N(n783), .Y(n840)
         );
  NOR2X1TS U1182 ( .A(n1021), .B(intDX_EWSW[17]), .Y(n821) );
  NOR2X1TS U1183 ( .A(n1024), .B(intDX_EWSW[11]), .Y(n800) );
  AOI21X1TS U1184 ( .A0(intDY_EWSW[10]), .A1(n979), .B0(n800), .Y(n805) );
  OAI211XLTS U1185 ( .A0(intDX_EWSW[8]), .A1(n1020), .B0(n802), .C0(n805), .Y(
        n816) );
  OAI2BB1X1TS U1186 ( .A0N(n992), .A1N(intDY_EWSW[5]), .B0(intDX_EWSW[4]), .Y(
        n786) );
  OAI22X1TS U1187 ( .A0(intDY_EWSW[4]), .A1(n786), .B0(n992), .B1(
        intDY_EWSW[5]), .Y(n797) );
  OAI2BB1X1TS U1188 ( .A0N(n993), .A1N(intDY_EWSW[7]), .B0(intDX_EWSW[6]), .Y(
        n787) );
  OAI22X1TS U1189 ( .A0(intDY_EWSW[6]), .A1(n787), .B0(n993), .B1(
        intDY_EWSW[7]), .Y(n796) );
  OAI2BB2XLTS U1190 ( .B0(intDY_EWSW[0]), .B1(n788), .A0N(intDX_EWSW[1]), 
        .A1N(n1025), .Y(n790) );
  NAND2BXLTS U1191 ( .AN(intDX_EWSW[2]), .B(intDY_EWSW[2]), .Y(n789) );
  OAI211XLTS U1192 ( .A0(n1026), .A1(intDX_EWSW[3]), .B0(n790), .C0(n789), .Y(
        n793) );
  OAI21XLTS U1193 ( .A0(intDX_EWSW[3]), .A1(n1026), .B0(intDX_EWSW[2]), .Y(
        n791) );
  AOI2BB2XLTS U1194 ( .B0(intDX_EWSW[3]), .B1(n1026), .A0N(intDY_EWSW[2]), 
        .A1N(n791), .Y(n792) );
  AOI222X1TS U1195 ( .A0(intDY_EWSW[4]), .A1(n935), .B0(n793), .B1(n792), .C0(
        intDY_EWSW[5]), .C1(n992), .Y(n795) );
  AOI22X1TS U1196 ( .A0(intDY_EWSW[7]), .A1(n993), .B0(intDY_EWSW[6]), .B1(
        n936), .Y(n794) );
  OAI32X1TS U1197 ( .A0(n797), .A1(n796), .A2(n795), .B0(n794), .B1(n796), .Y(
        n815) );
  OA22X1TS U1198 ( .A0(n945), .A1(intDX_EWSW[14]), .B0(n1027), .B1(
        intDX_EWSW[15]), .Y(n812) );
  NAND2BXLTS U1199 ( .AN(intDX_EWSW[13]), .B(intDY_EWSW[13]), .Y(n798) );
  OAI21XLTS U1200 ( .A0(intDX_EWSW[13]), .A1(n1012), .B0(intDX_EWSW[12]), .Y(
        n799) );
  OAI2BB2XLTS U1201 ( .B0(intDY_EWSW[12]), .B1(n799), .A0N(intDX_EWSW[13]), 
        .A1N(n1012), .Y(n811) );
  NOR2XLTS U1202 ( .A(n800), .B(intDY_EWSW[10]), .Y(n801) );
  AOI22X1TS U1203 ( .A0(intDX_EWSW[11]), .A1(n1024), .B0(intDX_EWSW[10]), .B1(
        n801), .Y(n807) );
  NAND2BXLTS U1204 ( .AN(intDY_EWSW[9]), .B(intDX_EWSW[9]), .Y(n804) );
  NAND3XLTS U1205 ( .A(n1020), .B(n802), .C(intDX_EWSW[8]), .Y(n803) );
  AOI21X1TS U1206 ( .A0(n804), .A1(n803), .B0(n814), .Y(n806) );
  OAI2BB2XLTS U1207 ( .B0(n807), .B1(n814), .A0N(n806), .A1N(n805), .Y(n810)
         );
  OAI2BB2XLTS U1208 ( .B0(intDY_EWSW[14]), .B1(n808), .A0N(intDX_EWSW[15]), 
        .A1N(n1027), .Y(n809) );
  AOI211X1TS U1209 ( .A0(n812), .A1(n811), .B0(n810), .C0(n809), .Y(n813) );
  OAI31X1TS U1210 ( .A0(n816), .A1(n815), .A2(n814), .B0(n813), .Y(n819) );
  OA22X1TS U1211 ( .A0(n1016), .A1(intDX_EWSW[22]), .B0(n942), .B1(
        intDX_EWSW[23]), .Y(n832) );
  NAND2BXLTS U1212 ( .AN(intDX_EWSW[21]), .B(intDY_EWSW[21]), .Y(n817) );
  NAND2BXLTS U1213 ( .AN(intDX_EWSW[19]), .B(intDY_EWSW[19]), .Y(n823) );
  OAI21X1TS U1214 ( .A0(intDX_EWSW[18]), .A1(n1022), .B0(n823), .Y(n827) );
  NAND3BXLTS U1215 ( .AN(n821), .B(n819), .C(n818), .Y(n839) );
  OAI2BB2XLTS U1216 ( .B0(intDY_EWSW[20]), .B1(n820), .A0N(intDX_EWSW[21]), 
        .A1N(n1013), .Y(n831) );
  AOI22X1TS U1217 ( .A0(intDX_EWSW[17]), .A1(n1021), .B0(intDX_EWSW[16]), .B1(
        n822), .Y(n825) );
  AOI32X1TS U1218 ( .A0(n1022), .A1(n823), .A2(intDX_EWSW[18]), .B0(
        intDX_EWSW[19]), .B1(n944), .Y(n824) );
  OAI32X1TS U1219 ( .A0(n827), .A1(n826), .A2(n825), .B0(n824), .B1(n826), .Y(
        n830) );
  OAI21XLTS U1220 ( .A0(intDX_EWSW[23]), .A1(n942), .B0(intDX_EWSW[22]), .Y(
        n828) );
  OAI2BB2XLTS U1221 ( .B0(intDY_EWSW[22]), .B1(n828), .A0N(intDX_EWSW[23]), 
        .A1N(n942), .Y(n829) );
  AOI211X1TS U1222 ( .A0(n832), .A1(n831), .B0(n830), .C0(n829), .Y(n838) );
  NAND2BXLTS U1223 ( .AN(intDX_EWSW[24]), .B(intDY_EWSW[24]), .Y(n833) );
  NAND4BBX1TS U1224 ( .AN(n836), .BN(n835), .C(n834), .D(n833), .Y(n837) );
  AOI21X1TS U1225 ( .A0(n841), .A1(n902), .B0(intDX_EWSW[31]), .Y(n842) );
  AOI21X1TS U1226 ( .A0(n1066), .A1(n897), .B0(n842), .Y(SIGN_FLAG_INIT) );
  NAND2X1TS U1227 ( .A(N59), .B(n855), .Y(n843) );
  XNOR2X1TS U1228 ( .A(n843), .B(N60), .Y(Raw_mant_SGF[1]) );
  OAI21XLTS U1229 ( .A0(DMP_SFG[0]), .A1(DmP_mant_SFG_SWR[2]), .B0(n844), .Y(
        n847) );
  NAND2X1TS U1230 ( .A(n845), .B(n855), .Y(n846) );
  XOR2XLTS U1231 ( .A(n847), .B(n846), .Y(Raw_mant_SGF[2]) );
  AOI22X1TS U1232 ( .A0(n855), .A1(n849), .B0(n848), .B1(n1065), .Y(n852) );
  OAI21XLTS U1233 ( .A0(DmP_mant_SFG_SWR[9]), .A1(n917), .B0(n850), .Y(n851)
         );
  XOR2XLTS U1234 ( .A(n852), .B(n851), .Y(Raw_mant_SGF[9]) );
  AOI22X1TS U1235 ( .A0(n855), .A1(n854), .B0(n853), .B1(n1065), .Y(n858) );
  OAI21XLTS U1236 ( .A0(DmP_mant_SFG_SWR[11]), .A1(n918), .B0(n856), .Y(n857)
         );
  XOR2XLTS U1237 ( .A(n858), .B(n857), .Y(Raw_mant_SGF[11]) );
  AOI22X1TS U1238 ( .A0(n407), .A1(n860), .B0(n859), .B1(n1065), .Y(n863) );
  OAI21XLTS U1239 ( .A0(DmP_mant_SFG_SWR[13]), .A1(n919), .B0(n861), .Y(n862)
         );
  XOR2XLTS U1240 ( .A(n863), .B(n862), .Y(Raw_mant_SGF[13]) );
  AOI22X1TS U1241 ( .A0(n407), .A1(n865), .B0(n864), .B1(n1065), .Y(n868) );
  OAI21XLTS U1242 ( .A0(DmP_mant_SFG_SWR[15]), .A1(n921), .B0(n866), .Y(n867)
         );
  XOR2XLTS U1243 ( .A(n868), .B(n867), .Y(Raw_mant_SGF[15]) );
  AOI22X1TS U1244 ( .A0(n407), .A1(n870), .B0(n869), .B1(n1065), .Y(n873) );
  OAI21XLTS U1245 ( .A0(DmP_mant_SFG_SWR[17]), .A1(n922), .B0(n871), .Y(n872)
         );
  AOI22X1TS U1246 ( .A0(n407), .A1(n875), .B0(n874), .B1(n890), .Y(n878) );
  OAI21XLTS U1247 ( .A0(DmP_mant_SFG_SWR[19]), .A1(n925), .B0(n876), .Y(n877)
         );
  AOI22X1TS U1248 ( .A0(n407), .A1(n880), .B0(n879), .B1(n1065), .Y(n883) );
  OAI21XLTS U1249 ( .A0(DmP_mant_SFG_SWR[21]), .A1(n926), .B0(n881), .Y(n882)
         );
  AOI22X1TS U1250 ( .A0(n407), .A1(n885), .B0(n884), .B1(n1065), .Y(n888) );
  OAI21XLTS U1251 ( .A0(DmP_mant_SFG_SWR[23]), .A1(n939), .B0(n886), .Y(n887)
         );
  AOI21X1TS U1252 ( .A0(DmP_mant_SFG_SWR[24]), .A1(n1001), .B0(n889), .Y(n894)
         );
  AOI22X1TS U1253 ( .A0(n407), .A1(n892), .B0(n891), .B1(n890), .Y(n893) );
  CLKBUFX3TS U1254 ( .A(n895), .Y(n896) );
  AOI22X1TS U1255 ( .A0(n896), .A1(n1029), .B0(n938), .B1(n902), .Y(
        DmP_INIT_EWSW[0]) );
  AOI22X1TS U1256 ( .A0(n896), .A1(n1025), .B0(n978), .B1(n902), .Y(
        DmP_INIT_EWSW[1]) );
  AOI22X1TS U1257 ( .A0(n896), .A1(n1014), .B0(n934), .B1(n902), .Y(
        DmP_INIT_EWSW[2]) );
  AOI22X1TS U1258 ( .A0(n896), .A1(n1026), .B0(n932), .B1(n901), .Y(
        DmP_INIT_EWSW[3]) );
  AOI22X1TS U1259 ( .A0(n896), .A1(n1009), .B0(n935), .B1(n897), .Y(
        DmP_INIT_EWSW[4]) );
  AOI22X1TS U1260 ( .A0(n896), .A1(n1005), .B0(n992), .B1(n898), .Y(
        DmP_INIT_EWSW[5]) );
  AOI22X1TS U1261 ( .A0(n896), .A1(n1007), .B0(n936), .B1(n898), .Y(
        DmP_INIT_EWSW[6]) );
  AOI22X1TS U1262 ( .A0(n896), .A1(n1004), .B0(n993), .B1(n897), .Y(
        DmP_INIT_EWSW[7]) );
  AOI22X1TS U1263 ( .A0(n896), .A1(n1020), .B0(n396), .B1(n898), .Y(
        DmP_INIT_EWSW[8]) );
  AOI22X1TS U1264 ( .A0(n896), .A1(n1017), .B0(n397), .B1(n901), .Y(
        DmP_INIT_EWSW[9]) );
  AOI22X1TS U1265 ( .A0(n895), .A1(n1010), .B0(n979), .B1(n898), .Y(
        DmP_INIT_EWSW[10]) );
  AOI22X1TS U1266 ( .A0(n895), .A1(n1024), .B0(n982), .B1(n897), .Y(
        DmP_INIT_EWSW[11]) );
  AOI22X1TS U1267 ( .A0(n895), .A1(n1019), .B0(n983), .B1(n901), .Y(
        DmP_INIT_EWSW[12]) );
  AOI22X1TS U1268 ( .A0(n895), .A1(n1012), .B0(n987), .B1(n901), .Y(
        DmP_INIT_EWSW[13]) );
  AOI22X1TS U1269 ( .A0(n895), .A1(n945), .B0(n984), .B1(n897), .Y(
        DmP_INIT_EWSW[14]) );
  AOI22X1TS U1270 ( .A0(n895), .A1(n1027), .B0(n933), .B1(n897), .Y(
        DmP_INIT_EWSW[15]) );
  AOI22X1TS U1271 ( .A0(n895), .A1(n1008), .B0(n991), .B1(n898), .Y(
        DmP_INIT_EWSW[16]) );
  AOI22X1TS U1272 ( .A0(n895), .A1(n1021), .B0(n980), .B1(n898), .Y(
        DmP_INIT_EWSW[17]) );
  AOI22X1TS U1273 ( .A0(n895), .A1(n1022), .B0(n928), .B1(n897), .Y(
        DmP_INIT_EWSW[18]) );
  AOI22X1TS U1274 ( .A0(n895), .A1(n944), .B0(n985), .B1(n901), .Y(
        DmP_INIT_EWSW[19]) );
  BUFX4TS U1275 ( .A(n895), .Y(n899) );
  AOI22X1TS U1276 ( .A0(n393), .A1(n1015), .B0(n929), .B1(n901), .Y(
        DmP_INIT_EWSW[20]) );
  AOI22X1TS U1277 ( .A0(n393), .A1(n1013), .B0(n988), .B1(n898), .Y(
        DmP_INIT_EWSW[21]) );
  AOI22X1TS U1278 ( .A0(n393), .A1(n1016), .B0(n930), .B1(n901), .Y(
        DmP_INIT_EWSW[22]) );
  AOI22X1TS U1279 ( .A0(n393), .A1(n942), .B0(n994), .B1(n897), .Y(
        DmP_INIT_EWSW[23]) );
  AOI22X1TS U1280 ( .A0(n393), .A1(n1011), .B0(n937), .B1(n898), .Y(
        DmP_INIT_EWSW[24]) );
  AOI22X1TS U1281 ( .A0(n393), .A1(n1023), .B0(n981), .B1(n901), .Y(
        DmP_INIT_EWSW[25]) );
  AOI22X1TS U1282 ( .A0(n393), .A1(n1028), .B0(n986), .B1(n897), .Y(
        DmP_INIT_EWSW[26]) );
  AOI22X1TS U1283 ( .A0(n393), .A1(n1018), .B0(n931), .B1(n898), .Y(
        DmP_INIT_EWSW[27]) );
  AOI22X1TS U1284 ( .A0(n393), .A1(n938), .B0(n1029), .B1(n897), .Y(
        DMP_INIT_EWSW[0]) );
  AOI22X1TS U1285 ( .A0(n393), .A1(n978), .B0(n1025), .B1(n901), .Y(
        DMP_INIT_EWSW[1]) );
  AOI22X1TS U1286 ( .A0(n393), .A1(n934), .B0(n1014), .B1(n898), .Y(
        DMP_INIT_EWSW[2]) );
  AOI22X1TS U1287 ( .A0(n393), .A1(n932), .B0(n1026), .B1(n898), .Y(
        DMP_INIT_EWSW[3]) );
  AOI22X1TS U1288 ( .A0(n393), .A1(n935), .B0(n1009), .B1(n898), .Y(
        DMP_INIT_EWSW[4]) );
  AOI22X1TS U1289 ( .A0(n393), .A1(n992), .B0(n1005), .B1(n898), .Y(
        DMP_INIT_EWSW[5]) );
  AOI22X1TS U1290 ( .A0(n393), .A1(n936), .B0(n1007), .B1(n898), .Y(
        DMP_INIT_EWSW[6]) );
  AOI22X1TS U1291 ( .A0(n393), .A1(n993), .B0(n1004), .B1(n901), .Y(
        DMP_INIT_EWSW[7]) );
  AOI22X1TS U1292 ( .A0(n393), .A1(n396), .B0(n1020), .B1(n897), .Y(
        DMP_INIT_EWSW[8]) );
  AOI22X1TS U1293 ( .A0(n393), .A1(n397), .B0(n1017), .B1(n898), .Y(
        DMP_INIT_EWSW[9]) );
  AOI22X1TS U1294 ( .A0(n393), .A1(n979), .B0(n1010), .B1(n901), .Y(
        DMP_INIT_EWSW[10]) );
  AOI22X1TS U1295 ( .A0(n393), .A1(n982), .B0(n1024), .B1(n897), .Y(
        DMP_INIT_EWSW[11]) );
  AOI22X1TS U1296 ( .A0(n899), .A1(n983), .B0(n1019), .B1(n898), .Y(
        DMP_INIT_EWSW[12]) );
  AOI22X1TS U1297 ( .A0(n899), .A1(n987), .B0(n1012), .B1(n901), .Y(
        DMP_INIT_EWSW[13]) );
  AOI22X1TS U1298 ( .A0(n899), .A1(n984), .B0(n945), .B1(n897), .Y(
        DMP_INIT_EWSW[14]) );
  AOI22X1TS U1299 ( .A0(n899), .A1(n933), .B0(n1027), .B1(n897), .Y(
        DMP_INIT_EWSW[15]) );
  AOI22X1TS U1300 ( .A0(n899), .A1(n991), .B0(n1008), .B1(n898), .Y(
        DMP_INIT_EWSW[16]) );
  AOI22X1TS U1301 ( .A0(n899), .A1(n980), .B0(n1021), .B1(n901), .Y(
        DMP_INIT_EWSW[17]) );
  AOI22X1TS U1302 ( .A0(n899), .A1(n928), .B0(n1022), .B1(n898), .Y(
        DMP_INIT_EWSW[18]) );
  AOI22X1TS U1303 ( .A0(n899), .A1(n985), .B0(n944), .B1(n901), .Y(
        DMP_INIT_EWSW[19]) );
  AOI22X1TS U1304 ( .A0(n899), .A1(n929), .B0(n1015), .B1(n898), .Y(
        DMP_INIT_EWSW[20]) );
  AOI22X1TS U1305 ( .A0(n899), .A1(n988), .B0(n1013), .B1(n901), .Y(
        DMP_INIT_EWSW[21]) );
  AOI22X1TS U1306 ( .A0(n899), .A1(n930), .B0(n1016), .B1(n901), .Y(
        DMP_INIT_EWSW[22]) );
  AOI22X1TS U1307 ( .A0(n899), .A1(n994), .B0(n942), .B1(n898), .Y(
        DMP_INIT_EWSW[23]) );
  AOI22X1TS U1308 ( .A0(n899), .A1(n937), .B0(n1011), .B1(n901), .Y(
        DMP_INIT_EWSW[24]) );
  AOI22X1TS U1309 ( .A0(n899), .A1(n981), .B0(n1023), .B1(n897), .Y(
        DMP_INIT_EWSW[25]) );
  AOI22X1TS U1310 ( .A0(n899), .A1(n986), .B0(n1028), .B1(n897), .Y(
        DMP_INIT_EWSW[26]) );
  AOI22X1TS U1311 ( .A0(n899), .A1(n931), .B0(n1018), .B1(n897), .Y(
        DMP_INIT_EWSW[27]) );
  OAI2BB2XLTS U1312 ( .B0(n902), .B1(n900), .A0N(n902), .A1N(intDY_EWSW[28]), 
        .Y(DMP_INIT_EWSW[28]) );
  OAI2BB2XLTS U1313 ( .B0(n902), .B1(n989), .A0N(n902), .A1N(intDY_EWSW[29]), 
        .Y(DMP_INIT_EWSW[29]) );
  OAI2BB2XLTS U1314 ( .B0(n902), .B1(n990), .A0N(n902), .A1N(intDY_EWSW[30]), 
        .Y(DMP_INIT_EWSW[30]) );
  OAI22X1TS U1315 ( .A0(n903), .A1(n399), .B0(n906), .B1(n904), .Y(
        Data_array_SWR[24]) );
  OAI222X1TS U1316 ( .A0(n583), .A1(n906), .B0(n399), .B1(n905), .C0(n904), 
        .C1(n903), .Y(Data_array_SWR[23]) );
  CLKAND2X2TS U1317 ( .A(n402), .B(sftr_odat_SHT2_SWR[6]), .Y(
        formatted_number_W[4]) );
  CLKAND2X2TS U1318 ( .A(n402), .B(sftr_odat_SHT2_SWR[7]), .Y(
        formatted_number_W[5]) );
  CLKAND2X2TS U1319 ( .A(n402), .B(sftr_odat_SHT2_SWR[18]), .Y(
        formatted_number_W[16]) );
  CLKAND2X2TS U1320 ( .A(n402), .B(sftr_odat_SHT2_SWR[19]), .Y(
        formatted_number_W[17]) );
  INVX2TS U1322 ( .A(n908), .Y(n911) );
  AOI22X1TS U1323 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n943), .B0(
        beg_OP), .B1(n913), .Y(n910) );
  OAI22X1TS U1324 ( .A0(n911), .A1(n910), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B1(n909), .Y(n389) );
  NAND2BXLTS U1325 ( .AN(busy), .B(n912), .Y(n_7_net_) );
initial $sdf_annotate("FPU_PIPELINED_FPADDSUB_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule

