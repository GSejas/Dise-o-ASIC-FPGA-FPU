/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Oct 18 20:48:19 2016
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
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434;

  DFFRXLTS MRegister_Q_reg_0_ ( .D(n199), .CK(clk), .RN(n429), .Q(DMP_o[0]) );
  DFFRXLTS MRegister_Q_reg_1_ ( .D(n198), .CK(clk), .RN(n429), .Q(DMP_o[1]) );
  DFFRXLTS MRegister_Q_reg_2_ ( .D(n197), .CK(clk), .RN(n429), .Q(DMP_o[2]) );
  DFFRXLTS MRegister_Q_reg_3_ ( .D(n196), .CK(clk), .RN(n429), .Q(DMP_o[3]) );
  DFFRXLTS MRegister_Q_reg_4_ ( .D(n195), .CK(clk), .RN(n429), .Q(DMP_o[4]) );
  DFFRXLTS MRegister_Q_reg_5_ ( .D(n194), .CK(clk), .RN(n429), .Q(DMP_o[5]) );
  DFFRXLTS MRegister_Q_reg_6_ ( .D(n193), .CK(clk), .RN(n429), .Q(DMP_o[6]) );
  DFFRXLTS MRegister_Q_reg_7_ ( .D(n192), .CK(clk), .RN(n429), .Q(DMP_o[7]) );
  DFFRXLTS MRegister_Q_reg_8_ ( .D(n191), .CK(clk), .RN(n429), .Q(DMP_o[8]) );
  DFFRXLTS MRegister_Q_reg_9_ ( .D(n190), .CK(clk), .RN(n430), .Q(DMP_o[9]) );
  DFFRXLTS MRegister_Q_reg_10_ ( .D(n189), .CK(clk), .RN(n430), .Q(DMP_o[10])
         );
  DFFRXLTS MRegister_Q_reg_11_ ( .D(n188), .CK(clk), .RN(n430), .Q(DMP_o[11])
         );
  DFFRXLTS MRegister_Q_reg_12_ ( .D(n187), .CK(clk), .RN(n430), .Q(DMP_o[12])
         );
  DFFRXLTS MRegister_Q_reg_13_ ( .D(n186), .CK(clk), .RN(n430), .Q(DMP_o[13])
         );
  DFFRXLTS MRegister_Q_reg_14_ ( .D(n185), .CK(clk), .RN(n430), .Q(DMP_o[14])
         );
  DFFRXLTS MRegister_Q_reg_15_ ( .D(n184), .CK(clk), .RN(n430), .Q(DMP_o[15])
         );
  DFFRXLTS MRegister_Q_reg_16_ ( .D(n183), .CK(clk), .RN(n430), .Q(DMP_o[16])
         );
  DFFRXLTS MRegister_Q_reg_17_ ( .D(n182), .CK(clk), .RN(n430), .Q(DMP_o[17])
         );
  DFFRXLTS MRegister_Q_reg_18_ ( .D(n181), .CK(clk), .RN(n430), .Q(DMP_o[18])
         );
  DFFRXLTS MRegister_Q_reg_19_ ( .D(n180), .CK(clk), .RN(n431), .Q(DMP_o[19])
         );
  DFFRXLTS MRegister_Q_reg_20_ ( .D(n179), .CK(clk), .RN(n431), .Q(DMP_o[20])
         );
  DFFRXLTS MRegister_Q_reg_21_ ( .D(n178), .CK(clk), .RN(n431), .Q(DMP_o[21])
         );
  DFFRXLTS MRegister_Q_reg_22_ ( .D(n177), .CK(clk), .RN(n431), .Q(DMP_o[22])
         );
  DFFRXLTS MRegister_Q_reg_23_ ( .D(n176), .CK(clk), .RN(n431), .Q(DMP_o[23])
         );
  DFFRXLTS MRegister_Q_reg_24_ ( .D(n175), .CK(clk), .RN(n431), .Q(DMP_o[24])
         );
  DFFRXLTS MRegister_Q_reg_25_ ( .D(n174), .CK(clk), .RN(n431), .Q(DMP_o[25])
         );
  DFFRXLTS MRegister_Q_reg_26_ ( .D(n173), .CK(clk), .RN(n431), .Q(DMP_o[26])
         );
  DFFRXLTS MRegister_Q_reg_27_ ( .D(n172), .CK(clk), .RN(n431), .Q(DMP_o[27])
         );
  DFFRXLTS MRegister_Q_reg_28_ ( .D(n171), .CK(clk), .RN(n431), .Q(DMP_o[28])
         );
  DFFRXLTS MRegister_Q_reg_29_ ( .D(n170), .CK(clk), .RN(n432), .Q(DMP_o[29])
         );
  DFFRXLTS MRegister_Q_reg_30_ ( .D(n169), .CK(clk), .RN(n432), .Q(DMP_o[30])
         );
  DFFRXLTS SignRegister_Q_reg_0_ ( .D(n168), .CK(clk), .RN(n432), .Q(
        sign_final_result_o) );
  DFFRXLTS mRegister_Q_reg_0_ ( .D(n167), .CK(clk), .RN(n432), .Q(DmP_o[0]) );
  DFFRXLTS mRegister_Q_reg_1_ ( .D(n166), .CK(clk), .RN(n432), .Q(DmP_o[1]) );
  DFFRXLTS mRegister_Q_reg_2_ ( .D(n165), .CK(clk), .RN(n432), .Q(DmP_o[2]) );
  DFFRXLTS mRegister_Q_reg_3_ ( .D(n164), .CK(clk), .RN(n432), .Q(DmP_o[3]) );
  DFFRXLTS mRegister_Q_reg_4_ ( .D(n163), .CK(clk), .RN(n432), .Q(DmP_o[4]) );
  DFFRXLTS mRegister_Q_reg_5_ ( .D(n162), .CK(clk), .RN(n432), .Q(DmP_o[5]) );
  DFFRXLTS mRegister_Q_reg_6_ ( .D(n161), .CK(clk), .RN(n432), .Q(DmP_o[6]) );
  DFFRXLTS mRegister_Q_reg_7_ ( .D(n160), .CK(clk), .RN(n433), .Q(DmP_o[7]) );
  DFFRXLTS mRegister_Q_reg_8_ ( .D(n159), .CK(clk), .RN(n433), .Q(DmP_o[8]) );
  DFFRXLTS mRegister_Q_reg_9_ ( .D(n158), .CK(clk), .RN(n433), .Q(DmP_o[9]) );
  DFFRXLTS mRegister_Q_reg_10_ ( .D(n157), .CK(clk), .RN(n433), .Q(DmP_o[10])
         );
  DFFRXLTS mRegister_Q_reg_11_ ( .D(n156), .CK(clk), .RN(n433), .Q(DmP_o[11])
         );
  DFFRXLTS mRegister_Q_reg_12_ ( .D(n155), .CK(clk), .RN(n433), .Q(DmP_o[12])
         );
  DFFRXLTS mRegister_Q_reg_13_ ( .D(n154), .CK(clk), .RN(n433), .Q(DmP_o[13])
         );
  DFFRXLTS mRegister_Q_reg_14_ ( .D(n153), .CK(clk), .RN(n433), .Q(DmP_o[14])
         );
  DFFRXLTS mRegister_Q_reg_15_ ( .D(n152), .CK(clk), .RN(n433), .Q(DmP_o[15])
         );
  DFFRXLTS mRegister_Q_reg_16_ ( .D(n151), .CK(clk), .RN(n433), .Q(DmP_o[16])
         );
  DFFRXLTS mRegister_Q_reg_17_ ( .D(n150), .CK(clk), .RN(n136), .Q(DmP_o[17])
         );
  DFFRXLTS mRegister_Q_reg_18_ ( .D(n149), .CK(clk), .RN(n136), .Q(DmP_o[18])
         );
  DFFRXLTS mRegister_Q_reg_19_ ( .D(n148), .CK(clk), .RN(n136), .Q(DmP_o[19])
         );
  DFFRXLTS mRegister_Q_reg_20_ ( .D(n147), .CK(clk), .RN(n434), .Q(DmP_o[20])
         );
  DFFRXLTS mRegister_Q_reg_21_ ( .D(n146), .CK(clk), .RN(n434), .Q(DmP_o[21])
         );
  DFFRXLTS mRegister_Q_reg_22_ ( .D(n145), .CK(clk), .RN(n434), .Q(DmP_o[22])
         );
  DFFRXLTS mRegister_Q_reg_23_ ( .D(n144), .CK(clk), .RN(n434), .Q(DmP_o[23])
         );
  DFFRXLTS mRegister_Q_reg_24_ ( .D(n143), .CK(clk), .RN(n434), .Q(DmP_o[24])
         );
  DFFRXLTS mRegister_Q_reg_25_ ( .D(n142), .CK(clk), .RN(n434), .Q(DmP_o[25])
         );
  DFFRXLTS mRegister_Q_reg_26_ ( .D(n141), .CK(clk), .RN(n434), .Q(DmP_o[26])
         );
  DFFRXLTS mRegister_Q_reg_27_ ( .D(n140), .CK(clk), .RN(n434), .Q(DmP_o[27])
         );
  DFFRXLTS mRegister_Q_reg_28_ ( .D(n139), .CK(clk), .RN(n434), .Q(DmP_o[28])
         );
  DFFRXLTS mRegister_Q_reg_29_ ( .D(n138), .CK(clk), .RN(n434), .Q(DmP_o[29])
         );
  DFFRXLTS mRegister_Q_reg_30_ ( .D(n137), .CK(clk), .RN(n429), .Q(DmP_o[30])
         );
  NAND2BXLTS U204 ( .AN(intDX[27]), .B(intDY[27]), .Y(n204) );
  NOR2XLTS U205 ( .A(n265), .B(intDX[17]), .Y(n264) );
  OAI211XLTS U206 ( .A0(intDX[12]), .A1(n217), .B0(n251), .C0(n216), .Y(n255)
         );
  NAND2BXLTS U207 ( .AN(intDX[13]), .B(intDY[13]), .Y(n216) );
  NAND2BXLTS U208 ( .AN(intDX[21]), .B(intDY[21]), .Y(n257) );
  OA22X1TS U209 ( .A0(n256), .A1(intDX[22]), .B0(n272), .B1(intDX[23]), .Y(
        n277) );
  AOI222XLTS U210 ( .A0(intDY[4]), .A1(n229), .B0(n228), .B1(n227), .C0(
        intDY[5]), .C1(n226), .Y(n233) );
  AOI2BB2XLTS U211 ( .B0(intDX[3]), .B1(n225), .A0N(intDY[2]), .A1N(n224), .Y(
        n227) );
  OAI211XLTS U212 ( .A0(n225), .A1(intDX[3]), .B0(n223), .C0(n222), .Y(n228)
         );
  NAND2BXLTS U213 ( .AN(intDX[9]), .B(intDY[9]), .Y(n239) );
  NAND2BXLTS U214 ( .AN(intDX[19]), .B(intDY[19]), .Y(n268) );
  NOR2XLTS U215 ( .A(intDY[24]), .B(n280), .Y(n203) );
  AOI211XLTS U216 ( .A0(n251), .A1(n250), .B0(n249), .C0(n248), .Y(n252) );
  OAI211XLTS U217 ( .A0(intDX[8]), .A1(n240), .B0(n239), .C0(n243), .Y(n253)
         );
  AOI221XLTS U218 ( .A0(n267), .A1(intDX[18]), .B0(intDX[19]), .B1(n416), .C0(
        n309), .Y(n312) );
  AOI221XLTS U219 ( .A0(n258), .A1(intDX[20]), .B0(intDX[21]), .B1(n262), .C0(
        n310), .Y(n311) );
  AOI221XLTS U220 ( .A0(n412), .A1(intDX[14]), .B0(intDX[15]), .B1(n246), .C0(
        n307), .Y(n314) );
  AOI221XLTS U221 ( .A0(n409), .A1(intDX[10]), .B0(intDX[11]), .B1(n407), .C0(
        n301), .Y(n304) );
  AOI221XLTS U222 ( .A0(n217), .A1(intDX[12]), .B0(intDX[13]), .B1(n425), .C0(
        n302), .Y(n303) );
  AOI221XLTS U223 ( .A0(n240), .A1(intDX[8]), .B0(intDX[9]), .B1(n374), .C0(
        n300), .Y(n305) );
  AOI221XLTS U224 ( .A0(n369), .A1(intDX[6]), .B0(intDX[7]), .B1(n382), .C0(
        n299), .Y(n306) );
  AOI221XLTS U225 ( .A0(n378), .A1(intDX[2]), .B0(intDX[3]), .B1(n225), .C0(
        n293), .Y(n297) );
  AOI221XLTS U226 ( .A0(n380), .A1(intDX[4]), .B0(intDX[5]), .B1(n372), .C0(
        n294), .Y(n296) );
  AOI221XLTS U227 ( .A0(n352), .A1(intDX[0]), .B0(intDX[1]), .B1(n220), .C0(
        n292), .Y(n298) );
  AOI2BB2XLTS U228 ( .B0(intDX[30]), .B1(n212), .A0N(n212), .A1N(intDX[30]), 
        .Y(n295) );
  NAND4XLTS U229 ( .A(n322), .B(n321), .C(n320), .D(n319), .Y(n323) );
  AOI221XLTS U230 ( .A0(n364), .A1(intDX[27]), .B0(intDX[28]), .B1(n356), .C0(
        n317), .Y(n320) );
  AOI221XLTS U231 ( .A0(n256), .A1(intDX[22]), .B0(intDX[23]), .B1(n272), .C0(
        n315), .Y(n322) );
  AOI221XLTS U232 ( .A0(n202), .A1(intDX[25]), .B0(intDX[26]), .B1(n205), .C0(
        n316), .Y(n321) );
  AOI2BB2XLTS U233 ( .B0(n215), .B1(n279), .A0N(n214), .A1N(n213), .Y(n285) );
  AOI211XLTS U234 ( .A0(n277), .A1(n276), .B0(n275), .C0(n274), .Y(n283) );
  CLKBUFX2TS U235 ( .A(n353), .Y(n405) );
  OAI21XLTS U236 ( .A0(intDX[1]), .A1(n220), .B0(intDX[0]), .Y(n221) );
  NAND2BXLTS U237 ( .AN(intDX[2]), .B(intDY[2]), .Y(n222) );
  OAI21XLTS U238 ( .A0(intDX[3]), .A1(n225), .B0(intDX[2]), .Y(n224) );
  NAND2BXLTS U239 ( .AN(intDY[9]), .B(intDX[9]), .Y(n242) );
  NAND3XLTS U240 ( .A(n240), .B(n239), .C(intDX[8]), .Y(n241) );
  NOR2XLTS U241 ( .A(intDY[10]), .B(n237), .Y(n238) );
  OAI21XLTS U242 ( .A0(intDX[13]), .A1(n425), .B0(intDX[12]), .Y(n236) );
  NOR2XLTS U243 ( .A(n358), .B(intDX[29]), .Y(n209) );
  OAI21XLTS U244 ( .A0(intDX[21]), .A1(n262), .B0(intDX[20]), .Y(n263) );
  OAI21XLTS U245 ( .A0(intDX[23]), .A1(n272), .B0(intDX[22]), .Y(n273) );
  OAI211XLTS U246 ( .A0(n208), .A1(n281), .B0(n207), .C0(n206), .Y(n215) );
  NAND2BXLTS U247 ( .AN(intDY[27]), .B(intDX[27]), .Y(n207) );
  NAND3XLTS U248 ( .A(n205), .B(n204), .C(intDX[26]), .Y(n206) );
  AOI221XLTS U249 ( .A0(intDX[30]), .A1(n212), .B0(intDX[29]), .B1(n358), .C0(
        n211), .Y(n214) );
  NOR3XLTS U250 ( .A(n210), .B(intDY[28]), .C(n209), .Y(n211) );
  NOR2XLTS U251 ( .A(n212), .B(intDX[30]), .Y(n213) );
  NOR2XLTS U252 ( .A(n202), .B(intDX[25]), .Y(n280) );
  OAI21XLTS U253 ( .A0(intDX[26]), .A1(n205), .B0(n204), .Y(n281) );
  AOI211XLTS U254 ( .A0(intDY[28]), .A1(n210), .B0(n213), .C0(n209), .Y(n279)
         );
  NAND2BXLTS U255 ( .AN(intDX[24]), .B(intDY[24]), .Y(n278) );
  NAND3BXLTS U256 ( .AN(n264), .B(n261), .C(n260), .Y(n284) );
  AOI211XLTS U257 ( .A0(intDY[16]), .A1(n259), .B0(n271), .C0(n309), .Y(n260)
         );
  NAND4XLTS U258 ( .A(n298), .B(n297), .C(n296), .D(n295), .Y(n326) );
  NAND4XLTS U259 ( .A(n306), .B(n305), .C(n304), .D(n303), .Y(n325) );
  NAND4XLTS U260 ( .A(n314), .B(n313), .C(n312), .D(n311), .Y(n324) );
  OAI21XLTS U261 ( .A0(n358), .A1(n353), .B0(n287), .Y(n138) );
  OAI21XLTS U262 ( .A0(n356), .A1(n353), .B0(n289), .Y(n139) );
  OAI21XLTS U263 ( .A0(n364), .A1(n405), .B0(n335), .Y(n140) );
  OAI21XLTS U264 ( .A0(n205), .A1(n405), .B0(n334), .Y(n141) );
  OAI21XLTS U265 ( .A0(n202), .A1(n405), .B0(n336), .Y(n142) );
  OAI21XLTS U266 ( .A0(n360), .A1(n405), .B0(n331), .Y(n143) );
  OAI21XLTS U267 ( .A0(n272), .A1(n405), .B0(n337), .Y(n144) );
  OAI21XLTS U268 ( .A0(n256), .A1(n405), .B0(n332), .Y(n145) );
  OAI21XLTS U269 ( .A0(n262), .A1(n405), .B0(n340), .Y(n146) );
  OAI21XLTS U270 ( .A0(n416), .A1(n353), .B0(n291), .Y(n148) );
  OAI21XLTS U271 ( .A0(n267), .A1(n404), .B0(n399), .Y(n149) );
  OAI21XLTS U272 ( .A0(n265), .A1(n404), .B0(n403), .Y(n150) );
  OAI21XLTS U273 ( .A0(n418), .A1(n404), .B0(n390), .Y(n151) );
  OAI21XLTS U274 ( .A0(n246), .A1(n404), .B0(n400), .Y(n152) );
  OAI21XLTS U275 ( .A0(n412), .A1(n404), .B0(n393), .Y(n153) );
  OAI21XLTS U276 ( .A0(n425), .A1(n404), .B0(n398), .Y(n154) );
  OAI21XLTS U277 ( .A0(n217), .A1(n404), .B0(n392), .Y(n155) );
  OAI21XLTS U278 ( .A0(n407), .A1(n404), .B0(n394), .Y(n156) );
  OAI21XLTS U279 ( .A0(n409), .A1(n404), .B0(n391), .Y(n157) );
  OAI21XLTS U280 ( .A0(n374), .A1(n353), .B0(n288), .Y(n158) );
  OAI21XLTS U281 ( .A0(n240), .A1(n353), .B0(n290), .Y(n159) );
  OAI21XLTS U282 ( .A0(n369), .A1(n389), .B0(n343), .Y(n161) );
  OAI21XLTS U283 ( .A0(n372), .A1(n389), .B0(n346), .Y(n162) );
  OAI21XLTS U284 ( .A0(n380), .A1(n389), .B0(n344), .Y(n163) );
  OAI21XLTS U285 ( .A0(n225), .A1(n389), .B0(n341), .Y(n164) );
  OAI21XLTS U286 ( .A0(n378), .A1(n389), .B0(n342), .Y(n165) );
  OAI21XLTS U287 ( .A0(n220), .A1(n389), .B0(n347), .Y(n166) );
  OAI21XLTS U288 ( .A0(n352), .A1(n389), .B0(n345), .Y(n167) );
  OAI21XLTS U289 ( .A0(n366), .A1(n212), .B0(n330), .Y(n169) );
  INVX2TS U290 ( .A(n353), .Y(n329) );
  OAI21XLTS U291 ( .A0(n366), .A1(n358), .B0(n357), .Y(n170) );
  OAI21XLTS U292 ( .A0(n366), .A1(n356), .B0(n355), .Y(n171) );
  OAI21XLTS U293 ( .A0(n366), .A1(n364), .B0(n363), .Y(n172) );
  OAI21XLTS U294 ( .A0(n366), .A1(n205), .B0(n362), .Y(n173) );
  OAI21XLTS U295 ( .A0(n366), .A1(n360), .B0(n359), .Y(n175) );
  OAI21XLTS U296 ( .A0(n426), .A1(n272), .B0(n386), .Y(n176) );
  OAI21XLTS U297 ( .A0(n366), .A1(n256), .B0(n365), .Y(n177) );
  OAI21XLTS U298 ( .A0(n410), .A1(n262), .B0(n354), .Y(n178) );
  OAI21XLTS U299 ( .A0(n426), .A1(n258), .B0(n388), .Y(n179) );
  OAI21XLTS U300 ( .A0(n426), .A1(n416), .B0(n415), .Y(n180) );
  OAI21XLTS U301 ( .A0(n426), .A1(n267), .B0(n414), .Y(n181) );
  OAI21XLTS U302 ( .A0(n426), .A1(n265), .B0(n419), .Y(n182) );
  OAI21XLTS U303 ( .A0(n426), .A1(n418), .B0(n417), .Y(n183) );
  OAI21XLTS U304 ( .A0(n426), .A1(n246), .B0(n413), .Y(n184) );
  OAI21XLTS U305 ( .A0(n426), .A1(n412), .B0(n411), .Y(n185) );
  OAI21XLTS U306 ( .A0(n426), .A1(n425), .B0(n424), .Y(n186) );
  OAI21XLTS U307 ( .A0(n426), .A1(n217), .B0(n421), .Y(n187) );
  OAI21XLTS U308 ( .A0(n410), .A1(n409), .B0(n408), .Y(n189) );
  OAI21XLTS U309 ( .A0(n385), .A1(n374), .B0(n373), .Y(n190) );
  OAI21XLTS U310 ( .A0(n385), .A1(n240), .B0(n375), .Y(n191) );
  OAI21XLTS U311 ( .A0(n385), .A1(n382), .B0(n381), .Y(n192) );
  OAI21XLTS U312 ( .A0(n385), .A1(n369), .B0(n368), .Y(n193) );
  OAI21XLTS U313 ( .A0(n385), .A1(n372), .B0(n371), .Y(n194) );
  OAI21XLTS U314 ( .A0(n385), .A1(n380), .B0(n379), .Y(n195) );
  OAI21XLTS U315 ( .A0(n385), .A1(n225), .B0(n384), .Y(n196) );
  OAI21XLTS U316 ( .A0(n385), .A1(n378), .B0(n377), .Y(n197) );
  OAI21XLTS U317 ( .A0(n385), .A1(n220), .B0(n370), .Y(n198) );
  OAI21XLTS U318 ( .A0(n410), .A1(n352), .B0(n351), .Y(n199) );
  NOR2XLTS U319 ( .A(n407), .B(intDX[11]), .Y(n237) );
  OAI21XLTS U320 ( .A0(intDX[15]), .A1(n246), .B0(intDX[14]), .Y(n247) );
  NOR2XLTS U321 ( .A(intDY[16]), .B(n264), .Y(n266) );
  OAI211XLTS U322 ( .A0(intDX[20]), .A1(n258), .B0(n277), .C0(n257), .Y(n271)
         );
  OAI21XLTS U323 ( .A0(intDX[18]), .A1(n267), .B0(n268), .Y(n309) );
  AOI221XLTS U324 ( .A0(n360), .A1(intDX[24]), .B0(intDX[29]), .B1(n358), .C0(
        n318), .Y(n319) );
  AOI221XLTS U325 ( .A0(n418), .A1(intDX[16]), .B0(intDX[17]), .B1(n265), .C0(
        n308), .Y(n313) );
  OAI21XLTS U326 ( .A0(n427), .A1(n376), .B0(n389), .Y(n327) );
  NOR2XLTS U327 ( .A(n286), .B(n376), .Y(n396) );
  NAND2X1TS U328 ( .A(load_b_i), .B(n286), .Y(n353) );
  CLKBUFX2TS U329 ( .A(n353), .Y(n389) );
  CLKBUFX2TS U330 ( .A(n410), .Y(n366) );
  CLKBUFX2TS U331 ( .A(n410), .Y(n385) );
  OAI21XLTS U332 ( .A0(n212), .A1(n404), .B0(n397), .Y(n137) );
  OAI21XLTS U333 ( .A0(n258), .A1(n405), .B0(n333), .Y(n147) );
  OAI21XLTS U334 ( .A0(n382), .A1(n389), .B0(n350), .Y(n160) );
  OAI21XLTS U335 ( .A0(n366), .A1(n202), .B0(n361), .Y(n174) );
  OAI21XLTS U336 ( .A0(n410), .A1(n407), .B0(n406), .Y(n188) );
  INVX2TS U337 ( .A(intDY[29]), .Y(n358) );
  INVX2TS U338 ( .A(intDY[25]), .Y(n202) );
  AOI22X1TS U339 ( .A0(intDX[24]), .A1(n203), .B0(intDX[25]), .B1(n202), .Y(
        n208) );
  INVX2TS U340 ( .A(intDY[26]), .Y(n205) );
  INVX2TS U341 ( .A(intDX[28]), .Y(n210) );
  INVX2TS U342 ( .A(intDY[30]), .Y(n212) );
  INVX2TS U343 ( .A(intDY[17]), .Y(n265) );
  INVX2TS U344 ( .A(intDY[12]), .Y(n217) );
  INVX2TS U345 ( .A(intDY[15]), .Y(n246) );
  OA22X1TS U346 ( .A0(n412), .A1(intDX[14]), .B0(n246), .B1(intDX[15]), .Y(
        n251) );
  INVX2TS U347 ( .A(intDX[5]), .Y(n226) );
  OAI2BB1X1TS U348 ( .A0N(n226), .A1N(intDY[5]), .B0(intDX[4]), .Y(n218) );
  OAI22X1TS U349 ( .A0(intDY[4]), .A1(n218), .B0(n226), .B1(intDY[5]), .Y(n235) );
  INVX2TS U350 ( .A(intDX[7]), .Y(n231) );
  OAI2BB1X1TS U351 ( .A0N(n231), .A1N(intDY[7]), .B0(intDX[6]), .Y(n219) );
  OAI22X1TS U352 ( .A0(intDY[6]), .A1(n219), .B0(n231), .B1(intDY[7]), .Y(n234) );
  INVX2TS U353 ( .A(intDX[4]), .Y(n229) );
  INVX2TS U354 ( .A(intDY[3]), .Y(n225) );
  INVX2TS U355 ( .A(intDY[1]), .Y(n220) );
  OAI2BB2XLTS U356 ( .B0(intDY[0]), .B1(n221), .A0N(intDX[1]), .A1N(n220), .Y(
        n223) );
  INVX2TS U357 ( .A(intDX[6]), .Y(n230) );
  AOI22X1TS U358 ( .A0(intDY[7]), .A1(n231), .B0(intDY[6]), .B1(n230), .Y(n232) );
  OAI32X1TS U359 ( .A0(n235), .A1(n234), .A2(n233), .B0(n232), .B1(n234), .Y(
        n254) );
  INVX2TS U360 ( .A(intDY[8]), .Y(n240) );
  INVX2TS U361 ( .A(intDY[10]), .Y(n409) );
  INVX2TS U362 ( .A(intDY[11]), .Y(n407) );
  OAI22X1TS U363 ( .A0(n409), .A1(intDX[10]), .B0(n407), .B1(intDX[11]), .Y(
        n301) );
  INVX2TS U364 ( .A(n301), .Y(n243) );
  OAI2BB2XLTS U365 ( .B0(intDY[12]), .B1(n236), .A0N(intDX[13]), .A1N(n425), 
        .Y(n250) );
  AOI22X1TS U366 ( .A0(intDX[10]), .A1(n238), .B0(intDX[11]), .B1(n407), .Y(
        n245) );
  AOI21X1TS U367 ( .A0(n242), .A1(n241), .B0(n255), .Y(n244) );
  OAI2BB2XLTS U368 ( .B0(n245), .B1(n255), .A0N(n244), .A1N(n243), .Y(n249) );
  OAI2BB2XLTS U369 ( .B0(intDY[14]), .B1(n247), .A0N(intDX[15]), .A1N(n246), 
        .Y(n248) );
  OAI31X1TS U370 ( .A0(n255), .A1(n254), .A2(n253), .B0(n252), .Y(n261) );
  INVX2TS U371 ( .A(intDX[16]), .Y(n259) );
  INVX2TS U372 ( .A(intDY[20]), .Y(n258) );
  INVX2TS U373 ( .A(intDY[22]), .Y(n256) );
  INVX2TS U374 ( .A(intDY[23]), .Y(n272) );
  INVX2TS U375 ( .A(intDY[18]), .Y(n267) );
  INVX2TS U376 ( .A(intDY[21]), .Y(n262) );
  OAI2BB2XLTS U377 ( .B0(intDY[20]), .B1(n263), .A0N(intDX[21]), .A1N(n262), 
        .Y(n276) );
  AOI22X1TS U378 ( .A0(intDX[16]), .A1(n266), .B0(intDX[17]), .B1(n265), .Y(
        n270) );
  AOI32X1TS U379 ( .A0(n268), .A1(n267), .A2(intDX[18]), .B0(intDX[19]), .B1(
        n416), .Y(n269) );
  OAI32X1TS U380 ( .A0(n309), .A1(n271), .A2(n270), .B0(n269), .B1(n271), .Y(
        n275) );
  OAI2BB2XLTS U381 ( .B0(intDY[22]), .B1(n273), .A0N(intDX[23]), .A1N(n272), 
        .Y(n274) );
  NAND4BBX1TS U382 ( .AN(n281), .BN(n280), .C(n279), .D(n278), .Y(n282) );
  AOI32X1TS U383 ( .A0(n285), .A1(n284), .A2(n283), .B0(n282), .B1(n285), .Y(
        n286) );
  INVX2TS U384 ( .A(load_b_i), .Y(n367) );
  CLKBUFX2TS U385 ( .A(n367), .Y(n376) );
  INVX2TS U386 ( .A(n396), .Y(n410) );
  INVX2TS U387 ( .A(n410), .Y(n339) );
  CLKBUFX2TS U388 ( .A(n367), .Y(n338) );
  AOI22X1TS U389 ( .A0(intDX[29]), .A1(n339), .B0(DmP_o[29]), .B1(n338), .Y(
        n287) );
  INVX2TS U390 ( .A(intDY[9]), .Y(n374) );
  INVX2TS U391 ( .A(n410), .Y(n349) );
  CLKBUFX2TS U392 ( .A(n367), .Y(n348) );
  AOI22X1TS U393 ( .A0(intDX[9]), .A1(n349), .B0(DmP_o[9]), .B1(n348), .Y(n288) );
  INVX2TS U394 ( .A(intDY[28]), .Y(n356) );
  AOI22X1TS U395 ( .A0(intDX[28]), .A1(n339), .B0(DmP_o[28]), .B1(n338), .Y(
        n289) );
  AOI22X1TS U396 ( .A0(intDX[8]), .A1(n349), .B0(DmP_o[8]), .B1(n348), .Y(n290) );
  INVX2TS U397 ( .A(intDY[19]), .Y(n416) );
  INVX2TS U398 ( .A(n366), .Y(n402) );
  CLKBUFX2TS U399 ( .A(n367), .Y(n401) );
  AOI22X1TS U400 ( .A0(intDX[19]), .A1(n402), .B0(DmP_o[19]), .B1(n401), .Y(
        n291) );
  INVX2TS U401 ( .A(intDY[0]), .Y(n352) );
  OAI22X1TS U402 ( .A0(n352), .A1(intDX[0]), .B0(n220), .B1(intDX[1]), .Y(n292) );
  INVX2TS U403 ( .A(intDY[2]), .Y(n378) );
  OAI22X1TS U404 ( .A0(n378), .A1(intDX[2]), .B0(n225), .B1(intDX[3]), .Y(n293) );
  INVX2TS U405 ( .A(intDY[4]), .Y(n380) );
  INVX2TS U406 ( .A(intDY[5]), .Y(n372) );
  OAI22X1TS U407 ( .A0(n380), .A1(intDX[4]), .B0(n372), .B1(intDX[5]), .Y(n294) );
  INVX2TS U408 ( .A(intDY[6]), .Y(n369) );
  INVX2TS U409 ( .A(intDY[7]), .Y(n382) );
  OAI22X1TS U410 ( .A0(n369), .A1(intDX[6]), .B0(n382), .B1(intDX[7]), .Y(n299) );
  OAI22X1TS U411 ( .A0(n240), .A1(intDX[8]), .B0(n374), .B1(intDX[9]), .Y(n300) );
  INVX2TS U412 ( .A(intDY[13]), .Y(n425) );
  OAI22X1TS U413 ( .A0(n217), .A1(intDX[12]), .B0(n425), .B1(intDX[13]), .Y(
        n302) );
  INVX2TS U414 ( .A(intDY[14]), .Y(n412) );
  OAI22X1TS U415 ( .A0(n412), .A1(intDX[14]), .B0(n246), .B1(intDX[15]), .Y(
        n307) );
  INVX2TS U416 ( .A(intDY[16]), .Y(n418) );
  OAI22X1TS U417 ( .A0(n418), .A1(intDX[16]), .B0(n265), .B1(intDX[17]), .Y(
        n308) );
  OAI22X1TS U418 ( .A0(n258), .A1(intDX[20]), .B0(n262), .B1(intDX[21]), .Y(
        n310) );
  OAI22X1TS U419 ( .A0(n256), .A1(intDX[22]), .B0(n272), .B1(intDX[23]), .Y(
        n315) );
  OAI22X1TS U420 ( .A0(n202), .A1(intDX[25]), .B0(n205), .B1(intDX[26]), .Y(
        n316) );
  INVX2TS U421 ( .A(intDY[27]), .Y(n364) );
  OAI22X1TS U422 ( .A0(n364), .A1(intDX[27]), .B0(n356), .B1(intDX[28]), .Y(
        n317) );
  INVX2TS U423 ( .A(intDY[24]), .Y(n360) );
  OAI22X1TS U424 ( .A0(n360), .A1(intDX[24]), .B0(n358), .B1(intDX[29]), .Y(
        n318) );
  NOR4XLTS U425 ( .A(n326), .B(n325), .C(n324), .D(n323), .Y(n428) );
  XNOR2X1TS U426 ( .A(intDY[31]), .B(intAS), .Y(n427) );
  CLKBUFX2TS U427 ( .A(n367), .Y(n395) );
  AOI22X1TS U428 ( .A0(intDX[31]), .A1(n327), .B0(sign_final_result_o), .B1(
        n395), .Y(n328) );
  OAI31X1TS U429 ( .A0(n428), .A1(n410), .A2(n427), .B0(n328), .Y(n168) );
  INVX2TS U430 ( .A(rst), .Y(n136) );
  CLKBUFX2TS U431 ( .A(n136), .Y(n431) );
  CLKBUFX2TS U432 ( .A(n136), .Y(n432) );
  CLKBUFX2TS U433 ( .A(n136), .Y(n430) );
  CLKBUFX2TS U434 ( .A(n136), .Y(n433) );
  CLKBUFX2TS U435 ( .A(n136), .Y(n429) );
  CLKBUFX2TS U436 ( .A(n136), .Y(n434) );
  AOI22X1TS U437 ( .A0(n329), .A1(intDX[30]), .B0(DMP_o[30]), .B1(n395), .Y(
        n330) );
  AOI22X1TS U438 ( .A0(intDX[24]), .A1(n339), .B0(DmP_o[24]), .B1(n338), .Y(
        n331) );
  AOI22X1TS U439 ( .A0(intDX[22]), .A1(n339), .B0(DmP_o[22]), .B1(n338), .Y(
        n332) );
  AOI22X1TS U440 ( .A0(intDX[20]), .A1(n339), .B0(DmP_o[20]), .B1(n338), .Y(
        n333) );
  AOI22X1TS U441 ( .A0(intDX[26]), .A1(n339), .B0(DmP_o[26]), .B1(n338), .Y(
        n334) );
  AOI22X1TS U442 ( .A0(intDX[27]), .A1(n339), .B0(DmP_o[27]), .B1(n338), .Y(
        n335) );
  AOI22X1TS U443 ( .A0(intDX[25]), .A1(n339), .B0(DmP_o[25]), .B1(n338), .Y(
        n336) );
  AOI22X1TS U444 ( .A0(intDX[23]), .A1(n339), .B0(DmP_o[23]), .B1(n338), .Y(
        n337) );
  AOI22X1TS U445 ( .A0(intDX[21]), .A1(n339), .B0(DmP_o[21]), .B1(n338), .Y(
        n340) );
  AOI22X1TS U446 ( .A0(intDX[3]), .A1(n349), .B0(DmP_o[3]), .B1(n348), .Y(n341) );
  AOI22X1TS U447 ( .A0(intDX[2]), .A1(n349), .B0(DmP_o[2]), .B1(n348), .Y(n342) );
  AOI22X1TS U448 ( .A0(intDX[6]), .A1(n349), .B0(DmP_o[6]), .B1(n348), .Y(n343) );
  AOI22X1TS U449 ( .A0(intDX[4]), .A1(n349), .B0(DmP_o[4]), .B1(n348), .Y(n344) );
  AOI22X1TS U450 ( .A0(intDX[0]), .A1(n349), .B0(DmP_o[0]), .B1(n348), .Y(n345) );
  AOI22X1TS U451 ( .A0(intDX[5]), .A1(n349), .B0(DmP_o[5]), .B1(n348), .Y(n346) );
  AOI22X1TS U452 ( .A0(intDX[1]), .A1(n349), .B0(DmP_o[1]), .B1(n348), .Y(n347) );
  AOI22X1TS U453 ( .A0(intDX[7]), .A1(n349), .B0(DmP_o[7]), .B1(n348), .Y(n350) );
  INVX2TS U454 ( .A(n353), .Y(n383) );
  AOI22X1TS U455 ( .A0(n383), .A1(intDX[0]), .B0(DMP_o[0]), .B1(n376), .Y(n351) );
  INVX2TS U456 ( .A(n353), .Y(n387) );
  CLKBUFX2TS U457 ( .A(n367), .Y(n422) );
  AOI22X1TS U458 ( .A0(n387), .A1(intDX[21]), .B0(DMP_o[21]), .B1(n422), .Y(
        n354) );
  AOI22X1TS U459 ( .A0(n387), .A1(intDX[28]), .B0(DMP_o[28]), .B1(n395), .Y(
        n355) );
  AOI22X1TS U460 ( .A0(n387), .A1(intDX[29]), .B0(DMP_o[29]), .B1(n395), .Y(
        n357) );
  AOI22X1TS U461 ( .A0(n387), .A1(intDX[24]), .B0(DMP_o[24]), .B1(n395), .Y(
        n359) );
  AOI22X1TS U462 ( .A0(n387), .A1(intDX[25]), .B0(DMP_o[25]), .B1(n395), .Y(
        n361) );
  AOI22X1TS U463 ( .A0(n387), .A1(intDX[26]), .B0(DMP_o[26]), .B1(n395), .Y(
        n362) );
  AOI22X1TS U464 ( .A0(n387), .A1(intDX[27]), .B0(DMP_o[27]), .B1(n395), .Y(
        n363) );
  AOI22X1TS U465 ( .A0(n387), .A1(intDX[22]), .B0(DMP_o[22]), .B1(n422), .Y(
        n365) );
  CLKBUFX2TS U466 ( .A(n367), .Y(n420) );
  AOI22X1TS U467 ( .A0(n383), .A1(intDX[6]), .B0(DMP_o[6]), .B1(n420), .Y(n368) );
  AOI22X1TS U468 ( .A0(n383), .A1(intDX[1]), .B0(DMP_o[1]), .B1(n376), .Y(n370) );
  AOI22X1TS U469 ( .A0(n383), .A1(intDX[5]), .B0(DMP_o[5]), .B1(n420), .Y(n371) );
  AOI22X1TS U470 ( .A0(n383), .A1(intDX[9]), .B0(DMP_o[9]), .B1(n420), .Y(n373) );
  AOI22X1TS U471 ( .A0(n383), .A1(intDX[8]), .B0(DMP_o[8]), .B1(n420), .Y(n375) );
  AOI22X1TS U472 ( .A0(n383), .A1(intDX[2]), .B0(DMP_o[2]), .B1(n376), .Y(n377) );
  AOI22X1TS U473 ( .A0(n383), .A1(intDX[4]), .B0(DMP_o[4]), .B1(n420), .Y(n379) );
  AOI22X1TS U474 ( .A0(n383), .A1(intDX[7]), .B0(DMP_o[7]), .B1(n420), .Y(n381) );
  AOI22X1TS U475 ( .A0(n383), .A1(intDX[3]), .B0(DMP_o[3]), .B1(n420), .Y(n384) );
  CLKBUFX2TS U476 ( .A(n385), .Y(n426) );
  AOI22X1TS U477 ( .A0(n387), .A1(intDX[23]), .B0(DMP_o[23]), .B1(n395), .Y(
        n386) );
  AOI22X1TS U478 ( .A0(n387), .A1(intDX[20]), .B0(DMP_o[20]), .B1(n422), .Y(
        n388) );
  CLKBUFX2TS U479 ( .A(n389), .Y(n404) );
  AOI22X1TS U480 ( .A0(intDX[16]), .A1(n402), .B0(DmP_o[16]), .B1(n401), .Y(
        n390) );
  AOI22X1TS U481 ( .A0(intDX[10]), .A1(n402), .B0(DmP_o[10]), .B1(n401), .Y(
        n391) );
  AOI22X1TS U482 ( .A0(intDX[12]), .A1(n402), .B0(DmP_o[12]), .B1(n401), .Y(
        n392) );
  AOI22X1TS U483 ( .A0(intDX[14]), .A1(n402), .B0(DmP_o[14]), .B1(n401), .Y(
        n393) );
  AOI22X1TS U484 ( .A0(intDX[11]), .A1(n402), .B0(DmP_o[11]), .B1(n401), .Y(
        n394) );
  AOI22X1TS U485 ( .A0(intDX[30]), .A1(n396), .B0(DmP_o[30]), .B1(n395), .Y(
        n397) );
  AOI22X1TS U486 ( .A0(intDX[13]), .A1(n402), .B0(DmP_o[13]), .B1(n401), .Y(
        n398) );
  AOI22X1TS U487 ( .A0(intDX[18]), .A1(n402), .B0(DmP_o[18]), .B1(n401), .Y(
        n399) );
  AOI22X1TS U488 ( .A0(intDX[15]), .A1(n402), .B0(DmP_o[15]), .B1(n401), .Y(
        n400) );
  AOI22X1TS U489 ( .A0(intDX[17]), .A1(n402), .B0(DmP_o[17]), .B1(n401), .Y(
        n403) );
  INVX2TS U490 ( .A(n405), .Y(n423) );
  AOI22X1TS U491 ( .A0(n423), .A1(intDX[11]), .B0(DMP_o[11]), .B1(n420), .Y(
        n406) );
  AOI22X1TS U492 ( .A0(n423), .A1(intDX[10]), .B0(DMP_o[10]), .B1(n420), .Y(
        n408) );
  AOI22X1TS U493 ( .A0(n423), .A1(intDX[14]), .B0(DMP_o[14]), .B1(n422), .Y(
        n411) );
  AOI22X1TS U494 ( .A0(n423), .A1(intDX[15]), .B0(DMP_o[15]), .B1(n422), .Y(
        n413) );
  AOI22X1TS U495 ( .A0(n423), .A1(intDX[18]), .B0(DMP_o[18]), .B1(n422), .Y(
        n414) );
  AOI22X1TS U496 ( .A0(n423), .A1(intDX[19]), .B0(DMP_o[19]), .B1(n422), .Y(
        n415) );
  AOI22X1TS U497 ( .A0(n423), .A1(intDX[16]), .B0(DMP_o[16]), .B1(n422), .Y(
        n417) );
  AOI22X1TS U498 ( .A0(n423), .A1(intDX[17]), .B0(DMP_o[17]), .B1(n422), .Y(
        n419) );
  AOI22X1TS U499 ( .A0(n423), .A1(intDX[12]), .B0(DMP_o[12]), .B1(n420), .Y(
        n421) );
  AOI22X1TS U500 ( .A0(n423), .A1(intDX[13]), .B0(DMP_o[13]), .B1(n422), .Y(
        n424) );
  XNOR2X1TS U501 ( .A(intDX[31]), .B(n427), .Y(real_op_o) );
  CLKAND2X2TS U502 ( .A(n428), .B(real_op_o), .Y(zero_flag_o) );
endmodule

