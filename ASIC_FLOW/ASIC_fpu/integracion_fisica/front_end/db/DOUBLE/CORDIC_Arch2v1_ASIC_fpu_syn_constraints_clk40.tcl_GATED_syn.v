/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:16:15 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_counter_d_W4_77 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_15 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_16 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_18 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_19 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_20 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_22 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_25 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W64_EW11_SW52_SWR55_EWR6_1 ( CLK, 
        EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule


module CORDIC_Arch2v1_W64_EW11_SW52_SWR55_EWR6 ( clk, rst, beg_fsm_cordic, 
        ack_cordic, operation, data_in, shift_region_flag, ready_cordic, 
        data_output, beg_add_subt, ack_add_subt, add_subt_dataA, 
        add_subt_dataB, result_add_subt, op_add_subt, ready_add_subt );
  input [63:0] data_in;
  input [1:0] shift_region_flag;
  output [63:0] data_output;
  output [63:0] add_subt_dataA;
  output [63:0] add_subt_dataB;
  input [63:0] result_add_subt;
  input clk, rst, beg_fsm_cordic, ack_cordic, operation, ready_add_subt;
  output ready_cordic, beg_add_subt, ack_add_subt, op_add_subt;
  wire   d_ff1_operation_out, enab_cont_iter, load_cont_iter, enab_d_ff2_RB2,
         enab_d_ff4_Xn, enab_d_ff4_Yn, enab_d_ff4_Zn, enab_d_ff5_data_out,
         enab_dff_5, sel_mux_1_reg, d_ff3_sign_out, data_output2_63_,
         cordic_FSM_state_next_1_, cont_iter_net3827306,
         d_ff5_data_out_net3827270, reg_Z0_net3827270,
         reg_val_muxZ_2stage_net3827270, reg_shift_y_net3827270,
         d_ff4_Xn_net3827270, d_ff4_Yn_net3827270, d_ff4_Zn_net3827270,
         d_ff5_net3827270, n276, n282, n283, n284, n285, n289, n290, n291,
         n292, n293, intadd_457_CI, intadd_457_n3, intadd_457_n2,
         intadd_457_n1, intadd_458_CI, intadd_458_n3, intadd_458_n2,
         intadd_458_n1, n423, n424, n425, n426, n427, n428, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n609, n610,
         n611, n612, n613, n614, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n770, n771, n772, n773, n774;
  wire   [1:0] d_ff1_shift_region_flag_out;
  wire   [1:0] cont_var_out;
  wire   [3:1] cont_iter_out;
  wire   [63:0] d_ff1_Z;
  wire   [63:0] d_ff_Xn;
  wire   [63:0] first_mux_X;
  wire   [63:0] d_ff_Yn;
  wire   [63:0] first_mux_Y;
  wire   [63:0] d_ff_Zn;
  wire   [63:0] first_mux_Z;
  wire   [63:0] d_ff2_X;
  wire   [63:0] d_ff2_Y;
  wire   [63:0] d_ff2_Z;
  wire   [10:0] sh_exp_x;
  wire   [10:0] sh_exp_y;
  wire   [56:0] data_out_LUT;
  wire   [63:0] d_ff3_sh_x_out;
  wire   [63:0] d_ff3_sh_y_out;
  wire   [56:0] d_ff3_LUT_out;
  wire   [1:0] sel_mux_2_reg;
  wire   [63:0] mux_sal;
  wire   [63:0] sign_inv_out;
  wire   [3:0] cordic_FSM_state_reg;

  SNPS_CLOCK_GATE_HIGH_counter_d_W4_77 cont_iter_clk_gate_count_reg ( .CLK(clk), .EN(enab_cont_iter), .ENCLK(cont_iter_net3827306), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_13 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3827270), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_25 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(load_cont_iter), .ENCLK(reg_Z0_net3827270), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_22 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enab_d_ff2_RB2), .ENCLK(reg_val_muxZ_2stage_net3827270), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_20 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(n427), .ENCLK(reg_shift_y_net3827270), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_19 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3827270), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_18 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3827270), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_16 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3827270), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_15 d_ff5_clk_gate_Q_reg ( .CLK(clk), .EN(
        enab_dff_5), .ENCLK(d_ff5_net3827270), .TE(1'b0) );
  DFFRXLTS reg_ch_mux_2_Q_reg_0_ ( .D(n283), .CK(n768), .RN(n765), .Q(
        sel_mux_2_reg[0]), .QN(n706) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(data_out_LUT[0]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(data_out_LUT[1]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(data_out_LUT[2]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(data_out_LUT[3]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(data_out_LUT[5]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(data_out_LUT[6]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(data_out_LUT[7]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(data_out_LUT[8]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(data_out_LUT[9]), .CK(reg_shift_y_net3827270), 
        .RN(n765), .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(data_out_LUT[10]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(data_out_LUT[11]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(data_out_LUT[12]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(data_out_LUT[13]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(data_out_LUT[14]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(data_out_LUT[15]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(data_out_LUT[16]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_17_ ( .D(data_out_LUT[17]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[17]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(data_out_LUT[18]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(data_out_LUT[19]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(data_out_LUT[20]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(data_out_LUT[21]), .CK(
        reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(data_out_LUT[22]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(data_out_LUT[23]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(data_out_LUT[24]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(data_out_LUT[26]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(data_out_LUT[27]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[27]) );
  DFFRXLTS reg_LUT_Q_reg_29_ ( .D(data_out_LUT[29]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[29]) );
  DFFRXLTS reg_LUT_Q_reg_30_ ( .D(data_out_LUT[30]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[30]) );
  DFFRXLTS reg_LUT_Q_reg_31_ ( .D(data_out_LUT[31]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[31]) );
  DFFRXLTS reg_LUT_Q_reg_33_ ( .D(data_out_LUT[33]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[33]) );
  DFFRXLTS reg_LUT_Q_reg_35_ ( .D(data_out_LUT[35]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[35]) );
  DFFRXLTS reg_LUT_Q_reg_37_ ( .D(data_out_LUT[37]), .CK(
        reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_LUT_out[37]) );
  DFFRXLTS reg_LUT_Q_reg_38_ ( .D(data_out_LUT[38]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[38]) );
  DFFRXLTS reg_LUT_Q_reg_39_ ( .D(data_out_LUT[39]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[39]) );
  DFFRXLTS reg_LUT_Q_reg_40_ ( .D(data_out_LUT[40]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[40]) );
  DFFRXLTS reg_LUT_Q_reg_41_ ( .D(data_out_LUT[41]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[41]) );
  DFFRXLTS reg_LUT_Q_reg_43_ ( .D(data_out_LUT[43]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[43]) );
  DFFRXLTS reg_LUT_Q_reg_45_ ( .D(data_out_LUT[45]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[45]) );
  DFFRXLTS reg_LUT_Q_reg_47_ ( .D(data_out_LUT[47]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[47]) );
  DFFRXLTS reg_LUT_Q_reg_49_ ( .D(data_out_LUT[49]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[49]) );
  DFFRXLTS reg_LUT_Q_reg_50_ ( .D(data_out_LUT[50]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[50]) );
  DFFRXLTS reg_LUT_Q_reg_52_ ( .D(n716), .CK(reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[52]) );
  DFFRXLTS reg_LUT_Q_reg_53_ ( .D(data_out_LUT[53]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[53]) );
  DFFRXLTS reg_LUT_Q_reg_54_ ( .D(data_out_LUT[54]), .CK(
        reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_LUT_out[54]) );
  DFFRXLTS reg_LUT_Q_reg_55_ ( .D(data_out_LUT[55]), .CK(
        reg_shift_y_net3827270), .RN(n761), .Q(d_ff3_LUT_out[55]) );
  DFFRXLTS reg_LUT_Q_reg_56_ ( .D(data_out_LUT[56]), .CK(
        reg_shift_y_net3827270), .RN(n761), .Q(d_ff3_LUT_out[56]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3827270), .RN(n761), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3827270), .RN(
        n760), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_Z0_Q_reg_32_ ( .D(data_in[32]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[32]) );
  DFFRXLTS reg_Z0_Q_reg_33_ ( .D(data_in[33]), .CK(reg_Z0_net3827270), .RN(
        n759), .Q(d_ff1_Z[33]) );
  DFFRXLTS reg_Z0_Q_reg_34_ ( .D(data_in[34]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[34]) );
  DFFRXLTS reg_Z0_Q_reg_35_ ( .D(data_in[35]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[35]) );
  DFFRXLTS reg_Z0_Q_reg_36_ ( .D(data_in[36]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[36]) );
  DFFRXLTS reg_Z0_Q_reg_37_ ( .D(data_in[37]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[37]) );
  DFFRXLTS reg_Z0_Q_reg_38_ ( .D(data_in[38]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[38]) );
  DFFRXLTS reg_Z0_Q_reg_39_ ( .D(data_in[39]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[39]) );
  DFFRXLTS reg_Z0_Q_reg_40_ ( .D(data_in[40]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[40]) );
  DFFRXLTS reg_Z0_Q_reg_41_ ( .D(data_in[41]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[41]) );
  DFFRXLTS reg_Z0_Q_reg_42_ ( .D(data_in[42]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[42]) );
  DFFRXLTS reg_Z0_Q_reg_43_ ( .D(data_in[43]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[43]) );
  DFFRXLTS reg_Z0_Q_reg_44_ ( .D(data_in[44]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[44]) );
  DFFRXLTS reg_Z0_Q_reg_45_ ( .D(data_in[45]), .CK(reg_Z0_net3827270), .RN(
        n758), .Q(d_ff1_Z[45]) );
  DFFRXLTS reg_Z0_Q_reg_46_ ( .D(data_in[46]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[46]) );
  DFFRXLTS reg_Z0_Q_reg_47_ ( .D(data_in[47]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[47]) );
  DFFRXLTS reg_Z0_Q_reg_48_ ( .D(data_in[48]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[48]) );
  DFFRXLTS reg_Z0_Q_reg_49_ ( .D(data_in[49]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[49]) );
  DFFRXLTS reg_Z0_Q_reg_50_ ( .D(data_in[50]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[50]) );
  DFFRXLTS reg_Z0_Q_reg_51_ ( .D(data_in[51]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[51]) );
  DFFRXLTS reg_Z0_Q_reg_52_ ( .D(data_in[52]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[52]) );
  DFFRXLTS reg_Z0_Q_reg_53_ ( .D(data_in[53]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[53]) );
  DFFRXLTS reg_Z0_Q_reg_54_ ( .D(data_in[54]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[54]) );
  DFFRXLTS reg_Z0_Q_reg_55_ ( .D(data_in[55]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[55]) );
  DFFRXLTS reg_Z0_Q_reg_56_ ( .D(data_in[56]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[56]) );
  DFFRXLTS reg_Z0_Q_reg_57_ ( .D(data_in[57]), .CK(reg_Z0_net3827270), .RN(
        n757), .Q(d_ff1_Z[57]) );
  DFFRXLTS reg_Z0_Q_reg_58_ ( .D(data_in[58]), .CK(reg_Z0_net3827270), .RN(
        n756), .Q(d_ff1_Z[58]) );
  DFFRXLTS reg_Z0_Q_reg_59_ ( .D(data_in[59]), .CK(reg_Z0_net3827270), .RN(
        n756), .Q(d_ff1_Z[59]) );
  DFFRXLTS reg_Z0_Q_reg_60_ ( .D(data_in[60]), .CK(reg_Z0_net3827270), .RN(
        n756), .Q(d_ff1_Z[60]) );
  DFFRXLTS reg_Z0_Q_reg_61_ ( .D(data_in[61]), .CK(reg_Z0_net3827270), .RN(
        n756), .Q(d_ff1_Z[61]) );
  DFFRXLTS reg_Z0_Q_reg_62_ ( .D(data_in[62]), .CK(reg_Z0_net3827270), .RN(
        n756), .Q(d_ff1_Z[62]) );
  DFFRXLTS reg_Z0_Q_reg_63_ ( .D(data_in[63]), .CK(reg_Z0_net3827270), .RN(
        n756), .Q(d_ff1_Z[63]) );
  DFFRXLTS reg_shift_x_Q_reg_52_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3827270), .RN(n756), .Q(d_ff3_sh_x_out[52]) );
  DFFRXLTS reg_shift_x_Q_reg_53_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3827270), .RN(n756), .Q(d_ff3_sh_x_out[53]) );
  DFFRXLTS reg_shift_x_Q_reg_54_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3827270), .RN(n756), .Q(d_ff3_sh_x_out[54]) );
  DFFRXLTS reg_shift_x_Q_reg_55_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3827270), .RN(n756), .Q(d_ff3_sh_x_out[55]) );
  DFFRXLTS reg_shift_x_Q_reg_56_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3827270), .RN(n756), .Q(d_ff3_sh_x_out[56]) );
  DFFRXLTS reg_shift_x_Q_reg_57_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3827270), .RN(n756), .Q(d_ff3_sh_x_out[57]) );
  DFFRXLTS reg_shift_x_Q_reg_58_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3827270), .RN(n760), .Q(d_ff3_sh_x_out[58]) );
  DFFRXLTS reg_shift_x_Q_reg_59_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3827270), .RN(n759), .Q(d_ff3_sh_x_out[59]) );
  DFFRXLTS reg_shift_x_Q_reg_60_ ( .D(sh_exp_x[8]), .CK(reg_shift_y_net3827270), .RN(n758), .Q(d_ff3_sh_x_out[60]) );
  DFFRXLTS reg_shift_x_Q_reg_61_ ( .D(sh_exp_x[9]), .CK(reg_shift_y_net3827270), .RN(n756), .Q(d_ff3_sh_x_out[61]) );
  DFFRXLTS reg_shift_x_Q_reg_62_ ( .D(sh_exp_x[10]), .CK(
        reg_shift_y_net3827270), .RN(n761), .Q(d_ff3_sh_x_out[62]) );
  DFFRXLTS reg_shift_y_Q_reg_52_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3827270), .RN(n762), .Q(d_ff3_sh_y_out[52]) );
  DFFRXLTS reg_shift_y_Q_reg_53_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3827270), .RN(n763), .Q(d_ff3_sh_y_out[53]) );
  DFFRXLTS reg_shift_y_Q_reg_54_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_sh_y_out[54]) );
  DFFRXLTS reg_shift_y_Q_reg_55_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3827270), .RN(n765), .Q(d_ff3_sh_y_out[55]) );
  DFFRXLTS reg_shift_y_Q_reg_56_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3827270), .RN(n760), .Q(d_ff3_sh_y_out[56]) );
  DFFRXLTS reg_shift_y_Q_reg_57_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3827270), .RN(n759), .Q(d_ff3_sh_y_out[57]) );
  DFFRXLTS reg_shift_y_Q_reg_58_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3827270), .RN(n758), .Q(d_ff3_sh_y_out[58]) );
  DFFRXLTS reg_shift_y_Q_reg_59_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3827270), .RN(n755), .Q(d_ff3_sh_y_out[59]) );
  DFFRXLTS reg_shift_y_Q_reg_60_ ( .D(sh_exp_y[8]), .CK(reg_shift_y_net3827270), .RN(n755), .Q(d_ff3_sh_y_out[60]) );
  DFFRXLTS reg_shift_y_Q_reg_61_ ( .D(sh_exp_y[9]), .CK(reg_shift_y_net3827270), .RN(n755), .Q(d_ff3_sh_y_out[61]) );
  DFFRXLTS reg_shift_y_Q_reg_62_ ( .D(sh_exp_y[10]), .CK(
        reg_shift_y_net3827270), .RN(n755), .Q(d_ff3_sh_y_out[62]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3827270), .RN(n755), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n755), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3827270), 
        .RN(n755), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3827270), .RN(n755), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n755), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3827270), 
        .RN(n755), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3827270), .RN(n755), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n755), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3827270), 
        .RN(n754), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3827270), .RN(n754), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n754), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3827270), 
        .RN(n754), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3827270), .RN(n754), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n754), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3827270), 
        .RN(n754), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3827270), .RN(n754), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n754), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3827270), 
        .RN(n754), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3827270), .RN(n754), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n754), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3827270), 
        .RN(n753), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3827270), .RN(n753), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n753), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3827270), 
        .RN(n753), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3827270), .RN(n753), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n753), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3827270), 
        .RN(n753), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3827270), .RN(n753), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n753), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3827270), 
        .RN(n753), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3827270), .RN(n753), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n753), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3827270), .RN(n752), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3827270), .RN(n752), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n752), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3827270), .RN(n752), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3827270), .RN(n752), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n752), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3827270), .RN(n752), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3827270), .RN(n752), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n752), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3827270), .RN(n752), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3827270), .RN(n752), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n752), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3827270), .RN(n751), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3827270), .RN(n751), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n751), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3827270), .RN(n751), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3827270), .RN(n751), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n751), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3827270), .RN(n751), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3827270), .RN(n751), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n751), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3827270), .RN(n751), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3827270), .RN(n751), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n751), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3827270), .RN(n750), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3827270), .RN(n750), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n750), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3827270), .RN(n750), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3827270), .RN(n750), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n750), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3827270), .RN(n750), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3827270), .RN(n750), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n750), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3827270), .RN(n750), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3827270), .RN(n750), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n750), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3827270), .RN(n749), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3827270), .RN(n749), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n749), .Q(d_ff2_X[23]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(d_ff2_X[23]), .CK(reg_shift_y_net3827270), .RN(n749), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3827270), .RN(n749), .Q(d_ff_Xn[24]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n749), .Q(d_ff2_X[24]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(d_ff2_X[24]), .CK(reg_shift_y_net3827270), .RN(n749), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3827270), .RN(n749), .Q(d_ff_Xn[25]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n749), .Q(d_ff2_X[25]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(d_ff2_X[25]), .CK(reg_shift_y_net3827270), .RN(n749), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3827270), .RN(n749), .Q(d_ff_Xn[26]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n749), .Q(d_ff2_X[26]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(d_ff2_X[26]), .CK(reg_shift_y_net3827270), .RN(n748), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3827270), .RN(n748), .Q(d_ff_Xn[27]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n748), .Q(d_ff2_X[27]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(d_ff2_X[27]), .CK(reg_shift_y_net3827270), .RN(n748), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3827270), .RN(n748), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n748), .Q(d_ff2_X[28]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(d_ff2_X[28]), .CK(reg_shift_y_net3827270), .RN(n748), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3827270), .RN(n748), .Q(d_ff_Xn[29]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n748), .Q(d_ff2_X[29]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(d_ff2_X[29]), .CK(reg_shift_y_net3827270), .RN(n748), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3827270), .RN(n748), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n748), .Q(d_ff2_X[30]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(d_ff2_X[30]), .CK(reg_shift_y_net3827270), .RN(n747), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3827270), .RN(n747), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n747), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3827270), .RN(n747), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Xn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Xn_net3827270), .RN(n747), .Q(d_ff_Xn[32]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_32_ ( .D(first_mux_X[32]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n747), .Q(d_ff2_X[32]) );
  DFFRXLTS reg_shift_x_Q_reg_32_ ( .D(d_ff2_X[32]), .CK(reg_shift_y_net3827270), .RN(n747), .Q(d_ff3_sh_x_out[32]) );
  DFFRXLTS d_ff4_Xn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Xn_net3827270), .RN(n747), .Q(d_ff_Xn[33]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_33_ ( .D(first_mux_X[33]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n747), .Q(d_ff2_X[33]) );
  DFFRXLTS reg_shift_x_Q_reg_33_ ( .D(d_ff2_X[33]), .CK(reg_shift_y_net3827270), .RN(n747), .Q(d_ff3_sh_x_out[33]) );
  DFFRXLTS d_ff4_Xn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Xn_net3827270), .RN(n747), .Q(d_ff_Xn[34]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_34_ ( .D(first_mux_X[34]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n747), .Q(d_ff2_X[34]) );
  DFFRXLTS reg_shift_x_Q_reg_34_ ( .D(d_ff2_X[34]), .CK(reg_shift_y_net3827270), .RN(n746), .Q(d_ff3_sh_x_out[34]) );
  DFFRXLTS d_ff4_Xn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Xn_net3827270), .RN(n746), .Q(d_ff_Xn[35]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_35_ ( .D(first_mux_X[35]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n746), .Q(d_ff2_X[35]) );
  DFFRXLTS reg_shift_x_Q_reg_35_ ( .D(d_ff2_X[35]), .CK(reg_shift_y_net3827270), .RN(n746), .Q(d_ff3_sh_x_out[35]) );
  DFFRXLTS d_ff4_Xn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Xn_net3827270), .RN(n746), .Q(d_ff_Xn[36]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_36_ ( .D(first_mux_X[36]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n746), .Q(d_ff2_X[36]) );
  DFFRXLTS reg_shift_x_Q_reg_36_ ( .D(d_ff2_X[36]), .CK(reg_shift_y_net3827270), .RN(n746), .Q(d_ff3_sh_x_out[36]) );
  DFFRXLTS d_ff4_Xn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Xn_net3827270), .RN(n746), .Q(d_ff_Xn[37]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_37_ ( .D(first_mux_X[37]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n746), .Q(d_ff2_X[37]) );
  DFFRXLTS reg_shift_x_Q_reg_37_ ( .D(d_ff2_X[37]), .CK(reg_shift_y_net3827270), .RN(n746), .Q(d_ff3_sh_x_out[37]) );
  DFFRXLTS d_ff4_Xn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Xn_net3827270), .RN(n746), .Q(d_ff_Xn[38]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_38_ ( .D(first_mux_X[38]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n746), .Q(d_ff2_X[38]) );
  DFFRXLTS reg_shift_x_Q_reg_38_ ( .D(d_ff2_X[38]), .CK(reg_shift_y_net3827270), .RN(n745), .Q(d_ff3_sh_x_out[38]) );
  DFFRXLTS d_ff4_Xn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Xn_net3827270), .RN(n745), .Q(d_ff_Xn[39]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_39_ ( .D(first_mux_X[39]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n745), .Q(d_ff2_X[39]) );
  DFFRXLTS reg_shift_x_Q_reg_39_ ( .D(d_ff2_X[39]), .CK(reg_shift_y_net3827270), .RN(n745), .Q(d_ff3_sh_x_out[39]) );
  DFFRXLTS d_ff4_Xn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Xn_net3827270), .RN(n745), .Q(d_ff_Xn[40]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_40_ ( .D(first_mux_X[40]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n745), .Q(d_ff2_X[40]) );
  DFFRXLTS reg_shift_x_Q_reg_40_ ( .D(d_ff2_X[40]), .CK(reg_shift_y_net3827270), .RN(n745), .Q(d_ff3_sh_x_out[40]) );
  DFFRXLTS d_ff4_Xn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Xn_net3827270), .RN(n745), .Q(d_ff_Xn[41]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_41_ ( .D(first_mux_X[41]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n745), .Q(d_ff2_X[41]) );
  DFFRXLTS reg_shift_x_Q_reg_41_ ( .D(d_ff2_X[41]), .CK(reg_shift_y_net3827270), .RN(n745), .Q(d_ff3_sh_x_out[41]) );
  DFFRXLTS d_ff4_Xn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Xn_net3827270), .RN(n745), .Q(d_ff_Xn[42]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_42_ ( .D(first_mux_X[42]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n745), .Q(d_ff2_X[42]) );
  DFFRXLTS reg_shift_x_Q_reg_42_ ( .D(d_ff2_X[42]), .CK(reg_shift_y_net3827270), .RN(n744), .Q(d_ff3_sh_x_out[42]) );
  DFFRXLTS d_ff4_Xn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Xn_net3827270), .RN(n744), .Q(d_ff_Xn[43]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_43_ ( .D(first_mux_X[43]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n744), .Q(d_ff2_X[43]) );
  DFFRXLTS reg_shift_x_Q_reg_43_ ( .D(d_ff2_X[43]), .CK(reg_shift_y_net3827270), .RN(n744), .Q(d_ff3_sh_x_out[43]) );
  DFFRXLTS d_ff4_Xn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Xn_net3827270), .RN(n744), .Q(d_ff_Xn[44]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_44_ ( .D(first_mux_X[44]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n744), .Q(d_ff2_X[44]) );
  DFFRXLTS reg_shift_x_Q_reg_44_ ( .D(d_ff2_X[44]), .CK(reg_shift_y_net3827270), .RN(n744), .Q(d_ff3_sh_x_out[44]) );
  DFFRXLTS d_ff4_Xn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Xn_net3827270), .RN(n744), .Q(d_ff_Xn[45]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_45_ ( .D(first_mux_X[45]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n744), .Q(d_ff2_X[45]) );
  DFFRXLTS reg_shift_x_Q_reg_45_ ( .D(d_ff2_X[45]), .CK(reg_shift_y_net3827270), .RN(n744), .Q(d_ff3_sh_x_out[45]) );
  DFFRXLTS d_ff4_Xn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Xn_net3827270), .RN(n744), .Q(d_ff_Xn[46]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_46_ ( .D(first_mux_X[46]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n744), .Q(d_ff2_X[46]) );
  DFFRXLTS reg_shift_x_Q_reg_46_ ( .D(d_ff2_X[46]), .CK(reg_shift_y_net3827270), .RN(n761), .Q(d_ff3_sh_x_out[46]) );
  DFFRXLTS d_ff4_Xn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Xn_net3827270), .RN(n757), .Q(d_ff_Xn[47]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_47_ ( .D(first_mux_X[47]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n719), .Q(d_ff2_X[47]) );
  DFFRXLTS reg_shift_x_Q_reg_47_ ( .D(d_ff2_X[47]), .CK(reg_shift_y_net3827270), .RN(n749), .Q(d_ff3_sh_x_out[47]) );
  DFFRXLTS d_ff4_Xn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Xn_net3827270), .RN(n748), .Q(d_ff_Xn[48]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_48_ ( .D(first_mux_X[48]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n762), .Q(d_ff2_X[48]) );
  DFFRXLTS reg_shift_x_Q_reg_48_ ( .D(d_ff2_X[48]), .CK(reg_shift_y_net3827270), .RN(n765), .Q(d_ff3_sh_x_out[48]) );
  DFFRXLTS d_ff4_Xn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Xn_net3827270), .RN(n764), .Q(d_ff_Xn[49]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_49_ ( .D(first_mux_X[49]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n763), .Q(d_ff2_X[49]) );
  DFFRXLTS reg_shift_x_Q_reg_49_ ( .D(d_ff2_X[49]), .CK(reg_shift_y_net3827270), .RN(n756), .Q(d_ff3_sh_x_out[49]) );
  DFFRXLTS d_ff4_Xn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Xn_net3827270), .RN(n762), .Q(d_ff_Xn[50]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_50_ ( .D(first_mux_X[50]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n765), .Q(d_ff2_X[50]) );
  DFFRXLTS reg_shift_x_Q_reg_50_ ( .D(d_ff2_X[50]), .CK(reg_shift_y_net3827270), .RN(n743), .Q(d_ff3_sh_x_out[50]) );
  DFFRXLTS d_ff4_Xn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Xn_net3827270), .RN(n743), .Q(d_ff_Xn[51]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_51_ ( .D(first_mux_X[51]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n743), .Q(d_ff2_X[51]) );
  DFFRXLTS reg_shift_x_Q_reg_51_ ( .D(d_ff2_X[51]), .CK(reg_shift_y_net3827270), .RN(n743), .Q(d_ff3_sh_x_out[51]) );
  DFFRXLTS d_ff4_Xn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Xn_net3827270), .RN(n743), .Q(d_ff_Xn[52]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_52_ ( .D(first_mux_X[52]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n743), .Q(d_ff2_X[52]), .QN(n430)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Xn_net3827270), .RN(n743), .Q(d_ff_Xn[53]) );
  DFFRXLTS d_ff4_Xn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Xn_net3827270), .RN(n743), .Q(d_ff_Xn[54]) );
  DFFRXLTS d_ff4_Xn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Xn_net3827270), .RN(n743), .Q(d_ff_Xn[55]) );
  DFFRXLTS d_ff4_Xn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Xn_net3827270), .RN(n742), .Q(d_ff_Xn[56]) );
  DFFRXLTS d_ff4_Xn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Xn_net3827270), .RN(n742), .Q(d_ff_Xn[57]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_57_ ( .D(first_mux_X[57]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n742), .Q(d_ff2_X[57]), .QN(n715)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Xn_net3827270), .RN(n742), .Q(d_ff_Xn[58]) );
  DFFRXLTS d_ff4_Xn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Xn_net3827270), .RN(n742), .Q(d_ff_Xn[59]) );
  DFFRXLTS d_ff4_Xn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Xn_net3827270), .RN(n742), .Q(d_ff_Xn[60]) );
  DFFRXLTS d_ff4_Xn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Xn_net3827270), .RN(n742), .Q(d_ff_Xn[61]) );
  DFFRXLTS d_ff4_Xn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Xn_net3827270), .RN(n428), .Q(d_ff_Xn[62]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_62_ ( .D(first_mux_X[62]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n428), .Q(d_ff2_X[62]) );
  DFFRXLTS d_ff4_Xn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Xn_net3827270), .RN(n428), .Q(d_ff_Xn[63]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_63_ ( .D(first_mux_X[63]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n428), .Q(d_ff2_X[63]) );
  DFFRXLTS reg_shift_x_Q_reg_63_ ( .D(d_ff2_X[63]), .CK(reg_shift_y_net3827270), .RN(n428), .Q(d_ff3_sh_x_out[63]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3827270), .RN(n428), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n428), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3827270), 
        .RN(n428), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3827270), .RN(n428), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n428), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3827270), 
        .RN(n428), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3827270), .RN(n428), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n428), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3827270), 
        .RN(n741), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3827270), .RN(n428), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n741), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3827270), 
        .RN(n428), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3827270), .RN(n741), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n428), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3827270), 
        .RN(n741), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3827270), .RN(n428), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n741), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3827270), 
        .RN(n428), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3827270), .RN(n741), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n741), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3827270), 
        .RN(n741), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3827270), .RN(n741), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n741), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3827270), 
        .RN(n741), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3827270), .RN(n741), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n741), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3827270), 
        .RN(n741), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3827270), .RN(n741), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n741), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3827270), 
        .RN(n741), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3827270), .RN(n741), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n740), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3827270), .RN(n740), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3827270), .RN(n740), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n740), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3827270), .RN(n740), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3827270), .RN(n740), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n740), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3827270), .RN(n740), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3827270), .RN(n740), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n740), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3827270), .RN(n740), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3827270), .RN(n740), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n760), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3827270), .RN(n759), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3827270), .RN(n758), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n738), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3827270), .RN(n737), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3827270), .RN(n739), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n743), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3827270), .RN(n742), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3827270), .RN(n735), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n746), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3827270), .RN(n744), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3827270), .RN(n722), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n739), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3827270), .RN(n739), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3827270), .RN(n739), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n739), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3827270), .RN(n739), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3827270), .RN(n739), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n739), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3827270), .RN(n739), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3827270), .RN(n739), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n739), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3827270), .RN(n739), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3827270), .RN(n739), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n737), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3827270), .RN(n738), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3827270), .RN(n722), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n742), .Q(d_ff2_Y[23]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(d_ff2_Y[23]), .CK(reg_shift_y_net3827270), .RN(n740), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3827270), .RN(n723), .Q(d_ff_Yn[24]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n736), .Q(d_ff2_Y[24]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(d_ff2_Y[24]), .CK(reg_shift_y_net3827270), .RN(n734), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3827270), .RN(n757), .Q(d_ff_Yn[25]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n721), .Q(d_ff2_Y[25]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(d_ff2_Y[25]), .CK(reg_shift_y_net3827270), .RN(n764), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3827270), .RN(n724), .Q(d_ff_Yn[26]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n738), .Q(d_ff2_Y[26]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(d_ff2_Y[26]), .CK(reg_shift_y_net3827270), .RN(n738), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3827270), .RN(n738), .Q(d_ff_Yn[27]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n738), .Q(d_ff2_Y[27]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(d_ff2_Y[27]), .CK(reg_shift_y_net3827270), .RN(n738), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3827270), .RN(n738), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n738), .Q(d_ff2_Y[28]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(d_ff2_Y[28]), .CK(reg_shift_y_net3827270), .RN(n738), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3827270), .RN(n738), .Q(d_ff_Yn[29]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n738), .Q(d_ff2_Y[29]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(d_ff2_Y[29]), .CK(reg_shift_y_net3827270), .RN(n738), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3827270), .RN(n738), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n737), .Q(d_ff2_Y[30]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(d_ff2_Y[30]), .CK(reg_shift_y_net3827270), .RN(n737), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3827270), .RN(n737), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n737), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3827270), .RN(n737), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Yn_net3827270), .RN(n737), .Q(d_ff_Yn[32]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_32_ ( .D(first_mux_Y[32]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n737), .Q(d_ff2_Y[32]) );
  DFFRXLTS reg_shift_y_Q_reg_32_ ( .D(d_ff2_Y[32]), .CK(reg_shift_y_net3827270), .RN(n737), .Q(d_ff3_sh_y_out[32]) );
  DFFRXLTS d_ff4_Yn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Yn_net3827270), .RN(n737), .Q(d_ff_Yn[33]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_33_ ( .D(first_mux_Y[33]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n737), .Q(d_ff2_Y[33]) );
  DFFRXLTS reg_shift_y_Q_reg_33_ ( .D(d_ff2_Y[33]), .CK(reg_shift_y_net3827270), .RN(n737), .Q(d_ff3_sh_y_out[33]) );
  DFFRXLTS d_ff4_Yn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Yn_net3827270), .RN(n737), .Q(d_ff_Yn[34]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_34_ ( .D(first_mux_Y[34]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n736), .Q(d_ff2_Y[34]) );
  DFFRXLTS reg_shift_y_Q_reg_34_ ( .D(d_ff2_Y[34]), .CK(reg_shift_y_net3827270), .RN(n736), .Q(d_ff3_sh_y_out[34]) );
  DFFRXLTS d_ff4_Yn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Yn_net3827270), .RN(n736), .Q(d_ff_Yn[35]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_35_ ( .D(first_mux_Y[35]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n736), .Q(d_ff2_Y[35]) );
  DFFRXLTS reg_shift_y_Q_reg_35_ ( .D(d_ff2_Y[35]), .CK(reg_shift_y_net3827270), .RN(n736), .Q(d_ff3_sh_y_out[35]) );
  DFFRXLTS d_ff4_Yn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Yn_net3827270), .RN(n736), .Q(d_ff_Yn[36]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_36_ ( .D(first_mux_Y[36]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n736), .Q(d_ff2_Y[36]) );
  DFFRXLTS reg_shift_y_Q_reg_36_ ( .D(d_ff2_Y[36]), .CK(reg_shift_y_net3827270), .RN(n736), .Q(d_ff3_sh_y_out[36]) );
  DFFRXLTS d_ff4_Yn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Yn_net3827270), .RN(n736), .Q(d_ff_Yn[37]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_37_ ( .D(first_mux_Y[37]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n736), .Q(d_ff2_Y[37]) );
  DFFRXLTS reg_shift_y_Q_reg_37_ ( .D(d_ff2_Y[37]), .CK(reg_shift_y_net3827270), .RN(n736), .Q(d_ff3_sh_y_out[37]) );
  DFFRXLTS d_ff4_Yn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Yn_net3827270), .RN(n736), .Q(d_ff_Yn[38]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_38_ ( .D(first_mux_Y[38]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n735), .Q(d_ff2_Y[38]) );
  DFFRXLTS reg_shift_y_Q_reg_38_ ( .D(d_ff2_Y[38]), .CK(reg_shift_y_net3827270), .RN(n735), .Q(d_ff3_sh_y_out[38]) );
  DFFRXLTS d_ff4_Yn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Yn_net3827270), .RN(n735), .Q(d_ff_Yn[39]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_39_ ( .D(first_mux_Y[39]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n735), .Q(d_ff2_Y[39]) );
  DFFRXLTS reg_shift_y_Q_reg_39_ ( .D(d_ff2_Y[39]), .CK(reg_shift_y_net3827270), .RN(n735), .Q(d_ff3_sh_y_out[39]) );
  DFFRXLTS d_ff4_Yn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Yn_net3827270), .RN(n735), .Q(d_ff_Yn[40]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_40_ ( .D(first_mux_Y[40]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n735), .Q(d_ff2_Y[40]) );
  DFFRXLTS reg_shift_y_Q_reg_40_ ( .D(d_ff2_Y[40]), .CK(reg_shift_y_net3827270), .RN(n735), .Q(d_ff3_sh_y_out[40]) );
  DFFRXLTS d_ff4_Yn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Yn_net3827270), .RN(n735), .Q(d_ff_Yn[41]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_41_ ( .D(first_mux_Y[41]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n735), .Q(d_ff2_Y[41]) );
  DFFRXLTS reg_shift_y_Q_reg_41_ ( .D(d_ff2_Y[41]), .CK(reg_shift_y_net3827270), .RN(n735), .Q(d_ff3_sh_y_out[41]) );
  DFFRXLTS d_ff4_Yn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Yn_net3827270), .RN(n735), .Q(d_ff_Yn[42]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_42_ ( .D(first_mux_Y[42]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n734), .Q(d_ff2_Y[42]) );
  DFFRXLTS reg_shift_y_Q_reg_42_ ( .D(d_ff2_Y[42]), .CK(reg_shift_y_net3827270), .RN(n734), .Q(d_ff3_sh_y_out[42]) );
  DFFRXLTS d_ff4_Yn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Yn_net3827270), .RN(n734), .Q(d_ff_Yn[43]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_43_ ( .D(first_mux_Y[43]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n734), .Q(d_ff2_Y[43]) );
  DFFRXLTS reg_shift_y_Q_reg_43_ ( .D(d_ff2_Y[43]), .CK(reg_shift_y_net3827270), .RN(n734), .Q(d_ff3_sh_y_out[43]) );
  DFFRXLTS d_ff4_Yn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Yn_net3827270), .RN(n734), .Q(d_ff_Yn[44]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_44_ ( .D(first_mux_Y[44]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n734), .Q(d_ff2_Y[44]) );
  DFFRXLTS reg_shift_y_Q_reg_44_ ( .D(d_ff2_Y[44]), .CK(reg_shift_y_net3827270), .RN(n734), .Q(d_ff3_sh_y_out[44]) );
  DFFRXLTS d_ff4_Yn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Yn_net3827270), .RN(n734), .Q(d_ff_Yn[45]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_45_ ( .D(first_mux_Y[45]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n734), .Q(d_ff2_Y[45]) );
  DFFRXLTS reg_shift_y_Q_reg_45_ ( .D(d_ff2_Y[45]), .CK(reg_shift_y_net3827270), .RN(n734), .Q(d_ff3_sh_y_out[45]) );
  DFFRXLTS d_ff4_Yn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Yn_net3827270), .RN(n734), .Q(d_ff_Yn[46]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_46_ ( .D(first_mux_Y[46]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n733), .Q(d_ff2_Y[46]) );
  DFFRXLTS reg_shift_y_Q_reg_46_ ( .D(d_ff2_Y[46]), .CK(reg_shift_y_net3827270), .RN(n733), .Q(d_ff3_sh_y_out[46]) );
  DFFRXLTS d_ff4_Yn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Yn_net3827270), .RN(n733), .Q(d_ff_Yn[47]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_47_ ( .D(first_mux_Y[47]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n733), .Q(d_ff2_Y[47]) );
  DFFRXLTS reg_shift_y_Q_reg_47_ ( .D(d_ff2_Y[47]), .CK(reg_shift_y_net3827270), .RN(n733), .Q(d_ff3_sh_y_out[47]) );
  DFFRXLTS d_ff4_Yn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Yn_net3827270), .RN(n733), .Q(d_ff_Yn[48]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_48_ ( .D(first_mux_Y[48]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n733), .Q(d_ff2_Y[48]) );
  DFFRXLTS reg_shift_y_Q_reg_48_ ( .D(d_ff2_Y[48]), .CK(reg_shift_y_net3827270), .RN(n733), .Q(d_ff3_sh_y_out[48]) );
  DFFRXLTS d_ff4_Yn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Yn_net3827270), .RN(n733), .Q(d_ff_Yn[49]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_49_ ( .D(first_mux_Y[49]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n733), .Q(d_ff2_Y[49]) );
  DFFRXLTS reg_shift_y_Q_reg_49_ ( .D(d_ff2_Y[49]), .CK(reg_shift_y_net3827270), .RN(n733), .Q(d_ff3_sh_y_out[49]) );
  DFFRXLTS d_ff4_Yn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Yn_net3827270), .RN(n733), .Q(d_ff_Yn[50]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_50_ ( .D(first_mux_Y[50]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n732), .Q(d_ff2_Y[50]) );
  DFFRXLTS reg_shift_y_Q_reg_50_ ( .D(d_ff2_Y[50]), .CK(reg_shift_y_net3827270), .RN(n732), .Q(d_ff3_sh_y_out[50]) );
  DFFRXLTS d_ff4_Yn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Yn_net3827270), .RN(n732), .Q(d_ff_Yn[51]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_51_ ( .D(first_mux_Y[51]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n732), .Q(d_ff2_Y[51]) );
  DFFRXLTS reg_shift_y_Q_reg_51_ ( .D(d_ff2_Y[51]), .CK(reg_shift_y_net3827270), .RN(n732), .Q(d_ff3_sh_y_out[51]) );
  DFFRXLTS d_ff4_Yn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Yn_net3827270), .RN(n732), .Q(d_ff_Yn[52]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_52_ ( .D(first_mux_Y[52]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n732), .Q(d_ff2_Y[52]), .QN(n431)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Yn_net3827270), .RN(n732), .Q(d_ff_Yn[53]) );
  DFFRXLTS d_ff4_Yn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Yn_net3827270), .RN(n732), .Q(d_ff_Yn[54]) );
  DFFRXLTS d_ff4_Yn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Yn_net3827270), .RN(n732), .Q(d_ff_Yn[55]) );
  DFFRXLTS d_ff4_Yn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Yn_net3827270), .RN(n731), .Q(d_ff_Yn[56]) );
  DFFRXLTS d_ff4_Yn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Yn_net3827270), .RN(n731), .Q(d_ff_Yn[57]) );
  DFFRXLTS d_ff4_Yn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Yn_net3827270), .RN(n731), .Q(d_ff_Yn[58]) );
  DFFRXLTS d_ff4_Yn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Yn_net3827270), .RN(n731), .Q(d_ff_Yn[59]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_59_ ( .D(first_mux_Y[59]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n731), .Q(d_ff2_Y[59]), .QN(n432)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Yn_net3827270), .RN(n731), .Q(d_ff_Yn[60]) );
  DFFRXLTS d_ff4_Yn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Yn_net3827270), .RN(n731), .Q(d_ff_Yn[61]) );
  DFFRXLTS d_ff4_Yn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Yn_net3827270), .RN(n730), .Q(d_ff_Yn[62]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_62_ ( .D(first_mux_Y[62]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n730), .Q(d_ff2_Y[62]) );
  DFFRXLTS d_ff4_Yn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Yn_net3827270), .RN(n730), .Q(d_ff_Yn[63]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_63_ ( .D(first_mux_Y[63]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n730), .Q(d_ff2_Y[63]) );
  DFFRXLTS reg_shift_y_Q_reg_63_ ( .D(d_ff2_Y[63]), .CK(reg_shift_y_net3827270), .RN(n730), .Q(d_ff3_sh_y_out[63]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3827270), .RN(n730), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n730), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3827270), .RN(n730), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n730), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3827270), .RN(n730), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n730), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3827270), .RN(n729), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n729), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3827270), .RN(n729), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n729), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3827270), .RN(n729), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n729), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3827270), .RN(n729), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n729), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3827270), .RN(n729), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n729), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3827270), .RN(n729), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n729), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3827270), .RN(n728), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n728), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3827270), .RN(n728), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n728), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3827270), .RN(n728), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n728), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3827270), .RN(n728), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n728), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3827270), .RN(n728), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n728), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3827270), .RN(n728), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n728), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3827270), .RN(n727), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n727), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3827270), .RN(n727), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n727), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3827270), .RN(n727), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n727), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3827270), .RN(n727), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n727), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3827270), .RN(n727), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n727), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3827270), .RN(n727), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n727), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3827270), .RN(n726), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n726), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3827270), .RN(n726), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n726), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3827270), .RN(n726), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n726), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3827270), .RN(n726), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n726), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3827270), .RN(n726), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n726), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3827270), .RN(n726), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n726), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3827270), .RN(n725), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n725), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3827270), .RN(n725), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n725), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3827270), .RN(n725), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n725), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3827270), .RN(n725), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n725), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3827270), .RN(n725), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n725), .Q(d_ff2_Z[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Zn_net3827270), .RN(n725), .Q(d_ff_Zn[32]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_32_ ( .D(first_mux_Z[32]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n725), .Q(d_ff2_Z[32]) );
  DFFRXLTS d_ff4_Zn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Zn_net3827270), .RN(n724), .Q(d_ff_Zn[33]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_33_ ( .D(first_mux_Z[33]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n724), .Q(d_ff2_Z[33]) );
  DFFRXLTS d_ff4_Zn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Zn_net3827270), .RN(n724), .Q(d_ff_Zn[34]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_34_ ( .D(first_mux_Z[34]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n724), .Q(d_ff2_Z[34]) );
  DFFRXLTS d_ff4_Zn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Zn_net3827270), .RN(n724), .Q(d_ff_Zn[35]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_35_ ( .D(first_mux_Z[35]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n724), .Q(d_ff2_Z[35]) );
  DFFRXLTS d_ff4_Zn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Zn_net3827270), .RN(n724), .Q(d_ff_Zn[36]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_36_ ( .D(first_mux_Z[36]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n724), .Q(d_ff2_Z[36]) );
  DFFRXLTS d_ff4_Zn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Zn_net3827270), .RN(n724), .Q(d_ff_Zn[37]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_37_ ( .D(first_mux_Z[37]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n724), .Q(d_ff2_Z[37]) );
  DFFRXLTS d_ff4_Zn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Zn_net3827270), .RN(n724), .Q(d_ff_Zn[38]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_38_ ( .D(first_mux_Z[38]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n724), .Q(d_ff2_Z[38]) );
  DFFRXLTS d_ff4_Zn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Zn_net3827270), .RN(n723), .Q(d_ff_Zn[39]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_39_ ( .D(first_mux_Z[39]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n723), .Q(d_ff2_Z[39]) );
  DFFRXLTS d_ff4_Zn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Zn_net3827270), .RN(n723), .Q(d_ff_Zn[40]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_40_ ( .D(first_mux_Z[40]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n723), .Q(d_ff2_Z[40]) );
  DFFRXLTS d_ff4_Zn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Zn_net3827270), .RN(n723), .Q(d_ff_Zn[41]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_41_ ( .D(first_mux_Z[41]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n723), .Q(d_ff2_Z[41]) );
  DFFRXLTS d_ff4_Zn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Zn_net3827270), .RN(n723), .Q(d_ff_Zn[42]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_42_ ( .D(first_mux_Z[42]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n723), .Q(d_ff2_Z[42]) );
  DFFRXLTS d_ff4_Zn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Zn_net3827270), .RN(n723), .Q(d_ff_Zn[43]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_43_ ( .D(first_mux_Z[43]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n723), .Q(d_ff2_Z[43]) );
  DFFRXLTS d_ff4_Zn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Zn_net3827270), .RN(n723), .Q(d_ff_Zn[44]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_44_ ( .D(first_mux_Z[44]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n723), .Q(d_ff2_Z[44]) );
  DFFRXLTS d_ff4_Zn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Zn_net3827270), .RN(n722), .Q(d_ff_Zn[45]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_45_ ( .D(first_mux_Z[45]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n722), .Q(d_ff2_Z[45]) );
  DFFRXLTS d_ff4_Zn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Zn_net3827270), .RN(n722), .Q(d_ff_Zn[46]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_46_ ( .D(first_mux_Z[46]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n722), .Q(d_ff2_Z[46]) );
  DFFRXLTS d_ff4_Zn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Zn_net3827270), .RN(n722), .Q(d_ff_Zn[47]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_47_ ( .D(first_mux_Z[47]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n722), .Q(d_ff2_Z[47]) );
  DFFRXLTS d_ff4_Zn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Zn_net3827270), .RN(n722), .Q(d_ff_Zn[48]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_48_ ( .D(first_mux_Z[48]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n722), .Q(d_ff2_Z[48]) );
  DFFRXLTS d_ff4_Zn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Zn_net3827270), .RN(n722), .Q(d_ff_Zn[49]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_49_ ( .D(first_mux_Z[49]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n722), .Q(d_ff2_Z[49]) );
  DFFRXLTS d_ff4_Zn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Zn_net3827270), .RN(n722), .Q(d_ff_Zn[50]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_50_ ( .D(first_mux_Z[50]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n722), .Q(d_ff2_Z[50]) );
  DFFRXLTS d_ff4_Zn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Zn_net3827270), .RN(n721), .Q(d_ff_Zn[51]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_51_ ( .D(first_mux_Z[51]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n721), .Q(d_ff2_Z[51]) );
  DFFRXLTS d_ff4_Zn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Zn_net3827270), .RN(n721), .Q(d_ff_Zn[52]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_52_ ( .D(first_mux_Z[52]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n721), .Q(d_ff2_Z[52]) );
  DFFRXLTS d_ff4_Zn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Zn_net3827270), .RN(n721), .Q(d_ff_Zn[53]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_53_ ( .D(first_mux_Z[53]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n721), .Q(d_ff2_Z[53]) );
  DFFRXLTS d_ff4_Zn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Zn_net3827270), .RN(n721), .Q(d_ff_Zn[54]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_54_ ( .D(first_mux_Z[54]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n721), .Q(d_ff2_Z[54]) );
  DFFRXLTS d_ff4_Zn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Zn_net3827270), .RN(n721), .Q(d_ff_Zn[55]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_55_ ( .D(first_mux_Z[55]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n721), .Q(d_ff2_Z[55]) );
  DFFRXLTS d_ff4_Zn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Zn_net3827270), .RN(n721), .Q(d_ff_Zn[56]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_56_ ( .D(first_mux_Z[56]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n721), .Q(d_ff2_Z[56]) );
  DFFRXLTS d_ff4_Zn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Zn_net3827270), .RN(n720), .Q(d_ff_Zn[57]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_57_ ( .D(first_mux_Z[57]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n720), .Q(d_ff2_Z[57]) );
  DFFRXLTS d_ff4_Zn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Zn_net3827270), .RN(n720), .Q(d_ff_Zn[58]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_58_ ( .D(first_mux_Z[58]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n720), .Q(d_ff2_Z[58]) );
  DFFRXLTS d_ff4_Zn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Zn_net3827270), .RN(n720), .Q(d_ff_Zn[59]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_59_ ( .D(first_mux_Z[59]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n720), .Q(d_ff2_Z[59]) );
  DFFRXLTS d_ff4_Zn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Zn_net3827270), .RN(n720), .Q(d_ff_Zn[60]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_60_ ( .D(first_mux_Z[60]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n720), .Q(d_ff2_Z[60]) );
  DFFRXLTS d_ff4_Zn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Zn_net3827270), .RN(n720), .Q(d_ff_Zn[61]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_61_ ( .D(first_mux_Z[61]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n720), .Q(d_ff2_Z[61]) );
  DFFRXLTS d_ff4_Zn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Zn_net3827270), .RN(n720), .Q(d_ff_Zn[62]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_62_ ( .D(first_mux_Z[62]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n720), .Q(d_ff2_Z[62]) );
  DFFRXLTS d_ff4_Zn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Zn_net3827270), .RN(n744), .Q(d_ff_Zn[63]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_63_ ( .D(first_mux_Z[63]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n745), .Q(d_ff2_Z[63]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[63]), .CK(reg_shift_y_net3827270), 
        .RN(n746), .Q(d_ff3_sign_out) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(mux_sal[0]), .CK(d_ff5_net3827270), .RN(n735), 
        .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(sign_inv_out[0]), .CK(
        d_ff5_data_out_net3827270), .RN(n740), .Q(data_output[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(mux_sal[1]), .CK(d_ff5_net3827270), .RN(n724), 
        .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(sign_inv_out[1]), .CK(
        d_ff5_data_out_net3827270), .RN(n723), .Q(data_output[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(mux_sal[2]), .CK(d_ff5_net3827270), .RN(n736), 
        .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(sign_inv_out[2]), .CK(
        d_ff5_data_out_net3827270), .RN(n734), .Q(data_output[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(mux_sal[3]), .CK(d_ff5_net3827270), .RN(n761), 
        .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(sign_inv_out[3]), .CK(
        d_ff5_data_out_net3827270), .RN(n721), .Q(data_output[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(mux_sal[4]), .CK(d_ff5_net3827270), .RN(n763), 
        .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(sign_inv_out[4]), .CK(
        d_ff5_data_out_net3827270), .RN(n721), .Q(data_output[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(mux_sal[5]), .CK(d_ff5_net3827270), .RN(n743), 
        .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(sign_inv_out[5]), .CK(
        d_ff5_data_out_net3827270), .RN(n757), .Q(data_output[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(mux_sal[6]), .CK(d_ff5_net3827270), .RN(n724), 
        .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(sign_inv_out[6]), .CK(
        d_ff5_data_out_net3827270), .RN(n739), .Q(data_output[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(mux_sal[7]), .CK(d_ff5_net3827270), .RN(n756), 
        .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(sign_inv_out[7]), .CK(
        d_ff5_data_out_net3827270), .RN(n740), .Q(data_output[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(mux_sal[8]), .CK(d_ff5_net3827270), .RN(n720), 
        .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(sign_inv_out[8]), .CK(
        d_ff5_data_out_net3827270), .RN(n737), .Q(data_output[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(mux_sal[9]), .CK(d_ff5_net3827270), .RN(n738), 
        .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(sign_inv_out[9]), .CK(
        d_ff5_data_out_net3827270), .RN(n745), .Q(data_output[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(mux_sal[10]), .CK(d_ff5_net3827270), .RN(n720), 
        .Q(sign_inv_out[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(sign_inv_out[10]), .CK(
        d_ff5_data_out_net3827270), .RN(n744), .Q(data_output[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(mux_sal[11]), .CK(d_ff5_net3827270), .RN(n745), 
        .Q(sign_inv_out[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(sign_inv_out[11]), .CK(
        d_ff5_data_out_net3827270), .RN(n746), .Q(data_output[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(mux_sal[12]), .CK(d_ff5_net3827270), .RN(n735), 
        .Q(sign_inv_out[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(sign_inv_out[12]), .CK(
        d_ff5_data_out_net3827270), .RN(n723), .Q(data_output[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(mux_sal[13]), .CK(d_ff5_net3827270), .RN(n736), 
        .Q(sign_inv_out[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(sign_inv_out[13]), .CK(
        d_ff5_data_out_net3827270), .RN(n734), .Q(data_output[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(mux_sal[14]), .CK(d_ff5_net3827270), .RN(n722), 
        .Q(sign_inv_out[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(sign_inv_out[14]), .CK(
        d_ff5_data_out_net3827270), .RN(n720), .Q(data_output[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(mux_sal[15]), .CK(d_ff5_net3827270), .RN(n742), 
        .Q(sign_inv_out[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(sign_inv_out[15]), .CK(
        d_ff5_data_out_net3827270), .RN(n743), .Q(data_output[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(mux_sal[16]), .CK(d_ff5_net3827270), .RN(n739), 
        .Q(sign_inv_out[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(sign_inv_out[16]), .CK(
        d_ff5_data_out_net3827270), .RN(n717), .Q(data_output[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(mux_sal[17]), .CK(d_ff5_net3827270), .RN(n717), 
        .Q(sign_inv_out[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(sign_inv_out[17]), .CK(
        d_ff5_data_out_net3827270), .RN(n755), .Q(data_output[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(mux_sal[18]), .CK(d_ff5_net3827270), .RN(n717), 
        .Q(sign_inv_out[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(sign_inv_out[18]), .CK(
        d_ff5_data_out_net3827270), .RN(n753), .Q(data_output[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(mux_sal[19]), .CK(d_ff5_net3827270), .RN(n718), 
        .Q(sign_inv_out[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(sign_inv_out[19]), .CK(
        d_ff5_data_out_net3827270), .RN(n733), .Q(data_output[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(mux_sal[20]), .CK(d_ff5_net3827270), .RN(n728), 
        .Q(sign_inv_out[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(sign_inv_out[20]), .CK(
        d_ff5_data_out_net3827270), .RN(n731), .Q(data_output[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(mux_sal[21]), .CK(d_ff5_net3827270), .RN(n433), 
        .Q(sign_inv_out[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(sign_inv_out[21]), .CK(
        d_ff5_data_out_net3827270), .RN(n754), .Q(data_output[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(mux_sal[22]), .CK(d_ff5_net3827270), .RN(n732), 
        .Q(sign_inv_out[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(sign_inv_out[22]), .CK(
        d_ff5_data_out_net3827270), .RN(n753), .Q(data_output[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(mux_sal[23]), .CK(d_ff5_net3827270), .RN(n754), 
        .Q(sign_inv_out[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(sign_inv_out[23]), .CK(
        d_ff5_data_out_net3827270), .RN(n755), .Q(data_output[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(mux_sal[24]), .CK(d_ff5_net3827270), .RN(n750), 
        .Q(sign_inv_out[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(sign_inv_out[24]), .CK(
        d_ff5_data_out_net3827270), .RN(n751), .Q(data_output[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(mux_sal[25]), .CK(d_ff5_net3827270), .RN(n752), 
        .Q(sign_inv_out[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(sign_inv_out[25]), .CK(
        d_ff5_data_out_net3827270), .RN(n747), .Q(data_output[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(mux_sal[26]), .CK(d_ff5_net3827270), .RN(n748), 
        .Q(sign_inv_out[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(sign_inv_out[26]), .CK(
        d_ff5_data_out_net3827270), .RN(n749), .Q(data_output[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(mux_sal[27]), .CK(d_ff5_net3827270), .RN(n754), 
        .Q(sign_inv_out[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(sign_inv_out[27]), .CK(
        d_ff5_data_out_net3827270), .RN(n719), .Q(data_output[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(mux_sal[28]), .CK(d_ff5_net3827270), .RN(n753), 
        .Q(sign_inv_out[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(sign_inv_out[28]), .CK(
        d_ff5_data_out_net3827270), .RN(n719), .Q(data_output[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(mux_sal[29]), .CK(d_ff5_net3827270), .RN(n719), 
        .Q(sign_inv_out[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(sign_inv_out[29]), .CK(
        d_ff5_data_out_net3827270), .RN(n719), .Q(data_output[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(mux_sal[30]), .CK(d_ff5_net3827270), .RN(n719), 
        .Q(sign_inv_out[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(sign_inv_out[30]), .CK(
        d_ff5_data_out_net3827270), .RN(n719), .Q(data_output[30]) );
  DFFRXLTS d_ff5_Q_reg_31_ ( .D(mux_sal[31]), .CK(d_ff5_net3827270), .RN(n719), 
        .Q(sign_inv_out[31]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(sign_inv_out[31]), .CK(
        d_ff5_data_out_net3827270), .RN(n719), .Q(data_output[31]) );
  DFFRXLTS d_ff5_Q_reg_32_ ( .D(mux_sal[32]), .CK(d_ff5_net3827270), .RN(n719), 
        .Q(sign_inv_out[32]) );
  DFFRXLTS d_ff5_data_out_Q_reg_32_ ( .D(sign_inv_out[32]), .CK(
        d_ff5_data_out_net3827270), .RN(n719), .Q(data_output[32]) );
  DFFRXLTS d_ff5_Q_reg_33_ ( .D(mux_sal[33]), .CK(d_ff5_net3827270), .RN(n719), 
        .Q(sign_inv_out[33]) );
  DFFRXLTS d_ff5_data_out_Q_reg_33_ ( .D(sign_inv_out[33]), .CK(
        d_ff5_data_out_net3827270), .RN(n719), .Q(data_output[33]) );
  DFFRXLTS d_ff5_Q_reg_34_ ( .D(mux_sal[34]), .CK(d_ff5_net3827270), .RN(n719), 
        .Q(sign_inv_out[34]) );
  DFFRXLTS d_ff5_data_out_Q_reg_34_ ( .D(sign_inv_out[34]), .CK(
        d_ff5_data_out_net3827270), .RN(n755), .Q(data_output[34]) );
  DFFRXLTS d_ff5_Q_reg_35_ ( .D(mux_sal[35]), .CK(d_ff5_net3827270), .RN(n750), 
        .Q(sign_inv_out[35]) );
  DFFRXLTS d_ff5_data_out_Q_reg_35_ ( .D(sign_inv_out[35]), .CK(
        d_ff5_data_out_net3827270), .RN(n751), .Q(data_output[35]) );
  DFFRXLTS d_ff5_Q_reg_36_ ( .D(mux_sal[36]), .CK(d_ff5_net3827270), .RN(n752), 
        .Q(sign_inv_out[36]) );
  DFFRXLTS d_ff5_data_out_Q_reg_36_ ( .D(sign_inv_out[36]), .CK(
        d_ff5_data_out_net3827270), .RN(n747), .Q(data_output[36]) );
  DFFRXLTS d_ff5_Q_reg_37_ ( .D(mux_sal[37]), .CK(d_ff5_net3827270), .RN(n748), 
        .Q(sign_inv_out[37]) );
  DFFRXLTS d_ff5_data_out_Q_reg_37_ ( .D(sign_inv_out[37]), .CK(
        d_ff5_data_out_net3827270), .RN(n749), .Q(data_output[37]) );
  DFFRXLTS d_ff5_Q_reg_38_ ( .D(mux_sal[38]), .CK(d_ff5_net3827270), .RN(n719), 
        .Q(sign_inv_out[38]) );
  DFFRXLTS d_ff5_data_out_Q_reg_38_ ( .D(sign_inv_out[38]), .CK(
        d_ff5_data_out_net3827270), .RN(n750), .Q(data_output[38]) );
  DFFRXLTS d_ff5_Q_reg_39_ ( .D(mux_sal[39]), .CK(d_ff5_net3827270), .RN(n751), 
        .Q(sign_inv_out[39]) );
  DFFRXLTS d_ff5_data_out_Q_reg_39_ ( .D(sign_inv_out[39]), .CK(
        d_ff5_data_out_net3827270), .RN(n752), .Q(data_output[39]) );
  DFFRXLTS d_ff5_Q_reg_40_ ( .D(mux_sal[40]), .CK(d_ff5_net3827270), .RN(n747), 
        .Q(sign_inv_out[40]) );
  DFFRXLTS d_ff5_data_out_Q_reg_40_ ( .D(sign_inv_out[40]), .CK(
        d_ff5_data_out_net3827270), .RN(n732), .Q(data_output[40]) );
  DFFRXLTS d_ff5_Q_reg_41_ ( .D(mux_sal[41]), .CK(d_ff5_net3827270), .RN(n733), 
        .Q(sign_inv_out[41]) );
  DFFRXLTS d_ff5_data_out_Q_reg_41_ ( .D(sign_inv_out[41]), .CK(
        d_ff5_data_out_net3827270), .RN(n728), .Q(data_output[41]) );
  DFFRXLTS d_ff5_Q_reg_42_ ( .D(mux_sal[42]), .CK(d_ff5_net3827270), .RN(n729), 
        .Q(sign_inv_out[42]) );
  DFFRXLTS d_ff5_data_out_Q_reg_42_ ( .D(sign_inv_out[42]), .CK(
        d_ff5_data_out_net3827270), .RN(n730), .Q(data_output[42]) );
  DFFRXLTS d_ff5_Q_reg_43_ ( .D(mux_sal[43]), .CK(d_ff5_net3827270), .RN(n725), 
        .Q(sign_inv_out[43]) );
  DFFRXLTS d_ff5_data_out_Q_reg_43_ ( .D(sign_inv_out[43]), .CK(
        d_ff5_data_out_net3827270), .RN(n726), .Q(data_output[43]) );
  DFFRXLTS d_ff5_Q_reg_44_ ( .D(mux_sal[44]), .CK(d_ff5_net3827270), .RN(n727), 
        .Q(sign_inv_out[44]) );
  DFFRXLTS d_ff5_data_out_Q_reg_44_ ( .D(sign_inv_out[44]), .CK(
        d_ff5_data_out_net3827270), .RN(n733), .Q(data_output[44]) );
  DFFRXLTS d_ff5_Q_reg_45_ ( .D(mux_sal[45]), .CK(d_ff5_net3827270), .RN(n718), 
        .Q(sign_inv_out[45]) );
  DFFRXLTS d_ff5_data_out_Q_reg_45_ ( .D(sign_inv_out[45]), .CK(
        d_ff5_data_out_net3827270), .RN(n731), .Q(data_output[45]) );
  DFFRXLTS d_ff5_Q_reg_46_ ( .D(mux_sal[46]), .CK(d_ff5_net3827270), .RN(n732), 
        .Q(sign_inv_out[46]) );
  DFFRXLTS d_ff5_data_out_Q_reg_46_ ( .D(sign_inv_out[46]), .CK(
        d_ff5_data_out_net3827270), .RN(n718), .Q(data_output[46]) );
  DFFRXLTS d_ff5_Q_reg_47_ ( .D(mux_sal[47]), .CK(d_ff5_net3827270), .RN(n718), 
        .Q(sign_inv_out[47]) );
  DFFRXLTS d_ff5_data_out_Q_reg_47_ ( .D(sign_inv_out[47]), .CK(
        d_ff5_data_out_net3827270), .RN(n718), .Q(data_output[47]) );
  DFFRXLTS d_ff5_Q_reg_48_ ( .D(mux_sal[48]), .CK(d_ff5_net3827270), .RN(n718), 
        .Q(sign_inv_out[48]) );
  DFFRXLTS d_ff5_data_out_Q_reg_48_ ( .D(sign_inv_out[48]), .CK(
        d_ff5_data_out_net3827270), .RN(n718), .Q(data_output[48]) );
  DFFRXLTS d_ff5_Q_reg_49_ ( .D(mux_sal[49]), .CK(d_ff5_net3827270), .RN(n718), 
        .Q(sign_inv_out[49]) );
  DFFRXLTS d_ff5_data_out_Q_reg_49_ ( .D(sign_inv_out[49]), .CK(
        d_ff5_data_out_net3827270), .RN(n718), .Q(data_output[49]) );
  DFFRXLTS d_ff5_Q_reg_50_ ( .D(mux_sal[50]), .CK(d_ff5_net3827270), .RN(n718), 
        .Q(sign_inv_out[50]) );
  DFFRXLTS d_ff5_data_out_Q_reg_50_ ( .D(sign_inv_out[50]), .CK(
        d_ff5_data_out_net3827270), .RN(n718), .Q(data_output[50]) );
  DFFRXLTS d_ff5_Q_reg_51_ ( .D(mux_sal[51]), .CK(d_ff5_net3827270), .RN(n718), 
        .Q(sign_inv_out[51]) );
  DFFRXLTS d_ff5_data_out_Q_reg_51_ ( .D(sign_inv_out[51]), .CK(
        d_ff5_data_out_net3827270), .RN(n718), .Q(data_output[51]) );
  DFFRXLTS d_ff5_Q_reg_52_ ( .D(mux_sal[52]), .CK(d_ff5_net3827270), .RN(n718), 
        .Q(sign_inv_out[52]) );
  DFFRXLTS d_ff5_data_out_Q_reg_52_ ( .D(sign_inv_out[52]), .CK(
        d_ff5_data_out_net3827270), .RN(n728), .Q(data_output[52]) );
  DFFRXLTS d_ff5_Q_reg_53_ ( .D(mux_sal[53]), .CK(d_ff5_net3827270), .RN(n729), 
        .Q(sign_inv_out[53]) );
  DFFRXLTS d_ff5_data_out_Q_reg_53_ ( .D(sign_inv_out[53]), .CK(
        d_ff5_data_out_net3827270), .RN(n730), .Q(data_output[53]) );
  DFFRXLTS d_ff5_Q_reg_54_ ( .D(mux_sal[54]), .CK(d_ff5_net3827270), .RN(n725), 
        .Q(sign_inv_out[54]) );
  DFFRXLTS d_ff5_data_out_Q_reg_54_ ( .D(sign_inv_out[54]), .CK(
        d_ff5_data_out_net3827270), .RN(n726), .Q(data_output[54]) );
  DFFRXLTS d_ff5_Q_reg_55_ ( .D(mux_sal[55]), .CK(d_ff5_net3827270), .RN(n727), 
        .Q(sign_inv_out[55]) );
  DFFRXLTS d_ff5_data_out_Q_reg_55_ ( .D(sign_inv_out[55]), .CK(
        d_ff5_data_out_net3827270), .RN(n718), .Q(data_output[55]) );
  DFFRXLTS d_ff5_Q_reg_56_ ( .D(mux_sal[56]), .CK(d_ff5_net3827270), .RN(n731), 
        .Q(sign_inv_out[56]) );
  DFFRXLTS d_ff5_data_out_Q_reg_56_ ( .D(sign_inv_out[56]), .CK(
        d_ff5_data_out_net3827270), .RN(n729), .Q(data_output[56]) );
  DFFRXLTS d_ff5_Q_reg_57_ ( .D(mux_sal[57]), .CK(d_ff5_net3827270), .RN(n730), 
        .Q(sign_inv_out[57]) );
  DFFRXLTS d_ff5_data_out_Q_reg_57_ ( .D(sign_inv_out[57]), .CK(
        d_ff5_data_out_net3827270), .RN(n725), .Q(data_output[57]) );
  DFFRXLTS d_ff5_Q_reg_58_ ( .D(mux_sal[58]), .CK(d_ff5_net3827270), .RN(n726), 
        .Q(sign_inv_out[58]) );
  DFFRXLTS d_ff5_data_out_Q_reg_58_ ( .D(sign_inv_out[58]), .CK(
        d_ff5_data_out_net3827270), .RN(n717), .Q(data_output[58]) );
  DFFRXLTS d_ff5_Q_reg_59_ ( .D(mux_sal[59]), .CK(d_ff5_net3827270), .RN(n717), 
        .Q(sign_inv_out[59]) );
  DFFRXLTS d_ff5_data_out_Q_reg_59_ ( .D(sign_inv_out[59]), .CK(
        d_ff5_data_out_net3827270), .RN(n717), .Q(data_output[59]) );
  DFFRXLTS d_ff5_Q_reg_60_ ( .D(mux_sal[60]), .CK(d_ff5_net3827270), .RN(n717), 
        .Q(sign_inv_out[60]) );
  DFFRXLTS d_ff5_data_out_Q_reg_60_ ( .D(sign_inv_out[60]), .CK(
        d_ff5_data_out_net3827270), .RN(n717), .Q(data_output[60]) );
  DFFRXLTS d_ff5_Q_reg_61_ ( .D(mux_sal[61]), .CK(d_ff5_net3827270), .RN(n717), 
        .Q(sign_inv_out[61]) );
  DFFRXLTS d_ff5_data_out_Q_reg_61_ ( .D(sign_inv_out[61]), .CK(
        d_ff5_data_out_net3827270), .RN(n717), .Q(data_output[61]) );
  DFFRXLTS d_ff5_Q_reg_62_ ( .D(mux_sal[62]), .CK(d_ff5_net3827270), .RN(n717), 
        .Q(sign_inv_out[62]) );
  DFFRXLTS d_ff5_data_out_Q_reg_62_ ( .D(sign_inv_out[62]), .CK(
        d_ff5_data_out_net3827270), .RN(n717), .Q(data_output[62]) );
  DFFRXLTS d_ff5_Q_reg_63_ ( .D(mux_sal[63]), .CK(d_ff5_net3827270), .RN(n717), 
        .Q(data_output2_63_) );
  DFFRXLTS d_ff5_data_out_Q_reg_63_ ( .D(sign_inv_out[63]), .CK(
        d_ff5_data_out_net3827270), .RN(n717), .Q(data_output[63]) );
  SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W64_EW11_SW52_SWR55_EWR6_1 clk_gate_reg_ch_mux_2_Q_reg ( 
        .CLK(clk), .EN(n770), .ENCLK(n768), .TE(1'b0) );
  DFFRXLTS reg_LUT_Q_reg_48_ ( .D(1'b1), .CK(reg_shift_y_net3827270), .RN(n717), .Q(d_ff3_LUT_out[48]) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3827270), .RN(n766), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n713) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n290), .CK(n768), .RN(n766), .Q(
        cont_var_out[1]), .QN(n709) );
  DFFRX2TS cont_iter_count_reg_1_ ( .D(n772), .CK(cont_iter_net3827306), .RN(
        n766), .Q(cont_iter_out[1]), .QN(n708) );
  DFFRX2TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n276), .Q(cordic_FSM_state_reg[1]), .QN(n707) );
  DFFRX2TS cont_var_count_reg_0_ ( .D(n289), .CK(n768), .RN(n766), .Q(
        cont_var_out[0]), .QN(n705) );
  DFFRX2TS cont_iter_count_reg_2_ ( .D(n771), .CK(cont_iter_net3827306), .RN(
        n766), .Q(cont_iter_out[2]), .QN(n703) );
  DFFRX4TS cont_iter_count_reg_0_ ( .D(n773), .CK(cont_iter_net3827306), .RN(
        n766), .Q(n716), .QN(n767) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_59_ ( .D(first_mux_X[59]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n742), .Q(d_ff2_X[59]), .QN(n710)
         );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3827270), 
        .RN(n766), .Q(d_ff1_operation_out) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_56_ ( .D(first_mux_Y[56]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n731), .Q(d_ff2_Y[56]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_56_ ( .D(first_mux_X[56]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n742), .Q(d_ff2_X[56]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_61_ ( .D(first_mux_Y[61]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n730), .Q(d_ff2_Y[61]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_61_ ( .D(first_mux_X[61]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n742), .Q(d_ff2_X[61]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_60_ ( .D(first_mux_Y[60]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n731), .Q(d_ff2_Y[60]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_58_ ( .D(first_mux_Y[58]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n731), .Q(d_ff2_Y[58]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_60_ ( .D(first_mux_X[60]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n742), .Q(d_ff2_X[60]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_58_ ( .D(first_mux_X[58]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n742), .Q(d_ff2_X[58]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_55_ ( .D(first_mux_X[55]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n743), .Q(d_ff2_X[55]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_54_ ( .D(first_mux_X[54]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n743), .Q(d_ff2_X[54]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_53_ ( .D(first_mux_X[53]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n743), .Q(d_ff2_X[53]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_55_ ( .D(first_mux_Y[55]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n731), .Q(d_ff2_Y[55]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_54_ ( .D(first_mux_Y[54]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n732), .Q(d_ff2_Y[54]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_53_ ( .D(first_mux_Y[53]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n732), .Q(d_ff2_Y[53]) );
  DFFRX4TS cont_iter_count_reg_3_ ( .D(n774), .CK(cont_iter_net3827306), .RN(
        n766), .Q(cont_iter_out[3]), .QN(n704) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n282), .CK(n768), .RN(n765), .Q(
        sel_mux_2_reg[1]) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3827270), .RN(n766), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX4TS cordic_FSM_state_reg_reg_3_ ( .D(n291), .CK(n768), .RN(n276), .Q(
        cordic_FSM_state_reg[3]), .QN(n701) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_57_ ( .D(first_mux_Y[57]), .CK(
        reg_val_muxZ_2stage_net3827270), .RN(n731), .Q(d_ff2_Y[57]), .QN(n714)
         );
  ADDFX1TS intadd_458_U4 ( .A(d_ff2_Y[53]), .B(n708), .CI(intadd_458_CI), .CO(
        intadd_458_n3), .S(sh_exp_y[1]) );
  ADDFX1TS intadd_457_U4 ( .A(d_ff2_X[53]), .B(n708), .CI(intadd_457_CI), .CO(
        intadd_457_n3), .S(sh_exp_x[1]) );
  ADDFX1TS intadd_457_U3 ( .A(d_ff2_X[54]), .B(n703), .CI(intadd_457_n3), .CO(
        intadd_457_n2), .S(sh_exp_x[2]) );
  ADDFX1TS intadd_458_U3 ( .A(d_ff2_Y[54]), .B(n703), .CI(intadd_458_n3), .CO(
        intadd_458_n2), .S(sh_exp_y[2]) );
  ADDFX1TS intadd_457_U2 ( .A(d_ff2_X[55]), .B(n704), .CI(intadd_457_n2), .CO(
        intadd_457_n1), .S(sh_exp_x[3]) );
  ADDFX1TS intadd_458_U2 ( .A(d_ff2_Y[55]), .B(n704), .CI(intadd_458_n2), .CO(
        intadd_458_n1), .S(sh_exp_y[3]) );
  DFFRX4TS cordic_FSM_state_reg_reg_2_ ( .D(n292), .CK(clk), .RN(n276), .Q(
        cordic_FSM_state_reg[2]) );
  DFFRX4TS cordic_FSM_state_reg_reg_0_ ( .D(n293), .CK(clk), .RN(n276), .Q(
        cordic_FSM_state_reg[0]), .QN(n423) );
  DFFRX4TS reg_ch_mux_3_Q_reg_0_ ( .D(n285), .CK(n768), .RN(n766), .Q(n702), 
        .QN(n711) );
  DFFRX4TS reg_ch_mux_1_Q_reg_0_ ( .D(n284), .CK(n768), .RN(n765), .Q(
        sel_mux_1_reg), .QN(n712) );
  AOI222X1TS U757 ( .A0(d_ff2_Y[62]), .A1(n683), .B0(d_ff2_X[62]), .B1(n658), 
        .C0(n424), .C1(d_ff2_Z[62]), .Y(n470) );
  AOI222X1TS U758 ( .A0(n526), .A1(d_ff3_LUT_out[22]), .B0(n569), .B1(
        d_ff3_sh_x_out[22]), .C0(n514), .C1(d_ff3_sh_y_out[22]), .Y(n520) );
  AOI222X1TS U759 ( .A0(n549), .A1(d_ff3_LUT_out[1]), .B0(n569), .B1(
        d_ff3_sh_x_out[1]), .C0(n572), .C1(d_ff3_sh_y_out[1]), .Y(n524) );
  AOI222X1TS U760 ( .A0(n549), .A1(d_ff3_LUT_out[3]), .B0(n569), .B1(
        d_ff3_sh_x_out[3]), .C0(n572), .C1(d_ff3_sh_y_out[3]), .Y(n523) );
  NOR2XLTS U761 ( .A(n586), .B(n557), .Y(enab_d_ff4_Yn) );
  INVX8TS U762 ( .A(n433), .Y(n434) );
  BUFX6TS U763 ( .A(n440), .Y(n514) );
  AOI222X1TS U764 ( .A0(n546), .A1(d_ff2_Z[25]), .B0(n482), .B1(d_ff2_Y[25]), 
        .C0(n514), .C1(d_ff2_X[25]), .Y(n485) );
  AOI222X1TS U765 ( .A0(n526), .A1(d_ff2_Z[43]), .B0(n482), .B1(d_ff2_Y[43]), 
        .C0(n687), .C1(d_ff2_X[43]), .Y(n517) );
  AOI222X1TS U766 ( .A0(n546), .A1(d_ff2_Z[23]), .B0(n482), .B1(d_ff2_Y[23]), 
        .C0(n514), .C1(d_ff2_X[23]), .Y(n483) );
  AOI222X1TS U767 ( .A0(n526), .A1(d_ff2_Z[44]), .B0(n482), .B1(d_ff2_Y[44]), 
        .C0(n677), .C1(d_ff2_X[44]), .Y(n510) );
  BUFX6TS U768 ( .A(n434), .Y(n436) );
  AOI222X1TS U769 ( .A0(n526), .A1(d_ff2_Z[41]), .B0(n482), .B1(d_ff2_Y[41]), 
        .C0(n687), .C1(d_ff2_X[41]), .Y(n516) );
  AOI222X1TS U770 ( .A0(n546), .A1(d_ff2_Z[21]), .B0(n482), .B1(d_ff2_Y[21]), 
        .C0(n514), .C1(d_ff2_X[21]), .Y(n487) );
  AOI222X1TS U771 ( .A0(n526), .A1(d_ff2_Z[42]), .B0(n482), .B1(d_ff2_Y[42]), 
        .C0(n687), .C1(d_ff2_X[42]), .Y(n515) );
  AOI222X1TS U772 ( .A0(n526), .A1(d_ff2_Z[40]), .B0(n482), .B1(d_ff2_Y[40]), 
        .C0(n687), .C1(d_ff2_X[40]), .Y(n518) );
  AOI222X1TS U773 ( .A0(n549), .A1(d_ff2_Z[31]), .B0(n482), .B1(d_ff2_Y[31]), 
        .C0(n552), .C1(d_ff2_X[31]), .Y(n550) );
  BUFX6TS U774 ( .A(n514), .Y(n658) );
  BUFX6TS U775 ( .A(n468), .Y(n482) );
  BUFX3TS U776 ( .A(n439), .Y(n468) );
  NAND2X4TS U777 ( .A(n627), .B(n645), .Y(n623) );
  NOR2XLTS U778 ( .A(sel_mux_2_reg[1]), .B(n706), .Y(n439) );
  NOR2XLTS U779 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n440) );
  INVX6TS U780 ( .A(sel_mux_1_reg), .Y(n610) );
  BUFX6TS U781 ( .A(n461), .Y(n424) );
  AOI222X1TS U782 ( .A0(n549), .A1(d_ff3_LUT_out[20]), .B0(n569), .B1(
        d_ff3_sh_x_out[20]), .C0(n514), .C1(d_ff3_sh_y_out[20]), .Y(n533) );
  AOI222X1TS U783 ( .A0(n546), .A1(d_ff2_Z[17]), .B0(n573), .B1(d_ff2_Y[17]), 
        .C0(n552), .C1(d_ff2_X[17]), .Y(n547) );
  AOI222X1TS U784 ( .A0(n546), .A1(d_ff2_Z[19]), .B0(n576), .B1(d_ff2_Y[19]), 
        .C0(n514), .C1(d_ff2_X[19]), .Y(n457) );
  AOI222X1TS U785 ( .A0(n685), .A1(d_ff2_Z[30]), .B0(n573), .B1(d_ff2_Y[30]), 
        .C0(n687), .C1(d_ff2_X[30]), .Y(n568) );
  AOI222X1TS U786 ( .A0(n685), .A1(d_ff2_Z[38]), .B0(n482), .B1(d_ff2_Y[38]), 
        .C0(n687), .C1(d_ff2_X[38]), .Y(n560) );
  AOI222X1TS U787 ( .A0(n685), .A1(d_ff2_Z[39]), .B0(n482), .B1(d_ff2_Y[39]), 
        .C0(n687), .C1(d_ff2_X[39]), .Y(n561) );
  AOI222X1TS U788 ( .A0(n549), .A1(d_ff2_Z[53]), .B0(n576), .B1(d_ff2_Y[53]), 
        .C0(n677), .C1(d_ff2_X[53]), .Y(n505) );
  AOI222X1TS U789 ( .A0(n549), .A1(d_ff2_Z[54]), .B0(n576), .B1(d_ff2_Y[54]), 
        .C0(n677), .C1(d_ff2_X[54]), .Y(n504) );
  AOI222X1TS U790 ( .A0(n549), .A1(d_ff2_Z[55]), .B0(n576), .B1(d_ff2_Y[55]), 
        .C0(n677), .C1(d_ff2_X[55]), .Y(n503) );
  AOI222X1TS U791 ( .A0(d_ff2_Y[56]), .A1(n576), .B0(d_ff2_X[56]), .B1(n658), 
        .C0(n546), .C1(d_ff2_Z[56]), .Y(n474) );
  AOI222X1TS U792 ( .A0(d_ff2_Y[60]), .A1(n683), .B0(d_ff2_X[60]), .B1(n658), 
        .C0(n424), .C1(d_ff2_Z[60]), .Y(n471) );
  AOI222X1TS U793 ( .A0(n549), .A1(d_ff2_Z[63]), .B0(n569), .B1(d_ff2_Y[63]), 
        .C0(n572), .C1(d_ff2_X[63]), .Y(n521) );
  OAI32X1TS U794 ( .A0(n585), .A1(n558), .A2(n709), .B0(n425), .B1(n451), .Y(
        n282) );
  OAI31X1TS U795 ( .A0(cordic_FSM_state_reg[2]), .A1(n593), .A2(n423), .B0(
        n592), .Y(n292) );
  NOR4X2TS U796 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[0]), 
        .C(n603), .D(n707), .Y(n425) );
  OR4X2TS U797 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[1]), .C(
        n603), .D(n423), .Y(n426) );
  INVX2TS U798 ( .A(n426), .Y(n427) );
  AOI222X1TS U799 ( .A0(n549), .A1(d_ff3_LUT_out[29]), .B0(n468), .B1(
        d_ff3_sh_x_out[29]), .C0(n658), .C1(d_ff3_sh_y_out[29]), .Y(n500) );
  AOI222X1TS U800 ( .A0(n549), .A1(d_ff3_LUT_out[24]), .B0(n468), .B1(
        d_ff3_sh_x_out[24]), .C0(n658), .C1(d_ff3_sh_y_out[24]), .Y(n499) );
  AOI222X1TS U801 ( .A0(n526), .A1(d_ff3_LUT_out[26]), .B0(n468), .B1(
        d_ff3_sh_x_out[26]), .C0(n658), .C1(d_ff3_sh_y_out[26]), .Y(n498) );
  NOR4X1TS U802 ( .A(cordic_FSM_state_reg[1]), .B(n603), .C(n701), .D(n423), 
        .Y(ready_cordic) );
  BUFX6TS U803 ( .A(n711), .Y(n617) );
  AOI222X1TS U804 ( .A0(n603), .A1(cordic_FSM_state_reg[1]), .B0(n603), .B1(
        n558), .C0(n707), .C1(n423), .Y(n445) );
  NOR2X2TS U805 ( .A(n708), .B(n767), .Y(n584) );
  AOI222X1TS U806 ( .A0(n685), .A1(d_ff2_Z[29]), .B0(n482), .B1(d_ff2_Y[29]), 
        .C0(n514), .C1(d_ff2_X[29]), .Y(n575) );
  AOI222X1TS U807 ( .A0(n685), .A1(d_ff2_Z[27]), .B0(n482), .B1(d_ff2_Y[27]), 
        .C0(n514), .C1(d_ff2_X[27]), .Y(n571) );
  AOI222X1TS U808 ( .A0(n685), .A1(d_ff2_Z[36]), .B0(n482), .B1(d_ff2_Y[36]), 
        .C0(n687), .C1(d_ff2_X[36]), .Y(n567) );
  AOI222X1TS U809 ( .A0(n685), .A1(d_ff2_Z[34]), .B0(n482), .B1(d_ff2_Y[34]), 
        .C0(n687), .C1(d_ff2_X[34]), .Y(n566) );
  AOI222X1TS U810 ( .A0(n685), .A1(d_ff2_Z[33]), .B0(n482), .B1(d_ff2_Y[33]), 
        .C0(n687), .C1(d_ff2_X[33]), .Y(n565) );
  AOI222X1TS U811 ( .A0(n685), .A1(d_ff2_Z[32]), .B0(n482), .B1(d_ff2_Y[32]), 
        .C0(n687), .C1(d_ff2_X[32]), .Y(n564) );
  AOI222X1TS U812 ( .A0(n685), .A1(d_ff2_Z[35]), .B0(n482), .B1(d_ff2_Y[35]), 
        .C0(n687), .C1(d_ff2_X[35]), .Y(n563) );
  AOI222X1TS U813 ( .A0(n685), .A1(d_ff2_Z[37]), .B0(n482), .B1(d_ff2_Y[37]), 
        .C0(n687), .C1(d_ff2_X[37]), .Y(n559) );
  AOI222X1TS U814 ( .A0(n685), .A1(d_ff3_LUT_out[19]), .B0(n569), .B1(
        d_ff3_sh_x_out[19]), .C0(n572), .C1(d_ff3_sh_y_out[19]), .Y(n570) );
  AOI222X1TS U815 ( .A0(n549), .A1(d_ff3_LUT_out[5]), .B0(n569), .B1(
        d_ff3_sh_x_out[5]), .C0(n572), .C1(d_ff3_sh_y_out[5]), .Y(n532) );
  AOI222X1TS U816 ( .A0(n549), .A1(d_ff3_LUT_out[18]), .B0(n569), .B1(
        d_ff3_sh_x_out[18]), .C0(n514), .C1(d_ff3_sh_y_out[18]), .Y(n531) );
  AOI222X1TS U817 ( .A0(n549), .A1(d_ff3_LUT_out[12]), .B0(n569), .B1(
        d_ff3_sh_x_out[12]), .C0(n514), .C1(d_ff3_sh_y_out[12]), .Y(n530) );
  AOI222X1TS U818 ( .A0(n549), .A1(d_ff3_LUT_out[9]), .B0(n569), .B1(
        d_ff3_sh_x_out[9]), .C0(n572), .C1(d_ff3_sh_y_out[9]), .Y(n529) );
  AOI222X1TS U819 ( .A0(n549), .A1(d_ff3_LUT_out[7]), .B0(n569), .B1(
        d_ff3_sh_x_out[7]), .C0(n572), .C1(d_ff3_sh_y_out[7]), .Y(n528) );
  AOI222X1TS U820 ( .A0(n526), .A1(d_ff3_LUT_out[6]), .B0(n569), .B1(
        d_ff3_sh_x_out[6]), .C0(n572), .C1(d_ff3_sh_y_out[6]), .Y(n527) );
  AOI222X1TS U821 ( .A0(n549), .A1(d_ff3_LUT_out[0]), .B0(n569), .B1(
        d_ff3_sh_x_out[0]), .C0(n572), .C1(d_ff3_sh_y_out[0]), .Y(n525) );
  AOI222X4TS U822 ( .A0(n424), .A1(d_ff3_LUT_out[13]), .B0(n569), .B1(
        d_ff3_sh_x_out[13]), .C0(n514), .C1(d_ff3_sh_y_out[13]), .Y(n486) );
  AOI222X4TS U823 ( .A0(n424), .A1(d_ff3_LUT_out[8]), .B0(n569), .B1(
        d_ff3_sh_x_out[8]), .C0(n572), .C1(d_ff3_sh_y_out[8]), .Y(n484) );
  AOI222X4TS U824 ( .A0(n424), .A1(d_ff3_LUT_out[10]), .B0(n569), .B1(
        d_ff3_sh_x_out[10]), .C0(n572), .C1(d_ff3_sh_y_out[10]), .Y(n481) );
  AOI222X4TS U825 ( .A0(n675), .A1(d_ff3_LUT_out[11]), .B0(n569), .B1(
        d_ff3_sh_x_out[11]), .C0(n572), .C1(d_ff3_sh_y_out[11]), .Y(n480) );
  AOI222X4TS U826 ( .A0(n546), .A1(d_ff3_LUT_out[14]), .B0(n569), .B1(
        d_ff3_sh_x_out[14]), .C0(n514), .C1(d_ff3_sh_y_out[14]), .Y(n479) );
  AOI222X4TS U827 ( .A0(n546), .A1(d_ff3_LUT_out[16]), .B0(n569), .B1(
        d_ff3_sh_x_out[16]), .C0(n514), .C1(d_ff3_sh_y_out[16]), .Y(n478) );
  BUFX4TS U828 ( .A(n678), .Y(n683) );
  BUFX4TS U829 ( .A(n468), .Y(n678) );
  NOR2X4TS U830 ( .A(cont_iter_out[2]), .B(cont_iter_out[1]), .Y(n628) );
  AOI22X4TS U831 ( .A0(n704), .A1(n596), .B0(n628), .B1(n631), .Y(n639) );
  AOI211X2TS U832 ( .A0(n596), .A1(n627), .B0(n558), .C0(n456), .Y(n649) );
  NOR2X4TS U833 ( .A(n703), .B(n708), .Y(n596) );
  AOI222X1TS U834 ( .A0(d_ff2_Y[57]), .A1(n683), .B0(d_ff2_X[57]), .B1(n658), 
        .C0(n424), .C1(d_ff2_Z[57]), .Y(n473) );
  BUFX4TS U835 ( .A(n434), .Y(n437) );
  NOR2X4TS U836 ( .A(cont_iter_out[2]), .B(n708), .Y(n645) );
  INVX6TS U837 ( .A(n610), .Y(n657) );
  CLKINVX6TS U838 ( .A(n610), .Y(n655) );
  CLKINVX6TS U839 ( .A(n610), .Y(n656) );
  CLKINVX6TS U840 ( .A(n610), .Y(n654) );
  NOR2X4TS U841 ( .A(cont_iter_out[3]), .B(n767), .Y(n595) );
  CLKINVX6TS U842 ( .A(n610), .Y(n604) );
  NAND2X2TS U843 ( .A(n627), .B(n628), .Y(data_out_LUT[50]) );
  NOR2X4TS U844 ( .A(n716), .B(cont_iter_out[3]), .Y(n627) );
  CLKINVX6TS U845 ( .A(n436), .Y(n741) );
  CLKINVX6TS U846 ( .A(n437), .Y(n428) );
  CLKINVX6TS U847 ( .A(n711), .Y(n618) );
  CLKINVX3TS U848 ( .A(n711), .Y(n616) );
  CLKINVX6TS U849 ( .A(n711), .Y(n619) );
  INVX2TS U850 ( .A(n644), .Y(n456) );
  AOI222X1TS U851 ( .A0(n686), .A1(d_ff2_Z[10]), .B0(n683), .B1(d_ff2_Y[10]), 
        .C0(n552), .C1(d_ff2_X[10]), .Y(n553) );
  AOI222X1TS U852 ( .A0(d_ff2_Y[58]), .A1(n678), .B0(d_ff2_X[58]), .B1(n658), 
        .C0(n546), .C1(d_ff2_Z[58]), .Y(n475) );
  NOR2X2TS U853 ( .A(d_ff2_X[58]), .B(n697), .Y(n696) );
  NOR2X2TS U854 ( .A(d_ff2_X[60]), .B(n695), .Y(n699) );
  NOR2X2TS U855 ( .A(d_ff2_Y[58]), .B(n691), .Y(n690) );
  NOR2X2TS U856 ( .A(d_ff2_Y[60]), .B(n689), .Y(n693) );
  AOI222X1TS U857 ( .A0(d_ff2_Y[61]), .A1(n683), .B0(d_ff2_X[61]), .B1(n658), 
        .C0(n546), .C1(d_ff2_Z[61]), .Y(n472) );
  AOI222X1TS U858 ( .A0(n685), .A1(d_ff2_Z[28]), .B0(n573), .B1(d_ff2_Y[28]), 
        .C0(n572), .C1(d_ff2_X[28]), .Y(n574) );
  AOI222X1TS U859 ( .A0(n686), .A1(d_ff2_Z[3]), .B0(n573), .B1(d_ff2_Y[3]), 
        .C0(n552), .C1(d_ff2_X[3]), .Y(n551) );
  AOI222X1TS U860 ( .A0(n686), .A1(d_ff2_Z[7]), .B0(n573), .B1(d_ff2_Y[7]), 
        .C0(n552), .C1(d_ff2_X[7]), .Y(n548) );
  AOI222X1TS U861 ( .A0(n546), .A1(d_ff2_Z[15]), .B0(n573), .B1(d_ff2_Y[15]), 
        .C0(n552), .C1(d_ff2_X[15]), .Y(n545) );
  AOI222X1TS U862 ( .A0(n686), .A1(d_ff2_Z[8]), .B0(n573), .B1(d_ff2_Y[8]), 
        .C0(n552), .C1(d_ff2_X[8]), .Y(n544) );
  AOI222X1TS U863 ( .A0(n686), .A1(d_ff2_Z[13]), .B0(n573), .B1(d_ff2_Y[13]), 
        .C0(n552), .C1(d_ff2_X[13]), .Y(n543) );
  AOI222X1TS U864 ( .A0(n546), .A1(d_ff2_Z[14]), .B0(n573), .B1(d_ff2_Y[14]), 
        .C0(n552), .C1(d_ff2_X[14]), .Y(n542) );
  AOI222X1TS U865 ( .A0(n686), .A1(d_ff2_Z[5]), .B0(n573), .B1(d_ff2_Y[5]), 
        .C0(n552), .C1(d_ff2_X[5]), .Y(n541) );
  AOI222X4TS U866 ( .A0(n686), .A1(d_ff2_Z[2]), .B0(n573), .B1(d_ff2_Y[2]), 
        .C0(n552), .C1(d_ff2_X[2]), .Y(n540) );
  AOI222X4TS U867 ( .A0(n686), .A1(d_ff2_Z[11]), .B0(n573), .B1(d_ff2_Y[11]), 
        .C0(n552), .C1(d_ff2_X[11]), .Y(n539) );
  AOI222X4TS U868 ( .A0(n686), .A1(d_ff2_Z[12]), .B0(n573), .B1(d_ff2_Y[12]), 
        .C0(n552), .C1(d_ff2_X[12]), .Y(n538) );
  AOI222X4TS U869 ( .A0(n546), .A1(d_ff2_Z[16]), .B0(n573), .B1(d_ff2_Y[16]), 
        .C0(n514), .C1(d_ff2_X[16]), .Y(n537) );
  AOI222X4TS U870 ( .A0(n546), .A1(d_ff2_Z[26]), .B0(n573), .B1(d_ff2_Y[26]), 
        .C0(n572), .C1(d_ff2_X[26]), .Y(n465) );
  AOI222X4TS U871 ( .A0(n546), .A1(d_ff2_Z[20]), .B0(n573), .B1(d_ff2_Y[20]), 
        .C0(n572), .C1(d_ff2_X[20]), .Y(n463) );
  AOI222X4TS U872 ( .A0(n546), .A1(d_ff2_Z[24]), .B0(n573), .B1(d_ff2_Y[24]), 
        .C0(n572), .C1(d_ff2_X[24]), .Y(n460) );
  AOI222X4TS U873 ( .A0(n546), .A1(d_ff2_Z[22]), .B0(n573), .B1(d_ff2_Y[22]), 
        .C0(n572), .C1(d_ff2_X[22]), .Y(n459) );
  AOI222X4TS U874 ( .A0(n546), .A1(d_ff2_Z[18]), .B0(n573), .B1(d_ff2_Y[18]), 
        .C0(n572), .C1(d_ff2_X[18]), .Y(n458) );
  BUFX6TS U875 ( .A(n468), .Y(n576) );
  NOR4X2TS U876 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[2]), 
        .C(n701), .D(n423), .Y(ack_add_subt) );
  NOR3X2TS U877 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n707), .Y(n602) );
  NAND3X2TS U878 ( .A(cordic_FSM_state_reg[2]), .B(n707), .C(n423), .Y(n770)
         );
  INVX4TS U879 ( .A(n434), .Y(n766) );
  AOI211XLTS U880 ( .A0(n578), .A1(n705), .B0(n427), .C0(n452), .Y(n289) );
  OAI21XLTS U881 ( .A0(n698), .A1(n715), .B0(n697), .Y(sh_exp_x[5]) );
  INVX2TS U882 ( .A(cordic_FSM_state_reg[2]), .Y(n603) );
  NAND4X1TS U883 ( .A(n701), .B(n603), .C(n707), .D(n423), .Y(n433) );
  INVX2TS U884 ( .A(n627), .Y(n435) );
  INVX2TS U885 ( .A(n628), .Y(n633) );
  NAND2X1TS U886 ( .A(cont_iter_out[3]), .B(n633), .Y(n635) );
  NOR2X2TS U887 ( .A(cont_iter_out[1]), .B(n703), .Y(n650) );
  NAND2X1TS U888 ( .A(n595), .B(n650), .Y(n644) );
  OAI211XLTS U889 ( .A0(n435), .A1(n703), .B0(n635), .C0(n644), .Y(
        data_out_LUT[14]) );
  NAND3X2TS U890 ( .A(n596), .B(n716), .C(cont_iter_out[3]), .Y(
        data_out_LUT[56]) );
  INVX2TS U891 ( .A(n595), .Y(n640) );
  INVX2TS U892 ( .A(data_out_LUT[56]), .Y(n558) );
  OAI21XLTS U893 ( .A0(n708), .A1(n640), .B0(n649), .Y(data_out_LUT[23]) );
  NAND2X1TS U894 ( .A(n628), .B(n595), .Y(data_out_LUT[40]) );
  NAND2X1TS U895 ( .A(n645), .B(n595), .Y(data_out_LUT[38]) );
  INVX4TS U896 ( .A(n436), .Y(n755) );
  INVX4TS U897 ( .A(n436), .Y(n754) );
  INVX4TS U898 ( .A(n437), .Y(n753) );
  INVX4TS U899 ( .A(n434), .Y(n762) );
  INVX4TS U900 ( .A(n437), .Y(n738) );
  INVX4TS U901 ( .A(n437), .Y(n737) );
  INVX4TS U902 ( .A(n437), .Y(n739) );
  INVX4TS U903 ( .A(n437), .Y(n743) );
  INVX4TS U904 ( .A(n437), .Y(n742) );
  INVX4TS U905 ( .A(n434), .Y(n765) );
  INVX4TS U906 ( .A(n436), .Y(n717) );
  INVX4TS U907 ( .A(n434), .Y(n731) );
  INVX4TS U908 ( .A(n434), .Y(n718) );
  INVX4TS U909 ( .A(n434), .Y(n764) );
  INVX4TS U910 ( .A(n436), .Y(n730) );
  INVX4TS U911 ( .A(n434), .Y(n733) );
  INVX4TS U912 ( .A(n436), .Y(n732) );
  INVX4TS U913 ( .A(n436), .Y(n747) );
  INVX4TS U914 ( .A(n436), .Y(n752) );
  INVX4TS U915 ( .A(n436), .Y(n751) );
  INVX4TS U916 ( .A(n436), .Y(n750) );
  INVX4TS U917 ( .A(n436), .Y(n719) );
  INVX4TS U918 ( .A(n434), .Y(n763) );
  INVX4TS U919 ( .A(n436), .Y(n749) );
  INVX4TS U920 ( .A(n436), .Y(n748) );
  INVX4TS U921 ( .A(n434), .Y(n728) );
  INVX4TS U922 ( .A(n434), .Y(n756) );
  INVX4TS U923 ( .A(n436), .Y(n727) );
  INVX4TS U924 ( .A(n436), .Y(n726) );
  INVX4TS U925 ( .A(n436), .Y(n725) );
  INVX4TS U926 ( .A(n436), .Y(n729) );
  INVX4TS U927 ( .A(n434), .Y(n736) );
  INVX4TS U928 ( .A(n437), .Y(n724) );
  INVX4TS U929 ( .A(n437), .Y(n740) );
  INVX4TS U930 ( .A(n437), .Y(n735) );
  INVX4TS U931 ( .A(n437), .Y(n746) );
  INVX4TS U932 ( .A(n436), .Y(n745) );
  INVX4TS U933 ( .A(n437), .Y(n744) );
  INVX4TS U934 ( .A(n434), .Y(n760) );
  INVX4TS U935 ( .A(n434), .Y(n720) );
  INVX4TS U936 ( .A(n434), .Y(n734) );
  INVX4TS U937 ( .A(n434), .Y(n721) );
  INVX4TS U938 ( .A(n434), .Y(n759) );
  INVX4TS U939 ( .A(n434), .Y(n758) );
  INVX4TS U940 ( .A(n434), .Y(n723) );
  INVX4TS U941 ( .A(n437), .Y(n722) );
  INVX4TS U942 ( .A(n610), .Y(n611) );
  AO22XLTS U943 ( .A0(n611), .A1(d_ff_Zn[44]), .B0(n712), .B1(d_ff1_Z[44]), 
        .Y(first_mux_Z[44]) );
  NAND2X1TS U944 ( .A(n627), .B(n703), .Y(data_out_LUT[47]) );
  NAND2X1TS U945 ( .A(n645), .B(n704), .Y(data_out_LUT[45]) );
  NOR2X2TS U946 ( .A(n704), .B(n716), .Y(n631) );
  NAND2X1TS U947 ( .A(n596), .B(n631), .Y(n438) );
  NAND3XLTS U948 ( .A(n716), .B(cont_iter_out[3]), .C(n650), .Y(n626) );
  NAND4XLTS U949 ( .A(n649), .B(n438), .C(n626), .D(data_out_LUT[45]), .Y(
        data_out_LUT[27]) );
  INVX2TS U950 ( .A(n596), .Y(n625) );
  NAND2X1TS U951 ( .A(n625), .B(n704), .Y(data_out_LUT[20]) );
  INVX2TS U952 ( .A(data_out_LUT[20]), .Y(n647) );
  NAND2X1TS U953 ( .A(n595), .B(n708), .Y(n624) );
  NAND2X1TS U954 ( .A(n647), .B(n624), .Y(data_out_LUT[16]) );
  NAND2X1TS U955 ( .A(n704), .B(n633), .Y(data_out_LUT[22]) );
  NAND2X1TS U956 ( .A(n628), .B(n704), .Y(data_out_LUT[49]) );
  NAND2X2TS U957 ( .A(n627), .B(n650), .Y(n648) );
  NAND2X1TS U958 ( .A(data_out_LUT[38]), .B(n648), .Y(n455) );
  INVX2TS U959 ( .A(n455), .Y(n637) );
  CLKAND2X2TS U960 ( .A(data_out_LUT[49]), .B(n637), .Y(n653) );
  NAND2X1TS U961 ( .A(n653), .B(n635), .Y(data_out_LUT[33]) );
  NOR2BX1TS U962 ( .AN(sel_mux_2_reg[1]), .B(sel_mux_2_reg[0]), .Y(n461) );
  BUFX3TS U963 ( .A(n424), .Y(n675) );
  BUFX4TS U964 ( .A(n675), .Y(n686) );
  BUFX4TS U965 ( .A(n514), .Y(n682) );
  AOI22X1TS U966 ( .A0(n683), .A1(d_ff3_sh_x_out[30]), .B0(n682), .B1(
        d_ff3_sh_y_out[30]), .Y(n441) );
  OAI2BB1X1TS U967 ( .A0N(n686), .A1N(d_ff3_LUT_out[30]), .B0(n441), .Y(
        add_subt_dataB[30]) );
  AOI22X1TS U968 ( .A0(n683), .A1(d_ff3_sh_x_out[34]), .B0(n682), .B1(
        d_ff3_sh_y_out[34]), .Y(n442) );
  OAI2BB1X1TS U969 ( .A0N(n686), .A1N(d_ff3_LUT_out[43]), .B0(n442), .Y(
        add_subt_dataB[34]) );
  AOI22X1TS U970 ( .A0(n683), .A1(d_ff3_sh_x_out[43]), .B0(n682), .B1(
        d_ff3_sh_y_out[43]), .Y(n443) );
  OAI2BB1X1TS U971 ( .A0N(n686), .A1N(d_ff3_LUT_out[43]), .B0(n443), .Y(
        add_subt_dataB[43]) );
  NAND2X1TS U972 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n589) );
  NOR3X1TS U973 ( .A(cordic_FSM_state_reg[3]), .B(n603), .C(n589), .Y(
        beg_add_subt) );
  NAND4BX1TS U974 ( .AN(ack_cordic), .B(cordic_FSM_state_reg[2]), .C(
        cordic_FSM_state_reg[3]), .D(n707), .Y(n580) );
  INVX2TS U975 ( .A(beg_add_subt), .Y(n444) );
  OAI211XLTS U976 ( .A0(n445), .A1(n701), .B0(n580), .C0(n444), .Y(n291) );
  INVX4TS U977 ( .A(n434), .Y(n761) );
  INVX2TS U978 ( .A(rst), .Y(n276) );
  INVX4TS U979 ( .A(n434), .Y(n757) );
  NAND2X1TS U980 ( .A(n430), .B(n716), .Y(intadd_457_CI) );
  OAI21XLTS U981 ( .A0(n716), .A1(n430), .B0(intadd_457_CI), .Y(sh_exp_x[0])
         );
  NAND2X1TS U982 ( .A(n431), .B(n716), .Y(intadd_458_CI) );
  OAI21XLTS U983 ( .A0(n716), .A1(n431), .B0(intadd_458_CI), .Y(sh_exp_y[0])
         );
  NOR2XLTS U984 ( .A(cordic_FSM_state_reg[3]), .B(n770), .Y(enab_d_ff2_RB2) );
  NAND4XLTS U985 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[1]), 
        .C(n603), .D(n423), .Y(n448) );
  NOR2X1TS U986 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), 
        .Y(n621) );
  AOI21X1TS U987 ( .A0(d_ff1_operation_out), .A1(
        d_ff1_shift_region_flag_out[1]), .B0(n621), .Y(n446) );
  XNOR2X1TS U988 ( .A(d_ff1_shift_region_flag_out[0]), .B(n446), .Y(n554) );
  NAND3XLTS U989 ( .A(n702), .B(n766), .C(n448), .Y(n447) );
  OAI21XLTS U990 ( .A0(n448), .A1(n554), .B0(n447), .Y(n285) );
  INVX2TS U991 ( .A(n584), .Y(n646) );
  OAI21X1TS U992 ( .A0(cont_iter_out[1]), .A1(n716), .B0(n646), .Y(
        data_out_LUT[53]) );
  INVX2TS U993 ( .A(n639), .Y(data_out_LUT[17]) );
  NOR2X1TS U994 ( .A(d_ff2_Y[56]), .B(intadd_458_n1), .Y(n692) );
  OR3X1TS U995 ( .A(d_ff2_Y[57]), .B(d_ff2_Y[56]), .C(intadd_458_n1), .Y(n691)
         );
  OAI21XLTS U996 ( .A0(n692), .A1(n714), .B0(n691), .Y(sh_exp_y[5]) );
  NOR2X1TS U997 ( .A(d_ff2_X[56]), .B(intadd_457_n1), .Y(n698) );
  OR3X1TS U998 ( .A(d_ff2_X[57]), .B(d_ff2_X[56]), .C(intadd_457_n1), .Y(n697)
         );
  NOR3X1TS U999 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[2]), 
        .C(n589), .Y(n450) );
  BUFX4TS U1000 ( .A(n610), .Y(n612) );
  NAND2X1TS U1001 ( .A(n450), .B(data_out_LUT[50]), .Y(n449) );
  OAI31X1TS U1002 ( .A0(n434), .A1(n450), .A2(n612), .B0(n449), .Y(n284) );
  INVX2TS U1003 ( .A(n425), .Y(n585) );
  NAND2X1TS U1004 ( .A(sel_mux_2_reg[1]), .B(n766), .Y(n451) );
  NAND2X1TS U1005 ( .A(ack_add_subt), .B(data_out_LUT[56]), .Y(n578) );
  NAND2X1TS U1006 ( .A(cont_var_out[1]), .B(n705), .Y(n588) );
  AOI21X1TS U1007 ( .A0(n588), .A1(n705), .B0(n578), .Y(n452) );
  CLKAND2X2TS U1008 ( .A(n602), .B(n701), .Y(load_cont_iter) );
  NAND2X1TS U1009 ( .A(n710), .B(n696), .Y(n695) );
  OAI21XLTS U1010 ( .A0(n696), .A1(n710), .B0(n695), .Y(sh_exp_x[7]) );
  NAND2X1TS U1011 ( .A(n432), .B(n690), .Y(n689) );
  OAI21XLTS U1012 ( .A0(n690), .A1(n432), .B0(n689), .Y(sh_exp_y[7]) );
  NOR2X1TS U1013 ( .A(n705), .B(n578), .Y(n454) );
  NOR2XLTS U1014 ( .A(cont_var_out[1]), .B(n454), .Y(n453) );
  AOI211XLTS U1015 ( .A0(cont_var_out[1]), .A1(n454), .B0(n427), .C0(n453), 
        .Y(n290) );
  NOR2X2TS U1016 ( .A(n456), .B(n455), .Y(n638) );
  OAI21XLTS U1017 ( .A0(n595), .A1(n625), .B0(n638), .Y(data_out_LUT[25]) );
  BUFX4TS U1018 ( .A(n424), .Y(n546) );
  BUFX4TS U1019 ( .A(n482), .Y(n573) );
  INVX2TS U1020 ( .A(n457), .Y(add_subt_dataA[19]) );
  BUFX4TS U1021 ( .A(n514), .Y(n572) );
  INVX2TS U1022 ( .A(n458), .Y(add_subt_dataA[18]) );
  INVX2TS U1023 ( .A(n459), .Y(add_subt_dataA[22]) );
  INVX2TS U1024 ( .A(n460), .Y(add_subt_dataA[24]) );
  AOI222X1TS U1025 ( .A0(n424), .A1(d_ff3_LUT_out[35]), .B0(n576), .B1(
        d_ff3_sh_x_out[35]), .C0(n514), .C1(d_ff3_sh_y_out[35]), .Y(n462) );
  INVX2TS U1026 ( .A(n462), .Y(add_subt_dataB[35]) );
  INVX2TS U1027 ( .A(n463), .Y(add_subt_dataA[20]) );
  AOI222X1TS U1028 ( .A0(n675), .A1(d_ff3_LUT_out[27]), .B0(n576), .B1(
        d_ff3_sh_x_out[27]), .C0(n514), .C1(d_ff3_sh_y_out[27]), .Y(n464) );
  INVX2TS U1029 ( .A(n464), .Y(add_subt_dataB[27]) );
  INVX2TS U1030 ( .A(n465), .Y(add_subt_dataA[26]) );
  AOI222X1TS U1031 ( .A0(n675), .A1(d_ff3_LUT_out[17]), .B0(n576), .B1(
        d_ff3_sh_x_out[17]), .C0(n514), .C1(d_ff3_sh_y_out[17]), .Y(n466) );
  INVX2TS U1032 ( .A(n466), .Y(add_subt_dataB[17]) );
  AOI222X1TS U1033 ( .A0(n424), .A1(d_ff3_LUT_out[15]), .B0(n576), .B1(
        d_ff3_sh_x_out[15]), .C0(n514), .C1(d_ff3_sh_y_out[15]), .Y(n467) );
  INVX2TS U1034 ( .A(n467), .Y(add_subt_dataB[15]) );
  AOI222X1TS U1035 ( .A0(n424), .A1(d_ff3_LUT_out[55]), .B0(n678), .B1(
        d_ff3_sh_x_out[55]), .C0(n658), .C1(d_ff3_sh_y_out[55]), .Y(n469) );
  INVX2TS U1036 ( .A(n469), .Y(add_subt_dataB[55]) );
  INVX2TS U1037 ( .A(n470), .Y(add_subt_dataA[62]) );
  INVX2TS U1038 ( .A(n471), .Y(add_subt_dataA[60]) );
  INVX2TS U1039 ( .A(n472), .Y(add_subt_dataA[61]) );
  INVX2TS U1040 ( .A(n473), .Y(add_subt_dataA[57]) );
  INVX2TS U1041 ( .A(n474), .Y(add_subt_dataA[56]) );
  INVX2TS U1042 ( .A(n475), .Y(add_subt_dataA[58]) );
  AOI222X1TS U1043 ( .A0(n424), .A1(d_ff3_LUT_out[53]), .B0(n678), .B1(
        d_ff3_sh_x_out[53]), .C0(n658), .C1(d_ff3_sh_y_out[53]), .Y(n476) );
  INVX2TS U1044 ( .A(n476), .Y(add_subt_dataB[53]) );
  AOI222X1TS U1045 ( .A0(n424), .A1(d_ff3_LUT_out[56]), .B0(n678), .B1(
        d_ff3_sh_x_out[56]), .C0(n658), .C1(d_ff3_sh_y_out[56]), .Y(n477) );
  INVX2TS U1046 ( .A(n477), .Y(add_subt_dataB[56]) );
  BUFX4TS U1047 ( .A(n468), .Y(n569) );
  INVX2TS U1048 ( .A(n478), .Y(add_subt_dataB[16]) );
  INVX2TS U1049 ( .A(n479), .Y(add_subt_dataB[14]) );
  INVX2TS U1050 ( .A(n480), .Y(add_subt_dataB[11]) );
  INVX2TS U1051 ( .A(n481), .Y(add_subt_dataB[10]) );
  INVX2TS U1052 ( .A(n483), .Y(add_subt_dataA[23]) );
  INVX2TS U1053 ( .A(n484), .Y(add_subt_dataB[8]) );
  INVX2TS U1054 ( .A(n485), .Y(add_subt_dataA[25]) );
  INVX2TS U1055 ( .A(n486), .Y(add_subt_dataB[13]) );
  INVX2TS U1056 ( .A(n487), .Y(add_subt_dataA[21]) );
  AOI222X1TS U1057 ( .A0(n675), .A1(d_ff3_LUT_out[39]), .B0(n576), .B1(
        d_ff3_sh_x_out[39]), .C0(n658), .C1(d_ff3_sh_y_out[39]), .Y(n488) );
  INVX2TS U1058 ( .A(n488), .Y(add_subt_dataB[39]) );
  AOI222X1TS U1059 ( .A0(n424), .A1(d_ff3_LUT_out[45]), .B0(n678), .B1(
        d_ff3_sh_x_out[45]), .C0(n658), .C1(d_ff3_sh_y_out[45]), .Y(n489) );
  INVX2TS U1060 ( .A(n489), .Y(add_subt_dataB[45]) );
  AOI222X1TS U1061 ( .A0(n675), .A1(d_ff3_LUT_out[41]), .B0(n482), .B1(
        d_ff3_sh_x_out[41]), .C0(n658), .C1(d_ff3_sh_y_out[41]), .Y(n490) );
  INVX2TS U1062 ( .A(n490), .Y(add_subt_dataB[41]) );
  AOI222X1TS U1063 ( .A0(n675), .A1(d_ff3_LUT_out[25]), .B0(n468), .B1(
        d_ff3_sh_x_out[25]), .C0(n658), .C1(d_ff3_sh_y_out[25]), .Y(n491) );
  INVX2TS U1064 ( .A(n491), .Y(add_subt_dataB[25]) );
  AOI222X1TS U1065 ( .A0(n424), .A1(d_ff3_LUT_out[54]), .B0(n482), .B1(
        d_ff3_sh_x_out[54]), .C0(n658), .C1(d_ff3_sh_y_out[54]), .Y(n492) );
  INVX2TS U1066 ( .A(n492), .Y(add_subt_dataB[54]) );
  AOI222X1TS U1067 ( .A0(n675), .A1(d_ff3_LUT_out[37]), .B0(n468), .B1(
        d_ff3_sh_x_out[37]), .C0(n658), .C1(d_ff3_sh_y_out[37]), .Y(n493) );
  INVX2TS U1068 ( .A(n493), .Y(add_subt_dataB[37]) );
  AOI222X1TS U1069 ( .A0(n424), .A1(d_ff3_LUT_out[33]), .B0(n482), .B1(
        d_ff3_sh_x_out[33]), .C0(n658), .C1(d_ff3_sh_y_out[33]), .Y(n494) );
  INVX2TS U1070 ( .A(n494), .Y(add_subt_dataB[33]) );
  AOI222X1TS U1071 ( .A0(n424), .A1(d_ff3_LUT_out[50]), .B0(n468), .B1(
        d_ff3_sh_x_out[50]), .C0(n658), .C1(d_ff3_sh_y_out[50]), .Y(n495) );
  INVX2TS U1072 ( .A(n495), .Y(add_subt_dataB[50]) );
  AOI222X1TS U1073 ( .A0(n675), .A1(d_ff3_LUT_out[52]), .B0(n482), .B1(
        d_ff3_sh_x_out[52]), .C0(n658), .C1(d_ff3_sh_y_out[52]), .Y(n496) );
  INVX2TS U1074 ( .A(n496), .Y(add_subt_dataB[52]) );
  BUFX4TS U1075 ( .A(n675), .Y(n526) );
  AOI222X1TS U1076 ( .A0(n526), .A1(d_ff3_LUT_out[31]), .B0(n468), .B1(
        d_ff3_sh_x_out[31]), .C0(n658), .C1(d_ff3_sh_y_out[31]), .Y(n497) );
  INVX2TS U1077 ( .A(n497), .Y(add_subt_dataB[31]) );
  INVX2TS U1078 ( .A(n498), .Y(add_subt_dataB[26]) );
  BUFX4TS U1079 ( .A(n675), .Y(n549) );
  INVX2TS U1080 ( .A(n499), .Y(add_subt_dataB[24]) );
  INVX2TS U1081 ( .A(n500), .Y(add_subt_dataB[29]) );
  BUFX4TS U1082 ( .A(n514), .Y(n677) );
  AOI222X1TS U1083 ( .A0(n526), .A1(d_ff2_Z[52]), .B0(n576), .B1(d_ff2_Y[52]), 
        .C0(n677), .C1(d_ff2_X[52]), .Y(n501) );
  INVX2TS U1084 ( .A(n501), .Y(add_subt_dataA[52]) );
  AOI222X1TS U1085 ( .A0(n526), .A1(d_ff2_Z[51]), .B0(n576), .B1(d_ff2_Y[51]), 
        .C0(n677), .C1(d_ff2_X[51]), .Y(n502) );
  INVX2TS U1086 ( .A(n502), .Y(add_subt_dataA[51]) );
  INVX2TS U1087 ( .A(n503), .Y(add_subt_dataA[55]) );
  INVX2TS U1088 ( .A(n504), .Y(add_subt_dataA[54]) );
  INVX2TS U1089 ( .A(n505), .Y(add_subt_dataA[53]) );
  AOI222X1TS U1090 ( .A0(n526), .A1(d_ff2_Z[48]), .B0(n576), .B1(d_ff2_Y[48]), 
        .C0(n677), .C1(d_ff2_X[48]), .Y(n506) );
  INVX2TS U1091 ( .A(n506), .Y(add_subt_dataA[48]) );
  AOI222X1TS U1092 ( .A0(n526), .A1(d_ff2_Z[47]), .B0(n576), .B1(d_ff2_Y[47]), 
        .C0(n677), .C1(d_ff2_X[47]), .Y(n507) );
  INVX2TS U1093 ( .A(n507), .Y(add_subt_dataA[47]) );
  AOI222X1TS U1094 ( .A0(n526), .A1(d_ff2_Z[46]), .B0(n576), .B1(d_ff2_Y[46]), 
        .C0(n677), .C1(d_ff2_X[46]), .Y(n508) );
  INVX2TS U1095 ( .A(n508), .Y(add_subt_dataA[46]) );
  AOI222X1TS U1096 ( .A0(n526), .A1(d_ff2_Z[45]), .B0(n576), .B1(d_ff2_Y[45]), 
        .C0(n677), .C1(d_ff2_X[45]), .Y(n509) );
  INVX2TS U1097 ( .A(n509), .Y(add_subt_dataA[45]) );
  INVX2TS U1098 ( .A(n510), .Y(add_subt_dataA[44]) );
  AOI222X1TS U1099 ( .A0(n549), .A1(d_ff2_Z[0]), .B0(n576), .B1(d_ff2_Y[0]), 
        .C0(n677), .C1(d_ff2_X[0]), .Y(n511) );
  INVX2TS U1100 ( .A(n511), .Y(add_subt_dataA[0]) );
  AOI222X1TS U1101 ( .A0(n526), .A1(d_ff2_Z[50]), .B0(n576), .B1(d_ff2_Y[50]), 
        .C0(n677), .C1(d_ff2_X[50]), .Y(n512) );
  INVX2TS U1102 ( .A(n512), .Y(add_subt_dataA[50]) );
  AOI222X1TS U1103 ( .A0(n526), .A1(d_ff2_Z[49]), .B0(n576), .B1(d_ff2_Y[49]), 
        .C0(n677), .C1(d_ff2_X[49]), .Y(n513) );
  INVX2TS U1104 ( .A(n513), .Y(add_subt_dataA[49]) );
  BUFX4TS U1105 ( .A(n514), .Y(n687) );
  INVX2TS U1106 ( .A(n515), .Y(add_subt_dataA[42]) );
  INVX2TS U1107 ( .A(n516), .Y(add_subt_dataA[41]) );
  INVX2TS U1108 ( .A(n517), .Y(add_subt_dataA[43]) );
  INVX2TS U1109 ( .A(n518), .Y(add_subt_dataA[40]) );
  AOI222X1TS U1110 ( .A0(n526), .A1(d_ff3_LUT_out[23]), .B0(n576), .B1(
        d_ff3_sh_x_out[23]), .C0(n514), .C1(d_ff3_sh_y_out[23]), .Y(n519) );
  INVX2TS U1111 ( .A(n519), .Y(add_subt_dataB[23]) );
  INVX2TS U1112 ( .A(n520), .Y(add_subt_dataB[22]) );
  INVX2TS U1113 ( .A(n521), .Y(add_subt_dataA[63]) );
  AOI222X1TS U1114 ( .A0(n549), .A1(d_ff3_LUT_out[2]), .B0(n576), .B1(
        d_ff3_sh_x_out[2]), .C0(n572), .C1(d_ff3_sh_y_out[2]), .Y(n522) );
  INVX2TS U1115 ( .A(n522), .Y(add_subt_dataB[2]) );
  INVX2TS U1116 ( .A(n523), .Y(add_subt_dataB[3]) );
  INVX2TS U1117 ( .A(n524), .Y(add_subt_dataB[1]) );
  INVX2TS U1118 ( .A(n525), .Y(add_subt_dataB[0]) );
  INVX2TS U1119 ( .A(n527), .Y(add_subt_dataB[6]) );
  INVX2TS U1120 ( .A(n528), .Y(add_subt_dataB[7]) );
  INVX2TS U1121 ( .A(n529), .Y(add_subt_dataB[9]) );
  INVX2TS U1122 ( .A(n530), .Y(add_subt_dataB[12]) );
  INVX2TS U1123 ( .A(n531), .Y(add_subt_dataB[18]) );
  INVX2TS U1124 ( .A(n532), .Y(add_subt_dataB[5]) );
  INVX2TS U1125 ( .A(n533), .Y(add_subt_dataB[20]) );
  AOI222X1TS U1126 ( .A0(n686), .A1(d_ff2_Z[9]), .B0(n683), .B1(d_ff2_Y[9]), 
        .C0(n682), .C1(d_ff2_X[9]), .Y(n534) );
  INVX2TS U1127 ( .A(n534), .Y(add_subt_dataA[9]) );
  AOI222X1TS U1128 ( .A0(n686), .A1(d_ff2_Z[4]), .B0(n683), .B1(d_ff2_Y[4]), 
        .C0(n682), .C1(d_ff2_X[4]), .Y(n535) );
  INVX2TS U1129 ( .A(n535), .Y(add_subt_dataA[4]) );
  AOI222X1TS U1130 ( .A0(n686), .A1(d_ff2_Z[1]), .B0(n683), .B1(d_ff2_Y[1]), 
        .C0(n682), .C1(d_ff2_X[1]), .Y(n536) );
  INVX2TS U1131 ( .A(n536), .Y(add_subt_dataA[1]) );
  BUFX3TS U1132 ( .A(n658), .Y(n552) );
  INVX2TS U1133 ( .A(n537), .Y(add_subt_dataA[16]) );
  INVX2TS U1134 ( .A(n538), .Y(add_subt_dataA[12]) );
  INVX2TS U1135 ( .A(n539), .Y(add_subt_dataA[11]) );
  INVX2TS U1136 ( .A(n540), .Y(add_subt_dataA[2]) );
  INVX2TS U1137 ( .A(n541), .Y(add_subt_dataA[5]) );
  INVX2TS U1138 ( .A(n542), .Y(add_subt_dataA[14]) );
  INVX2TS U1139 ( .A(n543), .Y(add_subt_dataA[13]) );
  INVX2TS U1140 ( .A(n544), .Y(add_subt_dataA[8]) );
  INVX2TS U1141 ( .A(n545), .Y(add_subt_dataA[15]) );
  INVX2TS U1142 ( .A(n547), .Y(add_subt_dataA[17]) );
  INVX2TS U1143 ( .A(n548), .Y(add_subt_dataA[7]) );
  INVX2TS U1144 ( .A(n550), .Y(add_subt_dataA[31]) );
  INVX2TS U1145 ( .A(n551), .Y(add_subt_dataA[3]) );
  INVX2TS U1146 ( .A(n553), .Y(add_subt_dataA[10]) );
  NOR2X1TS U1147 ( .A(data_out_LUT[56]), .B(n554), .Y(n556) );
  AOI21X1TS U1148 ( .A0(cont_var_out[0]), .A1(data_out_LUT[56]), .B0(n556), 
        .Y(n586) );
  NAND2X1TS U1149 ( .A(ready_add_subt), .B(n707), .Y(n579) );
  NAND4BX1TS U1150 ( .AN(n579), .B(cordic_FSM_state_reg[3]), .C(n423), .D(n603), .Y(n557) );
  AOI21X1TS U1151 ( .A0(n709), .A1(n705), .B0(n558), .Y(n555) );
  NOR3XLTS U1152 ( .A(n556), .B(n555), .C(n557), .Y(enab_d_ff4_Xn) );
  NOR3XLTS U1153 ( .A(n558), .B(n588), .C(n557), .Y(enab_d_ff4_Zn) );
  BUFX4TS U1154 ( .A(n686), .Y(n685) );
  INVX2TS U1155 ( .A(n559), .Y(add_subt_dataA[37]) );
  INVX2TS U1156 ( .A(n560), .Y(add_subt_dataA[38]) );
  INVX2TS U1157 ( .A(n561), .Y(add_subt_dataA[39]) );
  AOI222X1TS U1158 ( .A0(n685), .A1(d_ff2_Z[6]), .B0(n683), .B1(d_ff2_Y[6]), 
        .C0(n682), .C1(d_ff2_X[6]), .Y(n562) );
  INVX2TS U1159 ( .A(n562), .Y(add_subt_dataA[6]) );
  INVX2TS U1160 ( .A(n563), .Y(add_subt_dataA[35]) );
  INVX2TS U1161 ( .A(n564), .Y(add_subt_dataA[32]) );
  INVX2TS U1162 ( .A(n565), .Y(add_subt_dataA[33]) );
  INVX2TS U1163 ( .A(n566), .Y(add_subt_dataA[34]) );
  INVX2TS U1164 ( .A(n567), .Y(add_subt_dataA[36]) );
  INVX2TS U1165 ( .A(n568), .Y(add_subt_dataA[30]) );
  INVX2TS U1166 ( .A(n570), .Y(add_subt_dataB[19]) );
  INVX2TS U1167 ( .A(n571), .Y(add_subt_dataA[27]) );
  INVX2TS U1168 ( .A(n574), .Y(add_subt_dataA[28]) );
  INVX2TS U1169 ( .A(n575), .Y(add_subt_dataA[29]) );
  AOI222X1TS U1170 ( .A0(n685), .A1(d_ff3_LUT_out[21]), .B0(n576), .B1(
        d_ff3_sh_x_out[21]), .C0(n514), .C1(d_ff3_sh_y_out[21]), .Y(n577) );
  INVX2TS U1171 ( .A(n577), .Y(add_subt_dataB[21]) );
  NAND2X1TS U1172 ( .A(n701), .B(n707), .Y(n600) );
  NOR2X1TS U1173 ( .A(n578), .B(n588), .Y(n583) );
  INVX2TS U1174 ( .A(n770), .Y(n590) );
  AOI32X1TS U1175 ( .A0(cordic_FSM_state_reg[3]), .A1(n580), .A2(n579), .B0(
        cordic_FSM_state_reg[0]), .B1(n580), .Y(n581) );
  NOR4X1TS U1176 ( .A(n583), .B(n590), .C(n602), .D(n581), .Y(n582) );
  OAI31X1TS U1177 ( .A0(cordic_FSM_state_reg[2]), .A1(beg_fsm_cordic), .A2(
        n600), .B0(n582), .Y(n293) );
  OR2X1TS U1178 ( .A(n583), .B(load_cont_iter), .Y(enab_cont_iter) );
  NOR2XLTS U1179 ( .A(n716), .B(n423), .Y(n773) );
  NOR3XLTS U1180 ( .A(cordic_FSM_state_reg[2]), .B(n701), .C(n589), .Y(
        enab_dff_5) );
  NOR2XLTS U1181 ( .A(n701), .B(n770), .Y(enab_d_ff5_data_out) );
  NOR2XLTS U1182 ( .A(n423), .B(data_out_LUT[53]), .Y(n772) );
  NOR2X1TS U1183 ( .A(cont_iter_out[2]), .B(n584), .Y(n587) );
  AO21XLTS U1184 ( .A0(n584), .A1(cont_iter_out[2]), .B0(n587), .Y(
        data_out_LUT[54]) );
  NOR2XLTS U1185 ( .A(n423), .B(data_out_LUT[54]), .Y(n771) );
  OAI32X1TS U1186 ( .A0(n425), .A1(n434), .A2(n706), .B0(n586), .B1(n585), .Y(
        n283) );
  OAI21XLTS U1187 ( .A0(cont_iter_out[2]), .A1(n704), .B0(n638), .Y(
        data_out_LUT[5]) );
  OAI211XLTS U1188 ( .A0(n587), .A1(n704), .B0(n638), .C0(data_out_LUT[50]), 
        .Y(data_out_LUT[10]) );
  AOI31XLTS U1189 ( .A0(cordic_FSM_state_reg[3]), .A1(data_out_LUT[56]), .A2(
        n588), .B0(cordic_FSM_state_reg[1]), .Y(n593) );
  OAI2BB2XLTS U1190 ( .B0(cordic_FSM_state_reg[1]), .B1(ack_cordic), .A0N(n701), .A1N(n589), .Y(n591) );
  AOI21X1TS U1191 ( .A0(cordic_FSM_state_reg[2]), .A1(n591), .B0(n590), .Y(
        n592) );
  OAI21XLTS U1193 ( .A0(n767), .A1(n625), .B0(cont_iter_out[3]), .Y(n597) );
  NAND2X1TS U1194 ( .A(n596), .B(n595), .Y(n641) );
  AOI21X1TS U1195 ( .A0(n597), .A1(n641), .B0(n423), .Y(n774) );
  INVX2TS U1196 ( .A(beg_fsm_cordic), .Y(n599) );
  NAND2X1TS U1197 ( .A(cordic_FSM_state_reg[1]), .B(n701), .Y(n598) );
  OAI32X1TS U1198 ( .A0(n423), .A1(n600), .A2(n599), .B0(
        cordic_FSM_state_reg[0]), .B1(n598), .Y(n601) );
  OR4X2TS U1199 ( .A(n427), .B(ack_add_subt), .C(n602), .D(n601), .Y(
        cordic_FSM_state_next_1_) );
  CLKAND2X2TS U1200 ( .A(d_ff_Yn[0]), .B(n654), .Y(first_mux_Y[0]) );
  CLKAND2X2TS U1201 ( .A(d_ff_Yn[1]), .B(n611), .Y(first_mux_Y[1]) );
  CLKAND2X2TS U1202 ( .A(d_ff_Yn[2]), .B(n654), .Y(first_mux_Y[2]) );
  CLKAND2X2TS U1203 ( .A(d_ff_Yn[3]), .B(n655), .Y(first_mux_Y[3]) );
  CLKAND2X2TS U1204 ( .A(d_ff_Yn[4]), .B(n656), .Y(first_mux_Y[4]) );
  CLKAND2X2TS U1205 ( .A(d_ff_Yn[5]), .B(n656), .Y(first_mux_Y[5]) );
  CLKAND2X2TS U1206 ( .A(d_ff_Yn[6]), .B(n655), .Y(first_mux_Y[6]) );
  CLKAND2X2TS U1207 ( .A(d_ff_Yn[7]), .B(n657), .Y(first_mux_Y[7]) );
  CLKAND2X2TS U1208 ( .A(d_ff_Yn[8]), .B(n655), .Y(first_mux_Y[8]) );
  CLKAND2X2TS U1209 ( .A(d_ff_Yn[9]), .B(n654), .Y(first_mux_Y[9]) );
  CLKAND2X2TS U1210 ( .A(d_ff_Yn[10]), .B(n654), .Y(first_mux_Y[10]) );
  CLKAND2X2TS U1211 ( .A(d_ff_Yn[11]), .B(n654), .Y(first_mux_Y[11]) );
  CLKAND2X2TS U1212 ( .A(d_ff_Yn[12]), .B(n604), .Y(first_mux_Y[12]) );
  CLKAND2X2TS U1213 ( .A(d_ff_Yn[13]), .B(n604), .Y(first_mux_Y[13]) );
  CLKAND2X2TS U1214 ( .A(d_ff_Yn[14]), .B(n604), .Y(first_mux_Y[14]) );
  CLKAND2X2TS U1215 ( .A(d_ff_Yn[15]), .B(n604), .Y(first_mux_Y[15]) );
  CLKAND2X2TS U1216 ( .A(d_ff_Yn[16]), .B(n604), .Y(first_mux_Y[16]) );
  CLKAND2X2TS U1217 ( .A(d_ff_Yn[17]), .B(n604), .Y(first_mux_Y[17]) );
  CLKAND2X2TS U1218 ( .A(d_ff_Yn[18]), .B(n604), .Y(first_mux_Y[18]) );
  CLKAND2X2TS U1219 ( .A(d_ff_Yn[19]), .B(n604), .Y(first_mux_Y[19]) );
  CLKAND2X2TS U1220 ( .A(d_ff_Yn[20]), .B(n604), .Y(first_mux_Y[20]) );
  CLKAND2X2TS U1221 ( .A(d_ff_Yn[21]), .B(n604), .Y(first_mux_Y[21]) );
  CLKAND2X2TS U1222 ( .A(d_ff_Yn[22]), .B(n604), .Y(first_mux_Y[22]) );
  CLKAND2X2TS U1223 ( .A(d_ff_Yn[23]), .B(n604), .Y(first_mux_Y[23]) );
  CLKAND2X2TS U1224 ( .A(d_ff_Yn[24]), .B(n604), .Y(first_mux_Y[24]) );
  INVX4TS U1225 ( .A(n610), .Y(n613) );
  CLKAND2X2TS U1226 ( .A(d_ff_Yn[25]), .B(n613), .Y(first_mux_Y[25]) );
  CLKAND2X2TS U1227 ( .A(d_ff_Yn[26]), .B(n611), .Y(first_mux_Y[26]) );
  CLKAND2X2TS U1228 ( .A(d_ff_Yn[27]), .B(n655), .Y(first_mux_Y[27]) );
  CLKAND2X2TS U1229 ( .A(d_ff_Yn[28]), .B(n613), .Y(first_mux_Y[28]) );
  CLKAND2X2TS U1230 ( .A(d_ff_Yn[29]), .B(n611), .Y(first_mux_Y[29]) );
  CLKAND2X2TS U1231 ( .A(d_ff_Yn[30]), .B(n656), .Y(first_mux_Y[30]) );
  CLKAND2X2TS U1232 ( .A(d_ff_Yn[31]), .B(n613), .Y(first_mux_Y[31]) );
  CLKAND2X2TS U1233 ( .A(d_ff_Yn[32]), .B(n656), .Y(first_mux_Y[32]) );
  CLKAND2X2TS U1234 ( .A(d_ff_Yn[33]), .B(n657), .Y(first_mux_Y[33]) );
  CLKAND2X2TS U1235 ( .A(d_ff_Yn[34]), .B(n654), .Y(first_mux_Y[34]) );
  CLKAND2X2TS U1236 ( .A(d_ff_Yn[35]), .B(n655), .Y(first_mux_Y[35]) );
  CLKAND2X2TS U1237 ( .A(d_ff_Yn[36]), .B(n656), .Y(first_mux_Y[36]) );
  CLKAND2X2TS U1238 ( .A(d_ff_Yn[37]), .B(n604), .Y(first_mux_Y[37]) );
  INVX4TS U1239 ( .A(n610), .Y(n605) );
  CLKAND2X2TS U1240 ( .A(d_ff_Yn[38]), .B(n605), .Y(first_mux_Y[38]) );
  INVX4TS U1241 ( .A(n610), .Y(n607) );
  CLKAND2X2TS U1242 ( .A(d_ff_Yn[39]), .B(n607), .Y(first_mux_Y[39]) );
  INVX4TS U1243 ( .A(n610), .Y(n609) );
  CLKAND2X2TS U1244 ( .A(d_ff_Yn[40]), .B(n609), .Y(first_mux_Y[40]) );
  CLKAND2X2TS U1245 ( .A(d_ff_Yn[41]), .B(n604), .Y(first_mux_Y[41]) );
  CLKAND2X2TS U1246 ( .A(d_ff_Yn[42]), .B(n605), .Y(first_mux_Y[42]) );
  CLKAND2X2TS U1247 ( .A(d_ff_Yn[43]), .B(n607), .Y(first_mux_Y[43]) );
  CLKAND2X2TS U1248 ( .A(d_ff_Yn[44]), .B(n609), .Y(first_mux_Y[44]) );
  CLKAND2X2TS U1249 ( .A(d_ff_Yn[45]), .B(n604), .Y(first_mux_Y[45]) );
  CLKAND2X2TS U1250 ( .A(d_ff_Yn[46]), .B(n604), .Y(first_mux_Y[46]) );
  CLKAND2X2TS U1251 ( .A(d_ff_Yn[47]), .B(n604), .Y(first_mux_Y[47]) );
  CLKAND2X2TS U1252 ( .A(d_ff_Yn[48]), .B(n604), .Y(first_mux_Y[48]) );
  CLKAND2X2TS U1253 ( .A(d_ff_Yn[49]), .B(n604), .Y(first_mux_Y[49]) );
  CLKAND2X2TS U1254 ( .A(d_ff_Yn[50]), .B(n655), .Y(first_mux_Y[50]) );
  CLKAND2X2TS U1255 ( .A(d_ff_Yn[51]), .B(n657), .Y(first_mux_Y[51]) );
  CLKAND2X2TS U1256 ( .A(d_ff_Yn[52]), .B(n654), .Y(first_mux_Y[52]) );
  CLKAND2X2TS U1257 ( .A(d_ff_Yn[53]), .B(n657), .Y(first_mux_Y[53]) );
  CLKAND2X2TS U1258 ( .A(d_ff_Yn[54]), .B(n654), .Y(first_mux_Y[54]) );
  CLKAND2X2TS U1259 ( .A(d_ff_Yn[55]), .B(n655), .Y(first_mux_Y[55]) );
  CLKAND2X2TS U1260 ( .A(d_ff_Yn[56]), .B(n656), .Y(first_mux_Y[56]) );
  CLKAND2X2TS U1261 ( .A(d_ff_Yn[57]), .B(n656), .Y(first_mux_Y[57]) );
  CLKAND2X2TS U1262 ( .A(d_ff_Yn[58]), .B(n657), .Y(first_mux_Y[58]) );
  CLKAND2X2TS U1263 ( .A(d_ff_Yn[59]), .B(n655), .Y(first_mux_Y[59]) );
  CLKAND2X2TS U1264 ( .A(d_ff_Yn[60]), .B(n657), .Y(first_mux_Y[60]) );
  CLKAND2X2TS U1265 ( .A(d_ff_Yn[61]), .B(n654), .Y(first_mux_Y[61]) );
  CLKAND2X2TS U1266 ( .A(d_ff_Yn[62]), .B(n656), .Y(first_mux_Y[62]) );
  CLKAND2X2TS U1267 ( .A(d_ff_Yn[63]), .B(n613), .Y(first_mux_Y[63]) );
  AO22XLTS U1268 ( .A0(n613), .A1(d_ff_Zn[0]), .B0(n610), .B1(d_ff1_Z[0]), .Y(
        first_mux_Z[0]) );
  AO22XLTS U1269 ( .A0(n613), .A1(d_ff_Zn[1]), .B0(n610), .B1(d_ff1_Z[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U1270 ( .A0(n605), .A1(d_ff_Zn[2]), .B0(n610), .B1(d_ff1_Z[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U1271 ( .A0(n605), .A1(d_ff_Zn[3]), .B0(n610), .B1(d_ff1_Z[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U1272 ( .A0(n605), .A1(d_ff_Zn[4]), .B0(n712), .B1(d_ff1_Z[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U1273 ( .A0(n605), .A1(d_ff_Zn[5]), .B0(n610), .B1(d_ff1_Z[5]), .Y(
        first_mux_Z[5]) );
  BUFX4TS U1274 ( .A(n712), .Y(n606) );
  AO22XLTS U1275 ( .A0(n605), .A1(d_ff_Zn[6]), .B0(n606), .B1(d_ff1_Z[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U1276 ( .A0(n605), .A1(d_ff_Zn[7]), .B0(n606), .B1(d_ff1_Z[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U1277 ( .A0(n605), .A1(d_ff_Zn[8]), .B0(n606), .B1(d_ff1_Z[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U1278 ( .A0(n605), .A1(d_ff_Zn[9]), .B0(n606), .B1(d_ff1_Z[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U1279 ( .A0(n605), .A1(d_ff_Zn[10]), .B0(n606), .B1(d_ff1_Z[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U1280 ( .A0(n605), .A1(d_ff_Zn[11]), .B0(n606), .B1(d_ff1_Z[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U1281 ( .A0(n605), .A1(d_ff_Zn[12]), .B0(n606), .B1(d_ff1_Z[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U1282 ( .A0(n605), .A1(d_ff_Zn[13]), .B0(n606), .B1(d_ff1_Z[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U1283 ( .A0(n605), .A1(d_ff_Zn[14]), .B0(n606), .B1(d_ff1_Z[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U1284 ( .A0(n607), .A1(d_ff_Zn[15]), .B0(n606), .B1(d_ff1_Z[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U1285 ( .A0(n607), .A1(d_ff_Zn[16]), .B0(n606), .B1(d_ff1_Z[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U1286 ( .A0(n607), .A1(d_ff_Zn[17]), .B0(n606), .B1(d_ff1_Z[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U1287 ( .A0(n607), .A1(d_ff_Zn[18]), .B0(n712), .B1(d_ff1_Z[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U1288 ( .A0(n607), .A1(d_ff_Zn[19]), .B0(n712), .B1(d_ff1_Z[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U1289 ( .A0(n607), .A1(d_ff_Zn[20]), .B0(n606), .B1(d_ff1_Z[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U1290 ( .A0(n607), .A1(d_ff_Zn[21]), .B0(n606), .B1(d_ff1_Z[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U1291 ( .A0(n607), .A1(d_ff_Zn[22]), .B0(n606), .B1(d_ff1_Z[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U1292 ( .A0(n607), .A1(d_ff_Zn[23]), .B0(n606), .B1(d_ff1_Z[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U1293 ( .A0(n607), .A1(d_ff_Zn[24]), .B0(n606), .B1(d_ff1_Z[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U1294 ( .A0(n607), .A1(d_ff_Zn[25]), .B0(n606), .B1(d_ff1_Z[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U1295 ( .A0(n607), .A1(d_ff_Zn[26]), .B0(n606), .B1(d_ff1_Z[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U1296 ( .A0(n607), .A1(d_ff_Zn[27]), .B0(n606), .B1(d_ff1_Z[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U1297 ( .A0(n609), .A1(d_ff_Zn[28]), .B0(n712), .B1(d_ff1_Z[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U1298 ( .A0(n609), .A1(d_ff_Zn[29]), .B0(n712), .B1(d_ff1_Z[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U1299 ( .A0(n609), .A1(d_ff_Zn[30]), .B0(n712), .B1(d_ff1_Z[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U1300 ( .A0(n609), .A1(d_ff_Zn[31]), .B0(n712), .B1(d_ff1_Z[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U1301 ( .A0(n613), .A1(d_ff_Zn[32]), .B0(n712), .B1(d_ff1_Z[32]), 
        .Y(first_mux_Z[32]) );
  AO22XLTS U1302 ( .A0(n609), .A1(d_ff_Zn[33]), .B0(n712), .B1(d_ff1_Z[33]), 
        .Y(first_mux_Z[33]) );
  AO22XLTS U1303 ( .A0(n609), .A1(d_ff_Zn[34]), .B0(n712), .B1(d_ff1_Z[34]), 
        .Y(first_mux_Z[34]) );
  AO22XLTS U1304 ( .A0(n609), .A1(d_ff_Zn[35]), .B0(n712), .B1(d_ff1_Z[35]), 
        .Y(first_mux_Z[35]) );
  AO22XLTS U1305 ( .A0(n609), .A1(d_ff_Zn[36]), .B0(n712), .B1(d_ff1_Z[36]), 
        .Y(first_mux_Z[36]) );
  AO22XLTS U1306 ( .A0(n609), .A1(d_ff_Zn[37]), .B0(n712), .B1(d_ff1_Z[37]), 
        .Y(first_mux_Z[37]) );
  AO22XLTS U1307 ( .A0(n609), .A1(d_ff_Zn[38]), .B0(n612), .B1(d_ff1_Z[38]), 
        .Y(first_mux_Z[38]) );
  AO22XLTS U1308 ( .A0(n609), .A1(d_ff_Zn[39]), .B0(n612), .B1(d_ff1_Z[39]), 
        .Y(first_mux_Z[39]) );
  AO22XLTS U1309 ( .A0(n609), .A1(d_ff_Zn[40]), .B0(n612), .B1(d_ff1_Z[40]), 
        .Y(first_mux_Z[40]) );
  AO22XLTS U1310 ( .A0(n609), .A1(d_ff_Zn[41]), .B0(n612), .B1(d_ff1_Z[41]), 
        .Y(first_mux_Z[41]) );
  AO22XLTS U1311 ( .A0(n611), .A1(d_ff_Zn[42]), .B0(n612), .B1(d_ff1_Z[42]), 
        .Y(first_mux_Z[42]) );
  AO22XLTS U1312 ( .A0(n611), .A1(d_ff_Zn[43]), .B0(n612), .B1(d_ff1_Z[43]), 
        .Y(first_mux_Z[43]) );
  AO22XLTS U1313 ( .A0(n611), .A1(d_ff_Zn[45]), .B0(n612), .B1(d_ff1_Z[45]), 
        .Y(first_mux_Z[45]) );
  AO22XLTS U1314 ( .A0(n611), .A1(d_ff_Zn[46]), .B0(n612), .B1(d_ff1_Z[46]), 
        .Y(first_mux_Z[46]) );
  AO22XLTS U1315 ( .A0(n611), .A1(d_ff_Zn[47]), .B0(n610), .B1(d_ff1_Z[47]), 
        .Y(first_mux_Z[47]) );
  AO22XLTS U1316 ( .A0(n611), .A1(d_ff_Zn[48]), .B0(n612), .B1(d_ff1_Z[48]), 
        .Y(first_mux_Z[48]) );
  AO22XLTS U1317 ( .A0(n611), .A1(d_ff_Zn[49]), .B0(n610), .B1(d_ff1_Z[49]), 
        .Y(first_mux_Z[49]) );
  AO22XLTS U1318 ( .A0(n611), .A1(d_ff_Zn[50]), .B0(n612), .B1(d_ff1_Z[50]), 
        .Y(first_mux_Z[50]) );
  AO22XLTS U1319 ( .A0(n611), .A1(d_ff_Zn[51]), .B0(n612), .B1(d_ff1_Z[51]), 
        .Y(first_mux_Z[51]) );
  AO22XLTS U1320 ( .A0(n611), .A1(d_ff_Zn[52]), .B0(n612), .B1(d_ff1_Z[52]), 
        .Y(first_mux_Z[52]) );
  AO22XLTS U1321 ( .A0(n611), .A1(d_ff_Zn[53]), .B0(n612), .B1(d_ff1_Z[53]), 
        .Y(first_mux_Z[53]) );
  AO22XLTS U1322 ( .A0(n611), .A1(d_ff_Zn[54]), .B0(n612), .B1(d_ff1_Z[54]), 
        .Y(first_mux_Z[54]) );
  AO22XLTS U1323 ( .A0(n613), .A1(d_ff_Zn[55]), .B0(n612), .B1(d_ff1_Z[55]), 
        .Y(first_mux_Z[55]) );
  AO22XLTS U1324 ( .A0(n613), .A1(d_ff_Zn[56]), .B0(n612), .B1(d_ff1_Z[56]), 
        .Y(first_mux_Z[56]) );
  AO22XLTS U1325 ( .A0(n613), .A1(d_ff_Zn[57]), .B0(n612), .B1(d_ff1_Z[57]), 
        .Y(first_mux_Z[57]) );
  AO22XLTS U1326 ( .A0(n613), .A1(d_ff_Zn[58]), .B0(n612), .B1(d_ff1_Z[58]), 
        .Y(first_mux_Z[58]) );
  AO22XLTS U1327 ( .A0(n613), .A1(d_ff_Zn[59]), .B0(n612), .B1(d_ff1_Z[59]), 
        .Y(first_mux_Z[59]) );
  AO22XLTS U1328 ( .A0(n613), .A1(d_ff_Zn[60]), .B0(n610), .B1(d_ff1_Z[60]), 
        .Y(first_mux_Z[60]) );
  AO22XLTS U1329 ( .A0(n613), .A1(d_ff_Zn[61]), .B0(n610), .B1(d_ff1_Z[61]), 
        .Y(first_mux_Z[61]) );
  AO22XLTS U1330 ( .A0(n613), .A1(d_ff_Zn[62]), .B0(n610), .B1(d_ff1_Z[62]), 
        .Y(first_mux_Z[62]) );
  AO22XLTS U1331 ( .A0(n613), .A1(d_ff_Zn[63]), .B0(n610), .B1(d_ff1_Z[63]), 
        .Y(first_mux_Z[63]) );
  AO22XLTS U1332 ( .A0(n619), .A1(d_ff_Yn[0]), .B0(n617), .B1(d_ff_Xn[0]), .Y(
        mux_sal[0]) );
  AO22XLTS U1333 ( .A0(n616), .A1(d_ff_Yn[1]), .B0(n614), .B1(d_ff_Xn[1]), .Y(
        mux_sal[1]) );
  AO22XLTS U1334 ( .A0(n619), .A1(d_ff_Yn[2]), .B0(n617), .B1(d_ff_Xn[2]), .Y(
        mux_sal[2]) );
  AO22XLTS U1335 ( .A0(n619), .A1(d_ff_Yn[3]), .B0(n614), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U1336 ( .A0(n616), .A1(d_ff_Yn[4]), .B0(n620), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  BUFX4TS U1337 ( .A(n711), .Y(n614) );
  AO22XLTS U1338 ( .A0(n616), .A1(d_ff_Yn[5]), .B0(n620), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  AO22XLTS U1339 ( .A0(n616), .A1(d_ff_Yn[6]), .B0(n711), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U1340 ( .A0(n619), .A1(d_ff_Yn[7]), .B0(n711), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U1341 ( .A0(n619), .A1(d_ff_Yn[8]), .B0(n711), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U1342 ( .A0(n619), .A1(d_ff_Yn[9]), .B0(n614), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U1343 ( .A0(n619), .A1(d_ff_Yn[10]), .B0(n617), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U1344 ( .A0(n616), .A1(d_ff_Yn[11]), .B0(n617), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U1345 ( .A0(n619), .A1(d_ff_Yn[12]), .B0(n614), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U1346 ( .A0(n619), .A1(d_ff_Yn[13]), .B0(n620), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U1347 ( .A0(n616), .A1(d_ff_Yn[14]), .B0(n617), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U1348 ( .A0(n619), .A1(d_ff_Yn[15]), .B0(n614), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U1349 ( .A0(n616), .A1(d_ff_Yn[16]), .B0(n620), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U1350 ( .A0(n619), .A1(d_ff_Yn[17]), .B0(n617), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U1351 ( .A0(n619), .A1(d_ff_Yn[18]), .B0(n614), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U1352 ( .A0(n616), .A1(d_ff_Yn[19]), .B0(n617), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U1353 ( .A0(n619), .A1(d_ff_Yn[20]), .B0(n614), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U1354 ( .A0(n619), .A1(d_ff_Yn[21]), .B0(n620), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U1355 ( .A0(n616), .A1(d_ff_Yn[22]), .B0(n617), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U1356 ( .A0(n619), .A1(d_ff_Yn[23]), .B0(n614), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U1357 ( .A0(n618), .A1(d_ff_Yn[24]), .B0(n620), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U1358 ( .A0(n619), .A1(d_ff_Yn[25]), .B0(n617), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U1359 ( .A0(n616), .A1(d_ff_Yn[26]), .B0(n614), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U1360 ( .A0(n618), .A1(d_ff_Yn[27]), .B0(n711), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U1361 ( .A0(n618), .A1(d_ff_Yn[28]), .B0(n614), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U1362 ( .A0(n619), .A1(d_ff_Yn[29]), .B0(n617), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U1363 ( .A0(n616), .A1(d_ff_Yn[30]), .B0(n711), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U1364 ( .A0(n618), .A1(d_ff_Yn[31]), .B0(n711), .B1(d_ff_Xn[31]), 
        .Y(mux_sal[31]) );
  AO22XLTS U1365 ( .A0(n619), .A1(d_ff_Yn[32]), .B0(n711), .B1(d_ff_Xn[32]), 
        .Y(mux_sal[32]) );
  AO22XLTS U1366 ( .A0(n618), .A1(d_ff_Yn[33]), .B0(n711), .B1(d_ff_Xn[33]), 
        .Y(mux_sal[33]) );
  AO22XLTS U1367 ( .A0(n619), .A1(d_ff_Yn[34]), .B0(n617), .B1(d_ff_Xn[34]), 
        .Y(mux_sal[34]) );
  AO22XLTS U1368 ( .A0(n618), .A1(d_ff_Yn[35]), .B0(n617), .B1(d_ff_Xn[35]), 
        .Y(mux_sal[35]) );
  AO22XLTS U1369 ( .A0(n619), .A1(d_ff_Yn[36]), .B0(n614), .B1(d_ff_Xn[36]), 
        .Y(mux_sal[36]) );
  AO22XLTS U1370 ( .A0(n616), .A1(d_ff_Yn[37]), .B0(n620), .B1(d_ff_Xn[37]), 
        .Y(mux_sal[37]) );
  AO22XLTS U1371 ( .A0(n618), .A1(d_ff_Yn[38]), .B0(n617), .B1(d_ff_Xn[38]), 
        .Y(mux_sal[38]) );
  AO22XLTS U1372 ( .A0(n618), .A1(d_ff_Yn[39]), .B0(n614), .B1(d_ff_Xn[39]), 
        .Y(mux_sal[39]) );
  AO22XLTS U1373 ( .A0(n618), .A1(d_ff_Yn[40]), .B0(n620), .B1(d_ff_Xn[40]), 
        .Y(mux_sal[40]) );
  AO22XLTS U1374 ( .A0(n618), .A1(d_ff_Yn[41]), .B0(n614), .B1(d_ff_Xn[41]), 
        .Y(mux_sal[41]) );
  AO22XLTS U1375 ( .A0(n618), .A1(d_ff_Yn[42]), .B0(n617), .B1(d_ff_Xn[42]), 
        .Y(mux_sal[42]) );
  AO22XLTS U1376 ( .A0(n618), .A1(d_ff_Yn[43]), .B0(n620), .B1(d_ff_Xn[43]), 
        .Y(mux_sal[43]) );
  AO22XLTS U1377 ( .A0(n618), .A1(d_ff_Yn[44]), .B0(n614), .B1(d_ff_Xn[44]), 
        .Y(mux_sal[44]) );
  AO22XLTS U1378 ( .A0(n618), .A1(d_ff_Yn[45]), .B0(n617), .B1(d_ff_Xn[45]), 
        .Y(mux_sal[45]) );
  AO22XLTS U1379 ( .A0(n618), .A1(d_ff_Yn[46]), .B0(n614), .B1(d_ff_Xn[46]), 
        .Y(mux_sal[46]) );
  AO22XLTS U1380 ( .A0(n618), .A1(d_ff_Yn[47]), .B0(n617), .B1(d_ff_Xn[47]), 
        .Y(mux_sal[47]) );
  AO22XLTS U1381 ( .A0(n618), .A1(d_ff_Yn[48]), .B0(n620), .B1(d_ff_Xn[48]), 
        .Y(mux_sal[48]) );
  BUFX3TS U1382 ( .A(n711), .Y(n620) );
  AO22XLTS U1383 ( .A0(n618), .A1(d_ff_Yn[49]), .B0(n614), .B1(d_ff_Xn[49]), 
        .Y(mux_sal[49]) );
  AO22XLTS U1384 ( .A0(n618), .A1(d_ff_Yn[50]), .B0(n617), .B1(d_ff_Xn[50]), 
        .Y(mux_sal[50]) );
  AO22XLTS U1385 ( .A0(n618), .A1(d_ff_Yn[51]), .B0(n620), .B1(d_ff_Xn[51]), 
        .Y(mux_sal[51]) );
  AO22XLTS U1386 ( .A0(n702), .A1(d_ff_Yn[52]), .B0(n614), .B1(d_ff_Xn[52]), 
        .Y(mux_sal[52]) );
  AO22XLTS U1387 ( .A0(n702), .A1(d_ff_Yn[53]), .B0(n617), .B1(d_ff_Xn[53]), 
        .Y(mux_sal[53]) );
  AO22XLTS U1388 ( .A0(n702), .A1(d_ff_Yn[54]), .B0(n617), .B1(d_ff_Xn[54]), 
        .Y(mux_sal[54]) );
  AO22XLTS U1389 ( .A0(n702), .A1(d_ff_Yn[55]), .B0(n614), .B1(d_ff_Xn[55]), 
        .Y(mux_sal[55]) );
  AO22XLTS U1390 ( .A0(n702), .A1(d_ff_Yn[56]), .B0(n620), .B1(d_ff_Xn[56]), 
        .Y(mux_sal[56]) );
  AO22XLTS U1391 ( .A0(n702), .A1(d_ff_Yn[57]), .B0(n617), .B1(d_ff_Xn[57]), 
        .Y(mux_sal[57]) );
  AO22XLTS U1392 ( .A0(n702), .A1(d_ff_Yn[58]), .B0(n614), .B1(d_ff_Xn[58]), 
        .Y(mux_sal[58]) );
  AO22XLTS U1393 ( .A0(n618), .A1(d_ff_Yn[59]), .B0(n620), .B1(d_ff_Xn[59]), 
        .Y(mux_sal[59]) );
  AO22XLTS U1394 ( .A0(n618), .A1(d_ff_Yn[60]), .B0(n711), .B1(d_ff_Xn[60]), 
        .Y(mux_sal[60]) );
  AO22XLTS U1395 ( .A0(n619), .A1(d_ff_Yn[61]), .B0(n617), .B1(d_ff_Xn[61]), 
        .Y(mux_sal[61]) );
  AO22XLTS U1396 ( .A0(n702), .A1(d_ff_Yn[62]), .B0(n614), .B1(d_ff_Xn[62]), 
        .Y(mux_sal[62]) );
  AO22XLTS U1397 ( .A0(n702), .A1(d_ff_Yn[63]), .B0(n620), .B1(d_ff_Xn[63]), 
        .Y(mux_sal[63]) );
  AOI32X1TS U1398 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(n713), .A2(
        d_ff1_operation_out), .B0(n621), .B1(d_ff1_shift_region_flag_out[0]), 
        .Y(n622) );
  XNOR2X1TS U1399 ( .A(data_output2_63_), .B(n622), .Y(sign_inv_out[63]) );
  NAND4XLTS U1400 ( .A(n639), .B(n625), .C(n623), .D(n624), .Y(data_out_LUT[0]) );
  NAND4XLTS U1401 ( .A(n639), .B(n637), .C(n626), .D(data_out_LUT[40]), .Y(
        data_out_LUT[1]) );
  INVX2TS U1402 ( .A(n645), .Y(n629) );
  NAND2X1TS U1403 ( .A(n627), .B(n629), .Y(data_out_LUT[2]) );
  NAND2X1TS U1404 ( .A(cont_iter_out[2]), .B(cont_iter_out[3]), .Y(n643) );
  NAND4XLTS U1405 ( .A(n637), .B(n623), .C(data_out_LUT[40]), .D(n643), .Y(
        data_out_LUT[6]) );
  NAND3X1TS U1406 ( .A(n716), .B(cont_iter_out[3]), .C(n628), .Y(n636) );
  OA21XLTS U1407 ( .A0(n629), .A1(n704), .B0(n636), .Y(n652) );
  NAND4XLTS U1408 ( .A(n639), .B(n652), .C(n623), .D(n648), .Y(data_out_LUT[7]) );
  INVX2TS U1409 ( .A(data_out_LUT[22]), .Y(n642) );
  NAND2X1TS U1410 ( .A(n637), .B(n642), .Y(data_out_LUT[8]) );
  OAI21XLTS U1411 ( .A0(n716), .A1(data_out_LUT[20]), .B0(n635), .Y(n630) );
  OAI2BB1X1TS U1412 ( .A0N(n631), .A1N(n645), .B0(n630), .Y(data_out_LUT[9])
         );
  NAND2X1TS U1413 ( .A(n645), .B(n631), .Y(n632) );
  NAND4XLTS U1414 ( .A(n637), .B(n633), .C(n641), .D(n632), .Y(
        data_out_LUT[11]) );
  NAND4XLTS U1415 ( .A(n653), .B(n639), .C(n636), .D(n644), .Y(
        data_out_LUT[13]) );
  OA21XLTS U1416 ( .A0(n633), .A1(n704), .B0(n641), .Y(n634) );
  NAND4XLTS U1417 ( .A(n634), .B(n623), .C(n648), .D(data_out_LUT[40]), .Y(
        data_out_LUT[15]) );
  NAND4XLTS U1418 ( .A(n637), .B(data_out_LUT[50]), .C(n636), .D(n635), .Y(
        data_out_LUT[35]) );
  NAND2BXLTS U1419 ( .AN(data_out_LUT[35]), .B(n623), .Y(data_out_LUT[18]) );
  NAND3XLTS U1420 ( .A(n639), .B(n638), .C(n623), .Y(data_out_LUT[19]) );
  NAND2X1TS U1421 ( .A(n640), .B(data_out_LUT[22]), .Y(data_out_LUT[21]) );
  NAND3XLTS U1422 ( .A(n642), .B(n648), .C(n641), .Y(data_out_LUT[26]) );
  NAND2X1TS U1423 ( .A(n647), .B(data_out_LUT[47]), .Y(data_out_LUT[30]) );
  NAND4XLTS U1424 ( .A(n623), .B(n648), .C(n644), .D(n643), .Y(
        data_out_LUT[29]) );
  AO21XLTS U1425 ( .A0(n716), .A1(n645), .B0(data_out_LUT[29]), .Y(
        data_out_LUT[31]) );
  NAND2X1TS U1426 ( .A(cont_iter_out[2]), .B(n704), .Y(data_out_LUT[37]) );
  NAND3XLTS U1427 ( .A(n704), .B(data_out_LUT[50]), .C(n646), .Y(
        data_out_LUT[39]) );
  NAND2BXLTS U1428 ( .AN(data_out_LUT[16]), .B(n623), .Y(data_out_LUT[43]) );
  NAND2X1TS U1429 ( .A(n647), .B(n623), .Y(data_out_LUT[41]) );
  NAND2BXLTS U1430 ( .AN(data_out_LUT[16]), .B(n648), .Y(data_out_LUT[12]) );
  NAND2BXLTS U1431 ( .AN(data_out_LUT[12]), .B(n623), .Y(data_out_LUT[24]) );
  NAND3XLTS U1432 ( .A(n653), .B(n649), .C(n623), .Y(data_out_LUT[55]) );
  OAI21XLTS U1433 ( .A0(n650), .A1(n704), .B0(n767), .Y(n651) );
  NAND3XLTS U1434 ( .A(n653), .B(n652), .C(n651), .Y(data_out_LUT[3]) );
  NAND2BXLTS U1435 ( .AN(d_ff_Xn[0]), .B(n654), .Y(first_mux_X[0]) );
  CLKAND2X2TS U1436 ( .A(d_ff_Xn[1]), .B(n655), .Y(first_mux_X[1]) );
  CLKAND2X2TS U1437 ( .A(d_ff_Xn[2]), .B(n656), .Y(first_mux_X[2]) );
  NAND2BXLTS U1438 ( .AN(d_ff_Xn[3]), .B(n654), .Y(first_mux_X[3]) );
  CLKAND2X2TS U1439 ( .A(d_ff_Xn[4]), .B(n655), .Y(first_mux_X[4]) );
  CLKAND2X2TS U1440 ( .A(d_ff_Xn[5]), .B(n656), .Y(first_mux_X[5]) );
  NAND2BXLTS U1441 ( .AN(d_ff_Xn[6]), .B(n655), .Y(first_mux_X[6]) );
  NAND2BXLTS U1442 ( .AN(d_ff_Xn[7]), .B(n656), .Y(first_mux_X[7]) );
  NAND2BXLTS U1443 ( .AN(d_ff_Xn[8]), .B(n657), .Y(first_mux_X[8]) );
  NAND2BXLTS U1444 ( .AN(d_ff_Xn[9]), .B(n655), .Y(first_mux_X[9]) );
  CLKAND2X2TS U1445 ( .A(d_ff_Xn[10]), .B(n657), .Y(first_mux_X[10]) );
  NAND2BXLTS U1446 ( .AN(d_ff_Xn[11]), .B(n654), .Y(first_mux_X[11]) );
  CLKAND2X2TS U1447 ( .A(d_ff_Xn[12]), .B(n657), .Y(first_mux_X[12]) );
  NAND2BXLTS U1448 ( .AN(d_ff_Xn[13]), .B(n655), .Y(first_mux_X[13]) );
  NAND2BXLTS U1449 ( .AN(d_ff_Xn[14]), .B(n656), .Y(first_mux_X[14]) );
  CLKAND2X2TS U1450 ( .A(d_ff_Xn[15]), .B(n655), .Y(first_mux_X[15]) );
  CLKAND2X2TS U1451 ( .A(d_ff_Xn[16]), .B(n656), .Y(first_mux_X[16]) );
  CLKAND2X2TS U1452 ( .A(d_ff_Xn[17]), .B(n656), .Y(first_mux_X[17]) );
  CLKAND2X2TS U1453 ( .A(d_ff_Xn[18]), .B(n654), .Y(first_mux_X[18]) );
  NAND2BXLTS U1454 ( .AN(d_ff_Xn[19]), .B(n657), .Y(first_mux_X[19]) );
  CLKAND2X2TS U1455 ( .A(d_ff_Xn[20]), .B(n654), .Y(first_mux_X[20]) );
  CLKAND2X2TS U1456 ( .A(d_ff_Xn[21]), .B(n656), .Y(first_mux_X[21]) );
  CLKAND2X2TS U1457 ( .A(d_ff_Xn[22]), .B(n657), .Y(first_mux_X[22]) );
  CLKAND2X2TS U1458 ( .A(d_ff_Xn[23]), .B(n657), .Y(first_mux_X[23]) );
  NAND2BXLTS U1459 ( .AN(d_ff_Xn[24]), .B(n656), .Y(first_mux_X[24]) );
  CLKAND2X2TS U1460 ( .A(d_ff_Xn[25]), .B(n657), .Y(first_mux_X[25]) );
  NAND2BXLTS U1461 ( .AN(d_ff_Xn[26]), .B(n657), .Y(first_mux_X[26]) );
  CLKAND2X2TS U1462 ( .A(d_ff_Xn[27]), .B(n657), .Y(first_mux_X[27]) );
  NAND2BXLTS U1463 ( .AN(d_ff_Xn[28]), .B(n657), .Y(first_mux_X[28]) );
  NAND2BXLTS U1464 ( .AN(d_ff_Xn[29]), .B(n656), .Y(first_mux_X[29]) );
  CLKAND2X2TS U1465 ( .A(d_ff_Xn[30]), .B(n657), .Y(first_mux_X[30]) );
  NAND2BXLTS U1466 ( .AN(d_ff_Xn[31]), .B(n654), .Y(first_mux_X[31]) );
  NAND2BXLTS U1467 ( .AN(d_ff_Xn[32]), .B(n654), .Y(first_mux_X[32]) );
  CLKAND2X2TS U1468 ( .A(d_ff_Xn[33]), .B(n657), .Y(first_mux_X[33]) );
  NAND2BXLTS U1469 ( .AN(d_ff_Xn[34]), .B(n655), .Y(first_mux_X[34]) );
  NAND2BXLTS U1470 ( .AN(d_ff_Xn[35]), .B(n656), .Y(first_mux_X[35]) );
  NAND2BXLTS U1471 ( .AN(d_ff_Xn[36]), .B(n657), .Y(first_mux_X[36]) );
  CLKAND2X2TS U1472 ( .A(d_ff_Xn[37]), .B(n657), .Y(first_mux_X[37]) );
  CLKAND2X2TS U1473 ( .A(d_ff_Xn[38]), .B(n654), .Y(first_mux_X[38]) );
  NAND2BXLTS U1474 ( .AN(d_ff_Xn[39]), .B(n657), .Y(first_mux_X[39]) );
  CLKAND2X2TS U1475 ( .A(d_ff_Xn[40]), .B(n657), .Y(first_mux_X[40]) );
  NAND2BXLTS U1476 ( .AN(d_ff_Xn[41]), .B(n654), .Y(first_mux_X[41]) );
  NAND2BXLTS U1477 ( .AN(d_ff_Xn[42]), .B(n655), .Y(first_mux_X[42]) );
  NAND2BXLTS U1478 ( .AN(d_ff_Xn[43]), .B(n656), .Y(first_mux_X[43]) );
  CLKAND2X2TS U1479 ( .A(d_ff_Xn[44]), .B(n657), .Y(first_mux_X[44]) );
  NAND2BXLTS U1480 ( .AN(d_ff_Xn[45]), .B(n655), .Y(first_mux_X[45]) );
  NAND2BXLTS U1481 ( .AN(d_ff_Xn[46]), .B(n656), .Y(first_mux_X[46]) );
  CLKAND2X2TS U1482 ( .A(d_ff_Xn[47]), .B(n657), .Y(first_mux_X[47]) );
  NAND2BXLTS U1483 ( .AN(d_ff_Xn[48]), .B(n613), .Y(first_mux_X[48]) );
  NAND2BXLTS U1484 ( .AN(d_ff_Xn[49]), .B(n657), .Y(first_mux_X[49]) );
  CLKAND2X2TS U1485 ( .A(d_ff_Xn[50]), .B(n655), .Y(first_mux_X[50]) );
  CLKAND2X2TS U1486 ( .A(d_ff_Xn[51]), .B(n655), .Y(first_mux_X[51]) );
  CLKAND2X2TS U1487 ( .A(d_ff_Xn[52]), .B(n654), .Y(first_mux_X[52]) );
  NAND2BXLTS U1488 ( .AN(d_ff_Xn[53]), .B(n611), .Y(first_mux_X[53]) );
  NAND2BXLTS U1489 ( .AN(d_ff_Xn[54]), .B(n613), .Y(first_mux_X[54]) );
  NAND2BXLTS U1490 ( .AN(d_ff_Xn[55]), .B(n654), .Y(first_mux_X[55]) );
  NAND2BXLTS U1491 ( .AN(d_ff_Xn[56]), .B(n655), .Y(first_mux_X[56]) );
  NAND2BXLTS U1492 ( .AN(d_ff_Xn[57]), .B(n654), .Y(first_mux_X[57]) );
  NAND2BXLTS U1493 ( .AN(d_ff_Xn[58]), .B(n656), .Y(first_mux_X[58]) );
  NAND2BXLTS U1494 ( .AN(d_ff_Xn[59]), .B(n655), .Y(first_mux_X[59]) );
  NAND2BXLTS U1495 ( .AN(d_ff_Xn[60]), .B(n611), .Y(first_mux_X[60]) );
  NAND2BXLTS U1496 ( .AN(d_ff_Xn[61]), .B(n654), .Y(first_mux_X[61]) );
  CLKAND2X2TS U1497 ( .A(d_ff_Xn[62]), .B(n655), .Y(first_mux_X[62]) );
  CLKAND2X2TS U1498 ( .A(d_ff_Xn[63]), .B(n656), .Y(first_mux_X[63]) );
  AO22XLTS U1499 ( .A0(n576), .A1(d_ff3_sh_x_out[63]), .B0(n658), .B1(
        d_ff3_sh_y_out[63]), .Y(add_subt_dataB[63]) );
  AO22XLTS U1500 ( .A0(n576), .A1(d_ff3_sh_x_out[62]), .B0(n658), .B1(
        d_ff3_sh_y_out[62]), .Y(add_subt_dataB[62]) );
  AOI22X1TS U1501 ( .A0(n678), .A1(d_ff3_sh_x_out[61]), .B0(n682), .B1(
        d_ff3_sh_y_out[61]), .Y(n659) );
  NAND2X2TS U1502 ( .A(n424), .B(d_ff3_LUT_out[48]), .Y(n666) );
  NAND2X1TS U1503 ( .A(n659), .B(n666), .Y(add_subt_dataB[61]) );
  AOI22X1TS U1504 ( .A0(n678), .A1(d_ff3_sh_x_out[60]), .B0(n677), .B1(
        d_ff3_sh_y_out[60]), .Y(n660) );
  NAND2X1TS U1505 ( .A(n660), .B(n666), .Y(add_subt_dataB[60]) );
  AOI22X1TS U1506 ( .A0(n678), .A1(d_ff3_sh_x_out[59]), .B0(n687), .B1(
        d_ff3_sh_y_out[59]), .Y(n661) );
  NAND2X1TS U1507 ( .A(n661), .B(n666), .Y(add_subt_dataB[59]) );
  AOI22X1TS U1508 ( .A0(n678), .A1(d_ff3_sh_x_out[58]), .B0(n682), .B1(
        d_ff3_sh_y_out[58]), .Y(n662) );
  NAND2X1TS U1509 ( .A(n662), .B(n666), .Y(add_subt_dataB[58]) );
  AOI22X1TS U1510 ( .A0(n678), .A1(d_ff3_sh_x_out[57]), .B0(n677), .B1(
        d_ff3_sh_y_out[57]), .Y(n663) );
  NAND2X1TS U1511 ( .A(n663), .B(n666), .Y(add_subt_dataB[57]) );
  AOI22X1TS U1512 ( .A0(n678), .A1(d_ff3_sh_x_out[51]), .B0(n682), .B1(
        d_ff3_sh_y_out[51]), .Y(n664) );
  NAND2X1TS U1513 ( .A(n664), .B(n666), .Y(add_subt_dataB[51]) );
  AOI22X1TS U1514 ( .A0(n683), .A1(d_ff3_sh_x_out[49]), .B0(n687), .B1(
        d_ff3_sh_y_out[49]), .Y(n665) );
  NAND2X1TS U1515 ( .A(n424), .B(d_ff3_LUT_out[49]), .Y(n670) );
  NAND2X1TS U1516 ( .A(n665), .B(n670), .Y(add_subt_dataB[49]) );
  AOI22X1TS U1517 ( .A0(n678), .A1(d_ff3_sh_x_out[48]), .B0(n687), .B1(
        d_ff3_sh_y_out[48]), .Y(n667) );
  NAND2X1TS U1518 ( .A(n667), .B(n666), .Y(add_subt_dataB[48]) );
  AOI22X1TS U1519 ( .A0(n683), .A1(d_ff3_sh_x_out[47]), .B0(n682), .B1(
        d_ff3_sh_y_out[47]), .Y(n668) );
  OAI2BB1X1TS U1520 ( .A0N(n675), .A1N(d_ff3_LUT_out[47]), .B0(n668), .Y(
        add_subt_dataB[47]) );
  AOI22X1TS U1521 ( .A0(n678), .A1(d_ff3_sh_x_out[46]), .B0(n677), .B1(
        d_ff3_sh_y_out[46]), .Y(n669) );
  NAND2X1TS U1522 ( .A(n669), .B(n670), .Y(add_subt_dataB[46]) );
  AOI22X1TS U1523 ( .A0(n678), .A1(d_ff3_sh_x_out[44]), .B0(n687), .B1(
        d_ff3_sh_y_out[44]), .Y(n671) );
  NAND2X1TS U1524 ( .A(n671), .B(n670), .Y(add_subt_dataB[44]) );
  AOI22X1TS U1525 ( .A0(n678), .A1(d_ff3_sh_x_out[42]), .B0(n682), .B1(
        d_ff3_sh_y_out[42]), .Y(n672) );
  OAI2BB1X1TS U1526 ( .A0N(n686), .A1N(d_ff3_LUT_out[47]), .B0(n672), .Y(
        add_subt_dataB[42]) );
  AOI22X1TS U1527 ( .A0(n683), .A1(d_ff3_sh_x_out[40]), .B0(n682), .B1(
        d_ff3_sh_y_out[40]), .Y(n673) );
  NAND2X1TS U1528 ( .A(n424), .B(d_ff3_LUT_out[40]), .Y(n680) );
  NAND2X1TS U1529 ( .A(n673), .B(n680), .Y(add_subt_dataB[40]) );
  AOI22X1TS U1530 ( .A0(n678), .A1(d_ff3_sh_x_out[38]), .B0(n682), .B1(
        d_ff3_sh_y_out[38]), .Y(n674) );
  OAI2BB1X1TS U1531 ( .A0N(n675), .A1N(d_ff3_LUT_out[38]), .B0(n674), .Y(
        add_subt_dataB[38]) );
  AOI22X1TS U1532 ( .A0(n683), .A1(d_ff3_sh_x_out[36]), .B0(n682), .B1(
        d_ff3_sh_y_out[36]), .Y(n676) );
  NAND2X1TS U1533 ( .A(n676), .B(n680), .Y(add_subt_dataB[36]) );
  AOI22X1TS U1534 ( .A0(n678), .A1(d_ff3_sh_x_out[32]), .B0(n677), .B1(
        d_ff3_sh_y_out[32]), .Y(n679) );
  OAI2BB1X1TS U1535 ( .A0N(n686), .A1N(d_ff3_LUT_out[38]), .B0(n679), .Y(
        add_subt_dataB[32]) );
  AOI22X1TS U1536 ( .A0(n683), .A1(d_ff3_sh_x_out[28]), .B0(n682), .B1(
        d_ff3_sh_y_out[28]), .Y(n681) );
  NAND2X1TS U1537 ( .A(n681), .B(n680), .Y(add_subt_dataB[28]) );
  AOI22X1TS U1538 ( .A0(n683), .A1(d_ff3_sh_x_out[4]), .B0(n682), .B1(
        d_ff3_sh_y_out[4]), .Y(n684) );
  OAI2BB1X1TS U1539 ( .A0N(n685), .A1N(d_ff3_LUT_out[30]), .B0(n684), .Y(
        add_subt_dataB[4]) );
  AOI22X1TS U1540 ( .A0(d_ff2_X[59]), .A1(n687), .B0(n686), .B1(d_ff2_Z[59]), 
        .Y(n688) );
  OAI2BB1X1TS U1541 ( .A0N(d_ff2_Y[59]), .A1N(n576), .B0(n688), .Y(
        add_subt_dataA[59]) );
  XNOR2X1TS U1542 ( .A(cont_var_out[0]), .B(d_ff3_sign_out), .Y(op_add_subt)
         );
  XOR2XLTS U1544 ( .A(d_ff2_Y[61]), .B(n693), .Y(sh_exp_y[9]) );
  AO21XLTS U1545 ( .A0(d_ff2_Y[60]), .A1(n689), .B0(n693), .Y(sh_exp_y[8]) );
  AO21XLTS U1546 ( .A0(d_ff2_Y[58]), .A1(n691), .B0(n690), .Y(sh_exp_y[6]) );
  AO21XLTS U1547 ( .A0(intadd_458_n1), .A1(d_ff2_Y[56]), .B0(n692), .Y(
        sh_exp_y[4]) );
  NOR2BX1TS U1548 ( .AN(n693), .B(d_ff2_Y[61]), .Y(n694) );
  XOR2XLTS U1549 ( .A(n694), .B(d_ff2_Y[62]), .Y(sh_exp_y[10]) );
  XOR2XLTS U1550 ( .A(d_ff2_X[61]), .B(n699), .Y(sh_exp_x[9]) );
  AO21XLTS U1551 ( .A0(d_ff2_X[60]), .A1(n695), .B0(n699), .Y(sh_exp_x[8]) );
  AO21XLTS U1552 ( .A0(d_ff2_X[58]), .A1(n697), .B0(n696), .Y(sh_exp_x[6]) );
  AO21XLTS U1553 ( .A0(intadd_457_n1), .A1(d_ff2_X[56]), .B0(n698), .Y(
        sh_exp_x[4]) );
  NOR2BX1TS U1554 ( .AN(n699), .B(d_ff2_X[61]), .Y(n700) );
  XOR2XLTS U1555 ( .A(n700), .B(d_ff2_X[62]), .Y(sh_exp_x[10]) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk40.tcl_GATED_syn.sdf"); 
 endmodule

