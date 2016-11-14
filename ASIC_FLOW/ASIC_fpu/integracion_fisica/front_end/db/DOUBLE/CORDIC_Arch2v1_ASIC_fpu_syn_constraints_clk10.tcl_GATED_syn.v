/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 13 09:14:50 2016
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_counter_d_W4_74 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_15 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_16 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_18 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_19 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_20 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_22 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_25 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule


module SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W64_EW11_SW52_SWR55_EWR6_1 ( CLK, 
        EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2TS latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
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
  wire   d_ff1_operation_out, enab_cont_iter, load_cont_iter, load_cont_var,
         enab_d_ff2_RB2, enab_d_ff4_Xn, enab_d_ff4_Yn, enab_d_ff4_Zn,
         enab_d_ff5_data_out, enab_dff_5, d_ff3_sign_out, data_output2_63_,
         cordic_FSM_state_next_1_, cont_iter_net3815995,
         d_ff5_data_out_net3815959, reg_Z0_net3815959,
         reg_val_muxZ_2stage_net3815959, reg_shift_y_net3815959,
         d_ff4_Xn_net3815959, d_ff4_Yn_net3815959, d_ff4_Zn_net3815959,
         d_ff5_net3815959, n276, n282, n283, n284, n285, n289, n290, n291,
         n292, n293, intadd_451_CI, intadd_451_n3, intadd_451_n2,
         intadd_451_n1, intadd_452_CI, intadd_452_n3, intadd_452_n2,
         intadd_452_n1, n423, n425, n426, n427, n428, n429, n430, n431, n432,
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
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
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
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827, n828,
         n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n857, n858, n859, n860, n861;
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

  SNPS_CLOCK_GATE_HIGH_counter_d_W4_74 cont_iter_clk_gate_count_reg ( .CLK(clk), .EN(enab_cont_iter), .ENCLK(cont_iter_net3815995), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_13 d_ff5_data_out_clk_gate_Q_reg ( .CLK(
        clk), .EN(enab_d_ff5_data_out), .ENCLK(d_ff5_data_out_net3815959), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_25 reg_Z0_clk_gate_Q_reg ( .CLK(clk), 
        .EN(load_cont_iter), .ENCLK(reg_Z0_net3815959), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_22 reg_val_muxZ_2stage_clk_gate_Q_reg ( 
        .CLK(clk), .EN(enab_d_ff2_RB2), .ENCLK(reg_val_muxZ_2stage_net3815959), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_20 reg_shift_y_clk_gate_Q_reg ( .CLK(clk), 
        .EN(load_cont_var), .ENCLK(reg_shift_y_net3815959), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_19 d_ff4_Xn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Xn), .ENCLK(d_ff4_Xn_net3815959), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_18 d_ff4_Yn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Yn), .ENCLK(d_ff4_Yn_net3815959), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_16 d_ff4_Zn_clk_gate_Q_reg ( .CLK(clk), 
        .EN(enab_d_ff4_Zn), .ENCLK(d_ff4_Zn_net3815959), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_d_ff_en_W64_0_15 d_ff5_clk_gate_Q_reg ( .CLK(clk), .EN(
        enab_dff_5), .ENCLK(d_ff5_net3815959), .TE(1'b0) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(data_out_LUT[0]), .CK(reg_shift_y_net3815959), 
        .RN(n838), .Q(d_ff3_LUT_out[0]) );
  DFFRXLTS reg_LUT_Q_reg_1_ ( .D(data_out_LUT[1]), .CK(reg_shift_y_net3815959), 
        .RN(n444), .Q(d_ff3_LUT_out[1]) );
  DFFRXLTS reg_LUT_Q_reg_2_ ( .D(data_out_LUT[2]), .CK(reg_shift_y_net3815959), 
        .RN(n438), .Q(d_ff3_LUT_out[2]) );
  DFFRXLTS reg_LUT_Q_reg_3_ ( .D(data_out_LUT[3]), .CK(reg_shift_y_net3815959), 
        .RN(n852), .Q(d_ff3_LUT_out[3]) );
  DFFRXLTS reg_LUT_Q_reg_5_ ( .D(data_out_LUT[5]), .CK(reg_shift_y_net3815959), 
        .RN(n852), .Q(d_ff3_LUT_out[5]) );
  DFFRXLTS reg_LUT_Q_reg_6_ ( .D(data_out_LUT[6]), .CK(reg_shift_y_net3815959), 
        .RN(n852), .Q(d_ff3_LUT_out[6]) );
  DFFRXLTS reg_LUT_Q_reg_7_ ( .D(data_out_LUT[7]), .CK(reg_shift_y_net3815959), 
        .RN(n852), .Q(d_ff3_LUT_out[7]) );
  DFFRXLTS reg_LUT_Q_reg_8_ ( .D(data_out_LUT[8]), .CK(reg_shift_y_net3815959), 
        .RN(n852), .Q(d_ff3_LUT_out[8]) );
  DFFRXLTS reg_LUT_Q_reg_9_ ( .D(data_out_LUT[9]), .CK(reg_shift_y_net3815959), 
        .RN(n852), .Q(d_ff3_LUT_out[9]) );
  DFFRXLTS reg_LUT_Q_reg_10_ ( .D(data_out_LUT[10]), .CK(
        reg_shift_y_net3815959), .RN(n852), .Q(d_ff3_LUT_out[10]) );
  DFFRXLTS reg_LUT_Q_reg_11_ ( .D(data_out_LUT[11]), .CK(
        reg_shift_y_net3815959), .RN(n852), .Q(d_ff3_LUT_out[11]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(data_out_LUT[12]), .CK(
        reg_shift_y_net3815959), .RN(n443), .Q(d_ff3_LUT_out[12]) );
  DFFRXLTS reg_LUT_Q_reg_13_ ( .D(data_out_LUT[13]), .CK(
        reg_shift_y_net3815959), .RN(n444), .Q(d_ff3_LUT_out[13]) );
  DFFRXLTS reg_LUT_Q_reg_14_ ( .D(data_out_LUT[14]), .CK(
        reg_shift_y_net3815959), .RN(n435), .Q(d_ff3_LUT_out[14]) );
  DFFRXLTS reg_LUT_Q_reg_15_ ( .D(data_out_LUT[15]), .CK(
        reg_shift_y_net3815959), .RN(n444), .Q(d_ff3_LUT_out[15]) );
  DFFRXLTS reg_LUT_Q_reg_16_ ( .D(data_out_LUT[16]), .CK(
        reg_shift_y_net3815959), .RN(n443), .Q(d_ff3_LUT_out[16]) );
  DFFRXLTS reg_LUT_Q_reg_17_ ( .D(data_out_LUT[17]), .CK(
        reg_shift_y_net3815959), .RN(n436), .Q(d_ff3_LUT_out[17]) );
  DFFRXLTS reg_LUT_Q_reg_18_ ( .D(data_out_LUT[18]), .CK(
        reg_shift_y_net3815959), .RN(n444), .Q(d_ff3_LUT_out[18]) );
  DFFRXLTS reg_LUT_Q_reg_19_ ( .D(data_out_LUT[19]), .CK(
        reg_shift_y_net3815959), .RN(n448), .Q(d_ff3_LUT_out[19]) );
  DFFRXLTS reg_LUT_Q_reg_20_ ( .D(data_out_LUT[20]), .CK(
        reg_shift_y_net3815959), .RN(n834), .Q(d_ff3_LUT_out[20]) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(data_out_LUT[21]), .CK(
        reg_shift_y_net3815959), .RN(n444), .Q(d_ff3_LUT_out[21]) );
  DFFRXLTS reg_LUT_Q_reg_22_ ( .D(data_out_LUT[22]), .CK(
        reg_shift_y_net3815959), .RN(n435), .Q(d_ff3_LUT_out[22]) );
  DFFRXLTS reg_LUT_Q_reg_23_ ( .D(data_out_LUT[23]), .CK(
        reg_shift_y_net3815959), .RN(n444), .Q(d_ff3_LUT_out[23]) );
  DFFRXLTS reg_LUT_Q_reg_24_ ( .D(data_out_LUT[24]), .CK(
        reg_shift_y_net3815959), .RN(n444), .Q(d_ff3_LUT_out[24]) );
  DFFRXLTS reg_LUT_Q_reg_25_ ( .D(data_out_LUT[25]), .CK(
        reg_shift_y_net3815959), .RN(n433), .Q(d_ff3_LUT_out[25]) );
  DFFRXLTS reg_LUT_Q_reg_26_ ( .D(data_out_LUT[26]), .CK(
        reg_shift_y_net3815959), .RN(n443), .Q(d_ff3_LUT_out[26]) );
  DFFRXLTS reg_LUT_Q_reg_27_ ( .D(data_out_LUT[27]), .CK(
        reg_shift_y_net3815959), .RN(n439), .Q(d_ff3_LUT_out[27]) );
  DFFRXLTS reg_LUT_Q_reg_29_ ( .D(data_out_LUT[29]), .CK(
        reg_shift_y_net3815959), .RN(n432), .Q(d_ff3_LUT_out[29]) );
  DFFRXLTS reg_LUT_Q_reg_30_ ( .D(data_out_LUT[30]), .CK(
        reg_shift_y_net3815959), .RN(n443), .Q(d_ff3_LUT_out[30]) );
  DFFRXLTS reg_LUT_Q_reg_31_ ( .D(data_out_LUT[31]), .CK(
        reg_shift_y_net3815959), .RN(n440), .Q(d_ff3_LUT_out[31]) );
  DFFRXLTS reg_LUT_Q_reg_33_ ( .D(data_out_LUT[33]), .CK(
        reg_shift_y_net3815959), .RN(n427), .Q(d_ff3_LUT_out[33]) );
  DFFRXLTS reg_LUT_Q_reg_35_ ( .D(data_out_LUT[35]), .CK(
        reg_shift_y_net3815959), .RN(n443), .Q(d_ff3_LUT_out[35]) );
  DFFRXLTS reg_LUT_Q_reg_37_ ( .D(data_out_LUT[37]), .CK(
        reg_shift_y_net3815959), .RN(n441), .Q(d_ff3_LUT_out[37]) );
  DFFRXLTS reg_LUT_Q_reg_38_ ( .D(data_out_LUT[38]), .CK(
        reg_shift_y_net3815959), .RN(n788), .Q(d_ff3_LUT_out[38]) );
  DFFRXLTS reg_LUT_Q_reg_39_ ( .D(data_out_LUT[39]), .CK(
        reg_shift_y_net3815959), .RN(n802), .Q(d_ff3_LUT_out[39]) );
  DFFRXLTS reg_LUT_Q_reg_40_ ( .D(data_out_LUT[40]), .CK(
        reg_shift_y_net3815959), .RN(n851), .Q(d_ff3_LUT_out[40]) );
  DFFRXLTS reg_LUT_Q_reg_41_ ( .D(data_out_LUT[41]), .CK(
        reg_shift_y_net3815959), .RN(n789), .Q(d_ff3_LUT_out[41]) );
  DFFRXLTS reg_LUT_Q_reg_43_ ( .D(data_out_LUT[43]), .CK(
        reg_shift_y_net3815959), .RN(n788), .Q(d_ff3_LUT_out[43]) );
  DFFRXLTS reg_LUT_Q_reg_45_ ( .D(data_out_LUT[45]), .CK(
        reg_shift_y_net3815959), .RN(n802), .Q(d_ff3_LUT_out[45]) );
  DFFRXLTS reg_LUT_Q_reg_47_ ( .D(data_out_LUT[47]), .CK(
        reg_shift_y_net3815959), .RN(n851), .Q(d_ff3_LUT_out[47]) );
  DFFRXLTS reg_LUT_Q_reg_49_ ( .D(data_out_LUT[49]), .CK(
        reg_shift_y_net3815959), .RN(n789), .Q(d_ff3_LUT_out[49]) );
  DFFRXLTS reg_LUT_Q_reg_50_ ( .D(data_out_LUT[50]), .CK(
        reg_shift_y_net3815959), .RN(n788), .Q(d_ff3_LUT_out[50]) );
  DFFRXLTS reg_LUT_Q_reg_52_ ( .D(n455), .CK(reg_shift_y_net3815959), .RN(n802), .Q(d_ff3_LUT_out[52]) );
  DFFRXLTS reg_LUT_Q_reg_53_ ( .D(data_out_LUT[53]), .CK(
        reg_shift_y_net3815959), .RN(n847), .Q(d_ff3_LUT_out[53]) );
  DFFRXLTS reg_LUT_Q_reg_54_ ( .D(data_out_LUT[54]), .CK(
        reg_shift_y_net3815959), .RN(n847), .Q(d_ff3_LUT_out[54]) );
  DFFRXLTS reg_LUT_Q_reg_55_ ( .D(data_out_LUT[55]), .CK(
        reg_shift_y_net3815959), .RN(n849), .Q(d_ff3_LUT_out[55]) );
  DFFRXLTS reg_LUT_Q_reg_56_ ( .D(data_out_LUT[56]), .CK(
        reg_shift_y_net3815959), .RN(n842), .Q(d_ff3_LUT_out[56]) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(data_in[0]), .CK(reg_Z0_net3815959), .RN(n850), 
        .Q(d_ff1_Z[0]) );
  DFFRXLTS reg_Z0_Q_reg_1_ ( .D(data_in[1]), .CK(reg_Z0_net3815959), .RN(n840), 
        .Q(d_ff1_Z[1]) );
  DFFRXLTS reg_Z0_Q_reg_2_ ( .D(data_in[2]), .CK(reg_Z0_net3815959), .RN(n847), 
        .Q(d_ff1_Z[2]) );
  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(data_in[3]), .CK(reg_Z0_net3815959), .RN(n826), 
        .Q(d_ff1_Z[3]) );
  DFFRXLTS reg_Z0_Q_reg_4_ ( .D(data_in[4]), .CK(reg_Z0_net3815959), .RN(n850), 
        .Q(d_ff1_Z[4]) );
  DFFRXLTS reg_Z0_Q_reg_5_ ( .D(data_in[5]), .CK(reg_Z0_net3815959), .RN(n842), 
        .Q(d_ff1_Z[5]) );
  DFFRXLTS reg_Z0_Q_reg_6_ ( .D(data_in[6]), .CK(reg_Z0_net3815959), .RN(n837), 
        .Q(d_ff1_Z[6]) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(data_in[7]), .CK(reg_Z0_net3815959), .RN(n840), 
        .Q(d_ff1_Z[7]) );
  DFFRXLTS reg_Z0_Q_reg_8_ ( .D(data_in[8]), .CK(reg_Z0_net3815959), .RN(n847), 
        .Q(d_ff1_Z[8]) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(data_in[9]), .CK(reg_Z0_net3815959), .RN(n787), 
        .Q(d_ff1_Z[9]) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(data_in[10]), .CK(reg_Z0_net3815959), .RN(
        n840), .Q(d_ff1_Z[10]) );
  DFFRXLTS reg_Z0_Q_reg_11_ ( .D(data_in[11]), .CK(reg_Z0_net3815959), .RN(
        n837), .Q(d_ff1_Z[11]) );
  DFFRXLTS reg_Z0_Q_reg_12_ ( .D(data_in[12]), .CK(reg_Z0_net3815959), .RN(
        n801), .Q(d_ff1_Z[12]) );
  DFFRXLTS reg_Z0_Q_reg_13_ ( .D(data_in[13]), .CK(reg_Z0_net3815959), .RN(
        n440), .Q(d_ff1_Z[13]) );
  DFFRXLTS reg_Z0_Q_reg_14_ ( .D(data_in[14]), .CK(reg_Z0_net3815959), .RN(
        n849), .Q(d_ff1_Z[14]) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(data_in[15]), .CK(reg_Z0_net3815959), .RN(
        n826), .Q(d_ff1_Z[15]) );
  DFFRXLTS reg_Z0_Q_reg_16_ ( .D(data_in[16]), .CK(reg_Z0_net3815959), .RN(
        n841), .Q(d_ff1_Z[16]) );
  DFFRXLTS reg_Z0_Q_reg_17_ ( .D(data_in[17]), .CK(reg_Z0_net3815959), .RN(
        n848), .Q(d_ff1_Z[17]) );
  DFFRXLTS reg_Z0_Q_reg_18_ ( .D(data_in[18]), .CK(reg_Z0_net3815959), .RN(
        n845), .Q(d_ff1_Z[18]) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(data_in[19]), .CK(reg_Z0_net3815959), .RN(
        n829), .Q(d_ff1_Z[19]) );
  DFFRXLTS reg_Z0_Q_reg_20_ ( .D(data_in[20]), .CK(reg_Z0_net3815959), .RN(
        n841), .Q(d_ff1_Z[20]) );
  DFFRXLTS reg_Z0_Q_reg_21_ ( .D(data_in[21]), .CK(reg_Z0_net3815959), .RN(
        n848), .Q(d_ff1_Z[21]) );
  DFFRXLTS reg_Z0_Q_reg_22_ ( .D(data_in[22]), .CK(reg_Z0_net3815959), .RN(
        n845), .Q(d_ff1_Z[22]) );
  DFFRXLTS reg_Z0_Q_reg_23_ ( .D(data_in[23]), .CK(reg_Z0_net3815959), .RN(
        n829), .Q(d_ff1_Z[23]) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(data_in[24]), .CK(reg_Z0_net3815959), .RN(
        n841), .Q(d_ff1_Z[24]) );
  DFFRXLTS reg_Z0_Q_reg_25_ ( .D(data_in[25]), .CK(reg_Z0_net3815959), .RN(
        n848), .Q(d_ff1_Z[25]) );
  DFFRXLTS reg_Z0_Q_reg_26_ ( .D(data_in[26]), .CK(reg_Z0_net3815959), .RN(
        n844), .Q(d_ff1_Z[26]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(data_in[27]), .CK(reg_Z0_net3815959), .RN(
        n844), .Q(d_ff1_Z[27]) );
  DFFRXLTS reg_Z0_Q_reg_28_ ( .D(data_in[28]), .CK(reg_Z0_net3815959), .RN(
        n837), .Q(d_ff1_Z[28]) );
  DFFRXLTS reg_Z0_Q_reg_29_ ( .D(data_in[29]), .CK(reg_Z0_net3815959), .RN(
        n844), .Q(d_ff1_Z[29]) );
  DFFRXLTS reg_Z0_Q_reg_30_ ( .D(data_in[30]), .CK(reg_Z0_net3815959), .RN(
        n826), .Q(d_ff1_Z[30]) );
  DFFRXLTS reg_Z0_Q_reg_31_ ( .D(data_in[31]), .CK(reg_Z0_net3815959), .RN(
        n850), .Q(d_ff1_Z[31]) );
  DFFRXLTS reg_Z0_Q_reg_32_ ( .D(data_in[32]), .CK(reg_Z0_net3815959), .RN(
        n850), .Q(d_ff1_Z[32]) );
  DFFRXLTS reg_Z0_Q_reg_33_ ( .D(data_in[33]), .CK(reg_Z0_net3815959), .RN(
        n840), .Q(d_ff1_Z[33]) );
  DFFRXLTS reg_Z0_Q_reg_34_ ( .D(data_in[34]), .CK(reg_Z0_net3815959), .RN(
        n847), .Q(d_ff1_Z[34]) );
  DFFRXLTS reg_Z0_Q_reg_35_ ( .D(data_in[35]), .CK(reg_Z0_net3815959), .RN(
        n827), .Q(d_ff1_Z[35]) );
  DFFRXLTS reg_Z0_Q_reg_36_ ( .D(data_in[36]), .CK(reg_Z0_net3815959), .RN(
        n828), .Q(d_ff1_Z[36]) );
  DFFRXLTS reg_Z0_Q_reg_37_ ( .D(data_in[37]), .CK(reg_Z0_net3815959), .RN(
        n832), .Q(d_ff1_Z[37]) );
  DFFRXLTS reg_Z0_Q_reg_38_ ( .D(data_in[38]), .CK(reg_Z0_net3815959), .RN(
        n846), .Q(d_ff1_Z[38]) );
  DFFRXLTS reg_Z0_Q_reg_39_ ( .D(data_in[39]), .CK(reg_Z0_net3815959), .RN(
        n427), .Q(d_ff1_Z[39]) );
  DFFRXLTS reg_Z0_Q_reg_40_ ( .D(data_in[40]), .CK(reg_Z0_net3815959), .RN(
        n846), .Q(d_ff1_Z[40]) );
  DFFRXLTS reg_Z0_Q_reg_41_ ( .D(data_in[41]), .CK(reg_Z0_net3815959), .RN(
        n427), .Q(d_ff1_Z[41]) );
  DFFRXLTS reg_Z0_Q_reg_42_ ( .D(data_in[42]), .CK(reg_Z0_net3815959), .RN(
        n828), .Q(d_ff1_Z[42]) );
  DFFRXLTS reg_Z0_Q_reg_43_ ( .D(data_in[43]), .CK(reg_Z0_net3815959), .RN(
        n832), .Q(d_ff1_Z[43]) );
  DFFRXLTS reg_Z0_Q_reg_44_ ( .D(data_in[44]), .CK(reg_Z0_net3815959), .RN(
        n831), .Q(d_ff1_Z[44]) );
  DFFRXLTS reg_Z0_Q_reg_45_ ( .D(data_in[45]), .CK(reg_Z0_net3815959), .RN(
        n846), .Q(d_ff1_Z[45]) );
  DFFRXLTS reg_Z0_Q_reg_46_ ( .D(data_in[46]), .CK(reg_Z0_net3815959), .RN(
        n845), .Q(d_ff1_Z[46]) );
  DFFRXLTS reg_Z0_Q_reg_47_ ( .D(data_in[47]), .CK(reg_Z0_net3815959), .RN(
        n829), .Q(d_ff1_Z[47]) );
  DFFRXLTS reg_Z0_Q_reg_48_ ( .D(data_in[48]), .CK(reg_Z0_net3815959), .RN(
        n841), .Q(d_ff1_Z[48]) );
  DFFRXLTS reg_Z0_Q_reg_49_ ( .D(data_in[49]), .CK(reg_Z0_net3815959), .RN(
        n848), .Q(d_ff1_Z[49]) );
  DFFRXLTS reg_Z0_Q_reg_50_ ( .D(data_in[50]), .CK(reg_Z0_net3815959), .RN(
        n845), .Q(d_ff1_Z[50]) );
  DFFRXLTS reg_Z0_Q_reg_51_ ( .D(data_in[51]), .CK(reg_Z0_net3815959), .RN(
        n829), .Q(d_ff1_Z[51]) );
  DFFRXLTS reg_Z0_Q_reg_52_ ( .D(data_in[52]), .CK(reg_Z0_net3815959), .RN(
        n841), .Q(d_ff1_Z[52]) );
  DFFRXLTS reg_Z0_Q_reg_53_ ( .D(data_in[53]), .CK(reg_Z0_net3815959), .RN(
        n848), .Q(d_ff1_Z[53]) );
  DFFRXLTS reg_Z0_Q_reg_54_ ( .D(data_in[54]), .CK(reg_Z0_net3815959), .RN(
        n845), .Q(d_ff1_Z[54]) );
  DFFRXLTS reg_Z0_Q_reg_55_ ( .D(data_in[55]), .CK(reg_Z0_net3815959), .RN(
        n829), .Q(d_ff1_Z[55]) );
  DFFRXLTS reg_Z0_Q_reg_56_ ( .D(data_in[56]), .CK(reg_Z0_net3815959), .RN(
        n827), .Q(d_ff1_Z[56]) );
  DFFRXLTS reg_Z0_Q_reg_57_ ( .D(data_in[57]), .CK(reg_Z0_net3815959), .RN(
        n844), .Q(d_ff1_Z[57]) );
  DFFRXLTS reg_Z0_Q_reg_58_ ( .D(data_in[58]), .CK(reg_Z0_net3815959), .RN(
        n825), .Q(d_ff1_Z[58]) );
  DFFRXLTS reg_Z0_Q_reg_59_ ( .D(data_in[59]), .CK(reg_Z0_net3815959), .RN(
        n827), .Q(d_ff1_Z[59]) );
  DFFRXLTS reg_Z0_Q_reg_60_ ( .D(data_in[60]), .CK(reg_Z0_net3815959), .RN(
        n827), .Q(d_ff1_Z[60]) );
  DFFRXLTS reg_Z0_Q_reg_61_ ( .D(data_in[61]), .CK(reg_Z0_net3815959), .RN(
        n847), .Q(d_ff1_Z[61]) );
  DFFRXLTS reg_Z0_Q_reg_62_ ( .D(data_in[62]), .CK(reg_Z0_net3815959), .RN(
        n825), .Q(d_ff1_Z[62]) );
  DFFRXLTS reg_Z0_Q_reg_63_ ( .D(data_in[63]), .CK(reg_Z0_net3815959), .RN(
        n849), .Q(d_ff1_Z[63]) );
  DFFRXLTS reg_shift_x_Q_reg_52_ ( .D(sh_exp_x[0]), .CK(reg_shift_y_net3815959), .RN(n827), .Q(d_ff3_sh_x_out[52]) );
  DFFRXLTS reg_shift_x_Q_reg_53_ ( .D(sh_exp_x[1]), .CK(reg_shift_y_net3815959), .RN(n842), .Q(d_ff3_sh_x_out[53]) );
  DFFRXLTS reg_shift_x_Q_reg_54_ ( .D(sh_exp_x[2]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[54]) );
  DFFRXLTS reg_shift_x_Q_reg_55_ ( .D(sh_exp_x[3]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[55]) );
  DFFRXLTS reg_shift_x_Q_reg_56_ ( .D(sh_exp_x[4]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[56]) );
  DFFRXLTS reg_shift_x_Q_reg_57_ ( .D(sh_exp_x[5]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[57]) );
  DFFRXLTS reg_shift_x_Q_reg_58_ ( .D(sh_exp_x[6]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[58]) );
  DFFRXLTS reg_shift_x_Q_reg_59_ ( .D(sh_exp_x[7]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[59]) );
  DFFRXLTS reg_shift_x_Q_reg_60_ ( .D(sh_exp_x[8]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[60]) );
  DFFRXLTS reg_shift_x_Q_reg_61_ ( .D(sh_exp_x[9]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[61]) );
  DFFRXLTS reg_shift_x_Q_reg_62_ ( .D(sh_exp_x[10]), .CK(
        reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_x_out[62]) );
  DFFRXLTS reg_shift_y_Q_reg_52_ ( .D(sh_exp_y[0]), .CK(reg_shift_y_net3815959), .RN(n843), .Q(d_ff3_sh_y_out[52]) );
  DFFRXLTS reg_shift_y_Q_reg_53_ ( .D(sh_exp_y[1]), .CK(reg_shift_y_net3815959), .RN(n837), .Q(d_ff3_sh_y_out[53]) );
  DFFRXLTS reg_shift_y_Q_reg_54_ ( .D(sh_exp_y[2]), .CK(reg_shift_y_net3815959), .RN(n847), .Q(d_ff3_sh_y_out[54]) );
  DFFRXLTS reg_shift_y_Q_reg_55_ ( .D(sh_exp_y[3]), .CK(reg_shift_y_net3815959), .RN(n850), .Q(d_ff3_sh_y_out[55]) );
  DFFRXLTS reg_shift_y_Q_reg_56_ ( .D(sh_exp_y[4]), .CK(reg_shift_y_net3815959), .RN(n850), .Q(d_ff3_sh_y_out[56]) );
  DFFRXLTS reg_shift_y_Q_reg_57_ ( .D(sh_exp_y[5]), .CK(reg_shift_y_net3815959), .RN(n842), .Q(d_ff3_sh_y_out[57]) );
  DFFRXLTS reg_shift_y_Q_reg_58_ ( .D(sh_exp_y[6]), .CK(reg_shift_y_net3815959), .RN(n826), .Q(d_ff3_sh_y_out[58]) );
  DFFRXLTS reg_shift_y_Q_reg_59_ ( .D(sh_exp_y[7]), .CK(reg_shift_y_net3815959), .RN(n844), .Q(d_ff3_sh_y_out[59]) );
  DFFRXLTS reg_shift_y_Q_reg_60_ ( .D(sh_exp_y[8]), .CK(reg_shift_y_net3815959), .RN(n844), .Q(d_ff3_sh_y_out[60]) );
  DFFRXLTS reg_shift_y_Q_reg_61_ ( .D(sh_exp_y[9]), .CK(reg_shift_y_net3815959), .RN(n844), .Q(d_ff3_sh_y_out[61]) );
  DFFRXLTS reg_shift_y_Q_reg_62_ ( .D(sh_exp_y[10]), .CK(
        reg_shift_y_net3815959), .RN(n827), .Q(d_ff3_sh_y_out[62]) );
  DFFRXLTS d_ff4_Xn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Xn_net3815959), .RN(n841), .Q(d_ff_Xn[0]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_0_ ( .D(first_mux_X[0]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n848), .Q(d_ff2_X[0]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(d_ff2_X[0]), .CK(reg_shift_y_net3815959), 
        .RN(n845), .Q(d_ff3_sh_x_out[0]) );
  DFFRXLTS d_ff4_Xn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Xn_net3815959), .RN(n829), .Q(d_ff_Xn[1]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_1_ ( .D(first_mux_X[1]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n845), .Q(d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_1_ ( .D(d_ff2_X[1]), .CK(reg_shift_y_net3815959), 
        .RN(n829), .Q(d_ff3_sh_x_out[1]) );
  DFFRXLTS d_ff4_Xn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Xn_net3815959), .RN(n841), .Q(d_ff_Xn[2]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_2_ ( .D(first_mux_X[2]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n848), .Q(d_ff2_X[2]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(d_ff2_X[2]), .CK(reg_shift_y_net3815959), 
        .RN(n845), .Q(d_ff3_sh_x_out[2]) );
  DFFRXLTS d_ff4_Xn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Xn_net3815959), .RN(n829), .Q(d_ff_Xn[3]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_3_ ( .D(first_mux_X[3]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n844), .Q(d_ff2_X[3]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(d_ff2_X[3]), .CK(reg_shift_y_net3815959), 
        .RN(n827), .Q(d_ff3_sh_x_out[3]) );
  DFFRXLTS d_ff4_Xn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Xn_net3815959), .RN(n825), .Q(d_ff_Xn[4]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_4_ ( .D(first_mux_X[4]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n849), .Q(d_ff2_X[4]) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(d_ff2_X[4]), .CK(reg_shift_y_net3815959), 
        .RN(n837), .Q(d_ff3_sh_x_out[4]) );
  DFFRXLTS d_ff4_Xn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Xn_net3815959), .RN(n847), .Q(d_ff_Xn[5]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_5_ ( .D(first_mux_X[5]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n844), .Q(d_ff2_X[5]) );
  DFFRXLTS reg_shift_x_Q_reg_5_ ( .D(d_ff2_X[5]), .CK(reg_shift_y_net3815959), 
        .RN(n850), .Q(d_ff3_sh_x_out[5]) );
  DFFRXLTS d_ff4_Xn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Xn_net3815959), .RN(n842), .Q(d_ff_Xn[6]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_6_ ( .D(first_mux_X[6]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n842), .Q(d_ff2_X[6]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(d_ff2_X[6]), .CK(reg_shift_y_net3815959), 
        .RN(n828), .Q(d_ff3_sh_x_out[6]) );
  DFFRXLTS d_ff4_Xn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Xn_net3815959), .RN(n831), .Q(d_ff_Xn[7]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_7_ ( .D(first_mux_X[7]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n839), .Q(d_ff2_X[7]) );
  DFFRXLTS reg_shift_x_Q_reg_7_ ( .D(d_ff2_X[7]), .CK(reg_shift_y_net3815959), 
        .RN(n828), .Q(d_ff3_sh_x_out[7]) );
  DFFRXLTS d_ff4_Xn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Xn_net3815959), .RN(n846), .Q(d_ff_Xn[8]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_8_ ( .D(first_mux_X[8]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n432), .Q(d_ff2_X[8]) );
  DFFRXLTS reg_shift_x_Q_reg_8_ ( .D(d_ff2_X[8]), .CK(reg_shift_y_net3815959), 
        .RN(n426), .Q(d_ff3_sh_x_out[8]) );
  DFFRXLTS d_ff4_Xn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Xn_net3815959), .RN(n828), .Q(d_ff_Xn[9]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_9_ ( .D(first_mux_X[9]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n831), .Q(d_ff2_X[9]) );
  DFFRXLTS reg_shift_x_Q_reg_9_ ( .D(d_ff2_X[9]), .CK(reg_shift_y_net3815959), 
        .RN(n426), .Q(d_ff3_sh_x_out[9]) );
  DFFRXLTS d_ff4_Xn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Xn_net3815959), .RN(n430), .Q(d_ff_Xn[10]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_10_ ( .D(first_mux_X[10]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n432), .Q(d_ff2_X[10]) );
  DFFRXLTS reg_shift_x_Q_reg_10_ ( .D(d_ff2_X[10]), .CK(reg_shift_y_net3815959), .RN(n435), .Q(d_ff3_sh_x_out[10]) );
  DFFRXLTS d_ff4_Xn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Xn_net3815959), .RN(n438), .Q(d_ff_Xn[11]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_11_ ( .D(first_mux_X[11]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n835), .Q(d_ff2_X[11]) );
  DFFRXLTS reg_shift_x_Q_reg_11_ ( .D(d_ff2_X[11]), .CK(reg_shift_y_net3815959), .RN(n430), .Q(d_ff3_sh_x_out[11]) );
  DFFRXLTS d_ff4_Xn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Xn_net3815959), .RN(n432), .Q(d_ff_Xn[12]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_12_ ( .D(first_mux_X[12]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n435), .Q(d_ff2_X[12]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(d_ff2_X[12]), .CK(reg_shift_y_net3815959), .RN(n438), .Q(d_ff3_sh_x_out[12]) );
  DFFRXLTS d_ff4_Xn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Xn_net3815959), .RN(n835), .Q(d_ff_Xn[13]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_13_ ( .D(first_mux_X[13]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n842), .Q(d_ff2_X[13]) );
  DFFRXLTS reg_shift_x_Q_reg_13_ ( .D(d_ff2_X[13]), .CK(reg_shift_y_net3815959), .RN(n850), .Q(d_ff3_sh_x_out[13]) );
  DFFRXLTS d_ff4_Xn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Xn_net3815959), .RN(n826), .Q(d_ff_Xn[14]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_14_ ( .D(first_mux_X[14]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n842), .Q(d_ff2_X[14]) );
  DFFRXLTS reg_shift_x_Q_reg_14_ ( .D(d_ff2_X[14]), .CK(reg_shift_y_net3815959), .RN(n842), .Q(d_ff3_sh_x_out[14]) );
  DFFRXLTS d_ff4_Xn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Xn_net3815959), .RN(n850), .Q(d_ff_Xn[15]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_15_ ( .D(first_mux_X[15]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n827), .Q(d_ff2_X[15]) );
  DFFRXLTS reg_shift_x_Q_reg_15_ ( .D(d_ff2_X[15]), .CK(reg_shift_y_net3815959), .RN(n840), .Q(d_ff3_sh_x_out[15]) );
  DFFRXLTS d_ff4_Xn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Xn_net3815959), .RN(n847), .Q(d_ff_Xn[16]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_16_ ( .D(first_mux_X[16]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n827), .Q(d_ff2_X[16]) );
  DFFRXLTS reg_shift_x_Q_reg_16_ ( .D(d_ff2_X[16]), .CK(reg_shift_y_net3815959), .RN(n436), .Q(d_ff3_sh_x_out[16]) );
  DFFRXLTS d_ff4_Xn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Xn_net3815959), .RN(n436), .Q(d_ff_Xn[17]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_17_ ( .D(first_mux_X[17]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n835), .Q(d_ff2_X[17]) );
  DFFRXLTS reg_shift_x_Q_reg_17_ ( .D(d_ff2_X[17]), .CK(reg_shift_y_net3815959), .RN(n835), .Q(d_ff3_sh_x_out[17]) );
  DFFRXLTS d_ff4_Xn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Xn_net3815959), .RN(n429), .Q(d_ff_Xn[18]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_18_ ( .D(first_mux_X[18]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n438), .Q(d_ff2_X[18]) );
  DFFRXLTS reg_shift_x_Q_reg_18_ ( .D(d_ff2_X[18]), .CK(reg_shift_y_net3815959), .RN(n835), .Q(d_ff3_sh_x_out[18]) );
  DFFRXLTS d_ff4_Xn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Xn_net3815959), .RN(n439), .Q(d_ff_Xn[19]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_19_ ( .D(first_mux_X[19]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n435), .Q(d_ff2_X[19]) );
  DFFRXLTS reg_shift_x_Q_reg_19_ ( .D(d_ff2_X[19]), .CK(reg_shift_y_net3815959), .RN(n439), .Q(d_ff3_sh_x_out[19]) );
  DFFRXLTS d_ff4_Xn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Xn_net3815959), .RN(n436), .Q(d_ff_Xn[20]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_20_ ( .D(first_mux_X[20]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n430), .Q(d_ff2_X[20]) );
  DFFRXLTS reg_shift_x_Q_reg_20_ ( .D(d_ff2_X[20]), .CK(reg_shift_y_net3815959), .RN(n836), .Q(d_ff3_sh_x_out[20]) );
  DFFRXLTS d_ff4_Xn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Xn_net3815959), .RN(n439), .Q(d_ff_Xn[21]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_21_ ( .D(first_mux_X[21]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n435), .Q(d_ff2_X[21]) );
  DFFRXLTS reg_shift_x_Q_reg_21_ ( .D(d_ff2_X[21]), .CK(reg_shift_y_net3815959), .RN(n432), .Q(d_ff3_sh_x_out[21]) );
  DFFRXLTS d_ff4_Xn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Xn_net3815959), .RN(n438), .Q(d_ff_Xn[22]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_22_ ( .D(first_mux_X[22]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n836), .Q(d_ff2_X[22]) );
  DFFRXLTS reg_shift_x_Q_reg_22_ ( .D(d_ff2_X[22]), .CK(reg_shift_y_net3815959), .RN(n835), .Q(d_ff3_sh_x_out[22]) );
  DFFRXLTS d_ff4_Xn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Xn_net3815959), .RN(n432), .Q(d_ff_Xn[23]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_23_ ( .D(first_mux_X[23]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n429), .Q(d_ff2_X[23]) );
  DFFRXLTS reg_shift_x_Q_reg_23_ ( .D(d_ff2_X[23]), .CK(reg_shift_y_net3815959), .RN(n435), .Q(d_ff3_sh_x_out[23]) );
  DFFRXLTS d_ff4_Xn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Xn_net3815959), .RN(n836), .Q(d_ff_Xn[24]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_24_ ( .D(first_mux_X[24]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n433), .Q(d_ff2_X[24]) );
  DFFRXLTS reg_shift_x_Q_reg_24_ ( .D(d_ff2_X[24]), .CK(reg_shift_y_net3815959), .RN(n429), .Q(d_ff3_sh_x_out[24]) );
  DFFRXLTS d_ff4_Xn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Xn_net3815959), .RN(n835), .Q(d_ff_Xn[25]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_25_ ( .D(first_mux_X[25]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n430), .Q(d_ff2_X[25]) );
  DFFRXLTS reg_shift_x_Q_reg_25_ ( .D(d_ff2_X[25]), .CK(reg_shift_y_net3815959), .RN(n836), .Q(d_ff3_sh_x_out[25]) );
  DFFRXLTS d_ff4_Xn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Xn_net3815959), .RN(n433), .Q(d_ff_Xn[26]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_26_ ( .D(first_mux_X[26]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n432), .Q(d_ff2_X[26]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(d_ff2_X[26]), .CK(reg_shift_y_net3815959), .RN(n429), .Q(d_ff3_sh_x_out[26]) );
  DFFRXLTS d_ff4_Xn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Xn_net3815959), .RN(n433), .Q(d_ff_Xn[27]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_27_ ( .D(first_mux_X[27]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n836), .Q(d_ff2_X[27]) );
  DFFRXLTS reg_shift_x_Q_reg_27_ ( .D(d_ff2_X[27]), .CK(reg_shift_y_net3815959), .RN(n430), .Q(d_ff3_sh_x_out[27]) );
  DFFRXLTS d_ff4_Xn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Xn_net3815959), .RN(n435), .Q(d_ff_Xn[28]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_28_ ( .D(first_mux_X[28]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n432), .Q(d_ff2_X[28]) );
  DFFRXLTS reg_shift_x_Q_reg_28_ ( .D(d_ff2_X[28]), .CK(reg_shift_y_net3815959), .RN(n429), .Q(d_ff3_sh_x_out[28]) );
  DFFRXLTS d_ff4_Xn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Xn_net3815959), .RN(n836), .Q(d_ff_Xn[29]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_29_ ( .D(first_mux_X[29]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n438), .Q(d_ff2_X[29]) );
  DFFRXLTS reg_shift_x_Q_reg_29_ ( .D(d_ff2_X[29]), .CK(reg_shift_y_net3815959), .RN(n429), .Q(d_ff3_sh_x_out[29]) );
  DFFRXLTS d_ff4_Xn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Xn_net3815959), .RN(n831), .Q(d_ff_Xn[30]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_30_ ( .D(first_mux_X[30]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n832), .Q(d_ff2_X[30]) );
  DFFRXLTS reg_shift_x_Q_reg_30_ ( .D(d_ff2_X[30]), .CK(reg_shift_y_net3815959), .RN(n426), .Q(d_ff3_sh_x_out[30]) );
  DFFRXLTS d_ff4_Xn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Xn_net3815959), .RN(n427), .Q(d_ff_Xn[31]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_31_ ( .D(first_mux_X[31]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n832), .Q(d_ff2_X[31]) );
  DFFRXLTS reg_shift_x_Q_reg_31_ ( .D(d_ff2_X[31]), .CK(reg_shift_y_net3815959), .RN(n828), .Q(d_ff3_sh_x_out[31]) );
  DFFRXLTS d_ff4_Xn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Xn_net3815959), .RN(n831), .Q(d_ff_Xn[32]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_32_ ( .D(first_mux_X[32]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n831), .Q(d_ff2_X[32]) );
  DFFRXLTS reg_shift_x_Q_reg_32_ ( .D(d_ff2_X[32]), .CK(reg_shift_y_net3815959), .RN(n426), .Q(d_ff3_sh_x_out[32]) );
  DFFRXLTS d_ff4_Xn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Xn_net3815959), .RN(n427), .Q(d_ff_Xn[33]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_33_ ( .D(first_mux_X[33]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n429), .Q(d_ff2_X[33]) );
  DFFRXLTS reg_shift_x_Q_reg_33_ ( .D(d_ff2_X[33]), .CK(reg_shift_y_net3815959), .RN(n831), .Q(d_ff3_sh_x_out[33]) );
  DFFRXLTS d_ff4_Xn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Xn_net3815959), .RN(n438), .Q(d_ff_Xn[34]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_34_ ( .D(first_mux_X[34]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n832), .Q(d_ff2_X[34]) );
  DFFRXLTS reg_shift_x_Q_reg_34_ ( .D(d_ff2_X[34]), .CK(reg_shift_y_net3815959), .RN(n426), .Q(d_ff3_sh_x_out[34]) );
  DFFRXLTS d_ff4_Xn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Xn_net3815959), .RN(n828), .Q(d_ff_Xn[35]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_35_ ( .D(first_mux_X[35]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n433), .Q(d_ff2_X[35]) );
  DFFRXLTS reg_shift_x_Q_reg_35_ ( .D(d_ff2_X[35]), .CK(reg_shift_y_net3815959), .RN(n828), .Q(d_ff3_sh_x_out[35]) );
  DFFRXLTS d_ff4_Xn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Xn_net3815959), .RN(n439), .Q(d_ff_Xn[36]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_36_ ( .D(first_mux_X[36]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n831), .Q(d_ff2_X[36]) );
  DFFRXLTS reg_shift_x_Q_reg_36_ ( .D(d_ff2_X[36]), .CK(reg_shift_y_net3815959), .RN(n832), .Q(d_ff3_sh_x_out[36]) );
  DFFRXLTS d_ff4_Xn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Xn_net3815959), .RN(n846), .Q(d_ff_Xn[37]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_37_ ( .D(first_mux_X[37]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n427), .Q(d_ff2_X[37]) );
  DFFRXLTS reg_shift_x_Q_reg_37_ ( .D(d_ff2_X[37]), .CK(reg_shift_y_net3815959), .RN(n832), .Q(d_ff3_sh_x_out[37]) );
  DFFRXLTS d_ff4_Xn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Xn_net3815959), .RN(n430), .Q(d_ff_Xn[38]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_38_ ( .D(first_mux_X[38]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n832), .Q(d_ff2_X[38]) );
  DFFRXLTS reg_shift_x_Q_reg_38_ ( .D(d_ff2_X[38]), .CK(reg_shift_y_net3815959), .RN(n832), .Q(d_ff3_sh_x_out[38]) );
  DFFRXLTS d_ff4_Xn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Xn_net3815959), .RN(n831), .Q(d_ff_Xn[39]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_39_ ( .D(first_mux_X[39]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n846), .Q(d_ff2_X[39]) );
  DFFRXLTS reg_shift_x_Q_reg_39_ ( .D(d_ff2_X[39]), .CK(reg_shift_y_net3815959), .RN(n440), .Q(d_ff3_sh_x_out[39]) );
  DFFRXLTS d_ff4_Xn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Xn_net3815959), .RN(n438), .Q(d_ff_Xn[40]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_40_ ( .D(first_mux_X[40]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n433), .Q(d_ff2_X[40]) );
  DFFRXLTS reg_shift_x_Q_reg_40_ ( .D(d_ff2_X[40]), .CK(reg_shift_y_net3815959), .RN(n836), .Q(d_ff3_sh_x_out[40]) );
  DFFRXLTS d_ff4_Xn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Xn_net3815959), .RN(n436), .Q(d_ff_Xn[41]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_41_ ( .D(first_mux_X[41]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n835), .Q(d_ff2_X[41]) );
  DFFRXLTS reg_shift_x_Q_reg_41_ ( .D(d_ff2_X[41]), .CK(reg_shift_y_net3815959), .RN(n436), .Q(d_ff3_sh_x_out[41]) );
  DFFRXLTS d_ff4_Xn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Xn_net3815959), .RN(n433), .Q(d_ff_Xn[42]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_42_ ( .D(first_mux_X[42]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n836), .Q(d_ff2_X[42]) );
  DFFRXLTS reg_shift_x_Q_reg_42_ ( .D(d_ff2_X[42]), .CK(reg_shift_y_net3815959), .RN(n439), .Q(d_ff3_sh_x_out[42]) );
  DFFRXLTS d_ff4_Xn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Xn_net3815959), .RN(n439), .Q(d_ff_Xn[43]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_43_ ( .D(first_mux_X[43]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n841), .Q(d_ff2_X[43]) );
  DFFRXLTS reg_shift_x_Q_reg_43_ ( .D(d_ff2_X[43]), .CK(reg_shift_y_net3815959), .RN(n848), .Q(d_ff3_sh_x_out[43]) );
  DFFRXLTS d_ff4_Xn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Xn_net3815959), .RN(n845), .Q(d_ff_Xn[44]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_44_ ( .D(first_mux_X[44]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n829), .Q(d_ff2_X[44]) );
  DFFRXLTS reg_shift_x_Q_reg_44_ ( .D(d_ff2_X[44]), .CK(reg_shift_y_net3815959), .RN(n841), .Q(d_ff3_sh_x_out[44]) );
  DFFRXLTS d_ff4_Xn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Xn_net3815959), .RN(n848), .Q(d_ff_Xn[45]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_45_ ( .D(first_mux_X[45]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n845), .Q(d_ff2_X[45]) );
  DFFRXLTS reg_shift_x_Q_reg_45_ ( .D(d_ff2_X[45]), .CK(reg_shift_y_net3815959), .RN(n829), .Q(d_ff3_sh_x_out[45]) );
  DFFRXLTS d_ff4_Xn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Xn_net3815959), .RN(n841), .Q(d_ff_Xn[46]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_46_ ( .D(first_mux_X[46]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n848), .Q(d_ff2_X[46]) );
  DFFRXLTS reg_shift_x_Q_reg_46_ ( .D(d_ff2_X[46]), .CK(reg_shift_y_net3815959), .RN(n846), .Q(d_ff3_sh_x_out[46]) );
  DFFRXLTS d_ff4_Xn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Xn_net3815959), .RN(n828), .Q(d_ff_Xn[47]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_47_ ( .D(first_mux_X[47]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n846), .Q(d_ff2_X[47]) );
  DFFRXLTS reg_shift_x_Q_reg_47_ ( .D(d_ff2_X[47]), .CK(reg_shift_y_net3815959), .RN(n832), .Q(d_ff3_sh_x_out[47]) );
  DFFRXLTS d_ff4_Xn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Xn_net3815959), .RN(n831), .Q(d_ff_Xn[48]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_48_ ( .D(first_mux_X[48]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n426), .Q(d_ff2_X[48]) );
  DFFRXLTS reg_shift_x_Q_reg_48_ ( .D(d_ff2_X[48]), .CK(reg_shift_y_net3815959), .RN(n846), .Q(d_ff3_sh_x_out[48]) );
  DFFRXLTS d_ff4_Xn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Xn_net3815959), .RN(n828), .Q(d_ff_Xn[49]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_49_ ( .D(first_mux_X[49]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n427), .Q(d_ff2_X[49]) );
  DFFRXLTS reg_shift_x_Q_reg_49_ ( .D(d_ff2_X[49]), .CK(reg_shift_y_net3815959), .RN(n846), .Q(d_ff3_sh_x_out[49]) );
  DFFRXLTS d_ff4_Xn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Xn_net3815959), .RN(n787), .Q(d_ff_Xn[50]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_50_ ( .D(first_mux_X[50]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n787), .Q(d_ff2_X[50]) );
  DFFRXLTS reg_shift_x_Q_reg_50_ ( .D(d_ff2_X[50]), .CK(reg_shift_y_net3815959), .RN(n827), .Q(d_ff3_sh_x_out[50]) );
  DFFRXLTS d_ff4_Xn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Xn_net3815959), .RN(n840), .Q(d_ff_Xn[51]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_51_ ( .D(first_mux_X[51]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n801), .Q(d_ff2_X[51]) );
  DFFRXLTS reg_shift_x_Q_reg_51_ ( .D(d_ff2_X[51]), .CK(reg_shift_y_net3815959), .RN(n801), .Q(d_ff3_sh_x_out[51]) );
  DFFRXLTS d_ff4_Xn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Xn_net3815959), .RN(n441), .Q(d_ff_Xn[52]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_52_ ( .D(first_mux_X[52]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n801), .Q(d_ff2_X[52]), .QN(n458)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Xn_net3815959), .RN(n440), .Q(d_ff_Xn[53]) );
  DFFRXLTS d_ff4_Xn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Xn_net3815959), .RN(n801), .Q(d_ff_Xn[54]) );
  DFFRXLTS d_ff4_Xn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Xn_net3815959), .RN(n787), .Q(d_ff_Xn[55]) );
  DFFRXLTS d_ff4_Xn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Xn_net3815959), .RN(n441), .Q(d_ff_Xn[56]) );
  DFFRXLTS d_ff4_Xn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Xn_net3815959), .RN(n849), .Q(d_ff_Xn[57]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_57_ ( .D(first_mux_X[57]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n825), .Q(d_ff2_X[57]), .QN(n783)
         );
  DFFRXLTS d_ff4_Xn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Xn_net3815959), .RN(n801), .Q(d_ff_Xn[58]) );
  DFFRXLTS d_ff4_Xn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Xn_net3815959), .RN(n826), .Q(d_ff_Xn[59]) );
  DFFRXLTS d_ff4_Xn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Xn_net3815959), .RN(n801), .Q(d_ff_Xn[60]) );
  DFFRXLTS d_ff4_Xn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Xn_net3815959), .RN(n441), .Q(d_ff_Xn[61]) );
  DFFRXLTS d_ff4_Xn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Xn_net3815959), .RN(n801), .Q(d_ff_Xn[62]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_62_ ( .D(first_mux_X[62]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n440), .Q(d_ff2_X[62]) );
  DFFRXLTS d_ff4_Xn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Xn_net3815959), .RN(n440), .Q(d_ff_Xn[63]) );
  DFFRXLTS reg_val_muxX_2stage_Q_reg_63_ ( .D(first_mux_X[63]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n787), .Q(d_ff2_X[63]) );
  DFFRXLTS reg_shift_x_Q_reg_63_ ( .D(d_ff2_X[63]), .CK(reg_shift_y_net3815959), .RN(n805), .Q(d_ff3_sh_x_out[63]) );
  DFFRXLTS d_ff4_Yn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Yn_net3815959), .RN(n804), .Q(d_ff_Yn[0]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_0_ ( .D(first_mux_Y[0]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n803), .Q(d_ff2_Y[0]) );
  DFFRXLTS reg_shift_y_Q_reg_0_ ( .D(d_ff2_Y[0]), .CK(reg_shift_y_net3815959), 
        .RN(n822), .Q(d_ff3_sh_y_out[0]) );
  DFFRXLTS d_ff4_Yn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Yn_net3815959), .RN(n823), .Q(d_ff_Yn[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_1_ ( .D(first_mux_Y[1]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n824), .Q(d_ff2_Y[1]) );
  DFFRXLTS reg_shift_y_Q_reg_1_ ( .D(d_ff2_Y[1]), .CK(reg_shift_y_net3815959), 
        .RN(n806), .Q(d_ff3_sh_y_out[1]) );
  DFFRXLTS d_ff4_Yn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Yn_net3815959), .RN(n805), .Q(d_ff_Yn[2]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_2_ ( .D(first_mux_Y[2]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n804), .Q(d_ff2_Y[2]) );
  DFFRXLTS reg_shift_y_Q_reg_2_ ( .D(d_ff2_Y[2]), .CK(reg_shift_y_net3815959), 
        .RN(n803), .Q(d_ff3_sh_y_out[2]) );
  DFFRXLTS d_ff4_Yn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Yn_net3815959), .RN(n822), .Q(d_ff_Yn[3]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_3_ ( .D(first_mux_Y[3]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n823), .Q(d_ff2_Y[3]) );
  DFFRXLTS reg_shift_y_Q_reg_3_ ( .D(d_ff2_Y[3]), .CK(reg_shift_y_net3815959), 
        .RN(n824), .Q(d_ff3_sh_y_out[3]) );
  DFFRXLTS d_ff4_Yn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Yn_net3815959), .RN(n806), .Q(d_ff_Yn[4]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_4_ ( .D(first_mux_Y[4]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n805), .Q(d_ff2_Y[4]) );
  DFFRXLTS reg_shift_y_Q_reg_4_ ( .D(d_ff2_Y[4]), .CK(reg_shift_y_net3815959), 
        .RN(n804), .Q(d_ff3_sh_y_out[4]) );
  DFFRXLTS d_ff4_Yn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Yn_net3815959), .RN(n803), .Q(d_ff_Yn[5]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_5_ ( .D(first_mux_Y[5]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n822), .Q(d_ff2_Y[5]) );
  DFFRXLTS reg_shift_y_Q_reg_5_ ( .D(d_ff2_Y[5]), .CK(reg_shift_y_net3815959), 
        .RN(n823), .Q(d_ff3_sh_y_out[5]) );
  DFFRXLTS d_ff4_Yn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Yn_net3815959), .RN(n824), .Q(d_ff_Yn[6]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_6_ ( .D(first_mux_Y[6]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n806), .Q(d_ff2_Y[6]) );
  DFFRXLTS reg_shift_y_Q_reg_6_ ( .D(d_ff2_Y[6]), .CK(reg_shift_y_net3815959), 
        .RN(n805), .Q(d_ff3_sh_y_out[6]) );
  DFFRXLTS d_ff4_Yn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Yn_net3815959), .RN(n804), .Q(d_ff_Yn[7]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_7_ ( .D(first_mux_Y[7]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n803), .Q(d_ff2_Y[7]) );
  DFFRXLTS reg_shift_y_Q_reg_7_ ( .D(d_ff2_Y[7]), .CK(reg_shift_y_net3815959), 
        .RN(n822), .Q(d_ff3_sh_y_out[7]) );
  DFFRXLTS d_ff4_Yn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Yn_net3815959), .RN(n823), .Q(d_ff_Yn[8]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_8_ ( .D(first_mux_Y[8]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n824), .Q(d_ff2_Y[8]) );
  DFFRXLTS reg_shift_y_Q_reg_8_ ( .D(d_ff2_Y[8]), .CK(reg_shift_y_net3815959), 
        .RN(n806), .Q(d_ff3_sh_y_out[8]) );
  DFFRXLTS d_ff4_Yn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Yn_net3815959), .RN(n805), .Q(d_ff_Yn[9]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_9_ ( .D(first_mux_Y[9]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n804), .Q(d_ff2_Y[9]) );
  DFFRXLTS reg_shift_y_Q_reg_9_ ( .D(d_ff2_Y[9]), .CK(reg_shift_y_net3815959), 
        .RN(n821), .Q(d_ff3_sh_y_out[9]) );
  DFFRXLTS d_ff4_Yn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Yn_net3815959), .RN(n821), .Q(d_ff_Yn[10]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_10_ ( .D(first_mux_Y[10]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n821), .Q(d_ff2_Y[10]) );
  DFFRXLTS reg_shift_y_Q_reg_10_ ( .D(d_ff2_Y[10]), .CK(reg_shift_y_net3815959), .RN(n821), .Q(d_ff3_sh_y_out[10]) );
  DFFRXLTS d_ff4_Yn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Yn_net3815959), .RN(n821), .Q(d_ff_Yn[11]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_11_ ( .D(first_mux_Y[11]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n821), .Q(d_ff2_Y[11]) );
  DFFRXLTS reg_shift_y_Q_reg_11_ ( .D(d_ff2_Y[11]), .CK(reg_shift_y_net3815959), .RN(n821), .Q(d_ff3_sh_y_out[11]) );
  DFFRXLTS d_ff4_Yn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Yn_net3815959), .RN(n821), .Q(d_ff_Yn[12]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_12_ ( .D(first_mux_Y[12]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n821), .Q(d_ff2_Y[12]) );
  DFFRXLTS reg_shift_y_Q_reg_12_ ( .D(d_ff2_Y[12]), .CK(reg_shift_y_net3815959), .RN(n821), .Q(d_ff3_sh_y_out[12]) );
  DFFRXLTS d_ff4_Yn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Yn_net3815959), .RN(n812), .Q(d_ff_Yn[13]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_13_ ( .D(first_mux_Y[13]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n820), .Q(d_ff2_Y[13]) );
  DFFRXLTS reg_shift_y_Q_reg_13_ ( .D(d_ff2_Y[13]), .CK(reg_shift_y_net3815959), .RN(n811), .Q(d_ff3_sh_y_out[13]) );
  DFFRXLTS d_ff4_Yn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Yn_net3815959), .RN(n812), .Q(d_ff_Yn[14]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_14_ ( .D(first_mux_Y[14]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n820), .Q(d_ff2_Y[14]) );
  DFFRXLTS reg_shift_y_Q_reg_14_ ( .D(d_ff2_Y[14]), .CK(reg_shift_y_net3815959), .RN(n811), .Q(d_ff3_sh_y_out[14]) );
  DFFRXLTS d_ff4_Yn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Yn_net3815959), .RN(n812), .Q(d_ff_Yn[15]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_15_ ( .D(first_mux_Y[15]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n820), .Q(d_ff2_Y[15]) );
  DFFRXLTS reg_shift_y_Q_reg_15_ ( .D(d_ff2_Y[15]), .CK(reg_shift_y_net3815959), .RN(n811), .Q(d_ff3_sh_y_out[15]) );
  DFFRXLTS d_ff4_Yn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Yn_net3815959), .RN(n812), .Q(d_ff_Yn[16]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_16_ ( .D(first_mux_Y[16]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n817), .Q(d_ff2_Y[16]) );
  DFFRXLTS reg_shift_y_Q_reg_16_ ( .D(d_ff2_Y[16]), .CK(reg_shift_y_net3815959), .RN(n818), .Q(d_ff3_sh_y_out[16]) );
  DFFRXLTS d_ff4_Yn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Yn_net3815959), .RN(n819), .Q(d_ff_Yn[17]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_17_ ( .D(first_mux_Y[17]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n800), .Q(d_ff2_Y[17]) );
  DFFRXLTS reg_shift_y_Q_reg_17_ ( .D(d_ff2_Y[17]), .CK(reg_shift_y_net3815959), .RN(n799), .Q(d_ff3_sh_y_out[17]) );
  DFFRXLTS d_ff4_Yn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Yn_net3815959), .RN(n798), .Q(d_ff_Yn[18]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_18_ ( .D(first_mux_Y[18]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n816), .Q(d_ff2_Y[18]) );
  DFFRXLTS reg_shift_y_Q_reg_18_ ( .D(d_ff2_Y[18]), .CK(reg_shift_y_net3815959), .RN(n817), .Q(d_ff3_sh_y_out[18]) );
  DFFRXLTS d_ff4_Yn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Yn_net3815959), .RN(n818), .Q(d_ff_Yn[19]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_19_ ( .D(first_mux_Y[19]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n819), .Q(d_ff2_Y[19]) );
  DFFRXLTS reg_shift_y_Q_reg_19_ ( .D(d_ff2_Y[19]), .CK(reg_shift_y_net3815959), .RN(n800), .Q(d_ff3_sh_y_out[19]) );
  DFFRXLTS d_ff4_Yn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Yn_net3815959), .RN(n799), .Q(d_ff_Yn[20]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_20_ ( .D(first_mux_Y[20]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n798), .Q(d_ff2_Y[20]) );
  DFFRXLTS reg_shift_y_Q_reg_20_ ( .D(d_ff2_Y[20]), .CK(reg_shift_y_net3815959), .RN(n816), .Q(d_ff3_sh_y_out[20]) );
  DFFRXLTS d_ff4_Yn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Yn_net3815959), .RN(n817), .Q(d_ff_Yn[21]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_21_ ( .D(first_mux_Y[21]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n818), .Q(d_ff2_Y[21]) );
  DFFRXLTS reg_shift_y_Q_reg_21_ ( .D(d_ff2_Y[21]), .CK(reg_shift_y_net3815959), .RN(n819), .Q(d_ff3_sh_y_out[21]) );
  DFFRXLTS d_ff4_Yn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Yn_net3815959), .RN(n800), .Q(d_ff_Yn[22]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_22_ ( .D(first_mux_Y[22]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n799), .Q(d_ff2_Y[22]) );
  DFFRXLTS reg_shift_y_Q_reg_22_ ( .D(d_ff2_Y[22]), .CK(reg_shift_y_net3815959), .RN(n798), .Q(d_ff3_sh_y_out[22]) );
  DFFRXLTS d_ff4_Yn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Yn_net3815959), .RN(n816), .Q(d_ff_Yn[23]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_23_ ( .D(first_mux_Y[23]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n817), .Q(d_ff2_Y[23]) );
  DFFRXLTS reg_shift_y_Q_reg_23_ ( .D(d_ff2_Y[23]), .CK(reg_shift_y_net3815959), .RN(n818), .Q(d_ff3_sh_y_out[23]) );
  DFFRXLTS d_ff4_Yn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Yn_net3815959), .RN(n819), .Q(d_ff_Yn[24]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_24_ ( .D(first_mux_Y[24]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n800), .Q(d_ff2_Y[24]) );
  DFFRXLTS reg_shift_y_Q_reg_24_ ( .D(d_ff2_Y[24]), .CK(reg_shift_y_net3815959), .RN(n799), .Q(d_ff3_sh_y_out[24]) );
  DFFRXLTS d_ff4_Yn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Yn_net3815959), .RN(n798), .Q(d_ff_Yn[25]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_25_ ( .D(first_mux_Y[25]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n816), .Q(d_ff2_Y[25]) );
  DFFRXLTS reg_shift_y_Q_reg_25_ ( .D(d_ff2_Y[25]), .CK(reg_shift_y_net3815959), .RN(n817), .Q(d_ff3_sh_y_out[25]) );
  DFFRXLTS d_ff4_Yn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Yn_net3815959), .RN(n818), .Q(d_ff_Yn[26]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_26_ ( .D(first_mux_Y[26]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n819), .Q(d_ff2_Y[26]) );
  DFFRXLTS reg_shift_y_Q_reg_26_ ( .D(d_ff2_Y[26]), .CK(reg_shift_y_net3815959), .RN(n800), .Q(d_ff3_sh_y_out[26]) );
  DFFRXLTS d_ff4_Yn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Yn_net3815959), .RN(n799), .Q(d_ff_Yn[27]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_27_ ( .D(first_mux_Y[27]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n798), .Q(d_ff2_Y[27]) );
  DFFRXLTS reg_shift_y_Q_reg_27_ ( .D(d_ff2_Y[27]), .CK(reg_shift_y_net3815959), .RN(n816), .Q(d_ff3_sh_y_out[27]) );
  DFFRXLTS d_ff4_Yn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Yn_net3815959), .RN(n817), .Q(d_ff_Yn[28]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_28_ ( .D(first_mux_Y[28]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n818), .Q(d_ff2_Y[28]) );
  DFFRXLTS reg_shift_y_Q_reg_28_ ( .D(d_ff2_Y[28]), .CK(reg_shift_y_net3815959), .RN(n819), .Q(d_ff3_sh_y_out[28]) );
  DFFRXLTS d_ff4_Yn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Yn_net3815959), .RN(n800), .Q(d_ff_Yn[29]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_29_ ( .D(first_mux_Y[29]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n799), .Q(d_ff2_Y[29]) );
  DFFRXLTS reg_shift_y_Q_reg_29_ ( .D(d_ff2_Y[29]), .CK(reg_shift_y_net3815959), .RN(n796), .Q(d_ff3_sh_y_out[29]) );
  DFFRXLTS d_ff4_Yn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Yn_net3815959), .RN(n795), .Q(d_ff_Yn[30]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_30_ ( .D(first_mux_Y[30]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n794), .Q(d_ff2_Y[30]) );
  DFFRXLTS reg_shift_y_Q_reg_30_ ( .D(d_ff2_Y[30]), .CK(reg_shift_y_net3815959), .RN(n813), .Q(d_ff3_sh_y_out[30]) );
  DFFRXLTS d_ff4_Yn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Yn_net3815959), .RN(n814), .Q(d_ff_Yn[31]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_31_ ( .D(first_mux_Y[31]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n815), .Q(d_ff2_Y[31]) );
  DFFRXLTS reg_shift_y_Q_reg_31_ ( .D(d_ff2_Y[31]), .CK(reg_shift_y_net3815959), .RN(n797), .Q(d_ff3_sh_y_out[31]) );
  DFFRXLTS d_ff4_Yn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Yn_net3815959), .RN(n796), .Q(d_ff_Yn[32]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_32_ ( .D(first_mux_Y[32]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n795), .Q(d_ff2_Y[32]) );
  DFFRXLTS reg_shift_y_Q_reg_32_ ( .D(d_ff2_Y[32]), .CK(reg_shift_y_net3815959), .RN(n794), .Q(d_ff3_sh_y_out[32]) );
  DFFRXLTS d_ff4_Yn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Yn_net3815959), .RN(n813), .Q(d_ff_Yn[33]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_33_ ( .D(first_mux_Y[33]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n814), .Q(d_ff2_Y[33]) );
  DFFRXLTS reg_shift_y_Q_reg_33_ ( .D(d_ff2_Y[33]), .CK(reg_shift_y_net3815959), .RN(n815), .Q(d_ff3_sh_y_out[33]) );
  DFFRXLTS d_ff4_Yn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Yn_net3815959), .RN(n797), .Q(d_ff_Yn[34]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_34_ ( .D(first_mux_Y[34]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n796), .Q(d_ff2_Y[34]) );
  DFFRXLTS reg_shift_y_Q_reg_34_ ( .D(d_ff2_Y[34]), .CK(reg_shift_y_net3815959), .RN(n795), .Q(d_ff3_sh_y_out[34]) );
  DFFRXLTS d_ff4_Yn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Yn_net3815959), .RN(n794), .Q(d_ff_Yn[35]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_35_ ( .D(first_mux_Y[35]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n813), .Q(d_ff2_Y[35]) );
  DFFRXLTS reg_shift_y_Q_reg_35_ ( .D(d_ff2_Y[35]), .CK(reg_shift_y_net3815959), .RN(n814), .Q(d_ff3_sh_y_out[35]) );
  DFFRXLTS d_ff4_Yn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Yn_net3815959), .RN(n815), .Q(d_ff_Yn[36]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_36_ ( .D(first_mux_Y[36]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n797), .Q(d_ff2_Y[36]) );
  DFFRXLTS reg_shift_y_Q_reg_36_ ( .D(d_ff2_Y[36]), .CK(reg_shift_y_net3815959), .RN(n796), .Q(d_ff3_sh_y_out[36]) );
  DFFRXLTS d_ff4_Yn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Yn_net3815959), .RN(n795), .Q(d_ff_Yn[37]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_37_ ( .D(first_mux_Y[37]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n794), .Q(d_ff2_Y[37]) );
  DFFRXLTS reg_shift_y_Q_reg_37_ ( .D(d_ff2_Y[37]), .CK(reg_shift_y_net3815959), .RN(n813), .Q(d_ff3_sh_y_out[37]) );
  DFFRXLTS d_ff4_Yn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Yn_net3815959), .RN(n814), .Q(d_ff_Yn[38]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_38_ ( .D(first_mux_Y[38]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n815), .Q(d_ff2_Y[38]) );
  DFFRXLTS reg_shift_y_Q_reg_38_ ( .D(d_ff2_Y[38]), .CK(reg_shift_y_net3815959), .RN(n797), .Q(d_ff3_sh_y_out[38]) );
  DFFRXLTS d_ff4_Yn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Yn_net3815959), .RN(n796), .Q(d_ff_Yn[39]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_39_ ( .D(first_mux_Y[39]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n795), .Q(d_ff2_Y[39]) );
  DFFRXLTS reg_shift_y_Q_reg_39_ ( .D(d_ff2_Y[39]), .CK(reg_shift_y_net3815959), .RN(n811), .Q(d_ff3_sh_y_out[39]) );
  DFFRXLTS d_ff4_Yn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Yn_net3815959), .RN(n812), .Q(d_ff_Yn[40]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_40_ ( .D(first_mux_Y[40]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n820), .Q(d_ff2_Y[40]) );
  DFFRXLTS reg_shift_y_Q_reg_40_ ( .D(d_ff2_Y[40]), .CK(reg_shift_y_net3815959), .RN(n811), .Q(d_ff3_sh_y_out[40]) );
  DFFRXLTS d_ff4_Yn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Yn_net3815959), .RN(n812), .Q(d_ff_Yn[41]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_41_ ( .D(first_mux_Y[41]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n820), .Q(d_ff2_Y[41]) );
  DFFRXLTS reg_shift_y_Q_reg_41_ ( .D(d_ff2_Y[41]), .CK(reg_shift_y_net3815959), .RN(n811), .Q(d_ff3_sh_y_out[41]) );
  DFFRXLTS d_ff4_Yn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Yn_net3815959), .RN(n812), .Q(d_ff_Yn[42]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_42_ ( .D(first_mux_Y[42]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n820), .Q(d_ff2_Y[42]) );
  DFFRXLTS reg_shift_y_Q_reg_42_ ( .D(d_ff2_Y[42]), .CK(reg_shift_y_net3815959), .RN(n811), .Q(d_ff3_sh_y_out[42]) );
  DFFRXLTS d_ff4_Yn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Yn_net3815959), .RN(n811), .Q(d_ff_Yn[43]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_43_ ( .D(first_mux_Y[43]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n812), .Q(d_ff2_Y[43]) );
  DFFRXLTS reg_shift_y_Q_reg_43_ ( .D(d_ff2_Y[43]), .CK(reg_shift_y_net3815959), .RN(n820), .Q(d_ff3_sh_y_out[43]) );
  DFFRXLTS d_ff4_Yn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Yn_net3815959), .RN(n820), .Q(d_ff_Yn[44]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_44_ ( .D(first_mux_Y[44]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n811), .Q(d_ff2_Y[44]) );
  DFFRXLTS reg_shift_y_Q_reg_44_ ( .D(d_ff2_Y[44]), .CK(reg_shift_y_net3815959), .RN(n812), .Q(d_ff3_sh_y_out[44]) );
  DFFRXLTS d_ff4_Yn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Yn_net3815959), .RN(n820), .Q(d_ff_Yn[45]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_45_ ( .D(first_mux_Y[45]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n811), .Q(d_ff2_Y[45]) );
  DFFRXLTS reg_shift_y_Q_reg_45_ ( .D(d_ff2_Y[45]), .CK(reg_shift_y_net3815959), .RN(n812), .Q(d_ff3_sh_y_out[45]) );
  DFFRXLTS d_ff4_Yn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Yn_net3815959), .RN(n820), .Q(d_ff_Yn[46]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_46_ ( .D(first_mux_Y[46]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n791), .Q(d_ff2_Y[46]) );
  DFFRXLTS reg_shift_y_Q_reg_46_ ( .D(d_ff2_Y[46]), .CK(reg_shift_y_net3815959), .RN(n792), .Q(d_ff3_sh_y_out[46]) );
  DFFRXLTS d_ff4_Yn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Yn_net3815959), .RN(n810), .Q(d_ff_Yn[47]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_47_ ( .D(first_mux_Y[47]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n808), .Q(d_ff2_Y[47]) );
  DFFRXLTS reg_shift_y_Q_reg_47_ ( .D(d_ff2_Y[47]), .CK(reg_shift_y_net3815959), .RN(n807), .Q(d_ff3_sh_y_out[47]) );
  DFFRXLTS d_ff4_Yn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Yn_net3815959), .RN(n809), .Q(d_ff_Yn[48]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_48_ ( .D(first_mux_Y[48]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n790), .Q(d_ff2_Y[48]) );
  DFFRXLTS reg_shift_y_Q_reg_48_ ( .D(d_ff2_Y[48]), .CK(reg_shift_y_net3815959), .RN(n791), .Q(d_ff3_sh_y_out[48]) );
  DFFRXLTS d_ff4_Yn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Yn_net3815959), .RN(n792), .Q(d_ff_Yn[49]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_49_ ( .D(first_mux_Y[49]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n810), .Q(d_ff2_Y[49]) );
  DFFRXLTS reg_shift_y_Q_reg_49_ ( .D(d_ff2_Y[49]), .CK(reg_shift_y_net3815959), .RN(n808), .Q(d_ff3_sh_y_out[49]) );
  DFFRXLTS d_ff4_Yn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Yn_net3815959), .RN(n809), .Q(d_ff_Yn[50]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_50_ ( .D(first_mux_Y[50]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n807), .Q(d_ff2_Y[50]) );
  DFFRXLTS reg_shift_y_Q_reg_50_ ( .D(d_ff2_Y[50]), .CK(reg_shift_y_net3815959), .RN(n790), .Q(d_ff3_sh_y_out[50]) );
  DFFRXLTS d_ff4_Yn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Yn_net3815959), .RN(n791), .Q(d_ff_Yn[51]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_51_ ( .D(first_mux_Y[51]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n792), .Q(d_ff2_Y[51]) );
  DFFRXLTS reg_shift_y_Q_reg_51_ ( .D(d_ff2_Y[51]), .CK(reg_shift_y_net3815959), .RN(n810), .Q(d_ff3_sh_y_out[51]) );
  DFFRXLTS d_ff4_Yn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Yn_net3815959), .RN(n808), .Q(d_ff_Yn[52]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_52_ ( .D(first_mux_Y[52]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n807), .Q(d_ff2_Y[52]), .QN(n459)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Yn_net3815959), .RN(n809), .Q(d_ff_Yn[53]) );
  DFFRXLTS d_ff4_Yn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Yn_net3815959), .RN(n791), .Q(d_ff_Yn[54]) );
  DFFRXLTS d_ff4_Yn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Yn_net3815959), .RN(n792), .Q(d_ff_Yn[55]) );
  DFFRXLTS d_ff4_Yn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Yn_net3815959), .RN(n790), .Q(d_ff_Yn[56]) );
  DFFRXLTS d_ff4_Yn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Yn_net3815959), .RN(n791), .Q(d_ff_Yn[57]) );
  DFFRXLTS d_ff4_Yn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Yn_net3815959), .RN(n792), .Q(d_ff_Yn[58]) );
  DFFRXLTS d_ff4_Yn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Yn_net3815959), .RN(n808), .Q(d_ff_Yn[59]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_59_ ( .D(first_mux_Y[59]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n807), .Q(d_ff2_Y[59]), .QN(n460)
         );
  DFFRXLTS d_ff4_Yn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Yn_net3815959), .RN(n809), .Q(d_ff_Yn[60]) );
  DFFRXLTS d_ff4_Yn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Yn_net3815959), .RN(n790), .Q(d_ff_Yn[61]) );
  DFFRXLTS d_ff4_Yn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Yn_net3815959), .RN(n791), .Q(d_ff_Yn[62]) );
  DFFRXLTS d_ff4_Yn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Yn_net3815959), .RN(n810), .Q(d_ff_Yn[63]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_63_ ( .D(first_mux_Y[63]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n823), .Q(d_ff2_Y[63]) );
  DFFRXLTS reg_shift_y_Q_reg_63_ ( .D(d_ff2_Y[63]), .CK(reg_shift_y_net3815959), .RN(n824), .Q(d_ff3_sh_y_out[63]) );
  DFFRXLTS d_ff4_Zn_Q_reg_0_ ( .D(result_add_subt[0]), .CK(d_ff4_Zn_net3815959), .RN(n806), .Q(d_ff_Zn[0]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(first_mux_Z[0]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n805), .Q(d_ff2_Z[0]) );
  DFFRXLTS d_ff4_Zn_Q_reg_1_ ( .D(result_add_subt[1]), .CK(d_ff4_Zn_net3815959), .RN(n804), .Q(d_ff_Zn[1]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_1_ ( .D(first_mux_Z[1]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n803), .Q(d_ff2_Z[1]) );
  DFFRXLTS d_ff4_Zn_Q_reg_2_ ( .D(result_add_subt[2]), .CK(d_ff4_Zn_net3815959), .RN(n822), .Q(d_ff_Zn[2]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_2_ ( .D(first_mux_Z[2]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n823), .Q(d_ff2_Z[2]) );
  DFFRXLTS d_ff4_Zn_Q_reg_3_ ( .D(result_add_subt[3]), .CK(d_ff4_Zn_net3815959), .RN(n824), .Q(d_ff_Zn[3]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_3_ ( .D(first_mux_Z[3]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n806), .Q(d_ff2_Z[3]) );
  DFFRXLTS d_ff4_Zn_Q_reg_4_ ( .D(result_add_subt[4]), .CK(d_ff4_Zn_net3815959), .RN(n804), .Q(d_ff_Zn[4]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_4_ ( .D(first_mux_Z[4]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n803), .Q(d_ff2_Z[4]) );
  DFFRXLTS d_ff4_Zn_Q_reg_5_ ( .D(result_add_subt[5]), .CK(d_ff4_Zn_net3815959), .RN(n822), .Q(d_ff_Zn[5]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(first_mux_Z[5]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n823), .Q(d_ff2_Z[5]) );
  DFFRXLTS d_ff4_Zn_Q_reg_6_ ( .D(result_add_subt[6]), .CK(d_ff4_Zn_net3815959), .RN(n824), .Q(d_ff_Zn[6]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(first_mux_Z[6]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n806), .Q(d_ff2_Z[6]) );
  DFFRXLTS d_ff4_Zn_Q_reg_7_ ( .D(result_add_subt[7]), .CK(d_ff4_Zn_net3815959), .RN(n805), .Q(d_ff_Zn[7]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_7_ ( .D(first_mux_Z[7]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n804), .Q(d_ff2_Z[7]) );
  DFFRXLTS d_ff4_Zn_Q_reg_8_ ( .D(result_add_subt[8]), .CK(d_ff4_Zn_net3815959), .RN(n803), .Q(d_ff_Zn[8]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(first_mux_Z[8]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n822), .Q(d_ff2_Z[8]) );
  DFFRXLTS d_ff4_Zn_Q_reg_9_ ( .D(result_add_subt[9]), .CK(d_ff4_Zn_net3815959), .RN(n824), .Q(d_ff_Zn[9]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_9_ ( .D(first_mux_Z[9]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n806), .Q(d_ff2_Z[9]) );
  DFFRXLTS d_ff4_Zn_Q_reg_10_ ( .D(result_add_subt[10]), .CK(
        d_ff4_Zn_net3815959), .RN(n805), .Q(d_ff_Zn[10]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_10_ ( .D(first_mux_Z[10]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n804), .Q(d_ff2_Z[10]) );
  DFFRXLTS d_ff4_Zn_Q_reg_11_ ( .D(result_add_subt[11]), .CK(
        d_ff4_Zn_net3815959), .RN(n803), .Q(d_ff_Zn[11]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_11_ ( .D(first_mux_Z[11]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n822), .Q(d_ff2_Z[11]) );
  DFFRXLTS d_ff4_Zn_Q_reg_12_ ( .D(result_add_subt[12]), .CK(
        d_ff4_Zn_net3815959), .RN(n823), .Q(d_ff_Zn[12]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_12_ ( .D(first_mux_Z[12]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n824), .Q(d_ff2_Z[12]) );
  DFFRXLTS d_ff4_Zn_Q_reg_13_ ( .D(result_add_subt[13]), .CK(
        d_ff4_Zn_net3815959), .RN(n806), .Q(d_ff_Zn[13]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_13_ ( .D(first_mux_Z[13]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n805), .Q(d_ff2_Z[13]) );
  DFFRXLTS d_ff4_Zn_Q_reg_14_ ( .D(result_add_subt[14]), .CK(
        d_ff4_Zn_net3815959), .RN(n803), .Q(d_ff_Zn[14]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_14_ ( .D(first_mux_Z[14]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n822), .Q(d_ff2_Z[14]) );
  DFFRXLTS d_ff4_Zn_Q_reg_15_ ( .D(result_add_subt[15]), .CK(
        d_ff4_Zn_net3815959), .RN(n823), .Q(d_ff_Zn[15]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_15_ ( .D(first_mux_Z[15]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n824), .Q(d_ff2_Z[15]) );
  DFFRXLTS d_ff4_Zn_Q_reg_16_ ( .D(result_add_subt[16]), .CK(
        d_ff4_Zn_net3815959), .RN(n806), .Q(d_ff_Zn[16]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_16_ ( .D(first_mux_Z[16]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n805), .Q(d_ff2_Z[16]) );
  DFFRXLTS d_ff4_Zn_Q_reg_17_ ( .D(result_add_subt[17]), .CK(
        d_ff4_Zn_net3815959), .RN(n804), .Q(d_ff_Zn[17]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_17_ ( .D(first_mux_Z[17]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n803), .Q(d_ff2_Z[17]) );
  DFFRXLTS d_ff4_Zn_Q_reg_18_ ( .D(result_add_subt[18]), .CK(
        d_ff4_Zn_net3815959), .RN(n822), .Q(d_ff_Zn[18]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_18_ ( .D(first_mux_Z[18]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n823), .Q(d_ff2_Z[18]) );
  DFFRXLTS d_ff4_Zn_Q_reg_19_ ( .D(result_add_subt[19]), .CK(
        d_ff4_Zn_net3815959), .RN(n853), .Q(d_ff_Zn[19]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(first_mux_Z[19]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n853), .Q(d_ff2_Z[19]) );
  DFFRXLTS d_ff4_Zn_Q_reg_20_ ( .D(result_add_subt[20]), .CK(
        d_ff4_Zn_net3815959), .RN(n853), .Q(d_ff_Zn[20]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(first_mux_Z[20]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n853), .Q(d_ff2_Z[20]) );
  DFFRXLTS d_ff4_Zn_Q_reg_21_ ( .D(result_add_subt[21]), .CK(
        d_ff4_Zn_net3815959), .RN(n853), .Q(d_ff_Zn[21]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_21_ ( .D(first_mux_Z[21]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n853), .Q(d_ff2_Z[21]) );
  DFFRXLTS d_ff4_Zn_Q_reg_22_ ( .D(result_add_subt[22]), .CK(
        d_ff4_Zn_net3815959), .RN(n851), .Q(d_ff_Zn[22]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(first_mux_Z[22]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n789), .Q(d_ff2_Z[22]) );
  DFFRXLTS d_ff4_Zn_Q_reg_23_ ( .D(result_add_subt[23]), .CK(
        d_ff4_Zn_net3815959), .RN(n788), .Q(d_ff_Zn[23]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_23_ ( .D(first_mux_Z[23]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n802), .Q(d_ff2_Z[23]) );
  DFFRXLTS d_ff4_Zn_Q_reg_24_ ( .D(result_add_subt[24]), .CK(
        d_ff4_Zn_net3815959), .RN(n837), .Q(d_ff_Zn[24]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_24_ ( .D(first_mux_Z[24]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n441), .Q(d_ff2_Z[24]) );
  DFFRXLTS d_ff4_Zn_Q_reg_25_ ( .D(result_add_subt[25]), .CK(
        d_ff4_Zn_net3815959), .RN(n441), .Q(d_ff_Zn[25]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_25_ ( .D(first_mux_Z[25]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n837), .Q(d_ff2_Z[25]) );
  DFFRXLTS d_ff4_Zn_Q_reg_26_ ( .D(result_add_subt[26]), .CK(
        d_ff4_Zn_net3815959), .RN(n825), .Q(d_ff_Zn[26]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_26_ ( .D(first_mux_Z[26]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n840), .Q(d_ff2_Z[26]) );
  DFFRXLTS d_ff4_Zn_Q_reg_27_ ( .D(result_add_subt[27]), .CK(
        d_ff4_Zn_net3815959), .RN(n787), .Q(d_ff_Zn[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_27_ ( .D(first_mux_Z[27]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n787), .Q(d_ff2_Z[27]) );
  DFFRXLTS d_ff4_Zn_Q_reg_28_ ( .D(result_add_subt[28]), .CK(
        d_ff4_Zn_net3815959), .RN(n825), .Q(d_ff_Zn[28]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(first_mux_Z[28]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n826), .Q(d_ff2_Z[28]) );
  DFFRXLTS d_ff4_Zn_Q_reg_29_ ( .D(result_add_subt[29]), .CK(
        d_ff4_Zn_net3815959), .RN(n799), .Q(d_ff_Zn[29]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_29_ ( .D(first_mux_Z[29]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n798), .Q(d_ff2_Z[29]) );
  DFFRXLTS d_ff4_Zn_Q_reg_30_ ( .D(result_add_subt[30]), .CK(
        d_ff4_Zn_net3815959), .RN(n816), .Q(d_ff_Zn[30]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_30_ ( .D(first_mux_Z[30]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n817), .Q(d_ff2_Z[30]) );
  DFFRXLTS d_ff4_Zn_Q_reg_31_ ( .D(result_add_subt[31]), .CK(
        d_ff4_Zn_net3815959), .RN(n818), .Q(d_ff_Zn[31]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_31_ ( .D(first_mux_Z[31]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n819), .Q(d_ff2_Z[31]) );
  DFFRXLTS d_ff4_Zn_Q_reg_32_ ( .D(result_add_subt[32]), .CK(
        d_ff4_Zn_net3815959), .RN(n800), .Q(d_ff_Zn[32]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_32_ ( .D(first_mux_Z[32]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n799), .Q(d_ff2_Z[32]) );
  DFFRXLTS d_ff4_Zn_Q_reg_33_ ( .D(result_add_subt[33]), .CK(
        d_ff4_Zn_net3815959), .RN(n798), .Q(d_ff_Zn[33]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_33_ ( .D(first_mux_Z[33]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n816), .Q(d_ff2_Z[33]) );
  DFFRXLTS d_ff4_Zn_Q_reg_34_ ( .D(result_add_subt[34]), .CK(
        d_ff4_Zn_net3815959), .RN(n818), .Q(d_ff_Zn[34]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_34_ ( .D(first_mux_Z[34]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n819), .Q(d_ff2_Z[34]) );
  DFFRXLTS d_ff4_Zn_Q_reg_35_ ( .D(result_add_subt[35]), .CK(
        d_ff4_Zn_net3815959), .RN(n800), .Q(d_ff_Zn[35]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_35_ ( .D(first_mux_Z[35]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n799), .Q(d_ff2_Z[35]) );
  DFFRXLTS d_ff4_Zn_Q_reg_36_ ( .D(result_add_subt[36]), .CK(
        d_ff4_Zn_net3815959), .RN(n798), .Q(d_ff_Zn[36]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_36_ ( .D(first_mux_Z[36]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n816), .Q(d_ff2_Z[36]) );
  DFFRXLTS d_ff4_Zn_Q_reg_37_ ( .D(result_add_subt[37]), .CK(
        d_ff4_Zn_net3815959), .RN(n817), .Q(d_ff_Zn[37]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_37_ ( .D(first_mux_Z[37]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n818), .Q(d_ff2_Z[37]) );
  DFFRXLTS d_ff4_Zn_Q_reg_38_ ( .D(result_add_subt[38]), .CK(
        d_ff4_Zn_net3815959), .RN(n819), .Q(d_ff_Zn[38]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_38_ ( .D(first_mux_Z[38]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n800), .Q(d_ff2_Z[38]) );
  DFFRXLTS d_ff4_Zn_Q_reg_39_ ( .D(result_add_subt[39]), .CK(
        d_ff4_Zn_net3815959), .RN(n798), .Q(d_ff_Zn[39]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_39_ ( .D(first_mux_Z[39]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n816), .Q(d_ff2_Z[39]) );
  DFFRXLTS d_ff4_Zn_Q_reg_40_ ( .D(result_add_subt[40]), .CK(
        d_ff4_Zn_net3815959), .RN(n817), .Q(d_ff_Zn[40]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_40_ ( .D(first_mux_Z[40]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n818), .Q(d_ff2_Z[40]) );
  DFFRXLTS d_ff4_Zn_Q_reg_41_ ( .D(result_add_subt[41]), .CK(
        d_ff4_Zn_net3815959), .RN(n819), .Q(d_ff_Zn[41]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_41_ ( .D(first_mux_Z[41]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n800), .Q(d_ff2_Z[41]) );
  DFFRXLTS d_ff4_Zn_Q_reg_42_ ( .D(result_add_subt[42]), .CK(
        d_ff4_Zn_net3815959), .RN(n799), .Q(d_ff_Zn[42]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_42_ ( .D(first_mux_Z[42]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n798), .Q(d_ff2_Z[42]) );
  DFFRXLTS d_ff4_Zn_Q_reg_43_ ( .D(result_add_subt[43]), .CK(
        d_ff4_Zn_net3815959), .RN(n816), .Q(d_ff_Zn[43]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_43_ ( .D(first_mux_Z[43]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n817), .Q(d_ff2_Z[43]) );
  DFFRXLTS d_ff4_Zn_Q_reg_44_ ( .D(result_add_subt[44]), .CK(
        d_ff4_Zn_net3815959), .RN(n814), .Q(d_ff_Zn[44]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_44_ ( .D(first_mux_Z[44]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n815), .Q(d_ff2_Z[44]) );
  DFFRXLTS d_ff4_Zn_Q_reg_45_ ( .D(result_add_subt[45]), .CK(
        d_ff4_Zn_net3815959), .RN(n797), .Q(d_ff_Zn[45]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_45_ ( .D(first_mux_Z[45]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n796), .Q(d_ff2_Z[45]) );
  DFFRXLTS d_ff4_Zn_Q_reg_46_ ( .D(result_add_subt[46]), .CK(
        d_ff4_Zn_net3815959), .RN(n795), .Q(d_ff_Zn[46]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_46_ ( .D(first_mux_Z[46]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n794), .Q(d_ff2_Z[46]) );
  DFFRXLTS d_ff4_Zn_Q_reg_47_ ( .D(result_add_subt[47]), .CK(
        d_ff4_Zn_net3815959), .RN(n813), .Q(d_ff_Zn[47]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_47_ ( .D(first_mux_Z[47]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n814), .Q(d_ff2_Z[47]) );
  DFFRXLTS d_ff4_Zn_Q_reg_48_ ( .D(result_add_subt[48]), .CK(
        d_ff4_Zn_net3815959), .RN(n815), .Q(d_ff_Zn[48]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_48_ ( .D(first_mux_Z[48]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n797), .Q(d_ff2_Z[48]) );
  DFFRXLTS d_ff4_Zn_Q_reg_49_ ( .D(result_add_subt[49]), .CK(
        d_ff4_Zn_net3815959), .RN(n795), .Q(d_ff_Zn[49]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_49_ ( .D(first_mux_Z[49]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n794), .Q(d_ff2_Z[49]) );
  DFFRXLTS d_ff4_Zn_Q_reg_50_ ( .D(result_add_subt[50]), .CK(
        d_ff4_Zn_net3815959), .RN(n813), .Q(d_ff_Zn[50]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_50_ ( .D(first_mux_Z[50]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n814), .Q(d_ff2_Z[50]) );
  DFFRXLTS d_ff4_Zn_Q_reg_51_ ( .D(result_add_subt[51]), .CK(
        d_ff4_Zn_net3815959), .RN(n815), .Q(d_ff_Zn[51]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_51_ ( .D(first_mux_Z[51]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n797), .Q(d_ff2_Z[51]) );
  DFFRXLTS d_ff4_Zn_Q_reg_52_ ( .D(result_add_subt[52]), .CK(
        d_ff4_Zn_net3815959), .RN(n796), .Q(d_ff_Zn[52]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_52_ ( .D(first_mux_Z[52]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n795), .Q(d_ff2_Z[52]) );
  DFFRXLTS d_ff4_Zn_Q_reg_53_ ( .D(result_add_subt[53]), .CK(
        d_ff4_Zn_net3815959), .RN(n794), .Q(d_ff_Zn[53]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_53_ ( .D(first_mux_Z[53]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n813), .Q(d_ff2_Z[53]) );
  DFFRXLTS d_ff4_Zn_Q_reg_54_ ( .D(result_add_subt[54]), .CK(
        d_ff4_Zn_net3815959), .RN(n815), .Q(d_ff_Zn[54]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_54_ ( .D(first_mux_Z[54]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n797), .Q(d_ff2_Z[54]) );
  DFFRXLTS d_ff4_Zn_Q_reg_55_ ( .D(result_add_subt[55]), .CK(
        d_ff4_Zn_net3815959), .RN(n796), .Q(d_ff_Zn[55]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_55_ ( .D(first_mux_Z[55]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n795), .Q(d_ff2_Z[55]) );
  DFFRXLTS d_ff4_Zn_Q_reg_56_ ( .D(result_add_subt[56]), .CK(
        d_ff4_Zn_net3815959), .RN(n794), .Q(d_ff_Zn[56]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_56_ ( .D(first_mux_Z[56]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n813), .Q(d_ff2_Z[56]) );
  DFFRXLTS d_ff4_Zn_Q_reg_57_ ( .D(result_add_subt[57]), .CK(
        d_ff4_Zn_net3815959), .RN(n814), .Q(d_ff_Zn[57]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_57_ ( .D(first_mux_Z[57]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n815), .Q(d_ff2_Z[57]) );
  DFFRXLTS d_ff4_Zn_Q_reg_58_ ( .D(result_add_subt[58]), .CK(
        d_ff4_Zn_net3815959), .RN(n797), .Q(d_ff_Zn[58]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_58_ ( .D(first_mux_Z[58]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n796), .Q(d_ff2_Z[58]) );
  DFFRXLTS d_ff4_Zn_Q_reg_59_ ( .D(result_add_subt[59]), .CK(
        d_ff4_Zn_net3815959), .RN(n794), .Q(d_ff_Zn[59]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_59_ ( .D(first_mux_Z[59]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n813), .Q(d_ff2_Z[59]) );
  DFFRXLTS d_ff4_Zn_Q_reg_60_ ( .D(result_add_subt[60]), .CK(
        d_ff4_Zn_net3815959), .RN(n814), .Q(d_ff_Zn[60]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_60_ ( .D(first_mux_Z[60]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n815), .Q(d_ff2_Z[60]) );
  DFFRXLTS d_ff4_Zn_Q_reg_61_ ( .D(result_add_subt[61]), .CK(
        d_ff4_Zn_net3815959), .RN(n797), .Q(d_ff_Zn[61]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_61_ ( .D(first_mux_Z[61]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n796), .Q(d_ff2_Z[61]) );
  DFFRXLTS d_ff4_Zn_Q_reg_62_ ( .D(result_add_subt[62]), .CK(
        d_ff4_Zn_net3815959), .RN(n795), .Q(d_ff_Zn[62]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_62_ ( .D(first_mux_Z[62]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n794), .Q(d_ff2_Z[62]) );
  DFFRXLTS d_ff4_Zn_Q_reg_63_ ( .D(result_add_subt[63]), .CK(
        d_ff4_Zn_net3815959), .RN(n813), .Q(d_ff_Zn[63]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_63_ ( .D(first_mux_Z[63]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n814), .Q(d_ff2_Z[63]) );
  DFFRXLTS d_ff5_Q_reg_0_ ( .D(mux_sal[0]), .CK(d_ff5_net3815959), .RN(n793), 
        .Q(sign_inv_out[0]) );
  DFFRXLTS d_ff5_Q_reg_1_ ( .D(mux_sal[1]), .CK(d_ff5_net3815959), .RN(n793), 
        .Q(sign_inv_out[1]) );
  DFFRXLTS d_ff5_Q_reg_2_ ( .D(mux_sal[2]), .CK(d_ff5_net3815959), .RN(n793), 
        .Q(sign_inv_out[2]) );
  DFFRXLTS d_ff5_Q_reg_3_ ( .D(mux_sal[3]), .CK(d_ff5_net3815959), .RN(n793), 
        .Q(sign_inv_out[3]) );
  DFFRXLTS d_ff5_Q_reg_4_ ( .D(mux_sal[4]), .CK(d_ff5_net3815959), .RN(n793), 
        .Q(sign_inv_out[4]) );
  DFFRXLTS d_ff5_Q_reg_5_ ( .D(mux_sal[5]), .CK(d_ff5_net3815959), .RN(n833), 
        .Q(sign_inv_out[5]) );
  DFFRXLTS d_ff5_Q_reg_6_ ( .D(mux_sal[6]), .CK(d_ff5_net3815959), .RN(n833), 
        .Q(sign_inv_out[6]) );
  DFFRXLTS d_ff5_Q_reg_7_ ( .D(mux_sal[7]), .CK(d_ff5_net3815959), .RN(n839), 
        .Q(sign_inv_out[7]) );
  DFFRXLTS d_ff5_Q_reg_8_ ( .D(mux_sal[8]), .CK(d_ff5_net3815959), .RN(n838), 
        .Q(sign_inv_out[8]) );
  DFFRXLTS d_ff5_Q_reg_9_ ( .D(mux_sal[9]), .CK(d_ff5_net3815959), .RN(n833), 
        .Q(sign_inv_out[9]) );
  DFFRXLTS d_ff5_Q_reg_10_ ( .D(mux_sal[10]), .CK(d_ff5_net3815959), .RN(n808), 
        .Q(sign_inv_out[10]) );
  DFFRXLTS d_ff5_Q_reg_11_ ( .D(mux_sal[11]), .CK(d_ff5_net3815959), .RN(n807), 
        .Q(sign_inv_out[11]) );
  DFFRXLTS d_ff5_Q_reg_12_ ( .D(mux_sal[12]), .CK(d_ff5_net3815959), .RN(n809), 
        .Q(sign_inv_out[12]) );
  DFFRXLTS d_ff5_Q_reg_13_ ( .D(mux_sal[13]), .CK(d_ff5_net3815959), .RN(n790), 
        .Q(sign_inv_out[13]) );
  DFFRXLTS d_ff5_Q_reg_14_ ( .D(mux_sal[14]), .CK(d_ff5_net3815959), .RN(n791), 
        .Q(sign_inv_out[14]) );
  DFFRXLTS d_ff5_Q_reg_15_ ( .D(mux_sal[15]), .CK(d_ff5_net3815959), .RN(n790), 
        .Q(sign_inv_out[15]) );
  DFFRXLTS d_ff5_Q_reg_16_ ( .D(mux_sal[16]), .CK(d_ff5_net3815959), .RN(n791), 
        .Q(sign_inv_out[16]) );
  DFFRXLTS d_ff5_Q_reg_17_ ( .D(mux_sal[17]), .CK(d_ff5_net3815959), .RN(n792), 
        .Q(sign_inv_out[17]) );
  DFFRXLTS d_ff5_Q_reg_18_ ( .D(mux_sal[18]), .CK(d_ff5_net3815959), .RN(n810), 
        .Q(sign_inv_out[18]) );
  DFFRXLTS d_ff5_Q_reg_19_ ( .D(mux_sal[19]), .CK(d_ff5_net3815959), .RN(n808), 
        .Q(sign_inv_out[19]) );
  DFFRXLTS d_ff5_Q_reg_20_ ( .D(mux_sal[20]), .CK(d_ff5_net3815959), .RN(n810), 
        .Q(sign_inv_out[20]) );
  DFFRXLTS d_ff5_Q_reg_21_ ( .D(mux_sal[21]), .CK(d_ff5_net3815959), .RN(n808), 
        .Q(sign_inv_out[21]) );
  DFFRXLTS d_ff5_Q_reg_22_ ( .D(mux_sal[22]), .CK(d_ff5_net3815959), .RN(n807), 
        .Q(sign_inv_out[22]) );
  DFFRXLTS d_ff5_Q_reg_23_ ( .D(mux_sal[23]), .CK(d_ff5_net3815959), .RN(n809), 
        .Q(sign_inv_out[23]) );
  DFFRXLTS d_ff5_Q_reg_24_ ( .D(mux_sal[24]), .CK(d_ff5_net3815959), .RN(n790), 
        .Q(sign_inv_out[24]) );
  DFFRXLTS d_ff5_Q_reg_25_ ( .D(mux_sal[25]), .CK(d_ff5_net3815959), .RN(n839), 
        .Q(sign_inv_out[25]) );
  DFFRXLTS d_ff5_Q_reg_26_ ( .D(mux_sal[26]), .CK(d_ff5_net3815959), .RN(n830), 
        .Q(sign_inv_out[26]) );
  DFFRXLTS d_ff5_Q_reg_27_ ( .D(mux_sal[27]), .CK(d_ff5_net3815959), .RN(n838), 
        .Q(sign_inv_out[27]) );
  DFFRXLTS d_ff5_Q_reg_28_ ( .D(mux_sal[28]), .CK(d_ff5_net3815959), .RN(n436), 
        .Q(sign_inv_out[28]) );
  DFFRXLTS d_ff5_Q_reg_29_ ( .D(mux_sal[29]), .CK(d_ff5_net3815959), .RN(n838), 
        .Q(sign_inv_out[29]) );
  DFFRXLTS d_ff5_Q_reg_30_ ( .D(mux_sal[30]), .CK(d_ff5_net3815959), .RN(n838), 
        .Q(sign_inv_out[30]) );
  DFFRXLTS d_ff5_Q_reg_31_ ( .D(mux_sal[31]), .CK(d_ff5_net3815959), .RN(n439), 
        .Q(sign_inv_out[31]) );
  DFFRXLTS d_ff5_Q_reg_32_ ( .D(mux_sal[32]), .CK(d_ff5_net3815959), .RN(n839), 
        .Q(sign_inv_out[32]) );
  DFFRXLTS d_ff5_Q_reg_33_ ( .D(mux_sal[33]), .CK(d_ff5_net3815959), .RN(n833), 
        .Q(sign_inv_out[33]) );
  DFFRXLTS d_ff5_Q_reg_34_ ( .D(mux_sal[34]), .CK(d_ff5_net3815959), .RN(n830), 
        .Q(sign_inv_out[34]) );
  DFFRXLTS d_ff5_Q_reg_35_ ( .D(mux_sal[35]), .CK(d_ff5_net3815959), .RN(n834), 
        .Q(sign_inv_out[35]) );
  DFFRXLTS d_ff5_Q_reg_36_ ( .D(mux_sal[36]), .CK(d_ff5_net3815959), .RN(n834), 
        .Q(sign_inv_out[36]) );
  DFFRXLTS d_ff5_Q_reg_37_ ( .D(mux_sal[37]), .CK(d_ff5_net3815959), .RN(n838), 
        .Q(sign_inv_out[37]) );
  DFFRXLTS d_ff5_Q_reg_38_ ( .D(mux_sal[38]), .CK(d_ff5_net3815959), .RN(n433), 
        .Q(sign_inv_out[38]) );
  DFFRXLTS d_ff5_Q_reg_39_ ( .D(mux_sal[39]), .CK(d_ff5_net3815959), .RN(n838), 
        .Q(sign_inv_out[39]) );
  DFFRXLTS d_ff5_Q_reg_40_ ( .D(mux_sal[40]), .CK(d_ff5_net3815959), .RN(n789), 
        .Q(sign_inv_out[40]) );
  DFFRXLTS d_ff5_Q_reg_41_ ( .D(mux_sal[41]), .CK(d_ff5_net3815959), .RN(n788), 
        .Q(sign_inv_out[41]) );
  DFFRXLTS d_ff5_Q_reg_42_ ( .D(mux_sal[42]), .CK(d_ff5_net3815959), .RN(n802), 
        .Q(sign_inv_out[42]) );
  DFFRXLTS d_ff5_Q_reg_43_ ( .D(mux_sal[43]), .CK(d_ff5_net3815959), .RN(n851), 
        .Q(sign_inv_out[43]) );
  DFFRXLTS d_ff5_Q_reg_44_ ( .D(mux_sal[44]), .CK(d_ff5_net3815959), .RN(n789), 
        .Q(sign_inv_out[44]) );
  DFFRXLTS d_ff5_Q_reg_45_ ( .D(mux_sal[45]), .CK(d_ff5_net3815959), .RN(n802), 
        .Q(sign_inv_out[45]) );
  DFFRXLTS d_ff5_Q_reg_46_ ( .D(mux_sal[46]), .CK(d_ff5_net3815959), .RN(n851), 
        .Q(sign_inv_out[46]) );
  DFFRXLTS d_ff5_Q_reg_47_ ( .D(mux_sal[47]), .CK(d_ff5_net3815959), .RN(n789), 
        .Q(sign_inv_out[47]) );
  DFFRXLTS d_ff5_Q_reg_48_ ( .D(mux_sal[48]), .CK(d_ff5_net3815959), .RN(n788), 
        .Q(sign_inv_out[48]) );
  DFFRXLTS d_ff5_Q_reg_49_ ( .D(mux_sal[49]), .CK(d_ff5_net3815959), .RN(n802), 
        .Q(sign_inv_out[49]) );
  DFFRXLTS d_ff5_Q_reg_50_ ( .D(mux_sal[50]), .CK(d_ff5_net3815959), .RN(n849), 
        .Q(sign_inv_out[50]) );
  DFFRXLTS d_ff5_Q_reg_51_ ( .D(mux_sal[51]), .CK(d_ff5_net3815959), .RN(n840), 
        .Q(sign_inv_out[51]) );
  DFFRXLTS d_ff5_Q_reg_52_ ( .D(mux_sal[52]), .CK(d_ff5_net3815959), .RN(n837), 
        .Q(sign_inv_out[52]) );
  DFFRXLTS d_ff5_Q_reg_53_ ( .D(mux_sal[53]), .CK(d_ff5_net3815959), .RN(n441), 
        .Q(sign_inv_out[53]) );
  DFFRXLTS d_ff5_Q_reg_54_ ( .D(mux_sal[54]), .CK(d_ff5_net3815959), .RN(n826), 
        .Q(sign_inv_out[54]) );
  DFFRXLTS d_ff5_Q_reg_55_ ( .D(mux_sal[55]), .CK(d_ff5_net3815959), .RN(n786), 
        .Q(sign_inv_out[55]) );
  DFFRXLTS d_ff5_Q_reg_56_ ( .D(mux_sal[56]), .CK(d_ff5_net3815959), .RN(n786), 
        .Q(sign_inv_out[56]) );
  DFFRXLTS d_ff5_Q_reg_57_ ( .D(mux_sal[57]), .CK(d_ff5_net3815959), .RN(n786), 
        .Q(sign_inv_out[57]) );
  DFFRXLTS d_ff5_Q_reg_58_ ( .D(mux_sal[58]), .CK(d_ff5_net3815959), .RN(n786), 
        .Q(sign_inv_out[58]) );
  DFFRXLTS d_ff5_Q_reg_59_ ( .D(mux_sal[59]), .CK(d_ff5_net3815959), .RN(n786), 
        .Q(sign_inv_out[59]) );
  DFFRXLTS d_ff5_Q_reg_60_ ( .D(mux_sal[60]), .CK(d_ff5_net3815959), .RN(n787), 
        .Q(sign_inv_out[60]) );
  DFFRXLTS d_ff5_Q_reg_61_ ( .D(mux_sal[61]), .CK(d_ff5_net3815959), .RN(n853), 
        .Q(sign_inv_out[61]) );
  DFFRXLTS d_ff5_Q_reg_62_ ( .D(mux_sal[62]), .CK(d_ff5_net3815959), .RN(n853), 
        .Q(sign_inv_out[62]) );
  DFFRXLTS d_ff5_Q_reg_63_ ( .D(mux_sal[63]), .CK(d_ff5_net3815959), .RN(n441), 
        .Q(data_output2_63_) );
  SNPS_CLOCK_GATE_HIGH_CORDIC_Arch2v1_W64_EW11_SW52_SWR55_EWR6_1 clk_gate_reg_ch_mux_2_Q_reg ( 
        .CLK(clk), .EN(n857), .ENCLK(n855), .TE(1'b0) );
  CMPR32X2TS intadd_451_U2 ( .A(d_ff2_X[55]), .B(n454), .C(intadd_451_n2), 
        .CO(intadd_451_n1), .S(sh_exp_x[3]) );
  CMPR32X2TS intadd_452_U2 ( .A(d_ff2_Y[55]), .B(n454), .C(intadd_452_n2), 
        .CO(intadd_452_n1), .S(sh_exp_y[3]) );
  DFFRXLTS reg_LUT_Q_reg_48_ ( .D(1'b1), .CK(reg_shift_y_net3815959), .RN(n444), .Q(d_ff3_LUT_out[48]) );
  DFFRX1TS cont_var_count_reg_1_ ( .D(n290), .CK(n855), .RN(n851), .Q(
        cont_var_out[1]), .QN(n780) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_59_ ( .D(first_mux_X[59]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n801), .Q(d_ff2_X[59]), .QN(n779)
         );
  DFFRX2TS cont_iter_count_reg_3_ ( .D(n861), .CK(cont_iter_net3815995), .RN(
        n789), .Q(cont_iter_out[3]), .QN(n775) );
  DFFRX2TS cont_iter_count_reg_1_ ( .D(n859), .CK(cont_iter_net3815995), .RN(
        n851), .Q(cont_iter_out[1]), .QN(n774) );
  DFFRX2TS cont_iter_count_reg_2_ ( .D(n858), .CK(cont_iter_net3815995), .RN(
        n802), .Q(cont_iter_out[2]), .QN(n771) );
  DFFRXLTS d_ff5_data_out_Q_reg_0_ ( .D(sign_inv_out[0]), .CK(
        d_ff5_data_out_net3815959), .RN(n793), .Q(data_output[0]) );
  DFFRXLTS d_ff5_data_out_Q_reg_1_ ( .D(sign_inv_out[1]), .CK(
        d_ff5_data_out_net3815959), .RN(n793), .Q(data_output[1]) );
  DFFRXLTS d_ff5_data_out_Q_reg_2_ ( .D(sign_inv_out[2]), .CK(
        d_ff5_data_out_net3815959), .RN(n793), .Q(data_output[2]) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(sign_inv_out[3]), .CK(
        d_ff5_data_out_net3815959), .RN(n793), .Q(data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_4_ ( .D(sign_inv_out[4]), .CK(
        d_ff5_data_out_net3815959), .RN(n834), .Q(data_output[4]) );
  DFFRXLTS d_ff5_data_out_Q_reg_5_ ( .D(sign_inv_out[5]), .CK(
        d_ff5_data_out_net3815959), .RN(n830), .Q(data_output[5]) );
  DFFRXLTS d_ff5_data_out_Q_reg_6_ ( .D(sign_inv_out[6]), .CK(
        d_ff5_data_out_net3815959), .RN(n834), .Q(data_output[6]) );
  DFFRXLTS d_ff5_data_out_Q_reg_7_ ( .D(sign_inv_out[7]), .CK(
        d_ff5_data_out_net3815959), .RN(n833), .Q(data_output[7]) );
  DFFRXLTS d_ff5_data_out_Q_reg_8_ ( .D(sign_inv_out[8]), .CK(
        d_ff5_data_out_net3815959), .RN(n436), .Q(data_output[8]) );
  DFFRXLTS d_ff5_data_out_Q_reg_9_ ( .D(sign_inv_out[9]), .CK(
        d_ff5_data_out_net3815959), .RN(n810), .Q(data_output[9]) );
  DFFRXLTS d_ff5_data_out_Q_reg_10_ ( .D(sign_inv_out[10]), .CK(
        d_ff5_data_out_net3815959), .RN(n792), .Q(data_output[10]) );
  DFFRXLTS d_ff5_data_out_Q_reg_11_ ( .D(sign_inv_out[11]), .CK(
        d_ff5_data_out_net3815959), .RN(n791), .Q(data_output[11]) );
  DFFRXLTS d_ff5_data_out_Q_reg_12_ ( .D(sign_inv_out[12]), .CK(
        d_ff5_data_out_net3815959), .RN(n790), .Q(data_output[12]) );
  DFFRXLTS d_ff5_data_out_Q_reg_13_ ( .D(sign_inv_out[13]), .CK(
        d_ff5_data_out_net3815959), .RN(n810), .Q(data_output[13]) );
  DFFRXLTS d_ff5_data_out_Q_reg_14_ ( .D(sign_inv_out[14]), .CK(
        d_ff5_data_out_net3815959), .RN(n809), .Q(data_output[14]) );
  DFFRXLTS d_ff5_data_out_Q_reg_15_ ( .D(sign_inv_out[15]), .CK(
        d_ff5_data_out_net3815959), .RN(n807), .Q(data_output[15]) );
  DFFRXLTS d_ff5_data_out_Q_reg_16_ ( .D(sign_inv_out[16]), .CK(
        d_ff5_data_out_net3815959), .RN(n808), .Q(data_output[16]) );
  DFFRXLTS d_ff5_data_out_Q_reg_17_ ( .D(sign_inv_out[17]), .CK(
        d_ff5_data_out_net3815959), .RN(n810), .Q(data_output[17]) );
  DFFRXLTS d_ff5_data_out_Q_reg_18_ ( .D(sign_inv_out[18]), .CK(
        d_ff5_data_out_net3815959), .RN(n792), .Q(data_output[18]) );
  DFFRXLTS d_ff5_data_out_Q_reg_19_ ( .D(sign_inv_out[19]), .CK(
        d_ff5_data_out_net3815959), .RN(n792), .Q(data_output[19]) );
  DFFRXLTS d_ff5_data_out_Q_reg_20_ ( .D(sign_inv_out[20]), .CK(
        d_ff5_data_out_net3815959), .RN(n791), .Q(data_output[20]) );
  DFFRXLTS d_ff5_data_out_Q_reg_21_ ( .D(sign_inv_out[21]), .CK(
        d_ff5_data_out_net3815959), .RN(n790), .Q(data_output[21]) );
  DFFRXLTS d_ff5_data_out_Q_reg_22_ ( .D(sign_inv_out[22]), .CK(
        d_ff5_data_out_net3815959), .RN(n809), .Q(data_output[22]) );
  DFFRXLTS d_ff5_data_out_Q_reg_23_ ( .D(sign_inv_out[23]), .CK(
        d_ff5_data_out_net3815959), .RN(n807), .Q(data_output[23]) );
  DFFRXLTS d_ff5_data_out_Q_reg_24_ ( .D(sign_inv_out[24]), .CK(
        d_ff5_data_out_net3815959), .RN(n440), .Q(data_output[24]) );
  DFFRXLTS d_ff5_data_out_Q_reg_25_ ( .D(sign_inv_out[25]), .CK(
        d_ff5_data_out_net3815959), .RN(n833), .Q(data_output[25]) );
  DFFRXLTS d_ff5_data_out_Q_reg_26_ ( .D(sign_inv_out[26]), .CK(
        d_ff5_data_out_net3815959), .RN(n839), .Q(data_output[26]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(sign_inv_out[27]), .CK(
        d_ff5_data_out_net3815959), .RN(n830), .Q(data_output[27]) );
  DFFRXLTS d_ff5_data_out_Q_reg_28_ ( .D(sign_inv_out[28]), .CK(
        d_ff5_data_out_net3815959), .RN(n448), .Q(data_output[28]) );
  DFFRXLTS d_ff5_data_out_Q_reg_29_ ( .D(sign_inv_out[29]), .CK(
        d_ff5_data_out_net3815959), .RN(n830), .Q(data_output[29]) );
  DFFRXLTS d_ff5_data_out_Q_reg_30_ ( .D(sign_inv_out[30]), .CK(
        d_ff5_data_out_net3815959), .RN(n448), .Q(data_output[30]) );
  DFFRXLTS d_ff5_data_out_Q_reg_31_ ( .D(sign_inv_out[31]), .CK(
        d_ff5_data_out_net3815959), .RN(n834), .Q(data_output[31]) );
  DFFRXLTS d_ff5_data_out_Q_reg_32_ ( .D(sign_inv_out[32]), .CK(
        d_ff5_data_out_net3815959), .RN(n834), .Q(data_output[32]) );
  DFFRXLTS d_ff5_data_out_Q_reg_33_ ( .D(sign_inv_out[33]), .CK(
        d_ff5_data_out_net3815959), .RN(n448), .Q(data_output[33]) );
  DFFRXLTS d_ff5_data_out_Q_reg_34_ ( .D(sign_inv_out[34]), .CK(
        d_ff5_data_out_net3815959), .RN(n427), .Q(data_output[34]) );
  DFFRXLTS d_ff5_data_out_Q_reg_35_ ( .D(sign_inv_out[35]), .CK(
        d_ff5_data_out_net3815959), .RN(n839), .Q(data_output[35]) );
  DFFRXLTS d_ff5_data_out_Q_reg_36_ ( .D(sign_inv_out[36]), .CK(
        d_ff5_data_out_net3815959), .RN(n833), .Q(data_output[36]) );
  DFFRXLTS d_ff5_data_out_Q_reg_37_ ( .D(sign_inv_out[37]), .CK(
        d_ff5_data_out_net3815959), .RN(n830), .Q(data_output[37]) );
  DFFRXLTS d_ff5_data_out_Q_reg_38_ ( .D(sign_inv_out[38]), .CK(
        d_ff5_data_out_net3815959), .RN(n430), .Q(data_output[38]) );
  DFFRXLTS d_ff5_data_out_Q_reg_39_ ( .D(sign_inv_out[39]), .CK(
        d_ff5_data_out_net3815959), .RN(n851), .Q(data_output[39]) );
  DFFRXLTS d_ff5_data_out_Q_reg_40_ ( .D(sign_inv_out[40]), .CK(
        d_ff5_data_out_net3815959), .RN(n802), .Q(data_output[40]) );
  DFFRXLTS d_ff5_data_out_Q_reg_41_ ( .D(sign_inv_out[41]), .CK(
        d_ff5_data_out_net3815959), .RN(n788), .Q(data_output[41]) );
  DFFRXLTS d_ff5_data_out_Q_reg_42_ ( .D(sign_inv_out[42]), .CK(
        d_ff5_data_out_net3815959), .RN(n789), .Q(data_output[42]) );
  DFFRXLTS d_ff5_data_out_Q_reg_43_ ( .D(sign_inv_out[43]), .CK(
        d_ff5_data_out_net3815959), .RN(n851), .Q(data_output[43]) );
  DFFRXLTS d_ff5_data_out_Q_reg_44_ ( .D(sign_inv_out[44]), .CK(
        d_ff5_data_out_net3815959), .RN(n788), .Q(data_output[44]) );
  DFFRXLTS d_ff5_data_out_Q_reg_45_ ( .D(sign_inv_out[45]), .CK(
        d_ff5_data_out_net3815959), .RN(n789), .Q(data_output[45]) );
  DFFRXLTS d_ff5_data_out_Q_reg_46_ ( .D(sign_inv_out[46]), .CK(
        d_ff5_data_out_net3815959), .RN(n851), .Q(data_output[46]) );
  DFFRXLTS d_ff5_data_out_Q_reg_47_ ( .D(sign_inv_out[47]), .CK(
        d_ff5_data_out_net3815959), .RN(n802), .Q(data_output[47]) );
  DFFRXLTS d_ff5_data_out_Q_reg_48_ ( .D(sign_inv_out[48]), .CK(
        d_ff5_data_out_net3815959), .RN(n788), .Q(data_output[48]) );
  DFFRXLTS d_ff5_data_out_Q_reg_49_ ( .D(sign_inv_out[49]), .CK(
        d_ff5_data_out_net3815959), .RN(n787), .Q(data_output[49]) );
  DFFRXLTS d_ff5_data_out_Q_reg_50_ ( .D(sign_inv_out[50]), .CK(
        d_ff5_data_out_net3815959), .RN(n849), .Q(data_output[50]) );
  DFFRXLTS d_ff5_data_out_Q_reg_51_ ( .D(sign_inv_out[51]), .CK(
        d_ff5_data_out_net3815959), .RN(n849), .Q(data_output[51]) );
  DFFRXLTS d_ff5_data_out_Q_reg_52_ ( .D(sign_inv_out[52]), .CK(
        d_ff5_data_out_net3815959), .RN(n849), .Q(data_output[52]) );
  DFFRXLTS d_ff5_data_out_Q_reg_53_ ( .D(sign_inv_out[53]), .CK(
        d_ff5_data_out_net3815959), .RN(n825), .Q(data_output[53]) );
  DFFRXLTS d_ff5_data_out_Q_reg_54_ ( .D(sign_inv_out[54]), .CK(
        d_ff5_data_out_net3815959), .RN(n786), .Q(data_output[54]) );
  DFFRXLTS d_ff5_data_out_Q_reg_55_ ( .D(sign_inv_out[55]), .CK(
        d_ff5_data_out_net3815959), .RN(n786), .Q(data_output[55]) );
  DFFRXLTS d_ff5_data_out_Q_reg_56_ ( .D(sign_inv_out[56]), .CK(
        d_ff5_data_out_net3815959), .RN(n786), .Q(data_output[56]) );
  DFFRXLTS d_ff5_data_out_Q_reg_57_ ( .D(sign_inv_out[57]), .CK(
        d_ff5_data_out_net3815959), .RN(n786), .Q(data_output[57]) );
  DFFRXLTS d_ff5_data_out_Q_reg_58_ ( .D(sign_inv_out[58]), .CK(
        d_ff5_data_out_net3815959), .RN(n786), .Q(data_output[58]) );
  DFFRXLTS d_ff5_data_out_Q_reg_59_ ( .D(sign_inv_out[59]), .CK(
        d_ff5_data_out_net3815959), .RN(n850), .Q(data_output[59]) );
  DFFRXLTS d_ff5_data_out_Q_reg_60_ ( .D(sign_inv_out[60]), .CK(
        d_ff5_data_out_net3815959), .RN(n842), .Q(data_output[60]) );
  DFFRXLTS d_ff5_data_out_Q_reg_61_ ( .D(sign_inv_out[61]), .CK(
        d_ff5_data_out_net3815959), .RN(n844), .Q(data_output[61]) );
  DFFRXLTS d_ff5_data_out_Q_reg_62_ ( .D(sign_inv_out[62]), .CK(
        d_ff5_data_out_net3815959), .RN(n852), .Q(data_output[62]) );
  DFFRXLTS d_ff5_data_out_Q_reg_63_ ( .D(sign_inv_out[63]), .CK(
        d_ff5_data_out_net3815959), .RN(n852), .Q(data_output[63]) );
  DFFRXLTS reg_sign_Q_reg_0_ ( .D(d_ff2_Z[63]), .CK(reg_shift_y_net3815959), 
        .RN(n793), .Q(d_ff3_sign_out) );
  DFFRX2TS cont_var_count_reg_0_ ( .D(n289), .CK(n855), .RN(n788), .Q(
        cont_var_out[0]), .QN(n773) );
  DFFRX1TS reg_ch_mux_2_Q_reg_0_ ( .D(n283), .CK(n855), .RN(n443), .Q(
        sel_mux_2_reg[0]), .QN(n777) );
  DFFRX1TS reg_ch_mux_2_Q_reg_1_ ( .D(n282), .CK(n855), .RN(n430), .Q(
        sel_mux_2_reg[1]) );
  DFFRXLTS reg_val_muxY_2stage_Q_reg_57_ ( .D(first_mux_Y[57]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n790), .Q(d_ff2_Y[57]), .QN(n782)
         );
  DFFRXLTS cont_iter_count_reg_0_ ( .D(n860), .CK(cont_iter_net3815995), .RN(
        n789), .Q(n455), .QN(n776) );
  DFFRX1TS reg_ch_mux_3_Q_reg_0_ ( .D(n285), .CK(n855), .RN(n443), .QN(n785)
         );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_56_ ( .D(first_mux_Y[56]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n810), .Q(d_ff2_Y[56]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_56_ ( .D(first_mux_X[56]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n440), .Q(d_ff2_X[56]) );
  DFFRX2TS reg_ch_mux_1_Q_reg_0_ ( .D(n284), .CK(n855), .RN(n426), .Q(n456), 
        .QN(n854) );
  DFFRX1TS reg_region_flag_Q_reg_1_ ( .D(shift_region_flag[1]), .CK(
        reg_Z0_net3815959), .RN(n839), .Q(d_ff1_shift_region_flag_out[1]) );
  DFFRX1TS reg_operation_Q_reg_0_ ( .D(operation), .CK(reg_Z0_net3815959), 
        .RN(n429), .Q(d_ff1_operation_out) );
  DFFRX1TS reg_region_flag_Q_reg_0_ ( .D(shift_region_flag[0]), .CK(
        reg_Z0_net3815959), .RN(n830), .Q(d_ff1_shift_region_flag_out[0]), 
        .QN(n781) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_58_ ( .D(first_mux_Y[58]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n809), .Q(d_ff2_Y[58]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_61_ ( .D(first_mux_Y[61]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n807), .Q(d_ff2_Y[61]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_61_ ( .D(first_mux_X[61]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n826), .Q(d_ff2_X[61]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_60_ ( .D(first_mux_Y[60]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n808), .Q(d_ff2_Y[60]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_60_ ( .D(first_mux_X[60]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n826), .Q(d_ff2_X[60]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_58_ ( .D(first_mux_X[58]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n787), .Q(d_ff2_X[58]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_55_ ( .D(first_mux_X[55]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n801), .Q(d_ff2_X[55]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_54_ ( .D(first_mux_X[54]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n825), .Q(d_ff2_X[54]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_53_ ( .D(first_mux_X[53]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n849), .Q(d_ff2_X[53]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_55_ ( .D(first_mux_Y[55]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n809), .Q(d_ff2_Y[55]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_54_ ( .D(first_mux_Y[54]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n807), .Q(d_ff2_Y[54]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_53_ ( .D(first_mux_Y[53]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n808), .Q(d_ff2_Y[53]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_62_ ( .D(first_mux_Y[62]), .CK(
        reg_val_muxZ_2stage_net3815959), .RN(n792), .Q(d_ff2_Y[62]) );
  DFFRX4TS cordic_FSM_state_reg_reg_3_ ( .D(n291), .CK(n855), .RN(n276), .Q(
        cordic_FSM_state_reg[3]), .QN(n772) );
  DFFRX4TS cordic_FSM_state_reg_reg_1_ ( .D(cordic_FSM_state_next_1_), .CK(clk), .RN(n276), .Q(cordic_FSM_state_reg[1]), .QN(n769) );
  DFFRX4TS cordic_FSM_state_reg_reg_2_ ( .D(n292), .CK(clk), .RN(n276), .Q(
        cordic_FSM_state_reg[2]), .QN(n778) );
  DFFRX2TS cordic_FSM_state_reg_reg_0_ ( .D(n293), .CK(clk), .RN(n276), .Q(
        cordic_FSM_state_reg[0]), .QN(n770) );
  ADDFX1TS intadd_451_U4 ( .A(d_ff2_X[53]), .B(n774), .CI(intadd_451_CI), .CO(
        intadd_451_n3), .S(sh_exp_x[1]) );
  ADDFX1TS intadd_452_U4 ( .A(d_ff2_Y[53]), .B(n774), .CI(intadd_452_CI), .CO(
        intadd_452_n3), .S(sh_exp_y[1]) );
  ADDFX1TS intadd_451_U3 ( .A(d_ff2_X[54]), .B(n771), .CI(intadd_451_n3), .CO(
        intadd_451_n2), .S(sh_exp_x[2]) );
  ADDFX1TS intadd_452_U3 ( .A(d_ff2_Y[54]), .B(n771), .CI(intadd_452_n3), .CO(
        intadd_452_n2), .S(sh_exp_y[2]) );
  NAND2X1TS U757 ( .A(n779), .B(n764), .Y(n763) );
  NAND3X1TS U758 ( .A(n708), .B(n707), .C(n706), .Y(data_out_LUT[3]) );
  CLKBUFX3TS U759 ( .A(n678), .Y(n442) );
  NAND2BX1TS U760 ( .AN(data_out_LUT[16]), .B(n703), .Y(data_out_LUT[12]) );
  AOI222X1TS U761 ( .A0(d_ff2_Y[56]), .A1(n756), .B0(d_ff2_X[56]), .B1(n487), 
        .C0(n745), .C1(d_ff2_Z[56]), .Y(n477) );
  NAND2X1TS U762 ( .A(n633), .B(n705), .Y(n699) );
  AOI222X1TS U763 ( .A0(d_ff2_Y[61]), .A1(n756), .B0(d_ff2_X[61]), .B1(n487), 
        .C0(n745), .C1(d_ff2_Z[61]), .Y(n479) );
  AOI222X1TS U764 ( .A0(d_ff2_Y[62]), .A1(n756), .B0(d_ff2_X[62]), .B1(n487), 
        .C0(n752), .C1(d_ff2_Z[62]), .Y(n473) );
  INVX2TS U765 ( .A(n709), .Y(n711) );
  INVX2TS U766 ( .A(n712), .Y(n714) );
  NAND2XLTS U767 ( .A(sel_mux_2_reg[1]), .B(n853), .Y(n470) );
  INVX2TS U768 ( .A(n712), .Y(n713) );
  CLKBUFX3TS U769 ( .A(n775), .Y(n454) );
  AND4X4TS U770 ( .A(n772), .B(n778), .C(n769), .D(n445), .Y(n457) );
  INVX3TS U771 ( .A(n776), .Y(n784) );
  CLKAND2X2TS U772 ( .A(data_out_LUT[49]), .B(n692), .Y(n708) );
  NAND3XLTS U773 ( .A(n784), .B(cont_iter_out[3]), .C(n705), .Y(n681) );
  CLKAND2X2TS U774 ( .A(n640), .B(n772), .Y(load_cont_iter) );
  NOR2XLTS U775 ( .A(cordic_FSM_state_reg[3]), .B(n857), .Y(enab_d_ff2_RB2) );
  NOR3XLTS U776 ( .A(n476), .B(n475), .C(n474), .Y(enab_d_ff4_Xn) );
  NOR2XLTS U777 ( .A(n627), .B(n474), .Y(enab_d_ff4_Yn) );
  NOR3XLTS U778 ( .A(n628), .B(n621), .C(n474), .Y(enab_d_ff4_Zn) );
  OAI31X1TS U779 ( .A0(cordic_FSM_state_reg[2]), .A1(n626), .A2(n770), .B0(
        n625), .Y(n292) );
  CLKAND2X2TS U780 ( .A(d_ff_Yn[62]), .B(n652), .Y(first_mux_Y[62]) );
  CLKAND2X2TS U781 ( .A(d_ff_Yn[53]), .B(n645), .Y(first_mux_Y[53]) );
  CLKAND2X2TS U782 ( .A(d_ff_Yn[54]), .B(n645), .Y(first_mux_Y[54]) );
  CLKAND2X2TS U783 ( .A(d_ff_Yn[55]), .B(n645), .Y(first_mux_Y[55]) );
  NAND2BXLTS U784 ( .AN(d_ff_Xn[53]), .B(n714), .Y(first_mux_X[53]) );
  NAND2BXLTS U785 ( .AN(d_ff_Xn[54]), .B(n714), .Y(first_mux_X[54]) );
  NAND2BXLTS U786 ( .AN(d_ff_Xn[55]), .B(n714), .Y(first_mux_X[55]) );
  NAND2BXLTS U787 ( .AN(d_ff_Xn[58]), .B(n714), .Y(first_mux_X[58]) );
  NAND2BXLTS U788 ( .AN(d_ff_Xn[60]), .B(n714), .Y(first_mux_X[60]) );
  CLKAND2X2TS U789 ( .A(d_ff_Yn[60]), .B(n652), .Y(first_mux_Y[60]) );
  NAND2BXLTS U790 ( .AN(d_ff_Xn[61]), .B(n714), .Y(first_mux_X[61]) );
  CLKAND2X2TS U791 ( .A(d_ff_Yn[61]), .B(n652), .Y(first_mux_Y[61]) );
  CLKAND2X2TS U792 ( .A(d_ff_Yn[58]), .B(n652), .Y(first_mux_Y[58]) );
  NAND2BXLTS U793 ( .AN(d_ff_Xn[56]), .B(n714), .Y(first_mux_X[56]) );
  CLKAND2X2TS U794 ( .A(d_ff_Yn[56]), .B(n652), .Y(first_mux_Y[56]) );
  NAND3XLTS U795 ( .A(n675), .B(n853), .C(n466), .Y(n465) );
  NAND4XLTS U796 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[1]), 
        .C(n778), .D(n770), .Y(n466) );
  CLKAND2X2TS U797 ( .A(d_ff_Yn[57]), .B(n652), .Y(first_mux_Y[57]) );
  AOI211XLTS U798 ( .A0(n615), .A1(n773), .B0(load_cont_var), .C0(n471), .Y(
        n289) );
  NAND2BXLTS U799 ( .AN(d_ff_Xn[59]), .B(n714), .Y(first_mux_X[59]) );
  AOI211XLTS U800 ( .A0(cont_var_out[1]), .A1(n490), .B0(load_cont_var), .C0(
        n489), .Y(n290) );
  AO22XLTS U801 ( .A0(n675), .A1(d_ff_Yn[63]), .B0(n674), .B1(d_ff_Xn[63]), 
        .Y(mux_sal[63]) );
  AO22XLTS U802 ( .A0(n675), .A1(d_ff_Yn[62]), .B0(n674), .B1(d_ff_Xn[62]), 
        .Y(mux_sal[62]) );
  AO22XLTS U803 ( .A0(n675), .A1(d_ff_Yn[61]), .B0(n674), .B1(d_ff_Xn[61]), 
        .Y(mux_sal[61]) );
  AO22XLTS U804 ( .A0(n675), .A1(d_ff_Yn[60]), .B0(n674), .B1(d_ff_Xn[60]), 
        .Y(mux_sal[60]) );
  AO22XLTS U805 ( .A0(n675), .A1(d_ff_Yn[59]), .B0(n674), .B1(d_ff_Xn[59]), 
        .Y(mux_sal[59]) );
  AO22XLTS U806 ( .A0(n675), .A1(d_ff_Yn[58]), .B0(n673), .B1(d_ff_Xn[58]), 
        .Y(mux_sal[58]) );
  AO22XLTS U807 ( .A0(n675), .A1(d_ff_Yn[57]), .B0(n673), .B1(d_ff_Xn[57]), 
        .Y(mux_sal[57]) );
  AO22XLTS U808 ( .A0(n675), .A1(d_ff_Yn[56]), .B0(n673), .B1(d_ff_Xn[56]), 
        .Y(mux_sal[56]) );
  CLKINVX3TS U809 ( .A(n457), .Y(n786) );
  AO22XLTS U810 ( .A0(n675), .A1(d_ff_Yn[55]), .B0(n673), .B1(d_ff_Xn[55]), 
        .Y(mux_sal[55]) );
  AO22XLTS U811 ( .A0(n672), .A1(d_ff_Yn[54]), .B0(n673), .B1(d_ff_Xn[54]), 
        .Y(mux_sal[54]) );
  AO22XLTS U812 ( .A0(n672), .A1(d_ff_Yn[53]), .B0(n673), .B1(d_ff_Xn[53]), 
        .Y(mux_sal[53]) );
  AO22XLTS U813 ( .A0(n672), .A1(d_ff_Yn[52]), .B0(n673), .B1(d_ff_Xn[52]), 
        .Y(mux_sal[52]) );
  AO22XLTS U814 ( .A0(n672), .A1(d_ff_Yn[51]), .B0(n673), .B1(d_ff_Xn[51]), 
        .Y(mux_sal[51]) );
  AO22XLTS U815 ( .A0(n672), .A1(d_ff_Yn[50]), .B0(n673), .B1(d_ff_Xn[50]), 
        .Y(mux_sal[50]) );
  AO22XLTS U816 ( .A0(n672), .A1(d_ff_Yn[49]), .B0(n673), .B1(d_ff_Xn[49]), 
        .Y(mux_sal[49]) );
  AO22XLTS U817 ( .A0(n672), .A1(d_ff_Yn[48]), .B0(n670), .B1(d_ff_Xn[48]), 
        .Y(mux_sal[48]) );
  AO22XLTS U818 ( .A0(n672), .A1(d_ff_Yn[47]), .B0(n670), .B1(d_ff_Xn[47]), 
        .Y(mux_sal[47]) );
  AO22XLTS U819 ( .A0(n672), .A1(d_ff_Yn[46]), .B0(n670), .B1(d_ff_Xn[46]), 
        .Y(mux_sal[46]) );
  AO22XLTS U820 ( .A0(n672), .A1(d_ff_Yn[45]), .B0(n670), .B1(d_ff_Xn[45]), 
        .Y(mux_sal[45]) );
  AO22XLTS U821 ( .A0(n669), .A1(d_ff_Yn[44]), .B0(n670), .B1(d_ff_Xn[44]), 
        .Y(mux_sal[44]) );
  AO22XLTS U822 ( .A0(n669), .A1(d_ff_Yn[43]), .B0(n670), .B1(d_ff_Xn[43]), 
        .Y(mux_sal[43]) );
  AO22XLTS U823 ( .A0(n669), .A1(d_ff_Yn[42]), .B0(n670), .B1(d_ff_Xn[42]), 
        .Y(mux_sal[42]) );
  AO22XLTS U824 ( .A0(n669), .A1(d_ff_Yn[41]), .B0(n670), .B1(d_ff_Xn[41]), 
        .Y(mux_sal[41]) );
  AO22XLTS U825 ( .A0(n669), .A1(d_ff_Yn[40]), .B0(n670), .B1(d_ff_Xn[40]), 
        .Y(mux_sal[40]) );
  AO22XLTS U826 ( .A0(n669), .A1(d_ff_Yn[39]), .B0(n670), .B1(d_ff_Xn[39]), 
        .Y(mux_sal[39]) );
  AO22XLTS U827 ( .A0(n669), .A1(d_ff_Yn[38]), .B0(n668), .B1(d_ff_Xn[38]), 
        .Y(mux_sal[38]) );
  AO22XLTS U828 ( .A0(n669), .A1(d_ff_Yn[37]), .B0(n668), .B1(d_ff_Xn[37]), 
        .Y(mux_sal[37]) );
  AO22XLTS U829 ( .A0(n669), .A1(d_ff_Yn[36]), .B0(n668), .B1(d_ff_Xn[36]), 
        .Y(mux_sal[36]) );
  AO22XLTS U830 ( .A0(n669), .A1(d_ff_Yn[35]), .B0(n668), .B1(d_ff_Xn[35]), 
        .Y(mux_sal[35]) );
  AO22XLTS U831 ( .A0(n667), .A1(d_ff_Yn[34]), .B0(n668), .B1(d_ff_Xn[34]), 
        .Y(mux_sal[34]) );
  AO22XLTS U832 ( .A0(n667), .A1(d_ff_Yn[33]), .B0(n668), .B1(d_ff_Xn[33]), 
        .Y(mux_sal[33]) );
  AO22XLTS U833 ( .A0(n667), .A1(d_ff_Yn[32]), .B0(n668), .B1(d_ff_Xn[32]), 
        .Y(mux_sal[32]) );
  AO22XLTS U834 ( .A0(n667), .A1(d_ff_Yn[31]), .B0(n668), .B1(d_ff_Xn[31]), 
        .Y(mux_sal[31]) );
  AO22XLTS U835 ( .A0(n667), .A1(d_ff_Yn[30]), .B0(n668), .B1(d_ff_Xn[30]), 
        .Y(mux_sal[30]) );
  AO22XLTS U836 ( .A0(n667), .A1(d_ff_Yn[29]), .B0(n668), .B1(d_ff_Xn[29]), 
        .Y(mux_sal[29]) );
  AO22XLTS U837 ( .A0(n667), .A1(d_ff_Yn[28]), .B0(n665), .B1(d_ff_Xn[28]), 
        .Y(mux_sal[28]) );
  AO22XLTS U838 ( .A0(n667), .A1(d_ff_Yn[27]), .B0(n665), .B1(d_ff_Xn[27]), 
        .Y(mux_sal[27]) );
  AO22XLTS U839 ( .A0(n667), .A1(d_ff_Yn[26]), .B0(n665), .B1(d_ff_Xn[26]), 
        .Y(mux_sal[26]) );
  AO22XLTS U840 ( .A0(n667), .A1(d_ff_Yn[25]), .B0(n665), .B1(d_ff_Xn[25]), 
        .Y(mux_sal[25]) );
  AO22XLTS U841 ( .A0(n664), .A1(d_ff_Yn[24]), .B0(n665), .B1(d_ff_Xn[24]), 
        .Y(mux_sal[24]) );
  AO22XLTS U842 ( .A0(n664), .A1(d_ff_Yn[23]), .B0(n665), .B1(d_ff_Xn[23]), 
        .Y(mux_sal[23]) );
  AO22XLTS U843 ( .A0(n664), .A1(d_ff_Yn[22]), .B0(n665), .B1(d_ff_Xn[22]), 
        .Y(mux_sal[22]) );
  AO22XLTS U844 ( .A0(n664), .A1(d_ff_Yn[21]), .B0(n665), .B1(d_ff_Xn[21]), 
        .Y(mux_sal[21]) );
  AO22XLTS U845 ( .A0(n664), .A1(d_ff_Yn[20]), .B0(n665), .B1(d_ff_Xn[20]), 
        .Y(mux_sal[20]) );
  AO22XLTS U846 ( .A0(n664), .A1(d_ff_Yn[19]), .B0(n665), .B1(d_ff_Xn[19]), 
        .Y(mux_sal[19]) );
  AO22XLTS U847 ( .A0(n664), .A1(d_ff_Yn[18]), .B0(n663), .B1(d_ff_Xn[18]), 
        .Y(mux_sal[18]) );
  AO22XLTS U848 ( .A0(n664), .A1(d_ff_Yn[17]), .B0(n663), .B1(d_ff_Xn[17]), 
        .Y(mux_sal[17]) );
  AO22XLTS U849 ( .A0(n664), .A1(d_ff_Yn[16]), .B0(n663), .B1(d_ff_Xn[16]), 
        .Y(mux_sal[16]) );
  AO22XLTS U850 ( .A0(n664), .A1(d_ff_Yn[15]), .B0(n663), .B1(d_ff_Xn[15]), 
        .Y(mux_sal[15]) );
  AO22XLTS U851 ( .A0(n662), .A1(d_ff_Yn[14]), .B0(n663), .B1(d_ff_Xn[14]), 
        .Y(mux_sal[14]) );
  AO22XLTS U852 ( .A0(n662), .A1(d_ff_Yn[13]), .B0(n663), .B1(d_ff_Xn[13]), 
        .Y(mux_sal[13]) );
  AO22XLTS U853 ( .A0(n662), .A1(d_ff_Yn[12]), .B0(n663), .B1(d_ff_Xn[12]), 
        .Y(mux_sal[12]) );
  AO22XLTS U854 ( .A0(n662), .A1(d_ff_Yn[11]), .B0(n663), .B1(d_ff_Xn[11]), 
        .Y(mux_sal[11]) );
  AO22XLTS U855 ( .A0(n662), .A1(d_ff_Yn[10]), .B0(n663), .B1(d_ff_Xn[10]), 
        .Y(mux_sal[10]) );
  AO22XLTS U856 ( .A0(n662), .A1(d_ff_Yn[9]), .B0(n663), .B1(d_ff_Xn[9]), .Y(
        mux_sal[9]) );
  AO22XLTS U857 ( .A0(n662), .A1(d_ff_Yn[8]), .B0(n666), .B1(d_ff_Xn[8]), .Y(
        mux_sal[8]) );
  AO22XLTS U858 ( .A0(n662), .A1(d_ff_Yn[7]), .B0(n666), .B1(d_ff_Xn[7]), .Y(
        mux_sal[7]) );
  AO22XLTS U859 ( .A0(n662), .A1(d_ff_Yn[6]), .B0(n666), .B1(d_ff_Xn[6]), .Y(
        mux_sal[6]) );
  AO22XLTS U860 ( .A0(n662), .A1(d_ff_Yn[5]), .B0(n666), .B1(d_ff_Xn[5]), .Y(
        mux_sal[5]) );
  AO22XLTS U861 ( .A0(n661), .A1(d_ff_Yn[4]), .B0(n666), .B1(d_ff_Xn[4]), .Y(
        mux_sal[4]) );
  AO22XLTS U862 ( .A0(n661), .A1(d_ff_Yn[3]), .B0(n666), .B1(d_ff_Xn[3]), .Y(
        mux_sal[3]) );
  AO22XLTS U863 ( .A0(n661), .A1(d_ff_Yn[2]), .B0(n666), .B1(d_ff_Xn[2]), .Y(
        mux_sal[2]) );
  AO22XLTS U864 ( .A0(n661), .A1(d_ff_Yn[1]), .B0(n671), .B1(d_ff_Xn[1]), .Y(
        mux_sal[1]) );
  CLKINVX3TS U865 ( .A(n457), .Y(n793) );
  AO22XLTS U866 ( .A0(n661), .A1(d_ff_Yn[0]), .B0(n671), .B1(d_ff_Xn[0]), .Y(
        mux_sal[0]) );
  AO22XLTS U867 ( .A0(n660), .A1(d_ff_Zn[63]), .B0(n659), .B1(d_ff1_Z[63]), 
        .Y(first_mux_Z[63]) );
  AO22XLTS U868 ( .A0(n660), .A1(d_ff_Zn[62]), .B0(n854), .B1(d_ff1_Z[62]), 
        .Y(first_mux_Z[62]) );
  AO22XLTS U869 ( .A0(n660), .A1(d_ff_Zn[61]), .B0(n854), .B1(d_ff1_Z[61]), 
        .Y(first_mux_Z[61]) );
  AO22XLTS U870 ( .A0(n660), .A1(d_ff_Zn[60]), .B0(n709), .B1(d_ff1_Z[60]), 
        .Y(first_mux_Z[60]) );
  AO22XLTS U871 ( .A0(n660), .A1(d_ff_Zn[59]), .B0(n709), .B1(d_ff1_Z[59]), 
        .Y(first_mux_Z[59]) );
  AO22XLTS U872 ( .A0(n660), .A1(d_ff_Zn[58]), .B0(n712), .B1(d_ff1_Z[58]), 
        .Y(first_mux_Z[58]) );
  AO22XLTS U873 ( .A0(n660), .A1(d_ff_Zn[57]), .B0(n712), .B1(d_ff1_Z[57]), 
        .Y(first_mux_Z[57]) );
  AO22XLTS U874 ( .A0(n660), .A1(d_ff_Zn[56]), .B0(n712), .B1(d_ff1_Z[56]), 
        .Y(first_mux_Z[56]) );
  AO22XLTS U875 ( .A0(n660), .A1(d_ff_Zn[55]), .B0(n658), .B1(d_ff1_Z[55]), 
        .Y(first_mux_Z[55]) );
  AO22XLTS U876 ( .A0(n657), .A1(d_ff_Zn[54]), .B0(n658), .B1(d_ff1_Z[54]), 
        .Y(first_mux_Z[54]) );
  AO22XLTS U877 ( .A0(n657), .A1(d_ff_Zn[53]), .B0(n658), .B1(d_ff1_Z[53]), 
        .Y(first_mux_Z[53]) );
  AO22XLTS U878 ( .A0(n657), .A1(d_ff_Zn[52]), .B0(n658), .B1(d_ff1_Z[52]), 
        .Y(first_mux_Z[52]) );
  AO22XLTS U879 ( .A0(n657), .A1(d_ff_Zn[51]), .B0(n658), .B1(d_ff1_Z[51]), 
        .Y(first_mux_Z[51]) );
  AO22XLTS U880 ( .A0(n657), .A1(d_ff_Zn[50]), .B0(n658), .B1(d_ff1_Z[50]), 
        .Y(first_mux_Z[50]) );
  AO22XLTS U881 ( .A0(n657), .A1(d_ff_Zn[49]), .B0(n658), .B1(d_ff1_Z[49]), 
        .Y(first_mux_Z[49]) );
  AO22XLTS U882 ( .A0(n657), .A1(d_ff_Zn[48]), .B0(n658), .B1(d_ff1_Z[48]), 
        .Y(first_mux_Z[48]) );
  AO22XLTS U883 ( .A0(n657), .A1(d_ff_Zn[47]), .B0(n658), .B1(d_ff1_Z[47]), 
        .Y(first_mux_Z[47]) );
  AO22XLTS U884 ( .A0(n657), .A1(d_ff_Zn[46]), .B0(n658), .B1(d_ff1_Z[46]), 
        .Y(first_mux_Z[46]) );
  AO22XLTS U885 ( .A0(n657), .A1(d_ff_Zn[45]), .B0(n656), .B1(d_ff1_Z[45]), 
        .Y(first_mux_Z[45]) );
  AO22XLTS U886 ( .A0(n655), .A1(d_ff_Zn[44]), .B0(n654), .B1(d_ff1_Z[44]), 
        .Y(first_mux_Z[44]) );
  AO22XLTS U887 ( .A0(n655), .A1(d_ff_Zn[43]), .B0(n656), .B1(d_ff1_Z[43]), 
        .Y(first_mux_Z[43]) );
  AO22XLTS U888 ( .A0(n655), .A1(d_ff_Zn[42]), .B0(n656), .B1(d_ff1_Z[42]), 
        .Y(first_mux_Z[42]) );
  AO22XLTS U889 ( .A0(n655), .A1(d_ff_Zn[41]), .B0(n656), .B1(d_ff1_Z[41]), 
        .Y(first_mux_Z[41]) );
  AO22XLTS U890 ( .A0(n655), .A1(d_ff_Zn[40]), .B0(n656), .B1(d_ff1_Z[40]), 
        .Y(first_mux_Z[40]) );
  AO22XLTS U891 ( .A0(n655), .A1(d_ff_Zn[39]), .B0(n656), .B1(d_ff1_Z[39]), 
        .Y(first_mux_Z[39]) );
  AO22XLTS U892 ( .A0(n655), .A1(d_ff_Zn[38]), .B0(n656), .B1(d_ff1_Z[38]), 
        .Y(first_mux_Z[38]) );
  AO22XLTS U893 ( .A0(n655), .A1(d_ff_Zn[37]), .B0(n656), .B1(d_ff1_Z[37]), 
        .Y(first_mux_Z[37]) );
  AO22XLTS U894 ( .A0(n655), .A1(d_ff_Zn[36]), .B0(n656), .B1(d_ff1_Z[36]), 
        .Y(first_mux_Z[36]) );
  AO22XLTS U895 ( .A0(n655), .A1(d_ff_Zn[35]), .B0(n656), .B1(d_ff1_Z[35]), 
        .Y(first_mux_Z[35]) );
  AO22XLTS U896 ( .A0(n653), .A1(d_ff_Zn[34]), .B0(n654), .B1(d_ff1_Z[34]), 
        .Y(first_mux_Z[34]) );
  AO22XLTS U897 ( .A0(n653), .A1(d_ff_Zn[33]), .B0(n654), .B1(d_ff1_Z[33]), 
        .Y(first_mux_Z[33]) );
  AO22XLTS U898 ( .A0(n652), .A1(d_ff_Zn[32]), .B0(n654), .B1(d_ff1_Z[32]), 
        .Y(first_mux_Z[32]) );
  AO22XLTS U899 ( .A0(n653), .A1(d_ff_Zn[31]), .B0(n654), .B1(d_ff1_Z[31]), 
        .Y(first_mux_Z[31]) );
  AO22XLTS U900 ( .A0(n653), .A1(d_ff_Zn[30]), .B0(n654), .B1(d_ff1_Z[30]), 
        .Y(first_mux_Z[30]) );
  AO22XLTS U901 ( .A0(n653), .A1(d_ff_Zn[29]), .B0(n654), .B1(d_ff1_Z[29]), 
        .Y(first_mux_Z[29]) );
  AO22XLTS U902 ( .A0(n653), .A1(d_ff_Zn[28]), .B0(n654), .B1(d_ff1_Z[28]), 
        .Y(first_mux_Z[28]) );
  AO22XLTS U903 ( .A0(n653), .A1(d_ff_Zn[27]), .B0(n654), .B1(d_ff1_Z[27]), 
        .Y(first_mux_Z[27]) );
  AO22XLTS U904 ( .A0(n653), .A1(d_ff_Zn[26]), .B0(n654), .B1(d_ff1_Z[26]), 
        .Y(first_mux_Z[26]) );
  AO22XLTS U905 ( .A0(n653), .A1(d_ff_Zn[25]), .B0(n651), .B1(d_ff1_Z[25]), 
        .Y(first_mux_Z[25]) );
  AO22XLTS U906 ( .A0(n653), .A1(d_ff_Zn[24]), .B0(n651), .B1(d_ff1_Z[24]), 
        .Y(first_mux_Z[24]) );
  AO22XLTS U907 ( .A0(n650), .A1(d_ff_Zn[23]), .B0(n651), .B1(d_ff1_Z[23]), 
        .Y(first_mux_Z[23]) );
  AO22XLTS U908 ( .A0(n650), .A1(d_ff_Zn[22]), .B0(n651), .B1(d_ff1_Z[22]), 
        .Y(first_mux_Z[22]) );
  AO22XLTS U909 ( .A0(n650), .A1(d_ff_Zn[21]), .B0(n651), .B1(d_ff1_Z[21]), 
        .Y(first_mux_Z[21]) );
  AO22XLTS U910 ( .A0(n650), .A1(d_ff_Zn[20]), .B0(n651), .B1(d_ff1_Z[20]), 
        .Y(first_mux_Z[20]) );
  AO22XLTS U911 ( .A0(n650), .A1(d_ff_Zn[19]), .B0(n651), .B1(d_ff1_Z[19]), 
        .Y(first_mux_Z[19]) );
  AO22XLTS U912 ( .A0(n650), .A1(d_ff_Zn[18]), .B0(n651), .B1(d_ff1_Z[18]), 
        .Y(first_mux_Z[18]) );
  AO22XLTS U913 ( .A0(n650), .A1(d_ff_Zn[17]), .B0(n651), .B1(d_ff1_Z[17]), 
        .Y(first_mux_Z[17]) );
  AO22XLTS U914 ( .A0(n650), .A1(d_ff_Zn[16]), .B0(n651), .B1(d_ff1_Z[16]), 
        .Y(first_mux_Z[16]) );
  AO22XLTS U915 ( .A0(n650), .A1(d_ff_Zn[15]), .B0(n649), .B1(d_ff1_Z[15]), 
        .Y(first_mux_Z[15]) );
  AO22XLTS U916 ( .A0(n650), .A1(d_ff_Zn[14]), .B0(n649), .B1(d_ff1_Z[14]), 
        .Y(first_mux_Z[14]) );
  AO22XLTS U917 ( .A0(n648), .A1(d_ff_Zn[13]), .B0(n649), .B1(d_ff1_Z[13]), 
        .Y(first_mux_Z[13]) );
  AO22XLTS U918 ( .A0(n648), .A1(d_ff_Zn[12]), .B0(n649), .B1(d_ff1_Z[12]), 
        .Y(first_mux_Z[12]) );
  AO22XLTS U919 ( .A0(n648), .A1(d_ff_Zn[11]), .B0(n854), .B1(d_ff1_Z[11]), 
        .Y(first_mux_Z[11]) );
  AO22XLTS U920 ( .A0(n648), .A1(d_ff_Zn[10]), .B0(n854), .B1(d_ff1_Z[10]), 
        .Y(first_mux_Z[10]) );
  AO22XLTS U921 ( .A0(n648), .A1(d_ff_Zn[9]), .B0(n854), .B1(d_ff1_Z[9]), .Y(
        first_mux_Z[9]) );
  AO22XLTS U922 ( .A0(n648), .A1(d_ff_Zn[8]), .B0(n649), .B1(d_ff1_Z[8]), .Y(
        first_mux_Z[8]) );
  AO22XLTS U923 ( .A0(n648), .A1(d_ff_Zn[7]), .B0(n649), .B1(d_ff1_Z[7]), .Y(
        first_mux_Z[7]) );
  AO22XLTS U924 ( .A0(n648), .A1(d_ff_Zn[6]), .B0(n647), .B1(d_ff1_Z[6]), .Y(
        first_mux_Z[6]) );
  AO22XLTS U925 ( .A0(n648), .A1(d_ff_Zn[5]), .B0(n647), .B1(d_ff1_Z[5]), .Y(
        first_mux_Z[5]) );
  AO22XLTS U926 ( .A0(n648), .A1(d_ff_Zn[4]), .B0(n647), .B1(d_ff1_Z[4]), .Y(
        first_mux_Z[4]) );
  AO22XLTS U927 ( .A0(n646), .A1(d_ff_Zn[3]), .B0(n647), .B1(d_ff1_Z[3]), .Y(
        first_mux_Z[3]) );
  AO22XLTS U928 ( .A0(n646), .A1(d_ff_Zn[2]), .B0(n647), .B1(d_ff1_Z[2]), .Y(
        first_mux_Z[2]) );
  AO22XLTS U929 ( .A0(n652), .A1(d_ff_Zn[1]), .B0(n647), .B1(d_ff1_Z[1]), .Y(
        first_mux_Z[1]) );
  AO22XLTS U930 ( .A0(n660), .A1(d_ff_Zn[0]), .B0(n854), .B1(d_ff1_Z[0]), .Y(
        first_mux_Z[0]) );
  CLKAND2X2TS U931 ( .A(d_ff_Yn[63]), .B(n652), .Y(first_mux_Y[63]) );
  CLKAND2X2TS U932 ( .A(d_ff_Yn[59]), .B(n652), .Y(first_mux_Y[59]) );
  CLKAND2X2TS U933 ( .A(d_ff_Yn[52]), .B(n645), .Y(first_mux_Y[52]) );
  CLKAND2X2TS U934 ( .A(d_ff_Yn[51]), .B(n645), .Y(first_mux_Y[51]) );
  CLKAND2X2TS U935 ( .A(d_ff_Yn[50]), .B(n645), .Y(first_mux_Y[50]) );
  CLKAND2X2TS U936 ( .A(d_ff_Yn[49]), .B(n645), .Y(first_mux_Y[49]) );
  CLKAND2X2TS U937 ( .A(d_ff_Yn[48]), .B(n645), .Y(first_mux_Y[48]) );
  CLKAND2X2TS U938 ( .A(d_ff_Yn[47]), .B(n645), .Y(first_mux_Y[47]) );
  CLKAND2X2TS U939 ( .A(d_ff_Yn[46]), .B(n645), .Y(first_mux_Y[46]) );
  CLKAND2X2TS U940 ( .A(d_ff_Yn[45]), .B(n644), .Y(first_mux_Y[45]) );
  CLKAND2X2TS U941 ( .A(d_ff_Yn[44]), .B(n644), .Y(first_mux_Y[44]) );
  CLKAND2X2TS U942 ( .A(d_ff_Yn[43]), .B(n644), .Y(first_mux_Y[43]) );
  CLKAND2X2TS U943 ( .A(d_ff_Yn[42]), .B(n644), .Y(first_mux_Y[42]) );
  CLKAND2X2TS U944 ( .A(d_ff_Yn[41]), .B(n644), .Y(first_mux_Y[41]) );
  CLKAND2X2TS U945 ( .A(d_ff_Yn[40]), .B(n644), .Y(first_mux_Y[40]) );
  CLKAND2X2TS U946 ( .A(d_ff_Yn[39]), .B(n644), .Y(first_mux_Y[39]) );
  CLKAND2X2TS U947 ( .A(d_ff_Yn[38]), .B(n644), .Y(first_mux_Y[38]) );
  CLKAND2X2TS U948 ( .A(d_ff_Yn[37]), .B(n644), .Y(first_mux_Y[37]) );
  CLKAND2X2TS U949 ( .A(d_ff_Yn[36]), .B(n644), .Y(first_mux_Y[36]) );
  CLKAND2X2TS U950 ( .A(d_ff_Yn[35]), .B(n643), .Y(first_mux_Y[35]) );
  CLKAND2X2TS U951 ( .A(d_ff_Yn[34]), .B(n643), .Y(first_mux_Y[34]) );
  CLKAND2X2TS U952 ( .A(d_ff_Yn[33]), .B(n643), .Y(first_mux_Y[33]) );
  CLKAND2X2TS U953 ( .A(d_ff_Yn[32]), .B(n643), .Y(first_mux_Y[32]) );
  CLKAND2X2TS U954 ( .A(d_ff_Yn[31]), .B(n643), .Y(first_mux_Y[31]) );
  CLKAND2X2TS U955 ( .A(d_ff_Yn[30]), .B(n643), .Y(first_mux_Y[30]) );
  CLKAND2X2TS U956 ( .A(d_ff_Yn[29]), .B(n643), .Y(first_mux_Y[29]) );
  CLKAND2X2TS U957 ( .A(d_ff_Yn[28]), .B(n643), .Y(first_mux_Y[28]) );
  CLKAND2X2TS U958 ( .A(d_ff_Yn[27]), .B(n643), .Y(first_mux_Y[27]) );
  CLKAND2X2TS U959 ( .A(d_ff_Yn[26]), .B(n642), .Y(first_mux_Y[26]) );
  CLKAND2X2TS U960 ( .A(d_ff_Yn[25]), .B(n642), .Y(first_mux_Y[25]) );
  CLKAND2X2TS U961 ( .A(d_ff_Yn[24]), .B(n642), .Y(first_mux_Y[24]) );
  CLKAND2X2TS U962 ( .A(d_ff_Yn[23]), .B(n642), .Y(first_mux_Y[23]) );
  CLKAND2X2TS U963 ( .A(d_ff_Yn[22]), .B(n642), .Y(first_mux_Y[22]) );
  CLKAND2X2TS U964 ( .A(d_ff_Yn[21]), .B(n642), .Y(first_mux_Y[21]) );
  CLKAND2X2TS U965 ( .A(d_ff_Yn[20]), .B(n642), .Y(first_mux_Y[20]) );
  CLKAND2X2TS U966 ( .A(d_ff_Yn[19]), .B(n642), .Y(first_mux_Y[19]) );
  CLKAND2X2TS U967 ( .A(d_ff_Yn[18]), .B(n642), .Y(first_mux_Y[18]) );
  CLKAND2X2TS U968 ( .A(d_ff_Yn[17]), .B(n642), .Y(first_mux_Y[17]) );
  CLKAND2X2TS U969 ( .A(d_ff_Yn[16]), .B(n641), .Y(first_mux_Y[16]) );
  CLKAND2X2TS U970 ( .A(d_ff_Yn[15]), .B(n641), .Y(first_mux_Y[15]) );
  CLKAND2X2TS U971 ( .A(d_ff_Yn[14]), .B(n641), .Y(first_mux_Y[14]) );
  CLKAND2X2TS U972 ( .A(d_ff_Yn[13]), .B(n641), .Y(first_mux_Y[13]) );
  CLKAND2X2TS U973 ( .A(d_ff_Yn[12]), .B(n641), .Y(first_mux_Y[12]) );
  CLKAND2X2TS U974 ( .A(d_ff_Yn[11]), .B(n641), .Y(first_mux_Y[11]) );
  CLKAND2X2TS U975 ( .A(d_ff_Yn[10]), .B(n641), .Y(first_mux_Y[10]) );
  CLKAND2X2TS U976 ( .A(d_ff_Yn[9]), .B(n641), .Y(first_mux_Y[9]) );
  CLKAND2X2TS U977 ( .A(d_ff_Yn[8]), .B(n641), .Y(first_mux_Y[8]) );
  CLKAND2X2TS U978 ( .A(d_ff_Yn[7]), .B(n641), .Y(first_mux_Y[7]) );
  CLKAND2X2TS U979 ( .A(d_ff_Yn[6]), .B(n716), .Y(first_mux_Y[6]) );
  CLKAND2X2TS U980 ( .A(d_ff_Yn[5]), .B(n716), .Y(first_mux_Y[5]) );
  CLKAND2X2TS U981 ( .A(d_ff_Yn[4]), .B(n716), .Y(first_mux_Y[4]) );
  CLKAND2X2TS U982 ( .A(d_ff_Yn[3]), .B(n716), .Y(first_mux_Y[3]) );
  CLKAND2X2TS U983 ( .A(d_ff_Yn[2]), .B(n716), .Y(first_mux_Y[2]) );
  CLKAND2X2TS U984 ( .A(d_ff_Yn[1]), .B(n643), .Y(first_mux_Y[1]) );
  CLKAND2X2TS U985 ( .A(d_ff_Xn[63]), .B(n716), .Y(first_mux_X[63]) );
  CLKAND2X2TS U986 ( .A(d_ff_Xn[62]), .B(n715), .Y(first_mux_X[62]) );
  NAND2BXLTS U987 ( .AN(d_ff_Xn[57]), .B(n714), .Y(first_mux_X[57]) );
  CLKAND2X2TS U988 ( .A(d_ff_Xn[52]), .B(n715), .Y(first_mux_X[52]) );
  CLKAND2X2TS U989 ( .A(d_ff_Xn[51]), .B(n646), .Y(first_mux_X[51]) );
  CLKAND2X2TS U990 ( .A(d_ff_Xn[50]), .B(n715), .Y(first_mux_X[50]) );
  NAND2BXLTS U991 ( .AN(d_ff_Xn[49]), .B(n713), .Y(first_mux_X[49]) );
  NAND2BXLTS U992 ( .AN(d_ff_Xn[48]), .B(n713), .Y(first_mux_X[48]) );
  CLKAND2X2TS U993 ( .A(d_ff_Xn[47]), .B(n646), .Y(first_mux_X[47]) );
  NAND2BXLTS U994 ( .AN(d_ff_Xn[46]), .B(n713), .Y(first_mux_X[46]) );
  NAND2BXLTS U995 ( .AN(d_ff_Xn[45]), .B(n714), .Y(first_mux_X[45]) );
  CLKAND2X2TS U996 ( .A(d_ff_Xn[44]), .B(n715), .Y(first_mux_X[44]) );
  NAND2BXLTS U997 ( .AN(d_ff_Xn[43]), .B(n713), .Y(first_mux_X[43]) );
  NAND2BXLTS U998 ( .AN(d_ff_Xn[42]), .B(n713), .Y(first_mux_X[42]) );
  NAND2BXLTS U999 ( .AN(d_ff_Xn[41]), .B(n713), .Y(first_mux_X[41]) );
  CLKAND2X2TS U1000 ( .A(d_ff_Xn[40]), .B(n715), .Y(first_mux_X[40]) );
  NAND2BXLTS U1001 ( .AN(d_ff_Xn[39]), .B(n711), .Y(first_mux_X[39]) );
  CLKAND2X2TS U1002 ( .A(d_ff_Xn[38]), .B(n710), .Y(first_mux_X[38]) );
  NAND2BXLTS U1003 ( .AN(d_ff_Xn[36]), .B(n713), .Y(first_mux_X[36]) );
  NAND2BXLTS U1004 ( .AN(d_ff_Xn[35]), .B(n713), .Y(first_mux_X[35]) );
  NAND2BXLTS U1005 ( .AN(d_ff_Xn[34]), .B(n713), .Y(first_mux_X[34]) );
  CLKAND2X2TS U1006 ( .A(d_ff_Xn[33]), .B(n715), .Y(first_mux_X[33]) );
  NAND2BXLTS U1007 ( .AN(d_ff_Xn[32]), .B(n713), .Y(first_mux_X[32]) );
  NAND2BXLTS U1008 ( .AN(d_ff_Xn[31]), .B(n711), .Y(first_mux_X[31]) );
  CLKAND2X2TS U1009 ( .A(d_ff_Xn[30]), .B(n710), .Y(first_mux_X[30]) );
  NAND2BXLTS U1010 ( .AN(d_ff_Xn[29]), .B(n711), .Y(first_mux_X[29]) );
  NAND2BXLTS U1011 ( .AN(d_ff_Xn[28]), .B(n711), .Y(first_mux_X[28]) );
  CLKAND2X2TS U1012 ( .A(d_ff_Xn[27]), .B(n715), .Y(first_mux_X[27]) );
  NAND2BXLTS U1013 ( .AN(d_ff_Xn[26]), .B(n711), .Y(first_mux_X[26]) );
  CLKAND2X2TS U1014 ( .A(d_ff_Xn[25]), .B(n715), .Y(first_mux_X[25]) );
  NAND2BXLTS U1015 ( .AN(d_ff_Xn[24]), .B(n711), .Y(first_mux_X[24]) );
  CLKAND2X2TS U1016 ( .A(d_ff_Xn[23]), .B(n715), .Y(first_mux_X[23]) );
  CLKAND2X2TS U1017 ( .A(d_ff_Xn[22]), .B(n710), .Y(first_mux_X[22]) );
  CLKAND2X2TS U1018 ( .A(d_ff_Xn[21]), .B(n715), .Y(first_mux_X[21]) );
  CLKAND2X2TS U1019 ( .A(d_ff_Xn[20]), .B(n710), .Y(first_mux_X[20]) );
  NAND2BXLTS U1020 ( .AN(d_ff_Xn[19]), .B(n646), .Y(first_mux_X[19]) );
  CLKAND2X2TS U1021 ( .A(d_ff_Xn[18]), .B(n710), .Y(first_mux_X[18]) );
  CLKAND2X2TS U1022 ( .A(d_ff_Xn[17]), .B(n710), .Y(first_mux_X[17]) );
  CLKAND2X2TS U1023 ( .A(d_ff_Xn[16]), .B(n710), .Y(first_mux_X[16]) );
  CLKAND2X2TS U1024 ( .A(d_ff_Xn[15]), .B(n710), .Y(first_mux_X[15]) );
  NAND2BXLTS U1025 ( .AN(d_ff_Xn[14]), .B(n711), .Y(first_mux_X[14]) );
  NAND2BXLTS U1026 ( .AN(d_ff_Xn[13]), .B(n646), .Y(first_mux_X[13]) );
  CLKAND2X2TS U1027 ( .A(d_ff_Xn[12]), .B(n716), .Y(first_mux_X[12]) );
  NAND2BXLTS U1028 ( .AN(d_ff_Xn[11]), .B(n646), .Y(first_mux_X[11]) );
  CLKAND2X2TS U1029 ( .A(d_ff_Xn[10]), .B(n710), .Y(first_mux_X[10]) );
  NAND2BXLTS U1030 ( .AN(d_ff_Xn[9]), .B(n646), .Y(first_mux_X[9]) );
  NAND2BXLTS U1031 ( .AN(d_ff_Xn[8]), .B(n711), .Y(first_mux_X[8]) );
  NAND2BXLTS U1032 ( .AN(d_ff_Xn[7]), .B(n646), .Y(first_mux_X[7]) );
  NAND2BXLTS U1033 ( .AN(d_ff_Xn[6]), .B(n711), .Y(first_mux_X[6]) );
  CLKAND2X2TS U1034 ( .A(d_ff_Xn[5]), .B(n710), .Y(first_mux_X[5]) );
  CLKAND2X2TS U1035 ( .A(d_ff_Xn[4]), .B(n716), .Y(first_mux_X[4]) );
  NAND2BXLTS U1036 ( .AN(d_ff_Xn[3]), .B(n646), .Y(first_mux_X[3]) );
  CLKAND2X2TS U1037 ( .A(d_ff_Xn[2]), .B(n716), .Y(first_mux_X[2]) );
  CLKAND2X2TS U1038 ( .A(d_ff_Xn[1]), .B(n716), .Y(first_mux_X[1]) );
  NAND2BXLTS U1039 ( .AN(d_ff_Xn[0]), .B(n711), .Y(first_mux_X[0]) );
  XOR2XLTS U1040 ( .A(n762), .B(d_ff2_Y[62]), .Y(sh_exp_y[10]) );
  XOR2XLTS U1041 ( .A(d_ff2_Y[61]), .B(n761), .Y(sh_exp_y[9]) );
  AO21XLTS U1042 ( .A0(d_ff2_Y[60]), .A1(n757), .B0(n761), .Y(sh_exp_y[8]) );
  OAI21XLTS U1043 ( .A0(n758), .A1(n460), .B0(n757), .Y(sh_exp_y[7]) );
  AO21XLTS U1044 ( .A0(d_ff2_Y[58]), .A1(n759), .B0(n758), .Y(sh_exp_y[6]) );
  OAI21XLTS U1045 ( .A0(n760), .A1(n782), .B0(n759), .Y(sh_exp_y[5]) );
  AO21XLTS U1046 ( .A0(intadd_452_n1), .A1(d_ff2_Y[56]), .B0(n760), .Y(
        sh_exp_y[4]) );
  OAI21XLTS U1047 ( .A0(n784), .A1(n459), .B0(intadd_452_CI), .Y(sh_exp_y[0])
         );
  XOR2XLTS U1048 ( .A(n768), .B(d_ff2_X[62]), .Y(sh_exp_x[10]) );
  XOR2XLTS U1049 ( .A(d_ff2_X[61]), .B(n767), .Y(sh_exp_x[9]) );
  AO21XLTS U1050 ( .A0(d_ff2_X[60]), .A1(n763), .B0(n767), .Y(sh_exp_x[8]) );
  OAI21XLTS U1051 ( .A0(n764), .A1(n779), .B0(n763), .Y(sh_exp_x[7]) );
  AO21XLTS U1052 ( .A0(d_ff2_X[58]), .A1(n765), .B0(n764), .Y(sh_exp_x[6]) );
  AO21XLTS U1053 ( .A0(intadd_451_n1), .A1(d_ff2_X[56]), .B0(n766), .Y(
        sh_exp_x[4]) );
  OAI21XLTS U1054 ( .A0(n447), .A1(n458), .B0(intadd_451_CI), .Y(sh_exp_x[0])
         );
  NAND3XLTS U1055 ( .A(n708), .B(n704), .C(n678), .Y(data_out_LUT[55]) );
  AO21XLTS U1056 ( .A0(n620), .A1(cont_iter_out[2]), .B0(n632), .Y(
        data_out_LUT[54]) );
  NAND2BXLTS U1057 ( .AN(data_out_LUT[16]), .B(n442), .Y(data_out_LUT[43]) );
  NAND3XLTS U1058 ( .A(n454), .B(data_out_LUT[50]), .C(n701), .Y(
        data_out_LUT[39]) );
  NAND4XLTS U1059 ( .A(n692), .B(data_out_LUT[50]), .C(n691), .D(n690), .Y(
        data_out_LUT[35]) );
  AO21XLTS U1060 ( .A0(n784), .A1(n700), .B0(data_out_LUT[29]), .Y(
        data_out_LUT[31]) );
  NAND4XLTS U1061 ( .A(n442), .B(n703), .C(n699), .D(n698), .Y(
        data_out_LUT[29]) );
  NAND4XLTS U1062 ( .A(n704), .B(n463), .C(n681), .D(data_out_LUT[45]), .Y(
        data_out_LUT[27]) );
  NAND3XLTS U1063 ( .A(n697), .B(n703), .C(n696), .Y(data_out_LUT[26]) );
  OAI21XLTS U1064 ( .A0(n633), .A1(n680), .B0(n693), .Y(data_out_LUT[25]) );
  NAND2BXLTS U1065 ( .AN(data_out_LUT[12]), .B(n442), .Y(data_out_LUT[24]) );
  INVX2TS U1066 ( .A(n449), .Y(n834) );
  NAND3XLTS U1067 ( .A(n694), .B(n693), .C(n442), .Y(data_out_LUT[19]) );
  NAND2BXLTS U1068 ( .AN(data_out_LUT[35]), .B(n442), .Y(data_out_LUT[18]) );
  NAND4XLTS U1069 ( .A(n689), .B(n442), .C(n703), .D(data_out_LUT[40]), .Y(
        data_out_LUT[15]) );
  NAND4XLTS U1070 ( .A(n708), .B(n694), .C(n691), .D(n699), .Y(
        data_out_LUT[13]) );
  NAND4XLTS U1071 ( .A(n692), .B(n688), .C(n696), .D(n687), .Y(
        data_out_LUT[11]) );
  OAI21XLTS U1072 ( .A0(n784), .A1(data_out_LUT[20]), .B0(n690), .Y(n685) );
  NAND4XLTS U1073 ( .A(n694), .B(n707), .C(n442), .D(n703), .Y(data_out_LUT[7]) );
  NAND4XLTS U1074 ( .A(n692), .B(n442), .C(data_out_LUT[40]), .D(n698), .Y(
        data_out_LUT[6]) );
  NAND4XLTS U1075 ( .A(n694), .B(n692), .C(n681), .D(data_out_LUT[40]), .Y(
        data_out_LUT[1]) );
  INVX2TS U1076 ( .A(n450), .Y(n838) );
  NAND4XLTS U1077 ( .A(n694), .B(n680), .C(n442), .D(n679), .Y(data_out_LUT[0]) );
  AOI222X1TS U1078 ( .A0(n778), .A1(cordic_FSM_state_reg[1]), .B0(n778), .B1(
        n628), .C0(n769), .C1(n770), .Y(n631) );
  OR4X2TS U1079 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[0]), 
        .C(n778), .D(n769), .Y(n423) );
  CLKINVX3TS U1080 ( .A(n428), .Y(n847) );
  NOR4X2TS U1081 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[2]), 
        .C(n772), .D(n445), .Y(ack_add_subt) );
  INVX2TS U1082 ( .A(n423), .Y(n453) );
  INVX2TS U1083 ( .A(n452), .Y(n833) );
  INVX2TS U1084 ( .A(n451), .Y(n830) );
  INVX2TS U1085 ( .A(n449), .Y(n839) );
  INVX2TS U1086 ( .A(n839), .Y(n425) );
  INVX2TS U1087 ( .A(n425), .Y(n426) );
  INVX2TS U1088 ( .A(n425), .Y(n427) );
  CLKINVX3TS U1089 ( .A(n431), .Y(n832) );
  INVX2TS U1090 ( .A(n838), .Y(n428) );
  INVX2TS U1091 ( .A(n428), .Y(n429) );
  INVX2TS U1092 ( .A(n428), .Y(n430) );
  INVX2TS U1093 ( .A(n830), .Y(n431) );
  INVX2TS U1094 ( .A(n431), .Y(n432) );
  INVX2TS U1095 ( .A(n431), .Y(n433) );
  INVX2TS U1096 ( .A(n833), .Y(n434) );
  INVX2TS U1097 ( .A(n434), .Y(n435) );
  INVX2TS U1098 ( .A(n434), .Y(n436) );
  INVX2TS U1099 ( .A(n834), .Y(n437) );
  INVX2TS U1100 ( .A(n437), .Y(n438) );
  INVX2TS U1101 ( .A(n437), .Y(n439) );
  CLKINVX3TS U1102 ( .A(n450), .Y(n787) );
  CLKINVX3TS U1103 ( .A(n462), .Y(n850) );
  INVX2TS U1104 ( .A(n451), .Y(n440) );
  INVX2TS U1105 ( .A(n434), .Y(n441) );
  INVX2TS U1106 ( .A(n451), .Y(n443) );
  INVX2TS U1107 ( .A(n434), .Y(n444) );
  INVX2TS U1108 ( .A(cordic_FSM_state_reg[0]), .Y(n445) );
  INVX2TS U1109 ( .A(n784), .Y(n446) );
  INVX2TS U1110 ( .A(n446), .Y(n447) );
  OAI32X1TS U1111 ( .A0(n453), .A1(n450), .A2(n777), .B0(n627), .B1(n423), .Y(
        n283) );
  NOR4X1TS U1112 ( .A(cordic_FSM_state_reg[1]), .B(n778), .C(n772), .D(n445), 
        .Y(ready_cordic) );
  OAI32X1TS U1113 ( .A0(n445), .A1(n638), .A2(n637), .B0(
        cordic_FSM_state_reg[0]), .B1(n636), .Y(n639) );
  NAND3X2TS U1114 ( .A(cordic_FSM_state_reg[2]), .B(n769), .C(n770), .Y(n857)
         );
  NOR2X2TS U1115 ( .A(n774), .B(n446), .Y(n620) );
  CLKINVX3TS U1116 ( .A(n425), .Y(n849) );
  CLKINVX3TS U1117 ( .A(n428), .Y(n846) );
  CLKINVX3TS U1118 ( .A(n437), .Y(n831) );
  NOR3X2TS U1119 ( .A(cordic_FSM_state_reg[2]), .B(cordic_FSM_state_reg[0]), 
        .C(n769), .Y(n640) );
  AOI31XLTS U1120 ( .A0(cordic_FSM_state_reg[3]), .A1(data_out_LUT[56]), .A2(
        n621), .B0(cordic_FSM_state_reg[1]), .Y(n626) );
  NOR2X4TS U1121 ( .A(cont_iter_out[2]), .B(cont_iter_out[1]), .Y(n683) );
  INVX2TS U1122 ( .A(n462), .Y(n448) );
  INVX2TS U1123 ( .A(n448), .Y(n449) );
  INVX2TS U1124 ( .A(n448), .Y(n450) );
  INVX2TS U1125 ( .A(n448), .Y(n451) );
  INVX2TS U1126 ( .A(n448), .Y(n452) );
  NOR2X4TS U1127 ( .A(cont_iter_out[2]), .B(n774), .Y(n700) );
  CLKINVX3TS U1128 ( .A(n457), .Y(n821) );
  CLKINVX3TS U1129 ( .A(n457), .Y(n820) );
  CLKINVX3TS U1130 ( .A(n457), .Y(n812) );
  CLKINVX3TS U1131 ( .A(n457), .Y(n811) );
  CLKINVX3TS U1132 ( .A(n425), .Y(n804) );
  CLKINVX3TS U1133 ( .A(n462), .Y(n795) );
  CLKINVX3TS U1134 ( .A(n434), .Y(n792) );
  CLKINVX3TS U1135 ( .A(n462), .Y(n789) );
  CLKINVX3TS U1136 ( .A(n457), .Y(n853) );
  CLKINVX3TS U1137 ( .A(n452), .Y(n851) );
  CLKINVX3TS U1138 ( .A(n451), .Y(n802) );
  CLKINVX3TS U1139 ( .A(n434), .Y(n788) );
  CLKINVX3TS U1140 ( .A(n450), .Y(n828) );
  CLKINVX3TS U1141 ( .A(n457), .Y(n852) );
  CLKINVX3TS U1142 ( .A(n425), .Y(n799) );
  CLKINVX3TS U1143 ( .A(n437), .Y(n841) );
  CLKINVX3TS U1144 ( .A(n425), .Y(n843) );
  CLKINVX3TS U1145 ( .A(n428), .Y(n829) );
  CLKINVX3TS U1146 ( .A(n431), .Y(n845) );
  CLKINVX3TS U1147 ( .A(n452), .Y(n848) );
  CLKINVX3TS U1148 ( .A(n437), .Y(n842) );
  CLKINVX3TS U1149 ( .A(n425), .Y(n844) );
  CLKINVX3TS U1150 ( .A(n450), .Y(n818) );
  CLKINVX3TS U1151 ( .A(n449), .Y(n817) );
  CLKINVX3TS U1152 ( .A(n462), .Y(n816) );
  CLKINVX3TS U1153 ( .A(n437), .Y(n798) );
  CLKINVX3TS U1154 ( .A(n437), .Y(n819) );
  CLKINVX3TS U1155 ( .A(n428), .Y(n800) );
  CLKINVX3TS U1156 ( .A(n431), .Y(n815) );
  CLKINVX3TS U1157 ( .A(n451), .Y(n814) );
  CLKINVX3TS U1158 ( .A(n434), .Y(n813) );
  CLKINVX3TS U1159 ( .A(n452), .Y(n794) );
  CLKINVX3TS U1160 ( .A(n452), .Y(n797) );
  CLKINVX3TS U1161 ( .A(n449), .Y(n796) );
  CLKINVX3TS U1162 ( .A(n431), .Y(n824) );
  CLKINVX3TS U1163 ( .A(n452), .Y(n823) );
  CLKINVX3TS U1164 ( .A(n451), .Y(n822) );
  CLKINVX3TS U1165 ( .A(n434), .Y(n803) );
  CLKINVX3TS U1166 ( .A(n462), .Y(n806) );
  CLKINVX3TS U1167 ( .A(n450), .Y(n805) );
  CLKINVX3TS U1168 ( .A(n450), .Y(n810) );
  CLKINVX3TS U1169 ( .A(n425), .Y(n807) );
  CLKINVX3TS U1170 ( .A(n428), .Y(n809) );
  CLKINVX3TS U1171 ( .A(n431), .Y(n808) );
  CLKINVX3TS U1172 ( .A(n452), .Y(n790) );
  CLKINVX3TS U1173 ( .A(n437), .Y(n791) );
  CLKINVX3TS U1174 ( .A(n428), .Y(n826) );
  CLKINVX3TS U1175 ( .A(n449), .Y(n801) );
  CLKINVX3TS U1176 ( .A(n431), .Y(n827) );
  NOR2X4TS U1177 ( .A(cont_iter_out[3]), .B(n446), .Y(n633) );
  AOI222X1TS U1178 ( .A0(n543), .A1(d_ff2_Z[53]), .B0(n539), .B1(d_ff2_Y[53]), 
        .C0(n538), .C1(d_ff2_X[53]), .Y(n518) );
  AOI222X1TS U1179 ( .A0(n543), .A1(d_ff2_Z[54]), .B0(n539), .B1(d_ff2_Y[54]), 
        .C0(n538), .C1(d_ff2_X[54]), .Y(n528) );
  AOI222X1TS U1180 ( .A0(n543), .A1(d_ff2_Z[55]), .B0(n539), .B1(d_ff2_Y[55]), 
        .C0(n538), .C1(d_ff2_X[55]), .Y(n524) );
  AOI22X4TS U1181 ( .A0(n454), .A1(n634), .B0(n683), .B1(n686), .Y(n694) );
  AOI211X2TS U1182 ( .A0(n634), .A1(n682), .B0(n628), .C0(n502), .Y(n704) );
  NOR2X4TS U1183 ( .A(n771), .B(n774), .Y(n634) );
  AOI222X1TS U1184 ( .A0(d_ff2_Y[58]), .A1(n756), .B0(d_ff2_X[58]), .B1(n487), 
        .C0(n752), .C1(d_ff2_Z[58]), .Y(n472) );
  NOR2X2TS U1185 ( .A(d_ff2_X[58]), .B(n765), .Y(n764) );
  AOI222X1TS U1186 ( .A0(d_ff2_Y[60]), .A1(n756), .B0(d_ff2_X[60]), .B1(n487), 
        .C0(n739), .C1(d_ff2_Z[60]), .Y(n478) );
  NOR2X2TS U1187 ( .A(d_ff2_X[60]), .B(n763), .Y(n767) );
  NOR2X2TS U1188 ( .A(d_ff2_Y[60]), .B(n757), .Y(n761) );
  NAND2X2TS U1189 ( .A(n682), .B(n683), .Y(data_out_LUT[50]) );
  NOR2X4TS U1190 ( .A(n447), .B(cont_iter_out[3]), .Y(n682) );
  NOR4X4TS U1191 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[1]), 
        .C(n778), .D(n770), .Y(load_cont_var) );
  OAI21XLTS U1192 ( .A0(n466), .A1(n469), .B0(n465), .Y(n285) );
  NOR2XLTS U1193 ( .A(cont_var_out[1]), .B(n490), .Y(n489) );
  OR2X1TS U1194 ( .A(n619), .B(load_cont_iter), .Y(enab_cont_iter) );
  OAI21XLTS U1195 ( .A0(n766), .A1(n783), .B0(n765), .Y(sh_exp_x[5]) );
  NAND3X2TS U1196 ( .A(n634), .B(n784), .C(cont_iter_out[3]), .Y(
        data_out_LUT[56]) );
  INVX2TS U1197 ( .A(n633), .Y(n695) );
  INVX2TS U1198 ( .A(data_out_LUT[56]), .Y(n628) );
  NOR2X2TS U1199 ( .A(cont_iter_out[1]), .B(n771), .Y(n705) );
  INVX2TS U1200 ( .A(n699), .Y(n502) );
  OAI21XLTS U1201 ( .A0(n774), .A1(n695), .B0(n704), .Y(data_out_LUT[23]) );
  INVX2TS U1202 ( .A(n682), .Y(n461) );
  INVX2TS U1203 ( .A(n683), .Y(n688) );
  NAND2X1TS U1204 ( .A(cont_iter_out[3]), .B(n688), .Y(n690) );
  OAI211XLTS U1205 ( .A0(n461), .A1(n771), .B0(n690), .C0(n699), .Y(
        data_out_LUT[14]) );
  NAND2X1TS U1206 ( .A(n683), .B(n633), .Y(data_out_LUT[40]) );
  NAND2X1TS U1207 ( .A(n700), .B(n633), .Y(data_out_LUT[38]) );
  INVX2TS U1208 ( .A(n634), .Y(n680) );
  NAND2X1TS U1209 ( .A(n680), .B(n454), .Y(data_out_LUT[20]) );
  INVX2TS U1210 ( .A(data_out_LUT[20]), .Y(n702) );
  NAND2X1TS U1211 ( .A(n633), .B(n774), .Y(n679) );
  NAND2X1TS U1212 ( .A(n702), .B(n679), .Y(data_out_LUT[16]) );
  NAND2X1TS U1213 ( .A(n775), .B(n688), .Y(data_out_LUT[22]) );
  CLKBUFX2TS U1214 ( .A(n457), .Y(n462) );
  INVX2TS U1215 ( .A(n452), .Y(n835) );
  INVX2TS U1216 ( .A(n451), .Y(n836) );
  INVX2TS U1217 ( .A(n450), .Y(n837) );
  INVX2TS U1218 ( .A(n449), .Y(n840) );
  INVX2TS U1219 ( .A(n449), .Y(n825) );
  NOR2X1TS U1220 ( .A(sel_mux_2_reg[1]), .B(n777), .Y(n480) );
  BUFX3TS U1221 ( .A(n480), .Y(n756) );
  NOR2X1TS U1222 ( .A(sel_mux_2_reg[0]), .B(sel_mux_2_reg[1]), .Y(n564) );
  BUFX3TS U1223 ( .A(n564), .Y(n578) );
  BUFX3TS U1224 ( .A(n578), .Y(n487) );
  AO22XLTS U1225 ( .A0(n756), .A1(d_ff3_sh_x_out[63]), .B0(n487), .B1(
        d_ff3_sh_y_out[63]), .Y(add_subt_dataB[63]) );
  AO22XLTS U1226 ( .A0(n756), .A1(d_ff3_sh_x_out[62]), .B0(n487), .B1(
        d_ff3_sh_y_out[62]), .Y(add_subt_dataB[62]) );
  NAND2X1TS U1227 ( .A(n682), .B(n771), .Y(data_out_LUT[47]) );
  NAND2X1TS U1228 ( .A(n700), .B(n775), .Y(data_out_LUT[45]) );
  NOR2X2TS U1229 ( .A(n775), .B(n784), .Y(n686) );
  NAND2X1TS U1230 ( .A(n634), .B(n686), .Y(n463) );
  NAND2X1TS U1231 ( .A(n683), .B(n775), .Y(data_out_LUT[49]) );
  NAND2X2TS U1232 ( .A(n682), .B(n705), .Y(n703) );
  NAND2X1TS U1233 ( .A(data_out_LUT[38]), .B(n703), .Y(n501) );
  INVX2TS U1234 ( .A(n501), .Y(n692) );
  NAND2X1TS U1235 ( .A(n708), .B(n690), .Y(data_out_LUT[33]) );
  INVX2TS U1236 ( .A(rst), .Y(n276) );
  NAND2X1TS U1237 ( .A(n458), .B(n447), .Y(intadd_451_CI) );
  NAND2X1TS U1238 ( .A(n459), .B(n447), .Y(intadd_452_CI) );
  INVX2TS U1239 ( .A(n620), .Y(n701) );
  OAI21X1TS U1240 ( .A0(cont_iter_out[1]), .A1(n784), .B0(n701), .Y(
        data_out_LUT[53]) );
  NOR2X1TS U1241 ( .A(d_ff1_shift_region_flag_out[1]), .B(d_ff1_operation_out), 
        .Y(n676) );
  AOI21X1TS U1242 ( .A0(d_ff1_operation_out), .A1(
        d_ff1_shift_region_flag_out[1]), .B0(n676), .Y(n464) );
  XNOR2X1TS U1243 ( .A(d_ff1_shift_region_flag_out[0]), .B(n464), .Y(n469) );
  BUFX3TS U1244 ( .A(n785), .Y(n666) );
  INVX2TS U1245 ( .A(n666), .Y(n675) );
  NOR2X1TS U1246 ( .A(d_ff2_X[56]), .B(intadd_451_n1), .Y(n766) );
  OR3X1TS U1247 ( .A(d_ff2_X[57]), .B(d_ff2_X[56]), .C(intadd_451_n1), .Y(n765) );
  NOR2X1TS U1248 ( .A(d_ff2_Y[56]), .B(intadd_452_n1), .Y(n760) );
  OR3X1TS U1249 ( .A(d_ff2_Y[57]), .B(d_ff2_Y[56]), .C(intadd_452_n1), .Y(n759) );
  INVX2TS U1250 ( .A(n694), .Y(data_out_LUT[17]) );
  NAND2X1TS U1251 ( .A(cordic_FSM_state_reg[1]), .B(cordic_FSM_state_reg[0]), 
        .Y(n622) );
  NOR3X1TS U1252 ( .A(cordic_FSM_state_reg[3]), .B(cordic_FSM_state_reg[2]), 
        .C(n622), .Y(n468) );
  BUFX3TS U1253 ( .A(n854), .Y(n659) );
  BUFX3TS U1254 ( .A(n659), .Y(n712) );
  NAND2X1TS U1255 ( .A(n468), .B(data_out_LUT[50]), .Y(n467) );
  OAI31X1TS U1256 ( .A0(n449), .A1(n468), .A2(n712), .B0(n467), .Y(n284) );
  NAND2X1TS U1257 ( .A(cont_var_out[1]), .B(n773), .Y(n621) );
  NAND2X1TS U1258 ( .A(ready_add_subt), .B(n769), .Y(n616) );
  NAND4BX1TS U1259 ( .AN(n616), .B(cordic_FSM_state_reg[3]), .C(n770), .D(n778), .Y(n474) );
  NOR2X1TS U1260 ( .A(data_out_LUT[56]), .B(n469), .Y(n476) );
  AOI21X1TS U1261 ( .A0(cont_var_out[0]), .A1(data_out_LUT[56]), .B0(n476), 
        .Y(n627) );
  OAI32X1TS U1262 ( .A0(n423), .A1(n628), .A2(n780), .B0(n453), .B1(n470), .Y(
        n282) );
  NAND2X1TS U1263 ( .A(ack_add_subt), .B(data_out_LUT[56]), .Y(n615) );
  AOI21X1TS U1264 ( .A0(n621), .A1(n773), .B0(n615), .Y(n471) );
  NOR2BX1TS U1265 ( .AN(sel_mux_2_reg[1]), .B(sel_mux_2_reg[0]), .Y(n729) );
  BUFX3TS U1266 ( .A(n729), .Y(n739) );
  BUFX3TS U1267 ( .A(n739), .Y(n752) );
  INVX2TS U1268 ( .A(n472), .Y(add_subt_dataA[58]) );
  INVX2TS U1269 ( .A(n473), .Y(add_subt_dataA[62]) );
  AOI21X1TS U1270 ( .A0(n780), .A1(n773), .B0(n628), .Y(n475) );
  NOR2X2TS U1271 ( .A(d_ff2_Y[58]), .B(n759), .Y(n758) );
  NAND2X1TS U1272 ( .A(n460), .B(n758), .Y(n757) );
  NOR3X1TS U1273 ( .A(cordic_FSM_state_reg[3]), .B(n778), .C(n622), .Y(
        beg_add_subt) );
  CLKBUFX2TS U1274 ( .A(n739), .Y(n745) );
  INVX2TS U1275 ( .A(n477), .Y(add_subt_dataA[56]) );
  INVX2TS U1276 ( .A(n478), .Y(add_subt_dataA[60]) );
  INVX2TS U1277 ( .A(n479), .Y(add_subt_dataA[61]) );
  CLKBUFX2TS U1278 ( .A(n480), .Y(n519) );
  BUFX3TS U1279 ( .A(n519), .Y(n565) );
  AOI222X1TS U1280 ( .A0(d_ff2_Y[57]), .A1(n565), .B0(d_ff2_X[57]), .B1(n487), 
        .C0(n745), .C1(d_ff2_Z[57]), .Y(n481) );
  INVX2TS U1281 ( .A(n481), .Y(add_subt_dataA[57]) );
  BUFX3TS U1282 ( .A(n745), .Y(n718) );
  CLKBUFX2TS U1283 ( .A(n578), .Y(n549) );
  AOI222X1TS U1284 ( .A0(n718), .A1(d_ff3_LUT_out[54]), .B0(n565), .B1(
        d_ff3_sh_x_out[54]), .C0(n549), .C1(d_ff3_sh_y_out[54]), .Y(n482) );
  INVX2TS U1285 ( .A(n482), .Y(add_subt_dataB[54]) );
  AOI222X1TS U1286 ( .A0(n718), .A1(d_ff3_LUT_out[50]), .B0(n565), .B1(
        d_ff3_sh_x_out[50]), .C0(n578), .C1(d_ff3_sh_y_out[50]), .Y(n483) );
  INVX2TS U1287 ( .A(n483), .Y(add_subt_dataB[50]) );
  AOI222X1TS U1288 ( .A0(n718), .A1(d_ff3_LUT_out[55]), .B0(n565), .B1(
        d_ff3_sh_x_out[55]), .C0(n487), .C1(d_ff3_sh_y_out[55]), .Y(n484) );
  INVX2TS U1289 ( .A(n484), .Y(add_subt_dataB[55]) );
  AOI222X1TS U1290 ( .A0(n718), .A1(d_ff3_LUT_out[53]), .B0(n565), .B1(
        d_ff3_sh_x_out[53]), .C0(n549), .C1(d_ff3_sh_y_out[53]), .Y(n485) );
  INVX2TS U1291 ( .A(n485), .Y(add_subt_dataB[53]) );
  AOI222X1TS U1292 ( .A0(n718), .A1(d_ff3_LUT_out[33]), .B0(n565), .B1(
        d_ff3_sh_x_out[33]), .C0(n578), .C1(d_ff3_sh_y_out[33]), .Y(n486) );
  INVX2TS U1293 ( .A(n486), .Y(add_subt_dataB[33]) );
  AOI222X1TS U1294 ( .A0(n718), .A1(d_ff3_LUT_out[56]), .B0(n565), .B1(
        d_ff3_sh_x_out[56]), .C0(n487), .C1(d_ff3_sh_y_out[56]), .Y(n488) );
  INVX2TS U1295 ( .A(n488), .Y(add_subt_dataB[56]) );
  NOR2X1TS U1296 ( .A(n773), .B(n615), .Y(n490) );
  BUFX3TS U1297 ( .A(n752), .Y(n507) );
  BUFX3TS U1298 ( .A(n756), .Y(n542) );
  BUFX3TS U1299 ( .A(n549), .Y(n541) );
  AOI222X1TS U1300 ( .A0(n507), .A1(d_ff3_LUT_out[6]), .B0(n542), .B1(
        d_ff3_sh_x_out[6]), .C0(n541), .C1(d_ff3_sh_y_out[6]), .Y(n491) );
  INVX2TS U1301 ( .A(n491), .Y(add_subt_dataB[6]) );
  AOI222X1TS U1302 ( .A0(n507), .A1(d_ff3_LUT_out[8]), .B0(n542), .B1(
        d_ff3_sh_x_out[8]), .C0(n541), .C1(d_ff3_sh_y_out[8]), .Y(n492) );
  INVX2TS U1303 ( .A(n492), .Y(add_subt_dataB[8]) );
  BUFX3TS U1304 ( .A(n756), .Y(n539) );
  BUFX3TS U1305 ( .A(n549), .Y(n538) );
  AOI222X1TS U1306 ( .A0(n507), .A1(d_ff3_LUT_out[2]), .B0(n539), .B1(
        d_ff3_sh_x_out[2]), .C0(n538), .C1(d_ff3_sh_y_out[2]), .Y(n493) );
  INVX2TS U1307 ( .A(n493), .Y(add_subt_dataB[2]) );
  AOI222X1TS U1308 ( .A0(n507), .A1(d_ff3_LUT_out[0]), .B0(n542), .B1(
        d_ff3_sh_x_out[0]), .C0(n541), .C1(d_ff3_sh_y_out[0]), .Y(n494) );
  INVX2TS U1309 ( .A(n494), .Y(add_subt_dataB[0]) );
  AOI222X1TS U1310 ( .A0(n507), .A1(d_ff3_LUT_out[5]), .B0(n542), .B1(
        d_ff3_sh_x_out[5]), .C0(n541), .C1(d_ff3_sh_y_out[5]), .Y(n495) );
  INVX2TS U1311 ( .A(n495), .Y(add_subt_dataB[5]) );
  AOI222X1TS U1312 ( .A0(n507), .A1(d_ff3_LUT_out[11]), .B0(n542), .B1(
        d_ff3_sh_x_out[11]), .C0(n541), .C1(d_ff3_sh_y_out[11]), .Y(n496) );
  INVX2TS U1313 ( .A(n496), .Y(add_subt_dataB[11]) );
  AOI222X1TS U1314 ( .A0(n507), .A1(d_ff3_LUT_out[3]), .B0(n542), .B1(
        d_ff3_sh_x_out[3]), .C0(n541), .C1(d_ff3_sh_y_out[3]), .Y(n497) );
  INVX2TS U1315 ( .A(n497), .Y(add_subt_dataB[3]) );
  BUFX3TS U1316 ( .A(n549), .Y(n568) );
  AOI222X1TS U1317 ( .A0(n507), .A1(d_ff3_LUT_out[13]), .B0(n539), .B1(
        d_ff3_sh_x_out[13]), .C0(n568), .C1(d_ff3_sh_y_out[13]), .Y(n498) );
  INVX2TS U1318 ( .A(n498), .Y(add_subt_dataB[13]) );
  AOI222X1TS U1319 ( .A0(n507), .A1(d_ff3_LUT_out[9]), .B0(n542), .B1(
        d_ff3_sh_x_out[9]), .C0(n541), .C1(d_ff3_sh_y_out[9]), .Y(n499) );
  INVX2TS U1320 ( .A(n499), .Y(add_subt_dataB[9]) );
  BUFX3TS U1321 ( .A(n752), .Y(n513) );
  AOI222X1TS U1322 ( .A0(n513), .A1(d_ff3_LUT_out[19]), .B0(n539), .B1(
        d_ff3_sh_x_out[19]), .C0(n538), .C1(d_ff3_sh_y_out[19]), .Y(n500) );
  INVX2TS U1323 ( .A(n500), .Y(add_subt_dataB[19]) );
  NOR2X2TS U1324 ( .A(n502), .B(n501), .Y(n693) );
  BUFX3TS U1325 ( .A(n519), .Y(n743) );
  CLKBUFX2TS U1326 ( .A(n743), .Y(n717) );
  BUFX3TS U1327 ( .A(n717), .Y(n569) );
  AOI222X1TS U1328 ( .A0(n513), .A1(d_ff3_LUT_out[15]), .B0(n569), .B1(
        d_ff3_sh_x_out[15]), .C0(n568), .C1(d_ff3_sh_y_out[15]), .Y(n503) );
  INVX2TS U1329 ( .A(n503), .Y(add_subt_dataB[15]) );
  AOI222X1TS U1330 ( .A0(n513), .A1(d_ff3_LUT_out[14]), .B0(n569), .B1(
        d_ff3_sh_x_out[14]), .C0(n568), .C1(d_ff3_sh_y_out[14]), .Y(n504) );
  INVX2TS U1331 ( .A(n504), .Y(add_subt_dataB[14]) );
  AOI222X1TS U1332 ( .A0(n513), .A1(d_ff3_LUT_out[23]), .B0(n569), .B1(
        d_ff3_sh_x_out[23]), .C0(n568), .C1(d_ff3_sh_y_out[23]), .Y(n505) );
  INVX2TS U1333 ( .A(n505), .Y(add_subt_dataB[23]) );
  AOI222X1TS U1334 ( .A0(n513), .A1(d_ff3_LUT_out[16]), .B0(n569), .B1(
        d_ff3_sh_x_out[16]), .C0(n568), .C1(d_ff3_sh_y_out[16]), .Y(n506) );
  INVX2TS U1335 ( .A(n506), .Y(add_subt_dataB[16]) );
  AOI222X1TS U1336 ( .A0(n507), .A1(d_ff3_LUT_out[18]), .B0(n569), .B1(
        d_ff3_sh_x_out[18]), .C0(n568), .C1(d_ff3_sh_y_out[18]), .Y(n508) );
  INVX2TS U1337 ( .A(n508), .Y(add_subt_dataB[18]) );
  AOI222X1TS U1338 ( .A0(n513), .A1(d_ff3_LUT_out[17]), .B0(n569), .B1(
        d_ff3_sh_x_out[17]), .C0(n568), .C1(d_ff3_sh_y_out[17]), .Y(n509) );
  INVX2TS U1339 ( .A(n509), .Y(add_subt_dataB[17]) );
  AOI222X1TS U1340 ( .A0(n513), .A1(d_ff3_LUT_out[12]), .B0(n569), .B1(
        d_ff3_sh_x_out[12]), .C0(n568), .C1(d_ff3_sh_y_out[12]), .Y(n510) );
  INVX2TS U1341 ( .A(n510), .Y(add_subt_dataB[12]) );
  CLKBUFX2TS U1342 ( .A(n743), .Y(n581) );
  BUFX3TS U1343 ( .A(n581), .Y(n572) );
  BUFX3TS U1344 ( .A(n578), .Y(n571) );
  AOI222X1TS U1345 ( .A0(n513), .A1(d_ff3_LUT_out[25]), .B0(n572), .B1(
        d_ff3_sh_x_out[25]), .C0(n571), .C1(d_ff3_sh_y_out[25]), .Y(n511) );
  INVX2TS U1346 ( .A(n511), .Y(add_subt_dataB[25]) );
  AOI222X1TS U1347 ( .A0(n513), .A1(d_ff3_LUT_out[21]), .B0(n572), .B1(
        d_ff3_sh_x_out[21]), .C0(n571), .C1(d_ff3_sh_y_out[21]), .Y(n512) );
  INVX2TS U1348 ( .A(n512), .Y(add_subt_dataB[21]) );
  AOI222X1TS U1349 ( .A0(n513), .A1(d_ff3_LUT_out[10]), .B0(n569), .B1(
        d_ff3_sh_x_out[10]), .C0(n568), .C1(d_ff3_sh_y_out[10]), .Y(n514) );
  INVX2TS U1350 ( .A(n514), .Y(add_subt_dataB[10]) );
  AOI222X1TS U1351 ( .A0(n718), .A1(d_ff3_LUT_out[31]), .B0(n572), .B1(
        d_ff3_sh_x_out[31]), .C0(n571), .C1(d_ff3_sh_y_out[31]), .Y(n515) );
  INVX2TS U1352 ( .A(n515), .Y(add_subt_dataB[31]) );
  AOI222X1TS U1353 ( .A0(n718), .A1(d_ff3_LUT_out[35]), .B0(n572), .B1(
        d_ff3_sh_x_out[35]), .C0(n571), .C1(d_ff3_sh_y_out[35]), .Y(n516) );
  INVX2TS U1354 ( .A(n516), .Y(add_subt_dataB[35]) );
  AOI222X1TS U1355 ( .A0(n718), .A1(d_ff3_LUT_out[45]), .B0(n572), .B1(
        d_ff3_sh_x_out[45]), .C0(n571), .C1(d_ff3_sh_y_out[45]), .Y(n517) );
  INVX2TS U1356 ( .A(n517), .Y(add_subt_dataB[45]) );
  BUFX3TS U1357 ( .A(n745), .Y(n543) );
  INVX2TS U1358 ( .A(n518), .Y(add_subt_dataA[53]) );
  BUFX3TS U1359 ( .A(n745), .Y(n536) );
  BUFX3TS U1360 ( .A(n519), .Y(n558) );
  BUFX3TS U1361 ( .A(n578), .Y(n557) );
  AOI222X1TS U1362 ( .A0(n536), .A1(d_ff2_Z[47]), .B0(n558), .B1(d_ff2_Y[47]), 
        .C0(n557), .C1(d_ff2_X[47]), .Y(n520) );
  INVX2TS U1363 ( .A(n520), .Y(add_subt_dataA[47]) );
  AOI222X1TS U1364 ( .A0(n536), .A1(d_ff2_Z[46]), .B0(n558), .B1(d_ff2_Y[46]), 
        .C0(n557), .C1(d_ff2_X[46]), .Y(n521) );
  INVX2TS U1365 ( .A(n521), .Y(add_subt_dataA[46]) );
  AOI222X1TS U1366 ( .A0(n536), .A1(d_ff2_Z[49]), .B0(n558), .B1(d_ff2_Y[49]), 
        .C0(n538), .C1(d_ff2_X[49]), .Y(n522) );
  INVX2TS U1367 ( .A(n522), .Y(add_subt_dataA[49]) );
  AOI222X1TS U1368 ( .A0(n536), .A1(d_ff2_Z[48]), .B0(n558), .B1(d_ff2_Y[48]), 
        .C0(n557), .C1(d_ff2_X[48]), .Y(n523) );
  INVX2TS U1369 ( .A(n523), .Y(add_subt_dataA[48]) );
  INVX2TS U1370 ( .A(n524), .Y(add_subt_dataA[55]) );
  AOI222X1TS U1371 ( .A0(n536), .A1(d_ff2_Z[50]), .B0(n539), .B1(d_ff2_Y[50]), 
        .C0(n538), .C1(d_ff2_X[50]), .Y(n525) );
  INVX2TS U1372 ( .A(n525), .Y(add_subt_dataA[50]) );
  AOI222X1TS U1373 ( .A0(n543), .A1(d_ff2_Z[63]), .B0(n542), .B1(d_ff2_Y[63]), 
        .C0(n541), .C1(d_ff2_X[63]), .Y(n526) );
  INVX2TS U1374 ( .A(n526), .Y(add_subt_dataA[63]) );
  AOI222X1TS U1375 ( .A0(n536), .A1(d_ff2_Z[45]), .B0(n558), .B1(d_ff2_Y[45]), 
        .C0(n557), .C1(d_ff2_X[45]), .Y(n527) );
  INVX2TS U1376 ( .A(n527), .Y(add_subt_dataA[45]) );
  INVX2TS U1377 ( .A(n528), .Y(add_subt_dataA[54]) );
  AOI222X1TS U1378 ( .A0(n536), .A1(d_ff2_Z[41]), .B0(n558), .B1(d_ff2_Y[41]), 
        .C0(n557), .C1(d_ff2_X[41]), .Y(n529) );
  INVX2TS U1379 ( .A(n529), .Y(add_subt_dataA[41]) );
  BUFX3TS U1380 ( .A(n717), .Y(n576) );
  BUFX3TS U1381 ( .A(n578), .Y(n575) );
  AOI222X1TS U1382 ( .A0(n543), .A1(d_ff2_Z[31]), .B0(n576), .B1(d_ff2_Y[31]), 
        .C0(n575), .C1(d_ff2_X[31]), .Y(n530) );
  INVX2TS U1383 ( .A(n530), .Y(add_subt_dataA[31]) );
  AOI222X1TS U1384 ( .A0(n543), .A1(d_ff2_Z[52]), .B0(n539), .B1(d_ff2_Y[52]), 
        .C0(n538), .C1(d_ff2_X[52]), .Y(n531) );
  INVX2TS U1385 ( .A(n531), .Y(add_subt_dataA[52]) );
  AOI222X1TS U1386 ( .A0(n543), .A1(d_ff2_Z[0]), .B0(n539), .B1(d_ff2_Y[0]), 
        .C0(n538), .C1(d_ff2_X[0]), .Y(n532) );
  INVX2TS U1387 ( .A(n532), .Y(add_subt_dataA[0]) );
  AOI222X1TS U1388 ( .A0(n543), .A1(d_ff3_LUT_out[7]), .B0(n542), .B1(
        d_ff3_sh_x_out[7]), .C0(n541), .C1(d_ff3_sh_y_out[7]), .Y(n533) );
  INVX2TS U1389 ( .A(n533), .Y(add_subt_dataB[7]) );
  AOI222X1TS U1390 ( .A0(n536), .A1(d_ff2_Z[44]), .B0(n558), .B1(d_ff2_Y[44]), 
        .C0(n557), .C1(d_ff2_X[44]), .Y(n534) );
  INVX2TS U1391 ( .A(n534), .Y(add_subt_dataA[44]) );
  AOI222X1TS U1392 ( .A0(n536), .A1(d_ff2_Z[43]), .B0(n558), .B1(d_ff2_Y[43]), 
        .C0(n557), .C1(d_ff2_X[43]), .Y(n535) );
  INVX2TS U1393 ( .A(n535), .Y(add_subt_dataA[43]) );
  AOI222X1TS U1394 ( .A0(n536), .A1(d_ff2_Z[42]), .B0(n558), .B1(d_ff2_Y[42]), 
        .C0(n557), .C1(d_ff2_X[42]), .Y(n537) );
  INVX2TS U1395 ( .A(n537), .Y(add_subt_dataA[42]) );
  AOI222X1TS U1396 ( .A0(n543), .A1(d_ff2_Z[51]), .B0(n539), .B1(d_ff2_Y[51]), 
        .C0(n538), .C1(d_ff2_X[51]), .Y(n540) );
  INVX2TS U1397 ( .A(n540), .Y(add_subt_dataA[51]) );
  AOI222X1TS U1398 ( .A0(n543), .A1(d_ff3_LUT_out[1]), .B0(n542), .B1(
        d_ff3_sh_x_out[1]), .C0(n541), .C1(d_ff3_sh_y_out[1]), .Y(n544) );
  INVX2TS U1399 ( .A(n544), .Y(add_subt_dataB[1]) );
  BUFX3TS U1400 ( .A(n739), .Y(n573) );
  AOI222X1TS U1401 ( .A0(n573), .A1(d_ff3_LUT_out[52]), .B0(n565), .B1(
        d_ff3_sh_x_out[52]), .C0(n578), .C1(d_ff3_sh_y_out[52]), .Y(n545) );
  INVX2TS U1402 ( .A(n545), .Y(add_subt_dataB[52]) );
  BUFX3TS U1403 ( .A(n739), .Y(n612) );
  AOI222X1TS U1404 ( .A0(n612), .A1(d_ff2_Z[32]), .B0(n576), .B1(d_ff2_Y[32]), 
        .C0(n575), .C1(d_ff2_X[32]), .Y(n546) );
  INVX2TS U1405 ( .A(n546), .Y(add_subt_dataA[32]) );
  AOI222X1TS U1406 ( .A0(n573), .A1(d_ff3_LUT_out[22]), .B0(n572), .B1(
        d_ff3_sh_x_out[22]), .C0(n571), .C1(d_ff3_sh_y_out[22]), .Y(n547) );
  INVX2TS U1407 ( .A(n547), .Y(add_subt_dataB[22]) );
  BUFX3TS U1408 ( .A(n739), .Y(n593) );
  BUFX3TS U1409 ( .A(n581), .Y(n598) );
  AOI222X1TS U1410 ( .A0(n593), .A1(d_ff2_Z[28]), .B0(n598), .B1(d_ff2_Y[28]), 
        .C0(n575), .C1(d_ff2_X[28]), .Y(n548) );
  INVX2TS U1411 ( .A(n548), .Y(add_subt_dataA[28]) );
  AOI222X1TS U1412 ( .A0(n573), .A1(d_ff3_LUT_out[41]), .B0(n565), .B1(
        d_ff3_sh_x_out[41]), .C0(n549), .C1(d_ff3_sh_y_out[41]), .Y(n550) );
  INVX2TS U1413 ( .A(n550), .Y(add_subt_dataB[41]) );
  AOI222X1TS U1414 ( .A0(n612), .A1(d_ff2_Z[38]), .B0(n576), .B1(d_ff2_Y[38]), 
        .C0(n557), .C1(d_ff2_X[38]), .Y(n551) );
  INVX2TS U1415 ( .A(n551), .Y(add_subt_dataA[38]) );
  AOI222X1TS U1416 ( .A0(n612), .A1(d_ff2_Z[39]), .B0(n576), .B1(d_ff2_Y[39]), 
        .C0(n575), .C1(d_ff2_X[39]), .Y(n552) );
  INVX2TS U1417 ( .A(n552), .Y(add_subt_dataA[39]) );
  AOI222X1TS U1418 ( .A0(n612), .A1(d_ff2_Z[34]), .B0(n576), .B1(d_ff2_Y[34]), 
        .C0(n575), .C1(d_ff2_X[34]), .Y(n553) );
  INVX2TS U1419 ( .A(n553), .Y(add_subt_dataA[34]) );
  AOI222X1TS U1420 ( .A0(n612), .A1(d_ff2_Z[35]), .B0(n576), .B1(d_ff2_Y[35]), 
        .C0(n575), .C1(d_ff2_X[35]), .Y(n554) );
  INVX2TS U1421 ( .A(n554), .Y(add_subt_dataA[35]) );
  AOI222X1TS U1422 ( .A0(n593), .A1(d_ff2_Z[30]), .B0(n576), .B1(d_ff2_Y[30]), 
        .C0(n575), .C1(d_ff2_X[30]), .Y(n555) );
  INVX2TS U1423 ( .A(n555), .Y(add_subt_dataA[30]) );
  AOI222X1TS U1424 ( .A0(n612), .A1(d_ff2_Z[37]), .B0(n576), .B1(d_ff2_Y[37]), 
        .C0(n575), .C1(d_ff2_X[37]), .Y(n556) );
  INVX2TS U1425 ( .A(n556), .Y(add_subt_dataA[37]) );
  AOI222X1TS U1426 ( .A0(n612), .A1(d_ff2_Z[40]), .B0(n558), .B1(d_ff2_Y[40]), 
        .C0(n557), .C1(d_ff2_X[40]), .Y(n559) );
  INVX2TS U1427 ( .A(n559), .Y(add_subt_dataA[40]) );
  AOI222X1TS U1428 ( .A0(n612), .A1(d_ff2_Z[36]), .B0(n576), .B1(d_ff2_Y[36]), 
        .C0(n575), .C1(d_ff2_X[36]), .Y(n560) );
  INVX2TS U1429 ( .A(n560), .Y(add_subt_dataA[36]) );
  AOI222X1TS U1430 ( .A0(n573), .A1(d_ff3_LUT_out[26]), .B0(n572), .B1(
        d_ff3_sh_x_out[26]), .C0(n571), .C1(d_ff3_sh_y_out[26]), .Y(n561) );
  INVX2TS U1431 ( .A(n561), .Y(add_subt_dataB[26]) );
  AOI222X1TS U1432 ( .A0(n573), .A1(d_ff3_LUT_out[39]), .B0(n569), .B1(
        d_ff3_sh_x_out[39]), .C0(n578), .C1(d_ff3_sh_y_out[39]), .Y(n562) );
  INVX2TS U1433 ( .A(n562), .Y(add_subt_dataB[39]) );
  AOI222X1TS U1434 ( .A0(n573), .A1(d_ff3_LUT_out[29]), .B0(n572), .B1(
        d_ff3_sh_x_out[29]), .C0(n571), .C1(d_ff3_sh_y_out[29]), .Y(n563) );
  INVX2TS U1435 ( .A(n563), .Y(add_subt_dataB[29]) );
  AOI222X1TS U1436 ( .A0(n573), .A1(d_ff3_LUT_out[37]), .B0(n565), .B1(
        d_ff3_sh_x_out[37]), .C0(n564), .C1(d_ff3_sh_y_out[37]), .Y(n566) );
  INVX2TS U1437 ( .A(n566), .Y(add_subt_dataB[37]) );
  AOI222X1TS U1438 ( .A0(n573), .A1(d_ff3_LUT_out[20]), .B0(n572), .B1(
        d_ff3_sh_x_out[20]), .C0(n571), .C1(d_ff3_sh_y_out[20]), .Y(n567) );
  INVX2TS U1439 ( .A(n567), .Y(add_subt_dataB[20]) );
  AOI222X1TS U1440 ( .A0(n573), .A1(d_ff3_LUT_out[27]), .B0(n569), .B1(
        d_ff3_sh_x_out[27]), .C0(n568), .C1(d_ff3_sh_y_out[27]), .Y(n570) );
  INVX2TS U1441 ( .A(n570), .Y(add_subt_dataB[27]) );
  AOI222X1TS U1442 ( .A0(n573), .A1(d_ff3_LUT_out[24]), .B0(n572), .B1(
        d_ff3_sh_x_out[24]), .C0(n571), .C1(d_ff3_sh_y_out[24]), .Y(n574) );
  INVX2TS U1443 ( .A(n574), .Y(add_subt_dataB[24]) );
  AOI222X1TS U1444 ( .A0(n612), .A1(d_ff2_Z[33]), .B0(n576), .B1(d_ff2_Y[33]), 
        .C0(n575), .C1(d_ff2_X[33]), .Y(n577) );
  INVX2TS U1445 ( .A(n577), .Y(add_subt_dataA[33]) );
  BUFX3TS U1446 ( .A(n578), .Y(n740) );
  CLKBUFX2TS U1447 ( .A(n740), .Y(n754) );
  BUFX3TS U1448 ( .A(n754), .Y(n600) );
  AOI222X1TS U1449 ( .A0(n593), .A1(d_ff2_Z[26]), .B0(n598), .B1(d_ff2_Y[26]), 
        .C0(n600), .C1(d_ff2_X[26]), .Y(n579) );
  INVX2TS U1450 ( .A(n579), .Y(add_subt_dataA[26]) );
  AOI222X1TS U1451 ( .A0(n593), .A1(d_ff2_Z[25]), .B0(n598), .B1(d_ff2_Y[25]), 
        .C0(n600), .C1(d_ff2_X[25]), .Y(n580) );
  INVX2TS U1452 ( .A(n580), .Y(add_subt_dataA[25]) );
  BUFX3TS U1453 ( .A(n752), .Y(n610) );
  BUFX3TS U1454 ( .A(n581), .Y(n603) );
  BUFX3TS U1455 ( .A(n754), .Y(n602) );
  AOI222X1TS U1456 ( .A0(n610), .A1(d_ff2_Z[16]), .B0(n603), .B1(d_ff2_Y[16]), 
        .C0(n602), .C1(d_ff2_X[16]), .Y(n582) );
  INVX2TS U1457 ( .A(n582), .Y(add_subt_dataA[16]) );
  AOI222X1TS U1458 ( .A0(n593), .A1(d_ff2_Z[27]), .B0(n598), .B1(d_ff2_Y[27]), 
        .C0(n600), .C1(d_ff2_X[27]), .Y(n583) );
  INVX2TS U1459 ( .A(n583), .Y(add_subt_dataA[27]) );
  BUFX3TS U1460 ( .A(n752), .Y(n753) );
  CLKBUFX2TS U1461 ( .A(n743), .Y(n746) );
  BUFX3TS U1462 ( .A(n746), .Y(n750) );
  AOI222X1TS U1463 ( .A0(n753), .A1(d_ff2_Z[5]), .B0(n750), .B1(d_ff2_Y[5]), 
        .C0(n602), .C1(d_ff2_X[5]), .Y(n584) );
  INVX2TS U1464 ( .A(n584), .Y(add_subt_dataA[5]) );
  AOI222X1TS U1465 ( .A0(n593), .A1(d_ff2_Z[23]), .B0(n598), .B1(d_ff2_Y[23]), 
        .C0(n600), .C1(d_ff2_X[23]), .Y(n585) );
  INVX2TS U1466 ( .A(n585), .Y(add_subt_dataA[23]) );
  AOI222X1TS U1467 ( .A0(n753), .A1(d_ff2_Z[8]), .B0(n603), .B1(d_ff2_Y[8]), 
        .C0(n602), .C1(d_ff2_X[8]), .Y(n586) );
  INVX2TS U1468 ( .A(n586), .Y(add_subt_dataA[8]) );
  AOI222X1TS U1469 ( .A0(n753), .A1(d_ff2_Z[7]), .B0(n603), .B1(d_ff2_Y[7]), 
        .C0(n602), .C1(d_ff2_X[7]), .Y(n587) );
  INVX2TS U1470 ( .A(n587), .Y(add_subt_dataA[7]) );
  AOI222X1TS U1471 ( .A0(n593), .A1(d_ff2_Z[22]), .B0(n598), .B1(d_ff2_Y[22]), 
        .C0(n600), .C1(d_ff2_X[22]), .Y(n588) );
  INVX2TS U1472 ( .A(n588), .Y(add_subt_dataA[22]) );
  AOI222X1TS U1473 ( .A0(n593), .A1(d_ff2_Z[29]), .B0(n598), .B1(d_ff2_Y[29]), 
        .C0(n600), .C1(d_ff2_X[29]), .Y(n589) );
  INVX2TS U1474 ( .A(n589), .Y(add_subt_dataA[29]) );
  AOI222X1TS U1475 ( .A0(n753), .A1(d_ff2_Z[2]), .B0(n603), .B1(d_ff2_Y[2]), 
        .C0(n602), .C1(d_ff2_X[2]), .Y(n590) );
  INVX2TS U1476 ( .A(n590), .Y(add_subt_dataA[2]) );
  AOI222X1TS U1477 ( .A0(n593), .A1(d_ff2_Z[21]), .B0(n598), .B1(d_ff2_Y[21]), 
        .C0(n600), .C1(d_ff2_X[21]), .Y(n591) );
  INVX2TS U1478 ( .A(n591), .Y(add_subt_dataA[21]) );
  AOI222X1TS U1479 ( .A0(n610), .A1(d_ff2_Z[14]), .B0(n603), .B1(d_ff2_Y[14]), 
        .C0(n602), .C1(d_ff2_X[14]), .Y(n592) );
  INVX2TS U1480 ( .A(n592), .Y(add_subt_dataA[14]) );
  AOI222X1TS U1481 ( .A0(n593), .A1(d_ff2_Z[24]), .B0(n598), .B1(d_ff2_Y[24]), 
        .C0(n600), .C1(d_ff2_X[24]), .Y(n594) );
  INVX2TS U1482 ( .A(n594), .Y(add_subt_dataA[24]) );
  AOI222X1TS U1483 ( .A0(n610), .A1(d_ff2_Z[15]), .B0(n603), .B1(d_ff2_Y[15]), 
        .C0(n602), .C1(d_ff2_X[15]), .Y(n595) );
  INVX2TS U1484 ( .A(n595), .Y(add_subt_dataA[15]) );
  AOI222X1TS U1485 ( .A0(n753), .A1(d_ff2_Z[3]), .B0(n603), .B1(d_ff2_Y[3]), 
        .C0(n602), .C1(d_ff2_X[3]), .Y(n596) );
  INVX2TS U1486 ( .A(n596), .Y(add_subt_dataA[3]) );
  AOI222X1TS U1487 ( .A0(n610), .A1(d_ff2_Z[19]), .B0(n603), .B1(d_ff2_Y[19]), 
        .C0(n602), .C1(d_ff2_X[19]), .Y(n597) );
  INVX2TS U1488 ( .A(n597), .Y(add_subt_dataA[19]) );
  AOI222X1TS U1489 ( .A0(n610), .A1(d_ff2_Z[20]), .B0(n598), .B1(d_ff2_Y[20]), 
        .C0(n600), .C1(d_ff2_X[20]), .Y(n599) );
  INVX2TS U1490 ( .A(n599), .Y(add_subt_dataA[20]) );
  AOI222X1TS U1491 ( .A0(n610), .A1(d_ff2_Z[18]), .B0(n603), .B1(d_ff2_Y[18]), 
        .C0(n600), .C1(d_ff2_X[18]), .Y(n601) );
  INVX2TS U1492 ( .A(n601), .Y(add_subt_dataA[18]) );
  AOI222X1TS U1493 ( .A0(n610), .A1(d_ff2_Z[17]), .B0(n603), .B1(d_ff2_Y[17]), 
        .C0(n602), .C1(d_ff2_X[17]), .Y(n604) );
  INVX2TS U1494 ( .A(n604), .Y(add_subt_dataA[17]) );
  BUFX3TS U1495 ( .A(n754), .Y(n749) );
  AOI222X1TS U1496 ( .A0(n753), .A1(d_ff2_Z[9]), .B0(n750), .B1(d_ff2_Y[9]), 
        .C0(n749), .C1(d_ff2_X[9]), .Y(n605) );
  INVX2TS U1497 ( .A(n605), .Y(add_subt_dataA[9]) );
  AOI222X1TS U1498 ( .A0(n610), .A1(d_ff2_Z[11]), .B0(n750), .B1(d_ff2_Y[11]), 
        .C0(n749), .C1(d_ff2_X[11]), .Y(n606) );
  INVX2TS U1499 ( .A(n606), .Y(add_subt_dataA[11]) );
  AOI222X1TS U1500 ( .A0(n753), .A1(d_ff2_Z[10]), .B0(n750), .B1(d_ff2_Y[10]), 
        .C0(n749), .C1(d_ff2_X[10]), .Y(n607) );
  INVX2TS U1501 ( .A(n607), .Y(add_subt_dataA[10]) );
  AOI222X1TS U1502 ( .A0(n753), .A1(d_ff2_Z[1]), .B0(n750), .B1(d_ff2_Y[1]), 
        .C0(n749), .C1(d_ff2_X[1]), .Y(n608) );
  INVX2TS U1503 ( .A(n608), .Y(add_subt_dataA[1]) );
  AOI222X1TS U1504 ( .A0(n610), .A1(d_ff2_Z[12]), .B0(n750), .B1(d_ff2_Y[12]), 
        .C0(n749), .C1(d_ff2_X[12]), .Y(n609) );
  INVX2TS U1505 ( .A(n609), .Y(add_subt_dataA[12]) );
  AOI222X1TS U1506 ( .A0(n610), .A1(d_ff2_Z[13]), .B0(n750), .B1(d_ff2_Y[13]), 
        .C0(n749), .C1(d_ff2_X[13]), .Y(n611) );
  INVX2TS U1507 ( .A(n611), .Y(add_subt_dataA[13]) );
  AOI222X1TS U1508 ( .A0(n612), .A1(d_ff2_Z[6]), .B0(n750), .B1(d_ff2_Y[6]), 
        .C0(n749), .C1(d_ff2_X[6]), .Y(n613) );
  INVX2TS U1509 ( .A(n613), .Y(add_subt_dataA[6]) );
  AOI222X1TS U1510 ( .A0(n753), .A1(d_ff2_Z[4]), .B0(n750), .B1(d_ff2_Y[4]), 
        .C0(n749), .C1(d_ff2_X[4]), .Y(n614) );
  INVX2TS U1511 ( .A(n614), .Y(add_subt_dataA[4]) );
  NAND2X1TS U1512 ( .A(n772), .B(n769), .Y(n638) );
  NOR2X1TS U1513 ( .A(n615), .B(n621), .Y(n619) );
  INVX2TS U1514 ( .A(n857), .Y(n623) );
  NAND4BX1TS U1515 ( .AN(ack_cordic), .B(cordic_FSM_state_reg[2]), .C(
        cordic_FSM_state_reg[3]), .D(n769), .Y(n630) );
  AOI32X1TS U1516 ( .A0(cordic_FSM_state_reg[3]), .A1(n630), .A2(n616), .B0(
        cordic_FSM_state_reg[0]), .B1(n630), .Y(n617) );
  NOR4X1TS U1517 ( .A(n619), .B(n623), .C(n640), .D(n617), .Y(n618) );
  OAI31X1TS U1518 ( .A0(cordic_FSM_state_reg[2]), .A1(beg_fsm_cordic), .A2(
        n638), .B0(n618), .Y(n293) );
  NOR2XLTS U1519 ( .A(n455), .B(n770), .Y(n860) );
  NOR3XLTS U1520 ( .A(cordic_FSM_state_reg[2]), .B(n772), .C(n622), .Y(
        enab_dff_5) );
  NOR2XLTS U1521 ( .A(n772), .B(n857), .Y(enab_d_ff5_data_out) );
  NOR2XLTS U1522 ( .A(n445), .B(data_out_LUT[53]), .Y(n859) );
  NOR2X1TS U1523 ( .A(cont_iter_out[2]), .B(n620), .Y(n632) );
  NOR2XLTS U1524 ( .A(n445), .B(data_out_LUT[54]), .Y(n858) );
  OAI2BB2XLTS U1525 ( .B0(cordic_FSM_state_reg[1]), .B1(ack_cordic), .A0N(n772), .A1N(n622), .Y(n624) );
  AOI21X1TS U1526 ( .A0(cordic_FSM_state_reg[2]), .A1(n624), .B0(n623), .Y(
        n625) );
  INVX2TS U1527 ( .A(beg_add_subt), .Y(n629) );
  OAI211XLTS U1528 ( .A0(n631), .A1(n772), .B0(n630), .C0(n629), .Y(n291) );
  OAI21XLTS U1529 ( .A0(cont_iter_out[2]), .A1(n775), .B0(n693), .Y(
        data_out_LUT[5]) );
  OAI211XLTS U1530 ( .A0(n632), .A1(n454), .B0(n693), .C0(data_out_LUT[50]), 
        .Y(data_out_LUT[10]) );
  OAI21XLTS U1532 ( .A0(n446), .A1(n680), .B0(cont_iter_out[3]), .Y(n635) );
  NAND2X1TS U1533 ( .A(n634), .B(n633), .Y(n696) );
  AOI21X1TS U1534 ( .A0(n635), .A1(n696), .B0(n445), .Y(n861) );
  INVX2TS U1535 ( .A(beg_fsm_cordic), .Y(n637) );
  NAND2X1TS U1536 ( .A(cordic_FSM_state_reg[1]), .B(n772), .Y(n636) );
  OR4X2TS U1537 ( .A(load_cont_var), .B(ack_add_subt), .C(n640), .D(n639), .Y(
        cordic_FSM_state_next_1_) );
  BUFX3TS U1538 ( .A(n659), .Y(n709) );
  CLKAND2X2TS U1539 ( .A(d_ff_Yn[0]), .B(n456), .Y(first_mux_Y[0]) );
  INVX2TS U1540 ( .A(n709), .Y(n643) );
  INVX2TS U1541 ( .A(n659), .Y(n716) );
  INVX2TS U1542 ( .A(n709), .Y(n641) );
  INVX2TS U1543 ( .A(n709), .Y(n642) );
  INVX2TS U1544 ( .A(n709), .Y(n644) );
  INVX2TS U1545 ( .A(n712), .Y(n645) );
  INVX2TS U1546 ( .A(n709), .Y(n652) );
  INVX2TS U1547 ( .A(n659), .Y(n660) );
  CLKBUFX2TS U1548 ( .A(n854), .Y(n649) );
  CLKBUFX2TS U1549 ( .A(n649), .Y(n647) );
  INVX2TS U1550 ( .A(n712), .Y(n646) );
  INVX2TS U1551 ( .A(n712), .Y(n648) );
  INVX2TS U1552 ( .A(n712), .Y(n650) );
  BUFX3TS U1553 ( .A(n659), .Y(n651) );
  INVX2TS U1554 ( .A(n659), .Y(n653) );
  BUFX3TS U1555 ( .A(n647), .Y(n654) );
  INVX2TS U1556 ( .A(n659), .Y(n655) );
  BUFX3TS U1557 ( .A(n659), .Y(n656) );
  INVX2TS U1558 ( .A(n659), .Y(n657) );
  BUFX3TS U1559 ( .A(n854), .Y(n658) );
  BUFX3TS U1560 ( .A(n785), .Y(n671) );
  INVX2TS U1561 ( .A(n671), .Y(n661) );
  INVX2TS U1562 ( .A(n671), .Y(n662) );
  BUFX3TS U1563 ( .A(n671), .Y(n663) );
  INVX2TS U1564 ( .A(n785), .Y(n664) );
  BUFX3TS U1565 ( .A(n666), .Y(n665) );
  INVX2TS U1566 ( .A(n671), .Y(n667) );
  BUFX3TS U1567 ( .A(n666), .Y(n668) );
  INVX2TS U1568 ( .A(n671), .Y(n669) );
  BUFX3TS U1569 ( .A(n671), .Y(n670) );
  INVX2TS U1570 ( .A(n671), .Y(n672) );
  BUFX3TS U1571 ( .A(n671), .Y(n673) );
  CLKBUFX2TS U1572 ( .A(n785), .Y(n674) );
  AOI32X1TS U1573 ( .A0(d_ff1_shift_region_flag_out[1]), .A1(n781), .A2(
        d_ff1_operation_out), .B0(n676), .B1(d_ff1_shift_region_flag_out[0]), 
        .Y(n677) );
  XNOR2X1TS U1574 ( .A(data_output2_63_), .B(n677), .Y(sign_inv_out[63]) );
  NAND2X1TS U1575 ( .A(n682), .B(n700), .Y(n678) );
  INVX2TS U1576 ( .A(n700), .Y(n684) );
  NAND2X1TS U1577 ( .A(n682), .B(n684), .Y(data_out_LUT[2]) );
  NAND2X1TS U1578 ( .A(cont_iter_out[2]), .B(cont_iter_out[3]), .Y(n698) );
  NAND3X1TS U1579 ( .A(n784), .B(cont_iter_out[3]), .C(n683), .Y(n691) );
  OA21XLTS U1580 ( .A0(n684), .A1(n775), .B0(n691), .Y(n707) );
  INVX2TS U1581 ( .A(data_out_LUT[22]), .Y(n697) );
  NAND2X1TS U1582 ( .A(n692), .B(n697), .Y(data_out_LUT[8]) );
  OAI2BB1X1TS U1583 ( .A0N(n686), .A1N(n700), .B0(n685), .Y(data_out_LUT[9])
         );
  NAND2X1TS U1584 ( .A(n700), .B(n686), .Y(n687) );
  OA21XLTS U1585 ( .A0(n688), .A1(n454), .B0(n696), .Y(n689) );
  NAND2X1TS U1586 ( .A(n695), .B(data_out_LUT[22]), .Y(data_out_LUT[21]) );
  NAND2X1TS U1587 ( .A(n702), .B(data_out_LUT[47]), .Y(data_out_LUT[30]) );
  NAND2X1TS U1588 ( .A(cont_iter_out[2]), .B(n775), .Y(data_out_LUT[37]) );
  NAND2X1TS U1589 ( .A(n702), .B(n678), .Y(data_out_LUT[41]) );
  OAI21XLTS U1590 ( .A0(n705), .A1(n775), .B0(n446), .Y(n706) );
  INVX2TS U1591 ( .A(n709), .Y(n710) );
  INVX2TS U1592 ( .A(n709), .Y(n715) );
  CLKAND2X2TS U1593 ( .A(d_ff_Xn[37]), .B(n456), .Y(first_mux_X[37]) );
  AOI22X1TS U1594 ( .A0(n717), .A1(d_ff3_sh_x_out[61]), .B0(n740), .B1(
        d_ff3_sh_y_out[61]), .Y(n719) );
  NAND2X2TS U1595 ( .A(n718), .B(d_ff3_LUT_out[48]), .Y(n726) );
  NAND2X1TS U1596 ( .A(n719), .B(n726), .Y(add_subt_dataB[61]) );
  AOI22X1TS U1597 ( .A0(n717), .A1(d_ff3_sh_x_out[60]), .B0(n740), .B1(
        d_ff3_sh_y_out[60]), .Y(n720) );
  NAND2X1TS U1598 ( .A(n720), .B(n726), .Y(add_subt_dataB[60]) );
  AOI22X1TS U1599 ( .A0(n581), .A1(d_ff3_sh_x_out[59]), .B0(n740), .B1(
        d_ff3_sh_y_out[59]), .Y(n721) );
  NAND2X1TS U1600 ( .A(n721), .B(n726), .Y(add_subt_dataB[59]) );
  AOI22X1TS U1601 ( .A0(n717), .A1(d_ff3_sh_x_out[58]), .B0(n740), .B1(
        d_ff3_sh_y_out[58]), .Y(n722) );
  NAND2X1TS U1602 ( .A(n722), .B(n726), .Y(add_subt_dataB[58]) );
  AOI22X1TS U1603 ( .A0(n581), .A1(d_ff3_sh_x_out[57]), .B0(n740), .B1(
        d_ff3_sh_y_out[57]), .Y(n723) );
  NAND2X1TS U1604 ( .A(n723), .B(n726), .Y(add_subt_dataB[57]) );
  BUFX3TS U1605 ( .A(n754), .Y(n742) );
  AOI22X1TS U1606 ( .A0(n717), .A1(d_ff3_sh_x_out[51]), .B0(n742), .B1(
        d_ff3_sh_y_out[51]), .Y(n724) );
  NAND2X1TS U1607 ( .A(n724), .B(n726), .Y(add_subt_dataB[51]) );
  AOI22X1TS U1608 ( .A0(n743), .A1(d_ff3_sh_x_out[49]), .B0(n742), .B1(
        d_ff3_sh_y_out[49]), .Y(n725) );
  NAND2X1TS U1609 ( .A(n752), .B(d_ff3_LUT_out[49]), .Y(n731) );
  NAND2X1TS U1610 ( .A(n725), .B(n731), .Y(add_subt_dataB[49]) );
  AOI22X1TS U1611 ( .A0(n746), .A1(d_ff3_sh_x_out[48]), .B0(n740), .B1(
        d_ff3_sh_y_out[48]), .Y(n727) );
  NAND2X1TS U1612 ( .A(n727), .B(n726), .Y(add_subt_dataB[48]) );
  AOI22X1TS U1613 ( .A0(n743), .A1(d_ff3_sh_x_out[47]), .B0(n742), .B1(
        d_ff3_sh_y_out[47]), .Y(n728) );
  OAI2BB1X1TS U1614 ( .A0N(n729), .A1N(d_ff3_LUT_out[47]), .B0(n728), .Y(
        add_subt_dataB[47]) );
  AOI22X1TS U1615 ( .A0(n743), .A1(d_ff3_sh_x_out[46]), .B0(n742), .B1(
        d_ff3_sh_y_out[46]), .Y(n730) );
  NAND2X1TS U1616 ( .A(n730), .B(n731), .Y(add_subt_dataB[46]) );
  AOI22X1TS U1617 ( .A0(n519), .A1(d_ff3_sh_x_out[44]), .B0(n740), .B1(
        d_ff3_sh_y_out[44]), .Y(n732) );
  NAND2X1TS U1618 ( .A(n732), .B(n731), .Y(add_subt_dataB[44]) );
  AOI22X1TS U1619 ( .A0(n743), .A1(d_ff3_sh_x_out[43]), .B0(n742), .B1(
        d_ff3_sh_y_out[43]), .Y(n733) );
  OAI2BB1X1TS U1620 ( .A0N(n739), .A1N(d_ff3_LUT_out[43]), .B0(n733), .Y(
        add_subt_dataB[43]) );
  AOI22X1TS U1621 ( .A0(n743), .A1(d_ff3_sh_x_out[42]), .B0(n742), .B1(
        d_ff3_sh_y_out[42]), .Y(n734) );
  OAI2BB1X1TS U1622 ( .A0N(n739), .A1N(d_ff3_LUT_out[47]), .B0(n734), .Y(
        add_subt_dataB[42]) );
  AOI22X1TS U1623 ( .A0(n746), .A1(d_ff3_sh_x_out[40]), .B0(n742), .B1(
        d_ff3_sh_y_out[40]), .Y(n735) );
  NAND2X1TS U1624 ( .A(n752), .B(d_ff3_LUT_out[40]), .Y(n747) );
  NAND2X1TS U1625 ( .A(n735), .B(n747), .Y(add_subt_dataB[40]) );
  AOI22X1TS U1626 ( .A0(n519), .A1(d_ff3_sh_x_out[38]), .B0(n740), .B1(
        d_ff3_sh_y_out[38]), .Y(n736) );
  OAI2BB1X1TS U1627 ( .A0N(n739), .A1N(d_ff3_LUT_out[38]), .B0(n736), .Y(
        add_subt_dataB[38]) );
  AOI22X1TS U1628 ( .A0(n746), .A1(d_ff3_sh_x_out[36]), .B0(n742), .B1(
        d_ff3_sh_y_out[36]), .Y(n737) );
  NAND2X1TS U1629 ( .A(n737), .B(n747), .Y(add_subt_dataB[36]) );
  AOI22X1TS U1630 ( .A0(n743), .A1(d_ff3_sh_x_out[34]), .B0(n742), .B1(
        d_ff3_sh_y_out[34]), .Y(n738) );
  OAI2BB1X1TS U1631 ( .A0N(n739), .A1N(d_ff3_LUT_out[43]), .B0(n738), .Y(
        add_subt_dataB[34]) );
  AOI22X1TS U1632 ( .A0(n519), .A1(d_ff3_sh_x_out[32]), .B0(n740), .B1(
        d_ff3_sh_y_out[32]), .Y(n741) );
  OAI2BB1X1TS U1633 ( .A0N(n752), .A1N(d_ff3_LUT_out[38]), .B0(n741), .Y(
        add_subt_dataB[32]) );
  AOI22X1TS U1634 ( .A0(n743), .A1(d_ff3_sh_x_out[30]), .B0(n742), .B1(
        d_ff3_sh_y_out[30]), .Y(n744) );
  OAI2BB1X1TS U1635 ( .A0N(n745), .A1N(d_ff3_LUT_out[30]), .B0(n744), .Y(
        add_subt_dataB[30]) );
  AOI22X1TS U1636 ( .A0(n746), .A1(d_ff3_sh_x_out[28]), .B0(n749), .B1(
        d_ff3_sh_y_out[28]), .Y(n748) );
  NAND2X1TS U1637 ( .A(n748), .B(n747), .Y(add_subt_dataB[28]) );
  AOI22X1TS U1638 ( .A0(n750), .A1(d_ff3_sh_x_out[4]), .B0(n749), .B1(
        d_ff3_sh_y_out[4]), .Y(n751) );
  OAI2BB1X1TS U1639 ( .A0N(n752), .A1N(d_ff3_LUT_out[30]), .B0(n751), .Y(
        add_subt_dataB[4]) );
  AOI22X1TS U1640 ( .A0(d_ff2_X[59]), .A1(n754), .B0(n753), .B1(d_ff2_Z[59]), 
        .Y(n755) );
  OAI2BB1X1TS U1641 ( .A0N(d_ff2_Y[59]), .A1N(n756), .B0(n755), .Y(
        add_subt_dataA[59]) );
  XNOR2X1TS U1642 ( .A(cont_var_out[0]), .B(d_ff3_sign_out), .Y(op_add_subt)
         );
  NOR2BX1TS U1644 ( .AN(n761), .B(d_ff2_Y[61]), .Y(n762) );
  NOR2BX1TS U1645 ( .AN(n767), .B(d_ff2_X[61]), .Y(n768) );
initial $sdf_annotate("CORDIC_Arch2v1_ASIC_fpu_syn_constraints_clk10.tcl_GATED_syn.sdf"); 
 endmodule

