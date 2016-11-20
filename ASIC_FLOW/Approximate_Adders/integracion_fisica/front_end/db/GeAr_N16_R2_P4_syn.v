/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:53:03 2016
/////////////////////////////////////////////////////////////


module GeAr_N16_R2_P4 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   intadd_26_CI, intadd_26_n4, intadd_26_n3, intadd_26_n2, intadd_26_n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;

  CMPR32X2TS intadd_26_U5 ( .A(in2[1]), .B(in1[1]), .C(intadd_26_CI), .CO(
        intadd_26_n4), .S(res[1]) );
  CMPR32X2TS intadd_26_U4 ( .A(in2[2]), .B(in1[2]), .C(intadd_26_n4), .CO(
        intadd_26_n3), .S(res[2]) );
  CMPR32X2TS intadd_26_U3 ( .A(in2[3]), .B(in1[3]), .C(intadd_26_n3), .CO(
        intadd_26_n2), .S(res[3]) );
  CMPR32X2TS intadd_26_U2 ( .A(in2[4]), .B(in1[4]), .C(intadd_26_n2), .CO(
        intadd_26_n1), .S(res[4]) );
  OAI21XLTS U2 ( .A0(n8), .A1(n7), .B0(intadd_26_n1), .Y(n5) );
  OAI21XLTS U3 ( .A0(n26), .A1(n25), .B0(n34), .Y(n32) );
  ADDFX1TS U4 ( .A(in2[15]), .B(in1[15]), .CI(n3), .CO(res[16]), .S(res[15])
         );
  OAI21X1TS U5 ( .A0(n29), .A1(n33), .B0(n28), .Y(n27) );
  OAI21X1TS U6 ( .A0(n23), .A1(n22), .B0(n20), .Y(n19) );
  OAI21X1TS U7 ( .A0(n15), .A1(n14), .B0(n13), .Y(n12) );
  ADDFX1TS U8 ( .A(in2[14]), .B(in1[14]), .CI(n4), .CO(n3), .S(res[14]) );
  OAI21X1TS U9 ( .A0(n18), .A1(n17), .B0(n26), .Y(n31) );
  OAI21X1TS U10 ( .A0(n11), .A1(n10), .B0(n18), .Y(n30) );
  OAI31X2TS U11 ( .A0(n33), .A1(n36), .A2(n35), .B0(n21), .Y(n37) );
  NOR2X2TS U12 ( .A(in2[5]), .B(in1[5]), .Y(n7) );
  CLKAND2X2TS U13 ( .A(in2[5]), .B(in1[5]), .Y(n8) );
  NOR2X2TS U14 ( .A(in2[7]), .B(in1[7]), .Y(n14) );
  CLKAND2X2TS U15 ( .A(in2[7]), .B(in1[7]), .Y(n15) );
  NOR2X2TS U16 ( .A(in2[9]), .B(in1[9]), .Y(n22) );
  CLKAND2X2TS U17 ( .A(in2[9]), .B(in1[9]), .Y(n23) );
  INVX2TS U18 ( .A(in1[10]), .Y(n35) );
  INVX2TS U19 ( .A(in2[10]), .Y(n36) );
  NOR2X2TS U20 ( .A(in2[11]), .B(in1[11]), .Y(n33) );
  CLKAND2X2TS U21 ( .A(in2[0]), .B(in1[0]), .Y(intadd_26_CI) );
  AO22XLTS U22 ( .A0(in2[3]), .A1(in1[3]), .B0(in1[2]), .B1(in2[2]), .Y(n6) );
  INVX2TS U23 ( .A(n7), .Y(n9) );
  INVX2TS U24 ( .A(n14), .Y(n16) );
  INVX2TS U25 ( .A(n22), .Y(n24) );
  OAI31X1TS U26 ( .A0(n8), .A1(intadd_26_n1), .A2(n7), .B0(n5), .Y(res[5]) );
  OAI31X1TS U27 ( .A0(n15), .A1(n13), .A2(n14), .B0(n12), .Y(res[7]) );
  OAI31X1TS U28 ( .A0(n23), .A1(n20), .A2(n22), .B0(n19), .Y(res[9]) );
  OAI31X1TS U29 ( .A0(n29), .A1(n28), .A2(n33), .B0(n27), .Y(res[11]) );
  XOR2XLTS U30 ( .A(n42), .B(n41), .Y(res[13]) );
  OAI2BB2XLTS U31 ( .B0(n39), .B1(n2), .A0N(in2[13]), .A1N(in1[13]), .Y(n4) );
  OR2X1TS U32 ( .A(n38), .B(n37), .Y(n40) );
  AOI222X1TS U33 ( .A0(in2[12]), .A1(in1[12]), .B0(in2[12]), .B1(n37), .C0(
        in1[12]), .C1(n37), .Y(n2) );
  INVX2TS U34 ( .A(n21), .Y(n29) );
  NOR2X1TS U35 ( .A(in2[13]), .B(in1[13]), .Y(n39) );
  NAND2X1TS U36 ( .A(in2[11]), .B(in1[11]), .Y(n21) );
  OAI21XLTS U37 ( .A0(in2[3]), .A1(in1[3]), .B0(n6), .Y(n11) );
  OAI22X1TS U38 ( .A0(in2[5]), .A1(in1[5]), .B0(in2[4]), .B1(in1[4]), .Y(n10)
         );
  AOI31X1TS U39 ( .A0(in2[4]), .A1(in1[4]), .A2(n9), .B0(n8), .Y(n18) );
  OAI22X1TS U40 ( .A0(in2[7]), .A1(in1[7]), .B0(in2[6]), .B1(in1[6]), .Y(n17)
         );
  AOI31X1TS U41 ( .A0(in2[6]), .A1(in1[6]), .A2(n16), .B0(n15), .Y(n26) );
  OAI22X1TS U42 ( .A0(in2[9]), .A1(in1[9]), .B0(in2[8]), .B1(in1[8]), .Y(n25)
         );
  AOI31X1TS U43 ( .A0(in2[8]), .A1(in1[8]), .A2(n24), .B0(n23), .Y(n34) );
  AOI2BB1XLTS U44 ( .A0N(in2[0]), .A1N(in1[0]), .B0(intadd_26_CI), .Y(res[0])
         );
  CMPR32X2TS U45 ( .A(in2[6]), .B(in1[6]), .C(n30), .CO(n13), .S(res[6]) );
  CMPR32X2TS U46 ( .A(in2[8]), .B(in1[8]), .C(n31), .CO(n20), .S(res[8]) );
  CMPR32X2TS U47 ( .A(in2[10]), .B(in1[10]), .C(n32), .CO(n28), .S(res[10]) );
  AOI211XLTS U48 ( .A0(n36), .A1(n35), .B0(n34), .C0(n33), .Y(n38) );
  AOI21X1TS U49 ( .A0(in1[13]), .A1(in2[13]), .B0(n39), .Y(n42) );
  CMPR32X2TS U50 ( .A(in2[12]), .B(in1[12]), .C(n40), .CO(n41), .S(res[12]) );
initial $sdf_annotate("GeAr_N16_R2_P4_syn.sdf"); 
 endmodule

