/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:52:39 2016
/////////////////////////////////////////////////////////////


module GDA_St_N8_M8_P5 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55;

  OA21X1TS U32 ( .A0(in1[3]), .A1(in2[3]), .B0(n30), .Y(n48) );
  OAI2BB2XLTS U33 ( .B0(n50), .B1(n55), .A0N(in1[6]), .A1N(in2[6]), .Y(n41) );
  CLKAND2X2TS U34 ( .A(in2[0]), .B(in1[0]), .Y(n42) );
  NAND2X1TS U35 ( .A(n36), .B(n33), .Y(n44) );
  OAI21X1TS U36 ( .A0(n38), .A1(n53), .B0(n45), .Y(n39) );
  OAI21X1TS U37 ( .A0(in1[2]), .A1(in2[2]), .B0(n36), .Y(n52) );
  NAND2X2TS U38 ( .A(in1[2]), .B(in2[2]), .Y(n36) );
  XOR2X1TS U39 ( .A(n49), .B(n47), .Y(res[5]) );
  NAND2X1TS U40 ( .A(n30), .B(n43), .Y(n31) );
  NAND2X1TS U41 ( .A(n46), .B(n45), .Y(n47) );
  NAND4XLTS U42 ( .A(n49), .B(n48), .C(in2[1]), .D(in1[1]), .Y(n51) );
  OAI21X2TS U43 ( .A0(in1[4]), .A1(in2[4]), .B0(n45), .Y(n53) );
  NAND2X1TS U44 ( .A(n35), .B(n34), .Y(n33) );
  NAND2X1TS U45 ( .A(in1[4]), .B(in2[4]), .Y(n45) );
  INVX2TS U46 ( .A(n53), .Y(n32) );
  NAND2X1TS U47 ( .A(in1[3]), .B(in2[3]), .Y(n30) );
  INVX2TS U48 ( .A(n52), .Y(n35) );
  NAND2X1TS U49 ( .A(n48), .B(n44), .Y(n43) );
  NAND2X1TS U50 ( .A(n32), .B(n31), .Y(n46) );
  OA21XLTS U51 ( .A0(n32), .A1(n31), .B0(n46), .Y(res[4]) );
  OA21XLTS U52 ( .A0(n35), .A1(n34), .B0(n33), .Y(res[2]) );
  AOI2BB1XLTS U53 ( .A0N(in2[0]), .A1N(in1[0]), .B0(n42), .Y(res[0]) );
  CLKXOR2X2TS U54 ( .A(in1[5]), .B(in2[5]), .Y(n49) );
  INVX2TS U55 ( .A(n36), .Y(n37) );
  AOI22X1TS U56 ( .A0(in1[3]), .A1(in2[3]), .B0(n37), .B1(n48), .Y(n38) );
  AOI22X1TS U57 ( .A0(in1[5]), .A1(in2[5]), .B0(n49), .B1(n39), .Y(n50) );
  NAND2X1TS U58 ( .A(in1[6]), .B(in2[6]), .Y(n40) );
  OAI21X1TS U59 ( .A0(in1[6]), .A1(in2[6]), .B0(n40), .Y(n55) );
  CMPR32X2TS U60 ( .A(in2[7]), .B(in1[7]), .C(n41), .CO(res[8]), .S(res[7]) );
  CMPR32X2TS U61 ( .A(in1[1]), .B(in2[1]), .C(n42), .CO(n34), .S(res[1]) );
  OA21XLTS U62 ( .A0(n48), .A1(n44), .B0(n43), .Y(res[3]) );
  OAI31X1TS U63 ( .A0(n53), .A1(n52), .A2(n51), .B0(n50), .Y(n54) );
  XNOR2X1TS U64 ( .A(n55), .B(n54), .Y(res[6]) );
initial $sdf_annotate("GDA_St_N8_M8_P5_syn.sdf"); 
 endmodule

