/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:20:53 2016
/////////////////////////////////////////////////////////////


module ACA_II_N32_Q16 ( in1, in2, res );
  input [31:0] in1;
  input [31:0] in2;
  output [32:0] res;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202;

  OAI21X2TS U2 ( .A0(n177), .A1(n173), .B0(n174), .Y(n167) );
  AOI21X2TS U3 ( .A0(n117), .A1(n116), .B0(n115), .Y(n122) );
  NAND2X1TS U4 ( .A(in1[9]), .B(in2[9]), .Y(n79) );
  OAI21XLTS U5 ( .A0(n72), .A1(n197), .B0(n71), .Y(n73) );
  NOR2XLTS U6 ( .A(n23), .B(n26), .Y(n28) );
  INVX2TS U7 ( .A(n178), .Y(n180) );
  NAND2X1TS U8 ( .A(in1[8]), .B(in2[8]), .Y(n192) );
  NOR2XLTS U9 ( .A(n182), .B(n83), .Y(n85) );
  OAI21XLTS U10 ( .A0(n22), .A1(n23), .B0(n25), .Y(n19) );
  OAI21XLTS U11 ( .A0(n190), .A1(n52), .B0(n187), .Y(n56) );
  OAI21X2TS U12 ( .A0(n178), .A1(n201), .B0(n179), .Y(n29) );
  XOR2X1TS U13 ( .A(n129), .B(n128), .Y(res[29]) );
  NOR2X2TS U14 ( .A(in1[9]), .B(in2[9]), .Y(n99) );
  XNOR2X1TS U15 ( .A(n153), .B(n152), .Y(res[23]) );
  XOR2X1TS U16 ( .A(n158), .B(n157), .Y(res[22]) );
  OAI21X1TS U17 ( .A0(n172), .A1(n168), .B0(n169), .Y(res[32]) );
  OAI21X2TS U18 ( .A0(n158), .A1(n154), .B0(n155), .Y(n153) );
  XOR2X1TS U19 ( .A(n122), .B(n119), .Y(res[20]) );
  OAI21X2TS U20 ( .A0(n129), .A1(n125), .B0(n126), .Y(n144) );
  XOR2XLTS U21 ( .A(n195), .B(n194), .Y(res[8]) );
  OAI21X2TS U22 ( .A0(n98), .A1(n94), .B0(n95), .Y(n113) );
  XOR2XLTS U23 ( .A(n91), .B(n88), .Y(res[18]) );
  OAI21X1TS U24 ( .A0(n195), .A1(n191), .B0(n192), .Y(n82) );
  XOR2XLTS U25 ( .A(n98), .B(n97), .Y(res[27]) );
  XOR2XLTS U26 ( .A(n190), .B(n189), .Y(res[24]) );
  OAI21X2TS U27 ( .A0(n91), .A1(n90), .B0(n89), .Y(n117) );
  OAI21X1TS U28 ( .A0(n200), .A1(n196), .B0(n197), .Y(n69) );
  OAI21X1TS U29 ( .A0(n186), .A1(n182), .B0(n183), .Y(n43) );
  XOR2XLTS U30 ( .A(n200), .B(n199), .Y(res[6]) );
  XOR2XLTS U31 ( .A(n61), .B(n60), .Y(res[5]) );
  OAI21X1TS U32 ( .A0(n190), .A1(n46), .B0(n45), .Y(n51) );
  XOR2XLTS U33 ( .A(n186), .B(n185), .Y(res[16]) );
  AOI21X2TS U34 ( .A0(n44), .A1(n14), .B0(n13), .Y(n98) );
  AOI21X2TS U35 ( .A0(n86), .A1(n85), .B0(n84), .Y(n91) );
  XOR2XLTS U36 ( .A(n22), .B(n21), .Y(res[2]) );
  OAI21X2TS U37 ( .A0(n99), .A1(n192), .B0(n79), .Y(n100) );
  OAI21X1TS U38 ( .A0(n163), .A1(n174), .B0(n164), .Y(n34) );
  NOR2X1TS U39 ( .A(n137), .B(n139), .Y(n33) );
  INVX2TS U40 ( .A(n141), .Y(n16) );
  INVX2TS U41 ( .A(n108), .Y(n132) );
  INVX2TS U42 ( .A(n173), .Y(n175) );
  INVX2TS U43 ( .A(n163), .Y(n165) );
  OAI21X1TS U44 ( .A0(n149), .A1(n155), .B0(n150), .Y(n5) );
  OAI21X1TS U45 ( .A0(n123), .A1(n120), .B0(n145), .Y(n7) );
  NOR2X1TS U46 ( .A(n121), .B(n123), .Y(n4) );
  OR2X2TS U47 ( .A(in1[25]), .B(in2[25]), .Y(n54) );
  OR2X2TS U48 ( .A(in1[28]), .B(in2[28]), .Y(n111) );
  OR2X2TS U49 ( .A(in1[30]), .B(in2[30]), .Y(n142) );
  NAND2X2TS U50 ( .A(in1[10]), .B(in2[10]), .Y(n105) );
  OAI21X4TS U51 ( .A0(n122), .A1(n121), .B0(n120), .Y(n148) );
  NOR2X1TS U52 ( .A(in1[4]), .B(in2[4]), .Y(n62) );
  NOR2X1TS U53 ( .A(n196), .B(n72), .Y(n74) );
  AOI21X1TS U54 ( .A0(n84), .A1(n3), .B0(n2), .Y(n10) );
  NOR2X2TS U55 ( .A(in1[3]), .B(in2[3]), .Y(n26) );
  INVX2TS U56 ( .A(n29), .Y(n22) );
  INVX2TS U57 ( .A(n62), .Y(n58) );
  INVX2TS U58 ( .A(n78), .Y(n66) );
  NOR2X2TS U59 ( .A(in1[7]), .B(in2[7]), .Y(n72) );
  INVX2TS U60 ( .A(n102), .Y(n195) );
  INVX2TS U61 ( .A(n130), .Y(n131) );
  INVX2TS U62 ( .A(n139), .Y(n161) );
  INVX2TS U63 ( .A(n86), .Y(n186) );
  INVX2TS U64 ( .A(n114), .Y(n115) );
  INVX2TS U65 ( .A(n123), .Y(n147) );
  AOI21X2TS U66 ( .A0(n148), .A1(n147), .B0(n146), .Y(n158) );
  INVX2TS U67 ( .A(n145), .Y(n146) );
  INVX2TS U68 ( .A(n52), .Y(n188) );
  INVX2TS U69 ( .A(n187), .Y(n12) );
  INVX2TS U70 ( .A(n44), .Y(n190) );
  INVX2TS U71 ( .A(n110), .Y(n15) );
  NOR2X1TS U72 ( .A(n173), .B(n163), .Y(n35) );
  INVX2TS U73 ( .A(n64), .Y(n57) );
  NOR2X2TS U74 ( .A(in1[14]), .B(in2[14]), .Y(n173) );
  INVX2TS U75 ( .A(n159), .Y(n160) );
  NOR2X1TS U76 ( .A(in1[24]), .B(in2[24]), .Y(n52) );
  INVX2TS U77 ( .A(n23), .Y(n20) );
  INVX2TS U78 ( .A(n26), .Y(n17) );
  NAND2X1TS U79 ( .A(n58), .B(n64), .Y(n30) );
  INVX2TS U80 ( .A(n196), .Y(n198) );
  INVX2TS U81 ( .A(n72), .Y(n67) );
  INVX2TS U82 ( .A(n191), .Y(n193) );
  XOR2XLTS U83 ( .A(n107), .B(n104), .Y(res[10]) );
  INVX2TS U84 ( .A(n106), .Y(n103) );
  XOR2XLTS U85 ( .A(n138), .B(n135), .Y(res[12]) );
  INVX2TS U86 ( .A(n182), .Y(n184) );
  INVX2TS U87 ( .A(n83), .Y(n41) );
  INVX2TS U88 ( .A(n154), .Y(n156) );
  NAND2X1TS U89 ( .A(n49), .B(n48), .Y(n50) );
  INVX2TS U90 ( .A(n94), .Y(n96) );
  INVX2TS U91 ( .A(n125), .Y(n127) );
  AOI21X1TS U92 ( .A0(n133), .A1(n132), .B0(n131), .Y(n138) );
  OAI21X2TS U93 ( .A0(n78), .A1(n77), .B0(n76), .Y(n102) );
  NOR2X2TS U94 ( .A(in1[21]), .B(in2[21]), .Y(n123) );
  NOR2X2TS U95 ( .A(in1[13]), .B(in2[13]), .Y(n139) );
  NOR2X2TS U96 ( .A(in1[11]), .B(in2[11]), .Y(n108) );
  INVX2TS U97 ( .A(n92), .Y(n116) );
  NOR2X2TS U98 ( .A(in1[19]), .B(in2[19]), .Y(n92) );
  INVX2TS U99 ( .A(n65), .Y(n59) );
  NOR2X2TS U100 ( .A(in1[5]), .B(in2[5]), .Y(n65) );
  NOR2X1TS U101 ( .A(n46), .B(n47), .Y(n14) );
  NOR2X2TS U102 ( .A(in1[16]), .B(in2[16]), .Y(n182) );
  NOR2X1TS U103 ( .A(n191), .B(n99), .Y(n101) );
  NOR2X2TS U104 ( .A(in1[8]), .B(in2[8]), .Y(n191) );
  INVX2TS U105 ( .A(n121), .Y(n118) );
  NOR2X2TS U106 ( .A(in1[20]), .B(in2[20]), .Y(n121) );
  INVX2TS U107 ( .A(n90), .Y(n87) );
  NOR2X1TS U108 ( .A(n90), .B(n92), .Y(n3) );
  NOR2X2TS U109 ( .A(in1[18]), .B(in2[18]), .Y(n90) );
  OAI21X2TS U110 ( .A0(n138), .A1(n137), .B0(n136), .Y(n162) );
  INVX2TS U111 ( .A(n137), .Y(n134) );
  NOR2X2TS U112 ( .A(in1[12]), .B(in2[12]), .Y(n137) );
  INVX2TS U113 ( .A(n168), .Y(n170) );
  NOR2X1TS U114 ( .A(in1[31]), .B(in2[31]), .Y(n168) );
  AOI21X2TS U115 ( .A0(n29), .A1(n28), .B0(n27), .Y(n78) );
  OAI21X1TS U116 ( .A0(n45), .A1(n47), .B0(n48), .Y(n13) );
  INVX2TS U117 ( .A(n53), .Y(n11) );
  INVX2TS U118 ( .A(n99), .Y(n80) );
  INVX2TS U119 ( .A(n149), .Y(n151) );
  OAI21X2TS U120 ( .A0(n10), .A1(n9), .B0(n8), .Y(n44) );
  NAND2X1TS U121 ( .A(n17), .B(n24), .Y(n18) );
  NOR2X2TS U122 ( .A(in1[17]), .B(in2[17]), .Y(n83) );
  NAND2X1TS U123 ( .A(in1[16]), .B(in2[16]), .Y(n183) );
  NAND2X1TS U124 ( .A(in1[17]), .B(in2[17]), .Y(n40) );
  OAI21X2TS U125 ( .A0(n83), .A1(n183), .B0(n40), .Y(n84) );
  NAND2X1TS U126 ( .A(in1[18]), .B(in2[18]), .Y(n89) );
  NAND2X1TS U127 ( .A(in1[19]), .B(in2[19]), .Y(n114) );
  OAI21X1TS U128 ( .A0(n92), .A1(n89), .B0(n114), .Y(n2) );
  NOR2X2TS U129 ( .A(in1[22]), .B(in2[22]), .Y(n154) );
  NOR2X2TS U130 ( .A(in1[23]), .B(in2[23]), .Y(n149) );
  NOR2X1TS U131 ( .A(n154), .B(n149), .Y(n6) );
  NAND2X1TS U132 ( .A(n4), .B(n6), .Y(n9) );
  NAND2X1TS U133 ( .A(in1[20]), .B(in2[20]), .Y(n120) );
  NAND2X1TS U134 ( .A(in1[21]), .B(in2[21]), .Y(n145) );
  NAND2X1TS U135 ( .A(in1[22]), .B(in2[22]), .Y(n155) );
  NAND2X1TS U136 ( .A(in1[23]), .B(in2[23]), .Y(n150) );
  AOI21X1TS U137 ( .A0(n7), .A1(n6), .B0(n5), .Y(n8) );
  NAND2X1TS U138 ( .A(n188), .B(n54), .Y(n46) );
  NOR2X2TS U139 ( .A(in1[26]), .B(in2[26]), .Y(n47) );
  NAND2X1TS U140 ( .A(in1[24]), .B(in2[24]), .Y(n187) );
  NAND2X1TS U141 ( .A(in1[25]), .B(in2[25]), .Y(n53) );
  AOI21X1TS U142 ( .A0(n54), .A1(n12), .B0(n11), .Y(n45) );
  NAND2X1TS U143 ( .A(in1[26]), .B(in2[26]), .Y(n48) );
  NOR2X1TS U144 ( .A(in1[27]), .B(in2[27]), .Y(n94) );
  NAND2X1TS U145 ( .A(in1[27]), .B(in2[27]), .Y(n95) );
  NAND2X1TS U146 ( .A(in1[28]), .B(in2[28]), .Y(n110) );
  AOI21X1TS U147 ( .A0(n113), .A1(n111), .B0(n15), .Y(n129) );
  NOR2X1TS U148 ( .A(in1[29]), .B(in2[29]), .Y(n125) );
  NAND2X1TS U149 ( .A(in1[29]), .B(in2[29]), .Y(n126) );
  NAND2X1TS U150 ( .A(in1[30]), .B(in2[30]), .Y(n141) );
  AOI21X4TS U151 ( .A0(n144), .A1(n142), .B0(n16), .Y(n172) );
  NAND2X1TS U152 ( .A(in1[31]), .B(in2[31]), .Y(n169) );
  NOR2X1TS U153 ( .A(in1[1]), .B(in2[1]), .Y(n178) );
  NAND2X1TS U154 ( .A(in1[0]), .B(in2[0]), .Y(n201) );
  NAND2X1TS U155 ( .A(in1[1]), .B(in2[1]), .Y(n179) );
  NOR2X2TS U156 ( .A(in1[2]), .B(in2[2]), .Y(n23) );
  NAND2X1TS U157 ( .A(in1[2]), .B(in2[2]), .Y(n25) );
  NAND2X1TS U158 ( .A(in1[3]), .B(in2[3]), .Y(n24) );
  XNOR2X1TS U159 ( .A(n19), .B(n18), .Y(res[3]) );
  NAND2X1TS U160 ( .A(n20), .B(n25), .Y(n21) );
  OAI21X1TS U161 ( .A0(n26), .A1(n25), .B0(n24), .Y(n27) );
  NAND2X1TS U162 ( .A(in1[4]), .B(in2[4]), .Y(n64) );
  XNOR2X1TS U163 ( .A(n66), .B(n30), .Y(res[4]) );
  NOR2X2TS U164 ( .A(in1[10]), .B(in2[10]), .Y(n106) );
  NOR2XLTS U165 ( .A(n106), .B(n108), .Y(n32) );
  NAND2X1TS U166 ( .A(in1[11]), .B(in2[11]), .Y(n130) );
  OAI21XLTS U167 ( .A0(n108), .A1(n105), .B0(n130), .Y(n31) );
  AOI21X1TS U168 ( .A0(n100), .A1(n32), .B0(n31), .Y(n39) );
  NOR2X2TS U169 ( .A(in1[15]), .B(in2[15]), .Y(n163) );
  NAND2X1TS U170 ( .A(n33), .B(n35), .Y(n38) );
  NAND2X1TS U171 ( .A(in1[12]), .B(in2[12]), .Y(n136) );
  NAND2X1TS U172 ( .A(in1[13]), .B(in2[13]), .Y(n159) );
  OAI21XLTS U173 ( .A0(n139), .A1(n136), .B0(n159), .Y(n36) );
  NAND2X1TS U174 ( .A(in1[14]), .B(in2[14]), .Y(n174) );
  NAND2X1TS U175 ( .A(in1[15]), .B(in2[15]), .Y(n164) );
  AOI21X1TS U176 ( .A0(n36), .A1(n35), .B0(n34), .Y(n37) );
  OAI21X2TS U177 ( .A0(n39), .A1(n38), .B0(n37), .Y(n86) );
  NAND2X1TS U178 ( .A(n41), .B(n40), .Y(n42) );
  XNOR2X1TS U179 ( .A(n43), .B(n42), .Y(res[17]) );
  INVX2TS U180 ( .A(n47), .Y(n49) );
  XNOR2X1TS U181 ( .A(n51), .B(n50), .Y(res[26]) );
  NAND2X1TS U182 ( .A(n54), .B(n53), .Y(n55) );
  XNOR2X1TS U183 ( .A(n56), .B(n55), .Y(res[25]) );
  AOI21X1TS U184 ( .A0(n66), .A1(n58), .B0(n57), .Y(n61) );
  NAND2X1TS U185 ( .A(in1[5]), .B(in2[5]), .Y(n63) );
  NAND2X1TS U186 ( .A(n59), .B(n63), .Y(n60) );
  NOR2X1TS U187 ( .A(n62), .B(n65), .Y(n70) );
  OAI21X1TS U188 ( .A0(n65), .A1(n64), .B0(n63), .Y(n75) );
  AOI21X1TS U189 ( .A0(n66), .A1(n70), .B0(n75), .Y(n200) );
  NOR2X2TS U190 ( .A(in1[6]), .B(in2[6]), .Y(n196) );
  NAND2X1TS U191 ( .A(in1[6]), .B(in2[6]), .Y(n197) );
  NAND2X1TS U192 ( .A(in1[7]), .B(in2[7]), .Y(n71) );
  NAND2X1TS U193 ( .A(n67), .B(n71), .Y(n68) );
  XNOR2X1TS U194 ( .A(n69), .B(n68), .Y(res[7]) );
  NAND2X1TS U195 ( .A(n70), .B(n74), .Y(n77) );
  AOI21X1TS U196 ( .A0(n75), .A1(n74), .B0(n73), .Y(n76) );
  NAND2X1TS U197 ( .A(n80), .B(n79), .Y(n81) );
  XNOR2X1TS U198 ( .A(n82), .B(n81), .Y(res[9]) );
  NAND2X1TS U199 ( .A(n87), .B(n89), .Y(n88) );
  NAND2X1TS U200 ( .A(n116), .B(n114), .Y(n93) );
  XNOR2X1TS U201 ( .A(n117), .B(n93), .Y(res[19]) );
  NAND2X1TS U202 ( .A(n96), .B(n95), .Y(n97) );
  AOI21X4TS U203 ( .A0(n102), .A1(n101), .B0(n100), .Y(n107) );
  NAND2X1TS U204 ( .A(n103), .B(n105), .Y(n104) );
  OAI21X4TS U205 ( .A0(n107), .A1(n106), .B0(n105), .Y(n133) );
  NAND2X1TS U206 ( .A(n132), .B(n130), .Y(n109) );
  XNOR2X1TS U207 ( .A(n133), .B(n109), .Y(res[11]) );
  NAND2X1TS U208 ( .A(n111), .B(n110), .Y(n112) );
  XNOR2X1TS U209 ( .A(n113), .B(n112), .Y(res[28]) );
  NAND2X1TS U210 ( .A(n118), .B(n120), .Y(n119) );
  NAND2X1TS U211 ( .A(n147), .B(n145), .Y(n124) );
  XNOR2X1TS U212 ( .A(n148), .B(n124), .Y(res[21]) );
  NAND2X1TS U213 ( .A(n127), .B(n126), .Y(n128) );
  NAND2X1TS U214 ( .A(n134), .B(n136), .Y(n135) );
  NAND2X1TS U215 ( .A(n161), .B(n159), .Y(n140) );
  XNOR2X1TS U216 ( .A(n162), .B(n140), .Y(res[13]) );
  NAND2X1TS U217 ( .A(n142), .B(n141), .Y(n143) );
  XNOR2X1TS U218 ( .A(n144), .B(n143), .Y(res[30]) );
  NAND2X1TS U219 ( .A(n151), .B(n150), .Y(n152) );
  NAND2X1TS U220 ( .A(n156), .B(n155), .Y(n157) );
  AOI21X4TS U221 ( .A0(n162), .A1(n161), .B0(n160), .Y(n177) );
  NAND2X1TS U222 ( .A(n165), .B(n164), .Y(n166) );
  XNOR2X1TS U223 ( .A(n167), .B(n166), .Y(res[15]) );
  NAND2X1TS U224 ( .A(n170), .B(n169), .Y(n171) );
  XOR2X1TS U225 ( .A(n172), .B(n171), .Y(res[31]) );
  NAND2X1TS U226 ( .A(n175), .B(n174), .Y(n176) );
  XOR2X1TS U227 ( .A(n177), .B(n176), .Y(res[14]) );
  NAND2X1TS U228 ( .A(n180), .B(n179), .Y(n181) );
  XOR2XLTS U229 ( .A(n181), .B(n201), .Y(res[1]) );
  NAND2X1TS U230 ( .A(n184), .B(n183), .Y(n185) );
  NAND2X1TS U231 ( .A(n188), .B(n187), .Y(n189) );
  NAND2X1TS U232 ( .A(n193), .B(n192), .Y(n194) );
  NAND2X1TS U233 ( .A(n198), .B(n197), .Y(n199) );
  OR2X1TS U234 ( .A(in1[0]), .B(in2[0]), .Y(n202) );
  CLKAND2X2TS U235 ( .A(n202), .B(n201), .Y(res[0]) );
initial $sdf_annotate("ACA_II_N32_Q16_syn.sdf"); 
 endmodule

