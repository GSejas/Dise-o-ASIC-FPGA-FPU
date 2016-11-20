/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:55:40 2016
/////////////////////////////////////////////////////////////


module GeAr_N9_R4_P1 ( in1, in2, res );
  input [8:0] in1;
  input [8:0] in2;
  output [9:0] res;
  wire   intadd_31_CI, intadd_31_n4, intadd_31_n3, intadd_31_n2, intadd_32_CI,
         intadd_32_n3, intadd_32_n2, intadd_32_n1, n2;

  CMPR32X2TS intadd_31_U5 ( .A(in2[5]), .B(in1[5]), .C(intadd_31_CI), .CO(
        intadd_31_n4), .S(res[5]) );
  CMPR32X2TS intadd_31_U4 ( .A(in2[6]), .B(in1[6]), .C(intadd_31_n4), .CO(
        intadd_31_n3), .S(res[6]) );
  CMPR32X2TS intadd_31_U3 ( .A(in2[7]), .B(in1[7]), .C(intadd_31_n3), .CO(
        intadd_31_n2), .S(res[7]) );
  CMPR32X2TS intadd_31_U2 ( .A(in2[8]), .B(in1[8]), .C(intadd_31_n2), .CO(
        res[9]), .S(res[8]) );
  CMPR32X2TS intadd_32_U4 ( .A(in2[1]), .B(in1[1]), .C(intadd_32_CI), .CO(
        intadd_32_n3), .S(res[1]) );
  CMPR32X2TS intadd_32_U3 ( .A(in2[2]), .B(in1[2]), .C(intadd_32_n3), .CO(
        intadd_32_n2), .S(res[2]) );
  CMPR32X2TS intadd_32_U2 ( .A(in2[3]), .B(in1[3]), .C(intadd_32_n2), .CO(
        intadd_32_n1), .S(res[3]) );
  CLKAND2X2TS U2 ( .A(in1[4]), .B(in2[4]), .Y(intadd_31_CI) );
  CLKAND2X2TS U3 ( .A(in2[0]), .B(in1[0]), .Y(intadd_32_CI) );
  AOI2BB1XLTS U4 ( .A0N(in1[4]), .A1N(in2[4]), .B0(intadd_31_CI), .Y(n2) );
  AOI2BB1XLTS U5 ( .A0N(in2[0]), .A1N(in1[0]), .B0(intadd_32_CI), .Y(res[0])
         );
  XOR2XLTS U6 ( .A(n2), .B(intadd_32_n1), .Y(res[4]) );
initial $sdf_annotate("GeAr_N9_R4_P1_syn.sdf"); 
 endmodule

