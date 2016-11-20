/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:48:39 2016
/////////////////////////////////////////////////////////////


module ACA_II_N16_Q4 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60;

  OAI211XLTS U42 ( .A0(in2[7]), .A1(in1[7]), .B0(in2[6]), .C0(in1[6]), .Y(n37)
         );
  OAI211XLTS U43 ( .A0(in2[9]), .A1(in1[9]), .B0(in2[8]), .C0(in1[8]), .Y(n40)
         );
  OAI211XLTS U44 ( .A0(in2[11]), .A1(in1[11]), .B0(in2[10]), .C0(in1[10]), .Y(
        n46) );
  CLKAND2X2TS U45 ( .A(in1[0]), .B(in2[0]), .Y(n56) );
  XOR2XLTS U46 ( .A(in1[3]), .B(in2[3]), .Y(n49) );
  XOR2XLTS U47 ( .A(in1[5]), .B(in2[5]), .Y(n44) );
  XOR2XLTS U48 ( .A(in1[7]), .B(in2[7]), .Y(n35) );
  XOR2XLTS U49 ( .A(in1[9]), .B(in2[9]), .Y(n38) );
  XOR2XLTS U50 ( .A(in1[11]), .B(in2[11]), .Y(n41) );
  XOR2XLTS U51 ( .A(in1[13]), .B(in2[13]), .Y(n47) );
  OAI211XLTS U52 ( .A0(in2[13]), .A1(in1[13]), .B0(in2[12]), .C0(in1[12]), .Y(
        n58) );
  OAI211XLTS U53 ( .A0(in2[3]), .A1(in1[3]), .B0(in2[2]), .C0(in1[2]), .Y(n43)
         );
  OAI211XLTS U54 ( .A0(in2[5]), .A1(in1[5]), .B0(in2[4]), .C0(in1[4]), .Y(n34)
         );
  AOI2BB1XLTS U55 ( .A0N(in1[0]), .A1N(in2[0]), .B0(n56), .Y(res[0]) );
  OAI2BB1X1TS U56 ( .A0N(in1[5]), .A1N(in2[5]), .B0(n34), .Y(n54) );
  XOR2XLTS U57 ( .A(n36), .B(n35), .Y(res[7]) );
  OAI2BB1X1TS U58 ( .A0N(in1[7]), .A1N(in2[7]), .B0(n37), .Y(n53) );
  XOR2XLTS U59 ( .A(n39), .B(n38), .Y(res[9]) );
  OAI2BB1X1TS U60 ( .A0N(in1[9]), .A1N(in2[9]), .B0(n40), .Y(n52) );
  XOR2XLTS U61 ( .A(n42), .B(n41), .Y(res[11]) );
  OAI2BB1X1TS U62 ( .A0N(in1[3]), .A1N(in2[3]), .B0(n43), .Y(n55) );
  XOR2XLTS U63 ( .A(n45), .B(n44), .Y(res[5]) );
  OAI2BB1X1TS U64 ( .A0N(in1[11]), .A1N(in2[11]), .B0(n46), .Y(n51) );
  XOR2XLTS U65 ( .A(n48), .B(n47), .Y(res[13]) );
  XOR2XLTS U66 ( .A(n50), .B(n49), .Y(res[3]) );
  CMPR32X2TS U67 ( .A(in2[12]), .B(in1[12]), .C(n51), .CO(n48), .S(res[12]) );
  CMPR32X2TS U68 ( .A(in1[10]), .B(in2[10]), .C(n52), .CO(n42), .S(res[10]) );
  CMPR32X2TS U69 ( .A(in1[8]), .B(in2[8]), .C(n53), .CO(n39), .S(res[8]) );
  CMPR32X2TS U70 ( .A(in1[6]), .B(in2[6]), .C(n54), .CO(n36), .S(res[6]) );
  CMPR32X2TS U71 ( .A(in1[4]), .B(in2[4]), .C(n55), .CO(n45), .S(res[4]) );
  CMPR32X2TS U72 ( .A(in1[1]), .B(in2[1]), .C(n56), .CO(n57), .S(res[1]) );
  CMPR32X2TS U73 ( .A(in1[2]), .B(in2[2]), .C(n57), .CO(n50), .S(res[2]) );
  OAI2BB1X1TS U74 ( .A0N(in1[13]), .A1N(in2[13]), .B0(n58), .Y(n59) );
  CMPR32X2TS U75 ( .A(in1[14]), .B(in2[14]), .C(n59), .CO(n60), .S(res[14]) );
  CMPR32X2TS U76 ( .A(in1[15]), .B(in2[15]), .C(n60), .CO(res[16]), .S(res[15]) );
initial $sdf_annotate("ACA_II_N16_Q4_syn.sdf"); 
 endmodule

