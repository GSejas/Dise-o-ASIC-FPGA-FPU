/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:19:02 2016
/////////////////////////////////////////////////////////////


module GDA_St_N16_M4_P8 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   intadd_4_CI, intadd_4_n4, intadd_4_n3, intadd_4_n2, intadd_5_CI,
         intadd_5_n3, intadd_5_n2, intadd_5_n1, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77;

  CMPR32X2TS intadd_4_U4 ( .A(in1[13]), .B(in2[13]), .C(intadd_4_n4), .CO(
        intadd_4_n3), .S(res[13]) );
  CMPR32X2TS intadd_5_U3 ( .A(in2[2]), .B(in1[2]), .C(intadd_5_n3), .CO(
        intadd_5_n2), .S(res[2]) );
  CMPR32X2TS intadd_5_U2 ( .A(in2[3]), .B(in1[3]), .C(intadd_5_n2), .CO(
        intadd_5_n1), .S(res[3]) );
  CMPR32X2TS intadd_4_U2 ( .A(in1[15]), .B(in2[15]), .C(intadd_4_n2), .CO(
        res[16]), .S(res[15]) );
  ADDFHX2TS intadd_4_U3 ( .A(in1[14]), .B(in2[14]), .CI(intadd_4_n3), .CO(
        intadd_4_n2), .S(res[14]) );
  OAI21X2TS U51 ( .A0(in2[8]), .A1(in1[8]), .B0(n56), .Y(n50) );
  NAND2X1TS U52 ( .A(in2[10]), .B(in1[10]), .Y(n48) );
  NOR2XLTS U53 ( .A(in1[9]), .B(in2[9]), .Y(n49) );
  NAND2X4TS U54 ( .A(in2[6]), .B(in1[6]), .Y(n45) );
  AOI2BB1XLTS U55 ( .A0N(in2[0]), .A1N(in1[0]), .B0(intadd_5_CI), .Y(res[0])
         );
  AND2X2TS U56 ( .A(in2[0]), .B(in1[0]), .Y(intadd_5_CI) );
  AOI211X2TS U57 ( .A0(n75), .A1(n66), .B0(n74), .C0(n72), .Y(n46) );
  OAI22X1TS U58 ( .A0(in1[7]), .A1(in2[7]), .B0(n68), .B1(n46), .Y(n47) );
  NOR2X4TS U59 ( .A(in1[5]), .B(in2[5]), .Y(n74) );
  NAND2X2TS U60 ( .A(in2[4]), .B(in1[4]), .Y(n66) );
  OAI2BB1X2TS U61 ( .A0N(in2[7]), .A1N(in1[7]), .B0(n47), .Y(n56) );
  ADDFHX2TS U62 ( .A(in1[12]), .B(in2[12]), .CI(intadd_4_CI), .CO(intadd_4_n4), 
        .S(res[12]) );
  OAI2BB2X1TS U63 ( .B0(n60), .B1(n54), .A0N(n53), .A1N(n52), .Y(n55) );
  ADDFHX2TS U64 ( .A(in1[9]), .B(in2[9]), .CI(n65), .CO(n64), .S(res[9]) );
  ADDFHX2TS U65 ( .A(in2[8]), .B(in1[8]), .CI(n59), .CO(n65), .S(res[8]) );
  OAI21X4TS U66 ( .A0(in2[6]), .A1(in1[6]), .B0(n45), .Y(n72) );
  INVX2TS U67 ( .A(n48), .Y(n60) );
  AOI22X1TS U68 ( .A0(in2[8]), .A1(in1[8]), .B0(in1[9]), .B1(in2[9]), .Y(n51)
         );
  INVX2TS U69 ( .A(n45), .Y(n68) );
  NAND2X2TS U70 ( .A(in1[5]), .B(in2[5]), .Y(n75) );
  OAI21X1TS U71 ( .A0(in2[10]), .A1(in1[10]), .B0(n48), .Y(n63) );
  AOI211X1TS U72 ( .A0(n51), .A1(n50), .B0(n49), .C0(n63), .Y(n54) );
  INVX2TS U73 ( .A(in1[11]), .Y(n53) );
  INVX2TS U74 ( .A(in2[11]), .Y(n52) );
  OAI2BB1X1TS U75 ( .A0N(in2[11]), .A1N(in1[11]), .B0(n55), .Y(intadd_4_CI) );
  OAI21X1TS U76 ( .A0(in2[4]), .A1(in1[4]), .B0(n66), .Y(n73) );
  XOR2X1TS U77 ( .A(in2[7]), .B(in1[7]), .Y(n70) );
  NAND3BX1TS U78 ( .AN(n74), .B(intadd_5_n1), .C(n70), .Y(n58) );
  INVX2TS U79 ( .A(n56), .Y(n57) );
  OAI31X1TS U80 ( .A0(n72), .A1(n73), .A2(n58), .B0(n57), .Y(n59) );
  XOR2X1TS U81 ( .A(in2[11]), .B(in1[11]), .Y(n62) );
  OAI22X1TS U82 ( .A0(n64), .A1(n60), .B0(in2[10]), .B1(in1[10]), .Y(n61) );
  XNOR2X1TS U83 ( .A(n62), .B(n61), .Y(res[11]) );
  XNOR2X1TS U84 ( .A(n64), .B(n63), .Y(res[10]) );
  INVX2TS U85 ( .A(n66), .Y(n67) );
  OAI22X1TS U86 ( .A0(in2[4]), .A1(in1[4]), .B0(n67), .B1(intadd_5_n1), .Y(n76) );
  OAI21X1TS U87 ( .A0(n74), .A1(n76), .B0(n75), .Y(n71) );
  OAI22X1TS U88 ( .A0(n71), .A1(n68), .B0(in2[6]), .B1(in1[6]), .Y(n69) );
  XNOR2X1TS U89 ( .A(n70), .B(n69), .Y(res[7]) );
  XNOR2X1TS U90 ( .A(n72), .B(n71), .Y(res[6]) );
  XNOR2X1TS U91 ( .A(intadd_5_n1), .B(n73), .Y(res[4]) );
  NOR2BX1TS U92 ( .AN(n75), .B(n74), .Y(n77) );
  XNOR2X1TS U93 ( .A(n77), .B(n76), .Y(res[5]) );
  CMPR32X2TS U94 ( .A(in1[1]), .B(in2[1]), .C(intadd_5_CI), .CO(intadd_5_n3), 
        .S(res[1]) );
initial $sdf_annotate("GDA_St_N16_M4_P8_syn.sdf"); 
 endmodule

