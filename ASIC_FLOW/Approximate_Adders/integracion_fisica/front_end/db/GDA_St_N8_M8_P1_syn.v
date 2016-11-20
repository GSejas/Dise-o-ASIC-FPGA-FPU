/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:51:51 2016
/////////////////////////////////////////////////////////////


module GDA_St_N8_M8_P1 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;

  CLKAND2X2TS U22 ( .A(in2[6]), .B(in1[6]), .Y(n26) );
  OAI21XLTS U23 ( .A0(in1[2]), .A1(in2[2]), .B0(n21), .Y(n22) );
  OAI21XLTS U24 ( .A0(in1[3]), .A1(in2[3]), .B0(n19), .Y(n20) );
  OAI21XLTS U25 ( .A0(in1[4]), .A1(in2[4]), .B0(n17), .Y(n18) );
  OAI21XLTS U26 ( .A0(in1[5]), .A1(in2[5]), .B0(n15), .Y(n16) );
  AOI2BB1XLTS U27 ( .A0N(in2[6]), .A1N(in1[6]), .B0(n26), .Y(n14) );
  OAI21XLTS U28 ( .A0(in1[1]), .A1(in2[1]), .B0(n23), .Y(n24) );
  NAND2X1TS U29 ( .A(in2[0]), .B(in1[0]), .Y(n25) );
  OA21XLTS U30 ( .A0(in2[0]), .A1(in1[0]), .B0(n25), .Y(res[0]) );
  NAND2X1TS U31 ( .A(in1[5]), .B(in2[5]), .Y(n15) );
  XNOR2X1TS U32 ( .A(n14), .B(n15), .Y(res[6]) );
  NAND2X1TS U33 ( .A(in1[4]), .B(in2[4]), .Y(n17) );
  XOR2XLTS U34 ( .A(n17), .B(n16), .Y(res[5]) );
  NAND2X1TS U35 ( .A(in1[3]), .B(in2[3]), .Y(n19) );
  XOR2XLTS U36 ( .A(n19), .B(n18), .Y(res[4]) );
  NAND2X1TS U37 ( .A(in1[2]), .B(in2[2]), .Y(n21) );
  XOR2XLTS U38 ( .A(n21), .B(n20), .Y(res[3]) );
  NAND2X1TS U39 ( .A(in1[1]), .B(in2[1]), .Y(n23) );
  XOR2XLTS U40 ( .A(n23), .B(n22), .Y(res[2]) );
  XOR2XLTS U41 ( .A(n25), .B(n24), .Y(res[1]) );
  CMPR32X2TS U42 ( .A(in2[7]), .B(in1[7]), .C(n26), .CO(res[8]), .S(res[7]) );
initial $sdf_annotate("GDA_St_N8_M8_P1_syn.sdf"); 
 endmodule

