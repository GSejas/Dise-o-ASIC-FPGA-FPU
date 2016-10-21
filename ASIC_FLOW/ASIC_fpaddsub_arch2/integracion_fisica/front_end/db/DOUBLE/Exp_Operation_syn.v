/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 19 14:30:37 2016
/////////////////////////////////////////////////////////////


module add_sub_carry_out_W8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n3, n4;
  wire   [8:1] carry;

  CMPR32X2TS U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CMPR32X2TS U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CMPR32X2TS U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  CMPR32X2TS U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  CMPR32X2TS U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CMPR32X2TS U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CMPR32X2TS U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  NOR2X1TS U1 ( .A(n3), .B(n4), .Y(carry[1]) );
  INVX2TS U2 ( .A(B[0]), .Y(n4) );
  INVX2TS U3 ( .A(A[0]), .Y(n3) );
  XNOR2X1TS U4 ( .A(B[0]), .B(n3), .Y(SUM[0]) );
endmodule


module add_sub_carry_out_W8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20;
  wire   [9:0] carry;

  CMPR32X2TS U2_7 ( .A(A[7]), .B(n13), .C(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  CMPR32X2TS U2_6 ( .A(A[6]), .B(n14), .C(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  CMPR32X2TS U2_5 ( .A(A[5]), .B(n15), .C(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  CMPR32X2TS U2_1 ( .A(A[1]), .B(n19), .C(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  CMPR32X2TS U2_4 ( .A(A[4]), .B(n16), .C(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  CMPR32X2TS U2_3 ( .A(A[3]), .B(n17), .C(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CMPR32X2TS U2_2 ( .A(A[2]), .B(n18), .C(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  INVX2TS U1 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2TS U2 ( .A(B[2]), .Y(n18) );
  INVX2TS U3 ( .A(B[3]), .Y(n17) );
  INVX2TS U4 ( .A(B[4]), .Y(n16) );
  NAND2X1TS U5 ( .A(B[0]), .B(n12), .Y(carry[1]) );
  INVX2TS U6 ( .A(B[1]), .Y(n19) );
  INVX2TS U7 ( .A(A[0]), .Y(n12) );
  INVX2TS U8 ( .A(B[5]), .Y(n15) );
  INVX2TS U9 ( .A(B[6]), .Y(n14) );
  INVX2TS U10 ( .A(B[7]), .Y(n13) );
  XNOR2X1TS U11 ( .A(n20), .B(A[0]), .Y(DIFF[0]) );
  INVX2TS U12 ( .A(B[0]), .Y(n20) );
endmodule


module add_sub_carry_out_W8 ( op_mode, Data_A, Data_B, Data_S );
  input [7:0] Data_A;
  input [7:0] Data_B;
  output [8:0] Data_S;
  input op_mode;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, n3;

  add_sub_carry_out_W8_DW01_add_0 add_36 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .SUM({N20, N19, N18, N17, N16, N15, N14, N13, N12}) );
  add_sub_carry_out_W8_DW01_sub_0 sub_34 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .DIFF({N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  AO22X1TS U1 ( .A0(N19), .A1(n3), .B0(N10), .B1(op_mode), .Y(Data_S[7]) );
  AO22X1TS U2 ( .A0(N9), .A1(op_mode), .B0(N18), .B1(n3), .Y(Data_S[6]) );
  AO22X1TS U5 ( .A0(N8), .A1(op_mode), .B0(N17), .B1(n3), .Y(Data_S[5]) );
  AO22X1TS U6 ( .A0(N7), .A1(op_mode), .B0(N16), .B1(n3), .Y(Data_S[4]) );
  AO22X1TS U7 ( .A0(N20), .A1(n3), .B0(op_mode), .B1(N11), .Y(Data_S[8]) );
  AO22X1TS U8 ( .A0(N5), .A1(op_mode), .B0(N14), .B1(n3), .Y(Data_S[2]) );
  AO22X1TS U9 ( .A0(N6), .A1(op_mode), .B0(N15), .B1(n3), .Y(Data_S[3]) );
  AO22X1TS U10 ( .A0(N4), .A1(op_mode), .B0(N13), .B1(n3), .Y(Data_S[1]) );
  AO22X1TS U11 ( .A0(N3), .A1(op_mode), .B0(N12), .B1(n3), .Y(Data_S[0]) );
  INVX2TS U12 ( .A(op_mode), .Y(n3) );
endmodule


module Greater_Comparator_W9 ( Data_A, Data_B, gthan );
  input [8:0] Data_A;
  input [8:0] Data_B;
  output gthan;
  wire   N0, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  assign gthan = N0;

  INVX2TS U1 ( .A(n19), .Y(n29) );
  INVX2TS U2 ( .A(Data_A[6]), .Y(n32) );
  INVX2TS U3 ( .A(Data_A[8]), .Y(n31) );
  INVX2TS U4 ( .A(Data_A[4]), .Y(n34) );
  INVX2TS U5 ( .A(Data_A[5]), .Y(n33) );
  OAI211X1TS U6 ( .A0(n16), .A1(n17), .B0(n18), .C0(n19), .Y(n14) );
  AOI22X1TS U7 ( .A0(n22), .A1(n27), .B0(Data_A[3]), .B1(n23), .Y(n16) );
  AOI221X1TS U8 ( .A0(n20), .A1(Data_A[0]), .B0(Data_A[1]), .B1(n26), .C0(n21), 
        .Y(n17) );
  OR2X2TS U9 ( .A(n23), .B(Data_A[3]), .Y(n22) );
  INVX2TS U10 ( .A(Data_A[2]), .Y(n35) );
  NAND2X1TS U11 ( .A(Data_A[7]), .B(n30), .Y(n19) );
  OAI22X1TS U12 ( .A0(n11), .A1(n12), .B0(Data_B[8]), .B1(n31), .Y(N0) );
  OAI2BB2XLTS U13 ( .B0(Data_A[7]), .B1(n30), .A0N(n31), .A1N(Data_B[8]), .Y(
        n12) );
  OAI22X1TS U14 ( .A0(n29), .A1(n13), .B0(n14), .B1(n15), .Y(n11) );
  AOI21X1TS U15 ( .A0(n28), .A1(n32), .B0(n24), .Y(n13) );
  OA21XLTS U16 ( .A0(n28), .A1(n32), .B0(Data_B[6]), .Y(n24) );
  INVX2TS U17 ( .A(n25), .Y(n28) );
  AOI32X1TS U18 ( .A0(Data_B[4]), .A1(n34), .A2(n18), .B0(n33), .B1(Data_B[5]), 
        .Y(n25) );
  AOI2BB1X1TS U19 ( .A0N(n26), .A1N(Data_A[1]), .B0(Data_B[0]), .Y(n20) );
  NAND2X1TS U20 ( .A(Data_B[2]), .B(n35), .Y(n23) );
  OAI22X1TS U21 ( .A0(Data_B[6]), .A1(n32), .B0(Data_B[4]), .B1(n34), .Y(n15)
         );
  OAI2BB2XLTS U22 ( .B0(Data_B[2]), .B1(n35), .A0N(n27), .A1N(Data_A[3]), .Y(
        n21) );
  NAND2BX1TS U23 ( .AN(Data_B[5]), .B(Data_A[5]), .Y(n18) );
  INVX2TS U24 ( .A(Data_B[7]), .Y(n30) );
  INVX2TS U25 ( .A(Data_B[3]), .Y(n27) );
  INVX2TS U26 ( .A(Data_B[1]), .Y(n26) );
endmodule


module Comparator_Less_W9 ( Data_A, Data_B, less );
  input [8:0] Data_A;
  input [8:0] Data_B;
  output less;
  wire   N0, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  assign less = N0;

  AOI22X1TS U1 ( .A0(n24), .A1(n30), .B0(Data_A[6]), .B1(n27), .Y(n13) );
  OR2X2TS U2 ( .A(Data_A[6]), .B(n27), .Y(n24) );
  INVX2TS U3 ( .A(n25), .Y(n27) );
  AOI32X1TS U4 ( .A0(Data_A[4]), .A1(n28), .A2(n18), .B0(n29), .B1(Data_A[5]), 
        .Y(n25) );
  INVX2TS U5 ( .A(Data_A[7]), .Y(n33) );
  NAND2X1TS U6 ( .A(Data_A[2]), .B(n26), .Y(n22) );
  INVX2TS U7 ( .A(Data_A[3]), .Y(n34) );
  INVX2TS U8 ( .A(Data_A[1]), .Y(n35) );
  OAI22X1TS U9 ( .A0(Data_A[6]), .A1(n30), .B0(Data_A[4]), .B1(n28), .Y(n15)
         );
  INVX2TS U10 ( .A(n19), .Y(n31) );
  OAI22X1TS U11 ( .A0(n11), .A1(n12), .B0(Data_A[8]), .B1(n32), .Y(N0) );
  OAI2BB2XLTS U12 ( .B0(Data_B[7]), .B1(n33), .A0N(n32), .A1N(Data_A[8]), .Y(
        n12) );
  OAI22X1TS U13 ( .A0(n31), .A1(n13), .B0(n14), .B1(n15), .Y(n11) );
  OAI211X1TS U14 ( .A0(n16), .A1(n17), .B0(n18), .C0(n19), .Y(n14) );
  AOI21X1TS U15 ( .A0(n22), .A1(n34), .B0(n23), .Y(n16) );
  AOI221X1TS U16 ( .A0(n20), .A1(Data_B[0]), .B0(Data_B[1]), .B1(n35), .C0(n21), .Y(n17) );
  OA21XLTS U17 ( .A0(n34), .A1(n22), .B0(Data_B[3]), .Y(n23) );
  AOI2BB1X1TS U18 ( .A0N(n35), .A1N(Data_B[1]), .B0(Data_A[0]), .Y(n20) );
  OAI2BB2XLTS U19 ( .B0(Data_A[2]), .B1(n26), .A0N(n34), .A1N(Data_B[3]), .Y(
        n21) );
  NAND2X1TS U20 ( .A(Data_B[7]), .B(n33), .Y(n19) );
  NAND2BX1TS U21 ( .AN(Data_A[5]), .B(Data_B[5]), .Y(n18) );
  INVX2TS U22 ( .A(Data_B[2]), .Y(n26) );
  INVX2TS U23 ( .A(Data_B[6]), .Y(n30) );
  INVX2TS U24 ( .A(Data_B[8]), .Y(n32) );
  INVX2TS U25 ( .A(Data_B[4]), .Y(n28) );
  INVX2TS U26 ( .A(Data_B[5]), .Y(n29) );
endmodule


module Comparators_W_Exp9 ( exp, overflow, underflow );
  input [8:0] exp;
  output overflow, underflow;


  Greater_Comparator_W9 GTComparator ( .Data_A(exp), .Data_B({1'b0, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), .gthan(overflow) );
  Comparator_Less_W9 LTComparator ( .Data_A(exp), .Data_B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .less(underflow) );
endmodule


module RegisterAdd_W8 ( clk, rst, load, D, Q );
  input [7:0] D;
  output [7:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17,
         n19, n20;

  DFFRX2TS \Q_reg[7]  ( .D(n17), .CK(clk), .RN(n20), .Q(Q[7]), .QN(n8) );
  DFFRX2TS \Q_reg[6]  ( .D(n15), .CK(clk), .RN(n20), .Q(Q[6]), .QN(n7) );
  DFFRX2TS \Q_reg[5]  ( .D(n14), .CK(clk), .RN(n20), .Q(Q[5]), .QN(n6) );
  DFFRX2TS \Q_reg[4]  ( .D(n13), .CK(clk), .RN(n20), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[3]  ( .D(n12), .CK(clk), .RN(n20), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[2]  ( .D(n11), .CK(clk), .RN(n20), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n10), .CK(clk), .RN(n20), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n9), .CK(clk), .RN(n20), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(load), .Y(n19) );
  OAI2BB2XLTS U3 ( .B0(n8), .B1(load), .A0N(D[7]), .A1N(load), .Y(n17) );
  OAI2BB2XLTS U4 ( .B0(n5), .B1(n19), .A0N(D[4]), .A1N(load), .Y(n13) );
  OAI2BB2XLTS U5 ( .B0(n6), .B1(n19), .A0N(D[5]), .A1N(load), .Y(n14) );
  OAI2BB2XLTS U6 ( .B0(n7), .B1(n19), .A0N(D[6]), .A1N(load), .Y(n15) );
  OAI2BB2XLTS U7 ( .B0(n1), .B1(n19), .A0N(load), .A1N(D[0]), .Y(n9) );
  OAI2BB2XLTS U8 ( .B0(n2), .B1(n19), .A0N(D[1]), .A1N(load), .Y(n10) );
  OAI2BB2XLTS U9 ( .B0(n3), .B1(n19), .A0N(D[2]), .A1N(load), .Y(n11) );
  OAI2BB2XLTS U10 ( .B0(n4), .B1(n19), .A0N(D[3]), .A1N(load), .Y(n12) );
  INVX2TS U11 ( .A(rst), .Y(n20) );
endmodule


module RegisterAdd_W1_3 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4, n6;

  DFFRX2TS \Q_reg[0]  ( .D(n3), .CK(clk), .RN(n6), .Q(Q[0]), .QN(n4) );
  OAI2BB2XLTS U2 ( .B0(n4), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n6) );
endmodule


module RegisterAdd_W1_2 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4, n6;

  DFFRX2TS \Q_reg[0]  ( .D(n3), .CK(clk), .RN(n6), .Q(Q[0]), .QN(n4) );
  OAI2BB2XLTS U2 ( .B0(n4), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n6) );
endmodule


module Exp_Operation ( clk, rst, load_a_i, load_b_i, Data_A_i, Data_B_i, 
        Add_Subt_i, Data_Result_o, Overflow_flag_o, Underflow_flag_o );
  input [7:0] Data_A_i;
  input [7:0] Data_B_i;
  output [7:0] Data_Result_o;
  input clk, rst, load_a_i, load_b_i, Add_Subt_i;
  output Overflow_flag_o, Underflow_flag_o;
  wire   Overflow_flag, Underflow_flag, n1, n2;
  wire   [8:0] Data_S;

  add_sub_carry_out_W8 exp_add_subt ( .op_mode(Add_Subt_i), .Data_A(Data_A_i), 
        .Data_B(Data_B_i), .Data_S(Data_S) );
  Comparators_W_Exp9 array_comparators ( .exp(Data_S), .overflow(Overflow_flag), .underflow(Underflow_flag) );
  RegisterAdd_W8 exp_result ( .clk(clk), .rst(rst), .load(n2), .D(Data_S[7:0]), 
        .Q(Data_Result_o) );
  RegisterAdd_W1_3 Overflow ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Overflow_flag), .Q(Overflow_flag_o) );
  RegisterAdd_W1_2 Underflow ( .clk(clk), .rst(rst), .load(load_b_i), .D(
        Underflow_flag), .Q(Underflow_flag_o) );
  INVX2TS U1 ( .A(load_a_i), .Y(n1) );
  INVX2TS U2 ( .A(n1), .Y(n2) );
endmodule

