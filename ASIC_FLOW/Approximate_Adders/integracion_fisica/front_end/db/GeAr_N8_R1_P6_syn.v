/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:55:04 2016
/////////////////////////////////////////////////////////////


module GeAr_N8_R1_P6 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   intadd_29_CI, intadd_29_n5, intadd_29_n4, intadd_29_n3, intadd_29_n2,
         intadd_29_n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  CMPR32X2TS intadd_29_U6 ( .A(in2[1]), .B(in1[1]), .C(intadd_29_CI), .CO(
        intadd_29_n5), .S(res[1]) );
  CMPR32X2TS intadd_29_U5 ( .A(in2[2]), .B(in1[2]), .C(intadd_29_n5), .CO(
        intadd_29_n4), .S(res[2]) );
  CMPR32X2TS intadd_29_U4 ( .A(in2[3]), .B(in1[3]), .C(intadd_29_n4), .CO(
        intadd_29_n3), .S(res[3]) );
  CMPR32X2TS intadd_29_U3 ( .A(in2[4]), .B(in1[4]), .C(intadd_29_n3), .CO(
        intadd_29_n2), .S(res[4]) );
  CMPR32X2TS intadd_29_U2 ( .A(in2[5]), .B(in1[5]), .C(intadd_29_n2), .CO(
        intadd_29_n1), .S(res[5]) );
  OAI211XLTS U2 ( .A0(in1[2]), .A1(in2[2]), .B0(in2[1]), .C0(in1[1]), .Y(n2)
         );
  CLKAND2X2TS U3 ( .A(in2[0]), .B(in1[0]), .Y(intadd_29_CI) );
  XOR2XLTS U4 ( .A(n10), .B(in1[6]), .Y(res[6]) );
  XOR2XLTS U5 ( .A(intadd_29_n1), .B(in2[6]), .Y(n10) );
  OAI2BB2XLTS U6 ( .B0(n8), .B1(n7), .A0N(in1[6]), .A1N(in2[6]), .Y(n9) );
  AOI222X1TS U7 ( .A0(in2[5]), .A1(in1[5]), .B0(in2[5]), .B1(n6), .C0(in1[5]), 
        .C1(n6), .Y(n8) );
  OAI2BB2X1TS U8 ( .B0(n5), .B1(n4), .A0N(in1[4]), .A1N(in2[4]), .Y(n6) );
  OAI2BB1X1TS U9 ( .A0N(in2[2]), .A1N(in1[2]), .B0(n2), .Y(n3) );
  AOI222X1TS U10 ( .A0(in2[3]), .A1(in1[3]), .B0(in2[3]), .B1(n3), .C0(in1[3]), 
        .C1(n3), .Y(n5) );
  NOR2XLTS U11 ( .A(in1[4]), .B(in2[4]), .Y(n4) );
  NOR2XLTS U12 ( .A(in1[6]), .B(in2[6]), .Y(n7) );
  CMPR32X2TS U13 ( .A(in1[7]), .B(in2[7]), .C(n9), .CO(res[8]), .S(res[7]) );
  AOI2BB1XLTS U14 ( .A0N(in2[0]), .A1N(in1[0]), .B0(intadd_29_CI), .Y(res[0])
         );
initial $sdf_annotate("GeAr_N8_R1_P6_syn.sdf"); 
 endmodule

