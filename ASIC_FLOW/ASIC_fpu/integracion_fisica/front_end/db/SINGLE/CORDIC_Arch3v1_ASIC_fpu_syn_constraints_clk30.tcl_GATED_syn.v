/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:02:30 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4_33 ( CLK, EN, ENCLK, TE
 );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_21 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_23 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_24 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_26 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_27 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_29 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_32 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
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
         enab_d_ff4_Yn, enab_d_ff4_Xn, fmtted_Result_31_, ITER_CONT_net3611507,
         ITER_CONT_N5, ITER_CONT_N4, ITER_CONT_N3, d_ff5_data_out_net3611471,
         reg_Z0_net3611471, reg_val_muxZ_2stage_net3611471,
         reg_shift_y_net3611471, d_ff4_Xn_net3611471, d_ff4_Yn_net3611471,
         d_ff4_Zn_net3611471, n154, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n531, n532, n533, n534, n535, n536,
         n537, intadd_423_CI, intadd_423_n3, intadd_423_n2, intadd_423_n1,
         intadd_424_CI, intadd_424_n3, intadd_424_n2, intadd_424_n1, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790;
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

  SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4_33 ITER_CONT_clk_gate_temp_reg ( 
        .CLK(clk), .EN(enab_cont_iter), .ENCLK(ITER_CONT_net3611507), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_21 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3611471), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_32 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff_RB1), .ENCLK(reg_Z0_net3611471), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_29 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(inst_CORDIC_FSM_v3_state_next[3]), .ENCLK(
        reg_val_muxZ_2stage_net3611471), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_27 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_RB3), .ENCLK(reg_shift_y_net3611471), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_26 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3611471), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_24 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3611471), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_23 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3611471), .TE(1'b0) );
  DFFRXLTS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(
        inst_CORDIC_FSM_v3_state_next[3]), .CK(clk), .RN(n780), .QN(n606) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3611471), .RN(n782), .Q(d_ff1_shift_region_flag_out_0_), 
        .QN(n612) );
  DFFRXLTS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3611471), .RN(n783), .QN(n608) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(n524), .CK(reg_shift_y_net3611471), .RN(n783), 
        .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n534), .CK(reg_shift_y_net3611471), .RN(n788), 
        .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n528), .CK(reg_shift_y_net3611471), .RN(n788), 
        .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n536), .CK(reg_shift_y_net3611471), .RN(n788), 
        .Q(d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(data_out_LUT[4]), .CK(reg_shift_y_net3611471), 
        .RN(n787), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(n525), .CK(reg_shift_y_net3611471), .RN(n780), 
        .Q(d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(n527), .CK(reg_shift_y_net3611471), .RN(n785), 
        .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n531), .CK(reg_shift_y_net3611471), .RN(n784), 
        .Q(d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n756), .CK(reg_shift_y_net3611471), .RN(n780), 
        .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n533), .CK(reg_shift_y_net3611471), .RN(n788), 
        .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n526), .CK(reg_shift_y_net3611471), .RN(n782), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n532), .CK(reg_shift_y_net3611471), .RN(n788), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n523), .CK(reg_shift_y_net3611471), .RN(n783), .Q(d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n535), .CK(reg_shift_y_net3611471), .RN(n785), .Q(d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n537), .CK(reg_shift_y_net3611471), .RN(n784), .Q(d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n522), .CK(reg_shift_y_net3611471), .RN(n780), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n521), .CK(reg_shift_y_net3611471), .RN(n783), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n520), .CK(reg_shift_y_net3611471), .RN(n788), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3611471), .RN(n786), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n529), .CK(reg_shift_y_net3611471), .RN(n789), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3611471), .RN(n769), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3611471), .RN(n786), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3611471), .RN(n778), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3611471), .RN(n779), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3611471), .RN(n781), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3611471), .RN(n789), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3611471), .RN(n154), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3611471), .RN(n786), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3611471), .RN(n778), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3611471), .RN(n779), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3611471), .RN(
        n782), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3611471), .RN(
        n787), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3611471), .RN(
        n788), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3611471), .RN(
        n785), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3611471), .RN(
        n784), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3611471), .RN(
        n780), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3611471), .RN(
        n783), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3611471), .RN(
        n788), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3611471), .RN(
        n787), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3611471), .RN(
        n783), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3611471), .RN(
        n785), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3611471), .RN(
        n784), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3611471), .RN(
        n783), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3611471), .RN(
        n785), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3611471), .RN(
        n784), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3611471), .RN(
        n780), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3611471), .RN(
        n782), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3611471), .RN(
        n783), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3611471), .RN(
        n787), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3611471), .RN(
        n782), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3611471), .RN(
        n785), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3611471), .RN(
        n784), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3611471), .RN(n780), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3611471), .RN(n788), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3611471), .RN(n787), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3611471), .RN(n782), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3611471), .RN(n785), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3611471), .RN(n784), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3611471), .RN(n780), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3611471), .RN(n782), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3611471), .RN(n782), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3611471), .RN(n787), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3611471), .RN(n788), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3611471), .RN(n785), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3611471), .RN(n784), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3611471), .RN(n780), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3611471), .RN(n788), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3611471), .RN(n782), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3611471), .RN(n787), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n783), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3611471), 
        .RN(n785), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3611471), .RN(n784), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n780), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3611471), 
        .RN(n782), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3611471), .RN(n783), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n787), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3611471), 
        .RN(n782), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3611471), .RN(n785), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n781), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3611471), 
        .RN(n789), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3611471), .RN(n154), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n786), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3611471), 
        .RN(n778), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3611471), .RN(n779), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n781), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3611471), 
        .RN(n789), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3611471), .RN(n154), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n786), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3611471), 
        .RN(n778), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3611471), .RN(n779), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n784), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3611471), 
        .RN(n780), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3611471), .RN(n788), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n787), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3611471), 
        .RN(n787), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3611471), .RN(n788), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n785), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3611471), 
        .RN(n784), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3611471), .RN(n780), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n783), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3611471), .RN(n788), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3611471), .RN(n787), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n781), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3611471), .RN(n789), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3611471), .RN(n786), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n778), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3611471), .RN(n779), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3611471), .RN(n781), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n789), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3611471), .RN(n786), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3611471), .RN(n778), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n779), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3611471), .RN(n781), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3611471), .RN(n789), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n786), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3611471), .RN(n778), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3611471), .RN(n779), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n781), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3611471), .RN(n789), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3611471), .RN(n786), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n778), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3611471), .RN(n779), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3611471), .RN(n781), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n789), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3611471), .RN(n786), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3611471), .RN(n778), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n788), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3611471), .RN(n780), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3611471), .RN(n784), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n777), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3611471), .RN(n769), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3611471), .RN(n775), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n768), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3611471), .RN(n767), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3611471), .RN(n768), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n769), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3611471), .RN(n775), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3611471), .RN(n784), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n770), .Q(d_ff2_X[23]), .QN(n614)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3611471), .RN(n776), .Q(d_ff_Xn[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3611471), .RN(n774), .Q(d_ff_Xn[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3611471), .RN(n776), .Q(d_ff_Xn[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3611471), .RN(n774), .Q(d_ff_Xn[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3611471), .RN(n776), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n776), .Q(d_ff2_X[28]), .QN(n762)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3611471), .RN(n771), .Q(d_ff_Xn[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3611471), .RN(n773), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n772), .Q(d_ff2_X[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3611471), .RN(n777), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n776), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3611471), .RN(n777), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3611471), .RN(n777), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n770), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3611471), 
        .RN(n773), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(mux_sal[0]), .CK(
        d_ff5_data_out_net3611471), .RN(n777), .Q(data_output[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3611471), .RN(n776), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n772), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3611471), 
        .RN(n773), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(mux_sal[1]), .CK(
        d_ff5_data_out_net3611471), .RN(n765), .Q(data_output[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3611471), .RN(n769), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n775), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3611471), 
        .RN(n776), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(mux_sal[2]), .CK(
        d_ff5_data_out_net3611471), .RN(n785), .Q(data_output[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3611471), .RN(n780), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n769), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3611471), 
        .RN(n775), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(mux_sal[3]), .CK(
        d_ff5_data_out_net3611471), .RN(n773), .Q(data_output[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3611471), .RN(n784), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n767), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3611471), 
        .RN(n770), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(mux_sal[4]), .CK(
        d_ff5_data_out_net3611471), .RN(n776), .Q(data_output[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3611471), .RN(n772), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n773), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3611471), 
        .RN(n771), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(mux_sal[5]), .CK(
        d_ff5_data_out_net3611471), .RN(n774), .Q(data_output[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3611471), .RN(n771), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n771), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3611471), 
        .RN(n774), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(mux_sal[6]), .CK(
        d_ff5_data_out_net3611471), .RN(n777), .Q(data_output[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3611471), .RN(n773), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n770), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3611471), 
        .RN(n776), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(mux_sal[7]), .CK(
        d_ff5_data_out_net3611471), .RN(n774), .Q(data_output[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3611471), .RN(n771), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n776), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3611471), 
        .RN(n771), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(mux_sal[8]), .CK(
        d_ff5_data_out_net3611471), .RN(n773), .Q(data_output[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3611471), .RN(n772), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n774), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3611471), 
        .RN(n777), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(mux_sal[9]), .CK(
        d_ff5_data_out_net3611471), .RN(n774), .Q(data_output[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3611471), .RN(n774), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n774), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3611471), .RN(n772), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(mux_sal[10]), .CK(
        d_ff5_data_out_net3611471), .RN(n771), .Q(data_output[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3611471), .RN(n777), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n773), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3611471), .RN(n774), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(mux_sal[11]), .CK(
        d_ff5_data_out_net3611471), .RN(n770), .Q(data_output[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3611471), .RN(n776), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n772), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3611471), .RN(n770), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(mux_sal[12]), .CK(
        d_ff5_data_out_net3611471), .RN(n772), .Q(data_output[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3611471), .RN(n773), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n777), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3611471), .RN(n776), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(mux_sal[13]), .CK(
        d_ff5_data_out_net3611471), .RN(n773), .Q(data_output[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3611471), .RN(n770), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n771), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3611471), .RN(n771), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(mux_sal[14]), .CK(
        d_ff5_data_out_net3611471), .RN(n777), .Q(data_output[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3611471), .RN(n772), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n774), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3611471), .RN(n773), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(mux_sal[15]), .CK(
        d_ff5_data_out_net3611471), .RN(n776), .Q(data_output[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3611471), .RN(n770), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n772), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3611471), .RN(n780), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(mux_sal[16]), .CK(
        d_ff5_data_out_net3611471), .RN(n768), .Q(data_output[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3611471), .RN(n767), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n773), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3611471), .RN(n769), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(mux_sal[17]), .CK(
        d_ff5_data_out_net3611471), .RN(n775), .Q(data_output[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3611471), .RN(n767), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n784), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3611471), .RN(n785), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(mux_sal[18]), .CK(
        d_ff5_data_out_net3611471), .RN(n774), .Q(data_output[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3611471), .RN(n769), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n775), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3611471), .RN(n773), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(mux_sal[19]), .CK(
        d_ff5_data_out_net3611471), .RN(n777), .Q(data_output[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3611471), .RN(n774), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n777), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3611471), .RN(n774), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(mux_sal[20]), .CK(
        d_ff5_data_out_net3611471), .RN(n770), .Q(data_output[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3611471), .RN(n773), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n771), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3611471), .RN(n772), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(mux_sal[21]), .CK(
        d_ff5_data_out_net3611471), .RN(n777), .Q(data_output[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3611471), .RN(n770), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n777), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3611471), .RN(n769), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(mux_sal[22]), .CK(
        d_ff5_data_out_net3611471), .RN(n776), .Q(data_output[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3611471), .RN(n769), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n775), .Q(d_ff2_Y[23]), .QN(n613)
         );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(mux_sal[23]), .CK(
        d_ff5_data_out_net3611471), .RN(n765), .Q(data_output[23]) );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3611471), .RN(n765), .Q(d_ff_Yn[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(mux_sal[24]), .CK(
        d_ff5_data_out_net3611471), .RN(n780), .Q(data_output[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3611471), .RN(n785), .Q(d_ff_Yn[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(mux_sal[25]), .CK(
        d_ff5_data_out_net3611471), .RN(n769), .Q(data_output[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3611471), .RN(n775), .Q(d_ff_Yn[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(mux_sal[26]), .CK(
        d_ff5_data_out_net3611471), .RN(n769), .Q(data_output[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3611471), .RN(n775), .Q(d_ff_Yn[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(mux_sal[27]), .CK(
        d_ff5_data_out_net3611471), .RN(n774), .Q(data_output[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3611471), .RN(n768), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n764), .Q(d_ff2_Y[28]), .QN(n763)
         );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(mux_sal[28]), .CK(
        d_ff5_data_out_net3611471), .RN(n769), .Q(data_output[28]) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3611471), .RN(n775), .Q(d_ff_Yn[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(mux_sal[29]), .CK(
        d_ff5_data_out_net3611471), .RN(n777), .Q(data_output[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3611471), .RN(n765), .Q(d_ff_Yn[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(mux_sal[30]), .CK(
        d_ff5_data_out_net3611471), .RN(n768), .Q(data_output[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3611471), .RN(n768), .Q(d_ff_Yn[31]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(fmtted_Result_31_), .CK(
        d_ff5_data_out_net3611471), .RN(n768), .Q(data_output[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n768), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3611471), .RN(n768), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3611471), .RN(n768), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n768), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3611471), .RN(n768), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n768), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3611471), .RN(n768), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n768), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3611471), .RN(n767), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n767), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3611471), .RN(n767), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n767), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3611471), .RN(n767), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n767), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3611471), .RN(n767), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n767), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3611471), .RN(n767), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n767), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3611471), .RN(n767), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n767), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3611471), .RN(n766), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n790), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3611471), .RN(n764), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n766), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3611471), .RN(n790), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n764), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3611471), .RN(n766), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n790), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3611471), .RN(n764), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n766), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3611471), .RN(n790), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n764), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3611471), .RN(n765), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n765), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3611471), .RN(n765), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n765), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3611471), .RN(n765), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n765), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3611471), .RN(n765), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n765), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3611471), .RN(n765), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n765), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3611471), .RN(n765), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n765), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3611471), .RN(n766), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n790), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3611471), .RN(n764), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n154), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3611471), .RN(n154), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n154), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3611471), .RN(n154), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n154), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3611471), .RN(n154), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n154), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3611471), .RN(n154), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n766), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3611471), .RN(n766), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n790), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3611471), .RN(n764), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n766), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3611471), .RN(n790), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n764), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3611471), .RN(n766), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n790), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3611471), .RN(n764), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n766), .Q(d_ff2_Z[31]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[31]), .CK(reg_shift_y_net3611471), 
        .RN(n790), .Q(d_ff3_sign_out) );
  DFFSX2TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(clk), .SN(n790), .Q(
        inst_CORDIC_FSM_v3_state_reg[0]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(1'b1), .CK(reg_shift_y_net3611471), .RN(n764), .Q(d_ff3_LUT_out[27]) );
  DFFRX1TS VAR_CONT_temp_reg_1_ ( .D(n519), .CK(clk), .RN(n781), .Q(
        cont_var_out[1]), .QN(n760) );
  DFFRX2TS VAR_CONT_temp_reg_0_ ( .D(n518), .CK(clk), .RN(n786), .Q(
        cont_var_out[0]), .QN(n759) );
  DFFRX2TS ITER_CONT_temp_reg_0_ ( .D(n758), .CK(ITER_CONT_net3611507), .RN(
        n778), .Q(cont_iter_out[0]), .QN(n758) );
  DFFRX2TS ITER_CONT_temp_reg_3_ ( .D(ITER_CONT_N5), .CK(ITER_CONT_net3611507), 
        .RN(n781), .Q(cont_iter_out[3]), .QN(n757) );
  DFFRX2TS ITER_CONT_temp_reg_2_ ( .D(ITER_CONT_N4), .CK(ITER_CONT_net3611507), 
        .RN(n779), .Q(cont_iter_out[2]), .QN(n756) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(clk), .RN(n779), .Q(
        inst_CORDIC_FSM_v3_state_reg[7]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(clk), .RN(n785), .Q(
        inst_CORDIC_FSM_v3_state_reg[1]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(clk), .RN(n778), .Q(
        inst_CORDIC_FSM_v3_state_reg[5]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n773), .Q(d_ff2_X[27]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n154), .Q(d_ff2_Y[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n776), .Q(d_ff2_X[29]) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3611471), 
        .RN(n784), .Q(d_ff1_operation_out) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n773), .Q(d_ff2_Y[29]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(clk), .RN(n154), .Q(
        inst_CORDIC_FSM_v3_state_reg[4]) );
  DFFRX4TS ITER_CONT_temp_reg_1_ ( .D(ITER_CONT_N3), .CK(ITER_CONT_net3611507), 
        .RN(n789), .Q(cont_iter_out[1]), .QN(n761) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n774), .Q(d_ff2_X[24]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n776), .Q(d_ff2_X[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n777), .Q(d_ff2_X[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n785), .Q(d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n775), .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n769), .Q(d_ff2_Y[24]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(
        inst_CORDIC_FSM_v3_state_next[2]), .CK(clk), .RN(n788), .Q(
        inst_CORDIC_FSM_v3_state_reg[2]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(clk), .RN(n154), .Q(
        inst_CORDIC_FSM_v3_state_reg[6]) );
  ADDFX1TS intadd_423_U4 ( .A(n761), .B(d_ff2_X[24]), .CI(intadd_423_CI), .CO(
        intadd_423_n3), .S(sh_exp_x[1]) );
  ADDFX1TS intadd_424_U4 ( .A(d_ff2_Y[24]), .B(n761), .CI(intadd_424_CI), .CO(
        intadd_424_n3), .S(sh_exp_y[1]) );
  ADDFX1TS intadd_424_U3 ( .A(d_ff2_Y[25]), .B(n756), .CI(intadd_424_n3), .CO(
        intadd_424_n2), .S(sh_exp_y[2]) );
  ADDFX1TS intadd_423_U3 ( .A(d_ff2_X[25]), .B(n756), .CI(intadd_423_n3), .CO(
        intadd_423_n2), .S(sh_exp_x[2]) );
  ADDFX1TS intadd_423_U2 ( .A(d_ff2_X[26]), .B(n757), .CI(intadd_423_n2), .CO(
        intadd_423_n1), .S(sh_exp_x[3]) );
  ADDFX1TS intadd_424_U2 ( .A(d_ff2_Y[26]), .B(n757), .CI(intadd_424_n2), .CO(
        intadd_424_n1), .S(sh_exp_y[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3611471), .RN(n768), .Q(d_ff2_Y[30]) );
  AOI222X1TS U407 ( .A0(n739), .A1(d_ff2_X[30]), .B0(n691), .B1(d_ff2_Y[30]), 
        .C0(n741), .C1(d_ff2_Z[30]), .Y(n680) );
  NAND3BX1TS U408 ( .AN(inst_CORDIC_FSM_v3_state_reg[6]), .B(n628), .C(
        inst_CORDIC_FSM_v3_state_reg[4]), .Y(n721) );
  CLKINVX6TS U409 ( .A(n708), .Y(n605) );
  OR2X4TS U410 ( .A(cont_iter_out[2]), .B(n698), .Y(n615) );
  OR2X2TS U411 ( .A(n760), .B(cont_var_out[0]), .Y(n659) );
  CLKINVX6TS U412 ( .A(rst), .Y(n154) );
  NAND2BXLTS U413 ( .AN(n611), .B(n635), .Y(n623) );
  NAND3XLTS U414 ( .A(n721), .B(n694), .C(n697), .Y(n748) );
  AOI222X1TS U415 ( .A0(n734), .A1(d_ff3_sh_y_out[0]), .B0(n691), .B1(
        d_ff3_sh_x_out[0]), .C0(n741), .C1(d_ff3_LUT_out[0]), .Y(n682) );
  AOI222X1TS U416 ( .A0(n739), .A1(d_ff3_sh_y_out[1]), .B0(n691), .B1(
        d_ff3_sh_x_out[1]), .C0(n736), .C1(d_ff3_LUT_out[1]), .Y(n675) );
  AOI222X1TS U417 ( .A0(n725), .A1(d_ff3_sh_y_out[2]), .B0(n691), .B1(
        d_ff3_sh_x_out[2]), .C0(n741), .C1(d_ff3_LUT_out[2]), .Y(n676) );
  AOI222X1TS U418 ( .A0(n734), .A1(d_ff3_sh_y_out[4]), .B0(n691), .B1(
        d_ff3_sh_x_out[4]), .C0(n736), .C1(d_ff3_LUT_out[4]), .Y(n670) );
  AOI222X1TS U419 ( .A0(n739), .A1(d_ff2_X[0]), .B0(n691), .B1(d_ff2_Y[0]), 
        .C0(n736), .C1(d_ff2_Z[0]), .Y(n684) );
  AOI222X1TS U420 ( .A0(n734), .A1(d_ff2_X[11]), .B0(n687), .B1(d_ff2_Y[11]), 
        .C0(n741), .C1(d_ff2_Z[11]), .Y(n645) );
  AOI222X1TS U421 ( .A0(n734), .A1(d_ff2_X[14]), .B0(n687), .B1(d_ff2_Y[14]), 
        .C0(n736), .C1(d_ff2_Z[14]), .Y(n643) );
  AOI222X1TS U422 ( .A0(n739), .A1(d_ff2_X[16]), .B0(n687), .B1(d_ff2_Y[16]), 
        .C0(n690), .C1(d_ff2_Z[16]), .Y(n644) );
  AOI222X1TS U423 ( .A0(n739), .A1(d_ff2_X[18]), .B0(n687), .B1(d_ff2_Y[18]), 
        .C0(n741), .C1(d_ff2_Z[18]), .Y(n646) );
  AOI222X1TS U424 ( .A0(n734), .A1(d_ff2_X[20]), .B0(n687), .B1(d_ff2_Y[20]), 
        .C0(n736), .C1(d_ff2_Z[20]), .Y(n652) );
  AOI222X1TS U425 ( .A0(n725), .A1(d_ff2_X[22]), .B0(n687), .B1(d_ff2_Y[22]), 
        .C0(n690), .C1(d_ff2_Z[22]), .Y(n651) );
  AOI222X1TS U426 ( .A0(n739), .A1(d_ff2_X[24]), .B0(n691), .B1(d_ff2_Y[24]), 
        .C0(n741), .C1(d_ff2_Z[24]), .Y(n672) );
  AOI222X1TS U427 ( .A0(n734), .A1(d_ff2_X[25]), .B0(n691), .B1(d_ff2_Y[25]), 
        .C0(n690), .C1(d_ff2_Z[25]), .Y(n689) );
  AOI222X1TS U428 ( .A0(n725), .A1(d_ff2_X[26]), .B0(n691), .B1(d_ff2_Y[26]), 
        .C0(n690), .C1(d_ff2_Z[26]), .Y(n693) );
  AOI222X1TS U429 ( .A0(n739), .A1(d_ff2_X[27]), .B0(n691), .B1(d_ff2_Y[27]), 
        .C0(n736), .C1(d_ff2_Z[27]), .Y(n685) );
  AOI222X1TS U430 ( .A0(n734), .A1(d_ff2_X[29]), .B0(n691), .B1(d_ff2_Y[29]), 
        .C0(n690), .C1(d_ff2_Z[29]), .Y(n673) );
  OR4X2TS U431 ( .A(n611), .B(inst_CORDIC_FSM_v3_state_reg[1]), .C(
        inst_CORDIC_FSM_v3_state_reg[0]), .D(inst_CORDIC_FSM_v3_state_reg[5]), 
        .Y(n607) );
  INVX2TS U432 ( .A(n607), .Y(n609) );
  NAND3X2TS U433 ( .A(n757), .B(n758), .C(n761), .Y(n698) );
  NOR2X2TS U434 ( .A(n697), .B(n659), .Y(enab_d_ff4_Zn) );
  BUFX4TS U435 ( .A(n766), .Y(n768) );
  BUFX6TS U436 ( .A(n154), .Y(n769) );
  BUFX4TS U437 ( .A(n771), .Y(n788) );
  BUFX4TS U438 ( .A(n789), .Y(n785) );
  BUFX4TS U439 ( .A(n781), .Y(n784) );
  BUFX4TS U440 ( .A(n779), .Y(n780) );
  BUFX4TS U441 ( .A(n769), .Y(n776) );
  BUFX4TS U442 ( .A(n769), .Y(n777) );
  BUFX4TS U443 ( .A(n769), .Y(n774) );
  BUFX4TS U444 ( .A(n770), .Y(n773) );
  NOR2X4TS U445 ( .A(n756), .B(n757), .Y(n742) );
  BUFX6TS U446 ( .A(n642), .Y(n741) );
  BUFX6TS U447 ( .A(n642), .Y(n690) );
  BUFX4TS U448 ( .A(n642), .Y(n736) );
  INVX2TS U449 ( .A(n608), .Y(n610) );
  INVX2TS U450 ( .A(n606), .Y(n611) );
  CLKINVX3TS U451 ( .A(n615), .Y(n710) );
  CLKINVX6TS U452 ( .A(n708), .Y(n707) );
  INVX2TS U453 ( .A(n708), .Y(n706) );
  INVX4TS U454 ( .A(n696), .Y(n692) );
  CLKINVX6TS U455 ( .A(n696), .Y(n734) );
  CLKINVX3TS U456 ( .A(n696), .Y(n725) );
  CLKINVX6TS U457 ( .A(n696), .Y(n739) );
  CLKINVX6TS U458 ( .A(n659), .Y(n738) );
  CLKINVX6TS U459 ( .A(n659), .Y(n733) );
  AOI222X1TS U460 ( .A0(n734), .A1(d_ff2_X[28]), .B0(n691), .B1(d_ff2_Y[28]), 
        .C0(n690), .C1(d_ff2_Z[28]), .Y(n686) );
  INVX3TS U461 ( .A(n659), .Y(n691) );
  NOR3BX2TS U462 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(n621), .Y(ready_cordic) );
  NOR3BX2TS U463 ( .AN(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[7]), .C(n621), .Y(
        inst_CORDIC_FSM_v3_state_next[3]) );
  NOR2X4TS U464 ( .A(n758), .B(n761), .Y(n724) );
  BUFX4TS U465 ( .A(n764), .Y(n765) );
  BUFX4TS U466 ( .A(n790), .Y(n767) );
  BUFX3TS U467 ( .A(n154), .Y(n790) );
  OAI32X4TS U468 ( .A0(n612), .A1(d_ff1_operation_out), .A2(n610), .B0(
        d_ff1_shift_region_flag_out_0_), .B1(n701), .Y(n702) );
  AOI21X2TS U469 ( .A0(cont_iter_out[2]), .A1(n757), .B0(n616), .Y(n637) );
  NAND4BXLTS U470 ( .AN(inst_CORDIC_FSM_v3_state_reg[1]), .B(n611), .C(n636), 
        .D(n635), .Y(n638) );
  INVX4TS U471 ( .A(n714), .Y(n713) );
  CLKINVX3TS U472 ( .A(n700), .Y(n714) );
  INVX3TS U473 ( .A(n659), .Y(n687) );
  NOR2XLTS U474 ( .A(n697), .B(n696), .Y(enab_d_ff4_Yn) );
  OR2X1TS U475 ( .A(d_ff_Xn[28]), .B(n710), .Y(first_mux_X[28]) );
  OR2X1TS U476 ( .A(d_ff_Xn[20]), .B(n706), .Y(first_mux_X[20]) );
  OR2X1TS U477 ( .A(d_ff_Xn[14]), .B(n605), .Y(first_mux_X[14]) );
  OR2X1TS U478 ( .A(d_ff_Xn[1]), .B(n707), .Y(first_mux_X[1]) );
  OAI21XLTS U479 ( .A0(n755), .A1(n762), .B0(n754), .Y(sh_exp_x[5]) );
  OAI21XLTS U480 ( .A0(cont_iter_out[0]), .A1(n537), .B0(n747), .Y(n521) );
  OAI21XLTS U481 ( .A0(cont_iter_out[1]), .A1(n744), .B0(n637), .Y(n534) );
  NOR2X1TS U482 ( .A(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[6]), .Y(n622) );
  NAND2X1TS U483 ( .A(n609), .B(n622), .Y(n621) );
  INVX2TS U484 ( .A(ready_add_subt), .Y(n697) );
  NAND2X1TS U485 ( .A(n724), .B(n756), .Y(n630) );
  OAI31X1TS U486 ( .A0(cont_iter_out[3]), .A1(cont_iter_out[1]), .A2(n756), 
        .B0(n630), .Y(n528) );
  INVX2TS U487 ( .A(n742), .Y(n537) );
  OAI31X4TS U488 ( .A0(cont_iter_out[2]), .A1(cont_iter_out[3]), .A2(n758), 
        .B0(n537), .Y(n744) );
  NAND2X1TS U489 ( .A(n756), .B(cont_iter_out[3]), .Y(n631) );
  OAI21XLTS U490 ( .A0(n761), .A1(n744), .B0(n631), .Y(n532) );
  INVX2TS U491 ( .A(n631), .Y(n616) );
  NAND2X1TS U492 ( .A(n537), .B(cont_iter_out[0]), .Y(n747) );
  INVX2TS U493 ( .A(n747), .Y(n746) );
  NOR2X1TS U494 ( .A(n616), .B(n746), .Y(n743) );
  OAI211X1TS U495 ( .A0(cont_iter_out[3]), .A1(n758), .B0(n756), .C0(n761), 
        .Y(n745) );
  OAI21XLTS U496 ( .A0(n743), .A1(n761), .B0(n745), .Y(n526) );
  BUFX3TS U497 ( .A(n154), .Y(n775) );
  BUFX3TS U498 ( .A(n769), .Y(n772) );
  BUFX3TS U499 ( .A(n769), .Y(n771) );
  BUFX3TS U500 ( .A(n790), .Y(n778) );
  BUFX3TS U501 ( .A(n764), .Y(n779) );
  BUFX3TS U502 ( .A(n770), .Y(n781) );
  BUFX3TS U503 ( .A(n772), .Y(n782) );
  BUFX3TS U504 ( .A(n771), .Y(n789) );
  BUFX3TS U505 ( .A(n154), .Y(n764) );
  BUFX3TS U506 ( .A(n154), .Y(n766) );
  BUFX3TS U507 ( .A(n772), .Y(n786) );
  BUFX3TS U508 ( .A(n769), .Y(n770) );
  BUFX3TS U509 ( .A(n766), .Y(n783) );
  BUFX3TS U510 ( .A(n769), .Y(n787) );
  BUFX3TS U511 ( .A(n615), .Y(n709) );
  INVX4TS U512 ( .A(n709), .Y(n718) );
  BUFX3TS U513 ( .A(n615), .Y(n708) );
  AO22XLTS U514 ( .A0(n718), .A1(d_ff1_Z[0]), .B0(n708), .B1(d_ff_Zn[0]), .Y(
        first_mux_Z[0]) );
  AO22XLTS U515 ( .A0(n718), .A1(d_ff1_Z[29]), .B0(n708), .B1(d_ff_Zn[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U516 ( .A0(n718), .A1(d_ff1_Z[30]), .B0(n708), .B1(d_ff_Zn[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U517 ( .A0(n718), .A1(d_ff1_Z[31]), .B0(n708), .B1(d_ff_Zn[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U518 ( .A0(n718), .A1(d_ff1_Z[28]), .B0(n615), .B1(d_ff_Zn[28]), 
        .Y(first_mux_Z[28]) );
  NAND2X1TS U519 ( .A(n637), .B(n747), .Y(n523) );
  OR2X2TS U520 ( .A(n759), .B(cont_var_out[1]), .Y(n696) );
  AOI22X1TS U521 ( .A0(n739), .A1(d_ff3_sh_y_out[20]), .B0(n733), .B1(
        d_ff3_sh_x_out[20]), .Y(n617) );
  NAND2X1TS U522 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .Y(n720) );
  INVX2TS U523 ( .A(n720), .Y(n642) );
  NAND2X1TS U524 ( .A(n741), .B(d_ff3_LUT_out[15]), .Y(n619) );
  NAND2X1TS U525 ( .A(n617), .B(n619), .Y(add_subt_dataB[20]) );
  AOI22X1TS U526 ( .A0(n734), .A1(d_ff3_sh_y_out[15]), .B0(n733), .B1(
        d_ff3_sh_x_out[15]), .Y(n618) );
  NAND2X1TS U527 ( .A(n618), .B(n619), .Y(add_subt_dataB[15]) );
  AOI22X1TS U528 ( .A0(n739), .A1(d_ff3_sh_y_out[17]), .B0(n733), .B1(
        d_ff3_sh_x_out[17]), .Y(n620) );
  NAND2X1TS U529 ( .A(n620), .B(n619), .Y(add_subt_dataB[17]) );
  NOR3BX1TS U530 ( .AN(n622), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[2]), .Y(n635) );
  NOR2X1TS U531 ( .A(inst_CORDIC_FSM_v3_state_reg[0]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .Y(n636) );
  NAND3BXLTS U532 ( .AN(n623), .B(inst_CORDIC_FSM_v3_state_reg[1]), .C(n636), 
        .Y(n633) );
  NOR2X1TS U533 ( .A(inst_CORDIC_FSM_v3_state_reg[1]), .B(n623), .Y(n629) );
  NAND3BX1TS U534 ( .AN(inst_CORDIC_FSM_v3_state_reg[5]), .B(
        inst_CORDIC_FSM_v3_state_reg[0]), .C(n629), .Y(n719) );
  NAND2X1TS U535 ( .A(n633), .B(n719), .Y(enab_d_ff_RB1) );
  AOI22X1TS U536 ( .A0(n725), .A1(d_ff3_sh_y_out[28]), .B0(n733), .B1(
        d_ff3_sh_x_out[28]), .Y(n624) );
  NAND2X1TS U537 ( .A(n690), .B(d_ff3_LUT_out[27]), .Y(n626) );
  NAND2X1TS U538 ( .A(n624), .B(n626), .Y(add_subt_dataB[28]) );
  AOI22X1TS U539 ( .A0(n734), .A1(d_ff3_sh_y_out[29]), .B0(n733), .B1(
        d_ff3_sh_x_out[29]), .Y(n625) );
  NAND2X1TS U540 ( .A(n625), .B(n626), .Y(add_subt_dataB[29]) );
  AOI22X1TS U541 ( .A0(n739), .A1(d_ff3_sh_y_out[27]), .B0(n733), .B1(
        d_ff3_sh_x_out[27]), .Y(n627) );
  NAND2X1TS U542 ( .A(n627), .B(n626), .Y(add_subt_dataB[27]) );
  NOR3BX1TS U543 ( .AN(n609), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[2]), .Y(n628) );
  NAND3BX1TS U544 ( .AN(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[6]), .C(n628), .Y(n694) );
  INVX2TS U545 ( .A(n694), .Y(enab_cont_iter) );
  NAND3BX1TS U546 ( .AN(inst_CORDIC_FSM_v3_state_reg[0]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(n629), .Y(n722) );
  NAND2X1TS U547 ( .A(n721), .B(n722), .Y(beg_add_subt) );
  NAND2X1TS U548 ( .A(n613), .B(cont_iter_out[0]), .Y(intadd_424_CI) );
  OAI21XLTS U549 ( .A0(cont_iter_out[0]), .A1(n613), .B0(intadd_424_CI), .Y(
        sh_exp_y[0]) );
  NAND2X1TS U550 ( .A(n614), .B(cont_iter_out[0]), .Y(intadd_423_CI) );
  OAI21XLTS U551 ( .A0(cont_iter_out[0]), .A1(n614), .B0(intadd_423_CI), .Y(
        sh_exp_x[0]) );
  NOR2X1TS U552 ( .A(cont_iter_out[0]), .B(cont_iter_out[1]), .Y(n632) );
  NOR2XLTS U553 ( .A(n724), .B(n632), .Y(ITER_CONT_N3) );
  OAI21XLTS U554 ( .A0(n742), .A1(cont_iter_out[1]), .B0(n637), .Y(n536) );
  OAI211XLTS U555 ( .A0(n632), .A1(n631), .B0(n630), .C0(n698), .Y(n527) );
  NOR2X1TS U556 ( .A(d_ff2_Y[27]), .B(intadd_424_n1), .Y(n752) );
  OR3X1TS U557 ( .A(d_ff2_Y[28]), .B(d_ff2_Y[27]), .C(intadd_424_n1), .Y(n751)
         );
  OAI21XLTS U558 ( .A0(n752), .A1(n763), .B0(n751), .Y(sh_exp_y[5]) );
  NOR2X1TS U559 ( .A(d_ff2_X[27]), .B(intadd_423_n1), .Y(n755) );
  OR3X1TS U560 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(intadd_423_n1), .Y(n754)
         );
  NAND2X1TS U561 ( .A(cont_iter_out[2]), .B(n724), .Y(n723) );
  CLKAND2X2TS U562 ( .A(n723), .B(n757), .Y(n529) );
  NOR2X1TS U563 ( .A(n757), .B(n723), .Y(n634) );
  NOR2XLTS U564 ( .A(n634), .B(n529), .Y(ITER_CONT_N5) );
  OR2X1TS U565 ( .A(d_ff_Xn[24]), .B(n710), .Y(first_mux_X[24]) );
  OR2X1TS U566 ( .A(d_ff_Xn[27]), .B(n710), .Y(first_mux_X[27]) );
  OR2X1TS U567 ( .A(d_ff_Xn[25]), .B(n710), .Y(first_mux_X[25]) );
  OR2X1TS U568 ( .A(d_ff_Xn[29]), .B(n710), .Y(first_mux_X[29]) );
  OR2X1TS U569 ( .A(d_ff_Xn[26]), .B(n710), .Y(first_mux_X[26]) );
  OR2X1TS U570 ( .A(d_ff_Xn[7]), .B(n710), .Y(first_mux_X[7]) );
  OR2X1TS U571 ( .A(d_ff_Xn[13]), .B(n710), .Y(first_mux_X[13]) );
  OAI21XLTS U572 ( .A0(n634), .A1(n694), .B0(n633), .Y(
        inst_CORDIC_FSM_v3_state_next[2]) );
  OR2X1TS U573 ( .A(d_ff_Xn[2]), .B(n707), .Y(first_mux_X[2]) );
  OR2X1TS U574 ( .A(d_ff_Xn[5]), .B(n706), .Y(first_mux_X[5]) );
  OR2X1TS U575 ( .A(d_ff_Xn[17]), .B(n605), .Y(first_mux_X[17]) );
  OR2X1TS U576 ( .A(d_ff_Xn[3]), .B(n707), .Y(first_mux_X[3]) );
  OR2X1TS U577 ( .A(d_ff_Xn[10]), .B(n707), .Y(first_mux_X[10]) );
  OR2X1TS U578 ( .A(d_ff_Xn[6]), .B(n706), .Y(first_mux_X[6]) );
  OR2X1TS U579 ( .A(d_ff_Xn[16]), .B(n605), .Y(first_mux_X[16]) );
  OR2X1TS U580 ( .A(d_ff_Xn[12]), .B(n707), .Y(first_mux_X[12]) );
  OR2X1TS U581 ( .A(d_ff_Xn[19]), .B(n707), .Y(first_mux_X[19]) );
  OAI21XLTS U582 ( .A0(n741), .A1(n721), .B0(n638), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  OAI21X1TS U583 ( .A0(n742), .A1(n761), .B0(n637), .Y(n535) );
  OR2X1TS U584 ( .A(n535), .B(n746), .Y(n522) );
  INVX2TS U585 ( .A(ready_cordic), .Y(n705) );
  NAND3XLTS U586 ( .A(enab_cont_iter), .B(n742), .C(n724), .Y(n704) );
  OAI21XLTS U587 ( .A0(ack_cordic), .A1(n705), .B0(n704), .Y(
        inst_CORDIC_FSM_v3_state_next[7]) );
  INVX2TS U588 ( .A(n638), .Y(enab_RB3) );
  NOR4X1TS U589 ( .A(enab_cont_iter), .B(enab_RB3), .C(enab_d_ff_RB1), .D(
        beg_add_subt), .Y(n640) );
  INVX2TS U590 ( .A(inst_CORDIC_FSM_v3_state_next[3]), .Y(n639) );
  AOI32X1TS U591 ( .A0(n640), .A1(n705), .A2(n639), .B0(ready_cordic), .B1(
        ack_cordic), .Y(n641) );
  OAI21XLTS U592 ( .A0(beg_fsm_cordic), .A1(n719), .B0(n641), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  INVX2TS U593 ( .A(n643), .Y(add_subt_dataA[14]) );
  INVX2TS U594 ( .A(n644), .Y(add_subt_dataA[16]) );
  INVX2TS U595 ( .A(n645), .Y(add_subt_dataA[11]) );
  INVX2TS U596 ( .A(n646), .Y(add_subt_dataA[18]) );
  AOI222X1TS U597 ( .A0(n734), .A1(d_ff2_X[4]), .B0(n738), .B1(d_ff2_Y[4]), 
        .C0(n741), .C1(d_ff2_Z[4]), .Y(n647) );
  INVX2TS U598 ( .A(n647), .Y(add_subt_dataA[4]) );
  AOI222X1TS U599 ( .A0(n739), .A1(d_ff2_X[2]), .B0(n738), .B1(d_ff2_Y[2]), 
        .C0(n736), .C1(d_ff2_Z[2]), .Y(n648) );
  INVX2TS U600 ( .A(n648), .Y(add_subt_dataA[2]) );
  AOI222X1TS U601 ( .A0(n734), .A1(d_ff2_X[9]), .B0(n738), .B1(d_ff2_Y[9]), 
        .C0(n690), .C1(d_ff2_Z[9]), .Y(n649) );
  INVX2TS U602 ( .A(n649), .Y(add_subt_dataA[9]) );
  AOI222X1TS U603 ( .A0(n739), .A1(d_ff2_X[10]), .B0(n738), .B1(d_ff2_Y[10]), 
        .C0(n690), .C1(d_ff2_Z[10]), .Y(n650) );
  INVX2TS U604 ( .A(n650), .Y(add_subt_dataA[10]) );
  INVX2TS U605 ( .A(n651), .Y(add_subt_dataA[22]) );
  INVX2TS U606 ( .A(n652), .Y(add_subt_dataA[20]) );
  AOI222X1TS U607 ( .A0(n734), .A1(d_ff2_X[1]), .B0(n738), .B1(d_ff2_Y[1]), 
        .C0(n741), .C1(d_ff2_Z[1]), .Y(n653) );
  INVX2TS U608 ( .A(n653), .Y(add_subt_dataA[1]) );
  AOI222X1TS U609 ( .A0(n725), .A1(d_ff2_X[7]), .B0(n738), .B1(d_ff2_Y[7]), 
        .C0(n736), .C1(d_ff2_Z[7]), .Y(n654) );
  INVX2TS U610 ( .A(n654), .Y(add_subt_dataA[7]) );
  AOI222X1TS U611 ( .A0(n739), .A1(d_ff2_X[6]), .B0(n738), .B1(d_ff2_Y[6]), 
        .C0(n736), .C1(d_ff2_Z[6]), .Y(n655) );
  INVX2TS U612 ( .A(n655), .Y(add_subt_dataA[6]) );
  AOI222X1TS U613 ( .A0(n734), .A1(d_ff2_X[3]), .B0(n738), .B1(d_ff2_Y[3]), 
        .C0(n736), .C1(d_ff2_Z[3]), .Y(n656) );
  INVX2TS U614 ( .A(n656), .Y(add_subt_dataA[3]) );
  AOI222X1TS U615 ( .A0(n725), .A1(d_ff2_X[8]), .B0(n738), .B1(d_ff2_Y[8]), 
        .C0(n690), .C1(d_ff2_Z[8]), .Y(n657) );
  INVX2TS U616 ( .A(n657), .Y(add_subt_dataA[8]) );
  AOI222X1TS U617 ( .A0(n739), .A1(d_ff2_X[5]), .B0(n738), .B1(d_ff2_Y[5]), 
        .C0(n690), .C1(d_ff2_Z[5]), .Y(n658) );
  INVX2TS U618 ( .A(n658), .Y(add_subt_dataA[5]) );
  AOI222X1TS U619 ( .A0(n692), .A1(d_ff3_sh_y_out[24]), .B0(n738), .B1(
        d_ff3_sh_x_out[24]), .C0(n690), .C1(d_ff3_LUT_out[24]), .Y(n660) );
  INVX2TS U620 ( .A(n660), .Y(add_subt_dataB[24]) );
  AOI222X1TS U621 ( .A0(n692), .A1(d_ff3_sh_y_out[21]), .B0(n738), .B1(
        d_ff3_sh_x_out[21]), .C0(n741), .C1(d_ff3_LUT_out[21]), .Y(n661) );
  INVX2TS U622 ( .A(n661), .Y(add_subt_dataB[21]) );
  AOI222X1TS U623 ( .A0(n692), .A1(d_ff3_sh_y_out[9]), .B0(n738), .B1(
        d_ff3_sh_x_out[9]), .C0(n736), .C1(d_ff3_LUT_out[9]), .Y(n662) );
  INVX2TS U624 ( .A(n662), .Y(add_subt_dataB[9]) );
  AOI222X1TS U625 ( .A0(n692), .A1(d_ff3_sh_y_out[26]), .B0(n738), .B1(
        d_ff3_sh_x_out[26]), .C0(n741), .C1(d_ff3_LUT_out[26]), .Y(n663) );
  INVX2TS U626 ( .A(n663), .Y(add_subt_dataB[26]) );
  AOI222X1TS U627 ( .A0(n692), .A1(d_ff3_sh_y_out[6]), .B0(n738), .B1(
        d_ff3_sh_x_out[6]), .C0(n690), .C1(d_ff3_LUT_out[6]), .Y(n664) );
  INVX2TS U628 ( .A(n664), .Y(add_subt_dataB[6]) );
  AOI222X1TS U629 ( .A0(n692), .A1(d_ff3_sh_y_out[23]), .B0(n738), .B1(
        d_ff3_sh_x_out[23]), .C0(n741), .C1(d_ff3_LUT_out[23]), .Y(n665) );
  INVX2TS U630 ( .A(n665), .Y(add_subt_dataB[23]) );
  AOI222X1TS U631 ( .A0(n692), .A1(d_ff3_sh_y_out[10]), .B0(n738), .B1(
        d_ff3_sh_x_out[10]), .C0(n736), .C1(d_ff3_LUT_out[10]), .Y(n666) );
  INVX2TS U632 ( .A(n666), .Y(add_subt_dataB[10]) );
  AOI222X1TS U633 ( .A0(n692), .A1(d_ff3_sh_y_out[12]), .B0(n738), .B1(
        d_ff3_sh_x_out[12]), .C0(n690), .C1(d_ff3_LUT_out[12]), .Y(n667) );
  INVX2TS U634 ( .A(n667), .Y(add_subt_dataB[12]) );
  AOI222X1TS U635 ( .A0(n692), .A1(d_ff3_sh_y_out[25]), .B0(n738), .B1(
        d_ff3_sh_x_out[25]), .C0(n741), .C1(d_ff3_LUT_out[25]), .Y(n668) );
  INVX2TS U636 ( .A(n668), .Y(add_subt_dataB[25]) );
  AOI222X1TS U637 ( .A0(n692), .A1(d_ff3_sh_y_out[8]), .B0(n738), .B1(
        d_ff3_sh_x_out[8]), .C0(n736), .C1(d_ff3_LUT_out[8]), .Y(n669) );
  INVX2TS U638 ( .A(n669), .Y(add_subt_dataB[8]) );
  INVX2TS U639 ( .A(n670), .Y(add_subt_dataB[4]) );
  AOI222X1TS U640 ( .A0(n692), .A1(d_ff2_X[19]), .B0(n687), .B1(d_ff2_Y[19]), 
        .C0(n736), .C1(d_ff2_Z[19]), .Y(n671) );
  INVX2TS U641 ( .A(n671), .Y(add_subt_dataA[19]) );
  INVX2TS U642 ( .A(n672), .Y(add_subt_dataA[24]) );
  INVX2TS U643 ( .A(n673), .Y(add_subt_dataA[29]) );
  AOI222X1TS U644 ( .A0(n692), .A1(d_ff2_X[23]), .B0(n687), .B1(d_ff2_Y[23]), 
        .C0(n741), .C1(d_ff2_Z[23]), .Y(n674) );
  INVX2TS U645 ( .A(n674), .Y(add_subt_dataA[23]) );
  INVX2TS U646 ( .A(n675), .Y(add_subt_dataB[1]) );
  INVX2TS U647 ( .A(n676), .Y(add_subt_dataB[2]) );
  AOI222X1TS U648 ( .A0(n692), .A1(d_ff2_X[13]), .B0(n687), .B1(d_ff2_Y[13]), 
        .C0(n741), .C1(d_ff2_Z[13]), .Y(n677) );
  INVX2TS U649 ( .A(n677), .Y(add_subt_dataA[13]) );
  AOI222X1TS U650 ( .A0(n692), .A1(d_ff2_X[12]), .B0(n687), .B1(d_ff2_Y[12]), 
        .C0(n690), .C1(d_ff2_Z[12]), .Y(n678) );
  INVX2TS U651 ( .A(n678), .Y(add_subt_dataA[12]) );
  AOI222X1TS U652 ( .A0(n739), .A1(d_ff2_X[31]), .B0(n691), .B1(d_ff2_Y[31]), 
        .C0(n736), .C1(d_ff2_Z[31]), .Y(n679) );
  INVX2TS U653 ( .A(n679), .Y(add_subt_dataA[31]) );
  INVX2TS U654 ( .A(n680), .Y(add_subt_dataA[30]) );
  AOI222X1TS U655 ( .A0(n692), .A1(d_ff2_X[15]), .B0(n687), .B1(d_ff2_Y[15]), 
        .C0(n736), .C1(d_ff2_Z[15]), .Y(n681) );
  INVX2TS U656 ( .A(n681), .Y(add_subt_dataA[15]) );
  INVX2TS U657 ( .A(n682), .Y(add_subt_dataB[0]) );
  AOI222X1TS U658 ( .A0(n692), .A1(d_ff2_X[17]), .B0(n687), .B1(d_ff2_Y[17]), 
        .C0(n741), .C1(d_ff2_Z[17]), .Y(n683) );
  INVX2TS U659 ( .A(n683), .Y(add_subt_dataA[17]) );
  INVX2TS U660 ( .A(n684), .Y(add_subt_dataA[0]) );
  INVX2TS U661 ( .A(n685), .Y(add_subt_dataA[27]) );
  INVX2TS U662 ( .A(n686), .Y(add_subt_dataA[28]) );
  AOI222X1TS U663 ( .A0(n725), .A1(d_ff2_X[21]), .B0(n687), .B1(d_ff2_Y[21]), 
        .C0(n690), .C1(d_ff2_Z[21]), .Y(n688) );
  INVX2TS U664 ( .A(n688), .Y(add_subt_dataA[21]) );
  INVX2TS U665 ( .A(n689), .Y(add_subt_dataA[25]) );
  INVX2TS U666 ( .A(n693), .Y(add_subt_dataA[26]) );
  INVX2TS U667 ( .A(n748), .Y(n749) );
  NAND2X1TS U668 ( .A(n749), .B(cont_var_out[1]), .Y(n695) );
  OAI211XLTS U669 ( .A0(n749), .A1(n696), .B0(n659), .C0(n695), .Y(n519) );
  OAI21XLTS U670 ( .A0(n742), .A1(n761), .B0(n744), .Y(n531) );
  NOR3XLTS U671 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .C(n697), .Y(
        enab_d_ff4_Xn) );
  AOI32X1TS U673 ( .A0(cont_iter_out[3]), .A1(n698), .A2(n761), .B0(
        cont_iter_out[2]), .B1(n698), .Y(data_out_LUT[4]) );
  OAI22X1TS U674 ( .A0(cont_iter_out[3]), .A1(n723), .B0(cont_iter_out[2]), 
        .B1(n724), .Y(data_out_LUT[25]) );
  NAND2X1TS U675 ( .A(d_ff1_operation_out), .B(n610), .Y(n701) );
  OAI21XLTS U676 ( .A0(d_ff1_operation_out), .A1(n610), .B0(n701), .Y(n699) );
  XOR2X1TS U677 ( .A(n612), .B(n699), .Y(n700) );
  BUFX3TS U678 ( .A(n714), .Y(n712) );
  AOI22X1TS U679 ( .A0(n715), .A1(d_ff_Yn[31]), .B0(d_ff_Xn[31]), .B1(n712), 
        .Y(n703) );
  XNOR2X1TS U680 ( .A(n703), .B(n702), .Y(fmtted_Result_31_) );
  NAND2X1TS U681 ( .A(n705), .B(n704), .Y(enab_d_ff5_data_out) );
  NOR2BX1TS U682 ( .AN(d_ff_Yn[0]), .B(n605), .Y(first_mux_Y[0]) );
  NOR2BX1TS U683 ( .AN(d_ff_Yn[1]), .B(n706), .Y(first_mux_Y[1]) );
  NOR2BX1TS U684 ( .AN(d_ff_Yn[2]), .B(n707), .Y(first_mux_Y[2]) );
  NOR2BX1TS U685 ( .AN(d_ff_Yn[3]), .B(n707), .Y(first_mux_Y[3]) );
  NOR2BX1TS U686 ( .AN(d_ff_Yn[4]), .B(n605), .Y(first_mux_Y[4]) );
  NOR2BX1TS U687 ( .AN(d_ff_Yn[5]), .B(n706), .Y(first_mux_Y[5]) );
  NOR2BX1TS U688 ( .AN(d_ff_Yn[6]), .B(n707), .Y(first_mux_Y[6]) );
  NOR2BX1TS U689 ( .AN(d_ff_Yn[7]), .B(n707), .Y(first_mux_Y[7]) );
  NOR2BX1TS U690 ( .AN(d_ff_Yn[8]), .B(n706), .Y(first_mux_Y[8]) );
  NOR2BX1TS U691 ( .AN(d_ff_Yn[9]), .B(n605), .Y(first_mux_Y[9]) );
  NOR2BX1TS U692 ( .AN(d_ff_Yn[10]), .B(n707), .Y(first_mux_Y[10]) );
  NOR2BX1TS U693 ( .AN(d_ff_Yn[11]), .B(n707), .Y(first_mux_Y[11]) );
  NOR2BX1TS U694 ( .AN(d_ff_Yn[12]), .B(n707), .Y(first_mux_Y[12]) );
  NOR2BX1TS U695 ( .AN(d_ff_Yn[13]), .B(n605), .Y(first_mux_Y[13]) );
  NOR2BX1TS U696 ( .AN(d_ff_Yn[14]), .B(n706), .Y(first_mux_Y[14]) );
  NOR2BX1TS U697 ( .AN(d_ff_Yn[15]), .B(n707), .Y(first_mux_Y[15]) );
  NOR2BX1TS U698 ( .AN(d_ff_Yn[16]), .B(n707), .Y(first_mux_Y[16]) );
  NOR2BX1TS U699 ( .AN(d_ff_Yn[17]), .B(n605), .Y(first_mux_Y[17]) );
  NOR2BX1TS U700 ( .AN(d_ff_Yn[18]), .B(n706), .Y(first_mux_Y[18]) );
  NOR2BX1TS U701 ( .AN(d_ff_Yn[19]), .B(n707), .Y(first_mux_Y[19]) );
  NOR2BX1TS U702 ( .AN(d_ff_Yn[20]), .B(n707), .Y(first_mux_Y[20]) );
  NOR2BX1TS U703 ( .AN(d_ff_Yn[21]), .B(n706), .Y(first_mux_Y[21]) );
  NOR2BX1TS U704 ( .AN(d_ff_Yn[22]), .B(n605), .Y(first_mux_Y[22]) );
  NOR2BX1TS U705 ( .AN(d_ff_Yn[23]), .B(n707), .Y(first_mux_Y[23]) );
  NOR2BX1TS U706 ( .AN(d_ff_Yn[24]), .B(n605), .Y(first_mux_Y[24]) );
  NOR2BX1TS U707 ( .AN(d_ff_Yn[25]), .B(n605), .Y(first_mux_Y[25]) );
  NOR2BX1TS U708 ( .AN(d_ff_Yn[26]), .B(n605), .Y(first_mux_Y[26]) );
  NOR2BX1TS U709 ( .AN(d_ff_Yn[27]), .B(n605), .Y(first_mux_Y[27]) );
  NOR2BX1TS U710 ( .AN(d_ff_Yn[28]), .B(n605), .Y(first_mux_Y[28]) );
  NOR2BX1TS U711 ( .AN(d_ff_Yn[29]), .B(n605), .Y(first_mux_Y[29]) );
  NOR2BX1TS U712 ( .AN(d_ff_Yn[30]), .B(n605), .Y(first_mux_Y[30]) );
  NOR2BX1TS U713 ( .AN(d_ff_Yn[31]), .B(n605), .Y(first_mux_Y[31]) );
  INVX4TS U714 ( .A(n709), .Y(n711) );
  AO22XLTS U715 ( .A0(n718), .A1(d_ff1_Z[1]), .B0(n615), .B1(d_ff_Zn[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U716 ( .A0(n605), .A1(d_ff1_Z[2]), .B0(n708), .B1(d_ff_Zn[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U717 ( .A0(n718), .A1(d_ff1_Z[3]), .B0(n708), .B1(d_ff_Zn[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U718 ( .A0(n718), .A1(d_ff1_Z[4]), .B0(n708), .B1(d_ff_Zn[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U719 ( .A0(n718), .A1(d_ff1_Z[5]), .B0(n708), .B1(d_ff_Zn[5]), .Y(
        first_mux_Z[5]) );
  AO22XLTS U720 ( .A0(n718), .A1(d_ff1_Z[6]), .B0(n709), .B1(d_ff_Zn[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U721 ( .A0(n718), .A1(d_ff1_Z[7]), .B0(n709), .B1(d_ff_Zn[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U722 ( .A0(n711), .A1(d_ff1_Z[8]), .B0(n709), .B1(d_ff_Zn[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U723 ( .A0(n711), .A1(d_ff1_Z[9]), .B0(n709), .B1(d_ff_Zn[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U724 ( .A0(n711), .A1(d_ff1_Z[10]), .B0(n709), .B1(d_ff_Zn[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U725 ( .A0(n711), .A1(d_ff1_Z[11]), .B0(n709), .B1(d_ff_Zn[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U726 ( .A0(n711), .A1(d_ff1_Z[12]), .B0(n709), .B1(d_ff_Zn[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U727 ( .A0(n711), .A1(d_ff1_Z[13]), .B0(n709), .B1(d_ff_Zn[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U728 ( .A0(n711), .A1(d_ff1_Z[14]), .B0(n709), .B1(d_ff_Zn[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U729 ( .A0(n718), .A1(d_ff1_Z[15]), .B0(n709), .B1(d_ff_Zn[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U730 ( .A0(n718), .A1(d_ff1_Z[16]), .B0(n709), .B1(d_ff_Zn[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U731 ( .A0(n718), .A1(d_ff1_Z[17]), .B0(n615), .B1(d_ff_Zn[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U732 ( .A0(n710), .A1(d_ff1_Z[18]), .B0(n615), .B1(d_ff_Zn[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U733 ( .A0(n718), .A1(d_ff1_Z[19]), .B0(n615), .B1(d_ff_Zn[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U734 ( .A0(n718), .A1(d_ff1_Z[20]), .B0(n615), .B1(d_ff_Zn[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U735 ( .A0(n710), .A1(d_ff1_Z[21]), .B0(n615), .B1(d_ff_Zn[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U736 ( .A0(n718), .A1(d_ff1_Z[22]), .B0(n615), .B1(d_ff_Zn[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U737 ( .A0(n710), .A1(d_ff1_Z[23]), .B0(n615), .B1(d_ff_Zn[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U738 ( .A0(n718), .A1(d_ff1_Z[24]), .B0(n615), .B1(d_ff_Zn[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U739 ( .A0(n710), .A1(d_ff1_Z[25]), .B0(n615), .B1(d_ff_Zn[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U740 ( .A0(n711), .A1(d_ff1_Z[26]), .B0(n615), .B1(d_ff_Zn[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U741 ( .A0(n711), .A1(d_ff1_Z[27]), .B0(n615), .B1(d_ff_Zn[27]), 
        .Y(first_mux_Z[27]) );
  BUFX3TS U742 ( .A(n712), .Y(n716) );
  AO22XLTS U743 ( .A0(n713), .A1(d_ff_Yn[0]), .B0(n716), .B1(d_ff_Xn[0]), .Y(
        mux_sal[0]) );
  AO22XLTS U744 ( .A0(n713), .A1(d_ff_Yn[1]), .B0(n712), .B1(d_ff_Xn[1]), .Y(
        mux_sal[1]) );
  AO22XLTS U745 ( .A0(n713), .A1(d_ff_Yn[2]), .B0(n712), .B1(d_ff_Xn[2]), .Y(
        mux_sal[2]) );
  AO22XLTS U746 ( .A0(n713), .A1(d_ff_Yn[3]), .B0(n712), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U747 ( .A0(n713), .A1(d_ff_Yn[4]), .B0(n712), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  AO22XLTS U748 ( .A0(n713), .A1(d_ff_Yn[5]), .B0(n712), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  AO22XLTS U749 ( .A0(n713), .A1(d_ff_Yn[6]), .B0(n712), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U750 ( .A0(n713), .A1(d_ff_Yn[7]), .B0(n712), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U751 ( .A0(n713), .A1(d_ff_Yn[8]), .B0(n712), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U752 ( .A0(n713), .A1(d_ff_Yn[9]), .B0(n712), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U753 ( .A0(n713), .A1(d_ff_Yn[10]), .B0(n712), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U754 ( .A0(n713), .A1(d_ff_Yn[11]), .B0(n714), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U755 ( .A0(n713), .A1(d_ff_Yn[12]), .B0(n714), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  INVX2TS U756 ( .A(n714), .Y(n715) );
  AO22XLTS U757 ( .A0(n713), .A1(d_ff_Yn[13]), .B0(n714), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U758 ( .A0(n713), .A1(d_ff_Yn[14]), .B0(n714), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U759 ( .A0(n713), .A1(d_ff_Yn[15]), .B0(n714), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U760 ( .A0(n713), .A1(d_ff_Yn[16]), .B0(n714), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U761 ( .A0(n713), .A1(d_ff_Yn[17]), .B0(n714), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U762 ( .A0(n715), .A1(d_ff_Yn[18]), .B0(n712), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U763 ( .A0(n715), .A1(d_ff_Yn[19]), .B0(n716), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U764 ( .A0(n715), .A1(d_ff_Yn[20]), .B0(n716), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U765 ( .A0(n715), .A1(d_ff_Yn[21]), .B0(n716), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U766 ( .A0(n715), .A1(d_ff_Yn[22]), .B0(n716), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U767 ( .A0(n715), .A1(d_ff_Yn[23]), .B0(n716), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U768 ( .A0(n715), .A1(d_ff_Yn[24]), .B0(n716), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U769 ( .A0(n715), .A1(d_ff_Yn[25]), .B0(n716), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U770 ( .A0(n715), .A1(d_ff_Yn[26]), .B0(n716), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  INVX2TS U771 ( .A(n712), .Y(n717) );
  AO22XLTS U772 ( .A0(n717), .A1(d_ff_Yn[27]), .B0(n716), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U773 ( .A0(n717), .A1(d_ff_Yn[28]), .B0(n716), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U774 ( .A0(n717), .A1(d_ff_Yn[29]), .B0(n716), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U775 ( .A0(n717), .A1(d_ff_Yn[30]), .B0(n716), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  NOR2BX1TS U776 ( .AN(d_ff_Xn[0]), .B(n711), .Y(first_mux_X[0]) );
  NOR2BX1TS U777 ( .AN(d_ff_Xn[4]), .B(n711), .Y(first_mux_X[4]) );
  NOR2BX1TS U778 ( .AN(d_ff_Xn[8]), .B(n711), .Y(first_mux_X[8]) );
  NOR2BX1TS U779 ( .AN(d_ff_Xn[9]), .B(n711), .Y(first_mux_X[9]) );
  NOR2BX1TS U780 ( .AN(d_ff_Xn[11]), .B(n711), .Y(first_mux_X[11]) );
  NOR2BX1TS U781 ( .AN(d_ff_Xn[15]), .B(n711), .Y(first_mux_X[15]) );
  NOR2BX1TS U782 ( .AN(d_ff_Xn[18]), .B(n711), .Y(first_mux_X[18]) );
  NOR2BX1TS U783 ( .AN(d_ff_Xn[21]), .B(n707), .Y(first_mux_X[21]) );
  NOR2BX1TS U784 ( .AN(d_ff_Xn[22]), .B(n605), .Y(first_mux_X[22]) );
  NOR2BX1TS U785 ( .AN(d_ff_Xn[23]), .B(n706), .Y(first_mux_X[23]) );
  NOR2BX1TS U786 ( .AN(d_ff_Xn[30]), .B(n707), .Y(first_mux_X[30]) );
  NOR2BX1TS U787 ( .AN(d_ff_Xn[31]), .B(n711), .Y(first_mux_X[31]) );
  NOR2BX1TS U788 ( .AN(beg_fsm_cordic), .B(n719), .Y(
        inst_CORDIC_FSM_v3_state_next[1]) );
  OAI22X1TS U789 ( .A0(enab_d_ff4_Zn), .A1(n722), .B0(n721), .B1(n720), .Y(
        inst_CORDIC_FSM_v3_state_next[5]) );
  NOR2BX1TS U790 ( .AN(enab_d_ff4_Zn), .B(n722), .Y(
        inst_CORDIC_FSM_v3_state_next[6]) );
  OA21XLTS U791 ( .A0(cont_iter_out[2]), .A1(n724), .B0(n723), .Y(ITER_CONT_N4) );
  XOR2XLTS U792 ( .A(d_ff3_sign_out), .B(cont_var_out[0]), .Y(op_add_subt) );
  AO22XLTS U793 ( .A0(n725), .A1(d_ff3_sh_y_out[31]), .B0(n733), .B1(
        d_ff3_sh_x_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U794 ( .A0(n734), .A1(d_ff3_sh_y_out[30]), .B0(n733), .B1(
        d_ff3_sh_x_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U795 ( .A0(n739), .A1(d_ff3_sh_y_out[22]), .B0(n733), .B1(
        d_ff3_sh_x_out[22]), .Y(n726) );
  OAI2BB1X1TS U796 ( .A0N(n736), .A1N(d_ff3_LUT_out[19]), .B0(n726), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U797 ( .A0(n734), .A1(d_ff3_sh_y_out[19]), .B0(n733), .B1(
        d_ff3_sh_x_out[19]), .Y(n727) );
  OAI2BB1X1TS U798 ( .A0N(n690), .A1N(d_ff3_LUT_out[19]), .B0(n727), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U799 ( .A0(n725), .A1(d_ff3_sh_y_out[18]), .B0(n733), .B1(
        d_ff3_sh_x_out[18]), .Y(n728) );
  OAI2BB1X1TS U800 ( .A0N(n690), .A1N(d_ff3_LUT_out[13]), .B0(n728), .Y(
        add_subt_dataB[18]) );
  AOI22X1TS U801 ( .A0(n739), .A1(d_ff3_sh_y_out[16]), .B0(n733), .B1(
        d_ff3_sh_x_out[16]), .Y(n729) );
  OAI2BB1X1TS U802 ( .A0N(n741), .A1N(d_ff3_LUT_out[3]), .B0(n729), .Y(
        add_subt_dataB[16]) );
  AOI22X1TS U803 ( .A0(n734), .A1(d_ff3_sh_y_out[14]), .B0(n733), .B1(
        d_ff3_sh_x_out[14]), .Y(n730) );
  OAI2BB1X1TS U804 ( .A0N(n741), .A1N(d_ff3_LUT_out[5]), .B0(n730), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U805 ( .A0(n725), .A1(d_ff3_sh_y_out[13]), .B0(n733), .B1(
        d_ff3_sh_x_out[13]), .Y(n731) );
  OAI2BB1X1TS U806 ( .A0N(n736), .A1N(d_ff3_LUT_out[13]), .B0(n731), .Y(
        add_subt_dataB[13]) );
  AOI22X1TS U807 ( .A0(n739), .A1(d_ff3_sh_y_out[11]), .B0(n733), .B1(
        d_ff3_sh_x_out[11]), .Y(n732) );
  OAI2BB1X1TS U808 ( .A0N(n741), .A1N(d_ff3_LUT_out[7]), .B0(n732), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U809 ( .A0(n734), .A1(d_ff3_sh_y_out[7]), .B0(n733), .B1(
        d_ff3_sh_x_out[7]), .Y(n735) );
  OAI2BB1X1TS U810 ( .A0N(n690), .A1N(d_ff3_LUT_out[7]), .B0(n735), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U811 ( .A0(n739), .A1(d_ff3_sh_y_out[5]), .B0(n733), .B1(
        d_ff3_sh_x_out[5]), .Y(n737) );
  OAI2BB1X1TS U812 ( .A0N(n690), .A1N(d_ff3_LUT_out[5]), .B0(n737), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U813 ( .A0(n734), .A1(d_ff3_sh_y_out[3]), .B0(n733), .B1(
        d_ff3_sh_x_out[3]), .Y(n740) );
  OAI2BB1X1TS U814 ( .A0N(n736), .A1N(d_ff3_LUT_out[3]), .B0(n740), .Y(
        add_subt_dataB[3]) );
  AOI22X1TS U815 ( .A0(cont_iter_out[1]), .A1(n744), .B0(n742), .B1(n761), .Y(
        n533) );
  AOI22X1TS U816 ( .A0(cont_iter_out[1]), .A1(n744), .B0(n743), .B1(n761), .Y(
        n525) );
  OAI2BB1X1TS U817 ( .A0N(cont_iter_out[1]), .A1N(n523), .B0(n745), .Y(n524)
         );
  AOI22X1TS U818 ( .A0(cont_iter_out[1]), .A1(n747), .B0(n746), .B1(n761), .Y(
        n520) );
  AOI22X1TS U819 ( .A0(n749), .A1(n759), .B0(cont_var_out[0]), .B1(n748), .Y(
        n518) );
  NOR2XLTS U821 ( .A(d_ff2_Y[29]), .B(n751), .Y(n750) );
  XOR2XLTS U822 ( .A(d_ff2_Y[30]), .B(n750), .Y(sh_exp_y[7]) );
  XNOR2X1TS U823 ( .A(d_ff2_Y[29]), .B(n751), .Y(sh_exp_y[6]) );
  AO21XLTS U824 ( .A0(intadd_424_n1), .A1(d_ff2_Y[27]), .B0(n752), .Y(
        sh_exp_y[4]) );
  NOR2XLTS U825 ( .A(d_ff2_X[29]), .B(n754), .Y(n753) );
  XOR2XLTS U826 ( .A(d_ff2_X[30]), .B(n753), .Y(sh_exp_x[7]) );
  XNOR2X1TS U827 ( .A(d_ff2_X[29]), .B(n754), .Y(sh_exp_x[6]) );
  AO21XLTS U828 ( .A0(intadd_423_n1), .A1(d_ff2_X[27]), .B0(n755), .Y(
        sh_exp_x[4]) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule

