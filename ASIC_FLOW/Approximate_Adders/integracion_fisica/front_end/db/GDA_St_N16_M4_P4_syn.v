/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:50:49 2016
/////////////////////////////////////////////////////////////


module GDA_St_N16_M4_P4 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   intadd_19_CI, intadd_19_n6, intadd_19_n5, intadd_19_n4, intadd_19_n3,
         intadd_19_n2, intadd_19_n1, intadd_20_CI, intadd_20_n4, intadd_20_n3,
         intadd_20_n2, intadd_21_CI, intadd_21_n3, intadd_21_n2, intadd_21_n1,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43;

  CMPR32X2TS intadd_19_U7 ( .A(in1[1]), .B(in2[1]), .C(intadd_19_CI), .CO(
        intadd_19_n6), .S(res[1]) );
  CMPR32X2TS intadd_19_U6 ( .A(in2[2]), .B(in1[2]), .C(intadd_19_n6), .CO(
        intadd_19_n5), .S(res[2]) );
  CMPR32X2TS intadd_19_U5 ( .A(in2[3]), .B(in1[3]), .C(intadd_19_n5), .CO(
        intadd_19_n4), .S(res[3]) );
  CMPR32X2TS intadd_19_U4 ( .A(in1[4]), .B(in2[4]), .C(intadd_19_n4), .CO(
        intadd_19_n3), .S(res[4]) );
  CMPR32X2TS intadd_19_U3 ( .A(in2[5]), .B(in1[5]), .C(intadd_19_n3), .CO(
        intadd_19_n2), .S(res[5]) );
  CMPR32X2TS intadd_19_U2 ( .A(in2[6]), .B(in1[6]), .C(intadd_19_n2), .CO(
        intadd_19_n1), .S(res[6]) );
  CMPR32X2TS intadd_20_U5 ( .A(in1[12]), .B(in2[12]), .C(intadd_20_CI), .CO(
        intadd_20_n4), .S(res[12]) );
  CMPR32X2TS intadd_20_U4 ( .A(in1[13]), .B(in2[13]), .C(intadd_20_n4), .CO(
        intadd_20_n3), .S(res[13]) );
  CMPR32X2TS intadd_20_U3 ( .A(in1[14]), .B(in2[14]), .C(intadd_20_n3), .CO(
        intadd_20_n2), .S(res[14]) );
  CMPR32X2TS intadd_20_U2 ( .A(in1[15]), .B(in2[15]), .C(intadd_20_n2), .CO(
        res[16]), .S(res[15]) );
  CMPR32X2TS intadd_21_U4 ( .A(in1[8]), .B(in2[8]), .C(intadd_21_CI), .CO(
        intadd_21_n3), .S(res[8]) );
  CMPR32X2TS intadd_21_U3 ( .A(in2[9]), .B(in1[9]), .C(intadd_21_n3), .CO(
        intadd_21_n2), .S(res[9]) );
  CMPR32X2TS intadd_21_U2 ( .A(in2[10]), .B(in1[10]), .C(intadd_21_n2), .CO(
        intadd_21_n1), .S(res[10]) );
  CLKAND2X2TS U40 ( .A(in2[0]), .B(in1[0]), .Y(intadd_19_CI) );
  XOR2XLTS U41 ( .A(intadd_19_n1), .B(n34), .Y(res[7]) );
  XOR2XLTS U42 ( .A(in2[7]), .B(in1[7]), .Y(n34) );
  XOR2XLTS U43 ( .A(intadd_21_n1), .B(n35), .Y(res[11]) );
  XOR2XLTS U44 ( .A(in2[11]), .B(in1[11]), .Y(n35) );
  OAI21XLTS U45 ( .A0(n39), .A1(in1[11]), .B0(in2[11]), .Y(n38) );
  OAI21XLTS U46 ( .A0(n43), .A1(in1[7]), .B0(in2[7]), .Y(n42) );
  AOI2BB1XLTS U47 ( .A0N(in2[0]), .A1N(in1[0]), .B0(intadd_19_CI), .Y(res[0])
         );
  AOI22X1TS U48 ( .A0(in2[9]), .A1(in1[9]), .B0(in1[8]), .B1(in2[8]), .Y(n37)
         );
  OAI22X1TS U49 ( .A0(in2[10]), .A1(in1[10]), .B0(in2[9]), .B1(in1[9]), .Y(n36) );
  OAI2BB2X1TS U50 ( .B0(n37), .B1(n36), .A0N(in2[10]), .A1N(in1[10]), .Y(n39)
         );
  OAI2BB1X1TS U51 ( .A0N(in1[11]), .A1N(n39), .B0(n38), .Y(intadd_20_CI) );
  AOI22X1TS U52 ( .A0(in2[5]), .A1(in1[5]), .B0(in1[4]), .B1(in2[4]), .Y(n41)
         );
  OAI22X1TS U53 ( .A0(in2[6]), .A1(in1[6]), .B0(in2[5]), .B1(in1[5]), .Y(n40)
         );
  OAI2BB2X1TS U54 ( .B0(n41), .B1(n40), .A0N(in2[6]), .A1N(in1[6]), .Y(n43) );
  OAI2BB1X1TS U55 ( .A0N(in1[7]), .A1N(n43), .B0(n42), .Y(intadd_21_CI) );
initial $sdf_annotate("GDA_St_N16_M4_P4_syn.sdf"); 
 endmodule

