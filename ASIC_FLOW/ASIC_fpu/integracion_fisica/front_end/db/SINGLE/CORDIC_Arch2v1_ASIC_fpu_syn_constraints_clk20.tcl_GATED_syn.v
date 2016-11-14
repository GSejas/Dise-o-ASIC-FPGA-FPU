/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:00:45 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_counter_d_W4_29 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_15 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_16 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_18 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_19 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_20 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_22 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_25 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5_1 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
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
  wire   enab_cont_iter, load_cont_iter, enab_d_ff2_RB2, enab_d_ff4_Xn,
         enab_d_ff4_Yn, enab_d_ff4_Zn, enab_d_ff5_data_out, enab_dff_5,
         d_ff3_sign_out, data_output2_31_, cordic_FSM_state_next_1_,
         cont_iter_net3595610, d_ff5_data_out_net3595574, reg_Z0_net3595574,
         reg_val_muxZ_2stage_net3595574, reg_shift_y_net3595574,
         d_ff4_Xn_net3595574, d_ff4_Yn_net3595574, d_ff4_Zn_net3595574,
         d_ff5_net3595574, n180, n186, n187, n188, n189, n193, n194, n195,
         n196, n197, intadd_413_CI, intadd_413_n3, intadd_413_n2,
         intadd_413_n1, intadd_414_CI, intadd_414_n3, intadd_414_n2,
         intadd_414_n1, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n481,
         n482, n483, n484, n485;
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

  SNPS_CLOCK_GATE_HIGH_counter_d_W4_29 cont_iter_clk_gate_count_reg ( .CLK(clk), .EN(enab_cont_iter), .ENCLK(cont_iter_net3595610), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_13 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3595574), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_25 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(load_cont_iter), .ENCLK(reg_Z0_net3595574), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_22 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enab_d_ff2_RB2), .ENCLK(reg_val_muxZ_2stage_net3595574), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_20 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(n269), .ENCLK(reg_shift_y_net3595574), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_19 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3595574), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_18 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3595574), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_16 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3595574), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_15 d_ff5_clk_gate_Q_reg ( .CLK(clk), .EN(
        enab_dff_5), .ENCLK(d_ff5_net3595574), .TE(1'b0) );
  DFFRXLTS cont_iter_count_reg_2_ ( .D(n482), .CK(cont_iter_net3595610), .RN(
        n478), .QN(n274) );
  DFFRXLTS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3595574), 
        .RN(n478), .QN(n266) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3595574), .RN(n478), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n447) );
  DFFRXLTS reg_ch_mux_1_Q_reg_0_ ( .D(n188), .CK(n479), .RN(n478), .Q(n265), 
        .QN(n448) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(data_out_LUT[0]), .CK(reg_shift_y_net3595574), 
        .RN(n478), .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(data_out_LUT[1]), .CK(reg_shift_y_net3595574), 
        .RN(n478), .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(data_out_LUT[2]), .CK(reg_shift_y_net3595574), 
        .RN(n477), .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(data_out_LUT[4]), .CK(reg_shift_y_net3595574), 
        .RN(n477), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(data_out_LUT[6]), .CK(reg_shift_y_net3595574), 
        .RN(n477), .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(data_out_LUT[8]), .CK(reg_shift_y_net3595574), 
        .RN(n477), .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(data_out_LUT[9]), .CK(reg_shift_y_net3595574), 
        .RN(n477), .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(data_out_LUT[10]), .CK(
        reg_shift_y_net3595574), .RN(n477), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(data_out_LUT[11]), .CK(
        reg_shift_y_net3595574), .RN(n477), .Q(d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(data_out_LUT[12]), .CK(
        reg_shift_y_net3595574), .RN(n477), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(data_out_LUT[14]), .CK(
        reg_shift_y_net3595574), .RN(n477), .Q(d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(data_out_LUT[16]), .CK(
        reg_shift_y_net3595574), .RN(n477), .Q(d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(data_out_LUT[18]), .CK(
        reg_shift_y_net3595574), .RN(n477), .Q(d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(data_out_LUT[20]), .CK(
        reg_shift_y_net3595574), .RN(n477), .Q(d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(data_out_LUT[21]), .CK(
        reg_shift_y_net3595574), .RN(n475), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(data_out_LUT[22]), .CK(
        reg_shift_y_net3595574), .RN(n471), .Q(d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(data_out_LUT[23]), .CK(
        reg_shift_y_net3595574), .RN(n472), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(data_out_LUT[24]), .CK(
        reg_shift_y_net3595574), .RN(n465), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3595574), .RN(n466), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(data_out_LUT[26]), .CK(
        reg_shift_y_net3595574), .RN(n467), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3595574), .RN(n475), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3595574), .RN(n476), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3595574), .RN(n465), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3595574), .RN(n471), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3595574), .RN(n472), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3595574), .RN(n465), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3595574), .RN(n476), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3595574), .RN(n476), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3595574), .RN(n476), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3595574), .RN(n476), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3595574), .RN(
        n476), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3595574), .RN(
        n476), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3595574), .RN(
        n476), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3595574), .RN(
        n476), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3595574), .RN(
        n476), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3595574), .RN(
        n476), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3595574), .RN(
        n476), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3595574), .RN(
        n476), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3595574), .RN(
        n475), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3595574), .RN(
        n469), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3595574), .RN(
        n470), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3595574), .RN(n473), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3595574), .RN(n474), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3595574), .RN(n468), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3595574), .RN(n469), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3595574), .RN(n470), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3595574), .RN(n473), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3595574), .RN(n474), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3595574), .RN(n468), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3595574), .RN(n469), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3595574), .RN(n470), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3595574), .RN(n474), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3595574), .RN(n474), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3595574), .RN(n474), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3595574), .RN(n474), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3595574), .RN(n474), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3595574), .RN(n474), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3595574), .RN(n474), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n474), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3595574), 
        .RN(n474), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3595574), .RN(n474), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n474), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3595574), 
        .RN(n474), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3595574), .RN(n473), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n473), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3595574), 
        .RN(n473), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3595574), .RN(n473), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n473), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3595574), 
        .RN(n473), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3595574), .RN(n473), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n473), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3595574), 
        .RN(n473), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3595574), .RN(n473), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n473), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3595574), 
        .RN(n473), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3595574), .RN(n472), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n472), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3595574), 
        .RN(n472), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3595574), .RN(n472), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n472), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3595574), 
        .RN(n472), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3595574), .RN(n472), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n472), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3595574), 
        .RN(n472), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3595574), .RN(n472), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n472), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3595574), 
        .RN(n472), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3595574), .RN(n471), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n471), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3595574), .RN(n471), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3595574), .RN(n471), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n471), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3595574), .RN(n471), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3595574), .RN(n471), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n471), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3595574), .RN(n471), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3595574), .RN(n471), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n471), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3595574), .RN(n471), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3595574), .RN(n476), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n453), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3595574), .RN(n459), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3595574), .RN(n454), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n455), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3595574), .RN(n454), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3595574), .RN(n458), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n455), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3595574), .RN(n471), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3595574), .RN(n474), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n473), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3595574), .RN(n468), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3595574), .RN(n470), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n470), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3595574), .RN(n470), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3595574), .RN(n470), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n470), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3595574), .RN(n470), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3595574), .RN(n470), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n470), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3595574), .RN(n470), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3595574), .RN(n470), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n470), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3595574), .RN(n470), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3595574), .RN(n469), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n469), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3595574), .RN(n469), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3595574), .RN(n469), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n469), .Q(d_ff2_X[23]), .QN(n442)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3595574), .RN(n469), .Q(d_ff_Xn[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3595574), .RN(n469), .Q(d_ff_Xn[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3595574), .RN(n469), .Q(d_ff_Xn[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3595574), .RN(n469), .Q(d_ff_Xn[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n468), .Q(d_ff2_X[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3595574), .RN(n468), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n468), .Q(d_ff2_X[28]), .QN(n450)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3595574), .RN(n468), .Q(d_ff_Xn[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3595574), .RN(n468), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n468), .Q(d_ff2_X[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3595574), .RN(n468), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n468), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3595574), .RN(n468), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3595574), .RN(n468), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n468), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3595574), 
        .RN(n467), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3595574), .RN(n467), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n467), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3595574), 
        .RN(n467), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3595574), .RN(n467), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n467), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3595574), 
        .RN(n467), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3595574), .RN(n467), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n467), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3595574), 
        .RN(n467), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3595574), .RN(n467), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n467), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3595574), 
        .RN(n466), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3595574), .RN(n466), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n466), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3595574), 
        .RN(n466), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3595574), .RN(n466), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n466), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3595574), 
        .RN(n466), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3595574), .RN(n466), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n466), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3595574), 
        .RN(n466), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3595574), .RN(n466), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n466), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3595574), 
        .RN(n465), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3595574), .RN(n465), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n465), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3595574), 
        .RN(n465), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3595574), .RN(n465), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n465), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3595574), .RN(n465), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3595574), .RN(n465), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n465), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3595574), .RN(n465), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3595574), .RN(n465), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n465), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3595574), .RN(n464), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3595574), .RN(n464), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n464), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3595574), .RN(n464), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3595574), .RN(n464), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n464), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3595574), .RN(n464), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3595574), .RN(n464), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n464), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3595574), .RN(n464), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3595574), .RN(n464), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n464), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3595574), .RN(n463), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3595574), .RN(n463), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n463), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3595574), .RN(n463), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3595574), .RN(n463), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n463), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3595574), .RN(n463), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3595574), .RN(n463), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n463), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3595574), .RN(n463), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3595574), .RN(n463), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n463), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3595574), .RN(n462), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3595574), .RN(n462), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n462), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3595574), .RN(n462), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3595574), .RN(n462), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n462), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3595574), .RN(n462), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3595574), .RN(n462), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n462), .Q(d_ff2_Y[23]), .QN(n441)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3595574), .RN(n462), .Q(d_ff_Yn[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3595574), .RN(n462), .Q(d_ff_Yn[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3595574), .RN(n461), .Q(d_ff_Yn[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3595574), .RN(n461), .Q(d_ff_Yn[27]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n461), .Q(d_ff2_Y[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3595574), .RN(n461), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n461), .Q(d_ff2_Y[28]), .QN(n449)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3595574), .RN(n461), .Q(d_ff_Yn[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3595574), .RN(n461), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n461), .Q(d_ff2_Y[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3595574), .RN(n461), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n460), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3595574), .RN(n460), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3595574), .RN(n460), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n460), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3595574), .RN(n460), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n460), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3595574), .RN(n460), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n460), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3595574), .RN(n460), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n460), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3595574), .RN(n460), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n460), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3595574), .RN(n459), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n459), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3595574), .RN(n459), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n459), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3595574), .RN(n459), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n459), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3595574), .RN(n459), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n459), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3595574), .RN(n459), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n459), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3595574), .RN(n459), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n459), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3595574), .RN(n458), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n458), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3595574), .RN(n458), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n458), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3595574), .RN(n458), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n458), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3595574), .RN(n458), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n458), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3595574), .RN(n458), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n458), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3595574), .RN(n458), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n458), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3595574), .RN(n457), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n457), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3595574), .RN(n457), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n457), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3595574), .RN(n457), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n457), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3595574), .RN(n457), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n457), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3595574), .RN(n457), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n457), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3595574), .RN(n457), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n457), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3595574), .RN(n456), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n456), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3595574), .RN(n456), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n456), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3595574), .RN(n456), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n456), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3595574), .RN(n456), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n456), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3595574), .RN(n456), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n456), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3595574), .RN(n456), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n456), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3595574), .RN(n456), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n457), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3595574), .RN(n458), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n454), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3595574), .RN(n455), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n456), .Q(d_ff2_Z[31]) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(mux_sal[0]), .CK(d_ff5_net3595574), .RN(n457), 
        .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(mux_sal[1]), .CK(d_ff5_net3595574), .RN(n458), 
        .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(mux_sal[2]), .CK(d_ff5_net3595574), .RN(n462), 
        .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(mux_sal[3]), .CK(d_ff5_net3595574), .RN(n455), 
        .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(mux_sal[4]), .CK(d_ff5_net3595574), .RN(n455), 
        .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(mux_sal[5]), .CK(d_ff5_net3595574), .RN(n455), 
        .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(mux_sal[6]), .CK(d_ff5_net3595574), .RN(n455), 
        .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(mux_sal[7]), .CK(d_ff5_net3595574), .RN(n455), 
        .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(mux_sal[8]), .CK(d_ff5_net3595574), .RN(n455), 
        .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(mux_sal[9]), .CK(d_ff5_net3595574), .RN(n454), 
        .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(mux_sal[10]), .CK(d_ff5_net3595574), .RN(n454), 
        .Q(sign_inv_out[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(mux_sal[11]), .CK(d_ff5_net3595574), .RN(n454), 
        .Q(sign_inv_out[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(mux_sal[12]), .CK(d_ff5_net3595574), .RN(n454), 
        .Q(sign_inv_out[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(mux_sal[13]), .CK(d_ff5_net3595574), .RN(n454), 
        .Q(sign_inv_out[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(mux_sal[14]), .CK(d_ff5_net3595574), .RN(n454), 
        .Q(sign_inv_out[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(mux_sal[15]), .CK(d_ff5_net3595574), .RN(n460), 
        .Q(sign_inv_out[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(mux_sal[16]), .CK(d_ff5_net3595574), .RN(n461), 
        .Q(sign_inv_out[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(mux_sal[17]), .CK(d_ff5_net3595574), .RN(n453), 
        .Q(sign_inv_out[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(mux_sal[18]), .CK(d_ff5_net3595574), .RN(n457), 
        .Q(sign_inv_out[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(mux_sal[19]), .CK(d_ff5_net3595574), .RN(n460), 
        .Q(sign_inv_out[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(mux_sal[20]), .CK(d_ff5_net3595574), .RN(n461), 
        .Q(sign_inv_out[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(mux_sal[21]), .CK(d_ff5_net3595574), .RN(n466), 
        .Q(sign_inv_out[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(mux_sal[22]), .CK(d_ff5_net3595574), .RN(n467), 
        .Q(sign_inv_out[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(mux_sal[23]), .CK(d_ff5_net3595574), .RN(n475), 
        .Q(sign_inv_out[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(mux_sal[24]), .CK(d_ff5_net3595574), .RN(n476), 
        .Q(sign_inv_out[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(mux_sal[25]), .CK(d_ff5_net3595574), .RN(n466), 
        .Q(sign_inv_out[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(mux_sal[26]), .CK(d_ff5_net3595574), .RN(n467), 
        .Q(sign_inv_out[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(mux_sal[27]), .CK(d_ff5_net3595574), .RN(n453), 
        .Q(sign_inv_out[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(mux_sal[28]), .CK(d_ff5_net3595574), .RN(n453), 
        .Q(sign_inv_out[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(mux_sal[29]), .CK(d_ff5_net3595574), .RN(n453), 
        .Q(sign_inv_out[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(mux_sal[30]), .CK(d_ff5_net3595574), .RN(n453), 
        .Q(sign_inv_out[30]) );
  DFFRXLTS d_ff5_Q_reg_31_ ( .D(mux_sal[31]), .CK(d_ff5_net3595574), .RN(n453), 
        .Q(data_output2_31_) );
  SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5_1 clk_gate_reg_ch_mux_2_Q_reg ( 
        .CLK(clk), .EN(n481), .ENCLK(n479), .TE(1'b0) );
  CMPR32X2TS intadd_414_U3 ( .A(d_ff2_Y[25]), .B(data_out_LUT[8]), .C(
        intadd_414_n3), .CO(intadd_414_n2), .S(sh_exp_y[2]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(1'b1), .CK(reg_shift_y_net3595574), .RN(n453), .Q(d_ff3_LUT_out[27]) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n194), .CK(n479), .RN(n478), .Q(
        cont_var_out[1]), .QN(n446) );
  DFFRX2TS cordic_FSM_state_reg_reg_2_ ( .D(n196), .CK(clk), .RN(n180), .Q(
        cordic_FSM_state_reg[2]), .QN(n445) );
  DFFRX1TS reg_ch_mux_2_Q_reg_0_ ( .D(n187), .CK(n479), .RN(n478), .Q(
        sel_mux_2_reg[0]), .QN(n444) );
  DFFRX2TS cont_var_count_reg_0_ ( .D(n193), .CK(n479), .RN(n478), .Q(
        cont_var_out[0]), .QN(n443) );
  DFFRX2TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n180), .Q(cordic_FSM_state_reg[1]), .QN(n440) );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n485), .CK(cont_iter_net3595610), .RN(
        n477), .Q(cont_iter_out[3]), .QN(n438) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(sign_inv_out[0]), .CK(
        d_ff5_data_out_net3595574), .RN(n463), .Q(data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(sign_inv_out[1]), .CK(
        d_ff5_data_out_net3595574), .RN(n464), .Q(data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(sign_inv_out[2]), .CK(
        d_ff5_data_out_net3595574), .RN(n455), .Q(data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(sign_inv_out[3]), .CK(
        d_ff5_data_out_net3595574), .RN(n455), .Q(data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(sign_inv_out[4]), .CK(
        d_ff5_data_out_net3595574), .RN(n455), .Q(data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(sign_inv_out[5]), .CK(
        d_ff5_data_out_net3595574), .RN(n455), .Q(data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(sign_inv_out[6]), .CK(
        d_ff5_data_out_net3595574), .RN(n455), .Q(data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(sign_inv_out[7]), .CK(
        d_ff5_data_out_net3595574), .RN(n455), .Q(data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(sign_inv_out[8]), .CK(
        d_ff5_data_out_net3595574), .RN(n454), .Q(data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(sign_inv_out[9]), .CK(
        d_ff5_data_out_net3595574), .RN(n454), .Q(data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(sign_inv_out[10]), .CK(
        d_ff5_data_out_net3595574), .RN(n454), .Q(data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(sign_inv_out[11]), .CK(
        d_ff5_data_out_net3595574), .RN(n454), .Q(data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(sign_inv_out[12]), .CK(
        d_ff5_data_out_net3595574), .RN(n454), .Q(data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(sign_inv_out[13]), .CK(
        d_ff5_data_out_net3595574), .RN(n454), .Q(data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(sign_inv_out[14]), .CK(
        d_ff5_data_out_net3595574), .RN(n459), .Q(data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(sign_inv_out[15]), .CK(
        d_ff5_data_out_net3595574), .RN(n460), .Q(data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(sign_inv_out[16]), .CK(
        d_ff5_data_out_net3595574), .RN(n461), .Q(data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(sign_inv_out[17]), .CK(
        d_ff5_data_out_net3595574), .RN(n453), .Q(data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(sign_inv_out[18]), .CK(
        d_ff5_data_out_net3595574), .RN(n472), .Q(data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(sign_inv_out[19]), .CK(
        d_ff5_data_out_net3595574), .RN(n459), .Q(data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(sign_inv_out[20]), .CK(
        d_ff5_data_out_net3595574), .RN(n464), .Q(data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(sign_inv_out[21]), .CK(
        d_ff5_data_out_net3595574), .RN(n464), .Q(data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(sign_inv_out[22]), .CK(
        d_ff5_data_out_net3595574), .RN(n462), .Q(data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(sign_inv_out[23]), .CK(
        d_ff5_data_out_net3595574), .RN(n456), .Q(data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(sign_inv_out[24]), .CK(
        d_ff5_data_out_net3595574), .RN(n463), .Q(data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(sign_inv_out[25]), .CK(
        d_ff5_data_out_net3595574), .RN(n463), .Q(data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(sign_inv_out[26]), .CK(
        d_ff5_data_out_net3595574), .RN(n453), .Q(data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(sign_inv_out[27]), .CK(
        d_ff5_data_out_net3595574), .RN(n453), .Q(data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(sign_inv_out[28]), .CK(
        d_ff5_data_out_net3595574), .RN(n453), .Q(data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(sign_inv_out[29]), .CK(
        d_ff5_data_out_net3595574), .RN(n453), .Q(data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(sign_inv_out[30]), .CK(
        d_ff5_data_out_net3595574), .RN(n453), .Q(data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(sign_inv_out[31]), .CK(
        d_ff5_data_out_net3595574), .RN(n453), .Q(data_output[31]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[31]), .CK(reg_shift_y_net3595574), 
        .RN(n462), .Q(d_ff3_sign_out) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n186), .CK(n479), .RN(n478), .Q(
        sel_mux_2_reg[1]) );
  DFFRX4TS cont_iter_count_reg_0_ ( .D(n484), .CK(cont_iter_net3595610), .RN(
        n478), .Q(n451), .QN(n273) );
  DFFRX4TS cont_iter_count_reg_1_ ( .D(n483), .CK(cont_iter_net3595610), .RN(
        n478), .Q(cont_iter_out[1]), .QN(n436) );
  DFFRX2TS reg_ch_mux_3_Q_reg_0_ ( .D(n189), .CK(n479), .RN(n478), .Q(n267), 
        .QN(n452) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3595574), .RN(n478), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n461), .Q(d_ff2_Y[29]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n461), .Q(d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n461), .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n462), .Q(d_ff2_Y[24]) );
  DFFRX4TS cordic_FSM_state_reg_reg_0_ ( .D(n197), .CK(clk), .RN(n180), .Q(
        cordic_FSM_state_reg[0]), .QN(n437) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n468), .Q(d_ff2_X[29]) );
  DFFRX4TS cordic_FSM_state_reg_reg_3_ ( .D(n195), .CK(n479), .RN(n180), .Q(
        n263), .QN(n439) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n469), .Q(d_ff2_X[24]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n469), .Q(d_ff2_X[25]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3595574), .RN(n469), .Q(d_ff2_X[26]) );
  ADDFX1TS intadd_413_U4 ( .A(d_ff2_X[24]), .B(n436), .CI(intadd_413_CI), .CO(
        intadd_413_n3), .S(sh_exp_x[1]) );
  ADDFX1TS intadd_414_U4 ( .A(d_ff2_Y[24]), .B(n436), .CI(intadd_414_CI), .CO(
        intadd_414_n3), .S(sh_exp_y[1]) );
  ADDFX1TS intadd_413_U3 ( .A(d_ff2_X[25]), .B(data_out_LUT[8]), .CI(
        intadd_413_n3), .CO(intadd_413_n2), .S(sh_exp_x[2]) );
  ADDFX1TS intadd_414_U2 ( .A(d_ff2_Y[26]), .B(n438), .CI(intadd_414_n2), .CO(
        intadd_414_n1), .S(sh_exp_y[3]) );
  ADDFX1TS intadd_413_U2 ( .A(d_ff2_X[26]), .B(n438), .CI(intadd_413_n2), .CO(
        intadd_413_n1), .S(sh_exp_x[3]) );
  AOI222X1TS U437 ( .A0(n351), .A1(d_ff2_Z[8]), .B0(n427), .B1(d_ff2_Y[8]), 
        .C0(n426), .C1(d_ff2_X[8]), .Y(n343) );
  NOR2XLTS U438 ( .A(n300), .B(n305), .Y(enab_d_ff4_Yn) );
  INVX3TS U439 ( .A(n379), .Y(n404) );
  NAND2XLTS U440 ( .A(sel_mux_2_reg[1]), .B(n477), .Y(n294) );
  AOI222X1TS U441 ( .A0(n351), .A1(d_ff2_Z[7]), .B0(n427), .B1(d_ff2_Y[7]), 
        .C0(n426), .C1(d_ff2_X[7]), .Y(n345) );
  AOI222X1TS U442 ( .A0(n351), .A1(d_ff2_Z[9]), .B0(n427), .B1(d_ff2_Y[9]), 
        .C0(n426), .C1(d_ff2_X[9]), .Y(n344) );
  AOI222X1TS U443 ( .A0(n351), .A1(d_ff2_Z[10]), .B0(n427), .B1(d_ff2_Y[10]), 
        .C0(n426), .C1(d_ff2_X[10]), .Y(n342) );
  BUFX3TS U444 ( .A(n408), .Y(n422) );
  BUFX3TS U445 ( .A(n426), .Y(n366) );
  BUFX4TS U446 ( .A(n293), .Y(n292) );
  NOR2X2TS U447 ( .A(sel_mux_2_reg[1]), .B(n444), .Y(n288) );
  NOR3X2TS U448 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n440), .Y(n264) );
  BUFX4TS U449 ( .A(n316), .Y(n339) );
  NOR2XLTS U450 ( .A(n263), .B(n481), .Y(enab_d_ff2_RB2) );
  NOR3XLTS U451 ( .A(n304), .B(n303), .C(n305), .Y(enab_d_ff4_Xn) );
  NOR3XLTS U452 ( .A(n306), .B(n309), .C(n305), .Y(enab_d_ff4_Zn) );
  OR2X1TS U453 ( .A(n370), .B(load_cont_iter), .Y(enab_cont_iter) );
  NAND2BXLTS U454 ( .AN(d_ff_Xn[26]), .B(n404), .Y(first_mux_X[26]) );
  NAND2BXLTS U455 ( .AN(d_ff_Xn[25]), .B(n404), .Y(first_mux_X[25]) );
  NAND2BXLTS U456 ( .AN(d_ff_Xn[24]), .B(n404), .Y(first_mux_X[24]) );
  AOI222X1TS U457 ( .A0(n445), .A1(cordic_FSM_state_reg[1]), .B0(n445), .B1(
        n306), .C0(n440), .C1(n437), .Y(n276) );
  NAND2BXLTS U458 ( .AN(d_ff_Xn[29]), .B(n404), .Y(first_mux_X[29]) );
  NAND3XLTS U459 ( .A(n384), .B(n478), .C(n299), .Y(n297) );
  OAI32X1TS U460 ( .A0(n296), .A1(n306), .A2(n446), .B0(n295), .B1(n294), .Y(
        n186) );
  OAI31X1TS U461 ( .A0(cordic_FSM_state_reg[2]), .A1(n285), .A2(n437), .B0(
        n284), .Y(n196) );
  AOI211XLTS U462 ( .A0(cont_var_out[1]), .A1(n308), .B0(n269), .C0(n307), .Y(
        n194) );
  NOR2XLTS U463 ( .A(cont_var_out[1]), .B(n308), .Y(n307) );
  AO22XLTS U464 ( .A0(n383), .A1(d_ff_Yn[31]), .B0(n385), .B1(d_ff_Xn[31]), 
        .Y(mux_sal[31]) );
  AO22XLTS U465 ( .A0(n267), .A1(d_ff_Yn[30]), .B0(n385), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U466 ( .A0(n383), .A1(d_ff_Yn[29]), .B0(n452), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U467 ( .A0(n267), .A1(d_ff_Yn[28]), .B0(n452), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U468 ( .A0(n383), .A1(d_ff_Yn[27]), .B0(n452), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U469 ( .A0(n267), .A1(d_ff_Yn[26]), .B0(n386), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U470 ( .A0(n383), .A1(d_ff_Yn[25]), .B0(n452), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U471 ( .A0(n267), .A1(d_ff_Yn[24]), .B0(n385), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U472 ( .A0(n383), .A1(d_ff_Yn[23]), .B0(n386), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U473 ( .A0(n383), .A1(d_ff_Yn[22]), .B0(n385), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U474 ( .A0(n384), .A1(d_ff_Yn[21]), .B0(n385), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U475 ( .A0(n383), .A1(d_ff_Yn[20]), .B0(n385), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U476 ( .A0(n267), .A1(d_ff_Yn[19]), .B0(n385), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U477 ( .A0(n383), .A1(d_ff_Yn[18]), .B0(n385), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U478 ( .A0(n267), .A1(d_ff_Yn[17]), .B0(n385), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U479 ( .A0(n383), .A1(d_ff_Yn[16]), .B0(n385), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U480 ( .A0(n267), .A1(d_ff_Yn[15]), .B0(n385), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U481 ( .A0(n384), .A1(d_ff_Yn[14]), .B0(n385), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U482 ( .A0(n384), .A1(d_ff_Yn[13]), .B0(n385), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U483 ( .A0(n384), .A1(d_ff_Yn[12]), .B0(n385), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U484 ( .A0(n384), .A1(d_ff_Yn[11]), .B0(n452), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U485 ( .A0(n384), .A1(d_ff_Yn[10]), .B0(n386), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U486 ( .A0(n384), .A1(d_ff_Yn[9]), .B0(n452), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U487 ( .A0(n384), .A1(d_ff_Yn[8]), .B0(n386), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U488 ( .A0(n384), .A1(d_ff_Yn[7]), .B0(n386), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U489 ( .A0(n384), .A1(d_ff_Yn[6]), .B0(n452), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U490 ( .A0(n383), .A1(d_ff_Yn[4]), .B0(n386), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  AO22XLTS U491 ( .A0(n267), .A1(d_ff_Yn[2]), .B0(n386), .B1(d_ff_Xn[2]), .Y(
        mux_sal[2]) );
  AO22XLTS U492 ( .A0(n383), .A1(d_ff_Yn[1]), .B0(n386), .B1(d_ff_Xn[1]), .Y(
        mux_sal[1]) );
  AO22XLTS U493 ( .A0(n267), .A1(d_ff_Yn[0]), .B0(n386), .B1(d_ff_Xn[0]), .Y(
        mux_sal[0]) );
  AO22XLTS U494 ( .A0(n380), .A1(d_ff_Zn[30]), .B0(n379), .B1(d_ff1_Z[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U495 ( .A0(n382), .A1(d_ff_Zn[29]), .B0(n379), .B1(d_ff1_Z[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U496 ( .A0(n270), .A1(d_ff_Zn[28]), .B0(n379), .B1(d_ff1_Z[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U497 ( .A0(n270), .A1(d_ff_Zn[27]), .B0(n379), .B1(d_ff1_Z[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U498 ( .A0(n380), .A1(d_ff_Zn[26]), .B0(n379), .B1(d_ff1_Z[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U499 ( .A0(n382), .A1(d_ff_Zn[25]), .B0(n379), .B1(d_ff1_Z[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U500 ( .A0(n380), .A1(d_ff_Zn[24]), .B0(n379), .B1(d_ff1_Z[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U501 ( .A0(n270), .A1(d_ff_Zn[23]), .B0(n379), .B1(d_ff1_Z[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U502 ( .A0(n380), .A1(d_ff_Zn[22]), .B0(n379), .B1(d_ff1_Z[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U503 ( .A0(n382), .A1(d_ff_Zn[21]), .B0(n379), .B1(d_ff1_Z[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U504 ( .A0(n380), .A1(d_ff_Zn[20]), .B0(n379), .B1(d_ff1_Z[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U505 ( .A0(n382), .A1(d_ff_Zn[19]), .B0(n379), .B1(d_ff1_Z[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U506 ( .A0(n382), .A1(d_ff_Zn[18]), .B0(n379), .B1(d_ff1_Z[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U507 ( .A0(n382), .A1(d_ff_Zn[17]), .B0(n379), .B1(d_ff1_Z[17]), 
        .Y(first_mux_Z[17]) );
  NAND2BXLTS U508 ( .AN(d_ff_Xn[28]), .B(n404), .Y(first_mux_X[28]) );
  NAND2BXLTS U509 ( .AN(d_ff_Xn[27]), .B(n404), .Y(first_mux_X[27]) );
  NAND2BXLTS U510 ( .AN(d_ff_Xn[20]), .B(n404), .Y(first_mux_X[20]) );
  NAND2BXLTS U511 ( .AN(d_ff_Xn[19]), .B(n404), .Y(first_mux_X[19]) );
  NAND2BXLTS U512 ( .AN(d_ff_Xn[17]), .B(n404), .Y(first_mux_X[17]) );
  NAND2BXLTS U513 ( .AN(d_ff_Xn[16]), .B(n404), .Y(first_mux_X[16]) );
  NAND2BXLTS U514 ( .AN(d_ff_Xn[12]), .B(n404), .Y(first_mux_X[12]) );
  NAND2BXLTS U515 ( .AN(d_ff_Xn[6]), .B(n404), .Y(first_mux_X[6]) );
  XOR2XLTS U516 ( .A(d_ff2_Y[30]), .B(n430), .Y(sh_exp_y[7]) );
  OAI21XLTS U517 ( .A0(n432), .A1(n449), .B0(n431), .Y(sh_exp_y[5]) );
  XOR2XLTS U518 ( .A(d_ff2_X[30]), .B(n433), .Y(sh_exp_x[7]) );
  OAI21XLTS U519 ( .A0(n435), .A1(n450), .B0(n434), .Y(sh_exp_x[5]) );
  NOR2XLTS U520 ( .A(cont_iter_out[3]), .B(n372), .Y(data_out_LUT[26]) );
  NAND2BXLTS U521 ( .AN(data_out_LUT[12]), .B(n396), .Y(data_out_LUT[14]) );
  NAND2BXLTS U522 ( .AN(n398), .B(n397), .Y(data_out_LUT[1]) );
  OR4X2TS U523 ( .A(n263), .B(cordic_FSM_state_reg[1]), .C(n445), .D(n437), 
        .Y(n268) );
  OAI32X1TS U524 ( .A0(n437), .A1(n372), .A2(n438), .B0(n371), .B1(n437), .Y(
        n485) );
  NOR4X1TS U525 ( .A(cordic_FSM_state_reg[1]), .B(n445), .C(n439), .D(n437), 
        .Y(ready_cordic) );
  INVX2TS U526 ( .A(n268), .Y(n269) );
  AOI222X1TS U527 ( .A0(n402), .A1(cont_iter_out[1]), .B0(n402), .B1(n451), 
        .C0(cont_iter_out[3]), .C1(n436), .Y(data_out_LUT[4]) );
  OAI211XLTS U528 ( .A0(cont_iter_out[1]), .A1(data_out_LUT[22]), .B0(n403), 
        .C0(n392), .Y(data_out_LUT[24]) );
  AOI31X2TS U529 ( .A0(n393), .A1(n273), .A2(n436), .B0(n281), .Y(n403) );
  INVX2TS U530 ( .A(n378), .Y(n270) );
  INVX4TS U531 ( .A(n270), .Y(n271) );
  CLKBUFX2TS U532 ( .A(n448), .Y(n378) );
  INVX2TS U533 ( .A(n266), .Y(n272) );
  CLKINVX3TS U534 ( .A(n386), .Y(n384) );
  CLKINVX3TS U535 ( .A(n386), .Y(n383) );
  NOR4X2TS U536 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[2]), 
        .C(n439), .D(n437), .Y(ack_add_subt) );
  AND4X2TS U537 ( .A(n439), .B(n445), .C(n440), .D(n437), .Y(n293) );
  NAND3X2TS U538 ( .A(cordic_FSM_state_reg[2]), .B(n440), .C(n437), .Y(n481)
         );
  AOI222X4TS U539 ( .A0(n368), .A1(d_ff2_Z[30]), .B0(n367), .B1(d_ff2_Y[30]), 
        .C0(n366), .C1(d_ff2_X[30]), .Y(n362) );
  AOI222X4TS U540 ( .A0(n368), .A1(d_ff2_Z[24]), .B0(n367), .B1(d_ff2_Y[24]), 
        .C0(n366), .C1(d_ff2_X[24]), .Y(n363) );
  AOI222X4TS U541 ( .A0(n368), .A1(d_ff2_Z[25]), .B0(n367), .B1(d_ff2_Y[25]), 
        .C0(n366), .C1(d_ff2_X[25]), .Y(n364) );
  AOI222X4TS U542 ( .A0(n368), .A1(d_ff2_Z[26]), .B0(n367), .B1(d_ff2_Y[26]), 
        .C0(n366), .C1(d_ff2_X[26]), .Y(n365) );
  BUFX4TS U543 ( .A(n408), .Y(n340) );
  BUFX4TS U544 ( .A(n288), .Y(n408) );
  BUFX3TS U545 ( .A(n292), .Y(n277) );
  AOI222X4TS U546 ( .A0(n368), .A1(d_ff2_Z[29]), .B0(n367), .B1(d_ff2_Y[29]), 
        .C0(n366), .C1(d_ff2_X[29]), .Y(n369) );
  AOI32X4TS U547 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(n447), .A2(n272), 
        .B0(n387), .B1(d_ff1_shift_region_flag_out[0]), .Y(n388) );
  OAI32X1TS U548 ( .A0(n295), .A1(n292), .A2(n444), .B0(n300), .B1(n296), .Y(
        n187) );
  NOR4X2TS U549 ( .A(n263), .B(cordic_FSM_state_reg[0]), .C(n445), .D(n440), 
        .Y(n295) );
  BUFX4TS U550 ( .A(n316), .Y(n426) );
  BUFX4TS U551 ( .A(n381), .Y(n379) );
  NAND2X2TS U552 ( .A(n402), .B(cont_iter_out[3]), .Y(data_out_LUT[22]) );
  NOR4X2TS U553 ( .A(n402), .B(cont_iter_out[3]), .C(n451), .D(
        cont_iter_out[1]), .Y(n398) );
  INVX4TS U554 ( .A(n274), .Y(n402) );
  OAI21XLTS U555 ( .A0(n299), .A1(n298), .B0(n297), .Y(n189) );
  AOI211XLTS U556 ( .A0(n310), .A1(n443), .B0(n269), .C0(n302), .Y(n193) );
  INVX2TS U557 ( .A(n402), .Y(data_out_LUT[8]) );
  NAND2X1TS U558 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n282) );
  NOR3X1TS U559 ( .A(n263), .B(n445), .C(n282), .Y(beg_add_subt) );
  NAND2X2TS U560 ( .A(n451), .B(cont_iter_out[1]), .Y(n401) );
  NOR2X2TS U561 ( .A(data_out_LUT[22]), .B(n401), .Y(n306) );
  NAND4BX1TS U562 ( .AN(ack_cordic), .B(cordic_FSM_state_reg[2]), .C(n263), 
        .D(n440), .Y(n312) );
  INVX2TS U563 ( .A(beg_add_subt), .Y(n275) );
  OAI211XLTS U564 ( .A0(n276), .A1(n439), .B0(n312), .C0(n275), .Y(n195) );
  INVX4TS U565 ( .A(n277), .Y(n453) );
  INVX4TS U566 ( .A(n293), .Y(n466) );
  INVX4TS U567 ( .A(n277), .Y(n461) );
  INVX4TS U568 ( .A(n292), .Y(n467) );
  INVX4TS U569 ( .A(n277), .Y(n460) );
  INVX4TS U570 ( .A(n277), .Y(n471) );
  INVX4TS U571 ( .A(n277), .Y(n468) );
  INVX4TS U572 ( .A(n293), .Y(n459) );
  INVX4TS U573 ( .A(n277), .Y(n474) );
  INVX4TS U574 ( .A(n277), .Y(n473) );
  INVX4TS U575 ( .A(n277), .Y(n470) );
  INVX4TS U576 ( .A(n277), .Y(n469) );
  INVX4TS U577 ( .A(n292), .Y(n475) );
  INVX4TS U578 ( .A(n292), .Y(n454) );
  INVX4TS U579 ( .A(n292), .Y(n458) );
  INVX4TS U580 ( .A(n292), .Y(n465) );
  INVX4TS U581 ( .A(n292), .Y(n476) );
  INVX4TS U582 ( .A(n292), .Y(n455) );
  NOR3XLTS U583 ( .A(cordic_FSM_state_reg[2]), .B(n439), .C(n282), .Y(
        enab_dff_5) );
  NOR2XLTS U584 ( .A(n439), .B(n481), .Y(enab_d_ff5_data_out) );
  INVX2TS U585 ( .A(n401), .Y(n280) );
  AOI221XLTS U586 ( .A0(n402), .A1(n280), .B0(data_out_LUT[8]), .B1(n401), 
        .C0(n437), .Y(n482) );
  NOR3X1TS U587 ( .A(n263), .B(cordic_FSM_state_reg[2]), .C(n282), .Y(n279) );
  BUFX3TS U588 ( .A(n271), .Y(n381) );
  INVX2TS U589 ( .A(n279), .Y(n278) );
  OAI32X1TS U590 ( .A0(n279), .A1(n293), .A2(n381), .B0(n398), .B1(n278), .Y(
        n188) );
  NOR2X2TS U591 ( .A(n402), .B(n438), .Y(n393) );
  NOR2X2TS U592 ( .A(cont_iter_out[3]), .B(data_out_LUT[8]), .Y(n400) );
  NOR2X2TS U593 ( .A(n393), .B(n400), .Y(n397) );
  OAI21X1TS U594 ( .A0(n402), .A1(n436), .B0(n397), .Y(data_out_LUT[20]) );
  OR2X1TS U595 ( .A(data_out_LUT[20]), .B(n398), .Y(data_out_LUT[11]) );
  NAND2X1TS U596 ( .A(n280), .B(n400), .Y(n371) );
  INVX2TS U597 ( .A(n371), .Y(n281) );
  AOI33X1TS U598 ( .A0(n451), .A1(cont_iter_out[1]), .A2(data_out_LUT[8]), 
        .B0(n436), .B1(n438), .B2(n273), .Y(n392) );
  INVX4TS U599 ( .A(n292), .Y(n477) );
  INVX4TS U600 ( .A(n292), .Y(n478) );
  INVX2TS U601 ( .A(n306), .Y(n301) );
  NAND2X1TS U602 ( .A(cont_var_out[1]), .B(n443), .Y(n309) );
  AOI31XLTS U603 ( .A0(n263), .A1(n301), .A2(n309), .B0(
        cordic_FSM_state_reg[1]), .Y(n285) );
  OAI2BB2XLTS U604 ( .B0(cordic_FSM_state_reg[1]), .B1(ack_cordic), .A0N(n439), 
        .A1N(n282), .Y(n283) );
  INVX2TS U605 ( .A(n481), .Y(n314) );
  AOI21X1TS U606 ( .A0(cordic_FSM_state_reg[2]), .A1(n283), .B0(n314), .Y(n284) );
  NOR2X1TS U607 ( .A(d_ff1_shift_region_flag_out[1]), .B(n272), .Y(n387) );
  AOI21X1TS U608 ( .A0(n272), .A1(d_ff1_shift_region_flag_out[1]), .B0(n387), 
        .Y(n286) );
  XNOR2X1TS U609 ( .A(d_ff1_shift_region_flag_out[0]), .B(n286), .Y(n298) );
  NOR2X1TS U610 ( .A(n301), .B(n298), .Y(n304) );
  AOI21X1TS U611 ( .A0(cont_var_out[0]), .A1(n301), .B0(n304), .Y(n300) );
  INVX2TS U612 ( .A(n295), .Y(n296) );
  NOR2BX1TS U613 ( .AN(sel_mux_2_reg[1]), .B(sel_mux_2_reg[0]), .Y(n287) );
  BUFX3TS U614 ( .A(n287), .Y(n429) );
  BUFX3TS U615 ( .A(n429), .Y(n425) );
  NOR2X1TS U616 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n316) );
  BUFX3TS U617 ( .A(n339), .Y(n421) );
  AOI22X1TS U618 ( .A0(n422), .A1(d_ff3_sh_x_out[18]), .B0(n421), .B1(
        d_ff3_sh_y_out[18]), .Y(n289) );
  OAI2BB1X1TS U619 ( .A0N(n425), .A1N(d_ff3_LUT_out[18]), .B0(n289), .Y(
        add_subt_dataB[18]) );
  AOI22X1TS U620 ( .A0(n422), .A1(d_ff3_sh_x_out[16]), .B0(n421), .B1(
        d_ff3_sh_y_out[16]), .Y(n290) );
  OAI2BB1X1TS U621 ( .A0N(n425), .A1N(d_ff3_LUT_out[16]), .B0(n290), .Y(
        add_subt_dataB[16]) );
  AOI22X1TS U622 ( .A0(n422), .A1(d_ff3_sh_x_out[14]), .B0(n421), .B1(
        d_ff3_sh_y_out[14]), .Y(n291) );
  OAI2BB1X1TS U623 ( .A0N(n425), .A1N(d_ff3_LUT_out[14]), .B0(n291), .Y(
        add_subt_dataB[14]) );
  INVX4TS U624 ( .A(n292), .Y(n464) );
  INVX2TS U625 ( .A(rst), .Y(n180) );
  INVX4TS U626 ( .A(n292), .Y(n472) );
  INVX4TS U627 ( .A(n293), .Y(n463) );
  INVX4TS U628 ( .A(n292), .Y(n457) );
  INVX4TS U629 ( .A(n293), .Y(n456) );
  INVX4TS U630 ( .A(n293), .Y(n462) );
  NAND2X1TS U631 ( .A(n442), .B(n451), .Y(intadd_413_CI) );
  OAI21XLTS U632 ( .A0(n451), .A1(n442), .B0(intadd_413_CI), .Y(sh_exp_x[0])
         );
  NAND2X1TS U633 ( .A(n441), .B(n451), .Y(intadd_414_CI) );
  OAI21XLTS U634 ( .A0(n451), .A1(n441), .B0(intadd_414_CI), .Y(sh_exp_y[0])
         );
  NOR2X1TS U635 ( .A(data_out_LUT[8]), .B(n401), .Y(n372) );
  NOR2X1TS U636 ( .A(d_ff2_Y[27]), .B(intadd_414_n1), .Y(n432) );
  OR3X1TS U637 ( .A(d_ff2_Y[28]), .B(d_ff2_Y[27]), .C(intadd_414_n1), .Y(n431)
         );
  NOR2X1TS U638 ( .A(d_ff2_X[27]), .B(intadd_413_n1), .Y(n435) );
  OR3X1TS U639 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(intadd_413_n1), .Y(n434)
         );
  OAI21X1TS U640 ( .A0(n402), .A1(cont_iter_out[1]), .B0(n397), .Y(
        data_out_LUT[16]) );
  OAI21X1TS U641 ( .A0(n402), .A1(n273), .B0(n397), .Y(data_out_LUT[18]) );
  NAND4XLTS U642 ( .A(n263), .B(cordic_FSM_state_reg[1]), .C(n445), .D(n437), 
        .Y(n299) );
  BUFX3TS U643 ( .A(n452), .Y(n386) );
  NAND2X1TS U644 ( .A(ready_add_subt), .B(n440), .Y(n311) );
  NAND4BX1TS U645 ( .AN(n311), .B(n263), .C(n437), .D(n445), .Y(n305) );
  CLKAND2X2TS U646 ( .A(n264), .B(n439), .Y(load_cont_iter) );
  NAND2X1TS U647 ( .A(ack_add_subt), .B(n301), .Y(n310) );
  AOI21X1TS U648 ( .A0(n309), .A1(n443), .B0(n310), .Y(n302) );
  AOI21X1TS U649 ( .A0(n446), .A1(n443), .B0(n306), .Y(n303) );
  NOR2X1TS U650 ( .A(n443), .B(n310), .Y(n308) );
  NAND2X1TS U651 ( .A(n439), .B(n440), .Y(n375) );
  NOR2X1TS U652 ( .A(n310), .B(n309), .Y(n370) );
  AOI32X1TS U653 ( .A0(n263), .A1(n312), .A2(n311), .B0(
        cordic_FSM_state_reg[0]), .B1(n312), .Y(n313) );
  NOR4X1TS U654 ( .A(n370), .B(n314), .C(n264), .D(n313), .Y(n315) );
  OAI31X1TS U655 ( .A0(cordic_FSM_state_reg[2]), .A1(beg_fsm_cordic), .A2(n375), .B0(n315), .Y(n197) );
  BUFX3TS U656 ( .A(n288), .Y(n367) );
  AOI222X1TS U657 ( .A0(n429), .A1(d_ff3_LUT_out[4]), .B0(n367), .B1(
        d_ff3_sh_x_out[4]), .C0(n366), .C1(d_ff3_sh_y_out[4]), .Y(n317) );
  INVX2TS U658 ( .A(n317), .Y(add_subt_dataB[4]) );
  BUFX3TS U659 ( .A(n426), .Y(n407) );
  AOI222X1TS U660 ( .A0(n429), .A1(d_ff3_LUT_out[8]), .B0(n408), .B1(
        d_ff3_sh_x_out[8]), .C0(n407), .C1(d_ff3_sh_y_out[8]), .Y(n318) );
  INVX2TS U661 ( .A(n318), .Y(add_subt_dataB[8]) );
  AOI222X1TS U662 ( .A0(n425), .A1(d_ff3_LUT_out[24]), .B0(n408), .B1(
        d_ff3_sh_x_out[24]), .C0(n407), .C1(d_ff3_sh_y_out[24]), .Y(n319) );
  INVX2TS U663 ( .A(n319), .Y(add_subt_dataB[24]) );
  AOI222X1TS U664 ( .A0(n429), .A1(d_ff3_LUT_out[6]), .B0(n408), .B1(
        d_ff3_sh_x_out[6]), .C0(n407), .C1(d_ff3_sh_y_out[6]), .Y(n320) );
  INVX2TS U665 ( .A(n320), .Y(add_subt_dataB[6]) );
  AOI222X1TS U666 ( .A0(n429), .A1(d_ff3_LUT_out[9]), .B0(n408), .B1(
        d_ff3_sh_x_out[9]), .C0(n407), .C1(d_ff3_sh_y_out[9]), .Y(n321) );
  INVX2TS U667 ( .A(n321), .Y(add_subt_dataB[9]) );
  AOI222X1TS U668 ( .A0(n429), .A1(d_ff3_LUT_out[21]), .B0(n408), .B1(
        d_ff3_sh_x_out[21]), .C0(n407), .C1(d_ff3_sh_y_out[21]), .Y(n322) );
  INVX2TS U669 ( .A(n322), .Y(add_subt_dataB[21]) );
  AOI222X1TS U670 ( .A0(n425), .A1(d_ff3_LUT_out[12]), .B0(n408), .B1(
        d_ff3_sh_x_out[12]), .C0(n407), .C1(d_ff3_sh_y_out[12]), .Y(n323) );
  INVX2TS U671 ( .A(n323), .Y(add_subt_dataB[12]) );
  AOI222X1TS U672 ( .A0(n425), .A1(d_ff3_LUT_out[23]), .B0(n408), .B1(
        d_ff3_sh_x_out[23]), .C0(n407), .C1(d_ff3_sh_y_out[23]), .Y(n324) );
  INVX2TS U673 ( .A(n324), .Y(add_subt_dataB[23]) );
  AOI222X1TS U674 ( .A0(n425), .A1(d_ff3_LUT_out[26]), .B0(n408), .B1(
        d_ff3_sh_x_out[26]), .C0(n407), .C1(d_ff3_sh_y_out[26]), .Y(n325) );
  INVX2TS U675 ( .A(n325), .Y(add_subt_dataB[26]) );
  AOI222X1TS U676 ( .A0(n425), .A1(d_ff3_LUT_out[25]), .B0(n408), .B1(
        d_ff3_sh_x_out[25]), .C0(n407), .C1(d_ff3_sh_y_out[25]), .Y(n326) );
  INVX2TS U677 ( .A(n326), .Y(add_subt_dataB[25]) );
  BUFX3TS U678 ( .A(n429), .Y(n353) );
  AOI222X1TS U679 ( .A0(n353), .A1(d_ff2_Z[20]), .B0(n340), .B1(d_ff2_Y[20]), 
        .C0(n339), .C1(d_ff2_X[20]), .Y(n327) );
  INVX2TS U680 ( .A(n327), .Y(add_subt_dataA[20]) );
  AOI222X1TS U681 ( .A0(n353), .A1(d_ff2_Z[22]), .B0(n340), .B1(d_ff2_Y[22]), 
        .C0(n339), .C1(d_ff2_X[22]), .Y(n328) );
  INVX2TS U682 ( .A(n328), .Y(add_subt_dataA[22]) );
  AOI222X1TS U683 ( .A0(n353), .A1(d_ff2_Z[23]), .B0(n340), .B1(d_ff2_Y[23]), 
        .C0(n339), .C1(d_ff2_X[23]), .Y(n329) );
  INVX2TS U684 ( .A(n329), .Y(add_subt_dataA[23]) );
  AOI222X1TS U685 ( .A0(n353), .A1(d_ff2_Z[13]), .B0(n340), .B1(d_ff2_Y[13]), 
        .C0(n339), .C1(d_ff2_X[13]), .Y(n330) );
  INVX2TS U686 ( .A(n330), .Y(add_subt_dataA[13]) );
  AOI222X1TS U687 ( .A0(n353), .A1(d_ff2_Z[21]), .B0(n340), .B1(d_ff2_Y[21]), 
        .C0(n339), .C1(d_ff2_X[21]), .Y(n331) );
  INVX2TS U688 ( .A(n331), .Y(add_subt_dataA[21]) );
  AOI222X1TS U689 ( .A0(n353), .A1(d_ff2_Z[19]), .B0(n340), .B1(d_ff2_Y[19]), 
        .C0(n339), .C1(d_ff2_X[19]), .Y(n332) );
  INVX2TS U690 ( .A(n332), .Y(add_subt_dataA[19]) );
  AOI222X1TS U691 ( .A0(n353), .A1(d_ff2_Z[14]), .B0(n340), .B1(d_ff2_Y[14]), 
        .C0(n339), .C1(d_ff2_X[14]), .Y(n333) );
  INVX2TS U692 ( .A(n333), .Y(add_subt_dataA[14]) );
  AOI222X1TS U693 ( .A0(n353), .A1(d_ff2_Z[18]), .B0(n340), .B1(d_ff2_Y[18]), 
        .C0(n339), .C1(d_ff2_X[18]), .Y(n334) );
  INVX2TS U694 ( .A(n334), .Y(add_subt_dataA[18]) );
  AOI222X1TS U695 ( .A0(n353), .A1(d_ff2_Z[16]), .B0(n340), .B1(d_ff2_Y[16]), 
        .C0(n339), .C1(d_ff2_X[16]), .Y(n335) );
  INVX2TS U696 ( .A(n335), .Y(add_subt_dataA[16]) );
  AOI222X1TS U697 ( .A0(n353), .A1(d_ff2_Z[15]), .B0(n340), .B1(d_ff2_Y[15]), 
        .C0(n339), .C1(d_ff2_X[15]), .Y(n336) );
  INVX2TS U698 ( .A(n336), .Y(add_subt_dataA[15]) );
  AOI222X1TS U699 ( .A0(n353), .A1(d_ff2_Z[17]), .B0(n340), .B1(d_ff2_Y[17]), 
        .C0(n339), .C1(d_ff2_X[17]), .Y(n337) );
  INVX2TS U700 ( .A(n337), .Y(add_subt_dataA[17]) );
  BUFX3TS U701 ( .A(n425), .Y(n351) );
  AOI222X1TS U702 ( .A0(n351), .A1(d_ff2_Z[12]), .B0(n340), .B1(d_ff2_Y[12]), 
        .C0(n339), .C1(d_ff2_X[12]), .Y(n338) );
  INVX2TS U703 ( .A(n338), .Y(add_subt_dataA[12]) );
  AOI222X1TS U704 ( .A0(n351), .A1(d_ff2_Z[11]), .B0(n340), .B1(d_ff2_Y[11]), 
        .C0(n339), .C1(d_ff2_X[11]), .Y(n341) );
  INVX2TS U705 ( .A(n341), .Y(add_subt_dataA[11]) );
  BUFX3TS U706 ( .A(n288), .Y(n427) );
  INVX2TS U707 ( .A(n342), .Y(add_subt_dataA[10]) );
  INVX2TS U708 ( .A(n343), .Y(add_subt_dataA[8]) );
  INVX2TS U709 ( .A(n344), .Y(add_subt_dataA[9]) );
  INVX2TS U710 ( .A(n345), .Y(add_subt_dataA[7]) );
  AOI222X1TS U711 ( .A0(n351), .A1(d_ff2_Z[1]), .B0(n427), .B1(d_ff2_Y[1]), 
        .C0(n426), .C1(d_ff2_X[1]), .Y(n346) );
  INVX2TS U712 ( .A(n346), .Y(add_subt_dataA[1]) );
  AOI222X1TS U713 ( .A0(n351), .A1(d_ff2_Z[6]), .B0(n427), .B1(d_ff2_Y[6]), 
        .C0(n426), .C1(d_ff2_X[6]), .Y(n347) );
  INVX2TS U714 ( .A(n347), .Y(add_subt_dataA[6]) );
  AOI222X1TS U715 ( .A0(n351), .A1(d_ff2_Z[3]), .B0(n427), .B1(d_ff2_Y[3]), 
        .C0(n426), .C1(d_ff2_X[3]), .Y(n348) );
  INVX2TS U716 ( .A(n348), .Y(add_subt_dataA[3]) );
  AOI222X1TS U717 ( .A0(n351), .A1(d_ff2_Z[4]), .B0(n427), .B1(d_ff2_Y[4]), 
        .C0(n426), .C1(d_ff2_X[4]), .Y(n349) );
  INVX2TS U718 ( .A(n349), .Y(add_subt_dataA[4]) );
  AOI222X1TS U719 ( .A0(n351), .A1(d_ff2_Z[2]), .B0(n427), .B1(d_ff2_Y[2]), 
        .C0(n426), .C1(d_ff2_X[2]), .Y(n350) );
  INVX2TS U720 ( .A(n350), .Y(add_subt_dataA[2]) );
  AOI222X1TS U721 ( .A0(n351), .A1(d_ff2_Z[5]), .B0(n427), .B1(d_ff2_Y[5]), 
        .C0(n426), .C1(d_ff2_X[5]), .Y(n352) );
  INVX2TS U722 ( .A(n352), .Y(add_subt_dataA[5]) );
  BUFX3TS U723 ( .A(n353), .Y(n368) );
  AOI222X1TS U724 ( .A0(n368), .A1(d_ff3_LUT_out[2]), .B0(n367), .B1(
        d_ff3_sh_x_out[2]), .C0(n366), .C1(d_ff3_sh_y_out[2]), .Y(n354) );
  INVX2TS U725 ( .A(n354), .Y(add_subt_dataB[2]) );
  AOI222X1TS U726 ( .A0(n368), .A1(d_ff3_LUT_out[10]), .B0(n408), .B1(
        d_ff3_sh_x_out[10]), .C0(n407), .C1(d_ff3_sh_y_out[10]), .Y(n355) );
  INVX2TS U727 ( .A(n355), .Y(add_subt_dataB[10]) );
  AOI222X1TS U728 ( .A0(n368), .A1(d_ff3_LUT_out[0]), .B0(n367), .B1(
        d_ff3_sh_x_out[0]), .C0(n366), .C1(d_ff3_sh_y_out[0]), .Y(n356) );
  INVX2TS U729 ( .A(n356), .Y(add_subt_dataB[0]) );
  AOI222X1TS U730 ( .A0(n368), .A1(d_ff3_LUT_out[1]), .B0(n367), .B1(
        d_ff3_sh_x_out[1]), .C0(n366), .C1(d_ff3_sh_y_out[1]), .Y(n357) );
  INVX2TS U731 ( .A(n357), .Y(add_subt_dataB[1]) );
  AOI222X1TS U732 ( .A0(n368), .A1(d_ff2_Z[27]), .B0(n367), .B1(d_ff2_Y[27]), 
        .C0(n366), .C1(d_ff2_X[27]), .Y(n358) );
  INVX2TS U733 ( .A(n358), .Y(add_subt_dataA[27]) );
  AOI222X1TS U734 ( .A0(n368), .A1(d_ff2_Z[0]), .B0(n367), .B1(d_ff2_Y[0]), 
        .C0(n366), .C1(d_ff2_X[0]), .Y(n359) );
  INVX2TS U735 ( .A(n359), .Y(add_subt_dataA[0]) );
  AOI222X1TS U736 ( .A0(n368), .A1(d_ff2_Z[28]), .B0(n367), .B1(d_ff2_Y[28]), 
        .C0(n366), .C1(d_ff2_X[28]), .Y(n360) );
  INVX2TS U737 ( .A(n360), .Y(add_subt_dataA[28]) );
  AOI222X1TS U738 ( .A0(n368), .A1(d_ff2_Z[31]), .B0(n367), .B1(d_ff2_Y[31]), 
        .C0(n366), .C1(d_ff2_X[31]), .Y(n361) );
  INVX2TS U739 ( .A(n361), .Y(add_subt_dataA[31]) );
  INVX2TS U740 ( .A(n362), .Y(add_subt_dataA[30]) );
  INVX2TS U741 ( .A(n363), .Y(add_subt_dataA[24]) );
  INVX2TS U742 ( .A(n364), .Y(add_subt_dataA[25]) );
  INVX2TS U743 ( .A(n365), .Y(add_subt_dataA[26]) );
  INVX2TS U744 ( .A(n369), .Y(add_subt_dataA[29]) );
  NOR2XLTS U745 ( .A(n451), .B(n437), .Y(n484) );
  NOR2X2TS U747 ( .A(n451), .B(n436), .Y(n399) );
  INVX2TS U748 ( .A(n399), .Y(n395) );
  OAI21X1TS U749 ( .A0(cont_iter_out[1]), .A1(n273), .B0(n395), .Y(n390) );
  CLKAND2X2TS U750 ( .A(n390), .B(cordic_FSM_state_reg[0]), .Y(n483) );
  INVX2TS U751 ( .A(beg_fsm_cordic), .Y(n374) );
  NAND2X1TS U752 ( .A(cordic_FSM_state_reg[1]), .B(n439), .Y(n373) );
  OAI32X1TS U753 ( .A0(n437), .A1(n375), .A2(n374), .B0(
        cordic_FSM_state_reg[0]), .B1(n373), .Y(n376) );
  OR4X2TS U754 ( .A(n269), .B(ack_add_subt), .C(n264), .D(n376), .Y(
        cordic_FSM_state_next_1_) );
  INVX4TS U755 ( .A(n381), .Y(n405) );
  CLKAND2X2TS U756 ( .A(d_ff_Yn[0]), .B(n405), .Y(first_mux_Y[0]) );
  CLKAND2X2TS U757 ( .A(d_ff_Yn[1]), .B(n270), .Y(first_mux_Y[1]) );
  INVX4TS U758 ( .A(n381), .Y(n377) );
  CLKAND2X2TS U759 ( .A(d_ff_Yn[2]), .B(n377), .Y(first_mux_Y[2]) );
  CLKAND2X2TS U760 ( .A(d_ff_Yn[3]), .B(n377), .Y(first_mux_Y[3]) );
  CLKAND2X2TS U761 ( .A(d_ff_Yn[4]), .B(n377), .Y(first_mux_Y[4]) );
  INVX4TS U762 ( .A(n271), .Y(n406) );
  CLKAND2X2TS U763 ( .A(d_ff_Yn[5]), .B(n406), .Y(first_mux_Y[5]) );
  CLKAND2X2TS U764 ( .A(d_ff_Yn[6]), .B(n404), .Y(first_mux_Y[6]) );
  CLKAND2X2TS U765 ( .A(d_ff_Yn[7]), .B(n377), .Y(first_mux_Y[7]) );
  CLKAND2X2TS U766 ( .A(d_ff_Yn[8]), .B(n377), .Y(first_mux_Y[8]) );
  CLKAND2X2TS U767 ( .A(d_ff_Yn[9]), .B(n405), .Y(first_mux_Y[9]) );
  CLKAND2X2TS U768 ( .A(d_ff_Yn[10]), .B(n377), .Y(first_mux_Y[10]) );
  CLKAND2X2TS U769 ( .A(d_ff_Yn[11]), .B(n405), .Y(first_mux_Y[11]) );
  CLKAND2X2TS U770 ( .A(d_ff_Yn[12]), .B(n377), .Y(first_mux_Y[12]) );
  CLKAND2X2TS U771 ( .A(d_ff_Yn[13]), .B(n405), .Y(first_mux_Y[13]) );
  CLKAND2X2TS U772 ( .A(d_ff_Yn[14]), .B(n377), .Y(first_mux_Y[14]) );
  CLKAND2X2TS U773 ( .A(d_ff_Yn[15]), .B(n377), .Y(first_mux_Y[15]) );
  CLKAND2X2TS U774 ( .A(d_ff_Yn[16]), .B(n270), .Y(first_mux_Y[16]) );
  INVX4TS U775 ( .A(n381), .Y(n380) );
  CLKAND2X2TS U776 ( .A(d_ff_Yn[17]), .B(n380), .Y(first_mux_Y[17]) );
  CLKAND2X2TS U777 ( .A(d_ff_Yn[18]), .B(n377), .Y(first_mux_Y[18]) );
  INVX4TS U778 ( .A(n381), .Y(n382) );
  CLKAND2X2TS U779 ( .A(d_ff_Yn[19]), .B(n382), .Y(first_mux_Y[19]) );
  CLKAND2X2TS U780 ( .A(d_ff_Yn[20]), .B(n377), .Y(first_mux_Y[20]) );
  CLKAND2X2TS U781 ( .A(d_ff_Yn[21]), .B(n380), .Y(first_mux_Y[21]) );
  CLKAND2X2TS U782 ( .A(d_ff_Yn[22]), .B(n377), .Y(first_mux_Y[22]) );
  CLKAND2X2TS U783 ( .A(d_ff_Yn[23]), .B(n382), .Y(first_mux_Y[23]) );
  CLKAND2X2TS U784 ( .A(d_ff_Yn[24]), .B(n377), .Y(first_mux_Y[24]) );
  CLKAND2X2TS U785 ( .A(d_ff_Yn[25]), .B(n405), .Y(first_mux_Y[25]) );
  CLKAND2X2TS U786 ( .A(d_ff_Yn[26]), .B(n405), .Y(first_mux_Y[26]) );
  CLKAND2X2TS U787 ( .A(d_ff_Yn[27]), .B(n406), .Y(first_mux_Y[27]) );
  CLKAND2X2TS U788 ( .A(d_ff_Yn[28]), .B(n377), .Y(first_mux_Y[28]) );
  CLKAND2X2TS U789 ( .A(d_ff_Yn[29]), .B(n405), .Y(first_mux_Y[29]) );
  CLKAND2X2TS U790 ( .A(d_ff_Yn[30]), .B(n377), .Y(first_mux_Y[30]) );
  CLKAND2X2TS U791 ( .A(d_ff_Yn[31]), .B(n405), .Y(first_mux_Y[31]) );
  AO22XLTS U792 ( .A0(n380), .A1(d_ff_Zn[0]), .B0(n381), .B1(d_ff1_Z[0]), .Y(
        first_mux_Z[0]) );
  AO22XLTS U793 ( .A0(n382), .A1(d_ff_Zn[1]), .B0(n381), .B1(d_ff1_Z[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U794 ( .A0(n380), .A1(d_ff_Zn[2]), .B0(n381), .B1(d_ff1_Z[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U795 ( .A0(n382), .A1(d_ff_Zn[3]), .B0(n448), .B1(d_ff1_Z[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U796 ( .A0(n380), .A1(d_ff_Zn[4]), .B0(n271), .B1(d_ff1_Z[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U797 ( .A0(n382), .A1(d_ff_Zn[5]), .B0(n271), .B1(d_ff1_Z[5]), .Y(
        first_mux_Z[5]) );
  AO22XLTS U798 ( .A0(n380), .A1(d_ff_Zn[6]), .B0(n271), .B1(d_ff1_Z[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U799 ( .A0(n265), .A1(d_ff_Zn[7]), .B0(n271), .B1(d_ff1_Z[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U800 ( .A0(n382), .A1(d_ff_Zn[8]), .B0(n271), .B1(d_ff1_Z[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U801 ( .A0(n382), .A1(d_ff_Zn[9]), .B0(n271), .B1(d_ff1_Z[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U802 ( .A0(n380), .A1(d_ff_Zn[10]), .B0(n271), .B1(d_ff1_Z[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U803 ( .A0(n382), .A1(d_ff_Zn[11]), .B0(n271), .B1(d_ff1_Z[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U804 ( .A0(n380), .A1(d_ff_Zn[12]), .B0(n271), .B1(d_ff1_Z[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U805 ( .A0(n265), .A1(d_ff_Zn[13]), .B0(n271), .B1(d_ff1_Z[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U806 ( .A0(n380), .A1(d_ff_Zn[14]), .B0(n271), .B1(d_ff1_Z[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U807 ( .A0(n270), .A1(d_ff_Zn[15]), .B0(n271), .B1(d_ff1_Z[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U808 ( .A0(n380), .A1(d_ff_Zn[16]), .B0(n271), .B1(d_ff1_Z[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U809 ( .A0(n382), .A1(d_ff_Zn[31]), .B0(n381), .B1(d_ff1_Z[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U810 ( .A0(n383), .A1(d_ff_Yn[3]), .B0(n452), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U811 ( .A0(n267), .A1(d_ff_Yn[5]), .B0(n452), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  BUFX3TS U812 ( .A(n386), .Y(n385) );
  XNOR2X1TS U813 ( .A(data_output2_31_), .B(n388), .Y(sign_inv_out[31]) );
  AOI21X1TS U814 ( .A0(n273), .A1(n436), .B0(cont_iter_out[3]), .Y(n389) );
  OAI32X1TS U815 ( .A0(n436), .A1(cont_iter_out[3]), .A2(n273), .B0(n389), 
        .B1(n402), .Y(data_out_LUT[10]) );
  AO21XLTS U816 ( .A0(n400), .A1(n399), .B0(data_out_LUT[10]), .Y(
        data_out_LUT[0]) );
  NAND2X1TS U817 ( .A(n393), .B(n390), .Y(n391) );
  NAND2X1TS U818 ( .A(n392), .B(n391), .Y(data_out_LUT[6]) );
  AO21XLTS U819 ( .A0(n399), .A1(data_out_LUT[8]), .B0(data_out_LUT[16]), .Y(
        data_out_LUT[9]) );
  AOI21X1TS U820 ( .A0(cont_iter_out[1]), .A1(n400), .B0(n393), .Y(n394) );
  OAI21X1TS U821 ( .A0(cont_iter_out[3]), .A1(n395), .B0(n394), .Y(
        data_out_LUT[12]) );
  NAND3XLTS U822 ( .A(n451), .B(n438), .C(n436), .Y(n396) );
  AO21XLTS U823 ( .A0(n399), .A1(data_out_LUT[8]), .B0(data_out_LUT[18]), .Y(
        data_out_LUT[21]) );
  OAI2BB2XLTS U824 ( .B0(n402), .B1(n401), .A0N(n436), .A1N(n400), .Y(
        data_out_LUT[2]) );
  AOI2BB2XLTS U825 ( .B0(n273), .B1(data_out_LUT[22]), .A0N(data_out_LUT[22]), 
        .A1N(n273), .Y(data_out_LUT[23]) );
  AOI32X1TS U826 ( .A0(n451), .A1(n403), .A2(cont_iter_out[1]), .B0(n402), 
        .B1(n403), .Y(data_out_LUT[25]) );
  CLKAND2X2TS U827 ( .A(d_ff_Xn[0]), .B(n405), .Y(first_mux_X[0]) );
  NAND2BXLTS U828 ( .AN(d_ff_Xn[1]), .B(n406), .Y(first_mux_X[1]) );
  NAND2BXLTS U829 ( .AN(d_ff_Xn[2]), .B(n406), .Y(first_mux_X[2]) );
  NAND2BXLTS U830 ( .AN(d_ff_Xn[3]), .B(n406), .Y(first_mux_X[3]) );
  CLKAND2X2TS U831 ( .A(d_ff_Xn[4]), .B(n405), .Y(first_mux_X[4]) );
  NAND2BXLTS U832 ( .AN(d_ff_Xn[5]), .B(n406), .Y(first_mux_X[5]) );
  NAND2BXLTS U833 ( .AN(d_ff_Xn[7]), .B(n406), .Y(first_mux_X[7]) );
  CLKAND2X2TS U834 ( .A(d_ff_Xn[8]), .B(n405), .Y(first_mux_X[8]) );
  CLKAND2X2TS U835 ( .A(d_ff_Xn[9]), .B(n405), .Y(first_mux_X[9]) );
  NAND2BXLTS U836 ( .AN(d_ff_Xn[10]), .B(n406), .Y(first_mux_X[10]) );
  CLKAND2X2TS U837 ( .A(d_ff_Xn[11]), .B(n406), .Y(first_mux_X[11]) );
  NAND2BXLTS U838 ( .AN(d_ff_Xn[13]), .B(n406), .Y(first_mux_X[13]) );
  NAND2BXLTS U839 ( .AN(d_ff_Xn[14]), .B(n406), .Y(first_mux_X[14]) );
  CLKAND2X2TS U840 ( .A(d_ff_Xn[15]), .B(n406), .Y(first_mux_X[15]) );
  CLKAND2X2TS U841 ( .A(d_ff_Xn[18]), .B(n405), .Y(first_mux_X[18]) );
  CLKAND2X2TS U842 ( .A(d_ff_Xn[21]), .B(n406), .Y(first_mux_X[21]) );
  CLKAND2X2TS U843 ( .A(d_ff_Xn[22]), .B(n405), .Y(first_mux_X[22]) );
  CLKAND2X2TS U844 ( .A(d_ff_Xn[23]), .B(n406), .Y(first_mux_X[23]) );
  CLKAND2X2TS U845 ( .A(d_ff_Xn[30]), .B(n405), .Y(first_mux_X[30]) );
  CLKAND2X2TS U846 ( .A(d_ff_Xn[31]), .B(n406), .Y(first_mux_X[31]) );
  AO22XLTS U847 ( .A0(n408), .A1(d_ff3_sh_x_out[31]), .B0(n407), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U848 ( .A0(n408), .A1(d_ff3_sh_x_out[30]), .B0(n407), .B1(
        d_ff3_sh_y_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U849 ( .A0(n422), .A1(d_ff3_sh_x_out[29]), .B0(n421), .B1(
        d_ff3_sh_y_out[29]), .Y(n409) );
  NAND2X1TS U850 ( .A(n429), .B(d_ff3_LUT_out[27]), .Y(n411) );
  NAND2X1TS U851 ( .A(n409), .B(n411), .Y(add_subt_dataB[29]) );
  AOI22X1TS U852 ( .A0(n422), .A1(d_ff3_sh_x_out[28]), .B0(n421), .B1(
        d_ff3_sh_y_out[28]), .Y(n410) );
  NAND2X1TS U853 ( .A(n410), .B(n411), .Y(add_subt_dataB[28]) );
  AOI22X1TS U854 ( .A0(n422), .A1(d_ff3_sh_x_out[27]), .B0(n421), .B1(
        d_ff3_sh_y_out[27]), .Y(n412) );
  NAND2X1TS U855 ( .A(n412), .B(n411), .Y(add_subt_dataB[27]) );
  AOI22X1TS U856 ( .A0(n422), .A1(d_ff3_sh_x_out[22]), .B0(n421), .B1(
        d_ff3_sh_y_out[22]), .Y(n413) );
  OAI2BB1X1TS U857 ( .A0N(n429), .A1N(d_ff3_LUT_out[22]), .B0(n413), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U858 ( .A0(n422), .A1(d_ff3_sh_x_out[20]), .B0(n421), .B1(
        d_ff3_sh_y_out[20]), .Y(n414) );
  NAND2X1TS U859 ( .A(n429), .B(d_ff3_LUT_out[20]), .Y(n417) );
  NAND2X1TS U860 ( .A(n414), .B(n417), .Y(add_subt_dataB[20]) );
  AOI22X1TS U861 ( .A0(n422), .A1(d_ff3_sh_x_out[19]), .B0(n421), .B1(
        d_ff3_sh_y_out[19]), .Y(n415) );
  OAI2BB1X1TS U862 ( .A0N(n429), .A1N(d_ff3_LUT_out[22]), .B0(n415), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U863 ( .A0(n422), .A1(d_ff3_sh_x_out[17]), .B0(n421), .B1(
        d_ff3_sh_y_out[17]), .Y(n416) );
  NAND2X1TS U864 ( .A(n416), .B(n417), .Y(add_subt_dataB[17]) );
  AOI22X1TS U865 ( .A0(n422), .A1(d_ff3_sh_x_out[15]), .B0(n421), .B1(
        d_ff3_sh_y_out[15]), .Y(n418) );
  NAND2X1TS U866 ( .A(n418), .B(n417), .Y(add_subt_dataB[15]) );
  AOI22X1TS U867 ( .A0(n427), .A1(d_ff3_sh_x_out[13]), .B0(n426), .B1(
        d_ff3_sh_y_out[13]), .Y(n419) );
  OAI2BB1X1TS U868 ( .A0N(n425), .A1N(d_ff3_LUT_out[18]), .B0(n419), .Y(
        add_subt_dataB[13]) );
  AOI22X1TS U869 ( .A0(n422), .A1(d_ff3_sh_x_out[11]), .B0(n421), .B1(
        d_ff3_sh_y_out[11]), .Y(n420) );
  OAI2BB1X1TS U870 ( .A0N(n425), .A1N(d_ff3_LUT_out[11]), .B0(n420), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U871 ( .A0(n422), .A1(d_ff3_sh_x_out[7]), .B0(n421), .B1(
        d_ff3_sh_y_out[7]), .Y(n423) );
  OAI2BB1X1TS U872 ( .A0N(n425), .A1N(d_ff3_LUT_out[11]), .B0(n423), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U873 ( .A0(n427), .A1(d_ff3_sh_x_out[5]), .B0(n426), .B1(
        d_ff3_sh_y_out[5]), .Y(n424) );
  OAI2BB1X1TS U874 ( .A0N(n425), .A1N(d_ff3_LUT_out[14]), .B0(n424), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U875 ( .A0(n427), .A1(d_ff3_sh_x_out[3]), .B0(n426), .B1(
        d_ff3_sh_y_out[3]), .Y(n428) );
  OAI2BB1X1TS U876 ( .A0N(n429), .A1N(d_ff3_LUT_out[16]), .B0(n428), .Y(
        add_subt_dataB[3]) );
  XNOR2X1TS U877 ( .A(cont_var_out[0]), .B(d_ff3_sign_out), .Y(op_add_subt) );
  NOR2XLTS U879 ( .A(d_ff2_Y[29]), .B(n431), .Y(n430) );
  XNOR2X1TS U880 ( .A(d_ff2_Y[29]), .B(n431), .Y(sh_exp_y[6]) );
  AO21XLTS U881 ( .A0(intadd_414_n1), .A1(d_ff2_Y[27]), .B0(n432), .Y(
        sh_exp_y[4]) );
  NOR2XLTS U882 ( .A(d_ff2_X[29]), .B(n434), .Y(n433) );
  XNOR2X1TS U883 ( .A(d_ff2_X[29]), .B(n434), .Y(sh_exp_x[6]) );
  AO21XLTS U884 ( .A0(intadd_413_n1), .A1(d_ff2_X[27]), .B0(n435), .Y(
        sh_exp_x[4]) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk20.tcl_GATED_syn.sdf"); 
 endmodule

