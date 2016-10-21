/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 19 19:49:19 2016
/////////////////////////////////////////////////////////////


module Oper_Start_In_2_W32 ( clk, rst, load_b_i, intAS, intDX, intDY, DMP_o, 
        DmP_o, zero_flag_o, real_op_o, sign_final_result_o );
  input [31:0] intDX;
  input [31:0] intDY;
  output [30:0] DMP_o;
  output [30:0] DmP_o;
  input clk, rst, load_b_i, intAS;
  output zero_flag_o, real_op_o, sign_final_result_o;
  wire   n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411;
         
         




  DFFRXLTS MRegister_Q_reg_0_ ( .D(n199), .CK(clk), .RN(n136), .Q(DMP_o[0]) );
  DFFRXLTS MRegister_Q_reg_1_ ( .D(n198), .CK(clk), .RN(n136), .Q(DMP_o[1]) );
  DFFRXLTS MRegister_Q_reg_2_ ( .D(n197), .CK(clk), .RN(n410), .Q(DMP_o[2]) );
  DFFRXLTS MRegister_Q_reg_3_ ( .D(n196), .CK(clk), .RN(n411), .Q(DMP_o[3]) );
  DFFRXLTS MRegister_Q_reg_4_ ( .D(n195), .CK(clk), .RN(n136), .Q(DMP_o[4]) );
  DFFRXLTS MRegister_Q_reg_5_ ( .D(n194), .CK(clk), .RN(n410), .Q(DMP_o[5]) );
  DFFRXLTS MRegister_Q_reg_6_ ( .D(n193), .CK(clk), .RN(n410), .Q(DMP_o[6]) );
  DFFRXLTS MRegister_Q_reg_7_ ( .D(n192), .CK(clk), .RN(n411), .Q(DMP_o[7]) );
  DFFRXLTS MRegister_Q_reg_8_ ( .D(n191), .CK(clk), .RN(n136), .Q(DMP_o[8]) );
  DFFRXLTS MRegister_Q_reg_9_ ( .D(n190), .CK(clk), .RN(n411), .Q(DMP_o[9]) );
  DFFRXLTS MRegister_Q_reg_10_ ( .D(n189), .CK(clk), .RN(n410), .Q(DMP_o[10])
         );
  DFFRXLTS MRegister_Q_reg_11_ ( .D(n188), .CK(clk), .RN(n136), .Q(DMP_o[11])
         );
  DFFRXLTS MRegister_Q_reg_12_ ( .D(n187), .CK(clk), .RN(n410), .Q(DMP_o[12])
         );
  DFFRXLTS MRegister_Q_reg_13_ ( .D(n186), .CK(clk), .RN(n411), .Q(DMP_o[13])
         );
  DFFRXLTS MRegister_Q_reg_14_ ( .D(n185), .CK(clk), .RN(n136), .Q(DMP_o[14])
         );
  DFFRXLTS MRegister_Q_reg_15_ ( .D(n184), .CK(clk), .RN(n410), .Q(DMP_o[15])
         );
  DFFRXLTS MRegister_Q_reg_16_ ( .D(n183), .CK(clk), .RN(n411), .Q(DMP_o[16])
         );
  DFFRXLTS MRegister_Q_reg_17_ ( .D(n182), .CK(clk), .RN(n136), .Q(DMP_o[17])
         );
  DFFRXLTS MRegister_Q_reg_18_ ( .D(n181), .CK(clk), .RN(n410), .Q(DMP_o[18])
         );
  DFFRXLTS MRegister_Q_reg_19_ ( .D(n180), .CK(clk), .RN(n411), .Q(DMP_o[19])
         );
  DFFRXLTS MRegister_Q_reg_20_ ( .D(n179), .CK(clk), .RN(n136), .Q(DMP_o[20])
         );
  DFFRXLTS MRegister_Q_reg_21_ ( .D(n178), .CK(clk), .RN(n410), .Q(DMP_o[21])
         );
  DFFRXLTS MRegister_Q_reg_22_ ( .D(n177), .CK(clk), .RN(n411), .Q(DMP_o[22])
         );
  DFFRXLTS MRegister_Q_reg_23_ ( .D(n176), .CK(clk), .RN(n410), .Q(DMP_o[23])
         );
  DFFRXLTS MRegister_Q_reg_24_ ( .D(n175), .CK(clk), .RN(n410), .Q(DMP_o[24])
         );
  DFFRXLTS MRegister_Q_reg_25_ ( .D(n174), .CK(clk), .RN(n410), .Q(DMP_o[25])
         );
  DFFRXLTS MRegister_Q_reg_26_ ( .D(n173), .CK(clk), .RN(n410), .Q(DMP_o[26])
         );
  DFFRXLTS MRegister_Q_reg_27_ ( .D(n172), .CK(clk), .RN(n410), .Q(DMP_o[27])
         );
  DFFRXLTS MRegister_Q_reg_28_ ( .D(n171), .CK(clk), .RN(n410), .Q(DMP_o[28])
         );
  DFFRXLTS MRegister_Q_reg_29_ ( .D(n170), .CK(clk), .RN(n410), .Q(DMP_o[29])
         );
  DFFRXLTS MRegister_Q_reg_30_ ( .D(n169), .CK(clk), .RN(n410), .Q(DMP_o[30])
         );
  DFFRXLTS SignRegister_Q_reg_0_ ( .D(n168), .CK(clk), .RN(n410), .Q(
        sign_final_result_o) );
  DFFRXLTS mRegister_Q_reg_0_ ( .D(n167), .CK(clk), .RN(n410), .Q(DmP_o[0]) );
  DFFRXLTS mRegister_Q_reg_1_ ( .D(n166), .CK(clk), .RN(n410), .Q(DmP_o[1]) );
  DFFRXLTS mRegister_Q_reg_2_ ( .D(n165), .CK(clk), .RN(n410), .Q(DmP_o[2]) );
  DFFRXLTS mRegister_Q_reg_3_ ( .D(n164), .CK(clk), .RN(n136), .Q(DmP_o[3]) );
  DFFRXLTS mRegister_Q_reg_4_ ( .D(n163), .CK(clk), .RN(n136), .Q(DmP_o[4]) );
  DFFRXLTS mRegister_Q_reg_5_ ( .D(n162), .CK(clk), .RN(n410), .Q(DmP_o[5]) );
  DFFRXLTS mRegister_Q_reg_6_ ( .D(n161), .CK(clk), .RN(n411), .Q(DmP_o[6]) );
  DFFRXLTS mRegister_Q_reg_7_ ( .D(n160), .CK(clk), .RN(n136), .Q(DmP_o[7]) );
  DFFRXLTS mRegister_Q_reg_8_ ( .D(n159), .CK(clk), .RN(n411), .Q(DmP_o[8]) );
  DFFRXLTS mRegister_Q_reg_9_ ( .D(n158), .CK(clk), .RN(n136), .Q(DmP_o[9]) );
  DFFRXLTS mRegister_Q_reg_10_ ( .D(n157), .CK(clk), .RN(n411), .Q(DmP_o[10])
         );
  DFFRXLTS mRegister_Q_reg_11_ ( .D(n156), .CK(clk), .RN(n136), .Q(DmP_o[11])
         );
  DFFRXLTS mRegister_Q_reg_12_ ( .D(n155), .CK(clk), .RN(n411), .Q(DmP_o[12])
         );
  DFFRXLTS mRegister_Q_reg_13_ ( .D(n154), .CK(clk), .RN(n136), .Q(DmP_o[13])
         );
  DFFRXLTS mRegister_Q_reg_14_ ( .D(n153), .CK(clk), .RN(n411), .Q(DmP_o[14])
         );
  DFFRXLTS mRegister_Q_reg_15_ ( .D(n152), .CK(clk), .RN(n136), .Q(DmP_o[15])
         );
  DFFRXLTS mRegister_Q_reg_16_ ( .D(n151), .CK(clk), .RN(n411), .Q(DmP_o[16])
         );
  DFFRXLTS mRegister_Q_reg_17_ ( .D(n150), .CK(clk), .RN(n136), .Q(DmP_o[17])
         );
  DFFRXLTS mRegister_Q_reg_18_ ( .D(n149), .CK(clk), .RN(n411), .Q(DmP_o[18])
         );
  DFFRXLTS mRegister_Q_reg_19_ ( .D(n148), .CK(clk), .RN(n136), .Q(DmP_o[19])
         );
  DFFRXLTS mRegister_Q_reg_20_ ( .D(n147), .CK(clk), .RN(n411), .Q(DmP_o[20])
         );
  DFFRXLTS mRegister_Q_reg_21_ ( .D(n146), .CK(clk), .RN(n136), .Q(DmP_o[21])
         );
  DFFRXLTS mRegister_Q_reg_22_ ( .D(n145), .CK(clk), .RN(n411), .Q(DmP_o[22])
         );
  DFFRXLTS mRegister_Q_reg_23_ ( .D(n144), .CK(clk), .RN(n136), .Q(DmP_o[23])
         );
  DFFRXLTS mRegister_Q_reg_24_ ( .D(n143), .CK(clk), .RN(n411), .Q(DmP_o[24])
         );
  DFFRXLTS mRegister_Q_reg_25_ ( .D(n142), .CK(clk), .RN(n136), .Q(DmP_o[25])
         );
  DFFRXLTS mRegister_Q_reg_26_ ( .D(n141), .CK(clk), .RN(n136), .Q(DmP_o[26])
         );
  DFFRXLTS mRegister_Q_reg_27_ ( .D(n140), .CK(clk), .RN(n411), .Q(DmP_o[27])
         );
  DFFRXLTS mRegister_Q_reg_28_ ( .D(n139), .CK(clk), .RN(n411), .Q(DmP_o[28])
         );
  DFFRXLTS mRegister_Q_reg_29_ ( .D(n138), .CK(clk), .RN(n411), .Q(DmP_o[29])
         );
  DFFRXLTS mRegister_Q_reg_30_ ( .D(n137), .CK(clk), .RN(n411), .Q(DmP_o[30])
         );
  CLKAND2X2TS U204 ( .A(load_b_i), .B(n378), .Y(n409) );
  OAI21XLTS U205 ( .A0(n388), .A1(n322), .B0(n271), .Y(n139) );
  OAI21XLTS U206 ( .A0(n357), .A1(n322), .B0(n326), .Y(n140) );
  OAI21XLTS U207 ( .A0(n292), .A1(n322), .B0(n280), .Y(n141) );
  OAI21XLTS U208 ( .A0(n350), .A1(n322), .B0(n324), .Y(n142) );
  OAI21XLTS U209 ( .A0(n289), .A1(n322), .B0(n288), .Y(n143) );
  OAI21XLTS U210 ( .A0(n287), .A1(n322), .B0(n286), .Y(n145) );
  OAI21XLTS U211 ( .A0(n351), .A1(n322), .B0(n327), .Y(n146) );
  OAI21XLTS U212 ( .A0(n382), .A1(n398), .B0(n381), .Y(n147) );
  OAI21XLTS U213 ( .A0(n359), .A1(n322), .B0(n325), .Y(n148) );
  OAI21XLTS U214 ( .A0(n282), .A1(n322), .B0(n281), .Y(n149) );
  OAI21XLTS U215 ( .A0(n356), .A1(n322), .B0(n283), .Y(n150) );
  OAI21XLTS U216 ( .A0(n308), .A1(n398), .B0(n290), .Y(n151) );
  OAI21XLTS U217 ( .A0(n399), .A1(n398), .B0(n397), .Y(n152) );
  OAI21XLTS U218 ( .A0(n396), .A1(n398), .B0(n395), .Y(n154) );
  OAI21XLTS U219 ( .A0(n392), .A1(n322), .B0(n328), .Y(n155) );
  OAI21XLTS U220 ( .A0(n285), .A1(n322), .B0(n284), .Y(n156) );
  OAI21XLTS U221 ( .A0(n394), .A1(n322), .B0(n279), .Y(n157) );
  OAI21XLTS U222 ( .A0(n352), .A1(n322), .B0(n306), .Y(n160) );
  OAI21XLTS U223 ( .A0(n390), .A1(n322), .B0(n300), .Y(n161) );
  OAI21XLTS U224 ( .A0(n358), .A1(n322), .B0(n270), .Y(n162) );
  OAI21XLTS U225 ( .A0(n302), .A1(n322), .B0(n301), .Y(n163) );
  OAI21XLTS U226 ( .A0(n299), .A1(n398), .B0(n298), .Y(n164) );
  OAI21XLTS U227 ( .A0(n312), .A1(n322), .B0(n311), .Y(n165) );
  OAI21XLTS U228 ( .A0(n275), .A1(n322), .B0(n274), .Y(n166) );
  OAI21XLTS U229 ( .A0(n386), .A1(n398), .B0(n385), .Y(n167) );
  OAI21XLTS U230 ( .A0(n314), .A1(n322), .B0(n313), .Y(n169) );
  OAI21XLTS U231 ( .A0(n296), .A1(n322), .B0(n278), .Y(n170) );
  OAI21XLTS U232 ( .A0(n388), .A1(n398), .B0(n387), .Y(n171) );
  OAI21XLTS U233 ( .A0(n273), .A1(n322), .B0(n272), .Y(n172) );
  OAI21XLTS U234 ( .A0(n292), .A1(n398), .B0(n291), .Y(n173) );
  OAI21XLTS U235 ( .A0(n263), .A1(n322), .B0(n262), .Y(n175) );
  OAI21XLTS U236 ( .A0(n384), .A1(n322), .B0(n303), .Y(n176) );
  OAI21XLTS U237 ( .A0(n310), .A1(n322), .B0(n309), .Y(n177) );
  OAI21XLTS U238 ( .A0(n351), .A1(n398), .B0(n293), .Y(n178) );
  OAI21XLTS U239 ( .A0(n382), .A1(n322), .B0(n316), .Y(n179) );
  OAI21XLTS U240 ( .A0(n359), .A1(n398), .B0(n297), .Y(n180) );
  OAI21XLTS U241 ( .A0(n318), .A1(n322), .B0(n317), .Y(n181) );
  OAI21XLTS U242 ( .A0(n261), .A1(n322), .B0(n260), .Y(n182) );
  OAI21XLTS U243 ( .A0(n308), .A1(n322), .B0(n307), .Y(n183) );
  OAI21XLTS U244 ( .A0(n399), .A1(n322), .B0(n267), .Y(n184) );
  OAI21XLTS U245 ( .A0(n339), .A1(n322), .B0(n315), .Y(n185) );
  OAI21XLTS U246 ( .A0(n396), .A1(n322), .B0(n266), .Y(n186) );
  OAI21XLTS U247 ( .A0(n392), .A1(n398), .B0(n391), .Y(n187) );
  OAI21XLTS U248 ( .A0(n259), .A1(n322), .B0(n258), .Y(n188) );
  OAI21XLTS U249 ( .A0(n255), .A1(n322), .B0(n254), .Y(n190) );
  OAI21XLTS U250 ( .A0(n320), .A1(n322), .B0(n319), .Y(n191) );
  OAI21XLTS U251 ( .A0(n265), .A1(n322), .B0(n264), .Y(n192) );
  OAI21XLTS U252 ( .A0(n390), .A1(n398), .B0(n389), .Y(n193) );
  OAI21XLTS U253 ( .A0(n358), .A1(n398), .B0(n294), .Y(n194) );
  OAI21XLTS U254 ( .A0(n257), .A1(n322), .B0(n256), .Y(n195) );
  OAI21XLTS U255 ( .A0(n299), .A1(n322), .B0(n253), .Y(n196) );
  OAI21XLTS U256 ( .A0(n305), .A1(n322), .B0(n304), .Y(n197) );
  OAI21XLTS U257 ( .A0(n323), .A1(n322), .B0(n321), .Y(n198) );
  OAI21XLTS U258 ( .A0(n386), .A1(n322), .B0(n329), .Y(n199) );
  NOR2XLTS U259 ( .A(intDX[3]), .B(n299), .Y(n216) );
  NOR2XLTS U260 ( .A(intDX[13]), .B(n396), .Y(n210) );
  NOR2XLTS U261 ( .A(intDX[15]), .B(n399), .Y(n232) );
  OAI211XLTS U262 ( .A0(intDY[17]), .A1(n356), .B0(n355), .C0(n354), .Y(n362)
         );
  OAI211XLTS U263 ( .A0(intDY[12]), .A1(n392), .B0(n341), .C0(n340), .Y(n345)
         );
  OAI21XLTS U264 ( .A0(intDX[20]), .A1(n382), .B0(n205), .Y(n238) );
  OAI211XLTS U265 ( .A0(intDY[10]), .A1(n394), .B0(n365), .C0(n364), .Y(n366)
         );
  NOR2XLTS U266 ( .A(intDY[24]), .B(n289), .Y(n369) );
  AOI211XLTS U267 ( .A0(intDY[12]), .A1(n392), .B0(n214), .C0(n213), .Y(n332)
         );
  OR2X1TS U268 ( .A(n378), .B(n406), .Y(n398) );
  OAI21XLTS U269 ( .A0(n296), .A1(n398), .B0(n295), .Y(n138) );
  OAI21XLTS U270 ( .A0(n384), .A1(n398), .B0(n383), .Y(n144) );
  OAI21XLTS U271 ( .A0(n277), .A1(n322), .B0(n276), .Y(n159) );
  OAI21XLTS U272 ( .A0(n269), .A1(n322), .B0(n268), .Y(n174) );
  OAI21XLTS U273 ( .A0(n394), .A1(n398), .B0(n393), .Y(n189) );
  INVX2TS U274 ( .A(rst), .Y(n136) );
  CLKBUFX2TS U275 ( .A(n136), .Y(n411) );
  CLKBUFX2TS U276 ( .A(n136), .Y(n410) );
  INVX2TS U277 ( .A(intDY[3]), .Y(n299) );
  INVX2TS U278 ( .A(intDY[29]), .Y(n296) );
  NOR2XLTS U279 ( .A(intDX[29]), .B(n296), .Y(n241) );
  INVX2TS U280 ( .A(intDX[28]), .Y(n388) );
  INVX2TS U281 ( .A(intDY[30]), .Y(n314) );
  AOI22X1TS U282 ( .A0(intDX[30]), .A1(n314), .B0(intDX[29]), .B1(n296), .Y(
        n335) );
  OAI31X1TS U283 ( .A0(intDY[28]), .A1(n241), .A2(n388), .B0(n335), .Y(n252)
         );
  NOR2XLTS U284 ( .A(n314), .B(intDX[30]), .Y(n240) );
  INVX2TS U285 ( .A(n240), .Y(n251) );
  INVX2TS U286 ( .A(intDX[19]), .Y(n359) );
  INVX2TS U287 ( .A(intDX[18]), .Y(n282) );
  AOI22X1TS U288 ( .A0(intDY[19]), .A1(n359), .B0(intDY[18]), .B1(n282), .Y(
        n208) );
  INVX2TS U289 ( .A(intDX[17]), .Y(n356) );
  INVX2TS U290 ( .A(intDY[17]), .Y(n261) );
  NOR2XLTS U291 ( .A(intDX[17]), .B(n261), .Y(n202) );
  INVX2TS U292 ( .A(intDY[16]), .Y(n308) );
  NAND2X1TS U293 ( .A(intDX[16]), .B(n308), .Y(n336) );
  OAI22X1TS U294 ( .A0(intDY[17]), .A1(n356), .B0(n202), .B1(n336), .Y(n204)
         );
  INVX2TS U295 ( .A(intDY[18]), .Y(n318) );
  NAND2X1TS U296 ( .A(intDX[18]), .B(n318), .Y(n355) );
  AOI222XLTS U297 ( .A0(intDY[19]), .A1(n359), .B0(intDY[19]), .B1(n355), .C0(
        n359), .C1(n355), .Y(n203) );
  AOI21X1TS U298 ( .A0(n208), .A1(n204), .B0(n203), .Y(n239) );
  INVX2TS U299 ( .A(intDY[20]), .Y(n382) );
  INVX2TS U300 ( .A(intDX[21]), .Y(n351) );
  INVX2TS U301 ( .A(intDY[23]), .Y(n384) );
  INVX2TS U302 ( .A(intDY[22]), .Y(n310) );
  OAI22X1TS U303 ( .A0(intDX[23]), .A1(n384), .B0(intDX[22]), .B1(n310), .Y(
        n206) );
  AOI21X1TS U304 ( .A0(intDY[21]), .A1(n351), .B0(n206), .Y(n205) );
  INVX2TS U305 ( .A(intDX[22]), .Y(n287) );
  NOR2XLTS U306 ( .A(intDY[22]), .B(n287), .Y(n363) );
  AOI222XLTS U307 ( .A0(intDX[23]), .A1(n363), .B0(intDX[23]), .B1(n384), .C0(
        n363), .C1(n384), .Y(n237) );
  NAND2X1TS U308 ( .A(intDX[20]), .B(n382), .Y(n354) );
  AOI222XLTS U309 ( .A0(intDY[21]), .A1(n351), .B0(intDY[21]), .B1(n354), .C0(
        n351), .C1(n354), .Y(n235) );
  INVX2TS U310 ( .A(n206), .Y(n234) );
  INVX2TS U311 ( .A(n238), .Y(n207) );
  OAI211XLTS U312 ( .A0(intDX[16]), .A1(n308), .B0(n208), .C0(n207), .Y(n209)
         );
  AOI21X1TS U313 ( .A0(intDY[17]), .A1(n356), .B0(n209), .Y(n373) );
  INVX2TS U314 ( .A(intDY[15]), .Y(n399) );
  INVX2TS U315 ( .A(intDY[14]), .Y(n339) );
  NOR2XLTS U316 ( .A(n339), .B(intDX[14]), .Y(n214) );
  INVX2TS U317 ( .A(n214), .Y(n212) );
  INVX2TS U318 ( .A(intDY[13]), .Y(n396) );
  INVX2TS U319 ( .A(intDX[12]), .Y(n392) );
  NAND2X1TS U320 ( .A(intDX[13]), .B(n396), .Y(n340) );
  OAI31X1TS U321 ( .A0(intDY[12]), .A1(n210), .A2(n392), .B0(n340), .Y(n211)
         );
  AOI22X1TS U322 ( .A0(intDX[14]), .A1(n339), .B0(n212), .B1(n211), .Y(n231)
         );
  OAI22X1TS U323 ( .A0(intDX[13]), .A1(n396), .B0(intDX[15]), .B1(n399), .Y(
        n213) );
  INVX2TS U324 ( .A(intDX[6]), .Y(n390) );
  NOR2XLTS U325 ( .A(intDY[6]), .B(n390), .Y(n349) );
  INVX2TS U326 ( .A(intDY[7]), .Y(n265) );
  AOI222XLTS U327 ( .A0(intDX[7]), .A1(n349), .B0(intDX[7]), .B1(n265), .C0(
        n349), .C1(n265), .Y(n222) );
  INVX2TS U328 ( .A(intDY[11]), .Y(n259) );
  NAND2X1TS U329 ( .A(intDX[11]), .B(n259), .Y(n337) );
  INVX2TS U330 ( .A(intDX[4]), .Y(n302) );
  INVX2TS U331 ( .A(intDX[5]), .Y(n358) );
  AOI22X1TS U332 ( .A0(intDY[4]), .A1(n302), .B0(intDY[5]), .B1(n358), .Y(n344) );
  INVX2TS U333 ( .A(intDX[7]), .Y(n352) );
  AOI22X1TS U334 ( .A0(intDY[6]), .A1(n390), .B0(intDY[7]), .B1(n352), .Y(n343) );
  INVX2TS U335 ( .A(intDY[2]), .Y(n305) );
  AOI22X1TS U336 ( .A0(intDX[3]), .A1(n299), .B0(intDX[2]), .B1(n305), .Y(n330) );
  INVX2TS U337 ( .A(intDY[1]), .Y(n323) );
  INVX2TS U338 ( .A(intDY[0]), .Y(n386) );
  AOI22X1TS U339 ( .A0(intDX[1]), .A1(n323), .B0(intDX[0]), .B1(n386), .Y(n331) );
  INVX2TS U340 ( .A(intDX[1]), .Y(n275) );
  INVX2TS U341 ( .A(intDX[2]), .Y(n312) );
  AOI22X1TS U342 ( .A0(intDY[1]), .A1(n275), .B0(intDY[2]), .B1(n312), .Y(n215) );
  OAI21XLTS U343 ( .A0(intDX[3]), .A1(n299), .B0(n215), .Y(n377) );
  OAI22X1TS U344 ( .A0(n216), .A1(n330), .B0(n331), .B1(n377), .Y(n218) );
  INVX2TS U345 ( .A(intDY[4]), .Y(n257) );
  NAND2X1TS U346 ( .A(intDX[4]), .B(n257), .Y(n338) );
  AOI222XLTS U347 ( .A0(intDY[5]), .A1(n358), .B0(intDY[5]), .B1(n338), .C0(
        n358), .C1(n338), .Y(n217) );
  AOI32X1TS U348 ( .A0(n344), .A1(n343), .A2(n218), .B0(n217), .B1(n343), .Y(
        n221) );
  INVX2TS U349 ( .A(intDX[10]), .Y(n394) );
  INVX2TS U350 ( .A(intDX[8]), .Y(n277) );
  AOI22X1TS U351 ( .A0(intDY[10]), .A1(n394), .B0(intDY[8]), .B1(n277), .Y(
        n220) );
  INVX2TS U352 ( .A(intDY[9]), .Y(n255) );
  NOR2XLTS U353 ( .A(n255), .B(intDX[9]), .Y(n223) );
  INVX2TS U354 ( .A(n223), .Y(n219) );
  OAI211XLTS U355 ( .A0(intDX[11]), .A1(n259), .B0(n220), .C0(n219), .Y(n376)
         );
  AOI32X1TS U356 ( .A0(n222), .A1(n337), .A2(n221), .B0(n376), .B1(n337), .Y(
        n229) );
  INVX2TS U357 ( .A(intDX[11]), .Y(n285) );
  NAND2X1TS U358 ( .A(intDY[11]), .B(n285), .Y(n228) );
  INVX2TS U359 ( .A(n332), .Y(n224) );
  INVX2TS U360 ( .A(intDY[8]), .Y(n320) );
  NAND2X1TS U361 ( .A(intDX[8]), .B(n320), .Y(n334) );
  NAND2X1TS U362 ( .A(intDX[9]), .B(n255), .Y(n333) );
  OAI32X1TS U363 ( .A0(n224), .A1(n223), .A2(n334), .B0(n333), .B1(n224), .Y(
        n225) );
  AOI21X1TS U364 ( .A0(intDX[10]), .A1(n332), .B0(n225), .Y(n226) );
  OAI2BB2XLTS U365 ( .B0(intDY[10]), .B1(n226), .A0N(intDX[10]), .A1N(n225), 
        .Y(n227) );
  AOI22X1TS U366 ( .A0(n332), .A1(n229), .B0(n228), .B1(n227), .Y(n230) );
  NAND2X1TS U367 ( .A(intDX[15]), .B(n399), .Y(n342) );
  OAI211XLTS U368 ( .A0(n232), .A1(n231), .B0(n230), .C0(n342), .Y(n233) );
  AOI22X1TS U369 ( .A0(n235), .A1(n234), .B0(n373), .B1(n233), .Y(n236) );
  OAI211XLTS U370 ( .A0(n239), .A1(n238), .B0(n237), .C0(n236), .Y(n250) );
  INVX2TS U371 ( .A(intDX[25]), .Y(n350) );
  INVX2TS U372 ( .A(intDY[24]), .Y(n263) );
  INVX2TS U373 ( .A(intDX[27]), .Y(n357) );
  INVX2TS U374 ( .A(intDX[26]), .Y(n292) );
  AOI22X1TS U375 ( .A0(intDY[27]), .A1(n357), .B0(intDY[26]), .B1(n292), .Y(
        n244) );
  AOI211XLTS U376 ( .A0(intDY[28]), .A1(n388), .B0(n241), .C0(n240), .Y(n248)
         );
  OAI211XLTS U377 ( .A0(intDX[24]), .A1(n263), .B0(n244), .C0(n248), .Y(n242)
         );
  AOI21X1TS U378 ( .A0(intDY[25]), .A1(n350), .B0(n242), .Y(n372) );
  INVX2TS U379 ( .A(intDY[25]), .Y(n269) );
  INVX2TS U380 ( .A(intDX[24]), .Y(n289) );
  NAND2X1TS U381 ( .A(intDY[25]), .B(n350), .Y(n243) );
  AOI22X1TS U382 ( .A0(intDX[25]), .A1(n269), .B0(n369), .B1(n243), .Y(n247)
         );
  INVX2TS U383 ( .A(n244), .Y(n246) );
  NOR2XLTS U384 ( .A(intDY[26]), .B(n292), .Y(n368) );
  INVX2TS U385 ( .A(intDY[27]), .Y(n273) );
  AOI222XLTS U386 ( .A0(intDX[27]), .A1(n368), .B0(intDX[27]), .B1(n273), .C0(
        n368), .C1(n273), .Y(n245) );
  OAI21XLTS U387 ( .A0(n247), .A1(n246), .B0(n245), .Y(n249) );
  AOI222XLTS U388 ( .A0(n252), .A1(n251), .B0(n250), .B1(n372), .C0(n249), 
        .C1(n248), .Y(n378) );
  INVX2TS U389 ( .A(n409), .Y(n322) );
  INVX2TS U390 ( .A(load_b_i), .Y(n403) );
  CLKBUFX2TS U391 ( .A(n403), .Y(n406) );
  INVX2TS U392 ( .A(n398), .Y(n407) );
  AOI22X1TS U393 ( .A0(n407), .A1(intDX[3]), .B0(DMP_o[3]), .B1(n403), .Y(n253) );
  AOI22X1TS U394 ( .A0(n407), .A1(intDX[9]), .B0(DMP_o[9]), .B1(n403), .Y(n254) );
  INVX2TS U395 ( .A(n398), .Y(n404) );
  AOI22X1TS U396 ( .A0(n404), .A1(intDX[4]), .B0(DMP_o[4]), .B1(n403), .Y(n256) );
  AOI22X1TS U397 ( .A0(n407), .A1(intDX[11]), .B0(DMP_o[11]), .B1(n403), .Y(
        n258) );
  AOI22X1TS U398 ( .A0(n404), .A1(intDX[17]), .B0(DMP_o[17]), .B1(n403), .Y(
        n260) );
  AOI22X1TS U399 ( .A0(n407), .A1(intDX[24]), .B0(DMP_o[24]), .B1(n403), .Y(
        n262) );
  AOI22X1TS U400 ( .A0(n404), .A1(intDX[7]), .B0(DMP_o[7]), .B1(n403), .Y(n264) );
  AOI22X1TS U401 ( .A0(n407), .A1(intDX[13]), .B0(DMP_o[13]), .B1(n403), .Y(
        n266) );
  AOI22X1TS U402 ( .A0(n407), .A1(intDX[15]), .B0(DMP_o[15]), .B1(n403), .Y(
        n267) );
  AOI22X1TS U403 ( .A0(n404), .A1(intDX[25]), .B0(DMP_o[25]), .B1(n403), .Y(
        n268) );
  AOI22X1TS U404 ( .A0(n404), .A1(intDY[5]), .B0(DmP_o[5]), .B1(n403), .Y(n270) );
  AOI22X1TS U405 ( .A0(n407), .A1(intDY[28]), .B0(DmP_o[28]), .B1(n403), .Y(
        n271) );
  AOI22X1TS U406 ( .A0(n407), .A1(intDX[27]), .B0(DMP_o[27]), .B1(n403), .Y(
        n272) );
  AOI22X1TS U407 ( .A0(n404), .A1(intDY[1]), .B0(DmP_o[1]), .B1(n403), .Y(n274) );
  AOI22X1TS U408 ( .A0(n404), .A1(intDY[8]), .B0(DmP_o[8]), .B1(n403), .Y(n276) );
  AOI22X1TS U409 ( .A0(n404), .A1(intDX[29]), .B0(DMP_o[29]), .B1(n403), .Y(
        n278) );
  AOI22X1TS U410 ( .A0(n404), .A1(intDY[10]), .B0(DmP_o[10]), .B1(n403), .Y(
        n279) );
  AOI22X1TS U411 ( .A0(n407), .A1(intDY[26]), .B0(DmP_o[26]), .B1(n403), .Y(
        n280) );
  AOI22X1TS U412 ( .A0(n404), .A1(intDY[18]), .B0(DmP_o[18]), .B1(n403), .Y(
        n281) );
  AOI22X1TS U413 ( .A0(n404), .A1(intDY[17]), .B0(DmP_o[17]), .B1(n403), .Y(
        n283) );
  AOI22X1TS U414 ( .A0(n404), .A1(intDY[11]), .B0(DmP_o[11]), .B1(n403), .Y(
        n284) );
  AOI22X1TS U415 ( .A0(n407), .A1(intDY[22]), .B0(DmP_o[22]), .B1(n403), .Y(
        n286) );
  AOI22X1TS U416 ( .A0(n407), .A1(intDY[24]), .B0(DmP_o[24]), .B1(n403), .Y(
        n288) );
  AOI22X1TS U417 ( .A0(n409), .A1(intDX[16]), .B0(DmP_o[16]), .B1(n403), .Y(
        n290) );
  AOI22X1TS U418 ( .A0(n409), .A1(intDY[26]), .B0(DMP_o[26]), .B1(n403), .Y(
        n291) );
  AOI22X1TS U419 ( .A0(n409), .A1(intDY[21]), .B0(DMP_o[21]), .B1(n403), .Y(
        n293) );
  AOI22X1TS U420 ( .A0(n409), .A1(intDY[5]), .B0(DMP_o[5]), .B1(n403), .Y(n294) );
  AOI22X1TS U421 ( .A0(n409), .A1(intDX[29]), .B0(DmP_o[29]), .B1(n403), .Y(
        n295) );
  AOI22X1TS U422 ( .A0(n409), .A1(intDY[19]), .B0(DMP_o[19]), .B1(n403), .Y(
        n297) );
  AOI22X1TS U423 ( .A0(n409), .A1(intDX[3]), .B0(DmP_o[3]), .B1(n403), .Y(n298) );
  AOI22X1TS U424 ( .A0(n404), .A1(intDY[6]), .B0(DmP_o[6]), .B1(n406), .Y(n300) );
  AOI22X1TS U425 ( .A0(n404), .A1(intDY[4]), .B0(DmP_o[4]), .B1(n406), .Y(n301) );
  AOI22X1TS U426 ( .A0(n404), .A1(intDX[23]), .B0(DMP_o[23]), .B1(n406), .Y(
        n303) );
  AOI22X1TS U427 ( .A0(n404), .A1(intDX[2]), .B0(DMP_o[2]), .B1(n406), .Y(n304) );
  AOI22X1TS U428 ( .A0(n404), .A1(intDY[7]), .B0(DmP_o[7]), .B1(n406), .Y(n306) );
  AOI22X1TS U429 ( .A0(n407), .A1(intDX[16]), .B0(DMP_o[16]), .B1(n406), .Y(
        n307) );
  AOI22X1TS U430 ( .A0(n407), .A1(intDX[22]), .B0(DMP_o[22]), .B1(n406), .Y(
        n309) );
  AOI22X1TS U431 ( .A0(n407), .A1(intDY[2]), .B0(DmP_o[2]), .B1(n406), .Y(n311) );
  AOI22X1TS U432 ( .A0(n407), .A1(intDX[30]), .B0(DMP_o[30]), .B1(n406), .Y(
        n313) );
  AOI22X1TS U433 ( .A0(n407), .A1(intDX[14]), .B0(DMP_o[14]), .B1(n406), .Y(
        n315) );
  AOI22X1TS U434 ( .A0(n404), .A1(intDX[20]), .B0(DMP_o[20]), .B1(n406), .Y(
        n316) );
  AOI22X1TS U435 ( .A0(n407), .A1(intDX[18]), .B0(DMP_o[18]), .B1(n406), .Y(
        n317) );
  AOI22X1TS U436 ( .A0(n407), .A1(intDX[8]), .B0(DMP_o[8]), .B1(n406), .Y(n319) );
  AOI22X1TS U437 ( .A0(n407), .A1(intDX[1]), .B0(DMP_o[1]), .B1(n406), .Y(n321) );
  AOI22X1TS U438 ( .A0(n407), .A1(intDY[25]), .B0(DmP_o[25]), .B1(n406), .Y(
        n324) );
  AOI22X1TS U439 ( .A0(n404), .A1(intDY[19]), .B0(DmP_o[19]), .B1(n406), .Y(
        n325) );
  AOI22X1TS U440 ( .A0(n407), .A1(intDY[27]), .B0(DmP_o[27]), .B1(n406), .Y(
        n326) );
  AOI22X1TS U441 ( .A0(n404), .A1(intDY[21]), .B0(DmP_o[21]), .B1(n406), .Y(
        n327) );
  AOI22X1TS U442 ( .A0(n404), .A1(intDY[12]), .B0(DmP_o[12]), .B1(n406), .Y(
        n328) );
  AOI22X1TS U443 ( .A0(n407), .A1(intDX[0]), .B0(DMP_o[0]), .B1(n406), .Y(n329) );
  NAND3XLTS U444 ( .A(n332), .B(n331), .C(n330), .Y(n375) );
  NAND3XLTS U445 ( .A(n335), .B(n334), .C(n333), .Y(n348) );
  NAND3XLTS U446 ( .A(n338), .B(n337), .C(n336), .Y(n347) );
  NAND2X1TS U447 ( .A(intDX[14]), .B(n339), .Y(n341) );
  NAND4BXLTS U448 ( .AN(n345), .B(n344), .C(n343), .D(n342), .Y(n346) );
  NOR4XLTS U449 ( .A(n349), .B(n348), .C(n347), .D(n346), .Y(n371) );
  OAI22X1TS U450 ( .A0(intDY[28]), .A1(n388), .B0(intDY[25]), .B1(n350), .Y(
        n367) );
  OAI22X1TS U451 ( .A0(intDY[7]), .A1(n352), .B0(intDY[21]), .B1(n351), .Y(
        n353) );
  AOI21X1TS U452 ( .A0(intDX[23]), .A1(n384), .B0(n353), .Y(n365) );
  OAI22X1TS U453 ( .A0(intDY[5]), .A1(n358), .B0(intDY[27]), .B1(n357), .Y(
        n361) );
  OAI22X1TS U454 ( .A0(intDX[0]), .A1(n386), .B0(intDY[19]), .B1(n359), .Y(
        n360) );
  NOR4XLTS U455 ( .A(n363), .B(n362), .C(n361), .D(n360), .Y(n364) );
  NOR4XLTS U456 ( .A(n369), .B(n368), .C(n367), .D(n366), .Y(n370) );
  NAND4XLTS U457 ( .A(n373), .B(n372), .C(n371), .D(n370), .Y(n374) );
  NOR4XLTS U458 ( .A(n377), .B(n376), .C(n375), .D(n374), .Y(n401) );
  XNOR2X1TS U459 ( .A(intDY[31]), .B(intAS), .Y(n400) );
  AOI21X1TS U460 ( .A0(n378), .A1(n400), .B0(n406), .Y(n379) );
  AOI22X1TS U461 ( .A0(intDX[31]), .A1(n379), .B0(sign_final_result_o), .B1(
        n403), .Y(n380) );
  OAI31X1TS U462 ( .A0(n401), .A1(n322), .A2(n400), .B0(n380), .Y(n168) );
  AOI22X1TS U463 ( .A0(n409), .A1(intDX[20]), .B0(DmP_o[20]), .B1(n406), .Y(
        n381) );
  AOI22X1TS U464 ( .A0(n409), .A1(intDX[23]), .B0(DmP_o[23]), .B1(n406), .Y(
        n383) );
  AOI22X1TS U465 ( .A0(n409), .A1(intDX[0]), .B0(DmP_o[0]), .B1(n406), .Y(n385) );
  AOI22X1TS U466 ( .A0(n409), .A1(intDY[28]), .B0(DMP_o[28]), .B1(n406), .Y(
        n387) );
  AOI22X1TS U467 ( .A0(n409), .A1(intDY[6]), .B0(DMP_o[6]), .B1(n406), .Y(n389) );
  AOI22X1TS U468 ( .A0(n409), .A1(intDY[12]), .B0(DMP_o[12]), .B1(n406), .Y(
        n391) );
  AOI22X1TS U469 ( .A0(n409), .A1(intDY[10]), .B0(DMP_o[10]), .B1(n406), .Y(
        n393) );
  AOI22X1TS U470 ( .A0(n409), .A1(intDX[13]), .B0(DmP_o[13]), .B1(n406), .Y(
        n395) );
  AOI22X1TS U471 ( .A0(n409), .A1(intDX[15]), .B0(DmP_o[15]), .B1(n406), .Y(
        n397) );
  XNOR2X1TS U472 ( .A(intDX[31]), .B(n400), .Y(real_op_o) );
  CLKAND2X2TS U473 ( .A(n401), .B(real_op_o), .Y(zero_flag_o) );
  AOI22X1TS U474 ( .A0(n404), .A1(intDY[9]), .B0(DmP_o[9]), .B1(n406), .Y(n402) );
  OAI2BB1X1TS U475 ( .A0N(intDX[9]), .A1N(n409), .B0(n402), .Y(n158) );
  AOI22X1TS U476 ( .A0(n404), .A1(intDY[14]), .B0(DmP_o[14]), .B1(n403), .Y(
        n405) );
  OAI2BB1X1TS U477 ( .A0N(intDX[14]), .A1N(n409), .B0(n405), .Y(n153) );
  AOI22X1TS U478 ( .A0(n407), .A1(intDY[30]), .B0(DmP_o[30]), .B1(n406), .Y(
        n408) );
  OAI2BB1X1TS U479 ( .A0N(intDX[30]), .A1N(n409), .B0(n408), .Y(n137) );
  
  initial $sdf_annotate("Oper_Start_In_2_syn.sdf");
endmodule

