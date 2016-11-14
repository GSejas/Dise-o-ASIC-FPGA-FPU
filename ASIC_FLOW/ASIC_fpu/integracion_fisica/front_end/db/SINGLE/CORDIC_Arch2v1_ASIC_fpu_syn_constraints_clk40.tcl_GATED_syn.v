/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:01:27 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_counter_d_W4_31 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_15 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_16 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_18 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_19 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_20 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_22 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_25 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5_1 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_fsm_cordic, 
        ack_cordic, operation, data_in, shift_region_flag, ready_cordic, 
        data_output, beg_add_subt, ack_add_subt, add_subt_dataA, 
        add_subt_dataB, result_add_subt, op_add_subt, ready_add_subt );
  input [31:0] data_in;
  input [1:0] shift_region_flag;
  output [31:0] data_output;
  output [31:0] add_subt_dataA;
  output [31:0] add_subt_dataB;
  input [31:0] result_add_subt;
  input clk, rst, beg_fsm_cordic, ack_cordic, operation, ready_add_subt;
  output ready_cordic, beg_add_subt, ack_add_subt, op_add_subt;
  wire   d_ff1_operation_out, enab_cont_iter, load_cont_iter, enab_d_ff2_RB2,
         enab_d_ff4_Xn, enab_d_ff4_Yn, enab_d_ff4_Zn, enab_d_ff5_data_out,
         enab_dff_5, sel_mux_1_reg, d_ff3_sign_out, sel_mux_3_reg,
         data_output2_31_, cordic_FSM_state_next_1_, cont_iter_net3601850,
         d_ff5_data_out_net3601814, reg_Z0_net3601814,
         reg_val_muxZ_2stage_net3601814, reg_shift_y_net3601814,
         d_ff4_Xn_net3601814, d_ff4_Yn_net3601814, d_ff4_Zn_net3601814,
         d_ff5_net3601814, n180, n186, n187, n188, n189, n193, n194, n195,
         n196, n197, intadd_417_CI, intadd_417_n3, intadd_417_n2,
         intadd_417_n1, intadd_418_CI, intadd_418_n3, intadd_418_n2,
         intadd_418_n1, n263, n264, n265, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n468, n469, n470, n471, n472;
  wire   [1:0] d_ff1_shift_region_flag_out;
  wire   [1:0] cont_var_out;
  wire   [3:1] cont_iter_out;
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
  wire   [26:0] data_out_LUT;
  wire   [31:0] d_ff3_sh_x_out;
  wire   [31:0] d_ff3_sh_y_out;
  wire   [27:0] d_ff3_LUT_out;
  wire   [1:0] sel_mux_2_reg;
  wire   [31:0] mux_sal;
  wire   [31:0] sign_inv_out;
  wire   [2:0] cordic_FSM_state_reg;

  SNPS_CLOCK_GATE_HIGH_counter_d_W4_31 cont_iter_clk_gate_count_reg ( .CLK(clk), .EN(enab_cont_iter), .ENCLK(cont_iter_net3601850), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_13 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3601814), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_25 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(load_cont_iter), .ENCLK(reg_Z0_net3601814), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_22 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enab_d_ff2_RB2), .ENCLK(reg_val_muxZ_2stage_net3601814), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_20 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(n265), .ENCLK(reg_shift_y_net3601814), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_19 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3601814), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_18 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3601814), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_16 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3601814), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_15 d_ff5_clk_gate_Q_reg ( .CLK(clk), .EN(
        enab_dff_5), .ENCLK(d_ff5_net3601814), .TE(1'b0) );
  DFFRXLTS cont_iter_count_reg_2_ ( .D(n469), .CK(cont_iter_net3601850), .RN(
        n464), .QN(n267) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3601814), .RN(n464), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n433) );
  DFFRXLTS reg_ch_mux_3_Q_reg_0_ ( .D(n189), .CK(n466), .RN(n464), .Q(
        sel_mux_3_reg), .QN(n437) );
  DFFRXLTS reg_ch_mux_2_Q_reg_0_ ( .D(n187), .CK(n466), .RN(n464), .Q(
        sel_mux_2_reg[0]), .QN(n430) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(data_out_LUT[0]), .CK(reg_shift_y_net3601814), 
        .RN(n464), .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(data_out_LUT[1]), .CK(reg_shift_y_net3601814), 
        .RN(n464), .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(data_out_LUT[2]), .CK(reg_shift_y_net3601814), 
        .RN(n463), .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(data_out_LUT[4]), .CK(reg_shift_y_net3601814), 
        .RN(n463), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(data_out_LUT[6]), .CK(reg_shift_y_net3601814), 
        .RN(n463), .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(data_out_LUT[8]), .CK(reg_shift_y_net3601814), 
        .RN(n463), .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(data_out_LUT[9]), .CK(reg_shift_y_net3601814), 
        .RN(n463), .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(data_out_LUT[10]), .CK(
        reg_shift_y_net3601814), .RN(n463), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(data_out_LUT[11]), .CK(
        reg_shift_y_net3601814), .RN(n463), .Q(d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(data_out_LUT[12]), .CK(
        reg_shift_y_net3601814), .RN(n463), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(data_out_LUT[14]), .CK(
        reg_shift_y_net3601814), .RN(n463), .Q(d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(data_out_LUT[16]), .CK(
        reg_shift_y_net3601814), .RN(n463), .Q(d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(data_out_LUT[18]), .CK(
        reg_shift_y_net3601814), .RN(n463), .Q(d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(data_out_LUT[20]), .CK(
        reg_shift_y_net3601814), .RN(n463), .Q(d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(data_out_LUT[21]), .CK(
        reg_shift_y_net3601814), .RN(n456), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(data_out_LUT[22]), .CK(
        reg_shift_y_net3601814), .RN(n457), .Q(d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(data_out_LUT[23]), .CK(
        reg_shift_y_net3601814), .RN(n458), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(data_out_LUT[24]), .CK(
        reg_shift_y_net3601814), .RN(n451), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3601814), .RN(n462), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(data_out_LUT[26]), .CK(
        reg_shift_y_net3601814), .RN(n461), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3601814), .RN(n452), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3601814), .RN(n451), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3601814), .RN(n456), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3601814), .RN(n457), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3601814), .RN(n458), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3601814), .RN(n461), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3601814), .RN(n461), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3601814), .RN(n452), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3601814), .RN(n451), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3601814), .RN(n461), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3601814), .RN(
        n452), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3601814), .RN(
        n451), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3601814), .RN(
        n461), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3601814), .RN(
        n452), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3601814), .RN(
        n451), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3601814), .RN(
        n461), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3601814), .RN(
        n462), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3601814), .RN(
        n462), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3601814), .RN(
        n451), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3601814), .RN(
        n461), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3601814), .RN(
        n462), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3601814), .RN(
        n462), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3601814), .RN(
        n452), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3601814), .RN(
        n451), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3601814), .RN(
        n461), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3601814), .RN(
        n462), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3601814), .RN(
        n452), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3601814), .RN(
        n451), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3601814), .RN(
        n461), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3601814), .RN(
        n462), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3601814), .RN(
        n453), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3601814), .RN(
        n454), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3601814), .RN(n455), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3601814), .RN(n459), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3601814), .RN(n460), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3601814), .RN(n453), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3601814), .RN(n454), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3601814), .RN(n455), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3601814), .RN(n459), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3601814), .RN(n460), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3601814), .RN(n453), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3601814), .RN(n454), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3601814), .RN(n460), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3601814), .RN(n460), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3601814), .RN(n460), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3601814), .RN(n460), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3601814), .RN(n460), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3601814), .RN(n460), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3601814), .RN(n460), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n460), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3601814), 
        .RN(n460), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3601814), .RN(n460), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n460), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3601814), 
        .RN(n460), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3601814), .RN(n459), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n459), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3601814), 
        .RN(n459), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3601814), .RN(n459), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n459), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3601814), 
        .RN(n459), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3601814), .RN(n459), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n459), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3601814), 
        .RN(n459), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3601814), .RN(n459), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n459), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3601814), 
        .RN(n459), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3601814), .RN(n458), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n458), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3601814), 
        .RN(n458), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3601814), .RN(n458), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n458), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3601814), 
        .RN(n458), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3601814), .RN(n458), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n458), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3601814), 
        .RN(n458), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3601814), .RN(n458), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n458), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3601814), 
        .RN(n458), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3601814), .RN(n457), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n457), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3601814), .RN(n457), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3601814), .RN(n457), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n457), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3601814), .RN(n457), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3601814), .RN(n457), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n457), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3601814), .RN(n457), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3601814), .RN(n457), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n457), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3601814), .RN(n457), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3601814), .RN(n456), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n456), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3601814), .RN(n456), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3601814), .RN(n456), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n456), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3601814), .RN(n456), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3601814), .RN(n456), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n456), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3601814), .RN(n456), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3601814), .RN(n456), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n456), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3601814), .RN(n456), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3601814), .RN(n455), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n455), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3601814), .RN(n455), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3601814), .RN(n455), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n455), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3601814), .RN(n455), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3601814), .RN(n455), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n455), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3601814), .RN(n455), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3601814), .RN(n455), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n455), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3601814), .RN(n455), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3601814), .RN(n454), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n454), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3601814), .RN(n454), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3601814), .RN(n454), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n454), .Q(d_ff2_X[23]), .QN(n429)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3601814), .RN(n454), .Q(d_ff_Xn[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3601814), .RN(n454), .Q(d_ff_Xn[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3601814), .RN(n454), .Q(d_ff_Xn[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3601814), .RN(n454), .Q(d_ff_Xn[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3601814), .RN(n453), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n453), .Q(d_ff2_X[28]), .QN(n436)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3601814), .RN(n453), .Q(d_ff_Xn[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3601814), .RN(n453), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n453), .Q(d_ff2_X[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3601814), .RN(n453), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n453), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3601814), .RN(n453), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3601814), .RN(n453), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n453), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3601814), 
        .RN(n462), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3601814), .RN(n452), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n451), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3601814), 
        .RN(n461), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3601814), .RN(n462), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n462), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3601814), 
        .RN(n452), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3601814), .RN(n451), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n461), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3601814), 
        .RN(n462), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3601814), .RN(n462), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n452), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3601814), 
        .RN(n451), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3601814), .RN(n452), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n462), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3601814), 
        .RN(n451), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3601814), .RN(n461), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n461), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3601814), 
        .RN(n462), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3601814), .RN(n462), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n452), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3601814), 
        .RN(n462), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3601814), .RN(n452), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n451), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3601814), 
        .RN(n462), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3601814), .RN(n462), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n452), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3601814), 
        .RN(n451), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3601814), .RN(n461), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n462), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3601814), .RN(n452), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3601814), .RN(n451), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n461), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3601814), .RN(n462), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3601814), .RN(n462), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n452), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3601814), .RN(n450), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3601814), .RN(n450), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n450), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3601814), .RN(n450), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3601814), .RN(n450), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n450), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3601814), .RN(n450), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3601814), .RN(n450), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n450), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3601814), .RN(n450), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3601814), .RN(n450), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n450), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3601814), .RN(n449), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3601814), .RN(n449), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n449), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3601814), .RN(n449), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3601814), .RN(n449), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n449), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3601814), .RN(n449), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3601814), .RN(n449), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n449), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3601814), .RN(n449), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3601814), .RN(n449), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n449), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3601814), .RN(n448), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3601814), .RN(n448), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n448), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3601814), .RN(n448), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3601814), .RN(n448), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n448), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3601814), .RN(n448), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3601814), .RN(n448), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n448), .Q(d_ff2_Y[23]), .QN(n428)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3601814), .RN(n448), .Q(d_ff_Yn[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3601814), .RN(n448), .Q(d_ff_Yn[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3601814), .RN(n447), .Q(d_ff_Yn[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3601814), .RN(n447), .Q(d_ff_Yn[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3601814), .RN(n447), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n447), .Q(d_ff2_Y[28]), .QN(n435)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3601814), .RN(n447), .Q(d_ff_Yn[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3601814), .RN(n447), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n447), .Q(d_ff2_Y[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3601814), .RN(n447), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n446), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3601814), .RN(n446), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3601814), .RN(n446), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n446), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3601814), .RN(n446), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n446), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3601814), .RN(n446), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n446), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3601814), .RN(n446), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n446), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3601814), .RN(n446), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n446), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3601814), .RN(n444), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n458), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3601814), .RN(n450), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n444), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3601814), .RN(n442), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n441), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3601814), .RN(n445), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n456), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3601814), .RN(n440), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n439), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3601814), .RN(n447), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n442), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3601814), .RN(n445), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n445), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3601814), .RN(n445), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n445), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3601814), .RN(n445), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n445), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3601814), .RN(n445), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n445), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3601814), .RN(n445), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n445), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3601814), .RN(n445), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n445), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3601814), .RN(n444), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n444), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3601814), .RN(n444), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n444), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3601814), .RN(n444), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n444), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3601814), .RN(n444), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n444), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3601814), .RN(n444), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n444), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3601814), .RN(n444), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n444), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3601814), .RN(n443), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n443), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3601814), .RN(n443), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n443), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3601814), .RN(n443), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n443), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3601814), .RN(n443), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n443), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3601814), .RN(n443), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n443), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3601814), .RN(n443), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n443), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3601814), .RN(n448), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n449), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3601814), .RN(n450), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n443), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3601814), .RN(n444), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n445), .Q(d_ff2_Z[31]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[31]), .CK(reg_shift_y_net3601814), 
        .RN(n441), .Q(d_ff3_sign_out) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(mux_sal[0]), .CK(d_ff5_net3601814), .RN(n442), 
        .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(sign_inv_out[0]), .CK(
        d_ff5_data_out_net3601814), .RN(n448), .Q(data_output[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(mux_sal[1]), .CK(d_ff5_net3601814), .RN(n449), 
        .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(sign_inv_out[1]), .CK(
        d_ff5_data_out_net3601814), .RN(n450), .Q(data_output[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(mux_sal[2]), .CK(d_ff5_net3601814), .RN(n443), 
        .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(sign_inv_out[2]), .CK(
        d_ff5_data_out_net3601814), .RN(n442), .Q(data_output[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(mux_sal[3]), .CK(d_ff5_net3601814), .RN(n442), 
        .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(sign_inv_out[3]), .CK(
        d_ff5_data_out_net3601814), .RN(n442), .Q(data_output[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(mux_sal[4]), .CK(d_ff5_net3601814), .RN(n442), 
        .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(sign_inv_out[4]), .CK(
        d_ff5_data_out_net3601814), .RN(n442), .Q(data_output[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(mux_sal[5]), .CK(d_ff5_net3601814), .RN(n442), 
        .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(sign_inv_out[5]), .CK(
        d_ff5_data_out_net3601814), .RN(n442), .Q(data_output[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(mux_sal[6]), .CK(d_ff5_net3601814), .RN(n442), 
        .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(sign_inv_out[6]), .CK(
        d_ff5_data_out_net3601814), .RN(n442), .Q(data_output[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(mux_sal[7]), .CK(d_ff5_net3601814), .RN(n442), 
        .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(sign_inv_out[7]), .CK(
        d_ff5_data_out_net3601814), .RN(n442), .Q(data_output[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(mux_sal[8]), .CK(d_ff5_net3601814), .RN(n442), 
        .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(sign_inv_out[8]), .CK(
        d_ff5_data_out_net3601814), .RN(n441), .Q(data_output[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(mux_sal[9]), .CK(d_ff5_net3601814), .RN(n441), 
        .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(sign_inv_out[9]), .CK(
        d_ff5_data_out_net3601814), .RN(n441), .Q(data_output[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(mux_sal[10]), .CK(d_ff5_net3601814), .RN(n441), 
        .Q(sign_inv_out[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(sign_inv_out[10]), .CK(
        d_ff5_data_out_net3601814), .RN(n441), .Q(data_output[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(mux_sal[11]), .CK(d_ff5_net3601814), .RN(n441), 
        .Q(sign_inv_out[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(sign_inv_out[11]), .CK(
        d_ff5_data_out_net3601814), .RN(n441), .Q(data_output[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(mux_sal[12]), .CK(d_ff5_net3601814), .RN(n441), 
        .Q(sign_inv_out[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(sign_inv_out[12]), .CK(
        d_ff5_data_out_net3601814), .RN(n441), .Q(data_output[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(mux_sal[13]), .CK(d_ff5_net3601814), .RN(n441), 
        .Q(sign_inv_out[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(sign_inv_out[13]), .CK(
        d_ff5_data_out_net3601814), .RN(n441), .Q(data_output[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(mux_sal[14]), .CK(d_ff5_net3601814), .RN(n441), 
        .Q(sign_inv_out[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(sign_inv_out[14]), .CK(
        d_ff5_data_out_net3601814), .RN(n443), .Q(data_output[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(mux_sal[15]), .CK(d_ff5_net3601814), .RN(n446), 
        .Q(sign_inv_out[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(sign_inv_out[15]), .CK(
        d_ff5_data_out_net3601814), .RN(n447), .Q(data_output[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(mux_sal[16]), .CK(d_ff5_net3601814), .RN(n439), 
        .Q(sign_inv_out[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(sign_inv_out[16]), .CK(
        d_ff5_data_out_net3601814), .RN(n440), .Q(data_output[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(mux_sal[17]), .CK(d_ff5_net3601814), .RN(n449), 
        .Q(sign_inv_out[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(sign_inv_out[17]), .CK(
        d_ff5_data_out_net3601814), .RN(n446), .Q(data_output[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(mux_sal[18]), .CK(d_ff5_net3601814), .RN(n447), 
        .Q(sign_inv_out[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(sign_inv_out[18]), .CK(
        d_ff5_data_out_net3601814), .RN(n439), .Q(data_output[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(mux_sal[19]), .CK(d_ff5_net3601814), .RN(n440), 
        .Q(sign_inv_out[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(sign_inv_out[19]), .CK(
        d_ff5_data_out_net3601814), .RN(n448), .Q(data_output[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(mux_sal[20]), .CK(d_ff5_net3601814), .RN(n446), 
        .Q(sign_inv_out[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(sign_inv_out[20]), .CK(
        d_ff5_data_out_net3601814), .RN(n440), .Q(data_output[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(mux_sal[21]), .CK(d_ff5_net3601814), .RN(n440), 
        .Q(sign_inv_out[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(sign_inv_out[21]), .CK(
        d_ff5_data_out_net3601814), .RN(n440), .Q(data_output[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(mux_sal[22]), .CK(d_ff5_net3601814), .RN(n440), 
        .Q(sign_inv_out[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(sign_inv_out[22]), .CK(
        d_ff5_data_out_net3601814), .RN(n440), .Q(data_output[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(mux_sal[23]), .CK(d_ff5_net3601814), .RN(n440), 
        .Q(sign_inv_out[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(sign_inv_out[23]), .CK(
        d_ff5_data_out_net3601814), .RN(n440), .Q(data_output[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(mux_sal[24]), .CK(d_ff5_net3601814), .RN(n440), 
        .Q(sign_inv_out[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(sign_inv_out[24]), .CK(
        d_ff5_data_out_net3601814), .RN(n440), .Q(data_output[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(mux_sal[25]), .CK(d_ff5_net3601814), .RN(n440), 
        .Q(sign_inv_out[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(sign_inv_out[25]), .CK(
        d_ff5_data_out_net3601814), .RN(n440), .Q(data_output[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(mux_sal[26]), .CK(d_ff5_net3601814), .RN(n440), 
        .Q(sign_inv_out[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(sign_inv_out[26]), .CK(
        d_ff5_data_out_net3601814), .RN(n439), .Q(data_output[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(mux_sal[27]), .CK(d_ff5_net3601814), .RN(n439), 
        .Q(sign_inv_out[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(sign_inv_out[27]), .CK(
        d_ff5_data_out_net3601814), .RN(n439), .Q(data_output[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(mux_sal[28]), .CK(d_ff5_net3601814), .RN(n439), 
        .Q(sign_inv_out[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(sign_inv_out[28]), .CK(
        d_ff5_data_out_net3601814), .RN(n439), .Q(data_output[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(mux_sal[29]), .CK(d_ff5_net3601814), .RN(n439), 
        .Q(sign_inv_out[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(sign_inv_out[29]), .CK(
        d_ff5_data_out_net3601814), .RN(n439), .Q(data_output[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(mux_sal[30]), .CK(d_ff5_net3601814), .RN(n439), 
        .Q(sign_inv_out[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(sign_inv_out[30]), .CK(
        d_ff5_data_out_net3601814), .RN(n439), .Q(data_output[30]) );
  DFFRXLTS d_ff5_Q_reg_31_ ( .D(mux_sal[31]), .CK(d_ff5_net3601814), .RN(n439), 
        .Q(data_output2_31_) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(sign_inv_out[31]), .CK(
        d_ff5_data_out_net3601814), .RN(n439), .Q(data_output[31]) );
  SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5_1 clk_gate_reg_ch_mux_2_Q_reg ( 
        .CLK(clk), .EN(n468), .ENCLK(n466), .TE(1'b0) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(1'b1), .CK(reg_shift_y_net3601814), .RN(n439), .Q(d_ff3_LUT_out[27]) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n194), .CK(n466), .RN(n463), .Q(
        cont_var_out[1]), .QN(n432) );
  DFFRX2TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n180), .Q(cordic_FSM_state_reg[1]), .QN(n431) );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n472), .CK(cont_iter_net3601850), .RN(
        n464), .Q(cont_iter_out[3]), .QN(n426) );
  DFFRX4TS cont_iter_count_reg_0_ ( .D(n471), .CK(cont_iter_net3601850), .RN(
        n463), .Q(n438), .QN(n465) );
  DFFRX4TS cont_iter_count_reg_1_ ( .D(n470), .CK(cont_iter_net3601850), .RN(
        n464), .Q(cont_iter_out[1]), .QN(n424) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n453), .Q(d_ff2_X[27]) );
  DFFRX1TS cont_var_count_reg_0_ ( .D(n193), .CK(n466), .RN(n464), .Q(
        cont_var_out[0]) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3601814), .RN(n464), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n453), .Q(d_ff2_X[29]) );
  DFFRX4TS cordic_FSM_state_reg_reg_0_ ( .D(n197), .CK(clk), .RN(n180), .Q(
        cordic_FSM_state_reg[0]), .QN(n427) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n186), .CK(n466), .RN(n464), .Q(
        sel_mux_2_reg[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n447), .Q(d_ff2_Y[27]) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3601814), 
        .RN(n464), .Q(d_ff1_operation_out) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n447), .Q(d_ff2_Y[29]) );
  DFFRX4TS cordic_FSM_state_reg_reg_3_ ( .D(n195), .CK(n466), .RN(n180), .Q(
        n263), .QN(n425) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n454), .Q(d_ff2_X[24]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n454), .Q(d_ff2_X[25]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n454), .Q(d_ff2_X[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n448), .Q(d_ff2_Y[24]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n447), .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3601814), .RN(n447), .Q(d_ff2_Y[26]) );
  ADDFX1TS intadd_418_U4 ( .A(d_ff2_Y[24]), .B(n424), .CI(intadd_418_CI), .CO(
        intadd_418_n3), .S(sh_exp_y[1]) );
  ADDFX1TS intadd_417_U4 ( .A(d_ff2_X[24]), .B(n424), .CI(intadd_417_CI), .CO(
        intadd_417_n3), .S(sh_exp_x[1]) );
  DFFRX4TS cordic_FSM_state_reg_reg_2_ ( .D(n196), .CK(clk), .RN(n180), .Q(
        cordic_FSM_state_reg[2]) );
  CMPR32X2TS intadd_417_U3 ( .A(d_ff2_X[25]), .B(data_out_LUT[8]), .C(
        intadd_417_n3), .CO(intadd_417_n2), .S(sh_exp_x[2]) );
  CMPR32X2TS intadd_418_U3 ( .A(d_ff2_Y[25]), .B(data_out_LUT[8]), .C(
        intadd_418_n3), .CO(intadd_418_n2), .S(sh_exp_y[2]) );
  CMPR32X2TS intadd_418_U2 ( .A(d_ff2_Y[26]), .B(n426), .C(intadd_418_n2), 
        .CO(intadd_418_n1), .S(sh_exp_y[3]) );
  CMPR32X2TS intadd_417_U2 ( .A(d_ff2_X[26]), .B(n426), .C(intadd_417_n2), 
        .CO(intadd_417_n1), .S(sh_exp_x[3]) );
  DFFRX4TS reg_ch_mux_1_Q_reg_0_ ( .D(n188), .CK(n466), .RN(n464), .Q(
        sel_mux_1_reg), .QN(n434) );
  NOR2XLTS U437 ( .A(n356), .B(n342), .Y(enab_d_ff4_Yn) );
  BUFX8TS U438 ( .A(n268), .Y(n276) );
  BUFX6TS U439 ( .A(n394), .Y(n393) );
  INVX6TS U440 ( .A(sel_mux_1_reg), .Y(n364) );
  INVX4TS U441 ( .A(sel_mux_3_reg), .Y(n369) );
  OAI32X1TS U442 ( .A0(n357), .A1(n276), .A2(n430), .B0(n356), .B1(n355), .Y(
        n187) );
  BUFX6TS U443 ( .A(n287), .Y(n401) );
  NOR2XLTS U444 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n288) );
  INVX2TS U445 ( .A(cordic_FSM_state_reg[2]), .Y(n363) );
  AOI222X1TS U446 ( .A0(n401), .A1(d_ff3_LUT_out[4]), .B0(n412), .B1(
        d_ff3_sh_x_out[4]), .C0(n334), .C1(d_ff3_sh_y_out[4]), .Y(n290) );
  AOI222X1TS U447 ( .A0(n401), .A1(d_ff3_LUT_out[21]), .B0(n412), .B1(
        d_ff3_sh_x_out[21]), .C0(n334), .C1(d_ff3_sh_y_out[21]), .Y(n289) );
  AOI222X1TS U448 ( .A0(n417), .A1(d_ff3_LUT_out[24]), .B0(n397), .B1(
        d_ff3_sh_x_out[24]), .C0(n334), .C1(d_ff3_sh_y_out[24]), .Y(n304) );
  AOI222X1TS U449 ( .A0(n417), .A1(d_ff3_LUT_out[26]), .B0(n397), .B1(
        d_ff3_sh_x_out[26]), .C0(n334), .C1(d_ff3_sh_y_out[26]), .Y(n309) );
  AOI222X1TS U450 ( .A0(n417), .A1(d_ff2_Z[4]), .B0(n393), .B1(d_ff2_Y[4]), 
        .C0(n415), .C1(d_ff2_X[4]), .Y(n291) );
  AOI222X1TS U451 ( .A0(n363), .A1(cordic_FSM_state_reg[1]), .B0(n363), .B1(
        n343), .C0(n431), .C1(n427), .Y(n270) );
  NAND2BXLTS U452 ( .AN(n384), .B(n383), .Y(data_out_LUT[1]) );
  OAI31X1TS U453 ( .A0(cordic_FSM_state_reg[2]), .A1(n275), .A2(n427), .B0(
        n274), .Y(n196) );
  OR4X2TS U454 ( .A(n263), .B(cordic_FSM_state_reg[1]), .C(n363), .D(n427), 
        .Y(n264) );
  INVX2TS U455 ( .A(n264), .Y(n265) );
  AOI222X4TS U456 ( .A0(n335), .A1(d_ff2_Z[30]), .B0(n412), .B1(d_ff2_Y[30]), 
        .C0(n334), .C1(d_ff2_X[30]), .Y(n332) );
  NOR4X1TS U457 ( .A(cordic_FSM_state_reg[1]), .B(n363), .C(n425), .D(n427), 
        .Y(ready_cordic) );
  AOI222X1TS U458 ( .A0(n388), .A1(cont_iter_out[1]), .B0(n388), .B1(n438), 
        .C0(cont_iter_out[3]), .C1(n424), .Y(data_out_LUT[4]) );
  AOI222X4TS U459 ( .A0(n335), .A1(d_ff2_Z[26]), .B0(n412), .B1(d_ff2_Y[26]), 
        .C0(n334), .C1(d_ff2_X[26]), .Y(n326) );
  AOI222X4TS U460 ( .A0(n335), .A1(d_ff2_Z[25]), .B0(n412), .B1(d_ff2_Y[25]), 
        .C0(n334), .C1(d_ff2_X[25]), .Y(n325) );
  AOI222X1TS U461 ( .A0(n335), .A1(d_ff2_Z[24]), .B0(n412), .B1(d_ff2_Y[24]), 
        .C0(n334), .C1(d_ff2_X[24]), .Y(n330) );
  AOI31X2TS U462 ( .A0(n379), .A1(n465), .A2(n424), .B0(n272), .Y(n389) );
  BUFX6TS U463 ( .A(n393), .Y(n397) );
  CLKINVX6TS U464 ( .A(n364), .Y(n390) );
  CLKINVX6TS U465 ( .A(n364), .Y(n391) );
  NOR3X2TS U466 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n431), .Y(n362) );
  BUFX6TS U467 ( .A(n415), .Y(n392) );
  INVX6TS U468 ( .A(n276), .Y(n462) );
  BUFX6TS U469 ( .A(n415), .Y(n334) );
  BUFX4TS U470 ( .A(n288), .Y(n415) );
  AOI222X1TS U471 ( .A0(n335), .A1(d_ff2_Z[27]), .B0(n412), .B1(d_ff2_Y[27]), 
        .C0(n334), .C1(d_ff2_X[27]), .Y(n336) );
  OAI32X1TS U472 ( .A0(n355), .A1(n343), .A2(n432), .B0(n357), .B1(n283), .Y(
        n186) );
  NOR4X2TS U473 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[2]), 
        .C(n425), .D(n427), .Y(ack_add_subt) );
  AND4X2TS U474 ( .A(n425), .B(n363), .C(n431), .D(n427), .Y(n268) );
  NAND3X2TS U475 ( .A(cordic_FSM_state_reg[2]), .B(n431), .C(n427), .Y(n468)
         );
  AOI32X4TS U476 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(n433), .A2(
        d_ff1_operation_out), .B0(n373), .B1(d_ff1_shift_region_flag_out[0]), 
        .Y(n374) );
  NOR4X2TS U477 ( .A(n263), .B(cordic_FSM_state_reg[0]), .C(n363), .D(n431), 
        .Y(n357) );
  BUFX4TS U478 ( .A(n369), .Y(n371) );
  CLKINVX6TS U479 ( .A(n364), .Y(n365) );
  NAND2X2TS U480 ( .A(n388), .B(cont_iter_out[3]), .Y(data_out_LUT[22]) );
  NOR4X2TS U481 ( .A(n388), .B(cont_iter_out[3]), .C(n438), .D(
        cont_iter_out[1]), .Y(n384) );
  INVX4TS U482 ( .A(n267), .Y(n388) );
  AOI222X1TS U483 ( .A0(n417), .A1(d_ff2_Z[2]), .B0(n393), .B1(d_ff2_Y[2]), 
        .C0(n415), .C1(d_ff2_X[2]), .Y(n292) );
  AOI222X1TS U484 ( .A0(n417), .A1(d_ff2_Z[1]), .B0(n393), .B1(d_ff2_Y[1]), 
        .C0(n415), .C1(d_ff2_X[1]), .Y(n293) );
  BUFX6TS U485 ( .A(n401), .Y(n417) );
  AOI222X1TS U486 ( .A0(n335), .A1(d_ff2_Z[29]), .B0(n412), .B1(d_ff2_Y[29]), 
        .C0(n334), .C1(d_ff2_X[29]), .Y(n333) );
  AOI222X4TS U487 ( .A0(n335), .A1(d_ff3_LUT_out[0]), .B0(n412), .B1(
        d_ff3_sh_x_out[0]), .C0(n334), .C1(d_ff3_sh_y_out[0]), .Y(n324) );
  AOI222X4TS U488 ( .A0(n335), .A1(d_ff3_LUT_out[1]), .B0(n412), .B1(
        d_ff3_sh_x_out[1]), .C0(n334), .C1(d_ff3_sh_y_out[1]), .Y(n327) );
  BUFX6TS U489 ( .A(n393), .Y(n412) );
  NOR2XLTS U490 ( .A(n263), .B(n468), .Y(enab_d_ff2_RB2) );
  AOI211XLTS U491 ( .A0(cont_var_out[1]), .A1(n286), .B0(n265), .C0(n285), .Y(
        n194) );
  INVX2TS U492 ( .A(n388), .Y(data_out_LUT[8]) );
  NAND2X1TS U493 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n277) );
  NOR3X1TS U494 ( .A(n263), .B(n363), .C(n277), .Y(beg_add_subt) );
  NAND2X2TS U495 ( .A(n438), .B(cont_iter_out[1]), .Y(n387) );
  NOR2X2TS U496 ( .A(data_out_LUT[22]), .B(n387), .Y(n343) );
  NAND4BX1TS U497 ( .AN(ack_cordic), .B(cordic_FSM_state_reg[2]), .C(n263), 
        .D(n431), .Y(n347) );
  INVX2TS U498 ( .A(beg_add_subt), .Y(n269) );
  OAI211XLTS U499 ( .A0(n270), .A1(n425), .B0(n347), .C0(n269), .Y(n195) );
  INVX4TS U500 ( .A(n276), .Y(n452) );
  INVX4TS U501 ( .A(n276), .Y(n456) );
  INVX4TS U502 ( .A(n276), .Y(n451) );
  INVX4TS U503 ( .A(n276), .Y(n461) );
  INVX4TS U504 ( .A(n276), .Y(n455) );
  INVX4TS U505 ( .A(n276), .Y(n453) );
  INVX4TS U506 ( .A(n268), .Y(n454) );
  INVX4TS U507 ( .A(n268), .Y(n460) );
  INVX4TS U508 ( .A(n268), .Y(n459) );
  INVX4TS U509 ( .A(n276), .Y(n457) );
  INVX4TS U510 ( .A(n276), .Y(n442) );
  INVX4TS U511 ( .A(n276), .Y(n441) );
  INVX4TS U512 ( .A(n276), .Y(n445) );
  INVX4TS U513 ( .A(n276), .Y(n440) );
  INVX4TS U514 ( .A(n276), .Y(n446) );
  INVX4TS U515 ( .A(n276), .Y(n439) );
  INVX4TS U516 ( .A(n276), .Y(n447) );
  NOR3XLTS U517 ( .A(cordic_FSM_state_reg[2]), .B(n425), .C(n277), .Y(
        enab_dff_5) );
  NOR2XLTS U518 ( .A(n425), .B(n468), .Y(enab_d_ff5_data_out) );
  INVX2TS U519 ( .A(n387), .Y(n271) );
  AOI221XLTS U520 ( .A0(n388), .A1(n271), .B0(data_out_LUT[8]), .B1(n387), 
        .C0(n427), .Y(n469) );
  NOR2X2TS U521 ( .A(n388), .B(n426), .Y(n379) );
  NOR2X2TS U522 ( .A(cont_iter_out[3]), .B(data_out_LUT[8]), .Y(n386) );
  NOR2X2TS U523 ( .A(n379), .B(n386), .Y(n383) );
  OAI21X1TS U524 ( .A0(n388), .A1(n424), .B0(n383), .Y(data_out_LUT[20]) );
  OR2X1TS U525 ( .A(data_out_LUT[20]), .B(n384), .Y(data_out_LUT[11]) );
  NAND2X1TS U526 ( .A(n271), .B(n386), .Y(n353) );
  INVX2TS U527 ( .A(n353), .Y(n272) );
  AOI33X1TS U528 ( .A0(n438), .A1(cont_iter_out[1]), .A2(data_out_LUT[8]), 
        .B0(n424), .B1(n426), .B2(n465), .Y(n378) );
  OAI211XLTS U529 ( .A0(cont_iter_out[1]), .A1(data_out_LUT[22]), .B0(n389), 
        .C0(n378), .Y(data_out_LUT[24]) );
  INVX4TS U530 ( .A(n276), .Y(n463) );
  INVX4TS U531 ( .A(n276), .Y(n464) );
  INVX2TS U532 ( .A(n343), .Y(n338) );
  INVX2TS U533 ( .A(cont_var_out[0]), .Y(n339) );
  NAND2X1TS U534 ( .A(cont_var_out[1]), .B(n339), .Y(n344) );
  AOI31XLTS U535 ( .A0(n263), .A1(n338), .A2(n344), .B0(
        cordic_FSM_state_reg[1]), .Y(n275) );
  OAI2BB2XLTS U536 ( .B0(cordic_FSM_state_reg[1]), .B1(ack_cordic), .A0N(n425), 
        .A1N(n277), .Y(n273) );
  INVX2TS U537 ( .A(n468), .Y(n349) );
  AOI21X1TS U538 ( .A0(cordic_FSM_state_reg[2]), .A1(n273), .B0(n349), .Y(n274) );
  INVX4TS U539 ( .A(n276), .Y(n458) );
  INVX4TS U540 ( .A(n276), .Y(n450) );
  INVX4TS U541 ( .A(n268), .Y(n443) );
  INVX4TS U542 ( .A(n276), .Y(n444) );
  INVX4TS U543 ( .A(n268), .Y(n449) );
  INVX2TS U544 ( .A(rst), .Y(n180) );
  INVX4TS U545 ( .A(n268), .Y(n448) );
  NAND2X1TS U546 ( .A(n429), .B(n438), .Y(intadd_417_CI) );
  OAI21XLTS U547 ( .A0(n438), .A1(n429), .B0(intadd_417_CI), .Y(sh_exp_x[0])
         );
  NAND2X1TS U548 ( .A(n428), .B(n438), .Y(intadd_418_CI) );
  OAI21XLTS U549 ( .A0(n438), .A1(n428), .B0(intadd_418_CI), .Y(sh_exp_y[0])
         );
  NOR2X1TS U550 ( .A(data_out_LUT[8]), .B(n387), .Y(n354) );
  NOR2XLTS U551 ( .A(cont_iter_out[3]), .B(n354), .Y(data_out_LUT[26]) );
  NOR2X1TS U552 ( .A(d_ff2_Y[27]), .B(intadd_418_n1), .Y(n420) );
  OR3X1TS U553 ( .A(d_ff2_Y[28]), .B(d_ff2_Y[27]), .C(intadd_418_n1), .Y(n419)
         );
  OAI21XLTS U554 ( .A0(n420), .A1(n435), .B0(n419), .Y(sh_exp_y[5]) );
  NOR2X1TS U555 ( .A(d_ff2_X[27]), .B(intadd_417_n1), .Y(n423) );
  OR3X1TS U556 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(intadd_417_n1), .Y(n422)
         );
  OAI21XLTS U557 ( .A0(n423), .A1(n436), .B0(n422), .Y(sh_exp_x[5]) );
  NOR3X1TS U558 ( .A(n263), .B(cordic_FSM_state_reg[2]), .C(n277), .Y(n279) );
  INVX2TS U559 ( .A(n279), .Y(n278) );
  OAI32X1TS U560 ( .A0(n279), .A1(n276), .A2(n364), .B0(n384), .B1(n278), .Y(
        n188) );
  OAI21X1TS U561 ( .A0(n388), .A1(cont_iter_out[1]), .B0(n383), .Y(
        data_out_LUT[16]) );
  OAI21X1TS U562 ( .A0(n388), .A1(n465), .B0(n383), .Y(data_out_LUT[18]) );
  NAND4XLTS U563 ( .A(n263), .B(cordic_FSM_state_reg[1]), .C(n363), .D(n427), 
        .Y(n282) );
  NOR2X1TS U564 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), 
        .Y(n373) );
  AOI21X1TS U565 ( .A0(d_ff1_operation_out), .A1(
        d_ff1_shift_region_flag_out[1]), .B0(n373), .Y(n280) );
  XNOR2X1TS U566 ( .A(d_ff1_shift_region_flag_out[0]), .B(n280), .Y(n337) );
  INVX4TS U567 ( .A(n369), .Y(n372) );
  NAND3XLTS U568 ( .A(n372), .B(n463), .C(n282), .Y(n281) );
  OAI21XLTS U569 ( .A0(n282), .A1(n337), .B0(n281), .Y(n189) );
  INVX2TS U570 ( .A(n357), .Y(n355) );
  NAND2X1TS U571 ( .A(sel_mux_2_reg[1]), .B(n464), .Y(n283) );
  CLKAND2X2TS U572 ( .A(n362), .B(n425), .Y(load_cont_iter) );
  NAND2X1TS U573 ( .A(ack_add_subt), .B(n338), .Y(n345) );
  AOI21X1TS U574 ( .A0(n344), .A1(n339), .B0(n345), .Y(n284) );
  AOI211XLTS U575 ( .A0(n345), .A1(n339), .B0(n265), .C0(n284), .Y(n193) );
  NOR2X1TS U576 ( .A(n339), .B(n345), .Y(n286) );
  NOR2XLTS U577 ( .A(cont_var_out[1]), .B(n286), .Y(n285) );
  NOR2BX1TS U578 ( .AN(sel_mux_2_reg[1]), .B(sel_mux_2_reg[0]), .Y(n287) );
  NOR2X1TS U579 ( .A(sel_mux_2_reg[1]), .B(n430), .Y(n394) );
  INVX2TS U580 ( .A(n289), .Y(add_subt_dataB[21]) );
  INVX2TS U581 ( .A(n290), .Y(add_subt_dataB[4]) );
  INVX2TS U582 ( .A(n291), .Y(add_subt_dataA[4]) );
  INVX2TS U583 ( .A(n292), .Y(add_subt_dataA[2]) );
  INVX2TS U584 ( .A(n293), .Y(add_subt_dataA[1]) );
  AOI222X1TS U585 ( .A0(n417), .A1(d_ff2_Z[9]), .B0(n393), .B1(d_ff2_Y[9]), 
        .C0(n415), .C1(d_ff2_X[9]), .Y(n294) );
  INVX2TS U586 ( .A(n294), .Y(add_subt_dataA[9]) );
  AOI222X1TS U587 ( .A0(n417), .A1(d_ff2_Z[3]), .B0(n393), .B1(d_ff2_Y[3]), 
        .C0(n415), .C1(d_ff2_X[3]), .Y(n295) );
  INVX2TS U588 ( .A(n295), .Y(add_subt_dataA[3]) );
  AOI222X1TS U589 ( .A0(n417), .A1(d_ff2_Z[7]), .B0(n393), .B1(d_ff2_Y[7]), 
        .C0(n415), .C1(d_ff2_X[7]), .Y(n296) );
  INVX2TS U590 ( .A(n296), .Y(add_subt_dataA[7]) );
  AOI222X1TS U591 ( .A0(n417), .A1(d_ff2_Z[10]), .B0(n393), .B1(d_ff2_Y[10]), 
        .C0(n415), .C1(d_ff2_X[10]), .Y(n297) );
  INVX2TS U592 ( .A(n297), .Y(add_subt_dataA[10]) );
  AOI222X1TS U593 ( .A0(n417), .A1(d_ff2_Z[5]), .B0(n393), .B1(d_ff2_Y[5]), 
        .C0(n415), .C1(d_ff2_X[5]), .Y(n298) );
  INVX2TS U594 ( .A(n298), .Y(add_subt_dataA[5]) );
  AOI222X1TS U595 ( .A0(n417), .A1(d_ff2_Z[6]), .B0(n393), .B1(d_ff2_Y[6]), 
        .C0(n415), .C1(d_ff2_X[6]), .Y(n299) );
  INVX2TS U596 ( .A(n299), .Y(add_subt_dataA[6]) );
  AOI222X1TS U597 ( .A0(n417), .A1(d_ff2_Z[8]), .B0(n393), .B1(d_ff2_Y[8]), 
        .C0(n415), .C1(d_ff2_X[8]), .Y(n300) );
  INVX2TS U598 ( .A(n300), .Y(add_subt_dataA[8]) );
  AOI222X1TS U599 ( .A0(n401), .A1(d_ff3_LUT_out[8]), .B0(n393), .B1(
        d_ff3_sh_x_out[8]), .C0(n334), .C1(d_ff3_sh_y_out[8]), .Y(n301) );
  INVX2TS U600 ( .A(n301), .Y(add_subt_dataB[8]) );
  AOI222X1TS U601 ( .A0(n401), .A1(d_ff3_LUT_out[25]), .B0(n393), .B1(
        d_ff3_sh_x_out[25]), .C0(n334), .C1(d_ff3_sh_y_out[25]), .Y(n302) );
  INVX2TS U602 ( .A(n302), .Y(add_subt_dataB[25]) );
  AOI222X1TS U603 ( .A0(n401), .A1(d_ff3_LUT_out[23]), .B0(n393), .B1(
        d_ff3_sh_x_out[23]), .C0(n334), .C1(d_ff3_sh_y_out[23]), .Y(n303) );
  INVX2TS U604 ( .A(n303), .Y(add_subt_dataB[23]) );
  INVX2TS U605 ( .A(n304), .Y(add_subt_dataB[24]) );
  AOI222X1TS U606 ( .A0(n401), .A1(d_ff3_LUT_out[12]), .B0(n397), .B1(
        d_ff3_sh_x_out[12]), .C0(n334), .C1(d_ff3_sh_y_out[12]), .Y(n305) );
  INVX2TS U607 ( .A(n305), .Y(add_subt_dataB[12]) );
  AOI222X1TS U608 ( .A0(n401), .A1(d_ff2_Z[17]), .B0(n397), .B1(d_ff2_Y[17]), 
        .C0(n392), .C1(d_ff2_X[17]), .Y(n306) );
  INVX2TS U609 ( .A(n306), .Y(add_subt_dataA[17]) );
  AOI222X1TS U610 ( .A0(n401), .A1(d_ff2_Z[18]), .B0(n397), .B1(d_ff2_Y[18]), 
        .C0(n392), .C1(d_ff2_X[18]), .Y(n307) );
  INVX2TS U611 ( .A(n307), .Y(add_subt_dataA[18]) );
  AOI222X1TS U612 ( .A0(n401), .A1(d_ff3_LUT_out[9]), .B0(n397), .B1(
        d_ff3_sh_x_out[9]), .C0(n334), .C1(d_ff3_sh_y_out[9]), .Y(n308) );
  INVX2TS U613 ( .A(n308), .Y(add_subt_dataB[9]) );
  INVX2TS U614 ( .A(n309), .Y(add_subt_dataB[26]) );
  AOI222X1TS U615 ( .A0(n401), .A1(d_ff3_LUT_out[6]), .B0(n397), .B1(
        d_ff3_sh_x_out[6]), .C0(n334), .C1(d_ff3_sh_y_out[6]), .Y(n310) );
  INVX2TS U616 ( .A(n310), .Y(add_subt_dataB[6]) );
  AOI222X1TS U617 ( .A0(n401), .A1(d_ff2_Z[22]), .B0(n397), .B1(d_ff2_Y[22]), 
        .C0(n392), .C1(d_ff2_X[22]), .Y(n311) );
  INVX2TS U618 ( .A(n311), .Y(add_subt_dataA[22]) );
  AOI222X1TS U619 ( .A0(n401), .A1(d_ff2_Z[23]), .B0(n397), .B1(d_ff2_Y[23]), 
        .C0(n392), .C1(d_ff2_X[23]), .Y(n312) );
  INVX2TS U620 ( .A(n312), .Y(add_subt_dataA[23]) );
  AOI222X1TS U621 ( .A0(n401), .A1(d_ff2_Z[14]), .B0(n397), .B1(d_ff2_Y[14]), 
        .C0(n392), .C1(d_ff2_X[14]), .Y(n313) );
  INVX2TS U622 ( .A(n313), .Y(add_subt_dataA[14]) );
  AOI222X1TS U623 ( .A0(n401), .A1(d_ff2_Z[15]), .B0(n397), .B1(d_ff2_Y[15]), 
        .C0(n392), .C1(d_ff2_X[15]), .Y(n314) );
  INVX2TS U624 ( .A(n314), .Y(add_subt_dataA[15]) );
  AOI222X1TS U625 ( .A0(n401), .A1(d_ff2_Z[16]), .B0(n397), .B1(d_ff2_Y[16]), 
        .C0(n392), .C1(d_ff2_X[16]), .Y(n315) );
  INVX2TS U626 ( .A(n315), .Y(add_subt_dataA[16]) );
  AOI222X1TS U627 ( .A0(n417), .A1(d_ff2_Z[12]), .B0(n397), .B1(d_ff2_Y[12]), 
        .C0(n392), .C1(d_ff2_X[12]), .Y(n316) );
  INVX2TS U628 ( .A(n316), .Y(add_subt_dataA[12]) );
  AOI222X1TS U629 ( .A0(n401), .A1(d_ff2_Z[13]), .B0(n397), .B1(d_ff2_Y[13]), 
        .C0(n392), .C1(d_ff2_X[13]), .Y(n317) );
  INVX2TS U630 ( .A(n317), .Y(add_subt_dataA[13]) );
  AOI222X1TS U631 ( .A0(n417), .A1(d_ff2_Z[11]), .B0(n397), .B1(d_ff2_Y[11]), 
        .C0(n392), .C1(d_ff2_X[11]), .Y(n318) );
  INVX2TS U632 ( .A(n318), .Y(add_subt_dataA[11]) );
  AOI222X1TS U633 ( .A0(n401), .A1(d_ff2_Z[21]), .B0(n397), .B1(d_ff2_Y[21]), 
        .C0(n392), .C1(d_ff2_X[21]), .Y(n319) );
  INVX2TS U634 ( .A(n319), .Y(add_subt_dataA[21]) );
  AOI222X1TS U635 ( .A0(n401), .A1(d_ff2_Z[19]), .B0(n397), .B1(d_ff2_Y[19]), 
        .C0(n392), .C1(d_ff2_X[19]), .Y(n320) );
  INVX2TS U636 ( .A(n320), .Y(add_subt_dataA[19]) );
  AOI222X1TS U637 ( .A0(n401), .A1(d_ff2_Z[20]), .B0(n397), .B1(d_ff2_Y[20]), 
        .C0(n392), .C1(d_ff2_X[20]), .Y(n321) );
  INVX2TS U638 ( .A(n321), .Y(add_subt_dataA[20]) );
  BUFX3TS U639 ( .A(n401), .Y(n335) );
  AOI222X1TS U640 ( .A0(n335), .A1(d_ff3_LUT_out[10]), .B0(n393), .B1(
        d_ff3_sh_x_out[10]), .C0(n334), .C1(d_ff3_sh_y_out[10]), .Y(n322) );
  INVX2TS U641 ( .A(n322), .Y(add_subt_dataB[10]) );
  AOI222X1TS U642 ( .A0(n335), .A1(d_ff2_Z[28]), .B0(n412), .B1(d_ff2_Y[28]), 
        .C0(n334), .C1(d_ff2_X[28]), .Y(n323) );
  INVX2TS U643 ( .A(n323), .Y(add_subt_dataA[28]) );
  INVX2TS U644 ( .A(n324), .Y(add_subt_dataB[0]) );
  INVX2TS U645 ( .A(n325), .Y(add_subt_dataA[25]) );
  INVX2TS U646 ( .A(n326), .Y(add_subt_dataA[26]) );
  INVX2TS U647 ( .A(n327), .Y(add_subt_dataB[1]) );
  AOI222X1TS U648 ( .A0(n335), .A1(d_ff2_Z[0]), .B0(n412), .B1(d_ff2_Y[0]), 
        .C0(n334), .C1(d_ff2_X[0]), .Y(n328) );
  INVX2TS U649 ( .A(n328), .Y(add_subt_dataA[0]) );
  AOI222X1TS U650 ( .A0(n335), .A1(d_ff3_LUT_out[2]), .B0(n412), .B1(
        d_ff3_sh_x_out[2]), .C0(n334), .C1(d_ff3_sh_y_out[2]), .Y(n329) );
  INVX2TS U651 ( .A(n329), .Y(add_subt_dataB[2]) );
  INVX2TS U652 ( .A(n330), .Y(add_subt_dataA[24]) );
  AOI222X1TS U653 ( .A0(n335), .A1(d_ff2_Z[31]), .B0(n412), .B1(d_ff2_Y[31]), 
        .C0(n334), .C1(d_ff2_X[31]), .Y(n331) );
  INVX2TS U654 ( .A(n331), .Y(add_subt_dataA[31]) );
  INVX2TS U655 ( .A(n332), .Y(add_subt_dataA[30]) );
  INVX2TS U656 ( .A(n333), .Y(add_subt_dataA[29]) );
  INVX2TS U657 ( .A(n336), .Y(add_subt_dataA[27]) );
  NOR2X1TS U658 ( .A(n338), .B(n337), .Y(n341) );
  AOI21X1TS U659 ( .A0(cont_var_out[0]), .A1(n338), .B0(n341), .Y(n356) );
  NAND2X1TS U660 ( .A(ready_add_subt), .B(n431), .Y(n346) );
  NAND4BX1TS U661 ( .AN(n346), .B(n263), .C(n427), .D(n363), .Y(n342) );
  AOI21X1TS U662 ( .A0(n432), .A1(n339), .B0(n343), .Y(n340) );
  NOR3XLTS U663 ( .A(n341), .B(n340), .C(n342), .Y(enab_d_ff4_Xn) );
  NOR3XLTS U664 ( .A(n343), .B(n344), .C(n342), .Y(enab_d_ff4_Zn) );
  NAND2X1TS U665 ( .A(n425), .B(n431), .Y(n360) );
  NOR2X1TS U666 ( .A(n345), .B(n344), .Y(n352) );
  AOI32X1TS U667 ( .A0(n263), .A1(n347), .A2(n346), .B0(
        cordic_FSM_state_reg[0]), .B1(n347), .Y(n348) );
  NOR4X1TS U668 ( .A(n352), .B(n349), .C(n362), .D(n348), .Y(n350) );
  OAI31X1TS U669 ( .A0(cordic_FSM_state_reg[2]), .A1(beg_fsm_cordic), .A2(n360), .B0(n350), .Y(n197) );
  OR2X1TS U670 ( .A(n352), .B(load_cont_iter), .Y(enab_cont_iter) );
  NOR2XLTS U671 ( .A(n438), .B(n427), .Y(n471) );
  OAI32X1TS U672 ( .A0(n427), .A1(n354), .A2(n426), .B0(n353), .B1(n427), .Y(
        n472) );
  NOR2X2TS U674 ( .A(n438), .B(n424), .Y(n385) );
  INVX2TS U675 ( .A(n385), .Y(n381) );
  OAI21X1TS U676 ( .A0(cont_iter_out[1]), .A1(n465), .B0(n381), .Y(n376) );
  CLKAND2X2TS U677 ( .A(n376), .B(cordic_FSM_state_reg[0]), .Y(n470) );
  INVX2TS U678 ( .A(beg_fsm_cordic), .Y(n359) );
  NAND2X1TS U679 ( .A(cordic_FSM_state_reg[1]), .B(n425), .Y(n358) );
  OAI32X1TS U680 ( .A0(n427), .A1(n360), .A2(n359), .B0(
        cordic_FSM_state_reg[0]), .B1(n358), .Y(n361) );
  OR4X2TS U681 ( .A(n265), .B(ack_add_subt), .C(n362), .D(n361), .Y(
        cordic_FSM_state_next_1_) );
  CLKAND2X2TS U682 ( .A(d_ff_Yn[0]), .B(n390), .Y(first_mux_Y[0]) );
  CLKAND2X2TS U683 ( .A(d_ff_Yn[1]), .B(n365), .Y(first_mux_Y[1]) );
  CLKAND2X2TS U684 ( .A(d_ff_Yn[2]), .B(n365), .Y(first_mux_Y[2]) );
  INVX4TS U685 ( .A(n364), .Y(n367) );
  CLKAND2X2TS U686 ( .A(d_ff_Yn[3]), .B(n367), .Y(first_mux_Y[3]) );
  CLKAND2X2TS U687 ( .A(d_ff_Yn[4]), .B(n365), .Y(first_mux_Y[4]) );
  CLKAND2X2TS U688 ( .A(d_ff_Yn[5]), .B(n365), .Y(first_mux_Y[5]) );
  CLKAND2X2TS U689 ( .A(d_ff_Yn[6]), .B(n365), .Y(first_mux_Y[6]) );
  CLKAND2X2TS U690 ( .A(d_ff_Yn[7]), .B(n365), .Y(first_mux_Y[7]) );
  CLKAND2X2TS U691 ( .A(d_ff_Yn[8]), .B(n365), .Y(first_mux_Y[8]) );
  CLKAND2X2TS U692 ( .A(d_ff_Yn[9]), .B(n365), .Y(first_mux_Y[9]) );
  CLKAND2X2TS U693 ( .A(d_ff_Yn[10]), .B(n365), .Y(first_mux_Y[10]) );
  CLKAND2X2TS U694 ( .A(d_ff_Yn[11]), .B(n365), .Y(first_mux_Y[11]) );
  CLKAND2X2TS U695 ( .A(d_ff_Yn[12]), .B(n365), .Y(first_mux_Y[12]) );
  CLKAND2X2TS U696 ( .A(d_ff_Yn[13]), .B(n390), .Y(first_mux_Y[13]) );
  CLKAND2X2TS U697 ( .A(d_ff_Yn[14]), .B(n365), .Y(first_mux_Y[14]) );
  CLKAND2X2TS U698 ( .A(d_ff_Yn[15]), .B(n365), .Y(first_mux_Y[15]) );
  CLKAND2X2TS U699 ( .A(d_ff_Yn[16]), .B(n365), .Y(first_mux_Y[16]) );
  CLKAND2X2TS U700 ( .A(d_ff_Yn[17]), .B(n365), .Y(first_mux_Y[17]) );
  INVX4TS U701 ( .A(n364), .Y(n368) );
  CLKAND2X2TS U702 ( .A(d_ff_Yn[18]), .B(n368), .Y(first_mux_Y[18]) );
  CLKAND2X2TS U703 ( .A(d_ff_Yn[19]), .B(n365), .Y(first_mux_Y[19]) );
  CLKAND2X2TS U704 ( .A(d_ff_Yn[20]), .B(n365), .Y(first_mux_Y[20]) );
  CLKAND2X2TS U705 ( .A(d_ff_Yn[21]), .B(n365), .Y(first_mux_Y[21]) );
  CLKAND2X2TS U706 ( .A(d_ff_Yn[22]), .B(n365), .Y(first_mux_Y[22]) );
  CLKAND2X2TS U707 ( .A(d_ff_Yn[23]), .B(n365), .Y(first_mux_Y[23]) );
  CLKAND2X2TS U708 ( .A(d_ff_Yn[24]), .B(n367), .Y(first_mux_Y[24]) );
  CLKAND2X2TS U709 ( .A(d_ff_Yn[25]), .B(n391), .Y(first_mux_Y[25]) );
  CLKAND2X2TS U710 ( .A(d_ff_Yn[26]), .B(n391), .Y(first_mux_Y[26]) );
  CLKAND2X2TS U711 ( .A(d_ff_Yn[27]), .B(n365), .Y(first_mux_Y[27]) );
  CLKAND2X2TS U712 ( .A(d_ff_Yn[28]), .B(n365), .Y(first_mux_Y[28]) );
  CLKAND2X2TS U713 ( .A(d_ff_Yn[29]), .B(n390), .Y(first_mux_Y[29]) );
  CLKAND2X2TS U714 ( .A(d_ff_Yn[30]), .B(n368), .Y(first_mux_Y[30]) );
  CLKAND2X2TS U715 ( .A(d_ff_Yn[31]), .B(n390), .Y(first_mux_Y[31]) );
  AO22XLTS U716 ( .A0(n367), .A1(d_ff_Zn[0]), .B0(n364), .B1(d_ff1_Z[0]), .Y(
        first_mux_Z[0]) );
  AO22XLTS U717 ( .A0(n368), .A1(d_ff_Zn[1]), .B0(n364), .B1(d_ff1_Z[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U718 ( .A0(n367), .A1(d_ff_Zn[2]), .B0(n364), .B1(d_ff1_Z[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U719 ( .A0(n368), .A1(d_ff_Zn[3]), .B0(n434), .B1(d_ff1_Z[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U720 ( .A0(n367), .A1(d_ff_Zn[4]), .B0(n434), .B1(d_ff1_Z[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U721 ( .A0(n368), .A1(d_ff_Zn[5]), .B0(n434), .B1(d_ff1_Z[5]), .Y(
        first_mux_Z[5]) );
  AO22XLTS U722 ( .A0(n367), .A1(d_ff_Zn[6]), .B0(n434), .B1(d_ff1_Z[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U723 ( .A0(n368), .A1(d_ff_Zn[7]), .B0(n434), .B1(d_ff1_Z[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U724 ( .A0(n368), .A1(d_ff_Zn[8]), .B0(n434), .B1(d_ff1_Z[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U725 ( .A0(n368), .A1(d_ff_Zn[9]), .B0(n434), .B1(d_ff1_Z[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U726 ( .A0(n367), .A1(d_ff_Zn[10]), .B0(n434), .B1(d_ff1_Z[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U727 ( .A0(n368), .A1(d_ff_Zn[11]), .B0(n434), .B1(d_ff1_Z[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U728 ( .A0(n367), .A1(d_ff_Zn[12]), .B0(n434), .B1(d_ff1_Z[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U729 ( .A0(n368), .A1(d_ff_Zn[13]), .B0(n434), .B1(d_ff1_Z[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U730 ( .A0(n367), .A1(d_ff_Zn[14]), .B0(n434), .B1(d_ff1_Z[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U731 ( .A0(n367), .A1(d_ff_Zn[15]), .B0(n434), .B1(d_ff1_Z[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U732 ( .A0(n367), .A1(d_ff_Zn[16]), .B0(n434), .B1(d_ff1_Z[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U733 ( .A0(n368), .A1(d_ff_Zn[17]), .B0(n364), .B1(d_ff1_Z[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U734 ( .A0(n368), .A1(d_ff_Zn[18]), .B0(n364), .B1(d_ff1_Z[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U735 ( .A0(n368), .A1(d_ff_Zn[19]), .B0(n364), .B1(d_ff1_Z[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U736 ( .A0(n367), .A1(d_ff_Zn[20]), .B0(n364), .B1(d_ff1_Z[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U737 ( .A0(n368), .A1(d_ff_Zn[21]), .B0(n364), .B1(d_ff1_Z[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U738 ( .A0(n367), .A1(d_ff_Zn[22]), .B0(n364), .B1(d_ff1_Z[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U739 ( .A0(n367), .A1(d_ff_Zn[23]), .B0(n364), .B1(d_ff1_Z[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U740 ( .A0(n367), .A1(d_ff_Zn[24]), .B0(n364), .B1(d_ff1_Z[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U741 ( .A0(n368), .A1(d_ff_Zn[25]), .B0(n364), .B1(d_ff1_Z[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U742 ( .A0(n367), .A1(d_ff_Zn[26]), .B0(n364), .B1(d_ff1_Z[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U743 ( .A0(n368), .A1(d_ff_Zn[27]), .B0(n364), .B1(d_ff1_Z[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U744 ( .A0(n367), .A1(d_ff_Zn[28]), .B0(n364), .B1(d_ff1_Z[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U745 ( .A0(n368), .A1(d_ff_Zn[29]), .B0(n364), .B1(d_ff1_Z[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U746 ( .A0(n367), .A1(d_ff_Zn[30]), .B0(n364), .B1(d_ff1_Z[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U747 ( .A0(n368), .A1(d_ff_Zn[31]), .B0(n364), .B1(d_ff1_Z[31]), 
        .Y(first_mux_Z[31]) );
  INVX4TS U748 ( .A(n369), .Y(n370) );
  AO22XLTS U749 ( .A0(n370), .A1(d_ff_Yn[0]), .B0(n369), .B1(d_ff_Xn[0]), .Y(
        mux_sal[0]) );
  AO22XLTS U750 ( .A0(n372), .A1(d_ff_Yn[1]), .B0(n369), .B1(d_ff_Xn[1]), .Y(
        mux_sal[1]) );
  AO22XLTS U751 ( .A0(n370), .A1(d_ff_Yn[2]), .B0(n369), .B1(d_ff_Xn[2]), .Y(
        mux_sal[2]) );
  AO22XLTS U752 ( .A0(n372), .A1(d_ff_Yn[3]), .B0(n369), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U753 ( .A0(n370), .A1(d_ff_Yn[4]), .B0(n369), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  AO22XLTS U754 ( .A0(n370), .A1(d_ff_Yn[5]), .B0(n369), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  AO22XLTS U755 ( .A0(n370), .A1(d_ff_Yn[6]), .B0(n369), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U756 ( .A0(n370), .A1(d_ff_Yn[7]), .B0(n369), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U757 ( .A0(n370), .A1(d_ff_Yn[8]), .B0(n369), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U758 ( .A0(n370), .A1(d_ff_Yn[9]), .B0(n437), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U759 ( .A0(n370), .A1(d_ff_Yn[10]), .B0(n369), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U760 ( .A0(n370), .A1(d_ff_Yn[11]), .B0(n437), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U761 ( .A0(n370), .A1(d_ff_Yn[12]), .B0(n371), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U762 ( .A0(n370), .A1(d_ff_Yn[13]), .B0(n371), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U763 ( .A0(n370), .A1(d_ff_Yn[14]), .B0(n371), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U764 ( .A0(n370), .A1(d_ff_Yn[15]), .B0(n371), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U765 ( .A0(n370), .A1(d_ff_Yn[16]), .B0(n371), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U766 ( .A0(n370), .A1(d_ff_Yn[17]), .B0(n371), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U767 ( .A0(n370), .A1(d_ff_Yn[18]), .B0(n371), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U768 ( .A0(n370), .A1(d_ff_Yn[19]), .B0(n371), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U769 ( .A0(n372), .A1(d_ff_Yn[20]), .B0(n371), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U770 ( .A0(n372), .A1(d_ff_Yn[21]), .B0(n371), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U771 ( .A0(n372), .A1(d_ff_Yn[22]), .B0(n371), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U772 ( .A0(n372), .A1(d_ff_Yn[23]), .B0(n371), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U773 ( .A0(n372), .A1(d_ff_Yn[24]), .B0(n371), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U774 ( .A0(n372), .A1(d_ff_Yn[25]), .B0(n371), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U775 ( .A0(n372), .A1(d_ff_Yn[26]), .B0(n369), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U776 ( .A0(n372), .A1(d_ff_Yn[27]), .B0(n369), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U777 ( .A0(n372), .A1(d_ff_Yn[28]), .B0(n369), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U778 ( .A0(n372), .A1(d_ff_Yn[29]), .B0(n371), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U779 ( .A0(n372), .A1(d_ff_Yn[30]), .B0(n371), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U780 ( .A0(n372), .A1(d_ff_Yn[31]), .B0(n371), .B1(d_ff_Xn[31]), 
        .Y(mux_sal[31]) );
  XNOR2X1TS U781 ( .A(data_output2_31_), .B(n374), .Y(sign_inv_out[31]) );
  AOI21X1TS U782 ( .A0(n465), .A1(n424), .B0(cont_iter_out[3]), .Y(n375) );
  OAI32X1TS U783 ( .A0(n424), .A1(cont_iter_out[3]), .A2(n465), .B0(n375), 
        .B1(n388), .Y(data_out_LUT[10]) );
  AO21XLTS U784 ( .A0(n386), .A1(n385), .B0(data_out_LUT[10]), .Y(
        data_out_LUT[0]) );
  NAND2X1TS U785 ( .A(n379), .B(n376), .Y(n377) );
  NAND2X1TS U786 ( .A(n378), .B(n377), .Y(data_out_LUT[6]) );
  AO21XLTS U787 ( .A0(n385), .A1(data_out_LUT[8]), .B0(data_out_LUT[16]), .Y(
        data_out_LUT[9]) );
  AOI21X1TS U788 ( .A0(cont_iter_out[1]), .A1(n386), .B0(n379), .Y(n380) );
  OAI21X1TS U789 ( .A0(cont_iter_out[3]), .A1(n381), .B0(n380), .Y(
        data_out_LUT[12]) );
  NAND3XLTS U790 ( .A(n438), .B(n426), .C(n424), .Y(n382) );
  NAND2BXLTS U791 ( .AN(data_out_LUT[12]), .B(n382), .Y(data_out_LUT[14]) );
  AO21XLTS U792 ( .A0(n385), .A1(data_out_LUT[8]), .B0(data_out_LUT[18]), .Y(
        data_out_LUT[21]) );
  OAI2BB2XLTS U793 ( .B0(n388), .B1(n387), .A0N(n424), .A1N(n386), .Y(
        data_out_LUT[2]) );
  AOI2BB2XLTS U794 ( .B0(n465), .B1(data_out_LUT[22]), .A0N(data_out_LUT[22]), 
        .A1N(n465), .Y(data_out_LUT[23]) );
  AOI32X1TS U795 ( .A0(n438), .A1(n389), .A2(cont_iter_out[1]), .B0(n388), 
        .B1(n389), .Y(data_out_LUT[25]) );
  CLKAND2X2TS U796 ( .A(d_ff_Xn[0]), .B(n391), .Y(first_mux_X[0]) );
  NAND2BXLTS U797 ( .AN(d_ff_Xn[1]), .B(n391), .Y(first_mux_X[1]) );
  NAND2BXLTS U798 ( .AN(d_ff_Xn[2]), .B(n391), .Y(first_mux_X[2]) );
  NAND2BXLTS U799 ( .AN(d_ff_Xn[3]), .B(n391), .Y(first_mux_X[3]) );
  CLKAND2X2TS U800 ( .A(d_ff_Xn[4]), .B(n390), .Y(first_mux_X[4]) );
  NAND2BXLTS U801 ( .AN(d_ff_Xn[5]), .B(n391), .Y(first_mux_X[5]) );
  NAND2BXLTS U802 ( .AN(d_ff_Xn[6]), .B(n390), .Y(first_mux_X[6]) );
  NAND2BXLTS U803 ( .AN(d_ff_Xn[7]), .B(n391), .Y(first_mux_X[7]) );
  CLKAND2X2TS U804 ( .A(d_ff_Xn[8]), .B(n390), .Y(first_mux_X[8]) );
  CLKAND2X2TS U805 ( .A(d_ff_Xn[9]), .B(n390), .Y(first_mux_X[9]) );
  NAND2BXLTS U806 ( .AN(d_ff_Xn[10]), .B(n391), .Y(first_mux_X[10]) );
  CLKAND2X2TS U807 ( .A(d_ff_Xn[11]), .B(n391), .Y(first_mux_X[11]) );
  NAND2BXLTS U808 ( .AN(d_ff_Xn[12]), .B(n390), .Y(first_mux_X[12]) );
  NAND2BXLTS U809 ( .AN(d_ff_Xn[13]), .B(n391), .Y(first_mux_X[13]) );
  NAND2BXLTS U810 ( .AN(d_ff_Xn[14]), .B(n391), .Y(first_mux_X[14]) );
  CLKAND2X2TS U811 ( .A(d_ff_Xn[15]), .B(n391), .Y(first_mux_X[15]) );
  NAND2BXLTS U812 ( .AN(d_ff_Xn[16]), .B(n390), .Y(first_mux_X[16]) );
  NAND2BXLTS U813 ( .AN(d_ff_Xn[17]), .B(n390), .Y(first_mux_X[17]) );
  CLKAND2X2TS U814 ( .A(d_ff_Xn[18]), .B(n391), .Y(first_mux_X[18]) );
  NAND2BXLTS U815 ( .AN(d_ff_Xn[19]), .B(n390), .Y(first_mux_X[19]) );
  NAND2BXLTS U816 ( .AN(d_ff_Xn[20]), .B(n390), .Y(first_mux_X[20]) );
  CLKAND2X2TS U817 ( .A(d_ff_Xn[21]), .B(n391), .Y(first_mux_X[21]) );
  CLKAND2X2TS U818 ( .A(d_ff_Xn[22]), .B(n391), .Y(first_mux_X[22]) );
  CLKAND2X2TS U819 ( .A(d_ff_Xn[23]), .B(n391), .Y(first_mux_X[23]) );
  NAND2BXLTS U820 ( .AN(d_ff_Xn[24]), .B(n390), .Y(first_mux_X[24]) );
  NAND2BXLTS U821 ( .AN(d_ff_Xn[25]), .B(n390), .Y(first_mux_X[25]) );
  NAND2BXLTS U822 ( .AN(d_ff_Xn[26]), .B(n390), .Y(first_mux_X[26]) );
  NAND2BXLTS U823 ( .AN(d_ff_Xn[27]), .B(n390), .Y(first_mux_X[27]) );
  NAND2BXLTS U824 ( .AN(d_ff_Xn[28]), .B(n390), .Y(first_mux_X[28]) );
  NAND2BXLTS U825 ( .AN(d_ff_Xn[29]), .B(n390), .Y(first_mux_X[29]) );
  CLKAND2X2TS U826 ( .A(d_ff_Xn[30]), .B(n391), .Y(first_mux_X[30]) );
  CLKAND2X2TS U827 ( .A(d_ff_Xn[31]), .B(n391), .Y(first_mux_X[31]) );
  AO22XLTS U828 ( .A0(n393), .A1(d_ff3_sh_x_out[31]), .B0(n415), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U829 ( .A0(n394), .A1(d_ff3_sh_x_out[30]), .B0(n415), .B1(
        d_ff3_sh_y_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U830 ( .A0(n412), .A1(d_ff3_sh_x_out[29]), .B0(n392), .B1(
        d_ff3_sh_y_out[29]), .Y(n395) );
  NAND2X1TS U831 ( .A(n417), .B(d_ff3_LUT_out[27]), .Y(n398) );
  NAND2X1TS U832 ( .A(n395), .B(n398), .Y(add_subt_dataB[29]) );
  AOI22X1TS U833 ( .A0(n393), .A1(d_ff3_sh_x_out[28]), .B0(n392), .B1(
        d_ff3_sh_y_out[28]), .Y(n396) );
  NAND2X1TS U834 ( .A(n396), .B(n398), .Y(add_subt_dataB[28]) );
  AOI22X1TS U835 ( .A0(n397), .A1(d_ff3_sh_x_out[27]), .B0(n392), .B1(
        d_ff3_sh_y_out[27]), .Y(n399) );
  NAND2X1TS U836 ( .A(n399), .B(n398), .Y(add_subt_dataB[27]) );
  AOI22X1TS U837 ( .A0(n412), .A1(d_ff3_sh_x_out[22]), .B0(n392), .B1(
        d_ff3_sh_y_out[22]), .Y(n400) );
  OAI2BB1X1TS U838 ( .A0N(n417), .A1N(d_ff3_LUT_out[22]), .B0(n400), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U839 ( .A0(n412), .A1(d_ff3_sh_x_out[20]), .B0(n392), .B1(
        d_ff3_sh_y_out[20]), .Y(n402) );
  NAND2X1TS U840 ( .A(n401), .B(d_ff3_LUT_out[20]), .Y(n407) );
  NAND2X1TS U841 ( .A(n402), .B(n407), .Y(add_subt_dataB[20]) );
  AOI22X1TS U842 ( .A0(n412), .A1(d_ff3_sh_x_out[19]), .B0(n392), .B1(
        d_ff3_sh_y_out[19]), .Y(n403) );
  OAI2BB1X1TS U843 ( .A0N(n417), .A1N(d_ff3_LUT_out[22]), .B0(n403), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U844 ( .A0(n412), .A1(d_ff3_sh_x_out[18]), .B0(n392), .B1(
        d_ff3_sh_y_out[18]), .Y(n404) );
  OAI2BB1X1TS U845 ( .A0N(n417), .A1N(d_ff3_LUT_out[18]), .B0(n404), .Y(
        add_subt_dataB[18]) );
  AOI22X1TS U846 ( .A0(n412), .A1(d_ff3_sh_x_out[17]), .B0(n392), .B1(
        d_ff3_sh_y_out[17]), .Y(n405) );
  NAND2X1TS U847 ( .A(n405), .B(n407), .Y(add_subt_dataB[17]) );
  AOI22X1TS U848 ( .A0(n412), .A1(d_ff3_sh_x_out[16]), .B0(n392), .B1(
        d_ff3_sh_y_out[16]), .Y(n406) );
  OAI2BB1X1TS U849 ( .A0N(n417), .A1N(d_ff3_LUT_out[16]), .B0(n406), .Y(
        add_subt_dataB[16]) );
  AOI22X1TS U850 ( .A0(n412), .A1(d_ff3_sh_x_out[15]), .B0(n392), .B1(
        d_ff3_sh_y_out[15]), .Y(n408) );
  NAND2X1TS U851 ( .A(n408), .B(n407), .Y(add_subt_dataB[15]) );
  AOI22X1TS U852 ( .A0(n412), .A1(d_ff3_sh_x_out[14]), .B0(n392), .B1(
        d_ff3_sh_y_out[14]), .Y(n409) );
  OAI2BB1X1TS U853 ( .A0N(n417), .A1N(d_ff3_LUT_out[14]), .B0(n409), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U854 ( .A0(n393), .A1(d_ff3_sh_x_out[13]), .B0(n415), .B1(
        d_ff3_sh_y_out[13]), .Y(n410) );
  OAI2BB1X1TS U855 ( .A0N(n417), .A1N(d_ff3_LUT_out[18]), .B0(n410), .Y(
        add_subt_dataB[13]) );
  AOI22X1TS U856 ( .A0(n412), .A1(d_ff3_sh_x_out[11]), .B0(n334), .B1(
        d_ff3_sh_y_out[11]), .Y(n411) );
  OAI2BB1X1TS U857 ( .A0N(n417), .A1N(d_ff3_LUT_out[11]), .B0(n411), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U858 ( .A0(n412), .A1(d_ff3_sh_x_out[7]), .B0(n392), .B1(
        d_ff3_sh_y_out[7]), .Y(n413) );
  OAI2BB1X1TS U859 ( .A0N(n417), .A1N(d_ff3_LUT_out[11]), .B0(n413), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U860 ( .A0(n393), .A1(d_ff3_sh_x_out[5]), .B0(n415), .B1(
        d_ff3_sh_y_out[5]), .Y(n414) );
  OAI2BB1X1TS U861 ( .A0N(n417), .A1N(d_ff3_LUT_out[14]), .B0(n414), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U862 ( .A0(n393), .A1(d_ff3_sh_x_out[3]), .B0(n415), .B1(
        d_ff3_sh_y_out[3]), .Y(n416) );
  OAI2BB1X1TS U863 ( .A0N(n417), .A1N(d_ff3_LUT_out[16]), .B0(n416), .Y(
        add_subt_dataB[3]) );
  XNOR2X1TS U864 ( .A(cont_var_out[0]), .B(d_ff3_sign_out), .Y(op_add_subt) );
  NOR2XLTS U866 ( .A(d_ff2_Y[29]), .B(n419), .Y(n418) );
  XOR2XLTS U867 ( .A(d_ff2_Y[30]), .B(n418), .Y(sh_exp_y[7]) );
  XNOR2X1TS U868 ( .A(d_ff2_Y[29]), .B(n419), .Y(sh_exp_y[6]) );
  AO21XLTS U869 ( .A0(intadd_418_n1), .A1(d_ff2_Y[27]), .B0(n420), .Y(
        sh_exp_y[4]) );
  NOR2XLTS U870 ( .A(d_ff2_X[29]), .B(n422), .Y(n421) );
  XOR2XLTS U871 ( .A(d_ff2_X[30]), .B(n421), .Y(sh_exp_x[7]) );
  XNOR2X1TS U872 ( .A(d_ff2_X[29]), .B(n422), .Y(sh_exp_x[6]) );
  AO21XLTS U873 ( .A0(intadd_417_n1), .A1(d_ff2_X[27]), .B0(n423), .Y(
        sh_exp_x[4]) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule

