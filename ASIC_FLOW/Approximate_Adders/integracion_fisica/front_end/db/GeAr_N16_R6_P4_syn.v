/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:25:17 2016
/////////////////////////////////////////////////////////////


module GeAr_N16_R6_P4 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  XOR2XLTS U2 ( .A(n12), .B(n11), .Y(res[9]) );
  XOR2XLTS U3 ( .A(in1[9]), .B(in2[9]), .Y(n11) );
  NAND2X1TS U4 ( .A(in1[6]), .B(in2[6]), .Y(n2) );
  OR2X1TS U5 ( .A(in1[0]), .B(in2[0]), .Y(n14) );
  AFHCINX2TS U6 ( .CIN(n2), .B(in1[7]), .A(in2[7]), .CO(n3) );
  AFHCONX2TS U7 ( .A(in2[8]), .B(in1[8]), .CI(n3), .CON(n4) );
  AFHCINX2TS U8 ( .CIN(n4), .B(in1[9]), .A(in2[9]), .CO(n10) );
  AFHCINX2TS U9 ( .CIN(n5), .B(in1[15]), .A(in2[15]), .S(res[15]), .CO(res[16]) );
  AFHCONX2TS U10 ( .A(in2[14]), .B(in1[14]), .CI(n6), .CON(n5), .S(res[14]) );
  AFHCINX2TS U11 ( .CIN(n7), .B(in1[13]), .A(in2[13]), .S(res[13]), .CO(n6) );
  AFHCONX2TS U12 ( .A(in2[12]), .B(in1[12]), .CI(n8), .CON(n7), .S(res[12]) );
  AFHCINX2TS U13 ( .CIN(n9), .B(in1[11]), .A(in2[11]), .S(res[11]), .CO(n8) );
  AFHCONX2TS U14 ( .A(in2[10]), .B(in1[10]), .CI(n10), .CON(n9), .S(res[10])
         );
  NAND2X1TS U15 ( .A(in1[0]), .B(in2[0]), .Y(n13) );
  INVX2TS U16 ( .A(n13), .Y(n22) );
  CLKAND2X2TS U17 ( .A(n14), .B(n13), .Y(res[0]) );
  AFHCINX2TS U18 ( .CIN(n15), .B(in1[8]), .A(in2[8]), .S(res[8]), .CO(n12) );
  AFHCONX2TS U19 ( .A(in2[7]), .B(in1[7]), .CI(n16), .CON(n15), .S(res[7]) );
  AFHCINX2TS U20 ( .CIN(n17), .B(in1[6]), .A(in2[6]), .S(res[6]), .CO(n16) );
  AFHCONX2TS U21 ( .A(in2[5]), .B(in1[5]), .CI(n18), .CON(n17), .S(res[5]) );
  AFHCINX2TS U22 ( .CIN(n19), .B(in1[4]), .A(in2[4]), .S(res[4]), .CO(n18) );
  AFHCONX2TS U23 ( .A(in2[3]), .B(in1[3]), .CI(n20), .CON(n19), .S(res[3]) );
  AFHCINX2TS U24 ( .CIN(n21), .B(in1[2]), .A(in2[2]), .S(res[2]), .CO(n20) );
  AFHCONX2TS U25 ( .A(in2[1]), .B(in1[1]), .CI(n22), .CON(n21), .S(res[1]) );
initial $sdf_annotate("GeAr_N16_R6_P4_syn.sdf"); 
 endmodule

