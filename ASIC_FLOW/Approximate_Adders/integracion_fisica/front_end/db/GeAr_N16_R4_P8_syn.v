/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:53:27 2016
/////////////////////////////////////////////////////////////


module GeAr_N16_R4_P8 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87;

  AOI21X2TS U2 ( .A0(n56), .A1(n54), .B0(n13), .Y(n72) );
  AOI21X1TS U3 ( .A0(n10), .A1(n76), .B0(n9), .Y(n11) );
  OAI21X2TS U4 ( .A0(n8), .A1(n7), .B0(n6), .Y(n10) );
  OAI21X2TS U5 ( .A0(n31), .A1(n30), .B0(n29), .Y(n40) );
  INVX2TS U6 ( .A(n78), .Y(n9) );
  OAI21XLTS U7 ( .A0(n16), .A1(n20), .B0(n22), .Y(n19) );
  OAI21X2TS U8 ( .A0(n65), .A1(n64), .B0(n63), .Y(n75) );
  XOR2X1TS U9 ( .A(n80), .B(n77), .Y(res[10]) );
  XOR2X1TS U10 ( .A(n72), .B(n71), .Y(res[15]) );
  OAI21X1TS U11 ( .A0(n72), .A1(n68), .B0(n69), .Y(res[16]) );
  OAI21X1TS U12 ( .A0(n80), .A1(n79), .B0(n78), .Y(n85) );
  NOR2X1TS U13 ( .A(n20), .B(n23), .Y(n25) );
  OR2X2TS U14 ( .A(in1[12]), .B(in2[12]), .Y(n34) );
  OR2X2TS U15 ( .A(in1[9]), .B(in2[9]), .Y(n74) );
  OR2X2TS U16 ( .A(in1[5]), .B(in2[5]), .Y(n39) );
  OR2X2TS U17 ( .A(in1[14]), .B(in2[14]), .Y(n54) );
  INVX2TS U18 ( .A(n37), .Y(n38) );
  INVX2TS U19 ( .A(n46), .Y(n59) );
  AOI21X2TS U20 ( .A0(n36), .A1(n34), .B0(n12), .Y(n52) );
  INVX2TS U21 ( .A(n33), .Y(n12) );
  NOR2X1TS U22 ( .A(in1[8]), .B(in2[8]), .Y(n64) );
  INVX2TS U23 ( .A(n66), .Y(n73) );
  INVX2TS U24 ( .A(n64), .Y(n61) );
  INVX2TS U25 ( .A(n57), .Y(n58) );
  INVX2TS U26 ( .A(n79), .Y(n76) );
  INVX2TS U27 ( .A(n53), .Y(n13) );
  OAI21XLTS U28 ( .A0(n46), .A1(n43), .B0(n57), .Y(n2) );
  INVX2TS U29 ( .A(n63), .Y(n5) );
  INVX2TS U30 ( .A(n26), .Y(n16) );
  INVX2TS U31 ( .A(n30), .Y(n27) );
  INVX2TS U32 ( .A(n44), .Y(n41) );
  XOR2XLTS U33 ( .A(n65), .B(n62), .Y(res[8]) );
  NAND2X1TS U34 ( .A(n74), .B(n66), .Y(n67) );
  NAND2X1TS U35 ( .A(n83), .B(n82), .Y(n84) );
  XOR2XLTS U36 ( .A(n52), .B(n51), .Y(res[13]) );
  INVX2TS U37 ( .A(n48), .Y(n50) );
  INVX2TS U38 ( .A(n20), .Y(n14) );
  NOR2X2TS U39 ( .A(in1[2]), .B(in2[2]), .Y(n20) );
  INVX2TS U40 ( .A(n68), .Y(n70) );
  NOR2X1TS U41 ( .A(in1[15]), .B(in2[15]), .Y(n68) );
  AOI21X1TS U42 ( .A0(n4), .A1(n3), .B0(n2), .Y(n8) );
  NOR2X2TS U43 ( .A(in1[6]), .B(in2[6]), .Y(n44) );
  NOR2X1TS U44 ( .A(in1[11]), .B(in2[11]), .Y(n81) );
  NAND2X1TS U45 ( .A(in1[4]), .B(in2[4]), .Y(n29) );
  AFHCINX2TS U46 ( .CIN(n29), .B(in1[5]), .A(in2[5]), .CO(n4) );
  NOR2X2TS U47 ( .A(in1[7]), .B(in2[7]), .Y(n46) );
  NOR2XLTS U48 ( .A(n44), .B(n46), .Y(n3) );
  NAND2X1TS U49 ( .A(in1[6]), .B(in2[6]), .Y(n43) );
  NAND2X1TS U50 ( .A(in1[7]), .B(in2[7]), .Y(n57) );
  NAND2X1TS U51 ( .A(n61), .B(n74), .Y(n7) );
  NAND2X1TS U52 ( .A(in1[8]), .B(in2[8]), .Y(n63) );
  NAND2X1TS U53 ( .A(in1[9]), .B(in2[9]), .Y(n66) );
  AOI21X1TS U54 ( .A0(n74), .A1(n5), .B0(n73), .Y(n6) );
  NOR2X1TS U55 ( .A(in1[10]), .B(in2[10]), .Y(n79) );
  NAND2X1TS U56 ( .A(in1[10]), .B(in2[10]), .Y(n78) );
  NAND2X1TS U57 ( .A(in1[11]), .B(in2[11]), .Y(n82) );
  OAI21X1TS U58 ( .A0(n11), .A1(n81), .B0(n82), .Y(n36) );
  NAND2X1TS U59 ( .A(in1[12]), .B(in2[12]), .Y(n33) );
  NOR2X1TS U60 ( .A(in1[13]), .B(in2[13]), .Y(n48) );
  NAND2X1TS U61 ( .A(in1[13]), .B(in2[13]), .Y(n49) );
  OAI21X4TS U62 ( .A0(n52), .A1(n48), .B0(n49), .Y(n56) );
  NAND2X1TS U63 ( .A(in1[14]), .B(in2[14]), .Y(n53) );
  NAND2X1TS U64 ( .A(in1[15]), .B(in2[15]), .Y(n69) );
  NAND2X1TS U65 ( .A(in1[0]), .B(in2[0]), .Y(n87) );
  NAND2X1TS U66 ( .A(in1[2]), .B(in2[2]), .Y(n22) );
  NAND2X1TS U67 ( .A(n14), .B(n22), .Y(n15) );
  XNOR2X1TS U68 ( .A(n26), .B(n15), .Y(res[2]) );
  NOR2X2TS U69 ( .A(in1[3]), .B(in2[3]), .Y(n23) );
  INVX2TS U70 ( .A(n23), .Y(n17) );
  NAND2X1TS U71 ( .A(in1[3]), .B(in2[3]), .Y(n21) );
  NAND2X1TS U72 ( .A(n17), .B(n21), .Y(n18) );
  XNOR2X1TS U73 ( .A(n19), .B(n18), .Y(res[3]) );
  OAI21X1TS U74 ( .A0(n23), .A1(n22), .B0(n21), .Y(n24) );
  AOI21X2TS U75 ( .A0(n26), .A1(n25), .B0(n24), .Y(n31) );
  NOR2X1TS U76 ( .A(in1[4]), .B(in2[4]), .Y(n30) );
  NAND2X1TS U77 ( .A(n27), .B(n29), .Y(n28) );
  XOR2XLTS U78 ( .A(n31), .B(n28), .Y(res[4]) );
  NAND2X1TS U79 ( .A(in1[5]), .B(in2[5]), .Y(n37) );
  NAND2X1TS U80 ( .A(n39), .B(n37), .Y(n32) );
  XNOR2X1TS U81 ( .A(n40), .B(n32), .Y(res[5]) );
  NAND2X1TS U82 ( .A(n34), .B(n33), .Y(n35) );
  XNOR2X1TS U83 ( .A(n36), .B(n35), .Y(res[12]) );
  AOI21X4TS U84 ( .A0(n40), .A1(n39), .B0(n38), .Y(n45) );
  NAND2X1TS U85 ( .A(n41), .B(n43), .Y(n42) );
  XOR2XLTS U86 ( .A(n45), .B(n42), .Y(res[6]) );
  OAI21X4TS U87 ( .A0(n45), .A1(n44), .B0(n43), .Y(n60) );
  NAND2X1TS U88 ( .A(n59), .B(n57), .Y(n47) );
  XNOR2X1TS U89 ( .A(n60), .B(n47), .Y(res[7]) );
  NAND2X1TS U90 ( .A(n50), .B(n49), .Y(n51) );
  NAND2X1TS U91 ( .A(n54), .B(n53), .Y(n55) );
  XNOR2X1TS U92 ( .A(n56), .B(n55), .Y(res[14]) );
  AOI21X4TS U93 ( .A0(n60), .A1(n59), .B0(n58), .Y(n65) );
  NAND2X1TS U94 ( .A(n61), .B(n63), .Y(n62) );
  XNOR2X1TS U95 ( .A(n75), .B(n67), .Y(res[9]) );
  NAND2X1TS U96 ( .A(n70), .B(n69), .Y(n71) );
  AOI21X1TS U97 ( .A0(n75), .A1(n74), .B0(n73), .Y(n80) );
  NAND2X1TS U98 ( .A(n76), .B(n78), .Y(n77) );
  INVX2TS U99 ( .A(n81), .Y(n83) );
  XNOR2X1TS U100 ( .A(n85), .B(n84), .Y(res[11]) );
  OR2X1TS U101 ( .A(in1[0]), .B(in2[0]), .Y(n86) );
  CLKAND2X2TS U102 ( .A(n86), .B(n87), .Y(res[0]) );
  AFHCINX2TS U103 ( .CIN(n87), .B(in1[1]), .A(in2[1]), .S(res[1]), .CO(n26) );
initial $sdf_annotate("GeAr_N16_R4_P8_syn.sdf"); 
 endmodule

