/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:52:51 2016
/////////////////////////////////////////////////////////////


module GDA_St_N8_M8_P6 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56;

  OAI2BB2XLTS U33 ( .B0(n43), .B1(n42), .A0N(in2[6]), .A1N(in1[6]), .Y(n44) );
  NOR2X2TS U34 ( .A(n53), .B(n52), .Y(n51) );
  NOR2X4TS U35 ( .A(n40), .B(n51), .Y(n56) );
  XNOR2X1TS U36 ( .A(in1[6]), .B(n34), .Y(res[6]) );
  XOR2XLTS U37 ( .A(n47), .B(n46), .Y(res[2]) );
  AOI2BB1XLTS U38 ( .A0N(in2[0]), .A1N(in1[0]), .B0(n45), .Y(res[0]) );
  ADDFX1TS U39 ( .A(in1[1]), .B(in2[1]), .CI(n45), .CO(n46), .S(res[1]) );
  AND2X2TS U40 ( .A(in2[0]), .B(in1[0]), .Y(n45) );
  NOR2X1TS U41 ( .A(in2[6]), .B(in1[6]), .Y(n42) );
  AND2X2TS U42 ( .A(in1[2]), .B(in2[2]), .Y(n35) );
  OAI21X1TS U43 ( .A0(n41), .A1(n54), .B0(in2[6]), .Y(n33) );
  NOR2X2TS U44 ( .A(n50), .B(n49), .Y(n48) );
  NOR2BX2TS U45 ( .AN(n36), .B(n48), .Y(n53) );
  AOI21X1TS U46 ( .A0(n47), .A1(n46), .B0(n35), .Y(n50) );
  INVX2TS U47 ( .A(n32), .Y(n40) );
  AOI2BB1X2TS U48 ( .A0N(in1[2]), .A1N(in2[2]), .B0(n35), .Y(n47) );
  INVX2TS U49 ( .A(n55), .Y(n38) );
  NOR2X2TS U50 ( .A(n55), .B(n56), .Y(n54) );
  OAI21X2TS U51 ( .A0(in1[5]), .A1(in2[5]), .B0(n31), .Y(n55) );
  OAI21X2TS U52 ( .A0(in1[4]), .A1(in2[4]), .B0(n32), .Y(n52) );
  NAND2X1TS U53 ( .A(in1[5]), .B(in2[5]), .Y(n31) );
  INVX2TS U54 ( .A(n31), .Y(n41) );
  NAND2X1TS U55 ( .A(in1[4]), .B(in2[4]), .Y(n32) );
  NAND2X1TS U56 ( .A(in1[3]), .B(in2[3]), .Y(n36) );
  OAI21X2TS U57 ( .A0(in1[3]), .A1(in2[3]), .B0(n36), .Y(n49) );
  OAI31X1TS U58 ( .A0(n41), .A1(in2[6]), .A2(n54), .B0(n33), .Y(n34) );
  AOI31XLTS U59 ( .A0(n47), .A1(in1[1]), .A2(in2[1]), .B0(n35), .Y(n37) );
  OAI32X1TS U60 ( .A0(n52), .A1(n37), .A2(n49), .B0(n36), .B1(n52), .Y(n39) );
  OAI32X1TS U61 ( .A0(n41), .A1(n40), .A2(n39), .B0(n38), .B1(n41), .Y(n43) );
  CMPR32X2TS U62 ( .A(in2[7]), .B(in1[7]), .C(n44), .CO(res[8]), .S(res[7]) );
  AOI21X1TS U63 ( .A0(n50), .A1(n49), .B0(n48), .Y(res[3]) );
  AOI21X1TS U64 ( .A0(n53), .A1(n52), .B0(n51), .Y(res[4]) );
  AOI21X1TS U65 ( .A0(n56), .A1(n55), .B0(n54), .Y(res[5]) );
initial $sdf_annotate("GDA_St_N8_M8_P6_syn.sdf"); 
 endmodule

