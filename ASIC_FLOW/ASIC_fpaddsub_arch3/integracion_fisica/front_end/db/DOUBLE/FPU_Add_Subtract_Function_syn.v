/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Oct 20 23:55:19 2016
/////////////////////////////////////////////////////////////


module RegisterAdd_W1_8 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n5, n1, n2, n3;

  DFFRXLTS Q_reg_0_ ( .D(n2), .CK(clk), .RN(n1), .Q(n5), .QN(n3) );
  INVX2TS U2 ( .A(n3), .Y(Q[0]) );
  OR2X1TS U3 ( .A(n5), .B(load), .Y(n2) );
  INVX2TS U4 ( .A(rst), .Y(n1) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W64_2 ( clk, rst, load, D, Q );
  input [63:0] D;
  output [63:0] Q;
  input clk, rst, load;
  wire   n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22;

  DFFRXLTS Q_reg_63_ ( .D(n130), .CK(clk), .RN(n17), .Q(Q[63]) );
  DFFRXLTS Q_reg_62_ ( .D(n128), .CK(clk), .RN(n22), .Q(Q[62]) );
  DFFRXLTS Q_reg_61_ ( .D(n127), .CK(clk), .RN(n22), .Q(Q[61]) );
  DFFRXLTS Q_reg_60_ ( .D(n126), .CK(clk), .RN(n22), .Q(Q[60]) );
  DFFRXLTS Q_reg_59_ ( .D(n125), .CK(clk), .RN(n22), .Q(Q[59]) );
  DFFRXLTS Q_reg_58_ ( .D(n124), .CK(clk), .RN(n21), .Q(Q[58]) );
  DFFRXLTS Q_reg_57_ ( .D(n123), .CK(clk), .RN(n21), .Q(Q[57]) );
  DFFRXLTS Q_reg_56_ ( .D(n122), .CK(clk), .RN(n21), .Q(Q[56]) );
  DFFRXLTS Q_reg_55_ ( .D(n121), .CK(clk), .RN(n21), .Q(Q[55]) );
  DFFRXLTS Q_reg_54_ ( .D(n120), .CK(clk), .RN(n21), .Q(Q[54]) );
  DFFRXLTS Q_reg_53_ ( .D(n119), .CK(clk), .RN(n21), .Q(Q[53]) );
  DFFRXLTS Q_reg_52_ ( .D(n118), .CK(clk), .RN(n21), .Q(Q[52]) );
  DFFRXLTS Q_reg_51_ ( .D(n117), .CK(clk), .RN(n21), .Q(Q[51]) );
  DFFRXLTS Q_reg_50_ ( .D(n116), .CK(clk), .RN(n21), .Q(Q[50]) );
  DFFRXLTS Q_reg_49_ ( .D(n115), .CK(clk), .RN(n21), .Q(Q[49]) );
  DFFRXLTS Q_reg_48_ ( .D(n114), .CK(clk), .RN(n20), .Q(Q[48]) );
  DFFRXLTS Q_reg_47_ ( .D(n113), .CK(clk), .RN(n20), .Q(Q[47]) );
  DFFRXLTS Q_reg_46_ ( .D(n112), .CK(clk), .RN(n20), .Q(Q[46]) );
  DFFRXLTS Q_reg_45_ ( .D(n111), .CK(clk), .RN(n20), .Q(Q[45]) );
  DFFRXLTS Q_reg_44_ ( .D(n110), .CK(clk), .RN(n20), .Q(Q[44]) );
  DFFRXLTS Q_reg_43_ ( .D(n109), .CK(clk), .RN(n20), .Q(Q[43]) );
  DFFRXLTS Q_reg_42_ ( .D(n108), .CK(clk), .RN(n20), .Q(Q[42]) );
  DFFRXLTS Q_reg_41_ ( .D(n107), .CK(clk), .RN(n20), .Q(Q[41]) );
  DFFRXLTS Q_reg_40_ ( .D(n106), .CK(clk), .RN(n20), .Q(Q[40]) );
  DFFRXLTS Q_reg_39_ ( .D(n105), .CK(clk), .RN(n20), .Q(Q[39]) );
  DFFRXLTS Q_reg_38_ ( .D(n104), .CK(clk), .RN(n22), .Q(Q[38]) );
  DFFRXLTS Q_reg_37_ ( .D(n103), .CK(clk), .RN(n129), .Q(Q[37]) );
  DFFRXLTS Q_reg_36_ ( .D(n102), .CK(clk), .RN(n129), .Q(Q[36]) );
  DFFRXLTS Q_reg_35_ ( .D(n101), .CK(clk), .RN(n129), .Q(Q[35]) );
  DFFRXLTS Q_reg_34_ ( .D(n100), .CK(clk), .RN(n129), .Q(Q[34]) );
  DFFRXLTS Q_reg_33_ ( .D(n99), .CK(clk), .RN(n22), .Q(Q[33]) );
  DFFRXLTS Q_reg_32_ ( .D(n98), .CK(clk), .RN(n22), .Q(Q[32]) );
  DFFRXLTS Q_reg_31_ ( .D(n97), .CK(clk), .RN(n22), .Q(Q[31]) );
  DFFRXLTS Q_reg_30_ ( .D(n96), .CK(clk), .RN(n22), .Q(Q[30]) );
  DFFRXLTS Q_reg_29_ ( .D(n95), .CK(clk), .RN(n22), .Q(Q[29]) );
  DFFRXLTS Q_reg_28_ ( .D(n94), .CK(clk), .RN(n19), .Q(Q[28]) );
  DFFRXLTS Q_reg_27_ ( .D(n93), .CK(clk), .RN(n19), .Q(Q[27]) );
  DFFRXLTS Q_reg_26_ ( .D(n92), .CK(clk), .RN(n19), .Q(Q[26]) );
  DFFRXLTS Q_reg_25_ ( .D(n91), .CK(clk), .RN(n19), .Q(Q[25]) );
  DFFRXLTS Q_reg_24_ ( .D(n90), .CK(clk), .RN(n19), .Q(Q[24]) );
  DFFRXLTS Q_reg_23_ ( .D(n89), .CK(clk), .RN(n19), .Q(Q[23]) );
  DFFRXLTS Q_reg_22_ ( .D(n88), .CK(clk), .RN(n19), .Q(Q[22]) );
  DFFRXLTS Q_reg_21_ ( .D(n87), .CK(clk), .RN(n19), .Q(Q[21]) );
  DFFRXLTS Q_reg_20_ ( .D(n86), .CK(clk), .RN(n19), .Q(Q[20]) );
  DFFRXLTS Q_reg_19_ ( .D(n85), .CK(clk), .RN(n19), .Q(Q[19]) );
  DFFRXLTS Q_reg_18_ ( .D(n84), .CK(clk), .RN(n18), .Q(Q[18]) );
  DFFRXLTS Q_reg_17_ ( .D(n83), .CK(clk), .RN(n18), .Q(Q[17]) );
  DFFRXLTS Q_reg_16_ ( .D(n82), .CK(clk), .RN(n18), .Q(Q[16]) );
  DFFRXLTS Q_reg_15_ ( .D(n81), .CK(clk), .RN(n18), .Q(Q[15]) );
  DFFRXLTS Q_reg_14_ ( .D(n80), .CK(clk), .RN(n18), .Q(Q[14]) );
  DFFRXLTS Q_reg_13_ ( .D(n79), .CK(clk), .RN(n18), .Q(Q[13]) );
  DFFRXLTS Q_reg_12_ ( .D(n78), .CK(clk), .RN(n18), .Q(Q[12]) );
  DFFRXLTS Q_reg_11_ ( .D(n77), .CK(clk), .RN(n18), .Q(Q[11]) );
  DFFRXLTS Q_reg_10_ ( .D(n76), .CK(clk), .RN(n18), .Q(Q[10]) );
  DFFRXLTS Q_reg_9_ ( .D(n75), .CK(clk), .RN(n18), .Q(Q[9]) );
  DFFRXLTS Q_reg_8_ ( .D(n74), .CK(clk), .RN(n17), .Q(Q[8]) );
  DFFRXLTS Q_reg_7_ ( .D(n73), .CK(clk), .RN(n17), .Q(Q[7]) );
  DFFRXLTS Q_reg_6_ ( .D(n72), .CK(clk), .RN(n17), .Q(Q[6]) );
  DFFRXLTS Q_reg_5_ ( .D(n71), .CK(clk), .RN(n17), .Q(Q[5]) );
  DFFRXLTS Q_reg_4_ ( .D(n70), .CK(clk), .RN(n17), .Q(Q[4]) );
  DFFRXLTS Q_reg_3_ ( .D(n69), .CK(clk), .RN(n17), .Q(Q[3]) );
  DFFRXLTS Q_reg_2_ ( .D(n68), .CK(clk), .RN(n17), .Q(Q[2]) );
  DFFRXLTS Q_reg_1_ ( .D(n67), .CK(clk), .RN(n17), .Q(Q[1]) );
  DFFRXLTS Q_reg_0_ ( .D(n66), .CK(clk), .RN(n17), .Q(Q[0]) );
  AO22XLTS U2 ( .A0(n9), .A1(D[0]), .B0(n10), .B1(Q[0]), .Y(n66) );
  AO22XLTS U3 ( .A0(n6), .A1(D[1]), .B0(n10), .B1(Q[1]), .Y(n67) );
  AO22XLTS U4 ( .A0(n2), .A1(D[2]), .B0(n10), .B1(Q[2]), .Y(n68) );
  AO22XLTS U5 ( .A0(n4), .A1(D[3]), .B0(n10), .B1(Q[3]), .Y(n69) );
  AO22XLTS U6 ( .A0(n7), .A1(D[4]), .B0(n10), .B1(Q[4]), .Y(n70) );
  AO22XLTS U7 ( .A0(n2), .A1(D[5]), .B0(n10), .B1(Q[5]), .Y(n71) );
  AO22XLTS U8 ( .A0(n2), .A1(D[6]), .B0(n10), .B1(Q[6]), .Y(n72) );
  AO22XLTS U9 ( .A0(n6), .A1(D[7]), .B0(n10), .B1(Q[7]), .Y(n73) );
  AO22XLTS U10 ( .A0(n3), .A1(D[8]), .B0(n10), .B1(Q[8]), .Y(n74) );
  AO22XLTS U11 ( .A0(n4), .A1(D[9]), .B0(n10), .B1(Q[9]), .Y(n75) );
  AO22XLTS U12 ( .A0(n7), .A1(D[10]), .B0(n11), .B1(Q[10]), .Y(n76) );
  AO22XLTS U13 ( .A0(n9), .A1(D[11]), .B0(n11), .B1(Q[11]), .Y(n77) );
  AO22XLTS U14 ( .A0(n7), .A1(D[12]), .B0(n11), .B1(Q[12]), .Y(n78) );
  AO22XLTS U15 ( .A0(n3), .A1(D[13]), .B0(n11), .B1(Q[13]), .Y(n79) );
  AO22XLTS U16 ( .A0(n6), .A1(D[14]), .B0(n11), .B1(Q[14]), .Y(n80) );
  AO22XLTS U17 ( .A0(n7), .A1(D[15]), .B0(n11), .B1(Q[15]), .Y(n81) );
  AO22XLTS U18 ( .A0(n3), .A1(D[16]), .B0(n11), .B1(Q[16]), .Y(n82) );
  AO22XLTS U19 ( .A0(n4), .A1(D[17]), .B0(n11), .B1(Q[17]), .Y(n83) );
  AO22XLTS U20 ( .A0(n6), .A1(D[18]), .B0(n11), .B1(Q[18]), .Y(n84) );
  AO22XLTS U21 ( .A0(n3), .A1(D[19]), .B0(n11), .B1(Q[19]), .Y(n85) );
  AO22XLTS U22 ( .A0(n8), .A1(D[20]), .B0(n12), .B1(Q[20]), .Y(n86) );
  AO22XLTS U23 ( .A0(n7), .A1(D[21]), .B0(n12), .B1(Q[21]), .Y(n87) );
  AO22XLTS U24 ( .A0(n9), .A1(D[22]), .B0(n12), .B1(Q[22]), .Y(n88) );
  AO22XLTS U25 ( .A0(n6), .A1(D[23]), .B0(n12), .B1(Q[23]), .Y(n89) );
  AO22XLTS U26 ( .A0(n2), .A1(D[24]), .B0(n12), .B1(Q[24]), .Y(n90) );
  AO22XLTS U27 ( .A0(n3), .A1(D[25]), .B0(n12), .B1(Q[25]), .Y(n91) );
  AO22XLTS U28 ( .A0(n7), .A1(D[26]), .B0(n12), .B1(Q[26]), .Y(n92) );
  AO22XLTS U29 ( .A0(n8), .A1(D[27]), .B0(n12), .B1(Q[27]), .Y(n93) );
  AO22XLTS U30 ( .A0(n4), .A1(D[28]), .B0(n12), .B1(Q[28]), .Y(n94) );
  AO22XLTS U31 ( .A0(n6), .A1(D[29]), .B0(n12), .B1(Q[29]), .Y(n95) );
  AO22XLTS U32 ( .A0(n4), .A1(D[30]), .B0(n14), .B1(Q[30]), .Y(n96) );
  AO22XLTS U33 ( .A0(n2), .A1(D[31]), .B0(n14), .B1(Q[31]), .Y(n97) );
  AO22XLTS U34 ( .A0(n7), .A1(D[32]), .B0(n16), .B1(Q[32]), .Y(n98) );
  AO22XLTS U35 ( .A0(n2), .A1(D[33]), .B0(n14), .B1(Q[33]), .Y(n99) );
  AO22XLTS U36 ( .A0(n9), .A1(D[34]), .B0(n16), .B1(Q[34]), .Y(n100) );
  AO22XLTS U37 ( .A0(n2), .A1(D[35]), .B0(n14), .B1(Q[35]), .Y(n101) );
  AO22XLTS U38 ( .A0(n8), .A1(D[36]), .B0(n16), .B1(Q[36]), .Y(n102) );
  AO22XLTS U39 ( .A0(n8), .A1(D[37]), .B0(n16), .B1(Q[37]), .Y(n103) );
  AO22XLTS U40 ( .A0(n6), .A1(D[38]), .B0(n16), .B1(Q[38]), .Y(n104) );
  AO22XLTS U41 ( .A0(n4), .A1(D[39]), .B0(n16), .B1(Q[39]), .Y(n105) );
  AO22XLTS U42 ( .A0(n7), .A1(D[40]), .B0(n13), .B1(Q[40]), .Y(n106) );
  AO22XLTS U43 ( .A0(n3), .A1(D[41]), .B0(n13), .B1(Q[41]), .Y(n107) );
  AO22XLTS U44 ( .A0(n3), .A1(D[42]), .B0(n13), .B1(Q[42]), .Y(n108) );
  AO22XLTS U45 ( .A0(n7), .A1(D[43]), .B0(n13), .B1(Q[43]), .Y(n109) );
  AO22XLTS U46 ( .A0(n9), .A1(D[44]), .B0(n13), .B1(Q[44]), .Y(n110) );
  AO22XLTS U47 ( .A0(n2), .A1(D[45]), .B0(n13), .B1(Q[45]), .Y(n111) );
  AO22XLTS U48 ( .A0(n8), .A1(D[46]), .B0(n13), .B1(Q[46]), .Y(n112) );
  AO22XLTS U49 ( .A0(n3), .A1(D[47]), .B0(n13), .B1(Q[47]), .Y(n113) );
  AO22XLTS U50 ( .A0(n4), .A1(D[48]), .B0(n13), .B1(Q[48]), .Y(n114) );
  AO22XLTS U51 ( .A0(n4), .A1(D[49]), .B0(n13), .B1(Q[49]), .Y(n115) );
  AO22XLTS U52 ( .A0(n6), .A1(D[50]), .B0(n15), .B1(Q[50]), .Y(n116) );
  AO22XLTS U53 ( .A0(n8), .A1(D[51]), .B0(n15), .B1(Q[51]), .Y(n117) );
  AO22XLTS U54 ( .A0(n8), .A1(D[52]), .B0(n15), .B1(Q[52]), .Y(n118) );
  AO22XLTS U55 ( .A0(n7), .A1(D[53]), .B0(n15), .B1(Q[53]), .Y(n119) );
  AO22XLTS U56 ( .A0(n6), .A1(D[54]), .B0(n15), .B1(Q[54]), .Y(n120) );
  AO22XLTS U57 ( .A0(n4), .A1(D[55]), .B0(n15), .B1(Q[55]), .Y(n121) );
  AO22XLTS U58 ( .A0(n3), .A1(D[56]), .B0(n15), .B1(Q[56]), .Y(n122) );
  AO22XLTS U59 ( .A0(n6), .A1(D[57]), .B0(n15), .B1(Q[57]), .Y(n123) );
  AO22XLTS U60 ( .A0(n8), .A1(D[58]), .B0(n15), .B1(Q[58]), .Y(n124) );
  AO22XLTS U61 ( .A0(n8), .A1(D[59]), .B0(n15), .B1(Q[59]), .Y(n125) );
  AO22XLTS U62 ( .A0(n2), .A1(D[60]), .B0(n16), .B1(Q[60]), .Y(n126) );
  AO22XLTS U63 ( .A0(n9), .A1(D[61]), .B0(n16), .B1(Q[61]), .Y(n127) );
  AO22XLTS U64 ( .A0(n2), .A1(D[62]), .B0(n16), .B1(Q[62]), .Y(n128) );
  AO22XLTS U65 ( .A0(n9), .A1(D[63]), .B0(n16), .B1(Q[63]), .Y(n130) );
  INVX2TS U66 ( .A(n5), .Y(n2) );
  INVX2TS U67 ( .A(n5), .Y(n3) );
  INVX2TS U68 ( .A(n5), .Y(n4) );
  INVX2TS U69 ( .A(load), .Y(n5) );
  INVX2TS U70 ( .A(n5), .Y(n6) );
  INVX2TS U71 ( .A(n5), .Y(n7) );
  INVX2TS U72 ( .A(n5), .Y(n8) );
  INVX2TS U73 ( .A(n5), .Y(n9) );
  INVX2TS U74 ( .A(rst), .Y(n129) );
  CLKBUFX2TS U75 ( .A(n129), .Y(n17) );
  CLKBUFX2TS U76 ( .A(n129), .Y(n18) );
  CLKBUFX2TS U77 ( .A(n129), .Y(n19) );
  CLKBUFX2TS U78 ( .A(n129), .Y(n20) );
  CLKBUFX2TS U79 ( .A(n129), .Y(n21) );
  CLKBUFX2TS U80 ( .A(n129), .Y(n22) );
  INVX2TS U81 ( .A(n9), .Y(n14) );
  CLKBUFX2TS U82 ( .A(n14), .Y(n10) );
  CLKBUFX2TS U83 ( .A(n14), .Y(n11) );
  CLKBUFX2TS U84 ( .A(n14), .Y(n12) );
  CLKBUFX2TS U85 ( .A(n14), .Y(n16) );
  CLKBUFX2TS U86 ( .A(n14), .Y(n13) );
  CLKBUFX2TS U87 ( .A(n14), .Y(n15) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_1 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4, n2;

  DFFRXLTS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n3), .Q(Q[0]) );
  AO22XLTS U2 ( .A0(n2), .A1(Q[0]), .B0(load), .B1(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n3) );
  INVX2TS U4 ( .A(load), .Y(n2) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W11_1 ( ctrl, D0, D1, S );
  input [10:0] D0;
  input [10:0] D1;
  output [10:0] S;
  input ctrl;
  wire   n1, n2, n3;

  AO22XLTS U1 ( .A0(ctrl), .A1(D1[0]), .B0(n2), .B1(D0[0]), .Y(S[0]) );
  AO22XLTS U2 ( .A0(n1), .A1(D1[9]), .B0(n3), .B1(D0[9]), .Y(S[9]) );
  AO22XLTS U3 ( .A0(ctrl), .A1(D1[7]), .B0(n3), .B1(D0[7]), .Y(S[7]) );
  AO22XLTS U4 ( .A0(ctrl), .A1(D1[5]), .B0(n3), .B1(D0[5]), .Y(S[5]) );
  AO22XLTS U5 ( .A0(n1), .A1(D1[10]), .B0(n2), .B1(D0[10]), .Y(S[10]) );
  AO22XLTS U6 ( .A0(ctrl), .A1(D1[8]), .B0(n2), .B1(D0[8]), .Y(S[8]) );
  AO22XLTS U7 ( .A0(ctrl), .A1(D1[6]), .B0(n2), .B1(D0[6]), .Y(S[6]) );
  AO22XLTS U8 ( .A0(ctrl), .A1(D1[4]), .B0(n2), .B1(D0[4]), .Y(S[4]) );
  AO22XLTS U9 ( .A0(ctrl), .A1(D1[2]), .B0(n2), .B1(D0[2]), .Y(S[2]) );
  AO22XLTS U10 ( .A0(ctrl), .A1(D1[3]), .B0(n3), .B1(D0[3]), .Y(S[3]) );
  AO22XLTS U11 ( .A0(ctrl), .A1(D1[1]), .B0(n2), .B1(D0[1]), .Y(S[1]) );
  INVX2TS U12 ( .A(n3), .Y(n1) );
  INVX2TS U13 ( .A(n1), .Y(n2) );
  INVX2TS U14 ( .A(ctrl), .Y(n3) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Mux_3x1_W11 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [10:0] D0;
  input [10:0] D1;
  input [10:0] D2;
  output [10:0] S;
  wire   n17, n18, n19;

  AO22XLTS U2 ( .A0(n19), .A1(D1[5]), .B0(n18), .B1(D0[5]), .Y(S[5]) );
  AO22XLTS U3 ( .A0(n19), .A1(D1[4]), .B0(n18), .B1(D0[4]), .Y(S[4]) );
  AO22XLTS U4 ( .A0(n19), .A1(D1[2]), .B0(n18), .B1(D0[2]), .Y(S[2]) );
  NOR2XLTS U5 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n18) );
  AO22XLTS U6 ( .A0(n19), .A1(D1[3]), .B0(n18), .B1(D0[3]), .Y(S[3]) );
  AO22XLTS U7 ( .A0(n19), .A1(D1[1]), .B0(n18), .B1(D0[1]), .Y(S[1]) );
  CLKAND2X2TS U8 ( .A(n18), .B(D0[6]), .Y(S[6]) );
  CLKAND2X2TS U9 ( .A(n18), .B(D0[7]), .Y(S[7]) );
  CLKAND2X2TS U10 ( .A(n18), .B(D0[8]), .Y(S[8]) );
  CLKAND2X2TS U11 ( .A(n18), .B(D0[9]), .Y(S[9]) );
  CLKAND2X2TS U12 ( .A(n18), .B(D0[10]), .Y(S[10]) );
  NOR2XLTS U13 ( .A(ctrl[1]), .B(D0[0]), .Y(n17) );
  NOR2BX1TS U14 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(n19) );
  OAI2BB2XLTS U15 ( .B0(ctrl[0]), .B1(n17), .A0N(D1[0]), .A1N(n19), .Y(S[0])
         );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Exp_Operation_EW11 ( clk, rst, load_a_i, load_b_i, Data_A_i, Data_B_i, 
        Add_Subt_i, Data_Result_o, Overflow_flag_o, Underflow_flag_o );
  input [10:0] Data_A_i;
  input [10:0] Data_B_i;
  output [10:0] Data_Result_o;
  input clk, rst, load_a_i, load_b_i, Add_Subt_i;
  output Overflow_flag_o, Underflow_flag_o;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         DP_OP_11J2_122_2824_n26, DP_OP_11J2_122_2824_n25,
         DP_OP_11J2_122_2824_n24, DP_OP_11J2_122_2824_n23,
         DP_OP_11J2_122_2824_n22, DP_OP_11J2_122_2824_n21,
         DP_OP_11J2_122_2824_n20, DP_OP_11J2_122_2824_n19,
         DP_OP_11J2_122_2824_n18, DP_OP_11J2_122_2824_n17,
         DP_OP_11J2_122_2824_n16, DP_OP_11J2_122_2824_n11,
         DP_OP_11J2_122_2824_n10, DP_OP_11J2_122_2824_n9,
         DP_OP_11J2_122_2824_n8, DP_OP_11J2_122_2824_n7,
         DP_OP_11J2_122_2824_n6, DP_OP_11J2_122_2824_n5,
         DP_OP_11J2_122_2824_n4, DP_OP_11J2_122_2824_n3,
         DP_OP_11J2_122_2824_n2, DP_OP_11J2_122_2824_n1, n1, n2, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [10:0] Data_S;

  DFFRXLTS exp_result_Q_reg_0_ ( .D(n16), .CK(clk), .RN(n15), .Q(
        Data_Result_o[0]) );
  DFFRXLTS exp_result_Q_reg_1_ ( .D(n14), .CK(clk), .RN(n18), .Q(
        Data_Result_o[1]) );
  DFFRXLTS exp_result_Q_reg_2_ ( .D(n13), .CK(clk), .RN(n15), .Q(
        Data_Result_o[2]) );
  DFFRXLTS exp_result_Q_reg_3_ ( .D(n12), .CK(clk), .RN(n18), .Q(
        Data_Result_o[3]) );
  DFFRXLTS exp_result_Q_reg_4_ ( .D(n11), .CK(clk), .RN(n15), .Q(
        Data_Result_o[4]) );
  DFFRXLTS exp_result_Q_reg_5_ ( .D(n10), .CK(clk), .RN(n18), .Q(
        Data_Result_o[5]) );
  DFFRXLTS exp_result_Q_reg_6_ ( .D(n9), .CK(clk), .RN(n15), .Q(
        Data_Result_o[6]) );
  DFFRXLTS exp_result_Q_reg_7_ ( .D(n8), .CK(clk), .RN(n18), .Q(
        Data_Result_o[7]) );
  DFFRXLTS exp_result_Q_reg_8_ ( .D(n7), .CK(clk), .RN(n15), .Q(
        Data_Result_o[8]) );
  DFFRXLTS exp_result_Q_reg_9_ ( .D(n6), .CK(clk), .RN(n18), .Q(
        Data_Result_o[9]) );
  DFFRXLTS exp_result_Q_reg_10_ ( .D(n5), .CK(clk), .RN(n15), .Q(
        Data_Result_o[10]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U12 ( .A(Data_A_i[0]), .B(Add_Subt_i), .C(
        DP_OP_11J2_122_2824_n26), .CO(DP_OP_11J2_122_2824_n11), .S(Data_S[0])
         );
  CMPR32X2TS DP_OP_11J2_122_2824_U11 ( .A(DP_OP_11J2_122_2824_n25), .B(
        Data_A_i[1]), .C(DP_OP_11J2_122_2824_n11), .CO(DP_OP_11J2_122_2824_n10), .S(Data_S[1]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U10 ( .A(DP_OP_11J2_122_2824_n24), .B(
        Data_A_i[2]), .C(DP_OP_11J2_122_2824_n10), .CO(DP_OP_11J2_122_2824_n9), 
        .S(Data_S[2]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U9 ( .A(DP_OP_11J2_122_2824_n23), .B(
        Data_A_i[3]), .C(DP_OP_11J2_122_2824_n9), .CO(DP_OP_11J2_122_2824_n8), 
        .S(Data_S[3]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U8 ( .A(DP_OP_11J2_122_2824_n22), .B(
        Data_A_i[4]), .C(DP_OP_11J2_122_2824_n8), .CO(DP_OP_11J2_122_2824_n7), 
        .S(Data_S[4]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U7 ( .A(DP_OP_11J2_122_2824_n21), .B(
        Data_A_i[5]), .C(DP_OP_11J2_122_2824_n7), .CO(DP_OP_11J2_122_2824_n6), 
        .S(Data_S[5]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U6 ( .A(DP_OP_11J2_122_2824_n20), .B(
        Data_A_i[6]), .C(DP_OP_11J2_122_2824_n6), .CO(DP_OP_11J2_122_2824_n5), 
        .S(Data_S[6]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U5 ( .A(DP_OP_11J2_122_2824_n19), .B(
        Data_A_i[7]), .C(DP_OP_11J2_122_2824_n5), .CO(DP_OP_11J2_122_2824_n4), 
        .S(Data_S[7]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U4 ( .A(DP_OP_11J2_122_2824_n18), .B(
        Data_A_i[8]), .C(DP_OP_11J2_122_2824_n4), .CO(DP_OP_11J2_122_2824_n3), 
        .S(Data_S[8]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U3 ( .A(DP_OP_11J2_122_2824_n17), .B(
        Data_A_i[9]), .C(DP_OP_11J2_122_2824_n3), .CO(DP_OP_11J2_122_2824_n2), 
        .S(Data_S[9]) );
  CMPR32X2TS DP_OP_11J2_122_2824_U2 ( .A(DP_OP_11J2_122_2824_n16), .B(
        Data_A_i[10]), .C(DP_OP_11J2_122_2824_n2), .CO(DP_OP_11J2_122_2824_n1), 
        .S(Data_S[10]) );
  DFFRXLTS Underflow_Q_reg_0_ ( .D(n4), .CK(clk), .RN(n18), .Q(
        Underflow_flag_o) );
  DFFRXLTS Overflow_Q_reg_0_ ( .D(n3), .CK(clk), .RN(n15), .Q(Overflow_flag_o)
         );
  NOR4BXLTS U1 ( .AN(load_b_i), .B(Data_S[2]), .C(Data_S[1]), .D(Data_S[0]), 
        .Y(n25) );
  XOR2XLTS U2 ( .A(Add_Subt_i), .B(Data_B_i[0]), .Y(DP_OP_11J2_122_2824_n26)
         );
  XOR2XLTS U3 ( .A(DP_OP_11J2_122_2824_n1), .B(Add_Subt_i), .Y(n27) );
  XOR2XLTS U4 ( .A(Add_Subt_i), .B(Data_B_i[5]), .Y(DP_OP_11J2_122_2824_n21)
         );
  XOR2XLTS U5 ( .A(Add_Subt_i), .B(Data_B_i[10]), .Y(DP_OP_11J2_122_2824_n16)
         );
  XOR2XLTS U6 ( .A(Add_Subt_i), .B(Data_B_i[4]), .Y(DP_OP_11J2_122_2824_n22)
         );
  XOR2XLTS U7 ( .A(Add_Subt_i), .B(Data_B_i[2]), .Y(DP_OP_11J2_122_2824_n24)
         );
  XOR2XLTS U8 ( .A(Add_Subt_i), .B(Data_B_i[3]), .Y(DP_OP_11J2_122_2824_n23)
         );
  XOR2XLTS U9 ( .A(Add_Subt_i), .B(Data_B_i[1]), .Y(DP_OP_11J2_122_2824_n25)
         );
  CLKAND2X2TS U10 ( .A(Data_S[0]), .B(load_a_i), .Y(n31) );
  NAND4XLTS U11 ( .A(Data_S[9]), .B(Data_S[8]), .C(Data_S[7]), .D(n20), .Y(n22) );
  INVX2TS U12 ( .A(Data_S[10]), .Y(n23) );
  AO21XLTS U13 ( .A0(Underflow_flag_o), .A1(n30), .B0(n29), .Y(n4) );
  NOR4BXLTS U14 ( .AN(n28), .B(n27), .C(Data_S[10]), .D(Data_S[9]), .Y(n29) );
  NOR4BXLTS U15 ( .AN(n26), .B(Data_S[8]), .C(Data_S[7]), .D(Data_S[6]), .Y(
        n28) );
  AO22XLTS U16 ( .A0(Data_S[10]), .A1(n1), .B0(n17), .B1(Data_Result_o[10]), 
        .Y(n5) );
  AO22XLTS U17 ( .A0(Data_S[9]), .A1(n1), .B0(n17), .B1(Data_Result_o[9]), .Y(
        n6) );
  AO22XLTS U18 ( .A0(Data_S[8]), .A1(n1), .B0(n32), .B1(Data_Result_o[8]), .Y(
        n7) );
  AO22XLTS U19 ( .A0(Data_S[7]), .A1(load_a_i), .B0(n32), .B1(Data_Result_o[7]), .Y(n8) );
  AO22XLTS U20 ( .A0(Data_S[6]), .A1(load_a_i), .B0(n32), .B1(Data_Result_o[6]), .Y(n9) );
  AO22XLTS U21 ( .A0(Data_S[5]), .A1(load_a_i), .B0(n32), .B1(Data_Result_o[5]), .Y(n10) );
  AO22XLTS U22 ( .A0(Data_S[4]), .A1(load_a_i), .B0(n32), .B1(Data_Result_o[4]), .Y(n11) );
  AO22XLTS U23 ( .A0(Data_S[3]), .A1(load_a_i), .B0(n32), .B1(Data_Result_o[3]), .Y(n12) );
  AO22XLTS U24 ( .A0(Data_S[2]), .A1(load_a_i), .B0(n32), .B1(Data_Result_o[2]), .Y(n13) );
  AO22XLTS U25 ( .A0(Data_S[1]), .A1(load_a_i), .B0(n32), .B1(Data_Result_o[1]), .Y(n14) );
  AO21XLTS U26 ( .A0(n17), .A1(Data_Result_o[0]), .B0(n31), .Y(n16) );
  CLKBUFX2TS U27 ( .A(load_a_i), .Y(n1) );
  CLKBUFX2TS U28 ( .A(Add_Subt_i), .Y(n2) );
  CLKBUFX2TS U29 ( .A(n32), .Y(n17) );
  INVX2TS U30 ( .A(rst), .Y(n18) );
  NOR4BXLTS U31 ( .AN(n25), .B(Data_S[5]), .C(Data_S[4]), .D(Data_S[3]), .Y(
        n26) );
  INVX2TS U32 ( .A(n27), .Y(n24) );
  AND4X1TS U33 ( .A(Data_S[3]), .B(Data_S[2]), .C(Data_S[1]), .D(n31), .Y(n19)
         );
  AND4X1TS U34 ( .A(Data_S[6]), .B(Data_S[5]), .C(Data_S[4]), .D(n19), .Y(n20)
         );
  INVX2TS U35 ( .A(load_a_i), .Y(n32) );
  NAND2X1TS U36 ( .A(Overflow_flag_o), .B(n32), .Y(n21) );
  OAI31X1TS U37 ( .A0(n24), .A1(n23), .A2(n22), .B0(n21), .Y(n3) );
  XOR2XLTS U38 ( .A(n2), .B(Data_B_i[6]), .Y(DP_OP_11J2_122_2824_n20) );
  XOR2XLTS U39 ( .A(n2), .B(Data_B_i[7]), .Y(DP_OP_11J2_122_2824_n19) );
  XOR2XLTS U40 ( .A(n2), .B(Data_B_i[8]), .Y(DP_OP_11J2_122_2824_n18) );
  XOR2XLTS U41 ( .A(n2), .B(Data_B_i[9]), .Y(DP_OP_11J2_122_2824_n17) );
  INVX2TS U42 ( .A(load_b_i), .Y(n30) );
  INVX2TS U43 ( .A(rst), .Y(n15) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W1_439 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;


  NOR2BX1TS U1 ( .AN(D0[0]), .B(ctrl), .Y(S[0]) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W55_0 ( ctrl, D0, D1, S );
  input [54:0] D0;
  input [54:0] D1;
  output [54:0] S;
  input ctrl;

  assign S[2] = ctrl;
  assign S[54] = 1'b0;
  assign S[53] = 1'b0;
  assign S[52] = 1'b0;
  assign S[51] = 1'b0;
  assign S[50] = 1'b0;
  assign S[49] = 1'b0;
  assign S[48] = 1'b0;
  assign S[47] = 1'b0;
  assign S[46] = 1'b0;
  assign S[45] = 1'b0;
  assign S[44] = 1'b0;
  assign S[43] = 1'b0;
  assign S[42] = 1'b0;
  assign S[41] = 1'b0;
  assign S[40] = 1'b0;
  assign S[39] = 1'b0;
  assign S[38] = 1'b0;
  assign S[37] = 1'b0;
  assign S[36] = 1'b0;
  assign S[35] = 1'b0;
  assign S[34] = 1'b0;
  assign S[33] = 1'b0;
  assign S[32] = 1'b0;
  assign S[31] = 1'b0;
  assign S[30] = 1'b0;
  assign S[29] = 1'b0;
  assign S[28] = 1'b0;
  assign S[27] = 1'b0;
  assign S[26] = 1'b0;
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


module LZD_SWR55_EWR6 ( clk, rst, load_i, Add_subt_result_i, Shift_Value_o );
  input [54:0] Add_subt_result_i;
  output [5:0] Shift_Value_o;
  input clk, rst, load_i;
  wire   n8, n9, n10, n11, n12, n13, n14, n1, n2, n3, n4, n5, n6, n7, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138;

  DFFRXLTS Output_Reg_Q_reg_0_ ( .D(n14), .CK(clk), .RN(n13), .Q(
        Shift_Value_o[0]), .QN(n138) );
  DFFRXLTS Output_Reg_Q_reg_1_ ( .D(n12), .CK(clk), .RN(n13), .Q(
        Shift_Value_o[1]), .QN(n137) );
  DFFRXLTS Output_Reg_Q_reg_2_ ( .D(n11), .CK(clk), .RN(n13), .Q(
        Shift_Value_o[2]), .QN(n136) );
  DFFRXLTS Output_Reg_Q_reg_3_ ( .D(n10), .CK(clk), .RN(n13), .Q(
        Shift_Value_o[3]) );
  DFFRXLTS Output_Reg_Q_reg_4_ ( .D(n9), .CK(clk), .RN(n13), .Q(
        Shift_Value_o[4]), .QN(n135) );
  DFFRXLTS Output_Reg_Q_reg_5_ ( .D(n8), .CK(clk), .RN(n13), .Q(
        Shift_Value_o[5]) );
  AO22XLTS U1 ( .A0(load_i), .A1(n20), .B0(n132), .B1(Shift_Value_o[5]), .Y(n8) );
  AO22XLTS U2 ( .A0(load_i), .A1(n38), .B0(n132), .B1(Shift_Value_o[3]), .Y(
        n10) );
  NOR2XLTS U3 ( .A(Add_subt_result_i[52]), .B(Add_subt_result_i[51]), .Y(n54)
         );
  NOR2XLTS U4 ( .A(Add_subt_result_i[53]), .B(Add_subt_result_i[54]), .Y(n57)
         );
  AOI31XLTS U5 ( .A0(n80), .A1(Add_subt_result_i[47]), .A2(n79), .B0(n78), .Y(
        n81) );
  NOR2XLTS U6 ( .A(Add_subt_result_i[46]), .B(n50), .Y(n77) );
  NOR2XLTS U7 ( .A(Add_subt_result_i[13]), .B(Add_subt_result_i[14]), .Y(n21)
         );
  OR2X1TS U8 ( .A(Add_subt_result_i[42]), .B(n53), .Y(n114) );
  NOR2XLTS U9 ( .A(n52), .B(n2), .Y(n1) );
  NOR2XLTS U10 ( .A(n26), .B(n50), .Y(n29) );
  NOR2XLTS U11 ( .A(Add_subt_result_i[38]), .B(n52), .Y(n119) );
  NOR2XLTS U12 ( .A(Add_subt_result_i[26]), .B(n6), .Y(n121) );
  NOR2XLTS U13 ( .A(Add_subt_result_i[18]), .B(n41), .Y(n127) );
  OR2X1TS U14 ( .A(n33), .B(n32), .Y(n45) );
  AOI31XLTS U15 ( .A0(Add_subt_result_i[8]), .A1(n126), .A2(n72), .B0(n71), 
        .Y(n103) );
  INVX2TS U16 ( .A(rst), .Y(n13) );
  NOR2XLTS U17 ( .A(Add_subt_result_i[24]), .B(Add_subt_result_i[25]), .Y(n15)
         );
  NOR3XLTS U18 ( .A(Add_subt_result_i[27]), .B(Add_subt_result_i[28]), .C(
        Add_subt_result_i[29]), .Y(n24) );
  NOR4XLTS U19 ( .A(Add_subt_result_i[40]), .B(Add_subt_result_i[42]), .C(
        Add_subt_result_i[39]), .D(Add_subt_result_i[41]), .Y(n31) );
  OR4X2TS U20 ( .A(Add_subt_result_i[44]), .B(Add_subt_result_i[45]), .C(
        Add_subt_result_i[43]), .D(Add_subt_result_i[46]), .Y(n26) );
  NOR4XLTS U21 ( .A(Add_subt_result_i[48]), .B(Add_subt_result_i[49]), .C(
        Add_subt_result_i[47]), .D(Add_subt_result_i[50]), .Y(n43) );
  NOR4XLTS U22 ( .A(Add_subt_result_i[53]), .B(Add_subt_result_i[54]), .C(
        Add_subt_result_i[52]), .D(Add_subt_result_i[51]), .Y(n79) );
  NAND2X1TS U23 ( .A(n43), .B(n79), .Y(n50) );
  NAND2X1TS U24 ( .A(n31), .B(n29), .Y(n52) );
  NOR4XLTS U25 ( .A(Add_subt_result_i[36]), .B(Add_subt_result_i[37]), .C(
        Add_subt_result_i[35]), .D(Add_subt_result_i[38]), .Y(n17) );
  INVX2TS U26 ( .A(n17), .Y(n2) );
  NOR3XLTS U27 ( .A(Add_subt_result_i[32]), .B(Add_subt_result_i[34]), .C(
        Add_subt_result_i[33]), .Y(n4) );
  NAND2X1TS U28 ( .A(n1), .B(n4), .Y(n88) );
  NOR3XLTS U29 ( .A(Add_subt_result_i[31]), .B(Add_subt_result_i[30]), .C(n88), 
        .Y(n120) );
  NAND2X1TS U30 ( .A(n24), .B(n120), .Y(n6) );
  NAND2X1TS U31 ( .A(n15), .B(n121), .Y(n5) );
  NOR2XLTS U32 ( .A(Add_subt_result_i[23]), .B(n5), .Y(n20) );
  INVX2TS U33 ( .A(load_i), .Y(n132) );
  NOR2BX1TS U34 ( .AN(n120), .B(n24), .Y(n19) );
  INVX2TS U35 ( .A(Add_subt_result_i[31]), .Y(n3) );
  AOI211XLTS U36 ( .A0(n4), .A1(n3), .B0(n2), .C0(n52), .Y(n46) );
  NAND2BXLTS U37 ( .AN(n5), .B(Add_subt_result_i[23]), .Y(n86) );
  INVX2TS U38 ( .A(Add_subt_result_i[26]), .Y(n7) );
  AO21XLTS U39 ( .A0(n15), .A1(n7), .B0(n6), .Y(n16) );
  NAND2X1TS U40 ( .A(n86), .B(n16), .Y(n32) );
  INVX2TS U41 ( .A(Add_subt_result_i[30]), .Y(n74) );
  OAI22X1TS U42 ( .A0(n17), .A1(n52), .B0(n88), .B1(n74), .Y(n18) );
  NOR4XLTS U43 ( .A(n19), .B(n46), .C(n32), .D(n18), .Y(n22) );
  NOR2XLTS U44 ( .A(Add_subt_result_i[16]), .B(Add_subt_result_i[17]), .Y(n40)
         );
  NAND2BXLTS U45 ( .AN(Add_subt_result_i[22]), .B(n20), .Y(n125) );
  NOR3XLTS U46 ( .A(Add_subt_result_i[20]), .B(Add_subt_result_i[21]), .C(n125), .Y(n91) );
  NAND2BXLTS U47 ( .AN(Add_subt_result_i[19]), .B(n91), .Y(n41) );
  NAND2X1TS U48 ( .A(n40), .B(n127), .Y(n47) );
  NOR2XLTS U49 ( .A(Add_subt_result_i[15]), .B(n47), .Y(n34) );
  NAND2X1TS U50 ( .A(n34), .B(n21), .Y(n28) );
  NOR2XLTS U51 ( .A(Add_subt_result_i[12]), .B(n28), .Y(n35) );
  NAND2BXLTS U52 ( .AN(Add_subt_result_i[11]), .B(n35), .Y(n49) );
  NOR4XLTS U53 ( .A(Add_subt_result_i[8]), .B(Add_subt_result_i[9]), .C(
        Add_subt_result_i[10]), .D(Add_subt_result_i[7]), .Y(n30) );
  NAND2BXLTS U54 ( .AN(n49), .B(n30), .Y(n39) );
  AOI32X1TS U55 ( .A0(n22), .A1(load_i), .A2(n39), .B0(n135), .B1(n132), .Y(n9) );
  INVX2TS U56 ( .A(n50), .Y(n27) );
  INVX2TS U57 ( .A(Add_subt_result_i[14]), .Y(n23) );
  AND3X1TS U58 ( .A(n23), .B(Add_subt_result_i[13]), .C(n34), .Y(n131) );
  AOI211XLTS U59 ( .A0(n24), .A1(n74), .B0(Add_subt_result_i[31]), .C0(n88), 
        .Y(n25) );
  AOI211XLTS U60 ( .A0(n27), .A1(n26), .B0(n131), .C0(n25), .Y(n37) );
  NOR2BX1TS U61 ( .AN(Add_subt_result_i[12]), .B(n28), .Y(n66) );
  INVX2TS U62 ( .A(n29), .Y(n53) );
  OAI22X1TS U63 ( .A0(n31), .A1(n53), .B0(n30), .B1(n49), .Y(n33) );
  AOI211XLTS U64 ( .A0(Add_subt_result_i[14]), .A1(n34), .B0(n66), .C0(n45), 
        .Y(n36) );
  NAND2X1TS U65 ( .A(Add_subt_result_i[11]), .B(n35), .Y(n96) );
  NAND3XLTS U66 ( .A(n37), .B(n36), .C(n96), .Y(n38) );
  NOR2XLTS U67 ( .A(Add_subt_result_i[6]), .B(n39), .Y(n104) );
  NOR2BX1TS U68 ( .AN(n104), .B(Add_subt_result_i[5]), .Y(n101) );
  NOR2BX1TS U69 ( .AN(n101), .B(Add_subt_result_i[4]), .Y(n92) );
  NOR2BX1TS U70 ( .AN(n92), .B(Add_subt_result_i[3]), .Y(n73) );
  INVX2TS U71 ( .A(n79), .Y(n109) );
  NOR2BX1TS U72 ( .AN(n40), .B(Add_subt_result_i[18]), .Y(n42) );
  OAI22X1TS U73 ( .A0(n43), .A1(n109), .B0(n42), .B1(n41), .Y(n44) );
  NOR4XLTS U74 ( .A(n73), .B(n46), .C(n45), .D(n44), .Y(n48) );
  NAND2BXLTS U75 ( .AN(n47), .B(Add_subt_result_i[15]), .Y(n97) );
  AOI32X1TS U76 ( .A0(n48), .A1(load_i), .A2(n97), .B0(n136), .B1(n132), .Y(
        n11) );
  NOR2XLTS U77 ( .A(Add_subt_result_i[10]), .B(n49), .Y(n126) );
  INVX2TS U78 ( .A(Add_subt_result_i[9]), .Y(n72) );
  NAND2X1TS U79 ( .A(Add_subt_result_i[24]), .B(n121), .Y(n70) );
  INVX2TS U80 ( .A(Add_subt_result_i[29]), .Y(n65) );
  INVX2TS U81 ( .A(Add_subt_result_i[20]), .Y(n63) );
  INVX2TS U82 ( .A(Add_subt_result_i[45]), .Y(n113) );
  NOR2XLTS U83 ( .A(Add_subt_result_i[34]), .B(Add_subt_result_i[33]), .Y(n51)
         );
  AOI21X1TS U84 ( .A0(Add_subt_result_i[32]), .A1(n51), .B0(
        Add_subt_result_i[36]), .Y(n60) );
  INVX2TS U85 ( .A(n119), .Y(n59) );
  NOR2XLTS U86 ( .A(Add_subt_result_i[41]), .B(n114), .Y(n76) );
  INVX2TS U87 ( .A(Add_subt_result_i[48]), .Y(n55) );
  OAI31X1TS U88 ( .A0(Add_subt_result_i[49]), .A1(Add_subt_result_i[50]), .A2(
        n55), .B0(n54), .Y(n56) );
  AOI22X1TS U89 ( .A0(Add_subt_result_i[40]), .A1(n76), .B0(n57), .B1(n56), 
        .Y(n58) );
  OAI31X1TS U90 ( .A0(Add_subt_result_i[37]), .A1(n60), .A2(n59), .B0(n58), 
        .Y(n61) );
  AOI31XLTS U91 ( .A0(Add_subt_result_i[44]), .A1(n77), .A2(n113), .B0(n61), 
        .Y(n62) );
  OAI31X1TS U92 ( .A0(Add_subt_result_i[21]), .A1(n125), .A2(n63), .B0(n62), 
        .Y(n64) );
  AOI31XLTS U93 ( .A0(Add_subt_result_i[28]), .A1(n120), .A2(n65), .B0(n64), 
        .Y(n69) );
  INVX2TS U94 ( .A(Add_subt_result_i[17]), .Y(n67) );
  AOI31XLTS U95 ( .A0(Add_subt_result_i[16]), .A1(n127), .A2(n67), .B0(n66), 
        .Y(n68) );
  OAI211XLTS U96 ( .A0(Add_subt_result_i[25]), .A1(n70), .B0(n69), .C0(n68), 
        .Y(n71) );
  NOR2BX1TS U97 ( .AN(n73), .B(Add_subt_result_i[2]), .Y(n105) );
  NOR2BX1TS U98 ( .AN(n105), .B(Add_subt_result_i[1]), .Y(n100) );
  NOR2XLTS U99 ( .A(Add_subt_result_i[28]), .B(Add_subt_result_i[29]), .Y(n75)
         );
  AOI31XLTS U100 ( .A0(n75), .A1(Add_subt_result_i[27]), .A2(n74), .B0(
        Add_subt_result_i[31]), .Y(n89) );
  NOR2XLTS U101 ( .A(Add_subt_result_i[36]), .B(Add_subt_result_i[37]), .Y(n85) );
  INVX2TS U102 ( .A(Add_subt_result_i[39]), .Y(n83) );
  INVX2TS U103 ( .A(n76), .Y(n82) );
  NOR3XLTS U104 ( .A(Add_subt_result_i[48]), .B(Add_subt_result_i[49]), .C(
        Add_subt_result_i[50]), .Y(n80) );
  INVX2TS U105 ( .A(n77), .Y(n112) );
  NOR4BXLTS U106 ( .AN(Add_subt_result_i[43]), .B(Add_subt_result_i[44]), .C(
        Add_subt_result_i[45]), .D(n112), .Y(n78) );
  OAI31X1TS U107 ( .A0(Add_subt_result_i[40]), .A1(n83), .A2(n82), .B0(n81), 
        .Y(n84) );
  AOI31XLTS U108 ( .A0(n85), .A1(Add_subt_result_i[35]), .A2(n119), .B0(n84), 
        .Y(n87) );
  OAI211XLTS U109 ( .A0(n89), .A1(n88), .B0(n87), .C0(n86), .Y(n90) );
  AOI21X1TS U110 ( .A0(Add_subt_result_i[19]), .A1(n91), .B0(n90), .Y(n99) );
  NOR2XLTS U111 ( .A(Add_subt_result_i[8]), .B(Add_subt_result_i[9]), .Y(n95)
         );
  INVX2TS U112 ( .A(Add_subt_result_i[0]), .Y(n93) );
  AO22XLTS U113 ( .A0(n93), .A1(n100), .B0(Add_subt_result_i[3]), .B1(n92), 
        .Y(n94) );
  AOI31XLTS U114 ( .A0(n95), .A1(Add_subt_result_i[7]), .A2(n126), .B0(n94), 
        .Y(n98) );
  NAND4XLTS U115 ( .A(n99), .B(n98), .C(n97), .D(n96), .Y(n130) );
  AOI211XLTS U116 ( .A0(n101), .A1(Add_subt_result_i[4]), .B0(n100), .C0(n130), 
        .Y(n102) );
  AOI32X1TS U117 ( .A0(n103), .A1(load_i), .A2(n102), .B0(n137), .B1(n132), 
        .Y(n12) );
  AOI22X1TS U118 ( .A0(Add_subt_result_i[1]), .A1(n105), .B0(n104), .B1(
        Add_subt_result_i[5]), .Y(n134) );
  INVX2TS U119 ( .A(Add_subt_result_i[21]), .Y(n124) );
  INVX2TS U120 ( .A(Add_subt_result_i[33]), .Y(n107) );
  INVX2TS U121 ( .A(Add_subt_result_i[37]), .Y(n106) );
  OAI31X1TS U122 ( .A0(Add_subt_result_i[36]), .A1(Add_subt_result_i[34]), 
        .A2(n107), .B0(n106), .Y(n118) );
  INVX2TS U123 ( .A(Add_subt_result_i[52]), .Y(n108) );
  AOI21X1TS U124 ( .A0(Add_subt_result_i[51]), .A1(n108), .B0(
        Add_subt_result_i[53]), .Y(n111) );
  NOR2XLTS U125 ( .A(Add_subt_result_i[50]), .B(n109), .Y(n110) );
  OAI2BB2XLTS U126 ( .B0(Add_subt_result_i[54]), .B1(n111), .A0N(
        Add_subt_result_i[49]), .A1N(n110), .Y(n117) );
  INVX2TS U127 ( .A(Add_subt_result_i[41]), .Y(n115) );
  OAI22X1TS U128 ( .A0(n115), .A1(n114), .B0(n113), .B1(n112), .Y(n116) );
  AOI211XLTS U129 ( .A0(n119), .A1(n118), .B0(n117), .C0(n116), .Y(n123) );
  AOI22X1TS U130 ( .A0(Add_subt_result_i[25]), .A1(n121), .B0(
        Add_subt_result_i[29]), .B1(n120), .Y(n122) );
  OAI211XLTS U131 ( .A0(n125), .A1(n124), .B0(n123), .C0(n122), .Y(n129) );
  AO22XLTS U132 ( .A0(Add_subt_result_i[17]), .A1(n127), .B0(
        Add_subt_result_i[9]), .B1(n126), .Y(n128) );
  NOR4XLTS U133 ( .A(n131), .B(n130), .C(n129), .D(n128), .Y(n133) );
  AOI32X1TS U134 ( .A0(n134), .A1(load_i), .A2(n133), .B0(n138), .B1(n132), 
        .Y(n14) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Round_Sgf_Dec ( Data_i, Round_Type_i, Sign_Result_i, Round_Flag_o );
  input [1:0] Data_i;
  input [1:0] Round_Type_i;
  input Sign_Result_i;
  output Round_Flag_o;

  assign Round_Flag_o = 1'b0;

initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Tenth_Phase_W64_EW11_SW52 ( clk, rst, load_i, sel_a_i, sel_b_i, sign_i, 
        exp_ieee_i, sgf_ieee_i, final_result_ieee_o );
  input [10:0] exp_ieee_i;
  input [51:0] sgf_ieee_i;
  output [63:0] final_result_ieee_o;
  input clk, rst, load_i, sel_a_i, sel_b_i, sign_i;
  wire   n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n129, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;

  DFFRXLTS Final_Result_IEEE_Q_reg_63_ ( .D(n66), .CK(clk), .RN(n5), .Q(
        final_result_ieee_o[63]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_52_ ( .D(n77), .CK(clk), .RN(n129), .Q(
        final_result_ieee_o[52]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_53_ ( .D(n76), .CK(clk), .RN(n5), .Q(
        final_result_ieee_o[53]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_54_ ( .D(n75), .CK(clk), .RN(n129), .Q(
        final_result_ieee_o[54]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_55_ ( .D(n74), .CK(clk), .RN(n5), .Q(
        final_result_ieee_o[55]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_56_ ( .D(n73), .CK(clk), .RN(n129), .Q(
        final_result_ieee_o[56]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_57_ ( .D(n72), .CK(clk), .RN(n5), .Q(
        final_result_ieee_o[57]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_58_ ( .D(n71), .CK(clk), .RN(n129), .Q(
        final_result_ieee_o[58]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_59_ ( .D(n70), .CK(clk), .RN(n5), .Q(
        final_result_ieee_o[59]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_60_ ( .D(n69), .CK(clk), .RN(n129), .Q(
        final_result_ieee_o[60]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_61_ ( .D(n68), .CK(clk), .RN(n5), .Q(
        final_result_ieee_o[61]) );
  DFFRXLTS Final_Result_IEEE_Q_reg_62_ ( .D(n67), .CK(clk), .RN(n129), .Q(
        final_result_ieee_o[62]) );
  OA21XLTS U3 ( .A0(sel_a_i), .A1(sel_b_i), .B0(n2), .Y(n1) );
  CLKBUFX2TS U4 ( .A(load_i), .Y(n2) );
  INVX2TS U5 ( .A(n1), .Y(n3) );
  INVX2TS U6 ( .A(n1), .Y(n4) );
  INVX2TS U7 ( .A(rst), .Y(n5) );
  CLKBUFX2TS U8 ( .A(n18), .Y(n6) );
  INVX2TS U9 ( .A(rst), .Y(n129) );
  OAI21XLTS U10 ( .A0(sel_b_i), .A1(sign_i), .B0(n2), .Y(n7) );
  INVX2TS U11 ( .A(load_i), .Y(n18) );
  OAI2BB2XLTS U12 ( .B0(sel_a_i), .B1(n7), .A0N(final_result_ieee_o[63]), 
        .A1N(n6), .Y(n66) );
  AOI22X1TS U13 ( .A0(load_i), .A1(exp_ieee_i[10]), .B0(
        final_result_ieee_o[62]), .B1(n18), .Y(n8) );
  NAND2X1TS U14 ( .A(n8), .B(n3), .Y(n67) );
  AOI22X1TS U15 ( .A0(load_i), .A1(exp_ieee_i[9]), .B0(final_result_ieee_o[61]), .B1(n18), .Y(n9) );
  NAND2X1TS U16 ( .A(n9), .B(n4), .Y(n68) );
  AOI22X1TS U17 ( .A0(load_i), .A1(exp_ieee_i[8]), .B0(final_result_ieee_o[60]), .B1(n18), .Y(n10) );
  NAND2X1TS U18 ( .A(n10), .B(n3), .Y(n69) );
  AOI22X1TS U19 ( .A0(load_i), .A1(exp_ieee_i[7]), .B0(final_result_ieee_o[59]), .B1(n18), .Y(n11) );
  NAND2X1TS U20 ( .A(n11), .B(n4), .Y(n70) );
  AOI22X1TS U21 ( .A0(load_i), .A1(exp_ieee_i[6]), .B0(final_result_ieee_o[58]), .B1(n18), .Y(n12) );
  NAND2X1TS U22 ( .A(n12), .B(n3), .Y(n71) );
  AOI22X1TS U23 ( .A0(load_i), .A1(exp_ieee_i[5]), .B0(final_result_ieee_o[57]), .B1(n18), .Y(n13) );
  NAND2X1TS U24 ( .A(n13), .B(n4), .Y(n72) );
  AOI22X1TS U25 ( .A0(load_i), .A1(exp_ieee_i[4]), .B0(final_result_ieee_o[56]), .B1(n18), .Y(n14) );
  NAND2X1TS U26 ( .A(n14), .B(n3), .Y(n73) );
  AOI22X1TS U27 ( .A0(load_i), .A1(exp_ieee_i[3]), .B0(final_result_ieee_o[55]), .B1(n18), .Y(n15) );
  NAND2X1TS U28 ( .A(n15), .B(n4), .Y(n74) );
  AOI22X1TS U29 ( .A0(n2), .A1(exp_ieee_i[2]), .B0(final_result_ieee_o[54]), 
        .B1(n18), .Y(n16) );
  NAND2X1TS U30 ( .A(n16), .B(n3), .Y(n75) );
  AOI22X1TS U31 ( .A0(n2), .A1(exp_ieee_i[1]), .B0(final_result_ieee_o[53]), 
        .B1(n6), .Y(n17) );
  NAND2X1TS U32 ( .A(n17), .B(n4), .Y(n76) );
  AOI22X1TS U33 ( .A0(n2), .A1(exp_ieee_i[0]), .B0(final_result_ieee_o[52]), 
        .B1(n6), .Y(n19) );
  NAND2X1TS U34 ( .A(n19), .B(n3), .Y(n77) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W64_1 ( clk, rst, load, D, Q );
  input [63:0] D;
  output [63:0] Q;
  input clk, rst, load;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107;

  DFFRXLTS Q_reg_63_ ( .D(n22), .CK(clk), .RN(n21), .Q(Q[63]) );
  DFFRXLTS Q_reg_62_ ( .D(n24), .CK(clk), .RN(n21), .Q(Q[62]) );
  DFFRXLTS Q_reg_61_ ( .D(n25), .CK(clk), .RN(n21), .Q(Q[61]) );
  DFFRXLTS Q_reg_60_ ( .D(n26), .CK(clk), .RN(n21), .Q(Q[60]) );
  DFFRXLTS Q_reg_59_ ( .D(n27), .CK(clk), .RN(n20), .Q(Q[59]) );
  DFFRXLTS Q_reg_58_ ( .D(n28), .CK(clk), .RN(n20), .Q(Q[58]) );
  DFFRXLTS Q_reg_57_ ( .D(n29), .CK(clk), .RN(n20), .Q(Q[57]) );
  DFFRXLTS Q_reg_56_ ( .D(n30), .CK(clk), .RN(n20), .Q(Q[56]) );
  DFFRXLTS Q_reg_55_ ( .D(n31), .CK(clk), .RN(n20), .Q(Q[55]) );
  DFFRXLTS Q_reg_54_ ( .D(n32), .CK(clk), .RN(n20), .Q(Q[54]) );
  DFFRXLTS Q_reg_53_ ( .D(n33), .CK(clk), .RN(n20), .Q(Q[53]) );
  DFFRXLTS Q_reg_52_ ( .D(n34), .CK(clk), .RN(n20), .Q(Q[52]) );
  DFFRXLTS Q_reg_51_ ( .D(n35), .CK(clk), .RN(n20), .Q(Q[51]) );
  DFFRXLTS Q_reg_50_ ( .D(n36), .CK(clk), .RN(n20), .Q(Q[50]) );
  DFFRXLTS Q_reg_49_ ( .D(n37), .CK(clk), .RN(n19), .Q(Q[49]) );
  DFFRXLTS Q_reg_48_ ( .D(n38), .CK(clk), .RN(n19), .Q(Q[48]) );
  DFFRXLTS Q_reg_47_ ( .D(n39), .CK(clk), .RN(n19), .Q(Q[47]) );
  DFFRXLTS Q_reg_46_ ( .D(n40), .CK(clk), .RN(n19), .Q(Q[46]) );
  DFFRXLTS Q_reg_45_ ( .D(n41), .CK(clk), .RN(n19), .Q(Q[45]) );
  DFFRXLTS Q_reg_44_ ( .D(n42), .CK(clk), .RN(n19), .Q(Q[44]) );
  DFFRXLTS Q_reg_43_ ( .D(n43), .CK(clk), .RN(n19), .Q(Q[43]) );
  DFFRXLTS Q_reg_42_ ( .D(n44), .CK(clk), .RN(n19), .Q(Q[42]) );
  DFFRXLTS Q_reg_41_ ( .D(n45), .CK(clk), .RN(n19), .Q(Q[41]) );
  DFFRXLTS Q_reg_40_ ( .D(n46), .CK(clk), .RN(n19), .Q(Q[40]) );
  DFFRXLTS Q_reg_39_ ( .D(n47), .CK(clk), .RN(n21), .Q(Q[39]) );
  DFFRXLTS Q_reg_38_ ( .D(n48), .CK(clk), .RN(n23), .Q(Q[38]) );
  DFFRXLTS Q_reg_37_ ( .D(n49), .CK(clk), .RN(n23), .Q(Q[37]) );
  DFFRXLTS Q_reg_36_ ( .D(n50), .CK(clk), .RN(n23), .Q(Q[36]) );
  DFFRXLTS Q_reg_35_ ( .D(n51), .CK(clk), .RN(n23), .Q(Q[35]) );
  DFFRXLTS Q_reg_34_ ( .D(n52), .CK(clk), .RN(n21), .Q(Q[34]) );
  DFFRXLTS Q_reg_33_ ( .D(n53), .CK(clk), .RN(n21), .Q(Q[33]) );
  DFFRXLTS Q_reg_32_ ( .D(n54), .CK(clk), .RN(n21), .Q(Q[32]) );
  DFFRXLTS Q_reg_31_ ( .D(n55), .CK(clk), .RN(n21), .Q(Q[31]) );
  DFFRXLTS Q_reg_30_ ( .D(n56), .CK(clk), .RN(n21), .Q(Q[30]) );
  DFFRXLTS Q_reg_29_ ( .D(n57), .CK(clk), .RN(n18), .Q(Q[29]) );
  DFFRXLTS Q_reg_28_ ( .D(n58), .CK(clk), .RN(n18), .Q(Q[28]) );
  DFFRXLTS Q_reg_27_ ( .D(n59), .CK(clk), .RN(n18), .Q(Q[27]) );
  DFFRXLTS Q_reg_26_ ( .D(n60), .CK(clk), .RN(n18), .Q(Q[26]) );
  DFFRXLTS Q_reg_25_ ( .D(n61), .CK(clk), .RN(n18), .Q(Q[25]) );
  DFFRXLTS Q_reg_24_ ( .D(n62), .CK(clk), .RN(n18), .Q(Q[24]) );
  DFFRXLTS Q_reg_23_ ( .D(n63), .CK(clk), .RN(n18), .Q(Q[23]) );
  DFFRXLTS Q_reg_22_ ( .D(n64), .CK(clk), .RN(n18), .Q(Q[22]) );
  DFFRXLTS Q_reg_21_ ( .D(n65), .CK(clk), .RN(n18), .Q(Q[21]) );
  DFFRXLTS Q_reg_20_ ( .D(n87), .CK(clk), .RN(n18), .Q(Q[20]) );
  DFFRXLTS Q_reg_19_ ( .D(n88), .CK(clk), .RN(n17), .Q(Q[19]) );
  DFFRXLTS Q_reg_18_ ( .D(n89), .CK(clk), .RN(n17), .Q(Q[18]) );
  DFFRXLTS Q_reg_17_ ( .D(n90), .CK(clk), .RN(n17), .Q(Q[17]) );
  DFFRXLTS Q_reg_16_ ( .D(n91), .CK(clk), .RN(n17), .Q(Q[16]) );
  DFFRXLTS Q_reg_15_ ( .D(n92), .CK(clk), .RN(n17), .Q(Q[15]) );
  DFFRXLTS Q_reg_14_ ( .D(n93), .CK(clk), .RN(n17), .Q(Q[14]) );
  DFFRXLTS Q_reg_13_ ( .D(n94), .CK(clk), .RN(n17), .Q(Q[13]) );
  DFFRXLTS Q_reg_12_ ( .D(n95), .CK(clk), .RN(n17), .Q(Q[12]) );
  DFFRXLTS Q_reg_11_ ( .D(n96), .CK(clk), .RN(n17), .Q(Q[11]) );
  DFFRXLTS Q_reg_10_ ( .D(n97), .CK(clk), .RN(n17), .Q(Q[10]) );
  DFFRXLTS Q_reg_9_ ( .D(n98), .CK(clk), .RN(n16), .Q(Q[9]) );
  DFFRXLTS Q_reg_8_ ( .D(n99), .CK(clk), .RN(n16), .Q(Q[8]) );
  DFFRXLTS Q_reg_7_ ( .D(n100), .CK(clk), .RN(n16), .Q(Q[7]) );
  DFFRXLTS Q_reg_6_ ( .D(n101), .CK(clk), .RN(n16), .Q(Q[6]) );
  DFFRXLTS Q_reg_5_ ( .D(n102), .CK(clk), .RN(n16), .Q(Q[5]) );
  DFFRXLTS Q_reg_4_ ( .D(n103), .CK(clk), .RN(n16), .Q(Q[4]) );
  DFFRXLTS Q_reg_3_ ( .D(n104), .CK(clk), .RN(n16), .Q(Q[3]) );
  DFFRXLTS Q_reg_2_ ( .D(n105), .CK(clk), .RN(n16), .Q(Q[2]) );
  DFFRXLTS Q_reg_1_ ( .D(n106), .CK(clk), .RN(n16), .Q(Q[1]) );
  DFFRXLTS Q_reg_0_ ( .D(n107), .CK(clk), .RN(n16), .Q(Q[0]) );
  AO22XLTS U2 ( .A0(n8), .A1(D[0]), .B0(n9), .B1(Q[0]), .Y(n107) );
  AO22XLTS U3 ( .A0(n8), .A1(D[1]), .B0(n9), .B1(Q[1]), .Y(n106) );
  AO22XLTS U4 ( .A0(n2), .A1(D[2]), .B0(n9), .B1(Q[2]), .Y(n105) );
  AO22XLTS U5 ( .A0(n4), .A1(D[3]), .B0(n9), .B1(Q[3]), .Y(n104) );
  AO22XLTS U6 ( .A0(n6), .A1(D[4]), .B0(n9), .B1(Q[4]), .Y(n103) );
  AO22XLTS U7 ( .A0(n2), .A1(D[5]), .B0(n9), .B1(Q[5]), .Y(n102) );
  AO22XLTS U8 ( .A0(n2), .A1(D[6]), .B0(n9), .B1(Q[6]), .Y(n101) );
  AO22XLTS U9 ( .A0(n8), .A1(D[7]), .B0(n9), .B1(Q[7]), .Y(n100) );
  AO22XLTS U10 ( .A0(n3), .A1(D[8]), .B0(n9), .B1(Q[8]), .Y(n99) );
  AO22XLTS U11 ( .A0(n4), .A1(D[9]), .B0(n9), .B1(Q[9]), .Y(n98) );
  AO22XLTS U12 ( .A0(n6), .A1(D[10]), .B0(n10), .B1(Q[10]), .Y(n97) );
  AO22XLTS U13 ( .A0(n8), .A1(D[11]), .B0(n10), .B1(Q[11]), .Y(n96) );
  AO22XLTS U14 ( .A0(n6), .A1(D[12]), .B0(n10), .B1(Q[12]), .Y(n95) );
  AO22XLTS U15 ( .A0(n3), .A1(D[13]), .B0(n10), .B1(Q[13]), .Y(n94) );
  AO22XLTS U16 ( .A0(n3), .A1(D[14]), .B0(n10), .B1(Q[14]), .Y(n93) );
  AO22XLTS U17 ( .A0(n6), .A1(D[15]), .B0(n10), .B1(Q[15]), .Y(n92) );
  AO22XLTS U18 ( .A0(n3), .A1(D[16]), .B0(n10), .B1(Q[16]), .Y(n91) );
  AO22XLTS U19 ( .A0(n4), .A1(D[17]), .B0(n10), .B1(Q[17]), .Y(n90) );
  AO22XLTS U20 ( .A0(load), .A1(D[18]), .B0(n10), .B1(Q[18]), .Y(n89) );
  AO22XLTS U21 ( .A0(n3), .A1(D[19]), .B0(n10), .B1(Q[19]), .Y(n88) );
  AO22XLTS U22 ( .A0(n7), .A1(D[20]), .B0(n11), .B1(Q[20]), .Y(n87) );
  AO22XLTS U23 ( .A0(n6), .A1(D[21]), .B0(n11), .B1(Q[21]), .Y(n65) );
  AO22XLTS U24 ( .A0(n8), .A1(D[22]), .B0(n11), .B1(Q[22]), .Y(n64) );
  AO22XLTS U25 ( .A0(load), .A1(D[23]), .B0(n11), .B1(Q[23]), .Y(n63) );
  AO22XLTS U26 ( .A0(n2), .A1(D[24]), .B0(n11), .B1(Q[24]), .Y(n62) );
  AO22XLTS U27 ( .A0(n3), .A1(D[25]), .B0(n11), .B1(Q[25]), .Y(n61) );
  AO22XLTS U28 ( .A0(n6), .A1(D[26]), .B0(n11), .B1(Q[26]), .Y(n60) );
  AO22XLTS U29 ( .A0(n7), .A1(D[27]), .B0(n11), .B1(Q[27]), .Y(n59) );
  AO22XLTS U30 ( .A0(n4), .A1(D[28]), .B0(n11), .B1(Q[28]), .Y(n58) );
  AO22XLTS U31 ( .A0(n4), .A1(D[29]), .B0(n11), .B1(Q[29]), .Y(n57) );
  AO22XLTS U32 ( .A0(n4), .A1(D[30]), .B0(n13), .B1(Q[30]), .Y(n56) );
  AO22XLTS U33 ( .A0(n2), .A1(D[31]), .B0(n13), .B1(Q[31]), .Y(n55) );
  AO22XLTS U34 ( .A0(n6), .A1(D[32]), .B0(n15), .B1(Q[32]), .Y(n54) );
  AO22XLTS U35 ( .A0(n2), .A1(D[33]), .B0(n13), .B1(Q[33]), .Y(n53) );
  AO22XLTS U36 ( .A0(n8), .A1(D[34]), .B0(n15), .B1(Q[34]), .Y(n52) );
  AO22XLTS U37 ( .A0(n2), .A1(D[35]), .B0(n13), .B1(Q[35]), .Y(n51) );
  AO22XLTS U38 ( .A0(n7), .A1(D[36]), .B0(n15), .B1(Q[36]), .Y(n50) );
  AO22XLTS U39 ( .A0(n7), .A1(D[37]), .B0(n15), .B1(Q[37]), .Y(n49) );
  AO22XLTS U40 ( .A0(load), .A1(D[38]), .B0(n15), .B1(Q[38]), .Y(n48) );
  AO22XLTS U41 ( .A0(n4), .A1(D[39]), .B0(n15), .B1(Q[39]), .Y(n47) );
  AO22XLTS U42 ( .A0(n6), .A1(D[40]), .B0(n12), .B1(Q[40]), .Y(n46) );
  AO22XLTS U43 ( .A0(n3), .A1(D[41]), .B0(n12), .B1(Q[41]), .Y(n45) );
  AO22XLTS U44 ( .A0(n3), .A1(D[42]), .B0(n12), .B1(Q[42]), .Y(n44) );
  AO22XLTS U45 ( .A0(n6), .A1(D[43]), .B0(n12), .B1(Q[43]), .Y(n43) );
  AO22XLTS U46 ( .A0(n8), .A1(D[44]), .B0(n12), .B1(Q[44]), .Y(n42) );
  AO22XLTS U47 ( .A0(n2), .A1(D[45]), .B0(n12), .B1(Q[45]), .Y(n41) );
  AO22XLTS U48 ( .A0(n7), .A1(D[46]), .B0(n12), .B1(Q[46]), .Y(n40) );
  AO22XLTS U49 ( .A0(n3), .A1(D[47]), .B0(n12), .B1(Q[47]), .Y(n39) );
  AO22XLTS U50 ( .A0(n4), .A1(D[48]), .B0(n12), .B1(Q[48]), .Y(n38) );
  AO22XLTS U51 ( .A0(n4), .A1(D[49]), .B0(n12), .B1(Q[49]), .Y(n37) );
  AO22XLTS U52 ( .A0(load), .A1(D[50]), .B0(n14), .B1(Q[50]), .Y(n36) );
  AO22XLTS U53 ( .A0(n7), .A1(D[51]), .B0(n14), .B1(Q[51]), .Y(n35) );
  AO22XLTS U54 ( .A0(n7), .A1(D[52]), .B0(n14), .B1(Q[52]), .Y(n34) );
  AO22XLTS U55 ( .A0(n6), .A1(D[53]), .B0(n14), .B1(Q[53]), .Y(n33) );
  AO22XLTS U56 ( .A0(load), .A1(D[54]), .B0(n14), .B1(Q[54]), .Y(n32) );
  AO22XLTS U57 ( .A0(n4), .A1(D[55]), .B0(n14), .B1(Q[55]), .Y(n31) );
  AO22XLTS U58 ( .A0(n3), .A1(D[56]), .B0(n14), .B1(Q[56]), .Y(n30) );
  AO22XLTS U59 ( .A0(n7), .A1(D[57]), .B0(n14), .B1(Q[57]), .Y(n29) );
  AO22XLTS U60 ( .A0(n7), .A1(D[58]), .B0(n14), .B1(Q[58]), .Y(n28) );
  AO22XLTS U61 ( .A0(n7), .A1(D[59]), .B0(n14), .B1(Q[59]), .Y(n27) );
  AO22XLTS U62 ( .A0(n2), .A1(D[60]), .B0(n15), .B1(Q[60]), .Y(n26) );
  AO22XLTS U63 ( .A0(n8), .A1(D[61]), .B0(n15), .B1(Q[61]), .Y(n25) );
  AO22XLTS U64 ( .A0(n2), .A1(D[62]), .B0(n15), .B1(Q[62]), .Y(n24) );
  AO22XLTS U65 ( .A0(n8), .A1(D[63]), .B0(n15), .B1(Q[63]), .Y(n22) );
  INVX2TS U66 ( .A(n5), .Y(n2) );
  INVX2TS U67 ( .A(n5), .Y(n3) );
  INVX2TS U68 ( .A(n5), .Y(n4) );
  INVX2TS U69 ( .A(load), .Y(n5) );
  INVX2TS U70 ( .A(n5), .Y(n6) );
  INVX2TS U71 ( .A(n5), .Y(n7) );
  INVX2TS U72 ( .A(n5), .Y(n8) );
  INVX2TS U73 ( .A(rst), .Y(n23) );
  CLKBUFX2TS U74 ( .A(n23), .Y(n16) );
  CLKBUFX2TS U75 ( .A(n23), .Y(n17) );
  CLKBUFX2TS U76 ( .A(n23), .Y(n19) );
  CLKBUFX2TS U77 ( .A(n23), .Y(n20) );
  CLKBUFX2TS U78 ( .A(n23), .Y(n21) );
  CLKBUFX2TS U79 ( .A(n23), .Y(n18) );
  INVX2TS U80 ( .A(n8), .Y(n13) );
  CLKBUFX2TS U81 ( .A(n13), .Y(n9) );
  CLKBUFX2TS U82 ( .A(n13), .Y(n10) );
  CLKBUFX2TS U83 ( .A(n13), .Y(n11) );
  CLKBUFX2TS U84 ( .A(n13), .Y(n15) );
  CLKBUFX2TS U85 ( .A(n13), .Y(n12) );
  CLKBUFX2TS U86 ( .A(n13), .Y(n14) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W55_1 ( ctrl, D0, D1, S );
  input [54:0] D0;
  input [54:0] D1;
  output [54:0] S;
  input ctrl;
  wire   n4, n5, n6, n7, n8, n9, n10;
  assign S[1] = 1'b0;
  assign S[0] = 1'b0;

  INVX2TS U1 ( .A(n6), .Y(n4) );
  INVX2TS U2 ( .A(n6), .Y(n5) );
  INVX2TS U3 ( .A(S[54]), .Y(n6) );
  INVX2TS U4 ( .A(n6), .Y(n7) );
  INVX2TS U5 ( .A(n6), .Y(n8) );
  INVX2TS U6 ( .A(n6), .Y(n9) );
  INVX2TS U7 ( .A(n6), .Y(n10) );
  INVX2TS U8 ( .A(ctrl), .Y(S[54]) );
  CLKAND2X2TS U10 ( .A(D0[2]), .B(n8), .Y(S[2]) );
  CLKAND2X2TS U11 ( .A(D0[3]), .B(n7), .Y(S[3]) );
  CLKAND2X2TS U12 ( .A(D0[4]), .B(n10), .Y(S[4]) );
  CLKAND2X2TS U13 ( .A(D0[5]), .B(n4), .Y(S[5]) );
  CLKAND2X2TS U14 ( .A(D0[6]), .B(n10), .Y(S[6]) );
  CLKAND2X2TS U15 ( .A(D0[7]), .B(n8), .Y(S[7]) );
  CLKAND2X2TS U16 ( .A(D0[8]), .B(n9), .Y(S[8]) );
  CLKAND2X2TS U17 ( .A(D0[9]), .B(n5), .Y(S[9]) );
  CLKAND2X2TS U18 ( .A(D0[10]), .B(n9), .Y(S[10]) );
  CLKAND2X2TS U19 ( .A(D0[11]), .B(n10), .Y(S[11]) );
  CLKAND2X2TS U20 ( .A(D0[12]), .B(n7), .Y(S[12]) );
  CLKAND2X2TS U21 ( .A(D0[13]), .B(n4), .Y(S[13]) );
  CLKAND2X2TS U22 ( .A(D0[14]), .B(n7), .Y(S[14]) );
  CLKAND2X2TS U23 ( .A(D0[15]), .B(n9), .Y(S[15]) );
  CLKAND2X2TS U24 ( .A(D0[16]), .B(n8), .Y(S[16]) );
  CLKAND2X2TS U25 ( .A(D0[17]), .B(n5), .Y(S[17]) );
  CLKAND2X2TS U26 ( .A(D0[18]), .B(n8), .Y(S[18]) );
  CLKAND2X2TS U27 ( .A(D0[19]), .B(n7), .Y(S[19]) );
  CLKAND2X2TS U28 ( .A(D0[20]), .B(n10), .Y(S[20]) );
  CLKAND2X2TS U29 ( .A(D0[21]), .B(n4), .Y(S[21]) );
  CLKAND2X2TS U30 ( .A(D0[22]), .B(n10), .Y(S[22]) );
  CLKAND2X2TS U31 ( .A(D0[23]), .B(n8), .Y(S[23]) );
  CLKAND2X2TS U32 ( .A(D0[24]), .B(n9), .Y(S[24]) );
  CLKAND2X2TS U33 ( .A(D0[25]), .B(n5), .Y(S[25]) );
  CLKAND2X2TS U34 ( .A(D0[26]), .B(n9), .Y(S[26]) );
  CLKAND2X2TS U35 ( .A(D0[27]), .B(n10), .Y(S[27]) );
  CLKAND2X2TS U36 ( .A(D0[28]), .B(n7), .Y(S[28]) );
  CLKAND2X2TS U37 ( .A(D0[29]), .B(n4), .Y(S[29]) );
  CLKAND2X2TS U38 ( .A(D0[30]), .B(n7), .Y(S[30]) );
  CLKAND2X2TS U39 ( .A(D0[31]), .B(n9), .Y(S[31]) );
  CLKAND2X2TS U40 ( .A(D0[32]), .B(n8), .Y(S[32]) );
  CLKAND2X2TS U41 ( .A(D0[33]), .B(n5), .Y(S[33]) );
  CLKAND2X2TS U42 ( .A(D0[34]), .B(n8), .Y(S[34]) );
  CLKAND2X2TS U43 ( .A(D0[35]), .B(n7), .Y(S[35]) );
  CLKAND2X2TS U44 ( .A(D0[36]), .B(n10), .Y(S[36]) );
  CLKAND2X2TS U45 ( .A(D0[37]), .B(n4), .Y(S[37]) );
  CLKAND2X2TS U46 ( .A(D0[38]), .B(n10), .Y(S[38]) );
  CLKAND2X2TS U47 ( .A(D0[39]), .B(n8), .Y(S[39]) );
  CLKAND2X2TS U48 ( .A(D0[40]), .B(n9), .Y(S[40]) );
  CLKAND2X2TS U49 ( .A(D0[41]), .B(n5), .Y(S[41]) );
  CLKAND2X2TS U50 ( .A(D0[42]), .B(n9), .Y(S[42]) );
  CLKAND2X2TS U51 ( .A(D0[43]), .B(n10), .Y(S[43]) );
  CLKAND2X2TS U52 ( .A(D0[44]), .B(n7), .Y(S[44]) );
  CLKAND2X2TS U53 ( .A(D0[45]), .B(n4), .Y(S[45]) );
  CLKAND2X2TS U54 ( .A(D0[46]), .B(n7), .Y(S[46]) );
  CLKAND2X2TS U55 ( .A(D0[47]), .B(n9), .Y(S[47]) );
  CLKAND2X2TS U56 ( .A(D0[48]), .B(n8), .Y(S[48]) );
  CLKAND2X2TS U57 ( .A(D0[49]), .B(n5), .Y(S[49]) );
  CLKAND2X2TS U58 ( .A(D0[50]), .B(n8), .Y(S[50]) );
  CLKAND2X2TS U59 ( .A(D0[51]), .B(n7), .Y(S[51]) );
  CLKAND2X2TS U60 ( .A(D0[52]), .B(n10), .Y(S[52]) );
  CLKAND2X2TS U61 ( .A(D0[53]), .B(n4), .Y(S[53]) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_6 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4;

  DFFRXLTS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n4), .Q(Q[0]) );
  OR2X1TS U2 ( .A(Q[0]), .B(load), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n4) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_7 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4;

  DFFRXLTS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n4), .Q(Q[0]) );
  INVX2TS U2 ( .A(rst), .Y(n4) );
  OR2X1TS U3 ( .A(Q[0]), .B(load), .Y(n3) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule


module FPU_Add_Subtract_Function_W64_EW11_SW52_SWR55_EWR6 ( clk, rst, beg_FSM, 
        ack_FSM, Data_X, Data_Y, add_subt, r_mode, overflow_flag, 
        underflow_flag, ready, final_result_ieee );
  input [63:0] Data_X;
  input [63:0] Data_Y;
  input [1:0] r_mode;
  output [63:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM, add_subt;
  output overflow_flag, underflow_flag, ready;
  wire   zero_flag, FSM_selector_C, add_overflow_flag, round_flag,
         FSM_op_start_in_load_a, FSM_op_start_in_load_b,
         FSM_exp_operation_load_diff, FSM_exp_operation_load_OU,
         FSM_exp_operation_A_S, FSM_barrel_shifter_L_R, FSM_barrel_shifter_B_S,
         FSM_Add_Subt_Sgf_load, FSM_LZA_load, FSM_Final_Result_load,
         selector_A, load_b, selector_C, selector_D, rst_int, FSM_selector_A,
         FSM_selector_D, intAS, real_op, sign_final_result, S_A_S_op, n4,
         net10806, net10807, net10808, net10809, net10810, net10811, net10812,
         net10813, net10814, net10815, net10816, net10817, net10818, net10819,
         net10820, net10821, net10822, net10823, net10824, net10825, net10826,
         net10827, net10828, net10829, net10830, net10831, net10832, net10833,
         net10834, net10835, net10836, net10837, net10838, net10839, net10840,
         net10841, net10842, net10843, net10844, net10845, net10846, net10847,
         net10848, net10849, net10850, net10851, net10852, net10853, net10854,
         net10855, net10856, net10857, net10858, net10859, net10860, net10861,
         net10862, net10863, net10864, net10865, net10866, net10867, net10868,
         net10869, net10870, net10871, net10872, net10873, net10874, net10875,
         net10876, net10877, net10878, net10879, net10880, net10881, net10882,
         net10883, net10884, net10885, net10886, net10887, net10888, net10889,
         net10890, net10891, net10892, net10893, net10894, net10895, net10896,
         net10897, net10898, net10899, net10900, net10901, net10902, net10903,
         net10904, net10905, net10906, net10907, net10908, net10909, net10910,
         net10911, net10912, net10913, net10914, net10915, net10916, net10917,
         net10918, net10919, net10920, net10921, net10922, net10923, net10924,
         net10925, net10926, net10927, net10928, net10929, net10930, net10931,
         net10932, net10933, net10934, net10935, net10936, net10937, net10938,
         net10939, net10940, net10941, net10942, net10943, net10944, net10945,
         net10946, net10947, net10948, net10949, net10950, net10951, net10952,
         net10953, net10954, net10955, net10956, net10957, net10958, net10959,
         net10960, net10961, net10962, net10963, net10964, net10965, net10966,
         net10967, net10968, net10969, net10970, net10971,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
         SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24,
         SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
         SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28,
         SYNOPSYS_UNCONNECTED_29, SYNOPSYS_UNCONNECTED_30,
         SYNOPSYS_UNCONNECTED_31, SYNOPSYS_UNCONNECTED_32,
         SYNOPSYS_UNCONNECTED_33, SYNOPSYS_UNCONNECTED_34,
         SYNOPSYS_UNCONNECTED_35, SYNOPSYS_UNCONNECTED_36,
         SYNOPSYS_UNCONNECTED_37, SYNOPSYS_UNCONNECTED_38,
         SYNOPSYS_UNCONNECTED_39, SYNOPSYS_UNCONNECTED_40,
         SYNOPSYS_UNCONNECTED_41, SYNOPSYS_UNCONNECTED_42,
         SYNOPSYS_UNCONNECTED_43, SYNOPSYS_UNCONNECTED_44,
         SYNOPSYS_UNCONNECTED_45, SYNOPSYS_UNCONNECTED_46,
         SYNOPSYS_UNCONNECTED_47, SYNOPSYS_UNCONNECTED_48,
         SYNOPSYS_UNCONNECTED_49, SYNOPSYS_UNCONNECTED_50,
         SYNOPSYS_UNCONNECTED_51, SYNOPSYS_UNCONNECTED_52;
  wire   [1:0] selector_B;
  wire   [1:0] FSM_selector_B;
  wire   [63:0] intDX;
  wire   [63:0] intDY;
  wire   [62:0] DMP;
  wire   [62:0] DmP;
  wire   [10:0] exp_oper_result;
  wire   [10:0] S_Oper_A_exp;
  wire   [10:0] S_Oper_B_exp;
  wire   [5:0] LZA_output;
  wire   [54:0] Add_Subt_result;
  wire   [54:0] S_A_S_Oper_A;
  wire   [54:0] S_A_S_Oper_B;
  wire   [54:0] Add_Subt_LZD;
  assign final_result_ieee[51] = 1'b0;
  assign final_result_ieee[50] = 1'b0;
  assign final_result_ieee[49] = 1'b0;
  assign final_result_ieee[48] = 1'b0;
  assign final_result_ieee[47] = 1'b0;
  assign final_result_ieee[46] = 1'b0;
  assign final_result_ieee[45] = 1'b0;
  assign final_result_ieee[44] = 1'b0;
  assign final_result_ieee[43] = 1'b0;
  assign final_result_ieee[42] = 1'b0;
  assign final_result_ieee[41] = 1'b0;
  assign final_result_ieee[40] = 1'b0;
  assign final_result_ieee[39] = 1'b0;
  assign final_result_ieee[38] = 1'b0;
  assign final_result_ieee[37] = 1'b0;
  assign final_result_ieee[36] = 1'b0;
  assign final_result_ieee[35] = 1'b0;
  assign final_result_ieee[34] = 1'b0;
  assign final_result_ieee[33] = 1'b0;
  assign final_result_ieee[32] = 1'b0;
  assign final_result_ieee[31] = 1'b0;
  assign final_result_ieee[30] = 1'b0;
  assign final_result_ieee[29] = 1'b0;
  assign final_result_ieee[28] = 1'b0;
  assign final_result_ieee[27] = 1'b0;
  assign final_result_ieee[26] = 1'b0;
  assign final_result_ieee[25] = 1'b0;
  assign final_result_ieee[24] = 1'b0;
  assign final_result_ieee[23] = 1'b0;
  assign final_result_ieee[22] = 1'b0;
  assign final_result_ieee[21] = 1'b0;
  assign final_result_ieee[20] = 1'b0;
  assign final_result_ieee[19] = 1'b0;
  assign final_result_ieee[18] = 1'b0;
  assign final_result_ieee[17] = 1'b0;
  assign final_result_ieee[16] = 1'b0;
  assign final_result_ieee[15] = 1'b0;
  assign final_result_ieee[14] = 1'b0;
  assign final_result_ieee[13] = 1'b0;
  assign final_result_ieee[12] = 1'b0;
  assign final_result_ieee[11] = 1'b0;
  assign final_result_ieee[10] = 1'b0;
  assign final_result_ieee[9] = 1'b0;
  assign final_result_ieee[8] = 1'b0;
  assign final_result_ieee[7] = 1'b0;
  assign final_result_ieee[6] = 1'b0;
  assign final_result_ieee[5] = 1'b0;
  assign final_result_ieee[4] = 1'b0;
  assign final_result_ieee[3] = 1'b0;
  assign final_result_ieee[2] = 1'b0;
  assign final_result_ieee[1] = 1'b0;
  assign final_result_ieee[0] = 1'b0;

  FSM_Add_Subtract FS_Module ( .clk(clk), .rst(rst), .rst_FSM(ack_FSM), 
        .beg_FSM(beg_FSM), .zero_flag_i(zero_flag), .norm_iteration_i(
        FSM_selector_C), .add_overflow_i(add_overflow_flag), .round_i(
        round_flag), .load_1_o(FSM_op_start_in_load_a), .load_2_o(
        FSM_op_start_in_load_b), .load_3_o(FSM_exp_operation_load_diff), 
        .load_8_o(FSM_exp_operation_load_OU), .A_S_op_o(FSM_exp_operation_A_S), 
        .left_right_o(FSM_barrel_shifter_L_R), .bit_shift_o(
        FSM_barrel_shifter_B_S), .load_5_o(FSM_Add_Subt_Sgf_load), .load_6_o(
        FSM_LZA_load), .load_7_o(FSM_Final_Result_load), .ctrl_a_o(selector_A), 
        .ctrl_b_o(selector_B), .ctrl_b_load_o(load_b), .ctrl_c_o(selector_C), 
        .ctrl_d_o(selector_D), .rst_int(rst_int), .ready(ready) );
  RegisterAdd_W1_8 Sel_A ( .clk(clk), .rst(rst_int), .load(selector_A), .D(
        1'b1), .Q(FSM_selector_A) );
  RegisterAdd_W1_7 Sel_C ( .clk(clk), .rst(rst_int), .load(selector_C), .D(
        1'b1), .Q(FSM_selector_C) );
  RegisterAdd_W1_6 Sel_D ( .clk(clk), .rst(rst_int), .load(selector_D), .D(
        1'b1), .Q(FSM_selector_D) );
  RegisterAdd Sel_B ( .clk(clk), .rst(rst_int), .load(load_b), .D(selector_B), 
        .Q(FSM_selector_B) );
  RegisterAdd_W64_2 XRegister ( .clk(clk), .rst(rst), .load(n4), .D(Data_X), 
        .Q(intDX) );
  RegisterAdd_W64_1 YRegister ( .clk(clk), .rst(rst), .load(n4), .D(Data_Y), 
        .Q(intDY) );
  RegisterAdd_W1_1 ASRegister ( .clk(clk), .rst(rst), .load(n4), .D(add_subt), 
        .Q(intAS) );
  Oper_Start_In_2 Oper_Start_in_module ( .clk(clk), .rst(rst), .load_b_i(
        FSM_op_start_in_load_b), .intAS(intAS), .intDX(intDX), .intDY(intDY), 
        .DMP_o(DMP), .DmP_o(DmP), .zero_flag_o(zero_flag), .real_op_o(real_op), 
        .sign_final_result_o(sign_final_result) );
  Multiplexer_AC_W11_1 Exp_Oper_A_mux ( .ctrl(FSM_selector_A), .D0(DMP[62:52]), 
        .D1(exp_oper_result), .S(S_Oper_A_exp) );
  Mux_3x1_W11 Exp_Oper_B_mux ( .ctrl(FSM_selector_B), .D0(DmP[62:52]), .D1({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, LZA_output}), .D2({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .S(S_Oper_B_exp) );
  Exp_Operation_EW11 Exp_Operation_Module ( .clk(clk), .rst(rst), .load_a_i(
        FSM_exp_operation_load_diff), .load_b_i(FSM_exp_operation_load_OU), 
        .Data_A_i(S_Oper_A_exp), .Data_B_i(S_Oper_B_exp), .Add_Subt_i(
        FSM_exp_operation_A_S), .Data_Result_o(exp_oper_result), 
        .Overflow_flag_o(overflow_flag), .Underflow_flag_o(underflow_flag) );
  Multiplexer_AC_W1_439 Add_Sub_Sgf_op_mux ( .ctrl(FSM_selector_D), .D0(
        real_op), .D1(1'b0), .S(S_A_S_op) );
  Multiplexer_AC_W55_1 Add_Sub_Sgf_Oper_A_mux ( .ctrl(FSM_selector_D), .D0({
        1'b1, DMP[51:0], 1'b0, 1'b0}), .D1({net10917, net10918, net10919, 
        net10920, net10921, net10922, net10923, net10924, net10925, net10926, 
        net10927, net10928, net10929, net10930, net10931, net10932, net10933, 
        net10934, net10935, net10936, net10937, net10938, net10939, net10940, 
        net10941, net10942, net10943, net10944, net10945, net10946, net10947, 
        net10948, net10949, net10950, net10951, net10952, net10953, net10954, 
        net10955, net10956, net10957, net10958, net10959, net10960, net10961, 
        net10962, net10963, net10964, net10965, net10966, net10967, net10968, 
        net10969, net10970, net10971}), .S(S_A_S_Oper_A) );
  Multiplexer_AC_W55_0 Add_Sub_Sgf_Oper_B_mux ( .ctrl(FSM_selector_D), .D0({
        net10862, net10863, net10864, net10865, net10866, net10867, net10868, 
        net10869, net10870, net10871, net10872, net10873, net10874, net10875, 
        net10876, net10877, net10878, net10879, net10880, net10881, net10882, 
        net10883, net10884, net10885, net10886, net10887, net10888, net10889, 
        net10890, net10891, net10892, net10893, net10894, net10895, net10896, 
        net10897, net10898, net10899, net10900, net10901, net10902, net10903, 
        net10904, net10905, net10906, net10907, net10908, net10909, net10910, 
        net10911, net10912, net10913, net10914, net10915, net10916}), .D1({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0}), .S(S_A_S_Oper_B) );
  Add_Subt Add_Subt_Sgf_module ( .clk(clk), .rst(rst), .load_i(
        FSM_Add_Subt_Sgf_load), .Add_Sub_op_i(S_A_S_op), .Data_A_i(
        S_A_S_Oper_A), .PreData_B_i(S_A_S_Oper_B), .Data_Result_o(
        Add_Subt_result), .FSM_C_o(add_overflow_flag) );
  LZD_SWR55_EWR6 Leading_Zero_Detector_Module ( .clk(clk), .rst(rst), .load_i(
        FSM_LZA_load), .Add_subt_result_i(Add_Subt_LZD), .Shift_Value_o(
        LZA_output) );
  Round_Sgf_Dec Rounding_Decoder ( .Data_i({net10858, net10859}), 
        .Round_Type_i({net10860, net10861}), .Sign_Result_i(sign_final_result), 
        .Round_Flag_o(round_flag) );
  Tenth_Phase_W64_EW11_SW52 final_result_ieee_Module ( .clk(clk), .rst(rst), 
        .load_i(FSM_Final_Result_load), .sel_a_i(overflow_flag), .sel_b_i(
        underflow_flag), .sign_i(sign_final_result), .exp_ieee_i(
        exp_oper_result), .sgf_ieee_i({net10806, net10807, net10808, net10809, 
        net10810, net10811, net10812, net10813, net10814, net10815, net10816, 
        net10817, net10818, net10819, net10820, net10821, net10822, net10823, 
        net10824, net10825, net10826, net10827, net10828, net10829, net10830, 
        net10831, net10832, net10833, net10834, net10835, net10836, net10837, 
        net10838, net10839, net10840, net10841, net10842, net10843, net10844, 
        net10845, net10846, net10847, net10848, net10849, net10850, net10851, 
        net10852, net10853, net10854, net10855, net10856, net10857}), 
        .final_result_ieee_o({final_result_ieee[63:52], SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, 
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17, 
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19, 
        SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21, 
        SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23, 
        SYNOPSYS_UNCONNECTED_24, SYNOPSYS_UNCONNECTED_25, 
        SYNOPSYS_UNCONNECTED_26, SYNOPSYS_UNCONNECTED_27, 
        SYNOPSYS_UNCONNECTED_28, SYNOPSYS_UNCONNECTED_29, 
        SYNOPSYS_UNCONNECTED_30, SYNOPSYS_UNCONNECTED_31, 
        SYNOPSYS_UNCONNECTED_32, SYNOPSYS_UNCONNECTED_33, 
        SYNOPSYS_UNCONNECTED_34, SYNOPSYS_UNCONNECTED_35, 
        SYNOPSYS_UNCONNECTED_36, SYNOPSYS_UNCONNECTED_37, 
        SYNOPSYS_UNCONNECTED_38, SYNOPSYS_UNCONNECTED_39, 
        SYNOPSYS_UNCONNECTED_40, SYNOPSYS_UNCONNECTED_41, 
        SYNOPSYS_UNCONNECTED_42, SYNOPSYS_UNCONNECTED_43, 
        SYNOPSYS_UNCONNECTED_44, SYNOPSYS_UNCONNECTED_45, 
        SYNOPSYS_UNCONNECTED_46, SYNOPSYS_UNCONNECTED_47, 
        SYNOPSYS_UNCONNECTED_48, SYNOPSYS_UNCONNECTED_49, 
        SYNOPSYS_UNCONNECTED_50, SYNOPSYS_UNCONNECTED_51, 
        SYNOPSYS_UNCONNECTED_52}) );
  INVX2TS U27 ( .A(Add_Subt_result[23]), .Y(Add_Subt_LZD[23]) );
  INVX2TS U28 ( .A(Add_Subt_result[24]), .Y(Add_Subt_LZD[24]) );
  INVX2TS U29 ( .A(Add_Subt_result[25]), .Y(Add_Subt_LZD[25]) );
  INVX2TS U30 ( .A(Add_Subt_result[26]), .Y(Add_Subt_LZD[26]) );
  INVX2TS U31 ( .A(Add_Subt_result[27]), .Y(Add_Subt_LZD[27]) );
  INVX2TS U32 ( .A(Add_Subt_result[28]), .Y(Add_Subt_LZD[28]) );
  INVX2TS U33 ( .A(Add_Subt_result[29]), .Y(Add_Subt_LZD[29]) );
  INVX2TS U35 ( .A(Add_Subt_result[31]), .Y(Add_Subt_LZD[31]) );
  INVX2TS U34 ( .A(Add_Subt_result[30]), .Y(Add_Subt_LZD[30]) );
  INVX2TS U44 ( .A(Add_Subt_result[40]), .Y(Add_Subt_LZD[40]) );
  INVX2TS U46 ( .A(Add_Subt_result[42]), .Y(Add_Subt_LZD[42]) );
  INVX2TS U43 ( .A(Add_Subt_result[39]), .Y(Add_Subt_LZD[39]) );
  INVX2TS U45 ( .A(Add_Subt_result[41]), .Y(Add_Subt_LZD[41]) );
  INVX2TS U48 ( .A(Add_Subt_result[44]), .Y(Add_Subt_LZD[44]) );
  INVX2TS U49 ( .A(Add_Subt_result[45]), .Y(Add_Subt_LZD[45]) );
  INVX2TS U47 ( .A(Add_Subt_result[43]), .Y(Add_Subt_LZD[43]) );
  INVX2TS U50 ( .A(Add_Subt_result[46]), .Y(Add_Subt_LZD[46]) );
  INVX2TS U52 ( .A(Add_Subt_result[48]), .Y(Add_Subt_LZD[48]) );
  INVX2TS U53 ( .A(Add_Subt_result[49]), .Y(Add_Subt_LZD[49]) );
  INVX2TS U51 ( .A(Add_Subt_result[47]), .Y(Add_Subt_LZD[47]) );
  INVX2TS U54 ( .A(Add_Subt_result[50]), .Y(Add_Subt_LZD[50]) );
  INVX2TS U57 ( .A(Add_Subt_result[53]), .Y(Add_Subt_LZD[53]) );
  INVX2TS U58 ( .A(Add_Subt_result[54]), .Y(Add_Subt_LZD[54]) );
  INVX2TS U56 ( .A(Add_Subt_result[52]), .Y(Add_Subt_LZD[52]) );
  INVX2TS U55 ( .A(Add_Subt_result[51]), .Y(Add_Subt_LZD[51]) );
  INVX2TS U40 ( .A(Add_Subt_result[36]), .Y(Add_Subt_LZD[36]) );
  INVX2TS U41 ( .A(Add_Subt_result[37]), .Y(Add_Subt_LZD[37]) );
  INVX2TS U39 ( .A(Add_Subt_result[35]), .Y(Add_Subt_LZD[35]) );
  INVX2TS U42 ( .A(Add_Subt_result[38]), .Y(Add_Subt_LZD[38]) );
  INVX2TS U36 ( .A(Add_Subt_result[32]), .Y(Add_Subt_LZD[32]) );
  INVX2TS U38 ( .A(Add_Subt_result[34]), .Y(Add_Subt_LZD[34]) );
  INVX2TS U37 ( .A(Add_Subt_result[33]), .Y(Add_Subt_LZD[33]) );
  INVX2TS U18 ( .A(Add_Subt_result[14]), .Y(Add_Subt_LZD[14]) );
  INVX2TS U17 ( .A(Add_Subt_result[13]), .Y(Add_Subt_LZD[13]) );
  INVX2TS U19 ( .A(Add_Subt_result[15]), .Y(Add_Subt_LZD[15]) );
  INVX2TS U20 ( .A(Add_Subt_result[16]), .Y(Add_Subt_LZD[16]) );
  INVX2TS U21 ( .A(Add_Subt_result[17]), .Y(Add_Subt_LZD[17]) );
  INVX2TS U22 ( .A(Add_Subt_result[18]), .Y(Add_Subt_LZD[18]) );
  INVX2TS U23 ( .A(Add_Subt_result[19]), .Y(Add_Subt_LZD[19]) );
  INVX2TS U24 ( .A(Add_Subt_result[20]), .Y(Add_Subt_LZD[20]) );
  INVX2TS U25 ( .A(Add_Subt_result[21]), .Y(Add_Subt_LZD[21]) );
  INVX2TS U26 ( .A(Add_Subt_result[22]), .Y(Add_Subt_LZD[22]) );
  INVX2TS U16 ( .A(Add_Subt_result[12]), .Y(Add_Subt_LZD[12]) );
  INVX2TS U12 ( .A(Add_Subt_result[8]), .Y(Add_Subt_LZD[8]) );
  INVX2TS U13 ( .A(Add_Subt_result[9]), .Y(Add_Subt_LZD[9]) );
  INVX2TS U14 ( .A(Add_Subt_result[10]), .Y(Add_Subt_LZD[10]) );
  INVX2TS U11 ( .A(Add_Subt_result[7]), .Y(Add_Subt_LZD[7]) );
  INVX2TS U15 ( .A(Add_Subt_result[11]), .Y(Add_Subt_LZD[11]) );
  INVX2TS U10 ( .A(Add_Subt_result[6]), .Y(Add_Subt_LZD[6]) );
  INVX2TS U9 ( .A(Add_Subt_result[5]), .Y(Add_Subt_LZD[5]) );
  INVX2TS U8 ( .A(Add_Subt_result[4]), .Y(Add_Subt_LZD[4]) );
  INVX2TS U7 ( .A(Add_Subt_result[3]), .Y(Add_Subt_LZD[3]) );
  INVX2TS U6 ( .A(Add_Subt_result[2]), .Y(Add_Subt_LZD[2]) );
  INVX2TS U5 ( .A(Add_Subt_result[1]), .Y(Add_Subt_LZD[1]) );
  INVX2TS U4 ( .A(Add_Subt_result[0]), .Y(Add_Subt_LZD[0]) );
  CLKBUFX2TS U60 ( .A(FSM_op_start_in_load_a), .Y(n4) );
initial $sdf_annotate("FPU_Add_Subtract_Function_syn.sdf"); 
 endmodule

