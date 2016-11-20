/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:19:39 2016
/////////////////////////////////////////////////////////////


module GDA_St_N8_M4_P2 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34;

  CLKAND2X2TS U27 ( .A(in2[4]), .B(in1[4]), .Y(n20) );
  CLKAND2X2TS U28 ( .A(in2[0]), .B(in1[0]), .Y(n34) );
  CLKAND2X2TS U29 ( .A(n29), .B(in2[6]), .Y(n30) );
  XOR2XLTS U30 ( .A(in1[3]), .B(in2[3]), .Y(n27) );
  XOR2XLTS U31 ( .A(in1[5]), .B(in2[5]), .Y(n25) );
  OAI211XLTS U32 ( .A0(in2[3]), .A1(in1[3]), .B0(in1[2]), .C0(in2[2]), .Y(n24)
         );
  AOI222X1TS U33 ( .A0(in1[5]), .A1(in2[5]), .B0(in1[5]), .B1(n20), .C0(in2[5]), .C1(n20), .Y(n21) );
  NOR2BX1TS U34 ( .AN(in1[6]), .B(n21), .Y(n23) );
  XOR2X1TS U35 ( .A(in1[7]), .B(n23), .Y(n31) );
  XNOR2X1TS U36 ( .A(n21), .B(in1[6]), .Y(n29) );
  AO21XLTS U37 ( .A0(in1[7]), .A1(n23), .B0(n22), .Y(res[8]) );
  AOI2BB1XLTS U38 ( .A0N(in2[0]), .A1N(in1[0]), .B0(n34), .Y(res[0]) );
  OAI2BB1X1TS U39 ( .A0N(in1[3]), .A1N(in2[3]), .B0(n24), .Y(n32) );
  XOR2XLTS U40 ( .A(n26), .B(n25), .Y(res[5]) );
  XOR2XLTS U41 ( .A(n28), .B(n27), .Y(res[3]) );
  AOI2BB1XLTS U42 ( .A0N(n29), .A1N(in2[6]), .B0(n30), .Y(res[6]) );
  CMPR32X2TS U43 ( .A(in2[7]), .B(n31), .C(n30), .CO(n22), .S(res[7]) );
  CMPR32X2TS U44 ( .A(in1[4]), .B(in2[4]), .C(n32), .CO(n26), .S(res[4]) );
  CMPR32X2TS U45 ( .A(in2[2]), .B(in1[2]), .C(n33), .CO(n28), .S(res[2]) );
  CMPR32X2TS U46 ( .A(in1[1]), .B(in2[1]), .C(n34), .CO(n33), .S(res[1]) );
initial $sdf_annotate("GDA_St_N8_M4_P2_syn.sdf"); 
 endmodule

