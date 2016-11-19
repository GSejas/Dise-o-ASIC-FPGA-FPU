/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:26:06 2016
/////////////////////////////////////////////////////////////


module GeAr_N8_R1_P3 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;

  CLKAND2X2TS U31 ( .A(in1[0]), .B(in2[0]), .Y(n42) );
  OAI21XLTS U32 ( .A0(n37), .A1(n39), .B0(n36), .Y(n35) );
  OAI21XLTS U33 ( .A0(n32), .A1(n39), .B0(n31), .Y(n29) );
  OAI211XLTS U34 ( .A0(in1[2]), .A1(in2[2]), .B0(in1[1]), .C0(in2[1]), .Y(n33)
         );
  OAI21XLTS U35 ( .A0(n27), .A1(n34), .B0(n26), .Y(n25) );
  AOI2BB1XLTS U36 ( .A0N(in1[0]), .A1N(in2[0]), .B0(n42), .Y(res[0]) );
  NAND2X1TS U37 ( .A(in1[3]), .B(in2[3]), .Y(n38) );
  INVX2TS U38 ( .A(n38), .Y(n27) );
  NOR2X2TS U39 ( .A(in1[3]), .B(in2[3]), .Y(n34) );
  OAI31X1TS U40 ( .A0(n27), .A1(n26), .A2(n34), .B0(n25), .Y(res[3]) );
  NOR2X2TS U41 ( .A(in2[5]), .B(in1[5]), .Y(n47) );
  AOI21X1TS U42 ( .A0(in1[5]), .A1(in2[5]), .B0(n47), .Y(n30) );
  INVX2TS U43 ( .A(n34), .Y(n28) );
  AOI31X1TS U44 ( .A0(in1[2]), .A1(in2[2]), .A2(n28), .B0(n27), .Y(n32) );
  NOR2X2TS U45 ( .A(in2[4]), .B(in1[4]), .Y(n39) );
  NAND2X1TS U46 ( .A(in2[4]), .B(in1[4]), .Y(n31) );
  XOR2XLTS U47 ( .A(n30), .B(n29), .Y(res[5]) );
  INVX2TS U48 ( .A(n31), .Y(n37) );
  OAI21X1TS U49 ( .A0(n34), .A1(n33), .B0(n32), .Y(n36) );
  OAI31X1TS U50 ( .A0(n37), .A1(n36), .A2(n39), .B0(n35), .Y(res[4]) );
  NOR2X1TS U51 ( .A(in1[6]), .B(in2[6]), .Y(n45) );
  AOI21X1TS U52 ( .A0(in1[6]), .A1(in2[6]), .B0(n45), .Y(n41) );
  AOI21X1TS U53 ( .A0(in2[5]), .A1(in1[5]), .B0(n37), .Y(n46) );
  OAI32X1TS U54 ( .A0(n47), .A1(n39), .A2(n38), .B0(n46), .B1(n47), .Y(n40) );
  XOR2XLTS U55 ( .A(n41), .B(n40), .Y(res[6]) );
  CMPR32X2TS U56 ( .A(in2[1]), .B(in1[1]), .C(n42), .CO(n43), .S(res[1]) );
  CMPR32X2TS U57 ( .A(in1[2]), .B(in2[2]), .C(n43), .CO(n26), .S(res[2]) );
  NAND2X1TS U58 ( .A(in1[6]), .B(in2[6]), .Y(n44) );
  OAI31X1TS U59 ( .A0(n47), .A1(n46), .A2(n45), .B0(n44), .Y(n48) );
  CMPR32X2TS U60 ( .A(in1[7]), .B(in2[7]), .C(n48), .CO(res[8]), .S(res[7]) );
initial $sdf_annotate("GeAr_N8_R1_P3_syn.sdf"); 
 endmodule

