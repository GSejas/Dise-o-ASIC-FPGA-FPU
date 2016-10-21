/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 19 15:08:46 2016
/////////////////////////////////////////////////////////////


module Oper_Start_In_2_W32 ( clk, rst, load_b_i, intAS, intDX, intDY, DMP_o, 
        DmP_o, zero_flag_o, real_op_o, sign_final_result_o );
  input [31:0] intDX;
  input [31:0] intDY;
  output [30:0] DMP_o;
  output [30:0] DmP_o;
  input clk, rst, load_b_i, intAS;
  output zero_flag_o, real_op_o, sign_final_result_o;
  wire   MRegister_n63, MRegister_n61, MRegister_n60, MRegister_n59,
         MRegister_n58, MRegister_n57, MRegister_n56, MRegister_n55,
         MRegister_n54, MRegister_n53, MRegister_n52, MRegister_n51,
         MRegister_n50, MRegister_n49, MRegister_n48, MRegister_n47,
         MRegister_n46, MRegister_n45, MRegister_n44, MRegister_n43,
         MRegister_n42, MRegister_n41, MRegister_n40, MRegister_n39,
         MRegister_n38, MRegister_n37, MRegister_n36, MRegister_n35,
         MRegister_n34, MRegister_n33, MRegister_n32, MRegister_n31,
         MRegister_n30, MRegister_n29, MRegister_n28, MRegister_n27,
         MRegister_n26, MRegister_n25, MRegister_n24, MRegister_n23,
         MRegister_n22, MRegister_n21, MRegister_n20, MRegister_n19,
         MRegister_n18, MRegister_n17, MRegister_n16, MRegister_n15,
         MRegister_n14, MRegister_n13, MRegister_n12, MRegister_n11,
         MRegister_n10, MRegister_n9, MRegister_n8, MRegister_n7, MRegister_n6,
         MRegister_n5, MRegister_n4, MRegister_n3, MRegister_n2, MRegister_n1,
         mRegister_n135, mRegister_n134, mRegister_n133, mRegister_n132,
         mRegister_n131, mRegister_n130, mRegister_n129, mRegister_n128,
         mRegister_n127, mRegister_n126, mRegister_n125, mRegister_n124,
         mRegister_n123, mRegister_n122, mRegister_n121, mRegister_n120,
         mRegister_n119, mRegister_n118, mRegister_n117, mRegister_n116,
         mRegister_n115, mRegister_n114, mRegister_n113, mRegister_n112,
         mRegister_n111, mRegister_n110, mRegister_n109, mRegister_n108,
         mRegister_n107, mRegister_n106, mRegister_n105, mRegister_n104,
         mRegister_n103, mRegister_n102, mRegister_n101, mRegister_n100,
         mRegister_n99, mRegister_n98, mRegister_n97, mRegister_n96,
         mRegister_n95, mRegister_n94, mRegister_n93, mRegister_n92,
         mRegister_n91, mRegister_n90, mRegister_n89, mRegister_n88,
         mRegister_n87, mRegister_n86, mRegister_n85, mRegister_n84,
         mRegister_n83, mRegister_n82, mRegister_n81, mRegister_n80,
         mRegister_n79, mRegister_n78, mRegister_n77, mRegister_n76,
         mRegister_n75, mRegister_n74, SignRegister_n5, SignRegister_n4, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333;

  DFFRXLTS MRegister_Q_reg_0_ ( .D(MRegister_n32), .CK(clk), .RN(n331), .Q(
        DMP_o[0]), .QN(MRegister_n1) );
  DFFRXLTS MRegister_Q_reg_1_ ( .D(MRegister_n33), .CK(clk), .RN(n331), .Q(
        DMP_o[1]), .QN(MRegister_n2) );
  DFFRXLTS MRegister_Q_reg_2_ ( .D(MRegister_n34), .CK(clk), .RN(n331), .Q(
        DMP_o[2]), .QN(MRegister_n3) );
  DFFRXLTS MRegister_Q_reg_3_ ( .D(MRegister_n35), .CK(clk), .RN(n331), .Q(
        DMP_o[3]), .QN(MRegister_n4) );
  DFFRXLTS MRegister_Q_reg_4_ ( .D(MRegister_n36), .CK(clk), .RN(n333), .Q(
        DMP_o[4]), .QN(MRegister_n5) );
  DFFRXLTS MRegister_Q_reg_5_ ( .D(MRegister_n37), .CK(clk), .RN(n331), .Q(
        DMP_o[5]), .QN(MRegister_n6) );
  DFFRXLTS MRegister_Q_reg_7_ ( .D(MRegister_n39), .CK(clk), .RN(n333), .Q(
        DMP_o[7]), .QN(MRegister_n8) );
  DFFRXLTS MRegister_Q_reg_6_ ( .D(MRegister_n38), .CK(clk), .RN(n331), .Q(
        DMP_o[6]), .QN(MRegister_n7) );
  DFFRXLTS MRegister_Q_reg_8_ ( .D(MRegister_n40), .CK(clk), .RN(n333), .Q(
        DMP_o[8]), .QN(MRegister_n9) );
  DFFRXLTS MRegister_Q_reg_9_ ( .D(MRegister_n41), .CK(clk), .RN(n331), .Q(
        DMP_o[9]), .QN(MRegister_n10) );
  DFFRXLTS MRegister_Q_reg_14_ ( .D(MRegister_n46), .CK(clk), .RN(n330), .Q(
        DMP_o[14]), .QN(MRegister_n15) );
  DFFRXLTS MRegister_Q_reg_22_ ( .D(MRegister_n54), .CK(clk), .RN(n329), .Q(
        DMP_o[22]), .QN(MRegister_n23) );
  DFFRXLTS mRegister_Q_reg_6_ ( .D(mRegister_n98), .CK(clk), .RN(n152), .Q(
        DmP_o[6]), .QN(mRegister_n129) );
  DFFRXLTS mRegister_Q_reg_21_ ( .D(mRegister_n83), .CK(clk), .RN(n152), .Q(
        DmP_o[21]), .QN(mRegister_n114) );
  DFFRXLTS MRegister_Q_reg_10_ ( .D(MRegister_n42), .CK(clk), .RN(n330), .Q(
        DMP_o[10]), .QN(MRegister_n11) );
  DFFRXLTS MRegister_Q_reg_11_ ( .D(MRegister_n43), .CK(clk), .RN(n329), .Q(
        DMP_o[11]), .QN(MRegister_n12) );
  DFFRXLTS MRegister_Q_reg_12_ ( .D(MRegister_n44), .CK(clk), .RN(n330), .Q(
        DMP_o[12]), .QN(MRegister_n13) );
  DFFRXLTS MRegister_Q_reg_13_ ( .D(MRegister_n45), .CK(clk), .RN(n329), .Q(
        DMP_o[13]), .QN(MRegister_n14) );
  DFFRXLTS MRegister_Q_reg_15_ ( .D(MRegister_n47), .CK(clk), .RN(n329), .Q(
        DMP_o[15]), .QN(MRegister_n16) );
  DFFRXLTS MRegister_Q_reg_23_ ( .D(MRegister_n55), .CK(clk), .RN(n331), .Q(
        DMP_o[23]), .QN(MRegister_n24) );
  DFFRXLTS MRegister_Q_reg_24_ ( .D(MRegister_n56), .CK(clk), .RN(n330), .Q(
        DMP_o[24]), .QN(MRegister_n25) );
  DFFRXLTS MRegister_Q_reg_25_ ( .D(MRegister_n57), .CK(clk), .RN(n331), .Q(
        DMP_o[25]), .QN(MRegister_n26) );
  DFFRXLTS MRegister_Q_reg_16_ ( .D(MRegister_n48), .CK(clk), .RN(n329), .Q(
        DMP_o[16]), .QN(MRegister_n17) );
  DFFRXLTS MRegister_Q_reg_17_ ( .D(MRegister_n49), .CK(clk), .RN(n329), .Q(
        DMP_o[17]), .QN(MRegister_n18) );
  DFFRXLTS MRegister_Q_reg_18_ ( .D(MRegister_n50), .CK(clk), .RN(n329), .Q(
        DMP_o[18]), .QN(MRegister_n19) );
  DFFRXLTS MRegister_Q_reg_19_ ( .D(MRegister_n51), .CK(clk), .RN(n329), .Q(
        DMP_o[19]), .QN(MRegister_n20) );
  DFFRXLTS MRegister_Q_reg_26_ ( .D(MRegister_n58), .CK(clk), .RN(n329), .Q(
        DMP_o[26]), .QN(MRegister_n27) );
  DFFRXLTS MRegister_Q_reg_27_ ( .D(MRegister_n59), .CK(clk), .RN(n330), .Q(
        DMP_o[27]), .QN(MRegister_n28) );
  DFFRXLTS MRegister_Q_reg_28_ ( .D(MRegister_n60), .CK(clk), .RN(n330), .Q(
        DMP_o[28]), .QN(MRegister_n29) );
  DFFRXLTS MRegister_Q_reg_29_ ( .D(MRegister_n61), .CK(clk), .RN(n330), .Q(
        DMP_o[29]), .QN(MRegister_n30) );
  DFFRXLTS MRegister_Q_reg_20_ ( .D(MRegister_n52), .CK(clk), .RN(n330), .Q(
        DMP_o[20]), .QN(MRegister_n21) );
  DFFRXLTS MRegister_Q_reg_21_ ( .D(MRegister_n53), .CK(clk), .RN(n330), .Q(
        DMP_o[21]), .QN(MRegister_n22) );
  DFFRXLTS MRegister_Q_reg_30_ ( .D(MRegister_n63), .CK(clk), .RN(n330), .Q(
        DMP_o[30]), .QN(MRegister_n31) );
  DFFRXLTS mRegister_Q_reg_23_ ( .D(mRegister_n81), .CK(clk), .RN(n332), .Q(
        DmP_o[23]), .QN(mRegister_n112) );
  DFFRXLTS mRegister_Q_reg_24_ ( .D(mRegister_n80), .CK(clk), .RN(n332), .Q(
        DmP_o[24]), .QN(mRegister_n111) );
  DFFRXLTS mRegister_Q_reg_25_ ( .D(mRegister_n79), .CK(clk), .RN(n332), .Q(
        DmP_o[25]), .QN(mRegister_n110) );
  DFFRXLTS mRegister_Q_reg_26_ ( .D(mRegister_n78), .CK(clk), .RN(n332), .Q(
        DmP_o[26]), .QN(mRegister_n109) );
  DFFRXLTS mRegister_Q_reg_27_ ( .D(mRegister_n77), .CK(clk), .RN(n332), .Q(
        DmP_o[27]), .QN(mRegister_n108) );
  DFFRXLTS mRegister_Q_reg_28_ ( .D(mRegister_n76), .CK(clk), .RN(n332), .Q(
        DmP_o[28]), .QN(mRegister_n107) );
  DFFRXLTS mRegister_Q_reg_29_ ( .D(mRegister_n75), .CK(clk), .RN(n332), .Q(
        DmP_o[29]), .QN(mRegister_n106) );
  DFFRXLTS mRegister_Q_reg_0_ ( .D(mRegister_n104), .CK(clk), .RN(n333), .Q(
        DmP_o[0]), .QN(mRegister_n135) );
  DFFRXLTS mRegister_Q_reg_1_ ( .D(mRegister_n103), .CK(clk), .RN(n333), .Q(
        DmP_o[1]), .QN(mRegister_n134) );
  DFFRXLTS mRegister_Q_reg_2_ ( .D(mRegister_n102), .CK(clk), .RN(n333), .Q(
        DmP_o[2]), .QN(mRegister_n133) );
  DFFRXLTS mRegister_Q_reg_3_ ( .D(mRegister_n101), .CK(clk), .RN(n333), .Q(
        DmP_o[3]), .QN(mRegister_n132) );
  DFFRXLTS mRegister_Q_reg_4_ ( .D(mRegister_n100), .CK(clk), .RN(n152), .Q(
        DmP_o[4]), .QN(mRegister_n131) );
  DFFRXLTS mRegister_Q_reg_5_ ( .D(mRegister_n99), .CK(clk), .RN(n152), .Q(
        DmP_o[5]), .QN(mRegister_n130) );
  DFFRXLTS mRegister_Q_reg_7_ ( .D(mRegister_n97), .CK(clk), .RN(n152), .Q(
        DmP_o[7]), .QN(mRegister_n128) );
  DFFRXLTS mRegister_Q_reg_8_ ( .D(mRegister_n96), .CK(clk), .RN(n152), .Q(
        DmP_o[8]), .QN(mRegister_n127) );
  DFFRXLTS mRegister_Q_reg_9_ ( .D(mRegister_n95), .CK(clk), .RN(n329), .Q(
        DmP_o[9]), .QN(mRegister_n126) );
  DFFRXLTS mRegister_Q_reg_10_ ( .D(mRegister_n94), .CK(clk), .RN(n328), .Q(
        DmP_o[10]), .QN(mRegister_n125) );
  DFFRXLTS mRegister_Q_reg_11_ ( .D(mRegister_n93), .CK(clk), .RN(n328), .Q(
        DmP_o[11]), .QN(mRegister_n124) );
  DFFRXLTS mRegister_Q_reg_12_ ( .D(mRegister_n92), .CK(clk), .RN(n328), .Q(
        DmP_o[12]), .QN(mRegister_n123) );
  DFFRXLTS mRegister_Q_reg_13_ ( .D(mRegister_n91), .CK(clk), .RN(n328), .Q(
        DmP_o[13]), .QN(mRegister_n122) );
  DFFRXLTS mRegister_Q_reg_14_ ( .D(mRegister_n90), .CK(clk), .RN(n328), .Q(
        DmP_o[14]), .QN(mRegister_n121) );
  DFFRXLTS mRegister_Q_reg_15_ ( .D(mRegister_n89), .CK(clk), .RN(n328), .Q(
        DmP_o[15]), .QN(mRegister_n120) );
  DFFRXLTS mRegister_Q_reg_16_ ( .D(mRegister_n88), .CK(clk), .RN(n328), .Q(
        DmP_o[16]), .QN(mRegister_n119) );
  DFFRXLTS mRegister_Q_reg_17_ ( .D(mRegister_n87), .CK(clk), .RN(n328), .Q(
        DmP_o[17]), .QN(mRegister_n118) );
  DFFRXLTS mRegister_Q_reg_18_ ( .D(mRegister_n86), .CK(clk), .RN(n328), .Q(
        DmP_o[18]), .QN(mRegister_n117) );
  DFFRXLTS mRegister_Q_reg_19_ ( .D(mRegister_n85), .CK(clk), .RN(n333), .Q(
        DmP_o[19]), .QN(mRegister_n116) );
  DFFRXLTS mRegister_Q_reg_20_ ( .D(mRegister_n84), .CK(clk), .RN(n152), .Q(
        DmP_o[20]), .QN(mRegister_n115) );
  DFFRXLTS mRegister_Q_reg_22_ ( .D(mRegister_n82), .CK(clk), .RN(n328), .Q(
        DmP_o[22]), .QN(mRegister_n113) );
  DFFRXLTS mRegister_Q_reg_30_ ( .D(mRegister_n74), .CK(clk), .RN(n332), .Q(
        DmP_o[30]), .QN(mRegister_n105) );
  DFFRXLTS SignRegister_Q_reg_0_ ( .D(SignRegister_n4), .CK(clk), .RN(n331), 
        .Q(sign_final_result_o), .QN(SignRegister_n5) );
  AOI211XLTS U218 ( .A0(n224), .A1(n207), .B0(n221), .C0(n225), .Y(n208) );
  OAI211XLTS U219 ( .A0(n206), .A1(n230), .B0(n205), .C0(n222), .Y(n207) );
  AOI211XLTS U220 ( .A0(intDY[5]), .A1(n253), .B0(n175), .C0(n172), .Y(n237)
         );
  OAI211XLTS U221 ( .A0(intDX[4]), .A1(n248), .B0(n171), .C0(n177), .Y(n172)
         );
  OAI221XLTS U222 ( .A0(n272), .A1(intDX[24]), .B0(n318), .B1(intDY[25]), .C0(
        n160), .Y(n169) );
  AOI211XLTS U223 ( .A0(intDY[21]), .A1(n296), .B0(n209), .C0(n159), .Y(n236)
         );
  OAI211XLTS U224 ( .A0(intDX[20]), .A1(n297), .B0(n158), .C0(n211), .Y(n159)
         );
  NOR2XLTS U225 ( .A(n281), .B(intDY[9]), .Y(n188) );
  NOR2XLTS U226 ( .A(n276), .B(intDY[12]), .Y(n199) );
  NOR2XLTS U227 ( .A(intDX[10]), .B(n260), .Y(n194) );
  NAND4BXLTS U228 ( .AN(n200), .B(n202), .C(n197), .D(n192), .Y(n182) );
  AOI211XLTS U229 ( .A0(n170), .A1(n157), .B0(n168), .C0(n162), .Y(n219) );
  XOR2XLTS U230 ( .A(intAS), .B(intDY[31]), .Y(n240) );
  NAND4XLTS U231 ( .A(n237), .B(n236), .C(n235), .D(n234), .Y(n291) );
  CLKBUFX2TS U232 ( .A(n327), .Y(n282) );
  NOR2XLTS U233 ( .A(intDX[11]), .B(n265), .Y(n195) );
  AOI222XLTS U234 ( .A0(intDY[7]), .A1(n245), .B0(intDY[7]), .B1(n179), .C0(
        n245), .C1(n179), .Y(n180) );
  AOI31XLTS U235 ( .A0(intDX[0]), .A1(n229), .A2(n266), .B0(n232), .Y(n174) );
  NOR4BXLTS U236 ( .AN(n164), .B(n163), .C(n162), .D(n161), .Y(n165) );
  NOR2XLTS U237 ( .A(intDY[27]), .B(n314), .Y(n163) );
  NOR2XLTS U238 ( .A(intDY[26]), .B(n316), .Y(n161) );
  NOR2XLTS U239 ( .A(intDY[18]), .B(n290), .Y(n225) );
  NOR2XLTS U240 ( .A(intDY[17]), .B(n302), .Y(n221) );
  NOR2XLTS U241 ( .A(intDX[27]), .B(n315), .Y(n166) );
  NOR2XLTS U242 ( .A(intDX[25]), .B(n321), .Y(n154) );
  AOI222XLTS U243 ( .A0(intDY[23]), .A1(n283), .B0(intDY[23]), .B1(n213), .C0(
        n283), .C1(n213), .Y(n214) );
  NOR2XLTS U244 ( .A(intDY[29]), .B(n309), .Y(n162) );
  NOR2XLTS U245 ( .A(intDY[28]), .B(n311), .Y(n168) );
  NOR2XLTS U246 ( .A(intDX[2]), .B(n246), .Y(n228) );
  OAI211XLTS U247 ( .A0(intDX[8]), .A1(n268), .B0(n187), .C0(n190), .Y(n184)
         );
  NAND4BXLTS U248 ( .AN(n225), .B(n224), .C(n223), .D(n222), .Y(n226) );
  AOI211XLTS U249 ( .A0(intDY[0]), .A1(n267), .B0(n221), .C0(n220), .Y(n223)
         );
  CLKBUFX2TS U250 ( .A(n258), .Y(n287) );
  CLKBUFX2TS U251 ( .A(n327), .Y(n258) );
  CLKBUFX2TS U252 ( .A(n319), .Y(n278) );
  INVX2TS U253 ( .A(n243), .Y(n319) );
  NAND2X1TS U254 ( .A(n241), .B(n280), .Y(n327) );
  CLKBUFX2TS U255 ( .A(n258), .Y(n322) );
  CLKBUFX2TS U256 ( .A(n278), .Y(n274) );
  XOR2XLTS U257 ( .A(n240), .B(intDX[31]), .Y(real_op_o) );
  OAI211XLTS U258 ( .A0(n325), .A1(SignRegister_n5), .B0(n239), .C0(n238), .Y(
        SignRegister_n4) );
  NAND3XLTS U259 ( .A(n240), .B(n243), .C(n291), .Y(n238) );
  AOI2BB2XLTS U260 ( .B0(intDY[18]), .B1(n243), .A0N(n290), .A1N(n288), .Y(
        n242) );
  NOR2XLTS U261 ( .A(intDY[8]), .B(n269), .Y(n191) );
  AOI211XLTS U262 ( .A0(n191), .A1(n190), .B0(n189), .C0(n188), .Y(n193) );
  NOR2XLTS U263 ( .A(intDY[4]), .B(n249), .Y(n178) );
  OAI211XLTS U264 ( .A0(n199), .A1(n198), .B0(n197), .C0(n196), .Y(n201) );
  AOI31XLTS U265 ( .A0(n203), .A1(n202), .A2(n201), .B0(n200), .Y(n204) );
  AOI222XLTS U266 ( .A0(intDX[15]), .A1(n204), .B0(intDX[15]), .B1(n286), .C0(
        n204), .C1(n286), .Y(n205) );
  NOR2XLTS U267 ( .A(intDY[20]), .B(n298), .Y(n212) );
  NOR2XLTS U268 ( .A(n270), .B(intDX[14]), .Y(n200) );
  NOR4XLTS U269 ( .A(n194), .B(n184), .C(n183), .D(n182), .Y(n185) );
  OAI211XLTS U270 ( .A0(intDY[8]), .A1(n269), .B0(n186), .C0(n185), .Y(n230)
         );
  NOR4BXLTS U271 ( .AN(n229), .B(n228), .C(n227), .D(n226), .Y(n233) );
  NOR2BX1TS U272 ( .AN(n280), .B(n241), .Y(n243) );
  OAI211XLTS U273 ( .A0(n219), .A1(n218), .B0(n217), .C0(n216), .Y(n241) );
  NOR4BXLTS U274 ( .AN(n170), .B(n169), .C(n168), .D(n167), .Y(n235) );
  CLKBUFX2TS U275 ( .A(n278), .Y(n304) );
  CLKBUFX2TS U276 ( .A(n282), .Y(n288) );
  CLKBUFX2TS U277 ( .A(n258), .Y(n277) );
  INVX2TS U278 ( .A(rst), .Y(n152) );
  OAI21XLTS U279 ( .A0(n280), .A1(MRegister_n19), .B0(n242), .Y(MRegister_n50)
         );
  CLKBUFX2TS U280 ( .A(n152), .Y(n332) );
  CLKBUFX2TS U281 ( .A(n332), .Y(n328) );
  CLKBUFX2TS U282 ( .A(n152), .Y(n333) );
  CLKBUFX2TS U283 ( .A(n333), .Y(n331) );
  CLKBUFX2TS U284 ( .A(n332), .Y(n329) );
  CLKBUFX2TS U285 ( .A(n333), .Y(n330) );
  CLKBUFX2TS U286 ( .A(load_b_i), .Y(n325) );
  INVX2TS U287 ( .A(intDX[28]), .Y(n311) );
  NAND2X1TS U288 ( .A(intDY[28]), .B(n311), .Y(n170) );
  INVX2TS U289 ( .A(intDX[27]), .Y(n314) );
  INVX2TS U290 ( .A(intDY[27]), .Y(n315) );
  INVX2TS U291 ( .A(intDY[26]), .Y(n317) );
  INVX2TS U292 ( .A(intDX[26]), .Y(n316) );
  NAND2X1TS U293 ( .A(intDY[26]), .B(n316), .Y(n164) );
  INVX2TS U294 ( .A(intDX[25]), .Y(n318) );
  INVX2TS U295 ( .A(intDY[25]), .Y(n321) );
  INVX2TS U296 ( .A(intDY[24]), .Y(n272) );
  NAND2X1TS U297 ( .A(intDX[24]), .B(n272), .Y(n153) );
  OAI22X1TS U298 ( .A0(intDY[25]), .A1(n318), .B0(n154), .B1(n153), .Y(n155)
         );
  AOI22X1TS U299 ( .A0(intDX[26]), .A1(n317), .B0(n164), .B1(n155), .Y(n156)
         );
  OAI22X1TS U300 ( .A0(intDY[27]), .A1(n314), .B0(n166), .B1(n156), .Y(n157)
         );
  INVX2TS U301 ( .A(intDX[29]), .Y(n309) );
  INVX2TS U302 ( .A(intDY[30]), .Y(n308) );
  INVX2TS U303 ( .A(intDY[29]), .Y(n310) );
  OAI22X1TS U304 ( .A0(intDX[30]), .A1(n308), .B0(intDX[29]), .B1(n310), .Y(
        n218) );
  NAND2X1TS U305 ( .A(intDX[30]), .B(n308), .Y(n217) );
  INVX2TS U306 ( .A(intDX[21]), .Y(n296) );
  INVX2TS U307 ( .A(intDX[22]), .Y(n293) );
  OAI22X1TS U308 ( .A0(intDY[21]), .A1(n296), .B0(intDY[22]), .B1(n293), .Y(
        n209) );
  INVX2TS U309 ( .A(intDY[20]), .Y(n297) );
  INVX2TS U310 ( .A(intDY[23]), .Y(n284) );
  INVX2TS U311 ( .A(intDX[23]), .Y(n283) );
  AOI222XLTS U312 ( .A0(intDX[23]), .A1(n284), .B0(intDX[20]), .B1(n297), .C0(
        n283), .C1(intDY[23]), .Y(n158) );
  NAND2X1TS U313 ( .A(intDY[22]), .B(n293), .Y(n211) );
  AOI22X1TS U314 ( .A0(n272), .A1(intDX[24]), .B0(n318), .B1(intDY[25]), .Y(
        n160) );
  NAND4BBX1TS U315 ( .AN(n218), .BN(n166), .C(n165), .D(n217), .Y(n167) );
  INVX2TS U316 ( .A(intDX[16]), .Y(n306) );
  INVX2TS U317 ( .A(intDX[17]), .Y(n302) );
  AOI22X1TS U318 ( .A0(intDY[16]), .A1(n306), .B0(intDY[17]), .B1(n302), .Y(
        n224) );
  INVX2TS U319 ( .A(intDX[5]), .Y(n253) );
  INVX2TS U320 ( .A(intDX[6]), .Y(n257) );
  OAI22X1TS U321 ( .A0(intDY[5]), .A1(n253), .B0(intDY[6]), .B1(n257), .Y(n175) );
  INVX2TS U322 ( .A(intDY[4]), .Y(n248) );
  INVX2TS U323 ( .A(intDY[7]), .Y(n244) );
  INVX2TS U324 ( .A(intDX[7]), .Y(n245) );
  AOI222XLTS U325 ( .A0(intDX[7]), .A1(n244), .B0(intDX[4]), .B1(n248), .C0(
        n245), .C1(intDY[7]), .Y(n171) );
  NAND2X1TS U326 ( .A(intDY[6]), .B(n257), .Y(n177) );
  INVX2TS U327 ( .A(intDX[1]), .Y(n255) );
  NAND2X1TS U328 ( .A(intDY[1]), .B(n255), .Y(n229) );
  INVX2TS U329 ( .A(intDY[0]), .Y(n266) );
  INVX2TS U330 ( .A(intDX[2]), .Y(n247) );
  OAI22X1TS U331 ( .A0(intDY[1]), .A1(n255), .B0(intDY[2]), .B1(n247), .Y(n232) );
  INVX2TS U332 ( .A(intDY[2]), .Y(n246) );
  INVX2TS U333 ( .A(intDY[3]), .Y(n250) );
  INVX2TS U334 ( .A(intDX[3]), .Y(n251) );
  AOI22X1TS U335 ( .A0(intDX[3]), .A1(intDY[3]), .B0(n250), .B1(n251), .Y(n231) );
  NAND2X1TS U336 ( .A(intDX[3]), .B(n250), .Y(n173) );
  OAI31X1TS U337 ( .A0(n174), .A1(n228), .A2(n231), .B0(n173), .Y(n181) );
  INVX2TS U338 ( .A(intDX[4]), .Y(n249) );
  NAND2X1TS U339 ( .A(intDY[5]), .B(n253), .Y(n176) );
  AOI32X1TS U340 ( .A0(n178), .A1(n177), .A2(n176), .B0(n175), .B1(n177), .Y(
        n179) );
  AOI21X1TS U341 ( .A0(n237), .A1(n181), .B0(n180), .Y(n206) );
  INVX2TS U342 ( .A(intDX[8]), .Y(n269) );
  INVX2TS U343 ( .A(intDX[15]), .Y(n285) );
  INVX2TS U344 ( .A(intDX[11]), .Y(n263) );
  INVX2TS U345 ( .A(intDY[15]), .Y(n286) );
  AOI222XLTS U346 ( .A0(intDY[15]), .A1(n285), .B0(intDY[11]), .B1(n263), .C0(
        n286), .C1(intDX[15]), .Y(n186) );
  INVX2TS U347 ( .A(intDY[10]), .Y(n260) );
  INVX2TS U348 ( .A(intDY[8]), .Y(n268) );
  NAND2X1TS U349 ( .A(intDX[10]), .B(n260), .Y(n187) );
  INVX2TS U350 ( .A(intDX[9]), .Y(n281) );
  NAND2X1TS U351 ( .A(intDY[9]), .B(n281), .Y(n190) );
  INVX2TS U352 ( .A(intDX[12]), .Y(n276) );
  NAND2X1TS U353 ( .A(intDY[12]), .B(n276), .Y(n196) );
  INVX2TS U354 ( .A(intDY[14]), .Y(n270) );
  NAND2X1TS U355 ( .A(intDX[14]), .B(n270), .Y(n203) );
  NAND4BBX1TS U356 ( .AN(n188), .BN(n199), .C(n196), .D(n203), .Y(n183) );
  INVX2TS U357 ( .A(intDY[13]), .Y(n326) );
  NAND2X1TS U358 ( .A(intDX[13]), .B(n326), .Y(n202) );
  INVX2TS U359 ( .A(intDX[13]), .Y(n323) );
  NAND2X1TS U360 ( .A(intDY[13]), .B(n323), .Y(n197) );
  INVX2TS U361 ( .A(intDY[11]), .Y(n265) );
  NAND2X1TS U362 ( .A(intDX[11]), .B(n265), .Y(n192) );
  INVX2TS U363 ( .A(n187), .Y(n189) );
  OAI31X1TS U364 ( .A0(n195), .A1(n194), .A2(n193), .B0(n192), .Y(n198) );
  INVX2TS U365 ( .A(intDY[16]), .Y(n303) );
  NAND2X1TS U366 ( .A(intDX[16]), .B(n303), .Y(n222) );
  INVX2TS U367 ( .A(intDX[18]), .Y(n290) );
  INVX2TS U368 ( .A(intDY[19]), .Y(n299) );
  INVX2TS U369 ( .A(intDY[18]), .Y(n289) );
  OAI22X1TS U370 ( .A0(intDX[19]), .A1(n299), .B0(intDX[18]), .B1(n289), .Y(
        n220) );
  INVX2TS U371 ( .A(intDX[19]), .Y(n300) );
  OAI22X1TS U372 ( .A0(n208), .A1(n220), .B0(intDY[19]), .B1(n300), .Y(n215)
         );
  INVX2TS U373 ( .A(intDX[20]), .Y(n298) );
  NAND2X1TS U374 ( .A(intDY[21]), .B(n296), .Y(n210) );
  AOI32X1TS U375 ( .A0(n212), .A1(n211), .A2(n210), .B0(n209), .B1(n211), .Y(
        n213) );
  AOI32X1TS U376 ( .A0(n236), .A1(n235), .A2(n215), .B0(n214), .B1(n235), .Y(
        n216) );
  OAI211XLTS U377 ( .A0(n240), .A1(n241), .B0(n325), .C0(intDX[31]), .Y(n239)
         );
  CLKBUFX2TS U378 ( .A(load_b_i), .Y(n280) );
  INVX2TS U379 ( .A(intDX[0]), .Y(n267) );
  OAI22X1TS U380 ( .A0(intDY[0]), .A1(n267), .B0(intDY[19]), .B1(n300), .Y(
        n227) );
  NOR4BXLTS U381 ( .AN(n233), .B(n232), .C(n231), .D(n230), .Y(n234) );
  INVX2TS U382 ( .A(intDY[1]), .Y(n254) );
  OAI222X1TS U383 ( .A0(n258), .A1(n254), .B0(n325), .B1(mRegister_n134), .C0(
        n278), .C1(n255), .Y(mRegister_n103) );
  OAI222X1TS U384 ( .A0(n258), .A1(n246), .B0(n325), .B1(mRegister_n133), .C0(
        n278), .C1(n247), .Y(mRegister_n102) );
  OAI222X1TS U385 ( .A0(n258), .A1(n250), .B0(n325), .B1(mRegister_n132), .C0(
        n278), .C1(n251), .Y(mRegister_n101) );
  OAI222X1TS U386 ( .A0(n258), .A1(n248), .B0(n325), .B1(mRegister_n131), .C0(
        n278), .C1(n249), .Y(mRegister_n100) );
  INVX2TS U387 ( .A(intDY[5]), .Y(n252) );
  CLKBUFX2TS U388 ( .A(load_b_i), .Y(n262) );
  OAI222X1TS U389 ( .A0(n258), .A1(n252), .B0(n262), .B1(mRegister_n130), .C0(
        n278), .C1(n253), .Y(mRegister_n99) );
  INVX2TS U390 ( .A(intDY[6]), .Y(n256) );
  OAI222X1TS U391 ( .A0(n258), .A1(n256), .B0(n262), .B1(mRegister_n129), .C0(
        n278), .C1(n257), .Y(mRegister_n98) );
  OAI222X1TS U392 ( .A0(n258), .A1(n266), .B0(n325), .B1(mRegister_n135), .C0(
        n278), .C1(n267), .Y(mRegister_n104) );
  CLKBUFX2TS U393 ( .A(n319), .Y(n261) );
  OAI222X1TS U394 ( .A0(n288), .A1(n244), .B0(n262), .B1(mRegister_n128), .C0(
        n261), .C1(n245), .Y(mRegister_n97) );
  CLKBUFX2TS U395 ( .A(load_b_i), .Y(n312) );
  CLKBUFX2TS U396 ( .A(n319), .Y(n264) );
  OAI222X1TS U397 ( .A0(n277), .A1(n245), .B0(n312), .B1(MRegister_n8), .C0(
        n264), .C1(n244), .Y(MRegister_n39) );
  OAI222X1TS U398 ( .A0(n277), .A1(n247), .B0(n312), .B1(MRegister_n3), .C0(
        n264), .C1(n246), .Y(MRegister_n34) );
  OAI222X1TS U399 ( .A0(n277), .A1(n249), .B0(n312), .B1(MRegister_n5), .C0(
        n264), .C1(n248), .Y(MRegister_n36) );
  OAI222X1TS U400 ( .A0(n277), .A1(n251), .B0(n312), .B1(MRegister_n4), .C0(
        n264), .C1(n250), .Y(MRegister_n35) );
  OAI222X1TS U401 ( .A0(n277), .A1(n253), .B0(n312), .B1(MRegister_n6), .C0(
        n264), .C1(n252), .Y(MRegister_n37) );
  OAI222X1TS U402 ( .A0(n322), .A1(n255), .B0(n312), .B1(MRegister_n2), .C0(
        n264), .C1(n254), .Y(MRegister_n33) );
  OAI222X1TS U403 ( .A0(n277), .A1(n257), .B0(n312), .B1(MRegister_n7), .C0(
        n264), .C1(n256), .Y(MRegister_n38) );
  INVX2TS U404 ( .A(intDX[14]), .Y(n271) );
  OAI222X1TS U405 ( .A0(n287), .A1(n270), .B0(n262), .B1(mRegister_n121), .C0(
        n261), .C1(n271), .Y(mRegister_n90) );
  CLKBUFX2TS U406 ( .A(load_b_i), .Y(n320) );
  OAI222X1TS U407 ( .A0(n287), .A1(n297), .B0(n320), .B1(mRegister_n115), .C0(
        n261), .C1(n298), .Y(mRegister_n84) );
  INVX2TS U408 ( .A(intDX[24]), .Y(n273) );
  OAI222X1TS U409 ( .A0(n322), .A1(n272), .B0(n320), .B1(mRegister_n111), .C0(
        n319), .C1(n273), .Y(mRegister_n80) );
  OAI222X1TS U410 ( .A0(n287), .A1(n268), .B0(n262), .B1(mRegister_n127), .C0(
        n261), .C1(n269), .Y(mRegister_n96) );
  CLKBUFX2TS U411 ( .A(load_b_i), .Y(n305) );
  OAI222X1TS U412 ( .A0(n277), .A1(n263), .B0(n305), .B1(MRegister_n12), .C0(
        n264), .C1(n265), .Y(MRegister_n43) );
  INVX2TS U413 ( .A(intDX[10]), .Y(n259) );
  OAI222X1TS U414 ( .A0(n277), .A1(n259), .B0(n305), .B1(MRegister_n11), .C0(
        n264), .C1(n260), .Y(MRegister_n42) );
  OAI222X1TS U415 ( .A0(n287), .A1(n303), .B0(n262), .B1(mRegister_n119), .C0(
        n261), .C1(n306), .Y(mRegister_n88) );
  INVX2TS U416 ( .A(intDY[12]), .Y(n275) );
  OAI222X1TS U417 ( .A0(n287), .A1(n275), .B0(n262), .B1(mRegister_n123), .C0(
        n261), .C1(n276), .Y(mRegister_n92) );
  OAI222X1TS U418 ( .A0(n287), .A1(n299), .B0(n320), .B1(mRegister_n116), .C0(
        n261), .C1(n300), .Y(mRegister_n85) );
  OAI222X1TS U419 ( .A0(n287), .A1(n260), .B0(n262), .B1(mRegister_n125), .C0(
        n261), .C1(n259), .Y(mRegister_n94) );
  INVX2TS U420 ( .A(intDY[17]), .Y(n301) );
  OAI222X1TS U421 ( .A0(n287), .A1(n301), .B0(n262), .B1(mRegister_n118), .C0(
        n261), .C1(n302), .Y(mRegister_n87) );
  INVX2TS U422 ( .A(intDY[9]), .Y(n279) );
  OAI222X1TS U423 ( .A0(n287), .A1(n279), .B0(n262), .B1(mRegister_n126), .C0(
        n261), .C1(n281), .Y(mRegister_n95) );
  OAI222X1TS U424 ( .A0(n277), .A1(n265), .B0(n325), .B1(mRegister_n124), .C0(
        n264), .C1(n263), .Y(mRegister_n93) );
  OAI222X1TS U425 ( .A0(n282), .A1(n267), .B0(n280), .B1(MRegister_n1), .C0(
        n274), .C1(n266), .Y(MRegister_n32) );
  OAI222X1TS U426 ( .A0(n288), .A1(n269), .B0(n280), .B1(MRegister_n9), .C0(
        n274), .C1(n268), .Y(MRegister_n40) );
  OAI222X1TS U427 ( .A0(n288), .A1(n271), .B0(n305), .B1(MRegister_n15), .C0(
        n304), .C1(n270), .Y(MRegister_n46) );
  CLKBUFX2TS U428 ( .A(load_b_i), .Y(n295) );
  INVX2TS U429 ( .A(intDY[28]), .Y(n313) );
  OAI222X1TS U430 ( .A0(n282), .A1(n311), .B0(n295), .B1(MRegister_n29), .C0(
        n274), .C1(n313), .Y(MRegister_n60) );
  OAI222X1TS U431 ( .A0(n282), .A1(n314), .B0(n295), .B1(MRegister_n28), .C0(
        n274), .C1(n315), .Y(MRegister_n59) );
  OAI222X1TS U432 ( .A0(n288), .A1(n309), .B0(n295), .B1(MRegister_n30), .C0(
        n274), .C1(n310), .Y(MRegister_n61) );
  OAI222X1TS U433 ( .A0(n282), .A1(n283), .B0(n295), .B1(MRegister_n24), .C0(
        n274), .C1(n284), .Y(MRegister_n55) );
  INVX2TS U434 ( .A(intDX[30]), .Y(n307) );
  OAI222X1TS U435 ( .A0(n282), .A1(n307), .B0(n295), .B1(MRegister_n31), .C0(
        n274), .C1(n308), .Y(MRegister_n63) );
  OAI222X1TS U436 ( .A0(n282), .A1(n318), .B0(n295), .B1(MRegister_n26), .C0(
        n274), .C1(n321), .Y(MRegister_n57) );
  OAI222X1TS U437 ( .A0(n282), .A1(n273), .B0(n295), .B1(MRegister_n25), .C0(
        n274), .C1(n272), .Y(MRegister_n56) );
  OAI222X1TS U438 ( .A0(n282), .A1(n316), .B0(n295), .B1(MRegister_n27), .C0(
        n274), .C1(n317), .Y(MRegister_n58) );
  OAI222X1TS U439 ( .A0(n288), .A1(n285), .B0(n305), .B1(MRegister_n16), .C0(
        n304), .C1(n286), .Y(MRegister_n47) );
  OAI222X1TS U440 ( .A0(n277), .A1(n276), .B0(n305), .B1(MRegister_n13), .C0(
        n304), .C1(n275), .Y(MRegister_n44) );
  OAI222X1TS U441 ( .A0(n288), .A1(n323), .B0(n305), .B1(MRegister_n14), .C0(
        n304), .C1(n326), .Y(MRegister_n45) );
  CLKBUFX2TS U442 ( .A(n278), .Y(n324) );
  OAI222X1TS U443 ( .A0(n282), .A1(n281), .B0(n280), .B1(MRegister_n10), .C0(
        n324), .C1(n279), .Y(MRegister_n41) );
  OAI222X1TS U444 ( .A0(n322), .A1(n284), .B0(n320), .B1(mRegister_n112), .C0(
        n324), .C1(n283), .Y(mRegister_n81) );
  OAI222X1TS U445 ( .A0(n288), .A1(n286), .B0(n325), .B1(mRegister_n120), .C0(
        n324), .C1(n285), .Y(mRegister_n89) );
  INVX2TS U446 ( .A(intDY[21]), .Y(n294) );
  OAI222X1TS U447 ( .A0(n287), .A1(n294), .B0(n320), .B1(mRegister_n114), .C0(
        n324), .C1(n296), .Y(mRegister_n83) );
  INVX2TS U448 ( .A(intDY[22]), .Y(n292) );
  OAI222X1TS U449 ( .A0(n322), .A1(n292), .B0(n320), .B1(mRegister_n113), .C0(
        n324), .C1(n293), .Y(mRegister_n82) );
  OAI222X1TS U450 ( .A0(n290), .A1(n324), .B0(n320), .B1(mRegister_n117), .C0(
        n289), .C1(n288), .Y(mRegister_n86) );
  NOR2BX1TS U451 ( .AN(real_op_o), .B(n291), .Y(zero_flag_o) );
  OAI222X1TS U452 ( .A0(n327), .A1(n293), .B0(n295), .B1(MRegister_n23), .C0(
        n304), .C1(n292), .Y(MRegister_n54) );
  OAI222X1TS U453 ( .A0(n327), .A1(n296), .B0(n295), .B1(MRegister_n22), .C0(
        n304), .C1(n294), .Y(MRegister_n53) );
  OAI222X1TS U454 ( .A0(n327), .A1(n298), .B0(n305), .B1(MRegister_n21), .C0(
        n304), .C1(n297), .Y(MRegister_n52) );
  OAI222X1TS U455 ( .A0(n327), .A1(n300), .B0(n305), .B1(MRegister_n20), .C0(
        n304), .C1(n299), .Y(MRegister_n51) );
  OAI222X1TS U456 ( .A0(n327), .A1(n302), .B0(n305), .B1(MRegister_n18), .C0(
        n304), .C1(n301), .Y(MRegister_n49) );
  OAI222X1TS U457 ( .A0(n327), .A1(n306), .B0(n305), .B1(MRegister_n17), .C0(
        n304), .C1(n303), .Y(MRegister_n48) );
  OAI222X1TS U458 ( .A0(n322), .A1(n308), .B0(n312), .B1(mRegister_n105), .C0(
        n319), .C1(n307), .Y(mRegister_n74) );
  OAI222X1TS U459 ( .A0(n322), .A1(n310), .B0(n312), .B1(mRegister_n106), .C0(
        n319), .C1(n309), .Y(mRegister_n75) );
  OAI222X1TS U460 ( .A0(n322), .A1(n313), .B0(n312), .B1(mRegister_n107), .C0(
        n319), .C1(n311), .Y(mRegister_n76) );
  OAI222X1TS U461 ( .A0(n322), .A1(n315), .B0(n320), .B1(mRegister_n108), .C0(
        n319), .C1(n314), .Y(mRegister_n77) );
  OAI222X1TS U462 ( .A0(n322), .A1(n317), .B0(n320), .B1(mRegister_n109), .C0(
        n319), .C1(n316), .Y(mRegister_n78) );
  OAI222X1TS U463 ( .A0(n322), .A1(n321), .B0(n320), .B1(mRegister_n110), .C0(
        n319), .C1(n318), .Y(mRegister_n79) );
  OAI222X1TS U464 ( .A0(n327), .A1(n326), .B0(n325), .B1(mRegister_n122), .C0(
        n324), .C1(n323), .Y(mRegister_n91) );
endmodule

