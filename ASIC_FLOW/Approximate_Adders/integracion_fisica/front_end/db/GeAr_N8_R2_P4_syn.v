/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:55:28 2016
/////////////////////////////////////////////////////////////


module GeAr_N8_R2_P4 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   intadd_30_CI, intadd_30_n4, intadd_30_n3, intadd_30_n2, intadd_30_n1,
         n2, n3, n4, n5, n6, n7, n8;

  CMPR32X2TS intadd_30_U5 ( .A(in2[1]), .B(in1[1]), .C(intadd_30_CI), .CO(
        intadd_30_n4), .S(res[1]) );
  CMPR32X2TS intadd_30_U4 ( .A(in2[2]), .B(in1[2]), .C(intadd_30_n4), .CO(
        intadd_30_n3), .S(res[2]) );
  CMPR32X2TS intadd_30_U3 ( .A(in2[3]), .B(in1[3]), .C(intadd_30_n3), .CO(
        intadd_30_n2), .S(res[3]) );
  CMPR32X2TS intadd_30_U2 ( .A(in2[4]), .B(in1[4]), .C(intadd_30_n2), .CO(
        intadd_30_n1), .S(res[4]) );
  CLKAND2X2TS U2 ( .A(in2[0]), .B(in1[0]), .Y(intadd_30_CI) );
  AOI222X1TS U3 ( .A0(in2[4]), .A1(in1[4]), .B0(in2[4]), .B1(n4), .C0(in1[4]), 
        .C1(n4), .Y(n5) );
  AOI2BB1XLTS U4 ( .A0N(in2[0]), .A1N(in1[0]), .B0(intadd_30_CI), .Y(res[0])
         );
  NOR2X1TS U5 ( .A(in2[5]), .B(in1[5]), .Y(n6) );
  AOI21X1TS U6 ( .A0(in1[5]), .A1(in2[5]), .B0(n6), .Y(n2) );
  XOR2XLTS U7 ( .A(n2), .B(intadd_30_n1), .Y(res[5]) );
  OAI211XLTS U8 ( .A0(in1[3]), .A1(in2[3]), .B0(in1[2]), .C0(in2[2]), .Y(n3)
         );
  OAI2BB1X1TS U9 ( .A0N(in2[3]), .A1N(in1[3]), .B0(n3), .Y(n4) );
  OAI2BB2XLTS U10 ( .B0(n6), .B1(n5), .A0N(in2[5]), .A1N(in1[5]), .Y(n8) );
  CMPR32X2TS U11 ( .A(in2[7]), .B(in1[7]), .C(n7), .CO(res[8]), .S(res[7]) );
  CMPR32X2TS U12 ( .A(in2[6]), .B(in1[6]), .C(n8), .CO(n7), .S(res[6]) );
initial $sdf_annotate("GeAr_N8_R2_P4_syn.sdf"); 
 endmodule

