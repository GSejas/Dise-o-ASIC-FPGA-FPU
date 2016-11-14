/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:00:24 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_counter_d_W4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_15 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_16 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_18 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_19 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_20 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_22 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_25 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5_1 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
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
         enab_dff_5, d_ff3_sign_out, sel_mux_3_reg, data_output2_31_,
         cordic_FSM_state_next_1_, cont_iter_net3592108,
         d_ff5_data_out_net3592085, reg_Z0_net3592085,
         reg_val_muxZ_2stage_net3592085, reg_shift_y_net3592085,
         d_ff4_Xn_net3592085, d_ff4_Yn_net3592085, d_ff4_Zn_net3592085,
         d_ff5_net3592085, n180, n186, n187, n188, n189, n193, n194, n195,
         n196, n197, intadd_411_CI, intadd_411_n3, intadd_411_n2,
         intadd_411_n1, intadd_412_CI, intadd_412_n3, intadd_412_n2,
         intadd_412_n1, n263, n264, n265, n266, n267, n268, n269, n270, n271,
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
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n514,
         n515, n516;
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
  wire   [3:0] cordic_FSM_state_reg;

  SNPS_CLOCK_GATE_HIGH_counter_d_W4 cont_iter_clk_gate_count_reg ( .CLK(clk), 
        .EN(enab_cont_iter), .ENCLK(cont_iter_net3592108), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_13 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3592085), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_25 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(load_cont_iter), .ENCLK(reg_Z0_net3592085), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_22 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enab_d_ff2_RB2), .ENCLK(reg_val_muxZ_2stage_net3592085), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_20 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(n285), .ENCLK(reg_shift_y_net3592085), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_19 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3592085), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_18 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3592085), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_16 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3592085), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_15 d_ff5_clk_gate_Q_reg ( .CLK(clk), .EN(
        enab_dff_5), .ENCLK(d_ff5_net3592085), .TE(1'b0) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3592085), .RN(n507), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n469) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(data_out_LUT[0]), .CK(reg_shift_y_net3592085), 
        .RN(n508), .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(data_out_LUT[1]), .CK(reg_shift_y_net3592085), 
        .RN(n510), .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(data_out_LUT[2]), .CK(reg_shift_y_net3592085), 
        .RN(n508), .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(data_out_LUT[4]), .CK(reg_shift_y_net3592085), 
        .RN(n508), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(data_out_LUT[6]), .CK(reg_shift_y_net3592085), 
        .RN(n506), .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(data_out_LUT[8]), .CK(reg_shift_y_net3592085), 
        .RN(n509), .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(data_out_LUT[9]), .CK(reg_shift_y_net3592085), 
        .RN(n507), .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(data_out_LUT[10]), .CK(
        reg_shift_y_net3592085), .RN(n491), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(data_out_LUT[11]), .CK(
        reg_shift_y_net3592085), .RN(n483), .Q(d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(data_out_LUT[12]), .CK(
        reg_shift_y_net3592085), .RN(n507), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(data_out_LUT[14]), .CK(
        reg_shift_y_net3592085), .RN(n476), .Q(d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(data_out_LUT[16]), .CK(
        reg_shift_y_net3592085), .RN(n509), .Q(d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(data_out_LUT[18]), .CK(
        reg_shift_y_net3592085), .RN(n507), .Q(d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(data_out_LUT[20]), .CK(
        reg_shift_y_net3592085), .RN(n508), .Q(d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(data_out_LUT[21]), .CK(
        reg_shift_y_net3592085), .RN(n509), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(data_out_LUT[22]), .CK(
        reg_shift_y_net3592085), .RN(n508), .Q(d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(data_out_LUT[23]), .CK(
        reg_shift_y_net3592085), .RN(n506), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(data_out_LUT[24]), .CK(
        reg_shift_y_net3592085), .RN(n506), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3592085), .RN(n492), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(data_out_LUT[26]), .CK(
        reg_shift_y_net3592085), .RN(n508), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3592085), .RN(n491), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3592085), .RN(n506), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3592085), .RN(n509), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3592085), .RN(n509), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3592085), .RN(n479), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3592085), .RN(n506), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3592085), .RN(n507), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3592085), .RN(n509), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3592085), .RN(n507), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3592085), .RN(n490), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3592085), .RN(
        n510), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3592085), .RN(
        n510), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3592085), .RN(
        n507), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3592085), .RN(
        n506), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3592085), .RN(
        n510), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3592085), .RN(
        n507), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3592085), .RN(
        n508), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3592085), .RN(
        n507), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3592085), .RN(
        n506), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3592085), .RN(
        n510), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3592085), .RN(
        n510), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3592085), .RN(
        n486), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3592085), .RN(
        n509), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3592085), .RN(
        n509), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3592085), .RN(
        n505), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3592085), .RN(
        n489), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3592085), .RN(
        n503), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3592085), .RN(
        n504), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3592085), .RN(
        n505), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3592085), .RN(
        n489), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3592085), .RN(
        n503), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3592085), .RN(
        n504), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3592085), .RN(n505), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3592085), .RN(n489), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3592085), .RN(n503), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3592085), .RN(n504), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3592085), .RN(n505), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3592085), .RN(n489), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3592085), .RN(n503), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3592085), .RN(n504), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3592085), .RN(n505), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3592085), .RN(n489), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3592085), .RN(n503), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3592085), .RN(n504), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3592085), .RN(n503), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3592085), .RN(n504), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3592085), .RN(n505), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3592085), .RN(n489), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3592085), .RN(n505), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n489), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3592085), 
        .RN(n503), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3592085), .RN(n504), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n505), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3592085), 
        .RN(n489), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3592085), .RN(n497), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n502), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3592085), 
        .RN(n276), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3592085), .RN(n498), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n276), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3592085), 
        .RN(n492), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3592085), .RN(n502), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n502), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3592085), 
        .RN(n498), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3592085), .RN(n502), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n500), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3592085), 
        .RN(n277), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3592085), .RN(n276), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n499), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3592085), 
        .RN(n499), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3592085), .RN(n500), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n497), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3592085), 
        .RN(n502), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3592085), .RN(n497), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n500), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3592085), 
        .RN(n277), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3592085), .RN(n497), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n502), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3592085), 
        .RN(n498), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3592085), .RN(n492), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n497), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3592085), .RN(n497), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3592085), .RN(n497), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n501), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3592085), .RN(n499), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3592085), .RN(n501), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n500), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3592085), .RN(n277), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3592085), .RN(n500), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n500), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3592085), .RN(n501), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3592085), .RN(n497), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n499), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3592085), .RN(n501), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3592085), .RN(n499), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n492), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3592085), .RN(n492), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3592085), .RN(n500), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n277), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3592085), .RN(n502), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3592085), .RN(n497), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n497), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3592085), .RN(n498), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3592085), .RN(n276), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n498), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3592085), .RN(n276), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3592085), .RN(n498), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n498), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3592085), .RN(n501), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3592085), .RN(n502), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n502), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3592085), .RN(n499), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3592085), .RN(n499), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n501), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3592085), .RN(n277), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3592085), .RN(n475), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n476), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3592085), .RN(n280), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3592085), .RN(n488), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n482), .Q(d_ff2_X[23]), .QN(n465)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3592085), .RN(n488), .Q(d_ff_Xn[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3592085), .RN(n269), .Q(d_ff_Xn[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3592085), .RN(n270), .Q(d_ff_Xn[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3592085), .RN(n475), .Q(d_ff_Xn[27]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n269), .Q(d_ff2_X[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3592085), .RN(n476), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n269), .Q(d_ff2_X[28]), .QN(n472)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3592085), .RN(n280), .Q(d_ff_Xn[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3592085), .RN(n477), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n482), .Q(d_ff2_X[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3592085), .RN(n494), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n280), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3592085), .RN(n483), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3592085), .RN(n487), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n280), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3592085), 
        .RN(n483), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3592085), .RN(n270), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n496), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3592085), 
        .RN(n488), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3592085), .RN(n477), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n485), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3592085), 
        .RN(n494), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3592085), .RN(n494), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n490), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3592085), 
        .RN(n477), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3592085), .RN(n483), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n496), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3592085), 
        .RN(n487), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3592085), .RN(n495), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n488), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3592085), 
        .RN(n485), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3592085), .RN(n499), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n502), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3592085), 
        .RN(n500), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3592085), .RN(n498), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n277), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3592085), 
        .RN(n501), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3592085), .RN(n498), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n276), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3592085), 
        .RN(n501), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3592085), .RN(n498), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n493), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3592085), 
        .RN(n486), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3592085), .RN(n477), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n492), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3592085), .RN(n494), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3592085), .RN(n486), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n480), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3592085), .RN(n488), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3592085), .RN(n486), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n276), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3592085), .RN(n490), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3592085), .RN(n495), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n487), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3592085), .RN(n269), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3592085), .RN(n476), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n280), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3592085), .RN(n495), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3592085), .RN(n490), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n270), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3592085), .RN(n270), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3592085), .RN(n503), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n504), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3592085), .RN(n505), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3592085), .RN(n489), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n503), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3592085), .RN(n504), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3592085), .RN(n505), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n489), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3592085), .RN(n503), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3592085), .RN(n504), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n487), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3592085), .RN(n477), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3592085), .RN(n269), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n490), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3592085), .RN(n496), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3592085), .RN(n495), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n475), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3592085), .RN(n279), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3592085), .RN(n485), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n480), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3592085), .RN(n475), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3592085), .RN(n269), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n270), .Q(d_ff2_Y[23]), .QN(n464)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3592085), .RN(n480), .Q(d_ff_Yn[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3592085), .RN(n283), .Q(d_ff_Yn[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3592085), .RN(n283), .Q(d_ff_Yn[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3592085), .RN(n279), .Q(d_ff_Yn[27]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n494), .Q(d_ff2_Y[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3592085), .RN(n476), .Q(d_ff_Yn[28]) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3592085), .RN(n270), .Q(d_ff_Yn[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3592085), .RN(n270), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n280), .Q(d_ff2_Y[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3592085), .RN(n488), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n480), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3592085), .RN(n283), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3592085), .RN(n496), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n488), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3592085), .RN(n494), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n270), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3592085), .RN(n490), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n282), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3592085), .RN(n282), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n475), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3592085), .RN(n485), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n279), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3592085), .RN(n484), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n484), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3592085), .RN(n484), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n484), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3592085), .RN(n484), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n484), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3592085), .RN(n484), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n484), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3592085), .RN(n484), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n484), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3592085), .RN(n487), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n482), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3592085), .RN(n283), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n283), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3592085), .RN(n483), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n280), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3592085), .RN(n477), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n280), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3592085), .RN(n485), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n495), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3592085), .RN(n482), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n487), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3592085), .RN(n490), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n495), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3592085), .RN(n488), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n487), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3592085), .RN(n476), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n485), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3592085), .RN(n483), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n279), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3592085), .RN(n481), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n481), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3592085), .RN(n481), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n481), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3592085), .RN(n481), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n481), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3592085), .RN(n481), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n481), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3592085), .RN(n481), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n481), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3592085), .RN(n496), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n485), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3592085), .RN(n475), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n477), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3592085), .RN(n495), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n282), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3592085), .RN(n282), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n282), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3592085), .RN(n282), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n282), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3592085), .RN(n477), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n496), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3592085), .RN(n480), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n496), .Q(d_ff2_Z[31]) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(mux_sal[0]), .CK(d_ff5_net3592085), .RN(n494), 
        .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(mux_sal[1]), .CK(d_ff5_net3592085), .RN(n283), 
        .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(mux_sal[2]), .CK(d_ff5_net3592085), .RN(n482), 
        .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(mux_sal[3]), .CK(d_ff5_net3592085), .RN(n475), 
        .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(mux_sal[4]), .CK(d_ff5_net3592085), .RN(n483), 
        .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(mux_sal[5]), .CK(d_ff5_net3592085), .RN(n487), 
        .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(mux_sal[6]), .CK(d_ff5_net3592085), .RN(n491), 
        .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(mux_sal[7]), .CK(d_ff5_net3592085), .RN(n479), 
        .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(mux_sal[8]), .CK(d_ff5_net3592085), .RN(n491), 
        .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(mux_sal[9]), .CK(d_ff5_net3592085), .RN(n479), 
        .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(mux_sal[10]), .CK(d_ff5_net3592085), .RN(n279), 
        .Q(sign_inv_out[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(mux_sal[11]), .CK(d_ff5_net3592085), .RN(n495), 
        .Q(sign_inv_out[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(mux_sal[12]), .CK(d_ff5_net3592085), .RN(n480), 
        .Q(sign_inv_out[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(mux_sal[13]), .CK(d_ff5_net3592085), .RN(n478), 
        .Q(sign_inv_out[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(mux_sal[14]), .CK(d_ff5_net3592085), .RN(n478), 
        .Q(sign_inv_out[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(mux_sal[15]), .CK(d_ff5_net3592085), .RN(n478), 
        .Q(sign_inv_out[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(mux_sal[16]), .CK(d_ff5_net3592085), .RN(n478), 
        .Q(sign_inv_out[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(mux_sal[17]), .CK(d_ff5_net3592085), .RN(n478), 
        .Q(sign_inv_out[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(mux_sal[18]), .CK(d_ff5_net3592085), .RN(n279), 
        .Q(sign_inv_out[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(mux_sal[19]), .CK(d_ff5_net3592085), .RN(n491), 
        .Q(sign_inv_out[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(mux_sal[20]), .CK(d_ff5_net3592085), .RN(n493), 
        .Q(sign_inv_out[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(mux_sal[21]), .CK(d_ff5_net3592085), .RN(n277), 
        .Q(sign_inv_out[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(mux_sal[22]), .CK(d_ff5_net3592085), .RN(n479), 
        .Q(sign_inv_out[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(mux_sal[23]), .CK(d_ff5_net3592085), .RN(n486), 
        .Q(sign_inv_out[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(mux_sal[24]), .CK(d_ff5_net3592085), .RN(n487), 
        .Q(sign_inv_out[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(mux_sal[25]), .CK(d_ff5_net3592085), .RN(n276), 
        .Q(sign_inv_out[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(mux_sal[26]), .CK(d_ff5_net3592085), .RN(n479), 
        .Q(sign_inv_out[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(mux_sal[27]), .CK(d_ff5_net3592085), .RN(n476), 
        .Q(sign_inv_out[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(mux_sal[28]), .CK(d_ff5_net3592085), .RN(n486), 
        .Q(sign_inv_out[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(mux_sal[29]), .CK(d_ff5_net3592085), .RN(n491), 
        .Q(sign_inv_out[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(mux_sal[30]), .CK(d_ff5_net3592085), .RN(n493), 
        .Q(sign_inv_out[30]) );
  DFFRXLTS d_ff5_Q_reg_31_ ( .D(mux_sal[31]), .CK(d_ff5_net3592085), .RN(n480), 
        .Q(data_output2_31_) );
  SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5_1 clk_gate_reg_ch_mux_2_Q_reg ( 
        .CLK(clk), .EN(n514), .ENCLK(n512), .TE(1'b0) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(1'b1), .CK(reg_shift_y_net3592085), .RN(n486), .Q(d_ff3_LUT_out[27]) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n194), .CK(n512), .RN(n506), .Q(
        cont_var_out[1]), .QN(n468) );
  DFFRX2TS cordic_FSM_state_reg_reg_2_ ( .D(n196), .CK(clk), .RN(n180), .Q(
        cordic_FSM_state_reg[2]), .QN(n467) );
  DFFRX2TS reg_ch_mux_1_Q_reg_0_ ( .D(n188), .CK(n512), .RN(n509), .Q(n459), 
        .QN(n470) );
  DFFRX2TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n180), .Q(cordic_FSM_state_reg[1]), .QN(n458) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(sign_inv_out[0]), .CK(
        d_ff5_data_out_net3592085), .RN(n475), .Q(data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(sign_inv_out[1]), .CK(
        d_ff5_data_out_net3592085), .RN(n283), .Q(data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(sign_inv_out[2]), .CK(
        d_ff5_data_out_net3592085), .RN(n475), .Q(data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(sign_inv_out[3]), .CK(
        d_ff5_data_out_net3592085), .RN(n479), .Q(data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(sign_inv_out[4]), .CK(
        d_ff5_data_out_net3592085), .RN(n485), .Q(data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(sign_inv_out[5]), .CK(
        d_ff5_data_out_net3592085), .RN(n491), .Q(data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(sign_inv_out[6]), .CK(
        d_ff5_data_out_net3592085), .RN(n482), .Q(data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(sign_inv_out[7]), .CK(
        d_ff5_data_out_net3592085), .RN(n491), .Q(data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(sign_inv_out[8]), .CK(
        d_ff5_data_out_net3592085), .RN(n491), .Q(data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(sign_inv_out[9]), .CK(
        d_ff5_data_out_net3592085), .RN(n485), .Q(data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(sign_inv_out[10]), .CK(
        d_ff5_data_out_net3592085), .RN(n490), .Q(data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(sign_inv_out[11]), .CK(
        d_ff5_data_out_net3592085), .RN(n279), .Q(data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(sign_inv_out[12]), .CK(
        d_ff5_data_out_net3592085), .RN(n478), .Q(data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(sign_inv_out[13]), .CK(
        d_ff5_data_out_net3592085), .RN(n478), .Q(data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(sign_inv_out[14]), .CK(
        d_ff5_data_out_net3592085), .RN(n478), .Q(data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(sign_inv_out[15]), .CK(
        d_ff5_data_out_net3592085), .RN(n478), .Q(data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(sign_inv_out[16]), .CK(
        d_ff5_data_out_net3592085), .RN(n478), .Q(data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(sign_inv_out[17]), .CK(
        d_ff5_data_out_net3592085), .RN(n492), .Q(data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(sign_inv_out[18]), .CK(
        d_ff5_data_out_net3592085), .RN(n480), .Q(data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(sign_inv_out[19]), .CK(
        d_ff5_data_out_net3592085), .RN(n476), .Q(data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(sign_inv_out[20]), .CK(
        d_ff5_data_out_net3592085), .RN(n279), .Q(data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(sign_inv_out[21]), .CK(
        d_ff5_data_out_net3592085), .RN(n493), .Q(data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(sign_inv_out[22]), .CK(
        d_ff5_data_out_net3592085), .RN(n491), .Q(data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(sign_inv_out[23]), .CK(
        d_ff5_data_out_net3592085), .RN(n479), .Q(data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(sign_inv_out[24]), .CK(
        d_ff5_data_out_net3592085), .RN(n480), .Q(data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(sign_inv_out[25]), .CK(
        d_ff5_data_out_net3592085), .RN(n496), .Q(data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(sign_inv_out[26]), .CK(
        d_ff5_data_out_net3592085), .RN(n493), .Q(data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(sign_inv_out[27]), .CK(
        d_ff5_data_out_net3592085), .RN(n480), .Q(data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(sign_inv_out[28]), .CK(
        d_ff5_data_out_net3592085), .RN(n483), .Q(data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(sign_inv_out[29]), .CK(
        d_ff5_data_out_net3592085), .RN(n493), .Q(data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(sign_inv_out[30]), .CK(
        d_ff5_data_out_net3592085), .RN(n479), .Q(data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(sign_inv_out[31]), .CK(
        d_ff5_data_out_net3592085), .RN(n479), .Q(data_output[31]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[31]), .CK(reg_shift_y_net3592085), 
        .RN(n283), .Q(d_ff3_sign_out) );
  DFFRX2TS cont_var_count_reg_0_ ( .D(n193), .CK(n512), .RN(n475), .Q(
        cont_var_out[0]), .QN(n462) );
  DFFRX1TS reg_ch_mux_2_Q_reg_0_ ( .D(n187), .CK(n512), .RN(n508), .Q(
        sel_mux_2_reg[0]), .QN(n466) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n186), .CK(n512), .RN(n510), .Q(
        sel_mux_2_reg[1]) );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n516), .CK(cont_iter_net3592108), .RN(
        n507), .Q(cont_iter_out[3]), .QN(n463) );
  DFFSX4TS cont_iter_count_reg_2_ ( .D(n457), .CK(cont_iter_net3592108), .SN(
        n482), .Q(data_out_LUT[8]), .QN(n473) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n487), .Q(d_ff2_Y[29]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n496), .Q(d_ff2_Y[28]), .QN(n471)
         );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3592085), .RN(n479), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n495), .Q(d_ff2_X[29]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n496), .Q(d_ff2_X[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n495), .Q(d_ff2_X[25]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n269), .Q(d_ff2_X[24]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n482), .Q(d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n485), .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3592085), .RN(n282), .Q(d_ff2_Y[24]) );
  DFFRX2TS reg_ch_mux_3_Q_reg_0_ ( .D(n189), .CK(n512), .RN(n510), .Q(
        sel_mux_3_reg), .QN(n474) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3592085), 
        .RN(n509), .Q(d_ff1_operation_out) );
  DFFRX4TS cordic_FSM_state_reg_reg_3_ ( .D(n195), .CK(n512), .RN(n180), .Q(
        cordic_FSM_state_reg[3]), .QN(n461) );
  DFFRX2TS cordic_FSM_state_reg_reg_0_ ( .D(n197), .CK(clk), .RN(n180), .Q(
        cordic_FSM_state_reg[0]), .QN(n266) );
  ADDFX1TS intadd_411_U3 ( .A(d_ff2_X[25]), .B(data_out_LUT[8]), .CI(
        intadd_411_n3), .CO(intadd_411_n2), .S(sh_exp_x[2]) );
  ADDFX1TS intadd_412_U2 ( .A(d_ff2_Y[26]), .B(n463), .CI(intadd_412_n2), .CO(
        intadd_412_n1), .S(sh_exp_y[3]) );
  ADDFX1TS intadd_411_U2 ( .A(d_ff2_X[26]), .B(n463), .CI(intadd_411_n2), .CO(
        intadd_411_n1), .S(sh_exp_x[3]) );
  DFFSX2TS cont_iter_count_reg_0_ ( .D(n287), .CK(cont_iter_net3592108), .SN(
        n506), .Q(n511), .QN(n264) );
  DFFRX2TS cont_iter_count_reg_1_ ( .D(n515), .CK(cont_iter_net3592108), .RN(
        n506), .Q(cont_iter_out[1]), .QN(n460) );
  CMPR32X2TS intadd_412_U4 ( .A(d_ff2_Y[24]), .B(n268), .C(intadd_412_CI), 
        .CO(intadd_412_n3), .S(sh_exp_y[1]) );
  CMPR32X2TS intadd_411_U4 ( .A(d_ff2_X[24]), .B(n268), .C(intadd_411_CI), 
        .CO(intadd_411_n3), .S(sh_exp_x[1]) );
  CMPR32X2TS intadd_412_U3 ( .A(d_ff2_Y[25]), .B(data_out_LUT[8]), .C(
        intadd_412_n3), .CO(intadd_412_n2), .S(sh_exp_y[2]) );
  AOI222X1TS U437 ( .A0(n313), .A1(d_ff2_Z[30]), .B0(n337), .B1(d_ff2_Y[30]), 
        .C0(n336), .C1(d_ff2_X[30]), .Y(n321) );
  NOR2XLTS U438 ( .A(sel_mux_2_reg[1]), .B(n466), .Y(n314) );
  NOR2XLTS U439 ( .A(d_ff2_Y[29]), .B(n452), .Y(n451) );
  NOR2XLTS U440 ( .A(n341), .B(n340), .Y(enab_d_ff4_Yn) );
  NOR2X1TS U441 ( .A(cont_var_out[1]), .B(n377), .Y(n376) );
  NAND3X1TS U442 ( .A(n405), .B(n510), .C(n301), .Y(n299) );
  NAND2XLTS U443 ( .A(sel_mux_2_reg[1]), .B(n510), .Y(n305) );
  INVX3TS U444 ( .A(n263), .Y(n510) );
  AND4X2TS U445 ( .A(n461), .B(n467), .C(n458), .D(n281), .Y(n286) );
  CLKBUFX2TS U446 ( .A(n460), .Y(n268) );
  NOR2X1TS U447 ( .A(d_ff2_X[29]), .B(n455), .Y(n454) );
  AOI31X2TS U448 ( .A0(n409), .A1(n511), .A2(n460), .B0(n303), .Y(n418) );
  AOI222X1TS U449 ( .A0(n467), .A1(cordic_FSM_state_reg[1]), .B0(n467), .B1(
        n310), .C0(n458), .C1(n266), .Y(n294) );
  INVX2TS U450 ( .A(n273), .Y(n398) );
  OAI32X1TS U451 ( .A0(n309), .A1(n291), .A2(n419), .B0(n414), .B1(n308), .Y(
        n188) );
  INVX2TS U452 ( .A(n273), .Y(n423) );
  CLKBUFX3TS U453 ( .A(n313), .Y(n446) );
  BUFX3TS U454 ( .A(n443), .Y(n433) );
  CLKBUFX3TS U455 ( .A(n401), .Y(n402) );
  INVX2TS U456 ( .A(n419), .Y(n422) );
  CLKBUFX3TS U457 ( .A(n474), .Y(n404) );
  NOR2BX4TS U458 ( .AN(sel_mux_2_reg[1]), .B(sel_mux_2_reg[0]), .Y(n313) );
  BUFX3TS U459 ( .A(n286), .Y(n263) );
  NOR3X2TS U460 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n458), .Y(n265) );
  CLKAND2X2TS U461 ( .A(n265), .B(n461), .Y(load_cont_iter) );
  NOR2XLTS U462 ( .A(cordic_FSM_state_reg[3]), .B(n514), .Y(enab_d_ff2_RB2) );
  NOR3XLTS U463 ( .A(n312), .B(n311), .C(n340), .Y(enab_d_ff4_Xn) );
  NOR3XLTS U464 ( .A(n310), .B(n380), .C(n340), .Y(enab_d_ff4_Zn) );
  OR2X1TS U465 ( .A(n387), .B(load_cont_iter), .Y(enab_cont_iter) );
  OAI21XLTS U466 ( .A0(n301), .A1(n300), .B0(n299), .Y(n189) );
  NAND4XLTS U467 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[1]), 
        .C(n467), .D(n266), .Y(n301) );
  CLKAND2X2TS U468 ( .A(d_ff_Yn[24]), .B(n421), .Y(first_mux_Y[24]) );
  CLKAND2X2TS U469 ( .A(d_ff_Yn[25]), .B(n397), .Y(first_mux_Y[25]) );
  CLKAND2X2TS U470 ( .A(d_ff_Yn[26]), .B(n423), .Y(first_mux_Y[26]) );
  NAND2BXLTS U471 ( .AN(d_ff_Xn[24]), .B(n422), .Y(first_mux_X[24]) );
  NAND2BXLTS U472 ( .AN(d_ff_Xn[25]), .B(n422), .Y(first_mux_X[25]) );
  NAND2BXLTS U473 ( .AN(d_ff_Xn[26]), .B(n422), .Y(first_mux_X[26]) );
  NAND2BXLTS U474 ( .AN(d_ff_Xn[29]), .B(n422), .Y(first_mux_X[29]) );
  CLKAND2X2TS U475 ( .A(d_ff_Yn[28]), .B(n396), .Y(first_mux_Y[28]) );
  CLKAND2X2TS U476 ( .A(d_ff_Yn[29]), .B(n398), .Y(first_mux_Y[29]) );
  CLKAND2X2TS U477 ( .A(n391), .B(cordic_FSM_state_reg[0]), .Y(n515) );
  OAI32X1TS U478 ( .A0(n306), .A1(n289), .A2(n466), .B0(n341), .B1(n307), .Y(
        n187) );
  AOI211XLTS U479 ( .A0(n381), .A1(n462), .B0(n285), .C0(n343), .Y(n193) );
  OAI31X1TS U480 ( .A0(cordic_FSM_state_reg[2]), .A1(n297), .A2(n266), .B0(
        n296), .Y(n196) );
  AOI211XLTS U481 ( .A0(cont_var_out[1]), .A1(n377), .B0(n285), .C0(n376), .Y(
        n194) );
  AO22XLTS U482 ( .A0(n405), .A1(d_ff_Yn[31]), .B0(n474), .B1(d_ff_Xn[31]), 
        .Y(mux_sal[31]) );
  AO22XLTS U483 ( .A0(n405), .A1(d_ff_Yn[30]), .B0(n474), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U484 ( .A0(n405), .A1(d_ff_Yn[29]), .B0(n474), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U485 ( .A0(n405), .A1(d_ff_Yn[28]), .B0(n474), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U486 ( .A0(n405), .A1(d_ff_Yn[27]), .B0(n404), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U487 ( .A0(n405), .A1(d_ff_Yn[26]), .B0(n404), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U488 ( .A0(n405), .A1(d_ff_Yn[25]), .B0(n404), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U489 ( .A0(n405), .A1(d_ff_Yn[24]), .B0(n404), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U490 ( .A0(n405), .A1(d_ff_Yn[23]), .B0(n404), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U491 ( .A0(n403), .A1(d_ff_Yn[22]), .B0(n404), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U492 ( .A0(n403), .A1(d_ff_Yn[21]), .B0(n404), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U493 ( .A0(n403), .A1(d_ff_Yn[20]), .B0(n404), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U494 ( .A0(n403), .A1(d_ff_Yn[19]), .B0(n404), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U495 ( .A0(n403), .A1(d_ff_Yn[18]), .B0(n404), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U496 ( .A0(n403), .A1(d_ff_Yn[17]), .B0(n402), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U497 ( .A0(n403), .A1(d_ff_Yn[16]), .B0(n402), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U498 ( .A0(n403), .A1(d_ff_Yn[15]), .B0(n402), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U499 ( .A0(n403), .A1(d_ff_Yn[14]), .B0(n402), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U500 ( .A0(n403), .A1(d_ff_Yn[13]), .B0(n402), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U501 ( .A0(n400), .A1(d_ff_Yn[12]), .B0(n402), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U502 ( .A0(n400), .A1(d_ff_Yn[11]), .B0(n402), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U503 ( .A0(n400), .A1(d_ff_Yn[10]), .B0(n402), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U504 ( .A0(n400), .A1(d_ff_Yn[9]), .B0(n402), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U505 ( .A0(n400), .A1(d_ff_Yn[8]), .B0(n402), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U506 ( .A0(n400), .A1(d_ff_Yn[7]), .B0(n401), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U507 ( .A0(n400), .A1(d_ff_Yn[6]), .B0(n401), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U508 ( .A0(n400), .A1(d_ff_Yn[5]), .B0(n401), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  AO22XLTS U509 ( .A0(n400), .A1(d_ff_Yn[4]), .B0(n401), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  AO22XLTS U510 ( .A0(n400), .A1(d_ff_Yn[3]), .B0(n401), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U511 ( .A0(sel_mux_3_reg), .A1(d_ff_Yn[2]), .B0(n401), .B1(
        d_ff_Xn[2]), .Y(mux_sal[2]) );
  AO22XLTS U512 ( .A0(sel_mux_3_reg), .A1(d_ff_Yn[1]), .B0(n401), .B1(
        d_ff_Xn[1]), .Y(mux_sal[1]) );
  AO22XLTS U513 ( .A0(sel_mux_3_reg), .A1(d_ff_Yn[0]), .B0(n474), .B1(
        d_ff_Xn[0]), .Y(mux_sal[0]) );
  AO22XLTS U514 ( .A0(n399), .A1(d_ff_Zn[31]), .B0(n470), .B1(d_ff1_Z[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U515 ( .A0(n459), .A1(d_ff_Zn[30]), .B0(n273), .B1(d_ff1_Z[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U516 ( .A0(n399), .A1(d_ff_Zn[29]), .B0(n273), .B1(d_ff1_Z[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U517 ( .A0(n459), .A1(d_ff_Zn[28]), .B0(n419), .B1(d_ff1_Z[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U518 ( .A0(n459), .A1(d_ff_Zn[27]), .B0(n272), .B1(d_ff1_Z[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U519 ( .A0(n396), .A1(d_ff_Zn[26]), .B0(n419), .B1(d_ff1_Z[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U520 ( .A0(n399), .A1(d_ff_Zn[25]), .B0(n419), .B1(d_ff1_Z[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U521 ( .A0(n398), .A1(d_ff_Zn[24]), .B0(n419), .B1(d_ff1_Z[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U522 ( .A0(n459), .A1(d_ff_Zn[23]), .B0(n419), .B1(d_ff1_Z[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U523 ( .A0(n421), .A1(d_ff_Zn[22]), .B0(n420), .B1(d_ff1_Z[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U524 ( .A0(n399), .A1(d_ff_Zn[21]), .B0(n470), .B1(d_ff1_Z[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U525 ( .A0(n423), .A1(d_ff_Zn[20]), .B0(n272), .B1(d_ff1_Z[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U526 ( .A0(n399), .A1(d_ff_Zn[19]), .B0(n470), .B1(d_ff1_Z[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U527 ( .A0(n399), .A1(d_ff_Zn[18]), .B0(n470), .B1(d_ff1_Z[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U528 ( .A0(n399), .A1(d_ff_Zn[17]), .B0(n470), .B1(d_ff1_Z[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U529 ( .A0(n398), .A1(d_ff_Zn[16]), .B0(n272), .B1(d_ff1_Z[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U530 ( .A0(n459), .A1(d_ff_Zn[15]), .B0(n272), .B1(d_ff1_Z[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U531 ( .A0(n421), .A1(d_ff_Zn[14]), .B0(n470), .B1(d_ff1_Z[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U532 ( .A0(n459), .A1(d_ff_Zn[13]), .B0(n273), .B1(d_ff1_Z[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U533 ( .A0(n459), .A1(d_ff_Zn[12]), .B0(n420), .B1(d_ff1_Z[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U534 ( .A0(n399), .A1(d_ff_Zn[11]), .B0(n420), .B1(d_ff1_Z[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U535 ( .A0(n396), .A1(d_ff_Zn[10]), .B0(n420), .B1(d_ff1_Z[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U536 ( .A0(n423), .A1(d_ff_Zn[9]), .B0(n420), .B1(d_ff1_Z[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U537 ( .A0(n399), .A1(d_ff_Zn[8]), .B0(n420), .B1(d_ff1_Z[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U538 ( .A0(n459), .A1(d_ff_Zn[7]), .B0(n273), .B1(d_ff1_Z[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U539 ( .A0(n397), .A1(d_ff_Zn[6]), .B0(n273), .B1(d_ff1_Z[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U540 ( .A0(n397), .A1(d_ff_Zn[5]), .B0(n273), .B1(d_ff1_Z[5]), .Y(
        first_mux_Z[5]) );
  AO22XLTS U541 ( .A0(n284), .A1(d_ff_Zn[4]), .B0(n273), .B1(d_ff1_Z[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U542 ( .A0(n399), .A1(d_ff_Zn[3]), .B0(n419), .B1(d_ff1_Z[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U543 ( .A0(n421), .A1(d_ff_Zn[2]), .B0(n470), .B1(d_ff1_Z[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U544 ( .A0(n284), .A1(d_ff_Zn[1]), .B0(n470), .B1(d_ff1_Z[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U545 ( .A0(n397), .A1(d_ff_Zn[0]), .B0(n419), .B1(d_ff1_Z[0]), .Y(
        first_mux_Z[0]) );
  CLKAND2X2TS U546 ( .A(d_ff_Yn[31]), .B(n284), .Y(first_mux_Y[31]) );
  CLKAND2X2TS U547 ( .A(d_ff_Yn[30]), .B(n398), .Y(first_mux_Y[30]) );
  CLKAND2X2TS U548 ( .A(d_ff_Yn[27]), .B(n284), .Y(first_mux_Y[27]) );
  CLKAND2X2TS U549 ( .A(d_ff_Yn[23]), .B(n396), .Y(first_mux_Y[23]) );
  CLKAND2X2TS U550 ( .A(d_ff_Yn[22]), .B(n423), .Y(first_mux_Y[22]) );
  CLKAND2X2TS U551 ( .A(d_ff_Yn[21]), .B(n398), .Y(first_mux_Y[21]) );
  CLKAND2X2TS U552 ( .A(d_ff_Yn[20]), .B(n397), .Y(first_mux_Y[20]) );
  CLKAND2X2TS U553 ( .A(d_ff_Yn[19]), .B(n423), .Y(first_mux_Y[19]) );
  CLKAND2X2TS U554 ( .A(d_ff_Yn[18]), .B(n284), .Y(first_mux_Y[18]) );
  CLKAND2X2TS U555 ( .A(d_ff_Yn[17]), .B(n284), .Y(first_mux_Y[17]) );
  CLKAND2X2TS U556 ( .A(d_ff_Yn[16]), .B(n397), .Y(first_mux_Y[16]) );
  CLKAND2X2TS U557 ( .A(d_ff_Yn[15]), .B(n397), .Y(first_mux_Y[15]) );
  CLKAND2X2TS U558 ( .A(d_ff_Yn[14]), .B(n271), .Y(first_mux_Y[14]) );
  CLKAND2X2TS U559 ( .A(d_ff_Yn[13]), .B(n271), .Y(first_mux_Y[13]) );
  CLKAND2X2TS U560 ( .A(d_ff_Yn[12]), .B(n421), .Y(first_mux_Y[12]) );
  CLKAND2X2TS U561 ( .A(d_ff_Yn[11]), .B(n271), .Y(first_mux_Y[11]) );
  CLKAND2X2TS U562 ( .A(d_ff_Yn[10]), .B(n459), .Y(first_mux_Y[10]) );
  CLKAND2X2TS U563 ( .A(d_ff_Yn[9]), .B(n421), .Y(first_mux_Y[9]) );
  CLKAND2X2TS U564 ( .A(d_ff_Yn[8]), .B(n396), .Y(first_mux_Y[8]) );
  CLKAND2X2TS U565 ( .A(d_ff_Yn[7]), .B(n423), .Y(first_mux_Y[7]) );
  CLKAND2X2TS U566 ( .A(d_ff_Yn[6]), .B(n421), .Y(first_mux_Y[6]) );
  CLKAND2X2TS U567 ( .A(d_ff_Yn[5]), .B(n396), .Y(first_mux_Y[5]) );
  CLKAND2X2TS U568 ( .A(d_ff_Yn[4]), .B(n398), .Y(first_mux_Y[4]) );
  CLKAND2X2TS U569 ( .A(d_ff_Yn[3]), .B(n396), .Y(first_mux_Y[3]) );
  CLKAND2X2TS U570 ( .A(d_ff_Yn[2]), .B(n423), .Y(first_mux_Y[2]) );
  CLKAND2X2TS U571 ( .A(d_ff_Yn[1]), .B(n396), .Y(first_mux_Y[1]) );
  CLKAND2X2TS U572 ( .A(d_ff_Yn[0]), .B(n398), .Y(first_mux_Y[0]) );
  CLKAND2X2TS U573 ( .A(d_ff_Xn[31]), .B(n271), .Y(first_mux_X[31]) );
  CLKAND2X2TS U574 ( .A(d_ff_Xn[30]), .B(n421), .Y(first_mux_X[30]) );
  NAND2BXLTS U575 ( .AN(d_ff_Xn[28]), .B(n422), .Y(first_mux_X[28]) );
  NAND2BXLTS U576 ( .AN(d_ff_Xn[27]), .B(n422), .Y(first_mux_X[27]) );
  CLKAND2X2TS U577 ( .A(d_ff_Xn[23]), .B(n284), .Y(first_mux_X[23]) );
  CLKAND2X2TS U578 ( .A(d_ff_Xn[22]), .B(n397), .Y(first_mux_X[22]) );
  CLKAND2X2TS U579 ( .A(d_ff_Xn[21]), .B(n271), .Y(first_mux_X[21]) );
  NAND2BXLTS U580 ( .AN(d_ff_Xn[20]), .B(n422), .Y(first_mux_X[20]) );
  NAND2BXLTS U581 ( .AN(d_ff_Xn[19]), .B(n422), .Y(first_mux_X[19]) );
  CLKAND2X2TS U582 ( .A(d_ff_Xn[18]), .B(n421), .Y(first_mux_X[18]) );
  NAND2BXLTS U583 ( .AN(d_ff_Xn[17]), .B(n423), .Y(first_mux_X[17]) );
  NAND2BXLTS U584 ( .AN(d_ff_Xn[16]), .B(n398), .Y(first_mux_X[16]) );
  CLKAND2X2TS U585 ( .A(d_ff_Xn[15]), .B(n271), .Y(first_mux_X[15]) );
  NAND2BXLTS U586 ( .AN(d_ff_Xn[14]), .B(n284), .Y(first_mux_X[14]) );
  NAND2BXLTS U587 ( .AN(d_ff_Xn[13]), .B(n459), .Y(first_mux_X[13]) );
  NAND2BXLTS U588 ( .AN(d_ff_Xn[12]), .B(n422), .Y(first_mux_X[12]) );
  CLKAND2X2TS U589 ( .A(d_ff_Xn[11]), .B(n396), .Y(first_mux_X[11]) );
  NAND2BXLTS U590 ( .AN(d_ff_Xn[10]), .B(n396), .Y(first_mux_X[10]) );
  CLKAND2X2TS U591 ( .A(d_ff_Xn[9]), .B(n398), .Y(first_mux_X[9]) );
  CLKAND2X2TS U592 ( .A(d_ff_Xn[8]), .B(n423), .Y(first_mux_X[8]) );
  NAND2BXLTS U593 ( .AN(d_ff_Xn[7]), .B(n398), .Y(first_mux_X[7]) );
  NAND2BXLTS U594 ( .AN(d_ff_Xn[6]), .B(n422), .Y(first_mux_X[6]) );
  NAND2BXLTS U595 ( .AN(d_ff_Xn[5]), .B(n423), .Y(first_mux_X[5]) );
  CLKAND2X2TS U596 ( .A(d_ff_Xn[4]), .B(n284), .Y(first_mux_X[4]) );
  NAND2BXLTS U597 ( .AN(d_ff_Xn[3]), .B(n397), .Y(first_mux_X[3]) );
  NAND2BXLTS U598 ( .AN(d_ff_Xn[2]), .B(n284), .Y(first_mux_X[2]) );
  NAND2BXLTS U599 ( .AN(d_ff_Xn[1]), .B(n421), .Y(first_mux_X[1]) );
  CLKAND2X2TS U600 ( .A(d_ff_Xn[0]), .B(n397), .Y(first_mux_X[0]) );
  XOR2XLTS U601 ( .A(d_ff2_Y[30]), .B(n451), .Y(sh_exp_y[7]) );
  OAI21XLTS U602 ( .A0(n453), .A1(n471), .B0(n452), .Y(sh_exp_y[5]) );
  AO21XLTS U603 ( .A0(intadd_412_n1), .A1(d_ff2_Y[27]), .B0(n453), .Y(
        sh_exp_y[4]) );
  OAI21XLTS U604 ( .A0(n264), .A1(n464), .B0(intadd_412_CI), .Y(sh_exp_y[0])
         );
  XOR2XLTS U605 ( .A(d_ff2_X[30]), .B(n454), .Y(sh_exp_x[7]) );
  OAI21XLTS U606 ( .A0(n456), .A1(n472), .B0(n455), .Y(sh_exp_x[5]) );
  AO21XLTS U607 ( .A0(intadd_411_n1), .A1(d_ff2_X[27]), .B0(n456), .Y(
        sh_exp_x[4]) );
  OAI21XLTS U608 ( .A0(n264), .A1(n465), .B0(intadd_411_CI), .Y(sh_exp_x[0])
         );
  CLKINVX3TS U609 ( .A(n290), .Y(n479) );
  AOI2BB2XLTS U610 ( .B0(n511), .B1(data_out_LUT[22]), .A0N(data_out_LUT[22]), 
        .A1N(n511), .Y(data_out_LUT[23]) );
  AO21XLTS U611 ( .A0(n415), .A1(data_out_LUT[8]), .B0(data_out_LUT[18]), .Y(
        data_out_LUT[21]) );
  NAND2BXLTS U612 ( .AN(data_out_LUT[12]), .B(n412), .Y(data_out_LUT[14]) );
  NAND3XLTS U613 ( .A(n264), .B(n463), .C(n460), .Y(n412) );
  CLKINVX3TS U614 ( .A(n290), .Y(n491) );
  AO21XLTS U615 ( .A0(n415), .A1(data_out_LUT[8]), .B0(data_out_LUT[16]), .Y(
        data_out_LUT[9]) );
  NAND2BXLTS U616 ( .AN(n414), .B(n413), .Y(data_out_LUT[1]) );
  AO21XLTS U617 ( .A0(n416), .A1(n415), .B0(data_out_LUT[10]), .Y(
        data_out_LUT[0]) );
  CLKBUFX2TS U618 ( .A(n470), .Y(n420) );
  OR4X2TS U619 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[1]), .C(
        n467), .D(n266), .Y(n267) );
  INVX2TS U620 ( .A(n291), .Y(n493) );
  INVX2TS U621 ( .A(n278), .Y(n269) );
  INVX2TS U622 ( .A(n278), .Y(n270) );
  INVX2TS U623 ( .A(n289), .Y(n494) );
  INVX2TS U624 ( .A(n290), .Y(n486) );
  INVX2TS U625 ( .A(n420), .Y(n271) );
  INVX2TS U626 ( .A(n271), .Y(n272) );
  INVX2TS U627 ( .A(n271), .Y(n273) );
  INVX2TS U628 ( .A(data_out_LUT[8]), .Y(n274) );
  INVX2TS U629 ( .A(n511), .Y(n275) );
  INVX2TS U630 ( .A(n286), .Y(n492) );
  INVX2TS U631 ( .A(n291), .Y(n276) );
  INVX2TS U632 ( .A(n278), .Y(n277) );
  INVX2TS U633 ( .A(n494), .Y(n278) );
  INVX2TS U634 ( .A(n278), .Y(n279) );
  INVX2TS U635 ( .A(n278), .Y(n280) );
  INVX2TS U636 ( .A(cordic_FSM_state_reg[0]), .Y(n281) );
  INVX2TS U637 ( .A(n278), .Y(n282) );
  INVX2TS U638 ( .A(n278), .Y(n283) );
  OAI32X1TS U639 ( .A0(n281), .A1(n390), .A2(n463), .B0(n389), .B1(n266), .Y(
        n516) );
  NOR4X1TS U640 ( .A(cordic_FSM_state_reg[1]), .B(n467), .C(n461), .D(n281), 
        .Y(ready_cordic) );
  INVX2TS U641 ( .A(n288), .Y(n457) );
  AOI221X1TS U642 ( .A0(n473), .A1(n302), .B0(data_out_LUT[8]), .B1(n417), 
        .C0(n266), .Y(n288) );
  INVX2TS U643 ( .A(n272), .Y(n284) );
  AOI222X1TS U644 ( .A0(n473), .A1(cont_iter_out[1]), .B0(n473), .B1(n264), 
        .C0(cont_iter_out[3]), .C1(n460), .Y(data_out_LUT[4]) );
  INVX2TS U645 ( .A(n267), .Y(n285) );
  OAI211XLTS U646 ( .A0(cont_iter_out[1]), .A1(data_out_LUT[22]), .B0(n418), 
        .C0(n304), .Y(data_out_LUT[24]) );
  AOI31XLTS U647 ( .A0(cordic_FSM_state_reg[3]), .A1(n342), .A2(n380), .B0(
        cordic_FSM_state_reg[1]), .Y(n297) );
  BUFX3TS U648 ( .A(n263), .Y(n289) );
  BUFX3TS U649 ( .A(n263), .Y(n291) );
  CLKINVX3TS U650 ( .A(n286), .Y(n498) );
  CLKINVX3TS U651 ( .A(n286), .Y(n497) );
  CLKINVX3TS U652 ( .A(n286), .Y(n502) );
  CLKINVX3TS U653 ( .A(n263), .Y(n484) );
  CLKINVX3TS U654 ( .A(n263), .Y(n481) );
  CLKINVX3TS U655 ( .A(n263), .Y(n507) );
  CLKINVX3TS U656 ( .A(n290), .Y(n503) );
  CLKINVX3TS U657 ( .A(n291), .Y(n478) );
  CLKINVX3TS U658 ( .A(n289), .Y(n489) );
  CLKINVX3TS U659 ( .A(n291), .Y(n505) );
  CLKINVX3TS U660 ( .A(n278), .Y(n504) );
  CLKINVX3TS U661 ( .A(n289), .Y(n475) );
  CLKINVX3TS U662 ( .A(n289), .Y(n495) );
  CLKINVX3TS U663 ( .A(n291), .Y(n496) );
  CLKINVX3TS U664 ( .A(n291), .Y(n487) );
  CLKINVX3TS U665 ( .A(n289), .Y(n480) );
  CLKINVX3TS U666 ( .A(n291), .Y(n485) );
  CLKINVX3TS U667 ( .A(n263), .Y(n509) );
  CLKINVX3TS U668 ( .A(n263), .Y(n506) );
  NOR4X2TS U669 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[2]), 
        .C(n461), .D(n281), .Y(ack_add_subt) );
  NAND3X2TS U670 ( .A(cordic_FSM_state_reg[2]), .B(n458), .C(n266), .Y(n514)
         );
  AOI222X1TS U671 ( .A0(n338), .A1(d_ff2_Z[24]), .B0(n337), .B1(d_ff2_Y[24]), 
        .C0(n336), .C1(d_ff2_X[24]), .Y(n335) );
  AOI222X1TS U672 ( .A0(n338), .A1(d_ff2_Z[25]), .B0(n337), .B1(d_ff2_Y[25]), 
        .C0(n336), .C1(d_ff2_X[25]), .Y(n329) );
  AOI222X1TS U673 ( .A0(n338), .A1(d_ff2_Z[26]), .B0(n337), .B1(d_ff2_Y[26]), 
        .C0(n336), .C1(d_ff2_X[26]), .Y(n326) );
  NOR4X2TS U674 ( .A(n473), .B(cont_iter_out[3]), .C(n264), .D(
        cont_iter_out[1]), .Y(n414) );
  AOI32X4TS U675 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(n469), .A2(
        d_ff1_operation_out), .B0(n406), .B1(d_ff1_shift_region_flag_out[0]), 
        .Y(n407) );
  NOR4X2TS U676 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[0]), 
        .C(n467), .D(n458), .Y(n306) );
  OR2X1TS U677 ( .A(n264), .B(n281), .Y(n287) );
  NOR2XLTS U678 ( .A(cont_iter_out[3]), .B(n390), .Y(data_out_LUT[26]) );
  OR2X1TS U679 ( .A(data_out_LUT[20]), .B(n414), .Y(data_out_LUT[11]) );
  NAND2X2TS U680 ( .A(n275), .B(cont_iter_out[1]), .Y(n417) );
  INVX2TS U681 ( .A(n417), .Y(n302) );
  CLKBUFX2TS U682 ( .A(n263), .Y(n290) );
  INVX2TS U683 ( .A(n289), .Y(n490) );
  INVX2TS U684 ( .A(n291), .Y(n488) );
  INVX2TS U685 ( .A(n263), .Y(n508) );
  INVX2TS U686 ( .A(n286), .Y(n501) );
  INVX2TS U687 ( .A(n286), .Y(n500) );
  INVX2TS U688 ( .A(n286), .Y(n499) );
  INVX2TS U689 ( .A(n289), .Y(n476) );
  INVX2TS U690 ( .A(n291), .Y(n477) );
  INVX2TS U691 ( .A(n289), .Y(n482) );
  INVX2TS U692 ( .A(n289), .Y(n483) );
  BUFX3TS U693 ( .A(n470), .Y(n419) );
  INVX2TS U694 ( .A(n272), .Y(n397) );
  AOI33X1TS U695 ( .A0(n264), .A1(cont_iter_out[1]), .A2(data_out_LUT[8]), 
        .B0(n460), .B1(n463), .B2(n511), .Y(n304) );
  NOR2X2TS U696 ( .A(n274), .B(n463), .Y(n409) );
  NOR2X2TS U697 ( .A(n264), .B(n268), .Y(n415) );
  INVX2TS U698 ( .A(n415), .Y(n411) );
  OAI21X1TS U699 ( .A0(cont_iter_out[1]), .A1(n511), .B0(n411), .Y(n391) );
  NAND2X1TS U700 ( .A(n409), .B(n391), .Y(n292) );
  NAND2X1TS U701 ( .A(n304), .B(n292), .Y(data_out_LUT[6]) );
  NAND2X2TS U702 ( .A(n274), .B(cont_iter_out[3]), .Y(data_out_LUT[22]) );
  NAND2X1TS U703 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n388) );
  NOR3X1TS U704 ( .A(cordic_FSM_state_reg[3]), .B(n467), .C(n388), .Y(
        beg_add_subt) );
  NOR2X2TS U705 ( .A(data_out_LUT[22]), .B(n417), .Y(n310) );
  NAND4BX1TS U706 ( .AN(ack_cordic), .B(cordic_FSM_state_reg[2]), .C(
        cordic_FSM_state_reg[3]), .D(n458), .Y(n383) );
  INVX2TS U707 ( .A(beg_add_subt), .Y(n293) );
  OAI211XLTS U708 ( .A0(n294), .A1(n461), .B0(n383), .C0(n293), .Y(n195) );
  NOR2X2TS U709 ( .A(cont_iter_out[3]), .B(data_out_LUT[8]), .Y(n416) );
  NOR2X2TS U710 ( .A(n409), .B(n416), .Y(n413) );
  OAI21X1TS U711 ( .A0(n274), .A1(n460), .B0(n413), .Y(data_out_LUT[20]) );
  INVX2TS U712 ( .A(n310), .Y(n342) );
  NAND2X1TS U713 ( .A(cont_var_out[1]), .B(n462), .Y(n380) );
  OAI2BB2XLTS U714 ( .B0(cordic_FSM_state_reg[1]), .B1(ack_cordic), .A0N(n461), 
        .A1N(n388), .Y(n295) );
  INVX2TS U715 ( .A(n514), .Y(n385) );
  AOI21X1TS U716 ( .A0(cordic_FSM_state_reg[2]), .A1(n295), .B0(n385), .Y(n296) );
  NOR2X1TS U717 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), 
        .Y(n406) );
  AOI21X1TS U718 ( .A0(d_ff1_operation_out), .A1(
        d_ff1_shift_region_flag_out[1]), .B0(n406), .Y(n298) );
  XNOR2X1TS U719 ( .A(d_ff1_shift_region_flag_out[0]), .B(n298), .Y(n300) );
  NOR2X1TS U720 ( .A(n342), .B(n300), .Y(n312) );
  AOI21X1TS U721 ( .A0(cont_var_out[0]), .A1(n342), .B0(n312), .Y(n341) );
  INVX2TS U722 ( .A(n306), .Y(n307) );
  INVX2TS U723 ( .A(rst), .Y(n180) );
  NAND2X1TS U724 ( .A(n464), .B(n275), .Y(intadd_412_CI) );
  NAND2X1TS U725 ( .A(n465), .B(n275), .Y(intadd_411_CI) );
  NOR2X1TS U726 ( .A(data_out_LUT[8]), .B(n417), .Y(n390) );
  BUFX3TS U727 ( .A(n474), .Y(n401) );
  INVX2TS U728 ( .A(n401), .Y(n405) );
  NOR2X1TS U729 ( .A(d_ff2_X[27]), .B(intadd_411_n1), .Y(n456) );
  OR3X1TS U730 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(intadd_411_n1), .Y(n455)
         );
  NOR2X1TS U731 ( .A(d_ff2_Y[27]), .B(intadd_412_n1), .Y(n453) );
  OR3X1TS U732 ( .A(d_ff2_Y[28]), .B(d_ff2_Y[27]), .C(intadd_412_n1), .Y(n452)
         );
  NAND2X1TS U733 ( .A(ready_add_subt), .B(n458), .Y(n382) );
  NAND4BX1TS U734 ( .AN(n382), .B(cordic_FSM_state_reg[3]), .C(n266), .D(n467), 
        .Y(n340) );
  OAI21X1TS U735 ( .A0(n473), .A1(cont_iter_out[1]), .B0(n413), .Y(
        data_out_LUT[16]) );
  OAI21X1TS U736 ( .A0(n473), .A1(n511), .B0(n413), .Y(data_out_LUT[18]) );
  NAND2X1TS U737 ( .A(n302), .B(n416), .Y(n389) );
  INVX2TS U738 ( .A(n389), .Y(n303) );
  OAI32X1TS U739 ( .A0(n307), .A1(n310), .A2(n468), .B0(n306), .B1(n305), .Y(
        n186) );
  NOR3X1TS U740 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[2]), 
        .C(n388), .Y(n309) );
  INVX2TS U741 ( .A(n309), .Y(n308) );
  AOI21X1TS U742 ( .A0(n468), .A1(n462), .B0(n310), .Y(n311) );
  BUFX3TS U743 ( .A(n314), .Y(n443) );
  BUFX3TS U744 ( .A(n433), .Y(n333) );
  NOR2X1TS U745 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n363) );
  CLKBUFX2TS U746 ( .A(n363), .Y(n357) );
  BUFX3TS U747 ( .A(n357), .Y(n332) );
  AOI222X1TS U748 ( .A0(n313), .A1(d_ff2_Z[19]), .B0(n333), .B1(d_ff2_Y[19]), 
        .C0(n332), .C1(d_ff2_X[19]), .Y(n315) );
  INVX2TS U749 ( .A(n315), .Y(add_subt_dataA[19]) );
  BUFX3TS U750 ( .A(n433), .Y(n337) );
  BUFX3TS U751 ( .A(n357), .Y(n336) );
  AOI222X1TS U752 ( .A0(n313), .A1(d_ff3_LUT_out[0]), .B0(n337), .B1(
        d_ff3_sh_x_out[0]), .C0(n336), .C1(d_ff3_sh_y_out[0]), .Y(n316) );
  INVX2TS U753 ( .A(n316), .Y(add_subt_dataB[0]) );
  AOI222X1TS U754 ( .A0(n313), .A1(d_ff2_Z[31]), .B0(n337), .B1(d_ff2_Y[31]), 
        .C0(n336), .C1(d_ff2_X[31]), .Y(n317) );
  INVX2TS U755 ( .A(n317), .Y(add_subt_dataA[31]) );
  BUFX3TS U756 ( .A(n313), .Y(n352) );
  AOI222X1TS U757 ( .A0(n352), .A1(d_ff2_Z[16]), .B0(n333), .B1(d_ff2_Y[16]), 
        .C0(n332), .C1(d_ff2_X[16]), .Y(n318) );
  INVX2TS U758 ( .A(n318), .Y(add_subt_dataA[16]) );
  AOI222X1TS U759 ( .A0(n313), .A1(d_ff3_LUT_out[1]), .B0(n337), .B1(
        d_ff3_sh_x_out[1]), .C0(n336), .C1(d_ff3_sh_y_out[1]), .Y(n319) );
  INVX2TS U760 ( .A(n319), .Y(add_subt_dataB[1]) );
  AOI222X1TS U761 ( .A0(n352), .A1(d_ff2_Z[15]), .B0(n333), .B1(d_ff2_Y[15]), 
        .C0(n332), .C1(d_ff2_X[15]), .Y(n320) );
  INVX2TS U762 ( .A(n320), .Y(add_subt_dataA[15]) );
  INVX2TS U763 ( .A(n321), .Y(add_subt_dataA[30]) );
  AOI222X1TS U764 ( .A0(n352), .A1(d_ff2_Z[17]), .B0(n333), .B1(d_ff2_Y[17]), 
        .C0(n332), .C1(d_ff2_X[17]), .Y(n322) );
  INVX2TS U765 ( .A(n322), .Y(add_subt_dataA[17]) );
  AOI222X1TS U766 ( .A0(n313), .A1(d_ff2_Z[20]), .B0(n333), .B1(d_ff2_Y[20]), 
        .C0(n332), .C1(d_ff2_X[20]), .Y(n323) );
  INVX2TS U767 ( .A(n323), .Y(add_subt_dataA[20]) );
  AOI222X1TS U768 ( .A0(n352), .A1(d_ff2_Z[18]), .B0(n333), .B1(d_ff2_Y[18]), 
        .C0(n332), .C1(d_ff2_X[18]), .Y(n324) );
  INVX2TS U769 ( .A(n324), .Y(add_subt_dataA[18]) );
  CLKBUFX2TS U770 ( .A(n313), .Y(n371) );
  BUFX3TS U771 ( .A(n371), .Y(n338) );
  AOI222X1TS U772 ( .A0(n338), .A1(d_ff2_Z[23]), .B0(n333), .B1(d_ff2_Y[23]), 
        .C0(n332), .C1(d_ff2_X[23]), .Y(n325) );
  INVX2TS U773 ( .A(n325), .Y(add_subt_dataA[23]) );
  INVX2TS U774 ( .A(n326), .Y(add_subt_dataA[26]) );
  AOI222X1TS U775 ( .A0(n338), .A1(d_ff2_Z[29]), .B0(n337), .B1(d_ff2_Y[29]), 
        .C0(n336), .C1(d_ff2_X[29]), .Y(n327) );
  INVX2TS U776 ( .A(n327), .Y(add_subt_dataA[29]) );
  AOI222X1TS U777 ( .A0(n338), .A1(d_ff2_Z[21]), .B0(n333), .B1(d_ff2_Y[21]), 
        .C0(n332), .C1(d_ff2_X[21]), .Y(n328) );
  INVX2TS U778 ( .A(n328), .Y(add_subt_dataA[21]) );
  INVX2TS U779 ( .A(n329), .Y(add_subt_dataA[25]) );
  AOI222X1TS U780 ( .A0(n338), .A1(d_ff2_Z[28]), .B0(n337), .B1(d_ff2_Y[28]), 
        .C0(n336), .C1(d_ff2_X[28]), .Y(n330) );
  INVX2TS U781 ( .A(n330), .Y(add_subt_dataA[28]) );
  AOI222X1TS U782 ( .A0(n338), .A1(d_ff2_Z[22]), .B0(n333), .B1(d_ff2_Y[22]), 
        .C0(n332), .C1(d_ff2_X[22]), .Y(n331) );
  INVX2TS U783 ( .A(n331), .Y(add_subt_dataA[22]) );
  AOI222X1TS U784 ( .A0(n338), .A1(d_ff2_Z[0]), .B0(n333), .B1(d_ff2_Y[0]), 
        .C0(n332), .C1(d_ff2_X[0]), .Y(n334) );
  INVX2TS U785 ( .A(n334), .Y(add_subt_dataA[0]) );
  INVX2TS U786 ( .A(n335), .Y(add_subt_dataA[24]) );
  AOI222X1TS U787 ( .A0(n338), .A1(d_ff2_Z[27]), .B0(n337), .B1(d_ff2_Y[27]), 
        .C0(n336), .C1(d_ff2_X[27]), .Y(n339) );
  INVX2TS U788 ( .A(n339), .Y(add_subt_dataA[27]) );
  NAND2X1TS U789 ( .A(ack_add_subt), .B(n342), .Y(n381) );
  AOI21X1TS U790 ( .A0(n380), .A1(n462), .B0(n381), .Y(n343) );
  BUFX3TS U791 ( .A(n433), .Y(n355) );
  BUFX3TS U792 ( .A(n357), .Y(n354) );
  AOI222X1TS U793 ( .A0(n352), .A1(d_ff2_Z[14]), .B0(n355), .B1(d_ff2_Y[14]), 
        .C0(n354), .C1(d_ff2_X[14]), .Y(n344) );
  INVX2TS U794 ( .A(n344), .Y(add_subt_dataA[14]) );
  BUFX3TS U795 ( .A(n352), .Y(n361) );
  AOI222X1TS U796 ( .A0(n361), .A1(d_ff2_Z[8]), .B0(n355), .B1(d_ff2_Y[8]), 
        .C0(n354), .C1(d_ff2_X[8]), .Y(n345) );
  INVX2TS U797 ( .A(n345), .Y(add_subt_dataA[8]) );
  AOI222X1TS U798 ( .A0(n352), .A1(d_ff2_Z[12]), .B0(n355), .B1(d_ff2_Y[12]), 
        .C0(n354), .C1(d_ff2_X[12]), .Y(n346) );
  INVX2TS U799 ( .A(n346), .Y(add_subt_dataA[12]) );
  AOI222X1TS U800 ( .A0(n361), .A1(d_ff2_Z[7]), .B0(n355), .B1(d_ff2_Y[7]), 
        .C0(n354), .C1(d_ff2_X[7]), .Y(n347) );
  INVX2TS U801 ( .A(n347), .Y(add_subt_dataA[7]) );
  AOI222X1TS U802 ( .A0(n352), .A1(d_ff2_Z[11]), .B0(n355), .B1(d_ff2_Y[11]), 
        .C0(n354), .C1(d_ff2_X[11]), .Y(n348) );
  INVX2TS U803 ( .A(n348), .Y(add_subt_dataA[11]) );
  AOI222X1TS U804 ( .A0(n361), .A1(d_ff2_Z[10]), .B0(n355), .B1(d_ff2_Y[10]), 
        .C0(n354), .C1(d_ff2_X[10]), .Y(n349) );
  INVX2TS U805 ( .A(n349), .Y(add_subt_dataA[10]) );
  AOI222X1TS U806 ( .A0(n361), .A1(d_ff2_Z[6]), .B0(n355), .B1(d_ff2_Y[6]), 
        .C0(n354), .C1(d_ff2_X[6]), .Y(n350) );
  INVX2TS U807 ( .A(n350), .Y(add_subt_dataA[6]) );
  AOI222X1TS U808 ( .A0(n361), .A1(d_ff2_Z[9]), .B0(n355), .B1(d_ff2_Y[9]), 
        .C0(n354), .C1(d_ff2_X[9]), .Y(n351) );
  INVX2TS U809 ( .A(n351), .Y(add_subt_dataA[9]) );
  AOI222X1TS U810 ( .A0(n352), .A1(d_ff2_Z[13]), .B0(n355), .B1(d_ff2_Y[13]), 
        .C0(n354), .C1(d_ff2_X[13]), .Y(n353) );
  INVX2TS U811 ( .A(n353), .Y(add_subt_dataA[13]) );
  AOI222X1TS U812 ( .A0(n361), .A1(d_ff2_Z[3]), .B0(n355), .B1(d_ff2_Y[3]), 
        .C0(n354), .C1(d_ff2_X[3]), .Y(n356) );
  INVX2TS U813 ( .A(n356), .Y(add_subt_dataA[3]) );
  BUFX3TS U814 ( .A(n433), .Y(n448) );
  BUFX3TS U815 ( .A(n357), .Y(n447) );
  AOI222X1TS U816 ( .A0(n361), .A1(d_ff2_Z[5]), .B0(n448), .B1(d_ff2_Y[5]), 
        .C0(n447), .C1(d_ff2_X[5]), .Y(n358) );
  INVX2TS U817 ( .A(n358), .Y(add_subt_dataA[5]) );
  AOI222X1TS U818 ( .A0(n361), .A1(d_ff2_Z[1]), .B0(n448), .B1(d_ff2_Y[1]), 
        .C0(n447), .C1(d_ff2_X[1]), .Y(n359) );
  INVX2TS U819 ( .A(n359), .Y(add_subt_dataA[1]) );
  AOI222X1TS U820 ( .A0(n361), .A1(d_ff2_Z[2]), .B0(n448), .B1(d_ff2_Y[2]), 
        .C0(n447), .C1(d_ff2_X[2]), .Y(n360) );
  INVX2TS U821 ( .A(n360), .Y(add_subt_dataA[2]) );
  AOI222X1TS U822 ( .A0(n361), .A1(d_ff2_Z[4]), .B0(n448), .B1(d_ff2_Y[4]), 
        .C0(n447), .C1(d_ff2_X[4]), .Y(n362) );
  INVX2TS U823 ( .A(n362), .Y(add_subt_dataA[4]) );
  BUFX3TS U824 ( .A(n443), .Y(n424) );
  CLKBUFX2TS U825 ( .A(n363), .Y(n442) );
  CLKBUFX2TS U826 ( .A(n442), .Y(n438) );
  BUFX3TS U827 ( .A(n438), .Y(n374) );
  AOI222X1TS U828 ( .A0(n371), .A1(d_ff3_LUT_out[9]), .B0(n424), .B1(
        d_ff3_sh_x_out[9]), .C0(n374), .C1(d_ff3_sh_y_out[9]), .Y(n364) );
  INVX2TS U829 ( .A(n364), .Y(add_subt_dataB[9]) );
  AOI222X1TS U830 ( .A0(n313), .A1(d_ff3_LUT_out[2]), .B0(n433), .B1(
        d_ff3_sh_x_out[2]), .C0(n374), .C1(d_ff3_sh_y_out[2]), .Y(n365) );
  INVX2TS U831 ( .A(n365), .Y(add_subt_dataB[2]) );
  AOI222X1TS U832 ( .A0(n371), .A1(d_ff3_LUT_out[21]), .B0(n424), .B1(
        d_ff3_sh_x_out[21]), .C0(n374), .C1(d_ff3_sh_y_out[21]), .Y(n366) );
  INVX2TS U833 ( .A(n366), .Y(add_subt_dataB[21]) );
  BUFX3TS U834 ( .A(n446), .Y(n450) );
  AOI222X1TS U835 ( .A0(n450), .A1(d_ff3_LUT_out[8]), .B0(n433), .B1(
        d_ff3_sh_x_out[8]), .C0(n374), .C1(d_ff3_sh_y_out[8]), .Y(n367) );
  INVX2TS U836 ( .A(n367), .Y(add_subt_dataB[8]) );
  AOI222X1TS U837 ( .A0(n450), .A1(d_ff3_LUT_out[23]), .B0(n424), .B1(
        d_ff3_sh_x_out[23]), .C0(n374), .C1(d_ff3_sh_y_out[23]), .Y(n368) );
  INVX2TS U838 ( .A(n368), .Y(add_subt_dataB[23]) );
  AOI222X1TS U839 ( .A0(n371), .A1(d_ff3_LUT_out[6]), .B0(n433), .B1(
        d_ff3_sh_x_out[6]), .C0(n374), .C1(d_ff3_sh_y_out[6]), .Y(n369) );
  INVX2TS U840 ( .A(n369), .Y(add_subt_dataB[6]) );
  AOI222X1TS U841 ( .A0(n371), .A1(d_ff3_LUT_out[4]), .B0(n433), .B1(
        d_ff3_sh_x_out[4]), .C0(n374), .C1(d_ff3_sh_y_out[4]), .Y(n370) );
  INVX2TS U842 ( .A(n370), .Y(add_subt_dataB[4]) );
  AOI222X1TS U843 ( .A0(n371), .A1(d_ff3_LUT_out[10]), .B0(n424), .B1(
        d_ff3_sh_x_out[10]), .C0(n374), .C1(d_ff3_sh_y_out[10]), .Y(n372) );
  INVX2TS U844 ( .A(n372), .Y(add_subt_dataB[10]) );
  AOI222X1TS U845 ( .A0(n450), .A1(d_ff3_LUT_out[12]), .B0(n424), .B1(
        d_ff3_sh_x_out[12]), .C0(n374), .C1(d_ff3_sh_y_out[12]), .Y(n373) );
  INVX2TS U846 ( .A(n373), .Y(add_subt_dataB[12]) );
  AOI222X1TS U847 ( .A0(n450), .A1(d_ff3_LUT_out[24]), .B0(n424), .B1(
        d_ff3_sh_x_out[24]), .C0(n374), .C1(d_ff3_sh_y_out[24]), .Y(n375) );
  INVX2TS U848 ( .A(n375), .Y(add_subt_dataB[24]) );
  NOR2X1TS U849 ( .A(n462), .B(n381), .Y(n377) );
  AOI222X1TS U850 ( .A0(n450), .A1(d_ff3_LUT_out[25]), .B0(n424), .B1(
        d_ff3_sh_x_out[25]), .C0(n357), .C1(d_ff3_sh_y_out[25]), .Y(n378) );
  INVX2TS U851 ( .A(n378), .Y(add_subt_dataB[25]) );
  AOI222X1TS U852 ( .A0(n450), .A1(d_ff3_LUT_out[26]), .B0(n424), .B1(
        d_ff3_sh_x_out[26]), .C0(n357), .C1(d_ff3_sh_y_out[26]), .Y(n379) );
  INVX2TS U853 ( .A(n379), .Y(add_subt_dataB[26]) );
  NAND2X1TS U854 ( .A(n461), .B(n458), .Y(n394) );
  NOR2X1TS U855 ( .A(n381), .B(n380), .Y(n387) );
  AOI32X1TS U856 ( .A0(cordic_FSM_state_reg[3]), .A1(n383), .A2(n382), .B0(
        cordic_FSM_state_reg[0]), .B1(n383), .Y(n384) );
  NOR4X1TS U857 ( .A(n387), .B(n385), .C(n265), .D(n384), .Y(n386) );
  OAI31X1TS U858 ( .A0(cordic_FSM_state_reg[2]), .A1(beg_fsm_cordic), .A2(n394), .B0(n386), .Y(n197) );
  NOR3XLTS U859 ( .A(cordic_FSM_state_reg[2]), .B(n461), .C(n388), .Y(
        enab_dff_5) );
  NOR2XLTS U860 ( .A(n461), .B(n514), .Y(enab_d_ff5_data_out) );
  INVX2TS U862 ( .A(beg_fsm_cordic), .Y(n393) );
  NAND2X1TS U863 ( .A(cordic_FSM_state_reg[1]), .B(n461), .Y(n392) );
  OAI32X1TS U864 ( .A0(n266), .A1(n394), .A2(n393), .B0(
        cordic_FSM_state_reg[0]), .B1(n392), .Y(n395) );
  OR4X2TS U865 ( .A(n285), .B(ack_add_subt), .C(n265), .D(n395), .Y(
        cordic_FSM_state_next_1_) );
  INVX2TS U866 ( .A(n272), .Y(n396) );
  INVX2TS U867 ( .A(n419), .Y(n399) );
  INVX2TS U868 ( .A(n474), .Y(n400) );
  INVX2TS U869 ( .A(n401), .Y(n403) );
  XNOR2X1TS U870 ( .A(data_output2_31_), .B(n407), .Y(sign_inv_out[31]) );
  AOI21X1TS U871 ( .A0(n511), .A1(n460), .B0(cont_iter_out[3]), .Y(n408) );
  OAI32X1TS U872 ( .A0(n460), .A1(cont_iter_out[3]), .A2(n511), .B0(n408), 
        .B1(n473), .Y(data_out_LUT[10]) );
  AOI21X1TS U873 ( .A0(cont_iter_out[1]), .A1(n416), .B0(n409), .Y(n410) );
  OAI21X1TS U874 ( .A0(cont_iter_out[3]), .A1(n411), .B0(n410), .Y(
        data_out_LUT[12]) );
  OAI2BB2XLTS U875 ( .B0(n473), .B1(n417), .A0N(n460), .A1N(n416), .Y(
        data_out_LUT[2]) );
  AOI32X1TS U876 ( .A0(n264), .A1(n418), .A2(cont_iter_out[1]), .B0(n473), 
        .B1(n418), .Y(data_out_LUT[25]) );
  INVX2TS U877 ( .A(n272), .Y(n421) );
  AO22XLTS U878 ( .A0(n424), .A1(d_ff3_sh_x_out[31]), .B0(n357), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U879 ( .A0(n424), .A1(d_ff3_sh_x_out[30]), .B0(n442), .B1(
        d_ff3_sh_y_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U880 ( .A0(n443), .A1(d_ff3_sh_x_out[29]), .B0(n442), .B1(
        d_ff3_sh_y_out[29]), .Y(n425) );
  NAND2X1TS U881 ( .A(n450), .B(d_ff3_LUT_out[27]), .Y(n427) );
  NAND2X1TS U882 ( .A(n425), .B(n427), .Y(add_subt_dataB[29]) );
  AOI22X1TS U883 ( .A0(n443), .A1(d_ff3_sh_x_out[28]), .B0(n438), .B1(
        d_ff3_sh_y_out[28]), .Y(n426) );
  NAND2X1TS U884 ( .A(n426), .B(n427), .Y(add_subt_dataB[28]) );
  AOI22X1TS U885 ( .A0(n443), .A1(d_ff3_sh_x_out[27]), .B0(n438), .B1(
        d_ff3_sh_y_out[27]), .Y(n428) );
  NAND2X1TS U886 ( .A(n428), .B(n427), .Y(add_subt_dataB[27]) );
  AOI22X1TS U887 ( .A0(n433), .A1(d_ff3_sh_x_out[22]), .B0(n442), .B1(
        d_ff3_sh_y_out[22]), .Y(n429) );
  OAI2BB1X1TS U888 ( .A0N(n446), .A1N(d_ff3_LUT_out[22]), .B0(n429), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U889 ( .A0(n443), .A1(d_ff3_sh_x_out[20]), .B0(n438), .B1(
        d_ff3_sh_y_out[20]), .Y(n430) );
  NAND2X1TS U890 ( .A(n450), .B(d_ff3_LUT_out[20]), .Y(n436) );
  NAND2X1TS U891 ( .A(n430), .B(n436), .Y(add_subt_dataB[20]) );
  AOI22X1TS U892 ( .A0(n443), .A1(d_ff3_sh_x_out[19]), .B0(n442), .B1(
        d_ff3_sh_y_out[19]), .Y(n431) );
  OAI2BB1X1TS U893 ( .A0N(n446), .A1N(d_ff3_LUT_out[22]), .B0(n431), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U894 ( .A0(n443), .A1(d_ff3_sh_x_out[18]), .B0(n442), .B1(
        d_ff3_sh_y_out[18]), .Y(n432) );
  OAI2BB1X1TS U895 ( .A0N(n446), .A1N(d_ff3_LUT_out[18]), .B0(n432), .Y(
        add_subt_dataB[18]) );
  AOI22X1TS U896 ( .A0(n433), .A1(d_ff3_sh_x_out[17]), .B0(n438), .B1(
        d_ff3_sh_y_out[17]), .Y(n434) );
  NAND2X1TS U897 ( .A(n434), .B(n436), .Y(add_subt_dataB[17]) );
  AOI22X1TS U898 ( .A0(n448), .A1(d_ff3_sh_x_out[16]), .B0(n447), .B1(
        d_ff3_sh_y_out[16]), .Y(n435) );
  OAI2BB1X1TS U899 ( .A0N(n446), .A1N(d_ff3_LUT_out[16]), .B0(n435), .Y(
        add_subt_dataB[16]) );
  AOI22X1TS U900 ( .A0(n448), .A1(d_ff3_sh_x_out[15]), .B0(n447), .B1(
        d_ff3_sh_y_out[15]), .Y(n437) );
  NAND2X1TS U901 ( .A(n437), .B(n436), .Y(add_subt_dataB[15]) );
  AOI22X1TS U902 ( .A0(n443), .A1(d_ff3_sh_x_out[14]), .B0(n438), .B1(
        d_ff3_sh_y_out[14]), .Y(n439) );
  OAI2BB1X1TS U903 ( .A0N(n450), .A1N(d_ff3_LUT_out[14]), .B0(n439), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U904 ( .A0(n448), .A1(d_ff3_sh_x_out[13]), .B0(n447), .B1(
        d_ff3_sh_y_out[13]), .Y(n440) );
  OAI2BB1X1TS U905 ( .A0N(n446), .A1N(d_ff3_LUT_out[18]), .B0(n440), .Y(
        add_subt_dataB[13]) );
  AOI22X1TS U906 ( .A0(n448), .A1(d_ff3_sh_x_out[11]), .B0(n447), .B1(
        d_ff3_sh_y_out[11]), .Y(n441) );
  OAI2BB1X1TS U907 ( .A0N(n446), .A1N(d_ff3_LUT_out[11]), .B0(n441), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U908 ( .A0(n443), .A1(d_ff3_sh_x_out[7]), .B0(n442), .B1(
        d_ff3_sh_y_out[7]), .Y(n444) );
  OAI2BB1X1TS U909 ( .A0N(n446), .A1N(d_ff3_LUT_out[11]), .B0(n444), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U910 ( .A0(n448), .A1(d_ff3_sh_x_out[5]), .B0(n447), .B1(
        d_ff3_sh_y_out[5]), .Y(n445) );
  OAI2BB1X1TS U911 ( .A0N(n446), .A1N(d_ff3_LUT_out[14]), .B0(n445), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U912 ( .A0(n448), .A1(d_ff3_sh_x_out[3]), .B0(n447), .B1(
        d_ff3_sh_y_out[3]), .Y(n449) );
  OAI2BB1X1TS U913 ( .A0N(n450), .A1N(d_ff3_LUT_out[16]), .B0(n449), .Y(
        add_subt_dataB[3]) );
  XNOR2X1TS U914 ( .A(cont_var_out[0]), .B(d_ff3_sign_out), .Y(op_add_subt) );
  XNOR2X1TS U916 ( .A(d_ff2_Y[29]), .B(n452), .Y(sh_exp_y[6]) );
  XNOR2X1TS U917 ( .A(d_ff2_X[29]), .B(n455), .Y(sh_exp_x[6]) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule

