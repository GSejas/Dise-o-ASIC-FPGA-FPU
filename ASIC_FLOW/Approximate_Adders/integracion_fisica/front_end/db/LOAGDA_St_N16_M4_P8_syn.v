/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:48:27 2016
/////////////////////////////////////////////////////////////


module LOAGDA_St_N16_M4_P8 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   intadd_17_CI, intadd_17_n4, intadd_17_n3, intadd_17_n2, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65;

  CMPR32X2TS intadd_17_U4 ( .A(in1[13]), .B(in2[13]), .C(intadd_17_n4), .CO(
        intadd_17_n3), .S(res[13]) );
  CMPR32X2TS intadd_17_U3 ( .A(in1[14]), .B(in2[14]), .C(intadd_17_n3), .CO(
        intadd_17_n2), .S(res[14]) );
  CMPR32X2TS intadd_17_U2 ( .A(in1[15]), .B(in2[15]), .C(intadd_17_n2), .CO(
        res[16]), .S(res[15]) );
  NOR2X1TS U47 ( .A(in1[5]), .B(in2[5]), .Y(n54) );
  NAND2X1TS U48 ( .A(in2[10]), .B(in1[10]), .Y(n44) );
  OAI2BB1X2TS U49 ( .A0N(in1[5]), .A1N(in2[5]), .B0(n40), .Y(n41) );
  NOR2X2TS U50 ( .A(n56), .B(n55), .Y(n58) );
  OAI2BB2X1TS U51 ( .B0(n38), .B1(n37), .A0N(in2[2]), .A1N(in1[2]), .Y(n39) );
  NOR2X1TS U52 ( .A(in1[9]), .B(in2[9]), .Y(n45) );
  OR2X1TS U53 ( .A(in1[0]), .B(in2[0]), .Y(res[0]) );
  OR2X2TS U54 ( .A(in1[3]), .B(in2[3]), .Y(res[3]) );
  OR2X2TS U55 ( .A(in2[4]), .B(in1[4]), .Y(n51) );
  OAI22X2TS U56 ( .A0(n64), .A1(n60), .B0(in2[10]), .B1(in1[10]), .Y(n61) );
  NOR2X4TS U57 ( .A(n54), .B(n53), .Y(n52) );
  OAI21X2TS U58 ( .A0(in2[8]), .A1(in1[8]), .B0(n57), .Y(n46) );
  OR2X2TS U59 ( .A(in2[2]), .B(in1[2]), .Y(res[2]) );
  ADDFHX2TS U60 ( .A(in2[8]), .B(in1[8]), .CI(n59), .CO(n65), .S(res[8]) );
  OAI2BB1X4TS U61 ( .A0N(in2[11]), .A1N(in1[11]), .B0(n49), .Y(intadd_17_CI)
         );
  OAI22X4TS U62 ( .A0(in1[11]), .A1(in2[11]), .B0(n60), .B1(n48), .Y(n49) );
  OAI21X4TS U63 ( .A0(in2[4]), .A1(in1[4]), .B0(n50), .Y(n53) );
  AO22X4TS U64 ( .A0(in1[3]), .A1(in2[3]), .B0(res[3]), .B1(n39), .Y(n50) );
  OAI2BB2X4TS U65 ( .B0(n56), .B1(n43), .A0N(in1[7]), .A1N(in2[7]), .Y(n57) );
  AOI22X4TS U66 ( .A0(in1[6]), .A1(in2[6]), .B0(n42), .B1(n41), .Y(n43) );
  OR2X2TS U67 ( .A(in1[1]), .B(in2[1]), .Y(res[1]) );
  AOI22X1TS U68 ( .A0(in1[1]), .A1(in2[1]), .B0(in1[0]), .B1(in2[0]), .Y(n38)
         );
  NAND2X1TS U69 ( .A(res[1]), .B(res[2]), .Y(n37) );
  OR2X2TS U70 ( .A(in1[6]), .B(in2[6]), .Y(n42) );
  NAND2X2TS U71 ( .A(n52), .B(n42), .Y(n55) );
  OA21XLTS U72 ( .A0(n52), .A1(n42), .B0(n55), .Y(res[6]) );
  INVX2TS U73 ( .A(n44), .Y(n60) );
  AOI22X1TS U74 ( .A0(in2[8]), .A1(in1[8]), .B0(in1[9]), .B1(in2[9]), .Y(n47)
         );
  NOR2X2TS U75 ( .A(in1[7]), .B(in2[7]), .Y(n56) );
  OAI211X1TS U76 ( .A0(in2[5]), .A1(in1[5]), .B0(in1[4]), .C0(in2[4]), .Y(n40)
         );
  OAI21X1TS U77 ( .A0(in2[10]), .A1(in1[10]), .B0(n44), .Y(n63) );
  AOI211X1TS U78 ( .A0(n47), .A1(n46), .B0(n45), .C0(n63), .Y(n48) );
  OA21XLTS U79 ( .A0(n51), .A1(n50), .B0(n53), .Y(res[4]) );
  AOI21X1TS U80 ( .A0(n54), .A1(n53), .B0(n52), .Y(res[5]) );
  AOI21X1TS U81 ( .A0(n56), .A1(n55), .B0(n58), .Y(res[7]) );
  OR2X2TS U82 ( .A(n58), .B(n57), .Y(n59) );
  XOR2X1TS U83 ( .A(in2[11]), .B(in1[11]), .Y(n62) );
  XNOR2X1TS U84 ( .A(n62), .B(n61), .Y(res[11]) );
  XNOR2X1TS U85 ( .A(n64), .B(n63), .Y(res[10]) );
  CMPR32X2TS U86 ( .A(in1[9]), .B(in2[9]), .C(n65), .CO(n64), .S(res[9]) );
  CMPR32X2TS U87 ( .A(in1[12]), .B(in2[12]), .C(intadd_17_CI), .CO(
        intadd_17_n4), .S(res[12]) );
initial $sdf_annotate("LOAGDA_St_N16_M4_P8_syn.sdf"); 
 endmodule

