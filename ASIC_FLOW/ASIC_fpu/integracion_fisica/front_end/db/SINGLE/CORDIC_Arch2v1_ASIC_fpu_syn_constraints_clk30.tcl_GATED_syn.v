/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:01:06 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_counter_d_W4_30 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_15 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_16 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_18 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_19 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_20 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_22 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_25 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5_1 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
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
         enab_dff_5, sel_mux_1_reg, d_ff3_sign_out, data_output2_31_,
         cordic_FSM_state_next_1_, cont_iter_net3598728,
         d_ff5_data_out_net3598692, reg_Z0_net3598692,
         reg_val_muxZ_2stage_net3598692, reg_shift_y_net3598692,
         d_ff4_Xn_net3598692, d_ff4_Yn_net3598692, d_ff4_Zn_net3598692,
         d_ff5_net3598692, n180, n186, n187, n188, n189, n193, n194, n195,
         n196, n197, intadd_415_CI, intadd_415_n3, intadd_415_n2,
         intadd_415_n1, intadd_416_CI, intadd_416_n3, intadd_416_n2,
         intadd_416_n1, n263, n264, n265, n266, n268, n269, n270, n271, n272,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n475,
         n476, n477, n478, n479;
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

  SNPS_CLOCK_GATE_HIGH_counter_d_W4_30 cont_iter_clk_gate_count_reg ( .CLK(clk), .EN(enab_cont_iter), .ENCLK(cont_iter_net3598728), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_13 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3598692), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_25 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(load_cont_iter), .ENCLK(reg_Z0_net3598692), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_22 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enab_d_ff2_RB2), .ENCLK(reg_val_muxZ_2stage_net3598692), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_20 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(n266), .ENCLK(reg_shift_y_net3598692), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_19 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3598692), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_18 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3598692), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_16 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3598692), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W32_0_15 d_ff5_clk_gate_Q_reg ( .CLK(clk), .EN(
        enab_dff_5), .ENCLK(d_ff5_net3598692), .TE(1'b0) );
  DFFRXLTS cont_iter_count_reg_2_ ( .D(n476), .CK(cont_iter_net3598728), .RN(
        n472), .QN(n268) );
  DFFRXLTS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3598692), .RN(n472), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n441) );
  DFFRXLTS reg_ch_mux_2_Q_reg_0_ ( .D(n187), .CK(n473), .RN(n472), .Q(
        sel_mux_2_reg[0]), .QN(n439) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(data_out_LUT[0]), .CK(reg_shift_y_net3598692), 
        .RN(n472), .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(data_out_LUT[1]), .CK(reg_shift_y_net3598692), 
        .RN(n472), .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(data_out_LUT[2]), .CK(reg_shift_y_net3598692), 
        .RN(n471), .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_4_ ( .D(data_out_LUT[4]), .CK(reg_shift_y_net3598692), 
        .RN(n471), .Q(d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(data_out_LUT[6]), .CK(reg_shift_y_net3598692), 
        .RN(n471), .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(data_out_LUT[8]), .CK(reg_shift_y_net3598692), 
        .RN(n471), .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(data_out_LUT[9]), .CK(reg_shift_y_net3598692), 
        .RN(n471), .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(data_out_LUT[10]), .CK(
        reg_shift_y_net3598692), .RN(n471), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(data_out_LUT[11]), .CK(
        reg_shift_y_net3598692), .RN(n471), .Q(d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(data_out_LUT[12]), .CK(
        reg_shift_y_net3598692), .RN(n471), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(data_out_LUT[14]), .CK(
        reg_shift_y_net3598692), .RN(n471), .Q(d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(data_out_LUT[16]), .CK(
        reg_shift_y_net3598692), .RN(n471), .Q(d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(data_out_LUT[18]), .CK(
        reg_shift_y_net3598692), .RN(n471), .Q(d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(data_out_LUT[20]), .CK(
        reg_shift_y_net3598692), .RN(n471), .Q(d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(data_out_LUT[21]), .CK(
        reg_shift_y_net3598692), .RN(n464), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(data_out_LUT[22]), .CK(
        reg_shift_y_net3598692), .RN(n465), .Q(d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(data_out_LUT[23]), .CK(
        reg_shift_y_net3598692), .RN(n466), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(data_out_LUT[24]), .CK(
        reg_shift_y_net3598692), .RN(n459), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3598692), .RN(n469), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(data_out_LUT[26]), .CK(
        reg_shift_y_net3598692), .RN(n460), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3598692), .RN(n469), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3598692), .RN(n470), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3598692), .RN(n464), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3598692), .RN(n465), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3598692), .RN(n466), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3598692), .RN(n459), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3598692), .RN(n470), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3598692), .RN(n470), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3598692), .RN(n470), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3598692), .RN(n470), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3598692), .RN(
        n470), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3598692), .RN(
        n470), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3598692), .RN(
        n470), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3598692), .RN(
        n470), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3598692), .RN(
        n470), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3598692), .RN(
        n470), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3598692), .RN(
        n470), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3598692), .RN(
        n470), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3598692), .RN(
        n469), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3598692), .RN(
        n461), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3598692), .RN(
        n462), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3598692), .RN(n463), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3598692), .RN(n467), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3598692), .RN(n468), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3598692), .RN(n461), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3598692), .RN(n462), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3598692), .RN(n463), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3598692), .RN(n467), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3598692), .RN(n468), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3598692), .RN(n461), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3598692), .RN(n462), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3598692), .RN(n468), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3598692), .RN(n468), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3598692), .RN(n468), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3598692), .RN(n468), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3598692), .RN(n468), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3598692), .RN(n468), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3598692), .RN(n468), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n468), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3598692), 
        .RN(n468), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3598692), .RN(n468), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n468), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3598692), 
        .RN(n468), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3598692), .RN(n467), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n467), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3598692), 
        .RN(n467), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3598692), .RN(n467), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n467), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3598692), 
        .RN(n467), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3598692), .RN(n467), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n467), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3598692), 
        .RN(n467), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3598692), .RN(n467), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n467), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3598692), 
        .RN(n467), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3598692), .RN(n466), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n466), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3598692), 
        .RN(n466), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3598692), .RN(n466), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n466), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3598692), 
        .RN(n466), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3598692), .RN(n466), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n466), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3598692), 
        .RN(n466), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3598692), .RN(n466), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n466), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3598692), 
        .RN(n466), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3598692), .RN(n465), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n465), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3598692), .RN(n465), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3598692), .RN(n465), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n465), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3598692), .RN(n465), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3598692), .RN(n465), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n465), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3598692), .RN(n465), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3598692), .RN(n465), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n465), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3598692), .RN(n465), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3598692), .RN(n464), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n464), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3598692), .RN(n464), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3598692), .RN(n464), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n464), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3598692), .RN(n464), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3598692), .RN(n464), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n464), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3598692), .RN(n464), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3598692), .RN(n464), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n464), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3598692), .RN(n464), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3598692), .RN(n463), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n463), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3598692), .RN(n463), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3598692), .RN(n463), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n463), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3598692), .RN(n463), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3598692), .RN(n463), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n463), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3598692), .RN(n463), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3598692), .RN(n463), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n463), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3598692), .RN(n463), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3598692), .RN(n462), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n462), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3598692), .RN(n462), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3598692), .RN(n462), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n462), .Q(d_ff2_X[23]), .QN(n437)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3598692), .RN(n462), .Q(d_ff_Xn[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3598692), .RN(n462), .Q(d_ff_Xn[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3598692), .RN(n462), .Q(d_ff_Xn[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3598692), .RN(n462), .Q(d_ff_Xn[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3598692), .RN(n461), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n461), .Q(d_ff2_X[28]), .QN(n445)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3598692), .RN(n461), .Q(d_ff_Xn[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3598692), .RN(n461), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n461), .Q(d_ff2_X[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3598692), .RN(n461), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n461), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3598692), .RN(n461), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3598692), .RN(n461), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n461), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3598692), 
        .RN(n460), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3598692), .RN(n460), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n460), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3598692), 
        .RN(n460), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3598692), .RN(n460), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n460), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3598692), 
        .RN(n460), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3598692), .RN(n460), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n460), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3598692), 
        .RN(n460), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3598692), .RN(n460), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n460), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3598692), 
        .RN(n470), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3598692), .RN(n469), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n470), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3598692), 
        .RN(n469), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3598692), .RN(n470), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n469), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3598692), 
        .RN(n470), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3598692), .RN(n469), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n470), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3598692), 
        .RN(n469), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3598692), .RN(n470), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n460), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3598692), 
        .RN(n459), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3598692), .RN(n459), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n459), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3598692), 
        .RN(n459), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3598692), .RN(n459), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n459), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3598692), .RN(n459), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3598692), .RN(n459), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n459), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3598692), .RN(n459), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3598692), .RN(n459), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n459), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3598692), .RN(n458), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3598692), .RN(n458), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n458), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3598692), .RN(n458), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3598692), .RN(n458), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n458), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3598692), .RN(n458), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3598692), .RN(n458), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n458), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3598692), .RN(n458), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3598692), .RN(n458), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n458), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3598692), .RN(n457), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3598692), .RN(n457), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n457), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3598692), .RN(n457), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3598692), .RN(n457), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n457), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3598692), .RN(n457), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3598692), .RN(n457), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n457), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3598692), .RN(n457), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3598692), .RN(n457), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n457), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3598692), .RN(n456), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3598692), .RN(n456), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n456), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3598692), .RN(n456), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3598692), .RN(n456), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n456), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3598692), .RN(n456), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3598692), .RN(n456), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n456), .Q(d_ff2_Y[23]), .QN(n436)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3598692), .RN(n456), .Q(d_ff_Yn[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3598692), .RN(n456), .Q(d_ff_Yn[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3598692), .RN(n455), .Q(d_ff_Yn[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3598692), .RN(n455), .Q(d_ff_Yn[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3598692), .RN(n455), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n455), .Q(d_ff2_Y[28]), .QN(n444)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3598692), .RN(n455), .Q(d_ff_Yn[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3598692), .RN(n455), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n455), .Q(d_ff2_Y[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3598692), .RN(n455), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n454), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3598692), .RN(n454), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3598692), .RN(n454), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n454), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3598692), .RN(n454), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n454), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3598692), .RN(n454), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n454), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3598692), .RN(n454), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n454), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3598692), .RN(n454), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n454), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3598692), .RN(n453), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n453), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3598692), .RN(n453), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n453), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3598692), .RN(n453), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n453), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3598692), .RN(n453), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n453), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3598692), .RN(n453), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n453), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3598692), .RN(n453), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n453), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3598692), .RN(n452), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n452), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3598692), .RN(n452), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n452), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3598692), .RN(n452), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n452), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3598692), .RN(n452), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n452), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3598692), .RN(n452), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n452), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3598692), .RN(n452), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n452), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3598692), .RN(n451), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n451), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3598692), .RN(n451), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n451), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3598692), .RN(n451), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n451), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3598692), .RN(n451), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n451), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3598692), .RN(n451), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n451), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3598692), .RN(n451), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n451), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3598692), .RN(n450), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n450), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3598692), .RN(n450), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n450), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3598692), .RN(n450), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n450), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3598692), .RN(n450), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n450), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3598692), .RN(n450), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n450), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3598692), .RN(n450), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n450), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3598692), .RN(n456), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n457), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3598692), .RN(n458), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n450), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3598692), .RN(n451), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n452), .Q(d_ff2_Z[31]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[31]), .CK(reg_shift_y_net3598692), 
        .RN(n448), .Q(d_ff3_sign_out) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(mux_sal[0]), .CK(d_ff5_net3598692), .RN(n449), 
        .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(sign_inv_out[0]), .CK(
        d_ff5_data_out_net3598692), .RN(n456), .Q(data_output[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(mux_sal[1]), .CK(d_ff5_net3598692), .RN(n457), 
        .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(sign_inv_out[1]), .CK(
        d_ff5_data_out_net3598692), .RN(n458), .Q(data_output[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(mux_sal[2]), .CK(d_ff5_net3598692), .RN(n450), 
        .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(sign_inv_out[2]), .CK(
        d_ff5_data_out_net3598692), .RN(n449), .Q(data_output[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(mux_sal[3]), .CK(d_ff5_net3598692), .RN(n449), 
        .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(sign_inv_out[3]), .CK(
        d_ff5_data_out_net3598692), .RN(n449), .Q(data_output[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(mux_sal[4]), .CK(d_ff5_net3598692), .RN(n449), 
        .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(sign_inv_out[4]), .CK(
        d_ff5_data_out_net3598692), .RN(n449), .Q(data_output[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(mux_sal[5]), .CK(d_ff5_net3598692), .RN(n449), 
        .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(sign_inv_out[5]), .CK(
        d_ff5_data_out_net3598692), .RN(n449), .Q(data_output[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(mux_sal[6]), .CK(d_ff5_net3598692), .RN(n449), 
        .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(sign_inv_out[6]), .CK(
        d_ff5_data_out_net3598692), .RN(n449), .Q(data_output[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(mux_sal[7]), .CK(d_ff5_net3598692), .RN(n449), 
        .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(sign_inv_out[7]), .CK(
        d_ff5_data_out_net3598692), .RN(n449), .Q(data_output[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(mux_sal[8]), .CK(d_ff5_net3598692), .RN(n449), 
        .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(sign_inv_out[8]), .CK(
        d_ff5_data_out_net3598692), .RN(n448), .Q(data_output[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(mux_sal[9]), .CK(d_ff5_net3598692), .RN(n448), 
        .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(sign_inv_out[9]), .CK(
        d_ff5_data_out_net3598692), .RN(n448), .Q(data_output[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(mux_sal[10]), .CK(d_ff5_net3598692), .RN(n448), 
        .Q(sign_inv_out[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(sign_inv_out[10]), .CK(
        d_ff5_data_out_net3598692), .RN(n448), .Q(data_output[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(mux_sal[11]), .CK(d_ff5_net3598692), .RN(n448), 
        .Q(sign_inv_out[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(sign_inv_out[11]), .CK(
        d_ff5_data_out_net3598692), .RN(n448), .Q(data_output[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(mux_sal[12]), .CK(d_ff5_net3598692), .RN(n448), 
        .Q(sign_inv_out[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(sign_inv_out[12]), .CK(
        d_ff5_data_out_net3598692), .RN(n448), .Q(data_output[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(mux_sal[13]), .CK(d_ff5_net3598692), .RN(n448), 
        .Q(sign_inv_out[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(sign_inv_out[13]), .CK(
        d_ff5_data_out_net3598692), .RN(n448), .Q(data_output[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(mux_sal[14]), .CK(d_ff5_net3598692), .RN(n448), 
        .Q(sign_inv_out[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(sign_inv_out[14]), .CK(
        d_ff5_data_out_net3598692), .RN(n453), .Q(data_output[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(mux_sal[15]), .CK(d_ff5_net3598692), .RN(n454), 
        .Q(sign_inv_out[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(sign_inv_out[15]), .CK(
        d_ff5_data_out_net3598692), .RN(n455), .Q(data_output[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(mux_sal[16]), .CK(d_ff5_net3598692), .RN(n447), 
        .Q(sign_inv_out[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(sign_inv_out[16]), .CK(
        d_ff5_data_out_net3598692), .RN(n451), .Q(data_output[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(mux_sal[17]), .CK(d_ff5_net3598692), .RN(n453), 
        .Q(sign_inv_out[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(sign_inv_out[17]), .CK(
        d_ff5_data_out_net3598692), .RN(n454), .Q(data_output[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(mux_sal[18]), .CK(d_ff5_net3598692), .RN(n455), 
        .Q(sign_inv_out[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(sign_inv_out[18]), .CK(
        d_ff5_data_out_net3598692), .RN(n447), .Q(data_output[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(mux_sal[19]), .CK(d_ff5_net3598692), .RN(n457), 
        .Q(sign_inv_out[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(sign_inv_out[19]), .CK(
        d_ff5_data_out_net3598692), .RN(n453), .Q(data_output[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(mux_sal[20]), .CK(d_ff5_net3598692), .RN(n454), 
        .Q(sign_inv_out[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(sign_inv_out[20]), .CK(
        d_ff5_data_out_net3598692), .RN(n466), .Q(data_output[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(mux_sal[21]), .CK(d_ff5_net3598692), .RN(n450), 
        .Q(sign_inv_out[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(sign_inv_out[21]), .CK(
        d_ff5_data_out_net3598692), .RN(n458), .Q(data_output[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(mux_sal[22]), .CK(d_ff5_net3598692), .RN(n456), 
        .Q(sign_inv_out[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(sign_inv_out[22]), .CK(
        d_ff5_data_out_net3598692), .RN(n451), .Q(data_output[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(mux_sal[23]), .CK(d_ff5_net3598692), .RN(n448), 
        .Q(sign_inv_out[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(sign_inv_out[23]), .CK(
        d_ff5_data_out_net3598692), .RN(n449), .Q(data_output[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(mux_sal[24]), .CK(d_ff5_net3598692), .RN(n452), 
        .Q(sign_inv_out[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(sign_inv_out[24]), .CK(
        d_ff5_data_out_net3598692), .RN(n464), .Q(data_output[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(mux_sal[25]), .CK(d_ff5_net3598692), .RN(n447), 
        .Q(sign_inv_out[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(sign_inv_out[25]), .CK(
        d_ff5_data_out_net3598692), .RN(n455), .Q(data_output[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(mux_sal[26]), .CK(d_ff5_net3598692), .RN(n448), 
        .Q(sign_inv_out[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(sign_inv_out[26]), .CK(
        d_ff5_data_out_net3598692), .RN(n447), .Q(data_output[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(mux_sal[27]), .CK(d_ff5_net3598692), .RN(n447), 
        .Q(sign_inv_out[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(sign_inv_out[27]), .CK(
        d_ff5_data_out_net3598692), .RN(n447), .Q(data_output[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(mux_sal[28]), .CK(d_ff5_net3598692), .RN(n447), 
        .Q(sign_inv_out[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(sign_inv_out[28]), .CK(
        d_ff5_data_out_net3598692), .RN(n447), .Q(data_output[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(mux_sal[29]), .CK(d_ff5_net3598692), .RN(n447), 
        .Q(sign_inv_out[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(sign_inv_out[29]), .CK(
        d_ff5_data_out_net3598692), .RN(n447), .Q(data_output[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(mux_sal[30]), .CK(d_ff5_net3598692), .RN(n447), 
        .Q(sign_inv_out[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(sign_inv_out[30]), .CK(
        d_ff5_data_out_net3598692), .RN(n447), .Q(data_output[30]) );
  DFFRXLTS d_ff5_Q_reg_31_ ( .D(mux_sal[31]), .CK(d_ff5_net3598692), .RN(n447), 
        .Q(data_output2_31_) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(sign_inv_out[31]), .CK(
        d_ff5_data_out_net3598692), .RN(n447), .Q(data_output[31]) );
  SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W32_EW8_SW23_SWR26_EWR5_1 clk_gate_reg_ch_mux_2_Q_reg ( 
        .CLK(clk), .EN(n475), .ENCLK(n473), .TE(1'b0) );
  CMPR32X2TS intadd_415_U3 ( .A(d_ff2_X[25]), .B(data_out_LUT[8]), .C(
        intadd_415_n3), .CO(intadd_415_n2), .S(sh_exp_x[2]) );
  CMPR32X2TS intadd_416_U3 ( .A(d_ff2_Y[25]), .B(data_out_LUT[8]), .C(
        intadd_416_n3), .CO(intadd_416_n2), .S(sh_exp_y[2]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(1'b1), .CK(reg_shift_y_net3598692), .RN(n447), .Q(d_ff3_LUT_out[27]) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n194), .CK(n473), .RN(n471), .Q(
        cont_var_out[1]), .QN(n440) );
  DFFRX2TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n180), .Q(cordic_FSM_state_reg[1]), .QN(n438) );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n479), .CK(cont_iter_net3598728), .RN(
        n472), .Q(cont_iter_out[3]), .QN(n432) );
  DFFRX4TS cont_iter_count_reg_0_ ( .D(n478), .CK(cont_iter_net3598728), .RN(
        n471), .Q(n446), .QN(n269) );
  DFFRX4TS cont_iter_count_reg_1_ ( .D(n477), .CK(cont_iter_net3598728), .RN(
        n472), .Q(cont_iter_out[1]), .QN(n434) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n461), .Q(d_ff2_X[27]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n455), .Q(d_ff2_Y[27]) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n186), .CK(n473), .RN(n472), .Q(
        sel_mux_2_reg[1]) );
  DFFRX1TS cont_var_count_reg_0_ ( .D(n193), .CK(n473), .RN(n472), .Q(
        cont_var_out[0]) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3598692), .RN(n472), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n461), .Q(d_ff2_X[29]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n455), .Q(d_ff2_Y[29]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n462), .Q(d_ff2_X[26]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n462), .Q(d_ff2_X[25]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n462), .Q(d_ff2_X[24]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n455), .Q(d_ff2_Y[26]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n455), .Q(d_ff2_Y[25]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3598692), .RN(n456), .Q(d_ff2_Y[24]) );
  DFFRX4TS cordic_FSM_state_reg_reg_0_ ( .D(n197), .CK(clk), .RN(n180), .Q(
        cordic_FSM_state_reg[0]), .QN(n435) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3598692), 
        .RN(n472), .Q(d_ff1_operation_out) );
  DFFRX4TS cordic_FSM_state_reg_reg_3_ ( .D(n195), .CK(n473), .RN(n180), .Q(
        n264), .QN(n433) );
  ADDFX1TS intadd_415_U4 ( .A(d_ff2_X[24]), .B(n434), .CI(intadd_415_CI), .CO(
        intadd_415_n3), .S(sh_exp_x[1]) );
  ADDFX1TS intadd_416_U4 ( .A(d_ff2_Y[24]), .B(n434), .CI(intadd_416_CI), .CO(
        intadd_416_n3), .S(sh_exp_y[1]) );
  DFFRX4TS cordic_FSM_state_reg_reg_2_ ( .D(n196), .CK(clk), .RN(n180), .Q(
        cordic_FSM_state_reg[2]) );
  DFFRX4TS reg_ch_mux_3_Q_reg_0_ ( .D(n189), .CK(n473), .RN(n472), .Q(n263), 
        .QN(n443) );
  CMPR32X2TS intadd_416_U2 ( .A(d_ff2_Y[26]), .B(n432), .C(intadd_416_n2), 
        .CO(intadd_416_n1), .S(sh_exp_y[3]) );
  CMPR32X2TS intadd_415_U2 ( .A(d_ff2_X[26]), .B(n432), .C(intadd_415_n2), 
        .CO(intadd_415_n1), .S(sh_exp_x[3]) );
  DFFRX4TS reg_ch_mux_1_Q_reg_0_ ( .D(n188), .CK(n473), .RN(n472), .Q(
        sel_mux_1_reg), .QN(n442) );
  AOI222X1TS U437 ( .A0(n417), .A1(d_ff2_Z[30]), .B0(n414), .B1(d_ff2_Y[30]), 
        .C0(n345), .C1(d_ff2_X[30]), .Y(n344) );
  AOI222X1TS U438 ( .A0(n425), .A1(d_ff3_LUT_out[9]), .B0(n410), .B1(
        d_ff3_sh_x_out[9]), .C0(n399), .C1(d_ff3_sh_y_out[9]), .Y(n311) );
  AOI222X1TS U439 ( .A0(n425), .A1(d_ff3_LUT_out[8]), .B0(n410), .B1(
        d_ff3_sh_x_out[8]), .C0(n422), .C1(d_ff3_sh_y_out[8]), .Y(n300) );
  AOI222X1TS U440 ( .A0(n425), .A1(d_ff3_LUT_out[25]), .B0(n410), .B1(
        d_ff3_sh_x_out[25]), .C0(n345), .C1(d_ff3_sh_y_out[25]), .Y(n310) );
  AOI222X1TS U441 ( .A0(n425), .A1(d_ff3_LUT_out[23]), .B0(n410), .B1(
        d_ff3_sh_x_out[23]), .C0(n345), .C1(d_ff3_sh_y_out[23]), .Y(n309) );
  AOI222X1TS U442 ( .A0(n425), .A1(d_ff3_LUT_out[24]), .B0(n410), .B1(
        d_ff3_sh_x_out[24]), .C0(n345), .C1(d_ff3_sh_y_out[24]), .Y(n308) );
  AOI222X1TS U443 ( .A0(n425), .A1(d_ff3_LUT_out[26]), .B0(n410), .B1(
        d_ff3_sh_x_out[26]), .C0(n345), .C1(d_ff3_sh_y_out[26]), .Y(n307) );
  AOI222X1TS U444 ( .A0(n425), .A1(d_ff3_LUT_out[21]), .B0(n410), .B1(
        d_ff3_sh_x_out[21]), .C0(n345), .C1(d_ff3_sh_y_out[21]), .Y(n306) );
  AOI222X1TS U445 ( .A0(n425), .A1(d_ff3_LUT_out[12]), .B0(n410), .B1(
        d_ff3_sh_x_out[12]), .C0(n345), .C1(d_ff3_sh_y_out[12]), .Y(n304) );
  NOR2XLTS U446 ( .A(sel_mux_2_reg[1]), .B(n439), .Y(n291) );
  BUFX4TS U447 ( .A(n270), .Y(n279) );
  INVX2TS U448 ( .A(cordic_FSM_state_reg[2]), .Y(n370) );
  NOR2X1TS U449 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n292) );
  AOI222X1TS U450 ( .A0(n417), .A1(d_ff3_LUT_out[10]), .B0(n410), .B1(
        d_ff3_sh_x_out[10]), .C0(n345), .C1(d_ff3_sh_y_out[10]), .Y(n305) );
  AOI222X1TS U451 ( .A0(n327), .A1(d_ff2_Z[3]), .B0(n410), .B1(d_ff2_Y[3]), 
        .C0(n422), .C1(d_ff2_X[3]), .Y(n299) );
  AOI222X1TS U452 ( .A0(n327), .A1(d_ff2_Z[6]), .B0(n410), .B1(d_ff2_Y[6]), 
        .C0(n422), .C1(d_ff2_X[6]), .Y(n301) );
  AOI222X1TS U453 ( .A0(n327), .A1(d_ff2_Z[7]), .B0(n410), .B1(d_ff2_Y[7]), 
        .C0(n422), .C1(d_ff2_X[7]), .Y(n293) );
  AOI222X1TS U454 ( .A0(n327), .A1(d_ff2_Z[8]), .B0(n410), .B1(d_ff2_Y[8]), 
        .C0(n422), .C1(d_ff2_X[8]), .Y(n294) );
  AOI222X1TS U455 ( .A0(n327), .A1(d_ff2_Z[9]), .B0(n410), .B1(d_ff2_Y[9]), 
        .C0(n422), .C1(d_ff2_X[9]), .Y(n297) );
  AOI222X1TS U456 ( .A0(n327), .A1(d_ff2_Z[10]), .B0(n410), .B1(d_ff2_Y[10]), 
        .C0(n422), .C1(d_ff2_X[10]), .Y(n298) );
  AOI222X1TS U457 ( .A0(n348), .A1(d_ff2_Z[16]), .B0(n423), .B1(d_ff2_Y[16]), 
        .C0(n399), .C1(d_ff2_X[16]), .Y(n330) );
  AOI222X1TS U458 ( .A0(n348), .A1(d_ff2_Z[17]), .B0(n423), .B1(d_ff2_Y[17]), 
        .C0(n399), .C1(d_ff2_X[17]), .Y(n331) );
  AOI222X1TS U459 ( .A0(n348), .A1(d_ff2_Z[18]), .B0(n423), .B1(d_ff2_Y[18]), 
        .C0(n399), .C1(d_ff2_X[18]), .Y(n332) );
  AOI222X1TS U460 ( .A0(n348), .A1(d_ff2_Z[19]), .B0(n423), .B1(d_ff2_Y[19]), 
        .C0(n399), .C1(d_ff2_X[19]), .Y(n333) );
  AOI222X1TS U461 ( .A0(n348), .A1(d_ff2_Z[23]), .B0(n423), .B1(d_ff2_Y[23]), 
        .C0(n399), .C1(d_ff2_X[23]), .Y(n337) );
  AOI222X1TS U462 ( .A0(n348), .A1(d_ff2_Z[24]), .B0(n414), .B1(d_ff2_Y[24]), 
        .C0(n345), .C1(d_ff2_X[24]), .Y(n338) );
  AOI222X1TS U463 ( .A0(n417), .A1(d_ff2_Z[25]), .B0(n414), .B1(d_ff2_Y[25]), 
        .C0(n345), .C1(d_ff2_X[25]), .Y(n339) );
  AOI222X1TS U464 ( .A0(n417), .A1(d_ff2_Z[26]), .B0(n414), .B1(d_ff2_Y[26]), 
        .C0(n345), .C1(d_ff2_X[26]), .Y(n319) );
  AOI222X1TS U465 ( .A0(n417), .A1(d_ff2_Z[27]), .B0(n414), .B1(d_ff2_Y[27]), 
        .C0(n345), .C1(d_ff2_X[27]), .Y(n341) );
  AOI222X1TS U466 ( .A0(n417), .A1(d_ff2_Z[29]), .B0(n414), .B1(d_ff2_Y[29]), 
        .C0(n345), .C1(d_ff2_X[29]), .Y(n343) );
  OAI32X1TS U467 ( .A0(n361), .A1(n316), .A2(n440), .B0(n364), .B1(n287), .Y(
        n186) );
  NAND2BXLTS U468 ( .AN(n387), .B(n386), .Y(data_out_LUT[1]) );
  OAI31X1TS U469 ( .A0(cordic_FSM_state_reg[2]), .A1(n278), .A2(n435), .B0(
        n277), .Y(n196) );
  OR4X2TS U470 ( .A(n264), .B(cordic_FSM_state_reg[1]), .C(n370), .D(n435), 
        .Y(n265) );
  INVX2TS U471 ( .A(n265), .Y(n266) );
  NOR4X1TS U472 ( .A(cordic_FSM_state_reg[1]), .B(n370), .C(n433), .D(n435), 
        .Y(ready_cordic) );
  AOI222X1TS U473 ( .A0(n391), .A1(cont_iter_out[1]), .B0(n391), .B1(n446), 
        .C0(cont_iter_out[3]), .C1(n434), .Y(data_out_LUT[4]) );
  AOI222X1TS U474 ( .A0(n370), .A1(cordic_FSM_state_reg[1]), .B0(n370), .B1(
        n316), .C0(n438), .C1(n435), .Y(n272) );
  AOI31X2TS U475 ( .A0(n382), .A1(n269), .A2(n434), .B0(n275), .Y(n392) );
  CLKINVX6TS U476 ( .A(n281), .Y(n396) );
  AOI222X1TS U477 ( .A0(n425), .A1(d_ff3_LUT_out[4]), .B0(n414), .B1(
        d_ff3_sh_x_out[4]), .C0(n345), .C1(d_ff3_sh_y_out[4]), .Y(n320) );
  AOI222X1TS U478 ( .A0(n417), .A1(d_ff2_Z[28]), .B0(n414), .B1(d_ff2_Y[28]), 
        .C0(n345), .C1(d_ff2_X[28]), .Y(n342) );
  BUFX6TS U479 ( .A(n422), .Y(n345) );
  NOR3X2TS U480 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n438), .Y(n369) );
  BUFX4TS U481 ( .A(n348), .Y(n417) );
  BUFX4TS U482 ( .A(n295), .Y(n348) );
  AOI222X4TS U483 ( .A0(n425), .A1(d_ff3_LUT_out[6]), .B0(n414), .B1(
        d_ff3_sh_x_out[6]), .C0(n422), .C1(d_ff3_sh_y_out[6]), .Y(n296) );
  BUFX6TS U484 ( .A(n419), .Y(n414) );
  BUFX4TS U485 ( .A(n419), .Y(n410) );
  BUFX4TS U486 ( .A(n399), .Y(n418) );
  AOI222X1TS U487 ( .A0(n327), .A1(d_ff2_Z[12]), .B0(n423), .B1(d_ff2_Y[12]), 
        .C0(n399), .C1(d_ff2_X[12]), .Y(n325) );
  AOI222X1TS U488 ( .A0(n327), .A1(d_ff2_Z[11]), .B0(n423), .B1(d_ff2_Y[11]), 
        .C0(n399), .C1(d_ff2_X[11]), .Y(n328) );
  BUFX4TS U489 ( .A(n422), .Y(n399) );
  CLKINVX6TS U490 ( .A(n363), .Y(n469) );
  NOR4X2TS U491 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[2]), 
        .C(n433), .D(n435), .Y(ack_add_subt) );
  AND4X2TS U492 ( .A(n433), .B(n370), .C(n438), .D(n435), .Y(n270) );
  NAND3X2TS U493 ( .A(cordic_FSM_state_reg[2]), .B(n438), .C(n435), .Y(n475)
         );
  BUFX4TS U494 ( .A(n281), .Y(n371) );
  AOI32X4TS U495 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(n441), .A2(
        d_ff1_operation_out), .B0(n376), .B1(d_ff1_shift_region_flag_out[0]), 
        .Y(n377) );
  NOR4X2TS U496 ( .A(n264), .B(cordic_FSM_state_reg[0]), .C(n370), .D(n438), 
        .Y(n364) );
  NAND2X2TS U497 ( .A(n391), .B(cont_iter_out[3]), .Y(data_out_LUT[22]) );
  NOR4X2TS U498 ( .A(n391), .B(cont_iter_out[3]), .C(n446), .D(
        cont_iter_out[1]), .Y(n387) );
  INVX4TS U499 ( .A(n268), .Y(n391) );
  CLKINVX6TS U500 ( .A(n363), .Y(n470) );
  BUFX3TS U501 ( .A(n279), .Y(n363) );
  NOR2XLTS U502 ( .A(n264), .B(n475), .Y(enab_d_ff2_RB2) );
  AOI211XLTS U503 ( .A0(cont_var_out[1]), .A1(n290), .B0(n266), .C0(n289), .Y(
        n194) );
  INVX2TS U504 ( .A(n391), .Y(data_out_LUT[8]) );
  NAND2X1TS U505 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n280) );
  NOR3X1TS U506 ( .A(n264), .B(n370), .C(n280), .Y(beg_add_subt) );
  NAND2X2TS U507 ( .A(n446), .B(cont_iter_out[1]), .Y(n390) );
  NOR2X2TS U508 ( .A(data_out_LUT[22]), .B(n390), .Y(n316) );
  NAND4BX1TS U509 ( .AN(ack_cordic), .B(cordic_FSM_state_reg[2]), .C(n264), 
        .D(n438), .Y(n353) );
  INVX2TS U510 ( .A(beg_add_subt), .Y(n271) );
  OAI211XLTS U511 ( .A0(n272), .A1(n433), .B0(n353), .C0(n271), .Y(n195) );
  INVX4TS U512 ( .A(n363), .Y(n460) );
  INVX4TS U513 ( .A(n279), .Y(n464) );
  INVX4TS U514 ( .A(n363), .Y(n459) );
  INVX4TS U515 ( .A(n363), .Y(n463) );
  INVX4TS U516 ( .A(n279), .Y(n461) );
  INVX4TS U517 ( .A(n270), .Y(n462) );
  INVX4TS U518 ( .A(n270), .Y(n468) );
  INVX4TS U519 ( .A(n270), .Y(n467) );
  INVX4TS U520 ( .A(n279), .Y(n465) );
  INVX4TS U521 ( .A(n279), .Y(n448) );
  INVX4TS U522 ( .A(n279), .Y(n449) );
  INVX4TS U523 ( .A(n279), .Y(n452) );
  INVX4TS U524 ( .A(n279), .Y(n453) );
  INVX4TS U525 ( .A(n279), .Y(n447) );
  INVX4TS U526 ( .A(n363), .Y(n454) );
  INVX4TS U527 ( .A(n363), .Y(n455) );
  NOR3XLTS U528 ( .A(cordic_FSM_state_reg[2]), .B(n433), .C(n280), .Y(
        enab_dff_5) );
  INVX2TS U529 ( .A(sel_mux_1_reg), .Y(n281) );
  INVX2TS U530 ( .A(n281), .Y(n393) );
  AO22XLTS U531 ( .A0(n393), .A1(d_ff_Zn[13]), .B0(n442), .B1(d_ff1_Z[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U532 ( .A0(n393), .A1(d_ff_Zn[7]), .B0(n442), .B1(d_ff1_Z[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U533 ( .A0(n393), .A1(d_ff_Zn[15]), .B0(n442), .B1(d_ff1_Z[15]), 
        .Y(first_mux_Z[15]) );
  INVX4TS U534 ( .A(n281), .Y(n394) );
  AO22XLTS U535 ( .A0(n394), .A1(d_ff_Zn[14]), .B0(n442), .B1(d_ff1_Z[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U536 ( .A0(n394), .A1(d_ff_Zn[12]), .B0(n442), .B1(d_ff1_Z[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U537 ( .A0(n394), .A1(d_ff_Zn[4]), .B0(n442), .B1(d_ff1_Z[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U538 ( .A0(n394), .A1(d_ff_Zn[6]), .B0(n442), .B1(d_ff1_Z[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U539 ( .A0(n394), .A1(d_ff_Zn[16]), .B0(n442), .B1(d_ff1_Z[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U540 ( .A0(n394), .A1(d_ff_Zn[10]), .B0(n442), .B1(d_ff1_Z[10]), 
        .Y(first_mux_Z[10]) );
  INVX4TS U541 ( .A(n281), .Y(n397) );
  AO22XLTS U542 ( .A0(n397), .A1(d_ff_Zn[9]), .B0(n442), .B1(d_ff1_Z[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U543 ( .A0(n397), .A1(d_ff_Zn[11]), .B0(n442), .B1(d_ff1_Z[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U544 ( .A0(n397), .A1(d_ff_Zn[8]), .B0(n442), .B1(d_ff1_Z[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U545 ( .A0(n397), .A1(d_ff_Zn[5]), .B0(n442), .B1(d_ff1_Z[5]), .Y(
        first_mux_Z[5]) );
  NOR2XLTS U546 ( .A(n433), .B(n475), .Y(enab_d_ff5_data_out) );
  INVX2TS U547 ( .A(n390), .Y(n274) );
  AOI221XLTS U548 ( .A0(n391), .A1(n274), .B0(data_out_LUT[8]), .B1(n390), 
        .C0(n435), .Y(n476) );
  NOR2X2TS U549 ( .A(n391), .B(n432), .Y(n382) );
  NOR2X2TS U550 ( .A(cont_iter_out[3]), .B(data_out_LUT[8]), .Y(n389) );
  NOR2X2TS U551 ( .A(n382), .B(n389), .Y(n386) );
  OAI21X1TS U552 ( .A0(n391), .A1(n434), .B0(n386), .Y(data_out_LUT[20]) );
  OR2X1TS U553 ( .A(data_out_LUT[20]), .B(n387), .Y(data_out_LUT[11]) );
  NAND2X1TS U554 ( .A(n274), .B(n389), .Y(n359) );
  INVX2TS U555 ( .A(n359), .Y(n275) );
  AOI33X1TS U556 ( .A0(n446), .A1(cont_iter_out[1]), .A2(data_out_LUT[8]), 
        .B0(n434), .B1(n432), .B2(n269), .Y(n381) );
  OAI211XLTS U557 ( .A0(cont_iter_out[1]), .A1(data_out_LUT[22]), .B0(n392), 
        .C0(n381), .Y(data_out_LUT[24]) );
  INVX4TS U558 ( .A(n279), .Y(n471) );
  INVX4TS U559 ( .A(n279), .Y(n472) );
  INVX2TS U560 ( .A(n316), .Y(n303) );
  INVX2TS U561 ( .A(cont_var_out[0]), .Y(n312) );
  NAND2X1TS U562 ( .A(cont_var_out[1]), .B(n312), .Y(n350) );
  AOI31XLTS U563 ( .A0(n264), .A1(n303), .A2(n350), .B0(
        cordic_FSM_state_reg[1]), .Y(n278) );
  OAI2BB2XLTS U564 ( .B0(cordic_FSM_state_reg[1]), .B1(ack_cordic), .A0N(n433), 
        .A1N(n280), .Y(n276) );
  INVX2TS U565 ( .A(n475), .Y(n355) );
  AOI21X1TS U566 ( .A0(cordic_FSM_state_reg[2]), .A1(n276), .B0(n355), .Y(n277) );
  INVX4TS U567 ( .A(n279), .Y(n466) );
  INVX4TS U568 ( .A(n279), .Y(n458) );
  INVX4TS U569 ( .A(n270), .Y(n457) );
  INVX4TS U570 ( .A(n270), .Y(n450) );
  INVX4TS U571 ( .A(n279), .Y(n451) );
  INVX4TS U572 ( .A(n270), .Y(n456) );
  INVX2TS U573 ( .A(rst), .Y(n180) );
  NAND2X1TS U574 ( .A(n437), .B(n446), .Y(intadd_415_CI) );
  OAI21XLTS U575 ( .A0(n446), .A1(n437), .B0(intadd_415_CI), .Y(sh_exp_x[0])
         );
  NAND2X1TS U576 ( .A(n436), .B(n446), .Y(intadd_416_CI) );
  OAI21XLTS U577 ( .A0(n446), .A1(n436), .B0(intadd_416_CI), .Y(sh_exp_y[0])
         );
  NOR2X1TS U578 ( .A(data_out_LUT[8]), .B(n390), .Y(n360) );
  NOR2XLTS U579 ( .A(cont_iter_out[3]), .B(n360), .Y(data_out_LUT[26]) );
  NOR2X1TS U580 ( .A(d_ff2_X[27]), .B(intadd_415_n1), .Y(n431) );
  OR3X1TS U581 ( .A(d_ff2_X[28]), .B(d_ff2_X[27]), .C(intadd_415_n1), .Y(n430)
         );
  OAI21XLTS U582 ( .A0(n431), .A1(n445), .B0(n430), .Y(sh_exp_x[5]) );
  NOR2X1TS U583 ( .A(d_ff2_Y[27]), .B(intadd_416_n1), .Y(n428) );
  OR3X1TS U584 ( .A(d_ff2_Y[28]), .B(d_ff2_Y[27]), .C(intadd_416_n1), .Y(n427)
         );
  OAI21XLTS U585 ( .A0(n428), .A1(n444), .B0(n427), .Y(sh_exp_y[5]) );
  NOR3X1TS U586 ( .A(n264), .B(cordic_FSM_state_reg[2]), .C(n280), .Y(n283) );
  INVX2TS U587 ( .A(n283), .Y(n282) );
  OAI32X1TS U588 ( .A0(n283), .A1(n363), .A2(n371), .B0(n387), .B1(n282), .Y(
        n188) );
  OAI21X1TS U589 ( .A0(n391), .A1(cont_iter_out[1]), .B0(n386), .Y(
        data_out_LUT[16]) );
  OAI21X1TS U590 ( .A0(n391), .A1(n269), .B0(n386), .Y(data_out_LUT[18]) );
  NAND4XLTS U591 ( .A(n264), .B(cordic_FSM_state_reg[1]), .C(n370), .D(n435), 
        .Y(n286) );
  NOR2X1TS U592 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), 
        .Y(n376) );
  AOI21X1TS U593 ( .A0(d_ff1_operation_out), .A1(
        d_ff1_shift_region_flag_out[1]), .B0(n376), .Y(n284) );
  XNOR2X1TS U594 ( .A(d_ff1_shift_region_flag_out[0]), .B(n284), .Y(n302) );
  NAND3XLTS U595 ( .A(n263), .B(n471), .C(n286), .Y(n285) );
  OAI21XLTS U596 ( .A0(n286), .A1(n302), .B0(n285), .Y(n189) );
  INVX2TS U597 ( .A(n364), .Y(n361) );
  NAND2X1TS U598 ( .A(sel_mux_2_reg[1]), .B(n472), .Y(n287) );
  CLKAND2X2TS U599 ( .A(n369), .B(n433), .Y(load_cont_iter) );
  NAND2X1TS U600 ( .A(ack_add_subt), .B(n303), .Y(n351) );
  AOI21X1TS U601 ( .A0(n350), .A1(n312), .B0(n351), .Y(n288) );
  AOI211XLTS U602 ( .A0(n351), .A1(n312), .B0(n266), .C0(n288), .Y(n193) );
  NOR2X1TS U603 ( .A(n312), .B(n351), .Y(n290) );
  NOR2XLTS U604 ( .A(cont_var_out[1]), .B(n290), .Y(n289) );
  NOR2BX1TS U605 ( .AN(sel_mux_2_reg[1]), .B(sel_mux_2_reg[0]), .Y(n295) );
  BUFX3TS U606 ( .A(n348), .Y(n327) );
  BUFX3TS U607 ( .A(n291), .Y(n419) );
  BUFX4TS U608 ( .A(n292), .Y(n422) );
  INVX2TS U609 ( .A(n293), .Y(add_subt_dataA[7]) );
  INVX2TS U610 ( .A(n294), .Y(add_subt_dataA[8]) );
  BUFX4TS U611 ( .A(n295), .Y(n425) );
  INVX2TS U612 ( .A(n296), .Y(add_subt_dataB[6]) );
  INVX2TS U613 ( .A(n297), .Y(add_subt_dataA[9]) );
  INVX2TS U614 ( .A(n298), .Y(add_subt_dataA[10]) );
  INVX2TS U615 ( .A(n299), .Y(add_subt_dataA[3]) );
  INVX2TS U616 ( .A(n300), .Y(add_subt_dataB[8]) );
  INVX2TS U617 ( .A(n301), .Y(add_subt_dataA[6]) );
  NOR2X1TS U618 ( .A(n303), .B(n302), .Y(n314) );
  AOI21X1TS U619 ( .A0(cont_var_out[0]), .A1(n303), .B0(n314), .Y(n362) );
  NAND2X1TS U620 ( .A(ready_add_subt), .B(n438), .Y(n352) );
  NAND4BX1TS U621 ( .AN(n352), .B(n264), .C(n435), .D(n370), .Y(n315) );
  NOR2XLTS U622 ( .A(n362), .B(n315), .Y(enab_d_ff4_Yn) );
  INVX2TS U623 ( .A(n304), .Y(add_subt_dataB[12]) );
  INVX2TS U624 ( .A(n305), .Y(add_subt_dataB[10]) );
  INVX2TS U625 ( .A(n306), .Y(add_subt_dataB[21]) );
  INVX2TS U626 ( .A(n307), .Y(add_subt_dataB[26]) );
  INVX2TS U627 ( .A(n308), .Y(add_subt_dataB[24]) );
  INVX2TS U628 ( .A(n309), .Y(add_subt_dataB[23]) );
  INVX2TS U629 ( .A(n310), .Y(add_subt_dataB[25]) );
  INVX2TS U630 ( .A(n311), .Y(add_subt_dataB[9]) );
  AOI21X1TS U631 ( .A0(n440), .A1(n312), .B0(n316), .Y(n313) );
  NOR3XLTS U632 ( .A(n314), .B(n313), .C(n315), .Y(enab_d_ff4_Xn) );
  NOR3XLTS U633 ( .A(n316), .B(n350), .C(n315), .Y(enab_d_ff4_Zn) );
  AOI222X1TS U634 ( .A0(n417), .A1(d_ff2_Z[0]), .B0(n414), .B1(d_ff2_Y[0]), 
        .C0(n345), .C1(d_ff2_X[0]), .Y(n317) );
  INVX2TS U635 ( .A(n317), .Y(add_subt_dataA[0]) );
  BUFX4TS U636 ( .A(n419), .Y(n423) );
  AOI222X1TS U637 ( .A0(n327), .A1(d_ff2_Z[4]), .B0(n423), .B1(d_ff2_Y[4]), 
        .C0(n422), .C1(d_ff2_X[4]), .Y(n318) );
  INVX2TS U638 ( .A(n318), .Y(add_subt_dataA[4]) );
  INVX2TS U639 ( .A(n319), .Y(add_subt_dataA[26]) );
  INVX2TS U640 ( .A(n320), .Y(add_subt_dataB[4]) );
  AOI222X1TS U641 ( .A0(n327), .A1(d_ff2_Z[2]), .B0(n414), .B1(d_ff2_Y[2]), 
        .C0(n422), .C1(d_ff2_X[2]), .Y(n321) );
  INVX2TS U642 ( .A(n321), .Y(add_subt_dataA[2]) );
  AOI222X1TS U643 ( .A0(n327), .A1(d_ff2_Z[1]), .B0(n423), .B1(d_ff2_Y[1]), 
        .C0(n422), .C1(d_ff2_X[1]), .Y(n322) );
  INVX2TS U644 ( .A(n322), .Y(add_subt_dataA[1]) );
  AOI222X1TS U645 ( .A0(n417), .A1(d_ff3_LUT_out[0]), .B0(n414), .B1(
        d_ff3_sh_x_out[0]), .C0(n345), .C1(d_ff3_sh_y_out[0]), .Y(n323) );
  INVX2TS U646 ( .A(n323), .Y(add_subt_dataB[0]) );
  AOI222X1TS U647 ( .A0(n417), .A1(d_ff3_LUT_out[2]), .B0(n414), .B1(
        d_ff3_sh_x_out[2]), .C0(n345), .C1(d_ff3_sh_y_out[2]), .Y(n324) );
  INVX2TS U648 ( .A(n324), .Y(add_subt_dataB[2]) );
  INVX2TS U649 ( .A(n325), .Y(add_subt_dataA[12]) );
  AOI222X1TS U650 ( .A0(n327), .A1(d_ff2_Z[5]), .B0(n414), .B1(d_ff2_Y[5]), 
        .C0(n422), .C1(d_ff2_X[5]), .Y(n326) );
  INVX2TS U651 ( .A(n326), .Y(add_subt_dataA[5]) );
  INVX2TS U652 ( .A(n328), .Y(add_subt_dataA[11]) );
  AOI222X1TS U653 ( .A0(n417), .A1(d_ff3_LUT_out[1]), .B0(n414), .B1(
        d_ff3_sh_x_out[1]), .C0(n345), .C1(d_ff3_sh_y_out[1]), .Y(n329) );
  INVX2TS U654 ( .A(n329), .Y(add_subt_dataB[1]) );
  INVX2TS U655 ( .A(n330), .Y(add_subt_dataA[16]) );
  INVX2TS U656 ( .A(n331), .Y(add_subt_dataA[17]) );
  INVX2TS U657 ( .A(n332), .Y(add_subt_dataA[18]) );
  INVX2TS U658 ( .A(n333), .Y(add_subt_dataA[19]) );
  AOI222X1TS U659 ( .A0(n348), .A1(d_ff2_Z[20]), .B0(n423), .B1(d_ff2_Y[20]), 
        .C0(n399), .C1(d_ff2_X[20]), .Y(n334) );
  INVX2TS U660 ( .A(n334), .Y(add_subt_dataA[20]) );
  AOI222X1TS U661 ( .A0(n348), .A1(d_ff2_Z[21]), .B0(n423), .B1(d_ff2_Y[21]), 
        .C0(n399), .C1(d_ff2_X[21]), .Y(n335) );
  INVX2TS U662 ( .A(n335), .Y(add_subt_dataA[21]) );
  AOI222X1TS U663 ( .A0(n348), .A1(d_ff2_Z[22]), .B0(n423), .B1(d_ff2_Y[22]), 
        .C0(n399), .C1(d_ff2_X[22]), .Y(n336) );
  INVX2TS U664 ( .A(n336), .Y(add_subt_dataA[22]) );
  INVX2TS U665 ( .A(n337), .Y(add_subt_dataA[23]) );
  INVX2TS U666 ( .A(n338), .Y(add_subt_dataA[24]) );
  INVX2TS U667 ( .A(n339), .Y(add_subt_dataA[25]) );
  AOI222X1TS U668 ( .A0(n348), .A1(d_ff2_Z[15]), .B0(n423), .B1(d_ff2_Y[15]), 
        .C0(n399), .C1(d_ff2_X[15]), .Y(n340) );
  INVX2TS U669 ( .A(n340), .Y(add_subt_dataA[15]) );
  INVX2TS U670 ( .A(n341), .Y(add_subt_dataA[27]) );
  INVX2TS U671 ( .A(n342), .Y(add_subt_dataA[28]) );
  INVX2TS U672 ( .A(n343), .Y(add_subt_dataA[29]) );
  INVX2TS U673 ( .A(n344), .Y(add_subt_dataA[30]) );
  AOI222X1TS U674 ( .A0(n417), .A1(d_ff2_Z[31]), .B0(n414), .B1(d_ff2_Y[31]), 
        .C0(n345), .C1(d_ff2_X[31]), .Y(n346) );
  INVX2TS U675 ( .A(n346), .Y(add_subt_dataA[31]) );
  AOI222X1TS U676 ( .A0(n348), .A1(d_ff2_Z[13]), .B0(n423), .B1(d_ff2_Y[13]), 
        .C0(n399), .C1(d_ff2_X[13]), .Y(n347) );
  INVX2TS U677 ( .A(n347), .Y(add_subt_dataA[13]) );
  AOI222X1TS U678 ( .A0(n348), .A1(d_ff2_Z[14]), .B0(n423), .B1(d_ff2_Y[14]), 
        .C0(n399), .C1(d_ff2_X[14]), .Y(n349) );
  INVX2TS U679 ( .A(n349), .Y(add_subt_dataA[14]) );
  NAND2X1TS U680 ( .A(n433), .B(n438), .Y(n367) );
  NOR2X1TS U681 ( .A(n351), .B(n350), .Y(n358) );
  AOI32X1TS U682 ( .A0(n264), .A1(n353), .A2(n352), .B0(
        cordic_FSM_state_reg[0]), .B1(n353), .Y(n354) );
  NOR4X1TS U683 ( .A(n358), .B(n355), .C(n369), .D(n354), .Y(n356) );
  OAI31X1TS U684 ( .A0(cordic_FSM_state_reg[2]), .A1(beg_fsm_cordic), .A2(n367), .B0(n356), .Y(n197) );
  OR2X1TS U685 ( .A(n358), .B(load_cont_iter), .Y(enab_cont_iter) );
  NOR2XLTS U686 ( .A(n446), .B(n435), .Y(n478) );
  OAI32X1TS U687 ( .A0(n435), .A1(n360), .A2(n432), .B0(n359), .B1(n435), .Y(
        n479) );
  OAI32X1TS U688 ( .A0(n364), .A1(n363), .A2(n439), .B0(n362), .B1(n361), .Y(
        n187) );
  NOR2X2TS U690 ( .A(n446), .B(n434), .Y(n388) );
  INVX2TS U691 ( .A(n388), .Y(n384) );
  OAI21X1TS U692 ( .A0(cont_iter_out[1]), .A1(n269), .B0(n384), .Y(n379) );
  CLKAND2X2TS U693 ( .A(n379), .B(cordic_FSM_state_reg[0]), .Y(n477) );
  INVX2TS U694 ( .A(beg_fsm_cordic), .Y(n366) );
  NAND2X1TS U695 ( .A(cordic_FSM_state_reg[1]), .B(n433), .Y(n365) );
  OAI32X1TS U696 ( .A0(n435), .A1(n367), .A2(n366), .B0(
        cordic_FSM_state_reg[0]), .B1(n365), .Y(n368) );
  OR4X2TS U697 ( .A(n266), .B(ack_add_subt), .C(n369), .D(n368), .Y(
        cordic_FSM_state_next_1_) );
  CLKAND2X2TS U698 ( .A(d_ff_Yn[0]), .B(n396), .Y(first_mux_Y[0]) );
  INVX4TS U699 ( .A(n281), .Y(n395) );
  CLKAND2X2TS U700 ( .A(d_ff_Yn[1]), .B(n395), .Y(first_mux_Y[1]) );
  INVX4TS U701 ( .A(n281), .Y(n398) );
  CLKAND2X2TS U702 ( .A(d_ff_Yn[2]), .B(n398), .Y(first_mux_Y[2]) );
  CLKAND2X2TS U703 ( .A(d_ff_Yn[3]), .B(n398), .Y(first_mux_Y[3]) );
  CLKAND2X2TS U704 ( .A(d_ff_Yn[4]), .B(n398), .Y(first_mux_Y[4]) );
  CLKAND2X2TS U705 ( .A(d_ff_Yn[5]), .B(n395), .Y(first_mux_Y[5]) );
  CLKAND2X2TS U706 ( .A(d_ff_Yn[6]), .B(n395), .Y(first_mux_Y[6]) );
  CLKAND2X2TS U707 ( .A(d_ff_Yn[7]), .B(n395), .Y(first_mux_Y[7]) );
  CLKAND2X2TS U708 ( .A(d_ff_Yn[8]), .B(n398), .Y(first_mux_Y[8]) );
  CLKAND2X2TS U709 ( .A(d_ff_Yn[9]), .B(n395), .Y(first_mux_Y[9]) );
  CLKAND2X2TS U710 ( .A(d_ff_Yn[10]), .B(n398), .Y(first_mux_Y[10]) );
  CLKAND2X2TS U711 ( .A(d_ff_Yn[11]), .B(n395), .Y(first_mux_Y[11]) );
  CLKAND2X2TS U712 ( .A(d_ff_Yn[12]), .B(n398), .Y(first_mux_Y[12]) );
  CLKAND2X2TS U713 ( .A(d_ff_Yn[13]), .B(n396), .Y(first_mux_Y[13]) );
  CLKAND2X2TS U714 ( .A(d_ff_Yn[14]), .B(n398), .Y(first_mux_Y[14]) );
  CLKAND2X2TS U715 ( .A(d_ff_Yn[15]), .B(n395), .Y(first_mux_Y[15]) );
  CLKAND2X2TS U716 ( .A(d_ff_Yn[16]), .B(n395), .Y(first_mux_Y[16]) );
  CLKAND2X2TS U717 ( .A(d_ff_Yn[17]), .B(n395), .Y(first_mux_Y[17]) );
  CLKAND2X2TS U718 ( .A(d_ff_Yn[18]), .B(n398), .Y(first_mux_Y[18]) );
  CLKAND2X2TS U719 ( .A(d_ff_Yn[19]), .B(n395), .Y(first_mux_Y[19]) );
  CLKAND2X2TS U720 ( .A(d_ff_Yn[20]), .B(n398), .Y(first_mux_Y[20]) );
  CLKAND2X2TS U721 ( .A(d_ff_Yn[21]), .B(n395), .Y(first_mux_Y[21]) );
  CLKAND2X2TS U722 ( .A(d_ff_Yn[22]), .B(n398), .Y(first_mux_Y[22]) );
  CLKAND2X2TS U723 ( .A(d_ff_Yn[23]), .B(n395), .Y(first_mux_Y[23]) );
  CLKAND2X2TS U724 ( .A(d_ff_Yn[24]), .B(n398), .Y(first_mux_Y[24]) );
  CLKAND2X2TS U725 ( .A(d_ff_Yn[25]), .B(n395), .Y(first_mux_Y[25]) );
  CLKAND2X2TS U726 ( .A(d_ff_Yn[26]), .B(n394), .Y(first_mux_Y[26]) );
  CLKAND2X2TS U727 ( .A(d_ff_Yn[27]), .B(n395), .Y(first_mux_Y[27]) );
  CLKAND2X2TS U728 ( .A(d_ff_Yn[28]), .B(n398), .Y(first_mux_Y[28]) );
  CLKAND2X2TS U729 ( .A(d_ff_Yn[29]), .B(n396), .Y(first_mux_Y[29]) );
  CLKAND2X2TS U730 ( .A(d_ff_Yn[30]), .B(n398), .Y(first_mux_Y[30]) );
  CLKAND2X2TS U731 ( .A(d_ff_Yn[31]), .B(n396), .Y(first_mux_Y[31]) );
  AO22XLTS U732 ( .A0(n394), .A1(d_ff_Zn[0]), .B0(n442), .B1(d_ff1_Z[0]), .Y(
        first_mux_Z[0]) );
  AO22XLTS U733 ( .A0(n397), .A1(d_ff_Zn[1]), .B0(n371), .B1(d_ff1_Z[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U734 ( .A0(n394), .A1(d_ff_Zn[2]), .B0(n371), .B1(d_ff1_Z[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U735 ( .A0(n397), .A1(d_ff_Zn[3]), .B0(n442), .B1(d_ff1_Z[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U736 ( .A0(n397), .A1(d_ff_Zn[17]), .B0(n371), .B1(d_ff1_Z[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U737 ( .A0(n397), .A1(d_ff_Zn[18]), .B0(n371), .B1(d_ff1_Z[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U738 ( .A0(n397), .A1(d_ff_Zn[19]), .B0(n371), .B1(d_ff1_Z[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U739 ( .A0(n394), .A1(d_ff_Zn[20]), .B0(n371), .B1(d_ff1_Z[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U740 ( .A0(n397), .A1(d_ff_Zn[21]), .B0(n371), .B1(d_ff1_Z[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U741 ( .A0(n394), .A1(d_ff_Zn[22]), .B0(n371), .B1(d_ff1_Z[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U742 ( .A0(n393), .A1(d_ff_Zn[23]), .B0(n371), .B1(d_ff1_Z[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U743 ( .A0(n394), .A1(d_ff_Zn[24]), .B0(n371), .B1(d_ff1_Z[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U744 ( .A0(n397), .A1(d_ff_Zn[25]), .B0(n371), .B1(d_ff1_Z[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U745 ( .A0(n394), .A1(d_ff_Zn[26]), .B0(n371), .B1(d_ff1_Z[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U746 ( .A0(n393), .A1(d_ff_Zn[27]), .B0(n371), .B1(d_ff1_Z[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U747 ( .A0(n393), .A1(d_ff_Zn[28]), .B0(n371), .B1(d_ff1_Z[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U748 ( .A0(n397), .A1(d_ff_Zn[29]), .B0(n371), .B1(d_ff1_Z[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U749 ( .A0(n394), .A1(d_ff_Zn[30]), .B0(n371), .B1(d_ff1_Z[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U750 ( .A0(n397), .A1(d_ff_Zn[31]), .B0(n371), .B1(d_ff1_Z[31]), 
        .Y(first_mux_Z[31]) );
  INVX4TS U751 ( .A(n443), .Y(n372) );
  AO22XLTS U752 ( .A0(n372), .A1(d_ff_Yn[0]), .B0(n443), .B1(d_ff_Xn[0]), .Y(
        mux_sal[0]) );
  BUFX4TS U753 ( .A(n443), .Y(n373) );
  AO22XLTS U754 ( .A0(n263), .A1(d_ff_Yn[1]), .B0(n373), .B1(d_ff_Xn[1]), .Y(
        mux_sal[1]) );
  AO22XLTS U755 ( .A0(n372), .A1(d_ff_Yn[2]), .B0(n373), .B1(d_ff_Xn[2]), .Y(
        mux_sal[2]) );
  AO22XLTS U756 ( .A0(n263), .A1(d_ff_Yn[3]), .B0(n373), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U757 ( .A0(n372), .A1(d_ff_Yn[4]), .B0(n373), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  AO22XLTS U758 ( .A0(n372), .A1(d_ff_Yn[5]), .B0(n373), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  AO22XLTS U759 ( .A0(n372), .A1(d_ff_Yn[6]), .B0(n373), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U760 ( .A0(n372), .A1(d_ff_Yn[7]), .B0(n373), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U761 ( .A0(n372), .A1(d_ff_Yn[8]), .B0(n373), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U762 ( .A0(n372), .A1(d_ff_Yn[9]), .B0(n373), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U763 ( .A0(n372), .A1(d_ff_Yn[10]), .B0(n373), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U764 ( .A0(n372), .A1(d_ff_Yn[11]), .B0(n373), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U765 ( .A0(n372), .A1(d_ff_Yn[12]), .B0(n443), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U766 ( .A0(n372), .A1(d_ff_Yn[13]), .B0(n443), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U767 ( .A0(n372), .A1(d_ff_Yn[14]), .B0(n373), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U768 ( .A0(n372), .A1(d_ff_Yn[15]), .B0(n373), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U769 ( .A0(n372), .A1(d_ff_Yn[16]), .B0(n373), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U770 ( .A0(n372), .A1(d_ff_Yn[17]), .B0(n373), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U771 ( .A0(n372), .A1(d_ff_Yn[18]), .B0(n373), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U772 ( .A0(n372), .A1(d_ff_Yn[19]), .B0(n373), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U773 ( .A0(n263), .A1(d_ff_Yn[20]), .B0(n373), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U774 ( .A0(n263), .A1(d_ff_Yn[21]), .B0(n373), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U775 ( .A0(n263), .A1(d_ff_Yn[22]), .B0(n373), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U776 ( .A0(n263), .A1(d_ff_Yn[23]), .B0(n443), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U777 ( .A0(n263), .A1(d_ff_Yn[24]), .B0(n443), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U778 ( .A0(n263), .A1(d_ff_Yn[25]), .B0(n443), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U779 ( .A0(n263), .A1(d_ff_Yn[26]), .B0(n443), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U780 ( .A0(n263), .A1(d_ff_Yn[27]), .B0(n443), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U781 ( .A0(n263), .A1(d_ff_Yn[28]), .B0(n443), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U782 ( .A0(n263), .A1(d_ff_Yn[29]), .B0(n443), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U783 ( .A0(n263), .A1(d_ff_Yn[30]), .B0(n443), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U784 ( .A0(n263), .A1(d_ff_Yn[31]), .B0(n443), .B1(d_ff_Xn[31]), 
        .Y(mux_sal[31]) );
  XNOR2X1TS U785 ( .A(data_output2_31_), .B(n377), .Y(sign_inv_out[31]) );
  AOI21X1TS U786 ( .A0(n269), .A1(n434), .B0(cont_iter_out[3]), .Y(n378) );
  OAI32X1TS U787 ( .A0(n434), .A1(cont_iter_out[3]), .A2(n269), .B0(n378), 
        .B1(n391), .Y(data_out_LUT[10]) );
  AO21XLTS U788 ( .A0(n389), .A1(n388), .B0(data_out_LUT[10]), .Y(
        data_out_LUT[0]) );
  NAND2X1TS U789 ( .A(n382), .B(n379), .Y(n380) );
  NAND2X1TS U790 ( .A(n381), .B(n380), .Y(data_out_LUT[6]) );
  AO21XLTS U791 ( .A0(n388), .A1(data_out_LUT[8]), .B0(data_out_LUT[16]), .Y(
        data_out_LUT[9]) );
  AOI21X1TS U792 ( .A0(cont_iter_out[1]), .A1(n389), .B0(n382), .Y(n383) );
  OAI21X1TS U793 ( .A0(cont_iter_out[3]), .A1(n384), .B0(n383), .Y(
        data_out_LUT[12]) );
  NAND3XLTS U794 ( .A(n446), .B(n432), .C(n434), .Y(n385) );
  NAND2BXLTS U795 ( .AN(data_out_LUT[12]), .B(n385), .Y(data_out_LUT[14]) );
  AO21XLTS U796 ( .A0(n388), .A1(data_out_LUT[8]), .B0(data_out_LUT[18]), .Y(
        data_out_LUT[21]) );
  OAI2BB2XLTS U797 ( .B0(n391), .B1(n390), .A0N(n434), .A1N(n389), .Y(
        data_out_LUT[2]) );
  AOI2BB2XLTS U798 ( .B0(n269), .B1(data_out_LUT[22]), .A0N(data_out_LUT[22]), 
        .A1N(n269), .Y(data_out_LUT[23]) );
  AOI32X1TS U799 ( .A0(n446), .A1(n392), .A2(cont_iter_out[1]), .B0(n391), 
        .B1(n392), .Y(data_out_LUT[25]) );
  CLKAND2X2TS U800 ( .A(d_ff_Xn[0]), .B(n398), .Y(first_mux_X[0]) );
  NAND2BXLTS U801 ( .AN(d_ff_Xn[1]), .B(n393), .Y(first_mux_X[1]) );
  NAND2BXLTS U802 ( .AN(d_ff_Xn[2]), .B(n395), .Y(first_mux_X[2]) );
  NAND2BXLTS U803 ( .AN(d_ff_Xn[3]), .B(n393), .Y(first_mux_X[3]) );
  CLKAND2X2TS U804 ( .A(d_ff_Xn[4]), .B(n396), .Y(first_mux_X[4]) );
  NAND2BXLTS U805 ( .AN(d_ff_Xn[5]), .B(n397), .Y(first_mux_X[5]) );
  NAND2BXLTS U806 ( .AN(d_ff_Xn[6]), .B(n396), .Y(first_mux_X[6]) );
  NAND2BXLTS U807 ( .AN(d_ff_Xn[7]), .B(n394), .Y(first_mux_X[7]) );
  CLKAND2X2TS U808 ( .A(d_ff_Xn[8]), .B(n396), .Y(first_mux_X[8]) );
  CLKAND2X2TS U809 ( .A(d_ff_Xn[9]), .B(n396), .Y(first_mux_X[9]) );
  NAND2BXLTS U810 ( .AN(d_ff_Xn[10]), .B(n393), .Y(first_mux_X[10]) );
  CLKAND2X2TS U811 ( .A(d_ff_Xn[11]), .B(n398), .Y(first_mux_X[11]) );
  NAND2BXLTS U812 ( .AN(d_ff_Xn[12]), .B(n396), .Y(first_mux_X[12]) );
  NAND2BXLTS U813 ( .AN(d_ff_Xn[13]), .B(n398), .Y(first_mux_X[13]) );
  NAND2BXLTS U814 ( .AN(d_ff_Xn[14]), .B(n397), .Y(first_mux_X[14]) );
  CLKAND2X2TS U815 ( .A(d_ff_Xn[15]), .B(n394), .Y(first_mux_X[15]) );
  NAND2BXLTS U816 ( .AN(d_ff_Xn[16]), .B(n396), .Y(first_mux_X[16]) );
  NAND2BXLTS U817 ( .AN(d_ff_Xn[17]), .B(n396), .Y(first_mux_X[17]) );
  CLKAND2X2TS U818 ( .A(d_ff_Xn[18]), .B(n394), .Y(first_mux_X[18]) );
  NAND2BXLTS U819 ( .AN(d_ff_Xn[19]), .B(n396), .Y(first_mux_X[19]) );
  NAND2BXLTS U820 ( .AN(d_ff_Xn[20]), .B(n396), .Y(first_mux_X[20]) );
  CLKAND2X2TS U821 ( .A(d_ff_Xn[21]), .B(n397), .Y(first_mux_X[21]) );
  CLKAND2X2TS U822 ( .A(d_ff_Xn[22]), .B(n395), .Y(first_mux_X[22]) );
  CLKAND2X2TS U823 ( .A(d_ff_Xn[23]), .B(n395), .Y(first_mux_X[23]) );
  NAND2BXLTS U824 ( .AN(d_ff_Xn[24]), .B(n396), .Y(first_mux_X[24]) );
  NAND2BXLTS U825 ( .AN(d_ff_Xn[25]), .B(n396), .Y(first_mux_X[25]) );
  NAND2BXLTS U826 ( .AN(d_ff_Xn[26]), .B(n396), .Y(first_mux_X[26]) );
  NAND2BXLTS U827 ( .AN(d_ff_Xn[27]), .B(n396), .Y(first_mux_X[27]) );
  NAND2BXLTS U828 ( .AN(d_ff_Xn[28]), .B(n396), .Y(first_mux_X[28]) );
  NAND2BXLTS U829 ( .AN(d_ff_Xn[29]), .B(n396), .Y(first_mux_X[29]) );
  CLKAND2X2TS U830 ( .A(d_ff_Xn[30]), .B(n397), .Y(first_mux_X[30]) );
  CLKAND2X2TS U831 ( .A(d_ff_Xn[31]), .B(n398), .Y(first_mux_X[31]) );
  AO22XLTS U832 ( .A0(n410), .A1(d_ff3_sh_x_out[31]), .B0(n418), .B1(
        d_ff3_sh_y_out[31]), .Y(add_subt_dataB[31]) );
  AO22XLTS U833 ( .A0(n410), .A1(d_ff3_sh_x_out[30]), .B0(n418), .B1(
        d_ff3_sh_y_out[30]), .Y(add_subt_dataB[30]) );
  AOI22X1TS U834 ( .A0(n419), .A1(d_ff3_sh_x_out[29]), .B0(n418), .B1(
        d_ff3_sh_y_out[29]), .Y(n400) );
  NAND2X1TS U835 ( .A(n425), .B(d_ff3_LUT_out[27]), .Y(n402) );
  NAND2X1TS U836 ( .A(n400), .B(n402), .Y(add_subt_dataB[29]) );
  AOI22X1TS U837 ( .A0(n414), .A1(d_ff3_sh_x_out[28]), .B0(n418), .B1(
        d_ff3_sh_y_out[28]), .Y(n401) );
  NAND2X1TS U838 ( .A(n401), .B(n402), .Y(add_subt_dataB[28]) );
  AOI22X1TS U839 ( .A0(n423), .A1(d_ff3_sh_x_out[27]), .B0(n418), .B1(
        d_ff3_sh_y_out[27]), .Y(n403) );
  NAND2X1TS U840 ( .A(n403), .B(n402), .Y(add_subt_dataB[27]) );
  AOI22X1TS U841 ( .A0(n419), .A1(d_ff3_sh_x_out[22]), .B0(n418), .B1(
        d_ff3_sh_y_out[22]), .Y(n404) );
  OAI2BB1X1TS U842 ( .A0N(n417), .A1N(d_ff3_LUT_out[22]), .B0(n404), .Y(
        add_subt_dataB[22]) );
  AOI22X1TS U843 ( .A0(n414), .A1(d_ff3_sh_x_out[20]), .B0(n418), .B1(
        d_ff3_sh_y_out[20]), .Y(n405) );
  NAND2X1TS U844 ( .A(n425), .B(d_ff3_LUT_out[20]), .Y(n411) );
  NAND2X1TS U845 ( .A(n405), .B(n411), .Y(add_subt_dataB[20]) );
  AOI22X1TS U846 ( .A0(n419), .A1(d_ff3_sh_x_out[19]), .B0(n418), .B1(
        d_ff3_sh_y_out[19]), .Y(n406) );
  OAI2BB1X1TS U847 ( .A0N(n425), .A1N(d_ff3_LUT_out[22]), .B0(n406), .Y(
        add_subt_dataB[19]) );
  AOI22X1TS U848 ( .A0(n419), .A1(d_ff3_sh_x_out[18]), .B0(n418), .B1(
        d_ff3_sh_y_out[18]), .Y(n407) );
  OAI2BB1X1TS U849 ( .A0N(n425), .A1N(d_ff3_LUT_out[18]), .B0(n407), .Y(
        add_subt_dataB[18]) );
  AOI22X1TS U850 ( .A0(n410), .A1(d_ff3_sh_x_out[17]), .B0(n418), .B1(
        d_ff3_sh_y_out[17]), .Y(n408) );
  NAND2X1TS U851 ( .A(n408), .B(n411), .Y(add_subt_dataB[17]) );
  AOI22X1TS U852 ( .A0(n419), .A1(d_ff3_sh_x_out[16]), .B0(n418), .B1(
        d_ff3_sh_y_out[16]), .Y(n409) );
  OAI2BB1X1TS U853 ( .A0N(n425), .A1N(d_ff3_LUT_out[16]), .B0(n409), .Y(
        add_subt_dataB[16]) );
  AOI22X1TS U854 ( .A0(n410), .A1(d_ff3_sh_x_out[15]), .B0(n418), .B1(
        d_ff3_sh_y_out[15]), .Y(n412) );
  NAND2X1TS U855 ( .A(n412), .B(n411), .Y(add_subt_dataB[15]) );
  AOI22X1TS U856 ( .A0(n419), .A1(d_ff3_sh_x_out[14]), .B0(n418), .B1(
        d_ff3_sh_y_out[14]), .Y(n413) );
  OAI2BB1X1TS U857 ( .A0N(n425), .A1N(d_ff3_LUT_out[14]), .B0(n413), .Y(
        add_subt_dataB[14]) );
  AOI22X1TS U858 ( .A0(n414), .A1(d_ff3_sh_x_out[13]), .B0(n422), .B1(
        d_ff3_sh_y_out[13]), .Y(n415) );
  OAI2BB1X1TS U859 ( .A0N(n425), .A1N(d_ff3_LUT_out[18]), .B0(n415), .Y(
        add_subt_dataB[13]) );
  AOI22X1TS U860 ( .A0(n419), .A1(d_ff3_sh_x_out[11]), .B0(n418), .B1(
        d_ff3_sh_y_out[11]), .Y(n416) );
  OAI2BB1X1TS U861 ( .A0N(n417), .A1N(d_ff3_LUT_out[11]), .B0(n416), .Y(
        add_subt_dataB[11]) );
  AOI22X1TS U862 ( .A0(n419), .A1(d_ff3_sh_x_out[7]), .B0(n418), .B1(
        d_ff3_sh_y_out[7]), .Y(n420) );
  OAI2BB1X1TS U863 ( .A0N(n425), .A1N(d_ff3_LUT_out[11]), .B0(n420), .Y(
        add_subt_dataB[7]) );
  AOI22X1TS U864 ( .A0(n423), .A1(d_ff3_sh_x_out[5]), .B0(n422), .B1(
        d_ff3_sh_y_out[5]), .Y(n421) );
  OAI2BB1X1TS U865 ( .A0N(n425), .A1N(d_ff3_LUT_out[14]), .B0(n421), .Y(
        add_subt_dataB[5]) );
  AOI22X1TS U866 ( .A0(n423), .A1(d_ff3_sh_x_out[3]), .B0(n422), .B1(
        d_ff3_sh_y_out[3]), .Y(n424) );
  OAI2BB1X1TS U867 ( .A0N(n425), .A1N(d_ff3_LUT_out[16]), .B0(n424), .Y(
        add_subt_dataB[3]) );
  XNOR2X1TS U868 ( .A(cont_var_out[0]), .B(d_ff3_sign_out), .Y(op_add_subt) );
  NOR2XLTS U870 ( .A(d_ff2_Y[29]), .B(n427), .Y(n426) );
  XOR2XLTS U871 ( .A(d_ff2_Y[30]), .B(n426), .Y(sh_exp_y[7]) );
  XNOR2X1TS U872 ( .A(d_ff2_Y[29]), .B(n427), .Y(sh_exp_y[6]) );
  AO21XLTS U873 ( .A0(intadd_416_n1), .A1(d_ff2_Y[27]), .B0(n428), .Y(
        sh_exp_y[4]) );
  NOR2XLTS U874 ( .A(d_ff2_X[29]), .B(n430), .Y(n429) );
  XOR2XLTS U875 ( .A(d_ff2_X[30]), .B(n429), .Y(sh_exp_x[7]) );
  XNOR2X1TS U876 ( .A(d_ff2_X[29]), .B(n430), .Y(sh_exp_x[6]) );
  AO21XLTS U877 ( .A0(intadd_415_n1), .A1(d_ff2_X[27]), .B0(n431), .Y(
        sh_exp_x[4]) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk30.tcl_GATED_syn.sdf"); 
 endmodule

