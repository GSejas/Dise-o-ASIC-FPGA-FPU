/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:56:04 2016
/////////////////////////////////////////////////////////////


module RCA_N16 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94;

  OAI21XLTS U2 ( .A0(n39), .A1(n89), .B0(n40), .Y(n4) );
  OAI21XLTS U3 ( .A0(n15), .A1(n21), .B0(n16), .Y(n2) );
  OAI21XLTS U4 ( .A0(n24), .A1(n20), .B0(n21), .Y(n19) );
  OAI21XLTS U5 ( .A0(n87), .A1(n45), .B0(n84), .Y(n49) );
  XOR2X1TS U6 ( .A(n35), .B(n34), .Y(res[5]) );
  OAI21X1TS U7 ( .A0(n92), .A1(n88), .B0(n89), .Y(n43) );
  XOR2X1TS U8 ( .A(n87), .B(n86), .Y(res[8]) );
  XOR2X1TS U9 ( .A(n92), .B(n91), .Y(res[6]) );
  OAI21X1TS U10 ( .A0(n87), .A1(n51), .B0(n50), .Y(n56) );
  NOR2X1TS U11 ( .A(n51), .B(n52), .Y(n11) );
  XOR2XLTS U12 ( .A(n24), .B(n23), .Y(res[2]) );
  NOR2X1TS U13 ( .A(n20), .B(n15), .Y(n3) );
  OR2X2TS U14 ( .A(in1[12]), .B(in2[12]), .Y(n63) );
  OR2X2TS U15 ( .A(in1[9]), .B(in2[9]), .Y(n47) );
  OR2X2TS U16 ( .A(in1[14]), .B(in2[14]), .Y(n72) );
  NOR2X1TS U17 ( .A(in1[4]), .B(in2[4]), .Y(n26) );
  INVX2TS U18 ( .A(n28), .Y(n29) );
  INVX2TS U19 ( .A(n45), .Y(n85) );
  INVX2TS U20 ( .A(n84), .Y(n9) );
  INVX2TS U21 ( .A(n62), .Y(n12) );
  INVX2TS U22 ( .A(n71), .Y(n13) );
  INVX2TS U23 ( .A(n20), .Y(n22) );
  NAND2X1TS U24 ( .A(n17), .B(n16), .Y(n18) );
  INVX2TS U25 ( .A(n15), .Y(n17) );
  NAND2X1TS U26 ( .A(n30), .B(n28), .Y(n27) );
  INVX2TS U27 ( .A(n88), .Y(n90) );
  NAND2X1TS U28 ( .A(n41), .B(n40), .Y(n42) );
  NAND2X1TS U29 ( .A(n54), .B(n53), .Y(n55) );
  INVX2TS U30 ( .A(n52), .Y(n54) );
  XOR2XLTS U31 ( .A(n61), .B(n60), .Y(res[11]) );
  INVX2TS U32 ( .A(n57), .Y(n59) );
  XOR2XLTS U33 ( .A(n70), .B(n69), .Y(res[13]) );
  INVX2TS U34 ( .A(n66), .Y(n68) );
  INVX2TS U35 ( .A(n31), .Y(n33) );
  NOR2X2TS U36 ( .A(in1[5]), .B(in2[5]), .Y(n31) );
  AOI21X2TS U37 ( .A0(n44), .A1(n11), .B0(n10), .Y(n61) );
  OAI21X1TS U38 ( .A0(n50), .A1(n52), .B0(n53), .Y(n10) );
  INVX2TS U39 ( .A(n75), .Y(n77) );
  NOR2X1TS U40 ( .A(in1[15]), .B(in2[15]), .Y(n75) );
  INVX2TS U41 ( .A(n46), .Y(n8) );
  INVX2TS U42 ( .A(n80), .Y(n82) );
  INVX2TS U43 ( .A(n14), .Y(n24) );
  NOR2X1TS U44 ( .A(in1[1]), .B(in2[1]), .Y(n80) );
  NAND2X1TS U45 ( .A(in1[0]), .B(in2[0]), .Y(n93) );
  NAND2X1TS U46 ( .A(in1[1]), .B(in2[1]), .Y(n81) );
  OAI21X1TS U47 ( .A0(n80), .A1(n93), .B0(n81), .Y(n14) );
  NOR2X2TS U48 ( .A(in1[2]), .B(in2[2]), .Y(n20) );
  NOR2X2TS U49 ( .A(in1[3]), .B(in2[3]), .Y(n15) );
  NAND2X1TS U50 ( .A(in1[2]), .B(in2[2]), .Y(n21) );
  NAND2X1TS U51 ( .A(in1[3]), .B(in2[3]), .Y(n16) );
  AOI21X1TS U52 ( .A0(n14), .A1(n3), .B0(n2), .Y(n25) );
  NOR2X1TS U53 ( .A(n26), .B(n31), .Y(n37) );
  NOR2X2TS U54 ( .A(in1[6]), .B(in2[6]), .Y(n88) );
  NOR2X2TS U55 ( .A(in1[7]), .B(in2[7]), .Y(n39) );
  NOR2X1TS U56 ( .A(n88), .B(n39), .Y(n5) );
  NAND2X1TS U57 ( .A(n37), .B(n5), .Y(n7) );
  NAND2X1TS U58 ( .A(in1[4]), .B(in2[4]), .Y(n28) );
  NAND2X1TS U59 ( .A(in1[5]), .B(in2[5]), .Y(n32) );
  OAI21X1TS U60 ( .A0(n31), .A1(n28), .B0(n32), .Y(n36) );
  NAND2X1TS U61 ( .A(in1[6]), .B(in2[6]), .Y(n89) );
  NAND2X1TS U62 ( .A(in1[7]), .B(in2[7]), .Y(n40) );
  AOI21X1TS U63 ( .A0(n36), .A1(n5), .B0(n4), .Y(n6) );
  OAI21X1TS U64 ( .A0(n25), .A1(n7), .B0(n6), .Y(n44) );
  NOR2X1TS U65 ( .A(in1[8]), .B(in2[8]), .Y(n45) );
  NAND2X1TS U66 ( .A(n85), .B(n47), .Y(n51) );
  NOR2X2TS U67 ( .A(in1[10]), .B(in2[10]), .Y(n52) );
  NAND2X1TS U68 ( .A(in1[8]), .B(in2[8]), .Y(n84) );
  NAND2X1TS U69 ( .A(in1[9]), .B(in2[9]), .Y(n46) );
  AOI21X1TS U70 ( .A0(n47), .A1(n9), .B0(n8), .Y(n50) );
  NAND2X1TS U71 ( .A(in1[10]), .B(in2[10]), .Y(n53) );
  NOR2X1TS U72 ( .A(in1[11]), .B(in2[11]), .Y(n57) );
  NAND2X1TS U73 ( .A(in1[11]), .B(in2[11]), .Y(n58) );
  OAI21X4TS U74 ( .A0(n61), .A1(n57), .B0(n58), .Y(n65) );
  NAND2X1TS U75 ( .A(in1[12]), .B(in2[12]), .Y(n62) );
  AOI21X4TS U76 ( .A0(n65), .A1(n63), .B0(n12), .Y(n70) );
  NOR2X1TS U77 ( .A(in1[13]), .B(in2[13]), .Y(n66) );
  NAND2X1TS U78 ( .A(in1[13]), .B(in2[13]), .Y(n67) );
  OAI21X4TS U79 ( .A0(n70), .A1(n66), .B0(n67), .Y(n74) );
  NAND2X1TS U80 ( .A(in1[14]), .B(in2[14]), .Y(n71) );
  AOI21X4TS U81 ( .A0(n74), .A1(n72), .B0(n13), .Y(n79) );
  NAND2X1TS U82 ( .A(in1[15]), .B(in2[15]), .Y(n76) );
  OAI21X1TS U83 ( .A0(n79), .A1(n75), .B0(n76), .Y(res[16]) );
  XNOR2X1TS U84 ( .A(n19), .B(n18), .Y(res[3]) );
  NAND2X1TS U85 ( .A(n22), .B(n21), .Y(n23) );
  INVX2TS U86 ( .A(n25), .Y(n38) );
  INVX2TS U87 ( .A(n26), .Y(n30) );
  XNOR2X1TS U88 ( .A(n38), .B(n27), .Y(res[4]) );
  AOI21X1TS U89 ( .A0(n38), .A1(n30), .B0(n29), .Y(n35) );
  NAND2X1TS U90 ( .A(n33), .B(n32), .Y(n34) );
  AOI21X1TS U91 ( .A0(n38), .A1(n37), .B0(n36), .Y(n92) );
  INVX2TS U92 ( .A(n39), .Y(n41) );
  XNOR2X1TS U93 ( .A(n43), .B(n42), .Y(res[7]) );
  INVX2TS U94 ( .A(n44), .Y(n87) );
  NAND2X1TS U95 ( .A(n47), .B(n46), .Y(n48) );
  XNOR2X1TS U96 ( .A(n49), .B(n48), .Y(res[9]) );
  XNOR2X1TS U97 ( .A(n56), .B(n55), .Y(res[10]) );
  NAND2X1TS U98 ( .A(n59), .B(n58), .Y(n60) );
  NAND2X1TS U99 ( .A(n63), .B(n62), .Y(n64) );
  XNOR2X1TS U100 ( .A(n65), .B(n64), .Y(res[12]) );
  NAND2X1TS U101 ( .A(n68), .B(n67), .Y(n69) );
  NAND2X1TS U102 ( .A(n72), .B(n71), .Y(n73) );
  XNOR2X1TS U103 ( .A(n74), .B(n73), .Y(res[14]) );
  NAND2X1TS U104 ( .A(n77), .B(n76), .Y(n78) );
  XOR2X1TS U105 ( .A(n79), .B(n78), .Y(res[15]) );
  NAND2X1TS U106 ( .A(n82), .B(n81), .Y(n83) );
  XOR2XLTS U107 ( .A(n83), .B(n93), .Y(res[1]) );
  NAND2X1TS U108 ( .A(n85), .B(n84), .Y(n86) );
  NAND2X1TS U109 ( .A(n90), .B(n89), .Y(n91) );
  OR2X1TS U110 ( .A(in1[0]), .B(in2[0]), .Y(n94) );
  CLKAND2X2TS U111 ( .A(n94), .B(n93), .Y(res[0]) );
initial $sdf_annotate("RCA_N16_syn.sdf"); 
 endmodule

