/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:24:03 2016
/////////////////////////////////////////////////////////////


module GDA_St_N8_M8_P4 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;

  ADDFX1TS U32 ( .A(in2[7]), .B(in1[7]), .CI(n32), .CO(res[8]), .S(res[7]) );
  CLKAND2X2TS U33 ( .A(n43), .B(n36), .Y(n40) );
  NOR2X2TS U34 ( .A(n40), .B(n44), .Y(n39) );
  INVX2TS U35 ( .A(n44), .Y(n42) );
  CLKAND2X2TS U36 ( .A(in2[0]), .B(in1[0]), .Y(n38) );
  OAI31X1TS U37 ( .A0(n35), .A1(n45), .A2(n39), .B0(n34), .Y(res[4]) );
  INVX2TS U38 ( .A(n33), .Y(n35) );
  INVX2TS U39 ( .A(n45), .Y(n48) );
  OAI2BB2XLTS U40 ( .B0(n50), .B1(n54), .A0N(in1[6]), .A1N(in2[6]), .Y(n32) );
  AOI211X1TS U41 ( .A0(n48), .A1(n47), .B0(n51), .C0(n46), .Y(n49) );
  OA21X1TS U42 ( .A0(in1[2]), .A1(in2[2]), .B0(n43), .Y(n41) );
  AOI22X1TS U43 ( .A0(in1[5]), .A1(in2[5]), .B0(n52), .B1(n46), .Y(n50) );
  CLKXOR2X2TS U44 ( .A(in1[5]), .B(in2[5]), .Y(n52) );
  OAI21X1TS U45 ( .A0(in1[6]), .A1(in2[6]), .B0(n31), .Y(n54) );
  OAI21X2TS U46 ( .A0(in1[3]), .A1(in2[3]), .B0(n33), .Y(n44) );
  OAI21X2TS U47 ( .A0(in1[4]), .A1(in2[4]), .B0(n30), .Y(n45) );
  NAND2X1TS U48 ( .A(in1[3]), .B(in2[3]), .Y(n33) );
  NAND2X1TS U49 ( .A(in1[4]), .B(in2[4]), .Y(n30) );
  OAI21X1TS U50 ( .A0(n33), .A1(n45), .B0(n30), .Y(n46) );
  NAND2X1TS U51 ( .A(in1[6]), .B(in2[6]), .Y(n31) );
  NAND2X1TS U52 ( .A(in1[2]), .B(in2[2]), .Y(n43) );
  NAND2X1TS U53 ( .A(n41), .B(n37), .Y(n36) );
  OAI21XLTS U54 ( .A0(n35), .A1(n39), .B0(n45), .Y(n34) );
  OA21XLTS U55 ( .A0(n41), .A1(n37), .B0(n36), .Y(res[2]) );
  AOI2BB1XLTS U56 ( .A0N(in2[0]), .A1N(in1[0]), .B0(n38), .Y(res[0]) );
  CMPR32X2TS U57 ( .A(in1[1]), .B(in2[1]), .C(n38), .CO(n37), .S(res[1]) );
  AOI21X1TS U58 ( .A0(n40), .A1(n44), .B0(n39), .Y(res[3]) );
  AND4X1TS U59 ( .A(n42), .B(n41), .C(in2[1]), .D(in1[1]), .Y(n47) );
  NOR3X1TS U60 ( .A(n45), .B(n44), .C(n43), .Y(n51) );
  XNOR2X1TS U61 ( .A(n52), .B(n49), .Y(res[5]) );
  OAI2BB1X1TS U62 ( .A0N(n52), .A1N(n51), .B0(n50), .Y(n53) );
  XNOR2X1TS U63 ( .A(n54), .B(n53), .Y(res[6]) );
initial $sdf_annotate("GDA_St_N8_M8_P4_syn.sdf"); 
 endmodule

