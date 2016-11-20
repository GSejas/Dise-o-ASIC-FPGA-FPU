/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:52:15 2016
/////////////////////////////////////////////////////////////


module GDA_St_N8_M8_P3 ( in1, in2, res );
  input [7:0] in1;
  input [7:0] in2;
  output [8:0] res;
  wire   n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48;

  NAND2X1TS U31 ( .A(in1[4]), .B(in2[4]), .Y(n38) );
  CLKAND2X2TS U32 ( .A(in2[0]), .B(in1[0]), .Y(n33) );
  XOR2XLTS U33 ( .A(n46), .B(n44), .Y(res[5]) );
  XOR2XLTS U34 ( .A(n48), .B(n47), .Y(res[6]) );
  NAND2BXLTS U35 ( .AN(n38), .B(n46), .Y(n29) );
  OAI31X1TS U36 ( .A0(n43), .A1(n42), .A2(n41), .B0(n40), .Y(n44) );
  OA21X1TS U37 ( .A0(in1[5]), .A1(in2[5]), .B0(n31), .Y(n46) );
  OAI21X1TS U38 ( .A0(in1[6]), .A1(in2[6]), .B0(n30), .Y(n47) );
  OAI21X1TS U39 ( .A0(n43), .A1(n39), .B0(n38), .Y(n45) );
  OAI21X2TS U40 ( .A0(in1[4]), .A1(in2[4]), .B0(n38), .Y(n43) );
  OAI21X2TS U41 ( .A0(in1[3]), .A1(in2[3]), .B0(n39), .Y(n42) );
  NAND2X2TS U42 ( .A(in1[3]), .B(in2[3]), .Y(n39) );
  AOI2BB1XLTS U43 ( .A0N(in2[0]), .A1N(in1[0]), .B0(n33), .Y(res[0]) );
  NAND2X1TS U44 ( .A(in1[5]), .B(in2[5]), .Y(n31) );
  NAND2X1TS U45 ( .A(in1[6]), .B(in2[6]), .Y(n30) );
  AOI32X1TS U46 ( .A0(n31), .A1(n30), .A2(n29), .B0(n47), .B1(n30), .Y(n32) );
  CMPR32X2TS U47 ( .A(in2[7]), .B(in1[7]), .C(n32), .CO(res[8]), .S(res[7]) );
  CMPR32X2TS U48 ( .A(in1[1]), .B(in2[1]), .C(n33), .CO(n34), .S(res[1]) );
  CMPR32X2TS U49 ( .A(in2[2]), .B(in1[2]), .C(n34), .CO(n35), .S(res[2]) );
  XNOR2X1TS U50 ( .A(n35), .B(n42), .Y(res[3]) );
  NAND2X1TS U51 ( .A(in1[2]), .B(in2[2]), .Y(n41) );
  OAI211XLTS U52 ( .A0(in1[2]), .A1(in2[2]), .B0(in1[1]), .C0(in2[1]), .Y(n36)
         );
  AOI32X1TS U53 ( .A0(n41), .A1(n39), .A2(n36), .B0(n42), .B1(n39), .Y(n37) );
  XNOR2X1TS U54 ( .A(n43), .B(n37), .Y(res[4]) );
  INVX2TS U55 ( .A(n45), .Y(n40) );
  AOI22X1TS U56 ( .A0(in1[5]), .A1(in2[5]), .B0(n46), .B1(n45), .Y(n48) );
initial $sdf_annotate("GDA_St_N8_M8_P3_syn.sdf"); 
 endmodule

