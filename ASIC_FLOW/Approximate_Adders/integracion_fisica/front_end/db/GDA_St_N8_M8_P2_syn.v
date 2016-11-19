/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:23:39 2016
/////////////////////////////////////////////////////////////


module GDA_St_N8_M8_P2 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40;

  CLKAND2X2TS U25 ( .A(in2[0]), .B(in1[0]), .Y(n25) );
  OAI21XLTS U26 ( .A0(in1[3]), .A1(in2[3]), .B0(n34), .Y(n29) );
  AOI31XLTS U27 ( .A0(n28), .A1(in2[1]), .A2(in1[1]), .B0(n27), .Y(n30) );
  AOI2BB2XLTS U28 ( .B0(n34), .B1(n31), .A0N(in1[3]), .A1N(in2[3]), .Y(n32) );
  OAI21XLTS U29 ( .A0(in2[5]), .A1(in1[5]), .B0(n37), .Y(n36) );
  OAI21XLTS U30 ( .A0(n34), .A1(n33), .B0(n38), .Y(n35) );
  AOI2BB2XLTS U31 ( .B0(n38), .B1(n37), .A0N(in2[5]), .A1N(in1[5]), .Y(n40) );
  AOI2BB1XLTS U32 ( .A0N(in2[0]), .A1N(in1[0]), .B0(n25), .Y(res[0]) );
  NAND2X1TS U33 ( .A(in2[5]), .B(in1[5]), .Y(n37) );
  NAND2X1TS U34 ( .A(in1[6]), .B(in2[6]), .Y(n23) );
  OAI21X1TS U35 ( .A0(in1[6]), .A1(in2[6]), .B0(n23), .Y(n39) );
  OAI2BB2XLTS U36 ( .B0(n37), .B1(n39), .A0N(in1[6]), .A1N(in2[6]), .Y(n24) );
  CMPR32X2TS U37 ( .A(in2[7]), .B(in1[7]), .C(n24), .CO(res[8]), .S(res[7]) );
  NAND2X1TS U38 ( .A(in1[2]), .B(in2[2]), .Y(n31) );
  OA21XLTS U39 ( .A0(in1[2]), .A1(in2[2]), .B0(n31), .Y(n28) );
  CMPR32X2TS U40 ( .A(in1[1]), .B(in2[1]), .C(n25), .CO(n26), .S(res[1]) );
  XOR2XLTS U41 ( .A(n28), .B(n26), .Y(res[2]) );
  INVX2TS U42 ( .A(n31), .Y(n27) );
  NAND2X1TS U43 ( .A(in1[3]), .B(in2[3]), .Y(n34) );
  XOR2XLTS U44 ( .A(n30), .B(n29), .Y(res[3]) );
  NAND2X1TS U45 ( .A(in1[4]), .B(in2[4]), .Y(n38) );
  OAI21X1TS U46 ( .A0(in1[4]), .A1(in2[4]), .B0(n38), .Y(n33) );
  XNOR2X1TS U47 ( .A(n32), .B(n33), .Y(res[4]) );
  XNOR2X1TS U48 ( .A(n36), .B(n35), .Y(res[5]) );
  XNOR2X1TS U49 ( .A(n40), .B(n39), .Y(res[6]) );
initial $sdf_annotate("GDA_St_N8_M8_P2_syn.sdf"); 
 endmodule

