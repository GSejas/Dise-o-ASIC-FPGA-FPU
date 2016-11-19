/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:22:26 2016
/////////////////////////////////////////////////////////////


module GDA_dyn_N16_M4 ( in1, in2, ctrl, in_ctrl_0, in_ctrl_1, in_ctrl_2, res
 );
  input [15:0] in1;
  input [15:0] in2;
  input [2:0] ctrl;
  input [1:0] in_ctrl_1;
  input [2:0] in_ctrl_2;
  output [16:0] res;
  input in_ctrl_0;
  wire   n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151;

  AO21X1TS U40 ( .A0(n151), .A1(n39), .B0(n37), .Y(res[16]) );
  MX2X4TS U41 ( .A(n81), .B(n80), .S0(ctrl[2]), .Y(n151) );
  NAND2X1TS U42 ( .A(in2[15]), .B(in1[15]), .Y(n148) );
  NAND2X1TS U43 ( .A(in2[14]), .B(in1[14]), .Y(n90) );
  NAND2X1TS U44 ( .A(in2[4]), .B(in1[4]), .Y(n134) );
  AO22X2TS U45 ( .A0(n67), .A1(in_ctrl_1[1]), .B0(in_ctrl_1[0]), .B1(n74), .Y(
        n76) );
  NAND2X1TS U46 ( .A(in2[12]), .B(in1[12]), .Y(n98) );
  CMPR32X2TS U47 ( .A(in1[3]), .B(in2[3]), .C(n144), .CO(n71), .S(res[3]) );
  NAND2X1TS U48 ( .A(in1[11]), .B(in2[11]), .Y(n103) );
  NAND2X1TS U49 ( .A(in2[6]), .B(in1[6]), .Y(n129) );
  OAI222X4TS U50 ( .A0(n62), .A1(n61), .B0(n60), .B1(n59), .C0(n129), .C1(n73), 
        .Y(n74) );
  OR2X1TS U51 ( .A(in2[13]), .B(in1[13]), .Y(n45) );
  NAND2X2TS U52 ( .A(in2[9]), .B(in1[9]), .Y(n116) );
  AO21X2TS U53 ( .A0(in_ctrl_2[0]), .A1(n78), .B0(n66), .Y(n81) );
  NAND2X1TS U54 ( .A(n91), .B(n90), .Y(n92) );
  NAND2X1TS U55 ( .A(n45), .B(n95), .Y(n96) );
  INVX2TS U56 ( .A(n89), .Y(n91) );
  INVX2TS U57 ( .A(n148), .Y(n149) );
  NAND2X1TS U58 ( .A(n41), .B(n148), .Y(n83) );
  XOR2X1TS U59 ( .A(n97), .B(n96), .Y(res[13]) );
  XOR2X1TS U60 ( .A(n118), .B(n117), .Y(res[9]) );
  XOR2X1TS U61 ( .A(n115), .B(n114), .Y(res[10]) );
  XOR2X1TS U62 ( .A(n106), .B(n105), .Y(res[11]) );
  MX2X4TS U63 ( .A(n76), .B(n46), .S0(ctrl[1]), .Y(n120) );
  XOR2X1TS U64 ( .A(n141), .B(n140), .Y(res[5]) );
  XOR2X1TS U65 ( .A(n126), .B(n125), .Y(res[7]) );
  XOR2X1TS U66 ( .A(n132), .B(n131), .Y(res[6]) );
  CLKAND2X2TS U67 ( .A(n147), .B(n41), .Y(n39) );
  NOR2X1TS U68 ( .A(n121), .B(n73), .Y(n75) );
  OAI21X1TS U69 ( .A0(n108), .A1(n111), .B0(n112), .Y(n101) );
  AOI21X1TS U70 ( .A0(n40), .A1(n42), .B0(n100), .Y(n108) );
  OAI211X1TS U71 ( .A0(in1[11]), .A1(in2[11]), .B0(in1[10]), .C0(in2[10]), .Y(
        n51) );
  OR2X2TS U72 ( .A(in2[8]), .B(in1[8]), .Y(n43) );
  AND2X2TS U73 ( .A(in1[9]), .B(in2[9]), .Y(n64) );
  OR2X2TS U74 ( .A(in2[12]), .B(in1[12]), .Y(n44) );
  OR2X2TS U75 ( .A(in2[9]), .B(in1[9]), .Y(n40) );
  OR2X2TS U76 ( .A(in2[15]), .B(in1[15]), .Y(n41) );
  AND2X2TS U77 ( .A(in2[8]), .B(in1[8]), .Y(n42) );
  AO22X1TS U78 ( .A0(in2[2]), .A1(in1[2]), .B0(in1[3]), .B1(in2[3]), .Y(n55)
         );
  AND2X2TS U79 ( .A(in2[5]), .B(in1[5]), .Y(n58) );
  MX2X4TS U80 ( .A(n71), .B(n70), .S0(n69), .Y(n143) );
  OAI211X1TS U81 ( .A0(in1[1]), .A1(in2[1]), .B0(in1[0]), .C0(in2[0]), .Y(n54)
         );
  NOR2X1TS U82 ( .A(in2[4]), .B(in1[4]), .Y(n133) );
  NOR2X2TS U83 ( .A(in2[5]), .B(in1[5]), .Y(n137) );
  INVX2TS U84 ( .A(n133), .Y(n136) );
  INVX2TS U85 ( .A(n134), .Y(n135) );
  NAND2X1TS U86 ( .A(in2[5]), .B(in1[5]), .Y(n138) );
  NOR2X1TS U87 ( .A(n133), .B(n137), .Y(n128) );
  OAI21X1TS U88 ( .A0(n137), .A1(n134), .B0(n138), .Y(n127) );
  NAND2X1TS U89 ( .A(n128), .B(n130), .Y(n121) );
  AO21X1TS U90 ( .A0(n127), .A1(n130), .B0(n122), .Y(n36) );
  INVX2TS U91 ( .A(n129), .Y(n122) );
  CLKAND2X2TS U92 ( .A(n102), .B(n104), .Y(n38) );
  CLKAND2X2TS U93 ( .A(in2[10]), .B(in1[10]), .Y(n49) );
  AOI2BB2X1TS U94 ( .B0(n54), .B1(n53), .A0N(in2[2]), .A1N(in1[2]), .Y(n56) );
  NOR2X1TS U95 ( .A(in2[11]), .B(in1[11]), .Y(n77) );
  NAND2X1TS U96 ( .A(n43), .B(n40), .Y(n107) );
  AOI21X1TS U97 ( .A0(n45), .A1(n94), .B0(n82), .Y(n86) );
  INVX2TS U98 ( .A(n95), .Y(n82) );
  NAND2X1TS U99 ( .A(n44), .B(n45), .Y(n85) );
  INVX2TS U100 ( .A(n108), .Y(n109) );
  INVX2TS U101 ( .A(n107), .Y(n110) );
  INVX2TS U102 ( .A(n77), .Y(n104) );
  NOR2X2TS U103 ( .A(in2[10]), .B(in1[10]), .Y(n111) );
  INVX2TS U104 ( .A(n116), .Y(n100) );
  NAND2X1TS U105 ( .A(in2[10]), .B(in1[10]), .Y(n112) );
  NOR2X1TS U106 ( .A(n107), .B(n111), .Y(n102) );
  NAND2X2TS U107 ( .A(in2[13]), .B(in1[13]), .Y(n95) );
  INVX2TS U108 ( .A(n98), .Y(n94) );
  NOR2X2TS U109 ( .A(in2[14]), .B(in1[14]), .Y(n89) );
  INVX2TS U110 ( .A(n86), .Y(n87) );
  INVX2TS U111 ( .A(n85), .Y(n88) );
  OAI21X1TS U112 ( .A0(n86), .A1(n89), .B0(n90), .Y(n150) );
  NOR2X1TS U113 ( .A(n85), .B(n89), .Y(n147) );
  ADDHXLTS U114 ( .A(in2[0]), .B(in1[0]), .CO(n146), .S(res[0]) );
  NAND2X1TS U115 ( .A(n139), .B(n138), .Y(n140) );
  NAND2X1TS U116 ( .A(n130), .B(n129), .Y(n131) );
  INVX2TS U117 ( .A(n121), .Y(n123) );
  AOI21X1TS U118 ( .A0(n120), .A1(n43), .B0(n42), .Y(n118) );
  NAND2X1TS U119 ( .A(n113), .B(n112), .Y(n114) );
  AOI21X1TS U120 ( .A0(n120), .A1(n110), .B0(n109), .Y(n115) );
  INVX2TS U121 ( .A(n111), .Y(n113) );
  NAND2X1TS U122 ( .A(n104), .B(n103), .Y(n105) );
  AOI21X1TS U123 ( .A0(n120), .A1(n102), .B0(n101), .Y(n106) );
  NAND2X1TS U124 ( .A(n44), .B(n98), .Y(n99) );
  NOR3X1TS U125 ( .A(n49), .B(n48), .C(n77), .Y(n50) );
  NOR4X2TS U126 ( .A(n142), .B(n58), .C(n60), .D(n68), .Y(n67) );
  NAND3X1TS U127 ( .A(n57), .B(n124), .C(n129), .Y(n60) );
  INVX2TS U128 ( .A(n72), .Y(n130) );
  NOR2X1TS U129 ( .A(n137), .B(n72), .Y(n57) );
  NOR2X1TS U130 ( .A(in2[7]), .B(in1[7]), .Y(n73) );
  XNOR2X1TS U131 ( .A(n143), .B(n142), .Y(res[4]) );
  AOI21X1TS U132 ( .A0(n143), .A1(n136), .B0(n135), .Y(n141) );
  AOI21X1TS U133 ( .A0(n143), .A1(n128), .B0(n127), .Y(n132) );
  AOI21X1TS U134 ( .A0(n143), .A1(n123), .B0(n36), .Y(n126) );
  OAI211X1TS U135 ( .A0(n52), .A1(n63), .B0(n51), .C0(n103), .Y(n78) );
  AO21X1TS U136 ( .A0(n150), .A1(n41), .B0(n149), .Y(n37) );
  AO21X4TS U137 ( .A0(n143), .A1(n75), .B0(n74), .Y(n46) );
  INVX2TS U138 ( .A(in2[7]), .Y(n61) );
  INVX2TS U139 ( .A(ctrl[0]), .Y(n69) );
  INVX2TS U140 ( .A(n137), .Y(n139) );
  NAND2X1TS U141 ( .A(n40), .B(n116), .Y(n117) );
  AOI21X1TS U142 ( .A0(in1[8]), .A1(in2[8]), .B0(n64), .Y(n52) );
  OAI22X1TS U143 ( .A0(in1[9]), .A1(in2[9]), .B0(in2[10]), .B1(in1[10]), .Y(
        n48) );
  NAND2X1TS U144 ( .A(n103), .B(n50), .Y(n63) );
  NAND2X1TS U145 ( .A(in1[1]), .B(in2[1]), .Y(n53) );
  OAI22X1TS U146 ( .A0(n56), .A1(n55), .B0(in1[3]), .B1(in2[3]), .Y(n68) );
  NOR2X1TS U147 ( .A(in2[6]), .B(in1[6]), .Y(n72) );
  XOR2X1TS U148 ( .A(in2[7]), .B(in1[7]), .Y(n124) );
  XNOR2X1TS U149 ( .A(in2[4]), .B(in1[4]), .Y(n142) );
  INVX2TS U150 ( .A(in1[7]), .Y(n62) );
  AOI21X1TS U151 ( .A0(in1[4]), .A1(in2[4]), .B0(n58), .Y(n59) );
  AOI22X1TS U152 ( .A0(n67), .A1(in_ctrl_2[2]), .B0(in_ctrl_2[1]), .B1(n74), 
        .Y(n65) );
  XNOR2X1TS U153 ( .A(in1[8]), .B(in2[8]), .Y(n119) );
  NOR4X1TS U154 ( .A(n65), .B(n64), .C(n63), .D(n119), .Y(n66) );
  NOR2BX1TS U155 ( .AN(in_ctrl_0), .B(n68), .Y(n70) );
  INVX2TS U156 ( .A(n78), .Y(n79) );
  OAI2BB1X4TS U157 ( .A0N(n120), .A1N(n38), .B0(n79), .Y(n80) );
  AOI21X4TS U158 ( .A0(n151), .A1(n147), .B0(n150), .Y(n84) );
  XOR2X1TS U159 ( .A(n84), .B(n83), .Y(res[15]) );
  AOI21X4TS U160 ( .A0(n151), .A1(n88), .B0(n87), .Y(n93) );
  XOR2X1TS U161 ( .A(n93), .B(n92), .Y(res[14]) );
  AOI21X4TS U162 ( .A0(n151), .A1(n44), .B0(n94), .Y(n97) );
  XNOR2X1TS U163 ( .A(n151), .B(n99), .Y(res[12]) );
  XNOR2X1TS U164 ( .A(n120), .B(n119), .Y(res[8]) );
  INVX2TS U165 ( .A(n124), .Y(n125) );
  CMPR32X2TS U166 ( .A(in1[2]), .B(in2[2]), .C(n145), .CO(n144), .S(res[2]) );
  CMPR32X2TS U167 ( .A(in1[1]), .B(in2[1]), .C(n146), .CO(n145), .S(res[1]) );
initial $sdf_annotate("GDA_dyn_N16_M4_syn.sdf"); 
 endmodule

