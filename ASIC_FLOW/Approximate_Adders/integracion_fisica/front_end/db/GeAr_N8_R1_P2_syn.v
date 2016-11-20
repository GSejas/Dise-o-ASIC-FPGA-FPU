/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:54:16 2016
/////////////////////////////////////////////////////////////


module GeAr_N8_R1_P2 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47;

  CLKAND2X2TS U31 ( .A(in1[0]), .B(in2[0]), .Y(n47) );
  OAI21XLTS U32 ( .A0(in2[2]), .A1(in1[2]), .B0(n44), .Y(n46) );
  NOR2XLTS U33 ( .A(in2[6]), .B(in1[6]), .Y(n37) );
  NOR2X2TS U34 ( .A(in1[4]), .B(in2[4]), .Y(n34) );
  OAI21XLTS U35 ( .A0(n41), .A1(n40), .B0(n39), .Y(n42) );
  OAI21XLTS U36 ( .A0(n30), .A1(n40), .B0(n29), .Y(n28) );
  NOR2X2TS U37 ( .A(in1[5]), .B(in2[5]), .Y(n40) );
  OAI21XLTS U38 ( .A0(n27), .A1(n32), .B0(n26), .Y(n25) );
  NOR2X2TS U39 ( .A(in1[3]), .B(in2[3]), .Y(n32) );
  OAI211XLTS U40 ( .A0(in2[2]), .A1(in1[2]), .B0(in2[1]), .C0(in1[1]), .Y(n24)
         );
  OAI21XLTS U41 ( .A0(n36), .A1(n34), .B0(n35), .Y(n33) );
  NAND2X1TS U42 ( .A(in1[3]), .B(in2[3]), .Y(n31) );
  INVX2TS U43 ( .A(n31), .Y(n27) );
  NAND2X1TS U44 ( .A(in2[2]), .B(in1[2]), .Y(n44) );
  NAND2X1TS U45 ( .A(n44), .B(n24), .Y(n26) );
  OAI31X1TS U46 ( .A0(n27), .A1(n26), .A2(n32), .B0(n25), .Y(res[3]) );
  NAND2X1TS U47 ( .A(in1[5]), .B(in2[5]), .Y(n39) );
  INVX2TS U48 ( .A(n39), .Y(n30) );
  NAND2X1TS U49 ( .A(in1[4]), .B(in2[4]), .Y(n41) );
  OAI21X1TS U50 ( .A0(n34), .A1(n31), .B0(n41), .Y(n29) );
  OAI31X1TS U51 ( .A0(n30), .A1(n29), .A2(n40), .B0(n28), .Y(res[5]) );
  INVX2TS U52 ( .A(n41), .Y(n36) );
  OAI21X1TS U53 ( .A0(n32), .A1(n44), .B0(n31), .Y(n35) );
  OAI31X1TS U54 ( .A0(n36), .A1(n35), .A2(n34), .B0(n33), .Y(res[4]) );
  OAI2BB2XLTS U55 ( .B0(n39), .B1(n37), .A0N(in2[6]), .A1N(in1[6]), .Y(n38) );
  CMPR32X2TS U56 ( .A(in1[7]), .B(in2[7]), .C(n38), .CO(res[8]), .S(res[7]) );
  XNOR2X1TS U57 ( .A(n42), .B(in2[6]), .Y(n43) );
  XNOR2X1TS U58 ( .A(in1[6]), .B(n43), .Y(res[6]) );
  CMPR32X2TS U59 ( .A(in2[1]), .B(in1[1]), .C(n47), .CO(n45), .S(res[1]) );
  XNOR2X1TS U60 ( .A(n46), .B(n45), .Y(res[2]) );
  AOI2BB1XLTS U61 ( .A0N(in1[0]), .A1N(in2[0]), .B0(n47), .Y(res[0]) );
initial $sdf_annotate("GeAr_N8_R1_P2_syn.sdf"); 
 endmodule

