/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:54:04 2016
/////////////////////////////////////////////////////////////


module GeAr_N8_R1_P1 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;

  CLKAND2X2TS U22 ( .A(in1[6]), .B(in2[6]), .Y(n14) );
  OAI21XLTS U23 ( .A0(in2[2]), .A1(in1[2]), .B0(n22), .Y(n23) );
  OAI21XLTS U24 ( .A0(in2[3]), .A1(in1[3]), .B0(n20), .Y(n21) );
  OAI21XLTS U25 ( .A0(in2[4]), .A1(in1[4]), .B0(n18), .Y(n19) );
  OAI21XLTS U26 ( .A0(in2[5]), .A1(in1[5]), .B0(n16), .Y(n17) );
  AOI2BB1XLTS U27 ( .A0N(in1[6]), .A1N(in2[6]), .B0(n14), .Y(n15) );
  OAI21XLTS U28 ( .A0(in2[1]), .A1(in1[1]), .B0(n24), .Y(n25) );
  CMPR32X2TS U29 ( .A(in1[7]), .B(in2[7]), .C(n14), .CO(res[8]), .S(res[7]) );
  NAND2X1TS U30 ( .A(in2[5]), .B(in1[5]), .Y(n16) );
  XNOR2X1TS U31 ( .A(n15), .B(n16), .Y(res[6]) );
  NAND2X1TS U32 ( .A(in2[4]), .B(in1[4]), .Y(n18) );
  XOR2XLTS U33 ( .A(n18), .B(n17), .Y(res[5]) );
  NAND2X1TS U34 ( .A(in2[3]), .B(in1[3]), .Y(n20) );
  XOR2XLTS U35 ( .A(n20), .B(n19), .Y(res[4]) );
  NAND2X1TS U36 ( .A(in2[2]), .B(in1[2]), .Y(n22) );
  XOR2XLTS U37 ( .A(n22), .B(n21), .Y(res[3]) );
  NAND2X1TS U38 ( .A(in2[1]), .B(in1[1]), .Y(n24) );
  XOR2XLTS U39 ( .A(n24), .B(n23), .Y(res[2]) );
  NAND2X1TS U40 ( .A(in1[0]), .B(in2[0]), .Y(n26) );
  XOR2XLTS U41 ( .A(n26), .B(n25), .Y(res[1]) );
  OA21XLTS U42 ( .A0(in1[0]), .A1(in2[0]), .B0(n26), .Y(res[0]) );
initial $sdf_annotate("GeAr_N8_R1_P1_syn.sdf"); 
 endmodule

