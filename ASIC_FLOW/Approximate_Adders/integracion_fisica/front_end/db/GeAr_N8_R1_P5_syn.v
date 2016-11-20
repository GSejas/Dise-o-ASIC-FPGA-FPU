/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:54:52 2016
/////////////////////////////////////////////////////////////


module GeAr_N8_R1_P5 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   intadd_28_CI, intadd_28_n4, intadd_28_n3, intadd_28_n2, intadd_28_n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;

  CMPR32X2TS intadd_28_U5 ( .A(in2[1]), .B(in1[1]), .C(intadd_28_CI), .CO(
        intadd_28_n4), .S(res[1]) );
  CMPR32X2TS intadd_28_U4 ( .A(in2[2]), .B(in1[2]), .C(intadd_28_n4), .CO(
        intadd_28_n3), .S(res[2]) );
  CMPR32X2TS intadd_28_U3 ( .A(in2[3]), .B(in1[3]), .C(intadd_28_n3), .CO(
        intadd_28_n2), .S(res[3]) );
  CMPR32X2TS intadd_28_U2 ( .A(in2[4]), .B(in1[4]), .C(intadd_28_n2), .CO(
        intadd_28_n1), .S(res[4]) );
  XOR2XLTS U2 ( .A(in1[6]), .B(in2[6]), .Y(n6) );
  AO22XLTS U3 ( .A0(in2[3]), .A1(in1[3]), .B0(in2[2]), .B1(in1[2]), .Y(n10) );
  CLKAND2X2TS U4 ( .A(in2[1]), .B(in1[1]), .Y(n2) );
  CLKAND2X2TS U5 ( .A(in2[0]), .B(in1[0]), .Y(intadd_28_CI) );
  AOI222X4TS U6 ( .A0(n13), .A1(n12), .B0(n13), .B1(n11), .C0(n12), .C1(n11), 
        .Y(n14) );
  AOI2BB2XLTS U7 ( .B0(in1[5]), .B1(n8), .A0N(n8), .A1N(in1[5]), .Y(n9) );
  INVX2TS U8 ( .A(in2[5]), .Y(n8) );
  CMPR32X2TS U9 ( .A(in1[2]), .B(in2[2]), .C(n2), .CO(n3) );
  CMPR32X2TS U10 ( .A(in1[3]), .B(in2[3]), .C(n3), .CO(n4) );
  CMPR32X2TS U11 ( .A(in1[4]), .B(in2[4]), .C(n4), .CO(n5) );
  CMPR32X2TS U12 ( .A(in1[5]), .B(in2[5]), .C(n5), .CO(n7) );
  XOR2XLTS U13 ( .A(n7), .B(n6), .Y(res[6]) );
  AOI2BB1XLTS U14 ( .A0N(in2[0]), .A1N(in1[0]), .B0(intadd_28_CI), .Y(res[0])
         );
  XNOR2X1TS U15 ( .A(intadd_28_n1), .B(n9), .Y(res[5]) );
  OAI21X1TS U16 ( .A0(in2[3]), .A1(in1[3]), .B0(n10), .Y(n13) );
  INVX2TS U17 ( .A(in2[4]), .Y(n12) );
  INVX2TS U18 ( .A(in1[4]), .Y(n11) );
  AOI222X1TS U19 ( .A0(in2[5]), .A1(in1[5]), .B0(in2[5]), .B1(n14), .C0(in1[5]), .C1(n14), .Y(n17) );
  INVX2TS U20 ( .A(in2[6]), .Y(n16) );
  INVX2TS U21 ( .A(in1[6]), .Y(n15) );
  AOI222X4TS U22 ( .A0(n17), .A1(n16), .B0(n17), .B1(n15), .C0(n16), .C1(n15), 
        .Y(n18) );
  CMPR32X2TS U23 ( .A(in2[7]), .B(in1[7]), .C(n18), .CO(res[8]), .S(res[7]) );
initial $sdf_annotate("GeAr_N8_R1_P5_syn.sdf"); 
 endmodule

