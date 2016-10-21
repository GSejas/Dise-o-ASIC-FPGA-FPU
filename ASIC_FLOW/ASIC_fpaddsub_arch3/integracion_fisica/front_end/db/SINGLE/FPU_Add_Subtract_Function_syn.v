/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Oct 20 23:54:58 2016
/////////////////////////////////////////////////////////////


module FSM_Add_Subtract ( clk, rst, rst_FSM, beg_FSM, zero_flag_i, 
        norm_iteration_i, add_overflow_i, round_i, load_1_o, load_2_o, 
        load_3_o, load_8_o, A_S_op_o, load_4_o, left_right_o, bit_shift_o, 
        load_5_o, load_6_o, load_7_o, ctrl_a_o, ctrl_b_o, ctrl_b_load_o, 
        ctrl_c_o, ctrl_d_o, ready, rst_int_BAR );
  output [1:0] ctrl_b_o;
  input clk, rst, rst_FSM, beg_FSM, zero_flag_i, norm_iteration_i,
         add_overflow_i, round_i;
  output load_1_o, load_2_o, load_3_o, load_8_o, A_S_op_o, load_4_o,
         left_right_o, bit_shift_o, load_5_o, load_6_o, load_7_o, ctrl_a_o,
         ctrl_b_load_o, ctrl_c_o, ctrl_d_o, ready, rst_int_BAR;
  wire   n1, n5, n14, n45, n46, n47, n48, n3, n4, n6, n7, n8, n9, n10, n11,
         n12, n13, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [3:0] state_reg;

  DFFRXLTS state_reg_reg_0_ ( .D(n48), .CK(clk), .RN(n1), .Q(state_reg[0]), 
        .QN(n36) );
  DFFRXLTS state_reg_reg_3_ ( .D(n47), .CK(clk), .RN(n1), .Q(state_reg[3]), 
        .QN(n35) );
  DFFRXLTS state_reg_reg_2_ ( .D(n45), .CK(clk), .RN(n1), .Q(n34), .QN(n5) );
  DFFRXLTS state_reg_reg_1_ ( .D(n46), .CK(clk), .RN(n1), .Q(n33), .QN(n14) );
  NOR3XLTS U3 ( .A(ctrl_b_load_o), .B(load_5_o), .C(n4), .Y(n6) );
  NAND4XLTS U4 ( .A(add_overflow_i), .B(n7), .C(n10), .D(n16), .Y(n4) );
  NOR2XLTS U5 ( .A(n26), .B(n24), .Y(load_6_o) );
  INVX2TS U6 ( .A(load_5_o), .Y(n19) );
  NAND2BXLTS U7 ( .AN(n24), .B(n33), .Y(n30) );
  AOI2BB1XLTS U8 ( .A0N(n10), .A1N(n26), .B0(n9), .Y(n32) );
  OR2X1TS U9 ( .A(n7), .B(n26), .Y(rst_int_BAR) );
  NAND4XLTS U10 ( .A(n32), .B(n31), .C(n30), .D(n29), .Y(n47) );
  AOI31XLTS U11 ( .A0(n32), .A1(n15), .A2(n27), .B0(n28), .Y(n48) );
  NOR2XLTS U12 ( .A(n14), .B(n17), .Y(load_5_o) );
  NOR3XLTS U13 ( .A(state_reg[0]), .B(n14), .C(n7), .Y(load_2_o) );
  NOR2XLTS U14 ( .A(n10), .B(n16), .Y(n3) );
  AOI211XLTS U15 ( .A0(state_reg[3]), .A1(n28), .B0(load_5_o), .C0(n3), .Y(n31) );
  NAND2X1TS U16 ( .A(n5), .B(state_reg[3]), .Y(n24) );
  NOR2XLTS U17 ( .A(state_reg[0]), .B(n24), .Y(ctrl_b_load_o) );
  NOR2XLTS U18 ( .A(n5), .B(state_reg[3]), .Y(n8) );
  INVX2TS U19 ( .A(n8), .Y(n17) );
  NOR2XLTS U20 ( .A(state_reg[0]), .B(n33), .Y(n12) );
  INVX2TS U21 ( .A(n12), .Y(n26) );
  NAND2X1TS U22 ( .A(n35), .B(n5), .Y(n7) );
  NAND2X1TS U23 ( .A(state_reg[3]), .B(n34), .Y(n10) );
  NAND2X1TS U24 ( .A(state_reg[0]), .B(n14), .Y(n16) );
  OAI21X1TS U25 ( .A0(norm_iteration_i), .A1(n26), .B0(n6), .Y(A_S_op_o) );
  NOR2X1TS U26 ( .A(n10), .B(n16), .Y(load_7_o) );
  NOR2X1TS U27 ( .A(n7), .B(n16), .Y(load_1_o) );
  NOR3XLTS U28 ( .A(state_reg[0]), .B(n14), .C(n10), .Y(ready) );
  OAI33XLTS U29 ( .A0(n14), .A1(n34), .A2(n36), .B0(n33), .B1(n17), .B2(
        state_reg[0]), .Y(load_3_o) );
  NAND2X1TS U30 ( .A(n8), .B(norm_iteration_i), .Y(n25) );
  AOI21X1TS U31 ( .A0(n24), .A1(n25), .B0(n16), .Y(n9) );
  INVX2TS U32 ( .A(zero_flag_i), .Y(n11) );
  AOI22X1TS U33 ( .A0(n12), .A1(n35), .B0(load_2_o), .B1(n11), .Y(n15) );
  NAND2X1TS U34 ( .A(ctrl_b_load_o), .B(n33), .Y(n27) );
  INVX2TS U35 ( .A(ready), .Y(n13) );
  OAI22X1TS U36 ( .A0(beg_FSM), .A1(rst_int_BAR), .B0(rst_FSM), .B1(n13), .Y(
        n28) );
  NOR2XLTS U37 ( .A(state_reg[0]), .B(n19), .Y(ctrl_c_o) );
  INVX2TS U38 ( .A(n28), .Y(n23) );
  NOR3XLTS U39 ( .A(norm_iteration_i), .B(n17), .C(n16), .Y(n20) );
  AOI211XLTS U40 ( .A0(state_reg[3]), .A1(n14), .B0(n20), .C0(load_3_o), .Y(
        n18) );
  NAND2X1TS U41 ( .A(load_2_o), .B(zero_flag_i), .Y(n29) );
  OAI211XLTS U42 ( .A0(n5), .A1(n23), .B0(n18), .C0(n29), .Y(n45) );
  OA21XLTS U43 ( .A0(n36), .A1(n19), .B0(n27), .Y(n22) );
  NOR4XLTS U44 ( .A(load_2_o), .B(n3), .C(load_1_o), .D(n20), .Y(n21) );
  OAI211XLTS U45 ( .A0(n14), .A1(n23), .B0(n22), .C0(n21), .Y(n46) );
  OAI22X1TS U46 ( .A0(n36), .A1(n30), .B0(n26), .B1(n25), .Y(load_8_o) );
  NOR2BX1TS U47 ( .AN(ctrl_b_load_o), .B(add_overflow_i), .Y(ctrl_b_o[0]) );
  OAI2BB1X1TS U48 ( .A0N(add_overflow_i), .A1N(load_6_o), .B0(n27), .Y(
        ctrl_b_o[1]) );
  INVX2TS U49 ( .A(rst), .Y(n1) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W2 ( clk, load, D, Q, rst_BAR );
  input [1:0] D;
  output [1:0] Q;
  input clk, load, rst_BAR;
  wire   n4, n6, n1;

  DFFRXLTS Q_reg_1_ ( .D(n6), .CK(clk), .RN(rst_BAR), .Q(Q[1]) );
  DFFRXLTS Q_reg_0_ ( .D(n4), .CK(clk), .RN(rst_BAR), .Q(Q[0]) );
  AO22XLTS U2 ( .A0(load), .A1(D[0]), .B0(n1), .B1(Q[0]), .Y(n4) );
  AO22XLTS U3 ( .A0(load), .A1(D[1]), .B0(n1), .B1(Q[1]), .Y(n6) );
  INVX2TS U4 ( .A(load), .Y(n1) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W32_2 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  DFFRXLTS Q_reg_23_ ( .D(n57), .CK(clk), .RN(n9), .Q(Q[23]) );
  DFFRXLTS Q_reg_8_ ( .D(n42), .CK(clk), .RN(n10), .Q(Q[8]) );
  DFFRXLTS Q_reg_31_ ( .D(n66), .CK(clk), .RN(n10), .Q(Q[31]) );
  DFFRXLTS Q_reg_30_ ( .D(n64), .CK(clk), .RN(n10), .Q(Q[30]) );
  DFFRXLTS Q_reg_29_ ( .D(n63), .CK(clk), .RN(n9), .Q(Q[29]) );
  DFFRXLTS Q_reg_28_ ( .D(n62), .CK(clk), .RN(n9), .Q(Q[28]) );
  DFFRXLTS Q_reg_27_ ( .D(n61), .CK(clk), .RN(n9), .Q(Q[27]) );
  DFFRXLTS Q_reg_26_ ( .D(n60), .CK(clk), .RN(n9), .Q(Q[26]) );
  DFFRXLTS Q_reg_25_ ( .D(n59), .CK(clk), .RN(n9), .Q(Q[25]) );
  DFFRXLTS Q_reg_24_ ( .D(n58), .CK(clk), .RN(n9), .Q(Q[24]) );
  DFFRXLTS Q_reg_22_ ( .D(n56), .CK(clk), .RN(n9), .Q(Q[22]) );
  DFFRXLTS Q_reg_21_ ( .D(n55), .CK(clk), .RN(n9), .Q(Q[21]) );
  DFFRXLTS Q_reg_20_ ( .D(n54), .CK(clk), .RN(n9), .Q(Q[20]) );
  DFFRXLTS Q_reg_19_ ( .D(n53), .CK(clk), .RN(n8), .Q(Q[19]) );
  DFFRXLTS Q_reg_18_ ( .D(n52), .CK(clk), .RN(n8), .Q(Q[18]) );
  DFFRXLTS Q_reg_17_ ( .D(n51), .CK(clk), .RN(n8), .Q(Q[17]) );
  DFFRXLTS Q_reg_16_ ( .D(n50), .CK(clk), .RN(n8), .Q(Q[16]) );
  DFFRXLTS Q_reg_15_ ( .D(n49), .CK(clk), .RN(n8), .Q(Q[15]) );
  DFFRXLTS Q_reg_14_ ( .D(n48), .CK(clk), .RN(n8), .Q(Q[14]) );
  DFFRXLTS Q_reg_13_ ( .D(n47), .CK(clk), .RN(n8), .Q(Q[13]) );
  DFFRXLTS Q_reg_12_ ( .D(n46), .CK(clk), .RN(n8), .Q(Q[12]) );
  DFFRXLTS Q_reg_11_ ( .D(n45), .CK(clk), .RN(n8), .Q(Q[11]) );
  DFFRXLTS Q_reg_10_ ( .D(n44), .CK(clk), .RN(n8), .Q(Q[10]) );
  DFFRXLTS Q_reg_9_ ( .D(n43), .CK(clk), .RN(n10), .Q(Q[9]) );
  DFFRXLTS Q_reg_7_ ( .D(n41), .CK(clk), .RN(n10), .Q(Q[7]) );
  DFFRXLTS Q_reg_6_ ( .D(n40), .CK(clk), .RN(n10), .Q(Q[6]) );
  DFFRXLTS Q_reg_5_ ( .D(n39), .CK(clk), .RN(n10), .Q(Q[5]) );
  DFFRXLTS Q_reg_4_ ( .D(n38), .CK(clk), .RN(n10), .Q(Q[4]) );
  DFFRXLTS Q_reg_3_ ( .D(n37), .CK(clk), .RN(n10), .Q(Q[3]) );
  DFFRXLTS Q_reg_2_ ( .D(n36), .CK(clk), .RN(n10), .Q(Q[2]) );
  DFFRXLTS Q_reg_1_ ( .D(n35), .CK(clk), .RN(n65), .Q(Q[1]) );
  DFFRXLTS Q_reg_0_ ( .D(n34), .CK(clk), .RN(n65), .Q(Q[0]) );
  AO22XLTS U2 ( .A0(n1), .A1(D[8]), .B0(n2), .B1(Q[8]), .Y(n42) );
  AO22XLTS U3 ( .A0(n6), .A1(D[23]), .B0(n5), .B1(Q[23]), .Y(n57) );
  AO22XLTS U4 ( .A0(n1), .A1(D[0]), .B0(n7), .B1(Q[0]), .Y(n34) );
  AO22XLTS U5 ( .A0(n1), .A1(D[1]), .B0(n7), .B1(Q[1]), .Y(n35) );
  AO22XLTS U6 ( .A0(n1), .A1(D[2]), .B0(n7), .B1(Q[2]), .Y(n36) );
  AO22XLTS U7 ( .A0(n1), .A1(D[3]), .B0(n2), .B1(Q[3]), .Y(n37) );
  AO22XLTS U8 ( .A0(n1), .A1(D[4]), .B0(n2), .B1(Q[4]), .Y(n38) );
  AO22XLTS U9 ( .A0(n1), .A1(D[5]), .B0(n2), .B1(Q[5]), .Y(n39) );
  AO22XLTS U10 ( .A0(n1), .A1(D[6]), .B0(n2), .B1(Q[6]), .Y(n40) );
  AO22XLTS U11 ( .A0(n1), .A1(D[7]), .B0(n2), .B1(Q[7]), .Y(n41) );
  AO22XLTS U12 ( .A0(n1), .A1(D[9]), .B0(n2), .B1(Q[9]), .Y(n43) );
  AO22XLTS U13 ( .A0(n3), .A1(D[10]), .B0(n2), .B1(Q[10]), .Y(n44) );
  AO22XLTS U14 ( .A0(n3), .A1(D[11]), .B0(n2), .B1(Q[11]), .Y(n45) );
  AO22XLTS U15 ( .A0(n3), .A1(D[12]), .B0(n4), .B1(Q[12]), .Y(n46) );
  AO22XLTS U16 ( .A0(n3), .A1(D[13]), .B0(n4), .B1(Q[13]), .Y(n47) );
  AO22XLTS U17 ( .A0(n3), .A1(D[14]), .B0(n4), .B1(Q[14]), .Y(n48) );
  AO22XLTS U18 ( .A0(n3), .A1(D[15]), .B0(n4), .B1(Q[15]), .Y(n49) );
  AO22XLTS U19 ( .A0(n3), .A1(D[16]), .B0(n4), .B1(Q[16]), .Y(n50) );
  AO22XLTS U20 ( .A0(n3), .A1(D[17]), .B0(n4), .B1(Q[17]), .Y(n51) );
  AO22XLTS U21 ( .A0(n3), .A1(D[18]), .B0(n4), .B1(Q[18]), .Y(n52) );
  AO22XLTS U22 ( .A0(n3), .A1(D[19]), .B0(n4), .B1(Q[19]), .Y(n53) );
  AO22XLTS U23 ( .A0(n6), .A1(D[20]), .B0(n4), .B1(Q[20]), .Y(n54) );
  AO22XLTS U24 ( .A0(n6), .A1(D[21]), .B0(n4), .B1(Q[21]), .Y(n55) );
  AO22XLTS U25 ( .A0(n6), .A1(D[22]), .B0(n5), .B1(Q[22]), .Y(n56) );
  AO22XLTS U26 ( .A0(n6), .A1(D[24]), .B0(n5), .B1(Q[24]), .Y(n58) );
  AO22XLTS U27 ( .A0(n6), .A1(D[25]), .B0(n5), .B1(Q[25]), .Y(n59) );
  AO22XLTS U28 ( .A0(n6), .A1(D[26]), .B0(n5), .B1(Q[26]), .Y(n60) );
  AO22XLTS U29 ( .A0(n6), .A1(D[27]), .B0(n5), .B1(Q[27]), .Y(n61) );
  AO22XLTS U30 ( .A0(n6), .A1(D[28]), .B0(n7), .B1(Q[28]), .Y(n62) );
  AO22XLTS U31 ( .A0(n6), .A1(D[29]), .B0(n7), .B1(Q[29]), .Y(n63) );
  AO22XLTS U32 ( .A0(load), .A1(D[30]), .B0(n7), .B1(Q[30]), .Y(n64) );
  AO22XLTS U33 ( .A0(load), .A1(D[31]), .B0(n7), .B1(Q[31]), .Y(n66) );
  INVX2TS U34 ( .A(rst), .Y(n65) );
  CLKBUFX2TS U35 ( .A(n65), .Y(n9) );
  CLKBUFX2TS U36 ( .A(n65), .Y(n8) );
  CLKBUFX2TS U37 ( .A(n65), .Y(n10) );
  INVX2TS U38 ( .A(load), .Y(n5) );
  CLKBUFX2TS U39 ( .A(n5), .Y(n2) );
  INVX2TS U40 ( .A(n2), .Y(n1) );
  CLKBUFX2TS U41 ( .A(n5), .Y(n7) );
  INVX2TS U42 ( .A(n7), .Y(n3) );
  CLKBUFX2TS U43 ( .A(n5), .Y(n4) );
  INVX2TS U44 ( .A(n7), .Y(n6) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_0 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4, n1;

  DFFRXLTS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n3), .Q(Q[0]) );
  AO22XLTS U2 ( .A0(n1), .A1(Q[0]), .B0(load), .B1(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n3) );
  INVX2TS U4 ( .A(load), .Y(n1) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W8_1 ( ctrl, D0, D1, S );
  input [7:0] D0;
  input [7:0] D1;
  output [7:0] S;
  input ctrl;

  assign S[7] = D0[7];
  assign S[6] = D0[6];
  assign S[5] = D0[5];
  assign S[4] = D0[4];
  assign S[3] = D0[3];
  assign S[2] = D0[2];
  assign S[1] = D0[1];
  assign S[0] = D0[0];

initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Mux_3x1_W8 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [7:0] D0;
  input [7:0] D1;
  input [7:0] D2;
  output [7:0] S;
  wire   n12, n13, n14;

  CLKAND2X2TS U2 ( .A(n13), .B(D0[7]), .Y(S[7]) );
  CLKAND2X2TS U3 ( .A(n13), .B(D0[5]), .Y(S[5]) );
  AO22XLTS U4 ( .A0(n14), .A1(D1[3]), .B0(n13), .B1(D0[3]), .Y(S[3]) );
  AO22XLTS U5 ( .A0(n14), .A1(D1[1]), .B0(n13), .B1(D0[1]), .Y(S[1]) );
  CLKAND2X2TS U6 ( .A(n13), .B(D0[6]), .Y(S[6]) );
  AO22XLTS U7 ( .A0(n14), .A1(D1[4]), .B0(n13), .B1(D0[4]), .Y(S[4]) );
  AO22XLTS U8 ( .A0(n14), .A1(D1[2]), .B0(n13), .B1(D0[2]), .Y(S[2]) );
  NOR2XLTS U9 ( .A(ctrl[1]), .B(D0[0]), .Y(n12) );
  NOR2XLTS U10 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n13) );
  NOR2BX1TS U11 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(n14) );
  OAI2BB2XLTS U12 ( .B0(ctrl[0]), .B1(n12), .A0N(D1[0]), .A1N(n14), .Y(S[0])
         );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Exp_Operation_EW8 ( clk, rst, load_a_i, load_b_i, Data_A_i, Data_B_i, 
        Add_Subt_i, Data_Result_o, Overflow_flag_o, Underflow_flag_o );
  input [7:0] Data_A_i;
  input [7:0] Data_B_i;
  output [7:0] Data_Result_o;
  input clk, rst, load_a_i, load_b_i, Add_Subt_i;
  output Overflow_flag_o, Underflow_flag_o;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         DP_OP_11J1_122_8565_n20, DP_OP_11J1_122_8565_n19,
         DP_OP_11J1_122_8565_n18, DP_OP_11J1_122_8565_n17,
         DP_OP_11J1_122_8565_n16, DP_OP_11J1_122_8565_n15,
         DP_OP_11J1_122_8565_n14, DP_OP_11J1_122_8565_n13,
         DP_OP_11J1_122_8565_n8, DP_OP_11J1_122_8565_n7,
         DP_OP_11J1_122_8565_n6, DP_OP_11J1_122_8565_n5,
         DP_OP_11J1_122_8565_n4, DP_OP_11J1_122_8565_n3,
         DP_OP_11J1_122_8565_n2, DP_OP_11J1_122_8565_n1, n1, n2, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;
  wire   [7:0] Data_S;

  DFFRXLTS exp_result_Q_reg_0_ ( .D(n13), .CK(clk), .RN(n12), .Q(
        Data_Result_o[0]) );
  DFFRXLTS exp_result_Q_reg_1_ ( .D(n11), .CK(clk), .RN(n12), .Q(
        Data_Result_o[1]) );
  DFFRXLTS exp_result_Q_reg_2_ ( .D(n10), .CK(clk), .RN(n12), .Q(
        Data_Result_o[2]) );
  DFFRXLTS exp_result_Q_reg_3_ ( .D(n9), .CK(clk), .RN(n12), .Q(
        Data_Result_o[3]) );
  DFFRXLTS exp_result_Q_reg_4_ ( .D(n8), .CK(clk), .RN(n12), .Q(
        Data_Result_o[4]) );
  DFFRXLTS exp_result_Q_reg_5_ ( .D(n7), .CK(clk), .RN(n12), .Q(
        Data_Result_o[5]) );
  DFFRXLTS exp_result_Q_reg_6_ ( .D(n6), .CK(clk), .RN(n12), .Q(
        Data_Result_o[6]) );
  DFFRXLTS exp_result_Q_reg_7_ ( .D(n5), .CK(clk), .RN(n12), .Q(
        Data_Result_o[7]) );
  CMPR32X2TS DP_OP_11J1_122_8565_U9 ( .A(Data_A_i[0]), .B(Add_Subt_i), .C(
        DP_OP_11J1_122_8565_n20), .CO(DP_OP_11J1_122_8565_n8), .S(Data_S[0])
         );
  CMPR32X2TS DP_OP_11J1_122_8565_U8 ( .A(DP_OP_11J1_122_8565_n19), .B(
        Data_A_i[1]), .C(DP_OP_11J1_122_8565_n8), .CO(DP_OP_11J1_122_8565_n7), 
        .S(Data_S[1]) );
  CMPR32X2TS DP_OP_11J1_122_8565_U7 ( .A(DP_OP_11J1_122_8565_n18), .B(
        Data_A_i[2]), .C(DP_OP_11J1_122_8565_n7), .CO(DP_OP_11J1_122_8565_n6), 
        .S(Data_S[2]) );
  CMPR32X2TS DP_OP_11J1_122_8565_U6 ( .A(DP_OP_11J1_122_8565_n17), .B(
        Data_A_i[3]), .C(DP_OP_11J1_122_8565_n6), .CO(DP_OP_11J1_122_8565_n5), 
        .S(Data_S[3]) );
  CMPR32X2TS DP_OP_11J1_122_8565_U5 ( .A(DP_OP_11J1_122_8565_n16), .B(
        Data_A_i[4]), .C(DP_OP_11J1_122_8565_n5), .CO(DP_OP_11J1_122_8565_n4), 
        .S(Data_S[4]) );
  CMPR32X2TS DP_OP_11J1_122_8565_U4 ( .A(DP_OP_11J1_122_8565_n15), .B(
        Data_A_i[5]), .C(DP_OP_11J1_122_8565_n4), .CO(DP_OP_11J1_122_8565_n3), 
        .S(Data_S[5]) );
  CMPR32X2TS DP_OP_11J1_122_8565_U3 ( .A(DP_OP_11J1_122_8565_n14), .B(
        Data_A_i[6]), .C(DP_OP_11J1_122_8565_n3), .CO(DP_OP_11J1_122_8565_n2), 
        .S(Data_S[6]) );
  CMPR32X2TS DP_OP_11J1_122_8565_U2 ( .A(DP_OP_11J1_122_8565_n13), .B(
        Data_A_i[7]), .C(DP_OP_11J1_122_8565_n2), .CO(DP_OP_11J1_122_8565_n1), 
        .S(Data_S[7]) );
  DFFRXLTS Overflow_Q_reg_0_ ( .D(n3), .CK(clk), .RN(n12), .Q(Overflow_flag_o), 
        .QN(n22) );
  DFFRXLTS Underflow_Q_reg_0_ ( .D(n4), .CK(clk), .RN(n12), .Q(
        Underflow_flag_o) );
  XOR2XLTS U1 ( .A(Add_Subt_i), .B(Data_B_i[7]), .Y(DP_OP_11J1_122_8565_n13)
         );
  XOR2XLTS U2 ( .A(Add_Subt_i), .B(Data_B_i[5]), .Y(DP_OP_11J1_122_8565_n15)
         );
  XOR2XLTS U3 ( .A(Add_Subt_i), .B(Data_B_i[3]), .Y(DP_OP_11J1_122_8565_n17)
         );
  XOR2XLTS U4 ( .A(Add_Subt_i), .B(Data_B_i[1]), .Y(DP_OP_11J1_122_8565_n19)
         );
  XOR2XLTS U5 ( .A(DP_OP_11J1_122_8565_n1), .B(Add_Subt_i), .Y(n17) );
  XOR2XLTS U6 ( .A(Add_Subt_i), .B(Data_B_i[6]), .Y(DP_OP_11J1_122_8565_n14)
         );
  XOR2XLTS U7 ( .A(Add_Subt_i), .B(Data_B_i[4]), .Y(DP_OP_11J1_122_8565_n16)
         );
  XOR2XLTS U8 ( .A(Add_Subt_i), .B(Data_B_i[2]), .Y(DP_OP_11J1_122_8565_n18)
         );
  XOR2XLTS U9 ( .A(Add_Subt_i), .B(Data_B_i[0]), .Y(DP_OP_11J1_122_8565_n20)
         );
  AO21XLTS U10 ( .A0(Underflow_flag_o), .A1(n15), .B0(n14), .Y(n4) );
  NOR4BXLTS U11 ( .AN(n2), .B(n17), .C(Data_S[7]), .D(Data_S[6]), .Y(n14) );
  NOR4BXLTS U12 ( .AN(n1), .B(Data_S[5]), .C(Data_S[4]), .D(Data_S[3]), .Y(n2)
         );
  MXI2XLTS U13 ( .A(n22), .B(n19), .S0(n21), .Y(n3) );
  AO22XLTS U14 ( .A0(Data_S[7]), .A1(n21), .B0(n20), .B1(Data_Result_o[7]), 
        .Y(n5) );
  AO22XLTS U15 ( .A0(Data_S[6]), .A1(n21), .B0(n20), .B1(Data_Result_o[6]), 
        .Y(n6) );
  AO22XLTS U16 ( .A0(Data_S[5]), .A1(n21), .B0(n20), .B1(Data_Result_o[5]), 
        .Y(n7) );
  AO22XLTS U17 ( .A0(Data_S[4]), .A1(n21), .B0(n20), .B1(Data_Result_o[4]), 
        .Y(n8) );
  AO22XLTS U18 ( .A0(Data_S[3]), .A1(n21), .B0(n20), .B1(Data_Result_o[3]), 
        .Y(n9) );
  AO22XLTS U19 ( .A0(Data_S[2]), .A1(n21), .B0(n20), .B1(Data_Result_o[2]), 
        .Y(n10) );
  AO22XLTS U20 ( .A0(Data_S[1]), .A1(n21), .B0(n20), .B1(Data_Result_o[1]), 
        .Y(n11) );
  AO22XLTS U21 ( .A0(Data_S[0]), .A1(n21), .B0(n20), .B1(Data_Result_o[0]), 
        .Y(n13) );
  NOR4BXLTS U22 ( .AN(load_b_i), .B(Data_S[2]), .C(Data_S[1]), .D(Data_S[0]), 
        .Y(n1) );
  CLKBUFX2TS U23 ( .A(load_a_i), .Y(n21) );
  INVX2TS U24 ( .A(n21), .Y(n20) );
  INVX2TS U25 ( .A(load_b_i), .Y(n15) );
  AND4X1TS U26 ( .A(Data_S[3]), .B(Data_S[2]), .C(Data_S[1]), .D(Data_S[0]), 
        .Y(n16) );
  AND4X1TS U27 ( .A(Data_S[6]), .B(Data_S[5]), .C(Data_S[4]), .D(n16), .Y(n18)
         );
  AOI21X1TS U28 ( .A0(Data_S[7]), .A1(n18), .B0(n17), .Y(n19) );
  INVX2TS U29 ( .A(rst), .Y(n12) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W1_182 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;


  NOR2BX1TS U1 ( .AN(D0[0]), .B(ctrl), .Y(S[0]) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W26_0 ( ctrl, D0, D1, S );
  input [25:0] D0;
  input [25:0] D1;
  output [25:0] S;
  input ctrl;

  assign S[2] = ctrl;
  assign S[25] = 1'b0;
  assign S[24] = 1'b0;
  assign S[23] = 1'b0;
  assign S[22] = 1'b0;
  assign S[21] = 1'b0;
  assign S[20] = 1'b0;
  assign S[19] = 1'b0;
  assign S[18] = 1'b0;
  assign S[17] = 1'b0;
  assign S[16] = 1'b0;
  assign S[15] = 1'b0;
  assign S[14] = 1'b0;
  assign S[13] = 1'b0;
  assign S[12] = 1'b0;
  assign S[11] = 1'b0;
  assign S[10] = 1'b0;
  assign S[9] = 1'b0;
  assign S[8] = 1'b0;
  assign S[7] = 1'b0;
  assign S[6] = 1'b0;
  assign S[5] = 1'b0;
  assign S[4] = 1'b0;
  assign S[3] = 1'b0;
  assign S[1] = 1'b0;
  assign S[0] = 1'b0;

initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module LZD_SWR26_EWR5 ( clk, rst, load_i, Add_subt_result_i, Shift_Value_o );
  input [25:0] Add_subt_result_i;
  output [4:0] Shift_Value_o;
  input clk, rst, load_i;
  wire   n7, n8, n9, n10, n11, n12, n1, n2, n3, n4, n5, n6, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65;

  DFFRXLTS Output_Reg_Q_reg_0_ ( .D(n12), .CK(clk), .RN(n11), .Q(
        Shift_Value_o[0]) );
  DFFRXLTS Output_Reg_Q_reg_1_ ( .D(n10), .CK(clk), .RN(n11), .Q(
        Shift_Value_o[1]) );
  DFFRXLTS Output_Reg_Q_reg_2_ ( .D(n9), .CK(clk), .RN(n11), .Q(
        Shift_Value_o[2]) );
  DFFRXLTS Output_Reg_Q_reg_3_ ( .D(n8), .CK(clk), .RN(n11), .Q(
        Shift_Value_o[3]), .QN(n65) );
  DFFRXLTS Output_Reg_Q_reg_4_ ( .D(n7), .CK(clk), .RN(n11), .Q(
        Shift_Value_o[4]) );
  AO22XLTS U1 ( .A0(load_i), .A1(n56), .B0(n44), .B1(Shift_Value_o[4]), .Y(n7)
         );
  AO22XLTS U2 ( .A0(load_i), .A1(n24), .B0(n44), .B1(Shift_Value_o[2]), .Y(n9)
         );
  AO22XLTS U3 ( .A0(load_i), .A1(n45), .B0(n44), .B1(Shift_Value_o[1]), .Y(n10) );
  AOI2BB2XLTS U4 ( .B0(load_i), .B1(n64), .A0N(Shift_Value_o[0]), .A1N(load_i), 
        .Y(n12) );
  INVX1TS U5 ( .A(n57), .Y(n22) );
  NOR2XLTS U6 ( .A(Add_subt_result_i[21]), .B(Add_subt_result_i[20]), .Y(n30)
         );
  NOR3XLTS U7 ( .A(Add_subt_result_i[4]), .B(Add_subt_result_i[5]), .C(
        Add_subt_result_i[3]), .Y(n17) );
  NOR2XLTS U8 ( .A(Add_subt_result_i[17]), .B(n28), .Y(n54) );
  NOR3XLTS U9 ( .A(Add_subt_result_i[12]), .B(Add_subt_result_i[13]), .C(
        Add_subt_result_i[11]), .Y(n1) );
  NOR2XLTS U10 ( .A(Add_subt_result_i[2]), .B(n15), .Y(n25) );
  OAI211XLTS U11 ( .A0(Add_subt_result_i[25]), .A1(n60), .B0(n59), .C0(n58), 
        .Y(n61) );
  OAI21XLTS U12 ( .A0(Add_subt_result_i[0]), .A1(n46), .B0(n43), .Y(n45) );
  INVX2TS U13 ( .A(rst), .Y(n11) );
  OR4X2TS U14 ( .A(Add_subt_result_i[15]), .B(Add_subt_result_i[16]), .C(
        Add_subt_result_i[14]), .D(Add_subt_result_i[17]), .Y(n4) );
  NOR4XLTS U15 ( .A(Add_subt_result_i[24]), .B(Add_subt_result_i[25]), .C(
        Add_subt_result_i[23]), .D(Add_subt_result_i[22]), .Y(n57) );
  NOR4XLTS U16 ( .A(Add_subt_result_i[18]), .B(Add_subt_result_i[21]), .C(
        Add_subt_result_i[19]), .D(Add_subt_result_i[20]), .Y(n23) );
  NAND2X1TS U17 ( .A(n57), .B(n23), .Y(n28) );
  NOR2XLTS U18 ( .A(n4), .B(n28), .Y(n2) );
  NAND2X1TS U19 ( .A(n2), .B(n1), .Y(n6) );
  NOR2XLTS U20 ( .A(Add_subt_result_i[10]), .B(n6), .Y(n56) );
  INVX2TS U21 ( .A(load_i), .Y(n44) );
  INVX2TS U22 ( .A(n28), .Y(n5) );
  NOR2BX1TS U23 ( .AN(n2), .B(n1), .Y(n18) );
  NOR3XLTS U24 ( .A(Add_subt_result_i[8]), .B(Add_subt_result_i[9]), .C(
        Add_subt_result_i[7]), .Y(n3) );
  NAND2X1TS U25 ( .A(n56), .B(n3), .Y(n38) );
  NOR2XLTS U26 ( .A(Add_subt_result_i[6]), .B(n38), .Y(n20) );
  NAND2X1TS U27 ( .A(n20), .B(n17), .Y(n15) );
  AOI211XLTS U28 ( .A0(n5), .A1(n4), .B0(n18), .C0(n25), .Y(n13) );
  NAND2BXLTS U29 ( .AN(n6), .B(Add_subt_result_i[10]), .Y(n14) );
  AOI32X1TS U30 ( .A0(n13), .A1(load_i), .A2(n14), .B0(n65), .B1(n44), .Y(n8)
         );
  INVX2TS U31 ( .A(Add_subt_result_i[2]), .Y(n16) );
  OA21XLTS U32 ( .A0(n16), .A1(n15), .B0(n14), .Y(n34) );
  INVX2TS U33 ( .A(n17), .Y(n19) );
  AOI21X1TS U34 ( .A0(n20), .A1(n19), .B0(n18), .Y(n21) );
  OAI211XLTS U35 ( .A0(n23), .A1(n22), .B0(n34), .C0(n21), .Y(n24) );
  NAND2BXLTS U36 ( .AN(Add_subt_result_i[1]), .B(n25), .Y(n46) );
  INVX2TS U37 ( .A(Add_subt_result_i[3]), .Y(n27) );
  OR4X2TS U38 ( .A(Add_subt_result_i[8]), .B(Add_subt_result_i[9]), .C(
        Add_subt_result_i[7]), .D(Add_subt_result_i[5]), .Y(n48) );
  INVX2TS U39 ( .A(Add_subt_result_i[7]), .Y(n26) );
  OAI33XLTS U40 ( .A0(n27), .A1(Add_subt_result_i[4]), .A2(n48), .B0(n26), 
        .B1(Add_subt_result_i[9]), .B2(Add_subt_result_i[8]), .Y(n42) );
  NOR2XLTS U41 ( .A(Add_subt_result_i[12]), .B(Add_subt_result_i[13]), .Y(n29)
         );
  AOI32X1TS U42 ( .A0(Add_subt_result_i[11]), .A1(n54), .A2(n29), .B0(
        Add_subt_result_i[15]), .B1(n54), .Y(n33) );
  AOI211XLTS U43 ( .A0(Add_subt_result_i[19]), .A1(n30), .B0(
        Add_subt_result_i[23]), .C0(Add_subt_result_i[22]), .Y(n32) );
  OR2X1TS U44 ( .A(Add_subt_result_i[24]), .B(Add_subt_result_i[25]), .Y(n31)
         );
  OAI22X1TS U45 ( .A0(Add_subt_result_i[16]), .A1(n33), .B0(n32), .B1(n31), 
        .Y(n41) );
  NOR3XLTS U46 ( .A(Add_subt_result_i[21]), .B(Add_subt_result_i[19]), .C(
        Add_subt_result_i[20]), .Y(n37) );
  NAND2X1TS U47 ( .A(Add_subt_result_i[14]), .B(n54), .Y(n35) );
  OAI31X1TS U48 ( .A0(Add_subt_result_i[15]), .A1(Add_subt_result_i[16]), .A2(
        n35), .B0(n34), .Y(n36) );
  AOI31XLTS U49 ( .A0(n57), .A1(Add_subt_result_i[18]), .A2(n37), .B0(n36), 
        .Y(n40) );
  NAND2BXLTS U50 ( .AN(n38), .B(Add_subt_result_i[6]), .Y(n39) );
  NAND2X1TS U51 ( .A(n40), .B(n39), .Y(n62) );
  AOI211XLTS U52 ( .A0(n56), .A1(n42), .B0(n41), .C0(n62), .Y(n43) );
  INVX2TS U53 ( .A(n46), .Y(n63) );
  INVX2TS U54 ( .A(Add_subt_result_i[23]), .Y(n47) );
  AOI21X1TS U55 ( .A0(Add_subt_result_i[22]), .A1(n47), .B0(
        Add_subt_result_i[24]), .Y(n60) );
  INVX2TS U56 ( .A(Add_subt_result_i[8]), .Y(n50) );
  INVX2TS U57 ( .A(Add_subt_result_i[4]), .Y(n49) );
  OAI22X1TS U58 ( .A0(Add_subt_result_i[9]), .A1(n50), .B0(n49), .B1(n48), .Y(
        n55) );
  INVX2TS U59 ( .A(Add_subt_result_i[12]), .Y(n52) );
  INVX2TS U60 ( .A(Add_subt_result_i[16]), .Y(n51) );
  OAI31X1TS U61 ( .A0(Add_subt_result_i[15]), .A1(Add_subt_result_i[13]), .A2(
        n52), .B0(n51), .Y(n53) );
  AOI22X1TS U62 ( .A0(n56), .A1(n55), .B0(n54), .B1(n53), .Y(n59) );
  NAND3BXLTS U63 ( .AN(Add_subt_result_i[21]), .B(n57), .C(
        Add_subt_result_i[20]), .Y(n58) );
  AOI211XLTS U64 ( .A0(n63), .A1(Add_subt_result_i[0]), .B0(n62), .C0(n61), 
        .Y(n64) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Tenth_Phase_W32_EW8_SW23 ( clk, rst, load_i, sel_a_i, sel_b_i, sign_i, 
        exp_ieee_i, sgf_ieee_i, final_result_ieee_o );
  input [7:0] exp_ieee_i;
  input [22:0] sgf_ieee_i;
  output [31:0] final_result_ieee_o;
  input clk, rst, load_i, sel_a_i, sel_b_i, sign_i;
  wire   n34, n35, n36, n37, n38, n39, n40, n41, n42, n65, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12;

  DFFRXLTS Final_Result_IEEE_Q_reg_27_ ( .D(n38), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[27]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_31_ ( .D(n34), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[31]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_23_ ( .D(n42), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[23]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_24_ ( .D(n41), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[24]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_25_ ( .D(n40), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[25]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_26_ ( .D(n39), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[26]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_28_ ( .D(n37), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[28]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_29_ ( .D(n36), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[29]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_30_ ( .D(n35), .CK(clk), .RN(n65), .Q(
        final_result_ieee_o[30]) );
  INVX2TS U3 ( .A(n10), .Y(n1) );
  INVX2TS U4 ( .A(rst), .Y(n65) );
  OAI21XLTS U5 ( .A0(sel_b_i), .A1(sign_i), .B0(load_i), .Y(n2) );
  INVX2TS U6 ( .A(load_i), .Y(n10) );
  OAI2BB2XLTS U7 ( .B0(sel_a_i), .B1(n2), .A0N(final_result_ieee_o[31]), .A1N(
        n10), .Y(n34) );
  AOI22X1TS U8 ( .A0(load_i), .A1(exp_ieee_i[7]), .B0(final_result_ieee_o[30]), 
        .B1(n10), .Y(n3) );
  OAI21X1TS U9 ( .A0(sel_a_i), .A1(sel_b_i), .B0(n1), .Y(n11) );
  NAND2X1TS U10 ( .A(n3), .B(n11), .Y(n35) );
  AOI22X1TS U11 ( .A0(load_i), .A1(exp_ieee_i[6]), .B0(final_result_ieee_o[29]), .B1(n10), .Y(n4) );
  NAND2X1TS U12 ( .A(n4), .B(n11), .Y(n36) );
  AOI22X1TS U13 ( .A0(load_i), .A1(exp_ieee_i[5]), .B0(final_result_ieee_o[28]), .B1(n10), .Y(n5) );
  NAND2X1TS U14 ( .A(n5), .B(n11), .Y(n37) );
  AOI22X1TS U15 ( .A0(load_i), .A1(exp_ieee_i[4]), .B0(final_result_ieee_o[27]), .B1(n10), .Y(n6) );
  NAND2X1TS U16 ( .A(n6), .B(n11), .Y(n38) );
  AOI22X1TS U17 ( .A0(load_i), .A1(exp_ieee_i[3]), .B0(final_result_ieee_o[26]), .B1(n10), .Y(n7) );
  NAND2X1TS U18 ( .A(n7), .B(n11), .Y(n39) );
  AOI22X1TS U19 ( .A0(load_i), .A1(exp_ieee_i[2]), .B0(final_result_ieee_o[25]), .B1(n10), .Y(n8) );
  NAND2X1TS U20 ( .A(n8), .B(n11), .Y(n40) );
  AOI22X1TS U21 ( .A0(load_i), .A1(exp_ieee_i[1]), .B0(final_result_ieee_o[24]), .B1(n10), .Y(n9) );
  NAND2X1TS U22 ( .A(n9), .B(n11), .Y(n41) );
  AOI22X1TS U23 ( .A0(load_i), .A1(exp_ieee_i[0]), .B0(final_result_ieee_o[23]), .B1(n10), .Y(n12) );
  NAND2X1TS U24 ( .A(n12), .B(n11), .Y(n42) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W32_1 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53;

  DFFRXLTS Q_reg_20_ ( .D(n23), .CK(clk), .RN(n9), .Q(Q[20]) );
  DFFRXLTS Q_reg_5_ ( .D(n48), .CK(clk), .RN(n10), .Q(Q[5]) );
  DFFRXLTS Q_reg_0_ ( .D(n53), .CK(clk), .RN(n12), .Q(Q[0]) );
  DFFRXLTS Q_reg_31_ ( .D(n11), .CK(clk), .RN(n10), .Q(Q[31]) );
  DFFRXLTS Q_reg_30_ ( .D(n13), .CK(clk), .RN(n10), .Q(Q[30]) );
  DFFRXLTS Q_reg_29_ ( .D(n14), .CK(clk), .RN(n9), .Q(Q[29]) );
  DFFRXLTS Q_reg_28_ ( .D(n15), .CK(clk), .RN(n9), .Q(Q[28]) );
  DFFRXLTS Q_reg_27_ ( .D(n16), .CK(clk), .RN(n9), .Q(Q[27]) );
  DFFRXLTS Q_reg_26_ ( .D(n17), .CK(clk), .RN(n9), .Q(Q[26]) );
  DFFRXLTS Q_reg_25_ ( .D(n18), .CK(clk), .RN(n9), .Q(Q[25]) );
  DFFRXLTS Q_reg_24_ ( .D(n19), .CK(clk), .RN(n9), .Q(Q[24]) );
  DFFRXLTS Q_reg_23_ ( .D(n20), .CK(clk), .RN(n9), .Q(Q[23]) );
  DFFRXLTS Q_reg_22_ ( .D(n21), .CK(clk), .RN(n9), .Q(Q[22]) );
  DFFRXLTS Q_reg_21_ ( .D(n22), .CK(clk), .RN(n9), .Q(Q[21]) );
  DFFRXLTS Q_reg_19_ ( .D(n24), .CK(clk), .RN(n8), .Q(Q[19]) );
  DFFRXLTS Q_reg_18_ ( .D(n25), .CK(clk), .RN(n8), .Q(Q[18]) );
  DFFRXLTS Q_reg_17_ ( .D(n26), .CK(clk), .RN(n8), .Q(Q[17]) );
  DFFRXLTS Q_reg_16_ ( .D(n27), .CK(clk), .RN(n8), .Q(Q[16]) );
  DFFRXLTS Q_reg_15_ ( .D(n28), .CK(clk), .RN(n8), .Q(Q[15]) );
  DFFRXLTS Q_reg_14_ ( .D(n29), .CK(clk), .RN(n8), .Q(Q[14]) );
  DFFRXLTS Q_reg_13_ ( .D(n30), .CK(clk), .RN(n8), .Q(Q[13]) );
  DFFRXLTS Q_reg_12_ ( .D(n31), .CK(clk), .RN(n8), .Q(Q[12]) );
  DFFRXLTS Q_reg_11_ ( .D(n32), .CK(clk), .RN(n8), .Q(Q[11]) );
  DFFRXLTS Q_reg_10_ ( .D(n33), .CK(clk), .RN(n8), .Q(Q[10]) );
  DFFRXLTS Q_reg_9_ ( .D(n44), .CK(clk), .RN(n10), .Q(Q[9]) );
  DFFRXLTS Q_reg_8_ ( .D(n45), .CK(clk), .RN(n10), .Q(Q[8]) );
  DFFRXLTS Q_reg_7_ ( .D(n46), .CK(clk), .RN(n10), .Q(Q[7]) );
  DFFRXLTS Q_reg_6_ ( .D(n47), .CK(clk), .RN(n10), .Q(Q[6]) );
  DFFRXLTS Q_reg_4_ ( .D(n49), .CK(clk), .RN(n10), .Q(Q[4]) );
  DFFRXLTS Q_reg_3_ ( .D(n50), .CK(clk), .RN(n10), .Q(Q[3]) );
  DFFRXLTS Q_reg_2_ ( .D(n51), .CK(clk), .RN(n10), .Q(Q[2]) );
  DFFRXLTS Q_reg_1_ ( .D(n52), .CK(clk), .RN(n12), .Q(Q[1]) );
  AO22XLTS U2 ( .A0(load), .A1(D[0]), .B0(n6), .B1(Q[0]), .Y(n53) );
  AO22XLTS U3 ( .A0(load), .A1(D[5]), .B0(n1), .B1(Q[5]), .Y(n48) );
  AO22XLTS U4 ( .A0(n5), .A1(D[20]), .B0(n3), .B1(Q[20]), .Y(n23) );
  AO22XLTS U5 ( .A0(n7), .A1(D[1]), .B0(n6), .B1(Q[1]), .Y(n52) );
  AO22XLTS U6 ( .A0(n7), .A1(D[2]), .B0(n6), .B1(Q[2]), .Y(n51) );
  AO22XLTS U7 ( .A0(n7), .A1(D[3]), .B0(n1), .B1(Q[3]), .Y(n50) );
  AO22XLTS U8 ( .A0(n7), .A1(D[4]), .B0(n1), .B1(Q[4]), .Y(n49) );
  AO22XLTS U9 ( .A0(n7), .A1(D[6]), .B0(n1), .B1(Q[6]), .Y(n47) );
  AO22XLTS U10 ( .A0(n7), .A1(D[7]), .B0(n1), .B1(Q[7]), .Y(n46) );
  AO22XLTS U11 ( .A0(n7), .A1(D[8]), .B0(n1), .B1(Q[8]), .Y(n45) );
  AO22XLTS U12 ( .A0(n7), .A1(D[9]), .B0(n1), .B1(Q[9]), .Y(n44) );
  AO22XLTS U13 ( .A0(n2), .A1(D[10]), .B0(n1), .B1(Q[10]), .Y(n33) );
  AO22XLTS U14 ( .A0(n2), .A1(D[11]), .B0(n1), .B1(Q[11]), .Y(n32) );
  AO22XLTS U15 ( .A0(n2), .A1(D[12]), .B0(n3), .B1(Q[12]), .Y(n31) );
  AO22XLTS U16 ( .A0(n2), .A1(D[13]), .B0(n3), .B1(Q[13]), .Y(n30) );
  AO22XLTS U17 ( .A0(n2), .A1(D[14]), .B0(n3), .B1(Q[14]), .Y(n29) );
  AO22XLTS U18 ( .A0(n2), .A1(D[15]), .B0(n3), .B1(Q[15]), .Y(n28) );
  AO22XLTS U19 ( .A0(n2), .A1(D[16]), .B0(n3), .B1(Q[16]), .Y(n27) );
  AO22XLTS U20 ( .A0(n2), .A1(D[17]), .B0(n3), .B1(Q[17]), .Y(n26) );
  AO22XLTS U21 ( .A0(n2), .A1(D[18]), .B0(n3), .B1(Q[18]), .Y(n25) );
  AO22XLTS U22 ( .A0(n2), .A1(D[19]), .B0(n3), .B1(Q[19]), .Y(n24) );
  AO22XLTS U23 ( .A0(n5), .A1(D[21]), .B0(n3), .B1(Q[21]), .Y(n22) );
  AO22XLTS U24 ( .A0(n5), .A1(D[22]), .B0(n4), .B1(Q[22]), .Y(n21) );
  AO22XLTS U25 ( .A0(n5), .A1(D[23]), .B0(n4), .B1(Q[23]), .Y(n20) );
  AO22XLTS U26 ( .A0(n5), .A1(D[24]), .B0(n4), .B1(Q[24]), .Y(n19) );
  AO22XLTS U27 ( .A0(n5), .A1(D[25]), .B0(n4), .B1(Q[25]), .Y(n18) );
  AO22XLTS U28 ( .A0(n5), .A1(D[26]), .B0(n4), .B1(Q[26]), .Y(n17) );
  AO22XLTS U29 ( .A0(n5), .A1(D[27]), .B0(n4), .B1(Q[27]), .Y(n16) );
  AO22XLTS U30 ( .A0(n5), .A1(D[28]), .B0(n6), .B1(Q[28]), .Y(n15) );
  AO22XLTS U31 ( .A0(n5), .A1(D[29]), .B0(n6), .B1(Q[29]), .Y(n14) );
  AO22XLTS U32 ( .A0(n7), .A1(D[30]), .B0(n6), .B1(Q[30]), .Y(n13) );
  AO22XLTS U33 ( .A0(n7), .A1(D[31]), .B0(n6), .B1(Q[31]), .Y(n11) );
  INVX2TS U34 ( .A(rst), .Y(n12) );
  CLKBUFX2TS U35 ( .A(n12), .Y(n8) );
  CLKBUFX2TS U36 ( .A(n12), .Y(n10) );
  CLKBUFX2TS U37 ( .A(n12), .Y(n9) );
  INVX2TS U38 ( .A(load), .Y(n4) );
  CLKBUFX2TS U39 ( .A(n4), .Y(n1) );
  CLKBUFX2TS U40 ( .A(n4), .Y(n6) );
  INVX2TS U41 ( .A(n6), .Y(n2) );
  CLKBUFX2TS U42 ( .A(n4), .Y(n3) );
  INVX2TS U43 ( .A(n6), .Y(n5) );
  INVX2TS U44 ( .A(n6), .Y(n7) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W26_1 ( ctrl, D0, D1, S );
  input [25:0] D0;
  input [25:0] D1;
  output [25:0] S;
  input ctrl;
  wire   n4, n5, n6, n7;
  assign S[1] = 1'b0;
  assign S[0] = 1'b0;

  INVX2TS U1 ( .A(S[25]), .Y(n4) );
  INVX2TS U2 ( .A(n4), .Y(n5) );
  INVX2TS U3 ( .A(n4), .Y(n6) );
  INVX2TS U4 ( .A(n4), .Y(n7) );
  INVX2TS U5 ( .A(ctrl), .Y(S[25]) );
  CLKAND2X2TS U7 ( .A(D0[2]), .B(n5), .Y(S[2]) );
  CLKAND2X2TS U8 ( .A(D0[3]), .B(n6), .Y(S[3]) );
  CLKAND2X2TS U9 ( .A(D0[4]), .B(n7), .Y(S[4]) );
  CLKAND2X2TS U10 ( .A(D0[5]), .B(n5), .Y(S[5]) );
  CLKAND2X2TS U11 ( .A(D0[6]), .B(n6), .Y(S[6]) );
  CLKAND2X2TS U12 ( .A(D0[7]), .B(n7), .Y(S[7]) );
  CLKAND2X2TS U13 ( .A(D0[8]), .B(n5), .Y(S[8]) );
  CLKAND2X2TS U14 ( .A(D0[9]), .B(n6), .Y(S[9]) );
  CLKAND2X2TS U15 ( .A(D0[10]), .B(n7), .Y(S[10]) );
  CLKAND2X2TS U16 ( .A(D0[11]), .B(n5), .Y(S[11]) );
  CLKAND2X2TS U17 ( .A(D0[12]), .B(n6), .Y(S[12]) );
  CLKAND2X2TS U18 ( .A(D0[13]), .B(n7), .Y(S[13]) );
  CLKAND2X2TS U19 ( .A(D0[14]), .B(n5), .Y(S[14]) );
  CLKAND2X2TS U20 ( .A(D0[15]), .B(n6), .Y(S[15]) );
  CLKAND2X2TS U21 ( .A(D0[16]), .B(n7), .Y(S[16]) );
  CLKAND2X2TS U22 ( .A(D0[17]), .B(n5), .Y(S[17]) );
  CLKAND2X2TS U23 ( .A(D0[18]), .B(n6), .Y(S[18]) );
  CLKAND2X2TS U24 ( .A(D0[19]), .B(n7), .Y(S[19]) );
  CLKAND2X2TS U25 ( .A(D0[20]), .B(n5), .Y(S[20]) );
  CLKAND2X2TS U26 ( .A(D0[21]), .B(n6), .Y(S[21]) );
  CLKAND2X2TS U27 ( .A(D0[22]), .B(n7), .Y(S[22]) );
  CLKAND2X2TS U28 ( .A(D0[23]), .B(n5), .Y(S[23]) );
  CLKAND2X2TS U29 ( .A(D0[24]), .B(n6), .Y(S[24]) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_3 ( clk, load, D, Q, rst_BAR );
  input [0:0] D;
  output [0:0] Q;
  input clk, load, rst_BAR;


  DFFRXLTS Q_reg_0_ ( .D(Q[0]), .CK(clk), .RN(rst_BAR), .Q(Q[0]) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_4 ( clk, load, D, Q, rst_BAR );
  input [0:0] D;
  output [0:0] Q;
  input clk, load, rst_BAR;
  wire   n3;

  DFFRXLTS Q_reg_0_ ( .D(n3), .CK(clk), .RN(rst_BAR), .Q(Q[0]) );
  OR2X1TS U2 ( .A(Q[0]), .B(load), .Y(n3) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module FPU_Add_Subtract_Function_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_FSM, 
        ack_FSM, Data_X, Data_Y, add_subt, r_mode, overflow_flag, 
        underflow_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  input [1:0] r_mode;
  output [31:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM, add_subt;
  output overflow_flag, underflow_flag, ready;
  wire   zero_flag, FSM_selector_C, add_overflow_flag, FSM_op_start_in_load_a,
         FSM_op_start_in_load_b, FSM_exp_operation_load_diff,
         FSM_exp_operation_load_OU, FSM_exp_operation_A_S,
         FSM_Add_Subt_Sgf_load, FSM_LZA_load, FSM_Final_Result_load, load_b,
         selector_C, rst_int, FSM_selector_D, intAS, real_op,
         sign_final_result, S_A_S_op, net3854, net3855, net3856, net3857,
         net3858, net3859, net3860, net3861, net3862, net3863, net3864,
         net3865, net3866, net3867, net3868, net3869, net3870, net3871,
         net3872, net3873, net3874, net3875, net3876, net3877, net3878,
         net3879, net3880, net3881, net3882, net3883, net3884, net3885,
         net3886, net3887, net3888, net3889, net3890, net3891, net3892,
         net3893, net3894, net3895, net3896, net3897, net3898, net3899,
         net3900, net3901, net3902, net3903, net3904, net3905, net3906,
         net3907, net3908, net3909, net3910, net3911, net3912, net3913,
         net3914, net3915, net3916, net3917, net3918, net3919, net3920,
         net3921, net3922, net3923, net3924, net3925, net3926, net3927,
         net3928, net3929, net3930, net3931, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
         SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13,
         SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15,
         SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17,
         SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19,
         SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21,
         SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23;
  wire   [1:0] selector_B;
  wire   [1:0] FSM_selector_B;
  wire   [31:0] intDX;
  wire   [31:0] intDY;
  wire   [30:0] DMP;
  wire   [30:0] DmP;
  wire   [7:0] exp_oper_result;
  wire   [7:0] S_Oper_A_exp;
  wire   [7:0] S_Oper_B_exp;
  wire   [4:0] LZA_output;
  wire   [25:0] Add_Subt_result;
  wire   [25:0] S_A_S_Oper_A;
  wire   [25:0] S_A_S_Oper_B;
  wire   [25:0] Add_Subt_LZD;
  assign final_result_ieee[0] = 1'b0;
  assign final_result_ieee[1] = 1'b0;
  assign final_result_ieee[2] = 1'b0;
  assign final_result_ieee[3] = 1'b0;
  assign final_result_ieee[4] = 1'b0;
  assign final_result_ieee[5] = 1'b0;
  assign final_result_ieee[6] = 1'b0;
  assign final_result_ieee[7] = 1'b0;
  assign final_result_ieee[8] = 1'b0;
  assign final_result_ieee[9] = 1'b0;
  assign final_result_ieee[10] = 1'b0;
  assign final_result_ieee[11] = 1'b0;
  assign final_result_ieee[12] = 1'b0;
  assign final_result_ieee[13] = 1'b0;
  assign final_result_ieee[14] = 1'b0;
  assign final_result_ieee[15] = 1'b0;
  assign final_result_ieee[16] = 1'b0;
  assign final_result_ieee[17] = 1'b0;
  assign final_result_ieee[18] = 1'b0;
  assign final_result_ieee[19] = 1'b0;
  assign final_result_ieee[20] = 1'b0;
  assign final_result_ieee[21] = 1'b0;
  assign final_result_ieee[22] = 1'b0;

  FSM_Add_Subtract FS_Module ( .clk(clk), .rst(rst), .rst_FSM(ack_FSM), 
        .beg_FSM(beg_FSM), .zero_flag_i(zero_flag), .norm_iteration_i(
        FSM_selector_C), .add_overflow_i(add_overflow_flag), .round_i(net3931), 
        .load_1_o(FSM_op_start_in_load_a), .load_2_o(FSM_op_start_in_load_b), 
        .load_3_o(FSM_exp_operation_load_diff), .load_8_o(
        FSM_exp_operation_load_OU), .A_S_op_o(FSM_exp_operation_A_S), 
        .load_5_o(FSM_Add_Subt_Sgf_load), .load_6_o(FSM_LZA_load), .load_7_o(
        FSM_Final_Result_load), .ctrl_b_o(selector_B), .ctrl_b_load_o(load_b), 
        .ctrl_c_o(selector_C), .ready(ready), .rst_int_BAR(rst_int) );
  RegisterAdd_W1_4 Sel_C ( .clk(clk), .load(selector_C), .D(1'b1), .Q(
        FSM_selector_C), .rst_BAR(rst_int) );
  RegisterAdd_W1_3 Sel_D ( .clk(clk), .load(net3930), .D(1'b1), .Q(
        FSM_selector_D), .rst_BAR(rst_int) );
  RegisterAdd_W2 Sel_B ( .clk(clk), .load(load_b), .D(selector_B), .Q(
        FSM_selector_B), .rst_BAR(rst_int) );
  RegisterAdd_W32_2 XRegister ( .clk(clk), .rst(rst), .load(
        FSM_op_start_in_load_a), .D(Data_X), .Q(intDX) );
  RegisterAdd_W32_1 YRegister ( .clk(clk), .rst(rst), .load(
        FSM_op_start_in_load_a), .D(Data_Y), .Q(intDY) );
  RegisterAdd_W1_0 ASRegister ( .clk(clk), .rst(rst), .load(
        FSM_op_start_in_load_a), .D(add_subt), .Q(intAS) );
  Oper_Start_In_2 Oper_Start_in_module ( .clk(clk), .rst(rst), .load_b_i(
        FSM_op_start_in_load_b), .intAS(intAS), .intDX(intDX), .intDY(intDY), 
        .DMP_o(DMP), .DmP_o(DmP), .zero_flag_o(zero_flag), .real_op_o(real_op), 
        .sign_final_result_o(sign_final_result) );
  Multiplexer_AC_W8_1 Exp_Oper_A_mux ( .ctrl(net3929), .D0(DMP[30:23]), .D1(
        exp_oper_result), .S(S_Oper_A_exp) );
  Mux_3x1_W8 Exp_Oper_B_mux ( .ctrl(FSM_selector_B), .D0(DmP[30:23]), .D1({
        1'b0, 1'b0, 1'b0, LZA_output}), .D2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1}), .S(S_Oper_B_exp) );
  Exp_Operation_EW8 Exp_Operation_Module ( .clk(clk), .rst(rst), .load_a_i(
        FSM_exp_operation_load_diff), .load_b_i(FSM_exp_operation_load_OU), 
        .Data_A_i(S_Oper_A_exp), .Data_B_i(S_Oper_B_exp), .Add_Subt_i(
        FSM_exp_operation_A_S), .Data_Result_o(exp_oper_result), 
        .Overflow_flag_o(overflow_flag), .Underflow_flag_o(underflow_flag) );
  Multiplexer_AC_W1_182 Add_Sub_Sgf_op_mux ( .ctrl(FSM_selector_D), .D0(
        real_op), .D1(1'b0), .S(S_A_S_op) );
  Multiplexer_AC_W26_1 Add_Sub_Sgf_Oper_A_mux ( .ctrl(FSM_selector_D), .D0({
        1'b1, DMP[22:0], 1'b0, 1'b0}), .D1({net3903, net3904, net3905, net3906, 
        net3907, net3908, net3909, net3910, net3911, net3912, net3913, net3914, 
        net3915, net3916, net3917, net3918, net3919, net3920, net3921, net3922, 
        net3923, net3924, net3925, net3926, net3927, net3928}), .S(
        S_A_S_Oper_A) );
  Multiplexer_AC_W26_0 Add_Sub_Sgf_Oper_B_mux ( .ctrl(FSM_selector_D), .D0({
        net3877, net3878, net3879, net3880, net3881, net3882, net3883, net3884, 
        net3885, net3886, net3887, net3888, net3889, net3890, net3891, net3892, 
        net3893, net3894, net3895, net3896, net3897, net3898, net3899, net3900, 
        net3901, net3902}), .D1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0}), .S(S_A_S_Oper_B) );
  Add_Subt Add_Subt_Sgf_module ( .clk(clk), .rst(rst), .load_i(
        FSM_Add_Subt_Sgf_load), .Add_Sub_op_i(S_A_S_op), .Data_A_i(
        S_A_S_Oper_A), .PreData_B_i(S_A_S_Oper_B), .Data_Result_o(
        Add_Subt_result), .FSM_C_o(add_overflow_flag) );
  LZD_SWR26_EWR5 Leading_Zero_Detector_Module ( .clk(clk), .rst(rst), .load_i(
        FSM_LZA_load), .Add_subt_result_i(Add_Subt_LZD), .Shift_Value_o(
        LZA_output) );
  Tenth_Phase_W32_EW8_SW23 final_result_ieee_Module ( .clk(clk), .rst(rst), 
        .load_i(FSM_Final_Result_load), .sel_a_i(overflow_flag), .sel_b_i(
        underflow_flag), .sign_i(sign_final_result), .exp_ieee_i(
        exp_oper_result), .sgf_ieee_i({net3854, net3855, net3856, net3857, 
        net3858, net3859, net3860, net3861, net3862, net3863, net3864, net3865, 
        net3866, net3867, net3868, net3869, net3870, net3871, net3872, net3873, 
        net3874, net3875, net3876}), .final_result_ieee_o({
        final_result_ieee[31:23], SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, 
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17, 
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19, 
        SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21, 
        SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23}) );
  INVX2TS U12 ( .A(Add_Subt_result[0]), .Y(Add_Subt_LZD[0]) );
  INVX2TS U13 ( .A(Add_Subt_result[1]), .Y(Add_Subt_LZD[1]) );
  INVX2TS U14 ( .A(Add_Subt_result[2]), .Y(Add_Subt_LZD[2]) );
  INVX2TS U18 ( .A(Add_Subt_result[6]), .Y(Add_Subt_LZD[6]) );
  INVX2TS U22 ( .A(Add_Subt_result[10]), .Y(Add_Subt_LZD[10]) );
  INVX2TS U27 ( .A(Add_Subt_result[15]), .Y(Add_Subt_LZD[15]) );
  INVX2TS U28 ( .A(Add_Subt_result[16]), .Y(Add_Subt_LZD[16]) );
  INVX2TS U26 ( .A(Add_Subt_result[14]), .Y(Add_Subt_LZD[14]) );
  INVX2TS U29 ( .A(Add_Subt_result[17]), .Y(Add_Subt_LZD[17]) );
  INVX2TS U36 ( .A(Add_Subt_result[24]), .Y(Add_Subt_LZD[24]) );
  INVX2TS U37 ( .A(Add_Subt_result[25]), .Y(Add_Subt_LZD[25]) );
  INVX2TS U35 ( .A(Add_Subt_result[23]), .Y(Add_Subt_LZD[23]) );
  INVX2TS U34 ( .A(Add_Subt_result[22]), .Y(Add_Subt_LZD[22]) );
  INVX2TS U30 ( .A(Add_Subt_result[18]), .Y(Add_Subt_LZD[18]) );
  INVX2TS U33 ( .A(Add_Subt_result[21]), .Y(Add_Subt_LZD[21]) );
  INVX2TS U31 ( .A(Add_Subt_result[19]), .Y(Add_Subt_LZD[19]) );
  INVX2TS U32 ( .A(Add_Subt_result[20]), .Y(Add_Subt_LZD[20]) );
  INVX2TS U24 ( .A(Add_Subt_result[12]), .Y(Add_Subt_LZD[12]) );
  INVX2TS U25 ( .A(Add_Subt_result[13]), .Y(Add_Subt_LZD[13]) );
  INVX2TS U23 ( .A(Add_Subt_result[11]), .Y(Add_Subt_LZD[11]) );
  INVX2TS U20 ( .A(Add_Subt_result[8]), .Y(Add_Subt_LZD[8]) );
  INVX2TS U21 ( .A(Add_Subt_result[9]), .Y(Add_Subt_LZD[9]) );
  INVX2TS U19 ( .A(Add_Subt_result[7]), .Y(Add_Subt_LZD[7]) );
  INVX2TS U16 ( .A(Add_Subt_result[4]), .Y(Add_Subt_LZD[4]) );
  INVX2TS U17 ( .A(Add_Subt_result[5]), .Y(Add_Subt_LZD[5]) );
  INVX2TS U15 ( .A(Add_Subt_result[3]), .Y(Add_Subt_LZD[3]) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule

