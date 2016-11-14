/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:01:48 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_21 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_23 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_24 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_26 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_27 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_29 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_32 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
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
         d_ff1_operation_out, d_ff3_sign_out, enab_d_ff4_Yn, enab_d_ff4_Xn,
         fmtted_Result_31_, ITER_CONT_net3604909, ITER_CONT_N5, ITER_CONT_N4,
         ITER_CONT_N3, d_ff5_data_out_net3604886, reg_Z0_net3604886,
         reg_val_muxZ_2stage_net3604886, reg_shift_y_net3604886,
         d_ff4_Xn_net3604886, d_ff4_Yn_net3604886, d_ff4_Zn_net3604886, n154,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n531, n532, n533, n534, n535, n536, n537, intadd_419_CI,
         intadd_419_n3, intadd_419_n2, intadd_419_n1, intadd_420_CI,
         intadd_420_n3, intadd_420_n2, intadd_420_n1, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729,
         n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817,
         n818;
  wire   [3:0] cont_iter_out;
  wire   [1:0] cont_var_out;
  wire   [1:0] d_ff1_shift_region_flag_out;
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

  SNPS_CLOCK_GATE_HIGH_Up_counter_COUNTER_WIDTH4 ITER_CONT_clk_gate_temp_reg ( 
        .CLK(clk), .EN(enab_cont_iter), .ENCLK(ITER_CONT_net3604909), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_21 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3604886), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_32 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff_RB1), .ENCLK(reg_Z0_net3604886), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_29 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(inst_CORDIC_FSM_v3_state_next[3]), .ENCLK(
        reg_val_muxZ_2stage_net3604886), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_27 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_RB3), .ENCLK(reg_shift_y_net3604886), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_26 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3604886), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_24 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3604886), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_23 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3604886), .TE(1'b0) );
  DFFRX2TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(clk), .RN(n816), .Q(
        inst_CORDIC_FSM_v3_state_reg[7]) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3604886), .RN(n816), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n608) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(n524), .CK(reg_shift_y_net3604886), .RN(n816), 
        .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(n534), .CK(reg_shift_y_net3604886), .RN(n816), 
        .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(n528), .CK(reg_shift_y_net3604886), .RN(n815), 
        .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(n536), .CK(reg_shift_y_net3604886), .RN(n815), 
        .Q(d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(data_out_LUT[4]), .CK(reg_shift_y_net3604886), 
        .RN(n815), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(n525), .CK(reg_shift_y_net3604886), .RN(n815), 
        .Q(d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(n527), .CK(reg_shift_y_net3604886), .RN(n815), 
        .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(n531), .CK(reg_shift_y_net3604886), .RN(n815), 
        .Q(d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(n773), .CK(reg_shift_y_net3604886), .RN(n815), 
        .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(n533), .CK(reg_shift_y_net3604886), .RN(n815), 
        .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(n526), .CK(reg_shift_y_net3604886), .RN(n815), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n532), .CK(reg_shift_y_net3604886), .RN(n815), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(n523), .CK(reg_shift_y_net3604886), .RN(n818), .Q(d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(n535), .CK(reg_shift_y_net3604886), .RN(n817), .Q(d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(n537), .CK(reg_shift_y_net3604886), .RN(n818), .Q(d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n522), .CK(reg_shift_y_net3604886), .RN(n817), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(n521), .CK(reg_shift_y_net3604886), .RN(n618), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(n520), .CK(reg_shift_y_net3604886), .RN(n154), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3604886), .RN(n154), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(n529), .CK(reg_shift_y_net3604886), .RN(n154), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3604886), .RN(n154), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3604886), .RN(n154), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3604886), .RN(n814), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3604886), .RN(n814), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3604886), .RN(n814), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3604886), .RN(n814), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3604886), .RN(n814), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3604886), .RN(n814), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3604886), .RN(n814), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3604886), .RN(n814), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3604886), .RN(
        n814), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3604886), .RN(
        n814), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3604886), .RN(
        n813), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3604886), .RN(
        n812), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3604886), .RN(n811), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3604886), .RN(n810), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3604886), .RN(n810), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3604886), .RN(n810), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3604886), .RN(n810), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3604886), .RN(n810), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3604886), .RN(n810), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3604886), .RN(n810), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n810), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3604886), 
        .RN(n810), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3604886), .RN(n810), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n809), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3604886), 
        .RN(n809), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3604886), .RN(n809), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n809), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3604886), 
        .RN(n809), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3604886), .RN(n809), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n809), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3604886), 
        .RN(n809), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3604886), .RN(n809), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n809), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3604886), 
        .RN(n808), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3604886), .RN(n808), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n808), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3604886), 
        .RN(n808), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3604886), .RN(n808), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n808), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3604886), 
        .RN(n808), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3604886), .RN(n808), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n808), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3604886), 
        .RN(n808), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3604886), .RN(n807), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n807), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3604886), 
        .RN(n807), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3604886), .RN(n807), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n807), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3604886), 
        .RN(n807), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3604886), .RN(n807), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n807), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3604886), .RN(n807), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3604886), .RN(n807), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n806), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3604886), .RN(n806), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3604886), .RN(n806), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n806), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3604886), .RN(n806), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3604886), .RN(n806), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n806), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3604886), .RN(n806), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3604886), .RN(n806), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n806), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3604886), .RN(n805), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3604886), .RN(n805), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n805), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3604886), .RN(n805), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3604886), .RN(n805), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n805), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3604886), .RN(n805), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3604886), .RN(n805), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n805), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3604886), .RN(n805), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3604886), .RN(n804), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n804), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3604886), .RN(n804), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3604886), .RN(n804), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n804), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3604886), .RN(n804), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3604886), .RN(n804), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n804), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3604886), .RN(n804), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3604886), .RN(n804), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n803), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3604886), .RN(n803), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3604886), .RN(n803), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n803), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3604886), .RN(n803), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3604886), .RN(n803), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n803), .Q(d_ff2_X[23]), .QN(n777)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3604886), .RN(n803), .Q(d_ff_Xn[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3604886), .RN(n803), .Q(d_ff_Xn[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3604886), .RN(n802), .Q(d_ff_Xn[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3604886), .RN(n802), .Q(d_ff_Xn[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3604886), .RN(n802), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n802), .Q(d_ff2_X[28]), .QN(n781)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3604886), .RN(n802), .Q(d_ff_Xn[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3604886), .RN(n802), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n801), .Q(d_ff2_X[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3604886), .RN(n801), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n801), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3604886), .RN(n801), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3604886), .RN(n801), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n801), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3604886), 
        .RN(n801), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3604886), .RN(n801), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n801), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3604886), 
        .RN(n800), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3604886), .RN(n800), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n800), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3604886), 
        .RN(n800), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3604886), .RN(n800), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n800), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3604886), 
        .RN(n800), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3604886), .RN(n799), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n799), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3604886), 
        .RN(n799), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3604886), .RN(n799), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n799), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3604886), 
        .RN(n799), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3604886), .RN(n799), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n799), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3604886), 
        .RN(n798), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3604886), .RN(n798), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n798), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3604886), 
        .RN(n798), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3604886), .RN(n798), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n798), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3604886), 
        .RN(n798), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3604886), .RN(n797), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n797), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3604886), 
        .RN(n797), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3604886), .RN(n797), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n797), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3604886), .RN(n797), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3604886), .RN(n797), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n797), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3604886), .RN(n796), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3604886), .RN(n796), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n796), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3604886), .RN(n796), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3604886), .RN(n796), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n796), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3604886), .RN(n796), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3604886), .RN(n795), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n795), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3604886), .RN(n795), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3604886), .RN(n795), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n795), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3604886), .RN(n795), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3604886), .RN(n795), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n795), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3604886), .RN(n794), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3604886), .RN(n794), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n794), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3604886), .RN(n794), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3604886), .RN(n794), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n794), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3604886), .RN(n794), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3604886), .RN(n793), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n793), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3604886), .RN(n793), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3604886), .RN(n793), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n793), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3604886), .RN(n793), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3604886), .RN(n793), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n793), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3604886), .RN(n792), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3604886), .RN(n792), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n792), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3604886), .RN(n792), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3604886), .RN(n792), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n792), .Q(d_ff2_Y[23]), .QN(n778)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3604886), .RN(n792), .Q(d_ff_Yn[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3604886), .RN(n791), .Q(d_ff_Yn[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3604886), .RN(n791), .Q(d_ff_Yn[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3604886), .RN(n791), .Q(d_ff_Yn[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3604886), .RN(n790), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n790), .Q(d_ff2_Y[28]), .QN(n782)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3604886), .RN(n790), .Q(d_ff_Yn[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3604886), .RN(n790), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n790), .Q(d_ff2_Y[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3604886), .RN(n789), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n789), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3604886), .RN(n789), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3604886), .RN(n789), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n789), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3604886), .RN(n789), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n789), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3604886), .RN(n789), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n789), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3604886), .RN(n788), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n788), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3604886), .RN(n788), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n788), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3604886), .RN(n788), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n788), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3604886), .RN(n788), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n788), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3604886), .RN(n788), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n788), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3604886), .RN(n787), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n787), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3604886), .RN(n787), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n787), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3604886), .RN(n787), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n787), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3604886), .RN(n787), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n787), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3604886), .RN(n787), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n787), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3604886), .RN(n786), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n786), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3604886), .RN(n786), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n786), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3604886), .RN(n786), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n786), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3604886), .RN(n786), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n786), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3604886), .RN(n786), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n786), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3604886), .RN(n785), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n785), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3604886), .RN(n785), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n785), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3604886), .RN(n785), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n785), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3604886), .RN(n785), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n785), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3604886), .RN(n785), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n785), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3604886), .RN(n784), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n784), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3604886), .RN(n784), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n784), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3604886), .RN(n784), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n784), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3604886), .RN(n784), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n784), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3604886), .RN(n784), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n784), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3604886), .RN(n783), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n783), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3604886), .RN(n783), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n783), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3604886), .RN(n783), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n783), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3604886), .RN(n783), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n783), .Q(d_ff2_Z[31]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(1'b1), .CK(reg_shift_y_net3604886), .RN(n783), .Q(d_ff3_LUT_out[27]) );
  DFFRX1TS VAR_CONT_temp_reg_1_ ( .D(n519), .CK(clk), .RN(n817), .Q(
        cont_var_out[1]), .QN(n780) );
  DFFRX2TS VAR_CONT_temp_reg_0_ ( .D(n518), .CK(clk), .RN(n818), .Q(
        cont_var_out[0]), .QN(n779) );
  DFFRX2TS ITER_CONT_temp_reg_0_ ( .D(n775), .CK(ITER_CONT_net3604909), .RN(
        n818), .Q(cont_iter_out[0]), .QN(n775) );
  DFFRX2TS ITER_CONT_temp_reg_3_ ( .D(ITER_CONT_N5), .CK(ITER_CONT_net3604909), 
        .RN(n817), .Q(cont_iter_out[3]), .QN(n774) );
  DFFRX2TS ITER_CONT_temp_reg_2_ ( .D(ITER_CONT_N4), .CK(ITER_CONT_net3604909), 
        .RN(n818), .Q(cont_iter_out[2]), .QN(n773) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(mux_sal[0]), .CK(
        d_ff5_data_out_net3604886), .RN(n801), .Q(data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(mux_sal[1]), .CK(
        d_ff5_data_out_net3604886), .RN(n800), .Q(data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(mux_sal[2]), .CK(
        d_ff5_data_out_net3604886), .RN(n800), .Q(data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(mux_sal[3]), .CK(
        d_ff5_data_out_net3604886), .RN(n800), .Q(data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(mux_sal[4]), .CK(
        d_ff5_data_out_net3604886), .RN(n799), .Q(data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(mux_sal[5]), .CK(
        d_ff5_data_out_net3604886), .RN(n799), .Q(data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(mux_sal[6]), .CK(
        d_ff5_data_out_net3604886), .RN(n798), .Q(data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(mux_sal[7]), .CK(
        d_ff5_data_out_net3604886), .RN(n798), .Q(data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(mux_sal[8]), .CK(
        d_ff5_data_out_net3604886), .RN(n798), .Q(data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(mux_sal[9]), .CK(
        d_ff5_data_out_net3604886), .RN(n797), .Q(data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(mux_sal[10]), .CK(
        d_ff5_data_out_net3604886), .RN(n797), .Q(data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(mux_sal[11]), .CK(
        d_ff5_data_out_net3604886), .RN(n796), .Q(data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(mux_sal[12]), .CK(
        d_ff5_data_out_net3604886), .RN(n796), .Q(data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(mux_sal[13]), .CK(
        d_ff5_data_out_net3604886), .RN(n796), .Q(data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(mux_sal[14]), .CK(
        d_ff5_data_out_net3604886), .RN(n795), .Q(data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(mux_sal[15]), .CK(
        d_ff5_data_out_net3604886), .RN(n795), .Q(data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(mux_sal[16]), .CK(
        d_ff5_data_out_net3604886), .RN(n794), .Q(data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(mux_sal[17]), .CK(
        d_ff5_data_out_net3604886), .RN(n794), .Q(data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(mux_sal[18]), .CK(
        d_ff5_data_out_net3604886), .RN(n794), .Q(data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(mux_sal[19]), .CK(
        d_ff5_data_out_net3604886), .RN(n793), .Q(data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(mux_sal[20]), .CK(
        d_ff5_data_out_net3604886), .RN(n793), .Q(data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(mux_sal[21]), .CK(
        d_ff5_data_out_net3604886), .RN(n792), .Q(data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(mux_sal[22]), .CK(
        d_ff5_data_out_net3604886), .RN(n792), .Q(data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(mux_sal[23]), .CK(
        d_ff5_data_out_net3604886), .RN(n792), .Q(data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(mux_sal[24]), .CK(
        d_ff5_data_out_net3604886), .RN(n791), .Q(data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(mux_sal[25]), .CK(
        d_ff5_data_out_net3604886), .RN(n791), .Q(data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(mux_sal[26]), .CK(
        d_ff5_data_out_net3604886), .RN(n791), .Q(data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(mux_sal[27]), .CK(
        d_ff5_data_out_net3604886), .RN(n790), .Q(data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(mux_sal[28]), .CK(
        d_ff5_data_out_net3604886), .RN(n790), .Q(data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(mux_sal[29]), .CK(
        d_ff5_data_out_net3604886), .RN(n790), .Q(data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(mux_sal[30]), .CK(
        d_ff5_data_out_net3604886), .RN(n790), .Q(data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(fmtted_Result_31_), .CK(
        d_ff5_data_out_net3604886), .RN(n789), .Q(data_output[31]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(
        inst_CORDIC_FSM_v3_state_next[3]), .CK(clk), .RN(n816), .Q(
        inst_CORDIC_FSM_v3_state_reg[3]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(clk), .RN(n617), .Q(
        inst_CORDIC_FSM_v3_state_reg[6]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(clk), .RN(n154), .Q(
        inst_CORDIC_FSM_v3_state_reg[4]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(clk), .RN(n816), .Q(
        inst_CORDIC_FSM_v3_state_reg[5]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(clk), .RN(n816), .Q(
        inst_CORDIC_FSM_v3_state_reg[1]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[31]), .CK(reg_shift_y_net3604886), 
        .RN(n783), .Q(d_ff3_sign_out) );
  DFFSX1TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(clk), .SN(n818), .Q(
        inst_CORDIC_FSM_v3_state_reg[0]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n802), .Q(d_ff2_X[27]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n791), .Q(d_ff2_Y[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n802), .Q(d_ff2_X[29]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n790), .Q(d_ff2_Y[29]) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3604886), 
        .RN(n816), .Q(d_ff1_operation_out) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n803), .Q(d_ff2_X[24]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n802), .Q(d_ff2_X[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n802), .Q(d_ff2_X[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n791), .Q(d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n791), .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3604886), .RN(n791), .Q(d_ff2_Y[24]) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3604886), .RN(n816), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX2TS ITER_CONT_temp_reg_1_ ( .D(ITER_CONT_N3), .CK(ITER_CONT_net3604909), 
        .RN(n817), .Q(cont_iter_out[1]), .QN(n776) );
  ADDFX1TS intadd_420_U4 ( .A(d_ff2_Y[24]), .B(n606), .CI(intadd_420_CI), .CO(
        intadd_420_n3), .S(sh_exp_y[1]) );
  ADDFX1TS intadd_419_U4 ( .A(n606), .B(d_ff2_X[24]), .CI(intadd_419_CI), .CO(
        intadd_419_n3), .S(sh_exp_x[1]) );
  ADDFX1TS intadd_419_U3 ( .A(d_ff2_X[25]), .B(n773), .CI(intadd_419_n3), .CO(
        intadd_419_n2), .S(sh_exp_x[2]) );
  ADDFX1TS intadd_420_U3 ( .A(d_ff2_Y[25]), .B(n773), .CI(intadd_420_n3), .CO(
        intadd_420_n2), .S(sh_exp_y[2]) );
  ADDFX1TS intadd_420_U2 ( .A(d_ff2_Y[26]), .B(n774), .CI(intadd_420_n2), .CO(
        intadd_420_n1), .S(sh_exp_y[3]) );
  ADDFX1TS intadd_419_U2 ( .A(d_ff2_X[26]), .B(n774), .CI(intadd_419_n2), .CO(
        intadd_419_n1), .S(sh_exp_x[3]) );
  DFFRX1TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(
        inst_CORDIC_FSM_v3_state_next[2]), .CK(clk), .RN(n816), .Q(
        inst_CORDIC_FSM_v3_state_reg[2]) );
  AOI222X1TS U407 ( .A0(n689), .A1(d_ff3_sh_y_out[12]), .B0(n666), .B1(
        d_ff3_sh_x_out[12]), .C0(n758), .C1(d_ff3_LUT_out[12]), .Y(n668) );
  AOI222X1TS U408 ( .A0(n667), .A1(d_ff3_sh_y_out[23]), .B0(n666), .B1(
        d_ff3_sh_x_out[23]), .C0(n758), .C1(d_ff3_LUT_out[23]), .Y(n665) );
  AOI222X1TS U409 ( .A0(n732), .A1(d_ff3_sh_y_out[10]), .B0(n666), .B1(
        d_ff3_sh_x_out[10]), .C0(n758), .C1(d_ff3_LUT_out[10]), .Y(n664) );
  AOI222X1TS U410 ( .A0(n693), .A1(d_ff3_sh_y_out[9]), .B0(n666), .B1(
        d_ff3_sh_x_out[9]), .C0(n758), .C1(d_ff3_LUT_out[9]), .Y(n663) );
  AOI222X1TS U411 ( .A0(n689), .A1(d_ff3_sh_y_out[8]), .B0(n666), .B1(
        d_ff3_sh_x_out[8]), .C0(n758), .C1(d_ff3_LUT_out[8]), .Y(n662) );
  AOI222X1TS U412 ( .A0(n667), .A1(d_ff3_sh_y_out[6]), .B0(n666), .B1(
        d_ff3_sh_x_out[6]), .C0(n758), .C1(d_ff3_LUT_out[6]), .Y(n660) );
  AOI222X1TS U413 ( .A0(n732), .A1(d_ff3_sh_y_out[21]), .B0(n666), .B1(
        d_ff3_sh_x_out[21]), .C0(n758), .C1(d_ff3_LUT_out[21]), .Y(n659) );
  AOI222X1TS U414 ( .A0(n667), .A1(d_ff3_sh_y_out[24]), .B0(n666), .B1(
        d_ff3_sh_x_out[24]), .C0(n758), .C1(d_ff3_LUT_out[24]), .Y(n655) );
  AOI222X1TS U415 ( .A0(n693), .A1(d_ff2_X[30]), .B0(n688), .B1(d_ff2_Y[30]), 
        .C0(n691), .C1(d_ff2_Z[30]), .Y(n687) );
  AOI222X1TS U416 ( .A0(n693), .A1(d_ff3_sh_y_out[4]), .B0(n666), .B1(
        d_ff3_sh_x_out[4]), .C0(n691), .C1(d_ff3_LUT_out[4]), .Y(n658) );
  AOI222X1TS U417 ( .A0(n689), .A1(d_ff3_sh_y_out[2]), .B0(n666), .B1(
        d_ff3_sh_x_out[2]), .C0(n691), .C1(d_ff3_LUT_out[2]), .Y(n656) );
  OAI21XLTS U418 ( .A0(d_ff1_operation_out), .A1(
        d_ff1_shift_region_flag_out[1]), .B0(n702), .Y(n700) );
  INVX2TS U419 ( .A(n714), .Y(n712) );
  INVX2TS U420 ( .A(n714), .Y(n724) );
  INVX3TS U421 ( .A(n709), .Y(n707) );
  INVX2TS U422 ( .A(n714), .Y(n710) );
  CLKBUFX3TS U423 ( .A(n714), .Y(n711) );
  CLKBUFX3TS U424 ( .A(n714), .Y(n713) );
  INVX2TS U425 ( .A(n714), .Y(n706) );
  INVX3TS U426 ( .A(n709), .Y(n705) );
  CLKBUFX3TS U427 ( .A(n721), .Y(n719) );
  CLKBUFX3TS U428 ( .A(n721), .Y(n718) );
  CLKBUFX3TS U429 ( .A(n721), .Y(n716) );
  NAND3X1TS U430 ( .A(enab_cont_iter), .B(n759), .C(n730), .Y(n646) );
  CLKBUFX3TS U431 ( .A(n626), .Y(n709) );
  AOI222X1TS U432 ( .A0(n689), .A1(d_ff2_X[27]), .B0(n731), .B1(d_ff2_Y[27]), 
        .C0(n691), .C1(d_ff2_Z[27]), .Y(n686) );
  AOI222X1TS U433 ( .A0(n667), .A1(d_ff2_X[29]), .B0(n688), .B1(d_ff2_Y[29]), 
        .C0(n691), .C1(d_ff2_Z[29]), .Y(n657) );
  AOI222X1TS U434 ( .A0(n667), .A1(d_ff2_X[25]), .B0(n731), .B1(d_ff2_Y[25]), 
        .C0(n683), .C1(d_ff2_Z[25]), .Y(n684) );
  CLKBUFX3TS U435 ( .A(n739), .Y(n672) );
  CLKBUFX3TS U436 ( .A(n754), .Y(n758) );
  OR2X2TS U437 ( .A(cont_iter_out[2]), .B(n699), .Y(n626) );
  CLKBUFX3TS U438 ( .A(n676), .Y(n691) );
  NAND3BX1TS U439 ( .AN(inst_CORDIC_FSM_v3_state_reg[6]), .B(n620), .C(
        inst_CORDIC_FSM_v3_state_reg[4]), .Y(n727) );
  NAND2BX1TS U440 ( .AN(inst_CORDIC_FSM_v3_state_reg[3]), .B(n624), .Y(n613)
         );
  NAND4BXLTS U441 ( .AN(inst_CORDIC_FSM_v3_state_reg[1]), .B(
        inst_CORDIC_FSM_v3_state_reg[3]), .C(n625), .D(n624), .Y(n647) );
  CLKBUFX3TS U442 ( .A(n683), .Y(n754) );
  CLKBUFX3TS U443 ( .A(n683), .Y(n739) );
  INVX3TS U444 ( .A(n733), .Y(n644) );
  INVX3TS U445 ( .A(n726), .Y(n683) );
  OR2X2TS U446 ( .A(n779), .B(cont_var_out[1]), .Y(n733) );
  OR2X4TS U447 ( .A(n780), .B(cont_var_out[0]), .Y(n697) );
  NAND3XLTS U448 ( .A(n727), .B(n695), .C(n698), .Y(n765) );
  NAND3BXLTS U449 ( .AN(n613), .B(inst_CORDIC_FSM_v3_state_reg[1]), .C(n625), 
        .Y(n622) );
  AOI222X1TS U450 ( .A0(n732), .A1(d_ff2_X[24]), .B0(n755), .B1(d_ff2_Y[24]), 
        .C0(n683), .C1(d_ff2_Z[24]), .Y(n682) );
  AOI222X1TS U451 ( .A0(n693), .A1(d_ff2_X[26]), .B0(n750), .B1(d_ff2_Y[26]), 
        .C0(n683), .C1(d_ff2_Z[26]), .Y(n678) );
  NOR2XLTS U452 ( .A(n698), .B(n733), .Y(enab_d_ff4_Yn) );
  NOR2XLTS U453 ( .A(n730), .B(n621), .Y(ITER_CONT_N3) );
  OR2X1TS U454 ( .A(d_ff_Xn[25]), .B(n627), .Y(first_mux_X[25]) );
  OR2X1TS U455 ( .A(d_ff_Xn[26]), .B(n628), .Y(first_mux_X[26]) );
  OR2X1TS U456 ( .A(d_ff_Xn[24]), .B(n628), .Y(first_mux_X[24]) );
  OR2X1TS U457 ( .A(d_ff_Xn[29]), .B(n628), .Y(first_mux_X[29]) );
  OR2X1TS U458 ( .A(d_ff_Xn[27]), .B(n708), .Y(first_mux_X[27]) );
  AO22XLTS U459 ( .A0(n722), .A1(d_ff_Yn[30]), .B0(n721), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U460 ( .A0(n722), .A1(d_ff_Yn[29]), .B0(n721), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U461 ( .A0(n720), .A1(d_ff_Yn[28]), .B0(n721), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U462 ( .A0(n720), .A1(d_ff_Yn[27]), .B0(n721), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U463 ( .A0(n720), .A1(d_ff_Yn[26]), .B0(n721), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U464 ( .A0(n720), .A1(d_ff_Yn[25]), .B0(n721), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U465 ( .A0(n720), .A1(d_ff_Yn[24]), .B0(n719), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U466 ( .A0(n720), .A1(d_ff_Yn[23]), .B0(n718), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U467 ( .A0(n720), .A1(d_ff_Yn[22]), .B0(n718), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U468 ( .A0(n720), .A1(d_ff_Yn[21]), .B0(n719), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U469 ( .A0(n720), .A1(d_ff_Yn[20]), .B0(n721), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U470 ( .A0(n720), .A1(d_ff_Yn[19]), .B0(n718), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U471 ( .A0(n717), .A1(d_ff_Yn[18]), .B0(n718), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U472 ( .A0(n717), .A1(d_ff_Yn[17]), .B0(n718), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U473 ( .A0(n717), .A1(d_ff_Yn[16]), .B0(n716), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U474 ( .A0(n717), .A1(d_ff_Yn[15]), .B0(n716), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U475 ( .A0(n717), .A1(d_ff_Yn[14]), .B0(n716), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U476 ( .A0(n717), .A1(d_ff_Yn[13]), .B0(n716), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U477 ( .A0(n717), .A1(d_ff_Yn[12]), .B0(n716), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U478 ( .A0(n717), .A1(d_ff_Yn[11]), .B0(n716), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U479 ( .A0(n717), .A1(d_ff_Yn[10]), .B0(n716), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U480 ( .A0(n717), .A1(d_ff_Yn[9]), .B0(n716), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U481 ( .A0(n715), .A1(d_ff_Yn[8]), .B0(n716), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U482 ( .A0(n715), .A1(d_ff_Yn[7]), .B0(n716), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U483 ( .A0(n715), .A1(d_ff_Yn[6]), .B0(n719), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U484 ( .A0(n715), .A1(d_ff_Yn[5]), .B0(n719), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  AO22XLTS U485 ( .A0(n715), .A1(d_ff_Yn[4]), .B0(n719), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  AO22XLTS U486 ( .A0(n715), .A1(d_ff_Yn[3]), .B0(n719), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U487 ( .A0(n715), .A1(d_ff_Yn[2]), .B0(n719), .B1(d_ff_Xn[2]), .Y(
        mux_sal[2]) );
  AO22XLTS U488 ( .A0(n715), .A1(d_ff_Yn[1]), .B0(n719), .B1(d_ff_Xn[1]), .Y(
        mux_sal[1]) );
  AO22XLTS U489 ( .A0(n715), .A1(d_ff_Yn[0]), .B0(n718), .B1(d_ff_Xn[0]), .Y(
        mux_sal[0]) );
  NOR2XLTS U490 ( .A(n623), .B(n529), .Y(ITER_CONT_N5) );
  OAI211XLTS U491 ( .A0(n766), .A1(n733), .B0(n697), .C0(n696), .Y(n519) );
  AO22XLTS U492 ( .A0(n723), .A1(d_ff1_Z[31]), .B0(n714), .B1(d_ff_Zn[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U493 ( .A0(n723), .A1(d_ff1_Z[30]), .B0(n714), .B1(d_ff_Zn[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U494 ( .A0(n723), .A1(d_ff1_Z[29]), .B0(n713), .B1(d_ff_Zn[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U495 ( .A0(n723), .A1(d_ff1_Z[28]), .B0(n713), .B1(d_ff_Zn[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U496 ( .A0(n723), .A1(d_ff1_Z[27]), .B0(n713), .B1(d_ff_Zn[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U497 ( .A0(n710), .A1(d_ff1_Z[26]), .B0(n713), .B1(d_ff_Zn[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U498 ( .A0(n712), .A1(d_ff1_Z[25]), .B0(n713), .B1(d_ff_Zn[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U499 ( .A0(n724), .A1(d_ff1_Z[24]), .B0(n713), .B1(d_ff_Zn[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U500 ( .A0(n710), .A1(d_ff1_Z[23]), .B0(n713), .B1(d_ff_Zn[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U501 ( .A0(n712), .A1(d_ff1_Z[22]), .B0(n713), .B1(d_ff_Zn[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U502 ( .A0(n706), .A1(d_ff1_Z[21]), .B0(n713), .B1(d_ff_Zn[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U503 ( .A0(n723), .A1(d_ff1_Z[20]), .B0(n713), .B1(d_ff_Zn[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U504 ( .A0(n723), .A1(d_ff1_Z[19]), .B0(n711), .B1(d_ff_Zn[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U505 ( .A0(n723), .A1(d_ff1_Z[18]), .B0(n711), .B1(d_ff_Zn[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U506 ( .A0(n724), .A1(d_ff1_Z[17]), .B0(n711), .B1(d_ff_Zn[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U507 ( .A0(n710), .A1(d_ff1_Z[16]), .B0(n711), .B1(d_ff_Zn[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U508 ( .A0(n723), .A1(d_ff1_Z[15]), .B0(n711), .B1(d_ff_Zn[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U509 ( .A0(n712), .A1(d_ff1_Z[14]), .B0(n711), .B1(d_ff_Zn[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U510 ( .A0(n706), .A1(d_ff1_Z[13]), .B0(n711), .B1(d_ff_Zn[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U511 ( .A0(n724), .A1(d_ff1_Z[12]), .B0(n711), .B1(d_ff_Zn[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U512 ( .A0(n706), .A1(d_ff1_Z[11]), .B0(n711), .B1(d_ff_Zn[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U513 ( .A0(n710), .A1(d_ff1_Z[10]), .B0(n711), .B1(d_ff_Zn[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U514 ( .A0(n712), .A1(d_ff1_Z[9]), .B0(n709), .B1(d_ff_Zn[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U515 ( .A0(n627), .A1(d_ff1_Z[8]), .B0(n709), .B1(d_ff_Zn[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U516 ( .A0(n724), .A1(d_ff1_Z[7]), .B0(n709), .B1(d_ff_Zn[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U517 ( .A0(n708), .A1(d_ff1_Z[6]), .B0(n709), .B1(d_ff_Zn[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U518 ( .A0(n628), .A1(d_ff1_Z[5]), .B0(n709), .B1(d_ff_Zn[5]), .Y(
        first_mux_Z[5]) );
  AO22XLTS U519 ( .A0(n627), .A1(d_ff1_Z[4]), .B0(n709), .B1(d_ff_Zn[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U520 ( .A0(n708), .A1(d_ff1_Z[3]), .B0(n709), .B1(d_ff_Zn[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U521 ( .A0(n628), .A1(d_ff1_Z[2]), .B0(n626), .B1(d_ff_Zn[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U522 ( .A0(n706), .A1(d_ff1_Z[1]), .B0(n714), .B1(d_ff_Zn[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U523 ( .A0(n723), .A1(d_ff1_Z[0]), .B0(n626), .B1(d_ff_Zn[0]), .Y(
        first_mux_Z[0]) );
  OR2X1TS U524 ( .A(d_ff_Xn[20]), .B(n628), .Y(first_mux_X[20]) );
  OR2X1TS U525 ( .A(d_ff_Xn[19]), .B(n628), .Y(first_mux_X[19]) );
  OR2X1TS U526 ( .A(d_ff_Xn[17]), .B(n708), .Y(first_mux_X[17]) );
  OR2X1TS U527 ( .A(d_ff_Xn[16]), .B(n627), .Y(first_mux_X[16]) );
  OR2X1TS U528 ( .A(d_ff_Xn[14]), .B(n627), .Y(first_mux_X[14]) );
  OR2X1TS U529 ( .A(d_ff_Xn[13]), .B(n708), .Y(first_mux_X[13]) );
  OR2X1TS U530 ( .A(d_ff_Xn[12]), .B(n628), .Y(first_mux_X[12]) );
  OR2X1TS U531 ( .A(d_ff_Xn[10]), .B(n708), .Y(first_mux_X[10]) );
  OR2X1TS U532 ( .A(d_ff_Xn[7]), .B(n627), .Y(first_mux_X[7]) );
  OR2X1TS U533 ( .A(d_ff_Xn[6]), .B(n628), .Y(first_mux_X[6]) );
  OR2X1TS U534 ( .A(d_ff_Xn[5]), .B(n627), .Y(first_mux_X[5]) );
  OR2X1TS U535 ( .A(d_ff_Xn[3]), .B(n708), .Y(first_mux_X[3]) );
  OR2X1TS U536 ( .A(d_ff_Xn[2]), .B(n708), .Y(first_mux_X[2]) );
  OR2X1TS U537 ( .A(d_ff_Xn[1]), .B(n708), .Y(first_mux_X[1]) );
  XOR2XLTS U538 ( .A(d_ff2_Y[30]), .B(n767), .Y(sh_exp_y[7]) );
  OAI21XLTS U539 ( .A0(n769), .A1(n782), .B0(n768), .Y(sh_exp_y[5]) );
  AO21XLTS U540 ( .A0(intadd_420_n1), .A1(d_ff2_Y[27]), .B0(n769), .Y(
        sh_exp_y[4]) );
  OAI21XLTS U541 ( .A0(cont_iter_out[0]), .A1(n778), .B0(intadd_420_CI), .Y(
        sh_exp_y[0]) );
  XOR2XLTS U542 ( .A(d_ff2_X[30]), .B(n770), .Y(sh_exp_x[7]) );
  OAI21XLTS U543 ( .A0(n772), .A1(n781), .B0(n771), .Y(sh_exp_x[5]) );
  AO21XLTS U544 ( .A0(intadd_419_n1), .A1(d_ff2_X[27]), .B0(n772), .Y(
        sh_exp_x[4]) );
  OAI21XLTS U545 ( .A0(cont_iter_out[0]), .A1(n777), .B0(intadd_419_CI), .Y(
        sh_exp_x[0]) );
  CLKAND2X2TS U546 ( .A(n729), .B(n774), .Y(n529) );
  OR2X1TS U547 ( .A(n535), .B(n763), .Y(n522) );
  OAI31X1TS U548 ( .A0(cont_iter_out[3]), .A1(cont_iter_out[1]), .A2(n773), 
        .B0(n610), .Y(n528) );
  OAI21XLTS U549 ( .A0(n623), .A1(n695), .B0(n622), .Y(
        inst_CORDIC_FSM_v3_state_next[2]) );
  OAI21XLTS U550 ( .A0(ack_cordic), .A1(n649), .B0(n646), .Y(
        inst_CORDIC_FSM_v3_state_next[7]) );
  OR4X2TS U551 ( .A(inst_CORDIC_FSM_v3_state_reg[3]), .B(
        inst_CORDIC_FSM_v3_state_reg[1]), .C(inst_CORDIC_FSM_v3_state_reg[0]), 
        .D(inst_CORDIC_FSM_v3_state_reg[5]), .Y(n605) );
  INVX2TS U552 ( .A(cont_iter_out[1]), .Y(n606) );
  INVX2TS U553 ( .A(n605), .Y(n607) );
  CLKBUFX3TS U554 ( .A(n615), .Y(n618) );
  OAI21XLTS U555 ( .A0(n683), .A1(n727), .B0(n647), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  NAND3X2TS U556 ( .A(n774), .B(n775), .C(n606), .Y(n699) );
  NOR2X4TS U557 ( .A(n773), .B(n774), .Y(n759) );
  CLKINVX3TS U558 ( .A(n733), .Y(n756) );
  INVX2TS U559 ( .A(n697), .Y(n643) );
  CLKINVX3TS U560 ( .A(n733), .Y(n751) );
  NOR3BX2TS U561 ( .AN(inst_CORDIC_FSM_v3_state_reg[2]), .B(
        inst_CORDIC_FSM_v3_state_reg[7]), .C(n609), .Y(
        inst_CORDIC_FSM_v3_state_next[3]) );
  CLKBUFX3TS U562 ( .A(n616), .Y(n617) );
  NOR2X2TS U563 ( .A(n698), .B(n697), .Y(enab_d_ff4_Zn) );
  NOR2X4TS U564 ( .A(n775), .B(n776), .Y(n730) );
  NOR3BX2TS U565 ( .AN(inst_CORDIC_FSM_v3_state_reg[7]), .B(
        inst_CORDIC_FSM_v3_state_reg[2]), .C(n609), .Y(ready_cordic) );
  OAI32X4TS U566 ( .A0(n608), .A1(d_ff1_operation_out), .A2(
        d_ff1_shift_region_flag_out[1]), .B0(d_ff1_shift_region_flag_out[0]), 
        .B1(n702), .Y(n703) );
  OAI21XLTS U567 ( .A0(cont_iter_out[1]), .A1(n761), .B0(n635), .Y(n534) );
  OAI21XLTS U568 ( .A0(n759), .A1(cont_iter_out[1]), .B0(n635), .Y(n536) );
  AOI21X2TS U569 ( .A0(cont_iter_out[2]), .A1(n774), .B0(n619), .Y(n635) );
  OAI21XLTS U570 ( .A0(beg_fsm_cordic), .A1(n725), .B0(n651), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  OR2X1TS U571 ( .A(d_ff_Xn[28]), .B(n627), .Y(first_mux_X[28]) );
  OAI21XLTS U572 ( .A0(cont_iter_out[0]), .A1(n537), .B0(n764), .Y(n521) );
  OAI211XLTS U573 ( .A0(n621), .A1(n611), .B0(n610), .C0(n699), .Y(n527) );
  NOR2X1TS U574 ( .A(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[6]), .Y(n612) );
  NAND2X1TS U575 ( .A(n607), .B(n612), .Y(n609) );
  NOR2X1TS U576 ( .A(cont_iter_out[0]), .B(cont_iter_out[1]), .Y(n621) );
  NAND2X1TS U577 ( .A(n773), .B(cont_iter_out[3]), .Y(n611) );
  NAND2X1TS U578 ( .A(n730), .B(n773), .Y(n610) );
  INVX2TS U579 ( .A(n759), .Y(n537) );
  INVX2TS U580 ( .A(n611), .Y(n619) );
  NAND2X1TS U581 ( .A(n537), .B(cont_iter_out[0]), .Y(n764) );
  INVX2TS U582 ( .A(n764), .Y(n763) );
  NOR2X1TS U583 ( .A(n619), .B(n763), .Y(n760) );
  OAI211X1TS U584 ( .A0(cont_iter_out[3]), .A1(n775), .B0(n773), .C0(n776), 
        .Y(n762) );
  OAI21XLTS U585 ( .A0(n760), .A1(n776), .B0(n762), .Y(n526) );
  OAI31X4TS U586 ( .A0(cont_iter_out[2]), .A1(cont_iter_out[3]), .A2(n775), 
        .B0(n537), .Y(n761) );
  OAI21XLTS U587 ( .A0(n776), .A1(n761), .B0(n611), .Y(n532) );
  NOR3BX1TS U588 ( .AN(n612), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[2]), .Y(n624) );
  NOR2X1TS U589 ( .A(inst_CORDIC_FSM_v3_state_reg[0]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .Y(n625) );
  NOR2X1TS U590 ( .A(inst_CORDIC_FSM_v3_state_reg[1]), .B(n613), .Y(n614) );
  NAND3BX1TS U591 ( .AN(inst_CORDIC_FSM_v3_state_reg[5]), .B(
        inst_CORDIC_FSM_v3_state_reg[0]), .C(n614), .Y(n725) );
  NAND2X1TS U592 ( .A(n622), .B(n725), .Y(enab_d_ff_RB1) );
  INVX2TS U593 ( .A(ready_add_subt), .Y(n698) );
  OAI21XLTS U594 ( .A0(n759), .A1(n776), .B0(n761), .Y(n531) );
  NOR3BX1TS U595 ( .AN(n607), .B(inst_CORDIC_FSM_v3_state_reg[7]), .C(
        inst_CORDIC_FSM_v3_state_reg[2]), .Y(n620) );
  NAND3BX1TS U596 ( .AN(inst_CORDIC_FSM_v3_state_reg[0]), .B(
        inst_CORDIC_FSM_v3_state_reg[5]), .C(n614), .Y(n728) );
  NAND2X1TS U597 ( .A(n727), .B(n728), .Y(beg_add_subt) );
  INVX2TS U598 ( .A(rst), .Y(n154) );
  BUFX3TS U599 ( .A(n618), .Y(n817) );
  BUFX3TS U600 ( .A(n817), .Y(n809) );
  BUFX3TS U601 ( .A(n817), .Y(n808) );
  BUFX3TS U602 ( .A(n617), .Y(n807) );
  CLKBUFX2TS U603 ( .A(n154), .Y(n615) );
  BUFX3TS U604 ( .A(n618), .Y(n802) );
  BUFX3TS U605 ( .A(n615), .Y(n806) );
  BUFX3TS U606 ( .A(n615), .Y(n803) );
  BUFX3TS U607 ( .A(n618), .Y(n804) );
  BUFX3TS U608 ( .A(n618), .Y(n818) );
  BUFX3TS U609 ( .A(n818), .Y(n816) );
  CLKBUFX2TS U610 ( .A(n154), .Y(n616) );
  BUFX3TS U611 ( .A(n617), .Y(n789) );
  BUFX3TS U612 ( .A(n617), .Y(n790) );
  BUFX3TS U613 ( .A(n818), .Y(n815) );
  BUFX3TS U614 ( .A(n616), .Y(n791) );
  BUFX3TS U615 ( .A(n617), .Y(n792) );
  BUFX3TS U616 ( .A(n617), .Y(n793) );
  BUFX3TS U617 ( .A(n616), .Y(n794) );
  BUFX3TS U618 ( .A(n615), .Y(n795) );
  BUFX3TS U619 ( .A(n615), .Y(n796) );
  BUFX3TS U620 ( .A(n618), .Y(n797) );
  BUFX3TS U621 ( .A(n818), .Y(n814) );
  BUFX3TS U622 ( .A(n615), .Y(n798) );
  BUFX3TS U623 ( .A(n618), .Y(n799) );
  BUFX3TS U624 ( .A(n618), .Y(n800) );
  BUFX3TS U625 ( .A(n618), .Y(n801) );
  BUFX3TS U626 ( .A(n818), .Y(n813) );
  BUFX3TS U627 ( .A(n616), .Y(n783) );
  BUFX3TS U628 ( .A(n817), .Y(n812) );
  BUFX3TS U629 ( .A(n616), .Y(n784) );
  BUFX3TS U630 ( .A(n617), .Y(n785) );
  BUFX3TS U631 ( .A(n616), .Y(n786) );
  BUFX3TS U632 ( .A(n817), .Y(n811) );
  BUFX3TS U633 ( .A(n617), .Y(n787) );
  BUFX3TS U634 ( .A(n817), .Y(n810) );
  BUFX3TS U635 ( .A(n617), .Y(n788) );
  BUFX3TS U636 ( .A(n618), .Y(n805) );
  NAND2X1TS U637 ( .A(n635), .B(n764), .Y(n523) );
  NAND3BX1TS U638 ( .AN(inst_CORDIC_FSM_v3_state_reg[4]), .B(
        inst_CORDIC_FSM_v3_state_reg[6]), .C(n620), .Y(n695) );
  INVX2TS U639 ( .A(n695), .Y(enab_cont_iter) );
  INVX2TS U640 ( .A(ready_cordic), .Y(n649) );
  NAND2X1TS U641 ( .A(n649), .B(n646), .Y(enab_d_ff5_data_out) );
  NAND2X1TS U642 ( .A(n777), .B(cont_iter_out[0]), .Y(intadd_419_CI) );
  NAND2X1TS U643 ( .A(n778), .B(cont_iter_out[0]), .Y(intadd_420_CI) );
  NOR2X1TS U644 ( .A(d_ff2_X[27]), .B(intadd_419_n1), .Y(n772) );
  OR3X1TS U645 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(intadd_419_n1), .Y(n771)
         );
  NOR2X1TS U646 ( .A(d_ff2_Y[27]), .B(intadd_420_n1), .Y(n769) );
  OR3X1TS U647 ( .A(d_ff2_Y[28]), .B(d_ff2_Y[27]), .C(intadd_420_n1), .Y(n768)
         );
  NAND2X1TS U648 ( .A(cont_iter_out[2]), .B(n730), .Y(n729) );
  NOR2X1TS U649 ( .A(n774), .B(n729), .Y(n623) );
  NAND2X1TS U650 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .Y(n726) );
  INVX2TS U651 ( .A(n626), .Y(n627) );
  INVX2TS U652 ( .A(n626), .Y(n628) );
  INVX2TS U653 ( .A(n626), .Y(n708) );
  AOI222X1TS U654 ( .A0(n644), .A1(d_ff2_X[6]), .B0(n692), .B1(d_ff2_Y[6]), 
        .C0(n739), .C1(d_ff2_Z[6]), .Y(n629) );
  INVX2TS U655 ( .A(n629), .Y(add_subt_dataA[6]) );
  AOI222X1TS U656 ( .A0(n644), .A1(d_ff2_X[3]), .B0(n692), .B1(d_ff2_Y[3]), 
        .C0(n739), .C1(d_ff2_Z[3]), .Y(n630) );
  INVX2TS U657 ( .A(n630), .Y(add_subt_dataA[3]) );
  INVX2TS U658 ( .A(n697), .Y(n755) );
  AOI222X1TS U659 ( .A0(n756), .A1(d_ff2_X[1]), .B0(n643), .B1(d_ff2_Y[1]), 
        .C0(n739), .C1(d_ff2_Z[1]), .Y(n631) );
  INVX2TS U660 ( .A(n631), .Y(add_subt_dataA[1]) );
  AOI222X1TS U661 ( .A0(n756), .A1(d_ff2_X[4]), .B0(n750), .B1(d_ff2_Y[4]), 
        .C0(n739), .C1(d_ff2_Z[4]), .Y(n632) );
  INVX2TS U662 ( .A(n632), .Y(add_subt_dataA[4]) );
  AOI222X1TS U663 ( .A0(n756), .A1(d_ff2_X[2]), .B0(n755), .B1(d_ff2_Y[2]), 
        .C0(n739), .C1(d_ff2_Z[2]), .Y(n633) );
  INVX2TS U664 ( .A(n633), .Y(add_subt_dataA[2]) );
  AOI222X1TS U665 ( .A0(n756), .A1(d_ff2_X[5]), .B0(n731), .B1(d_ff2_Y[5]), 
        .C0(n739), .C1(d_ff2_Z[5]), .Y(n634) );
  INVX2TS U666 ( .A(n634), .Y(add_subt_dataA[5]) );
  OAI21X1TS U667 ( .A0(n759), .A1(n776), .B0(n635), .Y(n535) );
  AOI222X1TS U668 ( .A0(n644), .A1(d_ff2_X[7]), .B0(n692), .B1(d_ff2_Y[7]), 
        .C0(n672), .C1(d_ff2_Z[7]), .Y(n636) );
  INVX2TS U669 ( .A(n636), .Y(add_subt_dataA[7]) );
  AOI222X1TS U670 ( .A0(n644), .A1(d_ff2_X[10]), .B0(n692), .B1(d_ff2_Y[10]), 
        .C0(n672), .C1(d_ff2_Z[10]), .Y(n637) );
  INVX2TS U671 ( .A(n637), .Y(add_subt_dataA[10]) );
  AOI222X1TS U672 ( .A0(n644), .A1(d_ff2_X[13]), .B0(n692), .B1(d_ff2_Y[13]), 
        .C0(n672), .C1(d_ff2_Z[13]), .Y(n638) );
  INVX2TS U673 ( .A(n638), .Y(add_subt_dataA[13]) );
  AOI222X1TS U674 ( .A0(n644), .A1(d_ff2_X[11]), .B0(n692), .B1(d_ff2_Y[11]), 
        .C0(n672), .C1(d_ff2_Z[11]), .Y(n639) );
  INVX2TS U675 ( .A(n639), .Y(add_subt_dataA[11]) );
  AOI222X1TS U676 ( .A0(n644), .A1(d_ff2_X[12]), .B0(n692), .B1(d_ff2_Y[12]), 
        .C0(n672), .C1(d_ff2_Z[12]), .Y(n640) );
  INVX2TS U677 ( .A(n640), .Y(add_subt_dataA[12]) );
  AOI222X1TS U678 ( .A0(n644), .A1(d_ff2_X[9]), .B0(n692), .B1(d_ff2_Y[9]), 
        .C0(n672), .C1(d_ff2_Z[9]), .Y(n641) );
  INVX2TS U679 ( .A(n641), .Y(add_subt_dataA[9]) );
  AOI222X1TS U680 ( .A0(n644), .A1(d_ff2_X[8]), .B0(n692), .B1(d_ff2_Y[8]), 
        .C0(n672), .C1(d_ff2_Z[8]), .Y(n642) );
  INVX2TS U681 ( .A(n642), .Y(add_subt_dataA[8]) );
  AOI222X1TS U682 ( .A0(n644), .A1(d_ff2_X[14]), .B0(n643), .B1(d_ff2_Y[14]), 
        .C0(n672), .C1(d_ff2_Z[14]), .Y(n645) );
  INVX2TS U683 ( .A(n645), .Y(add_subt_dataA[14]) );
  INVX2TS U684 ( .A(n647), .Y(enab_RB3) );
  NOR4X1TS U685 ( .A(enab_cont_iter), .B(enab_RB3), .C(enab_d_ff_RB1), .D(
        beg_add_subt), .Y(n650) );
  INVX2TS U686 ( .A(inst_CORDIC_FSM_v3_state_next[3]), .Y(n648) );
  AOI32X1TS U687 ( .A0(n650), .A1(n649), .A2(n648), .B0(ready_cordic), .B1(
        ack_cordic), .Y(n651) );
  CLKBUFX2TS U688 ( .A(n733), .Y(n669) );
  INVX2TS U689 ( .A(n669), .Y(n732) );
  INVX2TS U690 ( .A(n697), .Y(n731) );
  AOI222X1TS U691 ( .A0(n667), .A1(d_ff3_sh_y_out[25]), .B0(n750), .B1(
        d_ff3_sh_x_out[25]), .C0(n758), .C1(d_ff3_LUT_out[25]), .Y(n652) );
  INVX2TS U692 ( .A(n652), .Y(add_subt_dataB[25]) );
  AOI222X1TS U693 ( .A0(n689), .A1(d_ff3_sh_y_out[26]), .B0(n755), .B1(
        d_ff3_sh_x_out[26]), .C0(n739), .C1(d_ff3_LUT_out[26]), .Y(n653) );
  INVX2TS U694 ( .A(n653), .Y(add_subt_dataB[26]) );
  INVX2TS U695 ( .A(n669), .Y(n689) );
  INVX2TS U696 ( .A(n697), .Y(n688) );
  CLKBUFX2TS U697 ( .A(n683), .Y(n676) );
  AOI222X1TS U698 ( .A0(n667), .A1(d_ff3_sh_y_out[0]), .B0(n688), .B1(
        d_ff3_sh_x_out[0]), .C0(n691), .C1(d_ff3_LUT_out[0]), .Y(n654) );
  INVX2TS U699 ( .A(n654), .Y(add_subt_dataB[0]) );
  INVX2TS U700 ( .A(n669), .Y(n667) );
  INVX2TS U701 ( .A(n697), .Y(n666) );
  INVX2TS U702 ( .A(n655), .Y(add_subt_dataB[24]) );
  INVX2TS U703 ( .A(n656), .Y(add_subt_dataB[2]) );
  INVX2TS U704 ( .A(n657), .Y(add_subt_dataA[29]) );
  INVX2TS U705 ( .A(n658), .Y(add_subt_dataB[4]) );
  INVX2TS U706 ( .A(n659), .Y(add_subt_dataB[21]) );
  INVX2TS U707 ( .A(n660), .Y(add_subt_dataB[6]) );
  AOI222X1TS U708 ( .A0(n689), .A1(d_ff3_sh_y_out[1]), .B0(n750), .B1(
        d_ff3_sh_x_out[1]), .C0(n691), .C1(d_ff3_LUT_out[1]), .Y(n661) );
  INVX2TS U709 ( .A(n661), .Y(add_subt_dataB[1]) );
  INVX2TS U710 ( .A(n662), .Y(add_subt_dataB[8]) );
  INVX2TS U711 ( .A(n663), .Y(add_subt_dataB[9]) );
  INVX2TS U712 ( .A(n664), .Y(add_subt_dataB[10]) );
  INVX2TS U713 ( .A(n665), .Y(add_subt_dataB[23]) );
  INVX2TS U714 ( .A(n668), .Y(add_subt_dataB[12]) );
  INVX2TS U715 ( .A(n669), .Y(n693) );
  INVX2TS U716 ( .A(n697), .Y(n692) );
  AOI222X1TS U717 ( .A0(n693), .A1(d_ff2_X[20]), .B0(n643), .B1(d_ff2_Y[20]), 
        .C0(n676), .C1(d_ff2_Z[20]), .Y(n670) );
  INVX2TS U718 ( .A(n670), .Y(add_subt_dataA[20]) );
  AOI222X1TS U719 ( .A0(n732), .A1(d_ff2_X[15]), .B0(n750), .B1(d_ff2_Y[15]), 
        .C0(n672), .C1(d_ff2_Z[15]), .Y(n671) );
  INVX2TS U720 ( .A(n671), .Y(add_subt_dataA[15]) );
  AOI222X1TS U721 ( .A0(n667), .A1(d_ff2_X[16]), .B0(n755), .B1(d_ff2_Y[16]), 
        .C0(n672), .C1(d_ff2_Z[16]), .Y(n673) );
  INVX2TS U722 ( .A(n673), .Y(add_subt_dataA[16]) );
  AOI222X1TS U723 ( .A0(n689), .A1(d_ff2_X[17]), .B0(n688), .B1(d_ff2_Y[17]), 
        .C0(n676), .C1(d_ff2_Z[17]), .Y(n674) );
  INVX2TS U724 ( .A(n674), .Y(add_subt_dataA[17]) );
  AOI222X1TS U725 ( .A0(n693), .A1(d_ff2_X[18]), .B0(n731), .B1(d_ff2_Y[18]), 
        .C0(n676), .C1(d_ff2_Z[18]), .Y(n675) );
  INVX2TS U726 ( .A(n675), .Y(add_subt_dataA[18]) );
  AOI222X1TS U727 ( .A0(n732), .A1(d_ff2_X[19]), .B0(n643), .B1(d_ff2_Y[19]), 
        .C0(n676), .C1(d_ff2_Z[19]), .Y(n677) );
  INVX2TS U728 ( .A(n677), .Y(add_subt_dataA[19]) );
  INVX2TS U729 ( .A(n678), .Y(add_subt_dataA[26]) );
  AOI222X1TS U730 ( .A0(n667), .A1(d_ff2_X[21]), .B0(n750), .B1(d_ff2_Y[21]), 
        .C0(n683), .C1(d_ff2_Z[21]), .Y(n679) );
  INVX2TS U731 ( .A(n679), .Y(add_subt_dataA[21]) );
  AOI222X1TS U732 ( .A0(n689), .A1(d_ff2_X[22]), .B0(n755), .B1(d_ff2_Y[22]), 
        .C0(n683), .C1(d_ff2_Z[22]), .Y(n680) );
  INVX2TS U733 ( .A(n680), .Y(add_subt_dataA[22]) );
  AOI222X1TS U734 ( .A0(n693), .A1(d_ff2_X[23]), .B0(n688), .B1(d_ff2_Y[23]), 
        .C0(n683), .C1(d_ff2_Z[23]), .Y(n681) );
  INVX2TS U735 ( .A(n681), .Y(add_subt_dataA[23]) );
  INVX2TS U736 ( .A(n682), .Y(add_subt_dataA[24]) );
  INVX2TS U737 ( .A(n684), .Y(add_subt_dataA[25]) );
  AOI222X1TS U738 ( .A0(n689), .A1(d_ff2_X[28]), .B0(n755), .B1(d_ff2_Y[28]), 
        .C0(n691), .C1(d_ff2_Z[28]), .Y(n685) );
  INVX2TS U739 ( .A(n685), .Y(add_subt_dataA[28]) );
  INVX2TS U740 ( .A(n686), .Y(add_subt_dataA[27]) );
  INVX2TS U741 ( .A(n687), .Y(add_subt_dataA[30]) );
  AOI222X1TS U742 ( .A0(n732), .A1(d_ff2_X[31]), .B0(n643), .B1(d_ff2_Y[31]), 
        .C0(n691), .C1(d_ff2_Z[31]), .Y(n690) );
  INVX2TS U743 ( .A(n690), .Y(add_subt_dataA[31]) );
  AOI222X1TS U744 ( .A0(n732), .A1(d_ff2_X[0]), .B0(n731), .B1(d_ff2_Y[0]), 
        .C0(n691), .C1(d_ff2_Z[0]), .Y(n694) );
  INVX2TS U745 ( .A(n694), .Y(add_subt_dataA[0]) );
  INVX2TS U746 ( .A(n765), .Y(n766) );
  NAND2X1TS U747 ( .A(n766), .B(cont_var_out[1]), .Y(n696) );
  NOR3XLTS U748 ( .A(cont_var_out[0]), .B(cont_var_out[1]), .C(n698), .Y(
        enab_d_ff4_Xn) );
  AOI32X1TS U750 ( .A0(cont_iter_out[3]), .A1(n699), .A2(n776), .B0(
        cont_iter_out[2]), .B1(n699), .Y(data_out_LUT[4]) );
  OAI22X1TS U751 ( .A0(cont_iter_out[3]), .A1(n729), .B0(cont_iter_out[2]), 
        .B1(n730), .Y(data_out_LUT[25]) );
  NAND2X1TS U752 ( .A(d_ff1_operation_out), .B(d_ff1_shift_region_flag_out[1]), 
        .Y(n702) );
  XOR2X1TS U753 ( .A(n608), .B(n700), .Y(n701) );
  INVX2TS U754 ( .A(n701), .Y(n721) );
  INVX2TS U755 ( .A(n719), .Y(n715) );
  AOI22X1TS U756 ( .A0(n715), .A1(d_ff_Yn[31]), .B0(d_ff_Xn[31]), .B1(n719), 
        .Y(n704) );
  XNOR2X1TS U757 ( .A(n704), .B(n703), .Y(fmtted_Result_31_) );
  NOR2BX1TS U758 ( .AN(d_ff_Yn[0]), .B(n705), .Y(first_mux_Y[0]) );
  NOR2BX1TS U759 ( .AN(d_ff_Yn[1]), .B(n705), .Y(first_mux_Y[1]) );
  NOR2BX1TS U760 ( .AN(d_ff_Yn[2]), .B(n705), .Y(first_mux_Y[2]) );
  NOR2BX1TS U761 ( .AN(d_ff_Yn[3]), .B(n705), .Y(first_mux_Y[3]) );
  NOR2BX1TS U762 ( .AN(d_ff_Yn[4]), .B(n705), .Y(first_mux_Y[4]) );
  NOR2BX1TS U763 ( .AN(d_ff_Yn[5]), .B(n705), .Y(first_mux_Y[5]) );
  NOR2BX1TS U764 ( .AN(d_ff_Yn[6]), .B(n705), .Y(first_mux_Y[6]) );
  NOR2BX1TS U765 ( .AN(d_ff_Yn[7]), .B(n705), .Y(first_mux_Y[7]) );
  NOR2BX1TS U766 ( .AN(d_ff_Yn[8]), .B(n705), .Y(first_mux_Y[8]) );
  NOR2BX1TS U767 ( .AN(d_ff_Yn[9]), .B(n705), .Y(first_mux_Y[9]) );
  BUFX3TS U768 ( .A(n626), .Y(n714) );
  NOR2BX1TS U769 ( .AN(d_ff_Yn[10]), .B(n706), .Y(first_mux_Y[10]) );
  NOR2BX1TS U770 ( .AN(d_ff_Yn[11]), .B(n724), .Y(first_mux_Y[11]) );
  NOR2BX1TS U771 ( .AN(d_ff_Yn[12]), .B(n712), .Y(first_mux_Y[12]) );
  NOR2BX1TS U772 ( .AN(d_ff_Yn[13]), .B(n710), .Y(first_mux_Y[13]) );
  NOR2BX1TS U773 ( .AN(d_ff_Yn[14]), .B(n706), .Y(first_mux_Y[14]) );
  NOR2BX1TS U774 ( .AN(d_ff_Yn[15]), .B(n724), .Y(first_mux_Y[15]) );
  NOR2BX1TS U775 ( .AN(d_ff_Yn[16]), .B(n712), .Y(first_mux_Y[16]) );
  NOR2BX1TS U776 ( .AN(d_ff_Yn[17]), .B(n710), .Y(first_mux_Y[17]) );
  NOR2BX1TS U777 ( .AN(d_ff_Yn[18]), .B(n706), .Y(first_mux_Y[18]) );
  NOR2BX1TS U778 ( .AN(d_ff_Yn[19]), .B(n724), .Y(first_mux_Y[19]) );
  NOR2BX1TS U779 ( .AN(d_ff_Yn[20]), .B(n707), .Y(first_mux_Y[20]) );
  NOR2BX1TS U780 ( .AN(d_ff_Yn[21]), .B(n707), .Y(first_mux_Y[21]) );
  NOR2BX1TS U781 ( .AN(d_ff_Yn[22]), .B(n707), .Y(first_mux_Y[22]) );
  NOR2BX1TS U782 ( .AN(d_ff_Yn[23]), .B(n707), .Y(first_mux_Y[23]) );
  NOR2BX1TS U783 ( .AN(d_ff_Yn[24]), .B(n707), .Y(first_mux_Y[24]) );
  NOR2BX1TS U784 ( .AN(d_ff_Yn[25]), .B(n707), .Y(first_mux_Y[25]) );
  NOR2BX1TS U785 ( .AN(d_ff_Yn[26]), .B(n707), .Y(first_mux_Y[26]) );
  NOR2BX1TS U786 ( .AN(d_ff_Yn[27]), .B(n707), .Y(first_mux_Y[27]) );
  NOR2BX1TS U787 ( .AN(d_ff_Yn[28]), .B(n707), .Y(first_mux_Y[28]) );
  NOR2BX1TS U788 ( .AN(d_ff_Yn[29]), .B(n707), .Y(first_mux_Y[29]) );
  INVX2TS U789 ( .A(n714), .Y(n723) );
  NOR2BX1TS U790 ( .AN(d_ff_Yn[30]), .B(n706), .Y(first_mux_Y[30]) );
  NOR2BX1TS U791 ( .AN(d_ff_Yn[31]), .B(n712), .Y(first_mux_Y[31]) );
  INVX2TS U792 ( .A(n718), .Y(n717) );
  INVX2TS U793 ( .A(n718), .Y(n720) );
  INVX2TS U794 ( .A(n718), .Y(n722) );
  NOR2BX1TS U795 ( .AN(d_ff_Xn[0]), .B(n712), .Y(first_mux_X[0]) );
  NOR2BX1TS U796 ( .AN(d_ff_Xn[4]), .B(n710), .Y(first_mux_X[4]) );
  NOR2BX1TS U797 ( .AN(d_ff_Xn[8]), .B(n706), .Y(first_mux_X[8]) );
  NOR2BX1TS U798 ( .AN(d_ff_Xn[9]), .B(n710), .Y(first_mux_X[9]) );
  NOR2BX1TS U799 ( .AN(d_ff_Xn[11]), .B(n724), .Y(first_mux_X[11]) );
  NOR2BX1TS U800 ( .AN(d_ff_Xn[15]), .B(n706), .Y(first_mux_X[15]) );
  NOR2BX1TS U801 ( .AN(d_ff_Xn[18]), .B(n712), .Y(first_mux_X[18]) );
  NOR2BX1TS U802 ( .AN(d_ff_Xn[21]), .B(n710), .Y(first_mux_X[21]) );
  NOR2BX1TS U803 ( .AN(d_ff_Xn[22]), .B(n724), .Y(first_mux_X[22]) );
  NOR2BX1TS U804 ( .AN(d_ff_Xn[23]), .B(n712), .Y(first_mux_X[23]) );
  NOR2BX1TS U805 ( .AN(d_ff_Xn[30]), .B(n710), .Y(first_mux_X[30]) );
  NOR2BX1TS U806 ( .AN(d_ff_Xn[31]), .B(n724), .Y(first_mux_X[31]) );
  NOR2BX1TS U807 ( .AN(beg_fsm_cordic), .B(n725), .Y(
        inst_CORDIC_FSM_v3_state_next[1]) );
  OAI22X1TS U808 ( .A0(enab_d_ff4_Zn), .A1(n728), .B0(n727), .B1(n726), .Y(
        inst_CORDIC_FSM_v3_state_next[5]) );
  NOR2BX1TS U809 ( .AN(enab_d_ff4_Zn), .B(n728), .Y(
        inst_CORDIC_FSM_v3_state_next[6]) );
  OA21XLTS U810 ( .A0(cont_iter_out[2]), .A1(n730), .B0(n729), .Y(ITER_CONT_N4) );
  XOR2XLTS U811 ( .A(d_ff3_sign_out), .B(cont_var_out[0]), .Y(op_add_subt) );
  AO22XLTS U812 ( .A0(n693), .A1(d_ff3_sh_y_out[31]), .B0(n688), .B1(
        d_ff3_sh_x_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U813 ( .A0(n732), .A1(d_ff3_sh_y_out[30]), .B0(n731), .B1(
        d_ff3_sh_x_out[30]), .Y(add_subt_dataB[30]) );
  INVX2TS U814 ( .A(n697), .Y(n750) );
  AOI22X1TS U815 ( .A0(n751), .A1(d_ff3_sh_y_out[29]), .B0(n643), .B1(
        d_ff3_sh_x_out[29]), .Y(n734) );
  NAND2X1TS U816 ( .A(n739), .B(d_ff3_LUT_out[27]), .Y(n736) );
  NAND2X1TS U817 ( .A(n734), .B(n736), .Y(add_subt_dataB[29]) );
  AOI22X1TS U818 ( .A0(n751), .A1(d_ff3_sh_y_out[28]), .B0(n750), .B1(
        d_ff3_sh_x_out[28]), .Y(n735) );
  NAND2X1TS U819 ( .A(n735), .B(n736), .Y(add_subt_dataB[28]) );
  AOI22X1TS U820 ( .A0(n751), .A1(d_ff3_sh_y_out[27]), .B0(n755), .B1(
        d_ff3_sh_x_out[27]), .Y(n737) );
  NAND2X1TS U821 ( .A(n737), .B(n736), .Y(add_subt_dataB[27]) );
  AOI22X1TS U822 ( .A0(n751), .A1(d_ff3_sh_y_out[22]), .B0(n750), .B1(
        d_ff3_sh_x_out[22]), .Y(n738) );
  OAI2BB1X1TS U823 ( .A0N(n754), .A1N(d_ff3_LUT_out[19]), .B0(n738), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U824 ( .A0(n751), .A1(d_ff3_sh_y_out[20]), .B0(n688), .B1(
        d_ff3_sh_x_out[20]), .Y(n740) );
  NAND2X1TS U825 ( .A(n739), .B(d_ff3_LUT_out[15]), .Y(n745) );
  NAND2X1TS U826 ( .A(n740), .B(n745), .Y(add_subt_dataB[20]) );
  AOI22X1TS U827 ( .A0(n751), .A1(d_ff3_sh_y_out[19]), .B0(n755), .B1(
        d_ff3_sh_x_out[19]), .Y(n741) );
  OAI2BB1X1TS U828 ( .A0N(n754), .A1N(d_ff3_LUT_out[19]), .B0(n741), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U829 ( .A0(n751), .A1(d_ff3_sh_y_out[18]), .B0(n688), .B1(
        d_ff3_sh_x_out[18]), .Y(n742) );
  OAI2BB1X1TS U830 ( .A0N(n754), .A1N(d_ff3_LUT_out[13]), .B0(n742), .Y(
        add_subt_dataB[18]) );
  AOI22X1TS U831 ( .A0(n751), .A1(d_ff3_sh_y_out[17]), .B0(n731), .B1(
        d_ff3_sh_x_out[17]), .Y(n743) );
  NAND2X1TS U832 ( .A(n743), .B(n745), .Y(add_subt_dataB[17]) );
  AOI22X1TS U833 ( .A0(n756), .A1(d_ff3_sh_y_out[16]), .B0(n750), .B1(
        d_ff3_sh_x_out[16]), .Y(n744) );
  OAI2BB1X1TS U834 ( .A0N(n754), .A1N(d_ff3_LUT_out[3]), .B0(n744), .Y(
        add_subt_dataB[16]) );
  AOI22X1TS U835 ( .A0(n756), .A1(d_ff3_sh_y_out[15]), .B0(n643), .B1(
        d_ff3_sh_x_out[15]), .Y(n746) );
  NAND2X1TS U836 ( .A(n746), .B(n745), .Y(add_subt_dataB[15]) );
  AOI22X1TS U837 ( .A0(n751), .A1(d_ff3_sh_y_out[14]), .B0(n731), .B1(
        d_ff3_sh_x_out[14]), .Y(n747) );
  OAI2BB1X1TS U838 ( .A0N(n754), .A1N(d_ff3_LUT_out[5]), .B0(n747), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U839 ( .A0(n756), .A1(d_ff3_sh_y_out[13]), .B0(n755), .B1(
        d_ff3_sh_x_out[13]), .Y(n748) );
  OAI2BB1X1TS U840 ( .A0N(n754), .A1N(d_ff3_LUT_out[13]), .B0(n748), .Y(
        add_subt_dataB[13]) );
  AOI22X1TS U841 ( .A0(n756), .A1(d_ff3_sh_y_out[11]), .B0(n688), .B1(
        d_ff3_sh_x_out[11]), .Y(n749) );
  OAI2BB1X1TS U842 ( .A0N(n754), .A1N(d_ff3_LUT_out[7]), .B0(n749), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U843 ( .A0(n751), .A1(d_ff3_sh_y_out[7]), .B0(n643), .B1(
        d_ff3_sh_x_out[7]), .Y(n752) );
  OAI2BB1X1TS U844 ( .A0N(n754), .A1N(d_ff3_LUT_out[7]), .B0(n752), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U845 ( .A0(n756), .A1(d_ff3_sh_y_out[5]), .B0(n731), .B1(
        d_ff3_sh_x_out[5]), .Y(n753) );
  OAI2BB1X1TS U846 ( .A0N(n754), .A1N(d_ff3_LUT_out[5]), .B0(n753), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U847 ( .A0(n756), .A1(d_ff3_sh_y_out[3]), .B0(n643), .B1(
        d_ff3_sh_x_out[3]), .Y(n757) );
  OAI2BB1X1TS U848 ( .A0N(n758), .A1N(d_ff3_LUT_out[3]), .B0(n757), .Y(
        add_subt_dataB[3]) );
  AOI22X1TS U849 ( .A0(cont_iter_out[1]), .A1(n761), .B0(n759), .B1(n606), .Y(
        n533) );
  AOI22X1TS U850 ( .A0(cont_iter_out[1]), .A1(n761), .B0(n760), .B1(n776), .Y(
        n525) );
  OAI2BB1X1TS U851 ( .A0N(cont_iter_out[1]), .A1N(n523), .B0(n762), .Y(n524)
         );
  AOI22X1TS U852 ( .A0(cont_iter_out[1]), .A1(n764), .B0(n763), .B1(n776), .Y(
        n520) );
  AOI22X1TS U853 ( .A0(n766), .A1(n779), .B0(cont_var_out[0]), .B1(n765), .Y(
        n518) );
  NOR2XLTS U855 ( .A(d_ff2_Y[29]), .B(n768), .Y(n767) );
  XNOR2X1TS U856 ( .A(d_ff2_Y[29]), .B(n768), .Y(sh_exp_y[6]) );
  NOR2XLTS U857 ( .A(d_ff2_X[29]), .B(n771), .Y(n770) );
  XNOR2X1TS U858 ( .A(d_ff2_X[29]), .B(n771), .Y(sh_exp_x[6]) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule

