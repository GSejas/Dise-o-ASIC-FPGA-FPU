/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Oct 18 20:11:29 2016
/////////////////////////////////////////////////////////////


module Oper_Start_In_2_W32 ( clk, rst, load_b_i, intAS, intDX, intDY, DMP_o, 
        DmP_o, zero_flag_o, real_op_o, sign_final_result_o );
  input [31:0] intDX;
  input [31:0] intDY;
  output [30:0] DMP_o;
  output [30:0] DmP_o;
  input clk, rst, load_b_i, intAS;
  output zero_flag_o, real_op_o, sign_final_result_o;
  wire   \MRegister/n63 , \MRegister/n61 , \MRegister/n60 , \MRegister/n59 ,
         \MRegister/n58 , \MRegister/n57 , \MRegister/n56 , \MRegister/n55 ,
         \MRegister/n54 , \MRegister/n53 , \MRegister/n52 , \MRegister/n51 ,
         \MRegister/n50 , \MRegister/n49 , \MRegister/n48 , \MRegister/n47 ,
         \MRegister/n46 , \MRegister/n45 , \MRegister/n44 , \MRegister/n43 ,
         \MRegister/n42 , \MRegister/n41 , \MRegister/n40 , \MRegister/n39 ,
         \MRegister/n38 , \MRegister/n37 , \MRegister/n36 , \MRegister/n35 ,
         \MRegister/n34 , \MRegister/n33 , \MRegister/n32 , \MRegister/n31 ,
         \MRegister/n30 , \MRegister/n29 , \MRegister/n28 , \MRegister/n27 ,
         \MRegister/n26 , \MRegister/n25 , \MRegister/n24 , \MRegister/n23 ,
         \MRegister/n22 , \MRegister/n21 , \MRegister/n20 , \MRegister/n19 ,
         \MRegister/n18 , \MRegister/n17 , \MRegister/n16 , \MRegister/n15 ,
         \MRegister/n14 , \MRegister/n13 , \MRegister/n12 , \MRegister/n11 ,
         \MRegister/n10 , \MRegister/n9 , \MRegister/n8 , \MRegister/n7 ,
         \MRegister/n6 , \MRegister/n5 , \MRegister/n4 , \MRegister/n3 ,
         \MRegister/n2 , \MRegister/n1 , \mRegister/n135 , \mRegister/n134 ,
         \mRegister/n133 , \mRegister/n132 , \mRegister/n131 ,
         \mRegister/n130 , \mRegister/n129 , \mRegister/n128 ,
         \mRegister/n127 , \mRegister/n126 , \mRegister/n125 ,
         \mRegister/n124 , \mRegister/n123 , \mRegister/n122 ,
         \mRegister/n121 , \mRegister/n120 , \mRegister/n119 ,
         \mRegister/n118 , \mRegister/n117 , \mRegister/n116 ,
         \mRegister/n115 , \mRegister/n114 , \mRegister/n113 ,
         \mRegister/n112 , \mRegister/n111 , \mRegister/n110 ,
         \mRegister/n109 , \mRegister/n108 , \mRegister/n107 ,
         \mRegister/n106 , \mRegister/n105 , \mRegister/n104 ,
         \mRegister/n103 , \mRegister/n102 , \mRegister/n101 ,
         \mRegister/n100 , \mRegister/n99 , \mRegister/n98 , \mRegister/n97 ,
         \mRegister/n96 , \mRegister/n95 , \mRegister/n94 , \mRegister/n93 ,
         \mRegister/n92 , \mRegister/n91 , \mRegister/n90 , \mRegister/n89 ,
         \mRegister/n88 , \mRegister/n87 , \mRegister/n86 , \mRegister/n85 ,
         \mRegister/n84 , \mRegister/n83 , \mRegister/n82 , \mRegister/n81 ,
         \mRegister/n80 , \mRegister/n79 , \mRegister/n78 , \mRegister/n77 ,
         \mRegister/n76 , \mRegister/n75 , \mRegister/n74 , \SignRegister/n5 ,
         \SignRegister/n4 , n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313;

  DFFRXLTS \MRegister/Q_reg_0_  ( .D(\MRegister/n32 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[0]), .QN(\MRegister/n1 ) );
  DFFRXLTS \MRegister/Q_reg_1_  ( .D(\MRegister/n33 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[1]), .QN(\MRegister/n2 ) );
  DFFRXLTS \MRegister/Q_reg_2_  ( .D(\MRegister/n34 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[2]), .QN(\MRegister/n3 ) );
  DFFRXLTS \MRegister/Q_reg_3_  ( .D(\MRegister/n35 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[3]), .QN(\MRegister/n4 ) );
  DFFRXLTS \MRegister/Q_reg_4_  ( .D(\MRegister/n36 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[4]), .QN(\MRegister/n5 ) );
  DFFRXLTS \MRegister/Q_reg_5_  ( .D(\MRegister/n37 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[5]), .QN(\MRegister/n6 ) );
  DFFRXLTS \MRegister/Q_reg_7_  ( .D(\MRegister/n39 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[7]), .QN(\MRegister/n8 ) );
  DFFRXLTS \MRegister/Q_reg_6_  ( .D(\MRegister/n38 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[6]), .QN(\MRegister/n7 ) );
  DFFRXLTS \MRegister/Q_reg_8_  ( .D(\MRegister/n40 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[8]), .QN(\MRegister/n9 ) );
  DFFRXLTS \MRegister/Q_reg_9_  ( .D(\MRegister/n41 ), .CK(clk), .RN(n312), 
        .Q(DMP_o[9]), .QN(\MRegister/n10 ) );
  DFFRXLTS \MRegister/Q_reg_14_  ( .D(\MRegister/n46 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[14]), .QN(\MRegister/n15 ) );
  DFFRXLTS \MRegister/Q_reg_22_  ( .D(\MRegister/n54 ), .CK(clk), .RN(n312), 
        .Q(DMP_o[22]), .QN(\MRegister/n23 ) );
  DFFRXLTS \mRegister/Q_reg_6_  ( .D(\mRegister/n98 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[6]), .QN(\mRegister/n129 ) );
  DFFRXLTS \mRegister/Q_reg_21_  ( .D(\mRegister/n83 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[21]), .QN(\mRegister/n114 ) );
  DFFRXLTS \MRegister/Q_reg_10_  ( .D(\MRegister/n42 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[10]), .QN(\MRegister/n11 ) );
  DFFRXLTS \MRegister/Q_reg_11_  ( .D(\MRegister/n43 ), .CK(clk), .RN(n312), 
        .Q(DMP_o[11]), .QN(\MRegister/n12 ) );
  DFFRXLTS \MRegister/Q_reg_12_  ( .D(\MRegister/n44 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[12]), .QN(\MRegister/n13 ) );
  DFFRXLTS \MRegister/Q_reg_13_  ( .D(\MRegister/n45 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[13]), .QN(\MRegister/n14 ) );
  DFFRXLTS \MRegister/Q_reg_15_  ( .D(\MRegister/n47 ), .CK(clk), .RN(n312), 
        .Q(DMP_o[15]), .QN(\MRegister/n16 ) );
  DFFRXLTS \MRegister/Q_reg_23_  ( .D(\MRegister/n55 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[23]), .QN(\MRegister/n24 ) );
  DFFRXLTS \MRegister/Q_reg_24_  ( .D(\MRegister/n56 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[24]), .QN(\MRegister/n25 ) );
  DFFRXLTS \MRegister/Q_reg_25_  ( .D(\MRegister/n57 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[25]), .QN(\MRegister/n26 ) );
  DFFRXLTS \MRegister/Q_reg_16_  ( .D(\MRegister/n48 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[16]), .QN(\MRegister/n17 ) );
  DFFRXLTS \MRegister/Q_reg_17_  ( .D(\MRegister/n49 ), .CK(clk), .RN(n312), 
        .Q(DMP_o[17]), .QN(\MRegister/n18 ) );
  DFFRXLTS \MRegister/Q_reg_18_  ( .D(\MRegister/n50 ), .CK(clk), .RN(n312), 
        .Q(DMP_o[18]), .QN(\MRegister/n19 ) );
  DFFRXLTS \MRegister/Q_reg_19_  ( .D(\MRegister/n51 ), .CK(clk), .RN(n312), 
        .Q(DMP_o[19]), .QN(\MRegister/n20 ) );
  DFFRXLTS \MRegister/Q_reg_26_  ( .D(\MRegister/n58 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[26]), .QN(\MRegister/n27 ) );
  DFFRXLTS \MRegister/Q_reg_27_  ( .D(\MRegister/n59 ), .CK(clk), .RN(n312), 
        .Q(DMP_o[27]), .QN(\MRegister/n28 ) );
  DFFRXLTS \MRegister/Q_reg_28_  ( .D(\MRegister/n60 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[28]), .QN(\MRegister/n29 ) );
  DFFRXLTS \MRegister/Q_reg_29_  ( .D(\MRegister/n61 ), .CK(clk), .RN(n152), 
        .Q(DMP_o[29]), .QN(\MRegister/n30 ) );
  DFFRXLTS \MRegister/Q_reg_20_  ( .D(\MRegister/n52 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[20]), .QN(\MRegister/n21 ) );
  DFFRXLTS \MRegister/Q_reg_21_  ( .D(\MRegister/n53 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[21]), .QN(\MRegister/n22 ) );
  DFFRXLTS \MRegister/Q_reg_30_  ( .D(\MRegister/n63 ), .CK(clk), .RN(n313), 
        .Q(DMP_o[30]), .QN(\MRegister/n31 ) );
  DFFRXLTS \mRegister/Q_reg_23_  ( .D(\mRegister/n81 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[23]), .QN(\mRegister/n112 ) );
  DFFRXLTS \mRegister/Q_reg_24_  ( .D(\mRegister/n80 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[24]), .QN(\mRegister/n111 ) );
  DFFRXLTS \mRegister/Q_reg_25_  ( .D(\mRegister/n79 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[25]), .QN(\mRegister/n110 ) );
  DFFRXLTS \mRegister/Q_reg_26_  ( .D(\mRegister/n78 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[26]), .QN(\mRegister/n109 ) );
  DFFRXLTS \mRegister/Q_reg_27_  ( .D(\mRegister/n77 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[27]), .QN(\mRegister/n108 ) );
  DFFRXLTS \mRegister/Q_reg_28_  ( .D(\mRegister/n76 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[28]), .QN(\mRegister/n107 ) );
  DFFRXLTS \mRegister/Q_reg_29_  ( .D(\mRegister/n75 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[29]), .QN(\mRegister/n106 ) );
  DFFRXLTS \mRegister/Q_reg_0_  ( .D(\mRegister/n104 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[0]), .QN(\mRegister/n135 ) );
  DFFRXLTS \mRegister/Q_reg_1_  ( .D(\mRegister/n103 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[1]), .QN(\mRegister/n134 ) );
  DFFRXLTS \mRegister/Q_reg_2_  ( .D(\mRegister/n102 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[2]), .QN(\mRegister/n133 ) );
  DFFRXLTS \mRegister/Q_reg_3_  ( .D(\mRegister/n101 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[3]), .QN(\mRegister/n132 ) );
  DFFRXLTS \mRegister/Q_reg_4_  ( .D(\mRegister/n100 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[4]), .QN(\mRegister/n131 ) );
  DFFRXLTS \mRegister/Q_reg_5_  ( .D(\mRegister/n99 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[5]), .QN(\mRegister/n130 ) );
  DFFRXLTS \mRegister/Q_reg_7_  ( .D(\mRegister/n97 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[7]), .QN(\mRegister/n128 ) );
  DFFRXLTS \mRegister/Q_reg_8_  ( .D(\mRegister/n96 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[8]), .QN(\mRegister/n127 ) );
  DFFRXLTS \mRegister/Q_reg_9_  ( .D(\mRegister/n95 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[9]), .QN(\mRegister/n126 ) );
  DFFRXLTS \mRegister/Q_reg_10_  ( .D(\mRegister/n94 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[10]), .QN(\mRegister/n125 ) );
  DFFRXLTS \mRegister/Q_reg_11_  ( .D(\mRegister/n93 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[11]), .QN(\mRegister/n124 ) );
  DFFRXLTS \mRegister/Q_reg_12_  ( .D(\mRegister/n92 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[12]), .QN(\mRegister/n123 ) );
  DFFRXLTS \mRegister/Q_reg_13_  ( .D(\mRegister/n91 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[13]), .QN(\mRegister/n122 ) );
  DFFRXLTS \mRegister/Q_reg_14_  ( .D(\mRegister/n90 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[14]), .QN(\mRegister/n121 ) );
  DFFRXLTS \mRegister/Q_reg_15_  ( .D(\mRegister/n89 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[15]), .QN(\mRegister/n120 ) );
  DFFRXLTS \mRegister/Q_reg_16_  ( .D(\mRegister/n88 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[16]), .QN(\mRegister/n119 ) );
  DFFRXLTS \mRegister/Q_reg_17_  ( .D(\mRegister/n87 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[17]), .QN(\mRegister/n118 ) );
  DFFRXLTS \mRegister/Q_reg_18_  ( .D(\mRegister/n86 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[18]), .QN(\mRegister/n117 ) );
  DFFRXLTS \mRegister/Q_reg_19_  ( .D(\mRegister/n85 ), .CK(clk), .RN(n152), 
        .Q(DmP_o[19]), .QN(\mRegister/n116 ) );
  DFFRXLTS \mRegister/Q_reg_20_  ( .D(\mRegister/n84 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[20]), .QN(\mRegister/n115 ) );
  DFFRXLTS \mRegister/Q_reg_22_  ( .D(\mRegister/n82 ), .CK(clk), .RN(n313), 
        .Q(DmP_o[22]), .QN(\mRegister/n113 ) );
  DFFRXLTS \mRegister/Q_reg_30_  ( .D(\mRegister/n74 ), .CK(clk), .RN(n312), 
        .Q(DmP_o[30]), .QN(\mRegister/n105 ) );
  DFFRXLTS \SignRegister/Q_reg_0_  ( .D(\SignRegister/n4 ), .CK(clk), .RN(n152), .Q(sign_final_result_o), .QN(\SignRegister/n5 ) );
  XOR2XLTS U218 ( .A(intAS), .B(intDY[31]), .Y(n251) );
  XOR2XLTS U219 ( .A(n251), .B(intDX[31]), .Y(real_op_o) );
  NOR2XLTS U220 ( .A(intDY[8]), .B(n288), .Y(n191) );
  AOI211XLTS U221 ( .A0(n191), .A1(n190), .B0(n189), .C0(n188), .Y(n193) );
  NOR2XLTS U222 ( .A(intDY[4]), .B(n292), .Y(n178) );
  OAI211XLTS U223 ( .A0(n199), .A1(n198), .B0(n197), .C0(n196), .Y(n201) );
  AOI31XLTS U224 ( .A0(n203), .A1(n202), .A2(n201), .B0(n200), .Y(n204) );
  NOR2XLTS U225 ( .A(intDX[25]), .B(n261), .Y(n154) );
  NOR2XLTS U226 ( .A(intDY[20]), .B(n275), .Y(n212) );
  NOR2XLTS U227 ( .A(n283), .B(intDX[14]), .Y(n200) );
  OAI211XLTS U228 ( .A0(intDY[8]), .A1(n288), .B0(n186), .C0(n185), .Y(n231)
         );
  NOR4BXLTS U229 ( .AN(n230), .B(n229), .C(n228), .D(n227), .Y(n234) );
  OAI211XLTS U230 ( .A0(n219), .A1(n218), .B0(n217), .C0(n216), .Y(n220) );
  NOR4BXLTS U231 ( .AN(n234), .B(n233), .C(n232), .D(n231), .Y(n235) );
  NOR4BXLTS U232 ( .AN(n170), .B(n169), .C(n168), .D(n167), .Y(n236) );
  OAI21XLTS U233 ( .A0(load_b_i), .A1(\MRegister/n19 ), .B0(n242), .Y(
        \MRegister/n50 ) );
  INVX2TS U234 ( .A(rst), .Y(n152) );
  CLKBUFX2TS U235 ( .A(n152), .Y(n313) );
  CLKBUFX2TS U236 ( .A(n152), .Y(n312) );
  INVX2TS U237 ( .A(intDX[28]), .Y(n258) );
  NAND2X1TS U238 ( .A(intDY[28]), .B(n258), .Y(n170) );
  INVX2TS U239 ( .A(intDX[27]), .Y(n260) );
  INVX2TS U240 ( .A(intDY[27]), .Y(n259) );
  NOR2XLTS U241 ( .A(intDX[27]), .B(n259), .Y(n166) );
  INVX2TS U242 ( .A(intDY[26]), .Y(n244) );
  INVX2TS U243 ( .A(intDX[26]), .Y(n243) );
  NAND2X1TS U244 ( .A(intDY[26]), .B(n243), .Y(n164) );
  INVX2TS U245 ( .A(intDX[25]), .Y(n262) );
  INVX2TS U246 ( .A(intDY[25]), .Y(n261) );
  INVX2TS U247 ( .A(intDY[24]), .Y(n268) );
  NAND2X1TS U248 ( .A(intDX[24]), .B(n268), .Y(n153) );
  OAI22X1TS U249 ( .A0(intDY[25]), .A1(n262), .B0(n154), .B1(n153), .Y(n155)
         );
  AOI22X1TS U250 ( .A0(intDX[26]), .A1(n244), .B0(n164), .B1(n155), .Y(n156)
         );
  OAI22X1TS U251 ( .A0(intDY[27]), .A1(n260), .B0(n166), .B1(n156), .Y(n157)
         );
  NOR2XLTS U252 ( .A(intDY[28]), .B(n258), .Y(n168) );
  INVX2TS U253 ( .A(intDX[29]), .Y(n256) );
  NOR2XLTS U254 ( .A(intDY[29]), .B(n256), .Y(n162) );
  AOI211XLTS U255 ( .A0(n170), .A1(n157), .B0(n168), .C0(n162), .Y(n219) );
  INVX2TS U256 ( .A(intDY[30]), .Y(n250) );
  INVX2TS U257 ( .A(intDY[29]), .Y(n255) );
  OAI22X1TS U258 ( .A0(intDX[30]), .A1(n250), .B0(intDX[29]), .B1(n255), .Y(
        n218) );
  NAND2X1TS U259 ( .A(intDX[30]), .B(n250), .Y(n217) );
  INVX2TS U260 ( .A(intDX[21]), .Y(n273) );
  INVX2TS U261 ( .A(intDX[22]), .Y(n271) );
  OAI22X1TS U262 ( .A0(intDY[21]), .A1(n273), .B0(intDY[22]), .B1(n271), .Y(
        n209) );
  INVX2TS U263 ( .A(intDY[20]), .Y(n276) );
  INVX2TS U264 ( .A(intDY[23]), .Y(n270) );
  INVX2TS U265 ( .A(intDX[23]), .Y(n269) );
  AOI222XLTS U266 ( .A0(intDX[23]), .A1(n270), .B0(intDX[20]), .B1(n276), .C0(
        n269), .C1(intDY[23]), .Y(n158) );
  NAND2X1TS U267 ( .A(intDY[22]), .B(n271), .Y(n211) );
  OAI211XLTS U268 ( .A0(intDX[20]), .A1(n276), .B0(n158), .C0(n211), .Y(n159)
         );
  AOI211XLTS U269 ( .A0(intDY[21]), .A1(n273), .B0(n209), .C0(n159), .Y(n237)
         );
  AOI22X1TS U270 ( .A0(n268), .A1(intDX[24]), .B0(n262), .B1(intDY[25]), .Y(
        n160) );
  OAI221XLTS U271 ( .A0(n268), .A1(intDX[24]), .B0(n262), .B1(intDY[25]), .C0(
        n160), .Y(n169) );
  NOR2XLTS U272 ( .A(intDY[27]), .B(n260), .Y(n163) );
  NOR2XLTS U273 ( .A(intDY[26]), .B(n243), .Y(n161) );
  NOR4BXLTS U274 ( .AN(n164), .B(n163), .C(n162), .D(n161), .Y(n165) );
  NAND4BBX1TS U275 ( .AN(n218), .BN(n166), .C(n165), .D(n217), .Y(n167) );
  INVX2TS U276 ( .A(intDX[16]), .Y(n247) );
  INVX2TS U277 ( .A(intDX[17]), .Y(n280) );
  AOI22X1TS U278 ( .A0(intDY[16]), .A1(n247), .B0(intDY[17]), .B1(n280), .Y(
        n225) );
  INVX2TS U279 ( .A(intDX[5]), .Y(n266) );
  INVX2TS U280 ( .A(intDX[6]), .Y(n290) );
  OAI22X1TS U281 ( .A0(intDY[5]), .A1(n266), .B0(intDY[6]), .B1(n290), .Y(n175) );
  INVX2TS U282 ( .A(intDY[4]), .Y(n293) );
  INVX2TS U283 ( .A(intDY[7]), .Y(n263) );
  INVX2TS U284 ( .A(intDX[7]), .Y(n264) );
  AOI222XLTS U285 ( .A0(intDX[7]), .A1(n263), .B0(intDX[4]), .B1(n293), .C0(
        n264), .C1(intDY[7]), .Y(n171) );
  NAND2X1TS U286 ( .A(intDY[6]), .B(n290), .Y(n177) );
  OAI211XLTS U287 ( .A0(intDX[4]), .A1(n293), .B0(n171), .C0(n177), .Y(n172)
         );
  AOI211XLTS U288 ( .A0(intDY[5]), .A1(n266), .B0(n175), .C0(n172), .Y(n238)
         );
  INVX2TS U289 ( .A(intDX[1]), .Y(n298) );
  NAND2X1TS U290 ( .A(intDY[1]), .B(n298), .Y(n230) );
  INVX2TS U291 ( .A(intDY[0]), .Y(n301) );
  INVX2TS U292 ( .A(intDX[2]), .Y(n296) );
  OAI22X1TS U293 ( .A0(intDY[1]), .A1(n298), .B0(intDY[2]), .B1(n296), .Y(n233) );
  AOI31XLTS U294 ( .A0(intDX[0]), .A1(n230), .A2(n301), .B0(n233), .Y(n174) );
  INVX2TS U295 ( .A(intDY[2]), .Y(n297) );
  NOR2XLTS U296 ( .A(intDX[2]), .B(n297), .Y(n229) );
  INVX2TS U297 ( .A(intDY[3]), .Y(n295) );
  INVX2TS U298 ( .A(intDX[3]), .Y(n294) );
  AOI22X1TS U299 ( .A0(intDX[3]), .A1(intDY[3]), .B0(n295), .B1(n294), .Y(n232) );
  NAND2X1TS U300 ( .A(intDX[3]), .B(n295), .Y(n173) );
  OAI31X1TS U301 ( .A0(n174), .A1(n229), .A2(n232), .B0(n173), .Y(n181) );
  INVX2TS U302 ( .A(intDX[4]), .Y(n292) );
  NAND2X1TS U303 ( .A(intDY[5]), .B(n266), .Y(n176) );
  AOI32X1TS U304 ( .A0(n178), .A1(n177), .A2(n176), .B0(n175), .B1(n177), .Y(
        n179) );
  AOI222XLTS U305 ( .A0(intDY[7]), .A1(n264), .B0(intDY[7]), .B1(n179), .C0(
        n264), .C1(n179), .Y(n180) );
  AOI21X1TS U306 ( .A0(n238), .A1(n181), .B0(n180), .Y(n206) );
  INVX2TS U307 ( .A(intDX[8]), .Y(n288) );
  INVX2TS U308 ( .A(intDX[15]), .Y(n302) );
  INVX2TS U309 ( .A(intDX[11]), .Y(n308) );
  INVX2TS U310 ( .A(intDY[15]), .Y(n303) );
  AOI222XLTS U311 ( .A0(intDY[15]), .A1(n302), .B0(intDY[11]), .B1(n308), .C0(
        n303), .C1(intDX[15]), .Y(n186) );
  INVX2TS U312 ( .A(intDY[10]), .Y(n287) );
  NOR2XLTS U313 ( .A(intDX[10]), .B(n287), .Y(n194) );
  INVX2TS U314 ( .A(intDY[8]), .Y(n289) );
  NAND2X1TS U315 ( .A(intDX[10]), .B(n287), .Y(n187) );
  INVX2TS U316 ( .A(intDX[9]), .Y(n254) );
  NAND2X1TS U317 ( .A(intDY[9]), .B(n254), .Y(n190) );
  OAI211XLTS U318 ( .A0(intDX[8]), .A1(n289), .B0(n187), .C0(n190), .Y(n184)
         );
  NOR2XLTS U319 ( .A(n254), .B(intDY[9]), .Y(n188) );
  INVX2TS U320 ( .A(intDX[12]), .Y(n284) );
  NOR2XLTS U321 ( .A(n284), .B(intDY[12]), .Y(n199) );
  NAND2X1TS U322 ( .A(intDY[12]), .B(n284), .Y(n196) );
  INVX2TS U323 ( .A(intDY[14]), .Y(n283) );
  NAND2X1TS U324 ( .A(intDX[14]), .B(n283), .Y(n203) );
  NAND4BBX1TS U325 ( .AN(n188), .BN(n199), .C(n196), .D(n203), .Y(n183) );
  INVX2TS U326 ( .A(intDY[13]), .Y(n306) );
  NAND2X1TS U327 ( .A(intDX[13]), .B(n306), .Y(n202) );
  INVX2TS U328 ( .A(intDX[13]), .Y(n304) );
  NAND2X1TS U329 ( .A(intDY[13]), .B(n304), .Y(n197) );
  INVX2TS U330 ( .A(intDY[11]), .Y(n310) );
  NAND2X1TS U331 ( .A(intDX[11]), .B(n310), .Y(n192) );
  NAND4BXLTS U332 ( .AN(n200), .B(n202), .C(n197), .D(n192), .Y(n182) );
  NOR4XLTS U333 ( .A(n194), .B(n184), .C(n183), .D(n182), .Y(n185) );
  NOR2XLTS U334 ( .A(intDX[11]), .B(n310), .Y(n195) );
  INVX2TS U335 ( .A(n187), .Y(n189) );
  OAI31X1TS U336 ( .A0(n195), .A1(n194), .A2(n193), .B0(n192), .Y(n198) );
  AOI222XLTS U337 ( .A0(intDX[15]), .A1(n204), .B0(intDX[15]), .B1(n303), .C0(
        n204), .C1(n303), .Y(n205) );
  INVX2TS U338 ( .A(intDY[16]), .Y(n248) );
  NAND2X1TS U339 ( .A(intDX[16]), .B(n248), .Y(n223) );
  OAI211XLTS U340 ( .A0(n206), .A1(n231), .B0(n205), .C0(n223), .Y(n207) );
  NOR2XLTS U341 ( .A(intDY[17]), .B(n280), .Y(n222) );
  INVX2TS U342 ( .A(intDX[18]), .Y(n279) );
  NOR2XLTS U343 ( .A(intDY[18]), .B(n279), .Y(n226) );
  AOI211XLTS U344 ( .A0(n225), .A1(n207), .B0(n222), .C0(n226), .Y(n208) );
  INVX2TS U345 ( .A(intDY[19]), .Y(n246) );
  INVX2TS U346 ( .A(intDY[18]), .Y(n278) );
  OAI22X1TS U347 ( .A0(intDX[19]), .A1(n246), .B0(intDX[18]), .B1(n278), .Y(
        n221) );
  INVX2TS U348 ( .A(intDX[19]), .Y(n245) );
  OAI22X1TS U349 ( .A0(n208), .A1(n221), .B0(intDY[19]), .B1(n245), .Y(n215)
         );
  INVX2TS U350 ( .A(intDX[20]), .Y(n275) );
  NAND2X1TS U351 ( .A(intDY[21]), .B(n273), .Y(n210) );
  AOI32X1TS U352 ( .A0(n212), .A1(n211), .A2(n210), .B0(n209), .B1(n211), .Y(
        n213) );
  AOI222XLTS U353 ( .A0(intDY[23]), .A1(n269), .B0(intDY[23]), .B1(n213), .C0(
        n269), .C1(n213), .Y(n214) );
  AOI32X1TS U354 ( .A0(n237), .A1(n236), .A2(n215), .B0(n214), .B1(n236), .Y(
        n216) );
  NAND2X1TS U355 ( .A(n220), .B(load_b_i), .Y(n311) );
  CLKBUFX2TS U356 ( .A(n311), .Y(n307) );
  NOR2BX1TS U357 ( .AN(load_b_i), .B(n220), .Y(n241) );
  INVX2TS U358 ( .A(n241), .Y(n305) );
  CLKBUFX2TS U359 ( .A(n305), .Y(n309) );
  OAI222X1TS U360 ( .A0(n307), .A1(n296), .B0(load_b_i), .B1(\MRegister/n3 ), 
        .C0(n309), .C1(n297), .Y(\MRegister/n34 ) );
  CLKBUFX2TS U361 ( .A(n311), .Y(n277) );
  INVX2TS U362 ( .A(intDX[14]), .Y(n282) );
  OAI222X1TS U363 ( .A0(n277), .A1(n282), .B0(load_b_i), .B1(\MRegister/n15 ), 
        .C0(n309), .C1(n283), .Y(\MRegister/n46 ) );
  INVX2TS U364 ( .A(intDY[1]), .Y(n299) );
  OAI222X1TS U365 ( .A0(n307), .A1(n298), .B0(load_b_i), .B1(\MRegister/n2 ), 
        .C0(n309), .C1(n299), .Y(\MRegister/n33 ) );
  OAI222X1TS U366 ( .A0(n307), .A1(n292), .B0(load_b_i), .B1(\MRegister/n5 ), 
        .C0(n309), .C1(n293), .Y(\MRegister/n36 ) );
  INVX2TS U367 ( .A(intDY[6]), .Y(n291) );
  OAI222X1TS U368 ( .A0(n307), .A1(n290), .B0(load_b_i), .B1(\MRegister/n7 ), 
        .C0(n309), .C1(n291), .Y(\MRegister/n38 ) );
  OAI222X1TS U369 ( .A0(n277), .A1(n247), .B0(load_b_i), .B1(\MRegister/n17 ), 
        .C0(n309), .C1(n248), .Y(\MRegister/n48 ) );
  OAI211XLTS U370 ( .A0(n251), .A1(n220), .B0(load_b_i), .C0(intDX[31]), .Y(
        n240) );
  INVX2TS U371 ( .A(intDX[0]), .Y(n300) );
  OAI22X1TS U372 ( .A0(intDY[0]), .A1(n300), .B0(intDY[19]), .B1(n245), .Y(
        n228) );
  AOI211XLTS U373 ( .A0(intDY[0]), .A1(n300), .B0(n222), .C0(n221), .Y(n224)
         );
  NAND4BXLTS U374 ( .AN(n226), .B(n225), .C(n224), .D(n223), .Y(n227) );
  NAND4XLTS U375 ( .A(n238), .B(n237), .C(n236), .D(n235), .Y(n252) );
  NAND3XLTS U376 ( .A(n251), .B(n241), .C(n252), .Y(n239) );
  OAI211XLTS U377 ( .A0(load_b_i), .A1(\SignRegister/n5 ), .B0(n240), .C0(n239), .Y(\SignRegister/n4 ) );
  INVX2TS U378 ( .A(intDY[12]), .Y(n285) );
  OAI222X1TS U379 ( .A0(n277), .A1(n284), .B0(load_b_i), .B1(\MRegister/n13 ), 
        .C0(n309), .C1(n285), .Y(\MRegister/n44 ) );
  AOI2BB2XLTS U380 ( .B0(intDY[18]), .B1(n241), .A0N(n279), .A1N(n311), .Y(
        n242) );
  OAI222X1TS U381 ( .A0(n277), .A1(n245), .B0(load_b_i), .B1(\MRegister/n20 ), 
        .C0(n309), .C1(n246), .Y(\MRegister/n51 ) );
  OAI222X1TS U382 ( .A0(n277), .A1(n243), .B0(load_b_i), .B1(\MRegister/n27 ), 
        .C0(n309), .C1(n244), .Y(\MRegister/n58 ) );
  INVX2TS U383 ( .A(intDX[30]), .Y(n249) );
  OAI222X1TS U384 ( .A0(n277), .A1(n249), .B0(load_b_i), .B1(\MRegister/n31 ), 
        .C0(n309), .C1(n250), .Y(\MRegister/n63 ) );
  OAI222X1TS U385 ( .A0(n307), .A1(n261), .B0(load_b_i), .B1(\mRegister/n110 ), 
        .C0(n309), .C1(n262), .Y(\mRegister/n79 ) );
  OAI222X1TS U386 ( .A0(n307), .A1(n244), .B0(load_b_i), .B1(\mRegister/n109 ), 
        .C0(n309), .C1(n243), .Y(\mRegister/n78 ) );
  OAI222X1TS U387 ( .A0(n307), .A1(n259), .B0(load_b_i), .B1(\mRegister/n108 ), 
        .C0(n309), .C1(n260), .Y(\mRegister/n77 ) );
  INVX2TS U388 ( .A(intDY[28]), .Y(n257) );
  OAI222X1TS U389 ( .A0(n307), .A1(n257), .B0(load_b_i), .B1(\mRegister/n107 ), 
        .C0(n309), .C1(n258), .Y(\mRegister/n76 ) );
  OAI222X1TS U390 ( .A0(n307), .A1(n255), .B0(load_b_i), .B1(\mRegister/n106 ), 
        .C0(n309), .C1(n256), .Y(\mRegister/n75 ) );
  INVX2TS U391 ( .A(intDY[5]), .Y(n265) );
  OAI222X1TS U392 ( .A0(n307), .A1(n265), .B0(load_b_i), .B1(\mRegister/n130 ), 
        .C0(n309), .C1(n266), .Y(\mRegister/n99 ) );
  OAI222X1TS U393 ( .A0(n307), .A1(n263), .B0(load_b_i), .B1(\mRegister/n128 ), 
        .C0(n309), .C1(n264), .Y(\mRegister/n97 ) );
  INVX2TS U394 ( .A(intDY[9]), .Y(n253) );
  OAI222X1TS U395 ( .A0(n307), .A1(n253), .B0(load_b_i), .B1(\mRegister/n126 ), 
        .C0(n309), .C1(n254), .Y(\mRegister/n95 ) );
  OAI222X1TS U396 ( .A0(n307), .A1(n246), .B0(load_b_i), .B1(\mRegister/n116 ), 
        .C0(n309), .C1(n245), .Y(\mRegister/n85 ) );
  OAI222X1TS U397 ( .A0(n307), .A1(n248), .B0(load_b_i), .B1(\mRegister/n119 ), 
        .C0(n309), .C1(n247), .Y(\mRegister/n88 ) );
  OAI222X1TS U398 ( .A0(n307), .A1(n250), .B0(load_b_i), .B1(\mRegister/n105 ), 
        .C0(n309), .C1(n249), .Y(\mRegister/n74 ) );
  NOR2BX1TS U399 ( .AN(real_op_o), .B(n252), .Y(zero_flag_o) );
  OAI222X1TS U400 ( .A0(n277), .A1(n254), .B0(load_b_i), .B1(\MRegister/n10 ), 
        .C0(n305), .C1(n253), .Y(\MRegister/n41 ) );
  OAI222X1TS U401 ( .A0(n277), .A1(n288), .B0(load_b_i), .B1(\MRegister/n9 ), 
        .C0(n305), .C1(n289), .Y(\MRegister/n40 ) );
  OAI222X1TS U402 ( .A0(n311), .A1(n300), .B0(load_b_i), .B1(\MRegister/n1 ), 
        .C0(n305), .C1(n301), .Y(\MRegister/n32 ) );
  OAI222X1TS U403 ( .A0(n311), .A1(n256), .B0(load_b_i), .B1(\MRegister/n30 ), 
        .C0(n305), .C1(n255), .Y(\MRegister/n61 ) );
  OAI222X1TS U404 ( .A0(n277), .A1(n258), .B0(load_b_i), .B1(\MRegister/n29 ), 
        .C0(n305), .C1(n257), .Y(\MRegister/n60 ) );
  OAI222X1TS U405 ( .A0(n311), .A1(n260), .B0(load_b_i), .B1(\MRegister/n28 ), 
        .C0(n305), .C1(n259), .Y(\MRegister/n59 ) );
  OAI222X1TS U406 ( .A0(n311), .A1(n262), .B0(load_b_i), .B1(\MRegister/n26 ), 
        .C0(n305), .C1(n261), .Y(\MRegister/n57 ) );
  INVX2TS U407 ( .A(intDX[24]), .Y(n267) );
  OAI222X1TS U408 ( .A0(n277), .A1(n267), .B0(load_b_i), .B1(\MRegister/n25 ), 
        .C0(n305), .C1(n268), .Y(\MRegister/n56 ) );
  OAI222X1TS U409 ( .A0(n311), .A1(n269), .B0(load_b_i), .B1(\MRegister/n24 ), 
        .C0(n305), .C1(n270), .Y(\MRegister/n55 ) );
  INVX2TS U410 ( .A(intDY[22]), .Y(n272) );
  OAI222X1TS U411 ( .A0(n277), .A1(n271), .B0(load_b_i), .B1(\MRegister/n23 ), 
        .C0(n305), .C1(n272), .Y(\MRegister/n54 ) );
  INVX2TS U412 ( .A(intDY[21]), .Y(n274) );
  OAI222X1TS U413 ( .A0(n277), .A1(n273), .B0(load_b_i), .B1(\MRegister/n22 ), 
        .C0(n305), .C1(n274), .Y(\MRegister/n53 ) );
  OAI222X1TS U414 ( .A0(n277), .A1(n275), .B0(load_b_i), .B1(\MRegister/n21 ), 
        .C0(n305), .C1(n276), .Y(\MRegister/n52 ) );
  INVX2TS U415 ( .A(intDY[17]), .Y(n281) );
  OAI222X1TS U416 ( .A0(n277), .A1(n280), .B0(load_b_i), .B1(\MRegister/n18 ), 
        .C0(n305), .C1(n281), .Y(\MRegister/n49 ) );
  OAI222X1TS U417 ( .A0(n277), .A1(n302), .B0(load_b_i), .B1(\MRegister/n16 ), 
        .C0(n305), .C1(n303), .Y(\MRegister/n47 ) );
  OAI222X1TS U418 ( .A0(n277), .A1(n304), .B0(load_b_i), .B1(\MRegister/n14 ), 
        .C0(n305), .C1(n306), .Y(\MRegister/n45 ) );
  OAI222X1TS U419 ( .A0(n277), .A1(n308), .B0(load_b_i), .B1(\MRegister/n12 ), 
        .C0(n305), .C1(n310), .Y(\MRegister/n43 ) );
  INVX2TS U420 ( .A(intDX[10]), .Y(n286) );
  OAI222X1TS U421 ( .A0(n277), .A1(n286), .B0(load_b_i), .B1(\MRegister/n11 ), 
        .C0(n305), .C1(n287), .Y(\MRegister/n42 ) );
  OAI222X1TS U422 ( .A0(n277), .A1(n264), .B0(load_b_i), .B1(\MRegister/n8 ), 
        .C0(n305), .C1(n263), .Y(\MRegister/n39 ) );
  OAI222X1TS U423 ( .A0(n311), .A1(n266), .B0(load_b_i), .B1(\MRegister/n6 ), 
        .C0(n309), .C1(n265), .Y(\MRegister/n37 ) );
  OAI222X1TS U424 ( .A0(n311), .A1(n294), .B0(load_b_i), .B1(\MRegister/n4 ), 
        .C0(n309), .C1(n295), .Y(\MRegister/n35 ) );
  OAI222X1TS U425 ( .A0(n311), .A1(n268), .B0(load_b_i), .B1(\mRegister/n111 ), 
        .C0(n309), .C1(n267), .Y(\mRegister/n80 ) );
  OAI222X1TS U426 ( .A0(n307), .A1(n270), .B0(load_b_i), .B1(\mRegister/n112 ), 
        .C0(n305), .C1(n269), .Y(\mRegister/n81 ) );
  OAI222X1TS U427 ( .A0(n311), .A1(n272), .B0(load_b_i), .B1(\mRegister/n113 ), 
        .C0(n309), .C1(n271), .Y(\mRegister/n82 ) );
  OAI222X1TS U428 ( .A0(n307), .A1(n274), .B0(load_b_i), .B1(\mRegister/n114 ), 
        .C0(n305), .C1(n273), .Y(\mRegister/n83 ) );
  OAI222X1TS U429 ( .A0(n311), .A1(n276), .B0(load_b_i), .B1(\mRegister/n115 ), 
        .C0(n309), .C1(n275), .Y(\mRegister/n84 ) );
  OAI222X1TS U430 ( .A0(n279), .A1(n305), .B0(load_b_i), .B1(\mRegister/n117 ), 
        .C0(n278), .C1(n277), .Y(\mRegister/n86 ) );
  OAI222X1TS U431 ( .A0(n307), .A1(n281), .B0(load_b_i), .B1(\mRegister/n118 ), 
        .C0(n305), .C1(n280), .Y(\mRegister/n87 ) );
  OAI222X1TS U432 ( .A0(n311), .A1(n283), .B0(load_b_i), .B1(\mRegister/n121 ), 
        .C0(n309), .C1(n282), .Y(\mRegister/n90 ) );
  OAI222X1TS U433 ( .A0(n311), .A1(n285), .B0(load_b_i), .B1(\mRegister/n123 ), 
        .C0(n305), .C1(n284), .Y(\mRegister/n92 ) );
  OAI222X1TS U434 ( .A0(n311), .A1(n287), .B0(load_b_i), .B1(\mRegister/n125 ), 
        .C0(n305), .C1(n286), .Y(\mRegister/n94 ) );
  OAI222X1TS U435 ( .A0(n307), .A1(n289), .B0(load_b_i), .B1(\mRegister/n127 ), 
        .C0(n305), .C1(n288), .Y(\mRegister/n96 ) );
  OAI222X1TS U436 ( .A0(n307), .A1(n291), .B0(load_b_i), .B1(\mRegister/n129 ), 
        .C0(n305), .C1(n290), .Y(\mRegister/n98 ) );
  OAI222X1TS U437 ( .A0(n307), .A1(n293), .B0(load_b_i), .B1(\mRegister/n131 ), 
        .C0(n305), .C1(n292), .Y(\mRegister/n100 ) );
  OAI222X1TS U438 ( .A0(n311), .A1(n295), .B0(load_b_i), .B1(\mRegister/n132 ), 
        .C0(n309), .C1(n294), .Y(\mRegister/n101 ) );
  OAI222X1TS U439 ( .A0(n307), .A1(n297), .B0(load_b_i), .B1(\mRegister/n133 ), 
        .C0(n305), .C1(n296), .Y(\mRegister/n102 ) );
  OAI222X1TS U440 ( .A0(n311), .A1(n299), .B0(load_b_i), .B1(\mRegister/n134 ), 
        .C0(n305), .C1(n298), .Y(\mRegister/n103 ) );
  OAI222X1TS U441 ( .A0(n307), .A1(n301), .B0(load_b_i), .B1(\mRegister/n135 ), 
        .C0(n305), .C1(n300), .Y(\mRegister/n104 ) );
  OAI222X1TS U442 ( .A0(n311), .A1(n303), .B0(load_b_i), .B1(\mRegister/n120 ), 
        .C0(n309), .C1(n302), .Y(\mRegister/n89 ) );
  OAI222X1TS U443 ( .A0(n307), .A1(n306), .B0(load_b_i), .B1(\mRegister/n122 ), 
        .C0(n305), .C1(n304), .Y(\mRegister/n91 ) );
  OAI222X1TS U444 ( .A0(n311), .A1(n310), .B0(load_b_i), .B1(\mRegister/n124 ), 
        .C0(n309), .C1(n308), .Y(\mRegister/n93 ) );
endmodule

