/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:56:16 2016
/////////////////////////////////////////////////////////////


module RCA_N20 ( in1, in2, res );
  input [19:0] in1;
  input [19:0] in2;
  output [20:0] res;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128;

  OAI21X2TS U2 ( .A0(n104), .A1(n100), .B0(n101), .Y(n108) );
  OAI21XLTS U3 ( .A0(n77), .A1(n73), .B0(n78), .Y(n8) );
  OAI21X2TS U4 ( .A0(n38), .A1(n7), .B0(n6), .Y(n22) );
  OAI21XLTS U5 ( .A0(n37), .A1(n33), .B0(n34), .Y(n32) );
  OAI21XLTS U6 ( .A0(n126), .A1(n122), .B0(n123), .Y(n56) );
  OAI21X1TS U7 ( .A0(n21), .A1(n20), .B0(n19), .Y(res[20]) );
  XOR2X1TS U8 ( .A(n86), .B(n26), .Y(res[12]) );
  XOR2X1TS U9 ( .A(n99), .B(n98), .Y(res[13]) );
  XOR2X1TS U10 ( .A(n81), .B(n80), .Y(res[11]) );
  XOR2X1TS U11 ( .A(n113), .B(n112), .Y(res[17]) );
  XOR2X1TS U12 ( .A(n126), .B(n125), .Y(res[6]) );
  XOR2XLTS U13 ( .A(n70), .B(n58), .Y(res[8]) );
  XOR2XLTS U14 ( .A(n48), .B(n47), .Y(res[5]) );
  XOR2XLTS U15 ( .A(n104), .B(n103), .Y(res[15]) );
  OAI21X1TS U16 ( .A0(n70), .A1(n60), .B0(n59), .Y(n65) );
  XOR2XLTS U17 ( .A(n37), .B(n36), .Y(res[2]) );
  NOR2X1TS U18 ( .A(n24), .B(n12), .Y(n14) );
  XOR2XLTS U19 ( .A(n121), .B(n127), .Y(res[1]) );
  OAI21X1TS U20 ( .A0(n52), .A1(n123), .B0(n53), .Y(n4) );
  OR2X2TS U21 ( .A(in1[18]), .B(in2[18]), .Y(n115) );
  OR2X2TS U22 ( .A(in1[14]), .B(in2[14]), .Y(n88) );
  OR2X2TS U23 ( .A(in1[16]), .B(in2[16]), .Y(n106) );
  NAND2X2TS U24 ( .A(in1[8]), .B(in2[8]), .Y(n59) );
  AOI21X4TS U25 ( .A0(n22), .A1(n14), .B0(n13), .Y(n104) );
  OAI21X4TS U26 ( .A0(n113), .A1(n109), .B0(n110), .Y(n117) );
  AOI21X4TS U27 ( .A0(n108), .A1(n106), .B0(n15), .Y(n113) );
  OAI21X1TS U28 ( .A0(n23), .A1(n12), .B0(n11), .Y(n13) );
  NOR2X1TS U29 ( .A(in1[4]), .B(in2[4]), .Y(n39) );
  NOR2X2TS U30 ( .A(in1[11]), .B(in2[11]), .Y(n77) );
  INVX2TS U31 ( .A(n71), .Y(n75) );
  INVX2TS U32 ( .A(n66), .Y(n69) );
  INVX2TS U33 ( .A(n67), .Y(n68) );
  INVX2TS U34 ( .A(n25), .Y(n93) );
  INVX2TS U35 ( .A(n91), .Y(n92) );
  INVX2TS U36 ( .A(n83), .Y(n84) );
  INVX2TS U37 ( .A(n105), .Y(n15) );
  AOI21X1TS U38 ( .A0(n117), .A1(n115), .B0(n16), .Y(n21) );
  INVX2TS U39 ( .A(n114), .Y(n16) );
  INVX2TS U40 ( .A(n41), .Y(n42) );
  INVX2TS U41 ( .A(n33), .Y(n35) );
  NAND2X1TS U42 ( .A(n30), .B(n29), .Y(n31) );
  INVX2TS U43 ( .A(n28), .Y(n30) );
  NAND2X1TS U44 ( .A(n43), .B(n41), .Y(n40) );
  INVX2TS U45 ( .A(n122), .Y(n124) );
  INVX2TS U46 ( .A(n60), .Y(n57) );
  NAND2X1TS U47 ( .A(n63), .B(n62), .Y(n64) );
  INVX2TS U48 ( .A(n77), .Y(n79) );
  INVX2TS U49 ( .A(n95), .Y(n97) );
  INVX2TS U50 ( .A(n82), .Y(n85) );
  INVX2TS U51 ( .A(n100), .Y(n102) );
  INVX2TS U52 ( .A(n109), .Y(n111) );
  XOR2X1TS U53 ( .A(n21), .B(n18), .Y(res[19]) );
  INVX2TS U54 ( .A(n44), .Y(n46) );
  OAI21X1TS U55 ( .A0(n44), .A1(n41), .B0(n45), .Y(n49) );
  NOR2X2TS U56 ( .A(in1[5]), .B(in2[5]), .Y(n44) );
  INVX2TS U57 ( .A(n20), .Y(n17) );
  NOR2X1TS U58 ( .A(in1[19]), .B(in2[19]), .Y(n20) );
  OAI21X1TS U59 ( .A0(n95), .A1(n91), .B0(n96), .Y(n83) );
  NOR2X2TS U60 ( .A(in1[13]), .B(in2[13]), .Y(n95) );
  INVX2TS U61 ( .A(n87), .Y(n10) );
  OAI21X1TS U62 ( .A0(n61), .A1(n59), .B0(n62), .Y(n67) );
  INVX2TS U63 ( .A(n118), .Y(n120) );
  INVX2TS U64 ( .A(n73), .Y(n74) );
  INVX2TS U65 ( .A(n27), .Y(n37) );
  NAND2X1TS U66 ( .A(n54), .B(n53), .Y(n55) );
  NOR2X1TS U67 ( .A(in1[1]), .B(in2[1]), .Y(n118) );
  NAND2X1TS U68 ( .A(in1[0]), .B(in2[0]), .Y(n127) );
  NAND2X1TS U69 ( .A(in1[1]), .B(in2[1]), .Y(n119) );
  OAI21X1TS U70 ( .A0(n118), .A1(n127), .B0(n119), .Y(n27) );
  NOR2X2TS U71 ( .A(in1[2]), .B(in2[2]), .Y(n33) );
  NOR2X2TS U72 ( .A(in1[3]), .B(in2[3]), .Y(n28) );
  NOR2X1TS U73 ( .A(n33), .B(n28), .Y(n3) );
  NAND2X1TS U74 ( .A(in1[2]), .B(in2[2]), .Y(n34) );
  NAND2X1TS U75 ( .A(in1[3]), .B(in2[3]), .Y(n29) );
  OAI21X1TS U76 ( .A0(n28), .A1(n34), .B0(n29), .Y(n2) );
  AOI21X2TS U77 ( .A0(n27), .A1(n3), .B0(n2), .Y(n38) );
  NOR2X1TS U78 ( .A(n39), .B(n44), .Y(n50) );
  NOR2X2TS U79 ( .A(in1[6]), .B(in2[6]), .Y(n122) );
  NOR2X2TS U80 ( .A(in1[7]), .B(in2[7]), .Y(n52) );
  NOR2X1TS U81 ( .A(n122), .B(n52), .Y(n5) );
  NAND2X1TS U82 ( .A(n50), .B(n5), .Y(n7) );
  NAND2X1TS U83 ( .A(in1[4]), .B(in2[4]), .Y(n41) );
  NAND2X1TS U84 ( .A(in1[5]), .B(in2[5]), .Y(n45) );
  NAND2X1TS U85 ( .A(in1[6]), .B(in2[6]), .Y(n123) );
  NAND2X1TS U86 ( .A(in1[7]), .B(in2[7]), .Y(n53) );
  AOI21X1TS U87 ( .A0(n49), .A1(n5), .B0(n4), .Y(n6) );
  NOR2X2TS U88 ( .A(in1[8]), .B(in2[8]), .Y(n60) );
  NOR2X2TS U89 ( .A(in1[9]), .B(in2[9]), .Y(n61) );
  NOR2X1TS U90 ( .A(n60), .B(n61), .Y(n66) );
  NOR2X1TS U91 ( .A(in1[10]), .B(in2[10]), .Y(n71) );
  NOR2X1TS U92 ( .A(n71), .B(n77), .Y(n9) );
  NAND2X1TS U93 ( .A(n66), .B(n9), .Y(n24) );
  NOR2X1TS U94 ( .A(in1[12]), .B(in2[12]), .Y(n25) );
  NOR2X1TS U95 ( .A(n25), .B(n95), .Y(n82) );
  NAND2X1TS U96 ( .A(n82), .B(n88), .Y(n12) );
  NAND2X1TS U97 ( .A(in1[9]), .B(in2[9]), .Y(n62) );
  NAND2X1TS U98 ( .A(in1[10]), .B(in2[10]), .Y(n73) );
  NAND2X1TS U99 ( .A(in1[11]), .B(in2[11]), .Y(n78) );
  AOI21X1TS U100 ( .A0(n67), .A1(n9), .B0(n8), .Y(n23) );
  NAND2X1TS U101 ( .A(in1[12]), .B(in2[12]), .Y(n91) );
  NAND2X1TS U102 ( .A(in1[13]), .B(in2[13]), .Y(n96) );
  NAND2X1TS U103 ( .A(in1[14]), .B(in2[14]), .Y(n87) );
  AOI21X1TS U104 ( .A0(n83), .A1(n88), .B0(n10), .Y(n11) );
  NOR2X1TS U105 ( .A(in1[15]), .B(in2[15]), .Y(n100) );
  NAND2X1TS U106 ( .A(in1[15]), .B(in2[15]), .Y(n101) );
  NAND2X1TS U107 ( .A(in1[16]), .B(in2[16]), .Y(n105) );
  NOR2X1TS U108 ( .A(in1[17]), .B(in2[17]), .Y(n109) );
  NAND2X1TS U109 ( .A(in1[17]), .B(in2[17]), .Y(n110) );
  NAND2X1TS U110 ( .A(in1[18]), .B(in2[18]), .Y(n114) );
  NAND2X1TS U111 ( .A(in1[19]), .B(in2[19]), .Y(n19) );
  NAND2X1TS U112 ( .A(n17), .B(n19), .Y(n18) );
  INVX2TS U113 ( .A(n22), .Y(n70) );
  OAI21X1TS U114 ( .A0(n70), .A1(n24), .B0(n23), .Y(n94) );
  INVX2TS U115 ( .A(n94), .Y(n86) );
  NAND2X1TS U116 ( .A(n93), .B(n91), .Y(n26) );
  XNOR2X1TS U117 ( .A(n32), .B(n31), .Y(res[3]) );
  NAND2X1TS U118 ( .A(n35), .B(n34), .Y(n36) );
  INVX2TS U119 ( .A(n38), .Y(n51) );
  INVX2TS U120 ( .A(n39), .Y(n43) );
  XNOR2X1TS U121 ( .A(n51), .B(n40), .Y(res[4]) );
  AOI21X1TS U122 ( .A0(n51), .A1(n43), .B0(n42), .Y(n48) );
  NAND2X1TS U123 ( .A(n46), .B(n45), .Y(n47) );
  AOI21X1TS U124 ( .A0(n51), .A1(n50), .B0(n49), .Y(n126) );
  INVX2TS U125 ( .A(n52), .Y(n54) );
  XNOR2X1TS U126 ( .A(n56), .B(n55), .Y(res[7]) );
  NAND2X1TS U127 ( .A(n57), .B(n59), .Y(n58) );
  INVX2TS U128 ( .A(n61), .Y(n63) );
  XNOR2X1TS U129 ( .A(n65), .B(n64), .Y(res[9]) );
  OAI21X1TS U130 ( .A0(n70), .A1(n69), .B0(n68), .Y(n76) );
  NAND2X1TS U131 ( .A(n75), .B(n73), .Y(n72) );
  XNOR2X1TS U132 ( .A(n76), .B(n72), .Y(res[10]) );
  AOI21X1TS U133 ( .A0(n76), .A1(n75), .B0(n74), .Y(n81) );
  NAND2X1TS U134 ( .A(n79), .B(n78), .Y(n80) );
  OAI21X1TS U135 ( .A0(n86), .A1(n85), .B0(n84), .Y(n90) );
  NAND2X1TS U136 ( .A(n88), .B(n87), .Y(n89) );
  XNOR2X1TS U137 ( .A(n90), .B(n89), .Y(res[14]) );
  AOI21X1TS U138 ( .A0(n94), .A1(n93), .B0(n92), .Y(n99) );
  NAND2X1TS U139 ( .A(n97), .B(n96), .Y(n98) );
  NAND2X1TS U140 ( .A(n102), .B(n101), .Y(n103) );
  NAND2X1TS U141 ( .A(n106), .B(n105), .Y(n107) );
  XNOR2X1TS U142 ( .A(n108), .B(n107), .Y(res[16]) );
  NAND2X1TS U143 ( .A(n111), .B(n110), .Y(n112) );
  NAND2X1TS U144 ( .A(n115), .B(n114), .Y(n116) );
  XNOR2X1TS U145 ( .A(n117), .B(n116), .Y(res[18]) );
  NAND2X1TS U146 ( .A(n120), .B(n119), .Y(n121) );
  NAND2X1TS U147 ( .A(n124), .B(n123), .Y(n125) );
  OR2X1TS U148 ( .A(in1[0]), .B(in2[0]), .Y(n128) );
  CLKAND2X2TS U149 ( .A(n128), .B(n127), .Y(res[0]) );
initial $sdf_annotate("RCA_N20_syn.sdf"); 
 endmodule

