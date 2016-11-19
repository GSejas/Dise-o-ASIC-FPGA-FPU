/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:21:48 2016
/////////////////////////////////////////////////////////////


module ACA_I_N8_Q5 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   intadd_0_CI, intadd_0_n3, intadd_0_n2, intadd_0_n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;

  CMPR32X2TS intadd_0_U4 ( .A(in2[1]), .B(in1[1]), .C(intadd_0_CI), .CO(
        intadd_0_n3), .S(res[1]) );
  CMPR32X2TS intadd_0_U3 ( .A(in2[2]), .B(in1[2]), .C(intadd_0_n3), .CO(
        intadd_0_n2), .S(res[2]) );
  CMPR32X2TS intadd_0_U2 ( .A(in2[3]), .B(in1[3]), .C(intadd_0_n2), .CO(
        intadd_0_n1), .S(res[3]) );
  AO21XLTS U2 ( .A0(n8), .A1(n3), .B0(n9), .Y(n4) );
  CLKAND2X2TS U3 ( .A(in2[0]), .B(in1[0]), .Y(intadd_0_CI) );
  AOI2BB2XLTS U4 ( .B0(in2[5]), .B1(n5), .A0N(n5), .A1N(in2[5]), .Y(n6) );
  OAI2BB2XLTS U5 ( .B0(n17), .B1(n16), .A0N(in1[6]), .A1N(in2[6]), .Y(n18) );
  OAI32X2TS U6 ( .A0(n14), .A1(n9), .A2(n8), .B0(n13), .B1(n14), .Y(n10) );
  AOI22X2TS U7 ( .A0(in2[4]), .A1(in1[4]), .B0(in2[3]), .B1(in1[3]), .Y(n13)
         );
  OAI211XLTS U8 ( .A0(in1[2]), .A1(in2[2]), .B0(in2[1]), .C0(in1[1]), .Y(n3)
         );
  AOI2BB1XLTS U9 ( .A0N(in2[0]), .A1N(in1[0]), .B0(intadd_0_CI), .Y(res[0]) );
  NOR2X2TS U10 ( .A(in2[4]), .B(in1[4]), .Y(n14) );
  AOI21X1TS U11 ( .A0(in1[4]), .A1(in2[4]), .B0(n14), .Y(n2) );
  XOR2XLTS U12 ( .A(n2), .B(intadd_0_n1), .Y(res[4]) );
  NAND2X1TS U13 ( .A(in1[2]), .B(in2[2]), .Y(n8) );
  NOR2X1TS U14 ( .A(in2[3]), .B(in1[3]), .Y(n9) );
  AOI21X1TS U15 ( .A0(n4), .A1(n13), .B0(n14), .Y(n7) );
  INVX2TS U16 ( .A(in1[5]), .Y(n5) );
  XNOR2X1TS U17 ( .A(n7), .B(n6), .Y(res[5]) );
  NOR2X1TS U18 ( .A(in1[6]), .B(in2[6]), .Y(n17) );
  AOI21X1TS U19 ( .A0(in1[6]), .A1(in2[6]), .B0(n17), .Y(n12) );
  AOI222X1TS U20 ( .A0(in2[5]), .A1(in1[5]), .B0(in2[5]), .B1(n10), .C0(in1[5]), .C1(n10), .Y(n11) );
  XNOR2X1TS U21 ( .A(n12), .B(n11), .Y(res[6]) );
  NOR2X1TS U22 ( .A(n14), .B(n13), .Y(n15) );
  AOI222X1TS U23 ( .A0(in1[5]), .A1(n15), .B0(in1[5]), .B1(in2[5]), .C0(n15), 
        .C1(in2[5]), .Y(n16) );
  CMPR32X2TS U24 ( .A(in2[7]), .B(in1[7]), .C(n18), .CO(res[8]), .S(res[7]) );
initial $sdf_annotate("ACA_I_N8_Q5_syn.sdf"); 
 endmodule

