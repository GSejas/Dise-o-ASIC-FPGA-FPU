/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sat Nov 19 00:21:17 2016
/////////////////////////////////////////////////////////////


module ACA_I_N16_Q4 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133;

  CLKAND2X2TS U83 ( .A(in1[4]), .B(in2[4]), .Y(n120) );
  CLKAND2X2TS U84 ( .A(in1[8]), .B(in2[8]), .Y(n99) );
  CLKAND2X2TS U85 ( .A(in1[0]), .B(in2[0]), .Y(n127) );
  OAI21XLTS U86 ( .A0(n120), .A1(n121), .B0(n112), .Y(n111) );
  AOI2BB1XLTS U87 ( .A0N(n122), .A1N(n121), .B0(n120), .Y(n126) );
  OAI21XLTS U88 ( .A0(n86), .A1(n94), .B0(n85), .Y(n84) );
  OAI21XLTS U89 ( .A0(n99), .A1(n97), .B0(n98), .Y(n96) );
  AOI2BB1XLTS U90 ( .A0N(n93), .A1N(n97), .B0(n99), .Y(n72) );
  OAI21XLTS U91 ( .A0(n92), .A1(n102), .B0(n91), .Y(n90) );
  OAI21XLTS U92 ( .A0(n106), .A1(n116), .B0(n105), .Y(n104) );
  CLKAND2X2TS U93 ( .A(in2[12]), .B(in1[12]), .Y(n106) );
  AOI2BB2XLTS U94 ( .B0(in2[12]), .B1(in1[12]), .A0N(n117), .A1N(n116), .Y(
        n119) );
  OAI211XLTS U95 ( .A0(in1[2]), .A1(in2[2]), .B0(in1[1]), .C0(in2[1]), .Y(n109) );
  OAI21XLTS U96 ( .A0(n107), .A1(n110), .B0(n70), .Y(n69) );
  OAI21XLTS U97 ( .A0(n75), .A1(n95), .B0(n74), .Y(n73) );
  OAI21XLTS U98 ( .A0(n79), .A1(n103), .B0(n78), .Y(n77) );
  AOI2BB1XLTS U99 ( .A0N(in1[0]), .A1N(in2[0]), .B0(n127), .Y(res[0]) );
  NAND2X1TS U100 ( .A(in1[3]), .B(in2[3]), .Y(n82) );
  INVX2TS U101 ( .A(n82), .Y(n107) );
  NOR2X2TS U102 ( .A(in1[3]), .B(in2[3]), .Y(n110) );
  OAI31X1TS U103 ( .A0(n107), .A1(n70), .A2(n110), .B0(n69), .Y(res[3]) );
  NOR2X2TS U104 ( .A(in1[7]), .B(in2[7]), .Y(n95) );
  NAND2X1TS U105 ( .A(in1[6]), .B(in2[6]), .Y(n80) );
  NAND2X1TS U106 ( .A(in1[7]), .B(in2[7]), .Y(n88) );
  OA21XLTS U107 ( .A0(n95), .A1(n80), .B0(n88), .Y(n93) );
  NOR2X2TS U108 ( .A(in1[8]), .B(in2[8]), .Y(n97) );
  NOR2X1TS U109 ( .A(in1[9]), .B(in2[9]), .Y(n89) );
  INVX2TS U110 ( .A(n89), .Y(n76) );
  NAND2X1TS U111 ( .A(in1[9]), .B(in2[9]), .Y(n101) );
  NAND2X1TS U112 ( .A(n76), .B(n101), .Y(n71) );
  XOR2XLTS U113 ( .A(n72), .B(n71), .Y(res[9]) );
  INVX2TS U114 ( .A(n88), .Y(n75) );
  NOR2X1TS U115 ( .A(in1[5]), .B(in2[5]), .Y(n83) );
  INVX2TS U116 ( .A(n83), .Y(n124) );
  AOI22X1TS U117 ( .A0(in1[5]), .A1(in2[5]), .B0(n120), .B1(n124), .Y(n81) );
  NOR2X2TS U118 ( .A(in1[6]), .B(in2[6]), .Y(n94) );
  OAI21X1TS U119 ( .A0(n81), .A1(n94), .B0(n80), .Y(n74) );
  OAI31X1TS U120 ( .A0(n75), .A1(n74), .A2(n95), .B0(n73), .Y(res[7]) );
  NAND2X1TS U121 ( .A(in1[11]), .B(in2[11]), .Y(n113) );
  INVX2TS U122 ( .A(n113), .Y(n79) );
  AOI22X1TS U123 ( .A0(in1[9]), .A1(in2[9]), .B0(n99), .B1(n76), .Y(n87) );
  NOR2X2TS U124 ( .A(in1[10]), .B(in2[10]), .Y(n102) );
  NAND2X1TS U125 ( .A(in1[10]), .B(in2[10]), .Y(n100) );
  OAI21X1TS U126 ( .A0(n87), .A1(n102), .B0(n100), .Y(n78) );
  NOR2X2TS U127 ( .A(in1[11]), .B(in2[11]), .Y(n103) );
  OAI31X1TS U128 ( .A0(n79), .A1(n78), .A2(n103), .B0(n77), .Y(res[11]) );
  INVX2TS U129 ( .A(n80), .Y(n86) );
  NOR2X2TS U130 ( .A(in1[4]), .B(in2[4]), .Y(n121) );
  OAI31X1TS U131 ( .A0(n83), .A1(n121), .A2(n82), .B0(n81), .Y(n85) );
  OAI31X1TS U132 ( .A0(n86), .A1(n85), .A2(n94), .B0(n84), .Y(res[6]) );
  INVX2TS U133 ( .A(n100), .Y(n92) );
  OAI31X1TS U134 ( .A0(n89), .A1(n97), .A2(n88), .B0(n87), .Y(n91) );
  OAI31X1TS U135 ( .A0(n92), .A1(n91), .A2(n102), .B0(n90), .Y(res[10]) );
  NAND2X1TS U136 ( .A(in1[5]), .B(in2[5]), .Y(n123) );
  OAI31X1TS U137 ( .A0(n95), .A1(n94), .A2(n123), .B0(n93), .Y(n98) );
  OAI31X1TS U138 ( .A0(n99), .A1(n98), .A2(n97), .B0(n96), .Y(res[8]) );
  OA21XLTS U139 ( .A0(n103), .A1(n100), .B0(n113), .Y(n117) );
  OAI31X1TS U140 ( .A0(n103), .A1(n102), .A2(n101), .B0(n117), .Y(n105) );
  NOR2X2TS U141 ( .A(in2[12]), .B(in1[12]), .Y(n116) );
  OAI31X1TS U142 ( .A0(n106), .A1(n105), .A2(n116), .B0(n104), .Y(res[12]) );
  INVX2TS U143 ( .A(n110), .Y(n108) );
  AOI31X1TS U144 ( .A0(in1[2]), .A1(in2[2]), .A2(n108), .B0(n107), .Y(n122) );
  OAI21X1TS U145 ( .A0(n110), .A1(n109), .B0(n122), .Y(n112) );
  OAI31X1TS U146 ( .A0(n120), .A1(n112), .A2(n121), .B0(n111), .Y(res[4]) );
  NOR2X1TS U147 ( .A(in1[14]), .B(in2[14]), .Y(n130) );
  AOI21X1TS U148 ( .A0(in1[14]), .A1(in2[14]), .B0(n130), .Y(n115) );
  NOR2X2TS U149 ( .A(in2[13]), .B(in1[13]), .Y(n132) );
  AOI22X1TS U150 ( .A0(in2[12]), .A1(in1[12]), .B0(in2[13]), .B1(in1[13]), .Y(
        n131) );
  OAI32X1TS U151 ( .A0(n132), .A1(n116), .A2(n113), .B0(n131), .B1(n132), .Y(
        n114) );
  XOR2XLTS U152 ( .A(n115), .B(n114), .Y(res[14]) );
  AOI21X1TS U153 ( .A0(in1[13]), .A1(in2[13]), .B0(n132), .Y(n118) );
  XNOR2X1TS U154 ( .A(n119), .B(n118), .Y(res[13]) );
  NAND2X1TS U155 ( .A(n124), .B(n123), .Y(n125) );
  XOR2XLTS U156 ( .A(n126), .B(n125), .Y(res[5]) );
  CMPR32X2TS U157 ( .A(in2[1]), .B(in1[1]), .C(n127), .CO(n128), .S(res[1]) );
  CMPR32X2TS U158 ( .A(in1[2]), .B(in2[2]), .C(n128), .CO(n70), .S(res[2]) );
  NAND2X1TS U159 ( .A(in1[14]), .B(in2[14]), .Y(n129) );
  OAI31X1TS U160 ( .A0(n132), .A1(n131), .A2(n130), .B0(n129), .Y(n133) );
  CMPR32X2TS U161 ( .A(in1[15]), .B(in2[15]), .C(n133), .CO(res[16]), .S(
        res[15]) );
initial $sdf_annotate("ACA_I_N16_Q4_syn.sdf"); 
 endmodule

