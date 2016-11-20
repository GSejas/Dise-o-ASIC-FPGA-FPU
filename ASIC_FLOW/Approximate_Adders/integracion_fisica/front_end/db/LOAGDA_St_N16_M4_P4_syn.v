/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:19:15 2016
/////////////////////////////////////////////////////////////


module LOAGDA_St_N16_M4_P4 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   intadd_6_CI, intadd_6_n4, intadd_6_n3, intadd_6_n2, intadd_7_CI,
         intadd_7_n3, intadd_7_n2, intadd_7_n1, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47;

  CMPR32X2TS intadd_6_U5 ( .A(in1[12]), .B(in2[12]), .C(intadd_6_CI), .CO(
        intadd_6_n4), .S(res[12]) );
  CMPR32X2TS intadd_6_U4 ( .A(in1[13]), .B(in2[13]), .C(intadd_6_n4), .CO(
        intadd_6_n3), .S(res[13]) );
  CMPR32X2TS intadd_6_U3 ( .A(in1[14]), .B(in2[14]), .C(intadd_6_n3), .CO(
        intadd_6_n2), .S(res[14]) );
  CMPR32X2TS intadd_6_U2 ( .A(in1[15]), .B(in2[15]), .C(intadd_6_n2), .CO(
        res[16]), .S(res[15]) );
  CMPR32X2TS intadd_7_U3 ( .A(in2[9]), .B(in1[9]), .C(intadd_7_n3), .CO(
        intadd_7_n2), .S(res[9]) );
  ADDFX1TS intadd_7_U4 ( .A(in1[8]), .B(in2[8]), .CI(intadd_7_CI), .CO(
        intadd_7_n3), .S(res[8]) );
  ADDFX1TS intadd_7_U2 ( .A(in2[10]), .B(in1[10]), .CI(intadd_7_n2), .CO(
        intadd_7_n1), .S(res[10]) );
  AO22X1TS U39 ( .A0(in1[7]), .A1(in2[7]), .B0(n37), .B1(n32), .Y(intadd_7_CI)
         );
  XOR2X1TS U40 ( .A(intadd_7_n1), .B(n29), .Y(res[11]) );
  NOR2X2TS U41 ( .A(in2[6]), .B(in1[6]), .Y(n47) );
  NAND3XLTS U42 ( .A(res[1]), .B(res[2]), .C(n33), .Y(n34) );
  AO22XLTS U43 ( .A0(in1[1]), .A1(in2[1]), .B0(in1[0]), .B1(in2[0]), .Y(n33)
         );
  XOR2XLTS U44 ( .A(n47), .B(n46), .Y(res[6]) );
  OAI2BB2XLTS U45 ( .B0(n47), .B1(n31), .A0N(in2[6]), .A1N(in1[6]), .Y(n32) );
  XOR2XLTS U46 ( .A(in2[11]), .B(in1[11]), .Y(n29) );
  OAI31X1TS U47 ( .A0(n47), .A1(n37), .A2(n46), .B0(n36), .Y(res[7]) );
  OAI21X2TS U48 ( .A0(in1[5]), .A1(in2[5]), .B0(n45), .Y(n46) );
  OAI2BB2X1TS U49 ( .B0(n39), .B1(n38), .A0N(in2[10]), .A1N(in1[10]), .Y(n41)
         );
  AOI2BB1X2TS U50 ( .A0N(in1[4]), .A1N(in2[4]), .B0(n42), .Y(n45) );
  OR2X1TS U51 ( .A(in1[7]), .B(in2[7]), .Y(n37) );
  OR2X1TS U52 ( .A(in1[5]), .B(in2[5]), .Y(n44) );
  AND3X1TS U53 ( .A(in1[4]), .B(in2[4]), .C(n44), .Y(n30) );
  AOI21X1TS U54 ( .A0(in2[5]), .A1(in1[5]), .B0(n30), .Y(n31) );
  OR2X1TS U55 ( .A(in1[0]), .B(in2[0]), .Y(res[0]) );
  OR2X1TS U56 ( .A(in1[1]), .B(in2[1]), .Y(res[1]) );
  OR2X1TS U57 ( .A(in2[2]), .B(in1[2]), .Y(res[2]) );
  OR2X1TS U58 ( .A(in1[3]), .B(in2[3]), .Y(res[3]) );
  AOI22X1TS U59 ( .A0(in1[3]), .A1(in2[3]), .B0(in2[2]), .B1(in1[2]), .Y(n35)
         );
  OAI2BB1X1TS U60 ( .A0N(n35), .A1N(n34), .B0(res[3]), .Y(n42) );
  OAI21XLTS U61 ( .A0(n47), .A1(n46), .B0(n37), .Y(n36) );
  AOI22X1TS U62 ( .A0(in2[9]), .A1(in1[9]), .B0(in1[8]), .B1(in2[8]), .Y(n39)
         );
  OAI22X1TS U63 ( .A0(in2[10]), .A1(in1[10]), .B0(in2[9]), .B1(in1[9]), .Y(n38) );
  OAI21XLTS U64 ( .A0(n41), .A1(in1[11]), .B0(in2[11]), .Y(n40) );
  OAI2BB1X1TS U65 ( .A0N(in1[11]), .A1N(n41), .B0(n40), .Y(intadd_6_CI) );
  NOR2XLTS U66 ( .A(in1[4]), .B(in2[4]), .Y(n43) );
  AOI21X1TS U67 ( .A0(n43), .A1(n42), .B0(n45), .Y(res[4]) );
  OA21XLTS U68 ( .A0(n45), .A1(n44), .B0(n46), .Y(res[5]) );
initial $sdf_annotate("LOAGDA_St_N16_M4_P4_syn.sdf"); 
 endmodule

