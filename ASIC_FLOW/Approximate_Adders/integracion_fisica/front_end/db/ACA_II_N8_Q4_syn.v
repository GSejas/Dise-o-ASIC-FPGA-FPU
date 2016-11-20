/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:17:19 2016
/////////////////////////////////////////////////////////////


module ACA_II_N8_Q4 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24;

  CLKAND2X2TS U18 ( .A(in1[0]), .B(in2[0]), .Y(n20) );
  XOR2XLTS U19 ( .A(in1[3]), .B(in2[3]), .Y(n17) );
  XOR2XLTS U20 ( .A(in1[5]), .B(in2[5]), .Y(n15) );
  OAI211XLTS U21 ( .A0(in2[5]), .A1(in1[5]), .B0(in2[4]), .C0(in1[4]), .Y(n22)
         );
  OAI211XLTS U22 ( .A0(in2[3]), .A1(in1[3]), .B0(in2[2]), .C0(in1[2]), .Y(n14)
         );
  AOI2BB1XLTS U23 ( .A0N(in1[0]), .A1N(in2[0]), .B0(n20), .Y(res[0]) );
  OAI2BB1X1TS U24 ( .A0N(in1[3]), .A1N(in2[3]), .B0(n14), .Y(n19) );
  XOR2XLTS U25 ( .A(n16), .B(n15), .Y(res[5]) );
  XOR2XLTS U26 ( .A(n18), .B(n17), .Y(res[3]) );
  CMPR32X2TS U27 ( .A(in2[4]), .B(in1[4]), .C(n19), .CO(n16), .S(res[4]) );
  CMPR32X2TS U28 ( .A(in1[1]), .B(in2[1]), .C(n20), .CO(n21), .S(res[1]) );
  CMPR32X2TS U29 ( .A(in1[2]), .B(in2[2]), .C(n21), .CO(n18), .S(res[2]) );
  OAI2BB1X1TS U30 ( .A0N(in1[5]), .A1N(in2[5]), .B0(n22), .Y(n23) );
  CMPR32X2TS U31 ( .A(in1[6]), .B(in2[6]), .C(n23), .CO(n24), .S(res[6]) );
  CMPR32X2TS U32 ( .A(in1[7]), .B(in2[7]), .C(n24), .CO(res[8]), .S(res[7]) );
initial $sdf_annotate("ACA_II_N8_Q4_syn.sdf"); 
 endmodule

