/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:23:15 2016
/////////////////////////////////////////////////////////////


module GDA_St_N8_M4_P4 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;

  CMPR32X2TS U35 ( .A(in2[7]), .B(n39), .C(n42), .CO(n40), .S(res[7]) );
  OA21X2TS U36 ( .A0(n34), .A1(n33), .B0(n32), .Y(n38) );
  NOR2XLTS U37 ( .A(in2[4]), .B(in1[4]), .Y(n33) );
  AOI2BB2X1TS U38 ( .B0(in1[3]), .B1(in2[3]), .A0N(n48), .A1N(n46), .Y(n34) );
  AOI2BB1X1TS U39 ( .A0N(n43), .A1N(in2[6]), .B0(n42), .Y(res[6]) );
  AND2X2TS U40 ( .A(n43), .B(in2[6]), .Y(n42) );
  XOR2XLTS U41 ( .A(n31), .B(n30), .Y(res[5]) );
  AOI2BB2XLTS U42 ( .B0(n45), .B1(n47), .A0N(n47), .A1N(n45), .Y(res[2]) );
  OA22X2TS U43 ( .A0(n38), .A1(n37), .B0(n36), .B1(n35), .Y(n28) );
  AOI2BB1XLTS U44 ( .A0N(in2[0]), .A1N(in1[0]), .B0(n51), .Y(res[0]) );
  AND2X2TS U45 ( .A(in2[0]), .B(in1[0]), .Y(n51) );
  XOR2X1TS U46 ( .A(in2[5]), .B(in1[5]), .Y(n30) );
  OAI2BB2XLTS U47 ( .B0(in1[2]), .B1(in2[2]), .A0N(n48), .A1N(n47), .Y(n49) );
  XOR2X1TS U48 ( .A(in1[7]), .B(n41), .Y(n39) );
  AO21X1TS U49 ( .A0(in1[7]), .A1(n41), .B0(n40), .Y(res[8]) );
  OAI21X2TS U50 ( .A0(in1[2]), .A1(in2[2]), .B0(n48), .Y(n45) );
  NAND2X1TS U51 ( .A(in1[4]), .B(in2[4]), .Y(n32) );
  AND2X2TS U52 ( .A(n36), .B(n35), .Y(n37) );
  NAND2X1TS U53 ( .A(in1[2]), .B(in2[2]), .Y(n48) );
  NOR2X2TS U54 ( .A(in1[3]), .B(in2[3]), .Y(n46) );
  INVX2TS U55 ( .A(n29), .Y(n47) );
  OAI31X1TS U56 ( .A0(n46), .A1(n47), .A2(n45), .B0(n34), .Y(n44) );
  INVX2TS U57 ( .A(in2[5]), .Y(n36) );
  INVX2TS U58 ( .A(in1[5]), .Y(n35) );
  NOR2BX1TS U59 ( .AN(in1[6]), .B(n28), .Y(n41) );
  XNOR2X1TS U60 ( .A(in1[6]), .B(n28), .Y(n43) );
  CMPR32X2TS U61 ( .A(in2[4]), .B(in1[4]), .C(n44), .CO(n31), .S(res[4]) );
  AOI21X1TS U62 ( .A0(in1[3]), .A1(in2[3]), .B0(n46), .Y(n50) );
  XNOR2X1TS U63 ( .A(n50), .B(n49), .Y(res[3]) );
  CMPR32X2TS U64 ( .A(in1[1]), .B(in2[1]), .C(n51), .CO(n29), .S(res[1]) );
initial $sdf_annotate("GDA_St_N8_M4_P4_syn.sdf"); 
 endmodule

