/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Mon Oct 17 20:48:01 2016
/////////////////////////////////////////////////////////////


module Mux_3x1_W1 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [0:0] D0;
  input [0:0] D1;
  input [0:0] D2;
  output [0:0] S;
  wire   n1, n2, n3, n4;

  AOI22X1TS U2 ( .A0(D0[0]), .A1(n2), .B0(ctrl[0]), .B1(D1[0]), .Y(n3) );
  OAI22X1TS U3 ( .A0(ctrl[1]), .A1(n3), .B0(n1), .B1(n4), .Y(S[0]) );
  INVX2TS U4 ( .A(ctrl[1]), .Y(n1) );
  NAND2X1TS U5 ( .A(D2[0]), .B(n2), .Y(n4) );
  INVX2TS U6 ( .A(ctrl[0]), .Y(n2) );
endmodule


module Multiplexer_AC_W8 ( ctrl, D0, D1, S );
  input [7:0] D0;
  input [7:0] D1;
  output [7:0] S;
  input ctrl;
  wire   n3, n4;

  INVX2TS U1 ( .A(n4), .Y(n3) );
  INVX2TS U2 ( .A(ctrl), .Y(n4) );
  AO22X1TS U3 ( .A0(n3), .A1(D1[7]), .B0(D0[7]), .B1(n4), .Y(S[7]) );
  AO22X1TS U4 ( .A0(D1[0]), .A1(n3), .B0(D0[0]), .B1(n4), .Y(S[0]) );
  AO22X1TS U5 ( .A0(D1[1]), .A1(n3), .B0(D0[1]), .B1(n4), .Y(S[1]) );
  AO22X1TS U6 ( .A0(D1[2]), .A1(n3), .B0(D0[2]), .B1(n4), .Y(S[2]) );
  AO22X1TS U7 ( .A0(D1[3]), .A1(n3), .B0(D0[3]), .B1(n4), .Y(S[3]) );
  AO22X1TS U8 ( .A0(D1[4]), .A1(n3), .B0(D0[4]), .B1(n4), .Y(S[4]) );
  AO22X1TS U9 ( .A0(D1[5]), .A1(n3), .B0(D0[5]), .B1(n4), .Y(S[5]) );
  AO22X1TS U10 ( .A0(D1[6]), .A1(n3), .B0(D0[6]), .B1(n4), .Y(S[6]) );
endmodule


module Multiplexer_AC_W23 ( ctrl, D0, D1, S );
  input [22:0] D0;
  input [22:0] D1;
  output [22:0] S;
  input ctrl;
  wire   n6, n7, n8, n9, n10;

  INVX2TS U1 ( .A(n10), .Y(n7) );
  CLKBUFX2TS U2 ( .A(n10), .Y(n8) );
  CLKBUFX2TS U3 ( .A(n10), .Y(n9) );
  INVX2TS U4 ( .A(n6), .Y(n10) );
  CLKBUFX2TS U5 ( .A(ctrl), .Y(n6) );
  AO22X1TS U6 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n10), .Y(S[0]) );
  AO22X1TS U7 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n8), .Y(S[1]) );
  AO22X1TS U8 ( .A0(D1[2]), .A1(n7), .B0(D0[2]), .B1(n8), .Y(S[2]) );
  AO22X1TS U9 ( .A0(D1[3]), .A1(n7), .B0(D0[3]), .B1(n8), .Y(S[3]) );
  AO22X1TS U10 ( .A0(D1[4]), .A1(n7), .B0(D0[4]), .B1(n8), .Y(S[4]) );
  AO22X1TS U11 ( .A0(D1[5]), .A1(n7), .B0(D0[5]), .B1(n8), .Y(S[5]) );
  AO22X1TS U12 ( .A0(D1[6]), .A1(n7), .B0(D0[6]), .B1(n8), .Y(S[6]) );
  AO22X1TS U13 ( .A0(D1[7]), .A1(n7), .B0(D0[7]), .B1(n8), .Y(S[7]) );
  AO22X1TS U14 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n10), .Y(S[10]) );
  AO22X1TS U15 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n9), .Y(S[11]) );
  AO22X1TS U16 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n9), .Y(S[12]) );
  AO22X1TS U17 ( .A0(D1[13]), .A1(ctrl), .B0(D0[13]), .B1(n9), .Y(S[13]) );
  AO22X1TS U18 ( .A0(D1[14]), .A1(ctrl), .B0(D0[14]), .B1(n9), .Y(S[14]) );
  AO22X1TS U19 ( .A0(D1[15]), .A1(ctrl), .B0(D0[15]), .B1(n10), .Y(S[15]) );
  AO22X1TS U20 ( .A0(D1[16]), .A1(n6), .B0(D0[16]), .B1(n9), .Y(S[16]) );
  AO22X1TS U21 ( .A0(D1[17]), .A1(n6), .B0(D0[17]), .B1(n9), .Y(S[17]) );
  AO22X1TS U22 ( .A0(D1[18]), .A1(n6), .B0(D0[18]), .B1(n9), .Y(S[18]) );
  AO22X1TS U23 ( .A0(D1[19]), .A1(n6), .B0(D0[19]), .B1(n9), .Y(S[19]) );
  AO22X1TS U24 ( .A0(D1[20]), .A1(n6), .B0(D0[20]), .B1(n8), .Y(S[20]) );
  AO22X1TS U25 ( .A0(D1[21]), .A1(n7), .B0(D0[21]), .B1(n8), .Y(S[21]) );
  AO22X1TS U26 ( .A0(D1[22]), .A1(n7), .B0(D0[22]), .B1(n8), .Y(S[22]) );
  AO22X1TS U27 ( .A0(D1[8]), .A1(n7), .B0(D0[8]), .B1(n9), .Y(S[8]) );
  AO22X1TS U28 ( .A0(n7), .A1(D1[9]), .B0(D0[9]), .B1(n9), .Y(S[9]) );
endmodule


module RegisterAdd_W32 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n65, n97, n75, n76, n77, n78, n79, n80, n81,
         n82, n83;

  DFFRX2TS \Q_reg[31]  ( .D(n65), .CK(clk), .RN(n75), .Q(Q[31]), .QN(n32) );
  DFFRX2TS \Q_reg[30]  ( .D(n63), .CK(clk), .RN(n75), .Q(Q[30]), .QN(n31) );
  DFFRX2TS \Q_reg[29]  ( .D(n62), .CK(clk), .RN(n75), .Q(Q[29]), .QN(n30) );
  DFFRX2TS \Q_reg[28]  ( .D(n61), .CK(clk), .RN(n75), .Q(Q[28]), .QN(n29) );
  DFFRX2TS \Q_reg[27]  ( .D(n60), .CK(clk), .RN(n75), .Q(Q[27]), .QN(n28) );
  DFFRX2TS \Q_reg[26]  ( .D(n59), .CK(clk), .RN(n75), .Q(Q[26]), .QN(n27) );
  DFFRX2TS \Q_reg[25]  ( .D(n58), .CK(clk), .RN(n75), .Q(Q[25]), .QN(n26) );
  DFFRX2TS \Q_reg[24]  ( .D(n57), .CK(clk), .RN(n75), .Q(Q[24]), .QN(n25) );
  DFFRX2TS \Q_reg[23]  ( .D(n56), .CK(clk), .RN(n75), .Q(Q[23]), .QN(n24) );
  DFFRX2TS \Q_reg[22]  ( .D(n55), .CK(clk), .RN(n75), .Q(Q[22]), .QN(n23) );
  DFFRX2TS \Q_reg[21]  ( .D(n54), .CK(clk), .RN(n76), .Q(Q[21]), .QN(n22) );
  DFFRX2TS \Q_reg[20]  ( .D(n53), .CK(clk), .RN(n76), .Q(Q[20]), .QN(n21) );
  DFFRX2TS \Q_reg[19]  ( .D(n52), .CK(clk), .RN(n76), .Q(Q[19]), .QN(n20) );
  DFFRX2TS \Q_reg[18]  ( .D(n51), .CK(clk), .RN(n76), .Q(Q[18]), .QN(n19) );
  DFFRX2TS \Q_reg[17]  ( .D(n50), .CK(clk), .RN(n76), .Q(Q[17]), .QN(n18) );
  DFFRX2TS \Q_reg[16]  ( .D(n49), .CK(clk), .RN(n76), .Q(Q[16]), .QN(n17) );
  DFFRX2TS \Q_reg[15]  ( .D(n48), .CK(clk), .RN(n76), .Q(Q[15]), .QN(n16) );
  DFFRX2TS \Q_reg[14]  ( .D(n47), .CK(clk), .RN(n76), .Q(Q[14]), .QN(n15) );
  DFFRX2TS \Q_reg[13]  ( .D(n46), .CK(clk), .RN(n76), .Q(Q[13]), .QN(n14) );
  DFFRX2TS \Q_reg[12]  ( .D(n45), .CK(clk), .RN(n76), .Q(Q[12]), .QN(n13) );
  DFFRX2TS \Q_reg[11]  ( .D(n44), .CK(clk), .RN(n77), .Q(Q[11]), .QN(n12) );
  DFFRX2TS \Q_reg[10]  ( .D(n43), .CK(clk), .RN(n77), .Q(Q[10]), .QN(n11) );
  DFFRX2TS \Q_reg[9]  ( .D(n42), .CK(clk), .RN(n77), .Q(Q[9]), .QN(n10) );
  DFFRX2TS \Q_reg[8]  ( .D(n41), .CK(clk), .RN(n77), .Q(Q[8]), .QN(n9) );
  DFFRX2TS \Q_reg[7]  ( .D(n40), .CK(clk), .RN(n77), .Q(Q[7]), .QN(n8) );
  DFFRX2TS \Q_reg[6]  ( .D(n39), .CK(clk), .RN(n77), .Q(Q[6]), .QN(n7) );
  DFFRX2TS \Q_reg[5]  ( .D(n38), .CK(clk), .RN(n77), .Q(Q[5]), .QN(n6) );
  DFFRX2TS \Q_reg[4]  ( .D(n37), .CK(clk), .RN(n77), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[3]  ( .D(n36), .CK(clk), .RN(n77), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[2]  ( .D(n35), .CK(clk), .RN(n77), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n34), .CK(clk), .RN(n97), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n33), .CK(clk), .RN(n97), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(n83), .Y(n78) );
  CLKBUFX2TS U3 ( .A(n83), .Y(n79) );
  CLKBUFX2TS U4 ( .A(n82), .Y(n80) );
  CLKBUFX2TS U5 ( .A(n82), .Y(n81) );
  CLKBUFX2TS U6 ( .A(n97), .Y(n77) );
  CLKBUFX2TS U7 ( .A(n97), .Y(n76) );
  CLKBUFX2TS U8 ( .A(n97), .Y(n75) );
  OAI2BB2XLTS U9 ( .B0(n1), .B1(n80), .A0N(D[0]), .A1N(load), .Y(n33) );
  OAI2BB2XLTS U10 ( .B0(n31), .B1(n78), .A0N(D[30]), .A1N(load), .Y(n63) );
  OAI2BB2XLTS U11 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(n82), .Y(n34) );
  OAI2BB2XLTS U12 ( .B0(n3), .B1(n80), .A0N(D[2]), .A1N(n82), .Y(n35) );
  OAI2BB2XLTS U13 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(n83), .Y(n36) );
  OAI2BB2XLTS U14 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(n82), .Y(n37) );
  OAI2BB2XLTS U15 ( .B0(n6), .B1(n83), .A0N(D[5]), .A1N(n81), .Y(n38) );
  OAI2BB2XLTS U16 ( .B0(n7), .B1(n82), .A0N(D[6]), .A1N(n81), .Y(n39) );
  OAI2BB2XLTS U17 ( .B0(n8), .B1(n83), .A0N(D[7]), .A1N(n81), .Y(n40) );
  OAI2BB2XLTS U18 ( .B0(n11), .B1(load), .A0N(D[10]), .A1N(n80), .Y(n43) );
  OAI2BB2XLTS U19 ( .B0(n12), .B1(n79), .A0N(D[11]), .A1N(n80), .Y(n44) );
  OAI2BB2XLTS U20 ( .B0(n13), .B1(n79), .A0N(D[12]), .A1N(n80), .Y(n45) );
  OAI2BB2XLTS U21 ( .B0(n14), .B1(n79), .A0N(D[13]), .A1N(n80), .Y(n46) );
  OAI2BB2XLTS U22 ( .B0(n15), .B1(n79), .A0N(D[14]), .A1N(n80), .Y(n47) );
  OAI2BB2XLTS U23 ( .B0(n16), .B1(load), .A0N(D[15]), .A1N(n81), .Y(n48) );
  OAI2BB2XLTS U24 ( .B0(n17), .B1(n79), .A0N(D[16]), .A1N(n80), .Y(n49) );
  OAI2BB2XLTS U25 ( .B0(n18), .B1(n79), .A0N(D[17]), .A1N(n80), .Y(n50) );
  OAI2BB2XLTS U26 ( .B0(n19), .B1(n79), .A0N(D[18]), .A1N(n81), .Y(n51) );
  OAI2BB2XLTS U27 ( .B0(n20), .B1(n79), .A0N(D[19]), .A1N(n81), .Y(n52) );
  OAI2BB2XLTS U28 ( .B0(n21), .B1(n79), .A0N(D[20]), .A1N(n81), .Y(n53) );
  OAI2BB2XLTS U29 ( .B0(n22), .B1(n78), .A0N(D[21]), .A1N(n82), .Y(n54) );
  OAI2BB2XLTS U30 ( .B0(n23), .B1(n78), .A0N(D[22]), .A1N(n81), .Y(n55) );
  OAI2BB2XLTS U31 ( .B0(n24), .B1(n78), .A0N(D[23]), .A1N(n81), .Y(n56) );
  OAI2BB2XLTS U32 ( .B0(n25), .B1(n78), .A0N(D[24]), .A1N(n83), .Y(n57) );
  OAI2BB2XLTS U33 ( .B0(n26), .B1(n78), .A0N(D[25]), .A1N(n82), .Y(n58) );
  OAI2BB2XLTS U34 ( .B0(n27), .B1(n78), .A0N(D[26]), .A1N(n83), .Y(n59) );
  OAI2BB2XLTS U35 ( .B0(n28), .B1(n78), .A0N(D[27]), .A1N(n83), .Y(n60) );
  OAI2BB2XLTS U36 ( .B0(n29), .B1(n78), .A0N(D[28]), .A1N(n83), .Y(n61) );
  OAI2BB2XLTS U37 ( .B0(n30), .B1(n78), .A0N(D[29]), .A1N(n83), .Y(n62) );
  OAI2BB2XLTS U38 ( .B0(n9), .B1(n82), .A0N(D[8]), .A1N(n80), .Y(n41) );
  OAI2BB2XLTS U39 ( .B0(n10), .B1(load), .A0N(D[9]), .A1N(n81), .Y(n42) );
  CLKBUFX2TS U40 ( .A(load), .Y(n83) );
  OAI2BB2XLTS U41 ( .B0(n32), .B1(n79), .A0N(n82), .A1N(D[31]), .Y(n65) );
  CLKBUFX2TS U42 ( .A(load), .Y(n82) );
  INVX2TS U43 ( .A(rst), .Y(n97) );
endmodule


module Tenth_Phase ( clk, rst, load_i, sel_a_i, sel_b_i, sign_i, exp_ieee_i, 
        sgf_ieee_i, final_result_ieee_o );
  input [7:0] exp_ieee_i;
  input [22:0] sgf_ieee_i;
  output [31:0] final_result_ieee_o;
  input clk, rst, load_i, sel_a_i, sel_b_i, sign_i;
  wire   overunder, Sign_S_mux;
  wire   [7:0] Exp_S_mux;
  wire   [22:0] Sgf_S_mux;

  Mux_3x1_W1 Sign_Mux ( .ctrl({sel_a_i, sel_b_i}), .D0(sign_i), .D1(1'b1), 
        .D2(1'b0), .S(Sign_S_mux) );
  Multiplexer_AC_W8 Exp_Mux ( .ctrl(overunder), .D0(exp_ieee_i), .D1({1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .S(Exp_S_mux) );
  Multiplexer_AC_W23 Sgf_Mux ( .ctrl(overunder), .D0(sgf_ieee_i), .D1({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .S(
        Sgf_S_mux) );
  RegisterAdd_W32 Final_Result_IEEE ( .clk(clk), .rst(rst), .load(load_i), .D(
        {Sign_S_mux, Exp_S_mux, Sgf_S_mux}), .Q(final_result_ieee_o) );
  OR2X2TS U4 ( .A(sel_a_i), .B(sel_b_i), .Y(overunder) );
endmodule

