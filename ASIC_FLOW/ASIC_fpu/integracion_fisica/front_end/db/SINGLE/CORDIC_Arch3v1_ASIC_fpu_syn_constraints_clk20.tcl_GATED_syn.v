/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:02:09 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4_32 ( CLK, EN, ENCLK, TE
 );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_21 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_23 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_24 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_26 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_27 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_29 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_32 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


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
  wire   enab_d_ff4_Zn, enab_d_ff_RB1, enab_RB3, enab_d_ff5_data_out,
         d_ff1_operation_out, d_ff1_shift_region_flag_out_0_, d_ff3_sign_out,
         enab_d_ff4_Yn, enab_d_ff4_Xn, fmtted_Result_31_, ITER_CONT_net3608262,
         ITER_CONT_N5, ITER_CONT_N4, ITER_CONT_N3, d_ff5_data_out_net3608226,
         reg_Z0_net3608226, reg_val_muxZ_2stage_net3608226,
         reg_shift_y_net3608226, d_ff4_Xn_net3608226, d_ff4_Yn_net3608226,
         d_ff4_Zn_net3608226, n154, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n531, n532, n533, n534, n535, n536,
         n537, intadd_421_CI, intadd_421_n3, intadd_421_n2, intadd_421_n1,
         intadd_422_CI, intadd_422_n3, intadd_422_n2, intadd_422_n1, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n723, n724, n725,
         n726, n727, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795;
  wire   [3:0] cont_iter_out;
  wire   [1:0] cont_var_out;
  wire   [31:0] d_ff1_Z;
  wire   [31:0] d_ff_Xn;
  wire   [31:0] first_mux_X;
  wire   [31:0] d_ff_Yn;
  wire   [31:0] first_mux_Y;
  wire   [31:0] d_ff_Zn;
  wire   [31:0] first_mux_Z;
  wire   [31:0] d_ff2_X;
  wire   [31:0] d_ff2_Y;
  wire   [31:0] d_ff2_Z;
  wire   [7:0] sh_exp_x;
  wire   [7:0] sh_exp_y;
  wire   [25:4] data_out_LUT;
  wire   [31:0] d_ff3_sh_x_out;
  wire   [31:0] d_ff3_sh_y_out;
  wire   [27:0] d_ff3_LUT_out;
  wire   [30:0] mux_sal;
  wire   [7:0] inst_CORDIC_FSM_v3_state_next;
  wire   [7:0] inst_CORDIC_FSM_v3_state_reg;

  SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4_32 ITER_CONT_clk_gate_temp_reg ( 
        .CLK(clk), .EN(enab_cont_iter), .ENCLK(ITER_CONT_net3608262), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_21 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3608226), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_32 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff_RB1), .ENCLK(reg_Z0_net3608226), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_29 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(n612), .ENCLK(reg_val_muxZ_2stage_net3608226), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_27 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_RB3), .ENCLK(reg_shift_y_net3608226), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_26 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3608226), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_24 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3608226), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_23 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3608226), .TE(1'b0) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3608226), .RN(n793), .Q(d_ff1_shift_region_flag_out_0_), 
        .QN(n615) );
  DFFRXLTS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3608226), .RN(n793), .QN(n606) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(n524), .CK(reg_shift_y_net3608226), .RN(n788), 
        .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n534), .CK(reg_shift_y_net3608226), .RN(n789), 
        .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n528), .CK(reg_shift_y_net3608226), .RN(n789), 
        .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n536), .CK(reg_shift_y_net3608226), .RN(n788), 
        .Q(d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(data_out_LUT[4]), .CK(reg_shift_y_net3608226), 
        .RN(n793), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(n525), .CK(reg_shift_y_net3608226), .RN(n787), 
        .Q(d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(n527), .CK(reg_shift_y_net3608226), .RN(n792), 
        .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n531), .CK(reg_shift_y_net3608226), .RN(n793), 
        .Q(d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n761), .CK(reg_shift_y_net3608226), .RN(n793), 
        .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n533), .CK(reg_shift_y_net3608226), .RN(n788), 
        .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n526), .CK(reg_shift_y_net3608226), .RN(n793), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n532), .CK(reg_shift_y_net3608226), .RN(n787), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n523), .CK(reg_shift_y_net3608226), .RN(n785), .Q(d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n535), .CK(reg_shift_y_net3608226), .RN(n792), .Q(d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n537), .CK(reg_shift_y_net3608226), .RN(n789), .Q(d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n522), .CK(reg_shift_y_net3608226), .RN(n789), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n521), .CK(reg_shift_y_net3608226), .RN(n788), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n520), .CK(reg_shift_y_net3608226), .RN(n789), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3608226), .RN(n622), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n529), .CK(reg_shift_y_net3608226), .RN(n794), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3608226), .RN(n622), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3608226), .RN(n786), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3608226), .RN(n784), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3608226), .RN(n783), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3608226), .RN(n791), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3608226), .RN(n794), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3608226), .RN(n622), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3608226), .RN(n786), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3608226), .RN(n784), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3608226), .RN(n783), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3608226), .RN(
        n790), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3608226), .RN(
        n788), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3608226), .RN(
        n789), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3608226), .RN(
        n787), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3608226), .RN(
        n785), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3608226), .RN(
        n792), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3608226), .RN(
        n790), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3608226), .RN(
        n789), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3608226), .RN(
        n788), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3608226), .RN(
        n790), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3608226), .RN(
        n787), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3608226), .RN(
        n785), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3608226), .RN(
        n790), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3608226), .RN(
        n787), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3608226), .RN(
        n785), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3608226), .RN(
        n792), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3608226), .RN(
        n789), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3608226), .RN(
        n790), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3608226), .RN(
        n788), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3608226), .RN(
        n793), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3608226), .RN(
        n787), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3608226), .RN(
        n785), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3608226), .RN(n792), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3608226), .RN(n790), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3608226), .RN(n785), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3608226), .RN(n792), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3608226), .RN(n790), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3608226), .RN(n790), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3608226), .RN(n788), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3608226), .RN(n789), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3608226), .RN(n787), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3608226), .RN(n785), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3608226), .RN(n792), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3608226), .RN(n793), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3608226), .RN(n793), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3608226), .RN(n793), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3608226), .RN(n788), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3608226), .RN(n793), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3608226), .RN(n787), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n785), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3608226), 
        .RN(n792), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3608226), .RN(n789), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n793), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3608226), 
        .RN(n788), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3608226), .RN(n789), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n787), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3608226), 
        .RN(n785), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3608226), .RN(n792), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n786), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3608226), 
        .RN(n784), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3608226), .RN(n783), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n791), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3608226), 
        .RN(n794), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3608226), .RN(n786), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n784), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3608226), 
        .RN(n783), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3608226), .RN(n791), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n794), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3608226), 
        .RN(n786), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3608226), .RN(n784), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n787), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3608226), 
        .RN(n785), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3608226), .RN(n792), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n790), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3608226), 
        .RN(n790), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3608226), .RN(n788), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n790), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3608226), 
        .RN(n787), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3608226), .RN(n785), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n792), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3608226), .RN(n793), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3608226), .RN(n793), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n791), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3608226), .RN(n794), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3608226), .RN(n786), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n784), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3608226), .RN(n783), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3608226), .RN(n791), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n794), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3608226), .RN(n786), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3608226), .RN(n784), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n783), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3608226), .RN(n791), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3608226), .RN(n794), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n791), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3608226), .RN(n794), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3608226), .RN(n622), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n786), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3608226), .RN(n784), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3608226), .RN(n783), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n791), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3608226), .RN(n794), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3608226), .RN(n622), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n786), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3608226), .RN(n784), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3608226), .RN(n783), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n622), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3608226), .RN(n775), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3608226), .RN(n604), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n792), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3608226), .RN(n780), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3608226), .RN(n779), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n775), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3608226), .RN(n604), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3608226), .RN(n776), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n792), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3608226), .RN(n770), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3608226), .RN(n775), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n777), .Q(d_ff2_X[23]), .QN(n616)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3608226), .RN(n780), .Q(d_ff_Xn[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3608226), .RN(n781), .Q(d_ff_Xn[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3608226), .RN(n776), .Q(d_ff_Xn[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3608226), .RN(n780), .Q(d_ff_Xn[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3608226), .RN(n781), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n777), .Q(d_ff2_X[28]), .QN(n768)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3608226), .RN(n777), .Q(d_ff_Xn[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3608226), .RN(n779), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n780), .Q(d_ff2_X[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3608226), .RN(n781), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n782), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3608226), .RN(n782), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3608226), .RN(n778), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n776), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3608226), 
        .RN(n779), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3608226), .RN(n780), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n781), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3608226), 
        .RN(n773), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3608226), .RN(n771), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n621), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3608226), 
        .RN(n775), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3608226), .RN(n154), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n774), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3608226), 
        .RN(n771), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3608226), .RN(n773), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n621), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3608226), 
        .RN(n777), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3608226), .RN(n779), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n780), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3608226), 
        .RN(n781), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3608226), .RN(n777), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n777), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3608226), 
        .RN(n778), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3608226), .RN(n782), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n779), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3608226), 
        .RN(n782), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3608226), .RN(n778), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n777), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3608226), 
        .RN(n782), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3608226), .RN(n780), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n781), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3608226), 
        .RN(n776), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3608226), .RN(n776), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n778), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3608226), .RN(n781), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3608226), .RN(n777), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n777), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3608226), .RN(n778), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3608226), .RN(n777), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n779), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3608226), .RN(n780), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3608226), .RN(n781), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n782), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3608226), .RN(n779), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3608226), .RN(n780), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n781), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3608226), .RN(n782), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3608226), .RN(n782), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n778), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3608226), .RN(n782), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3608226), .RN(n779), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n780), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3608226), .RN(n787), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3608226), .RN(n774), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n621), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3608226), .RN(n775), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3608226), .RN(n621), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n780), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3608226), .RN(n777), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3608226), .RN(n781), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n621), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3608226), .RN(n778), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3608226), .RN(n782), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n779), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3608226), .RN(n780), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3608226), .RN(n781), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n777), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3608226), .RN(n782), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3608226), .RN(n778), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n776), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3608226), .RN(n780), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3608226), .RN(n621), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n775), .Q(d_ff2_Y[23]), .QN(n767)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3608226), .RN(n782), .Q(d_ff_Yn[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3608226), .RN(n787), .Q(d_ff_Yn[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3608226), .RN(n781), .Q(d_ff_Yn[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3608226), .RN(n775), .Q(d_ff_Yn[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3608226), .RN(n778), .Q(d_ff_Yn[28]) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3608226), .RN(n778), .Q(d_ff_Yn[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3608226), .RN(n787), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n774), .Q(d_ff2_Y[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3608226), .RN(n774), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n774), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3608226), .RN(n774), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3608226), .RN(n774), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n774), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3608226), .RN(n774), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n774), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3608226), .RN(n774), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n774), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3608226), .RN(n773), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n773), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3608226), .RN(n773), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n773), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3608226), .RN(n773), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n773), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3608226), .RN(n773), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n773), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3608226), .RN(n773), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n773), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3608226), .RN(n773), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n773), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3608226), .RN(n772), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n795), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3608226), .RN(n770), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n772), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3608226), .RN(n795), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n770), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3608226), .RN(n772), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n795), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3608226), .RN(n770), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n772), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3608226), .RN(n795), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n770), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3608226), .RN(n771), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n771), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3608226), .RN(n771), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n771), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3608226), .RN(n771), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n771), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3608226), .RN(n771), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n771), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3608226), .RN(n771), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n771), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3608226), .RN(n771), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n771), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3608226), .RN(n772), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n795), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3608226), .RN(n770), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n604), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3608226), .RN(n154), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n154), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3608226), .RN(n154), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n154), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3608226), .RN(n154), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n604), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3608226), .RN(n604), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n772), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3608226), .RN(n795), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n770), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3608226), .RN(n772), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n795), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3608226), .RN(n770), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n772), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3608226), .RN(n795), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n770), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3608226), .RN(n772), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n795), .Q(d_ff2_Z[31]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(1'b1), .CK(reg_shift_y_net3608226), .RN(n770), .Q(d_ff3_LUT_out[27]) );
  DFFRX1TS VAR_CONT_temp_reg_1_ ( .D(n519), .CK(clk), .RN(n784), .Q(
        cont_var_out[1]), .QN(n766) );
  DFFRX2TS VAR_CONT_temp_reg_0_ ( .D(n518), .CK(clk), .RN(n622), .Q(
        cont_var_out[0]), .QN(n765) );
  DFFRX2TS ITER_CONT_temp_reg_0_ ( .D(n763), .CK(ITER_CONT_net3608262), .RN(
        n784), .Q(cont_iter_out[0]), .QN(n763) );
  DFFRX2TS ITER_CONT_temp_reg_3_ ( .D(ITER_CONT_N5), .CK(ITER_CONT_net3608262), 
        .RN(n791), .Q(cont_iter_out[3]), .QN(n762) );
  DFFRX2TS ITER_CONT_temp_reg_2_ ( .D(ITER_CONT_N4), .CK(ITER_CONT_net3608262), 
        .RN(n783), .Q(cont_iter_out[2]), .QN(n761) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(mux_sal[0]), .CK(
        d_ff5_data_out_net3608226), .RN(n778), .Q(data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(mux_sal[1]), .CK(
        d_ff5_data_out_net3608226), .RN(n771), .Q(data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(mux_sal[2]), .CK(
        d_ff5_data_out_net3608226), .RN(n604), .Q(data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(mux_sal[3]), .CK(
        d_ff5_data_out_net3608226), .RN(n775), .Q(data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(mux_sal[4]), .CK(
        d_ff5_data_out_net3608226), .RN(n778), .Q(data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(mux_sal[5]), .CK(
        d_ff5_data_out_net3608226), .RN(n776), .Q(data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(mux_sal[6]), .CK(
        d_ff5_data_out_net3608226), .RN(n776), .Q(data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(mux_sal[7]), .CK(
        d_ff5_data_out_net3608226), .RN(n782), .Q(data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(mux_sal[8]), .CK(
        d_ff5_data_out_net3608226), .RN(n781), .Q(data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(mux_sal[9]), .CK(
        d_ff5_data_out_net3608226), .RN(n780), .Q(data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(mux_sal[10]), .CK(
        d_ff5_data_out_net3608226), .RN(n780), .Q(data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(mux_sal[11]), .CK(
        d_ff5_data_out_net3608226), .RN(n779), .Q(data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(mux_sal[12]), .CK(
        d_ff5_data_out_net3608226), .RN(n776), .Q(data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(mux_sal[13]), .CK(
        d_ff5_data_out_net3608226), .RN(n776), .Q(data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(mux_sal[14]), .CK(
        d_ff5_data_out_net3608226), .RN(n778), .Q(data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(mux_sal[15]), .CK(
        d_ff5_data_out_net3608226), .RN(n777), .Q(data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(mux_sal[16]), .CK(
        d_ff5_data_out_net3608226), .RN(n781), .Q(data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(mux_sal[17]), .CK(
        d_ff5_data_out_net3608226), .RN(n604), .Q(data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(mux_sal[18]), .CK(
        d_ff5_data_out_net3608226), .RN(n775), .Q(data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(mux_sal[19]), .CK(
        d_ff5_data_out_net3608226), .RN(n776), .Q(data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(mux_sal[20]), .CK(
        d_ff5_data_out_net3608226), .RN(n776), .Q(data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(mux_sal[21]), .CK(
        d_ff5_data_out_net3608226), .RN(n781), .Q(data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(mux_sal[22]), .CK(
        d_ff5_data_out_net3608226), .RN(n774), .Q(data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(mux_sal[23]), .CK(
        d_ff5_data_out_net3608226), .RN(n773), .Q(data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(mux_sal[24]), .CK(
        d_ff5_data_out_net3608226), .RN(n776), .Q(data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(mux_sal[25]), .CK(
        d_ff5_data_out_net3608226), .RN(n775), .Q(data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(mux_sal[26]), .CK(
        d_ff5_data_out_net3608226), .RN(n795), .Q(data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(mux_sal[27]), .CK(
        d_ff5_data_out_net3608226), .RN(n778), .Q(data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(mux_sal[28]), .CK(
        d_ff5_data_out_net3608226), .RN(n785), .Q(data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(mux_sal[29]), .CK(
        d_ff5_data_out_net3608226), .RN(n785), .Q(data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(mux_sal[30]), .CK(
        d_ff5_data_out_net3608226), .RN(n774), .Q(data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(fmtted_Result_31_), .CK(
        d_ff5_data_out_net3608226), .RN(n774), .Q(data_output[31]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(n612), .CK(clk), .RN(n785), 
        .Q(inst_CORDIC_FSM_v3_state_reg[3]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(clk), .RN(n791), .Q(
        inst_CORDIC_FSM_v3_state_reg[6]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(clk), .RN(n783), .Q(
        inst_CORDIC_FSM_v3_state_reg[4]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(clk), .RN(n786), .Q(
        inst_CORDIC_FSM_v3_state_reg[5]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(clk), .RN(n792), .Q(
        inst_CORDIC_FSM_v3_state_reg[1]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[31]), .CK(reg_shift_y_net3608226), 
        .RN(n772), .Q(d_ff3_sign_out) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(
        inst_CORDIC_FSM_v3_state_next[2]), .CK(clk), .RN(n787), .Q(
        inst_CORDIC_FSM_v3_state_reg[2]) );
  DFFSX1TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(clk), .SN(n622), .Q(
        inst_CORDIC_FSM_v3_state_reg[0]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n778), .Q(d_ff2_X[27]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n621), .Q(d_ff2_Y[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n782), .Q(d_ff2_X[29]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n779), .Q(d_ff2_Y[29]) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3608226), 
        .RN(n793), .Q(d_ff1_operation_out) );
  DFFRX4TS ITER_CONT_temp_reg_1_ ( .D(ITER_CONT_N3), .CK(ITER_CONT_net3608262), 
        .RN(n794), .Q(cont_iter_out[1]), .QN(n764) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n776), .Q(d_ff2_X[24]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n776), .Q(d_ff2_X[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n777), .Q(d_ff2_X[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n785), .Q(d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n777), .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n775), .Q(d_ff2_Y[24]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3608226), .RN(n782), .Q(d_ff2_Y[28]), .QN(n769)
         );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(clk), .RN(n786), .Q(
        inst_CORDIC_FSM_v3_state_reg[7]) );
  ADDFX1TS intadd_422_U4 ( .A(d_ff2_Y[24]), .B(n764), .CI(intadd_422_CI), .CO(
        intadd_422_n3), .S(sh_exp_y[1]) );
  ADDFX1TS intadd_421_U4 ( .A(n764), .B(d_ff2_X[24]), .CI(intadd_421_CI), .CO(
        intadd_421_n3), .S(sh_exp_x[1]) );
  ADDFX1TS intadd_422_U3 ( .A(d_ff2_Y[25]), .B(n761), .CI(intadd_422_n3), .CO(
        intadd_422_n2), .S(sh_exp_y[2]) );
  ADDFX1TS intadd_421_U3 ( .A(d_ff2_X[25]), .B(n761), .CI(intadd_421_n3), .CO(
        intadd_421_n2), .S(sh_exp_x[2]) );
  ADDFX1TS intadd_421_U2 ( .A(d_ff2_X[26]), .B(n762), .CI(intadd_421_n2), .CO(
        intadd_421_n1), .S(sh_exp_x[3]) );
  ADDFX1TS intadd_422_U2 ( .A(d_ff2_Y[26]), .B(n762), .CI(intadd_422_n2), .CO(
        intadd_422_n1), .S(sh_exp_y[3]) );
  AOI222X1TS U407 ( .A0(n685), .A1(d_ff2_X[30]), .B0(n668), .B1(d_ff2_Y[30]), 
        .C0(n731), .C1(d_ff2_Z[30]), .Y(n671) );
  AOI222X1TS U408 ( .A0(n744), .A1(d_ff2_X[6]), .B0(n743), .B1(d_ff2_Y[6]), 
        .C0(n609), .C1(d_ff2_Z[6]), .Y(n673) );
  AOI222X1TS U409 ( .A0(n744), .A1(d_ff2_X[5]), .B0(n739), .B1(d_ff2_Y[5]), 
        .C0(n609), .C1(d_ff2_Z[5]), .Y(n675) );
  OAI21XLTS U410 ( .A0(d_ff1_operation_out), .A1(n613), .B0(n698), .Y(n696) );
  BUFX3TS U411 ( .A(n709), .Y(n614) );
  INVX4TS U412 ( .A(n716), .Y(n646) );
  AOI222X1TS U413 ( .A0(n685), .A1(d_ff2_X[27]), .B0(n668), .B1(d_ff2_Y[27]), 
        .C0(n609), .C1(d_ff2_Z[27]), .Y(n652) );
  AOI222X1TS U414 ( .A0(n685), .A1(d_ff2_X[25]), .B0(n743), .B1(d_ff2_Y[25]), 
        .C0(n609), .C1(d_ff2_Z[25]), .Y(n653) );
  AOI222X1TS U415 ( .A0(n669), .A1(d_ff2_X[23]), .B0(n739), .B1(d_ff2_Y[23]), 
        .C0(n609), .C1(d_ff2_Z[23]), .Y(n647) );
  AOI222X1TS U416 ( .A0(n669), .A1(d_ff2_X[15]), .B0(n684), .B1(d_ff2_Y[15]), 
        .C0(n609), .C1(d_ff2_Z[15]), .Y(n659) );
  NAND3X1TS U417 ( .A(enab_cont_iter), .B(n747), .C(n720), .Y(n635) );
  INVX3TS U418 ( .A(n703), .Y(n702) );
  NAND3BX1TS U419 ( .AN(inst_CORDIC_FSM_v3_state_reg[6]), .B(n624), .C(
        inst_CORDIC_FSM_v3_state_reg[4]), .Y(n717) );
  INVX3TS U420 ( .A(n640), .Y(n740) );
  INVX3TS U421 ( .A(n640), .Y(n722) );
  INVX3TS U422 ( .A(n640), .Y(n744) );
  OR2X4TS U423 ( .A(cont_iter_out[2]), .B(n695), .Y(n703) );
  NAND4BXLTS U424 ( .AN(inst_CORDIC_FSM_v3_state_reg[1]), .B(
        inst_CORDIC_FSM_v3_state_reg[3]), .C(n632), .D(n631), .Y(n636) );
  OR2X2TS U425 ( .A(n765), .B(cont_var_out[1]), .Y(n640) );
  OR2X2TS U426 ( .A(n766), .B(cont_var_out[0]), .Y(n620) );
  BUFX3TS U427 ( .A(n154), .Y(n604) );
  NAND2BXLTS U428 ( .AN(inst_CORDIC_FSM_v3_state_reg[3]), .B(n631), .Y(n619)
         );
  NAND3BXLTS U429 ( .AN(n619), .B(inst_CORDIC_FSM_v3_state_reg[1]), .C(n632), 
        .Y(n629) );
  NAND3XLTS U430 ( .A(n717), .B(n641), .C(n694), .Y(n753) );
  AOI222X1TS U431 ( .A0(n722), .A1(d_ff3_sh_y_out[6]), .B0(n721), .B1(
        d_ff3_sh_x_out[6]), .C0(n746), .C1(d_ff3_LUT_out[6]), .Y(n683) );
  AOI222X1TS U432 ( .A0(n722), .A1(d_ff3_sh_y_out[9]), .B0(n668), .B1(
        d_ff3_sh_x_out[9]), .C0(n746), .C1(d_ff3_LUT_out[9]), .Y(n682) );
  AOI222X1TS U433 ( .A0(n722), .A1(d_ff3_sh_y_out[10]), .B0(n684), .B1(
        d_ff3_sh_x_out[10]), .C0(n746), .C1(d_ff3_LUT_out[10]), .Y(n687) );
  AOI222X1TS U434 ( .A0(n722), .A1(d_ff3_sh_y_out[21]), .B0(n668), .B1(
        d_ff3_sh_x_out[21]), .C0(n746), .C1(d_ff3_LUT_out[21]), .Y(n688) );
  AOI222X1TS U435 ( .A0(n722), .A1(d_ff3_sh_y_out[23]), .B0(n668), .B1(
        d_ff3_sh_x_out[23]), .C0(n746), .C1(d_ff3_LUT_out[23]), .Y(n693) );
  AOI222X1TS U436 ( .A0(n722), .A1(d_ff3_sh_y_out[26]), .B0(n684), .B1(
        d_ff3_sh_x_out[26]), .C0(n731), .C1(d_ff3_LUT_out[26]), .Y(n643) );
  AOI222X1TS U437 ( .A0(n744), .A1(d_ff2_X[3]), .B0(n684), .B1(d_ff2_Y[3]), 
        .C0(n731), .C1(d_ff2_Z[3]), .Y(n674) );
  AOI222X1TS U438 ( .A0(n669), .A1(d_ff2_X[12]), .B0(n739), .B1(d_ff2_Y[12]), 
        .C0(n731), .C1(d_ff2_Z[12]), .Y(n649) );
  AOI222X1TS U439 ( .A0(n669), .A1(d_ff2_X[18]), .B0(n684), .B1(d_ff2_Y[18]), 
        .C0(n731), .C1(d_ff2_Z[18]), .Y(n662) );
  AOI222X1TS U440 ( .A0(n685), .A1(d_ff2_X[24]), .B0(n743), .B1(d_ff2_Y[24]), 
        .C0(n608), .C1(d_ff2_Z[24]), .Y(n667) );
  AOI222X1TS U441 ( .A0(n685), .A1(d_ff2_X[26]), .B0(n739), .B1(d_ff2_Y[26]), 
        .C0(n731), .C1(d_ff2_Z[26]), .Y(n651) );
  AOI222X1TS U442 ( .A0(n685), .A1(d_ff2_X[29]), .B0(n721), .B1(d_ff2_Y[29]), 
        .C0(n731), .C1(d_ff2_Z[29]), .Y(n661) );
  OR2X1TS U443 ( .A(d_ff_Xn[25]), .B(n633), .Y(first_mux_X[25]) );
  OR2X1TS U444 ( .A(d_ff_Xn[26]), .B(n633), .Y(first_mux_X[26]) );
  OR2X1TS U445 ( .A(d_ff_Xn[24]), .B(n633), .Y(first_mux_X[24]) );
  NOR2XLTS U446 ( .A(n720), .B(n628), .Y(ITER_CONT_N3) );
  OR2X1TS U447 ( .A(d_ff_Xn[29]), .B(n633), .Y(first_mux_X[29]) );
  OR2X1TS U448 ( .A(d_ff_Xn[27]), .B(n633), .Y(first_mux_X[27]) );
  OAI21XLTS U449 ( .A0(beg_fsm_cordic), .A1(n715), .B0(n639), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  OAI21XLTS U450 ( .A0(n630), .A1(n641), .B0(n629), .Y(
        inst_CORDIC_FSM_v3_state_next[2]) );
  AO22XLTS U451 ( .A0(n712), .A1(d_ff_Yn[30]), .B0(n711), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U452 ( .A0(n712), .A1(d_ff_Yn[29]), .B0(n711), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U453 ( .A0(n712), .A1(d_ff_Yn[28]), .B0(n711), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U454 ( .A0(n712), .A1(d_ff_Yn[27]), .B0(n711), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U455 ( .A0(n614), .A1(d_ff_Yn[26]), .B0(n711), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U456 ( .A0(n614), .A1(d_ff_Yn[25]), .B0(n711), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U457 ( .A0(n614), .A1(d_ff_Yn[24]), .B0(n711), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U458 ( .A0(n614), .A1(d_ff_Yn[23]), .B0(n711), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U459 ( .A0(n614), .A1(d_ff_Yn[22]), .B0(n711), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U460 ( .A0(n614), .A1(d_ff_Yn[21]), .B0(n711), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U461 ( .A0(n614), .A1(d_ff_Yn[20]), .B0(n711), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U462 ( .A0(n614), .A1(d_ff_Yn[19]), .B0(n711), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U463 ( .A0(n614), .A1(d_ff_Yn[18]), .B0(n708), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U464 ( .A0(n614), .A1(d_ff_Yn[17]), .B0(n710), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U465 ( .A0(n614), .A1(d_ff_Yn[16]), .B0(n710), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U466 ( .A0(n614), .A1(d_ff_Yn[15]), .B0(n710), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U467 ( .A0(n614), .A1(d_ff_Yn[14]), .B0(n710), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U468 ( .A0(n614), .A1(d_ff_Yn[13]), .B0(n710), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U469 ( .A0(n709), .A1(d_ff_Yn[12]), .B0(n710), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U470 ( .A0(n709), .A1(d_ff_Yn[11]), .B0(n710), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U471 ( .A0(n709), .A1(d_ff_Yn[10]), .B0(n708), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U472 ( .A0(n709), .A1(d_ff_Yn[9]), .B0(n708), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U473 ( .A0(n709), .A1(d_ff_Yn[8]), .B0(n708), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U474 ( .A0(n709), .A1(d_ff_Yn[7]), .B0(n708), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U475 ( .A0(n709), .A1(d_ff_Yn[6]), .B0(n708), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U476 ( .A0(n709), .A1(d_ff_Yn[5]), .B0(n708), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  AO22XLTS U477 ( .A0(n709), .A1(d_ff_Yn[4]), .B0(n708), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  AO22XLTS U478 ( .A0(n709), .A1(d_ff_Yn[3]), .B0(n708), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U479 ( .A0(n709), .A1(d_ff_Yn[2]), .B0(n708), .B1(d_ff_Xn[2]), .Y(
        mux_sal[2]) );
  AO22XLTS U480 ( .A0(n709), .A1(d_ff_Yn[1]), .B0(n708), .B1(d_ff_Xn[1]), .Y(
        mux_sal[1]) );
  AO22XLTS U481 ( .A0(n709), .A1(d_ff_Yn[0]), .B0(n711), .B1(d_ff_Xn[0]), .Y(
        mux_sal[0]) );
  NOR2XLTS U482 ( .A(n630), .B(n529), .Y(ITER_CONT_N5) );
  OAI211XLTS U483 ( .A0(n754), .A1(n640), .B0(n620), .C0(n642), .Y(n519) );
  AO22XLTS U484 ( .A0(n714), .A1(d_ff1_Z[31]), .B0(n707), .B1(d_ff_Zn[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U485 ( .A0(n714), .A1(d_ff1_Z[30]), .B0(n705), .B1(d_ff_Zn[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U486 ( .A0(n714), .A1(d_ff1_Z[29]), .B0(n705), .B1(d_ff_Zn[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U487 ( .A0(n714), .A1(d_ff1_Z[28]), .B0(n705), .B1(d_ff_Zn[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U488 ( .A0(n706), .A1(d_ff1_Z[27]), .B0(n705), .B1(d_ff_Zn[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U489 ( .A0(n706), .A1(d_ff1_Z[26]), .B0(n705), .B1(d_ff_Zn[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U490 ( .A0(n706), .A1(d_ff1_Z[25]), .B0(n705), .B1(d_ff_Zn[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U491 ( .A0(n706), .A1(d_ff1_Z[24]), .B0(n705), .B1(d_ff_Zn[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U492 ( .A0(n706), .A1(d_ff1_Z[23]), .B0(n705), .B1(d_ff_Zn[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U493 ( .A0(n706), .A1(d_ff1_Z[22]), .B0(n705), .B1(d_ff_Zn[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U494 ( .A0(n706), .A1(d_ff1_Z[21]), .B0(n705), .B1(d_ff_Zn[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U495 ( .A0(n706), .A1(d_ff1_Z[20]), .B0(n705), .B1(d_ff_Zn[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U496 ( .A0(n706), .A1(d_ff1_Z[19]), .B0(n705), .B1(d_ff_Zn[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U497 ( .A0(n706), .A1(d_ff1_Z[18]), .B0(n705), .B1(d_ff_Zn[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U498 ( .A0(n706), .A1(d_ff1_Z[17]), .B0(n705), .B1(d_ff_Zn[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U499 ( .A0(n706), .A1(d_ff1_Z[16]), .B0(n707), .B1(d_ff_Zn[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U500 ( .A0(n706), .A1(d_ff1_Z[15]), .B0(n707), .B1(d_ff_Zn[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U501 ( .A0(n704), .A1(d_ff1_Z[14]), .B0(n707), .B1(d_ff_Zn[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U502 ( .A0(n704), .A1(d_ff1_Z[13]), .B0(n707), .B1(d_ff_Zn[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U503 ( .A0(n704), .A1(d_ff1_Z[12]), .B0(n707), .B1(d_ff_Zn[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U504 ( .A0(n704), .A1(d_ff1_Z[11]), .B0(n707), .B1(d_ff_Zn[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U505 ( .A0(n704), .A1(d_ff1_Z[10]), .B0(n707), .B1(d_ff_Zn[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U506 ( .A0(n704), .A1(d_ff1_Z[9]), .B0(n707), .B1(d_ff_Zn[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U507 ( .A0(n704), .A1(d_ff1_Z[8]), .B0(n707), .B1(d_ff_Zn[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U508 ( .A0(n704), .A1(d_ff1_Z[7]), .B0(n707), .B1(d_ff_Zn[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U509 ( .A0(n704), .A1(d_ff1_Z[6]), .B0(n707), .B1(d_ff_Zn[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U510 ( .A0(n704), .A1(d_ff1_Z[5]), .B0(n707), .B1(d_ff_Zn[5]), .Y(
        first_mux_Z[5]) );
  AO22XLTS U511 ( .A0(n704), .A1(d_ff1_Z[4]), .B0(n707), .B1(d_ff_Zn[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U512 ( .A0(n704), .A1(d_ff1_Z[3]), .B0(n703), .B1(d_ff_Zn[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U513 ( .A0(n702), .A1(d_ff1_Z[2]), .B0(n703), .B1(d_ff_Zn[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U514 ( .A0(n704), .A1(d_ff1_Z[1]), .B0(n703), .B1(d_ff_Zn[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U515 ( .A0(n714), .A1(d_ff1_Z[0]), .B0(n703), .B1(d_ff_Zn[0]), .Y(
        first_mux_Z[0]) );
  OR2X1TS U516 ( .A(d_ff_Xn[28]), .B(n633), .Y(first_mux_X[28]) );
  OR2X1TS U517 ( .A(d_ff_Xn[20]), .B(n702), .Y(first_mux_X[20]) );
  OR2X1TS U518 ( .A(d_ff_Xn[19]), .B(n702), .Y(first_mux_X[19]) );
  OR2X1TS U519 ( .A(d_ff_Xn[17]), .B(n702), .Y(first_mux_X[17]) );
  OR2X1TS U520 ( .A(d_ff_Xn[14]), .B(n702), .Y(first_mux_X[14]) );
  OR2X1TS U521 ( .A(d_ff_Xn[13]), .B(n633), .Y(first_mux_X[13]) );
  OR2X1TS U522 ( .A(d_ff_Xn[7]), .B(n633), .Y(first_mux_X[7]) );
  OR2X1TS U523 ( .A(d_ff_Xn[6]), .B(n702), .Y(first_mux_X[6]) );
  OR2X1TS U524 ( .A(d_ff_Xn[5]), .B(n702), .Y(first_mux_X[5]) );
  OR2X1TS U525 ( .A(d_ff_Xn[2]), .B(n702), .Y(first_mux_X[2]) );
  XOR2XLTS U526 ( .A(d_ff2_Y[30]), .B(n755), .Y(sh_exp_y[7]) );
  OAI21XLTS U527 ( .A0(n757), .A1(n769), .B0(n756), .Y(sh_exp_y[5]) );
  XOR2XLTS U528 ( .A(d_ff2_X[30]), .B(n758), .Y(sh_exp_x[7]) );
  OAI21XLTS U529 ( .A0(n760), .A1(n768), .B0(n759), .Y(sh_exp_x[5]) );
  OAI21XLTS U530 ( .A0(ack_cordic), .A1(n637), .B0(n635), .Y(
        inst_CORDIC_FSM_v3_state_next[7]) );
  OR4X2TS U531 ( .A(inst_CORDIC_FSM_v3_state_reg[3]), .B(
        inst_CORDIC_FSM_v3_state_reg[1]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .D(inst_CORDIC_FSM_v3_state_reg[5]), .Y(n605) );
  BUFX4TS U532 ( .A(n646), .Y(n731) );
  INVX2TS U533 ( .A(n697), .Y(n710) );
  INVX2TS U534 ( .A(n731), .Y(n607) );
  INVX2TS U535 ( .A(n607), .Y(n608) );
  INVX2TS U536 ( .A(n607), .Y(n609) );
  INVX2TS U537 ( .A(n620), .Y(n739) );
  INVX4TS U538 ( .A(n620), .Y(n668) );
  INVX2TS U539 ( .A(n605), .Y(n610) );
  OAI21XLTS U540 ( .A0(cont_iter_out[0]), .A1(n537), .B0(n752), .Y(n521) );
  INVX2TS U541 ( .A(n752), .Y(n751) );
  OAI21XLTS U542 ( .A0(n609), .A1(n717), .B0(n636), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  NAND3X2TS U543 ( .A(n762), .B(n763), .C(n764), .Y(n695) );
  BUFX4TS U544 ( .A(n772), .Y(n773) );
  BUFX4TS U545 ( .A(n621), .Y(n781) );
  BUFX4TS U546 ( .A(n621), .Y(n780) );
  BUFX3TS U547 ( .A(n621), .Y(n622) );
  BUFX3TS U548 ( .A(n604), .Y(n621) );
  BUFX4TS U549 ( .A(n604), .Y(n775) );
  BUFX4TS U550 ( .A(n775), .Y(n777) );
  BUFX4TS U551 ( .A(n775), .Y(n782) );
  BUFX4TS U552 ( .A(n775), .Y(n776) );
  BUFX4TS U553 ( .A(n792), .Y(n778) );
  BUFX4TS U554 ( .A(n622), .Y(n793) );
  BUFX4TS U555 ( .A(n794), .Y(n787) );
  BUFX4TS U556 ( .A(n791), .Y(n785) );
  BUFX4TS U557 ( .A(n783), .Y(n792) );
  NOR2X4TS U558 ( .A(n761), .B(n762), .Y(n747) );
  AOI222X1TS U559 ( .A0(n722), .A1(d_ff3_sh_y_out[8]), .B0(n668), .B1(
        d_ff3_sh_x_out[8]), .C0(n746), .C1(d_ff3_LUT_out[8]), .Y(n691) );
  AOI222X1TS U560 ( .A0(n722), .A1(d_ff3_sh_y_out[12]), .B0(n668), .B1(
        d_ff3_sh_x_out[12]), .C0(n746), .C1(d_ff3_LUT_out[12]), .Y(n692) );
  AOI222X1TS U561 ( .A0(n722), .A1(d_ff3_sh_y_out[25]), .B0(n668), .B1(
        d_ff3_sh_x_out[25]), .C0(n746), .C1(d_ff3_LUT_out[25]), .Y(n690) );
  AOI222X1TS U562 ( .A0(n722), .A1(d_ff3_sh_y_out[24]), .B0(n743), .B1(
        d_ff3_sh_x_out[24]), .C0(n746), .C1(d_ff3_LUT_out[24]), .Y(n689) );
  BUFX4TS U563 ( .A(n646), .Y(n746) );
  INVX2TS U564 ( .A(inst_CORDIC_FSM_v3_state_next[3]), .Y(n611) );
  INVX2TS U565 ( .A(n611), .Y(n612) );
  INVX2TS U566 ( .A(n606), .Y(n613) );
  INVX4TS U567 ( .A(n620), .Y(n721) );
  CLKINVX3TS U568 ( .A(n620), .Y(n684) );
  INVX4TS U569 ( .A(n620), .Y(n743) );
  NOR2X2TS U570 ( .A(n694), .B(n620), .Y(enab_d_ff4_Zn) );
  NOR2X4TS U571 ( .A(n763), .B(n764), .Y(n720) );
  BUFX4TS U572 ( .A(n770), .Y(n771) );
  BUFX4TS U573 ( .A(n795), .Y(n774) );
  BUFX3TS U574 ( .A(n604), .Y(n795) );
  NOR3BX2TS U575 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(n617), .Y(ready_cordic) );
  OAI32X4TS U576 ( .A0(n615), .A1(d_ff1_operation_out), .A2(n613), .B0(
        d_ff1_shift_region_flag_out_0_), .B1(n698), .Y(n699) );
  OAI21XLTS U577 ( .A0(cont_iter_out[1]), .A1(n749), .B0(n634), .Y(n534) );
  OAI21XLTS U578 ( .A0(n747), .A1(cont_iter_out[1]), .B0(n634), .Y(n536) );
  AOI21X2TS U579 ( .A0(cont_iter_out[2]), .A1(n762), .B0(n623), .Y(n634) );
  OR2X1TS U580 ( .A(d_ff_Xn[3]), .B(n702), .Y(first_mux_X[3]) );
  OR2X1TS U581 ( .A(d_ff_Xn[12]), .B(n702), .Y(first_mux_X[12]) );
  OR2X1TS U582 ( .A(d_ff_Xn[1]), .B(n702), .Y(first_mux_X[1]) );
  INVX4TS U583 ( .A(n710), .Y(n709) );
  NOR2XLTS U584 ( .A(n694), .B(n640), .Y(enab_d_ff4_Yn) );
  OR2X1TS U585 ( .A(d_ff_Xn[16]), .B(n702), .Y(first_mux_X[16]) );
  OR2X1TS U586 ( .A(d_ff_Xn[10]), .B(n702), .Y(first_mux_X[10]) );
  OAI211XLTS U587 ( .A0(n628), .A1(n627), .B0(n626), .C0(n695), .Y(n527) );
  NOR2X1TS U588 ( .A(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[6]), .Y(n618) );
  NAND2X1TS U589 ( .A(n610), .B(n618), .Y(n617) );
  NOR3BX1TS U590 ( .AN(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[7]), .C(n617), .Y(
        inst_CORDIC_FSM_v3_state_next[3]) );
  INVX2TS U591 ( .A(n747), .Y(n537) );
  NAND2X1TS U592 ( .A(n761), .B(cont_iter_out[3]), .Y(n627) );
  INVX2TS U593 ( .A(n627), .Y(n623) );
  NAND2X1TS U594 ( .A(n537), .B(cont_iter_out[0]), .Y(n752) );
  NOR2X1TS U595 ( .A(n623), .B(n751), .Y(n748) );
  OAI211X1TS U596 ( .A0(cont_iter_out[3]), .A1(n763), .B0(n761), .C0(n764), 
        .Y(n750) );
  OAI21XLTS U597 ( .A0(n748), .A1(n764), .B0(n750), .Y(n526) );
  NAND2X1TS U598 ( .A(n720), .B(n761), .Y(n626) );
  OAI31X1TS U599 ( .A0(cont_iter_out[3]), .A1(cont_iter_out[1]), .A2(n761), 
        .B0(n626), .Y(n528) );
  OAI31X4TS U600 ( .A0(cont_iter_out[2]), .A1(cont_iter_out[3]), .A2(n763), 
        .B0(n537), .Y(n749) );
  OAI21XLTS U601 ( .A0(n747), .A1(n764), .B0(n749), .Y(n531) );
  OAI21XLTS U602 ( .A0(n764), .A1(n749), .B0(n627), .Y(n532) );
  NOR3BX1TS U603 ( .AN(n618), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[2]), .Y(n631) );
  NOR2X1TS U604 ( .A(inst_CORDIC_FSM_v3_state_reg[0]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .Y(n632) );
  NOR2X1TS U605 ( .A(inst_CORDIC_FSM_v3_state_reg[1]), .B(n619), .Y(n625) );
  NAND3BX1TS U606 ( .AN(inst_CORDIC_FSM_v3_state_reg[5]), .B(
        inst_CORDIC_FSM_v3_state_reg[0]), .C(n625), .Y(n715) );
  NAND2X1TS U607 ( .A(n629), .B(n715), .Y(enab_d_ff_RB1) );
  INVX2TS U608 ( .A(ready_add_subt), .Y(n694) );
  INVX2TS U609 ( .A(rst), .Y(n154) );
  BUFX3TS U610 ( .A(n621), .Y(n786) );
  BUFX3TS U611 ( .A(n621), .Y(n784) );
  BUFX3TS U612 ( .A(n795), .Y(n783) );
  BUFX3TS U613 ( .A(n770), .Y(n791) );
  BUFX3TS U614 ( .A(n775), .Y(n779) );
  BUFX3TS U615 ( .A(n622), .Y(n790) );
  BUFX3TS U616 ( .A(n772), .Y(n794) );
  BUFX3TS U617 ( .A(n604), .Y(n770) );
  BUFX3TS U618 ( .A(n622), .Y(n789) );
  BUFX3TS U619 ( .A(n604), .Y(n772) );
  BUFX3TS U620 ( .A(n622), .Y(n788) );
  NAND2X1TS U621 ( .A(n634), .B(n752), .Y(n523) );
  NOR3BX1TS U622 ( .AN(n610), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[2]), .Y(n624) );
  NAND3BX1TS U623 ( .AN(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[6]), .C(n624), .Y(n641) );
  INVX2TS U624 ( .A(n641), .Y(enab_cont_iter) );
  INVX2TS U625 ( .A(ready_cordic), .Y(n637) );
  NAND2X1TS U626 ( .A(n637), .B(n635), .Y(enab_d_ff5_data_out) );
  NAND3BX1TS U627 ( .AN(inst_CORDIC_FSM_v3_state_reg[0]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(n625), .Y(n718) );
  NAND2X1TS U628 ( .A(n717), .B(n718), .Y(beg_add_subt) );
  NAND2X1TS U629 ( .A(n767), .B(cont_iter_out[0]), .Y(intadd_422_CI) );
  OAI21XLTS U630 ( .A0(cont_iter_out[0]), .A1(n767), .B0(intadd_422_CI), .Y(
        sh_exp_y[0]) );
  NAND2X1TS U631 ( .A(n616), .B(cont_iter_out[0]), .Y(intadd_421_CI) );
  OAI21XLTS U632 ( .A0(cont_iter_out[0]), .A1(n616), .B0(intadd_421_CI), .Y(
        sh_exp_x[0]) );
  NOR2X1TS U633 ( .A(cont_iter_out[0]), .B(cont_iter_out[1]), .Y(n628) );
  NOR2X1TS U634 ( .A(d_ff2_X[27]), .B(intadd_421_n1), .Y(n760) );
  OR3X1TS U635 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(intadd_421_n1), .Y(n759)
         );
  NOR2X1TS U636 ( .A(d_ff2_Y[27]), .B(intadd_422_n1), .Y(n757) );
  OR3X1TS U637 ( .A(d_ff2_Y[28]), .B(d_ff2_Y[27]), .C(intadd_422_n1), .Y(n756)
         );
  NAND2X1TS U638 ( .A(cont_iter_out[2]), .B(n720), .Y(n719) );
  CLKAND2X2TS U639 ( .A(n719), .B(n762), .Y(n529) );
  NOR2X1TS U640 ( .A(n762), .B(n719), .Y(n630) );
  NAND2X1TS U641 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .Y(n716) );
  BUFX3TS U642 ( .A(n703), .Y(n705) );
  INVX2TS U643 ( .A(n703), .Y(n633) );
  OAI21X1TS U644 ( .A0(n747), .A1(n764), .B0(n634), .Y(n535) );
  OR2X1TS U645 ( .A(n535), .B(n751), .Y(n522) );
  INVX2TS U646 ( .A(n636), .Y(enab_RB3) );
  NOR4X1TS U647 ( .A(enab_cont_iter), .B(enab_RB3), .C(enab_d_ff_RB1), .D(
        beg_add_subt), .Y(n638) );
  AOI32X1TS U648 ( .A0(n638), .A1(n637), .A2(n611), .B0(ready_cordic), .B1(
        ack_cordic), .Y(n639) );
  INVX2TS U649 ( .A(n753), .Y(n754) );
  NAND2X1TS U650 ( .A(n754), .B(cont_var_out[1]), .Y(n642) );
  INVX2TS U651 ( .A(n643), .Y(add_subt_dataB[26]) );
  INVX4TS U652 ( .A(n640), .Y(n669) );
  AOI222X1TS U653 ( .A0(n669), .A1(d_ff2_X[11]), .B0(n668), .B1(d_ff2_Y[11]), 
        .C0(n646), .C1(d_ff2_Z[11]), .Y(n644) );
  INVX2TS U654 ( .A(n644), .Y(add_subt_dataA[11]) );
  AOI222X1TS U655 ( .A0(n669), .A1(d_ff2_X[17]), .B0(n721), .B1(d_ff2_Y[17]), 
        .C0(n646), .C1(d_ff2_Z[17]), .Y(n645) );
  INVX2TS U656 ( .A(n645), .Y(add_subt_dataA[17]) );
  INVX2TS U657 ( .A(n647), .Y(add_subt_dataA[23]) );
  AOI222X1TS U658 ( .A0(n669), .A1(d_ff2_X[19]), .B0(n668), .B1(d_ff2_Y[19]), 
        .C0(n646), .C1(d_ff2_Z[19]), .Y(n648) );
  INVX2TS U659 ( .A(n648), .Y(add_subt_dataA[19]) );
  INVX2TS U660 ( .A(n649), .Y(add_subt_dataA[12]) );
  INVX4TS U661 ( .A(n640), .Y(n685) );
  AOI222X1TS U662 ( .A0(n685), .A1(d_ff3_sh_y_out[2]), .B0(n743), .B1(
        d_ff3_sh_x_out[2]), .C0(n608), .C1(d_ff3_LUT_out[2]), .Y(n650) );
  INVX2TS U663 ( .A(n650), .Y(add_subt_dataB[2]) );
  INVX2TS U664 ( .A(n651), .Y(add_subt_dataA[26]) );
  INVX2TS U665 ( .A(n652), .Y(add_subt_dataA[27]) );
  INVX2TS U666 ( .A(n653), .Y(add_subt_dataA[25]) );
  AOI222X1TS U667 ( .A0(n669), .A1(d_ff2_X[14]), .B0(n668), .B1(d_ff2_Y[14]), 
        .C0(n646), .C1(d_ff2_Z[14]), .Y(n654) );
  INVX2TS U668 ( .A(n654), .Y(add_subt_dataA[14]) );
  AOI222X1TS U669 ( .A0(n685), .A1(d_ff2_X[0]), .B0(n684), .B1(d_ff2_Y[0]), 
        .C0(n608), .C1(d_ff2_Z[0]), .Y(n655) );
  INVX2TS U670 ( .A(n655), .Y(add_subt_dataA[0]) );
  AOI222X1TS U671 ( .A0(n669), .A1(d_ff2_X[21]), .B0(n684), .B1(d_ff2_Y[21]), 
        .C0(n646), .C1(d_ff2_Z[21]), .Y(n656) );
  INVX2TS U672 ( .A(n656), .Y(add_subt_dataA[21]) );
  AOI222X1TS U673 ( .A0(n685), .A1(d_ff3_sh_y_out[0]), .B0(n739), .B1(
        d_ff3_sh_x_out[0]), .C0(n608), .C1(d_ff3_LUT_out[0]), .Y(n657) );
  INVX2TS U674 ( .A(n657), .Y(add_subt_dataB[0]) );
  AOI222X1TS U675 ( .A0(n685), .A1(d_ff3_sh_y_out[1]), .B0(n743), .B1(
        d_ff3_sh_x_out[1]), .C0(n608), .C1(d_ff3_LUT_out[1]), .Y(n658) );
  INVX2TS U676 ( .A(n658), .Y(add_subt_dataB[1]) );
  INVX2TS U677 ( .A(n659), .Y(add_subt_dataA[15]) );
  AOI222X1TS U678 ( .A0(n669), .A1(d_ff2_X[16]), .B0(n668), .B1(d_ff2_Y[16]), 
        .C0(n646), .C1(d_ff2_Z[16]), .Y(n660) );
  INVX2TS U679 ( .A(n660), .Y(add_subt_dataA[16]) );
  INVX2TS U680 ( .A(n661), .Y(add_subt_dataA[29]) );
  INVX2TS U681 ( .A(n662), .Y(add_subt_dataA[18]) );
  AOI222X1TS U682 ( .A0(n685), .A1(d_ff2_X[31]), .B0(n743), .B1(d_ff2_Y[31]), 
        .C0(n731), .C1(d_ff2_Z[31]), .Y(n663) );
  INVX2TS U683 ( .A(n663), .Y(add_subt_dataA[31]) );
  AOI222X1TS U684 ( .A0(n669), .A1(d_ff2_X[20]), .B0(n668), .B1(d_ff2_Y[20]), 
        .C0(n646), .C1(d_ff2_Z[20]), .Y(n664) );
  INVX2TS U685 ( .A(n664), .Y(add_subt_dataA[20]) );
  AOI222X1TS U686 ( .A0(n685), .A1(d_ff2_X[28]), .B0(n721), .B1(d_ff2_Y[28]), 
        .C0(n731), .C1(d_ff2_Z[28]), .Y(n665) );
  INVX2TS U687 ( .A(n665), .Y(add_subt_dataA[28]) );
  AOI222X1TS U688 ( .A0(n669), .A1(d_ff2_X[22]), .B0(n739), .B1(d_ff2_Y[22]), 
        .C0(n646), .C1(d_ff2_Z[22]), .Y(n666) );
  INVX2TS U689 ( .A(n666), .Y(add_subt_dataA[22]) );
  INVX2TS U690 ( .A(n667), .Y(add_subt_dataA[24]) );
  AOI222X1TS U691 ( .A0(n669), .A1(d_ff2_X[13]), .B0(n668), .B1(d_ff2_Y[13]), 
        .C0(n646), .C1(d_ff2_Z[13]), .Y(n670) );
  INVX2TS U692 ( .A(n670), .Y(add_subt_dataA[13]) );
  INVX2TS U693 ( .A(n671), .Y(add_subt_dataA[30]) );
  AOI222X1TS U694 ( .A0(n744), .A1(d_ff2_X[10]), .B0(n721), .B1(d_ff2_Y[10]), 
        .C0(n731), .C1(d_ff2_Z[10]), .Y(n672) );
  INVX2TS U695 ( .A(n672), .Y(add_subt_dataA[10]) );
  INVX2TS U696 ( .A(n673), .Y(add_subt_dataA[6]) );
  INVX2TS U697 ( .A(n674), .Y(add_subt_dataA[3]) );
  INVX2TS U698 ( .A(n675), .Y(add_subt_dataA[5]) );
  AOI222X1TS U699 ( .A0(n744), .A1(d_ff2_X[2]), .B0(n743), .B1(d_ff2_Y[2]), 
        .C0(n608), .C1(d_ff2_Z[2]), .Y(n676) );
  INVX2TS U700 ( .A(n676), .Y(add_subt_dataA[2]) );
  AOI222X1TS U701 ( .A0(n744), .A1(d_ff2_X[8]), .B0(n721), .B1(d_ff2_Y[8]), 
        .C0(n608), .C1(d_ff2_Z[8]), .Y(n677) );
  INVX2TS U702 ( .A(n677), .Y(add_subt_dataA[8]) );
  AOI222X1TS U703 ( .A0(n744), .A1(d_ff2_X[4]), .B0(n743), .B1(d_ff2_Y[4]), 
        .C0(n731), .C1(d_ff2_Z[4]), .Y(n678) );
  INVX2TS U704 ( .A(n678), .Y(add_subt_dataA[4]) );
  AOI222X1TS U705 ( .A0(n744), .A1(d_ff2_X[9]), .B0(n739), .B1(d_ff2_Y[9]), 
        .C0(n608), .C1(d_ff2_Z[9]), .Y(n679) );
  INVX2TS U706 ( .A(n679), .Y(add_subt_dataA[9]) );
  AOI222X1TS U707 ( .A0(n744), .A1(d_ff2_X[1]), .B0(n684), .B1(d_ff2_Y[1]), 
        .C0(n731), .C1(d_ff2_Z[1]), .Y(n680) );
  INVX2TS U708 ( .A(n680), .Y(add_subt_dataA[1]) );
  AOI222X1TS U709 ( .A0(n744), .A1(d_ff2_X[7]), .B0(n721), .B1(d_ff2_Y[7]), 
        .C0(n608), .C1(d_ff2_Z[7]), .Y(n681) );
  INVX2TS U710 ( .A(n681), .Y(add_subt_dataA[7]) );
  INVX2TS U711 ( .A(n682), .Y(add_subt_dataB[9]) );
  INVX2TS U712 ( .A(n683), .Y(add_subt_dataB[6]) );
  AOI222X1TS U713 ( .A0(n685), .A1(d_ff3_sh_y_out[4]), .B0(n668), .B1(
        d_ff3_sh_x_out[4]), .C0(n746), .C1(d_ff3_LUT_out[4]), .Y(n686) );
  INVX2TS U714 ( .A(n686), .Y(add_subt_dataB[4]) );
  INVX2TS U715 ( .A(n687), .Y(add_subt_dataB[10]) );
  INVX2TS U716 ( .A(n688), .Y(add_subt_dataB[21]) );
  INVX2TS U717 ( .A(n689), .Y(add_subt_dataB[24]) );
  INVX2TS U718 ( .A(n690), .Y(add_subt_dataB[25]) );
  INVX2TS U719 ( .A(n691), .Y(add_subt_dataB[8]) );
  INVX2TS U720 ( .A(n692), .Y(add_subt_dataB[12]) );
  INVX2TS U721 ( .A(n693), .Y(add_subt_dataB[23]) );
  NOR3XLTS U722 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .C(n694), .Y(
        enab_d_ff4_Xn) );
  AOI32X1TS U724 ( .A0(cont_iter_out[3]), .A1(n695), .A2(n764), .B0(
        cont_iter_out[2]), .B1(n695), .Y(data_out_LUT[4]) );
  OAI22X1TS U725 ( .A0(cont_iter_out[3]), .A1(n719), .B0(cont_iter_out[2]), 
        .B1(n720), .Y(data_out_LUT[25]) );
  NAND2X1TS U726 ( .A(d_ff1_operation_out), .B(n613), .Y(n698) );
  XOR2X1TS U727 ( .A(n615), .B(n696), .Y(n697) );
  BUFX3TS U728 ( .A(n710), .Y(n708) );
  AOI22X1TS U729 ( .A0(n709), .A1(d_ff_Yn[31]), .B0(d_ff_Xn[31]), .B1(n708), 
        .Y(n700) );
  XNOR2X1TS U730 ( .A(n700), .B(n699), .Y(fmtted_Result_31_) );
  INVX4TS U731 ( .A(n703), .Y(n704) );
  NOR2BX1TS U732 ( .AN(d_ff_Yn[0]), .B(n704), .Y(first_mux_Y[0]) );
  NOR2BX1TS U733 ( .AN(d_ff_Yn[1]), .B(n704), .Y(first_mux_Y[1]) );
  INVX4TS U734 ( .A(n703), .Y(n714) );
  NOR2BX1TS U735 ( .AN(d_ff_Yn[2]), .B(n714), .Y(first_mux_Y[2]) );
  INVX4TS U736 ( .A(n703), .Y(n706) );
  NOR2BX1TS U737 ( .AN(d_ff_Yn[3]), .B(n706), .Y(first_mux_Y[3]) );
  NOR2BX1TS U738 ( .AN(d_ff_Yn[4]), .B(n714), .Y(first_mux_Y[4]) );
  NOR2BX1TS U739 ( .AN(d_ff_Yn[5]), .B(n706), .Y(first_mux_Y[5]) );
  INVX4TS U740 ( .A(n703), .Y(n713) );
  NOR2BX1TS U741 ( .AN(d_ff_Yn[6]), .B(n713), .Y(first_mux_Y[6]) );
  NOR2BX1TS U742 ( .AN(d_ff_Yn[7]), .B(n713), .Y(first_mux_Y[7]) );
  NOR2BX1TS U743 ( .AN(d_ff_Yn[8]), .B(n713), .Y(first_mux_Y[8]) );
  INVX4TS U744 ( .A(n703), .Y(n701) );
  NOR2BX1TS U745 ( .AN(d_ff_Yn[9]), .B(n701), .Y(first_mux_Y[9]) );
  NOR2BX1TS U746 ( .AN(d_ff_Yn[10]), .B(n701), .Y(first_mux_Y[10]) );
  NOR2BX1TS U747 ( .AN(d_ff_Yn[11]), .B(n701), .Y(first_mux_Y[11]) );
  NOR2BX1TS U748 ( .AN(d_ff_Yn[12]), .B(n701), .Y(first_mux_Y[12]) );
  NOR2BX1TS U749 ( .AN(d_ff_Yn[13]), .B(n701), .Y(first_mux_Y[13]) );
  NOR2BX1TS U750 ( .AN(d_ff_Yn[14]), .B(n701), .Y(first_mux_Y[14]) );
  NOR2BX1TS U751 ( .AN(d_ff_Yn[15]), .B(n701), .Y(first_mux_Y[15]) );
  NOR2BX1TS U752 ( .AN(d_ff_Yn[16]), .B(n701), .Y(first_mux_Y[16]) );
  NOR2BX1TS U753 ( .AN(d_ff_Yn[17]), .B(n701), .Y(first_mux_Y[17]) );
  NOR2BX1TS U754 ( .AN(d_ff_Yn[18]), .B(n701), .Y(first_mux_Y[18]) );
  NOR2BX1TS U755 ( .AN(d_ff_Yn[19]), .B(n701), .Y(first_mux_Y[19]) );
  NOR2BX1TS U756 ( .AN(d_ff_Yn[20]), .B(n701), .Y(first_mux_Y[20]) );
  NOR2BX1TS U757 ( .AN(d_ff_Yn[21]), .B(n701), .Y(first_mux_Y[21]) );
  NOR2BX1TS U758 ( .AN(d_ff_Yn[22]), .B(n701), .Y(first_mux_Y[22]) );
  NOR2BX1TS U759 ( .AN(d_ff_Yn[23]), .B(n701), .Y(first_mux_Y[23]) );
  NOR2BX1TS U760 ( .AN(d_ff_Yn[24]), .B(n713), .Y(first_mux_Y[24]) );
  NOR2BX1TS U761 ( .AN(d_ff_Yn[25]), .B(n713), .Y(first_mux_Y[25]) );
  NOR2BX1TS U762 ( .AN(d_ff_Yn[26]), .B(n713), .Y(first_mux_Y[26]) );
  NOR2BX1TS U763 ( .AN(d_ff_Yn[27]), .B(n713), .Y(first_mux_Y[27]) );
  NOR2BX1TS U764 ( .AN(d_ff_Yn[28]), .B(n713), .Y(first_mux_Y[28]) );
  NOR2BX1TS U765 ( .AN(d_ff_Yn[29]), .B(n713), .Y(first_mux_Y[29]) );
  NOR2BX1TS U766 ( .AN(d_ff_Yn[30]), .B(n713), .Y(first_mux_Y[30]) );
  NOR2BX1TS U767 ( .AN(d_ff_Yn[31]), .B(n713), .Y(first_mux_Y[31]) );
  BUFX3TS U768 ( .A(n703), .Y(n707) );
  BUFX3TS U769 ( .A(n708), .Y(n711) );
  INVX2TS U770 ( .A(n708), .Y(n712) );
  NOR2BX1TS U771 ( .AN(d_ff_Xn[0]), .B(n714), .Y(first_mux_X[0]) );
  NOR2BX1TS U772 ( .AN(d_ff_Xn[4]), .B(n714), .Y(first_mux_X[4]) );
  NOR2BX1TS U773 ( .AN(d_ff_Xn[8]), .B(n714), .Y(first_mux_X[8]) );
  NOR2BX1TS U774 ( .AN(d_ff_Xn[9]), .B(n714), .Y(first_mux_X[9]) );
  NOR2BX1TS U775 ( .AN(d_ff_Xn[11]), .B(n714), .Y(first_mux_X[11]) );
  NOR2BX1TS U776 ( .AN(d_ff_Xn[15]), .B(n714), .Y(first_mux_X[15]) );
  NOR2BX1TS U777 ( .AN(d_ff_Xn[18]), .B(n714), .Y(first_mux_X[18]) );
  NOR2BX1TS U778 ( .AN(d_ff_Xn[21]), .B(n713), .Y(first_mux_X[21]) );
  NOR2BX1TS U779 ( .AN(d_ff_Xn[22]), .B(n713), .Y(first_mux_X[22]) );
  NOR2BX1TS U780 ( .AN(d_ff_Xn[23]), .B(n713), .Y(first_mux_X[23]) );
  NOR2BX1TS U781 ( .AN(d_ff_Xn[30]), .B(n713), .Y(first_mux_X[30]) );
  NOR2BX1TS U782 ( .AN(d_ff_Xn[31]), .B(n714), .Y(first_mux_X[31]) );
  NOR2BX1TS U783 ( .AN(beg_fsm_cordic), .B(n715), .Y(
        inst_CORDIC_FSM_v3_state_next[1]) );
  OAI22X1TS U784 ( .A0(enab_d_ff4_Zn), .A1(n718), .B0(n717), .B1(n716), .Y(
        inst_CORDIC_FSM_v3_state_next[5]) );
  NOR2BX1TS U785 ( .AN(enab_d_ff4_Zn), .B(n718), .Y(
        inst_CORDIC_FSM_v3_state_next[6]) );
  OA21XLTS U786 ( .A0(cont_iter_out[2]), .A1(n720), .B0(n719), .Y(ITER_CONT_N4) );
  XOR2XLTS U787 ( .A(d_ff3_sign_out), .B(cont_var_out[0]), .Y(op_add_subt) );
  AO22XLTS U788 ( .A0(n722), .A1(d_ff3_sh_y_out[31]), .B0(n721), .B1(
        d_ff3_sh_x_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U789 ( .A0(n722), .A1(d_ff3_sh_y_out[30]), .B0(n743), .B1(
        d_ff3_sh_x_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U790 ( .A0(n740), .A1(d_ff3_sh_y_out[29]), .B0(n721), .B1(
        d_ff3_sh_x_out[29]), .Y(n723) );
  NAND2X1TS U791 ( .A(n646), .B(d_ff3_LUT_out[27]), .Y(n725) );
  NAND2X1TS U792 ( .A(n723), .B(n725), .Y(add_subt_dataB[29]) );
  AOI22X1TS U793 ( .A0(n740), .A1(d_ff3_sh_y_out[28]), .B0(n721), .B1(
        d_ff3_sh_x_out[28]), .Y(n724) );
  NAND2X1TS U794 ( .A(n724), .B(n725), .Y(add_subt_dataB[28]) );
  AOI22X1TS U795 ( .A0(n740), .A1(d_ff3_sh_y_out[27]), .B0(n739), .B1(
        d_ff3_sh_x_out[27]), .Y(n726) );
  NAND2X1TS U796 ( .A(n726), .B(n725), .Y(add_subt_dataB[27]) );
  AOI22X1TS U797 ( .A0(n740), .A1(d_ff3_sh_y_out[22]), .B0(n743), .B1(
        d_ff3_sh_x_out[22]), .Y(n727) );
  OAI2BB1X1TS U798 ( .A0N(n609), .A1N(d_ff3_LUT_out[19]), .B0(n727), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U799 ( .A0(n740), .A1(d_ff3_sh_y_out[20]), .B0(n721), .B1(
        d_ff3_sh_x_out[20]), .Y(n728) );
  NAND2X1TS U800 ( .A(n646), .B(d_ff3_LUT_out[15]), .Y(n734) );
  NAND2X1TS U801 ( .A(n728), .B(n734), .Y(add_subt_dataB[20]) );
  AOI22X1TS U802 ( .A0(n740), .A1(d_ff3_sh_y_out[19]), .B0(n721), .B1(
        d_ff3_sh_x_out[19]), .Y(n729) );
  OAI2BB1X1TS U803 ( .A0N(n746), .A1N(d_ff3_LUT_out[19]), .B0(n729), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U804 ( .A0(n740), .A1(d_ff3_sh_y_out[18]), .B0(n743), .B1(
        d_ff3_sh_x_out[18]), .Y(n730) );
  OAI2BB1X1TS U805 ( .A0N(n731), .A1N(d_ff3_LUT_out[13]), .B0(n730), .Y(
        add_subt_dataB[18]) );
  AOI22X1TS U806 ( .A0(n740), .A1(d_ff3_sh_y_out[17]), .B0(n684), .B1(
        d_ff3_sh_x_out[17]), .Y(n732) );
  NAND2X1TS U807 ( .A(n732), .B(n734), .Y(add_subt_dataB[17]) );
  AOI22X1TS U808 ( .A0(n740), .A1(d_ff3_sh_y_out[16]), .B0(n743), .B1(
        d_ff3_sh_x_out[16]), .Y(n733) );
  OAI2BB1X1TS U809 ( .A0N(n746), .A1N(d_ff3_LUT_out[3]), .B0(n733), .Y(
        add_subt_dataB[16]) );
  AOI22X1TS U810 ( .A0(n740), .A1(d_ff3_sh_y_out[15]), .B0(n739), .B1(
        d_ff3_sh_x_out[15]), .Y(n735) );
  NAND2X1TS U811 ( .A(n735), .B(n734), .Y(add_subt_dataB[15]) );
  AOI22X1TS U812 ( .A0(n740), .A1(d_ff3_sh_y_out[14]), .B0(n721), .B1(
        d_ff3_sh_x_out[14]), .Y(n736) );
  OAI2BB1X1TS U813 ( .A0N(n609), .A1N(d_ff3_LUT_out[5]), .B0(n736), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U814 ( .A0(n744), .A1(d_ff3_sh_y_out[13]), .B0(n684), .B1(
        d_ff3_sh_x_out[13]), .Y(n737) );
  OAI2BB1X1TS U815 ( .A0N(n609), .A1N(d_ff3_LUT_out[13]), .B0(n737), .Y(
        add_subt_dataB[13]) );
  AOI22X1TS U816 ( .A0(n740), .A1(d_ff3_sh_y_out[11]), .B0(n743), .B1(
        d_ff3_sh_x_out[11]), .Y(n738) );
  OAI2BB1X1TS U817 ( .A0N(n746), .A1N(d_ff3_LUT_out[7]), .B0(n738), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U818 ( .A0(n740), .A1(d_ff3_sh_y_out[7]), .B0(n721), .B1(
        d_ff3_sh_x_out[7]), .Y(n741) );
  OAI2BB1X1TS U819 ( .A0N(n731), .A1N(d_ff3_LUT_out[7]), .B0(n741), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U820 ( .A0(n744), .A1(d_ff3_sh_y_out[5]), .B0(n721), .B1(
        d_ff3_sh_x_out[5]), .Y(n742) );
  OAI2BB1X1TS U821 ( .A0N(n746), .A1N(d_ff3_LUT_out[5]), .B0(n742), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U822 ( .A0(n744), .A1(d_ff3_sh_y_out[3]), .B0(n743), .B1(
        d_ff3_sh_x_out[3]), .Y(n745) );
  OAI2BB1X1TS U823 ( .A0N(n746), .A1N(d_ff3_LUT_out[3]), .B0(n745), .Y(
        add_subt_dataB[3]) );
  AOI22X1TS U824 ( .A0(cont_iter_out[1]), .A1(n749), .B0(n747), .B1(n764), .Y(
        n533) );
  AOI22X1TS U825 ( .A0(cont_iter_out[1]), .A1(n749), .B0(n748), .B1(n764), .Y(
        n525) );
  OAI2BB1X1TS U826 ( .A0N(cont_iter_out[1]), .A1N(n523), .B0(n750), .Y(n524)
         );
  AOI22X1TS U827 ( .A0(cont_iter_out[1]), .A1(n752), .B0(n751), .B1(n764), .Y(
        n520) );
  AOI22X1TS U828 ( .A0(n754), .A1(n765), .B0(cont_var_out[0]), .B1(n753), .Y(
        n518) );
  NOR2XLTS U830 ( .A(d_ff2_Y[29]), .B(n756), .Y(n755) );
  XNOR2X1TS U831 ( .A(d_ff2_Y[29]), .B(n756), .Y(sh_exp_y[6]) );
  AO21XLTS U832 ( .A0(intadd_422_n1), .A1(d_ff2_Y[27]), .B0(n757), .Y(
        sh_exp_y[4]) );
  NOR2XLTS U833 ( .A(d_ff2_X[29]), .B(n759), .Y(n758) );
  XNOR2X1TS U834 ( .A(d_ff2_X[29]), .B(n759), .Y(sh_exp_x[6]) );
  AO21XLTS U835 ( .A0(intadd_421_n1), .A1(d_ff2_X[27]), .B0(n760), .Y(
        sh_exp_x[4]) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule

