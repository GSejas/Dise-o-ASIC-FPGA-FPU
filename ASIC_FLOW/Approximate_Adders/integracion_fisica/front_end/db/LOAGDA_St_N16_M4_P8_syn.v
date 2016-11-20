/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:19:27 2016
/////////////////////////////////////////////////////////////


module LOAGDA_St_N16_M4_P8 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   intadd_8_CI, intadd_8_n4, intadd_8_n3, intadd_8_n2, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76;

  CMPR32X2TS intadd_8_U4 ( .A(in1[13]), .B(in2[13]), .C(intadd_8_n4), .CO(
        intadd_8_n3), .S(res[13]) );
  ADDFHX2TS intadd_8_U3 ( .A(in1[14]), .B(in2[14]), .CI(intadd_8_n3), .CO(
        intadd_8_n2), .S(res[14]) );
  ADDFHX2TS intadd_8_U5 ( .A(in1[12]), .B(in2[12]), .CI(intadd_8_CI), .CO(
        intadd_8_n4), .S(res[12]) );
  ADDFX1TS intadd_8_U2 ( .A(in1[15]), .B(in2[15]), .CI(intadd_8_n2), .CO(
        res[16]), .S(res[15]) );
  NAND2X1TS U53 ( .A(n56), .B(n55), .Y(n61) );
  NAND2X1TS U54 ( .A(n41), .B(n40), .Y(n66) );
  NOR2X1TS U55 ( .A(in1[5]), .B(in2[5]), .Y(n76) );
  OAI21X1TS U56 ( .A0(in2[5]), .A1(in1[5]), .B0(n42), .Y(n43) );
  AO22X1TS U57 ( .A0(in1[1]), .A1(in2[1]), .B0(in1[0]), .B1(in2[0]), .Y(n46)
         );
  NOR2X1TS U58 ( .A(in1[3]), .B(in2[3]), .Y(n59) );
  OR2X1TS U59 ( .A(in1[1]), .B(in2[1]), .Y(res[1]) );
  OAI21X1TS U60 ( .A0(n71), .A1(n70), .B0(n61), .Y(n60) );
  NOR2BX4TS U61 ( .AN(n66), .B(n69), .Y(n67) );
  INVX1TS U62 ( .A(n59), .Y(res[3]) );
  AND2X4TS U63 ( .A(in1[4]), .B(in2[4]), .Y(n42) );
  NOR2X2TS U64 ( .A(n51), .B(n63), .Y(n69) );
  OAI21X2TS U65 ( .A0(in2[4]), .A1(in1[4]), .B0(n73), .Y(n75) );
  INVX1TS U66 ( .A(n66), .Y(n68) );
  AOI21X2TS U67 ( .A0(n48), .A1(n47), .B0(n59), .Y(n73) );
  NAND3X1TS U68 ( .A(res[1]), .B(res[2]), .C(n46), .Y(n47) );
  OR2X2TS U69 ( .A(in1[6]), .B(in2[6]), .Y(n62) );
  OR2X1TS U70 ( .A(in1[0]), .B(in2[0]), .Y(res[0]) );
  OR2X2TS U71 ( .A(in2[2]), .B(in1[2]), .Y(res[2]) );
  OAI22X2TS U72 ( .A0(n58), .A1(n57), .B0(n56), .B1(n55), .Y(intadd_8_CI) );
  NOR2X4TS U73 ( .A(n65), .B(n64), .Y(n63) );
  XOR2X1TS U74 ( .A(n71), .B(n70), .Y(res[10]) );
  OAI21X4TS U75 ( .A0(in2[9]), .A1(in1[9]), .B0(n67), .Y(n70) );
  NOR2X2TS U76 ( .A(n76), .B(n75), .Y(n74) );
  AOI222X1TS U77 ( .A0(n51), .A1(n66), .B0(in1[9]), .B1(in2[9]), .C0(in1[8]), 
        .C1(in2[8]), .Y(n52) );
  OR2X1TS U78 ( .A(in2[4]), .B(in1[4]), .Y(n72) );
  OA21XLTS U79 ( .A0(n67), .A1(n53), .B0(n70), .Y(res[9]) );
  OAI21X2TS U80 ( .A0(in1[6]), .A1(in2[6]), .B0(n74), .Y(n64) );
  OAI2BB2X2TS U81 ( .B0(n45), .B1(n65), .A0N(in2[7]), .A1N(in1[7]), .Y(n51) );
  AOI22X2TS U82 ( .A0(n44), .A1(n62), .B0(in1[6]), .B1(in2[6]), .Y(n45) );
  INVX2TS U83 ( .A(in1[8]), .Y(n41) );
  INVX2TS U84 ( .A(in2[8]), .Y(n40) );
  OAI2BB1X1TS U85 ( .A0N(in1[5]), .A1N(in2[5]), .B0(n43), .Y(n44) );
  NOR2X2TS U86 ( .A(in2[7]), .B(in1[7]), .Y(n65) );
  AOI22X1TS U87 ( .A0(in1[3]), .A1(in2[3]), .B0(in2[2]), .B1(in1[2]), .Y(n48)
         );
  INVX2TS U88 ( .A(in1[9]), .Y(n50) );
  INVX2TS U89 ( .A(in2[9]), .Y(n49) );
  NAND2X1TS U90 ( .A(n50), .B(n49), .Y(n53) );
  NOR2X2TS U91 ( .A(in1[10]), .B(in2[10]), .Y(n71) );
  NOR3BX1TS U92 ( .AN(n53), .B(n52), .C(n71), .Y(n54) );
  AOI21X2TS U93 ( .A0(in2[10]), .A1(in1[10]), .B0(n54), .Y(n58) );
  INVX2TS U94 ( .A(in1[11]), .Y(n56) );
  INVX2TS U95 ( .A(in2[11]), .Y(n55) );
  INVX2TS U96 ( .A(n61), .Y(n57) );
  OAI31X1TS U97 ( .A0(n71), .A1(n61), .A2(n70), .B0(n60), .Y(res[11]) );
  OA21XLTS U98 ( .A0(n74), .A1(n62), .B0(n64), .Y(res[6]) );
  AOI21X1TS U99 ( .A0(n65), .A1(n64), .B0(n63), .Y(res[7]) );
  AOI21X1TS U100 ( .A0(n69), .A1(n68), .B0(n67), .Y(res[8]) );
  OA21XLTS U101 ( .A0(n73), .A1(n72), .B0(n75), .Y(res[4]) );
  AOI21X1TS U102 ( .A0(n76), .A1(n75), .B0(n74), .Y(res[5]) );
initial $sdf_annotate("LOAGDA_St_N16_M4_P8_syn.sdf"); 
 endmodule

